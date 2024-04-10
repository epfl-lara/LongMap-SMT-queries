; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46024 () Bool)

(assert start!46024)

(declare-fun b!509622 () Bool)

(declare-fun res!310469 () Bool)

(declare-fun e!298002 () Bool)

(assert (=> b!509622 (=> (not res!310469) (not e!298002))))

(declare-datatypes ((array!32735 0))(
  ( (array!32736 (arr!15746 (Array (_ BitVec 32) (_ BitVec 64))) (size!16110 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32735)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32735 (_ BitVec 32)) Bool)

(assert (=> b!509622 (= res!310469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509623 () Bool)

(declare-fun res!310470 () Bool)

(declare-fun e!298005 () Bool)

(assert (=> b!509623 (=> (not res!310470) (not e!298005))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509623 (= res!310470 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509624 () Bool)

(declare-fun res!310472 () Bool)

(assert (=> b!509624 (=> (not res!310472) (not e!298005))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509624 (= res!310472 (and (= (size!16110 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16110 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16110 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509625 () Bool)

(declare-fun res!310468 () Bool)

(assert (=> b!509625 (=> (not res!310468) (not e!298005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509625 (= res!310468 (validKeyInArray!0 (select (arr!15746 a!3235) j!176)))))

(declare-fun res!310467 () Bool)

(assert (=> start!46024 (=> (not res!310467) (not e!298005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46024 (= res!310467 (validMask!0 mask!3524))))

(assert (=> start!46024 e!298005))

(assert (=> start!46024 true))

(declare-fun array_inv!11542 (array!32735) Bool)

(assert (=> start!46024 (array_inv!11542 a!3235)))

(declare-fun b!509626 () Bool)

(declare-fun res!310474 () Bool)

(assert (=> b!509626 (=> (not res!310474) (not e!298005))))

(assert (=> b!509626 (= res!310474 (validKeyInArray!0 k!2280))))

(declare-fun b!509627 () Bool)

(assert (=> b!509627 (= e!298005 e!298002)))

(declare-fun res!310471 () Bool)

(assert (=> b!509627 (=> (not res!310471) (not e!298002))))

(declare-datatypes ((SeekEntryResult!4213 0))(
  ( (MissingZero!4213 (index!19040 (_ BitVec 32))) (Found!4213 (index!19041 (_ BitVec 32))) (Intermediate!4213 (undefined!5025 Bool) (index!19042 (_ BitVec 32)) (x!48006 (_ BitVec 32))) (Undefined!4213) (MissingVacant!4213 (index!19043 (_ BitVec 32))) )
))
(declare-fun lt!232843 () SeekEntryResult!4213)

(assert (=> b!509627 (= res!310471 (or (= lt!232843 (MissingZero!4213 i!1204)) (= lt!232843 (MissingVacant!4213 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32735 (_ BitVec 32)) SeekEntryResult!4213)

(assert (=> b!509627 (= lt!232843 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509628 () Bool)

(assert (=> b!509628 (= e!298002 (not true))))

(declare-fun lt!232841 () (_ BitVec 32))

(declare-fun lt!232840 () SeekEntryResult!4213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32735 (_ BitVec 32)) SeekEntryResult!4213)

(assert (=> b!509628 (= lt!232840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232841 (select (store (arr!15746 a!3235) i!1204 k!2280) j!176) (array!32736 (store (arr!15746 a!3235) i!1204 k!2280) (size!16110 a!3235)) mask!3524))))

(declare-fun lt!232842 () (_ BitVec 32))

(declare-fun lt!232838 () SeekEntryResult!4213)

(assert (=> b!509628 (= lt!232838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232842 (select (arr!15746 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509628 (= lt!232841 (toIndex!0 (select (store (arr!15746 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509628 (= lt!232842 (toIndex!0 (select (arr!15746 a!3235) j!176) mask!3524))))

(declare-fun e!298003 () Bool)

(assert (=> b!509628 e!298003))

(declare-fun res!310473 () Bool)

(assert (=> b!509628 (=> (not res!310473) (not e!298003))))

(assert (=> b!509628 (= res!310473 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15684 0))(
  ( (Unit!15685) )
))
(declare-fun lt!232839 () Unit!15684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15684)

(assert (=> b!509628 (= lt!232839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509629 () Bool)

(assert (=> b!509629 (= e!298003 (= (seekEntryOrOpen!0 (select (arr!15746 a!3235) j!176) a!3235 mask!3524) (Found!4213 j!176)))))

(declare-fun b!509630 () Bool)

(declare-fun res!310475 () Bool)

(assert (=> b!509630 (=> (not res!310475) (not e!298002))))

(declare-datatypes ((List!9904 0))(
  ( (Nil!9901) (Cons!9900 (h!10777 (_ BitVec 64)) (t!16132 List!9904)) )
))
(declare-fun arrayNoDuplicates!0 (array!32735 (_ BitVec 32) List!9904) Bool)

(assert (=> b!509630 (= res!310475 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9901))))

(assert (= (and start!46024 res!310467) b!509624))

(assert (= (and b!509624 res!310472) b!509625))

(assert (= (and b!509625 res!310468) b!509626))

(assert (= (and b!509626 res!310474) b!509623))

(assert (= (and b!509623 res!310470) b!509627))

(assert (= (and b!509627 res!310471) b!509622))

(assert (= (and b!509622 res!310469) b!509630))

(assert (= (and b!509630 res!310475) b!509628))

(assert (= (and b!509628 res!310473) b!509629))

(declare-fun m!490569 () Bool)

(assert (=> b!509628 m!490569))

(declare-fun m!490571 () Bool)

(assert (=> b!509628 m!490571))

(declare-fun m!490573 () Bool)

(assert (=> b!509628 m!490573))

(declare-fun m!490575 () Bool)

(assert (=> b!509628 m!490575))

(assert (=> b!509628 m!490569))

(declare-fun m!490577 () Bool)

(assert (=> b!509628 m!490577))

(declare-fun m!490579 () Bool)

(assert (=> b!509628 m!490579))

(assert (=> b!509628 m!490577))

(declare-fun m!490581 () Bool)

(assert (=> b!509628 m!490581))

(assert (=> b!509628 m!490569))

(declare-fun m!490583 () Bool)

(assert (=> b!509628 m!490583))

(assert (=> b!509628 m!490577))

(declare-fun m!490585 () Bool)

(assert (=> b!509628 m!490585))

(declare-fun m!490587 () Bool)

(assert (=> b!509630 m!490587))

(assert (=> b!509629 m!490577))

(assert (=> b!509629 m!490577))

(declare-fun m!490589 () Bool)

(assert (=> b!509629 m!490589))

(declare-fun m!490591 () Bool)

(assert (=> b!509622 m!490591))

(assert (=> b!509625 m!490577))

(assert (=> b!509625 m!490577))

(declare-fun m!490593 () Bool)

(assert (=> b!509625 m!490593))

(declare-fun m!490595 () Bool)

(assert (=> b!509623 m!490595))

(declare-fun m!490597 () Bool)

(assert (=> b!509627 m!490597))

(declare-fun m!490599 () Bool)

(assert (=> start!46024 m!490599))

(declare-fun m!490601 () Bool)

(assert (=> start!46024 m!490601))

(declare-fun m!490603 () Bool)

(assert (=> b!509626 m!490603))

(push 1)

