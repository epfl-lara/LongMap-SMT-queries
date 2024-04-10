; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124846 () Bool)

(assert start!124846)

(declare-fun b!1449339 () Bool)

(declare-fun res!980792 () Bool)

(declare-fun e!816192 () Bool)

(assert (=> b!1449339 (=> (not res!980792) (not e!816192))))

(declare-fun e!816188 () Bool)

(assert (=> b!1449339 (= res!980792 e!816188)))

(declare-fun c!133785 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449339 (= c!133785 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449340 () Bool)

(declare-fun res!980800 () Bool)

(declare-fun e!816186 () Bool)

(assert (=> b!1449340 (=> (not res!980800) (not e!816186))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98294 0))(
  ( (array!98295 (arr!47435 (Array (_ BitVec 32) (_ BitVec 64))) (size!47985 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98294)

(assert (=> b!1449340 (= res!980800 (and (= (size!47985 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47985 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47985 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449341 () Bool)

(declare-fun res!980790 () Bool)

(assert (=> b!1449341 (=> (not res!980790) (not e!816192))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449341 (= res!980790 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449342 () Bool)

(declare-fun res!980803 () Bool)

(assert (=> b!1449342 (=> (not res!980803) (not e!816186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449342 (= res!980803 (validKeyInArray!0 (select (arr!47435 a!2862) i!1006)))))

(declare-fun b!1449343 () Bool)

(declare-fun e!816189 () Bool)

(assert (=> b!1449343 (= e!816189 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11687 0))(
  ( (MissingZero!11687 (index!49140 (_ BitVec 32))) (Found!11687 (index!49141 (_ BitVec 32))) (Intermediate!11687 (undefined!12499 Bool) (index!49142 (_ BitVec 32)) (x!130808 (_ BitVec 32))) (Undefined!11687) (MissingVacant!11687 (index!49143 (_ BitVec 32))) )
))
(declare-fun lt!635864 () SeekEntryResult!11687)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98294 (_ BitVec 32)) SeekEntryResult!11687)

(assert (=> b!1449343 (= lt!635864 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47435 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449345 () Bool)

(declare-fun e!816185 () Bool)

(assert (=> b!1449345 (= e!816185 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449346 () Bool)

(declare-fun e!816193 () Bool)

(assert (=> b!1449346 (= e!816186 e!816193)))

(declare-fun res!980799 () Bool)

(assert (=> b!1449346 (=> (not res!980799) (not e!816193))))

(assert (=> b!1449346 (= res!980799 (= (select (store (arr!47435 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635868 () array!98294)

(assert (=> b!1449346 (= lt!635868 (array!98295 (store (arr!47435 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47985 a!2862)))))

(declare-fun b!1449347 () Bool)

(declare-fun res!980804 () Bool)

(assert (=> b!1449347 (=> (not res!980804) (not e!816186))))

(assert (=> b!1449347 (= res!980804 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47985 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47985 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47985 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449348 () Bool)

(declare-fun res!980793 () Bool)

(declare-fun e!816187 () Bool)

(assert (=> b!1449348 (=> (not res!980793) (not e!816187))))

(declare-fun lt!635863 () SeekEntryResult!11687)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98294 (_ BitVec 32)) SeekEntryResult!11687)

(assert (=> b!1449348 (= res!980793 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47435 a!2862) j!93) a!2862 mask!2687) lt!635863))))

(declare-fun b!1449349 () Bool)

(assert (=> b!1449349 (= e!816187 e!816192)))

(declare-fun res!980797 () Bool)

(assert (=> b!1449349 (=> (not res!980797) (not e!816192))))

(declare-fun lt!635865 () SeekEntryResult!11687)

(assert (=> b!1449349 (= res!980797 (= lt!635865 (Intermediate!11687 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635862 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449349 (= lt!635865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635862 mask!2687) lt!635862 lt!635868 mask!2687))))

(assert (=> b!1449349 (= lt!635862 (select (store (arr!47435 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449350 () Bool)

(assert (=> b!1449350 (= e!816188 (= lt!635865 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635862 lt!635868 mask!2687)))))

(declare-fun b!1449351 () Bool)

(declare-fun res!980794 () Bool)

(assert (=> b!1449351 (=> (not res!980794) (not e!816186))))

(assert (=> b!1449351 (= res!980794 (validKeyInArray!0 (select (arr!47435 a!2862) j!93)))))

(declare-fun b!1449352 () Bool)

(declare-fun e!816191 () Bool)

(declare-fun e!816194 () Bool)

(assert (=> b!1449352 (= e!816191 e!816194)))

(declare-fun res!980802 () Bool)

(assert (=> b!1449352 (=> res!980802 e!816194)))

(assert (=> b!1449352 (= res!980802 (or (and (= (select (arr!47435 a!2862) index!646) (select (store (arr!47435 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47435 a!2862) index!646) (select (arr!47435 a!2862) j!93))) (not (= (select (arr!47435 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449353 () Bool)

(assert (=> b!1449353 (= e!816194 e!816185)))

(declare-fun res!980806 () Bool)

(assert (=> b!1449353 (=> (not res!980806) (not e!816185))))

(declare-fun lt!635866 () SeekEntryResult!11687)

(assert (=> b!1449353 (= res!980806 (= lt!635866 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47435 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449344 () Bool)

(assert (=> b!1449344 (= e!816192 (not e!816189))))

(declare-fun res!980791 () Bool)

(assert (=> b!1449344 (=> res!980791 e!816189)))

(assert (=> b!1449344 (= res!980791 (or (and (= (select (arr!47435 a!2862) index!646) (select (store (arr!47435 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47435 a!2862) index!646) (select (arr!47435 a!2862) j!93))) (not (= (select (arr!47435 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47435 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449344 e!816191))

(declare-fun res!980798 () Bool)

(assert (=> b!1449344 (=> (not res!980798) (not e!816191))))

(assert (=> b!1449344 (= res!980798 (and (= lt!635866 (Found!11687 j!93)) (or (= (select (arr!47435 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47435 a!2862) intermediateBeforeIndex!19) (select (arr!47435 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98294 (_ BitVec 32)) SeekEntryResult!11687)

(assert (=> b!1449344 (= lt!635866 (seekEntryOrOpen!0 (select (arr!47435 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98294 (_ BitVec 32)) Bool)

(assert (=> b!1449344 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48870 0))(
  ( (Unit!48871) )
))
(declare-fun lt!635867 () Unit!48870)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48870)

(assert (=> b!1449344 (= lt!635867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!980796 () Bool)

(assert (=> start!124846 (=> (not res!980796) (not e!816186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124846 (= res!980796 (validMask!0 mask!2687))))

(assert (=> start!124846 e!816186))

(assert (=> start!124846 true))

(declare-fun array_inv!36463 (array!98294) Bool)

(assert (=> start!124846 (array_inv!36463 a!2862)))

(declare-fun b!1449354 () Bool)

(assert (=> b!1449354 (= e!816193 e!816187)))

(declare-fun res!980805 () Bool)

(assert (=> b!1449354 (=> (not res!980805) (not e!816187))))

(assert (=> b!1449354 (= res!980805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47435 a!2862) j!93) mask!2687) (select (arr!47435 a!2862) j!93) a!2862 mask!2687) lt!635863))))

(assert (=> b!1449354 (= lt!635863 (Intermediate!11687 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449355 () Bool)

(declare-fun res!980801 () Bool)

(assert (=> b!1449355 (=> (not res!980801) (not e!816186))))

(declare-datatypes ((List!33936 0))(
  ( (Nil!33933) (Cons!33932 (h!35282 (_ BitVec 64)) (t!48630 List!33936)) )
))
(declare-fun arrayNoDuplicates!0 (array!98294 (_ BitVec 32) List!33936) Bool)

(assert (=> b!1449355 (= res!980801 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33933))))

(declare-fun b!1449356 () Bool)

(assert (=> b!1449356 (= e!816188 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635862 lt!635868 mask!2687) (seekEntryOrOpen!0 lt!635862 lt!635868 mask!2687)))))

(declare-fun b!1449357 () Bool)

(declare-fun res!980795 () Bool)

(assert (=> b!1449357 (=> (not res!980795) (not e!816186))))

(assert (=> b!1449357 (= res!980795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124846 res!980796) b!1449340))

(assert (= (and b!1449340 res!980800) b!1449342))

(assert (= (and b!1449342 res!980803) b!1449351))

(assert (= (and b!1449351 res!980794) b!1449357))

(assert (= (and b!1449357 res!980795) b!1449355))

(assert (= (and b!1449355 res!980801) b!1449347))

(assert (= (and b!1449347 res!980804) b!1449346))

(assert (= (and b!1449346 res!980799) b!1449354))

(assert (= (and b!1449354 res!980805) b!1449348))

(assert (= (and b!1449348 res!980793) b!1449349))

(assert (= (and b!1449349 res!980797) b!1449339))

(assert (= (and b!1449339 c!133785) b!1449350))

(assert (= (and b!1449339 (not c!133785)) b!1449356))

(assert (= (and b!1449339 res!980792) b!1449341))

(assert (= (and b!1449341 res!980790) b!1449344))

(assert (= (and b!1449344 res!980798) b!1449352))

(assert (= (and b!1449352 (not res!980802)) b!1449353))

(assert (= (and b!1449353 res!980806) b!1449345))

(assert (= (and b!1449344 (not res!980791)) b!1449343))

(declare-fun m!1338055 () Bool)

(assert (=> start!124846 m!1338055))

(declare-fun m!1338057 () Bool)

(assert (=> start!124846 m!1338057))

(declare-fun m!1338059 () Bool)

(assert (=> b!1449353 m!1338059))

(assert (=> b!1449353 m!1338059))

(declare-fun m!1338061 () Bool)

(assert (=> b!1449353 m!1338061))

(assert (=> b!1449343 m!1338059))

(assert (=> b!1449343 m!1338059))

(declare-fun m!1338063 () Bool)

(assert (=> b!1449343 m!1338063))

(declare-fun m!1338065 () Bool)

(assert (=> b!1449350 m!1338065))

(declare-fun m!1338067 () Bool)

(assert (=> b!1449344 m!1338067))

(declare-fun m!1338069 () Bool)

(assert (=> b!1449344 m!1338069))

(declare-fun m!1338071 () Bool)

(assert (=> b!1449344 m!1338071))

(declare-fun m!1338073 () Bool)

(assert (=> b!1449344 m!1338073))

(declare-fun m!1338075 () Bool)

(assert (=> b!1449344 m!1338075))

(assert (=> b!1449344 m!1338059))

(declare-fun m!1338077 () Bool)

(assert (=> b!1449344 m!1338077))

(declare-fun m!1338079 () Bool)

(assert (=> b!1449344 m!1338079))

(assert (=> b!1449344 m!1338059))

(assert (=> b!1449346 m!1338069))

(declare-fun m!1338081 () Bool)

(assert (=> b!1449346 m!1338081))

(assert (=> b!1449352 m!1338075))

(assert (=> b!1449352 m!1338069))

(assert (=> b!1449352 m!1338073))

(assert (=> b!1449352 m!1338059))

(declare-fun m!1338083 () Bool)

(assert (=> b!1449357 m!1338083))

(assert (=> b!1449351 m!1338059))

(assert (=> b!1449351 m!1338059))

(declare-fun m!1338085 () Bool)

(assert (=> b!1449351 m!1338085))

(declare-fun m!1338087 () Bool)

(assert (=> b!1449349 m!1338087))

(assert (=> b!1449349 m!1338087))

(declare-fun m!1338089 () Bool)

(assert (=> b!1449349 m!1338089))

(assert (=> b!1449349 m!1338069))

(declare-fun m!1338091 () Bool)

(assert (=> b!1449349 m!1338091))

(declare-fun m!1338093 () Bool)

(assert (=> b!1449342 m!1338093))

(assert (=> b!1449342 m!1338093))

(declare-fun m!1338095 () Bool)

(assert (=> b!1449342 m!1338095))

(declare-fun m!1338097 () Bool)

(assert (=> b!1449355 m!1338097))

(assert (=> b!1449348 m!1338059))

(assert (=> b!1449348 m!1338059))

(declare-fun m!1338099 () Bool)

(assert (=> b!1449348 m!1338099))

(assert (=> b!1449354 m!1338059))

(assert (=> b!1449354 m!1338059))

(declare-fun m!1338101 () Bool)

(assert (=> b!1449354 m!1338101))

(assert (=> b!1449354 m!1338101))

(assert (=> b!1449354 m!1338059))

(declare-fun m!1338103 () Bool)

(assert (=> b!1449354 m!1338103))

(declare-fun m!1338105 () Bool)

(assert (=> b!1449356 m!1338105))

(declare-fun m!1338107 () Bool)

(assert (=> b!1449356 m!1338107))

(push 1)

