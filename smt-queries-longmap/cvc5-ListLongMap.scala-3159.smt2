; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44526 () Bool)

(assert start!44526)

(declare-fun b!488730 () Bool)

(declare-fun res!291778 () Bool)

(declare-fun e!287496 () Bool)

(assert (=> b!488730 (=> (not res!291778) (not e!287496))))

(declare-datatypes ((array!31636 0))(
  ( (array!31637 (arr!15207 (Array (_ BitVec 32) (_ BitVec 64))) (size!15571 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31636)

(declare-datatypes ((List!9365 0))(
  ( (Nil!9362) (Cons!9361 (h!10220 (_ BitVec 64)) (t!15593 List!9365)) )
))
(declare-fun arrayNoDuplicates!0 (array!31636 (_ BitVec 32) List!9365) Bool)

(assert (=> b!488730 (= res!291778 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9362))))

(declare-fun b!488731 () Bool)

(declare-fun res!291782 () Bool)

(assert (=> b!488731 (=> (not res!291782) (not e!287496))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31636 (_ BitVec 32)) Bool)

(assert (=> b!488731 (= res!291782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!488732 () Bool)

(declare-fun e!287499 () Bool)

(declare-datatypes ((SeekEntryResult!3674 0))(
  ( (MissingZero!3674 (index!16875 (_ BitVec 32))) (Found!3674 (index!16876 (_ BitVec 32))) (Intermediate!3674 (undefined!4486 Bool) (index!16877 (_ BitVec 32)) (x!45993 (_ BitVec 32))) (Undefined!3674) (MissingVacant!3674 (index!16878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31636 (_ BitVec 32)) SeekEntryResult!3674)

(assert (=> b!488732 (= e!287499 (= (seekEntryOrOpen!0 (select (arr!15207 a!3235) j!176) a!3235 mask!3524) (Found!3674 j!176)))))

(declare-fun b!488733 () Bool)

(declare-fun res!291777 () Bool)

(declare-fun e!287497 () Bool)

(assert (=> b!488733 (=> (not res!291777) (not e!287497))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488733 (= res!291777 (and (= (size!15571 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15571 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15571 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488734 () Bool)

(declare-fun res!291779 () Bool)

(assert (=> b!488734 (=> (not res!291779) (not e!287497))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488734 (= res!291779 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!291780 () Bool)

(assert (=> start!44526 (=> (not res!291780) (not e!287497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44526 (= res!291780 (validMask!0 mask!3524))))

(assert (=> start!44526 e!287497))

(assert (=> start!44526 true))

(declare-fun array_inv!11003 (array!31636) Bool)

(assert (=> start!44526 (array_inv!11003 a!3235)))

(declare-fun b!488735 () Bool)

(declare-fun res!291783 () Bool)

(assert (=> b!488735 (=> (not res!291783) (not e!287497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488735 (= res!291783 (validKeyInArray!0 (select (arr!15207 a!3235) j!176)))))

(declare-fun b!488736 () Bool)

(assert (=> b!488736 (= e!287497 e!287496)))

(declare-fun res!291784 () Bool)

(assert (=> b!488736 (=> (not res!291784) (not e!287496))))

(declare-fun lt!220512 () SeekEntryResult!3674)

(assert (=> b!488736 (= res!291784 (or (= lt!220512 (MissingZero!3674 i!1204)) (= lt!220512 (MissingVacant!3674 i!1204))))))

(assert (=> b!488736 (= lt!220512 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488737 () Bool)

(assert (=> b!488737 (= e!287496 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220511 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488737 (= lt!220511 (toIndex!0 (select (store (arr!15207 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!488737 e!287499))

(declare-fun res!291781 () Bool)

(assert (=> b!488737 (=> (not res!291781) (not e!287499))))

(assert (=> b!488737 (= res!291781 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14294 0))(
  ( (Unit!14295) )
))
(declare-fun lt!220513 () Unit!14294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14294)

(assert (=> b!488737 (= lt!220513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488738 () Bool)

(declare-fun res!291785 () Bool)

(assert (=> b!488738 (=> (not res!291785) (not e!287497))))

(assert (=> b!488738 (= res!291785 (validKeyInArray!0 k!2280))))

(assert (= (and start!44526 res!291780) b!488733))

(assert (= (and b!488733 res!291777) b!488735))

(assert (= (and b!488735 res!291783) b!488738))

(assert (= (and b!488738 res!291785) b!488734))

(assert (= (and b!488734 res!291779) b!488736))

(assert (= (and b!488736 res!291784) b!488731))

(assert (= (and b!488731 res!291782) b!488730))

(assert (= (and b!488730 res!291778) b!488737))

(assert (= (and b!488737 res!291781) b!488732))

(declare-fun m!468447 () Bool)

(assert (=> b!488732 m!468447))

(assert (=> b!488732 m!468447))

(declare-fun m!468449 () Bool)

(assert (=> b!488732 m!468449))

(declare-fun m!468451 () Bool)

(assert (=> b!488738 m!468451))

(assert (=> b!488735 m!468447))

(assert (=> b!488735 m!468447))

(declare-fun m!468453 () Bool)

(assert (=> b!488735 m!468453))

(declare-fun m!468455 () Bool)

(assert (=> b!488730 m!468455))

(declare-fun m!468457 () Bool)

(assert (=> b!488731 m!468457))

(declare-fun m!468459 () Bool)

(assert (=> b!488734 m!468459))

(declare-fun m!468461 () Bool)

(assert (=> b!488737 m!468461))

(declare-fun m!468463 () Bool)

(assert (=> b!488737 m!468463))

(declare-fun m!468465 () Bool)

(assert (=> b!488737 m!468465))

(declare-fun m!468467 () Bool)

(assert (=> b!488737 m!468467))

(assert (=> b!488737 m!468465))

(declare-fun m!468469 () Bool)

(assert (=> b!488737 m!468469))

(declare-fun m!468471 () Bool)

(assert (=> b!488736 m!468471))

(declare-fun m!468473 () Bool)

(assert (=> start!44526 m!468473))

(declare-fun m!468475 () Bool)

(assert (=> start!44526 m!468475))

(push 1)

