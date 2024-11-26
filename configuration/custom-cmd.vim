command! Bufclr call CloseOtherBuffers()

function! CloseOtherBuffers()
  let current = bufnr('%')
  for buf in range(1, bufnr('$'))
    if buf != current && bufexists(buf) && buflisted(buf)
      if getbufvar(buf, '&modified')
        " Skip unsaved buffers with changes
        continue
      endif
      execute 'bdelete' buf
    endif
  endfor
endfunction

