; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1280 () Bool)

(assert start!1280)

(declare-fun b_free!399 () Bool)

(declare-fun b_next!399 () Bool)

(assert (=> start!1280 (= b_free!399 (not b_next!399))))

(declare-fun tp!1580 () Bool)

(declare-fun b_and!569 () Bool)

(assert (=> start!1280 (= tp!1580 b_and!569)))

(declare-fun b!10567 () Bool)

(declare-fun res!8970 () Bool)

(declare-fun e!6137 () Bool)

(assert (=> b!10567 (=> (not res!8970) (not e!6137))))

(declare-datatypes ((B!340 0))(
  ( (B!341 (val!265 Int)) )
))
(declare-datatypes ((tuple2!330 0))(
  ( (tuple2!331 (_1!165 (_ BitVec 64)) (_2!165 B!340)) )
))
(declare-datatypes ((List!317 0))(
  ( (Nil!314) (Cons!313 (h!879 tuple2!330) (t!2476 List!317)) )
))
(declare-fun kvs!4 () List!317)

(declare-fun isEmpty!49 (List!317) Bool)

(assert (=> b!10567 (= res!8970 (not (isEmpty!49 kvs!4)))))

(declare-fun b!10568 () Bool)

(declare-fun e!6135 () Bool)

(declare-fun tp_is_empty!513 () Bool)

(declare-fun tp!1579 () Bool)

(assert (=> b!10568 (= e!6135 (and tp_is_empty!513 tp!1579))))

(declare-fun res!8969 () Bool)

(assert (=> start!1280 (=> (not res!8969) (not e!6137))))

(declare-datatypes ((ListLongMap!311 0))(
  ( (ListLongMap!312 (toList!171 List!317)) )
))
(declare-fun lm!227 () ListLongMap!311)

(declare-fun p!216 () Int)

(declare-fun forall!39 (List!317 Int) Bool)

(assert (=> start!1280 (= res!8969 (forall!39 (toList!171 lm!227) p!216))))

(assert (=> start!1280 e!6137))

(declare-fun e!6136 () Bool)

(declare-fun inv!495 (ListLongMap!311) Bool)

(assert (=> start!1280 (and (inv!495 lm!227) e!6136)))

(assert (=> start!1280 tp!1580))

(assert (=> start!1280 e!6135))

(declare-fun b!10569 () Bool)

(assert (=> b!10569 (= e!6137 (= kvs!4 Nil!314))))

(declare-fun b!10570 () Bool)

(declare-fun res!8971 () Bool)

(assert (=> b!10570 (=> (not res!8971) (not e!6137))))

(assert (=> b!10570 (= res!8971 (forall!39 kvs!4 p!216))))

(declare-fun b!10571 () Bool)

(declare-fun tp!1578 () Bool)

(assert (=> b!10571 (= e!6136 tp!1578)))

(assert (= (and start!1280 res!8969) b!10570))

(assert (= (and b!10570 res!8971) b!10567))

(assert (= (and b!10567 res!8970) b!10569))

(assert (= start!1280 b!10571))

(get-info :version)

(assert (= (and start!1280 ((_ is Cons!313) kvs!4)) b!10568))

(declare-fun m!6805 () Bool)

(assert (=> b!10567 m!6805))

(declare-fun m!6807 () Bool)

(assert (=> start!1280 m!6807))

(declare-fun m!6809 () Bool)

(assert (=> start!1280 m!6809))

(declare-fun m!6811 () Bool)

(assert (=> b!10570 m!6811))

(check-sat (not b!10570) (not b!10568) b_and!569 (not b!10567) (not b_next!399) (not start!1280) (not b!10571) tp_is_empty!513)
(check-sat b_and!569 (not b_next!399))
(get-model)

(declare-fun d!1143 () Bool)

(declare-fun res!8997 () Bool)

(declare-fun e!6163 () Bool)

(assert (=> d!1143 (=> res!8997 e!6163)))

