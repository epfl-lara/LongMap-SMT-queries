; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88654 () Bool)

(assert start!88654)

(declare-fun res!683024 () Bool)

(declare-fun e!573188 () Bool)

(assert (=> start!88654 (=> (not res!683024) (not e!573188))))

(declare-datatypes ((B!1664 0))(
  ( (B!1665 (val!11916 Int)) )
))
(declare-datatypes ((tuple2!15378 0))(
  ( (tuple2!15379 (_1!7700 (_ BitVec 64)) (_2!7700 B!1664)) )
))
(declare-datatypes ((List!21604 0))(
  ( (Nil!21601) (Cons!21600 (h!22798 tuple2!15378) (t!30608 List!21604)) )
))
(declare-fun l!996 () List!21604)

(declare-fun isStrictlySorted!669 (List!21604) Bool)

(assert (=> start!88654 (= res!683024 (isStrictlySorted!669 l!996))))

(assert (=> start!88654 e!573188))

(declare-fun e!573189 () Bool)

(assert (=> start!88654 e!573189))

(assert (=> start!88654 true))

(declare-fun b!1018650 () Bool)

(declare-fun res!683023 () Bool)

(assert (=> b!1018650 (=> (not res!683023) (not e!573188))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!529 (List!21604 (_ BitVec 64)) Bool)

(assert (=> b!1018650 (= res!683023 (containsKey!529 l!996 key!261))))

(declare-fun b!1018651 () Bool)

(declare-fun ListPrimitiveSize!133 (List!21604) Int)

(assert (=> b!1018651 (= e!573188 (< (ListPrimitiveSize!133 l!996) 0))))

(declare-fun b!1018652 () Bool)

(declare-fun tp_is_empty!23731 () Bool)

(declare-fun tp!71077 () Bool)

(assert (=> b!1018652 (= e!573189 (and tp_is_empty!23731 tp!71077))))

(assert (= (and start!88654 res!683024) b!1018650))

(assert (= (and b!1018650 res!683023) b!1018651))

(assert (= (and start!88654 (is-Cons!21600 l!996)) b!1018652))

(declare-fun m!939433 () Bool)

(assert (=> start!88654 m!939433))

(declare-fun m!939435 () Bool)

(assert (=> b!1018650 m!939435))

(declare-fun m!939437 () Bool)

(assert (=> b!1018651 m!939437))

(push 1)

(assert tp_is_empty!23731)

(assert (not b!1018650))

(assert (not b!1018651))

(assert (not b!1018652))

(assert (not start!88654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121923 () Bool)

(declare-fun lt!449583 () Int)

(assert (=> d!121923 (>= lt!449583 0)))

(declare-fun e!573212 () Int)

(assert (=> d!121923 (= lt!449583 e!573212)))

(declare-fun c!103192 () Bool)

(assert (=> d!121923 (= c!103192 (is-Nil!21601 l!996))))

(assert (=> d!121923 (= (ListPrimitiveSize!133 l!996) lt!449583)))

(declare-fun b!1018683 () Bool)

(assert (=> b!1018683 (= e!573212 0)))

(declare-fun b!1018684 () Bool)

(assert (=> b!1018684 (= e!573212 (+ 1 (ListPrimitiveSize!133 (t!30608 l!996))))))

(assert (= (and d!121923 c!103192) b!1018683))

(assert (= (and d!121923 (not c!103192)) b!1018684))

(declare-fun m!939451 () Bool)

(assert (=> b!1018684 m!939451))

(assert (=> b!1018651 d!121923))

(declare-fun d!121925 () Bool)

(declare-fun res!683057 () Bool)

(declare-fun e!573228 () Bool)

(assert (=> d!121925 (=> res!683057 e!573228)))

(assert (=> d!121925 (= res!683057 (and (is-Cons!21600 l!996) (= (_1!7700 (h!22798 l!996)) key!261)))))

(assert (=> d!121925 (= (containsKey!529 l!996 key!261) e!573228)))

(declare-fun b!1018703 () Bool)

(declare-fun e!573230 () Bool)

(assert (=> b!1018703 (= e!573228 e!573230)))

(declare-fun res!683059 () Bool)

(assert (=> b!1018703 (=> (not res!683059) (not e!573230))))

(assert (=> b!1018703 (= res!683059 (and (or (not (is-Cons!21600 l!996)) (bvsle (_1!7700 (h!22798 l!996)) key!261)) (is-Cons!21600 l!996) (bvslt (_1!7700 (h!22798 l!996)) key!261)))))

(declare-fun b!1018705 () Bool)

(assert (=> b!1018705 (= e!573230 (containsKey!529 (t!30608 l!996) key!261))))

(assert (= (and d!121925 (not res!683057)) b!1018703))

(assert (= (and b!1018703 res!683059) b!1018705))

(declare-fun m!939461 () Bool)

(assert (=> b!1018705 m!939461))

(assert (=> b!1018650 d!121925))

(declare-fun d!121935 () Bool)

(declare-fun res!683071 () Bool)

(declare-fun e!573249 () Bool)

(assert (=> d!121935 (=> res!683071 e!573249)))

(assert (=> d!121935 (= res!683071 (or (is-Nil!21601 l!996) (is-Nil!21601 (t!30608 l!996))))))

(assert (=> d!121935 (= (isStrictlySorted!669 l!996) e!573249)))

(declare-fun b!1018731 () Bool)

(declare-fun e!573250 () Bool)

(assert (=> b!1018731 (= e!573249 e!573250)))

(declare-fun res!683072 () Bool)

(assert (=> b!1018731 (=> (not res!683072) (not e!573250))))

(assert (=> b!1018731 (= res!683072 (bvslt (_1!7700 (h!22798 l!996)) (_1!7700 (h!22798 (t!30608 l!996)))))))

(declare-fun b!1018732 () Bool)

(assert (=> b!1018732 (= e!573250 (isStrictlySorted!669 (t!30608 l!996)))))

(assert (= (and d!121935 (not res!683071)) b!1018731))

(assert (= (and b!1018731 res!683072) b!1018732))

(declare-fun m!939467 () Bool)

(assert (=> b!1018732 m!939467))

(assert (=> start!88654 d!121935))

(declare-fun b!1018739 () Bool)

(declare-fun e!573255 () Bool)

(declare-fun tp!71092 () Bool)

(assert (=> b!1018739 (= e!573255 (and tp_is_empty!23731 tp!71092))))

(assert (=> b!1018652 (= tp!71077 e!573255)))

(assert (= (and b!1018652 (is-Cons!21600 (t!30608 l!996))) b!1018739))

(push 1)

