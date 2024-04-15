; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71948 () Bool)

(assert start!71948)

(declare-datatypes ((B!1172 0))(
  ( (B!1173 (val!7668 Int)) )
))
(declare-datatypes ((tuple2!10204 0))(
  ( (tuple2!10205 (_1!5113 (_ BitVec 64)) (_2!5113 B!1172)) )
))
(declare-datatypes ((List!15972 0))(
  ( (Nil!15969) (Cons!15968 (h!17099 tuple2!10204) (t!22334 List!15972)) )
))
(declare-datatypes ((ListLongMap!9005 0))(
  ( (ListLongMap!9006 (toList!4518 List!15972)) )
))
(declare-fun thiss!193 () ListLongMap!9005)

(declare-fun isStrictlySorted!439 (List!15972) Bool)

(assert (=> start!71948 (not (isStrictlySorted!439 (toList!4518 thiss!193)))))

(declare-fun e!466340 () Bool)

(declare-fun inv!27240 (ListLongMap!9005) Bool)

(assert (=> start!71948 (and (inv!27240 thiss!193) e!466340)))

(declare-fun b!835974 () Bool)

(declare-fun tp!47387 () Bool)

(assert (=> b!835974 (= e!466340 tp!47387)))

(assert (= start!71948 b!835974))

(declare-fun m!780869 () Bool)

(assert (=> start!71948 m!780869))

(declare-fun m!780871 () Bool)

(assert (=> start!71948 m!780871))

(check-sat (not start!71948) (not b!835974))
(check-sat)
(get-model)

(declare-fun d!107345 () Bool)

(declare-fun res!568847 () Bool)

(declare-fun e!466359 () Bool)

(assert (=> d!107345 (=> res!568847 e!466359)))

(get-info :version)

(assert (=> d!107345 (= res!568847 (or ((_ is Nil!15969) (toList!4518 thiss!193)) ((_ is Nil!15969) (t!22334 (toList!4518 thiss!193)))))))

(assert (=> d!107345 (= (isStrictlySorted!439 (toList!4518 thiss!193)) e!466359)))

(declare-fun b!835993 () Bool)

(declare-fun e!466360 () Bool)

(assert (=> b!835993 (= e!466359 e!466360)))

(declare-fun res!568848 () Bool)

(assert (=> b!835993 (=> (not res!568848) (not e!466360))))

(assert (=> b!835993 (= res!568848 (bvslt (_1!5113 (h!17099 (toList!4518 thiss!193))) (_1!5113 (h!17099 (t!22334 (toList!4518 thiss!193))))))))

(declare-fun b!835994 () Bool)

(assert (=> b!835994 (= e!466360 (isStrictlySorted!439 (t!22334 (toList!4518 thiss!193))))))

(assert (= (and d!107345 (not res!568847)) b!835993))

(assert (= (and b!835993 res!568848) b!835994))

(declare-fun m!780881 () Bool)

(assert (=> b!835994 m!780881))

(assert (=> start!71948 d!107345))

(declare-fun d!107351 () Bool)

(assert (=> d!107351 (= (inv!27240 thiss!193) (isStrictlySorted!439 (toList!4518 thiss!193)))))

(declare-fun bs!23439 () Bool)

(assert (= bs!23439 d!107351))

(assert (=> bs!23439 m!780869))

(assert (=> start!71948 d!107351))

(declare-fun b!836011 () Bool)

(declare-fun e!466371 () Bool)

(declare-fun tp_is_empty!15241 () Bool)

(declare-fun tp!47399 () Bool)

(assert (=> b!836011 (= e!466371 (and tp_is_empty!15241 tp!47399))))

(assert (=> b!835974 (= tp!47387 e!466371)))

(assert (= (and b!835974 ((_ is Cons!15968) (toList!4518 thiss!193))) b!836011))

(check-sat (not d!107351) (not b!835994) (not b!836011) tp_is_empty!15241)
(check-sat)
