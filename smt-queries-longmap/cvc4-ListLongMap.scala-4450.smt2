; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61806 () Bool)

(assert start!61806)

(declare-fun b!692199 () Bool)

(declare-fun e!393785 () Bool)

(declare-datatypes ((List!13123 0))(
  ( (Nil!13120) (Cons!13119 (h!14164 (_ BitVec 64)) (t!19390 List!13123)) )
))
(declare-fun acc!681 () List!13123)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3700 (List!13123 (_ BitVec 64)) Bool)

(assert (=> b!692199 (= e!393785 (contains!3700 acc!681 k!2843))))

(declare-fun b!692200 () Bool)

(declare-fun res!456477 () Bool)

(declare-fun e!393789 () Bool)

(assert (=> b!692200 (=> (not res!456477) (not e!393789))))

(declare-datatypes ((array!39827 0))(
  ( (array!39828 (arr!19082 (Array (_ BitVec 32) (_ BitVec 64))) (size!19467 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39827)

(declare-fun arrayNoDuplicates!0 (array!39827 (_ BitVec 32) List!13123) Bool)

(assert (=> b!692200 (= res!456477 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13120))))

(declare-fun b!692201 () Bool)

(declare-fun e!393788 () Bool)

(assert (=> b!692201 (= e!393788 (not (contains!3700 acc!681 k!2843)))))

(declare-fun b!692203 () Bool)

(declare-fun res!456478 () Bool)

(assert (=> b!692203 (=> (not res!456478) (not e!393789))))

(assert (=> b!692203 (= res!456478 (not (contains!3700 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692204 () Bool)

(declare-fun res!456488 () Bool)

(assert (=> b!692204 (=> (not res!456488) (not e!393789))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692204 (= res!456488 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19467 a!3626))))))

(declare-fun b!692205 () Bool)

(declare-fun res!456485 () Bool)

(assert (=> b!692205 (=> (not res!456485) (not e!393789))))

(declare-fun noDuplicate!947 (List!13123) Bool)

(assert (=> b!692205 (= res!456485 (noDuplicate!947 acc!681))))

(declare-fun b!692206 () Bool)

(declare-fun res!456479 () Bool)

(assert (=> b!692206 (=> (not res!456479) (not e!393789))))

(assert (=> b!692206 (= res!456479 (not (contains!3700 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692207 () Bool)

(declare-datatypes ((Unit!24446 0))(
  ( (Unit!24447) )
))
(declare-fun e!393784 () Unit!24446)

(declare-fun Unit!24448 () Unit!24446)

(assert (=> b!692207 (= e!393784 Unit!24448)))

(declare-fun b!692208 () Bool)

(declare-fun res!456480 () Bool)

(assert (=> b!692208 (=> (not res!456480) (not e!393789))))

(declare-fun e!393787 () Bool)

(assert (=> b!692208 (= res!456480 e!393787)))

(declare-fun res!456473 () Bool)

(assert (=> b!692208 (=> res!456473 e!393787)))

(assert (=> b!692208 (= res!456473 e!393785)))

(declare-fun res!456481 () Bool)

(assert (=> b!692208 (=> (not res!456481) (not e!393785))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!692208 (= res!456481 (bvsgt from!3004 i!1382))))

(declare-fun b!692209 () Bool)

(declare-fun res!456474 () Bool)

(assert (=> b!692209 (=> (not res!456474) (not e!393789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692209 (= res!456474 (validKeyInArray!0 k!2843))))

(declare-fun b!692210 () Bool)

(assert (=> b!692210 (= e!393787 e!393788)))

(declare-fun res!456484 () Bool)

(assert (=> b!692210 (=> (not res!456484) (not e!393788))))

(assert (=> b!692210 (= res!456484 (bvsle from!3004 i!1382))))

(declare-fun b!692202 () Bool)

(declare-fun e!393786 () Bool)

(declare-fun $colon$colon!412 (List!13123 (_ BitVec 64)) List!13123)

(assert (=> b!692202 (= e!393786 (not (noDuplicate!947 ($colon$colon!412 acc!681 (select (arr!19082 a!3626) from!3004)))))))

(declare-fun res!456486 () Bool)

(assert (=> start!61806 (=> (not res!456486) (not e!393789))))

(assert (=> start!61806 (= res!456486 (and (bvslt (size!19467 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19467 a!3626))))))

(assert (=> start!61806 e!393789))

(assert (=> start!61806 true))

(declare-fun array_inv!14878 (array!39827) Bool)

(assert (=> start!61806 (array_inv!14878 a!3626)))

(declare-fun b!692211 () Bool)

(declare-fun Unit!24449 () Unit!24446)

(assert (=> b!692211 (= e!393784 Unit!24449)))

(declare-fun arrayContainsKey!0 (array!39827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692211 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316554 () Unit!24446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39827 (_ BitVec 64) (_ BitVec 32)) Unit!24446)

(assert (=> b!692211 (= lt!316554 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!692211 false))

(declare-fun b!692212 () Bool)

(declare-fun res!456476 () Bool)

(assert (=> b!692212 (=> (not res!456476) (not e!393789))))

(assert (=> b!692212 (= res!456476 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!692213 () Bool)

(declare-fun res!456475 () Bool)

(assert (=> b!692213 (=> (not res!456475) (not e!393789))))

(assert (=> b!692213 (= res!456475 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19467 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692214 () Bool)

(assert (=> b!692214 (= e!393789 e!393786)))

(declare-fun res!456483 () Bool)

(assert (=> b!692214 (=> (not res!456483) (not e!393786))))

(assert (=> b!692214 (= res!456483 (and (not (= (select (arr!19082 a!3626) from!3004) k!2843)) (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!316555 () Unit!24446)

(assert (=> b!692214 (= lt!316555 e!393784)))

(declare-fun c!78230 () Bool)

(assert (=> b!692214 (= c!78230 (= (select (arr!19082 a!3626) from!3004) k!2843))))

(declare-fun b!692215 () Bool)

(declare-fun res!456482 () Bool)

(assert (=> b!692215 (=> (not res!456482) (not e!393789))))

(assert (=> b!692215 (= res!456482 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!692216 () Bool)

(declare-fun res!456487 () Bool)

(assert (=> b!692216 (=> (not res!456487) (not e!393789))))

(assert (=> b!692216 (= res!456487 (validKeyInArray!0 (select (arr!19082 a!3626) from!3004)))))

(assert (= (and start!61806 res!456486) b!692205))

(assert (= (and b!692205 res!456485) b!692206))

(assert (= (and b!692206 res!456479) b!692203))

(assert (= (and b!692203 res!456478) b!692208))

(assert (= (and b!692208 res!456481) b!692199))

(assert (= (and b!692208 (not res!456473)) b!692210))

(assert (= (and b!692210 res!456484) b!692201))

(assert (= (and b!692208 res!456480) b!692200))

(assert (= (and b!692200 res!456477) b!692215))

(assert (= (and b!692215 res!456482) b!692204))

(assert (= (and b!692204 res!456488) b!692209))

(assert (= (and b!692209 res!456474) b!692212))

(assert (= (and b!692212 res!456476) b!692213))

(assert (= (and b!692213 res!456475) b!692216))

(assert (= (and b!692216 res!456487) b!692214))

(assert (= (and b!692214 c!78230) b!692211))

(assert (= (and b!692214 (not c!78230)) b!692207))

(assert (= (and b!692214 res!456483) b!692202))

(declare-fun m!654857 () Bool)

(assert (=> b!692212 m!654857))

(declare-fun m!654859 () Bool)

(assert (=> b!692214 m!654859))

(declare-fun m!654861 () Bool)

(assert (=> b!692215 m!654861))

(declare-fun m!654863 () Bool)

(assert (=> b!692199 m!654863))

(declare-fun m!654865 () Bool)

(assert (=> b!692206 m!654865))

(declare-fun m!654867 () Bool)

(assert (=> b!692205 m!654867))

(declare-fun m!654869 () Bool)

(assert (=> b!692203 m!654869))

(declare-fun m!654871 () Bool)

(assert (=> b!692211 m!654871))

(declare-fun m!654873 () Bool)

(assert (=> b!692211 m!654873))

(declare-fun m!654875 () Bool)

(assert (=> b!692209 m!654875))

(declare-fun m!654877 () Bool)

(assert (=> start!61806 m!654877))

(assert (=> b!692201 m!654863))

(assert (=> b!692216 m!654859))

(assert (=> b!692216 m!654859))

(declare-fun m!654879 () Bool)

(assert (=> b!692216 m!654879))

(assert (=> b!692202 m!654859))

(assert (=> b!692202 m!654859))

(declare-fun m!654881 () Bool)

(assert (=> b!692202 m!654881))

(assert (=> b!692202 m!654881))

(declare-fun m!654883 () Bool)

(assert (=> b!692202 m!654883))

(declare-fun m!654885 () Bool)

(assert (=> b!692200 m!654885))

(push 1)

(assert (not b!692203))

(assert (not b!692216))

(assert (not b!692209))

(assert (not b!692205))

(assert (not b!692206))

(assert (not start!61806))

(assert (not b!692202))

(assert (not b!692199))

(assert (not b!692200))

(assert (not b!692201))

(assert (not b!692211))

(assert (not b!692215))

(assert (not b!692212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!34231 () Bool)

(declare-fun c!78238 () Bool)

(declare-fun call!34234 () Bool)

(assert (=> bm!34231 (= call!34234 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78238 (Cons!13119 (select (arr!19082 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!692270 () Bool)

(declare-fun e!393838 () Bool)

(assert (=> b!692270 (= e!393838 call!34234)))

(declare-fun b!692271 () Bool)

(declare-fun e!393839 () Bool)

(assert (=> b!692271 (= e!393839 e!393838)))

(assert (=> b!692271 (= c!78238 (validKeyInArray!0 (select (arr!19082 a!3626) from!3004)))))

(declare-fun d!95533 () Bool)

(declare-fun res!456530 () Bool)

(declare-fun e!393836 () Bool)

(assert (=> d!95533 (=> res!456530 e!393836)))

(assert (=> d!95533 (= res!456530 (bvsge from!3004 (size!19467 a!3626)))))

(assert (=> d!95533 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!393836)))

(declare-fun b!692272 () Bool)

(assert (=> b!692272 (= e!393838 call!34234)))

(declare-fun e!393837 () Bool)

(declare-fun b!692273 () Bool)

(assert (=> b!692273 (= e!393837 (contains!3700 acc!681 (select (arr!19082 a!3626) from!3004)))))

(declare-fun b!692274 () Bool)

(assert (=> b!692274 (= e!393836 e!393839)))

(declare-fun res!456528 () Bool)

(assert (=> b!692274 (=> (not res!456528) (not e!393839))))

(assert (=> b!692274 (= res!456528 (not e!393837))))

(declare-fun res!456529 () Bool)

(assert (=> b!692274 (=> (not res!456529) (not e!393837))))

(assert (=> b!692274 (= res!456529 (validKeyInArray!0 (select (arr!19082 a!3626) from!3004)))))

(assert (= (and d!95533 (not res!456530)) b!692274))

(assert (= (and b!692274 res!456529) b!692273))

(assert (= (and b!692274 res!456528) b!692271))

(assert (= (and b!692271 c!78238) b!692272))

(assert (= (and b!692271 (not c!78238)) b!692270))

(assert (= (or b!692272 b!692270) bm!34231))

(assert (=> bm!34231 m!654859))

(declare-fun m!654909 () Bool)

(assert (=> bm!34231 m!654909))

(assert (=> b!692271 m!654859))

(assert (=> b!692271 m!654859))

(assert (=> b!692271 m!654879))

(assert (=> b!692273 m!654859))

(assert (=> b!692273 m!654859))

(declare-fun m!654913 () Bool)

(assert (=> b!692273 m!654913))

(assert (=> b!692274 m!654859))

(assert (=> b!692274 m!654859))

(assert (=> b!692274 m!654879))

(assert (=> b!692215 d!95533))

(declare-fun d!95541 () Bool)

(assert (=> d!95541 (= (validKeyInArray!0 (select (arr!19082 a!3626) from!3004)) (and (not (= (select (arr!19082 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19082 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692216 d!95541))

(declare-fun d!95549 () Bool)

(declare-fun res!456551 () Bool)

(declare-fun e!393862 () Bool)

(assert (=> d!95549 (=> res!456551 e!393862)))

(assert (=> d!95549 (= res!456551 (is-Nil!13120 acc!681))))

(assert (=> d!95549 (= (noDuplicate!947 acc!681) e!393862)))

(declare-fun b!692299 () Bool)

(declare-fun e!393863 () Bool)

(assert (=> b!692299 (= e!393862 e!393863)))

(declare-fun res!456552 () Bool)

(assert (=> b!692299 (=> (not res!456552) (not e!393863))))

(assert (=> b!692299 (= res!456552 (not (contains!3700 (t!19390 acc!681) (h!14164 acc!681))))))

(declare-fun b!692300 () Bool)

(assert (=> b!692300 (= e!393863 (noDuplicate!947 (t!19390 acc!681)))))

(assert (= (and d!95549 (not res!456551)) b!692299))

(assert (= (and b!692299 res!456552) b!692300))

(declare-fun m!654933 () Bool)

(assert (=> b!692299 m!654933))

(declare-fun m!654935 () Bool)

(assert (=> b!692300 m!654935))

(assert (=> b!692205 d!95549))

(declare-fun d!95563 () Bool)

(declare-fun lt!316569 () Bool)

(declare-fun content!311 (List!13123) (Set (_ BitVec 64)))

(assert (=> d!95563 (= lt!316569 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!311 acc!681)))))

(declare-fun e!393876 () Bool)

(assert (=> d!95563 (= lt!316569 e!393876)))

(declare-fun res!456566 () Bool)

(assert (=> d!95563 (=> (not res!456566) (not e!393876))))

(assert (=> d!95563 (= res!456566 (is-Cons!13119 acc!681))))

(assert (=> d!95563 (= (contains!3700 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316569)))

(declare-fun b!692313 () Bool)

(declare-fun e!393877 () Bool)

(assert (=> b!692313 (= e!393876 e!393877)))

(declare-fun res!456565 () Bool)

(assert (=> b!692313 (=> res!456565 e!393877)))

(assert (=> b!692313 (= res!456565 (= (h!14164 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692314 () Bool)

(assert (=> b!692314 (= e!393877 (contains!3700 (t!19390 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95563 res!456566) b!692313))

(assert (= (and b!692313 (not res!456565)) b!692314))

(declare-fun m!654945 () Bool)

(assert (=> d!95563 m!654945))

(declare-fun m!654947 () Bool)

(assert (=> d!95563 m!654947))

(declare-fun m!654949 () Bool)

(assert (=> b!692314 m!654949))

(assert (=> b!692206 d!95563))

(declare-fun d!95567 () Bool)

(declare-fun lt!316570 () Bool)

(assert (=> d!95567 (= lt!316570 (member k!2843 (content!311 acc!681)))))

(declare-fun e!393880 () Bool)

(assert (=> d!95567 (= lt!316570 e!393880)))

(declare-fun res!456570 () Bool)

(assert (=> d!95567 (=> (not res!456570) (not e!393880))))

(assert (=> d!95567 (= res!456570 (is-Cons!13119 acc!681))))

(assert (=> d!95567 (= (contains!3700 acc!681 k!2843) lt!316570)))

(declare-fun b!692317 () Bool)

(declare-fun e!393881 () Bool)

(assert (=> b!692317 (= e!393880 e!393881)))

(declare-fun res!456569 () Bool)

(assert (=> b!692317 (=> res!456569 e!393881)))

(assert (=> b!692317 (= res!456569 (= (h!14164 acc!681) k!2843))))

(declare-fun b!692318 () Bool)

(assert (=> b!692318 (= e!393881 (contains!3700 (t!19390 acc!681) k!2843))))

(assert (= (and d!95567 res!456570) b!692317))

(assert (= (and b!692317 (not res!456569)) b!692318))

(assert (=> d!95567 m!654945))

(declare-fun m!654955 () Bool)

(assert (=> d!95567 m!654955))

(declare-fun m!654957 () Bool)

(assert (=> b!692318 m!654957))

(assert (=> b!692199 d!95567))

(declare-fun d!95571 () Bool)

(assert (=> d!95571 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692209 d!95571))

(declare-fun bm!34234 () Bool)

(declare-fun call!34237 () Bool)

(declare-fun c!78241 () Bool)

(assert (=> bm!34234 (= call!34237 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78241 (Cons!13119 (select (arr!19082 a!3626) #b00000000000000000000000000000000) Nil!13120) Nil!13120)))))

(declare-fun b!692319 () Bool)

(declare-fun e!393884 () Bool)

(assert (=> b!692319 (= e!393884 call!34237)))

(declare-fun b!692320 () Bool)

(declare-fun e!393885 () Bool)

(assert (=> b!692320 (= e!393885 e!393884)))

(assert (=> b!692320 (= c!78241 (validKeyInArray!0 (select (arr!19082 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95573 () Bool)

(declare-fun res!456573 () Bool)

(declare-fun e!393882 () Bool)

(assert (=> d!95573 (=> res!456573 e!393882)))

(assert (=> d!95573 (= res!456573 (bvsge #b00000000000000000000000000000000 (size!19467 a!3626)))))

(assert (=> d!95573 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13120) e!393882)))

(declare-fun b!692321 () Bool)

(assert (=> b!692321 (= e!393884 call!34237)))

