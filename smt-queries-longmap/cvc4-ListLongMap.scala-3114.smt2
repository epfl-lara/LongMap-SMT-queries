; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43780 () Bool)

(assert start!43780)

(declare-fun res!288337 () Bool)

(declare-fun e!284840 () Bool)

(assert (=> start!43780 (=> (not res!288337) (not e!284840))))

(declare-datatypes ((B!1110 0))(
  ( (B!1111 (val!7007 Int)) )
))
(declare-datatypes ((tuple2!9216 0))(
  ( (tuple2!9217 (_1!4619 (_ BitVec 64)) (_2!4619 B!1110)) )
))
(declare-datatypes ((List!9271 0))(
  ( (Nil!9268) (Cons!9267 (h!10123 tuple2!9216) (t!15493 List!9271)) )
))
(declare-fun l!956 () List!9271)

(declare-fun isStrictlySorted!410 (List!9271) Bool)

(assert (=> start!43780 (= res!288337 (isStrictlySorted!410 l!956))))

(assert (=> start!43780 e!284840))

(declare-fun e!284841 () Bool)

(assert (=> start!43780 e!284841))

(assert (=> start!43780 true))

(declare-fun tp_is_empty!13919 () Bool)

(assert (=> start!43780 tp_is_empty!13919))

(declare-fun b!483936 () Bool)

(declare-fun res!288338 () Bool)

(assert (=> b!483936 (=> (not res!288338) (not e!284840))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!373 (List!9271 (_ BitVec 64)) Bool)

(assert (=> b!483936 (= res!288338 (not (containsKey!373 l!956 key!251)))))

(declare-fun b!483937 () Bool)

(assert (=> b!483937 (= e!284840 false)))

(declare-fun lt!219322 () List!9271)

(declare-fun value!166 () B!1110)

(declare-fun insertStrictlySorted!228 (List!9271 (_ BitVec 64) B!1110) List!9271)

(assert (=> b!483937 (= lt!219322 (insertStrictlySorted!228 l!956 key!251 value!166))))

(declare-fun b!483938 () Bool)

(declare-fun tp!43468 () Bool)

(assert (=> b!483938 (= e!284841 (and tp_is_empty!13919 tp!43468))))

(assert (= (and start!43780 res!288337) b!483936))

(assert (= (and b!483936 res!288338) b!483937))

(assert (= (and start!43780 (is-Cons!9267 l!956)) b!483938))

(declare-fun m!464817 () Bool)

(assert (=> start!43780 m!464817))

(declare-fun m!464819 () Bool)

(assert (=> b!483936 m!464819))

(declare-fun m!464821 () Bool)

(assert (=> b!483937 m!464821))

(push 1)

(assert (not b!483938))

(assert (not b!483937))

(assert (not start!43780))

(assert (not b!483936))

(assert tp_is_empty!13919)

(check-sat)

(pop 1)

