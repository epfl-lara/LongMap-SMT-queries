; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122778 () Bool)

(assert start!122778)

(declare-fun b!1423311 () Bool)

(declare-fun e!804526 () Bool)

(declare-fun e!804522 () Bool)

(assert (=> b!1423311 (= e!804526 e!804522)))

(declare-fun res!958756 () Bool)

(assert (=> b!1423311 (=> (not res!958756) (not e!804522))))

(declare-datatypes ((SeekEntryResult!11174 0))(
  ( (MissingZero!11174 (index!47088 (_ BitVec 32))) (Found!11174 (index!47089 (_ BitVec 32))) (Intermediate!11174 (undefined!11986 Bool) (index!47090 (_ BitVec 32)) (x!128728 (_ BitVec 32))) (Undefined!11174) (MissingVacant!11174 (index!47091 (_ BitVec 32))) )
))
(declare-fun lt!627063 () SeekEntryResult!11174)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97143 0))(
  ( (array!97144 (arr!46889 (Array (_ BitVec 32) (_ BitVec 64))) (size!47439 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97143)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97143 (_ BitVec 32)) SeekEntryResult!11174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423311 (= res!958756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46889 a!2831) j!81) mask!2608) (select (arr!46889 a!2831) j!81) a!2831 mask!2608) lt!627063))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1423311 (= lt!627063 (Intermediate!11174 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423312 () Bool)

(declare-fun res!958750 () Bool)

(assert (=> b!1423312 (=> (not res!958750) (not e!804526))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423312 (= res!958750 (and (= (size!47439 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47439 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47439 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423313 () Bool)

(declare-fun res!958758 () Bool)

(assert (=> b!1423313 (=> (not res!958758) (not e!804526))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423313 (= res!958758 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47439 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47439 a!2831))))))

(declare-fun res!958757 () Bool)

(assert (=> start!122778 (=> (not res!958757) (not e!804526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122778 (= res!958757 (validMask!0 mask!2608))))

(assert (=> start!122778 e!804526))

(assert (=> start!122778 true))

(declare-fun array_inv!35917 (array!97143) Bool)

(assert (=> start!122778 (array_inv!35917 a!2831)))

(declare-fun b!1423314 () Bool)

(declare-fun res!958748 () Bool)

(assert (=> b!1423314 (=> (not res!958748) (not e!804526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423314 (= res!958748 (validKeyInArray!0 (select (arr!46889 a!2831) i!982)))))

(declare-fun b!1423315 () Bool)

(declare-fun res!958753 () Bool)

(assert (=> b!1423315 (=> (not res!958753) (not e!804526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97143 (_ BitVec 32)) Bool)

(assert (=> b!1423315 (= res!958753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423316 () Bool)

(declare-fun res!958759 () Bool)

(assert (=> b!1423316 (=> (not res!958759) (not e!804526))))

(declare-datatypes ((List!33399 0))(
  ( (Nil!33396) (Cons!33395 (h!34697 (_ BitVec 64)) (t!48093 List!33399)) )
))
(declare-fun arrayNoDuplicates!0 (array!97143 (_ BitVec 32) List!33399) Bool)

(assert (=> b!1423316 (= res!958759 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33396))))

(declare-fun b!1423317 () Bool)

(declare-fun res!958745 () Bool)

(declare-fun e!804523 () Bool)

(assert (=> b!1423317 (=> (not res!958745) (not e!804523))))

(declare-fun lt!627059 () SeekEntryResult!11174)

(declare-fun lt!627057 () array!97143)

(declare-fun lt!627062 () (_ BitVec 64))

(assert (=> b!1423317 (= res!958745 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627062 lt!627057 mask!2608) lt!627059))))

(declare-fun b!1423318 () Bool)

(declare-fun e!804521 () Bool)

(declare-fun e!804525 () Bool)

(assert (=> b!1423318 (= e!804521 e!804525)))

(declare-fun res!958752 () Bool)

(assert (=> b!1423318 (=> res!958752 e!804525)))

(declare-fun lt!627058 () (_ BitVec 32))

(assert (=> b!1423318 (= res!958752 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627058 #b00000000000000000000000000000000) (bvsge lt!627058 (size!47439 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423318 (= lt!627058 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423319 () Bool)

(assert (=> b!1423319 (= e!804522 e!804523)))

(declare-fun res!958751 () Bool)

(assert (=> b!1423319 (=> (not res!958751) (not e!804523))))

(assert (=> b!1423319 (= res!958751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627062 mask!2608) lt!627062 lt!627057 mask!2608) lt!627059))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423319 (= lt!627059 (Intermediate!11174 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423319 (= lt!627062 (select (store (arr!46889 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423319 (= lt!627057 (array!97144 (store (arr!46889 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47439 a!2831)))))

(declare-fun b!1423320 () Bool)

(declare-fun res!958755 () Bool)

(assert (=> b!1423320 (=> res!958755 e!804525)))

(assert (=> b!1423320 (= res!958755 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627058 (select (arr!46889 a!2831) j!81) a!2831 mask!2608) lt!627063)))))

(declare-fun b!1423321 () Bool)

(declare-fun res!958754 () Bool)

(assert (=> b!1423321 (=> (not res!958754) (not e!804523))))

(assert (=> b!1423321 (= res!958754 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423322 () Bool)

(declare-fun res!958746 () Bool)

(assert (=> b!1423322 (=> (not res!958746) (not e!804523))))

(assert (=> b!1423322 (= res!958746 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46889 a!2831) j!81) a!2831 mask!2608) lt!627063))))

(declare-fun b!1423323 () Bool)

(assert (=> b!1423323 (= e!804525 true)))

(declare-fun lt!627061 () SeekEntryResult!11174)

(assert (=> b!1423323 (= lt!627061 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627058 lt!627062 lt!627057 mask!2608))))

(declare-fun b!1423324 () Bool)

(declare-fun res!958747 () Bool)

(assert (=> b!1423324 (=> (not res!958747) (not e!804526))))

(assert (=> b!1423324 (= res!958747 (validKeyInArray!0 (select (arr!46889 a!2831) j!81)))))

(declare-fun b!1423325 () Bool)

(declare-fun e!804527 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97143 (_ BitVec 32)) SeekEntryResult!11174)

(assert (=> b!1423325 (= e!804527 (= (seekEntryOrOpen!0 (select (arr!46889 a!2831) j!81) a!2831 mask!2608) (Found!11174 j!81)))))

(declare-fun b!1423326 () Bool)

(assert (=> b!1423326 (= e!804523 (not e!804521))))

(declare-fun res!958749 () Bool)

(assert (=> b!1423326 (=> res!958749 e!804521)))

(assert (=> b!1423326 (= res!958749 (or (= (select (arr!46889 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46889 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46889 a!2831) index!585) (select (arr!46889 a!2831) j!81)) (= (select (store (arr!46889 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423326 e!804527))

(declare-fun res!958744 () Bool)

(assert (=> b!1423326 (=> (not res!958744) (not e!804527))))

(assert (=> b!1423326 (= res!958744 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48184 0))(
  ( (Unit!48185) )
))
(declare-fun lt!627060 () Unit!48184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48184)

(assert (=> b!1423326 (= lt!627060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!122778 res!958757) b!1423312))

(assert (= (and b!1423312 res!958750) b!1423314))

(assert (= (and b!1423314 res!958748) b!1423324))

(assert (= (and b!1423324 res!958747) b!1423315))

(assert (= (and b!1423315 res!958753) b!1423316))

(assert (= (and b!1423316 res!958759) b!1423313))

(assert (= (and b!1423313 res!958758) b!1423311))

(assert (= (and b!1423311 res!958756) b!1423319))

(assert (= (and b!1423319 res!958751) b!1423322))

(assert (= (and b!1423322 res!958746) b!1423317))

(assert (= (and b!1423317 res!958745) b!1423321))

(assert (= (and b!1423321 res!958754) b!1423326))

(assert (= (and b!1423326 res!958744) b!1423325))

(assert (= (and b!1423326 (not res!958749)) b!1423318))

(assert (= (and b!1423318 (not res!958752)) b!1423320))

(assert (= (and b!1423320 (not res!958755)) b!1423323))

(declare-fun m!1313859 () Bool)

(assert (=> b!1423323 m!1313859))

(declare-fun m!1313861 () Bool)

(assert (=> b!1423316 m!1313861))

(declare-fun m!1313863 () Bool)

(assert (=> start!122778 m!1313863))

(declare-fun m!1313865 () Bool)

(assert (=> start!122778 m!1313865))

(declare-fun m!1313867 () Bool)

(assert (=> b!1423311 m!1313867))

(assert (=> b!1423311 m!1313867))

(declare-fun m!1313869 () Bool)

(assert (=> b!1423311 m!1313869))

(assert (=> b!1423311 m!1313869))

(assert (=> b!1423311 m!1313867))

(declare-fun m!1313871 () Bool)

(assert (=> b!1423311 m!1313871))

(assert (=> b!1423325 m!1313867))

(assert (=> b!1423325 m!1313867))

(declare-fun m!1313873 () Bool)

(assert (=> b!1423325 m!1313873))

(assert (=> b!1423324 m!1313867))

(assert (=> b!1423324 m!1313867))

(declare-fun m!1313875 () Bool)

(assert (=> b!1423324 m!1313875))

(declare-fun m!1313877 () Bool)

(assert (=> b!1423319 m!1313877))

(assert (=> b!1423319 m!1313877))

(declare-fun m!1313879 () Bool)

(assert (=> b!1423319 m!1313879))

(declare-fun m!1313881 () Bool)

(assert (=> b!1423319 m!1313881))

(declare-fun m!1313883 () Bool)

(assert (=> b!1423319 m!1313883))

(assert (=> b!1423326 m!1313881))

(declare-fun m!1313885 () Bool)

(assert (=> b!1423326 m!1313885))

(declare-fun m!1313887 () Bool)

(assert (=> b!1423326 m!1313887))

(declare-fun m!1313889 () Bool)

(assert (=> b!1423326 m!1313889))

(assert (=> b!1423326 m!1313867))

(declare-fun m!1313891 () Bool)

(assert (=> b!1423326 m!1313891))

(declare-fun m!1313893 () Bool)

(assert (=> b!1423315 m!1313893))

(assert (=> b!1423322 m!1313867))

(assert (=> b!1423322 m!1313867))

(declare-fun m!1313895 () Bool)

(assert (=> b!1423322 m!1313895))

(declare-fun m!1313897 () Bool)

(assert (=> b!1423314 m!1313897))

(assert (=> b!1423314 m!1313897))

(declare-fun m!1313899 () Bool)

(assert (=> b!1423314 m!1313899))

(declare-fun m!1313901 () Bool)

(assert (=> b!1423317 m!1313901))

(assert (=> b!1423320 m!1313867))

(assert (=> b!1423320 m!1313867))

(declare-fun m!1313903 () Bool)

(assert (=> b!1423320 m!1313903))

(declare-fun m!1313905 () Bool)

(assert (=> b!1423318 m!1313905))

(push 1)

