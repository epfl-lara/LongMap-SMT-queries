; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117312 () Bool)

(assert start!117312)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93862 0))(
  ( (array!93863 (arr!45330 (Array (_ BitVec 32) (_ BitVec 64))) (size!45882 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93862)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117312 (and (bvslt (size!45882 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45882 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvsgt pivot!64 (size!45882 a!4010)))))

(declare-fun array_inv!34563 (array!93862) Bool)

(assert (=> start!117312 (array_inv!34563 a!4010)))

(assert (=> start!117312 true))

(declare-fun bs!39744 () Bool)

(assert (= bs!39744 start!117312))

(declare-fun m!1264453 () Bool)

(assert (=> bs!39744 m!1264453))

(push 1)

(assert (not start!117312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

