; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43768 () Bool)

(assert start!43768)

(declare-fun res!288274 () Bool)

(declare-fun e!284796 () Bool)

(assert (=> start!43768 (=> (not res!288274) (not e!284796))))

(declare-datatypes ((B!1098 0))(
  ( (B!1099 (val!7001 Int)) )
))
(declare-datatypes ((tuple2!9204 0))(
  ( (tuple2!9205 (_1!4613 (_ BitVec 64)) (_2!4613 B!1098)) )
))
(declare-datatypes ((List!9265 0))(
  ( (Nil!9262) (Cons!9261 (h!10117 tuple2!9204) (t!15487 List!9265)) )
))
(declare-fun l!956 () List!9265)

(declare-fun isStrictlySorted!404 (List!9265) Bool)

(assert (=> start!43768 (= res!288274 (isStrictlySorted!404 l!956))))

(assert (=> start!43768 e!284796))

(declare-fun e!284795 () Bool)

(assert (=> start!43768 e!284795))

(assert (=> start!43768 true))

(declare-fun tp_is_empty!13907 () Bool)

(assert (=> start!43768 tp_is_empty!13907))

(declare-fun b!483855 () Bool)

(declare-fun res!288275 () Bool)

(assert (=> b!483855 (=> (not res!288275) (not e!284796))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!367 (List!9265 (_ BitVec 64)) Bool)

(assert (=> b!483855 (= res!288275 (not (containsKey!367 l!956 key!251)))))

(declare-fun b!483856 () Bool)

(assert (=> b!483856 (= e!284796 false)))

(declare-fun lt!219295 () List!9265)

(declare-fun value!166 () B!1098)

(declare-fun insertStrictlySorted!222 (List!9265 (_ BitVec 64) B!1098) List!9265)

(assert (=> b!483856 (= lt!219295 (insertStrictlySorted!222 l!956 key!251 value!166))))

(declare-fun b!483857 () Bool)

(declare-fun tp!43450 () Bool)

(assert (=> b!483857 (= e!284795 (and tp_is_empty!13907 tp!43450))))

(assert (= (and start!43768 res!288274) b!483855))

(assert (= (and b!483855 res!288275) b!483856))

(assert (= (and start!43768 (is-Cons!9261 l!956)) b!483857))

(declare-fun m!464745 () Bool)

(assert (=> start!43768 m!464745))

(declare-fun m!464747 () Bool)

(assert (=> b!483855 m!464747))

(declare-fun m!464749 () Bool)

(assert (=> b!483856 m!464749))

(push 1)

(assert tp_is_empty!13907)

(assert (not b!483855))

(assert (not b!483856))

(assert (not start!43768))

(assert (not b!483857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

