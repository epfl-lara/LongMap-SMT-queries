; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138368 () Bool)

(assert start!138368)

(declare-fun res!1083188 () Bool)

(declare-fun e!885599 () Bool)

(assert (=> start!138368 (=> (not res!1083188) (not e!885599))))

(declare-datatypes ((B!3032 0))(
  ( (B!3033 (val!19878 Int)) )
))
(declare-datatypes ((tuple2!25992 0))(
  ( (tuple2!25993 (_1!13007 (_ BitVec 64)) (_2!13007 B!3032)) )
))
(declare-datatypes ((List!37039 0))(
  ( (Nil!37036) (Cons!37035 (h!38579 tuple2!25992) (t!51961 List!37039)) )
))
(declare-fun l!636 () List!37039)

(declare-fun isStrictlySorted!1218 (List!37039) Bool)

(assert (=> start!138368 (= res!1083188 (isStrictlySorted!1218 l!636))))

(assert (=> start!138368 e!885599))

(declare-fun e!885600 () Bool)

(assert (=> start!138368 e!885600))

(assert (=> start!138368 true))

(declare-fun b!1585946 () Bool)

(declare-fun res!1083189 () Bool)

(assert (=> b!1585946 (=> (not res!1083189) (not e!885599))))

(declare-fun key!185 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585946 (= res!1083189 (and (or (not ((_ is Cons!37035) l!636)) (not (= (_1!13007 (h!38579 l!636)) key!185))) (or (not ((_ is Cons!37035) l!636)) (bvsle (_1!13007 (h!38579 l!636)) key!185)) ((_ is Cons!37035) l!636) (bvslt (_1!13007 (h!38579 l!636)) key!185)))))

(declare-fun b!1585947 () Bool)

(declare-fun ListPrimitiveSize!232 (List!37039) Int)

(assert (=> b!1585947 (= e!885599 (>= (ListPrimitiveSize!232 (t!51961 l!636)) (ListPrimitiveSize!232 l!636)))))

(declare-fun b!1585948 () Bool)

(declare-fun tp_is_empty!39565 () Bool)

(declare-fun tp!115398 () Bool)

(assert (=> b!1585948 (= e!885600 (and tp_is_empty!39565 tp!115398))))

(assert (= (and start!138368 res!1083188) b!1585946))

(assert (= (and b!1585946 res!1083189) b!1585947))

(assert (= (and start!138368 ((_ is Cons!37035) l!636)) b!1585948))

(declare-fun m!1453821 () Bool)

(assert (=> start!138368 m!1453821))

(declare-fun m!1453823 () Bool)

(assert (=> b!1585947 m!1453823))

(declare-fun m!1453825 () Bool)

(assert (=> b!1585947 m!1453825))

(check-sat (not start!138368) (not b!1585947) (not b!1585948) tp_is_empty!39565)
(check-sat)
(get-model)

(declare-fun d!167657 () Bool)

(declare-fun res!1083210 () Bool)

(declare-fun e!885621 () Bool)

(assert (=> d!167657 (=> res!1083210 e!885621)))

(assert (=> d!167657 (= res!1083210 (or ((_ is Nil!37036) l!636) ((_ is Nil!37036) (t!51961 l!636))))))

(assert (=> d!167657 (= (isStrictlySorted!1218 l!636) e!885621)))

(declare-fun b!1585975 () Bool)

(declare-fun e!885623 () Bool)

(assert (=> b!1585975 (= e!885621 e!885623)))

(declare-fun res!1083212 () Bool)

(assert (=> b!1585975 (=> (not res!1083212) (not e!885623))))

(assert (=> b!1585975 (= res!1083212 (bvslt (_1!13007 (h!38579 l!636)) (_1!13007 (h!38579 (t!51961 l!636)))))))

(declare-fun b!1585976 () Bool)

(assert (=> b!1585976 (= e!885623 (isStrictlySorted!1218 (t!51961 l!636)))))

(assert (= (and d!167657 (not res!1083210)) b!1585975))

(assert (= (and b!1585975 res!1083212) b!1585976))

(declare-fun m!1453839 () Bool)

(assert (=> b!1585976 m!1453839))

(assert (=> start!138368 d!167657))

(declare-fun d!167661 () Bool)

(declare-fun lt!677227 () Int)

(assert (=> d!167661 (>= lt!677227 0)))

(declare-fun e!885629 () Int)

(assert (=> d!167661 (= lt!677227 e!885629)))

(declare-fun c!146958 () Bool)

(assert (=> d!167661 (= c!146958 ((_ is Nil!37036) (t!51961 l!636)))))

(assert (=> d!167661 (= (ListPrimitiveSize!232 (t!51961 l!636)) lt!677227)))

(declare-fun b!1585987 () Bool)

(assert (=> b!1585987 (= e!885629 0)))

(declare-fun b!1585988 () Bool)

(assert (=> b!1585988 (= e!885629 (+ 1 (ListPrimitiveSize!232 (t!51961 (t!51961 l!636)))))))

(assert (= (and d!167661 c!146958) b!1585987))

(assert (= (and d!167661 (not c!146958)) b!1585988))

(declare-fun m!1453843 () Bool)

(assert (=> b!1585988 m!1453843))

(assert (=> b!1585947 d!167661))

(declare-fun d!167665 () Bool)

(declare-fun lt!677228 () Int)

(assert (=> d!167665 (>= lt!677228 0)))

(declare-fun e!885630 () Int)

(assert (=> d!167665 (= lt!677228 e!885630)))

(declare-fun c!146959 () Bool)

(assert (=> d!167665 (= c!146959 ((_ is Nil!37036) l!636))))

(assert (=> d!167665 (= (ListPrimitiveSize!232 l!636) lt!677228)))

(declare-fun b!1585989 () Bool)

(assert (=> b!1585989 (= e!885630 0)))

(declare-fun b!1585990 () Bool)

(assert (=> b!1585990 (= e!885630 (+ 1 (ListPrimitiveSize!232 (t!51961 l!636))))))

(assert (= (and d!167665 c!146959) b!1585989))

(assert (= (and d!167665 (not c!146959)) b!1585990))

(assert (=> b!1585990 m!1453823))

(assert (=> b!1585947 d!167665))

(declare-fun b!1585997 () Bool)

(declare-fun e!885634 () Bool)

(declare-fun tp!115407 () Bool)

(assert (=> b!1585997 (= e!885634 (and tp_is_empty!39565 tp!115407))))

(assert (=> b!1585948 (= tp!115398 e!885634)))

(assert (= (and b!1585948 ((_ is Cons!37035) (t!51961 l!636))) b!1585997))

(check-sat tp_is_empty!39565 (not b!1585990) (not b!1585988) (not b!1585976) (not b!1585997))
(check-sat)
