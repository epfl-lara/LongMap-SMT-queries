; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43892 () Bool)

(assert start!43892)

(declare-fun b!484704 () Bool)

(declare-fun res!288736 () Bool)

(declare-fun e!285340 () Bool)

(assert (=> b!484704 (=> (not res!288736) (not e!285340))))

(declare-datatypes ((B!1144 0))(
  ( (B!1145 (val!7024 Int)) )
))
(declare-datatypes ((tuple2!9250 0))(
  ( (tuple2!9251 (_1!4636 (_ BitVec 64)) (_2!4636 B!1144)) )
))
(declare-datatypes ((List!9288 0))(
  ( (Nil!9285) (Cons!9284 (h!10140 tuple2!9250) (t!15510 List!9288)) )
))
(declare-fun l!956 () List!9288)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!390 (List!9288 (_ BitVec 64)) Bool)

(assert (=> b!484704 (= res!288736 (not (containsKey!390 (t!15510 l!956) key!251)))))

(declare-fun b!484705 () Bool)

(declare-fun res!288739 () Bool)

(declare-fun e!285342 () Bool)

(assert (=> b!484705 (=> (not res!288739) (not e!285342))))

(assert (=> b!484705 (= res!288739 (not (containsKey!390 l!956 key!251)))))

(declare-fun b!484706 () Bool)

(declare-fun lt!219417 () List!9288)

(declare-fun length!12 (List!9288) Int)

(assert (=> b!484706 (= e!285340 (not (= (length!12 lt!219417) (+ 1 (length!12 l!956)))))))

(declare-fun value!166 () B!1144)

(declare-fun insertStrictlySorted!242 (List!9288 (_ BitVec 64) B!1144) List!9288)

(assert (=> b!484706 (= (length!12 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)) (+ 1 (length!12 (t!15510 l!956))))))

(declare-datatypes ((Unit!14184 0))(
  ( (Unit!14185) )
))
(declare-fun lt!219418 () Unit!14184)

(declare-fun lemmaAddNewKeyIncrementSize!5 (List!9288 (_ BitVec 64) B!1144) Unit!14184)

(assert (=> b!484706 (= lt!219418 (lemmaAddNewKeyIncrementSize!5 (t!15510 l!956) key!251 value!166))))

(declare-fun b!484708 () Bool)

(declare-fun res!288740 () Bool)

(assert (=> b!484708 (=> (not res!288740) (not e!285340))))

(declare-fun isStrictlySorted!427 (List!9288) Bool)

(assert (=> b!484708 (= res!288740 (isStrictlySorted!427 (t!15510 l!956)))))

(declare-fun b!484709 () Bool)

(assert (=> b!484709 (= e!285342 e!285340)))

(declare-fun res!288738 () Bool)

(assert (=> b!484709 (=> (not res!288738) (not e!285340))))

(get-info :version)

(assert (=> b!484709 (= res!288738 (and ((_ is Cons!9284) l!956) (bvslt (_1!4636 (h!10140 l!956)) key!251)))))

(assert (=> b!484709 (= lt!219417 (insertStrictlySorted!242 l!956 key!251 value!166))))

(declare-fun res!288737 () Bool)

(assert (=> start!43892 (=> (not res!288737) (not e!285342))))

(assert (=> start!43892 (= res!288737 (isStrictlySorted!427 l!956))))

(assert (=> start!43892 e!285342))

(declare-fun e!285341 () Bool)

(assert (=> start!43892 e!285341))

(assert (=> start!43892 true))

(declare-fun tp_is_empty!13953 () Bool)

(assert (=> start!43892 tp_is_empty!13953))

(declare-fun b!484707 () Bool)

(declare-fun tp!43555 () Bool)

(assert (=> b!484707 (= e!285341 (and tp_is_empty!13953 tp!43555))))

(assert (= (and start!43892 res!288737) b!484705))

(assert (= (and b!484705 res!288739) b!484709))

(assert (= (and b!484709 res!288738) b!484708))

(assert (= (and b!484708 res!288740) b!484704))

(assert (= (and b!484704 res!288736) b!484706))

(assert (= (and start!43892 ((_ is Cons!9284) l!956)) b!484707))

(declare-fun m!465127 () Bool)

(assert (=> b!484706 m!465127))

(declare-fun m!465129 () Bool)

(assert (=> b!484706 m!465129))

(declare-fun m!465131 () Bool)

(assert (=> b!484706 m!465131))

(declare-fun m!465133 () Bool)

(assert (=> b!484706 m!465133))

(assert (=> b!484706 m!465129))

(declare-fun m!465135 () Bool)

(assert (=> b!484706 m!465135))

(declare-fun m!465137 () Bool)

(assert (=> b!484706 m!465137))

(declare-fun m!465139 () Bool)

(assert (=> start!43892 m!465139))

(declare-fun m!465141 () Bool)

(assert (=> b!484705 m!465141))

(declare-fun m!465143 () Bool)

(assert (=> b!484709 m!465143))

(declare-fun m!465145 () Bool)

(assert (=> b!484704 m!465145))

(declare-fun m!465147 () Bool)

(assert (=> b!484708 m!465147))

(check-sat (not b!484705) (not b!484704) tp_is_empty!13953 (not b!484706) (not b!484709) (not b!484707) (not start!43892) (not b!484708))
(check-sat)
(get-model)

(declare-fun d!77147 () Bool)

(declare-fun res!288764 () Bool)

(declare-fun e!285360 () Bool)

(assert (=> d!77147 (=> res!288764 e!285360)))

(assert (=> d!77147 (= res!288764 (and ((_ is Cons!9284) l!956) (= (_1!4636 (h!10140 l!956)) key!251)))))

(assert (=> d!77147 (= (containsKey!390 l!956 key!251) e!285360)))

(declare-fun b!484736 () Bool)

(declare-fun e!285361 () Bool)

(assert (=> b!484736 (= e!285360 e!285361)))

(declare-fun res!288765 () Bool)

