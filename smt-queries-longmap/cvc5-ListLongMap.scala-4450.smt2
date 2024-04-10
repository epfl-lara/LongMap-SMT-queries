; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61802 () Bool)

(assert start!61802)

(declare-fun b!692091 () Bool)

(declare-fun e!393742 () Bool)

(declare-fun e!393746 () Bool)

(assert (=> b!692091 (= e!393742 e!393746)))

(declare-fun res!456379 () Bool)

(assert (=> b!692091 (=> (not res!456379) (not e!393746))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39823 0))(
  ( (array!39824 (arr!19080 (Array (_ BitVec 32) (_ BitVec 64))) (size!19465 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39823)

(assert (=> b!692091 (= res!456379 (and (not (= (select (arr!19080 a!3626) from!3004) k!2843)) (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!24438 0))(
  ( (Unit!24439) )
))
(declare-fun lt!316543 () Unit!24438)

(declare-fun e!393747 () Unit!24438)

(assert (=> b!692091 (= lt!316543 e!393747)))

(declare-fun c!78224 () Bool)

(assert (=> b!692091 (= c!78224 (= (select (arr!19080 a!3626) from!3004) k!2843))))

(declare-fun b!692092 () Bool)

(declare-fun res!456384 () Bool)

(assert (=> b!692092 (=> (not res!456384) (not e!393742))))

(declare-datatypes ((List!13121 0))(
  ( (Nil!13118) (Cons!13117 (h!14162 (_ BitVec 64)) (t!19388 List!13121)) )
))
(declare-fun arrayNoDuplicates!0 (array!39823 (_ BitVec 32) List!13121) Bool)

(assert (=> b!692092 (= res!456384 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13118))))

(declare-fun b!692094 () Bool)

(declare-fun Unit!24440 () Unit!24438)

(assert (=> b!692094 (= e!393747 Unit!24440)))

(declare-fun arrayContainsKey!0 (array!39823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692094 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316542 () Unit!24438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39823 (_ BitVec 64) (_ BitVec 32)) Unit!24438)

(assert (=> b!692094 (= lt!316542 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692094 false))

(declare-fun b!692095 () Bool)

(declare-fun res!456391 () Bool)

(assert (=> b!692095 (=> (not res!456391) (not e!393742))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692095 (= res!456391 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19465 a!3626))))))

(declare-fun b!692096 () Bool)

(declare-fun Unit!24441 () Unit!24438)

(assert (=> b!692096 (= e!393747 Unit!24441)))

(declare-fun b!692097 () Bool)

(declare-fun res!456387 () Bool)

(assert (=> b!692097 (=> (not res!456387) (not e!393742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692097 (= res!456387 (validKeyInArray!0 (select (arr!19080 a!3626) from!3004)))))

(declare-fun b!692098 () Bool)

(declare-fun e!393743 () Bool)

(declare-fun acc!681 () List!13121)

(declare-fun contains!3698 (List!13121 (_ BitVec 64)) Bool)

(assert (=> b!692098 (= e!393743 (not (contains!3698 acc!681 k!2843)))))

(declare-fun b!692099 () Bool)

(declare-fun res!456392 () Bool)

(assert (=> b!692099 (=> (not res!456392) (not e!393742))))

(declare-fun e!393741 () Bool)

(assert (=> b!692099 (= res!456392 e!393741)))

(declare-fun res!456383 () Bool)

(assert (=> b!692099 (=> res!456383 e!393741)))

(declare-fun e!393745 () Bool)

(assert (=> b!692099 (= res!456383 e!393745)))

(declare-fun res!456389 () Bool)

(assert (=> b!692099 (=> (not res!456389) (not e!393745))))

(assert (=> b!692099 (= res!456389 (bvsgt from!3004 i!1382))))

(declare-fun b!692100 () Bool)

(declare-fun res!456380 () Bool)

(assert (=> b!692100 (=> (not res!456380) (not e!393742))))

(assert (=> b!692100 (= res!456380 (not (contains!3698 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692101 () Bool)

(declare-fun noDuplicate!945 (List!13121) Bool)

(declare-fun $colon$colon!410 (List!13121 (_ BitVec 64)) List!13121)

(assert (=> b!692101 (= e!393746 (not (noDuplicate!945 ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004)))))))

(declare-fun b!692102 () Bool)

(declare-fun res!456390 () Bool)

(assert (=> b!692102 (=> (not res!456390) (not e!393742))))

(assert (=> b!692102 (= res!456390 (validKeyInArray!0 k!2843))))

(declare-fun b!692093 () Bool)

(declare-fun res!456377 () Bool)

(assert (=> b!692093 (=> (not res!456377) (not e!393742))))

(assert (=> b!692093 (= res!456377 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!456378 () Bool)

(assert (=> start!61802 (=> (not res!456378) (not e!393742))))

(assert (=> start!61802 (= res!456378 (and (bvslt (size!19465 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19465 a!3626))))))

(assert (=> start!61802 e!393742))

(assert (=> start!61802 true))

(declare-fun array_inv!14876 (array!39823) Bool)

(assert (=> start!61802 (array_inv!14876 a!3626)))

(declare-fun b!692103 () Bool)

(declare-fun res!456385 () Bool)

(assert (=> b!692103 (=> (not res!456385) (not e!393742))))

(assert (=> b!692103 (= res!456385 (not (contains!3698 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692104 () Bool)

(declare-fun res!456382 () Bool)

(assert (=> b!692104 (=> (not res!456382) (not e!393742))))

(assert (=> b!692104 (= res!456382 (noDuplicate!945 acc!681))))

(declare-fun b!692105 () Bool)

(assert (=> b!692105 (= e!393745 (contains!3698 acc!681 k!2843))))

(declare-fun b!692106 () Bool)

(declare-fun res!456381 () Bool)

(assert (=> b!692106 (=> (not res!456381) (not e!393742))))

(assert (=> b!692106 (= res!456381 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692107 () Bool)

(assert (=> b!692107 (= e!393741 e!393743)))

(declare-fun res!456386 () Bool)

(assert (=> b!692107 (=> (not res!456386) (not e!393743))))

(assert (=> b!692107 (= res!456386 (bvsle from!3004 i!1382))))

(declare-fun b!692108 () Bool)

(declare-fun res!456388 () Bool)

(assert (=> b!692108 (=> (not res!456388) (not e!393742))))

(assert (=> b!692108 (= res!456388 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19465 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!61802 res!456378) b!692104))

(assert (= (and b!692104 res!456382) b!692100))

(assert (= (and b!692100 res!456380) b!692103))

(assert (= (and b!692103 res!456385) b!692099))

(assert (= (and b!692099 res!456389) b!692105))

(assert (= (and b!692099 (not res!456383)) b!692107))

(assert (= (and b!692107 res!456386) b!692098))

(assert (= (and b!692099 res!456392) b!692092))

(assert (= (and b!692092 res!456384) b!692106))

(assert (= (and b!692106 res!456381) b!692095))

(assert (= (and b!692095 res!456391) b!692102))

(assert (= (and b!692102 res!456390) b!692093))

(assert (= (and b!692093 res!456377) b!692108))

(assert (= (and b!692108 res!456388) b!692097))

(assert (= (and b!692097 res!456387) b!692091))

(assert (= (and b!692091 c!78224) b!692094))

(assert (= (and b!692091 (not c!78224)) b!692096))

(assert (= (and b!692091 res!456379) b!692101))

(declare-fun m!654797 () Bool)

(assert (=> b!692091 m!654797))

(declare-fun m!654799 () Bool)

(assert (=> b!692098 m!654799))

(declare-fun m!654801 () Bool)

(assert (=> b!692106 m!654801))

(assert (=> b!692105 m!654799))

(declare-fun m!654803 () Bool)

(assert (=> b!692094 m!654803))

(declare-fun m!654805 () Bool)

(assert (=> b!692094 m!654805))

(assert (=> b!692101 m!654797))

(assert (=> b!692101 m!654797))

(declare-fun m!654807 () Bool)

(assert (=> b!692101 m!654807))

(assert (=> b!692101 m!654807))

(declare-fun m!654809 () Bool)

(assert (=> b!692101 m!654809))

(declare-fun m!654811 () Bool)

(assert (=> b!692102 m!654811))

(declare-fun m!654813 () Bool)

(assert (=> b!692104 m!654813))

(declare-fun m!654815 () Bool)

(assert (=> b!692093 m!654815))

(declare-fun m!654817 () Bool)

(assert (=> b!692100 m!654817))

(declare-fun m!654819 () Bool)

(assert (=> start!61802 m!654819))

(assert (=> b!692097 m!654797))

(assert (=> b!692097 m!654797))

(declare-fun m!654821 () Bool)

(assert (=> b!692097 m!654821))

(declare-fun m!654823 () Bool)

(assert (=> b!692103 m!654823))

(declare-fun m!654825 () Bool)

(assert (=> b!692092 m!654825))

(push 1)

(assert (not b!692105))

(assert (not b!692102))

(assert (not b!692106))

(assert (not b!692104))

(assert (not start!61802))

(assert (not b!692098))

(assert (not b!692094))

(assert (not b!692101))

(assert (not b!692097))

(assert (not b!692093))

(assert (not b!692103))

(assert (not b!692092))

(assert (not b!692100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95535 () Bool)

(declare-fun res!456533 () Bool)

(declare-fun e!393842 () Bool)

(assert (=> d!95535 (=> res!456533 e!393842)))

(assert (=> d!95535 (= res!456533 (bvsge from!3004 (size!19465 a!3626)))))

(assert (=> d!95535 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393842)))

(declare-fun b!692275 () Bool)

(declare-fun e!393840 () Bool)

(declare-fun call!34235 () Bool)

(assert (=> b!692275 (= e!393840 call!34235)))

(declare-fun b!692276 () Bool)

(declare-fun e!393843 () Bool)

(assert (=> b!692276 (= e!393842 e!393843)))

(declare-fun res!456532 () Bool)

(assert (=> b!692276 (=> (not res!456532) (not e!393843))))

(declare-fun e!393841 () Bool)

(assert (=> b!692276 (= res!456532 (not e!393841))))

(declare-fun res!456531 () Bool)

(assert (=> b!692276 (=> (not res!456531) (not e!393841))))

(assert (=> b!692276 (= res!456531 (validKeyInArray!0 (select (arr!19080 a!3626) from!3004)))))

(declare-fun bm!34232 () Bool)

(declare-fun c!78239 () Bool)

(assert (=> bm!34232 (= call!34235 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78239 (Cons!13117 (select (arr!19080 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!692277 () Bool)

(assert (=> b!692277 (= e!393840 call!34235)))

(declare-fun b!692278 () Bool)

(assert (=> b!692278 (= e!393841 (contains!3698 acc!681 (select (arr!19080 a!3626) from!3004)))))

(declare-fun b!692279 () Bool)

(assert (=> b!692279 (= e!393843 e!393840)))

(assert (=> b!692279 (= c!78239 (validKeyInArray!0 (select (arr!19080 a!3626) from!3004)))))

(assert (= (and d!95535 (not res!456533)) b!692276))

(assert (= (and b!692276 res!456531) b!692278))

(assert (= (and b!692276 res!456532) b!692279))

(assert (= (and b!692279 c!78239) b!692277))

(assert (= (and b!692279 (not c!78239)) b!692275))

(assert (= (or b!692277 b!692275) bm!34232))

(assert (=> b!692276 m!654797))

(assert (=> b!692276 m!654797))

(assert (=> b!692276 m!654821))

(assert (=> bm!34232 m!654797))

(declare-fun m!654911 () Bool)

(assert (=> bm!34232 m!654911))

(assert (=> b!692278 m!654797))

(assert (=> b!692278 m!654797))

(declare-fun m!654915 () Bool)

(assert (=> b!692278 m!654915))

(assert (=> b!692279 m!654797))

(assert (=> b!692279 m!654797))

(assert (=> b!692279 m!654821))

(assert (=> b!692106 d!95535))

(declare-fun d!95543 () Bool)

(assert (=> d!95543 (= (validKeyInArray!0 (select (arr!19080 a!3626) from!3004)) (and (not (= (select (arr!19080 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19080 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692097 d!95543))

(declare-fun d!95551 () Bool)

(declare-fun lt!316566 () Bool)

(declare-fun content!310 (List!13121) (Set (_ BitVec 64)))

(assert (=> d!95551 (= lt!316566 (set.member k!2843 (content!310 acc!681)))))

(declare-fun e!393866 () Bool)

(assert (=> d!95551 (= lt!316566 e!393866)))

(declare-fun res!456555 () Bool)

(assert (=> d!95551 (=> (not res!456555) (not e!393866))))

(assert (=> d!95551 (= res!456555 (is-Cons!13117 acc!681))))

(assert (=> d!95551 (= (contains!3698 acc!681 k!2843) lt!316566)))

(declare-fun b!692303 () Bool)

(declare-fun e!393867 () Bool)

(assert (=> b!692303 (= e!393866 e!393867)))

(declare-fun res!456556 () Bool)

(assert (=> b!692303 (=> res!456556 e!393867)))

(assert (=> b!692303 (= res!456556 (= (h!14162 acc!681) k!2843))))

(declare-fun b!692304 () Bool)

(assert (=> b!692304 (= e!393867 (contains!3698 (t!19388 acc!681) k!2843))))

(assert (= (and d!95551 res!456555) b!692303))

(assert (= (and b!692303 (not res!456556)) b!692304))

(declare-fun m!654939 () Bool)

(assert (=> d!95551 m!654939))

(declare-fun m!654941 () Bool)

(assert (=> d!95551 m!654941))

(declare-fun m!654943 () Bool)

(assert (=> b!692304 m!654943))

(assert (=> b!692098 d!95551))

(declare-fun d!95565 () Bool)

(declare-fun res!456567 () Bool)

(declare-fun e!393878 () Bool)

(assert (=> d!95565 (=> res!456567 e!393878)))

(assert (=> d!95565 (= res!456567 (is-Nil!13118 ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004))))))

(assert (=> d!95565 (= (noDuplicate!945 ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004))) e!393878)))

(declare-fun b!692315 () Bool)

(declare-fun e!393879 () Bool)

(assert (=> b!692315 (= e!393878 e!393879)))

(declare-fun res!456568 () Bool)

(assert (=> b!692315 (=> (not res!456568) (not e!393879))))

(assert (=> b!692315 (= res!456568 (not (contains!3698 (t!19388 ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004))) (h!14162 ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004))))))))

(declare-fun b!692316 () Bool)

(assert (=> b!692316 (= e!393879 (noDuplicate!945 (t!19388 ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004)))))))

(assert (= (and d!95565 (not res!456567)) b!692315))

(assert (= (and b!692315 res!456568) b!692316))

(declare-fun m!654951 () Bool)

(assert (=> b!692315 m!654951))

(declare-fun m!654953 () Bool)

(assert (=> b!692316 m!654953))

(assert (=> b!692101 d!95565))

(declare-fun d!95569 () Bool)

(assert (=> d!95569 (= ($colon$colon!410 acc!681 (select (arr!19080 a!3626) from!3004)) (Cons!13117 (select (arr!19080 a!3626) from!3004) acc!681))))

(assert (=> b!692101 d!95569))

(declare-fun d!95575 () Bool)

(declare-fun lt!316571 () Bool)

(assert (=> d!95575 (= lt!316571 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!310 acc!681)))))

(declare-fun e!393886 () Bool)

(assert (=> d!95575 (= lt!316571 e!393886)))

(declare-fun res!456574 () Bool)

(assert (=> d!95575 (=> (not res!456574) (not e!393886))))

(assert (=> d!95575 (= res!456574 (is-Cons!13117 acc!681))))

(assert (=> d!95575 (= (contains!3698 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316571)))

(declare-fun b!692324 () Bool)

(declare-fun e!393887 () Bool)

(assert (=> b!692324 (= e!393886 e!393887)))

(declare-fun res!456575 () Bool)

(assert (=> b!692324 (=> res!456575 e!393887)))

(assert (=> b!692324 (= res!456575 (= (h!14162 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692325 () Bool)

(assert (=> b!692325 (= e!393887 (contains!3698 (t!19388 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95575 res!456574) b!692324))

(assert (= (and b!692324 (not res!456575)) b!692325))

(assert (=> d!95575 m!654939))

(declare-fun m!654963 () Bool)

(assert (=> d!95575 m!654963))

(declare-fun m!654965 () Bool)

(assert (=> b!692325 m!654965))

(assert (=> b!692100 d!95575))

(declare-fun d!95577 () Bool)

(assert (=> d!95577 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692102 d!95577))

(declare-fun d!95579 () Bool)

(declare-fun res!456584 () Bool)

(declare-fun e!393896 () Bool)

(assert (=> d!95579 (=> res!456584 e!393896)))

(assert (=> d!95579 (= res!456584 (= (select (arr!19080 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95579 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!393896)))

(declare-fun b!692334 () Bool)

(declare-fun e!393897 () Bool)

(assert (=> b!692334 (= e!393896 e!393897)))

(declare-fun res!456585 () Bool)

(assert (=> b!692334 (=> (not res!456585) (not e!393897))))

(assert (=> b!692334 (= res!456585 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19465 a!3626)))))

(declare-fun b!692335 () Bool)

(assert (=> b!692335 (= e!393897 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95579 (not res!456584)) b!692334))

(assert (= (and b!692334 res!456585) b!692335))

(declare-fun m!654971 () Bool)

(assert (=> d!95579 m!654971))

(declare-fun m!654973 () Bool)

(assert (=> b!692335 m!654973))

(assert (=> b!692093 d!95579))

(declare-fun d!95583 () Bool)

(declare-fun res!456590 () Bool)

(declare-fun e!393902 () Bool)

(assert (=> d!95583 (=> res!456590 e!393902)))

(assert (=> d!95583 (= res!456590 (bvsge #b00000000000000000000000000000000 (size!19465 a!3626)))))

(assert (=> d!95583 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13118) e!393902)))

(declare-fun b!692338 () Bool)

(declare-fun e!393900 () Bool)

(declare-fun call!34238 () Bool)

(assert (=> b!692338 (= e!393900 call!34238)))

(declare-fun b!692339 () Bool)

(declare-fun e!393903 () Bool)

(assert (=> b!692339 (= e!393902 e!393903)))

(declare-fun res!456589 () Bool)

(assert (=> b!692339 (=> (not res!456589) (not e!393903))))

(declare-fun e!393901 () Bool)

(assert (=> b!692339 (= res!456589 (not e!393901))))

(declare-fun res!456588 () Bool)

(assert (=> b!692339 (=> (not res!456588) (not e!393901))))

(assert (=> b!692339 (= res!456588 (validKeyInArray!0 (select (arr!19080 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34235 () Bool)

(declare-fun c!78242 () Bool)

(assert (=> bm!34235 (= call!34238 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78242 (Cons!13117 (select (arr!19080 a!3626) #b00000000000000000000000000000000) Nil!13118) Nil!13118)))))

(declare-fun b!692340 () Bool)

(assert (=> b!692340 (= e!393900 call!34238)))

(declare-fun b!692341 () Bool)

(assert (=> b!692341 (= e!393901 (contains!3698 Nil!13118 (select (arr!19080 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692342 () Bool)

(assert (=> b!692342 (= e!393903 e!393900)))

(assert (=> b!692342 (= c!78242 (validKeyInArray!0 (select (arr!19080 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95583 (not res!456590)) b!692339))

(assert (= (and b!692339 res!456588) b!692341))

(assert (= (and b!692339 res!456589) b!692342))

(assert (= (and b!692342 c!78242) b!692340))

(assert (= (and b!692342 (not c!78242)) b!692338))

(assert (= (or b!692340 b!692338) bm!34235))

(assert (=> b!692339 m!654971))

(assert (=> b!692339 m!654971))

(declare-fun m!654977 () Bool)

