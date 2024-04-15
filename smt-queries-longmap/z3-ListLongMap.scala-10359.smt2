; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121964 () Bool)

(assert start!121964)

(declare-fun b!1415403 () Bool)

(declare-fun e!801087 () Bool)

(declare-fun e!801089 () Bool)

(assert (=> b!1415403 (= e!801087 (not e!801089))))

(declare-fun res!951502 () Bool)

(assert (=> b!1415403 (=> res!951502 e!801089)))

(declare-datatypes ((SeekEntryResult!10970 0))(
  ( (MissingZero!10970 (index!46272 (_ BitVec 32))) (Found!10970 (index!46273 (_ BitVec 32))) (Intermediate!10970 (undefined!11782 Bool) (index!46274 (_ BitVec 32)) (x!127878 (_ BitVec 32))) (Undefined!10970) (MissingVacant!10970 (index!46275 (_ BitVec 32))) )
))
(declare-fun lt!623984 () SeekEntryResult!10970)

(get-info :version)

(assert (=> b!1415403 (= res!951502 (or (not ((_ is Intermediate!10970) lt!623984)) (undefined!11782 lt!623984)))))

(declare-fun e!801084 () Bool)

(assert (=> b!1415403 e!801084))

(declare-fun res!951500 () Bool)

(assert (=> b!1415403 (=> (not res!951500) (not e!801084))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96603 0))(
  ( (array!96604 (arr!46633 (Array (_ BitVec 32) (_ BitVec 64))) (size!47185 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96603)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96603 (_ BitVec 32)) Bool)

(assert (=> b!1415403 (= res!951500 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47757 0))(
  ( (Unit!47758) )
))
(declare-fun lt!623987 () Unit!47757)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47757)

