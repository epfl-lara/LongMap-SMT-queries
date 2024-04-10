; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137064 () Bool)

(assert start!137064)

(declare-fun b!1579934 () Bool)

(declare-fun res!1079277 () Bool)

(declare-fun e!881373 () Bool)

(assert (=> b!1579934 (=> (not res!1079277) (not e!881373))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2616 0))(
  ( (B!2617 (val!19670 Int)) )
))
(declare-datatypes ((tuple2!25446 0))(
  ( (tuple2!25447 (_1!12734 (_ BitVec 64)) (_2!12734 B!2616)) )
))
(declare-datatypes ((List!36790 0))(
  ( (Nil!36787) (Cons!36786 (h!38329 tuple2!25446) (t!51704 List!36790)) )
))
(declare-fun l!1390 () List!36790)

(declare-fun value!194 () B!2616)

(declare-fun contains!10462 (List!36790 tuple2!25446) Bool)

(assert (=> b!1579934 (= res!1079277 (contains!10462 l!1390 (tuple2!25447 key!405 value!194)))))

(declare-fun b!1579935 () Bool)

(declare-fun res!1079276 () Bool)

(assert (=> b!1579935 (=> (not res!1079276) (not e!881373))))

(declare-fun containsKey!894 (List!36790 (_ BitVec 64)) Bool)

(assert (=> b!1579935 (= res!1079276 (containsKey!894 l!1390 key!405))))

(declare-fun b!1579936 () Bool)

(declare-fun e!881374 () Bool)

(declare-datatypes ((tuple2!25448 0))(
  ( (tuple2!25449 (_1!12735 tuple2!25446) (_2!12735 List!36790)) )
))
(declare-datatypes ((Option!889 0))(
  ( (Some!888 (v!22383 tuple2!25448)) (None!887) )
))
(declare-fun lt!676648 () Option!889)

(declare-fun isDefined!599 (Option!889) Bool)

(assert (=> b!1579936 (= e!881374 (not (isDefined!599 lt!676648)))))

(declare-fun b!1579937 () Bool)

(declare-fun e!881375 () Bool)

(declare-fun tp_is_empty!39161 () Bool)

(declare-fun tp!114393 () Bool)

(assert (=> b!1579937 (= e!881375 (and tp_is_empty!39161 tp!114393))))

(declare-fun res!1079274 () Bool)

(assert (=> start!137064 (=> (not res!1079274) (not e!881373))))

(declare-fun isStrictlySorted!1048 (List!36790) Bool)

(assert (=> start!137064 (= res!1079274 (isStrictlySorted!1048 l!1390))))

(assert (=> start!137064 e!881373))

(assert (=> start!137064 e!881375))

(assert (=> start!137064 true))

(assert (=> start!137064 tp_is_empty!39161))

(declare-fun b!1579938 () Bool)

(assert (=> b!1579938 (= e!881373 e!881374)))

(declare-fun res!1079275 () Bool)

(assert (=> b!1579938 (=> (not res!1079275) (not e!881374))))

(declare-fun isEmpty!1156 (Option!889) Bool)

(assert (=> b!1579938 (= res!1079275 (not (isEmpty!1156 lt!676648)))))

(declare-fun unapply!72 (List!36790) Option!889)

(assert (=> b!1579938 (= lt!676648 (unapply!72 l!1390))))

(assert (= (and start!137064 res!1079274) b!1579935))

(assert (= (and b!1579935 res!1079276) b!1579934))

(assert (= (and b!1579934 res!1079277) b!1579938))

(assert (= (and b!1579938 res!1079275) b!1579936))

(assert (= (and start!137064 (is-Cons!36786 l!1390)) b!1579937))

(declare-fun m!1451539 () Bool)

(assert (=> b!1579935 m!1451539))

(declare-fun m!1451541 () Bool)

(assert (=> b!1579938 m!1451541))

(declare-fun m!1451543 () Bool)

(assert (=> b!1579938 m!1451543))

(declare-fun m!1451545 () Bool)

(assert (=> b!1579936 m!1451545))

(declare-fun m!1451547 () Bool)

(assert (=> start!137064 m!1451547))

(declare-fun m!1451549 () Bool)

(assert (=> b!1579934 m!1451549))

(push 1)

(assert (not b!1579937))

(assert (not b!1579934))

(assert (not b!1579936))

(assert (not b!1579935))

(assert (not start!137064))

(assert tp_is_empty!39161)

