; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122304 () Bool)

(assert start!122304)

(declare-fun b!1418210 () Bool)

(declare-fun res!953407 () Bool)

(declare-fun e!802745 () Bool)

(assert (=> b!1418210 (=> (not res!953407) (not e!802745))))

(declare-datatypes ((array!96861 0))(
  ( (array!96862 (arr!46758 (Array (_ BitVec 32) (_ BitVec 64))) (size!47309 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96861)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418210 (= res!953407 (validKeyInArray!0 (select (arr!46758 a!2901) i!1037)))))

(declare-fun b!1418211 () Bool)

(declare-fun e!802742 () Bool)

(assert (=> b!1418211 (= e!802742 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10972 0))(
  ( (MissingZero!10972 (index!46280 (_ BitVec 32))) (Found!10972 (index!46281 (_ BitVec 32))) (Intermediate!10972 (undefined!11784 Bool) (index!46282 (_ BitVec 32)) (x!128028 (_ BitVec 32))) (Undefined!10972) (MissingVacant!10972 (index!46283 (_ BitVec 32))) )
))
(declare-fun lt!625621 () SeekEntryResult!10972)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96861 (_ BitVec 32)) SeekEntryResult!10972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418211 (= lt!625621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46758 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46758 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96862 (store (arr!46758 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47309 a!2901)) mask!2840))))

(declare-fun res!953404 () Bool)

(assert (=> start!122304 (=> (not res!953404) (not e!802745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122304 (= res!953404 (validMask!0 mask!2840))))

(assert (=> start!122304 e!802745))

(assert (=> start!122304 true))

(declare-fun array_inv!36039 (array!96861) Bool)

(assert (=> start!122304 (array_inv!36039 a!2901)))

(declare-fun b!1418212 () Bool)

(declare-fun e!802744 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96861 (_ BitVec 32)) SeekEntryResult!10972)

(assert (=> b!1418212 (= e!802744 (= (seekEntryOrOpen!0 (select (arr!46758 a!2901) j!112) a!2901 mask!2840) (Found!10972 j!112)))))

(declare-fun b!1418213 () Bool)

(declare-fun res!953408 () Bool)

(assert (=> b!1418213 (=> (not res!953408) (not e!802745))))

(declare-datatypes ((List!33264 0))(
  ( (Nil!33261) (Cons!33260 (h!34558 (_ BitVec 64)) (t!47950 List!33264)) )
))
(declare-fun arrayNoDuplicates!0 (array!96861 (_ BitVec 32) List!33264) Bool)

(assert (=> b!1418213 (= res!953408 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33261))))

(declare-fun b!1418214 () Bool)

(assert (=> b!1418214 (= e!802745 (not e!802742))))

(declare-fun res!953409 () Bool)

(assert (=> b!1418214 (=> res!953409 e!802742)))

(declare-fun lt!625620 () SeekEntryResult!10972)

(assert (=> b!1418214 (= res!953409 (or (not (is-Intermediate!10972 lt!625620)) (undefined!11784 lt!625620)))))

(assert (=> b!1418214 e!802744))

(declare-fun res!953410 () Bool)

(assert (=> b!1418214 (=> (not res!953410) (not e!802744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96861 (_ BitVec 32)) Bool)

(assert (=> b!1418214 (= res!953410 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47945 0))(
  ( (Unit!47946) )
))
(declare-fun lt!625622 () Unit!47945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47945)

(assert (=> b!1418214 (= lt!625622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1418214 (= lt!625620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46758 a!2901) j!112) mask!2840) (select (arr!46758 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1418215 () Bool)

(declare-fun res!953406 () Bool)

(assert (=> b!1418215 (=> (not res!953406) (not e!802745))))

(assert (=> b!1418215 (= res!953406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1418216 () Bool)

(declare-fun res!953405 () Bool)

(assert (=> b!1418216 (=> (not res!953405) (not e!802745))))

(assert (=> b!1418216 (= res!953405 (validKeyInArray!0 (select (arr!46758 a!2901) j!112)))))

(declare-fun b!1418217 () Bool)

(declare-fun res!953403 () Bool)

(assert (=> b!1418217 (=> (not res!953403) (not e!802745))))

(assert (=> b!1418217 (= res!953403 (and (= (size!47309 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47309 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47309 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122304 res!953404) b!1418217))

(assert (= (and b!1418217 res!953403) b!1418210))

(assert (= (and b!1418210 res!953407) b!1418216))

(assert (= (and b!1418216 res!953405) b!1418215))

(assert (= (and b!1418215 res!953406) b!1418213))

(assert (= (and b!1418213 res!953408) b!1418214))

(assert (= (and b!1418214 res!953410) b!1418212))

(assert (= (and b!1418214 (not res!953409)) b!1418211))

(declare-fun m!1309221 () Bool)

(assert (=> start!122304 m!1309221))

(declare-fun m!1309223 () Bool)

(assert (=> start!122304 m!1309223))

(declare-fun m!1309225 () Bool)

(assert (=> b!1418213 m!1309225))

(declare-fun m!1309227 () Bool)

(assert (=> b!1418212 m!1309227))

(assert (=> b!1418212 m!1309227))

(declare-fun m!1309229 () Bool)

(assert (=> b!1418212 m!1309229))

(assert (=> b!1418214 m!1309227))

(declare-fun m!1309231 () Bool)

(assert (=> b!1418214 m!1309231))

(assert (=> b!1418214 m!1309227))

(declare-fun m!1309233 () Bool)

(assert (=> b!1418214 m!1309233))

(assert (=> b!1418214 m!1309231))

(assert (=> b!1418214 m!1309227))

(declare-fun m!1309235 () Bool)

(assert (=> b!1418214 m!1309235))

(declare-fun m!1309237 () Bool)

(assert (=> b!1418214 m!1309237))

(assert (=> b!1418216 m!1309227))

(assert (=> b!1418216 m!1309227))

(declare-fun m!1309239 () Bool)

(assert (=> b!1418216 m!1309239))

(declare-fun m!1309241 () Bool)

(assert (=> b!1418215 m!1309241))

(declare-fun m!1309243 () Bool)

(assert (=> b!1418211 m!1309243))

(declare-fun m!1309245 () Bool)

(assert (=> b!1418211 m!1309245))

(assert (=> b!1418211 m!1309245))

(declare-fun m!1309247 () Bool)

(assert (=> b!1418211 m!1309247))

(assert (=> b!1418211 m!1309247))

(assert (=> b!1418211 m!1309245))

(declare-fun m!1309249 () Bool)

(assert (=> b!1418211 m!1309249))

(declare-fun m!1309251 () Bool)

(assert (=> b!1418210 m!1309251))

(assert (=> b!1418210 m!1309251))

(declare-fun m!1309253 () Bool)

(assert (=> b!1418210 m!1309253))

(push 1)

(assert (not b!1418214))

(assert (not b!1418213))

(assert (not start!122304))

(assert (not b!1418216))

(assert (not b!1418210))

(assert (not b!1418215))

(assert (not b!1418211))

(assert (not b!1418212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

