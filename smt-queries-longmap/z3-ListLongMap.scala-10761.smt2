; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126162 () Bool)

(assert start!126162)

(declare-fun b!1475273 () Bool)

(declare-fun res!1001482 () Bool)

(declare-fun e!827957 () Bool)

(assert (=> b!1475273 (=> (not res!1001482) (not e!827957))))

(declare-datatypes ((SeekEntryResult!12054 0))(
  ( (MissingZero!12054 (index!50608 (_ BitVec 32))) (Found!12054 (index!50609 (_ BitVec 32))) (Intermediate!12054 (undefined!12866 Bool) (index!50610 (_ BitVec 32)) (x!132379 (_ BitVec 32))) (Undefined!12054) (MissingVacant!12054 (index!50611 (_ BitVec 32))) )
))
(declare-fun lt!644606 () SeekEntryResult!12054)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99277 0))(
  ( (array!99278 (arr!47917 (Array (_ BitVec 32) (_ BitVec 64))) (size!48468 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99277)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99277 (_ BitVec 32)) SeekEntryResult!12054)

(assert (=> b!1475273 (= res!1001482 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47917 a!2862) j!93) a!2862 mask!2687) lt!644606))))

(declare-fun e!827960 () Bool)

(declare-fun b!1475274 () Bool)

(declare-fun lt!644608 () (_ BitVec 64))

(declare-fun lt!644611 () array!99277)

(declare-fun lt!644610 () SeekEntryResult!12054)

(assert (=> b!1475274 (= e!827960 (= lt!644610 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644608 lt!644611 mask!2687)))))

(declare-fun b!1475275 () Bool)

(declare-fun res!1001486 () Bool)

(declare-fun e!827955 () Bool)

(assert (=> b!1475275 (=> (not res!1001486) (not e!827955))))

(assert (=> b!1475275 (= res!1001486 e!827960)))

(declare-fun c!136423 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475275 (= c!136423 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475276 () Bool)

(declare-fun res!1001484 () Bool)

(declare-fun e!827959 () Bool)

(assert (=> b!1475276 (=> (not res!1001484) (not e!827959))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99277 (_ BitVec 32)) SeekEntryResult!12054)

(assert (=> b!1475276 (= res!1001484 (= (seekEntryOrOpen!0 (select (arr!47917 a!2862) j!93) a!2862 mask!2687) (Found!12054 j!93)))))

(declare-fun b!1475277 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99277 (_ BitVec 32)) SeekEntryResult!12054)

(assert (=> b!1475277 (= e!827960 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644608 lt!644611 mask!2687) (seekEntryOrOpen!0 lt!644608 lt!644611 mask!2687)))))

(declare-fun b!1475278 () Bool)

(declare-fun res!1001489 () Bool)

(declare-fun e!827956 () Bool)

(assert (=> b!1475278 (=> (not res!1001489) (not e!827956))))

(declare-datatypes ((List!34405 0))(
  ( (Nil!34402) (Cons!34401 (h!35774 (_ BitVec 64)) (t!49091 List!34405)) )
))
(declare-fun arrayNoDuplicates!0 (array!99277 (_ BitVec 32) List!34405) Bool)

(assert (=> b!1475278 (= res!1001489 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34402))))

(declare-fun b!1475279 () Bool)

(declare-fun e!827961 () Bool)

(assert (=> b!1475279 (= e!827955 (not e!827961))))

(declare-fun res!1001479 () Bool)

(assert (=> b!1475279 (=> res!1001479 e!827961)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1475279 (= res!1001479 (or (not (= (select (arr!47917 a!2862) index!646) (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47917 a!2862) index!646) (select (arr!47917 a!2862) j!93)))))))

(assert (=> b!1475279 e!827959))

(declare-fun res!1001491 () Bool)

