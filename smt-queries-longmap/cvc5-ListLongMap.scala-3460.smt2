; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48030 () Bool)

(assert start!48030)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4577 0))(
  ( (MissingZero!4577 (index!20532 (_ BitVec 32))) (Found!4577 (index!20533 (_ BitVec 32))) (Intermediate!4577 (undefined!5389 Bool) (index!20534 (_ BitVec 32)) (x!49505 (_ BitVec 32))) (Undefined!4577) (MissingVacant!4577 (index!20535 (_ BitVec 32))) )
))
(declare-fun lt!243877 () SeekEntryResult!4577)

(declare-fun lt!243883 () SeekEntryResult!4577)

(declare-datatypes ((array!33523 0))(
  ( (array!33524 (arr!16110 (Array (_ BitVec 32) (_ BitVec 64))) (size!16474 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33523)

(declare-fun lt!243879 () (_ BitVec 32))

(declare-fun b!529127 () Bool)

(declare-fun e!308327 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33523 (_ BitVec 32)) SeekEntryResult!4577)

(assert (=> b!529127 (= e!308327 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243879 (index!20534 lt!243877) (select (arr!16110 a!3235) j!176) a!3235 mask!3524) lt!243883)))))

(declare-fun b!529128 () Bool)

(declare-fun e!308331 () Bool)

(declare-fun lt!243885 () SeekEntryResult!4577)

(declare-fun lt!243888 () SeekEntryResult!4577)

(assert (=> b!529128 (= e!308331 (= lt!243885 lt!243888))))

(assert (=> b!529128 (= lt!243888 lt!243883)))

(declare-fun lt!243889 () array!33523)

(declare-fun lt!243884 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33523 (_ BitVec 32)) SeekEntryResult!4577)

