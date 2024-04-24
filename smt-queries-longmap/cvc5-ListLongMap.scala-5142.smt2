; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69942 () Bool)

(assert start!69942)

(declare-datatypes ((array!44175 0))(
  ( (array!44176 (arr!21150 (Array (_ BitVec 32) (_ BitVec 64))) (size!21570 (_ BitVec 32))) )
))
(declare-fun a2!179 () array!44175)

(declare-fun to!101 () (_ BitVec 32))

(declare-fun from!2863 () (_ BitVec 32))

(declare-fun a1!214 () array!44175)

(assert (=> start!69942 (and (= (size!21570 a1!214) (size!21570 a2!179)) (bvsge from!2863 #b00000000000000000000000000000000) (bvsle from!2863 to!101) (bvsle to!101 (size!21570 a1!214)) (bvslt (size!21570 a1!214) #b01111111111111111111111111111111) (bvslt from!2863 to!101) (bvsge from!2863 (size!21570 a2!179)))))

(declare-fun array_inv!17009 (array!44175) Bool)

(assert (=> start!69942 (array_inv!17009 a1!214)))

(assert (=> start!69942 (array_inv!17009 a2!179)))

(assert (=> start!69942 true))

(declare-fun bs!22547 () Bool)

(assert (= bs!22547 start!69942))

(declare-fun m!755747 () Bool)

(assert (=> bs!22547 m!755747))

(declare-fun m!755749 () Bool)

(assert (=> bs!22547 m!755749))

(push 1)

(assert (not start!69942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)
