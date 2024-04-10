; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117702 () Bool)

(assert start!117702)

(declare-fun res!922737 () Bool)

(declare-fun e!782758 () Bool)

(assert (=> start!117702 (=> (not res!922737) (not e!782758))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94184 0))(
  ( (array!94185 (arr!45482 (Array (_ BitVec 32) (_ BitVec 64))) (size!46032 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94184)

(assert (=> start!117702 (= res!922737 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46032 a!3464)) (bvslt (size!46032 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117702 e!782758))

(assert (=> start!117702 true))

(declare-fun array_inv!34510 (array!94184) Bool)

(assert (=> start!117702 (array_inv!34510 a!3464)))

(declare-fun b!1381037 () Bool)

(declare-fun res!922738 () Bool)

(assert (=> b!1381037 (=> (not res!922738) (not e!782758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381037 (= res!922738 (validKeyInArray!0 (select (arr!45482 a!3464) from!2839)))))

(declare-fun b!1381038 () Bool)

(assert (=> b!1381038 (= e!782758 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117702 res!922737) b!1381037))

(assert (= (and b!1381037 res!922738) b!1381038))

(declare-fun m!1266255 () Bool)

(assert (=> start!117702 m!1266255))

(declare-fun m!1266257 () Bool)

(assert (=> b!1381037 m!1266257))

(assert (=> b!1381037 m!1266257))

(declare-fun m!1266259 () Bool)

(assert (=> b!1381037 m!1266259))

(push 1)

(assert (not start!117702))

(assert (not b!1381037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

