; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124600 () Bool)

(assert start!124600)

(declare-fun b!1443281 () Bool)

(declare-fun res!975500 () Bool)

(declare-fun e!813301 () Bool)

(assert (=> b!1443281 (=> (not res!975500) (not e!813301))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11579 0))(
  ( (MissingZero!11579 (index!48708 (_ BitVec 32))) (Found!11579 (index!48709 (_ BitVec 32))) (Intermediate!11579 (undefined!12391 Bool) (index!48710 (_ BitVec 32)) (x!130407 (_ BitVec 32))) (Undefined!11579) (MissingVacant!11579 (index!48711 (_ BitVec 32))) )
))
(declare-fun lt!633637 () SeekEntryResult!11579)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98026 0))(
  ( (array!98027 (arr!47302 (Array (_ BitVec 32) (_ BitVec 64))) (size!47854 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98026)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98026 (_ BitVec 32)) SeekEntryResult!11579)

(assert (=> b!1443281 (= res!975500 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47302 a!2862) j!93) a!2862 mask!2687) lt!633637))))

(declare-fun b!1443282 () Bool)

(declare-fun res!975505 () Bool)

(declare-fun e!813300 () Bool)

(assert (=> b!1443282 (=> res!975505 e!813300)))

(declare-fun lt!633638 () SeekEntryResult!11579)

(declare-fun lt!633642 () (_ BitVec 64))

(declare-fun lt!633640 () array!98026)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98026 (_ BitVec 32)) SeekEntryResult!11579)

(assert (=> b!1443282 (= res!975505 (not (= lt!633638 (seekEntryOrOpen!0 lt!633642 lt!633640 mask!2687))))))

(declare-fun b!1443283 () Bool)

(declare-fun res!975499 () Bool)

(declare-fun e!813305 () Bool)

(assert (=> b!1443283 (=> (not res!975499) (not e!813305))))

(declare-fun e!813302 () Bool)

(assert (=> b!1443283 (= res!975499 e!813302)))

