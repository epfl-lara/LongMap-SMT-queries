; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117946 () Bool)

(assert start!117946)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94312 0))(
  ( (array!94313 (arr!45541 (Array (_ BitVec 32) (_ BitVec 64))) (size!46092 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94312)

(assert (=> start!117946 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46092 a!3464)) (bvslt (size!46092 a!3464) #b01111111111111111111111111111111) (bvslt (bvsub (size!46092 a!3464) from!2839) #b00000000000000000000000000000000))))

(assert (=> start!117946 true))

(declare-fun array_inv!34822 (array!94312) Bool)

(assert (=> start!117946 (array_inv!34822 a!3464)))

(declare-fun bs!39970 () Bool)

(assert (= bs!39970 start!117946))

(declare-fun m!1267927 () Bool)

(assert (=> bs!39970 m!1267927))

(check-sat (not start!117946))
(check-sat)
