; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138034 () Bool)

(assert start!138034)

(declare-fun b!1584234 () Bool)

(declare-fun e!884356 () Bool)

(declare-datatypes ((B!2912 0))(
  ( (B!2913 (val!19818 Int)) )
))
(declare-datatypes ((tuple2!25804 0))(
  ( (tuple2!25805 (_1!12913 (_ BitVec 64)) (_2!12913 B!2912)) )
))
(declare-datatypes ((List!36938 0))(
  ( (Nil!36935) (Cons!36934 (h!38477 tuple2!25804) (t!51852 List!36938)) )
))
(declare-fun l!1251 () List!36938)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!997 (List!36938 (_ BitVec 64)) Bool)

(assert (=> b!1584234 (= e!884356 (containsKey!997 (t!51852 l!1251) otherKey!56))))

(declare-fun b!1584235 () Bool)

(declare-fun e!884355 () Bool)

(declare-fun tp_is_empty!39445 () Bool)

(declare-fun tp!115084 () Bool)

(assert (=> b!1584235 (= e!884355 (and tp_is_empty!39445 tp!115084))))

(declare-fun b!1584236 () Bool)

(declare-fun res!1082083 () Bool)

(declare-fun e!884354 () Bool)

(assert (=> b!1584236 (=> (not res!1082083) (not e!884354))))

(assert (=> b!1584236 (= res!1082083 (not (containsKey!997 l!1251 otherKey!56)))))

(declare-fun b!1584238 () Bool)

(assert (=> b!1584238 (= e!884354 e!884356)))

(declare-fun res!1082082 () Bool)

(assert (=> b!1584238 (=> res!1082082 e!884356)))

(declare-fun isStrictlySorted!1163 (List!36938) Bool)

(assert (=> b!1584238 (= res!1082082 (not (isStrictlySorted!1163 (t!51852 l!1251))))))

(declare-fun res!1082084 () Bool)

(assert (=> start!138034 (=> (not res!1082084) (not e!884354))))

(assert (=> start!138034 (= res!1082084 (isStrictlySorted!1163 l!1251))))

(assert (=> start!138034 e!884354))

(assert (=> start!138034 e!884355))

(assert (=> start!138034 true))

(declare-fun b!1584237 () Bool)

(declare-fun res!1082081 () Bool)

(assert (=> b!1584237 (=> (not res!1082081) (not e!884354))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1584237 (= res!1082081 (and (not (= otherKey!56 newKey!123)) (is-Cons!36934 l!1251)))))

(assert (= (and start!138034 res!1082084) b!1584236))

(assert (= (and b!1584236 res!1082083) b!1584237))

(assert (= (and b!1584237 res!1082081) b!1584238))

(assert (= (and b!1584238 (not res!1082082)) b!1584234))

(assert (= (and start!138034 (is-Cons!36934 l!1251)) b!1584235))

(declare-fun m!1453649 () Bool)

(assert (=> b!1584234 m!1453649))

(declare-fun m!1453651 () Bool)

(assert (=> b!1584236 m!1453651))

(declare-fun m!1453653 () Bool)

(assert (=> b!1584238 m!1453653))

(declare-fun m!1453655 () Bool)

(assert (=> start!138034 m!1453655))

(push 1)

(assert (not b!1584235))

(assert (not b!1584234))

(assert tp_is_empty!39445)

(assert (not b!1584236))

(assert (not start!138034))