(assert (=> b!484736 (=> (not res!288765) (not e!285361))))

(assert (=> b!484736 (= res!288765 (and (or (not ((_ is Cons!9284) l!956)) (bvsle (_1!4636 (h!10140 l!956)) key!251)) ((_ is Cons!9284) l!956) (bvslt (_1!4636 (h!10140 l!956)) key!251)))))

(declare-fun b!484737 () Bool)

(assert (=> b!484737 (= e!285361 (containsKey!390 (t!15510 l!956) key!251))))

(assert (= (and d!77147 (not res!288764)) b!484736))

(assert (= (and b!484736 res!288765) b!484737))

(assert (=> b!484737 m!465145))

(assert (=> b!484705 d!77147))

(declare-fun b!484822 () Bool)

(declare-fun c!58327 () Bool)

(assert (=> b!484822 (= c!58327 (and ((_ is Cons!9284) (t!15510 l!956)) (bvsgt (_1!4636 (h!10140 (t!15510 l!956))) key!251)))))

(declare-fun e!285408 () List!9288)

(declare-fun e!285409 () List!9288)

(assert (=> b!484822 (= e!285408 e!285409)))

(declare-fun b!484823 () Bool)

(declare-fun call!31175 () List!9288)

(assert (=> b!484823 (= e!285409 call!31175)))

(declare-fun b!484824 () Bool)

(declare-fun e!285407 () List!9288)

(assert (=> b!484824 (= e!285407 (insertStrictlySorted!242 (t!15510 (t!15510 l!956)) key!251 value!166))))

(declare-fun b!484825 () Bool)

(declare-fun e!285406 () List!9288)

(declare-fun call!31173 () List!9288)

(assert (=> b!484825 (= e!285406 call!31173)))

(declare-fun b!484826 () Bool)

(declare-fun call!31174 () List!9288)

(assert (=> b!484826 (= e!285408 call!31174)))

(declare-fun c!58328 () Bool)

(declare-fun bm!31170 () Bool)

(declare-fun $colon$colon!126 (List!9288 tuple2!9250) List!9288)

(assert (=> bm!31170 (= call!31173 ($colon$colon!126 e!285407 (ite c!58328 (h!10140 (t!15510 l!956)) (tuple2!9251 key!251 value!166))))))

(declare-fun c!58325 () Bool)

(assert (=> bm!31170 (= c!58325 c!58328)))

(declare-fun lt!219436 () List!9288)

(declare-fun b!484827 () Bool)

(declare-fun e!285410 () Bool)

(declare-fun contains!2686 (List!9288 tuple2!9250) Bool)

(assert (=> b!484827 (= e!285410 (contains!2686 lt!219436 (tuple2!9251 key!251 value!166)))))

(declare-fun d!77153 () Bool)

(assert (=> d!77153 e!285410))

(declare-fun res!288787 () Bool)

(assert (=> d!77153 (=> (not res!288787) (not e!285410))))

(assert (=> d!77153 (= res!288787 (isStrictlySorted!427 lt!219436))))

(assert (=> d!77153 (= lt!219436 e!285406)))

(assert (=> d!77153 (= c!58328 (and ((_ is Cons!9284) (t!15510 l!956)) (bvslt (_1!4636 (h!10140 (t!15510 l!956))) key!251)))))

(assert (=> d!77153 (isStrictlySorted!427 (t!15510 l!956))))

(assert (=> d!77153 (= (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166) lt!219436)))

(declare-fun b!484828 () Bool)

(assert (=> b!484828 (= e!285406 e!285408)))

(declare-fun c!58326 () Bool)

(assert (=> b!484828 (= c!58326 (and ((_ is Cons!9284) (t!15510 l!956)) (= (_1!4636 (h!10140 (t!15510 l!956))) key!251)))))

(declare-fun b!484829 () Bool)

(assert (=> b!484829 (= e!285409 call!31175)))

(declare-fun bm!31171 () Bool)

(assert (=> bm!31171 (= call!31175 call!31174)))

(declare-fun b!484830 () Bool)

(assert (=> b!484830 (= e!285407 (ite c!58326 (t!15510 (t!15510 l!956)) (ite c!58327 (Cons!9284 (h!10140 (t!15510 l!956)) (t!15510 (t!15510 l!956))) Nil!9285)))))

(declare-fun bm!31172 () Bool)

(assert (=> bm!31172 (= call!31174 call!31173)))

(declare-fun b!484831 () Bool)

(declare-fun res!288786 () Bool)

(assert (=> b!484831 (=> (not res!288786) (not e!285410))))

(assert (=> b!484831 (= res!288786 (containsKey!390 lt!219436 key!251))))

(assert (= (and d!77153 c!58328) b!484825))

(assert (= (and d!77153 (not c!58328)) b!484828))

(assert (= (and b!484828 c!58326) b!484826))

(assert (= (and b!484828 (not c!58326)) b!484822))

(assert (= (and b!484822 c!58327) b!484823))

(assert (= (and b!484822 (not c!58327)) b!484829))

(assert (= (or b!484823 b!484829) bm!31171))

(assert (= (or b!484826 bm!31171) bm!31172))

(assert (= (or b!484825 bm!31172) bm!31170))

(assert (= (and bm!31170 c!58325) b!484824))

(assert (= (and bm!31170 (not c!58325)) b!484830))

(assert (= (and d!77153 res!288787) b!484831))

(assert (= (and b!484831 res!288786) b!484827))

(declare-fun m!465205 () Bool)

(assert (=> bm!31170 m!465205))

(declare-fun m!465207 () Bool)

(assert (=> b!484824 m!465207))

(declare-fun m!465209 () Bool)

(assert (=> b!484831 m!465209))

(declare-fun m!465211 () Bool)

(assert (=> b!484827 m!465211))

(declare-fun m!465213 () Bool)

(assert (=> d!77153 m!465213))

(assert (=> d!77153 m!465147))

(assert (=> b!484706 d!77153))

(declare-fun d!77175 () Bool)

