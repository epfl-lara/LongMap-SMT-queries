; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124192 () Bool)

(assert start!124192)

(declare-fun b!1437604 () Bool)

(declare-fun e!811012 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!632159 () (_ BitVec 32))

(assert (=> b!1437604 (= e!811012 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632159 #b00000000000000000000000000000000) (bvsge lt!632159 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97735 0))(
  ( (array!97736 (arr!47161 (Array (_ BitVec 32) (_ BitVec 64))) (size!47713 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437604 (= lt!632159 (toIndex!0 (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437605 () Bool)

(declare-fun res!970507 () Bool)

(declare-fun e!811013 () Bool)

(assert (=> b!1437605 (=> (not res!970507) (not e!811013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437605 (= res!970507 (validKeyInArray!0 (select (arr!47161 a!2862) i!1006)))))

(declare-fun b!1437606 () Bool)

(declare-fun res!970499 () Bool)

(assert (=> b!1437606 (=> (not res!970499) (not e!811013))))

(assert (=> b!1437606 (= res!970499 (validKeyInArray!0 (select (arr!47161 a!2862) j!93)))))

(declare-fun b!1437607 () Bool)

(declare-fun res!970503 () Bool)

(assert (=> b!1437607 (=> (not res!970503) (not e!811013))))

(declare-datatypes ((List!33740 0))(
  ( (Nil!33737) (Cons!33736 (h!35077 (_ BitVec 64)) (t!48426 List!33740)) )
))
(declare-fun arrayNoDuplicates!0 (array!97735 (_ BitVec 32) List!33740) Bool)

(assert (=> b!1437607 (= res!970503 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33737))))

(declare-fun b!1437608 () Bool)

(assert (=> b!1437608 (= e!811013 e!811012)))

(declare-fun res!970505 () Bool)

(assert (=> b!1437608 (=> (not res!970505) (not e!811012))))

(declare-datatypes ((SeekEntryResult!11438 0))(
  ( (MissingZero!11438 (index!48144 (_ BitVec 32))) (Found!11438 (index!48145 (_ BitVec 32))) (Intermediate!11438 (undefined!12250 Bool) (index!48146 (_ BitVec 32)) (x!129872 (_ BitVec 32))) (Undefined!11438) (MissingVacant!11438 (index!48147 (_ BitVec 32))) )
))
(declare-fun lt!632160 () SeekEntryResult!11438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97735 (_ BitVec 32)) SeekEntryResult!11438)

(assert (=> b!1437608 (= res!970505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) (select (arr!47161 a!2862) j!93) a!2862 mask!2687) lt!632160))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437608 (= lt!632160 (Intermediate!11438 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437609 () Bool)

(declare-fun res!970500 () Bool)

(assert (=> b!1437609 (=> (not res!970500) (not e!811012))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437609 (= res!970500 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47161 a!2862) j!93) a!2862 mask!2687) lt!632160))))

(declare-fun b!1437610 () Bool)

(declare-fun res!970501 () Bool)

(assert (=> b!1437610 (=> (not res!970501) (not e!811013))))

(assert (=> b!1437610 (= res!970501 (and (= (size!47713 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47713 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47713 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!970502 () Bool)

(assert (=> start!124192 (=> (not res!970502) (not e!811013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124192 (= res!970502 (validMask!0 mask!2687))))

(assert (=> start!124192 e!811013))

(assert (=> start!124192 true))

(declare-fun array_inv!36394 (array!97735) Bool)

(assert (=> start!124192 (array_inv!36394 a!2862)))

(declare-fun b!1437611 () Bool)

(declare-fun res!970506 () Bool)

(assert (=> b!1437611 (=> (not res!970506) (not e!811013))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437611 (= res!970506 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47713 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47713 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47713 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437612 () Bool)

(declare-fun res!970504 () Bool)

(assert (=> b!1437612 (=> (not res!970504) (not e!811013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97735 (_ BitVec 32)) Bool)

(assert (=> b!1437612 (= res!970504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124192 res!970502) b!1437610))

(assert (= (and b!1437610 res!970501) b!1437605))

(assert (= (and b!1437605 res!970507) b!1437606))

(assert (= (and b!1437606 res!970499) b!1437612))

(assert (= (and b!1437612 res!970504) b!1437607))

(assert (= (and b!1437607 res!970503) b!1437611))

(assert (= (and b!1437611 res!970506) b!1437608))

(assert (= (and b!1437608 res!970505) b!1437609))

(assert (= (and b!1437609 res!970500) b!1437604))

(declare-fun m!1326375 () Bool)

(assert (=> b!1437611 m!1326375))

(declare-fun m!1326377 () Bool)

(assert (=> b!1437611 m!1326377))

(declare-fun m!1326379 () Bool)

(assert (=> start!124192 m!1326379))

(declare-fun m!1326381 () Bool)

(assert (=> start!124192 m!1326381))

(declare-fun m!1326383 () Bool)

(assert (=> b!1437608 m!1326383))

(assert (=> b!1437608 m!1326383))

(declare-fun m!1326385 () Bool)

(assert (=> b!1437608 m!1326385))

(assert (=> b!1437608 m!1326385))

(assert (=> b!1437608 m!1326383))

(declare-fun m!1326387 () Bool)

(assert (=> b!1437608 m!1326387))

(assert (=> b!1437609 m!1326383))

(assert (=> b!1437609 m!1326383))

(declare-fun m!1326389 () Bool)

(assert (=> b!1437609 m!1326389))

(declare-fun m!1326391 () Bool)

(assert (=> b!1437605 m!1326391))

(assert (=> b!1437605 m!1326391))

(declare-fun m!1326393 () Bool)

(assert (=> b!1437605 m!1326393))

(assert (=> b!1437604 m!1326375))

(declare-fun m!1326395 () Bool)

(assert (=> b!1437604 m!1326395))

(assert (=> b!1437604 m!1326395))

(declare-fun m!1326397 () Bool)

(assert (=> b!1437604 m!1326397))

(declare-fun m!1326399 () Bool)

(assert (=> b!1437607 m!1326399))

(declare-fun m!1326401 () Bool)

(assert (=> b!1437612 m!1326401))

(assert (=> b!1437606 m!1326383))

(assert (=> b!1437606 m!1326383))

(declare-fun m!1326403 () Bool)

(assert (=> b!1437606 m!1326403))

(check-sat (not b!1437608) (not b!1437607) (not start!124192) (not b!1437606) (not b!1437609) (not b!1437604) (not b!1437612) (not b!1437605))
(check-sat)
(get-model)

(declare-fun e!811063 () SeekEntryResult!11438)

(declare-fun b!1437708 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437708 (= e!811063 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47161 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!154517 () Bool)

(declare-fun e!811065 () Bool)

(assert (=> d!154517 e!811065))

(declare-fun c!133072 () Bool)

(declare-fun lt!632184 () SeekEntryResult!11438)

(get-info :version)

(assert (=> d!154517 (= c!133072 (and ((_ is Intermediate!11438) lt!632184) (undefined!12250 lt!632184)))))

(declare-fun e!811061 () SeekEntryResult!11438)

(assert (=> d!154517 (= lt!632184 e!811061)))

(declare-fun c!133073 () Bool)

(assert (=> d!154517 (= c!133073 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632183 () (_ BitVec 64))

(assert (=> d!154517 (= lt!632183 (select (arr!47161 a!2862) index!646))))

(assert (=> d!154517 (validMask!0 mask!2687)))

(assert (=> d!154517 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47161 a!2862) j!93) a!2862 mask!2687) lt!632184)))

(declare-fun b!1437709 () Bool)

(assert (=> b!1437709 (= e!811061 (Intermediate!11438 true index!646 x!665))))

(declare-fun b!1437710 () Bool)

(declare-fun e!811064 () Bool)

(assert (=> b!1437710 (= e!811065 e!811064)))

(declare-fun res!970583 () Bool)

(assert (=> b!1437710 (= res!970583 (and ((_ is Intermediate!11438) lt!632184) (not (undefined!12250 lt!632184)) (bvslt (x!129872 lt!632184) #b01111111111111111111111111111110) (bvsge (x!129872 lt!632184) #b00000000000000000000000000000000) (bvsge (x!129872 lt!632184) x!665)))))

(assert (=> b!1437710 (=> (not res!970583) (not e!811064))))

(declare-fun b!1437711 () Bool)

(assert (=> b!1437711 (= e!811063 (Intermediate!11438 false index!646 x!665))))

(declare-fun b!1437712 () Bool)

(assert (=> b!1437712 (and (bvsge (index!48146 lt!632184) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632184) (size!47713 a!2862)))))

(declare-fun e!811062 () Bool)

(assert (=> b!1437712 (= e!811062 (= (select (arr!47161 a!2862) (index!48146 lt!632184)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437713 () Bool)

(assert (=> b!1437713 (= e!811065 (bvsge (x!129872 lt!632184) #b01111111111111111111111111111110))))

(declare-fun b!1437714 () Bool)

(assert (=> b!1437714 (= e!811061 e!811063)))

(declare-fun c!133074 () Bool)

(assert (=> b!1437714 (= c!133074 (or (= lt!632183 (select (arr!47161 a!2862) j!93)) (= (bvadd lt!632183 lt!632183) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437715 () Bool)

(assert (=> b!1437715 (and (bvsge (index!48146 lt!632184) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632184) (size!47713 a!2862)))))

(declare-fun res!970581 () Bool)

(assert (=> b!1437715 (= res!970581 (= (select (arr!47161 a!2862) (index!48146 lt!632184)) (select (arr!47161 a!2862) j!93)))))

(assert (=> b!1437715 (=> res!970581 e!811062)))

(assert (=> b!1437715 (= e!811064 e!811062)))

(declare-fun b!1437716 () Bool)

(assert (=> b!1437716 (and (bvsge (index!48146 lt!632184) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632184) (size!47713 a!2862)))))

(declare-fun res!970582 () Bool)

(assert (=> b!1437716 (= res!970582 (= (select (arr!47161 a!2862) (index!48146 lt!632184)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437716 (=> res!970582 e!811062)))

(assert (= (and d!154517 c!133073) b!1437709))

(assert (= (and d!154517 (not c!133073)) b!1437714))

(assert (= (and b!1437714 c!133074) b!1437711))

(assert (= (and b!1437714 (not c!133074)) b!1437708))

(assert (= (and d!154517 c!133072) b!1437713))

(assert (= (and d!154517 (not c!133072)) b!1437710))

(assert (= (and b!1437710 res!970583) b!1437715))

(assert (= (and b!1437715 (not res!970581)) b!1437716))

(assert (= (and b!1437716 (not res!970582)) b!1437712))

(declare-fun m!1326473 () Bool)

(assert (=> b!1437708 m!1326473))

(assert (=> b!1437708 m!1326473))

(assert (=> b!1437708 m!1326383))

(declare-fun m!1326475 () Bool)

(assert (=> b!1437708 m!1326475))

(declare-fun m!1326477 () Bool)

(assert (=> b!1437716 m!1326477))

(declare-fun m!1326481 () Bool)

(assert (=> d!154517 m!1326481))

(assert (=> d!154517 m!1326379))

(assert (=> b!1437715 m!1326477))

(assert (=> b!1437712 m!1326477))

(assert (=> b!1437609 d!154517))

(declare-fun b!1437721 () Bool)

(declare-fun e!811071 () SeekEntryResult!11438)

(assert (=> b!1437721 (= e!811071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47161 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!154525 () Bool)

(declare-fun e!811073 () Bool)

(assert (=> d!154525 e!811073))

(declare-fun c!133076 () Bool)

(declare-fun lt!632189 () SeekEntryResult!11438)

(assert (=> d!154525 (= c!133076 (and ((_ is Intermediate!11438) lt!632189) (undefined!12250 lt!632189)))))

(declare-fun e!811069 () SeekEntryResult!11438)

(assert (=> d!154525 (= lt!632189 e!811069)))

(declare-fun c!133077 () Bool)

(assert (=> d!154525 (= c!133077 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632188 () (_ BitVec 64))

(assert (=> d!154525 (= lt!632188 (select (arr!47161 a!2862) (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687)))))

(assert (=> d!154525 (validMask!0 mask!2687)))

(assert (=> d!154525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) (select (arr!47161 a!2862) j!93) a!2862 mask!2687) lt!632189)))

(declare-fun b!1437722 () Bool)

(assert (=> b!1437722 (= e!811069 (Intermediate!11438 true (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437723 () Bool)

(declare-fun e!811072 () Bool)

(assert (=> b!1437723 (= e!811073 e!811072)))

(declare-fun res!970588 () Bool)

(assert (=> b!1437723 (= res!970588 (and ((_ is Intermediate!11438) lt!632189) (not (undefined!12250 lt!632189)) (bvslt (x!129872 lt!632189) #b01111111111111111111111111111110) (bvsge (x!129872 lt!632189) #b00000000000000000000000000000000) (bvsge (x!129872 lt!632189) #b00000000000000000000000000000000)))))

(assert (=> b!1437723 (=> (not res!970588) (not e!811072))))

(declare-fun b!1437724 () Bool)

(assert (=> b!1437724 (= e!811071 (Intermediate!11438 false (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437725 () Bool)

(assert (=> b!1437725 (and (bvsge (index!48146 lt!632189) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632189) (size!47713 a!2862)))))

(declare-fun e!811070 () Bool)

(assert (=> b!1437725 (= e!811070 (= (select (arr!47161 a!2862) (index!48146 lt!632189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437726 () Bool)

(assert (=> b!1437726 (= e!811073 (bvsge (x!129872 lt!632189) #b01111111111111111111111111111110))))

(declare-fun b!1437727 () Bool)

(assert (=> b!1437727 (= e!811069 e!811071)))

(declare-fun c!133078 () Bool)

(assert (=> b!1437727 (= c!133078 (or (= lt!632188 (select (arr!47161 a!2862) j!93)) (= (bvadd lt!632188 lt!632188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437728 () Bool)

(assert (=> b!1437728 (and (bvsge (index!48146 lt!632189) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632189) (size!47713 a!2862)))))

(declare-fun res!970586 () Bool)

(assert (=> b!1437728 (= res!970586 (= (select (arr!47161 a!2862) (index!48146 lt!632189)) (select (arr!47161 a!2862) j!93)))))

(assert (=> b!1437728 (=> res!970586 e!811070)))

(assert (=> b!1437728 (= e!811072 e!811070)))

(declare-fun b!1437729 () Bool)

(assert (=> b!1437729 (and (bvsge (index!48146 lt!632189) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632189) (size!47713 a!2862)))))

(declare-fun res!970587 () Bool)

(assert (=> b!1437729 (= res!970587 (= (select (arr!47161 a!2862) (index!48146 lt!632189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437729 (=> res!970587 e!811070)))

(assert (= (and d!154525 c!133077) b!1437722))

(assert (= (and d!154525 (not c!133077)) b!1437727))

(assert (= (and b!1437727 c!133078) b!1437724))

(assert (= (and b!1437727 (not c!133078)) b!1437721))

(assert (= (and d!154525 c!133076) b!1437726))

(assert (= (and d!154525 (not c!133076)) b!1437723))

(assert (= (and b!1437723 res!970588) b!1437728))

(assert (= (and b!1437728 (not res!970586)) b!1437729))

(assert (= (and b!1437729 (not res!970587)) b!1437725))

(assert (=> b!1437721 m!1326385))

(declare-fun m!1326493 () Bool)

(assert (=> b!1437721 m!1326493))

(assert (=> b!1437721 m!1326493))

(assert (=> b!1437721 m!1326383))

(declare-fun m!1326495 () Bool)

(assert (=> b!1437721 m!1326495))

(declare-fun m!1326497 () Bool)

(assert (=> b!1437729 m!1326497))

(assert (=> d!154525 m!1326385))

(declare-fun m!1326499 () Bool)

(assert (=> d!154525 m!1326499))

(assert (=> d!154525 m!1326379))

(assert (=> b!1437728 m!1326497))

(assert (=> b!1437725 m!1326497))

(assert (=> b!1437608 d!154525))

(declare-fun d!154529 () Bool)

(declare-fun lt!632195 () (_ BitVec 32))

(declare-fun lt!632194 () (_ BitVec 32))

(assert (=> d!154529 (= lt!632195 (bvmul (bvxor lt!632194 (bvlshr lt!632194 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154529 (= lt!632194 ((_ extract 31 0) (bvand (bvxor (select (arr!47161 a!2862) j!93) (bvlshr (select (arr!47161 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154529 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970589 (let ((h!35080 ((_ extract 31 0) (bvand (bvxor (select (arr!47161 a!2862) j!93) (bvlshr (select (arr!47161 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129876 (bvmul (bvxor h!35080 (bvlshr h!35080 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129876 (bvlshr x!129876 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970589 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970589 #b00000000000000000000000000000000))))))

(assert (=> d!154529 (= (toIndex!0 (select (arr!47161 a!2862) j!93) mask!2687) (bvand (bvxor lt!632195 (bvlshr lt!632195 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437608 d!154529))

(declare-fun d!154531 () Bool)

(assert (=> d!154531 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124192 d!154531))

(declare-fun d!154541 () Bool)

(assert (=> d!154541 (= (array_inv!36394 a!2862) (bvsge (size!47713 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124192 d!154541))

(declare-fun b!1437757 () Bool)

(declare-fun e!811097 () Bool)

(declare-fun call!67625 () Bool)

(assert (=> b!1437757 (= e!811097 call!67625)))

(declare-fun d!154543 () Bool)

(declare-fun res!970607 () Bool)

(declare-fun e!811094 () Bool)

(assert (=> d!154543 (=> res!970607 e!811094)))

(assert (=> d!154543 (= res!970607 (bvsge #b00000000000000000000000000000000 (size!47713 a!2862)))))

(assert (=> d!154543 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33737) e!811094)))

(declare-fun b!1437758 () Bool)

(assert (=> b!1437758 (= e!811097 call!67625)))

(declare-fun b!1437759 () Bool)

(declare-fun e!811096 () Bool)

(assert (=> b!1437759 (= e!811096 e!811097)))

(declare-fun c!133084 () Bool)

(assert (=> b!1437759 (= c!133084 (validKeyInArray!0 (select (arr!47161 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67622 () Bool)

(assert (=> bm!67622 (= call!67625 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133084 (Cons!33736 (select (arr!47161 a!2862) #b00000000000000000000000000000000) Nil!33737) Nil!33737)))))

(declare-fun b!1437760 () Bool)

(assert (=> b!1437760 (= e!811094 e!811096)))

(declare-fun res!970606 () Bool)

(assert (=> b!1437760 (=> (not res!970606) (not e!811096))))

(declare-fun e!811095 () Bool)

(assert (=> b!1437760 (= res!970606 (not e!811095))))

(declare-fun res!970608 () Bool)

(assert (=> b!1437760 (=> (not res!970608) (not e!811095))))

(assert (=> b!1437760 (= res!970608 (validKeyInArray!0 (select (arr!47161 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437761 () Bool)

(declare-fun contains!9852 (List!33740 (_ BitVec 64)) Bool)

(assert (=> b!1437761 (= e!811095 (contains!9852 Nil!33737 (select (arr!47161 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154543 (not res!970607)) b!1437760))

(assert (= (and b!1437760 res!970608) b!1437761))

(assert (= (and b!1437760 res!970606) b!1437759))

(assert (= (and b!1437759 c!133084) b!1437758))

(assert (= (and b!1437759 (not c!133084)) b!1437757))

(assert (= (or b!1437758 b!1437757) bm!67622))

(declare-fun m!1326505 () Bool)

(assert (=> b!1437759 m!1326505))

(assert (=> b!1437759 m!1326505))

(declare-fun m!1326507 () Bool)

(assert (=> b!1437759 m!1326507))

(assert (=> bm!67622 m!1326505))

(declare-fun m!1326509 () Bool)

(assert (=> bm!67622 m!1326509))

(assert (=> b!1437760 m!1326505))

(assert (=> b!1437760 m!1326505))

(assert (=> b!1437760 m!1326507))

(assert (=> b!1437761 m!1326505))

(assert (=> b!1437761 m!1326505))

(declare-fun m!1326511 () Bool)

(assert (=> b!1437761 m!1326511))

(assert (=> b!1437607 d!154543))

(declare-fun b!1437804 () Bool)

(declare-fun e!811126 () Bool)

(declare-fun call!67628 () Bool)

(assert (=> b!1437804 (= e!811126 call!67628)))

(declare-fun b!1437805 () Bool)

(declare-fun e!811125 () Bool)

(assert (=> b!1437805 (= e!811125 e!811126)))

(declare-fun c!133099 () Bool)

(assert (=> b!1437805 (= c!133099 (validKeyInArray!0 (select (arr!47161 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437806 () Bool)

(declare-fun e!811124 () Bool)

(assert (=> b!1437806 (= e!811124 call!67628)))

(declare-fun d!154551 () Bool)

(declare-fun res!970627 () Bool)

(assert (=> d!154551 (=> res!970627 e!811125)))

(assert (=> d!154551 (= res!970627 (bvsge #b00000000000000000000000000000000 (size!47713 a!2862)))))

(assert (=> d!154551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811125)))

(declare-fun b!1437807 () Bool)

(assert (=> b!1437807 (= e!811126 e!811124)))

(declare-fun lt!632216 () (_ BitVec 64))

(assert (=> b!1437807 (= lt!632216 (select (arr!47161 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48401 0))(
  ( (Unit!48402) )
))
(declare-fun lt!632218 () Unit!48401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97735 (_ BitVec 64) (_ BitVec 32)) Unit!48401)

(assert (=> b!1437807 (= lt!632218 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632216 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1437807 (arrayContainsKey!0 a!2862 lt!632216 #b00000000000000000000000000000000)))

(declare-fun lt!632217 () Unit!48401)

(assert (=> b!1437807 (= lt!632217 lt!632218)))

(declare-fun res!970626 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97735 (_ BitVec 32)) SeekEntryResult!11438)

(assert (=> b!1437807 (= res!970626 (= (seekEntryOrOpen!0 (select (arr!47161 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11438 #b00000000000000000000000000000000)))))

(assert (=> b!1437807 (=> (not res!970626) (not e!811124))))

(declare-fun bm!67625 () Bool)

(assert (=> bm!67625 (= call!67628 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!154551 (not res!970627)) b!1437805))

(assert (= (and b!1437805 c!133099) b!1437807))

(assert (= (and b!1437805 (not c!133099)) b!1437804))

(assert (= (and b!1437807 res!970626) b!1437806))

(assert (= (or b!1437806 b!1437804) bm!67625))

(assert (=> b!1437805 m!1326505))

(assert (=> b!1437805 m!1326505))

(assert (=> b!1437805 m!1326507))

(assert (=> b!1437807 m!1326505))

(declare-fun m!1326529 () Bool)

(assert (=> b!1437807 m!1326529))

(declare-fun m!1326531 () Bool)

(assert (=> b!1437807 m!1326531))

(assert (=> b!1437807 m!1326505))

(declare-fun m!1326533 () Bool)

(assert (=> b!1437807 m!1326533))

(declare-fun m!1326535 () Bool)

(assert (=> bm!67625 m!1326535))

(assert (=> b!1437612 d!154551))

(declare-fun d!154557 () Bool)

(assert (=> d!154557 (= (validKeyInArray!0 (select (arr!47161 a!2862) j!93)) (and (not (= (select (arr!47161 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47161 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437606 d!154557))

(declare-fun d!154559 () Bool)

(assert (=> d!154559 (= (validKeyInArray!0 (select (arr!47161 a!2862) i!1006)) (and (not (= (select (arr!47161 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47161 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437605 d!154559))

(declare-fun d!154561 () Bool)

(declare-fun lt!632224 () (_ BitVec 32))

(declare-fun lt!632223 () (_ BitVec 32))

(assert (=> d!154561 (= lt!632224 (bvmul (bvxor lt!632223 (bvlshr lt!632223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154561 (= lt!632223 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154561 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970589 (let ((h!35080 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129876 (bvmul (bvxor h!35080 (bvlshr h!35080 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129876 (bvlshr x!129876 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970589 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970589 #b00000000000000000000000000000000))))))

(assert (=> d!154561 (= (toIndex!0 (select (store (arr!47161 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632224 (bvlshr lt!632224 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437604 d!154561))

(check-sat (not b!1437805) (not b!1437760) (not d!154525) (not b!1437807) (not b!1437761) (not d!154517) (not b!1437759) (not bm!67625) (not bm!67622) (not b!1437721) (not b!1437708))
(check-sat)
