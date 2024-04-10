; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134644 () Bool)

(assert start!134644)

(declare-fun b!1571336 () Bool)

(declare-fun res!1073573 () Bool)

(declare-fun e!876140 () Bool)

(assert (=> b!1571336 (=> (not res!1073573) (not e!876140))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571336 (= res!1073573 (validKeyInArray!0 k0!2731))))

(declare-fun res!1073574 () Bool)

(assert (=> start!134644 (=> (not res!1073574) (not e!876140))))

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134644 (= res!1073574 (validMask!0 mask!4043))))

(assert (=> start!134644 e!876140))

(assert (=> start!134644 true))

(declare-datatypes ((array!104846 0))(
  ( (array!104847 (arr!50600 (Array (_ BitVec 32) (_ BitVec 64))) (size!51150 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104846)

(declare-fun array_inv!39327 (array!104846) Bool)

(assert (=> start!134644 (array_inv!39327 a!3462)))

(declare-fun b!1571335 () Bool)

(declare-fun res!1073572 () Bool)

(assert (=> b!1571335 (=> (not res!1073572) (not e!876140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104846 (_ BitVec 32)) Bool)

(assert (=> b!1571335 (= res!1073572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571334 () Bool)

(declare-fun res!1073571 () Bool)

(assert (=> b!1571334 (=> (not res!1073571) (not e!876140))))

(assert (=> b!1571334 (= res!1073571 (= (size!51150 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1571337 () Bool)

(assert (=> b!1571337 (= e!876140 false)))

(declare-datatypes ((SeekEntryResult!13537 0))(
  ( (MissingZero!13537 (index!56546 (_ BitVec 32))) (Found!13537 (index!56547 (_ BitVec 32))) (Intermediate!13537 (undefined!14349 Bool) (index!56548 (_ BitVec 32)) (x!141247 (_ BitVec 32))) (Undefined!13537) (MissingVacant!13537 (index!56549 (_ BitVec 32))) )
))
(declare-fun lt!673549 () SeekEntryResult!13537)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104846 (_ BitVec 32)) SeekEntryResult!13537)

(assert (=> b!1571337 (= lt!673549 (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))

(assert (= (and start!134644 res!1073574) b!1571334))

(assert (= (and b!1571334 res!1073571) b!1571335))

(assert (= (and b!1571335 res!1073572) b!1571336))

(assert (= (and b!1571336 res!1073573) b!1571337))

(declare-fun m!1445309 () Bool)

(assert (=> b!1571336 m!1445309))

(declare-fun m!1445311 () Bool)

(assert (=> start!134644 m!1445311))

(declare-fun m!1445313 () Bool)

(assert (=> start!134644 m!1445313))

(declare-fun m!1445315 () Bool)

(assert (=> b!1571335 m!1445315))

(declare-fun m!1445317 () Bool)

(assert (=> b!1571337 m!1445317))

(check-sat (not b!1571337) (not start!134644) (not b!1571336) (not b!1571335))
(check-sat)
