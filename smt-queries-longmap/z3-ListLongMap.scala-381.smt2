; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7198 () Bool)

(assert start!7198)

(declare-fun res!26924 () Bool)

(declare-fun e!29310 () Bool)

(assert (=> start!7198 (=> (not res!26924) (not e!29310))))

(declare-datatypes ((B!866 0))(
  ( (B!867 (val!1020 Int)) )
))
(declare-datatypes ((tuple2!1670 0))(
  ( (tuple2!1671 (_1!846 (_ BitVec 64)) (_2!846 B!866)) )
))
(declare-datatypes ((List!1224 0))(
  ( (Nil!1221) (Cons!1220 (h!1800 tuple2!1670) (t!4249 List!1224)) )
))
(declare-fun l!812 () List!1224)

(declare-fun isStrictlySorted!217 (List!1224) Bool)

(assert (=> start!7198 (= res!26924 (isStrictlySorted!217 l!812))))

(assert (=> start!7198 e!29310))

(declare-fun e!29311 () Bool)

(assert (=> start!7198 e!29311))

(assert (=> start!7198 true))

(declare-fun b!46024 () Bool)

(declare-fun res!26923 () Bool)

(assert (=> b!46024 (=> (not res!26923) (not e!29310))))

(get-info :version)

(assert (=> b!46024 (= res!26923 (not ((_ is Cons!1220) l!812)))))

(declare-fun b!46025 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!38 (List!1224 (_ BitVec 64)) List!1224)

(assert (=> b!46025 (= e!29310 (not (isStrictlySorted!217 (removeStrictlySorted!38 l!812 key2!27))))))

(declare-fun b!46026 () Bool)

(declare-fun tp_is_empty!1963 () Bool)

(declare-fun tp!6065 () Bool)

(assert (=> b!46026 (= e!29311 (and tp_is_empty!1963 tp!6065))))

(assert (= (and start!7198 res!26924) b!46024))

(assert (= (and b!46024 res!26923) b!46025))

(assert (= (and start!7198 ((_ is Cons!1220) l!812)) b!46026))

(declare-fun m!40457 () Bool)

(assert (=> start!7198 m!40457))

(declare-fun m!40459 () Bool)

(assert (=> b!46025 m!40459))

(assert (=> b!46025 m!40459))

(declare-fun m!40461 () Bool)

(assert (=> b!46025 m!40461))

(check-sat (not b!46025) (not start!7198) (not b!46026) tp_is_empty!1963)
(check-sat)
(get-model)

(declare-fun d!9005 () Bool)

(declare-fun res!26949 () Bool)

(declare-fun e!29336 () Bool)

(assert (=> d!9005 (=> res!26949 e!29336)))

(assert (=> d!9005 (= res!26949 (or ((_ is Nil!1221) (removeStrictlySorted!38 l!812 key2!27)) ((_ is Nil!1221) (t!4249 (removeStrictlySorted!38 l!812 key2!27)))))))

(assert (=> d!9005 (= (isStrictlySorted!217 (removeStrictlySorted!38 l!812 key2!27)) e!29336)))

(declare-fun b!46057 () Bool)

(declare-fun e!29337 () Bool)

(assert (=> b!46057 (= e!29336 e!29337)))

(declare-fun res!26950 () Bool)

(assert (=> b!46057 (=> (not res!26950) (not e!29337))))

(assert (=> b!46057 (= res!26950 (bvslt (_1!846 (h!1800 (removeStrictlySorted!38 l!812 key2!27))) (_1!846 (h!1800 (t!4249 (removeStrictlySorted!38 l!812 key2!27))))))))

(declare-fun b!46058 () Bool)

(assert (=> b!46058 (= e!29337 (isStrictlySorted!217 (t!4249 (removeStrictlySorted!38 l!812 key2!27))))))

(assert (= (and d!9005 (not res!26949)) b!46057))

(assert (= (and b!46057 res!26950) b!46058))

(declare-fun m!40477 () Bool)

(assert (=> b!46058 m!40477))

(assert (=> b!46025 d!9005))

(declare-fun b!46096 () Bool)

(declare-fun e!29361 () List!1224)

(declare-fun e!29365 () List!1224)

(assert (=> b!46096 (= e!29361 e!29365)))

(declare-fun c!6225 () Bool)

