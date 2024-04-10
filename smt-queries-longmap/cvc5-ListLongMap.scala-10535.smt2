; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124222 () Bool)

(assert start!124222)

(declare-fun b!1437799 () Bool)

(declare-fun res!970580 () Bool)

(declare-fun e!811129 () Bool)

(assert (=> b!1437799 (=> (not res!970580) (not e!811129))))

(declare-datatypes ((array!97787 0))(
  ( (array!97788 (arr!47186 (Array (_ BitVec 32) (_ BitVec 64))) (size!47736 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97787)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437799 (= res!970580 (validKeyInArray!0 (select (arr!47186 a!2862) j!93)))))

(declare-fun b!1437800 () Bool)

(declare-fun res!970581 () Bool)

(assert (=> b!1437800 (=> (not res!970581) (not e!811129))))

(declare-datatypes ((List!33687 0))(
  ( (Nil!33684) (Cons!33683 (h!35024 (_ BitVec 64)) (t!48381 List!33687)) )
))
(declare-fun arrayNoDuplicates!0 (array!97787 (_ BitVec 32) List!33687) Bool)

(assert (=> b!1437800 (= res!970581 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33684))))

(declare-fun b!1437801 () Bool)

(declare-fun e!811128 () Bool)

(assert (=> b!1437801 (= e!811129 e!811128)))

(declare-fun res!970578 () Bool)

(assert (=> b!1437801 (=> (not res!970578) (not e!811128))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11438 0))(
  ( (MissingZero!11438 (index!48144 (_ BitVec 32))) (Found!11438 (index!48145 (_ BitVec 32))) (Intermediate!11438 (undefined!12250 Bool) (index!48146 (_ BitVec 32)) (x!129877 (_ BitVec 32))) (Undefined!11438) (MissingVacant!11438 (index!48147 (_ BitVec 32))) )
))
(declare-fun lt!632393 () SeekEntryResult!11438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97787 (_ BitVec 32)) SeekEntryResult!11438)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437801 (= res!970578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687) (select (arr!47186 a!2862) j!93) a!2862 mask!2687) lt!632393))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437801 (= lt!632393 (Intermediate!11438 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437802 () Bool)

(declare-fun res!970583 () Bool)

(assert (=> b!1437802 (=> (not res!970583) (not e!811129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97787 (_ BitVec 32)) Bool)

(assert (=> b!1437802 (= res!970583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437803 () Bool)

(declare-fun res!970584 () Bool)

(assert (=> b!1437803 (=> (not res!970584) (not e!811128))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437803 (= res!970584 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47186 a!2862) j!93) a!2862 mask!2687) lt!632393))))

(declare-fun b!1437804 () Bool)

(declare-fun res!970577 () Bool)

(assert (=> b!1437804 (=> (not res!970577) (not e!811129))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437804 (= res!970577 (and (= (size!47736 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47736 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47736 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437805 () Bool)

(declare-fun res!970585 () Bool)

(assert (=> b!1437805 (=> (not res!970585) (not e!811129))))

(assert (=> b!1437805 (= res!970585 (validKeyInArray!0 (select (arr!47186 a!2862) i!1006)))))

(declare-fun b!1437806 () Bool)

(declare-fun lt!632394 () (_ BitVec 32))

(assert (=> b!1437806 (= e!811128 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632394 #b00000000000000000000000000000000) (bvsge lt!632394 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1437806 (= lt!632394 (toIndex!0 (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437807 () Bool)

(declare-fun res!970582 () Bool)

(assert (=> b!1437807 (=> (not res!970582) (not e!811129))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437807 (= res!970582 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47736 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47736 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47736 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970579 () Bool)

(assert (=> start!124222 (=> (not res!970579) (not e!811129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124222 (= res!970579 (validMask!0 mask!2687))))

(assert (=> start!124222 e!811129))

(assert (=> start!124222 true))

(declare-fun array_inv!36214 (array!97787) Bool)

(assert (=> start!124222 (array_inv!36214 a!2862)))

(assert (= (and start!124222 res!970579) b!1437804))

(assert (= (and b!1437804 res!970577) b!1437805))

(assert (= (and b!1437805 res!970585) b!1437799))

(assert (= (and b!1437799 res!970580) b!1437802))

(assert (= (and b!1437802 res!970583) b!1437800))

(assert (= (and b!1437800 res!970581) b!1437807))

(assert (= (and b!1437807 res!970582) b!1437801))

(assert (= (and b!1437801 res!970578) b!1437803))

(assert (= (and b!1437803 res!970584) b!1437806))

(declare-fun m!1327051 () Bool)

(assert (=> b!1437803 m!1327051))

(assert (=> b!1437803 m!1327051))

(declare-fun m!1327053 () Bool)

(assert (=> b!1437803 m!1327053))

(declare-fun m!1327055 () Bool)

(assert (=> b!1437805 m!1327055))

(assert (=> b!1437805 m!1327055))

(declare-fun m!1327057 () Bool)

(assert (=> b!1437805 m!1327057))

(declare-fun m!1327059 () Bool)

(assert (=> b!1437800 m!1327059))

(assert (=> b!1437801 m!1327051))

(assert (=> b!1437801 m!1327051))

(declare-fun m!1327061 () Bool)

(assert (=> b!1437801 m!1327061))

(assert (=> b!1437801 m!1327061))

(assert (=> b!1437801 m!1327051))

(declare-fun m!1327063 () Bool)

(assert (=> b!1437801 m!1327063))

(declare-fun m!1327065 () Bool)

(assert (=> b!1437806 m!1327065))

(declare-fun m!1327067 () Bool)

(assert (=> b!1437806 m!1327067))

(assert (=> b!1437806 m!1327067))

(declare-fun m!1327069 () Bool)

(assert (=> b!1437806 m!1327069))

(assert (=> b!1437799 m!1327051))

(assert (=> b!1437799 m!1327051))

(declare-fun m!1327071 () Bool)

(assert (=> b!1437799 m!1327071))

(declare-fun m!1327073 () Bool)

(assert (=> start!124222 m!1327073))

(declare-fun m!1327075 () Bool)

(assert (=> start!124222 m!1327075))

(declare-fun m!1327077 () Bool)

(assert (=> b!1437802 m!1327077))

(assert (=> b!1437807 m!1327065))

(declare-fun m!1327079 () Bool)

(assert (=> b!1437807 m!1327079))

(push 1)

(assert (not b!1437805))

(assert (not b!1437802))

(assert (not b!1437799))

(assert (not b!1437801))

(assert (not b!1437800))

(assert (not b!1437803))

(assert (not start!124222))

(assert (not b!1437806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1437961 () Bool)

(declare-fun e!811210 () SeekEntryResult!11438)

(assert (=> b!1437961 (= e!811210 (Intermediate!11438 false (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437962 () Bool)

(declare-fun e!811212 () Bool)

(declare-fun e!811213 () Bool)

(assert (=> b!1437962 (= e!811212 e!811213)))

(declare-fun res!970680 () Bool)

(declare-fun lt!632432 () SeekEntryResult!11438)

(assert (=> b!1437962 (= res!970680 (and (is-Intermediate!11438 lt!632432) (not (undefined!12250 lt!632432)) (bvslt (x!129877 lt!632432) #b01111111111111111111111111111110) (bvsge (x!129877 lt!632432) #b00000000000000000000000000000000) (bvsge (x!129877 lt!632432) #b00000000000000000000000000000000)))))

(assert (=> b!1437962 (=> (not res!970680) (not e!811213))))

(declare-fun d!154711 () Bool)

(assert (=> d!154711 e!811212))

(declare-fun c!133147 () Bool)

(assert (=> d!154711 (= c!133147 (and (is-Intermediate!11438 lt!632432) (undefined!12250 lt!632432)))))

(declare-fun e!811211 () SeekEntryResult!11438)

(assert (=> d!154711 (= lt!632432 e!811211)))

(declare-fun c!133148 () Bool)

(assert (=> d!154711 (= c!133148 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632433 () (_ BitVec 64))

(assert (=> d!154711 (= lt!632433 (select (arr!47186 a!2862) (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687)))))

(assert (=> d!154711 (validMask!0 mask!2687)))

(assert (=> d!154711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687) (select (arr!47186 a!2862) j!93) a!2862 mask!2687) lt!632432)))

(declare-fun b!1437963 () Bool)

(assert (=> b!1437963 (= e!811212 (bvsge (x!129877 lt!632432) #b01111111111111111111111111111110))))

(declare-fun b!1437964 () Bool)

(assert (=> b!1437964 (and (bvsge (index!48146 lt!632432) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632432) (size!47736 a!2862)))))

(declare-fun res!970682 () Bool)

(assert (=> b!1437964 (= res!970682 (= (select (arr!47186 a!2862) (index!48146 lt!632432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811214 () Bool)

(assert (=> b!1437964 (=> res!970682 e!811214)))

(declare-fun b!1437965 () Bool)

(assert (=> b!1437965 (= e!811211 e!811210)))

(declare-fun c!133149 () Bool)

(assert (=> b!1437965 (= c!133149 (or (= lt!632433 (select (arr!47186 a!2862) j!93)) (= (bvadd lt!632433 lt!632433) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437966 () Bool)

(assert (=> b!1437966 (and (bvsge (index!48146 lt!632432) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632432) (size!47736 a!2862)))))

(declare-fun res!970681 () Bool)

(assert (=> b!1437966 (= res!970681 (= (select (arr!47186 a!2862) (index!48146 lt!632432)) (select (arr!47186 a!2862) j!93)))))

(assert (=> b!1437966 (=> res!970681 e!811214)))

(assert (=> b!1437966 (= e!811213 e!811214)))

(declare-fun b!1437967 () Bool)

(assert (=> b!1437967 (and (bvsge (index!48146 lt!632432) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632432) (size!47736 a!2862)))))

(assert (=> b!1437967 (= e!811214 (= (select (arr!47186 a!2862) (index!48146 lt!632432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437968 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437968 (= e!811210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47186 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437969 () Bool)

(assert (=> b!1437969 (= e!811211 (Intermediate!11438 true (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!154711 c!133148) b!1437969))

(assert (= (and d!154711 (not c!133148)) b!1437965))

(assert (= (and b!1437965 c!133149) b!1437961))

(assert (= (and b!1437965 (not c!133149)) b!1437968))

(assert (= (and d!154711 c!133147) b!1437963))

(assert (= (and d!154711 (not c!133147)) b!1437962))

(assert (= (and b!1437962 res!970680) b!1437966))

(assert (= (and b!1437966 (not res!970681)) b!1437964))

(assert (= (and b!1437964 (not res!970682)) b!1437967))

(assert (=> b!1437968 m!1327061))

(declare-fun m!1327171 () Bool)

(assert (=> b!1437968 m!1327171))

(assert (=> b!1437968 m!1327171))

(assert (=> b!1437968 m!1327051))

(declare-fun m!1327175 () Bool)

(assert (=> b!1437968 m!1327175))

(assert (=> d!154711 m!1327061))

(declare-fun m!1327177 () Bool)

(assert (=> d!154711 m!1327177))

(assert (=> d!154711 m!1327073))

(declare-fun m!1327179 () Bool)

(assert (=> b!1437966 m!1327179))

(assert (=> b!1437964 m!1327179))

(assert (=> b!1437967 m!1327179))

(assert (=> b!1437801 d!154711))

(declare-fun d!154717 () Bool)

(declare-fun lt!632453 () (_ BitVec 32))

(declare-fun lt!632452 () (_ BitVec 32))

(assert (=> d!154717 (= lt!632453 (bvmul (bvxor lt!632452 (bvlshr lt!632452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154717 (= lt!632452 ((_ extract 31 0) (bvand (bvxor (select (arr!47186 a!2862) j!93) (bvlshr (select (arr!47186 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154717 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970684 (let ((h!35029 ((_ extract 31 0) (bvand (bvxor (select (arr!47186 a!2862) j!93) (bvlshr (select (arr!47186 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129885 (bvmul (bvxor h!35029 (bvlshr h!35029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129885 (bvlshr x!129885 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970684 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970684 #b00000000000000000000000000000000))))))

(assert (=> d!154717 (= (toIndex!0 (select (arr!47186 a!2862) j!93) mask!2687) (bvand (bvxor lt!632453 (bvlshr lt!632453 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437801 d!154717))

(declare-fun d!154727 () Bool)

(declare-fun lt!632457 () (_ BitVec 32))

(declare-fun lt!632456 () (_ BitVec 32))

(assert (=> d!154727 (= lt!632457 (bvmul (bvxor lt!632456 (bvlshr lt!632456 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154727 (= lt!632456 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154727 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970684 (let ((h!35029 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129885 (bvmul (bvxor h!35029 (bvlshr h!35029 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129885 (bvlshr x!129885 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970684 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970684 #b00000000000000000000000000000000))))))

(assert (=> d!154727 (= (toIndex!0 (select (store (arr!47186 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632457 (bvlshr lt!632457 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437806 d!154727))

(declare-fun d!154731 () Bool)

(assert (=> d!154731 (= (validKeyInArray!0 (select (arr!47186 a!2862) i!1006)) (and (not (= (select (arr!47186 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47186 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437805 d!154731))

(declare-fun d!154733 () Bool)

(declare-fun res!970699 () Bool)

(declare-fun e!811234 () Bool)

(assert (=> d!154733 (=> res!970699 e!811234)))

(assert (=> d!154733 (= res!970699 (bvsge #b00000000000000000000000000000000 (size!47736 a!2862)))))

(assert (=> d!154733 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33684) e!811234)))

(declare-fun b!1437997 () Bool)

(declare-fun e!811235 () Bool)

(assert (=> b!1437997 (= e!811234 e!811235)))

(declare-fun res!970700 () Bool)

(assert (=> b!1437997 (=> (not res!970700) (not e!811235))))

(declare-fun e!811236 () Bool)

(assert (=> b!1437997 (= res!970700 (not e!811236))))

(declare-fun res!970698 () Bool)

(assert (=> b!1437997 (=> (not res!970698) (not e!811236))))

(assert (=> b!1437997 (= res!970698 (validKeyInArray!0 (select (arr!47186 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1437998 () Bool)

(declare-fun e!811237 () Bool)

(declare-fun call!67653 () Bool)

(assert (=> b!1437998 (= e!811237 call!67653)))

(declare-fun b!1437999 () Bool)

(declare-fun contains!9889 (List!33687 (_ BitVec 64)) Bool)

(assert (=> b!1437999 (= e!811236 (contains!9889 Nil!33684 (select (arr!47186 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438000 () Bool)

(assert (=> b!1438000 (= e!811235 e!811237)))

(declare-fun c!133157 () Bool)

(assert (=> b!1438000 (= c!133157 (validKeyInArray!0 (select (arr!47186 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67650 () Bool)

(assert (=> bm!67650 (= call!67653 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133157 (Cons!33683 (select (arr!47186 a!2862) #b00000000000000000000000000000000) Nil!33684) Nil!33684)))))

(declare-fun b!1438001 () Bool)

(assert (=> b!1438001 (= e!811237 call!67653)))

(assert (= (and d!154733 (not res!970699)) b!1437997))

(assert (= (and b!1437997 res!970698) b!1437999))

(assert (= (and b!1437997 res!970700) b!1438000))

(assert (= (and b!1438000 c!133157) b!1438001))

(assert (= (and b!1438000 (not c!133157)) b!1437998))

(assert (= (or b!1438001 b!1437998) bm!67650))

(declare-fun m!1327189 () Bool)

(assert (=> b!1437997 m!1327189))

(assert (=> b!1437997 m!1327189))

(declare-fun m!1327191 () Bool)

(assert (=> b!1437997 m!1327191))

(assert (=> b!1437999 m!1327189))

(assert (=> b!1437999 m!1327189))

(declare-fun m!1327193 () Bool)

(assert (=> b!1437999 m!1327193))

(assert (=> b!1438000 m!1327189))

(assert (=> b!1438000 m!1327189))

(assert (=> b!1438000 m!1327191))

(assert (=> bm!67650 m!1327189))

(declare-fun m!1327195 () Bool)

(assert (=> bm!67650 m!1327195))

(assert (=> b!1437800 d!154733))

(declare-fun d!154735 () Bool)

(assert (=> d!154735 (= (validKeyInArray!0 (select (arr!47186 a!2862) j!93)) (and (not (= (select (arr!47186 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47186 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437799 d!154735))

(declare-fun d!154737 () Bool)

(assert (=> d!154737 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124222 d!154737))

(declare-fun d!154749 () Bool)

(assert (=> d!154749 (= (array_inv!36214 a!2862) (bvsge (size!47736 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124222 d!154749))

(declare-fun bm!67657 () Bool)

(declare-fun call!67660 () Bool)

(assert (=> bm!67657 (= call!67660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1438038 () Bool)

(declare-fun e!811264 () Bool)

(assert (=> b!1438038 (= e!811264 call!67660)))

(declare-fun b!1438040 () Bool)

(declare-fun e!811265 () Bool)

(assert (=> b!1438040 (= e!811265 e!811264)))

(declare-fun lt!632479 () (_ BitVec 64))

(assert (=> b!1438040 (= lt!632479 (select (arr!47186 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48564 0))(
  ( (Unit!48565) )
))
(declare-fun lt!632478 () Unit!48564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97787 (_ BitVec 64) (_ BitVec 32)) Unit!48564)

(assert (=> b!1438040 (= lt!632478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632479 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438040 (arrayContainsKey!0 a!2862 lt!632479 #b00000000000000000000000000000000)))

(declare-fun lt!632477 () Unit!48564)

(assert (=> b!1438040 (= lt!632477 lt!632478)))

(declare-fun res!970719 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97787 (_ BitVec 32)) SeekEntryResult!11438)

(assert (=> b!1438040 (= res!970719 (= (seekEntryOrOpen!0 (select (arr!47186 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11438 #b00000000000000000000000000000000)))))

(assert (=> b!1438040 (=> (not res!970719) (not e!811264))))

(declare-fun b!1438041 () Bool)

(declare-fun e!811266 () Bool)

(assert (=> b!1438041 (= e!811266 e!811265)))

(declare-fun c!133167 () Bool)

(assert (=> b!1438041 (= c!133167 (validKeyInArray!0 (select (arr!47186 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154751 () Bool)

(declare-fun res!970720 () Bool)

(assert (=> d!154751 (=> res!970720 e!811266)))

(assert (=> d!154751 (= res!970720 (bvsge #b00000000000000000000000000000000 (size!47736 a!2862)))))

(assert (=> d!154751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811266)))

(declare-fun b!1438039 () Bool)

(assert (=> b!1438039 (= e!811265 call!67660)))

(assert (= (and d!154751 (not res!970720)) b!1438041))

(assert (= (and b!1438041 c!133167) b!1438040))

(assert (= (and b!1438041 (not c!133167)) b!1438039))

(assert (= (and b!1438040 res!970719) b!1438038))

(assert (= (or b!1438038 b!1438039) bm!67657))

(declare-fun m!1327217 () Bool)

(assert (=> bm!67657 m!1327217))

(assert (=> b!1438040 m!1327189))

(declare-fun m!1327221 () Bool)

(assert (=> b!1438040 m!1327221))

(declare-fun m!1327223 () Bool)

(assert (=> b!1438040 m!1327223))

(assert (=> b!1438040 m!1327189))

(declare-fun m!1327225 () Bool)

(assert (=> b!1438040 m!1327225))

(assert (=> b!1438041 m!1327189))

(assert (=> b!1438041 m!1327189))

(assert (=> b!1438041 m!1327191))

(assert (=> b!1437802 d!154751))

(declare-fun b!1438042 () Bool)

(declare-fun e!811267 () SeekEntryResult!11438)

(assert (=> b!1438042 (= e!811267 (Intermediate!11438 false index!646 x!665))))

(declare-fun b!1438043 () Bool)

(declare-fun e!811269 () Bool)

(declare-fun e!811270 () Bool)

(assert (=> b!1438043 (= e!811269 e!811270)))

(declare-fun res!970721 () Bool)

(declare-fun lt!632480 () SeekEntryResult!11438)

(assert (=> b!1438043 (= res!970721 (and (is-Intermediate!11438 lt!632480) (not (undefined!12250 lt!632480)) (bvslt (x!129877 lt!632480) #b01111111111111111111111111111110) (bvsge (x!129877 lt!632480) #b00000000000000000000000000000000) (bvsge (x!129877 lt!632480) x!665)))))

(assert (=> b!1438043 (=> (not res!970721) (not e!811270))))

(declare-fun d!154757 () Bool)

(assert (=> d!154757 e!811269))

(declare-fun c!133168 () Bool)

(assert (=> d!154757 (= c!133168 (and (is-Intermediate!11438 lt!632480) (undefined!12250 lt!632480)))))

(declare-fun e!811268 () SeekEntryResult!11438)

(assert (=> d!154757 (= lt!632480 e!811268)))

(declare-fun c!133169 () Bool)

(assert (=> d!154757 (= c!133169 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632481 () (_ BitVec 64))

(assert (=> d!154757 (= lt!632481 (select (arr!47186 a!2862) index!646))))

(assert (=> d!154757 (validMask!0 mask!2687)))

(assert (=> d!154757 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47186 a!2862) j!93) a!2862 mask!2687) lt!632480)))

(declare-fun b!1438044 () Bool)

(assert (=> b!1438044 (= e!811269 (bvsge (x!129877 lt!632480) #b01111111111111111111111111111110))))

(declare-fun b!1438045 () Bool)

(assert (=> b!1438045 (and (bvsge (index!48146 lt!632480) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632480) (size!47736 a!2862)))))

(declare-fun res!970723 () Bool)

(assert (=> b!1438045 (= res!970723 (= (select (arr!47186 a!2862) (index!48146 lt!632480)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811271 () Bool)

(assert (=> b!1438045 (=> res!970723 e!811271)))

(declare-fun b!1438046 () Bool)

(assert (=> b!1438046 (= e!811268 e!811267)))

(declare-fun c!133170 () Bool)

(assert (=> b!1438046 (= c!133170 (or (= lt!632481 (select (arr!47186 a!2862) j!93)) (= (bvadd lt!632481 lt!632481) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438047 () Bool)

(assert (=> b!1438047 (and (bvsge (index!48146 lt!632480) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632480) (size!47736 a!2862)))))

(declare-fun res!970722 () Bool)

(assert (=> b!1438047 (= res!970722 (= (select (arr!47186 a!2862) (index!48146 lt!632480)) (select (arr!47186 a!2862) j!93)))))

(assert (=> b!1438047 (=> res!970722 e!811271)))

(assert (=> b!1438047 (= e!811270 e!811271)))

(declare-fun b!1438048 () Bool)

(assert (=> b!1438048 (and (bvsge (index!48146 lt!632480) #b00000000000000000000000000000000) (bvslt (index!48146 lt!632480) (size!47736 a!2862)))))

(assert (=> b!1438048 (= e!811271 (= (select (arr!47186 a!2862) (index!48146 lt!632480)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438049 () Bool)

(assert (=> b!1438049 (= e!811267 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47186 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438050 () Bool)

(assert (=> b!1438050 (= e!811268 (Intermediate!11438 true index!646 x!665))))

(assert (= (and d!154757 c!133169) b!1438050))

(assert (= (and d!154757 (not c!133169)) b!1438046))

(assert (= (and b!1438046 c!133170) b!1438042))

(assert (= (and b!1438046 (not c!133170)) b!1438049))

(assert (= (and d!154757 c!133168) b!1438044))

(assert (= (and d!154757 (not c!133168)) b!1438043))

(assert (= (and b!1438043 res!970721) b!1438047))

(assert (= (and b!1438047 (not res!970722)) b!1438045))

(assert (= (and b!1438045 (not res!970723)) b!1438048))

(declare-fun m!1327229 () Bool)

(assert (=> b!1438049 m!1327229))

(assert (=> b!1438049 m!1327229))

(assert (=> b!1438049 m!1327051))

(declare-fun m!1327231 () Bool)

(assert (=> b!1438049 m!1327231))

(declare-fun m!1327233 () Bool)

(assert (=> d!154757 m!1327233))

(assert (=> d!154757 m!1327073))

(declare-fun m!1327235 () Bool)

(assert (=> b!1438047 m!1327235))

(assert (=> b!1438045 m!1327235))

(assert (=> b!1438048 m!1327235))

(assert (=> b!1437803 d!154757))

(push 1)

(assert (not d!154757))

(assert (not b!1438049))

(assert (not b!1437999))

(assert (not b!1438040))

(assert (not bm!67657))

(assert (not b!1438000))

(assert (not b!1438041))

(assert (not b!1437968))

(assert (not d!154711))

(assert (not b!1437997))

(assert (not bm!67650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

