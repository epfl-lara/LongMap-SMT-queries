; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125136 () Bool)

(assert start!125136)

(declare-fun b!1458927 () Bool)

(declare-fun res!989049 () Bool)

(declare-fun e!820515 () Bool)

(assert (=> b!1458927 (=> res!989049 e!820515)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!639082 () (_ BitVec 32))

(declare-datatypes ((array!98562 0))(
  ( (array!98563 (arr!47570 (Array (_ BitVec 32) (_ BitVec 64))) (size!48122 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98562)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11847 0))(
  ( (MissingZero!11847 (index!49780 (_ BitVec 32))) (Found!11847 (index!49781 (_ BitVec 32))) (Intermediate!11847 (undefined!12659 Bool) (index!49782 (_ BitVec 32)) (x!131387 (_ BitVec 32))) (Undefined!11847) (MissingVacant!11847 (index!49783 (_ BitVec 32))) )
))
(declare-fun lt!639087 () SeekEntryResult!11847)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98562 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1458927 (= res!989049 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639082 (select (arr!47570 a!2862) j!93) a!2862 mask!2687) lt!639087)))))

(declare-fun lt!639086 () (_ BitVec 64))

(declare-fun lt!639081 () array!98562)

(declare-fun lt!639080 () SeekEntryResult!11847)

(declare-fun e!820521 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1458928 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98562 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1458928 (= e!820521 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639082 intermediateAfterIndex!19 lt!639086 lt!639081 mask!2687) lt!639080)))))

(declare-fun b!1458929 () Bool)

(declare-fun res!989044 () Bool)

(assert (=> b!1458929 (=> res!989044 e!820515)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458929 (= res!989044 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1458930 () Bool)

(declare-fun e!820514 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98562 (_ BitVec 32)) SeekEntryResult!11847)

(assert (=> b!1458930 (= e!820514 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639086 lt!639081 mask!2687) (seekEntryOrOpen!0 lt!639086 lt!639081 mask!2687)))))

(declare-fun b!1458931 () Bool)

(declare-fun res!989047 () Bool)

(declare-fun e!820519 () Bool)

(assert (=> b!1458931 (=> (not res!989047) (not e!820519))))

(declare-datatypes ((List!34149 0))(
  ( (Nil!34146) (Cons!34145 (h!35495 (_ BitVec 64)) (t!48835 List!34149)) )
))
(declare-fun arrayNoDuplicates!0 (array!98562 (_ BitVec 32) List!34149) Bool)

(assert (=> b!1458931 (= res!989047 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34146))))

(declare-fun b!1458932 () Bool)

(declare-fun lt!639079 () SeekEntryResult!11847)

(assert (=> b!1458932 (= e!820521 (not (= lt!639079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639082 lt!639086 lt!639081 mask!2687))))))

(declare-fun b!1458933 () Bool)

(declare-fun res!989042 () Bool)

(assert (=> b!1458933 (=> (not res!989042) (not e!820519))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458933 (= res!989042 (validKeyInArray!0 (select (arr!47570 a!2862) i!1006)))))

(declare-fun b!1458934 () Bool)

(assert (=> b!1458934 (= e!820515 true)))

(declare-fun lt!639084 () SeekEntryResult!11847)

(assert (=> b!1458934 (= lt!639084 lt!639080)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49031 0))(
  ( (Unit!49032) )
))
(declare-fun lt!639083 () Unit!49031)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49031)

