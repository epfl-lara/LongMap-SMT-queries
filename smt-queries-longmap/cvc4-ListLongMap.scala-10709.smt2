; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125396 () Bool)

(assert start!125396)

(declare-fun b!1466541 () Bool)

(declare-fun res!995238 () Bool)

(declare-fun e!823896 () Bool)

(assert (=> b!1466541 (=> (not res!995238) (not e!823896))))

(declare-datatypes ((array!98844 0))(
  ( (array!98845 (arr!47710 (Array (_ BitVec 32) (_ BitVec 64))) (size!48260 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98844)

(declare-datatypes ((List!34211 0))(
  ( (Nil!34208) (Cons!34207 (h!35557 (_ BitVec 64)) (t!48905 List!34211)) )
))
(declare-fun arrayNoDuplicates!0 (array!98844 (_ BitVec 32) List!34211) Bool)

(assert (=> b!1466541 (= res!995238 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34208))))

(declare-fun b!1466542 () Bool)

(declare-fun res!995232 () Bool)

(assert (=> b!1466542 (=> (not res!995232) (not e!823896))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466542 (= res!995232 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48260 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48260 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48260 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466543 () Bool)

(declare-fun lt!641789 () array!98844)

(declare-fun lt!641792 () (_ BitVec 64))

(declare-fun lt!641793 () (_ BitVec 32))

(declare-fun e!823898 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11962 0))(
  ( (MissingZero!11962 (index!50240 (_ BitVec 32))) (Found!11962 (index!50241 (_ BitVec 32))) (Intermediate!11962 (undefined!12774 Bool) (index!50242 (_ BitVec 32)) (x!131811 (_ BitVec 32))) (Undefined!11962) (MissingVacant!11962 (index!50243 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98844 (_ BitVec 32)) SeekEntryResult!11962)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98844 (_ BitVec 32)) SeekEntryResult!11962)

(assert (=> b!1466543 (= e!823898 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641793 intermediateAfterIndex!19 lt!641792 lt!641789 mask!2687) (seekEntryOrOpen!0 lt!641792 lt!641789 mask!2687))))))

(declare-fun b!1466544 () Bool)

(declare-fun res!995234 () Bool)

(declare-fun e!823901 () Bool)

(assert (=> b!1466544 (=> (not res!995234) (not e!823901))))

(declare-fun lt!641791 () SeekEntryResult!11962)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98844 (_ BitVec 32)) SeekEntryResult!11962)

(assert (=> b!1466544 (= res!995234 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47710 a!2862) j!93) a!2862 mask!2687) lt!641791))))

(declare-fun b!1466545 () Bool)

(declare-fun e!823899 () Bool)

(assert (=> b!1466545 (= e!823899 true)))

(declare-fun lt!641796 () SeekEntryResult!11962)

(assert (=> b!1466545 (= lt!641796 (seekEntryOrOpen!0 lt!641792 lt!641789 mask!2687))))

(declare-datatypes ((Unit!49420 0))(
  ( (Unit!49421) )
))
(declare-fun lt!641790 () Unit!49420)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49420)

(assert (=> b!1466545 (= lt!641790 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641793 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466546 () Bool)

(declare-fun e!823903 () Bool)

(assert (=> b!1466546 (= e!823903 e!823901)))

(declare-fun res!995228 () Bool)

(assert (=> b!1466546 (=> (not res!995228) (not e!823901))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466546 (= res!995228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47710 a!2862) j!93) mask!2687) (select (arr!47710 a!2862) j!93) a!2862 mask!2687) lt!641791))))

(assert (=> b!1466546 (= lt!641791 (Intermediate!11962 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466547 () Bool)

(declare-fun res!995229 () Bool)

(assert (=> b!1466547 (=> (not res!995229) (not e!823896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466547 (= res!995229 (validKeyInArray!0 (select (arr!47710 a!2862) i!1006)))))

(declare-fun e!823904 () Bool)

(declare-fun b!1466548 () Bool)

(assert (=> b!1466548 (= e!823904 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641792 lt!641789 mask!2687) (seekEntryOrOpen!0 lt!641792 lt!641789 mask!2687)))))

(declare-fun b!1466549 () Bool)

(declare-fun res!995239 () Bool)

(assert (=> b!1466549 (=> res!995239 e!823899)))

(assert (=> b!1466549 (= res!995239 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641793 (select (arr!47710 a!2862) j!93) a!2862 mask!2687) lt!641791)))))

(declare-fun b!1466550 () Bool)

(declare-fun res!995244 () Bool)

