; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124702 () Bool)

(assert start!124702)

(declare-fun b!1445357 () Bool)

(declare-fun res!977243 () Bool)

(declare-fun e!814211 () Bool)

(assert (=> b!1445357 (=> (not res!977243) (not e!814211))))

(declare-datatypes ((array!98150 0))(
  ( (array!98151 (arr!47363 (Array (_ BitVec 32) (_ BitVec 64))) (size!47913 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98150)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98150 (_ BitVec 32)) Bool)

(assert (=> b!1445357 (= res!977243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445358 () Bool)

(declare-fun res!977252 () Bool)

(declare-fun e!814213 () Bool)

(assert (=> b!1445358 (=> (not res!977252) (not e!814213))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11615 0))(
  ( (MissingZero!11615 (index!48852 (_ BitVec 32))) (Found!11615 (index!48853 (_ BitVec 32))) (Intermediate!11615 (undefined!12427 Bool) (index!48854 (_ BitVec 32)) (x!130544 (_ BitVec 32))) (Undefined!11615) (MissingVacant!11615 (index!48855 (_ BitVec 32))) )
))
(declare-fun lt!634473 () SeekEntryResult!11615)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98150 (_ BitVec 32)) SeekEntryResult!11615)

(assert (=> b!1445358 (= res!977252 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47363 a!2862) j!93) a!2862 mask!2687) lt!634473))))

(declare-fun b!1445359 () Bool)

