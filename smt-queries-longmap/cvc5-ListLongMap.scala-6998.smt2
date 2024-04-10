; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88816 () Bool)

(assert start!88816)

(declare-fun res!683562 () Bool)

(declare-fun e!573895 () Bool)

(assert (=> start!88816 (=> (not res!683562) (not e!573895))))

(declare-datatypes ((B!1694 0))(
  ( (B!1695 (val!11931 Int)) )
))
(declare-datatypes ((tuple2!15408 0))(
  ( (tuple2!15409 (_1!7715 (_ BitVec 64)) (_2!7715 B!1694)) )
))
(declare-datatypes ((List!21619 0))(
  ( (Nil!21616) (Cons!21615 (h!22813 tuple2!15408) (t!30626 List!21619)) )
))
(declare-fun l!996 () List!21619)

(declare-fun isStrictlySorted!684 (List!21619) Bool)

(assert (=> start!88816 (= res!683562 (isStrictlySorted!684 l!996))))

(assert (=> start!88816 e!573895))

(declare-fun e!573896 () Bool)

(assert (=> start!88816 e!573896))

(assert (=> start!88816 true))

(declare-fun tp_is_empty!23761 () Bool)

(assert (=> start!88816 tp_is_empty!23761))

(declare-fun b!1019729 () Bool)

(declare-fun tp!71170 () Bool)

(assert (=> b!1019729 (= e!573896 (and tp_is_empty!23761 tp!71170))))

(declare-fun b!1019728 () Bool)

(declare-fun e!573897 () Bool)

(declare-fun lt!449730 () List!21619)

(declare-fun length!47 (List!21619) Int)

(assert (=> b!1019728 (= e!573897 (not (= (length!47 lt!449730) (length!47 l!996))))))

(declare-fun b!1019726 () Bool)

(declare-fun res!683564 () Bool)

