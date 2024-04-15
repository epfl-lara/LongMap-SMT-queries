; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117728 () Bool)

(assert start!117728)

(declare-fun res!922747 () Bool)

(declare-fun e!782790 () Bool)

(assert (=> start!117728 (=> (not res!922747) (not e!782790))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94164 0))(
  ( (array!94165 (arr!45472 (Array (_ BitVec 32) (_ BitVec 64))) (size!46024 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94164)

(assert (=> start!117728 (= res!922747 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46024 a!3464)) (bvslt (size!46024 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117728 e!782790))

(assert (=> start!117728 true))

(declare-fun array_inv!34705 (array!94164) Bool)

(assert (=> start!117728 (array_inv!34705 a!3464)))

(declare-fun b!1381004 () Bool)

(declare-fun res!922748 () Bool)

(assert (=> b!1381004 (=> (not res!922748) (not e!782790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381004 (= res!922748 (validKeyInArray!0 (select (arr!45472 a!3464) from!2839)))))

(declare-fun b!1381005 () Bool)

(assert (=> b!1381005 (= e!782790 (bvsge (bvsub (size!46024 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46024 a!3464) from!2839)))))

(assert (= (and start!117728 res!922747) b!1381004))

(assert (= (and b!1381004 res!922748) b!1381005))

(declare-fun m!1265805 () Bool)

(assert (=> start!117728 m!1265805))

(declare-fun m!1265807 () Bool)

(assert (=> b!1381004 m!1265807))

(assert (=> b!1381004 m!1265807))

(declare-fun m!1265809 () Bool)

(assert (=> b!1381004 m!1265809))

(check-sat (not b!1381004) (not start!117728))
(check-sat)
