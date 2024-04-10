; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43786 () Bool)

(assert start!43786)

(declare-fun res!288355 () Bool)

(declare-fun e!284858 () Bool)

(assert (=> start!43786 (=> (not res!288355) (not e!284858))))

(declare-datatypes ((B!1116 0))(
  ( (B!1117 (val!7010 Int)) )
))
(declare-datatypes ((tuple2!9222 0))(
  ( (tuple2!9223 (_1!4622 (_ BitVec 64)) (_2!4622 B!1116)) )
))
(declare-datatypes ((List!9274 0))(
  ( (Nil!9271) (Cons!9270 (h!10126 tuple2!9222) (t!15496 List!9274)) )
))
(declare-fun l!956 () List!9274)

(declare-fun isStrictlySorted!413 (List!9274) Bool)

(assert (=> start!43786 (= res!288355 (isStrictlySorted!413 l!956))))

(assert (=> start!43786 e!284858))

(declare-fun e!284859 () Bool)

(assert (=> start!43786 e!284859))

(assert (=> start!43786 true))

(declare-fun tp_is_empty!13925 () Bool)

(assert (=> start!43786 tp_is_empty!13925))

(declare-fun b!483963 () Bool)

(declare-fun res!288356 () Bool)

(assert (=> b!483963 (=> (not res!288356) (not e!284858))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!376 (List!9274 (_ BitVec 64)) Bool)

(assert (=> b!483963 (= res!288356 (not (containsKey!376 l!956 key!251)))))

(declare-fun b!483964 () Bool)

(assert (=> b!483964 (= e!284858 false)))

(declare-fun lt!219331 () List!9274)

(declare-fun value!166 () B!1116)

(declare-fun insertStrictlySorted!231 (List!9274 (_ BitVec 64) B!1116) List!9274)

(assert (=> b!483964 (= lt!219331 (insertStrictlySorted!231 l!956 key!251 value!166))))

(declare-fun b!483965 () Bool)

(declare-fun tp!43477 () Bool)

(assert (=> b!483965 (= e!284859 (and tp_is_empty!13925 tp!43477))))

(assert (= (and start!43786 res!288355) b!483963))

(assert (= (and b!483963 res!288356) b!483964))

(assert (= (and start!43786 (is-Cons!9270 l!956)) b!483965))

(declare-fun m!464835 () Bool)

(assert (=> start!43786 m!464835))

(declare-fun m!464837 () Bool)

(assert (=> b!483963 m!464837))

(declare-fun m!464839 () Bool)

(assert (=> b!483964 m!464839))

(push 1)

(assert (not start!43786))

(assert tp_is_empty!13925)

(assert (not b!483963))

(assert (not b!483965))

(assert (not b!483964))

(check-sat)

(pop 1)

