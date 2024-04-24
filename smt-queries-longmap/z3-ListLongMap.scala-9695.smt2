; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114730 () Bool)

(assert start!114730)

(declare-fun res!904118 () Bool)

(declare-fun e!772030 () Bool)

(assert (=> start!114730 (=> (not res!904118) (not e!772030))))

(declare-datatypes ((array!92617 0))(
  ( (array!92618 (arr!44746 (Array (_ BitVec 32) (_ BitVec 64))) (size!45297 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92617)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114730 (= res!904118 (and (bvslt (size!45297 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45297 a!3742))))))

(assert (=> start!114730 e!772030))

(assert (=> start!114730 true))

(declare-fun array_inv!34027 (array!92617) Bool)

(assert (=> start!114730 (array_inv!34027 a!3742)))

(declare-fun b!1360349 () Bool)

(declare-fun res!904114 () Bool)

(assert (=> b!1360349 (=> (not res!904114) (not e!772030))))

(declare-datatypes ((List!31774 0))(
  ( (Nil!31771) (Cons!31770 (h!32988 (_ BitVec 64)) (t!46436 List!31774)) )
))
(declare-fun arrayNoDuplicates!0 (array!92617 (_ BitVec 32) List!31774) Bool)

(assert (=> b!1360349 (= res!904114 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31771))))

(declare-fun b!1360350 () Bool)

(declare-datatypes ((Unit!44678 0))(
  ( (Unit!44679) )
))
(declare-fun e!772031 () Unit!44678)

(declare-fun lt!599982 () Unit!44678)

(assert (=> b!1360350 (= e!772031 lt!599982)))

(declare-fun lt!599980 () Unit!44678)

(declare-fun acc!759 () List!31774)

(declare-fun lemmaListSubSeqRefl!0 (List!31774) Unit!44678)

(assert (=> b!1360350 (= lt!599980 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!845 (List!31774 List!31774) Bool)

(assert (=> b!1360350 (subseq!845 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92617 List!31774 List!31774 (_ BitVec 32)) Unit!44678)

(declare-fun $colon$colon!847 (List!31774 (_ BitVec 64)) List!31774)

(assert (=> b!1360350 (= lt!599982 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!847 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360350 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360351 () Bool)

(declare-fun res!904113 () Bool)

(assert (=> b!1360351 (=> (not res!904113) (not e!772030))))

(declare-fun noDuplicate!2317 (List!31774) Bool)

(assert (=> b!1360351 (= res!904113 (noDuplicate!2317 acc!759))))

(declare-fun b!1360352 () Bool)

(declare-fun res!904112 () Bool)

(assert (=> b!1360352 (=> (not res!904112) (not e!772030))))

(assert (=> b!1360352 (= res!904112 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45297 a!3742)))))

(declare-fun b!1360353 () Bool)

(declare-fun res!904119 () Bool)

(assert (=> b!1360353 (=> (not res!904119) (not e!772030))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360353 (= res!904119 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360354 () Bool)

(declare-fun res!904110 () Bool)

(assert (=> b!1360354 (=> (not res!904110) (not e!772030))))

(declare-fun contains!9486 (List!31774 (_ BitVec 64)) Bool)

(assert (=> b!1360354 (= res!904110 (not (contains!9486 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360355 () Bool)

(declare-fun Unit!44680 () Unit!44678)

(assert (=> b!1360355 (= e!772031 Unit!44680)))

(declare-fun e!772033 () Bool)

(declare-fun b!1360356 () Bool)

(assert (=> b!1360356 (= e!772033 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1360357 () Bool)

(declare-fun res!904116 () Bool)

(assert (=> b!1360357 (=> (not res!904116) (not e!772030))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360357 (= res!904116 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45297 a!3742))))))

(declare-fun b!1360358 () Bool)

(declare-fun res!904111 () Bool)

(assert (=> b!1360358 (=> (not res!904111) (not e!772030))))

(assert (=> b!1360358 (= res!904111 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360359 () Bool)

(assert (=> b!1360359 (= e!772030 e!772033)))

(declare-fun res!904117 () Bool)

(assert (=> b!1360359 (=> (not res!904117) (not e!772033))))

(assert (=> b!1360359 (= res!904117 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599981 () Unit!44678)

(assert (=> b!1360359 (= lt!599981 e!772031)))

(declare-fun c!127567 () Bool)

(assert (=> b!1360359 (= c!127567 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1360360 () Bool)

(declare-fun res!904115 () Bool)

(assert (=> b!1360360 (=> (not res!904115) (not e!772030))))

(assert (=> b!1360360 (= res!904115 (not (contains!9486 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114730 res!904118) b!1360351))

(assert (= (and b!1360351 res!904113) b!1360360))

(assert (= (and b!1360360 res!904115) b!1360354))

(assert (= (and b!1360354 res!904110) b!1360349))

(assert (= (and b!1360349 res!904114) b!1360358))

(assert (= (and b!1360358 res!904111) b!1360357))

(assert (= (and b!1360357 res!904116) b!1360353))

(assert (= (and b!1360353 res!904119) b!1360352))

(assert (= (and b!1360352 res!904112) b!1360359))

(assert (= (and b!1360359 c!127567) b!1360350))

(assert (= (and b!1360359 (not c!127567)) b!1360355))

(assert (= (and b!1360359 res!904117) b!1360356))

(declare-fun m!1246135 () Bool)

(assert (=> b!1360358 m!1246135))

(declare-fun m!1246137 () Bool)

(assert (=> b!1360349 m!1246137))

(declare-fun m!1246139 () Bool)

(assert (=> b!1360350 m!1246139))

(declare-fun m!1246141 () Bool)

(assert (=> b!1360350 m!1246141))

(declare-fun m!1246143 () Bool)

(assert (=> b!1360350 m!1246143))

(declare-fun m!1246145 () Bool)

(assert (=> b!1360350 m!1246145))

(declare-fun m!1246147 () Bool)

(assert (=> b!1360350 m!1246147))

(assert (=> b!1360350 m!1246141))

(assert (=> b!1360350 m!1246143))

(declare-fun m!1246149 () Bool)

(assert (=> b!1360350 m!1246149))

(declare-fun m!1246151 () Bool)

(assert (=> start!114730 m!1246151))

(assert (=> b!1360359 m!1246141))

(assert (=> b!1360359 m!1246141))

(declare-fun m!1246153 () Bool)

(assert (=> b!1360359 m!1246153))

(declare-fun m!1246155 () Bool)

(assert (=> b!1360351 m!1246155))

(declare-fun m!1246157 () Bool)

(assert (=> b!1360354 m!1246157))

(declare-fun m!1246159 () Bool)

(assert (=> b!1360360 m!1246159))

(assert (=> b!1360356 m!1246147))

(declare-fun m!1246161 () Bool)

(assert (=> b!1360353 m!1246161))

(check-sat (not b!1360351) (not b!1360360) (not b!1360359) (not b!1360358) (not b!1360350) (not start!114730) (not b!1360353) (not b!1360354) (not b!1360356) (not b!1360349))
(check-sat)
(get-model)

(declare-fun b!1360443 () Bool)

(declare-fun e!772069 () Bool)

(declare-fun e!772068 () Bool)

(assert (=> b!1360443 (= e!772069 e!772068)))

(declare-fun c!127576 () Bool)

(assert (=> b!1360443 (= c!127576 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1360444 () Bool)

(declare-fun call!65359 () Bool)

(assert (=> b!1360444 (= e!772068 call!65359)))

(declare-fun bm!65356 () Bool)

(assert (=> bm!65356 (= call!65359 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127576 (Cons!31770 (select (arr!44746 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1360445 () Bool)

(declare-fun e!772066 () Bool)

(assert (=> b!1360445 (= e!772066 e!772069)))

(declare-fun res!904187 () Bool)

(assert (=> b!1360445 (=> (not res!904187) (not e!772069))))

(declare-fun e!772067 () Bool)

(assert (=> b!1360445 (= res!904187 (not e!772067))))

(declare-fun res!904188 () Bool)

(assert (=> b!1360445 (=> (not res!904188) (not e!772067))))

(assert (=> b!1360445 (= res!904188 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1360446 () Bool)

(assert (=> b!1360446 (= e!772068 call!65359)))

(declare-fun d!145901 () Bool)

(declare-fun res!904186 () Bool)

(assert (=> d!145901 (=> res!904186 e!772066)))

(assert (=> d!145901 (= res!904186 (bvsge from!3120 (size!45297 a!3742)))))

(assert (=> d!145901 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772066)))

(declare-fun b!1360447 () Bool)

(assert (=> b!1360447 (= e!772067 (contains!9486 acc!759 (select (arr!44746 a!3742) from!3120)))))

(assert (= (and d!145901 (not res!904186)) b!1360445))

(assert (= (and b!1360445 res!904188) b!1360447))

(assert (= (and b!1360445 res!904187) b!1360443))

(assert (= (and b!1360443 c!127576) b!1360444))

(assert (= (and b!1360443 (not c!127576)) b!1360446))

(assert (= (or b!1360444 b!1360446) bm!65356))

(assert (=> b!1360443 m!1246141))

(assert (=> b!1360443 m!1246141))

(assert (=> b!1360443 m!1246153))

(assert (=> bm!65356 m!1246141))

(declare-fun m!1246219 () Bool)

(assert (=> bm!65356 m!1246219))

(assert (=> b!1360445 m!1246141))

(assert (=> b!1360445 m!1246141))

(assert (=> b!1360445 m!1246153))

(assert (=> b!1360447 m!1246141))

(assert (=> b!1360447 m!1246141))

(declare-fun m!1246221 () Bool)

(assert (=> b!1360447 m!1246221))

(assert (=> b!1360358 d!145901))

(declare-fun d!145903 () Bool)

(assert (=> d!145903 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360353 d!145903))

(declare-fun d!145905 () Bool)

(assert (=> d!145905 (= (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)) (and (not (= (select (arr!44746 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44746 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360359 d!145905))

(declare-fun d!145907 () Bool)

(declare-fun lt!600003 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!685 (List!31774) (InoxSet (_ BitVec 64)))

(assert (=> d!145907 (= lt!600003 (select (content!685 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772074 () Bool)

(assert (=> d!145907 (= lt!600003 e!772074)))

(declare-fun res!904193 () Bool)

(assert (=> d!145907 (=> (not res!904193) (not e!772074))))

(get-info :version)

(assert (=> d!145907 (= res!904193 ((_ is Cons!31770) acc!759))))

(assert (=> d!145907 (= (contains!9486 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600003)))

(declare-fun b!1360452 () Bool)

(declare-fun e!772075 () Bool)

(assert (=> b!1360452 (= e!772074 e!772075)))

(declare-fun res!904194 () Bool)

(assert (=> b!1360452 (=> res!904194 e!772075)))

(assert (=> b!1360452 (= res!904194 (= (h!32988 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360453 () Bool)

(assert (=> b!1360453 (= e!772075 (contains!9486 (t!46436 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145907 res!904193) b!1360452))

(assert (= (and b!1360452 (not res!904194)) b!1360453))

(declare-fun m!1246223 () Bool)

(assert (=> d!145907 m!1246223))

(declare-fun m!1246225 () Bool)

(assert (=> d!145907 m!1246225))

(declare-fun m!1246227 () Bool)

(assert (=> b!1360453 m!1246227))

(assert (=> b!1360354 d!145907))

(declare-fun b!1360454 () Bool)

(declare-fun e!772079 () Bool)

(declare-fun e!772078 () Bool)

(assert (=> b!1360454 (= e!772079 e!772078)))

(declare-fun c!127577 () Bool)

(assert (=> b!1360454 (= c!127577 (validKeyInArray!0 (select (arr!44746 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360455 () Bool)

(declare-fun call!65360 () Bool)

(assert (=> b!1360455 (= e!772078 call!65360)))

(declare-fun bm!65357 () Bool)

(assert (=> bm!65357 (= call!65360 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127577 (Cons!31770 (select (arr!44746 a!3742) #b00000000000000000000000000000000) Nil!31771) Nil!31771)))))

(declare-fun b!1360456 () Bool)

(declare-fun e!772076 () Bool)

(assert (=> b!1360456 (= e!772076 e!772079)))

(declare-fun res!904196 () Bool)

(assert (=> b!1360456 (=> (not res!904196) (not e!772079))))

(declare-fun e!772077 () Bool)

(assert (=> b!1360456 (= res!904196 (not e!772077))))

(declare-fun res!904197 () Bool)

(assert (=> b!1360456 (=> (not res!904197) (not e!772077))))

(assert (=> b!1360456 (= res!904197 (validKeyInArray!0 (select (arr!44746 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360457 () Bool)

(assert (=> b!1360457 (= e!772078 call!65360)))

(declare-fun d!145915 () Bool)

(declare-fun res!904195 () Bool)

(assert (=> d!145915 (=> res!904195 e!772076)))

(assert (=> d!145915 (= res!904195 (bvsge #b00000000000000000000000000000000 (size!45297 a!3742)))))

(assert (=> d!145915 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31771) e!772076)))

(declare-fun b!1360458 () Bool)

(assert (=> b!1360458 (= e!772077 (contains!9486 Nil!31771 (select (arr!44746 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145915 (not res!904195)) b!1360456))

(assert (= (and b!1360456 res!904197) b!1360458))

(assert (= (and b!1360456 res!904196) b!1360454))

(assert (= (and b!1360454 c!127577) b!1360455))

(assert (= (and b!1360454 (not c!127577)) b!1360457))

(assert (= (or b!1360455 b!1360457) bm!65357))

(declare-fun m!1246229 () Bool)

(assert (=> b!1360454 m!1246229))

(assert (=> b!1360454 m!1246229))

(declare-fun m!1246231 () Bool)

(assert (=> b!1360454 m!1246231))

(assert (=> bm!65357 m!1246229))

(declare-fun m!1246233 () Bool)

(assert (=> bm!65357 m!1246233))

(assert (=> b!1360456 m!1246229))

(assert (=> b!1360456 m!1246229))

(assert (=> b!1360456 m!1246231))

(assert (=> b!1360458 m!1246229))

(assert (=> b!1360458 m!1246229))

(declare-fun m!1246235 () Bool)

(assert (=> b!1360458 m!1246235))

(assert (=> b!1360349 d!145915))

(declare-fun d!145917 () Bool)

(declare-fun lt!600006 () Bool)

(assert (=> d!145917 (= lt!600006 (select (content!685 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772080 () Bool)

(assert (=> d!145917 (= lt!600006 e!772080)))

(declare-fun res!904198 () Bool)

(assert (=> d!145917 (=> (not res!904198) (not e!772080))))

(assert (=> d!145917 (= res!904198 ((_ is Cons!31770) acc!759))))

(assert (=> d!145917 (= (contains!9486 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600006)))

(declare-fun b!1360459 () Bool)

(declare-fun e!772081 () Bool)

(assert (=> b!1360459 (= e!772080 e!772081)))

(declare-fun res!904199 () Bool)

(assert (=> b!1360459 (=> res!904199 e!772081)))

(assert (=> b!1360459 (= res!904199 (= (h!32988 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360460 () Bool)

(assert (=> b!1360460 (= e!772081 (contains!9486 (t!46436 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145917 res!904198) b!1360459))

(assert (= (and b!1360459 (not res!904199)) b!1360460))

(assert (=> d!145917 m!1246223))

(declare-fun m!1246237 () Bool)

(assert (=> d!145917 m!1246237))

(declare-fun m!1246239 () Bool)

(assert (=> b!1360460 m!1246239))

(assert (=> b!1360360 d!145917))

(declare-fun d!145919 () Bool)

(assert (=> d!145919 (= (array_inv!34027 a!3742) (bvsge (size!45297 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114730 d!145919))

(declare-fun d!145923 () Bool)

(assert (=> d!145923 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600010 () Unit!44678)

(declare-fun choose!80 (array!92617 List!31774 List!31774 (_ BitVec 32)) Unit!44678)

(assert (=> d!145923 (= lt!600010 (choose!80 a!3742 ($colon$colon!847 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145923 (bvslt (size!45297 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145923 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!847 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600010)))

(declare-fun bs!38990 () Bool)

(assert (= bs!38990 d!145923))

(assert (=> bs!38990 m!1246147))

(assert (=> bs!38990 m!1246143))

(declare-fun m!1246243 () Bool)

(assert (=> bs!38990 m!1246243))

(assert (=> b!1360350 d!145923))

(declare-fun b!1360500 () Bool)

(declare-fun e!772121 () Bool)

(declare-fun e!772120 () Bool)

(assert (=> b!1360500 (= e!772121 e!772120)))

(declare-fun res!904233 () Bool)

(assert (=> b!1360500 (=> (not res!904233) (not e!772120))))

(assert (=> b!1360500 (= res!904233 ((_ is Cons!31770) acc!759))))

(declare-fun b!1360501 () Bool)

(declare-fun e!772119 () Bool)

(assert (=> b!1360501 (= e!772120 e!772119)))

(declare-fun res!904235 () Bool)

(assert (=> b!1360501 (=> res!904235 e!772119)))

(declare-fun e!772118 () Bool)

(assert (=> b!1360501 (= res!904235 e!772118)))

(declare-fun res!904234 () Bool)

(assert (=> b!1360501 (=> (not res!904234) (not e!772118))))

(assert (=> b!1360501 (= res!904234 (= (h!32988 acc!759) (h!32988 acc!759)))))

(declare-fun d!145925 () Bool)

(declare-fun res!904236 () Bool)

(assert (=> d!145925 (=> res!904236 e!772121)))

(assert (=> d!145925 (= res!904236 ((_ is Nil!31771) acc!759))))

(assert (=> d!145925 (= (subseq!845 acc!759 acc!759) e!772121)))

(declare-fun b!1360502 () Bool)

(assert (=> b!1360502 (= e!772118 (subseq!845 (t!46436 acc!759) (t!46436 acc!759)))))

(declare-fun b!1360503 () Bool)

(assert (=> b!1360503 (= e!772119 (subseq!845 acc!759 (t!46436 acc!759)))))

(assert (= (and d!145925 (not res!904236)) b!1360500))

(assert (= (and b!1360500 res!904233) b!1360501))

(assert (= (and b!1360501 res!904234) b!1360502))

(assert (= (and b!1360501 (not res!904235)) b!1360503))

(declare-fun m!1246257 () Bool)

(assert (=> b!1360502 m!1246257))

(declare-fun m!1246259 () Bool)

(assert (=> b!1360503 m!1246259))

(assert (=> b!1360350 d!145925))

(declare-fun b!1360504 () Bool)

(declare-fun e!772125 () Bool)

(declare-fun e!772124 () Bool)

(assert (=> b!1360504 (= e!772125 e!772124)))

(declare-fun c!127581 () Bool)

(assert (=> b!1360504 (= c!127581 (validKeyInArray!0 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360505 () Bool)

(declare-fun call!65364 () Bool)

(assert (=> b!1360505 (= e!772124 call!65364)))

(declare-fun bm!65361 () Bool)

(assert (=> bm!65361 (= call!65364 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127581 (Cons!31770 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1360506 () Bool)

(declare-fun e!772122 () Bool)

(assert (=> b!1360506 (= e!772122 e!772125)))

(declare-fun res!904238 () Bool)

(assert (=> b!1360506 (=> (not res!904238) (not e!772125))))

(declare-fun e!772123 () Bool)

(assert (=> b!1360506 (= res!904238 (not e!772123))))

(declare-fun res!904239 () Bool)

(assert (=> b!1360506 (=> (not res!904239) (not e!772123))))

(assert (=> b!1360506 (= res!904239 (validKeyInArray!0 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360507 () Bool)

(assert (=> b!1360507 (= e!772124 call!65364)))

(declare-fun d!145933 () Bool)

(declare-fun res!904237 () Bool)

(assert (=> d!145933 (=> res!904237 e!772122)))

(assert (=> d!145933 (= res!904237 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45297 a!3742)))))

(assert (=> d!145933 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772122)))

(declare-fun b!1360508 () Bool)

(assert (=> b!1360508 (= e!772123 (contains!9486 acc!759 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145933 (not res!904237)) b!1360506))

(assert (= (and b!1360506 res!904239) b!1360508))

(assert (= (and b!1360506 res!904238) b!1360504))

(assert (= (and b!1360504 c!127581) b!1360505))

(assert (= (and b!1360504 (not c!127581)) b!1360507))

(assert (= (or b!1360505 b!1360507) bm!65361))

(declare-fun m!1246265 () Bool)

(assert (=> b!1360504 m!1246265))

(assert (=> b!1360504 m!1246265))

(declare-fun m!1246267 () Bool)

(assert (=> b!1360504 m!1246267))

(assert (=> bm!65361 m!1246265))

(declare-fun m!1246269 () Bool)

(assert (=> bm!65361 m!1246269))

(assert (=> b!1360506 m!1246265))

(assert (=> b!1360506 m!1246265))

(assert (=> b!1360506 m!1246267))

(assert (=> b!1360508 m!1246265))

(assert (=> b!1360508 m!1246265))

(declare-fun m!1246271 () Bool)

(assert (=> b!1360508 m!1246271))

(assert (=> b!1360350 d!145933))

(declare-fun d!145937 () Bool)

(assert (=> d!145937 (= ($colon$colon!847 acc!759 (select (arr!44746 a!3742) from!3120)) (Cons!31770 (select (arr!44746 a!3742) from!3120) acc!759))))

(assert (=> b!1360350 d!145937))

(declare-fun d!145941 () Bool)

(assert (=> d!145941 (subseq!845 acc!759 acc!759)))

(declare-fun lt!600013 () Unit!44678)

(declare-fun choose!36 (List!31774) Unit!44678)

(assert (=> d!145941 (= lt!600013 (choose!36 acc!759))))

(assert (=> d!145941 (= (lemmaListSubSeqRefl!0 acc!759) lt!600013)))

(declare-fun bs!38991 () Bool)

(assert (= bs!38991 d!145941))

(assert (=> bs!38991 m!1246149))

(declare-fun m!1246273 () Bool)

(assert (=> bs!38991 m!1246273))

(assert (=> b!1360350 d!145941))

(assert (=> b!1360356 d!145933))

(declare-fun d!145943 () Bool)

(declare-fun res!904255 () Bool)

(declare-fun e!772144 () Bool)

(assert (=> d!145943 (=> res!904255 e!772144)))

(assert (=> d!145943 (= res!904255 ((_ is Nil!31771) acc!759))))

(assert (=> d!145943 (= (noDuplicate!2317 acc!759) e!772144)))

(declare-fun b!1360530 () Bool)

(declare-fun e!772145 () Bool)

(assert (=> b!1360530 (= e!772144 e!772145)))

(declare-fun res!904256 () Bool)

(assert (=> b!1360530 (=> (not res!904256) (not e!772145))))

(assert (=> b!1360530 (= res!904256 (not (contains!9486 (t!46436 acc!759) (h!32988 acc!759))))))

(declare-fun b!1360531 () Bool)

(assert (=> b!1360531 (= e!772145 (noDuplicate!2317 (t!46436 acc!759)))))

(assert (= (and d!145943 (not res!904255)) b!1360530))

(assert (= (and b!1360530 res!904256) b!1360531))

(declare-fun m!1246285 () Bool)

(assert (=> b!1360530 m!1246285))

(declare-fun m!1246287 () Bool)

(assert (=> b!1360531 m!1246287))

(assert (=> b!1360351 d!145943))

(check-sat (not bm!65357) (not b!1360458) (not b!1360456) (not b!1360531) (not d!145907) (not b!1360460) (not d!145941) (not b!1360443) (not d!145917) (not b!1360504) (not b!1360454) (not bm!65361) (not bm!65356) (not d!145923) (not b!1360530) (not b!1360447) (not b!1360445) (not b!1360502) (not b!1360506) (not b!1360503) (not b!1360453) (not b!1360508))
(check-sat)
