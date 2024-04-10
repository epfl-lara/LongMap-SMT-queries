; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62054 () Bool)

(assert start!62054)

(declare-fun b!694947 () Bool)

(declare-fun res!458964 () Bool)

(declare-fun e!395242 () Bool)

(assert (=> b!694947 (=> (not res!458964) (not e!395242))))

(declare-datatypes ((List!13151 0))(
  ( (Nil!13148) (Cons!13147 (h!14192 (_ BitVec 64)) (t!19430 List!13151)) )
))
(declare-fun lt!316977 () List!13151)

(declare-fun noDuplicate!975 (List!13151) Bool)

(assert (=> b!694947 (= res!458964 (noDuplicate!975 lt!316977))))

(declare-fun b!694948 () Bool)

(declare-datatypes ((Unit!24558 0))(
  ( (Unit!24559) )
))
(declare-fun e!395243 () Unit!24558)

(declare-fun Unit!24560 () Unit!24558)

(assert (=> b!694948 (= e!395243 Unit!24560)))

(declare-datatypes ((array!39895 0))(
  ( (array!39896 (arr!19110 (Array (_ BitVec 32) (_ BitVec 64))) (size!19495 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39895)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694948 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316975 () Unit!24558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39895 (_ BitVec 64) (_ BitVec 32)) Unit!24558)

(assert (=> b!694948 (= lt!316975 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694948 false))

(declare-fun b!694949 () Bool)

(declare-fun res!458959 () Bool)

(declare-fun e!395248 () Bool)

(assert (=> b!694949 (=> (not res!458959) (not e!395248))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694949 (= res!458959 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19495 a!3626))))))

(declare-fun b!694950 () Bool)

(declare-fun e!395250 () Bool)

(assert (=> b!694950 (= e!395250 e!395242)))

(declare-fun res!458961 () Bool)

(assert (=> b!694950 (=> (not res!458961) (not e!395242))))

(assert (=> b!694950 (= res!458961 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!13151)

(declare-fun $colon$colon!440 (List!13151 (_ BitVec 64)) List!13151)

(assert (=> b!694950 (= lt!316977 ($colon$colon!440 acc!681 (select (arr!19110 a!3626) from!3004)))))

(declare-fun b!694951 () Bool)

(declare-fun e!395245 () Bool)

(declare-fun e!395244 () Bool)

(assert (=> b!694951 (= e!395245 e!395244)))

(declare-fun res!458958 () Bool)

(assert (=> b!694951 (=> (not res!458958) (not e!395244))))

(assert (=> b!694951 (= res!458958 (bvsle from!3004 i!1382))))

(declare-fun b!694952 () Bool)

(declare-fun res!458956 () Bool)

(assert (=> b!694952 (=> (not res!458956) (not e!395248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694952 (= res!458956 (validKeyInArray!0 k!2843))))

(declare-fun lt!316976 () array!39895)

(declare-fun b!694953 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39895 (_ BitVec 32) List!13151) Bool)

(assert (=> b!694953 (= e!395242 (not (arrayNoDuplicates!0 lt!316976 from!3004 acc!681)))))

(assert (=> b!694953 (arrayNoDuplicates!0 lt!316976 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977)))

(assert (=> b!694953 (= lt!316976 (array!39896 (store (arr!19110 a!3626) i!1382 k!2843) (size!19495 a!3626)))))

(declare-fun lt!316974 () Unit!24558)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39895 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13151) Unit!24558)

(assert (=> b!694953 (= lt!316974 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977))))

(declare-fun b!694954 () Bool)

(declare-fun res!458954 () Bool)

(assert (=> b!694954 (=> (not res!458954) (not e!395248))))

(assert (=> b!694954 (= res!458954 e!395245)))

(declare-fun res!458953 () Bool)

(assert (=> b!694954 (=> res!458953 e!395245)))

(declare-fun e!395241 () Bool)

(assert (=> b!694954 (= res!458953 e!395241)))

(declare-fun res!458957 () Bool)

(assert (=> b!694954 (=> (not res!458957) (not e!395241))))

(assert (=> b!694954 (= res!458957 (bvsgt from!3004 i!1382))))

(declare-fun b!694955 () Bool)

(declare-fun res!458974 () Bool)

(assert (=> b!694955 (=> (not res!458974) (not e!395248))))

