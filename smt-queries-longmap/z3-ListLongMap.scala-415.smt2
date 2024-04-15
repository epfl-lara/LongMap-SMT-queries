; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7782 () Bool)

(assert start!7782)

(declare-datatypes ((B!1004 0))(
  ( (B!1005 (val!1122 Int)) )
))
(declare-datatypes ((tuple2!1830 0))(
  ( (tuple2!1831 (_1!926 (_ BitVec 64)) (_2!926 B!1004)) )
))
(declare-datatypes ((List!1315 0))(
  ( (Nil!1312) (Cons!1311 (h!1891 tuple2!1830) (t!4348 List!1315)) )
))
(declare-datatypes ((ListLongMap!1239 0))(
  ( (ListLongMap!1240 (toList!635 List!1315)) )
))
(declare-fun thiss!192 () ListLongMap!1239)

(declare-fun isStrictlySorted!272 (List!1315) Bool)

(assert (=> start!7782 (not (isStrictlySorted!272 (toList!635 thiss!192)))))

(declare-fun e!31704 () Bool)

(declare-fun inv!2304 (ListLongMap!1239) Bool)

(assert (=> start!7782 (and (inv!2304 thiss!192) e!31704)))

(declare-fun b!49349 () Bool)

(declare-fun tp!6533 () Bool)

(assert (=> b!49349 (= e!31704 tp!6533)))

(assert (= start!7782 b!49349))

(declare-fun m!42755 () Bool)

(assert (=> start!7782 m!42755))

(declare-fun m!42757 () Bool)

(assert (=> start!7782 m!42757))

(check-sat (not start!7782) (not b!49349))
(check-sat)
(get-model)

(declare-fun d!9869 () Bool)

(declare-fun res!28592 () Bool)

(declare-fun e!31727 () Bool)

(assert (=> d!9869 (=> res!28592 e!31727)))

(get-info :version)

(assert (=> d!9869 (= res!28592 (or ((_ is Nil!1312) (toList!635 thiss!192)) ((_ is Nil!1312) (t!4348 (toList!635 thiss!192)))))))

(assert (=> d!9869 (= (isStrictlySorted!272 (toList!635 thiss!192)) e!31727)))

(declare-fun b!49372 () Bool)

(declare-fun e!31728 () Bool)

(assert (=> b!49372 (= e!31727 e!31728)))

(declare-fun res!28593 () Bool)

(assert (=> b!49372 (=> (not res!28593) (not e!31728))))

(assert (=> b!49372 (= res!28593 (bvslt (_1!926 (h!1891 (toList!635 thiss!192))) (_1!926 (h!1891 (t!4348 (toList!635 thiss!192))))))))

(declare-fun b!49373 () Bool)

(assert (=> b!49373 (= e!31728 (isStrictlySorted!272 (t!4348 (toList!635 thiss!192))))))

(assert (= (and d!9869 (not res!28592)) b!49372))

(assert (= (and b!49372 res!28593) b!49373))

(declare-fun m!42769 () Bool)

(assert (=> b!49373 m!42769))

(assert (=> start!7782 d!9869))

(declare-fun d!9876 () Bool)

(assert (=> d!9876 (= (inv!2304 thiss!192) (isStrictlySorted!272 (toList!635 thiss!192)))))

(declare-fun bs!2297 () Bool)

(assert (= bs!2297 d!9876))

(assert (=> bs!2297 m!42755))

(assert (=> start!7782 d!9876))

(declare-fun b!49387 () Bool)

(declare-fun e!31736 () Bool)

(declare-fun tp_is_empty!2159 () Bool)

(declare-fun tp!6547 () Bool)

(assert (=> b!49387 (= e!31736 (and tp_is_empty!2159 tp!6547))))

(assert (=> b!49349 (= tp!6533 e!31736)))

(assert (= (and b!49349 ((_ is Cons!1311) (toList!635 thiss!192))) b!49387))

(check-sat (not b!49373) (not d!9876) (not b!49387) tp_is_empty!2159)
(check-sat)
