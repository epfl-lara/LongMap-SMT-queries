; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7174 () Bool)

(assert start!7174)

(declare-fun res!26873 () Bool)

(declare-fun e!29223 () Bool)

(assert (=> start!7174 (=> (not res!26873) (not e!29223))))

(declare-datatypes ((B!854 0))(
  ( (B!855 (val!1014 Int)) )
))
(declare-datatypes ((tuple2!1658 0))(
  ( (tuple2!1659 (_1!840 (_ BitVec 64)) (_2!840 B!854)) )
))
(declare-datatypes ((List!1218 0))(
  ( (Nil!1215) (Cons!1214 (h!1794 tuple2!1658) (t!4243 List!1218)) )
))
(declare-fun l!812 () List!1218)

(declare-fun isStrictlySorted!214 (List!1218) Bool)

(assert (=> start!7174 (= res!26873 (isStrictlySorted!214 l!812))))

(assert (=> start!7174 e!29223))

(declare-fun e!29224 () Bool)

(assert (=> start!7174 e!29224))

(assert (=> start!7174 true))

(declare-fun b!45904 () Bool)

(declare-fun res!26872 () Bool)

(assert (=> b!45904 (=> (not res!26872) (not e!29223))))

(get-info :version)

(assert (=> b!45904 (= res!26872 (not ((_ is Cons!1214) l!812)))))

(declare-fun b!45905 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!35 (List!1218 (_ BitVec 64)) List!1218)

(assert (=> b!45905 (= e!29223 (not (isStrictlySorted!214 (removeStrictlySorted!35 l!812 key1!43))))))

(declare-fun b!45906 () Bool)

(declare-fun tp_is_empty!1951 () Bool)

(declare-fun tp!6038 () Bool)

(assert (=> b!45906 (= e!29224 (and tp_is_empty!1951 tp!6038))))

(assert (= (and start!7174 res!26873) b!45904))

(assert (= (and b!45904 res!26872) b!45905))

(assert (= (and start!7174 ((_ is Cons!1214) l!812)) b!45906))

(declare-fun m!40403 () Bool)

(assert (=> start!7174 m!40403))

(declare-fun m!40405 () Bool)

(assert (=> b!45905 m!40405))

(assert (=> b!45905 m!40405))

(declare-fun m!40407 () Bool)

(assert (=> b!45905 m!40407))

(check-sat (not start!7174) (not b!45905) (not b!45906) tp_is_empty!1951)
(check-sat)
(get-model)

(declare-fun d!8983 () Bool)

(declare-fun res!26898 () Bool)

(declare-fun e!29249 () Bool)

(assert (=> d!8983 (=> res!26898 e!29249)))

(assert (=> d!8983 (= res!26898 (or ((_ is Nil!1215) l!812) ((_ is Nil!1215) (t!4243 l!812))))))

(assert (=> d!8983 (= (isStrictlySorted!214 l!812) e!29249)))

(declare-fun b!45937 () Bool)

(declare-fun e!29251 () Bool)

(assert (=> b!45937 (= e!29249 e!29251)))

(declare-fun res!26900 () Bool)

(assert (=> b!45937 (=> (not res!26900) (not e!29251))))

(assert (=> b!45937 (= res!26900 (bvslt (_1!840 (h!1794 l!812)) (_1!840 (h!1794 (t!4243 l!812)))))))

(declare-fun b!45938 () Bool)

(assert (=> b!45938 (= e!29251 (isStrictlySorted!214 (t!4243 l!812)))))

(assert (= (and d!8983 (not res!26898)) b!45937))

(assert (= (and b!45937 res!26900) b!45938))

(declare-fun m!40423 () Bool)

(assert (=> b!45938 m!40423))

(assert (=> start!7174 d!8983))

(declare-fun d!8988 () Bool)

(declare-fun res!26905 () Bool)

(declare-fun e!29256 () Bool)

(assert (=> d!8988 (=> res!26905 e!29256)))

(assert (=> d!8988 (= res!26905 (or ((_ is Nil!1215) (removeStrictlySorted!35 l!812 key1!43)) ((_ is Nil!1215) (t!4243 (removeStrictlySorted!35 l!812 key1!43)))))))

(assert (=> d!8988 (= (isStrictlySorted!214 (removeStrictlySorted!35 l!812 key1!43)) e!29256)))

