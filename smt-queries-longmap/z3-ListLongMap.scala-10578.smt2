; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124576 () Bool)

(assert start!124576)

(declare-fun b!1442651 () Bool)

(declare-fun res!974945 () Bool)

(declare-fun e!813034 () Bool)

(assert (=> b!1442651 (=> (not res!974945) (not e!813034))))

(declare-datatypes ((array!98002 0))(
  ( (array!98003 (arr!47290 (Array (_ BitVec 32) (_ BitVec 64))) (size!47842 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98002)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442651 (= res!974945 (validKeyInArray!0 (select (arr!47290 a!2862) j!93)))))

(declare-fun b!1442652 () Bool)

(declare-fun e!813032 () Bool)

(assert (=> b!1442652 (= e!813034 e!813032)))

(declare-fun res!974950 () Bool)

(assert (=> b!1442652 (=> (not res!974950) (not e!813032))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442652 (= res!974950 (= (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633446 () array!98002)

(assert (=> b!1442652 (= lt!633446 (array!98003 (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47842 a!2862)))))

(declare-fun b!1442653 () Bool)

(declare-fun res!974944 () Bool)

(assert (=> b!1442653 (=> (not res!974944) (not e!813034))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1442653 (= res!974944 (and (= (size!47842 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47842 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47842 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442654 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!813033 () Bool)

(assert (=> b!1442654 (= e!813033 (not (or (not (= (select (arr!47290 a!2862) index!646) (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47290 a!2862) index!646) (select (arr!47290 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!813035 () Bool)

(assert (=> b!1442654 e!813035))

(declare-fun res!974947 () Bool)

(assert (=> b!1442654 (=> (not res!974947) (not e!813035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98002 (_ BitVec 32)) Bool)

(assert (=> b!1442654 (= res!974947 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48471 0))(
  ( (Unit!48472) )
))
(declare-fun lt!633447 () Unit!48471)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48471)

(assert (=> b!1442654 (= lt!633447 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442655 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442655 (= e!813035 (or (= (select (arr!47290 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47290 a!2862) intermediateBeforeIndex!19) (select (arr!47290 a!2862) j!93))))))

(declare-fun b!1442656 () Bool)

(declare-fun e!813030 () Bool)

(assert (=> b!1442656 (= e!813030 e!813033)))

(declare-fun res!974943 () Bool)

(assert (=> b!1442656 (=> (not res!974943) (not e!813033))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11567 0))(
  ( (MissingZero!11567 (index!48660 (_ BitVec 32))) (Found!11567 (index!48661 (_ BitVec 32))) (Intermediate!11567 (undefined!12379 Bool) (index!48662 (_ BitVec 32)) (x!130363 (_ BitVec 32))) (Undefined!11567) (MissingVacant!11567 (index!48663 (_ BitVec 32))) )
))
(declare-fun lt!633448 () SeekEntryResult!11567)

(assert (=> b!1442656 (= res!974943 (= lt!633448 (Intermediate!11567 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633450 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98002 (_ BitVec 32)) SeekEntryResult!11567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442656 (= lt!633448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633450 mask!2687) lt!633450 lt!633446 mask!2687))))

(assert (=> b!1442656 (= lt!633450 (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442657 () Bool)

(declare-fun res!974953 () Bool)

(assert (=> b!1442657 (=> (not res!974953) (not e!813030))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633449 () SeekEntryResult!11567)

(assert (=> b!1442657 (= res!974953 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47290 a!2862) j!93) a!2862 mask!2687) lt!633449))))

(declare-fun b!1442658 () Bool)

(declare-fun e!813036 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98002 (_ BitVec 32)) SeekEntryResult!11567)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98002 (_ BitVec 32)) SeekEntryResult!11567)

(assert (=> b!1442658 (= e!813036 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633450 lt!633446 mask!2687) (seekEntryOrOpen!0 lt!633450 lt!633446 mask!2687)))))

(declare-fun b!1442659 () Bool)

(declare-fun res!974940 () Bool)

(assert (=> b!1442659 (=> (not res!974940) (not e!813033))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442659 (= res!974940 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442661 () Bool)

(assert (=> b!1442661 (= e!813036 (= lt!633448 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633450 lt!633446 mask!2687)))))

(declare-fun b!1442662 () Bool)

(declare-fun res!974949 () Bool)

(assert (=> b!1442662 (=> (not res!974949) (not e!813034))))

(assert (=> b!1442662 (= res!974949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442663 () Bool)

(declare-fun res!974942 () Bool)

(assert (=> b!1442663 (=> (not res!974942) (not e!813034))))

(declare-datatypes ((List!33869 0))(
  ( (Nil!33866) (Cons!33865 (h!35215 (_ BitVec 64)) (t!48555 List!33869)) )
))
(declare-fun arrayNoDuplicates!0 (array!98002 (_ BitVec 32) List!33869) Bool)

(assert (=> b!1442663 (= res!974942 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33866))))

(declare-fun b!1442664 () Bool)

(declare-fun res!974951 () Bool)

(assert (=> b!1442664 (=> (not res!974951) (not e!813035))))

(assert (=> b!1442664 (= res!974951 (= (seekEntryOrOpen!0 (select (arr!47290 a!2862) j!93) a!2862 mask!2687) (Found!11567 j!93)))))

(declare-fun b!1442665 () Bool)

(assert (=> b!1442665 (= e!813032 e!813030)))

(declare-fun res!974941 () Bool)

(assert (=> b!1442665 (=> (not res!974941) (not e!813030))))

(assert (=> b!1442665 (= res!974941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47290 a!2862) j!93) mask!2687) (select (arr!47290 a!2862) j!93) a!2862 mask!2687) lt!633449))))

(assert (=> b!1442665 (= lt!633449 (Intermediate!11567 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!974948 () Bool)

(assert (=> start!124576 (=> (not res!974948) (not e!813034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124576 (= res!974948 (validMask!0 mask!2687))))

(assert (=> start!124576 e!813034))

(assert (=> start!124576 true))

(declare-fun array_inv!36523 (array!98002) Bool)

(assert (=> start!124576 (array_inv!36523 a!2862)))

(declare-fun b!1442660 () Bool)

(declare-fun res!974952 () Bool)

(assert (=> b!1442660 (=> (not res!974952) (not e!813033))))

(assert (=> b!1442660 (= res!974952 e!813036)))

(declare-fun c!133369 () Bool)

(assert (=> b!1442660 (= c!133369 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442666 () Bool)

(declare-fun res!974946 () Bool)

(assert (=> b!1442666 (=> (not res!974946) (not e!813034))))

(assert (=> b!1442666 (= res!974946 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47842 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47842 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47842 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442667 () Bool)

(declare-fun res!974939 () Bool)

(assert (=> b!1442667 (=> (not res!974939) (not e!813034))))

(assert (=> b!1442667 (= res!974939 (validKeyInArray!0 (select (arr!47290 a!2862) i!1006)))))

(assert (= (and start!124576 res!974948) b!1442653))

(assert (= (and b!1442653 res!974944) b!1442667))

(assert (= (and b!1442667 res!974939) b!1442651))

(assert (= (and b!1442651 res!974945) b!1442662))

(assert (= (and b!1442662 res!974949) b!1442663))

(assert (= (and b!1442663 res!974942) b!1442666))

(assert (= (and b!1442666 res!974946) b!1442652))

(assert (= (and b!1442652 res!974950) b!1442665))

(assert (= (and b!1442665 res!974941) b!1442657))

(assert (= (and b!1442657 res!974953) b!1442656))

(assert (= (and b!1442656 res!974943) b!1442660))

(assert (= (and b!1442660 c!133369) b!1442661))

(assert (= (and b!1442660 (not c!133369)) b!1442658))

(assert (= (and b!1442660 res!974952) b!1442659))

(assert (= (and b!1442659 res!974940) b!1442654))

(assert (= (and b!1442654 res!974947) b!1442664))

(assert (= (and b!1442664 res!974951) b!1442655))

(declare-fun m!1331283 () Bool)

(assert (=> b!1442658 m!1331283))

(declare-fun m!1331285 () Bool)

(assert (=> b!1442658 m!1331285))

(declare-fun m!1331287 () Bool)

(assert (=> b!1442667 m!1331287))

(assert (=> b!1442667 m!1331287))

(declare-fun m!1331289 () Bool)

(assert (=> b!1442667 m!1331289))

(declare-fun m!1331291 () Bool)

(assert (=> b!1442664 m!1331291))

(assert (=> b!1442664 m!1331291))

(declare-fun m!1331293 () Bool)

(assert (=> b!1442664 m!1331293))

(assert (=> b!1442651 m!1331291))

(assert (=> b!1442651 m!1331291))

(declare-fun m!1331295 () Bool)

(assert (=> b!1442651 m!1331295))

(declare-fun m!1331297 () Bool)

(assert (=> b!1442663 m!1331297))

(assert (=> b!1442665 m!1331291))

(assert (=> b!1442665 m!1331291))

(declare-fun m!1331299 () Bool)

(assert (=> b!1442665 m!1331299))

(assert (=> b!1442665 m!1331299))

(assert (=> b!1442665 m!1331291))

(declare-fun m!1331301 () Bool)

(assert (=> b!1442665 m!1331301))

(declare-fun m!1331303 () Bool)

(assert (=> b!1442652 m!1331303))

(declare-fun m!1331305 () Bool)

(assert (=> b!1442652 m!1331305))

(assert (=> b!1442657 m!1331291))

(assert (=> b!1442657 m!1331291))

(declare-fun m!1331307 () Bool)

(assert (=> b!1442657 m!1331307))

(declare-fun m!1331309 () Bool)

(assert (=> b!1442662 m!1331309))

(declare-fun m!1331311 () Bool)

(assert (=> b!1442656 m!1331311))

(assert (=> b!1442656 m!1331311))

(declare-fun m!1331313 () Bool)

(assert (=> b!1442656 m!1331313))

(assert (=> b!1442656 m!1331303))

(declare-fun m!1331315 () Bool)

(assert (=> b!1442656 m!1331315))

(declare-fun m!1331317 () Bool)

(assert (=> b!1442661 m!1331317))

(declare-fun m!1331319 () Bool)

(assert (=> start!124576 m!1331319))

(declare-fun m!1331321 () Bool)

(assert (=> start!124576 m!1331321))

(declare-fun m!1331323 () Bool)

(assert (=> b!1442655 m!1331323))

(assert (=> b!1442655 m!1331291))

(declare-fun m!1331325 () Bool)

(assert (=> b!1442654 m!1331325))

(assert (=> b!1442654 m!1331303))

(declare-fun m!1331327 () Bool)

(assert (=> b!1442654 m!1331327))

(declare-fun m!1331329 () Bool)

(assert (=> b!1442654 m!1331329))

(declare-fun m!1331331 () Bool)

(assert (=> b!1442654 m!1331331))

(assert (=> b!1442654 m!1331291))

(check-sat (not b!1442662) (not b!1442651) (not start!124576) (not b!1442667) (not b!1442664) (not b!1442658) (not b!1442665) (not b!1442657) (not b!1442663) (not b!1442656) (not b!1442661) (not b!1442654))
(check-sat)
