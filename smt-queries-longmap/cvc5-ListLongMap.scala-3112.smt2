; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43764 () Bool)

(assert start!43764)

(declare-fun res!288263 () Bool)

(declare-fun e!284784 () Bool)

(assert (=> start!43764 (=> (not res!288263) (not e!284784))))

(declare-datatypes ((B!1094 0))(
  ( (B!1095 (val!6999 Int)) )
))
(declare-datatypes ((tuple2!9200 0))(
  ( (tuple2!9201 (_1!4611 (_ BitVec 64)) (_2!4611 B!1094)) )
))
(declare-datatypes ((List!9263 0))(
  ( (Nil!9260) (Cons!9259 (h!10115 tuple2!9200) (t!15485 List!9263)) )
))
(declare-fun l!956 () List!9263)

(declare-fun isStrictlySorted!402 (List!9263) Bool)

(assert (=> start!43764 (= res!288263 (isStrictlySorted!402 l!956))))

(assert (=> start!43764 e!284784))

(declare-fun e!284783 () Bool)

(assert (=> start!43764 e!284783))

(assert (=> start!43764 true))

(declare-fun tp_is_empty!13903 () Bool)

(assert (=> start!43764 tp_is_empty!13903))

(declare-fun b!483837 () Bool)

(declare-fun res!288262 () Bool)

(assert (=> b!483837 (=> (not res!288262) (not e!284784))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!365 (List!9263 (_ BitVec 64)) Bool)

(assert (=> b!483837 (= res!288262 (not (containsKey!365 l!956 key!251)))))

(declare-fun b!483838 () Bool)

(assert (=> b!483838 (= e!284784 false)))

(declare-fun lt!219289 () List!9263)

(declare-fun value!166 () B!1094)

(declare-fun insertStrictlySorted!220 (List!9263 (_ BitVec 64) B!1094) List!9263)

(assert (=> b!483838 (= lt!219289 (insertStrictlySorted!220 l!956 key!251 value!166))))

(declare-fun b!483839 () Bool)

(declare-fun tp!43444 () Bool)

(assert (=> b!483839 (= e!284783 (and tp_is_empty!13903 tp!43444))))

(assert (= (and start!43764 res!288263) b!483837))

(assert (= (and b!483837 res!288262) b!483838))

(assert (= (and start!43764 (is-Cons!9259 l!956)) b!483839))

(declare-fun m!464733 () Bool)

(assert (=> start!43764 m!464733))

(declare-fun m!464735 () Bool)

(assert (=> b!483837 m!464735))

(declare-fun m!464737 () Bool)

(assert (=> b!483838 m!464737))

(push 1)

(assert (not b!483839))

(assert (not start!43764))

(assert (not b!483838))

(assert tp_is_empty!13903)

(assert (not b!483837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

