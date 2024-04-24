; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117922 () Bool)

(assert start!117922)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94288 0))(
  ( (array!94289 (arr!45529 (Array (_ BitVec 32) (_ BitVec 64))) (size!46080 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94288)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117922 (and (bvslt (size!46080 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46080 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (or (bvsgt pivot!39 to!152) (bvslt pivot!39 #b00000000000000000000000000000000)))))

(declare-fun array_inv!34810 (array!94288) Bool)

(assert (=> start!117922 (array_inv!34810 a!3978)))

(assert (=> start!117922 true))

(declare-fun bs!39952 () Bool)

(assert (= bs!39952 start!117922))

(declare-fun m!1267879 () Bool)

(assert (=> bs!39952 m!1267879))

(check-sat (not start!117922))
(check-sat)
