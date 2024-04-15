; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117710 () Bool)

(assert start!117710)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94146 0))(
  ( (array!94147 (arr!45463 (Array (_ BitVec 32) (_ BitVec 64))) (size!46015 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94146)

(assert (=> start!117710 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46015 a!3464)) (bvslt (size!46015 a!3464) #b01111111111111111111111111111111) (bvslt (bvsub (size!46015 a!3464) from!2839) #b00000000000000000000000000000000))))

(assert (=> start!117710 true))

(declare-fun array_inv!34696 (array!94146) Bool)

(assert (=> start!117710 (array_inv!34696 a!3464)))

(declare-fun bs!39925 () Bool)

(assert (= bs!39925 start!117710))

(declare-fun m!1265787 () Bool)

(assert (=> bs!39925 m!1265787))

(check-sat (not start!117710))
(check-sat)
