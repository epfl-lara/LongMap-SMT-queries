; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122514 () Bool)

(assert start!122514)

(declare-fun b!1419290 () Bool)

(declare-fun e!803026 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!625752 () (_ BitVec 32))

(assert (=> b!1419290 (= e!803026 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625752 #b00000000000000000000000000000000) (bvsge lt!625752 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96918 0))(
  ( (array!96919 (arr!46778 (Array (_ BitVec 32) (_ BitVec 64))) (size!47328 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96918)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419290 (= lt!625752 (toIndex!0 (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419291 () Bool)

(declare-fun res!954816 () Bool)

(assert (=> b!1419291 (=> (not res!954816) (not e!803026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96918 (_ BitVec 32)) Bool)

(assert (=> b!1419291 (= res!954816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419292 () Bool)

(declare-fun res!954814 () Bool)

(assert (=> b!1419292 (=> (not res!954814) (not e!803026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419292 (= res!954814 (validKeyInArray!0 (select (arr!46778 a!2831) j!81)))))

(declare-fun b!1419293 () Bool)

(declare-fun res!954815 () Bool)

(assert (=> b!1419293 (=> (not res!954815) (not e!803026))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419293 (= res!954815 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47328 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47328 a!2831))))))

(declare-fun b!1419294 () Bool)

(declare-fun res!954811 () Bool)

(assert (=> b!1419294 (=> (not res!954811) (not e!803026))))

(declare-datatypes ((SeekEntryResult!11063 0))(
  ( (MissingZero!11063 (index!46644 (_ BitVec 32))) (Found!11063 (index!46645 (_ BitVec 32))) (Intermediate!11063 (undefined!11875 Bool) (index!46646 (_ BitVec 32)) (x!128315 (_ BitVec 32))) (Undefined!11063) (MissingVacant!11063 (index!46647 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96918 (_ BitVec 32)) SeekEntryResult!11063)

(assert (=> b!1419294 (= res!954811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) (select (arr!46778 a!2831) j!81) a!2831 mask!2608) (Intermediate!11063 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419295 () Bool)

(declare-fun res!954812 () Bool)

(assert (=> b!1419295 (=> (not res!954812) (not e!803026))))

(assert (=> b!1419295 (= res!954812 (and (= (size!47328 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47328 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47328 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419296 () Bool)

(declare-fun res!954813 () Bool)

(assert (=> b!1419296 (=> (not res!954813) (not e!803026))))

(declare-datatypes ((List!33288 0))(
  ( (Nil!33285) (Cons!33284 (h!34583 (_ BitVec 64)) (t!47982 List!33288)) )
))
(declare-fun arrayNoDuplicates!0 (array!96918 (_ BitVec 32) List!33288) Bool)

(assert (=> b!1419296 (= res!954813 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33285))))

(declare-fun res!954810 () Bool)

(assert (=> start!122514 (=> (not res!954810) (not e!803026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122514 (= res!954810 (validMask!0 mask!2608))))

(assert (=> start!122514 e!803026))

(assert (=> start!122514 true))

(declare-fun array_inv!35806 (array!96918) Bool)

(assert (=> start!122514 (array_inv!35806 a!2831)))

(declare-fun b!1419297 () Bool)

(declare-fun res!954817 () Bool)

(assert (=> b!1419297 (=> (not res!954817) (not e!803026))))

(assert (=> b!1419297 (= res!954817 (validKeyInArray!0 (select (arr!46778 a!2831) i!982)))))

(assert (= (and start!122514 res!954810) b!1419295))

(assert (= (and b!1419295 res!954812) b!1419297))

(assert (= (and b!1419297 res!954817) b!1419292))

(assert (= (and b!1419292 res!954814) b!1419291))

(assert (= (and b!1419291 res!954816) b!1419296))

(assert (= (and b!1419296 res!954813) b!1419293))

(assert (= (and b!1419293 res!954815) b!1419294))

(assert (= (and b!1419294 res!954811) b!1419290))

(declare-fun m!1309809 () Bool)

(assert (=> b!1419292 m!1309809))

(assert (=> b!1419292 m!1309809))

(declare-fun m!1309811 () Bool)

(assert (=> b!1419292 m!1309811))

(declare-fun m!1309813 () Bool)

(assert (=> b!1419296 m!1309813))

(declare-fun m!1309815 () Bool)

(assert (=> b!1419291 m!1309815))

(declare-fun m!1309817 () Bool)

(assert (=> b!1419290 m!1309817))

(declare-fun m!1309819 () Bool)

(assert (=> b!1419290 m!1309819))

(assert (=> b!1419290 m!1309819))

(declare-fun m!1309821 () Bool)

(assert (=> b!1419290 m!1309821))

(declare-fun m!1309823 () Bool)

(assert (=> start!122514 m!1309823))

(declare-fun m!1309825 () Bool)

(assert (=> start!122514 m!1309825))

(assert (=> b!1419294 m!1309809))

(assert (=> b!1419294 m!1309809))

(declare-fun m!1309827 () Bool)

(assert (=> b!1419294 m!1309827))

(assert (=> b!1419294 m!1309827))

(assert (=> b!1419294 m!1309809))

(declare-fun m!1309829 () Bool)

(assert (=> b!1419294 m!1309829))

(declare-fun m!1309831 () Bool)

(assert (=> b!1419297 m!1309831))

(assert (=> b!1419297 m!1309831))

(declare-fun m!1309833 () Bool)

(assert (=> b!1419297 m!1309833))

(push 1)

(assert (not start!122514))

(assert (not b!1419294))

(assert (not b!1419292))

(assert (not b!1419297))

(assert (not b!1419296))

(assert (not b!1419290))

(assert (not b!1419291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152989 () Bool)

(declare-fun lt!625770 () (_ BitVec 32))

(declare-fun lt!625769 () (_ BitVec 32))

(assert (=> d!152989 (= lt!625770 (bvmul (bvxor lt!625769 (bvlshr lt!625769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152989 (= lt!625769 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152989 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954867 (let ((h!34587 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128319 (bvmul (bvxor h!34587 (bvlshr h!34587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128319 (bvlshr x!128319 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954867 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954867 #b00000000000000000000000000000000))))))

(assert (=> d!152989 (= (toIndex!0 (select (store (arr!46778 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (bvand (bvxor lt!625770 (bvlshr lt!625770 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419290 d!152989))

(declare-fun b!1419368 () Bool)

(declare-fun e!803057 () Bool)

(declare-fun call!67309 () Bool)

(assert (=> b!1419368 (= e!803057 call!67309)))

(declare-fun b!1419369 () Bool)

(declare-fun e!803059 () Bool)

(declare-fun contains!9845 (List!33288 (_ BitVec 64)) Bool)

(assert (=> b!1419369 (= e!803059 (contains!9845 Nil!33285 (select (arr!46778 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152997 () Bool)

(declare-fun res!954882 () Bool)

(declare-fun e!803060 () Bool)

(assert (=> d!152997 (=> res!954882 e!803060)))

(assert (=> d!152997 (= res!954882 (bvsge #b00000000000000000000000000000000 (size!47328 a!2831)))))

(assert (=> d!152997 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33285) e!803060)))

(declare-fun bm!67306 () Bool)

(declare-fun c!131730 () Bool)

(assert (=> bm!67306 (= call!67309 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131730 (Cons!33284 (select (arr!46778 a!2831) #b00000000000000000000000000000000) Nil!33285) Nil!33285)))))

(declare-fun b!1419370 () Bool)

(declare-fun e!803058 () Bool)

(assert (=> b!1419370 (= e!803060 e!803058)))

(declare-fun res!954881 () Bool)

(assert (=> b!1419370 (=> (not res!954881) (not e!803058))))

(assert (=> b!1419370 (= res!954881 (not e!803059))))

(declare-fun res!954880 () Bool)

(assert (=> b!1419370 (=> (not res!954880) (not e!803059))))

(assert (=> b!1419370 (= res!954880 (validKeyInArray!0 (select (arr!46778 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419371 () Bool)

(assert (=> b!1419371 (= e!803058 e!803057)))

(assert (=> b!1419371 (= c!131730 (validKeyInArray!0 (select (arr!46778 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419372 () Bool)

(assert (=> b!1419372 (= e!803057 call!67309)))

(assert (= (and d!152997 (not res!954882)) b!1419370))

(assert (= (and b!1419370 res!954880) b!1419369))

(assert (= (and b!1419370 res!954881) b!1419371))

(assert (= (and b!1419371 c!131730) b!1419368))

(assert (= (and b!1419371 (not c!131730)) b!1419372))

(assert (= (or b!1419368 b!1419372) bm!67306))

(declare-fun m!1309899 () Bool)

(assert (=> b!1419369 m!1309899))

(assert (=> b!1419369 m!1309899))

(declare-fun m!1309901 () Bool)

(assert (=> b!1419369 m!1309901))

(assert (=> bm!67306 m!1309899))

(declare-fun m!1309903 () Bool)

(assert (=> bm!67306 m!1309903))

(assert (=> b!1419370 m!1309899))

(assert (=> b!1419370 m!1309899))

(declare-fun m!1309905 () Bool)

(assert (=> b!1419370 m!1309905))

(assert (=> b!1419371 m!1309899))

(assert (=> b!1419371 m!1309899))

(assert (=> b!1419371 m!1309905))

(assert (=> b!1419296 d!152997))

(declare-fun b!1419421 () Bool)

(declare-fun e!803096 () Bool)

(declare-fun e!803099 () Bool)

(assert (=> b!1419421 (= e!803096 e!803099)))

(declare-fun res!954909 () Bool)

(declare-fun lt!625791 () SeekEntryResult!11063)

(assert (=> b!1419421 (= res!954909 (and (is-Intermediate!11063 lt!625791) (not (undefined!11875 lt!625791)) (bvslt (x!128315 lt!625791) #b01111111111111111111111111111110) (bvsge (x!128315 lt!625791) #b00000000000000000000000000000000) (bvsge (x!128315 lt!625791) #b00000000000000000000000000000000)))))

(assert (=> b!1419421 (=> (not res!954909) (not e!803099))))

(declare-fun b!1419422 () Bool)

(assert (=> b!1419422 (= e!803096 (bvsge (x!128315 lt!625791) #b01111111111111111111111111111110))))

(declare-fun b!1419423 () Bool)

(assert (=> b!1419423 (and (bvsge (index!46646 lt!625791) #b00000000000000000000000000000000) (bvslt (index!46646 lt!625791) (size!47328 a!2831)))))

(declare-fun res!954910 () Bool)

(assert (=> b!1419423 (= res!954910 (= (select (arr!46778 a!2831) (index!46646 lt!625791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!803097 () Bool)

(assert (=> b!1419423 (=> res!954910 e!803097)))

(declare-fun e!803095 () SeekEntryResult!11063)

(declare-fun b!1419424 () Bool)

(assert (=> b!1419424 (= e!803095 (Intermediate!11063 true (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!153003 () Bool)

(assert (=> d!153003 e!803096))

(declare-fun c!131744 () Bool)

(assert (=> d!153003 (= c!131744 (and (is-Intermediate!11063 lt!625791) (undefined!11875 lt!625791)))))

(assert (=> d!153003 (= lt!625791 e!803095)))

(declare-fun c!131743 () Bool)

(assert (=> d!153003 (= c!131743 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625790 () (_ BitVec 64))

(assert (=> d!153003 (= lt!625790 (select (arr!46778 a!2831) (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608)))))

(assert (=> d!153003 (validMask!0 mask!2608)))

(assert (=> d!153003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) (select (arr!46778 a!2831) j!81) a!2831 mask!2608) lt!625791)))

(declare-fun b!1419425 () Bool)

(assert (=> b!1419425 (and (bvsge (index!46646 lt!625791) #b00000000000000000000000000000000) (bvslt (index!46646 lt!625791) (size!47328 a!2831)))))

(declare-fun res!954908 () Bool)

(assert (=> b!1419425 (= res!954908 (= (select (arr!46778 a!2831) (index!46646 lt!625791)) (select (arr!46778 a!2831) j!81)))))

(assert (=> b!1419425 (=> res!954908 e!803097)))

(assert (=> b!1419425 (= e!803099 e!803097)))

(declare-fun b!1419426 () Bool)

(declare-fun e!803098 () SeekEntryResult!11063)

(assert (=> b!1419426 (= e!803095 e!803098)))

(declare-fun c!131745 () Bool)

(assert (=> b!1419426 (= c!131745 (or (= lt!625790 (select (arr!46778 a!2831) j!81)) (= (bvadd lt!625790 lt!625790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1419427 () Bool)

(assert (=> b!1419427 (= e!803098 (Intermediate!11063 false (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419428 () Bool)

(assert (=> b!1419428 (and (bvsge (index!46646 lt!625791) #b00000000000000000000000000000000) (bvslt (index!46646 lt!625791) (size!47328 a!2831)))))

(assert (=> b!1419428 (= e!803097 (= (select (arr!46778 a!2831) (index!46646 lt!625791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419429 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419429 (= e!803098 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46778 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!153003 c!131743) b!1419424))

(assert (= (and d!153003 (not c!131743)) b!1419426))

(assert (= (and b!1419426 c!131745) b!1419427))

(assert (= (and b!1419426 (not c!131745)) b!1419429))

(assert (= (and d!153003 c!131744) b!1419422))

(assert (= (and d!153003 (not c!131744)) b!1419421))

(assert (= (and b!1419421 res!954909) b!1419425))

(assert (= (and b!1419425 (not res!954908)) b!1419423))

(assert (= (and b!1419423 (not res!954910)) b!1419428))

(declare-fun m!1309919 () Bool)

(assert (=> b!1419428 m!1309919))

(assert (=> b!1419423 m!1309919))

(assert (=> d!153003 m!1309827))

(declare-fun m!1309921 () Bool)

(assert (=> d!153003 m!1309921))

(assert (=> d!153003 m!1309823))

(assert (=> b!1419429 m!1309827))

(declare-fun m!1309923 () Bool)

(assert (=> b!1419429 m!1309923))

(assert (=> b!1419429 m!1309923))

(assert (=> b!1419429 m!1309809))

(declare-fun m!1309925 () Bool)

(assert (=> b!1419429 m!1309925))

(assert (=> b!1419425 m!1309919))

(assert (=> b!1419294 d!153003))

(declare-fun d!153017 () Bool)

(declare-fun lt!625793 () (_ BitVec 32))

(declare-fun lt!625792 () (_ BitVec 32))

(assert (=> d!153017 (= lt!625793 (bvmul (bvxor lt!625792 (bvlshr lt!625792 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153017 (= lt!625792 ((_ extract 31 0) (bvand (bvxor (select (arr!46778 a!2831) j!81) (bvlshr (select (arr!46778 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153017 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954867 (let ((h!34587 ((_ extract 31 0) (bvand (bvxor (select (arr!46778 a!2831) j!81) (bvlshr (select (arr!46778 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128319 (bvmul (bvxor h!34587 (bvlshr h!34587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128319 (bvlshr x!128319 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954867 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954867 #b00000000000000000000000000000000))))))

(assert (=> d!153017 (= (toIndex!0 (select (arr!46778 a!2831) j!81) mask!2608) (bvand (bvxor lt!625793 (bvlshr lt!625793 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419294 d!153017))

(declare-fun d!153019 () Bool)

(assert (=> d!153019 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122514 d!153019))

(declare-fun d!153025 () Bool)

(assert (=> d!153025 (= (array_inv!35806 a!2831) (bvsge (size!47328 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122514 d!153025))

(declare-fun d!153027 () Bool)

(declare-fun res!954934 () Bool)

(declare-fun e!803137 () Bool)

(assert (=> d!153027 (=> res!954934 e!803137)))

(assert (=> d!153027 (= res!954934 (bvsge #b00000000000000000000000000000000 (size!47328 a!2831)))))

(assert (=> d!153027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803137)))

(declare-fun b!1419492 () Bool)

(declare-fun e!803138 () Bool)

(declare-fun call!67318 () Bool)

(assert (=> b!1419492 (= e!803138 call!67318)))

(declare-fun bm!67315 () Bool)

(assert (=> bm!67315 (= call!67318 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1419493 () Bool)

(declare-fun e!803136 () Bool)

(assert (=> b!1419493 (= e!803137 e!803136)))

(declare-fun c!131766 () Bool)

(assert (=> b!1419493 (= c!131766 (validKeyInArray!0 (select (arr!46778 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419494 () Bool)

(assert (=> b!1419494 (= e!803136 e!803138)))

(declare-fun lt!625817 () (_ BitVec 64))

(assert (=> b!1419494 (= lt!625817 (select (arr!46778 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48078 0))(
  ( (Unit!48079) )
))
(declare-fun lt!625816 () Unit!48078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96918 (_ BitVec 64) (_ BitVec 32)) Unit!48078)

(assert (=> b!1419494 (= lt!625816 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625817 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419494 (arrayContainsKey!0 a!2831 lt!625817 #b00000000000000000000000000000000)))

(declare-fun lt!625818 () Unit!48078)

(assert (=> b!1419494 (= lt!625818 lt!625816)))

(declare-fun res!954933 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96918 (_ BitVec 32)) SeekEntryResult!11063)

(assert (=> b!1419494 (= res!954933 (= (seekEntryOrOpen!0 (select (arr!46778 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11063 #b00000000000000000000000000000000)))))

(assert (=> b!1419494 (=> (not res!954933) (not e!803138))))

(declare-fun b!1419495 () Bool)

(assert (=> b!1419495 (= e!803136 call!67318)))

(assert (= (and d!153027 (not res!954934)) b!1419493))

(assert (= (and b!1419493 c!131766) b!1419494))

(assert (= (and b!1419493 (not c!131766)) b!1419495))

(assert (= (and b!1419494 res!954933) b!1419492))

(assert (= (or b!1419492 b!1419495) bm!67315))

(declare-fun m!1309943 () Bool)

(assert (=> bm!67315 m!1309943))

(assert (=> b!1419493 m!1309899))

(assert (=> b!1419493 m!1309899))

(assert (=> b!1419493 m!1309905))

(assert (=> b!1419494 m!1309899))

(declare-fun m!1309945 () Bool)

(assert (=> b!1419494 m!1309945))

(declare-fun m!1309947 () Bool)

(assert (=> b!1419494 m!1309947))

(assert (=> b!1419494 m!1309899))

(declare-fun m!1309949 () Bool)

(assert (=> b!1419494 m!1309949))

(assert (=> b!1419291 d!153027))

(declare-fun d!153035 () Bool)

(assert (=> d!153035 (= (validKeyInArray!0 (select (arr!46778 a!2831) i!982)) (and (not (= (select (arr!46778 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46778 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419297 d!153035))

(declare-fun d!153037 () Bool)

(assert (=> d!153037 (= (validKeyInArray!0 (select (arr!46778 a!2831) j!81)) (and (not (= (select (arr!46778 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46778 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419292 d!153037))

(push 1)

(assert (not b!1419494))

(assert (not b!1419493))

(assert (not b!1419370))

(assert (not d!153003))

(assert (not b!1419371))

(assert (not bm!67315))

(assert (not bm!67306))

(assert (not b!1419369))

(assert (not b!1419429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

