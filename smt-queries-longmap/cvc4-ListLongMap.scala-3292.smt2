; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45700 () Bool)

(assert start!45700)

(declare-fun b!504778 () Bool)

(declare-fun res!305931 () Bool)

(declare-fun e!295531 () Bool)

(assert (=> b!504778 (=> (not res!305931) (not e!295531))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504778 (= res!305931 (validKeyInArray!0 k!2280))))

(declare-fun b!504779 () Bool)

(declare-datatypes ((Unit!15376 0))(
  ( (Unit!15377) )
))
(declare-fun e!295533 () Unit!15376)

(declare-fun Unit!15378 () Unit!15376)

(assert (=> b!504779 (= e!295533 Unit!15378)))

(declare-fun res!305932 () Bool)

(assert (=> start!45700 (=> (not res!305932) (not e!295531))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45700 (= res!305932 (validMask!0 mask!3524))))

(assert (=> start!45700 e!295531))

(assert (=> start!45700 true))

(declare-datatypes ((array!32456 0))(
  ( (array!32457 (arr!15608 (Array (_ BitVec 32) (_ BitVec 64))) (size!15972 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32456)

(declare-fun array_inv!11404 (array!32456) Bool)

(assert (=> start!45700 (array_inv!11404 a!3235)))

(declare-fun lt!229899 () (_ BitVec 32))

(declare-fun b!504780 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295539 () Bool)

(declare-datatypes ((SeekEntryResult!4075 0))(
  ( (MissingZero!4075 (index!18488 (_ BitVec 32))) (Found!4075 (index!18489 (_ BitVec 32))) (Intermediate!4075 (undefined!4887 Bool) (index!18490 (_ BitVec 32)) (x!47500 (_ BitVec 32))) (Undefined!4075) (MissingVacant!4075 (index!18491 (_ BitVec 32))) )
))
(declare-fun lt!229898 () SeekEntryResult!4075)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32456 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!504780 (= e!295539 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229899 (index!18490 lt!229898) (select (arr!15608 a!3235) j!176) a!3235 mask!3524) (Found!4075 j!176))))))

(declare-fun b!504781 () Bool)

(declare-fun res!305921 () Bool)

(assert (=> b!504781 (=> (not res!305921) (not e!295531))))

(assert (=> b!504781 (= res!305921 (validKeyInArray!0 (select (arr!15608 a!3235) j!176)))))

(declare-fun b!504782 () Bool)

(declare-fun e!295538 () Bool)

(assert (=> b!504782 (= e!295531 e!295538)))

(declare-fun res!305924 () Bool)

(assert (=> b!504782 (=> (not res!305924) (not e!295538))))

