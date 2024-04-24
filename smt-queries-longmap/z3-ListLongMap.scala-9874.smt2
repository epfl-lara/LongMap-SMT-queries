; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117160 () Bool)

(assert start!117160)

(declare-datatypes ((array!93715 0))(
  ( (array!93716 (arr!45256 (Array (_ BitVec 32) (_ BitVec 64))) (size!45807 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93715)

(declare-fun from!3579 () (_ BitVec 32))

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!117160 (and (bvslt (size!45807 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45807 a!4212)) (bvslt to!375 #b00000000000000000000000000000000))))

(declare-fun array_inv!34537 (array!93715) Bool)

(assert (=> start!117160 (array_inv!34537 a!4212)))

(assert (=> start!117160 true))

(declare-fun bs!39613 () Bool)

(assert (= bs!39613 start!117160))

(declare-fun m!1263681 () Bool)

(assert (=> bs!39613 m!1263681))

(check-sat (not start!117160))
(check-sat)
