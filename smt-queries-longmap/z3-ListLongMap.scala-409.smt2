; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7630 () Bool)

(assert start!7630)

(declare-fun res!28200 () Bool)

(declare-fun e!31173 () Bool)

(assert (=> start!7630 (=> (not res!28200) (not e!31173))))

(declare-datatypes ((B!968 0))(
  ( (B!969 (val!1104 Int)) )
))
(declare-datatypes ((tuple2!1772 0))(
  ( (tuple2!1773 (_1!897 (_ BitVec 64)) (_2!897 B!968)) )
))
(declare-datatypes ((List!1287 0))(
  ( (Nil!1284) (Cons!1283 (h!1863 tuple2!1772) (t!4315 List!1287)) )
))
(declare-fun l!1333 () List!1287)

(declare-fun isStrictlySorted!253 (List!1287) Bool)

(assert (=> start!7630 (= res!28200 (isStrictlySorted!253 l!1333))))

(assert (=> start!7630 e!31173))

(declare-fun e!31172 () Bool)

(assert (=> start!7630 e!31172))

(assert (=> start!7630 true))

(declare-fun b!48555 () Bool)

(declare-fun res!28201 () Bool)

(assert (=> b!48555 (=> (not res!28201) (not e!31173))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!114 (List!1287 (_ BitVec 64)) Bool)

(assert (=> b!48555 (= res!28201 (not (containsKey!114 l!1333 newKey!147)))))

(declare-fun b!48556 () Bool)

(declare-fun ListPrimitiveSize!49 (List!1287) Int)

(assert (=> b!48556 (= e!31173 (< (ListPrimitiveSize!49 l!1333) 0))))

(declare-fun b!48557 () Bool)

(declare-fun tp_is_empty!2119 () Bool)

(declare-fun tp!6437 () Bool)

(assert (=> b!48557 (= e!31172 (and tp_is_empty!2119 tp!6437))))

(assert (= (and start!7630 res!28200) b!48555))

(assert (= (and b!48555 res!28201) b!48556))

(get-info :version)

(assert (= (and start!7630 ((_ is Cons!1283) l!1333)) b!48557))

(declare-fun m!42209 () Bool)

(assert (=> start!7630 m!42209))

(declare-fun m!42211 () Bool)

(assert (=> b!48555 m!42211))

(declare-fun m!42213 () Bool)

(assert (=> b!48556 m!42213))

(check-sat (not b!48557) (not b!48556) (not b!48555) (not start!7630) tp_is_empty!2119)
(check-sat)
(get-model)

(declare-fun d!9643 () Bool)

(declare-fun res!28222 () Bool)

(declare-fun e!31197 () Bool)

(assert (=> d!9643 (=> res!28222 e!31197)))

(assert (=> d!9643 (= res!28222 (and ((_ is Cons!1283) l!1333) (= (_1!897 (h!1863 l!1333)) newKey!147)))))

(assert (=> d!9643 (= (containsKey!114 l!1333 newKey!147) e!31197)))

(declare-fun b!48590 () Bool)

(declare-fun e!31198 () Bool)

(assert (=> b!48590 (= e!31197 e!31198)))

(declare-fun res!28223 () Bool)

(assert (=> b!48590 (=> (not res!28223) (not e!31198))))

(assert (=> b!48590 (= res!28223 (and (or (not ((_ is Cons!1283) l!1333)) (bvsle (_1!897 (h!1863 l!1333)) newKey!147)) ((_ is Cons!1283) l!1333) (bvslt (_1!897 (h!1863 l!1333)) newKey!147)))))

(declare-fun b!48591 () Bool)

(assert (=> b!48591 (= e!31198 (containsKey!114 (t!4315 l!1333) newKey!147))))

(assert (= (and d!9643 (not res!28222)) b!48590))

(assert (= (and b!48590 res!28223) b!48591))

(declare-fun m!42229 () Bool)

(assert (=> b!48591 m!42229))

(assert (=> b!48555 d!9643))

(declare-fun d!9651 () Bool)

(declare-fun lt!20635 () Int)

(assert (=> d!9651 (>= lt!20635 0)))

(declare-fun e!31211 () Int)

(assert (=> d!9651 (= lt!20635 e!31211)))

(declare-fun c!6509 () Bool)

(assert (=> d!9651 (= c!6509 ((_ is Nil!1284) l!1333))))

(assert (=> d!9651 (= (ListPrimitiveSize!49 l!1333) lt!20635)))

(declare-fun b!48606 () Bool)

(assert (=> b!48606 (= e!31211 0)))

(declare-fun b!48607 () Bool)

(assert (=> b!48607 (= e!31211 (+ 1 (ListPrimitiveSize!49 (t!4315 l!1333))))))

(assert (= (and d!9651 c!6509) b!48606))

(assert (= (and d!9651 (not c!6509)) b!48607))

(declare-fun m!42233 () Bool)

(assert (=> b!48607 m!42233))

(assert (=> b!48556 d!9651))

(declare-fun d!9655 () Bool)

(declare-fun res!28246 () Bool)

(declare-fun e!31227 () Bool)

(assert (=> d!9655 (=> res!28246 e!31227)))

(assert (=> d!9655 (= res!28246 (or ((_ is Nil!1284) l!1333) ((_ is Nil!1284) (t!4315 l!1333))))))

(assert (=> d!9655 (= (isStrictlySorted!253 l!1333) e!31227)))

(declare-fun b!48626 () Bool)

(declare-fun e!31228 () Bool)

(assert (=> b!48626 (= e!31227 e!31228)))

(declare-fun res!28247 () Bool)

(assert (=> b!48626 (=> (not res!28247) (not e!31228))))

(assert (=> b!48626 (= res!28247 (bvslt (_1!897 (h!1863 l!1333)) (_1!897 (h!1863 (t!4315 l!1333)))))))

(declare-fun b!48627 () Bool)

(assert (=> b!48627 (= e!31228 (isStrictlySorted!253 (t!4315 l!1333)))))

(assert (= (and d!9655 (not res!28246)) b!48626))

(assert (= (and b!48626 res!28247) b!48627))

(declare-fun m!42241 () Bool)

(assert (=> b!48627 m!42241))

(assert (=> start!7630 d!9655))

(declare-fun b!48644 () Bool)

(declare-fun e!31239 () Bool)

(declare-fun tp!6452 () Bool)

(assert (=> b!48644 (= e!31239 (and tp_is_empty!2119 tp!6452))))

(assert (=> b!48557 (= tp!6437 e!31239)))

(assert (= (and b!48557 ((_ is Cons!1283) (t!4315 l!1333))) b!48644))

(check-sat (not b!48591) (not b!48607) tp_is_empty!2119 (not b!48644) (not b!48627))
(check-sat)