(assert (=> b!1475279 (=> (not res!1001491) (not e!827959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99277 (_ BitVec 32)) Bool)

(assert (=> b!1475279 (= res!1001491 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49481 0))(
  ( (Unit!49482) )
))
(declare-fun lt!644609 () Unit!49481)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49481)

(assert (=> b!1475279 (= lt!644609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1001485 () Bool)

(assert (=> start!126162 (=> (not res!1001485) (not e!827956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126162 (= res!1001485 (validMask!0 mask!2687))))

(assert (=> start!126162 e!827956))

(assert (=> start!126162 true))

(declare-fun array_inv!37198 (array!99277) Bool)

(assert (=> start!126162 (array_inv!37198 a!2862)))

(declare-fun b!1475280 () Bool)

(assert (=> b!1475280 (= e!827961 true)))

(declare-fun lt!644607 () SeekEntryResult!12054)

(assert (=> b!1475280 (= lt!644607 (seekEntryOrOpen!0 lt!644608 lt!644611 mask!2687))))

(declare-fun b!1475281 () Bool)

(declare-fun e!827954 () Bool)

(assert (=> b!1475281 (= e!827954 e!827957)))

(declare-fun res!1001477 () Bool)

(assert (=> b!1475281 (=> (not res!1001477) (not e!827957))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475281 (= res!1001477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47917 a!2862) j!93) mask!2687) (select (arr!47917 a!2862) j!93) a!2862 mask!2687) lt!644606))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475281 (= lt!644606 (Intermediate!12054 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475282 () Bool)

(declare-fun res!1001488 () Bool)

(assert (=> b!1475282 (=> (not res!1001488) (not e!827955))))

(assert (=> b!1475282 (= res!1001488 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475283 () Bool)

(declare-fun res!1001481 () Bool)

(assert (=> b!1475283 (=> (not res!1001481) (not e!827956))))

(assert (=> b!1475283 (= res!1001481 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48468 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48468 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48468 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475284 () Bool)

(assert (=> b!1475284 (= e!827956 e!827954)))

(declare-fun res!1001490 () Bool)

(assert (=> b!1475284 (=> (not res!1001490) (not e!827954))))

(assert (=> b!1475284 (= res!1001490 (= (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475284 (= lt!644611 (array!99278 (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48468 a!2862)))))

(declare-fun b!1475285 () Bool)

(declare-fun res!1001478 () Bool)

(assert (=> b!1475285 (=> (not res!1001478) (not e!827956))))

(assert (=> b!1475285 (= res!1001478 (and (= (size!48468 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48468 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48468 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475286 () Bool)

(declare-fun res!1001483 () Bool)

(assert (=> b!1475286 (=> (not res!1001483) (not e!827956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475286 (= res!1001483 (validKeyInArray!0 (select (arr!47917 a!2862) j!93)))))

(declare-fun b!1475287 () Bool)

(declare-fun res!1001487 () Bool)

(assert (=> b!1475287 (=> (not res!1001487) (not e!827956))))

(assert (=> b!1475287 (= res!1001487 (validKeyInArray!0 (select (arr!47917 a!2862) i!1006)))))

(declare-fun b!1475288 () Bool)

(assert (=> b!1475288 (= e!827959 (or (= (select (arr!47917 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47917 a!2862) intermediateBeforeIndex!19) (select (arr!47917 a!2862) j!93))))))

(declare-fun b!1475289 () Bool)

(declare-fun res!1001480 () Bool)

(assert (=> b!1475289 (=> (not res!1001480) (not e!827956))))

(assert (=> b!1475289 (= res!1001480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475290 () Bool)

(assert (=> b!1475290 (= e!827957 e!827955)))

(declare-fun res!1001492 () Bool)

(assert (=> b!1475290 (=> (not res!1001492) (not e!827955))))

(assert (=> b!1475290 (= res!1001492 (= lt!644610 (Intermediate!12054 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1475290 (= lt!644610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644608 mask!2687) lt!644608 lt!644611 mask!2687))))

(assert (=> b!1475290 (= lt!644608 (select (store (arr!47917 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126162 res!1001485) b!1475285))

(assert (= (and b!1475285 res!1001478) b!1475287))

(assert (= (and b!1475287 res!1001487) b!1475286))

(assert (= (and b!1475286 res!1001483) b!1475289))

(assert (= (and b!1475289 res!1001480) b!1475278))

(assert (= (and b!1475278 res!1001489) b!1475283))

(assert (= (and b!1475283 res!1001481) b!1475284))

(assert (= (and b!1475284 res!1001490) b!1475281))

(assert (= (and b!1475281 res!1001477) b!1475273))

(assert (= (and b!1475273 res!1001482) b!1475290))

(assert (= (and b!1475290 res!1001492) b!1475275))

(assert (= (and b!1475275 c!136423) b!1475274))

(assert (= (and b!1475275 (not c!136423)) b!1475277))

(assert (= (and b!1475275 res!1001486) b!1475282))

(assert (= (and b!1475282 res!1001488) b!1475279))

(assert (= (and b!1475279 res!1001491) b!1475276))

(assert (= (and b!1475276 res!1001484) b!1475288))

(assert (= (and b!1475279 (not res!1001479)) b!1475280))

(declare-fun m!1361767 () Bool)

(assert (=> b!1475286 m!1361767))

(assert (=> b!1475286 m!1361767))

(declare-fun m!1361769 () Bool)

(assert (=> b!1475286 m!1361769))

(declare-fun m!1361771 () Bool)

(assert (=> b!1475280 m!1361771))

(declare-fun m!1361773 () Bool)

(assert (=> b!1475284 m!1361773))

(declare-fun m!1361775 () Bool)

(assert (=> b!1475284 m!1361775))

(declare-fun m!1361777 () Bool)

(assert (=> b!1475288 m!1361777))

(assert (=> b!1475288 m!1361767))

(declare-fun m!1361779 () Bool)

(assert (=> b!1475287 m!1361779))

(assert (=> b!1475287 m!1361779))

(declare-fun m!1361781 () Bool)

(assert (=> b!1475287 m!1361781))

(assert (=> b!1475276 m!1361767))

(assert (=> b!1475276 m!1361767))

(declare-fun m!1361783 () Bool)

(assert (=> b!1475276 m!1361783))

(assert (=> b!1475273 m!1361767))

(assert (=> b!1475273 m!1361767))

(declare-fun m!1361785 () Bool)

(assert (=> b!1475273 m!1361785))

(declare-fun m!1361787 () Bool)

(assert (=> b!1475290 m!1361787))

(assert (=> b!1475290 m!1361787))

(declare-fun m!1361789 () Bool)

(assert (=> b!1475290 m!1361789))

(assert (=> b!1475290 m!1361773))

(declare-fun m!1361791 () Bool)

(assert (=> b!1475290 m!1361791))

(declare-fun m!1361793 () Bool)

(assert (=> b!1475279 m!1361793))

(assert (=> b!1475279 m!1361773))

(declare-fun m!1361795 () Bool)

(assert (=> b!1475279 m!1361795))

(declare-fun m!1361797 () Bool)

(assert (=> b!1475279 m!1361797))

(declare-fun m!1361799 () Bool)

(assert (=> b!1475279 m!1361799))

(assert (=> b!1475279 m!1361767))

(declare-fun m!1361801 () Bool)

(assert (=> b!1475274 m!1361801))

(declare-fun m!1361803 () Bool)

(assert (=> b!1475278 m!1361803))

(declare-fun m!1361805 () Bool)

(assert (=> start!126162 m!1361805))

(declare-fun m!1361807 () Bool)

(assert (=> start!126162 m!1361807))

(assert (=> b!1475281 m!1361767))

(assert (=> b!1475281 m!1361767))

(declare-fun m!1361809 () Bool)

(assert (=> b!1475281 m!1361809))

(assert (=> b!1475281 m!1361809))

(assert (=> b!1475281 m!1361767))

(declare-fun m!1361811 () Bool)

(assert (=> b!1475281 m!1361811))

(declare-fun m!1361813 () Bool)

(assert (=> b!1475289 m!1361813))

(declare-fun m!1361815 () Bool)

(assert (=> b!1475277 m!1361815))

(assert (=> b!1475277 m!1361771))

(check-sat (not b!1475290) (not b!1475286) (not b!1475273) (not start!126162) (not b!1475277) (not b!1475287) (not b!1475276) (not b!1475281) (not b!1475279) (not b!1475274) (not b!1475280) (not b!1475278) (not b!1475289))
(check-sat)