(declare-fun e!814210 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445359 (= e!814210 (not (or (and (= (select (arr!47363 a!2862) index!646) (select (store (arr!47363 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47363 a!2862) index!646) (select (arr!47363 a!2862) j!93))) (not (= (select (arr!47363 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!814212 () Bool)

(assert (=> b!1445359 e!814212))

(declare-fun res!977248 () Bool)

(assert (=> b!1445359 (=> (not res!977248) (not e!814212))))

(assert (=> b!1445359 (= res!977248 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48726 0))(
  ( (Unit!48727) )
))
(declare-fun lt!634474 () Unit!48726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48726)

(assert (=> b!1445359 (= lt!634474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445360 () Bool)

(declare-fun res!977244 () Bool)

(assert (=> b!1445360 (=> (not res!977244) (not e!814211))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445360 (= res!977244 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47913 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47913 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47913 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!814208 () Bool)

(declare-fun b!1445361 () Bool)

(declare-fun lt!634472 () (_ BitVec 64))

(declare-fun lt!634475 () array!98150)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98150 (_ BitVec 32)) SeekEntryResult!11615)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98150 (_ BitVec 32)) SeekEntryResult!11615)

(assert (=> b!1445361 (= e!814208 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634472 lt!634475 mask!2687) (seekEntryOrOpen!0 lt!634472 lt!634475 mask!2687)))))

(declare-fun b!1445362 () Bool)

(declare-fun res!977249 () Bool)

(assert (=> b!1445362 (=> (not res!977249) (not e!814211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445362 (= res!977249 (validKeyInArray!0 (select (arr!47363 a!2862) j!93)))))

(declare-fun b!1445363 () Bool)

(assert (=> b!1445363 (= e!814212 (or (= (select (arr!47363 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47363 a!2862) intermediateBeforeIndex!19) (select (arr!47363 a!2862) j!93))))))

(declare-fun b!1445364 () Bool)

(declare-fun res!977247 () Bool)

(assert (=> b!1445364 (=> (not res!977247) (not e!814211))))

(assert (=> b!1445364 (= res!977247 (and (= (size!47913 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47913 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47913 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445365 () Bool)

(declare-fun res!977251 () Bool)

(assert (=> b!1445365 (=> (not res!977251) (not e!814211))))

(assert (=> b!1445365 (= res!977251 (validKeyInArray!0 (select (arr!47363 a!2862) i!1006)))))

(declare-fun b!1445366 () Bool)

(assert (=> b!1445366 (= e!814213 e!814210)))

(declare-fun res!977241 () Bool)

(assert (=> b!1445366 (=> (not res!977241) (not e!814210))))

(declare-fun lt!634476 () SeekEntryResult!11615)

(assert (=> b!1445366 (= res!977241 (= lt!634476 (Intermediate!11615 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445366 (= lt!634476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634472 mask!2687) lt!634472 lt!634475 mask!2687))))

(assert (=> b!1445366 (= lt!634472 (select (store (arr!47363 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445367 () Bool)

(declare-fun res!977240 () Bool)

(assert (=> b!1445367 (=> (not res!977240) (not e!814210))))

(assert (=> b!1445367 (= res!977240 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445368 () Bool)

(declare-fun e!814214 () Bool)

(assert (=> b!1445368 (= e!814211 e!814214)))

(declare-fun res!977245 () Bool)

(assert (=> b!1445368 (=> (not res!977245) (not e!814214))))

(assert (=> b!1445368 (= res!977245 (= (select (store (arr!47363 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445368 (= lt!634475 (array!98151 (store (arr!47363 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47913 a!2862)))))

(declare-fun b!1445369 () Bool)

(declare-fun res!977242 () Bool)

(assert (=> b!1445369 (=> (not res!977242) (not e!814210))))

(assert (=> b!1445369 (= res!977242 e!814208)))

(declare-fun c!133569 () Bool)

(assert (=> b!1445369 (= c!133569 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445370 () Bool)

(declare-fun res!977254 () Bool)

(assert (=> b!1445370 (=> (not res!977254) (not e!814212))))

(assert (=> b!1445370 (= res!977254 (= (seekEntryOrOpen!0 (select (arr!47363 a!2862) j!93) a!2862 mask!2687) (Found!11615 j!93)))))

(declare-fun b!1445371 () Bool)

(assert (=> b!1445371 (= e!814214 e!814213)))

(declare-fun res!977250 () Bool)

(assert (=> b!1445371 (=> (not res!977250) (not e!814213))))

(assert (=> b!1445371 (= res!977250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47363 a!2862) j!93) mask!2687) (select (arr!47363 a!2862) j!93) a!2862 mask!2687) lt!634473))))

(assert (=> b!1445371 (= lt!634473 (Intermediate!11615 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!977246 () Bool)

(assert (=> start!124702 (=> (not res!977246) (not e!814211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124702 (= res!977246 (validMask!0 mask!2687))))

(assert (=> start!124702 e!814211))

(assert (=> start!124702 true))

(declare-fun array_inv!36391 (array!98150) Bool)

(assert (=> start!124702 (array_inv!36391 a!2862)))

(declare-fun b!1445372 () Bool)

(assert (=> b!1445372 (= e!814208 (= lt!634476 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634472 lt!634475 mask!2687)))))

(declare-fun b!1445373 () Bool)

(declare-fun res!977253 () Bool)

(assert (=> b!1445373 (=> (not res!977253) (not e!814211))))

(declare-datatypes ((List!33864 0))(
  ( (Nil!33861) (Cons!33860 (h!35210 (_ BitVec 64)) (t!48558 List!33864)) )
))
(declare-fun arrayNoDuplicates!0 (array!98150 (_ BitVec 32) List!33864) Bool)

(assert (=> b!1445373 (= res!977253 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33861))))

(assert (= (and start!124702 res!977246) b!1445364))

(assert (= (and b!1445364 res!977247) b!1445365))

(assert (= (and b!1445365 res!977251) b!1445362))

(assert (= (and b!1445362 res!977249) b!1445357))

(assert (= (and b!1445357 res!977243) b!1445373))

(assert (= (and b!1445373 res!977253) b!1445360))

(assert (= (and b!1445360 res!977244) b!1445368))

(assert (= (and b!1445368 res!977245) b!1445371))

(assert (= (and b!1445371 res!977250) b!1445358))

(assert (= (and b!1445358 res!977252) b!1445366))

(assert (= (and b!1445366 res!977241) b!1445369))

(assert (= (and b!1445369 c!133569) b!1445372))

(assert (= (and b!1445369 (not c!133569)) b!1445361))

(assert (= (and b!1445369 res!977242) b!1445367))

(assert (= (and b!1445367 res!977240) b!1445359))

(assert (= (and b!1445359 res!977248) b!1445370))

(assert (= (and b!1445370 res!977254) b!1445363))

(declare-fun m!1334311 () Bool)

(assert (=> b!1445361 m!1334311))

(declare-fun m!1334313 () Bool)

(assert (=> b!1445361 m!1334313))

(declare-fun m!1334315 () Bool)

(assert (=> b!1445359 m!1334315))

(declare-fun m!1334317 () Bool)

(assert (=> b!1445359 m!1334317))

(declare-fun m!1334319 () Bool)

(assert (=> b!1445359 m!1334319))

(declare-fun m!1334321 () Bool)

(assert (=> b!1445359 m!1334321))

(declare-fun m!1334323 () Bool)

(assert (=> b!1445359 m!1334323))

(declare-fun m!1334325 () Bool)

(assert (=> b!1445359 m!1334325))

(assert (=> b!1445370 m!1334325))

(assert (=> b!1445370 m!1334325))

(declare-fun m!1334327 () Bool)

(assert (=> b!1445370 m!1334327))

(declare-fun m!1334329 () Bool)

(assert (=> b!1445365 m!1334329))

(assert (=> b!1445365 m!1334329))

(declare-fun m!1334331 () Bool)

(assert (=> b!1445365 m!1334331))

(declare-fun m!1334333 () Bool)

(assert (=> b!1445373 m!1334333))

(declare-fun m!1334335 () Bool)

(assert (=> b!1445366 m!1334335))

(assert (=> b!1445366 m!1334335))

(declare-fun m!1334337 () Bool)

(assert (=> b!1445366 m!1334337))

(assert (=> b!1445366 m!1334317))

(declare-fun m!1334339 () Bool)

(assert (=> b!1445366 m!1334339))

(assert (=> b!1445362 m!1334325))

(assert (=> b!1445362 m!1334325))

(declare-fun m!1334341 () Bool)

(assert (=> b!1445362 m!1334341))

(assert (=> b!1445371 m!1334325))

(assert (=> b!1445371 m!1334325))

(declare-fun m!1334343 () Bool)

(assert (=> b!1445371 m!1334343))

(assert (=> b!1445371 m!1334343))

(assert (=> b!1445371 m!1334325))

(declare-fun m!1334345 () Bool)

(assert (=> b!1445371 m!1334345))

(declare-fun m!1334347 () Bool)

(assert (=> b!1445372 m!1334347))

(declare-fun m!1334349 () Bool)

(assert (=> start!124702 m!1334349))

(declare-fun m!1334351 () Bool)

(assert (=> start!124702 m!1334351))

(declare-fun m!1334353 () Bool)

(assert (=> b!1445363 m!1334353))

(assert (=> b!1445363 m!1334325))

(declare-fun m!1334355 () Bool)

(assert (=> b!1445357 m!1334355))

(assert (=> b!1445358 m!1334325))

(assert (=> b!1445358 m!1334325))

(declare-fun m!1334357 () Bool)

(assert (=> b!1445358 m!1334357))

(assert (=> b!1445368 m!1334317))

(declare-fun m!1334359 () Bool)

(assert (=> b!1445368 m!1334359))

(push 1)

