; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138388 () Bool)

(assert start!138388)

(declare-fun res!1083293 () Bool)

(declare-fun e!885752 () Bool)

(assert (=> start!138388 (=> (not res!1083293) (not e!885752))))

(declare-datatypes ((B!3028 0))(
  ( (B!3029 (val!19876 Int)) )
))
(declare-datatypes ((tuple2!25920 0))(
  ( (tuple2!25921 (_1!12971 (_ BitVec 64)) (_2!12971 B!3028)) )
))
(declare-datatypes ((List!36996 0))(
  ( (Nil!36993) (Cons!36992 (h!38535 tuple2!25920) (t!51926 List!36996)) )
))
(declare-fun l!636 () List!36996)

(declare-fun isStrictlySorted!1218 (List!36996) Bool)

(assert (=> start!138388 (= res!1083293 (isStrictlySorted!1218 l!636))))

(assert (=> start!138388 e!885752))

(declare-fun e!885753 () Bool)

(assert (=> start!138388 e!885753))

(declare-fun b!1586197 () Bool)

(declare-fun ListPrimitiveSize!230 (List!36996) Int)

(assert (=> b!1586197 (= e!885752 (< (ListPrimitiveSize!230 l!636) 0))))

(declare-fun b!1586198 () Bool)

(declare-fun tp_is_empty!39561 () Bool)

(declare-fun tp!115383 () Bool)

(assert (=> b!1586198 (= e!885753 (and tp_is_empty!39561 tp!115383))))

(assert (= (and start!138388 res!1083293) b!1586197))

(get-info :version)

(assert (= (and start!138388 ((_ is Cons!36992) l!636)) b!1586198))

(declare-fun m!1454683 () Bool)

(assert (=> start!138388 m!1454683))

(declare-fun m!1454685 () Bool)

(assert (=> b!1586197 m!1454685))

(check-sat (not start!138388) (not b!1586197) (not b!1586198) tp_is_empty!39561)
(check-sat)
(get-model)

(declare-fun d!167883 () Bool)

(declare-fun res!1083301 () Bool)

(declare-fun e!885770 () Bool)

(assert (=> d!167883 (=> res!1083301 e!885770)))

(assert (=> d!167883 (= res!1083301 (or ((_ is Nil!36993) l!636) ((_ is Nil!36993) (t!51926 l!636))))))

(assert (=> d!167883 (= (isStrictlySorted!1218 l!636) e!885770)))

(declare-fun b!1586221 () Bool)

(declare-fun e!885771 () Bool)

(assert (=> b!1586221 (= e!885770 e!885771)))

(declare-fun res!1083302 () Bool)

(assert (=> b!1586221 (=> (not res!1083302) (not e!885771))))

(assert (=> b!1586221 (= res!1083302 (bvslt (_1!12971 (h!38535 l!636)) (_1!12971 (h!38535 (t!51926 l!636)))))))

(declare-fun b!1586222 () Bool)

(assert (=> b!1586222 (= e!885771 (isStrictlySorted!1218 (t!51926 l!636)))))

(assert (= (and d!167883 (not res!1083301)) b!1586221))

(assert (= (and b!1586221 res!1083302) b!1586222))

(declare-fun m!1454695 () Bool)

(assert (=> b!1586222 m!1454695))

(assert (=> start!138388 d!167883))

(declare-fun d!167893 () Bool)

(declare-fun lt!677505 () Int)

(assert (=> d!167893 (>= lt!677505 0)))

(declare-fun e!885792 () Int)

(assert (=> d!167893 (= lt!677505 e!885792)))

(declare-fun c!147042 () Bool)

(assert (=> d!167893 (= c!147042 ((_ is Nil!36993) l!636))))

(assert (=> d!167893 (= (ListPrimitiveSize!230 l!636) lt!677505)))

(declare-fun b!1586249 () Bool)

(assert (=> b!1586249 (= e!885792 0)))

(declare-fun b!1586250 () Bool)

(assert (=> b!1586250 (= e!885792 (+ 1 (ListPrimitiveSize!230 (t!51926 l!636))))))

(assert (= (and d!167893 c!147042) b!1586249))

(assert (= (and d!167893 (not c!147042)) b!1586250))

(declare-fun m!1454701 () Bool)

(assert (=> b!1586250 m!1454701))

(assert (=> b!1586197 d!167893))

(declare-fun b!1586255 () Bool)

(declare-fun e!885795 () Bool)

(declare-fun tp!115395 () Bool)

(assert (=> b!1586255 (= e!885795 (and tp_is_empty!39561 tp!115395))))

(assert (=> b!1586198 (= tp!115383 e!885795)))

(assert (= (and b!1586198 ((_ is Cons!36992) (t!51926 l!636))) b!1586255))

(check-sat (not b!1586222) (not b!1586250) (not b!1586255) tp_is_empty!39561)
