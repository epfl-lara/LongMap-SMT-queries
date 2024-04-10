; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62228 () Bool)

(assert start!62228)

(declare-fun b!697428 () Bool)

(declare-fun res!461356 () Bool)

(declare-fun e!396447 () Bool)

(assert (=> b!697428 (=> (not res!461356) (not e!396447))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39985 0))(
  ( (array!39986 (arr!19152 (Array (_ BitVec 32) (_ BitVec 64))) (size!19537 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39985)

(assert (=> b!697428 (= res!461356 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19537 a!3626))))))

(declare-fun b!697429 () Bool)

(declare-fun res!461362 () Bool)

(assert (=> b!697429 (=> (not res!461362) (not e!396447))))

(declare-fun e!396443 () Bool)

(assert (=> b!697429 (= res!461362 e!396443)))

(declare-fun res!461358 () Bool)

(assert (=> b!697429 (=> res!461358 e!396443)))

(declare-fun e!396442 () Bool)

(assert (=> b!697429 (= res!461358 e!396442)))

(declare-fun res!461351 () Bool)

(assert (=> b!697429 (=> (not res!461351) (not e!396442))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!697429 (= res!461351 (bvsgt from!3004 i!1382))))

(declare-fun res!461346 () Bool)

(assert (=> start!62228 (=> (not res!461346) (not e!396447))))

(assert (=> start!62228 (= res!461346 (and (bvslt (size!19537 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19537 a!3626))))))

(assert (=> start!62228 e!396447))

(assert (=> start!62228 true))

(declare-fun array_inv!14948 (array!39985) Bool)

(assert (=> start!62228 (array_inv!14948 a!3626)))

(declare-fun b!697430 () Bool)

(declare-fun res!461347 () Bool)

(assert (=> b!697430 (=> (not res!461347) (not e!396447))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697430 (= res!461347 (validKeyInArray!0 k!2843))))

(declare-fun b!697431 () Bool)

(declare-fun e!396440 () Bool)

(assert (=> b!697431 (= e!396443 e!396440)))

(declare-fun res!461366 () Bool)

(assert (=> b!697431 (=> (not res!461366) (not e!396440))))

(assert (=> b!697431 (= res!461366 (bvsle from!3004 i!1382))))

(declare-fun b!697432 () Bool)

(declare-datatypes ((List!13193 0))(
  ( (Nil!13190) (Cons!13189 (h!14234 (_ BitVec 64)) (t!19475 List!13193)) )
))
(declare-fun acc!681 () List!13193)

(declare-fun contains!3770 (List!13193 (_ BitVec 64)) Bool)

(assert (=> b!697432 (= e!396442 (contains!3770 acc!681 k!2843))))

(declare-fun b!697433 () Bool)

(declare-fun res!461359 () Bool)

(assert (=> b!697433 (=> (not res!461359) (not e!396447))))

(declare-fun e!396445 () Bool)

(assert (=> b!697433 (= res!461359 e!396445)))

(declare-fun res!461360 () Bool)

(assert (=> b!697433 (=> res!461360 e!396445)))

(declare-fun e!396444 () Bool)

(assert (=> b!697433 (= res!461360 e!396444)))

(declare-fun res!461364 () Bool)

(assert (=> b!697433 (=> (not res!461364) (not e!396444))))

