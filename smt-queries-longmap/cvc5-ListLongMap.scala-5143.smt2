; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69778 () Bool)

(assert start!69778)

(declare-datatypes ((array!44178 0))(
  ( (array!44179 (arr!21156 (Array (_ BitVec 32) (_ BitVec 64))) (size!21577 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44178)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44178)

(assert (=> start!69778 (and (= (size!21577 a1!214) (size!21577 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21577 a1!214)) (bvslt (size!21577 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21156 a1!214) from!2863) (select (arr!21156 a2!179) from!2863)) (bvsge (bvsub to!101 from!2863) (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863)))))

(declare-fun array_inv!16952 (array!44178) Bool)

(assert (=> start!69778 (array_inv!16952 a1!214)))

(assert (=> start!69778 (array_inv!16952 a2!179)))

(assert (=> start!69778 true))

(declare-fun bs!22537 () Bool)

(assert (= bs!22537 start!69778))

(declare-fun m!754469 () Bool)

(assert (=> bs!22537 m!754469))

(declare-fun m!754471 () Bool)

(assert (=> bs!22537 m!754471))

(declare-fun m!754473 () Bool)

(assert (=> bs!22537 m!754473))

(declare-fun m!754475 () Bool)

(assert (=> bs!22537 m!754475))

(push 1)

(assert (not start!69778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