(declare-fun lt!229896 () SeekEntryResult!4075)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504782 (= res!305924 (or (= lt!229896 (MissingZero!4075 i!1204)) (= lt!229896 (MissingVacant!4075 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32456 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!504782 (= lt!229896 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504783 () Bool)

(declare-fun res!305925 () Bool)

(assert (=> b!504783 (=> (not res!305925) (not e!295538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32456 (_ BitVec 32)) Bool)

(assert (=> b!504783 (= res!305925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504784 () Bool)

(declare-fun Unit!15379 () Unit!15376)

(assert (=> b!504784 (= e!295533 Unit!15379)))

(declare-fun lt!229891 () Unit!15376)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15376)

(assert (=> b!504784 (= lt!229891 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229899 #b00000000000000000000000000000000 (index!18490 lt!229898) (x!47500 lt!229898) mask!3524))))

(declare-fun res!305922 () Bool)

(declare-fun lt!229890 () array!32456)

(declare-fun lt!229897 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32456 (_ BitVec 32)) SeekEntryResult!4075)

(assert (=> b!504784 (= res!305922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229899 lt!229897 lt!229890 mask!3524) (Intermediate!4075 false (index!18490 lt!229898) (x!47500 lt!229898))))))

(declare-fun e!295537 () Bool)

(assert (=> b!504784 (=> (not res!305922) (not e!295537))))

(assert (=> b!504784 e!295537))

(declare-fun b!504785 () Bool)

(assert (=> b!504785 (= e!295537 false)))

(declare-fun b!504786 () Bool)

(declare-fun res!305927 () Bool)

(assert (=> b!504786 (=> (not res!305927) (not e!295538))))

(declare-datatypes ((List!9766 0))(
  ( (Nil!9763) (Cons!9762 (h!10639 (_ BitVec 64)) (t!15994 List!9766)) )
))
(declare-fun arrayNoDuplicates!0 (array!32456 (_ BitVec 32) List!9766) Bool)

(assert (=> b!504786 (= res!305927 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9763))))

(declare-fun b!504787 () Bool)

(declare-fun e!295536 () Bool)

(assert (=> b!504787 (= e!295536 true)))

(declare-fun lt!229893 () SeekEntryResult!4075)

(assert (=> b!504787 (= lt!229893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229899 lt!229897 lt!229890 mask!3524))))

(declare-fun b!504788 () Bool)

(declare-fun res!305933 () Bool)

(assert (=> b!504788 (=> res!305933 e!295536)))

(assert (=> b!504788 (= res!305933 e!295539)))

(declare-fun res!305929 () Bool)

(assert (=> b!504788 (=> (not res!305929) (not e!295539))))

(assert (=> b!504788 (= res!305929 (bvsgt #b00000000000000000000000000000000 (x!47500 lt!229898)))))

(declare-fun b!504789 () Bool)

(declare-fun e!295534 () Bool)

(assert (=> b!504789 (= e!295538 (not e!295534))))

(declare-fun res!305923 () Bool)

(assert (=> b!504789 (=> res!305923 e!295534)))

(declare-fun lt!229892 () (_ BitVec 32))

(assert (=> b!504789 (= res!305923 (= lt!229898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229892 lt!229897 lt!229890 mask!3524)))))

(assert (=> b!504789 (= lt!229898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229899 (select (arr!15608 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504789 (= lt!229892 (toIndex!0 lt!229897 mask!3524))))

(assert (=> b!504789 (= lt!229897 (select (store (arr!15608 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504789 (= lt!229899 (toIndex!0 (select (arr!15608 a!3235) j!176) mask!3524))))

(assert (=> b!504789 (= lt!229890 (array!32457 (store (arr!15608 a!3235) i!1204 k!2280) (size!15972 a!3235)))))

(declare-fun e!295532 () Bool)

(assert (=> b!504789 e!295532))

(declare-fun res!305926 () Bool)

(assert (=> b!504789 (=> (not res!305926) (not e!295532))))

(assert (=> b!504789 (= res!305926 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229895 () Unit!15376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15376)

(assert (=> b!504789 (= lt!229895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504790 () Bool)

(declare-fun res!305920 () Bool)

(assert (=> b!504790 (=> (not res!305920) (not e!295531))))

(assert (=> b!504790 (= res!305920 (and (= (size!15972 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15972 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15972 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504791 () Bool)

(assert (=> b!504791 (= e!295532 (= (seekEntryOrOpen!0 (select (arr!15608 a!3235) j!176) a!3235 mask!3524) (Found!4075 j!176)))))

(declare-fun b!504792 () Bool)

(assert (=> b!504792 (= e!295534 e!295536)))

(declare-fun res!305919 () Bool)

(assert (=> b!504792 (=> res!305919 e!295536)))

(assert (=> b!504792 (= res!305919 (or (bvsgt (x!47500 lt!229898) #b01111111111111111111111111111110) (bvslt lt!229899 #b00000000000000000000000000000000) (bvsge lt!229899 (size!15972 a!3235)) (bvslt (index!18490 lt!229898) #b00000000000000000000000000000000) (bvsge (index!18490 lt!229898) (size!15972 a!3235)) (not (= lt!229898 (Intermediate!4075 false (index!18490 lt!229898) (x!47500 lt!229898))))))))

(assert (=> b!504792 (= (index!18490 lt!229898) i!1204)))

(declare-fun lt!229894 () Unit!15376)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15376)

(assert (=> b!504792 (= lt!229894 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229899 #b00000000000000000000000000000000 (index!18490 lt!229898) (x!47500 lt!229898) mask!3524))))

(assert (=> b!504792 (and (or (= (select (arr!15608 a!3235) (index!18490 lt!229898)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15608 a!3235) (index!18490 lt!229898)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15608 a!3235) (index!18490 lt!229898)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15608 a!3235) (index!18490 lt!229898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229900 () Unit!15376)

(assert (=> b!504792 (= lt!229900 e!295533)))

(declare-fun c!59708 () Bool)

(assert (=> b!504792 (= c!59708 (= (select (arr!15608 a!3235) (index!18490 lt!229898)) (select (arr!15608 a!3235) j!176)))))

(assert (=> b!504792 (and (bvslt (x!47500 lt!229898) #b01111111111111111111111111111110) (or (= (select (arr!15608 a!3235) (index!18490 lt!229898)) (select (arr!15608 a!3235) j!176)) (= (select (arr!15608 a!3235) (index!18490 lt!229898)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15608 a!3235) (index!18490 lt!229898)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504793 () Bool)

(declare-fun res!305928 () Bool)

(assert (=> b!504793 (=> (not res!305928) (not e!295531))))

(declare-fun arrayContainsKey!0 (array!32456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504793 (= res!305928 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504794 () Bool)

(declare-fun res!305930 () Bool)

(assert (=> b!504794 (=> res!305930 e!295534)))

(assert (=> b!504794 (= res!305930 (or (undefined!4887 lt!229898) (not (is-Intermediate!4075 lt!229898))))))

(assert (= (and start!45700 res!305932) b!504790))

(assert (= (and b!504790 res!305920) b!504781))

(assert (= (and b!504781 res!305921) b!504778))

(assert (= (and b!504778 res!305931) b!504793))

(assert (= (and b!504793 res!305928) b!504782))

(assert (= (and b!504782 res!305924) b!504783))

(assert (= (and b!504783 res!305925) b!504786))

(assert (= (and b!504786 res!305927) b!504789))

(assert (= (and b!504789 res!305926) b!504791))

(assert (= (and b!504789 (not res!305923)) b!504794))

(assert (= (and b!504794 (not res!305930)) b!504792))

(assert (= (and b!504792 c!59708) b!504784))

(assert (= (and b!504792 (not c!59708)) b!504779))

(assert (= (and b!504784 res!305922) b!504785))

(assert (= (and b!504792 (not res!305919)) b!504788))

(assert (= (and b!504788 res!305929) b!504780))

(assert (= (and b!504788 (not res!305933)) b!504787))

(declare-fun m!485483 () Bool)

(assert (=> b!504792 m!485483))

(declare-fun m!485485 () Bool)

(assert (=> b!504792 m!485485))

(declare-fun m!485487 () Bool)

(assert (=> b!504792 m!485487))

(declare-fun m!485489 () Bool)

(assert (=> b!504784 m!485489))

(declare-fun m!485491 () Bool)

(assert (=> b!504784 m!485491))

(assert (=> b!504781 m!485487))

(assert (=> b!504781 m!485487))

(declare-fun m!485493 () Bool)

(assert (=> b!504781 m!485493))

(declare-fun m!485495 () Bool)

(assert (=> b!504793 m!485495))

(assert (=> b!504791 m!485487))

(assert (=> b!504791 m!485487))

(declare-fun m!485497 () Bool)

(assert (=> b!504791 m!485497))

(assert (=> b!504787 m!485491))

(declare-fun m!485499 () Bool)

(assert (=> b!504786 m!485499))

(declare-fun m!485501 () Bool)

(assert (=> start!45700 m!485501))

(declare-fun m!485503 () Bool)

(assert (=> start!45700 m!485503))

(declare-fun m!485505 () Bool)

(assert (=> b!504789 m!485505))

(declare-fun m!485507 () Bool)

(assert (=> b!504789 m!485507))

(declare-fun m!485509 () Bool)

(assert (=> b!504789 m!485509))

(declare-fun m!485511 () Bool)

(assert (=> b!504789 m!485511))

(assert (=> b!504789 m!485487))

(declare-fun m!485513 () Bool)

(assert (=> b!504789 m!485513))

(assert (=> b!504789 m!485487))

(declare-fun m!485515 () Bool)

(assert (=> b!504789 m!485515))

(assert (=> b!504789 m!485487))

(declare-fun m!485517 () Bool)

(assert (=> b!504789 m!485517))

(declare-fun m!485519 () Bool)

(assert (=> b!504789 m!485519))

(declare-fun m!485521 () Bool)

(assert (=> b!504783 m!485521))

(declare-fun m!485523 () Bool)

(assert (=> b!504782 m!485523))

(assert (=> b!504780 m!485487))

(assert (=> b!504780 m!485487))

(declare-fun m!485525 () Bool)

(assert (=> b!504780 m!485525))

(declare-fun m!485527 () Bool)

(assert (=> b!504778 m!485527))

(push 1)

