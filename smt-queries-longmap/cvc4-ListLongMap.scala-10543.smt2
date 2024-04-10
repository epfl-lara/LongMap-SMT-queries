; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124358 () Bool)

(assert start!124358)

(declare-fun b!1438950 () Bool)

(declare-fun res!971505 () Bool)

(declare-fun e!811640 () Bool)

(assert (=> b!1438950 (=> (not res!971505) (not e!811640))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11464 0))(
  ( (MissingZero!11464 (index!48248 (_ BitVec 32))) (Found!11464 (index!48249 (_ BitVec 32))) (Intermediate!11464 (undefined!12276 Bool) (index!48250 (_ BitVec 32)) (x!129979 (_ BitVec 32))) (Undefined!11464) (MissingVacant!11464 (index!48251 (_ BitVec 32))) )
))
(declare-fun lt!632678 () SeekEntryResult!11464)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97845 0))(
  ( (array!97846 (arr!47212 (Array (_ BitVec 32) (_ BitVec 64))) (size!47762 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97845)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97845 (_ BitVec 32)) SeekEntryResult!11464)

(assert (=> b!1438950 (= res!971505 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47212 a!2862) j!93) a!2862 mask!2687) lt!632678))))

(declare-fun b!1438951 () Bool)

(declare-fun res!971500 () Bool)

(declare-fun e!811642 () Bool)

