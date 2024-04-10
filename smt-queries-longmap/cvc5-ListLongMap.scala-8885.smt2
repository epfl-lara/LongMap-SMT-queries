; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107906 () Bool)

(assert start!107906)

(declare-fun res!847636 () Bool)

(declare-fun e!727860 () Bool)

(assert (=> start!107906 (=> (not res!847636) (not e!727860))))

(declare-datatypes ((B!2180 0))(
  ( (B!2181 (val!16686 Int)) )
))
(declare-datatypes ((tuple2!21454 0))(
  ( (tuple2!21455 (_1!10738 (_ BitVec 64)) (_2!10738 B!2180)) )
))
(declare-datatypes ((List!28612 0))(
  ( (Nil!28609) (Cons!28608 (h!29817 tuple2!21454) (t!42148 List!28612)) )
))
(declare-fun l!595 () List!28612)

(declare-fun isStrictlySorted!864 (List!28612) Bool)

(assert (=> start!107906 (= res!847636 (isStrictlySorted!864 l!595))))

(assert (=> start!107906 e!727860))

(declare-fun e!727861 () Bool)

(assert (=> start!107906 e!727861))

(assert (=> start!107906 true))

(declare-fun b!1275173 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1275173 (= e!727860 (and (or (not (is-Cons!28608 l!595)) (not (= (_1!10738 (h!29817 l!595)) key!173))) (or (not (is-Cons!28608 l!595)) (= (_1!10738 (h!29817 l!595)) key!173)) (not (is-Nil!28609 l!595))))))

(declare-fun b!1275174 () Bool)

(declare-fun tp_is_empty!33223 () Bool)

(declare-fun tp!98096 () Bool)

(assert (=> b!1275174 (= e!727861 (and tp_is_empty!33223 tp!98096))))

(assert (= (and start!107906 res!847636) b!1275173))

(assert (= (and start!107906 (is-Cons!28608 l!595)) b!1275174))

(declare-fun m!1171543 () Bool)

(assert (=> start!107906 m!1171543))

(push 1)

(assert (not start!107906))

(assert (not b!1275174))

(assert tp_is_empty!33223)

(check-sat)

(pop 1)

