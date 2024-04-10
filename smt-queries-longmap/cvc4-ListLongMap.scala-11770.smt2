; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138186 () Bool)

(assert start!138186)

(declare-fun res!1082687 () Bool)

(declare-fun e!885018 () Bool)

(assert (=> start!138186 (=> (not res!1082687) (not e!885018))))

(declare-datatypes ((B!2964 0))(
  ( (B!2965 (val!19844 Int)) )
))
(declare-datatypes ((tuple2!25856 0))(
  ( (tuple2!25857 (_1!12939 (_ BitVec 64)) (_2!12939 B!2964)) )
))
(declare-datatypes ((List!36964 0))(
  ( (Nil!36961) (Cons!36960 (h!38503 tuple2!25856) (t!51882 List!36964)) )
))
(declare-fun l!556 () List!36964)

(declare-fun isStrictlySorted!1189 (List!36964) Bool)

(assert (=> start!138186 (= res!1082687 (isStrictlySorted!1189 l!556))))

(assert (=> start!138186 e!885018))

(declare-fun e!885017 () Bool)

(assert (=> start!138186 e!885017))

(assert (=> start!138186 true))

(declare-fun tp_is_empty!39497 () Bool)

(assert (=> start!138186 tp_is_empty!39497))

(declare-fun b!1585221 () Bool)

(declare-fun res!1082686 () Bool)

(assert (=> b!1585221 (=> (not res!1082686) (not e!885018))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585221 (= res!1082686 (and (or (not (is-Cons!36960 l!556)) (bvsge (_1!12939 (h!38503 l!556)) newKey!21)) (or (not (is-Cons!36960 l!556)) (not (= (_1!12939 (h!38503 l!556)) newKey!21))) (or (not (is-Cons!36960 l!556)) (bvsle (_1!12939 (h!38503 l!556)) newKey!21)) (is-Nil!36961 l!556)))))

(declare-fun b!1585222 () Bool)

(assert (=> b!1585222 (= e!885018 false)))

(declare-fun lt!677349 () Bool)

(declare-fun newValue!21 () B!2964)

(declare-fun $colon$colon!1039 (List!36964 tuple2!25856) List!36964)

(assert (=> b!1585222 (= lt!677349 (isStrictlySorted!1189 ($colon$colon!1039 Nil!36961 (tuple2!25857 newKey!21 newValue!21))))))

(declare-fun b!1585223 () Bool)

(declare-fun tp!115212 () Bool)

(assert (=> b!1585223 (= e!885017 (and tp_is_empty!39497 tp!115212))))

(assert (= (and start!138186 res!1082687) b!1585221))

(assert (= (and b!1585221 res!1082686) b!1585222))

(assert (= (and start!138186 (is-Cons!36960 l!556)) b!1585223))

(declare-fun m!1454169 () Bool)

(assert (=> start!138186 m!1454169))

(declare-fun m!1454171 () Bool)

(assert (=> b!1585222 m!1454171))

(assert (=> b!1585222 m!1454171))

(declare-fun m!1454173 () Bool)

(assert (=> b!1585222 m!1454173))

(push 1)

(assert (not b!1585222))

(assert (not start!138186))

(assert (not b!1585223))

(assert tp_is_empty!39497)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

