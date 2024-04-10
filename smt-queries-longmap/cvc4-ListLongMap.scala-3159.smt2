; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44530 () Bool)

(assert start!44530)

(declare-fun b!488784 () Bool)

(declare-fun res!291833 () Bool)

(declare-fun e!287523 () Bool)

(assert (=> b!488784 (=> (not res!291833) (not e!287523))))

(declare-datatypes ((array!31640 0))(
  ( (array!31641 (arr!15209 (Array (_ BitVec 32) (_ BitVec 64))) (size!15573 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31640)

(declare-datatypes ((List!9367 0))(
  ( (Nil!9364) (Cons!9363 (h!10222 (_ BitVec 64)) (t!15595 List!9367)) )
))
(declare-fun arrayNoDuplicates!0 (array!31640 (_ BitVec 32) List!9367) Bool)

(assert (=> b!488784 (= res!291833 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9364))))

(declare-fun b!488785 () Bool)

(declare-fun e!287520 () Bool)

(assert (=> b!488785 (= e!287520 e!287523)))

(declare-fun res!291835 () Bool)

(assert (=> b!488785 (=> (not res!291835) (not e!287523))))

(declare-datatypes ((SeekEntryResult!3676 0))(
  ( (MissingZero!3676 (index!16883 (_ BitVec 32))) (Found!3676 (index!16884 (_ BitVec 32))) (Intermediate!3676 (undefined!4488 Bool) (index!16885 (_ BitVec 32)) (x!45995 (_ BitVec 32))) (Undefined!3676) (MissingVacant!3676 (index!16886 (_ BitVec 32))) )
))
(declare-fun lt!220530 () SeekEntryResult!3676)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488785 (= res!291835 (or (= lt!220530 (MissingZero!3676 i!1204)) (= lt!220530 (MissingVacant!3676 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31640 (_ BitVec 32)) SeekEntryResult!3676)

(assert (=> b!488785 (= lt!220530 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!488786 () Bool)

(declare-fun e!287521 () Bool)

(assert (=> b!488786 (= e!287521 (= (seekEntryOrOpen!0 (select (arr!15209 a!3235) j!176) a!3235 mask!3524) (Found!3676 j!176)))))

(declare-fun b!488787 () Bool)

(assert (=> b!488787 (= e!287523 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220529 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488787 (= lt!220529 (toIndex!0 (select (store (arr!15209 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!488787 e!287521))

(declare-fun res!291838 () Bool)

(assert (=> b!488787 (=> (not res!291838) (not e!287521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31640 (_ BitVec 32)) Bool)

(assert (=> b!488787 (= res!291838 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14298 0))(
  ( (Unit!14299) )
))
(declare-fun lt!220531 () Unit!14298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14298)

(assert (=> b!488787 (= lt!220531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488788 () Bool)

(declare-fun res!291832 () Bool)

(assert (=> b!488788 (=> (not res!291832) (not e!287520))))

(assert (=> b!488788 (= res!291832 (and (= (size!15573 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15573 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15573 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488789 () Bool)

(declare-fun res!291834 () Bool)

(assert (=> b!488789 (=> (not res!291834) (not e!287520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488789 (= res!291834 (validKeyInArray!0 (select (arr!15209 a!3235) j!176)))))

(declare-fun b!488790 () Bool)

(declare-fun res!291837 () Bool)

(assert (=> b!488790 (=> (not res!291837) (not e!287523))))

(assert (=> b!488790 (= res!291837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291831 () Bool)

(assert (=> start!44530 (=> (not res!291831) (not e!287520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44530 (= res!291831 (validMask!0 mask!3524))))

(assert (=> start!44530 e!287520))

(assert (=> start!44530 true))

(declare-fun array_inv!11005 (array!31640) Bool)

(assert (=> start!44530 (array_inv!11005 a!3235)))

(declare-fun b!488791 () Bool)

(declare-fun res!291839 () Bool)

(assert (=> b!488791 (=> (not res!291839) (not e!287520))))

(assert (=> b!488791 (= res!291839 (validKeyInArray!0 k!2280))))

(declare-fun b!488792 () Bool)

(declare-fun res!291836 () Bool)

(assert (=> b!488792 (=> (not res!291836) (not e!287520))))

(declare-fun arrayContainsKey!0 (array!31640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488792 (= res!291836 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44530 res!291831) b!488788))

(assert (= (and b!488788 res!291832) b!488789))

(assert (= (and b!488789 res!291834) b!488791))

(assert (= (and b!488791 res!291839) b!488792))

(assert (= (and b!488792 res!291836) b!488785))

(assert (= (and b!488785 res!291835) b!488790))

(assert (= (and b!488790 res!291837) b!488784))

(assert (= (and b!488784 res!291833) b!488787))

(assert (= (and b!488787 res!291838) b!488786))

(declare-fun m!468507 () Bool)

(assert (=> b!488784 m!468507))

(declare-fun m!468509 () Bool)

(assert (=> b!488786 m!468509))

(assert (=> b!488786 m!468509))

(declare-fun m!468511 () Bool)

(assert (=> b!488786 m!468511))

(declare-fun m!468513 () Bool)

(assert (=> b!488791 m!468513))

(declare-fun m!468515 () Bool)

(assert (=> b!488790 m!468515))

(assert (=> b!488789 m!468509))

(assert (=> b!488789 m!468509))

(declare-fun m!468517 () Bool)

(assert (=> b!488789 m!468517))

(declare-fun m!468519 () Bool)

(assert (=> b!488787 m!468519))

(declare-fun m!468521 () Bool)

(assert (=> b!488787 m!468521))

(declare-fun m!468523 () Bool)

(assert (=> b!488787 m!468523))

(declare-fun m!468525 () Bool)

(assert (=> b!488787 m!468525))

(assert (=> b!488787 m!468523))

(declare-fun m!468527 () Bool)

(assert (=> b!488787 m!468527))

(declare-fun m!468529 () Bool)

(assert (=> b!488792 m!468529))

(declare-fun m!468531 () Bool)

(assert (=> b!488785 m!468531))

(declare-fun m!468533 () Bool)

(assert (=> start!44530 m!468533))

(declare-fun m!468535 () Bool)

(assert (=> start!44530 m!468535))

(push 1)

