; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124356 () Bool)

(assert start!124356)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1438920 () Bool)

(declare-fun lt!632673 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!811631 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1438920 (= e!811631 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632673 #b00000000000000000000000000000000) (bvsge lt!632673 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun b!1438921 () Bool)

(declare-fun res!971473 () Bool)

(declare-fun e!811630 () Bool)

(assert (=> b!1438921 (=> (not res!971473) (not e!811630))))

(declare-datatypes ((array!97843 0))(
  ( (array!97844 (arr!47211 (Array (_ BitVec 32) (_ BitVec 64))) (size!47761 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97843)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438921 (= res!971473 (validKeyInArray!0 (select (arr!47211 a!2862) j!93)))))

(declare-fun res!971472 () Bool)

(assert (=> start!124356 (=> (not res!971472) (not e!811630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124356 (= res!971472 (validMask!0 mask!2687))))

(assert (=> start!124356 e!811630))

(assert (=> start!124356 true))

(declare-fun array_inv!36239 (array!97843) Bool)

(assert (=> start!124356 (array_inv!36239 a!2862)))

(declare-fun b!1438922 () Bool)

(declare-fun res!971478 () Bool)

(assert (=> b!1438922 (=> (not res!971478) (not e!811630))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438922 (= res!971478 (validKeyInArray!0 (select (arr!47211 a!2862) i!1006)))))

(declare-fun b!1438923 () Bool)

(declare-fun e!811629 () Bool)

(assert (=> b!1438923 (= e!811630 e!811629)))

(declare-fun res!971476 () Bool)

(assert (=> b!1438923 (=> (not res!971476) (not e!811629))))

(declare-datatypes ((SeekEntryResult!11463 0))(
  ( (MissingZero!11463 (index!48244 (_ BitVec 32))) (Found!11463 (index!48245 (_ BitVec 32))) (Intermediate!11463 (undefined!12275 Bool) (index!48246 (_ BitVec 32)) (x!129978 (_ BitVec 32))) (Undefined!11463) (MissingVacant!11463 (index!48247 (_ BitVec 32))) )
))
(declare-fun lt!632672 () SeekEntryResult!11463)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97843 (_ BitVec 32)) SeekEntryResult!11463)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438923 (= res!971476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687) (select (arr!47211 a!2862) j!93) a!2862 mask!2687) lt!632672))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438923 (= lt!632672 (Intermediate!11463 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438924 () Bool)

(assert (=> b!1438924 (= e!811629 e!811631)))

(declare-fun res!971474 () Bool)

(assert (=> b!1438924 (=> (not res!971474) (not e!811631))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438924 (= res!971474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632673 (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)) mask!2687) (Intermediate!11463 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1438924 (= lt!632673 (toIndex!0 (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438925 () Bool)

(declare-fun res!971471 () Bool)

(assert (=> b!1438925 (=> (not res!971471) (not e!811630))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438925 (= res!971471 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47761 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47761 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47761 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438926 () Bool)

(declare-fun res!971477 () Bool)

(assert (=> b!1438926 (=> (not res!971477) (not e!811629))))

(assert (=> b!1438926 (= res!971477 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47211 a!2862) j!93) a!2862 mask!2687) lt!632672))))

(declare-fun b!1438927 () Bool)

(declare-fun res!971475 () Bool)

(assert (=> b!1438927 (=> (not res!971475) (not e!811630))))

(declare-datatypes ((List!33712 0))(
  ( (Nil!33709) (Cons!33708 (h!35055 (_ BitVec 64)) (t!48406 List!33712)) )
))
(declare-fun arrayNoDuplicates!0 (array!97843 (_ BitVec 32) List!33712) Bool)

(assert (=> b!1438927 (= res!971475 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33709))))

(declare-fun b!1438928 () Bool)

(declare-fun res!971470 () Bool)

(assert (=> b!1438928 (=> (not res!971470) (not e!811630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97843 (_ BitVec 32)) Bool)

(assert (=> b!1438928 (= res!971470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438929 () Bool)

(declare-fun res!971479 () Bool)

(assert (=> b!1438929 (=> (not res!971479) (not e!811630))))

(assert (=> b!1438929 (= res!971479 (and (= (size!47761 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47761 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47761 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124356 res!971472) b!1438929))

(assert (= (and b!1438929 res!971479) b!1438922))

(assert (= (and b!1438922 res!971478) b!1438921))

(assert (= (and b!1438921 res!971473) b!1438928))

(assert (= (and b!1438928 res!971470) b!1438927))

(assert (= (and b!1438927 res!971475) b!1438925))

(assert (= (and b!1438925 res!971471) b!1438923))

(assert (= (and b!1438923 res!971476) b!1438926))

(assert (= (and b!1438926 res!971477) b!1438924))

(assert (= (and b!1438924 res!971474) b!1438920))

(declare-fun m!1328055 () Bool)

(assert (=> b!1438926 m!1328055))

(assert (=> b!1438926 m!1328055))

(declare-fun m!1328057 () Bool)

(assert (=> b!1438926 m!1328057))

(declare-fun m!1328059 () Bool)

(assert (=> b!1438928 m!1328059))

(declare-fun m!1328061 () Bool)

(assert (=> b!1438922 m!1328061))

(assert (=> b!1438922 m!1328061))

(declare-fun m!1328063 () Bool)

(assert (=> b!1438922 m!1328063))

(assert (=> b!1438921 m!1328055))

(assert (=> b!1438921 m!1328055))

(declare-fun m!1328065 () Bool)

(assert (=> b!1438921 m!1328065))

(declare-fun m!1328067 () Bool)

(assert (=> start!124356 m!1328067))

(declare-fun m!1328069 () Bool)

(assert (=> start!124356 m!1328069))

(declare-fun m!1328071 () Bool)

(assert (=> b!1438927 m!1328071))

(declare-fun m!1328073 () Bool)

(assert (=> b!1438924 m!1328073))

(declare-fun m!1328075 () Bool)

(assert (=> b!1438924 m!1328075))

(assert (=> b!1438924 m!1328075))

(declare-fun m!1328077 () Bool)

(assert (=> b!1438924 m!1328077))

(assert (=> b!1438924 m!1328075))

(declare-fun m!1328079 () Bool)

(assert (=> b!1438924 m!1328079))

(assert (=> b!1438923 m!1328055))

(assert (=> b!1438923 m!1328055))

(declare-fun m!1328081 () Bool)

(assert (=> b!1438923 m!1328081))

(assert (=> b!1438923 m!1328081))

(assert (=> b!1438923 m!1328055))

(declare-fun m!1328083 () Bool)

(assert (=> b!1438923 m!1328083))

(assert (=> b!1438925 m!1328073))

(declare-fun m!1328085 () Bool)

(assert (=> b!1438925 m!1328085))

(check-sat (not b!1438924) (not b!1438923) (not b!1438926) (not b!1438927) (not b!1438928) (not b!1438922) (not b!1438921) (not start!124356))
(check-sat)
(get-model)

(declare-fun bm!67678 () Bool)

(declare-fun call!67681 () Bool)

(assert (=> bm!67678 (= call!67681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!154841 () Bool)

(declare-fun res!971515 () Bool)

(declare-fun e!811652 () Bool)

(assert (=> d!154841 (=> res!971515 e!811652)))

(assert (=> d!154841 (= res!971515 (bvsge #b00000000000000000000000000000000 (size!47761 a!2862)))))

(assert (=> d!154841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811652)))

(declare-fun b!1438968 () Bool)

(declare-fun e!811651 () Bool)

(declare-fun e!811650 () Bool)

(assert (=> b!1438968 (= e!811651 e!811650)))

(declare-fun lt!632686 () (_ BitVec 64))

(assert (=> b!1438968 (= lt!632686 (select (arr!47211 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48570 0))(
  ( (Unit!48571) )
))
(declare-fun lt!632688 () Unit!48570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97843 (_ BitVec 64) (_ BitVec 32)) Unit!48570)

(assert (=> b!1438968 (= lt!632688 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632686 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1438968 (arrayContainsKey!0 a!2862 lt!632686 #b00000000000000000000000000000000)))

(declare-fun lt!632687 () Unit!48570)

(assert (=> b!1438968 (= lt!632687 lt!632688)))

(declare-fun res!971514 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97843 (_ BitVec 32)) SeekEntryResult!11463)

(assert (=> b!1438968 (= res!971514 (= (seekEntryOrOpen!0 (select (arr!47211 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11463 #b00000000000000000000000000000000)))))

(assert (=> b!1438968 (=> (not res!971514) (not e!811650))))

(declare-fun b!1438969 () Bool)

(assert (=> b!1438969 (= e!811651 call!67681)))

(declare-fun b!1438970 () Bool)

(assert (=> b!1438970 (= e!811652 e!811651)))

(declare-fun c!133236 () Bool)

(assert (=> b!1438970 (= c!133236 (validKeyInArray!0 (select (arr!47211 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1438971 () Bool)

(assert (=> b!1438971 (= e!811650 call!67681)))

(assert (= (and d!154841 (not res!971515)) b!1438970))

(assert (= (and b!1438970 c!133236) b!1438968))

(assert (= (and b!1438970 (not c!133236)) b!1438969))

(assert (= (and b!1438968 res!971514) b!1438971))

(assert (= (or b!1438971 b!1438969) bm!67678))

(declare-fun m!1328119 () Bool)

(assert (=> bm!67678 m!1328119))

(declare-fun m!1328121 () Bool)

(assert (=> b!1438968 m!1328121))

(declare-fun m!1328123 () Bool)

(assert (=> b!1438968 m!1328123))

(declare-fun m!1328125 () Bool)

(assert (=> b!1438968 m!1328125))

(assert (=> b!1438968 m!1328121))

(declare-fun m!1328127 () Bool)

(assert (=> b!1438968 m!1328127))

(assert (=> b!1438970 m!1328121))

(assert (=> b!1438970 m!1328121))

(declare-fun m!1328129 () Bool)

(assert (=> b!1438970 m!1328129))

(assert (=> b!1438928 d!154841))

(declare-fun b!1438990 () Bool)

(declare-fun lt!632694 () SeekEntryResult!11463)

(assert (=> b!1438990 (and (bvsge (index!48246 lt!632694) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632694) (size!47761 a!2862)))))

(declare-fun res!971522 () Bool)

(assert (=> b!1438990 (= res!971522 (= (select (arr!47211 a!2862) (index!48246 lt!632694)) (select (arr!47211 a!2862) j!93)))))

(declare-fun e!811665 () Bool)

(assert (=> b!1438990 (=> res!971522 e!811665)))

(declare-fun e!811667 () Bool)

(assert (=> b!1438990 (= e!811667 e!811665)))

(declare-fun b!1438991 () Bool)

(declare-fun e!811663 () Bool)

(assert (=> b!1438991 (= e!811663 e!811667)))

(declare-fun res!971523 () Bool)

(get-info :version)

(assert (=> b!1438991 (= res!971523 (and ((_ is Intermediate!11463) lt!632694) (not (undefined!12275 lt!632694)) (bvslt (x!129978 lt!632694) #b01111111111111111111111111111110) (bvsge (x!129978 lt!632694) #b00000000000000000000000000000000) (bvsge (x!129978 lt!632694) #b00000000000000000000000000000000)))))

(assert (=> b!1438991 (=> (not res!971523) (not e!811667))))

(declare-fun b!1438993 () Bool)

(declare-fun e!811666 () SeekEntryResult!11463)

(declare-fun e!811664 () SeekEntryResult!11463)

(assert (=> b!1438993 (= e!811666 e!811664)))

(declare-fun c!133244 () Bool)

(declare-fun lt!632693 () (_ BitVec 64))

(assert (=> b!1438993 (= c!133244 (or (= lt!632693 (select (arr!47211 a!2862) j!93)) (= (bvadd lt!632693 lt!632693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438994 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438994 (= e!811664 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47211 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1438995 () Bool)

(assert (=> b!1438995 (= e!811664 (Intermediate!11463 false (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1438996 () Bool)

(assert (=> b!1438996 (and (bvsge (index!48246 lt!632694) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632694) (size!47761 a!2862)))))

(assert (=> b!1438996 (= e!811665 (= (select (arr!47211 a!2862) (index!48246 lt!632694)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1438992 () Bool)

(assert (=> b!1438992 (= e!811663 (bvsge (x!129978 lt!632694) #b01111111111111111111111111111110))))

(declare-fun d!154843 () Bool)

(assert (=> d!154843 e!811663))

(declare-fun c!133243 () Bool)

(assert (=> d!154843 (= c!133243 (and ((_ is Intermediate!11463) lt!632694) (undefined!12275 lt!632694)))))

(assert (=> d!154843 (= lt!632694 e!811666)))

(declare-fun c!133245 () Bool)

(assert (=> d!154843 (= c!133245 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154843 (= lt!632693 (select (arr!47211 a!2862) (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687)))))

(assert (=> d!154843 (validMask!0 mask!2687)))

(assert (=> d!154843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687) (select (arr!47211 a!2862) j!93) a!2862 mask!2687) lt!632694)))

(declare-fun b!1438997 () Bool)

(assert (=> b!1438997 (and (bvsge (index!48246 lt!632694) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632694) (size!47761 a!2862)))))

(declare-fun res!971524 () Bool)

(assert (=> b!1438997 (= res!971524 (= (select (arr!47211 a!2862) (index!48246 lt!632694)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1438997 (=> res!971524 e!811665)))

(declare-fun b!1438998 () Bool)

(assert (=> b!1438998 (= e!811666 (Intermediate!11463 true (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!154843 c!133245) b!1438998))

(assert (= (and d!154843 (not c!133245)) b!1438993))

(assert (= (and b!1438993 c!133244) b!1438995))

(assert (= (and b!1438993 (not c!133244)) b!1438994))

(assert (= (and d!154843 c!133243) b!1438992))

(assert (= (and d!154843 (not c!133243)) b!1438991))

(assert (= (and b!1438991 res!971523) b!1438990))

(assert (= (and b!1438990 (not res!971522)) b!1438997))

(assert (= (and b!1438997 (not res!971524)) b!1438996))

(assert (=> d!154843 m!1328081))

(declare-fun m!1328131 () Bool)

(assert (=> d!154843 m!1328131))

(assert (=> d!154843 m!1328067))

(declare-fun m!1328133 () Bool)

(assert (=> b!1438997 m!1328133))

(assert (=> b!1438990 m!1328133))

(assert (=> b!1438994 m!1328081))

(declare-fun m!1328135 () Bool)

(assert (=> b!1438994 m!1328135))

(assert (=> b!1438994 m!1328135))

(assert (=> b!1438994 m!1328055))

(declare-fun m!1328137 () Bool)

(assert (=> b!1438994 m!1328137))

(assert (=> b!1438996 m!1328133))

(assert (=> b!1438923 d!154843))

(declare-fun d!154847 () Bool)

(declare-fun lt!632700 () (_ BitVec 32))

(declare-fun lt!632699 () (_ BitVec 32))

(assert (=> d!154847 (= lt!632700 (bvmul (bvxor lt!632699 (bvlshr lt!632699 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154847 (= lt!632699 ((_ extract 31 0) (bvand (bvxor (select (arr!47211 a!2862) j!93) (bvlshr (select (arr!47211 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154847 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971525 (let ((h!35057 ((_ extract 31 0) (bvand (bvxor (select (arr!47211 a!2862) j!93) (bvlshr (select (arr!47211 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129981 (bvmul (bvxor h!35057 (bvlshr h!35057 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129981 (bvlshr x!129981 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971525 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971525 #b00000000000000000000000000000000))))))

(assert (=> d!154847 (= (toIndex!0 (select (arr!47211 a!2862) j!93) mask!2687) (bvand (bvxor lt!632700 (bvlshr lt!632700 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438923 d!154847))

(declare-fun b!1438999 () Bool)

(declare-fun lt!632702 () SeekEntryResult!11463)

(assert (=> b!1438999 (and (bvsge (index!48246 lt!632702) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632702) (size!47761 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)))))))

(declare-fun res!971526 () Bool)

(assert (=> b!1438999 (= res!971526 (= (select (arr!47211 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862))) (index!48246 lt!632702)) (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(declare-fun e!811670 () Bool)

(assert (=> b!1438999 (=> res!971526 e!811670)))

(declare-fun e!811672 () Bool)

(assert (=> b!1438999 (= e!811672 e!811670)))

(declare-fun b!1439000 () Bool)

(declare-fun e!811668 () Bool)

(assert (=> b!1439000 (= e!811668 e!811672)))

(declare-fun res!971527 () Bool)

(assert (=> b!1439000 (= res!971527 (and ((_ is Intermediate!11463) lt!632702) (not (undefined!12275 lt!632702)) (bvslt (x!129978 lt!632702) #b01111111111111111111111111111110) (bvsge (x!129978 lt!632702) #b00000000000000000000000000000000) (bvsge (x!129978 lt!632702) #b00000000000000000000000000000000)))))

(assert (=> b!1439000 (=> (not res!971527) (not e!811672))))

(declare-fun b!1439002 () Bool)

(declare-fun e!811671 () SeekEntryResult!11463)

(declare-fun e!811669 () SeekEntryResult!11463)

(assert (=> b!1439002 (= e!811671 e!811669)))

(declare-fun c!133247 () Bool)

(declare-fun lt!632701 () (_ BitVec 64))

(assert (=> b!1439002 (= c!133247 (or (= lt!632701 (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632701 lt!632701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439003 () Bool)

(assert (=> b!1439003 (= e!811669 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!632673 #b00000000000000000000000000000000 mask!2687) (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)) mask!2687))))

(declare-fun b!1439004 () Bool)

(assert (=> b!1439004 (= e!811669 (Intermediate!11463 false lt!632673 #b00000000000000000000000000000000))))

(declare-fun b!1439005 () Bool)

(assert (=> b!1439005 (and (bvsge (index!48246 lt!632702) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632702) (size!47761 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)))))))

(assert (=> b!1439005 (= e!811670 (= (select (arr!47211 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862))) (index!48246 lt!632702)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439001 () Bool)

(assert (=> b!1439001 (= e!811668 (bvsge (x!129978 lt!632702) #b01111111111111111111111111111110))))

(declare-fun d!154851 () Bool)

(assert (=> d!154851 e!811668))

(declare-fun c!133246 () Bool)

(assert (=> d!154851 (= c!133246 (and ((_ is Intermediate!11463) lt!632702) (undefined!12275 lt!632702)))))

(assert (=> d!154851 (= lt!632702 e!811671)))

(declare-fun c!133248 () Bool)

(assert (=> d!154851 (= c!133248 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154851 (= lt!632701 (select (arr!47211 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862))) lt!632673))))

(assert (=> d!154851 (validMask!0 mask!2687)))

(assert (=> d!154851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632673 (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)) mask!2687) lt!632702)))

(declare-fun b!1439006 () Bool)

(assert (=> b!1439006 (and (bvsge (index!48246 lt!632702) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632702) (size!47761 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862)))))))

(declare-fun res!971528 () Bool)

(assert (=> b!1439006 (= res!971528 (= (select (arr!47211 (array!97844 (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47761 a!2862))) (index!48246 lt!632702)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439006 (=> res!971528 e!811670)))

(declare-fun b!1439007 () Bool)

(assert (=> b!1439007 (= e!811671 (Intermediate!11463 true lt!632673 #b00000000000000000000000000000000))))

(assert (= (and d!154851 c!133248) b!1439007))

(assert (= (and d!154851 (not c!133248)) b!1439002))

(assert (= (and b!1439002 c!133247) b!1439004))

(assert (= (and b!1439002 (not c!133247)) b!1439003))

(assert (= (and d!154851 c!133246) b!1439001))

(assert (= (and d!154851 (not c!133246)) b!1439000))

(assert (= (and b!1439000 res!971527) b!1438999))

(assert (= (and b!1438999 (not res!971526)) b!1439006))

(assert (= (and b!1439006 (not res!971528)) b!1439005))

(declare-fun m!1328139 () Bool)

(assert (=> d!154851 m!1328139))

(assert (=> d!154851 m!1328067))

(declare-fun m!1328141 () Bool)

(assert (=> b!1439006 m!1328141))

(assert (=> b!1438999 m!1328141))

(declare-fun m!1328143 () Bool)

(assert (=> b!1439003 m!1328143))

(assert (=> b!1439003 m!1328143))

(assert (=> b!1439003 m!1328075))

(declare-fun m!1328145 () Bool)

(assert (=> b!1439003 m!1328145))

(assert (=> b!1439005 m!1328141))

(assert (=> b!1438924 d!154851))

(declare-fun d!154853 () Bool)

(declare-fun lt!632704 () (_ BitVec 32))

(declare-fun lt!632703 () (_ BitVec 32))

(assert (=> d!154853 (= lt!632704 (bvmul (bvxor lt!632703 (bvlshr lt!632703 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154853 (= lt!632703 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154853 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971525 (let ((h!35057 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129981 (bvmul (bvxor h!35057 (bvlshr h!35057 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129981 (bvlshr x!129981 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971525 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971525 #b00000000000000000000000000000000))))))

(assert (=> d!154853 (= (toIndex!0 (select (store (arr!47211 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632704 (bvlshr lt!632704 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438924 d!154853))

(declare-fun d!154855 () Bool)

(assert (=> d!154855 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124356 d!154855))

(declare-fun d!154857 () Bool)

(assert (=> d!154857 (= (array_inv!36239 a!2862) (bvsge (size!47761 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124356 d!154857))

(declare-fun b!1439012 () Bool)

(declare-fun lt!632710 () SeekEntryResult!11463)

(assert (=> b!1439012 (and (bvsge (index!48246 lt!632710) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632710) (size!47761 a!2862)))))

(declare-fun res!971529 () Bool)

(assert (=> b!1439012 (= res!971529 (= (select (arr!47211 a!2862) (index!48246 lt!632710)) (select (arr!47211 a!2862) j!93)))))

(declare-fun e!811677 () Bool)

(assert (=> b!1439012 (=> res!971529 e!811677)))

(declare-fun e!811679 () Bool)

(assert (=> b!1439012 (= e!811679 e!811677)))

(declare-fun b!1439013 () Bool)

(declare-fun e!811675 () Bool)

(assert (=> b!1439013 (= e!811675 e!811679)))

(declare-fun res!971530 () Bool)

(assert (=> b!1439013 (= res!971530 (and ((_ is Intermediate!11463) lt!632710) (not (undefined!12275 lt!632710)) (bvslt (x!129978 lt!632710) #b01111111111111111111111111111110) (bvsge (x!129978 lt!632710) #b00000000000000000000000000000000) (bvsge (x!129978 lt!632710) x!665)))))

(assert (=> b!1439013 (=> (not res!971530) (not e!811679))))

(declare-fun b!1439015 () Bool)

(declare-fun e!811678 () SeekEntryResult!11463)

(declare-fun e!811676 () SeekEntryResult!11463)

(assert (=> b!1439015 (= e!811678 e!811676)))

(declare-fun c!133252 () Bool)

(declare-fun lt!632709 () (_ BitVec 64))

(assert (=> b!1439015 (= c!133252 (or (= lt!632709 (select (arr!47211 a!2862) j!93)) (= (bvadd lt!632709 lt!632709) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439016 () Bool)

(assert (=> b!1439016 (= e!811676 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47211 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439017 () Bool)

(assert (=> b!1439017 (= e!811676 (Intermediate!11463 false index!646 x!665))))

(declare-fun b!1439018 () Bool)

(assert (=> b!1439018 (and (bvsge (index!48246 lt!632710) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632710) (size!47761 a!2862)))))

(assert (=> b!1439018 (= e!811677 (= (select (arr!47211 a!2862) (index!48246 lt!632710)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439014 () Bool)

(assert (=> b!1439014 (= e!811675 (bvsge (x!129978 lt!632710) #b01111111111111111111111111111110))))

(declare-fun d!154859 () Bool)

(assert (=> d!154859 e!811675))

(declare-fun c!133251 () Bool)

(assert (=> d!154859 (= c!133251 (and ((_ is Intermediate!11463) lt!632710) (undefined!12275 lt!632710)))))

(assert (=> d!154859 (= lt!632710 e!811678)))

(declare-fun c!133253 () Bool)

(assert (=> d!154859 (= c!133253 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154859 (= lt!632709 (select (arr!47211 a!2862) index!646))))

(assert (=> d!154859 (validMask!0 mask!2687)))

(assert (=> d!154859 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47211 a!2862) j!93) a!2862 mask!2687) lt!632710)))

(declare-fun b!1439019 () Bool)

(assert (=> b!1439019 (and (bvsge (index!48246 lt!632710) #b00000000000000000000000000000000) (bvslt (index!48246 lt!632710) (size!47761 a!2862)))))

(declare-fun res!971531 () Bool)

(assert (=> b!1439019 (= res!971531 (= (select (arr!47211 a!2862) (index!48246 lt!632710)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439019 (=> res!971531 e!811677)))

(declare-fun b!1439020 () Bool)

(assert (=> b!1439020 (= e!811678 (Intermediate!11463 true index!646 x!665))))

(assert (= (and d!154859 c!133253) b!1439020))

(assert (= (and d!154859 (not c!133253)) b!1439015))

(assert (= (and b!1439015 c!133252) b!1439017))

(assert (= (and b!1439015 (not c!133252)) b!1439016))

(assert (= (and d!154859 c!133251) b!1439014))

(assert (= (and d!154859 (not c!133251)) b!1439013))

(assert (= (and b!1439013 res!971530) b!1439012))

(assert (= (and b!1439012 (not res!971529)) b!1439019))

(assert (= (and b!1439019 (not res!971531)) b!1439018))

(declare-fun m!1328147 () Bool)

(assert (=> d!154859 m!1328147))

(assert (=> d!154859 m!1328067))

(declare-fun m!1328149 () Bool)

(assert (=> b!1439019 m!1328149))

(assert (=> b!1439012 m!1328149))

(declare-fun m!1328151 () Bool)

(assert (=> b!1439016 m!1328151))

(assert (=> b!1439016 m!1328151))

(assert (=> b!1439016 m!1328055))

(declare-fun m!1328153 () Bool)

(assert (=> b!1439016 m!1328153))

(assert (=> b!1439018 m!1328149))

(assert (=> b!1438926 d!154859))

(declare-fun d!154861 () Bool)

(assert (=> d!154861 (= (validKeyInArray!0 (select (arr!47211 a!2862) j!93)) (and (not (= (select (arr!47211 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47211 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438921 d!154861))

(declare-fun b!1439053 () Bool)

(declare-fun e!811702 () Bool)

(declare-fun e!811703 () Bool)

(assert (=> b!1439053 (= e!811702 e!811703)))

(declare-fun c!133264 () Bool)

(assert (=> b!1439053 (= c!133264 (validKeyInArray!0 (select (arr!47211 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67681 () Bool)

(declare-fun call!67684 () Bool)

(assert (=> bm!67681 (= call!67684 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133264 (Cons!33708 (select (arr!47211 a!2862) #b00000000000000000000000000000000) Nil!33709) Nil!33709)))))

(declare-fun b!1439054 () Bool)

(assert (=> b!1439054 (= e!811703 call!67684)))

(declare-fun b!1439055 () Bool)

(assert (=> b!1439055 (= e!811703 call!67684)))

(declare-fun d!154863 () Bool)

(declare-fun res!971545 () Bool)

(declare-fun e!811701 () Bool)

(assert (=> d!154863 (=> res!971545 e!811701)))

(assert (=> d!154863 (= res!971545 (bvsge #b00000000000000000000000000000000 (size!47761 a!2862)))))

(assert (=> d!154863 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33709) e!811701)))

(declare-fun b!1439056 () Bool)

(assert (=> b!1439056 (= e!811701 e!811702)))

(declare-fun res!971546 () Bool)

(assert (=> b!1439056 (=> (not res!971546) (not e!811702))))

(declare-fun e!811700 () Bool)

(assert (=> b!1439056 (= res!971546 (not e!811700))))

(declare-fun res!971544 () Bool)

(assert (=> b!1439056 (=> (not res!971544) (not e!811700))))

(assert (=> b!1439056 (= res!971544 (validKeyInArray!0 (select (arr!47211 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439057 () Bool)

(declare-fun contains!9893 (List!33712 (_ BitVec 64)) Bool)

(assert (=> b!1439057 (= e!811700 (contains!9893 Nil!33709 (select (arr!47211 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!154863 (not res!971545)) b!1439056))

(assert (= (and b!1439056 res!971544) b!1439057))

(assert (= (and b!1439056 res!971546) b!1439053))

(assert (= (and b!1439053 c!133264) b!1439054))

(assert (= (and b!1439053 (not c!133264)) b!1439055))

(assert (= (or b!1439054 b!1439055) bm!67681))

(assert (=> b!1439053 m!1328121))

(assert (=> b!1439053 m!1328121))

(assert (=> b!1439053 m!1328129))

(assert (=> bm!67681 m!1328121))

(declare-fun m!1328155 () Bool)

(assert (=> bm!67681 m!1328155))

(assert (=> b!1439056 m!1328121))

(assert (=> b!1439056 m!1328121))

(assert (=> b!1439056 m!1328129))

(assert (=> b!1439057 m!1328121))

(assert (=> b!1439057 m!1328121))

(declare-fun m!1328157 () Bool)

(assert (=> b!1439057 m!1328157))

(assert (=> b!1438927 d!154863))

(declare-fun d!154865 () Bool)

(assert (=> d!154865 (= (validKeyInArray!0 (select (arr!47211 a!2862) i!1006)) (and (not (= (select (arr!47211 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47211 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438922 d!154865))

(check-sat (not b!1439057) (not bm!67681) (not b!1438994) (not d!154851) (not d!154843) (not b!1438968) (not b!1439003) (not b!1438970) (not bm!67678) (not b!1439056) (not b!1439016) (not d!154859) (not b!1439053))
(check-sat)
