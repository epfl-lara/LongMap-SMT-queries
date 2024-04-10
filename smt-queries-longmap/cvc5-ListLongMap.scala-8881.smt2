; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107822 () Bool)

(assert start!107822)

(declare-fun b!1274730 () Bool)

(declare-fun e!727510 () Bool)

(declare-fun tp_is_empty!33199 () Bool)

(declare-fun tp!98021 () Bool)

(assert (=> b!1274730 (= e!727510 (and tp_is_empty!33199 tp!98021))))

(declare-fun b!1274729 () Bool)

(declare-fun e!727509 () Bool)

(declare-datatypes ((B!2156 0))(
  ( (B!2157 (val!16674 Int)) )
))
(declare-datatypes ((tuple2!21430 0))(
  ( (tuple2!21431 (_1!10726 (_ BitVec 64)) (_2!10726 B!2156)) )
))
(declare-datatypes ((List!28600 0))(
  ( (Nil!28597) (Cons!28596 (h!29805 tuple2!21430) (t!42133 List!28600)) )
))
(declare-fun l!595 () List!28600)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!700 (List!28600 (_ BitVec 64)) Bool)

(assert (=> b!1274729 (= e!727509 (containsKey!700 (t!42133 l!595) key!173))))

(declare-fun res!847363 () Bool)

(declare-fun e!727508 () Bool)

(assert (=> start!107822 (=> (not res!847363) (not e!727508))))

(declare-fun isStrictlySorted!852 (List!28600) Bool)

(assert (=> start!107822 (= res!847363 (isStrictlySorted!852 l!595))))

(assert (=> start!107822 e!727508))

(assert (=> start!107822 e!727510))

(assert (=> start!107822 true))

(declare-fun b!1274727 () Bool)

(declare-fun res!847362 () Bool)

(assert (=> b!1274727 (=> (not res!847362) (not e!727508))))

(assert (=> b!1274727 (= res!847362 (and (is-Cons!28596 l!595) (= (_1!10726 (h!29805 l!595)) key!173)))))

(declare-fun b!1274728 () Bool)

(assert (=> b!1274728 (= e!727508 e!727509)))

(declare-fun res!847361 () Bool)

(assert (=> b!1274728 (=> res!847361 e!727509)))

(assert (=> b!1274728 (= res!847361 (not (isStrictlySorted!852 (t!42133 l!595))))))

(assert (= (and start!107822 res!847363) b!1274727))

(assert (= (and b!1274727 res!847362) b!1274728))

(assert (= (and b!1274728 (not res!847361)) b!1274729))

(assert (= (and start!107822 (is-Cons!28596 l!595)) b!1274730))

(declare-fun m!1171333 () Bool)

(assert (=> b!1274729 m!1171333))

(declare-fun m!1171335 () Bool)

(assert (=> start!107822 m!1171335))

(declare-fun m!1171337 () Bool)

(assert (=> b!1274728 m!1171337))

(push 1)

(assert (not start!107822))

(assert (not b!1274728))

(assert tp_is_empty!33199)

(assert (not b!1274729))

