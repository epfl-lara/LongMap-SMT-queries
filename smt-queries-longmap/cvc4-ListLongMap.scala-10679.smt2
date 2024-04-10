; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125216 () Bool)

(assert start!125216)

(declare-fun b!1460651 () Bool)

(declare-fun e!821267 () Bool)

(declare-fun e!821263 () Bool)

(assert (=> b!1460651 (= e!821267 e!821263)))

(declare-fun res!990402 () Bool)

(assert (=> b!1460651 (=> (not res!990402) (not e!821263))))

(declare-datatypes ((SeekEntryResult!11872 0))(
  ( (MissingZero!11872 (index!49880 (_ BitVec 32))) (Found!11872 (index!49881 (_ BitVec 32))) (Intermediate!11872 (undefined!12684 Bool) (index!49882 (_ BitVec 32)) (x!131481 (_ BitVec 32))) (Undefined!11872) (MissingVacant!11872 (index!49883 (_ BitVec 32))) )
))
(declare-fun lt!639888 () SeekEntryResult!11872)

(declare-datatypes ((array!98664 0))(
  ( (array!98665 (arr!47620 (Array (_ BitVec 32) (_ BitVec 64))) (size!48170 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98664)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98664 (_ BitVec 32)) SeekEntryResult!11872)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460651 (= res!990402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47620 a!2862) j!93) mask!2687) (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!639888))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460651 (= lt!639888 (Intermediate!11872 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460652 () Bool)

(declare-fun res!990400 () Bool)

(declare-fun e!821265 () Bool)

(assert (=> b!1460652 (=> (not res!990400) (not e!821265))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460652 (= res!990400 (validKeyInArray!0 (select (arr!47620 a!2862) i!1006)))))

(declare-fun b!1460653 () Bool)

(declare-fun res!990407 () Bool)

(declare-fun e!821261 () Bool)

(assert (=> b!1460653 (=> (not res!990407) (not e!821261))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460653 (= res!990407 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460654 () Bool)

(assert (=> b!1460654 (= e!821265 e!821267)))

(declare-fun res!990406 () Bool)

(assert (=> b!1460654 (=> (not res!990406) (not e!821267))))

(assert (=> b!1460654 (= res!990406 (= (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639885 () array!98664)

(assert (=> b!1460654 (= lt!639885 (array!98665 (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48170 a!2862)))))

(declare-fun e!821266 () Bool)

(declare-fun b!1460655 () Bool)

(assert (=> b!1460655 (= e!821266 (or (= (select (arr!47620 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47620 a!2862) intermediateBeforeIndex!19) (select (arr!47620 a!2862) j!93))))))

(declare-fun b!1460656 () Bool)

(declare-fun res!990412 () Bool)

(assert (=> b!1460656 (=> (not res!990412) (not e!821265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98664 (_ BitVec 32)) Bool)

(assert (=> b!1460656 (= res!990412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1460657 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460657 (= e!821261 (not (or (and (= (select (arr!47620 a!2862) index!646) (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47620 a!2862) index!646) (select (arr!47620 a!2862) j!93))) (= (select (arr!47620 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1460657 e!821266))

(declare-fun res!990410 () Bool)

(assert (=> b!1460657 (=> (not res!990410) (not e!821266))))

(assert (=> b!1460657 (= res!990410 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49240 0))(
  ( (Unit!49241) )
))
(declare-fun lt!639884 () Unit!49240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49240)

(assert (=> b!1460657 (= lt!639884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460658 () Bool)

(assert (=> b!1460658 (= e!821263 e!821261)))

(declare-fun res!990401 () Bool)

(assert (=> b!1460658 (=> (not res!990401) (not e!821261))))

(declare-fun lt!639886 () SeekEntryResult!11872)

(assert (=> b!1460658 (= res!990401 (= lt!639886 (Intermediate!11872 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639887 () (_ BitVec 64))

(assert (=> b!1460658 (= lt!639886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639887 mask!2687) lt!639887 lt!639885 mask!2687))))

(assert (=> b!1460658 (= lt!639887 (select (store (arr!47620 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460659 () Bool)

(declare-fun res!990405 () Bool)

(assert (=> b!1460659 (=> (not res!990405) (not e!821265))))

(assert (=> b!1460659 (= res!990405 (validKeyInArray!0 (select (arr!47620 a!2862) j!93)))))

(declare-fun b!1460660 () Bool)

(declare-fun res!990411 () Bool)

(assert (=> b!1460660 (=> (not res!990411) (not e!821263))))

(assert (=> b!1460660 (= res!990411 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) lt!639888))))

(declare-fun b!1460661 () Bool)

(declare-fun e!821262 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98664 (_ BitVec 32)) SeekEntryResult!11872)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98664 (_ BitVec 32)) SeekEntryResult!11872)

(assert (=> b!1460661 (= e!821262 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639887 lt!639885 mask!2687) (seekEntryOrOpen!0 lt!639887 lt!639885 mask!2687)))))

(declare-fun res!990409 () Bool)

(assert (=> start!125216 (=> (not res!990409) (not e!821265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125216 (= res!990409 (validMask!0 mask!2687))))

(assert (=> start!125216 e!821265))

(assert (=> start!125216 true))

(declare-fun array_inv!36648 (array!98664) Bool)

(assert (=> start!125216 (array_inv!36648 a!2862)))

(declare-fun b!1460662 () Bool)

(declare-fun res!990399 () Bool)

(assert (=> b!1460662 (=> (not res!990399) (not e!821261))))

(assert (=> b!1460662 (= res!990399 e!821262)))

(declare-fun c!134637 () Bool)

(assert (=> b!1460662 (= c!134637 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460663 () Bool)

(declare-fun res!990404 () Bool)

(assert (=> b!1460663 (=> (not res!990404) (not e!821265))))

(declare-datatypes ((List!34121 0))(
  ( (Nil!34118) (Cons!34117 (h!35467 (_ BitVec 64)) (t!48815 List!34121)) )
))
(declare-fun arrayNoDuplicates!0 (array!98664 (_ BitVec 32) List!34121) Bool)

(assert (=> b!1460663 (= res!990404 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34118))))

(declare-fun b!1460664 () Bool)

(declare-fun res!990403 () Bool)

(assert (=> b!1460664 (=> (not res!990403) (not e!821266))))

(assert (=> b!1460664 (= res!990403 (= (seekEntryOrOpen!0 (select (arr!47620 a!2862) j!93) a!2862 mask!2687) (Found!11872 j!93)))))

(declare-fun b!1460665 () Bool)

(declare-fun res!990408 () Bool)

(assert (=> b!1460665 (=> (not res!990408) (not e!821265))))

(assert (=> b!1460665 (= res!990408 (and (= (size!48170 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48170 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48170 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460666 () Bool)

(declare-fun res!990398 () Bool)

(assert (=> b!1460666 (=> (not res!990398) (not e!821265))))

(assert (=> b!1460666 (= res!990398 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48170 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48170 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48170 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460667 () Bool)

(assert (=> b!1460667 (= e!821262 (= lt!639886 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639887 lt!639885 mask!2687)))))

(assert (= (and start!125216 res!990409) b!1460665))

(assert (= (and b!1460665 res!990408) b!1460652))

(assert (= (and b!1460652 res!990400) b!1460659))

(assert (= (and b!1460659 res!990405) b!1460656))

(assert (= (and b!1460656 res!990412) b!1460663))

(assert (= (and b!1460663 res!990404) b!1460666))

(assert (= (and b!1460666 res!990398) b!1460654))

(assert (= (and b!1460654 res!990406) b!1460651))

(assert (= (and b!1460651 res!990402) b!1460660))

(assert (= (and b!1460660 res!990411) b!1460658))

(assert (= (and b!1460658 res!990401) b!1460662))

(assert (= (and b!1460662 c!134637) b!1460667))

(assert (= (and b!1460662 (not c!134637)) b!1460661))

(assert (= (and b!1460662 res!990399) b!1460653))

(assert (= (and b!1460653 res!990407) b!1460657))

(assert (= (and b!1460657 res!990410) b!1460664))

(assert (= (and b!1460664 res!990403) b!1460655))

(declare-fun m!1348325 () Bool)

(assert (=> b!1460663 m!1348325))

(declare-fun m!1348327 () Bool)

(assert (=> b!1460664 m!1348327))

(assert (=> b!1460664 m!1348327))

(declare-fun m!1348329 () Bool)

(assert (=> b!1460664 m!1348329))

(declare-fun m!1348331 () Bool)

(assert (=> b!1460657 m!1348331))

(declare-fun m!1348333 () Bool)

(assert (=> b!1460657 m!1348333))

(declare-fun m!1348335 () Bool)

(assert (=> b!1460657 m!1348335))

(declare-fun m!1348337 () Bool)

(assert (=> b!1460657 m!1348337))

(declare-fun m!1348339 () Bool)

(assert (=> b!1460657 m!1348339))

(assert (=> b!1460657 m!1348327))

(declare-fun m!1348341 () Bool)

(assert (=> b!1460661 m!1348341))

(declare-fun m!1348343 () Bool)

(assert (=> b!1460661 m!1348343))

(declare-fun m!1348345 () Bool)

(assert (=> b!1460652 m!1348345))

(assert (=> b!1460652 m!1348345))

(declare-fun m!1348347 () Bool)

(assert (=> b!1460652 m!1348347))

(declare-fun m!1348349 () Bool)

(assert (=> start!125216 m!1348349))

(declare-fun m!1348351 () Bool)

(assert (=> start!125216 m!1348351))

(declare-fun m!1348353 () Bool)

(assert (=> b!1460656 m!1348353))

(assert (=> b!1460659 m!1348327))

(assert (=> b!1460659 m!1348327))

(declare-fun m!1348355 () Bool)

(assert (=> b!1460659 m!1348355))

(assert (=> b!1460660 m!1348327))

(assert (=> b!1460660 m!1348327))

(declare-fun m!1348357 () Bool)

(assert (=> b!1460660 m!1348357))

(declare-fun m!1348359 () Bool)

(assert (=> b!1460655 m!1348359))

(assert (=> b!1460655 m!1348327))

(assert (=> b!1460654 m!1348333))

(declare-fun m!1348361 () Bool)

(assert (=> b!1460654 m!1348361))

(assert (=> b!1460651 m!1348327))

(assert (=> b!1460651 m!1348327))

(declare-fun m!1348363 () Bool)

(assert (=> b!1460651 m!1348363))

(assert (=> b!1460651 m!1348363))

(assert (=> b!1460651 m!1348327))

(declare-fun m!1348365 () Bool)

(assert (=> b!1460651 m!1348365))

(declare-fun m!1348367 () Bool)

(assert (=> b!1460658 m!1348367))

(assert (=> b!1460658 m!1348367))

(declare-fun m!1348369 () Bool)

(assert (=> b!1460658 m!1348369))

(assert (=> b!1460658 m!1348333))

(declare-fun m!1348371 () Bool)

(assert (=> b!1460658 m!1348371))

(declare-fun m!1348373 () Bool)

(assert (=> b!1460667 m!1348373))

(push 1)

(assert (not start!125216))

(assert (not b!1460661))

(assert (not b!1460657))

(assert (not b!1460660))

(assert (not b!1460656))

(assert (not b!1460663))

(assert (not b!1460664))

(assert (not b!1460651))

(assert (not b!1460658))

(assert (not b!1460652))

(assert (not b!1460659))

(assert (not b!1460667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

