; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117692 () Bool)

(assert start!117692)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-fun to!152 () (_ BitVec 32))

(declare-datatypes ((array!94174 0))(
  ( (array!94175 (arr!45477 (Array (_ BitVec 32) (_ BitVec 64))) (size!46027 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94174)

(assert (=> start!117692 (and (bvslt (size!46027 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46027 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (or (bvsgt pivot!39 to!152) (bvslt pivot!39 #b00000000000000000000000000000000)))))

(declare-fun array_inv!34505 (array!94174) Bool)

(assert (=> start!117692 (array_inv!34505 a!3978)))

(assert (=> start!117692 true))

(declare-fun bs!39936 () Bool)

(assert (= bs!39936 start!117692))

(declare-fun m!1266245 () Bool)

(assert (=> bs!39936 m!1266245))

(check-sat (not start!117692))
(check-sat)
