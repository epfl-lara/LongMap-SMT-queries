; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88910 () Bool)

(assert start!88910)

(declare-fun res!683855 () Bool)

(declare-fun e!574265 () Bool)

(assert (=> start!88910 (=> (not res!683855) (not e!574265))))

(declare-datatypes ((B!1722 0))(
  ( (B!1723 (val!11945 Int)) )
))
(declare-datatypes ((tuple2!15436 0))(
  ( (tuple2!15437 (_1!7729 (_ BitVec 64)) (_2!7729 B!1722)) )
))
(declare-datatypes ((List!21633 0))(
  ( (Nil!21630) (Cons!21629 (h!22827 tuple2!15436) (t!30643 List!21633)) )
))
(declare-fun l!1367 () List!21633)

(declare-fun isStrictlySorted!698 (List!21633) Bool)

(assert (=> start!88910 (= res!683855 (isStrictlySorted!698 l!1367))))

(assert (=> start!88910 e!574265))

(declare-fun e!574266 () Bool)

(assert (=> start!88910 e!574266))

(assert (=> start!88910 true))

(declare-fun tp_is_empty!23789 () Bool)

(assert (=> start!88910 tp_is_empty!23789))

(declare-fun b!1020286 () Bool)

(assert (=> b!1020286 (= e!574265 false)))

(declare-fun value!188 () B!1722)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun lt!449832 () Bool)

(declare-fun contains!5924 (List!21633 tuple2!15436) Bool)

(assert (=> b!1020286 (= lt!449832 (contains!5924 l!1367 (tuple2!15437 key!393 value!188)))))

(declare-fun b!1020287 () Bool)

(declare-fun tp!71233 () Bool)

(assert (=> b!1020287 (= e!574266 (and tp_is_empty!23789 tp!71233))))

(assert (= (and start!88910 res!683855) b!1020286))

(assert (= (and start!88910 (is-Cons!21629 l!1367)) b!1020287))

(declare-fun m!940299 () Bool)

(assert (=> start!88910 m!940299))

(declare-fun m!940301 () Bool)

(assert (=> b!1020286 m!940301))

(push 1)

(assert (not start!88910))

(assert (not b!1020286))

(assert (not b!1020287))

(assert tp_is_empty!23789)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

