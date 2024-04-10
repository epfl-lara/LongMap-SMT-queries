; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137908 () Bool)

(assert start!137908)

(declare-fun res!1081690 () Bool)

(declare-fun e!883890 () Bool)

(assert (=> start!137908 (=> (not res!1081690) (not e!883890))))

(declare-datatypes ((B!2858 0))(
  ( (B!2859 (val!19791 Int)) )
))
(declare-datatypes ((tuple2!25750 0))(
  ( (tuple2!25751 (_1!12886 (_ BitVec 64)) (_2!12886 B!2858)) )
))
(declare-datatypes ((List!36911 0))(
  ( (Nil!36908) (Cons!36907 (h!38450 tuple2!25750) (t!51825 List!36911)) )
))
(declare-fun l!548 () List!36911)

(declare-fun isStrictlySorted!1145 (List!36911) Bool)

(assert (=> start!137908 (= res!1081690 (isStrictlySorted!1145 l!548))))

(assert (=> start!137908 e!883890))

(declare-fun e!883891 () Bool)

(assert (=> start!137908 e!883891))

(assert (=> start!137908 true))

(declare-fun b!1583492 () Bool)

(declare-fun res!1081691 () Bool)

(assert (=> b!1583492 (=> (not res!1081691) (not e!883890))))

(declare-fun key!159 () (_ BitVec 64))

(assert (=> b!1583492 (= res!1081691 (and (not (= (_1!12886 (h!38450 l!548)) key!159)) (is-Cons!36907 l!548)))))

(declare-fun b!1583493 () Bool)

(declare-fun ListPrimitiveSize!214 (List!36911) Int)

(assert (=> b!1583493 (= e!883890 (>= (ListPrimitiveSize!214 (t!51825 l!548)) (ListPrimitiveSize!214 l!548)))))

(declare-fun b!1583494 () Bool)

(declare-fun tp_is_empty!39391 () Bool)

(declare-fun tp!114967 () Bool)

(assert (=> b!1583494 (= e!883891 (and tp_is_empty!39391 tp!114967))))

(assert (= (and start!137908 res!1081690) b!1583492))

(assert (= (and b!1583492 res!1081691) b!1583493))

(assert (= (and start!137908 (is-Cons!36907 l!548)) b!1583494))

(declare-fun m!1453325 () Bool)

(assert (=> start!137908 m!1453325))

(declare-fun m!1453327 () Bool)

(assert (=> b!1583493 m!1453327))

(declare-fun m!1453329 () Bool)

(assert (=> b!1583493 m!1453329))

(push 1)

(assert (not start!137908))

(assert (not b!1583493))

(assert (not b!1583494))

(assert tp_is_empty!39391)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167247 () Bool)

(declare-fun res!1081720 () Bool)

(declare-fun e!883922 () Bool)

(assert (=> d!167247 (=> res!1081720 e!883922)))

(assert (=> d!167247 (= res!1081720 (or (is-Nil!36908 l!548) (is-Nil!36908 (t!51825 l!548))))))

(assert (=> d!167247 (= (isStrictlySorted!1145 l!548) e!883922)))

(declare-fun b!1583533 () Bool)

(declare-fun e!883923 () Bool)

(assert (=> b!1583533 (= e!883922 e!883923)))

(declare-fun res!1081721 () Bool)

(assert (=> b!1583533 (=> (not res!1081721) (not e!883923))))

(assert (=> b!1583533 (= res!1081721 (bvslt (_1!12886 (h!38450 l!548)) (_1!12886 (h!38450 (t!51825 l!548)))))))

(declare-fun b!1583534 () Bool)

(assert (=> b!1583534 (= e!883923 (isStrictlySorted!1145 (t!51825 l!548)))))

(assert (= (and d!167247 (not res!1081720)) b!1583533))

(assert (= (and b!1583533 res!1081721) b!1583534))

(declare-fun m!1453347 () Bool)

(assert (=> b!1583534 m!1453347))

(assert (=> start!137908 d!167247))

(declare-fun d!167253 () Bool)

(declare-fun lt!677186 () Int)

(assert (=> d!167253 (>= lt!677186 0)))

(declare-fun e!883937 () Int)

(assert (=> d!167253 (= lt!677186 e!883937)))

(declare-fun c!146749 () Bool)

(assert (=> d!167253 (= c!146749 (is-Nil!36908 (t!51825 l!548)))))

(assert (=> d!167253 (= (ListPrimitiveSize!214 (t!51825 l!548)) lt!677186)))

(declare-fun b!1583560 () Bool)

(assert (=> b!1583560 (= e!883937 0)))

(declare-fun b!1583561 () Bool)

(assert (=> b!1583561 (= e!883937 (+ 1 (ListPrimitiveSize!214 (t!51825 (t!51825 l!548)))))))

(assert (= (and d!167253 c!146749) b!1583560))

(assert (= (and d!167253 (not c!146749)) b!1583561))

(declare-fun m!1453353 () Bool)

(assert (=> b!1583561 m!1453353))

(assert (=> b!1583493 d!167253))

(declare-fun d!167259 () Bool)

(declare-fun lt!677187 () Int)

(assert (=> d!167259 (>= lt!677187 0)))

(declare-fun e!883938 () Int)

(assert (=> d!167259 (= lt!677187 e!883938)))

(declare-fun c!146750 () Bool)

(assert (=> d!167259 (= c!146750 (is-Nil!36908 l!548))))

(assert (=> d!167259 (= (ListPrimitiveSize!214 l!548) lt!677187)))

(declare-fun b!1583562 () Bool)

(assert (=> b!1583562 (= e!883938 0)))

(declare-fun b!1583563 () Bool)

(assert (=> b!1583563 (= e!883938 (+ 1 (ListPrimitiveSize!214 (t!51825 l!548))))))

(assert (= (and d!167259 c!146750) b!1583562))

(assert (= (and d!167259 (not c!146750)) b!1583563))

(assert (=> b!1583563 m!1453327))

(assert (=> b!1583493 d!167259))

(declare-fun b!1583569 () Bool)

(declare-fun e!883942 () Bool)

(declare-fun tp!114982 () Bool)

(assert (=> b!1583569 (= e!883942 (and tp_is_empty!39391 tp!114982))))

(assert (=> b!1583494 (= tp!114967 e!883942)))

(assert (= (and b!1583494 (is-Cons!36907 (t!51825 l!548))) b!1583569))

(push 1)