(assert (=> b!1458934 (= lt!639083 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639082 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458935 () Bool)

(declare-fun res!989040 () Bool)

(assert (=> b!1458935 (=> (not res!989040) (not e!820519))))

(assert (=> b!1458935 (= res!989040 (and (= (size!48122 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48122 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48122 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458936 () Bool)

(declare-fun res!989056 () Bool)

(declare-fun e!820517 () Bool)

(assert (=> b!1458936 (=> (not res!989056) (not e!820517))))

(assert (=> b!1458936 (= res!989056 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458937 () Bool)

(declare-fun e!820513 () Bool)

(assert (=> b!1458937 (= e!820519 e!820513)))

(declare-fun res!989054 () Bool)

(assert (=> b!1458937 (=> (not res!989054) (not e!820513))))

(assert (=> b!1458937 (= res!989054 (= (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458937 (= lt!639081 (array!98563 (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48122 a!2862)))))

(declare-fun b!1458938 () Bool)

(declare-fun res!989046 () Bool)

(assert (=> b!1458938 (=> (not res!989046) (not e!820519))))

(assert (=> b!1458938 (= res!989046 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48122 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48122 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48122 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458939 () Bool)

(declare-fun e!820520 () Bool)

(assert (=> b!1458939 (= e!820520 e!820517)))

(declare-fun res!989053 () Bool)

(assert (=> b!1458939 (=> (not res!989053) (not e!820517))))

(assert (=> b!1458939 (= res!989053 (= lt!639079 (Intermediate!11847 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458939 (= lt!639079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639086 mask!2687) lt!639086 lt!639081 mask!2687))))

(assert (=> b!1458939 (= lt!639086 (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458940 () Bool)

(declare-fun res!989039 () Bool)

(assert (=> b!1458940 (=> (not res!989039) (not e!820519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98562 (_ BitVec 32)) Bool)

(assert (=> b!1458940 (= res!989039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458941 () Bool)

(assert (=> b!1458941 (= e!820514 (= lt!639079 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639086 lt!639081 mask!2687)))))

(declare-fun b!1458942 () Bool)

(declare-fun res!989043 () Bool)

(assert (=> b!1458942 (=> (not res!989043) (not e!820520))))

(assert (=> b!1458942 (= res!989043 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47570 a!2862) j!93) a!2862 mask!2687) lt!639087))))

(declare-fun b!1458943 () Bool)

(declare-fun e!820518 () Bool)

(assert (=> b!1458943 (= e!820518 e!820515)))

(declare-fun res!989052 () Bool)

(assert (=> b!1458943 (=> res!989052 e!820515)))

(assert (=> b!1458943 (= res!989052 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639082 #b00000000000000000000000000000000) (bvsge lt!639082 (size!48122 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458943 (= lt!639082 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458943 (= lt!639080 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639086 lt!639081 mask!2687))))

(assert (=> b!1458943 (= lt!639080 (seekEntryOrOpen!0 lt!639086 lt!639081 mask!2687))))

(declare-fun b!1458944 () Bool)

(assert (=> b!1458944 (= e!820517 (not e!820518))))

(declare-fun res!989051 () Bool)

(assert (=> b!1458944 (=> res!989051 e!820518)))

(assert (=> b!1458944 (= res!989051 (or (and (= (select (arr!47570 a!2862) index!646) (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47570 a!2862) index!646) (select (arr!47570 a!2862) j!93))) (= (select (arr!47570 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458944 (and (= lt!639084 (Found!11847 j!93)) (or (= (select (arr!47570 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47570 a!2862) intermediateBeforeIndex!19) (select (arr!47570 a!2862) j!93))) (let ((bdg!53483 (select (store (arr!47570 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47570 a!2862) index!646) bdg!53483) (= (select (arr!47570 a!2862) index!646) (select (arr!47570 a!2862) j!93))) (= (select (arr!47570 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53483 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458944 (= lt!639084 (seekEntryOrOpen!0 (select (arr!47570 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1458944 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639085 () Unit!49031)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49031)

(assert (=> b!1458944 (= lt!639085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458945 () Bool)

(assert (=> b!1458945 (= e!820513 e!820520)))

(declare-fun res!989048 () Bool)

(assert (=> b!1458945 (=> (not res!989048) (not e!820520))))

(assert (=> b!1458945 (= res!989048 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47570 a!2862) j!93) mask!2687) (select (arr!47570 a!2862) j!93) a!2862 mask!2687) lt!639087))))

(assert (=> b!1458945 (= lt!639087 (Intermediate!11847 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!989041 () Bool)

(assert (=> start!125136 (=> (not res!989041) (not e!820519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125136 (= res!989041 (validMask!0 mask!2687))))

(assert (=> start!125136 e!820519))

(assert (=> start!125136 true))

(declare-fun array_inv!36803 (array!98562) Bool)

(assert (=> start!125136 (array_inv!36803 a!2862)))

(declare-fun b!1458946 () Bool)

(declare-fun res!989045 () Bool)

(assert (=> b!1458946 (=> (not res!989045) (not e!820519))))

(assert (=> b!1458946 (= res!989045 (validKeyInArray!0 (select (arr!47570 a!2862) j!93)))))

(declare-fun b!1458947 () Bool)

(declare-fun res!989055 () Bool)

(assert (=> b!1458947 (=> (not res!989055) (not e!820517))))

(assert (=> b!1458947 (= res!989055 e!820514)))

(declare-fun c!134458 () Bool)

(assert (=> b!1458947 (= c!134458 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458948 () Bool)

(declare-fun res!989050 () Bool)

(assert (=> b!1458948 (=> res!989050 e!820515)))

(assert (=> b!1458948 (= res!989050 e!820521)))

(declare-fun c!134457 () Bool)

(assert (=> b!1458948 (= c!134457 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125136 res!989041) b!1458935))

(assert (= (and b!1458935 res!989040) b!1458933))

(assert (= (and b!1458933 res!989042) b!1458946))

(assert (= (and b!1458946 res!989045) b!1458940))

(assert (= (and b!1458940 res!989039) b!1458931))

(assert (= (and b!1458931 res!989047) b!1458938))

(assert (= (and b!1458938 res!989046) b!1458937))

(assert (= (and b!1458937 res!989054) b!1458945))

(assert (= (and b!1458945 res!989048) b!1458942))

(assert (= (and b!1458942 res!989043) b!1458939))

(assert (= (and b!1458939 res!989053) b!1458947))

(assert (= (and b!1458947 c!134458) b!1458941))

(assert (= (and b!1458947 (not c!134458)) b!1458930))

(assert (= (and b!1458947 res!989055) b!1458936))

(assert (= (and b!1458936 res!989056) b!1458944))

(assert (= (and b!1458944 (not res!989051)) b!1458943))

(assert (= (and b!1458943 (not res!989052)) b!1458927))

(assert (= (and b!1458927 (not res!989049)) b!1458948))

(assert (= (and b!1458948 c!134457) b!1458932))

(assert (= (and b!1458948 (not c!134457)) b!1458928))

(assert (= (and b!1458948 (not res!989050)) b!1458929))

(assert (= (and b!1458929 (not res!989044)) b!1458934))

(declare-fun m!1346235 () Bool)

(assert (=> b!1458945 m!1346235))

(assert (=> b!1458945 m!1346235))

(declare-fun m!1346237 () Bool)

(assert (=> b!1458945 m!1346237))

(assert (=> b!1458945 m!1346237))

(assert (=> b!1458945 m!1346235))

(declare-fun m!1346239 () Bool)

(assert (=> b!1458945 m!1346239))

(assert (=> b!1458946 m!1346235))

(assert (=> b!1458946 m!1346235))

(declare-fun m!1346241 () Bool)

(assert (=> b!1458946 m!1346241))

(declare-fun m!1346243 () Bool)

(assert (=> b!1458930 m!1346243))

(declare-fun m!1346245 () Bool)

(assert (=> b!1458930 m!1346245))

(declare-fun m!1346247 () Bool)

(assert (=> b!1458932 m!1346247))

(declare-fun m!1346249 () Bool)

(assert (=> b!1458941 m!1346249))

(declare-fun m!1346251 () Bool)

(assert (=> b!1458940 m!1346251))

(declare-fun m!1346253 () Bool)

(assert (=> b!1458943 m!1346253))

(assert (=> b!1458943 m!1346243))

(assert (=> b!1458943 m!1346245))

(declare-fun m!1346255 () Bool)

(assert (=> b!1458933 m!1346255))

(assert (=> b!1458933 m!1346255))

(declare-fun m!1346257 () Bool)

(assert (=> b!1458933 m!1346257))

(assert (=> b!1458927 m!1346235))

(assert (=> b!1458927 m!1346235))

(declare-fun m!1346259 () Bool)

(assert (=> b!1458927 m!1346259))

(declare-fun m!1346261 () Bool)

(assert (=> b!1458944 m!1346261))

(declare-fun m!1346263 () Bool)

(assert (=> b!1458944 m!1346263))

(declare-fun m!1346265 () Bool)

(assert (=> b!1458944 m!1346265))

(declare-fun m!1346267 () Bool)

(assert (=> b!1458944 m!1346267))

(declare-fun m!1346269 () Bool)

(assert (=> b!1458944 m!1346269))

(assert (=> b!1458944 m!1346235))

(declare-fun m!1346271 () Bool)

(assert (=> b!1458944 m!1346271))

(declare-fun m!1346273 () Bool)

(assert (=> b!1458944 m!1346273))

(assert (=> b!1458944 m!1346235))

(declare-fun m!1346275 () Bool)

(assert (=> b!1458934 m!1346275))

(declare-fun m!1346277 () Bool)

(assert (=> b!1458928 m!1346277))

(declare-fun m!1346279 () Bool)

(assert (=> b!1458931 m!1346279))

(declare-fun m!1346281 () Bool)

(assert (=> b!1458939 m!1346281))

(assert (=> b!1458939 m!1346281))

(declare-fun m!1346283 () Bool)

(assert (=> b!1458939 m!1346283))

(assert (=> b!1458939 m!1346263))

(declare-fun m!1346285 () Bool)

(assert (=> b!1458939 m!1346285))

(assert (=> b!1458937 m!1346263))

(declare-fun m!1346287 () Bool)

(assert (=> b!1458937 m!1346287))

(declare-fun m!1346289 () Bool)

(assert (=> start!125136 m!1346289))

(declare-fun m!1346291 () Bool)

(assert (=> start!125136 m!1346291))

(assert (=> b!1458942 m!1346235))

(assert (=> b!1458942 m!1346235))

(declare-fun m!1346293 () Bool)

(assert (=> b!1458942 m!1346293))

(push 1)

(assert (not b!1458934))

(assert (not b!1458940))

(assert (not b!1458942))

(assert (not b!1458928))

(assert (not b!1458941))

(assert (not b!1458946))

(assert (not b!1458943))

(assert (not b!1458927))

(assert (not b!1458945))

(assert (not b!1458932))

(assert (not start!125136))

(assert (not b!1458939))

(assert (not b!1458933))

(assert (not b!1458944))

(assert (not b!1458931))

(assert (not b!1458930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