(assert (=> b!1019726 (=> (not res!683564) (not e!573895))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!544 (List!21619 (_ BitVec 64)) Bool)

(assert (=> b!1019726 (= res!683564 (containsKey!544 l!996 key!261))))

(declare-fun b!1019727 () Bool)

(assert (=> b!1019727 (= e!573895 e!573897)))

(declare-fun res!683563 () Bool)

(assert (=> b!1019727 (=> (not res!683563) (not e!573897))))

(declare-fun value!172 () B!1694)

(assert (=> b!1019727 (= res!683563 (and (bvsge (_1!7715 (h!22813 l!996)) key!261) (is-Cons!21615 l!996) (= (_1!7715 (h!22813 l!996)) key!261) (= lt!449730 (Cons!21615 (tuple2!15409 key!261 value!172) (t!30626 l!996)))))))

(declare-fun insertStrictlySorted!362 (List!21619 (_ BitVec 64) B!1694) List!21619)

(assert (=> b!1019727 (= lt!449730 (insertStrictlySorted!362 l!996 key!261 value!172))))

(assert (= (and start!88816 res!683562) b!1019726))

(assert (= (and b!1019726 res!683564) b!1019727))

(assert (= (and b!1019727 res!683563) b!1019728))

(assert (= (and start!88816 (is-Cons!21615 l!996)) b!1019729))

(declare-fun m!939979 () Bool)

(assert (=> start!88816 m!939979))

(declare-fun m!939981 () Bool)

(assert (=> b!1019728 m!939981))

(declare-fun m!939983 () Bool)

(assert (=> b!1019728 m!939983))

(declare-fun m!939985 () Bool)

(assert (=> b!1019726 m!939985))

(declare-fun m!939987 () Bool)

(assert (=> b!1019727 m!939987))

(push 1)

(assert (not b!1019729))

(assert (not b!1019728))

(assert (not b!1019727))

(assert tp_is_empty!23761)

(assert (not b!1019726))

(assert (not start!88816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122207 () Bool)

(declare-fun res!683587 () Bool)

(declare-fun e!573926 () Bool)

(assert (=> d!122207 (=> res!683587 e!573926)))

(assert (=> d!122207 (= res!683587 (and (is-Cons!21615 l!996) (= (_1!7715 (h!22813 l!996)) key!261)))))

(assert (=> d!122207 (= (containsKey!544 l!996 key!261) e!573926)))

(declare-fun b!1019770 () Bool)

(declare-fun e!573927 () Bool)

(assert (=> b!1019770 (= e!573926 e!573927)))

(declare-fun res!683588 () Bool)

(assert (=> b!1019770 (=> (not res!683588) (not e!573927))))

(assert (=> b!1019770 (= res!683588 (and (or (not (is-Cons!21615 l!996)) (bvsle (_1!7715 (h!22813 l!996)) key!261)) (is-Cons!21615 l!996) (bvslt (_1!7715 (h!22813 l!996)) key!261)))))

(declare-fun b!1019771 () Bool)

(assert (=> b!1019771 (= e!573927 (containsKey!544 (t!30626 l!996) key!261))))

(assert (= (and d!122207 (not res!683587)) b!1019770))

(assert (= (and b!1019770 res!683588) b!1019771))

(declare-fun m!940009 () Bool)

(assert (=> b!1019771 m!940009))

(assert (=> b!1019726 d!122207))

(declare-fun e!573975 () List!21619)

(declare-fun b!1019845 () Bool)

(assert (=> b!1019845 (= e!573975 (insertStrictlySorted!362 (t!30626 l!996) key!261 value!172))))

(declare-fun b!1019846 () Bool)

(declare-fun e!573977 () List!21619)

(declare-fun call!43137 () List!21619)

(assert (=> b!1019846 (= e!573977 call!43137)))

(declare-fun b!1019847 () Bool)

(declare-fun lt!449744 () List!21619)

(declare-fun e!573978 () Bool)

(declare-fun contains!5912 (List!21619 tuple2!15408) Bool)

(assert (=> b!1019847 (= e!573978 (contains!5912 lt!449744 (tuple2!15409 key!261 value!172)))))

(declare-fun b!1019848 () Bool)

(declare-fun res!683617 () Bool)

(assert (=> b!1019848 (=> (not res!683617) (not e!573978))))

(assert (=> b!1019848 (= res!683617 (containsKey!544 lt!449744 key!261))))

(declare-fun b!1019849 () Bool)

(declare-fun e!573974 () List!21619)

(assert (=> b!1019849 (= e!573974 e!573977)))

(declare-fun c!103426 () Bool)

(assert (=> b!1019849 (= c!103426 (and (is-Cons!21615 l!996) (= (_1!7715 (h!22813 l!996)) key!261)))))

(declare-fun b!1019850 () Bool)

(declare-fun e!573976 () List!21619)

(declare-fun call!43135 () List!21619)

(assert (=> b!1019850 (= e!573976 call!43135)))

(declare-fun b!1019851 () Bool)

(declare-fun c!103423 () Bool)

(assert (=> b!1019851 (= c!103423 (and (is-Cons!21615 l!996) (bvsgt (_1!7715 (h!22813 l!996)) key!261)))))

(assert (=> b!1019851 (= e!573977 e!573976)))

(declare-fun bm!43132 () Bool)

(declare-fun c!103425 () Bool)

(declare-fun call!43136 () List!21619)

(declare-fun $colon$colon!593 (List!21619 tuple2!15408) List!21619)

(assert (=> bm!43132 (= call!43136 ($colon$colon!593 e!573975 (ite c!103425 (h!22813 l!996) (tuple2!15409 key!261 value!172))))))

(declare-fun c!103424 () Bool)

(assert (=> bm!43132 (= c!103424 c!103425)))

(declare-fun b!1019852 () Bool)

(assert (=> b!1019852 (= e!573975 (ite c!103426 (t!30626 l!996) (ite c!103423 (Cons!21615 (h!22813 l!996) (t!30626 l!996)) Nil!21616)))))

(declare-fun b!1019853 () Bool)

(assert (=> b!1019853 (= e!573974 call!43136)))

(declare-fun b!1019854 () Bool)

(assert (=> b!1019854 (= e!573976 call!43135)))

(declare-fun d!122209 () Bool)

(assert (=> d!122209 e!573978))

(declare-fun res!683618 () Bool)

(assert (=> d!122209 (=> (not res!683618) (not e!573978))))

(assert (=> d!122209 (= res!683618 (isStrictlySorted!684 lt!449744))))

(assert (=> d!122209 (= lt!449744 e!573974)))

(assert (=> d!122209 (= c!103425 (and (is-Cons!21615 l!996) (bvslt (_1!7715 (h!22813 l!996)) key!261)))))

(assert (=> d!122209 (isStrictlySorted!684 l!996)))

(assert (=> d!122209 (= (insertStrictlySorted!362 l!996 key!261 value!172) lt!449744)))

(declare-fun bm!43133 () Bool)

(assert (=> bm!43133 (= call!43135 call!43137)))

(declare-fun bm!43134 () Bool)

(assert (=> bm!43134 (= call!43137 call!43136)))

(assert (= (and d!122209 c!103425) b!1019853))

(assert (= (and d!122209 (not c!103425)) b!1019849))

(assert (= (and b!1019849 c!103426) b!1019846))

(assert (= (and b!1019849 (not c!103426)) b!1019851))

(assert (= (and b!1019851 c!103423) b!1019854))

(assert (= (and b!1019851 (not c!103423)) b!1019850))

(assert (= (or b!1019854 b!1019850) bm!43133))

(assert (= (or b!1019846 bm!43133) bm!43134))

(assert (= (or b!1019853 bm!43134) bm!43132))

(assert (= (and bm!43132 c!103424) b!1019845))

(assert (= (and bm!43132 (not c!103424)) b!1019852))

(assert (= (and d!122209 res!683618) b!1019848))

(assert (= (and b!1019848 res!683617) b!1019847))

(declare-fun m!940031 () Bool)

(assert (=> bm!43132 m!940031))

(declare-fun m!940033 () Bool)

(assert (=> b!1019845 m!940033))

(declare-fun m!940035 () Bool)

(assert (=> b!1019848 m!940035))

(declare-fun m!940037 () Bool)

(assert (=> b!1019847 m!940037))

(declare-fun m!940039 () Bool)

(assert (=> d!122209 m!940039))

(assert (=> d!122209 m!939979))

(assert (=> b!1019727 d!122209))

(declare-fun d!122223 () Bool)

(declare-fun size!31161 (List!21619) Int)

(assert (=> d!122223 (= (length!47 lt!449730) (size!31161 lt!449730))))

(declare-fun bs!29709 () Bool)

(assert (= bs!29709 d!122223))

(declare-fun m!940041 () Bool)

(assert (=> bs!29709 m!940041))

(assert (=> b!1019728 d!122223))

(declare-fun d!122225 () Bool)

(assert (=> d!122225 (= (length!47 l!996) (size!31161 l!996))))

(declare-fun bs!29710 () Bool)

(assert (= bs!29710 d!122225))

(declare-fun m!940043 () Bool)

(assert (=> bs!29710 m!940043))

(assert (=> b!1019728 d!122225))

(declare-fun d!122227 () Bool)

(declare-fun res!683627 () Bool)

(declare-fun e!573987 () Bool)

(assert (=> d!122227 (=> res!683627 e!573987)))

(assert (=> d!122227 (= res!683627 (or (is-Nil!21616 l!996) (is-Nil!21616 (t!30626 l!996))))))

(assert (=> d!122227 (= (isStrictlySorted!684 l!996) e!573987)))

(declare-fun b!1019867 () Bool)

(declare-fun e!573988 () Bool)

(assert (=> b!1019867 (= e!573987 e!573988)))

(declare-fun res!683628 () Bool)

(assert (=> b!1019867 (=> (not res!683628) (not e!573988))))

(assert (=> b!1019867 (= res!683628 (bvslt (_1!7715 (h!22813 l!996)) (_1!7715 (h!22813 (t!30626 l!996)))))))

(declare-fun b!1019868 () Bool)

(assert (=> b!1019868 (= e!573988 (isStrictlySorted!684 (t!30626 l!996)))))

(assert (= (and d!122227 (not res!683627)) b!1019867))

(assert (= (and b!1019867 res!683628) b!1019868))

(declare-fun m!940045 () Bool)

(assert (=> b!1019868 m!940045))

(assert (=> start!88816 d!122227))

(declare-fun b!1019873 () Bool)

(declare-fun e!573991 () Bool)

(declare-fun tp!71182 () Bool)

(assert (=> b!1019873 (= e!573991 (and tp_is_empty!23761 tp!71182))))

(assert (=> b!1019729 (= tp!71170 e!573991)))

(assert (= (and b!1019729 (is-Cons!21615 (t!30626 l!996))) b!1019873))

(push 1)

(assert (not b!1019873))

(assert (not b!1019848))

(assert (not d!122225))

(assert (not bm!43132))

(assert (not b!1019845))

(assert (not b!1019847))

(assert tp_is_empty!23761)

(assert (not b!1019771))

(assert (not d!122209))

(assert (not b!1019868))

(assert (not d!122223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!449756 () Bool)

(declare-fun d!122253 () Bool)

(declare-fun content!491 (List!21619) (Set tuple2!15408))

(assert (=> d!122253 (= lt!449756 (set.member (tuple2!15409 key!261 value!172) (content!491 lt!449744)))))

(declare-fun e!574034 () Bool)

(assert (=> d!122253 (= lt!449756 e!574034)))

(declare-fun res!683657 () Bool)

(assert (=> d!122253 (=> (not res!683657) (not e!574034))))

(assert (=> d!122253 (= res!683657 (is-Cons!21615 lt!449744))))

(assert (=> d!122253 (= (contains!5912 lt!449744 (tuple2!15409 key!261 value!172)) lt!449756)))

(declare-fun b!1019932 () Bool)

(declare-fun e!574035 () Bool)

(assert (=> b!1019932 (= e!574034 e!574035)))

(declare-fun res!683658 () Bool)

(assert (=> b!1019932 (=> res!683658 e!574035)))

(assert (=> b!1019932 (= res!683658 (= (h!22813 lt!449744) (tuple2!15409 key!261 value!172)))))

(declare-fun b!1019933 () Bool)

(assert (=> b!1019933 (= e!574035 (contains!5912 (t!30626 lt!449744) (tuple2!15409 key!261 value!172)))))

(assert (= (and d!122253 res!683657) b!1019932))

(assert (= (and b!1019932 (not res!683658)) b!1019933))

(declare-fun m!940091 () Bool)

(assert (=> d!122253 m!940091))

(declare-fun m!940093 () Bool)

(assert (=> d!122253 m!940093))

(declare-fun m!940095 () Bool)

(assert (=> b!1019933 m!940095))

(assert (=> b!1019847 d!122253))

(declare-fun d!122255 () Bool)

(declare-fun res!683659 () Bool)

(declare-fun e!574036 () Bool)

(assert (=> d!122255 (=> res!683659 e!574036)))

(assert (=> d!122255 (= res!683659 (or (is-Nil!21616 (t!30626 l!996)) (is-Nil!21616 (t!30626 (t!30626 l!996)))))))

(assert (=> d!122255 (= (isStrictlySorted!684 (t!30626 l!996)) e!574036)))

(declare-fun b!1019934 () Bool)

(declare-fun e!574037 () Bool)

(assert (=> b!1019934 (= e!574036 e!574037)))

(declare-fun res!683660 () Bool)

(assert (=> b!1019934 (=> (not res!683660) (not e!574037))))

(assert (=> b!1019934 (= res!683660 (bvslt (_1!7715 (h!22813 (t!30626 l!996))) (_1!7715 (h!22813 (t!30626 (t!30626 l!996))))))))

(declare-fun b!1019935 () Bool)

(assert (=> b!1019935 (= e!574037 (isStrictlySorted!684 (t!30626 (t!30626 l!996))))))

(assert (= (and d!122255 (not res!683659)) b!1019934))

(assert (= (and b!1019934 res!683660) b!1019935))

(declare-fun m!940097 () Bool)

(assert (=> b!1019935 m!940097))

(assert (=> b!1019868 d!122255))

(declare-fun d!122257 () Bool)

(assert (=> d!122257 (= ($colon$colon!593 e!573975 (ite c!103425 (h!22813 l!996) (tuple2!15409 key!261 value!172))) (Cons!21615 (ite c!103425 (h!22813 l!996) (tuple2!15409 key!261 value!172)) e!573975))))

(assert (=> bm!43132 d!122257))

(declare-fun b!1019936 () Bool)

(declare-fun e!574039 () List!21619)

(assert (=> b!1019936 (= e!574039 (insertStrictlySorted!362 (t!30626 (t!30626 l!996)) key!261 value!172))))

(declare-fun b!1019937 () Bool)

(declare-fun e!574041 () List!21619)

(declare-fun call!43152 () List!21619)

(assert (=> b!1019937 (= e!574041 call!43152)))

(declare-fun b!1019938 () Bool)

(declare-fun e!574042 () Bool)

(declare-fun lt!449757 () List!21619)

(assert (=> b!1019938 (= e!574042 (contains!5912 lt!449757 (tuple2!15409 key!261 value!172)))))

(declare-fun b!1019939 () Bool)

(declare-fun res!683661 () Bool)

(assert (=> b!1019939 (=> (not res!683661) (not e!574042))))

(assert (=> b!1019939 (= res!683661 (containsKey!544 lt!449757 key!261))))

(declare-fun b!1019940 () Bool)

(declare-fun e!574038 () List!21619)

(assert (=> b!1019940 (= e!574038 e!574041)))

(declare-fun c!103444 () Bool)

(assert (=> b!1019940 (= c!103444 (and (is-Cons!21615 (t!30626 l!996)) (= (_1!7715 (h!22813 (t!30626 l!996))) key!261)))))

(declare-fun b!1019941 () Bool)

(declare-fun e!574040 () List!21619)

(declare-fun call!43150 () List!21619)

(assert (=> b!1019941 (= e!574040 call!43150)))

(declare-fun b!1019942 () Bool)

(declare-fun c!103441 () Bool)

(assert (=> b!1019942 (= c!103441 (and (is-Cons!21615 (t!30626 l!996)) (bvsgt (_1!7715 (h!22813 (t!30626 l!996))) key!261)))))

(assert (=> b!1019942 (= e!574041 e!574040)))

(declare-fun c!103443 () Bool)

(declare-fun call!43151 () List!21619)

(declare-fun bm!43147 () Bool)

(assert (=> bm!43147 (= call!43151 ($colon$colon!593 e!574039 (ite c!103443 (h!22813 (t!30626 l!996)) (tuple2!15409 key!261 value!172))))))

(declare-fun c!103442 () Bool)

(assert (=> bm!43147 (= c!103442 c!103443)))

(declare-fun b!1019943 () Bool)

(assert (=> b!1019943 (= e!574039 (ite c!103444 (t!30626 (t!30626 l!996)) (ite c!103441 (Cons!21615 (h!22813 (t!30626 l!996)) (t!30626 (t!30626 l!996))) Nil!21616)))))

(declare-fun b!1019944 () Bool)

(assert (=> b!1019944 (= e!574038 call!43151)))

(declare-fun b!1019945 () Bool)

(assert (=> b!1019945 (= e!574040 call!43150)))

(declare-fun d!122259 () Bool)

(assert (=> d!122259 e!574042))

(declare-fun res!683662 () Bool)

(assert (=> d!122259 (=> (not res!683662) (not e!574042))))

(assert (=> d!122259 (= res!683662 (isStrictlySorted!684 lt!449757))))

(assert (=> d!122259 (= lt!449757 e!574038)))

(assert (=> d!122259 (= c!103443 (and (is-Cons!21615 (t!30626 l!996)) (bvslt (_1!7715 (h!22813 (t!30626 l!996))) key!261)))))

(assert (=> d!122259 (isStrictlySorted!684 (t!30626 l!996))))

(assert (=> d!122259 (= (insertStrictlySorted!362 (t!30626 l!996) key!261 value!172) lt!449757)))

(declare-fun bm!43148 () Bool)

(assert (=> bm!43148 (= call!43150 call!43152)))

(declare-fun bm!43149 () Bool)

(assert (=> bm!43149 (= call!43152 call!43151)))

(assert (= (and d!122259 c!103443) b!1019944))

(assert (= (and d!122259 (not c!103443)) b!1019940))

(assert (= (and b!1019940 c!103444) b!1019937))

(assert (= (and b!1019940 (not c!103444)) b!1019942))

(assert (= (and b!1019942 c!103441) b!1019945))

(assert (= (and b!1019942 (not c!103441)) b!1019941))

(assert (= (or b!1019945 b!1019941) bm!43148))

(assert (= (or b!1019937 bm!43148) bm!43149))

(assert (= (or b!1019944 bm!43149) bm!43147))

(assert (= (and bm!43147 c!103442) b!1019936))

(assert (= (and bm!43147 (not c!103442)) b!1019943))

(assert (= (and d!122259 res!683662) b!1019939))

(assert (= (and b!1019939 res!683661) b!1019938))

(declare-fun m!940099 () Bool)

(assert (=> bm!43147 m!940099))

(declare-fun m!940101 () Bool)

(assert (=> b!1019936 m!940101))

(declare-fun m!940103 () Bool)

(assert (=> b!1019939 m!940103))

(declare-fun m!940105 () Bool)

(assert (=> b!1019938 m!940105))

(declare-fun m!940107 () Bool)

(assert (=> d!122259 m!940107))

(assert (=> d!122259 m!940045))

(assert (=> b!1019845 d!122259))

(declare-fun d!122261 () Bool)

(declare-fun res!683663 () Bool)

(declare-fun e!574043 () Bool)

(assert (=> d!122261 (=> res!683663 e!574043)))

(assert (=> d!122261 (= res!683663 (or (is-Nil!21616 lt!449744) (is-Nil!21616 (t!30626 lt!449744))))))

(assert (=> d!122261 (= (isStrictlySorted!684 lt!449744) e!574043)))

(declare-fun b!1019946 () Bool)

(declare-fun e!574044 () Bool)

(assert (=> b!1019946 (= e!574043 e!574044)))

(declare-fun res!683664 () Bool)

(assert (=> b!1019946 (=> (not res!683664) (not e!574044))))

(assert (=> b!1019946 (= res!683664 (bvslt (_1!7715 (h!22813 lt!449744)) (_1!7715 (h!22813 (t!30626 lt!449744)))))))

(declare-fun b!1019947 () Bool)

(assert (=> b!1019947 (= e!574044 (isStrictlySorted!684 (t!30626 lt!449744)))))

(assert (= (and d!122261 (not res!683663)) b!1019946))

(assert (= (and b!1019946 res!683664) b!1019947))

(declare-fun m!940109 () Bool)

(assert (=> b!1019947 m!940109))

(assert (=> d!122209 d!122261))

(assert (=> d!122209 d!122227))

(declare-fun d!122263 () Bool)

(declare-fun lt!449760 () Int)

(assert (=> d!122263 (>= lt!449760 0)))

(declare-fun e!574047 () Int)

(assert (=> d!122263 (= lt!449760 e!574047)))

(declare-fun c!103447 () Bool)

(assert (=> d!122263 (= c!103447 (is-Nil!21616 lt!449730))))

(assert (=> d!122263 (= (size!31161 lt!449730) lt!449760)))

(declare-fun b!1019952 () Bool)

(assert (=> b!1019952 (= e!574047 0)))

(declare-fun b!1019953 () Bool)

(assert (=> b!1019953 (= e!574047 (+ 1 (size!31161 (t!30626 lt!449730))))))

(assert (= (and d!122263 c!103447) b!1019952))

(assert (= (and d!122263 (not c!103447)) b!1019953))

(declare-fun m!940111 () Bool)

(assert (=> b!1019953 m!940111))

(assert (=> d!122223 d!122263))

(declare-fun d!122265 () Bool)

(declare-fun lt!449761 () Int)

(assert (=> d!122265 (>= lt!449761 0)))

(declare-fun e!574048 () Int)

(assert (=> d!122265 (= lt!449761 e!574048)))

(declare-fun c!103448 () Bool)

(assert (=> d!122265 (= c!103448 (is-Nil!21616 l!996))))

(assert (=> d!122265 (= (size!31161 l!996) lt!449761)))

(declare-fun b!1019954 () Bool)

(assert (=> b!1019954 (= e!574048 0)))

(declare-fun b!1019955 () Bool)

(assert (=> b!1019955 (= e!574048 (+ 1 (size!31161 (t!30626 l!996))))))

(assert (= (and d!122265 c!103448) b!1019954))

(assert (= (and d!122265 (not c!103448)) b!1019955))

(declare-fun m!940113 () Bool)

(assert (=> b!1019955 m!940113))

(assert (=> d!122225 d!122265))

(declare-fun d!122267 () Bool)

(declare-fun res!683665 () Bool)

(declare-fun e!574049 () Bool)

(assert (=> d!122267 (=> res!683665 e!574049)))

