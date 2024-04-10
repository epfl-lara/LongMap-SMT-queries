; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125608 () Bool)

(assert start!125608)

(declare-fun b!1470022 () Bool)

(declare-fun res!998439 () Bool)

(declare-fun e!825207 () Bool)

(assert (=> b!1470022 (=> (not res!998439) (not e!825207))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99056 0))(
  ( (array!99057 (arr!47816 (Array (_ BitVec 32) (_ BitVec 64))) (size!48366 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99056)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470022 (= res!998439 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48366 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48366 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48366 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!998442 () Bool)

(assert (=> start!125608 (=> (not res!998442) (not e!825207))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125608 (= res!998442 (validMask!0 mask!2687))))

(assert (=> start!125608 e!825207))

(assert (=> start!125608 true))

(declare-fun array_inv!36844 (array!99056) Bool)

(assert (=> start!125608 (array_inv!36844 a!2862)))

(declare-fun b!1470023 () Bool)

(declare-fun e!825204 () Bool)

(declare-fun e!825205 () Bool)

(assert (=> b!1470023 (= e!825204 e!825205)))

(declare-fun res!998437 () Bool)

(assert (=> b!1470023 (=> (not res!998437) (not e!825205))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12056 0))(
  ( (MissingZero!12056 (index!50616 (_ BitVec 32))) (Found!12056 (index!50617 (_ BitVec 32))) (Intermediate!12056 (undefined!12868 Bool) (index!50618 (_ BitVec 32)) (x!132193 (_ BitVec 32))) (Undefined!12056) (MissingVacant!12056 (index!50619 (_ BitVec 32))) )
))
(declare-fun lt!642756 () SeekEntryResult!12056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99056 (_ BitVec 32)) SeekEntryResult!12056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470023 (= res!998437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) (select (arr!47816 a!2862) j!93) a!2862 mask!2687) lt!642756))))

