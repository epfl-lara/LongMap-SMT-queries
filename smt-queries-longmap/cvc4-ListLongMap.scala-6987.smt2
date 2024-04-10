; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88592 () Bool)

(assert start!88592)

(declare-fun res!682798 () Bool)

(declare-fun e!572933 () Bool)

(assert (=> start!88592 (=> (not res!682798) (not e!572933))))

(declare-datatypes ((B!1632 0))(
  ( (B!1633 (val!11900 Int)) )
))
(declare-datatypes ((tuple2!15346 0))(
  ( (tuple2!15347 (_1!7684 (_ BitVec 64)) (_2!7684 B!1632)) )
))
(declare-datatypes ((List!21588 0))(
  ( (Nil!21585) (Cons!21584 (h!22782 tuple2!15346) (t!30589 List!21588)) )
))
(declare-fun l!996 () List!21588)

(declare-fun isStrictlySorted!653 (List!21588) Bool)

(assert (=> start!88592 (= res!682798 (isStrictlySorted!653 l!996))))

(assert (=> start!88592 e!572933))

(declare-fun e!572934 () Bool)

(assert (=> start!88592 e!572934))

(assert (=> start!88592 true))

(declare-fun tp_is_empty!23699 () Bool)

(assert (=> start!88592 tp_is_empty!23699))

(declare-fun b!1018263 () Bool)

(declare-fun res!682799 () Bool)

(assert (=> b!1018263 (=> (not res!682799) (not e!572933))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!513 (List!21588 (_ BitVec 64)) Bool)

(assert (=> b!1018263 (= res!682799 (containsKey!513 l!996 key!261))))

(declare-fun b!1018264 () Bool)

(assert (=> b!1018264 (= e!572933 false)))

(declare-fun value!172 () B!1632)

(declare-fun lt!449505 () List!21588)

(declare-fun insertStrictlySorted!334 (List!21588 (_ BitVec 64) B!1632) List!21588)

(assert (=> b!1018264 (= lt!449505 (insertStrictlySorted!334 l!996 key!261 value!172))))

(declare-fun b!1018265 () Bool)

(declare-fun tp!71017 () Bool)

(assert (=> b!1018265 (= e!572934 (and tp_is_empty!23699 tp!71017))))

(assert (= (and start!88592 res!682798) b!1018263))

(assert (= (and b!1018263 res!682799) b!1018264))

(assert (= (and start!88592 (is-Cons!21584 l!996)) b!1018265))

(declare-fun m!939187 () Bool)

(assert (=> start!88592 m!939187))

(declare-fun m!939189 () Bool)

(assert (=> b!1018263 m!939189))

(declare-fun m!939191 () Bool)

(assert (=> b!1018264 m!939191))

(push 1)

(assert tp_is_empty!23699)

(assert (not b!1018265))

(assert (not start!88592))

(assert (not b!1018263))

(assert (not b!1018264))

(check-sat)

(pop 1)

