; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69772 () Bool)

(assert start!69772)

(declare-datatypes ((array!44172 0))(
  ( (array!44173 (arr!21153 (Array (_ BitVec 32) (_ BitVec 64))) (size!21574 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44172)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44172)

(assert (=> start!69772 (and (= (size!21574 a1!214) (size!21574 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21574 a1!214)) (bvslt (size!21574 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21574 a2!179)))))

(declare-fun array_inv!16949 (array!44172) Bool)

(assert (=> start!69772 (array_inv!16949 a1!214)))

(assert (=> start!69772 (array_inv!16949 a2!179)))

(assert (=> start!69772 true))

(declare-fun bs!22531 () Bool)

(assert (= bs!22531 start!69772))

(declare-fun m!754457 () Bool)

(assert (=> bs!22531 m!754457))

(declare-fun m!754459 () Bool)

(assert (=> bs!22531 m!754459))

(push 1)

(assert (not start!69772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

