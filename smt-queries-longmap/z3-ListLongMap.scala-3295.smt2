; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45702 () Bool)

(assert start!45702)

(declare-fun b!504865 () Bool)

(declare-fun e!295554 () Bool)

(assert (=> b!504865 (= e!295554 false)))

(declare-fun b!504866 () Bool)

(declare-fun res!306107 () Bool)

(declare-fun e!295549 () Bool)

(assert (=> b!504866 (=> res!306107 e!295549)))

(declare-fun e!295547 () Bool)

(assert (=> b!504866 (= res!306107 e!295547)))

(declare-fun res!306108 () Bool)

(assert (=> b!504866 (=> (not res!306108) (not e!295547))))

(declare-datatypes ((SeekEntryResult!4078 0))(
  ( (MissingZero!4078 (index!18500 (_ BitVec 32))) (Found!4078 (index!18501 (_ BitVec 32))) (Intermediate!4078 (undefined!4890 Bool) (index!18502 (_ BitVec 32)) (x!47522 (_ BitVec 32))) (Undefined!4078) (MissingVacant!4078 (index!18503 (_ BitVec 32))) )
))
(declare-fun lt!229891 () SeekEntryResult!4078)

(assert (=> b!504866 (= res!306108 (bvsgt #b00000000000000000000000000000000 (x!47522 lt!229891)))))

(declare-fun b!504867 () Bool)

(declare-fun res!306117 () Bool)

(declare-fun e!295553 () Bool)

(assert (=> b!504867 (=> (not res!306117) (not e!295553))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504867 (= res!306117 (validKeyInArray!0 k0!2280))))

(declare-fun b!504868 () Bool)

(declare-fun res!306112 () Bool)

(declare-fun e!295550 () Bool)

(assert (=> b!504868 (=> (not res!306112) (not e!295550))))

(declare-datatypes ((array!32468 0))(
  ( (array!32469 (arr!15614 (Array (_ BitVec 32) (_ BitVec 64))) (size!15979 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32468)

(declare-datatypes ((List!9811 0))(
  ( (Nil!9808) (Cons!9807 (h!10684 (_ BitVec 64)) (t!16030 List!9811)) )
))
(declare-fun arrayNoDuplicates!0 (array!32468 (_ BitVec 32) List!9811) Bool)

(assert (=> b!504868 (= res!306112 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9808))))

(declare-fun b!504869 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229892 () SeekEntryResult!4078)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!229896 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32468 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!504869 (= e!295547 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229896 (index!18502 lt!229891) (select (arr!15614 a!3235) j!176) a!3235 mask!3524) lt!229892)))))

(declare-fun b!504870 () Bool)

(declare-datatypes ((Unit!15382 0))(
  ( (Unit!15383) )
))
(declare-fun e!295548 () Unit!15382)

(declare-fun Unit!15384 () Unit!15382)

(assert (=> b!504870 (= e!295548 Unit!15384)))

(declare-fun b!504871 () Bool)

(declare-fun res!306111 () Bool)

(assert (=> b!504871 (=> (not res!306111) (not e!295553))))

(assert (=> b!504871 (= res!306111 (validKeyInArray!0 (select (arr!15614 a!3235) j!176)))))

(declare-fun b!504872 () Bool)

(declare-fun e!295552 () Bool)

(assert (=> b!504872 (= e!295550 (not e!295552))))

(declare-fun res!306106 () Bool)

(assert (=> b!504872 (=> res!306106 e!295552)))

(declare-fun lt!229902 () SeekEntryResult!4078)

(get-info :version)

(assert (=> b!504872 (= res!306106 (or (= lt!229891 lt!229902) (undefined!4890 lt!229891) (not ((_ is Intermediate!4078) lt!229891))))))

(declare-fun lt!229894 () (_ BitVec 32))

(declare-fun lt!229901 () (_ BitVec 64))

(declare-fun lt!229903 () array!32468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32468 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!504872 (= lt!229902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229894 lt!229901 lt!229903 mask!3524))))

