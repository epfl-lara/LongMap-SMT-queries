; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135048 () Bool)

(assert start!135048)

(declare-fun b!1573724 () Bool)

(declare-fun res!1074383 () Bool)

(declare-fun e!877625 () Bool)

(assert (=> b!1573724 (=> (not res!1074383) (not e!877625))))

(declare-fun k0!2731 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573724 (= res!1074383 (validKeyInArray!0 k0!2731))))

(declare-fun b!1573722 () Bool)

(declare-fun res!1074386 () Bool)

(assert (=> b!1573722 (=> (not res!1074386) (not e!877625))))

(declare-datatypes ((array!104960 0))(
  ( (array!104961 (arr!50650 (Array (_ BitVec 32) (_ BitVec 64))) (size!51201 (_ BitVec 32))) )
))
(declare-fun a!3462 () array!104960)

(declare-fun mask!4043 () (_ BitVec 32))

(assert (=> b!1573722 (= res!1074386 (= (size!51201 a!3462) (bvadd #b00000000000000000000000000000001 mask!4043)))))

(declare-fun b!1573725 () Bool)

(assert (=> b!1573725 (= e!877625 false)))

(declare-datatypes ((SeekEntryResult!13481 0))(
  ( (MissingZero!13481 (index!56322 (_ BitVec 32))) (Found!13481 (index!56323 (_ BitVec 32))) (Intermediate!13481 (undefined!14293 Bool) (index!56324 (_ BitVec 32)) (x!141234 (_ BitVec 32))) (Undefined!13481) (MissingVacant!13481 (index!56325 (_ BitVec 32))) )
))
(declare-fun lt!674445 () SeekEntryResult!13481)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104960 (_ BitVec 32)) SeekEntryResult!13481)

(assert (=> b!1573725 (= lt!674445 (seekEntryOrOpen!0 k0!2731 a!3462 mask!4043))))

(declare-fun b!1573723 () Bool)

(declare-fun res!1074384 () Bool)

(assert (=> b!1573723 (=> (not res!1074384) (not e!877625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104960 (_ BitVec 32)) Bool)

(assert (=> b!1573723 (= res!1074384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3462 mask!4043))))

(declare-fun res!1074385 () Bool)

(assert (=> start!135048 (=> (not res!1074385) (not e!877625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135048 (= res!1074385 (validMask!0 mask!4043))))

(assert (=> start!135048 e!877625))

(assert (=> start!135048 true))

(declare-fun array_inv!39605 (array!104960) Bool)

(assert (=> start!135048 (array_inv!39605 a!3462)))

(assert (= (and start!135048 res!1074385) b!1573722))

(assert (= (and b!1573722 res!1074386) b!1573723))

(assert (= (and b!1573723 res!1074384) b!1573724))

(assert (= (and b!1573724 res!1074383) b!1573725))

(declare-fun m!1447527 () Bool)

(assert (=> b!1573724 m!1447527))

(declare-fun m!1447529 () Bool)

(assert (=> b!1573725 m!1447529))

(declare-fun m!1447531 () Bool)

(assert (=> b!1573723 m!1447531))

(declare-fun m!1447533 () Bool)

(assert (=> start!135048 m!1447533))

(declare-fun m!1447535 () Bool)

(assert (=> start!135048 m!1447535))

(check-sat (not b!1573724) (not start!135048) (not b!1573725) (not b!1573723))
(check-sat)
