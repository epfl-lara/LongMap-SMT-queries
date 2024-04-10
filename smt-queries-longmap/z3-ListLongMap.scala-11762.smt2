; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138036 () Bool)

(assert start!138036)

(declare-fun res!1082093 () Bool)

(declare-fun e!884365 () Bool)

(assert (=> start!138036 (=> (not res!1082093) (not e!884365))))

(declare-datatypes ((B!2914 0))(
  ( (B!2915 (val!19819 Int)) )
))
(declare-datatypes ((tuple2!25806 0))(
  ( (tuple2!25807 (_1!12914 (_ BitVec 64)) (_2!12914 B!2914)) )
))
(declare-datatypes ((List!36939 0))(
  ( (Nil!36936) (Cons!36935 (h!38478 tuple2!25806) (t!51853 List!36939)) )
))
(declare-fun l!1251 () List!36939)

(declare-fun isStrictlySorted!1164 (List!36939) Bool)

(assert (=> start!138036 (= res!1082093 (isStrictlySorted!1164 l!1251))))

(assert (=> start!138036 e!884365))

(declare-fun e!884363 () Bool)

(assert (=> start!138036 e!884363))

(assert (=> start!138036 true))

(declare-fun b!1584249 () Bool)

(declare-fun e!884364 () Bool)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!998 (List!36939 (_ BitVec 64)) Bool)

(assert (=> b!1584249 (= e!884364 (containsKey!998 (t!51853 l!1251) otherKey!56))))

(declare-fun b!1584250 () Bool)

(declare-fun res!1082094 () Bool)

(assert (=> b!1584250 (=> (not res!1082094) (not e!884365))))

(assert (=> b!1584250 (= res!1082094 (not (containsKey!998 l!1251 otherKey!56)))))

(declare-fun b!1584251 () Bool)

(declare-fun tp_is_empty!39447 () Bool)

(declare-fun tp!115087 () Bool)

(assert (=> b!1584251 (= e!884363 (and tp_is_empty!39447 tp!115087))))

(declare-fun b!1584252 () Bool)

(declare-fun res!1082095 () Bool)

(assert (=> b!1584252 (=> (not res!1082095) (not e!884365))))

(declare-fun newKey!123 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1584252 (= res!1082095 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36935) l!1251)))))

(declare-fun b!1584253 () Bool)

(assert (=> b!1584253 (= e!884365 e!884364)))

(declare-fun res!1082096 () Bool)

(assert (=> b!1584253 (=> res!1082096 e!884364)))

(assert (=> b!1584253 (= res!1082096 (not (isStrictlySorted!1164 (t!51853 l!1251))))))

(assert (= (and start!138036 res!1082093) b!1584250))

(assert (= (and b!1584250 res!1082094) b!1584252))

(assert (= (and b!1584252 res!1082095) b!1584253))

(assert (= (and b!1584253 (not res!1082096)) b!1584249))

(assert (= (and start!138036 ((_ is Cons!36935) l!1251)) b!1584251))

(declare-fun m!1453657 () Bool)

(assert (=> start!138036 m!1453657))

(declare-fun m!1453659 () Bool)

(assert (=> b!1584249 m!1453659))

(declare-fun m!1453661 () Bool)

(assert (=> b!1584250 m!1453661))

(declare-fun m!1453663 () Bool)

(assert (=> b!1584253 m!1453663))

(check-sat (not b!1584251) (not b!1584249) (not b!1584250) (not start!138036) tp_is_empty!39447 (not b!1584253))
(check-sat)
(get-model)

(declare-fun d!167375 () Bool)

(declare-fun res!1082117 () Bool)

(declare-fun e!884383 () Bool)

(assert (=> d!167375 (=> res!1082117 e!884383)))

(assert (=> d!167375 (= res!1082117 (or ((_ is Nil!36936) (t!51853 l!1251)) ((_ is Nil!36936) (t!51853 (t!51853 l!1251)))))))

(assert (=> d!167375 (= (isStrictlySorted!1164 (t!51853 l!1251)) e!884383)))

(declare-fun b!1584277 () Bool)

(declare-fun e!884384 () Bool)

(assert (=> b!1584277 (= e!884383 e!884384)))

(declare-fun res!1082118 () Bool)

(assert (=> b!1584277 (=> (not res!1082118) (not e!884384))))

(assert (=> b!1584277 (= res!1082118 (bvslt (_1!12914 (h!38478 (t!51853 l!1251))) (_1!12914 (h!38478 (t!51853 (t!51853 l!1251))))))))

(declare-fun b!1584278 () Bool)

(assert (=> b!1584278 (= e!884384 (isStrictlySorted!1164 (t!51853 (t!51853 l!1251))))))

(assert (= (and d!167375 (not res!1082117)) b!1584277))

(assert (= (and b!1584277 res!1082118) b!1584278))

(declare-fun m!1453673 () Bool)

(assert (=> b!1584278 m!1453673))

(assert (=> b!1584253 d!167375))