(declare-fun c!133405 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443283 (= c!133405 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443285 () Bool)

(declare-fun res!975501 () Bool)

(declare-fun e!813304 () Bool)

(assert (=> b!1443285 (=> (not res!975501) (not e!813304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443285 (= res!975501 (validKeyInArray!0 (select (arr!47302 a!2862) j!93)))))

(declare-fun b!1443286 () Bool)

(declare-fun res!975506 () Bool)

(assert (=> b!1443286 (=> (not res!975506) (not e!813304))))

(declare-datatypes ((List!33881 0))(
  ( (Nil!33878) (Cons!33877 (h!35227 (_ BitVec 64)) (t!48567 List!33881)) )
))
(declare-fun arrayNoDuplicates!0 (array!98026 (_ BitVec 32) List!33881) Bool)

(assert (=> b!1443286 (= res!975506 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33878))))

(declare-fun b!1443287 () Bool)

(declare-fun e!813306 () Bool)

(assert (=> b!1443287 (= e!813304 e!813306)))

(declare-fun res!975509 () Bool)

(assert (=> b!1443287 (=> (not res!975509) (not e!813306))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443287 (= res!975509 (= (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443287 (= lt!633640 (array!98027 (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47854 a!2862)))))

(declare-fun b!1443288 () Bool)

(assert (=> b!1443288 (= e!813300 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1443289 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98026 (_ BitVec 32)) SeekEntryResult!11579)

(assert (=> b!1443289 (= e!813302 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633642 lt!633640 mask!2687) (seekEntryOrOpen!0 lt!633642 lt!633640 mask!2687)))))

(declare-fun b!1443290 () Bool)

(declare-fun res!975508 () Bool)

(assert (=> b!1443290 (=> (not res!975508) (not e!813304))))

(assert (=> b!1443290 (= res!975508 (validKeyInArray!0 (select (arr!47302 a!2862) i!1006)))))

(declare-fun b!1443284 () Bool)

(assert (=> b!1443284 (= e!813305 (not e!813300))))

(declare-fun res!975511 () Bool)

(assert (=> b!1443284 (=> res!975511 e!813300)))

(assert (=> b!1443284 (= res!975511 (or (not (= (select (arr!47302 a!2862) index!646) (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47302 a!2862) index!646) (select (arr!47302 a!2862) j!93)))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1443284 (and (= lt!633638 (Found!11579 j!93)) (or (= (select (arr!47302 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47302 a!2862) intermediateBeforeIndex!19) (select (arr!47302 a!2862) j!93))))))

(assert (=> b!1443284 (= lt!633638 (seekEntryOrOpen!0 (select (arr!47302 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98026 (_ BitVec 32)) Bool)

(assert (=> b!1443284 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48495 0))(
  ( (Unit!48496) )
))
(declare-fun lt!633641 () Unit!48495)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48495)

(assert (=> b!1443284 (= lt!633641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!975504 () Bool)

(assert (=> start!124600 (=> (not res!975504) (not e!813304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124600 (= res!975504 (validMask!0 mask!2687))))

(assert (=> start!124600 e!813304))

(assert (=> start!124600 true))

(declare-fun array_inv!36535 (array!98026) Bool)

(assert (=> start!124600 (array_inv!36535 a!2862)))

(declare-fun b!1443291 () Bool)

(declare-fun res!975502 () Bool)

(assert (=> b!1443291 (=> (not res!975502) (not e!813305))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443291 (= res!975502 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443292 () Bool)

(declare-fun res!975503 () Bool)

(assert (=> b!1443292 (=> (not res!975503) (not e!813304))))

(assert (=> b!1443292 (= res!975503 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47854 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47854 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47854 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443293 () Bool)

(declare-fun lt!633639 () SeekEntryResult!11579)

(assert (=> b!1443293 (= e!813302 (= lt!633639 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633642 lt!633640 mask!2687)))))

(declare-fun b!1443294 () Bool)

(declare-fun res!975507 () Bool)

(assert (=> b!1443294 (=> (not res!975507) (not e!813304))))

(assert (=> b!1443294 (= res!975507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443295 () Bool)

(declare-fun res!975498 () Bool)

(assert (=> b!1443295 (=> (not res!975498) (not e!813304))))

(assert (=> b!1443295 (= res!975498 (and (= (size!47854 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47854 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47854 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443296 () Bool)

(assert (=> b!1443296 (= e!813301 e!813305)))

(declare-fun res!975510 () Bool)

(assert (=> b!1443296 (=> (not res!975510) (not e!813305))))

(assert (=> b!1443296 (= res!975510 (= lt!633639 (Intermediate!11579 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443296 (= lt!633639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633642 mask!2687) lt!633642 lt!633640 mask!2687))))

(assert (=> b!1443296 (= lt!633642 (select (store (arr!47302 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443297 () Bool)

(assert (=> b!1443297 (= e!813306 e!813301)))

(declare-fun res!975497 () Bool)

(assert (=> b!1443297 (=> (not res!975497) (not e!813301))))

(assert (=> b!1443297 (= res!975497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47302 a!2862) j!93) mask!2687) (select (arr!47302 a!2862) j!93) a!2862 mask!2687) lt!633637))))

(assert (=> b!1443297 (= lt!633637 (Intermediate!11579 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124600 res!975504) b!1443295))

(assert (= (and b!1443295 res!975498) b!1443290))

(assert (= (and b!1443290 res!975508) b!1443285))

(assert (= (and b!1443285 res!975501) b!1443294))

(assert (= (and b!1443294 res!975507) b!1443286))

(assert (= (and b!1443286 res!975506) b!1443292))

(assert (= (and b!1443292 res!975503) b!1443287))

(assert (= (and b!1443287 res!975509) b!1443297))

(assert (= (and b!1443297 res!975497) b!1443281))

(assert (= (and b!1443281 res!975500) b!1443296))

(assert (= (and b!1443296 res!975510) b!1443283))

(assert (= (and b!1443283 c!133405) b!1443293))

(assert (= (and b!1443283 (not c!133405)) b!1443289))

(assert (= (and b!1443283 res!975499) b!1443291))

(assert (= (and b!1443291 res!975502) b!1443284))

(assert (= (and b!1443284 (not res!975511)) b!1443282))

(assert (= (and b!1443282 (not res!975505)) b!1443288))

(declare-fun m!1331877 () Bool)

(assert (=> b!1443296 m!1331877))

(assert (=> b!1443296 m!1331877))

(declare-fun m!1331879 () Bool)

(assert (=> b!1443296 m!1331879))

(declare-fun m!1331881 () Bool)

(assert (=> b!1443296 m!1331881))

(declare-fun m!1331883 () Bool)

(assert (=> b!1443296 m!1331883))

(declare-fun m!1331885 () Bool)

(assert (=> b!1443286 m!1331885))

(declare-fun m!1331887 () Bool)

(assert (=> start!124600 m!1331887))

(declare-fun m!1331889 () Bool)

(assert (=> start!124600 m!1331889))

(declare-fun m!1331891 () Bool)

(assert (=> b!1443290 m!1331891))

(assert (=> b!1443290 m!1331891))

(declare-fun m!1331893 () Bool)

(assert (=> b!1443290 m!1331893))

(declare-fun m!1331895 () Bool)

(assert (=> b!1443293 m!1331895))

(declare-fun m!1331897 () Bool)

(assert (=> b!1443281 m!1331897))

(assert (=> b!1443281 m!1331897))

(declare-fun m!1331899 () Bool)

(assert (=> b!1443281 m!1331899))

(assert (=> b!1443297 m!1331897))

(assert (=> b!1443297 m!1331897))

(declare-fun m!1331901 () Bool)

(assert (=> b!1443297 m!1331901))

(assert (=> b!1443297 m!1331901))

(assert (=> b!1443297 m!1331897))

(declare-fun m!1331903 () Bool)

(assert (=> b!1443297 m!1331903))

(declare-fun m!1331905 () Bool)

(assert (=> b!1443294 m!1331905))

(declare-fun m!1331907 () Bool)

(assert (=> b!1443282 m!1331907))

(declare-fun m!1331909 () Bool)

(assert (=> b!1443284 m!1331909))

(assert (=> b!1443284 m!1331881))

(declare-fun m!1331911 () Bool)

(assert (=> b!1443284 m!1331911))

(declare-fun m!1331913 () Bool)

(assert (=> b!1443284 m!1331913))

(declare-fun m!1331915 () Bool)

(assert (=> b!1443284 m!1331915))

(assert (=> b!1443284 m!1331897))

(declare-fun m!1331917 () Bool)

(assert (=> b!1443284 m!1331917))

(declare-fun m!1331919 () Bool)

(assert (=> b!1443284 m!1331919))

(assert (=> b!1443284 m!1331897))

(declare-fun m!1331921 () Bool)

(assert (=> b!1443289 m!1331921))

(assert (=> b!1443289 m!1331907))

(assert (=> b!1443285 m!1331897))

(assert (=> b!1443285 m!1331897))

(declare-fun m!1331923 () Bool)

(assert (=> b!1443285 m!1331923))

(assert (=> b!1443287 m!1331881))

(declare-fun m!1331925 () Bool)

(assert (=> b!1443287 m!1331925))

(check-sat (not b!1443289) (not b!1443296) (not b!1443294) (not b!1443284) (not b!1443285) (not b!1443297) (not b!1443286) (not b!1443282) (not b!1443290) (not start!124600) (not b!1443293) (not b!1443281))
(check-sat)
