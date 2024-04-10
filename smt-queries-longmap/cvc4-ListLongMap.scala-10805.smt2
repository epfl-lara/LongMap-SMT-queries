; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126422 () Bool)

(assert start!126422)

(declare-fun b!1482595 () Bool)

(declare-fun res!1007799 () Bool)

(declare-fun e!831360 () Bool)

(assert (=> b!1482595 (=> (not res!1007799) (not e!831360))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99441 0))(
  ( (array!99442 (arr!47998 (Array (_ BitVec 32) (_ BitVec 64))) (size!48548 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99441)

(assert (=> b!1482595 (= res!1007799 (and (= (size!48548 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48548 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48548 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1482596 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!831362 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1482596 (= e!831362 (and (or (= (select (arr!47998 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47998 a!2862) intermediateBeforeIndex!19) (select (arr!47998 a!2862) j!93))) (let ((bdg!54272 (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47998 a!2862) index!646) bdg!54272) (= (select (arr!47998 a!2862) index!646) (select (arr!47998 a!2862) j!93))) (= (select (arr!47998 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54272 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-datatypes ((SeekEntryResult!12238 0))(
  ( (MissingZero!12238 (index!51344 (_ BitVec 32))) (Found!12238 (index!51345 (_ BitVec 32))) (Intermediate!12238 (undefined!13050 Bool) (index!51346 (_ BitVec 32)) (x!132921 (_ BitVec 32))) (Undefined!12238) (MissingVacant!12238 (index!51347 (_ BitVec 32))) )
))
(declare-fun lt!647118 () SeekEntryResult!12238)

(declare-fun b!1482597 () Bool)

(declare-fun lt!647117 () (_ BitVec 64))

(declare-fun e!831357 () Bool)

(declare-fun lt!647115 () array!99441)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99441 (_ BitVec 32)) SeekEntryResult!12238)

(assert (=> b!1482597 (= e!831357 (= lt!647118 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647117 lt!647115 mask!2687)))))

(declare-fun b!1482598 () Bool)

(declare-fun res!1007793 () Bool)

(assert (=> b!1482598 (=> (not res!1007793) (not e!831360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99441 (_ BitVec 32)) Bool)

(assert (=> b!1482598 (= res!1007793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482599 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99441 (_ BitVec 32)) SeekEntryResult!12238)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99441 (_ BitVec 32)) SeekEntryResult!12238)

(assert (=> b!1482599 (= e!831357 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647117 lt!647115 mask!2687) (seekEntryOrOpen!0 lt!647117 lt!647115 mask!2687)))))

(declare-fun res!1007797 () Bool)

(assert (=> start!126422 (=> (not res!1007797) (not e!831360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126422 (= res!1007797 (validMask!0 mask!2687))))

(assert (=> start!126422 e!831360))

(assert (=> start!126422 true))

(declare-fun array_inv!37026 (array!99441) Bool)

(assert (=> start!126422 (array_inv!37026 a!2862)))

(declare-fun b!1482600 () Bool)

(declare-fun e!831356 () Bool)

(declare-fun e!831355 () Bool)

(assert (=> b!1482600 (= e!831356 e!831355)))

(declare-fun res!1007792 () Bool)

(assert (=> b!1482600 (=> (not res!1007792) (not e!831355))))

(declare-fun lt!647116 () SeekEntryResult!12238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482600 (= res!1007792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!647116))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482600 (= lt!647116 (Intermediate!12238 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482601 () Bool)

(declare-fun res!1007791 () Bool)

(declare-fun e!831358 () Bool)

(assert (=> b!1482601 (=> (not res!1007791) (not e!831358))))

(assert (=> b!1482601 (= res!1007791 e!831357)))

(declare-fun c!136926 () Bool)

(assert (=> b!1482601 (= c!136926 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482602 () Bool)

(declare-fun res!1007795 () Bool)

(assert (=> b!1482602 (=> (not res!1007795) (not e!831360))))

(assert (=> b!1482602 (= res!1007795 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48548 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48548 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48548 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482603 () Bool)

(declare-fun res!1007787 () Bool)

(assert (=> b!1482603 (=> (not res!1007787) (not e!831355))))

(assert (=> b!1482603 (= res!1007787 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!647116))))

(declare-fun b!1482604 () Bool)

(declare-fun res!1007790 () Bool)

(assert (=> b!1482604 (=> (not res!1007790) (not e!831362))))

(assert (=> b!1482604 (= res!1007790 (= (seekEntryOrOpen!0 (select (arr!47998 a!2862) j!93) a!2862 mask!2687) (Found!12238 j!93)))))

(declare-fun b!1482605 () Bool)

(declare-fun res!1007800 () Bool)

(assert (=> b!1482605 (=> (not res!1007800) (not e!831358))))

(assert (=> b!1482605 (= res!1007800 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482606 () Bool)

(declare-fun e!831359 () Bool)

(assert (=> b!1482606 (= e!831358 (not e!831359))))

(declare-fun res!1007796 () Bool)

(assert (=> b!1482606 (=> res!1007796 e!831359)))

(assert (=> b!1482606 (= res!1007796 (or (and (= (select (arr!47998 a!2862) index!646) (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47998 a!2862) index!646) (select (arr!47998 a!2862) j!93))) (= (select (arr!47998 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1482606 e!831362))

(declare-fun res!1007788 () Bool)

(assert (=> b!1482606 (=> (not res!1007788) (not e!831362))))

(assert (=> b!1482606 (= res!1007788 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49816 0))(
  ( (Unit!49817) )
))
(declare-fun lt!647114 () Unit!49816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49816)

(assert (=> b!1482606 (= lt!647114 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482607 () Bool)

(assert (=> b!1482607 (= e!831355 e!831358)))

(declare-fun res!1007786 () Bool)

(assert (=> b!1482607 (=> (not res!1007786) (not e!831358))))

(assert (=> b!1482607 (= res!1007786 (= lt!647118 (Intermediate!12238 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482607 (= lt!647118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647117 mask!2687) lt!647117 lt!647115 mask!2687))))

(assert (=> b!1482607 (= lt!647117 (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482608 () Bool)

(declare-fun res!1007789 () Bool)

(assert (=> b!1482608 (=> (not res!1007789) (not e!831360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482608 (= res!1007789 (validKeyInArray!0 (select (arr!47998 a!2862) i!1006)))))

(declare-fun b!1482609 () Bool)

(declare-fun res!1007798 () Bool)

(assert (=> b!1482609 (=> (not res!1007798) (not e!831360))))

(declare-datatypes ((List!34499 0))(
  ( (Nil!34496) (Cons!34495 (h!35866 (_ BitVec 64)) (t!49193 List!34499)) )
))
(declare-fun arrayNoDuplicates!0 (array!99441 (_ BitVec 32) List!34499) Bool)

(assert (=> b!1482609 (= res!1007798 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34496))))

(declare-fun b!1482610 () Bool)

(assert (=> b!1482610 (= e!831359 (= (seekEntryOrOpen!0 lt!647117 lt!647115 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647117 lt!647115 mask!2687)))))

(declare-fun b!1482611 () Bool)

(assert (=> b!1482611 (= e!831360 e!831356)))

(declare-fun res!1007785 () Bool)

(assert (=> b!1482611 (=> (not res!1007785) (not e!831356))))

(assert (=> b!1482611 (= res!1007785 (= (select (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482611 (= lt!647115 (array!99442 (store (arr!47998 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48548 a!2862)))))

(declare-fun b!1482612 () Bool)

(declare-fun res!1007794 () Bool)

(assert (=> b!1482612 (=> (not res!1007794) (not e!831360))))

(assert (=> b!1482612 (= res!1007794 (validKeyInArray!0 (select (arr!47998 a!2862) j!93)))))

(assert (= (and start!126422 res!1007797) b!1482595))

(assert (= (and b!1482595 res!1007799) b!1482608))

(assert (= (and b!1482608 res!1007789) b!1482612))

(assert (= (and b!1482612 res!1007794) b!1482598))

(assert (= (and b!1482598 res!1007793) b!1482609))

(assert (= (and b!1482609 res!1007798) b!1482602))

(assert (= (and b!1482602 res!1007795) b!1482611))

(assert (= (and b!1482611 res!1007785) b!1482600))

(assert (= (and b!1482600 res!1007792) b!1482603))

(assert (= (and b!1482603 res!1007787) b!1482607))

(assert (= (and b!1482607 res!1007786) b!1482601))

(assert (= (and b!1482601 c!136926) b!1482597))

(assert (= (and b!1482601 (not c!136926)) b!1482599))

(assert (= (and b!1482601 res!1007791) b!1482605))

(assert (= (and b!1482605 res!1007800) b!1482606))

(assert (= (and b!1482606 res!1007788) b!1482604))

(assert (= (and b!1482604 res!1007790) b!1482596))

(assert (= (and b!1482606 (not res!1007796)) b!1482610))

(declare-fun m!1368305 () Bool)

(assert (=> b!1482606 m!1368305))

(declare-fun m!1368307 () Bool)

(assert (=> b!1482606 m!1368307))

(declare-fun m!1368309 () Bool)

(assert (=> b!1482606 m!1368309))

(declare-fun m!1368311 () Bool)

(assert (=> b!1482606 m!1368311))

(declare-fun m!1368313 () Bool)

(assert (=> b!1482606 m!1368313))

(declare-fun m!1368315 () Bool)

(assert (=> b!1482606 m!1368315))

(assert (=> b!1482596 m!1368307))

(declare-fun m!1368317 () Bool)

(assert (=> b!1482596 m!1368317))

(assert (=> b!1482596 m!1368309))

(assert (=> b!1482596 m!1368311))

(assert (=> b!1482596 m!1368315))

(assert (=> b!1482611 m!1368307))

(declare-fun m!1368319 () Bool)

(assert (=> b!1482611 m!1368319))

(assert (=> b!1482604 m!1368315))

(assert (=> b!1482604 m!1368315))

(declare-fun m!1368321 () Bool)

(assert (=> b!1482604 m!1368321))

(declare-fun m!1368323 () Bool)

(assert (=> b!1482597 m!1368323))

(assert (=> b!1482612 m!1368315))

(assert (=> b!1482612 m!1368315))

(declare-fun m!1368325 () Bool)

(assert (=> b!1482612 m!1368325))

(declare-fun m!1368327 () Bool)

(assert (=> start!126422 m!1368327))

(declare-fun m!1368329 () Bool)

(assert (=> start!126422 m!1368329))

(declare-fun m!1368331 () Bool)

(assert (=> b!1482610 m!1368331))

(declare-fun m!1368333 () Bool)

(assert (=> b!1482610 m!1368333))

(assert (=> b!1482599 m!1368333))

(assert (=> b!1482599 m!1368331))

(declare-fun m!1368335 () Bool)

(assert (=> b!1482608 m!1368335))

(assert (=> b!1482608 m!1368335))

(declare-fun m!1368337 () Bool)

(assert (=> b!1482608 m!1368337))

(declare-fun m!1368339 () Bool)

(assert (=> b!1482607 m!1368339))

(assert (=> b!1482607 m!1368339))

(declare-fun m!1368341 () Bool)

(assert (=> b!1482607 m!1368341))

(assert (=> b!1482607 m!1368307))

(declare-fun m!1368343 () Bool)

(assert (=> b!1482607 m!1368343))

(declare-fun m!1368345 () Bool)

(assert (=> b!1482598 m!1368345))

(assert (=> b!1482600 m!1368315))

(assert (=> b!1482600 m!1368315))

(declare-fun m!1368347 () Bool)

(assert (=> b!1482600 m!1368347))

(assert (=> b!1482600 m!1368347))

(assert (=> b!1482600 m!1368315))

(declare-fun m!1368349 () Bool)

(assert (=> b!1482600 m!1368349))

(declare-fun m!1368351 () Bool)

(assert (=> b!1482609 m!1368351))

(assert (=> b!1482603 m!1368315))

(assert (=> b!1482603 m!1368315))

(declare-fun m!1368353 () Bool)

(assert (=> b!1482603 m!1368353))

(push 1)

(assert (not b!1482598))

(assert (not b!1482597))

(assert (not b!1482608))

(assert (not b!1482603))

(assert (not start!126422))

(assert (not b!1482612))

(assert (not b!1482607))

(assert (not b!1482604))

(assert (not b!1482609))

(assert (not b!1482610))

(assert (not b!1482606))

(assert (not b!1482599))

(assert (not b!1482600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156297 () Bool)

(assert (=> d!156297 (= (validKeyInArray!0 (select (arr!47998 a!2862) j!93)) (and (not (= (select (arr!47998 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47998 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482612 d!156297))

(declare-fun b!1482715 () Bool)

(declare-fun c!136969 () Bool)

(declare-fun lt!647154 () (_ BitVec 64))

(assert (=> b!1482715 (= c!136969 (= lt!647154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831421 () SeekEntryResult!12238)

(declare-fun e!831420 () SeekEntryResult!12238)

(assert (=> b!1482715 (= e!831421 e!831420)))

(declare-fun b!1482716 () Bool)

(declare-fun e!831422 () SeekEntryResult!12238)

(assert (=> b!1482716 (= e!831422 e!831421)))

(declare-fun c!136971 () Bool)

(assert (=> b!1482716 (= c!136971 (= lt!647154 lt!647117))))

(declare-fun b!1482717 () Bool)

(assert (=> b!1482717 (= e!831422 Undefined!12238)))

(declare-fun b!1482718 () Bool)

(assert (=> b!1482718 (= e!831421 (Found!12238 index!646))))

(declare-fun b!1482719 () Bool)

(assert (=> b!1482719 (= e!831420 (MissingVacant!12238 intermediateAfterIndex!19))))

(declare-fun b!1482720 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482720 (= e!831420 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!647117 lt!647115 mask!2687))))

(declare-fun d!156299 () Bool)

(declare-fun lt!647155 () SeekEntryResult!12238)

(assert (=> d!156299 (and (or (is-Undefined!12238 lt!647155) (not (is-Found!12238 lt!647155)) (and (bvsge (index!51345 lt!647155) #b00000000000000000000000000000000) (bvslt (index!51345 lt!647155) (size!48548 lt!647115)))) (or (is-Undefined!12238 lt!647155) (is-Found!12238 lt!647155) (not (is-MissingVacant!12238 lt!647155)) (not (= (index!51347 lt!647155) intermediateAfterIndex!19)) (and (bvsge (index!51347 lt!647155) #b00000000000000000000000000000000) (bvslt (index!51347 lt!647155) (size!48548 lt!647115)))) (or (is-Undefined!12238 lt!647155) (ite (is-Found!12238 lt!647155) (= (select (arr!47998 lt!647115) (index!51345 lt!647155)) lt!647117) (and (is-MissingVacant!12238 lt!647155) (= (index!51347 lt!647155) intermediateAfterIndex!19) (= (select (arr!47998 lt!647115) (index!51347 lt!647155)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156299 (= lt!647155 e!831422)))

(declare-fun c!136970 () Bool)

(assert (=> d!156299 (= c!136970 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156299 (= lt!647154 (select (arr!47998 lt!647115) index!646))))

(assert (=> d!156299 (validMask!0 mask!2687)))

(assert (=> d!156299 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647117 lt!647115 mask!2687) lt!647155)))

(assert (= (and d!156299 c!136970) b!1482717))

(assert (= (and d!156299 (not c!136970)) b!1482716))

(assert (= (and b!1482716 c!136971) b!1482718))

(assert (= (and b!1482716 (not c!136971)) b!1482715))

(assert (= (and b!1482715 c!136969) b!1482719))

(assert (= (and b!1482715 (not c!136969)) b!1482720))

(declare-fun m!1368391 () Bool)

(assert (=> b!1482720 m!1368391))

(assert (=> b!1482720 m!1368391))

(declare-fun m!1368393 () Bool)

(assert (=> b!1482720 m!1368393))

(declare-fun m!1368395 () Bool)

(assert (=> d!156299 m!1368395))

(declare-fun m!1368397 () Bool)

(assert (=> d!156299 m!1368397))

(declare-fun m!1368399 () Bool)

(assert (=> d!156299 m!1368399))

(assert (=> d!156299 m!1368327))

(assert (=> b!1482599 d!156299))

(declare-fun d!156307 () Bool)

(declare-fun lt!647189 () SeekEntryResult!12238)

(assert (=> d!156307 (and (or (is-Undefined!12238 lt!647189) (not (is-Found!12238 lt!647189)) (and (bvsge (index!51345 lt!647189) #b00000000000000000000000000000000) (bvslt (index!51345 lt!647189) (size!48548 lt!647115)))) (or (is-Undefined!12238 lt!647189) (is-Found!12238 lt!647189) (not (is-MissingZero!12238 lt!647189)) (and (bvsge (index!51344 lt!647189) #b00000000000000000000000000000000) (bvslt (index!51344 lt!647189) (size!48548 lt!647115)))) (or (is-Undefined!12238 lt!647189) (is-Found!12238 lt!647189) (is-MissingZero!12238 lt!647189) (not (is-MissingVacant!12238 lt!647189)) (and (bvsge (index!51347 lt!647189) #b00000000000000000000000000000000) (bvslt (index!51347 lt!647189) (size!48548 lt!647115)))) (or (is-Undefined!12238 lt!647189) (ite (is-Found!12238 lt!647189) (= (select (arr!47998 lt!647115) (index!51345 lt!647189)) lt!647117) (ite (is-MissingZero!12238 lt!647189) (= (select (arr!47998 lt!647115) (index!51344 lt!647189)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12238 lt!647189) (= (select (arr!47998 lt!647115) (index!51347 lt!647189)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!831462 () SeekEntryResult!12238)

(assert (=> d!156307 (= lt!647189 e!831462)))

(declare-fun c!136999 () Bool)

(declare-fun lt!647187 () SeekEntryResult!12238)

(assert (=> d!156307 (= c!136999 (and (is-Intermediate!12238 lt!647187) (undefined!13050 lt!647187)))))

(assert (=> d!156307 (= lt!647187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647117 mask!2687) lt!647117 lt!647115 mask!2687))))

(assert (=> d!156307 (validMask!0 mask!2687)))

(assert (=> d!156307 (= (seekEntryOrOpen!0 lt!647117 lt!647115 mask!2687) lt!647189)))

(declare-fun b!1482790 () Bool)

(declare-fun c!137000 () Bool)

(declare-fun lt!647188 () (_ BitVec 64))

(assert (=> b!1482790 (= c!137000 (= lt!647188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831463 () SeekEntryResult!12238)

(declare-fun e!831464 () SeekEntryResult!12238)

(assert (=> b!1482790 (= e!831463 e!831464)))

(declare-fun b!1482791 () Bool)

(assert (=> b!1482791 (= e!831462 e!831463)))

(assert (=> b!1482791 (= lt!647188 (select (arr!47998 lt!647115) (index!51346 lt!647187)))))

(declare-fun c!137001 () Bool)

(assert (=> b!1482791 (= c!137001 (= lt!647188 lt!647117))))

(declare-fun b!1482792 () Bool)

(assert (=> b!1482792 (= e!831463 (Found!12238 (index!51346 lt!647187)))))

(declare-fun b!1482793 () Bool)

(assert (=> b!1482793 (= e!831464 (MissingZero!12238 (index!51346 lt!647187)))))

(declare-fun b!1482794 () Bool)

(assert (=> b!1482794 (= e!831464 (seekKeyOrZeroReturnVacant!0 (x!132921 lt!647187) (index!51346 lt!647187) (index!51346 lt!647187) lt!647117 lt!647115 mask!2687))))

(declare-fun b!1482795 () Bool)

(assert (=> b!1482795 (= e!831462 Undefined!12238)))

(assert (= (and d!156307 c!136999) b!1482795))

(assert (= (and d!156307 (not c!136999)) b!1482791))

(assert (= (and b!1482791 c!137001) b!1482792))

(assert (= (and b!1482791 (not c!137001)) b!1482790))

(assert (= (and b!1482790 c!137000) b!1482793))

(assert (= (and b!1482790 (not c!137000)) b!1482794))

(assert (=> d!156307 m!1368327))

(assert (=> d!156307 m!1368339))

(assert (=> d!156307 m!1368341))

(declare-fun m!1368435 () Bool)

(assert (=> d!156307 m!1368435))

(assert (=> d!156307 m!1368339))

(declare-fun m!1368437 () Bool)

(assert (=> d!156307 m!1368437))

(declare-fun m!1368439 () Bool)

(assert (=> d!156307 m!1368439))

(declare-fun m!1368441 () Bool)

(assert (=> b!1482791 m!1368441))

(declare-fun m!1368443 () Bool)

(assert (=> b!1482794 m!1368443))

(assert (=> b!1482599 d!156307))

(assert (=> b!1482610 d!156307))

(assert (=> b!1482610 d!156299))

(declare-fun b!1482842 () Bool)

(declare-fun e!831493 () SeekEntryResult!12238)

(assert (=> b!1482842 (= e!831493 (Intermediate!12238 false (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482843 () Bool)

(declare-fun lt!647216 () SeekEntryResult!12238)

(assert (=> b!1482843 (and (bvsge (index!51346 lt!647216) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647216) (size!48548 a!2862)))))

(declare-fun e!831495 () Bool)

(assert (=> b!1482843 (= e!831495 (= (select (arr!47998 a!2862) (index!51346 lt!647216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482844 () Bool)

(assert (=> b!1482844 (= e!831493 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47998 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482845 () Bool)

(declare-fun e!831494 () SeekEntryResult!12238)

(assert (=> b!1482845 (= e!831494 (Intermediate!12238 true (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482846 () Bool)

(assert (=> b!1482846 (and (bvsge (index!51346 lt!647216) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647216) (size!48548 a!2862)))))

(declare-fun res!1007851 () Bool)

(assert (=> b!1482846 (= res!1007851 (= (select (arr!47998 a!2862) (index!51346 lt!647216)) (select (arr!47998 a!2862) j!93)))))

(assert (=> b!1482846 (=> res!1007851 e!831495)))

(declare-fun e!831496 () Bool)

(assert (=> b!1482846 (= e!831496 e!831495)))

(declare-fun d!156323 () Bool)

(declare-fun e!831497 () Bool)

(assert (=> d!156323 e!831497))

(declare-fun c!137018 () Bool)

(assert (=> d!156323 (= c!137018 (and (is-Intermediate!12238 lt!647216) (undefined!13050 lt!647216)))))

(assert (=> d!156323 (= lt!647216 e!831494)))

(declare-fun c!137019 () Bool)

(assert (=> d!156323 (= c!137019 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!647215 () (_ BitVec 64))

(assert (=> d!156323 (= lt!647215 (select (arr!47998 a!2862) (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687)))))

(assert (=> d!156323 (validMask!0 mask!2687)))

(assert (=> d!156323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) (select (arr!47998 a!2862) j!93) a!2862 mask!2687) lt!647216)))

(declare-fun b!1482847 () Bool)

(assert (=> b!1482847 (= e!831497 e!831496)))

(declare-fun res!1007850 () Bool)

(assert (=> b!1482847 (= res!1007850 (and (is-Intermediate!12238 lt!647216) (not (undefined!13050 lt!647216)) (bvslt (x!132921 lt!647216) #b01111111111111111111111111111110) (bvsge (x!132921 lt!647216) #b00000000000000000000000000000000) (bvsge (x!132921 lt!647216) #b00000000000000000000000000000000)))))

(assert (=> b!1482847 (=> (not res!1007850) (not e!831496))))

(declare-fun b!1482848 () Bool)

(assert (=> b!1482848 (= e!831494 e!831493)))

(declare-fun c!137020 () Bool)

(assert (=> b!1482848 (= c!137020 (or (= lt!647215 (select (arr!47998 a!2862) j!93)) (= (bvadd lt!647215 lt!647215) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482849 () Bool)

(assert (=> b!1482849 (and (bvsge (index!51346 lt!647216) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647216) (size!48548 a!2862)))))

(declare-fun res!1007849 () Bool)

(assert (=> b!1482849 (= res!1007849 (= (select (arr!47998 a!2862) (index!51346 lt!647216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482849 (=> res!1007849 e!831495)))

(declare-fun b!1482850 () Bool)

(assert (=> b!1482850 (= e!831497 (bvsge (x!132921 lt!647216) #b01111111111111111111111111111110))))

(assert (= (and d!156323 c!137019) b!1482845))

(assert (= (and d!156323 (not c!137019)) b!1482848))

(assert (= (and b!1482848 c!137020) b!1482842))

(assert (= (and b!1482848 (not c!137020)) b!1482844))

(assert (= (and d!156323 c!137018) b!1482850))

(assert (= (and d!156323 (not c!137018)) b!1482847))

(assert (= (and b!1482847 res!1007850) b!1482846))

(assert (= (and b!1482846 (not res!1007851)) b!1482849))

(assert (= (and b!1482849 (not res!1007849)) b!1482843))

(declare-fun m!1368485 () Bool)

(assert (=> b!1482843 m!1368485))

(assert (=> b!1482849 m!1368485))

(assert (=> b!1482846 m!1368485))

(assert (=> d!156323 m!1368347))

(declare-fun m!1368487 () Bool)

(assert (=> d!156323 m!1368487))

(assert (=> d!156323 m!1368327))

(assert (=> b!1482844 m!1368347))

(declare-fun m!1368489 () Bool)

(assert (=> b!1482844 m!1368489))

(assert (=> b!1482844 m!1368489))

(assert (=> b!1482844 m!1368315))

(declare-fun m!1368491 () Bool)

(assert (=> b!1482844 m!1368491))

(assert (=> b!1482600 d!156323))

(declare-fun d!156341 () Bool)

(declare-fun lt!647226 () (_ BitVec 32))

(declare-fun lt!647225 () (_ BitVec 32))

(assert (=> d!156341 (= lt!647226 (bvmul (bvxor lt!647225 (bvlshr lt!647225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156341 (= lt!647225 ((_ extract 31 0) (bvand (bvxor (select (arr!47998 a!2862) j!93) (bvlshr (select (arr!47998 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156341 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007852 (let ((h!35868 ((_ extract 31 0) (bvand (bvxor (select (arr!47998 a!2862) j!93) (bvlshr (select (arr!47998 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132928 (bvmul (bvxor h!35868 (bvlshr h!35868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132928 (bvlshr x!132928 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007852 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007852 #b00000000000000000000000000000000))))))

(assert (=> d!156341 (= (toIndex!0 (select (arr!47998 a!2862) j!93) mask!2687) (bvand (bvxor lt!647226 (bvlshr lt!647226 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482600 d!156341))

(declare-fun b!1482910 () Bool)

(declare-fun e!831533 () Bool)

(declare-fun e!831532 () Bool)

(assert (=> b!1482910 (= e!831533 e!831532)))

(declare-fun lt!647242 () (_ BitVec 64))

(assert (=> b!1482910 (= lt!647242 (select (arr!47998 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!647243 () Unit!49816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99441 (_ BitVec 64) (_ BitVec 32)) Unit!49816)

(assert (=> b!1482910 (= lt!647243 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647242 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1482910 (arrayContainsKey!0 a!2862 lt!647242 #b00000000000000000000000000000000)))

(declare-fun lt!647244 () Unit!49816)

(assert (=> b!1482910 (= lt!647244 lt!647243)))

(declare-fun res!1007872 () Bool)

(assert (=> b!1482910 (= res!1007872 (= (seekEntryOrOpen!0 (select (arr!47998 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12238 #b00000000000000000000000000000000)))))

(assert (=> b!1482910 (=> (not res!1007872) (not e!831532))))

(declare-fun b!1482911 () Bool)

(declare-fun call!67865 () Bool)

(assert (=> b!1482911 (= e!831532 call!67865)))

(declare-fun b!1482912 () Bool)

(declare-fun e!831534 () Bool)

(assert (=> b!1482912 (= e!831534 e!831533)))

(declare-fun c!137041 () Bool)

(assert (=> b!1482912 (= c!137041 (validKeyInArray!0 (select (arr!47998 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67862 () Bool)

(assert (=> bm!67862 (= call!67865 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156343 () Bool)

(declare-fun res!1007873 () Bool)

(assert (=> d!156343 (=> res!1007873 e!831534)))

(assert (=> d!156343 (= res!1007873 (bvsge #b00000000000000000000000000000000 (size!48548 a!2862)))))

(assert (=> d!156343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!831534)))

(declare-fun b!1482913 () Bool)

(assert (=> b!1482913 (= e!831533 call!67865)))

(assert (= (and d!156343 (not res!1007873)) b!1482912))

(assert (= (and b!1482912 c!137041) b!1482910))

(assert (= (and b!1482912 (not c!137041)) b!1482913))

(assert (= (and b!1482910 res!1007872) b!1482911))

(assert (= (or b!1482911 b!1482913) bm!67862))

(declare-fun m!1368519 () Bool)

(assert (=> b!1482910 m!1368519))

(declare-fun m!1368521 () Bool)

(assert (=> b!1482910 m!1368521))

(declare-fun m!1368523 () Bool)

(assert (=> b!1482910 m!1368523))

(assert (=> b!1482910 m!1368519))

(declare-fun m!1368525 () Bool)

(assert (=> b!1482910 m!1368525))

(assert (=> b!1482912 m!1368519))

(assert (=> b!1482912 m!1368519))

(declare-fun m!1368527 () Bool)

(assert (=> b!1482912 m!1368527))

(declare-fun m!1368529 () Bool)

(assert (=> bm!67862 m!1368529))

(assert (=> b!1482598 d!156343))

(declare-fun b!1482924 () Bool)

(declare-fun e!831544 () Bool)

(declare-fun contains!9914 (List!34499 (_ BitVec 64)) Bool)

(assert (=> b!1482924 (= e!831544 (contains!9914 Nil!34496 (select (arr!47998 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67865 () Bool)

(declare-fun call!67868 () Bool)

(declare-fun c!137044 () Bool)

(assert (=> bm!67865 (= call!67868 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137044 (Cons!34495 (select (arr!47998 a!2862) #b00000000000000000000000000000000) Nil!34496) Nil!34496)))))

(declare-fun b!1482925 () Bool)

(declare-fun e!831543 () Bool)

(assert (=> b!1482925 (= e!831543 call!67868)))

(declare-fun b!1482926 () Bool)

(declare-fun e!831545 () Bool)

(assert (=> b!1482926 (= e!831545 e!831543)))

(assert (=> b!1482926 (= c!137044 (validKeyInArray!0 (select (arr!47998 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482927 () Bool)

(declare-fun e!831546 () Bool)

(assert (=> b!1482927 (= e!831546 e!831545)))

(declare-fun res!1007881 () Bool)

(assert (=> b!1482927 (=> (not res!1007881) (not e!831545))))

(assert (=> b!1482927 (= res!1007881 (not e!831544))))

(declare-fun res!1007882 () Bool)

(assert (=> b!1482927 (=> (not res!1007882) (not e!831544))))

(assert (=> b!1482927 (= res!1007882 (validKeyInArray!0 (select (arr!47998 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482928 () Bool)

(assert (=> b!1482928 (= e!831543 call!67868)))

(declare-fun d!156353 () Bool)

(declare-fun res!1007883 () Bool)

(assert (=> d!156353 (=> res!1007883 e!831546)))

(assert (=> d!156353 (= res!1007883 (bvsge #b00000000000000000000000000000000 (size!48548 a!2862)))))

(assert (=> d!156353 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34496) e!831546)))

(assert (= (and d!156353 (not res!1007883)) b!1482927))

(assert (= (and b!1482927 res!1007882) b!1482924))

(assert (= (and b!1482927 res!1007881) b!1482926))

(assert (= (and b!1482926 c!137044) b!1482925))

(assert (= (and b!1482926 (not c!137044)) b!1482928))

(assert (= (or b!1482925 b!1482928) bm!67865))

(assert (=> b!1482924 m!1368519))

(assert (=> b!1482924 m!1368519))

(declare-fun m!1368531 () Bool)

(assert (=> b!1482924 m!1368531))

(assert (=> bm!67865 m!1368519))

(declare-fun m!1368533 () Bool)

(assert (=> bm!67865 m!1368533))

(assert (=> b!1482926 m!1368519))

(assert (=> b!1482926 m!1368519))

(assert (=> b!1482926 m!1368527))

(assert (=> b!1482927 m!1368519))

(assert (=> b!1482927 m!1368519))

(assert (=> b!1482927 m!1368527))

(assert (=> b!1482609 d!156353))

(declare-fun b!1482929 () Bool)

(declare-fun e!831547 () SeekEntryResult!12238)

(assert (=> b!1482929 (= e!831547 (Intermediate!12238 false (toIndex!0 lt!647117 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482930 () Bool)

(declare-fun lt!647252 () SeekEntryResult!12238)

(assert (=> b!1482930 (and (bvsge (index!51346 lt!647252) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647252) (size!48548 lt!647115)))))

(declare-fun e!831549 () Bool)

(assert (=> b!1482930 (= e!831549 (= (select (arr!47998 lt!647115) (index!51346 lt!647252)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482931 () Bool)

(assert (=> b!1482931 (= e!831547 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!647117 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!647117 lt!647115 mask!2687))))

(declare-fun b!1482932 () Bool)

(declare-fun e!831548 () SeekEntryResult!12238)

(assert (=> b!1482932 (= e!831548 (Intermediate!12238 true (toIndex!0 lt!647117 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482933 () Bool)

(assert (=> b!1482933 (and (bvsge (index!51346 lt!647252) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647252) (size!48548 lt!647115)))))

(declare-fun res!1007886 () Bool)

(assert (=> b!1482933 (= res!1007886 (= (select (arr!47998 lt!647115) (index!51346 lt!647252)) lt!647117))))

(assert (=> b!1482933 (=> res!1007886 e!831549)))

(declare-fun e!831550 () Bool)

(assert (=> b!1482933 (= e!831550 e!831549)))

(declare-fun d!156357 () Bool)

(declare-fun e!831551 () Bool)

(assert (=> d!156357 e!831551))

(declare-fun c!137045 () Bool)

(assert (=> d!156357 (= c!137045 (and (is-Intermediate!12238 lt!647252) (undefined!13050 lt!647252)))))

(assert (=> d!156357 (= lt!647252 e!831548)))

(declare-fun c!137046 () Bool)

(assert (=> d!156357 (= c!137046 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!647251 () (_ BitVec 64))

(assert (=> d!156357 (= lt!647251 (select (arr!47998 lt!647115) (toIndex!0 lt!647117 mask!2687)))))

(assert (=> d!156357 (validMask!0 mask!2687)))

(assert (=> d!156357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647117 mask!2687) lt!647117 lt!647115 mask!2687) lt!647252)))

(declare-fun b!1482934 () Bool)

(assert (=> b!1482934 (= e!831551 e!831550)))

(declare-fun res!1007885 () Bool)

(assert (=> b!1482934 (= res!1007885 (and (is-Intermediate!12238 lt!647252) (not (undefined!13050 lt!647252)) (bvslt (x!132921 lt!647252) #b01111111111111111111111111111110) (bvsge (x!132921 lt!647252) #b00000000000000000000000000000000) (bvsge (x!132921 lt!647252) #b00000000000000000000000000000000)))))

(assert (=> b!1482934 (=> (not res!1007885) (not e!831550))))

(declare-fun b!1482935 () Bool)

(assert (=> b!1482935 (= e!831548 e!831547)))

(declare-fun c!137047 () Bool)

(assert (=> b!1482935 (= c!137047 (or (= lt!647251 lt!647117) (= (bvadd lt!647251 lt!647251) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482936 () Bool)

(assert (=> b!1482936 (and (bvsge (index!51346 lt!647252) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647252) (size!48548 lt!647115)))))

(declare-fun res!1007884 () Bool)

(assert (=> b!1482936 (= res!1007884 (= (select (arr!47998 lt!647115) (index!51346 lt!647252)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482936 (=> res!1007884 e!831549)))

(declare-fun b!1482937 () Bool)

(assert (=> b!1482937 (= e!831551 (bvsge (x!132921 lt!647252) #b01111111111111111111111111111110))))

(assert (= (and d!156357 c!137046) b!1482932))

(assert (= (and d!156357 (not c!137046)) b!1482935))

(assert (= (and b!1482935 c!137047) b!1482929))

(assert (= (and b!1482935 (not c!137047)) b!1482931))

(assert (= (and d!156357 c!137045) b!1482937))

(assert (= (and d!156357 (not c!137045)) b!1482934))

(assert (= (and b!1482934 res!1007885) b!1482933))

(assert (= (and b!1482933 (not res!1007886)) b!1482936))

(assert (= (and b!1482936 (not res!1007884)) b!1482930))

(declare-fun m!1368535 () Bool)

(assert (=> b!1482930 m!1368535))

(assert (=> b!1482936 m!1368535))

(assert (=> b!1482933 m!1368535))

(assert (=> d!156357 m!1368339))

(declare-fun m!1368537 () Bool)

(assert (=> d!156357 m!1368537))

(assert (=> d!156357 m!1368327))

(assert (=> b!1482931 m!1368339))

(declare-fun m!1368539 () Bool)

(assert (=> b!1482931 m!1368539))

(assert (=> b!1482931 m!1368539))

(declare-fun m!1368541 () Bool)

(assert (=> b!1482931 m!1368541))

(assert (=> b!1482607 d!156357))

(declare-fun d!156359 () Bool)

(declare-fun lt!647254 () (_ BitVec 32))

(declare-fun lt!647253 () (_ BitVec 32))

(assert (=> d!156359 (= lt!647254 (bvmul (bvxor lt!647253 (bvlshr lt!647253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156359 (= lt!647253 ((_ extract 31 0) (bvand (bvxor lt!647117 (bvlshr lt!647117 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156359 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007852 (let ((h!35868 ((_ extract 31 0) (bvand (bvxor lt!647117 (bvlshr lt!647117 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132928 (bvmul (bvxor h!35868 (bvlshr h!35868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132928 (bvlshr x!132928 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007852 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007852 #b00000000000000000000000000000000))))))

(assert (=> d!156359 (= (toIndex!0 lt!647117 mask!2687) (bvand (bvxor lt!647254 (bvlshr lt!647254 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482607 d!156359))

(declare-fun b!1482948 () Bool)

(declare-fun e!831560 () SeekEntryResult!12238)

(assert (=> b!1482948 (= e!831560 (Intermediate!12238 false index!646 x!665))))

(declare-fun b!1482949 () Bool)

(declare-fun lt!647256 () SeekEntryResult!12238)

(assert (=> b!1482949 (and (bvsge (index!51346 lt!647256) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647256) (size!48548 lt!647115)))))

(declare-fun e!831562 () Bool)

(assert (=> b!1482949 (= e!831562 (= (select (arr!47998 lt!647115) (index!51346 lt!647256)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482950 () Bool)

(assert (=> b!1482950 (= e!831560 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!647117 lt!647115 mask!2687))))

(declare-fun b!1482951 () Bool)

(declare-fun e!831561 () SeekEntryResult!12238)

(assert (=> b!1482951 (= e!831561 (Intermediate!12238 true index!646 x!665))))

(declare-fun b!1482952 () Bool)

(assert (=> b!1482952 (and (bvsge (index!51346 lt!647256) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647256) (size!48548 lt!647115)))))

(declare-fun res!1007895 () Bool)

(assert (=> b!1482952 (= res!1007895 (= (select (arr!47998 lt!647115) (index!51346 lt!647256)) lt!647117))))

(assert (=> b!1482952 (=> res!1007895 e!831562)))

(declare-fun e!831563 () Bool)

(assert (=> b!1482952 (= e!831563 e!831562)))

(declare-fun d!156361 () Bool)

(declare-fun e!831564 () Bool)

(assert (=> d!156361 e!831564))

(declare-fun c!137050 () Bool)

(assert (=> d!156361 (= c!137050 (and (is-Intermediate!12238 lt!647256) (undefined!13050 lt!647256)))))

(assert (=> d!156361 (= lt!647256 e!831561)))

(declare-fun c!137051 () Bool)

(assert (=> d!156361 (= c!137051 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!647255 () (_ BitVec 64))

(assert (=> d!156361 (= lt!647255 (select (arr!47998 lt!647115) index!646))))

(assert (=> d!156361 (validMask!0 mask!2687)))

(assert (=> d!156361 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647117 lt!647115 mask!2687) lt!647256)))

(declare-fun b!1482953 () Bool)

(assert (=> b!1482953 (= e!831564 e!831563)))

(declare-fun res!1007894 () Bool)

(assert (=> b!1482953 (= res!1007894 (and (is-Intermediate!12238 lt!647256) (not (undefined!13050 lt!647256)) (bvslt (x!132921 lt!647256) #b01111111111111111111111111111110) (bvsge (x!132921 lt!647256) #b00000000000000000000000000000000) (bvsge (x!132921 lt!647256) x!665)))))

(assert (=> b!1482953 (=> (not res!1007894) (not e!831563))))

(declare-fun b!1482954 () Bool)

(assert (=> b!1482954 (= e!831561 e!831560)))

(declare-fun c!137052 () Bool)

(assert (=> b!1482954 (= c!137052 (or (= lt!647255 lt!647117) (= (bvadd lt!647255 lt!647255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482955 () Bool)

(assert (=> b!1482955 (and (bvsge (index!51346 lt!647256) #b00000000000000000000000000000000) (bvslt (index!51346 lt!647256) (size!48548 lt!647115)))))

(declare-fun res!1007893 () Bool)

(assert (=> b!1482955 (= res!1007893 (= (select (arr!47998 lt!647115) (index!51346 lt!647256)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482955 (=> res!1007893 e!831562)))

(declare-fun b!1482956 () Bool)

(assert (=> b!1482956 (= e!831564 (bvsge (x!132921 lt!647256) #b01111111111111111111111111111110))))

(assert (= (and d!156361 c!137051) b!1482951))

(assert (= (and d!156361 (not c!137051)) b!1482954))

(assert (= (and b!1482954 c!137052) b!1482948))

(assert (= (and b!1482954 (not c!137052)) b!1482950))

(assert (= (and d!156361 c!137050) b!1482956))

(assert (= (and d!156361 (not c!137050)) b!1482953))

(assert (= (and b!1482953 res!1007894) b!1482952))

(assert (= (and b!1482952 (not res!1007895)) b!1482955))

(assert (= (and b!1482955 (not res!1007893)) b!1482949))

(declare-fun m!1368543 () Bool)

(assert (=> b!1482949 m!1368543))

(assert (=> b!1482955 m!1368543))

(assert (=> b!1482952 m!1368543))

(assert (=> d!156361 m!1368399))

(assert (=> d!156361 m!1368327))

(assert (=> b!1482950 m!1368391))

(assert (=> b!1482950 m!1368391))

(declare-fun m!1368545 () Bool)

(assert (=> b!1482950 m!1368545))

(assert (=> b!1482597 d!156361))

(declare-fun d!156363 () Bool)

(assert (=> d!156363 (= (validKeyInArray!0 (select (arr!47998 a!2862) i!1006)) (and (not (= (select (arr!47998 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47998 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482608 d!156363))

(declare-fun b!1482957 () Bool)

(declare-fun e!831566 () Bool)

(declare-fun e!831565 () Bool)

(assert (=> b!1482957 (= e!831566 e!831565)))

(declare-fun lt!647257 () (_ BitVec 64))

(assert (=> b!1482957 (= lt!647257 (select (arr!47998 a!2862) j!93))))

(declare-fun lt!647258 () Unit!49816)

(assert (=> b!1482957 (= lt!647258 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647257 j!93))))

(assert (=> b!1482957 (arrayContainsKey!0 a!2862 lt!647257 #b00000000000000000000000000000000)))

(declare-fun lt!647259 () Unit!49816)

(assert (=> b!1482957 (= lt!647259 lt!647258)))

