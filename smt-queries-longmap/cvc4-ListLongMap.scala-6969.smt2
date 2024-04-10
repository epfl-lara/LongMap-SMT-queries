; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88054 () Bool)

(assert start!88054)

(declare-fun b!1016192 () Bool)

(assert (=> b!1016192 true))

(assert (=> b!1016192 true))

(declare-fun b!1016190 () Bool)

(declare-fun e!571651 () Bool)

(declare-fun tp_is_empty!23591 () Bool)

(declare-fun tp!70742 () Bool)

(assert (=> b!1016190 (= e!571651 (and tp_is_empty!23591 tp!70742))))

(declare-fun b!1016191 () Bool)

(declare-fun res!681626 () Bool)

(declare-fun e!571650 () Bool)

(assert (=> b!1016191 (=> (not res!681626) (not e!571650))))

(declare-datatypes ((B!1524 0))(
  ( (B!1525 (val!11846 Int)) )
))
(declare-datatypes ((tuple2!15238 0))(
  ( (tuple2!15239 (_1!7630 (_ BitVec 64)) (_2!7630 B!1524)) )
))
(declare-fun newHead!31 () tuple2!15238)

(declare-datatypes ((List!21515 0))(
  ( (Nil!21512) (Cons!21511 (h!22709 tuple2!15238) (t!30516 List!21515)) )
))
(declare-fun l!1114 () List!21515)

(declare-fun head!963 (List!21515) tuple2!15238)

(assert (=> b!1016191 (= res!681626 (bvslt (_1!7630 newHead!31) (_1!7630 (head!963 l!1114))))))

(declare-fun res!681624 () Bool)

(assert (=> start!88054 (=> (not res!681624) (not e!571650))))

(declare-fun isStrictlySorted!614 (List!21515) Bool)

(assert (=> start!88054 (= res!681624 (isStrictlySorted!614 l!1114))))

(assert (=> start!88054 e!571650))

(assert (=> start!88054 e!571651))

(assert (=> start!88054 true))

(assert (=> start!88054 tp_is_empty!23591))

(declare-fun res!681627 () Bool)

(assert (=> b!1016192 (=> (not res!681627) (not e!571650))))

(declare-datatypes ((List!21516 0))(
  ( (Nil!21513) (Cons!21512 (h!22710 (_ BitVec 64)) (t!30517 List!21516)) )
))
(declare-fun keys!40 () List!21516)

(declare-fun lambda!1007 () Int)

(declare-fun forall!276 (List!21516 Int) Bool)

(assert (=> b!1016192 (= res!681627 (forall!276 keys!40 lambda!1007))))

(declare-fun b!1016193 () Bool)

(declare-fun res!681625 () Bool)

(assert (=> b!1016193 (=> (not res!681625) (not e!571650))))

(declare-fun isEmpty!876 (List!21515) Bool)

(assert (=> b!1016193 (= res!681625 (not (isEmpty!876 l!1114)))))

(declare-fun b!1016194 () Bool)

(declare-fun ListPrimitiveSize!123 (List!21516) Int)

(assert (=> b!1016194 (= e!571650 (< (ListPrimitiveSize!123 keys!40) 0))))

(assert (= (and start!88054 res!681624) b!1016193))

(assert (= (and b!1016193 res!681625) b!1016192))

(assert (= (and b!1016192 res!681627) b!1016191))

(assert (= (and b!1016191 res!681626) b!1016194))

(assert (= (and start!88054 (is-Cons!21511 l!1114)) b!1016190))

(declare-fun m!937975 () Bool)

(assert (=> b!1016193 m!937975))

(declare-fun m!937977 () Bool)

(assert (=> b!1016194 m!937977))

(declare-fun m!937979 () Bool)

(assert (=> b!1016191 m!937979))

(declare-fun m!937981 () Bool)

(assert (=> b!1016192 m!937981))

(declare-fun m!937983 () Bool)

(assert (=> start!88054 m!937983))

(push 1)

(assert (not b!1016193))

(assert (not b!1016191))

(assert (not b!1016192))

(assert tp_is_empty!23591)

(assert (not b!1016194))

(assert (not b!1016190))

(assert (not start!88054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121169 () Bool)

(declare-fun lt!449256 () Int)

(assert (=> d!121169 (>= lt!449256 0)))

(declare-fun e!571686 () Int)

(assert (=> d!121169 (= lt!449256 e!571686)))

(declare-fun c!102918 () Bool)

(assert (=> d!121169 (= c!102918 (is-Nil!21513 keys!40))))

(assert (=> d!121169 (= (ListPrimitiveSize!123 keys!40) lt!449256)))

(declare-fun b!1016243 () Bool)

(assert (=> b!1016243 (= e!571686 0)))

(declare-fun b!1016244 () Bool)

(assert (=> b!1016244 (= e!571686 (+ 1 (ListPrimitiveSize!123 (t!30517 keys!40))))))

(assert (= (and d!121169 c!102918) b!1016243))

(assert (= (and d!121169 (not c!102918)) b!1016244))

(declare-fun m!938001 () Bool)

(assert (=> b!1016244 m!938001))

(assert (=> b!1016194 d!121169))

(declare-fun d!121171 () Bool)

(declare-fun res!681656 () Bool)

(declare-fun e!571695 () Bool)

(assert (=> d!121171 (=> res!681656 e!571695)))

(assert (=> d!121171 (= res!681656 (or (is-Nil!21512 l!1114) (is-Nil!21512 (t!30516 l!1114))))))

(assert (=> d!121171 (= (isStrictlySorted!614 l!1114) e!571695)))

(declare-fun b!1016255 () Bool)

(declare-fun e!571696 () Bool)

(assert (=> b!1016255 (= e!571695 e!571696)))

(declare-fun res!681657 () Bool)

(assert (=> b!1016255 (=> (not res!681657) (not e!571696))))

(assert (=> b!1016255 (= res!681657 (bvslt (_1!7630 (h!22709 l!1114)) (_1!7630 (h!22709 (t!30516 l!1114)))))))

(declare-fun b!1016256 () Bool)

(assert (=> b!1016256 (= e!571696 (isStrictlySorted!614 (t!30516 l!1114)))))

(assert (= (and d!121171 (not res!681656)) b!1016255))

(assert (= (and b!1016255 res!681657) b!1016256))

(declare-fun m!938007 () Bool)

(assert (=> b!1016256 m!938007))

