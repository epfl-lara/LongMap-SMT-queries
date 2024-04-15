; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138088 () Bool)

(assert start!138088)

(declare-fun b!1584529 () Bool)

(declare-fun res!1082344 () Bool)

(declare-fun e!884553 () Bool)

(assert (=> b!1584529 (=> (not res!1082344) (not e!884553))))

(declare-datatypes ((B!2934 0))(
  ( (B!2935 (val!19829 Int)) )
))
(declare-datatypes ((tuple2!25894 0))(
  ( (tuple2!25895 (_1!12958 (_ BitVec 64)) (_2!12958 B!2934)) )
))
(declare-datatypes ((List!36990 0))(
  ( (Nil!36987) (Cons!36986 (h!38530 tuple2!25894) (t!51898 List!36990)) )
))
(declare-fun l!1251 () List!36990)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!1006 (List!36990 (_ BitVec 64)) Bool)

(assert (=> b!1584529 (= res!1082344 (not (containsKey!1006 l!1251 otherKey!56)))))

(declare-fun b!1584530 () Bool)

(declare-fun res!1082346 () Bool)

(assert (=> b!1584530 (=> (not res!1082346) (not e!884553))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1584530 (= res!1082346 (and (not (= otherKey!56 newKey!123)) (not (is-Cons!36986 l!1251))))))

(declare-fun b!1584532 () Bool)

(declare-fun e!884554 () Bool)

(declare-fun tp_is_empty!39467 () Bool)

(declare-fun tp!115147 () Bool)

(assert (=> b!1584532 (= e!884554 (and tp_is_empty!39467 tp!115147))))

(declare-fun res!1082345 () Bool)

(assert (=> start!138088 (=> (not res!1082345) (not e!884553))))

(declare-fun isStrictlySorted!1172 (List!36990) Bool)

(assert (=> start!138088 (= res!1082345 (isStrictlySorted!1172 l!1251))))

(assert (=> start!138088 e!884553))

(assert (=> start!138088 e!884554))

(assert (=> start!138088 true))

(assert (=> start!138088 tp_is_empty!39467))

(declare-fun b!1584531 () Bool)

(declare-fun newValue!123 () B!2934)

(declare-fun insertStrictlySorted!632 (List!36990 (_ BitVec 64) B!2934) List!36990)

(assert (=> b!1584531 (= e!884553 (containsKey!1006 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123) otherKey!56))))

(assert (= (and start!138088 res!1082345) b!1584529))

(assert (= (and b!1584529 res!1082344) b!1584530))

(assert (= (and b!1584530 res!1082346) b!1584531))

(assert (= (and start!138088 (is-Cons!36986 l!1251)) b!1584532))

(declare-fun m!1453089 () Bool)

(assert (=> b!1584529 m!1453089))

(declare-fun m!1453091 () Bool)

(assert (=> start!138088 m!1453091))

(declare-fun m!1453093 () Bool)

(assert (=> b!1584531 m!1453093))

(assert (=> b!1584531 m!1453093))

(declare-fun m!1453095 () Bool)

(assert (=> b!1584531 m!1453095))

(push 1)

(assert tp_is_empty!39467)

(assert (not b!1584531))

(assert (not b!1584532))

(assert (not start!138088))

