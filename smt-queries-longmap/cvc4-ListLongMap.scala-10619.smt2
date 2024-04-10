; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124856 () Bool)

(assert start!124856)

(declare-fun b!1449624 () Bool)

(declare-fun res!981056 () Bool)

(declare-fun e!816341 () Bool)

(assert (=> b!1449624 (=> (not res!981056) (not e!816341))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449624 (= res!981056 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449625 () Bool)

(declare-datatypes ((array!98304 0))(
  ( (array!98305 (arr!47440 (Array (_ BitVec 32) (_ BitVec 64))) (size!47990 (_ BitVec 32))) )
))
(declare-fun lt!635969 () array!98304)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!816338 () Bool)

(declare-fun lt!635968 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11692 0))(
  ( (MissingZero!11692 (index!49160 (_ BitVec 32))) (Found!11692 (index!49161 (_ BitVec 32))) (Intermediate!11692 (undefined!12504 Bool) (index!49162 (_ BitVec 32)) (x!130821 (_ BitVec 32))) (Undefined!11692) (MissingVacant!11692 (index!49163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98304 (_ BitVec 32)) SeekEntryResult!11692)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98304 (_ BitVec 32)) SeekEntryResult!11692)

(assert (=> b!1449625 (= e!816338 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635968 lt!635969 mask!2687) (seekEntryOrOpen!0 lt!635968 lt!635969 mask!2687)))))

(declare-fun b!1449627 () Bool)

(declare-fun e!816337 () Bool)

(assert (=> b!1449627 (= e!816337 true)))

(declare-fun lt!635971 () SeekEntryResult!11692)

(declare-fun a!2862 () array!98304)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449627 (= lt!635971 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47440 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449628 () Bool)

(declare-fun res!981045 () Bool)

(declare-fun e!816339 () Bool)

