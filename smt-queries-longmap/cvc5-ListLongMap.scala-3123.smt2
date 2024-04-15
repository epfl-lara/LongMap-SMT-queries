; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43972 () Bool)

(assert start!43972)

(declare-fun b!484997 () Bool)

(declare-fun e!285541 () Bool)

(declare-fun e!285543 () Bool)

(assert (=> b!484997 (= e!285541 e!285543)))

(declare-fun res!288881 () Bool)

(assert (=> b!484997 (=> (not res!288881) (not e!285543))))

(declare-datatypes ((B!1164 0))(
  ( (B!1165 (val!7034 Int)) )
))
(declare-datatypes ((tuple2!9320 0))(
  ( (tuple2!9321 (_1!4671 (_ BitVec 64)) (_2!4671 B!1164)) )
))
(declare-datatypes ((List!9336 0))(
  ( (Nil!9333) (Cons!9332 (h!10188 tuple2!9320) (t!15552 List!9336)) )
))
(declare-fun l!956 () List!9336)

(declare-fun key!251 () (_ BitVec 64))

(assert (=> b!484997 (= res!288881 (and (or (not (is-Cons!9332 l!956)) (bvsge (_1!4671 (h!10188 l!956)) key!251)) (or (not (is-Cons!9332 l!956)) (not (= (_1!4671 (h!10188 l!956)) key!251)))))))

(declare-fun lt!219280 () List!9336)

(declare-fun value!166 () B!1164)

(declare-fun insertStrictlySorted!253 (List!9336 (_ BitVec 64) B!1164) List!9336)

(assert (=> b!484997 (= lt!219280 (insertStrictlySorted!253 l!956 key!251 value!166))))

(declare-fun res!288879 () Bool)

(assert (=> start!43972 (=> (not res!288879) (not e!285541))))

(declare-fun isStrictlySorted!433 (List!9336) Bool)

(assert (=> start!43972 (= res!288879 (isStrictlySorted!433 l!956))))

(assert (=> start!43972 e!285541))

(declare-fun e!285542 () Bool)

(assert (=> start!43972 e!285542))

(assert (=> start!43972 true))

(declare-fun tp_is_empty!13973 () Bool)

(assert (=> start!43972 tp_is_empty!13973))

(declare-fun b!484998 () Bool)

(declare-fun length!16 (List!9336) Int)

(assert (=> b!484998 (= e!285543 (not (= (length!16 lt!219280) (+ 1 (length!16 l!956)))))))

(declare-fun b!484996 () Bool)

(declare-fun res!288880 () Bool)

(assert (=> b!484996 (=> (not res!288880) (not e!285541))))

(declare-fun containsKey!398 (List!9336 (_ BitVec 64)) Bool)

(assert (=> b!484996 (= res!288880 (not (containsKey!398 l!956 key!251)))))

(declare-fun b!484999 () Bool)

(declare-fun tp!43606 () Bool)

(assert (=> b!484999 (= e!285542 (and tp_is_empty!13973 tp!43606))))

(assert (= (and start!43972 res!288879) b!484996))

(assert (= (and b!484996 res!288880) b!484997))

(assert (= (and b!484997 res!288881) b!484998))

(assert (= (and start!43972 (is-Cons!9332 l!956)) b!484999))

(declare-fun m!464753 () Bool)

(assert (=> b!484997 m!464753))

(declare-fun m!464755 () Bool)

(assert (=> start!43972 m!464755))

(declare-fun m!464757 () Bool)

(assert (=> b!484998 m!464757))

(declare-fun m!464759 () Bool)

(assert (=> b!484998 m!464759))

(declare-fun m!464761 () Bool)

(assert (=> b!484996 m!464761))

(push 1)

(assert (not b!484998))

(assert (not b!484996))

(assert tp_is_empty!13973)

(assert (not b!484997))

(assert (not start!43972))

