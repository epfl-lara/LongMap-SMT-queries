; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138150 () Bool)

(assert start!138150)

(declare-fun res!1082556 () Bool)

(declare-fun e!884817 () Bool)

(assert (=> start!138150 (=> (not res!1082556) (not e!884817))))

(declare-datatypes ((B!2964 0))(
  ( (B!2965 (val!19844 Int)) )
))
(declare-datatypes ((tuple2!25924 0))(
  ( (tuple2!25925 (_1!12973 (_ BitVec 64)) (_2!12973 B!2964)) )
))
(declare-datatypes ((List!37005 0))(
  ( (Nil!37002) (Cons!37001 (h!38545 tuple2!25924) (t!51915 List!37005)) )
))
(declare-fun l!556 () List!37005)

(declare-fun isStrictlySorted!1187 (List!37005) Bool)

(assert (=> start!138150 (= res!1082556 (isStrictlySorted!1187 l!556))))

(assert (=> start!138150 e!884817))

(declare-fun e!884816 () Bool)

(assert (=> start!138150 e!884816))

(assert (=> start!138150 true))

(declare-fun tp_is_empty!39497 () Bool)

(assert (=> start!138150 tp_is_empty!39497))

(declare-fun b!1584905 () Bool)

(declare-fun res!1082555 () Bool)

(assert (=> b!1584905 (=> (not res!1082555) (not e!884817))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1584905 (= res!1082555 (and (or (not (is-Cons!37001 l!556)) (bvsge (_1!12973 (h!38545 l!556)) newKey!21)) (or (not (is-Cons!37001 l!556)) (not (= (_1!12973 (h!38545 l!556)) newKey!21))) (or (not (is-Cons!37001 l!556)) (bvsle (_1!12973 (h!38545 l!556)) newKey!21)) (is-Nil!37002 l!556)))))

(declare-fun b!1584906 () Bool)

(assert (=> b!1584906 (= e!884817 false)))

(declare-fun lt!677066 () Bool)

(declare-fun newValue!21 () B!2964)

(declare-fun $colon$colon!1043 (List!37005 tuple2!25924) List!37005)

(assert (=> b!1584906 (= lt!677066 (isStrictlySorted!1187 ($colon$colon!1043 Nil!37002 (tuple2!25925 newKey!21 newValue!21))))))

(declare-fun b!1584907 () Bool)

(declare-fun tp!115212 () Bool)

(assert (=> b!1584907 (= e!884816 (and tp_is_empty!39497 tp!115212))))

(assert (= (and start!138150 res!1082556) b!1584905))

(assert (= (and b!1584905 res!1082555) b!1584906))

(assert (= (and start!138150 (is-Cons!37001 l!556)) b!1584907))

(declare-fun m!1453287 () Bool)

(assert (=> start!138150 m!1453287))

(declare-fun m!1453289 () Bool)

(assert (=> b!1584906 m!1453289))

(assert (=> b!1584906 m!1453289))

(declare-fun m!1453291 () Bool)

(assert (=> b!1584906 m!1453291))

(push 1)

(assert (not start!138150))

(assert (not b!1584906))

(assert (not b!1584907))

(assert tp_is_empty!39497)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

