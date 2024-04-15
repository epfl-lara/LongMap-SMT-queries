; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126172 () Bool)

(assert start!126172)

(declare-fun b!1478239 () Bool)

(declare-fun res!1004371 () Bool)

(declare-fun e!829226 () Bool)

(assert (=> b!1478239 (=> (not res!1004371) (not e!829226))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99256 0))(
  ( (array!99257 (arr!47908 (Array (_ BitVec 32) (_ BitVec 64))) (size!48460 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99256)

(assert (=> b!1478239 (= res!1004371 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48460 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48460 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48460 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478240 () Bool)

(declare-fun e!829227 () Bool)

(declare-fun e!829231 () Bool)

(assert (=> b!1478240 (= e!829227 e!829231)))

(declare-fun res!1004386 () Bool)

(assert (=> b!1478240 (=> res!1004386 e!829231)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478240 (= res!1004386 (or (and (= (select (arr!47908 a!2862) index!646) (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47908 a!2862) index!646) (select (arr!47908 a!2862) j!93))) (not (= (select (arr!47908 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478241 () Bool)

(declare-fun e!829230 () Bool)

(assert (=> b!1478241 (= e!829231 e!829230)))

(declare-fun res!1004377 () Bool)

(assert (=> b!1478241 (=> (not res!1004377) (not e!829230))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12173 0))(
  ( (MissingZero!12173 (index!51084 (_ BitVec 32))) (Found!12173 (index!51085 (_ BitVec 32))) (Intermediate!12173 (undefined!12985 Bool) (index!51086 (_ BitVec 32)) (x!132671 (_ BitVec 32))) (Undefined!12173) (MissingVacant!12173 (index!51087 (_ BitVec 32))) )
))
(declare-fun lt!645448 () SeekEntryResult!12173)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12173)

(assert (=> b!1478241 (= res!1004377 (= lt!645448 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47908 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478242 () Bool)

(declare-fun res!1004379 () Bool)

(assert (=> b!1478242 (=> (not res!1004379) (not e!829226))))

(declare-datatypes ((List!34487 0))(
  ( (Nil!34484) (Cons!34483 (h!35851 (_ BitVec 64)) (t!49173 List!34487)) )
))
(declare-fun arrayNoDuplicates!0 (array!99256 (_ BitVec 32) List!34487) Bool)

(assert (=> b!1478242 (= res!1004379 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34484))))

(declare-fun b!1478244 () Bool)

(declare-fun res!1004375 () Bool)

(assert (=> b!1478244 (=> (not res!1004375) (not e!829226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478244 (= res!1004375 (validKeyInArray!0 (select (arr!47908 a!2862) j!93)))))

(declare-fun b!1478245 () Bool)

(declare-fun e!829225 () Bool)

(declare-fun e!829232 () Bool)

(assert (=> b!1478245 (= e!829225 e!829232)))

(declare-fun res!1004385 () Bool)

(assert (=> b!1478245 (=> (not res!1004385) (not e!829232))))

(declare-fun lt!645446 () SeekEntryResult!12173)

(assert (=> b!1478245 (= res!1004385 (= lt!645446 (Intermediate!12173 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645449 () (_ BitVec 64))

(declare-fun lt!645447 () array!99256)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478245 (= lt!645446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645449 mask!2687) lt!645449 lt!645447 mask!2687))))

(assert (=> b!1478245 (= lt!645449 (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478246 () Bool)

(declare-fun e!829233 () Bool)

(assert (=> b!1478246 (= e!829226 e!829233)))

(declare-fun res!1004380 () Bool)

(assert (=> b!1478246 (=> (not res!1004380) (not e!829233))))

(assert (=> b!1478246 (= res!1004380 (= (select (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478246 (= lt!645447 (array!99257 (store (arr!47908 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48460 a!2862)))))

(declare-fun b!1478247 () Bool)

(assert (=> b!1478247 (= e!829230 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun e!829229 () Bool)

(declare-fun b!1478248 () Bool)

(assert (=> b!1478248 (= e!829229 (= lt!645446 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645449 lt!645447 mask!2687)))))

(declare-fun b!1478249 () Bool)

(assert (=> b!1478249 (= e!829233 e!829225)))

(declare-fun res!1004384 () Bool)

(assert (=> b!1478249 (=> (not res!1004384) (not e!829225))))

(declare-fun lt!645445 () SeekEntryResult!12173)

(assert (=> b!1478249 (= res!1004384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47908 a!2862) j!93) mask!2687) (select (arr!47908 a!2862) j!93) a!2862 mask!2687) lt!645445))))

(assert (=> b!1478249 (= lt!645445 (Intermediate!12173 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478250 () Bool)

(assert (=> b!1478250 (= e!829232 (not true))))

(assert (=> b!1478250 e!829227))

(declare-fun res!1004372 () Bool)

(assert (=> b!1478250 (=> (not res!1004372) (not e!829227))))

(assert (=> b!1478250 (= res!1004372 (and (= lt!645448 (Found!12173 j!93)) (or (= (select (arr!47908 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47908 a!2862) intermediateBeforeIndex!19) (select (arr!47908 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99256 (_ BitVec 32)) SeekEntryResult!12173)

(assert (=> b!1478250 (= lt!645448 (seekEntryOrOpen!0 (select (arr!47908 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99256 (_ BitVec 32)) Bool)

(assert (=> b!1478250 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49527 0))(
  ( (Unit!49528) )
))
(declare-fun lt!645450 () Unit!49527)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49527)

(assert (=> b!1478250 (= lt!645450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478251 () Bool)

(declare-fun res!1004381 () Bool)

(assert (=> b!1478251 (=> (not res!1004381) (not e!829226))))

(assert (=> b!1478251 (= res!1004381 (and (= (size!48460 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48460 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48460 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1004374 () Bool)

(assert (=> start!126172 (=> (not res!1004374) (not e!829226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126172 (= res!1004374 (validMask!0 mask!2687))))

(assert (=> start!126172 e!829226))

(assert (=> start!126172 true))

(declare-fun array_inv!37141 (array!99256) Bool)

(assert (=> start!126172 (array_inv!37141 a!2862)))

(declare-fun b!1478243 () Bool)

(declare-fun res!1004382 () Bool)

(assert (=> b!1478243 (=> (not res!1004382) (not e!829225))))

(assert (=> b!1478243 (= res!1004382 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47908 a!2862) j!93) a!2862 mask!2687) lt!645445))))

(declare-fun b!1478252 () Bool)

(declare-fun res!1004378 () Bool)

(assert (=> b!1478252 (=> (not res!1004378) (not e!829226))))

(assert (=> b!1478252 (= res!1004378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478253 () Bool)

(declare-fun res!1004383 () Bool)

(assert (=> b!1478253 (=> (not res!1004383) (not e!829232))))

(assert (=> b!1478253 (= res!1004383 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478254 () Bool)

(declare-fun res!1004376 () Bool)

(assert (=> b!1478254 (=> (not res!1004376) (not e!829226))))

(assert (=> b!1478254 (= res!1004376 (validKeyInArray!0 (select (arr!47908 a!2862) i!1006)))))

(declare-fun b!1478255 () Bool)

(assert (=> b!1478255 (= e!829229 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645449 lt!645447 mask!2687) (seekEntryOrOpen!0 lt!645449 lt!645447 mask!2687)))))

(declare-fun b!1478256 () Bool)

(declare-fun res!1004373 () Bool)

(assert (=> b!1478256 (=> (not res!1004373) (not e!829232))))

(assert (=> b!1478256 (= res!1004373 e!829229)))

(declare-fun c!136456 () Bool)

(assert (=> b!1478256 (= c!136456 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126172 res!1004374) b!1478251))

(assert (= (and b!1478251 res!1004381) b!1478254))

(assert (= (and b!1478254 res!1004376) b!1478244))

(assert (= (and b!1478244 res!1004375) b!1478252))

(assert (= (and b!1478252 res!1004378) b!1478242))

(assert (= (and b!1478242 res!1004379) b!1478239))

(assert (= (and b!1478239 res!1004371) b!1478246))

(assert (= (and b!1478246 res!1004380) b!1478249))

(assert (= (and b!1478249 res!1004384) b!1478243))

(assert (= (and b!1478243 res!1004382) b!1478245))

(assert (= (and b!1478245 res!1004385) b!1478256))

(assert (= (and b!1478256 c!136456) b!1478248))

(assert (= (and b!1478256 (not c!136456)) b!1478255))

(assert (= (and b!1478256 res!1004373) b!1478253))

(assert (= (and b!1478253 res!1004383) b!1478250))

(assert (= (and b!1478250 res!1004372) b!1478240))

(assert (= (and b!1478240 (not res!1004386)) b!1478241))

(assert (= (and b!1478241 res!1004377) b!1478247))

(declare-fun m!1363671 () Bool)

(assert (=> b!1478246 m!1363671))

(declare-fun m!1363673 () Bool)

(assert (=> b!1478246 m!1363673))

(declare-fun m!1363675 () Bool)

(assert (=> b!1478249 m!1363675))

(assert (=> b!1478249 m!1363675))

(declare-fun m!1363677 () Bool)

(assert (=> b!1478249 m!1363677))

(assert (=> b!1478249 m!1363677))

(assert (=> b!1478249 m!1363675))

(declare-fun m!1363679 () Bool)

(assert (=> b!1478249 m!1363679))

(declare-fun m!1363681 () Bool)

(assert (=> b!1478245 m!1363681))

(assert (=> b!1478245 m!1363681))

(declare-fun m!1363683 () Bool)

(assert (=> b!1478245 m!1363683))

(assert (=> b!1478245 m!1363671))

(declare-fun m!1363685 () Bool)

(assert (=> b!1478245 m!1363685))

(declare-fun m!1363687 () Bool)

(assert (=> b!1478248 m!1363687))

(declare-fun m!1363689 () Bool)

(assert (=> b!1478242 m!1363689))

(declare-fun m!1363691 () Bool)

(assert (=> start!126172 m!1363691))

(declare-fun m!1363693 () Bool)

(assert (=> start!126172 m!1363693))

(assert (=> b!1478244 m!1363675))

(assert (=> b!1478244 m!1363675))

(declare-fun m!1363695 () Bool)

(assert (=> b!1478244 m!1363695))

(declare-fun m!1363697 () Bool)

(assert (=> b!1478252 m!1363697))

(assert (=> b!1478241 m!1363675))

(assert (=> b!1478241 m!1363675))

(declare-fun m!1363699 () Bool)

(assert (=> b!1478241 m!1363699))

(declare-fun m!1363701 () Bool)

(assert (=> b!1478254 m!1363701))

(assert (=> b!1478254 m!1363701))

(declare-fun m!1363703 () Bool)

(assert (=> b!1478254 m!1363703))

(declare-fun m!1363705 () Bool)

(assert (=> b!1478255 m!1363705))

(declare-fun m!1363707 () Bool)

(assert (=> b!1478255 m!1363707))

(declare-fun m!1363709 () Bool)

(assert (=> b!1478250 m!1363709))

(declare-fun m!1363711 () Bool)

(assert (=> b!1478250 m!1363711))

(assert (=> b!1478250 m!1363675))

(declare-fun m!1363713 () Bool)

(assert (=> b!1478250 m!1363713))

(declare-fun m!1363715 () Bool)

(assert (=> b!1478250 m!1363715))

(assert (=> b!1478250 m!1363675))

(assert (=> b!1478243 m!1363675))

(assert (=> b!1478243 m!1363675))

(declare-fun m!1363717 () Bool)

(assert (=> b!1478243 m!1363717))

(declare-fun m!1363719 () Bool)

(assert (=> b!1478240 m!1363719))

(assert (=> b!1478240 m!1363671))

(declare-fun m!1363721 () Bool)

(assert (=> b!1478240 m!1363721))

(assert (=> b!1478240 m!1363675))

(check-sat (not b!1478249) (not b!1478242) (not b!1478255) (not start!126172) (not b!1478244) (not b!1478248) (not b!1478243) (not b!1478250) (not b!1478252) (not b!1478245) (not b!1478254) (not b!1478241))
(check-sat)
