; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93518 () Bool)

(assert start!93518)

(declare-fun res!707389 () Bool)

(declare-fun e!602463 () Bool)

(assert (=> start!93518 (=> (not res!707389) (not e!602463))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66808 0))(
  ( (array!66809 (arr!32120 (Array (_ BitVec 32) (_ BitVec 64))) (size!32656 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66808)

(assert (=> start!93518 (= res!707389 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32656 a!3475)) (bvslt (size!32656 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93518 e!602463))

(assert (=> start!93518 true))

(declare-fun array_inv!24900 (array!66808) Bool)

(assert (=> start!93518 (array_inv!24900 a!3475)))

(declare-fun b!1058815 () Bool)

(declare-fun res!707390 () Bool)

(assert (=> b!1058815 (=> (not res!707390) (not e!602463))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058815 (= res!707390 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058816 () Bool)

(assert (=> b!1058816 (= e!602463 (and (not (= (select (arr!32120 a!3475) from!2850) k0!2741)) (bvsge (bvsub (size!32656 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) (bvsub (size!32656 a!3475) from!2850))))))

(assert (= (and start!93518 res!707389) b!1058815))

(assert (= (and b!1058815 res!707390) b!1058816))

(declare-fun m!978453 () Bool)

(assert (=> start!93518 m!978453))

(declare-fun m!978455 () Bool)

(assert (=> b!1058815 m!978455))

(declare-fun m!978457 () Bool)

(assert (=> b!1058816 m!978457))

(check-sat (not start!93518) (not b!1058815))
(check-sat)