(assert (not b!1584529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167317 () Bool)

(declare-fun res!1082367 () Bool)

(declare-fun e!884575 () Bool)

(assert (=> d!167317 (=> res!1082367 e!884575)))

(assert (=> d!167317 (= res!1082367 (and (is-Cons!36986 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)) (= (_1!12958 (h!38530 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167317 (= (containsKey!1006 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123) otherKey!56) e!884575)))

(declare-fun b!1584553 () Bool)

(declare-fun e!884576 () Bool)

(assert (=> b!1584553 (= e!884575 e!884576)))

(declare-fun res!1082368 () Bool)

(assert (=> b!1584553 (=> (not res!1082368) (not e!884576))))

(assert (=> b!1584553 (= res!1082368 (and (or (not (is-Cons!36986 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) (bvsle (_1!12958 (h!38530 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) otherKey!56)) (is-Cons!36986 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)) (bvslt (_1!12958 (h!38530 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584554 () Bool)

(assert (=> b!1584554 (= e!884576 (containsKey!1006 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167317 (not res!1082367)) b!1584553))

(assert (= (and b!1584553 res!1082368) b!1584554))

(declare-fun m!1453105 () Bool)

(assert (=> b!1584554 m!1453105))

(assert (=> b!1584531 d!167317))

(declare-fun b!1584625 () Bool)

(declare-fun res!1082383 () Bool)

(declare-fun e!884616 () Bool)

(assert (=> b!1584625 (=> (not res!1082383) (not e!884616))))

(declare-fun lt!677021 () List!36990)

(assert (=> b!1584625 (= res!1082383 (containsKey!1006 lt!677021 newKey!123))))

(declare-fun b!1584626 () Bool)

(declare-fun e!884614 () List!36990)

(declare-fun call!72572 () List!36990)

(assert (=> b!1584626 (= e!884614 call!72572)))

(declare-fun d!167327 () Bool)

(assert (=> d!167327 e!884616))

(declare-fun res!1082384 () Bool)

(assert (=> d!167327 (=> (not res!1082384) (not e!884616))))

(assert (=> d!167327 (= res!1082384 (isStrictlySorted!1172 lt!677021))))

(assert (=> d!167327 (= lt!677021 e!884614)))

(declare-fun c!146851 () Bool)

(assert (=> d!167327 (= c!146851 (and (is-Cons!36986 l!1251) (bvslt (_1!12958 (h!38530 l!1251)) newKey!123)))))

(assert (=> d!167327 (isStrictlySorted!1172 l!1251)))

(assert (=> d!167327 (= (insertStrictlySorted!632 l!1251 newKey!123 newValue!123) lt!677021)))

(declare-fun b!1584627 () Bool)

(declare-fun contains!10483 (List!36990 tuple2!25894) Bool)

(assert (=> b!1584627 (= e!884616 (contains!10483 lt!677021 (tuple2!25895 newKey!123 newValue!123)))))

(declare-fun e!884615 () List!36990)

(declare-fun bm!72568 () Bool)

(declare-fun $colon$colon!1029 (List!36990 tuple2!25894) List!36990)

(assert (=> bm!72568 (= call!72572 ($colon$colon!1029 e!884615 (ite c!146851 (h!38530 l!1251) (tuple2!25895 newKey!123 newValue!123))))))

(declare-fun c!146852 () Bool)

(assert (=> bm!72568 (= c!146852 c!146851)))

(declare-fun b!1584628 () Bool)

(declare-fun c!146854 () Bool)

(assert (=> b!1584628 (= c!146854 (and (is-Cons!36986 l!1251) (bvsgt (_1!12958 (h!38530 l!1251)) newKey!123)))))

(declare-fun e!884613 () List!36990)

(declare-fun e!884612 () List!36990)

(assert (=> b!1584628 (= e!884613 e!884612)))

(declare-fun b!1584629 () Bool)

(declare-fun call!72573 () List!36990)

(assert (=> b!1584629 (= e!884612 call!72573)))

(declare-fun c!146853 () Bool)

(declare-fun b!1584630 () Bool)

(assert (=> b!1584630 (= e!884615 (ite c!146853 (t!51898 l!1251) (ite c!146854 (Cons!36986 (h!38530 l!1251) (t!51898 l!1251)) Nil!36987)))))

(declare-fun b!1584631 () Bool)

(assert (=> b!1584631 (= e!884612 call!72573)))

(declare-fun b!1584632 () Bool)

(declare-fun call!72570 () List!36990)

(assert (=> b!1584632 (= e!884613 call!72570)))

(declare-fun bm!72569 () Bool)

(assert (=> bm!72569 (= call!72570 call!72572)))

(declare-fun b!1584633 () Bool)

(assert (=> b!1584633 (= e!884615 (insertStrictlySorted!632 (t!51898 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584634 () Bool)

(assert (=> b!1584634 (= e!884614 e!884613)))

(assert (=> b!1584634 (= c!146853 (and (is-Cons!36986 l!1251) (= (_1!12958 (h!38530 l!1251)) newKey!123)))))

(declare-fun bm!72570 () Bool)

(assert (=> bm!72570 (= call!72573 call!72570)))

(assert (= (and d!167327 c!146851) b!1584626))

(assert (= (and d!167327 (not c!146851)) b!1584634))

(assert (= (and b!1584634 c!146853) b!1584632))

(assert (= (and b!1584634 (not c!146853)) b!1584628))

(assert (= (and b!1584628 c!146854) b!1584629))

(assert (= (and b!1584628 (not c!146854)) b!1584631))

(assert (= (or b!1584629 b!1584631) bm!72570))

(assert (= (or b!1584632 bm!72570) bm!72569))

(assert (= (or b!1584626 bm!72569) bm!72568))

(assert (= (and bm!72568 c!146852) b!1584633))

(assert (= (and bm!72568 (not c!146852)) b!1584630))

(assert (= (and d!167327 res!1082384) b!1584625))

(assert (= (and b!1584625 res!1082383) b!1584627))

(declare-fun m!1453107 () Bool)

(assert (=> b!1584625 m!1453107))

(declare-fun m!1453111 () Bool)

(assert (=> d!167327 m!1453111))

(assert (=> d!167327 m!1453091))

(declare-fun m!1453119 () Bool)

(assert (=> b!1584633 m!1453119))

(declare-fun m!1453123 () Bool)

(assert (=> b!1584627 m!1453123))

(declare-fun m!1453127 () Bool)

(assert (=> bm!72568 m!1453127))

(assert (=> b!1584531 d!167327))

(declare-fun d!167329 () Bool)

(declare-fun res!1082399 () Bool)

(declare-fun e!884634 () Bool)

(assert (=> d!167329 (=> res!1082399 e!884634)))

(assert (=> d!167329 (= res!1082399 (or (is-Nil!36987 l!1251) (is-Nil!36987 (t!51898 l!1251))))))

(assert (=> d!167329 (= (isStrictlySorted!1172 l!1251) e!884634)))

(declare-fun b!1584657 () Bool)

(declare-fun e!884635 () Bool)

(assert (=> b!1584657 (= e!884634 e!884635)))

(declare-fun res!1082400 () Bool)

(assert (=> b!1584657 (=> (not res!1082400) (not e!884635))))

(assert (=> b!1584657 (= res!1082400 (bvslt (_1!12958 (h!38530 l!1251)) (_1!12958 (h!38530 (t!51898 l!1251)))))))

(declare-fun b!1584658 () Bool)

(assert (=> b!1584658 (= e!884635 (isStrictlySorted!1172 (t!51898 l!1251)))))

(assert (= (and d!167329 (not res!1082399)) b!1584657))

(assert (= (and b!1584657 res!1082400) b!1584658))

(declare-fun m!1453137 () Bool)

(assert (=> b!1584658 m!1453137))

(assert (=> start!138088 d!167329))

(declare-fun d!167335 () Bool)

(declare-fun res!1082405 () Bool)

(declare-fun e!884640 () Bool)

(assert (=> d!167335 (=> res!1082405 e!884640)))

(assert (=> d!167335 (= res!1082405 (and (is-Cons!36986 l!1251) (= (_1!12958 (h!38530 l!1251)) otherKey!56)))))

(assert (=> d!167335 (= (containsKey!1006 l!1251 otherKey!56) e!884640)))

(declare-fun b!1584663 () Bool)

(declare-fun e!884641 () Bool)

(assert (=> b!1584663 (= e!884640 e!884641)))

(declare-fun res!1082406 () Bool)

(assert (=> b!1584663 (=> (not res!1082406) (not e!884641))))

(assert (=> b!1584663 (= res!1082406 (and (or (not (is-Cons!36986 l!1251)) (bvsle (_1!12958 (h!38530 l!1251)) otherKey!56)) (is-Cons!36986 l!1251) (bvslt (_1!12958 (h!38530 l!1251)) otherKey!56)))))

(declare-fun b!1584664 () Bool)

(assert (=> b!1584664 (= e!884641 (containsKey!1006 (t!51898 l!1251) otherKey!56))))

(assert (= (and d!167335 (not res!1082405)) b!1584663))

(assert (= (and b!1584663 res!1082406) b!1584664))

(declare-fun m!1453143 () Bool)

(assert (=> b!1584664 m!1453143))

(assert (=> b!1584529 d!167335))

(declare-fun b!1584679 () Bool)

(declare-fun e!884650 () Bool)

(declare-fun tp!115156 () Bool)

(assert (=> b!1584679 (= e!884650 (and tp_is_empty!39467 tp!115156))))

(assert (=> b!1584532 (= tp!115147 e!884650)))

(assert (= (and b!1584532 (is-Cons!36986 (t!51898 l!1251))) b!1584679))

(push 1)

(assert (not b!1584664))

(assert (not bm!72568))

(assert (not b!1584625))

(assert (not b!1584633))

(assert (not b!1584658))

(assert tp_is_empty!39467)

(assert (not b!1584554))

(assert (not b!1584679))

(assert (not b!1584627))

(assert (not d!167327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167337 () Bool)

(declare-fun res!1082407 () Bool)

(declare-fun e!884651 () Bool)

(assert (=> d!167337 (=> res!1082407 e!884651)))

(assert (=> d!167337 (= res!1082407 (or (is-Nil!36987 lt!677021) (is-Nil!36987 (t!51898 lt!677021))))))

(assert (=> d!167337 (= (isStrictlySorted!1172 lt!677021) e!884651)))

(declare-fun b!1584680 () Bool)

(declare-fun e!884652 () Bool)

(assert (=> b!1584680 (= e!884651 e!884652)))

(declare-fun res!1082408 () Bool)

(assert (=> b!1584680 (=> (not res!1082408) (not e!884652))))

(assert (=> b!1584680 (= res!1082408 (bvslt (_1!12958 (h!38530 lt!677021)) (_1!12958 (h!38530 (t!51898 lt!677021)))))))

(declare-fun b!1584681 () Bool)

(assert (=> b!1584681 (= e!884652 (isStrictlySorted!1172 (t!51898 lt!677021)))))

(assert (= (and d!167337 (not res!1082407)) b!1584680))

(assert (= (and b!1584680 res!1082408) b!1584681))

(declare-fun m!1453145 () Bool)

(assert (=> b!1584681 m!1453145))

(assert (=> d!167327 d!167337))

(assert (=> d!167327 d!167329))

(declare-fun d!167339 () Bool)

(declare-fun lt!677025 () Bool)

(declare-fun content!853 (List!36990) (Set tuple2!25894))

(assert (=> d!167339 (= lt!677025 (set.member (tuple2!25895 newKey!123 newValue!123) (content!853 lt!677021)))))

(declare-fun e!884658 () Bool)

(assert (=> d!167339 (= lt!677025 e!884658)))

(declare-fun res!1082414 () Bool)

(assert (=> d!167339 (=> (not res!1082414) (not e!884658))))

(assert (=> d!167339 (= res!1082414 (is-Cons!36986 lt!677021))))

(assert (=> d!167339 (= (contains!10483 lt!677021 (tuple2!25895 newKey!123 newValue!123)) lt!677025)))

(declare-fun b!1584686 () Bool)

(declare-fun e!884657 () Bool)

(assert (=> b!1584686 (= e!884658 e!884657)))

(declare-fun res!1082413 () Bool)

(assert (=> b!1584686 (=> res!1082413 e!884657)))

(assert (=> b!1584686 (= res!1082413 (= (h!38530 lt!677021) (tuple2!25895 newKey!123 newValue!123)))))

(declare-fun b!1584687 () Bool)

(assert (=> b!1584687 (= e!884657 (contains!10483 (t!51898 lt!677021) (tuple2!25895 newKey!123 newValue!123)))))

(assert (= (and d!167339 res!1082414) b!1584686))

(assert (= (and b!1584686 (not res!1082413)) b!1584687))

(declare-fun m!1453147 () Bool)

(assert (=> d!167339 m!1453147))

(declare-fun m!1453149 () Bool)

(assert (=> d!167339 m!1453149))

(declare-fun m!1453151 () Bool)

(assert (=> b!1584687 m!1453151))

(assert (=> b!1584627 d!167339))

(declare-fun d!167341 () Bool)

(assert (=> d!167341 (= ($colon$colon!1029 e!884615 (ite c!146851 (h!38530 l!1251) (tuple2!25895 newKey!123 newValue!123))) (Cons!36986 (ite c!146851 (h!38530 l!1251) (tuple2!25895 newKey!123 newValue!123)) e!884615))))

(assert (=> bm!72568 d!167341))

(declare-fun d!167345 () Bool)

(declare-fun res!1082415 () Bool)

(declare-fun e!884659 () Bool)

(assert (=> d!167345 (=> res!1082415 e!884659)))

(assert (=> d!167345 (= res!1082415 (and (is-Cons!36986 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) (= (_1!12958 (h!38530 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167345 (= (containsKey!1006 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)) otherKey!56) e!884659)))

(declare-fun b!1584688 () Bool)

(declare-fun e!884660 () Bool)

(assert (=> b!1584688 (= e!884659 e!884660)))

(declare-fun res!1082416 () Bool)

(assert (=> b!1584688 (=> (not res!1082416) (not e!884660))))

(assert (=> b!1584688 (= res!1082416 (and (or (not (is-Cons!36986 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12958 (h!38530 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)))) otherKey!56)) (is-Cons!36986 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) (bvslt (_1!12958 (h!38530 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584689 () Bool)

(assert (=> b!1584689 (= e!884660 (containsKey!1006 (t!51898 (t!51898 (insertStrictlySorted!632 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167345 (not res!1082415)) b!1584688))

(assert (= (and b!1584688 res!1082416) b!1584689))

(declare-fun m!1453153 () Bool)

(assert (=> b!1584689 m!1453153))

(assert (=> b!1584554 d!167345))

(declare-fun d!167347 () Bool)

(declare-fun res!1082417 () Bool)

(declare-fun e!884661 () Bool)

(assert (=> d!167347 (=> res!1082417 e!884661)))

(assert (=> d!167347 (= res!1082417 (or (is-Nil!36987 (t!51898 l!1251)) (is-Nil!36987 (t!51898 (t!51898 l!1251)))))))

(assert (=> d!167347 (= (isStrictlySorted!1172 (t!51898 l!1251)) e!884661)))

(declare-fun b!1584690 () Bool)

(declare-fun e!884662 () Bool)

(assert (=> b!1584690 (= e!884661 e!884662)))

(declare-fun res!1082418 () Bool)

(assert (=> b!1584690 (=> (not res!1082418) (not e!884662))))

(assert (=> b!1584690 (= res!1082418 (bvslt (_1!12958 (h!38530 (t!51898 l!1251))) (_1!12958 (h!38530 (t!51898 (t!51898 l!1251))))))))

(declare-fun b!1584691 () Bool)

(assert (=> b!1584691 (= e!884662 (isStrictlySorted!1172 (t!51898 (t!51898 l!1251))))))

(assert (= (and d!167347 (not res!1082417)) b!1584690))

(assert (= (and b!1584690 res!1082418) b!1584691))

(declare-fun m!1453155 () Bool)

(assert (=> b!1584691 m!1453155))

(assert (=> b!1584658 d!167347))

(declare-fun b!1584692 () Bool)

(declare-fun res!1082419 () Bool)

(declare-fun e!884667 () Bool)

(assert (=> b!1584692 (=> (not res!1082419) (not e!884667))))

(declare-fun lt!677026 () List!36990)

(assert (=> b!1584692 (= res!1082419 (containsKey!1006 lt!677026 newKey!123))))

(declare-fun b!1584693 () Bool)

(declare-fun e!884665 () List!36990)

(declare-fun call!72578 () List!36990)

(assert (=> b!1584693 (= e!884665 call!72578)))

(declare-fun d!167349 () Bool)

(assert (=> d!167349 e!884667))

(declare-fun res!1082420 () Bool)

(assert (=> d!167349 (=> (not res!1082420) (not e!884667))))

(assert (=> d!167349 (= res!1082420 (isStrictlySorted!1172 lt!677026))))

(assert (=> d!167349 (= lt!677026 e!884665)))

(declare-fun c!146859 () Bool)

(assert (=> d!167349 (= c!146859 (and (is-Cons!36986 (t!51898 l!1251)) (bvslt (_1!12958 (h!38530 (t!51898 l!1251))) newKey!123)))))

(assert (=> d!167349 (isStrictlySorted!1172 (t!51898 l!1251))))

(assert (=> d!167349 (= (insertStrictlySorted!632 (t!51898 l!1251) newKey!123 newValue!123) lt!677026)))

(declare-fun b!1584694 () Bool)

(assert (=> b!1584694 (= e!884667 (contains!10483 lt!677026 (tuple2!25895 newKey!123 newValue!123)))))

(declare-fun e!884666 () List!36990)

(declare-fun bm!72574 () Bool)

(assert (=> bm!72574 (= call!72578 ($colon$colon!1029 e!884666 (ite c!146859 (h!38530 (t!51898 l!1251)) (tuple2!25895 newKey!123 newValue!123))))))

(declare-fun c!146860 () Bool)

(assert (=> bm!72574 (= c!146860 c!146859)))

(declare-fun b!1584695 () Bool)

(declare-fun c!146862 () Bool)

(assert (=> b!1584695 (= c!146862 (and (is-Cons!36986 (t!51898 l!1251)) (bvsgt (_1!12958 (h!38530 (t!51898 l!1251))) newKey!123)))))

(declare-fun e!884664 () List!36990)

(declare-fun e!884663 () List!36990)

(assert (=> b!1584695 (= e!884664 e!884663)))

(declare-fun b!1584696 () Bool)

(declare-fun call!72579 () List!36990)

(assert (=> b!1584696 (= e!884663 call!72579)))

(declare-fun b!1584697 () Bool)

(declare-fun c!146861 () Bool)

(assert (=> b!1584697 (= e!884666 (ite c!146861 (t!51898 (t!51898 l!1251)) (ite c!146862 (Cons!36986 (h!38530 (t!51898 l!1251)) (t!51898 (t!51898 l!1251))) Nil!36987)))))

(declare-fun b!1584698 () Bool)

(assert (=> b!1584698 (= e!884663 call!72579)))

(declare-fun b!1584699 () Bool)

(declare-fun call!72577 () List!36990)

(assert (=> b!1584699 (= e!884664 call!72577)))

(declare-fun bm!72575 () Bool)

(assert (=> bm!72575 (= call!72577 call!72578)))

(declare-fun b!1584700 () Bool)

(assert (=> b!1584700 (= e!884666 (insertStrictlySorted!632 (t!51898 (t!51898 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1584701 () Bool)

(assert (=> b!1584701 (= e!884665 e!884664)))

(assert (=> b!1584701 (= c!146861 (and (is-Cons!36986 (t!51898 l!1251)) (= (_1!12958 (h!38530 (t!51898 l!1251))) newKey!123)))))

(declare-fun bm!72576 () Bool)

(assert (=> bm!72576 (= call!72579 call!72577)))

(assert (= (and d!167349 c!146859) b!1584693))

(assert (= (and d!167349 (not c!146859)) b!1584701))

(assert (= (and b!1584701 c!146861) b!1584699))

(assert (= (and b!1584701 (not c!146861)) b!1584695))

(assert (= (and b!1584695 c!146862) b!1584696))

(assert (= (and b!1584695 (not c!146862)) b!1584698))

(assert (= (or b!1584696 b!1584698) bm!72576))

(assert (= (or b!1584699 bm!72576) bm!72575))

(assert (= (or b!1584693 bm!72575) bm!72574))

(assert (= (and bm!72574 c!146860) b!1584700))

(assert (= (and bm!72574 (not c!146860)) b!1584697))

(assert (= (and d!167349 res!1082420) b!1584692))

(assert (= (and b!1584692 res!1082419) b!1584694))

(declare-fun m!1453157 () Bool)

(assert (=> b!1584692 m!1453157))

(declare-fun m!1453159 () Bool)

(assert (=> d!167349 m!1453159))

(assert (=> d!167349 m!1453137))

(declare-fun m!1453161 () Bool)

(assert (=> b!1584700 m!1453161))

(declare-fun m!1453163 () Bool)

(assert (=> b!1584694 m!1453163))

(declare-fun m!1453165 () Bool)

(assert (=> bm!72574 m!1453165))

(assert (=> b!1584633 d!167349))

(declare-fun d!167351 () Bool)

(declare-fun res!1082421 () Bool)

(declare-fun e!884668 () Bool)

(assert (=> d!167351 (=> res!1082421 e!884668)))

(assert (=> d!167351 (= res!1082421 (and (is-Cons!36986 lt!677021) (= (_1!12958 (h!38530 lt!677021)) newKey!123)))))

(assert (=> d!167351 (= (containsKey!1006 lt!677021 newKey!123) e!884668)))

(declare-fun b!1584702 () Bool)

(declare-fun e!884669 () Bool)

(assert (=> b!1584702 (= e!884668 e!884669)))

(declare-fun res!1082422 () Bool)

(assert (=> b!1584702 (=> (not res!1082422) (not e!884669))))

(assert (=> b!1584702 (= res!1082422 (and (or (not (is-Cons!36986 lt!677021)) (bvsle (_1!12958 (h!38530 lt!677021)) newKey!123)) (is-Cons!36986 lt!677021) (bvslt (_1!12958 (h!38530 lt!677021)) newKey!123)))))

(declare-fun b!1584703 () Bool)

(assert (=> b!1584703 (= e!884669 (containsKey!1006 (t!51898 lt!677021) newKey!123))))

(assert (= (and d!167351 (not res!1082421)) b!1584702))

(assert (= (and b!1584702 res!1082422) b!1584703))

(declare-fun m!1453167 () Bool)

(assert (=> b!1584703 m!1453167))

(assert (=> b!1584625 d!167351))

(declare-fun d!167353 () Bool)

(declare-fun res!1082423 () Bool)

(declare-fun e!884670 () Bool)

(assert (=> d!167353 (=> res!1082423 e!884670)))

(assert (=> d!167353 (= res!1082423 (and (is-Cons!36986 (t!51898 l!1251)) (= (_1!12958 (h!38530 (t!51898 l!1251))) otherKey!56)))))

(assert (=> d!167353 (= (containsKey!1006 (t!51898 l!1251) otherKey!56) e!884670)))

(declare-fun b!1584704 () Bool)

(declare-fun e!884671 () Bool)

(assert (=> b!1584704 (= e!884670 e!884671)))

(declare-fun res!1082424 () Bool)

(assert (=> b!1584704 (=> (not res!1082424) (not e!884671))))

(assert (=> b!1584704 (= res!1082424 (and (or (not (is-Cons!36986 (t!51898 l!1251))) (bvsle (_1!12958 (h!38530 (t!51898 l!1251))) otherKey!56)) (is-Cons!36986 (t!51898 l!1251)) (bvslt (_1!12958 (h!38530 (t!51898 l!1251))) otherKey!56)))))

(declare-fun b!1584705 () Bool)

(assert (=> b!1584705 (= e!884671 (containsKey!1006 (t!51898 (t!51898 l!1251)) otherKey!56))))

(assert (= (and d!167353 (not res!1082423)) b!1584704))

(assert (= (and b!1584704 res!1082424) b!1584705))

(declare-fun m!1453169 () Bool)

(assert (=> b!1584705 m!1453169))

(assert (=> b!1584664 d!167353))

(declare-fun b!1584706 () Bool)

(declare-fun e!884672 () Bool)

(declare-fun tp!115157 () Bool)

(assert (=> b!1584706 (= e!884672 (and tp_is_empty!39467 tp!115157))))

(assert (=> b!1584679 (= tp!115156 e!884672)))

(assert (= (and b!1584679 (is-Cons!36986 (t!51898 (t!51898 l!1251)))) b!1584706))

(push 1)

(assert (not b!1584687))

(assert (not b!1584706))

(assert (not d!167339))

(assert (not b!1584691))

(assert (not b!1584694))

(assert (not b!1584700))

(assert (not b!1584681))

(assert (not b!1584703))

(assert tp_is_empty!39467)

(assert (not bm!72574))

(assert (not b!1584692))

(assert (not b!1584705))

(assert (not b!1584689))

(assert (not d!167349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

