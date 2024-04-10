; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137786 () Bool)

(assert start!137786)

(declare-fun res!1081380 () Bool)

(declare-fun e!883502 () Bool)

(assert (=> start!137786 (=> (not res!1081380) (not e!883502))))

(declare-datatypes ((B!2830 0))(
  ( (B!2831 (val!19777 Int)) )
))
(declare-datatypes ((tuple2!25722 0))(
  ( (tuple2!25723 (_1!12872 (_ BitVec 64)) (_2!12872 B!2830)) )
))
(declare-datatypes ((List!36897 0))(
  ( (Nil!36894) (Cons!36893 (h!38436 tuple2!25722) (t!51811 List!36897)) )
))
(declare-fun l!1065 () List!36897)

(declare-fun isStrictlySorted!1131 (List!36897) Bool)

(assert (=> start!137786 (= res!1081380 (isStrictlySorted!1131 l!1065))))

(assert (=> start!137786 e!883502))

(declare-fun e!883501 () Bool)

(assert (=> start!137786 e!883501))

(assert (=> start!137786 true))

(declare-fun b!1582925 () Bool)

(declare-fun ListPrimitiveSize!209 (List!36897) Int)

(assert (=> b!1582925 (= e!883502 (>= (ListPrimitiveSize!209 (t!51811 l!1065)) (ListPrimitiveSize!209 l!1065)))))

(declare-fun b!1582926 () Bool)

(declare-fun res!1081376 () Bool)

