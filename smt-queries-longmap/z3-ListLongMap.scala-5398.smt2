; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71996 () Bool)

(assert start!71996)

(declare-fun res!568926 () Bool)

(declare-fun e!466483 () Bool)

(assert (=> start!71996 (=> (not res!568926) (not e!466483))))

(declare-datatypes ((B!1190 0))(
  ( (B!1191 (val!7677 Int)) )
))
(declare-datatypes ((tuple2!10222 0))(
  ( (tuple2!10223 (_1!5122 (_ BitVec 64)) (_2!5122 B!1190)) )
))
(declare-datatypes ((List!15981 0))(
  ( (Nil!15978) (Cons!15977 (h!17108 tuple2!10222) (t!22343 List!15981)) )
))
(declare-fun l!390 () List!15981)

(declare-fun isStrictlySorted!448 (List!15981) Bool)

(assert (=> start!71996 (= res!568926 (isStrictlySorted!448 l!390))))

(assert (=> start!71996 e!466483))

(declare-fun e!466484 () Bool)

(assert (=> start!71996 e!466484))

(declare-fun b!836155 () Bool)

(declare-fun res!568927 () Bool)

(assert (=> b!836155 (=> (not res!568927) (not e!466483))))

(get-info :version)

(assert (=> b!836155 (= res!568927 ((_ is Cons!15977) l!390))))

(declare-fun b!836156 () Bool)

(declare-fun ListPrimitiveSize!70 (List!15981) Int)

(assert (=> b!836156 (= e!466483 (>= (ListPrimitiveSize!70 (t!22343 l!390)) (ListPrimitiveSize!70 l!390)))))

(declare-fun b!836157 () Bool)

(declare-fun tp_is_empty!15259 () Bool)

(declare-fun tp!47441 () Bool)

(assert (=> b!836157 (= e!466484 (and tp_is_empty!15259 tp!47441))))

(assert (= (and start!71996 res!568926) b!836155))

(assert (= (and b!836155 res!568927) b!836156))

(assert (= (and start!71996 ((_ is Cons!15977) l!390)) b!836157))

(declare-fun m!780929 () Bool)

(assert (=> start!71996 m!780929))

(declare-fun m!780931 () Bool)

(assert (=> b!836156 m!780931))

(declare-fun m!780933 () Bool)

(assert (=> b!836156 m!780933))

(check-sat (not start!71996) (not b!836156) (not b!836157) tp_is_empty!15259)
(check-sat)
(get-model)

(declare-fun d!107387 () Bool)

(declare-fun res!568952 () Bool)

(declare-fun e!466509 () Bool)

(assert (=> d!107387 (=> res!568952 e!466509)))

(assert (=> d!107387 (= res!568952 (or ((_ is Nil!15978) l!390) ((_ is Nil!15978) (t!22343 l!390))))))

(assert (=> d!107387 (= (isStrictlySorted!448 l!390) e!466509)))

(declare-fun b!836188 () Bool)

(declare-fun e!466510 () Bool)

(assert (=> b!836188 (= e!466509 e!466510)))

(declare-fun res!568953 () Bool)

(assert (=> b!836188 (=> (not res!568953) (not e!466510))))

(assert (=> b!836188 (= res!568953 (bvslt (_1!5122 (h!17108 l!390)) (_1!5122 (h!17108 (t!22343 l!390)))))))

(declare-fun b!836189 () Bool)

(assert (=> b!836189 (= e!466510 (isStrictlySorted!448 (t!22343 l!390)))))

(assert (= (and d!107387 (not res!568952)) b!836188))

(assert (= (and b!836188 res!568953) b!836189))

(declare-fun m!780947 () Bool)

(assert (=> b!836189 m!780947))

(assert (=> start!71996 d!107387))

(declare-fun d!107393 () Bool)

(declare-fun lt!380166 () Int)

(assert (=> d!107393 (>= lt!380166 0)))

(declare-fun e!466521 () Int)

(assert (=> d!107393 (= lt!380166 e!466521)))

(declare-fun c!90979 () Bool)

(assert (=> d!107393 (= c!90979 ((_ is Nil!15978) (t!22343 l!390)))))

(assert (=> d!107393 (= (ListPrimitiveSize!70 (t!22343 l!390)) lt!380166)))

(declare-fun b!836206 () Bool)

(assert (=> b!836206 (= e!466521 0)))

(declare-fun b!836207 () Bool)

(assert (=> b!836207 (= e!466521 (+ 1 (ListPrimitiveSize!70 (t!22343 (t!22343 l!390)))))))

(assert (= (and d!107393 c!90979) b!836206))

(assert (= (and d!107393 (not c!90979)) b!836207))

(declare-fun m!780953 () Bool)

(assert (=> b!836207 m!780953))

(assert (=> b!836156 d!107393))

(declare-fun d!107399 () Bool)

(declare-fun lt!380168 () Int)

(assert (=> d!107399 (>= lt!380168 0)))

(declare-fun e!466523 () Int)

(assert (=> d!107399 (= lt!380168 e!466523)))

(declare-fun c!90981 () Bool)

(assert (=> d!107399 (= c!90981 ((_ is Nil!15978) l!390))))

(assert (=> d!107399 (= (ListPrimitiveSize!70 l!390) lt!380168)))

(declare-fun b!836210 () Bool)

(assert (=> b!836210 (= e!466523 0)))

(declare-fun b!836211 () Bool)

(assert (=> b!836211 (= e!466523 (+ 1 (ListPrimitiveSize!70 (t!22343 l!390))))))

(assert (= (and d!107399 c!90981) b!836210))

(assert (= (and d!107399 (not c!90981)) b!836211))

(assert (=> b!836211 m!780931))

(assert (=> b!836156 d!107399))

(declare-fun b!836226 () Bool)

(declare-fun e!466531 () Bool)

(declare-fun tp!47452 () Bool)

(assert (=> b!836226 (= e!466531 (and tp_is_empty!15259 tp!47452))))

(assert (=> b!836157 (= tp!47441 e!466531)))

(assert (= (and b!836157 ((_ is Cons!15977) (t!22343 l!390))) b!836226))

(check-sat (not b!836211) tp_is_empty!15259 (not b!836207) (not b!836189) (not b!836226))
(check-sat)
