; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117728 () Bool)

(assert start!117728)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94210 0))(
  ( (array!94211 (arr!45495 (Array (_ BitVec 32) (_ BitVec 64))) (size!46045 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94210)

(assert (=> start!117728 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46045 a!3464)) (bvslt (size!46045 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94) (bvsge from!2839 (size!46045 a!3464)))))

(assert (=> start!117728 true))

(declare-fun array_inv!34523 (array!94210) Bool)

(assert (=> start!117728 (array_inv!34523 a!3464)))

(declare-fun bs!39966 () Bool)

(assert (= bs!39966 start!117728))

(declare-fun m!1266305 () Bool)

(assert (=> bs!39966 m!1266305))

(check-sat (not start!117728))
(check-sat)