(assert (=> b!694955 (= res!458974 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694956 () Bool)

(declare-fun e!395247 () Bool)

(declare-fun contains!3728 (List!13151 (_ BitVec 64)) Bool)

(assert (=> b!694956 (= e!395247 (not (contains!3728 lt!316977 k!2843)))))

(declare-fun b!694957 () Bool)

(declare-fun e!395249 () Bool)

(assert (=> b!694957 (= e!395249 (contains!3728 lt!316977 k!2843))))

(declare-fun b!694958 () Bool)

(declare-fun res!458975 () Bool)

(assert (=> b!694958 (=> (not res!458975) (not e!395242))))

(assert (=> b!694958 (= res!458975 (not (contains!3728 lt!316977 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694959 () Bool)

(declare-fun res!458967 () Bool)

(assert (=> b!694959 (=> (not res!458967) (not e!395242))))

(assert (=> b!694959 (= res!458967 (not (contains!3728 lt!316977 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694960 () Bool)

(declare-fun res!458962 () Bool)

(assert (=> b!694960 (=> (not res!458962) (not e!395242))))

(declare-fun e!395240 () Bool)

(assert (=> b!694960 (= res!458962 e!395240)))

(declare-fun res!458970 () Bool)

(assert (=> b!694960 (=> res!458970 e!395240)))

(assert (=> b!694960 (= res!458970 e!395249)))

(declare-fun res!458951 () Bool)

(assert (=> b!694960 (=> (not res!458951) (not e!395249))))

(assert (=> b!694960 (= res!458951 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694961 () Bool)

(assert (=> b!694961 (= e!395244 (not (contains!3728 acc!681 k!2843)))))

(declare-fun b!694962 () Bool)

(declare-fun res!458960 () Bool)

(assert (=> b!694962 (=> (not res!458960) (not e!395248))))

(assert (=> b!694962 (= res!458960 (not (contains!3728 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694963 () Bool)

(declare-fun res!458952 () Bool)

(assert (=> b!694963 (=> (not res!458952) (not e!395248))))

(assert (=> b!694963 (= res!458952 (noDuplicate!975 acc!681))))

(declare-fun b!694964 () Bool)

(assert (=> b!694964 (= e!395248 e!395250)))

(declare-fun res!458966 () Bool)

(assert (=> b!694964 (=> (not res!458966) (not e!395250))))

(assert (=> b!694964 (= res!458966 (not (= (select (arr!19110 a!3626) from!3004) k!2843)))))

(declare-fun lt!316978 () Unit!24558)

(assert (=> b!694964 (= lt!316978 e!395243)))

(declare-fun c!78365 () Bool)

(assert (=> b!694964 (= c!78365 (= (select (arr!19110 a!3626) from!3004) k!2843))))

(declare-fun b!694965 () Bool)

(declare-fun res!458963 () Bool)

(assert (=> b!694965 (=> (not res!458963) (not e!395248))))

(assert (=> b!694965 (= res!458963 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19495 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694966 () Bool)

(declare-fun res!458972 () Bool)

(assert (=> b!694966 (=> (not res!458972) (not e!395248))))

(assert (=> b!694966 (= res!458972 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!458968 () Bool)

(assert (=> start!62054 (=> (not res!458968) (not e!395248))))

(assert (=> start!62054 (= res!458968 (and (bvslt (size!19495 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19495 a!3626))))))

(assert (=> start!62054 e!395248))

(assert (=> start!62054 true))

(declare-fun array_inv!14906 (array!39895) Bool)

(assert (=> start!62054 (array_inv!14906 a!3626)))

(declare-fun b!694967 () Bool)

(declare-fun res!458973 () Bool)

(assert (=> b!694967 (=> (not res!458973) (not e!395248))))

(assert (=> b!694967 (= res!458973 (not (contains!3728 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694968 () Bool)

(assert (=> b!694968 (= e!395241 (contains!3728 acc!681 k!2843))))

(declare-fun b!694969 () Bool)

(declare-fun res!458971 () Bool)

(assert (=> b!694969 (=> (not res!458971) (not e!395248))))

(assert (=> b!694969 (= res!458971 (validKeyInArray!0 (select (arr!19110 a!3626) from!3004)))))

(declare-fun b!694970 () Bool)

(declare-fun Unit!24561 () Unit!24558)

(assert (=> b!694970 (= e!395243 Unit!24561)))

(declare-fun b!694971 () Bool)

(declare-fun res!458969 () Bool)

(assert (=> b!694971 (=> (not res!458969) (not e!395248))))

(assert (=> b!694971 (= res!458969 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13148))))

(declare-fun b!694972 () Bool)

(declare-fun res!458965 () Bool)

(assert (=> b!694972 (=> (not res!458965) (not e!395242))))

(assert (=> b!694972 (= res!458965 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977))))

(declare-fun b!694973 () Bool)

(assert (=> b!694973 (= e!395240 e!395247)))

(declare-fun res!458955 () Bool)

(assert (=> b!694973 (=> (not res!458955) (not e!395247))))

(assert (=> b!694973 (= res!458955 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62054 res!458968) b!694963))

(assert (= (and b!694963 res!458952) b!694967))

(assert (= (and b!694967 res!458973) b!694962))

(assert (= (and b!694962 res!458960) b!694954))

(assert (= (and b!694954 res!458957) b!694968))

(assert (= (and b!694954 (not res!458953)) b!694951))

(assert (= (and b!694951 res!458958) b!694961))

(assert (= (and b!694954 res!458954) b!694971))

(assert (= (and b!694971 res!458969) b!694955))

(assert (= (and b!694955 res!458974) b!694949))

(assert (= (and b!694949 res!458959) b!694952))

(assert (= (and b!694952 res!458956) b!694966))

(assert (= (and b!694966 res!458972) b!694965))

(assert (= (and b!694965 res!458963) b!694969))

(assert (= (and b!694969 res!458971) b!694964))

(assert (= (and b!694964 c!78365) b!694948))

(assert (= (and b!694964 (not c!78365)) b!694970))

(assert (= (and b!694964 res!458966) b!694950))

(assert (= (and b!694950 res!458961) b!694947))

(assert (= (and b!694947 res!458964) b!694959))

(assert (= (and b!694959 res!458967) b!694958))

(assert (= (and b!694958 res!458975) b!694960))

(assert (= (and b!694960 res!458951) b!694957))

(assert (= (and b!694960 (not res!458970)) b!694973))

(assert (= (and b!694973 res!458955) b!694956))

(assert (= (and b!694960 res!458962) b!694972))

(assert (= (and b!694972 res!458965) b!694953))

(declare-fun m!656525 () Bool)

(assert (=> b!694957 m!656525))

(declare-fun m!656527 () Bool)

(assert (=> b!694950 m!656527))

(assert (=> b!694950 m!656527))

(declare-fun m!656529 () Bool)

(assert (=> b!694950 m!656529))

(declare-fun m!656531 () Bool)

(assert (=> b!694972 m!656531))

(declare-fun m!656533 () Bool)

(assert (=> b!694953 m!656533))

(declare-fun m!656535 () Bool)

(assert (=> b!694953 m!656535))

(declare-fun m!656537 () Bool)

(assert (=> b!694953 m!656537))

(declare-fun m!656539 () Bool)

(assert (=> b!694953 m!656539))

(declare-fun m!656541 () Bool)

(assert (=> b!694959 m!656541))

(declare-fun m!656543 () Bool)

(assert (=> b!694962 m!656543))

(declare-fun m!656545 () Bool)

(assert (=> b!694961 m!656545))

(declare-fun m!656547 () Bool)

(assert (=> b!694948 m!656547))

(declare-fun m!656549 () Bool)

(assert (=> b!694948 m!656549))

(declare-fun m!656551 () Bool)

(assert (=> b!694971 m!656551))

(assert (=> b!694964 m!656527))

(declare-fun m!656553 () Bool)

(assert (=> b!694955 m!656553))

(declare-fun m!656555 () Bool)

(assert (=> b!694966 m!656555))

(assert (=> b!694968 m!656545))

(declare-fun m!656557 () Bool)

(assert (=> b!694958 m!656557))

(assert (=> b!694969 m!656527))

(assert (=> b!694969 m!656527))

(declare-fun m!656559 () Bool)

(assert (=> b!694969 m!656559))

(declare-fun m!656561 () Bool)

(assert (=> b!694952 m!656561))

(assert (=> b!694956 m!656525))

(declare-fun m!656563 () Bool)

(assert (=> b!694963 m!656563))

(declare-fun m!656565 () Bool)

(assert (=> b!694967 m!656565))

(declare-fun m!656567 () Bool)

(assert (=> b!694947 m!656567))

(declare-fun m!656569 () Bool)

(assert (=> start!62054 m!656569))

(push 1)

(assert (not b!694971))

(assert (not b!694958))

(assert (not b!694955))

(assert (not b!694967))

(assert (not b!694947))

(assert (not b!694962))

(assert (not b!694953))

(assert (not b!694963))

(assert (not b!694950))

(assert (not start!62054))

(assert (not b!694961))

(assert (not b!694959))

(assert (not b!694952))

(assert (not b!694968))

(assert (not b!694969))

(assert (not b!694956))

(assert (not b!694972))

(assert (not b!694957))

(assert (not b!694948))

(assert (not b!694966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95981 () Bool)

(declare-fun res!459212 () Bool)

(declare-fun e!395416 () Bool)

(assert (=> d!95981 (=> res!459212 e!395416)))

(assert (=> d!95981 (= res!459212 (bvsge from!3004 (size!19495 lt!316976)))))

(assert (=> d!95981 (= (arrayNoDuplicates!0 lt!316976 from!3004 acc!681) e!395416)))

(declare-fun b!695248 () Bool)

(declare-fun e!395419 () Bool)

(declare-fun call!34291 () Bool)

(assert (=> b!695248 (= e!395419 call!34291)))

(declare-fun b!695249 () Bool)

(declare-fun e!395418 () Bool)

(assert (=> b!695249 (= e!395418 (contains!3728 acc!681 (select (arr!19110 lt!316976) from!3004)))))

(declare-fun b!695250 () Bool)

(declare-fun e!395417 () Bool)

(assert (=> b!695250 (= e!395417 e!395419)))

(declare-fun c!78385 () Bool)

(assert (=> b!695250 (= c!78385 (validKeyInArray!0 (select (arr!19110 lt!316976) from!3004)))))

(declare-fun b!695251 () Bool)

(assert (=> b!695251 (= e!395419 call!34291)))

(declare-fun b!695252 () Bool)

(assert (=> b!695252 (= e!395416 e!395417)))

(declare-fun res!459214 () Bool)

(assert (=> b!695252 (=> (not res!459214) (not e!395417))))

(assert (=> b!695252 (= res!459214 (not e!395418))))

(declare-fun res!459213 () Bool)

(assert (=> b!695252 (=> (not res!459213) (not e!395418))))

(assert (=> b!695252 (= res!459213 (validKeyInArray!0 (select (arr!19110 lt!316976) from!3004)))))

(declare-fun bm!34288 () Bool)

(assert (=> bm!34288 (= call!34291 (arrayNoDuplicates!0 lt!316976 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78385 (Cons!13147 (select (arr!19110 lt!316976) from!3004) acc!681) acc!681)))))

(assert (= (and d!95981 (not res!459212)) b!695252))

(assert (= (and b!695252 res!459213) b!695249))

(assert (= (and b!695252 res!459214) b!695250))

(assert (= (and b!695250 c!78385) b!695248))

(assert (= (and b!695250 (not c!78385)) b!695251))

(assert (= (or b!695248 b!695251) bm!34288))

(declare-fun m!656771 () Bool)

(assert (=> b!695249 m!656771))

(assert (=> b!695249 m!656771))

(declare-fun m!656773 () Bool)

(assert (=> b!695249 m!656773))

(assert (=> b!695250 m!656771))

(assert (=> b!695250 m!656771))

(declare-fun m!656775 () Bool)

(assert (=> b!695250 m!656775))

(assert (=> b!695252 m!656771))

(assert (=> b!695252 m!656771))

(assert (=> b!695252 m!656775))

(assert (=> bm!34288 m!656771))

(declare-fun m!656777 () Bool)

(assert (=> bm!34288 m!656777))

(assert (=> b!694953 d!95981))

(declare-fun d!95987 () Bool)

(declare-fun res!459215 () Bool)

(declare-fun e!395420 () Bool)

(assert (=> d!95987 (=> res!459215 e!395420)))

(assert (=> d!95987 (= res!459215 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19495 lt!316976)))))

(assert (=> d!95987 (= (arrayNoDuplicates!0 lt!316976 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977) e!395420)))

(declare-fun b!695253 () Bool)

(declare-fun e!395423 () Bool)

(declare-fun call!34292 () Bool)

(assert (=> b!695253 (= e!395423 call!34292)))

(declare-fun b!695254 () Bool)

(declare-fun e!395422 () Bool)

(assert (=> b!695254 (= e!395422 (contains!3728 lt!316977 (select (arr!19110 lt!316976) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!695255 () Bool)

(declare-fun e!395421 () Bool)

(assert (=> b!695255 (= e!395421 e!395423)))

(declare-fun c!78386 () Bool)

(assert (=> b!695255 (= c!78386 (validKeyInArray!0 (select (arr!19110 lt!316976) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!695256 () Bool)

(assert (=> b!695256 (= e!395423 call!34292)))

(declare-fun b!695257 () Bool)

(assert (=> b!695257 (= e!395420 e!395421)))

(declare-fun res!459217 () Bool)

(assert (=> b!695257 (=> (not res!459217) (not e!395421))))

(assert (=> b!695257 (= res!459217 (not e!395422))))

(declare-fun res!459216 () Bool)

(assert (=> b!695257 (=> (not res!459216) (not e!395422))))

(assert (=> b!695257 (= res!459216 (validKeyInArray!0 (select (arr!19110 lt!316976) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34289 () Bool)

(assert (=> bm!34289 (= call!34292 (arrayNoDuplicates!0 lt!316976 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78386 (Cons!13147 (select (arr!19110 lt!316976) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316977) lt!316977)))))

(assert (= (and d!95987 (not res!459215)) b!695257))

(assert (= (and b!695257 res!459216) b!695254))

(assert (= (and b!695257 res!459217) b!695255))

(assert (= (and b!695255 c!78386) b!695253))

(assert (= (and b!695255 (not c!78386)) b!695256))

(assert (= (or b!695253 b!695256) bm!34289))

(declare-fun m!656779 () Bool)

(assert (=> b!695254 m!656779))

(assert (=> b!695254 m!656779))

(declare-fun m!656781 () Bool)

(assert (=> b!695254 m!656781))

(assert (=> b!695255 m!656779))

(assert (=> b!695255 m!656779))

(declare-fun m!656783 () Bool)

(assert (=> b!695255 m!656783))

(assert (=> b!695257 m!656779))

(assert (=> b!695257 m!656779))

(assert (=> b!695257 m!656783))

(assert (=> bm!34289 m!656779))

(declare-fun m!656785 () Bool)

(assert (=> bm!34289 m!656785))

(assert (=> b!694953 d!95987))

(declare-fun d!95989 () Bool)

(declare-fun e!395431 () Bool)

(assert (=> d!95989 e!395431))

(declare-fun res!459225 () Bool)

(assert (=> d!95989 (=> (not res!459225) (not e!395431))))

(assert (=> d!95989 (= res!459225 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19495 a!3626))))))

(declare-fun lt!317032 () Unit!24558)

(declare-fun choose!41 (array!39895 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13151) Unit!24558)

(assert (=> d!95989 (= lt!317032 (choose!41 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977))))

(assert (=> d!95989 (bvslt (size!19495 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95989 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316977) lt!317032)))

(declare-fun b!695265 () Bool)

(assert (=> b!695265 (= e!395431 (arrayNoDuplicates!0 (array!39896 (store (arr!19110 a!3626) i!1382 k!2843) (size!19495 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316977))))

(assert (= (and d!95989 res!459225) b!695265))

(declare-fun m!656795 () Bool)

(assert (=> d!95989 m!656795))

(assert (=> b!695265 m!656537))

(declare-fun m!656797 () Bool)

(assert (=> b!695265 m!656797))

(assert (=> b!694953 d!95989))

(declare-fun d!95997 () Bool)

(declare-fun res!459236 () Bool)

(declare-fun e!395442 () Bool)

(assert (=> d!95997 (=> res!459236 e!395442)))

(assert (=> d!95997 (= res!459236 (is-Nil!13148 acc!681))))

(assert (=> d!95997 (= (noDuplicate!975 acc!681) e!395442)))

(declare-fun b!695276 () Bool)

(declare-fun e!395443 () Bool)

(assert (=> b!695276 (= e!395442 e!395443)))

(declare-fun res!459237 () Bool)

(assert (=> b!695276 (=> (not res!459237) (not e!395443))))

(assert (=> b!695276 (= res!459237 (not (contains!3728 (t!19430 acc!681) (h!14192 acc!681))))))

(declare-fun b!695277 () Bool)

(assert (=> b!695277 (= e!395443 (noDuplicate!975 (t!19430 acc!681)))))

(assert (= (and d!95997 (not res!459236)) b!695276))

(assert (= (and b!695276 res!459237) b!695277))

(declare-fun m!656803 () Bool)

(assert (=> b!695276 m!656803))

(declare-fun m!656805 () Bool)

(assert (=> b!695277 m!656805))

(assert (=> b!694963 d!95997))

(declare-fun d!96001 () Bool)

(assert (=> d!96001 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!694952 d!96001))

(declare-fun d!96005 () Bool)

(declare-fun lt!317037 () Bool)

(declare-fun content!323 (List!13151) (Set (_ BitVec 64)))

(assert (=> d!96005 (= lt!317037 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!323 acc!681)))))

(declare-fun e!395467 () Bool)

(assert (=> d!96005 (= lt!317037 e!395467)))

(declare-fun res!459258 () Bool)

(assert (=> d!96005 (=> (not res!459258) (not e!395467))))

(assert (=> d!96005 (= res!459258 (is-Cons!13147 acc!681))))

(assert (=> d!96005 (= (contains!3728 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317037)))

(declare-fun b!695303 () Bool)

(declare-fun e!395466 () Bool)

(assert (=> b!695303 (= e!395467 e!395466)))

(declare-fun res!459257 () Bool)

(assert (=> b!695303 (=> res!459257 e!395466)))

(assert (=> b!695303 (= res!459257 (= (h!14192 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!695304 () Bool)

(assert (=> b!695304 (= e!395466 (contains!3728 (t!19430 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96005 res!459258) b!695303))

(assert (= (and b!695303 (not res!459257)) b!695304))

(declare-fun m!656837 () Bool)

(assert (=> d!96005 m!656837))

(declare-fun m!656839 () Bool)

(assert (=> d!96005 m!656839))

(declare-fun m!656843 () Bool)

(assert (=> b!695304 m!656843))

(assert (=> b!694962 d!96005))

(declare-fun d!96019 () Bool)

(declare-fun lt!317038 () Bool)

(assert (=> d!96019 (= lt!317038 (set.member k!2843 (content!323 lt!316977)))))

(declare-fun e!395470 () Bool)

(assert (=> d!96019 (= lt!317038 e!395470)))

(declare-fun res!459260 () Bool)

(assert (=> d!96019 (=> (not res!459260) (not e!395470))))

(assert (=> d!96019 (= res!459260 (is-Cons!13147 lt!316977))))

(assert (=> d!96019 (= (contains!3728 lt!316977 k!2843) lt!317038)))

(declare-fun b!695305 () Bool)

(declare-fun e!395468 () Bool)

(assert (=> b!695305 (= e!395470 e!395468)))

(declare-fun res!459259 () Bool)

(assert (=> b!695305 (=> res!459259 e!395468)))

(assert (=> b!695305 (= res!459259 (= (h!14192 lt!316977) k!2843))))

(declare-fun b!695306 () Bool)

(assert (=> b!695306 (= e!395468 (contains!3728 (t!19430 lt!316977) k!2843))))

(assert (= (and d!96019 res!459260) b!695305))

(assert (= (and b!695305 (not res!459259)) b!695306))

(declare-fun m!656845 () Bool)

(assert (=> d!96019 m!656845))

(declare-fun m!656847 () Bool)

(assert (=> d!96019 m!656847))

(declare-fun m!656851 () Bool)

(assert (=> b!695306 m!656851))

(assert (=> b!694956 d!96019))

(declare-fun d!96023 () Bool)

(declare-fun res!459267 () Bool)

(declare-fun e!395476 () Bool)

(assert (=> d!96023 (=> res!459267 e!395476)))

(assert (=> d!96023 (= res!459267 (= (select (arr!19110 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!96023 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!395476)))

(declare-fun b!695313 () Bool)

(declare-fun e!395477 () Bool)

(assert (=> b!695313 (= e!395476 e!395477)))

(declare-fun res!459268 () Bool)

(assert (=> b!695313 (=> (not res!459268) (not e!395477))))

(assert (=> b!695313 (= res!459268 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19495 a!3626)))))

(declare-fun b!695314 () Bool)

(assert (=> b!695314 (= e!395477 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96023 (not res!459267)) b!695313))

(assert (= (and b!695313 res!459268) b!695314))

(declare-fun m!656855 () Bool)

(assert (=> d!96023 m!656855))

(declare-fun m!656857 () Bool)

(assert (=> b!695314 m!656857))

(assert (=> b!694966 d!96023))

(declare-fun d!96027 () Bool)

(declare-fun res!459269 () Bool)

(declare-fun e!395478 () Bool)

(assert (=> d!96027 (=> res!459269 e!395478)))

(assert (=> d!96027 (= res!459269 (bvsge from!3004 (size!19495 a!3626)))))

(assert (=> d!96027 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!395478)))

(declare-fun b!695315 () Bool)

(declare-fun e!395481 () Bool)

(declare-fun call!34296 () Bool)

(assert (=> b!695315 (= e!395481 call!34296)))

(declare-fun e!395480 () Bool)

(declare-fun b!695316 () Bool)

(assert (=> b!695316 (= e!395480 (contains!3728 acc!681 (select (arr!19110 a!3626) from!3004)))))

(declare-fun b!695317 () Bool)

(declare-fun e!395479 () Bool)

(assert (=> b!695317 (= e!395479 e!395481)))

(declare-fun c!78390 () Bool)

(assert (=> b!695317 (= c!78390 (validKeyInArray!0 (select (arr!19110 a!3626) from!3004)))))

(declare-fun b!695318 () Bool)

(assert (=> b!695318 (= e!395481 call!34296)))

(declare-fun b!695319 () Bool)

(assert (=> b!695319 (= e!395478 e!395479)))

(declare-fun res!459271 () Bool)

(assert (=> b!695319 (=> (not res!459271) (not e!395479))))

(assert (=> b!695319 (= res!459271 (not e!395480))))

(declare-fun res!459270 () Bool)

(assert (=> b!695319 (=> (not res!459270) (not e!395480))))

(assert (=> b!695319 (= res!459270 (validKeyInArray!0 (select (arr!19110 a!3626) from!3004)))))

(declare-fun bm!34293 () Bool)

(assert (=> bm!34293 (= call!34296 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78390 (Cons!13147 (select (arr!19110 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!96027 (not res!459269)) b!695319))

(assert (= (and b!695319 res!459270) b!695316))

(assert (= (and b!695319 res!459271) b!695317))

(assert (= (and b!695317 c!78390) b!695315))

(assert (= (and b!695317 (not c!78390)) b!695318))

(assert (= (or b!695315 b!695318) bm!34293))

(assert (=> b!695316 m!656527))

(assert (=> b!695316 m!656527))

(declare-fun m!656863 () Bool)

(assert (=> b!695316 m!656863))

(assert (=> b!695317 m!656527))

(assert (=> b!695317 m!656527))

(assert (=> b!695317 m!656559))

(assert (=> b!695319 m!656527))

(assert (=> b!695319 m!656527))

(assert (=> b!695319 m!656559))

(assert (=> bm!34293 m!656527))

(declare-fun m!656865 () Bool)

(assert (=> bm!34293 m!656865))

(assert (=> b!694955 d!96027))

(declare-fun d!96035 () Bool)

(declare-fun res!459276 () Bool)

(declare-fun e!395486 () Bool)

(assert (=> d!96035 (=> res!459276 e!395486)))

(assert (=> d!96035 (= res!459276 (= (select (arr!19110 a!3626) from!3004) k!2843))))

(assert (=> d!96035 (= (arrayContainsKey!0 a!3626 k!2843 from!3004) e!395486)))

(declare-fun b!695324 () Bool)

(declare-fun e!395487 () Bool)

(assert (=> b!695324 (= e!395486 e!395487)))

(declare-fun res!459277 () Bool)

(assert (=> b!695324 (=> (not res!459277) (not e!395487))))

(assert (=> b!695324 (= res!459277 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19495 a!3626)))))

(declare-fun b!695325 () Bool)

(assert (=> b!695325 (= e!395487 (arrayContainsKey!0 a!3626 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!96035 (not res!459276)) b!695324))

(assert (= (and b!695324 res!459277) b!695325))

(assert (=> d!96035 m!656527))

(declare-fun m!656871 () Bool)

(assert (=> b!695325 m!656871))

(assert (=> b!694948 d!96035))

(declare-fun d!96037 () Bool)

(assert (=> d!96037 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!317046 () Unit!24558)

(declare-fun choose!13 (array!39895 (_ BitVec 64) (_ BitVec 32)) Unit!24558)

(assert (=> d!96037 (= lt!317046 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!96037 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!96037 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!317046)))

(declare-fun bs!20307 () Bool)

(assert (= bs!20307 d!96037))

(assert (=> bs!20307 m!656555))

(declare-fun m!656873 () Bool)

(assert (=> bs!20307 m!656873))

(assert (=> b!694948 d!96037))

(declare-fun d!96039 () Bool)

(assert (=> d!96039 (= (validKeyInArray!0 (select (arr!19110 a!3626) from!3004)) (and (not (= (select (arr!19110 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19110 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!694969 d!96039))

(declare-fun d!96041 () Bool)

(declare-fun lt!317047 () Bool)

(assert (=> d!96041 (= lt!317047 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!323 lt!316977)))))

(declare-fun e!395489 () Bool)

(assert (=> d!96041 (= lt!317047 e!395489)))

(declare-fun res!459279 () Bool)

(assert (=> d!96041 (=> (not res!459279) (not e!395489))))

(assert (=> d!96041 (= res!459279 (is-Cons!13147 lt!316977))))

(assert (=> d!96041 (= (contains!3728 lt!316977 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317047)))

(declare-fun b!695326 () Bool)

(declare-fun e!395488 () Bool)

(assert (=> b!695326 (= e!395489 e!395488)))

(declare-fun res!459278 () Bool)

(assert (=> b!695326 (=> res!459278 e!395488)))

(assert (=> b!695326 (= res!459278 (= (h!14192 lt!316977) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!695327 () Bool)

(assert (=> b!695327 (= e!395488 (contains!3728 (t!19430 lt!316977) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96041 res!459279) b!695326))

(assert (= (and b!695326 (not res!459278)) b!695327))

(assert (=> d!96041 m!656845))

(declare-fun m!656875 () Bool)

(assert (=> d!96041 m!656875))

(declare-fun m!656877 () Bool)

(assert (=> b!695327 m!656877))

(assert (=> b!694958 d!96041))

(declare-fun d!96043 () Bool)

(assert (=> d!96043 (= (array_inv!14906 a!3626) (bvsge (size!19495 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62054 d!96043))

(declare-fun d!96045 () Bool)

(declare-fun res!459280 () Bool)

(declare-fun e!395490 () Bool)

(assert (=> d!96045 (=> res!459280 e!395490)))

(assert (=> d!96045 (= res!459280 (is-Nil!13148 lt!316977))))

(assert (=> d!96045 (= (noDuplicate!975 lt!316977) e!395490)))

(declare-fun b!695328 () Bool)

(declare-fun e!395491 () Bool)

(assert (=> b!695328 (= e!395490 e!395491)))

(declare-fun res!459281 () Bool)

(assert (=> b!695328 (=> (not res!459281) (not e!395491))))

(assert (=> b!695328 (= res!459281 (not (contains!3728 (t!19430 lt!316977) (h!14192 lt!316977))))))

(declare-fun b!695329 () Bool)

(assert (=> b!695329 (= e!395491 (noDuplicate!975 (t!19430 lt!316977)))))

(assert (= (and d!96045 (not res!459280)) b!695328))

(assert (= (and b!695328 res!459281) b!695329))

(declare-fun m!656879 () Bool)

(assert (=> b!695328 m!656879))

(declare-fun m!656881 () Bool)

(assert (=> b!695329 m!656881))

(assert (=> b!694947 d!96045))

(declare-fun d!96047 () Bool)

(declare-fun lt!317048 () Bool)

(assert (=> d!96047 (= lt!317048 (set.member k!2843 (content!323 acc!681)))))

(declare-fun e!395493 () Bool)

(assert (=> d!96047 (= lt!317048 e!395493)))

(declare-fun res!459283 () Bool)

(assert (=> d!96047 (=> (not res!459283) (not e!395493))))

(assert (=> d!96047 (= res!459283 (is-Cons!13147 acc!681))))

(assert (=> d!96047 (= (contains!3728 acc!681 k!2843) lt!317048)))

(declare-fun b!695330 () Bool)

(declare-fun e!395492 () Bool)

(assert (=> b!695330 (= e!395493 e!395492)))

(declare-fun res!459282 () Bool)

(assert (=> b!695330 (=> res!459282 e!395492)))

(assert (=> b!695330 (= res!459282 (= (h!14192 acc!681) k!2843))))

(declare-fun b!695331 () Bool)

(assert (=> b!695331 (= e!395492 (contains!3728 (t!19430 acc!681) k!2843))))

(assert (= (and d!96047 res!459283) b!695330))

(assert (= (and b!695330 (not res!459282)) b!695331))

(assert (=> d!96047 m!656837))

(declare-fun m!656883 () Bool)

(assert (=> d!96047 m!656883))

(declare-fun m!656885 () Bool)

(assert (=> b!695331 m!656885))

(assert (=> b!694968 d!96047))

(assert (=> b!694957 d!96019))

(declare-fun d!96049 () Bool)

(declare-fun lt!317049 () Bool)

(assert (=> d!96049 (= lt!317049 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!323 acc!681)))))

(declare-fun e!395495 () Bool)

(assert (=> d!96049 (= lt!317049 e!395495)))

(declare-fun res!459285 () Bool)

(assert (=> d!96049 (=> (not res!459285) (not e!395495))))

(assert (=> d!96049 (= res!459285 (is-Cons!13147 acc!681))))

(assert (=> d!96049 (= (contains!3728 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317049)))

(declare-fun b!695332 () Bool)

(declare-fun e!395494 () Bool)

(assert (=> b!695332 (= e!395495 e!395494)))

(declare-fun res!459284 () Bool)

(assert (=> b!695332 (=> res!459284 e!395494)))

(assert (=> b!695332 (= res!459284 (= (h!14192 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!695333 () Bool)

(assert (=> b!695333 (= e!395494 (contains!3728 (t!19430 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96049 res!459285) b!695332))

(assert (= (and b!695332 (not res!459284)) b!695333))

(assert (=> d!96049 m!656837))

(declare-fun m!656887 () Bool)

(assert (=> d!96049 m!656887))

(declare-fun m!656889 () Bool)

(assert (=> b!695333 m!656889))

(assert (=> b!694967 d!96049))

(declare-fun d!96051 () Bool)

(declare-fun res!459286 () Bool)

(declare-fun e!395496 () Bool)

(assert (=> d!96051 (=> res!459286 e!395496)))

