; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115966 () Bool)

(assert start!115966)

(declare-fun b!1370093 () Bool)

(declare-fun res!912820 () Bool)

(declare-fun e!776269 () Bool)

(assert (=> b!1370093 (=> (not res!912820) (not e!776269))))

(declare-datatypes ((List!31999 0))(
  ( (Nil!31996) (Cons!31995 (h!33213 (_ BitVec 64)) (t!46685 List!31999)) )
))
(declare-fun newAcc!98 () List!31999)

(declare-fun acc!866 () List!31999)

(declare-fun subseq!1043 (List!31999 List!31999) Bool)

(assert (=> b!1370093 (= res!912820 (subseq!1043 newAcc!98 acc!866))))

(declare-fun b!1370094 () Bool)

(declare-fun res!912831 () Bool)

(assert (=> b!1370094 (=> (not res!912831) (not e!776269))))

(declare-fun contains!9684 (List!31999 (_ BitVec 64)) Bool)

(assert (=> b!1370094 (= res!912831 (not (contains!9684 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370095 () Bool)

(declare-fun res!912821 () Bool)

(assert (=> b!1370095 (=> (not res!912821) (not e!776269))))

(assert (=> b!1370095 (= res!912821 (not (contains!9684 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370096 () Bool)

(declare-fun e!776267 () Bool)

(declare-fun noDuplicate!2515 (List!31999) Bool)

(assert (=> b!1370096 (= e!776267 (not (noDuplicate!2515 newAcc!98)))))

(declare-datatypes ((array!93049 0))(
  ( (array!93050 (arr!44944 (Array (_ BitVec 32) (_ BitVec 64))) (size!45495 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93049)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93049 (_ BitVec 32) List!31999) Bool)

(assert (=> b!1370096 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45158 0))(
  ( (Unit!45159) )
))
(declare-fun lt!602604 () Unit!45158)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93049 List!31999 List!31999 (_ BitVec 32)) Unit!45158)

(assert (=> b!1370096 (= lt!602604 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1370097 () Bool)

(declare-fun res!912827 () Bool)

(assert (=> b!1370097 (=> (not res!912827) (not e!776267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370097 (= res!912827 (not (validKeyInArray!0 (select (arr!44944 a!3861) from!3239))))))

(declare-fun b!1370098 () Bool)

(declare-fun res!912828 () Bool)

(assert (=> b!1370098 (=> (not res!912828) (not e!776269))))

(assert (=> b!1370098 (= res!912828 (not (contains!9684 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370099 () Bool)

(declare-fun res!912830 () Bool)

(assert (=> b!1370099 (=> (not res!912830) (not e!776267))))

(assert (=> b!1370099 (= res!912830 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun res!912826 () Bool)

(assert (=> start!115966 (=> (not res!912826) (not e!776269))))

(assert (=> start!115966 (= res!912826 (and (bvslt (size!45495 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45495 a!3861))))))

(assert (=> start!115966 e!776269))

(declare-fun array_inv!34225 (array!93049) Bool)

(assert (=> start!115966 (array_inv!34225 a!3861)))

(assert (=> start!115966 true))

(declare-fun b!1370100 () Bool)

(declare-fun res!912823 () Bool)

(assert (=> b!1370100 (=> (not res!912823) (not e!776267))))

(assert (=> b!1370100 (= res!912823 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1370101 () Bool)

(declare-fun res!912825 () Bool)

(assert (=> b!1370101 (=> (not res!912825) (not e!776269))))

(assert (=> b!1370101 (= res!912825 (not (contains!9684 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370102 () Bool)

(declare-fun res!912824 () Bool)

(assert (=> b!1370102 (=> (not res!912824) (not e!776269))))

(assert (=> b!1370102 (= res!912824 (noDuplicate!2515 acc!866))))

(declare-fun b!1370103 () Bool)

(assert (=> b!1370103 (= e!776269 e!776267)))

(declare-fun res!912829 () Bool)

(assert (=> b!1370103 (=> (not res!912829) (not e!776267))))

(assert (=> b!1370103 (= res!912829 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602603 () Unit!45158)

(declare-fun noDuplicateSubseq!230 (List!31999 List!31999) Unit!45158)

(assert (=> b!1370103 (= lt!602603 (noDuplicateSubseq!230 newAcc!98 acc!866))))

(declare-fun b!1370104 () Bool)

(declare-fun res!912822 () Bool)

(assert (=> b!1370104 (=> (not res!912822) (not e!776267))))

(assert (=> b!1370104 (= res!912822 (bvslt from!3239 (size!45495 a!3861)))))

(assert (= (and start!115966 res!912826) b!1370102))

(assert (= (and b!1370102 res!912824) b!1370101))

(assert (= (and b!1370101 res!912825) b!1370098))

(assert (= (and b!1370098 res!912828) b!1370095))

(assert (= (and b!1370095 res!912821) b!1370094))

(assert (= (and b!1370094 res!912831) b!1370093))

(assert (= (and b!1370093 res!912820) b!1370103))

(assert (= (and b!1370103 res!912829) b!1370104))

(assert (= (and b!1370104 res!912822) b!1370097))

(assert (= (and b!1370097 res!912827) b!1370099))

(assert (= (and b!1370099 res!912830) b!1370100))

(assert (= (and b!1370100 res!912823) b!1370096))

(declare-fun m!1254271 () Bool)

(assert (=> b!1370097 m!1254271))

(assert (=> b!1370097 m!1254271))

(declare-fun m!1254273 () Bool)

(assert (=> b!1370097 m!1254273))

(declare-fun m!1254275 () Bool)

(assert (=> b!1370100 m!1254275))

(declare-fun m!1254277 () Bool)

(assert (=> b!1370101 m!1254277))

(declare-fun m!1254279 () Bool)

(assert (=> start!115966 m!1254279))

(declare-fun m!1254281 () Bool)

(assert (=> b!1370096 m!1254281))

(declare-fun m!1254283 () Bool)

(assert (=> b!1370096 m!1254283))

(declare-fun m!1254285 () Bool)

(assert (=> b!1370096 m!1254285))

(declare-fun m!1254287 () Bool)

(assert (=> b!1370098 m!1254287))

(declare-fun m!1254289 () Bool)

(assert (=> b!1370094 m!1254289))

(declare-fun m!1254291 () Bool)

(assert (=> b!1370093 m!1254291))

(declare-fun m!1254293 () Bool)

(assert (=> b!1370103 m!1254293))

(declare-fun m!1254295 () Bool)

(assert (=> b!1370103 m!1254295))

(declare-fun m!1254297 () Bool)

(assert (=> b!1370095 m!1254297))

(declare-fun m!1254299 () Bool)

(assert (=> b!1370102 m!1254299))

(check-sat (not b!1370094) (not b!1370101) (not b!1370103) (not b!1370098) (not b!1370097) (not b!1370100) (not b!1370102) (not start!115966) (not b!1370095) (not b!1370096) (not b!1370093))
(check-sat)
(get-model)

(declare-fun d!147359 () Bool)

(declare-fun res!912908 () Bool)

(declare-fun e!776292 () Bool)

(assert (=> d!147359 (=> res!912908 e!776292)))

(get-info :version)

(assert (=> d!147359 (= res!912908 ((_ is Nil!31996) newAcc!98))))

(assert (=> d!147359 (= (noDuplicate!2515 newAcc!98) e!776292)))

(declare-fun b!1370181 () Bool)

(declare-fun e!776293 () Bool)

(assert (=> b!1370181 (= e!776292 e!776293)))

(declare-fun res!912909 () Bool)

(assert (=> b!1370181 (=> (not res!912909) (not e!776293))))

(assert (=> b!1370181 (= res!912909 (not (contains!9684 (t!46685 newAcc!98) (h!33213 newAcc!98))))))

(declare-fun b!1370182 () Bool)

(assert (=> b!1370182 (= e!776293 (noDuplicate!2515 (t!46685 newAcc!98)))))

(assert (= (and d!147359 (not res!912908)) b!1370181))

(assert (= (and b!1370181 res!912909) b!1370182))

(declare-fun m!1254361 () Bool)

(assert (=> b!1370181 m!1254361))

(declare-fun m!1254363 () Bool)

(assert (=> b!1370182 m!1254363))

(assert (=> b!1370096 d!147359))

(declare-fun b!1370205 () Bool)

(declare-fun e!776315 () Bool)

(declare-fun e!776317 () Bool)

(assert (=> b!1370205 (= e!776315 e!776317)))

(declare-fun c!128086 () Bool)

(assert (=> b!1370205 (= c!128086 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun call!65560 () Bool)

(declare-fun bm!65557 () Bool)

(assert (=> bm!65557 (= call!65560 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128086 (Cons!31995 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun b!1370206 () Bool)

(declare-fun e!776314 () Bool)

(assert (=> b!1370206 (= e!776314 (contains!9684 newAcc!98 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1370208 () Bool)

(declare-fun e!776316 () Bool)

(assert (=> b!1370208 (= e!776316 e!776315)))

(declare-fun res!912928 () Bool)

(assert (=> b!1370208 (=> (not res!912928) (not e!776315))))

(assert (=> b!1370208 (= res!912928 (not e!776314))))

(declare-fun res!912930 () Bool)

(assert (=> b!1370208 (=> (not res!912930) (not e!776314))))

(assert (=> b!1370208 (= res!912930 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1370209 () Bool)

(assert (=> b!1370209 (= e!776317 call!65560)))

(declare-fun b!1370207 () Bool)

(assert (=> b!1370207 (= e!776317 call!65560)))

(declare-fun d!147361 () Bool)

(declare-fun res!912929 () Bool)

(assert (=> d!147361 (=> res!912929 e!776316)))

(assert (=> d!147361 (= res!912929 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45495 a!3861)))))

(assert (=> d!147361 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!776316)))

(assert (= (and d!147361 (not res!912929)) b!1370208))

(assert (= (and b!1370208 res!912930) b!1370206))

(assert (= (and b!1370208 res!912928) b!1370205))

(assert (= (and b!1370205 c!128086) b!1370207))

(assert (= (and b!1370205 (not c!128086)) b!1370209))

(assert (= (or b!1370207 b!1370209) bm!65557))

(declare-fun m!1254373 () Bool)

(assert (=> b!1370205 m!1254373))

(assert (=> b!1370205 m!1254373))

(declare-fun m!1254375 () Bool)

(assert (=> b!1370205 m!1254375))

(assert (=> bm!65557 m!1254373))

(declare-fun m!1254377 () Bool)

(assert (=> bm!65557 m!1254377))

(assert (=> b!1370206 m!1254373))

(assert (=> b!1370206 m!1254373))

(declare-fun m!1254379 () Bool)

(assert (=> b!1370206 m!1254379))

(assert (=> b!1370208 m!1254373))

(assert (=> b!1370208 m!1254373))

(assert (=> b!1370208 m!1254375))

(assert (=> b!1370096 d!147361))

(declare-fun d!147371 () Bool)

(assert (=> d!147371 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602624 () Unit!45158)

(declare-fun choose!80 (array!93049 List!31999 List!31999 (_ BitVec 32)) Unit!45158)

(assert (=> d!147371 (= lt!602624 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147371 (bvslt (size!45495 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147371 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602624)))

(declare-fun bs!39283 () Bool)

(assert (= bs!39283 d!147371))

(assert (=> bs!39283 m!1254283))

(declare-fun m!1254397 () Bool)

(assert (=> bs!39283 m!1254397))

(assert (=> b!1370096 d!147371))

(declare-fun d!147379 () Bool)

(declare-fun lt!602627 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!717 (List!31999) (InoxSet (_ BitVec 64)))

(assert (=> d!147379 (= lt!602627 (select (content!717 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776349 () Bool)

(assert (=> d!147379 (= lt!602627 e!776349)))

(declare-fun res!912956 () Bool)

(assert (=> d!147379 (=> (not res!912956) (not e!776349))))

(assert (=> d!147379 (= res!912956 ((_ is Cons!31995) newAcc!98))))

(assert (=> d!147379 (= (contains!9684 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602627)))

(declare-fun b!1370245 () Bool)

(declare-fun e!776348 () Bool)

(assert (=> b!1370245 (= e!776349 e!776348)))

(declare-fun res!912957 () Bool)

(assert (=> b!1370245 (=> res!912957 e!776348)))

(assert (=> b!1370245 (= res!912957 (= (h!33213 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370246 () Bool)

(assert (=> b!1370246 (= e!776348 (contains!9684 (t!46685 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147379 res!912956) b!1370245))

(assert (= (and b!1370245 (not res!912957)) b!1370246))

(declare-fun m!1254407 () Bool)

(assert (=> d!147379 m!1254407))

(declare-fun m!1254409 () Bool)

(assert (=> d!147379 m!1254409))

(declare-fun m!1254411 () Bool)

(assert (=> b!1370246 m!1254411))

(assert (=> b!1370095 d!147379))

(declare-fun d!147383 () Bool)

(declare-fun lt!602628 () Bool)

(assert (=> d!147383 (= lt!602628 (select (content!717 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776351 () Bool)

(assert (=> d!147383 (= lt!602628 e!776351)))

(declare-fun res!912958 () Bool)

(assert (=> d!147383 (=> (not res!912958) (not e!776351))))

(assert (=> d!147383 (= res!912958 ((_ is Cons!31995) newAcc!98))))

(assert (=> d!147383 (= (contains!9684 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602628)))

(declare-fun b!1370247 () Bool)

(declare-fun e!776350 () Bool)

(assert (=> b!1370247 (= e!776351 e!776350)))

(declare-fun res!912959 () Bool)

(assert (=> b!1370247 (=> res!912959 e!776350)))

(assert (=> b!1370247 (= res!912959 (= (h!33213 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370248 () Bool)

(assert (=> b!1370248 (= e!776350 (contains!9684 (t!46685 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147383 res!912958) b!1370247))

(assert (= (and b!1370247 (not res!912959)) b!1370248))

(assert (=> d!147383 m!1254407))

(declare-fun m!1254413 () Bool)

(assert (=> d!147383 m!1254413))

(declare-fun m!1254415 () Bool)

(assert (=> b!1370248 m!1254415))

(assert (=> b!1370094 d!147383))

(declare-fun d!147385 () Bool)

(declare-fun lt!602629 () Bool)

(assert (=> d!147385 (= lt!602629 (select (content!717 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776353 () Bool)

(assert (=> d!147385 (= lt!602629 e!776353)))

(declare-fun res!912960 () Bool)

(assert (=> d!147385 (=> (not res!912960) (not e!776353))))

(assert (=> d!147385 (= res!912960 ((_ is Cons!31995) acc!866))))

(assert (=> d!147385 (= (contains!9684 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602629)))

(declare-fun b!1370249 () Bool)

(declare-fun e!776352 () Bool)

(assert (=> b!1370249 (= e!776353 e!776352)))

(declare-fun res!912961 () Bool)

(assert (=> b!1370249 (=> res!912961 e!776352)))

(assert (=> b!1370249 (= res!912961 (= (h!33213 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370250 () Bool)

(assert (=> b!1370250 (= e!776352 (contains!9684 (t!46685 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147385 res!912960) b!1370249))

(assert (= (and b!1370249 (not res!912961)) b!1370250))

(declare-fun m!1254417 () Bool)

(assert (=> d!147385 m!1254417))

(declare-fun m!1254419 () Bool)

(assert (=> d!147385 m!1254419))

(declare-fun m!1254421 () Bool)

(assert (=> b!1370250 m!1254421))

(assert (=> b!1370098 d!147385))

(declare-fun d!147387 () Bool)

(assert (=> d!147387 (= (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)) (and (not (= (select (arr!44944 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44944 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1370097 d!147387))

(declare-fun d!147391 () Bool)

(declare-fun lt!602633 () Bool)

(assert (=> d!147391 (= lt!602633 (select (content!717 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776359 () Bool)

(assert (=> d!147391 (= lt!602633 e!776359)))

(declare-fun res!912965 () Bool)

(assert (=> d!147391 (=> (not res!912965) (not e!776359))))

(assert (=> d!147391 (= res!912965 ((_ is Cons!31995) acc!866))))

(assert (=> d!147391 (= (contains!9684 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602633)))

(declare-fun b!1370256 () Bool)

(declare-fun e!776358 () Bool)

(assert (=> b!1370256 (= e!776359 e!776358)))

(declare-fun res!912966 () Bool)

(assert (=> b!1370256 (=> res!912966 e!776358)))

(assert (=> b!1370256 (= res!912966 (= (h!33213 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370257 () Bool)

(assert (=> b!1370257 (= e!776358 (contains!9684 (t!46685 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147391 res!912965) b!1370256))

(assert (= (and b!1370256 (not res!912966)) b!1370257))

(assert (=> d!147391 m!1254417))

(declare-fun m!1254429 () Bool)

(assert (=> d!147391 m!1254429))

(declare-fun m!1254431 () Bool)

(assert (=> b!1370257 m!1254431))

(assert (=> b!1370101 d!147391))

(declare-fun b!1370258 () Bool)

(declare-fun e!776361 () Bool)

(declare-fun e!776363 () Bool)

(assert (=> b!1370258 (= e!776361 e!776363)))

(declare-fun c!128093 () Bool)

(assert (=> b!1370258 (= c!128093 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun bm!65564 () Bool)

(declare-fun call!65567 () Bool)

(assert (=> bm!65564 (= call!65567 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128093 (Cons!31995 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1370259 () Bool)

(declare-fun e!776360 () Bool)

(assert (=> b!1370259 (= e!776360 (contains!9684 acc!866 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1370261 () Bool)

(declare-fun e!776362 () Bool)

(assert (=> b!1370261 (= e!776362 e!776361)))

(declare-fun res!912967 () Bool)

(assert (=> b!1370261 (=> (not res!912967) (not e!776361))))

(assert (=> b!1370261 (= res!912967 (not e!776360))))

(declare-fun res!912969 () Bool)

(assert (=> b!1370261 (=> (not res!912969) (not e!776360))))

(assert (=> b!1370261 (= res!912969 (validKeyInArray!0 (select (arr!44944 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1370262 () Bool)

(assert (=> b!1370262 (= e!776363 call!65567)))

(declare-fun b!1370260 () Bool)

(assert (=> b!1370260 (= e!776363 call!65567)))

(declare-fun d!147395 () Bool)

(declare-fun res!912968 () Bool)

(assert (=> d!147395 (=> res!912968 e!776362)))

(assert (=> d!147395 (= res!912968 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45495 a!3861)))))

(assert (=> d!147395 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!776362)))

(assert (= (and d!147395 (not res!912968)) b!1370261))

(assert (= (and b!1370261 res!912969) b!1370259))

(assert (= (and b!1370261 res!912967) b!1370258))

(assert (= (and b!1370258 c!128093) b!1370260))

(assert (= (and b!1370258 (not c!128093)) b!1370262))

(assert (= (or b!1370260 b!1370262) bm!65564))

(assert (=> b!1370258 m!1254373))

(assert (=> b!1370258 m!1254373))

(assert (=> b!1370258 m!1254375))

(assert (=> bm!65564 m!1254373))

(declare-fun m!1254433 () Bool)

(assert (=> bm!65564 m!1254433))

(assert (=> b!1370259 m!1254373))

(assert (=> b!1370259 m!1254373))

(declare-fun m!1254435 () Bool)

(assert (=> b!1370259 m!1254435))

(assert (=> b!1370261 m!1254373))

(assert (=> b!1370261 m!1254373))

(assert (=> b!1370261 m!1254375))

(assert (=> b!1370100 d!147395))

(declare-fun b!1370290 () Bool)

(declare-fun e!776387 () Bool)

(assert (=> b!1370290 (= e!776387 (subseq!1043 newAcc!98 (t!46685 acc!866)))))

(declare-fun b!1370289 () Bool)

(declare-fun e!776390 () Bool)

(assert (=> b!1370289 (= e!776390 (subseq!1043 (t!46685 newAcc!98) (t!46685 acc!866)))))

(declare-fun d!147399 () Bool)

(declare-fun res!912994 () Bool)

(declare-fun e!776389 () Bool)

(assert (=> d!147399 (=> res!912994 e!776389)))

(assert (=> d!147399 (= res!912994 ((_ is Nil!31996) newAcc!98))))

(assert (=> d!147399 (= (subseq!1043 newAcc!98 acc!866) e!776389)))

(declare-fun b!1370287 () Bool)

(declare-fun e!776388 () Bool)

(assert (=> b!1370287 (= e!776389 e!776388)))

(declare-fun res!912993 () Bool)

(assert (=> b!1370287 (=> (not res!912993) (not e!776388))))

(assert (=> b!1370287 (= res!912993 ((_ is Cons!31995) acc!866))))

(declare-fun b!1370288 () Bool)

(assert (=> b!1370288 (= e!776388 e!776387)))

(declare-fun res!912995 () Bool)

(assert (=> b!1370288 (=> res!912995 e!776387)))

(assert (=> b!1370288 (= res!912995 e!776390)))

(declare-fun res!912992 () Bool)

(assert (=> b!1370288 (=> (not res!912992) (not e!776390))))

(assert (=> b!1370288 (= res!912992 (= (h!33213 newAcc!98) (h!33213 acc!866)))))

(assert (= (and d!147399 (not res!912994)) b!1370287))

(assert (= (and b!1370287 res!912993) b!1370288))

(assert (= (and b!1370288 res!912992) b!1370289))

(assert (= (and b!1370288 (not res!912995)) b!1370290))

(declare-fun m!1254449 () Bool)

(assert (=> b!1370290 m!1254449))

(declare-fun m!1254453 () Bool)

(assert (=> b!1370289 m!1254453))

(assert (=> b!1370093 d!147399))

(declare-fun b!1370299 () Bool)

(declare-fun e!776400 () Bool)

(declare-fun e!776402 () Bool)

(assert (=> b!1370299 (= e!776400 e!776402)))

(declare-fun c!128095 () Bool)

(assert (=> b!1370299 (= c!128095 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(declare-fun bm!65566 () Bool)

(declare-fun call!65569 () Bool)

(assert (=> bm!65566 (= call!65569 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128095 (Cons!31995 (select (arr!44944 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370300 () Bool)

(declare-fun e!776399 () Bool)

(assert (=> b!1370300 (= e!776399 (contains!9684 acc!866 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1370302 () Bool)

(declare-fun e!776401 () Bool)

(assert (=> b!1370302 (= e!776401 e!776400)))

(declare-fun res!913004 () Bool)

(assert (=> b!1370302 (=> (not res!913004) (not e!776400))))

(assert (=> b!1370302 (= res!913004 (not e!776399))))

(declare-fun res!913006 () Bool)

(assert (=> b!1370302 (=> (not res!913006) (not e!776399))))

(assert (=> b!1370302 (= res!913006 (validKeyInArray!0 (select (arr!44944 a!3861) from!3239)))))

(declare-fun b!1370303 () Bool)

(assert (=> b!1370303 (= e!776402 call!65569)))

(declare-fun b!1370301 () Bool)

(assert (=> b!1370301 (= e!776402 call!65569)))

(declare-fun d!147407 () Bool)

(declare-fun res!913005 () Bool)

(assert (=> d!147407 (=> res!913005 e!776401)))

(assert (=> d!147407 (= res!913005 (bvsge from!3239 (size!45495 a!3861)))))

(assert (=> d!147407 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776401)))

(assert (= (and d!147407 (not res!913005)) b!1370302))

(assert (= (and b!1370302 res!913006) b!1370300))

(assert (= (and b!1370302 res!913004) b!1370299))

(assert (= (and b!1370299 c!128095) b!1370301))

(assert (= (and b!1370299 (not c!128095)) b!1370303))

(assert (= (or b!1370301 b!1370303) bm!65566))

(assert (=> b!1370299 m!1254271))

(assert (=> b!1370299 m!1254271))

(assert (=> b!1370299 m!1254273))

(assert (=> bm!65566 m!1254271))

(declare-fun m!1254463 () Bool)

(assert (=> bm!65566 m!1254463))

(assert (=> b!1370300 m!1254271))

(assert (=> b!1370300 m!1254271))

(declare-fun m!1254465 () Bool)

(assert (=> b!1370300 m!1254465))

(assert (=> b!1370302 m!1254271))

(assert (=> b!1370302 m!1254271))

(assert (=> b!1370302 m!1254273))

(assert (=> b!1370103 d!147407))

(declare-fun d!147413 () Bool)

(assert (=> d!147413 (noDuplicate!2515 newAcc!98)))

(declare-fun lt!602646 () Unit!45158)

(declare-fun choose!2003 (List!31999 List!31999) Unit!45158)

(assert (=> d!147413 (= lt!602646 (choose!2003 newAcc!98 acc!866))))

(declare-fun e!776421 () Bool)

(assert (=> d!147413 e!776421))

(declare-fun res!913024 () Bool)

(assert (=> d!147413 (=> (not res!913024) (not e!776421))))

(assert (=> d!147413 (= res!913024 (subseq!1043 newAcc!98 acc!866))))

(assert (=> d!147413 (= (noDuplicateSubseq!230 newAcc!98 acc!866) lt!602646)))

(declare-fun b!1370323 () Bool)

(assert (=> b!1370323 (= e!776421 (noDuplicate!2515 acc!866))))

(assert (= (and d!147413 res!913024) b!1370323))

(assert (=> d!147413 m!1254281))

(declare-fun m!1254483 () Bool)

(assert (=> d!147413 m!1254483))

(assert (=> d!147413 m!1254291))

(assert (=> b!1370323 m!1254299))

(assert (=> b!1370103 d!147413))

(declare-fun d!147427 () Bool)

(assert (=> d!147427 (= (array_inv!34225 a!3861) (bvsge (size!45495 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115966 d!147427))

(declare-fun d!147429 () Bool)

(declare-fun res!913029 () Bool)

(declare-fun e!776426 () Bool)

(assert (=> d!147429 (=> res!913029 e!776426)))

(assert (=> d!147429 (= res!913029 ((_ is Nil!31996) acc!866))))

(assert (=> d!147429 (= (noDuplicate!2515 acc!866) e!776426)))

(declare-fun b!1370327 () Bool)

(declare-fun e!776427 () Bool)

(assert (=> b!1370327 (= e!776426 e!776427)))

(declare-fun res!913030 () Bool)

(assert (=> b!1370327 (=> (not res!913030) (not e!776427))))

(assert (=> b!1370327 (= res!913030 (not (contains!9684 (t!46685 acc!866) (h!33213 acc!866))))))

(declare-fun b!1370329 () Bool)

(assert (=> b!1370329 (= e!776427 (noDuplicate!2515 (t!46685 acc!866)))))

(assert (= (and d!147429 (not res!913029)) b!1370327))

(assert (= (and b!1370327 res!913030) b!1370329))

(declare-fun m!1254485 () Bool)

(assert (=> b!1370327 m!1254485))

(declare-fun m!1254487 () Bool)

(assert (=> b!1370329 m!1254487))

(assert (=> b!1370102 d!147429))

(check-sat (not d!147379) (not b!1370300) (not b!1370258) (not b!1370246) (not b!1370302) (not b!1370299) (not d!147413) (not b!1370323) (not d!147385) (not b!1370329) (not bm!65557) (not b!1370290) (not b!1370250) (not d!147371) (not b!1370182) (not b!1370206) (not b!1370208) (not b!1370257) (not bm!65564) (not b!1370259) (not b!1370205) (not b!1370181) (not b!1370327) (not b!1370261) (not d!147391) (not bm!65566) (not b!1370248) (not b!1370289) (not d!147383))
(check-sat)
