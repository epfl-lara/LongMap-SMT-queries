; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127046 () Bool)

(assert start!127046)

(declare-fun b!1493233 () Bool)

(declare-fun res!1015937 () Bool)

(declare-fun e!836474 () Bool)

(assert (=> b!1493233 (=> (not res!1015937) (not e!836474))))

(declare-datatypes ((array!99691 0))(
  ( (array!99692 (arr!48115 (Array (_ BitVec 32) (_ BitVec 64))) (size!48667 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99691)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493233 (= res!1015937 (validKeyInArray!0 (select (arr!48115 a!2862) i!1006)))))

(declare-fun e!836475 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!650778 () (_ BitVec 64))

(declare-fun b!1493234 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650780 () array!99691)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12380 0))(
  ( (MissingZero!12380 (index!51912 (_ BitVec 32))) (Found!12380 (index!51913 (_ BitVec 32))) (Intermediate!12380 (undefined!13192 Bool) (index!51914 (_ BitVec 32)) (x!133509 (_ BitVec 32))) (Undefined!12380) (MissingVacant!12380 (index!51915 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99691 (_ BitVec 32)) SeekEntryResult!12380)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99691 (_ BitVec 32)) SeekEntryResult!12380)

(assert (=> b!1493234 (= e!836475 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650778 lt!650780 mask!2687) (seekEntryOrOpen!0 lt!650778 lt!650780 mask!2687)))))

(declare-fun b!1493235 () Bool)

(declare-fun res!1015939 () Bool)

(assert (=> b!1493235 (=> (not res!1015939) (not e!836474))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1493235 (= res!1015939 (validKeyInArray!0 (select (arr!48115 a!2862) j!93)))))

(declare-fun b!1493236 () Bool)

(declare-fun e!836472 () Bool)

(declare-fun e!836473 () Bool)

(assert (=> b!1493236 (= e!836472 e!836473)))

(declare-fun res!1015935 () Bool)

(assert (=> b!1493236 (=> (not res!1015935) (not e!836473))))

