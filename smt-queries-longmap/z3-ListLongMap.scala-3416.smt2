; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47408 () Bool)

(assert start!47408)

(declare-fun b!521685 () Bool)

(declare-fun res!319498 () Bool)

(declare-fun e!304332 () Bool)

(assert (=> b!521685 (=> res!319498 e!304332)))

(declare-datatypes ((SeekEntryResult!4396 0))(
  ( (MissingZero!4396 (index!19787 (_ BitVec 32))) (Found!4396 (index!19788 (_ BitVec 32))) (Intermediate!4396 (undefined!5208 Bool) (index!19789 (_ BitVec 32)) (x!48915 (_ BitVec 32))) (Undefined!4396) (MissingVacant!4396 (index!19790 (_ BitVec 32))) )
))
(declare-fun lt!239169 () SeekEntryResult!4396)

(get-info :version)

(assert (=> b!521685 (= res!319498 (or (undefined!5208 lt!239169) (not ((_ is Intermediate!4396) lt!239169))))))

(declare-fun b!521687 () Bool)

(declare-fun e!304331 () Bool)

(assert (=> b!521687 (= e!304331 (not e!304332))))

(declare-fun res!319494 () Bool)

(assert (=> b!521687 (=> res!319494 e!304332)))

(declare-fun lt!239175 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33235 0))(
  ( (array!33236 (arr!15973 (Array (_ BitVec 32) (_ BitVec 64))) (size!16337 (_ BitVec 32))) )
))
(declare-fun lt!239176 () array!33235)

(declare-fun lt!239168 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33235 (_ BitVec 32)) SeekEntryResult!4396)

(assert (=> b!521687 (= res!319494 (= lt!239169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239175 lt!239168 lt!239176 mask!3524)))))

(declare-fun a!3235 () array!33235)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239174 () (_ BitVec 32))

