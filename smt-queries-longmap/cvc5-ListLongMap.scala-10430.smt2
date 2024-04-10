; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122742 () Bool)

(assert start!122742)

(declare-fun e!804149 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97107 0))(
  ( (array!97108 (arr!46871 (Array (_ BitVec 32) (_ BitVec 64))) (size!47421 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97107)

(declare-fun b!1422447 () Bool)

(declare-datatypes ((SeekEntryResult!11156 0))(
  ( (MissingZero!11156 (index!47016 (_ BitVec 32))) (Found!11156 (index!47017 (_ BitVec 32))) (Intermediate!11156 (undefined!11968 Bool) (index!47018 (_ BitVec 32)) (x!128662 (_ BitVec 32))) (Undefined!11156) (MissingVacant!11156 (index!47019 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97107 (_ BitVec 32)) SeekEntryResult!11156)

(assert (=> b!1422447 (= e!804149 (= (seekEntryOrOpen!0 (select (arr!46871 a!2831) j!81) a!2831 mask!2608) (Found!11156 j!81)))))

(declare-fun b!1422448 () Bool)

(declare-fun res!957895 () Bool)

(declare-fun e!804145 () Bool)

(assert (=> b!1422448 (=> (not res!957895) (not e!804145))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422448 (= res!957895 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47421 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47421 a!2831))))))

(declare-fun b!1422449 () Bool)

(declare-fun res!957891 () Bool)

(assert (=> b!1422449 (=> (not res!957891) (not e!804145))))

(declare-datatypes ((List!33381 0))(
  ( (Nil!33378) (Cons!33377 (h!34679 (_ BitVec 64)) (t!48075 List!33381)) )
))
(declare-fun arrayNoDuplicates!0 (array!97107 (_ BitVec 32) List!33381) Bool)

(assert (=> b!1422449 (= res!957891 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33378))))

(declare-fun b!1422450 () Bool)

(declare-fun res!957882 () Bool)

(assert (=> b!1422450 (=> (not res!957882) (not e!804145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97107 (_ BitVec 32)) Bool)

(assert (=> b!1422450 (= res!957882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422451 () Bool)

(declare-fun e!804146 () Bool)

(declare-fun e!804147 () Bool)

(assert (=> b!1422451 (= e!804146 (not e!804147))))

(declare-fun res!957892 () Bool)

(assert (=> b!1422451 (=> res!957892 e!804147)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422451 (= res!957892 (or (= (select (arr!46871 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46871 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46871 a!2831) index!585) (select (arr!46871 a!2831) j!81)) (= (select (store (arr!46871 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422451 e!804149))

(declare-fun res!957880 () Bool)

(assert (=> b!1422451 (=> (not res!957880) (not e!804149))))

(assert (=> b!1422451 (= res!957880 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48148 0))(
  ( (Unit!48149) )
))
(declare-fun lt!626685 () Unit!48148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48148)

(assert (=> b!1422451 (= lt!626685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422452 () Bool)

(declare-fun res!957894 () Bool)

(assert (=> b!1422452 (=> (not res!957894) (not e!804146))))

(declare-fun lt!626679 () SeekEntryResult!11156)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97107 (_ BitVec 32)) SeekEntryResult!11156)

(assert (=> b!1422452 (= res!957894 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46871 a!2831) j!81) a!2831 mask!2608) lt!626679))))

(declare-fun b!1422453 () Bool)

(declare-fun res!957883 () Bool)

(assert (=> b!1422453 (=> (not res!957883) (not e!804145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422453 (= res!957883 (validKeyInArray!0 (select (arr!46871 a!2831) j!81)))))

(declare-fun b!1422454 () Bool)

(declare-fun res!957885 () Bool)

(declare-fun e!804148 () Bool)

(assert (=> b!1422454 (=> res!957885 e!804148)))

(declare-fun lt!626684 () (_ BitVec 32))

(assert (=> b!1422454 (= res!957885 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626684 (select (arr!46871 a!2831) j!81) a!2831 mask!2608) lt!626679)))))

(declare-fun res!957893 () Bool)

(assert (=> start!122742 (=> (not res!957893) (not e!804145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122742 (= res!957893 (validMask!0 mask!2608))))

(assert (=> start!122742 e!804145))

(assert (=> start!122742 true))

(declare-fun array_inv!35899 (array!97107) Bool)

(assert (=> start!122742 (array_inv!35899 a!2831)))

(declare-fun b!1422455 () Bool)

(declare-fun res!957887 () Bool)

(assert (=> b!1422455 (=> (not res!957887) (not e!804145))))

(assert (=> b!1422455 (= res!957887 (validKeyInArray!0 (select (arr!46871 a!2831) i!982)))))

(declare-fun b!1422456 () Bool)

(declare-fun res!957889 () Bool)

(assert (=> b!1422456 (=> (not res!957889) (not e!804146))))

(declare-fun lt!626680 () array!97107)

(declare-fun lt!626681 () (_ BitVec 64))

(declare-fun lt!626683 () SeekEntryResult!11156)

(assert (=> b!1422456 (= res!957889 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626681 lt!626680 mask!2608) lt!626683))))

(declare-fun b!1422457 () Bool)

(declare-fun e!804143 () Bool)

(assert (=> b!1422457 (= e!804145 e!804143)))

(declare-fun res!957890 () Bool)

(assert (=> b!1422457 (=> (not res!957890) (not e!804143))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422457 (= res!957890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46871 a!2831) j!81) mask!2608) (select (arr!46871 a!2831) j!81) a!2831 mask!2608) lt!626679))))

(assert (=> b!1422457 (= lt!626679 (Intermediate!11156 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422458 () Bool)

(declare-fun res!957884 () Bool)

(assert (=> b!1422458 (=> (not res!957884) (not e!804145))))

(assert (=> b!1422458 (= res!957884 (and (= (size!47421 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47421 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47421 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422459 () Bool)

(assert (=> b!1422459 (= e!804143 e!804146)))

(declare-fun res!957881 () Bool)

(assert (=> b!1422459 (=> (not res!957881) (not e!804146))))

(assert (=> b!1422459 (= res!957881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626681 mask!2608) lt!626681 lt!626680 mask!2608) lt!626683))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1422459 (= lt!626683 (Intermediate!11156 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422459 (= lt!626681 (select (store (arr!46871 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422459 (= lt!626680 (array!97108 (store (arr!46871 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47421 a!2831)))))

(declare-fun b!1422460 () Bool)

(assert (=> b!1422460 (= e!804147 e!804148)))

(declare-fun res!957886 () Bool)

(assert (=> b!1422460 (=> res!957886 e!804148)))

(assert (=> b!1422460 (= res!957886 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626684 #b00000000000000000000000000000000) (bvsge lt!626684 (size!47421 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422460 (= lt!626684 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422461 () Bool)

(declare-fun res!957888 () Bool)

(assert (=> b!1422461 (=> (not res!957888) (not e!804146))))

(assert (=> b!1422461 (= res!957888 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422462 () Bool)

(assert (=> b!1422462 (= e!804148 true)))

(declare-fun lt!626682 () SeekEntryResult!11156)

(assert (=> b!1422462 (= lt!626682 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626684 lt!626681 lt!626680 mask!2608))))

(assert (= (and start!122742 res!957893) b!1422458))

(assert (= (and b!1422458 res!957884) b!1422455))

(assert (= (and b!1422455 res!957887) b!1422453))

(assert (= (and b!1422453 res!957883) b!1422450))

(assert (= (and b!1422450 res!957882) b!1422449))

(assert (= (and b!1422449 res!957891) b!1422448))

(assert (= (and b!1422448 res!957895) b!1422457))

(assert (= (and b!1422457 res!957890) b!1422459))

(assert (= (and b!1422459 res!957881) b!1422452))

(assert (= (and b!1422452 res!957894) b!1422456))

(assert (= (and b!1422456 res!957889) b!1422461))

(assert (= (and b!1422461 res!957888) b!1422451))

(assert (= (and b!1422451 res!957880) b!1422447))

(assert (= (and b!1422451 (not res!957892)) b!1422460))

(assert (= (and b!1422460 (not res!957886)) b!1422454))

(assert (= (and b!1422454 (not res!957885)) b!1422462))

(declare-fun m!1312995 () Bool)

(assert (=> b!1422460 m!1312995))

(declare-fun m!1312997 () Bool)

(assert (=> b!1422449 m!1312997))

(declare-fun m!1312999 () Bool)

(assert (=> start!122742 m!1312999))

(declare-fun m!1313001 () Bool)

(assert (=> start!122742 m!1313001))

(declare-fun m!1313003 () Bool)

(assert (=> b!1422452 m!1313003))

(assert (=> b!1422452 m!1313003))

(declare-fun m!1313005 () Bool)

(assert (=> b!1422452 m!1313005))

(declare-fun m!1313007 () Bool)

(assert (=> b!1422451 m!1313007))

(declare-fun m!1313009 () Bool)

(assert (=> b!1422451 m!1313009))

(declare-fun m!1313011 () Bool)

(assert (=> b!1422451 m!1313011))

(declare-fun m!1313013 () Bool)

(assert (=> b!1422451 m!1313013))

(assert (=> b!1422451 m!1313003))

(declare-fun m!1313015 () Bool)

(assert (=> b!1422451 m!1313015))

(assert (=> b!1422454 m!1313003))

(assert (=> b!1422454 m!1313003))

(declare-fun m!1313017 () Bool)

(assert (=> b!1422454 m!1313017))

(declare-fun m!1313019 () Bool)

(assert (=> b!1422459 m!1313019))

(assert (=> b!1422459 m!1313019))

(declare-fun m!1313021 () Bool)

(assert (=> b!1422459 m!1313021))

(assert (=> b!1422459 m!1313007))

(declare-fun m!1313023 () Bool)

(assert (=> b!1422459 m!1313023))

(declare-fun m!1313025 () Bool)

(assert (=> b!1422455 m!1313025))

(assert (=> b!1422455 m!1313025))

(declare-fun m!1313027 () Bool)

(assert (=> b!1422455 m!1313027))

(assert (=> b!1422453 m!1313003))

(assert (=> b!1422453 m!1313003))

(declare-fun m!1313029 () Bool)

(assert (=> b!1422453 m!1313029))

(declare-fun m!1313031 () Bool)

(assert (=> b!1422462 m!1313031))

(declare-fun m!1313033 () Bool)

(assert (=> b!1422456 m!1313033))

(assert (=> b!1422457 m!1313003))

(assert (=> b!1422457 m!1313003))

(declare-fun m!1313035 () Bool)

(assert (=> b!1422457 m!1313035))

(assert (=> b!1422457 m!1313035))

(assert (=> b!1422457 m!1313003))

(declare-fun m!1313037 () Bool)

(assert (=> b!1422457 m!1313037))

(declare-fun m!1313039 () Bool)

(assert (=> b!1422450 m!1313039))

(assert (=> b!1422447 m!1313003))

(assert (=> b!1422447 m!1313003))

(declare-fun m!1313041 () Bool)

(assert (=> b!1422447 m!1313041))

(push 1)