(assert (not b!1584238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167379 () Bool)

(declare-fun res!1082127 () Bool)

(declare-fun e!884393 () Bool)

(assert (=> d!167379 (=> res!1082127 e!884393)))

(assert (=> d!167379 (= res!1082127 (or (is-Nil!36935 l!1251) (is-Nil!36935 (t!51852 l!1251))))))

(assert (=> d!167379 (= (isStrictlySorted!1163 l!1251) e!884393)))

(declare-fun b!1584287 () Bool)

(declare-fun e!884394 () Bool)

(assert (=> b!1584287 (= e!884393 e!884394)))

(declare-fun res!1082128 () Bool)

(assert (=> b!1584287 (=> (not res!1082128) (not e!884394))))

(assert (=> b!1584287 (= res!1082128 (bvslt (_1!12913 (h!38477 l!1251)) (_1!12913 (h!38477 (t!51852 l!1251)))))))

(declare-fun b!1584288 () Bool)

(assert (=> b!1584288 (= e!884394 (isStrictlySorted!1163 (t!51852 l!1251)))))

(assert (= (and d!167379 (not res!1082127)) b!1584287))

(assert (= (and b!1584287 res!1082128) b!1584288))

(assert (=> b!1584288 m!1453653))

(assert (=> start!138034 d!167379))

(declare-fun d!167387 () Bool)

(declare-fun res!1082151 () Bool)

(declare-fun e!884421 () Bool)

(assert (=> d!167387 (=> res!1082151 e!884421)))

(assert (=> d!167387 (= res!1082151 (and (is-Cons!36934 (t!51852 l!1251)) (= (_1!12913 (h!38477 (t!51852 l!1251))) otherKey!56)))))

(assert (=> d!167387 (= (containsKey!997 (t!51852 l!1251) otherKey!56) e!884421)))

(declare-fun b!1584319 () Bool)

(declare-fun e!884422 () Bool)

(assert (=> b!1584319 (= e!884421 e!884422)))

(declare-fun res!1082152 () Bool)

(assert (=> b!1584319 (=> (not res!1082152) (not e!884422))))

(assert (=> b!1584319 (= res!1082152 (and (or (not (is-Cons!36934 (t!51852 l!1251))) (bvsle (_1!12913 (h!38477 (t!51852 l!1251))) otherKey!56)) (is-Cons!36934 (t!51852 l!1251)) (bvslt (_1!12913 (h!38477 (t!51852 l!1251))) otherKey!56)))))

(declare-fun b!1584320 () Bool)

(assert (=> b!1584320 (= e!884422 (containsKey!997 (t!51852 (t!51852 l!1251)) otherKey!56))))

(assert (= (and d!167387 (not res!1082151)) b!1584319))

(assert (= (and b!1584319 res!1082152) b!1584320))

(declare-fun m!1453681 () Bool)

(assert (=> b!1584320 m!1453681))

(assert (=> b!1584234 d!167387))

(declare-fun d!167395 () Bool)

(declare-fun res!1082153 () Bool)

(declare-fun e!884425 () Bool)

(assert (=> d!167395 (=> res!1082153 e!884425)))

(assert (=> d!167395 (= res!1082153 (and (is-Cons!36934 l!1251) (= (_1!12913 (h!38477 l!1251)) otherKey!56)))))

(assert (=> d!167395 (= (containsKey!997 l!1251 otherKey!56) e!884425)))

(declare-fun b!1584323 () Bool)

(declare-fun e!884426 () Bool)

(assert (=> b!1584323 (= e!884425 e!884426)))

(declare-fun res!1082154 () Bool)

(assert (=> b!1584323 (=> (not res!1082154) (not e!884426))))

(assert (=> b!1584323 (= res!1082154 (and (or (not (is-Cons!36934 l!1251)) (bvsle (_1!12913 (h!38477 l!1251)) otherKey!56)) (is-Cons!36934 l!1251) (bvslt (_1!12913 (h!38477 l!1251)) otherKey!56)))))

(declare-fun b!1584324 () Bool)

(assert (=> b!1584324 (= e!884426 (containsKey!997 (t!51852 l!1251) otherKey!56))))

(assert (= (and d!167395 (not res!1082153)) b!1584323))

(assert (= (and b!1584323 res!1082154) b!1584324))

(assert (=> b!1584324 m!1453649))

(assert (=> b!1584236 d!167395))

(declare-fun d!167397 () Bool)

(declare-fun res!1082155 () Bool)

(declare-fun e!884427 () Bool)

(assert (=> d!167397 (=> res!1082155 e!884427)))

(assert (=> d!167397 (= res!1082155 (or (is-Nil!36935 (t!51852 l!1251)) (is-Nil!36935 (t!51852 (t!51852 l!1251)))))))

(assert (=> d!167397 (= (isStrictlySorted!1163 (t!51852 l!1251)) e!884427)))

(declare-fun b!1584325 () Bool)

(declare-fun e!884428 () Bool)

(assert (=> b!1584325 (= e!884427 e!884428)))

(declare-fun res!1082156 () Bool)

(assert (=> b!1584325 (=> (not res!1082156) (not e!884428))))

(assert (=> b!1584325 (= res!1082156 (bvslt (_1!12913 (h!38477 (t!51852 l!1251))) (_1!12913 (h!38477 (t!51852 (t!51852 l!1251))))))))

(declare-fun b!1584326 () Bool)

(assert (=> b!1584326 (= e!884428 (isStrictlySorted!1163 (t!51852 (t!51852 l!1251))))))

(assert (= (and d!167397 (not res!1082155)) b!1584325))

(assert (= (and b!1584325 res!1082156) b!1584326))

(declare-fun m!1453683 () Bool)

(assert (=> b!1584326 m!1453683))

(assert (=> b!1584238 d!167397))

(declare-fun b!1584331 () Bool)

(declare-fun e!884431 () Bool)

(declare-fun tp!115099 () Bool)

(assert (=> b!1584331 (= e!884431 (and tp_is_empty!39445 tp!115099))))

(assert (=> b!1584235 (= tp!115084 e!884431)))

(assert (= (and b!1584235 (is-Cons!36934 (t!51852 l!1251))) b!1584331))

(push 1)

(assert (not b!1584326))

(assert (not b!1584324))

(assert (not b!1584288))

(assert tp_is_empty!39445)

(assert (not b!1584331))

(assert (not b!1584320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