(assert (=> b!521687 (= lt!239169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239174 (select (arr!15973 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521687 (= lt!239175 (toIndex!0 lt!239168 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521687 (= lt!239168 (select (store (arr!15973 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521687 (= lt!239174 (toIndex!0 (select (arr!15973 a!3235) j!176) mask!3524))))

(assert (=> b!521687 (= lt!239176 (array!33236 (store (arr!15973 a!3235) i!1204 k0!2280) (size!16337 a!3235)))))

(declare-fun e!304329 () Bool)

(assert (=> b!521687 e!304329))

(declare-fun res!319496 () Bool)

(assert (=> b!521687 (=> (not res!319496) (not e!304329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33235 (_ BitVec 32)) Bool)

(assert (=> b!521687 (= res!319496 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16195 0))(
  ( (Unit!16196) )
))
(declare-fun lt!239170 () Unit!16195)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16195)

(assert (=> b!521687 (= lt!239170 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521688 () Bool)

(declare-fun e!304330 () Bool)

(assert (=> b!521688 (= e!304330 false)))

(declare-fun b!521689 () Bool)

(declare-fun res!319504 () Bool)

(declare-fun e!304334 () Bool)

(assert (=> b!521689 (=> (not res!319504) (not e!304334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521689 (= res!319504 (validKeyInArray!0 (select (arr!15973 a!3235) j!176)))))

(declare-fun b!521690 () Bool)

(declare-fun res!319495 () Bool)

(assert (=> b!521690 (=> (not res!319495) (not e!304334))))

(assert (=> b!521690 (= res!319495 (validKeyInArray!0 k0!2280))))

(declare-fun b!521691 () Bool)

(assert (=> b!521691 (= e!304334 e!304331)))

(declare-fun res!319502 () Bool)

(assert (=> b!521691 (=> (not res!319502) (not e!304331))))

(declare-fun lt!239171 () SeekEntryResult!4396)

(assert (=> b!521691 (= res!319502 (or (= lt!239171 (MissingZero!4396 i!1204)) (= lt!239171 (MissingVacant!4396 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33235 (_ BitVec 32)) SeekEntryResult!4396)

(assert (=> b!521691 (= lt!239171 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521692 () Bool)

(declare-fun res!319500 () Bool)

(assert (=> b!521692 (=> (not res!319500) (not e!304334))))

(declare-fun arrayContainsKey!0 (array!33235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521692 (= res!319500 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521686 () Bool)

(declare-fun res!319501 () Bool)

(assert (=> b!521686 (=> (not res!319501) (not e!304334))))

(assert (=> b!521686 (= res!319501 (and (= (size!16337 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16337 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16337 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!319503 () Bool)

(assert (=> start!47408 (=> (not res!319503) (not e!304334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47408 (= res!319503 (validMask!0 mask!3524))))

(assert (=> start!47408 e!304334))

(assert (=> start!47408 true))

(declare-fun array_inv!11832 (array!33235) Bool)

(assert (=> start!47408 (array_inv!11832 a!3235)))

(declare-fun b!521693 () Bool)

(declare-fun res!319493 () Bool)

(assert (=> b!521693 (=> (not res!319493) (not e!304331))))

(declare-datatypes ((List!10038 0))(
  ( (Nil!10035) (Cons!10034 (h!10956 (_ BitVec 64)) (t!16258 List!10038)) )
))
(declare-fun arrayNoDuplicates!0 (array!33235 (_ BitVec 32) List!10038) Bool)

(assert (=> b!521693 (= res!319493 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10035))))

(declare-fun b!521694 () Bool)

(assert (=> b!521694 (= e!304329 (= (seekEntryOrOpen!0 (select (arr!15973 a!3235) j!176) a!3235 mask!3524) (Found!4396 j!176)))))

(declare-fun b!521695 () Bool)

(declare-fun e!304333 () Unit!16195)

(declare-fun Unit!16197 () Unit!16195)

(assert (=> b!521695 (= e!304333 Unit!16197)))

(declare-fun b!521696 () Bool)

(declare-fun Unit!16198 () Unit!16195)

(assert (=> b!521696 (= e!304333 Unit!16198)))

(declare-fun lt!239172 () Unit!16195)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16195)

(assert (=> b!521696 (= lt!239172 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239174 #b00000000000000000000000000000000 (index!19789 lt!239169) (x!48915 lt!239169) mask!3524))))

(declare-fun res!319499 () Bool)

(assert (=> b!521696 (= res!319499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239174 lt!239168 lt!239176 mask!3524) (Intermediate!4396 false (index!19789 lt!239169) (x!48915 lt!239169))))))

(assert (=> b!521696 (=> (not res!319499) (not e!304330))))

(assert (=> b!521696 e!304330))

(declare-fun b!521697 () Bool)

(assert (=> b!521697 (= e!304332 true)))

(assert (=> b!521697 (and (or (= (select (arr!15973 a!3235) (index!19789 lt!239169)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15973 a!3235) (index!19789 lt!239169)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15973 a!3235) (index!19789 lt!239169)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15973 a!3235) (index!19789 lt!239169)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239173 () Unit!16195)

(assert (=> b!521697 (= lt!239173 e!304333)))

(declare-fun c!61397 () Bool)

(assert (=> b!521697 (= c!61397 (= (select (arr!15973 a!3235) (index!19789 lt!239169)) (select (arr!15973 a!3235) j!176)))))

(assert (=> b!521697 (and (bvslt (x!48915 lt!239169) #b01111111111111111111111111111110) (or (= (select (arr!15973 a!3235) (index!19789 lt!239169)) (select (arr!15973 a!3235) j!176)) (= (select (arr!15973 a!3235) (index!19789 lt!239169)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15973 a!3235) (index!19789 lt!239169)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521698 () Bool)

(declare-fun res!319497 () Bool)

(assert (=> b!521698 (=> (not res!319497) (not e!304331))))

(assert (=> b!521698 (= res!319497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47408 res!319503) b!521686))

(assert (= (and b!521686 res!319501) b!521689))

(assert (= (and b!521689 res!319504) b!521690))

(assert (= (and b!521690 res!319495) b!521692))

(assert (= (and b!521692 res!319500) b!521691))

(assert (= (and b!521691 res!319502) b!521698))

(assert (= (and b!521698 res!319497) b!521693))

(assert (= (and b!521693 res!319493) b!521687))

(assert (= (and b!521687 res!319496) b!521694))

(assert (= (and b!521687 (not res!319494)) b!521685))

(assert (= (and b!521685 (not res!319498)) b!521697))

(assert (= (and b!521697 c!61397) b!521696))

(assert (= (and b!521697 (not c!61397)) b!521695))

(assert (= (and b!521696 res!319499) b!521688))

(declare-fun m!502843 () Bool)

(assert (=> b!521694 m!502843))

(assert (=> b!521694 m!502843))

(declare-fun m!502845 () Bool)

(assert (=> b!521694 m!502845))

(declare-fun m!502847 () Bool)

(assert (=> b!521698 m!502847))

(declare-fun m!502849 () Bool)

(assert (=> b!521692 m!502849))

(declare-fun m!502851 () Bool)

(assert (=> b!521687 m!502851))

(declare-fun m!502853 () Bool)

(assert (=> b!521687 m!502853))

(declare-fun m!502855 () Bool)

(assert (=> b!521687 m!502855))

(declare-fun m!502857 () Bool)

(assert (=> b!521687 m!502857))

(assert (=> b!521687 m!502843))

(declare-fun m!502859 () Bool)

(assert (=> b!521687 m!502859))

(assert (=> b!521687 m!502843))

(declare-fun m!502861 () Bool)

(assert (=> b!521687 m!502861))

(assert (=> b!521687 m!502843))

(declare-fun m!502863 () Bool)

(assert (=> b!521687 m!502863))

(declare-fun m!502865 () Bool)

(assert (=> b!521687 m!502865))

(declare-fun m!502867 () Bool)

(assert (=> b!521696 m!502867))

(declare-fun m!502869 () Bool)

(assert (=> b!521696 m!502869))

(declare-fun m!502871 () Bool)

(assert (=> b!521690 m!502871))

(assert (=> b!521689 m!502843))

(assert (=> b!521689 m!502843))

(declare-fun m!502873 () Bool)

(assert (=> b!521689 m!502873))

(declare-fun m!502875 () Bool)

(assert (=> b!521697 m!502875))

(assert (=> b!521697 m!502843))

(declare-fun m!502877 () Bool)

(assert (=> b!521693 m!502877))

(declare-fun m!502879 () Bool)

(assert (=> start!47408 m!502879))

(declare-fun m!502881 () Bool)

(assert (=> start!47408 m!502881))

(declare-fun m!502883 () Bool)

(assert (=> b!521691 m!502883))

(check-sat (not b!521690) (not b!521698) (not b!521694) (not b!521691) (not start!47408) (not b!521687) (not b!521689) (not b!521693) (not b!521692) (not b!521696))
(check-sat)
