; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117694 () Bool)

(assert start!117694)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94129 0))(
  ( (array!94130 (arr!45454 (Array (_ BitVec 32) (_ BitVec 64))) (size!46005 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94129)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117694 (and (bvslt (size!46005 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!46005 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001)) (bvsge pivot!34 to!135))))

(declare-fun array_inv!34735 (array!94129) Bool)

(assert (=> start!117694 (array_inv!34735 a!3961)))

(assert (=> start!117694 true))

(declare-fun bs!39853 () Bool)

(assert (= bs!39853 start!117694))

(declare-fun m!1267027 () Bool)

(assert (=> bs!39853 m!1267027))

(check-sat (not start!117694))
(check-sat)
