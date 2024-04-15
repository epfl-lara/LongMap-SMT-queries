; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138018 () Bool)

(assert start!138018)

(declare-fun b!1584031 () Bool)

(declare-fun res!1082038 () Bool)

(declare-fun e!884239 () Bool)

(assert (=> b!1584031 (=> (not res!1082038) (not e!884239))))

(declare-datatypes ((B!2918 0))(
  ( (B!2919 (val!19821 Int)) )
))
(declare-datatypes ((tuple2!25878 0))(
  ( (tuple2!25879 (_1!12950 (_ BitVec 64)) (_2!12950 B!2918)) )
))
(declare-datatypes ((List!36982 0))(
  ( (Nil!36979) (Cons!36978 (h!38522 tuple2!25878) (t!51888 List!36982)) )
))
(declare-fun l!1251 () List!36982)

(declare-fun isStrictlySorted!1164 (List!36982) Bool)

(assert (=> b!1584031 (= res!1082038 (isStrictlySorted!1164 (t!51888 l!1251)))))

(declare-fun res!1082041 () Bool)

(assert (=> start!138018 (=> (not res!1082041) (not e!884239))))

(assert (=> start!138018 (= res!1082041 (isStrictlySorted!1164 l!1251))))

(assert (=> start!138018 e!884239))

(declare-fun e!884238 () Bool)

(assert (=> start!138018 e!884238))

(assert (=> start!138018 true))

(declare-fun b!1584032 () Bool)

(declare-fun res!1082042 () Bool)

(assert (=> b!1584032 (=> (not res!1082042) (not e!884239))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1584032 (= res!1082042 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36978) l!1251)))))

(declare-fun b!1584033 () Bool)

(declare-fun res!1082040 () Bool)

(assert (=> b!1584033 (=> (not res!1082040) (not e!884239))))

(declare-fun containsKey!998 (List!36982 (_ BitVec 64)) Bool)

(assert (=> b!1584033 (= res!1082040 (not (containsKey!998 (t!51888 l!1251) otherKey!56)))))

(declare-fun b!1584034 () Bool)

(declare-fun res!1082039 () Bool)

(assert (=> b!1584034 (=> (not res!1082039) (not e!884239))))

(assert (=> b!1584034 (= res!1082039 (not (containsKey!998 l!1251 otherKey!56)))))

(declare-fun b!1584035 () Bool)

(declare-fun tp_is_empty!39451 () Bool)

(declare-fun tp!115103 () Bool)

(assert (=> b!1584035 (= e!884238 (and tp_is_empty!39451 tp!115103))))

(declare-fun b!1584036 () Bool)

(declare-fun ListPrimitiveSize!220 (List!36982) Int)

(assert (=> b!1584036 (= e!884239 (>= (ListPrimitiveSize!220 (t!51888 l!1251)) (ListPrimitiveSize!220 l!1251)))))

(assert (= (and start!138018 res!1082041) b!1584034))

(assert (= (and b!1584034 res!1082039) b!1584032))

(assert (= (and b!1584032 res!1082042) b!1584031))

(assert (= (and b!1584031 res!1082038) b!1584033))

(assert (= (and b!1584033 res!1082040) b!1584036))

(assert (= (and start!138018 ((_ is Cons!36978) l!1251)) b!1584035))

(declare-fun m!1452805 () Bool)

(assert (=> b!1584031 m!1452805))

(declare-fun m!1452807 () Bool)

(assert (=> b!1584033 m!1452807))

(declare-fun m!1452809 () Bool)

(assert (=> start!138018 m!1452809))

(declare-fun m!1452811 () Bool)

(assert (=> b!1584036 m!1452811))

(declare-fun m!1452813 () Bool)

(assert (=> b!1584036 m!1452813))

(declare-fun m!1452815 () Bool)

(assert (=> b!1584034 m!1452815))

(check-sat (not b!1584034) (not b!1584036) (not b!1584033) (not b!1584031) (not b!1584035) (not start!138018) tp_is_empty!39451)
(check-sat)
(get-model)

(declare-fun d!167163 () Bool)

(declare-fun res!1082081 () Bool)

(declare-fun e!884260 () Bool)

(assert (=> d!167163 (=> res!1082081 e!884260)))

