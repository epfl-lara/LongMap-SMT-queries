; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117002 () Bool)

(assert start!117002)

(declare-datatypes ((array!93644 0))(
  ( (array!93645 (arr!45224 (Array (_ BitVec 32) (_ BitVec 64))) (size!45774 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93644)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!117002 (and (bvslt (size!45774 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45774 a!4197)) (bvslt to!360 #b00000000000000000000000000000000))))

(declare-fun array_inv!34252 (array!93644) Bool)

(assert (=> start!117002 (array_inv!34252 a!4197)))

(assert (=> start!117002 true))

(declare-fun bs!39627 () Bool)

(assert (= bs!39627 start!117002))

(declare-fun m!1262357 () Bool)

(assert (=> bs!39627 m!1262357))

(push 1)

(assert (not start!117002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

