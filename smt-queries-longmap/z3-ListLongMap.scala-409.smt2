; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7626 () Bool)

(assert start!7626)

(declare-fun res!28206 () Bool)

(declare-fun e!31167 () Bool)

(assert (=> start!7626 (=> (not res!28206) (not e!31167))))

(declare-datatypes ((B!968 0))(
  ( (B!969 (val!1104 Int)) )
))
(declare-datatypes ((tuple2!1794 0))(
  ( (tuple2!1795 (_1!908 (_ BitVec 64)) (_2!908 B!968)) )
))
(declare-datatypes ((List!1297 0))(
  ( (Nil!1294) (Cons!1293 (h!1873 tuple2!1794) (t!4324 List!1297)) )
))
(declare-fun l!1333 () List!1297)

(declare-fun isStrictlySorted!260 (List!1297) Bool)

(assert (=> start!7626 (= res!28206 (isStrictlySorted!260 l!1333))))

(assert (=> start!7626 e!31167))

(declare-fun e!31166 () Bool)

(assert (=> start!7626 e!31166))

(assert (=> start!7626 true))

(declare-fun b!48546 () Bool)

(declare-fun res!28205 () Bool)

(assert (=> b!48546 (=> (not res!28205) (not e!31167))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!112 (List!1297 (_ BitVec 64)) Bool)

(assert (=> b!48546 (= res!28205 (not (containsKey!112 l!1333 newKey!147)))))

(declare-fun b!48547 () Bool)

(declare-fun ListPrimitiveSize!49 (List!1297) Int)

(assert (=> b!48547 (= e!31167 (< (ListPrimitiveSize!49 l!1333) 0))))

(declare-fun b!48548 () Bool)

(declare-fun tp_is_empty!2119 () Bool)

(declare-fun tp!6437 () Bool)

(assert (=> b!48548 (= e!31166 (and tp_is_empty!2119 tp!6437))))

(assert (= (and start!7626 res!28206) b!48546))

(assert (= (and b!48546 res!28205) b!48547))

(get-info :version)

(assert (= (and start!7626 ((_ is Cons!1293) l!1333)) b!48548))

(declare-fun m!42251 () Bool)

(assert (=> start!7626 m!42251))

(declare-fun m!42253 () Bool)

(assert (=> b!48546 m!42253))

(declare-fun m!42255 () Bool)

(assert (=> b!48547 m!42255))

(check-sat (not b!48548) (not b!48546) (not start!7626) tp_is_empty!2119 (not b!48547))
(check-sat)
(get-model)

(declare-fun d!9629 () Bool)

(declare-fun res!28223 () Bool)

(declare-fun e!31184 () Bool)

(assert (=> d!9629 (=> res!28223 e!31184)))

(assert (=> d!9629 (= res!28223 (or ((_ is Nil!1294) l!1333) ((_ is Nil!1294) (t!4324 l!1333))))))

(assert (=> d!9629 (= (isStrictlySorted!260 l!1333) e!31184)))

(declare-fun b!48571 () Bool)

(declare-fun e!31185 () Bool)

(assert (=> b!48571 (= e!31184 e!31185)))

(declare-fun res!28224 () Bool)

(assert (=> b!48571 (=> (not res!28224) (not e!31185))))

(assert (=> b!48571 (= res!28224 (bvslt (_1!908 (h!1873 l!1333)) (_1!908 (h!1873 (t!4324 l!1333)))))))

(declare-fun b!48572 () Bool)

(assert (=> b!48572 (= e!31185 (isStrictlySorted!260 (t!4324 l!1333)))))

(assert (= (and d!9629 (not res!28223)) b!48571))

(assert (= (and b!48571 res!28224) b!48572))

(declare-fun m!42269 () Bool)

(assert (=> b!48572 m!42269))

(assert (=> start!7626 d!9629))

(declare-fun d!9635 () Bool)

(declare-fun res!28235 () Bool)

(declare-fun e!31199 () Bool)

(assert (=> d!9635 (=> res!28235 e!31199)))

(assert (=> d!9635 (= res!28235 (and ((_ is Cons!1293) l!1333) (= (_1!908 (h!1873 l!1333)) newKey!147)))))

(assert (=> d!9635 (= (containsKey!112 l!1333 newKey!147) e!31199)))

(declare-fun b!48589 () Bool)

(declare-fun e!31200 () Bool)

(assert (=> b!48589 (= e!31199 e!31200)))

(declare-fun res!28236 () Bool)

(assert (=> b!48589 (=> (not res!28236) (not e!31200))))

(assert (=> b!48589 (= res!28236 (and (or (not ((_ is Cons!1293) l!1333)) (bvsle (_1!908 (h!1873 l!1333)) newKey!147)) ((_ is Cons!1293) l!1333) (bvslt (_1!908 (h!1873 l!1333)) newKey!147)))))

(declare-fun b!48590 () Bool)

(assert (=> b!48590 (= e!31200 (containsKey!112 (t!4324 l!1333) newKey!147))))

(assert (= (and d!9635 (not res!28235)) b!48589))

(assert (= (and b!48589 res!28236) b!48590))

(declare-fun m!42275 () Bool)

(assert (=> b!48590 m!42275))

(assert (=> b!48546 d!9635))

(declare-fun d!9641 () Bool)

(declare-fun lt!20664 () Int)

(assert (=> d!9641 (>= lt!20664 0)))

(declare-fun e!31211 () Int)

(assert (=> d!9641 (= lt!20664 e!31211)))

(declare-fun c!6504 () Bool)

(assert (=> d!9641 (= c!6504 ((_ is Nil!1294) l!1333))))

(assert (=> d!9641 (= (ListPrimitiveSize!49 l!1333) lt!20664)))

(declare-fun b!48605 () Bool)

(assert (=> b!48605 (= e!31211 0)))

(declare-fun b!48606 () Bool)

(assert (=> b!48606 (= e!31211 (+ 1 (ListPrimitiveSize!49 (t!4324 l!1333))))))

(assert (= (and d!9641 c!6504) b!48605))

(assert (= (and d!9641 (not c!6504)) b!48606))

(declare-fun m!42279 () Bool)

(assert (=> b!48606 m!42279))

(assert (=> b!48547 d!9641))

(declare-fun b!48617 () Bool)

(declare-fun e!31219 () Bool)

(declare-fun tp!6446 () Bool)

(assert (=> b!48617 (= e!31219 (and tp_is_empty!2119 tp!6446))))

(assert (=> b!48548 (= tp!6437 e!31219)))

(assert (= (and b!48548 ((_ is Cons!1293) (t!4324 l!1333))) b!48617))

(check-sat (not b!48617) (not b!48590) tp_is_empty!2119 (not b!48572) (not b!48606))
(check-sat)