(assert (=> d!167163 (= res!1082081 (and ((_ is Cons!36978) (t!51888 l!1251)) (= (_1!12950 (h!38522 (t!51888 l!1251))) otherKey!56)))))

(assert (=> d!167163 (= (containsKey!998 (t!51888 l!1251) otherKey!56) e!884260)))

(declare-fun b!1584081 () Bool)

(declare-fun e!884261 () Bool)

(assert (=> b!1584081 (= e!884260 e!884261)))

(declare-fun res!1082082 () Bool)

(assert (=> b!1584081 (=> (not res!1082082) (not e!884261))))

(assert (=> b!1584081 (= res!1082082 (and (or (not ((_ is Cons!36978) (t!51888 l!1251))) (bvsle (_1!12950 (h!38522 (t!51888 l!1251))) otherKey!56)) ((_ is Cons!36978) (t!51888 l!1251)) (bvslt (_1!12950 (h!38522 (t!51888 l!1251))) otherKey!56)))))

(declare-fun b!1584082 () Bool)

(assert (=> b!1584082 (= e!884261 (containsKey!998 (t!51888 (t!51888 l!1251)) otherKey!56))))

(assert (= (and d!167163 (not res!1082081)) b!1584081))

(assert (= (and b!1584081 res!1082082) b!1584082))

(declare-fun m!1452841 () Bool)

(assert (=> b!1584082 m!1452841))

(assert (=> b!1584033 d!167163))

(declare-fun d!167169 () Bool)

(declare-fun res!1082099 () Bool)

(declare-fun e!884278 () Bool)

(assert (=> d!167169 (=> res!1082099 e!884278)))

(assert (=> d!167169 (= res!1082099 (or ((_ is Nil!36979) l!1251) ((_ is Nil!36979) (t!51888 l!1251))))))

(assert (=> d!167169 (= (isStrictlySorted!1164 l!1251) e!884278)))

(declare-fun b!1584099 () Bool)

(declare-fun e!884279 () Bool)

(assert (=> b!1584099 (= e!884278 e!884279)))

(declare-fun res!1082100 () Bool)

(assert (=> b!1584099 (=> (not res!1082100) (not e!884279))))

(assert (=> b!1584099 (= res!1082100 (bvslt (_1!12950 (h!38522 l!1251)) (_1!12950 (h!38522 (t!51888 l!1251)))))))

(declare-fun b!1584100 () Bool)

(assert (=> b!1584100 (= e!884279 (isStrictlySorted!1164 (t!51888 l!1251)))))

(assert (= (and d!167169 (not res!1082099)) b!1584099))

(assert (= (and b!1584099 res!1082100) b!1584100))

(assert (=> b!1584100 m!1452805))

(assert (=> start!138018 d!167169))

(declare-fun d!167179 () Bool)

(declare-fun res!1082105 () Bool)

(declare-fun e!884284 () Bool)

(assert (=> d!167179 (=> res!1082105 e!884284)))

(assert (=> d!167179 (= res!1082105 (and ((_ is Cons!36978) l!1251) (= (_1!12950 (h!38522 l!1251)) otherKey!56)))))

(assert (=> d!167179 (= (containsKey!998 l!1251 otherKey!56) e!884284)))

(declare-fun b!1584103 () Bool)

(declare-fun e!884285 () Bool)

(assert (=> b!1584103 (= e!884284 e!884285)))

(declare-fun res!1082106 () Bool)

(assert (=> b!1584103 (=> (not res!1082106) (not e!884285))))

(assert (=> b!1584103 (= res!1082106 (and (or (not ((_ is Cons!36978) l!1251)) (bvsle (_1!12950 (h!38522 l!1251)) otherKey!56)) ((_ is Cons!36978) l!1251) (bvslt (_1!12950 (h!38522 l!1251)) otherKey!56)))))

(declare-fun b!1584106 () Bool)

(assert (=> b!1584106 (= e!884285 (containsKey!998 (t!51888 l!1251) otherKey!56))))

(assert (= (and d!167179 (not res!1082105)) b!1584103))

(assert (= (and b!1584103 res!1082106) b!1584106))

(assert (=> b!1584106 m!1452807))

