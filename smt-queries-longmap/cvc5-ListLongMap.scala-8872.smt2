; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107708 () Bool)

(assert start!107708)

(declare-datatypes ((B!2102 0))(
  ( (B!2103 (val!16647 Int)) )
))
(declare-datatypes ((tuple2!21376 0))(
  ( (tuple2!21377 (_1!10699 (_ BitVec 64)) (_2!10699 B!2102)) )
))
(declare-datatypes ((List!28573 0))(
  ( (Nil!28570) (Cons!28569 (h!29778 tuple2!21376) (t!42106 List!28573)) )
))
(declare-datatypes ((ListLongMap!19105 0))(
  ( (ListLongMap!19106 (toList!9568 List!28573)) )
))
(declare-fun thiss!217 () ListLongMap!19105)

(declare-fun isStrictlySorted!835 (List!28573) Bool)

(assert (=> start!107708 (not (isStrictlySorted!835 (toList!9568 thiss!217)))))

(declare-fun e!727210 () Bool)

(declare-fun inv!44691 (ListLongMap!19105) Bool)

(assert (=> start!107708 (and (inv!44691 thiss!217) e!727210)))

(declare-fun b!1274325 () Bool)

(declare-fun tp!97895 () Bool)

(assert (=> b!1274325 (= e!727210 tp!97895)))

(assert (= start!107708 b!1274325))

(declare-fun m!1171123 () Bool)

(assert (=> start!107708 m!1171123))

(declare-fun m!1171125 () Bool)

(assert (=> start!107708 m!1171125))

(push 1)

(assert (not start!107708))

(assert (not b!1274325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140115 () Bool)

(declare-fun res!847229 () Bool)

(declare-fun e!727223 () Bool)

(assert (=> d!140115 (=> res!847229 e!727223)))

(assert (=> d!140115 (= res!847229 (or (is-Nil!28570 (toList!9568 thiss!217)) (is-Nil!28570 (t!42106 (toList!9568 thiss!217)))))))

(assert (=> d!140115 (= (isStrictlySorted!835 (toList!9568 thiss!217)) e!727223)))

(declare-fun b!1274338 () Bool)

(declare-fun e!727224 () Bool)

(assert (=> b!1274338 (= e!727223 e!727224)))

(declare-fun res!847230 () Bool)

(assert (=> b!1274338 (=> (not res!847230) (not e!727224))))

(assert (=> b!1274338 (= res!847230 (bvslt (_1!10699 (h!29778 (toList!9568 thiss!217))) (_1!10699 (h!29778 (t!42106 (toList!9568 thiss!217))))))))

(declare-fun b!1274339 () Bool)

(assert (=> b!1274339 (= e!727224 (isStrictlySorted!835 (t!42106 (toList!9568 thiss!217))))))

(assert (= (and d!140115 (not res!847229)) b!1274338))

(assert (= (and b!1274338 res!847230) b!1274339))

(declare-fun m!1171135 () Bool)

(assert (=> b!1274339 m!1171135))

(assert (=> start!107708 d!140115))

(declare-fun d!140121 () Bool)

(assert (=> d!140121 (= (inv!44691 thiss!217) (isStrictlySorted!835 (toList!9568 thiss!217)))))

(declare-fun bs!36177 () Bool)

(assert (= bs!36177 d!140121))

(assert (=> bs!36177 m!1171123))

(assert (=> start!107708 d!140121))

(declare-fun b!1274348 () Bool)

(declare-fun e!727231 () Bool)

(declare-fun tp_is_empty!33145 () Bool)

(declare-fun tp!97904 () Bool)

(assert (=> b!1274348 (= e!727231 (and tp_is_empty!33145 tp!97904))))

(assert (=> b!1274325 (= tp!97895 e!727231)))

(assert (= (and b!1274325 (is-Cons!28569 (toList!9568 thiss!217))) b!1274348))

(push 1)

(assert (not d!140121))

(assert (not b!1274339))

(assert (not b!1274348))

