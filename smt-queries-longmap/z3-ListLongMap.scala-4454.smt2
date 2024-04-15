; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61958 () Bool)

(assert start!61958)

(declare-fun b!693056 () Bool)

(declare-fun res!457375 () Bool)

(declare-fun e!394300 () Bool)

(assert (=> b!693056 (=> (not res!457375) (not e!394300))))

(declare-fun e!394305 () Bool)

(assert (=> b!693056 (= res!457375 e!394305)))

(declare-fun res!457359 () Bool)

(assert (=> b!693056 (=> res!457359 e!394305)))

(declare-fun e!394310 () Bool)

(assert (=> b!693056 (= res!457359 e!394310)))

(declare-fun res!457370 () Bool)

(assert (=> b!693056 (=> (not res!457370) (not e!394310))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693056 (= res!457370 (bvsgt from!3004 i!1382))))

(declare-fun b!693057 () Bool)

(declare-fun e!394309 () Bool)

(declare-datatypes ((List!13171 0))(
  ( (Nil!13168) (Cons!13167 (h!14212 (_ BitVec 64)) (t!19438 List!13171)) )
))
(declare-fun lt!316483 () List!13171)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3693 (List!13171 (_ BitVec 64)) Bool)

(assert (=> b!693057 (= e!394309 (not (contains!3693 lt!316483 k0!2843)))))

(declare-fun b!693058 () Bool)

(declare-fun res!457358 () Bool)

(assert (=> b!693058 (=> (not res!457358) (not e!394300))))

(declare-fun acc!681 () List!13171)

