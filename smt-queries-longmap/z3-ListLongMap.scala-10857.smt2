; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127122 () Bool)

(assert start!127122)

(declare-fun b!1494309 () Bool)

(declare-fun res!1016704 () Bool)

(declare-fun e!837022 () Bool)

(assert (=> b!1494309 (=> (not res!1016704) (not e!837022))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99769 0))(
  ( (array!99770 (arr!48153 (Array (_ BitVec 32) (_ BitVec 64))) (size!48703 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99769)

(assert (=> b!1494309 (= res!1016704 (and (= (size!48703 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48703 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48703 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494310 () Bool)

(declare-fun res!1016697 () Bool)

(declare-fun e!837015 () Bool)

(assert (=> b!1494310 (=> (not res!1016697) (not e!837015))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12393 0))(
  ( (MissingZero!12393 (index!51964 (_ BitVec 32))) (Found!12393 (index!51965 (_ BitVec 32))) (Intermediate!12393 (undefined!13205 Bool) (index!51966 (_ BitVec 32)) (x!133561 (_ BitVec 32))) (Undefined!12393) (MissingVacant!12393 (index!51967 (_ BitVec 32))) )
))
(declare-fun lt!651316 () SeekEntryResult!12393)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99769 (_ BitVec 32)) SeekEntryResult!12393)

(assert (=> b!1494310 (= res!1016697 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651316))))

(declare-fun b!1494311 () Bool)

(declare-fun e!837020 () Bool)

(assert (=> b!1494311 (= e!837020 e!837015)))

(declare-fun res!1016713 () Bool)

(assert (=> b!1494311 (=> (not res!1016713) (not e!837015))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494311 (= res!1016713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651316))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494311 (= lt!651316 (Intermediate!12393 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494312 () Bool)

(declare-fun res!1016703 () Bool)

(declare-fun e!837016 () Bool)

(assert (=> b!1494312 (=> (not res!1016703) (not e!837016))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99769 (_ BitVec 32)) SeekEntryResult!12393)

(assert (=> b!1494312 (= res!1016703 (= (seekEntryOrOpen!0 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) (Found!12393 j!93)))))

(declare-fun b!1494313 () Bool)

(declare-fun res!1016708 () Bool)

(assert (=> b!1494313 (=> (not res!1016708) (not e!837022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494313 (= res!1016708 (validKeyInArray!0 (select (arr!48153 a!2862) j!93)))))

(declare-fun b!1494314 () Bool)

(declare-fun e!837021 () Bool)

(declare-fun e!837023 () Bool)

(assert (=> b!1494314 (= e!837021 e!837023)))

(declare-fun res!1016699 () Bool)

(assert (=> b!1494314 (=> res!1016699 e!837023)))

(declare-fun lt!651317 () (_ BitVec 32))

(assert (=> b!1494314 (= res!1016699 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651317 #b00000000000000000000000000000000) (bvsge lt!651317 (size!48703 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494314 (= lt!651317 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494315 () Bool)

(declare-fun lt!651315 () array!99769)

(declare-fun lt!651313 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!837018 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99769 (_ BitVec 32)) SeekEntryResult!12393)

(assert (=> b!1494315 (= e!837018 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651313 lt!651315 mask!2687) (seekEntryOrOpen!0 lt!651313 lt!651315 mask!2687)))))

(declare-fun b!1494316 () Bool)

(declare-fun res!1016709 () Bool)

(assert (=> b!1494316 (=> (not res!1016709) (not e!837022))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494316 (= res!1016709 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48703 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48703 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48703 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494317 () Bool)

(assert (=> b!1494317 (= e!837023 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651317 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651316))))

(declare-fun b!1494318 () Bool)

(declare-fun e!837017 () Bool)

(assert (=> b!1494318 (= e!837017 (not e!837021))))

(declare-fun res!1016701 () Bool)

(assert (=> b!1494318 (=> res!1016701 e!837021)))

(assert (=> b!1494318 (= res!1016701 (or (and (= (select (arr!48153 a!2862) index!646) (select (store (arr!48153 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48153 a!2862) index!646) (select (arr!48153 a!2862) j!93))) (= (select (arr!48153 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494318 e!837016))

(declare-fun res!1016707 () Bool)

(assert (=> b!1494318 (=> (not res!1016707) (not e!837016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99769 (_ BitVec 32)) Bool)

(assert (=> b!1494318 (= res!1016707 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50126 0))(
  ( (Unit!50127) )
))
(declare-fun lt!651314 () Unit!50126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50126)

(assert (=> b!1494318 (= lt!651314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494319 () Bool)

(declare-fun res!1016702 () Bool)

(assert (=> b!1494319 (=> (not res!1016702) (not e!837022))))

(assert (=> b!1494319 (= res!1016702 (validKeyInArray!0 (select (arr!48153 a!2862) i!1006)))))

(declare-fun lt!651318 () SeekEntryResult!12393)

(declare-fun b!1494320 () Bool)

(assert (=> b!1494320 (= e!837018 (= lt!651318 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651313 lt!651315 mask!2687)))))

(declare-fun b!1494321 () Bool)

(declare-fun res!1016710 () Bool)

(assert (=> b!1494321 (=> (not res!1016710) (not e!837022))))

(declare-datatypes ((List!34654 0))(
  ( (Nil!34651) (Cons!34650 (h!36039 (_ BitVec 64)) (t!49348 List!34654)) )
))
(declare-fun arrayNoDuplicates!0 (array!99769 (_ BitVec 32) List!34654) Bool)

(assert (=> b!1494321 (= res!1016710 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34651))))

(declare-fun b!1494322 () Bool)

(assert (=> b!1494322 (= e!837022 e!837020)))

(declare-fun res!1016700 () Bool)

(assert (=> b!1494322 (=> (not res!1016700) (not e!837020))))

(assert (=> b!1494322 (= res!1016700 (= (select (store (arr!48153 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494322 (= lt!651315 (array!99770 (store (arr!48153 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48703 a!2862)))))

(declare-fun b!1494323 () Bool)

(declare-fun res!1016705 () Bool)

(assert (=> b!1494323 (=> (not res!1016705) (not e!837017))))

(assert (=> b!1494323 (= res!1016705 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1016698 () Bool)

(assert (=> start!127122 (=> (not res!1016698) (not e!837022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127122 (= res!1016698 (validMask!0 mask!2687))))

(assert (=> start!127122 e!837022))

(assert (=> start!127122 true))

(declare-fun array_inv!37181 (array!99769) Bool)

(assert (=> start!127122 (array_inv!37181 a!2862)))

(declare-fun b!1494324 () Bool)

(assert (=> b!1494324 (= e!837015 e!837017)))

(declare-fun res!1016712 () Bool)

(assert (=> b!1494324 (=> (not res!1016712) (not e!837017))))

(assert (=> b!1494324 (= res!1016712 (= lt!651318 (Intermediate!12393 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1494324 (= lt!651318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651313 mask!2687) lt!651313 lt!651315 mask!2687))))

(assert (=> b!1494324 (= lt!651313 (select (store (arr!48153 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494325 () Bool)

(declare-fun res!1016706 () Bool)

(assert (=> b!1494325 (=> (not res!1016706) (not e!837022))))

(assert (=> b!1494325 (= res!1016706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494326 () Bool)

(declare-fun res!1016711 () Bool)

(assert (=> b!1494326 (=> (not res!1016711) (not e!837017))))

(assert (=> b!1494326 (= res!1016711 e!837018)))

(declare-fun c!138336 () Bool)

(assert (=> b!1494326 (= c!138336 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494327 () Bool)

(assert (=> b!1494327 (= e!837016 (or (= (select (arr!48153 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48153 a!2862) intermediateBeforeIndex!19) (select (arr!48153 a!2862) j!93))))))

(assert (= (and start!127122 res!1016698) b!1494309))

(assert (= (and b!1494309 res!1016704) b!1494319))

(assert (= (and b!1494319 res!1016702) b!1494313))

(assert (= (and b!1494313 res!1016708) b!1494325))

(assert (= (and b!1494325 res!1016706) b!1494321))

(assert (= (and b!1494321 res!1016710) b!1494316))

(assert (= (and b!1494316 res!1016709) b!1494322))

(assert (= (and b!1494322 res!1016700) b!1494311))

(assert (= (and b!1494311 res!1016713) b!1494310))

(assert (= (and b!1494310 res!1016697) b!1494324))

(assert (= (and b!1494324 res!1016712) b!1494326))

(assert (= (and b!1494326 c!138336) b!1494320))

(assert (= (and b!1494326 (not c!138336)) b!1494315))

(assert (= (and b!1494326 res!1016711) b!1494323))

(assert (= (and b!1494323 res!1016705) b!1494318))

(assert (= (and b!1494318 res!1016707) b!1494312))

(assert (= (and b!1494312 res!1016703) b!1494327))

(assert (= (and b!1494318 (not res!1016701)) b!1494314))

(assert (= (and b!1494314 (not res!1016699)) b!1494317))

(declare-fun m!1378057 () Bool)

(assert (=> b!1494318 m!1378057))

(declare-fun m!1378059 () Bool)

(assert (=> b!1494318 m!1378059))

(declare-fun m!1378061 () Bool)

(assert (=> b!1494318 m!1378061))

(declare-fun m!1378063 () Bool)

(assert (=> b!1494318 m!1378063))

(declare-fun m!1378065 () Bool)

(assert (=> b!1494318 m!1378065))

(declare-fun m!1378067 () Bool)

(assert (=> b!1494318 m!1378067))

(declare-fun m!1378069 () Bool)

(assert (=> b!1494324 m!1378069))

(assert (=> b!1494324 m!1378069))

(declare-fun m!1378071 () Bool)

(assert (=> b!1494324 m!1378071))

(assert (=> b!1494324 m!1378059))

(declare-fun m!1378073 () Bool)

(assert (=> b!1494324 m!1378073))

(declare-fun m!1378075 () Bool)

(assert (=> b!1494319 m!1378075))

(assert (=> b!1494319 m!1378075))

(declare-fun m!1378077 () Bool)

(assert (=> b!1494319 m!1378077))

(declare-fun m!1378079 () Bool)

(assert (=> b!1494314 m!1378079))

(assert (=> b!1494310 m!1378067))

(assert (=> b!1494310 m!1378067))

(declare-fun m!1378081 () Bool)

(assert (=> b!1494310 m!1378081))

(assert (=> b!1494313 m!1378067))

(assert (=> b!1494313 m!1378067))

(declare-fun m!1378083 () Bool)

(assert (=> b!1494313 m!1378083))

(assert (=> b!1494317 m!1378067))

(assert (=> b!1494317 m!1378067))

(declare-fun m!1378085 () Bool)

(assert (=> b!1494317 m!1378085))

(assert (=> b!1494312 m!1378067))

(assert (=> b!1494312 m!1378067))

(declare-fun m!1378087 () Bool)

(assert (=> b!1494312 m!1378087))

(declare-fun m!1378089 () Bool)

(assert (=> b!1494327 m!1378089))

(assert (=> b!1494327 m!1378067))

(declare-fun m!1378091 () Bool)

(assert (=> b!1494315 m!1378091))

(declare-fun m!1378093 () Bool)

(assert (=> b!1494315 m!1378093))

(assert (=> b!1494311 m!1378067))

(assert (=> b!1494311 m!1378067))

(declare-fun m!1378095 () Bool)

(assert (=> b!1494311 m!1378095))

(assert (=> b!1494311 m!1378095))

(assert (=> b!1494311 m!1378067))

(declare-fun m!1378097 () Bool)

(assert (=> b!1494311 m!1378097))

(assert (=> b!1494322 m!1378059))

(declare-fun m!1378099 () Bool)

(assert (=> b!1494322 m!1378099))

(declare-fun m!1378101 () Bool)

(assert (=> start!127122 m!1378101))

(declare-fun m!1378103 () Bool)

(assert (=> start!127122 m!1378103))

(declare-fun m!1378105 () Bool)

(assert (=> b!1494321 m!1378105))

(declare-fun m!1378107 () Bool)

(assert (=> b!1494320 m!1378107))

(declare-fun m!1378109 () Bool)

(assert (=> b!1494325 m!1378109))

(check-sat (not b!1494317) (not b!1494312) (not b!1494311) (not b!1494314) (not b!1494310) (not b!1494315) (not b!1494313) (not b!1494325) (not b!1494318) (not b!1494319) (not b!1494324) (not start!127122) (not b!1494320) (not b!1494321))
(check-sat)
(get-model)

(declare-fun b!1494403 () Bool)

(declare-fun lt!651342 () SeekEntryResult!12393)

(assert (=> b!1494403 (and (bvsge (index!51966 lt!651342) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651342) (size!48703 a!2862)))))

(declare-fun res!1016773 () Bool)

(assert (=> b!1494403 (= res!1016773 (= (select (arr!48153 a!2862) (index!51966 lt!651342)) (select (arr!48153 a!2862) j!93)))))

(declare-fun e!837065 () Bool)

(assert (=> b!1494403 (=> res!1016773 e!837065)))

(declare-fun e!837064 () Bool)

(assert (=> b!1494403 (= e!837064 e!837065)))

(declare-fun b!1494404 () Bool)

(assert (=> b!1494404 (and (bvsge (index!51966 lt!651342) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651342) (size!48703 a!2862)))))

(assert (=> b!1494404 (= e!837065 (= (select (arr!48153 a!2862) (index!51966 lt!651342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494405 () Bool)

(declare-fun e!837063 () SeekEntryResult!12393)

(assert (=> b!1494405 (= e!837063 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!651317 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48153 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494407 () Bool)

(assert (=> b!1494407 (and (bvsge (index!51966 lt!651342) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651342) (size!48703 a!2862)))))

(declare-fun res!1016771 () Bool)

(assert (=> b!1494407 (= res!1016771 (= (select (arr!48153 a!2862) (index!51966 lt!651342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494407 (=> res!1016771 e!837065)))

(declare-fun b!1494408 () Bool)

(declare-fun e!837061 () SeekEntryResult!12393)

(assert (=> b!1494408 (= e!837061 e!837063)))

(declare-fun lt!651341 () (_ BitVec 64))

(declare-fun c!138347 () Bool)

(assert (=> b!1494408 (= c!138347 (or (= lt!651341 (select (arr!48153 a!2862) j!93)) (= (bvadd lt!651341 lt!651341) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494409 () Bool)

(declare-fun e!837062 () Bool)

(assert (=> b!1494409 (= e!837062 (bvsge (x!133561 lt!651342) #b01111111111111111111111111111110))))

(declare-fun b!1494410 () Bool)

(assert (=> b!1494410 (= e!837063 (Intermediate!12393 false lt!651317 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1494411 () Bool)

(assert (=> b!1494411 (= e!837062 e!837064)))

(declare-fun res!1016772 () Bool)

(get-info :version)

(assert (=> b!1494411 (= res!1016772 (and ((_ is Intermediate!12393) lt!651342) (not (undefined!13205 lt!651342)) (bvslt (x!133561 lt!651342) #b01111111111111111111111111111110) (bvsge (x!133561 lt!651342) #b00000000000000000000000000000000) (bvsge (x!133561 lt!651342) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1494411 (=> (not res!1016772) (not e!837064))))

(declare-fun b!1494406 () Bool)

(assert (=> b!1494406 (= e!837061 (Intermediate!12393 true lt!651317 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun d!157059 () Bool)

(assert (=> d!157059 e!837062))

(declare-fun c!138348 () Bool)

(assert (=> d!157059 (= c!138348 (and ((_ is Intermediate!12393) lt!651342) (undefined!13205 lt!651342)))))

(assert (=> d!157059 (= lt!651342 e!837061)))

(declare-fun c!138346 () Bool)

(assert (=> d!157059 (= c!138346 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!157059 (= lt!651341 (select (arr!48153 a!2862) lt!651317))))

(assert (=> d!157059 (validMask!0 mask!2687)))

(assert (=> d!157059 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651317 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651342)))

(assert (= (and d!157059 c!138346) b!1494406))

(assert (= (and d!157059 (not c!138346)) b!1494408))

(assert (= (and b!1494408 c!138347) b!1494410))

(assert (= (and b!1494408 (not c!138347)) b!1494405))

(assert (= (and d!157059 c!138348) b!1494409))

(assert (= (and d!157059 (not c!138348)) b!1494411))

(assert (= (and b!1494411 res!1016772) b!1494403))

(assert (= (and b!1494403 (not res!1016773)) b!1494407))

(assert (= (and b!1494407 (not res!1016771)) b!1494404))

(declare-fun m!1378165 () Bool)

(assert (=> b!1494407 m!1378165))

(assert (=> b!1494404 m!1378165))

(declare-fun m!1378167 () Bool)

(assert (=> b!1494405 m!1378167))

(assert (=> b!1494405 m!1378167))

(assert (=> b!1494405 m!1378067))

(declare-fun m!1378169 () Bool)

(assert (=> b!1494405 m!1378169))

(assert (=> b!1494403 m!1378165))

(declare-fun m!1378171 () Bool)

(assert (=> d!157059 m!1378171))

(assert (=> d!157059 m!1378101))

(assert (=> b!1494317 d!157059))

(declare-fun d!157061 () Bool)

(assert (=> d!157061 (= (validKeyInArray!0 (select (arr!48153 a!2862) j!93)) (and (not (= (select (arr!48153 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48153 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494313 d!157061))

(declare-fun b!1494412 () Bool)

(declare-fun lt!651344 () SeekEntryResult!12393)

(assert (=> b!1494412 (and (bvsge (index!51966 lt!651344) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651344) (size!48703 lt!651315)))))

(declare-fun res!1016776 () Bool)

(assert (=> b!1494412 (= res!1016776 (= (select (arr!48153 lt!651315) (index!51966 lt!651344)) lt!651313))))

(declare-fun e!837070 () Bool)

(assert (=> b!1494412 (=> res!1016776 e!837070)))

(declare-fun e!837069 () Bool)

(assert (=> b!1494412 (= e!837069 e!837070)))

(declare-fun b!1494413 () Bool)

(assert (=> b!1494413 (and (bvsge (index!51966 lt!651344) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651344) (size!48703 lt!651315)))))

(assert (=> b!1494413 (= e!837070 (= (select (arr!48153 lt!651315) (index!51966 lt!651344)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!837068 () SeekEntryResult!12393)

(declare-fun b!1494414 () Bool)

(assert (=> b!1494414 (= e!837068 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!651313 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!651313 lt!651315 mask!2687))))

(declare-fun b!1494416 () Bool)

(assert (=> b!1494416 (and (bvsge (index!51966 lt!651344) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651344) (size!48703 lt!651315)))))

(declare-fun res!1016774 () Bool)

(assert (=> b!1494416 (= res!1016774 (= (select (arr!48153 lt!651315) (index!51966 lt!651344)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494416 (=> res!1016774 e!837070)))

(declare-fun b!1494417 () Bool)

(declare-fun e!837066 () SeekEntryResult!12393)

(assert (=> b!1494417 (= e!837066 e!837068)))

(declare-fun c!138350 () Bool)

(declare-fun lt!651343 () (_ BitVec 64))

(assert (=> b!1494417 (= c!138350 (or (= lt!651343 lt!651313) (= (bvadd lt!651343 lt!651343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494418 () Bool)

(declare-fun e!837067 () Bool)

(assert (=> b!1494418 (= e!837067 (bvsge (x!133561 lt!651344) #b01111111111111111111111111111110))))

(declare-fun b!1494419 () Bool)

(assert (=> b!1494419 (= e!837068 (Intermediate!12393 false (toIndex!0 lt!651313 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494420 () Bool)

(assert (=> b!1494420 (= e!837067 e!837069)))

(declare-fun res!1016775 () Bool)

(assert (=> b!1494420 (= res!1016775 (and ((_ is Intermediate!12393) lt!651344) (not (undefined!13205 lt!651344)) (bvslt (x!133561 lt!651344) #b01111111111111111111111111111110) (bvsge (x!133561 lt!651344) #b00000000000000000000000000000000) (bvsge (x!133561 lt!651344) #b00000000000000000000000000000000)))))

(assert (=> b!1494420 (=> (not res!1016775) (not e!837069))))

(declare-fun b!1494415 () Bool)

(assert (=> b!1494415 (= e!837066 (Intermediate!12393 true (toIndex!0 lt!651313 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157063 () Bool)

(assert (=> d!157063 e!837067))

(declare-fun c!138351 () Bool)

(assert (=> d!157063 (= c!138351 (and ((_ is Intermediate!12393) lt!651344) (undefined!13205 lt!651344)))))

(assert (=> d!157063 (= lt!651344 e!837066)))

(declare-fun c!138349 () Bool)

(assert (=> d!157063 (= c!138349 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157063 (= lt!651343 (select (arr!48153 lt!651315) (toIndex!0 lt!651313 mask!2687)))))

(assert (=> d!157063 (validMask!0 mask!2687)))

(assert (=> d!157063 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651313 mask!2687) lt!651313 lt!651315 mask!2687) lt!651344)))

(assert (= (and d!157063 c!138349) b!1494415))

(assert (= (and d!157063 (not c!138349)) b!1494417))

(assert (= (and b!1494417 c!138350) b!1494419))

(assert (= (and b!1494417 (not c!138350)) b!1494414))

(assert (= (and d!157063 c!138351) b!1494418))

(assert (= (and d!157063 (not c!138351)) b!1494420))

(assert (= (and b!1494420 res!1016775) b!1494412))

(assert (= (and b!1494412 (not res!1016776)) b!1494416))

(assert (= (and b!1494416 (not res!1016774)) b!1494413))

(declare-fun m!1378173 () Bool)

(assert (=> b!1494416 m!1378173))

(assert (=> b!1494413 m!1378173))

(assert (=> b!1494414 m!1378069))

(declare-fun m!1378175 () Bool)

(assert (=> b!1494414 m!1378175))

(assert (=> b!1494414 m!1378175))

(declare-fun m!1378177 () Bool)

(assert (=> b!1494414 m!1378177))

(assert (=> b!1494412 m!1378173))

(assert (=> d!157063 m!1378069))

(declare-fun m!1378179 () Bool)

(assert (=> d!157063 m!1378179))

(assert (=> d!157063 m!1378101))

(assert (=> b!1494324 d!157063))

(declare-fun d!157065 () Bool)

(declare-fun lt!651350 () (_ BitVec 32))

(declare-fun lt!651349 () (_ BitVec 32))

(assert (=> d!157065 (= lt!651350 (bvmul (bvxor lt!651349 (bvlshr lt!651349 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157065 (= lt!651349 ((_ extract 31 0) (bvand (bvxor lt!651313 (bvlshr lt!651313 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157065 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016777 (let ((h!36041 ((_ extract 31 0) (bvand (bvxor lt!651313 (bvlshr lt!651313 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133564 (bvmul (bvxor h!36041 (bvlshr h!36041 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133564 (bvlshr x!133564 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016777 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016777 #b00000000000000000000000000000000))))))

(assert (=> d!157065 (= (toIndex!0 lt!651313 mask!2687) (bvand (bvxor lt!651350 (bvlshr lt!651350 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494324 d!157065))

(declare-fun d!157067 () Bool)

(declare-fun lt!651353 () (_ BitVec 32))

(assert (=> d!157067 (and (bvsge lt!651353 #b00000000000000000000000000000000) (bvslt lt!651353 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!157067 (= lt!651353 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!157067 (validMask!0 mask!2687)))

(assert (=> d!157067 (= (nextIndex!0 index!646 x!665 mask!2687) lt!651353)))

(declare-fun bs!42899 () Bool)

(assert (= bs!42899 d!157067))

(declare-fun m!1378181 () Bool)

(assert (=> bs!42899 m!1378181))

(assert (=> bs!42899 m!1378101))

(assert (=> b!1494314 d!157067))

(declare-fun b!1494429 () Bool)

(declare-fun e!837079 () Bool)

(declare-fun e!837078 () Bool)

(assert (=> b!1494429 (= e!837079 e!837078)))

(declare-fun lt!651360 () (_ BitVec 64))

(assert (=> b!1494429 (= lt!651360 (select (arr!48153 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!651362 () Unit!50126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99769 (_ BitVec 64) (_ BitVec 32)) Unit!50126)

(assert (=> b!1494429 (= lt!651362 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651360 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1494429 (arrayContainsKey!0 a!2862 lt!651360 #b00000000000000000000000000000000)))

(declare-fun lt!651361 () Unit!50126)

(assert (=> b!1494429 (= lt!651361 lt!651362)))

(declare-fun res!1016782 () Bool)

(assert (=> b!1494429 (= res!1016782 (= (seekEntryOrOpen!0 (select (arr!48153 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12393 #b00000000000000000000000000000000)))))

(assert (=> b!1494429 (=> (not res!1016782) (not e!837078))))

(declare-fun bm!67978 () Bool)

(declare-fun call!67981 () Bool)

(assert (=> bm!67978 (= call!67981 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494430 () Bool)

(assert (=> b!1494430 (= e!837079 call!67981)))

(declare-fun d!157069 () Bool)

(declare-fun res!1016783 () Bool)

(declare-fun e!837077 () Bool)

(assert (=> d!157069 (=> res!1016783 e!837077)))

(assert (=> d!157069 (= res!1016783 (bvsge #b00000000000000000000000000000000 (size!48703 a!2862)))))

(assert (=> d!157069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!837077)))

(declare-fun b!1494431 () Bool)

(assert (=> b!1494431 (= e!837078 call!67981)))

(declare-fun b!1494432 () Bool)

(assert (=> b!1494432 (= e!837077 e!837079)))

(declare-fun c!138354 () Bool)

(assert (=> b!1494432 (= c!138354 (validKeyInArray!0 (select (arr!48153 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!157069 (not res!1016783)) b!1494432))

(assert (= (and b!1494432 c!138354) b!1494429))

(assert (= (and b!1494432 (not c!138354)) b!1494430))

(assert (= (and b!1494429 res!1016782) b!1494431))

(assert (= (or b!1494431 b!1494430) bm!67978))

(declare-fun m!1378183 () Bool)

(assert (=> b!1494429 m!1378183))

(declare-fun m!1378185 () Bool)

(assert (=> b!1494429 m!1378185))

(declare-fun m!1378187 () Bool)

(assert (=> b!1494429 m!1378187))

(assert (=> b!1494429 m!1378183))

(declare-fun m!1378189 () Bool)

(assert (=> b!1494429 m!1378189))

(declare-fun m!1378191 () Bool)

(assert (=> bm!67978 m!1378191))

(assert (=> b!1494432 m!1378183))

(assert (=> b!1494432 m!1378183))

(declare-fun m!1378193 () Bool)

(assert (=> b!1494432 m!1378193))

(assert (=> b!1494325 d!157069))

(declare-fun b!1494457 () Bool)

(declare-fun e!837093 () SeekEntryResult!12393)

(declare-fun e!837094 () SeekEntryResult!12393)

(assert (=> b!1494457 (= e!837093 e!837094)))

(declare-fun c!138364 () Bool)

(declare-fun lt!651377 () (_ BitVec 64))

(assert (=> b!1494457 (= c!138364 (= lt!651377 lt!651313))))

(declare-fun b!1494458 () Bool)

(declare-fun e!837096 () SeekEntryResult!12393)

(assert (=> b!1494458 (= e!837096 (MissingVacant!12393 intermediateAfterIndex!19))))

(declare-fun b!1494459 () Bool)

(assert (=> b!1494459 (= e!837094 (Found!12393 index!646))))

(declare-fun b!1494460 () Bool)

(assert (=> b!1494460 (= e!837096 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!651313 lt!651315 mask!2687))))

(declare-fun b!1494461 () Bool)

(assert (=> b!1494461 (= e!837093 Undefined!12393)))

(declare-fun b!1494462 () Bool)

(declare-fun c!138367 () Bool)

(assert (=> b!1494462 (= c!138367 (= lt!651377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494462 (= e!837094 e!837096)))

(declare-fun lt!651378 () SeekEntryResult!12393)

(declare-fun d!157071 () Bool)

(assert (=> d!157071 (and (or ((_ is Undefined!12393) lt!651378) (not ((_ is Found!12393) lt!651378)) (and (bvsge (index!51965 lt!651378) #b00000000000000000000000000000000) (bvslt (index!51965 lt!651378) (size!48703 lt!651315)))) (or ((_ is Undefined!12393) lt!651378) ((_ is Found!12393) lt!651378) (not ((_ is MissingVacant!12393) lt!651378)) (not (= (index!51967 lt!651378) intermediateAfterIndex!19)) (and (bvsge (index!51967 lt!651378) #b00000000000000000000000000000000) (bvslt (index!51967 lt!651378) (size!48703 lt!651315)))) (or ((_ is Undefined!12393) lt!651378) (ite ((_ is Found!12393) lt!651378) (= (select (arr!48153 lt!651315) (index!51965 lt!651378)) lt!651313) (and ((_ is MissingVacant!12393) lt!651378) (= (index!51967 lt!651378) intermediateAfterIndex!19) (= (select (arr!48153 lt!651315) (index!51967 lt!651378)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!157071 (= lt!651378 e!837093)))

(declare-fun c!138365 () Bool)

(assert (=> d!157071 (= c!138365 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157071 (= lt!651377 (select (arr!48153 lt!651315) index!646))))

(assert (=> d!157071 (validMask!0 mask!2687)))

(assert (=> d!157071 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651313 lt!651315 mask!2687) lt!651378)))

(assert (= (and d!157071 c!138365) b!1494461))

(assert (= (and d!157071 (not c!138365)) b!1494457))

(assert (= (and b!1494457 c!138364) b!1494459))

(assert (= (and b!1494457 (not c!138364)) b!1494462))

(assert (= (and b!1494462 c!138367) b!1494458))

(assert (= (and b!1494462 (not c!138367)) b!1494460))

(assert (=> b!1494460 m!1378079))

(assert (=> b!1494460 m!1378079))

(declare-fun m!1378195 () Bool)

(assert (=> b!1494460 m!1378195))

(declare-fun m!1378197 () Bool)

(assert (=> d!157071 m!1378197))

(declare-fun m!1378199 () Bool)

(assert (=> d!157071 m!1378199))

(declare-fun m!1378201 () Bool)

(assert (=> d!157071 m!1378201))

(assert (=> d!157071 m!1378101))

(assert (=> b!1494315 d!157071))

(declare-fun b!1494523 () Bool)

(declare-fun e!837129 () SeekEntryResult!12393)

(declare-fun lt!651402 () SeekEntryResult!12393)

(assert (=> b!1494523 (= e!837129 (Found!12393 (index!51966 lt!651402)))))

(declare-fun b!1494524 () Bool)

(declare-fun e!837131 () SeekEntryResult!12393)

(assert (=> b!1494524 (= e!837131 Undefined!12393)))

(declare-fun b!1494525 () Bool)

(assert (=> b!1494525 (= e!837131 e!837129)))

(declare-fun lt!651400 () (_ BitVec 64))

(assert (=> b!1494525 (= lt!651400 (select (arr!48153 lt!651315) (index!51966 lt!651402)))))

(declare-fun c!138395 () Bool)

(assert (=> b!1494525 (= c!138395 (= lt!651400 lt!651313))))

(declare-fun e!837130 () SeekEntryResult!12393)

(declare-fun b!1494526 () Bool)

(assert (=> b!1494526 (= e!837130 (seekKeyOrZeroReturnVacant!0 (x!133561 lt!651402) (index!51966 lt!651402) (index!51966 lt!651402) lt!651313 lt!651315 mask!2687))))

(declare-fun b!1494527 () Bool)

(declare-fun c!138396 () Bool)

(assert (=> b!1494527 (= c!138396 (= lt!651400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494527 (= e!837129 e!837130)))

(declare-fun d!157077 () Bool)

(declare-fun lt!651401 () SeekEntryResult!12393)

(assert (=> d!157077 (and (or ((_ is Undefined!12393) lt!651401) (not ((_ is Found!12393) lt!651401)) (and (bvsge (index!51965 lt!651401) #b00000000000000000000000000000000) (bvslt (index!51965 lt!651401) (size!48703 lt!651315)))) (or ((_ is Undefined!12393) lt!651401) ((_ is Found!12393) lt!651401) (not ((_ is MissingZero!12393) lt!651401)) (and (bvsge (index!51964 lt!651401) #b00000000000000000000000000000000) (bvslt (index!51964 lt!651401) (size!48703 lt!651315)))) (or ((_ is Undefined!12393) lt!651401) ((_ is Found!12393) lt!651401) ((_ is MissingZero!12393) lt!651401) (not ((_ is MissingVacant!12393) lt!651401)) (and (bvsge (index!51967 lt!651401) #b00000000000000000000000000000000) (bvslt (index!51967 lt!651401) (size!48703 lt!651315)))) (or ((_ is Undefined!12393) lt!651401) (ite ((_ is Found!12393) lt!651401) (= (select (arr!48153 lt!651315) (index!51965 lt!651401)) lt!651313) (ite ((_ is MissingZero!12393) lt!651401) (= (select (arr!48153 lt!651315) (index!51964 lt!651401)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12393) lt!651401) (= (select (arr!48153 lt!651315) (index!51967 lt!651401)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157077 (= lt!651401 e!837131)))

(declare-fun c!138394 () Bool)

(assert (=> d!157077 (= c!138394 (and ((_ is Intermediate!12393) lt!651402) (undefined!13205 lt!651402)))))

(assert (=> d!157077 (= lt!651402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651313 mask!2687) lt!651313 lt!651315 mask!2687))))

(assert (=> d!157077 (validMask!0 mask!2687)))

(assert (=> d!157077 (= (seekEntryOrOpen!0 lt!651313 lt!651315 mask!2687) lt!651401)))

(declare-fun b!1494528 () Bool)

(assert (=> b!1494528 (= e!837130 (MissingZero!12393 (index!51966 lt!651402)))))

(assert (= (and d!157077 c!138394) b!1494524))

(assert (= (and d!157077 (not c!138394)) b!1494525))

(assert (= (and b!1494525 c!138395) b!1494523))

(assert (= (and b!1494525 (not c!138395)) b!1494527))

(assert (= (and b!1494527 c!138396) b!1494528))

(assert (= (and b!1494527 (not c!138396)) b!1494526))

(declare-fun m!1378223 () Bool)

(assert (=> b!1494525 m!1378223))

(declare-fun m!1378225 () Bool)

(assert (=> b!1494526 m!1378225))

(declare-fun m!1378227 () Bool)

(assert (=> d!157077 m!1378227))

(assert (=> d!157077 m!1378101))

(assert (=> d!157077 m!1378069))

(assert (=> d!157077 m!1378069))

(assert (=> d!157077 m!1378071))

(declare-fun m!1378229 () Bool)

(assert (=> d!157077 m!1378229))

(declare-fun m!1378231 () Bool)

(assert (=> d!157077 m!1378231))

(assert (=> b!1494315 d!157077))

(declare-fun b!1494529 () Bool)

(declare-fun lt!651404 () SeekEntryResult!12393)

(assert (=> b!1494529 (and (bvsge (index!51966 lt!651404) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651404) (size!48703 a!2862)))))

(declare-fun res!1016798 () Bool)

(assert (=> b!1494529 (= res!1016798 (= (select (arr!48153 a!2862) (index!51966 lt!651404)) (select (arr!48153 a!2862) j!93)))))

(declare-fun e!837136 () Bool)

(assert (=> b!1494529 (=> res!1016798 e!837136)))

(declare-fun e!837135 () Bool)

(assert (=> b!1494529 (= e!837135 e!837136)))

(declare-fun b!1494530 () Bool)

(assert (=> b!1494530 (and (bvsge (index!51966 lt!651404) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651404) (size!48703 a!2862)))))

(assert (=> b!1494530 (= e!837136 (= (select (arr!48153 a!2862) (index!51966 lt!651404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494531 () Bool)

(declare-fun e!837134 () SeekEntryResult!12393)

(assert (=> b!1494531 (= e!837134 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48153 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494533 () Bool)

(assert (=> b!1494533 (and (bvsge (index!51966 lt!651404) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651404) (size!48703 a!2862)))))

(declare-fun res!1016796 () Bool)

(assert (=> b!1494533 (= res!1016796 (= (select (arr!48153 a!2862) (index!51966 lt!651404)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494533 (=> res!1016796 e!837136)))

(declare-fun b!1494534 () Bool)

(declare-fun e!837132 () SeekEntryResult!12393)

(assert (=> b!1494534 (= e!837132 e!837134)))

(declare-fun lt!651403 () (_ BitVec 64))

(declare-fun c!138398 () Bool)

(assert (=> b!1494534 (= c!138398 (or (= lt!651403 (select (arr!48153 a!2862) j!93)) (= (bvadd lt!651403 lt!651403) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494535 () Bool)

(declare-fun e!837133 () Bool)

(assert (=> b!1494535 (= e!837133 (bvsge (x!133561 lt!651404) #b01111111111111111111111111111110))))

(declare-fun b!1494536 () Bool)

(assert (=> b!1494536 (= e!837134 (Intermediate!12393 false index!646 x!665))))

(declare-fun b!1494537 () Bool)

(assert (=> b!1494537 (= e!837133 e!837135)))

(declare-fun res!1016797 () Bool)

(assert (=> b!1494537 (= res!1016797 (and ((_ is Intermediate!12393) lt!651404) (not (undefined!13205 lt!651404)) (bvslt (x!133561 lt!651404) #b01111111111111111111111111111110) (bvsge (x!133561 lt!651404) #b00000000000000000000000000000000) (bvsge (x!133561 lt!651404) x!665)))))

(assert (=> b!1494537 (=> (not res!1016797) (not e!837135))))

(declare-fun b!1494532 () Bool)

(assert (=> b!1494532 (= e!837132 (Intermediate!12393 true index!646 x!665))))

(declare-fun d!157083 () Bool)

(assert (=> d!157083 e!837133))

(declare-fun c!138399 () Bool)

(assert (=> d!157083 (= c!138399 (and ((_ is Intermediate!12393) lt!651404) (undefined!13205 lt!651404)))))

(assert (=> d!157083 (= lt!651404 e!837132)))

(declare-fun c!138397 () Bool)

(assert (=> d!157083 (= c!138397 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157083 (= lt!651403 (select (arr!48153 a!2862) index!646))))

(assert (=> d!157083 (validMask!0 mask!2687)))

(assert (=> d!157083 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651404)))

(assert (= (and d!157083 c!138397) b!1494532))

(assert (= (and d!157083 (not c!138397)) b!1494534))

(assert (= (and b!1494534 c!138398) b!1494536))

(assert (= (and b!1494534 (not c!138398)) b!1494531))

(assert (= (and d!157083 c!138399) b!1494535))

(assert (= (and d!157083 (not c!138399)) b!1494537))

(assert (= (and b!1494537 res!1016797) b!1494529))

(assert (= (and b!1494529 (not res!1016798)) b!1494533))

(assert (= (and b!1494533 (not res!1016796)) b!1494530))

(declare-fun m!1378233 () Bool)

(assert (=> b!1494533 m!1378233))

(assert (=> b!1494530 m!1378233))

(assert (=> b!1494531 m!1378079))

(assert (=> b!1494531 m!1378079))

(assert (=> b!1494531 m!1378067))

(declare-fun m!1378235 () Bool)

(assert (=> b!1494531 m!1378235))

(assert (=> b!1494529 m!1378233))

(assert (=> d!157083 m!1378063))

(assert (=> d!157083 m!1378101))

(assert (=> b!1494310 d!157083))

(declare-fun b!1494578 () Bool)

(declare-fun e!837161 () Bool)

(declare-fun e!837163 () Bool)

(assert (=> b!1494578 (= e!837161 e!837163)))

(declare-fun c!138414 () Bool)

(assert (=> b!1494578 (= c!138414 (validKeyInArray!0 (select (arr!48153 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494579 () Bool)

(declare-fun call!67987 () Bool)

(assert (=> b!1494579 (= e!837163 call!67987)))

(declare-fun b!1494580 () Bool)

(assert (=> b!1494580 (= e!837163 call!67987)))

(declare-fun b!1494581 () Bool)

(declare-fun e!837164 () Bool)

(declare-fun contains!9930 (List!34654 (_ BitVec 64)) Bool)

(assert (=> b!1494581 (= e!837164 (contains!9930 Nil!34651 (select (arr!48153 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1494582 () Bool)

(declare-fun e!837162 () Bool)

(assert (=> b!1494582 (= e!837162 e!837161)))

(declare-fun res!1016813 () Bool)

(assert (=> b!1494582 (=> (not res!1016813) (not e!837161))))

(assert (=> b!1494582 (= res!1016813 (not e!837164))))

(declare-fun res!1016812 () Bool)

(assert (=> b!1494582 (=> (not res!1016812) (not e!837164))))

(assert (=> b!1494582 (= res!1016812 (validKeyInArray!0 (select (arr!48153 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!157085 () Bool)

(declare-fun res!1016814 () Bool)

(assert (=> d!157085 (=> res!1016814 e!837162)))

(assert (=> d!157085 (= res!1016814 (bvsge #b00000000000000000000000000000000 (size!48703 a!2862)))))

(assert (=> d!157085 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34651) e!837162)))

(declare-fun bm!67984 () Bool)

(assert (=> bm!67984 (= call!67987 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!138414 (Cons!34650 (select (arr!48153 a!2862) #b00000000000000000000000000000000) Nil!34651) Nil!34651)))))

(assert (= (and d!157085 (not res!1016814)) b!1494582))

(assert (= (and b!1494582 res!1016812) b!1494581))

(assert (= (and b!1494582 res!1016813) b!1494578))

(assert (= (and b!1494578 c!138414) b!1494580))

(assert (= (and b!1494578 (not c!138414)) b!1494579))

(assert (= (or b!1494580 b!1494579) bm!67984))

(assert (=> b!1494578 m!1378183))

(assert (=> b!1494578 m!1378183))

(assert (=> b!1494578 m!1378193))

(assert (=> b!1494581 m!1378183))

(assert (=> b!1494581 m!1378183))

(declare-fun m!1378269 () Bool)

(assert (=> b!1494581 m!1378269))

(assert (=> b!1494582 m!1378183))

(assert (=> b!1494582 m!1378183))

(assert (=> b!1494582 m!1378193))

(assert (=> bm!67984 m!1378183))

(declare-fun m!1378271 () Bool)

(assert (=> bm!67984 m!1378271))

(assert (=> b!1494321 d!157085))

(declare-fun b!1494583 () Bool)

(declare-fun lt!651420 () SeekEntryResult!12393)

(assert (=> b!1494583 (and (bvsge (index!51966 lt!651420) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651420) (size!48703 a!2862)))))

(declare-fun res!1016817 () Bool)

(assert (=> b!1494583 (= res!1016817 (= (select (arr!48153 a!2862) (index!51966 lt!651420)) (select (arr!48153 a!2862) j!93)))))

(declare-fun e!837169 () Bool)

(assert (=> b!1494583 (=> res!1016817 e!837169)))

(declare-fun e!837168 () Bool)

(assert (=> b!1494583 (= e!837168 e!837169)))

(declare-fun b!1494584 () Bool)

(assert (=> b!1494584 (and (bvsge (index!51966 lt!651420) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651420) (size!48703 a!2862)))))

(assert (=> b!1494584 (= e!837169 (= (select (arr!48153 a!2862) (index!51966 lt!651420)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494585 () Bool)

(declare-fun e!837167 () SeekEntryResult!12393)

(assert (=> b!1494585 (= e!837167 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48153 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494587 () Bool)

(assert (=> b!1494587 (and (bvsge (index!51966 lt!651420) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651420) (size!48703 a!2862)))))

(declare-fun res!1016815 () Bool)

(assert (=> b!1494587 (= res!1016815 (= (select (arr!48153 a!2862) (index!51966 lt!651420)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494587 (=> res!1016815 e!837169)))

(declare-fun b!1494588 () Bool)

(declare-fun e!837165 () SeekEntryResult!12393)

(assert (=> b!1494588 (= e!837165 e!837167)))

(declare-fun lt!651419 () (_ BitVec 64))

(declare-fun c!138416 () Bool)

(assert (=> b!1494588 (= c!138416 (or (= lt!651419 (select (arr!48153 a!2862) j!93)) (= (bvadd lt!651419 lt!651419) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494589 () Bool)

(declare-fun e!837166 () Bool)

(assert (=> b!1494589 (= e!837166 (bvsge (x!133561 lt!651420) #b01111111111111111111111111111110))))

(declare-fun b!1494590 () Bool)

(assert (=> b!1494590 (= e!837167 (Intermediate!12393 false (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1494591 () Bool)

(assert (=> b!1494591 (= e!837166 e!837168)))

(declare-fun res!1016816 () Bool)

(assert (=> b!1494591 (= res!1016816 (and ((_ is Intermediate!12393) lt!651420) (not (undefined!13205 lt!651420)) (bvslt (x!133561 lt!651420) #b01111111111111111111111111111110) (bvsge (x!133561 lt!651420) #b00000000000000000000000000000000) (bvsge (x!133561 lt!651420) #b00000000000000000000000000000000)))))

(assert (=> b!1494591 (=> (not res!1016816) (not e!837168))))

(declare-fun b!1494586 () Bool)

(assert (=> b!1494586 (= e!837165 (Intermediate!12393 true (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!157095 () Bool)

(assert (=> d!157095 e!837166))

(declare-fun c!138417 () Bool)

(assert (=> d!157095 (= c!138417 (and ((_ is Intermediate!12393) lt!651420) (undefined!13205 lt!651420)))))

(assert (=> d!157095 (= lt!651420 e!837165)))

(declare-fun c!138415 () Bool)

(assert (=> d!157095 (= c!138415 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!157095 (= lt!651419 (select (arr!48153 a!2862) (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687)))))

(assert (=> d!157095 (validMask!0 mask!2687)))

(assert (=> d!157095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651420)))

(assert (= (and d!157095 c!138415) b!1494586))

(assert (= (and d!157095 (not c!138415)) b!1494588))

(assert (= (and b!1494588 c!138416) b!1494590))

(assert (= (and b!1494588 (not c!138416)) b!1494585))

(assert (= (and d!157095 c!138417) b!1494589))

(assert (= (and d!157095 (not c!138417)) b!1494591))

(assert (= (and b!1494591 res!1016816) b!1494583))

(assert (= (and b!1494583 (not res!1016817)) b!1494587))

(assert (= (and b!1494587 (not res!1016815)) b!1494584))

(declare-fun m!1378273 () Bool)

(assert (=> b!1494587 m!1378273))

(assert (=> b!1494584 m!1378273))

(assert (=> b!1494585 m!1378095))

(declare-fun m!1378275 () Bool)

(assert (=> b!1494585 m!1378275))

(assert (=> b!1494585 m!1378275))

(assert (=> b!1494585 m!1378067))

(declare-fun m!1378277 () Bool)

(assert (=> b!1494585 m!1378277))

(assert (=> b!1494583 m!1378273))

(assert (=> d!157095 m!1378095))

(declare-fun m!1378279 () Bool)

(assert (=> d!157095 m!1378279))

(assert (=> d!157095 m!1378101))

(assert (=> b!1494311 d!157095))

(declare-fun d!157099 () Bool)

(declare-fun lt!651424 () (_ BitVec 32))

(declare-fun lt!651423 () (_ BitVec 32))

(assert (=> d!157099 (= lt!651424 (bvmul (bvxor lt!651423 (bvlshr lt!651423 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157099 (= lt!651423 ((_ extract 31 0) (bvand (bvxor (select (arr!48153 a!2862) j!93) (bvlshr (select (arr!48153 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157099 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1016777 (let ((h!36041 ((_ extract 31 0) (bvand (bvxor (select (arr!48153 a!2862) j!93) (bvlshr (select (arr!48153 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133564 (bvmul (bvxor h!36041 (bvlshr h!36041 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133564 (bvlshr x!133564 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1016777 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1016777 #b00000000000000000000000000000000))))))

(assert (=> d!157099 (= (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) (bvand (bvxor lt!651424 (bvlshr lt!651424 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1494311 d!157099))

(declare-fun b!1494592 () Bool)

(declare-fun e!837170 () SeekEntryResult!12393)

(declare-fun lt!651427 () SeekEntryResult!12393)

(assert (=> b!1494592 (= e!837170 (Found!12393 (index!51966 lt!651427)))))

(declare-fun b!1494593 () Bool)

(declare-fun e!837172 () SeekEntryResult!12393)

(assert (=> b!1494593 (= e!837172 Undefined!12393)))

(declare-fun b!1494594 () Bool)

(assert (=> b!1494594 (= e!837172 e!837170)))

(declare-fun lt!651425 () (_ BitVec 64))

(assert (=> b!1494594 (= lt!651425 (select (arr!48153 a!2862) (index!51966 lt!651427)))))

(declare-fun c!138419 () Bool)

(assert (=> b!1494594 (= c!138419 (= lt!651425 (select (arr!48153 a!2862) j!93)))))

(declare-fun b!1494595 () Bool)

(declare-fun e!837171 () SeekEntryResult!12393)

(assert (=> b!1494595 (= e!837171 (seekKeyOrZeroReturnVacant!0 (x!133561 lt!651427) (index!51966 lt!651427) (index!51966 lt!651427) (select (arr!48153 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494596 () Bool)

(declare-fun c!138420 () Bool)

(assert (=> b!1494596 (= c!138420 (= lt!651425 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494596 (= e!837170 e!837171)))

(declare-fun d!157101 () Bool)

(declare-fun lt!651426 () SeekEntryResult!12393)

(assert (=> d!157101 (and (or ((_ is Undefined!12393) lt!651426) (not ((_ is Found!12393) lt!651426)) (and (bvsge (index!51965 lt!651426) #b00000000000000000000000000000000) (bvslt (index!51965 lt!651426) (size!48703 a!2862)))) (or ((_ is Undefined!12393) lt!651426) ((_ is Found!12393) lt!651426) (not ((_ is MissingZero!12393) lt!651426)) (and (bvsge (index!51964 lt!651426) #b00000000000000000000000000000000) (bvslt (index!51964 lt!651426) (size!48703 a!2862)))) (or ((_ is Undefined!12393) lt!651426) ((_ is Found!12393) lt!651426) ((_ is MissingZero!12393) lt!651426) (not ((_ is MissingVacant!12393) lt!651426)) (and (bvsge (index!51967 lt!651426) #b00000000000000000000000000000000) (bvslt (index!51967 lt!651426) (size!48703 a!2862)))) (or ((_ is Undefined!12393) lt!651426) (ite ((_ is Found!12393) lt!651426) (= (select (arr!48153 a!2862) (index!51965 lt!651426)) (select (arr!48153 a!2862) j!93)) (ite ((_ is MissingZero!12393) lt!651426) (= (select (arr!48153 a!2862) (index!51964 lt!651426)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12393) lt!651426) (= (select (arr!48153 a!2862) (index!51967 lt!651426)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!157101 (= lt!651426 e!837172)))

(declare-fun c!138418 () Bool)

(assert (=> d!157101 (= c!138418 (and ((_ is Intermediate!12393) lt!651427) (undefined!13205 lt!651427)))))

(assert (=> d!157101 (= lt!651427 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48153 a!2862) j!93) mask!2687) (select (arr!48153 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!157101 (validMask!0 mask!2687)))

(assert (=> d!157101 (= (seekEntryOrOpen!0 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) lt!651426)))

(declare-fun b!1494597 () Bool)

(assert (=> b!1494597 (= e!837171 (MissingZero!12393 (index!51966 lt!651427)))))

(assert (= (and d!157101 c!138418) b!1494593))

(assert (= (and d!157101 (not c!138418)) b!1494594))

(assert (= (and b!1494594 c!138419) b!1494592))

(assert (= (and b!1494594 (not c!138419)) b!1494596))

(assert (= (and b!1494596 c!138420) b!1494597))

(assert (= (and b!1494596 (not c!138420)) b!1494595))

(declare-fun m!1378281 () Bool)

(assert (=> b!1494594 m!1378281))

(assert (=> b!1494595 m!1378067))

(declare-fun m!1378283 () Bool)

(assert (=> b!1494595 m!1378283))

(declare-fun m!1378285 () Bool)

(assert (=> d!157101 m!1378285))

(assert (=> d!157101 m!1378101))

(assert (=> d!157101 m!1378067))

(assert (=> d!157101 m!1378095))

(assert (=> d!157101 m!1378095))

(assert (=> d!157101 m!1378067))

(assert (=> d!157101 m!1378097))

(declare-fun m!1378287 () Bool)

(assert (=> d!157101 m!1378287))

(declare-fun m!1378289 () Bool)

(assert (=> d!157101 m!1378289))

(assert (=> b!1494312 d!157101))

(declare-fun b!1494598 () Bool)

(declare-fun e!837175 () Bool)

(declare-fun e!837174 () Bool)

(assert (=> b!1494598 (= e!837175 e!837174)))

(declare-fun lt!651428 () (_ BitVec 64))

(assert (=> b!1494598 (= lt!651428 (select (arr!48153 a!2862) j!93))))

(declare-fun lt!651430 () Unit!50126)

(assert (=> b!1494598 (= lt!651430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!651428 j!93))))

(assert (=> b!1494598 (arrayContainsKey!0 a!2862 lt!651428 #b00000000000000000000000000000000)))

(declare-fun lt!651429 () Unit!50126)

(assert (=> b!1494598 (= lt!651429 lt!651430)))

(declare-fun res!1016818 () Bool)

(assert (=> b!1494598 (= res!1016818 (= (seekEntryOrOpen!0 (select (arr!48153 a!2862) j!93) a!2862 mask!2687) (Found!12393 j!93)))))

(assert (=> b!1494598 (=> (not res!1016818) (not e!837174))))

(declare-fun call!67988 () Bool)

(declare-fun bm!67985 () Bool)

(assert (=> bm!67985 (= call!67988 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1494599 () Bool)

(assert (=> b!1494599 (= e!837175 call!67988)))

(declare-fun d!157103 () Bool)

(declare-fun res!1016819 () Bool)

(declare-fun e!837173 () Bool)

(assert (=> d!157103 (=> res!1016819 e!837173)))

(assert (=> d!157103 (= res!1016819 (bvsge j!93 (size!48703 a!2862)))))

(assert (=> d!157103 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!837173)))

(declare-fun b!1494600 () Bool)

(assert (=> b!1494600 (= e!837174 call!67988)))

(declare-fun b!1494601 () Bool)

(assert (=> b!1494601 (= e!837173 e!837175)))

(declare-fun c!138421 () Bool)

(assert (=> b!1494601 (= c!138421 (validKeyInArray!0 (select (arr!48153 a!2862) j!93)))))

(assert (= (and d!157103 (not res!1016819)) b!1494601))

(assert (= (and b!1494601 c!138421) b!1494598))

(assert (= (and b!1494601 (not c!138421)) b!1494599))

(assert (= (and b!1494598 res!1016818) b!1494600))

(assert (= (or b!1494600 b!1494599) bm!67985))

(assert (=> b!1494598 m!1378067))

(declare-fun m!1378291 () Bool)

(assert (=> b!1494598 m!1378291))

(declare-fun m!1378293 () Bool)

(assert (=> b!1494598 m!1378293))

(assert (=> b!1494598 m!1378067))

(assert (=> b!1494598 m!1378087))

(declare-fun m!1378295 () Bool)

(assert (=> bm!67985 m!1378295))

(assert (=> b!1494601 m!1378067))

(assert (=> b!1494601 m!1378067))

(assert (=> b!1494601 m!1378083))

(assert (=> b!1494318 d!157103))

(declare-fun d!157105 () Bool)

(assert (=> d!157105 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!651433 () Unit!50126)

(declare-fun choose!38 (array!99769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50126)

(assert (=> d!157105 (= lt!651433 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!157105 (validMask!0 mask!2687)))

(assert (=> d!157105 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!651433)))

(declare-fun bs!42900 () Bool)

(assert (= bs!42900 d!157105))

(assert (=> bs!42900 m!1378065))

(declare-fun m!1378297 () Bool)

(assert (=> bs!42900 m!1378297))

(assert (=> bs!42900 m!1378101))

(assert (=> b!1494318 d!157105))

(declare-fun d!157107 () Bool)

(assert (=> d!157107 (= (validKeyInArray!0 (select (arr!48153 a!2862) i!1006)) (and (not (= (select (arr!48153 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48153 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1494319 d!157107))

(declare-fun d!157109 () Bool)

(assert (=> d!157109 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!127122 d!157109))

(declare-fun d!157115 () Bool)

(assert (=> d!157115 (= (array_inv!37181 a!2862) (bvsge (size!48703 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!127122 d!157115))

(declare-fun b!1494650 () Bool)

(declare-fun lt!651449 () SeekEntryResult!12393)

(assert (=> b!1494650 (and (bvsge (index!51966 lt!651449) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651449) (size!48703 lt!651315)))))

(declare-fun res!1016834 () Bool)

(assert (=> b!1494650 (= res!1016834 (= (select (arr!48153 lt!651315) (index!51966 lt!651449)) lt!651313))))

(declare-fun e!837206 () Bool)

(assert (=> b!1494650 (=> res!1016834 e!837206)))

(declare-fun e!837205 () Bool)

(assert (=> b!1494650 (= e!837205 e!837206)))

(declare-fun b!1494651 () Bool)

(assert (=> b!1494651 (and (bvsge (index!51966 lt!651449) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651449) (size!48703 lt!651315)))))

(assert (=> b!1494651 (= e!837206 (= (select (arr!48153 lt!651315) (index!51966 lt!651449)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1494652 () Bool)

(declare-fun e!837204 () SeekEntryResult!12393)

(assert (=> b!1494652 (= e!837204 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!651313 lt!651315 mask!2687))))

(declare-fun b!1494654 () Bool)

(assert (=> b!1494654 (and (bvsge (index!51966 lt!651449) #b00000000000000000000000000000000) (bvslt (index!51966 lt!651449) (size!48703 lt!651315)))))

(declare-fun res!1016832 () Bool)

(assert (=> b!1494654 (= res!1016832 (= (select (arr!48153 lt!651315) (index!51966 lt!651449)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494654 (=> res!1016832 e!837206)))

(declare-fun b!1494655 () Bool)

(declare-fun e!837202 () SeekEntryResult!12393)

(assert (=> b!1494655 (= e!837202 e!837204)))

(declare-fun c!138441 () Bool)

(declare-fun lt!651448 () (_ BitVec 64))

(assert (=> b!1494655 (= c!138441 (or (= lt!651448 lt!651313) (= (bvadd lt!651448 lt!651448) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1494656 () Bool)

(declare-fun e!837203 () Bool)

(assert (=> b!1494656 (= e!837203 (bvsge (x!133561 lt!651449) #b01111111111111111111111111111110))))

(declare-fun b!1494657 () Bool)

(assert (=> b!1494657 (= e!837204 (Intermediate!12393 false index!646 x!665))))

(declare-fun b!1494658 () Bool)

(assert (=> b!1494658 (= e!837203 e!837205)))

(declare-fun res!1016833 () Bool)

(assert (=> b!1494658 (= res!1016833 (and ((_ is Intermediate!12393) lt!651449) (not (undefined!13205 lt!651449)) (bvslt (x!133561 lt!651449) #b01111111111111111111111111111110) (bvsge (x!133561 lt!651449) #b00000000000000000000000000000000) (bvsge (x!133561 lt!651449) x!665)))))

(assert (=> b!1494658 (=> (not res!1016833) (not e!837205))))

(declare-fun b!1494653 () Bool)

(assert (=> b!1494653 (= e!837202 (Intermediate!12393 true index!646 x!665))))

(declare-fun d!157117 () Bool)

(assert (=> d!157117 e!837203))

(declare-fun c!138442 () Bool)

(assert (=> d!157117 (= c!138442 (and ((_ is Intermediate!12393) lt!651449) (undefined!13205 lt!651449)))))

(assert (=> d!157117 (= lt!651449 e!837202)))

(declare-fun c!138440 () Bool)

(assert (=> d!157117 (= c!138440 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!157117 (= lt!651448 (select (arr!48153 lt!651315) index!646))))

(assert (=> d!157117 (validMask!0 mask!2687)))

(assert (=> d!157117 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651313 lt!651315 mask!2687) lt!651449)))

(assert (= (and d!157117 c!138440) b!1494653))

(assert (= (and d!157117 (not c!138440)) b!1494655))

(assert (= (and b!1494655 c!138441) b!1494657))

(assert (= (and b!1494655 (not c!138441)) b!1494652))

(assert (= (and d!157117 c!138442) b!1494656))

(assert (= (and d!157117 (not c!138442)) b!1494658))

(assert (= (and b!1494658 res!1016833) b!1494650))

(assert (= (and b!1494650 (not res!1016834)) b!1494654))

(assert (= (and b!1494654 (not res!1016832)) b!1494651))

(declare-fun m!1378311 () Bool)

(assert (=> b!1494654 m!1378311))

(assert (=> b!1494651 m!1378311))

(assert (=> b!1494652 m!1378079))

(assert (=> b!1494652 m!1378079))

(declare-fun m!1378313 () Bool)

(assert (=> b!1494652 m!1378313))

(assert (=> b!1494650 m!1378311))

(assert (=> d!157117 m!1378201))

(assert (=> d!157117 m!1378101))

(assert (=> b!1494320 d!157117))

(check-sat (not b!1494582) (not d!157071) (not d!157077) (not bm!67984) (not b!1494598) (not bm!67978) (not b!1494585) (not d!157105) (not b!1494405) (not d!157083) (not b!1494601) (not b!1494581) (not d!157059) (not b!1494460) (not d!157095) (not d!157063) (not b!1494429) (not d!157101) (not b!1494578) (not b!1494595) (not d!157117) (not b!1494526) (not bm!67985) (not b!1494531) (not b!1494414) (not b!1494432) (not b!1494652) (not d!157067))
(check-sat)