(assert (=> b!1470023 (= lt!642756 (Intermediate!12056 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470024 () Bool)

(declare-fun res!998440 () Bool)

(assert (=> b!1470024 (=> (not res!998440) (not e!825207))))

(declare-datatypes ((List!34317 0))(
  ( (Nil!34314) (Cons!34313 (h!35663 (_ BitVec 64)) (t!49011 List!34317)) )
))
(declare-fun arrayNoDuplicates!0 (array!99056 (_ BitVec 32) List!34317) Bool)

(assert (=> b!1470024 (= res!998440 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34314))))

(declare-fun b!1470025 () Bool)

(declare-fun res!998441 () Bool)

(assert (=> b!1470025 (=> (not res!998441) (not e!825207))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470025 (= res!998441 (and (= (size!48366 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48366 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48366 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470026 () Bool)

(declare-fun res!998433 () Bool)

(assert (=> b!1470026 (=> (not res!998433) (not e!825207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99056 (_ BitVec 32)) Bool)

(assert (=> b!1470026 (= res!998433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470027 () Bool)

(declare-fun res!998443 () Bool)

(declare-fun e!825208 () Bool)

(assert (=> b!1470027 (=> (not res!998443) (not e!825208))))

(assert (=> b!1470027 (= res!998443 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!642754 () (_ BitVec 64))

(declare-fun lt!642753 () array!99056)

(declare-fun e!825209 () Bool)

(declare-fun b!1470028 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99056 (_ BitVec 32)) SeekEntryResult!12056)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99056 (_ BitVec 32)) SeekEntryResult!12056)

(assert (=> b!1470028 (= e!825209 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642754 lt!642753 mask!2687) (seekEntryOrOpen!0 lt!642754 lt!642753 mask!2687)))))

(declare-fun b!1470029 () Bool)

(assert (=> b!1470029 (= e!825208 (not (= (seekEntryOrOpen!0 (select (arr!47816 a!2862) j!93) a!2862 mask!2687) (Found!12056 j!93))))))

(assert (=> b!1470029 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49452 0))(
  ( (Unit!49453) )
))
(declare-fun lt!642755 () Unit!49452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49452)

(assert (=> b!1470029 (= lt!642755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470030 () Bool)

(declare-fun lt!642752 () SeekEntryResult!12056)

(assert (=> b!1470030 (= e!825209 (= lt!642752 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642754 lt!642753 mask!2687)))))

(declare-fun b!1470031 () Bool)

(declare-fun res!998431 () Bool)

(assert (=> b!1470031 (=> (not res!998431) (not e!825208))))

(assert (=> b!1470031 (= res!998431 e!825209)))

(declare-fun c!135306 () Bool)

(assert (=> b!1470031 (= c!135306 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470032 () Bool)

(declare-fun res!998438 () Bool)

(assert (=> b!1470032 (=> (not res!998438) (not e!825205))))

(assert (=> b!1470032 (= res!998438 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47816 a!2862) j!93) a!2862 mask!2687) lt!642756))))

(declare-fun b!1470033 () Bool)

(declare-fun res!998435 () Bool)

(assert (=> b!1470033 (=> (not res!998435) (not e!825207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470033 (= res!998435 (validKeyInArray!0 (select (arr!47816 a!2862) j!93)))))

(declare-fun b!1470034 () Bool)

(assert (=> b!1470034 (= e!825207 e!825204)))

(declare-fun res!998436 () Bool)

(assert (=> b!1470034 (=> (not res!998436) (not e!825204))))

(assert (=> b!1470034 (= res!998436 (= (select (store (arr!47816 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470034 (= lt!642753 (array!99057 (store (arr!47816 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48366 a!2862)))))

(declare-fun b!1470035 () Bool)

(declare-fun res!998432 () Bool)

(assert (=> b!1470035 (=> (not res!998432) (not e!825207))))

(assert (=> b!1470035 (= res!998432 (validKeyInArray!0 (select (arr!47816 a!2862) i!1006)))))

(declare-fun b!1470036 () Bool)

(assert (=> b!1470036 (= e!825205 e!825208)))

(declare-fun res!998434 () Bool)

(assert (=> b!1470036 (=> (not res!998434) (not e!825208))))

(assert (=> b!1470036 (= res!998434 (= lt!642752 (Intermediate!12056 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470036 (= lt!642752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642754 mask!2687) lt!642754 lt!642753 mask!2687))))

(assert (=> b!1470036 (= lt!642754 (select (store (arr!47816 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125608 res!998442) b!1470025))

(assert (= (and b!1470025 res!998441) b!1470035))

(assert (= (and b!1470035 res!998432) b!1470033))

(assert (= (and b!1470033 res!998435) b!1470026))

(assert (= (and b!1470026 res!998433) b!1470024))

(assert (= (and b!1470024 res!998440) b!1470022))

(assert (= (and b!1470022 res!998439) b!1470034))

(assert (= (and b!1470034 res!998436) b!1470023))

(assert (= (and b!1470023 res!998437) b!1470032))

(assert (= (and b!1470032 res!998438) b!1470036))

(assert (= (and b!1470036 res!998434) b!1470031))

(assert (= (and b!1470031 c!135306) b!1470030))

(assert (= (and b!1470031 (not c!135306)) b!1470028))

(assert (= (and b!1470031 res!998431) b!1470027))

(assert (= (and b!1470027 res!998443) b!1470029))

(declare-fun m!1357159 () Bool)

(assert (=> b!1470030 m!1357159))

(declare-fun m!1357161 () Bool)

(assert (=> start!125608 m!1357161))

(declare-fun m!1357163 () Bool)

(assert (=> start!125608 m!1357163))

(declare-fun m!1357165 () Bool)

(assert (=> b!1470036 m!1357165))

(assert (=> b!1470036 m!1357165))

(declare-fun m!1357167 () Bool)

(assert (=> b!1470036 m!1357167))

(declare-fun m!1357169 () Bool)

(assert (=> b!1470036 m!1357169))

(declare-fun m!1357171 () Bool)

(assert (=> b!1470036 m!1357171))

(declare-fun m!1357173 () Bool)

(assert (=> b!1470023 m!1357173))

(assert (=> b!1470023 m!1357173))

(declare-fun m!1357175 () Bool)

(assert (=> b!1470023 m!1357175))

(assert (=> b!1470023 m!1357175))

(assert (=> b!1470023 m!1357173))

(declare-fun m!1357177 () Bool)

(assert (=> b!1470023 m!1357177))

(declare-fun m!1357179 () Bool)

(assert (=> b!1470035 m!1357179))

(assert (=> b!1470035 m!1357179))

(declare-fun m!1357181 () Bool)

(assert (=> b!1470035 m!1357181))

(assert (=> b!1470033 m!1357173))

(assert (=> b!1470033 m!1357173))

(declare-fun m!1357183 () Bool)

(assert (=> b!1470033 m!1357183))

(declare-fun m!1357185 () Bool)

(assert (=> b!1470028 m!1357185))

(declare-fun m!1357187 () Bool)

(assert (=> b!1470028 m!1357187))

(assert (=> b!1470032 m!1357173))

(assert (=> b!1470032 m!1357173))

(declare-fun m!1357189 () Bool)

(assert (=> b!1470032 m!1357189))

(assert (=> b!1470029 m!1357173))

(assert (=> b!1470029 m!1357173))

(declare-fun m!1357191 () Bool)

(assert (=> b!1470029 m!1357191))

(declare-fun m!1357193 () Bool)

(assert (=> b!1470029 m!1357193))

(declare-fun m!1357195 () Bool)

(assert (=> b!1470029 m!1357195))

(assert (=> b!1470034 m!1357169))

(declare-fun m!1357197 () Bool)

(assert (=> b!1470034 m!1357197))

(declare-fun m!1357199 () Bool)

(assert (=> b!1470024 m!1357199))

(declare-fun m!1357201 () Bool)

(assert (=> b!1470026 m!1357201))

(push 1)

(assert (not b!1470032))

(assert (not b!1470033))

(assert (not b!1470023))

(assert (not b!1470036))

(assert (not b!1470026))

(assert (not start!125608))

(assert (not b!1470024))

(assert (not b!1470035))

(assert (not b!1470030))

(assert (not b!1470029))

(assert (not b!1470028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1470238 () Bool)

(declare-fun lt!642829 () SeekEntryResult!12056)

(assert (=> b!1470238 (and (bvsge (index!50618 lt!642829) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642829) (size!48366 lt!642753)))))

(declare-fun res!998544 () Bool)

(assert (=> b!1470238 (= res!998544 (= (select (arr!47816 lt!642753) (index!50618 lt!642829)) lt!642754))))

(declare-fun e!825306 () Bool)

(assert (=> b!1470238 (=> res!998544 e!825306)))

(declare-fun e!825308 () Bool)

(assert (=> b!1470238 (= e!825308 e!825306)))

(declare-fun b!1470239 () Bool)

(declare-fun e!825309 () SeekEntryResult!12056)

(assert (=> b!1470239 (= e!825309 (Intermediate!12056 true (toIndex!0 lt!642754 mask!2687) #b00000000000000000000000000000000))))

(declare-fun e!825307 () SeekEntryResult!12056)

(declare-fun b!1470240 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470240 (= e!825307 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!642754 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!642754 lt!642753 mask!2687))))

(declare-fun b!1470241 () Bool)

(assert (=> b!1470241 (= e!825309 e!825307)))

(declare-fun c!135360 () Bool)

(declare-fun lt!642828 () (_ BitVec 64))

(assert (=> b!1470241 (= c!135360 (or (= lt!642828 lt!642754) (= (bvadd lt!642828 lt!642828) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155319 () Bool)

(declare-fun e!825305 () Bool)

(assert (=> d!155319 e!825305))

(declare-fun c!135359 () Bool)

(assert (=> d!155319 (= c!135359 (and (is-Intermediate!12056 lt!642829) (undefined!12868 lt!642829)))))

(assert (=> d!155319 (= lt!642829 e!825309)))

(declare-fun c!135358 () Bool)

(assert (=> d!155319 (= c!135358 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155319 (= lt!642828 (select (arr!47816 lt!642753) (toIndex!0 lt!642754 mask!2687)))))

(assert (=> d!155319 (validMask!0 mask!2687)))

(assert (=> d!155319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642754 mask!2687) lt!642754 lt!642753 mask!2687) lt!642829)))

(declare-fun b!1470242 () Bool)

(assert (=> b!1470242 (= e!825307 (Intermediate!12056 false (toIndex!0 lt!642754 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470243 () Bool)

(assert (=> b!1470243 (and (bvsge (index!50618 lt!642829) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642829) (size!48366 lt!642753)))))

(declare-fun res!998545 () Bool)

(assert (=> b!1470243 (= res!998545 (= (select (arr!47816 lt!642753) (index!50618 lt!642829)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470243 (=> res!998545 e!825306)))

(declare-fun b!1470244 () Bool)

(assert (=> b!1470244 (= e!825305 e!825308)))

(declare-fun res!998546 () Bool)

(assert (=> b!1470244 (= res!998546 (and (is-Intermediate!12056 lt!642829) (not (undefined!12868 lt!642829)) (bvslt (x!132193 lt!642829) #b01111111111111111111111111111110) (bvsge (x!132193 lt!642829) #b00000000000000000000000000000000) (bvsge (x!132193 lt!642829) #b00000000000000000000000000000000)))))

(assert (=> b!1470244 (=> (not res!998546) (not e!825308))))

(declare-fun b!1470245 () Bool)

(assert (=> b!1470245 (= e!825305 (bvsge (x!132193 lt!642829) #b01111111111111111111111111111110))))

(declare-fun b!1470246 () Bool)

(assert (=> b!1470246 (and (bvsge (index!50618 lt!642829) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642829) (size!48366 lt!642753)))))

(assert (=> b!1470246 (= e!825306 (= (select (arr!47816 lt!642753) (index!50618 lt!642829)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155319 c!135358) b!1470239))

(assert (= (and d!155319 (not c!135358)) b!1470241))

(assert (= (and b!1470241 c!135360) b!1470242))

(assert (= (and b!1470241 (not c!135360)) b!1470240))

(assert (= (and d!155319 c!135359) b!1470245))

(assert (= (and d!155319 (not c!135359)) b!1470244))

(assert (= (and b!1470244 res!998546) b!1470238))

(assert (= (and b!1470238 (not res!998544)) b!1470243))

(assert (= (and b!1470243 (not res!998545)) b!1470246))

(declare-fun m!1357329 () Bool)

(assert (=> b!1470238 m!1357329))

(assert (=> b!1470240 m!1357165))

(declare-fun m!1357331 () Bool)

(assert (=> b!1470240 m!1357331))

(assert (=> b!1470240 m!1357331))

(declare-fun m!1357333 () Bool)

(assert (=> b!1470240 m!1357333))

(assert (=> b!1470243 m!1357329))

(assert (=> b!1470246 m!1357329))

(assert (=> d!155319 m!1357165))

(declare-fun m!1357335 () Bool)

(assert (=> d!155319 m!1357335))

(assert (=> d!155319 m!1357161))

(assert (=> b!1470036 d!155319))

(declare-fun d!155331 () Bool)

(declare-fun lt!642838 () (_ BitVec 32))

(declare-fun lt!642837 () (_ BitVec 32))

(assert (=> d!155331 (= lt!642838 (bvmul (bvxor lt!642837 (bvlshr lt!642837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155331 (= lt!642837 ((_ extract 31 0) (bvand (bvxor lt!642754 (bvlshr lt!642754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155331 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!998547 (let ((h!35667 ((_ extract 31 0) (bvand (bvxor lt!642754 (bvlshr lt!642754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132200 (bvmul (bvxor h!35667 (bvlshr h!35667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132200 (bvlshr x!132200 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!998547 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!998547 #b00000000000000000000000000000000))))))

(assert (=> d!155331 (= (toIndex!0 lt!642754 mask!2687) (bvand (bvxor lt!642838 (bvlshr lt!642838 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470036 d!155331))

(declare-fun bm!67702 () Bool)

(declare-fun call!67705 () Bool)

(assert (=> bm!67702 (= call!67705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1470289 () Bool)

(declare-fun e!825342 () Bool)

(assert (=> b!1470289 (= e!825342 call!67705)))

(declare-fun b!1470288 () Bool)

(declare-fun e!825341 () Bool)

(assert (=> b!1470288 (= e!825341 call!67705)))

(declare-fun d!155335 () Bool)

(declare-fun res!998568 () Bool)

(declare-fun e!825340 () Bool)

(assert (=> d!155335 (=> res!998568 e!825340)))

(assert (=> d!155335 (= res!998568 (bvsge #b00000000000000000000000000000000 (size!48366 a!2862)))))

(assert (=> d!155335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825340)))

(declare-fun b!1470290 () Bool)

(assert (=> b!1470290 (= e!825340 e!825341)))

(declare-fun c!135372 () Bool)

(assert (=> b!1470290 (= c!135372 (validKeyInArray!0 (select (arr!47816 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470291 () Bool)

(assert (=> b!1470291 (= e!825341 e!825342)))

(declare-fun lt!642856 () (_ BitVec 64))

(assert (=> b!1470291 (= lt!642856 (select (arr!47816 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!642854 () Unit!49452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99056 (_ BitVec 64) (_ BitVec 32)) Unit!49452)

(assert (=> b!1470291 (= lt!642854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642856 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1470291 (arrayContainsKey!0 a!2862 lt!642856 #b00000000000000000000000000000000)))

(declare-fun lt!642855 () Unit!49452)

(assert (=> b!1470291 (= lt!642855 lt!642854)))

(declare-fun res!998567 () Bool)

(assert (=> b!1470291 (= res!998567 (= (seekEntryOrOpen!0 (select (arr!47816 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12056 #b00000000000000000000000000000000)))))

(assert (=> b!1470291 (=> (not res!998567) (not e!825342))))

(assert (= (and d!155335 (not res!998568)) b!1470290))

(assert (= (and b!1470290 c!135372) b!1470291))

(assert (= (and b!1470290 (not c!135372)) b!1470288))

(assert (= (and b!1470291 res!998567) b!1470289))

(assert (= (or b!1470289 b!1470288) bm!67702))

(declare-fun m!1357361 () Bool)

(assert (=> bm!67702 m!1357361))

(declare-fun m!1357363 () Bool)

(assert (=> b!1470290 m!1357363))

(assert (=> b!1470290 m!1357363))

(declare-fun m!1357365 () Bool)

(assert (=> b!1470290 m!1357365))

(assert (=> b!1470291 m!1357363))

(declare-fun m!1357367 () Bool)

(assert (=> b!1470291 m!1357367))

(declare-fun m!1357369 () Bool)

(assert (=> b!1470291 m!1357369))

(assert (=> b!1470291 m!1357363))

(declare-fun m!1357371 () Bool)

(assert (=> b!1470291 m!1357371))

(assert (=> b!1470026 d!155335))

(declare-fun d!155345 () Bool)

(assert (=> d!155345 (= (validKeyInArray!0 (select (arr!47816 a!2862) i!1006)) (and (not (= (select (arr!47816 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47816 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470035 d!155345))

(declare-fun b!1470310 () Bool)

(declare-fun e!825359 () Bool)

(declare-fun e!825360 () Bool)

(assert (=> b!1470310 (= e!825359 e!825360)))

(declare-fun c!135377 () Bool)

(assert (=> b!1470310 (= c!135377 (validKeyInArray!0 (select (arr!47816 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470311 () Bool)

(declare-fun call!67710 () Bool)

(assert (=> b!1470311 (= e!825360 call!67710)))

(declare-fun bm!67707 () Bool)

(assert (=> bm!67707 (= call!67710 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135377 (Cons!34313 (select (arr!47816 a!2862) #b00000000000000000000000000000000) Nil!34314) Nil!34314)))))

(declare-fun d!155349 () Bool)

(declare-fun res!998579 () Bool)

(declare-fun e!825358 () Bool)

(assert (=> d!155349 (=> res!998579 e!825358)))

(assert (=> d!155349 (= res!998579 (bvsge #b00000000000000000000000000000000 (size!48366 a!2862)))))

(assert (=> d!155349 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34314) e!825358)))

(declare-fun b!1470312 () Bool)

(assert (=> b!1470312 (= e!825358 e!825359)))

(declare-fun res!998580 () Bool)

(assert (=> b!1470312 (=> (not res!998580) (not e!825359))))

(declare-fun e!825357 () Bool)

(assert (=> b!1470312 (= res!998580 (not e!825357))))

(declare-fun res!998581 () Bool)

(assert (=> b!1470312 (=> (not res!998581) (not e!825357))))

(assert (=> b!1470312 (= res!998581 (validKeyInArray!0 (select (arr!47816 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470313 () Bool)

(declare-fun contains!9897 (List!34317 (_ BitVec 64)) Bool)

(assert (=> b!1470313 (= e!825357 (contains!9897 Nil!34314 (select (arr!47816 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470314 () Bool)

(assert (=> b!1470314 (= e!825360 call!67710)))

(assert (= (and d!155349 (not res!998579)) b!1470312))

(assert (= (and b!1470312 res!998581) b!1470313))

(assert (= (and b!1470312 res!998580) b!1470310))

(assert (= (and b!1470310 c!135377) b!1470314))

(assert (= (and b!1470310 (not c!135377)) b!1470311))

(assert (= (or b!1470314 b!1470311) bm!67707))

(assert (=> b!1470310 m!1357363))

(assert (=> b!1470310 m!1357363))

(assert (=> b!1470310 m!1357365))

(assert (=> bm!67707 m!1357363))

(declare-fun m!1357375 () Bool)

(assert (=> bm!67707 m!1357375))

(assert (=> b!1470312 m!1357363))

(assert (=> b!1470312 m!1357363))

(assert (=> b!1470312 m!1357365))

(assert (=> b!1470313 m!1357363))

(assert (=> b!1470313 m!1357363))

(declare-fun m!1357377 () Bool)

(assert (=> b!1470313 m!1357377))

(assert (=> b!1470024 d!155349))

(declare-fun b!1470384 () Bool)

(declare-fun e!825401 () SeekEntryResult!12056)

(assert (=> b!1470384 (= e!825401 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!642754 lt!642753 mask!2687))))

(declare-fun b!1470385 () Bool)

(assert (=> b!1470385 (= e!825401 (MissingVacant!12056 intermediateAfterIndex!19))))

(declare-fun b!1470387 () Bool)

(declare-fun e!825403 () SeekEntryResult!12056)

(assert (=> b!1470387 (= e!825403 (Found!12056 index!646))))

(declare-fun b!1470388 () Bool)

(declare-fun e!825402 () SeekEntryResult!12056)

(assert (=> b!1470388 (= e!825402 e!825403)))

(declare-fun c!135407 () Bool)

(declare-fun lt!642895 () (_ BitVec 64))

(assert (=> b!1470388 (= c!135407 (= lt!642895 lt!642754))))

(declare-fun b!1470389 () Bool)

(declare-fun c!135406 () Bool)

(assert (=> b!1470389 (= c!135406 (= lt!642895 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470389 (= e!825403 e!825401)))

(declare-fun b!1470386 () Bool)

(assert (=> b!1470386 (= e!825402 Undefined!12056)))

(declare-fun lt!642896 () SeekEntryResult!12056)

(declare-fun d!155351 () Bool)

(assert (=> d!155351 (and (or (is-Undefined!12056 lt!642896) (not (is-Found!12056 lt!642896)) (and (bvsge (index!50617 lt!642896) #b00000000000000000000000000000000) (bvslt (index!50617 lt!642896) (size!48366 lt!642753)))) (or (is-Undefined!12056 lt!642896) (is-Found!12056 lt!642896) (not (is-MissingVacant!12056 lt!642896)) (not (= (index!50619 lt!642896) intermediateAfterIndex!19)) (and (bvsge (index!50619 lt!642896) #b00000000000000000000000000000000) (bvslt (index!50619 lt!642896) (size!48366 lt!642753)))) (or (is-Undefined!12056 lt!642896) (ite (is-Found!12056 lt!642896) (= (select (arr!47816 lt!642753) (index!50617 lt!642896)) lt!642754) (and (is-MissingVacant!12056 lt!642896) (= (index!50619 lt!642896) intermediateAfterIndex!19) (= (select (arr!47816 lt!642753) (index!50619 lt!642896)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155351 (= lt!642896 e!825402)))

(declare-fun c!135408 () Bool)

(assert (=> d!155351 (= c!135408 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155351 (= lt!642895 (select (arr!47816 lt!642753) index!646))))

(assert (=> d!155351 (validMask!0 mask!2687)))

(assert (=> d!155351 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642754 lt!642753 mask!2687) lt!642896)))

(assert (= (and d!155351 c!135408) b!1470386))

(assert (= (and d!155351 (not c!135408)) b!1470388))

(assert (= (and b!1470388 c!135407) b!1470387))

(assert (= (and b!1470388 (not c!135407)) b!1470389))

(assert (= (and b!1470389 c!135406) b!1470385))

(assert (= (and b!1470389 (not c!135406)) b!1470384))

(declare-fun m!1357433 () Bool)

(assert (=> b!1470384 m!1357433))

(assert (=> b!1470384 m!1357433))

(declare-fun m!1357435 () Bool)

(assert (=> b!1470384 m!1357435))

(declare-fun m!1357437 () Bool)

(assert (=> d!155351 m!1357437))

(declare-fun m!1357439 () Bool)

(assert (=> d!155351 m!1357439))

(declare-fun m!1357441 () Bool)

(assert (=> d!155351 m!1357441))

(assert (=> d!155351 m!1357161))

(assert (=> b!1470028 d!155351))

(declare-fun b!1470407 () Bool)

(declare-fun e!825414 () SeekEntryResult!12056)

(declare-fun lt!642903 () SeekEntryResult!12056)

(assert (=> b!1470407 (= e!825414 (MissingZero!12056 (index!50618 lt!642903)))))

(declare-fun b!1470408 () Bool)

(assert (=> b!1470408 (= e!825414 (seekKeyOrZeroReturnVacant!0 (x!132193 lt!642903) (index!50618 lt!642903) (index!50618 lt!642903) lt!642754 lt!642753 mask!2687))))

(declare-fun b!1470409 () Bool)

(declare-fun c!135418 () Bool)

(declare-fun lt!642905 () (_ BitVec 64))

(assert (=> b!1470409 (= c!135418 (= lt!642905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825415 () SeekEntryResult!12056)

(assert (=> b!1470409 (= e!825415 e!825414)))

(declare-fun b!1470410 () Bool)

(declare-fun e!825416 () SeekEntryResult!12056)

(assert (=> b!1470410 (= e!825416 Undefined!12056)))

(declare-fun b!1470411 () Bool)

(assert (=> b!1470411 (= e!825415 (Found!12056 (index!50618 lt!642903)))))

(declare-fun d!155369 () Bool)

(declare-fun lt!642904 () SeekEntryResult!12056)

(assert (=> d!155369 (and (or (is-Undefined!12056 lt!642904) (not (is-Found!12056 lt!642904)) (and (bvsge (index!50617 lt!642904) #b00000000000000000000000000000000) (bvslt (index!50617 lt!642904) (size!48366 lt!642753)))) (or (is-Undefined!12056 lt!642904) (is-Found!12056 lt!642904) (not (is-MissingZero!12056 lt!642904)) (and (bvsge (index!50616 lt!642904) #b00000000000000000000000000000000) (bvslt (index!50616 lt!642904) (size!48366 lt!642753)))) (or (is-Undefined!12056 lt!642904) (is-Found!12056 lt!642904) (is-MissingZero!12056 lt!642904) (not (is-MissingVacant!12056 lt!642904)) (and (bvsge (index!50619 lt!642904) #b00000000000000000000000000000000) (bvslt (index!50619 lt!642904) (size!48366 lt!642753)))) (or (is-Undefined!12056 lt!642904) (ite (is-Found!12056 lt!642904) (= (select (arr!47816 lt!642753) (index!50617 lt!642904)) lt!642754) (ite (is-MissingZero!12056 lt!642904) (= (select (arr!47816 lt!642753) (index!50616 lt!642904)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12056 lt!642904) (= (select (arr!47816 lt!642753) (index!50619 lt!642904)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155369 (= lt!642904 e!825416)))

(declare-fun c!135416 () Bool)

(assert (=> d!155369 (= c!135416 (and (is-Intermediate!12056 lt!642903) (undefined!12868 lt!642903)))))

(assert (=> d!155369 (= lt!642903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642754 mask!2687) lt!642754 lt!642753 mask!2687))))

(assert (=> d!155369 (validMask!0 mask!2687)))

(assert (=> d!155369 (= (seekEntryOrOpen!0 lt!642754 lt!642753 mask!2687) lt!642904)))

(declare-fun b!1470412 () Bool)

(assert (=> b!1470412 (= e!825416 e!825415)))

(assert (=> b!1470412 (= lt!642905 (select (arr!47816 lt!642753) (index!50618 lt!642903)))))

(declare-fun c!135417 () Bool)

(assert (=> b!1470412 (= c!135417 (= lt!642905 lt!642754))))

(assert (= (and d!155369 c!135416) b!1470410))

(assert (= (and d!155369 (not c!135416)) b!1470412))

(assert (= (and b!1470412 c!135417) b!1470411))

(assert (= (and b!1470412 (not c!135417)) b!1470409))

(assert (= (and b!1470409 c!135418) b!1470407))

(assert (= (and b!1470409 (not c!135418)) b!1470408))

(declare-fun m!1357451 () Bool)

(assert (=> b!1470408 m!1357451))

(assert (=> d!155369 m!1357165))

(declare-fun m!1357453 () Bool)

(assert (=> d!155369 m!1357453))

(declare-fun m!1357455 () Bool)

(assert (=> d!155369 m!1357455))

(declare-fun m!1357457 () Bool)

(assert (=> d!155369 m!1357457))

(assert (=> d!155369 m!1357165))

(assert (=> d!155369 m!1357167))

(assert (=> d!155369 m!1357161))

(declare-fun m!1357459 () Bool)

(assert (=> b!1470412 m!1357459))

(assert (=> b!1470028 d!155369))

(declare-fun b!1470413 () Bool)

(declare-fun e!825417 () SeekEntryResult!12056)

(declare-fun lt!642906 () SeekEntryResult!12056)

(assert (=> b!1470413 (= e!825417 (MissingZero!12056 (index!50618 lt!642906)))))

(declare-fun b!1470414 () Bool)

(assert (=> b!1470414 (= e!825417 (seekKeyOrZeroReturnVacant!0 (x!132193 lt!642906) (index!50618 lt!642906) (index!50618 lt!642906) (select (arr!47816 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470415 () Bool)

(declare-fun c!135421 () Bool)

(declare-fun lt!642908 () (_ BitVec 64))

(assert (=> b!1470415 (= c!135421 (= lt!642908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825418 () SeekEntryResult!12056)

(assert (=> b!1470415 (= e!825418 e!825417)))

(declare-fun b!1470416 () Bool)

(declare-fun e!825419 () SeekEntryResult!12056)

(assert (=> b!1470416 (= e!825419 Undefined!12056)))

(declare-fun b!1470417 () Bool)

(assert (=> b!1470417 (= e!825418 (Found!12056 (index!50618 lt!642906)))))

(declare-fun d!155379 () Bool)

(declare-fun lt!642907 () SeekEntryResult!12056)

(assert (=> d!155379 (and (or (is-Undefined!12056 lt!642907) (not (is-Found!12056 lt!642907)) (and (bvsge (index!50617 lt!642907) #b00000000000000000000000000000000) (bvslt (index!50617 lt!642907) (size!48366 a!2862)))) (or (is-Undefined!12056 lt!642907) (is-Found!12056 lt!642907) (not (is-MissingZero!12056 lt!642907)) (and (bvsge (index!50616 lt!642907) #b00000000000000000000000000000000) (bvslt (index!50616 lt!642907) (size!48366 a!2862)))) (or (is-Undefined!12056 lt!642907) (is-Found!12056 lt!642907) (is-MissingZero!12056 lt!642907) (not (is-MissingVacant!12056 lt!642907)) (and (bvsge (index!50619 lt!642907) #b00000000000000000000000000000000) (bvslt (index!50619 lt!642907) (size!48366 a!2862)))) (or (is-Undefined!12056 lt!642907) (ite (is-Found!12056 lt!642907) (= (select (arr!47816 a!2862) (index!50617 lt!642907)) (select (arr!47816 a!2862) j!93)) (ite (is-MissingZero!12056 lt!642907) (= (select (arr!47816 a!2862) (index!50616 lt!642907)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12056 lt!642907) (= (select (arr!47816 a!2862) (index!50619 lt!642907)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155379 (= lt!642907 e!825419)))

(declare-fun c!135419 () Bool)

(assert (=> d!155379 (= c!135419 (and (is-Intermediate!12056 lt!642906) (undefined!12868 lt!642906)))))

(assert (=> d!155379 (= lt!642906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) (select (arr!47816 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155379 (validMask!0 mask!2687)))

(assert (=> d!155379 (= (seekEntryOrOpen!0 (select (arr!47816 a!2862) j!93) a!2862 mask!2687) lt!642907)))

(declare-fun b!1470418 () Bool)

(assert (=> b!1470418 (= e!825419 e!825418)))

(assert (=> b!1470418 (= lt!642908 (select (arr!47816 a!2862) (index!50618 lt!642906)))))

(declare-fun c!135420 () Bool)

(assert (=> b!1470418 (= c!135420 (= lt!642908 (select (arr!47816 a!2862) j!93)))))

(assert (= (and d!155379 c!135419) b!1470416))

(assert (= (and d!155379 (not c!135419)) b!1470418))

(assert (= (and b!1470418 c!135420) b!1470417))

(assert (= (and b!1470418 (not c!135420)) b!1470415))

(assert (= (and b!1470415 c!135421) b!1470413))

(assert (= (and b!1470415 (not c!135421)) b!1470414))

(assert (=> b!1470414 m!1357173))

(declare-fun m!1357461 () Bool)

(assert (=> b!1470414 m!1357461))

(assert (=> d!155379 m!1357173))

(assert (=> d!155379 m!1357175))

(declare-fun m!1357463 () Bool)

(assert (=> d!155379 m!1357463))

(declare-fun m!1357465 () Bool)

(assert (=> d!155379 m!1357465))

(declare-fun m!1357467 () Bool)

(assert (=> d!155379 m!1357467))

(assert (=> d!155379 m!1357175))

(assert (=> d!155379 m!1357173))

(assert (=> d!155379 m!1357177))

(assert (=> d!155379 m!1357161))

(declare-fun m!1357469 () Bool)

(assert (=> b!1470418 m!1357469))

(assert (=> b!1470029 d!155379))

(declare-fun bm!67713 () Bool)

(declare-fun call!67716 () Bool)

(assert (=> bm!67713 (= call!67716 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1470420 () Bool)

(declare-fun e!825422 () Bool)

(assert (=> b!1470420 (= e!825422 call!67716)))

(declare-fun b!1470419 () Bool)

(declare-fun e!825421 () Bool)

(assert (=> b!1470419 (= e!825421 call!67716)))

(declare-fun d!155381 () Bool)

(declare-fun res!998599 () Bool)

(declare-fun e!825420 () Bool)

(assert (=> d!155381 (=> res!998599 e!825420)))

(assert (=> d!155381 (= res!998599 (bvsge j!93 (size!48366 a!2862)))))

(assert (=> d!155381 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825420)))

(declare-fun b!1470421 () Bool)

(assert (=> b!1470421 (= e!825420 e!825421)))

(declare-fun c!135422 () Bool)

(assert (=> b!1470421 (= c!135422 (validKeyInArray!0 (select (arr!47816 a!2862) j!93)))))

(declare-fun b!1470422 () Bool)

(assert (=> b!1470422 (= e!825421 e!825422)))

(declare-fun lt!642911 () (_ BitVec 64))

(assert (=> b!1470422 (= lt!642911 (select (arr!47816 a!2862) j!93))))

(declare-fun lt!642909 () Unit!49452)

(assert (=> b!1470422 (= lt!642909 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642911 j!93))))

(assert (=> b!1470422 (arrayContainsKey!0 a!2862 lt!642911 #b00000000000000000000000000000000)))

(declare-fun lt!642910 () Unit!49452)

(assert (=> b!1470422 (= lt!642910 lt!642909)))

(declare-fun res!998598 () Bool)

(assert (=> b!1470422 (= res!998598 (= (seekEntryOrOpen!0 (select (arr!47816 a!2862) j!93) a!2862 mask!2687) (Found!12056 j!93)))))

(assert (=> b!1470422 (=> (not res!998598) (not e!825422))))

(assert (= (and d!155381 (not res!998599)) b!1470421))

(assert (= (and b!1470421 c!135422) b!1470422))

(assert (= (and b!1470421 (not c!135422)) b!1470419))

(assert (= (and b!1470422 res!998598) b!1470420))

(assert (= (or b!1470420 b!1470419) bm!67713))

(declare-fun m!1357471 () Bool)

(assert (=> bm!67713 m!1357471))

(assert (=> b!1470421 m!1357173))

(assert (=> b!1470421 m!1357173))

(assert (=> b!1470421 m!1357183))

(assert (=> b!1470422 m!1357173))

(declare-fun m!1357473 () Bool)

(assert (=> b!1470422 m!1357473))

(declare-fun m!1357475 () Bool)

(assert (=> b!1470422 m!1357475))

(assert (=> b!1470422 m!1357173))

(assert (=> b!1470422 m!1357191))

(assert (=> b!1470029 d!155381))

(declare-fun d!155383 () Bool)

(assert (=> d!155383 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642914 () Unit!49452)

(declare-fun choose!38 (array!99056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49452)

(assert (=> d!155383 (= lt!642914 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155383 (validMask!0 mask!2687)))

(assert (=> d!155383 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!642914)))

(declare-fun bs!42493 () Bool)

(assert (= bs!42493 d!155383))

(assert (=> bs!42493 m!1357193))

(declare-fun m!1357477 () Bool)

(assert (=> bs!42493 m!1357477))

(assert (=> bs!42493 m!1357161))

(assert (=> b!1470029 d!155383))

(declare-fun b!1470423 () Bool)

(declare-fun lt!642916 () SeekEntryResult!12056)

(assert (=> b!1470423 (and (bvsge (index!50618 lt!642916) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642916) (size!48366 lt!642753)))))

(declare-fun res!998600 () Bool)

(assert (=> b!1470423 (= res!998600 (= (select (arr!47816 lt!642753) (index!50618 lt!642916)) lt!642754))))

(declare-fun e!825424 () Bool)

(assert (=> b!1470423 (=> res!998600 e!825424)))

(declare-fun e!825426 () Bool)

(assert (=> b!1470423 (= e!825426 e!825424)))

(declare-fun b!1470424 () Bool)

(declare-fun e!825427 () SeekEntryResult!12056)

(assert (=> b!1470424 (= e!825427 (Intermediate!12056 true index!646 x!665))))

(declare-fun b!1470425 () Bool)

(declare-fun e!825425 () SeekEntryResult!12056)

(assert (=> b!1470425 (= e!825425 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!642754 lt!642753 mask!2687))))

(declare-fun b!1470426 () Bool)

(assert (=> b!1470426 (= e!825427 e!825425)))

(declare-fun c!135425 () Bool)

(declare-fun lt!642915 () (_ BitVec 64))

(assert (=> b!1470426 (= c!135425 (or (= lt!642915 lt!642754) (= (bvadd lt!642915 lt!642915) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155385 () Bool)

(declare-fun e!825423 () Bool)

(assert (=> d!155385 e!825423))

(declare-fun c!135424 () Bool)

(assert (=> d!155385 (= c!135424 (and (is-Intermediate!12056 lt!642916) (undefined!12868 lt!642916)))))

(assert (=> d!155385 (= lt!642916 e!825427)))

(declare-fun c!135423 () Bool)

(assert (=> d!155385 (= c!135423 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155385 (= lt!642915 (select (arr!47816 lt!642753) index!646))))

(assert (=> d!155385 (validMask!0 mask!2687)))

(assert (=> d!155385 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642754 lt!642753 mask!2687) lt!642916)))

(declare-fun b!1470427 () Bool)

(assert (=> b!1470427 (= e!825425 (Intermediate!12056 false index!646 x!665))))

(declare-fun b!1470428 () Bool)

(assert (=> b!1470428 (and (bvsge (index!50618 lt!642916) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642916) (size!48366 lt!642753)))))

(declare-fun res!998601 () Bool)

(assert (=> b!1470428 (= res!998601 (= (select (arr!47816 lt!642753) (index!50618 lt!642916)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470428 (=> res!998601 e!825424)))

(declare-fun b!1470429 () Bool)

(assert (=> b!1470429 (= e!825423 e!825426)))

(declare-fun res!998602 () Bool)

(assert (=> b!1470429 (= res!998602 (and (is-Intermediate!12056 lt!642916) (not (undefined!12868 lt!642916)) (bvslt (x!132193 lt!642916) #b01111111111111111111111111111110) (bvsge (x!132193 lt!642916) #b00000000000000000000000000000000) (bvsge (x!132193 lt!642916) x!665)))))

(assert (=> b!1470429 (=> (not res!998602) (not e!825426))))

(declare-fun b!1470430 () Bool)

(assert (=> b!1470430 (= e!825423 (bvsge (x!132193 lt!642916) #b01111111111111111111111111111110))))

(declare-fun b!1470431 () Bool)

(assert (=> b!1470431 (and (bvsge (index!50618 lt!642916) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642916) (size!48366 lt!642753)))))

(assert (=> b!1470431 (= e!825424 (= (select (arr!47816 lt!642753) (index!50618 lt!642916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155385 c!135423) b!1470424))

(assert (= (and d!155385 (not c!135423)) b!1470426))

(assert (= (and b!1470426 c!135425) b!1470427))

(assert (= (and b!1470426 (not c!135425)) b!1470425))

(assert (= (and d!155385 c!135424) b!1470430))

(assert (= (and d!155385 (not c!135424)) b!1470429))

(assert (= (and b!1470429 res!998602) b!1470423))

(assert (= (and b!1470423 (not res!998600)) b!1470428))

(assert (= (and b!1470428 (not res!998601)) b!1470431))

(declare-fun m!1357479 () Bool)

(assert (=> b!1470423 m!1357479))

(assert (=> b!1470425 m!1357433))

(assert (=> b!1470425 m!1357433))

(declare-fun m!1357481 () Bool)

(assert (=> b!1470425 m!1357481))

(assert (=> b!1470428 m!1357479))

(assert (=> b!1470431 m!1357479))

(assert (=> d!155385 m!1357441))

(assert (=> d!155385 m!1357161))

(assert (=> b!1470030 d!155385))

(declare-fun b!1470432 () Bool)

(declare-fun lt!642918 () SeekEntryResult!12056)

(assert (=> b!1470432 (and (bvsge (index!50618 lt!642918) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642918) (size!48366 a!2862)))))

(declare-fun res!998603 () Bool)

(assert (=> b!1470432 (= res!998603 (= (select (arr!47816 a!2862) (index!50618 lt!642918)) (select (arr!47816 a!2862) j!93)))))

(declare-fun e!825429 () Bool)

(assert (=> b!1470432 (=> res!998603 e!825429)))

(declare-fun e!825431 () Bool)

(assert (=> b!1470432 (= e!825431 e!825429)))

(declare-fun b!1470433 () Bool)

(declare-fun e!825432 () SeekEntryResult!12056)

(assert (=> b!1470433 (= e!825432 (Intermediate!12056 true (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun e!825430 () SeekEntryResult!12056)

(declare-fun b!1470434 () Bool)

(assert (=> b!1470434 (= e!825430 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47816 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470435 () Bool)

(assert (=> b!1470435 (= e!825432 e!825430)))

(declare-fun lt!642917 () (_ BitVec 64))

(declare-fun c!135428 () Bool)

(assert (=> b!1470435 (= c!135428 (or (= lt!642917 (select (arr!47816 a!2862) j!93)) (= (bvadd lt!642917 lt!642917) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155387 () Bool)

(declare-fun e!825428 () Bool)

(assert (=> d!155387 e!825428))

(declare-fun c!135427 () Bool)

(assert (=> d!155387 (= c!135427 (and (is-Intermediate!12056 lt!642918) (undefined!12868 lt!642918)))))

(assert (=> d!155387 (= lt!642918 e!825432)))

(declare-fun c!135426 () Bool)

(assert (=> d!155387 (= c!135426 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155387 (= lt!642917 (select (arr!47816 a!2862) (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687)))))

(assert (=> d!155387 (validMask!0 mask!2687)))

(assert (=> d!155387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) (select (arr!47816 a!2862) j!93) a!2862 mask!2687) lt!642918)))

(declare-fun b!1470436 () Bool)

(assert (=> b!1470436 (= e!825430 (Intermediate!12056 false (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1470437 () Bool)

(assert (=> b!1470437 (and (bvsge (index!50618 lt!642918) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642918) (size!48366 a!2862)))))

(declare-fun res!998604 () Bool)

(assert (=> b!1470437 (= res!998604 (= (select (arr!47816 a!2862) (index!50618 lt!642918)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470437 (=> res!998604 e!825429)))

(declare-fun b!1470438 () Bool)

(assert (=> b!1470438 (= e!825428 e!825431)))

(declare-fun res!998605 () Bool)

(assert (=> b!1470438 (= res!998605 (and (is-Intermediate!12056 lt!642918) (not (undefined!12868 lt!642918)) (bvslt (x!132193 lt!642918) #b01111111111111111111111111111110) (bvsge (x!132193 lt!642918) #b00000000000000000000000000000000) (bvsge (x!132193 lt!642918) #b00000000000000000000000000000000)))))

(assert (=> b!1470438 (=> (not res!998605) (not e!825431))))

(declare-fun b!1470439 () Bool)

(assert (=> b!1470439 (= e!825428 (bvsge (x!132193 lt!642918) #b01111111111111111111111111111110))))

(declare-fun b!1470440 () Bool)

(assert (=> b!1470440 (and (bvsge (index!50618 lt!642918) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642918) (size!48366 a!2862)))))

(assert (=> b!1470440 (= e!825429 (= (select (arr!47816 a!2862) (index!50618 lt!642918)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!155387 c!135426) b!1470433))

(assert (= (and d!155387 (not c!135426)) b!1470435))

(assert (= (and b!1470435 c!135428) b!1470436))

(assert (= (and b!1470435 (not c!135428)) b!1470434))

(assert (= (and d!155387 c!135427) b!1470439))

(assert (= (and d!155387 (not c!135427)) b!1470438))

(assert (= (and b!1470438 res!998605) b!1470432))

(assert (= (and b!1470432 (not res!998603)) b!1470437))

(assert (= (and b!1470437 (not res!998604)) b!1470440))

(declare-fun m!1357483 () Bool)

(assert (=> b!1470432 m!1357483))

(assert (=> b!1470434 m!1357175))

(declare-fun m!1357485 () Bool)

(assert (=> b!1470434 m!1357485))

(assert (=> b!1470434 m!1357485))

(assert (=> b!1470434 m!1357173))

(declare-fun m!1357487 () Bool)

(assert (=> b!1470434 m!1357487))

(assert (=> b!1470437 m!1357483))

(assert (=> b!1470440 m!1357483))

(assert (=> d!155387 m!1357175))

(declare-fun m!1357489 () Bool)

(assert (=> d!155387 m!1357489))

(assert (=> d!155387 m!1357161))

(assert (=> b!1470023 d!155387))

(declare-fun d!155389 () Bool)

(declare-fun lt!642920 () (_ BitVec 32))

(declare-fun lt!642919 () (_ BitVec 32))

(assert (=> d!155389 (= lt!642920 (bvmul (bvxor lt!642919 (bvlshr lt!642919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155389 (= lt!642919 ((_ extract 31 0) (bvand (bvxor (select (arr!47816 a!2862) j!93) (bvlshr (select (arr!47816 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155389 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!998547 (let ((h!35667 ((_ extract 31 0) (bvand (bvxor (select (arr!47816 a!2862) j!93) (bvlshr (select (arr!47816 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132200 (bvmul (bvxor h!35667 (bvlshr h!35667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132200 (bvlshr x!132200 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!998547 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!998547 #b00000000000000000000000000000000))))))

(assert (=> d!155389 (= (toIndex!0 (select (arr!47816 a!2862) j!93) mask!2687) (bvand (bvxor lt!642920 (bvlshr lt!642920 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470023 d!155389))

(declare-fun d!155391 () Bool)

(assert (=> d!155391 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125608 d!155391))

(declare-fun d!155393 () Bool)

(assert (=> d!155393 (= (array_inv!36844 a!2862) (bvsge (size!48366 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125608 d!155393))

(declare-fun b!1470459 () Bool)

(declare-fun lt!642926 () SeekEntryResult!12056)

(assert (=> b!1470459 (and (bvsge (index!50618 lt!642926) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642926) (size!48366 a!2862)))))

(declare-fun res!998612 () Bool)

(assert (=> b!1470459 (= res!998612 (= (select (arr!47816 a!2862) (index!50618 lt!642926)) (select (arr!47816 a!2862) j!93)))))

(declare-fun e!825444 () Bool)

(assert (=> b!1470459 (=> res!998612 e!825444)))

(declare-fun e!825446 () Bool)

(assert (=> b!1470459 (= e!825446 e!825444)))

(declare-fun b!1470460 () Bool)

(declare-fun e!825447 () SeekEntryResult!12056)

(assert (=> b!1470460 (= e!825447 (Intermediate!12056 true index!646 x!665))))

(declare-fun e!825445 () SeekEntryResult!12056)

(declare-fun b!1470461 () Bool)

(assert (=> b!1470461 (= e!825445 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47816 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470462 () Bool)

(assert (=> b!1470462 (= e!825447 e!825445)))

(declare-fun lt!642925 () (_ BitVec 64))

(declare-fun c!135437 () Bool)

(assert (=> b!1470462 (= c!135437 (or (= lt!642925 (select (arr!47816 a!2862) j!93)) (= (bvadd lt!642925 lt!642925) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!155395 () Bool)

(declare-fun e!825443 () Bool)

(assert (=> d!155395 e!825443))

(declare-fun c!135436 () Bool)

(assert (=> d!155395 (= c!135436 (and (is-Intermediate!12056 lt!642926) (undefined!12868 lt!642926)))))

(assert (=> d!155395 (= lt!642926 e!825447)))

(declare-fun c!135435 () Bool)

(assert (=> d!155395 (= c!135435 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155395 (= lt!642925 (select (arr!47816 a!2862) index!646))))

(assert (=> d!155395 (validMask!0 mask!2687)))

(assert (=> d!155395 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47816 a!2862) j!93) a!2862 mask!2687) lt!642926)))

(declare-fun b!1470463 () Bool)

(assert (=> b!1470463 (= e!825445 (Intermediate!12056 false index!646 x!665))))

(declare-fun b!1470464 () Bool)

(assert (=> b!1470464 (and (bvsge (index!50618 lt!642926) #b00000000000000000000000000000000) (bvslt (index!50618 lt!642926) (size!48366 a!2862)))))

(declare-fun res!998613 () Bool)

(assert (=> b!1470464 (= res!998613 (= (select (arr!47816 a!2862) (index!50618 lt!642926)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470464 (=> res!998613 e!825444)))

