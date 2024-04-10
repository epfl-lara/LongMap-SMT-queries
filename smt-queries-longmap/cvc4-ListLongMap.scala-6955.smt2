; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87730 () Bool)

(assert start!87730)

(declare-fun b!1014548 () Bool)

(declare-fun res!680807 () Bool)

(declare-fun e!570735 () Bool)

(assert (=> b!1014548 (=> (not res!680807) (not e!570735))))

(declare-datatypes ((B!1440 0))(
  ( (B!1441 (val!11804 Int)) )
))
(declare-datatypes ((tuple2!15154 0))(
  ( (tuple2!15155 (_1!7588 (_ BitVec 64)) (_2!7588 B!1440)) )
))
(declare-datatypes ((List!21440 0))(
  ( (Nil!21437) (Cons!21436 (h!22634 tuple2!15154) (t!30441 List!21440)) )
))
(declare-fun l!412 () List!21440)

(declare-fun value!115 () B!1440)

(assert (=> b!1014548 (= res!680807 (and (not (= (_2!7588 (h!22634 l!412)) value!115)) (is-Cons!21436 l!412)))))

(declare-fun res!680808 () Bool)

(assert (=> start!87730 (=> (not res!680808) (not e!570735))))

(declare-fun isStrictlySorted!578 (List!21440) Bool)

(assert (=> start!87730 (= res!680808 (isStrictlySorted!578 l!412))))

(assert (=> start!87730 e!570735))

(declare-fun e!570736 () Bool)

(assert (=> start!87730 e!570736))

(declare-fun tp_is_empty!23507 () Bool)

(assert (=> start!87730 tp_is_empty!23507))

(declare-fun b!1014551 () Bool)

(declare-fun tp!70544 () Bool)

(assert (=> b!1014551 (= e!570736 (and tp_is_empty!23507 tp!70544))))

(declare-fun b!1014549 () Bool)

(declare-fun res!680806 () Bool)

(assert (=> b!1014549 (=> (not res!680806) (not e!570735))))

(declare-datatypes ((List!21441 0))(
  ( (Nil!21438) (Cons!21437 (h!22635 (_ BitVec 64)) (t!30442 List!21441)) )
))
(declare-fun isEmpty!838 (List!21441) Bool)

(declare-fun getKeysOf!51 (List!21440 B!1440) List!21441)

(assert (=> b!1014549 (= res!680806 (not (isEmpty!838 (getKeysOf!51 (t!30441 l!412) value!115))))))

(declare-fun b!1014550 () Bool)

(declare-fun ListPrimitiveSize!117 (List!21440) Int)

(assert (=> b!1014550 (= e!570735 (>= (ListPrimitiveSize!117 (t!30441 l!412)) (ListPrimitiveSize!117 l!412)))))

(assert (= (and start!87730 res!680808) b!1014548))

(assert (= (and b!1014548 res!680807) b!1014549))

(assert (= (and b!1014549 res!680806) b!1014550))

(assert (= (and start!87730 (is-Cons!21436 l!412)) b!1014551))

(declare-fun m!937097 () Bool)

(assert (=> start!87730 m!937097))

(declare-fun m!937099 () Bool)

(assert (=> b!1014549 m!937099))

(assert (=> b!1014549 m!937099))

(declare-fun m!937101 () Bool)

(assert (=> b!1014549 m!937101))

(declare-fun m!937103 () Bool)

(assert (=> b!1014550 m!937103))

(declare-fun m!937105 () Bool)

(assert (=> b!1014550 m!937105))

(push 1)

(assert tp_is_empty!23507)

(assert (not b!1014550))

(assert (not b!1014549))

(assert (not start!87730))

(assert (not b!1014551))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120787 () Bool)

(declare-fun res!680825 () Bool)

(declare-fun e!570761 () Bool)

(assert (=> d!120787 (=> res!680825 e!570761)))

(assert (=> d!120787 (= res!680825 (or (is-Nil!21437 l!412) (is-Nil!21437 (t!30441 l!412))))))

(assert (=> d!120787 (= (isStrictlySorted!578 l!412) e!570761)))

(declare-fun b!1014584 () Bool)

(declare-fun e!570762 () Bool)

(assert (=> b!1014584 (= e!570761 e!570762)))

(declare-fun res!680826 () Bool)

(assert (=> b!1014584 (=> (not res!680826) (not e!570762))))

(assert (=> b!1014584 (= res!680826 (bvslt (_1!7588 (h!22634 l!412)) (_1!7588 (h!22634 (t!30441 l!412)))))))

