; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125800 () Bool)

(assert start!125800)

(declare-fun b!1472570 () Bool)

(declare-fun e!826406 () Bool)

(declare-fun e!826407 () Bool)

(assert (=> b!1472570 (= e!826406 e!826407)))

(declare-fun res!1000226 () Bool)

(assert (=> b!1472570 (=> (not res!1000226) (not e!826407))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99134 0))(
  ( (array!99135 (arr!47852 (Array (_ BitVec 32) (_ BitVec 64))) (size!48402 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99134)

(assert (=> b!1472570 (= res!1000226 (= (select (store (arr!47852 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643613 () array!99134)

(assert (=> b!1472570 (= lt!643613 (array!99135 (store (arr!47852 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48402 a!2862)))))

(declare-fun b!1472571 () Bool)

(declare-fun res!1000223 () Bool)

(assert (=> b!1472571 (=> (not res!1000223) (not e!826406))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472571 (= res!1000223 (validKeyInArray!0 (select (arr!47852 a!2862) j!93)))))

(declare-fun b!1472572 () Bool)

(declare-fun res!1000222 () Bool)

(declare-fun e!826405 () Bool)

(assert (=> b!1472572 (=> (not res!1000222) (not e!826405))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12092 0))(
  ( (MissingZero!12092 (index!50760 (_ BitVec 32))) (Found!12092 (index!50761 (_ BitVec 32))) (Intermediate!12092 (undefined!12904 Bool) (index!50762 (_ BitVec 32)) (x!132343 (_ BitVec 32))) (Undefined!12092) (MissingVacant!12092 (index!50763 (_ BitVec 32))) )
))
(declare-fun lt!643614 () SeekEntryResult!12092)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99134 (_ BitVec 32)) SeekEntryResult!12092)

(assert (=> b!1472572 (= res!1000222 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47852 a!2862) j!93) a!2862 mask!2687) lt!643614))))

(declare-fun b!1472573 () Bool)

(declare-fun lt!643612 () (_ BitVec 64))

(declare-fun e!826404 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99134 (_ BitVec 32)) SeekEntryResult!12092)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99134 (_ BitVec 32)) SeekEntryResult!12092)

(assert (=> b!1472573 (= e!826404 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643612 lt!643613 mask!2687) (seekEntryOrOpen!0 lt!643612 lt!643613 mask!2687)))))

(declare-fun b!1472574 () Bool)

(declare-fun res!1000217 () Bool)

