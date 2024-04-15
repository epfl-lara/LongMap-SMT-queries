; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44706 () Bool)

(assert start!44706)

(declare-fun b!490514 () Bool)

(declare-fun res!293596 () Bool)

(declare-fun e!288285 () Bool)

(assert (=> b!490514 (=> (not res!293596) (not e!288285))))

(declare-datatypes ((array!31775 0))(
  ( (array!31776 (arr!15275 (Array (_ BitVec 32) (_ BitVec 64))) (size!15640 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31775)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31775 (_ BitVec 32)) Bool)

(assert (=> b!490514 (= res!293596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490515 () Bool)

(declare-fun res!293599 () Bool)

(declare-fun e!288288 () Bool)

(assert (=> b!490515 (=> (not res!293599) (not e!288288))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490515 (= res!293599 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490516 () Bool)

(declare-fun e!288286 () Bool)

(assert (=> b!490516 (= e!288285 (not e!288286))))

(declare-fun res!293594 () Bool)

(assert (=> b!490516 (=> res!293594 e!288286)))

(declare-fun lt!221494 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221490 () array!31775)

(declare-datatypes ((SeekEntryResult!3739 0))(
  ( (MissingZero!3739 (index!17135 (_ BitVec 32))) (Found!3739 (index!17136 (_ BitVec 32))) (Intermediate!3739 (undefined!4551 Bool) (index!17137 (_ BitVec 32)) (x!46240 (_ BitVec 32))) (Undefined!3739) (MissingVacant!3739 (index!17138 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31775 (_ BitVec 32)) SeekEntryResult!3739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490516 (= res!293594 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15275 a!3235) j!176) mask!3524) (select (arr!15275 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221494 mask!3524) lt!221494 lt!221490 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490516 (= lt!221494 (select (store (arr!15275 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490516 (= lt!221490 (array!31776 (store (arr!15275 a!3235) i!1204 k0!2280) (size!15640 a!3235)))))

(declare-fun lt!221489 () SeekEntryResult!3739)

(assert (=> b!490516 (= lt!221489 (Found!3739 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31775 (_ BitVec 32)) SeekEntryResult!3739)

(assert (=> b!490516 (= lt!221489 (seekEntryOrOpen!0 (select (arr!15275 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490516 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14410 0))(
  ( (Unit!14411) )
))
(declare-fun lt!221492 () Unit!14410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14410)

(assert (=> b!490516 (= lt!221492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490517 () Bool)

(declare-fun res!293600 () Bool)

(assert (=> b!490517 (=> (not res!293600) (not e!288285))))

(declare-datatypes ((List!9472 0))(
  ( (Nil!9469) (Cons!9468 (h!10330 (_ BitVec 64)) (t!15691 List!9472)) )
))
(declare-fun arrayNoDuplicates!0 (array!31775 (_ BitVec 32) List!9472) Bool)

(assert (=> b!490517 (= res!293600 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9469))))

(declare-fun b!490518 () Bool)

(declare-fun res!293595 () Bool)

(assert (=> b!490518 (=> (not res!293595) (not e!288288))))

(assert (=> b!490518 (= res!293595 (and (= (size!15640 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15640 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15640 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490519 () Bool)

(declare-fun res!293593 () Bool)

(assert (=> b!490519 (=> (not res!293593) (not e!288288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490519 (= res!293593 (validKeyInArray!0 (select (arr!15275 a!3235) j!176)))))

(declare-fun res!293592 () Bool)

(assert (=> start!44706 (=> (not res!293592) (not e!288288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44706 (= res!293592 (validMask!0 mask!3524))))

(assert (=> start!44706 e!288288))

(assert (=> start!44706 true))

(declare-fun array_inv!11158 (array!31775) Bool)

(assert (=> start!44706 (array_inv!11158 a!3235)))

(declare-fun b!490520 () Bool)

(declare-fun res!293597 () Bool)

(assert (=> b!490520 (=> (not res!293597) (not e!288288))))

(assert (=> b!490520 (= res!293597 (validKeyInArray!0 k0!2280))))

(declare-fun b!490521 () Bool)

(assert (=> b!490521 (= e!288286 true)))

(assert (=> b!490521 (= lt!221489 (seekEntryOrOpen!0 lt!221494 lt!221490 mask!3524))))

(declare-fun lt!221493 () Unit!14410)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31775 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14410)

(assert (=> b!490521 (= lt!221493 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490522 () Bool)

(assert (=> b!490522 (= e!288288 e!288285)))

(declare-fun res!293598 () Bool)

(assert (=> b!490522 (=> (not res!293598) (not e!288285))))

(declare-fun lt!221491 () SeekEntryResult!3739)

(assert (=> b!490522 (= res!293598 (or (= lt!221491 (MissingZero!3739 i!1204)) (= lt!221491 (MissingVacant!3739 i!1204))))))

(assert (=> b!490522 (= lt!221491 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44706 res!293592) b!490518))

(assert (= (and b!490518 res!293595) b!490519))

(assert (= (and b!490519 res!293593) b!490520))

(assert (= (and b!490520 res!293597) b!490515))

(assert (= (and b!490515 res!293599) b!490522))

(assert (= (and b!490522 res!293598) b!490514))

(assert (= (and b!490514 res!293596) b!490517))

(assert (= (and b!490517 res!293600) b!490516))

(assert (= (and b!490516 (not res!293594)) b!490521))

(declare-fun m!470305 () Bool)

(assert (=> start!44706 m!470305))

(declare-fun m!470307 () Bool)

(assert (=> start!44706 m!470307))

(declare-fun m!470309 () Bool)

(assert (=> b!490515 m!470309))

(declare-fun m!470311 () Bool)

(assert (=> b!490517 m!470311))

(declare-fun m!470313 () Bool)

(assert (=> b!490514 m!470313))

(declare-fun m!470315 () Bool)

(assert (=> b!490516 m!470315))

(declare-fun m!470317 () Bool)

(assert (=> b!490516 m!470317))

(declare-fun m!470319 () Bool)

(assert (=> b!490516 m!470319))

(declare-fun m!470321 () Bool)

(assert (=> b!490516 m!470321))

(declare-fun m!470323 () Bool)

(assert (=> b!490516 m!470323))

(declare-fun m!470325 () Bool)

(assert (=> b!490516 m!470325))

(declare-fun m!470327 () Bool)

(assert (=> b!490516 m!470327))

(declare-fun m!470329 () Bool)

(assert (=> b!490516 m!470329))

(assert (=> b!490516 m!470327))

(assert (=> b!490516 m!470325))

(assert (=> b!490516 m!470327))

(declare-fun m!470331 () Bool)

(assert (=> b!490516 m!470331))

(assert (=> b!490516 m!470327))

(declare-fun m!470333 () Bool)

(assert (=> b!490516 m!470333))

(assert (=> b!490516 m!470315))

(declare-fun m!470335 () Bool)

(assert (=> b!490520 m!470335))

(declare-fun m!470337 () Bool)

(assert (=> b!490522 m!470337))

(declare-fun m!470339 () Bool)

(assert (=> b!490521 m!470339))

(declare-fun m!470341 () Bool)

(assert (=> b!490521 m!470341))

(assert (=> b!490519 m!470327))

(assert (=> b!490519 m!470327))

(declare-fun m!470343 () Bool)

(assert (=> b!490519 m!470343))

(check-sat (not b!490516) (not start!44706) (not b!490517) (not b!490520) (not b!490515) (not b!490519) (not b!490521) (not b!490514) (not b!490522))
(check-sat)
