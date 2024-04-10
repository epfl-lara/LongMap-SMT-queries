; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125792 () Bool)

(assert start!125792)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1472366 () Bool)

(declare-fun e!826323 () Bool)

(declare-datatypes ((array!99126 0))(
  ( (array!99127 (arr!47848 (Array (_ BitVec 32) (_ BitVec 64))) (size!48398 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99126)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472366 (= e!826323 (or (= (select (arr!47848 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47848 a!2862) intermediateBeforeIndex!19) (select (arr!47848 a!2862) j!93))))))

(declare-fun b!1472367 () Bool)

(declare-fun e!826322 () Bool)

(declare-fun e!826319 () Bool)

(assert (=> b!1472367 (= e!826322 e!826319)))

(declare-fun res!1000051 () Bool)

(assert (=> b!1472367 (=> (not res!1000051) (not e!826319))))

(declare-datatypes ((SeekEntryResult!12088 0))(
  ( (MissingZero!12088 (index!50744 (_ BitVec 32))) (Found!12088 (index!50745 (_ BitVec 32))) (Intermediate!12088 (undefined!12900 Bool) (index!50746 (_ BitVec 32)) (x!132323 (_ BitVec 32))) (Undefined!12088) (MissingVacant!12088 (index!50747 (_ BitVec 32))) )
))
(declare-fun lt!643551 () SeekEntryResult!12088)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472367 (= res!1000051 (= lt!643551 (Intermediate!12088 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643552 () (_ BitVec 64))

(declare-fun lt!643554 () array!99126)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99126 (_ BitVec 32)) SeekEntryResult!12088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472367 (= lt!643551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643552 mask!2687) lt!643552 lt!643554 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472367 (= lt!643552 (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472368 () Bool)

(declare-fun res!1000045 () Bool)

(assert (=> b!1472368 (=> (not res!1000045) (not e!826319))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472368 (= res!1000045 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472369 () Bool)

(declare-fun e!826325 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472369 (= e!826325 (= lt!643551 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643552 lt!643554 mask!2687)))))

(declare-fun b!1472371 () Bool)

(assert (=> b!1472371 (= e!826319 (not true))))

(assert (=> b!1472371 e!826323))

(declare-fun res!1000038 () Bool)

(assert (=> b!1472371 (=> (not res!1000038) (not e!826323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99126 (_ BitVec 32)) Bool)

(assert (=> b!1472371 (= res!1000038 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49516 0))(
  ( (Unit!49517) )
))
(declare-fun lt!643550 () Unit!49516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49516)

(assert (=> b!1472371 (= lt!643550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472372 () Bool)

(declare-fun res!1000043 () Bool)

(assert (=> b!1472372 (=> (not res!1000043) (not e!826322))))

(declare-fun lt!643553 () SeekEntryResult!12088)

(assert (=> b!1472372 (= res!1000043 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47848 a!2862) j!93) a!2862 mask!2687) lt!643553))))

(declare-fun b!1472373 () Bool)

(declare-fun res!1000041 () Bool)

(declare-fun e!826324 () Bool)

(assert (=> b!1472373 (=> (not res!1000041) (not e!826324))))

(assert (=> b!1472373 (= res!1000041 (and (= (size!48398 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48398 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48398 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472374 () Bool)

(declare-fun res!1000037 () Bool)

(assert (=> b!1472374 (=> (not res!1000037) (not e!826324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472374 (= res!1000037 (validKeyInArray!0 (select (arr!47848 a!2862) j!93)))))

(declare-fun b!1472375 () Bool)

(declare-fun res!1000046 () Bool)

(assert (=> b!1472375 (=> (not res!1000046) (not e!826323))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99126 (_ BitVec 32)) SeekEntryResult!12088)

(assert (=> b!1472375 (= res!1000046 (= (seekEntryOrOpen!0 (select (arr!47848 a!2862) j!93) a!2862 mask!2687) (Found!12088 j!93)))))

(declare-fun b!1472376 () Bool)

(declare-fun e!826321 () Bool)

(assert (=> b!1472376 (= e!826324 e!826321)))

(declare-fun res!1000040 () Bool)

(assert (=> b!1472376 (=> (not res!1000040) (not e!826321))))

(assert (=> b!1472376 (= res!1000040 (= (select (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472376 (= lt!643554 (array!99127 (store (arr!47848 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48398 a!2862)))))

(declare-fun b!1472377 () Bool)

(declare-fun res!1000048 () Bool)

(assert (=> b!1472377 (=> (not res!1000048) (not e!826324))))

(assert (=> b!1472377 (= res!1000048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472378 () Bool)

(declare-fun res!1000044 () Bool)

(assert (=> b!1472378 (=> (not res!1000044) (not e!826324))))

(assert (=> b!1472378 (= res!1000044 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48398 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48398 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48398 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472379 () Bool)

(declare-fun res!1000047 () Bool)

(assert (=> b!1472379 (=> (not res!1000047) (not e!826324))))

(declare-datatypes ((List!34349 0))(
  ( (Nil!34346) (Cons!34345 (h!35701 (_ BitVec 64)) (t!49043 List!34349)) )
))
(declare-fun arrayNoDuplicates!0 (array!99126 (_ BitVec 32) List!34349) Bool)

(assert (=> b!1472379 (= res!1000047 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34346))))

(declare-fun b!1472380 () Bool)

(declare-fun res!1000049 () Bool)

(assert (=> b!1472380 (=> (not res!1000049) (not e!826324))))

(assert (=> b!1472380 (= res!1000049 (validKeyInArray!0 (select (arr!47848 a!2862) i!1006)))))

(declare-fun b!1472370 () Bool)

(assert (=> b!1472370 (= e!826321 e!826322)))

(declare-fun res!1000039 () Bool)

(assert (=> b!1472370 (=> (not res!1000039) (not e!826322))))

(assert (=> b!1472370 (= res!1000039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47848 a!2862) j!93) mask!2687) (select (arr!47848 a!2862) j!93) a!2862 mask!2687) lt!643553))))

(assert (=> b!1472370 (= lt!643553 (Intermediate!12088 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1000050 () Bool)

(assert (=> start!125792 (=> (not res!1000050) (not e!826324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125792 (= res!1000050 (validMask!0 mask!2687))))

(assert (=> start!125792 e!826324))

(assert (=> start!125792 true))

(declare-fun array_inv!36876 (array!99126) Bool)

(assert (=> start!125792 (array_inv!36876 a!2862)))

(declare-fun b!1472381 () Bool)

(declare-fun res!1000042 () Bool)

(assert (=> b!1472381 (=> (not res!1000042) (not e!826319))))

(assert (=> b!1472381 (= res!1000042 e!826325)))

(declare-fun c!135678 () Bool)

(assert (=> b!1472381 (= c!135678 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472382 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99126 (_ BitVec 32)) SeekEntryResult!12088)

(assert (=> b!1472382 (= e!826325 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643552 lt!643554 mask!2687) (seekEntryOrOpen!0 lt!643552 lt!643554 mask!2687)))))

(assert (= (and start!125792 res!1000050) b!1472373))

(assert (= (and b!1472373 res!1000041) b!1472380))

(assert (= (and b!1472380 res!1000049) b!1472374))

(assert (= (and b!1472374 res!1000037) b!1472377))

(assert (= (and b!1472377 res!1000048) b!1472379))

(assert (= (and b!1472379 res!1000047) b!1472378))

(assert (= (and b!1472378 res!1000044) b!1472376))

(assert (= (and b!1472376 res!1000040) b!1472370))

(assert (= (and b!1472370 res!1000039) b!1472372))

(assert (= (and b!1472372 res!1000043) b!1472367))

(assert (= (and b!1472367 res!1000051) b!1472381))

(assert (= (and b!1472381 c!135678) b!1472369))

(assert (= (and b!1472381 (not c!135678)) b!1472382))

(assert (= (and b!1472381 res!1000042) b!1472368))

(assert (= (and b!1472368 res!1000045) b!1472371))

(assert (= (and b!1472371 res!1000038) b!1472375))

(assert (= (and b!1472375 res!1000046) b!1472366))

(declare-fun m!1359087 () Bool)

(assert (=> b!1472375 m!1359087))

(assert (=> b!1472375 m!1359087))

(declare-fun m!1359089 () Bool)

(assert (=> b!1472375 m!1359089))

(declare-fun m!1359091 () Bool)

(assert (=> b!1472376 m!1359091))

(declare-fun m!1359093 () Bool)

(assert (=> b!1472376 m!1359093))

(assert (=> b!1472372 m!1359087))

(assert (=> b!1472372 m!1359087))

(declare-fun m!1359095 () Bool)

(assert (=> b!1472372 m!1359095))

(declare-fun m!1359097 () Bool)

(assert (=> start!125792 m!1359097))

(declare-fun m!1359099 () Bool)

(assert (=> start!125792 m!1359099))

(declare-fun m!1359101 () Bool)

(assert (=> b!1472371 m!1359101))

(declare-fun m!1359103 () Bool)

(assert (=> b!1472371 m!1359103))

(declare-fun m!1359105 () Bool)

(assert (=> b!1472382 m!1359105))

(declare-fun m!1359107 () Bool)

(assert (=> b!1472382 m!1359107))

(assert (=> b!1472374 m!1359087))

(assert (=> b!1472374 m!1359087))

(declare-fun m!1359109 () Bool)

(assert (=> b!1472374 m!1359109))

(assert (=> b!1472370 m!1359087))

(assert (=> b!1472370 m!1359087))

(declare-fun m!1359111 () Bool)

(assert (=> b!1472370 m!1359111))

(assert (=> b!1472370 m!1359111))

(assert (=> b!1472370 m!1359087))

(declare-fun m!1359113 () Bool)

(assert (=> b!1472370 m!1359113))

(declare-fun m!1359115 () Bool)

(assert (=> b!1472366 m!1359115))

(assert (=> b!1472366 m!1359087))

(declare-fun m!1359117 () Bool)

(assert (=> b!1472377 m!1359117))

(declare-fun m!1359119 () Bool)

(assert (=> b!1472379 m!1359119))

(declare-fun m!1359121 () Bool)

(assert (=> b!1472367 m!1359121))

(assert (=> b!1472367 m!1359121))

(declare-fun m!1359123 () Bool)

(assert (=> b!1472367 m!1359123))

(assert (=> b!1472367 m!1359091))

(declare-fun m!1359125 () Bool)

(assert (=> b!1472367 m!1359125))

(declare-fun m!1359127 () Bool)

(assert (=> b!1472369 m!1359127))

(declare-fun m!1359129 () Bool)

(assert (=> b!1472380 m!1359129))

(assert (=> b!1472380 m!1359129))

(declare-fun m!1359131 () Bool)

(assert (=> b!1472380 m!1359131))

(push 1)

