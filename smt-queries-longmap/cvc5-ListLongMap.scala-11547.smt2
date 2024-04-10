; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134414 () Bool)

(assert start!134414)

(declare-datatypes ((B!2516 0))(
  ( (B!2517 (val!19620 Int)) )
))
(declare-fun v2!10 () B!2516)

(declare-datatypes ((tuple2!25342 0))(
  ( (tuple2!25343 (_1!12682 (_ BitVec 64)) (_2!12682 B!2516)) )
))
(declare-datatypes ((List!36740 0))(
  ( (Nil!36737) (Cons!36736 (h!38183 tuple2!25342) (t!51648 List!36740)) )
))
(declare-fun l!750 () List!36740)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun e!874922 () Bool)

(declare-fun b!1569467 () Bool)

(declare-fun isStrictlySorted!1007 (List!36740) Bool)

(declare-fun insertStrictlySorted!593 (List!36740 (_ BitVec 64) B!2516) List!36740)

(assert (=> b!1569467 (= e!874922 (not (isStrictlySorted!1007 (insertStrictlySorted!593 l!750 key2!21 v2!10))))))

(declare-fun res!1072615 () Bool)

(assert (=> start!134414 (=> (not res!1072615) (not e!874922))))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> start!134414 (= res!1072615 (not (= key1!37 key2!21)))))

(assert (=> start!134414 e!874922))

(assert (=> start!134414 true))

(declare-fun e!874921 () Bool)

(assert (=> start!134414 e!874921))

(declare-fun tp_is_empty!39067 () Bool)

(assert (=> start!134414 tp_is_empty!39067))

(declare-fun b!1569466 () Bool)

(declare-fun res!1072617 () Bool)

(assert (=> b!1569466 (=> (not res!1072617) (not e!874922))))

(assert (=> b!1569466 (= res!1072617 (or (not (is-Cons!36736 l!750)) (bvsge (_1!12682 (h!38183 l!750)) key1!37) (bvsge (_1!12682 (h!38183 l!750)) key2!21)))))

(declare-fun b!1569465 () Bool)

(declare-fun res!1072616 () Bool)

(assert (=> b!1569465 (=> (not res!1072616) (not e!874922))))

(assert (=> b!1569465 (= res!1072616 (isStrictlySorted!1007 l!750))))

(declare-fun b!1569468 () Bool)

(declare-fun tp!114129 () Bool)

(assert (=> b!1569468 (= e!874921 (and tp_is_empty!39067 tp!114129))))

(assert (= (and start!134414 res!1072615) b!1569465))

(assert (= (and b!1569465 res!1072616) b!1569466))

(assert (= (and b!1569466 res!1072617) b!1569467))

(assert (= (and start!134414 (is-Cons!36736 l!750)) b!1569468))

(declare-fun m!1443799 () Bool)

(assert (=> b!1569467 m!1443799))

(assert (=> b!1569467 m!1443799))

(declare-fun m!1443801 () Bool)

(assert (=> b!1569467 m!1443801))

(declare-fun m!1443803 () Bool)

(assert (=> b!1569465 m!1443803))

(push 1)

(assert (not b!1569465))

(assert (not b!1569467))

(assert (not b!1569468))

(assert tp_is_empty!39067)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163899 () Bool)

(declare-fun res!1072650 () Bool)

(declare-fun e!874949 () Bool)

(assert (=> d!163899 (=> res!1072650 e!874949)))

(assert (=> d!163899 (= res!1072650 (or (is-Nil!36737 l!750) (is-Nil!36737 (t!51648 l!750))))))

(assert (=> d!163899 (= (isStrictlySorted!1007 l!750) e!874949)))

(declare-fun b!1569507 () Bool)

(declare-fun e!874950 () Bool)

(assert (=> b!1569507 (= e!874949 e!874950)))

(declare-fun res!1072651 () Bool)

(assert (=> b!1569507 (=> (not res!1072651) (not e!874950))))

(assert (=> b!1569507 (= res!1072651 (bvslt (_1!12682 (h!38183 l!750)) (_1!12682 (h!38183 (t!51648 l!750)))))))

