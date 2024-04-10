; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117734 () Bool)

(assert start!117734)

(declare-fun res!922779 () Bool)

(declare-fun e!782827 () Bool)

(assert (=> start!117734 (=> (not res!922779) (not e!782827))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94216 0))(
  ( (array!94217 (arr!45498 (Array (_ BitVec 32) (_ BitVec 64))) (size!46048 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94216)

(assert (=> start!117734 (= res!922779 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46048 a!3464)) (bvslt (size!46048 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117734 e!782827))

(assert (=> start!117734 true))

(declare-fun array_inv!34526 (array!94216) Bool)

(assert (=> start!117734 (array_inv!34526 a!3464)))

(declare-fun b!1381079 () Bool)

(declare-fun res!922780 () Bool)

(assert (=> b!1381079 (=> (not res!922780) (not e!782827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381079 (= res!922780 (validKeyInArray!0 (select (arr!45498 a!3464) from!2839)))))

(declare-fun b!1381080 () Bool)

(assert (=> b!1381080 (= e!782827 (bvsge (bvsub (size!46048 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46048 a!3464) from!2839)))))

(assert (= (and start!117734 res!922779) b!1381079))

(assert (= (and b!1381079 res!922780) b!1381080))

(declare-fun m!1266315 () Bool)

(assert (=> start!117734 m!1266315))

(declare-fun m!1266317 () Bool)

(assert (=> b!1381079 m!1266317))

(assert (=> b!1381079 m!1266317))

(declare-fun m!1266319 () Bool)

(assert (=> b!1381079 m!1266319))

(check-sat (not start!117734) (not b!1381079))
(check-sat)
