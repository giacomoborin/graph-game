d = DiGraph(loops=True, multiedges=True, sparse=True)

q = next_prime(52)
F = Zmod(next_prime(50)); E=EllipticCurve(F, [0,1])
g = E.gen(0)

for p in [5,7,11,13]:
    powset = {g}
    oldh = g
    h = p*g
    d.add_edge((oldh, h, str(p)))

    while h not in powset:
        powset.add(h)
        oldh = h
        h = p*h
        d.add_edge((oldh, h, str(p)))

randpos = {v :(randint(0,300),randint(0,300)) for v in d.vertices()}

d.set_pos(randpos)

GP = d.graphplot(vertex_size=50,vertex_labels=False,color_by_label=True, edge_style='dashed')

GP.set_edges(edge_style='solid')
GP.plot()

