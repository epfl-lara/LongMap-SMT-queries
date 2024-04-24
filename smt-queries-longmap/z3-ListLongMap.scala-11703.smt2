; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137264 () Bool)

(assert start!137264)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105953 0))(
  ( (array!105954 (arr!51076 (Array (_ BitVec 32) (_ BitVec 64))) (size!51627 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105953)

(assert (=> start!137264 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51627 a!3471)) (bvslt (size!51627 a!3471) #b01111111111111111111111111111111) (bvslt (bvsub (size!51627 a!3471) from!2846) #b00000000000000000000000000000000))))

(assert (=> start!137264 true))

(declare-fun array_inv!40031 (array!105953) Bool)

(assert (=> start!137264 (array_inv!40031 a!3471)))

(declare-fun bs!45729 () Bool)

(assert (= bs!45729 start!137264))

(declare-fun m!1453167 () Bool)

(assert (=> bs!45729 m!1453167))

(check-sat (not start!137264))
(check-sat)