(assert (=> b!504872 (= lt!229891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229896 (select (arr!15614 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504872 (= lt!229894 (toIndex!0 lt!229901 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504872 (= lt!229901 (select (store (arr!15614 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504872 (= lt!229896 (toIndex!0 (select (arr!15614 a!3235) j!176) mask!3524))))

(assert (=> b!504872 (= lt!229903 (array!32469 (store (arr!15614 a!3235) i!1204 k0!2280) (size!15979 a!3235)))))

(assert (=> b!504872 (= lt!229892 (Found!4078 j!176))))

(declare-fun e!295546 () Bool)

(assert (=> b!504872 e!295546))

(declare-fun res!306110 () Bool)

(assert (=> b!504872 (=> (not res!306110) (not e!295546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32468 (_ BitVec 32)) Bool)

(assert (=> b!504872 (= res!306110 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229900 () Unit!15382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15382)

(assert (=> b!504872 (= lt!229900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504873 () Bool)

(assert (=> b!504873 (= e!295553 e!295550)))

(declare-fun res!306115 () Bool)

(assert (=> b!504873 (=> (not res!306115) (not e!295550))))

(declare-fun lt!229897 () SeekEntryResult!4078)

(assert (=> b!504873 (= res!306115 (or (= lt!229897 (MissingZero!4078 i!1204)) (= lt!229897 (MissingVacant!4078 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32468 (_ BitVec 32)) SeekEntryResult!4078)

(assert (=> b!504873 (= lt!229897 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504874 () Bool)

(declare-fun res!306114 () Bool)

(assert (=> b!504874 (=> (not res!306114) (not e!295553))))

(assert (=> b!504874 (= res!306114 (and (= (size!15979 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15979 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15979 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!306105 () Bool)

(assert (=> start!45702 (=> (not res!306105) (not e!295553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45702 (= res!306105 (validMask!0 mask!3524))))

(assert (=> start!45702 e!295553))

(assert (=> start!45702 true))

(declare-fun array_inv!11497 (array!32468) Bool)

(assert (=> start!45702 (array_inv!11497 a!3235)))

(declare-fun b!504864 () Bool)

(declare-fun res!306118 () Bool)

(assert (=> b!504864 (=> (not res!306118) (not e!295553))))

(declare-fun arrayContainsKey!0 (array!32468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504864 (= res!306118 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504875 () Bool)

(assert (=> b!504875 (= e!295546 (= (seekEntryOrOpen!0 (select (arr!15614 a!3235) j!176) a!3235 mask!3524) (Found!4078 j!176)))))

(declare-fun b!504876 () Bool)

(declare-fun Unit!15385 () Unit!15382)

(assert (=> b!504876 (= e!295548 Unit!15385)))

(declare-fun lt!229895 () Unit!15382)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15382)

(assert (=> b!504876 (= lt!229895 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229896 #b00000000000000000000000000000000 (index!18502 lt!229891) (x!47522 lt!229891) mask!3524))))

(declare-fun res!306109 () Bool)

(assert (=> b!504876 (= res!306109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229896 lt!229901 lt!229903 mask!3524) (Intermediate!4078 false (index!18502 lt!229891) (x!47522 lt!229891))))))

(assert (=> b!504876 (=> (not res!306109) (not e!295554))))

(assert (=> b!504876 e!295554))

(declare-fun b!504877 () Bool)

(assert (=> b!504877 (= e!295549 true)))

(assert (=> b!504877 (= (seekEntryOrOpen!0 lt!229901 lt!229903 mask!3524) lt!229892)))

(declare-fun lt!229899 () Unit!15382)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15382)

(assert (=> b!504877 (= lt!229899 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!229896 #b00000000000000000000000000000000 (index!18502 lt!229891) (x!47522 lt!229891) mask!3524))))

(declare-fun b!504878 () Bool)

(assert (=> b!504878 (= e!295552 e!295549)))

(declare-fun res!306119 () Bool)

(assert (=> b!504878 (=> res!306119 e!295549)))

(assert (=> b!504878 (= res!306119 (or (bvsgt (x!47522 lt!229891) #b01111111111111111111111111111110) (bvslt lt!229896 #b00000000000000000000000000000000) (bvsge lt!229896 (size!15979 a!3235)) (bvslt (index!18502 lt!229891) #b00000000000000000000000000000000) (bvsge (index!18502 lt!229891) (size!15979 a!3235)) (not (= lt!229891 (Intermediate!4078 false (index!18502 lt!229891) (x!47522 lt!229891))))))))

(assert (=> b!504878 (= (index!18502 lt!229891) i!1204)))

(declare-fun lt!229893 () Unit!15382)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15382)

(assert (=> b!504878 (= lt!229893 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229896 #b00000000000000000000000000000000 (index!18502 lt!229891) (x!47522 lt!229891) mask!3524))))

(assert (=> b!504878 (and (or (= (select (arr!15614 a!3235) (index!18502 lt!229891)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15614 a!3235) (index!18502 lt!229891)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15614 a!3235) (index!18502 lt!229891)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15614 a!3235) (index!18502 lt!229891)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229898 () Unit!15382)

(assert (=> b!504878 (= lt!229898 e!295548)))

(declare-fun c!59658 () Bool)

(assert (=> b!504878 (= c!59658 (= (select (arr!15614 a!3235) (index!18502 lt!229891)) (select (arr!15614 a!3235) j!176)))))

(assert (=> b!504878 (and (bvslt (x!47522 lt!229891) #b01111111111111111111111111111110) (or (= (select (arr!15614 a!3235) (index!18502 lt!229891)) (select (arr!15614 a!3235) j!176)) (= (select (arr!15614 a!3235) (index!18502 lt!229891)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15614 a!3235) (index!18502 lt!229891)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504879 () Bool)

(declare-fun res!306116 () Bool)

(assert (=> b!504879 (=> (not res!306116) (not e!295550))))

(assert (=> b!504879 (= res!306116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504880 () Bool)

(declare-fun res!306113 () Bool)

(assert (=> b!504880 (=> res!306113 e!295549)))

(assert (=> b!504880 (= res!306113 (not (= lt!229902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229896 lt!229901 lt!229903 mask!3524))))))

(assert (= (and start!45702 res!306105) b!504874))

(assert (= (and b!504874 res!306114) b!504871))

(assert (= (and b!504871 res!306111) b!504867))

(assert (= (and b!504867 res!306117) b!504864))

(assert (= (and b!504864 res!306118) b!504873))

(assert (= (and b!504873 res!306115) b!504879))

(assert (= (and b!504879 res!306116) b!504868))

(assert (= (and b!504868 res!306112) b!504872))

(assert (= (and b!504872 res!306110) b!504875))

(assert (= (and b!504872 (not res!306106)) b!504878))

(assert (= (and b!504878 c!59658) b!504876))

(assert (= (and b!504878 (not c!59658)) b!504870))

(assert (= (and b!504876 res!306109) b!504865))

(assert (= (and b!504878 (not res!306119)) b!504866))

(assert (= (and b!504866 res!306108) b!504869))

(assert (= (and b!504866 (not res!306107)) b!504880))

(assert (= (and b!504880 (not res!306113)) b!504877))

(declare-fun m!485053 () Bool)

(assert (=> start!45702 m!485053))

(declare-fun m!485055 () Bool)

(assert (=> start!45702 m!485055))

(declare-fun m!485057 () Bool)

(assert (=> b!504871 m!485057))

(assert (=> b!504871 m!485057))

(declare-fun m!485059 () Bool)

(assert (=> b!504871 m!485059))

(declare-fun m!485061 () Bool)

(assert (=> b!504872 m!485061))

(declare-fun m!485063 () Bool)

(assert (=> b!504872 m!485063))

(declare-fun m!485065 () Bool)

(assert (=> b!504872 m!485065))

(assert (=> b!504872 m!485057))

(declare-fun m!485067 () Bool)

(assert (=> b!504872 m!485067))

(declare-fun m!485069 () Bool)

(assert (=> b!504872 m!485069))

(assert (=> b!504872 m!485057))

(declare-fun m!485071 () Bool)

(assert (=> b!504872 m!485071))

(assert (=> b!504872 m!485057))

(declare-fun m!485073 () Bool)

(assert (=> b!504872 m!485073))

(declare-fun m!485075 () Bool)

(assert (=> b!504872 m!485075))

(declare-fun m!485077 () Bool)

(assert (=> b!504877 m!485077))

(declare-fun m!485079 () Bool)

(assert (=> b!504877 m!485079))

(declare-fun m!485081 () Bool)

(assert (=> b!504868 m!485081))

(assert (=> b!504875 m!485057))

(assert (=> b!504875 m!485057))

(declare-fun m!485083 () Bool)

(assert (=> b!504875 m!485083))

(declare-fun m!485085 () Bool)

(assert (=> b!504878 m!485085))

(declare-fun m!485087 () Bool)

(assert (=> b!504878 m!485087))

(assert (=> b!504878 m!485057))

(declare-fun m!485089 () Bool)

(assert (=> b!504867 m!485089))

(declare-fun m!485091 () Bool)

(assert (=> b!504879 m!485091))

(declare-fun m!485093 () Bool)

(assert (=> b!504876 m!485093))

(declare-fun m!485095 () Bool)

(assert (=> b!504876 m!485095))

(assert (=> b!504880 m!485095))

(declare-fun m!485097 () Bool)

(assert (=> b!504873 m!485097))

(assert (=> b!504869 m!485057))

(assert (=> b!504869 m!485057))

(declare-fun m!485099 () Bool)

(assert (=> b!504869 m!485099))

(declare-fun m!485101 () Bool)

(assert (=> b!504864 m!485101))

(check-sat (not start!45702) (not b!504868) (not b!504873) (not b!504877) (not b!504880) (not b!504869) (not b!504875) (not b!504876) (not b!504872) (not b!504878) (not b!504867) (not b!504879) (not b!504864) (not b!504871))
(check-sat)
