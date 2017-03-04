pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

p0 = {x=0, y=127}
p1 = {x=63, y=0}
p2 = {x=127, y=127}
t = 0.000

function _init()
 cls()
end

function _update()
 update_t()
end

function update_t()
 if (t >= 1) then
  t = 0.000
  cls()
 else
  t += 0.005
 end
end

function _draw()
 line(p0.x, p0.y, p1.x, p1.y, 1)
 line(p1.x, p1.y, p2.x, p2.y, 1)
 draw_bezier()
end

function draw_bezier()
 px = p0.x * (1-t) * (1-t)
 px += 2 * p1.x * t * (1-t)
 px += p2.x * t * t

 py = p0.y * (1-t) * (1-t)
 py += 2 * p1.y * t * (1-t)
 py += p2.y * t * t

 pset(px, py,4)
end

function d(v)
 printh(v, "debug.log")
end
