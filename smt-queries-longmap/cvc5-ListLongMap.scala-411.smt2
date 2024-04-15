; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7696 () Bool)

(assert start!7696)

(declare-fun b!48956 () Bool)

(declare-fun res!28408 () Bool)

(declare-fun e!31436 () Bool)

(assert (=> b!48956 (=> (not res!28408) (not e!31436))))

(declare-datatypes ((B!984 0))(
  ( (B!985 (val!1112 Int)) )
))
(declare-datatypes ((tuple2!1810 0))(
  ( (tuple2!1811 (_1!916 (_ BitVec 64)) (_2!916 B!984)) )
))
(declare-datatypes ((List!1305 0))(
  ( (Nil!1302) (Cons!1301 (h!1881 tuple2!1810) (t!4335 List!1305)) )
))
(declare-fun l!1333 () List!1305)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!120 (List!1305 (_ BitVec 64)) Bool)

(assert (=> b!48956 (= res!28408 (not (containsKey!120 l!1333 newKey!147)))))

(declare-fun b!48957 () Bool)

(declare-fun res!28409 () Bool)

(assert (=> b!48957 (=> (not res!28409) (not e!31436))))

(assert (=> b!48957 (= res!28409 (not (is-Nil!1302 l!1333)))))

(declare-fun b!48959 () Bool)

(declare-fun e!31437 () Bool)

(declare-fun tp_is_empty!2135 () Bool)

(declare-fun tp!6482 () Bool)

(assert (=> b!48959 (= e!31437 (and tp_is_empty!2135 tp!6482))))

(declare-fun b!48958 () Bool)

(declare-fun ListPrimitiveSize!54 (List!1305) Int)

(assert (=> b!48958 (= e!31436 (>= (ListPrimitiveSize!54 (t!4335 l!1333)) (ListPrimitiveSize!54 l!1333)))))

(declare-fun res!28410 () Bool)

(assert (=> start!7696 (=> (not res!28410) (not e!31436))))

(declare-fun isStrictlySorted!268 (List!1305) Bool)

(assert (=> start!7696 (= res!28410 (isStrictlySorted!268 l!1333))))

(assert (=> start!7696 e!31436))

(assert (=> start!7696 e!31437))

(assert (=> start!7696 true))

(assert (= (and start!7696 res!28410) b!48956))

(assert (= (and b!48956 res!28408) b!48957))

(assert (= (and b!48957 res!28409) b!48958))

(assert (= (and start!7696 (is-Cons!1301 l!1333)) b!48959))

(declare-fun m!42501 () Bool)

(assert (=> b!48956 m!42501))

(declare-fun m!42503 () Bool)

(assert (=> b!48958 m!42503))

(declare-fun m!42505 () Bool)

(assert (=> b!48958 m!42505))

(declare-fun m!42507 () Bool)

(assert (=> start!7696 m!42507))

(push 1)

(assert tp_is_empty!2135)

(assert (not b!48956))

(assert (not b!48959))

(assert (not b!48958))

