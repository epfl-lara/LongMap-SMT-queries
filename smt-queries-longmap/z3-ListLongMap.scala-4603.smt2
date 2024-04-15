; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64172 () Bool)

(assert start!64172)

(declare-fun b!720745 () Bool)

(declare-fun e!404165 () Bool)

(declare-fun e!404166 () Bool)

(assert (=> b!720745 (= e!404165 e!404166)))

(declare-fun res!482977 () Bool)

(assert (=> b!720745 (=> (not res!482977) (not e!404166))))

(declare-datatypes ((array!40827 0))(
  ( (array!40828 (arr!19538 (Array (_ BitVec 32) (_ BitVec 64))) (size!19959 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40827)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7135 0))(
  ( (MissingZero!7135 (index!30908 (_ BitVec 32))) (Found!7135 (index!30909 (_ BitVec 32))) (Intermediate!7135 (undefined!7947 Bool) (index!30910 (_ BitVec 32)) (x!61922 (_ BitVec 32))) (Undefined!7135) (MissingVacant!7135 (index!30911 (_ BitVec 32))) )
))
(declare-fun lt!319695 () SeekEntryResult!7135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40827 (_ BitVec 32)) SeekEntryResult!7135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720745 (= res!482977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319695))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720745 (= lt!319695 (Intermediate!7135 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404167 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!720746 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40827 (_ BitVec 32)) SeekEntryResult!7135)

(assert (=> b!720746 (= e!404167 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19538 a!3186) j!159) a!3186 mask!3328) (Found!7135 j!159)))))

(declare-fun b!720748 () Bool)

(declare-fun res!482975 () Bool)

(declare-fun e!404164 () Bool)

(assert (=> b!720748 (=> (not res!482975) (not e!404164))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720748 (= res!482975 (validKeyInArray!0 k0!2102))))

(declare-fun b!720749 () Bool)

(assert (=> b!720749 (= e!404167 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319695))))

(declare-fun b!720750 () Bool)

(assert (=> b!720750 (= e!404164 e!404165)))

(declare-fun res!482978 () Bool)

(assert (=> b!720750 (=> (not res!482978) (not e!404165))))

