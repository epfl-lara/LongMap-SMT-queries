; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138366 () Bool)

(assert start!138366)

(declare-fun res!1082644 () Bool)

(declare-fun e!885504 () Bool)

(assert (=> start!138366 (=> (not res!1082644) (not e!885504))))

(declare-datatypes ((B!2864 0))(
  ( (B!2865 (val!19794 Int)) )
))
(declare-datatypes ((tuple2!25816 0))(
  ( (tuple2!25817 (_1!12919 (_ BitVec 64)) (_2!12919 B!2864)) )
))
(declare-datatypes ((List!36946 0))(
  ( (Nil!36943) (Cons!36942 (h!38503 tuple2!25816) (t!51852 List!36946)) )
))
(declare-fun l!548 () List!36946)

(declare-fun isStrictlySorted!1136 (List!36946) Bool)

(assert (=> start!138366 (= res!1082644 (isStrictlySorted!1136 l!548))))

(assert (=> start!138366 e!885504))

(declare-fun e!885505 () Bool)

(assert (=> start!138366 e!885505))

(assert (=> start!138366 true))

(declare-fun b!1586081 () Bool)

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1586081 (= e!885504 (and (or (not ((_ is Cons!36942) l!548)) (not (= (_1!12919 (h!38503 l!548)) key!159))) (or (not ((_ is Cons!36942) l!548)) (= (_1!12919 (h!38503 l!548)) key!159)) (not ((_ is Nil!36943) l!548))))))

(declare-fun b!1586082 () Bool)

(declare-fun tp_is_empty!39397 () Bool)

(declare-fun tp!114986 () Bool)

(assert (=> b!1586082 (= e!885505 (and tp_is_empty!39397 tp!114986))))

(assert (= (and start!138366 res!1082644) b!1586081))

(assert (= (and start!138366 ((_ is Cons!36942) l!548)) b!1586082))

(declare-fun m!1455681 () Bool)

(assert (=> start!138366 m!1455681))

(check-sat (not start!138366) (not b!1586082) tp_is_empty!39397)
(check-sat)
