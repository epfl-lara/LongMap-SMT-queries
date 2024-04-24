; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103928 () Bool)

(assert start!103928)

(declare-fun res!828798 () Bool)

(declare-fun e!704732 () Bool)

(assert (=> start!103928 (=> (not res!828798) (not e!704732))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103928 (= res!828798 (not (= key1!25 key2!15)))))

(assert (=> start!103928 e!704732))

(assert (=> start!103928 true))

(declare-fun e!704731 () Bool)

(assert (=> start!103928 e!704731))

(declare-fun b!1243096 () Bool)

(declare-fun res!828797 () Bool)

(assert (=> b!1243096 (=> (not res!828797) (not e!704732))))

(declare-datatypes ((B!1862 0))(
  ( (B!1863 (val!15693 Int)) )
))
(declare-datatypes ((tuple2!20274 0))(
  ( (tuple2!20275 (_1!10148 (_ BitVec 64)) (_2!10148 B!1862)) )
))
(declare-datatypes ((List!27383 0))(
  ( (Nil!27380) (Cons!27379 (h!28597 tuple2!20274) (t!40838 List!27383)) )
))
(declare-fun l!644 () List!27383)

(declare-fun isStrictlySorted!742 (List!27383) Bool)

(assert (=> b!1243096 (= res!828797 (isStrictlySorted!742 l!644))))

(declare-fun b!1243097 () Bool)

(declare-fun ListPrimitiveSize!145 (List!27383) Int)

(assert (=> b!1243097 (= e!704732 (< (ListPrimitiveSize!145 l!644) 0))))

(declare-fun b!1243098 () Bool)

(declare-fun tp_is_empty!31261 () Bool)

(declare-fun tp!92681 () Bool)

(assert (=> b!1243098 (= e!704731 (and tp_is_empty!31261 tp!92681))))

(assert (= (and start!103928 res!828798) b!1243096))

(assert (= (and b!1243096 res!828797) b!1243097))

(get-info :version)

(assert (= (and start!103928 ((_ is Cons!27379) l!644)) b!1243098))

(declare-fun m!1146317 () Bool)

(assert (=> b!1243096 m!1146317))

(declare-fun m!1146319 () Bool)

(assert (=> b!1243097 m!1146319))

(check-sat (not b!1243096) (not b!1243097) (not b!1243098) tp_is_empty!31261)
(check-sat)
(get-model)

(declare-fun d!136999 () Bool)

(declare-fun res!828820 () Bool)

(declare-fun e!704754 () Bool)

(assert (=> d!136999 (=> res!828820 e!704754)))

(assert (=> d!136999 (= res!828820 (or ((_ is Nil!27380) l!644) ((_ is Nil!27380) (t!40838 l!644))))))

(assert (=> d!136999 (= (isStrictlySorted!742 l!644) e!704754)))

(declare-fun b!1243126 () Bool)

(declare-fun e!704756 () Bool)

(assert (=> b!1243126 (= e!704754 e!704756)))

(declare-fun res!828822 () Bool)

(assert (=> b!1243126 (=> (not res!828822) (not e!704756))))

(assert (=> b!1243126 (= res!828822 (bvslt (_1!10148 (h!28597 l!644)) (_1!10148 (h!28597 (t!40838 l!644)))))))

(declare-fun b!1243128 () Bool)

(assert (=> b!1243128 (= e!704756 (isStrictlySorted!742 (t!40838 l!644)))))

(assert (= (and d!136999 (not res!828820)) b!1243126))

(assert (= (and b!1243126 res!828822) b!1243128))

(declare-fun m!1146330 () Bool)

(assert (=> b!1243128 m!1146330))

(assert (=> b!1243096 d!136999))

(declare-fun d!137002 () Bool)

(declare-fun lt!562651 () Int)

(assert (=> d!137002 (>= lt!562651 0)))

(declare-fun e!704761 () Int)

(assert (=> d!137002 (= lt!562651 e!704761)))

(declare-fun c!121912 () Bool)

(assert (=> d!137002 (= c!121912 ((_ is Nil!27380) l!644))))

(assert (=> d!137002 (= (ListPrimitiveSize!145 l!644) lt!562651)))

(declare-fun b!1243137 () Bool)

(assert (=> b!1243137 (= e!704761 0)))

(declare-fun b!1243138 () Bool)

(assert (=> b!1243138 (= e!704761 (+ 1 (ListPrimitiveSize!145 (t!40838 l!644))))))

(assert (= (and d!137002 c!121912) b!1243137))

(assert (= (and d!137002 (not c!121912)) b!1243138))

(declare-fun m!1146333 () Bool)

(assert (=> b!1243138 m!1146333))

(assert (=> b!1243097 d!137002))

(declare-fun b!1243150 () Bool)

(declare-fun e!704768 () Bool)

(declare-fun tp!92693 () Bool)

(assert (=> b!1243150 (= e!704768 (and tp_is_empty!31261 tp!92693))))

(assert (=> b!1243098 (= tp!92681 e!704768)))

(assert (= (and b!1243098 ((_ is Cons!27379) (t!40838 l!644))) b!1243150))

(check-sat (not b!1243138) (not b!1243128) (not b!1243150) tp_is_empty!31261)
(check-sat)