(assert (=> b!1584034 d!167179))

(declare-fun d!167181 () Bool)

(declare-fun res!1082107 () Bool)

(declare-fun e!884286 () Bool)

(assert (=> d!167181 (=> res!1082107 e!884286)))

(assert (=> d!167181 (= res!1082107 (or ((_ is Nil!36979) (t!51888 l!1251)) ((_ is Nil!36979) (t!51888 (t!51888 l!1251)))))))

(assert (=> d!167181 (= (isStrictlySorted!1164 (t!51888 l!1251)) e!884286)))

(declare-fun b!1584107 () Bool)

(declare-fun e!884287 () Bool)

(assert (=> b!1584107 (= e!884286 e!884287)))

(declare-fun res!1082108 () Bool)

(assert (=> b!1584107 (=> (not res!1082108) (not e!884287))))

(assert (=> b!1584107 (= res!1082108 (bvslt (_1!12950 (h!38522 (t!51888 l!1251))) (_1!12950 (h!38522 (t!51888 (t!51888 l!1251))))))))

(declare-fun b!1584108 () Bool)

(assert (=> b!1584108 (= e!884287 (isStrictlySorted!1164 (t!51888 (t!51888 l!1251))))))

(assert (= (and d!167181 (not res!1082107)) b!1584107))

(assert (= (and b!1584107 res!1082108) b!1584108))

(declare-fun m!1452847 () Bool)

(assert (=> b!1584108 m!1452847))

(assert (=> b!1584031 d!167181))

(declare-fun d!167183 () Bool)

(declare-fun lt!676966 () Int)

(assert (=> d!167183 (>= lt!676966 0)))

(declare-fun e!884300 () Int)

(assert (=> d!167183 (= lt!676966 e!884300)))

(declare-fun c!146759 () Bool)

(assert (=> d!167183 (= c!146759 ((_ is Nil!36979) (t!51888 l!1251)))))

(assert (=> d!167183 (= (ListPrimitiveSize!220 (t!51888 l!1251)) lt!676966)))

(declare-fun b!1584125 () Bool)

(assert (=> b!1584125 (= e!884300 0)))

(declare-fun b!1584126 () Bool)

(assert (=> b!1584126 (= e!884300 (+ 1 (ListPrimitiveSize!220 (t!51888 (t!51888 l!1251)))))))

(assert (= (and d!167183 c!146759) b!1584125))

(assert (= (and d!167183 (not c!146759)) b!1584126))

(declare-fun m!1452849 () Bool)

(assert (=> b!1584126 m!1452849))

(assert (=> b!1584036 d!167183))

(declare-fun d!167189 () Bool)

(declare-fun lt!676967 () Int)

(assert (=> d!167189 (>= lt!676967 0)))

(declare-fun e!884301 () Int)

(assert (=> d!167189 (= lt!676967 e!884301)))

(declare-fun c!146760 () Bool)

(assert (=> d!167189 (= c!146760 ((_ is Nil!36979) l!1251))))

(assert (=> d!167189 (= (ListPrimitiveSize!220 l!1251) lt!676967)))

(declare-fun b!1584127 () Bool)

(assert (=> b!1584127 (= e!884301 0)))

(declare-fun b!1584128 () Bool)

(assert (=> b!1584128 (= e!884301 (+ 1 (ListPrimitiveSize!220 (t!51888 l!1251))))))

(assert (= (and d!167189 c!146760) b!1584127))

(assert (= (and d!167189 (not c!146760)) b!1584128))

(assert (=> b!1584128 m!1452811))

(assert (=> b!1584036 d!167189))

(declare-fun b!1584141 () Bool)

(declare-fun e!884308 () Bool)

(declare-fun tp!115112 () Bool)

(assert (=> b!1584141 (= e!884308 (and tp_is_empty!39451 tp!115112))))

(assert (=> b!1584035 (= tp!115103 e!884308)))

(assert (= (and b!1584035 ((_ is Cons!36978) (t!51888 l!1251))) b!1584141))

(check-sat (not b!1584126) (not b!1584082) (not b!1584100) (not b!1584128) (not b!1584108) (not b!1584141) (not b!1584106) tp_is_empty!39451)
(check-sat)