(assert (=> b!1466550 (=> (not res!995244) (not e!823896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98844 (_ BitVec 32)) Bool)

(assert (=> b!1466550 (= res!995244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!995233 () Bool)

(assert (=> start!125396 (=> (not res!995233) (not e!823896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125396 (= res!995233 (validMask!0 mask!2687))))

(assert (=> start!125396 e!823896))

(assert (=> start!125396 true))

(declare-fun array_inv!36738 (array!98844) Bool)

(assert (=> start!125396 (array_inv!36738 a!2862)))

(declare-fun b!1466551 () Bool)

(declare-fun e!823900 () Bool)

(declare-fun e!823902 () Bool)

(assert (=> b!1466551 (= e!823900 (not e!823902))))

(declare-fun res!995236 () Bool)

(assert (=> b!1466551 (=> res!995236 e!823902)))

(assert (=> b!1466551 (= res!995236 (or (and (= (select (arr!47710 a!2862) index!646) (select (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47710 a!2862) index!646) (select (arr!47710 a!2862) j!93))) (= (select (arr!47710 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466551 (and (= lt!641796 (Found!11962 j!93)) (or (= (select (arr!47710 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47710 a!2862) intermediateBeforeIndex!19) (select (arr!47710 a!2862) j!93))))))

(assert (=> b!1466551 (= lt!641796 (seekEntryOrOpen!0 (select (arr!47710 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466551 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641794 () Unit!49420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49420)

(assert (=> b!1466551 (= lt!641794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466552 () Bool)

(declare-fun res!995241 () Bool)

(assert (=> b!1466552 (=> (not res!995241) (not e!823896))))

(assert (=> b!1466552 (= res!995241 (and (= (size!48260 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48260 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48260 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466553 () Bool)

(declare-fun res!995242 () Bool)

(assert (=> b!1466553 (=> res!995242 e!823899)))

(assert (=> b!1466553 (= res!995242 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466554 () Bool)

(declare-fun lt!641795 () SeekEntryResult!11962)

(assert (=> b!1466554 (= e!823898 (not (= lt!641795 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641793 lt!641792 lt!641789 mask!2687))))))

(declare-fun b!1466555 () Bool)

(assert (=> b!1466555 (= e!823904 (= lt!641795 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641792 lt!641789 mask!2687)))))

(declare-fun b!1466556 () Bool)

(declare-fun res!995237 () Bool)

(assert (=> b!1466556 (=> (not res!995237) (not e!823900))))

(assert (=> b!1466556 (= res!995237 e!823904)))

(declare-fun c!135168 () Bool)

(assert (=> b!1466556 (= c!135168 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466557 () Bool)

(assert (=> b!1466557 (= e!823902 e!823899)))

(declare-fun res!995235 () Bool)

(assert (=> b!1466557 (=> res!995235 e!823899)))

(assert (=> b!1466557 (= res!995235 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641793 #b00000000000000000000000000000000) (bvsge lt!641793 (size!48260 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466557 (= lt!641793 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466558 () Bool)

(declare-fun res!995240 () Bool)

(assert (=> b!1466558 (=> res!995240 e!823899)))

(assert (=> b!1466558 (= res!995240 e!823898)))

(declare-fun c!135167 () Bool)

(assert (=> b!1466558 (= c!135167 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466559 () Bool)

(assert (=> b!1466559 (= e!823901 e!823900)))

(declare-fun res!995231 () Bool)

(assert (=> b!1466559 (=> (not res!995231) (not e!823900))))

(assert (=> b!1466559 (= res!995231 (= lt!641795 (Intermediate!11962 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466559 (= lt!641795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641792 mask!2687) lt!641792 lt!641789 mask!2687))))

(assert (=> b!1466559 (= lt!641792 (select (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466560 () Bool)

(assert (=> b!1466560 (= e!823896 e!823903)))

(declare-fun res!995243 () Bool)

(assert (=> b!1466560 (=> (not res!995243) (not e!823903))))

(assert (=> b!1466560 (= res!995243 (= (select (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466560 (= lt!641789 (array!98845 (store (arr!47710 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48260 a!2862)))))

(declare-fun b!1466561 () Bool)

(declare-fun res!995230 () Bool)

(assert (=> b!1466561 (=> (not res!995230) (not e!823900))))

(assert (=> b!1466561 (= res!995230 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466562 () Bool)

(declare-fun res!995245 () Bool)

(assert (=> b!1466562 (=> (not res!995245) (not e!823896))))

(assert (=> b!1466562 (= res!995245 (validKeyInArray!0 (select (arr!47710 a!2862) j!93)))))

(assert (= (and start!125396 res!995233) b!1466552))

(assert (= (and b!1466552 res!995241) b!1466547))

(assert (= (and b!1466547 res!995229) b!1466562))

(assert (= (and b!1466562 res!995245) b!1466550))

(assert (= (and b!1466550 res!995244) b!1466541))

(assert (= (and b!1466541 res!995238) b!1466542))

(assert (= (and b!1466542 res!995232) b!1466560))

(assert (= (and b!1466560 res!995243) b!1466546))

(assert (= (and b!1466546 res!995228) b!1466544))

(assert (= (and b!1466544 res!995234) b!1466559))

(assert (= (and b!1466559 res!995231) b!1466556))

(assert (= (and b!1466556 c!135168) b!1466555))

(assert (= (and b!1466556 (not c!135168)) b!1466548))

(assert (= (and b!1466556 res!995237) b!1466561))

(assert (= (and b!1466561 res!995230) b!1466551))

(assert (= (and b!1466551 (not res!995236)) b!1466557))

(assert (= (and b!1466557 (not res!995235)) b!1466549))

(assert (= (and b!1466549 (not res!995239)) b!1466558))

(assert (= (and b!1466558 c!135167) b!1466554))

(assert (= (and b!1466558 (not c!135167)) b!1466543))

(assert (= (and b!1466558 (not res!995240)) b!1466553))

(assert (= (and b!1466553 (not res!995242)) b!1466545))

(declare-fun m!1353523 () Bool)

(assert (=> b!1466554 m!1353523))

(declare-fun m!1353525 () Bool)

(assert (=> b!1466548 m!1353525))

(declare-fun m!1353527 () Bool)

(assert (=> b!1466548 m!1353527))

(declare-fun m!1353529 () Bool)

(assert (=> b!1466544 m!1353529))

(assert (=> b!1466544 m!1353529))

(declare-fun m!1353531 () Bool)

(assert (=> b!1466544 m!1353531))

(assert (=> b!1466545 m!1353527))

(declare-fun m!1353533 () Bool)

(assert (=> b!1466545 m!1353533))

(declare-fun m!1353535 () Bool)

(assert (=> b!1466557 m!1353535))

(declare-fun m!1353537 () Bool)

(assert (=> b!1466551 m!1353537))

(declare-fun m!1353539 () Bool)

(assert (=> b!1466551 m!1353539))

(declare-fun m!1353541 () Bool)

(assert (=> b!1466551 m!1353541))

(declare-fun m!1353543 () Bool)

(assert (=> b!1466551 m!1353543))

(declare-fun m!1353545 () Bool)

(assert (=> b!1466551 m!1353545))

(assert (=> b!1466551 m!1353529))

(declare-fun m!1353547 () Bool)

(assert (=> b!1466551 m!1353547))

(declare-fun m!1353549 () Bool)

(assert (=> b!1466551 m!1353549))

(assert (=> b!1466551 m!1353529))

(declare-fun m!1353551 () Bool)

(assert (=> b!1466543 m!1353551))

(assert (=> b!1466543 m!1353527))

(assert (=> b!1466560 m!1353539))

(declare-fun m!1353553 () Bool)

(assert (=> b!1466560 m!1353553))

(assert (=> b!1466546 m!1353529))

(assert (=> b!1466546 m!1353529))

(declare-fun m!1353555 () Bool)

(assert (=> b!1466546 m!1353555))

(assert (=> b!1466546 m!1353555))

(assert (=> b!1466546 m!1353529))

(declare-fun m!1353557 () Bool)

(assert (=> b!1466546 m!1353557))

(assert (=> b!1466549 m!1353529))

(assert (=> b!1466549 m!1353529))

(declare-fun m!1353559 () Bool)

(assert (=> b!1466549 m!1353559))

(declare-fun m!1353561 () Bool)

(assert (=> b!1466541 m!1353561))

(declare-fun m!1353563 () Bool)

(assert (=> b!1466555 m!1353563))

(declare-fun m!1353565 () Bool)

(assert (=> b!1466550 m!1353565))

(declare-fun m!1353567 () Bool)

(assert (=> start!125396 m!1353567))

(declare-fun m!1353569 () Bool)

(assert (=> start!125396 m!1353569))

(declare-fun m!1353571 () Bool)

(assert (=> b!1466559 m!1353571))

(assert (=> b!1466559 m!1353571))

(declare-fun m!1353573 () Bool)

(assert (=> b!1466559 m!1353573))

(assert (=> b!1466559 m!1353539))

(declare-fun m!1353575 () Bool)

(assert (=> b!1466559 m!1353575))

(assert (=> b!1466562 m!1353529))

(assert (=> b!1466562 m!1353529))

(declare-fun m!1353577 () Bool)

(assert (=> b!1466562 m!1353577))

(declare-fun m!1353579 () Bool)

(assert (=> b!1466547 m!1353579))

(assert (=> b!1466547 m!1353579))

(declare-fun m!1353581 () Bool)

(assert (=> b!1466547 m!1353581))

(push 1)