(assert (not b!1274730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140207 () Bool)

(declare-fun res!847398 () Bool)

(declare-fun e!727545 () Bool)

(assert (=> d!140207 (=> res!847398 e!727545)))

(assert (=> d!140207 (= res!847398 (and (is-Cons!28596 (t!42133 l!595)) (= (_1!10726 (h!29805 (t!42133 l!595))) key!173)))))

(assert (=> d!140207 (= (containsKey!700 (t!42133 l!595) key!173) e!727545)))

(declare-fun b!1274771 () Bool)

(declare-fun e!727546 () Bool)

(assert (=> b!1274771 (= e!727545 e!727546)))

(declare-fun res!847399 () Bool)

(assert (=> b!1274771 (=> (not res!847399) (not e!727546))))

(assert (=> b!1274771 (= res!847399 (and (or (not (is-Cons!28596 (t!42133 l!595))) (bvsle (_1!10726 (h!29805 (t!42133 l!595))) key!173)) (is-Cons!28596 (t!42133 l!595)) (bvslt (_1!10726 (h!29805 (t!42133 l!595))) key!173)))))

(declare-fun b!1274772 () Bool)

(assert (=> b!1274772 (= e!727546 (containsKey!700 (t!42133 (t!42133 l!595)) key!173))))

(assert (= (and d!140207 (not res!847398)) b!1274771))

(assert (= (and b!1274771 res!847399) b!1274772))

(declare-fun m!1171353 () Bool)

(assert (=> b!1274772 m!1171353))

(assert (=> b!1274729 d!140207))

(declare-fun d!140213 () Bool)

(declare-fun res!847406 () Bool)

(declare-fun e!727556 () Bool)

(assert (=> d!140213 (=> res!847406 e!727556)))

(assert (=> d!140213 (= res!847406 (or (is-Nil!28597 (t!42133 l!595)) (is-Nil!28597 (t!42133 (t!42133 l!595)))))))

(assert (=> d!140213 (= (isStrictlySorted!852 (t!42133 l!595)) e!727556)))

(declare-fun b!1274784 () Bool)

(declare-fun e!727557 () Bool)

(assert (=> b!1274784 (= e!727556 e!727557)))

(declare-fun res!847407 () Bool)

(assert (=> b!1274784 (=> (not res!847407) (not e!727557))))

(assert (=> b!1274784 (= res!847407 (bvslt (_1!10726 (h!29805 (t!42133 l!595))) (_1!10726 (h!29805 (t!42133 (t!42133 l!595))))))))

(declare-fun b!1274785 () Bool)

(assert (=> b!1274785 (= e!727557 (isStrictlySorted!852 (t!42133 (t!42133 l!595))))))

(assert (= (and d!140213 (not res!847406)) b!1274784))

(assert (= (and b!1274784 res!847407) b!1274785))

(declare-fun m!1171357 () Bool)

(assert (=> b!1274785 m!1171357))

(assert (=> b!1274728 d!140213))

(declare-fun d!140217 () Bool)

(declare-fun res!847408 () Bool)

(declare-fun e!727558 () Bool)

(assert (=> d!140217 (=> res!847408 e!727558)))

(assert (=> d!140217 (= res!847408 (or (is-Nil!28597 l!595) (is-Nil!28597 (t!42133 l!595))))))

(assert (=> d!140217 (= (isStrictlySorted!852 l!595) e!727558)))

(declare-fun b!1274786 () Bool)

(declare-fun e!727559 () Bool)

(assert (=> b!1274786 (= e!727558 e!727559)))

(declare-fun res!847409 () Bool)

(assert (=> b!1274786 (=> (not res!847409) (not e!727559))))

(assert (=> b!1274786 (= res!847409 (bvslt (_1!10726 (h!29805 l!595)) (_1!10726 (h!29805 (t!42133 l!595)))))))

(declare-fun b!1274787 () Bool)

(assert (=> b!1274787 (= e!727559 (isStrictlySorted!852 (t!42133 l!595)))))

(assert (= (and d!140217 (not res!847408)) b!1274786))

(assert (= (and b!1274786 res!847409) b!1274787))

(assert (=> b!1274787 m!1171337))

(assert (=> start!107822 d!140217))

(declare-fun b!1274792 () Bool)

(declare-fun e!727562 () Bool)

(declare-fun tp!98033 () Bool)

(assert (=> b!1274792 (= e!727562 (and tp_is_empty!33199 tp!98033))))

(assert (=> b!1274730 (= tp!98021 e!727562)))

(assert (= (and b!1274730 (is-Cons!28596 (t!42133 l!595))) b!1274792))

(push 1)

(assert (not b!1274792))

(assert (not b!1274787))

(assert (not b!1274772))

(assert (not b!1274785))

(assert tp_is_empty!33199)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

