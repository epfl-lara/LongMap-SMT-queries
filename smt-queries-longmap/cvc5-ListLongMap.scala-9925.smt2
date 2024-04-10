; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117318 () Bool)

(assert start!117318)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93914 0))(
  ( (array!93915 (arr!45356 (Array (_ BitVec 32) (_ BitVec 64))) (size!45906 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93914)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117318 (and (bvslt (size!45906 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45906 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvslt pivot!64 #b00000000000000000000000000000000))))

(declare-fun array_inv!34384 (array!93914) Bool)

(assert (=> start!117318 (array_inv!34384 a!4010)))

(assert (=> start!117318 true))

(declare-fun bs!39776 () Bool)

(assert (= bs!39776 start!117318))

(declare-fun m!1264959 () Bool)

(assert (=> bs!39776 m!1264959))

(push 1)

(assert (not start!117318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