(assert (=> b!1472574 (=> (not res!1000217) (not e!826406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99134 (_ BitVec 32)) Bool)

(assert (=> b!1472574 (= res!1000217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472575 () Bool)

(declare-fun res!1000230 () Bool)

(assert (=> b!1472575 (=> (not res!1000230) (not e!826406))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472575 (= res!1000230 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48402 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48402 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48402 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472576 () Bool)

(declare-fun e!826403 () Bool)

(assert (=> b!1472576 (= e!826403 (not true))))

(declare-fun e!826408 () Bool)

(assert (=> b!1472576 e!826408))

(declare-fun res!1000219 () Bool)

(assert (=> b!1472576 (=> (not res!1000219) (not e!826408))))

(assert (=> b!1472576 (= res!1000219 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49524 0))(
  ( (Unit!49525) )
))
(declare-fun lt!643611 () Unit!49524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49524)

(assert (=> b!1472576 (= lt!643611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472578 () Bool)

(declare-fun res!1000229 () Bool)

(assert (=> b!1472578 (=> (not res!1000229) (not e!826403))))

(assert (=> b!1472578 (= res!1000229 e!826404)))

(declare-fun c!135690 () Bool)

(assert (=> b!1472578 (= c!135690 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472579 () Bool)

(declare-fun res!1000228 () Bool)

(assert (=> b!1472579 (=> (not res!1000228) (not e!826403))))

(assert (=> b!1472579 (= res!1000228 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472580 () Bool)

(assert (=> b!1472580 (= e!826407 e!826405)))

(declare-fun res!1000220 () Bool)

(assert (=> b!1472580 (=> (not res!1000220) (not e!826405))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472580 (= res!1000220 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47852 a!2862) j!93) mask!2687) (select (arr!47852 a!2862) j!93) a!2862 mask!2687) lt!643614))))

(assert (=> b!1472580 (= lt!643614 (Intermediate!12092 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472581 () Bool)

(assert (=> b!1472581 (= e!826405 e!826403)))

(declare-fun res!1000231 () Bool)

(assert (=> b!1472581 (=> (not res!1000231) (not e!826403))))

(declare-fun lt!643610 () SeekEntryResult!12092)

(assert (=> b!1472581 (= res!1000231 (= lt!643610 (Intermediate!12092 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472581 (= lt!643610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643612 mask!2687) lt!643612 lt!643613 mask!2687))))

(assert (=> b!1472581 (= lt!643612 (select (store (arr!47852 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472582 () Bool)

(declare-fun res!1000227 () Bool)

(assert (=> b!1472582 (=> (not res!1000227) (not e!826406))))

(assert (=> b!1472582 (= res!1000227 (and (= (size!48402 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48402 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48402 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472583 () Bool)

(declare-fun res!1000224 () Bool)

(assert (=> b!1472583 (=> (not res!1000224) (not e!826406))))

(assert (=> b!1472583 (= res!1000224 (validKeyInArray!0 (select (arr!47852 a!2862) i!1006)))))

(declare-fun b!1472584 () Bool)

(assert (=> b!1472584 (= e!826408 (or (= (select (arr!47852 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47852 a!2862) intermediateBeforeIndex!19) (select (arr!47852 a!2862) j!93))))))

(declare-fun b!1472577 () Bool)

(assert (=> b!1472577 (= e!826404 (= lt!643610 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643612 lt!643613 mask!2687)))))

(declare-fun res!1000218 () Bool)

(assert (=> start!125800 (=> (not res!1000218) (not e!826406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125800 (= res!1000218 (validMask!0 mask!2687))))

(assert (=> start!125800 e!826406))

(assert (=> start!125800 true))

(declare-fun array_inv!36880 (array!99134) Bool)

(assert (=> start!125800 (array_inv!36880 a!2862)))

(declare-fun b!1472585 () Bool)

(declare-fun res!1000221 () Bool)

(assert (=> b!1472585 (=> (not res!1000221) (not e!826406))))

(declare-datatypes ((List!34353 0))(
  ( (Nil!34350) (Cons!34349 (h!35705 (_ BitVec 64)) (t!49047 List!34353)) )
))
(declare-fun arrayNoDuplicates!0 (array!99134 (_ BitVec 32) List!34353) Bool)

(assert (=> b!1472585 (= res!1000221 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34350))))

(declare-fun b!1472586 () Bool)

(declare-fun res!1000225 () Bool)

(assert (=> b!1472586 (=> (not res!1000225) (not e!826408))))

(assert (=> b!1472586 (= res!1000225 (= (seekEntryOrOpen!0 (select (arr!47852 a!2862) j!93) a!2862 mask!2687) (Found!12092 j!93)))))

(assert (= (and start!125800 res!1000218) b!1472582))

(assert (= (and b!1472582 res!1000227) b!1472583))

(assert (= (and b!1472583 res!1000224) b!1472571))

(assert (= (and b!1472571 res!1000223) b!1472574))

(assert (= (and b!1472574 res!1000217) b!1472585))

(assert (= (and b!1472585 res!1000221) b!1472575))

(assert (= (and b!1472575 res!1000230) b!1472570))

(assert (= (and b!1472570 res!1000226) b!1472580))

(assert (= (and b!1472580 res!1000220) b!1472572))

(assert (= (and b!1472572 res!1000222) b!1472581))

(assert (= (and b!1472581 res!1000231) b!1472578))

(assert (= (and b!1472578 c!135690) b!1472577))

(assert (= (and b!1472578 (not c!135690)) b!1472573))

(assert (= (and b!1472578 res!1000229) b!1472579))

(assert (= (and b!1472579 res!1000228) b!1472576))

(assert (= (and b!1472576 res!1000219) b!1472586))

(assert (= (and b!1472586 res!1000225) b!1472584))

(declare-fun m!1359271 () Bool)

(assert (=> b!1472572 m!1359271))

(assert (=> b!1472572 m!1359271))

(declare-fun m!1359273 () Bool)

(assert (=> b!1472572 m!1359273))

(declare-fun m!1359275 () Bool)

(assert (=> start!125800 m!1359275))

(declare-fun m!1359277 () Bool)

(assert (=> start!125800 m!1359277))

(declare-fun m!1359279 () Bool)

(assert (=> b!1472585 m!1359279))

(declare-fun m!1359281 () Bool)

(assert (=> b!1472570 m!1359281))

(declare-fun m!1359283 () Bool)

(assert (=> b!1472570 m!1359283))

(assert (=> b!1472586 m!1359271))

(assert (=> b!1472586 m!1359271))

(declare-fun m!1359285 () Bool)

(assert (=> b!1472586 m!1359285))

(declare-fun m!1359287 () Bool)

(assert (=> b!1472584 m!1359287))

(assert (=> b!1472584 m!1359271))

(declare-fun m!1359289 () Bool)

(assert (=> b!1472574 m!1359289))

(declare-fun m!1359291 () Bool)

(assert (=> b!1472576 m!1359291))

(declare-fun m!1359293 () Bool)

(assert (=> b!1472576 m!1359293))

(declare-fun m!1359295 () Bool)

(assert (=> b!1472573 m!1359295))

(declare-fun m!1359297 () Bool)

(assert (=> b!1472573 m!1359297))

(assert (=> b!1472571 m!1359271))

(assert (=> b!1472571 m!1359271))

(declare-fun m!1359299 () Bool)

(assert (=> b!1472571 m!1359299))

(assert (=> b!1472580 m!1359271))

(assert (=> b!1472580 m!1359271))

(declare-fun m!1359301 () Bool)

(assert (=> b!1472580 m!1359301))

(assert (=> b!1472580 m!1359301))

(assert (=> b!1472580 m!1359271))

(declare-fun m!1359303 () Bool)

(assert (=> b!1472580 m!1359303))

(declare-fun m!1359305 () Bool)

(assert (=> b!1472583 m!1359305))

(assert (=> b!1472583 m!1359305))

(declare-fun m!1359307 () Bool)

(assert (=> b!1472583 m!1359307))

(declare-fun m!1359309 () Bool)

(assert (=> b!1472577 m!1359309))

(declare-fun m!1359311 () Bool)

(assert (=> b!1472581 m!1359311))

(assert (=> b!1472581 m!1359311))

(declare-fun m!1359313 () Bool)

(assert (=> b!1472581 m!1359313))

(assert (=> b!1472581 m!1359281))

(declare-fun m!1359315 () Bool)

(assert (=> b!1472581 m!1359315))

(push 1)