(assert (=> b!693058 (= res!457358 (not (contains!3693 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693059 () Bool)

(declare-fun res!457378 () Bool)

(declare-fun e!394306 () Bool)

(assert (=> b!693059 (=> (not res!457378) (not e!394306))))

(declare-fun noDuplicate!962 (List!13171) Bool)

(assert (=> b!693059 (= res!457378 (noDuplicate!962 lt!316483))))

(declare-fun b!693060 () Bool)

(declare-fun res!457366 () Bool)

(assert (=> b!693060 (=> (not res!457366) (not e!394300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693060 (= res!457366 (validKeyInArray!0 k0!2843))))

(declare-datatypes ((array!39855 0))(
  ( (array!39856 (arr!19091 (Array (_ BitVec 32) (_ BitVec 64))) (size!19473 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39855)

(declare-fun b!693061 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39855 (_ BitVec 32) List!13171) Bool)

(assert (=> b!693061 (= e!394306 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316483)))))

(declare-fun b!693062 () Bool)

(assert (=> b!693062 (= e!394310 (contains!3693 acc!681 k0!2843))))

(declare-fun res!457369 () Bool)

(assert (=> start!61958 (=> (not res!457369) (not e!394300))))

(assert (=> start!61958 (= res!457369 (and (bvslt (size!19473 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19473 a!3626))))))

(assert (=> start!61958 e!394300))

(assert (=> start!61958 true))

(declare-fun array_inv!14974 (array!39855) Bool)

(assert (=> start!61958 (array_inv!14974 a!3626)))

(declare-fun b!693063 () Bool)

(declare-datatypes ((Unit!24464 0))(
  ( (Unit!24465) )
))
(declare-fun e!394301 () Unit!24464)

(declare-fun Unit!24466 () Unit!24464)

(assert (=> b!693063 (= e!394301 Unit!24466)))

(declare-fun arrayContainsKey!0 (array!39855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693063 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316484 () Unit!24464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39855 (_ BitVec 64) (_ BitVec 32)) Unit!24464)

(assert (=> b!693063 (= lt!316484 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693063 false))

(declare-fun b!693064 () Bool)

(declare-fun res!457381 () Bool)

(assert (=> b!693064 (=> (not res!457381) (not e!394300))))

(assert (=> b!693064 (= res!457381 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13168))))

(declare-fun b!693065 () Bool)

(declare-fun e!394304 () Bool)

(assert (=> b!693065 (= e!394300 e!394304)))

(declare-fun res!457372 () Bool)

(assert (=> b!693065 (=> (not res!457372) (not e!394304))))

(assert (=> b!693065 (= res!457372 (not (= (select (arr!19091 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316485 () Unit!24464)

(assert (=> b!693065 (= lt!316485 e!394301)))

(declare-fun c!78216 () Bool)

(assert (=> b!693065 (= c!78216 (= (select (arr!19091 a!3626) from!3004) k0!2843))))

(declare-fun b!693066 () Bool)

(declare-fun res!457379 () Bool)

(assert (=> b!693066 (=> (not res!457379) (not e!394306))))

(assert (=> b!693066 (= res!457379 (not (contains!3693 lt!316483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693067 () Bool)

(declare-fun res!457371 () Bool)

(assert (=> b!693067 (=> (not res!457371) (not e!394300))))

(assert (=> b!693067 (= res!457371 (validKeyInArray!0 (select (arr!19091 a!3626) from!3004)))))

(declare-fun b!693068 () Bool)

(declare-fun res!457376 () Bool)

(assert (=> b!693068 (=> (not res!457376) (not e!394300))))

(assert (=> b!693068 (= res!457376 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693069 () Bool)

(declare-fun e!394302 () Bool)

(assert (=> b!693069 (= e!394302 (contains!3693 lt!316483 k0!2843))))

(declare-fun b!693070 () Bool)

(declare-fun res!457363 () Bool)

(assert (=> b!693070 (=> (not res!457363) (not e!394300))))

(assert (=> b!693070 (= res!457363 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693071 () Bool)

(declare-fun res!457368 () Bool)

(assert (=> b!693071 (=> (not res!457368) (not e!394306))))

(assert (=> b!693071 (= res!457368 (not (contains!3693 lt!316483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693072 () Bool)

(declare-fun res!457374 () Bool)

(assert (=> b!693072 (=> (not res!457374) (not e!394300))))

(assert (=> b!693072 (= res!457374 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19473 a!3626))))))

(declare-fun b!693073 () Bool)

(declare-fun res!457377 () Bool)

(assert (=> b!693073 (=> (not res!457377) (not e!394300))))

(assert (=> b!693073 (= res!457377 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19473 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693074 () Bool)

(declare-fun e!394307 () Bool)

(assert (=> b!693074 (= e!394305 e!394307)))

(declare-fun res!457361 () Bool)

(assert (=> b!693074 (=> (not res!457361) (not e!394307))))

(assert (=> b!693074 (= res!457361 (bvsle from!3004 i!1382))))

(declare-fun b!693075 () Bool)

(declare-fun res!457362 () Bool)

(assert (=> b!693075 (=> (not res!457362) (not e!394300))))

(assert (=> b!693075 (= res!457362 (noDuplicate!962 acc!681))))

(declare-fun b!693076 () Bool)

(assert (=> b!693076 (= e!394307 (not (contains!3693 acc!681 k0!2843)))))

(declare-fun b!693077 () Bool)

(declare-fun res!457373 () Bool)

(assert (=> b!693077 (=> (not res!457373) (not e!394306))))

(declare-fun e!394308 () Bool)

(assert (=> b!693077 (= res!457373 e!394308)))

(declare-fun res!457380 () Bool)

(assert (=> b!693077 (=> res!457380 e!394308)))

(assert (=> b!693077 (= res!457380 e!394302)))

(declare-fun res!457364 () Bool)

(assert (=> b!693077 (=> (not res!457364) (not e!394302))))

(assert (=> b!693077 (= res!457364 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693078 () Bool)

(declare-fun res!457365 () Bool)

(assert (=> b!693078 (=> (not res!457365) (not e!394300))))

(assert (=> b!693078 (= res!457365 (not (contains!3693 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693079 () Bool)

(declare-fun Unit!24467 () Unit!24464)

(assert (=> b!693079 (= e!394301 Unit!24467)))

(declare-fun b!693080 () Bool)

(assert (=> b!693080 (= e!394308 e!394309)))

(declare-fun res!457367 () Bool)

(assert (=> b!693080 (=> (not res!457367) (not e!394309))))

(assert (=> b!693080 (= res!457367 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693081 () Bool)

(assert (=> b!693081 (= e!394304 e!394306)))

(declare-fun res!457360 () Bool)

(assert (=> b!693081 (=> (not res!457360) (not e!394306))))

(assert (=> b!693081 (= res!457360 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!421 (List!13171 (_ BitVec 64)) List!13171)

(assert (=> b!693081 (= lt!316483 ($colon$colon!421 acc!681 (select (arr!19091 a!3626) from!3004)))))

(assert (= (and start!61958 res!457369) b!693075))

(assert (= (and b!693075 res!457362) b!693058))

(assert (= (and b!693058 res!457358) b!693078))

(assert (= (and b!693078 res!457365) b!693056))

(assert (= (and b!693056 res!457370) b!693062))

(assert (= (and b!693056 (not res!457359)) b!693074))

(assert (= (and b!693074 res!457361) b!693076))

(assert (= (and b!693056 res!457375) b!693064))

(assert (= (and b!693064 res!457381) b!693070))

(assert (= (and b!693070 res!457363) b!693072))

(assert (= (and b!693072 res!457374) b!693060))

(assert (= (and b!693060 res!457366) b!693068))

(assert (= (and b!693068 res!457376) b!693073))

(assert (= (and b!693073 res!457377) b!693067))

(assert (= (and b!693067 res!457371) b!693065))

(assert (= (and b!693065 c!78216) b!693063))

(assert (= (and b!693065 (not c!78216)) b!693079))

(assert (= (and b!693065 res!457372) b!693081))

(assert (= (and b!693081 res!457360) b!693059))

(assert (= (and b!693059 res!457378) b!693071))

(assert (= (and b!693071 res!457368) b!693066))

(assert (= (and b!693066 res!457379) b!693077))

(assert (= (and b!693077 res!457364) b!693069))

(assert (= (and b!693077 (not res!457380)) b!693080))

(assert (= (and b!693080 res!457367) b!693057))

(assert (= (and b!693077 res!457373) b!693061))

(declare-fun m!654855 () Bool)

(assert (=> b!693066 m!654855))

(declare-fun m!654857 () Bool)

(assert (=> b!693065 m!654857))

(declare-fun m!654859 () Bool)

(assert (=> b!693076 m!654859))

(declare-fun m!654861 () Bool)

(assert (=> b!693070 m!654861))

(assert (=> b!693067 m!654857))

(assert (=> b!693067 m!654857))

(declare-fun m!654863 () Bool)

(assert (=> b!693067 m!654863))

(declare-fun m!654865 () Bool)

(assert (=> b!693078 m!654865))

(declare-fun m!654867 () Bool)

(assert (=> start!61958 m!654867))

(assert (=> b!693081 m!654857))

(assert (=> b!693081 m!654857))

(declare-fun m!654869 () Bool)

(assert (=> b!693081 m!654869))

(declare-fun m!654871 () Bool)

(assert (=> b!693068 m!654871))

(declare-fun m!654873 () Bool)

(assert (=> b!693061 m!654873))

(declare-fun m!654875 () Bool)

(assert (=> b!693064 m!654875))

(declare-fun m!654877 () Bool)

(assert (=> b!693059 m!654877))

(declare-fun m!654879 () Bool)

(assert (=> b!693057 m!654879))

(declare-fun m!654881 () Bool)

(assert (=> b!693071 m!654881))

(declare-fun m!654883 () Bool)

(assert (=> b!693060 m!654883))

(declare-fun m!654885 () Bool)

(assert (=> b!693063 m!654885))

(declare-fun m!654887 () Bool)

(assert (=> b!693063 m!654887))

(assert (=> b!693069 m!654879))

(assert (=> b!693062 m!654859))

(declare-fun m!654889 () Bool)

(assert (=> b!693058 m!654889))

(declare-fun m!654891 () Bool)

(assert (=> b!693075 m!654891))

(check-sat (not b!693062) (not b!693063) (not start!61958) (not b!693064) (not b!693071) (not b!693057) (not b!693061) (not b!693076) (not b!693068) (not b!693069) (not b!693067) (not b!693060) (not b!693059) (not b!693070) (not b!693078) (not b!693081) (not b!693075) (not b!693058) (not b!693066))
(check-sat)
(get-model)

(declare-fun call!34237 () Bool)

(declare-fun c!78225 () Bool)

(declare-fun bm!34234 () Bool)

(assert (=> bm!34234 (= call!34237 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78225 (Cons!13167 (select (arr!19091 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316483) lt!316483)))))

(declare-fun b!693248 () Bool)

(declare-fun e!394388 () Bool)

(declare-fun e!394387 () Bool)

(assert (=> b!693248 (= e!394388 e!394387)))

(declare-fun res!457532 () Bool)

(assert (=> b!693248 (=> (not res!457532) (not e!394387))))

(declare-fun e!394385 () Bool)

(assert (=> b!693248 (= res!457532 (not e!394385))))

(declare-fun res!457534 () Bool)

(assert (=> b!693248 (=> (not res!457534) (not e!394385))))

(assert (=> b!693248 (= res!457534 (validKeyInArray!0 (select (arr!19091 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!693249 () Bool)

(assert (=> b!693249 (= e!394385 (contains!3693 lt!316483 (select (arr!19091 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95597 () Bool)

(declare-fun res!457533 () Bool)

(assert (=> d!95597 (=> res!457533 e!394388)))

(assert (=> d!95597 (= res!457533 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19473 a!3626)))))

(assert (=> d!95597 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316483) e!394388)))

(declare-fun b!693250 () Bool)

(declare-fun e!394386 () Bool)

(assert (=> b!693250 (= e!394386 call!34237)))

(declare-fun b!693251 () Bool)

(assert (=> b!693251 (= e!394386 call!34237)))

(declare-fun b!693252 () Bool)

(assert (=> b!693252 (= e!394387 e!394386)))

(assert (=> b!693252 (= c!78225 (validKeyInArray!0 (select (arr!19091 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95597 (not res!457533)) b!693248))

(assert (= (and b!693248 res!457534) b!693249))

(assert (= (and b!693248 res!457532) b!693252))

(assert (= (and b!693252 c!78225) b!693250))

(assert (= (and b!693252 (not c!78225)) b!693251))

(assert (= (or b!693250 b!693251) bm!34234))

(declare-fun m!654969 () Bool)

(assert (=> bm!34234 m!654969))

(declare-fun m!654971 () Bool)

(assert (=> bm!34234 m!654971))

(assert (=> b!693248 m!654969))

(assert (=> b!693248 m!654969))

(declare-fun m!654973 () Bool)

(assert (=> b!693248 m!654973))

(assert (=> b!693249 m!654969))

(assert (=> b!693249 m!654969))

(declare-fun m!654975 () Bool)

(assert (=> b!693249 m!654975))

(assert (=> b!693252 m!654969))

(assert (=> b!693252 m!654969))

(assert (=> b!693252 m!654973))

(assert (=> b!693061 d!95597))

(declare-fun d!95599 () Bool)

(assert (=> d!95599 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!693060 d!95599))

(declare-fun d!95601 () Bool)

(declare-fun lt!316506 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!316 (List!13171) (InoxSet (_ BitVec 64)))

(assert (=> d!95601 (= lt!316506 (select (content!316 lt!316483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394393 () Bool)

(assert (=> d!95601 (= lt!316506 e!394393)))

(declare-fun res!457540 () Bool)

(assert (=> d!95601 (=> (not res!457540) (not e!394393))))

(get-info :version)

(assert (=> d!95601 (= res!457540 ((_ is Cons!13167) lt!316483))))

(assert (=> d!95601 (= (contains!3693 lt!316483 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316506)))

(declare-fun b!693257 () Bool)

(declare-fun e!394394 () Bool)

(assert (=> b!693257 (= e!394393 e!394394)))

(declare-fun res!457539 () Bool)

(assert (=> b!693257 (=> res!457539 e!394394)))

(assert (=> b!693257 (= res!457539 (= (h!14212 lt!316483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693258 () Bool)

(assert (=> b!693258 (= e!394394 (contains!3693 (t!19438 lt!316483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95601 res!457540) b!693257))

(assert (= (and b!693257 (not res!457539)) b!693258))

(declare-fun m!654977 () Bool)

(assert (=> d!95601 m!654977))

(declare-fun m!654979 () Bool)

(assert (=> d!95601 m!654979))

(declare-fun m!654981 () Bool)

(assert (=> b!693258 m!654981))

(assert (=> b!693071 d!95601))

(declare-fun c!78226 () Bool)

(declare-fun call!34238 () Bool)

(declare-fun bm!34235 () Bool)

(assert (=> bm!34235 (= call!34238 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78226 (Cons!13167 (select (arr!19091 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!693259 () Bool)

(declare-fun e!394398 () Bool)

(declare-fun e!394397 () Bool)

(assert (=> b!693259 (= e!394398 e!394397)))

(declare-fun res!457541 () Bool)

(assert (=> b!693259 (=> (not res!457541) (not e!394397))))

(declare-fun e!394395 () Bool)

(assert (=> b!693259 (= res!457541 (not e!394395))))

(declare-fun res!457543 () Bool)

(assert (=> b!693259 (=> (not res!457543) (not e!394395))))

(assert (=> b!693259 (= res!457543 (validKeyInArray!0 (select (arr!19091 a!3626) from!3004)))))

(declare-fun b!693260 () Bool)

(assert (=> b!693260 (= e!394395 (contains!3693 acc!681 (select (arr!19091 a!3626) from!3004)))))

(declare-fun d!95605 () Bool)

(declare-fun res!457542 () Bool)

(assert (=> d!95605 (=> res!457542 e!394398)))

(assert (=> d!95605 (= res!457542 (bvsge from!3004 (size!19473 a!3626)))))

(assert (=> d!95605 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394398)))

(declare-fun b!693261 () Bool)

(declare-fun e!394396 () Bool)

(assert (=> b!693261 (= e!394396 call!34238)))

(declare-fun b!693262 () Bool)

(assert (=> b!693262 (= e!394396 call!34238)))

(declare-fun b!693263 () Bool)

(assert (=> b!693263 (= e!394397 e!394396)))

(assert (=> b!693263 (= c!78226 (validKeyInArray!0 (select (arr!19091 a!3626) from!3004)))))

(assert (= (and d!95605 (not res!457542)) b!693259))

(assert (= (and b!693259 res!457543) b!693260))

(assert (= (and b!693259 res!457541) b!693263))

(assert (= (and b!693263 c!78226) b!693261))

(assert (= (and b!693263 (not c!78226)) b!693262))

(assert (= (or b!693261 b!693262) bm!34235))

(assert (=> bm!34235 m!654857))

(declare-fun m!654983 () Bool)

(assert (=> bm!34235 m!654983))

(assert (=> b!693259 m!654857))

(assert (=> b!693259 m!654857))

(assert (=> b!693259 m!654863))

(assert (=> b!693260 m!654857))

(assert (=> b!693260 m!654857))

(declare-fun m!654985 () Bool)

(assert (=> b!693260 m!654985))

(assert (=> b!693263 m!654857))

(assert (=> b!693263 m!654857))

(assert (=> b!693263 m!654863))

(assert (=> b!693070 d!95605))

(declare-fun d!95607 () Bool)

(assert (=> d!95607 (= ($colon$colon!421 acc!681 (select (arr!19091 a!3626) from!3004)) (Cons!13167 (select (arr!19091 a!3626) from!3004) acc!681))))

(assert (=> b!693081 d!95607))

(declare-fun d!95609 () Bool)

(declare-fun res!457560 () Bool)

(declare-fun e!394415 () Bool)

(assert (=> d!95609 (=> res!457560 e!394415)))

(assert (=> d!95609 (= res!457560 ((_ is Nil!13168) lt!316483))))

(assert (=> d!95609 (= (noDuplicate!962 lt!316483) e!394415)))

(declare-fun b!693280 () Bool)

(declare-fun e!394416 () Bool)

(assert (=> b!693280 (= e!394415 e!394416)))

(declare-fun res!457561 () Bool)

(assert (=> b!693280 (=> (not res!457561) (not e!394416))))

(assert (=> b!693280 (= res!457561 (not (contains!3693 (t!19438 lt!316483) (h!14212 lt!316483))))))

(declare-fun b!693281 () Bool)

(assert (=> b!693281 (= e!394416 (noDuplicate!962 (t!19438 lt!316483)))))

(assert (= (and d!95609 (not res!457560)) b!693280))

(assert (= (and b!693280 res!457561) b!693281))

(declare-fun m!655007 () Bool)

(assert (=> b!693280 m!655007))

(declare-fun m!655009 () Bool)

(assert (=> b!693281 m!655009))

(assert (=> b!693059 d!95609))

(declare-fun d!95621 () Bool)

(declare-fun lt!316513 () Bool)

(assert (=> d!95621 (= lt!316513 (select (content!316 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394417 () Bool)

(assert (=> d!95621 (= lt!316513 e!394417)))

(declare-fun res!457563 () Bool)

(assert (=> d!95621 (=> (not res!457563) (not e!394417))))

(assert (=> d!95621 (= res!457563 ((_ is Cons!13167) acc!681))))

(assert (=> d!95621 (= (contains!3693 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316513)))

(declare-fun b!693282 () Bool)

(declare-fun e!394418 () Bool)

(assert (=> b!693282 (= e!394417 e!394418)))

(declare-fun res!457562 () Bool)

(assert (=> b!693282 (=> res!457562 e!394418)))

(assert (=> b!693282 (= res!457562 (= (h!14212 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693283 () Bool)

(assert (=> b!693283 (= e!394418 (contains!3693 (t!19438 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95621 res!457563) b!693282))

(assert (= (and b!693282 (not res!457562)) b!693283))

(declare-fun m!655011 () Bool)

(assert (=> d!95621 m!655011))

(declare-fun m!655013 () Bool)

(assert (=> d!95621 m!655013))

(declare-fun m!655015 () Bool)

(assert (=> b!693283 m!655015))

(assert (=> b!693058 d!95621))

(declare-fun d!95623 () Bool)

(declare-fun lt!316514 () Bool)

(assert (=> d!95623 (= lt!316514 (select (content!316 lt!316483) k0!2843))))

(declare-fun e!394419 () Bool)

(assert (=> d!95623 (= lt!316514 e!394419)))

(declare-fun res!457565 () Bool)

(assert (=> d!95623 (=> (not res!457565) (not e!394419))))

(assert (=> d!95623 (= res!457565 ((_ is Cons!13167) lt!316483))))

(assert (=> d!95623 (= (contains!3693 lt!316483 k0!2843) lt!316514)))

(declare-fun b!693284 () Bool)

(declare-fun e!394420 () Bool)

(assert (=> b!693284 (= e!394419 e!394420)))

(declare-fun res!457564 () Bool)

(assert (=> b!693284 (=> res!457564 e!394420)))

(assert (=> b!693284 (= res!457564 (= (h!14212 lt!316483) k0!2843))))

(declare-fun b!693285 () Bool)

(assert (=> b!693285 (= e!394420 (contains!3693 (t!19438 lt!316483) k0!2843))))

(assert (= (and d!95623 res!457565) b!693284))

(assert (= (and b!693284 (not res!457564)) b!693285))

(assert (=> d!95623 m!654977))

(declare-fun m!655017 () Bool)

(assert (=> d!95623 m!655017))

(declare-fun m!655019 () Bool)

(assert (=> b!693285 m!655019))

(assert (=> b!693069 d!95623))

(declare-fun d!95627 () Bool)

(declare-fun res!457574 () Bool)

(declare-fun e!394429 () Bool)

(assert (=> d!95627 (=> res!457574 e!394429)))

(assert (=> d!95627 (= res!457574 (= (select (arr!19091 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95627 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394429)))

(declare-fun b!693294 () Bool)

(declare-fun e!394430 () Bool)

(assert (=> b!693294 (= e!394429 e!394430)))

(declare-fun res!457575 () Bool)

(assert (=> b!693294 (=> (not res!457575) (not e!394430))))

(assert (=> b!693294 (= res!457575 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19473 a!3626)))))

(declare-fun b!693295 () Bool)

(assert (=> b!693295 (= e!394430 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95627 (not res!457574)) b!693294))

(assert (= (and b!693294 res!457575) b!693295))

(declare-fun m!655021 () Bool)

(assert (=> d!95627 m!655021))

(declare-fun m!655023 () Bool)

(assert (=> b!693295 m!655023))

(assert (=> b!693068 d!95627))

(declare-fun d!95631 () Bool)

(declare-fun lt!316515 () Bool)

(assert (=> d!95631 (= lt!316515 (select (content!316 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394431 () Bool)

(assert (=> d!95631 (= lt!316515 e!394431)))

(declare-fun res!457577 () Bool)

(assert (=> d!95631 (=> (not res!457577) (not e!394431))))

(assert (=> d!95631 (= res!457577 ((_ is Cons!13167) acc!681))))

(assert (=> d!95631 (= (contains!3693 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316515)))

(declare-fun b!693296 () Bool)

(declare-fun e!394432 () Bool)

(assert (=> b!693296 (= e!394431 e!394432)))

(declare-fun res!457576 () Bool)

(assert (=> b!693296 (=> res!457576 e!394432)))

(assert (=> b!693296 (= res!457576 (= (h!14212 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693297 () Bool)

(assert (=> b!693297 (= e!394432 (contains!3693 (t!19438 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95631 res!457577) b!693296))

(assert (= (and b!693296 (not res!457576)) b!693297))

(assert (=> d!95631 m!655011))

(declare-fun m!655025 () Bool)

(assert (=> d!95631 m!655025))

(declare-fun m!655027 () Bool)

(assert (=> b!693297 m!655027))

(assert (=> b!693078 d!95631))

(declare-fun d!95633 () Bool)

(assert (=> d!95633 (= (array_inv!14974 a!3626) (bvsge (size!19473 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61958 d!95633))

(assert (=> b!693057 d!95623))

(declare-fun d!95637 () Bool)

(assert (=> d!95637 (= (validKeyInArray!0 (select (arr!19091 a!3626) from!3004)) (and (not (= (select (arr!19091 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19091 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!693067 d!95637))

(declare-fun d!95639 () Bool)

(declare-fun lt!316516 () Bool)

(assert (=> d!95639 (= lt!316516 (select (content!316 lt!316483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394443 () Bool)

(assert (=> d!95639 (= lt!316516 e!394443)))

(declare-fun res!457587 () Bool)

(assert (=> d!95639 (=> (not res!457587) (not e!394443))))

(assert (=> d!95639 (= res!457587 ((_ is Cons!13167) lt!316483))))

(assert (=> d!95639 (= (contains!3693 lt!316483 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316516)))

(declare-fun b!693310 () Bool)

(declare-fun e!394444 () Bool)

(assert (=> b!693310 (= e!394443 e!394444)))

(declare-fun res!457586 () Bool)

(assert (=> b!693310 (=> res!457586 e!394444)))

(assert (=> b!693310 (= res!457586 (= (h!14212 lt!316483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!693311 () Bool)

(assert (=> b!693311 (= e!394444 (contains!3693 (t!19438 lt!316483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95639 res!457587) b!693310))

(assert (= (and b!693310 (not res!457586)) b!693311))

(assert (=> d!95639 m!654977))

(declare-fun m!655033 () Bool)

(assert (=> d!95639 m!655033))

(declare-fun m!655035 () Bool)

(assert (=> b!693311 m!655035))

(assert (=> b!693066 d!95639))

(declare-fun d!95641 () Bool)

(declare-fun lt!316517 () Bool)

(assert (=> d!95641 (= lt!316517 (select (content!316 acc!681) k0!2843))))

(declare-fun e!394445 () Bool)

(assert (=> d!95641 (= lt!316517 e!394445)))

(declare-fun res!457589 () Bool)

(assert (=> d!95641 (=> (not res!457589) (not e!394445))))

(assert (=> d!95641 (= res!457589 ((_ is Cons!13167) acc!681))))

(assert (=> d!95641 (= (contains!3693 acc!681 k0!2843) lt!316517)))

(declare-fun b!693312 () Bool)

(declare-fun e!394446 () Bool)

(assert (=> b!693312 (= e!394445 e!394446)))

(declare-fun res!457588 () Bool)

(assert (=> b!693312 (=> res!457588 e!394446)))

(assert (=> b!693312 (= res!457588 (= (h!14212 acc!681) k0!2843))))

(declare-fun b!693313 () Bool)

(assert (=> b!693313 (= e!394446 (contains!3693 (t!19438 acc!681) k0!2843))))

(assert (= (and d!95641 res!457589) b!693312))

(assert (= (and b!693312 (not res!457588)) b!693313))

(assert (=> d!95641 m!655011))

(declare-fun m!655037 () Bool)

(assert (=> d!95641 m!655037))

(declare-fun m!655039 () Bool)

(assert (=> b!693313 m!655039))

(assert (=> b!693076 d!95641))

(declare-fun bm!34238 () Bool)

(declare-fun call!34241 () Bool)

(declare-fun c!78229 () Bool)

(assert (=> bm!34238 (= call!34241 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78229 (Cons!13167 (select (arr!19091 a!3626) #b00000000000000000000000000000000) Nil!13168) Nil!13168)))))

(declare-fun b!693314 () Bool)

(declare-fun e!394450 () Bool)

(declare-fun e!394449 () Bool)

(assert (=> b!693314 (= e!394450 e!394449)))

(declare-fun res!457590 () Bool)

(assert (=> b!693314 (=> (not res!457590) (not e!394449))))

(declare-fun e!394447 () Bool)

(assert (=> b!693314 (= res!457590 (not e!394447))))

(declare-fun res!457592 () Bool)

(assert (=> b!693314 (=> (not res!457592) (not e!394447))))

(assert (=> b!693314 (= res!457592 (validKeyInArray!0 (select (arr!19091 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!693315 () Bool)

(assert (=> b!693315 (= e!394447 (contains!3693 Nil!13168 (select (arr!19091 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95643 () Bool)

(declare-fun res!457591 () Bool)

(assert (=> d!95643 (=> res!457591 e!394450)))

(assert (=> d!95643 (= res!457591 (bvsge #b00000000000000000000000000000000 (size!19473 a!3626)))))

(assert (=> d!95643 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13168) e!394450)))

(declare-fun b!693316 () Bool)

(declare-fun e!394448 () Bool)

(assert (=> b!693316 (= e!394448 call!34241)))

(declare-fun b!693317 () Bool)

(assert (=> b!693317 (= e!394448 call!34241)))

(declare-fun b!693318 () Bool)

(assert (=> b!693318 (= e!394449 e!394448)))

(assert (=> b!693318 (= c!78229 (validKeyInArray!0 (select (arr!19091 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95643 (not res!457591)) b!693314))

(assert (= (and b!693314 res!457592) b!693315))

(assert (= (and b!693314 res!457590) b!693318))

(assert (= (and b!693318 c!78229) b!693316))

(assert (= (and b!693318 (not c!78229)) b!693317))

(assert (= (or b!693316 b!693317) bm!34238))

(assert (=> bm!34238 m!655021))

(declare-fun m!655041 () Bool)

(assert (=> bm!34238 m!655041))

(assert (=> b!693314 m!655021))

(assert (=> b!693314 m!655021))

(declare-fun m!655043 () Bool)

(assert (=> b!693314 m!655043))

(assert (=> b!693315 m!655021))

(assert (=> b!693315 m!655021))

(declare-fun m!655045 () Bool)

(assert (=> b!693315 m!655045))

(assert (=> b!693318 m!655021))

(assert (=> b!693318 m!655021))

(assert (=> b!693318 m!655043))

(assert (=> b!693064 d!95643))

(declare-fun d!95645 () Bool)

(declare-fun res!457595 () Bool)

(declare-fun e!394453 () Bool)

(assert (=> d!95645 (=> res!457595 e!394453)))

(assert (=> d!95645 (= res!457595 ((_ is Nil!13168) acc!681))))

(assert (=> d!95645 (= (noDuplicate!962 acc!681) e!394453)))

(declare-fun b!693321 () Bool)

(declare-fun e!394454 () Bool)

(assert (=> b!693321 (= e!394453 e!394454)))

(declare-fun res!457596 () Bool)

(assert (=> b!693321 (=> (not res!457596) (not e!394454))))

(assert (=> b!693321 (= res!457596 (not (contains!3693 (t!19438 acc!681) (h!14212 acc!681))))))

(declare-fun b!693322 () Bool)

(assert (=> b!693322 (= e!394454 (noDuplicate!962 (t!19438 acc!681)))))

(assert (= (and d!95645 (not res!457595)) b!693321))

(assert (= (and b!693321 res!457596) b!693322))

(declare-fun m!655047 () Bool)

(assert (=> b!693321 m!655047))

(declare-fun m!655049 () Bool)

(assert (=> b!693322 m!655049))

(assert (=> b!693075 d!95645))

(declare-fun d!95647 () Bool)

(declare-fun res!457599 () Bool)

(declare-fun e!394457 () Bool)

(assert (=> d!95647 (=> res!457599 e!394457)))

(assert (=> d!95647 (= res!457599 (= (select (arr!19091 a!3626) from!3004) k0!2843))))

(assert (=> d!95647 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394457)))

(declare-fun b!693325 () Bool)

(declare-fun e!394458 () Bool)

(assert (=> b!693325 (= e!394457 e!394458)))

(declare-fun res!457600 () Bool)

(assert (=> b!693325 (=> (not res!457600) (not e!394458))))

(assert (=> b!693325 (= res!457600 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19473 a!3626)))))

(declare-fun b!693326 () Bool)

(assert (=> b!693326 (= e!394458 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95647 (not res!457599)) b!693325))

(assert (= (and b!693325 res!457600) b!693326))

(assert (=> d!95647 m!654857))

(declare-fun m!655051 () Bool)

(assert (=> b!693326 m!655051))

(assert (=> b!693063 d!95647))

(declare-fun d!95649 () Bool)

(assert (=> d!95649 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316524 () Unit!24464)

(declare-fun choose!13 (array!39855 (_ BitVec 64) (_ BitVec 32)) Unit!24464)

(assert (=> d!95649 (= lt!316524 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95649 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95649 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316524)))

(declare-fun bs!20253 () Bool)

(assert (= bs!20253 d!95649))

(assert (=> bs!20253 m!654871))

(declare-fun m!655073 () Bool)

(assert (=> bs!20253 m!655073))

(assert (=> b!693063 d!95649))

(assert (=> b!693062 d!95641))

(check-sat (not b!693313) (not bm!34234) (not b!693295) (not b!693326) (not bm!34235) (not d!95601) (not b!693259) (not b!693311) (not b!693322) (not d!95631) (not b!693248) (not bm!34238) (not b!693258) (not b!693252) (not b!693281) (not b!693280) (not b!693314) (not d!95623) (not b!693318) (not b!693315) (not b!693321) (not d!95639) (not b!693249) (not b!693283) (not b!693260) (not b!693263) (not d!95621) (not b!693297) (not d!95641) (not d!95649) (not b!693285))
(check-sat)
