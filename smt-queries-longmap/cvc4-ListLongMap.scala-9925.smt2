; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117322 () Bool)

(assert start!117322)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93918 0))(
  ( (array!93919 (arr!45358 (Array (_ BitVec 32) (_ BitVec 64))) (size!45908 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93918)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117322 (and (bvslt (size!45908 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45908 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvslt pivot!64 #b00000000000000000000000000000000))))

(declare-fun array_inv!34386 (array!93918) Bool)

(assert (=> start!117322 (array_inv!34386 a!4010)))

(assert (=> start!117322 true))

(declare-fun bs!39778 () Bool)

(assert (= bs!39778 start!117322))

(declare-fun m!1264963 () Bool)

(assert (=> bs!39778 m!1264963))

(push 1)

(assert (not start!117322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

