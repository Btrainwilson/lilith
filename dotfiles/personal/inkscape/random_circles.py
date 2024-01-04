import random
def draw_np(point, radius, color):
    grad = radial_gradient((point[0] - radius / 4, point[1] - radius / 4), radius*1.5)
    grad.add_stop(0, '#%02X%02X%02X' % (255, 255, 255))
    grad.add_stop(1, '#%02X%02X%02X' % (color[0], color[1], color[2]))
    circle(point, radius, fill=grad)

for i in range(10):
    # Generate random x, y, and radius values
    x, y, z= random.randint(0, 100), random.randint(0, 100), random.randint(0, 50)
    radius = random.randint(5, 7)
    color = randint(200, 255), randint(200, 220), z #, randint(0, 50)
    
    sat = randint(1,2)
    color = [int(c / sat) for c in color]
    draw_np([x, y], radius, color)
    draw_np([x, 120 + z], radius, color)


