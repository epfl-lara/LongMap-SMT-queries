; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118994 () Bool)

(assert start!118994)

(declare-fun b!1388983 () Bool)

(declare-fun res!929215 () Bool)

(declare-fun e!786818 () Bool)

(assert (=> b!1388983 (=> (not res!929215) (not e!786818))))

(declare-datatypes ((array!94991 0))(
  ( (array!94992 (arr!45864 (Array (_ BitVec 32) (_ BitVec 64))) (size!46414 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94991)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388983 (= res!929215 (validKeyInArray!0 (select (arr!45864 a!2901) i!1037)))))

(declare-fun res!929217 () Bool)

(assert (=> start!118994 (=> (not res!929217) (not e!786818))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118994 (= res!929217 (validMask!0 mask!2840))))

(assert (=> start!118994 e!786818))

(assert (=> start!118994 true))

(declare-fun array_inv!34892 (array!94991) Bool)

(assert (=> start!118994 (array_inv!34892 a!2901)))

(declare-fun b!1388984 () Bool)

(declare-fun res!929214 () Bool)

(assert (=> b!1388984 (=> (not res!929214) (not e!786818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94991 (_ BitVec 32)) Bool)

(assert (=> b!1388984 (= res!929214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388985 () Bool)

(declare-fun res!929213 () Bool)

(assert (=> b!1388985 (=> (not res!929213) (not e!786818))))

(declare-datatypes ((List!32383 0))(
  ( (Nil!32380) (Cons!32379 (h!33594 (_ BitVec 64)) (t!47077 List!32383)) )
))
(declare-fun arrayNoDuplicates!0 (array!94991 (_ BitVec 32) List!32383) Bool)

(assert (=> b!1388985 (= res!929213 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32380))))

(declare-fun b!1388986 () Bool)

(declare-fun res!929218 () Bool)

(assert (=> b!1388986 (=> (not res!929218) (not e!786818))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388986 (= res!929218 (validKeyInArray!0 (select (arr!45864 a!2901) j!112)))))

(declare-fun b!1388987 () Bool)

(assert (=> b!1388987 (= e!786818 (and (bvsge mask!2840 #b00000000000000000000000000000000) (bvsgt mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1388988 () Bool)

(declare-fun res!929216 () Bool)

(assert (=> b!1388988 (=> (not res!929216) (not e!786818))))

(assert (=> b!1388988 (= res!929216 (and (= (size!46414 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46414 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46414 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!118994 res!929217) b!1388988))

(assert (= (and b!1388988 res!929216) b!1388983))

(assert (= (and b!1388983 res!929215) b!1388986))

(assert (= (and b!1388986 res!929218) b!1388984))

(assert (= (and b!1388984 res!929214) b!1388985))

(assert (= (and b!1388985 res!929213) b!1388987))

(declare-fun m!1274695 () Bool)

(assert (=> b!1388984 m!1274695))

(declare-fun m!1274697 () Bool)

(assert (=> b!1388983 m!1274697))

(assert (=> b!1388983 m!1274697))

(declare-fun m!1274699 () Bool)

(assert (=> b!1388983 m!1274699))

(declare-fun m!1274701 () Bool)

(assert (=> start!118994 m!1274701))

(declare-fun m!1274703 () Bool)

(assert (=> start!118994 m!1274703))

(declare-fun m!1274705 () Bool)

(assert (=> b!1388986 m!1274705))

(assert (=> b!1388986 m!1274705))

(declare-fun m!1274707 () Bool)

(assert (=> b!1388986 m!1274707))

(declare-fun m!1274709 () Bool)

(assert (=> b!1388985 m!1274709))

(check-sat (not b!1388986) (not start!118994) (not b!1388984) (not b!1388985) (not b!1388983))
(check-sat)
(get-model)

(declare-fun d!150071 () Bool)

(assert (=> d!150071 (= (validKeyInArray!0 (select (arr!45864 a!2901) i!1037)) (and (not (= (select (arr!45864 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45864 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388983 d!150071))

(declare-fun d!150073 () Bool)

(assert (=> d!150073 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118994 d!150073))

(declare-fun d!150079 () Bool)

(assert (=> d!150079 (= (array_inv!34892 a!2901) (bvsge (size!46414 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118994 d!150079))

(declare-fun d!150081 () Bool)

(assert (=> d!150081 (= (validKeyInArray!0 (select (arr!45864 a!2901) j!112)) (and (not (= (select (arr!45864 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45864 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388986 d!150081))

(declare-fun b!1389044 () Bool)

(declare-fun e!786856 () Bool)

(declare-fun call!66670 () Bool)

(assert (=> b!1389044 (= e!786856 call!66670)))

(declare-fun b!1389046 () Bool)

(declare-fun e!786857 () Bool)

(assert (=> b!1389046 (= e!786857 e!786856)))

(declare-fun c!129336 () Bool)

(assert (=> b!1389046 (= c!129336 (validKeyInArray!0 (select (arr!45864 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389047 () Bool)

(assert (=> b!1389047 (= e!786856 call!66670)))

(declare-fun d!150083 () Bool)

(declare-fun res!929259 () Bool)

(declare-fun e!786855 () Bool)

(assert (=> d!150083 (=> res!929259 e!786855)))

(assert (=> d!150083 (= res!929259 (bvsge #b00000000000000000000000000000000 (size!46414 a!2901)))))

(assert (=> d!150083 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32380) e!786855)))

(declare-fun b!1389045 () Bool)

(assert (=> b!1389045 (= e!786855 e!786857)))

(declare-fun res!929260 () Bool)

(assert (=> b!1389045 (=> (not res!929260) (not e!786857))))

(declare-fun e!786854 () Bool)

(assert (=> b!1389045 (= res!929260 (not e!786854))))

(declare-fun res!929258 () Bool)

(assert (=> b!1389045 (=> (not res!929258) (not e!786854))))

(assert (=> b!1389045 (= res!929258 (validKeyInArray!0 (select (arr!45864 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1389048 () Bool)

(declare-fun contains!9756 (List!32383 (_ BitVec 64)) Bool)

(assert (=> b!1389048 (= e!786854 (contains!9756 Nil!32380 (select (arr!45864 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66667 () Bool)

(assert (=> bm!66667 (= call!66670 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129336 (Cons!32379 (select (arr!45864 a!2901) #b00000000000000000000000000000000) Nil!32380) Nil!32380)))))

(assert (= (and d!150083 (not res!929259)) b!1389045))

(assert (= (and b!1389045 res!929258) b!1389048))

(assert (= (and b!1389045 res!929260) b!1389046))

(assert (= (and b!1389046 c!129336) b!1389047))

(assert (= (and b!1389046 (not c!129336)) b!1389044))

(assert (= (or b!1389047 b!1389044) bm!66667))

(declare-fun m!1274747 () Bool)

(assert (=> b!1389046 m!1274747))

(assert (=> b!1389046 m!1274747))

(declare-fun m!1274749 () Bool)

(assert (=> b!1389046 m!1274749))

(assert (=> b!1389045 m!1274747))

(assert (=> b!1389045 m!1274747))

(assert (=> b!1389045 m!1274749))

(assert (=> b!1389048 m!1274747))

(assert (=> b!1389048 m!1274747))

(declare-fun m!1274751 () Bool)

(assert (=> b!1389048 m!1274751))

(assert (=> bm!66667 m!1274747))

(declare-fun m!1274753 () Bool)

(assert (=> bm!66667 m!1274753))

(assert (=> b!1388985 d!150083))

(declare-fun b!1389084 () Bool)

(declare-fun e!786887 () Bool)

(declare-fun e!786886 () Bool)

(assert (=> b!1389084 (= e!786887 e!786886)))

(declare-fun c!129345 () Bool)

(assert (=> b!1389084 (= c!129345 (validKeyInArray!0 (select (arr!45864 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66676 () Bool)

(declare-fun call!66679 () Bool)

(assert (=> bm!66676 (= call!66679 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1389085 () Bool)

(declare-fun e!786885 () Bool)

(assert (=> b!1389085 (= e!786886 e!786885)))

(declare-fun lt!610476 () (_ BitVec 64))

(assert (=> b!1389085 (= lt!610476 (select (arr!45864 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46426 0))(
  ( (Unit!46427) )
))
(declare-fun lt!610474 () Unit!46426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94991 (_ BitVec 64) (_ BitVec 32)) Unit!46426)

(assert (=> b!1389085 (= lt!610474 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610476 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389085 (arrayContainsKey!0 a!2901 lt!610476 #b00000000000000000000000000000000)))

(declare-fun lt!610475 () Unit!46426)

(assert (=> b!1389085 (= lt!610475 lt!610474)))

(declare-fun res!929281 () Bool)

(declare-datatypes ((SeekEntryResult!10196 0))(
  ( (MissingZero!10196 (index!43155 (_ BitVec 32))) (Found!10196 (index!43156 (_ BitVec 32))) (Intermediate!10196 (undefined!11008 Bool) (index!43157 (_ BitVec 32)) (x!124807 (_ BitVec 32))) (Undefined!10196) (MissingVacant!10196 (index!43158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94991 (_ BitVec 32)) SeekEntryResult!10196)

(assert (=> b!1389085 (= res!929281 (= (seekEntryOrOpen!0 (select (arr!45864 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10196 #b00000000000000000000000000000000)))))

(assert (=> b!1389085 (=> (not res!929281) (not e!786885))))

(declare-fun b!1389086 () Bool)

(assert (=> b!1389086 (= e!786885 call!66679)))

(declare-fun b!1389087 () Bool)

(assert (=> b!1389087 (= e!786886 call!66679)))

(declare-fun d!150089 () Bool)

(declare-fun res!929280 () Bool)

(assert (=> d!150089 (=> res!929280 e!786887)))

(assert (=> d!150089 (= res!929280 (bvsge #b00000000000000000000000000000000 (size!46414 a!2901)))))

(assert (=> d!150089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786887)))

(assert (= (and d!150089 (not res!929280)) b!1389084))

(assert (= (and b!1389084 c!129345) b!1389085))

(assert (= (and b!1389084 (not c!129345)) b!1389087))

(assert (= (and b!1389085 res!929281) b!1389086))

(assert (= (or b!1389086 b!1389087) bm!66676))

(assert (=> b!1389084 m!1274747))

(assert (=> b!1389084 m!1274747))

(assert (=> b!1389084 m!1274749))

(declare-fun m!1274767 () Bool)

(assert (=> bm!66676 m!1274767))

(assert (=> b!1389085 m!1274747))

(declare-fun m!1274769 () Bool)

(assert (=> b!1389085 m!1274769))

(declare-fun m!1274771 () Bool)

(assert (=> b!1389085 m!1274771))

(assert (=> b!1389085 m!1274747))

(declare-fun m!1274773 () Bool)

(assert (=> b!1389085 m!1274773))

(assert (=> b!1388984 d!150089))

(check-sat (not b!1389085) (not b!1389046) (not b!1389048) (not b!1389084) (not bm!66667) (not bm!66676) (not b!1389045))
(check-sat)
