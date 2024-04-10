; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126382 () Bool)

(assert start!126382)

(declare-fun b!1481567 () Bool)

(declare-fun res!1006884 () Bool)

(declare-fun e!830930 () Bool)

(assert (=> b!1481567 (=> (not res!1006884) (not e!830930))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12218 0))(
  ( (MissingZero!12218 (index!51264 (_ BitVec 32))) (Found!12218 (index!51265 (_ BitVec 32))) (Intermediate!12218 (undefined!13030 Bool) (index!51266 (_ BitVec 32)) (x!132853 (_ BitVec 32))) (Undefined!12218) (MissingVacant!12218 (index!51267 (_ BitVec 32))) )
))
(declare-fun lt!646818 () SeekEntryResult!12218)

(declare-datatypes ((array!99401 0))(
  ( (array!99402 (arr!47978 (Array (_ BitVec 32) (_ BitVec 64))) (size!48528 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99401)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99401 (_ BitVec 32)) SeekEntryResult!12218)

(assert (=> b!1481567 (= res!1006884 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47978 a!2862) j!93) a!2862 mask!2687) lt!646818))))

(declare-fun b!1481568 () Bool)

(declare-fun res!1006879 () Bool)

(declare-fun e!830928 () Bool)

(assert (=> b!1481568 (=> (not res!1006879) (not e!830928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99401 (_ BitVec 32)) Bool)

(assert (=> b!1481568 (= res!1006879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1481569 () Bool)

(declare-fun e!830929 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1481569 (= e!830929 (and (or (= (select (arr!47978 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47978 a!2862) intermediateBeforeIndex!19) (select (arr!47978 a!2862) j!93))) (or (and (= (select (arr!47978 a!2862) index!646) (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47978 a!2862) index!646) (select (arr!47978 a!2862) j!93))) (= (select (arr!47978 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481570 () Bool)

(declare-fun res!1006881 () Bool)

(assert (=> b!1481570 (=> (not res!1006881) (not e!830928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481570 (= res!1006881 (validKeyInArray!0 (select (arr!47978 a!2862) j!93)))))

(declare-fun b!1481571 () Bool)

(declare-fun e!830931 () Bool)

(assert (=> b!1481571 (= e!830931 e!830930)))

(declare-fun res!1006888 () Bool)

(assert (=> b!1481571 (=> (not res!1006888) (not e!830930))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481571 (= res!1006888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47978 a!2862) j!93) mask!2687) (select (arr!47978 a!2862) j!93) a!2862 mask!2687) lt!646818))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481571 (= lt!646818 (Intermediate!12218 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481572 () Bool)

(declare-fun res!1006882 () Bool)

(assert (=> b!1481572 (=> (not res!1006882) (not e!830928))))

(assert (=> b!1481572 (= res!1006882 (and (= (size!48528 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48528 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48528 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481573 () Bool)

(assert (=> b!1481573 (= e!830928 e!830931)))

(declare-fun res!1006877 () Bool)

(assert (=> b!1481573 (=> (not res!1006877) (not e!830931))))

(assert (=> b!1481573 (= res!1006877 (= (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646814 () array!99401)

(assert (=> b!1481573 (= lt!646814 (array!99402 (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48528 a!2862)))))

(declare-fun b!1481574 () Bool)

(declare-fun res!1006885 () Bool)

(assert (=> b!1481574 (=> (not res!1006885) (not e!830928))))

(assert (=> b!1481574 (= res!1006885 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48528 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48528 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48528 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!646816 () (_ BitVec 64))

(declare-fun e!830933 () Bool)

(declare-fun b!1481575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99401 (_ BitVec 32)) SeekEntryResult!12218)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99401 (_ BitVec 32)) SeekEntryResult!12218)

(assert (=> b!1481575 (= e!830933 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646816 lt!646814 mask!2687) (seekEntryOrOpen!0 lt!646816 lt!646814 mask!2687)))))

(declare-fun lt!646817 () SeekEntryResult!12218)

(declare-fun b!1481576 () Bool)

(assert (=> b!1481576 (= e!830933 (= lt!646817 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646816 lt!646814 mask!2687)))))

(declare-fun b!1481577 () Bool)

(declare-fun res!1006880 () Bool)

(assert (=> b!1481577 (=> (not res!1006880) (not e!830928))))

(assert (=> b!1481577 (= res!1006880 (validKeyInArray!0 (select (arr!47978 a!2862) i!1006)))))

(declare-fun b!1481578 () Bool)

(declare-fun e!830932 () Bool)

(assert (=> b!1481578 (= e!830932 (not true))))

(assert (=> b!1481578 e!830929))

(declare-fun res!1006878 () Bool)

(assert (=> b!1481578 (=> (not res!1006878) (not e!830929))))

(assert (=> b!1481578 (= res!1006878 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49776 0))(
  ( (Unit!49777) )
))
(declare-fun lt!646815 () Unit!49776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49776)

(assert (=> b!1481578 (= lt!646815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481579 () Bool)

(declare-fun res!1006886 () Bool)

(assert (=> b!1481579 (=> (not res!1006886) (not e!830928))))

(declare-datatypes ((List!34479 0))(
  ( (Nil!34476) (Cons!34475 (h!35846 (_ BitVec 64)) (t!49173 List!34479)) )
))
(declare-fun arrayNoDuplicates!0 (array!99401 (_ BitVec 32) List!34479) Bool)

(assert (=> b!1481579 (= res!1006886 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34476))))

(declare-fun b!1481580 () Bool)

(assert (=> b!1481580 (= e!830930 e!830932)))

(declare-fun res!1006891 () Bool)

(assert (=> b!1481580 (=> (not res!1006891) (not e!830932))))

(assert (=> b!1481580 (= res!1006891 (= lt!646817 (Intermediate!12218 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481580 (= lt!646817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646816 mask!2687) lt!646816 lt!646814 mask!2687))))

(assert (=> b!1481580 (= lt!646816 (select (store (arr!47978 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481581 () Bool)

(declare-fun res!1006887 () Bool)

(assert (=> b!1481581 (=> (not res!1006887) (not e!830932))))

(assert (=> b!1481581 (= res!1006887 e!830933)))

(declare-fun c!136866 () Bool)

(assert (=> b!1481581 (= c!136866 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1006883 () Bool)

(assert (=> start!126382 (=> (not res!1006883) (not e!830928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126382 (= res!1006883 (validMask!0 mask!2687))))

(assert (=> start!126382 e!830928))

(assert (=> start!126382 true))

(declare-fun array_inv!37006 (array!99401) Bool)

(assert (=> start!126382 (array_inv!37006 a!2862)))

(declare-fun b!1481582 () Bool)

(declare-fun res!1006890 () Bool)

(assert (=> b!1481582 (=> (not res!1006890) (not e!830932))))

(assert (=> b!1481582 (= res!1006890 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481583 () Bool)

(declare-fun res!1006889 () Bool)

(assert (=> b!1481583 (=> (not res!1006889) (not e!830929))))

(assert (=> b!1481583 (= res!1006889 (= (seekEntryOrOpen!0 (select (arr!47978 a!2862) j!93) a!2862 mask!2687) (Found!12218 j!93)))))

(assert (= (and start!126382 res!1006883) b!1481572))

(assert (= (and b!1481572 res!1006882) b!1481577))

(assert (= (and b!1481577 res!1006880) b!1481570))

(assert (= (and b!1481570 res!1006881) b!1481568))

(assert (= (and b!1481568 res!1006879) b!1481579))

(assert (= (and b!1481579 res!1006886) b!1481574))

(assert (= (and b!1481574 res!1006885) b!1481573))

(assert (= (and b!1481573 res!1006877) b!1481571))

(assert (= (and b!1481571 res!1006888) b!1481567))

(assert (= (and b!1481567 res!1006884) b!1481580))

(assert (= (and b!1481580 res!1006891) b!1481581))

(assert (= (and b!1481581 c!136866) b!1481576))

(assert (= (and b!1481581 (not c!136866)) b!1481575))

(assert (= (and b!1481581 res!1006887) b!1481582))

(assert (= (and b!1481582 res!1006890) b!1481578))

(assert (= (and b!1481578 res!1006878) b!1481583))

(assert (= (and b!1481583 res!1006889) b!1481569))

(declare-fun m!1367305 () Bool)

(assert (=> b!1481573 m!1367305))

(declare-fun m!1367307 () Bool)

(assert (=> b!1481573 m!1367307))

(declare-fun m!1367309 () Bool)

(assert (=> b!1481580 m!1367309))

(assert (=> b!1481580 m!1367309))

(declare-fun m!1367311 () Bool)

(assert (=> b!1481580 m!1367311))

(assert (=> b!1481580 m!1367305))

(declare-fun m!1367313 () Bool)

(assert (=> b!1481580 m!1367313))

(declare-fun m!1367315 () Bool)

(assert (=> b!1481575 m!1367315))

(declare-fun m!1367317 () Bool)

(assert (=> b!1481575 m!1367317))

(declare-fun m!1367319 () Bool)

(assert (=> b!1481571 m!1367319))

(assert (=> b!1481571 m!1367319))

(declare-fun m!1367321 () Bool)

(assert (=> b!1481571 m!1367321))

(assert (=> b!1481571 m!1367321))

(assert (=> b!1481571 m!1367319))

(declare-fun m!1367323 () Bool)

(assert (=> b!1481571 m!1367323))

(assert (=> b!1481583 m!1367319))

(assert (=> b!1481583 m!1367319))

(declare-fun m!1367325 () Bool)

(assert (=> b!1481583 m!1367325))

(assert (=> b!1481567 m!1367319))

(assert (=> b!1481567 m!1367319))

(declare-fun m!1367327 () Bool)

(assert (=> b!1481567 m!1367327))

(assert (=> b!1481570 m!1367319))

(assert (=> b!1481570 m!1367319))

(declare-fun m!1367329 () Bool)

(assert (=> b!1481570 m!1367329))

(declare-fun m!1367331 () Bool)

(assert (=> b!1481578 m!1367331))

(declare-fun m!1367333 () Bool)

(assert (=> b!1481578 m!1367333))

(declare-fun m!1367335 () Bool)

(assert (=> start!126382 m!1367335))

(declare-fun m!1367337 () Bool)

(assert (=> start!126382 m!1367337))

(assert (=> b!1481569 m!1367305))

(declare-fun m!1367339 () Bool)

(assert (=> b!1481569 m!1367339))

(declare-fun m!1367341 () Bool)

(assert (=> b!1481569 m!1367341))

(declare-fun m!1367343 () Bool)

(assert (=> b!1481569 m!1367343))

(assert (=> b!1481569 m!1367319))

(declare-fun m!1367345 () Bool)

(assert (=> b!1481579 m!1367345))

(declare-fun m!1367347 () Bool)

(assert (=> b!1481568 m!1367347))

(declare-fun m!1367349 () Bool)

(assert (=> b!1481577 m!1367349))

(assert (=> b!1481577 m!1367349))

(declare-fun m!1367351 () Bool)

(assert (=> b!1481577 m!1367351))

(declare-fun m!1367353 () Bool)

(assert (=> b!1481576 m!1367353))

(push 1)

