; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47142 () Bool)

(assert start!47142)

(declare-fun b!519108 () Bool)

(declare-fun res!317807 () Bool)

(declare-fun e!302876 () Bool)

(assert (=> b!519108 (=> (not res!317807) (not e!302876))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519108 (= res!317807 (validKeyInArray!0 k0!2280))))

(declare-fun b!519109 () Bool)

(declare-fun res!317810 () Bool)

(assert (=> b!519109 (=> (not res!317810) (not e!302876))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33167 0))(
  ( (array!33168 (arr!15944 (Array (_ BitVec 32) (_ BitVec 64))) (size!16309 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33167)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519109 (= res!317810 (and (= (size!16309 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16309 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16309 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519110 () Bool)

(declare-fun e!302874 () Bool)

(declare-datatypes ((SeekEntryResult!4408 0))(
  ( (MissingZero!4408 (index!19826 (_ BitVec 32))) (Found!4408 (index!19827 (_ BitVec 32))) (Intermediate!4408 (undefined!5220 Bool) (index!19828 (_ BitVec 32)) (x!48810 (_ BitVec 32))) (Undefined!4408) (MissingVacant!4408 (index!19829 (_ BitVec 32))) )
))
(declare-fun lt!237607 () SeekEntryResult!4408)

(assert (=> b!519110 (= e!302874 (and (bvsge (index!19828 lt!237607) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237607) (size!16309 a!3235))))))

(assert (=> b!519110 (or (= (select (arr!15944 a!3235) (index!19828 lt!237607)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15944 a!3235) (index!19828 lt!237607)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16078 0))(
  ( (Unit!16079) )
))
(declare-fun lt!237605 () Unit!16078)

(declare-fun e!302872 () Unit!16078)

(assert (=> b!519110 (= lt!237605 e!302872)))

(declare-fun c!60948 () Bool)

(assert (=> b!519110 (= c!60948 (= (select (arr!15944 a!3235) (index!19828 lt!237607)) (select (arr!15944 a!3235) j!176)))))

(assert (=> b!519110 (and (bvslt (x!48810 lt!237607) #b01111111111111111111111111111110) (or (= (select (arr!15944 a!3235) (index!19828 lt!237607)) (select (arr!15944 a!3235) j!176)) (= (select (arr!15944 a!3235) (index!19828 lt!237607)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15944 a!3235) (index!19828 lt!237607)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519111 () Bool)

(declare-fun e!302875 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33167 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!519111 (= e!302875 (= (seekEntryOrOpen!0 (select (arr!15944 a!3235) j!176) a!3235 mask!3524) (Found!4408 j!176)))))

(declare-fun b!519112 () Bool)

(declare-fun res!317811 () Bool)

(assert (=> b!519112 (=> (not res!317811) (not e!302876))))

(declare-fun arrayContainsKey!0 (array!33167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519112 (= res!317811 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519113 () Bool)

(declare-fun Unit!16080 () Unit!16078)

(assert (=> b!519113 (= e!302872 Unit!16080)))

(declare-fun lt!237599 () (_ BitVec 32))

(declare-fun lt!237602 () Unit!16078)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16078)

(assert (=> b!519113 (= lt!237602 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237599 #b00000000000000000000000000000000 (index!19828 lt!237607) (x!48810 lt!237607) mask!3524))))

(declare-fun lt!237601 () (_ BitVec 64))

(declare-fun res!317815 () Bool)

(declare-fun lt!237604 () array!33167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33167 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!519113 (= res!317815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237599 lt!237601 lt!237604 mask!3524) (Intermediate!4408 false (index!19828 lt!237607) (x!48810 lt!237607))))))

(declare-fun e!302871 () Bool)

(assert (=> b!519113 (=> (not res!317815) (not e!302871))))

(assert (=> b!519113 e!302871))

(declare-fun b!519114 () Bool)

(declare-fun e!302877 () Bool)

(assert (=> b!519114 (= e!302876 e!302877)))

(declare-fun res!317812 () Bool)

(assert (=> b!519114 (=> (not res!317812) (not e!302877))))

(declare-fun lt!237606 () SeekEntryResult!4408)

(assert (=> b!519114 (= res!317812 (or (= lt!237606 (MissingZero!4408 i!1204)) (= lt!237606 (MissingVacant!4408 i!1204))))))

(assert (=> b!519114 (= lt!237606 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519115 () Bool)

(declare-fun Unit!16081 () Unit!16078)

(assert (=> b!519115 (= e!302872 Unit!16081)))

(declare-fun b!519117 () Bool)

(assert (=> b!519117 (= e!302877 (not e!302874))))

(declare-fun res!317809 () Bool)

(assert (=> b!519117 (=> res!317809 e!302874)))

(declare-fun lt!237600 () (_ BitVec 32))

(assert (=> b!519117 (= res!317809 (= lt!237607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237600 lt!237601 lt!237604 mask!3524)))))

(assert (=> b!519117 (= lt!237607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237599 (select (arr!15944 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519117 (= lt!237600 (toIndex!0 lt!237601 mask!3524))))

(assert (=> b!519117 (= lt!237601 (select (store (arr!15944 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519117 (= lt!237599 (toIndex!0 (select (arr!15944 a!3235) j!176) mask!3524))))

(assert (=> b!519117 (= lt!237604 (array!33168 (store (arr!15944 a!3235) i!1204 k0!2280) (size!16309 a!3235)))))

(assert (=> b!519117 e!302875))

(declare-fun res!317813 () Bool)

(assert (=> b!519117 (=> (not res!317813) (not e!302875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33167 (_ BitVec 32)) Bool)

(assert (=> b!519117 (= res!317813 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237603 () Unit!16078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16078)

(assert (=> b!519117 (= lt!237603 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519118 () Bool)

(assert (=> b!519118 (= e!302871 false)))

(declare-fun b!519119 () Bool)

(declare-fun res!317808 () Bool)

(assert (=> b!519119 (=> res!317808 e!302874)))

(get-info :version)

(assert (=> b!519119 (= res!317808 (or (undefined!5220 lt!237607) (not ((_ is Intermediate!4408) lt!237607))))))

(declare-fun b!519120 () Bool)

(declare-fun res!317816 () Bool)

(assert (=> b!519120 (=> (not res!317816) (not e!302877))))

(declare-datatypes ((List!10141 0))(
  ( (Nil!10138) (Cons!10137 (h!11050 (_ BitVec 64)) (t!16360 List!10141)) )
))
(declare-fun arrayNoDuplicates!0 (array!33167 (_ BitVec 32) List!10141) Bool)

(assert (=> b!519120 (= res!317816 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10138))))

(declare-fun b!519121 () Bool)

(declare-fun res!317805 () Bool)

(assert (=> b!519121 (=> (not res!317805) (not e!302876))))

(assert (=> b!519121 (= res!317805 (validKeyInArray!0 (select (arr!15944 a!3235) j!176)))))

(declare-fun res!317814 () Bool)

(assert (=> start!47142 (=> (not res!317814) (not e!302876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47142 (= res!317814 (validMask!0 mask!3524))))

(assert (=> start!47142 e!302876))

(assert (=> start!47142 true))

(declare-fun array_inv!11827 (array!33167) Bool)

(assert (=> start!47142 (array_inv!11827 a!3235)))

(declare-fun b!519116 () Bool)

(declare-fun res!317806 () Bool)

(assert (=> b!519116 (=> (not res!317806) (not e!302877))))

(assert (=> b!519116 (= res!317806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47142 res!317814) b!519109))

(assert (= (and b!519109 res!317810) b!519121))

(assert (= (and b!519121 res!317805) b!519108))

(assert (= (and b!519108 res!317807) b!519112))

(assert (= (and b!519112 res!317811) b!519114))

(assert (= (and b!519114 res!317812) b!519116))

(assert (= (and b!519116 res!317806) b!519120))

(assert (= (and b!519120 res!317816) b!519117))

(assert (= (and b!519117 res!317813) b!519111))

(assert (= (and b!519117 (not res!317809)) b!519119))

(assert (= (and b!519119 (not res!317808)) b!519110))

(assert (= (and b!519110 c!60948) b!519113))

(assert (= (and b!519110 (not c!60948)) b!519115))

(assert (= (and b!519113 res!317815) b!519118))

(declare-fun m!499819 () Bool)

(assert (=> b!519110 m!499819))

(declare-fun m!499821 () Bool)

(assert (=> b!519110 m!499821))

(declare-fun m!499823 () Bool)

(assert (=> start!47142 m!499823))

(declare-fun m!499825 () Bool)

(assert (=> start!47142 m!499825))

(declare-fun m!499827 () Bool)

(assert (=> b!519112 m!499827))

(assert (=> b!519111 m!499821))

(assert (=> b!519111 m!499821))

(declare-fun m!499829 () Bool)

(assert (=> b!519111 m!499829))

(declare-fun m!499831 () Bool)

(assert (=> b!519116 m!499831))

(declare-fun m!499833 () Bool)

(assert (=> b!519113 m!499833))

(declare-fun m!499835 () Bool)

(assert (=> b!519113 m!499835))

(declare-fun m!499837 () Bool)

(assert (=> b!519120 m!499837))

(declare-fun m!499839 () Bool)

(assert (=> b!519117 m!499839))

(declare-fun m!499841 () Bool)

(assert (=> b!519117 m!499841))

(declare-fun m!499843 () Bool)

(assert (=> b!519117 m!499843))

(declare-fun m!499845 () Bool)

(assert (=> b!519117 m!499845))

(assert (=> b!519117 m!499821))

(declare-fun m!499847 () Bool)

(assert (=> b!519117 m!499847))

(assert (=> b!519117 m!499821))

(declare-fun m!499849 () Bool)

(assert (=> b!519117 m!499849))

(declare-fun m!499851 () Bool)

(assert (=> b!519117 m!499851))

(assert (=> b!519117 m!499821))

(declare-fun m!499853 () Bool)

(assert (=> b!519117 m!499853))

(assert (=> b!519121 m!499821))

(assert (=> b!519121 m!499821))

(declare-fun m!499855 () Bool)

(assert (=> b!519121 m!499855))

(declare-fun m!499857 () Bool)

(assert (=> b!519114 m!499857))

(declare-fun m!499859 () Bool)

(assert (=> b!519108 m!499859))

(check-sat (not b!519108) (not b!519117) (not b!519116) (not b!519120) (not start!47142) (not b!519114) (not b!519121) (not b!519112) (not b!519111) (not b!519113))
(check-sat)
(get-model)

(declare-fun b!519214 () Bool)

(declare-fun e!302926 () Bool)

(declare-fun e!302927 () Bool)

(assert (=> b!519214 (= e!302926 e!302927)))

(declare-fun c!60957 () Bool)

(assert (=> b!519214 (= c!60957 (validKeyInArray!0 (select (arr!15944 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31720 () Bool)

(declare-fun call!31723 () Bool)

(assert (=> bm!31720 (= call!31723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519215 () Bool)

(assert (=> b!519215 (= e!302927 call!31723)))

(declare-fun b!519216 () Bool)

(declare-fun e!302928 () Bool)

(assert (=> b!519216 (= e!302927 e!302928)))

(declare-fun lt!237670 () (_ BitVec 64))

(assert (=> b!519216 (= lt!237670 (select (arr!15944 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237669 () Unit!16078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33167 (_ BitVec 64) (_ BitVec 32)) Unit!16078)

(assert (=> b!519216 (= lt!237669 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237670 #b00000000000000000000000000000000))))

(assert (=> b!519216 (arrayContainsKey!0 a!3235 lt!237670 #b00000000000000000000000000000000)))

(declare-fun lt!237668 () Unit!16078)

(assert (=> b!519216 (= lt!237668 lt!237669)))

(declare-fun res!317893 () Bool)

(assert (=> b!519216 (= res!317893 (= (seekEntryOrOpen!0 (select (arr!15944 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4408 #b00000000000000000000000000000000)))))

(assert (=> b!519216 (=> (not res!317893) (not e!302928))))

(declare-fun d!79867 () Bool)

(declare-fun res!317894 () Bool)

(assert (=> d!79867 (=> res!317894 e!302926)))

(assert (=> d!79867 (= res!317894 (bvsge #b00000000000000000000000000000000 (size!16309 a!3235)))))

(assert (=> d!79867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302926)))

(declare-fun b!519217 () Bool)

(assert (=> b!519217 (= e!302928 call!31723)))

(assert (= (and d!79867 (not res!317894)) b!519214))

(assert (= (and b!519214 c!60957) b!519216))

(assert (= (and b!519214 (not c!60957)) b!519215))

(assert (= (and b!519216 res!317893) b!519217))

(assert (= (or b!519217 b!519215) bm!31720))

(declare-fun m!499945 () Bool)

(assert (=> b!519214 m!499945))

(assert (=> b!519214 m!499945))

(declare-fun m!499947 () Bool)

(assert (=> b!519214 m!499947))

(declare-fun m!499949 () Bool)

(assert (=> bm!31720 m!499949))

(assert (=> b!519216 m!499945))

(declare-fun m!499951 () Bool)

(assert (=> b!519216 m!499951))

(declare-fun m!499953 () Bool)

(assert (=> b!519216 m!499953))

(assert (=> b!519216 m!499945))

(declare-fun m!499955 () Bool)

(assert (=> b!519216 m!499955))

(assert (=> b!519116 d!79867))

(declare-fun d!79869 () Bool)

(declare-fun lt!237679 () SeekEntryResult!4408)

(assert (=> d!79869 (and (or ((_ is Undefined!4408) lt!237679) (not ((_ is Found!4408) lt!237679)) (and (bvsge (index!19827 lt!237679) #b00000000000000000000000000000000) (bvslt (index!19827 lt!237679) (size!16309 a!3235)))) (or ((_ is Undefined!4408) lt!237679) ((_ is Found!4408) lt!237679) (not ((_ is MissingZero!4408) lt!237679)) (and (bvsge (index!19826 lt!237679) #b00000000000000000000000000000000) (bvslt (index!19826 lt!237679) (size!16309 a!3235)))) (or ((_ is Undefined!4408) lt!237679) ((_ is Found!4408) lt!237679) ((_ is MissingZero!4408) lt!237679) (not ((_ is MissingVacant!4408) lt!237679)) (and (bvsge (index!19829 lt!237679) #b00000000000000000000000000000000) (bvslt (index!19829 lt!237679) (size!16309 a!3235)))) (or ((_ is Undefined!4408) lt!237679) (ite ((_ is Found!4408) lt!237679) (= (select (arr!15944 a!3235) (index!19827 lt!237679)) (select (arr!15944 a!3235) j!176)) (ite ((_ is MissingZero!4408) lt!237679) (= (select (arr!15944 a!3235) (index!19826 lt!237679)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4408) lt!237679) (= (select (arr!15944 a!3235) (index!19829 lt!237679)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302935 () SeekEntryResult!4408)

(assert (=> d!79869 (= lt!237679 e!302935)))

(declare-fun c!60965 () Bool)

(declare-fun lt!237678 () SeekEntryResult!4408)

(assert (=> d!79869 (= c!60965 (and ((_ is Intermediate!4408) lt!237678) (undefined!5220 lt!237678)))))

(assert (=> d!79869 (= lt!237678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15944 a!3235) j!176) mask!3524) (select (arr!15944 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79869 (validMask!0 mask!3524)))

(assert (=> d!79869 (= (seekEntryOrOpen!0 (select (arr!15944 a!3235) j!176) a!3235 mask!3524) lt!237679)))

(declare-fun b!519230 () Bool)

(declare-fun e!302936 () SeekEntryResult!4408)

(assert (=> b!519230 (= e!302936 (Found!4408 (index!19828 lt!237678)))))

(declare-fun b!519231 () Bool)

(declare-fun e!302937 () SeekEntryResult!4408)

(assert (=> b!519231 (= e!302937 (MissingZero!4408 (index!19828 lt!237678)))))

(declare-fun b!519232 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33167 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!519232 (= e!302937 (seekKeyOrZeroReturnVacant!0 (x!48810 lt!237678) (index!19828 lt!237678) (index!19828 lt!237678) (select (arr!15944 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519233 () Bool)

(declare-fun c!60966 () Bool)

(declare-fun lt!237677 () (_ BitVec 64))

(assert (=> b!519233 (= c!60966 (= lt!237677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519233 (= e!302936 e!302937)))

(declare-fun b!519234 () Bool)

(assert (=> b!519234 (= e!302935 e!302936)))

(assert (=> b!519234 (= lt!237677 (select (arr!15944 a!3235) (index!19828 lt!237678)))))

(declare-fun c!60964 () Bool)

(assert (=> b!519234 (= c!60964 (= lt!237677 (select (arr!15944 a!3235) j!176)))))

(declare-fun b!519235 () Bool)

(assert (=> b!519235 (= e!302935 Undefined!4408)))

(assert (= (and d!79869 c!60965) b!519235))

(assert (= (and d!79869 (not c!60965)) b!519234))

(assert (= (and b!519234 c!60964) b!519230))

(assert (= (and b!519234 (not c!60964)) b!519233))

(assert (= (and b!519233 c!60966) b!519231))

(assert (= (and b!519233 (not c!60966)) b!519232))

(declare-fun m!499957 () Bool)

(assert (=> d!79869 m!499957))

(declare-fun m!499959 () Bool)

(assert (=> d!79869 m!499959))

(declare-fun m!499961 () Bool)

(assert (=> d!79869 m!499961))

(assert (=> d!79869 m!499849))

(assert (=> d!79869 m!499821))

(declare-fun m!499963 () Bool)

(assert (=> d!79869 m!499963))

(assert (=> d!79869 m!499823))

(assert (=> d!79869 m!499821))

(assert (=> d!79869 m!499849))

(assert (=> b!519232 m!499821))

(declare-fun m!499965 () Bool)

(assert (=> b!519232 m!499965))

(declare-fun m!499967 () Bool)

(assert (=> b!519234 m!499967))

(assert (=> b!519111 d!79869))

(declare-fun d!79871 () Bool)

(declare-fun lt!237685 () (_ BitVec 32))

(declare-fun lt!237684 () (_ BitVec 32))

(assert (=> d!79871 (= lt!237685 (bvmul (bvxor lt!237684 (bvlshr lt!237684 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79871 (= lt!237684 ((_ extract 31 0) (bvand (bvxor lt!237601 (bvlshr lt!237601 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79871 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317895 (let ((h!11053 ((_ extract 31 0) (bvand (bvxor lt!237601 (bvlshr lt!237601 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48813 (bvmul (bvxor h!11053 (bvlshr h!11053 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48813 (bvlshr x!48813 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317895 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317895 #b00000000000000000000000000000000))))))

(assert (=> d!79871 (= (toIndex!0 lt!237601 mask!3524) (bvand (bvxor lt!237685 (bvlshr lt!237685 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519117 d!79871))

(declare-fun d!79877 () Bool)

(declare-fun lt!237687 () (_ BitVec 32))

(declare-fun lt!237686 () (_ BitVec 32))

(assert (=> d!79877 (= lt!237687 (bvmul (bvxor lt!237686 (bvlshr lt!237686 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79877 (= lt!237686 ((_ extract 31 0) (bvand (bvxor (select (arr!15944 a!3235) j!176) (bvlshr (select (arr!15944 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79877 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317895 (let ((h!11053 ((_ extract 31 0) (bvand (bvxor (select (arr!15944 a!3235) j!176) (bvlshr (select (arr!15944 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48813 (bvmul (bvxor h!11053 (bvlshr h!11053 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48813 (bvlshr x!48813 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317895 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317895 #b00000000000000000000000000000000))))))

(assert (=> d!79877 (= (toIndex!0 (select (arr!15944 a!3235) j!176) mask!3524) (bvand (bvxor lt!237687 (bvlshr lt!237687 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519117 d!79877))

(declare-fun d!79879 () Bool)

(declare-fun e!302978 () Bool)

(assert (=> d!79879 e!302978))

(declare-fun c!60986 () Bool)

(declare-fun lt!237702 () SeekEntryResult!4408)

(assert (=> d!79879 (= c!60986 (and ((_ is Intermediate!4408) lt!237702) (undefined!5220 lt!237702)))))

(declare-fun e!302976 () SeekEntryResult!4408)

(assert (=> d!79879 (= lt!237702 e!302976)))

(declare-fun c!60987 () Bool)

(assert (=> d!79879 (= c!60987 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237701 () (_ BitVec 64))

(assert (=> d!79879 (= lt!237701 (select (arr!15944 lt!237604) lt!237600))))

(assert (=> d!79879 (validMask!0 mask!3524)))

(assert (=> d!79879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237600 lt!237601 lt!237604 mask!3524) lt!237702)))

(declare-fun b!519293 () Bool)

(assert (=> b!519293 (and (bvsge (index!19828 lt!237702) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237702) (size!16309 lt!237604)))))

(declare-fun res!317919 () Bool)

(assert (=> b!519293 (= res!317919 (= (select (arr!15944 lt!237604) (index!19828 lt!237702)) lt!237601))))

(declare-fun e!302977 () Bool)

(assert (=> b!519293 (=> res!317919 e!302977)))

(declare-fun e!302975 () Bool)

(assert (=> b!519293 (= e!302975 e!302977)))

(declare-fun b!519294 () Bool)

(assert (=> b!519294 (and (bvsge (index!19828 lt!237702) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237702) (size!16309 lt!237604)))))

(assert (=> b!519294 (= e!302977 (= (select (arr!15944 lt!237604) (index!19828 lt!237702)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519295 () Bool)

(declare-fun e!302979 () SeekEntryResult!4408)

(assert (=> b!519295 (= e!302979 (Intermediate!4408 false lt!237600 #b00000000000000000000000000000000))))

(declare-fun b!519296 () Bool)

(assert (=> b!519296 (= e!302976 e!302979)))

(declare-fun c!60985 () Bool)

(assert (=> b!519296 (= c!60985 (or (= lt!237701 lt!237601) (= (bvadd lt!237701 lt!237701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519297 () Bool)

(assert (=> b!519297 (= e!302978 e!302975)))

(declare-fun res!317917 () Bool)

(assert (=> b!519297 (= res!317917 (and ((_ is Intermediate!4408) lt!237702) (not (undefined!5220 lt!237702)) (bvslt (x!48810 lt!237702) #b01111111111111111111111111111110) (bvsge (x!48810 lt!237702) #b00000000000000000000000000000000) (bvsge (x!48810 lt!237702) #b00000000000000000000000000000000)))))

(assert (=> b!519297 (=> (not res!317917) (not e!302975))))

(declare-fun b!519298 () Bool)

(assert (=> b!519298 (and (bvsge (index!19828 lt!237702) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237702) (size!16309 lt!237604)))))

(declare-fun res!317918 () Bool)

(assert (=> b!519298 (= res!317918 (= (select (arr!15944 lt!237604) (index!19828 lt!237702)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519298 (=> res!317918 e!302977)))

(declare-fun b!519299 () Bool)

(assert (=> b!519299 (= e!302978 (bvsge (x!48810 lt!237702) #b01111111111111111111111111111110))))

(declare-fun b!519300 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519300 (= e!302979 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237600 #b00000000000000000000000000000000 mask!3524) lt!237601 lt!237604 mask!3524))))

(declare-fun b!519301 () Bool)

(assert (=> b!519301 (= e!302976 (Intermediate!4408 true lt!237600 #b00000000000000000000000000000000))))

(assert (= (and d!79879 c!60987) b!519301))

(assert (= (and d!79879 (not c!60987)) b!519296))

(assert (= (and b!519296 c!60985) b!519295))

(assert (= (and b!519296 (not c!60985)) b!519300))

(assert (= (and d!79879 c!60986) b!519299))

(assert (= (and d!79879 (not c!60986)) b!519297))

(assert (= (and b!519297 res!317917) b!519293))

(assert (= (and b!519293 (not res!317919)) b!519298))

(assert (= (and b!519298 (not res!317918)) b!519294))

(declare-fun m!499991 () Bool)

(assert (=> b!519300 m!499991))

(assert (=> b!519300 m!499991))

(declare-fun m!499993 () Bool)

(assert (=> b!519300 m!499993))

(declare-fun m!499995 () Bool)

(assert (=> b!519293 m!499995))

(assert (=> b!519298 m!499995))

(assert (=> b!519294 m!499995))

(declare-fun m!499997 () Bool)

(assert (=> d!79879 m!499997))

(assert (=> d!79879 m!499823))

(assert (=> b!519117 d!79879))

(declare-fun b!519302 () Bool)

(declare-fun e!302980 () Bool)

(declare-fun e!302981 () Bool)

(assert (=> b!519302 (= e!302980 e!302981)))

(declare-fun c!60988 () Bool)

(assert (=> b!519302 (= c!60988 (validKeyInArray!0 (select (arr!15944 a!3235) j!176)))))

(declare-fun bm!31724 () Bool)

(declare-fun call!31727 () Bool)

(assert (=> bm!31724 (= call!31727 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519303 () Bool)

(assert (=> b!519303 (= e!302981 call!31727)))

(declare-fun b!519304 () Bool)

(declare-fun e!302982 () Bool)

(assert (=> b!519304 (= e!302981 e!302982)))

(declare-fun lt!237705 () (_ BitVec 64))

(assert (=> b!519304 (= lt!237705 (select (arr!15944 a!3235) j!176))))

(declare-fun lt!237704 () Unit!16078)

(assert (=> b!519304 (= lt!237704 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237705 j!176))))

(assert (=> b!519304 (arrayContainsKey!0 a!3235 lt!237705 #b00000000000000000000000000000000)))

(declare-fun lt!237703 () Unit!16078)

(assert (=> b!519304 (= lt!237703 lt!237704)))

(declare-fun res!317920 () Bool)

(assert (=> b!519304 (= res!317920 (= (seekEntryOrOpen!0 (select (arr!15944 a!3235) j!176) a!3235 mask!3524) (Found!4408 j!176)))))

(assert (=> b!519304 (=> (not res!317920) (not e!302982))))

(declare-fun d!79891 () Bool)

(declare-fun res!317921 () Bool)

(assert (=> d!79891 (=> res!317921 e!302980)))

(assert (=> d!79891 (= res!317921 (bvsge j!176 (size!16309 a!3235)))))

(assert (=> d!79891 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302980)))

(declare-fun b!519305 () Bool)

(assert (=> b!519305 (= e!302982 call!31727)))

(assert (= (and d!79891 (not res!317921)) b!519302))

(assert (= (and b!519302 c!60988) b!519304))

(assert (= (and b!519302 (not c!60988)) b!519303))

(assert (= (and b!519304 res!317920) b!519305))

(assert (= (or b!519305 b!519303) bm!31724))

(assert (=> b!519302 m!499821))

(assert (=> b!519302 m!499821))

(assert (=> b!519302 m!499855))

(declare-fun m!499999 () Bool)

(assert (=> bm!31724 m!499999))

(assert (=> b!519304 m!499821))

(declare-fun m!500001 () Bool)

(assert (=> b!519304 m!500001))

(declare-fun m!500003 () Bool)

(assert (=> b!519304 m!500003))

(assert (=> b!519304 m!499821))

(assert (=> b!519304 m!499829))

(assert (=> b!519117 d!79891))

(declare-fun d!79893 () Bool)

(assert (=> d!79893 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237708 () Unit!16078)

(declare-fun choose!38 (array!33167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16078)

(assert (=> d!79893 (= lt!237708 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79893 (validMask!0 mask!3524)))

(assert (=> d!79893 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237708)))

(declare-fun bs!16345 () Bool)

(assert (= bs!16345 d!79893))

(assert (=> bs!16345 m!499853))

(declare-fun m!500005 () Bool)

(assert (=> bs!16345 m!500005))

(assert (=> bs!16345 m!499823))

(assert (=> b!519117 d!79893))

(declare-fun d!79895 () Bool)

(declare-fun e!302986 () Bool)

(assert (=> d!79895 e!302986))

(declare-fun c!60990 () Bool)

(declare-fun lt!237712 () SeekEntryResult!4408)

(assert (=> d!79895 (= c!60990 (and ((_ is Intermediate!4408) lt!237712) (undefined!5220 lt!237712)))))

(declare-fun e!302984 () SeekEntryResult!4408)

(assert (=> d!79895 (= lt!237712 e!302984)))

(declare-fun c!60991 () Bool)

(assert (=> d!79895 (= c!60991 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237711 () (_ BitVec 64))

(assert (=> d!79895 (= lt!237711 (select (arr!15944 a!3235) lt!237599))))

(assert (=> d!79895 (validMask!0 mask!3524)))

(assert (=> d!79895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237599 (select (arr!15944 a!3235) j!176) a!3235 mask!3524) lt!237712)))

(declare-fun b!519306 () Bool)

(assert (=> b!519306 (and (bvsge (index!19828 lt!237712) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237712) (size!16309 a!3235)))))

(declare-fun res!317924 () Bool)

(assert (=> b!519306 (= res!317924 (= (select (arr!15944 a!3235) (index!19828 lt!237712)) (select (arr!15944 a!3235) j!176)))))

(declare-fun e!302985 () Bool)

(assert (=> b!519306 (=> res!317924 e!302985)))

(declare-fun e!302983 () Bool)

(assert (=> b!519306 (= e!302983 e!302985)))

(declare-fun b!519307 () Bool)

(assert (=> b!519307 (and (bvsge (index!19828 lt!237712) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237712) (size!16309 a!3235)))))

(assert (=> b!519307 (= e!302985 (= (select (arr!15944 a!3235) (index!19828 lt!237712)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519308 () Bool)

(declare-fun e!302987 () SeekEntryResult!4408)

(assert (=> b!519308 (= e!302987 (Intermediate!4408 false lt!237599 #b00000000000000000000000000000000))))

(declare-fun b!519309 () Bool)

(assert (=> b!519309 (= e!302984 e!302987)))

(declare-fun c!60989 () Bool)

(assert (=> b!519309 (= c!60989 (or (= lt!237711 (select (arr!15944 a!3235) j!176)) (= (bvadd lt!237711 lt!237711) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519310 () Bool)

(assert (=> b!519310 (= e!302986 e!302983)))

(declare-fun res!317922 () Bool)

(assert (=> b!519310 (= res!317922 (and ((_ is Intermediate!4408) lt!237712) (not (undefined!5220 lt!237712)) (bvslt (x!48810 lt!237712) #b01111111111111111111111111111110) (bvsge (x!48810 lt!237712) #b00000000000000000000000000000000) (bvsge (x!48810 lt!237712) #b00000000000000000000000000000000)))))

(assert (=> b!519310 (=> (not res!317922) (not e!302983))))

(declare-fun b!519311 () Bool)

(assert (=> b!519311 (and (bvsge (index!19828 lt!237712) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237712) (size!16309 a!3235)))))

(declare-fun res!317923 () Bool)

(assert (=> b!519311 (= res!317923 (= (select (arr!15944 a!3235) (index!19828 lt!237712)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519311 (=> res!317923 e!302985)))

(declare-fun b!519312 () Bool)

(assert (=> b!519312 (= e!302986 (bvsge (x!48810 lt!237712) #b01111111111111111111111111111110))))

(declare-fun b!519313 () Bool)

(assert (=> b!519313 (= e!302987 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237599 #b00000000000000000000000000000000 mask!3524) (select (arr!15944 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519314 () Bool)

(assert (=> b!519314 (= e!302984 (Intermediate!4408 true lt!237599 #b00000000000000000000000000000000))))

(assert (= (and d!79895 c!60991) b!519314))

(assert (= (and d!79895 (not c!60991)) b!519309))

(assert (= (and b!519309 c!60989) b!519308))

(assert (= (and b!519309 (not c!60989)) b!519313))

(assert (= (and d!79895 c!60990) b!519312))

(assert (= (and d!79895 (not c!60990)) b!519310))

(assert (= (and b!519310 res!317922) b!519306))

(assert (= (and b!519306 (not res!317924)) b!519311))

(assert (= (and b!519311 (not res!317923)) b!519307))

(declare-fun m!500007 () Bool)

(assert (=> b!519313 m!500007))

(assert (=> b!519313 m!500007))

(assert (=> b!519313 m!499821))

(declare-fun m!500009 () Bool)

(assert (=> b!519313 m!500009))

(declare-fun m!500011 () Bool)

(assert (=> b!519306 m!500011))

(assert (=> b!519311 m!500011))

(assert (=> b!519307 m!500011))

(declare-fun m!500013 () Bool)

(assert (=> d!79895 m!500013))

(assert (=> d!79895 m!499823))

(assert (=> b!519117 d!79895))

(declare-fun d!79897 () Bool)

(declare-fun res!317932 () Bool)

(declare-fun e!302995 () Bool)

(assert (=> d!79897 (=> res!317932 e!302995)))

(assert (=> d!79897 (= res!317932 (= (select (arr!15944 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79897 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302995)))

(declare-fun b!519322 () Bool)

(declare-fun e!302996 () Bool)

(assert (=> b!519322 (= e!302995 e!302996)))

(declare-fun res!317933 () Bool)

(assert (=> b!519322 (=> (not res!317933) (not e!302996))))

(assert (=> b!519322 (= res!317933 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16309 a!3235)))))

(declare-fun b!519323 () Bool)

(assert (=> b!519323 (= e!302996 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79897 (not res!317932)) b!519322))

(assert (= (and b!519322 res!317933) b!519323))

(assert (=> d!79897 m!499945))

(declare-fun m!500019 () Bool)

(assert (=> b!519323 m!500019))

(assert (=> b!519112 d!79897))

(declare-fun d!79901 () Bool)

(declare-fun e!303008 () Bool)

(assert (=> d!79901 e!303008))

(declare-fun res!317937 () Bool)

(assert (=> d!79901 (=> (not res!317937) (not e!303008))))

(assert (=> d!79901 (= res!317937 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16309 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16309 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16309 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16309 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16309 a!3235))))))

(declare-fun lt!237725 () Unit!16078)

(declare-fun choose!47 (array!33167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16078)

(assert (=> d!79901 (= lt!237725 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237599 #b00000000000000000000000000000000 (index!19828 lt!237607) (x!48810 lt!237607) mask!3524))))

(assert (=> d!79901 (validMask!0 mask!3524)))

(assert (=> d!79901 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237599 #b00000000000000000000000000000000 (index!19828 lt!237607) (x!48810 lt!237607) mask!3524) lt!237725)))

(declare-fun b!519344 () Bool)

(assert (=> b!519344 (= e!303008 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237599 (select (store (arr!15944 a!3235) i!1204 k0!2280) j!176) (array!33168 (store (arr!15944 a!3235) i!1204 k0!2280) (size!16309 a!3235)) mask!3524) (Intermediate!4408 false (index!19828 lt!237607) (x!48810 lt!237607))))))

(assert (= (and d!79901 res!317937) b!519344))

(declare-fun m!500035 () Bool)

(assert (=> d!79901 m!500035))

(assert (=> d!79901 m!499823))

(assert (=> b!519344 m!499841))

(assert (=> b!519344 m!499845))

(assert (=> b!519344 m!499845))

(declare-fun m!500037 () Bool)

(assert (=> b!519344 m!500037))

(assert (=> b!519113 d!79901))

(declare-fun d!79905 () Bool)

(declare-fun e!303012 () Bool)

(assert (=> d!79905 e!303012))

(declare-fun c!61002 () Bool)

(declare-fun lt!237727 () SeekEntryResult!4408)

(assert (=> d!79905 (= c!61002 (and ((_ is Intermediate!4408) lt!237727) (undefined!5220 lt!237727)))))

(declare-fun e!303010 () SeekEntryResult!4408)

(assert (=> d!79905 (= lt!237727 e!303010)))

(declare-fun c!61003 () Bool)

(assert (=> d!79905 (= c!61003 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237726 () (_ BitVec 64))

(assert (=> d!79905 (= lt!237726 (select (arr!15944 lt!237604) lt!237599))))

(assert (=> d!79905 (validMask!0 mask!3524)))

(assert (=> d!79905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237599 lt!237601 lt!237604 mask!3524) lt!237727)))

(declare-fun b!519345 () Bool)

(assert (=> b!519345 (and (bvsge (index!19828 lt!237727) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237727) (size!16309 lt!237604)))))

(declare-fun res!317940 () Bool)

(assert (=> b!519345 (= res!317940 (= (select (arr!15944 lt!237604) (index!19828 lt!237727)) lt!237601))))

(declare-fun e!303011 () Bool)

(assert (=> b!519345 (=> res!317940 e!303011)))

(declare-fun e!303009 () Bool)

(assert (=> b!519345 (= e!303009 e!303011)))

(declare-fun b!519346 () Bool)

(assert (=> b!519346 (and (bvsge (index!19828 lt!237727) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237727) (size!16309 lt!237604)))))

(assert (=> b!519346 (= e!303011 (= (select (arr!15944 lt!237604) (index!19828 lt!237727)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519347 () Bool)

(declare-fun e!303013 () SeekEntryResult!4408)

(assert (=> b!519347 (= e!303013 (Intermediate!4408 false lt!237599 #b00000000000000000000000000000000))))

(declare-fun b!519348 () Bool)

(assert (=> b!519348 (= e!303010 e!303013)))

(declare-fun c!61001 () Bool)

(assert (=> b!519348 (= c!61001 (or (= lt!237726 lt!237601) (= (bvadd lt!237726 lt!237726) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519349 () Bool)

(assert (=> b!519349 (= e!303012 e!303009)))

(declare-fun res!317938 () Bool)

(assert (=> b!519349 (= res!317938 (and ((_ is Intermediate!4408) lt!237727) (not (undefined!5220 lt!237727)) (bvslt (x!48810 lt!237727) #b01111111111111111111111111111110) (bvsge (x!48810 lt!237727) #b00000000000000000000000000000000) (bvsge (x!48810 lt!237727) #b00000000000000000000000000000000)))))

(assert (=> b!519349 (=> (not res!317938) (not e!303009))))

(declare-fun b!519350 () Bool)

(assert (=> b!519350 (and (bvsge (index!19828 lt!237727) #b00000000000000000000000000000000) (bvslt (index!19828 lt!237727) (size!16309 lt!237604)))))

(declare-fun res!317939 () Bool)

(assert (=> b!519350 (= res!317939 (= (select (arr!15944 lt!237604) (index!19828 lt!237727)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519350 (=> res!317939 e!303011)))

(declare-fun b!519351 () Bool)

(assert (=> b!519351 (= e!303012 (bvsge (x!48810 lt!237727) #b01111111111111111111111111111110))))

(declare-fun b!519352 () Bool)

(assert (=> b!519352 (= e!303013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237599 #b00000000000000000000000000000000 mask!3524) lt!237601 lt!237604 mask!3524))))

(declare-fun b!519353 () Bool)

(assert (=> b!519353 (= e!303010 (Intermediate!4408 true lt!237599 #b00000000000000000000000000000000))))

(assert (= (and d!79905 c!61003) b!519353))

(assert (= (and d!79905 (not c!61003)) b!519348))

(assert (= (and b!519348 c!61001) b!519347))

(assert (= (and b!519348 (not c!61001)) b!519352))

(assert (= (and d!79905 c!61002) b!519351))

(assert (= (and d!79905 (not c!61002)) b!519349))

(assert (= (and b!519349 res!317938) b!519345))

(assert (= (and b!519345 (not res!317940)) b!519350))

(assert (= (and b!519350 (not res!317939)) b!519346))

(assert (=> b!519352 m!500007))

(assert (=> b!519352 m!500007))

(declare-fun m!500039 () Bool)

(assert (=> b!519352 m!500039))

(declare-fun m!500041 () Bool)

(assert (=> b!519345 m!500041))

(assert (=> b!519350 m!500041))

(assert (=> b!519346 m!500041))

(declare-fun m!500043 () Bool)

(assert (=> d!79905 m!500043))

(assert (=> d!79905 m!499823))

(assert (=> b!519113 d!79905))

(declare-fun d!79907 () Bool)

(assert (=> d!79907 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519108 d!79907))

(declare-fun d!79909 () Bool)

(declare-fun lt!237736 () SeekEntryResult!4408)

(assert (=> d!79909 (and (or ((_ is Undefined!4408) lt!237736) (not ((_ is Found!4408) lt!237736)) (and (bvsge (index!19827 lt!237736) #b00000000000000000000000000000000) (bvslt (index!19827 lt!237736) (size!16309 a!3235)))) (or ((_ is Undefined!4408) lt!237736) ((_ is Found!4408) lt!237736) (not ((_ is MissingZero!4408) lt!237736)) (and (bvsge (index!19826 lt!237736) #b00000000000000000000000000000000) (bvslt (index!19826 lt!237736) (size!16309 a!3235)))) (or ((_ is Undefined!4408) lt!237736) ((_ is Found!4408) lt!237736) ((_ is MissingZero!4408) lt!237736) (not ((_ is MissingVacant!4408) lt!237736)) (and (bvsge (index!19829 lt!237736) #b00000000000000000000000000000000) (bvslt (index!19829 lt!237736) (size!16309 a!3235)))) (or ((_ is Undefined!4408) lt!237736) (ite ((_ is Found!4408) lt!237736) (= (select (arr!15944 a!3235) (index!19827 lt!237736)) k0!2280) (ite ((_ is MissingZero!4408) lt!237736) (= (select (arr!15944 a!3235) (index!19826 lt!237736)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4408) lt!237736) (= (select (arr!15944 a!3235) (index!19829 lt!237736)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303018 () SeekEntryResult!4408)

(assert (=> d!79909 (= lt!237736 e!303018)))

(declare-fun c!61009 () Bool)

(declare-fun lt!237735 () SeekEntryResult!4408)

(assert (=> d!79909 (= c!61009 (and ((_ is Intermediate!4408) lt!237735) (undefined!5220 lt!237735)))))

(assert (=> d!79909 (= lt!237735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79909 (validMask!0 mask!3524)))

(assert (=> d!79909 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237736)))

(declare-fun b!519362 () Bool)

(declare-fun e!303019 () SeekEntryResult!4408)

(assert (=> b!519362 (= e!303019 (Found!4408 (index!19828 lt!237735)))))

(declare-fun b!519363 () Bool)

(declare-fun e!303020 () SeekEntryResult!4408)

(assert (=> b!519363 (= e!303020 (MissingZero!4408 (index!19828 lt!237735)))))

(declare-fun b!519364 () Bool)

(assert (=> b!519364 (= e!303020 (seekKeyOrZeroReturnVacant!0 (x!48810 lt!237735) (index!19828 lt!237735) (index!19828 lt!237735) k0!2280 a!3235 mask!3524))))

(declare-fun b!519365 () Bool)

(declare-fun c!61010 () Bool)

(declare-fun lt!237734 () (_ BitVec 64))

(assert (=> b!519365 (= c!61010 (= lt!237734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519365 (= e!303019 e!303020)))

(declare-fun b!519366 () Bool)

(assert (=> b!519366 (= e!303018 e!303019)))

(assert (=> b!519366 (= lt!237734 (select (arr!15944 a!3235) (index!19828 lt!237735)))))

(declare-fun c!61008 () Bool)

(assert (=> b!519366 (= c!61008 (= lt!237734 k0!2280))))

(declare-fun b!519367 () Bool)

(assert (=> b!519367 (= e!303018 Undefined!4408)))

(assert (= (and d!79909 c!61009) b!519367))

(assert (= (and d!79909 (not c!61009)) b!519366))

(assert (= (and b!519366 c!61008) b!519362))

(assert (= (and b!519366 (not c!61008)) b!519365))

(assert (= (and b!519365 c!61010) b!519363))

(assert (= (and b!519365 (not c!61010)) b!519364))

(declare-fun m!500045 () Bool)

(assert (=> d!79909 m!500045))

(declare-fun m!500047 () Bool)

(assert (=> d!79909 m!500047))

(declare-fun m!500049 () Bool)

(assert (=> d!79909 m!500049))

(declare-fun m!500051 () Bool)

(assert (=> d!79909 m!500051))

(declare-fun m!500053 () Bool)

(assert (=> d!79909 m!500053))

(assert (=> d!79909 m!499823))

(assert (=> d!79909 m!500051))

(declare-fun m!500055 () Bool)

(assert (=> b!519364 m!500055))

(declare-fun m!500057 () Bool)

(assert (=> b!519366 m!500057))

(assert (=> b!519114 d!79909))

(declare-fun b!519403 () Bool)

(declare-fun e!303046 () Bool)

(declare-fun contains!2741 (List!10141 (_ BitVec 64)) Bool)

(assert (=> b!519403 (= e!303046 (contains!2741 Nil!10138 (select (arr!15944 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519404 () Bool)

(declare-fun e!303045 () Bool)

(declare-fun call!31730 () Bool)

(assert (=> b!519404 (= e!303045 call!31730)))

(declare-fun b!519405 () Bool)

(declare-fun e!303047 () Bool)

(declare-fun e!303044 () Bool)

(assert (=> b!519405 (= e!303047 e!303044)))

(declare-fun res!317960 () Bool)

(assert (=> b!519405 (=> (not res!317960) (not e!303044))))

(assert (=> b!519405 (= res!317960 (not e!303046))))

(declare-fun res!317959 () Bool)

(assert (=> b!519405 (=> (not res!317959) (not e!303046))))

(assert (=> b!519405 (= res!317959 (validKeyInArray!0 (select (arr!15944 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519406 () Bool)

(assert (=> b!519406 (= e!303045 call!31730)))

(declare-fun b!519407 () Bool)

(assert (=> b!519407 (= e!303044 e!303045)))

(declare-fun c!61020 () Bool)

(assert (=> b!519407 (= c!61020 (validKeyInArray!0 (select (arr!15944 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31727 () Bool)

(assert (=> bm!31727 (= call!31730 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61020 (Cons!10137 (select (arr!15944 a!3235) #b00000000000000000000000000000000) Nil!10138) Nil!10138)))))

(declare-fun d!79911 () Bool)

(declare-fun res!317958 () Bool)

(assert (=> d!79911 (=> res!317958 e!303047)))

(assert (=> d!79911 (= res!317958 (bvsge #b00000000000000000000000000000000 (size!16309 a!3235)))))

(assert (=> d!79911 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10138) e!303047)))

(assert (= (and d!79911 (not res!317958)) b!519405))

(assert (= (and b!519405 res!317959) b!519403))

(assert (= (and b!519405 res!317960) b!519407))

(assert (= (and b!519407 c!61020) b!519404))

(assert (= (and b!519407 (not c!61020)) b!519406))

(assert (= (or b!519404 b!519406) bm!31727))

(assert (=> b!519403 m!499945))

(assert (=> b!519403 m!499945))

(declare-fun m!500067 () Bool)

(assert (=> b!519403 m!500067))

(assert (=> b!519405 m!499945))

(assert (=> b!519405 m!499945))

(assert (=> b!519405 m!499947))

(assert (=> b!519407 m!499945))

(assert (=> b!519407 m!499945))

(assert (=> b!519407 m!499947))

(assert (=> bm!31727 m!499945))

(declare-fun m!500069 () Bool)

(assert (=> bm!31727 m!500069))

(assert (=> b!519120 d!79911))

(declare-fun d!79919 () Bool)

(assert (=> d!79919 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47142 d!79919))

(declare-fun d!79929 () Bool)

(assert (=> d!79929 (= (array_inv!11827 a!3235) (bvsge (size!16309 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47142 d!79929))

(declare-fun d!79931 () Bool)

(assert (=> d!79931 (= (validKeyInArray!0 (select (arr!15944 a!3235) j!176)) (and (not (= (select (arr!15944 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15944 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519121 d!79931))

(check-sat (not b!519352) (not b!519313) (not b!519344) (not b!519300) (not b!519304) (not b!519323) (not d!79895) (not d!79905) (not b!519407) (not bm!31727) (not b!519216) (not b!519405) (not d!79879) (not b!519364) (not bm!31720) (not d!79869) (not d!79901) (not b!519232) (not b!519302) (not bm!31724) (not b!519403) (not b!519214) (not d!79893) (not d!79909))
(check-sat)
