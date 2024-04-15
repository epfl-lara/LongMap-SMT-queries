; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122762 () Bool)

(assert start!122762)

(declare-fun b!1422942 () Bool)

(declare-fun res!958431 () Bool)

(declare-fun e!804358 () Bool)

(assert (=> b!1422942 (=> (not res!958431) (not e!804358))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11170 0))(
  ( (MissingZero!11170 (index!47072 (_ BitVec 32))) (Found!11170 (index!47073 (_ BitVec 32))) (Intermediate!11170 (undefined!11982 Bool) (index!47074 (_ BitVec 32)) (x!128705 (_ BitVec 32))) (Undefined!11170) (MissingVacant!11170 (index!47075 (_ BitVec 32))) )
))
(declare-fun lt!626743 () SeekEntryResult!11170)

(declare-datatypes ((array!97080 0))(
  ( (array!97081 (arr!46858 (Array (_ BitVec 32) (_ BitVec 64))) (size!47410 (_ BitVec 32))) )
))
(declare-fun lt!626742 () array!97080)

(declare-fun lt!626744 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97080 (_ BitVec 32)) SeekEntryResult!11170)

(assert (=> b!1422942 (= res!958431 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626744 lt!626742 mask!2608) lt!626743))))

(declare-fun b!1422943 () Bool)

(declare-fun e!804357 () Bool)

(declare-fun e!804361 () Bool)

(assert (=> b!1422943 (= e!804357 e!804361)))

(declare-fun res!958439 () Bool)

(assert (=> b!1422943 (=> (not res!958439) (not e!804361))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97080)

(declare-fun lt!626747 () SeekEntryResult!11170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422943 (= res!958439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46858 a!2831) j!81) mask!2608) (select (arr!46858 a!2831) j!81) a!2831 mask!2608) lt!626747))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422943 (= lt!626747 (Intermediate!11170 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422944 () Bool)

(declare-fun res!958440 () Bool)

(assert (=> b!1422944 (=> (not res!958440) (not e!804358))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422944 (= res!958440 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422945 () Bool)

(assert (=> b!1422945 (= e!804361 e!804358)))

(declare-fun res!958437 () Bool)

(assert (=> b!1422945 (=> (not res!958437) (not e!804358))))

(assert (=> b!1422945 (= res!958437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626744 mask!2608) lt!626744 lt!626742 mask!2608) lt!626743))))