(declare-fun size!15462 (List!9288) Int)

(assert (=> d!77175 (= (length!12 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)) (size!15462 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)))))

(declare-fun bs!15433 () Bool)

(assert (= bs!15433 d!77175))

(assert (=> bs!15433 m!465129))

(declare-fun m!465223 () Bool)

(assert (=> bs!15433 m!465223))

(assert (=> b!484706 d!77175))

(declare-fun d!77179 () Bool)

(assert (=> d!77179 (= (length!12 (t!15510 l!956)) (size!15462 (t!15510 l!956)))))

(declare-fun bs!15434 () Bool)

(assert (= bs!15434 d!77179))

(declare-fun m!465225 () Bool)

(assert (=> bs!15434 m!465225))

(assert (=> b!484706 d!77179))

(declare-fun d!77181 () Bool)

(assert (=> d!77181 (= (length!12 l!956) (size!15462 l!956))))

(declare-fun bs!15435 () Bool)

(assert (= bs!15435 d!77181))

(declare-fun m!465227 () Bool)

(assert (=> bs!15435 m!465227))

(assert (=> b!484706 d!77181))

(declare-fun d!77183 () Bool)

(assert (=> d!77183 (= (length!12 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)) (+ (length!12 (t!15510 l!956)) 1))))

(declare-fun lt!219444 () Unit!14184)

(declare-fun choose!1384 (List!9288 (_ BitVec 64) B!1144) Unit!14184)

(assert (=> d!77183 (= lt!219444 (choose!1384 (t!15510 l!956) key!251 value!166))))

(assert (=> d!77183 (isStrictlySorted!427 (t!15510 l!956))))

(assert (=> d!77183 (= (lemmaAddNewKeyIncrementSize!5 (t!15510 l!956) key!251 value!166) lt!219444)))

(declare-fun bs!15440 () Bool)

(assert (= bs!15440 d!77183))

(assert (=> bs!15440 m!465133))

(assert (=> bs!15440 m!465129))

(assert (=> bs!15440 m!465129))

(assert (=> bs!15440 m!465131))

(declare-fun m!465249 () Bool)

(assert (=> bs!15440 m!465249))

(assert (=> bs!15440 m!465147))

(assert (=> b!484706 d!77183))

(declare-fun d!77199 () Bool)

(assert (=> d!77199 (= (length!12 lt!219417) (size!15462 lt!219417))))

(declare-fun bs!15441 () Bool)

(assert (= bs!15441 d!77199))

(declare-fun m!465251 () Bool)

(assert (=> bs!15441 m!465251))

(assert (=> b!484706 d!77199))

(declare-fun d!77201 () Bool)

(declare-fun res!288820 () Bool)

(declare-fun e!285455 () Bool)

(assert (=> d!77201 (=> res!288820 e!285455)))

(assert (=> d!77201 (= res!288820 (or ((_ is Nil!9285) (t!15510 l!956)) ((_ is Nil!9285) (t!15510 (t!15510 l!956)))))))

(assert (=> d!77201 (= (isStrictlySorted!427 (t!15510 l!956)) e!285455)))

(declare-fun b!484890 () Bool)

(declare-fun e!285456 () Bool)

(assert (=> b!484890 (= e!285455 e!285456)))

(declare-fun res!288821 () Bool)

(assert (=> b!484890 (=> (not res!288821) (not e!285456))))

(assert (=> b!484890 (= res!288821 (bvslt (_1!4636 (h!10140 (t!15510 l!956))) (_1!4636 (h!10140 (t!15510 (t!15510 l!956))))))))

(declare-fun b!484891 () Bool)

(assert (=> b!484891 (= e!285456 (isStrictlySorted!427 (t!15510 (t!15510 l!956))))))

(assert (= (and d!77201 (not res!288820)) b!484890))

(assert (= (and b!484890 res!288821) b!484891))

(declare-fun m!465255 () Bool)

(assert (=> b!484891 m!465255))

(assert (=> b!484708 d!77201))

(declare-fun d!77207 () Bool)

(declare-fun res!288822 () Bool)

(declare-fun e!285457 () Bool)

(assert (=> d!77207 (=> res!288822 e!285457)))

(assert (=> d!77207 (= res!288822 (and ((_ is Cons!9284) (t!15510 l!956)) (= (_1!4636 (h!10140 (t!15510 l!956))) key!251)))))

(assert (=> d!77207 (= (containsKey!390 (t!15510 l!956) key!251) e!285457)))

(declare-fun b!484892 () Bool)

(declare-fun e!285458 () Bool)

(assert (=> b!484892 (= e!285457 e!285458)))

(declare-fun res!288823 () Bool)

(assert (=> b!484892 (=> (not res!288823) (not e!285458))))

(assert (=> b!484892 (= res!288823 (and (or (not ((_ is Cons!9284) (t!15510 l!956))) (bvsle (_1!4636 (h!10140 (t!15510 l!956))) key!251)) ((_ is Cons!9284) (t!15510 l!956)) (bvslt (_1!4636 (h!10140 (t!15510 l!956))) key!251)))))

(declare-fun b!484893 () Bool)

(assert (=> b!484893 (= e!285458 (containsKey!390 (t!15510 (t!15510 l!956)) key!251))))

(assert (= (and d!77207 (not res!288822)) b!484892))

(assert (= (and b!484892 res!288823) b!484893))

(declare-fun m!465257 () Bool)

(assert (=> b!484893 m!465257))

(assert (=> b!484704 d!77207))

(declare-fun d!77209 () Bool)

(declare-fun res!288824 () Bool)

(declare-fun e!285459 () Bool)

(assert (=> d!77209 (=> res!288824 e!285459)))

(assert (=> d!77209 (= res!288824 (or ((_ is Nil!9285) l!956) ((_ is Nil!9285) (t!15510 l!956))))))

(assert (=> d!77209 (= (isStrictlySorted!427 l!956) e!285459)))

(declare-fun b!484894 () Bool)

