; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138618 () Bool)

(assert start!138618)

(declare-fun res!1083585 () Bool)

(declare-fun e!886552 () Bool)

(assert (=> start!138618 (=> (not res!1083585) (not e!886552))))

(declare-datatypes ((B!2954 0))(
  ( (B!2955 (val!19839 Int)) )
))
(declare-datatypes ((tuple2!25906 0))(
  ( (tuple2!25907 (_1!12964 (_ BitVec 64)) (_2!12964 B!2954)) )
))
(declare-datatypes ((List!36991 0))(
  ( (Nil!36988) (Cons!36987 (h!38548 tuple2!25906) (t!51902 List!36991)) )
))
(declare-fun l!556 () List!36991)

(declare-fun isStrictlySorted!1172 (List!36991) Bool)

(assert (=> start!138618 (= res!1083585 (isStrictlySorted!1172 l!556))))

(assert (=> start!138618 e!886552))

(declare-fun e!886553 () Bool)

(assert (=> start!138618 e!886553))

(assert (=> start!138618 true))

(declare-fun tp_is_empty!39487 () Bool)

(assert (=> start!138618 tp_is_empty!39487))

(declare-fun b!1587691 () Bool)

(declare-fun res!1083584 () Bool)

(assert (=> b!1587691 (=> (not res!1083584) (not e!886552))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1587691 (= res!1083584 (and (or (not ((_ is Cons!36987) l!556)) (bvsge (_1!12964 (h!38548 l!556)) newKey!21)) (not (= (_1!12964 (h!38548 l!556)) newKey!21)) ((_ is Cons!36987) l!556) (bvsgt (_1!12964 (h!38548 l!556)) newKey!21)))))

(declare-fun b!1587692 () Bool)

(assert (=> b!1587692 (= e!886552 false)))

(declare-fun newValue!21 () B!2954)

(declare-fun lt!678246 () Bool)

(declare-fun $colon$colon!1028 (List!36991 tuple2!25906) List!36991)

(assert (=> b!1587692 (= lt!678246 (isStrictlySorted!1172 ($colon$colon!1028 l!556 (tuple2!25907 newKey!21 newValue!21))))))

(declare-fun b!1587693 () Bool)

(declare-fun tp!115198 () Bool)

(assert (=> b!1587693 (= e!886553 (and tp_is_empty!39487 tp!115198))))

(assert (= (and start!138618 res!1083585) b!1587691))

(assert (= (and b!1587691 res!1083584) b!1587692))

(assert (= (and start!138618 ((_ is Cons!36987) l!556)) b!1587693))

(declare-fun m!1456467 () Bool)

(assert (=> start!138618 m!1456467))

(declare-fun m!1456469 () Bool)

(assert (=> b!1587692 m!1456469))

(assert (=> b!1587692 m!1456469))

(declare-fun m!1456471 () Bool)

(assert (=> b!1587692 m!1456471))

(check-sat (not b!1587692) (not start!138618) (not b!1587693) tp_is_empty!39487)
(check-sat)
