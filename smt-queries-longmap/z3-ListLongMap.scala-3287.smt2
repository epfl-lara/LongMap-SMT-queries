; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45668 () Bool)

(assert start!45668)

(declare-fun b!503962 () Bool)

(declare-fun res!305209 () Bool)

(declare-fun e!295100 () Bool)

(assert (=> b!503962 (=> (not res!305209) (not e!295100))))

(declare-datatypes ((array!32424 0))(
  ( (array!32425 (arr!15592 (Array (_ BitVec 32) (_ BitVec 64))) (size!15956 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32424)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32424 (_ BitVec 32)) Bool)

(assert (=> b!503962 (= res!305209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503963 () Bool)

(declare-fun e!295105 () Bool)

(assert (=> b!503963 (= e!295100 (not e!295105))))

(declare-fun res!305201 () Bool)

(assert (=> b!503963 (=> res!305201 e!295105)))

(declare-fun lt!229363 () (_ BitVec 32))

(declare-fun lt!229369 () array!32424)

(declare-fun lt!229372 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4059 0))(
  ( (MissingZero!4059 (index!18424 (_ BitVec 32))) (Found!4059 (index!18425 (_ BitVec 32))) (Intermediate!4059 (undefined!4871 Bool) (index!18426 (_ BitVec 32)) (x!47444 (_ BitVec 32))) (Undefined!4059) (MissingVacant!4059 (index!18427 (_ BitVec 32))) )
))
(declare-fun lt!229364 () SeekEntryResult!4059)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32424 (_ BitVec 32)) SeekEntryResult!4059)

(assert (=> b!503963 (= res!305201 (= lt!229364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229363 lt!229372 lt!229369 mask!3524)))))

