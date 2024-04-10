; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7304 () Bool)

(assert start!7304)

(declare-fun res!27368 () Bool)

(declare-fun e!29941 () Bool)

(assert (=> start!7304 (=> (not res!27368) (not e!29941))))

(declare-datatypes ((B!900 0))(
  ( (B!901 (val!1037 Int)) )
))
(declare-datatypes ((tuple2!1722 0))(
  ( (tuple2!1723 (_1!872 (_ BitVec 64)) (_2!872 B!900)) )
))
(declare-datatypes ((List!1255 0))(
  ( (Nil!1252) (Cons!1251 (h!1831 tuple2!1722) (t!4283 List!1255)) )
))
(declare-fun l!812 () List!1255)

(declare-fun isStrictlySorted!246 (List!1255) Bool)

(assert (=> start!7304 (= res!27368 (isStrictlySorted!246 l!812))))

(assert (=> start!7304 e!29941))

(declare-fun e!29942 () Bool)

(assert (=> start!7304 e!29942))

(assert (=> start!7304 true))

(declare-fun b!46900 () Bool)

(declare-fun res!27369 () Bool)

(assert (=> b!46900 (=> (not res!27369) (not e!29941))))

(assert (=> b!46900 (= res!27369 (not (is-Cons!1251 l!812)))))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46901 () Bool)

(declare-fun removeStrictlySorted!47 (List!1255 (_ BitVec 64)) List!1255)

(assert (=> b!46901 (= e!29941 (not (= (removeStrictlySorted!47 (removeStrictlySorted!47 l!812 key1!43) key2!27) (removeStrictlySorted!47 (removeStrictlySorted!47 l!812 key2!27) key1!43))))))

(declare-fun b!46902 () Bool)

(declare-fun tp_is_empty!1997 () Bool)

(declare-fun tp!6164 () Bool)

(assert (=> b!46902 (= e!29942 (and tp_is_empty!1997 tp!6164))))

(assert (= (and start!7304 res!27368) b!46900))

(assert (= (and b!46900 res!27369) b!46901))

(assert (= (and start!7304 (is-Cons!1251 l!812)) b!46902))

(declare-fun m!41285 () Bool)

(assert (=> start!7304 m!41285))

(declare-fun m!41287 () Bool)

(assert (=> b!46901 m!41287))

(assert (=> b!46901 m!41287))

(declare-fun m!41289 () Bool)

(assert (=> b!46901 m!41289))

(declare-fun m!41291 () Bool)

(assert (=> b!46901 m!41291))

(assert (=> b!46901 m!41291))

(declare-fun m!41293 () Bool)

(assert (=> b!46901 m!41293))

(push 1)

(assert (not start!7304))

(assert (not b!46901))

(assert (not b!46902))

(assert tp_is_empty!1997)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9377 () Bool)

(declare-fun res!27374 () Bool)

(declare-fun e!29951 () Bool)

(assert (=> d!9377 (=> res!27374 e!29951)))

(assert (=> d!9377 (= res!27374 (or (is-Nil!1252 l!812) (is-Nil!1252 (t!4283 l!812))))))

(assert (=> d!9377 (= (isStrictlySorted!246 l!812) e!29951)))

(declare-fun b!46915 () Bool)

(declare-fun e!29952 () Bool)

(assert (=> b!46915 (= e!29951 e!29952)))

(declare-fun res!27375 () Bool)

(assert (=> b!46915 (=> (not res!27375) (not e!29952))))

(assert (=> b!46915 (= res!27375 (bvslt (_1!872 (h!1831 l!812)) (_1!872 (h!1831 (t!4283 l!812)))))))

(declare-fun b!46916 () Bool)

(assert (=> b!46916 (= e!29952 (isStrictlySorted!246 (t!4283 l!812)))))

(assert (= (and d!9377 (not res!27374)) b!46915))

(assert (= (and b!46915 res!27375) b!46916))

(declare-fun m!41295 () Bool)

(assert (=> b!46916 m!41295))

(assert (=> start!7304 d!9377))

(declare-fun d!9379 () Bool)

(declare-fun e!30000 () Bool)

(assert (=> d!9379 e!30000))

(declare-fun res!27396 () Bool)

(assert (=> d!9379 (=> (not res!27396) (not e!30000))))

(declare-fun lt!20377 () List!1255)

(assert (=> d!9379 (= res!27396 (isStrictlySorted!246 lt!20377))))