(assert (=> b!46096 (= c!6225 (and ((_ is Cons!1220) l!812) (not (= (_1!846 (h!1800 l!812)) key2!27))))))

(declare-fun b!46098 () Bool)

(declare-fun e!29363 () Bool)

(declare-fun lt!20231 () List!1224)

(declare-fun containsKey!88 (List!1224 (_ BitVec 64)) Bool)

(assert (=> b!46098 (= e!29363 (not (containsKey!88 lt!20231 key2!27)))))

(declare-fun d!9011 () Bool)

(assert (=> d!9011 e!29363))

(declare-fun res!26962 () Bool)

(assert (=> d!9011 (=> (not res!26962) (not e!29363))))

(assert (=> d!9011 (= res!26962 (isStrictlySorted!217 lt!20231))))

(assert (=> d!9011 (= lt!20231 e!29361)))

(declare-fun c!6223 () Bool)

(assert (=> d!9011 (= c!6223 (and ((_ is Cons!1220) l!812) (= (_1!846 (h!1800 l!812)) key2!27)))))

(assert (=> d!9011 (isStrictlySorted!217 l!812)))

(assert (=> d!9011 (= (removeStrictlySorted!38 l!812 key2!27) lt!20231)))

(declare-fun b!46100 () Bool)

(assert (=> b!46100 (= e!29361 (t!4249 l!812))))

(declare-fun b!46101 () Bool)

(declare-fun $colon$colon!41 (List!1224 tuple2!1670) List!1224)

(assert (=> b!46101 (= e!29365 ($colon$colon!41 (removeStrictlySorted!38 (t!4249 l!812) key2!27) (h!1800 l!812)))))

(declare-fun b!46102 () Bool)

(assert (=> b!46102 (= e!29365 Nil!1221)))

(assert (= (and d!9011 c!6223) b!46100))

(assert (= (and d!9011 (not c!6223)) b!46096))

(assert (= (and b!46096 c!6225) b!46101))

(assert (= (and b!46096 (not c!6225)) b!46102))

(assert (= (and d!9011 res!26962) b!46098))

(declare-fun m!40481 () Bool)

(assert (=> b!46098 m!40481))

(declare-fun m!40485 () Bool)

(assert (=> d!9011 m!40485))

(assert (=> d!9011 m!40457))

(declare-fun m!40490 () Bool)

(assert (=> b!46101 m!40490))

(assert (=> b!46101 m!40490))

(declare-fun m!40495 () Bool)

(assert (=> b!46101 m!40495))

(assert (=> b!46025 d!9011))

(declare-fun d!9015 () Bool)

(declare-fun res!26964 () Bool)

(declare-fun e!29369 () Bool)

(assert (=> d!9015 (=> res!26964 e!29369)))

(assert (=> d!9015 (= res!26964 (or ((_ is Nil!1221) l!812) ((_ is Nil!1221) (t!4249 l!812))))))

(assert (=> d!9015 (= (isStrictlySorted!217 l!812) e!29369)))

(declare-fun b!46108 () Bool)

(declare-fun e!29370 () Bool)

(assert (=> b!46108 (= e!29369 e!29370)))

(declare-fun res!26965 () Bool)

(assert (=> b!46108 (=> (not res!26965) (not e!29370))))

(assert (=> b!46108 (= res!26965 (bvslt (_1!846 (h!1800 l!812)) (_1!846 (h!1800 (t!4249 l!812)))))))

(declare-fun b!46109 () Bool)

(assert (=> b!46109 (= e!29370 (isStrictlySorted!217 (t!4249 l!812)))))

(assert (= (and d!9015 (not res!26964)) b!46108))

(assert (= (and b!46108 res!26965) b!46109))

(declare-fun m!40505 () Bool)

(assert (=> b!46109 m!40505))

(assert (=> start!7198 d!9015))

(declare-fun b!46126 () Bool)

(declare-fun e!29381 () Bool)

(declare-fun tp!6078 () Bool)

(assert (=> b!46126 (= e!29381 (and tp_is_empty!1963 tp!6078))))

(assert (=> b!46026 (= tp!6065 e!29381)))

(assert (= (and b!46026 ((_ is Cons!1220) (t!4249 l!812))) b!46126))

(check-sat (not d!9011) (not b!46101) (not b!46109) (not b!46126) tp_is_empty!1963 (not b!46098) (not b!46058))
(check-sat)
