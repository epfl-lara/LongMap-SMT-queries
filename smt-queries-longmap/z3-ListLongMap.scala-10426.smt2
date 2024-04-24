; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122906 () Bool)

(assert start!122906)

(declare-fun b!1423032 () Bool)

(declare-fun res!957783 () Bool)

(declare-fun e!804645 () Bool)

(assert (=> b!1423032 (=> (not res!957783) (not e!804645))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97193 0))(
  ( (array!97194 (arr!46912 (Array (_ BitVec 32) (_ BitVec 64))) (size!47463 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97193)

(assert (=> b!1423032 (= res!957783 (and (= (size!47463 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47463 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47463 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423033 () Bool)

(declare-fun res!957786 () Bool)

(declare-fun e!804646 () Bool)

(assert (=> b!1423033 (=> (not res!957786) (not e!804646))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11099 0))(
  ( (MissingZero!11099 (index!46788 (_ BitVec 32))) (Found!11099 (index!46789 (_ BitVec 32))) (Intermediate!11099 (undefined!11911 Bool) (index!46790 (_ BitVec 32)) (x!128592 (_ BitVec 32))) (Undefined!11099) (MissingVacant!11099 (index!46791 (_ BitVec 32))) )
))
(declare-fun lt!626841 () SeekEntryResult!11099)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97193 (_ BitVec 32)) SeekEntryResult!11099)

(assert (=> b!1423033 (= res!957786 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!626841))))

(declare-fun res!957792 () Bool)

(assert (=> start!122906 (=> (not res!957792) (not e!804645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122906 (= res!957792 (validMask!0 mask!2608))))

(assert (=> start!122906 e!804645))

(assert (=> start!122906 true))

(declare-fun array_inv!36193 (array!97193) Bool)

(assert (=> start!122906 (array_inv!36193 a!2831)))

(declare-fun b!1423034 () Bool)

(declare-fun res!957787 () Bool)

(assert (=> b!1423034 (=> (not res!957787) (not e!804645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97193 (_ BitVec 32)) Bool)

(assert (=> b!1423034 (= res!957787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun e!804643 () Bool)

(declare-fun b!1423035 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97193 (_ BitVec 32)) SeekEntryResult!11099)

(assert (=> b!1423035 (= e!804643 (= (seekEntryOrOpen!0 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) (Found!11099 j!81)))))

(declare-fun b!1423036 () Bool)

(declare-fun res!957782 () Bool)

(assert (=> b!1423036 (=> (not res!957782) (not e!804646))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423036 (= res!957782 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423037 () Bool)

(declare-fun res!957785 () Bool)

(assert (=> b!1423037 (=> (not res!957785) (not e!804645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423037 (= res!957785 (validKeyInArray!0 (select (arr!46912 a!2831) j!81)))))

(declare-fun b!1423038 () Bool)

(declare-fun res!957788 () Bool)

(assert (=> b!1423038 (=> (not res!957788) (not e!804645))))

(declare-datatypes ((List!33409 0))(
  ( (Nil!33406) (Cons!33405 (h!34715 (_ BitVec 64)) (t!48095 List!33409)) )
))
(declare-fun arrayNoDuplicates!0 (array!97193 (_ BitVec 32) List!33409) Bool)

(assert (=> b!1423038 (= res!957788 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33406))))

(declare-fun b!1423039 () Bool)

(declare-fun e!804644 () Bool)

(assert (=> b!1423039 (= e!804645 e!804644)))

(declare-fun res!957793 () Bool)

(assert (=> b!1423039 (=> (not res!957793) (not e!804644))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423039 (= res!957793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!626841))))

(assert (=> b!1423039 (= lt!626841 (Intermediate!11099 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423040 () Bool)

(declare-fun res!957781 () Bool)

(assert (=> b!1423040 (=> (not res!957781) (not e!804645))))

(assert (=> b!1423040 (= res!957781 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47463 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47463 a!2831))))))

(declare-fun b!1423041 () Bool)

(declare-fun res!957791 () Bool)

(assert (=> b!1423041 (=> (not res!957791) (not e!804645))))

(assert (=> b!1423041 (= res!957791 (validKeyInArray!0 (select (arr!46912 a!2831) i!982)))))

(declare-fun b!1423042 () Bool)

(assert (=> b!1423042 (= e!804644 e!804646)))

(declare-fun res!957784 () Bool)

(assert (=> b!1423042 (=> (not res!957784) (not e!804646))))

(declare-fun lt!626839 () (_ BitVec 64))

(declare-fun lt!626843 () array!97193)

(declare-fun lt!626842 () SeekEntryResult!11099)

(assert (=> b!1423042 (= res!957784 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626839 mask!2608) lt!626839 lt!626843 mask!2608) lt!626842))))

(assert (=> b!1423042 (= lt!626842 (Intermediate!11099 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423042 (= lt!626839 (select (store (arr!46912 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423042 (= lt!626843 (array!97194 (store (arr!46912 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47463 a!2831)))))

(declare-fun b!1423043 () Bool)

(assert (=> b!1423043 (= e!804646 (not (or (= (select (arr!46912 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46912 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46912 a!2831) index!585) (select (arr!46912 a!2831) j!81)) (= (select (store (arr!46912 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000)))))))

(assert (=> b!1423043 e!804643))

(declare-fun res!957789 () Bool)

(assert (=> b!1423043 (=> (not res!957789) (not e!804643))))

(assert (=> b!1423043 (= res!957789 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48065 0))(
  ( (Unit!48066) )
))
(declare-fun lt!626840 () Unit!48065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48065)

(assert (=> b!1423043 (= lt!626840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423044 () Bool)

(declare-fun res!957790 () Bool)

(assert (=> b!1423044 (=> (not res!957790) (not e!804646))))

(assert (=> b!1423044 (= res!957790 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626839 lt!626843 mask!2608) lt!626842))))

(assert (= (and start!122906 res!957792) b!1423032))

(assert (= (and b!1423032 res!957783) b!1423041))

(assert (= (and b!1423041 res!957791) b!1423037))

(assert (= (and b!1423037 res!957785) b!1423034))

(assert (= (and b!1423034 res!957787) b!1423038))

(assert (= (and b!1423038 res!957788) b!1423040))

(assert (= (and b!1423040 res!957781) b!1423039))

(assert (= (and b!1423039 res!957793) b!1423042))

(assert (= (and b!1423042 res!957784) b!1423033))

(assert (= (and b!1423033 res!957786) b!1423044))

(assert (= (and b!1423044 res!957790) b!1423036))

(assert (= (and b!1423036 res!957782) b!1423043))

(assert (= (and b!1423043 res!957789) b!1423035))

(declare-fun m!1313817 () Bool)

(assert (=> b!1423039 m!1313817))

(assert (=> b!1423039 m!1313817))

(declare-fun m!1313819 () Bool)

(assert (=> b!1423039 m!1313819))

(assert (=> b!1423039 m!1313819))

(assert (=> b!1423039 m!1313817))

(declare-fun m!1313821 () Bool)

(assert (=> b!1423039 m!1313821))

(declare-fun m!1313823 () Bool)

(assert (=> start!122906 m!1313823))

(declare-fun m!1313825 () Bool)

(assert (=> start!122906 m!1313825))

(declare-fun m!1313827 () Bool)

(assert (=> b!1423034 m!1313827))

(assert (=> b!1423037 m!1313817))

(assert (=> b!1423037 m!1313817))

(declare-fun m!1313829 () Bool)

(assert (=> b!1423037 m!1313829))

(declare-fun m!1313831 () Bool)

(assert (=> b!1423044 m!1313831))

(assert (=> b!1423033 m!1313817))

(assert (=> b!1423033 m!1313817))

(declare-fun m!1313833 () Bool)

(assert (=> b!1423033 m!1313833))

(declare-fun m!1313835 () Bool)

(assert (=> b!1423043 m!1313835))

(declare-fun m!1313837 () Bool)

(assert (=> b!1423043 m!1313837))

(declare-fun m!1313839 () Bool)

(assert (=> b!1423043 m!1313839))

(declare-fun m!1313841 () Bool)

(assert (=> b!1423043 m!1313841))

(assert (=> b!1423043 m!1313817))

(declare-fun m!1313843 () Bool)

(assert (=> b!1423043 m!1313843))

(declare-fun m!1313845 () Bool)

(assert (=> b!1423038 m!1313845))

(declare-fun m!1313847 () Bool)

(assert (=> b!1423042 m!1313847))

(assert (=> b!1423042 m!1313847))

(declare-fun m!1313849 () Bool)

(assert (=> b!1423042 m!1313849))

(assert (=> b!1423042 m!1313835))

(declare-fun m!1313851 () Bool)

(assert (=> b!1423042 m!1313851))

(assert (=> b!1423035 m!1313817))

(assert (=> b!1423035 m!1313817))

(declare-fun m!1313853 () Bool)

(assert (=> b!1423035 m!1313853))

(declare-fun m!1313855 () Bool)

(assert (=> b!1423041 m!1313855))

(assert (=> b!1423041 m!1313855))

(declare-fun m!1313857 () Bool)

(assert (=> b!1423041 m!1313857))

(check-sat (not b!1423033) (not b!1423041) (not b!1423042) (not b!1423043) (not b!1423037) (not b!1423044) (not b!1423038) (not b!1423035) (not b!1423039) (not b!1423034) (not start!122906))
(check-sat)
(get-model)

(declare-fun d!153437 () Bool)

(declare-fun e!804690 () Bool)

(assert (=> d!153437 e!804690))

(declare-fun c!132126 () Bool)

(declare-fun lt!626879 () SeekEntryResult!11099)

(get-info :version)

(assert (=> d!153437 (= c!132126 (and ((_ is Intermediate!11099) lt!626879) (undefined!11911 lt!626879)))))

(declare-fun e!804692 () SeekEntryResult!11099)

(assert (=> d!153437 (= lt!626879 e!804692)))

(declare-fun c!132127 () Bool)

(assert (=> d!153437 (= c!132127 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!626878 () (_ BitVec 64))

(assert (=> d!153437 (= lt!626878 (select (arr!46912 a!2831) (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608)))))

(assert (=> d!153437 (validMask!0 mask!2608)))

(assert (=> d!153437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!626879)))

(declare-fun b!1423141 () Bool)

(declare-fun e!804688 () Bool)

(assert (=> b!1423141 (= e!804690 e!804688)))

(declare-fun res!957879 () Bool)

(assert (=> b!1423141 (= res!957879 (and ((_ is Intermediate!11099) lt!626879) (not (undefined!11911 lt!626879)) (bvslt (x!128592 lt!626879) #b01111111111111111111111111111110) (bvsge (x!128592 lt!626879) #b00000000000000000000000000000000) (bvsge (x!128592 lt!626879) #b00000000000000000000000000000000)))))

(assert (=> b!1423141 (=> (not res!957879) (not e!804688))))

(declare-fun b!1423142 () Bool)

(declare-fun e!804689 () SeekEntryResult!11099)

(assert (=> b!1423142 (= e!804692 e!804689)))

(declare-fun c!132125 () Bool)

(assert (=> b!1423142 (= c!132125 (or (= lt!626878 (select (arr!46912 a!2831) j!81)) (= (bvadd lt!626878 lt!626878) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1423143 () Bool)

(assert (=> b!1423143 (and (bvsge (index!46790 lt!626879) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626879) (size!47463 a!2831)))))

(declare-fun res!957880 () Bool)

(assert (=> b!1423143 (= res!957880 (= (select (arr!46912 a!2831) (index!46790 lt!626879)) (select (arr!46912 a!2831) j!81)))))

(declare-fun e!804691 () Bool)

(assert (=> b!1423143 (=> res!957880 e!804691)))

(assert (=> b!1423143 (= e!804688 e!804691)))

(declare-fun b!1423144 () Bool)

(assert (=> b!1423144 (and (bvsge (index!46790 lt!626879) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626879) (size!47463 a!2831)))))

(declare-fun res!957878 () Bool)

(assert (=> b!1423144 (= res!957878 (= (select (arr!46912 a!2831) (index!46790 lt!626879)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1423144 (=> res!957878 e!804691)))

(declare-fun b!1423145 () Bool)

(assert (=> b!1423145 (= e!804690 (bvsge (x!128592 lt!626879) #b01111111111111111111111111111110))))

(declare-fun b!1423146 () Bool)

(assert (=> b!1423146 (= e!804692 (Intermediate!11099 true (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1423147 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423147 (= e!804689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!46912 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1423148 () Bool)

(assert (=> b!1423148 (and (bvsge (index!46790 lt!626879) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626879) (size!47463 a!2831)))))

(assert (=> b!1423148 (= e!804691 (= (select (arr!46912 a!2831) (index!46790 lt!626879)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1423149 () Bool)

(assert (=> b!1423149 (= e!804689 (Intermediate!11099 false (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153437 c!132127) b!1423146))

(assert (= (and d!153437 (not c!132127)) b!1423142))

(assert (= (and b!1423142 c!132125) b!1423149))

(assert (= (and b!1423142 (not c!132125)) b!1423147))

(assert (= (and d!153437 c!132126) b!1423145))

(assert (= (and d!153437 (not c!132126)) b!1423141))

(assert (= (and b!1423141 res!957879) b!1423143))

(assert (= (and b!1423143 (not res!957880)) b!1423144))

(assert (= (and b!1423144 (not res!957878)) b!1423148))

(declare-fun m!1313943 () Bool)

(assert (=> b!1423144 m!1313943))

(assert (=> b!1423147 m!1313819))

(declare-fun m!1313945 () Bool)

(assert (=> b!1423147 m!1313945))

(assert (=> b!1423147 m!1313945))

(assert (=> b!1423147 m!1313817))

(declare-fun m!1313947 () Bool)

(assert (=> b!1423147 m!1313947))

(assert (=> b!1423148 m!1313943))

(assert (=> d!153437 m!1313819))

(declare-fun m!1313949 () Bool)

(assert (=> d!153437 m!1313949))

(assert (=> d!153437 m!1313823))

(assert (=> b!1423143 m!1313943))

(assert (=> b!1423039 d!153437))

(declare-fun d!153439 () Bool)

(declare-fun lt!626885 () (_ BitVec 32))

(declare-fun lt!626884 () (_ BitVec 32))

(assert (=> d!153439 (= lt!626885 (bvmul (bvxor lt!626884 (bvlshr lt!626884 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153439 (= lt!626884 ((_ extract 31 0) (bvand (bvxor (select (arr!46912 a!2831) j!81) (bvlshr (select (arr!46912 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153439 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!957881 (let ((h!34718 ((_ extract 31 0) (bvand (bvxor (select (arr!46912 a!2831) j!81) (bvlshr (select (arr!46912 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128596 (bvmul (bvxor h!34718 (bvlshr h!34718 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128596 (bvlshr x!128596 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!957881 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!957881 #b00000000000000000000000000000000))))))

(assert (=> d!153439 (= (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) (bvand (bvxor lt!626885 (bvlshr lt!626885 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1423039 d!153439))

(declare-fun d!153441 () Bool)

(assert (=> d!153441 (= (validKeyInArray!0 (select (arr!46912 a!2831) j!81)) (and (not (= (select (arr!46912 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46912 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1423037 d!153441))

(declare-fun bm!67380 () Bool)

(declare-fun call!67383 () Bool)

(declare-fun c!132130 () Bool)

(assert (=> bm!67380 (= call!67383 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132130 (Cons!33405 (select (arr!46912 a!2831) #b00000000000000000000000000000000) Nil!33406) Nil!33406)))))

(declare-fun b!1423160 () Bool)

(declare-fun e!804701 () Bool)

(assert (=> b!1423160 (= e!804701 call!67383)))

(declare-fun b!1423162 () Bool)

(declare-fun e!804703 () Bool)

(declare-fun contains!9890 (List!33409 (_ BitVec 64)) Bool)

(assert (=> b!1423162 (= e!804703 (contains!9890 Nil!33406 (select (arr!46912 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1423163 () Bool)

(assert (=> b!1423163 (= e!804701 call!67383)))

(declare-fun b!1423164 () Bool)

(declare-fun e!804704 () Bool)

(assert (=> b!1423164 (= e!804704 e!804701)))

(assert (=> b!1423164 (= c!132130 (validKeyInArray!0 (select (arr!46912 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153443 () Bool)

(declare-fun res!957890 () Bool)

(declare-fun e!804702 () Bool)

(assert (=> d!153443 (=> res!957890 e!804702)))

(assert (=> d!153443 (= res!957890 (bvsge #b00000000000000000000000000000000 (size!47463 a!2831)))))

(assert (=> d!153443 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33406) e!804702)))

(declare-fun b!1423161 () Bool)

(assert (=> b!1423161 (= e!804702 e!804704)))

(declare-fun res!957889 () Bool)

(assert (=> b!1423161 (=> (not res!957889) (not e!804704))))

(assert (=> b!1423161 (= res!957889 (not e!804703))))

(declare-fun res!957888 () Bool)

(assert (=> b!1423161 (=> (not res!957888) (not e!804703))))

(assert (=> b!1423161 (= res!957888 (validKeyInArray!0 (select (arr!46912 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153443 (not res!957890)) b!1423161))

(assert (= (and b!1423161 res!957888) b!1423162))

(assert (= (and b!1423161 res!957889) b!1423164))

(assert (= (and b!1423164 c!132130) b!1423160))

(assert (= (and b!1423164 (not c!132130)) b!1423163))

(assert (= (or b!1423160 b!1423163) bm!67380))

(declare-fun m!1313951 () Bool)

(assert (=> bm!67380 m!1313951))

(declare-fun m!1313953 () Bool)

(assert (=> bm!67380 m!1313953))

(assert (=> b!1423162 m!1313951))

(assert (=> b!1423162 m!1313951))

(declare-fun m!1313955 () Bool)

(assert (=> b!1423162 m!1313955))

(assert (=> b!1423164 m!1313951))

(assert (=> b!1423164 m!1313951))

(declare-fun m!1313957 () Bool)

(assert (=> b!1423164 m!1313957))

(assert (=> b!1423161 m!1313951))

(assert (=> b!1423161 m!1313951))

(assert (=> b!1423161 m!1313957))

(assert (=> b!1423038 d!153443))

(declare-fun d!153445 () Bool)

(declare-fun e!804707 () Bool)

(assert (=> d!153445 e!804707))

(declare-fun c!132132 () Bool)

(declare-fun lt!626887 () SeekEntryResult!11099)

(assert (=> d!153445 (= c!132132 (and ((_ is Intermediate!11099) lt!626887) (undefined!11911 lt!626887)))))

(declare-fun e!804709 () SeekEntryResult!11099)

(assert (=> d!153445 (= lt!626887 e!804709)))

(declare-fun c!132133 () Bool)

(assert (=> d!153445 (= c!132133 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!626886 () (_ BitVec 64))

(assert (=> d!153445 (= lt!626886 (select (arr!46912 a!2831) index!585))))

(assert (=> d!153445 (validMask!0 mask!2608)))

(assert (=> d!153445 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!626887)))

(declare-fun b!1423165 () Bool)

(declare-fun e!804705 () Bool)

(assert (=> b!1423165 (= e!804707 e!804705)))

(declare-fun res!957892 () Bool)

(assert (=> b!1423165 (= res!957892 (and ((_ is Intermediate!11099) lt!626887) (not (undefined!11911 lt!626887)) (bvslt (x!128592 lt!626887) #b01111111111111111111111111111110) (bvsge (x!128592 lt!626887) #b00000000000000000000000000000000) (bvsge (x!128592 lt!626887) x!605)))))

(assert (=> b!1423165 (=> (not res!957892) (not e!804705))))

(declare-fun b!1423166 () Bool)

(declare-fun e!804706 () SeekEntryResult!11099)

(assert (=> b!1423166 (= e!804709 e!804706)))

(declare-fun c!132131 () Bool)

(assert (=> b!1423166 (= c!132131 (or (= lt!626886 (select (arr!46912 a!2831) j!81)) (= (bvadd lt!626886 lt!626886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1423167 () Bool)

(assert (=> b!1423167 (and (bvsge (index!46790 lt!626887) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626887) (size!47463 a!2831)))))

(declare-fun res!957893 () Bool)

(assert (=> b!1423167 (= res!957893 (= (select (arr!46912 a!2831) (index!46790 lt!626887)) (select (arr!46912 a!2831) j!81)))))

(declare-fun e!804708 () Bool)

(assert (=> b!1423167 (=> res!957893 e!804708)))

(assert (=> b!1423167 (= e!804705 e!804708)))

(declare-fun b!1423168 () Bool)

(assert (=> b!1423168 (and (bvsge (index!46790 lt!626887) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626887) (size!47463 a!2831)))))

(declare-fun res!957891 () Bool)

(assert (=> b!1423168 (= res!957891 (= (select (arr!46912 a!2831) (index!46790 lt!626887)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1423168 (=> res!957891 e!804708)))

(declare-fun b!1423169 () Bool)

(assert (=> b!1423169 (= e!804707 (bvsge (x!128592 lt!626887) #b01111111111111111111111111111110))))

(declare-fun b!1423170 () Bool)

(assert (=> b!1423170 (= e!804709 (Intermediate!11099 true index!585 x!605))))

(declare-fun b!1423171 () Bool)

(assert (=> b!1423171 (= e!804706 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!46912 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1423172 () Bool)

(assert (=> b!1423172 (and (bvsge (index!46790 lt!626887) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626887) (size!47463 a!2831)))))

(assert (=> b!1423172 (= e!804708 (= (select (arr!46912 a!2831) (index!46790 lt!626887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1423173 () Bool)

(assert (=> b!1423173 (= e!804706 (Intermediate!11099 false index!585 x!605))))

(assert (= (and d!153445 c!132133) b!1423170))

(assert (= (and d!153445 (not c!132133)) b!1423166))

(assert (= (and b!1423166 c!132131) b!1423173))

(assert (= (and b!1423166 (not c!132131)) b!1423171))

(assert (= (and d!153445 c!132132) b!1423169))

(assert (= (and d!153445 (not c!132132)) b!1423165))

(assert (= (and b!1423165 res!957892) b!1423167))

(assert (= (and b!1423167 (not res!957893)) b!1423168))

(assert (= (and b!1423168 (not res!957891)) b!1423172))

(declare-fun m!1313959 () Bool)

(assert (=> b!1423168 m!1313959))

(declare-fun m!1313961 () Bool)

(assert (=> b!1423171 m!1313961))

(assert (=> b!1423171 m!1313961))

(assert (=> b!1423171 m!1313817))

(declare-fun m!1313963 () Bool)

(assert (=> b!1423171 m!1313963))

(assert (=> b!1423172 m!1313959))

(assert (=> d!153445 m!1313839))

(assert (=> d!153445 m!1313823))

(assert (=> b!1423167 m!1313959))

(assert (=> b!1423033 d!153445))

(declare-fun d!153447 () Bool)

(declare-fun e!804712 () Bool)

(assert (=> d!153447 e!804712))

(declare-fun c!132135 () Bool)

(declare-fun lt!626889 () SeekEntryResult!11099)

(assert (=> d!153447 (= c!132135 (and ((_ is Intermediate!11099) lt!626889) (undefined!11911 lt!626889)))))

(declare-fun e!804714 () SeekEntryResult!11099)

(assert (=> d!153447 (= lt!626889 e!804714)))

(declare-fun c!132136 () Bool)

(assert (=> d!153447 (= c!132136 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!626888 () (_ BitVec 64))

(assert (=> d!153447 (= lt!626888 (select (arr!46912 lt!626843) index!585))))

(assert (=> d!153447 (validMask!0 mask!2608)))

(assert (=> d!153447 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626839 lt!626843 mask!2608) lt!626889)))

(declare-fun b!1423174 () Bool)

(declare-fun e!804710 () Bool)

(assert (=> b!1423174 (= e!804712 e!804710)))

(declare-fun res!957895 () Bool)

(assert (=> b!1423174 (= res!957895 (and ((_ is Intermediate!11099) lt!626889) (not (undefined!11911 lt!626889)) (bvslt (x!128592 lt!626889) #b01111111111111111111111111111110) (bvsge (x!128592 lt!626889) #b00000000000000000000000000000000) (bvsge (x!128592 lt!626889) x!605)))))

(assert (=> b!1423174 (=> (not res!957895) (not e!804710))))

(declare-fun b!1423175 () Bool)

(declare-fun e!804711 () SeekEntryResult!11099)

(assert (=> b!1423175 (= e!804714 e!804711)))

(declare-fun c!132134 () Bool)

(assert (=> b!1423175 (= c!132134 (or (= lt!626888 lt!626839) (= (bvadd lt!626888 lt!626888) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1423176 () Bool)

(assert (=> b!1423176 (and (bvsge (index!46790 lt!626889) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626889) (size!47463 lt!626843)))))

(declare-fun res!957896 () Bool)

(assert (=> b!1423176 (= res!957896 (= (select (arr!46912 lt!626843) (index!46790 lt!626889)) lt!626839))))

(declare-fun e!804713 () Bool)

(assert (=> b!1423176 (=> res!957896 e!804713)))

(assert (=> b!1423176 (= e!804710 e!804713)))

(declare-fun b!1423177 () Bool)

(assert (=> b!1423177 (and (bvsge (index!46790 lt!626889) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626889) (size!47463 lt!626843)))))

(declare-fun res!957894 () Bool)

(assert (=> b!1423177 (= res!957894 (= (select (arr!46912 lt!626843) (index!46790 lt!626889)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1423177 (=> res!957894 e!804713)))

(declare-fun b!1423178 () Bool)

(assert (=> b!1423178 (= e!804712 (bvsge (x!128592 lt!626889) #b01111111111111111111111111111110))))

(declare-fun b!1423179 () Bool)

(assert (=> b!1423179 (= e!804714 (Intermediate!11099 true index!585 x!605))))

(declare-fun b!1423180 () Bool)

(assert (=> b!1423180 (= e!804711 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!626839 lt!626843 mask!2608))))

(declare-fun b!1423181 () Bool)

(assert (=> b!1423181 (and (bvsge (index!46790 lt!626889) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626889) (size!47463 lt!626843)))))

(assert (=> b!1423181 (= e!804713 (= (select (arr!46912 lt!626843) (index!46790 lt!626889)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1423182 () Bool)

(assert (=> b!1423182 (= e!804711 (Intermediate!11099 false index!585 x!605))))

(assert (= (and d!153447 c!132136) b!1423179))

(assert (= (and d!153447 (not c!132136)) b!1423175))

(assert (= (and b!1423175 c!132134) b!1423182))

(assert (= (and b!1423175 (not c!132134)) b!1423180))

(assert (= (and d!153447 c!132135) b!1423178))

(assert (= (and d!153447 (not c!132135)) b!1423174))

(assert (= (and b!1423174 res!957895) b!1423176))

(assert (= (and b!1423176 (not res!957896)) b!1423177))

(assert (= (and b!1423177 (not res!957894)) b!1423181))

(declare-fun m!1313965 () Bool)

(assert (=> b!1423177 m!1313965))

(assert (=> b!1423180 m!1313961))

(assert (=> b!1423180 m!1313961))

(declare-fun m!1313967 () Bool)

(assert (=> b!1423180 m!1313967))

(assert (=> b!1423181 m!1313965))

(declare-fun m!1313969 () Bool)

(assert (=> d!153447 m!1313969))

(assert (=> d!153447 m!1313823))

(assert (=> b!1423176 m!1313965))

(assert (=> b!1423044 d!153447))

(declare-fun b!1423199 () Bool)

(declare-fun e!804729 () Bool)

(declare-fun call!67388 () Bool)

(assert (=> b!1423199 (= e!804729 call!67388)))

(declare-fun b!1423200 () Bool)

(declare-fun e!804727 () Bool)

(assert (=> b!1423200 (= e!804727 e!804729)))

(declare-fun lt!626903 () (_ BitVec 64))

(assert (=> b!1423200 (= lt!626903 (select (arr!46912 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!626902 () Unit!48065)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97193 (_ BitVec 64) (_ BitVec 32)) Unit!48065)

(assert (=> b!1423200 (= lt!626902 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!626903 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1423200 (arrayContainsKey!0 a!2831 lt!626903 #b00000000000000000000000000000000)))

(declare-fun lt!626904 () Unit!48065)

(assert (=> b!1423200 (= lt!626904 lt!626902)))

(declare-fun res!957905 () Bool)

(assert (=> b!1423200 (= res!957905 (= (seekEntryOrOpen!0 (select (arr!46912 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11099 #b00000000000000000000000000000000)))))

(assert (=> b!1423200 (=> (not res!957905) (not e!804729))))

(declare-fun b!1423201 () Bool)

(assert (=> b!1423201 (= e!804727 call!67388)))

(declare-fun bm!67385 () Bool)

(assert (=> bm!67385 (= call!67388 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153453 () Bool)

(declare-fun res!957906 () Bool)

(declare-fun e!804728 () Bool)

(assert (=> d!153453 (=> res!957906 e!804728)))

(assert (=> d!153453 (= res!957906 (bvsge #b00000000000000000000000000000000 (size!47463 a!2831)))))

(assert (=> d!153453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!804728)))

(declare-fun b!1423202 () Bool)

(assert (=> b!1423202 (= e!804728 e!804727)))

(declare-fun c!132141 () Bool)

(assert (=> b!1423202 (= c!132141 (validKeyInArray!0 (select (arr!46912 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153453 (not res!957906)) b!1423202))

(assert (= (and b!1423202 c!132141) b!1423200))

(assert (= (and b!1423202 (not c!132141)) b!1423201))

(assert (= (and b!1423200 res!957905) b!1423199))

(assert (= (or b!1423199 b!1423201) bm!67385))

(assert (=> b!1423200 m!1313951))

(declare-fun m!1313971 () Bool)

(assert (=> b!1423200 m!1313971))

(declare-fun m!1313973 () Bool)

(assert (=> b!1423200 m!1313973))

(assert (=> b!1423200 m!1313951))

(declare-fun m!1313975 () Bool)

(assert (=> b!1423200 m!1313975))

(declare-fun m!1313977 () Bool)

(assert (=> bm!67385 m!1313977))

(assert (=> b!1423202 m!1313951))

(assert (=> b!1423202 m!1313951))

(assert (=> b!1423202 m!1313957))

(assert (=> b!1423034 d!153453))

(declare-fun b!1423276 () Bool)

(declare-fun e!804771 () SeekEntryResult!11099)

(declare-fun e!804770 () SeekEntryResult!11099)

(assert (=> b!1423276 (= e!804771 e!804770)))

(declare-fun lt!626938 () (_ BitVec 64))

(declare-fun lt!626940 () SeekEntryResult!11099)

(assert (=> b!1423276 (= lt!626938 (select (arr!46912 a!2831) (index!46790 lt!626940)))))

(declare-fun c!132170 () Bool)

(assert (=> b!1423276 (= c!132170 (= lt!626938 (select (arr!46912 a!2831) j!81)))))

(declare-fun b!1423277 () Bool)

(assert (=> b!1423277 (= e!804770 (Found!11099 (index!46790 lt!626940)))))

(declare-fun b!1423278 () Bool)

(assert (=> b!1423278 (= e!804771 Undefined!11099)))

(declare-fun b!1423279 () Bool)

(declare-fun e!804772 () SeekEntryResult!11099)

(assert (=> b!1423279 (= e!804772 (MissingZero!11099 (index!46790 lt!626940)))))

(declare-fun d!153455 () Bool)

(declare-fun lt!626939 () SeekEntryResult!11099)

(assert (=> d!153455 (and (or ((_ is Undefined!11099) lt!626939) (not ((_ is Found!11099) lt!626939)) (and (bvsge (index!46789 lt!626939) #b00000000000000000000000000000000) (bvslt (index!46789 lt!626939) (size!47463 a!2831)))) (or ((_ is Undefined!11099) lt!626939) ((_ is Found!11099) lt!626939) (not ((_ is MissingZero!11099) lt!626939)) (and (bvsge (index!46788 lt!626939) #b00000000000000000000000000000000) (bvslt (index!46788 lt!626939) (size!47463 a!2831)))) (or ((_ is Undefined!11099) lt!626939) ((_ is Found!11099) lt!626939) ((_ is MissingZero!11099) lt!626939) (not ((_ is MissingVacant!11099) lt!626939)) (and (bvsge (index!46791 lt!626939) #b00000000000000000000000000000000) (bvslt (index!46791 lt!626939) (size!47463 a!2831)))) (or ((_ is Undefined!11099) lt!626939) (ite ((_ is Found!11099) lt!626939) (= (select (arr!46912 a!2831) (index!46789 lt!626939)) (select (arr!46912 a!2831) j!81)) (ite ((_ is MissingZero!11099) lt!626939) (= (select (arr!46912 a!2831) (index!46788 lt!626939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11099) lt!626939) (= (select (arr!46912 a!2831) (index!46791 lt!626939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153455 (= lt!626939 e!804771)))

(declare-fun c!132172 () Bool)

(assert (=> d!153455 (= c!132172 (and ((_ is Intermediate!11099) lt!626940) (undefined!11911 lt!626940)))))

(assert (=> d!153455 (= lt!626940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) (select (arr!46912 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153455 (validMask!0 mask!2608)))

(assert (=> d!153455 (= (seekEntryOrOpen!0 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!626939)))

(declare-fun b!1423280 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97193 (_ BitVec 32)) SeekEntryResult!11099)

(assert (=> b!1423280 (= e!804772 (seekKeyOrZeroReturnVacant!0 (x!128592 lt!626940) (index!46790 lt!626940) (index!46790 lt!626940) (select (arr!46912 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1423281 () Bool)

(declare-fun c!132171 () Bool)

(assert (=> b!1423281 (= c!132171 (= lt!626938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1423281 (= e!804770 e!804772)))

(assert (= (and d!153455 c!132172) b!1423278))

(assert (= (and d!153455 (not c!132172)) b!1423276))

(assert (= (and b!1423276 c!132170) b!1423277))

(assert (= (and b!1423276 (not c!132170)) b!1423281))

(assert (= (and b!1423281 c!132171) b!1423279))

(assert (= (and b!1423281 (not c!132171)) b!1423280))

(declare-fun m!1314015 () Bool)

(assert (=> b!1423276 m!1314015))

(declare-fun m!1314017 () Bool)

(assert (=> d!153455 m!1314017))

(assert (=> d!153455 m!1313823))

(assert (=> d!153455 m!1313819))

(assert (=> d!153455 m!1313817))

(assert (=> d!153455 m!1313821))

(assert (=> d!153455 m!1313817))

(assert (=> d!153455 m!1313819))

(declare-fun m!1314019 () Bool)

(assert (=> d!153455 m!1314019))

(declare-fun m!1314021 () Bool)

(assert (=> d!153455 m!1314021))

(assert (=> b!1423280 m!1313817))

(declare-fun m!1314023 () Bool)

(assert (=> b!1423280 m!1314023))

(assert (=> b!1423035 d!153455))

(declare-fun d!153469 () Bool)

(assert (=> d!153469 (= (validKeyInArray!0 (select (arr!46912 a!2831) i!982)) (and (not (= (select (arr!46912 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46912 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1423041 d!153469))

(declare-fun d!153471 () Bool)

(declare-fun e!804778 () Bool)

(assert (=> d!153471 e!804778))

(declare-fun c!132177 () Bool)

(declare-fun lt!626945 () SeekEntryResult!11099)

(assert (=> d!153471 (= c!132177 (and ((_ is Intermediate!11099) lt!626945) (undefined!11911 lt!626945)))))

(declare-fun e!804780 () SeekEntryResult!11099)

(assert (=> d!153471 (= lt!626945 e!804780)))

(declare-fun c!132178 () Bool)

(assert (=> d!153471 (= c!132178 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!626944 () (_ BitVec 64))

(assert (=> d!153471 (= lt!626944 (select (arr!46912 lt!626843) (toIndex!0 lt!626839 mask!2608)))))

(assert (=> d!153471 (validMask!0 mask!2608)))

(assert (=> d!153471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626839 mask!2608) lt!626839 lt!626843 mask!2608) lt!626945)))

(declare-fun b!1423288 () Bool)

(declare-fun e!804776 () Bool)

(assert (=> b!1423288 (= e!804778 e!804776)))

(declare-fun res!957926 () Bool)

(assert (=> b!1423288 (= res!957926 (and ((_ is Intermediate!11099) lt!626945) (not (undefined!11911 lt!626945)) (bvslt (x!128592 lt!626945) #b01111111111111111111111111111110) (bvsge (x!128592 lt!626945) #b00000000000000000000000000000000) (bvsge (x!128592 lt!626945) #b00000000000000000000000000000000)))))

(assert (=> b!1423288 (=> (not res!957926) (not e!804776))))

(declare-fun b!1423289 () Bool)

(declare-fun e!804777 () SeekEntryResult!11099)

(assert (=> b!1423289 (= e!804780 e!804777)))

(declare-fun c!132176 () Bool)

(assert (=> b!1423289 (= c!132176 (or (= lt!626944 lt!626839) (= (bvadd lt!626944 lt!626944) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1423290 () Bool)

(assert (=> b!1423290 (and (bvsge (index!46790 lt!626945) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626945) (size!47463 lt!626843)))))

(declare-fun res!957927 () Bool)

(assert (=> b!1423290 (= res!957927 (= (select (arr!46912 lt!626843) (index!46790 lt!626945)) lt!626839))))

(declare-fun e!804779 () Bool)

(assert (=> b!1423290 (=> res!957927 e!804779)))

(assert (=> b!1423290 (= e!804776 e!804779)))

(declare-fun b!1423291 () Bool)

(assert (=> b!1423291 (and (bvsge (index!46790 lt!626945) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626945) (size!47463 lt!626843)))))

(declare-fun res!957925 () Bool)

(assert (=> b!1423291 (= res!957925 (= (select (arr!46912 lt!626843) (index!46790 lt!626945)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1423291 (=> res!957925 e!804779)))

(declare-fun b!1423292 () Bool)

(assert (=> b!1423292 (= e!804778 (bvsge (x!128592 lt!626945) #b01111111111111111111111111111110))))

(declare-fun b!1423293 () Bool)

(assert (=> b!1423293 (= e!804780 (Intermediate!11099 true (toIndex!0 lt!626839 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1423294 () Bool)

(assert (=> b!1423294 (= e!804777 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!626839 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!626839 lt!626843 mask!2608))))

(declare-fun b!1423295 () Bool)

(assert (=> b!1423295 (and (bvsge (index!46790 lt!626945) #b00000000000000000000000000000000) (bvslt (index!46790 lt!626945) (size!47463 lt!626843)))))

(assert (=> b!1423295 (= e!804779 (= (select (arr!46912 lt!626843) (index!46790 lt!626945)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1423296 () Bool)

(assert (=> b!1423296 (= e!804777 (Intermediate!11099 false (toIndex!0 lt!626839 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153471 c!132178) b!1423293))

(assert (= (and d!153471 (not c!132178)) b!1423289))

(assert (= (and b!1423289 c!132176) b!1423296))

(assert (= (and b!1423289 (not c!132176)) b!1423294))

(assert (= (and d!153471 c!132177) b!1423292))

(assert (= (and d!153471 (not c!132177)) b!1423288))

(assert (= (and b!1423288 res!957926) b!1423290))

(assert (= (and b!1423290 (not res!957927)) b!1423291))

(assert (= (and b!1423291 (not res!957925)) b!1423295))

(declare-fun m!1314035 () Bool)

(assert (=> b!1423291 m!1314035))

(assert (=> b!1423294 m!1313847))

(declare-fun m!1314037 () Bool)

(assert (=> b!1423294 m!1314037))

(assert (=> b!1423294 m!1314037))

(declare-fun m!1314039 () Bool)

(assert (=> b!1423294 m!1314039))

(assert (=> b!1423295 m!1314035))

(assert (=> d!153471 m!1313847))

(declare-fun m!1314041 () Bool)

(assert (=> d!153471 m!1314041))

(assert (=> d!153471 m!1313823))

(assert (=> b!1423290 m!1314035))

(assert (=> b!1423042 d!153471))

(declare-fun d!153475 () Bool)

(declare-fun lt!626947 () (_ BitVec 32))

(declare-fun lt!626946 () (_ BitVec 32))

(assert (=> d!153475 (= lt!626947 (bvmul (bvxor lt!626946 (bvlshr lt!626946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153475 (= lt!626946 ((_ extract 31 0) (bvand (bvxor lt!626839 (bvlshr lt!626839 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153475 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!957881 (let ((h!34718 ((_ extract 31 0) (bvand (bvxor lt!626839 (bvlshr lt!626839 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128596 (bvmul (bvxor h!34718 (bvlshr h!34718 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128596 (bvlshr x!128596 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!957881 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!957881 #b00000000000000000000000000000000))))))

(assert (=> d!153475 (= (toIndex!0 lt!626839 mask!2608) (bvand (bvxor lt!626947 (bvlshr lt!626947 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1423042 d!153475))

(declare-fun d!153477 () Bool)

(assert (=> d!153477 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122906 d!153477))

(declare-fun d!153485 () Bool)

(assert (=> d!153485 (= (array_inv!36193 a!2831) (bvsge (size!47463 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122906 d!153485))

(declare-fun b!1423322 () Bool)

(declare-fun e!804800 () Bool)

(declare-fun call!67394 () Bool)

(assert (=> b!1423322 (= e!804800 call!67394)))

(declare-fun b!1423323 () Bool)

(declare-fun e!804798 () Bool)

(assert (=> b!1423323 (= e!804798 e!804800)))

(declare-fun lt!626963 () (_ BitVec 64))

(assert (=> b!1423323 (= lt!626963 (select (arr!46912 a!2831) j!81))))

(declare-fun lt!626962 () Unit!48065)

(assert (=> b!1423323 (= lt!626962 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!626963 j!81))))

(assert (=> b!1423323 (arrayContainsKey!0 a!2831 lt!626963 #b00000000000000000000000000000000)))

(declare-fun lt!626964 () Unit!48065)

(assert (=> b!1423323 (= lt!626964 lt!626962)))

(declare-fun res!957939 () Bool)

(assert (=> b!1423323 (= res!957939 (= (seekEntryOrOpen!0 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) (Found!11099 j!81)))))

(assert (=> b!1423323 (=> (not res!957939) (not e!804800))))

(declare-fun b!1423324 () Bool)

(assert (=> b!1423324 (= e!804798 call!67394)))

(declare-fun bm!67391 () Bool)

(assert (=> bm!67391 (= call!67394 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!153487 () Bool)

(declare-fun res!957940 () Bool)

(declare-fun e!804799 () Bool)

(assert (=> d!153487 (=> res!957940 e!804799)))

(assert (=> d!153487 (= res!957940 (bvsge j!81 (size!47463 a!2831)))))

(assert (=> d!153487 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!804799)))

(declare-fun b!1423325 () Bool)

(assert (=> b!1423325 (= e!804799 e!804798)))

(declare-fun c!132186 () Bool)

(assert (=> b!1423325 (= c!132186 (validKeyInArray!0 (select (arr!46912 a!2831) j!81)))))

(assert (= (and d!153487 (not res!957940)) b!1423325))

(assert (= (and b!1423325 c!132186) b!1423323))

(assert (= (and b!1423325 (not c!132186)) b!1423324))

(assert (= (and b!1423323 res!957939) b!1423322))

(assert (= (or b!1423322 b!1423324) bm!67391))

(assert (=> b!1423323 m!1313817))

(declare-fun m!1314065 () Bool)

(assert (=> b!1423323 m!1314065))

(declare-fun m!1314067 () Bool)

(assert (=> b!1423323 m!1314067))

(assert (=> b!1423323 m!1313817))

(assert (=> b!1423323 m!1313853))

(declare-fun m!1314069 () Bool)

(assert (=> bm!67391 m!1314069))

(assert (=> b!1423325 m!1313817))

(assert (=> b!1423325 m!1313817))

(assert (=> b!1423325 m!1313829))

(assert (=> b!1423043 d!153487))

(declare-fun d!153489 () Bool)

(assert (=> d!153489 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!626974 () Unit!48065)

(declare-fun choose!38 (array!97193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48065)

(assert (=> d!153489 (= lt!626974 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153489 (validMask!0 mask!2608)))

(assert (=> d!153489 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!626974)))

(declare-fun bs!41477 () Bool)

(assert (= bs!41477 d!153489))

(assert (=> bs!41477 m!1313841))

(declare-fun m!1314073 () Bool)

(assert (=> bs!41477 m!1314073))

(assert (=> bs!41477 m!1313823))

(assert (=> b!1423043 d!153489))

(check-sat (not b!1423147) (not d!153445) (not b!1423325) (not b!1423323) (not b!1423162) (not d!153489) (not b!1423180) (not d!153447) (not bm!67391) (not b!1423280) (not b!1423164) (not b!1423200) (not d!153455) (not b!1423171) (not d!153437) (not b!1423161) (not b!1423202) (not bm!67380) (not d!153471) (not b!1423294) (not bm!67385))
(check-sat)