(assert (not b!1579938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!676654 () Bool)

(declare-fun d!166361 () Bool)

(declare-fun content!829 (List!36790) (Set tuple2!25446))

(assert (=> d!166361 (= lt!676654 (member (tuple2!25447 key!405 value!194) (content!829 l!1390)))))

(declare-fun e!881392 () Bool)

(assert (=> d!166361 (= lt!676654 e!881392)))

(declare-fun res!1079294 () Bool)

(assert (=> d!166361 (=> (not res!1079294) (not e!881392))))

(assert (=> d!166361 (= res!1079294 (is-Cons!36786 l!1390))))

(assert (=> d!166361 (= (contains!10462 l!1390 (tuple2!25447 key!405 value!194)) lt!676654)))

(declare-fun b!1579955 () Bool)

(declare-fun e!881393 () Bool)

(assert (=> b!1579955 (= e!881392 e!881393)))

(declare-fun res!1079295 () Bool)

(assert (=> b!1579955 (=> res!1079295 e!881393)))

(assert (=> b!1579955 (= res!1079295 (= (h!38329 l!1390) (tuple2!25447 key!405 value!194)))))

(declare-fun b!1579956 () Bool)

(assert (=> b!1579956 (= e!881393 (contains!10462 (t!51704 l!1390) (tuple2!25447 key!405 value!194)))))

(assert (= (and d!166361 res!1079294) b!1579955))

(assert (= (and b!1579955 (not res!1079295)) b!1579956))

(declare-fun m!1451559 () Bool)

(assert (=> d!166361 m!1451559))

(declare-fun m!1451561 () Bool)

(assert (=> d!166361 m!1451561))

(declare-fun m!1451563 () Bool)

(assert (=> b!1579956 m!1451563))

(assert (=> b!1579934 d!166361))

(declare-fun d!166367 () Bool)

(declare-fun res!1079312 () Bool)

(declare-fun e!881410 () Bool)

(assert (=> d!166367 (=> res!1079312 e!881410)))

(assert (=> d!166367 (= res!1079312 (and (is-Cons!36786 l!1390) (= (_1!12734 (h!38329 l!1390)) key!405)))))

(assert (=> d!166367 (= (containsKey!894 l!1390 key!405) e!881410)))

(declare-fun b!1579973 () Bool)

(declare-fun e!881411 () Bool)

(assert (=> b!1579973 (= e!881410 e!881411)))

(declare-fun res!1079313 () Bool)

(assert (=> b!1579973 (=> (not res!1079313) (not e!881411))))

(assert (=> b!1579973 (= res!1079313 (and (or (not (is-Cons!36786 l!1390)) (bvsle (_1!12734 (h!38329 l!1390)) key!405)) (is-Cons!36786 l!1390) (bvslt (_1!12734 (h!38329 l!1390)) key!405)))))

(declare-fun b!1579974 () Bool)

(assert (=> b!1579974 (= e!881411 (containsKey!894 (t!51704 l!1390) key!405))))

(assert (= (and d!166367 (not res!1079312)) b!1579973))

(assert (= (and b!1579973 res!1079313) b!1579974))

(declare-fun m!1451569 () Bool)

(assert (=> b!1579974 m!1451569))

(assert (=> b!1579935 d!166367))

(declare-fun d!166379 () Bool)

(declare-fun res!1079324 () Bool)

(declare-fun e!881422 () Bool)

(assert (=> d!166379 (=> res!1079324 e!881422)))

(assert (=> d!166379 (= res!1079324 (or (is-Nil!36787 l!1390) (is-Nil!36787 (t!51704 l!1390))))))

(assert (=> d!166379 (= (isStrictlySorted!1048 l!1390) e!881422)))

(declare-fun b!1579985 () Bool)

(declare-fun e!881423 () Bool)

(assert (=> b!1579985 (= e!881422 e!881423)))

(declare-fun res!1079325 () Bool)

(assert (=> b!1579985 (=> (not res!1079325) (not e!881423))))

(assert (=> b!1579985 (= res!1079325 (bvslt (_1!12734 (h!38329 l!1390)) (_1!12734 (h!38329 (t!51704 l!1390)))))))

(declare-fun b!1579986 () Bool)

(assert (=> b!1579986 (= e!881423 (isStrictlySorted!1048 (t!51704 l!1390)))))

(assert (= (and d!166379 (not res!1079324)) b!1579985))

(assert (= (and b!1579985 res!1079325) b!1579986))

(declare-fun m!1451573 () Bool)

(assert (=> b!1579986 m!1451573))

