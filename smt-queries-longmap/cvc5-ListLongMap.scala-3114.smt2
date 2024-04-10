; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43776 () Bool)

(assert start!43776)

(declare-fun res!288325 () Bool)

(declare-fun e!284829 () Bool)

(assert (=> start!43776 (=> (not res!288325) (not e!284829))))

(declare-datatypes ((B!1106 0))(
  ( (B!1107 (val!7005 Int)) )
))
(declare-datatypes ((tuple2!9212 0))(
  ( (tuple2!9213 (_1!4617 (_ BitVec 64)) (_2!4617 B!1106)) )
))
(declare-datatypes ((List!9269 0))(
  ( (Nil!9266) (Cons!9265 (h!10121 tuple2!9212) (t!15491 List!9269)) )
))
(declare-fun l!956 () List!9269)

(declare-fun isStrictlySorted!408 (List!9269) Bool)

(assert (=> start!43776 (= res!288325 (isStrictlySorted!408 l!956))))

(assert (=> start!43776 e!284829))

(declare-fun e!284828 () Bool)

(assert (=> start!43776 e!284828))

(assert (=> start!43776 true))

(declare-fun tp_is_empty!13915 () Bool)

(assert (=> start!43776 tp_is_empty!13915))

(declare-fun b!483918 () Bool)

(declare-fun res!288326 () Bool)

(assert (=> b!483918 (=> (not res!288326) (not e!284829))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!371 (List!9269 (_ BitVec 64)) Bool)

(assert (=> b!483918 (= res!288326 (not (containsKey!371 l!956 key!251)))))

(declare-fun b!483919 () Bool)

(assert (=> b!483919 (= e!284829 false)))

(declare-fun lt!219316 () List!9269)

(declare-fun value!166 () B!1106)

(declare-fun insertStrictlySorted!226 (List!9269 (_ BitVec 64) B!1106) List!9269)

(assert (=> b!483919 (= lt!219316 (insertStrictlySorted!226 l!956 key!251 value!166))))

(declare-fun b!483920 () Bool)

(declare-fun tp!43462 () Bool)

(assert (=> b!483920 (= e!284828 (and tp_is_empty!13915 tp!43462))))

(assert (= (and start!43776 res!288325) b!483918))

(assert (= (and b!483918 res!288326) b!483919))

(assert (= (and start!43776 (is-Cons!9265 l!956)) b!483920))

(declare-fun m!464805 () Bool)

(assert (=> start!43776 m!464805))

(declare-fun m!464807 () Bool)

(assert (=> b!483918 m!464807))

(declare-fun m!464809 () Bool)

(assert (=> b!483919 m!464809))

(push 1)

(assert (not b!483918))

(assert (not b!483920))

(assert tp_is_empty!13915)

(assert (not b!483919))

(assert (not start!43776))

(check-sat)