(declare-fun e!285460 () Bool)

(assert (=> b!484894 (= e!285459 e!285460)))

(declare-fun res!288825 () Bool)

(assert (=> b!484894 (=> (not res!288825) (not e!285460))))

(assert (=> b!484894 (= res!288825 (bvslt (_1!4636 (h!10140 l!956)) (_1!4636 (h!10140 (t!15510 l!956)))))))

(declare-fun b!484895 () Bool)

(assert (=> b!484895 (= e!285460 (isStrictlySorted!427 (t!15510 l!956)))))

(assert (= (and d!77209 (not res!288824)) b!484894))

(assert (= (and b!484894 res!288825) b!484895))

(assert (=> b!484895 m!465147))

(assert (=> start!43892 d!77209))

(declare-fun b!484896 () Bool)

(declare-fun c!58339 () Bool)

(assert (=> b!484896 (= c!58339 (and ((_ is Cons!9284) l!956) (bvsgt (_1!4636 (h!10140 l!956)) key!251)))))

(declare-fun e!285463 () List!9288)

(declare-fun e!285464 () List!9288)

(assert (=> b!484896 (= e!285463 e!285464)))

(declare-fun b!484897 () Bool)

(declare-fun call!31184 () List!9288)

(assert (=> b!484897 (= e!285464 call!31184)))

(declare-fun e!285462 () List!9288)

(declare-fun b!484898 () Bool)

(assert (=> b!484898 (= e!285462 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166))))

(declare-fun b!484899 () Bool)

(declare-fun e!285461 () List!9288)

(declare-fun call!31182 () List!9288)

(assert (=> b!484899 (= e!285461 call!31182)))

(declare-fun b!484900 () Bool)

(declare-fun call!31183 () List!9288)

(assert (=> b!484900 (= e!285463 call!31183)))

(declare-fun bm!31179 () Bool)

(declare-fun c!58340 () Bool)

(assert (=> bm!31179 (= call!31182 ($colon$colon!126 e!285462 (ite c!58340 (h!10140 l!956) (tuple2!9251 key!251 value!166))))))

(declare-fun c!58337 () Bool)

(assert (=> bm!31179 (= c!58337 c!58340)))

(declare-fun b!484901 () Bool)

(declare-fun e!285465 () Bool)

(declare-fun lt!219445 () List!9288)

(assert (=> b!484901 (= e!285465 (contains!2686 lt!219445 (tuple2!9251 key!251 value!166)))))

(declare-fun d!77211 () Bool)

(assert (=> d!77211 e!285465))

(declare-fun res!288827 () Bool)

(assert (=> d!77211 (=> (not res!288827) (not e!285465))))

(assert (=> d!77211 (= res!288827 (isStrictlySorted!427 lt!219445))))

(assert (=> d!77211 (= lt!219445 e!285461)))

(assert (=> d!77211 (= c!58340 (and ((_ is Cons!9284) l!956) (bvslt (_1!4636 (h!10140 l!956)) key!251)))))

(assert (=> d!77211 (isStrictlySorted!427 l!956)))

(assert (=> d!77211 (= (insertStrictlySorted!242 l!956 key!251 value!166) lt!219445)))

(declare-fun b!484902 () Bool)

(assert (=> b!484902 (= e!285461 e!285463)))

(declare-fun c!58338 () Bool)

(assert (=> b!484902 (= c!58338 (and ((_ is Cons!9284) l!956) (= (_1!4636 (h!10140 l!956)) key!251)))))

(declare-fun b!484903 () Bool)

(assert (=> b!484903 (= e!285464 call!31184)))

(declare-fun bm!31180 () Bool)

(assert (=> bm!31180 (= call!31184 call!31183)))

(declare-fun b!484904 () Bool)

(assert (=> b!484904 (= e!285462 (ite c!58338 (t!15510 l!956) (ite c!58339 (Cons!9284 (h!10140 l!956) (t!15510 l!956)) Nil!9285)))))

(declare-fun bm!31181 () Bool)

(assert (=> bm!31181 (= call!31183 call!31182)))

(declare-fun b!484905 () Bool)

(declare-fun res!288826 () Bool)

(assert (=> b!484905 (=> (not res!288826) (not e!285465))))

(assert (=> b!484905 (= res!288826 (containsKey!390 lt!219445 key!251))))

(assert (= (and d!77211 c!58340) b!484899))

(assert (= (and d!77211 (not c!58340)) b!484902))

(assert (= (and b!484902 c!58338) b!484900))

(assert (= (and b!484902 (not c!58338)) b!484896))

(assert (= (and b!484896 c!58339) b!484897))

(assert (= (and b!484896 (not c!58339)) b!484903))

(assert (= (or b!484897 b!484903) bm!31180))

(assert (= (or b!484900 bm!31180) bm!31181))

(assert (= (or b!484899 bm!31181) bm!31179))

(assert (= (and bm!31179 c!58337) b!484898))

(assert (= (and bm!31179 (not c!58337)) b!484904))

(assert (= (and d!77211 res!288827) b!484905))

(assert (= (and b!484905 res!288826) b!484901))

(declare-fun m!465259 () Bool)

(assert (=> bm!31179 m!465259))

(assert (=> b!484898 m!465129))

(declare-fun m!465261 () Bool)

(assert (=> b!484905 m!465261))

(declare-fun m!465263 () Bool)

(assert (=> b!484901 m!465263))

(declare-fun m!465265 () Bool)

(assert (=> d!77211 m!465265))

(assert (=> d!77211 m!465139))

(assert (=> b!484709 d!77211))

(declare-fun b!484910 () Bool)

(declare-fun e!285468 () Bool)

(declare-fun tp!43567 () Bool)

(assert (=> b!484910 (= e!285468 (and tp_is_empty!13953 tp!43567))))

(assert (=> b!484707 (= tp!43555 e!285468)))

(assert (= (and b!484707 ((_ is Cons!9284) (t!15510 l!956))) b!484910))

