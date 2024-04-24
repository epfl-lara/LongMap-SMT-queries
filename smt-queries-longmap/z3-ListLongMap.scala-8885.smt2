; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108130 () Bool)

(assert start!108130)

(declare-fun res!848156 () Bool)

(declare-fun e!728707 () Bool)

(assert (=> start!108130 (=> (not res!848156) (not e!728707))))

(declare-datatypes ((B!2180 0))(
  ( (B!2181 (val!16686 Int)) )
))
(declare-datatypes ((tuple2!21462 0))(
  ( (tuple2!21463 (_1!10742 (_ BitVec 64)) (_2!10742 B!2180)) )
))
(declare-datatypes ((List!28640 0))(
  ( (Nil!28637) (Cons!28636 (h!29854 tuple2!21462) (t!42168 List!28640)) )
))
(declare-fun l!595 () List!28640)

(declare-fun isStrictlySorted!853 (List!28640) Bool)

(assert (=> start!108130 (= res!848156 (isStrictlySorted!853 l!595))))

(assert (=> start!108130 e!728707))

(declare-fun e!728708 () Bool)

(assert (=> start!108130 e!728708))

(assert (=> start!108130 true))

(declare-fun b!1276478 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1276478 (= e!728707 (and (or (not ((_ is Cons!28636) l!595)) (not (= (_1!10742 (h!29854 l!595)) key!173))) (or (not ((_ is Cons!28636) l!595)) (= (_1!10742 (h!29854 l!595)) key!173)) (not ((_ is Nil!28637) l!595))))))

(declare-fun b!1276479 () Bool)

(declare-fun tp_is_empty!33223 () Bool)

(declare-fun tp!98096 () Bool)

(assert (=> b!1276479 (= e!728708 (and tp_is_empty!33223 tp!98096))))

(assert (= (and start!108130 res!848156) b!1276478))

(assert (= (and start!108130 ((_ is Cons!28636) l!595)) b!1276479))

(declare-fun m!1173155 () Bool)

(assert (=> start!108130 m!1173155))

(check-sat (not start!108130) (not b!1276479) tp_is_empty!33223)
(check-sat)