(declare-fun b!1569508 () Bool)

(assert (=> b!1569508 (= e!874950 (isStrictlySorted!1007 (t!51648 l!750)))))

(assert (= (and d!163899 (not res!1072650)) b!1569507))

(assert (= (and b!1569507 res!1072651) b!1569508))

(declare-fun m!1443821 () Bool)

(assert (=> b!1569508 m!1443821))

(assert (=> b!1569465 d!163899))

(declare-fun d!163907 () Bool)

(declare-fun res!1072654 () Bool)

(declare-fun e!874953 () Bool)

(assert (=> d!163907 (=> res!1072654 e!874953)))

(assert (=> d!163907 (= res!1072654 (or (is-Nil!36737 (insertStrictlySorted!593 l!750 key2!21 v2!10)) (is-Nil!36737 (t!51648 (insertStrictlySorted!593 l!750 key2!21 v2!10)))))))

(assert (=> d!163907 (= (isStrictlySorted!1007 (insertStrictlySorted!593 l!750 key2!21 v2!10)) e!874953)))

(declare-fun b!1569511 () Bool)

(declare-fun e!874954 () Bool)

(assert (=> b!1569511 (= e!874953 e!874954)))

(declare-fun res!1072655 () Bool)

(assert (=> b!1569511 (=> (not res!1072655) (not e!874954))))

(assert (=> b!1569511 (= res!1072655 (bvslt (_1!12682 (h!38183 (insertStrictlySorted!593 l!750 key2!21 v2!10))) (_1!12682 (h!38183 (t!51648 (insertStrictlySorted!593 l!750 key2!21 v2!10))))))))

(declare-fun b!1569512 () Bool)

(assert (=> b!1569512 (= e!874954 (isStrictlySorted!1007 (t!51648 (insertStrictlySorted!593 l!750 key2!21 v2!10))))))

(assert (= (and d!163907 (not res!1072654)) b!1569511))

(assert (= (and b!1569511 res!1072655) b!1569512))

(declare-fun m!1443823 () Bool)

(assert (=> b!1569512 m!1443823))

(assert (=> b!1569467 d!163907))

(declare-fun b!1569591 () Bool)

(declare-fun e!874999 () List!36740)

(declare-fun call!72114 () List!36740)

(assert (=> b!1569591 (= e!874999 call!72114)))

(declare-fun c!144770 () Bool)

(declare-fun c!144767 () Bool)

(declare-fun b!1569592 () Bool)

(declare-fun e!874997 () List!36740)

(assert (=> b!1569592 (= e!874997 (ite c!144770 (t!51648 l!750) (ite c!144767 (Cons!36736 (h!38183 l!750) (t!51648 l!750)) Nil!36737)))))

(declare-fun lt!673314 () List!36740)

(declare-fun e!874998 () Bool)

(declare-fun b!1569593 () Bool)

(declare-fun contains!10424 (List!36740 tuple2!25342) Bool)

(assert (=> b!1569593 (= e!874998 (contains!10424 lt!673314 (tuple2!25343 key2!21 v2!10)))))

(declare-fun bm!72111 () Bool)

(declare-fun call!72116 () List!36740)

(assert (=> bm!72111 (= call!72114 call!72116)))

(declare-fun c!144769 () Bool)

(declare-fun call!72115 () List!36740)

(declare-fun bm!72112 () Bool)

(declare-fun $colon$colon!996 (List!36740 tuple2!25342) List!36740)

(assert (=> bm!72112 (= call!72115 ($colon$colon!996 e!874997 (ite c!144769 (h!38183 l!750) (tuple2!25343 key2!21 v2!10))))))

(declare-fun c!144768 () Bool)

(assert (=> bm!72112 (= c!144768 c!144769)))

(declare-fun b!1569594 () Bool)

(declare-fun e!875000 () List!36740)

(declare-fun e!874996 () List!36740)

(assert (=> b!1569594 (= e!875000 e!874996)))

(assert (=> b!1569594 (= c!144770 (and (is-Cons!36736 l!750) (= (_1!12682 (h!38183 l!750)) key2!21)))))

(declare-fun b!1569595 () Bool)