(check-sat (not b!484893) (not d!77199) (not d!77153) (not b!484831) (not b!484827) (not bm!31170) (not b!484910) (not d!77211) (not d!77183) (not d!77179) (not b!484898) (not b!484737) (not b!484901) (not d!77181) (not b!484891) (not b!484895) (not bm!31179) (not b!484905) tp_is_empty!13953 (not d!77175) (not b!484824))
(check-sat)
(get-model)

(declare-fun d!77213 () Bool)

(declare-fun lt!219448 () Int)

(assert (=> d!77213 (>= lt!219448 0)))

(declare-fun e!285471 () Int)

(assert (=> d!77213 (= lt!219448 e!285471)))

(declare-fun c!58343 () Bool)

(assert (=> d!77213 (= c!58343 ((_ is Nil!9285) lt!219417))))

(assert (=> d!77213 (= (size!15462 lt!219417) lt!219448)))

(declare-fun b!484915 () Bool)

(assert (=> b!484915 (= e!285471 0)))

(declare-fun b!484916 () Bool)

(assert (=> b!484916 (= e!285471 (+ 1 (size!15462 (t!15510 lt!219417))))))

(assert (= (and d!77213 c!58343) b!484915))

(assert (= (and d!77213 (not c!58343)) b!484916))

(declare-fun m!465267 () Bool)

(assert (=> b!484916 m!465267))

(assert (=> d!77199 d!77213))

(declare-fun d!77215 () Bool)

(declare-fun lt!219449 () Int)

(assert (=> d!77215 (>= lt!219449 0)))

(declare-fun e!285472 () Int)

(assert (=> d!77215 (= lt!219449 e!285472)))

(declare-fun c!58344 () Bool)

(assert (=> d!77215 (= c!58344 ((_ is Nil!9285) l!956))))

(assert (=> d!77215 (= (size!15462 l!956) lt!219449)))

(declare-fun b!484917 () Bool)

(assert (=> b!484917 (= e!285472 0)))

(declare-fun b!484918 () Bool)

(assert (=> b!484918 (= e!285472 (+ 1 (size!15462 (t!15510 l!956))))))

(assert (= (and d!77215 c!58344) b!484917))

(assert (= (and d!77215 (not c!58344)) b!484918))

(assert (=> b!484918 m!465225))

(assert (=> d!77181 d!77215))

(declare-fun d!77217 () Bool)

(assert (=> d!77217 (= ($colon$colon!126 e!285407 (ite c!58328 (h!10140 (t!15510 l!956)) (tuple2!9251 key!251 value!166))) (Cons!9284 (ite c!58328 (h!10140 (t!15510 l!956)) (tuple2!9251 key!251 value!166)) e!285407))))

(assert (=> bm!31170 d!77217))

(declare-fun lt!219452 () Bool)

(declare-fun d!77219 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!213 (List!9288) (InoxSet tuple2!9250))

(assert (=> d!77219 (= lt!219452 (select (content!213 lt!219436) (tuple2!9251 key!251 value!166)))))

(declare-fun e!285478 () Bool)

(assert (=> d!77219 (= lt!219452 e!285478)))

(declare-fun res!288832 () Bool)

(assert (=> d!77219 (=> (not res!288832) (not e!285478))))

(assert (=> d!77219 (= res!288832 ((_ is Cons!9284) lt!219436))))

(assert (=> d!77219 (= (contains!2686 lt!219436 (tuple2!9251 key!251 value!166)) lt!219452)))

(declare-fun b!484923 () Bool)

(declare-fun e!285477 () Bool)

(assert (=> b!484923 (= e!285478 e!285477)))

(declare-fun res!288833 () Bool)

(assert (=> b!484923 (=> res!288833 e!285477)))

(assert (=> b!484923 (= res!288833 (= (h!10140 lt!219436) (tuple2!9251 key!251 value!166)))))

(declare-fun b!484924 () Bool)

(assert (=> b!484924 (= e!285477 (contains!2686 (t!15510 lt!219436) (tuple2!9251 key!251 value!166)))))

(assert (= (and d!77219 res!288832) b!484923))

(assert (= (and b!484923 (not res!288833)) b!484924))

(declare-fun m!465269 () Bool)

(assert (=> d!77219 m!465269))

(declare-fun m!465271 () Bool)

(assert (=> d!77219 m!465271))

(declare-fun m!465273 () Bool)

(assert (=> b!484924 m!465273))

(assert (=> b!484827 d!77219))

(declare-fun d!77221 () Bool)

(declare-fun lt!219453 () Int)

(assert (=> d!77221 (>= lt!219453 0)))

(declare-fun e!285479 () Int)

(assert (=> d!77221 (= lt!219453 e!285479)))

(declare-fun c!58345 () Bool)

(assert (=> d!77221 (= c!58345 ((_ is Nil!9285) (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)))))

(assert (=> d!77221 (= (size!15462 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)) lt!219453)))

(declare-fun b!484925 () Bool)

(assert (=> b!484925 (= e!285479 0)))

(declare-fun b!484926 () Bool)

(assert (=> b!484926 (= e!285479 (+ 1 (size!15462 (t!15510 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)))))))

(assert (= (and d!77221 c!58345) b!484925))

(assert (= (and d!77221 (not c!58345)) b!484926))

(declare-fun m!465275 () Bool)

(assert (=> b!484926 m!465275))

(assert (=> d!77175 d!77221))

(declare-fun d!77223 () Bool)

(declare-fun res!288834 () Bool)

(declare-fun e!285480 () Bool)

(assert (=> d!77223 (=> res!288834 e!285480)))

(assert (=> d!77223 (= res!288834 (and ((_ is Cons!9284) lt!219445) (= (_1!4636 (h!10140 lt!219445)) key!251)))))

(assert (=> d!77223 (= (containsKey!390 lt!219445 key!251) e!285480)))

(declare-fun b!484927 () Bool)

(declare-fun e!285481 () Bool)

(assert (=> b!484927 (= e!285480 e!285481)))

