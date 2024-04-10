; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43770 () Bool)

(assert start!43770)

(declare-fun b!483870 () Bool)

(declare-fun e!284803 () Bool)

(assert (=> b!483870 (= e!284803 (not true))))

(declare-datatypes ((B!1100 0))(
  ( (B!1101 (val!7002 Int)) )
))
(declare-datatypes ((tuple2!9206 0))(
  ( (tuple2!9207 (_1!4614 (_ BitVec 64)) (_2!4614 B!1100)) )
))
(declare-datatypes ((List!9266 0))(
  ( (Nil!9263) (Cons!9262 (h!10118 tuple2!9206) (t!15488 List!9266)) )
))
(declare-fun l!956 () List!9266)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun value!166 () B!1100)

(declare-fun length!8 (List!9266) Int)

(declare-fun insertStrictlySorted!223 (List!9266 (_ BitVec 64) B!1100) List!9266)

(assert (=> b!483870 (= (length!8 (insertStrictlySorted!223 (t!15488 l!956) key!251 value!166)) (+ 1 (length!8 (t!15488 l!956))))))

(declare-datatypes ((Unit!14176 0))(
  ( (Unit!14177) )
))
(declare-fun lt!219300 () Unit!14176)

(declare-fun lemmaAddNewKeyIncrementSize!1 (List!9266 (_ BitVec 64) B!1100) Unit!14176)

(assert (=> b!483870 (= lt!219300 (lemmaAddNewKeyIncrementSize!1 (t!15488 l!956) key!251 value!166))))

(declare-fun b!483871 () Bool)

(declare-fun res!288288 () Bool)

(assert (=> b!483871 (=> (not res!288288) (not e!284803))))

(declare-fun isStrictlySorted!405 (List!9266) Bool)

(assert (=> b!483871 (= res!288288 (isStrictlySorted!405 (t!15488 l!956)))))

(declare-fun b!483872 () Bool)

(declare-fun res!288290 () Bool)

(declare-fun e!284804 () Bool)

(assert (=> b!483872 (=> (not res!288290) (not e!284804))))

(declare-fun containsKey!368 (List!9266 (_ BitVec 64)) Bool)

(assert (=> b!483872 (= res!288290 (not (containsKey!368 l!956 key!251)))))

(declare-fun b!483873 () Bool)

(declare-fun e!284805 () Bool)

(declare-fun tp_is_empty!13909 () Bool)

(declare-fun tp!43453 () Bool)

(assert (=> b!483873 (= e!284805 (and tp_is_empty!13909 tp!43453))))

(declare-fun b!483874 () Bool)

(assert (=> b!483874 (= e!284804 e!284803)))

(declare-fun res!288286 () Bool)

(assert (=> b!483874 (=> (not res!288286) (not e!284803))))

(assert (=> b!483874 (= res!288286 (and (is-Cons!9262 l!956) (bvslt (_1!4614 (h!10118 l!956)) key!251)))))

(declare-fun lt!219301 () List!9266)

(assert (=> b!483874 (= lt!219301 (insertStrictlySorted!223 l!956 key!251 value!166))))

(declare-fun b!483875 () Bool)

(declare-fun res!288287 () Bool)

(assert (=> b!483875 (=> (not res!288287) (not e!284803))))

(assert (=> b!483875 (= res!288287 (not (containsKey!368 (t!15488 l!956) key!251)))))

(declare-fun res!288289 () Bool)

(assert (=> start!43770 (=> (not res!288289) (not e!284804))))

(assert (=> start!43770 (= res!288289 (isStrictlySorted!405 l!956))))

(assert (=> start!43770 e!284804))

(assert (=> start!43770 e!284805))

(assert (=> start!43770 true))

(assert (=> start!43770 tp_is_empty!13909))

(assert (= (and start!43770 res!288289) b!483872))

(assert (= (and b!483872 res!288290) b!483874))

(assert (= (and b!483874 res!288286) b!483871))

(assert (= (and b!483871 res!288288) b!483875))

(assert (= (and b!483875 res!288287) b!483870))

(assert (= (and start!43770 (is-Cons!9262 l!956)) b!483873))

(declare-fun m!464751 () Bool)

(assert (=> b!483871 m!464751))

(declare-fun m!464753 () Bool)

(assert (=> b!483872 m!464753))

(declare-fun m!464755 () Bool)

(assert (=> b!483870 m!464755))

(assert (=> b!483870 m!464755))

(declare-fun m!464757 () Bool)

(assert (=> b!483870 m!464757))

(declare-fun m!464759 () Bool)

(assert (=> b!483870 m!464759))

(declare-fun m!464761 () Bool)

(assert (=> b!483870 m!464761))

(declare-fun m!464763 () Bool)

(assert (=> b!483874 m!464763))

(declare-fun m!464765 () Bool)

(assert (=> b!483875 m!464765))

(declare-fun m!464767 () Bool)

(assert (=> start!43770 m!464767))

(push 1)

