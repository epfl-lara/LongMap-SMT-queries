; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117686 () Bool)

(assert start!117686)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94168 0))(
  ( (array!94169 (arr!45474 (Array (_ BitVec 32) (_ BitVec 64))) (size!46024 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94168)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117686 (and (bvslt (size!46024 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46024 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt pivot!39 (size!46024 a!3978)))))

(declare-fun array_inv!34502 (array!94168) Bool)

(assert (=> start!117686 (array_inv!34502 a!3978)))

(assert (=> start!117686 true))

(declare-fun bs!39930 () Bool)

(assert (= bs!39930 start!117686))

(declare-fun m!1266239 () Bool)

(assert (=> bs!39930 m!1266239))

(check-sat (not start!117686))
(check-sat)
