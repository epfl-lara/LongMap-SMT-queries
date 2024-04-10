; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45698 () Bool)

(assert start!45698)

(declare-fun b!504727 () Bool)

(declare-fun res!305885 () Bool)

(declare-fun e!295509 () Bool)

(assert (=> b!504727 (=> (not res!305885) (not e!295509))))

(declare-datatypes ((array!32454 0))(
  ( (array!32455 (arr!15607 (Array (_ BitVec 32) (_ BitVec 64))) (size!15971 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32454)

(declare-datatypes ((List!9765 0))(
  ( (Nil!9762) (Cons!9761 (h!10638 (_ BitVec 64)) (t!15993 List!9765)) )
))
(declare-fun arrayNoDuplicates!0 (array!32454 (_ BitVec 32) List!9765) Bool)

(assert (=> b!504727 (= res!305885 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9762))))

(declare-fun b!504728 () Bool)

(declare-fun res!305876 () Bool)

(assert (=> b!504728 (=> (not res!305876) (not e!295509))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32454 (_ BitVec 32)) Bool)

(assert (=> b!504728 (= res!305876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504729 () Bool)

(declare-fun res!305886 () Bool)

(declare-fun e!295510 () Bool)

(assert (=> b!504729 (=> res!305886 e!295510)))

(declare-fun e!295507 () Bool)

(assert (=> b!504729 (= res!305886 e!295507)))

(declare-fun res!305875 () Bool)

(assert (=> b!504729 (=> (not res!305875) (not e!295507))))

(declare-datatypes ((SeekEntryResult!4074 0))(
  ( (MissingZero!4074 (index!18484 (_ BitVec 32))) (Found!4074 (index!18485 (_ BitVec 32))) (Intermediate!4074 (undefined!4886 Bool) (index!18486 (_ BitVec 32)) (x!47499 (_ BitVec 32))) (Undefined!4074) (MissingVacant!4074 (index!18487 (_ BitVec 32))) )
))
(declare-fun lt!229858 () SeekEntryResult!4074)

(assert (=> b!504729 (= res!305875 (bvsgt #b00000000000000000000000000000000 (x!47499 lt!229858)))))

(declare-fun b!504730 () Bool)

(declare-fun res!305878 () Bool)

(declare-fun e!295508 () Bool)

(assert (=> b!504730 (=> res!305878 e!295508)))

(get-info :version)

(assert (=> b!504730 (= res!305878 (or (undefined!4886 lt!229858) (not ((_ is Intermediate!4074) lt!229858))))))

(declare-fun b!504731 () Bool)

(declare-fun res!305883 () Bool)

(declare-fun e!295511 () Bool)

(assert (=> b!504731 (=> (not res!305883) (not e!295511))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504731 (= res!305883 (validKeyInArray!0 k0!2280))))

(declare-fun lt!229867 () (_ BitVec 32))

(declare-fun b!504732 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32454 (_ BitVec 32)) SeekEntryResult!4074)

(assert (=> b!504732 (= e!295507 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229867 (index!18486 lt!229858) (select (arr!15607 a!3235) j!176) a!3235 mask!3524) (Found!4074 j!176))))))

(declare-fun b!504733 () Bool)

(declare-fun res!305884 () Bool)

(assert (=> b!504733 (=> (not res!305884) (not e!295511))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504733 (= res!305884 (and (= (size!15971 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15971 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15971 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!305882 () Bool)

(assert (=> start!45698 (=> (not res!305882) (not e!295511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45698 (= res!305882 (validMask!0 mask!3524))))

(assert (=> start!45698 e!295511))

(assert (=> start!45698 true))

(declare-fun array_inv!11403 (array!32454) Bool)

(assert (=> start!45698 (array_inv!11403 a!3235)))

(declare-fun b!504734 () Bool)

(assert (=> b!504734 (= e!295510 true)))

(declare-fun lt!229865 () array!32454)

(declare-fun lt!229857 () SeekEntryResult!4074)

(declare-fun lt!229861 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32454 (_ BitVec 32)) SeekEntryResult!4074)

(assert (=> b!504734 (= lt!229857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229867 lt!229861 lt!229865 mask!3524))))

(declare-fun b!504735 () Bool)

(declare-fun res!305877 () Bool)

(assert (=> b!504735 (=> (not res!305877) (not e!295511))))

(assert (=> b!504735 (= res!305877 (validKeyInArray!0 (select (arr!15607 a!3235) j!176)))))

(declare-fun b!504736 () Bool)

(assert (=> b!504736 (= e!295509 (not e!295508))))

(declare-fun res!305881 () Bool)

(assert (=> b!504736 (=> res!305881 e!295508)))

(declare-fun lt!229864 () (_ BitVec 32))

(assert (=> b!504736 (= res!305881 (= lt!229858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229864 lt!229861 lt!229865 mask!3524)))))

(assert (=> b!504736 (= lt!229858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229867 (select (arr!15607 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504736 (= lt!229864 (toIndex!0 lt!229861 mask!3524))))

(assert (=> b!504736 (= lt!229861 (select (store (arr!15607 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504736 (= lt!229867 (toIndex!0 (select (arr!15607 a!3235) j!176) mask!3524))))

(assert (=> b!504736 (= lt!229865 (array!32455 (store (arr!15607 a!3235) i!1204 k0!2280) (size!15971 a!3235)))))

(declare-fun e!295506 () Bool)

(assert (=> b!504736 e!295506))

(declare-fun res!305874 () Bool)

(assert (=> b!504736 (=> (not res!305874) (not e!295506))))

(assert (=> b!504736 (= res!305874 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15372 0))(
  ( (Unit!15373) )
))
(declare-fun lt!229866 () Unit!15372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15372)

(assert (=> b!504736 (= lt!229866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504737 () Bool)

(declare-fun e!295505 () Bool)

(assert (=> b!504737 (= e!295505 false)))

(declare-fun b!504738 () Bool)

(declare-fun e!295504 () Unit!15372)

(declare-fun Unit!15374 () Unit!15372)

(assert (=> b!504738 (= e!295504 Unit!15374)))

(declare-fun b!504739 () Bool)

(declare-fun res!305887 () Bool)

(assert (=> b!504739 (=> (not res!305887) (not e!295511))))

(declare-fun arrayContainsKey!0 (array!32454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504739 (= res!305887 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504740 () Bool)

(assert (=> b!504740 (= e!295508 e!295510)))

(declare-fun res!305880 () Bool)

(assert (=> b!504740 (=> res!305880 e!295510)))

(assert (=> b!504740 (= res!305880 (or (bvsgt (x!47499 lt!229858) #b01111111111111111111111111111110) (bvslt lt!229867 #b00000000000000000000000000000000) (bvsge lt!229867 (size!15971 a!3235)) (bvslt (index!18486 lt!229858) #b00000000000000000000000000000000) (bvsge (index!18486 lt!229858) (size!15971 a!3235)) (not (= lt!229858 (Intermediate!4074 false (index!18486 lt!229858) (x!47499 lt!229858))))))))

(assert (=> b!504740 (= (index!18486 lt!229858) i!1204)))

(declare-fun lt!229863 () Unit!15372)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32454 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15372)

(assert (=> b!504740 (= lt!229863 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229867 #b00000000000000000000000000000000 (index!18486 lt!229858) (x!47499 lt!229858) mask!3524))))

(assert (=> b!504740 (and (or (= (select (arr!15607 a!3235) (index!18486 lt!229858)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15607 a!3235) (index!18486 lt!229858)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15607 a!3235) (index!18486 lt!229858)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15607 a!3235) (index!18486 lt!229858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229862 () Unit!15372)

(assert (=> b!504740 (= lt!229862 e!295504)))

(declare-fun c!59705 () Bool)

(assert (=> b!504740 (= c!59705 (= (select (arr!15607 a!3235) (index!18486 lt!229858)) (select (arr!15607 a!3235) j!176)))))

(assert (=> b!504740 (and (bvslt (x!47499 lt!229858) #b01111111111111111111111111111110) (or (= (select (arr!15607 a!3235) (index!18486 lt!229858)) (select (arr!15607 a!3235) j!176)) (= (select (arr!15607 a!3235) (index!18486 lt!229858)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15607 a!3235) (index!18486 lt!229858)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504741 () Bool)

(assert (=> b!504741 (= e!295511 e!295509)))

(declare-fun res!305888 () Bool)

(assert (=> b!504741 (=> (not res!305888) (not e!295509))))

(declare-fun lt!229860 () SeekEntryResult!4074)

(assert (=> b!504741 (= res!305888 (or (= lt!229860 (MissingZero!4074 i!1204)) (= lt!229860 (MissingVacant!4074 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32454 (_ BitVec 32)) SeekEntryResult!4074)

(assert (=> b!504741 (= lt!229860 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504742 () Bool)

(declare-fun Unit!15375 () Unit!15372)

(assert (=> b!504742 (= e!295504 Unit!15375)))

(declare-fun lt!229859 () Unit!15372)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32454 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15372)

(assert (=> b!504742 (= lt!229859 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229867 #b00000000000000000000000000000000 (index!18486 lt!229858) (x!47499 lt!229858) mask!3524))))

(declare-fun res!305879 () Bool)

(assert (=> b!504742 (= res!305879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229867 lt!229861 lt!229865 mask!3524) (Intermediate!4074 false (index!18486 lt!229858) (x!47499 lt!229858))))))

(assert (=> b!504742 (=> (not res!305879) (not e!295505))))

(assert (=> b!504742 e!295505))

(declare-fun b!504743 () Bool)

(assert (=> b!504743 (= e!295506 (= (seekEntryOrOpen!0 (select (arr!15607 a!3235) j!176) a!3235 mask!3524) (Found!4074 j!176)))))

(assert (= (and start!45698 res!305882) b!504733))

(assert (= (and b!504733 res!305884) b!504735))

(assert (= (and b!504735 res!305877) b!504731))

(assert (= (and b!504731 res!305883) b!504739))

(assert (= (and b!504739 res!305887) b!504741))

(assert (= (and b!504741 res!305888) b!504728))

(assert (= (and b!504728 res!305876) b!504727))

(assert (= (and b!504727 res!305885) b!504736))

(assert (= (and b!504736 res!305874) b!504743))

(assert (= (and b!504736 (not res!305881)) b!504730))

(assert (= (and b!504730 (not res!305878)) b!504740))

(assert (= (and b!504740 c!59705) b!504742))

(assert (= (and b!504740 (not c!59705)) b!504738))

(assert (= (and b!504742 res!305879) b!504737))

(assert (= (and b!504740 (not res!305880)) b!504729))

(assert (= (and b!504729 res!305875) b!504732))

(assert (= (and b!504729 (not res!305886)) b!504734))

(declare-fun m!485437 () Bool)

(assert (=> b!504739 m!485437))

(declare-fun m!485439 () Bool)

(assert (=> b!504732 m!485439))

(assert (=> b!504732 m!485439))

(declare-fun m!485441 () Bool)

(assert (=> b!504732 m!485441))

(declare-fun m!485443 () Bool)

(assert (=> b!504731 m!485443))

(declare-fun m!485445 () Bool)

(assert (=> b!504736 m!485445))

(declare-fun m!485447 () Bool)

(assert (=> b!504736 m!485447))

(declare-fun m!485449 () Bool)

(assert (=> b!504736 m!485449))

(declare-fun m!485451 () Bool)

(assert (=> b!504736 m!485451))

(assert (=> b!504736 m!485439))

(declare-fun m!485453 () Bool)

(assert (=> b!504736 m!485453))

(assert (=> b!504736 m!485439))

(declare-fun m!485455 () Bool)

(assert (=> b!504736 m!485455))

(assert (=> b!504736 m!485439))

(declare-fun m!485457 () Bool)

(assert (=> b!504736 m!485457))

(declare-fun m!485459 () Bool)

(assert (=> b!504736 m!485459))

(declare-fun m!485461 () Bool)

(assert (=> b!504727 m!485461))

(declare-fun m!485463 () Bool)

(assert (=> b!504742 m!485463))

(declare-fun m!485465 () Bool)

(assert (=> b!504742 m!485465))

(assert (=> b!504735 m!485439))

(assert (=> b!504735 m!485439))

(declare-fun m!485467 () Bool)

(assert (=> b!504735 m!485467))

(assert (=> b!504743 m!485439))

(assert (=> b!504743 m!485439))

(declare-fun m!485469 () Bool)

(assert (=> b!504743 m!485469))

(declare-fun m!485471 () Bool)

(assert (=> b!504741 m!485471))

(declare-fun m!485473 () Bool)

(assert (=> b!504740 m!485473))

(declare-fun m!485475 () Bool)

(assert (=> b!504740 m!485475))

(assert (=> b!504740 m!485439))

(declare-fun m!485477 () Bool)

(assert (=> start!45698 m!485477))

(declare-fun m!485479 () Bool)

(assert (=> start!45698 m!485479))

(assert (=> b!504734 m!485465))

(declare-fun m!485481 () Bool)

(assert (=> b!504728 m!485481))

(check-sat (not b!504743) (not b!504739) (not b!504736) (not b!504732) (not b!504740) (not b!504727) (not b!504742) (not start!45698) (not b!504735) (not b!504728) (not b!504731) (not b!504734) (not b!504741))
(check-sat)