(declare-fun e!30001 () List!1255)

(assert (=> d!9379 (= lt!20377 e!30001)))

(declare-fun c!6390 () Bool)

(assert (=> d!9379 (= c!6390 (and (is-Cons!1251 (removeStrictlySorted!47 l!812 key1!43)) (= (_1!872 (h!1831 (removeStrictlySorted!47 l!812 key1!43))) key2!27)))))

(assert (=> d!9379 (isStrictlySorted!246 (removeStrictlySorted!47 l!812 key1!43))))

(assert (=> d!9379 (= (removeStrictlySorted!47 (removeStrictlySorted!47 l!812 key1!43) key2!27) lt!20377)))

(declare-fun b!46989 () Bool)

(declare-fun e!29999 () List!1255)

(declare-fun $colon$colon!49 (List!1255 tuple2!1722) List!1255)

(assert (=> b!46989 (= e!29999 ($colon$colon!49 (removeStrictlySorted!47 (t!4283 (removeStrictlySorted!47 l!812 key1!43)) key2!27) (h!1831 (removeStrictlySorted!47 l!812 key1!43))))))

(declare-fun b!46990 () Bool)

(declare-fun containsKey!95 (List!1255 (_ BitVec 64)) Bool)

(assert (=> b!46990 (= e!30000 (not (containsKey!95 lt!20377 key2!27)))))

(declare-fun b!46991 () Bool)

(assert (=> b!46991 (= e!29999 Nil!1252)))

(declare-fun b!46992 () Bool)

(assert (=> b!46992 (= e!30001 e!29999)))

(declare-fun c!6389 () Bool)

(assert (=> b!46992 (= c!6389 (and (is-Cons!1251 (removeStrictlySorted!47 l!812 key1!43)) (not (= (_1!872 (h!1831 (removeStrictlySorted!47 l!812 key1!43))) key2!27))))))

(declare-fun b!46993 () Bool)

(assert (=> b!46993 (= e!30001 (t!4283 (removeStrictlySorted!47 l!812 key1!43)))))

(assert (= (and d!9379 c!6390) b!46993))

(assert (= (and d!9379 (not c!6390)) b!46992))

(assert (= (and b!46992 c!6389) b!46989))

(assert (= (and b!46992 (not c!6389)) b!46991))

(assert (= (and d!9379 res!27396) b!46990))

(declare-fun m!41371 () Bool)

(assert (=> d!9379 m!41371))

(assert (=> d!9379 m!41287))

(declare-fun m!41373 () Bool)

(assert (=> d!9379 m!41373))

(declare-fun m!41375 () Bool)

(assert (=> b!46989 m!41375))

(assert (=> b!46989 m!41375))

(declare-fun m!41377 () Bool)

(assert (=> b!46989 m!41377))

(declare-fun m!41379 () Bool)

(assert (=> b!46990 m!41379))

(assert (=> b!46901 d!9379))

(declare-fun d!9397 () Bool)

(declare-fun e!30004 () Bool)

(assert (=> d!9397 e!30004))

(declare-fun res!27397 () Bool)

(assert (=> d!9397 (=> (not res!27397) (not e!30004))))

(declare-fun lt!20378 () List!1255)

(assert (=> d!9397 (= res!27397 (isStrictlySorted!246 lt!20378))))

(declare-fun e!30005 () List!1255)

(assert (=> d!9397 (= lt!20378 e!30005)))

(declare-fun c!6392 () Bool)

(assert (=> d!9397 (= c!6392 (and (is-Cons!1251 l!812) (= (_1!872 (h!1831 l!812)) key1!43)))))

(assert (=> d!9397 (isStrictlySorted!246 l!812)))

(assert (=> d!9397 (= (removeStrictlySorted!47 l!812 key1!43) lt!20378)))

(declare-fun b!46995 () Bool)

(declare-fun e!30003 () List!1255)

(assert (=> b!46995 (= e!30003 ($colon$colon!49 (removeStrictlySorted!47 (t!4283 l!812) key1!43) (h!1831 l!812)))))

(declare-fun b!46996 () Bool)

(assert (=> b!46996 (= e!30004 (not (containsKey!95 lt!20378 key1!43)))))

(declare-fun b!46997 () Bool)

(assert (=> b!46997 (= e!30003 Nil!1252)))

(declare-fun b!46998 () Bool)

(assert (=> b!46998 (= e!30005 e!30003)))

(declare-fun c!6391 () Bool)

