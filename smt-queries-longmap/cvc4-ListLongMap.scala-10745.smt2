; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125612 () Bool)

(assert start!125612)

(declare-fun b!1470112 () Bool)

(declare-fun res!998510 () Bool)

(declare-fun e!825240 () Bool)

(assert (=> b!1470112 (=> (not res!998510) (not e!825240))))

(declare-datatypes ((array!99060 0))(
  ( (array!99061 (arr!47818 (Array (_ BitVec 32) (_ BitVec 64))) (size!48368 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99060)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99060 (_ BitVec 32)) Bool)

(assert (=> b!1470112 (= res!998510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470113 () Bool)

(declare-fun res!998517 () Bool)

(declare-fun e!825241 () Bool)

(assert (=> b!1470113 (=> (not res!998517) (not e!825241))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470113 (= res!998517 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470114 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12058 0))(
  ( (MissingZero!12058 (index!50624 (_ BitVec 32))) (Found!12058 (index!50625 (_ BitVec 32))) (Intermediate!12058 (undefined!12870 Bool) (index!50626 (_ BitVec 32)) (x!132195 (_ BitVec 32))) (Undefined!12058) (MissingVacant!12058 (index!50627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99060 (_ BitVec 32)) SeekEntryResult!12058)

(assert (=> b!1470114 (= e!825241 (not (= (seekEntryOrOpen!0 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) (Found!12058 j!93))))))

(assert (=> b!1470114 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49456 0))(
  ( (Unit!49457) )
))
(declare-fun lt!642784 () Unit!49456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49456)

(assert (=> b!1470114 (= lt!642784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!642785 () (_ BitVec 64))

(declare-fun e!825242 () Bool)

(declare-fun lt!642782 () array!99060)

(declare-fun b!1470115 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99060 (_ BitVec 32)) SeekEntryResult!12058)

(assert (=> b!1470115 (= e!825242 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642785 lt!642782 mask!2687) (seekEntryOrOpen!0 lt!642785 lt!642782 mask!2687)))))

(declare-fun b!1470116 () Bool)

(declare-fun res!998513 () Bool)

(assert (=> b!1470116 (=> (not res!998513) (not e!825240))))

(assert (=> b!1470116 (= res!998513 (and (= (size!48368 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48368 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48368 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!998521 () Bool)

(assert (=> start!125612 (=> (not res!998521) (not e!825240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125612 (= res!998521 (validMask!0 mask!2687))))

(assert (=> start!125612 e!825240))

(assert (=> start!125612 true))

(declare-fun array_inv!36846 (array!99060) Bool)

(assert (=> start!125612 (array_inv!36846 a!2862)))

(declare-fun b!1470117 () Bool)

(declare-fun e!825243 () Bool)

(assert (=> b!1470117 (= e!825243 e!825241)))

(declare-fun res!998514 () Bool)

(assert (=> b!1470117 (=> (not res!998514) (not e!825241))))

(declare-fun lt!642786 () SeekEntryResult!12058)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470117 (= res!998514 (= lt!642786 (Intermediate!12058 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99060 (_ BitVec 32)) SeekEntryResult!12058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470117 (= lt!642786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642785 mask!2687) lt!642785 lt!642782 mask!2687))))

(assert (=> b!1470117 (= lt!642785 (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470118 () Bool)

(declare-fun e!825245 () Bool)

(assert (=> b!1470118 (= e!825240 e!825245)))

(declare-fun res!998511 () Bool)

(assert (=> b!1470118 (=> (not res!998511) (not e!825245))))

(assert (=> b!1470118 (= res!998511 (= (select (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470118 (= lt!642782 (array!99061 (store (arr!47818 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48368 a!2862)))))

(declare-fun b!1470119 () Bool)

(declare-fun res!998512 () Bool)

(assert (=> b!1470119 (=> (not res!998512) (not e!825241))))

(assert (=> b!1470119 (= res!998512 e!825242)))

(declare-fun c!135312 () Bool)

(assert (=> b!1470119 (= c!135312 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1470120 () Bool)

(declare-fun res!998520 () Bool)

(assert (=> b!1470120 (=> (not res!998520) (not e!825240))))

(declare-datatypes ((List!34319 0))(
  ( (Nil!34316) (Cons!34315 (h!35665 (_ BitVec 64)) (t!49013 List!34319)) )
))
(declare-fun arrayNoDuplicates!0 (array!99060 (_ BitVec 32) List!34319) Bool)

(assert (=> b!1470120 (= res!998520 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34316))))

(declare-fun b!1470121 () Bool)

(declare-fun res!998518 () Bool)

(assert (=> b!1470121 (=> (not res!998518) (not e!825243))))

(declare-fun lt!642783 () SeekEntryResult!12058)

(assert (=> b!1470121 (= res!998518 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!642783))))

(declare-fun b!1470122 () Bool)

(declare-fun res!998516 () Bool)

(assert (=> b!1470122 (=> (not res!998516) (not e!825240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470122 (= res!998516 (validKeyInArray!0 (select (arr!47818 a!2862) i!1006)))))

(declare-fun b!1470123 () Bool)

(assert (=> b!1470123 (= e!825242 (= lt!642786 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642785 lt!642782 mask!2687)))))

(declare-fun b!1470124 () Bool)

(declare-fun res!998519 () Bool)

(assert (=> b!1470124 (=> (not res!998519) (not e!825240))))

(assert (=> b!1470124 (= res!998519 (validKeyInArray!0 (select (arr!47818 a!2862) j!93)))))

(declare-fun b!1470125 () Bool)

(declare-fun res!998509 () Bool)

(assert (=> b!1470125 (=> (not res!998509) (not e!825240))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1470125 (= res!998509 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48368 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48368 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48368 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470126 () Bool)

(assert (=> b!1470126 (= e!825245 e!825243)))

(declare-fun res!998515 () Bool)

(assert (=> b!1470126 (=> (not res!998515) (not e!825243))))

(assert (=> b!1470126 (= res!998515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47818 a!2862) j!93) mask!2687) (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!642783))))

(assert (=> b!1470126 (= lt!642783 (Intermediate!12058 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125612 res!998521) b!1470116))

(assert (= (and b!1470116 res!998513) b!1470122))

(assert (= (and b!1470122 res!998516) b!1470124))

(assert (= (and b!1470124 res!998519) b!1470112))

(assert (= (and b!1470112 res!998510) b!1470120))

(assert (= (and b!1470120 res!998520) b!1470125))

(assert (= (and b!1470125 res!998509) b!1470118))

(assert (= (and b!1470118 res!998511) b!1470126))

(assert (= (and b!1470126 res!998515) b!1470121))

(assert (= (and b!1470121 res!998518) b!1470117))

(assert (= (and b!1470117 res!998514) b!1470119))

(assert (= (and b!1470119 c!135312) b!1470123))

(assert (= (and b!1470119 (not c!135312)) b!1470115))

(assert (= (and b!1470119 res!998512) b!1470113))

(assert (= (and b!1470113 res!998517) b!1470114))

(declare-fun m!1357247 () Bool)

(assert (=> start!125612 m!1357247))

(declare-fun m!1357249 () Bool)

(assert (=> start!125612 m!1357249))

(declare-fun m!1357251 () Bool)

(assert (=> b!1470124 m!1357251))

(assert (=> b!1470124 m!1357251))

(declare-fun m!1357253 () Bool)

(assert (=> b!1470124 m!1357253))

(declare-fun m!1357255 () Bool)

(assert (=> b!1470120 m!1357255))

(declare-fun m!1357257 () Bool)

(assert (=> b!1470117 m!1357257))

(assert (=> b!1470117 m!1357257))

(declare-fun m!1357259 () Bool)

(assert (=> b!1470117 m!1357259))

(declare-fun m!1357261 () Bool)

(assert (=> b!1470117 m!1357261))

(declare-fun m!1357263 () Bool)

(assert (=> b!1470117 m!1357263))

(declare-fun m!1357265 () Bool)

(assert (=> b!1470122 m!1357265))

(assert (=> b!1470122 m!1357265))

(declare-fun m!1357267 () Bool)

(assert (=> b!1470122 m!1357267))

(assert (=> b!1470114 m!1357251))

(assert (=> b!1470114 m!1357251))

(declare-fun m!1357269 () Bool)

(assert (=> b!1470114 m!1357269))

(declare-fun m!1357271 () Bool)

(assert (=> b!1470114 m!1357271))

(declare-fun m!1357273 () Bool)

(assert (=> b!1470114 m!1357273))

(assert (=> b!1470121 m!1357251))

(assert (=> b!1470121 m!1357251))

(declare-fun m!1357275 () Bool)

(assert (=> b!1470121 m!1357275))

(declare-fun m!1357277 () Bool)

(assert (=> b!1470112 m!1357277))

(declare-fun m!1357279 () Bool)

(assert (=> b!1470123 m!1357279))

(assert (=> b!1470118 m!1357261))

(declare-fun m!1357281 () Bool)

(assert (=> b!1470118 m!1357281))

(declare-fun m!1357283 () Bool)

(assert (=> b!1470115 m!1357283))

(declare-fun m!1357285 () Bool)

(assert (=> b!1470115 m!1357285))

(assert (=> b!1470126 m!1357251))

(assert (=> b!1470126 m!1357251))

(declare-fun m!1357287 () Bool)

(assert (=> b!1470126 m!1357287))

(assert (=> b!1470126 m!1357287))

(assert (=> b!1470126 m!1357251))

(declare-fun m!1357289 () Bool)

(assert (=> b!1470126 m!1357289))

(push 1)

(assert (not b!1470120))

(assert (not b!1470115))

(assert (not b!1470114))

(assert (not b!1470123))

(assert (not b!1470126))

(assert (not b!1470117))

(assert (not b!1470121))

(assert (not b!1470124))

(assert (not b!1470112))

(assert (not b!1470122))

(assert (not start!125612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1470248 () Bool)

(declare-fun e!825310 () SeekEntryResult!12058)

(assert (=> b!1470248 (= e!825310 Undefined!12058)))

(declare-fun e!825312 () SeekEntryResult!12058)

(declare-fun lt!642831 () SeekEntryResult!12058)

(declare-fun b!1470249 () Bool)

(assert (=> b!1470249 (= e!825312 (seekKeyOrZeroReturnVacant!0 (x!132195 lt!642831) (index!50626 lt!642831) (index!50626 lt!642831) (select (arr!47818 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1470250 () Bool)

(declare-fun e!825311 () SeekEntryResult!12058)

(assert (=> b!1470250 (= e!825310 e!825311)))

(declare-fun lt!642832 () (_ BitVec 64))

(assert (=> b!1470250 (= lt!642832 (select (arr!47818 a!2862) (index!50626 lt!642831)))))

(declare-fun c!135361 () Bool)

(assert (=> b!1470250 (= c!135361 (= lt!642832 (select (arr!47818 a!2862) j!93)))))

(declare-fun b!1470251 () Bool)

(assert (=> b!1470251 (= e!825312 (MissingZero!12058 (index!50626 lt!642831)))))

(declare-fun b!1470252 () Bool)

(assert (=> b!1470252 (= e!825311 (Found!12058 (index!50626 lt!642831)))))

(declare-fun d!155321 () Bool)

(declare-fun lt!642830 () SeekEntryResult!12058)

(assert (=> d!155321 (and (or (is-Undefined!12058 lt!642830) (not (is-Found!12058 lt!642830)) (and (bvsge (index!50625 lt!642830) #b00000000000000000000000000000000) (bvslt (index!50625 lt!642830) (size!48368 a!2862)))) (or (is-Undefined!12058 lt!642830) (is-Found!12058 lt!642830) (not (is-MissingZero!12058 lt!642830)) (and (bvsge (index!50624 lt!642830) #b00000000000000000000000000000000) (bvslt (index!50624 lt!642830) (size!48368 a!2862)))) (or (is-Undefined!12058 lt!642830) (is-Found!12058 lt!642830) (is-MissingZero!12058 lt!642830) (not (is-MissingVacant!12058 lt!642830)) (and (bvsge (index!50627 lt!642830) #b00000000000000000000000000000000) (bvslt (index!50627 lt!642830) (size!48368 a!2862)))) (or (is-Undefined!12058 lt!642830) (ite (is-Found!12058 lt!642830) (= (select (arr!47818 a!2862) (index!50625 lt!642830)) (select (arr!47818 a!2862) j!93)) (ite (is-MissingZero!12058 lt!642830) (= (select (arr!47818 a!2862) (index!50624 lt!642830)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12058 lt!642830) (= (select (arr!47818 a!2862) (index!50627 lt!642830)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155321 (= lt!642830 e!825310)))

(declare-fun c!135363 () Bool)

(assert (=> d!155321 (= c!135363 (and (is-Intermediate!12058 lt!642831) (undefined!12870 lt!642831)))))

(assert (=> d!155321 (= lt!642831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47818 a!2862) j!93) mask!2687) (select (arr!47818 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155321 (validMask!0 mask!2687)))

(assert (=> d!155321 (= (seekEntryOrOpen!0 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) lt!642830)))

(declare-fun b!1470247 () Bool)

(declare-fun c!135362 () Bool)

(assert (=> b!1470247 (= c!135362 (= lt!642832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470247 (= e!825311 e!825312)))

(assert (= (and d!155321 c!135363) b!1470248))

(assert (= (and d!155321 (not c!135363)) b!1470250))

(assert (= (and b!1470250 c!135361) b!1470252))

(assert (= (and b!1470250 (not c!135361)) b!1470247))

(assert (= (and b!1470247 c!135362) b!1470251))

(assert (= (and b!1470247 (not c!135362)) b!1470249))

(assert (=> b!1470249 m!1357251))

(declare-fun m!1357337 () Bool)

(assert (=> b!1470249 m!1357337))

(declare-fun m!1357339 () Bool)

(assert (=> b!1470250 m!1357339))

(assert (=> d!155321 m!1357251))

(assert (=> d!155321 m!1357287))

(declare-fun m!1357341 () Bool)

(assert (=> d!155321 m!1357341))

(declare-fun m!1357343 () Bool)

(assert (=> d!155321 m!1357343))

(assert (=> d!155321 m!1357247))

(assert (=> d!155321 m!1357287))

(assert (=> d!155321 m!1357251))

(assert (=> d!155321 m!1357289))

(declare-fun m!1357345 () Bool)

(assert (=> d!155321 m!1357345))

(assert (=> b!1470114 d!155321))

(declare-fun b!1470261 () Bool)

(declare-fun e!825319 () Bool)

(declare-fun e!825320 () Bool)

(assert (=> b!1470261 (= e!825319 e!825320)))

(declare-fun lt!642847 () (_ BitVec 64))

(assert (=> b!1470261 (= lt!642847 (select (arr!47818 a!2862) j!93))))

(declare-fun lt!642846 () Unit!49456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99060 (_ BitVec 64) (_ BitVec 32)) Unit!49456)

(assert (=> b!1470261 (= lt!642846 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!642847 j!93))))

(declare-fun arrayContainsKey!0 (array!99060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1470261 (arrayContainsKey!0 a!2862 lt!642847 #b00000000000000000000000000000000)))

(declare-fun lt!642845 () Unit!49456)

(assert (=> b!1470261 (= lt!642845 lt!642846)))

(declare-fun res!998553 () Bool)

(assert (=> b!1470261 (= res!998553 (= (seekEntryOrOpen!0 (select (arr!47818 a!2862) j!93) a!2862 mask!2687) (Found!12058 j!93)))))

(assert (=> b!1470261 (=> (not res!998553) (not e!825320))))

(declare-fun call!67699 () Bool)

(declare-fun bm!67696 () Bool)

(assert (=> bm!67696 (= call!67699 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1470262 () Bool)

(declare-fun e!825321 () Bool)

(assert (=> b!1470262 (= e!825321 e!825319)))

(declare-fun c!135366 () Bool)

(assert (=> b!1470262 (= c!135366 (validKeyInArray!0 (select (arr!47818 a!2862) j!93)))))

(declare-fun b!1470263 () Bool)

(assert (=> b!1470263 (= e!825320 call!67699)))

(declare-fun d!155333 () Bool)

(declare-fun res!998552 () Bool)

(assert (=> d!155333 (=> res!998552 e!825321)))

(assert (=> d!155333 (= res!998552 (bvsge j!93 (size!48368 a!2862)))))

(assert (=> d!155333 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825321)))

(declare-fun b!1470264 () Bool)

(assert (=> b!1470264 (= e!825319 call!67699)))

(assert (= (and d!155333 (not res!998552)) b!1470262))

(assert (= (and b!1470262 c!135366) b!1470261))

(assert (= (and b!1470262 (not c!135366)) b!1470264))

(assert (= (and b!1470261 res!998553) b!1470263))

(assert (= (or b!1470263 b!1470264) bm!67696))

(assert (=> b!1470261 m!1357251))

(declare-fun m!1357347 () Bool)

(assert (=> b!1470261 m!1357347))

(declare-fun m!1357349 () Bool)

(assert (=> b!1470261 m!1357349))

(assert (=> b!1470261 m!1357251))

(assert (=> b!1470261 m!1357269))

(declare-fun m!1357351 () Bool)

(assert (=> bm!67696 m!1357351))

(assert (=> b!1470262 m!1357251))

(assert (=> b!1470262 m!1357251))

(assert (=> b!1470262 m!1357253))

(assert (=> b!1470114 d!155333))

(declare-fun d!155341 () Bool)

(assert (=> d!155341 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642859 () Unit!49456)

(declare-fun choose!38 (array!99060 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49456)

(assert (=> d!155341 (= lt!642859 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155341 (validMask!0 mask!2687)))

(assert (=> d!155341 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!642859)))

(declare-fun bs!42491 () Bool)

(assert (= bs!42491 d!155341))

(assert (=> bs!42491 m!1357271))

(declare-fun m!1357373 () Bool)

(assert (=> bs!42491 m!1357373))

(assert (=> bs!42491 m!1357247))

(assert (=> b!1470114 d!155341))

(declare-fun b!1470350 () Bool)

(declare-fun c!135394 () Bool)

(declare-fun lt!642885 () (_ BitVec 64))

(assert (=> b!1470350 (= c!135394 (= lt!642885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825382 () SeekEntryResult!12058)

(declare-fun e!825381 () SeekEntryResult!12058)

(assert (=> b!1470350 (= e!825382 e!825381)))

(declare-fun b!1470351 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470351 (= e!825381 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!642785 lt!642782 mask!2687))))

(declare-fun b!1470352 () Bool)

(declare-fun e!825383 () SeekEntryResult!12058)

(assert (=> b!1470352 (= e!825383 e!825382)))

(declare-fun c!135393 () Bool)

(assert (=> b!1470352 (= c!135393 (= lt!642885 lt!642785))))

(declare-fun b!1470353 () Bool)

(assert (=> b!1470353 (= e!825383 Undefined!12058)))

(declare-fun b!1470354 () Bool)

(assert (=> b!1470354 (= e!825381 (MissingVacant!12058 intermediateAfterIndex!19))))

(declare-fun d!155347 () Bool)

(declare-fun lt!642884 () SeekEntryResult!12058)

(assert (=> d!155347 (and (or (is-Undefined!12058 lt!642884) (not (is-Found!12058 lt!642884)) (and (bvsge (index!50625 lt!642884) #b00000000000000000000000000000000) (bvslt (index!50625 lt!642884) (size!48368 lt!642782)))) (or (is-Undefined!12058 lt!642884) (is-Found!12058 lt!642884) (not (is-MissingVacant!12058 lt!642884)) (not (= (index!50627 lt!642884) intermediateAfterIndex!19)) (and (bvsge (index!50627 lt!642884) #b00000000000000000000000000000000) (bvslt (index!50627 lt!642884) (size!48368 lt!642782)))) (or (is-Undefined!12058 lt!642884) (ite (is-Found!12058 lt!642884) (= (select (arr!47818 lt!642782) (index!50625 lt!642884)) lt!642785) (and (is-MissingVacant!12058 lt!642884) (= (index!50627 lt!642884) intermediateAfterIndex!19) (= (select (arr!47818 lt!642782) (index!50627 lt!642884)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155347 (= lt!642884 e!825383)))

(declare-fun c!135392 () Bool)

(assert (=> d!155347 (= c!135392 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155347 (= lt!642885 (select (arr!47818 lt!642782) index!646))))

(assert (=> d!155347 (validMask!0 mask!2687)))

(assert (=> d!155347 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642785 lt!642782 mask!2687) lt!642884)))

(declare-fun b!1470355 () Bool)

(assert (=> b!1470355 (= e!825382 (Found!12058 index!646))))

(assert (= (and d!155347 c!135392) b!1470353))

(assert (= (and d!155347 (not c!135392)) b!1470352))

(assert (= (and b!1470352 c!135393) b!1470355))

(assert (= (and b!1470352 (not c!135393)) b!1470350))

(assert (= (and b!1470350 c!135394) b!1470354))

(assert (= (and b!1470350 (not c!135394)) b!1470351))

(declare-fun m!1357411 () Bool)

(assert (=> b!1470351 m!1357411))

(assert (=> b!1470351 m!1357411))

(declare-fun m!1357415 () Bool)

(assert (=> b!1470351 m!1357415))

(declare-fun m!1357417 () Bool)

(assert (=> d!155347 m!1357417))

(declare-fun m!1357419 () Bool)

(assert (=> d!155347 m!1357419))

(declare-fun m!1357421 () Bool)

(assert (=> d!155347 m!1357421))

(assert (=> d!155347 m!1357247))

(assert (=> b!1470115 d!155347))

(declare-fun b!1470357 () Bool)

(declare-fun e!825384 () SeekEntryResult!12058)

(assert (=> b!1470357 (= e!825384 Undefined!12058)))

(declare-fun lt!642889 () SeekEntryResult!12058)

(declare-fun e!825386 () SeekEntryResult!12058)

(declare-fun b!1470358 () Bool)

(assert (=> b!1470358 (= e!825386 (seekKeyOrZeroReturnVacant!0 (x!132195 lt!642889) (index!50626 lt!642889) (index!50626 lt!642889) lt!642785 lt!642782 mask!2687))))

(declare-fun b!1470359 () Bool)

(declare-fun e!825385 () SeekEntryResult!12058)

(assert (=> b!1470359 (= e!825384 e!825385)))

(declare-fun lt!642890 () (_ BitVec 64))

(assert (=> b!1470359 (= lt!642890 (select (arr!47818 lt!642782) (index!50626 lt!642889)))))

(declare-fun c!135395 () Bool)

(assert (=> b!1470359 (= c!135395 (= lt!642890 lt!642785))))

(declare-fun b!1470360 () Bool)

(assert (=> b!1470360 (= e!825386 (MissingZero!12058 (index!50626 lt!642889)))))

(declare-fun b!1470361 () Bool)

(assert (=> b!1470361 (= e!825385 (Found!12058 (index!50626 lt!642889)))))

(declare-fun d!155365 () Bool)

(declare-fun lt!642888 () SeekEntryResult!12058)

(assert (=> d!155365 (and (or (is-Undefined!12058 lt!642888) (not (is-Found!12058 lt!642888)) (and (bvsge (index!50625 lt!642888) #b00000000000000000000000000000000) (bvslt (index!50625 lt!642888) (size!48368 lt!642782)))) (or (is-Undefined!12058 lt!642888) (is-Found!12058 lt!642888) (not (is-MissingZero!12058 lt!642888)) (and (bvsge (index!50624 lt!642888) #b00000000000000000000000000000000) (bvslt (index!50624 lt!642888) (size!48368 lt!642782)))) (or (is-Undefined!12058 lt!642888) (is-Found!12058 lt!642888) (is-MissingZero!12058 lt!642888) (not (is-MissingVacant!12058 lt!642888)) (and (bvsge (index!50627 lt!642888) #b00000000000000000000000000000000) (bvslt (index!50627 lt!642888) (size!48368 lt!642782)))) (or (is-Undefined!12058 lt!642888) (ite (is-Found!12058 lt!642888) (= (select (arr!47818 lt!642782) (index!50625 lt!642888)) lt!642785) (ite (is-MissingZero!12058 lt!642888) (= (select (arr!47818 lt!642782) (index!50624 lt!642888)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12058 lt!642888) (= (select (arr!47818 lt!642782) (index!50627 lt!642888)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155365 (= lt!642888 e!825384)))

(declare-fun c!135397 () Bool)

(assert (=> d!155365 (= c!135397 (and (is-Intermediate!12058 lt!642889) (undefined!12870 lt!642889)))))

(assert (=> d!155365 (= lt!642889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642785 mask!2687) lt!642785 lt!642782 mask!2687))))

(assert (=> d!155365 (validMask!0 mask!2687)))

(assert (=> d!155365 (= (seekEntryOrOpen!0 lt!642785 lt!642782 mask!2687) lt!642888)))

(declare-fun b!1470356 () Bool)

(declare-fun c!135396 () Bool)

(assert (=> b!1470356 (= c!135396 (= lt!642890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470356 (= e!825385 e!825386)))

(assert (= (and d!155365 c!135397) b!1470357))

(assert (= (and d!155365 (not c!135397)) b!1470359))

(assert (= (and b!1470359 c!135395) b!1470361))

(assert (= (and b!1470359 (not c!135395)) b!1470356))

(assert (= (and b!1470356 c!135396) b!1470360))

(assert (= (and b!1470356 (not c!135396)) b!1470358))

(declare-fun m!1357423 () Bool)

(assert (=> b!1470358 m!1357423))

(declare-fun m!1357425 () Bool)

(assert (=> b!1470359 m!1357425))

(assert (=> d!155365 m!1357257))

(declare-fun m!1357427 () Bool)

(assert (=> d!155365 m!1357427))

(declare-fun m!1357429 () Bool)

(assert (=> d!155365 m!1357429))

(assert (=> d!155365 m!1357247))

(assert (=> d!155365 m!1357257))

(assert (=> d!155365 m!1357259))

(declare-fun m!1357431 () Bool)

(assert (=> d!155365 m!1357431))

(assert (=> b!1470115 d!155365))

(declare-fun b!1470390 () Bool)

(declare-fun e!825405 () Bool)

(declare-fun contains!9898 (List!34319 (_ BitVec 64)) Bool)

(assert (=> b!1470390 (= e!825405 (contains!9898 Nil!34316 (select (arr!47818 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470391 () Bool)

(declare-fun e!825406 () Bool)

(declare-fun call!67715 () Bool)

(assert (=> b!1470391 (= e!825406 call!67715)))

(declare-fun bm!67712 () Bool)

(declare-fun c!135409 () Bool)

(assert (=> bm!67712 (= call!67715 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135409 (Cons!34315 (select (arr!47818 a!2862) #b00000000000000000000000000000000) Nil!34316) Nil!34316)))))

(declare-fun b!1470392 () Bool)

(assert (=> b!1470392 (= e!825406 call!67715)))

(declare-fun b!1470393 () Bool)

(declare-fun e!825404 () Bool)

(declare-fun e!825407 () Bool)

(assert (=> b!1470393 (= e!825404 e!825407)))

(declare-fun res!998596 () Bool)

(assert (=> b!1470393 (=> (not res!998596) (not e!825407))))

(assert (=> b!1470393 (= res!998596 (not e!825405))))

(declare-fun res!998597 () Bool)

(assert (=> b!1470393 (=> (not res!998597) (not e!825405))))

(assert (=> b!1470393 (= res!998597 (validKeyInArray!0 (select (arr!47818 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1470394 () Bool)

(assert (=> b!1470394 (= e!825407 e!825406)))

(assert (=> b!1470394 (= c!135409 (validKeyInArray!0 (select (arr!47818 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155367 () Bool)

(declare-fun res!998595 () Bool)

(assert (=> d!155367 (=> res!998595 e!825404)))

(assert (=> d!155367 (= res!998595 (bvsge #b00000000000000000000000000000000 (size!48368 a!2862)))))

(assert (=> d!155367 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34316) e!825404)))

(assert (= (and d!155367 (not res!998595)) b!1470393))

(assert (= (and b!1470393 res!998597) b!1470390))

(assert (= (and b!1470393 res!998596) b!1470394))

(assert (= (and b!1470394 c!135409) b!1470392))

(assert (= (and b!1470394 (not c!135409)) b!1470391))

(assert (= (or b!1470392 b!1470391) bm!67712))

(declare-fun m!1357443 () Bool)

(assert (=> b!1470390 m!1357443))

(assert (=> b!1470390 m!1357443))

(declare-fun m!1357445 () Bool)

(assert (=> b!1470390 m!1357445))

(assert (=> bm!67712 m!1357443))

(declare-fun m!1357447 () Bool)

(assert (=> bm!67712 m!1357447))

(assert (=> b!1470393 m!1357443))

(assert (=> b!1470393 m!1357443))

(declare-fun m!1357449 () Bool)

(assert (=> b!1470393 m!1357449))

(assert (=> b!1470394 m!1357443))

(assert (=> b!1470394 m!1357443))

(assert (=> b!1470394 m!1357449))

(assert (=> b!1470120 d!155367))

(declare-fun d!155371 () Bool)

(assert (=> d!155371 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125612 d!155371))

(declare-fun d!155373 () Bool)

(assert (=> d!155373 (= (array_inv!36846 a!2862) (bvsge (size!48368 a!2862) #b00000000000000000000000000000000))))

