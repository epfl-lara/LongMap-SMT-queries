; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122804 () Bool)

(assert start!122804)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97122 0))(
  ( (array!97123 (arr!46879 (Array (_ BitVec 32) (_ BitVec 64))) (size!47431 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97122)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun b!1423950 () Bool)

(declare-fun e!804802 () Bool)

(declare-datatypes ((SeekEntryResult!11191 0))(
  ( (MissingZero!11191 (index!47156 (_ BitVec 32))) (Found!11191 (index!47157 (_ BitVec 32))) (Intermediate!11191 (undefined!12003 Bool) (index!47158 (_ BitVec 32)) (x!128782 (_ BitVec 32))) (Undefined!11191) (MissingVacant!11191 (index!47159 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97122 (_ BitVec 32)) SeekEntryResult!11191)

(assert (=> b!1423950 (= e!804802 (= (seekEntryOrOpen!0 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) (Found!11191 j!81)))))

(declare-fun b!1423951 () Bool)

(declare-fun e!804803 () Bool)

(declare-fun e!804797 () Bool)

(assert (=> b!1423951 (= e!804803 e!804797)))

(declare-fun res!959438 () Bool)

(assert (=> b!1423951 (=> (not res!959438) (not e!804797))))

(declare-fun lt!627186 () array!97122)

(declare-fun lt!627183 () (_ BitVec 64))

(declare-fun lt!627182 () SeekEntryResult!11191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97122 (_ BitVec 32)) SeekEntryResult!11191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423951 (= res!959438 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627183 mask!2608) lt!627183 lt!627186 mask!2608) lt!627182))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1423951 (= lt!627182 (Intermediate!11191 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423951 (= lt!627183 (select (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423951 (= lt!627186 (array!97123 (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47431 a!2831)))))

(declare-fun b!1423952 () Bool)

(declare-fun e!804800 () Bool)

(assert (=> b!1423952 (= e!804800 e!804803)))

(declare-fun res!959442 () Bool)

(assert (=> b!1423952 (=> (not res!959442) (not e!804803))))

(declare-fun lt!627187 () SeekEntryResult!11191)

(assert (=> b!1423952 (= res!959442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46879 a!2831) j!81) mask!2608) (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!627187))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1423952 (= lt!627187 (Intermediate!11191 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!959441 () Bool)

(assert (=> start!122804 (=> (not res!959441) (not e!804800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122804 (= res!959441 (validMask!0 mask!2608))))

(assert (=> start!122804 e!804800))

(assert (=> start!122804 true))

(declare-fun array_inv!36112 (array!97122) Bool)

(assert (=> start!122804 (array_inv!36112 a!2831)))

(declare-fun b!1423953 () Bool)

(declare-fun e!804799 () Bool)

(assert (=> b!1423953 (= e!804797 (not e!804799))))

(declare-fun res!959440 () Bool)

(assert (=> b!1423953 (=> res!959440 e!804799)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423953 (= res!959440 (or (= (select (arr!46879 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46879 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46879 a!2831) index!585) (select (arr!46879 a!2831) j!81)) (= (select (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423953 e!804802))

(declare-fun res!959443 () Bool)

(assert (=> b!1423953 (=> (not res!959443) (not e!804802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97122 (_ BitVec 32)) Bool)

(assert (=> b!1423953 (= res!959443 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48057 0))(
  ( (Unit!48058) )
))
(declare-fun lt!627185 () Unit!48057)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48057)

(assert (=> b!1423953 (= lt!627185 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423954 () Bool)

(declare-fun res!959444 () Bool)

(assert (=> b!1423954 (=> (not res!959444) (not e!804800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423954 (= res!959444 (validKeyInArray!0 (select (arr!46879 a!2831) j!81)))))

(declare-fun b!1423955 () Bool)

(declare-fun e!804798 () Bool)

(assert (=> b!1423955 (= e!804798 true)))

(declare-fun lt!627188 () (_ BitVec 32))

(declare-fun lt!627184 () SeekEntryResult!11191)

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1423955 (= lt!627184 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627188 lt!627183 lt!627186 mask!2608))))

(declare-fun b!1423956 () Bool)

(declare-fun res!959439 () Bool)

(assert (=> b!1423956 (=> (not res!959439) (not e!804800))))

(assert (=> b!1423956 (= res!959439 (validKeyInArray!0 (select (arr!46879 a!2831) i!982)))))

(declare-fun b!1423957 () Bool)

(assert (=> b!1423957 (= e!804799 e!804798)))

(declare-fun res!959447 () Bool)

(assert (=> b!1423957 (=> res!959447 e!804798)))

(assert (=> b!1423957 (= res!959447 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627188 #b00000000000000000000000000000000) (bvsge lt!627188 (size!47431 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423957 (= lt!627188 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423958 () Bool)

(declare-fun res!959437 () Bool)

(assert (=> b!1423958 (=> (not res!959437) (not e!804797))))

(assert (=> b!1423958 (= res!959437 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423959 () Bool)

(declare-fun res!959446 () Bool)

(assert (=> b!1423959 (=> (not res!959446) (not e!804800))))

(declare-datatypes ((List!33467 0))(
  ( (Nil!33464) (Cons!33463 (h!34765 (_ BitVec 64)) (t!48153 List!33467)) )
))
(declare-fun arrayNoDuplicates!0 (array!97122 (_ BitVec 32) List!33467) Bool)

(assert (=> b!1423959 (= res!959446 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33464))))

(declare-fun b!1423960 () Bool)

(declare-fun res!959445 () Bool)

(assert (=> b!1423960 (=> (not res!959445) (not e!804797))))

(assert (=> b!1423960 (= res!959445 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!627187))))

(declare-fun b!1423961 () Bool)

(declare-fun res!959436 () Bool)

(assert (=> b!1423961 (=> (not res!959436) (not e!804800))))

(assert (=> b!1423961 (= res!959436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423962 () Bool)

(declare-fun res!959449 () Bool)

(assert (=> b!1423962 (=> (not res!959449) (not e!804800))))

(assert (=> b!1423962 (= res!959449 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47431 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47431 a!2831))))))

(declare-fun b!1423963 () Bool)

(declare-fun res!959435 () Bool)

(assert (=> b!1423963 (=> (not res!959435) (not e!804800))))

(assert (=> b!1423963 (= res!959435 (and (= (size!47431 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47431 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47431 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423964 () Bool)

(declare-fun res!959434 () Bool)

(assert (=> b!1423964 (=> res!959434 e!804798)))

(assert (=> b!1423964 (= res!959434 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627188 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!627187)))))

(declare-fun b!1423965 () Bool)

(declare-fun res!959448 () Bool)

(assert (=> b!1423965 (=> (not res!959448) (not e!804797))))

(assert (=> b!1423965 (= res!959448 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627183 lt!627186 mask!2608) lt!627182))))

(assert (= (and start!122804 res!959441) b!1423963))

(assert (= (and b!1423963 res!959435) b!1423956))

(assert (= (and b!1423956 res!959439) b!1423954))

(assert (= (and b!1423954 res!959444) b!1423961))

(assert (= (and b!1423961 res!959436) b!1423959))

(assert (= (and b!1423959 res!959446) b!1423962))

(assert (= (and b!1423962 res!959449) b!1423952))

(assert (= (and b!1423952 res!959442) b!1423951))

(assert (= (and b!1423951 res!959438) b!1423960))

(assert (= (and b!1423960 res!959445) b!1423965))

(assert (= (and b!1423965 res!959448) b!1423958))

(assert (= (and b!1423958 res!959437) b!1423953))

(assert (= (and b!1423953 res!959443) b!1423950))

(assert (= (and b!1423953 (not res!959440)) b!1423957))

(assert (= (and b!1423957 (not res!959447)) b!1423964))

(assert (= (and b!1423964 (not res!959434)) b!1423955))

(declare-fun m!1314027 () Bool)

(assert (=> b!1423954 m!1314027))

(assert (=> b!1423954 m!1314027))

(declare-fun m!1314029 () Bool)

(assert (=> b!1423954 m!1314029))

(declare-fun m!1314031 () Bool)

(assert (=> b!1423959 m!1314031))

(assert (=> b!1423952 m!1314027))

(assert (=> b!1423952 m!1314027))

(declare-fun m!1314033 () Bool)

(assert (=> b!1423952 m!1314033))

(assert (=> b!1423952 m!1314033))

(assert (=> b!1423952 m!1314027))

(declare-fun m!1314035 () Bool)

(assert (=> b!1423952 m!1314035))

(declare-fun m!1314037 () Bool)

(assert (=> b!1423953 m!1314037))

(declare-fun m!1314039 () Bool)

(assert (=> b!1423953 m!1314039))

(declare-fun m!1314041 () Bool)

(assert (=> b!1423953 m!1314041))

(declare-fun m!1314043 () Bool)

(assert (=> b!1423953 m!1314043))

(assert (=> b!1423953 m!1314027))

(declare-fun m!1314045 () Bool)

(assert (=> b!1423953 m!1314045))

(declare-fun m!1314047 () Bool)

(assert (=> b!1423955 m!1314047))

(declare-fun m!1314049 () Bool)

(assert (=> b!1423956 m!1314049))

(assert (=> b!1423956 m!1314049))

(declare-fun m!1314051 () Bool)

(assert (=> b!1423956 m!1314051))

(declare-fun m!1314053 () Bool)

(assert (=> b!1423965 m!1314053))

(assert (=> b!1423964 m!1314027))

(assert (=> b!1423964 m!1314027))

(declare-fun m!1314055 () Bool)

(assert (=> b!1423964 m!1314055))

(declare-fun m!1314057 () Bool)

(assert (=> b!1423957 m!1314057))

(assert (=> b!1423960 m!1314027))

(assert (=> b!1423960 m!1314027))

(declare-fun m!1314059 () Bool)

(assert (=> b!1423960 m!1314059))

(declare-fun m!1314061 () Bool)

(assert (=> b!1423961 m!1314061))

(assert (=> b!1423950 m!1314027))

(assert (=> b!1423950 m!1314027))

(declare-fun m!1314063 () Bool)

(assert (=> b!1423950 m!1314063))

(declare-fun m!1314065 () Bool)

(assert (=> b!1423951 m!1314065))

(assert (=> b!1423951 m!1314065))

(declare-fun m!1314067 () Bool)

(assert (=> b!1423951 m!1314067))

(assert (=> b!1423951 m!1314037))

(declare-fun m!1314069 () Bool)

(assert (=> b!1423951 m!1314069))

(declare-fun m!1314071 () Bool)

(assert (=> start!122804 m!1314071))

(declare-fun m!1314073 () Bool)

(assert (=> start!122804 m!1314073))

(check-sat (not b!1423952) (not b!1423964) (not b!1423965) (not b!1423950) (not b!1423956) (not b!1423961) (not b!1423957) (not b!1423960) (not b!1423951) (not start!122804) (not b!1423954) (not b!1423955) (not b!1423953) (not b!1423959))
(check-sat)
