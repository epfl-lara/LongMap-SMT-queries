; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69764 () Bool)

(assert start!69764)

(declare-datatypes ((array!44164 0))(
  ( (array!44165 (arr!21149 (Array (_ BitVec 32) (_ BitVec 64))) (size!21570 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44164)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44164)

(assert (=> start!69764 (and (= (size!21570 a1!214) (size!21570 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21570 a1!214)) (bvslt (size!21570 a1!214) #b01111111111111111111111111111111) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 to!101) from!2863) #b00000000000000000000000000000000))))

(declare-fun array_inv!16945 (array!44164) Bool)

(assert (=> start!69764 (array_inv!16945 a1!214)))

(assert (=> start!69764 (array_inv!16945 a2!179)))

(assert (=> start!69764 true))

(declare-fun bs!22521 () Bool)

(assert (= bs!22521 start!69764))

(declare-fun m!754441 () Bool)

(assert (=> bs!22521 m!754441))

(declare-fun m!754443 () Bool)

(assert (=> bs!22521 m!754443))

(push 1)

(assert (not start!69764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

