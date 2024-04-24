; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88856 () Bool)

(assert start!88856)

(declare-fun res!683425 () Bool)

(declare-fun e!573878 () Bool)

(assert (=> start!88856 (=> (not res!683425) (not e!573878))))

(declare-datatypes ((B!1662 0))(
  ( (B!1663 (val!11915 Int)) )
))
(declare-datatypes ((tuple2!15380 0))(
  ( (tuple2!15381 (_1!7701 (_ BitVec 64)) (_2!7701 B!1662)) )
))
(declare-datatypes ((List!21592 0))(
  ( (Nil!21589) (Cons!21588 (h!22795 tuple2!15380) (t!30585 List!21592)) )
))
(declare-fun l!996 () List!21592)

(declare-fun isStrictlySorted!656 (List!21592) Bool)

(assert (=> start!88856 (= res!683425 (isStrictlySorted!656 l!996))))

(assert (=> start!88856 e!573878))

(declare-fun e!573879 () Bool)

(assert (=> start!88856 e!573879))

(assert (=> start!88856 true))

(declare-fun tp_is_empty!23729 () Bool)

(assert (=> start!88856 tp_is_empty!23729))

(declare-fun b!1019746 () Bool)

(declare-fun res!683426 () Bool)

(assert (=> b!1019746 (=> (not res!683426) (not e!573878))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!530 (List!21592 (_ BitVec 64)) Bool)

(assert (=> b!1019746 (= res!683426 (containsKey!530 l!996 key!261))))

(declare-fun value!172 () B!1662)

(declare-fun lt!450074 () List!21592)

(declare-fun b!1019747 () Bool)

(assert (=> b!1019747 (= e!573878 (and (is-Cons!21588 l!996) (= (_1!7701 (h!22795 l!996)) key!261) (not (= lt!450074 (Cons!21588 (tuple2!15381 key!261 value!172) (t!30585 l!996))))))))

(declare-fun insertStrictlySorted!350 (List!21592 (_ BitVec 64) B!1662) List!21592)

(assert (=> b!1019747 (= lt!450074 (insertStrictlySorted!350 l!996 key!261 value!172))))

(declare-fun b!1019748 () Bool)

(declare-fun tp!71062 () Bool)

(assert (=> b!1019748 (= e!573879 (and tp_is_empty!23729 tp!71062))))

(assert (= (and start!88856 res!683425) b!1019746))

(assert (= (and b!1019746 res!683426) b!1019747))

(assert (= (and start!88856 (is-Cons!21588 l!996)) b!1019748))

(declare-fun m!940977 () Bool)

(assert (=> start!88856 m!940977))

(declare-fun m!940979 () Bool)

(assert (=> b!1019746 m!940979))

(declare-fun m!940981 () Bool)

(assert (=> b!1019747 m!940981))

(push 1)

(assert (not b!1019746))

(assert (not start!88856))

(assert (not b!1019748))

(assert tp_is_empty!23729)

(assert (not b!1019747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122319 () Bool)

(declare-fun res!683439 () Bool)

(declare-fun e!573892 () Bool)

(assert (=> d!122319 (=> res!683439 e!573892)))

(assert (=> d!122319 (= res!683439 (or (is-Nil!21589 l!996) (is-Nil!21589 (t!30585 l!996))))))

(assert (=> d!122319 (= (isStrictlySorted!656 l!996) e!573892)))

(declare-fun b!1019761 () Bool)

(declare-fun e!573893 () Bool)

(assert (=> b!1019761 (= e!573892 e!573893)))

(declare-fun res!683440 () Bool)

(assert (=> b!1019761 (=> (not res!683440) (not e!573893))))

(assert (=> b!1019761 (= res!683440 (bvslt (_1!7701 (h!22795 l!996)) (_1!7701 (h!22795 (t!30585 l!996)))))))

(declare-fun b!1019762 () Bool)

(assert (=> b!1019762 (= e!573893 (isStrictlySorted!656 (t!30585 l!996)))))

(assert (= (and d!122319 (not res!683439)) b!1019761))

(assert (= (and b!1019761 res!683440) b!1019762))

(declare-fun m!940985 () Bool)

(assert (=> b!1019762 m!940985))

(assert (=> start!88856 d!122319))

(declare-fun d!122326 () Bool)

(declare-fun res!683459 () Bool)

(declare-fun e!573912 () Bool)

(assert (=> d!122326 (=> res!683459 e!573912)))

(assert (=> d!122326 (= res!683459 (and (is-Cons!21588 l!996) (= (_1!7701 (h!22795 l!996)) key!261)))))

(assert (=> d!122326 (= (containsKey!530 l!996 key!261) e!573912)))

(declare-fun b!1019781 () Bool)

(declare-fun e!573913 () Bool)

(assert (=> b!1019781 (= e!573912 e!573913)))

(declare-fun res!683460 () Bool)

(assert (=> b!1019781 (=> (not res!683460) (not e!573913))))

(assert (=> b!1019781 (= res!683460 (and (or (not (is-Cons!21588 l!996)) (bvsle (_1!7701 (h!22795 l!996)) key!261)) (is-Cons!21588 l!996) (bvslt (_1!7701 (h!22795 l!996)) key!261)))))

(declare-fun b!1019782 () Bool)

(assert (=> b!1019782 (= e!573913 (containsKey!530 (t!30585 l!996) key!261))))

(assert (= (and d!122326 (not res!683459)) b!1019781))

(assert (= (and b!1019781 res!683460) b!1019782))

(declare-fun m!940991 () Bool)

(assert (=> b!1019782 m!940991))

(assert (=> b!1019746 d!122326))

(declare-fun b!1019855 () Bool)

(declare-fun e!573952 () List!21592)

(declare-fun e!573953 () List!21592)

(assert (=> b!1019855 (= e!573952 e!573953)))

(declare-fun c!103583 () Bool)

(assert (=> b!1019855 (= c!103583 (and (is-Cons!21588 l!996) (= (_1!7701 (h!22795 l!996)) key!261)))))

(declare-fun b!1019856 () Bool)

(declare-fun res!683478 () Bool)

(declare-fun e!573955 () Bool)

(assert (=> b!1019856 (=> (not res!683478) (not e!573955))))

(declare-fun lt!450082 () List!21592)

(assert (=> b!1019856 (= res!683478 (containsKey!530 lt!450082 key!261))))

(declare-fun bm!43043 () Bool)

(declare-fun call!43046 () List!21592)

(declare-fun call!43047 () List!21592)

(assert (=> bm!43043 (= call!43046 call!43047)))

(declare-fun c!103586 () Bool)

(declare-fun bm!43044 () Bool)

(declare-fun call!43048 () List!21592)

(declare-fun e!573951 () List!21592)

(declare-fun $colon$colon!578 (List!21592 tuple2!15380) List!21592)

(assert (=> bm!43044 (= call!43048 ($colon$colon!578 e!573951 (ite c!103586 (h!22795 l!996) (tuple2!15381 key!261 value!172))))))

(declare-fun c!103585 () Bool)

(assert (=> bm!43044 (= c!103585 c!103586)))

(declare-fun b!1019857 () Bool)

(assert (=> b!1019857 (= e!573951 (insertStrictlySorted!350 (t!30585 l!996) key!261 value!172))))

(declare-fun b!1019858 () Bool)

(declare-fun e!573954 () List!21592)

(assert (=> b!1019858 (= e!573954 call!43046)))

(declare-fun b!1019859 () Bool)

(declare-fun c!103584 () Bool)

(assert (=> b!1019859 (= e!573951 (ite c!103583 (t!30585 l!996) (ite c!103584 (Cons!21588 (h!22795 l!996) (t!30585 l!996)) Nil!21589)))))

(declare-fun b!1019861 () Bool)

(assert (=> b!1019861 (= e!573952 call!43048)))

(declare-fun b!1019862 () Bool)

(assert (=> b!1019862 (= e!573953 call!43047)))

(declare-fun d!122333 () Bool)

(assert (=> d!122333 e!573955))

(declare-fun res!683477 () Bool)

(assert (=> d!122333 (=> (not res!683477) (not e!573955))))

(assert (=> d!122333 (= res!683477 (isStrictlySorted!656 lt!450082))))

(assert (=> d!122333 (= lt!450082 e!573952)))

(assert (=> d!122333 (= c!103586 (and (is-Cons!21588 l!996) (bvslt (_1!7701 (h!22795 l!996)) key!261)))))

(assert (=> d!122333 (isStrictlySorted!656 l!996)))

(assert (=> d!122333 (= (insertStrictlySorted!350 l!996 key!261 value!172) lt!450082)))

(declare-fun b!1019860 () Bool)

(assert (=> b!1019860 (= e!573954 call!43046)))

(declare-fun b!1019863 () Bool)

(assert (=> b!1019863 (= c!103584 (and (is-Cons!21588 l!996) (bvsgt (_1!7701 (h!22795 l!996)) key!261)))))

(assert (=> b!1019863 (= e!573953 e!573954)))

(declare-fun bm!43045 () Bool)

(assert (=> bm!43045 (= call!43047 call!43048)))

(declare-fun b!1019864 () Bool)

(declare-fun contains!5920 (List!21592 tuple2!15380) Bool)

(assert (=> b!1019864 (= e!573955 (contains!5920 lt!450082 (tuple2!15381 key!261 value!172)))))

(assert (= (and d!122333 c!103586) b!1019861))

(assert (= (and d!122333 (not c!103586)) b!1019855))

(assert (= (and b!1019855 c!103583) b!1019862))

(assert (= (and b!1019855 (not c!103583)) b!1019863))

(assert (= (and b!1019863 c!103584) b!1019860))

(assert (= (and b!1019863 (not c!103584)) b!1019858))

(assert (= (or b!1019860 b!1019858) bm!43043))

(assert (= (or b!1019862 bm!43043) bm!43045))

(assert (= (or b!1019861 bm!43045) bm!43044))

(assert (= (and bm!43044 c!103585) b!1019857))

(assert (= (and bm!43044 (not c!103585)) b!1019859))

(assert (= (and d!122333 res!683477) b!1019856))

(assert (= (and b!1019856 res!683478) b!1019864))

(declare-fun m!940997 () Bool)

(assert (=> d!122333 m!940997))

(assert (=> d!122333 m!940977))

(declare-fun m!941001 () Bool)

(assert (=> b!1019864 m!941001))

(declare-fun m!941004 () Bool)

(assert (=> b!1019856 m!941004))

(declare-fun m!941009 () Bool)

(assert (=> b!1019857 m!941009))

(declare-fun m!941013 () Bool)

(assert (=> bm!43044 m!941013))

(assert (=> b!1019747 d!122333))

(declare-fun b!1019888 () Bool)

(declare-fun e!573968 () Bool)

(declare-fun tp!71068 () Bool)

(assert (=> b!1019888 (= e!573968 (and tp_is_empty!23729 tp!71068))))

(assert (=> b!1019748 (= tp!71062 e!573968)))

(assert (= (and b!1019748 (is-Cons!21588 (t!30585 l!996))) b!1019888))

(push 1)

(assert (not b!1019782))

(assert (not b!1019856))

(assert (not b!1019864))

(assert (not bm!43044))

(assert tp_is_empty!23729)

(assert (not b!1019762))

(assert (not b!1019857))

(assert (not d!122333))

(assert (not b!1019888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122337 () Bool)

(declare-fun res!683481 () Bool)

(declare-fun e!573970 () Bool)

(assert (=> d!122337 (=> res!683481 e!573970)))

(assert (=> d!122337 (= res!683481 (and (is-Cons!21588 (t!30585 l!996)) (= (_1!7701 (h!22795 (t!30585 l!996))) key!261)))))

(assert (=> d!122337 (= (containsKey!530 (t!30585 l!996) key!261) e!573970)))

(declare-fun b!1019890 () Bool)

(declare-fun e!573971 () Bool)

(assert (=> b!1019890 (= e!573970 e!573971)))

(declare-fun res!683482 () Bool)

(assert (=> b!1019890 (=> (not res!683482) (not e!573971))))

(assert (=> b!1019890 (= res!683482 (and (or (not (is-Cons!21588 (t!30585 l!996))) (bvsle (_1!7701 (h!22795 (t!30585 l!996))) key!261)) (is-Cons!21588 (t!30585 l!996)) (bvslt (_1!7701 (h!22795 (t!30585 l!996))) key!261)))))

(declare-fun b!1019891 () Bool)

(assert (=> b!1019891 (= e!573971 (containsKey!530 (t!30585 (t!30585 l!996)) key!261))))

(assert (= (and d!122337 (not res!683481)) b!1019890))

(assert (= (and b!1019890 res!683482) b!1019891))

(declare-fun m!941025 () Bool)

(assert (=> b!1019891 m!941025))

(assert (=> b!1019782 d!122337))

(declare-fun d!122339 () Bool)

(declare-fun res!683483 () Bool)

(declare-fun e!573972 () Bool)

(assert (=> d!122339 (=> res!683483 e!573972)))

(assert (=> d!122339 (= res!683483 (and (is-Cons!21588 lt!450082) (= (_1!7701 (h!22795 lt!450082)) key!261)))))

(assert (=> d!122339 (= (containsKey!530 lt!450082 key!261) e!573972)))

(declare-fun b!1019892 () Bool)

(declare-fun e!573973 () Bool)

(assert (=> b!1019892 (= e!573972 e!573973)))

(declare-fun res!683484 () Bool)

(assert (=> b!1019892 (=> (not res!683484) (not e!573973))))

(assert (=> b!1019892 (= res!683484 (and (or (not (is-Cons!21588 lt!450082)) (bvsle (_1!7701 (h!22795 lt!450082)) key!261)) (is-Cons!21588 lt!450082) (bvslt (_1!7701 (h!22795 lt!450082)) key!261)))))

(declare-fun b!1019893 () Bool)

(assert (=> b!1019893 (= e!573973 (containsKey!530 (t!30585 lt!450082) key!261))))

(assert (= (and d!122339 (not res!683483)) b!1019892))

(assert (= (and b!1019892 res!683484) b!1019893))

(declare-fun m!941027 () Bool)

(assert (=> b!1019893 m!941027))

(assert (=> b!1019856 d!122339))

(declare-fun d!122341 () Bool)

(declare-fun lt!450086 () Bool)

(declare-fun content!487 (List!21592) (Set tuple2!15380))

(assert (=> d!122341 (= lt!450086 (set.member (tuple2!15381 key!261 value!172) (content!487 lt!450082)))))

(declare-fun e!573978 () Bool)

(assert (=> d!122341 (= lt!450086 e!573978)))

(declare-fun res!683489 () Bool)

(assert (=> d!122341 (=> (not res!683489) (not e!573978))))

(assert (=> d!122341 (= res!683489 (is-Cons!21588 lt!450082))))

(assert (=> d!122341 (= (contains!5920 lt!450082 (tuple2!15381 key!261 value!172)) lt!450086)))

(declare-fun b!1019898 () Bool)

(declare-fun e!573979 () Bool)

(assert (=> b!1019898 (= e!573978 e!573979)))

(declare-fun res!683490 () Bool)

(assert (=> b!1019898 (=> res!683490 e!573979)))

(assert (=> b!1019898 (= res!683490 (= (h!22795 lt!450082) (tuple2!15381 key!261 value!172)))))

(declare-fun b!1019899 () Bool)

(assert (=> b!1019899 (= e!573979 (contains!5920 (t!30585 lt!450082) (tuple2!15381 key!261 value!172)))))

(assert (= (and d!122341 res!683489) b!1019898))

(assert (= (and b!1019898 (not res!683490)) b!1019899))

(declare-fun m!941029 () Bool)

(assert (=> d!122341 m!941029))

(declare-fun m!941031 () Bool)

(assert (=> d!122341 m!941031))

(declare-fun m!941033 () Bool)

(assert (=> b!1019899 m!941033))

(assert (=> b!1019864 d!122341))

(declare-fun d!122343 () Bool)

(declare-fun res!683491 () Bool)

(declare-fun e!573980 () Bool)

(assert (=> d!122343 (=> res!683491 e!573980)))

(assert (=> d!122343 (= res!683491 (or (is-Nil!21589 (t!30585 l!996)) (is-Nil!21589 (t!30585 (t!30585 l!996)))))))

(assert (=> d!122343 (= (isStrictlySorted!656 (t!30585 l!996)) e!573980)))

(declare-fun b!1019900 () Bool)

(declare-fun e!573981 () Bool)

(assert (=> b!1019900 (= e!573980 e!573981)))

(declare-fun res!683492 () Bool)

(assert (=> b!1019900 (=> (not res!683492) (not e!573981))))

(assert (=> b!1019900 (= res!683492 (bvslt (_1!7701 (h!22795 (t!30585 l!996))) (_1!7701 (h!22795 (t!30585 (t!30585 l!996))))))))

(declare-fun b!1019901 () Bool)

(assert (=> b!1019901 (= e!573981 (isStrictlySorted!656 (t!30585 (t!30585 l!996))))))

(assert (= (and d!122343 (not res!683491)) b!1019900))

(assert (= (and b!1019900 res!683492) b!1019901))

(declare-fun m!941035 () Bool)

(assert (=> b!1019901 m!941035))

(assert (=> b!1019762 d!122343))

(declare-fun d!122345 () Bool)

(assert (=> d!122345 (= ($colon$colon!578 e!573951 (ite c!103586 (h!22795 l!996) (tuple2!15381 key!261 value!172))) (Cons!21588 (ite c!103586 (h!22795 l!996) (tuple2!15381 key!261 value!172)) e!573951))))

(assert (=> bm!43044 d!122345))

(declare-fun d!122347 () Bool)

(declare-fun res!683493 () Bool)

(declare-fun e!573982 () Bool)

(assert (=> d!122347 (=> res!683493 e!573982)))

(assert (=> d!122347 (= res!683493 (or (is-Nil!21589 lt!450082) (is-Nil!21589 (t!30585 lt!450082))))))

(assert (=> d!122347 (= (isStrictlySorted!656 lt!450082) e!573982)))

(declare-fun b!1019902 () Bool)

(declare-fun e!573983 () Bool)

(assert (=> b!1019902 (= e!573982 e!573983)))

(declare-fun res!683494 () Bool)

(assert (=> b!1019902 (=> (not res!683494) (not e!573983))))

(assert (=> b!1019902 (= res!683494 (bvslt (_1!7701 (h!22795 lt!450082)) (_1!7701 (h!22795 (t!30585 lt!450082)))))))

(declare-fun b!1019903 () Bool)

(assert (=> b!1019903 (= e!573983 (isStrictlySorted!656 (t!30585 lt!450082)))))

(assert (= (and d!122347 (not res!683493)) b!1019902))

(assert (= (and b!1019902 res!683494) b!1019903))

(declare-fun m!941037 () Bool)

(assert (=> b!1019903 m!941037))

(assert (=> d!122333 d!122347))

(assert (=> d!122333 d!122319))

(declare-fun b!1019904 () Bool)

(declare-fun e!573985 () List!21592)

(declare-fun e!573986 () List!21592)

(assert (=> b!1019904 (= e!573985 e!573986)))

(declare-fun c!103591 () Bool)

(assert (=> b!1019904 (= c!103591 (and (is-Cons!21588 (t!30585 l!996)) (= (_1!7701 (h!22795 (t!30585 l!996))) key!261)))))

(declare-fun b!1019905 () Bool)

(declare-fun res!683496 () Bool)

(declare-fun e!573988 () Bool)

(assert (=> b!1019905 (=> (not res!683496) (not e!573988))))

(declare-fun lt!450087 () List!21592)

(assert (=> b!1019905 (= res!683496 (containsKey!530 lt!450087 key!261))))

(declare-fun bm!43049 () Bool)

(declare-fun call!43052 () List!21592)

(declare-fun call!43053 () List!21592)

(assert (=> bm!43049 (= call!43052 call!43053)))

(declare-fun e!573984 () List!21592)

(declare-fun c!103594 () Bool)

(declare-fun bm!43050 () Bool)

(declare-fun call!43054 () List!21592)

(assert (=> bm!43050 (= call!43054 ($colon$colon!578 e!573984 (ite c!103594 (h!22795 (t!30585 l!996)) (tuple2!15381 key!261 value!172))))))

(declare-fun c!103593 () Bool)

(assert (=> bm!43050 (= c!103593 c!103594)))

(declare-fun b!1019906 () Bool)

(assert (=> b!1019906 (= e!573984 (insertStrictlySorted!350 (t!30585 (t!30585 l!996)) key!261 value!172))))

(declare-fun b!1019907 () Bool)

(declare-fun e!573987 () List!21592)

(assert (=> b!1019907 (= e!573987 call!43052)))

(declare-fun c!103592 () Bool)

(declare-fun b!1019908 () Bool)

(assert (=> b!1019908 (= e!573984 (ite c!103591 (t!30585 (t!30585 l!996)) (ite c!103592 (Cons!21588 (h!22795 (t!30585 l!996)) (t!30585 (t!30585 l!996))) Nil!21589)))))

(declare-fun b!1019910 () Bool)

(assert (=> b!1019910 (= e!573985 call!43054)))

(declare-fun b!1019911 () Bool)

(assert (=> b!1019911 (= e!573986 call!43053)))

(declare-fun d!122349 () Bool)

(assert (=> d!122349 e!573988))

(declare-fun res!683495 () Bool)

(assert (=> d!122349 (=> (not res!683495) (not e!573988))))

(assert (=> d!122349 (= res!683495 (isStrictlySorted!656 lt!450087))))

(assert (=> d!122349 (= lt!450087 e!573985)))

(assert (=> d!122349 (= c!103594 (and (is-Cons!21588 (t!30585 l!996)) (bvslt (_1!7701 (h!22795 (t!30585 l!996))) key!261)))))

(assert (=> d!122349 (isStrictlySorted!656 (t!30585 l!996))))

(assert (=> d!122349 (= (insertStrictlySorted!350 (t!30585 l!996) key!261 value!172) lt!450087)))

(declare-fun b!1019909 () Bool)

(assert (=> b!1019909 (= e!573987 call!43052)))

(declare-fun b!1019912 () Bool)

(assert (=> b!1019912 (= c!103592 (and (is-Cons!21588 (t!30585 l!996)) (bvsgt (_1!7701 (h!22795 (t!30585 l!996))) key!261)))))

(assert (=> b!1019912 (= e!573986 e!573987)))

(declare-fun bm!43051 () Bool)

(assert (=> bm!43051 (= call!43053 call!43054)))

(declare-fun b!1019913 () Bool)

(assert (=> b!1019913 (= e!573988 (contains!5920 lt!450087 (tuple2!15381 key!261 value!172)))))

(assert (= (and d!122349 c!103594) b!1019910))

(assert (= (and d!122349 (not c!103594)) b!1019904))

(assert (= (and b!1019904 c!103591) b!1019911))

(assert (= (and b!1019904 (not c!103591)) b!1019912))

(assert (= (and b!1019912 c!103592) b!1019909))

(assert (= (and b!1019912 (not c!103592)) b!1019907))

(assert (= (or b!1019909 b!1019907) bm!43049))

(assert (= (or b!1019911 bm!43049) bm!43051))

(assert (= (or b!1019910 bm!43051) bm!43050))

(assert (= (and bm!43050 c!103593) b!1019906))

(assert (= (and bm!43050 (not c!103593)) b!1019908))

(assert (= (and d!122349 res!683495) b!1019905))

(assert (= (and b!1019905 res!683496) b!1019913))

(declare-fun m!941039 () Bool)

(assert (=> d!122349 m!941039))

(assert (=> d!122349 m!940985))

(declare-fun m!941041 () Bool)

(assert (=> b!1019913 m!941041))

(declare-fun m!941043 () Bool)

(assert (=> b!1019905 m!941043))

(declare-fun m!941045 () Bool)

(assert (=> b!1019906 m!941045))

(declare-fun m!941047 () Bool)

(assert (=> bm!43050 m!941047))

(assert (=> b!1019857 d!122349))

(declare-fun b!1019914 () Bool)

(declare-fun e!573989 () Bool)

(declare-fun tp!71072 () Bool)

(assert (=> b!1019914 (= e!573989 (and tp_is_empty!23729 tp!71072))))

(assert (=> b!1019888 (= tp!71068 e!573989)))

(assert (= (and b!1019888 (is-Cons!21588 (t!30585 (t!30585 l!996)))) b!1019914))

(push 1)

(assert (not b!1019903))

(assert (not d!122341))

(assert (not b!1019899))

(assert (not b!1019906))

(assert tp_is_empty!23729)

(assert (not b!1019893))

(assert (not b!1019913))

(assert (not b!1019901))

(assert (not bm!43050))

(assert (not b!1019891))

(assert (not d!122349))

(assert (not b!1019905))

(assert (not b!1019914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

