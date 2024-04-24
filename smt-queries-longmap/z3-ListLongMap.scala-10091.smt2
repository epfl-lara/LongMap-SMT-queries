; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119096 () Bool)

(assert start!119096)

(declare-fun b!1389793 () Bool)

(declare-fun res!929378 () Bool)

(declare-fun e!787372 () Bool)

(assert (=> b!1389793 (=> (not res!929378) (not e!787372))))

(declare-datatypes ((array!95075 0))(
  ( (array!95076 (arr!45907 (Array (_ BitVec 32) (_ BitVec 64))) (size!46458 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95075)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389793 (= res!929378 (validKeyInArray!0 (select (arr!45907 a!2901) i!1037)))))

(declare-fun b!1389794 () Bool)

(declare-fun res!929377 () Bool)

(assert (=> b!1389794 (=> (not res!929377) (not e!787372))))

(assert (=> b!1389794 (= res!929377 (and (bvsle #b00000000000000000000000000000000 (size!46458 a!2901)) (bvslt (size!46458 a!2901) #b01111111111111111111111111111111)))))

(declare-fun res!929379 () Bool)

(assert (=> start!119096 (=> (not res!929379) (not e!787372))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119096 (= res!929379 (validMask!0 mask!2840))))

(assert (=> start!119096 e!787372))

(assert (=> start!119096 true))

(declare-fun array_inv!35188 (array!95075) Bool)

(assert (=> start!119096 (array_inv!35188 a!2901)))

(declare-fun b!1389795 () Bool)

(declare-fun res!929376 () Bool)

(assert (=> b!1389795 (=> (not res!929376) (not e!787372))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389795 (= res!929376 (validKeyInArray!0 (select (arr!45907 a!2901) j!112)))))

(declare-fun b!1389796 () Bool)

(declare-datatypes ((List!32413 0))(
  ( (Nil!32410) (Cons!32409 (h!33632 (_ BitVec 64)) (t!47099 List!32413)) )
))
(declare-fun noDuplicate!2617 (List!32413) Bool)

(assert (=> b!1389796 (= e!787372 (not (noDuplicate!2617 Nil!32410)))))

(declare-fun b!1389797 () Bool)

(declare-fun res!929380 () Bool)

(assert (=> b!1389797 (=> (not res!929380) (not e!787372))))

(assert (=> b!1389797 (= res!929380 (and (= (size!46458 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46458 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46458 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389798 () Bool)

(declare-fun res!929375 () Bool)

(assert (=> b!1389798 (=> (not res!929375) (not e!787372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95075 (_ BitVec 32)) Bool)

(assert (=> b!1389798 (= res!929375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119096 res!929379) b!1389797))

(assert (= (and b!1389797 res!929380) b!1389793))

(assert (= (and b!1389793 res!929378) b!1389795))

(assert (= (and b!1389795 res!929376) b!1389798))

(assert (= (and b!1389798 res!929375) b!1389794))

(assert (= (and b!1389794 res!929377) b!1389796))

(declare-fun m!1275769 () Bool)

(assert (=> b!1389798 m!1275769))

(declare-fun m!1275771 () Bool)

(assert (=> start!119096 m!1275771))

(declare-fun m!1275773 () Bool)

(assert (=> start!119096 m!1275773))

(declare-fun m!1275775 () Bool)

(assert (=> b!1389795 m!1275775))

(assert (=> b!1389795 m!1275775))

(declare-fun m!1275777 () Bool)

(assert (=> b!1389795 m!1275777))

(declare-fun m!1275779 () Bool)

(assert (=> b!1389793 m!1275779))

(assert (=> b!1389793 m!1275779))

(declare-fun m!1275781 () Bool)

(assert (=> b!1389793 m!1275781))

(declare-fun m!1275783 () Bool)

(assert (=> b!1389796 m!1275783))

(check-sat (not b!1389793) (not b!1389796) (not b!1389795) (not start!119096) (not b!1389798))
(check-sat)
(get-model)

(declare-fun d!150325 () Bool)

(declare-fun res!929421 () Bool)

(declare-fun e!787390 () Bool)

(assert (=> d!150325 (=> res!929421 e!787390)))

(get-info :version)

(assert (=> d!150325 (= res!929421 ((_ is Nil!32410) Nil!32410))))

(assert (=> d!150325 (= (noDuplicate!2617 Nil!32410) e!787390)))

(declare-fun b!1389839 () Bool)

(declare-fun e!787391 () Bool)

(assert (=> b!1389839 (= e!787390 e!787391)))

(declare-fun res!929422 () Bool)

(assert (=> b!1389839 (=> (not res!929422) (not e!787391))))

(declare-fun contains!9793 (List!32413 (_ BitVec 64)) Bool)

(assert (=> b!1389839 (= res!929422 (not (contains!9793 (t!47099 Nil!32410) (h!33632 Nil!32410))))))

(declare-fun b!1389840 () Bool)

(assert (=> b!1389840 (= e!787391 (noDuplicate!2617 (t!47099 Nil!32410)))))

(assert (= (and d!150325 (not res!929421)) b!1389839))

(assert (= (and b!1389839 res!929422) b!1389840))

(declare-fun m!1275817 () Bool)

(assert (=> b!1389839 m!1275817))

(declare-fun m!1275819 () Bool)

(assert (=> b!1389840 m!1275819))

(assert (=> b!1389796 d!150325))

(declare-fun b!1389856 () Bool)

(declare-fun e!787404 () Bool)

(declare-fun call!66705 () Bool)

(assert (=> b!1389856 (= e!787404 call!66705)))

(declare-fun b!1389857 () Bool)

(declare-fun e!787406 () Bool)

(assert (=> b!1389857 (= e!787404 e!787406)))

(declare-fun lt!610789 () (_ BitVec 64))

(assert (=> b!1389857 (= lt!610789 (select (arr!45907 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46353 0))(
  ( (Unit!46354) )
))
(declare-fun lt!610788 () Unit!46353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95075 (_ BitVec 64) (_ BitVec 32)) Unit!46353)

(assert (=> b!1389857 (= lt!610788 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610789 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389857 (arrayContainsKey!0 a!2901 lt!610789 #b00000000000000000000000000000000)))

(declare-fun lt!610790 () Unit!46353)

(assert (=> b!1389857 (= lt!610790 lt!610788)))

(declare-fun res!929433 () Bool)

(declare-datatypes ((SeekEntryResult!10147 0))(
  ( (MissingZero!10147 (index!42959 (_ BitVec 32))) (Found!10147 (index!42960 (_ BitVec 32))) (Intermediate!10147 (undefined!10959 Bool) (index!42961 (_ BitVec 32)) (x!124753 (_ BitVec 32))) (Undefined!10147) (MissingVacant!10147 (index!42962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95075 (_ BitVec 32)) SeekEntryResult!10147)

(assert (=> b!1389857 (= res!929433 (= (seekEntryOrOpen!0 (select (arr!45907 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10147 #b00000000000000000000000000000000)))))

(assert (=> b!1389857 (=> (not res!929433) (not e!787406))))

(declare-fun b!1389858 () Bool)

(assert (=> b!1389858 (= e!787406 call!66705)))

(declare-fun bm!66702 () Bool)

(assert (=> bm!66702 (= call!66705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1389855 () Bool)

(declare-fun e!787405 () Bool)

(assert (=> b!1389855 (= e!787405 e!787404)))

(declare-fun c!129661 () Bool)

(assert (=> b!1389855 (= c!129661 (validKeyInArray!0 (select (arr!45907 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150327 () Bool)

(declare-fun res!929434 () Bool)

(assert (=> d!150327 (=> res!929434 e!787405)))

(assert (=> d!150327 (= res!929434 (bvsge #b00000000000000000000000000000000 (size!46458 a!2901)))))

(assert (=> d!150327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787405)))

(assert (= (and d!150327 (not res!929434)) b!1389855))

(assert (= (and b!1389855 c!129661) b!1389857))

(assert (= (and b!1389855 (not c!129661)) b!1389856))

(assert (= (and b!1389857 res!929433) b!1389858))

(assert (= (or b!1389858 b!1389856) bm!66702))

(declare-fun m!1275825 () Bool)

(assert (=> b!1389857 m!1275825))

(declare-fun m!1275827 () Bool)

(assert (=> b!1389857 m!1275827))

(declare-fun m!1275829 () Bool)

(assert (=> b!1389857 m!1275829))

(assert (=> b!1389857 m!1275825))

(declare-fun m!1275831 () Bool)

(assert (=> b!1389857 m!1275831))

(declare-fun m!1275833 () Bool)

(assert (=> bm!66702 m!1275833))

(assert (=> b!1389855 m!1275825))

(assert (=> b!1389855 m!1275825))

(declare-fun m!1275835 () Bool)

(assert (=> b!1389855 m!1275835))

(assert (=> b!1389798 d!150327))

(declare-fun d!150339 () Bool)

(assert (=> d!150339 (= (validKeyInArray!0 (select (arr!45907 a!2901) i!1037)) (and (not (= (select (arr!45907 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45907 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389793 d!150339))

(declare-fun d!150341 () Bool)

(assert (=> d!150341 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119096 d!150341))

(declare-fun d!150351 () Bool)

(assert (=> d!150351 (= (array_inv!35188 a!2901) (bvsge (size!46458 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119096 d!150351))

(declare-fun d!150353 () Bool)

(assert (=> d!150353 (= (validKeyInArray!0 (select (arr!45907 a!2901) j!112)) (and (not (= (select (arr!45907 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45907 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389795 d!150353))

(check-sat (not b!1389855) (not b!1389839) (not b!1389857) (not bm!66702) (not b!1389840))
(check-sat)
