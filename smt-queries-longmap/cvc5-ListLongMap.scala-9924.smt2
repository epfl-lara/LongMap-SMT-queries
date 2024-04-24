; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117548 () Bool)

(assert start!117548)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94028 0))(
  ( (array!94029 (arr!45408 (Array (_ BitVec 32) (_ BitVec 64))) (size!45959 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94028)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117548 (and (bvslt (size!45959 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45959 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvsgt pivot!64 (size!45959 a!4010)))))

(declare-fun array_inv!34689 (array!94028) Bool)

(assert (=> start!117548 (array_inv!34689 a!4010)))

(assert (=> start!117548 true))

(declare-fun bs!39789 () Bool)

(assert (= bs!39789 start!117548))

(declare-fun m!1266593 () Bool)

(assert (=> bs!39789 m!1266593))

(push 1)

(assert (not start!117548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