(declare-fun res!1072674 () Bool)

(assert (=> b!1569595 (=> (not res!1072674) (not e!874998))))

(declare-fun containsKey!867 (List!36740 (_ BitVec 64)) Bool)

(assert (=> b!1569595 (= res!1072674 (containsKey!867 lt!673314 key2!21))))

(declare-fun b!1569596 () Bool)

(assert (=> b!1569596 (= c!144767 (and (is-Cons!36736 l!750) (bvsgt (_1!12682 (h!38183 l!750)) key2!21)))))

(assert (=> b!1569596 (= e!874996 e!874999)))

(declare-fun b!1569597 () Bool)

(assert (=> b!1569597 (= e!874997 (insertStrictlySorted!593 (t!51648 l!750) key2!21 v2!10))))

(declare-fun b!1569598 () Bool)

(assert (=> b!1569598 (= e!875000 call!72115)))

(declare-fun bm!72113 () Bool)

(assert (=> bm!72113 (= call!72116 call!72115)))

(declare-fun d!163909 () Bool)

(assert (=> d!163909 e!874998))

(declare-fun res!1072675 () Bool)

(assert (=> d!163909 (=> (not res!1072675) (not e!874998))))

(assert (=> d!163909 (= res!1072675 (isStrictlySorted!1007 lt!673314))))

(assert (=> d!163909 (= lt!673314 e!875000)))

(assert (=> d!163909 (= c!144769 (and (is-Cons!36736 l!750) (bvslt (_1!12682 (h!38183 l!750)) key2!21)))))

(assert (=> d!163909 (isStrictlySorted!1007 l!750)))

(assert (=> d!163909 (= (insertStrictlySorted!593 l!750 key2!21 v2!10) lt!673314)))

(declare-fun b!1569599 () Bool)

(assert (=> b!1569599 (= e!874996 call!72116)))

(declare-fun b!1569600 () Bool)

(assert (=> b!1569600 (= e!874999 call!72114)))

(assert (= (and d!163909 c!144769) b!1569598))

(assert (= (and d!163909 (not c!144769)) b!1569594))

(assert (= (and b!1569594 c!144770) b!1569599))

(assert (= (and b!1569594 (not c!144770)) b!1569596))

(assert (= (and b!1569596 c!144767) b!1569591))

(assert (= (and b!1569596 (not c!144767)) b!1569600))

(assert (= (or b!1569591 b!1569600) bm!72111))

(assert (= (or b!1569599 bm!72111) bm!72113))

(assert (= (or b!1569598 bm!72113) bm!72112))

(assert (= (and bm!72112 c!144768) b!1569597))

(assert (= (and bm!72112 (not c!144768)) b!1569592))

(assert (= (and d!163909 res!1072675) b!1569595))

(assert (= (and b!1569595 res!1072674) b!1569593))

(declare-fun m!1443839 () Bool)

(assert (=> b!1569595 m!1443839))

(declare-fun m!1443841 () Bool)

(assert (=> d!163909 m!1443841))

(assert (=> d!163909 m!1443803))

(declare-fun m!1443843 () Bool)

(assert (=> b!1569593 m!1443843))

(declare-fun m!1443845 () Bool)

(assert (=> b!1569597 m!1443845))

(declare-fun m!1443847 () Bool)

(assert (=> bm!72112 m!1443847))

(assert (=> b!1569467 d!163909))

(declare-fun b!1569616 () Bool)

(declare-fun e!875009 () Bool)

(declare-fun tp!114141 () Bool)

(assert (=> b!1569616 (= e!875009 (and tp_is_empty!39067 tp!114141))))

(assert (=> b!1569468 (= tp!114129 e!875009)))

(assert (= (and b!1569468 (is-Cons!36736 (t!51648 l!750))) b!1569616))

(push 1)

(assert (not b!1569508))

(assert (not d!163909))

(assert (not b!1569593))

(assert (not b!1569595))

(assert (not b!1569597))

(assert (not b!1569616))

(assert tp_is_empty!39067)

(assert (not b!1569512))

(assert (not bm!72112))

(check-sat)

(pop 1)

