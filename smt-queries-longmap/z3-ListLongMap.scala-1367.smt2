; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26856 () Bool)

(assert start!26856)

(declare-fun b!278657 () Bool)

(declare-fun res!142064 () Bool)

(declare-fun e!177720 () Bool)

(assert (=> b!278657 (=> (not res!142064) (not e!177720))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278657 (= res!142064 (not (= startIndex!26 i!1267)))))

(declare-fun b!278658 () Bool)

(declare-fun res!142062 () Bool)

(assert (=> b!278658 (=> (not res!142062) (not e!177720))))

(declare-datatypes ((array!13859 0))(
  ( (array!13860 (arr!6577 (Array (_ BitVec 32) (_ BitVec 64))) (size!6929 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13859)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278658 (= res!142062 (validKeyInArray!0 (select (arr!6577 a!3325) startIndex!26)))))

(declare-fun b!278660 () Bool)

(declare-fun res!142066 () Bool)

(declare-fun e!177722 () Bool)

(assert (=> b!278660 (=> (not res!142066) (not e!177722))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278660 (= res!142066 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278661 () Bool)

(declare-fun res!142068 () Bool)

(assert (=> b!278661 (=> (not res!142068) (not e!177722))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!278661 (= res!142068 (and (= (size!6929 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6929 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6929 a!3325))))))

(declare-fun b!278662 () Bool)

(declare-fun res!142065 () Bool)

(assert (=> b!278662 (=> (not res!142065) (not e!177720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13859 (_ BitVec 32)) Bool)

(assert (=> b!278662 (= res!142065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278663 () Bool)

(declare-fun res!142063 () Bool)

(assert (=> b!278663 (=> (not res!142063) (not e!177722))))

(declare-datatypes ((List!4298 0))(
  ( (Nil!4295) (Cons!4294 (h!4964 (_ BitVec 64)) (t!9372 List!4298)) )
))
(declare-fun arrayNoDuplicates!0 (array!13859 (_ BitVec 32) List!4298) Bool)

(assert (=> b!278663 (= res!142063 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4295))))

(declare-fun b!278664 () Bool)

(declare-fun res!142061 () Bool)

(assert (=> b!278664 (=> (not res!142061) (not e!177722))))

(assert (=> b!278664 (= res!142061 (validKeyInArray!0 k0!2581))))

(declare-fun b!278665 () Bool)

(assert (=> b!278665 (= e!177720 (bvsge (size!6929 a!3325) #b01111111111111111111111111111111))))

(declare-fun b!278659 () Bool)

(assert (=> b!278659 (= e!177722 e!177720)))

(declare-fun res!142067 () Bool)

(assert (=> b!278659 (=> (not res!142067) (not e!177720))))

(declare-datatypes ((SeekEntryResult!1700 0))(
  ( (MissingZero!1700 (index!8970 (_ BitVec 32))) (Found!1700 (index!8971 (_ BitVec 32))) (Intermediate!1700 (undefined!2512 Bool) (index!8972 (_ BitVec 32)) (x!27330 (_ BitVec 32))) (Undefined!1700) (MissingVacant!1700 (index!8973 (_ BitVec 32))) )
))
(declare-fun lt!138489 () SeekEntryResult!1700)

(assert (=> b!278659 (= res!142067 (or (= lt!138489 (MissingZero!1700 i!1267)) (= lt!138489 (MissingVacant!1700 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13859 (_ BitVec 32)) SeekEntryResult!1700)

(assert (=> b!278659 (= lt!138489 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!142060 () Bool)

(assert (=> start!26856 (=> (not res!142060) (not e!177722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26856 (= res!142060 (validMask!0 mask!3868))))

(assert (=> start!26856 e!177722))

(declare-fun array_inv!4527 (array!13859) Bool)

(assert (=> start!26856 (array_inv!4527 a!3325)))

(assert (=> start!26856 true))

(assert (= (and start!26856 res!142060) b!278661))

(assert (= (and b!278661 res!142068) b!278664))

(assert (= (and b!278664 res!142061) b!278663))

(assert (= (and b!278663 res!142063) b!278660))

(assert (= (and b!278660 res!142066) b!278659))

(assert (= (and b!278659 res!142067) b!278662))

(assert (= (and b!278662 res!142065) b!278657))

(assert (= (and b!278657 res!142064) b!278658))

(assert (= (and b!278658 res!142062) b!278665))

(declare-fun m!293843 () Bool)

(assert (=> b!278664 m!293843))

(declare-fun m!293845 () Bool)

(assert (=> b!278658 m!293845))

(assert (=> b!278658 m!293845))

(declare-fun m!293847 () Bool)

(assert (=> b!278658 m!293847))

(declare-fun m!293849 () Bool)

(assert (=> start!26856 m!293849))

(declare-fun m!293851 () Bool)

(assert (=> start!26856 m!293851))

(declare-fun m!293853 () Bool)

(assert (=> b!278660 m!293853))

(declare-fun m!293855 () Bool)

(assert (=> b!278663 m!293855))

(declare-fun m!293857 () Bool)

(assert (=> b!278659 m!293857))

(declare-fun m!293859 () Bool)

(assert (=> b!278662 m!293859))

(check-sat (not b!278662) (not b!278663) (not start!26856) (not b!278660) (not b!278659) (not b!278664) (not b!278658))
(check-sat)
(get-model)

(declare-fun d!64999 () Bool)

(declare-fun res!142127 () Bool)

(declare-fun e!177745 () Bool)

(assert (=> d!64999 (=> res!142127 e!177745)))

(assert (=> d!64999 (= res!142127 (= (select (arr!6577 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!64999 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177745)))

(declare-fun b!278724 () Bool)

(declare-fun e!177746 () Bool)

(assert (=> b!278724 (= e!177745 e!177746)))

(declare-fun res!142128 () Bool)

(assert (=> b!278724 (=> (not res!142128) (not e!177746))))

(assert (=> b!278724 (= res!142128 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6929 a!3325)))))

(declare-fun b!278725 () Bool)

(assert (=> b!278725 (= e!177746 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64999 (not res!142127)) b!278724))

(assert (= (and b!278724 res!142128) b!278725))

(declare-fun m!293897 () Bool)

(assert (=> d!64999 m!293897))

(declare-fun m!293899 () Bool)

(assert (=> b!278725 m!293899))

(assert (=> b!278660 d!64999))

(declare-fun lt!138504 () SeekEntryResult!1700)

(declare-fun b!278750 () Bool)

(declare-fun e!177767 () SeekEntryResult!1700)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13859 (_ BitVec 32)) SeekEntryResult!1700)

(assert (=> b!278750 (= e!177767 (seekKeyOrZeroReturnVacant!0 (x!27330 lt!138504) (index!8972 lt!138504) (index!8972 lt!138504) k0!2581 a!3325 mask!3868))))

(declare-fun b!278751 () Bool)

(declare-fun e!177766 () SeekEntryResult!1700)

(assert (=> b!278751 (= e!177766 (Found!1700 (index!8972 lt!138504)))))

(declare-fun b!278752 () Bool)

(declare-fun e!177765 () SeekEntryResult!1700)

(assert (=> b!278752 (= e!177765 e!177766)))

(declare-fun lt!138503 () (_ BitVec 64))

(assert (=> b!278752 (= lt!138503 (select (arr!6577 a!3325) (index!8972 lt!138504)))))

(declare-fun c!45858 () Bool)

(assert (=> b!278752 (= c!45858 (= lt!138503 k0!2581))))

(declare-fun b!278753 () Bool)

(assert (=> b!278753 (= e!177767 (MissingZero!1700 (index!8972 lt!138504)))))

(declare-fun d!65001 () Bool)

(declare-fun lt!138502 () SeekEntryResult!1700)

(get-info :version)

(assert (=> d!65001 (and (or ((_ is Undefined!1700) lt!138502) (not ((_ is Found!1700) lt!138502)) (and (bvsge (index!8971 lt!138502) #b00000000000000000000000000000000) (bvslt (index!8971 lt!138502) (size!6929 a!3325)))) (or ((_ is Undefined!1700) lt!138502) ((_ is Found!1700) lt!138502) (not ((_ is MissingZero!1700) lt!138502)) (and (bvsge (index!8970 lt!138502) #b00000000000000000000000000000000) (bvslt (index!8970 lt!138502) (size!6929 a!3325)))) (or ((_ is Undefined!1700) lt!138502) ((_ is Found!1700) lt!138502) ((_ is MissingZero!1700) lt!138502) (not ((_ is MissingVacant!1700) lt!138502)) (and (bvsge (index!8973 lt!138502) #b00000000000000000000000000000000) (bvslt (index!8973 lt!138502) (size!6929 a!3325)))) (or ((_ is Undefined!1700) lt!138502) (ite ((_ is Found!1700) lt!138502) (= (select (arr!6577 a!3325) (index!8971 lt!138502)) k0!2581) (ite ((_ is MissingZero!1700) lt!138502) (= (select (arr!6577 a!3325) (index!8970 lt!138502)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1700) lt!138502) (= (select (arr!6577 a!3325) (index!8973 lt!138502)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65001 (= lt!138502 e!177765)))

(declare-fun c!45857 () Bool)

(assert (=> d!65001 (= c!45857 (and ((_ is Intermediate!1700) lt!138504) (undefined!2512 lt!138504)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13859 (_ BitVec 32)) SeekEntryResult!1700)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65001 (= lt!138504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65001 (validMask!0 mask!3868)))

(assert (=> d!65001 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138502)))

(declare-fun b!278754 () Bool)

(assert (=> b!278754 (= e!177765 Undefined!1700)))

(declare-fun b!278755 () Bool)

(declare-fun c!45859 () Bool)

(assert (=> b!278755 (= c!45859 (= lt!138503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!278755 (= e!177766 e!177767)))

(assert (= (and d!65001 c!45857) b!278754))

(assert (= (and d!65001 (not c!45857)) b!278752))

(assert (= (and b!278752 c!45858) b!278751))

(assert (= (and b!278752 (not c!45858)) b!278755))

(assert (= (and b!278755 c!45859) b!278753))

(assert (= (and b!278755 (not c!45859)) b!278750))

(declare-fun m!293909 () Bool)

(assert (=> b!278750 m!293909))

(declare-fun m!293911 () Bool)

(assert (=> b!278752 m!293911))

(declare-fun m!293913 () Bool)

(assert (=> d!65001 m!293913))

(assert (=> d!65001 m!293849))

(declare-fun m!293915 () Bool)

(assert (=> d!65001 m!293915))

(declare-fun m!293917 () Bool)

(assert (=> d!65001 m!293917))

(declare-fun m!293919 () Bool)

(assert (=> d!65001 m!293919))

(declare-fun m!293921 () Bool)

(assert (=> d!65001 m!293921))

(assert (=> d!65001 m!293919))

(assert (=> b!278659 d!65001))

(declare-fun b!278779 () Bool)

(declare-fun e!177788 () Bool)

(declare-fun call!25381 () Bool)

(assert (=> b!278779 (= e!177788 call!25381)))

(declare-fun b!278780 () Bool)

(declare-fun e!177787 () Bool)

(assert (=> b!278780 (= e!177787 call!25381)))

(declare-fun d!65019 () Bool)

(declare-fun res!142155 () Bool)

(declare-fun e!177786 () Bool)

(assert (=> d!65019 (=> res!142155 e!177786)))

(assert (=> d!65019 (= res!142155 (bvsge #b00000000000000000000000000000000 (size!6929 a!3325)))))

(assert (=> d!65019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177786)))

(declare-fun b!278781 () Bool)

(assert (=> b!278781 (= e!177787 e!177788)))

(declare-fun lt!138513 () (_ BitVec 64))

(assert (=> b!278781 (= lt!138513 (select (arr!6577 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8780 0))(
  ( (Unit!8781) )
))
(declare-fun lt!138511 () Unit!8780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13859 (_ BitVec 64) (_ BitVec 32)) Unit!8780)

(assert (=> b!278781 (= lt!138511 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138513 #b00000000000000000000000000000000))))

(assert (=> b!278781 (arrayContainsKey!0 a!3325 lt!138513 #b00000000000000000000000000000000)))

(declare-fun lt!138512 () Unit!8780)

(assert (=> b!278781 (= lt!138512 lt!138511)))

(declare-fun res!142154 () Bool)

(assert (=> b!278781 (= res!142154 (= (seekEntryOrOpen!0 (select (arr!6577 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1700 #b00000000000000000000000000000000)))))

(assert (=> b!278781 (=> (not res!142154) (not e!177788))))

(declare-fun bm!25378 () Bool)

(assert (=> bm!25378 (= call!25381 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278782 () Bool)

(assert (=> b!278782 (= e!177786 e!177787)))

(declare-fun c!45865 () Bool)

(assert (=> b!278782 (= c!45865 (validKeyInArray!0 (select (arr!6577 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65019 (not res!142155)) b!278782))

(assert (= (and b!278782 c!45865) b!278781))

(assert (= (and b!278782 (not c!45865)) b!278780))

(assert (= (and b!278781 res!142154) b!278779))

(assert (= (or b!278779 b!278780) bm!25378))

(assert (=> b!278781 m!293897))

(declare-fun m!293929 () Bool)

(assert (=> b!278781 m!293929))

(declare-fun m!293931 () Bool)

(assert (=> b!278781 m!293931))

(assert (=> b!278781 m!293897))

(declare-fun m!293933 () Bool)

(assert (=> b!278781 m!293933))

(declare-fun m!293935 () Bool)

(assert (=> bm!25378 m!293935))

(assert (=> b!278782 m!293897))

(assert (=> b!278782 m!293897))

(declare-fun m!293937 () Bool)

(assert (=> b!278782 m!293937))

(assert (=> b!278662 d!65019))

(declare-fun d!65025 () Bool)

(assert (=> d!65025 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278664 d!65025))

(declare-fun d!65027 () Bool)

(assert (=> d!65027 (= (validKeyInArray!0 (select (arr!6577 a!3325) startIndex!26)) (and (not (= (select (arr!6577 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6577 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!278658 d!65027))

(declare-fun bm!25381 () Bool)

(declare-fun call!25384 () Bool)

(declare-fun c!45868 () Bool)

(assert (=> bm!25381 (= call!25384 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45868 (Cons!4294 (select (arr!6577 a!3325) #b00000000000000000000000000000000) Nil!4295) Nil!4295)))))

(declare-fun b!278793 () Bool)

(declare-fun e!177797 () Bool)

(assert (=> b!278793 (= e!177797 call!25384)))

(declare-fun b!278794 () Bool)

(declare-fun e!177799 () Bool)

(assert (=> b!278794 (= e!177799 e!177797)))

(assert (=> b!278794 (= c!45868 (validKeyInArray!0 (select (arr!6577 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278795 () Bool)

(declare-fun e!177798 () Bool)

(declare-fun contains!1939 (List!4298 (_ BitVec 64)) Bool)

(assert (=> b!278795 (= e!177798 (contains!1939 Nil!4295 (select (arr!6577 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278796 () Bool)

(assert (=> b!278796 (= e!177797 call!25384)))

(declare-fun b!278797 () Bool)

(declare-fun e!177800 () Bool)

(assert (=> b!278797 (= e!177800 e!177799)))

(declare-fun res!142163 () Bool)

(assert (=> b!278797 (=> (not res!142163) (not e!177799))))

(assert (=> b!278797 (= res!142163 (not e!177798))))

(declare-fun res!142162 () Bool)

(assert (=> b!278797 (=> (not res!142162) (not e!177798))))

(assert (=> b!278797 (= res!142162 (validKeyInArray!0 (select (arr!6577 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65029 () Bool)

(declare-fun res!142164 () Bool)

(assert (=> d!65029 (=> res!142164 e!177800)))

(assert (=> d!65029 (= res!142164 (bvsge #b00000000000000000000000000000000 (size!6929 a!3325)))))

(assert (=> d!65029 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4295) e!177800)))

(assert (= (and d!65029 (not res!142164)) b!278797))

(assert (= (and b!278797 res!142162) b!278795))

(assert (= (and b!278797 res!142163) b!278794))

(assert (= (and b!278794 c!45868) b!278793))

(assert (= (and b!278794 (not c!45868)) b!278796))

(assert (= (or b!278793 b!278796) bm!25381))

(assert (=> bm!25381 m!293897))

(declare-fun m!293939 () Bool)

(assert (=> bm!25381 m!293939))

(assert (=> b!278794 m!293897))

(assert (=> b!278794 m!293897))

(assert (=> b!278794 m!293937))

(assert (=> b!278795 m!293897))

(assert (=> b!278795 m!293897))

(declare-fun m!293941 () Bool)

(assert (=> b!278795 m!293941))

(assert (=> b!278797 m!293897))

(assert (=> b!278797 m!293897))

(assert (=> b!278797 m!293937))

(assert (=> b!278663 d!65029))

(declare-fun d!65031 () Bool)

(assert (=> d!65031 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26856 d!65031))

(declare-fun d!65035 () Bool)

(assert (=> d!65035 (= (array_inv!4527 a!3325) (bvsge (size!6929 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26856 d!65035))

(check-sat (not b!278725) (not b!278781) (not b!278794) (not b!278795) (not b!278750) (not bm!25378) (not bm!25381) (not b!278797) (not b!278782) (not d!65001))
(check-sat)
