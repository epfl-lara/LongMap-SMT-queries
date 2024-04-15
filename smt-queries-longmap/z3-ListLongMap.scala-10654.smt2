; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125032 () Bool)

(assert start!125032)

(declare-fun b!1455495 () Bool)

(declare-fun res!986237 () Bool)

(declare-fun e!818983 () Bool)

(assert (=> b!1455495 (=> (not res!986237) (not e!818983))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455495 (= res!986237 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455496 () Bool)

(declare-fun e!818984 () Bool)

(assert (=> b!1455496 (= e!818983 (not e!818984))))

(declare-fun res!986236 () Bool)

(assert (=> b!1455496 (=> res!986236 e!818984)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98458 0))(
  ( (array!98459 (arr!47518 (Array (_ BitVec 32) (_ BitVec 64))) (size!48070 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98458)

(assert (=> b!1455496 (= res!986236 (or (and (= (select (arr!47518 a!2862) index!646) (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47518 a!2862) index!646) (select (arr!47518 a!2862) j!93))) (= (select (arr!47518 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818976 () Bool)

(assert (=> b!1455496 e!818976))

(declare-fun res!986235 () Bool)

(assert (=> b!1455496 (=> (not res!986235) (not e!818976))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98458 (_ BitVec 32)) Bool)

(assert (=> b!1455496 (= res!986235 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48927 0))(
  ( (Unit!48928) )
))
(declare-fun lt!637809 () Unit!48927)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48927)

(assert (=> b!1455496 (= lt!637809 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455497 () Bool)

(declare-fun e!818979 () Bool)

(assert (=> b!1455497 (= e!818979 true)))

(declare-fun lt!637813 () Bool)

(declare-fun e!818977 () Bool)

(assert (=> b!1455497 (= lt!637813 e!818977)))

(declare-fun c!134145 () Bool)

(assert (=> b!1455497 (= c!134145 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455498 () Bool)

(declare-fun e!818981 () Bool)

(declare-fun e!818985 () Bool)

(assert (=> b!1455498 (= e!818981 e!818985)))

(declare-fun res!986234 () Bool)

(assert (=> b!1455498 (=> (not res!986234) (not e!818985))))

(assert (=> b!1455498 (= res!986234 (= (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637812 () array!98458)

(assert (=> b!1455498 (= lt!637812 (array!98459 (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48070 a!2862)))))

(declare-fun b!1455499 () Bool)

(declare-fun e!818978 () Bool)

(assert (=> b!1455499 (= e!818985 e!818978)))

(declare-fun res!986244 () Bool)

(assert (=> b!1455499 (=> (not res!986244) (not e!818978))))

(declare-datatypes ((SeekEntryResult!11795 0))(
  ( (MissingZero!11795 (index!49572 (_ BitVec 32))) (Found!11795 (index!49573 (_ BitVec 32))) (Intermediate!11795 (undefined!12607 Bool) (index!49574 (_ BitVec 32)) (x!131199 (_ BitVec 32))) (Undefined!11795) (MissingVacant!11795 (index!49575 (_ BitVec 32))) )
))
(declare-fun lt!637815 () SeekEntryResult!11795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98458 (_ BitVec 32)) SeekEntryResult!11795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455499 (= res!986244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47518 a!2862) j!93) mask!2687) (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637815))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1455499 (= lt!637815 (Intermediate!11795 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455500 () Bool)

(assert (=> b!1455500 (= e!818978 e!818983)))

(declare-fun res!986246 () Bool)

(assert (=> b!1455500 (=> (not res!986246) (not e!818983))))

(declare-fun lt!637811 () SeekEntryResult!11795)

(assert (=> b!1455500 (= res!986246 (= lt!637811 (Intermediate!11795 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637810 () (_ BitVec 64))

(assert (=> b!1455500 (= lt!637811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637810 mask!2687) lt!637810 lt!637812 mask!2687))))

(assert (=> b!1455500 (= lt!637810 (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455501 () Bool)

(declare-fun res!986242 () Bool)

(assert (=> b!1455501 (=> (not res!986242) (not e!818981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455501 (= res!986242 (validKeyInArray!0 (select (arr!47518 a!2862) j!93)))))

(declare-fun b!1455502 () Bool)

(declare-fun e!818982 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98458 (_ BitVec 32)) SeekEntryResult!11795)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98458 (_ BitVec 32)) SeekEntryResult!11795)

(assert (=> b!1455502 (= e!818982 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637810 lt!637812 mask!2687) (seekEntryOrOpen!0 lt!637810 lt!637812 mask!2687)))))

(declare-fun b!1455503 () Bool)

(declare-fun res!986239 () Bool)

(assert (=> b!1455503 (=> (not res!986239) (not e!818981))))

(assert (=> b!1455503 (= res!986239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455504 () Bool)

(declare-fun res!986232 () Bool)

(assert (=> b!1455504 (=> (not res!986232) (not e!818976))))

(assert (=> b!1455504 (= res!986232 (= (seekEntryOrOpen!0 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) (Found!11795 j!93)))))

(declare-fun b!1455505 () Bool)

(declare-fun res!986243 () Bool)

(assert (=> b!1455505 (=> (not res!986243) (not e!818981))))

(assert (=> b!1455505 (= res!986243 (and (= (size!48070 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48070 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48070 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455506 () Bool)

(declare-fun res!986231 () Bool)

(assert (=> b!1455506 (=> (not res!986231) (not e!818981))))

(declare-datatypes ((List!34097 0))(
  ( (Nil!34094) (Cons!34093 (h!35443 (_ BitVec 64)) (t!48783 List!34097)) )
))
(declare-fun arrayNoDuplicates!0 (array!98458 (_ BitVec 32) List!34097) Bool)

(assert (=> b!1455506 (= res!986231 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34094))))

(declare-fun res!986248 () Bool)

(assert (=> start!125032 (=> (not res!986248) (not e!818981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125032 (= res!986248 (validMask!0 mask!2687))))

(assert (=> start!125032 e!818981))

(assert (=> start!125032 true))

(declare-fun array_inv!36751 (array!98458) Bool)

(assert (=> start!125032 (array_inv!36751 a!2862)))

(declare-fun lt!637808 () SeekEntryResult!11795)

(declare-fun lt!637814 () (_ BitVec 32))

(declare-fun b!1455507 () Bool)

(assert (=> b!1455507 (= e!818977 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637814 intermediateAfterIndex!19 lt!637810 lt!637812 mask!2687) lt!637808)))))

(declare-fun b!1455508 () Bool)

(declare-fun res!986238 () Bool)

(assert (=> b!1455508 (=> (not res!986238) (not e!818981))))

(assert (=> b!1455508 (= res!986238 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48070 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48070 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48070 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455509 () Bool)

(assert (=> b!1455509 (= e!818982 (= lt!637811 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637810 lt!637812 mask!2687)))))

(declare-fun b!1455510 () Bool)

(assert (=> b!1455510 (= e!818977 (not (= lt!637811 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637814 lt!637810 lt!637812 mask!2687))))))

(declare-fun b!1455511 () Bool)

(declare-fun res!986247 () Bool)

(assert (=> b!1455511 (=> (not res!986247) (not e!818983))))

(assert (=> b!1455511 (= res!986247 e!818982)))

(declare-fun c!134146 () Bool)

(assert (=> b!1455511 (= c!134146 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455512 () Bool)

(assert (=> b!1455512 (= e!818984 e!818979)))

(declare-fun res!986245 () Bool)

(assert (=> b!1455512 (=> res!986245 e!818979)))

(assert (=> b!1455512 (= res!986245 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637814 #b00000000000000000000000000000000) (bvsge lt!637814 (size!48070 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455512 (= lt!637814 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455512 (= lt!637808 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637810 lt!637812 mask!2687))))

(assert (=> b!1455512 (= lt!637808 (seekEntryOrOpen!0 lt!637810 lt!637812 mask!2687))))

(declare-fun b!1455513 () Bool)

(declare-fun res!986241 () Bool)

(assert (=> b!1455513 (=> (not res!986241) (not e!818981))))

(assert (=> b!1455513 (= res!986241 (validKeyInArray!0 (select (arr!47518 a!2862) i!1006)))))

(declare-fun b!1455514 () Bool)

(assert (=> b!1455514 (= e!818976 (and (or (= (select (arr!47518 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47518 a!2862) intermediateBeforeIndex!19) (select (arr!47518 a!2862) j!93))) (let ((bdg!53179 (select (store (arr!47518 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47518 a!2862) index!646) bdg!53179) (= (select (arr!47518 a!2862) index!646) (select (arr!47518 a!2862) j!93))) (= (select (arr!47518 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53179 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455515 () Bool)

(declare-fun res!986240 () Bool)

(assert (=> b!1455515 (=> (not res!986240) (not e!818978))))

(assert (=> b!1455515 (= res!986240 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637815))))

(declare-fun b!1455516 () Bool)

(declare-fun res!986233 () Bool)

(assert (=> b!1455516 (=> res!986233 e!818979)))

(assert (=> b!1455516 (= res!986233 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637814 (select (arr!47518 a!2862) j!93) a!2862 mask!2687) lt!637815)))))

(assert (= (and start!125032 res!986248) b!1455505))

(assert (= (and b!1455505 res!986243) b!1455513))

(assert (= (and b!1455513 res!986241) b!1455501))

(assert (= (and b!1455501 res!986242) b!1455503))

(assert (= (and b!1455503 res!986239) b!1455506))

(assert (= (and b!1455506 res!986231) b!1455508))

(assert (= (and b!1455508 res!986238) b!1455498))

(assert (= (and b!1455498 res!986234) b!1455499))

(assert (= (and b!1455499 res!986244) b!1455515))

(assert (= (and b!1455515 res!986240) b!1455500))

(assert (= (and b!1455500 res!986246) b!1455511))

(assert (= (and b!1455511 c!134146) b!1455509))

(assert (= (and b!1455511 (not c!134146)) b!1455502))

(assert (= (and b!1455511 res!986247) b!1455495))

(assert (= (and b!1455495 res!986237) b!1455496))

(assert (= (and b!1455496 res!986235) b!1455504))

(assert (= (and b!1455504 res!986232) b!1455514))

(assert (= (and b!1455496 (not res!986236)) b!1455512))

(assert (= (and b!1455512 (not res!986245)) b!1455516))

(assert (= (and b!1455516 (not res!986233)) b!1455497))

(assert (= (and b!1455497 c!134145) b!1455510))

(assert (= (and b!1455497 (not c!134145)) b!1455507))

(declare-fun m!1343205 () Bool)

(assert (=> b!1455500 m!1343205))

(assert (=> b!1455500 m!1343205))

(declare-fun m!1343207 () Bool)

(assert (=> b!1455500 m!1343207))

(declare-fun m!1343209 () Bool)

(assert (=> b!1455500 m!1343209))

(declare-fun m!1343211 () Bool)

(assert (=> b!1455500 m!1343211))

(assert (=> b!1455514 m!1343209))

(declare-fun m!1343213 () Bool)

(assert (=> b!1455514 m!1343213))

(declare-fun m!1343215 () Bool)

(assert (=> b!1455514 m!1343215))

(declare-fun m!1343217 () Bool)

(assert (=> b!1455514 m!1343217))

(declare-fun m!1343219 () Bool)

(assert (=> b!1455514 m!1343219))

(declare-fun m!1343221 () Bool)

(assert (=> b!1455509 m!1343221))

(assert (=> b!1455515 m!1343219))

(assert (=> b!1455515 m!1343219))

(declare-fun m!1343223 () Bool)

(assert (=> b!1455515 m!1343223))

(declare-fun m!1343225 () Bool)

(assert (=> b!1455512 m!1343225))

(declare-fun m!1343227 () Bool)

(assert (=> b!1455512 m!1343227))

(declare-fun m!1343229 () Bool)

(assert (=> b!1455512 m!1343229))

(declare-fun m!1343231 () Bool)

(assert (=> b!1455503 m!1343231))

(declare-fun m!1343233 () Bool)

(assert (=> start!125032 m!1343233))

(declare-fun m!1343235 () Bool)

(assert (=> start!125032 m!1343235))

(assert (=> b!1455499 m!1343219))

(assert (=> b!1455499 m!1343219))

(declare-fun m!1343237 () Bool)

(assert (=> b!1455499 m!1343237))

(assert (=> b!1455499 m!1343237))

(assert (=> b!1455499 m!1343219))

(declare-fun m!1343239 () Bool)

(assert (=> b!1455499 m!1343239))

(declare-fun m!1343241 () Bool)

(assert (=> b!1455513 m!1343241))

(assert (=> b!1455513 m!1343241))

(declare-fun m!1343243 () Bool)

(assert (=> b!1455513 m!1343243))

(assert (=> b!1455516 m!1343219))

(assert (=> b!1455516 m!1343219))

(declare-fun m!1343245 () Bool)

(assert (=> b!1455516 m!1343245))

(assert (=> b!1455498 m!1343209))

(declare-fun m!1343247 () Bool)

(assert (=> b!1455498 m!1343247))

(assert (=> b!1455504 m!1343219))

(assert (=> b!1455504 m!1343219))

(declare-fun m!1343249 () Bool)

(assert (=> b!1455504 m!1343249))

(declare-fun m!1343251 () Bool)

(assert (=> b!1455510 m!1343251))

(assert (=> b!1455502 m!1343227))

(assert (=> b!1455502 m!1343229))

(declare-fun m!1343253 () Bool)

(assert (=> b!1455507 m!1343253))

(assert (=> b!1455501 m!1343219))

(assert (=> b!1455501 m!1343219))

(declare-fun m!1343255 () Bool)

(assert (=> b!1455501 m!1343255))

(declare-fun m!1343257 () Bool)

(assert (=> b!1455496 m!1343257))

(assert (=> b!1455496 m!1343209))

(assert (=> b!1455496 m!1343215))

(assert (=> b!1455496 m!1343217))

(declare-fun m!1343259 () Bool)

(assert (=> b!1455496 m!1343259))

(assert (=> b!1455496 m!1343219))

(declare-fun m!1343261 () Bool)

(assert (=> b!1455506 m!1343261))

(check-sat (not b!1455502) (not b!1455516) (not b!1455500) (not b!1455496) (not b!1455510) (not b!1455499) (not b!1455513) (not b!1455512) (not b!1455506) (not b!1455501) (not b!1455507) (not b!1455503) (not b!1455504) (not start!125032) (not b!1455509) (not b!1455515))
(check-sat)
