; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2310 () Bool)

(assert start!2310)

(declare-fun res!11527 () Bool)

(declare-fun e!9160 () Bool)

(assert (=> start!2310 (=> (not res!11527) (not e!9160))))

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

(assert (=> start!2310 (= res!11527 (not (isEmpty!111 thiss!169)))))

(assert (=> start!2310 e!9160))

(declare-fun e!9161 () Bool)

(declare-fun inv!752 (ListLongMap!407) Bool)

(assert (=> start!2310 (and (inv!752 thiss!169) e!9161)))

(declare-fun b!15160 () Bool)

(assert (=> b!15160 (= e!9160 (= (toList!219 thiss!169) Nil!441))))

(declare-fun b!15161 () Bool)

(declare-fun tp!2447 () Bool)

(assert (=> b!15161 (= e!9161 tp!2447)))

(assert (= (and start!2310 res!11527) b!15160))

(assert (= start!2310 b!15161))

(declare-fun m!10089 () Bool)

(assert (=> start!2310 m!10089))

(declare-fun m!10091 () Bool)

(assert (=> start!2310 m!10091))

(check-sat (not start!2310) (not b!15161))
(check-sat)
(get-model)

(declare-fun d!2528 () Bool)

(declare-fun isEmpty!115 (List!444) Bool)

(assert (=> d!2528 (= (isEmpty!111 thiss!169) (isEmpty!115 (toList!219 thiss!169)))))

(declare-fun bs!634 () Bool)

(assert (= bs!634 d!2528))

(declare-fun m!10104 () Bool)

(assert (=> bs!634 m!10104))

(assert (=> start!2310 d!2528))

(declare-fun d!2535 () Bool)

(declare-fun isStrictlySorted!131 (List!444) Bool)

(assert (=> d!2535 (= (inv!752 thiss!169) (isStrictlySorted!131 (toList!219 thiss!169)))))

(declare-fun bs!637 () Bool)

(assert (= bs!637 d!2535))

(declare-fun m!10111 () Bool)

(assert (=> bs!637 m!10111))

(assert (=> start!2310 d!2535))

(declare-fun b!15188 () Bool)

(declare-fun e!9182 () Bool)

(declare-fun tp_is_empty!766 () Bool)

(declare-fun tp!2462 () Bool)

(assert (=> b!15188 (= e!9182 (and tp_is_empty!766 tp!2462))))

(assert (=> b!15161 (= tp!2447 e!9182)))

(get-info :version)

(assert (= (and b!15161 ((_ is Cons!440) (toList!219 thiss!169))) b!15188))

(check-sat (not d!2535) (not d!2528) (not b!15188) tp_is_empty!766)
(check-sat)
(get-model)

(declare-fun d!2537 () Bool)

(declare-fun res!11548 () Bool)

(declare-fun e!9198 () Bool)

(assert (=> d!2537 (=> res!11548 e!9198)))

(assert (=> d!2537 (= res!11548 (or ((_ is Nil!441) (toList!219 thiss!169)) ((_ is Nil!441) (t!2846 (toList!219 thiss!169)))))))

(assert (=> d!2537 (= (isStrictlySorted!131 (toList!219 thiss!169)) e!9198)))

(declare-fun b!15204 () Bool)

(declare-fun e!9199 () Bool)

(assert (=> b!15204 (= e!9198 e!9199)))

(declare-fun res!11549 () Bool)

(assert (=> b!15204 (=> (not res!11549) (not e!9199))))

(assert (=> b!15204 (= res!11549 (bvslt (_1!288 (h!1006 (toList!219 thiss!169))) (_1!288 (h!1006 (t!2846 (toList!219 thiss!169))))))))

(declare-fun b!15205 () Bool)

(assert (=> b!15205 (= e!9199 (isStrictlySorted!131 (t!2846 (toList!219 thiss!169))))))

(assert (= (and d!2537 (not res!11548)) b!15204))

(assert (= (and b!15204 res!11549) b!15205))

(declare-fun m!10115 () Bool)

(assert (=> b!15205 m!10115))

(assert (=> d!2535 d!2537))

(declare-fun d!2545 () Bool)

(assert (=> d!2545 (= (isEmpty!115 (toList!219 thiss!169)) ((_ is Nil!441) (toList!219 thiss!169)))))

(assert (=> d!2528 d!2545))

(declare-fun b!15208 () Bool)

(declare-fun e!9202 () Bool)

(declare-fun tp!2464 () Bool)

(assert (=> b!15208 (= e!9202 (and tp_is_empty!766 tp!2464))))

(assert (=> b!15188 (= tp!2462 e!9202)))

(assert (= (and b!15188 ((_ is Cons!440) (t!2846 (toList!219 thiss!169)))) b!15208))

(check-sat (not b!15205) (not b!15208) tp_is_empty!766)
(check-sat)