(assert (=> b!1582926 (=> (not res!1081376) (not e!883502))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!977 (List!36897 (_ BitVec 64)) Bool)

(assert (=> b!1582926 (= res!1081376 (containsKey!977 (t!51811 l!1065) key!287))))

(declare-fun b!1582927 () Bool)

(declare-fun tp_is_empty!39363 () Bool)

(declare-fun tp!114878 () Bool)

(assert (=> b!1582927 (= e!883501 (and tp_is_empty!39363 tp!114878))))

(declare-fun b!1582928 () Bool)

(declare-fun res!1081377 () Bool)

(assert (=> b!1582928 (=> (not res!1081377) (not e!883502))))

(get-info :version)

(assert (=> b!1582928 (= res!1081377 (and ((_ is Cons!36893) l!1065) (not (= (_1!12872 (h!38436 l!1065)) key!287))))))

(declare-fun b!1582929 () Bool)

(declare-fun res!1081378 () Bool)

(assert (=> b!1582929 (=> (not res!1081378) (not e!883502))))

(assert (=> b!1582929 (= res!1081378 (containsKey!977 l!1065 key!287))))

(declare-fun b!1582930 () Bool)

(declare-fun res!1081379 () Bool)

(assert (=> b!1582930 (=> (not res!1081379) (not e!883502))))

(assert (=> b!1582930 (= res!1081379 (isStrictlySorted!1131 (t!51811 l!1065)))))

(assert (= (and start!137786 res!1081380) b!1582929))

(assert (= (and b!1582929 res!1081378) b!1582928))

(assert (= (and b!1582928 res!1081377) b!1582930))

(assert (= (and b!1582930 res!1081379) b!1582926))

(assert (= (and b!1582926 res!1081376) b!1582925))

(assert (= (and start!137786 ((_ is Cons!36893) l!1065)) b!1582927))

(declare-fun m!1453091 () Bool)

(assert (=> b!1582925 m!1453091))

(declare-fun m!1453093 () Bool)

(assert (=> b!1582925 m!1453093))

(declare-fun m!1453095 () Bool)

(assert (=> b!1582930 m!1453095))

(declare-fun m!1453097 () Bool)

(assert (=> start!137786 m!1453097))

(declare-fun m!1453099 () Bool)

(assert (=> b!1582926 m!1453099))

(declare-fun m!1453101 () Bool)

(assert (=> b!1582929 m!1453101))

(check-sat tp_is_empty!39363 (not b!1582925) (not start!137786) (not b!1582926) (not b!1582927) (not b!1582929) (not b!1582930))
(check-sat)
(get-model)

(declare-fun d!167079 () Bool)

(declare-fun res!1081402 () Bool)

(declare-fun e!883515 () Bool)

(assert (=> d!167079 (=> res!1081402 e!883515)))

(assert (=> d!167079 (= res!1081402 (and ((_ is Cons!36893) l!1065) (= (_1!12872 (h!38436 l!1065)) key!287)))))

(assert (=> d!167079 (= (containsKey!977 l!1065 key!287) e!883515)))

(declare-fun b!1582955 () Bool)

(declare-fun e!883516 () Bool)

(assert (=> b!1582955 (= e!883515 e!883516)))

(declare-fun res!1081403 () Bool)

(assert (=> b!1582955 (=> (not res!1081403) (not e!883516))))

(assert (=> b!1582955 (= res!1081403 (and (or (not ((_ is Cons!36893) l!1065)) (bvsle (_1!12872 (h!38436 l!1065)) key!287)) ((_ is Cons!36893) l!1065) (bvslt (_1!12872 (h!38436 l!1065)) key!287)))))

(declare-fun b!1582956 () Bool)

(assert (=> b!1582956 (= e!883516 (containsKey!977 (t!51811 l!1065) key!287))))

(assert (= (and d!167079 (not res!1081402)) b!1582955))

(assert (= (and b!1582955 res!1081403) b!1582956))

(assert (=> b!1582956 m!1453099))

(assert (=> b!1582929 d!167079))

(declare-fun d!167085 () Bool)

(declare-fun res!1081420 () Bool)

(declare-fun e!883533 () Bool)

(assert (=> d!167085 (=> res!1081420 e!883533)))

(assert (=> d!167085 (= res!1081420 (or ((_ is Nil!36894) l!1065) ((_ is Nil!36894) (t!51811 l!1065))))))

(assert (=> d!167085 (= (isStrictlySorted!1131 l!1065) e!883533)))

(declare-fun b!1582973 () Bool)

(declare-fun e!883534 () Bool)

(assert (=> b!1582973 (= e!883533 e!883534)))

(declare-fun res!1081421 () Bool)

(assert (=> b!1582973 (=> (not res!1081421) (not e!883534))))

(assert (=> b!1582973 (= res!1081421 (bvslt (_1!12872 (h!38436 l!1065)) (_1!12872 (h!38436 (t!51811 l!1065)))))))

(declare-fun b!1582974 () Bool)

(assert (=> b!1582974 (= e!883534 (isStrictlySorted!1131 (t!51811 l!1065)))))

(assert (= (and d!167085 (not res!1081420)) b!1582973))

(assert (= (and b!1582973 res!1081421) b!1582974))

(assert (=> b!1582974 m!1453095))

(assert (=> start!137786 d!167085))

(declare-fun d!167093 () Bool)

(declare-fun lt!677139 () Int)

(assert (=> d!167093 (>= lt!677139 0)))

(declare-fun e!883547 () Int)

(assert (=> d!167093 (= lt!677139 e!883547)))

(declare-fun c!146674 () Bool)

(assert (=> d!167093 (= c!146674 ((_ is Nil!36894) (t!51811 l!1065)))))

(assert (=> d!167093 (= (ListPrimitiveSize!209 (t!51811 l!1065)) lt!677139)))

(declare-fun b!1582989 () Bool)

(assert (=> b!1582989 (= e!883547 0)))

(declare-fun b!1582990 () Bool)

(assert (=> b!1582990 (= e!883547 (+ 1 (ListPrimitiveSize!209 (t!51811 (t!51811 l!1065)))))))

(assert (= (and d!167093 c!146674) b!1582989))

(assert (= (and d!167093 (not c!146674)) b!1582990))

(declare-fun m!1453121 () Bool)

(assert (=> b!1582990 m!1453121))

(assert (=> b!1582925 d!167093))

(declare-fun d!167097 () Bool)

(declare-fun lt!677140 () Int)

(assert (=> d!167097 (>= lt!677140 0)))

(declare-fun e!883548 () Int)

(assert (=> d!167097 (= lt!677140 e!883548)))

(declare-fun c!146675 () Bool)

(assert (=> d!167097 (= c!146675 ((_ is Nil!36894) l!1065))))

(assert (=> d!167097 (= (ListPrimitiveSize!209 l!1065) lt!677140)))

(declare-fun b!1582991 () Bool)

(assert (=> b!1582991 (= e!883548 0)))

(declare-fun b!1582992 () Bool)

(assert (=> b!1582992 (= e!883548 (+ 1 (ListPrimitiveSize!209 (t!51811 l!1065))))))

(assert (= (and d!167097 c!146675) b!1582991))

(assert (= (and d!167097 (not c!146675)) b!1582992))

(assert (=> b!1582992 m!1453091))

(assert (=> b!1582925 d!167097))

(declare-fun d!167099 () Bool)

(declare-fun res!1081434 () Bool)

(declare-fun e!883553 () Bool)

(assert (=> d!167099 (=> res!1081434 e!883553)))

(assert (=> d!167099 (= res!1081434 (or ((_ is Nil!36894) (t!51811 l!1065)) ((_ is Nil!36894) (t!51811 (t!51811 l!1065)))))))

(assert (=> d!167099 (= (isStrictlySorted!1131 (t!51811 l!1065)) e!883553)))

(declare-fun b!1582999 () Bool)

(declare-fun e!883554 () Bool)

(assert (=> b!1582999 (= e!883553 e!883554)))

(declare-fun res!1081435 () Bool)

(assert (=> b!1582999 (=> (not res!1081435) (not e!883554))))

(assert (=> b!1582999 (= res!1081435 (bvslt (_1!12872 (h!38436 (t!51811 l!1065))) (_1!12872 (h!38436 (t!51811 (t!51811 l!1065))))))))

(declare-fun b!1583000 () Bool)

(assert (=> b!1583000 (= e!883554 (isStrictlySorted!1131 (t!51811 (t!51811 l!1065))))))

(assert (= (and d!167099 (not res!1081434)) b!1582999))

(assert (= (and b!1582999 res!1081435) b!1583000))

(declare-fun m!1453123 () Bool)

(assert (=> b!1583000 m!1453123))

(assert (=> b!1582930 d!167099))

(declare-fun d!167101 () Bool)

(declare-fun res!1081436 () Bool)

(declare-fun e!883555 () Bool)

(assert (=> d!167101 (=> res!1081436 e!883555)))

(assert (=> d!167101 (= res!1081436 (and ((_ is Cons!36893) (t!51811 l!1065)) (= (_1!12872 (h!38436 (t!51811 l!1065))) key!287)))))

(assert (=> d!167101 (= (containsKey!977 (t!51811 l!1065) key!287) e!883555)))

(declare-fun b!1583001 () Bool)

(declare-fun e!883556 () Bool)

(assert (=> b!1583001 (= e!883555 e!883556)))

(declare-fun res!1081437 () Bool)

(assert (=> b!1583001 (=> (not res!1081437) (not e!883556))))

(assert (=> b!1583001 (= res!1081437 (and (or (not ((_ is Cons!36893) (t!51811 l!1065))) (bvsle (_1!12872 (h!38436 (t!51811 l!1065))) key!287)) ((_ is Cons!36893) (t!51811 l!1065)) (bvslt (_1!12872 (h!38436 (t!51811 l!1065))) key!287)))))

(declare-fun b!1583002 () Bool)

(assert (=> b!1583002 (= e!883556 (containsKey!977 (t!51811 (t!51811 l!1065)) key!287))))

(assert (= (and d!167101 (not res!1081436)) b!1583001))

(assert (= (and b!1583001 res!1081437) b!1583002))

(declare-fun m!1453127 () Bool)

(assert (=> b!1583002 m!1453127))

(assert (=> b!1582926 d!167101))

(declare-fun b!1583011 () Bool)

(declare-fun e!883562 () Bool)

(declare-fun tp!114884 () Bool)

(assert (=> b!1583011 (= e!883562 (and tp_is_empty!39363 tp!114884))))

(assert (=> b!1582927 (= tp!114878 e!883562)))

(assert (= (and b!1582927 ((_ is Cons!36893) (t!51811 l!1065))) b!1583011))

(check-sat (not b!1582956) tp_is_empty!39363 (not b!1583000) (not b!1582974) (not b!1582990) (not b!1583011) (not b!1582992) (not b!1583002))
(check-sat)
