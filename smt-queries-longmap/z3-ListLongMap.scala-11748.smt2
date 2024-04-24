; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138182 () Bool)

(assert start!138182)

(declare-fun res!1082138 () Bool)

(declare-fun e!884897 () Bool)

(assert (=> start!138182 (=> (not res!1082138) (not e!884897))))

(declare-datatypes ((B!2816 0))(
  ( (B!2817 (val!19770 Int)) )
))
(declare-datatypes ((tuple2!25768 0))(
  ( (tuple2!25769 (_1!12895 (_ BitVec 64)) (_2!12895 B!2816)) )
))
(declare-datatypes ((List!36922 0))(
  ( (Nil!36919) (Cons!36918 (h!38479 tuple2!25768) (t!51828 List!36922)) )
))
(declare-fun l!1065 () List!36922)

(declare-fun isStrictlySorted!1112 (List!36922) Bool)

(assert (=> start!138182 (= res!1082138 (isStrictlySorted!1112 l!1065))))

(assert (=> start!138182 e!884897))

(declare-fun e!884896 () Bool)

(assert (=> start!138182 e!884896))

(assert (=> start!138182 true))

(declare-fun b!1585204 () Bool)

(declare-fun res!1082137 () Bool)

(assert (=> b!1585204 (=> (not res!1082137) (not e!884897))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!971 (List!36922 (_ BitVec 64)) Bool)

(assert (=> b!1585204 (= res!1082137 (containsKey!971 l!1065 key!287))))

(declare-fun b!1585205 () Bool)

(declare-fun ListPrimitiveSize!205 (List!36922) Int)

(assert (=> b!1585205 (= e!884897 (< (ListPrimitiveSize!205 l!1065) 0))))

(declare-fun b!1585206 () Bool)

(declare-fun tp_is_empty!39349 () Bool)

(declare-fun tp!114840 () Bool)

(assert (=> b!1585206 (= e!884896 (and tp_is_empty!39349 tp!114840))))

(assert (= (and start!138182 res!1082138) b!1585204))

(assert (= (and b!1585204 res!1082137) b!1585205))

(get-info :version)

(assert (= (and start!138182 ((_ is Cons!36918) l!1065)) b!1585206))

(declare-fun m!1455333 () Bool)

(assert (=> start!138182 m!1455333))

(declare-fun m!1455335 () Bool)

(assert (=> b!1585204 m!1455335))

(declare-fun m!1455337 () Bool)

(assert (=> b!1585205 m!1455337))

(check-sat tp_is_empty!39349 (not start!138182) (not b!1585204) (not b!1585206) (not b!1585205))
(check-sat)
(get-model)

(declare-fun d!167763 () Bool)

(declare-fun lt!678041 () Int)

(assert (=> d!167763 (>= lt!678041 0)))

(declare-fun e!884918 () Int)

(assert (=> d!167763 (= lt!678041 e!884918)))

(declare-fun c!147472 () Bool)

(assert (=> d!167763 (= c!147472 ((_ is Nil!36919) l!1065))))

(assert (=> d!167763 (= (ListPrimitiveSize!205 l!1065) lt!678041)))

(declare-fun b!1585235 () Bool)

(assert (=> b!1585235 (= e!884918 0)))

(declare-fun b!1585236 () Bool)

(assert (=> b!1585236 (= e!884918 (+ 1 (ListPrimitiveSize!205 (t!51828 l!1065))))))

(assert (= (and d!167763 c!147472) b!1585235))

(assert (= (and d!167763 (not c!147472)) b!1585236))

(declare-fun m!1455351 () Bool)

(assert (=> b!1585236 m!1455351))

(assert (=> b!1585205 d!167763))

(declare-fun d!167769 () Bool)

(declare-fun res!1082169 () Bool)

(declare-fun e!884934 () Bool)

(assert (=> d!167769 (=> res!1082169 e!884934)))

(assert (=> d!167769 (= res!1082169 (and ((_ is Cons!36918) l!1065) (= (_1!12895 (h!38479 l!1065)) key!287)))))

(assert (=> d!167769 (= (containsKey!971 l!1065 key!287) e!884934)))

(declare-fun b!1585255 () Bool)

(declare-fun e!884935 () Bool)

(assert (=> b!1585255 (= e!884934 e!884935)))

(declare-fun res!1082170 () Bool)

(assert (=> b!1585255 (=> (not res!1082170) (not e!884935))))

(assert (=> b!1585255 (= res!1082170 (and (or (not ((_ is Cons!36918) l!1065)) (bvsle (_1!12895 (h!38479 l!1065)) key!287)) ((_ is Cons!36918) l!1065) (bvslt (_1!12895 (h!38479 l!1065)) key!287)))))

(declare-fun b!1585256 () Bool)

(assert (=> b!1585256 (= e!884935 (containsKey!971 (t!51828 l!1065) key!287))))

(assert (= (and d!167769 (not res!1082169)) b!1585255))

(assert (= (and b!1585255 res!1082170) b!1585256))

(declare-fun m!1455357 () Bool)

(assert (=> b!1585256 m!1455357))

(assert (=> b!1585204 d!167769))

(declare-fun d!167775 () Bool)

(declare-fun res!1082183 () Bool)

(declare-fun e!884950 () Bool)

(assert (=> d!167775 (=> res!1082183 e!884950)))

(assert (=> d!167775 (= res!1082183 (or ((_ is Nil!36919) l!1065) ((_ is Nil!36919) (t!51828 l!1065))))))

(assert (=> d!167775 (= (isStrictlySorted!1112 l!1065) e!884950)))

(declare-fun b!1585273 () Bool)

(declare-fun e!884951 () Bool)

(assert (=> b!1585273 (= e!884950 e!884951)))

(declare-fun res!1082184 () Bool)

(assert (=> b!1585273 (=> (not res!1082184) (not e!884951))))

(assert (=> b!1585273 (= res!1082184 (bvslt (_1!12895 (h!38479 l!1065)) (_1!12895 (h!38479 (t!51828 l!1065)))))))

(declare-fun b!1585274 () Bool)

(assert (=> b!1585274 (= e!884951 (isStrictlySorted!1112 (t!51828 l!1065)))))

(assert (= (and d!167775 (not res!1082183)) b!1585273))

(assert (= (and b!1585273 res!1082184) b!1585274))

(declare-fun m!1455363 () Bool)

(assert (=> b!1585274 m!1455363))

(assert (=> start!138182 d!167775))

(declare-fun b!1585291 () Bool)

(declare-fun e!884961 () Bool)

(declare-fun tp!114853 () Bool)

(assert (=> b!1585291 (= e!884961 (and tp_is_empty!39349 tp!114853))))

(assert (=> b!1585206 (= tp!114840 e!884961)))

(assert (= (and b!1585206 ((_ is Cons!36918) (t!51828 l!1065))) b!1585291))

(check-sat (not b!1585256) (not b!1585291) tp_is_empty!39349 (not b!1585274) (not b!1585236))
(check-sat)
