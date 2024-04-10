; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7612 () Bool)

(assert start!7612)

(declare-fun b!48571 () Bool)

(declare-fun e!31182 () Bool)

(assert (=> b!48571 (= e!31182 false)))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-datatypes ((B!956 0))(
  ( (B!957 (val!1098 Int)) )
))
(declare-fun newValue!147 () B!956)

(declare-datatypes ((Unit!1363 0))(
  ( (Unit!1364) )
))
(declare-fun lt!20666 () Unit!1363)

(declare-datatypes ((tuple2!1778 0))(
  ( (tuple2!1779 (_1!900 (_ BitVec 64)) (_2!900 B!956)) )
))
(declare-datatypes ((List!1295 0))(
  ( (Nil!1292) (Cons!1291 (h!1871 tuple2!1778) (t!4323 List!1295)) )
))
(declare-fun l!1333 () List!1295)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!4 (List!1295 (_ BitVec 64) B!956) Unit!1363)

(assert (=> b!48571 (= lt!20666 (lemmaInsertStrictlySortedNotContainedContent!4 (t!4323 l!1333) newKey!147 newValue!147))))

(declare-fun b!48569 () Bool)

(declare-fun res!28201 () Bool)

(assert (=> b!48569 (=> (not res!28201) (not e!31182))))

(declare-fun containsKey!111 (List!1295 (_ BitVec 64)) Bool)

(assert (=> b!48569 (= res!28201 (not (containsKey!111 l!1333 newKey!147)))))

(declare-fun b!48570 () Bool)

(declare-fun res!28202 () Bool)

(assert (=> b!48570 (=> (not res!28202) (not e!31182))))

(assert (=> b!48570 (= res!28202 (not (is-Nil!1292 l!1333)))))

(declare-fun b!48572 () Bool)

(declare-fun e!31183 () Bool)

(declare-fun tp_is_empty!2107 () Bool)

(declare-fun tp!6419 () Bool)

(assert (=> b!48572 (= e!31183 (and tp_is_empty!2107 tp!6419))))

(declare-fun res!28200 () Bool)

(assert (=> start!7612 (=> (not res!28200) (not e!31182))))

(declare-fun isStrictlySorted!262 (List!1295) Bool)

(assert (=> start!7612 (= res!28200 (isStrictlySorted!262 l!1333))))

(assert (=> start!7612 e!31182))

(assert (=> start!7612 e!31183))

(assert (=> start!7612 true))

(assert (=> start!7612 tp_is_empty!2107))

(assert (= (and start!7612 res!28200) b!48569))

(assert (= (and b!48569 res!28201) b!48570))

(assert (= (and b!48570 res!28202) b!48571))

(assert (= (and start!7612 (is-Cons!1291 l!1333)) b!48572))

(declare-fun m!42315 () Bool)

(assert (=> b!48571 m!42315))

(declare-fun m!42317 () Bool)

(assert (=> b!48569 m!42317))

(declare-fun m!42319 () Bool)

(assert (=> start!7612 m!42319))

(push 1)

(assert tp_is_empty!2107)

(assert (not b!48569))

(assert (not start!7612))

(assert (not b!48572))

(assert (not b!48571))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

