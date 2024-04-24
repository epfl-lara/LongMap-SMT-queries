; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52104 () Bool)

(assert start!52104)

(declare-fun b!568661 () Bool)

(declare-fun res!358765 () Bool)

(declare-fun e!327218 () Bool)

(assert (=> b!568661 (=> (not res!358765) (not e!327218))))

(declare-datatypes ((array!35631 0))(
  ( (array!35632 (arr!17107 (Array (_ BitVec 32) (_ BitVec 64))) (size!17471 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35631)

(declare-datatypes ((List!11094 0))(
  ( (Nil!11091) (Cons!11090 (h!12111 (_ BitVec 64)) (t!17314 List!11094)) )
))
(declare-fun arrayNoDuplicates!0 (array!35631 (_ BitVec 32) List!11094) Bool)

(assert (=> b!568661 (= res!358765 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11091))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!568662 () Bool)

(declare-datatypes ((SeekEntryResult!5512 0))(
  ( (MissingZero!5512 (index!24275 (_ BitVec 32))) (Found!5512 (index!24276 (_ BitVec 32))) (Intermediate!5512 (undefined!6324 Bool) (index!24277 (_ BitVec 32)) (x!53304 (_ BitVec 32))) (Undefined!5512) (MissingVacant!5512 (index!24278 (_ BitVec 32))) )
))
(declare-fun lt!259067 () SeekEntryResult!5512)

(declare-fun e!327217 () Bool)

(declare-fun lt!259068 () SeekEntryResult!5512)

(get-info :version)

(assert (=> b!568662 (= e!327217 (not (or (not ((_ is Intermediate!5512) lt!259067)) (undefined!6324 lt!259067) (= (select (arr!17107 a!3118) (index!24277 lt!259067)) (select (arr!17107 a!3118) j!142)) (not (= (select (arr!17107 a!3118) (index!24277 lt!259067)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259068 (MissingZero!5512 (index!24277 lt!259067))))))))

(assert (=> b!568662 (= lt!259068 (Found!5512 j!142))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35631 (_ BitVec 32)) SeekEntryResult!5512)

(assert (=> b!568662 (= lt!259068 (seekEntryOrOpen!0 (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35631 (_ BitVec 32)) Bool)

(assert (=> b!568662 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17797 0))(
  ( (Unit!17798) )
))
(declare-fun lt!259071 () Unit!17797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17797)

(assert (=> b!568662 (= lt!259071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568663 () Bool)

(declare-fun res!358760 () Bool)

(declare-fun e!327219 () Bool)

(assert (=> b!568663 (=> (not res!358760) (not e!327219))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568663 (= res!358760 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568664 () Bool)

(assert (=> b!568664 (= e!327218 e!327217)))

(declare-fun res!358764 () Bool)

(assert (=> b!568664 (=> (not res!358764) (not e!327217))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!259069 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35631 (_ BitVec 32)) SeekEntryResult!5512)

(assert (=> b!568664 (= res!358764 (= lt!259067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259069 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)) mask!3119)))))

(declare-fun lt!259072 () (_ BitVec 32))

(assert (=> b!568664 (= lt!259067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259072 (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568664 (= lt!259069 (toIndex!0 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568664 (= lt!259072 (toIndex!0 (select (arr!17107 a!3118) j!142) mask!3119))))

(declare-fun b!568665 () Bool)

(declare-fun res!358762 () Bool)

(assert (=> b!568665 (=> (not res!358762) (not e!327219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568665 (= res!358762 (validKeyInArray!0 k0!1914))))

(declare-fun res!358757 () Bool)

(assert (=> start!52104 (=> (not res!358757) (not e!327219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52104 (= res!358757 (validMask!0 mask!3119))))

(assert (=> start!52104 e!327219))

(assert (=> start!52104 true))

(declare-fun array_inv!12966 (array!35631) Bool)

(assert (=> start!52104 (array_inv!12966 a!3118)))

(declare-fun b!568666 () Bool)

(declare-fun res!358763 () Bool)

(assert (=> b!568666 (=> (not res!358763) (not e!327219))))

(assert (=> b!568666 (= res!358763 (validKeyInArray!0 (select (arr!17107 a!3118) j!142)))))

(declare-fun b!568667 () Bool)

(assert (=> b!568667 (= e!327219 e!327218)))

(declare-fun res!358759 () Bool)

(assert (=> b!568667 (=> (not res!358759) (not e!327218))))

(declare-fun lt!259070 () SeekEntryResult!5512)

(assert (=> b!568667 (= res!358759 (or (= lt!259070 (MissingZero!5512 i!1132)) (= lt!259070 (MissingVacant!5512 i!1132))))))

(assert (=> b!568667 (= lt!259070 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568668 () Bool)

(declare-fun res!358758 () Bool)

(assert (=> b!568668 (=> (not res!358758) (not e!327219))))

(assert (=> b!568668 (= res!358758 (and (= (size!17471 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17471 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17471 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568669 () Bool)

(declare-fun res!358761 () Bool)

(assert (=> b!568669 (=> (not res!358761) (not e!327218))))

(assert (=> b!568669 (= res!358761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52104 res!358757) b!568668))

(assert (= (and b!568668 res!358758) b!568666))

(assert (= (and b!568666 res!358763) b!568665))

(assert (= (and b!568665 res!358762) b!568663))

(assert (= (and b!568663 res!358760) b!568667))

(assert (= (and b!568667 res!358759) b!568669))

(assert (= (and b!568669 res!358761) b!568661))

(assert (= (and b!568661 res!358765) b!568664))

(assert (= (and b!568664 res!358764) b!568662))

(declare-fun m!547337 () Bool)

(assert (=> b!568661 m!547337))

(declare-fun m!547339 () Bool)

(assert (=> b!568665 m!547339))

(declare-fun m!547341 () Bool)

(assert (=> b!568666 m!547341))

(assert (=> b!568666 m!547341))

(declare-fun m!547343 () Bool)

(assert (=> b!568666 m!547343))

(declare-fun m!547345 () Bool)

(assert (=> b!568667 m!547345))

(declare-fun m!547347 () Bool)

(assert (=> b!568663 m!547347))

(assert (=> b!568664 m!547341))

(declare-fun m!547349 () Bool)

(assert (=> b!568664 m!547349))

(assert (=> b!568664 m!547341))

(declare-fun m!547351 () Bool)

(assert (=> b!568664 m!547351))

(assert (=> b!568664 m!547341))

(declare-fun m!547353 () Bool)

(assert (=> b!568664 m!547353))

(assert (=> b!568664 m!547353))

(declare-fun m!547355 () Bool)

(assert (=> b!568664 m!547355))

(declare-fun m!547357 () Bool)

(assert (=> b!568664 m!547357))

(assert (=> b!568664 m!547353))

(declare-fun m!547359 () Bool)

(assert (=> b!568664 m!547359))

(declare-fun m!547361 () Bool)

(assert (=> start!52104 m!547361))

(declare-fun m!547363 () Bool)

(assert (=> start!52104 m!547363))

(assert (=> b!568662 m!547341))

(declare-fun m!547365 () Bool)

(assert (=> b!568662 m!547365))

(declare-fun m!547367 () Bool)

(assert (=> b!568662 m!547367))

(declare-fun m!547369 () Bool)

(assert (=> b!568662 m!547369))

(assert (=> b!568662 m!547341))

(declare-fun m!547371 () Bool)

(assert (=> b!568662 m!547371))

(declare-fun m!547373 () Bool)

(assert (=> b!568669 m!547373))

(check-sat (not b!568667) (not b!568662) (not b!568663) (not b!568666) (not b!568665) (not b!568669) (not b!568664) (not b!568661) (not start!52104))
(check-sat)
(get-model)

(declare-fun d!84593 () Bool)

(declare-fun res!358824 () Bool)

(declare-fun e!327248 () Bool)

(assert (=> d!84593 (=> res!358824 e!327248)))

(assert (=> d!84593 (= res!358824 (= (select (arr!17107 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84593 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!327248)))

(declare-fun b!568728 () Bool)

(declare-fun e!327249 () Bool)

(assert (=> b!568728 (= e!327248 e!327249)))

(declare-fun res!358825 () Bool)

(assert (=> b!568728 (=> (not res!358825) (not e!327249))))

(assert (=> b!568728 (= res!358825 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17471 a!3118)))))

(declare-fun b!568729 () Bool)

(assert (=> b!568729 (= e!327249 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84593 (not res!358824)) b!568728))

(assert (= (and b!568728 res!358825) b!568729))

(declare-fun m!547451 () Bool)

(assert (=> d!84593 m!547451))

(declare-fun m!547453 () Bool)

(assert (=> b!568729 m!547453))

(assert (=> b!568663 d!84593))

(declare-fun b!568738 () Bool)

(declare-fun e!327256 () Bool)

(declare-fun e!327257 () Bool)

(assert (=> b!568738 (= e!327256 e!327257)))

(declare-fun lt!259117 () (_ BitVec 64))

(assert (=> b!568738 (= lt!259117 (select (arr!17107 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!259116 () Unit!17797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35631 (_ BitVec 64) (_ BitVec 32)) Unit!17797)

(assert (=> b!568738 (= lt!259116 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259117 #b00000000000000000000000000000000))))

(assert (=> b!568738 (arrayContainsKey!0 a!3118 lt!259117 #b00000000000000000000000000000000)))

(declare-fun lt!259115 () Unit!17797)

(assert (=> b!568738 (= lt!259115 lt!259116)))

(declare-fun res!358830 () Bool)

(assert (=> b!568738 (= res!358830 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5512 #b00000000000000000000000000000000)))))

(assert (=> b!568738 (=> (not res!358830) (not e!327257))))

(declare-fun b!568739 () Bool)

(declare-fun call!32568 () Bool)

(assert (=> b!568739 (= e!327257 call!32568)))

(declare-fun b!568740 () Bool)

(declare-fun e!327258 () Bool)

(assert (=> b!568740 (= e!327258 e!327256)))

(declare-fun c!65309 () Bool)

(assert (=> b!568740 (= c!65309 (validKeyInArray!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568741 () Bool)

(assert (=> b!568741 (= e!327256 call!32568)))

(declare-fun d!84595 () Bool)

(declare-fun res!358831 () Bool)

(assert (=> d!84595 (=> res!358831 e!327258)))

(assert (=> d!84595 (= res!358831 (bvsge #b00000000000000000000000000000000 (size!17471 a!3118)))))

(assert (=> d!84595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327258)))

(declare-fun bm!32565 () Bool)

(assert (=> bm!32565 (= call!32568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84595 (not res!358831)) b!568740))

(assert (= (and b!568740 c!65309) b!568738))

(assert (= (and b!568740 (not c!65309)) b!568741))

(assert (= (and b!568738 res!358830) b!568739))

(assert (= (or b!568739 b!568741) bm!32565))

(assert (=> b!568738 m!547451))

(declare-fun m!547455 () Bool)

(assert (=> b!568738 m!547455))

(declare-fun m!547457 () Bool)

(assert (=> b!568738 m!547457))

(assert (=> b!568738 m!547451))

(declare-fun m!547459 () Bool)

(assert (=> b!568738 m!547459))

(assert (=> b!568740 m!547451))

(assert (=> b!568740 m!547451))

(declare-fun m!547461 () Bool)

(assert (=> b!568740 m!547461))

(declare-fun m!547463 () Bool)

(assert (=> bm!32565 m!547463))

(assert (=> b!568669 d!84595))

(declare-fun b!568778 () Bool)

(declare-fun e!327288 () SeekEntryResult!5512)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568778 (= e!327288 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259069 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)) mask!3119))))

(declare-fun b!568779 () Bool)

(declare-fun e!327284 () Bool)

(declare-fun lt!259131 () SeekEntryResult!5512)

(assert (=> b!568779 (= e!327284 (bvsge (x!53304 lt!259131) #b01111111111111111111111111111110))))

(declare-fun b!568780 () Bool)

(assert (=> b!568780 (and (bvsge (index!24277 lt!259131) #b00000000000000000000000000000000) (bvslt (index!24277 lt!259131) (size!17471 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)))))))

(declare-fun res!358851 () Bool)

(assert (=> b!568780 (= res!358851 (= (select (arr!17107 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) (index!24277 lt!259131)) (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!327287 () Bool)

(assert (=> b!568780 (=> res!358851 e!327287)))

(declare-fun e!327285 () Bool)

(assert (=> b!568780 (= e!327285 e!327287)))

(declare-fun b!568781 () Bool)

(assert (=> b!568781 (= e!327288 (Intermediate!5512 false lt!259069 #b00000000000000000000000000000000))))

(declare-fun b!568783 () Bool)

(assert (=> b!568783 (and (bvsge (index!24277 lt!259131) #b00000000000000000000000000000000) (bvslt (index!24277 lt!259131) (size!17471 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)))))))

(declare-fun res!358852 () Bool)

(assert (=> b!568783 (= res!358852 (= (select (arr!17107 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) (index!24277 lt!259131)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568783 (=> res!358852 e!327287)))

(declare-fun b!568784 () Bool)

(declare-fun e!327286 () SeekEntryResult!5512)

(assert (=> b!568784 (= e!327286 (Intermediate!5512 true lt!259069 #b00000000000000000000000000000000))))

(declare-fun b!568785 () Bool)

(assert (=> b!568785 (= e!327284 e!327285)))

(declare-fun res!358850 () Bool)

(assert (=> b!568785 (= res!358850 (and ((_ is Intermediate!5512) lt!259131) (not (undefined!6324 lt!259131)) (bvslt (x!53304 lt!259131) #b01111111111111111111111111111110) (bvsge (x!53304 lt!259131) #b00000000000000000000000000000000) (bvsge (x!53304 lt!259131) #b00000000000000000000000000000000)))))

(assert (=> b!568785 (=> (not res!358850) (not e!327285))))

(declare-fun b!568786 () Bool)

(assert (=> b!568786 (= e!327286 e!327288)))

(declare-fun c!65320 () Bool)

(declare-fun lt!259132 () (_ BitVec 64))

(assert (=> b!568786 (= c!65320 (or (= lt!259132 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!259132 lt!259132) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84599 () Bool)

(assert (=> d!84599 e!327284))

(declare-fun c!65319 () Bool)

(assert (=> d!84599 (= c!65319 (and ((_ is Intermediate!5512) lt!259131) (undefined!6324 lt!259131)))))

(assert (=> d!84599 (= lt!259131 e!327286)))

(declare-fun c!65321 () Bool)

(assert (=> d!84599 (= c!65321 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84599 (= lt!259132 (select (arr!17107 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) lt!259069))))

(assert (=> d!84599 (validMask!0 mask!3119)))

(assert (=> d!84599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259069 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)) mask!3119) lt!259131)))

(declare-fun b!568782 () Bool)

(assert (=> b!568782 (and (bvsge (index!24277 lt!259131) #b00000000000000000000000000000000) (bvslt (index!24277 lt!259131) (size!17471 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118)))))))

(assert (=> b!568782 (= e!327287 (= (select (arr!17107 (array!35632 (store (arr!17107 a!3118) i!1132 k0!1914) (size!17471 a!3118))) (index!24277 lt!259131)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!84599 c!65321) b!568784))

(assert (= (and d!84599 (not c!65321)) b!568786))

(assert (= (and b!568786 c!65320) b!568781))

(assert (= (and b!568786 (not c!65320)) b!568778))

(assert (= (and d!84599 c!65319) b!568779))

(assert (= (and d!84599 (not c!65319)) b!568785))

(assert (= (and b!568785 res!358850) b!568780))

(assert (= (and b!568780 (not res!358851)) b!568783))

(assert (= (and b!568783 (not res!358852)) b!568782))

(declare-fun m!547481 () Bool)

(assert (=> b!568782 m!547481))

(declare-fun m!547483 () Bool)

(assert (=> b!568778 m!547483))

(assert (=> b!568778 m!547483))

(assert (=> b!568778 m!547353))

(declare-fun m!547485 () Bool)

(assert (=> b!568778 m!547485))

(assert (=> b!568780 m!547481))

(assert (=> b!568783 m!547481))

(declare-fun m!547487 () Bool)

(assert (=> d!84599 m!547487))

(assert (=> d!84599 m!547361))

(assert (=> b!568664 d!84599))

(declare-fun e!327293 () SeekEntryResult!5512)

(declare-fun b!568787 () Bool)

(assert (=> b!568787 (= e!327293 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259072 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568788 () Bool)

(declare-fun e!327289 () Bool)

(declare-fun lt!259133 () SeekEntryResult!5512)

(assert (=> b!568788 (= e!327289 (bvsge (x!53304 lt!259133) #b01111111111111111111111111111110))))

(declare-fun b!568789 () Bool)

(assert (=> b!568789 (and (bvsge (index!24277 lt!259133) #b00000000000000000000000000000000) (bvslt (index!24277 lt!259133) (size!17471 a!3118)))))

(declare-fun res!358854 () Bool)

(assert (=> b!568789 (= res!358854 (= (select (arr!17107 a!3118) (index!24277 lt!259133)) (select (arr!17107 a!3118) j!142)))))

(declare-fun e!327292 () Bool)

(assert (=> b!568789 (=> res!358854 e!327292)))

(declare-fun e!327290 () Bool)

(assert (=> b!568789 (= e!327290 e!327292)))

(declare-fun b!568790 () Bool)

(assert (=> b!568790 (= e!327293 (Intermediate!5512 false lt!259072 #b00000000000000000000000000000000))))

(declare-fun b!568792 () Bool)

(assert (=> b!568792 (and (bvsge (index!24277 lt!259133) #b00000000000000000000000000000000) (bvslt (index!24277 lt!259133) (size!17471 a!3118)))))

(declare-fun res!358855 () Bool)

(assert (=> b!568792 (= res!358855 (= (select (arr!17107 a!3118) (index!24277 lt!259133)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568792 (=> res!358855 e!327292)))

(declare-fun b!568793 () Bool)

(declare-fun e!327291 () SeekEntryResult!5512)

(assert (=> b!568793 (= e!327291 (Intermediate!5512 true lt!259072 #b00000000000000000000000000000000))))

(declare-fun b!568794 () Bool)

(assert (=> b!568794 (= e!327289 e!327290)))

(declare-fun res!358853 () Bool)

(assert (=> b!568794 (= res!358853 (and ((_ is Intermediate!5512) lt!259133) (not (undefined!6324 lt!259133)) (bvslt (x!53304 lt!259133) #b01111111111111111111111111111110) (bvsge (x!53304 lt!259133) #b00000000000000000000000000000000) (bvsge (x!53304 lt!259133) #b00000000000000000000000000000000)))))

(assert (=> b!568794 (=> (not res!358853) (not e!327290))))

(declare-fun b!568795 () Bool)

(assert (=> b!568795 (= e!327291 e!327293)))

(declare-fun lt!259134 () (_ BitVec 64))

(declare-fun c!65323 () Bool)

(assert (=> b!568795 (= c!65323 (or (= lt!259134 (select (arr!17107 a!3118) j!142)) (= (bvadd lt!259134 lt!259134) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84607 () Bool)

(assert (=> d!84607 e!327289))

(declare-fun c!65322 () Bool)

(assert (=> d!84607 (= c!65322 (and ((_ is Intermediate!5512) lt!259133) (undefined!6324 lt!259133)))))

(assert (=> d!84607 (= lt!259133 e!327291)))

(declare-fun c!65324 () Bool)

(assert (=> d!84607 (= c!65324 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84607 (= lt!259134 (select (arr!17107 a!3118) lt!259072))))

(assert (=> d!84607 (validMask!0 mask!3119)))

(assert (=> d!84607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259072 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) lt!259133)))

(declare-fun b!568791 () Bool)

(assert (=> b!568791 (and (bvsge (index!24277 lt!259133) #b00000000000000000000000000000000) (bvslt (index!24277 lt!259133) (size!17471 a!3118)))))

(assert (=> b!568791 (= e!327292 (= (select (arr!17107 a!3118) (index!24277 lt!259133)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!84607 c!65324) b!568793))

(assert (= (and d!84607 (not c!65324)) b!568795))

(assert (= (and b!568795 c!65323) b!568790))

(assert (= (and b!568795 (not c!65323)) b!568787))

(assert (= (and d!84607 c!65322) b!568788))

(assert (= (and d!84607 (not c!65322)) b!568794))

(assert (= (and b!568794 res!358853) b!568789))

(assert (= (and b!568789 (not res!358854)) b!568792))

(assert (= (and b!568792 (not res!358855)) b!568791))

(declare-fun m!547489 () Bool)

(assert (=> b!568791 m!547489))

(declare-fun m!547491 () Bool)

(assert (=> b!568787 m!547491))

(assert (=> b!568787 m!547491))

(assert (=> b!568787 m!547341))

(declare-fun m!547493 () Bool)

(assert (=> b!568787 m!547493))

(assert (=> b!568789 m!547489))

(assert (=> b!568792 m!547489))

(declare-fun m!547495 () Bool)

(assert (=> d!84607 m!547495))

(assert (=> d!84607 m!547361))

(assert (=> b!568664 d!84607))

(declare-fun d!84609 () Bool)

(declare-fun lt!259155 () (_ BitVec 32))

(declare-fun lt!259154 () (_ BitVec 32))

(assert (=> d!84609 (= lt!259155 (bvmul (bvxor lt!259154 (bvlshr lt!259154 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84609 (= lt!259154 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84609 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358856 (let ((h!12114 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53308 (bvmul (bvxor h!12114 (bvlshr h!12114 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53308 (bvlshr x!53308 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358856 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358856 #b00000000000000000000000000000000))))))

(assert (=> d!84609 (= (toIndex!0 (select (store (arr!17107 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!259155 (bvlshr lt!259155 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568664 d!84609))

(declare-fun d!84611 () Bool)

(declare-fun lt!259157 () (_ BitVec 32))

(declare-fun lt!259156 () (_ BitVec 32))

(assert (=> d!84611 (= lt!259157 (bvmul (bvxor lt!259156 (bvlshr lt!259156 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84611 (= lt!259156 ((_ extract 31 0) (bvand (bvxor (select (arr!17107 a!3118) j!142) (bvlshr (select (arr!17107 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84611 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358856 (let ((h!12114 ((_ extract 31 0) (bvand (bvxor (select (arr!17107 a!3118) j!142) (bvlshr (select (arr!17107 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53308 (bvmul (bvxor h!12114 (bvlshr h!12114 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53308 (bvlshr x!53308 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358856 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358856 #b00000000000000000000000000000000))))))

(assert (=> d!84611 (= (toIndex!0 (select (arr!17107 a!3118) j!142) mask!3119) (bvand (bvxor lt!259157 (bvlshr lt!259157 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568664 d!84611))

(declare-fun d!84615 () Bool)

(assert (=> d!84615 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568665 d!84615))

(declare-fun d!84619 () Bool)

(assert (=> d!84619 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52104 d!84619))

(declare-fun d!84633 () Bool)

(assert (=> d!84633 (= (array_inv!12966 a!3118) (bvsge (size!17471 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52104 d!84633))

(declare-fun d!84635 () Bool)

(assert (=> d!84635 (= (validKeyInArray!0 (select (arr!17107 a!3118) j!142)) (and (not (= (select (arr!17107 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17107 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568666 d!84635))

(declare-fun b!568885 () Bool)

(declare-fun e!327353 () Bool)

(declare-fun contains!2849 (List!11094 (_ BitVec 64)) Bool)

(assert (=> b!568885 (= e!327353 (contains!2849 Nil!11091 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32578 () Bool)

(declare-fun call!32581 () Bool)

(declare-fun c!65355 () Bool)

(assert (=> bm!32578 (= call!32581 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65355 (Cons!11090 (select (arr!17107 a!3118) #b00000000000000000000000000000000) Nil!11091) Nil!11091)))))

(declare-fun b!568886 () Bool)

(declare-fun e!327354 () Bool)

(assert (=> b!568886 (= e!327354 call!32581)))

(declare-fun d!84637 () Bool)

(declare-fun res!358888 () Bool)

(declare-fun e!327356 () Bool)

(assert (=> d!84637 (=> res!358888 e!327356)))

(assert (=> d!84637 (= res!358888 (bvsge #b00000000000000000000000000000000 (size!17471 a!3118)))))

(assert (=> d!84637 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11091) e!327356)))

(declare-fun b!568887 () Bool)

(assert (=> b!568887 (= e!327354 call!32581)))

(declare-fun b!568888 () Bool)

(declare-fun e!327355 () Bool)

(assert (=> b!568888 (= e!327355 e!327354)))

(assert (=> b!568888 (= c!65355 (validKeyInArray!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568889 () Bool)

(assert (=> b!568889 (= e!327356 e!327355)))

(declare-fun res!358886 () Bool)

(assert (=> b!568889 (=> (not res!358886) (not e!327355))))

(assert (=> b!568889 (= res!358886 (not e!327353))))

(declare-fun res!358887 () Bool)

(assert (=> b!568889 (=> (not res!358887) (not e!327353))))

(assert (=> b!568889 (= res!358887 (validKeyInArray!0 (select (arr!17107 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84637 (not res!358888)) b!568889))

(assert (= (and b!568889 res!358887) b!568885))

(assert (= (and b!568889 res!358886) b!568888))

(assert (= (and b!568888 c!65355) b!568886))

(assert (= (and b!568888 (not c!65355)) b!568887))

(assert (= (or b!568886 b!568887) bm!32578))

(assert (=> b!568885 m!547451))

(assert (=> b!568885 m!547451))

(declare-fun m!547555 () Bool)

(assert (=> b!568885 m!547555))

(assert (=> bm!32578 m!547451))

(declare-fun m!547557 () Bool)

(assert (=> bm!32578 m!547557))

(assert (=> b!568888 m!547451))

(assert (=> b!568888 m!547451))

(assert (=> b!568888 m!547461))

(assert (=> b!568889 m!547451))

(assert (=> b!568889 m!547451))

(assert (=> b!568889 m!547461))

(assert (=> b!568661 d!84637))

(declare-fun b!568942 () Bool)

(declare-fun c!65377 () Bool)

(declare-fun lt!259200 () (_ BitVec 64))

(assert (=> b!568942 (= c!65377 (= lt!259200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327386 () SeekEntryResult!5512)

(declare-fun e!327387 () SeekEntryResult!5512)

(assert (=> b!568942 (= e!327386 e!327387)))

(declare-fun b!568943 () Bool)

(declare-fun lt!259199 () SeekEntryResult!5512)

(assert (=> b!568943 (= e!327386 (Found!5512 (index!24277 lt!259199)))))

(declare-fun d!84643 () Bool)

(declare-fun lt!259201 () SeekEntryResult!5512)

(assert (=> d!84643 (and (or ((_ is Undefined!5512) lt!259201) (not ((_ is Found!5512) lt!259201)) (and (bvsge (index!24276 lt!259201) #b00000000000000000000000000000000) (bvslt (index!24276 lt!259201) (size!17471 a!3118)))) (or ((_ is Undefined!5512) lt!259201) ((_ is Found!5512) lt!259201) (not ((_ is MissingZero!5512) lt!259201)) (and (bvsge (index!24275 lt!259201) #b00000000000000000000000000000000) (bvslt (index!24275 lt!259201) (size!17471 a!3118)))) (or ((_ is Undefined!5512) lt!259201) ((_ is Found!5512) lt!259201) ((_ is MissingZero!5512) lt!259201) (not ((_ is MissingVacant!5512) lt!259201)) (and (bvsge (index!24278 lt!259201) #b00000000000000000000000000000000) (bvslt (index!24278 lt!259201) (size!17471 a!3118)))) (or ((_ is Undefined!5512) lt!259201) (ite ((_ is Found!5512) lt!259201) (= (select (arr!17107 a!3118) (index!24276 lt!259201)) k0!1914) (ite ((_ is MissingZero!5512) lt!259201) (= (select (arr!17107 a!3118) (index!24275 lt!259201)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5512) lt!259201) (= (select (arr!17107 a!3118) (index!24278 lt!259201)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!327388 () SeekEntryResult!5512)

(assert (=> d!84643 (= lt!259201 e!327388)))

(declare-fun c!65376 () Bool)

(assert (=> d!84643 (= c!65376 (and ((_ is Intermediate!5512) lt!259199) (undefined!6324 lt!259199)))))

(assert (=> d!84643 (= lt!259199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84643 (validMask!0 mask!3119)))

(assert (=> d!84643 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!259201)))

(declare-fun b!568944 () Bool)

(assert (=> b!568944 (= e!327388 e!327386)))

(assert (=> b!568944 (= lt!259200 (select (arr!17107 a!3118) (index!24277 lt!259199)))))

(declare-fun c!65375 () Bool)

(assert (=> b!568944 (= c!65375 (= lt!259200 k0!1914))))

(declare-fun b!568945 () Bool)

(assert (=> b!568945 (= e!327388 Undefined!5512)))

(declare-fun b!568946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35631 (_ BitVec 32)) SeekEntryResult!5512)

(assert (=> b!568946 (= e!327387 (seekKeyOrZeroReturnVacant!0 (x!53304 lt!259199) (index!24277 lt!259199) (index!24277 lt!259199) k0!1914 a!3118 mask!3119))))

(declare-fun b!568947 () Bool)

(assert (=> b!568947 (= e!327387 (MissingZero!5512 (index!24277 lt!259199)))))

(assert (= (and d!84643 c!65376) b!568945))

(assert (= (and d!84643 (not c!65376)) b!568944))

(assert (= (and b!568944 c!65375) b!568943))

(assert (= (and b!568944 (not c!65375)) b!568942))

(assert (= (and b!568942 c!65377) b!568947))

(assert (= (and b!568942 (not c!65377)) b!568946))

(declare-fun m!547587 () Bool)

(assert (=> d!84643 m!547587))

(declare-fun m!547589 () Bool)

(assert (=> d!84643 m!547589))

(assert (=> d!84643 m!547361))

(declare-fun m!547591 () Bool)

(assert (=> d!84643 m!547591))

(assert (=> d!84643 m!547591))

(declare-fun m!547593 () Bool)

(assert (=> d!84643 m!547593))

(declare-fun m!547595 () Bool)

(assert (=> d!84643 m!547595))

(declare-fun m!547597 () Bool)

(assert (=> b!568944 m!547597))

(declare-fun m!547599 () Bool)

(assert (=> b!568946 m!547599))

(assert (=> b!568667 d!84643))

(declare-fun b!568948 () Bool)

(declare-fun c!65380 () Bool)

(declare-fun lt!259203 () (_ BitVec 64))

(assert (=> b!568948 (= c!65380 (= lt!259203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327389 () SeekEntryResult!5512)

(declare-fun e!327390 () SeekEntryResult!5512)

(assert (=> b!568948 (= e!327389 e!327390)))

(declare-fun b!568949 () Bool)

(declare-fun lt!259202 () SeekEntryResult!5512)

(assert (=> b!568949 (= e!327389 (Found!5512 (index!24277 lt!259202)))))

(declare-fun d!84661 () Bool)

(declare-fun lt!259204 () SeekEntryResult!5512)

(assert (=> d!84661 (and (or ((_ is Undefined!5512) lt!259204) (not ((_ is Found!5512) lt!259204)) (and (bvsge (index!24276 lt!259204) #b00000000000000000000000000000000) (bvslt (index!24276 lt!259204) (size!17471 a!3118)))) (or ((_ is Undefined!5512) lt!259204) ((_ is Found!5512) lt!259204) (not ((_ is MissingZero!5512) lt!259204)) (and (bvsge (index!24275 lt!259204) #b00000000000000000000000000000000) (bvslt (index!24275 lt!259204) (size!17471 a!3118)))) (or ((_ is Undefined!5512) lt!259204) ((_ is Found!5512) lt!259204) ((_ is MissingZero!5512) lt!259204) (not ((_ is MissingVacant!5512) lt!259204)) (and (bvsge (index!24278 lt!259204) #b00000000000000000000000000000000) (bvslt (index!24278 lt!259204) (size!17471 a!3118)))) (or ((_ is Undefined!5512) lt!259204) (ite ((_ is Found!5512) lt!259204) (= (select (arr!17107 a!3118) (index!24276 lt!259204)) (select (arr!17107 a!3118) j!142)) (ite ((_ is MissingZero!5512) lt!259204) (= (select (arr!17107 a!3118) (index!24275 lt!259204)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5512) lt!259204) (= (select (arr!17107 a!3118) (index!24278 lt!259204)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!327391 () SeekEntryResult!5512)

(assert (=> d!84661 (= lt!259204 e!327391)))

(declare-fun c!65379 () Bool)

(assert (=> d!84661 (= c!65379 (and ((_ is Intermediate!5512) lt!259202) (undefined!6324 lt!259202)))))

(assert (=> d!84661 (= lt!259202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17107 a!3118) j!142) mask!3119) (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84661 (validMask!0 mask!3119)))

(assert (=> d!84661 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) lt!259204)))

(declare-fun b!568950 () Bool)

(assert (=> b!568950 (= e!327391 e!327389)))

(assert (=> b!568950 (= lt!259203 (select (arr!17107 a!3118) (index!24277 lt!259202)))))

(declare-fun c!65378 () Bool)

(assert (=> b!568950 (= c!65378 (= lt!259203 (select (arr!17107 a!3118) j!142)))))

(declare-fun b!568951 () Bool)

(assert (=> b!568951 (= e!327391 Undefined!5512)))

(declare-fun b!568952 () Bool)

(assert (=> b!568952 (= e!327390 (seekKeyOrZeroReturnVacant!0 (x!53304 lt!259202) (index!24277 lt!259202) (index!24277 lt!259202) (select (arr!17107 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568953 () Bool)

(assert (=> b!568953 (= e!327390 (MissingZero!5512 (index!24277 lt!259202)))))

(assert (= (and d!84661 c!65379) b!568951))

(assert (= (and d!84661 (not c!65379)) b!568950))

(assert (= (and b!568950 c!65378) b!568949))

(assert (= (and b!568950 (not c!65378)) b!568948))

(assert (= (and b!568948 c!65380) b!568953))

(assert (= (and b!568948 (not c!65380)) b!568952))

(declare-fun m!547601 () Bool)

(assert (=> d!84661 m!547601))

(declare-fun m!547603 () Bool)

(assert (=> d!84661 m!547603))

(assert (=> d!84661 m!547361))

(assert (=> d!84661 m!547341))

(assert (=> d!84661 m!547349))

(assert (=> d!84661 m!547349))

(assert (=> d!84661 m!547341))

(declare-fun m!547605 () Bool)

(assert (=> d!84661 m!547605))

(declare-fun m!547607 () Bool)

(assert (=> d!84661 m!547607))

(declare-fun m!547609 () Bool)

(assert (=> b!568950 m!547609))

(assert (=> b!568952 m!547341))

(declare-fun m!547611 () Bool)

(assert (=> b!568952 m!547611))

(assert (=> b!568662 d!84661))

(declare-fun b!568954 () Bool)

(declare-fun e!327392 () Bool)

(declare-fun e!327393 () Bool)

(assert (=> b!568954 (= e!327392 e!327393)))

(declare-fun lt!259207 () (_ BitVec 64))

(assert (=> b!568954 (= lt!259207 (select (arr!17107 a!3118) j!142))))

(declare-fun lt!259206 () Unit!17797)

(assert (=> b!568954 (= lt!259206 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259207 j!142))))

(assert (=> b!568954 (arrayContainsKey!0 a!3118 lt!259207 #b00000000000000000000000000000000)))

(declare-fun lt!259205 () Unit!17797)

(assert (=> b!568954 (= lt!259205 lt!259206)))

(declare-fun res!358904 () Bool)

(assert (=> b!568954 (= res!358904 (= (seekEntryOrOpen!0 (select (arr!17107 a!3118) j!142) a!3118 mask!3119) (Found!5512 j!142)))))

(assert (=> b!568954 (=> (not res!358904) (not e!327393))))

(declare-fun b!568955 () Bool)

(declare-fun call!32583 () Bool)

(assert (=> b!568955 (= e!327393 call!32583)))

(declare-fun b!568956 () Bool)

(declare-fun e!327394 () Bool)

(assert (=> b!568956 (= e!327394 e!327392)))

(declare-fun c!65381 () Bool)

(assert (=> b!568956 (= c!65381 (validKeyInArray!0 (select (arr!17107 a!3118) j!142)))))

(declare-fun b!568957 () Bool)

(assert (=> b!568957 (= e!327392 call!32583)))

(declare-fun d!84663 () Bool)

(declare-fun res!358905 () Bool)

(assert (=> d!84663 (=> res!358905 e!327394)))

(assert (=> d!84663 (= res!358905 (bvsge j!142 (size!17471 a!3118)))))

(assert (=> d!84663 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327394)))

(declare-fun bm!32580 () Bool)

(assert (=> bm!32580 (= call!32583 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84663 (not res!358905)) b!568956))

(assert (= (and b!568956 c!65381) b!568954))

(assert (= (and b!568956 (not c!65381)) b!568957))

(assert (= (and b!568954 res!358904) b!568955))

(assert (= (or b!568955 b!568957) bm!32580))

(assert (=> b!568954 m!547341))

(declare-fun m!547613 () Bool)

(assert (=> b!568954 m!547613))

(declare-fun m!547615 () Bool)

(assert (=> b!568954 m!547615))

(assert (=> b!568954 m!547341))

(assert (=> b!568954 m!547371))

(assert (=> b!568956 m!547341))

(assert (=> b!568956 m!547341))

(assert (=> b!568956 m!547343))

(declare-fun m!547617 () Bool)

(assert (=> bm!32580 m!547617))

(assert (=> b!568662 d!84663))

(declare-fun d!84665 () Bool)

(assert (=> d!84665 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259221 () Unit!17797)

(declare-fun choose!38 (array!35631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17797)

(assert (=> d!84665 (= lt!259221 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84665 (validMask!0 mask!3119)))

(assert (=> d!84665 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259221)))

(declare-fun bs!17659 () Bool)

(assert (= bs!17659 d!84665))

(assert (=> bs!17659 m!547365))

(declare-fun m!547633 () Bool)

(assert (=> bs!17659 m!547633))

(assert (=> bs!17659 m!547361))

(assert (=> b!568662 d!84665))

(check-sat (not b!568740) (not b!568885) (not b!568787) (not b!568888) (not b!568952) (not b!568889) (not bm!32565) (not d!84607) (not bm!32580) (not b!568946) (not b!568729) (not d!84599) (not d!84661) (not d!84643) (not bm!32578) (not b!568778) (not d!84665) (not b!568738) (not b!568956) (not b!568954))
(check-sat)