(assert (=> b!1422945 (= lt!626743 (Intermediate!11170 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422945 (= lt!626744 (select (store (arr!46858 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422945 (= lt!626742 (array!97081 (store (arr!46858 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47410 a!2831)))))

(declare-fun b!1422946 () Bool)

(declare-fun e!804359 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97080 (_ BitVec 32)) SeekEntryResult!11170)

(assert (=> b!1422946 (= e!804359 (= (seekEntryOrOpen!0 (select (arr!46858 a!2831) j!81) a!2831 mask!2608) (Found!11170 j!81)))))

(declare-fun b!1422947 () Bool)

(declare-fun res!958441 () Bool)

(assert (=> b!1422947 (=> (not res!958441) (not e!804357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422947 (= res!958441 (validKeyInArray!0 (select (arr!46858 a!2831) i!982)))))

(declare-fun res!958435 () Bool)

(assert (=> start!122762 (=> (not res!958435) (not e!804357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122762 (= res!958435 (validMask!0 mask!2608))))

(assert (=> start!122762 e!804357))

(assert (=> start!122762 true))

(declare-fun array_inv!36091 (array!97080) Bool)

(assert (=> start!122762 (array_inv!36091 a!2831)))

(declare-fun b!1422948 () Bool)

(declare-fun e!804362 () Bool)

(assert (=> b!1422948 (= e!804358 (not e!804362))))

(declare-fun res!958438 () Bool)

(assert (=> b!1422948 (=> res!958438 e!804362)))

(assert (=> b!1422948 (= res!958438 (or (= (select (arr!46858 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46858 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46858 a!2831) index!585) (select (arr!46858 a!2831) j!81)) (= (select (store (arr!46858 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422948 e!804359))

(declare-fun res!958434 () Bool)

(assert (=> b!1422948 (=> (not res!958434) (not e!804359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97080 (_ BitVec 32)) Bool)

(assert (=> b!1422948 (= res!958434 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48015 0))(
  ( (Unit!48016) )
))
(declare-fun lt!626745 () Unit!48015)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48015)

(assert (=> b!1422948 (= lt!626745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422949 () Bool)

(declare-fun res!958429 () Bool)

(assert (=> b!1422949 (=> (not res!958429) (not e!804357))))

(assert (=> b!1422949 (= res!958429 (validKeyInArray!0 (select (arr!46858 a!2831) j!81)))))

(declare-fun b!1422950 () Bool)

(declare-fun res!958436 () Bool)

(assert (=> b!1422950 (=> (not res!958436) (not e!804357))))

(assert (=> b!1422950 (= res!958436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422951 () Bool)

(declare-fun res!958433 () Bool)

(assert (=> b!1422951 (=> (not res!958433) (not e!804357))))

(assert (=> b!1422951 (= res!958433 (and (= (size!47410 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47410 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47410 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422952 () Bool)

(declare-fun res!958427 () Bool)

(declare-fun e!804356 () Bool)

(assert (=> b!1422952 (=> res!958427 e!804356)))

(declare-fun lt!626741 () (_ BitVec 32))

(assert (=> b!1422952 (= res!958427 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626741 (select (arr!46858 a!2831) j!81) a!2831 mask!2608) lt!626747)))))

(declare-fun b!1422953 () Bool)

(assert (=> b!1422953 (= e!804356 true)))

(declare-fun lt!626746 () SeekEntryResult!11170)

(assert (=> b!1422953 (= lt!626746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626741 lt!626744 lt!626742 mask!2608))))

(declare-fun b!1422954 () Bool)

(declare-fun res!958428 () Bool)

(assert (=> b!1422954 (=> (not res!958428) (not e!804358))))

(assert (=> b!1422954 (= res!958428 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46858 a!2831) j!81) a!2831 mask!2608) lt!626747))))

(declare-fun b!1422955 () Bool)

(declare-fun res!958432 () Bool)

(assert (=> b!1422955 (=> (not res!958432) (not e!804357))))

(assert (=> b!1422955 (= res!958432 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47410 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47410 a!2831))))))

(declare-fun b!1422956 () Bool)

(declare-fun res!958430 () Bool)

(assert (=> b!1422956 (=> (not res!958430) (not e!804357))))

(declare-datatypes ((List!33446 0))(
  ( (Nil!33443) (Cons!33442 (h!34744 (_ BitVec 64)) (t!48132 List!33446)) )
))
(declare-fun arrayNoDuplicates!0 (array!97080 (_ BitVec 32) List!33446) Bool)

(assert (=> b!1422956 (= res!958430 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33443))))

(declare-fun b!1422957 () Bool)

(assert (=> b!1422957 (= e!804362 e!804356)))

(declare-fun res!958426 () Bool)

(assert (=> b!1422957 (=> res!958426 e!804356)))

(assert (=> b!1422957 (= res!958426 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626741 #b00000000000000000000000000000000) (bvsge lt!626741 (size!47410 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422957 (= lt!626741 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122762 res!958435) b!1422951))

(assert (= (and b!1422951 res!958433) b!1422947))

(assert (= (and b!1422947 res!958441) b!1422949))

(assert (= (and b!1422949 res!958429) b!1422950))

(assert (= (and b!1422950 res!958436) b!1422956))

(assert (= (and b!1422956 res!958430) b!1422955))

(assert (= (and b!1422955 res!958432) b!1422943))

(assert (= (and b!1422943 res!958439) b!1422945))

(assert (= (and b!1422945 res!958437) b!1422954))

(assert (= (and b!1422954 res!958428) b!1422942))

(assert (= (and b!1422942 res!958431) b!1422944))

(assert (= (and b!1422944 res!958440) b!1422948))

(assert (= (and b!1422948 res!958434) b!1422946))

(assert (= (and b!1422948 (not res!958438)) b!1422957))

(assert (= (and b!1422957 (not res!958426)) b!1422952))

(assert (= (and b!1422952 (not res!958427)) b!1422953))

(declare-fun m!1313019 () Bool)

(assert (=> b!1422945 m!1313019))

(assert (=> b!1422945 m!1313019))

(declare-fun m!1313021 () Bool)

(assert (=> b!1422945 m!1313021))

(declare-fun m!1313023 () Bool)

(assert (=> b!1422945 m!1313023))

(declare-fun m!1313025 () Bool)

(assert (=> b!1422945 m!1313025))

(assert (=> b!1422948 m!1313023))

(declare-fun m!1313027 () Bool)

(assert (=> b!1422948 m!1313027))

(declare-fun m!1313029 () Bool)

(assert (=> b!1422948 m!1313029))

(declare-fun m!1313031 () Bool)

(assert (=> b!1422948 m!1313031))

(declare-fun m!1313033 () Bool)

(assert (=> b!1422948 m!1313033))

(declare-fun m!1313035 () Bool)

(assert (=> b!1422948 m!1313035))

(declare-fun m!1313037 () Bool)

(assert (=> b!1422953 m!1313037))

(declare-fun m!1313039 () Bool)

(assert (=> b!1422957 m!1313039))

(assert (=> b!1422952 m!1313033))

(assert (=> b!1422952 m!1313033))

(declare-fun m!1313041 () Bool)

(assert (=> b!1422952 m!1313041))

(declare-fun m!1313043 () Bool)

(assert (=> b!1422947 m!1313043))

(assert (=> b!1422947 m!1313043))

(declare-fun m!1313045 () Bool)

(assert (=> b!1422947 m!1313045))

(declare-fun m!1313047 () Bool)

(assert (=> start!122762 m!1313047))

(declare-fun m!1313049 () Bool)

(assert (=> start!122762 m!1313049))

(declare-fun m!1313051 () Bool)

(assert (=> b!1422950 m!1313051))

(assert (=> b!1422949 m!1313033))

(assert (=> b!1422949 m!1313033))

(declare-fun m!1313053 () Bool)

(assert (=> b!1422949 m!1313053))

(assert (=> b!1422943 m!1313033))

(assert (=> b!1422943 m!1313033))

(declare-fun m!1313055 () Bool)

(assert (=> b!1422943 m!1313055))

(assert (=> b!1422943 m!1313055))

(assert (=> b!1422943 m!1313033))

(declare-fun m!1313057 () Bool)

(assert (=> b!1422943 m!1313057))

(declare-fun m!1313059 () Bool)

(assert (=> b!1422956 m!1313059))

(declare-fun m!1313061 () Bool)

(assert (=> b!1422942 m!1313061))

(assert (=> b!1422954 m!1313033))

(assert (=> b!1422954 m!1313033))

(declare-fun m!1313063 () Bool)

(assert (=> b!1422954 m!1313063))

(assert (=> b!1422946 m!1313033))

(assert (=> b!1422946 m!1313033))

(declare-fun m!1313065 () Bool)

(assert (=> b!1422946 m!1313065))

(check-sat (not b!1422945) (not b!1422943) (not b!1422949) (not b!1422957) (not b!1422956) (not b!1422954) (not b!1422942) (not b!1422947) (not b!1422948) (not b!1422950) (not start!122762) (not b!1422953) (not b!1422952) (not b!1422946))
(check-sat)
