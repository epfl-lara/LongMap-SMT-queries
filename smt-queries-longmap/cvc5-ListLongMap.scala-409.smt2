; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7624 () Bool)

(assert start!7624)

(declare-fun res!28226 () Bool)

(declare-fun e!31210 () Bool)

(assert (=> start!7624 (=> (not res!28226) (not e!31210))))

(declare-datatypes ((B!968 0))(
  ( (B!969 (val!1104 Int)) )
))
(declare-datatypes ((tuple2!1790 0))(
  ( (tuple2!1791 (_1!906 (_ BitVec 64)) (_2!906 B!968)) )
))
(declare-datatypes ((List!1301 0))(
  ( (Nil!1298) (Cons!1297 (h!1877 tuple2!1790) (t!4329 List!1301)) )
))
(declare-fun l!1333 () List!1301)

(declare-fun isStrictlySorted!265 (List!1301) Bool)

(assert (=> start!7624 (= res!28226 (isStrictlySorted!265 l!1333))))

(assert (=> start!7624 e!31210))

(declare-fun e!31209 () Bool)

(assert (=> start!7624 e!31209))

(assert (=> start!7624 true))

(declare-fun b!48612 () Bool)

(declare-fun res!28225 () Bool)

(assert (=> b!48612 (=> (not res!28225) (not e!31210))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!114 (List!1301 (_ BitVec 64)) Bool)

(assert (=> b!48612 (= res!28225 (not (containsKey!114 l!1333 newKey!147)))))

(declare-fun b!48613 () Bool)

(declare-fun ListPrimitiveSize!49 (List!1301) Int)

(assert (=> b!48613 (= e!31210 (< (ListPrimitiveSize!49 l!1333) 0))))

(declare-fun b!48614 () Bool)

(declare-fun tp_is_empty!2119 () Bool)

(declare-fun tp!6437 () Bool)

(assert (=> b!48614 (= e!31209 (and tp_is_empty!2119 tp!6437))))

(assert (= (and start!7624 res!28226) b!48612))

(assert (= (and b!48612 res!28225) b!48613))

(assert (= (and start!7624 (is-Cons!1297 l!1333)) b!48614))

(declare-fun m!42333 () Bool)

(assert (=> start!7624 m!42333))

(declare-fun m!42335 () Bool)

(assert (=> b!48612 m!42335))

(declare-fun m!42337 () Bool)

(assert (=> b!48613 m!42337))

(push 1)

(assert (not b!48612))

(assert tp_is_empty!2119)

(assert (not start!7624))

(assert (not b!48613))

(assert (not b!48614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9659 () Bool)

(declare-fun res!28251 () Bool)

(declare-fun e!31235 () Bool)

(assert (=> d!9659 (=> res!28251 e!31235)))

(assert (=> d!9659 (= res!28251 (or (is-Nil!1298 l!1333) (is-Nil!1298 (t!4329 l!1333))))))

(assert (=> d!9659 (= (isStrictlySorted!265 l!1333) e!31235)))

(declare-fun b!48647 () Bool)

(declare-fun e!31237 () Bool)

(assert (=> b!48647 (= e!31235 e!31237)))

(declare-fun res!28253 () Bool)

(assert (=> b!48647 (=> (not res!28253) (not e!31237))))

(assert (=> b!48647 (= res!28253 (bvslt (_1!906 (h!1877 l!1333)) (_1!906 (h!1877 (t!4329 l!1333)))))))

(declare-fun b!48648 () Bool)

(assert (=> b!48648 (= e!31237 (isStrictlySorted!265 (t!4329 l!1333)))))

(assert (= (and d!9659 (not res!28251)) b!48647))

(assert (= (and b!48647 res!28253) b!48648))

(declare-fun m!42353 () Bool)

(assert (=> b!48648 m!42353))

(assert (=> start!7624 d!9659))

(declare-fun d!9662 () Bool)

(declare-fun lt!20678 () Int)

(assert (=> d!9662 (>= lt!20678 0)))

(declare-fun e!31250 () Int)

(assert (=> d!9662 (= lt!20678 e!31250)))

(declare-fun c!6525 () Bool)

(assert (=> d!9662 (= c!6525 (is-Nil!1298 l!1333))))

(assert (=> d!9662 (= (ListPrimitiveSize!49 l!1333) lt!20678)))

(declare-fun b!48665 () Bool)

(assert (=> b!48665 (= e!31250 0)))

(declare-fun b!48666 () Bool)

(assert (=> b!48666 (= e!31250 (+ 1 (ListPrimitiveSize!49 (t!4329 l!1333))))))

(assert (= (and d!9662 c!6525) b!48665))

(assert (= (and d!9662 (not c!6525)) b!48666))

(declare-fun m!42357 () Bool)

(assert (=> b!48666 m!42357))

(assert (=> b!48613 d!9662))

(declare-fun d!9667 () Bool)

(declare-fun res!28271 () Bool)

(declare-fun e!31264 () Bool)

(assert (=> d!9667 (=> res!28271 e!31264)))

(assert (=> d!9667 (= res!28271 (and (is-Cons!1297 l!1333) (= (_1!906 (h!1877 l!1333)) newKey!147)))))

(assert (=> d!9667 (= (containsKey!114 l!1333 newKey!147) e!31264)))

(declare-fun b!48683 () Bool)

(declare-fun e!31265 () Bool)

(assert (=> b!48683 (= e!31264 e!31265)))

(declare-fun res!28272 () Bool)

(assert (=> b!48683 (=> (not res!28272) (not e!31265))))

(assert (=> b!48683 (= res!28272 (and (or (not (is-Cons!1297 l!1333)) (bvsle (_1!906 (h!1877 l!1333)) newKey!147)) (is-Cons!1297 l!1333) (bvslt (_1!906 (h!1877 l!1333)) newKey!147)))))

(declare-fun b!48684 () Bool)

(assert (=> b!48684 (= e!31265 (containsKey!114 (t!4329 l!1333) newKey!147))))

(assert (= (and d!9667 (not res!28271)) b!48683))

(assert (= (and b!48683 res!28272) b!48684))

(declare-fun m!42365 () Bool)

(assert (=> b!48684 m!42365))

(assert (=> b!48612 d!9667))

(declare-fun b!48700 () Bool)

(declare-fun e!31275 () Bool)

(declare-fun tp!6451 () Bool)

(assert (=> b!48700 (= e!31275 (and tp_is_empty!2119 tp!6451))))

(assert (=> b!48614 (= tp!6437 e!31275)))

(assert (= (and b!48614 (is-Cons!1297 (t!4329 l!1333))) b!48700))

(push 1)

(assert (not b!48648))

(assert (not b!48700))