(declare-fun res!288835 () Bool)

(assert (=> b!484927 (=> (not res!288835) (not e!285481))))

(assert (=> b!484927 (= res!288835 (and (or (not ((_ is Cons!9284) lt!219445)) (bvsle (_1!4636 (h!10140 lt!219445)) key!251)) ((_ is Cons!9284) lt!219445) (bvslt (_1!4636 (h!10140 lt!219445)) key!251)))))

(declare-fun b!484928 () Bool)

(assert (=> b!484928 (= e!285481 (containsKey!390 (t!15510 lt!219445) key!251))))

(assert (= (and d!77223 (not res!288834)) b!484927))

(assert (= (and b!484927 res!288835) b!484928))

(declare-fun m!465277 () Bool)

(assert (=> b!484928 m!465277))

(assert (=> b!484905 d!77223))

(assert (=> b!484737 d!77207))

(assert (=> b!484898 d!77153))

(declare-fun d!77225 () Bool)

(declare-fun res!288836 () Bool)

(declare-fun e!285482 () Bool)

(assert (=> d!77225 (=> res!288836 e!285482)))

(assert (=> d!77225 (= res!288836 (or ((_ is Nil!9285) lt!219436) ((_ is Nil!9285) (t!15510 lt!219436))))))

(assert (=> d!77225 (= (isStrictlySorted!427 lt!219436) e!285482)))

(declare-fun b!484929 () Bool)

(declare-fun e!285483 () Bool)

(assert (=> b!484929 (= e!285482 e!285483)))

(declare-fun res!288837 () Bool)

(assert (=> b!484929 (=> (not res!288837) (not e!285483))))

(assert (=> b!484929 (= res!288837 (bvslt (_1!4636 (h!10140 lt!219436)) (_1!4636 (h!10140 (t!15510 lt!219436)))))))

(declare-fun b!484930 () Bool)

(assert (=> b!484930 (= e!285483 (isStrictlySorted!427 (t!15510 lt!219436)))))

(assert (= (and d!77225 (not res!288836)) b!484929))

(assert (= (and b!484929 res!288837) b!484930))

(declare-fun m!465279 () Bool)

(assert (=> b!484930 m!465279))

(assert (=> d!77153 d!77225))

(assert (=> d!77153 d!77201))

(assert (=> b!484895 d!77201))

(declare-fun d!77227 () Bool)

(declare-fun res!288838 () Bool)

(declare-fun e!285484 () Bool)

(assert (=> d!77227 (=> res!288838 e!285484)))

(assert (=> d!77227 (= res!288838 (and ((_ is Cons!9284) (t!15510 (t!15510 l!956))) (= (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) key!251)))))

(assert (=> d!77227 (= (containsKey!390 (t!15510 (t!15510 l!956)) key!251) e!285484)))

(declare-fun b!484931 () Bool)

(declare-fun e!285485 () Bool)

(assert (=> b!484931 (= e!285484 e!285485)))

(declare-fun res!288839 () Bool)

(assert (=> b!484931 (=> (not res!288839) (not e!285485))))

(assert (=> b!484931 (= res!288839 (and (or (not ((_ is Cons!9284) (t!15510 (t!15510 l!956)))) (bvsle (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) key!251)) ((_ is Cons!9284) (t!15510 (t!15510 l!956))) (bvslt (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) key!251)))))

(declare-fun b!484932 () Bool)

(assert (=> b!484932 (= e!285485 (containsKey!390 (t!15510 (t!15510 (t!15510 l!956))) key!251))))

(assert (= (and d!77227 (not res!288838)) b!484931))

(assert (= (and b!484931 res!288839) b!484932))

(declare-fun m!465281 () Bool)

(assert (=> b!484932 m!465281))

(assert (=> b!484893 d!77227))

(declare-fun d!77229 () Bool)

(assert (=> d!77229 (= ($colon$colon!126 e!285462 (ite c!58340 (h!10140 l!956) (tuple2!9251 key!251 value!166))) (Cons!9284 (ite c!58340 (h!10140 l!956) (tuple2!9251 key!251 value!166)) e!285462))))

(assert (=> bm!31179 d!77229))

(declare-fun d!77231 () Bool)

(declare-fun res!288840 () Bool)

(declare-fun e!285486 () Bool)

(assert (=> d!77231 (=> res!288840 e!285486)))

(assert (=> d!77231 (= res!288840 (or ((_ is Nil!9285) (t!15510 (t!15510 l!956))) ((_ is Nil!9285) (t!15510 (t!15510 (t!15510 l!956))))))))

(assert (=> d!77231 (= (isStrictlySorted!427 (t!15510 (t!15510 l!956))) e!285486)))

(declare-fun b!484933 () Bool)

(declare-fun e!285487 () Bool)

(assert (=> b!484933 (= e!285486 e!285487)))

(declare-fun res!288841 () Bool)

(assert (=> b!484933 (=> (not res!288841) (not e!285487))))

(assert (=> b!484933 (= res!288841 (bvslt (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) (_1!4636 (h!10140 (t!15510 (t!15510 (t!15510 l!956)))))))))

(declare-fun b!484934 () Bool)

(assert (=> b!484934 (= e!285487 (isStrictlySorted!427 (t!15510 (t!15510 (t!15510 l!956)))))))

(assert (= (and d!77231 (not res!288840)) b!484933))

(assert (= (and b!484933 res!288841) b!484934))

(declare-fun m!465283 () Bool)

(assert (=> b!484934 m!465283))

(assert (=> b!484891 d!77231))

(assert (=> d!77183 d!77153))

(assert (=> d!77183 d!77175))

(assert (=> d!77183 d!77201))

(assert (=> d!77183 d!77179))

(declare-fun d!77233 () Bool)

(assert (=> d!77233 (= (length!12 (insertStrictlySorted!242 (t!15510 l!956) key!251 value!166)) (+ (length!12 (t!15510 l!956)) 1))))

(assert (=> d!77233 true))

(declare-fun _$9!26 () Unit!14184)

