; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61090 () Bool)

(assert start!61090)

(declare-fun b!685075 () Bool)

(declare-fun res!450508 () Bool)

(declare-fun e!390136 () Bool)

(assert (=> b!685075 (=> res!450508 e!390136)))

(declare-datatypes ((List!13032 0))(
  ( (Nil!13029) (Cons!13028 (h!14073 (_ BitVec 64)) (t!19281 List!13032)) )
))
(declare-fun lt!314547 () List!13032)

(declare-fun noDuplicate!856 (List!13032) Bool)

(assert (=> b!685075 (= res!450508 (not (noDuplicate!856 lt!314547)))))

(declare-fun b!685077 () Bool)

(declare-fun res!450515 () Bool)

(declare-fun e!390137 () Bool)

(assert (=> b!685077 (=> (not res!450515) (not e!390137))))

(declare-datatypes ((array!39624 0))(
  ( (array!39625 (arr!18991 (Array (_ BitVec 32) (_ BitVec 64))) (size!19360 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39624)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!13032)

(declare-fun arrayNoDuplicates!0 (array!39624 (_ BitVec 32) List!13032) Bool)

(assert (=> b!685077 (= res!450515 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685078 () Bool)

(declare-fun res!450503 () Bool)

(assert (=> b!685078 (=> (not res!450503) (not e!390137))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685078 (= res!450503 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685079 () Bool)

(declare-datatypes ((Unit!24122 0))(
  ( (Unit!24123) )
))
(declare-fun e!390133 () Unit!24122)

(declare-fun Unit!24124 () Unit!24122)

(assert (=> b!685079 (= e!390133 Unit!24124)))

(declare-fun lt!314545 () Unit!24122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39624 (_ BitVec 64) (_ BitVec 32)) Unit!24122)

(assert (=> b!685079 (= lt!314545 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!685079 false))

(declare-fun b!685080 () Bool)

(declare-fun e!390131 () Bool)

(declare-fun contains!3609 (List!13032 (_ BitVec 64)) Bool)

(assert (=> b!685080 (= e!390131 (not (contains!3609 acc!681 k0!2843)))))

(declare-fun b!685081 () Bool)

(assert (=> b!685081 (= e!390137 (not e!390136))))

(declare-fun res!450510 () Bool)

(assert (=> b!685081 (=> res!450510 e!390136)))

(assert (=> b!685081 (= res!450510 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!160 (List!13032 (_ BitVec 64)) List!13032)

(assert (=> b!685081 (= (-!160 lt!314547 k0!2843) acc!681)))

(declare-fun $colon$colon!360 (List!13032 (_ BitVec 64)) List!13032)

(assert (=> b!685081 (= lt!314547 ($colon$colon!360 acc!681 k0!2843))))

(declare-fun lt!314549 () Unit!24122)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13032) Unit!24122)

(assert (=> b!685081 (= lt!314549 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!195 (List!13032 List!13032) Bool)

(assert (=> b!685081 (subseq!195 acc!681 acc!681)))

(declare-fun lt!314543 () Unit!24122)

(declare-fun lemmaListSubSeqRefl!0 (List!13032) Unit!24122)

(assert (=> b!685081 (= lt!314543 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685081 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314550 () Unit!24122)

(declare-fun e!390134 () Unit!24122)

(assert (=> b!685081 (= lt!314550 e!390134)))

(declare-fun c!77654 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685081 (= c!77654 (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)))))

(declare-fun lt!314551 () Unit!24122)

(assert (=> b!685081 (= lt!314551 e!390133)))

(declare-fun c!77653 () Bool)

(declare-fun lt!314546 () Bool)

(assert (=> b!685081 (= c!77653 lt!314546)))

(assert (=> b!685081 (= lt!314546 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685081 (arrayContainsKey!0 (array!39625 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19360 a!3626)) k0!2843 from!3004)))

(declare-fun b!685082 () Bool)

(declare-fun Unit!24125 () Unit!24122)

(assert (=> b!685082 (= e!390133 Unit!24125)))

(declare-fun b!685083 () Bool)

(assert (=> b!685083 (= e!390136 (contains!3609 lt!314547 k0!2843))))

(declare-fun b!685084 () Bool)

(declare-fun Unit!24126 () Unit!24122)

(assert (=> b!685084 (= e!390134 Unit!24126)))

(declare-fun b!685085 () Bool)

(declare-fun res!450516 () Bool)

(assert (=> b!685085 (=> (not res!450516) (not e!390137))))

(assert (=> b!685085 (= res!450516 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19360 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685086 () Bool)

(declare-fun res!450513 () Bool)

(assert (=> b!685086 (=> (not res!450513) (not e!390137))))

(assert (=> b!685086 (= res!450513 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13029))))

(declare-fun b!685087 () Bool)

(declare-fun res!450520 () Bool)

(assert (=> b!685087 (=> (not res!450520) (not e!390137))))

(assert (=> b!685087 (= res!450520 (validKeyInArray!0 k0!2843))))

(declare-fun b!685088 () Bool)

(declare-fun res!450506 () Bool)

(assert (=> b!685088 (=> res!450506 e!390136)))

(assert (=> b!685088 (= res!450506 (not (subseq!195 acc!681 lt!314547)))))

(declare-fun res!450517 () Bool)

(assert (=> start!61090 (=> (not res!450517) (not e!390137))))

(assert (=> start!61090 (= res!450517 (and (bvslt (size!19360 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19360 a!3626))))))

(assert (=> start!61090 e!390137))

(assert (=> start!61090 true))

(declare-fun array_inv!14787 (array!39624) Bool)

(assert (=> start!61090 (array_inv!14787 a!3626)))

(declare-fun b!685076 () Bool)

(declare-fun e!390132 () Bool)

(assert (=> b!685076 (= e!390132 (contains!3609 acc!681 k0!2843))))

(declare-fun b!685089 () Bool)

(declare-fun res!450504 () Bool)

(assert (=> b!685089 (=> (not res!450504) (not e!390137))))

(assert (=> b!685089 (= res!450504 (not (contains!3609 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685090 () Bool)

(declare-fun e!390135 () Bool)

(assert (=> b!685090 (= e!390135 e!390131)))

(declare-fun res!450507 () Bool)

(assert (=> b!685090 (=> (not res!450507) (not e!390131))))

(assert (=> b!685090 (= res!450507 (bvsle from!3004 i!1382))))

(declare-fun b!685091 () Bool)

(declare-fun res!450512 () Bool)

(assert (=> b!685091 (=> (not res!450512) (not e!390137))))

(assert (=> b!685091 (= res!450512 e!390135)))

(declare-fun res!450519 () Bool)

(assert (=> b!685091 (=> res!450519 e!390135)))

(assert (=> b!685091 (= res!450519 e!390132)))

(declare-fun res!450514 () Bool)

(assert (=> b!685091 (=> (not res!450514) (not e!390132))))

(assert (=> b!685091 (= res!450514 (bvsgt from!3004 i!1382))))

(declare-fun b!685092 () Bool)

(declare-fun res!450511 () Bool)

(assert (=> b!685092 (=> res!450511 e!390136)))

(assert (=> b!685092 (= res!450511 (contains!3609 acc!681 k0!2843))))

(declare-fun b!685093 () Bool)

(declare-fun res!450521 () Bool)

(assert (=> b!685093 (=> (not res!450521) (not e!390137))))

(assert (=> b!685093 (= res!450521 (noDuplicate!856 acc!681))))

(declare-fun b!685094 () Bool)

(declare-fun res!450518 () Bool)

(assert (=> b!685094 (=> (not res!450518) (not e!390137))))

(assert (=> b!685094 (= res!450518 (not (contains!3609 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685095 () Bool)

(declare-fun lt!314544 () Unit!24122)

(assert (=> b!685095 (= e!390134 lt!314544)))

(declare-fun lt!314548 () Unit!24122)

(assert (=> b!685095 (= lt!314548 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685095 (subseq!195 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39624 List!13032 List!13032 (_ BitVec 32)) Unit!24122)

(assert (=> b!685095 (= lt!314544 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!360 acc!681 (select (arr!18991 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685095 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685096 () Bool)

(declare-fun res!450505 () Bool)

(assert (=> b!685096 (=> res!450505 e!390136)))

(assert (=> b!685096 (= res!450505 lt!314546)))

(declare-fun b!685097 () Bool)

(declare-fun res!450509 () Bool)

(assert (=> b!685097 (=> (not res!450509) (not e!390137))))

(assert (=> b!685097 (= res!450509 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19360 a!3626))))))

(assert (= (and start!61090 res!450517) b!685093))

(assert (= (and b!685093 res!450521) b!685094))

(assert (= (and b!685094 res!450518) b!685089))

(assert (= (and b!685089 res!450504) b!685091))

(assert (= (and b!685091 res!450514) b!685076))

(assert (= (and b!685091 (not res!450519)) b!685090))

(assert (= (and b!685090 res!450507) b!685080))

(assert (= (and b!685091 res!450512) b!685086))

(assert (= (and b!685086 res!450513) b!685077))

(assert (= (and b!685077 res!450515) b!685097))

(assert (= (and b!685097 res!450509) b!685087))

(assert (= (and b!685087 res!450520) b!685078))

(assert (= (and b!685078 res!450503) b!685085))

(assert (= (and b!685085 res!450516) b!685081))

(assert (= (and b!685081 c!77653) b!685079))

(assert (= (and b!685081 (not c!77653)) b!685082))

(assert (= (and b!685081 c!77654) b!685095))

(assert (= (and b!685081 (not c!77654)) b!685084))

(assert (= (and b!685081 (not res!450510)) b!685075))

(assert (= (and b!685075 (not res!450508)) b!685096))

(assert (= (and b!685096 (not res!450505)) b!685092))

(assert (= (and b!685092 (not res!450511)) b!685088))

(assert (= (and b!685088 (not res!450506)) b!685083))

(declare-fun m!649323 () Bool)

(assert (=> b!685092 m!649323))

(declare-fun m!649325 () Bool)

(assert (=> b!685087 m!649325))

(declare-fun m!649327 () Bool)

(assert (=> b!685088 m!649327))

(declare-fun m!649329 () Bool)

(assert (=> b!685078 m!649329))

(declare-fun m!649331 () Bool)

(assert (=> b!685095 m!649331))

(declare-fun m!649333 () Bool)

(assert (=> b!685095 m!649333))

(declare-fun m!649335 () Bool)

(assert (=> b!685095 m!649335))

(declare-fun m!649337 () Bool)

(assert (=> b!685095 m!649337))

(assert (=> b!685095 m!649333))

(assert (=> b!685095 m!649335))

(declare-fun m!649339 () Bool)

(assert (=> b!685095 m!649339))

(declare-fun m!649341 () Bool)

(assert (=> b!685095 m!649341))

(declare-fun m!649343 () Bool)

(assert (=> b!685089 m!649343))

(declare-fun m!649345 () Bool)

(assert (=> b!685094 m!649345))

(assert (=> b!685076 m!649323))

(declare-fun m!649347 () Bool)

(assert (=> b!685086 m!649347))

(assert (=> b!685081 m!649331))

(assert (=> b!685081 m!649333))

(declare-fun m!649349 () Bool)

(assert (=> b!685081 m!649349))

(declare-fun m!649351 () Bool)

(assert (=> b!685081 m!649351))

(declare-fun m!649353 () Bool)

(assert (=> b!685081 m!649353))

(assert (=> b!685081 m!649339))

(declare-fun m!649355 () Bool)

(assert (=> b!685081 m!649355))

(declare-fun m!649357 () Bool)

(assert (=> b!685081 m!649357))

(assert (=> b!685081 m!649333))

(declare-fun m!649359 () Bool)

(assert (=> b!685081 m!649359))

(declare-fun m!649361 () Bool)

(assert (=> b!685081 m!649361))

(assert (=> b!685081 m!649341))

(declare-fun m!649363 () Bool)

(assert (=> b!685077 m!649363))

(declare-fun m!649365 () Bool)

(assert (=> start!61090 m!649365))

(declare-fun m!649367 () Bool)

(assert (=> b!685075 m!649367))

(declare-fun m!649369 () Bool)

(assert (=> b!685093 m!649369))

(declare-fun m!649371 () Bool)

(assert (=> b!685083 m!649371))

(assert (=> b!685080 m!649323))

(declare-fun m!649373 () Bool)

(assert (=> b!685079 m!649373))

(check-sat (not b!685076) (not b!685079) (not start!61090) (not b!685095) (not b!685075) (not b!685081) (not b!685087) (not b!685083) (not b!685089) (not b!685094) (not b!685092) (not b!685086) (not b!685077) (not b!685088) (not b!685093) (not b!685078) (not b!685080))
(check-sat)
(get-model)

(declare-fun b!685181 () Bool)

(declare-fun e!390178 () Bool)

(declare-fun e!390179 () Bool)

(assert (=> b!685181 (= e!390178 e!390179)))

(declare-fun res!450594 () Bool)

(assert (=> b!685181 (=> (not res!450594) (not e!390179))))

(get-info :version)

(assert (=> b!685181 (= res!450594 ((_ is Cons!13028) lt!314547))))

(declare-fun b!685184 () Bool)

(declare-fun e!390180 () Bool)

(assert (=> b!685184 (= e!390180 (subseq!195 acc!681 (t!19281 lt!314547)))))

(declare-fun b!685182 () Bool)

(assert (=> b!685182 (= e!390179 e!390180)))

(declare-fun res!450593 () Bool)

(assert (=> b!685182 (=> res!450593 e!390180)))

(declare-fun e!390177 () Bool)

(assert (=> b!685182 (= res!450593 e!390177)))

(declare-fun res!450595 () Bool)

(assert (=> b!685182 (=> (not res!450595) (not e!390177))))

(assert (=> b!685182 (= res!450595 (= (h!14073 acc!681) (h!14073 lt!314547)))))

(declare-fun d!94455 () Bool)

(declare-fun res!450596 () Bool)

(assert (=> d!94455 (=> res!450596 e!390178)))

(assert (=> d!94455 (= res!450596 ((_ is Nil!13029) acc!681))))

(assert (=> d!94455 (= (subseq!195 acc!681 lt!314547) e!390178)))

(declare-fun b!685183 () Bool)

(assert (=> b!685183 (= e!390177 (subseq!195 (t!19281 acc!681) (t!19281 lt!314547)))))

(assert (= (and d!94455 (not res!450596)) b!685181))

(assert (= (and b!685181 res!450594) b!685182))

(assert (= (and b!685182 res!450595) b!685183))

(assert (= (and b!685182 (not res!450593)) b!685184))

(declare-fun m!649431 () Bool)

(assert (=> b!685184 m!649431))

(declare-fun m!649433 () Bool)

(assert (=> b!685183 m!649433))

(assert (=> b!685088 d!94455))

(declare-fun d!94463 () Bool)

(declare-fun lt!314584 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!290 (List!13032) (InoxSet (_ BitVec 64)))

(assert (=> d!94463 (= lt!314584 (select (content!290 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390208 () Bool)

(assert (=> d!94463 (= lt!314584 e!390208)))

(declare-fun res!450623 () Bool)

(assert (=> d!94463 (=> (not res!450623) (not e!390208))))

(assert (=> d!94463 (= res!450623 ((_ is Cons!13028) acc!681))))

(assert (=> d!94463 (= (contains!3609 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314584)))

(declare-fun b!685211 () Bool)

(declare-fun e!390207 () Bool)

(assert (=> b!685211 (= e!390208 e!390207)))

(declare-fun res!450624 () Bool)

(assert (=> b!685211 (=> res!450624 e!390207)))

(assert (=> b!685211 (= res!450624 (= (h!14073 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685212 () Bool)

(assert (=> b!685212 (= e!390207 (contains!3609 (t!19281 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94463 res!450623) b!685211))

(assert (= (and b!685211 (not res!450624)) b!685212))

(declare-fun m!649445 () Bool)

(assert (=> d!94463 m!649445))

(declare-fun m!649447 () Bool)

(assert (=> d!94463 m!649447))

(declare-fun m!649449 () Bool)

(assert (=> b!685212 m!649449))

(assert (=> b!685089 d!94463))

(declare-fun d!94471 () Bool)

(declare-fun res!450637 () Bool)

(declare-fun e!390221 () Bool)

(assert (=> d!94471 (=> res!450637 e!390221)))

(assert (=> d!94471 (= res!450637 (= (select (arr!18991 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94471 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390221)))

(declare-fun b!685225 () Bool)

(declare-fun e!390222 () Bool)

(assert (=> b!685225 (= e!390221 e!390222)))

(declare-fun res!450638 () Bool)

(assert (=> b!685225 (=> (not res!450638) (not e!390222))))

(assert (=> b!685225 (= res!450638 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19360 a!3626)))))

(declare-fun b!685226 () Bool)

(assert (=> b!685226 (= e!390222 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94471 (not res!450637)) b!685225))

(assert (= (and b!685225 res!450638) b!685226))

(declare-fun m!649461 () Bool)

(assert (=> d!94471 m!649461))

(declare-fun m!649463 () Bool)

(assert (=> b!685226 m!649463))

(assert (=> b!685078 d!94471))

(declare-fun d!94479 () Bool)

(assert (=> d!94479 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314592 () Unit!24122)

(declare-fun choose!13 (array!39624 (_ BitVec 64) (_ BitVec 32)) Unit!24122)

(assert (=> d!94479 (= lt!314592 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94479 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94479 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314592)))

(declare-fun bs!20090 () Bool)

(assert (= bs!20090 d!94479))

(assert (=> bs!20090 m!649329))

(declare-fun m!649465 () Bool)

(assert (=> bs!20090 m!649465))

(assert (=> b!685079 d!94479))

(declare-fun d!94481 () Bool)

(declare-fun lt!314593 () Bool)

(assert (=> d!94481 (= lt!314593 (select (content!290 acc!681) k0!2843))))

(declare-fun e!390237 () Bool)

(assert (=> d!94481 (= lt!314593 e!390237)))

(declare-fun res!450647 () Bool)

(assert (=> d!94481 (=> (not res!450647) (not e!390237))))

(assert (=> d!94481 (= res!450647 ((_ is Cons!13028) acc!681))))

(assert (=> d!94481 (= (contains!3609 acc!681 k0!2843) lt!314593)))

(declare-fun b!685243 () Bool)

(declare-fun e!390236 () Bool)

(assert (=> b!685243 (= e!390237 e!390236)))

(declare-fun res!450648 () Bool)

(assert (=> b!685243 (=> res!450648 e!390236)))

(assert (=> b!685243 (= res!450648 (= (h!14073 acc!681) k0!2843))))

(declare-fun b!685244 () Bool)

(assert (=> b!685244 (= e!390236 (contains!3609 (t!19281 acc!681) k0!2843))))

(assert (= (and d!94481 res!450647) b!685243))

(assert (= (and b!685243 (not res!450648)) b!685244))

(assert (=> d!94481 m!649445))

(declare-fun m!649471 () Bool)

(assert (=> d!94481 m!649471))

(declare-fun m!649473 () Bool)

(assert (=> b!685244 m!649473))

(assert (=> b!685080 d!94481))

(declare-fun b!685247 () Bool)

(declare-fun e!390241 () Bool)

(declare-fun e!390242 () Bool)

(assert (=> b!685247 (= e!390241 e!390242)))

(declare-fun res!450652 () Bool)

(assert (=> b!685247 (=> (not res!450652) (not e!390242))))

(assert (=> b!685247 (= res!450652 ((_ is Cons!13028) acc!681))))

(declare-fun b!685250 () Bool)

(declare-fun e!390243 () Bool)

(assert (=> b!685250 (= e!390243 (subseq!195 acc!681 (t!19281 acc!681)))))

(declare-fun b!685248 () Bool)

(assert (=> b!685248 (= e!390242 e!390243)))

(declare-fun res!450651 () Bool)

(assert (=> b!685248 (=> res!450651 e!390243)))

(declare-fun e!390240 () Bool)

(assert (=> b!685248 (= res!450651 e!390240)))

(declare-fun res!450653 () Bool)

(assert (=> b!685248 (=> (not res!450653) (not e!390240))))

(assert (=> b!685248 (= res!450653 (= (h!14073 acc!681) (h!14073 acc!681)))))

(declare-fun d!94485 () Bool)

(declare-fun res!450654 () Bool)

(assert (=> d!94485 (=> res!450654 e!390241)))

(assert (=> d!94485 (= res!450654 ((_ is Nil!13029) acc!681))))

(assert (=> d!94485 (= (subseq!195 acc!681 acc!681) e!390241)))

(declare-fun b!685249 () Bool)

(assert (=> b!685249 (= e!390240 (subseq!195 (t!19281 acc!681) (t!19281 acc!681)))))

(assert (= (and d!94485 (not res!450654)) b!685247))

(assert (= (and b!685247 res!450652) b!685248))

(assert (= (and b!685248 res!450653) b!685249))

(assert (= (and b!685248 (not res!450651)) b!685250))

(declare-fun m!649481 () Bool)

(assert (=> b!685250 m!649481))

(declare-fun m!649483 () Bool)

(assert (=> b!685249 m!649483))

(assert (=> b!685081 d!94485))

(declare-fun d!94489 () Bool)

(declare-fun res!450655 () Bool)

(declare-fun e!390244 () Bool)

(assert (=> d!94489 (=> res!450655 e!390244)))

(assert (=> d!94489 (= res!450655 (= (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94489 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390244)))

(declare-fun b!685251 () Bool)

(declare-fun e!390245 () Bool)

(assert (=> b!685251 (= e!390244 e!390245)))

(declare-fun res!450656 () Bool)

(assert (=> b!685251 (=> (not res!450656) (not e!390245))))

(assert (=> b!685251 (= res!450656 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19360 a!3626)))))

(declare-fun b!685252 () Bool)

(assert (=> b!685252 (= e!390245 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94489 (not res!450655)) b!685251))

(assert (= (and b!685251 res!450656) b!685252))

(declare-fun m!649485 () Bool)

(assert (=> d!94489 m!649485))

(declare-fun m!649487 () Bool)

(assert (=> b!685252 m!649487))

(assert (=> b!685081 d!94489))

(declare-fun d!94491 () Bool)

(declare-fun res!450658 () Bool)

(declare-fun e!390249 () Bool)

(assert (=> d!94491 (=> res!450658 e!390249)))

(assert (=> d!94491 (= res!450658 (= (select (arr!18991 (array!39625 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19360 a!3626))) from!3004) k0!2843))))

(assert (=> d!94491 (= (arrayContainsKey!0 (array!39625 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19360 a!3626)) k0!2843 from!3004) e!390249)))

(declare-fun b!685258 () Bool)

(declare-fun e!390250 () Bool)

(assert (=> b!685258 (= e!390249 e!390250)))

(declare-fun res!450659 () Bool)

(assert (=> b!685258 (=> (not res!450659) (not e!390250))))

(assert (=> b!685258 (= res!450659 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19360 (array!39625 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19360 a!3626)))))))

(declare-fun b!685259 () Bool)

(assert (=> b!685259 (= e!390250 (arrayContainsKey!0 (array!39625 (store (arr!18991 a!3626) i!1382 k0!2843) (size!19360 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94491 (not res!450658)) b!685258))

(assert (= (and b!685258 res!450659) b!685259))

(declare-fun m!649499 () Bool)

(assert (=> d!94491 m!649499))

(declare-fun m!649503 () Bool)

(assert (=> b!685259 m!649503))

(assert (=> b!685081 d!94491))

(declare-fun d!94495 () Bool)

(assert (=> d!94495 (subseq!195 acc!681 acc!681)))

(declare-fun lt!314598 () Unit!24122)

(declare-fun choose!36 (List!13032) Unit!24122)

(assert (=> d!94495 (= lt!314598 (choose!36 acc!681))))

(assert (=> d!94495 (= (lemmaListSubSeqRefl!0 acc!681) lt!314598)))

(declare-fun bs!20091 () Bool)

(assert (= bs!20091 d!94495))

(assert (=> bs!20091 m!649341))

(declare-fun m!649513 () Bool)

(assert (=> bs!20091 m!649513))

(assert (=> b!685081 d!94495))

(declare-fun d!94501 () Bool)

(assert (=> d!94501 (= (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)) (and (not (= (select (arr!18991 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18991 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685081 d!94501))

(declare-fun b!685307 () Bool)

(declare-fun e!390293 () List!13032)

(declare-fun e!390294 () List!13032)

(assert (=> b!685307 (= e!390293 e!390294)))

(declare-fun c!77675 () Bool)

(assert (=> b!685307 (= c!77675 (= k0!2843 (h!14073 lt!314547)))))

(declare-fun b!685309 () Bool)

(assert (=> b!685309 (= e!390293 Nil!13029)))

(declare-fun b!685310 () Bool)

(declare-fun call!34061 () List!13032)

(assert (=> b!685310 (= e!390294 call!34061)))

(declare-fun d!94503 () Bool)

(declare-fun e!390292 () Bool)

(assert (=> d!94503 e!390292))

(declare-fun res!450693 () Bool)

(assert (=> d!94503 (=> (not res!450693) (not e!390292))))

(declare-fun lt!314610 () List!13032)

(declare-fun size!19363 (List!13032) Int)

(assert (=> d!94503 (= res!450693 (<= (size!19363 lt!314610) (size!19363 lt!314547)))))

(assert (=> d!94503 (= lt!314610 e!390293)))

(declare-fun c!77674 () Bool)

(assert (=> d!94503 (= c!77674 ((_ is Cons!13028) lt!314547))))

(assert (=> d!94503 (= (-!160 lt!314547 k0!2843) lt!314610)))

(declare-fun b!685308 () Bool)

(assert (=> b!685308 (= e!390294 (Cons!13028 (h!14073 lt!314547) call!34061))))

(declare-fun b!685311 () Bool)

(assert (=> b!685311 (= e!390292 (= (content!290 lt!314610) ((_ map and) (content!290 lt!314547) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun bm!34058 () Bool)

(assert (=> bm!34058 (= call!34061 (-!160 (t!19281 lt!314547) k0!2843))))

(assert (= (and d!94503 c!77674) b!685307))

(assert (= (and d!94503 (not c!77674)) b!685309))

(assert (= (and b!685307 c!77675) b!685310))

(assert (= (and b!685307 (not c!77675)) b!685308))

(assert (= (or b!685310 b!685308) bm!34058))

(assert (= (and d!94503 res!450693) b!685311))

(declare-fun m!649543 () Bool)

(assert (=> d!94503 m!649543))

(declare-fun m!649545 () Bool)

(assert (=> d!94503 m!649545))

(declare-fun m!649547 () Bool)

(assert (=> b!685311 m!649547))

(declare-fun m!649549 () Bool)

(assert (=> b!685311 m!649549))

(declare-fun m!649551 () Bool)

(assert (=> b!685311 m!649551))

(declare-fun m!649553 () Bool)

(assert (=> bm!34058 m!649553))

(assert (=> b!685081 d!94503))

(declare-fun d!94523 () Bool)

(assert (=> d!94523 (= (-!160 ($colon$colon!360 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314621 () Unit!24122)

(declare-fun choose!16 ((_ BitVec 64) List!13032) Unit!24122)

(assert (=> d!94523 (= lt!314621 (choose!16 k0!2843 acc!681))))

(assert (=> d!94523 (not (contains!3609 acc!681 k0!2843))))

(assert (=> d!94523 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314621)))

(declare-fun bs!20097 () Bool)

(assert (= bs!20097 d!94523))

(assert (=> bs!20097 m!649357))

(assert (=> bs!20097 m!649357))

(declare-fun m!649559 () Bool)

(assert (=> bs!20097 m!649559))

(declare-fun m!649561 () Bool)

(assert (=> bs!20097 m!649561))

(assert (=> bs!20097 m!649323))

(assert (=> b!685081 d!94523))

(declare-fun d!94531 () Bool)

(assert (=> d!94531 (= ($colon$colon!360 acc!681 k0!2843) (Cons!13028 k0!2843 acc!681))))

(assert (=> b!685081 d!94531))

(declare-fun e!390340 () Bool)

(declare-fun b!685363 () Bool)

(assert (=> b!685363 (= e!390340 (contains!3609 acc!681 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685364 () Bool)

(declare-fun e!390339 () Bool)

(declare-fun e!390338 () Bool)

(assert (=> b!685364 (= e!390339 e!390338)))

(declare-fun c!77686 () Bool)

(assert (=> b!685364 (= c!77686 (validKeyInArray!0 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685365 () Bool)

(declare-fun call!34069 () Bool)

(assert (=> b!685365 (= e!390338 call!34069)))

(declare-fun b!685366 () Bool)

(assert (=> b!685366 (= e!390338 call!34069)))

(declare-fun bm!34066 () Bool)

(assert (=> bm!34066 (= call!34069 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77686 (Cons!13028 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun d!94533 () Bool)

(declare-fun res!450725 () Bool)

(declare-fun e!390337 () Bool)

(assert (=> d!94533 (=> res!450725 e!390337)))

(assert (=> d!94533 (= res!450725 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19360 a!3626)))))

(assert (=> d!94533 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390337)))

(declare-fun b!685367 () Bool)

(assert (=> b!685367 (= e!390337 e!390339)))

(declare-fun res!450726 () Bool)

(assert (=> b!685367 (=> (not res!450726) (not e!390339))))

(assert (=> b!685367 (= res!450726 (not e!390340))))

(declare-fun res!450727 () Bool)

(assert (=> b!685367 (=> (not res!450727) (not e!390340))))

(assert (=> b!685367 (= res!450727 (validKeyInArray!0 (select (arr!18991 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94533 (not res!450725)) b!685367))

(assert (= (and b!685367 res!450727) b!685363))

(assert (= (and b!685367 res!450726) b!685364))

(assert (= (and b!685364 c!77686) b!685366))

(assert (= (and b!685364 (not c!77686)) b!685365))

(assert (= (or b!685366 b!685365) bm!34066))

(assert (=> b!685363 m!649485))

(assert (=> b!685363 m!649485))

(declare-fun m!649611 () Bool)

(assert (=> b!685363 m!649611))

(assert (=> b!685364 m!649485))

(assert (=> b!685364 m!649485))

(declare-fun m!649613 () Bool)

(assert (=> b!685364 m!649613))

(assert (=> bm!34066 m!649485))

(declare-fun m!649615 () Bool)

(assert (=> bm!34066 m!649615))

(assert (=> b!685367 m!649485))

(assert (=> b!685367 m!649485))

(assert (=> b!685367 m!649613))

(assert (=> b!685081 d!94533))

(assert (=> b!685092 d!94481))

(declare-fun d!94559 () Bool)

(declare-fun res!450738 () Bool)

(declare-fun e!390353 () Bool)

(assert (=> d!94559 (=> res!450738 e!390353)))

(assert (=> d!94559 (= res!450738 ((_ is Nil!13029) acc!681))))

(assert (=> d!94559 (= (noDuplicate!856 acc!681) e!390353)))

(declare-fun b!685382 () Bool)

(declare-fun e!390354 () Bool)

(assert (=> b!685382 (= e!390353 e!390354)))

(declare-fun res!450739 () Bool)

(assert (=> b!685382 (=> (not res!450739) (not e!390354))))

(assert (=> b!685382 (= res!450739 (not (contains!3609 (t!19281 acc!681) (h!14073 acc!681))))))

(declare-fun b!685383 () Bool)

(assert (=> b!685383 (= e!390354 (noDuplicate!856 (t!19281 acc!681)))))

(assert (= (and d!94559 (not res!450738)) b!685382))

(assert (= (and b!685382 res!450739) b!685383))

(declare-fun m!649617 () Bool)

(assert (=> b!685382 m!649617))

(declare-fun m!649619 () Bool)

(assert (=> b!685383 m!649619))

(assert (=> b!685093 d!94559))

(declare-fun d!94561 () Bool)

(declare-fun lt!314632 () Bool)

(assert (=> d!94561 (= lt!314632 (select (content!290 lt!314547) k0!2843))))

(declare-fun e!390356 () Bool)

(assert (=> d!94561 (= lt!314632 e!390356)))

(declare-fun res!450740 () Bool)

(assert (=> d!94561 (=> (not res!450740) (not e!390356))))

(assert (=> d!94561 (= res!450740 ((_ is Cons!13028) lt!314547))))

(assert (=> d!94561 (= (contains!3609 lt!314547 k0!2843) lt!314632)))

(declare-fun b!685384 () Bool)

(declare-fun e!390355 () Bool)

(assert (=> b!685384 (= e!390356 e!390355)))

(declare-fun res!450741 () Bool)

(assert (=> b!685384 (=> res!450741 e!390355)))

(assert (=> b!685384 (= res!450741 (= (h!14073 lt!314547) k0!2843))))

(declare-fun b!685385 () Bool)

(assert (=> b!685385 (= e!390355 (contains!3609 (t!19281 lt!314547) k0!2843))))

(assert (= (and d!94561 res!450740) b!685384))

(assert (= (and b!685384 (not res!450741)) b!685385))

(assert (=> d!94561 m!649549))

(declare-fun m!649621 () Bool)

(assert (=> d!94561 m!649621))

(declare-fun m!649623 () Bool)

(assert (=> b!685385 m!649623))

(assert (=> b!685083 d!94561))

(declare-fun d!94563 () Bool)

(declare-fun lt!314633 () Bool)

(assert (=> d!94563 (= lt!314633 (select (content!290 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390358 () Bool)

(assert (=> d!94563 (= lt!314633 e!390358)))

(declare-fun res!450742 () Bool)

(assert (=> d!94563 (=> (not res!450742) (not e!390358))))

(assert (=> d!94563 (= res!450742 ((_ is Cons!13028) acc!681))))

(assert (=> d!94563 (= (contains!3609 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314633)))

(declare-fun b!685386 () Bool)

(declare-fun e!390357 () Bool)

(assert (=> b!685386 (= e!390358 e!390357)))

(declare-fun res!450743 () Bool)

(assert (=> b!685386 (=> res!450743 e!390357)))

(assert (=> b!685386 (= res!450743 (= (h!14073 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685387 () Bool)

(assert (=> b!685387 (= e!390357 (contains!3609 (t!19281 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94563 res!450742) b!685386))

(assert (= (and b!685386 (not res!450743)) b!685387))

(assert (=> d!94563 m!649445))

(declare-fun m!649625 () Bool)

(assert (=> d!94563 m!649625))

(declare-fun m!649627 () Bool)

(assert (=> b!685387 m!649627))

(assert (=> b!685094 d!94563))

(declare-fun d!94565 () Bool)

(assert (=> d!94565 (= ($colon$colon!360 acc!681 (select (arr!18991 a!3626) from!3004)) (Cons!13028 (select (arr!18991 a!3626) from!3004) acc!681))))

(assert (=> b!685095 d!94565))

(assert (=> b!685095 d!94485))

(declare-fun d!94567 () Bool)

(assert (=> d!94567 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314637 () Unit!24122)

(declare-fun choose!80 (array!39624 List!13032 List!13032 (_ BitVec 32)) Unit!24122)

(assert (=> d!94567 (= lt!314637 (choose!80 a!3626 ($colon$colon!360 acc!681 (select (arr!18991 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94567 (bvslt (size!19360 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94567 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!360 acc!681 (select (arr!18991 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314637)))

(declare-fun bs!20099 () Bool)

(assert (= bs!20099 d!94567))

(assert (=> bs!20099 m!649331))

(assert (=> bs!20099 m!649335))

(declare-fun m!649647 () Bool)

(assert (=> bs!20099 m!649647))

(assert (=> b!685095 d!94567))

(assert (=> b!685095 d!94495))

(assert (=> b!685095 d!94533))

(declare-fun d!94579 () Bool)

(assert (=> d!94579 (= (array_inv!14787 a!3626) (bvsge (size!19360 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61090 d!94579))

(declare-fun d!94581 () Bool)

(declare-fun res!450754 () Bool)

(declare-fun e!390371 () Bool)

(assert (=> d!94581 (=> res!450754 e!390371)))

(assert (=> d!94581 (= res!450754 ((_ is Nil!13029) lt!314547))))

(assert (=> d!94581 (= (noDuplicate!856 lt!314547) e!390371)))

(declare-fun b!685402 () Bool)

(declare-fun e!390372 () Bool)

(assert (=> b!685402 (= e!390371 e!390372)))

(declare-fun res!450755 () Bool)

(assert (=> b!685402 (=> (not res!450755) (not e!390372))))

(assert (=> b!685402 (= res!450755 (not (contains!3609 (t!19281 lt!314547) (h!14073 lt!314547))))))

(declare-fun b!685403 () Bool)

(assert (=> b!685403 (= e!390372 (noDuplicate!856 (t!19281 lt!314547)))))

(assert (= (and d!94581 (not res!450754)) b!685402))

(assert (= (and b!685402 res!450755) b!685403))

(declare-fun m!649649 () Bool)

(assert (=> b!685402 m!649649))

(declare-fun m!649651 () Bool)

(assert (=> b!685403 m!649651))

(assert (=> b!685075 d!94581))

(declare-fun b!685404 () Bool)

(declare-fun e!390376 () Bool)

(assert (=> b!685404 (= e!390376 (contains!3609 Nil!13029 (select (arr!18991 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685405 () Bool)

(declare-fun e!390375 () Bool)

(declare-fun e!390374 () Bool)

(assert (=> b!685405 (= e!390375 e!390374)))

(declare-fun c!77691 () Bool)

(assert (=> b!685405 (= c!77691 (validKeyInArray!0 (select (arr!18991 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685406 () Bool)

(declare-fun call!34074 () Bool)

(assert (=> b!685406 (= e!390374 call!34074)))

(declare-fun b!685407 () Bool)

(assert (=> b!685407 (= e!390374 call!34074)))

(declare-fun bm!34071 () Bool)

(assert (=> bm!34071 (= call!34074 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77691 (Cons!13028 (select (arr!18991 a!3626) #b00000000000000000000000000000000) Nil!13029) Nil!13029)))))

(declare-fun d!94583 () Bool)

(declare-fun res!450756 () Bool)

(declare-fun e!390373 () Bool)

(assert (=> d!94583 (=> res!450756 e!390373)))

(assert (=> d!94583 (= res!450756 (bvsge #b00000000000000000000000000000000 (size!19360 a!3626)))))

(assert (=> d!94583 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13029) e!390373)))

(declare-fun b!685408 () Bool)

(assert (=> b!685408 (= e!390373 e!390375)))

(declare-fun res!450757 () Bool)

(assert (=> b!685408 (=> (not res!450757) (not e!390375))))

(assert (=> b!685408 (= res!450757 (not e!390376))))

(declare-fun res!450758 () Bool)

(assert (=> b!685408 (=> (not res!450758) (not e!390376))))

(assert (=> b!685408 (= res!450758 (validKeyInArray!0 (select (arr!18991 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94583 (not res!450756)) b!685408))

(assert (= (and b!685408 res!450758) b!685404))

(assert (= (and b!685408 res!450757) b!685405))

(assert (= (and b!685405 c!77691) b!685407))

(assert (= (and b!685405 (not c!77691)) b!685406))

(assert (= (or b!685407 b!685406) bm!34071))

(assert (=> b!685404 m!649461))

(assert (=> b!685404 m!649461))

(declare-fun m!649653 () Bool)

(assert (=> b!685404 m!649653))

(assert (=> b!685405 m!649461))

(assert (=> b!685405 m!649461))

(declare-fun m!649655 () Bool)

(assert (=> b!685405 m!649655))

(assert (=> bm!34071 m!649461))

(declare-fun m!649657 () Bool)

(assert (=> bm!34071 m!649657))

(assert (=> b!685408 m!649461))

(assert (=> b!685408 m!649461))

(assert (=> b!685408 m!649655))

(assert (=> b!685086 d!94583))

(declare-fun d!94585 () Bool)

(assert (=> d!94585 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685087 d!94585))

(assert (=> b!685076 d!94481))

(declare-fun b!685409 () Bool)

(declare-fun e!390380 () Bool)

(assert (=> b!685409 (= e!390380 (contains!3609 acc!681 (select (arr!18991 a!3626) from!3004)))))

(declare-fun b!685410 () Bool)

(declare-fun e!390379 () Bool)

(declare-fun e!390378 () Bool)

(assert (=> b!685410 (= e!390379 e!390378)))

(declare-fun c!77692 () Bool)

(assert (=> b!685410 (= c!77692 (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)))))

(declare-fun b!685411 () Bool)

(declare-fun call!34075 () Bool)

(assert (=> b!685411 (= e!390378 call!34075)))

(declare-fun b!685412 () Bool)

(assert (=> b!685412 (= e!390378 call!34075)))

(declare-fun bm!34072 () Bool)

(assert (=> bm!34072 (= call!34075 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77692 (Cons!13028 (select (arr!18991 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!94587 () Bool)

(declare-fun res!450759 () Bool)

(declare-fun e!390377 () Bool)

(assert (=> d!94587 (=> res!450759 e!390377)))

(assert (=> d!94587 (= res!450759 (bvsge from!3004 (size!19360 a!3626)))))

(assert (=> d!94587 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390377)))

(declare-fun b!685413 () Bool)

(assert (=> b!685413 (= e!390377 e!390379)))

(declare-fun res!450760 () Bool)

(assert (=> b!685413 (=> (not res!450760) (not e!390379))))

(assert (=> b!685413 (= res!450760 (not e!390380))))

(declare-fun res!450761 () Bool)

(assert (=> b!685413 (=> (not res!450761) (not e!390380))))

(assert (=> b!685413 (= res!450761 (validKeyInArray!0 (select (arr!18991 a!3626) from!3004)))))

(assert (= (and d!94587 (not res!450759)) b!685413))

(assert (= (and b!685413 res!450761) b!685409))

(assert (= (and b!685413 res!450760) b!685410))

(assert (= (and b!685410 c!77692) b!685412))

(assert (= (and b!685410 (not c!77692)) b!685411))

(assert (= (or b!685412 b!685411) bm!34072))

(assert (=> b!685409 m!649333))

(assert (=> b!685409 m!649333))

(declare-fun m!649661 () Bool)

(assert (=> b!685409 m!649661))

(assert (=> b!685410 m!649333))

(assert (=> b!685410 m!649333))

(assert (=> b!685410 m!649359))

(assert (=> bm!34072 m!649333))

(declare-fun m!649663 () Bool)

(assert (=> bm!34072 m!649663))

(assert (=> b!685413 m!649333))

(assert (=> b!685413 m!649333))

(assert (=> b!685413 m!649359))

(assert (=> b!685077 d!94587))

(check-sat (not b!685405) (not d!94561) (not b!685183) (not b!685212) (not b!685249) (not b!685184) (not b!685311) (not d!94463) (not b!685226) (not d!94567) (not bm!34072) (not b!685385) (not b!685252) (not d!94495) (not b!685383) (not b!685387) (not b!685244) (not d!94479) (not b!685413) (not b!685367) (not bm!34066) (not b!685410) (not b!685403) (not b!685250) (not b!685382) (not d!94523) (not b!685404) (not b!685259) (not d!94503) (not b!685364) (not d!94481) (not b!685402) (not bm!34071) (not d!94563) (not b!685408) (not b!685409) (not bm!34058) (not b!685363))
(check-sat)
