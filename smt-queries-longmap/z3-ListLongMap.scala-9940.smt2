; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117464 () Bool)

(assert start!117464)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94015 0))(
  ( (array!94016 (arr!45402 (Array (_ BitVec 32) (_ BitVec 64))) (size!45952 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94015)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117464 (and (bvslt (size!45952 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45952 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001)) (bvsge pivot!34 to!135))))

(declare-fun array_inv!34430 (array!94015) Bool)

(assert (=> start!117464 (array_inv!34430 a!3961)))

(assert (=> start!117464 true))

(declare-fun bs!39837 () Bool)

(assert (= bs!39837 start!117464))

(declare-fun m!1265393 () Bool)

(assert (=> bs!39837 m!1265393))

(check-sat (not start!117464))
(check-sat)
