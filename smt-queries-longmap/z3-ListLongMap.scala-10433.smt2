; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122756 () Bool)

(assert start!122756)

(declare-fun b!1422798 () Bool)

(declare-fun res!958288 () Bool)

(declare-fun e!804296 () Bool)

(assert (=> b!1422798 (=> (not res!958288) (not e!804296))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97074 0))(
  ( (array!97075 (arr!46855 (Array (_ BitVec 32) (_ BitVec 64))) (size!47407 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97074)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422798 (= res!958288 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47407 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47407 a!2831))))))

(declare-fun b!1422799 () Bool)

(declare-fun res!958289 () Bool)

(assert (=> b!1422799 (=> (not res!958289) (not e!804296))))

(declare-datatypes ((List!33443 0))(
  ( (Nil!33440) (Cons!33439 (h!34741 (_ BitVec 64)) (t!48129 List!33443)) )
))
(declare-fun arrayNoDuplicates!0 (array!97074 (_ BitVec 32) List!33443) Bool)

(assert (=> b!1422799 (= res!958289 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33440))))

(declare-fun res!958294 () Bool)

(assert (=> start!122756 (=> (not res!958294) (not e!804296))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122756 (= res!958294 (validMask!0 mask!2608))))

(assert (=> start!122756 e!804296))

(assert (=> start!122756 true))

(declare-fun array_inv!36088 (array!97074) Bool)

(assert (=> start!122756 (array_inv!36088 a!2831)))

(declare-fun b!1422800 () Bool)

(declare-fun res!958295 () Bool)

(assert (=> b!1422800 (=> (not res!958295) (not e!804296))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422800 (= res!958295 (validKeyInArray!0 (select (arr!46855 a!2831) j!81)))))

(declare-fun b!1422801 () Bool)

(declare-fun res!958292 () Bool)

