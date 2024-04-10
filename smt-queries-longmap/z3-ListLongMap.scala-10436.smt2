; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122780 () Bool)

(assert start!122780)

(declare-fun b!1423359 () Bool)

(declare-fun res!958798 () Bool)

(declare-fun e!804548 () Bool)

(assert (=> b!1423359 (=> (not res!958798) (not e!804548))))

(declare-datatypes ((SeekEntryResult!11175 0))(
  ( (MissingZero!11175 (index!47092 (_ BitVec 32))) (Found!11175 (index!47093 (_ BitVec 32))) (Intermediate!11175 (undefined!11987 Bool) (index!47094 (_ BitVec 32)) (x!128729 (_ BitVec 32))) (Undefined!11175) (MissingVacant!11175 (index!47095 (_ BitVec 32))) )
))
(declare-fun lt!627084 () SeekEntryResult!11175)

(declare-fun lt!627082 () (_ BitVec 64))

(declare-datatypes ((array!97145 0))(
  ( (array!97146 (arr!46890 (Array (_ BitVec 32) (_ BitVec 64))) (size!47440 (_ BitVec 32))) )
))
(declare-fun lt!627083 () array!97145)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97145 (_ BitVec 32)) SeekEntryResult!11175)

(assert (=> b!1423359 (= res!958798 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627082 lt!627083 mask!2608) lt!627084))))

(declare-fun b!1423360 () Bool)

(declare-fun res!958794 () Bool)

(declare-fun e!804544 () Bool)

(assert (=> b!1423360 (=> res!958794 e!804544)))

(declare-fun lt!627081 () (_ BitVec 32))

(declare-fun lt!627078 () SeekEntryResult!11175)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97145)

(assert (=> b!1423360 (= res!958794 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627081 (select (arr!46890 a!2831) j!81) a!2831 mask!2608) lt!627078)))))

(declare-fun b!1423361 () Bool)

(declare-fun res!958806 () Bool)

(assert (=> b!1423361 (=> (not res!958806) (not e!804548))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423361 (= res!958806 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423362 () Bool)

(declare-fun res!958807 () Bool)

(declare-fun e!804542 () Bool)

(assert (=> b!1423362 (=> (not res!958807) (not e!804542))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423362 (= res!958807 (validKeyInArray!0 (select (arr!46890 a!2831) i!982)))))

(declare-fun e!804546 () Bool)

(declare-fun b!1423363 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97145 (_ BitVec 32)) SeekEntryResult!11175)

(assert (=> b!1423363 (= e!804546 (= (seekEntryOrOpen!0 (select (arr!46890 a!2831) j!81) a!2831 mask!2608) (Found!11175 j!81)))))

(declare-fun b!1423364 () Bool)

(declare-fun e!804543 () Bool)

(assert (=> b!1423364 (= e!804543 e!804548)))

(declare-fun res!958797 () Bool)

(assert (=> b!1423364 (=> (not res!958797) (not e!804548))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423364 (= res!958797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627082 mask!2608) lt!627082 lt!627083 mask!2608) lt!627084))))

