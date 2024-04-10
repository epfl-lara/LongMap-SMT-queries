; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125912 () Bool)

(assert start!125912)

(declare-fun b!1474314 () Bool)

(declare-fun res!1001537 () Bool)

(declare-fun e!827221 () Bool)

(assert (=> b!1474314 (=> (not res!1001537) (not e!827221))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474314 (= res!1001537 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474315 () Bool)

(declare-fun res!1001536 () Bool)

(declare-fun e!827224 () Bool)

(assert (=> b!1474315 (=> (not res!1001536) (not e!827224))))

(declare-datatypes ((array!99189 0))(
  ( (array!99190 (arr!47878 (Array (_ BitVec 32) (_ BitVec 64))) (size!48428 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99189)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474315 (= res!1001536 (validKeyInArray!0 (select (arr!47878 a!2862) j!93)))))

(declare-fun b!1474316 () Bool)

(declare-fun res!1001531 () Bool)

(assert (=> b!1474316 (=> (not res!1001531) (not e!827224))))

(declare-datatypes ((List!34379 0))(
  ( (Nil!34376) (Cons!34375 (h!35734 (_ BitVec 64)) (t!49073 List!34379)) )
))
(declare-fun arrayNoDuplicates!0 (array!99189 (_ BitVec 32) List!34379) Bool)

(assert (=> b!1474316 (= res!1001531 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34376))))

(declare-fun b!1474317 () Bool)

(declare-fun res!1001535 () Bool)

(assert (=> b!1474317 (=> (not res!1001535) (not e!827221))))

(declare-fun e!827223 () Bool)

(assert (=> b!1474317 (= res!1001535 e!827223)))

(declare-fun c!135906 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474317 (= c!135906 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474318 () Bool)

(assert (=> b!1474318 (= e!827221 (not true))))

(declare-fun e!827219 () Bool)

(assert (=> b!1474318 e!827219))

(declare-fun res!1001533 () Bool)

(assert (=> b!1474318 (=> (not res!1001533) (not e!827219))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99189 (_ BitVec 32)) Bool)

(assert (=> b!1474318 (= res!1001533 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49576 0))(
  ( (Unit!49577) )
))
(declare-fun lt!644216 () Unit!49576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49576)

(assert (=> b!1474318 (= lt!644216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474319 () Bool)

(declare-fun res!1001540 () Bool)

(assert (=> b!1474319 (=> (not res!1001540) (not e!827224))))

(assert (=> b!1474319 (= res!1001540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474320 () Bool)

(declare-fun res!1001545 () Bool)

(assert (=> b!1474320 (=> (not res!1001545) (not e!827224))))

(assert (=> b!1474320 (= res!1001545 (validKeyInArray!0 (select (arr!47878 a!2862) i!1006)))))

(declare-fun b!1474321 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1474321 (= e!827219 (or (= (select (arr!47878 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47878 a!2862) intermediateBeforeIndex!19) (select (arr!47878 a!2862) j!93))))))

(declare-fun lt!644214 () (_ BitVec 64))

(declare-fun b!1474322 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644215 () array!99189)

(declare-datatypes ((SeekEntryResult!12118 0))(
  ( (MissingZero!12118 (index!50864 (_ BitVec 32))) (Found!12118 (index!50865 (_ BitVec 32))) (Intermediate!12118 (undefined!12930 Bool) (index!50866 (_ BitVec 32)) (x!132442 (_ BitVec 32))) (Undefined!12118) (MissingVacant!12118 (index!50867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99189 (_ BitVec 32)) SeekEntryResult!12118)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99189 (_ BitVec 32)) SeekEntryResult!12118)

(assert (=> b!1474322 (= e!827223 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644214 lt!644215 mask!2687) (seekEntryOrOpen!0 lt!644214 lt!644215 mask!2687)))))

(declare-fun b!1474323 () Bool)

(declare-fun e!827220 () Bool)

(declare-fun e!827222 () Bool)

(assert (=> b!1474323 (= e!827220 e!827222)))

(declare-fun res!1001544 () Bool)

(assert (=> b!1474323 (=> (not res!1001544) (not e!827222))))

(declare-fun lt!644213 () SeekEntryResult!12118)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99189 (_ BitVec 32)) SeekEntryResult!12118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474323 (= res!1001544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47878 a!2862) j!93) mask!2687) (select (arr!47878 a!2862) j!93) a!2862 mask!2687) lt!644213))))

