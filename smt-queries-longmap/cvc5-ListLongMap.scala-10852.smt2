; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127090 () Bool)

(assert start!127090)

(declare-fun b!1493440 () Bool)

(declare-fun res!1015928 () Bool)

(declare-fun e!836631 () Bool)

(assert (=> b!1493440 (=> (not res!1015928) (not e!836631))))

(declare-datatypes ((array!99737 0))(
  ( (array!99738 (arr!48137 (Array (_ BitVec 32) (_ BitVec 64))) (size!48687 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99737)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493440 (= res!1015928 (validKeyInArray!0 (select (arr!48137 a!2862) i!1006)))))

(declare-fun b!1493441 () Bool)

(declare-fun res!1015937 () Bool)

(assert (=> b!1493441 (=> (not res!1015937) (not e!836631))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99737 (_ BitVec 32)) Bool)

(assert (=> b!1493441 (= res!1015937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493442 () Bool)

(declare-fun res!1015927 () Bool)

(assert (=> b!1493442 (=> (not res!1015927) (not e!836631))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493442 (= res!1015927 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48687 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48687 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48687 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493443 () Bool)

(declare-fun e!836626 () Bool)

(declare-fun e!836633 () Bool)

(assert (=> b!1493443 (= e!836626 (not e!836633))))

(declare-fun res!1015924 () Bool)

(assert (=> b!1493443 (=> res!1015924 e!836633)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1493443 (= res!1015924 (or (and (= (select (arr!48137 a!2862) index!646) (select (store (arr!48137 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48137 a!2862) index!646) (select (arr!48137 a!2862) j!93))) (= (select (arr!48137 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836628 () Bool)

(assert (=> b!1493443 e!836628))

(declare-fun res!1015934 () Bool)

(assert (=> b!1493443 (=> (not res!1015934) (not e!836628))))

(assert (=> b!1493443 (= res!1015934 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50094 0))(
  ( (Unit!50095) )
))
(declare-fun lt!651026 () Unit!50094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50094)

(assert (=> b!1493443 (= lt!651026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!836627 () Bool)

(declare-fun b!1493444 () Bool)

(declare-fun lt!651027 () array!99737)

(declare-fun lt!651029 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12377 0))(
  ( (MissingZero!12377 (index!51900 (_ BitVec 32))) (Found!12377 (index!51901 (_ BitVec 32))) (Intermediate!12377 (undefined!13189 Bool) (index!51902 (_ BitVec 32)) (x!133505 (_ BitVec 32))) (Undefined!12377) (MissingVacant!12377 (index!51903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99737 (_ BitVec 32)) SeekEntryResult!12377)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99737 (_ BitVec 32)) SeekEntryResult!12377)

(assert (=> b!1493444 (= e!836627 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651029 lt!651027 mask!2687) (seekEntryOrOpen!0 lt!651029 lt!651027 mask!2687)))))

(declare-fun b!1493445 () Bool)

(declare-fun res!1015938 () Bool)

(declare-fun e!836630 () Bool)

(assert (=> b!1493445 (=> (not res!1015938) (not e!836630))))

(declare-fun lt!651030 () SeekEntryResult!12377)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99737 (_ BitVec 32)) SeekEntryResult!12377)

(assert (=> b!1493445 (= res!1015938 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48137 a!2862) j!93) a!2862 mask!2687) lt!651030))))

(declare-fun b!1493446 () Bool)

(declare-fun e!836632 () Bool)

(assert (=> b!1493446 (= e!836631 e!836632)))

(declare-fun res!1015932 () Bool)

(assert (=> b!1493446 (=> (not res!1015932) (not e!836632))))

(assert (=> b!1493446 (= res!1015932 (= (select (store (arr!48137 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493446 (= lt!651027 (array!99738 (store (arr!48137 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48687 a!2862)))))

(declare-fun b!1493447 () Bool)

(declare-fun res!1015935 () Bool)

(assert (=> b!1493447 (=> (not res!1015935) (not e!836626))))

(assert (=> b!1493447 (= res!1015935 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493449 () Bool)

(declare-fun res!1015930 () Bool)

(assert (=> b!1493449 (=> (not res!1015930) (not e!836631))))

(assert (=> b!1493449 (= res!1015930 (and (= (size!48687 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48687 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48687 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!651025 () SeekEntryResult!12377)

(declare-fun b!1493450 () Bool)

(assert (=> b!1493450 (= e!836627 (= lt!651025 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651029 lt!651027 mask!2687)))))

(declare-fun b!1493451 () Bool)

(assert (=> b!1493451 (= e!836628 (or (= (select (arr!48137 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48137 a!2862) intermediateBeforeIndex!19) (select (arr!48137 a!2862) j!93))))))

(declare-fun b!1493452 () Bool)

(assert (=> b!1493452 (= e!836630 e!836626)))

(declare-fun res!1015936 () Bool)

(assert (=> b!1493452 (=> (not res!1015936) (not e!836626))))

(assert (=> b!1493452 (= res!1015936 (= lt!651025 (Intermediate!12377 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493452 (= lt!651025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651029 mask!2687) lt!651029 lt!651027 mask!2687))))

(assert (=> b!1493452 (= lt!651029 (select (store (arr!48137 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493453 () Bool)

(assert (=> b!1493453 (= e!836632 e!836630)))

(declare-fun res!1015933 () Bool)

(assert (=> b!1493453 (=> (not res!1015933) (not e!836630))))

(assert (=> b!1493453 (= res!1015933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48137 a!2862) j!93) mask!2687) (select (arr!48137 a!2862) j!93) a!2862 mask!2687) lt!651030))))

(assert (=> b!1493453 (= lt!651030 (Intermediate!12377 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493454 () Bool)

(declare-fun res!1015939 () Bool)

(assert (=> b!1493454 (=> (not res!1015939) (not e!836631))))

(declare-datatypes ((List!34638 0))(
  ( (Nil!34635) (Cons!34634 (h!36023 (_ BitVec 64)) (t!49332 List!34638)) )
))
(declare-fun arrayNoDuplicates!0 (array!99737 (_ BitVec 32) List!34638) Bool)

(assert (=> b!1493454 (= res!1015939 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34635))))

(declare-fun b!1493455 () Bool)

(assert (=> b!1493455 (= e!836633 true)))

(declare-fun lt!651028 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493455 (= lt!651028 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493456 () Bool)

(declare-fun res!1015925 () Bool)

(assert (=> b!1493456 (=> (not res!1015925) (not e!836626))))

(assert (=> b!1493456 (= res!1015925 e!836627)))

(declare-fun c!138288 () Bool)

(assert (=> b!1493456 (= c!138288 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493457 () Bool)

(declare-fun res!1015929 () Bool)

(assert (=> b!1493457 (=> (not res!1015929) (not e!836628))))

(assert (=> b!1493457 (= res!1015929 (= (seekEntryOrOpen!0 (select (arr!48137 a!2862) j!93) a!2862 mask!2687) (Found!12377 j!93)))))

(declare-fun res!1015926 () Bool)

(assert (=> start!127090 (=> (not res!1015926) (not e!836631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127090 (= res!1015926 (validMask!0 mask!2687))))

(assert (=> start!127090 e!836631))

(assert (=> start!127090 true))

(declare-fun array_inv!37165 (array!99737) Bool)

(assert (=> start!127090 (array_inv!37165 a!2862)))

(declare-fun b!1493448 () Bool)

(declare-fun res!1015931 () Bool)

(assert (=> b!1493448 (=> (not res!1015931) (not e!836631))))

(assert (=> b!1493448 (= res!1015931 (validKeyInArray!0 (select (arr!48137 a!2862) j!93)))))

(assert (= (and start!127090 res!1015926) b!1493449))

(assert (= (and b!1493449 res!1015930) b!1493440))

(assert (= (and b!1493440 res!1015928) b!1493448))

(assert (= (and b!1493448 res!1015931) b!1493441))

(assert (= (and b!1493441 res!1015937) b!1493454))

(assert (= (and b!1493454 res!1015939) b!1493442))

(assert (= (and b!1493442 res!1015927) b!1493446))

(assert (= (and b!1493446 res!1015932) b!1493453))

(assert (= (and b!1493453 res!1015933) b!1493445))

(assert (= (and b!1493445 res!1015938) b!1493452))

(assert (= (and b!1493452 res!1015936) b!1493456))

(assert (= (and b!1493456 c!138288) b!1493450))

(assert (= (and b!1493456 (not c!138288)) b!1493444))

(assert (= (and b!1493456 res!1015925) b!1493447))

(assert (= (and b!1493447 res!1015935) b!1493443))

(assert (= (and b!1493443 res!1015934) b!1493457))

(assert (= (and b!1493457 res!1015929) b!1493451))

(assert (= (and b!1493443 (not res!1015924)) b!1493455))

(declare-fun m!1377223 () Bool)

(assert (=> b!1493453 m!1377223))

(assert (=> b!1493453 m!1377223))

(declare-fun m!1377225 () Bool)

(assert (=> b!1493453 m!1377225))

(assert (=> b!1493453 m!1377225))

(assert (=> b!1493453 m!1377223))

(declare-fun m!1377227 () Bool)

(assert (=> b!1493453 m!1377227))

(declare-fun m!1377229 () Bool)

(assert (=> b!1493451 m!1377229))

(assert (=> b!1493451 m!1377223))

(declare-fun m!1377231 () Bool)

(assert (=> start!127090 m!1377231))

(declare-fun m!1377233 () Bool)

(assert (=> start!127090 m!1377233))

(declare-fun m!1377235 () Bool)

(assert (=> b!1493443 m!1377235))

(declare-fun m!1377237 () Bool)

(assert (=> b!1493443 m!1377237))

(declare-fun m!1377239 () Bool)

(assert (=> b!1493443 m!1377239))

(declare-fun m!1377241 () Bool)

(assert (=> b!1493443 m!1377241))

(declare-fun m!1377243 () Bool)

(assert (=> b!1493443 m!1377243))

(assert (=> b!1493443 m!1377223))

(declare-fun m!1377245 () Bool)

(assert (=> b!1493455 m!1377245))

(declare-fun m!1377247 () Bool)

(assert (=> b!1493440 m!1377247))

(assert (=> b!1493440 m!1377247))

(declare-fun m!1377249 () Bool)

(assert (=> b!1493440 m!1377249))

(declare-fun m!1377251 () Bool)

(assert (=> b!1493441 m!1377251))

(declare-fun m!1377253 () Bool)

(assert (=> b!1493454 m!1377253))

(assert (=> b!1493446 m!1377237))

(declare-fun m!1377255 () Bool)

(assert (=> b!1493446 m!1377255))

(declare-fun m!1377257 () Bool)

(assert (=> b!1493452 m!1377257))

(assert (=> b!1493452 m!1377257))

(declare-fun m!1377259 () Bool)

(assert (=> b!1493452 m!1377259))

(assert (=> b!1493452 m!1377237))

(declare-fun m!1377261 () Bool)

(assert (=> b!1493452 m!1377261))

(assert (=> b!1493448 m!1377223))

(assert (=> b!1493448 m!1377223))

(declare-fun m!1377263 () Bool)

(assert (=> b!1493448 m!1377263))

(declare-fun m!1377265 () Bool)

(assert (=> b!1493444 m!1377265))

(declare-fun m!1377267 () Bool)

(assert (=> b!1493444 m!1377267))

(assert (=> b!1493457 m!1377223))

(assert (=> b!1493457 m!1377223))

(declare-fun m!1377269 () Bool)

(assert (=> b!1493457 m!1377269))

(assert (=> b!1493445 m!1377223))

(assert (=> b!1493445 m!1377223))

(declare-fun m!1377271 () Bool)

(assert (=> b!1493445 m!1377271))

(declare-fun m!1377273 () Bool)

(assert (=> b!1493450 m!1377273))

(push 1)

