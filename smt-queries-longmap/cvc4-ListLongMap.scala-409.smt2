; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7628 () Bool)

(assert start!7628)

(declare-fun res!28238 () Bool)

(declare-fun e!31221 () Bool)

(assert (=> start!7628 (=> (not res!28238) (not e!31221))))

(declare-datatypes ((B!972 0))(
  ( (B!973 (val!1106 Int)) )
))
(declare-datatypes ((tuple2!1794 0))(
  ( (tuple2!1795 (_1!908 (_ BitVec 64)) (_2!908 B!972)) )
))
(declare-datatypes ((List!1303 0))(
  ( (Nil!1300) (Cons!1299 (h!1879 tuple2!1794) (t!4331 List!1303)) )
))
(declare-fun l!1333 () List!1303)

(declare-fun isStrictlySorted!267 (List!1303) Bool)

(assert (=> start!7628 (= res!28238 (isStrictlySorted!267 l!1333))))

(assert (=> start!7628 e!31221))

(declare-fun e!31222 () Bool)

(assert (=> start!7628 e!31222))

(assert (=> start!7628 true))

(declare-fun b!48630 () Bool)

(declare-fun res!28237 () Bool)

(assert (=> b!48630 (=> (not res!28237) (not e!31221))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!116 (List!1303 (_ BitVec 64)) Bool)

(assert (=> b!48630 (= res!28237 (not (containsKey!116 l!1333 newKey!147)))))

(declare-fun b!48631 () Bool)

(declare-fun ListPrimitiveSize!51 (List!1303) Int)

(assert (=> b!48631 (= e!31221 (< (ListPrimitiveSize!51 l!1333) 0))))

(declare-fun b!48632 () Bool)

(declare-fun tp_is_empty!2123 () Bool)

(declare-fun tp!6443 () Bool)

(assert (=> b!48632 (= e!31222 (and tp_is_empty!2123 tp!6443))))

(assert (= (and start!7628 res!28238) b!48630))

(assert (= (and b!48630 res!28237) b!48631))

(assert (= (and start!7628 (is-Cons!1299 l!1333)) b!48632))

(declare-fun m!42345 () Bool)

(assert (=> start!7628 m!42345))

(declare-fun m!42347 () Bool)

(assert (=> b!48630 m!42347))

(declare-fun m!42349 () Bool)

(assert (=> b!48631 m!42349))

(push 1)

(assert (not b!48631))

(assert (not b!48630))

(assert tp_is_empty!2123)

(assert (not b!48632))

(assert (not start!7628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9657 () Bool)

(declare-fun res!28252 () Bool)

(declare-fun e!31236 () Bool)

(assert (=> d!9657 (=> res!28252 e!31236)))

(assert (=> d!9657 (= res!28252 (or (is-Nil!1300 l!1333) (is-Nil!1300 (t!4331 l!1333))))))

(assert (=> d!9657 (= (isStrictlySorted!267 l!1333) e!31236)))

(declare-fun b!48645 () Bool)

(declare-fun e!31238 () Bool)

(assert (=> b!48645 (= e!31236 e!31238)))

(declare-fun res!28254 () Bool)

(assert (=> b!48645 (=> (not res!28254) (not e!31238))))

(assert (=> b!48645 (= res!28254 (bvslt (_1!908 (h!1879 l!1333)) (_1!908 (h!1879 (t!4331 l!1333)))))))

(declare-fun b!48646 () Bool)

(assert (=> b!48646 (= e!31238 (isStrictlySorted!267 (t!4331 l!1333)))))

(assert (= (and d!9657 (not res!28252)) b!48645))

(assert (= (and b!48645 res!28254) b!48646))

(declare-fun m!42352 () Bool)

(assert (=> b!48646 m!42352))

(assert (=> start!7628 d!9657))

(declare-fun d!9665 () Bool)

(declare-fun lt!20677 () Int)

(assert (=> d!9665 (>= lt!20677 0)))

(declare-fun e!31249 () Int)

(assert (=> d!9665 (= lt!20677 e!31249)))

(declare-fun c!6524 () Bool)

(assert (=> d!9665 (= c!6524 (is-Nil!1300 l!1333))))

(assert (=> d!9665 (= (ListPrimitiveSize!51 l!1333) lt!20677)))

(declare-fun b!48663 () Bool)

(assert (=> b!48663 (= e!31249 0)))

(declare-fun b!48664 () Bool)

(assert (=> b!48664 (= e!31249 (+ 1 (ListPrimitiveSize!51 (t!4331 l!1333))))))

(assert (= (and d!9665 c!6524) b!48663))

(assert (= (and d!9665 (not c!6524)) b!48664))

(declare-fun m!42359 () Bool)

(assert (=> b!48664 m!42359))

(assert (=> b!48631 d!9665))

(declare-fun d!9669 () Bool)

(declare-fun res!28273 () Bool)

(declare-fun e!31266 () Bool)

(assert (=> d!9669 (=> res!28273 e!31266)))

(assert (=> d!9669 (= res!28273 (and (is-Cons!1299 l!1333) (= (_1!908 (h!1879 l!1333)) newKey!147)))))

(assert (=> d!9669 (= (containsKey!116 l!1333 newKey!147) e!31266)))

(declare-fun b!48685 () Bool)

(declare-fun e!31267 () Bool)

(assert (=> b!48685 (= e!31266 e!31267)))

(declare-fun res!28274 () Bool)

(assert (=> b!48685 (=> (not res!28274) (not e!31267))))

(assert (=> b!48685 (= res!28274 (and (or (not (is-Cons!1299 l!1333)) (bvsle (_1!908 (h!1879 l!1333)) newKey!147)) (is-Cons!1299 l!1333) (bvslt (_1!908 (h!1879 l!1333)) newKey!147)))))

(declare-fun b!48686 () Bool)

(assert (=> b!48686 (= e!31267 (containsKey!116 (t!4331 l!1333) newKey!147))))

(assert (= (and d!9669 (not res!28273)) b!48685))

(assert (= (and b!48685 res!28274) b!48686))

(declare-fun m!42367 () Bool)

(assert (=> b!48686 m!42367))

(assert (=> b!48630 d!9669))

(declare-fun b!48701 () Bool)

(declare-fun e!31276 () Bool)

(declare-fun tp!6452 () Bool)

(assert (=> b!48701 (= e!31276 (and tp_is_empty!2123 tp!6452))))

(assert (=> b!48632 (= tp!6443 e!31276)))

(assert (= (and b!48632 (is-Cons!1299 (t!4331 l!1333))) b!48701))

(push 1)