(declare-fun b!45944 () Bool)

(declare-fun e!29259 () Bool)

(assert (=> b!45944 (= e!29256 e!29259)))

(declare-fun res!26907 () Bool)

(assert (=> b!45944 (=> (not res!26907) (not e!29259))))

(assert (=> b!45944 (= res!26907 (bvslt (_1!840 (h!1794 (removeStrictlySorted!35 l!812 key1!43))) (_1!840 (h!1794 (t!4243 (removeStrictlySorted!35 l!812 key1!43))))))))

(declare-fun b!45945 () Bool)

(assert (=> b!45945 (= e!29259 (isStrictlySorted!214 (t!4243 (removeStrictlySorted!35 l!812 key1!43))))))

(assert (= (and d!8988 (not res!26905)) b!45944))

(assert (= (and b!45944 res!26907) b!45945))

(declare-fun m!40427 () Bool)

(assert (=> b!45945 m!40427))

(assert (=> b!45905 d!8988))

(declare-fun b!45979 () Bool)

(declare-fun e!29280 () List!1218)

(assert (=> b!45979 (= e!29280 Nil!1215)))

(declare-fun b!45985 () Bool)

(declare-fun e!29282 () List!1218)

(assert (=> b!45985 (= e!29282 e!29280)))

(declare-fun c!6207 () Bool)

(assert (=> b!45985 (= c!6207 (and ((_ is Cons!1214) l!812) (not (= (_1!840 (h!1794 l!812)) key1!43))))))

(declare-fun b!45986 () Bool)

(declare-fun e!29285 () Bool)

(declare-fun lt!20221 () List!1218)

(declare-fun containsKey!84 (List!1218 (_ BitVec 64)) Bool)

(assert (=> b!45986 (= e!29285 (not (containsKey!84 lt!20221 key1!43)))))

(declare-fun b!45987 () Bool)

(assert (=> b!45987 (= e!29282 (t!4243 l!812))))

(declare-fun b!45988 () Bool)

(declare-fun $colon$colon!37 (List!1218 tuple2!1658) List!1218)

(assert (=> b!45988 (= e!29280 ($colon$colon!37 (removeStrictlySorted!35 (t!4243 l!812) key1!43) (h!1794 l!812)))))

(declare-fun d!8993 () Bool)

(assert (=> d!8993 e!29285))

(declare-fun res!26916 () Bool)

(assert (=> d!8993 (=> (not res!26916) (not e!29285))))

(assert (=> d!8993 (= res!26916 (isStrictlySorted!214 lt!20221))))

(assert (=> d!8993 (= lt!20221 e!29282)))

(declare-fun c!6204 () Bool)

(assert (=> d!8993 (= c!6204 (and ((_ is Cons!1214) l!812) (= (_1!840 (h!1794 l!812)) key1!43)))))

(assert (=> d!8993 (isStrictlySorted!214 l!812)))

(assert (=> d!8993 (= (removeStrictlySorted!35 l!812 key1!43) lt!20221)))

(assert (= (and d!8993 c!6204) b!45987))

(assert (= (and d!8993 (not c!6204)) b!45985))

(assert (= (and b!45985 c!6207) b!45988))

(assert (= (and b!45985 (not c!6207)) b!45979))

(assert (= (and d!8993 res!26916) b!45986))

(declare-fun m!40433 () Bool)

(assert (=> b!45986 m!40433))

(declare-fun m!40439 () Bool)

(assert (=> b!45988 m!40439))

(assert (=> b!45988 m!40439))

(declare-fun m!40445 () Bool)

(assert (=> b!45988 m!40445))

(declare-fun m!40451 () Bool)

(assert (=> d!8993 m!40451))

(assert (=> d!8993 m!40403))

(assert (=> b!45905 d!8993))

(declare-fun b!46007 () Bool)

(declare-fun e!29295 () Bool)

(declare-fun tp!6052 () Bool)

(assert (=> b!46007 (= e!29295 (and tp_is_empty!1951 tp!6052))))

(assert (=> b!45906 (= tp!6038 e!29295)))

(assert (= (and b!45906 ((_ is Cons!1214) (t!4243 l!812))) b!46007))

(check-sat tp_is_empty!1951 (not b!45938) (not d!8993) (not b!45988) (not b!46007) (not b!45986) (not b!45945))
(check-sat)
