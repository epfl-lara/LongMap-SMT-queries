; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117686 () Bool)

(assert start!117686)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94122 0))(
  ( (array!94123 (arr!45451 (Array (_ BitVec 32) (_ BitVec 64))) (size!46003 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94122)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117686 (and (bvslt (size!46003 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46003 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (or (bvsgt pivot!39 to!152) (bvslt pivot!39 #b00000000000000000000000000000000)))))

(declare-fun array_inv!34684 (array!94122) Bool)

(assert (=> start!117686 (array_inv!34684 a!3978)))

(assert (=> start!117686 true))

(declare-fun bs!39907 () Bool)

(assert (= bs!39907 start!117686))

(declare-fun m!1265739 () Bool)

(assert (=> bs!39907 m!1265739))

(check-sat (not start!117686))
(check-sat)
