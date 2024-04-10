; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69770 () Bool)

(assert start!69770)

(declare-datatypes ((array!44170 0))(
  ( (array!44171 (arr!21152 (Array (_ BitVec 32) (_ BitVec 64))) (size!21573 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44170)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44170)

(assert (=> start!69770 (and (= (size!21573 a1!214) (size!21573 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21573 a1!214)) (bvslt (size!21573 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21573 a1!214)))))

(declare-fun array_inv!16948 (array!44170) Bool)

(assert (=> start!69770 (array_inv!16948 a1!214)))

(assert (=> start!69770 (array_inv!16948 a2!179)))

(assert (=> start!69770 true))

(declare-fun bs!22527 () Bool)

(assert (= bs!22527 start!69770))

(declare-fun m!754453 () Bool)

(assert (=> bs!22527 m!754453))

(declare-fun m!754455 () Bool)

(assert (=> bs!22527 m!754455))

(push 1)

(assert (not start!69770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

