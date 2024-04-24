; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121148 () Bool)

(assert start!121148)

(declare-fun b!1408222 () Bool)

(declare-fun res!945591 () Bool)

(declare-fun e!797126 () Bool)

(assert (=> b!1408222 (=> (not res!945591) (not e!797126))))

(declare-datatypes ((array!96326 0))(
  ( (array!96327 (arr!46507 (Array (_ BitVec 32) (_ BitVec 64))) (size!47058 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96326)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96326 (_ BitVec 32)) Bool)

(assert (=> b!1408222 (= res!945591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!620036 () (_ BitVec 32))

(declare-fun e!797127 () Bool)

(declare-datatypes ((SeekEntryResult!10721 0))(
  ( (MissingZero!10721 (index!45261 (_ BitVec 32))) (Found!10721 (index!45262 (_ BitVec 32))) (Intermediate!10721 (undefined!11533 Bool) (index!45263 (_ BitVec 32)) (x!127017 (_ BitVec 32))) (Undefined!10721) (MissingVacant!10721 (index!45264 (_ BitVec 32))) )
))
(declare-fun lt!620035 () SeekEntryResult!10721)

(declare-fun b!1408223 () Bool)

(assert (=> b!1408223 (= e!797127 (or (bvslt (x!127017 lt!620035) #b00000000000000000000000000000000) (bvsgt (x!127017 lt!620035) #b01111111111111111111111111111110) (and (bvsge lt!620036 #b00000000000000000000000000000000) (bvslt lt!620036 (size!47058 a!2901)))))))

(declare-fun b!1408224 () Bool)

(declare-fun res!945598 () Bool)

(assert (=> b!1408224 (=> (not res!945598) (not e!797126))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408224 (= res!945598 (and (= (size!47058 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47058 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47058 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!945592 () Bool)

(assert (=> start!121148 (=> (not res!945592) (not e!797126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121148 (= res!945592 (validMask!0 mask!2840))))

(assert (=> start!121148 e!797126))

(assert (=> start!121148 true))

(declare-fun array_inv!35788 (array!96326) Bool)

(assert (=> start!121148 (array_inv!35788 a!2901)))

(declare-fun b!1408225 () Bool)

(assert (=> b!1408225 (= e!797126 (not e!797127))))

(declare-fun res!945595 () Bool)

(assert (=> b!1408225 (=> res!945595 e!797127)))

(get-info :version)

(assert (=> b!1408225 (= res!945595 (or (not ((_ is Intermediate!10721) lt!620035)) (undefined!11533 lt!620035)))))

(declare-fun e!797128 () Bool)

(assert (=> b!1408225 e!797128))

(declare-fun res!945593 () Bool)

(assert (=> b!1408225 (=> (not res!945593) (not e!797128))))

(assert (=> b!1408225 (= res!945593 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47443 0))(
  ( (Unit!47444) )
))
(declare-fun lt!620034 () Unit!47443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47443)

(assert (=> b!1408225 (= lt!620034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96326 (_ BitVec 32)) SeekEntryResult!10721)

(assert (=> b!1408225 (= lt!620035 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620036 (select (arr!46507 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408225 (= lt!620036 (toIndex!0 (select (arr!46507 a!2901) j!112) mask!2840))))

(declare-fun b!1408226 () Bool)

(declare-fun res!945590 () Bool)

(assert (=> b!1408226 (=> (not res!945590) (not e!797126))))

(declare-datatypes ((List!33013 0))(
  ( (Nil!33010) (Cons!33009 (h!34274 (_ BitVec 64)) (t!47699 List!33013)) )
))
(declare-fun arrayNoDuplicates!0 (array!96326 (_ BitVec 32) List!33013) Bool)

(assert (=> b!1408226 (= res!945590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33010))))

(declare-fun b!1408227 () Bool)

(declare-fun res!945596 () Bool)

(assert (=> b!1408227 (=> (not res!945596) (not e!797126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408227 (= res!945596 (validKeyInArray!0 (select (arr!46507 a!2901) i!1037)))))

(declare-fun b!1408228 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96326 (_ BitVec 32)) SeekEntryResult!10721)

(assert (=> b!1408228 (= e!797128 (= (seekEntryOrOpen!0 (select (arr!46507 a!2901) j!112) a!2901 mask!2840) (Found!10721 j!112)))))

(declare-fun b!1408229 () Bool)

(declare-fun res!945594 () Bool)

(assert (=> b!1408229 (=> res!945594 e!797127)))

(assert (=> b!1408229 (= res!945594 (not (= lt!620035 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)) mask!2840))))))

(declare-fun b!1408230 () Bool)

(declare-fun res!945597 () Bool)

(assert (=> b!1408230 (=> (not res!945597) (not e!797126))))

(assert (=> b!1408230 (= res!945597 (validKeyInArray!0 (select (arr!46507 a!2901) j!112)))))

(assert (= (and start!121148 res!945592) b!1408224))

(assert (= (and b!1408224 res!945598) b!1408227))

(assert (= (and b!1408227 res!945596) b!1408230))

(assert (= (and b!1408230 res!945597) b!1408222))

(assert (= (and b!1408222 res!945591) b!1408226))

(assert (= (and b!1408226 res!945590) b!1408225))

(assert (= (and b!1408225 res!945593) b!1408228))

(assert (= (and b!1408225 (not res!945595)) b!1408229))

(assert (= (and b!1408229 (not res!945594)) b!1408223))

(declare-fun m!1297639 () Bool)

(assert (=> b!1408226 m!1297639))

(declare-fun m!1297641 () Bool)

(assert (=> b!1408227 m!1297641))

(assert (=> b!1408227 m!1297641))

(declare-fun m!1297643 () Bool)

(assert (=> b!1408227 m!1297643))

(declare-fun m!1297645 () Bool)

(assert (=> b!1408229 m!1297645))

(declare-fun m!1297647 () Bool)

(assert (=> b!1408229 m!1297647))

(assert (=> b!1408229 m!1297647))

(declare-fun m!1297649 () Bool)

(assert (=> b!1408229 m!1297649))

(assert (=> b!1408229 m!1297649))

(assert (=> b!1408229 m!1297647))

(declare-fun m!1297651 () Bool)

(assert (=> b!1408229 m!1297651))

(declare-fun m!1297653 () Bool)

(assert (=> start!121148 m!1297653))

(declare-fun m!1297655 () Bool)

(assert (=> start!121148 m!1297655))

(declare-fun m!1297657 () Bool)

(assert (=> b!1408222 m!1297657))

(declare-fun m!1297659 () Bool)

(assert (=> b!1408228 m!1297659))

(assert (=> b!1408228 m!1297659))

(declare-fun m!1297661 () Bool)

(assert (=> b!1408228 m!1297661))

(assert (=> b!1408225 m!1297659))

(declare-fun m!1297663 () Bool)

(assert (=> b!1408225 m!1297663))

(assert (=> b!1408225 m!1297659))

(assert (=> b!1408225 m!1297659))

(declare-fun m!1297665 () Bool)

(assert (=> b!1408225 m!1297665))

(declare-fun m!1297667 () Bool)

(assert (=> b!1408225 m!1297667))

(declare-fun m!1297669 () Bool)

(assert (=> b!1408225 m!1297669))

(assert (=> b!1408230 m!1297659))

(assert (=> b!1408230 m!1297659))

(declare-fun m!1297671 () Bool)

(assert (=> b!1408230 m!1297671))

(check-sat (not b!1408227) (not b!1408225) (not b!1408230) (not start!121148) (not b!1408226) (not b!1408222) (not b!1408229) (not b!1408228))
(check-sat)
(get-model)

(declare-fun b!1408293 () Bool)

(declare-fun e!797162 () Bool)

(declare-fun call!67032 () Bool)

(assert (=> b!1408293 (= e!797162 call!67032)))

(declare-fun bm!67029 () Bool)

(assert (=> bm!67029 (= call!67032 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1408294 () Bool)

(declare-fun e!797160 () Bool)

(declare-fun e!797161 () Bool)

(assert (=> b!1408294 (= e!797160 e!797161)))

(declare-fun c!130789 () Bool)

(assert (=> b!1408294 (= c!130789 (validKeyInArray!0 (select (arr!46507 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408295 () Bool)

(assert (=> b!1408295 (= e!797161 call!67032)))

(declare-fun b!1408296 () Bool)

(assert (=> b!1408296 (= e!797161 e!797162)))

(declare-fun lt!620061 () (_ BitVec 64))

(assert (=> b!1408296 (= lt!620061 (select (arr!46507 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620063 () Unit!47443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96326 (_ BitVec 64) (_ BitVec 32)) Unit!47443)

(assert (=> b!1408296 (= lt!620063 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620061 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1408296 (arrayContainsKey!0 a!2901 lt!620061 #b00000000000000000000000000000000)))

(declare-fun lt!620062 () Unit!47443)

(assert (=> b!1408296 (= lt!620062 lt!620063)))

(declare-fun res!945657 () Bool)

(assert (=> b!1408296 (= res!945657 (= (seekEntryOrOpen!0 (select (arr!46507 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10721 #b00000000000000000000000000000000)))))

(assert (=> b!1408296 (=> (not res!945657) (not e!797162))))

(declare-fun d!151859 () Bool)

(declare-fun res!945658 () Bool)

(assert (=> d!151859 (=> res!945658 e!797160)))

(assert (=> d!151859 (= res!945658 (bvsge #b00000000000000000000000000000000 (size!47058 a!2901)))))

(assert (=> d!151859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797160)))

(assert (= (and d!151859 (not res!945658)) b!1408294))

(assert (= (and b!1408294 c!130789) b!1408296))

(assert (= (and b!1408294 (not c!130789)) b!1408295))

(assert (= (and b!1408296 res!945657) b!1408293))

(assert (= (or b!1408293 b!1408295) bm!67029))

(declare-fun m!1297741 () Bool)

(assert (=> bm!67029 m!1297741))

(declare-fun m!1297743 () Bool)

(assert (=> b!1408294 m!1297743))

(assert (=> b!1408294 m!1297743))

(declare-fun m!1297745 () Bool)

(assert (=> b!1408294 m!1297745))

(assert (=> b!1408296 m!1297743))

(declare-fun m!1297747 () Bool)

(assert (=> b!1408296 m!1297747))

(declare-fun m!1297749 () Bool)

(assert (=> b!1408296 m!1297749))

(assert (=> b!1408296 m!1297743))

(declare-fun m!1297751 () Bool)

(assert (=> b!1408296 m!1297751))

(assert (=> b!1408222 d!151859))

(declare-fun d!151861 () Bool)

(assert (=> d!151861 (= (validKeyInArray!0 (select (arr!46507 a!2901) i!1037)) (and (not (= (select (arr!46507 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46507 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1408227 d!151861))

(declare-fun bm!67032 () Bool)

(declare-fun call!67035 () Bool)

(declare-fun c!130792 () Bool)

(assert (=> bm!67032 (= call!67035 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130792 (Cons!33009 (select (arr!46507 a!2901) #b00000000000000000000000000000000) Nil!33010) Nil!33010)))))

(declare-fun b!1408308 () Bool)

(declare-fun e!797173 () Bool)

(assert (=> b!1408308 (= e!797173 call!67035)))

(declare-fun b!1408309 () Bool)

(declare-fun e!797171 () Bool)

(assert (=> b!1408309 (= e!797171 e!797173)))

(assert (=> b!1408309 (= c!130792 (validKeyInArray!0 (select (arr!46507 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408310 () Bool)

(declare-fun e!797174 () Bool)

(declare-fun contains!9838 (List!33013 (_ BitVec 64)) Bool)

(assert (=> b!1408310 (= e!797174 (contains!9838 Nil!33010 (select (arr!46507 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408311 () Bool)

(assert (=> b!1408311 (= e!797173 call!67035)))

(declare-fun b!1408307 () Bool)

(declare-fun e!797172 () Bool)

(assert (=> b!1408307 (= e!797172 e!797171)))

(declare-fun res!945666 () Bool)

(assert (=> b!1408307 (=> (not res!945666) (not e!797171))))

(assert (=> b!1408307 (= res!945666 (not e!797174))))

(declare-fun res!945665 () Bool)

(assert (=> b!1408307 (=> (not res!945665) (not e!797174))))

(assert (=> b!1408307 (= res!945665 (validKeyInArray!0 (select (arr!46507 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151865 () Bool)

(declare-fun res!945667 () Bool)

(assert (=> d!151865 (=> res!945667 e!797172)))

(assert (=> d!151865 (= res!945667 (bvsge #b00000000000000000000000000000000 (size!47058 a!2901)))))

(assert (=> d!151865 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33010) e!797172)))

(assert (= (and d!151865 (not res!945667)) b!1408307))

(assert (= (and b!1408307 res!945665) b!1408310))

(assert (= (and b!1408307 res!945666) b!1408309))

(assert (= (and b!1408309 c!130792) b!1408308))

(assert (= (and b!1408309 (not c!130792)) b!1408311))

(assert (= (or b!1408308 b!1408311) bm!67032))

(assert (=> bm!67032 m!1297743))

(declare-fun m!1297753 () Bool)

(assert (=> bm!67032 m!1297753))

(assert (=> b!1408309 m!1297743))

(assert (=> b!1408309 m!1297743))

(assert (=> b!1408309 m!1297745))

(assert (=> b!1408310 m!1297743))

(assert (=> b!1408310 m!1297743))

(declare-fun m!1297755 () Bool)

(assert (=> b!1408310 m!1297755))

(assert (=> b!1408307 m!1297743))

(assert (=> b!1408307 m!1297743))

(assert (=> b!1408307 m!1297745))

(assert (=> b!1408226 d!151865))

(declare-fun d!151867 () Bool)

(assert (=> d!151867 (= (validKeyInArray!0 (select (arr!46507 a!2901) j!112)) (and (not (= (select (arr!46507 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46507 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1408230 d!151867))

(declare-fun b!1408312 () Bool)

(declare-fun e!797177 () Bool)

(declare-fun call!67036 () Bool)

(assert (=> b!1408312 (= e!797177 call!67036)))

(declare-fun bm!67033 () Bool)

(assert (=> bm!67033 (= call!67036 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1408313 () Bool)

(declare-fun e!797175 () Bool)

(declare-fun e!797176 () Bool)

(assert (=> b!1408313 (= e!797175 e!797176)))

(declare-fun c!130793 () Bool)

(assert (=> b!1408313 (= c!130793 (validKeyInArray!0 (select (arr!46507 a!2901) j!112)))))

(declare-fun b!1408314 () Bool)

(assert (=> b!1408314 (= e!797176 call!67036)))

(declare-fun b!1408315 () Bool)

(assert (=> b!1408315 (= e!797176 e!797177)))

(declare-fun lt!620064 () (_ BitVec 64))

(assert (=> b!1408315 (= lt!620064 (select (arr!46507 a!2901) j!112))))

(declare-fun lt!620066 () Unit!47443)

(assert (=> b!1408315 (= lt!620066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620064 j!112))))

(assert (=> b!1408315 (arrayContainsKey!0 a!2901 lt!620064 #b00000000000000000000000000000000)))

(declare-fun lt!620065 () Unit!47443)

(assert (=> b!1408315 (= lt!620065 lt!620066)))

(declare-fun res!945668 () Bool)

(assert (=> b!1408315 (= res!945668 (= (seekEntryOrOpen!0 (select (arr!46507 a!2901) j!112) a!2901 mask!2840) (Found!10721 j!112)))))

(assert (=> b!1408315 (=> (not res!945668) (not e!797177))))

(declare-fun d!151869 () Bool)

(declare-fun res!945669 () Bool)

(assert (=> d!151869 (=> res!945669 e!797175)))

(assert (=> d!151869 (= res!945669 (bvsge j!112 (size!47058 a!2901)))))

(assert (=> d!151869 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797175)))

(assert (= (and d!151869 (not res!945669)) b!1408313))

(assert (= (and b!1408313 c!130793) b!1408315))

(assert (= (and b!1408313 (not c!130793)) b!1408314))

(assert (= (and b!1408315 res!945668) b!1408312))

(assert (= (or b!1408312 b!1408314) bm!67033))

(declare-fun m!1297757 () Bool)

(assert (=> bm!67033 m!1297757))

(assert (=> b!1408313 m!1297659))

(assert (=> b!1408313 m!1297659))

(assert (=> b!1408313 m!1297671))

(assert (=> b!1408315 m!1297659))

(declare-fun m!1297759 () Bool)

(assert (=> b!1408315 m!1297759))

(declare-fun m!1297761 () Bool)

(assert (=> b!1408315 m!1297761))

(assert (=> b!1408315 m!1297659))

(assert (=> b!1408315 m!1297661))

(assert (=> b!1408225 d!151869))

(declare-fun d!151873 () Bool)

(assert (=> d!151873 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620069 () Unit!47443)

(declare-fun choose!38 (array!96326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47443)

(assert (=> d!151873 (= lt!620069 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151873 (validMask!0 mask!2840)))

(assert (=> d!151873 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620069)))

(declare-fun bs!41020 () Bool)

(assert (= bs!41020 d!151873))

(assert (=> bs!41020 m!1297669))

(declare-fun m!1297763 () Bool)

(assert (=> bs!41020 m!1297763))

(assert (=> bs!41020 m!1297653))

(assert (=> b!1408225 d!151873))

(declare-fun b!1408358 () Bool)

(declare-fun e!797207 () SeekEntryResult!10721)

(assert (=> b!1408358 (= e!797207 (Intermediate!10721 false lt!620036 #b00000000000000000000000000000000))))

(declare-fun b!1408359 () Bool)

(declare-fun lt!620095 () SeekEntryResult!10721)

(assert (=> b!1408359 (and (bvsge (index!45263 lt!620095) #b00000000000000000000000000000000) (bvslt (index!45263 lt!620095) (size!47058 a!2901)))))

(declare-fun res!945688 () Bool)

(assert (=> b!1408359 (= res!945688 (= (select (arr!46507 a!2901) (index!45263 lt!620095)) (select (arr!46507 a!2901) j!112)))))

(declare-fun e!797208 () Bool)

(assert (=> b!1408359 (=> res!945688 e!797208)))

(declare-fun e!797210 () Bool)

(assert (=> b!1408359 (= e!797210 e!797208)))

(declare-fun b!1408360 () Bool)

(assert (=> b!1408360 (and (bvsge (index!45263 lt!620095) #b00000000000000000000000000000000) (bvslt (index!45263 lt!620095) (size!47058 a!2901)))))

(assert (=> b!1408360 (= e!797208 (= (select (arr!46507 a!2901) (index!45263 lt!620095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151879 () Bool)

(declare-fun e!797209 () Bool)

(assert (=> d!151879 e!797209))

(declare-fun c!130806 () Bool)

(assert (=> d!151879 (= c!130806 (and ((_ is Intermediate!10721) lt!620095) (undefined!11533 lt!620095)))))

(declare-fun e!797206 () SeekEntryResult!10721)

(assert (=> d!151879 (= lt!620095 e!797206)))

(declare-fun c!130807 () Bool)

(assert (=> d!151879 (= c!130807 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620096 () (_ BitVec 64))

(assert (=> d!151879 (= lt!620096 (select (arr!46507 a!2901) lt!620036))))

(assert (=> d!151879 (validMask!0 mask!2840)))

(assert (=> d!151879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620036 (select (arr!46507 a!2901) j!112) a!2901 mask!2840) lt!620095)))

(declare-fun b!1408361 () Bool)

(assert (=> b!1408361 (= e!797209 e!797210)))

(declare-fun res!945689 () Bool)

(assert (=> b!1408361 (= res!945689 (and ((_ is Intermediate!10721) lt!620095) (not (undefined!11533 lt!620095)) (bvslt (x!127017 lt!620095) #b01111111111111111111111111111110) (bvsge (x!127017 lt!620095) #b00000000000000000000000000000000) (bvsge (x!127017 lt!620095) #b00000000000000000000000000000000)))))

(assert (=> b!1408361 (=> (not res!945689) (not e!797210))))

(declare-fun b!1408362 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408362 (= e!797207 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620036 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46507 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408363 () Bool)

(assert (=> b!1408363 (= e!797206 (Intermediate!10721 true lt!620036 #b00000000000000000000000000000000))))

(declare-fun b!1408364 () Bool)

(assert (=> b!1408364 (and (bvsge (index!45263 lt!620095) #b00000000000000000000000000000000) (bvslt (index!45263 lt!620095) (size!47058 a!2901)))))

(declare-fun res!945690 () Bool)

(assert (=> b!1408364 (= res!945690 (= (select (arr!46507 a!2901) (index!45263 lt!620095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1408364 (=> res!945690 e!797208)))

(declare-fun b!1408365 () Bool)

(assert (=> b!1408365 (= e!797206 e!797207)))

(declare-fun c!130808 () Bool)

(assert (=> b!1408365 (= c!130808 (or (= lt!620096 (select (arr!46507 a!2901) j!112)) (= (bvadd lt!620096 lt!620096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1408366 () Bool)

(assert (=> b!1408366 (= e!797209 (bvsge (x!127017 lt!620095) #b01111111111111111111111111111110))))

(assert (= (and d!151879 c!130807) b!1408363))

(assert (= (and d!151879 (not c!130807)) b!1408365))

(assert (= (and b!1408365 c!130808) b!1408358))

(assert (= (and b!1408365 (not c!130808)) b!1408362))

(assert (= (and d!151879 c!130806) b!1408366))

(assert (= (and d!151879 (not c!130806)) b!1408361))

(assert (= (and b!1408361 res!945689) b!1408359))

(assert (= (and b!1408359 (not res!945688)) b!1408364))

(assert (= (and b!1408364 (not res!945690)) b!1408360))

(declare-fun m!1297785 () Bool)

(assert (=> b!1408362 m!1297785))

(assert (=> b!1408362 m!1297785))

(assert (=> b!1408362 m!1297659))

(declare-fun m!1297787 () Bool)

(assert (=> b!1408362 m!1297787))

(declare-fun m!1297789 () Bool)

(assert (=> d!151879 m!1297789))

(assert (=> d!151879 m!1297653))

(declare-fun m!1297791 () Bool)

(assert (=> b!1408359 m!1297791))

(assert (=> b!1408364 m!1297791))

(assert (=> b!1408360 m!1297791))

(assert (=> b!1408225 d!151879))

(declare-fun d!151887 () Bool)

(declare-fun lt!620112 () (_ BitVec 32))

(declare-fun lt!620111 () (_ BitVec 32))

(assert (=> d!151887 (= lt!620112 (bvmul (bvxor lt!620111 (bvlshr lt!620111 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151887 (= lt!620111 ((_ extract 31 0) (bvand (bvxor (select (arr!46507 a!2901) j!112) (bvlshr (select (arr!46507 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151887 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945691 (let ((h!34277 ((_ extract 31 0) (bvand (bvxor (select (arr!46507 a!2901) j!112) (bvlshr (select (arr!46507 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127021 (bvmul (bvxor h!34277 (bvlshr h!34277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127021 (bvlshr x!127021 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945691 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945691 #b00000000000000000000000000000000))))))

(assert (=> d!151887 (= (toIndex!0 (select (arr!46507 a!2901) j!112) mask!2840) (bvand (bvxor lt!620112 (bvlshr lt!620112 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1408225 d!151887))

(declare-fun d!151889 () Bool)

(assert (=> d!151889 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121148 d!151889))

(declare-fun d!151903 () Bool)

(assert (=> d!151903 (= (array_inv!35788 a!2901) (bvsge (size!47058 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121148 d!151903))

(declare-fun e!797239 () SeekEntryResult!10721)

(declare-fun b!1408416 () Bool)

(assert (=> b!1408416 (= e!797239 (Intermediate!10721 false (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1408417 () Bool)

(declare-fun lt!620130 () SeekEntryResult!10721)

(assert (=> b!1408417 (and (bvsge (index!45263 lt!620130) #b00000000000000000000000000000000) (bvslt (index!45263 lt!620130) (size!47058 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)))))))

(declare-fun res!945704 () Bool)

(assert (=> b!1408417 (= res!945704 (= (select (arr!46507 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901))) (index!45263 lt!620130)) (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!797240 () Bool)

(assert (=> b!1408417 (=> res!945704 e!797240)))

(declare-fun e!797242 () Bool)

(assert (=> b!1408417 (= e!797242 e!797240)))

(declare-fun b!1408418 () Bool)

(assert (=> b!1408418 (and (bvsge (index!45263 lt!620130) #b00000000000000000000000000000000) (bvslt (index!45263 lt!620130) (size!47058 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)))))))

(assert (=> b!1408418 (= e!797240 (= (select (arr!46507 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901))) (index!45263 lt!620130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151907 () Bool)

(declare-fun e!797241 () Bool)

(assert (=> d!151907 e!797241))

(declare-fun c!130828 () Bool)

(assert (=> d!151907 (= c!130828 (and ((_ is Intermediate!10721) lt!620130) (undefined!11533 lt!620130)))))

(declare-fun e!797238 () SeekEntryResult!10721)

(assert (=> d!151907 (= lt!620130 e!797238)))

(declare-fun c!130829 () Bool)

(assert (=> d!151907 (= c!130829 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620131 () (_ BitVec 64))

(assert (=> d!151907 (= lt!620131 (select (arr!46507 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901))) (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151907 (validMask!0 mask!2840)))

(assert (=> d!151907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)) mask!2840) lt!620130)))

(declare-fun b!1408419 () Bool)

(assert (=> b!1408419 (= e!797241 e!797242)))

(declare-fun res!945705 () Bool)

(assert (=> b!1408419 (= res!945705 (and ((_ is Intermediate!10721) lt!620130) (not (undefined!11533 lt!620130)) (bvslt (x!127017 lt!620130) #b01111111111111111111111111111110) (bvsge (x!127017 lt!620130) #b00000000000000000000000000000000) (bvsge (x!127017 lt!620130) #b00000000000000000000000000000000)))))

(assert (=> b!1408419 (=> (not res!945705) (not e!797242))))

(declare-fun b!1408420 () Bool)

(assert (=> b!1408420 (= e!797239 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)) mask!2840))))

(declare-fun b!1408421 () Bool)

(assert (=> b!1408421 (= e!797238 (Intermediate!10721 true (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1408422 () Bool)

(assert (=> b!1408422 (and (bvsge (index!45263 lt!620130) #b00000000000000000000000000000000) (bvslt (index!45263 lt!620130) (size!47058 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901)))))))

(declare-fun res!945706 () Bool)

(assert (=> b!1408422 (= res!945706 (= (select (arr!46507 (array!96327 (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47058 a!2901))) (index!45263 lt!620130)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1408422 (=> res!945706 e!797240)))

(declare-fun b!1408423 () Bool)

(assert (=> b!1408423 (= e!797238 e!797239)))

(declare-fun c!130830 () Bool)

(assert (=> b!1408423 (= c!130830 (or (= lt!620131 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620131 lt!620131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1408424 () Bool)

(assert (=> b!1408424 (= e!797241 (bvsge (x!127017 lt!620130) #b01111111111111111111111111111110))))

(assert (= (and d!151907 c!130829) b!1408421))

(assert (= (and d!151907 (not c!130829)) b!1408423))

(assert (= (and b!1408423 c!130830) b!1408416))

(assert (= (and b!1408423 (not c!130830)) b!1408420))

(assert (= (and d!151907 c!130828) b!1408424))

(assert (= (and d!151907 (not c!130828)) b!1408419))

(assert (= (and b!1408419 res!945705) b!1408417))

(assert (= (and b!1408417 (not res!945704)) b!1408422))

(assert (= (and b!1408422 (not res!945706)) b!1408418))

(assert (=> b!1408420 m!1297649))

(declare-fun m!1297821 () Bool)

(assert (=> b!1408420 m!1297821))

(assert (=> b!1408420 m!1297821))

(assert (=> b!1408420 m!1297647))

(declare-fun m!1297823 () Bool)

(assert (=> b!1408420 m!1297823))

(assert (=> d!151907 m!1297649))

(declare-fun m!1297825 () Bool)

(assert (=> d!151907 m!1297825))

(assert (=> d!151907 m!1297653))

(declare-fun m!1297827 () Bool)

(assert (=> b!1408417 m!1297827))

(assert (=> b!1408422 m!1297827))

(assert (=> b!1408418 m!1297827))

(assert (=> b!1408229 d!151907))

(declare-fun d!151909 () Bool)

(declare-fun lt!620133 () (_ BitVec 32))

(declare-fun lt!620132 () (_ BitVec 32))

(assert (=> d!151909 (= lt!620133 (bvmul (bvxor lt!620132 (bvlshr lt!620132 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151909 (= lt!620132 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151909 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945691 (let ((h!34277 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127021 (bvmul (bvxor h!34277 (bvlshr h!34277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127021 (bvlshr x!127021 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945691 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945691 #b00000000000000000000000000000000))))))

(assert (=> d!151909 (= (toIndex!0 (select (store (arr!46507 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620133 (bvlshr lt!620133 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1408229 d!151909))

(declare-fun lt!620153 () SeekEntryResult!10721)

(declare-fun b!1408492 () Bool)

(declare-fun e!797285 () SeekEntryResult!10721)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96326 (_ BitVec 32)) SeekEntryResult!10721)

(assert (=> b!1408492 (= e!797285 (seekKeyOrZeroReturnVacant!0 (x!127017 lt!620153) (index!45263 lt!620153) (index!45263 lt!620153) (select (arr!46507 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408493 () Bool)

(assert (=> b!1408493 (= e!797285 (MissingZero!10721 (index!45263 lt!620153)))))

(declare-fun b!1408494 () Bool)

(declare-fun c!130854 () Bool)

(declare-fun lt!620155 () (_ BitVec 64))

(assert (=> b!1408494 (= c!130854 (= lt!620155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797286 () SeekEntryResult!10721)

(assert (=> b!1408494 (= e!797286 e!797285)))

(declare-fun b!1408495 () Bool)

(declare-fun e!797284 () SeekEntryResult!10721)

(assert (=> b!1408495 (= e!797284 Undefined!10721)))

(declare-fun b!1408496 () Bool)

(assert (=> b!1408496 (= e!797284 e!797286)))

(assert (=> b!1408496 (= lt!620155 (select (arr!46507 a!2901) (index!45263 lt!620153)))))

(declare-fun c!130853 () Bool)

(assert (=> b!1408496 (= c!130853 (= lt!620155 (select (arr!46507 a!2901) j!112)))))

(declare-fun b!1408497 () Bool)

(assert (=> b!1408497 (= e!797286 (Found!10721 (index!45263 lt!620153)))))

(declare-fun d!151911 () Bool)

(declare-fun lt!620154 () SeekEntryResult!10721)

(assert (=> d!151911 (and (or ((_ is Undefined!10721) lt!620154) (not ((_ is Found!10721) lt!620154)) (and (bvsge (index!45262 lt!620154) #b00000000000000000000000000000000) (bvslt (index!45262 lt!620154) (size!47058 a!2901)))) (or ((_ is Undefined!10721) lt!620154) ((_ is Found!10721) lt!620154) (not ((_ is MissingZero!10721) lt!620154)) (and (bvsge (index!45261 lt!620154) #b00000000000000000000000000000000) (bvslt (index!45261 lt!620154) (size!47058 a!2901)))) (or ((_ is Undefined!10721) lt!620154) ((_ is Found!10721) lt!620154) ((_ is MissingZero!10721) lt!620154) (not ((_ is MissingVacant!10721) lt!620154)) (and (bvsge (index!45264 lt!620154) #b00000000000000000000000000000000) (bvslt (index!45264 lt!620154) (size!47058 a!2901)))) (or ((_ is Undefined!10721) lt!620154) (ite ((_ is Found!10721) lt!620154) (= (select (arr!46507 a!2901) (index!45262 lt!620154)) (select (arr!46507 a!2901) j!112)) (ite ((_ is MissingZero!10721) lt!620154) (= (select (arr!46507 a!2901) (index!45261 lt!620154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10721) lt!620154) (= (select (arr!46507 a!2901) (index!45264 lt!620154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151911 (= lt!620154 e!797284)))

(declare-fun c!130855 () Bool)

(assert (=> d!151911 (= c!130855 (and ((_ is Intermediate!10721) lt!620153) (undefined!11533 lt!620153)))))

(assert (=> d!151911 (= lt!620153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46507 a!2901) j!112) mask!2840) (select (arr!46507 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151911 (validMask!0 mask!2840)))

(assert (=> d!151911 (= (seekEntryOrOpen!0 (select (arr!46507 a!2901) j!112) a!2901 mask!2840) lt!620154)))

(assert (= (and d!151911 c!130855) b!1408495))

(assert (= (and d!151911 (not c!130855)) b!1408496))

(assert (= (and b!1408496 c!130853) b!1408497))

(assert (= (and b!1408496 (not c!130853)) b!1408494))

(assert (= (and b!1408494 c!130854) b!1408493))

(assert (= (and b!1408494 (not c!130854)) b!1408492))

(assert (=> b!1408492 m!1297659))

(declare-fun m!1297861 () Bool)

(assert (=> b!1408492 m!1297861))

(declare-fun m!1297863 () Bool)

(assert (=> b!1408496 m!1297863))

(assert (=> d!151911 m!1297659))

(assert (=> d!151911 m!1297663))

(assert (=> d!151911 m!1297663))

(assert (=> d!151911 m!1297659))

(declare-fun m!1297865 () Bool)

(assert (=> d!151911 m!1297865))

(assert (=> d!151911 m!1297653))

(declare-fun m!1297867 () Bool)

(assert (=> d!151911 m!1297867))

(declare-fun m!1297869 () Bool)

(assert (=> d!151911 m!1297869))

(declare-fun m!1297871 () Bool)

(assert (=> d!151911 m!1297871))

(assert (=> b!1408228 d!151911))

(check-sat (not b!1408362) (not d!151879) (not b!1408307) (not b!1408420) (not d!151873) (not bm!67029) (not b!1408313) (not b!1408309) (not b!1408492) (not b!1408294) (not bm!67033) (not b!1408310) (not bm!67032) (not d!151911) (not b!1408315) (not b!1408296) (not d!151907))
(check-sat)
