; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114296 () Bool)

(assert start!114296)

(declare-fun b!1357447 () Bool)

(declare-fun res!902188 () Bool)

(declare-fun e!770432 () Bool)

(assert (=> b!1357447 (=> (not res!902188) (not e!770432))))

(declare-datatypes ((List!31704 0))(
  ( (Nil!31701) (Cons!31700 (h!32909 (_ BitVec 64)) (t!46365 List!31704)) )
))
(declare-fun acc!759 () List!31704)

(declare-fun contains!9413 (List!31704 (_ BitVec 64)) Bool)

(assert (=> b!1357447 (= res!902188 (not (contains!9413 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357448 () Bool)

(declare-fun e!770433 () Bool)

(declare-fun lt!599160 () List!31704)

(assert (=> b!1357448 (= e!770433 (not (contains!9413 lt!599160 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357449 () Bool)

(declare-fun res!902191 () Bool)

(assert (=> b!1357449 (=> (not res!902191) (not e!770432))))

(declare-datatypes ((array!92433 0))(
  ( (array!92434 (arr!44663 (Array (_ BitVec 32) (_ BitVec 64))) (size!45213 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92433)

(declare-fun arrayNoDuplicates!0 (array!92433 (_ BitVec 32) List!31704) Bool)

(assert (=> b!1357449 (= res!902191 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31701))))

(declare-fun b!1357450 () Bool)

(declare-fun res!902180 () Bool)

(assert (=> b!1357450 (=> (not res!902180) (not e!770432))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357450 (= res!902180 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357451 () Bool)

(declare-fun res!902187 () Bool)

(assert (=> b!1357451 (=> (not res!902187) (not e!770432))))

(declare-fun noDuplicate!2270 (List!31704) Bool)

(assert (=> b!1357451 (= res!902187 (noDuplicate!2270 acc!759))))

(declare-fun b!1357452 () Bool)

(declare-fun res!902190 () Bool)

(assert (=> b!1357452 (=> (not res!902190) (not e!770432))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357452 (= res!902190 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45213 a!3742))))))

(declare-fun b!1357453 () Bool)

(declare-fun res!902179 () Bool)

(assert (=> b!1357453 (=> (not res!902179) (not e!770432))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357453 (= res!902179 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!902186 () Bool)

(assert (=> start!114296 (=> (not res!902186) (not e!770432))))

(assert (=> start!114296 (= res!902186 (and (bvslt (size!45213 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45213 a!3742))))))

(assert (=> start!114296 e!770432))

(assert (=> start!114296 true))

(declare-fun array_inv!33691 (array!92433) Bool)

(assert (=> start!114296 (array_inv!33691 a!3742)))

(declare-fun b!1357454 () Bool)

(declare-fun res!902189 () Bool)

(assert (=> b!1357454 (=> (not res!902189) (not e!770432))))

(assert (=> b!1357454 (= res!902189 (not (contains!9413 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357455 () Bool)

(declare-fun res!902185 () Bool)

(assert (=> b!1357455 (=> (not res!902185) (not e!770432))))

(assert (=> b!1357455 (= res!902185 (validKeyInArray!0 (select (arr!44663 a!3742) from!3120)))))

(declare-fun b!1357456 () Bool)

(declare-fun res!902184 () Bool)

(assert (=> b!1357456 (=> (not res!902184) (not e!770432))))

(assert (=> b!1357456 (= res!902184 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45213 a!3742)))))

(declare-fun b!1357457 () Bool)

(declare-fun e!770431 () Bool)

(assert (=> b!1357457 (= e!770431 e!770433)))

(declare-fun res!902181 () Bool)

(assert (=> b!1357457 (=> (not res!902181) (not e!770433))))

(assert (=> b!1357457 (= res!902181 (not (contains!9413 lt!599160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357458 () Bool)

(assert (=> b!1357458 (= e!770432 (not e!770431))))

(declare-fun res!902183 () Bool)

(assert (=> b!1357458 (=> res!902183 e!770431)))

(assert (=> b!1357458 (= res!902183 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!818 (List!31704 (_ BitVec 64)) List!31704)

(assert (=> b!1357458 (= lt!599160 ($colon$colon!818 acc!759 (select (arr!44663 a!3742) from!3120)))))

(declare-fun subseq!815 (List!31704 List!31704) Bool)

(assert (=> b!1357458 (subseq!815 acc!759 acc!759)))

(declare-datatypes ((Unit!44661 0))(
  ( (Unit!44662) )
))
(declare-fun lt!599161 () Unit!44661)

(declare-fun lemmaListSubSeqRefl!0 (List!31704) Unit!44661)

(assert (=> b!1357458 (= lt!599161 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357459 () Bool)

(declare-fun res!902182 () Bool)

(assert (=> b!1357459 (=> res!902182 e!770431)))

(assert (=> b!1357459 (= res!902182 (not (noDuplicate!2270 lt!599160)))))

(assert (= (and start!114296 res!902186) b!1357451))

(assert (= (and b!1357451 res!902187) b!1357454))

(assert (= (and b!1357454 res!902189) b!1357447))

(assert (= (and b!1357447 res!902188) b!1357449))

(assert (= (and b!1357449 res!902191) b!1357450))

(assert (= (and b!1357450 res!902180) b!1357452))

(assert (= (and b!1357452 res!902190) b!1357453))

(assert (= (and b!1357453 res!902179) b!1357456))

(assert (= (and b!1357456 res!902184) b!1357455))

(assert (= (and b!1357455 res!902185) b!1357458))

(assert (= (and b!1357458 (not res!902183)) b!1357459))

(assert (= (and b!1357459 (not res!902182)) b!1357457))

(assert (= (and b!1357457 res!902181) b!1357448))

(declare-fun m!1243183 () Bool)

(assert (=> b!1357458 m!1243183))

(assert (=> b!1357458 m!1243183))

(declare-fun m!1243185 () Bool)

(assert (=> b!1357458 m!1243185))

(declare-fun m!1243187 () Bool)

(assert (=> b!1357458 m!1243187))

(declare-fun m!1243189 () Bool)

(assert (=> b!1357458 m!1243189))

(declare-fun m!1243191 () Bool)

(assert (=> b!1357450 m!1243191))

(declare-fun m!1243193 () Bool)

(assert (=> b!1357453 m!1243193))

(declare-fun m!1243195 () Bool)

(assert (=> b!1357454 m!1243195))

(declare-fun m!1243197 () Bool)

(assert (=> b!1357457 m!1243197))

(assert (=> b!1357455 m!1243183))

(assert (=> b!1357455 m!1243183))

(declare-fun m!1243199 () Bool)

(assert (=> b!1357455 m!1243199))

(declare-fun m!1243201 () Bool)

(assert (=> b!1357449 m!1243201))

(declare-fun m!1243203 () Bool)

(assert (=> start!114296 m!1243203))

(declare-fun m!1243205 () Bool)

(assert (=> b!1357459 m!1243205))

(declare-fun m!1243207 () Bool)

(assert (=> b!1357451 m!1243207))

(declare-fun m!1243209 () Bool)

(assert (=> b!1357448 m!1243209))

(declare-fun m!1243211 () Bool)

(assert (=> b!1357447 m!1243211))

(push 1)

(assert (not b!1357455))

(assert (not b!1357453))

(assert (not start!114296))

(assert (not b!1357448))

(assert (not b!1357458))

(assert (not b!1357451))

(assert (not b!1357457))

(assert (not b!1357459))

(assert (not b!1357447))

(assert (not b!1357450))

(assert (not b!1357454))

(assert (not b!1357449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145175 () Bool)

(declare-fun lt!599181 () Bool)

(declare-fun content!677 (List!31704) (Set (_ BitVec 64)))

(assert (=> d!145175 (= lt!599181 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!677 acc!759)))))

(declare-fun e!770489 () Bool)

(assert (=> d!145175 (= lt!599181 e!770489)))

(declare-fun res!902297 () Bool)

(assert (=> d!145175 (=> (not res!902297) (not e!770489))))

(assert (=> d!145175 (= res!902297 (is-Cons!31700 acc!759))))

(assert (=> d!145175 (= (contains!9413 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599181)))

(declare-fun b!1357572 () Bool)

(declare-fun e!770490 () Bool)

(assert (=> b!1357572 (= e!770489 e!770490)))

(declare-fun res!902296 () Bool)

(assert (=> b!1357572 (=> res!902296 e!770490)))

(assert (=> b!1357572 (= res!902296 (= (h!32909 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357573 () Bool)

(assert (=> b!1357573 (= e!770490 (contains!9413 (t!46365 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145175 res!902297) b!1357572))

(assert (= (and b!1357572 (not res!902296)) b!1357573))

(declare-fun m!1243301 () Bool)

(assert (=> d!145175 m!1243301))

(declare-fun m!1243303 () Bool)

(assert (=> d!145175 m!1243303))

(declare-fun m!1243305 () Bool)

(assert (=> b!1357573 m!1243305))

(assert (=> b!1357447 d!145175))

(declare-fun d!145183 () Bool)

(assert (=> d!145183 (= ($colon$colon!818 acc!759 (select (arr!44663 a!3742) from!3120)) (Cons!31700 (select (arr!44663 a!3742) from!3120) acc!759))))

(assert (=> b!1357458 d!145183))

(declare-fun b!1357605 () Bool)

(declare-fun e!770523 () Bool)

(declare-fun e!770526 () Bool)

(assert (=> b!1357605 (= e!770523 e!770526)))

(declare-fun res!902332 () Bool)

(assert (=> b!1357605 (=> res!902332 e!770526)))

(declare-fun e!770525 () Bool)

(assert (=> b!1357605 (= res!902332 e!770525)))

(declare-fun res!902330 () Bool)

(assert (=> b!1357605 (=> (not res!902330) (not e!770525))))

(assert (=> b!1357605 (= res!902330 (= (h!32909 acc!759) (h!32909 acc!759)))))

(declare-fun d!145185 () Bool)

(declare-fun res!902331 () Bool)

(declare-fun e!770524 () Bool)

(assert (=> d!145185 (=> res!902331 e!770524)))

(assert (=> d!145185 (= res!902331 (is-Nil!31701 acc!759))))

(assert (=> d!145185 (= (subseq!815 acc!759 acc!759) e!770524)))

(declare-fun b!1357607 () Bool)

(assert (=> b!1357607 (= e!770525 (subseq!815 (t!46365 acc!759) (t!46365 acc!759)))))

(declare-fun b!1357609 () Bool)

(assert (=> b!1357609 (= e!770526 (subseq!815 acc!759 (t!46365 acc!759)))))

(declare-fun b!1357604 () Bool)

(assert (=> b!1357604 (= e!770524 e!770523)))

(declare-fun res!902333 () Bool)

(assert (=> b!1357604 (=> (not res!902333) (not e!770523))))

(assert (=> b!1357604 (= res!902333 (is-Cons!31700 acc!759))))

(assert (= (and d!145185 (not res!902331)) b!1357604))

(assert (= (and b!1357604 res!902333) b!1357605))

(assert (= (and b!1357605 res!902330) b!1357607))

(assert (= (and b!1357605 (not res!902332)) b!1357609))

(declare-fun m!1243321 () Bool)

(assert (=> b!1357607 m!1243321))

(declare-fun m!1243323 () Bool)

(assert (=> b!1357609 m!1243323))

(assert (=> b!1357458 d!145185))

(declare-fun d!145195 () Bool)

(assert (=> d!145195 (subseq!815 acc!759 acc!759)))

(declare-fun lt!599188 () Unit!44661)

(declare-fun choose!36 (List!31704) Unit!44661)

(assert (=> d!145195 (= lt!599188 (choose!36 acc!759))))

(assert (=> d!145195 (= (lemmaListSubSeqRefl!0 acc!759) lt!599188)))

(declare-fun bs!38935 () Bool)

(assert (= bs!38935 d!145195))

(assert (=> bs!38935 m!1243187))

(declare-fun m!1243333 () Bool)

(assert (=> bs!38935 m!1243333))

(assert (=> b!1357458 d!145195))

(declare-fun d!145201 () Bool)

(declare-fun lt!599189 () Bool)

(assert (=> d!145201 (= lt!599189 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!677 lt!599160)))))

(declare-fun e!770539 () Bool)

(assert (=> d!145201 (= lt!599189 e!770539)))

(declare-fun res!902345 () Bool)

(assert (=> d!145201 (=> (not res!902345) (not e!770539))))

(assert (=> d!145201 (= res!902345 (is-Cons!31700 lt!599160))))

(assert (=> d!145201 (= (contains!9413 lt!599160 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599189)))

(declare-fun b!1357624 () Bool)

(declare-fun e!770540 () Bool)

(assert (=> b!1357624 (= e!770539 e!770540)))

(declare-fun res!902344 () Bool)

(assert (=> b!1357624 (=> res!902344 e!770540)))

(assert (=> b!1357624 (= res!902344 (= (h!32909 lt!599160) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357625 () Bool)

(assert (=> b!1357625 (= e!770540 (contains!9413 (t!46365 lt!599160) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145201 res!902345) b!1357624))

(assert (= (and b!1357624 (not res!902344)) b!1357625))

(declare-fun m!1243335 () Bool)

(assert (=> d!145201 m!1243335))

(declare-fun m!1243337 () Bool)

(assert (=> d!145201 m!1243337))

(declare-fun m!1243339 () Bool)

(assert (=> b!1357625 m!1243339))

(assert (=> b!1357457 d!145201))

(declare-fun b!1357649 () Bool)

(declare-fun e!770563 () Bool)

(declare-fun call!65262 () Bool)

(assert (=> b!1357649 (= e!770563 call!65262)))

(declare-fun b!1357650 () Bool)

(declare-fun e!770564 () Bool)

(declare-fun e!770562 () Bool)

(assert (=> b!1357650 (= e!770564 e!770562)))

(declare-fun res!902364 () Bool)

(assert (=> b!1357650 (=> (not res!902364) (not e!770562))))

(declare-fun e!770561 () Bool)

(assert (=> b!1357650 (= res!902364 (not e!770561))))

(declare-fun res!902365 () Bool)

(assert (=> b!1357650 (=> (not res!902365) (not e!770561))))

(assert (=> b!1357650 (= res!902365 (validKeyInArray!0 (select (arr!44663 a!3742) from!3120)))))

(declare-fun bm!65259 () Bool)

(declare-fun c!127083 () Bool)

(assert (=> bm!65259 (= call!65262 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127083 (Cons!31700 (select (arr!44663 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1357652 () Bool)

(assert (=> b!1357652 (= e!770562 e!770563)))

(assert (=> b!1357652 (= c!127083 (validKeyInArray!0 (select (arr!44663 a!3742) from!3120)))))

(declare-fun b!1357653 () Bool)

(assert (=> b!1357653 (= e!770563 call!65262)))

(declare-fun d!145203 () Bool)

(declare-fun res!902363 () Bool)

(assert (=> d!145203 (=> res!902363 e!770564)))

(assert (=> d!145203 (= res!902363 (bvsge from!3120 (size!45213 a!3742)))))

(assert (=> d!145203 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770564)))

(declare-fun b!1357651 () Bool)

(assert (=> b!1357651 (= e!770561 (contains!9413 acc!759 (select (arr!44663 a!3742) from!3120)))))

(assert (= (and d!145203 (not res!902363)) b!1357650))

(assert (= (and b!1357650 res!902365) b!1357651))

(assert (= (and b!1357650 res!902364) b!1357652))

(assert (= (and b!1357652 c!127083) b!1357653))

(assert (= (and b!1357652 (not c!127083)) b!1357649))

(assert (= (or b!1357653 b!1357649) bm!65259))

(assert (=> b!1357650 m!1243183))

(assert (=> b!1357650 m!1243183))

(assert (=> b!1357650 m!1243199))

(assert (=> bm!65259 m!1243183))

(declare-fun m!1243361 () Bool)

(assert (=> bm!65259 m!1243361))

(assert (=> b!1357652 m!1243183))

(assert (=> b!1357652 m!1243183))

(assert (=> b!1357652 m!1243199))

(assert (=> b!1357651 m!1243183))

(assert (=> b!1357651 m!1243183))

(declare-fun m!1243367 () Bool)

(assert (=> b!1357651 m!1243367))

(assert (=> b!1357450 d!145203))

(declare-fun b!1357658 () Bool)

(declare-fun e!770571 () Bool)

(declare-fun call!65263 () Bool)

(assert (=> b!1357658 (= e!770571 call!65263)))

(declare-fun b!1357659 () Bool)

(declare-fun e!770572 () Bool)

(declare-fun e!770570 () Bool)

(assert (=> b!1357659 (= e!770572 e!770570)))

(declare-fun res!902371 () Bool)

(assert (=> b!1357659 (=> (not res!902371) (not e!770570))))

(declare-fun e!770569 () Bool)

(assert (=> b!1357659 (= res!902371 (not e!770569))))

(declare-fun res!902372 () Bool)

(assert (=> b!1357659 (=> (not res!902372) (not e!770569))))

(assert (=> b!1357659 (= res!902372 (validKeyInArray!0 (select (arr!44663 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65260 () Bool)

(declare-fun c!127084 () Bool)

(assert (=> bm!65260 (= call!65263 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127084 (Cons!31700 (select (arr!44663 a!3742) #b00000000000000000000000000000000) Nil!31701) Nil!31701)))))

(declare-fun b!1357661 () Bool)

(assert (=> b!1357661 (= e!770570 e!770571)))

(assert (=> b!1357661 (= c!127084 (validKeyInArray!0 (select (arr!44663 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357662 () Bool)

(assert (=> b!1357662 (= e!770571 call!65263)))

(declare-fun d!145215 () Bool)

(declare-fun res!902370 () Bool)

(assert (=> d!145215 (=> res!902370 e!770572)))

(assert (=> d!145215 (= res!902370 (bvsge #b00000000000000000000000000000000 (size!45213 a!3742)))))

(assert (=> d!145215 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31701) e!770572)))

(declare-fun b!1357660 () Bool)

(assert (=> b!1357660 (= e!770569 (contains!9413 Nil!31701 (select (arr!44663 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145215 (not res!902370)) b!1357659))

(assert (= (and b!1357659 res!902372) b!1357660))

(assert (= (and b!1357659 res!902371) b!1357661))

(assert (= (and b!1357661 c!127084) b!1357662))

(assert (= (and b!1357661 (not c!127084)) b!1357658))

(assert (= (or b!1357662 b!1357658) bm!65260))

(declare-fun m!1243369 () Bool)

(assert (=> b!1357659 m!1243369))

(assert (=> b!1357659 m!1243369))

(declare-fun m!1243371 () Bool)

(assert (=> b!1357659 m!1243371))

(assert (=> bm!65260 m!1243369))

(declare-fun m!1243373 () Bool)

(assert (=> bm!65260 m!1243373))

(assert (=> b!1357661 m!1243369))

(assert (=> b!1357661 m!1243369))

(assert (=> b!1357661 m!1243371))

(assert (=> b!1357660 m!1243369))

(assert (=> b!1357660 m!1243369))

(declare-fun m!1243375 () Bool)

(assert (=> b!1357660 m!1243375))

(assert (=> b!1357449 d!145215))

(declare-fun d!145219 () Bool)

(assert (=> d!145219 (= (array_inv!33691 a!3742) (bvsge (size!45213 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114296 d!145219))

(declare-fun d!145223 () Bool)

(declare-fun res!902377 () Bool)

(declare-fun e!770577 () Bool)

(assert (=> d!145223 (=> res!902377 e!770577)))

(assert (=> d!145223 (= res!902377 (is-Nil!31701 lt!599160))))

(assert (=> d!145223 (= (noDuplicate!2270 lt!599160) e!770577)))

(declare-fun b!1357667 () Bool)

(declare-fun e!770578 () Bool)

(assert (=> b!1357667 (= e!770577 e!770578)))

(declare-fun res!902378 () Bool)

(assert (=> b!1357667 (=> (not res!902378) (not e!770578))))

(assert (=> b!1357667 (= res!902378 (not (contains!9413 (t!46365 lt!599160) (h!32909 lt!599160))))))

(declare-fun b!1357668 () Bool)

(assert (=> b!1357668 (= e!770578 (noDuplicate!2270 (t!46365 lt!599160)))))

(assert (= (and d!145223 (not res!902377)) b!1357667))

(assert (= (and b!1357667 res!902378) b!1357668))

(declare-fun m!1243377 () Bool)

(assert (=> b!1357667 m!1243377))

(declare-fun m!1243379 () Bool)

