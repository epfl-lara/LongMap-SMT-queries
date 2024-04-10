; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117006 () Bool)

(assert start!117006)

(declare-datatypes ((array!93648 0))(
  ( (array!93649 (arr!45226 (Array (_ BitVec 32) (_ BitVec 64))) (size!45776 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93648)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!117006 (and (bvslt (size!45776 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45776 a!4197)) (bvslt to!360 #b00000000000000000000000000000000))))

(declare-fun array_inv!34254 (array!93648) Bool)

(assert (=> start!117006 (array_inv!34254 a!4197)))

(assert (=> start!117006 true))

(declare-fun bs!39629 () Bool)

(assert (= bs!39629 start!117006))

(declare-fun m!1262361 () Bool)

(assert (=> bs!39629 m!1262361))

(push 1)

(assert (not start!117006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

