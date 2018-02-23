class BeerSong
  def verse(start = 99, end = 0)
    lyric = "#{pluralize(start, 'bottle').capitalize} of beer on the wall, #{pluralize(start, 'bottle')} of beer.\n" \
      "#{remain_part(start)}, #{pluralize(start - 1, 'bottle')} of beer on the wall.\n"
  end

  def pluralize(n, string)
    case n
    when 1 then "#{n} #{string}"
    when 0 then 'no more bottles'
    when -1 then "99 bottles"
    else "#{n} #{string}s"
    end
    # n == 1 ? "#{n} #{string}" : "#{n} #{string}s"
  end

  def remain_part(n)
    case n
    when 1 then "Take it down and pass it around"
    when 0 then "Go to the store and buy some more"
    else "Take one down and pass it around"
    end
  end
end