(declare-fun d!167381 () Bool)

(declare-fun res!1082137 () Bool)

(declare-fun e!884403 () Bool)

(assert (=> d!167381 (=> res!1082137 e!884403)))

(assert (=> d!167381 (= res!1082137 (and ((_ is Cons!36935) l!1251) (= (_1!12914 (h!38478 l!1251)) otherKey!56)))))

(assert (=> d!167381 (= (containsKey!998 l!1251 otherKey!56) e!884403)))

(declare-fun b!1584297 () Bool)

(declare-fun e!884404 () Bool)

(assert (=> b!1584297 (= e!884403 e!884404)))

(declare-fun res!1082138 () Bool)

(assert (=> b!1584297 (=> (not res!1082138) (not e!884404))))

(assert (=> b!1584297 (= res!1082138 (and (or (not ((_ is Cons!36935) l!1251)) (bvsle (_1!12914 (h!38478 l!1251)) otherKey!56)) ((_ is Cons!36935) l!1251) (bvslt (_1!12914 (h!38478 l!1251)) otherKey!56)))))

(declare-fun b!1584298 () Bool)

(assert (=> b!1584298 (= e!884404 (containsKey!998 (t!51853 l!1251) otherKey!56))))

(assert (= (and d!167381 (not res!1082137)) b!1584297))

(assert (= (and b!1584297 res!1082138) b!1584298))

(assert (=> b!1584298 m!1453659))

(assert (=> b!1584250 d!167381))

(declare-fun d!167389 () Bool)

(declare-fun res!1082143 () Bool)

(declare-fun e!884409 () Bool)

(assert (=> d!167389 (=> res!1082143 e!884409)))

(assert (=> d!167389 (= res!1082143 (and ((_ is Cons!36935) (t!51853 l!1251)) (= (_1!12914 (h!38478 (t!51853 l!1251))) otherKey!56)))))

(assert (=> d!167389 (= (containsKey!998 (t!51853 l!1251) otherKey!56) e!884409)))

(declare-fun b!1584301 () Bool)

(declare-fun e!884410 () Bool)

(assert (=> b!1584301 (= e!884409 e!884410)))

(declare-fun res!1082144 () Bool)

(assert (=> b!1584301 (=> (not res!1082144) (not e!884410))))

(assert (=> b!1584301 (= res!1082144 (and (or (not ((_ is Cons!36935) (t!51853 l!1251))) (bvsle (_1!12914 (h!38478 (t!51853 l!1251))) otherKey!56)) ((_ is Cons!36935) (t!51853 l!1251)) (bvslt (_1!12914 (h!38478 (t!51853 l!1251))) otherKey!56)))))

(declare-fun b!1584302 () Bool)

(assert (=> b!1584302 (= e!884410 (containsKey!998 (t!51853 (t!51853 l!1251)) otherKey!56))))

(assert (= (and d!167389 (not res!1082143)) b!1584301))

(assert (= (and b!1584301 res!1082144) b!1584302))

(declare-fun m!1453677 () Bool)

(assert (=> b!1584302 m!1453677))

(assert (=> b!1584249 d!167389))

(declare-fun d!167391 () Bool)

(declare-fun res!1082147 () Bool)

(declare-fun e!884413 () Bool)

(assert (=> d!167391 (=> res!1082147 e!884413)))

(assert (=> d!167391 (= res!1082147 (or ((_ is Nil!36936) l!1251) ((_ is Nil!36936) (t!51853 l!1251))))))

(assert (=> d!167391 (= (isStrictlySorted!1164 l!1251) e!884413)))

(declare-fun b!1584307 () Bool)

(declare-fun e!884414 () Bool)

(assert (=> b!1584307 (= e!884413 e!884414)))

(declare-fun res!1082148 () Bool)

(assert (=> b!1584307 (=> (not res!1082148) (not e!884414))))

(assert (=> b!1584307 (= res!1082148 (bvslt (_1!12914 (h!38478 l!1251)) (_1!12914 (h!38478 (t!51853 l!1251)))))))

(declare-fun b!1584308 () Bool)

(assert (=> b!1584308 (= e!884414 (isStrictlySorted!1164 (t!51853 l!1251)))))

(assert (= (and d!167391 (not res!1082147)) b!1584307))

(assert (= (and b!1584307 res!1082148) b!1584308))

(assert (=> b!1584308 m!1453663))

(assert (=> start!138036 d!167391))

(declare-fun b!1584321 () Bool)

(declare-fun e!884423 () Bool)

(declare-fun tp!115095 () Bool)

(assert (=> b!1584321 (= e!884423 (and tp_is_empty!39447 tp!115095))))

(assert (=> b!1584251 (= tp!115087 e!884423)))

(assert (= (and b!1584251 ((_ is Cons!36935) (t!51853 l!1251))) b!1584321))

(check-sat (not b!1584321) (not b!1584278) (not b!1584308) (not b!1584302) (not b!1584298) tp_is_empty!39447)
(check-sat)
