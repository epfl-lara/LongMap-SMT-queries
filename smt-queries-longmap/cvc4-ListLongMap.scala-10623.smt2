; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124880 () Bool)

(assert start!124880)

(declare-fun b!1450343 () Bool)

(declare-fun e!816701 () Bool)

(declare-fun e!816704 () Bool)

(assert (=> b!1450343 (= e!816701 e!816704)))

(declare-fun res!981706 () Bool)

(assert (=> b!1450343 (=> (not res!981706) (not e!816704))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11704 0))(
  ( (MissingZero!11704 (index!49208 (_ BitVec 32))) (Found!11704 (index!49209 (_ BitVec 32))) (Intermediate!11704 (undefined!12516 Bool) (index!49210 (_ BitVec 32)) (x!130865 (_ BitVec 32))) (Undefined!11704) (MissingVacant!11704 (index!49211 (_ BitVec 32))) )
))
(declare-fun lt!636261 () SeekEntryResult!11704)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450343 (= res!981706 (= lt!636261 (Intermediate!11704 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636258 () (_ BitVec 64))

(declare-datatypes ((array!98328 0))(
  ( (array!98329 (arr!47452 (Array (_ BitVec 32) (_ BitVec 64))) (size!48002 (_ BitVec 32))) )
))
(declare-fun lt!636257 () array!98328)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98328 (_ BitVec 32)) SeekEntryResult!11704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450343 (= lt!636261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636258 mask!2687) lt!636258 lt!636257 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98328)