(assert (=> b!1422801 (=> (not res!958292) (not e!804296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97074 (_ BitVec 32)) Bool)

(assert (=> b!1422801 (= res!958292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422802 () Bool)

(declare-fun e!804299 () Bool)

(declare-fun e!804295 () Bool)

(assert (=> b!1422802 (= e!804299 e!804295)))

(declare-fun res!958293 () Bool)

(assert (=> b!1422802 (=> (not res!958293) (not e!804295))))

(declare-fun lt!626681 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11167 0))(
  ( (MissingZero!11167 (index!47060 (_ BitVec 32))) (Found!11167 (index!47061 (_ BitVec 32))) (Intermediate!11167 (undefined!11979 Bool) (index!47062 (_ BitVec 32)) (x!128694 (_ BitVec 32))) (Undefined!11167) (MissingVacant!11167 (index!47063 (_ BitVec 32))) )
))
(declare-fun lt!626684 () SeekEntryResult!11167)

(declare-fun lt!626683 () array!97074)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97074 (_ BitVec 32)) SeekEntryResult!11167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422802 (= res!958293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626681 mask!2608) lt!626681 lt!626683 mask!2608) lt!626684))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422802 (= lt!626684 (Intermediate!11167 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422802 (= lt!626681 (select (store (arr!46855 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422802 (= lt!626683 (array!97075 (store (arr!46855 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47407 a!2831)))))

(declare-fun b!1422803 () Bool)

(declare-fun e!804297 () Bool)

(declare-fun e!804298 () Bool)

(assert (=> b!1422803 (= e!804297 e!804298)))

(declare-fun res!958283 () Bool)

(assert (=> b!1422803 (=> res!958283 e!804298)))

(declare-fun lt!626678 () (_ BitVec 32))

(assert (=> b!1422803 (= res!958283 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626678 #b00000000000000000000000000000000) (bvsge lt!626678 (size!47407 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422803 (= lt!626678 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422804 () Bool)

(declare-fun e!804294 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97074 (_ BitVec 32)) SeekEntryResult!11167)

(assert (=> b!1422804 (= e!804294 (= (seekEntryOrOpen!0 (select (arr!46855 a!2831) j!81) a!2831 mask!2608) (Found!11167 j!81)))))

(declare-fun b!1422805 () Bool)

(declare-fun res!958291 () Bool)

(assert (=> b!1422805 (=> (not res!958291) (not e!804296))))

(assert (=> b!1422805 (= res!958291 (validKeyInArray!0 (select (arr!46855 a!2831) i!982)))))

(declare-fun b!1422806 () Bool)

(declare-fun res!958286 () Bool)

(assert (=> b!1422806 (=> res!958286 e!804298)))

(declare-fun lt!626680 () SeekEntryResult!11167)

(assert (=> b!1422806 (= res!958286 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626678 (select (arr!46855 a!2831) j!81) a!2831 mask!2608) lt!626680)))))

(declare-fun b!1422807 () Bool)

(declare-fun res!958296 () Bool)

(assert (=> b!1422807 (=> (not res!958296) (not e!804295))))

(assert (=> b!1422807 (= res!958296 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422808 () Bool)

(assert (=> b!1422808 (= e!804296 e!804299)))

(declare-fun res!958290 () Bool)

(assert (=> b!1422808 (=> (not res!958290) (not e!804299))))

(assert (=> b!1422808 (= res!958290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46855 a!2831) j!81) mask!2608) (select (arr!46855 a!2831) j!81) a!2831 mask!2608) lt!626680))))

(assert (=> b!1422808 (= lt!626680 (Intermediate!11167 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422809 () Bool)

(assert (=> b!1422809 (= e!804298 true)))

(declare-fun lt!626682 () SeekEntryResult!11167)

(assert (=> b!1422809 (= lt!626682 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626678 lt!626681 lt!626683 mask!2608))))

(declare-fun b!1422810 () Bool)

(assert (=> b!1422810 (= e!804295 (not e!804297))))

(declare-fun res!958285 () Bool)

(assert (=> b!1422810 (=> res!958285 e!804297)))

(assert (=> b!1422810 (= res!958285 (or (= (select (arr!46855 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46855 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46855 a!2831) index!585) (select (arr!46855 a!2831) j!81)) (= (select (store (arr!46855 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422810 e!804294))

(declare-fun res!958297 () Bool)

(assert (=> b!1422810 (=> (not res!958297) (not e!804294))))

(assert (=> b!1422810 (= res!958297 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48009 0))(
  ( (Unit!48010) )
))
(declare-fun lt!626679 () Unit!48009)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48009)

(assert (=> b!1422810 (= lt!626679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422811 () Bool)

(declare-fun res!958284 () Bool)

(assert (=> b!1422811 (=> (not res!958284) (not e!804295))))

(assert (=> b!1422811 (= res!958284 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46855 a!2831) j!81) a!2831 mask!2608) lt!626680))))

(declare-fun b!1422812 () Bool)

(declare-fun res!958282 () Bool)

(assert (=> b!1422812 (=> (not res!958282) (not e!804296))))

(assert (=> b!1422812 (= res!958282 (and (= (size!47407 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47407 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47407 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422813 () Bool)

(declare-fun res!958287 () Bool)

(assert (=> b!1422813 (=> (not res!958287) (not e!804295))))

(assert (=> b!1422813 (= res!958287 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626681 lt!626683 mask!2608) lt!626684))))

(assert (= (and start!122756 res!958294) b!1422812))

(assert (= (and b!1422812 res!958282) b!1422805))

(assert (= (and b!1422805 res!958291) b!1422800))

(assert (= (and b!1422800 res!958295) b!1422801))

(assert (= (and b!1422801 res!958292) b!1422799))

(assert (= (and b!1422799 res!958289) b!1422798))

(assert (= (and b!1422798 res!958288) b!1422808))

(assert (= (and b!1422808 res!958290) b!1422802))

(assert (= (and b!1422802 res!958293) b!1422811))

(assert (= (and b!1422811 res!958284) b!1422813))

(assert (= (and b!1422813 res!958287) b!1422807))

(assert (= (and b!1422807 res!958296) b!1422810))

(assert (= (and b!1422810 res!958297) b!1422804))

(assert (= (and b!1422810 (not res!958285)) b!1422803))

(assert (= (and b!1422803 (not res!958283)) b!1422806))

(assert (= (and b!1422806 (not res!958286)) b!1422809))

(declare-fun m!1312875 () Bool)

(assert (=> b!1422800 m!1312875))

(assert (=> b!1422800 m!1312875))

(declare-fun m!1312877 () Bool)

(assert (=> b!1422800 m!1312877))

(assert (=> b!1422808 m!1312875))

(assert (=> b!1422808 m!1312875))

(declare-fun m!1312879 () Bool)

(assert (=> b!1422808 m!1312879))

(assert (=> b!1422808 m!1312879))

(assert (=> b!1422808 m!1312875))

(declare-fun m!1312881 () Bool)

(assert (=> b!1422808 m!1312881))

(declare-fun m!1312883 () Bool)

(assert (=> b!1422803 m!1312883))

(declare-fun m!1312885 () Bool)

(assert (=> b!1422805 m!1312885))

(assert (=> b!1422805 m!1312885))

(declare-fun m!1312887 () Bool)

(assert (=> b!1422805 m!1312887))

(declare-fun m!1312889 () Bool)

(assert (=> start!122756 m!1312889))

(declare-fun m!1312891 () Bool)

(assert (=> start!122756 m!1312891))

(declare-fun m!1312893 () Bool)

(assert (=> b!1422813 m!1312893))

(assert (=> b!1422804 m!1312875))

(assert (=> b!1422804 m!1312875))

(declare-fun m!1312895 () Bool)

(assert (=> b!1422804 m!1312895))

(declare-fun m!1312897 () Bool)

(assert (=> b!1422809 m!1312897))

(assert (=> b!1422806 m!1312875))

(assert (=> b!1422806 m!1312875))

(declare-fun m!1312899 () Bool)

(assert (=> b!1422806 m!1312899))

(declare-fun m!1312901 () Bool)

(assert (=> b!1422799 m!1312901))

(assert (=> b!1422811 m!1312875))

(assert (=> b!1422811 m!1312875))

(declare-fun m!1312903 () Bool)

(assert (=> b!1422811 m!1312903))

(declare-fun m!1312905 () Bool)

(assert (=> b!1422802 m!1312905))

(assert (=> b!1422802 m!1312905))

(declare-fun m!1312907 () Bool)

(assert (=> b!1422802 m!1312907))

(declare-fun m!1312909 () Bool)

(assert (=> b!1422802 m!1312909))

(declare-fun m!1312911 () Bool)

(assert (=> b!1422802 m!1312911))

(assert (=> b!1422810 m!1312909))

(declare-fun m!1312913 () Bool)

(assert (=> b!1422810 m!1312913))

(declare-fun m!1312915 () Bool)

(assert (=> b!1422810 m!1312915))

(declare-fun m!1312917 () Bool)

(assert (=> b!1422810 m!1312917))

(assert (=> b!1422810 m!1312875))

(declare-fun m!1312919 () Bool)

(assert (=> b!1422810 m!1312919))

(declare-fun m!1312921 () Bool)

(assert (=> b!1422801 m!1312921))

(check-sat (not b!1422808) (not b!1422813) (not start!122756) (not b!1422809) (not b!1422810) (not b!1422805) (not b!1422804) (not b!1422803) (not b!1422800) (not b!1422802) (not b!1422801) (not b!1422806) (not b!1422799) (not b!1422811))
(check-sat)