(assert (=> b!1474323 (= lt!644213 (Intermediate!12118 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474324 () Bool)

(declare-fun res!1001534 () Bool)

(assert (=> b!1474324 (=> (not res!1001534) (not e!827219))))

(assert (=> b!1474324 (= res!1001534 (= (seekEntryOrOpen!0 (select (arr!47878 a!2862) j!93) a!2862 mask!2687) (Found!12118 j!93)))))

(declare-fun b!1474313 () Bool)

(declare-fun res!1001538 () Bool)

(assert (=> b!1474313 (=> (not res!1001538) (not e!827224))))

(assert (=> b!1474313 (= res!1001538 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48428 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48428 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48428 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1001541 () Bool)

(assert (=> start!125912 (=> (not res!1001541) (not e!827224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125912 (= res!1001541 (validMask!0 mask!2687))))

(assert (=> start!125912 e!827224))

(assert (=> start!125912 true))

(declare-fun array_inv!36906 (array!99189) Bool)

(assert (=> start!125912 (array_inv!36906 a!2862)))

(declare-fun b!1474325 () Bool)

(declare-fun res!1001539 () Bool)

(assert (=> b!1474325 (=> (not res!1001539) (not e!827224))))

(assert (=> b!1474325 (= res!1001539 (and (= (size!48428 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48428 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48428 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474326 () Bool)

(declare-fun lt!644217 () SeekEntryResult!12118)

(assert (=> b!1474326 (= e!827223 (= lt!644217 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644214 lt!644215 mask!2687)))))

(declare-fun b!1474327 () Bool)

(assert (=> b!1474327 (= e!827222 e!827221)))

(declare-fun res!1001542 () Bool)

(assert (=> b!1474327 (=> (not res!1001542) (not e!827221))))

(assert (=> b!1474327 (= res!1001542 (= lt!644217 (Intermediate!12118 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474327 (= lt!644217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644214 mask!2687) lt!644214 lt!644215 mask!2687))))

(assert (=> b!1474327 (= lt!644214 (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474328 () Bool)

(declare-fun res!1001543 () Bool)

(assert (=> b!1474328 (=> (not res!1001543) (not e!827222))))

(assert (=> b!1474328 (= res!1001543 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47878 a!2862) j!93) a!2862 mask!2687) lt!644213))))

(declare-fun b!1474329 () Bool)

(assert (=> b!1474329 (= e!827224 e!827220)))

(declare-fun res!1001532 () Bool)

(assert (=> b!1474329 (=> (not res!1001532) (not e!827220))))

(assert (=> b!1474329 (= res!1001532 (= (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474329 (= lt!644215 (array!99190 (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48428 a!2862)))))

(assert (= (and start!125912 res!1001541) b!1474325))

(assert (= (and b!1474325 res!1001539) b!1474320))

(assert (= (and b!1474320 res!1001545) b!1474315))

(assert (= (and b!1474315 res!1001536) b!1474319))

(assert (= (and b!1474319 res!1001540) b!1474316))

(assert (= (and b!1474316 res!1001531) b!1474313))

(assert (= (and b!1474313 res!1001538) b!1474329))

(assert (= (and b!1474329 res!1001532) b!1474323))

(assert (= (and b!1474323 res!1001544) b!1474328))

(assert (= (and b!1474328 res!1001543) b!1474327))

(assert (= (and b!1474327 res!1001542) b!1474317))

(assert (= (and b!1474317 c!135906) b!1474326))

(assert (= (and b!1474317 (not c!135906)) b!1474322))

(assert (= (and b!1474317 res!1001535) b!1474314))

(assert (= (and b!1474314 res!1001537) b!1474318))

(assert (= (and b!1474318 res!1001533) b!1474324))

(assert (= (and b!1474324 res!1001534) b!1474321))

(declare-fun m!1360773 () Bool)

(assert (=> b!1474324 m!1360773))

(assert (=> b!1474324 m!1360773))

(declare-fun m!1360775 () Bool)

(assert (=> b!1474324 m!1360775))

(declare-fun m!1360777 () Bool)

(assert (=> start!125912 m!1360777))

(declare-fun m!1360779 () Bool)

(assert (=> start!125912 m!1360779))

(declare-fun m!1360781 () Bool)

(assert (=> b!1474320 m!1360781))

(assert (=> b!1474320 m!1360781))

(declare-fun m!1360783 () Bool)

(assert (=> b!1474320 m!1360783))

(assert (=> b!1474323 m!1360773))

(assert (=> b!1474323 m!1360773))

(declare-fun m!1360785 () Bool)

(assert (=> b!1474323 m!1360785))

(assert (=> b!1474323 m!1360785))

(assert (=> b!1474323 m!1360773))

(declare-fun m!1360787 () Bool)

(assert (=> b!1474323 m!1360787))

(declare-fun m!1360789 () Bool)

(assert (=> b!1474316 m!1360789))

(declare-fun m!1360791 () Bool)

(assert (=> b!1474318 m!1360791))

(declare-fun m!1360793 () Bool)

(assert (=> b!1474318 m!1360793))

(declare-fun m!1360795 () Bool)

(assert (=> b!1474319 m!1360795))

(declare-fun m!1360797 () Bool)

(assert (=> b!1474329 m!1360797))

(declare-fun m!1360799 () Bool)

(assert (=> b!1474329 m!1360799))

(assert (=> b!1474328 m!1360773))

(assert (=> b!1474328 m!1360773))

(declare-fun m!1360801 () Bool)

(assert (=> b!1474328 m!1360801))

(declare-fun m!1360803 () Bool)

(assert (=> b!1474327 m!1360803))

(assert (=> b!1474327 m!1360803))

(declare-fun m!1360805 () Bool)

(assert (=> b!1474327 m!1360805))

(assert (=> b!1474327 m!1360797))

(declare-fun m!1360807 () Bool)

(assert (=> b!1474327 m!1360807))

(declare-fun m!1360809 () Bool)

(assert (=> b!1474326 m!1360809))

(declare-fun m!1360811 () Bool)

(assert (=> b!1474322 m!1360811))

(declare-fun m!1360813 () Bool)

(assert (=> b!1474322 m!1360813))

(declare-fun m!1360815 () Bool)

(assert (=> b!1474321 m!1360815))

(assert (=> b!1474321 m!1360773))

(assert (=> b!1474315 m!1360773))

(assert (=> b!1474315 m!1360773))

(declare-fun m!1360817 () Bool)

(assert (=> b!1474315 m!1360817))

(push 1)