(assert (not start!7696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9735 () Bool)

(declare-fun res!28421 () Bool)

(declare-fun e!31450 () Bool)

(assert (=> d!9735 (=> res!28421 e!31450)))

(assert (=> d!9735 (= res!28421 (and (is-Cons!1301 l!1333) (= (_1!916 (h!1881 l!1333)) newKey!147)))))

(assert (=> d!9735 (= (containsKey!120 l!1333 newKey!147) e!31450)))

(declare-fun b!48974 () Bool)

(declare-fun e!31451 () Bool)

(assert (=> b!48974 (= e!31450 e!31451)))

(declare-fun res!28422 () Bool)

(assert (=> b!48974 (=> (not res!28422) (not e!31451))))

(assert (=> b!48974 (= res!28422 (and (or (not (is-Cons!1301 l!1333)) (bvsle (_1!916 (h!1881 l!1333)) newKey!147)) (is-Cons!1301 l!1333) (bvslt (_1!916 (h!1881 l!1333)) newKey!147)))))

(declare-fun b!48975 () Bool)

(assert (=> b!48975 (= e!31451 (containsKey!120 (t!4335 l!1333) newKey!147))))

(assert (= (and d!9735 (not res!28421)) b!48974))

(assert (= (and b!48974 res!28422) b!48975))

(declare-fun m!42511 () Bool)

(assert (=> b!48975 m!42511))

(assert (=> b!48956 d!9735))

(declare-fun d!9743 () Bool)

(declare-fun res!28435 () Bool)

(declare-fun e!31466 () Bool)

(assert (=> d!9743 (=> res!28435 e!31466)))

(assert (=> d!9743 (= res!28435 (or (is-Nil!1302 l!1333) (is-Nil!1302 (t!4335 l!1333))))))

(assert (=> d!9743 (= (isStrictlySorted!268 l!1333) e!31466)))

(declare-fun b!48992 () Bool)

(declare-fun e!31467 () Bool)

(assert (=> b!48992 (= e!31466 e!31467)))

(declare-fun res!28436 () Bool)

(assert (=> b!48992 (=> (not res!28436) (not e!31467))))

(assert (=> b!48992 (= res!28436 (bvslt (_1!916 (h!1881 l!1333)) (_1!916 (h!1881 (t!4335 l!1333)))))))

(declare-fun b!48993 () Bool)

(assert (=> b!48993 (= e!31467 (isStrictlySorted!268 (t!4335 l!1333)))))

(assert (= (and d!9743 (not res!28435)) b!48992))

(assert (= (and b!48992 res!28436) b!48993))

(declare-fun m!42515 () Bool)

(assert (=> b!48993 m!42515))

(assert (=> start!7696 d!9743))

(declare-fun d!9749 () Bool)

(declare-fun lt!20695 () Int)

(assert (=> d!9749 (>= lt!20695 0)))

(declare-fun e!31478 () Int)

(assert (=> d!9749 (= lt!20695 e!31478)))

(declare-fun c!6580 () Bool)

(assert (=> d!9749 (= c!6580 (is-Nil!1302 (t!4335 l!1333)))))

(assert (=> d!9749 (= (ListPrimitiveSize!54 (t!4335 l!1333)) lt!20695)))

(declare-fun b!49008 () Bool)

(assert (=> b!49008 (= e!31478 0)))

(declare-fun b!49009 () Bool)

(assert (=> b!49009 (= e!31478 (+ 1 (ListPrimitiveSize!54 (t!4335 (t!4335 l!1333)))))))

(assert (= (and d!9749 c!6580) b!49008))

(assert (= (and d!9749 (not c!6580)) b!49009))

(declare-fun m!42521 () Bool)

(assert (=> b!49009 m!42521))

(assert (=> b!48958 d!9749))

(declare-fun d!9755 () Bool)

(declare-fun lt!20697 () Int)

(assert (=> d!9755 (>= lt!20697 0)))

(declare-fun e!31482 () Int)

(assert (=> d!9755 (= lt!20697 e!31482)))

(declare-fun c!6582 () Bool)

(assert (=> d!9755 (= c!6582 (is-Nil!1302 l!1333))))

(assert (=> d!9755 (= (ListPrimitiveSize!54 l!1333) lt!20697)))

(declare-fun b!49014 () Bool)

(assert (=> b!49014 (= e!31482 0)))

(declare-fun b!49015 () Bool)

(assert (=> b!49015 (= e!31482 (+ 1 (ListPrimitiveSize!54 (t!4335 l!1333))))))

(assert (= (and d!9755 c!6582) b!49014))

(assert (= (and d!9755 (not c!6582)) b!49015))

(assert (=> b!49015 m!42503))

(assert (=> b!48958 d!9755))

(declare-fun b!49028 () Bool)

(declare-fun e!31490 () Bool)

(declare-fun tp!6487 () Bool)

(assert (=> b!49028 (= e!31490 (and tp_is_empty!2135 tp!6487))))

(assert (=> b!48959 (= tp!6482 e!31490)))

(assert (= (and b!48959 (is-Cons!1301 (t!4335 l!1333))) b!49028))

(push 1)

(assert tp_is_empty!2135)

(assert (not b!48993))

(assert (not b!48975))

(assert (not b!49028))

(assert (not b!49009))

(assert (not b!49015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

