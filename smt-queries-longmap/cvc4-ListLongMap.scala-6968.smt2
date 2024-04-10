; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88024 () Bool)

(assert start!88024)

(declare-fun b!1016077 () Bool)

(assert (=> b!1016077 true))

(assert (=> b!1016077 true))

(declare-fun res!681545 () Bool)

(declare-fun e!571581 () Bool)

(assert (=> start!88024 (=> (not res!681545) (not e!571581))))

(declare-datatypes ((B!1518 0))(
  ( (B!1519 (val!11843 Int)) )
))
(declare-datatypes ((tuple2!15232 0))(
  ( (tuple2!15233 (_1!7627 (_ BitVec 64)) (_2!7627 B!1518)) )
))
(declare-datatypes ((List!21509 0))(
  ( (Nil!21506) (Cons!21505 (h!22703 tuple2!15232) (t!30510 List!21509)) )
))
(declare-fun l!1114 () List!21509)

(declare-fun isStrictlySorted!611 (List!21509) Bool)

(assert (=> start!88024 (= res!681545 (isStrictlySorted!611 l!1114))))

(assert (=> start!88024 e!571581))

(declare-fun e!571582 () Bool)

(assert (=> start!88024 e!571582))

(assert (=> start!88024 true))

(declare-fun tp_is_empty!23585 () Bool)

(assert (=> start!88024 tp_is_empty!23585))

(declare-fun b!1016075 () Bool)

(declare-fun newHead!31 () tuple2!15232)

(assert (=> b!1016075 (= e!571581 (not (isStrictlySorted!611 (Cons!21505 newHead!31 l!1114))))))

(declare-fun b!1016076 () Bool)

(declare-fun res!681547 () Bool)

(assert (=> b!1016076 (=> (not res!681547) (not e!571581))))

(declare-fun head!960 (List!21509) tuple2!15232)

(assert (=> b!1016076 (= res!681547 (bvslt (_1!7627 newHead!31) (_1!7627 (head!960 l!1114))))))

(declare-fun res!681548 () Bool)

(assert (=> b!1016077 (=> (not res!681548) (not e!571581))))

(declare-datatypes ((List!21510 0))(
  ( (Nil!21507) (Cons!21506 (h!22704 (_ BitVec 64)) (t!30511 List!21510)) )
))
(declare-fun keys!40 () List!21510)

(declare-fun lambda!998 () Int)

(declare-fun forall!273 (List!21510 Int) Bool)

(assert (=> b!1016077 (= res!681548 (forall!273 keys!40 lambda!998))))

(declare-fun b!1016078 () Bool)

(declare-fun tp!70724 () Bool)

(assert (=> b!1016078 (= e!571582 (and tp_is_empty!23585 tp!70724))))

(declare-fun b!1016079 () Bool)

(declare-fun res!681546 () Bool)

(assert (=> b!1016079 (=> (not res!681546) (not e!571581))))

(assert (=> b!1016079 (= res!681546 (not (is-Cons!21506 keys!40)))))

(declare-fun b!1016080 () Bool)

(declare-fun res!681549 () Bool)

(assert (=> b!1016080 (=> (not res!681549) (not e!571581))))

(declare-fun isEmpty!873 (List!21509) Bool)

(assert (=> b!1016080 (= res!681549 (not (isEmpty!873 l!1114)))))

(assert (= (and start!88024 res!681545) b!1016080))

(assert (= (and b!1016080 res!681549) b!1016077))

(assert (= (and b!1016077 res!681548) b!1016076))

(assert (= (and b!1016076 res!681547) b!1016079))

(assert (= (and b!1016079 res!681546) b!1016075))

(assert (= (and start!88024 (is-Cons!21505 l!1114)) b!1016078))

(declare-fun m!937915 () Bool)

(assert (=> b!1016075 m!937915))

(declare-fun m!937917 () Bool)

(assert (=> start!88024 m!937917))

(declare-fun m!937919 () Bool)

(assert (=> b!1016080 m!937919))

(declare-fun m!937921 () Bool)

(assert (=> b!1016077 m!937921))

(declare-fun m!937923 () Bool)

(assert (=> b!1016076 m!937923))

(push 1)

(assert (not b!1016077))

(assert (not start!88024))

(assert tp_is_empty!23585)

(assert (not b!1016080))

(assert (not b!1016075))

(assert (not b!1016076))

(assert (not b!1016078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121125 () Bool)

(declare-fun res!681574 () Bool)

(declare-fun e!571607 () Bool)

(assert (=> d!121125 (=> res!681574 e!571607)))

(assert (=> d!121125 (= res!681574 (is-Nil!21507 keys!40))))

(assert (=> d!121125 (= (forall!273 keys!40 lambda!998) e!571607)))

(declare-fun b!1016109 () Bool)

(declare-fun e!571608 () Bool)

(assert (=> b!1016109 (= e!571607 e!571608)))

(declare-fun res!681575 () Bool)

(assert (=> b!1016109 (=> (not res!681575) (not e!571608))))

(declare-fun dynLambda!1909 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016109 (= res!681575 (dynLambda!1909 lambda!998 (h!22704 keys!40)))))

(declare-fun b!1016110 () Bool)

(assert (=> b!1016110 (= e!571608 (forall!273 (t!30511 keys!40) lambda!998))))

