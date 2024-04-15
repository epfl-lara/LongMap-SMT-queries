; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117692 () Bool)

(assert start!117692)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94128 0))(
  ( (array!94129 (arr!45454 (Array (_ BitVec 32) (_ BitVec 64))) (size!46006 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94128)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117692 (and (bvslt (size!46006 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46006 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt from!3356 to!152))))

(declare-fun array_inv!34687 (array!94128) Bool)

(assert (=> start!117692 (array_inv!34687 a!3978)))

(assert (=> start!117692 true))

(declare-fun bs!39913 () Bool)

(assert (= bs!39913 start!117692))

(declare-fun m!1265745 () Bool)

(assert (=> bs!39913 m!1265745))

(check-sat (not start!117692))
(check-sat)
