; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85362 () Bool)

(assert start!85362)

(declare-fun res!663772 () Bool)

(declare-fun e!560397 () Bool)

(assert (=> start!85362 (=> (not res!663772) (not e!560397))))

(declare-datatypes ((List!20916 0))(
  ( (Nil!20913) (Cons!20912 (h!22074 (_ BitVec 64)) (t!29917 List!20916)) )
))
(declare-fun l!3519 () List!20916)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5777 (List!20916 (_ BitVec 64)) Bool)

(assert (=> start!85362 (= res!663772 (not (contains!5777 l!3519 e!29)))))

(assert (=> start!85362 e!560397))

(assert (=> start!85362 true))

(declare-fun b!993137 () Bool)

(declare-fun res!663773 () Bool)

(assert (=> b!993137 (=> (not res!663773) (not e!560397))))

(declare-datatypes ((tuple2!15010 0))(
  ( (tuple2!15011 (_1!7516 (_ BitVec 64)) (_2!7516 List!20916)) )
))
(declare-datatypes ((Option!560 0))(
  ( (Some!559 (v!14390 tuple2!15010)) (None!558) )
))
(declare-fun isEmpty!767 (Option!560) Bool)

(declare-fun unapply!39 (List!20916) Option!560)

(assert (=> b!993137 (= res!663773 (isEmpty!767 (unapply!39 l!3519)))))

(declare-fun b!993138 () Bool)

(declare-fun res!663774 () Bool)

(assert (=> b!993138 (=> (not res!663774) (not e!560397))))

(assert (=> b!993138 (= res!663774 (is-Nil!20913 l!3519))))

(declare-fun b!993139 () Bool)

(declare-fun -!455 (List!20916 (_ BitVec 64)) List!20916)

(assert (=> b!993139 (= e!560397 (not (= (-!455 l!3519 e!29) l!3519)))))

(assert (= (and start!85362 res!663772) b!993137))

(assert (= (and b!993137 res!663773) b!993138))

(assert (= (and b!993138 res!663774) b!993139))

(declare-fun m!920903 () Bool)

(assert (=> start!85362 m!920903))

(declare-fun m!920905 () Bool)

(assert (=> b!993137 m!920905))

(assert (=> b!993137 m!920905))

(declare-fun m!920907 () Bool)

(assert (=> b!993137 m!920907))

(declare-fun m!920909 () Bool)

(assert (=> b!993139 m!920909))

(push 1)

(assert (not b!993139))

(assert (not start!85362))

(assert (not b!993137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!993180 () Bool)

(declare-fun e!560427 () List!20916)

(assert (=> b!993180 (= e!560427 Nil!20913)))

(declare-fun e!560425 () Bool)

(declare-fun b!993181 () Bool)

(declare-fun lt!440464 () List!20916)

(declare-fun content!466 (List!20916) (Set (_ BitVec 64)))

(assert (=> b!993181 (= e!560425 (= (content!466 lt!440464) (setminus (content!466 l!3519) (insert e!29 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun bm!42139 () Bool)

(declare-fun call!42142 () List!20916)

(assert (=> bm!42139 (= call!42142 (-!455 (t!29917 l!3519) e!29))))

(declare-fun d!118459 () Bool)

(assert (=> d!118459 e!560425))

(declare-fun res!663783 () Bool)

(assert (=> d!118459 (=> (not res!663783) (not e!560425))))

(declare-fun size!30698 (List!20916) Int)

(assert (=> d!118459 (= res!663783 (<= (size!30698 lt!440464) (size!30698 l!3519)))))

(assert (=> d!118459 (= lt!440464 e!560427)))

(declare-fun c!100837 () Bool)

(assert (=> d!118459 (= c!100837 (is-Cons!20912 l!3519))))

(assert (=> d!118459 (= (-!455 l!3519 e!29) lt!440464)))

(declare-fun b!993182 () Bool)

(declare-fun e!560426 () List!20916)

(assert (=> b!993182 (= e!560426 call!42142)))

(declare-fun b!993183 () Bool)

(assert (=> b!993183 (= e!560427 e!560426)))

(declare-fun c!100836 () Bool)

(assert (=> b!993183 (= c!100836 (= e!29 (h!22074 l!3519)))))

(declare-fun b!993184 () Bool)

(assert (=> b!993184 (= e!560426 (Cons!20912 (h!22074 l!3519) call!42142))))

(assert (= (and d!118459 c!100837) b!993183))

(assert (= (and d!118459 (not c!100837)) b!993180))

(assert (= (and b!993183 c!100836) b!993182))

(assert (= (and b!993183 (not c!100836)) b!993184))

(assert (= (or b!993182 b!993184) bm!42139))

(assert (= (and d!118459 res!663783) b!993181))

(declare-fun m!920935 () Bool)

(assert (=> b!993181 m!920935))

(declare-fun m!920937 () Bool)

(assert (=> b!993181 m!920937))

(declare-fun m!920939 () Bool)

(assert (=> b!993181 m!920939))

(declare-fun m!920941 () Bool)

(assert (=> bm!42139 m!920941))

(declare-fun m!920943 () Bool)

(assert (=> d!118459 m!920943))

(declare-fun m!920945 () Bool)

(assert (=> d!118459 m!920945))

(assert (=> b!993139 d!118459))

(declare-fun d!118465 () Bool)

(declare-fun lt!440473 () Bool)

(assert (=> d!118465 (= lt!440473 (member e!29 (content!466 l!3519)))))

(declare-fun e!560444 () Bool)

(assert (=> d!118465 (= lt!440473 e!560444)))

(declare-fun res!663800 () Bool)

(assert (=> d!118465 (=> (not res!663800) (not e!560444))))

(assert (=> d!118465 (= res!663800 (is-Cons!20912 l!3519))))

(assert (=> d!118465 (= (contains!5777 l!3519 e!29) lt!440473)))

(declare-fun b!993201 () Bool)

(declare-fun e!560445 () Bool)

(assert (=> b!993201 (= e!560444 e!560445)))

(declare-fun res!663801 () Bool)

(assert (=> b!993201 (=> res!663801 e!560445)))

(assert (=> b!993201 (= res!663801 (= (h!22074 l!3519) e!29))))

(declare-fun b!993202 () Bool)

(assert (=> b!993202 (= e!560445 (contains!5777 (t!29917 l!3519) e!29))))

(assert (= (and d!118465 res!663800) b!993201))

(assert (= (and b!993201 (not res!663801)) b!993202))

(assert (=> d!118465 m!920937))