(assert (=> b!1423364 (= lt!627084 (Intermediate!11175 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423364 (= lt!627082 (select (store (arr!46890 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423364 (= lt!627083 (array!97146 (store (arr!46890 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47440 a!2831)))))

(declare-fun b!1423365 () Bool)

(declare-fun e!804547 () Bool)

(assert (=> b!1423365 (= e!804547 e!804544)))

(declare-fun res!958796 () Bool)

(assert (=> b!1423365 (=> res!958796 e!804544)))

(assert (=> b!1423365 (= res!958796 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627081 #b00000000000000000000000000000000) (bvsge lt!627081 (size!47440 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423365 (= lt!627081 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423366 () Bool)

(assert (=> b!1423366 (= e!804542 e!804543)))

(declare-fun res!958793 () Bool)

(assert (=> b!1423366 (=> (not res!958793) (not e!804543))))

(assert (=> b!1423366 (= res!958793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46890 a!2831) j!81) mask!2608) (select (arr!46890 a!2831) j!81) a!2831 mask!2608) lt!627078))))

(assert (=> b!1423366 (= lt!627078 (Intermediate!11175 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423367 () Bool)

(declare-fun res!958799 () Bool)

(assert (=> b!1423367 (=> (not res!958799) (not e!804542))))

(assert (=> b!1423367 (= res!958799 (and (= (size!47440 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47440 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47440 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423368 () Bool)

(declare-fun res!958802 () Bool)

(assert (=> b!1423368 (=> (not res!958802) (not e!804548))))

(assert (=> b!1423368 (= res!958802 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46890 a!2831) j!81) a!2831 mask!2608) lt!627078))))

(declare-fun b!1423370 () Bool)

(declare-fun res!958792 () Bool)

(assert (=> b!1423370 (=> (not res!958792) (not e!804542))))

(declare-datatypes ((List!33400 0))(
  ( (Nil!33397) (Cons!33396 (h!34698 (_ BitVec 64)) (t!48094 List!33400)) )
))
(declare-fun arrayNoDuplicates!0 (array!97145 (_ BitVec 32) List!33400) Bool)

(assert (=> b!1423370 (= res!958792 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33397))))

(declare-fun b!1423371 () Bool)

(declare-fun res!958795 () Bool)

(assert (=> b!1423371 (=> (not res!958795) (not e!804542))))

(assert (=> b!1423371 (= res!958795 (validKeyInArray!0 (select (arr!46890 a!2831) j!81)))))

(declare-fun b!1423372 () Bool)

(assert (=> b!1423372 (= e!804548 (not e!804547))))

(declare-fun res!958805 () Bool)

(assert (=> b!1423372 (=> res!958805 e!804547)))

(assert (=> b!1423372 (= res!958805 (or (= (select (arr!46890 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46890 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46890 a!2831) index!585) (select (arr!46890 a!2831) j!81)) (= (select (store (arr!46890 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423372 e!804546))

(declare-fun res!958804 () Bool)

(assert (=> b!1423372 (=> (not res!958804) (not e!804546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97145 (_ BitVec 32)) Bool)

(assert (=> b!1423372 (= res!958804 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48186 0))(
  ( (Unit!48187) )
))
(declare-fun lt!627080 () Unit!48186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48186)

(assert (=> b!1423372 (= lt!627080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423373 () Bool)

(assert (=> b!1423373 (= e!804544 true)))

(declare-fun lt!627079 () SeekEntryResult!11175)

(assert (=> b!1423373 (= lt!627079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627081 lt!627082 lt!627083 mask!2608))))

(declare-fun b!1423374 () Bool)

(declare-fun res!958800 () Bool)

(assert (=> b!1423374 (=> (not res!958800) (not e!804542))))

(assert (=> b!1423374 (= res!958800 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47440 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47440 a!2831))))))

(declare-fun b!1423369 () Bool)

(declare-fun res!958803 () Bool)

(assert (=> b!1423369 (=> (not res!958803) (not e!804542))))

(assert (=> b!1423369 (= res!958803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!958801 () Bool)

(assert (=> start!122780 (=> (not res!958801) (not e!804542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122780 (= res!958801 (validMask!0 mask!2608))))

(assert (=> start!122780 e!804542))

(assert (=> start!122780 true))

(declare-fun array_inv!35918 (array!97145) Bool)

(assert (=> start!122780 (array_inv!35918 a!2831)))

(assert (= (and start!122780 res!958801) b!1423367))

(assert (= (and b!1423367 res!958799) b!1423362))

(assert (= (and b!1423362 res!958807) b!1423371))

(assert (= (and b!1423371 res!958795) b!1423369))

(assert (= (and b!1423369 res!958803) b!1423370))

(assert (= (and b!1423370 res!958792) b!1423374))

(assert (= (and b!1423374 res!958800) b!1423366))

(assert (= (and b!1423366 res!958793) b!1423364))

(assert (= (and b!1423364 res!958797) b!1423368))

(assert (= (and b!1423368 res!958802) b!1423359))

(assert (= (and b!1423359 res!958798) b!1423361))

(assert (= (and b!1423361 res!958806) b!1423372))

(assert (= (and b!1423372 res!958804) b!1423363))

(assert (= (and b!1423372 (not res!958805)) b!1423365))

(assert (= (and b!1423365 (not res!958796)) b!1423360))

(assert (= (and b!1423360 (not res!958794)) b!1423373))

(declare-fun m!1313907 () Bool)

(assert (=> b!1423363 m!1313907))

(assert (=> b!1423363 m!1313907))

(declare-fun m!1313909 () Bool)

(assert (=> b!1423363 m!1313909))

(declare-fun m!1313911 () Bool)

(assert (=> b!1423372 m!1313911))

(declare-fun m!1313913 () Bool)

(assert (=> b!1423372 m!1313913))

(declare-fun m!1313915 () Bool)

(assert (=> b!1423372 m!1313915))

(declare-fun m!1313917 () Bool)

(assert (=> b!1423372 m!1313917))

(assert (=> b!1423372 m!1313907))

(declare-fun m!1313919 () Bool)

(assert (=> b!1423372 m!1313919))

(assert (=> b!1423371 m!1313907))

(assert (=> b!1423371 m!1313907))

(declare-fun m!1313921 () Bool)

(assert (=> b!1423371 m!1313921))

(assert (=> b!1423366 m!1313907))

(assert (=> b!1423366 m!1313907))

(declare-fun m!1313923 () Bool)

(assert (=> b!1423366 m!1313923))

(assert (=> b!1423366 m!1313923))

(assert (=> b!1423366 m!1313907))

(declare-fun m!1313925 () Bool)

(assert (=> b!1423366 m!1313925))

(declare-fun m!1313927 () Bool)

(assert (=> b!1423359 m!1313927))

(declare-fun m!1313929 () Bool)

(assert (=> b!1423369 m!1313929))

(declare-fun m!1313931 () Bool)

(assert (=> b!1423365 m!1313931))

(declare-fun m!1313933 () Bool)

(assert (=> b!1423362 m!1313933))

(assert (=> b!1423362 m!1313933))

(declare-fun m!1313935 () Bool)

(assert (=> b!1423362 m!1313935))

(declare-fun m!1313937 () Bool)

(assert (=> b!1423364 m!1313937))

(assert (=> b!1423364 m!1313937))

(declare-fun m!1313939 () Bool)

(assert (=> b!1423364 m!1313939))

(assert (=> b!1423364 m!1313911))

(declare-fun m!1313941 () Bool)

(assert (=> b!1423364 m!1313941))

(declare-fun m!1313943 () Bool)

(assert (=> b!1423370 m!1313943))

(declare-fun m!1313945 () Bool)

(assert (=> b!1423373 m!1313945))

(declare-fun m!1313947 () Bool)

(assert (=> start!122780 m!1313947))

(declare-fun m!1313949 () Bool)

(assert (=> start!122780 m!1313949))

(assert (=> b!1423360 m!1313907))

(assert (=> b!1423360 m!1313907))

(declare-fun m!1313951 () Bool)

(assert (=> b!1423360 m!1313951))

(assert (=> b!1423368 m!1313907))

(assert (=> b!1423368 m!1313907))

(declare-fun m!1313953 () Bool)

(assert (=> b!1423368 m!1313953))

(check-sat (not b!1423364) (not b!1423368) (not b!1423365) (not b!1423372) (not b!1423369) (not b!1423366) (not b!1423363) (not b!1423359) (not b!1423360) (not start!122780) (not b!1423373) (not b!1423370) (not b!1423362) (not b!1423371))
(check-sat)