(assert (=> b!529128 (= lt!243888 (seekEntryOrOpen!0 lt!243884 lt!243889 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((Unit!16760 0))(
  ( (Unit!16761) )
))
(declare-fun lt!243878 () Unit!16760)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16760)

(assert (=> b!529128 (= lt!243878 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!243879 #b00000000000000000000000000000000 (index!20534 lt!243877) (x!49505 lt!243877) mask!3524))))

(declare-fun b!529129 () Bool)

(declare-fun res!325033 () Bool)

(declare-fun e!308332 () Bool)

(assert (=> b!529129 (=> (not res!325033) (not e!308332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529129 (= res!325033 (validKeyInArray!0 k!2280))))

(declare-fun b!529130 () Bool)

(declare-fun e!308328 () Bool)

(declare-fun e!308333 () Bool)

(assert (=> b!529130 (= e!308328 (not e!308333))))

(declare-fun res!325030 () Bool)

(assert (=> b!529130 (=> res!325030 e!308333)))

(declare-fun lt!243876 () SeekEntryResult!4577)

(assert (=> b!529130 (= res!325030 (or (= lt!243877 lt!243876) (undefined!5389 lt!243877) (not (is-Intermediate!4577 lt!243877))))))

(declare-fun lt!243886 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33523 (_ BitVec 32)) SeekEntryResult!4577)

(assert (=> b!529130 (= lt!243876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243886 lt!243884 lt!243889 mask!3524))))

(assert (=> b!529130 (= lt!243877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243879 (select (arr!16110 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529130 (= lt!243886 (toIndex!0 lt!243884 mask!3524))))

(assert (=> b!529130 (= lt!243884 (select (store (arr!16110 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!529130 (= lt!243879 (toIndex!0 (select (arr!16110 a!3235) j!176) mask!3524))))

(assert (=> b!529130 (= lt!243889 (array!33524 (store (arr!16110 a!3235) i!1204 k!2280) (size!16474 a!3235)))))

(assert (=> b!529130 (= lt!243885 lt!243883)))

(assert (=> b!529130 (= lt!243883 (Found!4577 j!176))))

(assert (=> b!529130 (= lt!243885 (seekEntryOrOpen!0 (select (arr!16110 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33523 (_ BitVec 32)) Bool)

(assert (=> b!529130 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243880 () Unit!16760)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16760)

(assert (=> b!529130 (= lt!243880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529131 () Bool)

(declare-fun e!308334 () Bool)

(assert (=> b!529131 (= e!308334 false)))

(declare-fun res!325039 () Bool)

(assert (=> start!48030 (=> (not res!325039) (not e!308332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48030 (= res!325039 (validMask!0 mask!3524))))

(assert (=> start!48030 e!308332))

(assert (=> start!48030 true))

(declare-fun array_inv!11906 (array!33523) Bool)

(assert (=> start!48030 (array_inv!11906 a!3235)))

(declare-fun b!529132 () Bool)

(assert (=> b!529132 (= e!308332 e!308328)))

(declare-fun res!325041 () Bool)

(assert (=> b!529132 (=> (not res!325041) (not e!308328))))

(declare-fun lt!243887 () SeekEntryResult!4577)

(assert (=> b!529132 (= res!325041 (or (= lt!243887 (MissingZero!4577 i!1204)) (= lt!243887 (MissingVacant!4577 i!1204))))))

(assert (=> b!529132 (= lt!243887 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529133 () Bool)

(assert (=> b!529133 (= e!308333 e!308331)))

(declare-fun res!325032 () Bool)

(assert (=> b!529133 (=> res!325032 e!308331)))

(assert (=> b!529133 (= res!325032 (or (bvsgt (x!49505 lt!243877) #b01111111111111111111111111111110) (bvslt lt!243879 #b00000000000000000000000000000000) (bvsge lt!243879 (size!16474 a!3235)) (bvslt (index!20534 lt!243877) #b00000000000000000000000000000000) (bvsge (index!20534 lt!243877) (size!16474 a!3235)) (not (= lt!243877 (Intermediate!4577 false (index!20534 lt!243877) (x!49505 lt!243877))))))))

(assert (=> b!529133 (= (index!20534 lt!243877) i!1204)))

(declare-fun lt!243875 () Unit!16760)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16760)

(assert (=> b!529133 (= lt!243875 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!243879 #b00000000000000000000000000000000 (index!20534 lt!243877) (x!49505 lt!243877) mask!3524))))

(assert (=> b!529133 (and (or (= (select (arr!16110 a!3235) (index!20534 lt!243877)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16110 a!3235) (index!20534 lt!243877)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16110 a!3235) (index!20534 lt!243877)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16110 a!3235) (index!20534 lt!243877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243881 () Unit!16760)

(declare-fun e!308330 () Unit!16760)

(assert (=> b!529133 (= lt!243881 e!308330)))

(declare-fun c!62357 () Bool)

(assert (=> b!529133 (= c!62357 (= (select (arr!16110 a!3235) (index!20534 lt!243877)) (select (arr!16110 a!3235) j!176)))))

(assert (=> b!529133 (and (bvslt (x!49505 lt!243877) #b01111111111111111111111111111110) (or (= (select (arr!16110 a!3235) (index!20534 lt!243877)) (select (arr!16110 a!3235) j!176)) (= (select (arr!16110 a!3235) (index!20534 lt!243877)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16110 a!3235) (index!20534 lt!243877)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529134 () Bool)

(declare-fun res!325038 () Bool)

(assert (=> b!529134 (=> (not res!325038) (not e!308332))))

(assert (=> b!529134 (= res!325038 (validKeyInArray!0 (select (arr!16110 a!3235) j!176)))))

(declare-fun b!529135 () Bool)

(declare-fun res!325036 () Bool)

(assert (=> b!529135 (=> (not res!325036) (not e!308328))))

(declare-datatypes ((List!10268 0))(
  ( (Nil!10265) (Cons!10264 (h!11201 (_ BitVec 64)) (t!16496 List!10268)) )
))
(declare-fun arrayNoDuplicates!0 (array!33523 (_ BitVec 32) List!10268) Bool)

(assert (=> b!529135 (= res!325036 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10265))))

(declare-fun b!529136 () Bool)

(declare-fun res!325042 () Bool)

(assert (=> b!529136 (=> (not res!325042) (not e!308328))))

(assert (=> b!529136 (= res!325042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529137 () Bool)

(declare-fun res!325031 () Bool)

(assert (=> b!529137 (=> (not res!325031) (not e!308332))))

(assert (=> b!529137 (= res!325031 (and (= (size!16474 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16474 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16474 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529138 () Bool)

(declare-fun res!325037 () Bool)

(assert (=> b!529138 (=> res!325037 e!308331)))

(assert (=> b!529138 (= res!325037 (not (= lt!243876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243879 lt!243884 lt!243889 mask!3524))))))

(declare-fun b!529139 () Bool)

(declare-fun res!325035 () Bool)

(assert (=> b!529139 (=> res!325035 e!308331)))

(assert (=> b!529139 (= res!325035 e!308327)))

(declare-fun res!325043 () Bool)

(assert (=> b!529139 (=> (not res!325043) (not e!308327))))

(assert (=> b!529139 (= res!325043 (bvsgt #b00000000000000000000000000000000 (x!49505 lt!243877)))))

(declare-fun b!529140 () Bool)

(declare-fun res!325040 () Bool)

(assert (=> b!529140 (=> (not res!325040) (not e!308332))))

(declare-fun arrayContainsKey!0 (array!33523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529140 (= res!325040 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529141 () Bool)

(declare-fun Unit!16762 () Unit!16760)

(assert (=> b!529141 (= e!308330 Unit!16762)))

(declare-fun b!529142 () Bool)

(declare-fun Unit!16763 () Unit!16760)

(assert (=> b!529142 (= e!308330 Unit!16763)))

(declare-fun lt!243882 () Unit!16760)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16760)

(assert (=> b!529142 (= lt!243882 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!243879 #b00000000000000000000000000000000 (index!20534 lt!243877) (x!49505 lt!243877) mask!3524))))

(declare-fun res!325034 () Bool)

(assert (=> b!529142 (= res!325034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243879 lt!243884 lt!243889 mask!3524) (Intermediate!4577 false (index!20534 lt!243877) (x!49505 lt!243877))))))

(assert (=> b!529142 (=> (not res!325034) (not e!308334))))

(assert (=> b!529142 e!308334))

(assert (= (and start!48030 res!325039) b!529137))

(assert (= (and b!529137 res!325031) b!529134))

(assert (= (and b!529134 res!325038) b!529129))

(assert (= (and b!529129 res!325033) b!529140))

(assert (= (and b!529140 res!325040) b!529132))

(assert (= (and b!529132 res!325041) b!529136))

(assert (= (and b!529136 res!325042) b!529135))

(assert (= (and b!529135 res!325036) b!529130))

(assert (= (and b!529130 (not res!325030)) b!529133))

(assert (= (and b!529133 c!62357) b!529142))

(assert (= (and b!529133 (not c!62357)) b!529141))

(assert (= (and b!529142 res!325034) b!529131))

(assert (= (and b!529133 (not res!325032)) b!529139))

(assert (= (and b!529139 res!325043) b!529127))

(assert (= (and b!529139 (not res!325035)) b!529138))

(assert (= (and b!529138 (not res!325037)) b!529128))

(declare-fun m!509655 () Bool)

(assert (=> b!529130 m!509655))

(declare-fun m!509657 () Bool)

(assert (=> b!529130 m!509657))

(declare-fun m!509659 () Bool)

(assert (=> b!529130 m!509659))

(declare-fun m!509661 () Bool)

(assert (=> b!529130 m!509661))

(declare-fun m!509663 () Bool)

(assert (=> b!529130 m!509663))

(declare-fun m!509665 () Bool)

(assert (=> b!529130 m!509665))

(assert (=> b!529130 m!509663))

(declare-fun m!509667 () Bool)

(assert (=> b!529130 m!509667))

(declare-fun m!509669 () Bool)

(assert (=> b!529130 m!509669))

(assert (=> b!529130 m!509663))

(declare-fun m!509671 () Bool)

(assert (=> b!529130 m!509671))

(declare-fun m!509673 () Bool)

(assert (=> b!529130 m!509673))

(assert (=> b!529130 m!509663))

(declare-fun m!509675 () Bool)

(assert (=> b!529138 m!509675))

(declare-fun m!509677 () Bool)

(assert (=> b!529136 m!509677))

(declare-fun m!509679 () Bool)

(assert (=> b!529133 m!509679))

(declare-fun m!509681 () Bool)

(assert (=> b!529133 m!509681))

(assert (=> b!529133 m!509663))

(declare-fun m!509683 () Bool)

(assert (=> b!529135 m!509683))

(declare-fun m!509685 () Bool)

(assert (=> b!529140 m!509685))

(assert (=> b!529127 m!509663))

(assert (=> b!529127 m!509663))

(declare-fun m!509687 () Bool)

(assert (=> b!529127 m!509687))

(declare-fun m!509689 () Bool)

(assert (=> b!529142 m!509689))

(assert (=> b!529142 m!509675))

(declare-fun m!509691 () Bool)

(assert (=> start!48030 m!509691))

(declare-fun m!509693 () Bool)

(assert (=> start!48030 m!509693))

(assert (=> b!529134 m!509663))

(assert (=> b!529134 m!509663))

(declare-fun m!509695 () Bool)

(assert (=> b!529134 m!509695))

(declare-fun m!509697 () Bool)

(assert (=> b!529129 m!509697))

(declare-fun m!509699 () Bool)

(assert (=> b!529132 m!509699))

(declare-fun m!509701 () Bool)

(assert (=> b!529128 m!509701))

(declare-fun m!509703 () Bool)

(assert (=> b!529128 m!509703))

(push 1)

