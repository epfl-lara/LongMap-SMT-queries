; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117994 () Bool)

(assert start!117994)

(declare-fun res!923330 () Bool)

(declare-fun e!783725 () Bool)

(assert (=> start!117994 (=> (not res!923330) (not e!783725))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94345 0))(
  ( (array!94346 (arr!45556 (Array (_ BitVec 32) (_ BitVec 64))) (size!46107 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94345)

(assert (=> start!117994 (= res!923330 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46107 a!3464)) (bvslt (size!46107 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117994 e!783725))

(assert (=> start!117994 true))

(declare-fun array_inv!34837 (array!94345) Bool)

(assert (=> start!117994 (array_inv!34837 a!3464)))

(declare-fun b!1382455 () Bool)

(declare-fun res!923331 () Bool)

(assert (=> b!1382455 (=> (not res!923331) (not e!783725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382455 (= res!923331 (not (validKeyInArray!0 (select (arr!45556 a!3464) from!2839))))))

(declare-fun b!1382456 () Bool)

(assert (=> b!1382456 (= e!783725 (bvsge (bvsub (size!46107 a!3464) (bvadd #b00000000000000000000000000000001 from!2839)) (bvsub (size!46107 a!3464) from!2839)))))

(assert (= (and start!117994 res!923330) b!1382455))

(assert (= (and b!1382455 res!923331) b!1382456))

(declare-fun m!1268005 () Bool)

(assert (=> start!117994 m!1268005))

(declare-fun m!1268007 () Bool)

(assert (=> b!1382455 m!1268007))

(assert (=> b!1382455 m!1268007))

(declare-fun m!1268009 () Bool)

(assert (=> b!1382455 m!1268009))

(check-sat (not start!117994) (not b!1382455))
(check-sat)
