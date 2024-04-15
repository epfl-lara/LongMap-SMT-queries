; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117314 () Bool)

(assert start!117314)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93864 0))(
  ( (array!93865 (arr!45331 (Array (_ BitVec 32) (_ BitVec 64))) (size!45883 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93864)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117314 (and (bvslt (size!45883 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45883 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvslt pivot!64 #b00000000000000000000000000000000))))

(declare-fun array_inv!34564 (array!93864) Bool)

(assert (=> start!117314 (array_inv!34564 a!4010)))

(assert (=> start!117314 true))

(declare-fun bs!39748 () Bool)

(assert (= bs!39748 start!117314))

(declare-fun m!1264455 () Bool)

(assert (=> bs!39748 m!1264455))

(check-sat (not start!117314))
(check-sat)
