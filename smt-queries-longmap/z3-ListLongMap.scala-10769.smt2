; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126270 () Bool)

(assert start!126270)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!828733 () Bool)

(declare-datatypes ((SeekEntryResult!12078 0))(
  ( (MissingZero!12078 (index!50704 (_ BitVec 32))) (Found!12078 (index!50705 (_ BitVec 32))) (Intermediate!12078 (undefined!12890 Bool) (index!50706 (_ BitVec 32)) (x!132476 (_ BitVec 32))) (Undefined!12078) (MissingVacant!12078 (index!50707 (_ BitVec 32))) )
))
(declare-fun lt!645180 () SeekEntryResult!12078)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99328 0))(
  ( (array!99329 (arr!47941 (Array (_ BitVec 32) (_ BitVec 64))) (size!48492 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99328)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1476921 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99328 (_ BitVec 32)) SeekEntryResult!12078)

(assert (=> b!1476921 (= e!828733 (= lt!645180 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476922 () Bool)

(declare-fun e!828728 () Bool)

(declare-fun e!828731 () Bool)

(assert (=> b!1476922 (= e!828728 e!828731)))

(declare-fun res!1002694 () Bool)

(assert (=> b!1476922 (=> (not res!1002694) (not e!828731))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476922 (= res!1002694 (= (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645181 () array!99328)

(assert (=> b!1476922 (= lt!645181 (array!99329 (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48492 a!2862)))))

(declare-fun b!1476923 () Bool)

(declare-fun e!828729 () Bool)

(assert (=> b!1476923 (= e!828731 e!828729)))

(declare-fun res!1002703 () Bool)

(assert (=> b!1476923 (=> (not res!1002703) (not e!828729))))

(declare-fun lt!645179 () SeekEntryResult!12078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99328 (_ BitVec 32)) SeekEntryResult!12078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476923 (= res!1002703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645179))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476923 (= lt!645179 (Intermediate!12078 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!828735 () Bool)

(declare-fun lt!645177 () SeekEntryResult!12078)

(declare-fun lt!645176 () (_ BitVec 64))

(declare-fun b!1476924 () Bool)

(assert (=> b!1476924 (= e!828735 (= lt!645177 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645176 lt!645181 mask!2687)))))

(declare-fun b!1476925 () Bool)

(declare-fun e!828730 () Bool)

(assert (=> b!1476925 (= e!828730 e!828733)))

(declare-fun res!1002690 () Bool)

(assert (=> b!1476925 (=> res!1002690 e!828733)))

(assert (=> b!1476925 (= res!1002690 (or (and (= (select (arr!47941 a!2862) index!646) (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47941 a!2862) index!646) (select (arr!47941 a!2862) j!93))) (not (= (select (arr!47941 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476926 () Bool)

(declare-fun res!1002692 () Bool)

(assert (=> b!1476926 (=> (not res!1002692) (not e!828728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476926 (= res!1002692 (validKeyInArray!0 (select (arr!47941 a!2862) i!1006)))))

(declare-fun b!1476927 () Bool)

(declare-fun res!1002700 () Bool)

(assert (=> b!1476927 (=> (not res!1002700) (not e!828728))))

(assert (=> b!1476927 (= res!1002700 (validKeyInArray!0 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1476929 () Bool)

(declare-fun res!1002702 () Bool)

(assert (=> b!1476929 (=> (not res!1002702) (not e!828728))))

(assert (=> b!1476929 (= res!1002702 (and (= (size!48492 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48492 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48492 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476930 () Bool)

(declare-fun res!1002693 () Bool)

(assert (=> b!1476930 (=> (not res!1002693) (not e!828729))))

(assert (=> b!1476930 (= res!1002693 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645179))))

(declare-fun b!1476931 () Bool)

(declare-fun res!1002696 () Bool)

(assert (=> b!1476931 (=> (not res!1002696) (not e!828728))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476931 (= res!1002696 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48492 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48492 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48492 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476932 () Bool)

(declare-fun res!1002691 () Bool)

(declare-fun e!828732 () Bool)

(assert (=> b!1476932 (=> (not res!1002691) (not e!828732))))

(assert (=> b!1476932 (= res!1002691 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476933 () Bool)

(declare-fun res!1002697 () Bool)

(assert (=> b!1476933 (=> (not res!1002697) (not e!828728))))

(declare-datatypes ((List!34429 0))(
  ( (Nil!34426) (Cons!34425 (h!35801 (_ BitVec 64)) (t!49115 List!34429)) )
))
(declare-fun arrayNoDuplicates!0 (array!99328 (_ BitVec 32) List!34429) Bool)

(assert (=> b!1476933 (= res!1002697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34426))))

(declare-fun b!1476934 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99328 (_ BitVec 32)) SeekEntryResult!12078)

(assert (=> b!1476934 (= e!828735 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645176 lt!645181 mask!2687) (seekEntryOrOpen!0 lt!645176 lt!645181 mask!2687)))))

(declare-fun b!1476935 () Bool)

(assert (=> b!1476935 (= e!828729 e!828732)))

(declare-fun res!1002698 () Bool)

(assert (=> b!1476935 (=> (not res!1002698) (not e!828732))))

(assert (=> b!1476935 (= res!1002698 (= lt!645177 (Intermediate!12078 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1476935 (= lt!645177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645176 mask!2687) lt!645176 lt!645181 mask!2687))))

(assert (=> b!1476935 (= lt!645176 (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476936 () Bool)

(declare-fun res!1002695 () Bool)

(assert (=> b!1476936 (=> (not res!1002695) (not e!828728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99328 (_ BitVec 32)) Bool)

(assert (=> b!1476936 (= res!1002695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476937 () Bool)

(assert (=> b!1476937 (= e!828732 (not (or (and (= (select (arr!47941 a!2862) index!646) (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47941 a!2862) index!646) (select (arr!47941 a!2862) j!93))) (not (= (select (arr!47941 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!646 intermediateBeforeIndex!19))))))

(assert (=> b!1476937 e!828730))

(declare-fun res!1002704 () Bool)

(assert (=> b!1476937 (=> (not res!1002704) (not e!828730))))

(assert (=> b!1476937 (= res!1002704 (and (= lt!645180 (Found!12078 j!93)) (or (= (select (arr!47941 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47941 a!2862) intermediateBeforeIndex!19) (select (arr!47941 a!2862) j!93)))))))

(assert (=> b!1476937 (= lt!645180 (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476937 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49529 0))(
  ( (Unit!49530) )
))
(declare-fun lt!645178 () Unit!49529)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49529)

(assert (=> b!1476937 (= lt!645178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476928 () Bool)

(declare-fun res!1002699 () Bool)

(assert (=> b!1476928 (=> (not res!1002699) (not e!828732))))

(assert (=> b!1476928 (= res!1002699 e!828735)))

(declare-fun c!136642 () Bool)

(assert (=> b!1476928 (= c!136642 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1002701 () Bool)

(assert (=> start!126270 (=> (not res!1002701) (not e!828728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126270 (= res!1002701 (validMask!0 mask!2687))))

(assert (=> start!126270 e!828728))

(assert (=> start!126270 true))

(declare-fun array_inv!37222 (array!99328) Bool)

(assert (=> start!126270 (array_inv!37222 a!2862)))

(assert (= (and start!126270 res!1002701) b!1476929))

(assert (= (and b!1476929 res!1002702) b!1476926))

(assert (= (and b!1476926 res!1002692) b!1476927))

(assert (= (and b!1476927 res!1002700) b!1476936))

(assert (= (and b!1476936 res!1002695) b!1476933))

(assert (= (and b!1476933 res!1002697) b!1476931))

(assert (= (and b!1476931 res!1002696) b!1476922))

(assert (= (and b!1476922 res!1002694) b!1476923))

(assert (= (and b!1476923 res!1002703) b!1476930))

(assert (= (and b!1476930 res!1002693) b!1476935))

(assert (= (and b!1476935 res!1002698) b!1476928))

(assert (= (and b!1476928 c!136642) b!1476924))

(assert (= (and b!1476928 (not c!136642)) b!1476934))

(assert (= (and b!1476928 res!1002699) b!1476932))

(assert (= (and b!1476932 res!1002691) b!1476937))

(assert (= (and b!1476937 res!1002704) b!1476925))

(assert (= (and b!1476925 (not res!1002690)) b!1476921))

(declare-fun m!1363189 () Bool)

(assert (=> b!1476925 m!1363189))

(declare-fun m!1363191 () Bool)

(assert (=> b!1476925 m!1363191))

(declare-fun m!1363193 () Bool)

(assert (=> b!1476925 m!1363193))

(declare-fun m!1363195 () Bool)

(assert (=> b!1476925 m!1363195))

(assert (=> b!1476923 m!1363195))

(assert (=> b!1476923 m!1363195))

(declare-fun m!1363197 () Bool)

(assert (=> b!1476923 m!1363197))

(assert (=> b!1476923 m!1363197))

(assert (=> b!1476923 m!1363195))

(declare-fun m!1363199 () Bool)

(assert (=> b!1476923 m!1363199))

(assert (=> b!1476921 m!1363195))

(assert (=> b!1476921 m!1363195))

(declare-fun m!1363201 () Bool)

(assert (=> b!1476921 m!1363201))

(assert (=> b!1476927 m!1363195))

(assert (=> b!1476927 m!1363195))

(declare-fun m!1363203 () Bool)

(assert (=> b!1476927 m!1363203))

(assert (=> b!1476930 m!1363195))

(assert (=> b!1476930 m!1363195))

(declare-fun m!1363205 () Bool)

(assert (=> b!1476930 m!1363205))

(declare-fun m!1363207 () Bool)

(assert (=> start!126270 m!1363207))

(declare-fun m!1363209 () Bool)

(assert (=> start!126270 m!1363209))

(declare-fun m!1363211 () Bool)

(assert (=> b!1476934 m!1363211))

(declare-fun m!1363213 () Bool)

(assert (=> b!1476934 m!1363213))

(declare-fun m!1363215 () Bool)

(assert (=> b!1476937 m!1363215))

(assert (=> b!1476937 m!1363191))

(declare-fun m!1363217 () Bool)

(assert (=> b!1476937 m!1363217))

(assert (=> b!1476937 m!1363193))

(assert (=> b!1476937 m!1363189))

(assert (=> b!1476937 m!1363195))

(declare-fun m!1363219 () Bool)

(assert (=> b!1476937 m!1363219))

(declare-fun m!1363221 () Bool)

(assert (=> b!1476937 m!1363221))

(assert (=> b!1476937 m!1363195))

(declare-fun m!1363223 () Bool)

(assert (=> b!1476933 m!1363223))

(declare-fun m!1363225 () Bool)

(assert (=> b!1476924 m!1363225))

(declare-fun m!1363227 () Bool)

(assert (=> b!1476926 m!1363227))

(assert (=> b!1476926 m!1363227))

(declare-fun m!1363229 () Bool)

(assert (=> b!1476926 m!1363229))

(assert (=> b!1476922 m!1363191))

(declare-fun m!1363231 () Bool)

(assert (=> b!1476922 m!1363231))

(declare-fun m!1363233 () Bool)

(assert (=> b!1476936 m!1363233))

(declare-fun m!1363235 () Bool)

(assert (=> b!1476935 m!1363235))

(assert (=> b!1476935 m!1363235))

(declare-fun m!1363237 () Bool)

(assert (=> b!1476935 m!1363237))

(assert (=> b!1476935 m!1363191))

(declare-fun m!1363239 () Bool)

(assert (=> b!1476935 m!1363239))

(check-sat (not b!1476936) (not b!1476926) (not b!1476937) (not b!1476924) (not b!1476930) (not b!1476927) (not b!1476921) (not start!126270) (not b!1476923) (not b!1476934) (not b!1476935) (not b!1476933))
(check-sat)
(get-model)

(declare-fun b!1477058 () Bool)

(declare-fun e!828797 () SeekEntryResult!12078)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477058 (= e!828797 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!645176 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!645176 lt!645181 mask!2687))))

(declare-fun b!1477060 () Bool)

(assert (=> b!1477060 (= e!828797 (Intermediate!12078 false (toIndex!0 lt!645176 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477061 () Bool)

(declare-fun e!828796 () SeekEntryResult!12078)

(assert (=> b!1477061 (= e!828796 e!828797)))

(declare-fun c!136657 () Bool)

(declare-fun lt!645222 () (_ BitVec 64))

(assert (=> b!1477061 (= c!136657 (or (= lt!645222 lt!645176) (= (bvadd lt!645222 lt!645222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477062 () Bool)

(assert (=> b!1477062 (= e!828796 (Intermediate!12078 true (toIndex!0 lt!645176 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477063 () Bool)

(declare-fun e!828794 () Bool)

(declare-fun e!828798 () Bool)

(assert (=> b!1477063 (= e!828794 e!828798)))

(declare-fun res!1002803 () Bool)

(declare-fun lt!645223 () SeekEntryResult!12078)

(get-info :version)

(assert (=> b!1477063 (= res!1002803 (and ((_ is Intermediate!12078) lt!645223) (not (undefined!12890 lt!645223)) (bvslt (x!132476 lt!645223) #b01111111111111111111111111111110) (bvsge (x!132476 lt!645223) #b00000000000000000000000000000000) (bvsge (x!132476 lt!645223) #b00000000000000000000000000000000)))))

(assert (=> b!1477063 (=> (not res!1002803) (not e!828798))))

(declare-fun b!1477064 () Bool)

(assert (=> b!1477064 (and (bvsge (index!50706 lt!645223) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645223) (size!48492 lt!645181)))))

(declare-fun res!1002802 () Bool)

(assert (=> b!1477064 (= res!1002802 (= (select (arr!47941 lt!645181) (index!50706 lt!645223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828795 () Bool)

(assert (=> b!1477064 (=> res!1002802 e!828795)))

(declare-fun b!1477059 () Bool)

(assert (=> b!1477059 (and (bvsge (index!50706 lt!645223) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645223) (size!48492 lt!645181)))))

(declare-fun res!1002801 () Bool)

(assert (=> b!1477059 (= res!1002801 (= (select (arr!47941 lt!645181) (index!50706 lt!645223)) lt!645176))))

(assert (=> b!1477059 (=> res!1002801 e!828795)))

(assert (=> b!1477059 (= e!828798 e!828795)))

(declare-fun d!156257 () Bool)

(assert (=> d!156257 e!828794))

(declare-fun c!136656 () Bool)

(assert (=> d!156257 (= c!136656 (and ((_ is Intermediate!12078) lt!645223) (undefined!12890 lt!645223)))))

(assert (=> d!156257 (= lt!645223 e!828796)))

(declare-fun c!136655 () Bool)

(assert (=> d!156257 (= c!136655 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156257 (= lt!645222 (select (arr!47941 lt!645181) (toIndex!0 lt!645176 mask!2687)))))

(assert (=> d!156257 (validMask!0 mask!2687)))

(assert (=> d!156257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645176 mask!2687) lt!645176 lt!645181 mask!2687) lt!645223)))

(declare-fun b!1477065 () Bool)

(assert (=> b!1477065 (and (bvsge (index!50706 lt!645223) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645223) (size!48492 lt!645181)))))

(assert (=> b!1477065 (= e!828795 (= (select (arr!47941 lt!645181) (index!50706 lt!645223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1477066 () Bool)

(assert (=> b!1477066 (= e!828794 (bvsge (x!132476 lt!645223) #b01111111111111111111111111111110))))

(assert (= (and d!156257 c!136655) b!1477062))

(assert (= (and d!156257 (not c!136655)) b!1477061))

(assert (= (and b!1477061 c!136657) b!1477060))

(assert (= (and b!1477061 (not c!136657)) b!1477058))

(assert (= (and d!156257 c!136656) b!1477066))

(assert (= (and d!156257 (not c!136656)) b!1477063))

(assert (= (and b!1477063 res!1002803) b!1477059))

(assert (= (and b!1477059 (not res!1002801)) b!1477064))

(assert (= (and b!1477064 (not res!1002802)) b!1477065))

(assert (=> d!156257 m!1363235))

(declare-fun m!1363345 () Bool)

(assert (=> d!156257 m!1363345))

(assert (=> d!156257 m!1363207))

(declare-fun m!1363347 () Bool)

(assert (=> b!1477065 m!1363347))

(assert (=> b!1477058 m!1363235))

(declare-fun m!1363349 () Bool)

(assert (=> b!1477058 m!1363349))

(assert (=> b!1477058 m!1363349))

(declare-fun m!1363351 () Bool)

(assert (=> b!1477058 m!1363351))

(assert (=> b!1477059 m!1363347))

(assert (=> b!1477064 m!1363347))

(assert (=> b!1476935 d!156257))

(declare-fun d!156259 () Bool)

(declare-fun lt!645229 () (_ BitVec 32))

(declare-fun lt!645228 () (_ BitVec 32))

(assert (=> d!156259 (= lt!645229 (bvmul (bvxor lt!645228 (bvlshr lt!645228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156259 (= lt!645228 ((_ extract 31 0) (bvand (bvxor lt!645176 (bvlshr lt!645176 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156259 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002804 (let ((h!35804 ((_ extract 31 0) (bvand (bvxor lt!645176 (bvlshr lt!645176 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132480 (bvmul (bvxor h!35804 (bvlshr h!35804 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132480 (bvlshr x!132480 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002804 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002804 #b00000000000000000000000000000000))))))

(assert (=> d!156259 (= (toIndex!0 lt!645176 mask!2687) (bvand (bvxor lt!645229 (bvlshr lt!645229 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1476935 d!156259))

(declare-fun d!156261 () Bool)

(assert (=> d!156261 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126270 d!156261))

(declare-fun d!156263 () Bool)

(assert (=> d!156263 (= (array_inv!37222 a!2862) (bvsge (size!48492 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126270 d!156263))

(declare-fun e!828802 () SeekEntryResult!12078)

(declare-fun b!1477067 () Bool)

(assert (=> b!1477067 (= e!828802 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!645176 lt!645181 mask!2687))))

(declare-fun b!1477069 () Bool)

(assert (=> b!1477069 (= e!828802 (Intermediate!12078 false index!646 x!665))))

(declare-fun b!1477070 () Bool)

(declare-fun e!828801 () SeekEntryResult!12078)

(assert (=> b!1477070 (= e!828801 e!828802)))

(declare-fun c!136660 () Bool)

(declare-fun lt!645230 () (_ BitVec 64))

(assert (=> b!1477070 (= c!136660 (or (= lt!645230 lt!645176) (= (bvadd lt!645230 lt!645230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477071 () Bool)

(assert (=> b!1477071 (= e!828801 (Intermediate!12078 true index!646 x!665))))

(declare-fun b!1477072 () Bool)

(declare-fun e!828799 () Bool)

(declare-fun e!828803 () Bool)

(assert (=> b!1477072 (= e!828799 e!828803)))

(declare-fun res!1002807 () Bool)

(declare-fun lt!645231 () SeekEntryResult!12078)

(assert (=> b!1477072 (= res!1002807 (and ((_ is Intermediate!12078) lt!645231) (not (undefined!12890 lt!645231)) (bvslt (x!132476 lt!645231) #b01111111111111111111111111111110) (bvsge (x!132476 lt!645231) #b00000000000000000000000000000000) (bvsge (x!132476 lt!645231) x!665)))))

(assert (=> b!1477072 (=> (not res!1002807) (not e!828803))))

(declare-fun b!1477073 () Bool)

(assert (=> b!1477073 (and (bvsge (index!50706 lt!645231) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645231) (size!48492 lt!645181)))))

(declare-fun res!1002806 () Bool)

(assert (=> b!1477073 (= res!1002806 (= (select (arr!47941 lt!645181) (index!50706 lt!645231)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828800 () Bool)

(assert (=> b!1477073 (=> res!1002806 e!828800)))

(declare-fun b!1477068 () Bool)

(assert (=> b!1477068 (and (bvsge (index!50706 lt!645231) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645231) (size!48492 lt!645181)))))

(declare-fun res!1002805 () Bool)

(assert (=> b!1477068 (= res!1002805 (= (select (arr!47941 lt!645181) (index!50706 lt!645231)) lt!645176))))

(assert (=> b!1477068 (=> res!1002805 e!828800)))

(assert (=> b!1477068 (= e!828803 e!828800)))

(declare-fun d!156265 () Bool)

(assert (=> d!156265 e!828799))

(declare-fun c!136659 () Bool)

(assert (=> d!156265 (= c!136659 (and ((_ is Intermediate!12078) lt!645231) (undefined!12890 lt!645231)))))

(assert (=> d!156265 (= lt!645231 e!828801)))

(declare-fun c!136658 () Bool)

(assert (=> d!156265 (= c!136658 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156265 (= lt!645230 (select (arr!47941 lt!645181) index!646))))

(assert (=> d!156265 (validMask!0 mask!2687)))

(assert (=> d!156265 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645176 lt!645181 mask!2687) lt!645231)))

(declare-fun b!1477074 () Bool)

(assert (=> b!1477074 (and (bvsge (index!50706 lt!645231) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645231) (size!48492 lt!645181)))))

(assert (=> b!1477074 (= e!828800 (= (select (arr!47941 lt!645181) (index!50706 lt!645231)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1477075 () Bool)

(assert (=> b!1477075 (= e!828799 (bvsge (x!132476 lt!645231) #b01111111111111111111111111111110))))

(assert (= (and d!156265 c!136658) b!1477071))

(assert (= (and d!156265 (not c!136658)) b!1477070))

(assert (= (and b!1477070 c!136660) b!1477069))

(assert (= (and b!1477070 (not c!136660)) b!1477067))

(assert (= (and d!156265 c!136659) b!1477075))

(assert (= (and d!156265 (not c!136659)) b!1477072))

(assert (= (and b!1477072 res!1002807) b!1477068))

(assert (= (and b!1477068 (not res!1002805)) b!1477073))

(assert (= (and b!1477073 (not res!1002806)) b!1477074))

(declare-fun m!1363353 () Bool)

(assert (=> d!156265 m!1363353))

(assert (=> d!156265 m!1363207))

(declare-fun m!1363355 () Bool)

(assert (=> b!1477074 m!1363355))

(declare-fun m!1363357 () Bool)

(assert (=> b!1477067 m!1363357))

(assert (=> b!1477067 m!1363357))

(declare-fun m!1363359 () Bool)

(assert (=> b!1477067 m!1363359))

(assert (=> b!1477068 m!1363355))

(assert (=> b!1477073 m!1363355))

(assert (=> b!1476924 d!156265))

(declare-fun b!1477076 () Bool)

(declare-fun e!828807 () SeekEntryResult!12078)

(assert (=> b!1477076 (= e!828807 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1477078 () Bool)

(assert (=> b!1477078 (= e!828807 (Intermediate!12078 false (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477079 () Bool)

(declare-fun e!828806 () SeekEntryResult!12078)

(assert (=> b!1477079 (= e!828806 e!828807)))

(declare-fun lt!645232 () (_ BitVec 64))

(declare-fun c!136663 () Bool)

(assert (=> b!1477079 (= c!136663 (or (= lt!645232 (select (arr!47941 a!2862) j!93)) (= (bvadd lt!645232 lt!645232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477080 () Bool)

(assert (=> b!1477080 (= e!828806 (Intermediate!12078 true (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1477081 () Bool)

(declare-fun e!828804 () Bool)

(declare-fun e!828808 () Bool)

(assert (=> b!1477081 (= e!828804 e!828808)))

(declare-fun res!1002810 () Bool)

(declare-fun lt!645233 () SeekEntryResult!12078)

(assert (=> b!1477081 (= res!1002810 (and ((_ is Intermediate!12078) lt!645233) (not (undefined!12890 lt!645233)) (bvslt (x!132476 lt!645233) #b01111111111111111111111111111110) (bvsge (x!132476 lt!645233) #b00000000000000000000000000000000) (bvsge (x!132476 lt!645233) #b00000000000000000000000000000000)))))

(assert (=> b!1477081 (=> (not res!1002810) (not e!828808))))

(declare-fun b!1477082 () Bool)

(assert (=> b!1477082 (and (bvsge (index!50706 lt!645233) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645233) (size!48492 a!2862)))))

(declare-fun res!1002809 () Bool)

(assert (=> b!1477082 (= res!1002809 (= (select (arr!47941 a!2862) (index!50706 lt!645233)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828805 () Bool)

(assert (=> b!1477082 (=> res!1002809 e!828805)))

(declare-fun b!1477077 () Bool)

(assert (=> b!1477077 (and (bvsge (index!50706 lt!645233) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645233) (size!48492 a!2862)))))

(declare-fun res!1002808 () Bool)

(assert (=> b!1477077 (= res!1002808 (= (select (arr!47941 a!2862) (index!50706 lt!645233)) (select (arr!47941 a!2862) j!93)))))

(assert (=> b!1477077 (=> res!1002808 e!828805)))

(assert (=> b!1477077 (= e!828808 e!828805)))

(declare-fun d!156267 () Bool)

(assert (=> d!156267 e!828804))

(declare-fun c!136662 () Bool)

(assert (=> d!156267 (= c!136662 (and ((_ is Intermediate!12078) lt!645233) (undefined!12890 lt!645233)))))

(assert (=> d!156267 (= lt!645233 e!828806)))

(declare-fun c!136661 () Bool)

(assert (=> d!156267 (= c!136661 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156267 (= lt!645232 (select (arr!47941 a!2862) (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687)))))

(assert (=> d!156267 (validMask!0 mask!2687)))

(assert (=> d!156267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645233)))

(declare-fun b!1477083 () Bool)

(assert (=> b!1477083 (and (bvsge (index!50706 lt!645233) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645233) (size!48492 a!2862)))))

(assert (=> b!1477083 (= e!828805 (= (select (arr!47941 a!2862) (index!50706 lt!645233)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1477084 () Bool)

(assert (=> b!1477084 (= e!828804 (bvsge (x!132476 lt!645233) #b01111111111111111111111111111110))))

(assert (= (and d!156267 c!136661) b!1477080))

(assert (= (and d!156267 (not c!136661)) b!1477079))

(assert (= (and b!1477079 c!136663) b!1477078))

(assert (= (and b!1477079 (not c!136663)) b!1477076))

(assert (= (and d!156267 c!136662) b!1477084))

(assert (= (and d!156267 (not c!136662)) b!1477081))

(assert (= (and b!1477081 res!1002810) b!1477077))

(assert (= (and b!1477077 (not res!1002808)) b!1477082))

(assert (= (and b!1477082 (not res!1002809)) b!1477083))

(assert (=> d!156267 m!1363197))

(declare-fun m!1363361 () Bool)

(assert (=> d!156267 m!1363361))

(assert (=> d!156267 m!1363207))

(declare-fun m!1363363 () Bool)

(assert (=> b!1477083 m!1363363))

(assert (=> b!1477076 m!1363197))

(declare-fun m!1363365 () Bool)

(assert (=> b!1477076 m!1363365))

(assert (=> b!1477076 m!1363365))

(assert (=> b!1477076 m!1363195))

(declare-fun m!1363367 () Bool)

(assert (=> b!1477076 m!1363367))

(assert (=> b!1477077 m!1363363))

(assert (=> b!1477082 m!1363363))

(assert (=> b!1476923 d!156267))

(declare-fun d!156269 () Bool)

(declare-fun lt!645235 () (_ BitVec 32))

(declare-fun lt!645234 () (_ BitVec 32))

(assert (=> d!156269 (= lt!645235 (bvmul (bvxor lt!645234 (bvlshr lt!645234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156269 (= lt!645234 ((_ extract 31 0) (bvand (bvxor (select (arr!47941 a!2862) j!93) (bvlshr (select (arr!47941 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156269 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002804 (let ((h!35804 ((_ extract 31 0) (bvand (bvxor (select (arr!47941 a!2862) j!93) (bvlshr (select (arr!47941 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132480 (bvmul (bvxor h!35804 (bvlshr h!35804 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132480 (bvlshr x!132480 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002804 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002804 #b00000000000000000000000000000000))))))

(assert (=> d!156269 (= (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (bvand (bvxor lt!645235 (bvlshr lt!645235 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1476923 d!156269))

(declare-fun b!1477097 () Bool)

(declare-fun e!828815 () SeekEntryResult!12078)

(assert (=> b!1477097 (= e!828815 Undefined!12078)))

(declare-fun b!1477098 () Bool)

(declare-fun e!828816 () SeekEntryResult!12078)

(assert (=> b!1477098 (= e!828816 (Found!12078 index!646))))

(declare-fun b!1477099 () Bool)

(declare-fun e!828817 () SeekEntryResult!12078)

(assert (=> b!1477099 (= e!828817 (MissingVacant!12078 intermediateAfterIndex!19))))

(declare-fun lt!645241 () SeekEntryResult!12078)

(declare-fun d!156271 () Bool)

(assert (=> d!156271 (and (or ((_ is Undefined!12078) lt!645241) (not ((_ is Found!12078) lt!645241)) (and (bvsge (index!50705 lt!645241) #b00000000000000000000000000000000) (bvslt (index!50705 lt!645241) (size!48492 lt!645181)))) (or ((_ is Undefined!12078) lt!645241) ((_ is Found!12078) lt!645241) (not ((_ is MissingVacant!12078) lt!645241)) (not (= (index!50707 lt!645241) intermediateAfterIndex!19)) (and (bvsge (index!50707 lt!645241) #b00000000000000000000000000000000) (bvslt (index!50707 lt!645241) (size!48492 lt!645181)))) (or ((_ is Undefined!12078) lt!645241) (ite ((_ is Found!12078) lt!645241) (= (select (arr!47941 lt!645181) (index!50705 lt!645241)) lt!645176) (and ((_ is MissingVacant!12078) lt!645241) (= (index!50707 lt!645241) intermediateAfterIndex!19) (= (select (arr!47941 lt!645181) (index!50707 lt!645241)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156271 (= lt!645241 e!828815)))

(declare-fun c!136672 () Bool)

(assert (=> d!156271 (= c!136672 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!645240 () (_ BitVec 64))

(assert (=> d!156271 (= lt!645240 (select (arr!47941 lt!645181) index!646))))

(assert (=> d!156271 (validMask!0 mask!2687)))

(assert (=> d!156271 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645176 lt!645181 mask!2687) lt!645241)))

(declare-fun b!1477100 () Bool)

(assert (=> b!1477100 (= e!828817 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!645176 lt!645181 mask!2687))))

(declare-fun b!1477101 () Bool)

(declare-fun c!136670 () Bool)

(assert (=> b!1477101 (= c!136670 (= lt!645240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477101 (= e!828816 e!828817)))

(declare-fun b!1477102 () Bool)

(assert (=> b!1477102 (= e!828815 e!828816)))

(declare-fun c!136671 () Bool)

(assert (=> b!1477102 (= c!136671 (= lt!645240 lt!645176))))

(assert (= (and d!156271 c!136672) b!1477097))

(assert (= (and d!156271 (not c!136672)) b!1477102))

(assert (= (and b!1477102 c!136671) b!1477098))

(assert (= (and b!1477102 (not c!136671)) b!1477101))

(assert (= (and b!1477101 c!136670) b!1477099))

(assert (= (and b!1477101 (not c!136670)) b!1477100))

(declare-fun m!1363369 () Bool)

(assert (=> d!156271 m!1363369))

(declare-fun m!1363371 () Bool)

(assert (=> d!156271 m!1363371))

(assert (=> d!156271 m!1363353))

(assert (=> d!156271 m!1363207))

(assert (=> b!1477100 m!1363357))

(assert (=> b!1477100 m!1363357))

(declare-fun m!1363373 () Bool)

(assert (=> b!1477100 m!1363373))

(assert (=> b!1476934 d!156271))

(declare-fun b!1477130 () Bool)

(declare-fun c!136682 () Bool)

(declare-fun lt!645250 () (_ BitVec 64))

(assert (=> b!1477130 (= c!136682 (= lt!645250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828836 () SeekEntryResult!12078)

(declare-fun e!828838 () SeekEntryResult!12078)

(assert (=> b!1477130 (= e!828836 e!828838)))

(declare-fun b!1477131 () Bool)

(declare-fun e!828837 () SeekEntryResult!12078)

(assert (=> b!1477131 (= e!828837 e!828836)))

(declare-fun lt!645248 () SeekEntryResult!12078)

(assert (=> b!1477131 (= lt!645250 (select (arr!47941 lt!645181) (index!50706 lt!645248)))))

(declare-fun c!136684 () Bool)

(assert (=> b!1477131 (= c!136684 (= lt!645250 lt!645176))))

(declare-fun b!1477132 () Bool)

(assert (=> b!1477132 (= e!828838 (seekKeyOrZeroReturnVacant!0 (x!132476 lt!645248) (index!50706 lt!645248) (index!50706 lt!645248) lt!645176 lt!645181 mask!2687))))

(declare-fun b!1477133 () Bool)

(assert (=> b!1477133 (= e!828836 (Found!12078 (index!50706 lt!645248)))))

(declare-fun b!1477134 () Bool)

(assert (=> b!1477134 (= e!828838 (MissingZero!12078 (index!50706 lt!645248)))))

(declare-fun d!156273 () Bool)

(declare-fun lt!645249 () SeekEntryResult!12078)

(assert (=> d!156273 (and (or ((_ is Undefined!12078) lt!645249) (not ((_ is Found!12078) lt!645249)) (and (bvsge (index!50705 lt!645249) #b00000000000000000000000000000000) (bvslt (index!50705 lt!645249) (size!48492 lt!645181)))) (or ((_ is Undefined!12078) lt!645249) ((_ is Found!12078) lt!645249) (not ((_ is MissingZero!12078) lt!645249)) (and (bvsge (index!50704 lt!645249) #b00000000000000000000000000000000) (bvslt (index!50704 lt!645249) (size!48492 lt!645181)))) (or ((_ is Undefined!12078) lt!645249) ((_ is Found!12078) lt!645249) ((_ is MissingZero!12078) lt!645249) (not ((_ is MissingVacant!12078) lt!645249)) (and (bvsge (index!50707 lt!645249) #b00000000000000000000000000000000) (bvslt (index!50707 lt!645249) (size!48492 lt!645181)))) (or ((_ is Undefined!12078) lt!645249) (ite ((_ is Found!12078) lt!645249) (= (select (arr!47941 lt!645181) (index!50705 lt!645249)) lt!645176) (ite ((_ is MissingZero!12078) lt!645249) (= (select (arr!47941 lt!645181) (index!50704 lt!645249)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12078) lt!645249) (= (select (arr!47941 lt!645181) (index!50707 lt!645249)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156273 (= lt!645249 e!828837)))

(declare-fun c!136683 () Bool)

(assert (=> d!156273 (= c!136683 (and ((_ is Intermediate!12078) lt!645248) (undefined!12890 lt!645248)))))

(assert (=> d!156273 (= lt!645248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645176 mask!2687) lt!645176 lt!645181 mask!2687))))

(assert (=> d!156273 (validMask!0 mask!2687)))

(assert (=> d!156273 (= (seekEntryOrOpen!0 lt!645176 lt!645181 mask!2687) lt!645249)))

(declare-fun b!1477135 () Bool)

(assert (=> b!1477135 (= e!828837 Undefined!12078)))

(assert (= (and d!156273 c!136683) b!1477135))

(assert (= (and d!156273 (not c!136683)) b!1477131))

(assert (= (and b!1477131 c!136684) b!1477133))

(assert (= (and b!1477131 (not c!136684)) b!1477130))

(assert (= (and b!1477130 c!136682) b!1477134))

(assert (= (and b!1477130 (not c!136682)) b!1477132))

(declare-fun m!1363383 () Bool)

(assert (=> b!1477131 m!1363383))

(declare-fun m!1363385 () Bool)

(assert (=> b!1477132 m!1363385))

(assert (=> d!156273 m!1363235))

(declare-fun m!1363387 () Bool)

(assert (=> d!156273 m!1363387))

(declare-fun m!1363389 () Bool)

(assert (=> d!156273 m!1363389))

(declare-fun m!1363391 () Bool)

(assert (=> d!156273 m!1363391))

(assert (=> d!156273 m!1363207))

(assert (=> d!156273 m!1363235))

(assert (=> d!156273 m!1363237))

(assert (=> b!1476934 d!156273))

(declare-fun b!1477146 () Bool)

(declare-fun e!828847 () Bool)

(declare-fun e!828850 () Bool)

(assert (=> b!1477146 (= e!828847 e!828850)))

(declare-fun c!136687 () Bool)

(assert (=> b!1477146 (= c!136687 (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1477147 () Bool)

(declare-fun e!828849 () Bool)

(assert (=> b!1477147 (= e!828849 e!828847)))

(declare-fun res!1002828 () Bool)

(assert (=> b!1477147 (=> (not res!1002828) (not e!828847))))

(declare-fun e!828848 () Bool)

(assert (=> b!1477147 (= res!1002828 (not e!828848))))

(declare-fun res!1002827 () Bool)

(assert (=> b!1477147 (=> (not res!1002827) (not e!828848))))

(assert (=> b!1477147 (= res!1002827 (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1477148 () Bool)

(declare-fun call!67878 () Bool)

(assert (=> b!1477148 (= e!828850 call!67878)))

(declare-fun b!1477149 () Bool)

(assert (=> b!1477149 (= e!828850 call!67878)))

(declare-fun d!156279 () Bool)

(declare-fun res!1002826 () Bool)

(assert (=> d!156279 (=> res!1002826 e!828849)))

(assert (=> d!156279 (= res!1002826 (bvsge #b00000000000000000000000000000000 (size!48492 a!2862)))))

(assert (=> d!156279 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34426) e!828849)))

(declare-fun b!1477150 () Bool)

(declare-fun contains!9954 (List!34429 (_ BitVec 64)) Bool)

(assert (=> b!1477150 (= e!828848 (contains!9954 Nil!34426 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67875 () Bool)

(assert (=> bm!67875 (= call!67878 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136687 (Cons!34425 (select (arr!47941 a!2862) #b00000000000000000000000000000000) Nil!34426) Nil!34426)))))

(assert (= (and d!156279 (not res!1002826)) b!1477147))

(assert (= (and b!1477147 res!1002827) b!1477150))

(assert (= (and b!1477147 res!1002828) b!1477146))

(assert (= (and b!1477146 c!136687) b!1477148))

(assert (= (and b!1477146 (not c!136687)) b!1477149))

(assert (= (or b!1477148 b!1477149) bm!67875))

(declare-fun m!1363393 () Bool)

(assert (=> b!1477146 m!1363393))

(assert (=> b!1477146 m!1363393))

(declare-fun m!1363395 () Bool)

(assert (=> b!1477146 m!1363395))

(assert (=> b!1477147 m!1363393))

(assert (=> b!1477147 m!1363393))

(assert (=> b!1477147 m!1363395))

(assert (=> b!1477150 m!1363393))

(assert (=> b!1477150 m!1363393))

(declare-fun m!1363397 () Bool)

(assert (=> b!1477150 m!1363397))

(assert (=> bm!67875 m!1363393))

(declare-fun m!1363399 () Bool)

(assert (=> bm!67875 m!1363399))

(assert (=> b!1476933 d!156279))

(declare-fun d!156281 () Bool)

(assert (=> d!156281 (= (validKeyInArray!0 (select (arr!47941 a!2862) j!93)) (and (not (= (select (arr!47941 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47941 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1476927 d!156281))

(declare-fun b!1477151 () Bool)

(declare-fun c!136688 () Bool)

(declare-fun lt!645253 () (_ BitVec 64))

(assert (=> b!1477151 (= c!136688 (= lt!645253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828851 () SeekEntryResult!12078)

(declare-fun e!828853 () SeekEntryResult!12078)

(assert (=> b!1477151 (= e!828851 e!828853)))

(declare-fun b!1477152 () Bool)

(declare-fun e!828852 () SeekEntryResult!12078)

(assert (=> b!1477152 (= e!828852 e!828851)))

(declare-fun lt!645251 () SeekEntryResult!12078)

(assert (=> b!1477152 (= lt!645253 (select (arr!47941 a!2862) (index!50706 lt!645251)))))

(declare-fun c!136690 () Bool)

(assert (=> b!1477152 (= c!136690 (= lt!645253 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1477153 () Bool)

(assert (=> b!1477153 (= e!828853 (seekKeyOrZeroReturnVacant!0 (x!132476 lt!645251) (index!50706 lt!645251) (index!50706 lt!645251) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1477154 () Bool)

(assert (=> b!1477154 (= e!828851 (Found!12078 (index!50706 lt!645251)))))

(declare-fun b!1477155 () Bool)

(assert (=> b!1477155 (= e!828853 (MissingZero!12078 (index!50706 lt!645251)))))

(declare-fun d!156283 () Bool)

(declare-fun lt!645252 () SeekEntryResult!12078)

(assert (=> d!156283 (and (or ((_ is Undefined!12078) lt!645252) (not ((_ is Found!12078) lt!645252)) (and (bvsge (index!50705 lt!645252) #b00000000000000000000000000000000) (bvslt (index!50705 lt!645252) (size!48492 a!2862)))) (or ((_ is Undefined!12078) lt!645252) ((_ is Found!12078) lt!645252) (not ((_ is MissingZero!12078) lt!645252)) (and (bvsge (index!50704 lt!645252) #b00000000000000000000000000000000) (bvslt (index!50704 lt!645252) (size!48492 a!2862)))) (or ((_ is Undefined!12078) lt!645252) ((_ is Found!12078) lt!645252) ((_ is MissingZero!12078) lt!645252) (not ((_ is MissingVacant!12078) lt!645252)) (and (bvsge (index!50707 lt!645252) #b00000000000000000000000000000000) (bvslt (index!50707 lt!645252) (size!48492 a!2862)))) (or ((_ is Undefined!12078) lt!645252) (ite ((_ is Found!12078) lt!645252) (= (select (arr!47941 a!2862) (index!50705 lt!645252)) (select (arr!47941 a!2862) j!93)) (ite ((_ is MissingZero!12078) lt!645252) (= (select (arr!47941 a!2862) (index!50704 lt!645252)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12078) lt!645252) (= (select (arr!47941 a!2862) (index!50707 lt!645252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156283 (= lt!645252 e!828852)))

(declare-fun c!136689 () Bool)

(assert (=> d!156283 (= c!136689 (and ((_ is Intermediate!12078) lt!645251) (undefined!12890 lt!645251)))))

(assert (=> d!156283 (= lt!645251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156283 (validMask!0 mask!2687)))

(assert (=> d!156283 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645252)))

(declare-fun b!1477156 () Bool)

(assert (=> b!1477156 (= e!828852 Undefined!12078)))

(assert (= (and d!156283 c!136689) b!1477156))

(assert (= (and d!156283 (not c!136689)) b!1477152))

(assert (= (and b!1477152 c!136690) b!1477154))

(assert (= (and b!1477152 (not c!136690)) b!1477151))

(assert (= (and b!1477151 c!136688) b!1477155))

(assert (= (and b!1477151 (not c!136688)) b!1477153))

(declare-fun m!1363401 () Bool)

(assert (=> b!1477152 m!1363401))

(assert (=> b!1477153 m!1363195))

(declare-fun m!1363403 () Bool)

(assert (=> b!1477153 m!1363403))

(assert (=> d!156283 m!1363195))

(assert (=> d!156283 m!1363197))

(declare-fun m!1363405 () Bool)

(assert (=> d!156283 m!1363405))

(declare-fun m!1363407 () Bool)

(assert (=> d!156283 m!1363407))

(declare-fun m!1363409 () Bool)

(assert (=> d!156283 m!1363409))

(assert (=> d!156283 m!1363207))

(assert (=> d!156283 m!1363197))

(assert (=> d!156283 m!1363195))

(assert (=> d!156283 m!1363199))

(assert (=> b!1476937 d!156283))

(declare-fun d!156287 () Bool)

(declare-fun res!1002833 () Bool)

(declare-fun e!828871 () Bool)

(assert (=> d!156287 (=> res!1002833 e!828871)))

(assert (=> d!156287 (= res!1002833 (bvsge j!93 (size!48492 a!2862)))))

(assert (=> d!156287 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!828871)))

(declare-fun b!1477183 () Bool)

(declare-fun e!828870 () Bool)

(declare-fun call!67881 () Bool)

(assert (=> b!1477183 (= e!828870 call!67881)))

(declare-fun b!1477184 () Bool)

(declare-fun e!828869 () Bool)

(assert (=> b!1477184 (= e!828869 e!828870)))

(declare-fun lt!645269 () (_ BitVec 64))

(assert (=> b!1477184 (= lt!645269 (select (arr!47941 a!2862) j!93))))

(declare-fun lt!645270 () Unit!49529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99328 (_ BitVec 64) (_ BitVec 32)) Unit!49529)

(assert (=> b!1477184 (= lt!645270 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!645269 j!93))))

(declare-fun arrayContainsKey!0 (array!99328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1477184 (arrayContainsKey!0 a!2862 lt!645269 #b00000000000000000000000000000000)))

(declare-fun lt!645271 () Unit!49529)

(assert (=> b!1477184 (= lt!645271 lt!645270)))

(declare-fun res!1002834 () Bool)

(assert (=> b!1477184 (= res!1002834 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) (Found!12078 j!93)))))

(assert (=> b!1477184 (=> (not res!1002834) (not e!828870))))

(declare-fun b!1477185 () Bool)

(assert (=> b!1477185 (= e!828871 e!828869)))

(declare-fun c!136702 () Bool)

(assert (=> b!1477185 (= c!136702 (validKeyInArray!0 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1477186 () Bool)

(assert (=> b!1477186 (= e!828869 call!67881)))

(declare-fun bm!67878 () Bool)

(assert (=> bm!67878 (= call!67881 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156287 (not res!1002833)) b!1477185))

(assert (= (and b!1477185 c!136702) b!1477184))

(assert (= (and b!1477185 (not c!136702)) b!1477186))

(assert (= (and b!1477184 res!1002834) b!1477183))

(assert (= (or b!1477183 b!1477186) bm!67878))

(assert (=> b!1477184 m!1363195))

(declare-fun m!1363421 () Bool)

(assert (=> b!1477184 m!1363421))

(declare-fun m!1363423 () Bool)

(assert (=> b!1477184 m!1363423))

(assert (=> b!1477184 m!1363195))

(assert (=> b!1477184 m!1363219))

(assert (=> b!1477185 m!1363195))

(assert (=> b!1477185 m!1363195))

(assert (=> b!1477185 m!1363203))

(declare-fun m!1363425 () Bool)

(assert (=> bm!67878 m!1363425))

(assert (=> b!1476937 d!156287))

(declare-fun d!156291 () Bool)

(assert (=> d!156291 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!645274 () Unit!49529)

(declare-fun choose!38 (array!99328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49529)

(assert (=> d!156291 (= lt!645274 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156291 (validMask!0 mask!2687)))

(assert (=> d!156291 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!645274)))

(declare-fun bs!42580 () Bool)

(assert (= bs!42580 d!156291))

(assert (=> bs!42580 m!1363221))

(declare-fun m!1363427 () Bool)

(assert (=> bs!42580 m!1363427))

(assert (=> bs!42580 m!1363207))

(assert (=> b!1476937 d!156291))

(declare-fun d!156293 () Bool)

(assert (=> d!156293 (= (validKeyInArray!0 (select (arr!47941 a!2862) i!1006)) (and (not (= (select (arr!47941 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47941 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1476926 d!156293))

(declare-fun d!156295 () Bool)

(declare-fun res!1002835 () Bool)

(declare-fun e!828874 () Bool)

(assert (=> d!156295 (=> res!1002835 e!828874)))

(assert (=> d!156295 (= res!1002835 (bvsge #b00000000000000000000000000000000 (size!48492 a!2862)))))

(assert (=> d!156295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!828874)))

(declare-fun b!1477187 () Bool)

(declare-fun e!828873 () Bool)

(declare-fun call!67882 () Bool)

(assert (=> b!1477187 (= e!828873 call!67882)))

(declare-fun b!1477188 () Bool)

(declare-fun e!828872 () Bool)

(assert (=> b!1477188 (= e!828872 e!828873)))

(declare-fun lt!645275 () (_ BitVec 64))

(assert (=> b!1477188 (= lt!645275 (select (arr!47941 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!645276 () Unit!49529)

(assert (=> b!1477188 (= lt!645276 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!645275 #b00000000000000000000000000000000))))

(assert (=> b!1477188 (arrayContainsKey!0 a!2862 lt!645275 #b00000000000000000000000000000000)))

(declare-fun lt!645277 () Unit!49529)

(assert (=> b!1477188 (= lt!645277 lt!645276)))

(declare-fun res!1002836 () Bool)

(assert (=> b!1477188 (= res!1002836 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12078 #b00000000000000000000000000000000)))))

(assert (=> b!1477188 (=> (not res!1002836) (not e!828873))))

(declare-fun b!1477189 () Bool)

(assert (=> b!1477189 (= e!828874 e!828872)))

(declare-fun c!136703 () Bool)

(assert (=> b!1477189 (= c!136703 (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1477190 () Bool)

(assert (=> b!1477190 (= e!828872 call!67882)))

(declare-fun bm!67879 () Bool)

(assert (=> bm!67879 (= call!67882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!156295 (not res!1002835)) b!1477189))

(assert (= (and b!1477189 c!136703) b!1477188))

(assert (= (and b!1477189 (not c!136703)) b!1477190))

(assert (= (and b!1477188 res!1002836) b!1477187))

(assert (= (or b!1477187 b!1477190) bm!67879))

(assert (=> b!1477188 m!1363393))

(declare-fun m!1363429 () Bool)

(assert (=> b!1477188 m!1363429))

(declare-fun m!1363431 () Bool)

(assert (=> b!1477188 m!1363431))

(assert (=> b!1477188 m!1363393))

(declare-fun m!1363433 () Bool)

(assert (=> b!1477188 m!1363433))

(assert (=> b!1477189 m!1363393))

(assert (=> b!1477189 m!1363393))

(assert (=> b!1477189 m!1363395))

(declare-fun m!1363435 () Bool)

(assert (=> bm!67879 m!1363435))

(assert (=> b!1476936 d!156295))

(declare-fun b!1477195 () Bool)

(declare-fun e!828880 () SeekEntryResult!12078)

(assert (=> b!1477195 (= e!828880 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1477197 () Bool)

(assert (=> b!1477197 (= e!828880 (Intermediate!12078 false index!646 x!665))))

(declare-fun b!1477198 () Bool)

(declare-fun e!828879 () SeekEntryResult!12078)

(assert (=> b!1477198 (= e!828879 e!828880)))

(declare-fun c!136706 () Bool)

(declare-fun lt!645278 () (_ BitVec 64))

(assert (=> b!1477198 (= c!136706 (or (= lt!645278 (select (arr!47941 a!2862) j!93)) (= (bvadd lt!645278 lt!645278) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1477199 () Bool)

(assert (=> b!1477199 (= e!828879 (Intermediate!12078 true index!646 x!665))))

(declare-fun b!1477200 () Bool)

(declare-fun e!828877 () Bool)

(declare-fun e!828881 () Bool)

(assert (=> b!1477200 (= e!828877 e!828881)))

(declare-fun res!1002841 () Bool)

(declare-fun lt!645279 () SeekEntryResult!12078)

(assert (=> b!1477200 (= res!1002841 (and ((_ is Intermediate!12078) lt!645279) (not (undefined!12890 lt!645279)) (bvslt (x!132476 lt!645279) #b01111111111111111111111111111110) (bvsge (x!132476 lt!645279) #b00000000000000000000000000000000) (bvsge (x!132476 lt!645279) x!665)))))

(assert (=> b!1477200 (=> (not res!1002841) (not e!828881))))

(declare-fun b!1477201 () Bool)

(assert (=> b!1477201 (and (bvsge (index!50706 lt!645279) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645279) (size!48492 a!2862)))))

(declare-fun res!1002840 () Bool)

(assert (=> b!1477201 (= res!1002840 (= (select (arr!47941 a!2862) (index!50706 lt!645279)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!828878 () Bool)

(assert (=> b!1477201 (=> res!1002840 e!828878)))

(declare-fun b!1477196 () Bool)

(assert (=> b!1477196 (and (bvsge (index!50706 lt!645279) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645279) (size!48492 a!2862)))))

(declare-fun res!1002839 () Bool)

(assert (=> b!1477196 (= res!1002839 (= (select (arr!47941 a!2862) (index!50706 lt!645279)) (select (arr!47941 a!2862) j!93)))))

(assert (=> b!1477196 (=> res!1002839 e!828878)))

(assert (=> b!1477196 (= e!828881 e!828878)))

(declare-fun d!156297 () Bool)

(assert (=> d!156297 e!828877))

(declare-fun c!136705 () Bool)

(assert (=> d!156297 (= c!136705 (and ((_ is Intermediate!12078) lt!645279) (undefined!12890 lt!645279)))))

(assert (=> d!156297 (= lt!645279 e!828879)))

(declare-fun c!136704 () Bool)

(assert (=> d!156297 (= c!136704 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156297 (= lt!645278 (select (arr!47941 a!2862) index!646))))

(assert (=> d!156297 (validMask!0 mask!2687)))

(assert (=> d!156297 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645279)))

(declare-fun b!1477202 () Bool)

(assert (=> b!1477202 (and (bvsge (index!50706 lt!645279) #b00000000000000000000000000000000) (bvslt (index!50706 lt!645279) (size!48492 a!2862)))))

(assert (=> b!1477202 (= e!828878 (= (select (arr!47941 a!2862) (index!50706 lt!645279)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1477203 () Bool)

(assert (=> b!1477203 (= e!828877 (bvsge (x!132476 lt!645279) #b01111111111111111111111111111110))))

(assert (= (and d!156297 c!136704) b!1477199))

(assert (= (and d!156297 (not c!136704)) b!1477198))

(assert (= (and b!1477198 c!136706) b!1477197))

(assert (= (and b!1477198 (not c!136706)) b!1477195))

(assert (= (and d!156297 c!136705) b!1477203))

(assert (= (and d!156297 (not c!136705)) b!1477200))

(assert (= (and b!1477200 res!1002841) b!1477196))

(assert (= (and b!1477196 (not res!1002839)) b!1477201))

(assert (= (and b!1477201 (not res!1002840)) b!1477202))

(assert (=> d!156297 m!1363189))

(assert (=> d!156297 m!1363207))

(declare-fun m!1363437 () Bool)

(assert (=> b!1477202 m!1363437))

(assert (=> b!1477195 m!1363357))

(assert (=> b!1477195 m!1363357))

(assert (=> b!1477195 m!1363195))

(declare-fun m!1363439 () Bool)

(assert (=> b!1477195 m!1363439))

(assert (=> b!1477196 m!1363437))

(assert (=> b!1477201 m!1363437))

(assert (=> b!1476930 d!156297))

(declare-fun b!1477208 () Bool)

(declare-fun e!828886 () SeekEntryResult!12078)

(assert (=> b!1477208 (= e!828886 Undefined!12078)))

(declare-fun b!1477209 () Bool)

(declare-fun e!828887 () SeekEntryResult!12078)

(assert (=> b!1477209 (= e!828887 (Found!12078 index!646))))

(declare-fun b!1477210 () Bool)

(declare-fun e!828888 () SeekEntryResult!12078)

(assert (=> b!1477210 (= e!828888 (MissingVacant!12078 index!646))))

(declare-fun lt!645287 () SeekEntryResult!12078)

(declare-fun d!156299 () Bool)

(assert (=> d!156299 (and (or ((_ is Undefined!12078) lt!645287) (not ((_ is Found!12078) lt!645287)) (and (bvsge (index!50705 lt!645287) #b00000000000000000000000000000000) (bvslt (index!50705 lt!645287) (size!48492 a!2862)))) (or ((_ is Undefined!12078) lt!645287) ((_ is Found!12078) lt!645287) (not ((_ is MissingVacant!12078) lt!645287)) (not (= (index!50707 lt!645287) index!646)) (and (bvsge (index!50707 lt!645287) #b00000000000000000000000000000000) (bvslt (index!50707 lt!645287) (size!48492 a!2862)))) (or ((_ is Undefined!12078) lt!645287) (ite ((_ is Found!12078) lt!645287) (= (select (arr!47941 a!2862) (index!50705 lt!645287)) (select (arr!47941 a!2862) j!93)) (and ((_ is MissingVacant!12078) lt!645287) (= (index!50707 lt!645287) index!646) (= (select (arr!47941 a!2862) (index!50707 lt!645287)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156299 (= lt!645287 e!828886)))

(declare-fun c!136711 () Bool)

(assert (=> d!156299 (= c!136711 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!645286 () (_ BitVec 64))

(assert (=> d!156299 (= lt!645286 (select (arr!47941 a!2862) index!646))))

(assert (=> d!156299 (validMask!0 mask!2687)))

(assert (=> d!156299 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645287)))

(declare-fun b!1477211 () Bool)

(assert (=> b!1477211 (= e!828888 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1477212 () Bool)

(declare-fun c!136709 () Bool)

(assert (=> b!1477212 (= c!136709 (= lt!645286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477212 (= e!828887 e!828888)))

(declare-fun b!1477213 () Bool)

(assert (=> b!1477213 (= e!828886 e!828887)))

(declare-fun c!136710 () Bool)

(assert (=> b!1477213 (= c!136710 (= lt!645286 (select (arr!47941 a!2862) j!93)))))

(assert (= (and d!156299 c!136711) b!1477208))

(assert (= (and d!156299 (not c!136711)) b!1477213))

(assert (= (and b!1477213 c!136710) b!1477209))

(assert (= (and b!1477213 (not c!136710)) b!1477212))

(assert (= (and b!1477212 c!136709) b!1477210))

(assert (= (and b!1477212 (not c!136709)) b!1477211))

(declare-fun m!1363441 () Bool)

(assert (=> d!156299 m!1363441))

(declare-fun m!1363443 () Bool)

(assert (=> d!156299 m!1363443))

(assert (=> d!156299 m!1363189))

(assert (=> d!156299 m!1363207))

(assert (=> b!1477211 m!1363357))

(assert (=> b!1477211 m!1363357))

(assert (=> b!1477211 m!1363195))

(declare-fun m!1363445 () Bool)

(assert (=> b!1477211 m!1363445))

(assert (=> b!1476921 d!156299))

(check-sat (not b!1477153) (not b!1477067) (not b!1477211) (not bm!67878) (not b!1477146) (not bm!67879) (not b!1477189) (not d!156273) (not d!156299) (not d!156291) (not b!1477100) (not d!156283) (not d!156265) (not b!1477188) (not b!1477184) (not b!1477132) (not bm!67875) (not b!1477147) (not b!1477058) (not d!156257) (not b!1477185) (not b!1477076) (not b!1477150) (not b!1477195) (not d!156267) (not d!156297) (not d!156271))
(check-sat)
