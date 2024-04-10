; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62658 () Bool)

(assert start!62658)

(declare-fun b!707546 () Bool)

(declare-fun res!471370 () Bool)

(declare-fun e!398112 () Bool)

(assert (=> b!707546 (=> (not res!471370) (not e!398112))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707546 (= res!471370 (validKeyInArray!0 k!2824))))

(declare-fun res!471358 () Bool)

(assert (=> start!62658 (=> (not res!471358) (not e!398112))))

(declare-datatypes ((array!40337 0))(
  ( (array!40338 (arr!19325 (Array (_ BitVec 32) (_ BitVec 64))) (size!19710 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40337)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62658 (= res!471358 (and (bvslt (size!19710 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19710 a!3591))))))

(assert (=> start!62658 e!398112))

(assert (=> start!62658 true))

(declare-fun array_inv!15121 (array!40337) Bool)

(assert (=> start!62658 (array_inv!15121 a!3591)))

(declare-fun b!707547 () Bool)

(declare-fun res!471356 () Bool)

(assert (=> b!707547 (=> (not res!471356) (not e!398112))))

(declare-datatypes ((List!13366 0))(
  ( (Nil!13363) (Cons!13362 (h!14407 (_ BitVec 64)) (t!19648 List!13366)) )
))
(declare-fun acc!652 () List!13366)

(declare-fun arrayNoDuplicates!0 (array!40337 (_ BitVec 32) List!13366) Bool)

(assert (=> b!707547 (= res!471356 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707548 () Bool)

(declare-fun noDuplicate!1190 (List!13366) Bool)

(declare-fun $colon$colon!499 (List!13366 (_ BitVec 64)) List!13366)

(assert (=> b!707548 (= e!398112 (not (noDuplicate!1190 ($colon$colon!499 acc!652 (select (arr!19325 a!3591) from!2969)))))))

(declare-fun b!707549 () Bool)

(declare-fun res!471362 () Bool)

(assert (=> b!707549 (=> (not res!471362) (not e!398112))))

(declare-fun newAcc!49 () List!13366)

(declare-fun subseq!388 (List!13366 List!13366) Bool)

(assert (=> b!707549 (= res!471362 (subseq!388 acc!652 newAcc!49))))

(declare-fun b!707550 () Bool)

(declare-fun res!471360 () Bool)

(assert (=> b!707550 (=> (not res!471360) (not e!398112))))

(assert (=> b!707550 (= res!471360 (validKeyInArray!0 (select (arr!19325 a!3591) from!2969)))))

(declare-fun b!707551 () Bool)

(declare-fun res!471363 () Bool)

(assert (=> b!707551 (=> (not res!471363) (not e!398112))))

(declare-fun contains!3943 (List!13366 (_ BitVec 64)) Bool)

(assert (=> b!707551 (= res!471363 (not (contains!3943 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707552 () Bool)

(declare-fun res!471371 () Bool)

(assert (=> b!707552 (=> (not res!471371) (not e!398112))))

(assert (=> b!707552 (= res!471371 (not (contains!3943 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707553 () Bool)

(declare-fun res!471368 () Bool)

(assert (=> b!707553 (=> (not res!471368) (not e!398112))))

(assert (=> b!707553 (= res!471368 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707554 () Bool)

(declare-fun res!471365 () Bool)

(assert (=> b!707554 (=> (not res!471365) (not e!398112))))

(assert (=> b!707554 (= res!471365 (not (contains!3943 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707555 () Bool)

(declare-fun res!471361 () Bool)

(assert (=> b!707555 (=> (not res!471361) (not e!398112))))

(assert (=> b!707555 (= res!471361 (noDuplicate!1190 newAcc!49))))

(declare-fun b!707556 () Bool)

(declare-fun res!471372 () Bool)

(assert (=> b!707556 (=> (not res!471372) (not e!398112))))

(declare-fun arrayContainsKey!0 (array!40337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707556 (= res!471372 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707557 () Bool)

(declare-fun res!471367 () Bool)

(assert (=> b!707557 (=> (not res!471367) (not e!398112))))

(declare-fun -!353 (List!13366 (_ BitVec 64)) List!13366)

(assert (=> b!707557 (= res!471367 (= (-!353 newAcc!49 k!2824) acc!652))))

(declare-fun b!707558 () Bool)

(declare-fun res!471364 () Bool)

(assert (=> b!707558 (=> (not res!471364) (not e!398112))))

(assert (=> b!707558 (= res!471364 (noDuplicate!1190 acc!652))))

(declare-fun b!707559 () Bool)

(declare-fun res!471366 () Bool)

(assert (=> b!707559 (=> (not res!471366) (not e!398112))))

(assert (=> b!707559 (= res!471366 (not (contains!3943 acc!652 k!2824)))))

(declare-fun b!707560 () Bool)

(declare-fun res!471369 () Bool)

(assert (=> b!707560 (=> (not res!471369) (not e!398112))))

(assert (=> b!707560 (= res!471369 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19710 a!3591)))))

(declare-fun b!707561 () Bool)

(declare-fun res!471357 () Bool)

(assert (=> b!707561 (=> (not res!471357) (not e!398112))))

(assert (=> b!707561 (= res!471357 (contains!3943 newAcc!49 k!2824))))

(declare-fun b!707562 () Bool)

(declare-fun res!471359 () Bool)

(assert (=> b!707562 (=> (not res!471359) (not e!398112))))

(assert (=> b!707562 (= res!471359 (not (contains!3943 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62658 res!471358) b!707558))

(assert (= (and b!707558 res!471364) b!707555))

(assert (= (and b!707555 res!471361) b!707554))

(assert (= (and b!707554 res!471365) b!707562))

(assert (= (and b!707562 res!471359) b!707556))

(assert (= (and b!707556 res!471372) b!707559))

(assert (= (and b!707559 res!471366) b!707546))

(assert (= (and b!707546 res!471370) b!707547))

(assert (= (and b!707547 res!471356) b!707549))

(assert (= (and b!707549 res!471362) b!707561))

(assert (= (and b!707561 res!471357) b!707557))

(assert (= (and b!707557 res!471367) b!707551))

(assert (= (and b!707551 res!471363) b!707552))

(assert (= (and b!707552 res!471371) b!707560))

(assert (= (and b!707560 res!471369) b!707550))

(assert (= (and b!707550 res!471360) b!707553))

(assert (= (and b!707553 res!471368) b!707548))

(declare-fun m!665083 () Bool)

(assert (=> b!707546 m!665083))

(declare-fun m!665085 () Bool)

(assert (=> b!707557 m!665085))

(declare-fun m!665087 () Bool)

(assert (=> b!707562 m!665087))

(declare-fun m!665089 () Bool)

(assert (=> b!707552 m!665089))

(declare-fun m!665091 () Bool)

(assert (=> b!707555 m!665091))

(declare-fun m!665093 () Bool)

(assert (=> b!707551 m!665093))

(declare-fun m!665095 () Bool)

(assert (=> b!707554 m!665095))

(declare-fun m!665097 () Bool)

(assert (=> b!707549 m!665097))

(declare-fun m!665099 () Bool)

(assert (=> b!707550 m!665099))

(assert (=> b!707550 m!665099))

(declare-fun m!665101 () Bool)

(assert (=> b!707550 m!665101))

(declare-fun m!665103 () Bool)

(assert (=> b!707556 m!665103))

(declare-fun m!665105 () Bool)

(assert (=> b!707559 m!665105))

(declare-fun m!665107 () Bool)

(assert (=> b!707561 m!665107))

(declare-fun m!665109 () Bool)

(assert (=> b!707558 m!665109))

(declare-fun m!665111 () Bool)

(assert (=> start!62658 m!665111))

(assert (=> b!707548 m!665099))

(assert (=> b!707548 m!665099))

(declare-fun m!665113 () Bool)

(assert (=> b!707548 m!665113))

(assert (=> b!707548 m!665113))

(declare-fun m!665115 () Bool)

(assert (=> b!707548 m!665115))

(declare-fun m!665117 () Bool)

(assert (=> b!707547 m!665117))

(push 1)

(assert (not b!707559))

(assert (not b!707558))

(assert (not b!707557))

(assert (not b!707550))

(assert (not b!707555))

(assert (not b!707546))

(assert (not b!707547))

(assert (not b!707549))

(assert (not b!707561))

(assert (not b!707562))

(assert (not start!62658))

(assert (not b!707552))

(assert (not b!707554))

(assert (not b!707548))

(assert (not b!707551))

(assert (not b!707556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96507 () Bool)

(declare-fun lt!318006 () Bool)

(declare-fun content!333 (List!13366) (Set (_ BitVec 64)))

(assert (=> d!96507 (= lt!318006 (member k!2824 (content!333 newAcc!49)))))

(declare-fun e!398152 () Bool)

(assert (=> d!96507 (= lt!318006 e!398152)))

(declare-fun res!471409 () Bool)

(assert (=> d!96507 (=> (not res!471409) (not e!398152))))

(assert (=> d!96507 (= res!471409 (is-Cons!13362 newAcc!49))))

(assert (=> d!96507 (= (contains!3943 newAcc!49 k!2824) lt!318006)))

(declare-fun b!707603 () Bool)

(declare-fun e!398153 () Bool)

(assert (=> b!707603 (= e!398152 e!398153)))

(declare-fun res!471410 () Bool)

(assert (=> b!707603 (=> res!471410 e!398153)))

(assert (=> b!707603 (= res!471410 (= (h!14407 newAcc!49) k!2824))))

(declare-fun b!707604 () Bool)

(assert (=> b!707604 (= e!398153 (contains!3943 (t!19648 newAcc!49) k!2824))))

(assert (= (and d!96507 res!471409) b!707603))

(assert (= (and b!707603 (not res!471410)) b!707604))

(declare-fun m!665133 () Bool)

(assert (=> d!96507 m!665133))

(declare-fun m!665135 () Bool)

(assert (=> d!96507 m!665135))

(declare-fun m!665137 () Bool)

(assert (=> b!707604 m!665137))

(assert (=> b!707561 d!96507))

(declare-fun d!96519 () Bool)

(assert (=> d!96519 (= (array_inv!15121 a!3591) (bvsge (size!19710 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62658 d!96519))

(declare-fun d!96521 () Bool)

(assert (=> d!96521 (= (validKeyInArray!0 (select (arr!19325 a!3591) from!2969)) (and (not (= (select (arr!19325 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19325 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707550 d!96521))

(declare-fun b!707645 () Bool)

(declare-fun e!398189 () Bool)

(assert (=> b!707645 (= e!398189 (subseq!388 acc!652 (t!19648 newAcc!49)))))

(declare-fun b!707643 () Bool)

(declare-fun e!398190 () Bool)

(assert (=> b!707643 (= e!398190 e!398189)))

(declare-fun res!471445 () Bool)

(assert (=> b!707643 (=> res!471445 e!398189)))

(declare-fun e!398191 () Bool)

(assert (=> b!707643 (= res!471445 e!398191)))

(declare-fun res!471442 () Bool)

(assert (=> b!707643 (=> (not res!471442) (not e!398191))))

(assert (=> b!707643 (= res!471442 (= (h!14407 acc!652) (h!14407 newAcc!49)))))

(declare-fun b!707642 () Bool)

(declare-fun e!398188 () Bool)

(assert (=> b!707642 (= e!398188 e!398190)))

(declare-fun res!471443 () Bool)

(assert (=> b!707642 (=> (not res!471443) (not e!398190))))

(assert (=> b!707642 (= res!471443 (is-Cons!13362 newAcc!49))))

(declare-fun d!96525 () Bool)

(declare-fun res!471444 () Bool)

(assert (=> d!96525 (=> res!471444 e!398188)))

(assert (=> d!96525 (= res!471444 (is-Nil!13363 acc!652))))

(assert (=> d!96525 (= (subseq!388 acc!652 newAcc!49) e!398188)))

(declare-fun b!707644 () Bool)

(assert (=> b!707644 (= e!398191 (subseq!388 (t!19648 acc!652) (t!19648 newAcc!49)))))

(assert (= (and d!96525 (not res!471444)) b!707642))

(assert (= (and b!707642 res!471443) b!707643))

(assert (= (and b!707643 res!471442) b!707644))

(assert (= (and b!707643 (not res!471445)) b!707645))

(declare-fun m!665149 () Bool)

(assert (=> b!707645 m!665149))

(declare-fun m!665151 () Bool)

(assert (=> b!707644 m!665151))

(assert (=> b!707549 d!96525))

(declare-fun d!96529 () Bool)

(declare-fun lt!318010 () Bool)

(assert (=> d!96529 (= lt!318010 (member k!2824 (content!333 acc!652)))))

(declare-fun e!398192 () Bool)

(assert (=> d!96529 (= lt!318010 e!398192)))

(declare-fun res!471446 () Bool)

(assert (=> d!96529 (=> (not res!471446) (not e!398192))))

(assert (=> d!96529 (= res!471446 (is-Cons!13362 acc!652))))

(assert (=> d!96529 (= (contains!3943 acc!652 k!2824) lt!318010)))

(declare-fun b!707646 () Bool)

(declare-fun e!398193 () Bool)

(assert (=> b!707646 (= e!398192 e!398193)))

(declare-fun res!471447 () Bool)

(assert (=> b!707646 (=> res!471447 e!398193)))

(assert (=> b!707646 (= res!471447 (= (h!14407 acc!652) k!2824))))

(declare-fun b!707647 () Bool)

(assert (=> b!707647 (= e!398193 (contains!3943 (t!19648 acc!652) k!2824))))

(assert (= (and d!96529 res!471446) b!707646))

(assert (= (and b!707646 (not res!471447)) b!707647))

(declare-fun m!665153 () Bool)

(assert (=> d!96529 m!665153))

(declare-fun m!665155 () Bool)

(assert (=> d!96529 m!665155))

(declare-fun m!665157 () Bool)

(assert (=> b!707647 m!665157))

(assert (=> b!707559 d!96529))

(declare-fun d!96531 () Bool)

(declare-fun lt!318011 () Bool)

(assert (=> d!96531 (= lt!318011 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!333 newAcc!49)))))

(declare-fun e!398202 () Bool)

(assert (=> d!96531 (= lt!318011 e!398202)))

(declare-fun res!471455 () Bool)

(assert (=> d!96531 (=> (not res!471455) (not e!398202))))

(assert (=> d!96531 (= res!471455 (is-Cons!13362 newAcc!49))))

(assert (=> d!96531 (= (contains!3943 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318011)))

(declare-fun b!707657 () Bool)

(declare-fun e!398203 () Bool)

(assert (=> b!707657 (= e!398202 e!398203)))

(declare-fun res!471456 () Bool)

(assert (=> b!707657 (=> res!471456 e!398203)))

(assert (=> b!707657 (= res!471456 (= (h!14407 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707658 () Bool)

(assert (=> b!707658 (= e!398203 (contains!3943 (t!19648 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96531 res!471455) b!707657))

(assert (= (and b!707657 (not res!471456)) b!707658))

(assert (=> d!96531 m!665133))

(declare-fun m!665163 () Bool)

(assert (=> d!96531 m!665163))

(declare-fun m!665165 () Bool)

(assert (=> b!707658 m!665165))

(assert (=> b!707552 d!96531))

(declare-fun d!96535 () Bool)

(declare-fun lt!318013 () Bool)

(assert (=> d!96535 (= lt!318013 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!333 newAcc!49)))))

(declare-fun e!398206 () Bool)

(assert (=> d!96535 (= lt!318013 e!398206)))

(declare-fun res!471459 () Bool)

(assert (=> d!96535 (=> (not res!471459) (not e!398206))))

(assert (=> d!96535 (= res!471459 (is-Cons!13362 newAcc!49))))

(assert (=> d!96535 (= (contains!3943 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318013)))

(declare-fun b!707661 () Bool)

(declare-fun e!398207 () Bool)

(assert (=> b!707661 (= e!398206 e!398207)))

(declare-fun res!471460 () Bool)

(assert (=> b!707661 (=> res!471460 e!398207)))

(assert (=> b!707661 (= res!471460 (= (h!14407 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707662 () Bool)

(assert (=> b!707662 (= e!398207 (contains!3943 (t!19648 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96535 res!471459) b!707661))

(assert (= (and b!707661 (not res!471460)) b!707662))

(assert (=> d!96535 m!665133))

(declare-fun m!665181 () Bool)

(assert (=> d!96535 m!665181))

(declare-fun m!665183 () Bool)

(assert (=> b!707662 m!665183))

(assert (=> b!707551 d!96535))

(declare-fun d!96543 () Bool)

(declare-fun lt!318016 () Bool)

(assert (=> d!96543 (= lt!318016 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!333 acc!652)))))

(declare-fun e!398212 () Bool)

(assert (=> d!96543 (= lt!318016 e!398212)))

(declare-fun res!471465 () Bool)

(assert (=> d!96543 (=> (not res!471465) (not e!398212))))

(assert (=> d!96543 (= res!471465 (is-Cons!13362 acc!652))))

(assert (=> d!96543 (= (contains!3943 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318016)))

(declare-fun b!707667 () Bool)

(declare-fun e!398213 () Bool)

(assert (=> b!707667 (= e!398212 e!398213)))

(declare-fun res!471466 () Bool)

(assert (=> b!707667 (=> res!471466 e!398213)))

(assert (=> b!707667 (= res!471466 (= (h!14407 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707668 () Bool)

(assert (=> b!707668 (= e!398213 (contains!3943 (t!19648 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96543 res!471465) b!707667))

(assert (= (and b!707667 (not res!471466)) b!707668))

(assert (=> d!96543 m!665153))

(declare-fun m!665189 () Bool)

(assert (=> d!96543 m!665189))

(declare-fun m!665193 () Bool)

(assert (=> b!707668 m!665193))

(assert (=> b!707562 d!96543))

(declare-fun d!96549 () Bool)

(declare-fun res!471483 () Bool)

(declare-fun e!398230 () Bool)

(assert (=> d!96549 (=> res!471483 e!398230)))

(assert (=> d!96549 (= res!471483 (= (select (arr!19325 a!3591) from!2969) k!2824))))

(assert (=> d!96549 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!398230)))

(declare-fun b!707685 () Bool)

(declare-fun e!398231 () Bool)

(assert (=> b!707685 (= e!398230 e!398231)))

(declare-fun res!471484 () Bool)

(assert (=> b!707685 (=> (not res!471484) (not e!398231))))

(assert (=> b!707685 (= res!471484 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19710 a!3591)))))

(declare-fun b!707686 () Bool)

(assert (=> b!707686 (= e!398231 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96549 (not res!471483)) b!707685))

(assert (= (and b!707685 res!471484) b!707686))

(assert (=> d!96549 m!665099))

(declare-fun m!665199 () Bool)

(assert (=> b!707686 m!665199))

(assert (=> b!707556 d!96549))

(declare-fun d!96553 () Bool)

(declare-fun res!471509 () Bool)

(declare-fun e!398256 () Bool)

(assert (=> d!96553 (=> res!471509 e!398256)))

(assert (=> d!96553 (= res!471509 (is-Nil!13363 newAcc!49))))

(assert (=> d!96553 (= (noDuplicate!1190 newAcc!49) e!398256)))

(declare-fun b!707711 () Bool)

(declare-fun e!398257 () Bool)

(assert (=> b!707711 (= e!398256 e!398257)))

(declare-fun res!471510 () Bool)

(assert (=> b!707711 (=> (not res!471510) (not e!398257))))

(assert (=> b!707711 (= res!471510 (not (contains!3943 (t!19648 newAcc!49) (h!14407 newAcc!49))))))

(declare-fun b!707712 () Bool)

(assert (=> b!707712 (= e!398257 (noDuplicate!1190 (t!19648 newAcc!49)))))

(assert (= (and d!96553 (not res!471509)) b!707711))

(assert (= (and b!707711 res!471510) b!707712))

(declare-fun m!665237 () Bool)

(assert (=> b!707711 m!665237))

(declare-fun m!665239 () Bool)

(assert (=> b!707712 m!665239))

(assert (=> b!707555 d!96553))

(declare-fun d!96577 () Bool)

(declare-fun lt!318025 () Bool)

(assert (=> d!96577 (= lt!318025 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!333 acc!652)))))

(declare-fun e!398258 () Bool)

(assert (=> d!96577 (= lt!318025 e!398258)))

(declare-fun res!471511 () Bool)

(assert (=> d!96577 (=> (not res!471511) (not e!398258))))

(assert (=> d!96577 (= res!471511 (is-Cons!13362 acc!652))))

(assert (=> d!96577 (= (contains!3943 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318025)))

(declare-fun b!707713 () Bool)

(declare-fun e!398259 () Bool)

(assert (=> b!707713 (= e!398258 e!398259)))

(declare-fun res!471512 () Bool)

(assert (=> b!707713 (=> res!471512 e!398259)))

(assert (=> b!707713 (= res!471512 (= (h!14407 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707714 () Bool)

(assert (=> b!707714 (= e!398259 (contains!3943 (t!19648 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96577 res!471511) b!707713))

(assert (= (and b!707713 (not res!471512)) b!707714))

(assert (=> d!96577 m!665153))

(declare-fun m!665241 () Bool)

(assert (=> d!96577 m!665241))

(declare-fun m!665243 () Bool)

