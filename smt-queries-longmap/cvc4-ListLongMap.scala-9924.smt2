; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117316 () Bool)

(assert start!117316)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93912 0))(
  ( (array!93913 (arr!45355 (Array (_ BitVec 32) (_ BitVec 64))) (size!45905 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93912)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117316 (and (bvslt (size!45905 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45905 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvsgt pivot!64 (size!45905 a!4010)))))

(declare-fun array_inv!34383 (array!93912) Bool)

(assert (=> start!117316 (array_inv!34383 a!4010)))

(assert (=> start!117316 true))

(declare-fun bs!39772 () Bool)

(assert (= bs!39772 start!117316))

(declare-fun m!1264957 () Bool)

(assert (=> bs!39772 m!1264957))

(push 1)

(assert (not start!117316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

