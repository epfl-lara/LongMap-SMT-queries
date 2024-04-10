; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45664 () Bool)

(assert start!45664)

(declare-fun b!503860 () Bool)

(declare-fun res!305116 () Bool)

(declare-fun e!295048 () Bool)

(assert (=> b!503860 (=> res!305116 e!295048)))

(declare-fun e!295052 () Bool)

(assert (=> b!503860 (= res!305116 e!295052)))

(declare-fun res!305115 () Bool)

(assert (=> b!503860 (=> (not res!305115) (not e!295052))))

(declare-datatypes ((SeekEntryResult!4057 0))(
  ( (MissingZero!4057 (index!18416 (_ BitVec 32))) (Found!4057 (index!18417 (_ BitVec 32))) (Intermediate!4057 (undefined!4869 Bool) (index!18418 (_ BitVec 32)) (x!47434 (_ BitVec 32))) (Undefined!4057) (MissingVacant!4057 (index!18419 (_ BitVec 32))) )
))
(declare-fun lt!229305 () SeekEntryResult!4057)

(assert (=> b!503860 (= res!305115 (bvsgt #b00000000000000000000000000000000 (x!47434 lt!229305)))))

(declare-fun b!503861 () Bool)

(declare-fun res!305110 () Bool)

(declare-fun e!295047 () Bool)

(assert (=> b!503861 (=> (not res!305110) (not e!295047))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503861 (= res!305110 (validKeyInArray!0 k!2280))))

(declare-fun lt!229297 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32420 0))(
  ( (array!32421 (arr!15590 (Array (_ BitVec 32) (_ BitVec 64))) (size!15954 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32420)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!503862 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32420 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!503862 (= e!295052 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229297 (index!18418 lt!229305) (select (arr!15590 a!3235) j!176) a!3235 mask!3524) (Found!4057 j!176))))))

(declare-fun b!503863 () Bool)

(declare-fun e!295046 () Bool)

(assert (=> b!503863 (= e!295046 e!295048)))

(declare-fun res!305123 () Bool)

(assert (=> b!503863 (=> res!305123 e!295048)))

(assert (=> b!503863 (= res!305123 (or (bvsgt (x!47434 lt!229305) #b01111111111111111111111111111110) (bvslt lt!229297 #b00000000000000000000000000000000) (bvsge lt!229297 (size!15954 a!3235)) (bvslt (index!18418 lt!229305) #b00000000000000000000000000000000) (bvsge (index!18418 lt!229305) (size!15954 a!3235)) (not (= lt!229305 (Intermediate!4057 false (index!18418 lt!229305) (x!47434 lt!229305))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503863 (= (index!18418 lt!229305) i!1204)))

(declare-datatypes ((Unit!15304 0))(
  ( (Unit!15305) )
))
(declare-fun lt!229296 () Unit!15304)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32420 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15304)

(assert (=> b!503863 (= lt!229296 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229297 #b00000000000000000000000000000000 (index!18418 lt!229305) (x!47434 lt!229305) mask!3524))))

(assert (=> b!503863 (and (or (= (select (arr!15590 a!3235) (index!18418 lt!229305)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15590 a!3235) (index!18418 lt!229305)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15590 a!3235) (index!18418 lt!229305)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15590 a!3235) (index!18418 lt!229305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229304 () Unit!15304)

(declare-fun e!295053 () Unit!15304)

(assert (=> b!503863 (= lt!229304 e!295053)))

(declare-fun c!59654 () Bool)

(assert (=> b!503863 (= c!59654 (= (select (arr!15590 a!3235) (index!18418 lt!229305)) (select (arr!15590 a!3235) j!176)))))

(assert (=> b!503863 (and (bvslt (x!47434 lt!229305) #b01111111111111111111111111111110) (or (= (select (arr!15590 a!3235) (index!18418 lt!229305)) (select (arr!15590 a!3235) j!176)) (= (select (arr!15590 a!3235) (index!18418 lt!229305)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15590 a!3235) (index!18418 lt!229305)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!305117 () Bool)

(assert (=> start!45664 (=> (not res!305117) (not e!295047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45664 (= res!305117 (validMask!0 mask!3524))))

(assert (=> start!45664 e!295047))

(assert (=> start!45664 true))

(declare-fun array_inv!11386 (array!32420) Bool)

(assert (=> start!45664 (array_inv!11386 a!3235)))

(declare-fun b!503864 () Bool)

(declare-fun res!305113 () Bool)

(assert (=> b!503864 (=> (not res!305113) (not e!295047))))

(assert (=> b!503864 (= res!305113 (and (= (size!15954 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15954 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15954 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503865 () Bool)

(declare-fun res!305114 () Bool)

(assert (=> b!503865 (=> (not res!305114) (not e!295047))))

(assert (=> b!503865 (= res!305114 (validKeyInArray!0 (select (arr!15590 a!3235) j!176)))))

(declare-fun b!503866 () Bool)

(declare-fun e!295050 () Bool)

(assert (=> b!503866 (= e!295050 (not e!295046))))

(declare-fun res!305109 () Bool)

(assert (=> b!503866 (=> res!305109 e!295046)))

(declare-fun lt!229300 () array!32420)

(declare-fun lt!229299 () (_ BitVec 64))

(declare-fun lt!229302 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32420 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!503866 (= res!305109 (= lt!229305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229302 lt!229299 lt!229300 mask!3524)))))

(assert (=> b!503866 (= lt!229305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229297 (select (arr!15590 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503866 (= lt!229302 (toIndex!0 lt!229299 mask!3524))))

(assert (=> b!503866 (= lt!229299 (select (store (arr!15590 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503866 (= lt!229297 (toIndex!0 (select (arr!15590 a!3235) j!176) mask!3524))))

(assert (=> b!503866 (= lt!229300 (array!32421 (store (arr!15590 a!3235) i!1204 k!2280) (size!15954 a!3235)))))

(declare-fun e!295049 () Bool)

(assert (=> b!503866 e!295049))

(declare-fun res!305111 () Bool)

(assert (=> b!503866 (=> (not res!305111) (not e!295049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32420 (_ BitVec 32)) Bool)

(assert (=> b!503866 (= res!305111 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229306 () Unit!15304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15304)

(assert (=> b!503866 (= lt!229306 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503867 () Bool)

(declare-fun Unit!15306 () Unit!15304)

(assert (=> b!503867 (= e!295053 Unit!15306)))

(declare-fun lt!229301 () Unit!15304)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32420 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15304)

(assert (=> b!503867 (= lt!229301 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229297 #b00000000000000000000000000000000 (index!18418 lt!229305) (x!47434 lt!229305) mask!3524))))

(declare-fun res!305118 () Bool)

(assert (=> b!503867 (= res!305118 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229297 lt!229299 lt!229300 mask!3524) (Intermediate!4057 false (index!18418 lt!229305) (x!47434 lt!229305))))))

(declare-fun e!295051 () Bool)

(assert (=> b!503867 (=> (not res!305118) (not e!295051))))

(assert (=> b!503867 e!295051))

(declare-fun b!503868 () Bool)

(assert (=> b!503868 (= e!295051 false)))

(declare-fun b!503869 () Bool)

(declare-fun res!305121 () Bool)

(assert (=> b!503869 (=> res!305121 e!295046)))

(assert (=> b!503869 (= res!305121 (or (undefined!4869 lt!229305) (not (is-Intermediate!4057 lt!229305))))))

(declare-fun b!503870 () Bool)

(declare-fun res!305120 () Bool)

(assert (=> b!503870 (=> (not res!305120) (not e!295050))))

(assert (=> b!503870 (= res!305120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503871 () Bool)

(declare-fun res!305119 () Bool)

(assert (=> b!503871 (=> (not res!305119) (not e!295047))))

(declare-fun arrayContainsKey!0 (array!32420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503871 (= res!305119 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503872 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32420 (_ BitVec 32)) SeekEntryResult!4057)

(assert (=> b!503872 (= e!295049 (= (seekEntryOrOpen!0 (select (arr!15590 a!3235) j!176) a!3235 mask!3524) (Found!4057 j!176)))))

(declare-fun b!503873 () Bool)

(declare-fun res!305112 () Bool)

(assert (=> b!503873 (=> (not res!305112) (not e!295050))))

(declare-datatypes ((List!9748 0))(
  ( (Nil!9745) (Cons!9744 (h!10621 (_ BitVec 64)) (t!15976 List!9748)) )
))
(declare-fun arrayNoDuplicates!0 (array!32420 (_ BitVec 32) List!9748) Bool)

(assert (=> b!503873 (= res!305112 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9745))))

(declare-fun b!503874 () Bool)

(assert (=> b!503874 (= e!295047 e!295050)))

(declare-fun res!305122 () Bool)

(assert (=> b!503874 (=> (not res!305122) (not e!295050))))

(declare-fun lt!229298 () SeekEntryResult!4057)

(assert (=> b!503874 (= res!305122 (or (= lt!229298 (MissingZero!4057 i!1204)) (= lt!229298 (MissingVacant!4057 i!1204))))))

(assert (=> b!503874 (= lt!229298 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503875 () Bool)

(assert (=> b!503875 (= e!295048 true)))

(declare-fun lt!229303 () SeekEntryResult!4057)

(assert (=> b!503875 (= lt!229303 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229297 lt!229299 lt!229300 mask!3524))))

(declare-fun b!503876 () Bool)

(declare-fun Unit!15307 () Unit!15304)

(assert (=> b!503876 (= e!295053 Unit!15307)))

(assert (= (and start!45664 res!305117) b!503864))

(assert (= (and b!503864 res!305113) b!503865))

(assert (= (and b!503865 res!305114) b!503861))

(assert (= (and b!503861 res!305110) b!503871))

(assert (= (and b!503871 res!305119) b!503874))

(assert (= (and b!503874 res!305122) b!503870))

(assert (= (and b!503870 res!305120) b!503873))

(assert (= (and b!503873 res!305112) b!503866))

(assert (= (and b!503866 res!305111) b!503872))

(assert (= (and b!503866 (not res!305109)) b!503869))

(assert (= (and b!503869 (not res!305121)) b!503863))

(assert (= (and b!503863 c!59654) b!503867))

(assert (= (and b!503863 (not c!59654)) b!503876))

(assert (= (and b!503867 res!305118) b!503868))

(assert (= (and b!503863 (not res!305123)) b!503860))

(assert (= (and b!503860 res!305115) b!503862))

(assert (= (and b!503860 (not res!305116)) b!503875))

(declare-fun m!484655 () Bool)

(assert (=> b!503870 m!484655))

(declare-fun m!484657 () Bool)

(assert (=> b!503871 m!484657))

(declare-fun m!484659 () Bool)

(assert (=> b!503872 m!484659))

(assert (=> b!503872 m!484659))

(declare-fun m!484661 () Bool)

(assert (=> b!503872 m!484661))

(declare-fun m!484663 () Bool)

(assert (=> b!503863 m!484663))

(declare-fun m!484665 () Bool)

(assert (=> b!503863 m!484665))

(assert (=> b!503863 m!484659))

(declare-fun m!484667 () Bool)

(assert (=> b!503867 m!484667))

(declare-fun m!484669 () Bool)

(assert (=> b!503867 m!484669))

(assert (=> b!503865 m!484659))

(assert (=> b!503865 m!484659))

(declare-fun m!484671 () Bool)

(assert (=> b!503865 m!484671))

(declare-fun m!484673 () Bool)

(assert (=> b!503873 m!484673))

(assert (=> b!503875 m!484669))

(declare-fun m!484675 () Bool)

(assert (=> b!503874 m!484675))

(declare-fun m!484677 () Bool)

(assert (=> start!45664 m!484677))

(declare-fun m!484679 () Bool)

(assert (=> start!45664 m!484679))

(assert (=> b!503862 m!484659))

(assert (=> b!503862 m!484659))

(declare-fun m!484681 () Bool)

(assert (=> b!503862 m!484681))

(declare-fun m!484683 () Bool)

(assert (=> b!503866 m!484683))

(declare-fun m!484685 () Bool)

(assert (=> b!503866 m!484685))

(declare-fun m!484687 () Bool)

(assert (=> b!503866 m!484687))

(declare-fun m!484689 () Bool)

(assert (=> b!503866 m!484689))

(declare-fun m!484691 () Bool)

(assert (=> b!503866 m!484691))

(assert (=> b!503866 m!484659))

(declare-fun m!484693 () Bool)

(assert (=> b!503866 m!484693))

(assert (=> b!503866 m!484659))

(declare-fun m!484695 () Bool)

(assert (=> b!503866 m!484695))

(assert (=> b!503866 m!484659))

(declare-fun m!484697 () Bool)

(assert (=> b!503866 m!484697))

(declare-fun m!484699 () Bool)

(assert (=> b!503861 m!484699))

(push 1)