(assert (=> b!1449628 (=> (not res!981045) (not e!816339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449628 (= res!981045 (validKeyInArray!0 (select (arr!47440 a!2862) i!1006)))))

(declare-fun b!1449629 () Bool)

(declare-fun e!816336 () Bool)

(declare-fun e!816335 () Bool)

(assert (=> b!1449629 (= e!816336 e!816335)))

(declare-fun res!981051 () Bool)

(assert (=> b!1449629 (=> res!981051 e!816335)))

(assert (=> b!1449629 (= res!981051 (or (and (= (select (arr!47440 a!2862) index!646) (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47440 a!2862) index!646) (select (arr!47440 a!2862) j!93))) (not (= (select (arr!47440 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449630 () Bool)

(assert (=> b!1449630 (= e!816341 (not e!816337))))

(declare-fun res!981057 () Bool)

(assert (=> b!1449630 (=> res!981057 e!816337)))

(assert (=> b!1449630 (= res!981057 (or (and (= (select (arr!47440 a!2862) index!646) (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47440 a!2862) index!646) (select (arr!47440 a!2862) j!93))) (not (= (select (arr!47440 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449630 e!816336))

(declare-fun res!981047 () Bool)

(assert (=> b!1449630 (=> (not res!981047) (not e!816336))))

(declare-fun lt!635967 () SeekEntryResult!11692)

(assert (=> b!1449630 (= res!981047 (and (= lt!635967 (Found!11692 j!93)) (or (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) (select (arr!47440 a!2862) j!93)))))))

(assert (=> b!1449630 (= lt!635967 (seekEntryOrOpen!0 (select (arr!47440 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98304 (_ BitVec 32)) Bool)

(assert (=> b!1449630 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48880 0))(
  ( (Unit!48881) )
))
(declare-fun lt!635973 () Unit!48880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48880)

(assert (=> b!1449630 (= lt!635973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449631 () Bool)

(declare-fun e!816342 () Bool)

(assert (=> b!1449631 (= e!816342 e!816341)))

(declare-fun res!981052 () Bool)

(assert (=> b!1449631 (=> (not res!981052) (not e!816341))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!635970 () SeekEntryResult!11692)

(assert (=> b!1449631 (= res!981052 (= lt!635970 (Intermediate!11692 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98304 (_ BitVec 32)) SeekEntryResult!11692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449631 (= lt!635970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635968 mask!2687) lt!635968 lt!635969 mask!2687))))

(assert (=> b!1449631 (= lt!635968 (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449632 () Bool)

(declare-fun res!981048 () Bool)

(assert (=> b!1449632 (=> (not res!981048) (not e!816339))))

(assert (=> b!1449632 (= res!981048 (and (= (size!47990 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47990 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47990 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!981055 () Bool)

(assert (=> start!124856 (=> (not res!981055) (not e!816339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124856 (= res!981055 (validMask!0 mask!2687))))

(assert (=> start!124856 e!816339))

(assert (=> start!124856 true))

(declare-fun array_inv!36468 (array!98304) Bool)

(assert (=> start!124856 (array_inv!36468 a!2862)))

(declare-fun b!1449626 () Bool)

(declare-fun res!981053 () Bool)

(assert (=> b!1449626 (=> (not res!981053) (not e!816339))))

(assert (=> b!1449626 (= res!981053 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47990 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47990 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47990 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449633 () Bool)

(declare-fun res!981050 () Bool)

(assert (=> b!1449633 (=> (not res!981050) (not e!816339))))

(assert (=> b!1449633 (= res!981050 (validKeyInArray!0 (select (arr!47440 a!2862) j!93)))))

(declare-fun b!1449634 () Bool)

(declare-fun e!816344 () Bool)

(assert (=> b!1449634 (= e!816344 e!816342)))

(declare-fun res!981059 () Bool)

(assert (=> b!1449634 (=> (not res!981059) (not e!816342))))

(declare-fun lt!635972 () SeekEntryResult!11692)

(assert (=> b!1449634 (= res!981059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47440 a!2862) j!93) mask!2687) (select (arr!47440 a!2862) j!93) a!2862 mask!2687) lt!635972))))

(assert (=> b!1449634 (= lt!635972 (Intermediate!11692 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449635 () Bool)

(declare-fun res!981060 () Bool)

(assert (=> b!1449635 (=> (not res!981060) (not e!816342))))

(assert (=> b!1449635 (= res!981060 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47440 a!2862) j!93) a!2862 mask!2687) lt!635972))))

(declare-fun b!1449636 () Bool)

(declare-fun e!816340 () Bool)

(assert (=> b!1449636 (= e!816340 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449637 () Bool)

(declare-fun res!981054 () Bool)

(assert (=> b!1449637 (=> (not res!981054) (not e!816339))))

(assert (=> b!1449637 (= res!981054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449638 () Bool)

(assert (=> b!1449638 (= e!816335 e!816340)))

(declare-fun res!981049 () Bool)

(assert (=> b!1449638 (=> (not res!981049) (not e!816340))))

(assert (=> b!1449638 (= res!981049 (= lt!635967 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47440 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449639 () Bool)

(assert (=> b!1449639 (= e!816338 (= lt!635970 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635968 lt!635969 mask!2687)))))

(declare-fun b!1449640 () Bool)

(declare-fun res!981058 () Bool)

(assert (=> b!1449640 (=> (not res!981058) (not e!816339))))

(declare-datatypes ((List!33941 0))(
  ( (Nil!33938) (Cons!33937 (h!35287 (_ BitVec 64)) (t!48635 List!33941)) )
))
(declare-fun arrayNoDuplicates!0 (array!98304 (_ BitVec 32) List!33941) Bool)

(assert (=> b!1449640 (= res!981058 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33938))))

(declare-fun b!1449641 () Bool)

(assert (=> b!1449641 (= e!816339 e!816344)))

(declare-fun res!981046 () Bool)

(assert (=> b!1449641 (=> (not res!981046) (not e!816344))))

(assert (=> b!1449641 (= res!981046 (= (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449641 (= lt!635969 (array!98305 (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47990 a!2862)))))

(declare-fun b!1449642 () Bool)

(declare-fun res!981061 () Bool)

(assert (=> b!1449642 (=> (not res!981061) (not e!816341))))

(assert (=> b!1449642 (= res!981061 e!816338)))

(declare-fun c!133800 () Bool)

(assert (=> b!1449642 (= c!133800 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124856 res!981055) b!1449632))

(assert (= (and b!1449632 res!981048) b!1449628))

(assert (= (and b!1449628 res!981045) b!1449633))

(assert (= (and b!1449633 res!981050) b!1449637))

(assert (= (and b!1449637 res!981054) b!1449640))

(assert (= (and b!1449640 res!981058) b!1449626))

(assert (= (and b!1449626 res!981053) b!1449641))

(assert (= (and b!1449641 res!981046) b!1449634))

(assert (= (and b!1449634 res!981059) b!1449635))

(assert (= (and b!1449635 res!981060) b!1449631))

(assert (= (and b!1449631 res!981052) b!1449642))

(assert (= (and b!1449642 c!133800) b!1449639))

(assert (= (and b!1449642 (not c!133800)) b!1449625))

(assert (= (and b!1449642 res!981061) b!1449624))

(assert (= (and b!1449624 res!981056) b!1449630))

(assert (= (and b!1449630 res!981047) b!1449629))

(assert (= (and b!1449629 (not res!981051)) b!1449638))

(assert (= (and b!1449638 res!981049) b!1449636))

(assert (= (and b!1449630 (not res!981057)) b!1449627))

(declare-fun m!1338325 () Bool)

(assert (=> start!124856 m!1338325))

(declare-fun m!1338327 () Bool)

(assert (=> start!124856 m!1338327))

(declare-fun m!1338329 () Bool)

(assert (=> b!1449638 m!1338329))

(assert (=> b!1449638 m!1338329))

(declare-fun m!1338331 () Bool)

(assert (=> b!1449638 m!1338331))

(declare-fun m!1338333 () Bool)

(assert (=> b!1449641 m!1338333))

(declare-fun m!1338335 () Bool)

(assert (=> b!1449641 m!1338335))

(declare-fun m!1338337 () Bool)

(assert (=> b!1449637 m!1338337))

(assert (=> b!1449633 m!1338329))

(assert (=> b!1449633 m!1338329))

(declare-fun m!1338339 () Bool)

(assert (=> b!1449633 m!1338339))

(declare-fun m!1338341 () Bool)

(assert (=> b!1449625 m!1338341))

(declare-fun m!1338343 () Bool)

(assert (=> b!1449625 m!1338343))

(assert (=> b!1449634 m!1338329))

(assert (=> b!1449634 m!1338329))

(declare-fun m!1338345 () Bool)

(assert (=> b!1449634 m!1338345))

(assert (=> b!1449634 m!1338345))

(assert (=> b!1449634 m!1338329))

(declare-fun m!1338347 () Bool)

(assert (=> b!1449634 m!1338347))

(declare-fun m!1338349 () Bool)

(assert (=> b!1449629 m!1338349))

(assert (=> b!1449629 m!1338333))

(declare-fun m!1338351 () Bool)

(assert (=> b!1449629 m!1338351))

(assert (=> b!1449629 m!1338329))

(declare-fun m!1338353 () Bool)

(assert (=> b!1449628 m!1338353))

(assert (=> b!1449628 m!1338353))

(declare-fun m!1338355 () Bool)

(assert (=> b!1449628 m!1338355))

(declare-fun m!1338357 () Bool)

(assert (=> b!1449639 m!1338357))

(declare-fun m!1338359 () Bool)

(assert (=> b!1449630 m!1338359))

(assert (=> b!1449630 m!1338333))

(declare-fun m!1338361 () Bool)

(assert (=> b!1449630 m!1338361))

(assert (=> b!1449630 m!1338351))

(assert (=> b!1449630 m!1338349))

(assert (=> b!1449630 m!1338329))

(declare-fun m!1338363 () Bool)

(assert (=> b!1449630 m!1338363))

(declare-fun m!1338365 () Bool)

(assert (=> b!1449630 m!1338365))

(assert (=> b!1449630 m!1338329))

(declare-fun m!1338367 () Bool)

(assert (=> b!1449631 m!1338367))

(assert (=> b!1449631 m!1338367))

(declare-fun m!1338369 () Bool)

(assert (=> b!1449631 m!1338369))

(assert (=> b!1449631 m!1338333))

(declare-fun m!1338371 () Bool)

(assert (=> b!1449631 m!1338371))

(assert (=> b!1449627 m!1338329))

(assert (=> b!1449627 m!1338329))

(declare-fun m!1338373 () Bool)

(assert (=> b!1449627 m!1338373))

(declare-fun m!1338375 () Bool)

(assert (=> b!1449640 m!1338375))

(assert (=> b!1449635 m!1338329))

(assert (=> b!1449635 m!1338329))

(declare-fun m!1338377 () Bool)

(assert (=> b!1449635 m!1338377))

(push 1)

