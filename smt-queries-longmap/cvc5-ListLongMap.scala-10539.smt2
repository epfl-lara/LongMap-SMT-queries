; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124288 () Bool)

(assert start!124288)

(declare-fun b!1438332 () Bool)

(declare-fun res!971010 () Bool)

(declare-fun e!811370 () Bool)

(assert (=> b!1438332 (=> (not res!971010) (not e!811370))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97814 0))(
  ( (array!97815 (arr!47198 (Array (_ BitVec 32) (_ BitVec 64))) (size!47748 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97814)

(assert (=> b!1438332 (= res!971010 (and (= (size!47748 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47748 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47748 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438333 () Bool)

(declare-fun res!971013 () Bool)

(assert (=> b!1438333 (=> (not res!971013) (not e!811370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97814 (_ BitVec 32)) Bool)

(assert (=> b!1438333 (= res!971013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438334 () Bool)

(declare-fun res!971007 () Bool)

(assert (=> b!1438334 (=> (not res!971007) (not e!811370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438334 (= res!971007 (validKeyInArray!0 (select (arr!47198 a!2862) j!93)))))

(declare-fun res!971005 () Bool)

(assert (=> start!124288 (=> (not res!971005) (not e!811370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124288 (= res!971005 (validMask!0 mask!2687))))

(assert (=> start!124288 e!811370))

(assert (=> start!124288 true))

(declare-fun array_inv!36226 (array!97814) Bool)

(assert (=> start!124288 (array_inv!36226 a!2862)))

(declare-fun b!1438335 () Bool)

(declare-fun e!811368 () Bool)

(assert (=> b!1438335 (= e!811370 e!811368)))

(declare-fun res!971006 () Bool)

(assert (=> b!1438335 (=> (not res!971006) (not e!811368))))

(declare-datatypes ((SeekEntryResult!11450 0))(
  ( (MissingZero!11450 (index!48192 (_ BitVec 32))) (Found!11450 (index!48193 (_ BitVec 32))) (Intermediate!11450 (undefined!12262 Bool) (index!48194 (_ BitVec 32)) (x!129927 (_ BitVec 32))) (Undefined!11450) (MissingVacant!11450 (index!48195 (_ BitVec 32))) )
))
(declare-fun lt!632529 () SeekEntryResult!11450)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97814 (_ BitVec 32)) SeekEntryResult!11450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438335 (= res!971006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687) (select (arr!47198 a!2862) j!93) a!2862 mask!2687) lt!632529))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438335 (= lt!632529 (Intermediate!11450 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438336 () Bool)

(declare-fun res!971012 () Bool)

(assert (=> b!1438336 (=> (not res!971012) (not e!811368))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438336 (= res!971012 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47198 a!2862) j!93) a!2862 mask!2687) lt!632529))))

(declare-fun b!1438337 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1438337 (= e!811368 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1438338 () Bool)

(declare-fun res!971011 () Bool)

(assert (=> b!1438338 (=> (not res!971011) (not e!811368))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438338 (= res!971011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862)) mask!2687) (Intermediate!11450 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438339 () Bool)

(declare-fun res!971014 () Bool)

(assert (=> b!1438339 (=> (not res!971014) (not e!811370))))

(declare-datatypes ((List!33699 0))(
  ( (Nil!33696) (Cons!33695 (h!35039 (_ BitVec 64)) (t!48393 List!33699)) )
))
(declare-fun arrayNoDuplicates!0 (array!97814 (_ BitVec 32) List!33699) Bool)

(assert (=> b!1438339 (= res!971014 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33696))))

(declare-fun b!1438340 () Bool)

(declare-fun res!971009 () Bool)

(assert (=> b!1438340 (=> (not res!971009) (not e!811370))))

(assert (=> b!1438340 (= res!971009 (validKeyInArray!0 (select (arr!47198 a!2862) i!1006)))))

(declare-fun b!1438341 () Bool)

(declare-fun res!971008 () Bool)

(assert (=> b!1438341 (=> (not res!971008) (not e!811370))))

(assert (=> b!1438341 (= res!971008 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47748 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47748 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47748 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124288 res!971005) b!1438332))

(assert (= (and b!1438332 res!971010) b!1438340))

(assert (= (and b!1438340 res!971009) b!1438334))

(assert (= (and b!1438334 res!971007) b!1438333))

(assert (= (and b!1438333 res!971013) b!1438339))

(assert (= (and b!1438339 res!971014) b!1438341))

(assert (= (and b!1438341 res!971008) b!1438335))

(assert (= (and b!1438335 res!971006) b!1438336))

(assert (= (and b!1438336 res!971012) b!1438338))

(assert (= (and b!1438338 res!971011) b!1438337))

(declare-fun m!1327519 () Bool)

(assert (=> start!124288 m!1327519))

(declare-fun m!1327521 () Bool)

(assert (=> start!124288 m!1327521))

(declare-fun m!1327523 () Bool)

(assert (=> b!1438335 m!1327523))

(assert (=> b!1438335 m!1327523))

(declare-fun m!1327525 () Bool)

(assert (=> b!1438335 m!1327525))

(assert (=> b!1438335 m!1327525))

(assert (=> b!1438335 m!1327523))

(declare-fun m!1327527 () Bool)

(assert (=> b!1438335 m!1327527))

(declare-fun m!1327529 () Bool)

(assert (=> b!1438340 m!1327529))

(assert (=> b!1438340 m!1327529))

(declare-fun m!1327531 () Bool)

(assert (=> b!1438340 m!1327531))

(assert (=> b!1438334 m!1327523))

(assert (=> b!1438334 m!1327523))

(declare-fun m!1327533 () Bool)

(assert (=> b!1438334 m!1327533))

(declare-fun m!1327535 () Bool)

(assert (=> b!1438333 m!1327535))

(declare-fun m!1327537 () Bool)

(assert (=> b!1438341 m!1327537))

(declare-fun m!1327539 () Bool)

(assert (=> b!1438341 m!1327539))

(assert (=> b!1438336 m!1327523))

(assert (=> b!1438336 m!1327523))

(declare-fun m!1327541 () Bool)

(assert (=> b!1438336 m!1327541))

(assert (=> b!1438338 m!1327537))

(declare-fun m!1327543 () Bool)

(assert (=> b!1438338 m!1327543))

(assert (=> b!1438338 m!1327543))

(declare-fun m!1327545 () Bool)

(assert (=> b!1438338 m!1327545))

(assert (=> b!1438338 m!1327545))

(assert (=> b!1438338 m!1327543))

(declare-fun m!1327547 () Bool)

(assert (=> b!1438338 m!1327547))

(declare-fun m!1327549 () Bool)

(assert (=> b!1438339 m!1327549))

(push 1)

(assert (not b!1438338))

(assert (not b!1438336))

(assert (not b!1438340))

(assert (not b!1438339))

(assert (not b!1438334))

(assert (not b!1438333))

(assert (not start!124288))

(assert (not b!1438335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1438492 () Bool)

(declare-fun e!811445 () Bool)

(declare-fun lt!632568 () SeekEntryResult!11450)

(assert (=> b!1438492 (= e!811445 (bvsge (x!129927 lt!632568) #b01111111111111111111111111111110))))

(declare-fun e!811447 () SeekEntryResult!11450)

(declare-fun b!1438493 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438493 (= e!811447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47198 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438494 () Bool)

(declare-fun e!811446 () Bool)

(assert (=> b!1438494 (= e!811445 e!811446)))

(declare-fun res!971113 () Bool)

(assert (=> b!1438494 (= res!971113 (and (is-Intermediate!11450 lt!632568) (not (undefined!12262 lt!632568)) (bvslt (x!129927 lt!632568) #b01111111111111111111111111111110) (bvsge (x!129927 lt!632568) #b00000000000000000000000000000000) (bvsge (x!129927 lt!632568) #b00000000000000000000000000000000)))))

(assert (=> b!1438494 (=> (not res!971113) (not e!811446))))

(declare-fun b!1438495 () Bool)

(declare-fun e!811448 () SeekEntryResult!11450)

(assert (=> b!1438495 (= e!811448 e!811447)))

(declare-fun c!133198 () Bool)

(declare-fun lt!632567 () (_ BitVec 64))

(assert (=> b!1438495 (= c!133198 (or (= lt!632567 (select (arr!47198 a!2862) j!93)) (= (bvadd lt!632567 lt!632567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438496 () Bool)

(assert (=> b!1438496 (and (bvsge (index!48194 lt!632568) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632568) (size!47748 a!2862)))))

(declare-fun res!971114 () Bool)

(assert (=> b!1438496 (= res!971114 (= (select (arr!47198 a!2862) (index!48194 lt!632568)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811449 () Bool)

(assert (=> b!1438496 (=> res!971114 e!811449)))

(declare-fun d!154773 () Bool)

(assert (=> d!154773 e!811445))

(declare-fun c!133200 () Bool)

(assert (=> d!154773 (= c!133200 (and (is-Intermediate!11450 lt!632568) (undefined!12262 lt!632568)))))

(assert (=> d!154773 (= lt!632568 e!811448)))

(declare-fun c!133199 () Bool)

(assert (=> d!154773 (= c!133199 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154773 (= lt!632567 (select (arr!47198 a!2862) (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687)))))

(assert (=> d!154773 (validMask!0 mask!2687)))

(assert (=> d!154773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687) (select (arr!47198 a!2862) j!93) a!2862 mask!2687) lt!632568)))

(declare-fun b!1438497 () Bool)

(assert (=> b!1438497 (and (bvsge (index!48194 lt!632568) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632568) (size!47748 a!2862)))))

(assert (=> b!1438497 (= e!811449 (= (select (arr!47198 a!2862) (index!48194 lt!632568)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438498 () Bool)

(assert (=> b!1438498 (and (bvsge (index!48194 lt!632568) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632568) (size!47748 a!2862)))))

(declare-fun res!971112 () Bool)

(assert (=> b!1438498 (= res!971112 (= (select (arr!47198 a!2862) (index!48194 lt!632568)) (select (arr!47198 a!2862) j!93)))))

(assert (=> b!1438498 (=> res!971112 e!811449)))

(assert (=> b!1438498 (= e!811446 e!811449)))

(declare-fun b!1438499 () Bool)

(assert (=> b!1438499 (= e!811448 (Intermediate!11450 true (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438500 () Bool)

(assert (=> b!1438500 (= e!811447 (Intermediate!11450 false (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!154773 c!133199) b!1438499))

(assert (= (and d!154773 (not c!133199)) b!1438495))

(assert (= (and b!1438495 c!133198) b!1438500))

(assert (= (and b!1438495 (not c!133198)) b!1438493))

(assert (= (and d!154773 c!133200) b!1438492))

(assert (= (and d!154773 (not c!133200)) b!1438494))

(assert (= (and b!1438494 res!971113) b!1438498))

(assert (= (and b!1438498 (not res!971112)) b!1438496))

(assert (= (and b!1438496 (not res!971114)) b!1438497))

(declare-fun m!1327655 () Bool)

(assert (=> b!1438496 m!1327655))

(assert (=> b!1438497 m!1327655))

(assert (=> d!154773 m!1327525))

(declare-fun m!1327657 () Bool)

(assert (=> d!154773 m!1327657))

(assert (=> d!154773 m!1327519))

(assert (=> b!1438498 m!1327655))

(assert (=> b!1438493 m!1327525))

(declare-fun m!1327659 () Bool)

(assert (=> b!1438493 m!1327659))

(assert (=> b!1438493 m!1327659))

(assert (=> b!1438493 m!1327523))

(declare-fun m!1327661 () Bool)

(assert (=> b!1438493 m!1327661))

(assert (=> b!1438335 d!154773))

(declare-fun d!154791 () Bool)

(declare-fun lt!632578 () (_ BitVec 32))

(declare-fun lt!632577 () (_ BitVec 32))

(assert (=> d!154791 (= lt!632578 (bvmul (bvxor lt!632577 (bvlshr lt!632577 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154791 (= lt!632577 ((_ extract 31 0) (bvand (bvxor (select (arr!47198 a!2862) j!93) (bvlshr (select (arr!47198 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154791 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971115 (let ((h!35043 ((_ extract 31 0) (bvand (bvxor (select (arr!47198 a!2862) j!93) (bvlshr (select (arr!47198 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129933 (bvmul (bvxor h!35043 (bvlshr h!35043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129933 (bvlshr x!129933 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971115 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971115 #b00000000000000000000000000000000))))))

(assert (=> d!154791 (= (toIndex!0 (select (arr!47198 a!2862) j!93) mask!2687) (bvand (bvxor lt!632578 (bvlshr lt!632578 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438335 d!154791))

(declare-fun d!154793 () Bool)

(assert (=> d!154793 (= (validKeyInArray!0 (select (arr!47198 a!2862) i!1006)) (and (not (= (select (arr!47198 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47198 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438340 d!154793))

(declare-fun b!1438509 () Bool)

(declare-fun e!811454 () Bool)

(declare-fun lt!632580 () SeekEntryResult!11450)

(assert (=> b!1438509 (= e!811454 (bvsge (x!129927 lt!632580) #b01111111111111111111111111111110))))

(declare-fun e!811456 () SeekEntryResult!11450)

(declare-fun b!1438510 () Bool)

(assert (=> b!1438510 (= e!811456 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47198 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438511 () Bool)

(declare-fun e!811455 () Bool)

(assert (=> b!1438511 (= e!811454 e!811455)))

(declare-fun res!971117 () Bool)

(assert (=> b!1438511 (= res!971117 (and (is-Intermediate!11450 lt!632580) (not (undefined!12262 lt!632580)) (bvslt (x!129927 lt!632580) #b01111111111111111111111111111110) (bvsge (x!129927 lt!632580) #b00000000000000000000000000000000) (bvsge (x!129927 lt!632580) x!665)))))

(assert (=> b!1438511 (=> (not res!971117) (not e!811455))))

(declare-fun b!1438512 () Bool)

(declare-fun e!811457 () SeekEntryResult!11450)

(assert (=> b!1438512 (= e!811457 e!811456)))

(declare-fun lt!632579 () (_ BitVec 64))

(declare-fun c!133205 () Bool)

(assert (=> b!1438512 (= c!133205 (or (= lt!632579 (select (arr!47198 a!2862) j!93)) (= (bvadd lt!632579 lt!632579) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438513 () Bool)

(assert (=> b!1438513 (and (bvsge (index!48194 lt!632580) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632580) (size!47748 a!2862)))))

(declare-fun res!971118 () Bool)

(assert (=> b!1438513 (= res!971118 (= (select (arr!47198 a!2862) (index!48194 lt!632580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811458 () Bool)

(assert (=> b!1438513 (=> res!971118 e!811458)))

(declare-fun d!154795 () Bool)

(assert (=> d!154795 e!811454))

(declare-fun c!133207 () Bool)

(assert (=> d!154795 (= c!133207 (and (is-Intermediate!11450 lt!632580) (undefined!12262 lt!632580)))))

(assert (=> d!154795 (= lt!632580 e!811457)))

(declare-fun c!133206 () Bool)

(assert (=> d!154795 (= c!133206 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154795 (= lt!632579 (select (arr!47198 a!2862) index!646))))

(assert (=> d!154795 (validMask!0 mask!2687)))

(assert (=> d!154795 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47198 a!2862) j!93) a!2862 mask!2687) lt!632580)))

(declare-fun b!1438514 () Bool)

(assert (=> b!1438514 (and (bvsge (index!48194 lt!632580) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632580) (size!47748 a!2862)))))

(assert (=> b!1438514 (= e!811458 (= (select (arr!47198 a!2862) (index!48194 lt!632580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438515 () Bool)

(assert (=> b!1438515 (and (bvsge (index!48194 lt!632580) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632580) (size!47748 a!2862)))))

(declare-fun res!971116 () Bool)

(assert (=> b!1438515 (= res!971116 (= (select (arr!47198 a!2862) (index!48194 lt!632580)) (select (arr!47198 a!2862) j!93)))))

(assert (=> b!1438515 (=> res!971116 e!811458)))

(assert (=> b!1438515 (= e!811455 e!811458)))

(declare-fun b!1438516 () Bool)

(assert (=> b!1438516 (= e!811457 (Intermediate!11450 true index!646 x!665))))

(declare-fun b!1438517 () Bool)

(assert (=> b!1438517 (= e!811456 (Intermediate!11450 false index!646 x!665))))

(assert (= (and d!154795 c!133206) b!1438516))

(assert (= (and d!154795 (not c!133206)) b!1438512))

(assert (= (and b!1438512 c!133205) b!1438517))

(assert (= (and b!1438512 (not c!133205)) b!1438510))

(assert (= (and d!154795 c!133207) b!1438509))

(assert (= (and d!154795 (not c!133207)) b!1438511))

(assert (= (and b!1438511 res!971117) b!1438515))

(assert (= (and b!1438515 (not res!971116)) b!1438513))

(assert (= (and b!1438513 (not res!971118)) b!1438514))

(declare-fun m!1327663 () Bool)

(assert (=> b!1438513 m!1327663))

(assert (=> b!1438514 m!1327663))

(declare-fun m!1327665 () Bool)

(assert (=> d!154795 m!1327665))

(assert (=> d!154795 m!1327519))

(assert (=> b!1438515 m!1327663))

(declare-fun m!1327667 () Bool)

(assert (=> b!1438510 m!1327667))

(assert (=> b!1438510 m!1327667))

(assert (=> b!1438510 m!1327523))

(declare-fun m!1327669 () Bool)

(assert (=> b!1438510 m!1327669))

(assert (=> b!1438336 d!154795))

(declare-fun b!1438524 () Bool)

(declare-fun e!811464 () Bool)

(declare-fun lt!632582 () SeekEntryResult!11450)

(assert (=> b!1438524 (= e!811464 (bvsge (x!129927 lt!632582) #b01111111111111111111111111111110))))

(declare-fun b!1438525 () Bool)

(declare-fun e!811467 () SeekEntryResult!11450)

(assert (=> b!1438525 (= e!811467 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862)) mask!2687))))

(declare-fun b!1438526 () Bool)

(declare-fun e!811466 () Bool)

(assert (=> b!1438526 (= e!811464 e!811466)))

(declare-fun res!971122 () Bool)

(assert (=> b!1438526 (= res!971122 (and (is-Intermediate!11450 lt!632582) (not (undefined!12262 lt!632582)) (bvslt (x!129927 lt!632582) #b01111111111111111111111111111110) (bvsge (x!129927 lt!632582) #b00000000000000000000000000000000) (bvsge (x!129927 lt!632582) #b00000000000000000000000000000000)))))

(assert (=> b!1438526 (=> (not res!971122) (not e!811466))))

(declare-fun b!1438527 () Bool)

(declare-fun e!811468 () SeekEntryResult!11450)

(assert (=> b!1438527 (= e!811468 e!811467)))

(declare-fun lt!632581 () (_ BitVec 64))

(declare-fun c!133210 () Bool)

(assert (=> b!1438527 (= c!133210 (or (= lt!632581 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632581 lt!632581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438528 () Bool)

(assert (=> b!1438528 (and (bvsge (index!48194 lt!632582) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632582) (size!47748 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862)))))))

(declare-fun res!971125 () Bool)

(assert (=> b!1438528 (= res!971125 (= (select (arr!47198 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862))) (index!48194 lt!632582)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811469 () Bool)

(assert (=> b!1438528 (=> res!971125 e!811469)))

(declare-fun d!154797 () Bool)

(assert (=> d!154797 e!811464))

(declare-fun c!133212 () Bool)

(assert (=> d!154797 (= c!133212 (and (is-Intermediate!11450 lt!632582) (undefined!12262 lt!632582)))))

(assert (=> d!154797 (= lt!632582 e!811468)))

(declare-fun c!133211 () Bool)

(assert (=> d!154797 (= c!133211 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154797 (= lt!632581 (select (arr!47198 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862))) (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687)))))

(assert (=> d!154797 (validMask!0 mask!2687)))

(assert (=> d!154797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862)) mask!2687) lt!632582)))

(declare-fun b!1438529 () Bool)

(assert (=> b!1438529 (and (bvsge (index!48194 lt!632582) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632582) (size!47748 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862)))))))

(assert (=> b!1438529 (= e!811469 (= (select (arr!47198 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862))) (index!48194 lt!632582)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438530 () Bool)

(assert (=> b!1438530 (and (bvsge (index!48194 lt!632582) #b00000000000000000000000000000000) (bvslt (index!48194 lt!632582) (size!47748 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862)))))))

(declare-fun res!971121 () Bool)

(assert (=> b!1438530 (= res!971121 (= (select (arr!47198 (array!97815 (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47748 a!2862))) (index!48194 lt!632582)) (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(assert (=> b!1438530 (=> res!971121 e!811469)))

(assert (=> b!1438530 (= e!811466 e!811469)))

(declare-fun b!1438531 () Bool)

(assert (=> b!1438531 (= e!811468 (Intermediate!11450 true (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438532 () Bool)

(assert (=> b!1438532 (= e!811467 (Intermediate!11450 false (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!154797 c!133211) b!1438531))

(assert (= (and d!154797 (not c!133211)) b!1438527))

(assert (= (and b!1438527 c!133210) b!1438532))

(assert (= (and b!1438527 (not c!133210)) b!1438525))

(assert (= (and d!154797 c!133212) b!1438524))

(assert (= (and d!154797 (not c!133212)) b!1438526))

(assert (= (and b!1438526 res!971122) b!1438530))

(assert (= (and b!1438530 (not res!971121)) b!1438528))

(assert (= (and b!1438528 (not res!971125)) b!1438529))

(declare-fun m!1327671 () Bool)

(assert (=> b!1438528 m!1327671))

(assert (=> b!1438529 m!1327671))

(assert (=> d!154797 m!1327545))

(declare-fun m!1327673 () Bool)

(assert (=> d!154797 m!1327673))

(assert (=> d!154797 m!1327519))

(assert (=> b!1438530 m!1327671))

(assert (=> b!1438525 m!1327545))

(declare-fun m!1327675 () Bool)

(assert (=> b!1438525 m!1327675))

(assert (=> b!1438525 m!1327675))

(assert (=> b!1438525 m!1327543))

(declare-fun m!1327677 () Bool)

(assert (=> b!1438525 m!1327677))

(assert (=> b!1438338 d!154797))

(declare-fun d!154799 () Bool)

(declare-fun lt!632584 () (_ BitVec 32))

(declare-fun lt!632583 () (_ BitVec 32))

(assert (=> d!154799 (= lt!632584 (bvmul (bvxor lt!632583 (bvlshr lt!632583 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154799 (= lt!632583 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154799 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971115 (let ((h!35043 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129933 (bvmul (bvxor h!35043 (bvlshr h!35043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129933 (bvlshr x!129933 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971115 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971115 #b00000000000000000000000000000000))))))

(assert (=> d!154799 (= (toIndex!0 (select (store (arr!47198 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632584 (bvlshr lt!632584 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438338 d!154799))

(declare-fun d!154801 () Bool)

(assert (=> d!154801 (= (validKeyInArray!0 (select (arr!47198 a!2862) j!93)) (and (not (= (select (arr!47198 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47198 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438334 d!154801))

(declare-fun b!1438556 () Bool)

(declare-fun e!811486 () Bool)

(declare-fun call!67669 () Bool)

(assert (=> b!1438556 (= e!811486 call!67669)))

(declare-fun d!154803 () Bool)

(declare-fun res!971137 () Bool)

(declare-fun e!811483 () Bool)

(assert (=> d!154803 (=> res!971137 e!811483)))

(assert (=> d!154803 (= res!971137 (bvsge #b00000000000000000000000000000000 (size!47748 a!2862)))))

(assert (=> d!154803 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33696) e!811483)))

(declare-fun b!1438557 () Bool)

(declare-fun e!811485 () Bool)

(assert (=> b!1438557 (= e!811483 e!811485)))

(declare-fun res!971139 () Bool)

(assert (=> b!1438557 (=> (not res!971139) (not e!811485))))

(declare-fun e!811484 () Bool)

(assert (=> b!1438557 (= res!971139 (not e!811484))))

(declare-fun res!971138 () Bool)

(assert (=> b!1438557 (=> (not res!971138) (not e!811484))))

(assert (=> b!1438557 (= res!971138 (validKeyInArray!0 (select (arr!47198 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438558 () Bool)

(declare-fun contains!9892 (List!33699 (_ BitVec 64)) Bool)

(assert (=> b!1438558 (= e!811484 (contains!9892 Nil!33696 (select (arr!47198 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438559 () Bool)

(assert (=> b!1438559 (= e!811486 call!67669)))

(declare-fun b!1438560 () Bool)

(assert (=> b!1438560 (= e!811485 e!811486)))

(declare-fun c!133218 () Bool)

(assert (=> b!1438560 (= c!133218 (validKeyInArray!0 (select (arr!47198 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67666 () Bool)

(assert (=> bm!67666 (= call!67669 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133218 (Cons!33695 (select (arr!47198 a!2862) #b00000000000000000000000000000000) Nil!33696) Nil!33696)))))

(assert (= (and d!154803 (not res!971137)) b!1438557))

(assert (= (and b!1438557 res!971138) b!1438558))

(assert (= (and b!1438557 res!971139) b!1438560))

(assert (= (and b!1438560 c!133218) b!1438559))

(assert (= (and b!1438560 (not c!133218)) b!1438556))

(assert (= (or b!1438559 b!1438556) bm!67666))

(declare-fun m!1327687 () Bool)

(assert (=> b!1438557 m!1327687))

(assert (=> b!1438557 m!1327687))

(declare-fun m!1327689 () Bool)

(assert (=> b!1438557 m!1327689))

(assert (=> b!1438558 m!1327687))

(assert (=> b!1438558 m!1327687))

(declare-fun m!1327691 () Bool)

(assert (=> b!1438558 m!1327691))

(assert (=> b!1438560 m!1327687))

(assert (=> b!1438560 m!1327687))

(assert (=> b!1438560 m!1327689))

(assert (=> bm!67666 m!1327687))

(declare-fun m!1327693 () Bool)

(assert (=> bm!67666 m!1327693))

(assert (=> b!1438339 d!154803))

(declare-fun d!154809 () Bool)

(assert (=> d!154809 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124288 d!154809))

(declare-fun d!154815 () Bool)

(assert (=> d!154815 (= (array_inv!36226 a!2862) (bvsge (size!47748 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124288 d!154815))

(declare-fun b!1438587 () Bool)

(declare-fun e!811503 () Bool)

(declare-fun e!811504 () Bool)

(assert (=> b!1438587 (= e!811503 e!811504)))

(declare-fun c!133227 () Bool)

(assert (=> b!1438587 (= c!133227 (validKeyInArray!0 (select (arr!47198 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154817 () Bool)

(declare-fun res!971152 () Bool)

(assert (=> d!154817 (=> res!971152 e!811503)))

(assert (=> d!154817 (= res!971152 (bvsge #b00000000000000000000000000000000 (size!47748 a!2862)))))

(assert (=> d!154817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811503)))

(declare-fun b!1438588 () Bool)

(declare-fun e!811505 () Bool)

(declare-fun call!67672 () Bool)

(assert (=> b!1438588 (= e!811505 call!67672)))

(declare-fun b!1438589 () Bool)

(assert (=> b!1438589 (= e!811504 e!811505)))

(declare-fun lt!632606 () (_ BitVec 64))

(assert (=> b!1438589 (= lt!632606 (select (arr!47198 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48568 0))(
  ( (Unit!48569) )
))
(declare-fun lt!632605 () Unit!48568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97814 (_ BitVec 64) (_ BitVec 32)) Unit!48568)

(assert (=> b!1438589 (= lt!632605 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632606 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438589 (arrayContainsKey!0 a!2862 lt!632606 #b00000000000000000000000000000000)))

(declare-fun lt!632607 () Unit!48568)

(assert (=> b!1438589 (= lt!632607 lt!632605)))

(declare-fun res!971151 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97814 (_ BitVec 32)) SeekEntryResult!11450)

(assert (=> b!1438589 (= res!971151 (= (seekEntryOrOpen!0 (select (arr!47198 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11450 #b00000000000000000000000000000000)))))

(assert (=> b!1438589 (=> (not res!971151) (not e!811505))))

(declare-fun b!1438590 () Bool)

(assert (=> b!1438590 (= e!811504 call!67672)))

(declare-fun bm!67669 () Bool)

(assert (=> bm!67669 (= call!67672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!154817 (not res!971152)) b!1438587))

(assert (= (and b!1438587 c!133227) b!1438589))

(assert (= (and b!1438587 (not c!133227)) b!1438590))

(assert (= (and b!1438589 res!971151) b!1438588))

(assert (= (or b!1438588 b!1438590) bm!67669))

(assert (=> b!1438587 m!1327687))

(assert (=> b!1438587 m!1327687))

(assert (=> b!1438587 m!1327689))

(assert (=> b!1438589 m!1327687))

(declare-fun m!1327711 () Bool)

(assert (=> b!1438589 m!1327711))

(declare-fun m!1327713 () Bool)

(assert (=> b!1438589 m!1327713))

(assert (=> b!1438589 m!1327687))

(declare-fun m!1327715 () Bool)

(assert (=> b!1438589 m!1327715))

(declare-fun m!1327717 () Bool)

(assert (=> bm!67669 m!1327717))

(assert (=> b!1438333 d!154817))

(push 1)

(assert (not d!154797))

(assert (not b!1438557))

(assert (not b!1438560))

(assert (not b!1438525))

(assert (not b!1438589))

(assert (not b!1438510))

(assert (not bm!67669))

(assert (not b!1438493))

(assert (not b!1438587))

(assert (not d!154773))

(assert (not bm!67666))

(assert (not d!154795))

(assert (not b!1438558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