(assert (=> b!1438951 (=> (not res!971500) (not e!811642))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438951 (= res!971500 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47762 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47762 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47762 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438952 () Bool)

(declare-fun res!971501 () Bool)

(assert (=> b!1438952 (=> (not res!971501) (not e!811642))))

(declare-datatypes ((List!33713 0))(
  ( (Nil!33710) (Cons!33709 (h!35056 (_ BitVec 64)) (t!48407 List!33713)) )
))
(declare-fun arrayNoDuplicates!0 (array!97845 (_ BitVec 32) List!33713) Bool)

(assert (=> b!1438952 (= res!971501 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33710))))

(declare-fun e!811643 () Bool)

(declare-fun lt!632679 () (_ BitVec 32))

(declare-fun b!1438953 () Bool)

(assert (=> b!1438953 (= e!811643 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632679 #b00000000000000000000000000000000) (bvsge lt!632679 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun b!1438954 () Bool)

(declare-fun res!971509 () Bool)

(assert (=> b!1438954 (=> (not res!971509) (not e!811642))))

(assert (=> b!1438954 (= res!971509 (and (= (size!47762 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47762 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47762 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438956 () Bool)

(assert (=> b!1438956 (= e!811640 e!811643)))

(declare-fun res!971503 () Bool)

(assert (=> b!1438956 (=> (not res!971503) (not e!811643))))

(assert (=> b!1438956 (= res!971503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632679 (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862)) mask!2687) (Intermediate!11464 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438956 (= lt!632679 (toIndex!0 (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438957 () Bool)

(assert (=> b!1438957 (= e!811642 e!811640)))

(declare-fun res!971507 () Bool)

(assert (=> b!1438957 (=> (not res!971507) (not e!811640))))

(assert (=> b!1438957 (= res!971507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) (select (arr!47212 a!2862) j!93) a!2862 mask!2687) lt!632678))))

(assert (=> b!1438957 (= lt!632678 (Intermediate!11464 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438955 () Bool)

(declare-fun res!971508 () Bool)

(assert (=> b!1438955 (=> (not res!971508) (not e!811642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438955 (= res!971508 (validKeyInArray!0 (select (arr!47212 a!2862) j!93)))))

(declare-fun res!971504 () Bool)

(assert (=> start!124358 (=> (not res!971504) (not e!811642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124358 (= res!971504 (validMask!0 mask!2687))))

(assert (=> start!124358 e!811642))

(assert (=> start!124358 true))

(declare-fun array_inv!36240 (array!97845) Bool)

(assert (=> start!124358 (array_inv!36240 a!2862)))

(declare-fun b!1438958 () Bool)

(declare-fun res!971506 () Bool)

(assert (=> b!1438958 (=> (not res!971506) (not e!811642))))

(assert (=> b!1438958 (= res!971506 (validKeyInArray!0 (select (arr!47212 a!2862) i!1006)))))

(declare-fun b!1438959 () Bool)

(declare-fun res!971502 () Bool)

(assert (=> b!1438959 (=> (not res!971502) (not e!811642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97845 (_ BitVec 32)) Bool)

(assert (=> b!1438959 (= res!971502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124358 res!971504) b!1438954))

(assert (= (and b!1438954 res!971509) b!1438958))

(assert (= (and b!1438958 res!971506) b!1438955))

(assert (= (and b!1438955 res!971508) b!1438959))

(assert (= (and b!1438959 res!971502) b!1438952))

(assert (= (and b!1438952 res!971501) b!1438951))

(assert (= (and b!1438951 res!971500) b!1438957))

(assert (= (and b!1438957 res!971507) b!1438950))

(assert (= (and b!1438950 res!971505) b!1438956))

(assert (= (and b!1438956 res!971503) b!1438953))

(declare-fun m!1328087 () Bool)

(assert (=> b!1438950 m!1328087))

(assert (=> b!1438950 m!1328087))

(declare-fun m!1328089 () Bool)

(assert (=> b!1438950 m!1328089))

(assert (=> b!1438955 m!1328087))

(assert (=> b!1438955 m!1328087))

(declare-fun m!1328091 () Bool)

(assert (=> b!1438955 m!1328091))

(declare-fun m!1328093 () Bool)

(assert (=> b!1438956 m!1328093))

(declare-fun m!1328095 () Bool)

(assert (=> b!1438956 m!1328095))

(assert (=> b!1438956 m!1328095))

(declare-fun m!1328097 () Bool)

(assert (=> b!1438956 m!1328097))

(assert (=> b!1438956 m!1328095))

(declare-fun m!1328099 () Bool)

(assert (=> b!1438956 m!1328099))

(declare-fun m!1328101 () Bool)

(assert (=> start!124358 m!1328101))

(declare-fun m!1328103 () Bool)

(assert (=> start!124358 m!1328103))

(declare-fun m!1328105 () Bool)

(assert (=> b!1438952 m!1328105))

(assert (=> b!1438951 m!1328093))

(declare-fun m!1328107 () Bool)

(assert (=> b!1438951 m!1328107))

(assert (=> b!1438957 m!1328087))

(assert (=> b!1438957 m!1328087))

(declare-fun m!1328109 () Bool)

(assert (=> b!1438957 m!1328109))

(assert (=> b!1438957 m!1328109))

(assert (=> b!1438957 m!1328087))

(declare-fun m!1328111 () Bool)

(assert (=> b!1438957 m!1328111))

(declare-fun m!1328113 () Bool)

(assert (=> b!1438958 m!1328113))

(assert (=> b!1438958 m!1328113))

(declare-fun m!1328115 () Bool)

(assert (=> b!1438958 m!1328115))

(declare-fun m!1328117 () Bool)

(assert (=> b!1438959 m!1328117))

(push 1)

(assert (not b!1438955))

(assert (not b!1438952))

(assert (not b!1438958))

(assert (not b!1438957))

(assert (not b!1438956))

(assert (not b!1438959))

(assert (not b!1438950))

(assert (not start!124358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!811715 () SeekEntryResult!11464)

(declare-fun b!1439077 () Bool)

(assert (=> b!1439077 (= e!811715 (Intermediate!11464 true (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439078 () Bool)

(declare-fun e!811717 () SeekEntryResult!11464)

(assert (=> b!1439078 (= e!811715 e!811717)))

(declare-fun c!133272 () Bool)

(declare-fun lt!632718 () (_ BitVec 64))

(assert (=> b!1439078 (= c!133272 (or (= lt!632718 (select (arr!47212 a!2862) j!93)) (= (bvadd lt!632718 lt!632718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439079 () Bool)

(declare-fun lt!632717 () SeekEntryResult!11464)

(assert (=> b!1439079 (and (bvsge (index!48250 lt!632717) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632717) (size!47762 a!2862)))))

(declare-fun res!971557 () Bool)

(assert (=> b!1439079 (= res!971557 (= (select (arr!47212 a!2862) (index!48250 lt!632717)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811716 () Bool)

(assert (=> b!1439079 (=> res!971557 e!811716)))

(declare-fun b!1439080 () Bool)

(assert (=> b!1439080 (= e!811717 (Intermediate!11464 false (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439081 () Bool)

(declare-fun e!811718 () Bool)

(assert (=> b!1439081 (= e!811718 (bvsge (x!129979 lt!632717) #b01111111111111111111111111111110))))

(declare-fun b!1439082 () Bool)

(declare-fun e!811719 () Bool)

(assert (=> b!1439082 (= e!811718 e!811719)))

(declare-fun res!971558 () Bool)

(assert (=> b!1439082 (= res!971558 (and (is-Intermediate!11464 lt!632717) (not (undefined!12276 lt!632717)) (bvslt (x!129979 lt!632717) #b01111111111111111111111111111110) (bvsge (x!129979 lt!632717) #b00000000000000000000000000000000) (bvsge (x!129979 lt!632717) #b00000000000000000000000000000000)))))

(assert (=> b!1439082 (=> (not res!971558) (not e!811719))))

(declare-fun d!154849 () Bool)

(assert (=> d!154849 e!811718))

(declare-fun c!133270 () Bool)

(assert (=> d!154849 (= c!133270 (and (is-Intermediate!11464 lt!632717) (undefined!12276 lt!632717)))))

(assert (=> d!154849 (= lt!632717 e!811715)))

(declare-fun c!133271 () Bool)

(assert (=> d!154849 (= c!133271 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154849 (= lt!632718 (select (arr!47212 a!2862) (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687)))))

(assert (=> d!154849 (validMask!0 mask!2687)))

(assert (=> d!154849 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) (select (arr!47212 a!2862) j!93) a!2862 mask!2687) lt!632717)))

(declare-fun b!1439083 () Bool)

(assert (=> b!1439083 (and (bvsge (index!48250 lt!632717) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632717) (size!47762 a!2862)))))

(assert (=> b!1439083 (= e!811716 (= (select (arr!47212 a!2862) (index!48250 lt!632717)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439084 () Bool)

(assert (=> b!1439084 (and (bvsge (index!48250 lt!632717) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632717) (size!47762 a!2862)))))

(declare-fun res!971559 () Bool)

(assert (=> b!1439084 (= res!971559 (= (select (arr!47212 a!2862) (index!48250 lt!632717)) (select (arr!47212 a!2862) j!93)))))

(assert (=> b!1439084 (=> res!971559 e!811716)))

(assert (=> b!1439084 (= e!811719 e!811716)))

(declare-fun b!1439085 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439085 (= e!811717 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47212 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!154849 c!133271) b!1439077))

(assert (= (and d!154849 (not c!133271)) b!1439078))

(assert (= (and b!1439078 c!133272) b!1439080))

(assert (= (and b!1439078 (not c!133272)) b!1439085))

(assert (= (and d!154849 c!133270) b!1439081))

(assert (= (and d!154849 (not c!133270)) b!1439082))

(assert (= (and b!1439082 res!971558) b!1439084))

(assert (= (and b!1439084 (not res!971559)) b!1439079))

(assert (= (and b!1439079 (not res!971557)) b!1439083))

(assert (=> b!1439085 m!1328109))

(declare-fun m!1328167 () Bool)

(assert (=> b!1439085 m!1328167))

(assert (=> b!1439085 m!1328167))

(assert (=> b!1439085 m!1328087))

(declare-fun m!1328169 () Bool)

(assert (=> b!1439085 m!1328169))

(declare-fun m!1328171 () Bool)

(assert (=> b!1439079 m!1328171))

(assert (=> d!154849 m!1328109))

(declare-fun m!1328173 () Bool)

(assert (=> d!154849 m!1328173))

(assert (=> d!154849 m!1328101))

(assert (=> b!1439084 m!1328171))

(assert (=> b!1439083 m!1328171))

(assert (=> b!1438957 d!154849))

(declare-fun d!154869 () Bool)

(declare-fun lt!632730 () (_ BitVec 32))

(declare-fun lt!632729 () (_ BitVec 32))

(assert (=> d!154869 (= lt!632730 (bvmul (bvxor lt!632729 (bvlshr lt!632729 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154869 (= lt!632729 ((_ extract 31 0) (bvand (bvxor (select (arr!47212 a!2862) j!93) (bvlshr (select (arr!47212 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154869 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971560 (let ((h!35059 ((_ extract 31 0) (bvand (bvxor (select (arr!47212 a!2862) j!93) (bvlshr (select (arr!47212 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129985 (bvmul (bvxor h!35059 (bvlshr h!35059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129985 (bvlshr x!129985 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971560 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971560 #b00000000000000000000000000000000))))))

(assert (=> d!154869 (= (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) (bvand (bvxor lt!632730 (bvlshr lt!632730 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438957 d!154869))

(declare-fun d!154873 () Bool)

(declare-fun res!971578 () Bool)

(declare-fun e!811743 () Bool)

(assert (=> d!154873 (=> res!971578 e!811743)))

(assert (=> d!154873 (= res!971578 (bvsge #b00000000000000000000000000000000 (size!47762 a!2862)))))

(assert (=> d!154873 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33710) e!811743)))

(declare-fun bm!67687 () Bool)

(declare-fun call!67690 () Bool)

(declare-fun c!133278 () Bool)

(assert (=> bm!67687 (= call!67690 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133278 (Cons!33709 (select (arr!47212 a!2862) #b00000000000000000000000000000000) Nil!33710) Nil!33710)))))

(declare-fun b!1439111 () Bool)

(declare-fun e!811742 () Bool)

(declare-fun e!811740 () Bool)

(assert (=> b!1439111 (= e!811742 e!811740)))

(assert (=> b!1439111 (= c!133278 (validKeyInArray!0 (select (arr!47212 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439112 () Bool)

(declare-fun e!811741 () Bool)

(declare-fun contains!9895 (List!33713 (_ BitVec 64)) Bool)

(assert (=> b!1439112 (= e!811741 (contains!9895 Nil!33710 (select (arr!47212 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439113 () Bool)

(assert (=> b!1439113 (= e!811740 call!67690)))

(declare-fun b!1439114 () Bool)

(assert (=> b!1439114 (= e!811740 call!67690)))

(declare-fun b!1439115 () Bool)

(assert (=> b!1439115 (= e!811743 e!811742)))

(declare-fun res!971577 () Bool)

(assert (=> b!1439115 (=> (not res!971577) (not e!811742))))

(assert (=> b!1439115 (= res!971577 (not e!811741))))

(declare-fun res!971576 () Bool)

(assert (=> b!1439115 (=> (not res!971576) (not e!811741))))

(assert (=> b!1439115 (= res!971576 (validKeyInArray!0 (select (arr!47212 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154873 (not res!971578)) b!1439115))

(assert (= (and b!1439115 res!971576) b!1439112))

(assert (= (and b!1439115 res!971577) b!1439111))

(assert (= (and b!1439111 c!133278) b!1439114))

(assert (= (and b!1439111 (not c!133278)) b!1439113))

(assert (= (or b!1439114 b!1439113) bm!67687))

(declare-fun m!1328183 () Bool)

(assert (=> bm!67687 m!1328183))

(declare-fun m!1328185 () Bool)

(assert (=> bm!67687 m!1328185))

(assert (=> b!1439111 m!1328183))

(assert (=> b!1439111 m!1328183))

(declare-fun m!1328187 () Bool)

(assert (=> b!1439111 m!1328187))

(assert (=> b!1439112 m!1328183))

(assert (=> b!1439112 m!1328183))

(declare-fun m!1328189 () Bool)

(assert (=> b!1439112 m!1328189))

(assert (=> b!1439115 m!1328183))

(assert (=> b!1439115 m!1328183))

(assert (=> b!1439115 m!1328187))

(assert (=> b!1438952 d!154873))

(declare-fun d!154877 () Bool)

(assert (=> d!154877 (= (validKeyInArray!0 (select (arr!47212 a!2862) i!1006)) (and (not (= (select (arr!47212 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47212 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438958 d!154877))

(declare-fun bm!67693 () Bool)

(declare-fun call!67696 () Bool)

(assert (=> bm!67693 (= call!67696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1439145 () Bool)

(declare-fun e!811765 () Bool)

(declare-fun e!811766 () Bool)

(assert (=> b!1439145 (= e!811765 e!811766)))

(declare-fun c!133287 () Bool)

(assert (=> b!1439145 (= c!133287 (validKeyInArray!0 (select (arr!47212 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439146 () Bool)

(assert (=> b!1439146 (= e!811766 call!67696)))

(declare-fun d!154879 () Bool)

(declare-fun res!971592 () Bool)

(assert (=> d!154879 (=> res!971592 e!811765)))

(assert (=> d!154879 (= res!971592 (bvsge #b00000000000000000000000000000000 (size!47762 a!2862)))))

(assert (=> d!154879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811765)))

(declare-fun b!1439147 () Bool)

(declare-fun e!811764 () Bool)

(assert (=> b!1439147 (= e!811766 e!811764)))

(declare-fun lt!632750 () (_ BitVec 64))

(assert (=> b!1439147 (= lt!632750 (select (arr!47212 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48574 0))(
  ( (Unit!48575) )
))
(declare-fun lt!632749 () Unit!48574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97845 (_ BitVec 64) (_ BitVec 32)) Unit!48574)

(assert (=> b!1439147 (= lt!632749 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632750 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1439147 (arrayContainsKey!0 a!2862 lt!632750 #b00000000000000000000000000000000)))

(declare-fun lt!632748 () Unit!48574)

(assert (=> b!1439147 (= lt!632748 lt!632749)))

(declare-fun res!971593 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97845 (_ BitVec 32)) SeekEntryResult!11464)

(assert (=> b!1439147 (= res!971593 (= (seekEntryOrOpen!0 (select (arr!47212 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11464 #b00000000000000000000000000000000)))))

(assert (=> b!1439147 (=> (not res!971593) (not e!811764))))

(declare-fun b!1439148 () Bool)

(assert (=> b!1439148 (= e!811764 call!67696)))

(assert (= (and d!154879 (not res!971592)) b!1439145))

(assert (= (and b!1439145 c!133287) b!1439147))

(assert (= (and b!1439145 (not c!133287)) b!1439146))

(assert (= (and b!1439147 res!971593) b!1439148))

(assert (= (or b!1439148 b!1439146) bm!67693))

(declare-fun m!1328207 () Bool)

(assert (=> bm!67693 m!1328207))

(assert (=> b!1439145 m!1328183))

(assert (=> b!1439145 m!1328183))

(assert (=> b!1439145 m!1328187))

(assert (=> b!1439147 m!1328183))

(declare-fun m!1328209 () Bool)

(assert (=> b!1439147 m!1328209))

(declare-fun m!1328211 () Bool)

(assert (=> b!1439147 m!1328211))

(assert (=> b!1439147 m!1328183))

(declare-fun m!1328213 () Bool)

(assert (=> b!1439147 m!1328213))

(assert (=> b!1438959 d!154879))

(declare-fun d!154885 () Bool)

(assert (=> d!154885 (= (validKeyInArray!0 (select (arr!47212 a!2862) j!93)) (and (not (= (select (arr!47212 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47212 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438955 d!154885))

(declare-fun b!1439149 () Bool)

(declare-fun e!811767 () SeekEntryResult!11464)

(assert (=> b!1439149 (= e!811767 (Intermediate!11464 true index!646 x!665))))

(declare-fun b!1439150 () Bool)

(declare-fun e!811769 () SeekEntryResult!11464)

(assert (=> b!1439150 (= e!811767 e!811769)))

(declare-fun c!133290 () Bool)

(declare-fun lt!632752 () (_ BitVec 64))

(assert (=> b!1439150 (= c!133290 (or (= lt!632752 (select (arr!47212 a!2862) j!93)) (= (bvadd lt!632752 lt!632752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439151 () Bool)

(declare-fun lt!632751 () SeekEntryResult!11464)

(assert (=> b!1439151 (and (bvsge (index!48250 lt!632751) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632751) (size!47762 a!2862)))))

(declare-fun res!971594 () Bool)

(assert (=> b!1439151 (= res!971594 (= (select (arr!47212 a!2862) (index!48250 lt!632751)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811768 () Bool)

(assert (=> b!1439151 (=> res!971594 e!811768)))

(declare-fun b!1439152 () Bool)

(assert (=> b!1439152 (= e!811769 (Intermediate!11464 false index!646 x!665))))

(declare-fun b!1439153 () Bool)

(declare-fun e!811770 () Bool)

(assert (=> b!1439153 (= e!811770 (bvsge (x!129979 lt!632751) #b01111111111111111111111111111110))))

(declare-fun b!1439154 () Bool)

(declare-fun e!811771 () Bool)

(assert (=> b!1439154 (= e!811770 e!811771)))

(declare-fun res!971595 () Bool)

(assert (=> b!1439154 (= res!971595 (and (is-Intermediate!11464 lt!632751) (not (undefined!12276 lt!632751)) (bvslt (x!129979 lt!632751) #b01111111111111111111111111111110) (bvsge (x!129979 lt!632751) #b00000000000000000000000000000000) (bvsge (x!129979 lt!632751) x!665)))))

(assert (=> b!1439154 (=> (not res!971595) (not e!811771))))

(declare-fun d!154887 () Bool)

(assert (=> d!154887 e!811770))

(declare-fun c!133288 () Bool)

(assert (=> d!154887 (= c!133288 (and (is-Intermediate!11464 lt!632751) (undefined!12276 lt!632751)))))

(assert (=> d!154887 (= lt!632751 e!811767)))

(declare-fun c!133289 () Bool)

(assert (=> d!154887 (= c!133289 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154887 (= lt!632752 (select (arr!47212 a!2862) index!646))))

(assert (=> d!154887 (validMask!0 mask!2687)))

(assert (=> d!154887 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47212 a!2862) j!93) a!2862 mask!2687) lt!632751)))

(declare-fun b!1439155 () Bool)

(assert (=> b!1439155 (and (bvsge (index!48250 lt!632751) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632751) (size!47762 a!2862)))))

(assert (=> b!1439155 (= e!811768 (= (select (arr!47212 a!2862) (index!48250 lt!632751)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439156 () Bool)

(assert (=> b!1439156 (and (bvsge (index!48250 lt!632751) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632751) (size!47762 a!2862)))))

(declare-fun res!971596 () Bool)

(assert (=> b!1439156 (= res!971596 (= (select (arr!47212 a!2862) (index!48250 lt!632751)) (select (arr!47212 a!2862) j!93)))))

(assert (=> b!1439156 (=> res!971596 e!811768)))

(assert (=> b!1439156 (= e!811771 e!811768)))

(declare-fun b!1439157 () Bool)

(assert (=> b!1439157 (= e!811769 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47212 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!154887 c!133289) b!1439149))

(assert (= (and d!154887 (not c!133289)) b!1439150))

(assert (= (and b!1439150 c!133290) b!1439152))

(assert (= (and b!1439150 (not c!133290)) b!1439157))

(assert (= (and d!154887 c!133288) b!1439153))

(assert (= (and d!154887 (not c!133288)) b!1439154))

(assert (= (and b!1439154 res!971595) b!1439156))

(assert (= (and b!1439156 (not res!971596)) b!1439151))

(assert (= (and b!1439151 (not res!971594)) b!1439155))

(declare-fun m!1328215 () Bool)

(assert (=> b!1439157 m!1328215))

(assert (=> b!1439157 m!1328215))

(assert (=> b!1439157 m!1328087))

(declare-fun m!1328217 () Bool)

(assert (=> b!1439157 m!1328217))

(declare-fun m!1328219 () Bool)

(assert (=> b!1439151 m!1328219))

(declare-fun m!1328221 () Bool)

(assert (=> d!154887 m!1328221))

(assert (=> d!154887 m!1328101))

(assert (=> b!1439156 m!1328219))

(assert (=> b!1439155 m!1328219))

(assert (=> b!1438950 d!154887))

(declare-fun d!154889 () Bool)

(assert (=> d!154889 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124358 d!154889))

(declare-fun d!154901 () Bool)

(assert (=> d!154901 (= (array_inv!36240 a!2862) (bvsge (size!47762 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124358 d!154901))

(declare-fun b!1439167 () Bool)

(declare-fun e!811777 () SeekEntryResult!11464)

(assert (=> b!1439167 (= e!811777 (Intermediate!11464 true lt!632679 #b00000000000000000000000000000000))))

(declare-fun b!1439168 () Bool)

(declare-fun e!811779 () SeekEntryResult!11464)

(assert (=> b!1439168 (= e!811777 e!811779)))

(declare-fun c!133296 () Bool)

(declare-fun lt!632758 () (_ BitVec 64))

(assert (=> b!1439168 (= c!133296 (or (= lt!632758 (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632758 lt!632758) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439169 () Bool)

(declare-fun lt!632757 () SeekEntryResult!11464)

(assert (=> b!1439169 (and (bvsge (index!48250 lt!632757) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632757) (size!47762 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862)))))))

(declare-fun res!971600 () Bool)

(assert (=> b!1439169 (= res!971600 (= (select (arr!47212 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862))) (index!48250 lt!632757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!811778 () Bool)

(assert (=> b!1439169 (=> res!971600 e!811778)))

(declare-fun b!1439170 () Bool)

(assert (=> b!1439170 (= e!811779 (Intermediate!11464 false lt!632679 #b00000000000000000000000000000000))))

(declare-fun b!1439171 () Bool)

(declare-fun e!811780 () Bool)

(assert (=> b!1439171 (= e!811780 (bvsge (x!129979 lt!632757) #b01111111111111111111111111111110))))

(declare-fun b!1439172 () Bool)

(declare-fun e!811781 () Bool)

(assert (=> b!1439172 (= e!811780 e!811781)))

(declare-fun res!971601 () Bool)

(assert (=> b!1439172 (= res!971601 (and (is-Intermediate!11464 lt!632757) (not (undefined!12276 lt!632757)) (bvslt (x!129979 lt!632757) #b01111111111111111111111111111110) (bvsge (x!129979 lt!632757) #b00000000000000000000000000000000) (bvsge (x!129979 lt!632757) #b00000000000000000000000000000000)))))

(assert (=> b!1439172 (=> (not res!971601) (not e!811781))))

(declare-fun d!154903 () Bool)

(assert (=> d!154903 e!811780))

(declare-fun c!133294 () Bool)

(assert (=> d!154903 (= c!133294 (and (is-Intermediate!11464 lt!632757) (undefined!12276 lt!632757)))))

(assert (=> d!154903 (= lt!632757 e!811777)))

(declare-fun c!133295 () Bool)

(assert (=> d!154903 (= c!133295 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154903 (= lt!632758 (select (arr!47212 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862))) lt!632679))))

(assert (=> d!154903 (validMask!0 mask!2687)))

(assert (=> d!154903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632679 (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862)) mask!2687) lt!632757)))

(declare-fun b!1439173 () Bool)

(assert (=> b!1439173 (and (bvsge (index!48250 lt!632757) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632757) (size!47762 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862)))))))

(assert (=> b!1439173 (= e!811778 (= (select (arr!47212 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862))) (index!48250 lt!632757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439174 () Bool)

(assert (=> b!1439174 (and (bvsge (index!48250 lt!632757) #b00000000000000000000000000000000) (bvslt (index!48250 lt!632757) (size!47762 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862)))))))

(declare-fun res!971602 () Bool)

(assert (=> b!1439174 (= res!971602 (= (select (arr!47212 (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862))) (index!48250 lt!632757)) (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(assert (=> b!1439174 (=> res!971602 e!811778)))

(assert (=> b!1439174 (= e!811781 e!811778)))

(declare-fun b!1439175 () Bool)

(assert (=> b!1439175 (= e!811779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!632679 #b00000000000000000000000000000000 mask!2687) (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97846 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47762 a!2862)) mask!2687))))

(assert (= (and d!154903 c!133295) b!1439167))

(assert (= (and d!154903 (not c!133295)) b!1439168))

(assert (= (and b!1439168 c!133296) b!1439170))

(assert (= (and b!1439168 (not c!133296)) b!1439175))

(assert (= (and d!154903 c!133294) b!1439171))

(assert (= (and d!154903 (not c!133294)) b!1439172))

(assert (= (and b!1439172 res!971601) b!1439174))

(assert (= (and b!1439174 (not res!971602)) b!1439169))

(assert (= (and b!1439169 (not res!971600)) b!1439173))

(declare-fun m!1328231 () Bool)

(assert (=> b!1439175 m!1328231))

(assert (=> b!1439175 m!1328231))

(assert (=> b!1439175 m!1328095))

(declare-fun m!1328233 () Bool)

(assert (=> b!1439175 m!1328233))

(declare-fun m!1328235 () Bool)

(assert (=> b!1439169 m!1328235))

(declare-fun m!1328237 () Bool)

(assert (=> d!154903 m!1328237))

(assert (=> d!154903 m!1328101))

(assert (=> b!1439174 m!1328235))

(assert (=> b!1439173 m!1328235))

(assert (=> b!1438956 d!154903))

(declare-fun d!154905 () Bool)

(declare-fun lt!632760 () (_ BitVec 32))

(declare-fun lt!632759 () (_ BitVec 32))

(assert (=> d!154905 (= lt!632760 (bvmul (bvxor lt!632759 (bvlshr lt!632759 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154905 (= lt!632759 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154905 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971560 (let ((h!35059 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129985 (bvmul (bvxor h!35059 (bvlshr h!35059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129985 (bvlshr x!129985 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971560 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971560 #b00000000000000000000000000000000))))))

(assert (=> d!154905 (= (toIndex!0 (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632760 (bvlshr lt!632760 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438956 d!154905))

(push 1)