(assert (=> b!46998 (= c!6391 (and (is-Cons!1251 l!812) (not (= (_1!872 (h!1831 l!812)) key1!43))))))

(declare-fun b!46999 () Bool)

(assert (=> b!46999 (= e!30005 (t!4283 l!812))))

(assert (= (and d!9397 c!6392) b!46999))

(assert (= (and d!9397 (not c!6392)) b!46998))

(assert (= (and b!46998 c!6391) b!46995))

(assert (= (and b!46998 (not c!6391)) b!46997))

(assert (= (and d!9397 res!27397) b!46996))

(declare-fun m!41381 () Bool)

(assert (=> d!9397 m!41381))

(assert (=> d!9397 m!41285))

(declare-fun m!41383 () Bool)

(assert (=> b!46995 m!41383))

(assert (=> b!46995 m!41383))

(declare-fun m!41385 () Bool)

(assert (=> b!46995 m!41385))

(declare-fun m!41387 () Bool)

(assert (=> b!46996 m!41387))

(assert (=> b!46901 d!9397))

(declare-fun d!9399 () Bool)

(declare-fun e!30007 () Bool)

(assert (=> d!9399 e!30007))

(declare-fun res!27398 () Bool)

(assert (=> d!9399 (=> (not res!27398) (not e!30007))))

(declare-fun lt!20379 () List!1255)

(assert (=> d!9399 (= res!27398 (isStrictlySorted!246 lt!20379))))

(declare-fun e!30008 () List!1255)

(assert (=> d!9399 (= lt!20379 e!30008)))

(declare-fun c!6394 () Bool)

(assert (=> d!9399 (= c!6394 (and (is-Cons!1251 (removeStrictlySorted!47 l!812 key2!27)) (= (_1!872 (h!1831 (removeStrictlySorted!47 l!812 key2!27))) key1!43)))))

(assert (=> d!9399 (isStrictlySorted!246 (removeStrictlySorted!47 l!812 key2!27))))

(assert (=> d!9399 (= (removeStrictlySorted!47 (removeStrictlySorted!47 l!812 key2!27) key1!43) lt!20379)))

(declare-fun b!47000 () Bool)

(declare-fun e!30006 () List!1255)

(assert (=> b!47000 (= e!30006 ($colon$colon!49 (removeStrictlySorted!47 (t!4283 (removeStrictlySorted!47 l!812 key2!27)) key1!43) (h!1831 (removeStrictlySorted!47 l!812 key2!27))))))

(declare-fun b!47001 () Bool)

(assert (=> b!47001 (= e!30007 (not (containsKey!95 lt!20379 key1!43)))))

(declare-fun b!47002 () Bool)

(assert (=> b!47002 (= e!30006 Nil!1252)))

(declare-fun b!47003 () Bool)

(assert (=> b!47003 (= e!30008 e!30006)))

(declare-fun c!6393 () Bool)

(assert (=> b!47003 (= c!6393 (and (is-Cons!1251 (removeStrictlySorted!47 l!812 key2!27)) (not (= (_1!872 (h!1831 (removeStrictlySorted!47 l!812 key2!27))) key1!43))))))

(declare-fun b!47004 () Bool)

(assert (=> b!47004 (= e!30008 (t!4283 (removeStrictlySorted!47 l!812 key2!27)))))

(assert (= (and d!9399 c!6394) b!47004))

(assert (= (and d!9399 (not c!6394)) b!47003))

(assert (= (and b!47003 c!6393) b!47000))

(assert (= (and b!47003 (not c!6393)) b!47002))

(assert (= (and d!9399 res!27398) b!47001))

(declare-fun m!41389 () Bool)

(assert (=> d!9399 m!41389))

(assert (=> d!9399 m!41291))

(declare-fun m!41391 () Bool)

(assert (=> d!9399 m!41391))

(declare-fun m!41393 () Bool)

(assert (=> b!47000 m!41393))

(assert (=> b!47000 m!41393))

(declare-fun m!41395 () Bool)

(assert (=> b!47000 m!41395))

(declare-fun m!41397 () Bool)

(assert (=> b!47001 m!41397))

(assert (=> b!46901 d!9399))

(declare-fun d!9401 () Bool)

(declare-fun e!30014 () Bool)

(assert (=> d!9401 e!30014))

(declare-fun res!27403 () Bool)

(assert (=> d!9401 (=> (not res!27403) (not e!30014))))

(declare-fun lt!20380 () List!1255)

