; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7786 () Bool)

(assert start!7786)

(declare-datatypes ((B!1004 0))(
  ( (B!1005 (val!1122 Int)) )
))
(declare-datatypes ((tuple2!1808 0))(
  ( (tuple2!1809 (_1!915 (_ BitVec 64)) (_2!915 B!1004)) )
))
(declare-datatypes ((List!1305 0))(
  ( (Nil!1302) (Cons!1301 (h!1881 tuple2!1808) (t!4339 List!1305)) )
))
(declare-datatypes ((ListLongMap!1223 0))(
  ( (ListLongMap!1224 (toList!627 List!1305)) )
))
(declare-fun thiss!192 () ListLongMap!1223)

(declare-fun isStrictlySorted!265 (List!1305) Bool)

(assert (=> start!7786 (not (isStrictlySorted!265 (toList!627 thiss!192)))))

(declare-fun e!31710 () Bool)

(declare-fun inv!2304 (ListLongMap!1223) Bool)

(assert (=> start!7786 (and (inv!2304 thiss!192) e!31710)))

(declare-fun b!49358 () Bool)

(declare-fun tp!6533 () Bool)

(assert (=> b!49358 (= e!31710 tp!6533)))

(assert (= start!7786 b!49358))

(declare-fun m!42713 () Bool)

(assert (=> start!7786 m!42713))

(declare-fun m!42715 () Bool)

(assert (=> start!7786 m!42715))

(check-sat (not start!7786) (not b!49358))
(check-sat)
(get-model)

(declare-fun d!9883 () Bool)

(declare-fun res!28583 () Bool)

(declare-fun e!31729 () Bool)

(assert (=> d!9883 (=> res!28583 e!31729)))

(get-info :version)

(assert (=> d!9883 (= res!28583 (or ((_ is Nil!1302) (toList!627 thiss!192)) ((_ is Nil!1302) (t!4339 (toList!627 thiss!192)))))))

(assert (=> d!9883 (= (isStrictlySorted!265 (toList!627 thiss!192)) e!31729)))

(declare-fun b!49377 () Bool)

(declare-fun e!31731 () Bool)

(assert (=> b!49377 (= e!31729 e!31731)))

(declare-fun res!28585 () Bool)

(assert (=> b!49377 (=> (not res!28585) (not e!31731))))

(assert (=> b!49377 (= res!28585 (bvslt (_1!915 (h!1881 (toList!627 thiss!192))) (_1!915 (h!1881 (t!4339 (toList!627 thiss!192))))))))

(declare-fun b!49379 () Bool)

(assert (=> b!49379 (= e!31731 (isStrictlySorted!265 (t!4339 (toList!627 thiss!192))))))

(assert (= (and d!9883 (not res!28583)) b!49377))

(assert (= (and b!49377 res!28585) b!49379))

(declare-fun m!42726 () Bool)

(assert (=> b!49379 m!42726))

(assert (=> start!7786 d!9883))

(declare-fun d!9891 () Bool)

(assert (=> d!9891 (= (inv!2304 thiss!192) (isStrictlySorted!265 (toList!627 thiss!192)))))

(declare-fun bs!2297 () Bool)

(assert (= bs!2297 d!9891))

(assert (=> bs!2297 m!42713))

(assert (=> start!7786 d!9891))

(declare-fun b!49397 () Bool)

(declare-fun e!31743 () Bool)

(declare-fun tp_is_empty!2159 () Bool)

(declare-fun tp!6548 () Bool)

(assert (=> b!49397 (= e!31743 (and tp_is_empty!2159 tp!6548))))

(assert (=> b!49358 (= tp!6533 e!31743)))

(assert (= (and b!49358 ((_ is Cons!1301) (toList!627 thiss!192))) b!49397))

(check-sat (not b!49379) (not d!9891) (not b!49397) tp_is_empty!2159)
(check-sat)
