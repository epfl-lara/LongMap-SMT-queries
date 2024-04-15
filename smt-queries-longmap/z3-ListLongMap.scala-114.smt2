; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1980 () Bool)

(assert start!1980)

(declare-fun res!10507 () Bool)

(declare-fun e!7978 () Bool)

(assert (=> start!1980 (=> (not res!10507) (not e!7978))))

(declare-datatypes ((B!482 0))(
  ( (B!483 (val!339 Int)) )
))
(declare-datatypes ((tuple2!474 0))(
  ( (tuple2!475 (_1!237 (_ BitVec 64)) (_2!237 B!482)) )
))
(declare-datatypes ((List!390 0))(
  ( (Nil!387) (Cons!386 (h!952 tuple2!474) (t!2786 List!390)) )
))
(declare-fun l!522 () List!390)

(declare-fun isStrictlySorted!78 (List!390) Bool)

(assert (=> start!1980 (= res!10507 (isStrictlySorted!78 l!522))))

(assert (=> start!1980 e!7978))

(declare-fun e!7979 () Bool)

(assert (=> start!1980 e!7979))

(declare-fun tp_is_empty!661 () Bool)

(assert (=> start!1980 tp_is_empty!661))

(declare-fun b!13320 () Bool)

(declare-fun res!10506 () Bool)

(assert (=> b!13320 (=> (not res!10506) (not e!7978))))

(declare-fun value!159 () B!482)

(get-info :version)

(assert (=> b!13320 (= res!10506 (and (not (= (_2!237 (h!952 l!522)) value!159)) ((_ is Cons!386) l!522)))))

(declare-fun b!13321 () Bool)

(assert (=> b!13321 (= e!7978 (not (isStrictlySorted!78 (t!2786 l!522))))))

(declare-fun b!13322 () Bool)

(declare-fun tp!2168 () Bool)

(assert (=> b!13322 (= e!7979 (and tp_is_empty!661 tp!2168))))

(assert (= (and start!1980 res!10507) b!13320))

(assert (= (and b!13320 res!10506) b!13321))

(assert (= (and start!1980 ((_ is Cons!386) l!522)) b!13322))

(declare-fun m!9075 () Bool)

(assert (=> start!1980 m!9075))

(declare-fun m!9077 () Bool)

(assert (=> b!13321 m!9077))

(check-sat (not b!13321) (not start!1980) (not b!13322) tp_is_empty!661)
(check-sat)
(get-model)

(declare-fun d!1999 () Bool)

(declare-fun res!10524 () Bool)

(declare-fun e!7996 () Bool)

(assert (=> d!1999 (=> res!10524 e!7996)))

(assert (=> d!1999 (= res!10524 (or ((_ is Nil!387) (t!2786 l!522)) ((_ is Nil!387) (t!2786 (t!2786 l!522)))))))

(assert (=> d!1999 (= (isStrictlySorted!78 (t!2786 l!522)) e!7996)))

(declare-fun b!13345 () Bool)

(declare-fun e!7997 () Bool)

(assert (=> b!13345 (= e!7996 e!7997)))

(declare-fun res!10525 () Bool)

(assert (=> b!13345 (=> (not res!10525) (not e!7997))))

(assert (=> b!13345 (= res!10525 (bvslt (_1!237 (h!952 (t!2786 l!522))) (_1!237 (h!952 (t!2786 (t!2786 l!522))))))))

(declare-fun b!13346 () Bool)

(assert (=> b!13346 (= e!7997 (isStrictlySorted!78 (t!2786 (t!2786 l!522))))))

(assert (= (and d!1999 (not res!10524)) b!13345))

(assert (= (and b!13345 res!10525) b!13346))

(declare-fun m!9087 () Bool)

(assert (=> b!13346 m!9087))

(assert (=> b!13321 d!1999))

(declare-fun d!2005 () Bool)

(declare-fun res!10526 () Bool)

(declare-fun e!7998 () Bool)

(assert (=> d!2005 (=> res!10526 e!7998)))

(assert (=> d!2005 (= res!10526 (or ((_ is Nil!387) l!522) ((_ is Nil!387) (t!2786 l!522))))))

(assert (=> d!2005 (= (isStrictlySorted!78 l!522) e!7998)))

(declare-fun b!13347 () Bool)

(declare-fun e!7999 () Bool)

(assert (=> b!13347 (= e!7998 e!7999)))

(declare-fun res!10527 () Bool)

(assert (=> b!13347 (=> (not res!10527) (not e!7999))))

(assert (=> b!13347 (= res!10527 (bvslt (_1!237 (h!952 l!522)) (_1!237 (h!952 (t!2786 l!522)))))))

(declare-fun b!13348 () Bool)

(assert (=> b!13348 (= e!7999 (isStrictlySorted!78 (t!2786 l!522)))))

(assert (= (and d!2005 (not res!10526)) b!13347))

(assert (= (and b!13347 res!10527) b!13348))

(assert (=> b!13348 m!9077))

(assert (=> start!1980 d!2005))

(declare-fun b!13361 () Bool)

(declare-fun e!8010 () Bool)

(declare-fun tp!2177 () Bool)

(assert (=> b!13361 (= e!8010 (and tp_is_empty!661 tp!2177))))

(assert (=> b!13322 (= tp!2168 e!8010)))

(assert (= (and b!13322 ((_ is Cons!386) (t!2786 l!522))) b!13361))

(check-sat (not b!13348) (not b!13346) (not b!13361) tp_is_empty!661)
(check-sat)
