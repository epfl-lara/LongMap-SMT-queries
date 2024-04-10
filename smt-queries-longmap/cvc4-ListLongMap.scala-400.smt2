; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7460 () Bool)

(assert start!7460)

(declare-fun res!27842 () Bool)

(declare-fun e!30738 () Bool)

(assert (=> start!7460 (=> (not res!27842) (not e!30738))))

(declare-datatypes ((B!918 0))(
  ( (B!919 (val!1079 Int)) )
))
(declare-datatypes ((tuple2!1740 0))(
  ( (tuple2!1741 (_1!881 (_ BitVec 64)) (_2!881 B!918)) )
))
(declare-datatypes ((List!1276 0))(
  ( (Nil!1273) (Cons!1272 (h!1852 tuple2!1740) (t!4304 List!1276)) )
))
(declare-datatypes ((ListLongMap!1233 0))(
  ( (ListLongMap!1234 (toList!632 List!1276)) )
))
(declare-fun lm!267 () ListLongMap!1233)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!596 (ListLongMap!1233 (_ BitVec 64)) Bool)

(assert (=> start!7460 (= res!27842 (not (contains!596 lm!267 key!657)))))

(assert (=> start!7460 e!30738))

(declare-fun e!30739 () Bool)

(declare-fun inv!2222 (ListLongMap!1233) Bool)

(assert (=> start!7460 (and (inv!2222 lm!267) e!30739)))

(assert (=> start!7460 true))

(declare-fun b!47923 () Bool)

(declare-fun isStrictlySorted!249 (List!1276) Bool)

(assert (=> b!47923 (= e!30738 (not (isStrictlySorted!249 (toList!632 lm!267))))))

(declare-fun b!47924 () Bool)

(declare-fun tp!6317 () Bool)

(assert (=> b!47924 (= e!30739 tp!6317)))

(assert (= (and start!7460 res!27842) b!47923))

(assert (= start!7460 b!47924))

(declare-fun m!41949 () Bool)

(assert (=> start!7460 m!41949))

(declare-fun m!41951 () Bool)

(assert (=> start!7460 m!41951))

(declare-fun m!41953 () Bool)

(assert (=> b!47923 m!41953))

(push 1)

(assert (not b!47923))

(assert (not start!7460))

(assert (not b!47924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9496 () Bool)

(declare-fun res!27847 () Bool)

(declare-fun e!30744 () Bool)

(assert (=> d!9496 (=> res!27847 e!30744)))

(assert (=> d!9496 (= res!27847 (or (is-Nil!1273 (toList!632 lm!267)) (is-Nil!1273 (t!4304 (toList!632 lm!267)))))))

(assert (=> d!9496 (= (isStrictlySorted!249 (toList!632 lm!267)) e!30744)))

(declare-fun b!47929 () Bool)

(declare-fun e!30745 () Bool)

(assert (=> b!47929 (= e!30744 e!30745)))

(declare-fun res!27848 () Bool)

(assert (=> b!47929 (=> (not res!27848) (not e!30745))))

(assert (=> b!47929 (= res!27848 (bvslt (_1!881 (h!1852 (toList!632 lm!267))) (_1!881 (h!1852 (t!4304 (toList!632 lm!267))))))))

(declare-fun b!47930 () Bool)

(assert (=> b!47930 (= e!30745 (isStrictlySorted!249 (t!4304 (toList!632 lm!267))))))

(assert (= (and d!9496 (not res!27847)) b!47929))

(assert (= (and b!47929 res!27848) b!47930))

(declare-fun m!41955 () Bool)

(assert (=> b!47930 m!41955))

(assert (=> b!47923 d!9496))

(declare-fun d!9499 () Bool)

(declare-fun e!30771 () Bool)

(assert (=> d!9499 e!30771))

(declare-fun res!27863 () Bool)

(assert (=> d!9499 (=> res!27863 e!30771)))

(declare-fun lt!20510 () Bool)

(assert (=> d!9499 (= res!27863 (not lt!20510))))

(declare-fun lt!20507 () Bool)

(assert (=> d!9499 (= lt!20510 lt!20507)))

(declare-datatypes ((Unit!1343 0))(
  ( (Unit!1344) )
))
(declare-fun lt!20509 () Unit!1343)

(declare-fun e!30772 () Unit!1343)

(assert (=> d!9499 (= lt!20509 e!30772)))

(declare-fun c!6450 () Bool)

(assert (=> d!9499 (= c!6450 lt!20507)))

(declare-fun containsKey!98 (List!1276 (_ BitVec 64)) Bool)

(assert (=> d!9499 (= lt!20507 (containsKey!98 (toList!632 lm!267) key!657))))

(assert (=> d!9499 (= (contains!596 lm!267 key!657) lt!20510)))

(declare-fun b!47966 () Bool)

(declare-fun lt!20508 () Unit!1343)

(assert (=> b!47966 (= e!30772 lt!20508)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!68 (List!1276 (_ BitVec 64)) Unit!1343)

(assert (=> b!47966 (= lt!20508 (lemmaContainsKeyImpliesGetValueByKeyDefined!68 (toList!632 lm!267) key!657))))

(declare-datatypes ((Option!118 0))(
  ( (Some!117 (v!2134 B!918)) (None!116) )
))
(declare-fun isDefined!69 (Option!118) Bool)

(declare-fun getValueByKey!112 (List!1276 (_ BitVec 64)) Option!118)

(assert (=> b!47966 (isDefined!69 (getValueByKey!112 (toList!632 lm!267) key!657))))

(declare-fun b!47967 () Bool)

(declare-fun Unit!1345 () Unit!1343)

(assert (=> b!47967 (= e!30772 Unit!1345)))

(declare-fun b!47968 () Bool)

(assert (=> b!47968 (= e!30771 (isDefined!69 (getValueByKey!112 (toList!632 lm!267) key!657)))))

(assert (= (and d!9499 c!6450) b!47966))

(assert (= (and d!9499 (not c!6450)) b!47967))

(assert (= (and d!9499 (not res!27863)) b!47968))

(declare-fun m!41975 () Bool)

(assert (=> d!9499 m!41975))

(declare-fun m!41977 () Bool)

(assert (=> b!47966 m!41977))

(declare-fun m!41979 () Bool)

(assert (=> b!47966 m!41979))

(assert (=> b!47966 m!41979))

(declare-fun m!41981 () Bool)

(assert (=> b!47966 m!41981))

(assert (=> b!47968 m!41979))

(assert (=> b!47968 m!41979))

(assert (=> b!47968 m!41981))

(assert (=> start!7460 d!9499))

(declare-fun d!9509 () Bool)

(assert (=> d!9509 (= (inv!2222 lm!267) (isStrictlySorted!249 (toList!632 lm!267)))))

(declare-fun bs!2235 () Bool)

(assert (= bs!2235 d!9509))

