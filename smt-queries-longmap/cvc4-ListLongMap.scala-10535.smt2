; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124226 () Bool)

(assert start!124226)

(declare-fun b!1437853 () Bool)

(declare-fun res!970633 () Bool)

(declare-fun e!811148 () Bool)

(assert (=> b!1437853 (=> (not res!970633) (not e!811148))))

(declare-datatypes ((array!97791 0))(
  ( (array!97792 (arr!47188 (Array (_ BitVec 32) (_ BitVec 64))) (size!47738 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97791)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437853 (= res!970633 (validKeyInArray!0 (select (arr!47188 a!2862) j!93)))))

(declare-fun b!1437854 () Bool)

(declare-fun res!970637 () Bool)

(assert (=> b!1437854 (=> (not res!970637) (not e!811148))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437854 (= res!970637 (validKeyInArray!0 (select (arr!47188 a!2862) i!1006)))))

(declare-fun b!1437855 () Bool)

(declare-fun res!970634 () Bool)

(assert (=> b!1437855 (=> (not res!970634) (not e!811148))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1437855 (= res!970634 (and (= (size!47738 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47738 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47738 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437856 () Bool)

(declare-fun res!970632 () Bool)

(assert (=> b!1437856 (=> (not res!970632) (not e!811148))))

(declare-datatypes ((List!33689 0))(
  ( (Nil!33686) (Cons!33685 (h!35026 (_ BitVec 64)) (t!48383 List!33689)) )
))
(declare-fun arrayNoDuplicates!0 (array!97791 (_ BitVec 32) List!33689) Bool)

(assert (=> b!1437856 (= res!970632 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33686))))

(declare-fun b!1437857 () Bool)

(declare-fun res!970631 () Bool)

(declare-fun e!811147 () Bool)

(assert (=> b!1437857 (=> (not res!970631) (not e!811147))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11440 0))(
  ( (MissingZero!11440 (index!48152 (_ BitVec 32))) (Found!11440 (index!48153 (_ BitVec 32))) (Intermediate!11440 (undefined!12252 Bool) (index!48154 (_ BitVec 32)) (x!129879 (_ BitVec 32))) (Undefined!11440) (MissingVacant!11440 (index!48155 (_ BitVec 32))) )
))
(declare-fun lt!632405 () SeekEntryResult!11440)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97791 (_ BitVec 32)) SeekEntryResult!11440)

(assert (=> b!1437857 (= res!970631 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47188 a!2862) j!93) a!2862 mask!2687) lt!632405))))

(declare-fun b!1437858 () Bool)

(declare-fun lt!632406 () (_ BitVec 32))

