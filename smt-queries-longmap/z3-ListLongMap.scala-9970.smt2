; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117722 () Bool)

(assert start!117722)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94204 0))(
  ( (array!94205 (arr!45492 (Array (_ BitVec 32) (_ BitVec 64))) (size!46042 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94204)

(assert (=> start!117722 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46042 a!3464)) (bvslt (size!46042 a!3464) #b01111111111111111111111111111111) (bvsge from!2839 to!94) (bvsgt #b00000000000000000000000000000000 (bvsub (size!46042 a!3464) from!2839)))))

(assert (=> start!117722 true))

(declare-fun array_inv!34520 (array!94204) Bool)

(assert (=> start!117722 (array_inv!34520 a!3464)))

(declare-fun bs!39960 () Bool)

(assert (= bs!39960 start!117722))

(declare-fun m!1266299 () Bool)

(assert (=> bs!39960 m!1266299))

(check-sat (not start!117722))
(check-sat)
