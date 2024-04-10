; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117698 () Bool)

(assert start!117698)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94180 0))(
  ( (array!94181 (arr!45480 (Array (_ BitVec 32) (_ BitVec 64))) (size!46030 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94180)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117698 (and (bvslt (size!46030 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46030 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt from!3356 to!152))))

(declare-fun array_inv!34508 (array!94180) Bool)

(assert (=> start!117698 (array_inv!34508 a!3978)))

(assert (=> start!117698 true))

(declare-fun bs!39942 () Bool)

(assert (= bs!39942 start!117698))

(declare-fun m!1266251 () Bool)

(assert (=> bs!39942 m!1266251))

(check-sat (not start!117698))
(check-sat)
