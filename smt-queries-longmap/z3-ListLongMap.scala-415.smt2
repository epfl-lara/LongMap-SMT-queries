; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7782 () Bool)

(assert start!7782)

(declare-datatypes ((B!1006 0))(
  ( (B!1007 (val!1123 Int)) )
))
(declare-datatypes ((tuple2!1828 0))(
  ( (tuple2!1829 (_1!925 (_ BitVec 64)) (_2!925 B!1006)) )
))
(declare-datatypes ((List!1320 0))(
  ( (Nil!1317) (Cons!1316 (h!1896 tuple2!1828) (t!4354 List!1320)) )
))
(declare-datatypes ((ListLongMap!1249 0))(
  ( (ListLongMap!1250 (toList!640 List!1320)) )
))
(declare-fun thiss!192 () ListLongMap!1249)

(declare-fun isStrictlySorted!278 (List!1320) Bool)

(assert (=> start!7782 (not (isStrictlySorted!278 (toList!640 thiss!192)))))

(declare-fun e!31750 () Bool)

(declare-fun inv!2305 (ListLongMap!1249) Bool)

(assert (=> start!7782 (and (inv!2305 thiss!192) e!31750)))

(declare-fun b!49418 () Bool)

(declare-fun tp!6536 () Bool)

(assert (=> b!49418 (= e!31750 tp!6536)))

(assert (= start!7782 b!49418))

(declare-fun m!42841 () Bool)

(assert (=> start!7782 m!42841))

(declare-fun m!42843 () Bool)

(assert (=> start!7782 m!42843))

(check-sat (not start!7782) (not b!49418))
(check-sat)
(get-model)

(declare-fun d!9895 () Bool)

(declare-fun res!28608 () Bool)

(declare-fun e!31766 () Bool)

(assert (=> d!9895 (=> res!28608 e!31766)))

(get-info :version)

(assert (=> d!9895 (= res!28608 (or ((_ is Nil!1317) (toList!640 thiss!192)) ((_ is Nil!1317) (t!4354 (toList!640 thiss!192)))))))

(assert (=> d!9895 (= (isStrictlySorted!278 (toList!640 thiss!192)) e!31766)))

(declare-fun b!49434 () Bool)

(declare-fun e!31767 () Bool)

(assert (=> b!49434 (= e!31766 e!31767)))

(declare-fun res!28609 () Bool)

(assert (=> b!49434 (=> (not res!28609) (not e!31767))))

(assert (=> b!49434 (= res!28609 (bvslt (_1!925 (h!1896 (toList!640 thiss!192))) (_1!925 (h!1896 (t!4354 (toList!640 thiss!192))))))))

(declare-fun b!49435 () Bool)

(assert (=> b!49435 (= e!31767 (isStrictlySorted!278 (t!4354 (toList!640 thiss!192))))))

(assert (= (and d!9895 (not res!28608)) b!49434))

(assert (= (and b!49434 res!28609) b!49435))

(declare-fun m!42849 () Bool)

(assert (=> b!49435 m!42849))

(assert (=> start!7782 d!9895))

(declare-fun d!9901 () Bool)

(assert (=> d!9901 (= (inv!2305 thiss!192) (isStrictlySorted!278 (toList!640 thiss!192)))))

(declare-fun bs!2296 () Bool)

(assert (= bs!2296 d!9901))

(assert (=> bs!2296 m!42841))

(assert (=> start!7782 d!9901))

(declare-fun b!49452 () Bool)

(declare-fun e!31778 () Bool)

(declare-fun tp_is_empty!2155 () Bool)

(declare-fun tp!6546 () Bool)

(assert (=> b!49452 (= e!31778 (and tp_is_empty!2155 tp!6546))))

(assert (=> b!49418 (= tp!6536 e!31778)))

(assert (= (and b!49418 ((_ is Cons!1316) (toList!640 thiss!192))) b!49452))

(check-sat (not d!9901) (not b!49435) (not b!49452) tp_is_empty!2155)
(check-sat)
