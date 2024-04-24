; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117928 () Bool)

(assert start!117928)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94294 0))(
  ( (array!94295 (arr!45532 (Array (_ BitVec 32) (_ BitVec 64))) (size!46083 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94294)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117928 (and (bvslt (size!46083 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46083 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt from!3356 to!152))))

(declare-fun array_inv!34813 (array!94294) Bool)

(assert (=> start!117928 (array_inv!34813 a!3978)))

(assert (=> start!117928 true))

(declare-fun bs!39958 () Bool)

(assert (= bs!39958 start!117928))

(declare-fun m!1267885 () Bool)

(assert (=> bs!39958 m!1267885))

(check-sat (not start!117928))
(check-sat)
