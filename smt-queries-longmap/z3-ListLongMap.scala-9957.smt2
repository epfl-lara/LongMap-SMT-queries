; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117832 () Bool)

(assert start!117832)

(declare-datatypes ((array!94234 0))(
  ( (array!94235 (arr!45505 (Array (_ BitVec 32) (_ BitVec 64))) (size!46056 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94234)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117832 (and (bvslt (size!46056 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46056 a!3931)) (bvslt (bvsub to!105 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34786 (array!94234) Bool)

(assert (=> start!117832 (array_inv!34786 a!3931)))

(assert (=> start!117832 true))

(declare-fun bs!39913 () Bool)

(assert (= bs!39913 start!117832))

(declare-fun m!1267633 () Bool)

(assert (=> bs!39913 m!1267633))

(check-sat (not start!117832))
(check-sat)
