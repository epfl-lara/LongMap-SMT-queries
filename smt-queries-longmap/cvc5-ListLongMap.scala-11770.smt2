; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138616 () Bool)

(assert start!138616)

(declare-fun res!1083579 () Bool)

(declare-fun e!886547 () Bool)

(assert (=> start!138616 (=> (not res!1083579) (not e!886547))))

(declare-datatypes ((B!2952 0))(
  ( (B!2953 (val!19838 Int)) )
))
(declare-datatypes ((tuple2!25904 0))(
  ( (tuple2!25905 (_1!12963 (_ BitVec 64)) (_2!12963 B!2952)) )
))
(declare-datatypes ((List!36990 0))(
  ( (Nil!36987) (Cons!36986 (h!38547 tuple2!25904) (t!51901 List!36990)) )
))
(declare-fun l!556 () List!36990)

(declare-fun isStrictlySorted!1171 (List!36990) Bool)

(assert (=> start!138616 (= res!1083579 (isStrictlySorted!1171 l!556))))

(assert (=> start!138616 e!886547))

(declare-fun e!886546 () Bool)

(assert (=> start!138616 e!886546))

(assert (=> start!138616 true))

(declare-fun tp_is_empty!39485 () Bool)

(assert (=> start!138616 tp_is_empty!39485))

(declare-fun b!1587682 () Bool)

(declare-fun res!1083578 () Bool)

(assert (=> b!1587682 (=> (not res!1083578) (not e!886547))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1587682 (= res!1083578 (and (bvsge (_1!12963 (h!38547 l!556)) newKey!21) (is-Cons!36986 l!556) (= (_1!12963 (h!38547 l!556)) newKey!21)))))

(declare-fun b!1587683 () Bool)

(assert (=> b!1587683 (= e!886547 false)))

(declare-fun newValue!21 () B!2952)

(declare-fun lt!678243 () Bool)

(declare-fun $colon$colon!1027 (List!36990 tuple2!25904) List!36990)

(assert (=> b!1587683 (= lt!678243 (isStrictlySorted!1171 ($colon$colon!1027 (t!51901 l!556) (tuple2!25905 newKey!21 newValue!21))))))

(declare-fun b!1587684 () Bool)

(declare-fun tp!115195 () Bool)

(assert (=> b!1587684 (= e!886546 (and tp_is_empty!39485 tp!115195))))

(assert (= (and start!138616 res!1083579) b!1587682))

(assert (= (and b!1587682 res!1083578) b!1587683))

(assert (= (and start!138616 (is-Cons!36986 l!556)) b!1587684))

(declare-fun m!1456461 () Bool)

(assert (=> start!138616 m!1456461))

(declare-fun m!1456463 () Bool)

(assert (=> b!1587683 m!1456463))

(assert (=> b!1587683 m!1456463))

(declare-fun m!1456465 () Bool)

(assert (=> b!1587683 m!1456465))

(push 1)

(assert (not start!138616))

(assert (not b!1587683))

(assert (not b!1587684))

(assert tp_is_empty!39485)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