(declare-fun lt!650779 () SeekEntryResult!12380)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99691 (_ BitVec 32)) SeekEntryResult!12380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493236 (= res!1015935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48115 a!2862) j!93) mask!2687) (select (arr!48115 a!2862) j!93) a!2862 mask!2687) lt!650779))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493236 (= lt!650779 (Intermediate!12380 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493237 () Bool)

(assert (=> b!1493237 (= e!836474 e!836472)))

(declare-fun res!1015929 () Bool)

(assert (=> b!1493237 (=> (not res!1015929) (not e!836472))))

(assert (=> b!1493237 (= res!1015929 (= (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493237 (= lt!650780 (array!99692 (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48667 a!2862)))))

(declare-fun b!1493238 () Bool)

(declare-fun e!836476 () Bool)

(declare-fun e!836471 () Bool)

(assert (=> b!1493238 (= e!836476 (not e!836471))))

(declare-fun res!1015925 () Bool)

(assert (=> b!1493238 (=> res!1015925 e!836471)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493238 (= res!1015925 (or (and (= (select (arr!48115 a!2862) index!646) (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48115 a!2862) index!646) (select (arr!48115 a!2862) j!93))) (= (select (arr!48115 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836470 () Bool)

(assert (=> b!1493238 e!836470))

(declare-fun res!1015938 () Bool)

(assert (=> b!1493238 (=> (not res!1015938) (not e!836470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99691 (_ BitVec 32)) Bool)

(assert (=> b!1493238 (= res!1015938 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49941 0))(
  ( (Unit!49942) )
))
(declare-fun lt!650775 () Unit!49941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49941)

(assert (=> b!1493238 (= lt!650775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493239 () Bool)

(assert (=> b!1493239 (= e!836471 true)))

(declare-fun lt!650777 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493239 (= lt!650777 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493240 () Bool)

(declare-fun res!1015924 () Bool)

(assert (=> b!1493240 (=> (not res!1015924) (not e!836476))))

(assert (=> b!1493240 (= res!1015924 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493241 () Bool)

(declare-fun res!1015927 () Bool)

(assert (=> b!1493241 (=> (not res!1015927) (not e!836470))))

(assert (=> b!1493241 (= res!1015927 (= (seekEntryOrOpen!0 (select (arr!48115 a!2862) j!93) a!2862 mask!2687) (Found!12380 j!93)))))

(declare-fun b!1493243 () Bool)

(declare-fun res!1015930 () Bool)

(assert (=> b!1493243 (=> (not res!1015930) (not e!836476))))

(assert (=> b!1493243 (= res!1015930 e!836475)))

(declare-fun c!138187 () Bool)

(assert (=> b!1493243 (= c!138187 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493244 () Bool)

(declare-fun res!1015936 () Bool)

(assert (=> b!1493244 (=> (not res!1015936) (not e!836474))))

(assert (=> b!1493244 (= res!1015936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493245 () Bool)

(declare-fun res!1015932 () Bool)

(assert (=> b!1493245 (=> (not res!1015932) (not e!836474))))

(assert (=> b!1493245 (= res!1015932 (and (= (size!48667 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48667 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48667 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493246 () Bool)

(declare-fun res!1015931 () Bool)

(assert (=> b!1493246 (=> (not res!1015931) (not e!836473))))

(assert (=> b!1493246 (= res!1015931 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48115 a!2862) j!93) a!2862 mask!2687) lt!650779))))

(declare-fun b!1493247 () Bool)

(declare-fun res!1015934 () Bool)

(assert (=> b!1493247 (=> (not res!1015934) (not e!836474))))

(declare-datatypes ((List!34694 0))(
  ( (Nil!34691) (Cons!34690 (h!36079 (_ BitVec 64)) (t!49380 List!34694)) )
))
(declare-fun arrayNoDuplicates!0 (array!99691 (_ BitVec 32) List!34694) Bool)

(assert (=> b!1493247 (= res!1015934 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34691))))

(declare-fun lt!650776 () SeekEntryResult!12380)

(declare-fun b!1493248 () Bool)

(assert (=> b!1493248 (= e!836475 (= lt!650776 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650778 lt!650780 mask!2687)))))

(declare-fun b!1493242 () Bool)

(assert (=> b!1493242 (= e!836470 (or (= (select (arr!48115 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48115 a!2862) intermediateBeforeIndex!19) (select (arr!48115 a!2862) j!93))))))

(declare-fun res!1015928 () Bool)

(assert (=> start!127046 (=> (not res!1015928) (not e!836474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127046 (= res!1015928 (validMask!0 mask!2687))))

(assert (=> start!127046 e!836474))

(assert (=> start!127046 true))

(declare-fun array_inv!37348 (array!99691) Bool)

(assert (=> start!127046 (array_inv!37348 a!2862)))

(declare-fun b!1493249 () Bool)

(assert (=> b!1493249 (= e!836473 e!836476)))

(declare-fun res!1015933 () Bool)

(assert (=> b!1493249 (=> (not res!1015933) (not e!836476))))

(assert (=> b!1493249 (= res!1015933 (= lt!650776 (Intermediate!12380 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493249 (= lt!650776 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650778 mask!2687) lt!650778 lt!650780 mask!2687))))

(assert (=> b!1493249 (= lt!650778 (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493250 () Bool)

(declare-fun res!1015926 () Bool)

(assert (=> b!1493250 (=> (not res!1015926) (not e!836474))))

(assert (=> b!1493250 (= res!1015926 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48667 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48667 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48667 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127046 res!1015928) b!1493245))

(assert (= (and b!1493245 res!1015932) b!1493233))

(assert (= (and b!1493233 res!1015937) b!1493235))

(assert (= (and b!1493235 res!1015939) b!1493244))

(assert (= (and b!1493244 res!1015936) b!1493247))

(assert (= (and b!1493247 res!1015934) b!1493250))

(assert (= (and b!1493250 res!1015926) b!1493237))

(assert (= (and b!1493237 res!1015929) b!1493236))

(assert (= (and b!1493236 res!1015935) b!1493246))

(assert (= (and b!1493246 res!1015931) b!1493249))

(assert (= (and b!1493249 res!1015933) b!1493243))

(assert (= (and b!1493243 c!138187) b!1493248))

(assert (= (and b!1493243 (not c!138187)) b!1493234))

(assert (= (and b!1493243 res!1015930) b!1493240))

(assert (= (and b!1493240 res!1015924) b!1493238))

(assert (= (and b!1493238 res!1015938) b!1493241))

(assert (= (and b!1493241 res!1015927) b!1493242))

(assert (= (and b!1493238 (not res!1015925)) b!1493239))

(declare-fun m!1376475 () Bool)

(assert (=> start!127046 m!1376475))

(declare-fun m!1376477 () Bool)

(assert (=> start!127046 m!1376477))

(declare-fun m!1376479 () Bool)

(assert (=> b!1493241 m!1376479))

(assert (=> b!1493241 m!1376479))

(declare-fun m!1376481 () Bool)

(assert (=> b!1493241 m!1376481))

(declare-fun m!1376483 () Bool)

(assert (=> b!1493238 m!1376483))

(declare-fun m!1376485 () Bool)

(assert (=> b!1493238 m!1376485))

(declare-fun m!1376487 () Bool)

(assert (=> b!1493238 m!1376487))

(declare-fun m!1376489 () Bool)

(assert (=> b!1493238 m!1376489))

(declare-fun m!1376491 () Bool)

(assert (=> b!1493238 m!1376491))

(assert (=> b!1493238 m!1376479))

(declare-fun m!1376493 () Bool)

(assert (=> b!1493244 m!1376493))

(declare-fun m!1376495 () Bool)

(assert (=> b!1493239 m!1376495))

(assert (=> b!1493235 m!1376479))

(assert (=> b!1493235 m!1376479))

(declare-fun m!1376497 () Bool)

(assert (=> b!1493235 m!1376497))

(declare-fun m!1376499 () Bool)

(assert (=> b!1493233 m!1376499))

(assert (=> b!1493233 m!1376499))

(declare-fun m!1376501 () Bool)

(assert (=> b!1493233 m!1376501))

(assert (=> b!1493246 m!1376479))

(assert (=> b!1493246 m!1376479))

(declare-fun m!1376503 () Bool)

(assert (=> b!1493246 m!1376503))

(declare-fun m!1376505 () Bool)

(assert (=> b!1493242 m!1376505))

(assert (=> b!1493242 m!1376479))

(declare-fun m!1376507 () Bool)

(assert (=> b!1493234 m!1376507))

(declare-fun m!1376509 () Bool)

(assert (=> b!1493234 m!1376509))

(declare-fun m!1376511 () Bool)

(assert (=> b!1493248 m!1376511))

(declare-fun m!1376513 () Bool)

(assert (=> b!1493247 m!1376513))

(assert (=> b!1493237 m!1376485))

(declare-fun m!1376515 () Bool)

(assert (=> b!1493237 m!1376515))

(assert (=> b!1493236 m!1376479))

(assert (=> b!1493236 m!1376479))

(declare-fun m!1376517 () Bool)

(assert (=> b!1493236 m!1376517))

(assert (=> b!1493236 m!1376517))

(assert (=> b!1493236 m!1376479))

(declare-fun m!1376519 () Bool)

(assert (=> b!1493236 m!1376519))

(declare-fun m!1376521 () Bool)

(assert (=> b!1493249 m!1376521))

(assert (=> b!1493249 m!1376521))

(declare-fun m!1376523 () Bool)

(assert (=> b!1493249 m!1376523))

(assert (=> b!1493249 m!1376485))

(declare-fun m!1376525 () Bool)

(assert (=> b!1493249 m!1376525))

(check-sat (not b!1493236) (not b!1493248) (not b!1493244) (not b!1493239) (not b!1493249) (not b!1493233) (not b!1493235) (not start!127046) (not b!1493247) (not b!1493246) (not b!1493238) (not b!1493234) (not b!1493241))
(check-sat)
