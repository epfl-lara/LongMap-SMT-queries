; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48126 () Bool)

(assert start!48126)

(declare-fun b!530038 () Bool)

(declare-fun e!308847 () Bool)

(declare-fun e!308842 () Bool)

(assert (=> b!530038 (= e!308847 e!308842)))

(declare-fun res!325746 () Bool)

(assert (=> b!530038 (=> (not res!325746) (not e!308842))))

(declare-datatypes ((SeekEntryResult!4595 0))(
  ( (MissingZero!4595 (index!20604 (_ BitVec 32))) (Found!4595 (index!20605 (_ BitVec 32))) (Intermediate!4595 (undefined!5407 Bool) (index!20606 (_ BitVec 32)) (x!49577 (_ BitVec 32))) (Undefined!4595) (MissingVacant!4595 (index!20607 (_ BitVec 32))) )
))
(declare-fun lt!244458 () SeekEntryResult!4595)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530038 (= res!325746 (or (= lt!244458 (MissingZero!4595 i!1204)) (= lt!244458 (MissingVacant!4595 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33562 0))(
  ( (array!33563 (arr!16128 (Array (_ BitVec 32) (_ BitVec 64))) (size!16492 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33562)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33562 (_ BitVec 32)) SeekEntryResult!4595)

(assert (=> b!530038 (= lt!244458 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!530039 () Bool)

(declare-fun res!325749 () Bool)

(assert (=> b!530039 (=> (not res!325749) (not e!308842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33562 (_ BitVec 32)) Bool)

(assert (=> b!530039 (= res!325749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530041 () Bool)

(declare-fun e!308844 () Bool)

(assert (=> b!530041 (= e!308842 (not e!308844))))

(declare-fun res!325751 () Bool)

(assert (=> b!530041 (=> res!325751 e!308844)))

(declare-fun lt!244457 () SeekEntryResult!4595)

(declare-fun lt!244455 () (_ BitVec 32))

(declare-fun lt!244453 () (_ BitVec 64))

(declare-fun lt!244456 () array!33562)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33562 (_ BitVec 32)) SeekEntryResult!4595)

(assert (=> b!530041 (= res!325751 (= lt!244457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244455 lt!244453 lt!244456 mask!3524)))))

(declare-fun lt!244454 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!530041 (= lt!244457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244454 (select (arr!16128 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530041 (= lt!244455 (toIndex!0 lt!244453 mask!3524))))

(assert (=> b!530041 (= lt!244453 (select (store (arr!16128 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!530041 (= lt!244454 (toIndex!0 (select (arr!16128 a!3235) j!176) mask!3524))))

(assert (=> b!530041 (= lt!244456 (array!33563 (store (arr!16128 a!3235) i!1204 k!2280) (size!16492 a!3235)))))

(declare-fun e!308845 () Bool)

(assert (=> b!530041 e!308845))

(declare-fun res!325753 () Bool)

(assert (=> b!530041 (=> (not res!325753) (not e!308845))))

(assert (=> b!530041 (= res!325753 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16802 0))(
  ( (Unit!16803) )
))
(declare-fun lt!244459 () Unit!16802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16802)

(assert (=> b!530041 (= lt!244459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!530042 () Bool)

(declare-fun e!308843 () Bool)

(assert (=> b!530042 (= e!308844 e!308843)))

(declare-fun res!325748 () Bool)

(assert (=> b!530042 (=> res!325748 e!308843)))

(declare-fun lt!244452 () Bool)

(assert (=> b!530042 (= res!325748 (or (and (not lt!244452) (undefined!5407 lt!244457)) (and (not lt!244452) (not (undefined!5407 lt!244457)))))))

(assert (=> b!530042 (= lt!244452 (not (is-Intermediate!4595 lt!244457)))))

(declare-fun b!530043 () Bool)

(assert (=> b!530043 (= e!308845 (= (seekEntryOrOpen!0 (select (arr!16128 a!3235) j!176) a!3235 mask!3524) (Found!4595 j!176)))))

(declare-fun b!530044 () Bool)

(declare-fun res!325745 () Bool)

(assert (=> b!530044 (=> (not res!325745) (not e!308847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530044 (= res!325745 (validKeyInArray!0 k!2280))))

(declare-fun b!530045 () Bool)

(declare-fun res!325744 () Bool)

(assert (=> b!530045 (=> (not res!325744) (not e!308847))))

(declare-fun arrayContainsKey!0 (array!33562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530045 (= res!325744 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530046 () Bool)

(declare-fun res!325750 () Bool)

(assert (=> b!530046 (=> (not res!325750) (not e!308842))))

(declare-datatypes ((List!10286 0))(
  ( (Nil!10283) (Cons!10282 (h!11222 (_ BitVec 64)) (t!16514 List!10286)) )
))
(declare-fun arrayNoDuplicates!0 (array!33562 (_ BitVec 32) List!10286) Bool)

(assert (=> b!530046 (= res!325750 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10283))))

(declare-fun b!530047 () Bool)

(declare-fun res!325747 () Bool)

(assert (=> b!530047 (=> (not res!325747) (not e!308847))))

(assert (=> b!530047 (= res!325747 (and (= (size!16492 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16492 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16492 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530048 () Bool)

(declare-fun res!325754 () Bool)

(assert (=> b!530048 (=> (not res!325754) (not e!308847))))

(assert (=> b!530048 (= res!325754 (validKeyInArray!0 (select (arr!16128 a!3235) j!176)))))

(declare-fun res!325752 () Bool)

(assert (=> start!48126 (=> (not res!325752) (not e!308847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48126 (= res!325752 (validMask!0 mask!3524))))

(assert (=> start!48126 e!308847))

(assert (=> start!48126 true))

(declare-fun array_inv!11924 (array!33562) Bool)

(assert (=> start!48126 (array_inv!11924 a!3235)))

(declare-fun b!530040 () Bool)

(assert (=> b!530040 (= e!308843 true)))

(declare-fun lt!244451 () SeekEntryResult!4595)

(assert (=> b!530040 (= lt!244451 (seekEntryOrOpen!0 lt!244453 lt!244456 mask!3524))))

(assert (=> b!530040 false))

(assert (= (and start!48126 res!325752) b!530047))

(assert (= (and b!530047 res!325747) b!530048))

(assert (= (and b!530048 res!325754) b!530044))

(assert (= (and b!530044 res!325745) b!530045))

(assert (= (and b!530045 res!325744) b!530038))

(assert (= (and b!530038 res!325746) b!530039))

(assert (= (and b!530039 res!325749) b!530046))

(assert (= (and b!530046 res!325750) b!530041))

(assert (= (and b!530041 res!325753) b!530043))

(assert (= (and b!530041 (not res!325751)) b!530042))

(assert (= (and b!530042 (not res!325748)) b!530040))

(declare-fun m!510561 () Bool)

(assert (=> b!530046 m!510561))

(declare-fun m!510563 () Bool)

(assert (=> b!530048 m!510563))

(assert (=> b!530048 m!510563))

(declare-fun m!510565 () Bool)

(assert (=> b!530048 m!510565))

(declare-fun m!510567 () Bool)

(assert (=> start!48126 m!510567))

(declare-fun m!510569 () Bool)

(assert (=> start!48126 m!510569))

(declare-fun m!510571 () Bool)

(assert (=> b!530040 m!510571))

(declare-fun m!510573 () Bool)

(assert (=> b!530045 m!510573))

(assert (=> b!530043 m!510563))

(assert (=> b!530043 m!510563))

(declare-fun m!510575 () Bool)

(assert (=> b!530043 m!510575))

(declare-fun m!510577 () Bool)

(assert (=> b!530039 m!510577))

(declare-fun m!510579 () Bool)

(assert (=> b!530044 m!510579))

(declare-fun m!510581 () Bool)

(assert (=> b!530041 m!510581))

(declare-fun m!510583 () Bool)

(assert (=> b!530041 m!510583))

(assert (=> b!530041 m!510563))

(declare-fun m!510585 () Bool)

(assert (=> b!530041 m!510585))

(assert (=> b!530041 m!510563))

(declare-fun m!510587 () Bool)

(assert (=> b!530041 m!510587))

(declare-fun m!510589 () Bool)

(assert (=> b!530041 m!510589))

(declare-fun m!510591 () Bool)

(assert (=> b!530041 m!510591))

(assert (=> b!530041 m!510563))

(declare-fun m!510593 () Bool)

(assert (=> b!530041 m!510593))

(declare-fun m!510595 () Bool)

(assert (=> b!530041 m!510595))

(declare-fun m!510597 () Bool)

(assert (=> b!530038 m!510597))

(push 1)