(assert (=> b!1450343 (= lt!636258 (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!981707 () Bool)

(declare-fun e!816696 () Bool)

(assert (=> start!124880 (=> (not res!981707) (not e!816696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124880 (= res!981707 (validMask!0 mask!2687))))

(assert (=> start!124880 e!816696))

(assert (=> start!124880 true))

(declare-fun array_inv!36480 (array!98328) Bool)

(assert (=> start!124880 (array_inv!36480 a!2862)))

(declare-fun b!1450344 () Bool)

(declare-fun e!816699 () Bool)

(assert (=> b!1450344 (= e!816704 (not e!816699))))

(declare-fun res!981704 () Bool)

(assert (=> b!1450344 (=> res!981704 e!816699)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450344 (= res!981704 (or (and (= (select (arr!47452 a!2862) index!646) (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47452 a!2862) index!646) (select (arr!47452 a!2862) j!93))) (not (= (select (arr!47452 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816697 () Bool)

(assert (=> b!1450344 e!816697))

(declare-fun res!981692 () Bool)

(assert (=> b!1450344 (=> (not res!981692) (not e!816697))))

(declare-fun lt!636260 () SeekEntryResult!11704)

(declare-fun lt!636254 () SeekEntryResult!11704)

(assert (=> b!1450344 (= res!981692 (and (= lt!636254 lt!636260) (or (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) (select (arr!47452 a!2862) j!93)))))))

(assert (=> b!1450344 (= lt!636260 (Found!11704 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98328 (_ BitVec 32)) SeekEntryResult!11704)

(assert (=> b!1450344 (= lt!636254 (seekEntryOrOpen!0 (select (arr!47452 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98328 (_ BitVec 32)) Bool)

(assert (=> b!1450344 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48904 0))(
  ( (Unit!48905) )
))
(declare-fun lt!636259 () Unit!48904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48904)

(assert (=> b!1450344 (= lt!636259 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450345 () Bool)

(assert (=> b!1450345 (= e!816699 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98328 (_ BitVec 32)) SeekEntryResult!11704)

(assert (=> b!1450345 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636258 lt!636257 mask!2687) lt!636260)))

(declare-fun lt!636256 () Unit!48904)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48904)

(assert (=> b!1450345 (= lt!636256 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450346 () Bool)

(declare-fun e!816695 () Bool)

(assert (=> b!1450346 (= e!816695 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636258 lt!636257 mask!2687) (seekEntryOrOpen!0 lt!636258 lt!636257 mask!2687)))))

(declare-fun b!1450347 () Bool)

(declare-fun res!981694 () Bool)

(assert (=> b!1450347 (=> (not res!981694) (not e!816696))))

(assert (=> b!1450347 (= res!981694 (and (= (size!48002 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48002 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48002 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450348 () Bool)

(declare-fun e!816703 () Bool)

(assert (=> b!1450348 (= e!816703 e!816701)))

(declare-fun res!981702 () Bool)

(assert (=> b!1450348 (=> (not res!981702) (not e!816701))))

(declare-fun lt!636255 () SeekEntryResult!11704)

(assert (=> b!1450348 (= res!981702 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47452 a!2862) j!93) mask!2687) (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!636255))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1450348 (= lt!636255 (Intermediate!11704 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!816698 () Bool)

(declare-fun b!1450349 () Bool)

(assert (=> b!1450349 (= e!816698 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450350 () Bool)

(declare-fun res!981705 () Bool)

(assert (=> b!1450350 (=> (not res!981705) (not e!816696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450350 (= res!981705 (validKeyInArray!0 (select (arr!47452 a!2862) j!93)))))

(declare-fun b!1450351 () Bool)

(declare-fun res!981709 () Bool)

(assert (=> b!1450351 (=> (not res!981709) (not e!816696))))

(assert (=> b!1450351 (= res!981709 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48002 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48002 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48002 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450352 () Bool)

(declare-fun res!981693 () Bool)

(assert (=> b!1450352 (=> (not res!981693) (not e!816704))))

(assert (=> b!1450352 (= res!981693 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450353 () Bool)

(assert (=> b!1450353 (= e!816696 e!816703)))

(declare-fun res!981700 () Bool)

(assert (=> b!1450353 (=> (not res!981700) (not e!816703))))

(assert (=> b!1450353 (= res!981700 (= (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450353 (= lt!636257 (array!98329 (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48002 a!2862)))))

(declare-fun b!1450354 () Bool)

(declare-fun res!981695 () Bool)

(assert (=> b!1450354 (=> (not res!981695) (not e!816704))))

(assert (=> b!1450354 (= res!981695 e!816695)))

(declare-fun c!133836 () Bool)

(assert (=> b!1450354 (= c!133836 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450355 () Bool)

(assert (=> b!1450355 (= e!816695 (= lt!636261 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636258 lt!636257 mask!2687)))))

(declare-fun b!1450356 () Bool)

(declare-fun e!816702 () Bool)

(assert (=> b!1450356 (= e!816697 e!816702)))

(declare-fun res!981696 () Bool)

(assert (=> b!1450356 (=> res!981696 e!816702)))

(assert (=> b!1450356 (= res!981696 (or (and (= (select (arr!47452 a!2862) index!646) (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47452 a!2862) index!646) (select (arr!47452 a!2862) j!93))) (not (= (select (arr!47452 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450357 () Bool)

(declare-fun res!981698 () Bool)

(assert (=> b!1450357 (=> (not res!981698) (not e!816701))))

(assert (=> b!1450357 (= res!981698 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!636255))))

(declare-fun b!1450358 () Bool)

(assert (=> b!1450358 (= e!816702 e!816698)))

(declare-fun res!981701 () Bool)

(assert (=> b!1450358 (=> (not res!981701) (not e!816698))))

(assert (=> b!1450358 (= res!981701 (= lt!636254 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47452 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450359 () Bool)

(declare-fun res!981697 () Bool)

(assert (=> b!1450359 (=> (not res!981697) (not e!816696))))

(declare-datatypes ((List!33953 0))(
  ( (Nil!33950) (Cons!33949 (h!35299 (_ BitVec 64)) (t!48647 List!33953)) )
))
(declare-fun arrayNoDuplicates!0 (array!98328 (_ BitVec 32) List!33953) Bool)

(assert (=> b!1450359 (= res!981697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33950))))

(declare-fun b!1450360 () Bool)

(declare-fun res!981703 () Bool)

(assert (=> b!1450360 (=> (not res!981703) (not e!816696))))

(assert (=> b!1450360 (= res!981703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450361 () Bool)

(declare-fun res!981699 () Bool)

(assert (=> b!1450361 (=> (not res!981699) (not e!816696))))

(assert (=> b!1450361 (= res!981699 (validKeyInArray!0 (select (arr!47452 a!2862) i!1006)))))

(declare-fun b!1450362 () Bool)

(declare-fun res!981708 () Bool)

(assert (=> b!1450362 (=> res!981708 e!816699)))

(assert (=> b!1450362 (= res!981708 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!636260)))))

(assert (= (and start!124880 res!981707) b!1450347))

(assert (= (and b!1450347 res!981694) b!1450361))

(assert (= (and b!1450361 res!981699) b!1450350))

(assert (= (and b!1450350 res!981705) b!1450360))

(assert (= (and b!1450360 res!981703) b!1450359))

(assert (= (and b!1450359 res!981697) b!1450351))

(assert (= (and b!1450351 res!981709) b!1450353))

(assert (= (and b!1450353 res!981700) b!1450348))

(assert (= (and b!1450348 res!981702) b!1450357))

(assert (= (and b!1450357 res!981698) b!1450343))

(assert (= (and b!1450343 res!981706) b!1450354))

(assert (= (and b!1450354 c!133836) b!1450355))

(assert (= (and b!1450354 (not c!133836)) b!1450346))

(assert (= (and b!1450354 res!981695) b!1450352))

(assert (= (and b!1450352 res!981693) b!1450344))

(assert (= (and b!1450344 res!981692) b!1450356))

(assert (= (and b!1450356 (not res!981696)) b!1450358))

(assert (= (and b!1450358 res!981701) b!1450349))

(assert (= (and b!1450344 (not res!981704)) b!1450362))

(assert (= (and b!1450362 (not res!981708)) b!1450345))

(declare-fun m!1338995 () Bool)

(assert (=> start!124880 m!1338995))

(declare-fun m!1338997 () Bool)

(assert (=> start!124880 m!1338997))

(declare-fun m!1338999 () Bool)

(assert (=> b!1450344 m!1338999))

(declare-fun m!1339001 () Bool)

(assert (=> b!1450344 m!1339001))

(declare-fun m!1339003 () Bool)

(assert (=> b!1450344 m!1339003))

(declare-fun m!1339005 () Bool)

(assert (=> b!1450344 m!1339005))

(declare-fun m!1339007 () Bool)

(assert (=> b!1450344 m!1339007))

(declare-fun m!1339009 () Bool)

(assert (=> b!1450344 m!1339009))

(declare-fun m!1339011 () Bool)

(assert (=> b!1450344 m!1339011))

(declare-fun m!1339013 () Bool)

(assert (=> b!1450344 m!1339013))

(assert (=> b!1450344 m!1339009))

(declare-fun m!1339015 () Bool)

(assert (=> b!1450360 m!1339015))

(assert (=> b!1450357 m!1339009))

(assert (=> b!1450357 m!1339009))

(declare-fun m!1339017 () Bool)

(assert (=> b!1450357 m!1339017))

(declare-fun m!1339019 () Bool)

(assert (=> b!1450361 m!1339019))

(assert (=> b!1450361 m!1339019))

(declare-fun m!1339021 () Bool)

(assert (=> b!1450361 m!1339021))

(declare-fun m!1339023 () Bool)

(assert (=> b!1450346 m!1339023))

(declare-fun m!1339025 () Bool)

(assert (=> b!1450346 m!1339025))

(declare-fun m!1339027 () Bool)

(assert (=> b!1450359 m!1339027))

(assert (=> b!1450356 m!1339007))

(assert (=> b!1450356 m!1339001))

(assert (=> b!1450356 m!1339005))

(assert (=> b!1450356 m!1339009))

(assert (=> b!1450358 m!1339009))

(assert (=> b!1450358 m!1339009))

(declare-fun m!1339029 () Bool)

(assert (=> b!1450358 m!1339029))

(assert (=> b!1450353 m!1339001))

(declare-fun m!1339031 () Bool)

(assert (=> b!1450353 m!1339031))

(declare-fun m!1339033 () Bool)

(assert (=> b!1450355 m!1339033))

(assert (=> b!1450348 m!1339009))

(assert (=> b!1450348 m!1339009))

(declare-fun m!1339035 () Bool)

(assert (=> b!1450348 m!1339035))

(assert (=> b!1450348 m!1339035))

(assert (=> b!1450348 m!1339009))

(declare-fun m!1339037 () Bool)

(assert (=> b!1450348 m!1339037))

(assert (=> b!1450345 m!1339023))

(declare-fun m!1339039 () Bool)

(assert (=> b!1450345 m!1339039))

(assert (=> b!1450362 m!1339009))

(assert (=> b!1450362 m!1339009))

(declare-fun m!1339041 () Bool)

(assert (=> b!1450362 m!1339041))

(declare-fun m!1339043 () Bool)

(assert (=> b!1450343 m!1339043))

(assert (=> b!1450343 m!1339043))

(declare-fun m!1339045 () Bool)

(assert (=> b!1450343 m!1339045))

(assert (=> b!1450343 m!1339001))

(declare-fun m!1339047 () Bool)

(assert (=> b!1450343 m!1339047))

(assert (=> b!1450350 m!1339009))

(assert (=> b!1450350 m!1339009))

(declare-fun m!1339049 () Bool)

(assert (=> b!1450350 m!1339049))

(push 1)