(assert (not b!484999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77133 () Bool)

(declare-fun res!288896 () Bool)

(declare-fun e!285558 () Bool)

(assert (=> d!77133 (=> res!288896 e!285558)))

(assert (=> d!77133 (= res!288896 (and (is-Cons!9332 l!956) (= (_1!4671 (h!10188 l!956)) key!251)))))

(assert (=> d!77133 (= (containsKey!398 l!956 key!251) e!285558)))

(declare-fun b!485014 () Bool)

(declare-fun e!285559 () Bool)

(assert (=> b!485014 (= e!285558 e!285559)))

(declare-fun res!288897 () Bool)

(assert (=> b!485014 (=> (not res!288897) (not e!285559))))

(assert (=> b!485014 (= res!288897 (and (or (not (is-Cons!9332 l!956)) (bvsle (_1!4671 (h!10188 l!956)) key!251)) (is-Cons!9332 l!956) (bvslt (_1!4671 (h!10188 l!956)) key!251)))))

(declare-fun b!485015 () Bool)

(assert (=> b!485015 (= e!285559 (containsKey!398 (t!15552 l!956) key!251))))

(assert (= (and d!77133 (not res!288896)) b!485014))

(assert (= (and b!485014 res!288897) b!485015))

(declare-fun m!464769 () Bool)

(assert (=> b!485015 m!464769))

(assert (=> b!484996 d!77133))

(declare-fun c!58366 () Bool)

(declare-fun e!285607 () List!9336)

(declare-fun bm!31214 () Bool)

(declare-fun call!31218 () List!9336)

(declare-fun $colon$colon!130 (List!9336 tuple2!9320) List!9336)

(assert (=> bm!31214 (= call!31218 ($colon$colon!130 e!285607 (ite c!58366 (h!10188 l!956) (tuple2!9321 key!251 value!166))))))

(declare-fun c!58365 () Bool)

(assert (=> bm!31214 (= c!58365 c!58366)))

(declare-fun b!485094 () Bool)

(assert (=> b!485094 (= e!285607 (insertStrictlySorted!253 (t!15552 l!956) key!251 value!166))))

(declare-fun b!485095 () Bool)

(declare-fun c!58367 () Bool)

(assert (=> b!485095 (= c!58367 (and (is-Cons!9332 l!956) (bvsgt (_1!4671 (h!10188 l!956)) key!251)))))

(declare-fun e!285604 () List!9336)

(declare-fun e!285603 () List!9336)

(assert (=> b!485095 (= e!285604 e!285603)))

(declare-fun bm!31215 () Bool)

(declare-fun call!31219 () List!9336)

(declare-fun call!31217 () List!9336)

(assert (=> bm!31215 (= call!31219 call!31217)))

(declare-fun b!485096 () Bool)

(declare-fun e!285605 () List!9336)

(assert (=> b!485096 (= e!285605 call!31218)))

(declare-fun d!77143 () Bool)

(declare-fun e!285606 () Bool)

(assert (=> d!77143 e!285606))

(declare-fun res!288920 () Bool)

(assert (=> d!77143 (=> (not res!288920) (not e!285606))))

(declare-fun lt!219288 () List!9336)

(assert (=> d!77143 (= res!288920 (isStrictlySorted!433 lt!219288))))

(assert (=> d!77143 (= lt!219288 e!285605)))

(assert (=> d!77143 (= c!58366 (and (is-Cons!9332 l!956) (bvslt (_1!4671 (h!10188 l!956)) key!251)))))

(assert (=> d!77143 (isStrictlySorted!433 l!956)))

(assert (=> d!77143 (= (insertStrictlySorted!253 l!956 key!251 value!166) lt!219288)))

(declare-fun b!485097 () Bool)

(assert (=> b!485097 (= e!285603 call!31219)))

(declare-fun b!485098 () Bool)

(assert (=> b!485098 (= e!285605 e!285604)))

(declare-fun c!58364 () Bool)

(assert (=> b!485098 (= c!58364 (and (is-Cons!9332 l!956) (= (_1!4671 (h!10188 l!956)) key!251)))))

(declare-fun b!485099 () Bool)

(assert (=> b!485099 (= e!285604 call!31217)))

(declare-fun b!485100 () Bool)

(declare-fun res!288921 () Bool)

(assert (=> b!485100 (=> (not res!288921) (not e!285606))))

(assert (=> b!485100 (= res!288921 (containsKey!398 lt!219288 key!251))))

(declare-fun bm!31216 () Bool)

(assert (=> bm!31216 (= call!31217 call!31218)))

(declare-fun b!485101 () Bool)

(declare-fun contains!2677 (List!9336 tuple2!9320) Bool)

(assert (=> b!485101 (= e!285606 (contains!2677 lt!219288 (tuple2!9321 key!251 value!166)))))

(declare-fun b!485102 () Bool)

(assert (=> b!485102 (= e!285603 call!31219)))

(declare-fun b!485103 () Bool)

(assert (=> b!485103 (= e!285607 (ite c!58364 (t!15552 l!956) (ite c!58367 (Cons!9332 (h!10188 l!956) (t!15552 l!956)) Nil!9333)))))

(assert (= (and d!77143 c!58366) b!485096))

(assert (= (and d!77143 (not c!58366)) b!485098))

(assert (= (and b!485098 c!58364) b!485099))

(assert (= (and b!485098 (not c!58364)) b!485095))

(assert (= (and b!485095 c!58367) b!485102))

(assert (= (and b!485095 (not c!58367)) b!485097))

(assert (= (or b!485102 b!485097) bm!31215))

(assert (= (or b!485099 bm!31215) bm!31216))

(assert (= (or b!485096 bm!31216) bm!31214))

(assert (= (and bm!31214 c!58365) b!485094))

(assert (= (and bm!31214 (not c!58365)) b!485103))

(assert (= (and d!77143 res!288920) b!485100))

(assert (= (and b!485100 res!288921) b!485101))

(declare-fun m!464785 () Bool)

(assert (=> b!485094 m!464785))

(declare-fun m!464787 () Bool)

(assert (=> d!77143 m!464787))

(assert (=> d!77143 m!464755))

(declare-fun m!464791 () Bool)

(assert (=> b!485100 m!464791))

(declare-fun m!464797 () Bool)

(assert (=> bm!31214 m!464797))

(declare-fun m!464799 () Bool)

(assert (=> b!485101 m!464799))

(assert (=> b!484997 d!77143))

(declare-fun d!77151 () Bool)

(declare-fun res!288934 () Bool)

(declare-fun e!285626 () Bool)

(assert (=> d!77151 (=> res!288934 e!285626)))

(assert (=> d!77151 (= res!288934 (or (is-Nil!9333 l!956) (is-Nil!9333 (t!15552 l!956))))))

(assert (=> d!77151 (= (isStrictlySorted!433 l!956) e!285626)))

(declare-fun b!485129 () Bool)

(declare-fun e!285627 () Bool)

(assert (=> b!485129 (= e!285626 e!285627)))

(declare-fun res!288935 () Bool)

(assert (=> b!485129 (=> (not res!288935) (not e!285627))))

(assert (=> b!485129 (= res!288935 (bvslt (_1!4671 (h!10188 l!956)) (_1!4671 (h!10188 (t!15552 l!956)))))))

(declare-fun b!485130 () Bool)

(assert (=> b!485130 (= e!285627 (isStrictlySorted!433 (t!15552 l!956)))))

(assert (= (and d!77151 (not res!288934)) b!485129))

(assert (= (and b!485129 res!288935) b!485130))

(declare-fun m!464807 () Bool)

(assert (=> b!485130 m!464807))

(assert (=> start!43972 d!77151))

(declare-fun d!77155 () Bool)

(declare-fun size!15464 (List!9336) Int)

(assert (=> d!77155 (= (length!16 lt!219280) (size!15464 lt!219280))))

(declare-fun bs!15427 () Bool)

(assert (= bs!15427 d!77155))

(declare-fun m!464811 () Bool)

(assert (=> bs!15427 m!464811))

(assert (=> b!484998 d!77155))

(declare-fun d!77159 () Bool)

(assert (=> d!77159 (= (length!16 l!956) (size!15464 l!956))))

(declare-fun bs!15429 () Bool)

(assert (= bs!15429 d!77159))

(declare-fun m!464815 () Bool)

(assert (=> bs!15429 m!464815))

(assert (=> b!484998 d!77159))

(declare-fun b!485140 () Bool)

(declare-fun e!285633 () Bool)

(declare-fun tp!43615 () Bool)

(assert (=> b!485140 (= e!285633 (and tp_is_empty!13973 tp!43615))))

(assert (=> b!484999 (= tp!43606 e!285633)))

(assert (= (and b!484999 (is-Cons!9332 (t!15552 l!956))) b!485140))

(push 1)

(assert (not b!485015))

(assert (not b!485100))

(assert (not d!77159))

(assert (not bm!31214))

(assert (not b!485101))

(assert (not b!485094))

(assert tp_is_empty!13973)

(assert (not b!485130))

(assert (not b!485140))

(assert (not d!77155))

(assert (not d!77143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77169 () Bool)

(declare-fun res!288940 () Bool)

(declare-fun e!285641 () Bool)

(assert (=> d!77169 (=> res!288940 e!285641)))

(assert (=> d!77169 (= res!288940 (or (is-Nil!9333 lt!219288) (is-Nil!9333 (t!15552 lt!219288))))))

(assert (=> d!77169 (= (isStrictlySorted!433 lt!219288) e!285641)))

(declare-fun b!485151 () Bool)

(declare-fun e!285642 () Bool)

(assert (=> b!485151 (= e!285641 e!285642)))

(declare-fun res!288941 () Bool)

(assert (=> b!485151 (=> (not res!288941) (not e!285642))))

(assert (=> b!485151 (= res!288941 (bvslt (_1!4671 (h!10188 lt!219288)) (_1!4671 (h!10188 (t!15552 lt!219288)))))))

(declare-fun b!485152 () Bool)

(assert (=> b!485152 (= e!285642 (isStrictlySorted!433 (t!15552 lt!219288)))))

(assert (= (and d!77169 (not res!288940)) b!485151))

(assert (= (and b!485151 res!288941) b!485152))

(declare-fun m!464823 () Bool)

(assert (=> b!485152 m!464823))

(assert (=> d!77143 d!77169))

(assert (=> d!77143 d!77151))

(declare-fun d!77171 () Bool)

(declare-fun lt!219298 () Int)

(assert (=> d!77171 (>= lt!219298 0)))

(declare-fun e!285652 () Int)

(assert (=> d!77171 (= lt!219298 e!285652)))

(declare-fun c!58379 () Bool)

(assert (=> d!77171 (= c!58379 (is-Nil!9333 l!956))))

(assert (=> d!77171 (= (size!15464 l!956) lt!219298)))

(declare-fun b!485163 () Bool)

(assert (=> b!485163 (= e!285652 0)))

(declare-fun b!485164 () Bool)

(assert (=> b!485164 (= e!285652 (+ 1 (size!15464 (t!15552 l!956))))))

(assert (= (and d!77171 c!58379) b!485163))

(assert (= (and d!77171 (not c!58379)) b!485164))

(declare-fun m!464831 () Bool)

(assert (=> b!485164 m!464831))

(assert (=> d!77159 d!77171))

(declare-fun d!77175 () Bool)

(declare-fun res!288950 () Bool)

(declare-fun e!285657 () Bool)

(assert (=> d!77175 (=> res!288950 e!285657)))

(assert (=> d!77175 (= res!288950 (and (is-Cons!9332 (t!15552 l!956)) (= (_1!4671 (h!10188 (t!15552 l!956))) key!251)))))

(assert (=> d!77175 (= (containsKey!398 (t!15552 l!956) key!251) e!285657)))

(declare-fun b!485175 () Bool)

(declare-fun e!285658 () Bool)

(assert (=> b!485175 (= e!285657 e!285658)))

(declare-fun res!288951 () Bool)

(assert (=> b!485175 (=> (not res!288951) (not e!285658))))

(assert (=> b!485175 (= res!288951 (and (or (not (is-Cons!9332 (t!15552 l!956))) (bvsle (_1!4671 (h!10188 (t!15552 l!956))) key!251)) (is-Cons!9332 (t!15552 l!956)) (bvslt (_1!4671 (h!10188 (t!15552 l!956))) key!251)))))

(declare-fun b!485176 () Bool)

(assert (=> b!485176 (= e!285658 (containsKey!398 (t!15552 (t!15552 l!956)) key!251))))

(assert (= (and d!77175 (not res!288950)) b!485175))

(assert (= (and b!485175 res!288951) b!485176))

(declare-fun m!464833 () Bool)

(assert (=> b!485176 m!464833))

(assert (=> b!485015 d!77175))

(declare-fun d!77177 () Bool)

(assert (=> d!77177 (= ($colon$colon!130 e!285607 (ite c!58366 (h!10188 l!956) (tuple2!9321 key!251 value!166))) (Cons!9332 (ite c!58366 (h!10188 l!956) (tuple2!9321 key!251 value!166)) e!285607))))

(assert (=> bm!31214 d!77177))

(declare-fun d!77181 () Bool)

(declare-fun lt!219300 () Int)

(assert (=> d!77181 (>= lt!219300 0)))

(declare-fun e!285661 () Int)

(assert (=> d!77181 (= lt!219300 e!285661)))

(declare-fun c!58382 () Bool)

(assert (=> d!77181 (= c!58382 (is-Nil!9333 lt!219280))))

(assert (=> d!77181 (= (size!15464 lt!219280) lt!219300)))

(declare-fun b!485179 () Bool)

(assert (=> b!485179 (= e!285661 0)))

(declare-fun b!485180 () Bool)

(assert (=> b!485180 (= e!285661 (+ 1 (size!15464 (t!15552 lt!219280))))))

(assert (= (and d!77181 c!58382) b!485179))

(assert (= (and d!77181 (not c!58382)) b!485180))

(declare-fun m!464847 () Bool)

(assert (=> b!485180 m!464847))

(assert (=> d!77155 d!77181))

(declare-fun d!77185 () Bool)

(declare-fun lt!219304 () Bool)

(declare-fun content!217 (List!9336) (Set tuple2!9320))

(assert (=> d!77185 (= lt!219304 (set.member (tuple2!9321 key!251 value!166) (content!217 lt!219288)))))

(declare-fun e!285671 () Bool)

(assert (=> d!77185 (= lt!219304 e!285671)))

(declare-fun res!288961 () Bool)

(assert (=> d!77185 (=> (not res!288961) (not e!285671))))

(assert (=> d!77185 (= res!288961 (is-Cons!9332 lt!219288))))

(assert (=> d!77185 (= (contains!2677 lt!219288 (tuple2!9321 key!251 value!166)) lt!219304)))

(declare-fun b!485190 () Bool)

(declare-fun e!285670 () Bool)

(assert (=> b!485190 (= e!285671 e!285670)))

(declare-fun res!288960 () Bool)

(assert (=> b!485190 (=> res!288960 e!285670)))

(assert (=> b!485190 (= res!288960 (= (h!10188 lt!219288) (tuple2!9321 key!251 value!166)))))

(declare-fun b!485191 () Bool)

(assert (=> b!485191 (= e!285670 (contains!2677 (t!15552 lt!219288) (tuple2!9321 key!251 value!166)))))

(assert (= (and d!77185 res!288961) b!485190))

(assert (= (and b!485190 (not res!288960)) b!485191))

(declare-fun m!464853 () Bool)

(assert (=> d!77185 m!464853))

(declare-fun m!464855 () Bool)

(assert (=> d!77185 m!464855))

(declare-fun m!464857 () Bool)

(assert (=> b!485191 m!464857))

(assert (=> b!485101 d!77185))

(declare-fun c!58386 () Bool)

(declare-fun e!285676 () List!9336)

(declare-fun bm!31223 () Bool)

(declare-fun call!31227 () List!9336)

(assert (=> bm!31223 (= call!31227 ($colon$colon!130 e!285676 (ite c!58386 (h!10188 (t!15552 l!956)) (tuple2!9321 key!251 value!166))))))

(declare-fun c!58385 () Bool)

(assert (=> bm!31223 (= c!58385 c!58386)))

(declare-fun b!485192 () Bool)

(assert (=> b!485192 (= e!285676 (insertStrictlySorted!253 (t!15552 (t!15552 l!956)) key!251 value!166))))

(declare-fun b!485193 () Bool)

(declare-fun c!58387 () Bool)

(assert (=> b!485193 (= c!58387 (and (is-Cons!9332 (t!15552 l!956)) (bvsgt (_1!4671 (h!10188 (t!15552 l!956))) key!251)))))

(declare-fun e!285673 () List!9336)

(declare-fun e!285672 () List!9336)

(assert (=> b!485193 (= e!285673 e!285672)))

(declare-fun bm!31224 () Bool)

(declare-fun call!31228 () List!9336)

(declare-fun call!31226 () List!9336)

(assert (=> bm!31224 (= call!31228 call!31226)))

(declare-fun b!485194 () Bool)

(declare-fun e!285674 () List!9336)

(assert (=> b!485194 (= e!285674 call!31227)))

(declare-fun d!77191 () Bool)

(declare-fun e!285675 () Bool)

(assert (=> d!77191 e!285675))

(declare-fun res!288962 () Bool)

(assert (=> d!77191 (=> (not res!288962) (not e!285675))))

(declare-fun lt!219305 () List!9336)

(assert (=> d!77191 (= res!288962 (isStrictlySorted!433 lt!219305))))

(assert (=> d!77191 (= lt!219305 e!285674)))

(assert (=> d!77191 (= c!58386 (and (is-Cons!9332 (t!15552 l!956)) (bvslt (_1!4671 (h!10188 (t!15552 l!956))) key!251)))))

(assert (=> d!77191 (isStrictlySorted!433 (t!15552 l!956))))

(assert (=> d!77191 (= (insertStrictlySorted!253 (t!15552 l!956) key!251 value!166) lt!219305)))

(declare-fun b!485195 () Bool)

(assert (=> b!485195 (= e!285672 call!31228)))

(declare-fun b!485196 () Bool)

(assert (=> b!485196 (= e!285674 e!285673)))

(declare-fun c!58384 () Bool)

(assert (=> b!485196 (= c!58384 (and (is-Cons!9332 (t!15552 l!956)) (= (_1!4671 (h!10188 (t!15552 l!956))) key!251)))))

(declare-fun b!485197 () Bool)

(assert (=> b!485197 (= e!285673 call!31226)))

(declare-fun b!485198 () Bool)

(declare-fun res!288963 () Bool)

(assert (=> b!485198 (=> (not res!288963) (not e!285675))))

(assert (=> b!485198 (= res!288963 (containsKey!398 lt!219305 key!251))))

(declare-fun bm!31225 () Bool)

(assert (=> bm!31225 (= call!31226 call!31227)))

(declare-fun b!485199 () Bool)

(assert (=> b!485199 (= e!285675 (contains!2677 lt!219305 (tuple2!9321 key!251 value!166)))))

(declare-fun b!485200 () Bool)

(assert (=> b!485200 (= e!285672 call!31228)))

(declare-fun b!485201 () Bool)

(assert (=> b!485201 (= e!285676 (ite c!58384 (t!15552 (t!15552 l!956)) (ite c!58387 (Cons!9332 (h!10188 (t!15552 l!956)) (t!15552 (t!15552 l!956))) Nil!9333)))))

(assert (= (and d!77191 c!58386) b!485194))

(assert (= (and d!77191 (not c!58386)) b!485196))

(assert (= (and b!485196 c!58384) b!485197))

(assert (= (and b!485196 (not c!58384)) b!485193))

(assert (= (and b!485193 c!58387) b!485200))

(assert (= (and b!485193 (not c!58387)) b!485195))

(assert (= (or b!485200 b!485195) bm!31224))

(assert (= (or b!485197 bm!31224) bm!31225))

(assert (= (or b!485194 bm!31225) bm!31223))

(assert (= (and bm!31223 c!58385) b!485192))

(assert (= (and bm!31223 (not c!58385)) b!485201))

(assert (= (and d!77191 res!288962) b!485198))

(assert (= (and b!485198 res!288963) b!485199))

(declare-fun m!464859 () Bool)

(assert (=> b!485192 m!464859))

(declare-fun m!464861 () Bool)

(assert (=> d!77191 m!464861))

(assert (=> d!77191 m!464807))

(declare-fun m!464863 () Bool)

(assert (=> b!485198 m!464863))

(declare-fun m!464865 () Bool)

(assert (=> bm!31223 m!464865))

(declare-fun m!464867 () Bool)

(assert (=> b!485199 m!464867))

(assert (=> b!485094 d!77191))

(declare-fun d!77193 () Bool)

(declare-fun res!288964 () Bool)

(declare-fun e!285677 () Bool)

(assert (=> d!77193 (=> res!288964 e!285677)))

(assert (=> d!77193 (= res!288964 (and (is-Cons!9332 lt!219288) (= (_1!4671 (h!10188 lt!219288)) key!251)))))

(assert (=> d!77193 (= (containsKey!398 lt!219288 key!251) e!285677)))

(declare-fun b!485202 () Bool)

(declare-fun e!285678 () Bool)

(assert (=> b!485202 (= e!285677 e!285678)))

(declare-fun res!288965 () Bool)

(assert (=> b!485202 (=> (not res!288965) (not e!285678))))

(assert (=> b!485202 (= res!288965 (and (or (not (is-Cons!9332 lt!219288)) (bvsle (_1!4671 (h!10188 lt!219288)) key!251)) (is-Cons!9332 lt!219288) (bvslt (_1!4671 (h!10188 lt!219288)) key!251)))))

(declare-fun b!485203 () Bool)

(assert (=> b!485203 (= e!285678 (containsKey!398 (t!15552 lt!219288) key!251))))

(assert (= (and d!77193 (not res!288964)) b!485202))

(assert (= (and b!485202 res!288965) b!485203))

(declare-fun m!464869 () Bool)

(assert (=> b!485203 m!464869))

(assert (=> b!485100 d!77193))

(declare-fun d!77197 () Bool)

(declare-fun res!288968 () Bool)

(declare-fun e!285681 () Bool)

(assert (=> d!77197 (=> res!288968 e!285681)))

(assert (=> d!77197 (= res!288968 (or (is-Nil!9333 (t!15552 l!956)) (is-Nil!9333 (t!15552 (t!15552 l!956)))))))

(assert (=> d!77197 (= (isStrictlySorted!433 (t!15552 l!956)) e!285681)))

(declare-fun b!485206 () Bool)

(declare-fun e!285682 () Bool)

(assert (=> b!485206 (= e!285681 e!285682)))

(declare-fun res!288969 () Bool)

(assert (=> b!485206 (=> (not res!288969) (not e!285682))))

(assert (=> b!485206 (= res!288969 (bvslt (_1!4671 (h!10188 (t!15552 l!956))) (_1!4671 (h!10188 (t!15552 (t!15552 l!956))))))))

(declare-fun b!485207 () Bool)

(assert (=> b!485207 (= e!285682 (isStrictlySorted!433 (t!15552 (t!15552 l!956))))))

(assert (= (and d!77197 (not res!288968)) b!485206))

(assert (= (and b!485206 res!288969) b!485207))

(declare-fun m!464873 () Bool)

(assert (=> b!485207 m!464873))

(assert (=> b!485130 d!77197))

(declare-fun b!485210 () Bool)

(declare-fun e!285685 () Bool)

(declare-fun tp!43617 () Bool)

(assert (=> b!485210 (= e!285685 (and tp_is_empty!13973 tp!43617))))

(assert (=> b!485140 (= tp!43615 e!285685)))

(assert (= (and b!485140 (is-Cons!9332 (t!15552 (t!15552 l!956)))) b!485210))

(push 1)

(assert (not b!485198))

(assert (not d!77191))

(assert (not b!485207))

(assert (not b!485180))

(assert (not bm!31223))

(assert (not b!485176))

(assert (not b!485192))

(assert (not b!485164))

(assert tp_is_empty!13973)

(assert (not b!485191))

(assert (not d!77185))

(assert (not b!485210))

(assert (not b!485199))

(assert (not b!485152))

(assert (not b!485203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

