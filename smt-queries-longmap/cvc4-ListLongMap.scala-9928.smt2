; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117382 () Bool)

(assert start!117382)

(declare-fun res!922228 () Bool)

(declare-fun e!781798 () Bool)

(assert (=> start!117382 (=> (not res!922228) (not e!781798))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93942 0))(
  ( (array!93943 (arr!45367 (Array (_ BitVec 32) (_ BitVec 64))) (size!45917 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93942)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117382 (= res!922228 (and (bvslt (size!45917 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45917 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184)))))

(assert (=> start!117382 e!781798))

(declare-fun array_inv!34395 (array!93942) Bool)

(assert (=> start!117382 (array_inv!34395 a!4010)))

(assert (=> start!117382 true))

(declare-fun b!1379898 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93942 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379898 (= e!781798 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (= (and start!117382 res!922228) b!1379898))

(declare-fun m!1265125 () Bool)

(assert (=> start!117382 m!1265125))

(declare-fun m!1265127 () Bool)

(assert (=> b!1379898 m!1265127))

(declare-fun m!1265129 () Bool)

(assert (=> b!1379898 m!1265129))

(declare-fun m!1265131 () Bool)

(assert (=> b!1379898 m!1265131))

(push 1)

(assert (not b!1379898))

(assert (not start!117382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1379947 () Bool)

(declare-fun e!781825 () (_ BitVec 32))

(declare-fun call!66125 () (_ BitVec 32))

(assert (=> b!1379947 (= e!781825 (bvadd #b00000000000000000000000000000001 call!66125))))

(declare-fun b!1379948 () Bool)

(assert (=> b!1379948 (= e!781825 call!66125)))

(declare-fun bm!66122 () Bool)

(assert (=> bm!66122 (= call!66125 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun d!148697 () Bool)

(declare-fun lt!607801 () (_ BitVec 32))

(assert (=> d!148697 (and (bvsge lt!607801 #b00000000000000000000000000000000) (bvsle lt!607801 (bvsub (size!45917 a!4010) from!3388)))))

(declare-fun e!781824 () (_ BitVec 32))

(assert (=> d!148697 (= lt!607801 e!781824)))

(declare-fun c!128300 () Bool)

(assert (=> d!148697 (= c!128300 (bvsge from!3388 pivot!64))))

(assert (=> d!148697 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45917 a!4010)))))

(assert (=> d!148697 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607801)))

(declare-fun b!1379949 () Bool)

(assert (=> b!1379949 (= e!781824 #b00000000000000000000000000000000)))

(declare-fun b!1379950 () Bool)

(assert (=> b!1379950 (= e!781824 e!781825)))

(declare-fun c!128299 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379950 (= c!128299 (validKeyInArray!0 (select (arr!45367 a!4010) from!3388)))))

(assert (= (and d!148697 c!128300) b!1379949))

(assert (= (and d!148697 (not c!128300)) b!1379950))

(assert (= (and b!1379950 c!128299) b!1379947))

(assert (= (and b!1379950 (not c!128299)) b!1379948))

(assert (= (or b!1379947 b!1379948) bm!66122))

(declare-fun m!1265161 () Bool)

(assert (=> bm!66122 m!1265161))

(declare-fun m!1265163 () Bool)

(assert (=> b!1379950 m!1265163))

(assert (=> b!1379950 m!1265163))

(declare-fun m!1265165 () Bool)

(assert (=> b!1379950 m!1265165))

(assert (=> b!1379898 d!148697))

(declare-fun b!1379951 () Bool)

(declare-fun e!781827 () (_ BitVec 32))

(declare-fun call!66126 () (_ BitVec 32))

(assert (=> b!1379951 (= e!781827 (bvadd #b00000000000000000000000000000001 call!66126))))

(declare-fun b!1379952 () Bool)

(assert (=> b!1379952 (= e!781827 call!66126)))

(declare-fun bm!66123 () Bool)

(assert (=> bm!66123 (= call!66126 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun d!148707 () Bool)

(declare-fun lt!607802 () (_ BitVec 32))

(assert (=> d!148707 (and (bvsge lt!607802 #b00000000000000000000000000000000) (bvsle lt!607802 (bvsub (size!45917 a!4010) pivot!64)))))

(declare-fun e!781826 () (_ BitVec 32))

(assert (=> d!148707 (= lt!607802 e!781826)))

(declare-fun c!128302 () Bool)

(assert (=> d!148707 (= c!128302 (bvsge pivot!64 to!184))))

(assert (=> d!148707 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45917 a!4010)))))

(assert (=> d!148707 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607802)))

(declare-fun b!1379953 () Bool)

(assert (=> b!1379953 (= e!781826 #b00000000000000000000000000000000)))

(declare-fun b!1379954 () Bool)

(assert (=> b!1379954 (= e!781826 e!781827)))

(declare-fun c!128301 () Bool)

(assert (=> b!1379954 (= c!128301 (validKeyInArray!0 (select (arr!45367 a!4010) pivot!64)))))

(assert (= (and d!148707 c!128302) b!1379953))

(assert (= (and d!148707 (not c!128302)) b!1379954))

(assert (= (and b!1379954 c!128301) b!1379951))

(assert (= (and b!1379954 (not c!128301)) b!1379952))

(assert (= (or b!1379951 b!1379952) bm!66123))

(declare-fun m!1265167 () Bool)

(assert (=> bm!66123 m!1265167))

(declare-fun m!1265169 () Bool)

(assert (=> b!1379954 m!1265169))

(assert (=> b!1379954 m!1265169))

(declare-fun m!1265171 () Bool)

(assert (=> b!1379954 m!1265171))

(assert (=> b!1379898 d!148707))

(declare-fun b!1379955 () Bool)

(declare-fun e!781829 () (_ BitVec 32))

(declare-fun call!66127 () (_ BitVec 32))

(assert (=> b!1379955 (= e!781829 (bvadd #b00000000000000000000000000000001 call!66127))))

(declare-fun b!1379956 () Bool)

(assert (=> b!1379956 (= e!781829 call!66127)))

(declare-fun bm!66124 () Bool)

(assert (=> bm!66124 (= call!66127 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun d!148709 () Bool)

(declare-fun lt!607803 () (_ BitVec 32))

(assert (=> d!148709 (and (bvsge lt!607803 #b00000000000000000000000000000000) (bvsle lt!607803 (bvsub (size!45917 a!4010) from!3388)))))

(declare-fun e!781828 () (_ BitVec 32))

(assert (=> d!148709 (= lt!607803 e!781828)))

(declare-fun c!128304 () Bool)

(assert (=> d!148709 (= c!128304 (bvsge from!3388 to!184))))

(assert (=> d!148709 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45917 a!4010)))))

(assert (=> d!148709 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607803)))

(declare-fun b!1379957 () Bool)

(assert (=> b!1379957 (= e!781828 #b00000000000000000000000000000000)))

(declare-fun b!1379958 () Bool)

(assert (=> b!1379958 (= e!781828 e!781829)))

(declare-fun c!128303 () Bool)

(assert (=> b!1379958 (= c!128303 (validKeyInArray!0 (select (arr!45367 a!4010) from!3388)))))

(assert (= (and d!148709 c!128304) b!1379957))

(assert (= (and d!148709 (not c!128304)) b!1379958))

(assert (= (and b!1379958 c!128303) b!1379955))

(assert (= (and b!1379958 (not c!128303)) b!1379956))

(assert (= (or b!1379955 b!1379956) bm!66124))

(declare-fun m!1265173 () Bool)

(assert (=> bm!66124 m!1265173))

(assert (=> b!1379958 m!1265163))

(assert (=> b!1379958 m!1265163))

(assert (=> b!1379958 m!1265165))

(assert (=> b!1379898 d!148709))

(declare-fun d!148711 () Bool)

(assert (=> d!148711 (= (array_inv!34395 a!4010) (bvsge (size!45917 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117382 d!148711))

(push 1)

(assert (not bm!66124))

(assert (not b!1379950))

(assert (not b!1379958))

(assert (not bm!66123))

(assert (not bm!66122))

(assert (not b!1379954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

