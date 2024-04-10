; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137910 () Bool)

(assert start!137910)

(declare-fun res!1081697 () Bool)

(declare-fun e!883896 () Bool)

(assert (=> start!137910 (=> (not res!1081697) (not e!883896))))

(declare-datatypes ((B!2860 0))(
  ( (B!2861 (val!19792 Int)) )
))
(declare-datatypes ((tuple2!25752 0))(
  ( (tuple2!25753 (_1!12887 (_ BitVec 64)) (_2!12887 B!2860)) )
))
(declare-datatypes ((List!36912 0))(
  ( (Nil!36909) (Cons!36908 (h!38451 tuple2!25752) (t!51826 List!36912)) )
))
(declare-fun l!548 () List!36912)

(declare-fun isStrictlySorted!1146 (List!36912) Bool)

(assert (=> start!137910 (= res!1081697 (isStrictlySorted!1146 l!548))))

(assert (=> start!137910 e!883896))

(declare-fun e!883897 () Bool)

(assert (=> start!137910 e!883897))

(assert (=> start!137910 true))

(declare-fun b!1583501 () Bool)

(declare-fun res!1081696 () Bool)

(assert (=> b!1583501 (=> (not res!1081696) (not e!883896))))

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583501 (= res!1081696 (and (not (= (_1!12887 (h!38451 l!548)) key!159)) ((_ is Cons!36908) l!548)))))

(declare-fun b!1583502 () Bool)

(declare-fun ListPrimitiveSize!215 (List!36912) Int)

(assert (=> b!1583502 (= e!883896 (>= (ListPrimitiveSize!215 (t!51826 l!548)) (ListPrimitiveSize!215 l!548)))))

(declare-fun b!1583503 () Bool)

(declare-fun tp_is_empty!39393 () Bool)

(declare-fun tp!114970 () Bool)

(assert (=> b!1583503 (= e!883897 (and tp_is_empty!39393 tp!114970))))

(assert (= (and start!137910 res!1081697) b!1583501))

(assert (= (and b!1583501 res!1081696) b!1583502))

(assert (= (and start!137910 ((_ is Cons!36908) l!548)) b!1583503))

(declare-fun m!1453331 () Bool)

(assert (=> start!137910 m!1453331))

(declare-fun m!1453333 () Bool)

(assert (=> b!1583502 m!1453333))

(declare-fun m!1453335 () Bool)

(assert (=> b!1583502 m!1453335))

(check-sat (not start!137910) (not b!1583502) (not b!1583503) tp_is_empty!39393)
(check-sat)
(get-model)

(declare-fun d!167243 () Bool)

(declare-fun res!1081712 () Bool)

(declare-fun e!883912 () Bool)

(assert (=> d!167243 (=> res!1081712 e!883912)))

(assert (=> d!167243 (= res!1081712 (or ((_ is Nil!36909) l!548) ((_ is Nil!36909) (t!51826 l!548))))))

(assert (=> d!167243 (= (isStrictlySorted!1146 l!548) e!883912)))

(declare-fun b!1583519 () Bool)

(declare-fun e!883913 () Bool)

(assert (=> b!1583519 (= e!883912 e!883913)))

(declare-fun res!1081713 () Bool)

(assert (=> b!1583519 (=> (not res!1081713) (not e!883913))))

(assert (=> b!1583519 (= res!1081713 (bvslt (_1!12887 (h!38451 l!548)) (_1!12887 (h!38451 (t!51826 l!548)))))))

(declare-fun b!1583520 () Bool)

(assert (=> b!1583520 (= e!883913 (isStrictlySorted!1146 (t!51826 l!548)))))

(assert (= (and d!167243 (not res!1081712)) b!1583519))

(assert (= (and b!1583519 res!1081713) b!1583520))

(declare-fun m!1453343 () Bool)

(assert (=> b!1583520 m!1453343))

(assert (=> start!137910 d!167243))

(declare-fun d!167249 () Bool)

(declare-fun lt!677180 () Int)

(assert (=> d!167249 (>= lt!677180 0)))

(declare-fun e!883926 () Int)

(assert (=> d!167249 (= lt!677180 e!883926)))

(declare-fun c!146743 () Bool)

(assert (=> d!167249 (= c!146743 ((_ is Nil!36909) (t!51826 l!548)))))

(assert (=> d!167249 (= (ListPrimitiveSize!215 (t!51826 l!548)) lt!677180)))

(declare-fun b!1583539 () Bool)

(assert (=> b!1583539 (= e!883926 0)))

(declare-fun b!1583540 () Bool)

(assert (=> b!1583540 (= e!883926 (+ 1 (ListPrimitiveSize!215 (t!51826 (t!51826 l!548)))))))

(assert (= (and d!167249 c!146743) b!1583539))

(assert (= (and d!167249 (not c!146743)) b!1583540))

(declare-fun m!1453349 () Bool)

(assert (=> b!1583540 m!1453349))

(assert (=> b!1583502 d!167249))

(declare-fun d!167255 () Bool)

(declare-fun lt!677181 () Int)

(assert (=> d!167255 (>= lt!677181 0)))

(declare-fun e!883927 () Int)

(assert (=> d!167255 (= lt!677181 e!883927)))

(declare-fun c!146744 () Bool)

(assert (=> d!167255 (= c!146744 ((_ is Nil!36909) l!548))))

(assert (=> d!167255 (= (ListPrimitiveSize!215 l!548) lt!677181)))

(declare-fun b!1583541 () Bool)

(assert (=> b!1583541 (= e!883927 0)))

(declare-fun b!1583542 () Bool)

(assert (=> b!1583542 (= e!883927 (+ 1 (ListPrimitiveSize!215 (t!51826 l!548))))))

(assert (= (and d!167255 c!146744) b!1583541))

(assert (= (and d!167255 (not c!146744)) b!1583542))

(assert (=> b!1583542 m!1453333))

(assert (=> b!1583502 d!167255))

(declare-fun b!1583553 () Bool)

(declare-fun e!883933 () Bool)

(declare-fun tp!114976 () Bool)

(assert (=> b!1583553 (= e!883933 (and tp_is_empty!39393 tp!114976))))

(assert (=> b!1583503 (= tp!114970 e!883933)))

(assert (= (and b!1583503 ((_ is Cons!36908) (t!51826 l!548))) b!1583553))

(check-sat (not b!1583540) (not b!1583542) (not b!1583553) (not b!1583520) tp_is_empty!39393)
(check-sat)
