; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88658 () Bool)

(assert start!88658)

(declare-fun res!683035 () Bool)

(declare-fun e!573200 () Bool)

(assert (=> start!88658 (=> (not res!683035) (not e!573200))))

(declare-datatypes ((B!1668 0))(
  ( (B!1669 (val!11918 Int)) )
))
(declare-datatypes ((tuple2!15382 0))(
  ( (tuple2!15383 (_1!7702 (_ BitVec 64)) (_2!7702 B!1668)) )
))
(declare-datatypes ((List!21606 0))(
  ( (Nil!21603) (Cons!21602 (h!22800 tuple2!15382) (t!30610 List!21606)) )
))
(declare-fun l!996 () List!21606)

(declare-fun isStrictlySorted!671 (List!21606) Bool)

(assert (=> start!88658 (= res!683035 (isStrictlySorted!671 l!996))))

(assert (=> start!88658 e!573200))

(declare-fun e!573201 () Bool)

(assert (=> start!88658 e!573201))

(assert (=> start!88658 true))

(declare-fun b!1018668 () Bool)

(declare-fun res!683036 () Bool)

(assert (=> b!1018668 (=> (not res!683036) (not e!573200))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!531 (List!21606 (_ BitVec 64)) Bool)

(assert (=> b!1018668 (= res!683036 (containsKey!531 l!996 key!261))))

(declare-fun b!1018669 () Bool)

(declare-fun ListPrimitiveSize!135 (List!21606) Int)

(assert (=> b!1018669 (= e!573200 (< (ListPrimitiveSize!135 l!996) 0))))

(declare-fun b!1018670 () Bool)

(declare-fun tp_is_empty!23735 () Bool)

(declare-fun tp!71083 () Bool)

(assert (=> b!1018670 (= e!573201 (and tp_is_empty!23735 tp!71083))))

(assert (= (and start!88658 res!683035) b!1018668))

(assert (= (and b!1018668 res!683036) b!1018669))

(assert (= (and start!88658 (is-Cons!21602 l!996)) b!1018670))

(declare-fun m!939445 () Bool)

(assert (=> start!88658 m!939445))

(declare-fun m!939447 () Bool)

(assert (=> b!1018668 m!939447))

(declare-fun m!939449 () Bool)

(assert (=> b!1018669 m!939449))

(push 1)

(assert (not b!1018670))

(assert tp_is_empty!23735)

(assert (not b!1018669))

(assert (not b!1018668))

(assert (not start!88658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121921 () Bool)

(declare-fun res!683047 () Bool)

(declare-fun e!573215 () Bool)

(assert (=> d!121921 (=> res!683047 e!573215)))

(assert (=> d!121921 (= res!683047 (and (is-Cons!21602 l!996) (= (_1!7702 (h!22800 l!996)) key!261)))))

(assert (=> d!121921 (= (containsKey!531 l!996 key!261) e!573215)))

(declare-fun b!1018687 () Bool)

(declare-fun e!573216 () Bool)

(assert (=> b!1018687 (= e!573215 e!573216)))

(declare-fun res!683048 () Bool)

(assert (=> b!1018687 (=> (not res!683048) (not e!573216))))

(assert (=> b!1018687 (= res!683048 (and (or (not (is-Cons!21602 l!996)) (bvsle (_1!7702 (h!22800 l!996)) key!261)) (is-Cons!21602 l!996) (bvslt (_1!7702 (h!22800 l!996)) key!261)))))

(declare-fun b!1018688 () Bool)

(assert (=> b!1018688 (= e!573216 (containsKey!531 (t!30610 l!996) key!261))))

(assert (= (and d!121921 (not res!683047)) b!1018687))

(assert (= (and b!1018687 res!683048) b!1018688))

(declare-fun m!939455 () Bool)

(assert (=> b!1018688 m!939455))

(assert (=> b!1018668 d!121921))

(declare-fun d!121929 () Bool)

(declare-fun res!683058 () Bool)

(declare-fun e!573229 () Bool)

(assert (=> d!121929 (=> res!683058 e!573229)))

(assert (=> d!121929 (= res!683058 (or (is-Nil!21603 l!996) (is-Nil!21603 (t!30610 l!996))))))

(assert (=> d!121929 (= (isStrictlySorted!671 l!996) e!573229)))

(declare-fun b!1018704 () Bool)

(declare-fun e!573231 () Bool)

(assert (=> b!1018704 (= e!573229 e!573231)))

(declare-fun res!683060 () Bool)

(assert (=> b!1018704 (=> (not res!683060) (not e!573231))))

(assert (=> b!1018704 (= res!683060 (bvslt (_1!7702 (h!22800 l!996)) (_1!7702 (h!22800 (t!30610 l!996)))))))

(declare-fun b!1018706 () Bool)

(assert (=> b!1018706 (= e!573231 (isStrictlySorted!671 (t!30610 l!996)))))

(assert (= (and d!121929 (not res!683058)) b!1018704))

(assert (= (and b!1018704 res!683060) b!1018706))

(declare-fun m!939459 () Bool)

(assert (=> b!1018706 m!939459))

(assert (=> start!88658 d!121929))

(declare-fun d!121933 () Bool)

(declare-fun lt!449589 () Int)

(assert (=> d!121933 (>= lt!449589 0)))

(declare-fun e!573244 () Int)

(assert (=> d!121933 (= lt!449589 e!573244)))

(declare-fun c!103198 () Bool)

(assert (=> d!121933 (= c!103198 (is-Nil!21603 l!996))))

(assert (=> d!121933 (= (ListPrimitiveSize!135 l!996) lt!449589)))

(declare-fun b!1018721 () Bool)

(assert (=> b!1018721 (= e!573244 0)))

(declare-fun b!1018722 () Bool)

(assert (=> b!1018722 (= e!573244 (+ 1 (ListPrimitiveSize!135 (t!30610 l!996))))))

(assert (= (and d!121933 c!103198) b!1018721))

(assert (= (and d!121933 (not c!103198)) b!1018722))

(declare-fun m!939465 () Bool)

(assert (=> b!1018722 m!939465))

(assert (=> b!1018669 d!121933))

(declare-fun b!1018736 () Bool)

(declare-fun e!573252 () Bool)

(declare-fun tp!71089 () Bool)

(assert (=> b!1018736 (= e!573252 (and tp_is_empty!23735 tp!71089))))

(assert (=> b!1018670 (= tp!71083 e!573252)))

(assert (= (and b!1018670 (is-Cons!21602 (t!30610 l!996))) b!1018736))

(push 1)

