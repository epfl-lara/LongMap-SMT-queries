; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117716 () Bool)

(assert start!117716)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94152 0))(
  ( (array!94153 (arr!45466 (Array (_ BitVec 32) (_ BitVec 64))) (size!46018 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94152)

(assert (=> start!117716 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46018 a!3464)) (bvslt (size!46018 a!3464) #b01111111111111111111111111111111) (bvsge from!2839 to!94) (bvsgt #b00000000000000000000000000000000 (bvsub (size!46018 a!3464) from!2839)))))

(assert (=> start!117716 true))

(declare-fun array_inv!34699 (array!94152) Bool)

(assert (=> start!117716 (array_inv!34699 a!3464)))

(declare-fun bs!39931 () Bool)

(assert (= bs!39931 start!117716))

(declare-fun m!1265793 () Bool)

(assert (=> bs!39931 m!1265793))

(check-sat (not start!117716))
(check-sat)