(assert (=> d!77233 (= (choose!1384 (t!15510 l!956) key!251 value!166) _$9!26)))

(declare-fun bs!15442 () Bool)

(assert (= bs!15442 d!77233))

(assert (=> bs!15442 m!465129))

(assert (=> bs!15442 m!465129))

(assert (=> bs!15442 m!465131))

(assert (=> bs!15442 m!465133))

(assert (=> d!77183 d!77233))

(declare-fun d!77237 () Bool)

(declare-fun res!288842 () Bool)

(declare-fun e!285488 () Bool)

(assert (=> d!77237 (=> res!288842 e!285488)))

(assert (=> d!77237 (= res!288842 (or ((_ is Nil!9285) lt!219445) ((_ is Nil!9285) (t!15510 lt!219445))))))

(assert (=> d!77237 (= (isStrictlySorted!427 lt!219445) e!285488)))

(declare-fun b!484935 () Bool)

(declare-fun e!285489 () Bool)

(assert (=> b!484935 (= e!285488 e!285489)))

(declare-fun res!288843 () Bool)

(assert (=> b!484935 (=> (not res!288843) (not e!285489))))

(assert (=> b!484935 (= res!288843 (bvslt (_1!4636 (h!10140 lt!219445)) (_1!4636 (h!10140 (t!15510 lt!219445)))))))

(declare-fun b!484936 () Bool)

(assert (=> b!484936 (= e!285489 (isStrictlySorted!427 (t!15510 lt!219445)))))

(assert (= (and d!77237 (not res!288842)) b!484935))

(assert (= (and b!484935 res!288843) b!484936))

(declare-fun m!465285 () Bool)

(assert (=> b!484936 m!465285))

(assert (=> d!77211 d!77237))

(assert (=> d!77211 d!77209))

(declare-fun d!77239 () Bool)

(declare-fun lt!219454 () Int)

(assert (=> d!77239 (>= lt!219454 0)))

(declare-fun e!285490 () Int)

(assert (=> d!77239 (= lt!219454 e!285490)))

(declare-fun c!58346 () Bool)

(assert (=> d!77239 (= c!58346 ((_ is Nil!9285) (t!15510 l!956)))))

(assert (=> d!77239 (= (size!15462 (t!15510 l!956)) lt!219454)))

(declare-fun b!484937 () Bool)

(assert (=> b!484937 (= e!285490 0)))

(declare-fun b!484938 () Bool)

(assert (=> b!484938 (= e!285490 (+ 1 (size!15462 (t!15510 (t!15510 l!956)))))))

(assert (= (and d!77239 c!58346) b!484937))

(assert (= (and d!77239 (not c!58346)) b!484938))

(declare-fun m!465287 () Bool)

(assert (=> b!484938 m!465287))

(assert (=> d!77179 d!77239))

(declare-fun d!77241 () Bool)

(declare-fun lt!219455 () Bool)

(assert (=> d!77241 (= lt!219455 (select (content!213 lt!219445) (tuple2!9251 key!251 value!166)))))

(declare-fun e!285492 () Bool)

(assert (=> d!77241 (= lt!219455 e!285492)))

(declare-fun res!288844 () Bool)

(assert (=> d!77241 (=> (not res!288844) (not e!285492))))

(assert (=> d!77241 (= res!288844 ((_ is Cons!9284) lt!219445))))

(assert (=> d!77241 (= (contains!2686 lt!219445 (tuple2!9251 key!251 value!166)) lt!219455)))

(declare-fun b!484939 () Bool)

(declare-fun e!285491 () Bool)

(assert (=> b!484939 (= e!285492 e!285491)))

(declare-fun res!288845 () Bool)

(assert (=> b!484939 (=> res!288845 e!285491)))

(assert (=> b!484939 (= res!288845 (= (h!10140 lt!219445) (tuple2!9251 key!251 value!166)))))

(declare-fun b!484940 () Bool)

(assert (=> b!484940 (= e!285491 (contains!2686 (t!15510 lt!219445) (tuple2!9251 key!251 value!166)))))

(assert (= (and d!77241 res!288844) b!484939))

(assert (= (and b!484939 (not res!288845)) b!484940))

(declare-fun m!465289 () Bool)

(assert (=> d!77241 m!465289))

(declare-fun m!465291 () Bool)

(assert (=> d!77241 m!465291))

(declare-fun m!465293 () Bool)

(assert (=> b!484940 m!465293))

(assert (=> b!484901 d!77241))

(declare-fun d!77243 () Bool)

(declare-fun res!288850 () Bool)

(declare-fun e!285497 () Bool)

(assert (=> d!77243 (=> res!288850 e!285497)))

(assert (=> d!77243 (= res!288850 (and ((_ is Cons!9284) lt!219436) (= (_1!4636 (h!10140 lt!219436)) key!251)))))

(assert (=> d!77243 (= (containsKey!390 lt!219436 key!251) e!285497)))

(declare-fun b!484945 () Bool)

(declare-fun e!285498 () Bool)

(assert (=> b!484945 (= e!285497 e!285498)))

(declare-fun res!288851 () Bool)

(assert (=> b!484945 (=> (not res!288851) (not e!285498))))

(assert (=> b!484945 (= res!288851 (and (or (not ((_ is Cons!9284) lt!219436)) (bvsle (_1!4636 (h!10140 lt!219436)) key!251)) ((_ is Cons!9284) lt!219436) (bvslt (_1!4636 (h!10140 lt!219436)) key!251)))))

(declare-fun b!484946 () Bool)

(assert (=> b!484946 (= e!285498 (containsKey!390 (t!15510 lt!219436) key!251))))

(assert (= (and d!77243 (not res!288850)) b!484945))

(assert (= (and b!484945 res!288851) b!484946))

(declare-fun m!465295 () Bool)

(assert (=> b!484946 m!465295))

(assert (=> b!484831 d!77243))

(declare-fun b!484947 () Bool)

(declare-fun c!58349 () Bool)