(assert (=> d!1143 (= res!8997 ((_ is Nil!314) (toList!171 lm!227)))))

(assert (=> d!1143 (= (forall!39 (toList!171 lm!227) p!216) e!6163)))

(declare-fun b!10603 () Bool)

(declare-fun e!6164 () Bool)

(assert (=> b!10603 (= e!6163 e!6164)))

(declare-fun res!8998 () Bool)

(assert (=> b!10603 (=> (not res!8998) (not e!6164))))

(declare-fun dynLambda!53 (Int tuple2!330) Bool)

(assert (=> b!10603 (= res!8998 (dynLambda!53 p!216 (h!879 (toList!171 lm!227))))))

(declare-fun b!10604 () Bool)

(assert (=> b!10604 (= e!6164 (forall!39 (t!2476 (toList!171 lm!227)) p!216))))

(assert (= (and d!1143 (not res!8997)) b!10603))

(assert (= (and b!10603 res!8998) b!10604))

(declare-fun b_lambda!387 () Bool)

(assert (=> (not b_lambda!387) (not b!10603)))

(declare-fun t!2483 () Bool)

(declare-fun tb!163 () Bool)

(assert (=> (and start!1280 (= p!216 p!216) t!2483) tb!163))

(declare-fun result!295 () Bool)

(assert (=> tb!163 (= result!295 true)))

(assert (=> b!10603 t!2483))

(declare-fun b_and!577 () Bool)

(assert (= b_and!569 (and (=> t!2483 result!295) b_and!577)))

(declare-fun m!6831 () Bool)

(assert (=> b!10603 m!6831))

(declare-fun m!6833 () Bool)

(assert (=> b!10604 m!6833))

(assert (=> start!1280 d!1143))

(declare-fun d!1153 () Bool)

(declare-fun isStrictlySorted!28 (List!317) Bool)

(assert (=> d!1153 (= (inv!495 lm!227) (isStrictlySorted!28 (toList!171 lm!227)))))

(declare-fun bs!391 () Bool)

(assert (= bs!391 d!1153))

(declare-fun m!6843 () Bool)

(assert (=> bs!391 m!6843))

(assert (=> start!1280 d!1153))

(declare-fun d!1159 () Bool)

(declare-fun res!9003 () Bool)

(declare-fun e!6173 () Bool)

(assert (=> d!1159 (=> res!9003 e!6173)))

(assert (=> d!1159 (= res!9003 ((_ is Nil!314) kvs!4))))

(assert (=> d!1159 (= (forall!39 kvs!4 p!216) e!6173)))

(declare-fun b!10615 () Bool)

(declare-fun e!6174 () Bool)

(assert (=> b!10615 (= e!6173 e!6174)))

(declare-fun res!9004 () Bool)

(assert (=> b!10615 (=> (not res!9004) (not e!6174))))

(assert (=> b!10615 (= res!9004 (dynLambda!53 p!216 (h!879 kvs!4)))))

(declare-fun b!10616 () Bool)

(assert (=> b!10616 (= e!6174 (forall!39 (t!2476 kvs!4) p!216))))

(assert (= (and d!1159 (not res!9003)) b!10615))

(assert (= (and b!10615 res!9004) b!10616))

(declare-fun b_lambda!397 () Bool)

(assert (=> (not b_lambda!397) (not b!10615)))

(declare-fun t!2489 () Bool)

(declare-fun tb!169 () Bool)

(assert (=> (and start!1280 (= p!216 p!216) t!2489) tb!169))

(declare-fun result!303 () Bool)

(assert (=> tb!169 (= result!303 true)))

(assert (=> b!10615 t!2489))

(declare-fun b_and!583 () Bool)

(assert (= b_and!577 (and (=> t!2489 result!303) b_and!583)))

(declare-fun m!6845 () Bool)

(assert (=> b!10615 m!6845))

(declare-fun m!6847 () Bool)

(assert (=> b!10616 m!6847))

