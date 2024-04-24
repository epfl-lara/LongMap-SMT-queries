; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2310 () Bool)

(assert start!2310)

(declare-fun res!11525 () Bool)

(declare-fun e!9156 () Bool)

(assert (=> start!2310 (=> (not res!11525) (not e!9156))))

(declare-datatypes ((B!584 0))(
  ( (B!585 (val!390 Int)) )
))
(declare-datatypes ((tuple2!576 0))(
  ( (tuple2!577 (_1!288 (_ BitVec 64)) (_2!288 B!584)) )
))
(declare-datatypes ((List!444 0))(
  ( (Nil!441) (Cons!440 (h!1006 tuple2!576) (t!2846 List!444)) )
))
(declare-datatypes ((ListLongMap!407 0))(
  ( (ListLongMap!408 (toList!219 List!444)) )
))
(declare-fun thiss!169 () ListLongMap!407)

(declare-fun isEmpty!111 (ListLongMap!407) Bool)

(assert (=> start!2310 (= res!11525 (not (isEmpty!111 thiss!169)))))

(assert (=> start!2310 e!9156))

(declare-fun e!9157 () Bool)

(declare-fun inv!752 (ListLongMap!407) Bool)

(assert (=> start!2310 (and (inv!752 thiss!169) e!9157)))

(declare-fun b!15154 () Bool)

(assert (=> b!15154 (= e!9156 (= (toList!219 thiss!169) Nil!441))))

(declare-fun b!15155 () Bool)

(declare-fun tp!2447 () Bool)

(assert (=> b!15155 (= e!9157 tp!2447)))

(assert (= (and start!2310 res!11525) b!15154))

(assert (= start!2310 b!15155))

(declare-fun m!10089 () Bool)

(assert (=> start!2310 m!10089))

(declare-fun m!10091 () Bool)

(assert (=> start!2310 m!10091))

(check-sat (not start!2310) (not b!15155))
(check-sat)
(get-model)

(declare-fun d!2521 () Bool)

(declare-fun isEmpty!114 (List!444) Bool)

(assert (=> d!2521 (= (isEmpty!111 thiss!169) (isEmpty!114 (toList!219 thiss!169)))))

(declare-fun bs!633 () Bool)

(assert (= bs!633 d!2521))

(declare-fun m!10101 () Bool)

(assert (=> bs!633 m!10101))

(assert (=> start!2310 d!2521))

(declare-fun d!2525 () Bool)

(declare-fun isStrictlySorted!126 (List!444) Bool)

(assert (=> d!2525 (= (inv!752 thiss!169) (isStrictlySorted!126 (toList!219 thiss!169)))))

(declare-fun bs!635 () Bool)

(assert (= bs!635 d!2525))

(declare-fun m!10105 () Bool)

(assert (=> bs!635 m!10105))

(assert (=> start!2310 d!2525))

(declare-fun b!15172 () Bool)

(declare-fun e!9172 () Bool)

(declare-fun tp_is_empty!763 () Bool)

(declare-fun tp!2456 () Bool)

(assert (=> b!15172 (= e!9172 (and tp_is_empty!763 tp!2456))))

(assert (=> b!15155 (= tp!2447 e!9172)))

(get-info :version)

(assert (= (and b!15155 ((_ is Cons!440) (toList!219 thiss!169))) b!15172))

(check-sat (not d!2521) (not d!2525) (not b!15172) tp_is_empty!763)
(check-sat)
(get-model)

(declare-fun d!2533 () Bool)

(assert (=> d!2533 (= (isEmpty!114 (toList!219 thiss!169)) ((_ is Nil!441) (toList!219 thiss!169)))))

(assert (=> d!2521 d!2533))

(declare-fun d!2535 () Bool)

(declare-fun res!11536 () Bool)

(declare-fun e!9183 () Bool)

(assert (=> d!2535 (=> res!11536 e!9183)))

(assert (=> d!2535 (= res!11536 (or ((_ is Nil!441) (toList!219 thiss!169)) ((_ is Nil!441) (t!2846 (toList!219 thiss!169)))))))

(assert (=> d!2535 (= (isStrictlySorted!126 (toList!219 thiss!169)) e!9183)))

(declare-fun b!15187 () Bool)

(declare-fun e!9184 () Bool)

(assert (=> b!15187 (= e!9183 e!9184)))

(declare-fun res!11537 () Bool)

(assert (=> b!15187 (=> (not res!11537) (not e!9184))))

(assert (=> b!15187 (= res!11537 (bvslt (_1!288 (h!1006 (toList!219 thiss!169))) (_1!288 (h!1006 (t!2846 (toList!219 thiss!169))))))))

(declare-fun b!15188 () Bool)

(assert (=> b!15188 (= e!9184 (isStrictlySorted!126 (t!2846 (toList!219 thiss!169))))))

(assert (= (and d!2535 (not res!11536)) b!15187))

(assert (= (and b!15187 res!11537) b!15188))

(declare-fun m!10113 () Bool)

(assert (=> b!15188 m!10113))

(assert (=> d!2525 d!2535))

(declare-fun b!15189 () Bool)

(declare-fun e!9185 () Bool)

(declare-fun tp!2463 () Bool)

(assert (=> b!15189 (= e!9185 (and tp_is_empty!763 tp!2463))))

(assert (=> b!15172 (= tp!2456 e!9185)))

(assert (= (and b!15172 ((_ is Cons!440) (t!2846 (toList!219 thiss!169)))) b!15189))

(check-sat (not b!15188) (not b!15189) tp_is_empty!763)
(check-sat)
