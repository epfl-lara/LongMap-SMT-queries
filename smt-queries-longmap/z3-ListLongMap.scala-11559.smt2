; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134638 () Bool)

(assert start!134638)

(declare-fun b!1571299 () Bool)

(declare-fun res!1073537 () Bool)

(declare-fun e!876121 () Bool)

(assert (=> b!1571299 (=> (not res!1073537) (not e!876121))))

(declare-datatypes ((array!104840 0))(
  ( (array!104841 (arr!50597 (Array (_ BitVec 32) (_ BitVec 64))) (size!51147 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104840)

(declare-fun mask!4043 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104840 (_ BitVec 32)) Bool)

(assert (=> b!1571299 (= res!1073537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun b!1571301 () Bool)

(assert (=> b!1571301 (= e!876121 false)))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13534 0))(
  ( (MissingZero!13534 (index!56534 (_ BitVec 32))) (Found!13534 (index!56535 (_ BitVec 32))) (Intermediate!13534 (undefined!14346 Bool) (index!56536 (_ BitVec 32)) (x!141236 (_ BitVec 32))) (Undefined!13534) (MissingVacant!13534 (index!56537 (_ BitVec 32))) )
))
(declare-fun lt!673540 () SeekEntryResult!13534)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104840 (_ BitVec 32)) SeekEntryResult!13534)

(assert (=> b!1571301 (= lt!673540 (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))

(declare-fun res!1073538 () Bool)

(assert (=> start!134638 (=> (not res!1073538) (not e!876121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134638 (= res!1073538 (validMask!0 mask!4043))))

(assert (=> start!134638 e!876121))

(assert (=> start!134638 true))

(declare-fun array_inv!39324 (array!104840) Bool)

(assert (=> start!134638 (array_inv!39324 a!3462)))

(declare-fun b!1571300 () Bool)

(declare-fun res!1073536 () Bool)

(assert (=> b!1571300 (=> (not res!1073536) (not e!876121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571300 (= res!1073536 (validKeyInArray!0 k0!2731))))

(declare-fun b!1571298 () Bool)

(declare-fun res!1073535 () Bool)

(assert (=> b!1571298 (=> (not res!1073535) (not e!876121))))

(assert (=> b!1571298 (= res!1073535 (= (size!51147 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(assert (= (and start!134638 res!1073538) b!1571298))

(assert (= (and b!1571298 res!1073535) b!1571299))

(assert (= (and b!1571299 res!1073537) b!1571300))

(assert (= (and b!1571300 res!1073536) b!1571301))

(declare-fun m!1445279 () Bool)

(assert (=> b!1571299 m!1445279))

(declare-fun m!1445281 () Bool)

(assert (=> b!1571301 m!1445281))

(declare-fun m!1445283 () Bool)

(assert (=> start!134638 m!1445283))

(declare-fun m!1445285 () Bool)

(assert (=> start!134638 m!1445285))

(declare-fun m!1445287 () Bool)

(assert (=> b!1571300 m!1445287))

(check-sat (not b!1571301) (not b!1571300) (not start!134638) (not b!1571299))
(check-sat)