(assert (=> b!697433 (= res!461364 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697434 () Bool)

(declare-fun res!461352 () Bool)

(assert (=> b!697434 (=> (not res!461352) (not e!396447))))

(assert (=> b!697434 (= res!461352 (not (validKeyInArray!0 (select (arr!19152 a!3626) from!3004))))))

(declare-fun b!697435 () Bool)

(assert (=> b!697435 (= e!396444 (contains!3770 acc!681 k!2843))))

(declare-fun b!697436 () Bool)

(declare-fun res!461361 () Bool)

(assert (=> b!697436 (=> (not res!461361) (not e!396447))))

(assert (=> b!697436 (= res!461361 (not (contains!3770 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697437 () Bool)

(assert (=> b!697437 (= e!396440 (not (contains!3770 acc!681 k!2843)))))

(declare-fun b!697438 () Bool)

(declare-fun res!461353 () Bool)

(assert (=> b!697438 (=> (not res!461353) (not e!396447))))

(declare-fun arrayNoDuplicates!0 (array!39985 (_ BitVec 32) List!13193) Bool)

(assert (=> b!697438 (= res!461353 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13190))))

(declare-fun b!697439 () Bool)

(declare-fun res!461357 () Bool)

(assert (=> b!697439 (=> (not res!461357) (not e!396447))))

(assert (=> b!697439 (= res!461357 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697440 () Bool)

(declare-fun res!461350 () Bool)

(assert (=> b!697440 (=> (not res!461350) (not e!396447))))

(assert (=> b!697440 (= res!461350 (not (contains!3770 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697441 () Bool)

(declare-fun res!461354 () Bool)

(assert (=> b!697441 (=> (not res!461354) (not e!396447))))

(declare-fun noDuplicate!1017 (List!13193) Bool)

(assert (=> b!697441 (= res!461354 (noDuplicate!1017 acc!681))))

(declare-fun b!697442 () Bool)

(declare-fun res!461348 () Bool)

(assert (=> b!697442 (=> (not res!461348) (not e!396447))))

(assert (=> b!697442 (= res!461348 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19537 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697443 () Bool)

(declare-fun res!461349 () Bool)

(assert (=> b!697443 (=> (not res!461349) (not e!396447))))

(declare-fun arrayContainsKey!0 (array!39985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697443 (= res!461349 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697444 () Bool)

(declare-fun e!396446 () Bool)

(assert (=> b!697444 (= e!396446 (not (contains!3770 acc!681 k!2843)))))

(declare-fun b!697445 () Bool)

(declare-fun res!461363 () Bool)

(assert (=> b!697445 (=> (not res!461363) (not e!396447))))

(assert (=> b!697445 (= res!461363 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun lt!317152 () array!39985)

(declare-fun b!697446 () Bool)

(assert (=> b!697446 (= e!396447 (not (arrayNoDuplicates!0 lt!317152 from!3004 acc!681)))))

(assert (=> b!697446 (arrayNoDuplicates!0 lt!317152 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (=> b!697446 (= lt!317152 (array!39986 (store (arr!19152 a!3626) i!1382 k!2843) (size!19537 a!3626)))))

(declare-datatypes ((Unit!24576 0))(
  ( (Unit!24577) )
))
(declare-fun lt!317151 () Unit!24576)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39985 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13193) Unit!24576)

(assert (=> b!697446 (= lt!317151 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697447 () Bool)

(assert (=> b!697447 (= e!396445 e!396446)))

(declare-fun res!461365 () Bool)

(assert (=> b!697447 (=> (not res!461365) (not e!396446))))

(assert (=> b!697447 (= res!461365 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697448 () Bool)

(declare-fun res!461355 () Bool)

(assert (=> b!697448 (=> (not res!461355) (not e!396447))))

(assert (=> b!697448 (= res!461355 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (= (and start!62228 res!461346) b!697441))

(assert (= (and b!697441 res!461354) b!697440))

(assert (= (and b!697440 res!461350) b!697436))

(assert (= (and b!697436 res!461361) b!697429))

(assert (= (and b!697429 res!461351) b!697432))

(assert (= (and b!697429 (not res!461358)) b!697431))

(assert (= (and b!697431 res!461366) b!697437))

(assert (= (and b!697429 res!461362) b!697438))

(assert (= (and b!697438 res!461353) b!697445))

(assert (= (and b!697445 res!461363) b!697428))

(assert (= (and b!697428 res!461356) b!697430))

(assert (= (and b!697430 res!461347) b!697443))

(assert (= (and b!697443 res!461349) b!697442))

(assert (= (and b!697442 res!461348) b!697434))

(assert (= (and b!697434 res!461352) b!697448))

(assert (= (and b!697448 res!461355) b!697433))

(assert (= (and b!697433 res!461364) b!697435))

(assert (= (and b!697433 (not res!461360)) b!697447))

(assert (= (and b!697447 res!461365) b!697444))

(assert (= (and b!697433 res!461359) b!697439))

(assert (= (and b!697439 res!461357) b!697446))

(declare-fun m!657845 () Bool)

(assert (=> b!697436 m!657845))

(declare-fun m!657847 () Bool)

(assert (=> b!697445 m!657847))

(declare-fun m!657849 () Bool)

(assert (=> b!697432 m!657849))

(declare-fun m!657851 () Bool)

(assert (=> b!697441 m!657851))

(declare-fun m!657853 () Bool)

(assert (=> b!697440 m!657853))

(declare-fun m!657855 () Bool)

(assert (=> b!697438 m!657855))

(declare-fun m!657857 () Bool)

(assert (=> b!697446 m!657857))

(declare-fun m!657859 () Bool)

(assert (=> b!697446 m!657859))

(declare-fun m!657861 () Bool)

(assert (=> b!697446 m!657861))

(declare-fun m!657863 () Bool)

(assert (=> b!697446 m!657863))

(declare-fun m!657865 () Bool)

(assert (=> b!697439 m!657865))

(declare-fun m!657867 () Bool)

(assert (=> b!697430 m!657867))

(assert (=> b!697437 m!657849))

(assert (=> b!697435 m!657849))

(declare-fun m!657869 () Bool)

(assert (=> b!697443 m!657869))

(declare-fun m!657871 () Bool)

(assert (=> b!697434 m!657871))

(assert (=> b!697434 m!657871))

(declare-fun m!657873 () Bool)

(assert (=> b!697434 m!657873))

(assert (=> b!697444 m!657849))

(declare-fun m!657875 () Bool)

(assert (=> start!62228 m!657875))

(push 1)

(assert (not b!697436))

(assert (not b!697434))

(assert (not b!697439))

(assert (not b!697437))

(assert (not b!697438))

(assert (not b!697440))

(assert (not b!697432))

(assert (not b!697430))

(assert (not b!697441))

(assert (not b!697435))

(assert (not start!62228))

(assert (not b!697445))

(assert (not b!697444))

(assert (not b!697446))

(assert (not b!697443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!697676 () Bool)

(declare-fun e!396586 () Bool)

(declare-fun e!396583 () Bool)

(assert (=> b!697676 (= e!396586 e!396583)))

(declare-fun res!461566 () Bool)

(assert (=> b!697676 (=> (not res!461566) (not e!396583))))

(declare-fun e!396585 () Bool)

(assert (=> b!697676 (= res!461566 (not e!396585))))

(declare-fun res!461568 () Bool)

(assert (=> b!697676 (=> (not res!461568) (not e!396585))))

(assert (=> b!697676 (= res!461568 (validKeyInArray!0 (select (arr!19152 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697677 () Bool)

(declare-fun e!396584 () Bool)

(assert (=> b!697677 (= e!396583 e!396584)))

(declare-fun c!78422 () Bool)

(assert (=> b!697677 (= c!78422 (validKeyInArray!0 (select (arr!19152 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!96185 () Bool)

(declare-fun res!461567 () Bool)

(assert (=> d!96185 (=> res!461567 e!396586)))

(assert (=> d!96185 (= res!461567 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19537 a!3626)))))

(assert (=> d!96185 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396586)))

(declare-fun b!697678 () Bool)

(declare-fun call!34328 () Bool)

(assert (=> b!697678 (= e!396584 call!34328)))

(declare-fun bm!34325 () Bool)

(assert (=> bm!34325 (= call!34328 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78422 (Cons!13189 (select (arr!19152 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!697679 () Bool)

(assert (=> b!697679 (= e!396585 (contains!3770 acc!681 (select (arr!19152 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!697680 () Bool)

(assert (=> b!697680 (= e!396584 call!34328)))

(assert (= (and d!96185 (not res!461567)) b!697676))

(assert (= (and b!697676 res!461568) b!697679))

(assert (= (and b!697676 res!461566) b!697677))

(assert (= (and b!697677 c!78422) b!697678))

(assert (= (and b!697677 (not c!78422)) b!697680))

(assert (= (or b!697678 b!697680) bm!34325))

(declare-fun m!658027 () Bool)

(assert (=> b!697676 m!658027))

(assert (=> b!697676 m!658027))

(declare-fun m!658029 () Bool)

(assert (=> b!697676 m!658029))

(assert (=> b!697677 m!658027))

(assert (=> b!697677 m!658027))

(assert (=> b!697677 m!658029))

(assert (=> bm!34325 m!658027))

(declare-fun m!658031 () Bool)

(assert (=> bm!34325 m!658031))

(assert (=> b!697679 m!658027))

