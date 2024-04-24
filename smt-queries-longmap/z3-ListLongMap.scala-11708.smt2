; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137360 () Bool)

(assert start!137360)

(declare-datatypes ((B!2576 0))(
  ( (B!2577 (val!19650 Int)) )
))
(declare-datatypes ((tuple2!25462 0))(
  ( (tuple2!25463 (_1!12742 (_ BitVec 64)) (_2!12742 B!2576)) )
))
(declare-datatypes ((List!36802 0))(
  ( (Nil!36799) (Cons!36798 (h!38359 tuple2!25462) (t!51708 List!36802)) )
))
(declare-datatypes ((ListLongMap!22809 0))(
  ( (ListLongMap!22810 (toList!11420 List!36802)) )
))
(declare-fun thiss!201 () ListLongMap!22809)

(declare-fun isStrictlySorted!1019 (List!36802) Bool)

(assert (=> start!137360 (not (isStrictlySorted!1019 (toList!11420 thiss!201)))))

(declare-fun e!882482 () Bool)

(declare-fun inv!58946 (ListLongMap!22809) Bool)

(assert (=> start!137360 (and (inv!58946 thiss!201) e!882482)))

(declare-fun b!1581732 () Bool)

(declare-fun tp!114297 () Bool)

(assert (=> b!1581732 (= e!882482 tp!114297)))

(assert (= start!137360 b!1581732))

(declare-fun m!1453437 () Bool)

(assert (=> start!137360 m!1453437))

(declare-fun m!1453439 () Bool)

(assert (=> start!137360 m!1453439))

(check-sat (not start!137360) (not b!1581732))
(check-sat)
(get-model)

(declare-fun d!166957 () Bool)

(declare-fun res!1079930 () Bool)

(declare-fun e!882497 () Bool)

(assert (=> d!166957 (=> res!1079930 e!882497)))

(get-info :version)

(assert (=> d!166957 (= res!1079930 (or ((_ is Nil!36799) (toList!11420 thiss!201)) ((_ is Nil!36799) (t!51708 (toList!11420 thiss!201)))))))

(assert (=> d!166957 (= (isStrictlySorted!1019 (toList!11420 thiss!201)) e!882497)))

(declare-fun b!1581743 () Bool)

(declare-fun e!882498 () Bool)

(assert (=> b!1581743 (= e!882497 e!882498)))

(declare-fun res!1079931 () Bool)

(assert (=> b!1581743 (=> (not res!1079931) (not e!882498))))

(assert (=> b!1581743 (= res!1079931 (bvslt (_1!12742 (h!38359 (toList!11420 thiss!201))) (_1!12742 (h!38359 (t!51708 (toList!11420 thiss!201))))))))

(declare-fun b!1581744 () Bool)

(assert (=> b!1581744 (= e!882498 (isStrictlySorted!1019 (t!51708 (toList!11420 thiss!201))))))

(assert (= (and d!166957 (not res!1079930)) b!1581743))

(assert (= (and b!1581743 res!1079931) b!1581744))

(declare-fun m!1453449 () Bool)

(assert (=> b!1581744 m!1453449))

(assert (=> start!137360 d!166957))

(declare-fun d!166963 () Bool)

(assert (=> d!166963 (= (inv!58946 thiss!201) (isStrictlySorted!1019 (toList!11420 thiss!201)))))

(declare-fun bs!45756 () Bool)

(assert (= bs!45756 d!166963))

(assert (=> bs!45756 m!1453437))

(assert (=> start!137360 d!166963))

(declare-fun b!1581757 () Bool)

(declare-fun e!882505 () Bool)

(declare-fun tp_is_empty!39121 () Bool)

(declare-fun tp!114306 () Bool)

(assert (=> b!1581757 (= e!882505 (and tp_is_empty!39121 tp!114306))))

(assert (=> b!1581732 (= tp!114297 e!882505)))

(assert (= (and b!1581732 ((_ is Cons!36798) (toList!11420 thiss!201))) b!1581757))

(check-sat (not d!166963) (not b!1581744) (not b!1581757) tp_is_empty!39121)
(check-sat)
