; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7172 () Bool)

(assert start!7172)

(declare-fun res!26909 () Bool)

(declare-fun e!29273 () Bool)

(assert (=> start!7172 (=> (not res!26909) (not e!29273))))

(declare-datatypes ((B!858 0))(
  ( (B!859 (val!1016 Int)) )
))
(declare-datatypes ((tuple2!1680 0))(
  ( (tuple2!1681 (_1!851 (_ BitVec 64)) (_2!851 B!858)) )
))
(declare-datatypes ((List!1234 0))(
  ( (Nil!1231) (Cons!1230 (h!1810 tuple2!1680) (t!4259 List!1234)) )
))
(declare-fun l!812 () List!1234)

(declare-fun isStrictlySorted!228 (List!1234) Bool)

(assert (=> start!7172 (= res!26909 (isStrictlySorted!228 l!812))))

(assert (=> start!7172 e!29273))

(declare-fun e!29272 () Bool)

(assert (=> start!7172 e!29272))

(assert (=> start!7172 true))

(declare-fun b!45979 () Bool)

(declare-fun res!26910 () Bool)

(assert (=> b!45979 (=> (not res!26910) (not e!29273))))

(assert (=> b!45979 (= res!26910 (not (is-Cons!1230 l!812)))))

(declare-fun b!45980 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!38 (List!1234 (_ BitVec 64)) List!1234)

(assert (=> b!45980 (= e!29273 (not (isStrictlySorted!228 (removeStrictlySorted!38 l!812 key1!43))))))

(declare-fun b!45981 () Bool)

(declare-fun tp_is_empty!1955 () Bool)

(declare-fun tp!6044 () Bool)

(assert (=> b!45981 (= e!29272 (and tp_is_empty!1955 tp!6044))))

(assert (= (and start!7172 res!26909) b!45979))

(assert (= (and b!45979 res!26910) b!45980))

(assert (= (and start!7172 (is-Cons!1230 l!812)) b!45981))

(declare-fun m!40539 () Bool)

(assert (=> start!7172 m!40539))

(declare-fun m!40541 () Bool)

(assert (=> b!45980 m!40541))

(assert (=> b!45980 m!40541))

(declare-fun m!40543 () Bool)

(assert (=> b!45980 m!40543))

(push 1)

(assert (not b!45980))

(assert (not start!7172))

(assert (not b!45981))

(assert tp_is_empty!1955)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8997 () Bool)

(declare-fun res!26927 () Bool)

(declare-fun e!29290 () Bool)

(assert (=> d!8997 (=> res!26927 e!29290)))

(assert (=> d!8997 (= res!26927 (or (is-Nil!1231 (removeStrictlySorted!38 l!812 key1!43)) (is-Nil!1231 (t!4259 (removeStrictlySorted!38 l!812 key1!43)))))))

(assert (=> d!8997 (= (isStrictlySorted!228 (removeStrictlySorted!38 l!812 key1!43)) e!29290)))

(declare-fun b!45998 () Bool)

(declare-fun e!29291 () Bool)

(assert (=> b!45998 (= e!29290 e!29291)))

(declare-fun res!26928 () Bool)

(assert (=> b!45998 (=> (not res!26928) (not e!29291))))

(assert (=> b!45998 (= res!26928 (bvslt (_1!851 (h!1810 (removeStrictlySorted!38 l!812 key1!43))) (_1!851 (h!1810 (t!4259 (removeStrictlySorted!38 l!812 key1!43))))))))

(declare-fun b!45999 () Bool)

(assert (=> b!45999 (= e!29291 (isStrictlySorted!228 (t!4259 (removeStrictlySorted!38 l!812 key1!43))))))

(assert (= (and d!8997 (not res!26927)) b!45998))

(assert (= (and b!45998 res!26928) b!45999))

(declare-fun m!40549 () Bool)

(assert (=> b!45999 m!40549))

(assert (=> b!45980 d!8997))

(declare-fun b!46044 () Bool)

(declare-fun e!29322 () Bool)

(declare-fun lt!20266 () List!1234)

(declare-fun containsKey!85 (List!1234 (_ BitVec 64)) Bool)

(assert (=> b!46044 (= e!29322 (not (containsKey!85 lt!20266 key1!43)))))

(declare-fun b!46045 () Bool)

(declare-fun e!29320 () List!1234)

(declare-fun e!29321 () List!1234)

(assert (=> b!46045 (= e!29320 e!29321)))

(declare-fun c!6224 () Bool)

(assert (=> b!46045 (= c!6224 (and (is-Cons!1230 l!812) (not (= (_1!851 (h!1810 l!812)) key1!43))))))

(declare-fun b!46046 () Bool)

(assert (=> b!46046 (= e!29321 Nil!1231)))

(declare-fun b!46047 () Bool)

(assert (=> b!46047 (= e!29320 (t!4259 l!812))))

(declare-fun b!46048 () Bool)

(declare-fun $colon$colon!40 (List!1234 tuple2!1680) List!1234)

(assert (=> b!46048 (= e!29321 ($colon$colon!40 (removeStrictlySorted!38 (t!4259 l!812) key1!43) (h!1810 l!812)))))

(declare-fun d!9003 () Bool)

(assert (=> d!9003 e!29322))

(declare-fun res!26941 () Bool)

(assert (=> d!9003 (=> (not res!26941) (not e!29322))))

(assert (=> d!9003 (= res!26941 (isStrictlySorted!228 lt!20266))))

(assert (=> d!9003 (= lt!20266 e!29320)))

(declare-fun c!6225 () Bool)

(assert (=> d!9003 (= c!6225 (and (is-Cons!1230 l!812) (= (_1!851 (h!1810 l!812)) key1!43)))))

(assert (=> d!9003 (isStrictlySorted!228 l!812)))

(assert (=> d!9003 (= (removeStrictlySorted!38 l!812 key1!43) lt!20266)))

(assert (= (and d!9003 c!6225) b!46047))

(assert (= (and d!9003 (not c!6225)) b!46045))

(assert (= (and b!46045 c!6224) b!46048))

(assert (= (and b!46045 (not c!6224)) b!46046))

(assert (= (and d!9003 res!26941) b!46044))

(declare-fun m!40571 () Bool)

(assert (=> b!46044 m!40571))

(declare-fun m!40573 () Bool)

(assert (=> b!46048 m!40573))

(assert (=> b!46048 m!40573))

(declare-fun m!40575 () Bool)

(assert (=> b!46048 m!40575))

(declare-fun m!40577 () Bool)

(assert (=> d!9003 m!40577))

(assert (=> d!9003 m!40539))

(assert (=> b!45980 d!9003))

(declare-fun d!9009 () Bool)

(declare-fun res!26942 () Bool)