(assert (=> b!1415403 (= lt!623987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!623989 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96603 (_ BitVec 32)) SeekEntryResult!10970)

(assert (=> b!1415403 (= lt!623984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623989 (select (arr!46633 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415403 (= lt!623989 (toIndex!0 (select (arr!46633 a!2901) j!112) mask!2840))))

(declare-fun b!1415404 () Bool)

(declare-fun e!801088 () Bool)

(assert (=> b!1415404 (= e!801089 e!801088)))

(declare-fun res!951498 () Bool)

(assert (=> b!1415404 (=> res!951498 e!801088)))

(declare-fun lt!623990 () SeekEntryResult!10970)

(assert (=> b!1415404 (= res!951498 (or (= lt!623984 lt!623990) (not ((_ is Intermediate!10970) lt!623990))))))

(declare-fun lt!623988 () (_ BitVec 64))

(declare-fun lt!623986 () array!96603)

(assert (=> b!1415404 (= lt!623990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623988 mask!2840) lt!623988 lt!623986 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415404 (= lt!623988 (select (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415404 (= lt!623986 (array!96604 (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47185 a!2901)))))

(declare-fun b!1415405 () Bool)

(declare-fun res!951505 () Bool)

(assert (=> b!1415405 (=> (not res!951505) (not e!801087))))

(assert (=> b!1415405 (= res!951505 (and (= (size!47185 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47185 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47185 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415406 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96603 (_ BitVec 32)) SeekEntryResult!10970)

(assert (=> b!1415406 (= e!801084 (= (seekEntryOrOpen!0 (select (arr!46633 a!2901) j!112) a!2901 mask!2840) (Found!10970 j!112)))))

(declare-fun b!1415407 () Bool)

(declare-fun res!951503 () Bool)

(assert (=> b!1415407 (=> (not res!951503) (not e!801087))))

(declare-datatypes ((List!33230 0))(
  ( (Nil!33227) (Cons!33226 (h!34513 (_ BitVec 64)) (t!47916 List!33230)) )
))
(declare-fun arrayNoDuplicates!0 (array!96603 (_ BitVec 32) List!33230) Bool)

(assert (=> b!1415407 (= res!951503 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33227))))

(declare-fun b!1415408 () Bool)

(declare-fun res!951501 () Bool)

(assert (=> b!1415408 (=> (not res!951501) (not e!801087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415408 (= res!951501 (validKeyInArray!0 (select (arr!46633 a!2901) j!112)))))

(declare-fun e!801085 () Bool)

(declare-fun b!1415409 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96603 (_ BitVec 32)) SeekEntryResult!10970)

(assert (=> b!1415409 (= e!801085 (= (seekEntryOrOpen!0 lt!623988 lt!623986 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127878 lt!623990) (index!46274 lt!623990) (index!46274 lt!623990) (select (arr!46633 a!2901) j!112) lt!623986 mask!2840)))))

(declare-fun res!951497 () Bool)

(assert (=> start!121964 (=> (not res!951497) (not e!801087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121964 (= res!951497 (validMask!0 mask!2840))))

(assert (=> start!121964 e!801087))

(assert (=> start!121964 true))

(declare-fun array_inv!35866 (array!96603) Bool)

(assert (=> start!121964 (array_inv!35866 a!2901)))

(declare-fun b!1415410 () Bool)

(assert (=> b!1415410 (= e!801088 true)))

(assert (=> b!1415410 e!801085))

(declare-fun res!951499 () Bool)

(assert (=> b!1415410 (=> (not res!951499) (not e!801085))))

(assert (=> b!1415410 (= res!951499 (and (not (undefined!11782 lt!623990)) (= (index!46274 lt!623990) i!1037) (bvslt (x!127878 lt!623990) (x!127878 lt!623984)) (= (select (store (arr!46633 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46274 lt!623990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623985 () Unit!47757)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47757)

(assert (=> b!1415410 (= lt!623985 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623989 (x!127878 lt!623984) (index!46274 lt!623984) (x!127878 lt!623990) (index!46274 lt!623990) (undefined!11782 lt!623990) mask!2840))))

(declare-fun b!1415411 () Bool)

(declare-fun res!951504 () Bool)

(assert (=> b!1415411 (=> (not res!951504) (not e!801087))))

(assert (=> b!1415411 (= res!951504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415412 () Bool)

(declare-fun res!951496 () Bool)

(assert (=> b!1415412 (=> (not res!951496) (not e!801087))))

(assert (=> b!1415412 (= res!951496 (validKeyInArray!0 (select (arr!46633 a!2901) i!1037)))))

(assert (= (and start!121964 res!951497) b!1415405))

(assert (= (and b!1415405 res!951505) b!1415412))

(assert (= (and b!1415412 res!951496) b!1415408))

(assert (= (and b!1415408 res!951501) b!1415411))

(assert (= (and b!1415411 res!951504) b!1415407))

(assert (= (and b!1415407 res!951503) b!1415403))

(assert (= (and b!1415403 res!951500) b!1415406))

(assert (= (and b!1415403 (not res!951502)) b!1415404))

(assert (= (and b!1415404 (not res!951498)) b!1415410))

(assert (= (and b!1415410 res!951499) b!1415409))

(declare-fun m!1305247 () Bool)

(assert (=> b!1415411 m!1305247))

(declare-fun m!1305249 () Bool)

(assert (=> b!1415403 m!1305249))

(declare-fun m!1305251 () Bool)

(assert (=> b!1415403 m!1305251))

(assert (=> b!1415403 m!1305249))

(declare-fun m!1305253 () Bool)

(assert (=> b!1415403 m!1305253))

(assert (=> b!1415403 m!1305249))

(declare-fun m!1305255 () Bool)

(assert (=> b!1415403 m!1305255))

(declare-fun m!1305257 () Bool)

(assert (=> b!1415403 m!1305257))

(declare-fun m!1305259 () Bool)

(assert (=> start!121964 m!1305259))

(declare-fun m!1305261 () Bool)

(assert (=> start!121964 m!1305261))

(declare-fun m!1305263 () Bool)

(assert (=> b!1415412 m!1305263))

(assert (=> b!1415412 m!1305263))

(declare-fun m!1305265 () Bool)

(assert (=> b!1415412 m!1305265))

(declare-fun m!1305267 () Bool)

(assert (=> b!1415410 m!1305267))

(declare-fun m!1305269 () Bool)

(assert (=> b!1415410 m!1305269))

(declare-fun m!1305271 () Bool)

(assert (=> b!1415410 m!1305271))

(declare-fun m!1305273 () Bool)

(assert (=> b!1415407 m!1305273))

(assert (=> b!1415408 m!1305249))

(assert (=> b!1415408 m!1305249))

(declare-fun m!1305275 () Bool)

(assert (=> b!1415408 m!1305275))

(assert (=> b!1415406 m!1305249))

(assert (=> b!1415406 m!1305249))

(declare-fun m!1305277 () Bool)

(assert (=> b!1415406 m!1305277))

(declare-fun m!1305279 () Bool)

(assert (=> b!1415404 m!1305279))

(assert (=> b!1415404 m!1305279))

(declare-fun m!1305281 () Bool)

(assert (=> b!1415404 m!1305281))

(assert (=> b!1415404 m!1305267))

(declare-fun m!1305283 () Bool)

(assert (=> b!1415404 m!1305283))

(declare-fun m!1305285 () Bool)

(assert (=> b!1415409 m!1305285))

(assert (=> b!1415409 m!1305249))

(assert (=> b!1415409 m!1305249))

(declare-fun m!1305287 () Bool)

(assert (=> b!1415409 m!1305287))

(check-sat (not b!1415412) (not b!1415407) (not b!1415409) (not b!1415411) (not b!1415408) (not b!1415404) (not b!1415403) (not b!1415410) (not b!1415406) (not start!121964))
(check-sat)
