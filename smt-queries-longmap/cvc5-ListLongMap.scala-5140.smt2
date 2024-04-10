; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69760 () Bool)

(assert start!69760)

(declare-datatypes ((array!44160 0))(
  ( (array!44161 (arr!21147 (Array (_ BitVec 32) (_ BitVec 64))) (size!21568 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44160)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44160)

(assert (=> start!69760 (and (= (size!21568 a1!214) (size!21568 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21568 a1!214)) (bvslt (size!21568 a1!214) #b01111111111111111111111111111111) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!16943 (array!44160) Bool)

(assert (=> start!69760 (array_inv!16943 a1!214)))

(assert (=> start!69760 (array_inv!16943 a2!179)))

(assert (=> start!69760 true))

(declare-fun bs!22519 () Bool)

(assert (= bs!22519 start!69760))

(declare-fun m!754433 () Bool)

(assert (=> bs!22519 m!754433))

(declare-fun m!754435 () Bool)

(assert (=> bs!22519 m!754435))

(push 1)

(assert (not start!69760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