(assert (=> b!484947 (= c!58349 (and ((_ is Cons!9284) (t!15510 (t!15510 l!956))) (bvsgt (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) key!251)))))

(declare-fun e!285501 () List!9288)

(declare-fun e!285502 () List!9288)

(assert (=> b!484947 (= e!285501 e!285502)))

(declare-fun b!484948 () Bool)

(declare-fun call!31187 () List!9288)

(assert (=> b!484948 (= e!285502 call!31187)))

(declare-fun b!484949 () Bool)

(declare-fun e!285500 () List!9288)

(assert (=> b!484949 (= e!285500 (insertStrictlySorted!242 (t!15510 (t!15510 (t!15510 l!956))) key!251 value!166))))

(declare-fun b!484950 () Bool)

(declare-fun e!285499 () List!9288)

(declare-fun call!31185 () List!9288)

(assert (=> b!484950 (= e!285499 call!31185)))

(declare-fun b!484951 () Bool)

(declare-fun call!31186 () List!9288)

(assert (=> b!484951 (= e!285501 call!31186)))

(declare-fun c!58350 () Bool)

(declare-fun bm!31182 () Bool)

(assert (=> bm!31182 (= call!31185 ($colon$colon!126 e!285500 (ite c!58350 (h!10140 (t!15510 (t!15510 l!956))) (tuple2!9251 key!251 value!166))))))

(declare-fun c!58347 () Bool)

(assert (=> bm!31182 (= c!58347 c!58350)))

(declare-fun e!285503 () Bool)

(declare-fun lt!219458 () List!9288)

(declare-fun b!484952 () Bool)

(assert (=> b!484952 (= e!285503 (contains!2686 lt!219458 (tuple2!9251 key!251 value!166)))))

(declare-fun d!77245 () Bool)

(assert (=> d!77245 e!285503))

(declare-fun res!288853 () Bool)

(assert (=> d!77245 (=> (not res!288853) (not e!285503))))

(assert (=> d!77245 (= res!288853 (isStrictlySorted!427 lt!219458))))

(assert (=> d!77245 (= lt!219458 e!285499)))

(assert (=> d!77245 (= c!58350 (and ((_ is Cons!9284) (t!15510 (t!15510 l!956))) (bvslt (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) key!251)))))

(assert (=> d!77245 (isStrictlySorted!427 (t!15510 (t!15510 l!956)))))

(assert (=> d!77245 (= (insertStrictlySorted!242 (t!15510 (t!15510 l!956)) key!251 value!166) lt!219458)))

(declare-fun b!484953 () Bool)

(assert (=> b!484953 (= e!285499 e!285501)))

(declare-fun c!58348 () Bool)

(assert (=> b!484953 (= c!58348 (and ((_ is Cons!9284) (t!15510 (t!15510 l!956))) (= (_1!4636 (h!10140 (t!15510 (t!15510 l!956)))) key!251)))))

(declare-fun b!484954 () Bool)

(assert (=> b!484954 (= e!285502 call!31187)))

(declare-fun bm!31183 () Bool)

(assert (=> bm!31183 (= call!31187 call!31186)))

(declare-fun b!484955 () Bool)

(assert (=> b!484955 (= e!285500 (ite c!58348 (t!15510 (t!15510 (t!15510 l!956))) (ite c!58349 (Cons!9284 (h!10140 (t!15510 (t!15510 l!956))) (t!15510 (t!15510 (t!15510 l!956)))) Nil!9285)))))

(declare-fun bm!31184 () Bool)

(assert (=> bm!31184 (= call!31186 call!31185)))

(declare-fun b!484956 () Bool)

(declare-fun res!288852 () Bool)

(assert (=> b!484956 (=> (not res!288852) (not e!285503))))

(assert (=> b!484956 (= res!288852 (containsKey!390 lt!219458 key!251))))

(assert (= (and d!77245 c!58350) b!484950))

(assert (= (and d!77245 (not c!58350)) b!484953))

(assert (= (and b!484953 c!58348) b!484951))

(assert (= (and b!484953 (not c!58348)) b!484947))

(assert (= (and b!484947 c!58349) b!484948))

(assert (= (and b!484947 (not c!58349)) b!484954))

(assert (= (or b!484948 b!484954) bm!31183))

(assert (= (or b!484951 bm!31183) bm!31184))

(assert (= (or b!484950 bm!31184) bm!31182))

(assert (= (and bm!31182 c!58347) b!484949))

(assert (= (and bm!31182 (not c!58347)) b!484955))

(assert (= (and d!77245 res!288853) b!484956))

(assert (= (and b!484956 res!288852) b!484952))

(declare-fun m!465297 () Bool)

(assert (=> bm!31182 m!465297))

(declare-fun m!465301 () Bool)

(assert (=> b!484949 m!465301))

(declare-fun m!465305 () Bool)

(assert (=> b!484956 m!465305))

(declare-fun m!465309 () Bool)

(assert (=> b!484952 m!465309))

(declare-fun m!465311 () Bool)

(assert (=> d!77245 m!465311))

(assert (=> d!77245 m!465255))

(assert (=> b!484824 d!77245))

(declare-fun b!484961 () Bool)

(declare-fun e!285508 () Bool)

(declare-fun tp!43568 () Bool)

(assert (=> b!484961 (= e!285508 (and tp_is_empty!13953 tp!43568))))

(assert (=> b!484910 (= tp!43567 e!285508)))

(assert (= (and b!484910 ((_ is Cons!9284) (t!15510 (t!15510 l!956)))) b!484961))

(check-sat (not b!484930) (not d!77241) (not b!484936) (not d!77219) (not bm!31182) (not b!484961) tp_is_empty!13953 (not b!484926) (not b!484928) (not d!77233) (not b!484956) (not b!484952) (not d!77245) (not b!484946) (not b!484918) (not b!484932) (not b!484949) (not b!484924) (not b!484938) (not b!484916) (not b!484934) (not b!484940))
(check-sat)