(assert (= (and d!121125 (not res!681574)) b!1016109))

(assert (= (and b!1016109 res!681575) b!1016110))

(declare-fun b_lambda!15479 () Bool)

(assert (=> (not b_lambda!15479) (not b!1016109)))

(declare-fun m!937937 () Bool)

(assert (=> b!1016109 m!937937))

(declare-fun m!937939 () Bool)

(assert (=> b!1016110 m!937939))

(assert (=> b!1016077 d!121125))

(declare-fun d!121131 () Bool)

(declare-fun res!681588 () Bool)

(declare-fun e!571627 () Bool)

(assert (=> d!121131 (=> res!681588 e!571627)))

(assert (=> d!121131 (= res!681588 (or (is-Nil!21506 (Cons!21505 newHead!31 l!1114)) (is-Nil!21506 (t!30510 (Cons!21505 newHead!31 l!1114)))))))

(assert (=> d!121131 (= (isStrictlySorted!611 (Cons!21505 newHead!31 l!1114)) e!571627)))

(declare-fun b!1016133 () Bool)

(declare-fun e!571628 () Bool)

(assert (=> b!1016133 (= e!571627 e!571628)))

(declare-fun res!681589 () Bool)

(assert (=> b!1016133 (=> (not res!681589) (not e!571628))))

(assert (=> b!1016133 (= res!681589 (bvslt (_1!7627 (h!22703 (Cons!21505 newHead!31 l!1114))) (_1!7627 (h!22703 (t!30510 (Cons!21505 newHead!31 l!1114))))))))

(declare-fun b!1016134 () Bool)

(assert (=> b!1016134 (= e!571628 (isStrictlySorted!611 (t!30510 (Cons!21505 newHead!31 l!1114))))))

(assert (= (and d!121131 (not res!681588)) b!1016133))

(assert (= (and b!1016133 res!681589) b!1016134))

(declare-fun m!937947 () Bool)

(assert (=> b!1016134 m!937947))

(assert (=> b!1016075 d!121131))

(declare-fun d!121139 () Bool)

(assert (=> d!121139 (= (head!960 l!1114) (h!22703 l!1114))))

(assert (=> b!1016076 d!121139))

(declare-fun d!121141 () Bool)

(declare-fun res!681590 () Bool)

(declare-fun e!571629 () Bool)

(assert (=> d!121141 (=> res!681590 e!571629)))

(assert (=> d!121141 (= res!681590 (or (is-Nil!21506 l!1114) (is-Nil!21506 (t!30510 l!1114))))))

(assert (=> d!121141 (= (isStrictlySorted!611 l!1114) e!571629)))

(declare-fun b!1016135 () Bool)

(declare-fun e!571630 () Bool)

(assert (=> b!1016135 (= e!571629 e!571630)))

(declare-fun res!681591 () Bool)

(assert (=> b!1016135 (=> (not res!681591) (not e!571630))))

(assert (=> b!1016135 (= res!681591 (bvslt (_1!7627 (h!22703 l!1114)) (_1!7627 (h!22703 (t!30510 l!1114)))))))

(declare-fun b!1016136 () Bool)

(assert (=> b!1016136 (= e!571630 (isStrictlySorted!611 (t!30510 l!1114)))))

(assert (= (and d!121141 (not res!681590)) b!1016135))

(assert (= (and b!1016135 res!681591) b!1016136))

(declare-fun m!937951 () Bool)

(assert (=> b!1016136 m!937951))

(assert (=> start!88024 d!121141))

(declare-fun d!121143 () Bool)

(assert (=> d!121143 (= (isEmpty!873 l!1114) (is-Nil!21506 l!1114))))

(assert (=> b!1016080 d!121143))

(declare-fun b!1016141 () Bool)

(declare-fun e!571633 () Bool)

(declare-fun tp!70733 () Bool)

(assert (=> b!1016141 (= e!571633 (and tp_is_empty!23585 tp!70733))))

(assert (=> b!1016078 (= tp!70724 e!571633)))

(assert (= (and b!1016078 (is-Cons!21505 (t!30510 l!1114))) b!1016141))

(declare-fun b_lambda!15485 () Bool)

(assert (= b_lambda!15479 (or b!1016077 b_lambda!15485)))

(declare-fun bs!29500 () Bool)

(declare-fun d!121145 () Bool)

(assert (= bs!29500 (and d!121145 b!1016077)))

(declare-fun value!178 () B!1518)

(declare-datatypes ((Option!597 0))(
  ( (Some!596 (v!14447 B!1518)) (None!595) )
))
(declare-fun getValueByKey!546 (List!21509 (_ BitVec 64)) Option!597)

(assert (=> bs!29500 (= (dynLambda!1909 lambda!998 (h!22704 keys!40)) (= (getValueByKey!546 l!1114 (h!22704 keys!40)) (Some!596 value!178)))))

(declare-fun m!937953 () Bool)

(assert (=> bs!29500 m!937953))

(assert (=> b!1016109 d!121145))

(push 1)

(assert tp_is_empty!23585)

(assert (not b_lambda!15485))

(assert (not b!1016134))

(assert (not b!1016141))

(assert (not b!1016136))

(assert (not b!1016110))

(assert (not bs!29500))

(check-sat)

