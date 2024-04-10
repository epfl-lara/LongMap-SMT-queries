; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107844 () Bool)

(assert start!107844)

(declare-fun res!847441 () Bool)

(declare-fun e!727597 () Bool)

(assert (=> start!107844 (=> (not res!847441) (not e!727597))))

(declare-datatypes ((B!2166 0))(
  ( (B!2167 (val!16679 Int)) )
))
(declare-datatypes ((tuple2!21440 0))(
  ( (tuple2!21441 (_1!10731 (_ BitVec 64)) (_2!10731 B!2166)) )
))
(declare-datatypes ((List!28605 0))(
  ( (Nil!28602) (Cons!28601 (h!29810 tuple2!21440) (t!42138 List!28605)) )
))
(declare-fun l!595 () List!28605)

(declare-fun isStrictlySorted!857 (List!28605) Bool)

(assert (=> start!107844 (= res!847441 (isStrictlySorted!857 l!595))))

(assert (=> start!107844 e!727597))

(declare-fun e!727596 () Bool)

(assert (=> start!107844 e!727596))

(assert (=> start!107844 true))

(declare-fun b!1274836 () Bool)

(declare-fun res!847440 () Bool)

(assert (=> b!1274836 (=> (not res!847440) (not e!727597))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274836 (= res!847440 (and (not (= (_1!10731 (h!29810 l!595)) key!173)) (is-Cons!28601 l!595)))))

(declare-fun b!1274837 () Bool)

(declare-fun ListPrimitiveSize!168 (List!28605) Int)

(assert (=> b!1274837 (= e!727597 (>= (ListPrimitiveSize!168 (t!42138 l!595)) (ListPrimitiveSize!168 l!595)))))

(declare-fun b!1274838 () Bool)

(declare-fun tp_is_empty!33209 () Bool)

(declare-fun tp!98045 () Bool)

(assert (=> b!1274838 (= e!727596 (and tp_is_empty!33209 tp!98045))))

(assert (= (and start!107844 res!847441) b!1274836))

(assert (= (and b!1274836 res!847440) b!1274837))

(assert (= (and start!107844 (is-Cons!28601 l!595)) b!1274838))

(declare-fun m!1171375 () Bool)

(assert (=> start!107844 m!1171375))

(declare-fun m!1171377 () Bool)

(assert (=> b!1274837 m!1171377))

(declare-fun m!1171379 () Bool)

(assert (=> b!1274837 m!1171379))

(push 1)

(assert (not start!107844))

(assert (not b!1274837))

(assert (not b!1274838))

(assert tp_is_empty!33209)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140233 () Bool)

(declare-fun res!847458 () Bool)

(declare-fun e!727628 () Bool)

(assert (=> d!140233 (=> res!847458 e!727628)))

(assert (=> d!140233 (= res!847458 (or (is-Nil!28602 l!595) (is-Nil!28602 (t!42138 l!595))))))

(assert (=> d!140233 (= (isStrictlySorted!857 l!595) e!727628)))

(declare-fun b!1274881 () Bool)