(assert (=> b!1437858 (= e!811147 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632406 #b00000000000000000000000000000000) (bvsge lt!632406 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437858 (= lt!632406 (toIndex!0 (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun res!970639 () Bool)

(assert (=> start!124226 (=> (not res!970639) (not e!811148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124226 (= res!970639 (validMask!0 mask!2687))))

(assert (=> start!124226 e!811148))

(assert (=> start!124226 true))

(declare-fun array_inv!36216 (array!97791) Bool)

(assert (=> start!124226 (array_inv!36216 a!2862)))

(declare-fun b!1437859 () Bool)

(declare-fun res!970636 () Bool)

(assert (=> b!1437859 (=> (not res!970636) (not e!811148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97791 (_ BitVec 32)) Bool)

(assert (=> b!1437859 (= res!970636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437860 () Bool)

(assert (=> b!1437860 (= e!811148 e!811147)))

(declare-fun res!970638 () Bool)

(assert (=> b!1437860 (=> (not res!970638) (not e!811147))))

(assert (=> b!1437860 (= res!970638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687) (select (arr!47188 a!2862) j!93) a!2862 mask!2687) lt!632405))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437860 (= lt!632405 (Intermediate!11440 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437861 () Bool)

(declare-fun res!970635 () Bool)

(assert (=> b!1437861 (=> (not res!970635) (not e!811148))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437861 (= res!970635 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47738 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47738 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47738 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124226 res!970639) b!1437855))

(assert (= (and b!1437855 res!970634) b!1437854))

(assert (= (and b!1437854 res!970637) b!1437853))

(assert (= (and b!1437853 res!970633) b!1437859))

(assert (= (and b!1437859 res!970636) b!1437856))

(assert (= (and b!1437856 res!970632) b!1437861))

(assert (= (and b!1437861 res!970635) b!1437860))

(assert (= (and b!1437860 res!970638) b!1437857))

(assert (= (and b!1437857 res!970631) b!1437858))

(declare-fun m!1327111 () Bool)

(assert (=> b!1437859 m!1327111))

(declare-fun m!1327113 () Bool)

(assert (=> start!124226 m!1327113))

(declare-fun m!1327115 () Bool)

(assert (=> start!124226 m!1327115))

(declare-fun m!1327117 () Bool)

(assert (=> b!1437853 m!1327117))

(assert (=> b!1437853 m!1327117))

(declare-fun m!1327119 () Bool)

(assert (=> b!1437853 m!1327119))

(assert (=> b!1437857 m!1327117))

(assert (=> b!1437857 m!1327117))

(declare-fun m!1327121 () Bool)

(assert (=> b!1437857 m!1327121))

(declare-fun m!1327123 () Bool)

(assert (=> b!1437861 m!1327123))

(declare-fun m!1327125 () Bool)

(assert (=> b!1437861 m!1327125))

(declare-fun m!1327127 () Bool)

(assert (=> b!1437854 m!1327127))

(assert (=> b!1437854 m!1327127))

(declare-fun m!1327129 () Bool)

(assert (=> b!1437854 m!1327129))

(assert (=> b!1437860 m!1327117))

(assert (=> b!1437860 m!1327117))

(declare-fun m!1327131 () Bool)

(assert (=> b!1437860 m!1327131))

(assert (=> b!1437860 m!1327131))

(assert (=> b!1437860 m!1327117))

(declare-fun m!1327133 () Bool)

(assert (=> b!1437860 m!1327133))

(declare-fun m!1327135 () Bool)

(assert (=> b!1437856 m!1327135))

(assert (=> b!1437858 m!1327123))

(declare-fun m!1327137 () Bool)

(assert (=> b!1437858 m!1327137))

(assert (=> b!1437858 m!1327137))

(declare-fun m!1327139 () Bool)

(assert (=> b!1437858 m!1327139))

(push 1)

(assert (not b!1437859))

(assert (not b!1437860))

(assert (not b!1437856))

(assert (not start!124226))

(assert (not b!1437857))

(assert (not b!1437858))

(assert (not b!1437854))

(assert (not b!1437853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154707 () Bool)

(assert (=> d!154707 (= (validKeyInArray!0 (select (arr!47188 a!2862) i!1006)) (and (not (= (select (arr!47188 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47188 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437854 d!154707))

(declare-fun b!1437952 () Bool)

(declare-fun e!811208 () Bool)

(declare-fun lt!632430 () SeekEntryResult!11440)

(assert (=> b!1437952 (= e!811208 (bvsge (x!129879 lt!632430) #b01111111111111111111111111111110))))

(declare-fun b!1437954 () Bool)

(assert (=> b!1437954 (and (bvsge (index!48154 lt!632430) #b00000000000000000000000000000000) (bvslt (index!48154 lt!632430) (size!47738 a!2862)))))

(declare-fun res!970678 () Bool)

(assert (=> b!1437954 (= res!970678 (= (select (arr!47188 a!2862) (index!48154 lt!632430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811206 () Bool)

(assert (=> b!1437954 (=> res!970678 e!811206)))

(declare-fun b!1437955 () Bool)

(declare-fun e!811207 () Bool)

(assert (=> b!1437955 (= e!811208 e!811207)))

(declare-fun res!970677 () Bool)

(assert (=> b!1437955 (= res!970677 (and (is-Intermediate!11440 lt!632430) (not (undefined!12252 lt!632430)) (bvslt (x!129879 lt!632430) #b01111111111111111111111111111110) (bvsge (x!129879 lt!632430) #b00000000000000000000000000000000) (bvsge (x!129879 lt!632430) #b00000000000000000000000000000000)))))

(assert (=> b!1437955 (=> (not res!970677) (not e!811207))))

(declare-fun b!1437956 () Bool)

(declare-fun e!811205 () SeekEntryResult!11440)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437956 (= e!811205 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47188 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437953 () Bool)

(assert (=> b!1437953 (= e!811205 (Intermediate!11440 false (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!154709 () Bool)

(assert (=> d!154709 e!811208))

(declare-fun c!133146 () Bool)

(assert (=> d!154709 (= c!133146 (and (is-Intermediate!11440 lt!632430) (undefined!12252 lt!632430)))))

(declare-fun e!811209 () SeekEntryResult!11440)

(assert (=> d!154709 (= lt!632430 e!811209)))

(declare-fun c!133145 () Bool)

(assert (=> d!154709 (= c!133145 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!632431 () (_ BitVec 64))

(assert (=> d!154709 (= lt!632431 (select (arr!47188 a!2862) (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687)))))

(assert (=> d!154709 (validMask!0 mask!2687)))

(assert (=> d!154709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687) (select (arr!47188 a!2862) j!93) a!2862 mask!2687) lt!632430)))

(declare-fun b!1437957 () Bool)

(assert (=> b!1437957 (and (bvsge (index!48154 lt!632430) #b00000000000000000000000000000000) (bvslt (index!48154 lt!632430) (size!47738 a!2862)))))

(assert (=> b!1437957 (= e!811206 (= (select (arr!47188 a!2862) (index!48154 lt!632430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437958 () Bool)

(assert (=> b!1437958 (= e!811209 e!811205)))

(declare-fun c!133144 () Bool)

(assert (=> b!1437958 (= c!133144 (or (= lt!632431 (select (arr!47188 a!2862) j!93)) (= (bvadd lt!632431 lt!632431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437959 () Bool)

(assert (=> b!1437959 (and (bvsge (index!48154 lt!632430) #b00000000000000000000000000000000) (bvslt (index!48154 lt!632430) (size!47738 a!2862)))))

(declare-fun res!970679 () Bool)

(assert (=> b!1437959 (= res!970679 (= (select (arr!47188 a!2862) (index!48154 lt!632430)) (select (arr!47188 a!2862) j!93)))))

(assert (=> b!1437959 (=> res!970679 e!811206)))

(assert (=> b!1437959 (= e!811207 e!811206)))

(declare-fun b!1437960 () Bool)

(assert (=> b!1437960 (= e!811209 (Intermediate!11440 true (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!154709 c!133145) b!1437960))

(assert (= (and d!154709 (not c!133145)) b!1437958))

(assert (= (and b!1437958 c!133144) b!1437953))

(assert (= (and b!1437958 (not c!133144)) b!1437956))

(assert (= (and d!154709 c!133146) b!1437952))

(assert (= (and d!154709 (not c!133146)) b!1437955))

(assert (= (and b!1437955 res!970677) b!1437959))

(assert (= (and b!1437959 (not res!970679)) b!1437954))

(assert (= (and b!1437954 (not res!970678)) b!1437957))

(declare-fun m!1327165 () Bool)

(assert (=> b!1437957 m!1327165))

(assert (=> d!154709 m!1327131))

(declare-fun m!1327167 () Bool)

(assert (=> d!154709 m!1327167))

(assert (=> d!154709 m!1327113))

(assert (=> b!1437954 m!1327165))

(assert (=> b!1437956 m!1327131))

(declare-fun m!1327169 () Bool)

(assert (=> b!1437956 m!1327169))

(assert (=> b!1437956 m!1327169))

(assert (=> b!1437956 m!1327117))

(declare-fun m!1327173 () Bool)

(assert (=> b!1437956 m!1327173))

(assert (=> b!1437959 m!1327165))

(assert (=> b!1437860 d!154709))

(declare-fun d!154715 () Bool)

(declare-fun lt!632451 () (_ BitVec 32))

(declare-fun lt!632450 () (_ BitVec 32))

(assert (=> d!154715 (= lt!632451 (bvmul (bvxor lt!632450 (bvlshr lt!632450 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154715 (= lt!632450 ((_ extract 31 0) (bvand (bvxor (select (arr!47188 a!2862) j!93) (bvlshr (select (arr!47188 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154715 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970683 (let ((h!35028 ((_ extract 31 0) (bvand (bvxor (select (arr!47188 a!2862) j!93) (bvlshr (select (arr!47188 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129884 (bvmul (bvxor h!35028 (bvlshr h!35028 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129884 (bvlshr x!129884 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970683 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970683 #b00000000000000000000000000000000))))))

(assert (=> d!154715 (= (toIndex!0 (select (arr!47188 a!2862) j!93) mask!2687) (bvand (bvxor lt!632451 (bvlshr lt!632451 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437860 d!154715))

(declare-fun d!154723 () Bool)

(assert (=> d!154723 (= (validKeyInArray!0 (select (arr!47188 a!2862) j!93)) (and (not (= (select (arr!47188 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47188 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1437853 d!154723))

(declare-fun d!154725 () Bool)

(declare-fun lt!632455 () (_ BitVec 32))

(declare-fun lt!632454 () (_ BitVec 32))

(assert (=> d!154725 (= lt!632455 (bvmul (bvxor lt!632454 (bvlshr lt!632454 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154725 (= lt!632454 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154725 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970683 (let ((h!35028 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129884 (bvmul (bvxor h!35028 (bvlshr h!35028 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129884 (bvlshr x!129884 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970683 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970683 #b00000000000000000000000000000000))))))

(assert (=> d!154725 (= (toIndex!0 (select (store (arr!47188 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632455 (bvlshr lt!632455 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1437858 d!154725))

(declare-fun b!1438002 () Bool)

(declare-fun e!811240 () Bool)

(declare-fun call!67654 () Bool)

(assert (=> b!1438002 (= e!811240 call!67654)))

(declare-fun b!1438003 () Bool)

(declare-fun e!811239 () Bool)

(assert (=> b!1438003 (= e!811239 call!67654)))

(declare-fun d!154729 () Bool)

(declare-fun res!970701 () Bool)

(declare-fun e!811238 () Bool)

(assert (=> d!154729 (=> res!970701 e!811238)))

(assert (=> d!154729 (= res!970701 (bvsge #b00000000000000000000000000000000 (size!47738 a!2862)))))

(assert (=> d!154729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811238)))

(declare-fun b!1438004 () Bool)

(assert (=> b!1438004 (= e!811239 e!811240)))

(declare-fun lt!632466 () (_ BitVec 64))

(assert (=> b!1438004 (= lt!632466 (select (arr!47188 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48562 0))(
  ( (Unit!48563) )
))
(declare-fun lt!632464 () Unit!48562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97791 (_ BitVec 64) (_ BitVec 32)) Unit!48562)

(assert (=> b!1438004 (= lt!632464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632466 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438004 (arrayContainsKey!0 a!2862 lt!632466 #b00000000000000000000000000000000)))

(declare-fun lt!632465 () Unit!48562)

(assert (=> b!1438004 (= lt!632465 lt!632464)))

(declare-fun res!970702 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97791 (_ BitVec 32)) SeekEntryResult!11440)

(assert (=> b!1438004 (= res!970702 (= (seekEntryOrOpen!0 (select (arr!47188 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11440 #b00000000000000000000000000000000)))))

(assert (=> b!1438004 (=> (not res!970702) (not e!811240))))

(declare-fun bm!67651 () Bool)

(assert (=> bm!67651 (= call!67654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1438005 () Bool)

(assert (=> b!1438005 (= e!811238 e!811239)))

(declare-fun c!133158 () Bool)

(assert (=> b!1438005 (= c!133158 (validKeyInArray!0 (select (arr!47188 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154729 (not res!970701)) b!1438005))

(assert (= (and b!1438005 c!133158) b!1438004))

(assert (= (and b!1438005 (not c!133158)) b!1438003))

(assert (= (and b!1438004 res!970702) b!1438002))

(assert (= (or b!1438002 b!1438003) bm!67651))

(declare-fun m!1327197 () Bool)

(assert (=> b!1438004 m!1327197))

(declare-fun m!1327199 () Bool)

(assert (=> b!1438004 m!1327199))

(declare-fun m!1327201 () Bool)

(assert (=> b!1438004 m!1327201))

(assert (=> b!1438004 m!1327197))

(declare-fun m!1327203 () Bool)

(assert (=> b!1438004 m!1327203))

(declare-fun m!1327205 () Bool)

(assert (=> bm!67651 m!1327205))

(assert (=> b!1438005 m!1327197))

(assert (=> b!1438005 m!1327197))

(declare-fun m!1327207 () Bool)

(assert (=> b!1438005 m!1327207))

(assert (=> b!1437859 d!154729))

(declare-fun b!1438006 () Bool)

(declare-fun e!811244 () Bool)

(declare-fun lt!632469 () SeekEntryResult!11440)

(assert (=> b!1438006 (= e!811244 (bvsge (x!129879 lt!632469) #b01111111111111111111111111111110))))

(declare-fun b!1438008 () Bool)

(assert (=> b!1438008 (and (bvsge (index!48154 lt!632469) #b00000000000000000000000000000000) (bvslt (index!48154 lt!632469) (size!47738 a!2862)))))

(declare-fun res!970704 () Bool)

(assert (=> b!1438008 (= res!970704 (= (select (arr!47188 a!2862) (index!48154 lt!632469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811242 () Bool)

(assert (=> b!1438008 (=> res!970704 e!811242)))

(declare-fun b!1438009 () Bool)

(declare-fun e!811243 () Bool)

(assert (=> b!1438009 (= e!811244 e!811243)))

(declare-fun res!970703 () Bool)

(assert (=> b!1438009 (= res!970703 (and (is-Intermediate!11440 lt!632469) (not (undefined!12252 lt!632469)) (bvslt (x!129879 lt!632469) #b01111111111111111111111111111110) (bvsge (x!129879 lt!632469) #b00000000000000000000000000000000) (bvsge (x!129879 lt!632469) x!665)))))

(assert (=> b!1438009 (=> (not res!970703) (not e!811243))))

(declare-fun e!811241 () SeekEntryResult!11440)

(declare-fun b!1438010 () Bool)

(assert (=> b!1438010 (= e!811241 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47188 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438007 () Bool)

(assert (=> b!1438007 (= e!811241 (Intermediate!11440 false index!646 x!665))))

(declare-fun d!154745 () Bool)

(assert (=> d!154745 e!811244))

(declare-fun c!133161 () Bool)

(assert (=> d!154745 (= c!133161 (and (is-Intermediate!11440 lt!632469) (undefined!12252 lt!632469)))))

(declare-fun e!811245 () SeekEntryResult!11440)

(assert (=> d!154745 (= lt!632469 e!811245)))

(declare-fun c!133160 () Bool)

(assert (=> d!154745 (= c!133160 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!632470 () (_ BitVec 64))

(assert (=> d!154745 (= lt!632470 (select (arr!47188 a!2862) index!646))))

(assert (=> d!154745 (validMask!0 mask!2687)))

(assert (=> d!154745 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47188 a!2862) j!93) a!2862 mask!2687) lt!632469)))

(declare-fun b!1438011 () Bool)

(assert (=> b!1438011 (and (bvsge (index!48154 lt!632469) #b00000000000000000000000000000000) (bvslt (index!48154 lt!632469) (size!47738 a!2862)))))

(assert (=> b!1438011 (= e!811242 (= (select (arr!47188 a!2862) (index!48154 lt!632469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438012 () Bool)

(assert (=> b!1438012 (= e!811245 e!811241)))

(declare-fun c!133159 () Bool)

(assert (=> b!1438012 (= c!133159 (or (= lt!632470 (select (arr!47188 a!2862) j!93)) (= (bvadd lt!632470 lt!632470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438013 () Bool)

(assert (=> b!1438013 (and (bvsge (index!48154 lt!632469) #b00000000000000000000000000000000) (bvslt (index!48154 lt!632469) (size!47738 a!2862)))))

(declare-fun res!970705 () Bool)

(assert (=> b!1438013 (= res!970705 (= (select (arr!47188 a!2862) (index!48154 lt!632469)) (select (arr!47188 a!2862) j!93)))))

(assert (=> b!1438013 (=> res!970705 e!811242)))

(assert (=> b!1438013 (= e!811243 e!811242)))

(declare-fun b!1438014 () Bool)

(assert (=> b!1438014 (= e!811245 (Intermediate!11440 true index!646 x!665))))

(assert (= (and d!154745 c!133160) b!1438014))

(assert (= (and d!154745 (not c!133160)) b!1438012))

(assert (= (and b!1438012 c!133159) b!1438007))

(assert (= (and b!1438012 (not c!133159)) b!1438010))

(assert (= (and d!154745 c!133161) b!1438006))

(assert (= (and d!154745 (not c!133161)) b!1438009))

(assert (= (and b!1438009 res!970703) b!1438013))

(assert (= (and b!1438013 (not res!970705)) b!1438008))

(assert (= (and b!1438008 (not res!970704)) b!1438011))

(declare-fun m!1327209 () Bool)

(assert (=> b!1438011 m!1327209))

(declare-fun m!1327211 () Bool)

(assert (=> d!154745 m!1327211))

(assert (=> d!154745 m!1327113))

(assert (=> b!1438008 m!1327209))

(declare-fun m!1327213 () Bool)

(assert (=> b!1438010 m!1327213))

(assert (=> b!1438010 m!1327213))

(assert (=> b!1438010 m!1327117))

(declare-fun m!1327215 () Bool)

(assert (=> b!1438010 m!1327215))

(assert (=> b!1438013 m!1327209))

(assert (=> b!1437857 d!154745))

(declare-fun d!154747 () Bool)

(assert (=> d!154747 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124226 d!154747))

(declare-fun d!154753 () Bool)

(assert (=> d!154753 (= (array_inv!36216 a!2862) (bvsge (size!47738 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124226 d!154753))

(declare-fun b!1438033 () Bool)

(declare-fun e!811262 () Bool)

(declare-fun call!67659 () Bool)

(assert (=> b!1438033 (= e!811262 call!67659)))

(declare-fun b!1438034 () Bool)

(declare-fun e!811260 () Bool)

(assert (=> b!1438034 (= e!811260 e!811262)))

(declare-fun c!133166 () Bool)

(assert (=> b!1438034 (= c!133166 (validKeyInArray!0 (select (arr!47188 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67656 () Bool)

(assert (=> bm!67656 (= call!67659 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133166 (Cons!33685 (select (arr!47188 a!2862) #b00000000000000000000000000000000) Nil!33686) Nil!33686)))))

(declare-fun b!1438035 () Bool)

(assert (=> b!1438035 (= e!811262 call!67659)))

(declare-fun b!1438037 () Bool)

(declare-fun e!811261 () Bool)

(assert (=> b!1438037 (= e!811261 e!811260)))

(declare-fun res!970717 () Bool)

(assert (=> b!1438037 (=> (not res!970717) (not e!811260))))

(declare-fun e!811263 () Bool)

(assert (=> b!1438037 (= res!970717 (not e!811263))))

(declare-fun res!970718 () Bool)

(assert (=> b!1438037 (=> (not res!970718) (not e!811263))))

(assert (=> b!1438037 (= res!970718 (validKeyInArray!0 (select (arr!47188 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438036 () Bool)

(declare-fun contains!9890 (List!33689 (_ BitVec 64)) Bool)

(assert (=> b!1438036 (= e!811263 (contains!9890 Nil!33686 (select (arr!47188 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154755 () Bool)

(declare-fun res!970716 () Bool)

(assert (=> d!154755 (=> res!970716 e!811261)))

(assert (=> d!154755 (= res!970716 (bvsge #b00000000000000000000000000000000 (size!47738 a!2862)))))

(assert (=> d!154755 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33686) e!811261)))

(assert (= (and d!154755 (not res!970716)) b!1438037))

(assert (= (and b!1438037 res!970718) b!1438036))

(assert (= (and b!1438037 res!970717) b!1438034))

(assert (= (and b!1438034 c!133166) b!1438035))

(assert (= (and b!1438034 (not c!133166)) b!1438033))

(assert (= (or b!1438035 b!1438033) bm!67656))

(assert (=> b!1438034 m!1327197))

(assert (=> b!1438034 m!1327197))

(assert (=> b!1438034 m!1327207))

(assert (=> bm!67656 m!1327197))

(declare-fun m!1327219 () Bool)

(assert (=> bm!67656 m!1327219))

(assert (=> b!1438037 m!1327197))

(assert (=> b!1438037 m!1327197))

(assert (=> b!1438037 m!1327207))

(assert (=> b!1438036 m!1327197))

(assert (=> b!1438036 m!1327197))

(declare-fun m!1327227 () Bool)

(assert (=> b!1438036 m!1327227))

(assert (=> b!1437856 d!154755))

(push 1)

(assert (not d!154709))

(assert (not b!1438034))

(assert (not b!1438037))

(assert (not b!1438005))

(assert (not b!1438010))

(assert (not d!154745))

(assert (not bm!67656))

(assert (not b!1438036))

(assert (not b!1438004))

(assert (not b!1437956))

(assert (not bm!67651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

