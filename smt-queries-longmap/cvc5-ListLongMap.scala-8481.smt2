; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103362 () Bool)

(assert start!103362)

(declare-fun b!1239890 () Bool)

(declare-fun res!827224 () Bool)

(declare-fun e!702689 () Bool)

(assert (=> b!1239890 (=> (not res!827224) (not e!702689))))

(declare-datatypes ((List!27313 0))(
  ( (Nil!27310) (Cons!27309 (h!28518 (_ BitVec 64)) (t!40776 List!27313)) )
))
(declare-fun acc!846 () List!27313)

(declare-fun contains!7375 (List!27313 (_ BitVec 64)) Bool)

(assert (=> b!1239890 (= res!827224 (not (contains!7375 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!827222 () Bool)

(assert (=> start!103362 (=> (not res!827222) (not e!702689))))

(declare-datatypes ((array!79883 0))(
  ( (array!79884 (arr!38540 (Array (_ BitVec 32) (_ BitVec 64))) (size!39076 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79883)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103362 (= res!827222 (and (bvslt (size!39076 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39076 a!3835))))))

(assert (=> start!103362 e!702689))

(declare-fun array_inv!29388 (array!79883) Bool)

(assert (=> start!103362 (array_inv!29388 a!3835)))

(assert (=> start!103362 true))

(declare-fun b!1239891 () Bool)

(declare-fun res!827218 () Bool)

(assert (=> b!1239891 (=> (not res!827218) (not e!702689))))

(declare-fun arrayNoDuplicates!0 (array!79883 (_ BitVec 32) List!27313) Bool)

(assert (=> b!1239891 (= res!827218 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun b!1239892 () Bool)

(declare-fun arrayContainsKey!0 (array!79883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239892 (= e!702689 (arrayContainsKey!0 a!3835 k!2925 from!3213))))

(declare-fun b!1239893 () Bool)

(declare-fun res!827221 () Bool)

(assert (=> b!1239893 (=> (not res!827221) (not e!702689))))

(assert (=> b!1239893 (= res!827221 (not (contains!7375 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239894 () Bool)

(declare-fun res!827220 () Bool)

(assert (=> b!1239894 (=> (not res!827220) (not e!702689))))

(declare-fun noDuplicate!1972 (List!27313) Bool)

(assert (=> b!1239894 (= res!827220 (noDuplicate!1972 acc!846))))

(declare-fun b!1239895 () Bool)

(declare-fun res!827219 () Bool)

(assert (=> b!1239895 (=> (not res!827219) (not e!702689))))

(assert (=> b!1239895 (= res!827219 (= from!3213 (bvsub (size!39076 a!3835) #b00000000000000000000000000000001)))))

(declare-fun b!1239896 () Bool)

(declare-fun res!827223 () Bool)

(assert (=> b!1239896 (=> (not res!827223) (not e!702689))))

(assert (=> b!1239896 (= res!827223 (contains!7375 acc!846 k!2925))))

(assert (= (and start!103362 res!827222) b!1239894))

(assert (= (and b!1239894 res!827220) b!1239893))

(assert (= (and b!1239893 res!827221) b!1239890))

(assert (= (and b!1239890 res!827224) b!1239891))

(assert (= (and b!1239891 res!827218) b!1239896))

(assert (= (and b!1239896 res!827223) b!1239895))

(assert (= (and b!1239895 res!827219) b!1239892))

(declare-fun m!1143259 () Bool)

(assert (=> b!1239890 m!1143259))

(declare-fun m!1143261 () Bool)

(assert (=> b!1239891 m!1143261))

(declare-fun m!1143263 () Bool)

(assert (=> start!103362 m!1143263))

(declare-fun m!1143265 () Bool)

(assert (=> b!1239894 m!1143265))

(declare-fun m!1143267 () Bool)

(assert (=> b!1239893 m!1143267))

(declare-fun m!1143269 () Bool)

(assert (=> b!1239892 m!1143269))

(declare-fun m!1143271 () Bool)

(assert (=> b!1239896 m!1143271))

(push 1)

(assert (not b!1239896))

(assert (not start!103362))

(assert (not b!1239890))

(assert (not b!1239892))

(assert (not b!1239893))

(assert (not b!1239891))

(assert (not b!1239894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun c!121198 () Bool)

(declare-fun bm!61117 () Bool)

(declare-fun call!61120 () Bool)

(assert (=> bm!61117 (= call!61120 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121198 (Cons!27309 (select (arr!38540 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1239963 () Bool)

(declare-fun e!702726 () Bool)

(declare-fun e!702725 () Bool)

(assert (=> b!1239963 (= e!702726 e!702725)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239963 (= c!121198 (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)))))

(declare-fun b!1239964 () Bool)

(assert (=> b!1239964 (= e!702725 call!61120)))

(declare-fun b!1239965 () Bool)

(declare-fun e!702728 () Bool)

(assert (=> b!1239965 (= e!702728 e!702726)))

(declare-fun res!827288 () Bool)

(assert (=> b!1239965 (=> (not res!827288) (not e!702726))))

(declare-fun e!702727 () Bool)

(assert (=> b!1239965 (= res!827288 (not e!702727))))

(declare-fun res!827289 () Bool)

(assert (=> b!1239965 (=> (not res!827289) (not e!702727))))

(assert (=> b!1239965 (= res!827289 (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)))))

(declare-fun b!1239966 () Bool)

(assert (=> b!1239966 (= e!702727 (contains!7375 acc!846 (select (arr!38540 a!3835) from!3213)))))

(declare-fun d!136143 () Bool)

(declare-fun res!827287 () Bool)

(assert (=> d!136143 (=> res!827287 e!702728)))

(assert (=> d!136143 (= res!827287 (bvsge from!3213 (size!39076 a!3835)))))

(assert (=> d!136143 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702728)))

(declare-fun b!1239967 () Bool)

(assert (=> b!1239967 (= e!702725 call!61120)))

(assert (= (and d!136143 (not res!827287)) b!1239965))

(assert (= (and b!1239965 res!827289) b!1239966))

(assert (= (and b!1239965 res!827288) b!1239963))

(assert (= (and b!1239963 c!121198) b!1239967))

(assert (= (and b!1239963 (not c!121198)) b!1239964))

(assert (= (or b!1239967 b!1239964) bm!61117))

(declare-fun m!1143305 () Bool)

(assert (=> bm!61117 m!1143305))

(declare-fun m!1143307 () Bool)

(assert (=> bm!61117 m!1143307))

(assert (=> b!1239963 m!1143305))

(assert (=> b!1239963 m!1143305))

(declare-fun m!1143309 () Bool)

(assert (=> b!1239963 m!1143309))

(assert (=> b!1239965 m!1143305))

(assert (=> b!1239965 m!1143305))

(assert (=> b!1239965 m!1143309))

(assert (=> b!1239966 m!1143305))

(assert (=> b!1239966 m!1143305))

(declare-fun m!1143311 () Bool)

(assert (=> b!1239966 m!1143311))

(assert (=> b!1239891 d!136143))

(declare-fun d!136149 () Bool)

(assert (=> d!136149 (= (array_inv!29388 a!3835) (bvsge (size!39076 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103362 d!136149))

(declare-fun d!136151 () Bool)

(declare-fun lt!561864 () Bool)

(declare-fun content!599 (List!27313) (Set (_ BitVec 64)))

(assert (=> d!136151 (= lt!561864 (set.member k!2925 (content!599 acc!846)))))

(declare-fun e!702744 () Bool)

(assert (=> d!136151 (= lt!561864 e!702744)))

(declare-fun res!827304 () Bool)

(assert (=> d!136151 (=> (not res!827304) (not e!702744))))

(assert (=> d!136151 (= res!827304 (is-Cons!27309 acc!846))))

(assert (=> d!136151 (= (contains!7375 acc!846 k!2925) lt!561864)))

(declare-fun b!1239982 () Bool)

(declare-fun e!702743 () Bool)

(assert (=> b!1239982 (= e!702744 e!702743)))

(declare-fun res!827305 () Bool)

(assert (=> b!1239982 (=> res!827305 e!702743)))

(assert (=> b!1239982 (= res!827305 (= (h!28518 acc!846) k!2925))))

(declare-fun b!1239983 () Bool)

(assert (=> b!1239983 (= e!702743 (contains!7375 (t!40776 acc!846) k!2925))))

(assert (= (and d!136151 res!827304) b!1239982))

(assert (= (and b!1239982 (not res!827305)) b!1239983))

(declare-fun m!1143327 () Bool)

(assert (=> d!136151 m!1143327))

(declare-fun m!1143329 () Bool)

(assert (=> d!136151 m!1143329))

(declare-fun m!1143331 () Bool)

(assert (=> b!1239983 m!1143331))

(assert (=> b!1239896 d!136151))

(declare-fun d!136159 () Bool)

(declare-fun lt!561865 () Bool)

(assert (=> d!136159 (= lt!561865 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!599 acc!846)))))

(declare-fun e!702748 () Bool)

(assert (=> d!136159 (= lt!561865 e!702748)))

(declare-fun res!827308 () Bool)

(assert (=> d!136159 (=> (not res!827308) (not e!702748))))

(assert (=> d!136159 (= res!827308 (is-Cons!27309 acc!846))))

(assert (=> d!136159 (= (contains!7375 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561865)))

(declare-fun b!1239986 () Bool)

(declare-fun e!702747 () Bool)

(assert (=> b!1239986 (= e!702748 e!702747)))

(declare-fun res!827309 () Bool)

(assert (=> b!1239986 (=> res!827309 e!702747)))

(assert (=> b!1239986 (= res!827309 (= (h!28518 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239987 () Bool)

(assert (=> b!1239987 (= e!702747 (contains!7375 (t!40776 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136159 res!827308) b!1239986))

(assert (= (and b!1239986 (not res!827309)) b!1239987))

(assert (=> d!136159 m!1143327))

(declare-fun m!1143337 () Bool)

(assert (=> d!136159 m!1143337))

(declare-fun m!1143339 () Bool)

(assert (=> b!1239987 m!1143339))

(assert (=> b!1239890 d!136159))

(declare-fun d!136163 () Bool)

(declare-fun res!827320 () Bool)

(declare-fun e!702761 () Bool)

(assert (=> d!136163 (=> res!827320 e!702761)))

(assert (=> d!136163 (= res!827320 (is-Nil!27310 acc!846))))

(assert (=> d!136163 (= (noDuplicate!1972 acc!846) e!702761)))

(declare-fun b!1240002 () Bool)

(declare-fun e!702762 () Bool)

(assert (=> b!1240002 (= e!702761 e!702762)))

(declare-fun res!827321 () Bool)

(assert (=> b!1240002 (=> (not res!827321) (not e!702762))))

(assert (=> b!1240002 (= res!827321 (not (contains!7375 (t!40776 acc!846) (h!28518 acc!846))))))

(declare-fun b!1240003 () Bool)

(assert (=> b!1240003 (= e!702762 (noDuplicate!1972 (t!40776 acc!846)))))

(assert (= (and d!136163 (not res!827320)) b!1240002))

(assert (= (and b!1240002 res!827321) b!1240003))

(declare-fun m!1143341 () Bool)

(assert (=> b!1240002 m!1143341))

(declare-fun m!1143343 () Bool)

(assert (=> b!1240003 m!1143343))

(assert (=> b!1239894 d!136163))

(declare-fun d!136165 () Bool)

(declare-fun res!827335 () Bool)

(declare-fun e!702779 () Bool)

(assert (=> d!136165 (=> res!827335 e!702779)))

(assert (=> d!136165 (= res!827335 (= (select (arr!38540 a!3835) from!3213) k!2925))))

(assert (=> d!136165 (= (arrayContainsKey!0 a!3835 k!2925 from!3213) e!702779)))

(declare-fun b!1240023 () Bool)

(declare-fun e!702780 () Bool)

(assert (=> b!1240023 (= e!702779 e!702780)))

(declare-fun res!827336 () Bool)

(assert (=> b!1240023 (=> (not res!827336) (not e!702780))))

(assert (=> b!1240023 (= res!827336 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39076 a!3835)))))

(declare-fun b!1240024 () Bool)

(assert (=> b!1240024 (= e!702780 (arrayContainsKey!0 a!3835 k!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136165 (not res!827335)) b!1240023))

(assert (= (and b!1240023 res!827336) b!1240024))

(assert (=> d!136165 m!1143305))

(declare-fun m!1143345 () Bool)

(assert (=> b!1240024 m!1143345))

(assert (=> b!1239892 d!136165))

(declare-fun d!136167 () Bool)

(declare-fun lt!561866 () Bool)

(assert (=> d!136167 (= lt!561866 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!599 acc!846)))))

(declare-fun e!702782 () Bool)

(assert (=> d!136167 (= lt!561866 e!702782)))

(declare-fun res!827337 () Bool)

(assert (=> d!136167 (=> (not res!827337) (not e!702782))))

(assert (=> d!136167 (= res!827337 (is-Cons!27309 acc!846))))

(assert (=> d!136167 (= (contains!7375 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561866)))

(declare-fun b!1240025 () Bool)

(declare-fun e!702781 () Bool)

(assert (=> b!1240025 (= e!702782 e!702781)))

(declare-fun res!827338 () Bool)

(assert (=> b!1240025 (=> res!827338 e!702781)))

(assert (=> b!1240025 (= res!827338 (= (h!28518 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240026 () Bool)

(assert (=> b!1240026 (= e!702781 (contains!7375 (t!40776 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136167 res!827337) b!1240025))

(assert (= (and b!1240025 (not res!827338)) b!1240026))

(assert (=> d!136167 m!1143327))

(declare-fun m!1143355 () Bool)

(assert (=> d!136167 m!1143355))

(declare-fun m!1143357 () Bool)

(assert (=> b!1240026 m!1143357))

(assert (=> b!1239893 d!136167))

(push 1)

(assert (not b!1239987))

(assert (not b!1239983))

(assert (not d!136167))

(assert (not b!1240002))

(assert (not b!1239965))

(assert (not b!1240026))

(assert (not bm!61117))

(assert (not d!136159))

(assert (not b!1240024))

(assert (not b!1240003))

(assert (not b!1239963))

(assert (not b!1239966))

(assert (not d!136151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136183 () Bool)

(declare-fun res!827360 () Bool)

(declare-fun e!702805 () Bool)

(assert (=> d!136183 (=> res!827360 e!702805)))

(assert (=> d!136183 (= res!827360 (is-Nil!27310 (t!40776 acc!846)))))

(assert (=> d!136183 (= (noDuplicate!1972 (t!40776 acc!846)) e!702805)))

(declare-fun b!1240050 () Bool)

(declare-fun e!702806 () Bool)

(assert (=> b!1240050 (= e!702805 e!702806)))

(declare-fun res!827361 () Bool)

(assert (=> b!1240050 (=> (not res!827361) (not e!702806))))

(assert (=> b!1240050 (= res!827361 (not (contains!7375 (t!40776 (t!40776 acc!846)) (h!28518 (t!40776 acc!846)))))))

(declare-fun b!1240051 () Bool)

(assert (=> b!1240051 (= e!702806 (noDuplicate!1972 (t!40776 (t!40776 acc!846))))))

(assert (= (and d!136183 (not res!827360)) b!1240050))

(assert (= (and b!1240050 res!827361) b!1240051))

(declare-fun m!1143385 () Bool)

(assert (=> b!1240050 m!1143385))

(declare-fun m!1143387 () Bool)

(assert (=> b!1240051 m!1143387))

(assert (=> b!1240003 d!136183))

(declare-fun d!136185 () Bool)

(declare-fun lt!561873 () Bool)

(assert (=> d!136185 (= lt!561873 (set.member (h!28518 acc!846) (content!599 (t!40776 acc!846))))))

(declare-fun e!702808 () Bool)

(assert (=> d!136185 (= lt!561873 e!702808)))

(declare-fun res!827362 () Bool)

(assert (=> d!136185 (=> (not res!827362) (not e!702808))))

(assert (=> d!136185 (= res!827362 (is-Cons!27309 (t!40776 acc!846)))))

(assert (=> d!136185 (= (contains!7375 (t!40776 acc!846) (h!28518 acc!846)) lt!561873)))

(declare-fun b!1240052 () Bool)

(declare-fun e!702807 () Bool)

(assert (=> b!1240052 (= e!702808 e!702807)))

(declare-fun res!827363 () Bool)

(assert (=> b!1240052 (=> res!827363 e!702807)))

(assert (=> b!1240052 (= res!827363 (= (h!28518 (t!40776 acc!846)) (h!28518 acc!846)))))

(declare-fun b!1240053 () Bool)

(assert (=> b!1240053 (= e!702807 (contains!7375 (t!40776 (t!40776 acc!846)) (h!28518 acc!846)))))

(assert (= (and d!136185 res!827362) b!1240052))

(assert (= (and b!1240052 (not res!827363)) b!1240053))

(declare-fun m!1143389 () Bool)

(assert (=> d!136185 m!1143389))

(declare-fun m!1143391 () Bool)

(assert (=> d!136185 m!1143391))

(declare-fun m!1143393 () Bool)

(assert (=> b!1240053 m!1143393))

(assert (=> b!1240002 d!136185))

(declare-fun d!136189 () Bool)

(declare-fun c!121207 () Bool)

(assert (=> d!136189 (= c!121207 (is-Nil!27310 acc!846))))

(declare-fun e!702813 () (Set (_ BitVec 64)))

(assert (=> d!136189 (= (content!599 acc!846) e!702813)))

(declare-fun b!1240060 () Bool)

(assert (=> b!1240060 (= e!702813 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!1240061 () Bool)

(assert (=> b!1240061 (= e!702813 (set.union (set.insert (h!28518 acc!846) (as set.empty (Set (_ BitVec 64)))) (content!599 (t!40776 acc!846))))))

(assert (= (and d!136189 c!121207) b!1240060))

(assert (= (and d!136189 (not c!121207)) b!1240061))

(declare-fun m!1143401 () Bool)

(assert (=> b!1240061 m!1143401))

(assert (=> b!1240061 m!1143389))

(assert (=> d!136167 d!136189))

(declare-fun d!136195 () Bool)

(declare-fun lt!561875 () Bool)

(assert (=> d!136195 (= lt!561875 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!599 (t!40776 acc!846))))))

(declare-fun e!702815 () Bool)

(assert (=> d!136195 (= lt!561875 e!702815)))

(declare-fun res!827366 () Bool)

(assert (=> d!136195 (=> (not res!827366) (not e!702815))))

(assert (=> d!136195 (= res!827366 (is-Cons!27309 (t!40776 acc!846)))))

(assert (=> d!136195 (= (contains!7375 (t!40776 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000) lt!561875)))

(declare-fun b!1240062 () Bool)

(declare-fun e!702814 () Bool)

(assert (=> b!1240062 (= e!702815 e!702814)))

(declare-fun res!827367 () Bool)

(assert (=> b!1240062 (=> res!827367 e!702814)))

(assert (=> b!1240062 (= res!827367 (= (h!28518 (t!40776 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240063 () Bool)

(assert (=> b!1240063 (= e!702814 (contains!7375 (t!40776 (t!40776 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136195 res!827366) b!1240062))

(assert (= (and b!1240062 (not res!827367)) b!1240063))

(assert (=> d!136195 m!1143389))

(declare-fun m!1143403 () Bool)

(assert (=> d!136195 m!1143403))

(declare-fun m!1143405 () Bool)

(assert (=> b!1240063 m!1143405))

(assert (=> b!1240026 d!136195))

(declare-fun d!136197 () Bool)

(declare-fun lt!561876 () Bool)

(assert (=> d!136197 (= lt!561876 (set.member (select (arr!38540 a!3835) from!3213) (content!599 acc!846)))))

(declare-fun e!702819 () Bool)

(assert (=> d!136197 (= lt!561876 e!702819)))

(declare-fun res!827368 () Bool)

(assert (=> d!136197 (=> (not res!827368) (not e!702819))))

(assert (=> d!136197 (= res!827368 (is-Cons!27309 acc!846))))

(assert (=> d!136197 (= (contains!7375 acc!846 (select (arr!38540 a!3835) from!3213)) lt!561876)))

(declare-fun b!1240068 () Bool)

(declare-fun e!702818 () Bool)

(assert (=> b!1240068 (= e!702819 e!702818)))

(declare-fun res!827369 () Bool)

(assert (=> b!1240068 (=> res!827369 e!702818)))

(assert (=> b!1240068 (= res!827369 (= (h!28518 acc!846) (select (arr!38540 a!3835) from!3213)))))

(declare-fun b!1240069 () Bool)

(assert (=> b!1240069 (= e!702818 (contains!7375 (t!40776 acc!846) (select (arr!38540 a!3835) from!3213)))))

(assert (= (and d!136197 res!827368) b!1240068))

(assert (= (and b!1240068 (not res!827369)) b!1240069))

(assert (=> d!136197 m!1143327))

(assert (=> d!136197 m!1143305))

(declare-fun m!1143407 () Bool)

(assert (=> d!136197 m!1143407))

(assert (=> b!1240069 m!1143305))

(declare-fun m!1143409 () Bool)

(assert (=> b!1240069 m!1143409))

(assert (=> b!1239966 d!136197))

(declare-fun d!136199 () Bool)

(declare-fun lt!561877 () Bool)

(assert (=> d!136199 (= lt!561877 (set.member k!2925 (content!599 (t!40776 acc!846))))))

(declare-fun e!702821 () Bool)

(assert (=> d!136199 (= lt!561877 e!702821)))

(declare-fun res!827370 () Bool)

(assert (=> d!136199 (=> (not res!827370) (not e!702821))))

(assert (=> d!136199 (= res!827370 (is-Cons!27309 (t!40776 acc!846)))))

(assert (=> d!136199 (= (contains!7375 (t!40776 acc!846) k!2925) lt!561877)))

(declare-fun b!1240070 () Bool)

(declare-fun e!702820 () Bool)

(assert (=> b!1240070 (= e!702821 e!702820)))

(declare-fun res!827371 () Bool)

(assert (=> b!1240070 (=> res!827371 e!702820)))

(assert (=> b!1240070 (= res!827371 (= (h!28518 (t!40776 acc!846)) k!2925))))

(declare-fun b!1240071 () Bool)

(assert (=> b!1240071 (= e!702820 (contains!7375 (t!40776 (t!40776 acc!846)) k!2925))))

(assert (= (and d!136199 res!827370) b!1240070))

(assert (= (and b!1240070 (not res!827371)) b!1240071))

(assert (=> d!136199 m!1143389))

(declare-fun m!1143411 () Bool)

(assert (=> d!136199 m!1143411))

(declare-fun m!1143413 () Bool)

(assert (=> b!1240071 m!1143413))

(assert (=> b!1239983 d!136199))

(declare-fun d!136201 () Bool)

(declare-fun lt!561878 () Bool)

(assert (=> d!136201 (= lt!561878 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!599 (t!40776 acc!846))))))

(declare-fun e!702823 () Bool)

(assert (=> d!136201 (= lt!561878 e!702823)))

(declare-fun res!827372 () Bool)

(assert (=> d!136201 (=> (not res!827372) (not e!702823))))

(assert (=> d!136201 (= res!827372 (is-Cons!27309 (t!40776 acc!846)))))

(assert (=> d!136201 (= (contains!7375 (t!40776 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000) lt!561878)))

(declare-fun b!1240072 () Bool)

(declare-fun e!702822 () Bool)

(assert (=> b!1240072 (= e!702823 e!702822)))

(declare-fun res!827373 () Bool)

(assert (=> b!1240072 (=> res!827373 e!702822)))

(assert (=> b!1240072 (= res!827373 (= (h!28518 (t!40776 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1240073 () Bool)

(assert (=> b!1240073 (= e!702822 (contains!7375 (t!40776 (t!40776 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136201 res!827372) b!1240072))

(assert (= (and b!1240072 (not res!827373)) b!1240073))

(assert (=> d!136201 m!1143389))

(declare-fun m!1143417 () Bool)

(assert (=> d!136201 m!1143417))

(declare-fun m!1143419 () Bool)

(assert (=> b!1240073 m!1143419))

(assert (=> b!1239987 d!136201))

(declare-fun d!136205 () Bool)

(assert (=> d!136205 (= (validKeyInArray!0 (select (arr!38540 a!3835) from!3213)) (and (not (= (select (arr!38540 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38540 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239965 d!136205))

(assert (=> d!136159 d!136189))

(declare-fun d!136209 () Bool)

(declare-fun res!827379 () Bool)

(declare-fun e!702831 () Bool)

(assert (=> d!136209 (=> res!827379 e!702831)))

(assert (=> d!136209 (= res!827379 (= (select (arr!38540 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) k!2925))))

(assert (=> d!136209 (= (arrayContainsKey!0 a!3835 k!2925 (bvadd from!3213 #b00000000000000000000000000000001)) e!702831)))

(declare-fun b!1240083 () Bool)

(declare-fun e!702832 () Bool)

(assert (=> b!1240083 (= e!702831 e!702832)))

(declare-fun res!827380 () Bool)

(assert (=> b!1240083 (=> (not res!827380) (not e!702832))))

(assert (=> b!1240083 (= res!827380 (bvslt (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!39076 a!3835)))))

(declare-fun b!1240084 () Bool)

(assert (=> b!1240084 (= e!702832 (arrayContainsKey!0 a!3835 k!2925 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!136209 (not res!827379)) b!1240083))

(assert (= (and b!1240083 res!827380) b!1240084))

(declare-fun m!1143433 () Bool)

(assert (=> d!136209 m!1143433))

(declare-fun m!1143435 () Bool)

(assert (=> b!1240084 m!1143435))

(assert (=> b!1240024 d!136209))

(assert (=> b!1239963 d!136205))

(declare-fun call!61128 () Bool)

(declare-fun c!121212 () Bool)

(declare-fun bm!61125 () Bool)

(assert (=> bm!61125 (= call!61128 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121212 (Cons!27309 (select (arr!38540 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) (ite c!121198 (Cons!27309 (select (arr!38540 a!3835) from!3213) acc!846) acc!846)) (ite c!121198 (Cons!27309 (select (arr!38540 a!3835) from!3213) acc!846) acc!846))))))

(declare-fun b!1240087 () Bool)

(declare-fun e!702836 () Bool)

(declare-fun e!702835 () Bool)

(assert (=> b!1240087 (= e!702836 e!702835)))

(assert (=> b!1240087 (= c!121212 (validKeyInArray!0 (select (arr!38540 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1240088 () Bool)

(assert (=> b!1240088 (= e!702835 call!61128)))

(declare-fun b!1240089 () Bool)

(declare-fun e!702838 () Bool)

(assert (=> b!1240089 (= e!702838 e!702836)))

(declare-fun res!827384 () Bool)

(assert (=> b!1240089 (=> (not res!827384) (not e!702836))))

(declare-fun e!702837 () Bool)

(assert (=> b!1240089 (= res!827384 (not e!702837))))

(declare-fun res!827385 () Bool)

(assert (=> b!1240089 (=> (not res!827385) (not e!702837))))

(assert (=> b!1240089 (= res!827385 (validKeyInArray!0 (select (arr!38540 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1240090 () Bool)

(assert (=> b!1240090 (= e!702837 (contains!7375 (ite c!121198 (Cons!27309 (select (arr!38540 a!3835) from!3213) acc!846) acc!846) (select (arr!38540 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun d!136213 () Bool)

(declare-fun res!827383 () Bool)

(assert (=> d!136213 (=> res!827383 e!702838)))

(assert (=> d!136213 (= res!827383 (bvsge (bvadd from!3213 #b00000000000000000000000000000001) (size!39076 a!3835)))))

(assert (=> d!136213 (= (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121198 (Cons!27309 (select (arr!38540 a!3835) from!3213) acc!846) acc!846)) e!702838)))

(declare-fun b!1240091 () Bool)

(assert (=> b!1240091 (= e!702835 call!61128)))

(assert (= (and d!136213 (not res!827383)) b!1240089))

(assert (= (and b!1240089 res!827385) b!1240090))

(assert (= (and b!1240089 res!827384) b!1240087))

(assert (= (and b!1240087 c!121212) b!1240091))

(assert (= (and b!1240087 (not c!121212)) b!1240088))

(assert (= (or b!1240091 b!1240088) bm!61125))

(assert (=> bm!61125 m!1143433))

(declare-fun m!1143447 () Bool)

(assert (=> bm!61125 m!1143447))

(assert (=> b!1240087 m!1143433))

(assert (=> b!1240087 m!1143433))

(declare-fun m!1143451 () Bool)

(assert (=> b!1240087 m!1143451))

(assert (=> b!1240089 m!1143433))

(assert (=> b!1240089 m!1143433))

(assert (=> b!1240089 m!1143451))

(assert (=> b!1240090 m!1143433))

(assert (=> b!1240090 m!1143433))

(declare-fun m!1143453 () Bool)

(assert (=> b!1240090 m!1143453))

(assert (=> bm!61117 d!136213))

(assert (=> d!136151 d!136189))

(push 1)

(assert (not d!136201))

(assert (not b!1240050))

(assert (not b!1240051))

(assert (not b!1240053))

(assert (not b!1240063))

(assert (not b!1240087))

(assert (not b!1240071))

(assert (not b!1240061))

(assert (not b!1240089))

(assert (not b!1240090))

(assert (not d!136185))

(assert (not d!136195))

(assert (not d!136199))

(assert (not b!1240069))

(assert (not b!1240084))

(assert (not bm!61125))

(assert (not b!1240073))

(assert (not d!136197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

