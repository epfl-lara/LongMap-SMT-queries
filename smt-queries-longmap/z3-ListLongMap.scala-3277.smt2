; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45594 () Bool)

(assert start!45594)

(declare-fun b!502110 () Bool)

(declare-fun res!303677 () Bool)

(declare-fun e!294088 () Bool)

(assert (=> b!502110 (=> (not res!303677) (not e!294088))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32360 0))(
  ( (array!32361 (arr!15560 (Array (_ BitVec 32) (_ BitVec 64))) (size!15925 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32360)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502110 (= res!303677 (and (= (size!15925 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15925 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15925 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!294090 () Bool)

(declare-fun b!502111 () Bool)

(declare-datatypes ((SeekEntryResult!4024 0))(
  ( (MissingZero!4024 (index!18284 (_ BitVec 32))) (Found!4024 (index!18285 (_ BitVec 32))) (Intermediate!4024 (undefined!4836 Bool) (index!18286 (_ BitVec 32)) (x!47324 (_ BitVec 32))) (Undefined!4024) (MissingVacant!4024 (index!18287 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32360 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!502111 (= e!294090 (= (seekEntryOrOpen!0 (select (arr!15560 a!3235) j!176) a!3235 mask!3524) (Found!4024 j!176)))))

(declare-fun b!502112 () Bool)

(declare-fun res!303684 () Bool)

(assert (=> b!502112 (=> (not res!303684) (not e!294088))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502112 (= res!303684 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502113 () Bool)

(declare-fun res!303679 () Bool)

(assert (=> b!502113 (=> (not res!303679) (not e!294088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502113 (= res!303679 (validKeyInArray!0 (select (arr!15560 a!3235) j!176)))))

(declare-fun b!502114 () Bool)

(declare-fun res!303681 () Bool)

(declare-fun e!294096 () Bool)

(assert (=> b!502114 (=> (not res!303681) (not e!294096))))

(declare-datatypes ((List!9757 0))(
  ( (Nil!9754) (Cons!9753 (h!10630 (_ BitVec 64)) (t!15976 List!9757)) )
))
(declare-fun arrayNoDuplicates!0 (array!32360 (_ BitVec 32) List!9757) Bool)

(assert (=> b!502114 (= res!303681 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9754))))

(declare-fun res!303683 () Bool)

(assert (=> start!45594 (=> (not res!303683) (not e!294088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45594 (= res!303683 (validMask!0 mask!3524))))

(assert (=> start!45594 e!294088))

(assert (=> start!45594 true))

(declare-fun array_inv!11443 (array!32360) Bool)

(assert (=> start!45594 (array_inv!11443 a!3235)))

(declare-fun b!502115 () Bool)

(declare-fun res!303688 () Bool)

(assert (=> b!502115 (=> (not res!303688) (not e!294088))))

(assert (=> b!502115 (= res!303688 (validKeyInArray!0 k0!2280))))

(declare-fun b!502116 () Bool)

(declare-fun e!294095 () Bool)

(declare-fun e!294089 () Bool)

(assert (=> b!502116 (= e!294095 e!294089)))

(declare-fun res!303689 () Bool)

(assert (=> b!502116 (=> res!303689 e!294089)))

(declare-fun lt!228112 () SeekEntryResult!4024)

(declare-fun lt!228106 () (_ BitVec 32))

(assert (=> b!502116 (= res!303689 (or (bvsgt (x!47324 lt!228112) #b01111111111111111111111111111110) (bvslt lt!228106 #b00000000000000000000000000000000) (bvsge lt!228106 (size!15925 a!3235)) (bvslt (index!18286 lt!228112) #b00000000000000000000000000000000) (bvsge (index!18286 lt!228112) (size!15925 a!3235)) (not (= lt!228112 (Intermediate!4024 false (index!18286 lt!228112) (x!47324 lt!228112))))))))

(assert (=> b!502116 (= (index!18286 lt!228112) i!1204)))

(declare-datatypes ((Unit!15166 0))(
  ( (Unit!15167) )
))
(declare-fun lt!228107 () Unit!15166)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32360 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15166)

(assert (=> b!502116 (= lt!228107 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228106 #b00000000000000000000000000000000 (index!18286 lt!228112) (x!47324 lt!228112) mask!3524))))

(assert (=> b!502116 (and (or (= (select (arr!15560 a!3235) (index!18286 lt!228112)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15560 a!3235) (index!18286 lt!228112)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15560 a!3235) (index!18286 lt!228112)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15560 a!3235) (index!18286 lt!228112)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228110 () Unit!15166)

(declare-fun e!294094 () Unit!15166)

(assert (=> b!502116 (= lt!228110 e!294094)))

(declare-fun c!59496 () Bool)

(assert (=> b!502116 (= c!59496 (= (select (arr!15560 a!3235) (index!18286 lt!228112)) (select (arr!15560 a!3235) j!176)))))

(assert (=> b!502116 (and (bvslt (x!47324 lt!228112) #b01111111111111111111111111111110) (or (= (select (arr!15560 a!3235) (index!18286 lt!228112)) (select (arr!15560 a!3235) j!176)) (= (select (arr!15560 a!3235) (index!18286 lt!228112)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15560 a!3235) (index!18286 lt!228112)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!294092 () Bool)

(declare-fun b!502117 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32360 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!502117 (= e!294092 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228106 (index!18286 lt!228112) (select (arr!15560 a!3235) j!176) a!3235 mask!3524) (Found!4024 j!176))))))

(declare-fun b!502118 () Bool)

(declare-fun Unit!15168 () Unit!15166)

(assert (=> b!502118 (= e!294094 Unit!15168)))

(declare-fun b!502119 () Bool)

(declare-fun res!303685 () Bool)

(assert (=> b!502119 (=> res!303685 e!294095)))

(get-info :version)

(assert (=> b!502119 (= res!303685 (or (undefined!4836 lt!228112) (not ((_ is Intermediate!4024) lt!228112))))))

(declare-fun b!502120 () Bool)

(assert (=> b!502120 (= e!294096 (not e!294095))))

(declare-fun res!303682 () Bool)

(assert (=> b!502120 (=> res!303682 e!294095)))

(declare-fun lt!228115 () array!32360)

(declare-fun lt!228108 () (_ BitVec 32))

(declare-fun lt!228114 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32360 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!502120 (= res!303682 (= lt!228112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228108 lt!228114 lt!228115 mask!3524)))))

(assert (=> b!502120 (= lt!228112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228106 (select (arr!15560 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502120 (= lt!228108 (toIndex!0 lt!228114 mask!3524))))

(assert (=> b!502120 (= lt!228114 (select (store (arr!15560 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502120 (= lt!228106 (toIndex!0 (select (arr!15560 a!3235) j!176) mask!3524))))

(assert (=> b!502120 (= lt!228115 (array!32361 (store (arr!15560 a!3235) i!1204 k0!2280) (size!15925 a!3235)))))

(assert (=> b!502120 e!294090))

(declare-fun res!303686 () Bool)

(assert (=> b!502120 (=> (not res!303686) (not e!294090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32360 (_ BitVec 32)) Bool)

(assert (=> b!502120 (= res!303686 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228111 () Unit!15166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15166)

(assert (=> b!502120 (= lt!228111 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502121 () Bool)

(declare-fun res!303676 () Bool)

(assert (=> b!502121 (=> (not res!303676) (not e!294096))))

(assert (=> b!502121 (= res!303676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502122 () Bool)

(declare-fun res!303687 () Bool)

(assert (=> b!502122 (=> res!303687 e!294089)))

(assert (=> b!502122 (= res!303687 e!294092)))

(declare-fun res!303675 () Bool)

(assert (=> b!502122 (=> (not res!303675) (not e!294092))))

(assert (=> b!502122 (= res!303675 (bvsgt #b00000000000000000000000000000000 (x!47324 lt!228112)))))

(declare-fun b!502123 () Bool)

(declare-fun e!294091 () Bool)

(assert (=> b!502123 (= e!294091 false)))

(declare-fun b!502124 () Bool)

(assert (=> b!502124 (= e!294089 true)))

(declare-fun lt!228105 () SeekEntryResult!4024)

(assert (=> b!502124 (= lt!228105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228106 lt!228114 lt!228115 mask!3524))))

(declare-fun b!502125 () Bool)

(declare-fun Unit!15169 () Unit!15166)

(assert (=> b!502125 (= e!294094 Unit!15169)))

(declare-fun lt!228109 () Unit!15166)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32360 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15166)

(assert (=> b!502125 (= lt!228109 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228106 #b00000000000000000000000000000000 (index!18286 lt!228112) (x!47324 lt!228112) mask!3524))))

(declare-fun res!303680 () Bool)

(assert (=> b!502125 (= res!303680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228106 lt!228114 lt!228115 mask!3524) (Intermediate!4024 false (index!18286 lt!228112) (x!47324 lt!228112))))))

(assert (=> b!502125 (=> (not res!303680) (not e!294091))))

(assert (=> b!502125 e!294091))

(declare-fun b!502126 () Bool)

(assert (=> b!502126 (= e!294088 e!294096)))

(declare-fun res!303678 () Bool)

(assert (=> b!502126 (=> (not res!303678) (not e!294096))))

(declare-fun lt!228113 () SeekEntryResult!4024)

(assert (=> b!502126 (= res!303678 (or (= lt!228113 (MissingZero!4024 i!1204)) (= lt!228113 (MissingVacant!4024 i!1204))))))

(assert (=> b!502126 (= lt!228113 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45594 res!303683) b!502110))

(assert (= (and b!502110 res!303677) b!502113))

(assert (= (and b!502113 res!303679) b!502115))

(assert (= (and b!502115 res!303688) b!502112))

(assert (= (and b!502112 res!303684) b!502126))

(assert (= (and b!502126 res!303678) b!502121))

(assert (= (and b!502121 res!303676) b!502114))

(assert (= (and b!502114 res!303681) b!502120))

(assert (= (and b!502120 res!303686) b!502111))

(assert (= (and b!502120 (not res!303682)) b!502119))

(assert (= (and b!502119 (not res!303685)) b!502116))

(assert (= (and b!502116 c!59496) b!502125))

(assert (= (and b!502116 (not c!59496)) b!502118))

(assert (= (and b!502125 res!303680) b!502123))

(assert (= (and b!502116 (not res!303689)) b!502122))

(assert (= (and b!502122 res!303675) b!502117))

(assert (= (and b!502122 (not res!303687)) b!502124))

(declare-fun m!482569 () Bool)

(assert (=> b!502112 m!482569))

(declare-fun m!482571 () Bool)

(assert (=> b!502126 m!482571))

(declare-fun m!482573 () Bool)

(assert (=> b!502117 m!482573))

(assert (=> b!502117 m!482573))

(declare-fun m!482575 () Bool)

(assert (=> b!502117 m!482575))

(declare-fun m!482577 () Bool)

(assert (=> start!45594 m!482577))

(declare-fun m!482579 () Bool)

(assert (=> start!45594 m!482579))

(declare-fun m!482581 () Bool)

(assert (=> b!502114 m!482581))

(assert (=> b!502111 m!482573))

(assert (=> b!502111 m!482573))

(declare-fun m!482583 () Bool)

(assert (=> b!502111 m!482583))

(declare-fun m!482585 () Bool)

(assert (=> b!502121 m!482585))

(declare-fun m!482587 () Bool)

(assert (=> b!502116 m!482587))

(declare-fun m!482589 () Bool)

(assert (=> b!502116 m!482589))

(assert (=> b!502116 m!482573))

(declare-fun m!482591 () Bool)

(assert (=> b!502124 m!482591))

(assert (=> b!502113 m!482573))

(assert (=> b!502113 m!482573))

(declare-fun m!482593 () Bool)

(assert (=> b!502113 m!482593))

(declare-fun m!482595 () Bool)

(assert (=> b!502125 m!482595))

(assert (=> b!502125 m!482591))

(declare-fun m!482597 () Bool)

(assert (=> b!502115 m!482597))

(declare-fun m!482599 () Bool)

(assert (=> b!502120 m!482599))

(declare-fun m!482601 () Bool)

(assert (=> b!502120 m!482601))

(declare-fun m!482603 () Bool)

(assert (=> b!502120 m!482603))

(declare-fun m!482605 () Bool)

(assert (=> b!502120 m!482605))

(assert (=> b!502120 m!482573))

(declare-fun m!482607 () Bool)

(assert (=> b!502120 m!482607))

(assert (=> b!502120 m!482573))

(declare-fun m!482609 () Bool)

(assert (=> b!502120 m!482609))

(declare-fun m!482611 () Bool)

(assert (=> b!502120 m!482611))

(assert (=> b!502120 m!482573))

(declare-fun m!482613 () Bool)

(assert (=> b!502120 m!482613))

(check-sat (not b!502126) (not b!502125) (not b!502120) (not b!502117) (not b!502113) (not b!502114) (not b!502124) (not start!45594) (not b!502112) (not b!502115) (not b!502116) (not b!502111) (not b!502121))
(check-sat)
