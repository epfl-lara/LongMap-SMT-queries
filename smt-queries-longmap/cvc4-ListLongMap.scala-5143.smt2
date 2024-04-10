; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69782 () Bool)

(assert start!69782)

(declare-datatypes ((array!44182 0))(
  ( (array!44183 (arr!21158 (Array (_ BitVec 32) (_ BitVec 64))) (size!21579 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44182)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44182)

(assert (=> start!69782 (and (= (size!21579 a1!214) (size!21579 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21579 a1!214)) (bvslt (size!21579 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (= (select (arr!21158 a1!214) from!2863) (select (arr!21158 a2!179) from!2863)) (bvsge (bvsub to!101 from!2863) (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863)))))

(declare-fun array_inv!16954 (array!44182) Bool)

(assert (=> start!69782 (array_inv!16954 a1!214)))

(assert (=> start!69782 (array_inv!16954 a2!179)))

(assert (=> start!69782 true))

(declare-fun bs!22539 () Bool)

(assert (= bs!22539 start!69782))

(declare-fun m!754485 () Bool)

(assert (=> bs!22539 m!754485))

(declare-fun m!754487 () Bool)

(assert (=> bs!22539 m!754487))

(declare-fun m!754489 () Bool)

(assert (=> bs!22539 m!754489))

(declare-fun m!754491 () Bool)

(assert (=> bs!22539 m!754491))

(push 1)

(assert (not start!69782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