(declare-fun lt!229365 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503963 (= lt!229364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229365 (select (arr!15592 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503963 (= lt!229363 (toIndex!0 lt!229372 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503963 (= lt!229372 (select (store (arr!15592 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503963 (= lt!229365 (toIndex!0 (select (arr!15592 a!3235) j!176) mask!3524))))

(assert (=> b!503963 (= lt!229369 (array!32425 (store (arr!15592 a!3235) i!1204 k0!2280) (size!15956 a!3235)))))

(declare-fun e!295099 () Bool)

(assert (=> b!503963 e!295099))

(declare-fun res!305204 () Bool)

(assert (=> b!503963 (=> (not res!305204) (not e!295099))))

(assert (=> b!503963 (= res!305204 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15312 0))(
  ( (Unit!15313) )
))
(declare-fun lt!229367 () Unit!15312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15312)

(assert (=> b!503963 (= lt!229367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!305205 () Bool)

(declare-fun e!295102 () Bool)

(assert (=> start!45668 (=> (not res!305205) (not e!295102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45668 (= res!305205 (validMask!0 mask!3524))))

(assert (=> start!45668 e!295102))

(assert (=> start!45668 true))

(declare-fun array_inv!11388 (array!32424) Bool)

(assert (=> start!45668 (array_inv!11388 a!3235)))

(declare-fun b!503964 () Bool)

(declare-fun res!305199 () Bool)

(assert (=> b!503964 (=> res!305199 e!295105)))

(get-info :version)

(assert (=> b!503964 (= res!305199 (or (undefined!4871 lt!229364) (not ((_ is Intermediate!4059) lt!229364))))))

(declare-fun b!503965 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32424 (_ BitVec 32)) SeekEntryResult!4059)

(assert (=> b!503965 (= e!295099 (= (seekEntryOrOpen!0 (select (arr!15592 a!3235) j!176) a!3235 mask!3524) (Found!4059 j!176)))))

(declare-fun b!503966 () Bool)

(declare-fun res!305213 () Bool)

(declare-fun e!295101 () Bool)

(assert (=> b!503966 (=> res!305213 e!295101)))

(declare-fun e!295104 () Bool)

(assert (=> b!503966 (= res!305213 e!295104)))

(declare-fun res!305203 () Bool)

(assert (=> b!503966 (=> (not res!305203) (not e!295104))))

(assert (=> b!503966 (= res!305203 (bvsgt #b00000000000000000000000000000000 (x!47444 lt!229364)))))

(declare-fun b!503967 () Bool)

(declare-fun e!295103 () Unit!15312)

(declare-fun Unit!15314 () Unit!15312)

(assert (=> b!503967 (= e!295103 Unit!15314)))

(declare-fun b!503968 () Bool)

(declare-fun res!305202 () Bool)

(assert (=> b!503968 (=> (not res!305202) (not e!295102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503968 (= res!305202 (validKeyInArray!0 k0!2280))))

(declare-fun b!503969 () Bool)

(declare-fun res!305212 () Bool)

(assert (=> b!503969 (=> (not res!305212) (not e!295102))))

(declare-fun arrayContainsKey!0 (array!32424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503969 (= res!305212 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503970 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32424 (_ BitVec 32)) SeekEntryResult!4059)

(assert (=> b!503970 (= e!295104 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229365 (index!18426 lt!229364) (select (arr!15592 a!3235) j!176) a!3235 mask!3524) (Found!4059 j!176))))))

(declare-fun b!503971 () Bool)

(assert (=> b!503971 (= e!295105 e!295101)))

(declare-fun res!305200 () Bool)

(assert (=> b!503971 (=> res!305200 e!295101)))

(assert (=> b!503971 (= res!305200 (or (bvsgt (x!47444 lt!229364) #b01111111111111111111111111111110) (bvslt lt!229365 #b00000000000000000000000000000000) (bvsge lt!229365 (size!15956 a!3235)) (bvslt (index!18426 lt!229364) #b00000000000000000000000000000000) (bvsge (index!18426 lt!229364) (size!15956 a!3235)) (not (= lt!229364 (Intermediate!4059 false (index!18426 lt!229364) (x!47444 lt!229364))))))))

(assert (=> b!503971 (= (index!18426 lt!229364) i!1204)))

(declare-fun lt!229371 () Unit!15312)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32424 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15312)

(assert (=> b!503971 (= lt!229371 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229365 #b00000000000000000000000000000000 (index!18426 lt!229364) (x!47444 lt!229364) mask!3524))))

(assert (=> b!503971 (and (or (= (select (arr!15592 a!3235) (index!18426 lt!229364)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15592 a!3235) (index!18426 lt!229364)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15592 a!3235) (index!18426 lt!229364)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15592 a!3235) (index!18426 lt!229364)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229368 () Unit!15312)

(assert (=> b!503971 (= lt!229368 e!295103)))

(declare-fun c!59660 () Bool)

(assert (=> b!503971 (= c!59660 (= (select (arr!15592 a!3235) (index!18426 lt!229364)) (select (arr!15592 a!3235) j!176)))))

(assert (=> b!503971 (and (bvslt (x!47444 lt!229364) #b01111111111111111111111111111110) (or (= (select (arr!15592 a!3235) (index!18426 lt!229364)) (select (arr!15592 a!3235) j!176)) (= (select (arr!15592 a!3235) (index!18426 lt!229364)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15592 a!3235) (index!18426 lt!229364)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503972 () Bool)

(declare-fun res!305211 () Bool)

(assert (=> b!503972 (=> (not res!305211) (not e!295100))))

(declare-datatypes ((List!9750 0))(
  ( (Nil!9747) (Cons!9746 (h!10623 (_ BitVec 64)) (t!15978 List!9750)) )
))
(declare-fun arrayNoDuplicates!0 (array!32424 (_ BitVec 32) List!9750) Bool)

(assert (=> b!503972 (= res!305211 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9747))))

(declare-fun b!503973 () Bool)

(declare-fun Unit!15315 () Unit!15312)

(assert (=> b!503973 (= e!295103 Unit!15315)))

(declare-fun lt!229366 () Unit!15312)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32424 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15312)

(assert (=> b!503973 (= lt!229366 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229365 #b00000000000000000000000000000000 (index!18426 lt!229364) (x!47444 lt!229364) mask!3524))))

(declare-fun res!305208 () Bool)

(assert (=> b!503973 (= res!305208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229365 lt!229372 lt!229369 mask!3524) (Intermediate!4059 false (index!18426 lt!229364) (x!47444 lt!229364))))))

(declare-fun e!295106 () Bool)

(assert (=> b!503973 (=> (not res!305208) (not e!295106))))

(assert (=> b!503973 e!295106))

(declare-fun b!503974 () Bool)

(assert (=> b!503974 (= e!295101 true)))

(declare-fun lt!229362 () SeekEntryResult!4059)

(assert (=> b!503974 (= lt!229362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229365 lt!229372 lt!229369 mask!3524))))

(declare-fun b!503975 () Bool)

(declare-fun res!305206 () Bool)

(assert (=> b!503975 (=> (not res!305206) (not e!295102))))

(assert (=> b!503975 (= res!305206 (and (= (size!15956 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15956 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15956 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503976 () Bool)

(assert (=> b!503976 (= e!295102 e!295100)))

(declare-fun res!305207 () Bool)

(assert (=> b!503976 (=> (not res!305207) (not e!295100))))

(declare-fun lt!229370 () SeekEntryResult!4059)

(assert (=> b!503976 (= res!305207 (or (= lt!229370 (MissingZero!4059 i!1204)) (= lt!229370 (MissingVacant!4059 i!1204))))))

(assert (=> b!503976 (= lt!229370 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503977 () Bool)

(declare-fun res!305210 () Bool)

(assert (=> b!503977 (=> (not res!305210) (not e!295102))))

(assert (=> b!503977 (= res!305210 (validKeyInArray!0 (select (arr!15592 a!3235) j!176)))))

(declare-fun b!503978 () Bool)

(assert (=> b!503978 (= e!295106 false)))

(assert (= (and start!45668 res!305205) b!503975))

(assert (= (and b!503975 res!305206) b!503977))

(assert (= (and b!503977 res!305210) b!503968))

(assert (= (and b!503968 res!305202) b!503969))

(assert (= (and b!503969 res!305212) b!503976))

(assert (= (and b!503976 res!305207) b!503962))

(assert (= (and b!503962 res!305209) b!503972))

(assert (= (and b!503972 res!305211) b!503963))

(assert (= (and b!503963 res!305204) b!503965))

(assert (= (and b!503963 (not res!305201)) b!503964))

(assert (= (and b!503964 (not res!305199)) b!503971))

(assert (= (and b!503971 c!59660) b!503973))

(assert (= (and b!503971 (not c!59660)) b!503967))

(assert (= (and b!503973 res!305208) b!503978))

(assert (= (and b!503971 (not res!305200)) b!503966))

(assert (= (and b!503966 res!305203) b!503970))

(assert (= (and b!503966 (not res!305213)) b!503974))

(declare-fun m!484747 () Bool)

(assert (=> b!503973 m!484747))

(declare-fun m!484749 () Bool)

(assert (=> b!503973 m!484749))

(declare-fun m!484751 () Bool)

(assert (=> b!503976 m!484751))

(declare-fun m!484753 () Bool)

(assert (=> b!503977 m!484753))

(assert (=> b!503977 m!484753))

(declare-fun m!484755 () Bool)

(assert (=> b!503977 m!484755))

(declare-fun m!484757 () Bool)

(assert (=> b!503971 m!484757))

(declare-fun m!484759 () Bool)

(assert (=> b!503971 m!484759))

(assert (=> b!503971 m!484753))

(declare-fun m!484761 () Bool)

(assert (=> b!503963 m!484761))

(declare-fun m!484763 () Bool)

(assert (=> b!503963 m!484763))

(declare-fun m!484765 () Bool)

(assert (=> b!503963 m!484765))

(assert (=> b!503963 m!484753))

(declare-fun m!484767 () Bool)

(assert (=> b!503963 m!484767))

(declare-fun m!484769 () Bool)

(assert (=> b!503963 m!484769))

(assert (=> b!503963 m!484753))

(declare-fun m!484771 () Bool)

(assert (=> b!503963 m!484771))

(assert (=> b!503963 m!484753))

(declare-fun m!484773 () Bool)

(assert (=> b!503963 m!484773))

(declare-fun m!484775 () Bool)

(assert (=> b!503963 m!484775))

(assert (=> b!503974 m!484749))

(assert (=> b!503965 m!484753))

(assert (=> b!503965 m!484753))

(declare-fun m!484777 () Bool)

(assert (=> b!503965 m!484777))

(declare-fun m!484779 () Bool)

(assert (=> b!503968 m!484779))

(declare-fun m!484781 () Bool)

(assert (=> b!503962 m!484781))

(declare-fun m!484783 () Bool)

(assert (=> b!503969 m!484783))

(assert (=> b!503970 m!484753))

(assert (=> b!503970 m!484753))

(declare-fun m!484785 () Bool)

(assert (=> b!503970 m!484785))

(declare-fun m!484787 () Bool)

(assert (=> start!45668 m!484787))

(declare-fun m!484789 () Bool)

(assert (=> start!45668 m!484789))

(declare-fun m!484791 () Bool)

(assert (=> b!503972 m!484791))

(check-sat (not b!503971) (not b!503965) (not b!503968) (not b!503963) (not b!503976) (not b!503973) (not b!503977) (not start!45668) (not b!503969) (not b!503972) (not b!503974) (not b!503970) (not b!503962))
(check-sat)
