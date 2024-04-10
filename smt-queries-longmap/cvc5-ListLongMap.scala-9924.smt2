; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117312 () Bool)

(assert start!117312)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93908 0))(
  ( (array!93909 (arr!45353 (Array (_ BitVec 32) (_ BitVec 64))) (size!45903 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93908)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117312 (and (bvslt (size!45903 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45903 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvsgt pivot!64 (size!45903 a!4010)))))

(declare-fun array_inv!34381 (array!93908) Bool)

(assert (=> start!117312 (array_inv!34381 a!4010)))

(assert (=> start!117312 true))

(declare-fun bs!39770 () Bool)

(assert (= bs!39770 start!117312))

(declare-fun m!1264953 () Bool)

(assert (=> bs!39770 m!1264953))

(push 1)

(assert (not start!117312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