(declare-fun lt!319696 () SeekEntryResult!7135)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720750 (= res!482978 (or (= lt!319696 (MissingZero!7135 i!1173)) (= lt!319696 (MissingVacant!7135 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40827 (_ BitVec 32)) SeekEntryResult!7135)

(assert (=> b!720750 (= lt!319696 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720751 () Bool)

(declare-fun res!482979 () Bool)

(assert (=> b!720751 (=> (not res!482979) (not e!404165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40827 (_ BitVec 32)) Bool)

(assert (=> b!720751 (= res!482979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720752 () Bool)

(declare-fun res!482982 () Bool)

(assert (=> b!720752 (=> (not res!482982) (not e!404164))))

(assert (=> b!720752 (= res!482982 (and (= (size!19959 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19959 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19959 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720753 () Bool)

(declare-fun res!482973 () Bool)

(assert (=> b!720753 (=> (not res!482973) (not e!404165))))

(declare-datatypes ((List!13579 0))(
  ( (Nil!13576) (Cons!13575 (h!14626 (_ BitVec 64)) (t!19885 List!13579)) )
))
(declare-fun arrayNoDuplicates!0 (array!40827 (_ BitVec 32) List!13579) Bool)

(assert (=> b!720753 (= res!482973 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13576))))

(declare-fun b!720754 () Bool)

(declare-fun res!482981 () Bool)

(assert (=> b!720754 (=> (not res!482981) (not e!404165))))

(assert (=> b!720754 (= res!482981 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19959 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19959 a!3186))))))

(declare-fun b!720755 () Bool)

(declare-fun res!482980 () Bool)

(assert (=> b!720755 (=> (not res!482980) (not e!404164))))

(assert (=> b!720755 (= res!482980 (validKeyInArray!0 (select (arr!19538 a!3186) j!159)))))

(declare-fun b!720756 () Bool)

(declare-fun res!482971 () Bool)

(assert (=> b!720756 (=> (not res!482971) (not e!404166))))

(assert (=> b!720756 (= res!482971 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19538 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720747 () Bool)

(declare-fun res!482972 () Bool)

(assert (=> b!720747 (=> (not res!482972) (not e!404164))))

(declare-fun arrayContainsKey!0 (array!40827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720747 (= res!482972 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!482974 () Bool)

(assert (=> start!64172 (=> (not res!482974) (not e!404164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64172 (= res!482974 (validMask!0 mask!3328))))

(assert (=> start!64172 e!404164))

(assert (=> start!64172 true))

(declare-fun array_inv!15421 (array!40827) Bool)

(assert (=> start!64172 (array_inv!15421 a!3186)))

(declare-fun b!720757 () Bool)

(declare-fun res!482976 () Bool)

(assert (=> b!720757 (=> (not res!482976) (not e!404166))))

(assert (=> b!720757 (= res!482976 e!404167)))

(declare-fun c!79257 () Bool)

(assert (=> b!720757 (= c!79257 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720758 () Bool)

(declare-fun lt!319697 () (_ BitVec 32))

(assert (=> b!720758 (= e!404166 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319697 #b00000000000000000000000000000000) (bvsge lt!319697 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!720758 (= lt!319697 (toIndex!0 (select (store (arr!19538 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(assert (= (and start!64172 res!482974) b!720752))

(assert (= (and b!720752 res!482982) b!720755))

(assert (= (and b!720755 res!482980) b!720748))

(assert (= (and b!720748 res!482975) b!720747))

(assert (= (and b!720747 res!482972) b!720750))

(assert (= (and b!720750 res!482978) b!720751))

(assert (= (and b!720751 res!482979) b!720753))

(assert (= (and b!720753 res!482973) b!720754))

(assert (= (and b!720754 res!482981) b!720745))

(assert (= (and b!720745 res!482977) b!720756))

(assert (= (and b!720756 res!482971) b!720757))

(assert (= (and b!720757 c!79257) b!720749))

(assert (= (and b!720757 (not c!79257)) b!720746))

(assert (= (and b!720757 res!482976) b!720758))

(declare-fun m!675209 () Bool)

(assert (=> b!720755 m!675209))

(assert (=> b!720755 m!675209))

(declare-fun m!675211 () Bool)

(assert (=> b!720755 m!675211))

(declare-fun m!675213 () Bool)

(assert (=> b!720758 m!675213))

(declare-fun m!675215 () Bool)

(assert (=> b!720758 m!675215))

(assert (=> b!720758 m!675215))

(declare-fun m!675217 () Bool)

(assert (=> b!720758 m!675217))

(declare-fun m!675219 () Bool)

(assert (=> b!720751 m!675219))

(declare-fun m!675221 () Bool)

(assert (=> start!64172 m!675221))

(declare-fun m!675223 () Bool)

(assert (=> start!64172 m!675223))

(declare-fun m!675225 () Bool)

(assert (=> b!720748 m!675225))

(assert (=> b!720749 m!675209))

(assert (=> b!720749 m!675209))

(declare-fun m!675227 () Bool)

(assert (=> b!720749 m!675227))

(declare-fun m!675229 () Bool)

(assert (=> b!720750 m!675229))

(declare-fun m!675231 () Bool)

(assert (=> b!720747 m!675231))

(assert (=> b!720746 m!675209))

(assert (=> b!720746 m!675209))

(declare-fun m!675233 () Bool)

(assert (=> b!720746 m!675233))

(assert (=> b!720745 m!675209))

(assert (=> b!720745 m!675209))

(declare-fun m!675235 () Bool)

(assert (=> b!720745 m!675235))

(assert (=> b!720745 m!675235))

(assert (=> b!720745 m!675209))

(declare-fun m!675237 () Bool)

(assert (=> b!720745 m!675237))

(declare-fun m!675239 () Bool)

(assert (=> b!720756 m!675239))

(declare-fun m!675241 () Bool)

(assert (=> b!720753 m!675241))

(check-sat (not b!720748) (not start!64172) (not b!720746) (not b!720755) (not b!720750) (not b!720745) (not b!720747) (not b!720753) (not b!720758) (not b!720751) (not b!720749))
(check-sat)
(get-model)

(declare-fun b!720861 () Bool)

(declare-fun e!404210 () SeekEntryResult!7135)

(assert (=> b!720861 (= e!404210 (Intermediate!7135 false index!1321 x!1131))))

(declare-fun b!720862 () Bool)

(declare-fun e!404212 () SeekEntryResult!7135)

(assert (=> b!720862 (= e!404212 e!404210)))

(declare-fun lt!319721 () (_ BitVec 64))

(declare-fun c!79272 () Bool)

(assert (=> b!720862 (= c!79272 (or (= lt!319721 (select (arr!19538 a!3186) j!159)) (= (bvadd lt!319721 lt!319721) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720863 () Bool)

(declare-fun e!404209 () Bool)

(declare-fun lt!319720 () SeekEntryResult!7135)

(assert (=> b!720863 (= e!404209 (bvsge (x!61922 lt!319720) #b01111111111111111111111111111110))))

(declare-fun b!720864 () Bool)

(assert (=> b!720864 (= e!404212 (Intermediate!7135 true index!1321 x!1131))))

(declare-fun b!720865 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720865 (= e!404210 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19538 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720866 () Bool)

(assert (=> b!720866 (and (bvsge (index!30910 lt!319720) #b00000000000000000000000000000000) (bvslt (index!30910 lt!319720) (size!19959 a!3186)))))

(declare-fun res!483061 () Bool)

(assert (=> b!720866 (= res!483061 (= (select (arr!19538 a!3186) (index!30910 lt!319720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404208 () Bool)

(assert (=> b!720866 (=> res!483061 e!404208)))

(declare-fun b!720867 () Bool)

(assert (=> b!720867 (and (bvsge (index!30910 lt!319720) #b00000000000000000000000000000000) (bvslt (index!30910 lt!319720) (size!19959 a!3186)))))

(assert (=> b!720867 (= e!404208 (= (select (arr!19538 a!3186) (index!30910 lt!319720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!720868 () Bool)

(assert (=> b!720868 (and (bvsge (index!30910 lt!319720) #b00000000000000000000000000000000) (bvslt (index!30910 lt!319720) (size!19959 a!3186)))))

(declare-fun res!483062 () Bool)

(assert (=> b!720868 (= res!483062 (= (select (arr!19538 a!3186) (index!30910 lt!319720)) (select (arr!19538 a!3186) j!159)))))

(assert (=> b!720868 (=> res!483062 e!404208)))

(declare-fun e!404211 () Bool)

(assert (=> b!720868 (= e!404211 e!404208)))

(declare-fun b!720869 () Bool)

(assert (=> b!720869 (= e!404209 e!404211)))

(declare-fun res!483063 () Bool)

(get-info :version)

(assert (=> b!720869 (= res!483063 (and ((_ is Intermediate!7135) lt!319720) (not (undefined!7947 lt!319720)) (bvslt (x!61922 lt!319720) #b01111111111111111111111111111110) (bvsge (x!61922 lt!319720) #b00000000000000000000000000000000) (bvsge (x!61922 lt!319720) x!1131)))))

(assert (=> b!720869 (=> (not res!483063) (not e!404211))))

(declare-fun d!98989 () Bool)

(assert (=> d!98989 e!404209))

(declare-fun c!79271 () Bool)

(assert (=> d!98989 (= c!79271 (and ((_ is Intermediate!7135) lt!319720) (undefined!7947 lt!319720)))))

(assert (=> d!98989 (= lt!319720 e!404212)))

(declare-fun c!79270 () Bool)

(assert (=> d!98989 (= c!79270 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!98989 (= lt!319721 (select (arr!19538 a!3186) index!1321))))

(assert (=> d!98989 (validMask!0 mask!3328)))

(assert (=> d!98989 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319720)))

(assert (= (and d!98989 c!79270) b!720864))

(assert (= (and d!98989 (not c!79270)) b!720862))

(assert (= (and b!720862 c!79272) b!720861))

(assert (= (and b!720862 (not c!79272)) b!720865))

(assert (= (and d!98989 c!79271) b!720863))

(assert (= (and d!98989 (not c!79271)) b!720869))

(assert (= (and b!720869 res!483063) b!720868))

(assert (= (and b!720868 (not res!483062)) b!720866))

(assert (= (and b!720866 (not res!483061)) b!720867))

(declare-fun m!675311 () Bool)

(assert (=> b!720866 m!675311))

(declare-fun m!675313 () Bool)

(assert (=> b!720865 m!675313))

(assert (=> b!720865 m!675313))

(assert (=> b!720865 m!675209))

(declare-fun m!675315 () Bool)

(assert (=> b!720865 m!675315))

(assert (=> b!720868 m!675311))

(assert (=> b!720867 m!675311))

(declare-fun m!675317 () Bool)

(assert (=> d!98989 m!675317))

(assert (=> d!98989 m!675221))

(assert (=> b!720749 d!98989))

(declare-fun d!98993 () Bool)

(assert (=> d!98993 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64172 d!98993))

(declare-fun d!98999 () Bool)

(assert (=> d!98999 (= (array_inv!15421 a!3186) (bvsge (size!19959 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64172 d!98999))

(declare-fun d!99001 () Bool)

(assert (=> d!99001 (= (validKeyInArray!0 (select (arr!19538 a!3186) j!159)) (and (not (= (select (arr!19538 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19538 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720755 d!99001))

(declare-fun b!720942 () Bool)

(declare-fun e!404257 () SeekEntryResult!7135)

(declare-fun e!404255 () SeekEntryResult!7135)

(assert (=> b!720942 (= e!404257 e!404255)))

(declare-fun lt!319746 () (_ BitVec 64))

(declare-fun lt!319747 () SeekEntryResult!7135)

(assert (=> b!720942 (= lt!319746 (select (arr!19538 a!3186) (index!30910 lt!319747)))))

(declare-fun c!79298 () Bool)

(assert (=> b!720942 (= c!79298 (= lt!319746 k0!2102))))

(declare-fun e!404256 () SeekEntryResult!7135)

(declare-fun b!720943 () Bool)

(assert (=> b!720943 (= e!404256 (seekKeyOrZeroReturnVacant!0 (x!61922 lt!319747) (index!30910 lt!319747) (index!30910 lt!319747) k0!2102 a!3186 mask!3328))))

(declare-fun b!720944 () Bool)

(assert (=> b!720944 (= e!404255 (Found!7135 (index!30910 lt!319747)))))

(declare-fun b!720945 () Bool)

(assert (=> b!720945 (= e!404256 (MissingZero!7135 (index!30910 lt!319747)))))

(declare-fun d!99003 () Bool)

(declare-fun lt!319748 () SeekEntryResult!7135)

(assert (=> d!99003 (and (or ((_ is Undefined!7135) lt!319748) (not ((_ is Found!7135) lt!319748)) (and (bvsge (index!30909 lt!319748) #b00000000000000000000000000000000) (bvslt (index!30909 lt!319748) (size!19959 a!3186)))) (or ((_ is Undefined!7135) lt!319748) ((_ is Found!7135) lt!319748) (not ((_ is MissingZero!7135) lt!319748)) (and (bvsge (index!30908 lt!319748) #b00000000000000000000000000000000) (bvslt (index!30908 lt!319748) (size!19959 a!3186)))) (or ((_ is Undefined!7135) lt!319748) ((_ is Found!7135) lt!319748) ((_ is MissingZero!7135) lt!319748) (not ((_ is MissingVacant!7135) lt!319748)) (and (bvsge (index!30911 lt!319748) #b00000000000000000000000000000000) (bvslt (index!30911 lt!319748) (size!19959 a!3186)))) (or ((_ is Undefined!7135) lt!319748) (ite ((_ is Found!7135) lt!319748) (= (select (arr!19538 a!3186) (index!30909 lt!319748)) k0!2102) (ite ((_ is MissingZero!7135) lt!319748) (= (select (arr!19538 a!3186) (index!30908 lt!319748)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7135) lt!319748) (= (select (arr!19538 a!3186) (index!30911 lt!319748)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99003 (= lt!319748 e!404257)))

(declare-fun c!79297 () Bool)

(assert (=> d!99003 (= c!79297 (and ((_ is Intermediate!7135) lt!319747) (undefined!7947 lt!319747)))))

(assert (=> d!99003 (= lt!319747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99003 (validMask!0 mask!3328)))

(assert (=> d!99003 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319748)))

(declare-fun b!720946 () Bool)

(assert (=> b!720946 (= e!404257 Undefined!7135)))

(declare-fun b!720947 () Bool)

(declare-fun c!79299 () Bool)

(assert (=> b!720947 (= c!79299 (= lt!319746 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720947 (= e!404255 e!404256)))

(assert (= (and d!99003 c!79297) b!720946))

(assert (= (and d!99003 (not c!79297)) b!720942))

(assert (= (and b!720942 c!79298) b!720944))

(assert (= (and b!720942 (not c!79298)) b!720947))

(assert (= (and b!720947 c!79299) b!720945))

(assert (= (and b!720947 (not c!79299)) b!720943))

(declare-fun m!675339 () Bool)

(assert (=> b!720942 m!675339))

(declare-fun m!675341 () Bool)

(assert (=> b!720943 m!675341))

(declare-fun m!675343 () Bool)

(assert (=> d!99003 m!675343))

(declare-fun m!675345 () Bool)

(assert (=> d!99003 m!675345))

(declare-fun m!675347 () Bool)

(assert (=> d!99003 m!675347))

(declare-fun m!675349 () Bool)

(assert (=> d!99003 m!675349))

(assert (=> d!99003 m!675347))

(assert (=> d!99003 m!675221))

(declare-fun m!675351 () Bool)

(assert (=> d!99003 m!675351))

(assert (=> b!720750 d!99003))

(declare-fun b!720958 () Bool)

(declare-fun e!404267 () Bool)

(declare-fun e!404266 () Bool)

(assert (=> b!720958 (= e!404267 e!404266)))

(declare-fun res!483095 () Bool)

(assert (=> b!720958 (=> (not res!483095) (not e!404266))))

(declare-fun e!404269 () Bool)

(assert (=> b!720958 (= res!483095 (not e!404269))))

(declare-fun res!483096 () Bool)

(assert (=> b!720958 (=> (not res!483096) (not e!404269))))

(assert (=> b!720958 (= res!483096 (validKeyInArray!0 (select (arr!19538 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720959 () Bool)

(declare-fun e!404268 () Bool)

(assert (=> b!720959 (= e!404266 e!404268)))

(declare-fun c!79302 () Bool)

(assert (=> b!720959 (= c!79302 (validKeyInArray!0 (select (arr!19538 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720960 () Bool)

(declare-fun contains!4026 (List!13579 (_ BitVec 64)) Bool)

(assert (=> b!720960 (= e!404269 (contains!4026 Nil!13576 (select (arr!19538 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720961 () Bool)

(declare-fun call!34744 () Bool)

(assert (=> b!720961 (= e!404268 call!34744)))

(declare-fun b!720962 () Bool)

(assert (=> b!720962 (= e!404268 call!34744)))

(declare-fun d!99017 () Bool)

(declare-fun res!483097 () Bool)

(assert (=> d!99017 (=> res!483097 e!404267)))

(assert (=> d!99017 (= res!483097 (bvsge #b00000000000000000000000000000000 (size!19959 a!3186)))))

(assert (=> d!99017 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13576) e!404267)))

(declare-fun bm!34741 () Bool)

(assert (=> bm!34741 (= call!34744 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79302 (Cons!13575 (select (arr!19538 a!3186) #b00000000000000000000000000000000) Nil!13576) Nil!13576)))))

(assert (= (and d!99017 (not res!483097)) b!720958))

(assert (= (and b!720958 res!483096) b!720960))

(assert (= (and b!720958 res!483095) b!720959))

(assert (= (and b!720959 c!79302) b!720962))

(assert (= (and b!720959 (not c!79302)) b!720961))

(assert (= (or b!720962 b!720961) bm!34741))

(declare-fun m!675353 () Bool)

(assert (=> b!720958 m!675353))

(assert (=> b!720958 m!675353))

(declare-fun m!675355 () Bool)

(assert (=> b!720958 m!675355))

(assert (=> b!720959 m!675353))

(assert (=> b!720959 m!675353))

(assert (=> b!720959 m!675355))

(assert (=> b!720960 m!675353))

(assert (=> b!720960 m!675353))

(declare-fun m!675357 () Bool)

(assert (=> b!720960 m!675357))

(assert (=> bm!34741 m!675353))

(declare-fun m!675359 () Bool)

(assert (=> bm!34741 m!675359))

(assert (=> b!720753 d!99017))

(declare-fun d!99019 () Bool)

(assert (=> d!99019 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720748 d!99019))

(declare-fun d!99021 () Bool)

(declare-fun res!483102 () Bool)

(declare-fun e!404274 () Bool)

(assert (=> d!99021 (=> res!483102 e!404274)))

(assert (=> d!99021 (= res!483102 (= (select (arr!19538 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99021 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!404274)))

(declare-fun b!720967 () Bool)

(declare-fun e!404275 () Bool)

(assert (=> b!720967 (= e!404274 e!404275)))

(declare-fun res!483103 () Bool)

(assert (=> b!720967 (=> (not res!483103) (not e!404275))))

(assert (=> b!720967 (= res!483103 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19959 a!3186)))))

(declare-fun b!720968 () Bool)

(assert (=> b!720968 (= e!404275 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99021 (not res!483102)) b!720967))

(assert (= (and b!720967 res!483103) b!720968))

(assert (=> d!99021 m!675353))

(declare-fun m!675361 () Bool)

(assert (=> b!720968 m!675361))

(assert (=> b!720747 d!99021))

(declare-fun d!99023 () Bool)

(declare-fun lt!319769 () (_ BitVec 32))

(declare-fun lt!319768 () (_ BitVec 32))

(assert (=> d!99023 (= lt!319769 (bvmul (bvxor lt!319768 (bvlshr lt!319768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99023 (= lt!319768 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19538 a!3186) i!1173 k0!2102) j!159) (bvlshr (select (store (arr!19538 a!3186) i!1173 k0!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99023 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483104 (let ((h!14630 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19538 a!3186) i!1173 k0!2102) j!159) (bvlshr (select (store (arr!19538 a!3186) i!1173 k0!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61929 (bvmul (bvxor h!14630 (bvlshr h!14630 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61929 (bvlshr x!61929 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483104 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483104 #b00000000000000000000000000000000))))))

(assert (=> d!99023 (= (toIndex!0 (select (store (arr!19538 a!3186) i!1173 k0!2102) j!159) mask!3328) (bvand (bvxor lt!319769 (bvlshr lt!319769 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!720758 d!99023))

(declare-fun b!720999 () Bool)

(declare-fun e!404293 () SeekEntryResult!7135)

(assert (=> b!720999 (= e!404293 (Intermediate!7135 false (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721000 () Bool)

(declare-fun e!404295 () SeekEntryResult!7135)

(assert (=> b!721000 (= e!404295 e!404293)))

(declare-fun lt!319771 () (_ BitVec 64))

(declare-fun c!79320 () Bool)

(assert (=> b!721000 (= c!79320 (or (= lt!319771 (select (arr!19538 a!3186) j!159)) (= (bvadd lt!319771 lt!319771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721001 () Bool)

(declare-fun e!404292 () Bool)

(declare-fun lt!319770 () SeekEntryResult!7135)

(assert (=> b!721001 (= e!404292 (bvsge (x!61922 lt!319770) #b01111111111111111111111111111110))))

(declare-fun b!721002 () Bool)

(assert (=> b!721002 (= e!404295 (Intermediate!7135 true (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721003 () Bool)

(assert (=> b!721003 (= e!404293 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19538 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721004 () Bool)

(assert (=> b!721004 (and (bvsge (index!30910 lt!319770) #b00000000000000000000000000000000) (bvslt (index!30910 lt!319770) (size!19959 a!3186)))))

(declare-fun res!483105 () Bool)

(assert (=> b!721004 (= res!483105 (= (select (arr!19538 a!3186) (index!30910 lt!319770)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404291 () Bool)

(assert (=> b!721004 (=> res!483105 e!404291)))

(declare-fun b!721005 () Bool)

(assert (=> b!721005 (and (bvsge (index!30910 lt!319770) #b00000000000000000000000000000000) (bvslt (index!30910 lt!319770) (size!19959 a!3186)))))

(assert (=> b!721005 (= e!404291 (= (select (arr!19538 a!3186) (index!30910 lt!319770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!721006 () Bool)

(assert (=> b!721006 (and (bvsge (index!30910 lt!319770) #b00000000000000000000000000000000) (bvslt (index!30910 lt!319770) (size!19959 a!3186)))))

(declare-fun res!483106 () Bool)

(assert (=> b!721006 (= res!483106 (= (select (arr!19538 a!3186) (index!30910 lt!319770)) (select (arr!19538 a!3186) j!159)))))

(assert (=> b!721006 (=> res!483106 e!404291)))

(declare-fun e!404294 () Bool)

(assert (=> b!721006 (= e!404294 e!404291)))

(declare-fun b!721007 () Bool)

(assert (=> b!721007 (= e!404292 e!404294)))

(declare-fun res!483107 () Bool)

(assert (=> b!721007 (= res!483107 (and ((_ is Intermediate!7135) lt!319770) (not (undefined!7947 lt!319770)) (bvslt (x!61922 lt!319770) #b01111111111111111111111111111110) (bvsge (x!61922 lt!319770) #b00000000000000000000000000000000) (bvsge (x!61922 lt!319770) #b00000000000000000000000000000000)))))

(assert (=> b!721007 (=> (not res!483107) (not e!404294))))

(declare-fun d!99025 () Bool)

(assert (=> d!99025 e!404292))

(declare-fun c!79319 () Bool)

(assert (=> d!99025 (= c!79319 (and ((_ is Intermediate!7135) lt!319770) (undefined!7947 lt!319770)))))

(assert (=> d!99025 (= lt!319770 e!404295)))

(declare-fun c!79318 () Bool)

(assert (=> d!99025 (= c!79318 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99025 (= lt!319771 (select (arr!19538 a!3186) (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328)))))

(assert (=> d!99025 (validMask!0 mask!3328)))

(assert (=> d!99025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319770)))

(assert (= (and d!99025 c!79318) b!721002))

(assert (= (and d!99025 (not c!79318)) b!721000))

(assert (= (and b!721000 c!79320) b!720999))

(assert (= (and b!721000 (not c!79320)) b!721003))

(assert (= (and d!99025 c!79319) b!721001))

(assert (= (and d!99025 (not c!79319)) b!721007))

(assert (= (and b!721007 res!483107) b!721006))

(assert (= (and b!721006 (not res!483106)) b!721004))

(assert (= (and b!721004 (not res!483105)) b!721005))

(declare-fun m!675377 () Bool)

(assert (=> b!721004 m!675377))

(assert (=> b!721003 m!675235))

(declare-fun m!675379 () Bool)

(assert (=> b!721003 m!675379))

(assert (=> b!721003 m!675379))

(assert (=> b!721003 m!675209))

(declare-fun m!675381 () Bool)

(assert (=> b!721003 m!675381))

(assert (=> b!721006 m!675377))

(assert (=> b!721005 m!675377))

(assert (=> d!99025 m!675235))

(declare-fun m!675383 () Bool)

(assert (=> d!99025 m!675383))

(assert (=> d!99025 m!675221))

(assert (=> b!720745 d!99025))

(declare-fun d!99029 () Bool)

(declare-fun lt!319773 () (_ BitVec 32))

(declare-fun lt!319772 () (_ BitVec 32))

(assert (=> d!99029 (= lt!319773 (bvmul (bvxor lt!319772 (bvlshr lt!319772 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99029 (= lt!319772 ((_ extract 31 0) (bvand (bvxor (select (arr!19538 a!3186) j!159) (bvlshr (select (arr!19538 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99029 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483104 (let ((h!14630 ((_ extract 31 0) (bvand (bvxor (select (arr!19538 a!3186) j!159) (bvlshr (select (arr!19538 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61929 (bvmul (bvxor h!14630 (bvlshr h!14630 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61929 (bvlshr x!61929 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483104 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483104 #b00000000000000000000000000000000))))))

(assert (=> d!99029 (= (toIndex!0 (select (arr!19538 a!3186) j!159) mask!3328) (bvand (bvxor lt!319773 (bvlshr lt!319773 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!720745 d!99029))

(declare-fun d!99031 () Bool)

(declare-fun res!483125 () Bool)

(declare-fun e!404321 () Bool)

(assert (=> d!99031 (=> res!483125 e!404321)))

(assert (=> d!99031 (= res!483125 (bvsge #b00000000000000000000000000000000 (size!19959 a!3186)))))

(assert (=> d!99031 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!404321)))

(declare-fun bm!34747 () Bool)

(declare-fun call!34750 () Bool)

(assert (=> bm!34747 (= call!34750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!721040 () Bool)

(declare-fun e!404322 () Bool)

(assert (=> b!721040 (= e!404321 e!404322)))

(declare-fun c!79329 () Bool)

(assert (=> b!721040 (= c!79329 (validKeyInArray!0 (select (arr!19538 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721041 () Bool)

(assert (=> b!721041 (= e!404322 call!34750)))

(declare-fun b!721042 () Bool)

(declare-fun e!404320 () Bool)

(assert (=> b!721042 (= e!404320 call!34750)))

(declare-fun b!721043 () Bool)

(assert (=> b!721043 (= e!404322 e!404320)))

(declare-fun lt!319794 () (_ BitVec 64))

(assert (=> b!721043 (= lt!319794 (select (arr!19538 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24638 0))(
  ( (Unit!24639) )
))
(declare-fun lt!319795 () Unit!24638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40827 (_ BitVec 64) (_ BitVec 32)) Unit!24638)

(assert (=> b!721043 (= lt!319795 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319794 #b00000000000000000000000000000000))))

(assert (=> b!721043 (arrayContainsKey!0 a!3186 lt!319794 #b00000000000000000000000000000000)))

(declare-fun lt!319796 () Unit!24638)

(assert (=> b!721043 (= lt!319796 lt!319795)))

(declare-fun res!483124 () Bool)

(assert (=> b!721043 (= res!483124 (= (seekEntryOrOpen!0 (select (arr!19538 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7135 #b00000000000000000000000000000000)))))

(assert (=> b!721043 (=> (not res!483124) (not e!404320))))

(assert (= (and d!99031 (not res!483125)) b!721040))

(assert (= (and b!721040 c!79329) b!721043))

(assert (= (and b!721040 (not c!79329)) b!721041))

(assert (= (and b!721043 res!483124) b!721042))

(assert (= (or b!721042 b!721041) bm!34747))

(declare-fun m!675413 () Bool)

(assert (=> bm!34747 m!675413))

(assert (=> b!721040 m!675353))

(assert (=> b!721040 m!675353))

(assert (=> b!721040 m!675355))

(assert (=> b!721043 m!675353))

(declare-fun m!675415 () Bool)

(assert (=> b!721043 m!675415))

(declare-fun m!675417 () Bool)

(assert (=> b!721043 m!675417))

(assert (=> b!721043 m!675353))

(declare-fun m!675419 () Bool)

(assert (=> b!721043 m!675419))

(assert (=> b!720751 d!99031))

(declare-fun lt!319809 () SeekEntryResult!7135)

(declare-fun d!99045 () Bool)

(assert (=> d!99045 (and (or ((_ is Undefined!7135) lt!319809) (not ((_ is Found!7135) lt!319809)) (and (bvsge (index!30909 lt!319809) #b00000000000000000000000000000000) (bvslt (index!30909 lt!319809) (size!19959 a!3186)))) (or ((_ is Undefined!7135) lt!319809) ((_ is Found!7135) lt!319809) (not ((_ is MissingVacant!7135) lt!319809)) (not (= (index!30911 lt!319809) resIntermediateIndex!5)) (and (bvsge (index!30911 lt!319809) #b00000000000000000000000000000000) (bvslt (index!30911 lt!319809) (size!19959 a!3186)))) (or ((_ is Undefined!7135) lt!319809) (ite ((_ is Found!7135) lt!319809) (= (select (arr!19538 a!3186) (index!30909 lt!319809)) (select (arr!19538 a!3186) j!159)) (and ((_ is MissingVacant!7135) lt!319809) (= (index!30911 lt!319809) resIntermediateIndex!5) (= (select (arr!19538 a!3186) (index!30911 lt!319809)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!404347 () SeekEntryResult!7135)

(assert (=> d!99045 (= lt!319809 e!404347)))

(declare-fun c!79343 () Bool)

(assert (=> d!99045 (= c!79343 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!319810 () (_ BitVec 64))

(assert (=> d!99045 (= lt!319810 (select (arr!19538 a!3186) index!1321))))

(assert (=> d!99045 (validMask!0 mask!3328)))

(assert (=> d!99045 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19538 a!3186) j!159) a!3186 mask!3328) lt!319809)))

(declare-fun b!721080 () Bool)

(declare-fun c!79342 () Bool)

(assert (=> b!721080 (= c!79342 (= lt!319810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404346 () SeekEntryResult!7135)

(declare-fun e!404348 () SeekEntryResult!7135)

(assert (=> b!721080 (= e!404346 e!404348)))

(declare-fun b!721081 () Bool)

(assert (=> b!721081 (= e!404347 Undefined!7135)))

(declare-fun b!721082 () Bool)

(assert (=> b!721082 (= e!404347 e!404346)))

(declare-fun c!79344 () Bool)

(assert (=> b!721082 (= c!79344 (= lt!319810 (select (arr!19538 a!3186) j!159)))))

(declare-fun b!721083 () Bool)

(assert (=> b!721083 (= e!404346 (Found!7135 index!1321))))

(declare-fun b!721084 () Bool)

(assert (=> b!721084 (= e!404348 (MissingVacant!7135 resIntermediateIndex!5))))

(declare-fun b!721085 () Bool)

(assert (=> b!721085 (= e!404348 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19538 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99045 c!79343) b!721081))

(assert (= (and d!99045 (not c!79343)) b!721082))

(assert (= (and b!721082 c!79344) b!721083))

(assert (= (and b!721082 (not c!79344)) b!721080))

(assert (= (and b!721080 c!79342) b!721084))

(assert (= (and b!721080 (not c!79342)) b!721085))

(declare-fun m!675435 () Bool)

(assert (=> d!99045 m!675435))

(declare-fun m!675437 () Bool)

(assert (=> d!99045 m!675437))

(assert (=> d!99045 m!675317))

(assert (=> d!99045 m!675221))

(assert (=> b!721085 m!675313))

(assert (=> b!721085 m!675313))

(assert (=> b!721085 m!675209))

(declare-fun m!675439 () Bool)

(assert (=> b!721085 m!675439))

(assert (=> b!720746 d!99045))

(check-sat (not b!721003) (not b!720958) (not bm!34741) (not b!720943) (not b!720865) (not b!721085) (not b!721043) (not b!720968) (not d!99025) (not d!98989) (not b!720959) (not b!720960) (not d!99045) (not bm!34747) (not d!99003) (not b!721040))
(check-sat)
