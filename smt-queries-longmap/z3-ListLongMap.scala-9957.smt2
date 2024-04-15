; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117596 () Bool)

(assert start!117596)

(declare-datatypes ((array!94068 0))(
  ( (array!94069 (arr!45427 (Array (_ BitVec 32) (_ BitVec 64))) (size!45979 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94068)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117596 (and (bvslt (size!45979 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45979 a!3931)) (bvslt (bvsub to!105 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34660 (array!94068) Bool)

(assert (=> start!117596 (array_inv!34660 a!3931)))

(assert (=> start!117596 true))

(declare-fun bs!39868 () Bool)

(assert (= bs!39868 start!117596))

(declare-fun m!1265493 () Bool)

(assert (=> bs!39868 m!1265493))

(check-sat (not start!117596))
(check-sat)
