; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117704 () Bool)

(assert start!117704)

(declare-fun res!922743 () Bool)

(declare-fun e!782764 () Bool)

(assert (=> start!117704 (=> (not res!922743) (not e!782764))))

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94186 0))(
  ( (array!94187 (arr!45483 (Array (_ BitVec 32) (_ BitVec 64))) (size!46033 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94186)

(assert (=> start!117704 (= res!922743 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46033 a!3464)) (bvslt (size!46033 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94)))))

(assert (=> start!117704 e!782764))

(assert (=> start!117704 true))

(declare-fun array_inv!34511 (array!94186) Bool)

(assert (=> start!117704 (array_inv!34511 a!3464)))

(declare-fun b!1381043 () Bool)

(declare-fun res!922744 () Bool)

(assert (=> b!1381043 (=> (not res!922744) (not e!782764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381043 (= res!922744 (validKeyInArray!0 (select (arr!45483 a!3464) from!2839)))))

(declare-fun b!1381044 () Bool)

(assert (=> b!1381044 (= e!782764 (bvslt (bvadd #b00000000000000000000000000000001 from!2839) #b00000000000000000000000000000000))))

(assert (= (and start!117704 res!922743) b!1381043))

(assert (= (and b!1381043 res!922744) b!1381044))

(declare-fun m!1266261 () Bool)

(assert (=> start!117704 m!1266261))

(declare-fun m!1266263 () Bool)

(assert (=> b!1381043 m!1266263))

(assert (=> b!1381043 m!1266263))

(declare-fun m!1266265 () Bool)

(assert (=> b!1381043 m!1266265))

(check-sat (not b!1381043) (not start!117704))
(check-sat)
