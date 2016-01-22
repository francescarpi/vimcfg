let s:save_cpo = &cpo
set cpo&vim

let s:TRUE = !0
let s:FALSE = 0

function! s:set(...) abort
  return call(s:set._new, a:000, s:set)
endfunction

function! s:frozenset(...) abort
  return call(s:frozenset._new, a:000, s:frozenset)
endfunction

function! s:_hash_func(x) abort
  return a:x
endfunction

let s:_base_set = {
\   '_is_set' : s:TRUE,
\   '_data' : {},
\   '_hash_func' : function('s:_hash_func')
\ }

function! s:_base_set._new(...) abort
  let obj = deepcopy(self)
  let xs = get(a:, 1, [])
  let obj._hash_func = get(a:, 2, obj._hash_func)
  call obj._set_data(xs)
  return obj
endfunction

"" Return the union of two sets as a new set.
" (I.e. all elements that are in either set.)
function! s:_base_set.union(t) abort
  let r = deepcopy(self)
  call r._update(a:t)
  return r
endfunction
let s:_base_set.or = s:_base_set.union

"" Return the intersection of two sets as a new set.
" (I.e. all elements that are in both sets.)
function! s:_base_set.intersection(t) abort
  let t = self._to_set(a:t)
  let [little, big] = self.len() <= t.len() ? [self, t] : [t, self]
  return self._new(filter(copy(big.to_list()), 'little.in(v:val)'))
endfunction
let s:_base_set.and = s:_base_set.intersection

"" Return the symmetric difference of two sets as a new set.
" (I.e. all elements that are in exactly one of the sets.)
function! s:_base_set.symmetric_difference(t) abort
  let t = self._to_set(a:t)
  return self._new(filter(copy(self.to_list()), '!t.in(v:val)')
  \              + filter(copy(t.to_list()), '!self.in(v:val)'))
endfunction
let s:_base_set.xor = s:_base_set.symmetric_difference

"" Return the difference of two sets as a new Set.
function! s:_base_set.difference(t) abort
  let t = self._to_set(a:t)
  return self._new(filter(copy(self.to_list()), '!t.in(v:val)'))
endfunction
let s:_base_set.sub = s:_base_set.difference

"" Report whether another set contains this set.
function! s:_base_set.issubset(t) abort
  let t = self._to_set(a:t)
  return self.len() > t.len() ? s:FALSE
  \   : empty(filter(copy(self.to_list()), '!t.in(v:val)'))
endfunction

"" Report whether this set contains another set.
function! s:_base_set.issuperset(t) abort
  let t = self._to_set(a:t)
  return self.len() < t.len() ? s:FALSE
  \   : empty(filter(copy(t.to_list()), '!self.in(v:val)'))
endfunction

" less than equal & greater than equal
let s:_base_set.le = s:_base_set.issubset
let s:_base_set.ge = s:_base_set.issuperset

" less than
function! s:_base_set.lt(t) abort
  let t = self._to_set(a:t)
  return self.len() < t.len() && self.issubset(t)
endfunction

" greater than
function! s:_base_set.gt(t) abort
  let t = self._to_set(a:t)
  return self.len() > t.len() && self.issuperset(t)
endfunction

function! s:_base_set.len() abort
  return len(self._data)
endfunction

function! s:_base_set.to_list() abort
  return values(self._data)
endfunction

function! s:_base_set._update(xs) abort
  for X in (s:_is_set(a:xs) ? a:xs.to_list() : a:xs)
    call self._add(X)
    unlet X
  endfor
endfunction

function! s:_base_set._add(x) abort
  let key = self._hash(a:x)
  if !has_key(self._data, key)
    let self._data[key] = a:x
  endif
endfunction

" Report whether an element is a member of a set.
function! s:_base_set.in(x) abort
  return has_key(self._data, self._hash(a:x))
endfunction

function! s:_base_set._to_set(x) abort
  return s:_is_set(a:x) ? a:x : self._new(a:x)
endfunction

function! s:_base_set._clear() abort
  let self._data = {}
endfunction

function! s:_base_set._set_data(xs) abort
  call self._clear()
  call self._update(a:xs)
endfunction

function! s:_base_set._hash(x) abort
  return string(self._hash_func(a:x))
endfunction

" frozenset: Immutable set class.

let s:frozenset = deepcopy(s:_base_set)

" Set: Mutable set class.

let s:set = deepcopy(s:_base_set)

" Update a set with the union of itself and another.
function! s:set.update(iterable) abort
  call self._update(a:iterable)
endfunction

" Update a set with the union of itself and another.
function! s:set.ior(t) abort
  call self.update(a:t)
  return self
endfunction

" Update a set with the intersection of itself and another.
function! s:set.intersection_update(t) abort
  let r = self.and(a:t).to_list()
  call self.clear()
  call self.update(r)
endfunction

" Update a set with the intersection of itself and another.
function! s:set.iand(t) abort
  call self.intersection_update(a:t)
  return self
endfunction

" Update a set with the symmetric difference of itself and another.
function! s:set.symmetric_difference_update(t) abort
  let t = self._to_set(a:t)
  if self is t
    call self.clear()
    return
  endif
  for X in t.to_list()
    if self.in(X)
      call self.remove(X)
    else
      call self._add(X)
    endif
    unlet X
  endfor
endfunction

" Update a set with the symmetric difference of itself and another.
function! s:set.ixor(t) abort
  call self.symmetric_difference_update(a:t)
  return self
endfunction

" Remove all elements of another set from this set.
function! s:set.difference_update(t) abort
  let t = self._to_set(a:t)
  if self is t
    call self.clear()
    return
  endif
  for X in filter(t.to_list(), 'self.in(v:val)')
    call self.remove(X)
    unlet X
  endfor
endfunction

" Remove all elements of another set from this set.
function! s:set.isub(t) abort
  call self.difference_update(a:t)
  return self
endfunction

" Remove all elements from this set.
function! s:set.clear() abort
  call self._clear()
endfunction

"" Add an element to a set.
" This has no effect if the element is already present.
function! s:set.add(x) abort
  return self._add(a:x)
endfunction

"" Remove an element from a set; it must be a member.
" If the element is not a member, throw Exception.
function! s:set.remove(e) abort
  try
    unlet self._data[self._hash(a:e)]
  catch /^Vim\%((\a\+)\)\?:E716/
    call s:_throw('the element is not a member')
  endtry
endfunction

"" Remove an element from a set if it is a member.
" If the element is not a member, do nothing.
function! s:set.discard(e) abort
  try
    call self.remove(a:e)
  catch /vital: Data.Set: the element is not a member/
    " Do nothing
  endtry
endfunction

" Remove and return an arbitrary set element.
function! s:set.pop() abort
  try
    let k = keys(self._data)[0]
  catch /^Vim\%((\a\+)\)\?:E684/
    call s:_throw('set is empty')
  endtry
  let v = self._data[k]
  unlet self._data[k]
  return v
endfunction

" Helper:

function! s:_is_set(x) abort
  return type(a:x) is type({}) && get(a:x, '_is_set', s:FALSE)
endfunction

function! s:_throw(message) abort
  throw 'vital: Data.Set: ' . a:message
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
