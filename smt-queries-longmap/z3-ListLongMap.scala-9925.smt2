; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117550 () Bool)

(assert start!117550)

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94030 0))(
  ( (array!94031 (arr!45409 (Array (_ BitVec 32) (_ BitVec 64))) (size!45960 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94030)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117550 (and (bvslt (size!45960 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45960 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184) (bvslt pivot!64 #b00000000000000000000000000000000))))

(declare-fun array_inv!34690 (array!94030) Bool)

(assert (=> start!117550 (array_inv!34690 a!4010)))

(assert (=> start!117550 true))

(declare-fun bs!39793 () Bool)

(assert (= bs!39793 start!117550))

(declare-fun m!1266595 () Bool)

(assert (=> bs!39793 m!1266595))

(check-sat (not start!117550))
(check-sat)
