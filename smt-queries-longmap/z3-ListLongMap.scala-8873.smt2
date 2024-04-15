; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107726 () Bool)

(assert start!107726)

(declare-datatypes ((B!2108 0))(
  ( (B!2109 (val!16650 Int)) )
))
(declare-datatypes ((tuple2!21458 0))(
  ( (tuple2!21459 (_1!10740 (_ BitVec 64)) (_2!10740 B!2108)) )
))
(declare-datatypes ((List!28649 0))(
  ( (Nil!28646) (Cons!28645 (h!29854 tuple2!21458) (t!42174 List!28649)) )
))
(declare-datatypes ((ListLongMap!19187 0))(
  ( (ListLongMap!19188 (toList!9609 List!28649)) )
))
(declare-fun thiss!217 () ListLongMap!19187)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun inv!44699 (ListLongMap!19187) Bool)

(declare-fun removeStrictlySorted!173 (List!28649 (_ BitVec 64)) List!28649)

(assert (=> start!107726 (not (inv!44699 (ListLongMap!19188 (removeStrictlySorted!173 (toList!9609 thiss!217) key!129))))))

(declare-fun e!727217 () Bool)

(assert (=> start!107726 (and (inv!44699 thiss!217) e!727217)))

(assert (=> start!107726 true))

(declare-fun b!1274303 () Bool)

(declare-fun tp!97914 () Bool)

(assert (=> b!1274303 (= e!727217 tp!97914)))

(assert (= start!107726 b!1274303))

(declare-fun m!1170641 () Bool)

(assert (=> start!107726 m!1170641))

(declare-fun m!1170643 () Bool)

(assert (=> start!107726 m!1170643))

(declare-fun m!1170645 () Bool)

(assert (=> start!107726 m!1170645))

(check-sat (not start!107726) (not b!1274303))
(check-sat)
(get-model)

(declare-fun d!140021 () Bool)

(declare-fun isStrictlySorted!836 (List!28649) Bool)

(assert (=> d!140021 (= (inv!44699 (ListLongMap!19188 (removeStrictlySorted!173 (toList!9609 thiss!217) key!129))) (isStrictlySorted!836 (toList!9609 (ListLongMap!19188 (removeStrictlySorted!173 (toList!9609 thiss!217) key!129)))))))

(declare-fun bs!36158 () Bool)

(assert (= bs!36158 d!140021))

(declare-fun m!1170663 () Bool)

(assert (=> bs!36158 m!1170663))

(assert (=> start!107726 d!140021))

(declare-fun b!1274350 () Bool)

(declare-fun e!727248 () Bool)

(declare-fun lt!575048 () List!28649)

(declare-fun containsKey!692 (List!28649 (_ BitVec 64)) Bool)

(assert (=> b!1274350 (= e!727248 (not (containsKey!692 lt!575048 key!129)))))

(declare-fun b!1274351 () Bool)

(declare-fun e!727249 () List!28649)

(declare-fun $colon$colon!657 (List!28649 tuple2!21458) List!28649)

(assert (=> b!1274351 (= e!727249 ($colon$colon!657 (removeStrictlySorted!173 (t!42174 (toList!9609 thiss!217)) key!129) (h!29854 (toList!9609 thiss!217))))))

(declare-fun b!1274352 () Bool)

(assert (=> b!1274352 (= e!727249 Nil!28646)))

(declare-fun b!1274353 () Bool)

(declare-fun e!727250 () List!28649)

(assert (=> b!1274353 (= e!727250 e!727249)))

(declare-fun c!123827 () Bool)

(get-info :version)

(assert (=> b!1274353 (= c!123827 (and ((_ is Cons!28645) (toList!9609 thiss!217)) (not (= (_1!10740 (h!29854 (toList!9609 thiss!217))) key!129))))))

(declare-fun b!1274354 () Bool)

(assert (=> b!1274354 (= e!727250 (t!42174 (toList!9609 thiss!217)))))

(declare-fun d!140027 () Bool)

(assert (=> d!140027 e!727248))

(declare-fun res!847222 () Bool)

(assert (=> d!140027 (=> (not res!847222) (not e!727248))))

(assert (=> d!140027 (= res!847222 (isStrictlySorted!836 lt!575048))))

(assert (=> d!140027 (= lt!575048 e!727250)))

(declare-fun c!123826 () Bool)

(assert (=> d!140027 (= c!123826 (and ((_ is Cons!28645) (toList!9609 thiss!217)) (= (_1!10740 (h!29854 (toList!9609 thiss!217))) key!129)))))

(assert (=> d!140027 (isStrictlySorted!836 (toList!9609 thiss!217))))

(assert (=> d!140027 (= (removeStrictlySorted!173 (toList!9609 thiss!217) key!129) lt!575048)))

(assert (= (and d!140027 c!123826) b!1274354))

(assert (= (and d!140027 (not c!123826)) b!1274353))

(assert (= (and b!1274353 c!123827) b!1274351))

(assert (= (and b!1274353 (not c!123827)) b!1274352))

(assert (= (and d!140027 res!847222) b!1274350))

(declare-fun m!1170685 () Bool)

(assert (=> b!1274350 m!1170685))

(declare-fun m!1170687 () Bool)

(assert (=> b!1274351 m!1170687))

(assert (=> b!1274351 m!1170687))

(declare-fun m!1170689 () Bool)

(assert (=> b!1274351 m!1170689))

(declare-fun m!1170691 () Bool)

(assert (=> d!140027 m!1170691))

(declare-fun m!1170693 () Bool)

(assert (=> d!140027 m!1170693))

(assert (=> start!107726 d!140027))

(declare-fun d!140033 () Bool)

(assert (=> d!140033 (= (inv!44699 thiss!217) (isStrictlySorted!836 (toList!9609 thiss!217)))))

(declare-fun bs!36161 () Bool)

(assert (= bs!36161 d!140033))

(assert (=> bs!36161 m!1170693))

(assert (=> start!107726 d!140033))

(declare-fun b!1274369 () Bool)

(declare-fun e!727259 () Bool)

(declare-fun tp_is_empty!33155 () Bool)

(declare-fun tp!97929 () Bool)

(assert (=> b!1274369 (= e!727259 (and tp_is_empty!33155 tp!97929))))

(assert (=> b!1274303 (= tp!97914 e!727259)))

(assert (= (and b!1274303 ((_ is Cons!28645) (toList!9609 thiss!217))) b!1274369))

(check-sat (not d!140027) (not b!1274350) (not d!140033) (not b!1274369) (not d!140021) (not b!1274351) tp_is_empty!33155)
(check-sat)
