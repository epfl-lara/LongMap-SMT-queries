; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103684 () Bool)

(assert start!103684)

(declare-fun res!828219 () Bool)

(declare-fun e!703817 () Bool)

(assert (=> start!103684 (=> (not res!828219) (not e!703817))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103684 (= res!828219 (not (= key1!25 key2!15)))))

(assert (=> start!103684 e!703817))

(assert (=> start!103684 true))

(declare-fun e!703818 () Bool)

(assert (=> start!103684 e!703818))

(declare-fun b!1241684 () Bool)

(declare-fun res!828218 () Bool)

(assert (=> b!1241684 (=> (not res!828218) (not e!703817))))

(declare-datatypes ((B!1862 0))(
  ( (B!1863 (val!15693 Int)) )
))
(declare-datatypes ((tuple2!20342 0))(
  ( (tuple2!20343 (_1!10182 (_ BitVec 64)) (_2!10182 B!1862)) )
))
(declare-datatypes ((List!27420 0))(
  ( (Nil!27417) (Cons!27416 (h!28625 tuple2!20342) (t!40874 List!27420)) )
))
(declare-fun l!644 () List!27420)

(declare-fun isStrictlySorted!750 (List!27420) Bool)

(assert (=> b!1241684 (= res!828218 (isStrictlySorted!750 l!644))))

(declare-fun b!1241685 () Bool)

(declare-fun ListPrimitiveSize!145 (List!27420) Int)

(assert (=> b!1241685 (= e!703817 (< (ListPrimitiveSize!145 l!644) 0))))

(declare-fun b!1241686 () Bool)

(declare-fun tp_is_empty!31261 () Bool)

(declare-fun tp!92681 () Bool)

(assert (=> b!1241686 (= e!703818 (and tp_is_empty!31261 tp!92681))))

(assert (= (and start!103684 res!828219) b!1241684))

(assert (= (and b!1241684 res!828218) b!1241685))

(get-info :version)

(assert (= (and start!103684 ((_ is Cons!27416) l!644)) b!1241686))

(declare-fun m!1144143 () Bool)

(assert (=> b!1241684 m!1144143))

(declare-fun m!1144145 () Bool)

(assert (=> b!1241685 m!1144145))

(check-sat (not b!1241684) (not b!1241685) (not b!1241686) tp_is_empty!31261)
(check-sat)
(get-model)

(declare-fun d!136399 () Bool)

(declare-fun res!828242 () Bool)

(declare-fun e!703841 () Bool)

(assert (=> d!136399 (=> res!828242 e!703841)))

(assert (=> d!136399 (= res!828242 (or ((_ is Nil!27417) l!644) ((_ is Nil!27417) (t!40874 l!644))))))

(assert (=> d!136399 (= (isStrictlySorted!750 l!644) e!703841)))

(declare-fun b!1241715 () Bool)

(declare-fun e!703842 () Bool)

(assert (=> b!1241715 (= e!703841 e!703842)))

(declare-fun res!828243 () Bool)

(assert (=> b!1241715 (=> (not res!828243) (not e!703842))))

(assert (=> b!1241715 (= res!828243 (bvslt (_1!10182 (h!28625 l!644)) (_1!10182 (h!28625 (t!40874 l!644)))))))

(declare-fun b!1241716 () Bool)

(assert (=> b!1241716 (= e!703842 (isStrictlySorted!750 (t!40874 l!644)))))

(assert (= (and d!136399 (not res!828242)) b!1241715))

(assert (= (and b!1241715 res!828243) b!1241716))

(declare-fun m!1144157 () Bool)

(assert (=> b!1241716 m!1144157))

(assert (=> b!1241684 d!136399))

(declare-fun d!136403 () Bool)

(declare-fun lt!561987 () Int)

(assert (=> d!136403 (>= lt!561987 0)))

(declare-fun e!703850 () Int)

(assert (=> d!136403 (= lt!561987 e!703850)))

(declare-fun c!121492 () Bool)

(assert (=> d!136403 (= c!121492 ((_ is Nil!27417) l!644))))

(assert (=> d!136403 (= (ListPrimitiveSize!145 l!644) lt!561987)))

(declare-fun b!1241731 () Bool)

(assert (=> b!1241731 (= e!703850 0)))

(declare-fun b!1241732 () Bool)

(assert (=> b!1241732 (= e!703850 (+ 1 (ListPrimitiveSize!145 (t!40874 l!644))))))

(assert (= (and d!136403 c!121492) b!1241731))

(assert (= (and d!136403 (not c!121492)) b!1241732))

(declare-fun m!1144161 () Bool)

(assert (=> b!1241732 m!1144161))

(assert (=> b!1241685 d!136403))

(declare-fun b!1241738 () Bool)

(declare-fun e!703854 () Bool)

(declare-fun tp!92693 () Bool)

(assert (=> b!1241738 (= e!703854 (and tp_is_empty!31261 tp!92693))))

(assert (=> b!1241686 (= tp!92681 e!703854)))

(assert (= (and b!1241686 ((_ is Cons!27416) (t!40874 l!644))) b!1241738))

(check-sat (not b!1241732) (not b!1241716) (not b!1241738) tp_is_empty!31261)
(check-sat)
