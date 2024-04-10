; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103748 () Bool)

(assert start!103748)

(declare-fun b!1242061 () Bool)

(declare-fun res!828430 () Bool)

(declare-fun e!704051 () Bool)

(assert (=> b!1242061 (=> (not res!828430) (not e!704051))))

(declare-datatypes ((B!1888 0))(
  ( (B!1889 (val!15706 Int)) )
))
(declare-datatypes ((tuple2!20284 0))(
  ( (tuple2!20285 (_1!10153 (_ BitVec 64)) (_2!10153 B!1888)) )
))
(declare-datatypes ((List!27371 0))(
  ( (Nil!27368) (Cons!27367 (h!28576 tuple2!20284) (t!40834 List!27371)) )
))
(declare-fun l!644 () List!27371)

(get-info :version)

(assert (=> b!1242061 (= res!828430 ((_ is Cons!27367) l!644))))

(declare-fun res!828427 () Bool)

(assert (=> start!103748 (=> (not res!828427) (not e!704051))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103748 (= res!828427 (not (= key1!25 key2!15)))))

(assert (=> start!103748 e!704051))

(assert (=> start!103748 true))

(declare-fun e!704052 () Bool)

(assert (=> start!103748 e!704052))

(declare-fun tp_is_empty!31287 () Bool)

(assert (=> start!103748 tp_is_empty!31287))

(declare-fun b!1242062 () Bool)

(declare-fun tp!92747 () Bool)

(assert (=> b!1242062 (= e!704052 (and tp_is_empty!31287 tp!92747))))

(declare-fun b!1242063 () Bool)

(declare-fun res!828428 () Bool)

(assert (=> b!1242063 (=> (not res!828428) (not e!704051))))

(declare-fun isStrictlySorted!764 (List!27371) Bool)

(assert (=> b!1242063 (= res!828428 (isStrictlySorted!764 l!644))))

(declare-fun b!1242064 () Bool)

(declare-fun res!828429 () Bool)

(assert (=> b!1242064 (=> (not res!828429) (not e!704051))))

(assert (=> b!1242064 (= res!828429 (isStrictlySorted!764 (t!40834 l!644)))))

(declare-fun b!1242065 () Bool)

(declare-fun v1!20 () B!1888)

(declare-fun insertStrictlySorted!438 (List!27371 (_ BitVec 64) B!1888) List!27371)

(declare-fun removeStrictlySorted!131 (List!27371 (_ BitVec 64)) List!27371)

(assert (=> b!1242065 (= e!704051 (not (= (insertStrictlySorted!438 (removeStrictlySorted!131 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!438 l!644 key1!25 v1!20) key2!15))))))

(assert (=> b!1242065 (= (insertStrictlySorted!438 (removeStrictlySorted!131 (t!40834 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41263 0))(
  ( (Unit!41264) )
))
(declare-fun lt!562187 () Unit!41263)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!17 (List!27371 (_ BitVec 64) B!1888 (_ BitVec 64)) Unit!41263)

(assert (=> b!1242065 (= lt!562187 (lemmaInsertAndRemoveStrictlySortedCommutative!17 (t!40834 l!644) key1!25 v1!20 key2!15))))

(assert (= (and start!103748 res!828427) b!1242063))

(assert (= (and b!1242063 res!828428) b!1242061))

(assert (= (and b!1242061 res!828430) b!1242064))

(assert (= (and b!1242064 res!828429) b!1242065))

(assert (= (and start!103748 ((_ is Cons!27367) l!644)) b!1242062))

(declare-fun m!1144775 () Bool)

(assert (=> b!1242063 m!1144775))

(declare-fun m!1144777 () Bool)

(assert (=> b!1242064 m!1144777))

(declare-fun m!1144779 () Bool)

(assert (=> b!1242065 m!1144779))

(declare-fun m!1144781 () Bool)

(assert (=> b!1242065 m!1144781))

(assert (=> b!1242065 m!1144779))

(declare-fun m!1144783 () Bool)

(assert (=> b!1242065 m!1144783))

(declare-fun m!1144785 () Bool)

(assert (=> b!1242065 m!1144785))

(declare-fun m!1144787 () Bool)

(assert (=> b!1242065 m!1144787))

(assert (=> b!1242065 m!1144785))

(declare-fun m!1144789 () Bool)

(assert (=> b!1242065 m!1144789))

(declare-fun m!1144791 () Bool)

(assert (=> b!1242065 m!1144791))

(assert (=> b!1242065 m!1144789))

(assert (=> b!1242065 m!1144783))

(declare-fun m!1144793 () Bool)

(assert (=> b!1242065 m!1144793))

(declare-fun m!1144795 () Bool)

(assert (=> b!1242065 m!1144795))

(check-sat (not b!1242062) (not b!1242063) tp_is_empty!31287 (not b!1242065) (not b!1242064))
(check-sat)
(get-model)

(declare-fun d!136597 () Bool)

(declare-fun res!828453 () Bool)

(declare-fun e!704081 () Bool)

(assert (=> d!136597 (=> res!828453 e!704081)))

(assert (=> d!136597 (= res!828453 (or ((_ is Nil!27368) l!644) ((_ is Nil!27368) (t!40834 l!644))))))

(assert (=> d!136597 (= (isStrictlySorted!764 l!644) e!704081)))

(declare-fun b!1242115 () Bool)

(declare-fun e!704082 () Bool)

(assert (=> b!1242115 (= e!704081 e!704082)))

(declare-fun res!828454 () Bool)

(assert (=> b!1242115 (=> (not res!828454) (not e!704082))))

(assert (=> b!1242115 (= res!828454 (bvslt (_1!10153 (h!28576 l!644)) (_1!10153 (h!28576 (t!40834 l!644)))))))

(declare-fun b!1242116 () Bool)

(assert (=> b!1242116 (= e!704082 (isStrictlySorted!764 (t!40834 l!644)))))

(assert (= (and d!136597 (not res!828453)) b!1242115))

(assert (= (and b!1242115 res!828454) b!1242116))

(assert (=> b!1242116 m!1144777))

(assert (=> b!1242063 d!136597))

(declare-fun d!136599 () Bool)

(declare-fun res!828455 () Bool)

(declare-fun e!704083 () Bool)

(assert (=> d!136599 (=> res!828455 e!704083)))

(assert (=> d!136599 (= res!828455 (or ((_ is Nil!27368) (t!40834 l!644)) ((_ is Nil!27368) (t!40834 (t!40834 l!644)))))))

(assert (=> d!136599 (= (isStrictlySorted!764 (t!40834 l!644)) e!704083)))

(declare-fun b!1242117 () Bool)

(declare-fun e!704084 () Bool)

(assert (=> b!1242117 (= e!704083 e!704084)))

(declare-fun res!828456 () Bool)

(assert (=> b!1242117 (=> (not res!828456) (not e!704084))))

(assert (=> b!1242117 (= res!828456 (bvslt (_1!10153 (h!28576 (t!40834 l!644))) (_1!10153 (h!28576 (t!40834 (t!40834 l!644))))))))

(declare-fun b!1242118 () Bool)

(assert (=> b!1242118 (= e!704084 (isStrictlySorted!764 (t!40834 (t!40834 l!644))))))

(assert (= (and d!136599 (not res!828455)) b!1242117))

(assert (= (and b!1242117 res!828456) b!1242118))

(declare-fun m!1144839 () Bool)

(assert (=> b!1242118 m!1144839))

(assert (=> b!1242064 d!136599))

(declare-fun b!1242239 () Bool)

(declare-fun e!704148 () Bool)

(declare-fun lt!562213 () List!27371)

(declare-fun containsKey!614 (List!27371 (_ BitVec 64)) Bool)

(assert (=> b!1242239 (= e!704148 (not (containsKey!614 lt!562213 key2!15)))))

(declare-fun b!1242240 () Bool)

(declare-fun e!704147 () List!27371)

(declare-fun $colon$colon!628 (List!27371 tuple2!20284) List!27371)

(assert (=> b!1242240 (= e!704147 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) key2!15) (h!28576 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))))))

(declare-fun e!704149 () List!27371)

(declare-fun b!1242241 () Bool)

(assert (=> b!1242241 (= e!704149 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)))))

(declare-fun b!1242242 () Bool)

(assert (=> b!1242242 (= e!704147 Nil!27368)))

(declare-fun d!136601 () Bool)

(assert (=> d!136601 e!704148))

(declare-fun res!828481 () Bool)

(assert (=> d!136601 (=> (not res!828481) (not e!704148))))

(assert (=> d!136601 (= res!828481 (isStrictlySorted!764 lt!562213))))

(assert (=> d!136601 (= lt!562213 e!704149)))

(declare-fun c!121586 () Bool)

(assert (=> d!136601 (= c!121586 (and ((_ is Cons!27367) (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) (= (_1!10153 (h!28576 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136601 (isStrictlySorted!764 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))))

(assert (=> d!136601 (= (removeStrictlySorted!131 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20) key2!15) lt!562213)))

(declare-fun b!1242243 () Bool)

(assert (=> b!1242243 (= e!704149 e!704147)))

(declare-fun c!121587 () Bool)

(assert (=> b!1242243 (= c!121587 (and ((_ is Cons!27367) (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) (not (= (_1!10153 (h!28576 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) key2!15))))))

(assert (= (and d!136601 c!121586) b!1242241))

(assert (= (and d!136601 (not c!121586)) b!1242243))

(assert (= (and b!1242243 c!121587) b!1242240))

(assert (= (and b!1242243 (not c!121587)) b!1242242))

(assert (= (and d!136601 res!828481) b!1242239))

(declare-fun m!1144919 () Bool)

(assert (=> b!1242239 m!1144919))

(declare-fun m!1144921 () Bool)

(assert (=> b!1242240 m!1144921))

(assert (=> b!1242240 m!1144921))

(declare-fun m!1144925 () Bool)

(assert (=> b!1242240 m!1144925))

(declare-fun m!1144927 () Bool)

(assert (=> d!136601 m!1144927))

(assert (=> d!136601 m!1144785))

(declare-fun m!1144929 () Bool)

(assert (=> d!136601 m!1144929))

(assert (=> b!1242065 d!136601))

(declare-fun b!1242330 () Bool)

(declare-fun e!704205 () List!27371)

(declare-fun call!61318 () List!27371)

(assert (=> b!1242330 (= e!704205 call!61318)))

(declare-fun d!136623 () Bool)

(declare-fun e!704208 () Bool)

(assert (=> d!136623 e!704208))

(declare-fun res!828510 () Bool)

(assert (=> d!136623 (=> (not res!828510) (not e!704208))))

(declare-fun lt!562226 () List!27371)

(assert (=> d!136623 (= res!828510 (isStrictlySorted!764 lt!562226))))

(declare-fun e!704206 () List!27371)

(assert (=> d!136623 (= lt!562226 e!704206)))

(declare-fun c!121613 () Bool)

(assert (=> d!136623 (= c!121613 (and ((_ is Cons!27367) (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (bvslt (_1!10153 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) key1!25)))))

(assert (=> d!136623 (isStrictlySorted!764 (removeStrictlySorted!131 (t!40834 l!644) key2!15))))

(assert (=> d!136623 (= (insertStrictlySorted!438 (removeStrictlySorted!131 (t!40834 l!644) key2!15) key1!25 v1!20) lt!562226)))

(declare-fun bm!61313 () Bool)

(declare-fun call!61316 () List!27371)

(assert (=> bm!61313 (= call!61318 call!61316)))

(declare-fun b!1242331 () Bool)

(declare-fun c!121612 () Bool)

(assert (=> b!1242331 (= c!121612 (and ((_ is Cons!27367) (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (bvsgt (_1!10153 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) key1!25)))))

(declare-fun e!704204 () List!27371)

(assert (=> b!1242331 (= e!704204 e!704205)))

(declare-fun b!1242332 () Bool)

(assert (=> b!1242332 (= e!704206 e!704204)))

(declare-fun c!121615 () Bool)

(assert (=> b!1242332 (= c!121615 (and ((_ is Cons!27367) (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (= (_1!10153 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) key1!25)))))

(declare-fun bm!61314 () Bool)

(declare-fun e!704207 () List!27371)

(declare-fun call!61317 () List!27371)

(assert (=> bm!61314 (= call!61317 ($colon$colon!628 e!704207 (ite c!121613 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121614 () Bool)

(assert (=> bm!61314 (= c!121614 c!121613)))

(declare-fun b!1242333 () Bool)

(assert (=> b!1242333 (= e!704206 call!61317)))

(declare-fun b!1242334 () Bool)

(declare-fun contains!7395 (List!27371 tuple2!20284) Bool)

(assert (=> b!1242334 (= e!704208 (contains!7395 lt!562226 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242335 () Bool)

(assert (=> b!1242335 (= e!704205 call!61318)))

(declare-fun b!1242336 () Bool)

(assert (=> b!1242336 (= e!704204 call!61316)))

(declare-fun b!1242337 () Bool)

(assert (=> b!1242337 (= e!704207 (ite c!121615 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (ite c!121612 (Cons!27367 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) Nil!27368)))))

(declare-fun b!1242338 () Bool)

(assert (=> b!1242338 (= e!704207 (insertStrictlySorted!438 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) key1!25 v1!20))))

(declare-fun bm!61315 () Bool)

(assert (=> bm!61315 (= call!61316 call!61317)))

(declare-fun b!1242339 () Bool)

(declare-fun res!828511 () Bool)

(assert (=> b!1242339 (=> (not res!828511) (not e!704208))))

(assert (=> b!1242339 (= res!828511 (containsKey!614 lt!562226 key1!25))))

(assert (= (and d!136623 c!121613) b!1242333))

(assert (= (and d!136623 (not c!121613)) b!1242332))

(assert (= (and b!1242332 c!121615) b!1242336))

(assert (= (and b!1242332 (not c!121615)) b!1242331))

(assert (= (and b!1242331 c!121612) b!1242330))

(assert (= (and b!1242331 (not c!121612)) b!1242335))

(assert (= (or b!1242330 b!1242335) bm!61313))

(assert (= (or b!1242336 bm!61313) bm!61315))

(assert (= (or b!1242333 bm!61315) bm!61314))

(assert (= (and bm!61314 c!121614) b!1242338))

(assert (= (and bm!61314 (not c!121614)) b!1242337))

(assert (= (and d!136623 res!828510) b!1242339))

(assert (= (and b!1242339 res!828511) b!1242334))

(declare-fun m!1144991 () Bool)

(assert (=> b!1242339 m!1144991))

(declare-fun m!1144993 () Bool)

(assert (=> d!136623 m!1144993))

(assert (=> d!136623 m!1144789))

(declare-fun m!1144995 () Bool)

(assert (=> d!136623 m!1144995))

(declare-fun m!1144997 () Bool)

(assert (=> b!1242334 m!1144997))

(declare-fun m!1144999 () Bool)

(assert (=> bm!61314 m!1144999))

(declare-fun m!1145001 () Bool)

(assert (=> b!1242338 m!1145001))

(assert (=> b!1242065 d!136623))

(declare-fun b!1242340 () Bool)

(declare-fun e!704210 () List!27371)

(declare-fun call!61321 () List!27371)

(assert (=> b!1242340 (= e!704210 call!61321)))

(declare-fun d!136641 () Bool)

(declare-fun e!704213 () Bool)

(assert (=> d!136641 e!704213))

(declare-fun res!828512 () Bool)

(assert (=> d!136641 (=> (not res!828512) (not e!704213))))

(declare-fun lt!562227 () List!27371)

(assert (=> d!136641 (= res!828512 (isStrictlySorted!764 lt!562227))))

(declare-fun e!704211 () List!27371)

(assert (=> d!136641 (= lt!562227 e!704211)))

(declare-fun c!121617 () Bool)

(assert (=> d!136641 (= c!121617 (and ((_ is Cons!27367) l!644) (bvslt (_1!10153 (h!28576 l!644)) key1!25)))))

(assert (=> d!136641 (isStrictlySorted!764 l!644)))

(assert (=> d!136641 (= (insertStrictlySorted!438 l!644 key1!25 v1!20) lt!562227)))

(declare-fun bm!61316 () Bool)

(declare-fun call!61319 () List!27371)

(assert (=> bm!61316 (= call!61321 call!61319)))

(declare-fun b!1242341 () Bool)

(declare-fun c!121616 () Bool)

(assert (=> b!1242341 (= c!121616 (and ((_ is Cons!27367) l!644) (bvsgt (_1!10153 (h!28576 l!644)) key1!25)))))

(declare-fun e!704209 () List!27371)

(assert (=> b!1242341 (= e!704209 e!704210)))

(declare-fun b!1242342 () Bool)

(assert (=> b!1242342 (= e!704211 e!704209)))

(declare-fun c!121619 () Bool)

(assert (=> b!1242342 (= c!121619 (and ((_ is Cons!27367) l!644) (= (_1!10153 (h!28576 l!644)) key1!25)))))

(declare-fun call!61320 () List!27371)

(declare-fun bm!61317 () Bool)

(declare-fun e!704212 () List!27371)

(assert (=> bm!61317 (= call!61320 ($colon$colon!628 e!704212 (ite c!121617 (h!28576 l!644) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121618 () Bool)

(assert (=> bm!61317 (= c!121618 c!121617)))

(declare-fun b!1242343 () Bool)

(assert (=> b!1242343 (= e!704211 call!61320)))

(declare-fun b!1242344 () Bool)

(assert (=> b!1242344 (= e!704213 (contains!7395 lt!562227 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242345 () Bool)

(assert (=> b!1242345 (= e!704210 call!61321)))

(declare-fun b!1242346 () Bool)

(assert (=> b!1242346 (= e!704209 call!61319)))

(declare-fun b!1242347 () Bool)

(assert (=> b!1242347 (= e!704212 (ite c!121619 (t!40834 l!644) (ite c!121616 (Cons!27367 (h!28576 l!644) (t!40834 l!644)) Nil!27368)))))

(declare-fun b!1242348 () Bool)

(assert (=> b!1242348 (= e!704212 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))))

(declare-fun bm!61318 () Bool)

(assert (=> bm!61318 (= call!61319 call!61320)))

(declare-fun b!1242349 () Bool)

(declare-fun res!828513 () Bool)

(assert (=> b!1242349 (=> (not res!828513) (not e!704213))))

(assert (=> b!1242349 (= res!828513 (containsKey!614 lt!562227 key1!25))))

(assert (= (and d!136641 c!121617) b!1242343))

(assert (= (and d!136641 (not c!121617)) b!1242342))

(assert (= (and b!1242342 c!121619) b!1242346))

(assert (= (and b!1242342 (not c!121619)) b!1242341))

(assert (= (and b!1242341 c!121616) b!1242340))

(assert (= (and b!1242341 (not c!121616)) b!1242345))

(assert (= (or b!1242340 b!1242345) bm!61316))

(assert (= (or b!1242346 bm!61316) bm!61318))

(assert (= (or b!1242343 bm!61318) bm!61317))

(assert (= (and bm!61317 c!121618) b!1242348))

(assert (= (and bm!61317 (not c!121618)) b!1242347))

(assert (= (and d!136641 res!828512) b!1242349))

(assert (= (and b!1242349 res!828513) b!1242344))

(declare-fun m!1145003 () Bool)

(assert (=> b!1242349 m!1145003))

(declare-fun m!1145005 () Bool)

(assert (=> d!136641 m!1145005))

(assert (=> d!136641 m!1144775))

(declare-fun m!1145007 () Bool)

(assert (=> b!1242344 m!1145007))

(declare-fun m!1145009 () Bool)

(assert (=> bm!61317 m!1145009))

(assert (=> b!1242348 m!1144785))

(assert (=> b!1242065 d!136641))

(declare-fun b!1242350 () Bool)

(declare-fun e!704215 () List!27371)

(declare-fun call!61324 () List!27371)

(assert (=> b!1242350 (= e!704215 call!61324)))

(declare-fun d!136643 () Bool)

(declare-fun e!704218 () Bool)

(assert (=> d!136643 e!704218))

(declare-fun res!828514 () Bool)

(assert (=> d!136643 (=> (not res!828514) (not e!704218))))

(declare-fun lt!562228 () List!27371)

(assert (=> d!136643 (= res!828514 (isStrictlySorted!764 lt!562228))))

(declare-fun e!704216 () List!27371)

(assert (=> d!136643 (= lt!562228 e!704216)))

(declare-fun c!121621 () Bool)

(assert (=> d!136643 (= c!121621 (and ((_ is Cons!27367) (removeStrictlySorted!131 l!644 key2!15)) (bvslt (_1!10153 (h!28576 (removeStrictlySorted!131 l!644 key2!15))) key1!25)))))

(assert (=> d!136643 (isStrictlySorted!764 (removeStrictlySorted!131 l!644 key2!15))))

(assert (=> d!136643 (= (insertStrictlySorted!438 (removeStrictlySorted!131 l!644 key2!15) key1!25 v1!20) lt!562228)))

(declare-fun bm!61319 () Bool)

(declare-fun call!61322 () List!27371)

(assert (=> bm!61319 (= call!61324 call!61322)))

(declare-fun b!1242351 () Bool)

(declare-fun c!121620 () Bool)

(assert (=> b!1242351 (= c!121620 (and ((_ is Cons!27367) (removeStrictlySorted!131 l!644 key2!15)) (bvsgt (_1!10153 (h!28576 (removeStrictlySorted!131 l!644 key2!15))) key1!25)))))

(declare-fun e!704214 () List!27371)

(assert (=> b!1242351 (= e!704214 e!704215)))

(declare-fun b!1242352 () Bool)

(assert (=> b!1242352 (= e!704216 e!704214)))

(declare-fun c!121623 () Bool)

(assert (=> b!1242352 (= c!121623 (and ((_ is Cons!27367) (removeStrictlySorted!131 l!644 key2!15)) (= (_1!10153 (h!28576 (removeStrictlySorted!131 l!644 key2!15))) key1!25)))))

(declare-fun e!704217 () List!27371)

(declare-fun call!61323 () List!27371)

(declare-fun bm!61320 () Bool)

(assert (=> bm!61320 (= call!61323 ($colon$colon!628 e!704217 (ite c!121621 (h!28576 (removeStrictlySorted!131 l!644 key2!15)) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121622 () Bool)

(assert (=> bm!61320 (= c!121622 c!121621)))

(declare-fun b!1242353 () Bool)

(assert (=> b!1242353 (= e!704216 call!61323)))

(declare-fun b!1242354 () Bool)

(assert (=> b!1242354 (= e!704218 (contains!7395 lt!562228 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242355 () Bool)

(assert (=> b!1242355 (= e!704215 call!61324)))

(declare-fun b!1242356 () Bool)

(assert (=> b!1242356 (= e!704214 call!61322)))

(declare-fun b!1242357 () Bool)

(assert (=> b!1242357 (= e!704217 (ite c!121623 (t!40834 (removeStrictlySorted!131 l!644 key2!15)) (ite c!121620 (Cons!27367 (h!28576 (removeStrictlySorted!131 l!644 key2!15)) (t!40834 (removeStrictlySorted!131 l!644 key2!15))) Nil!27368)))))

(declare-fun b!1242358 () Bool)

(assert (=> b!1242358 (= e!704217 (insertStrictlySorted!438 (t!40834 (removeStrictlySorted!131 l!644 key2!15)) key1!25 v1!20))))

(declare-fun bm!61321 () Bool)

(assert (=> bm!61321 (= call!61322 call!61323)))

(declare-fun b!1242359 () Bool)

(declare-fun res!828515 () Bool)

(assert (=> b!1242359 (=> (not res!828515) (not e!704218))))

(assert (=> b!1242359 (= res!828515 (containsKey!614 lt!562228 key1!25))))

(assert (= (and d!136643 c!121621) b!1242353))

(assert (= (and d!136643 (not c!121621)) b!1242352))

(assert (= (and b!1242352 c!121623) b!1242356))

(assert (= (and b!1242352 (not c!121623)) b!1242351))

(assert (= (and b!1242351 c!121620) b!1242350))

(assert (= (and b!1242351 (not c!121620)) b!1242355))

(assert (= (or b!1242350 b!1242355) bm!61319))

(assert (= (or b!1242356 bm!61319) bm!61321))

(assert (= (or b!1242353 bm!61321) bm!61320))

(assert (= (and bm!61320 c!121622) b!1242358))

(assert (= (and bm!61320 (not c!121622)) b!1242357))

(assert (= (and d!136643 res!828514) b!1242359))

(assert (= (and b!1242359 res!828515) b!1242354))

(declare-fun m!1145011 () Bool)

(assert (=> b!1242359 m!1145011))

(declare-fun m!1145013 () Bool)

(assert (=> d!136643 m!1145013))

(assert (=> d!136643 m!1144779))

(declare-fun m!1145015 () Bool)

(assert (=> d!136643 m!1145015))

(declare-fun m!1145017 () Bool)

(assert (=> b!1242354 m!1145017))

(declare-fun m!1145019 () Bool)

(assert (=> bm!61320 m!1145019))

(declare-fun m!1145021 () Bool)

(assert (=> b!1242358 m!1145021))

(assert (=> b!1242065 d!136643))

(declare-fun b!1242360 () Bool)

(declare-fun e!704220 () Bool)

(declare-fun lt!562229 () List!27371)

(assert (=> b!1242360 (= e!704220 (not (containsKey!614 lt!562229 key2!15)))))

(declare-fun b!1242361 () Bool)

(declare-fun e!704219 () List!27371)

(assert (=> b!1242361 (= e!704219 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 l!644) key2!15) (h!28576 l!644)))))

(declare-fun b!1242362 () Bool)

(declare-fun e!704221 () List!27371)

(assert (=> b!1242362 (= e!704221 (t!40834 l!644))))

(declare-fun b!1242363 () Bool)

(assert (=> b!1242363 (= e!704219 Nil!27368)))

(declare-fun d!136645 () Bool)

(assert (=> d!136645 e!704220))

(declare-fun res!828516 () Bool)

(assert (=> d!136645 (=> (not res!828516) (not e!704220))))

(assert (=> d!136645 (= res!828516 (isStrictlySorted!764 lt!562229))))

(assert (=> d!136645 (= lt!562229 e!704221)))

(declare-fun c!121624 () Bool)

(assert (=> d!136645 (= c!121624 (and ((_ is Cons!27367) l!644) (= (_1!10153 (h!28576 l!644)) key2!15)))))

(assert (=> d!136645 (isStrictlySorted!764 l!644)))

(assert (=> d!136645 (= (removeStrictlySorted!131 l!644 key2!15) lt!562229)))

(declare-fun b!1242364 () Bool)

(assert (=> b!1242364 (= e!704221 e!704219)))

(declare-fun c!121625 () Bool)

(assert (=> b!1242364 (= c!121625 (and ((_ is Cons!27367) l!644) (not (= (_1!10153 (h!28576 l!644)) key2!15))))))

(assert (= (and d!136645 c!121624) b!1242362))

(assert (= (and d!136645 (not c!121624)) b!1242364))

(assert (= (and b!1242364 c!121625) b!1242361))

(assert (= (and b!1242364 (not c!121625)) b!1242363))

(assert (= (and d!136645 res!828516) b!1242360))

(declare-fun m!1145023 () Bool)

(assert (=> b!1242360 m!1145023))

(assert (=> b!1242361 m!1144789))

(assert (=> b!1242361 m!1144789))

(declare-fun m!1145025 () Bool)

(assert (=> b!1242361 m!1145025))

(declare-fun m!1145027 () Bool)

(assert (=> d!136645 m!1145027))

(assert (=> d!136645 m!1144775))

(assert (=> b!1242065 d!136645))

(declare-fun d!136647 () Bool)

(assert (=> d!136647 (= (insertStrictlySorted!438 (removeStrictlySorted!131 (t!40834 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562232 () Unit!41263)

(declare-fun choose!1841 (List!27371 (_ BitVec 64) B!1888 (_ BitVec 64)) Unit!41263)

(assert (=> d!136647 (= lt!562232 (choose!1841 (t!40834 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136647 (not (= key1!25 key2!15))))

(assert (=> d!136647 (= (lemmaInsertAndRemoveStrictlySortedCommutative!17 (t!40834 l!644) key1!25 v1!20 key2!15) lt!562232)))

(declare-fun bs!34978 () Bool)

(assert (= bs!34978 d!136647))

(assert (=> bs!34978 m!1144785))

(assert (=> bs!34978 m!1144787))

(assert (=> bs!34978 m!1144789))

(assert (=> bs!34978 m!1144785))

(assert (=> bs!34978 m!1144789))

(assert (=> bs!34978 m!1144791))

(declare-fun m!1145029 () Bool)

(assert (=> bs!34978 m!1145029))

(assert (=> b!1242065 d!136647))

(declare-fun b!1242365 () Bool)

(declare-fun e!704223 () List!27371)

(declare-fun call!61327 () List!27371)

(assert (=> b!1242365 (= e!704223 call!61327)))

(declare-fun d!136649 () Bool)

(declare-fun e!704226 () Bool)

(assert (=> d!136649 e!704226))

(declare-fun res!828517 () Bool)

(assert (=> d!136649 (=> (not res!828517) (not e!704226))))

(declare-fun lt!562233 () List!27371)

(assert (=> d!136649 (= res!828517 (isStrictlySorted!764 lt!562233))))

(declare-fun e!704224 () List!27371)

(assert (=> d!136649 (= lt!562233 e!704224)))

(declare-fun c!121627 () Bool)

(assert (=> d!136649 (= c!121627 (and ((_ is Cons!27367) (t!40834 l!644)) (bvslt (_1!10153 (h!28576 (t!40834 l!644))) key1!25)))))

(assert (=> d!136649 (isStrictlySorted!764 (t!40834 l!644))))

(assert (=> d!136649 (= (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20) lt!562233)))

(declare-fun bm!61322 () Bool)

(declare-fun call!61325 () List!27371)

(assert (=> bm!61322 (= call!61327 call!61325)))

(declare-fun b!1242366 () Bool)

(declare-fun c!121626 () Bool)

(assert (=> b!1242366 (= c!121626 (and ((_ is Cons!27367) (t!40834 l!644)) (bvsgt (_1!10153 (h!28576 (t!40834 l!644))) key1!25)))))

(declare-fun e!704222 () List!27371)

(assert (=> b!1242366 (= e!704222 e!704223)))

(declare-fun b!1242367 () Bool)

(assert (=> b!1242367 (= e!704224 e!704222)))

(declare-fun c!121629 () Bool)

(assert (=> b!1242367 (= c!121629 (and ((_ is Cons!27367) (t!40834 l!644)) (= (_1!10153 (h!28576 (t!40834 l!644))) key1!25)))))

(declare-fun e!704225 () List!27371)

(declare-fun bm!61323 () Bool)

(declare-fun call!61326 () List!27371)

(assert (=> bm!61323 (= call!61326 ($colon$colon!628 e!704225 (ite c!121627 (h!28576 (t!40834 l!644)) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121628 () Bool)

(assert (=> bm!61323 (= c!121628 c!121627)))

(declare-fun b!1242368 () Bool)

(assert (=> b!1242368 (= e!704224 call!61326)))

(declare-fun b!1242369 () Bool)

(assert (=> b!1242369 (= e!704226 (contains!7395 lt!562233 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242370 () Bool)

(assert (=> b!1242370 (= e!704223 call!61327)))

(declare-fun b!1242371 () Bool)

(assert (=> b!1242371 (= e!704222 call!61325)))

(declare-fun b!1242372 () Bool)

(assert (=> b!1242372 (= e!704225 (ite c!121629 (t!40834 (t!40834 l!644)) (ite c!121626 (Cons!27367 (h!28576 (t!40834 l!644)) (t!40834 (t!40834 l!644))) Nil!27368)))))

(declare-fun b!1242373 () Bool)

(assert (=> b!1242373 (= e!704225 (insertStrictlySorted!438 (t!40834 (t!40834 l!644)) key1!25 v1!20))))

(declare-fun bm!61324 () Bool)

(assert (=> bm!61324 (= call!61325 call!61326)))

(declare-fun b!1242374 () Bool)

(declare-fun res!828518 () Bool)

(assert (=> b!1242374 (=> (not res!828518) (not e!704226))))

(assert (=> b!1242374 (= res!828518 (containsKey!614 lt!562233 key1!25))))

(assert (= (and d!136649 c!121627) b!1242368))

(assert (= (and d!136649 (not c!121627)) b!1242367))

(assert (= (and b!1242367 c!121629) b!1242371))

(assert (= (and b!1242367 (not c!121629)) b!1242366))

(assert (= (and b!1242366 c!121626) b!1242365))

(assert (= (and b!1242366 (not c!121626)) b!1242370))

(assert (= (or b!1242365 b!1242370) bm!61322))

(assert (= (or b!1242371 bm!61322) bm!61324))

(assert (= (or b!1242368 bm!61324) bm!61323))

(assert (= (and bm!61323 c!121628) b!1242373))

(assert (= (and bm!61323 (not c!121628)) b!1242372))

(assert (= (and d!136649 res!828517) b!1242374))

(assert (= (and b!1242374 res!828518) b!1242369))

(declare-fun m!1145031 () Bool)

(assert (=> b!1242374 m!1145031))

(declare-fun m!1145033 () Bool)

(assert (=> d!136649 m!1145033))

(assert (=> d!136649 m!1144777))

(declare-fun m!1145035 () Bool)

(assert (=> b!1242369 m!1145035))

(declare-fun m!1145037 () Bool)

(assert (=> bm!61323 m!1145037))

(declare-fun m!1145039 () Bool)

(assert (=> b!1242373 m!1145039))

(assert (=> b!1242065 d!136649))

(declare-fun b!1242375 () Bool)

(declare-fun e!704228 () Bool)

(declare-fun lt!562234 () List!27371)

(assert (=> b!1242375 (= e!704228 (not (containsKey!614 lt!562234 key2!15)))))

(declare-fun b!1242376 () Bool)

(declare-fun e!704227 () List!27371)

(assert (=> b!1242376 (= e!704227 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)) key2!15) (h!28576 (insertStrictlySorted!438 l!644 key1!25 v1!20))))))

(declare-fun b!1242377 () Bool)

(declare-fun e!704229 () List!27371)

(assert (=> b!1242377 (= e!704229 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)))))

(declare-fun b!1242378 () Bool)

(assert (=> b!1242378 (= e!704227 Nil!27368)))

(declare-fun d!136651 () Bool)

(assert (=> d!136651 e!704228))

(declare-fun res!828519 () Bool)

(assert (=> d!136651 (=> (not res!828519) (not e!704228))))

(assert (=> d!136651 (= res!828519 (isStrictlySorted!764 lt!562234))))

(assert (=> d!136651 (= lt!562234 e!704229)))

(declare-fun c!121630 () Bool)

(assert (=> d!136651 (= c!121630 (and ((_ is Cons!27367) (insertStrictlySorted!438 l!644 key1!25 v1!20)) (= (_1!10153 (h!28576 (insertStrictlySorted!438 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136651 (isStrictlySorted!764 (insertStrictlySorted!438 l!644 key1!25 v1!20))))

(assert (=> d!136651 (= (removeStrictlySorted!131 (insertStrictlySorted!438 l!644 key1!25 v1!20) key2!15) lt!562234)))

(declare-fun b!1242379 () Bool)

(assert (=> b!1242379 (= e!704229 e!704227)))

(declare-fun c!121631 () Bool)

(assert (=> b!1242379 (= c!121631 (and ((_ is Cons!27367) (insertStrictlySorted!438 l!644 key1!25 v1!20)) (not (= (_1!10153 (h!28576 (insertStrictlySorted!438 l!644 key1!25 v1!20))) key2!15))))))

(assert (= (and d!136651 c!121630) b!1242377))

(assert (= (and d!136651 (not c!121630)) b!1242379))

(assert (= (and b!1242379 c!121631) b!1242376))

(assert (= (and b!1242379 (not c!121631)) b!1242378))

(assert (= (and d!136651 res!828519) b!1242375))

(declare-fun m!1145041 () Bool)

(assert (=> b!1242375 m!1145041))

(declare-fun m!1145043 () Bool)

(assert (=> b!1242376 m!1145043))

(assert (=> b!1242376 m!1145043))

(declare-fun m!1145045 () Bool)

(assert (=> b!1242376 m!1145045))

(declare-fun m!1145047 () Bool)

(assert (=> d!136651 m!1145047))

(assert (=> d!136651 m!1144783))

(declare-fun m!1145049 () Bool)

(assert (=> d!136651 m!1145049))

(assert (=> b!1242065 d!136651))

(declare-fun b!1242380 () Bool)

(declare-fun e!704231 () Bool)

(declare-fun lt!562235 () List!27371)

(assert (=> b!1242380 (= e!704231 (not (containsKey!614 lt!562235 key2!15)))))

(declare-fun b!1242381 () Bool)

(declare-fun e!704230 () List!27371)

(assert (=> b!1242381 (= e!704230 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (t!40834 l!644)) key2!15) (h!28576 (t!40834 l!644))))))

(declare-fun b!1242382 () Bool)

(declare-fun e!704232 () List!27371)

(assert (=> b!1242382 (= e!704232 (t!40834 (t!40834 l!644)))))

(declare-fun b!1242383 () Bool)

(assert (=> b!1242383 (= e!704230 Nil!27368)))

(declare-fun d!136653 () Bool)

(assert (=> d!136653 e!704231))

(declare-fun res!828520 () Bool)

(assert (=> d!136653 (=> (not res!828520) (not e!704231))))

(assert (=> d!136653 (= res!828520 (isStrictlySorted!764 lt!562235))))

(assert (=> d!136653 (= lt!562235 e!704232)))

(declare-fun c!121632 () Bool)

(assert (=> d!136653 (= c!121632 (and ((_ is Cons!27367) (t!40834 l!644)) (= (_1!10153 (h!28576 (t!40834 l!644))) key2!15)))))

(assert (=> d!136653 (isStrictlySorted!764 (t!40834 l!644))))

(assert (=> d!136653 (= (removeStrictlySorted!131 (t!40834 l!644) key2!15) lt!562235)))

(declare-fun b!1242384 () Bool)

(assert (=> b!1242384 (= e!704232 e!704230)))

(declare-fun c!121633 () Bool)

(assert (=> b!1242384 (= c!121633 (and ((_ is Cons!27367) (t!40834 l!644)) (not (= (_1!10153 (h!28576 (t!40834 l!644))) key2!15))))))

(assert (= (and d!136653 c!121632) b!1242382))

(assert (= (and d!136653 (not c!121632)) b!1242384))

(assert (= (and b!1242384 c!121633) b!1242381))

(assert (= (and b!1242384 (not c!121633)) b!1242383))

(assert (= (and d!136653 res!828520) b!1242380))

(declare-fun m!1145051 () Bool)

(assert (=> b!1242380 m!1145051))

(declare-fun m!1145053 () Bool)

(assert (=> b!1242381 m!1145053))

(assert (=> b!1242381 m!1145053))

(declare-fun m!1145055 () Bool)

(assert (=> b!1242381 m!1145055))

(declare-fun m!1145057 () Bool)

(assert (=> d!136653 m!1145057))

(assert (=> d!136653 m!1144777))

(assert (=> b!1242065 d!136653))

(declare-fun b!1242389 () Bool)

(declare-fun e!704235 () Bool)

(declare-fun tp!92759 () Bool)

(assert (=> b!1242389 (= e!704235 (and tp_is_empty!31287 tp!92759))))

(assert (=> b!1242062 (= tp!92747 e!704235)))

(assert (= (and b!1242062 ((_ is Cons!27367) (t!40834 l!644))) b!1242389))

(check-sat (not b!1242361) (not b!1242354) (not b!1242375) (not b!1242338) (not d!136623) (not b!1242239) (not b!1242376) (not b!1242360) (not b!1242349) (not bm!61314) (not b!1242334) (not b!1242381) (not bm!61323) (not d!136651) (not b!1242118) (not b!1242380) (not b!1242240) (not b!1242373) (not b!1242389) (not d!136601) (not b!1242116) (not b!1242344) (not b!1242348) (not d!136645) (not b!1242359) (not d!136643) (not b!1242374) (not d!136641) (not d!136653) tp_is_empty!31287 (not b!1242358) (not d!136649) (not bm!61317) (not b!1242339) (not d!136647) (not b!1242369) (not bm!61320))
(check-sat)
(get-model)

(declare-fun d!136655 () Bool)

(assert (=> d!136655 (= ($colon$colon!628 e!704212 (ite c!121617 (h!28576 l!644) (tuple2!20285 key1!25 v1!20))) (Cons!27367 (ite c!121617 (h!28576 l!644) (tuple2!20285 key1!25 v1!20)) e!704212))))

(assert (=> bm!61317 d!136655))

(declare-fun d!136657 () Bool)

(assert (=> d!136657 (= ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) key2!15) (h!28576 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) (Cons!27367 (h!28576 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) key2!15)))))

(assert (=> b!1242240 d!136657))

(declare-fun b!1242390 () Bool)

(declare-fun e!704237 () Bool)

(declare-fun lt!562236 () List!27371)

(assert (=> b!1242390 (= e!704237 (not (containsKey!614 lt!562236 key2!15)))))

(declare-fun e!704236 () List!27371)

(declare-fun b!1242391 () Bool)

(assert (=> b!1242391 (= e!704236 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) key2!15) (h!28576 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)))))))

(declare-fun e!704238 () List!27371)

(declare-fun b!1242392 () Bool)

(assert (=> b!1242392 (= e!704238 (t!40834 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))))))

(declare-fun b!1242393 () Bool)

(assert (=> b!1242393 (= e!704236 Nil!27368)))

(declare-fun d!136659 () Bool)

(assert (=> d!136659 e!704237))

(declare-fun res!828521 () Bool)

(assert (=> d!136659 (=> (not res!828521) (not e!704237))))

(assert (=> d!136659 (= res!828521 (isStrictlySorted!764 lt!562236))))

(assert (=> d!136659 (= lt!562236 e!704238)))

(declare-fun c!121634 () Bool)

(assert (=> d!136659 (= c!121634 (and ((_ is Cons!27367) (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) (= (_1!10153 (h!28576 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)))) key2!15)))))

(assert (=> d!136659 (isStrictlySorted!764 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)))))

(assert (=> d!136659 (= (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) key2!15) lt!562236)))

(declare-fun b!1242394 () Bool)

(assert (=> b!1242394 (= e!704238 e!704236)))

(declare-fun c!121635 () Bool)

(assert (=> b!1242394 (= c!121635 (and ((_ is Cons!27367) (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) (not (= (_1!10153 (h!28576 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)))) key2!15))))))

(assert (= (and d!136659 c!121634) b!1242392))

(assert (= (and d!136659 (not c!121634)) b!1242394))

(assert (= (and b!1242394 c!121635) b!1242391))

(assert (= (and b!1242394 (not c!121635)) b!1242393))

(assert (= (and d!136659 res!828521) b!1242390))

(declare-fun m!1145059 () Bool)

(assert (=> b!1242390 m!1145059))

(declare-fun m!1145061 () Bool)

(assert (=> b!1242391 m!1145061))

(assert (=> b!1242391 m!1145061))

(declare-fun m!1145063 () Bool)

(assert (=> b!1242391 m!1145063))

(declare-fun m!1145065 () Bool)

(assert (=> d!136659 m!1145065))

(declare-fun m!1145067 () Bool)

(assert (=> d!136659 m!1145067))

(assert (=> b!1242240 d!136659))

(declare-fun lt!562239 () Bool)

(declare-fun d!136661 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!602 (List!27371) (InoxSet tuple2!20284))

(assert (=> d!136661 (= lt!562239 (select (content!602 lt!562228) (tuple2!20285 key1!25 v1!20)))))

(declare-fun e!704244 () Bool)

(assert (=> d!136661 (= lt!562239 e!704244)))

(declare-fun res!828526 () Bool)

(assert (=> d!136661 (=> (not res!828526) (not e!704244))))

(assert (=> d!136661 (= res!828526 ((_ is Cons!27367) lt!562228))))

(assert (=> d!136661 (= (contains!7395 lt!562228 (tuple2!20285 key1!25 v1!20)) lt!562239)))

(declare-fun b!1242399 () Bool)

(declare-fun e!704243 () Bool)

(assert (=> b!1242399 (= e!704244 e!704243)))

(declare-fun res!828527 () Bool)

(assert (=> b!1242399 (=> res!828527 e!704243)))

(assert (=> b!1242399 (= res!828527 (= (h!28576 lt!562228) (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242400 () Bool)

(assert (=> b!1242400 (= e!704243 (contains!7395 (t!40834 lt!562228) (tuple2!20285 key1!25 v1!20)))))

(assert (= (and d!136661 res!828526) b!1242399))

(assert (= (and b!1242399 (not res!828527)) b!1242400))

(declare-fun m!1145069 () Bool)

(assert (=> d!136661 m!1145069))

(declare-fun m!1145071 () Bool)

(assert (=> d!136661 m!1145071))

(declare-fun m!1145073 () Bool)

(assert (=> b!1242400 m!1145073))

(assert (=> b!1242354 d!136661))

(declare-fun d!136663 () Bool)

(assert (=> d!136663 (= ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (t!40834 l!644)) key2!15) (h!28576 (t!40834 l!644))) (Cons!27367 (h!28576 (t!40834 l!644)) (removeStrictlySorted!131 (t!40834 (t!40834 l!644)) key2!15)))))

(assert (=> b!1242381 d!136663))

(declare-fun b!1242401 () Bool)

(declare-fun e!704246 () Bool)

(declare-fun lt!562240 () List!27371)

(assert (=> b!1242401 (= e!704246 (not (containsKey!614 lt!562240 key2!15)))))

(declare-fun b!1242402 () Bool)

(declare-fun e!704245 () List!27371)

(assert (=> b!1242402 (= e!704245 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (t!40834 (t!40834 l!644))) key2!15) (h!28576 (t!40834 (t!40834 l!644)))))))

(declare-fun b!1242403 () Bool)

(declare-fun e!704247 () List!27371)

(assert (=> b!1242403 (= e!704247 (t!40834 (t!40834 (t!40834 l!644))))))

(declare-fun b!1242404 () Bool)

(assert (=> b!1242404 (= e!704245 Nil!27368)))

(declare-fun d!136665 () Bool)

(assert (=> d!136665 e!704246))

(declare-fun res!828528 () Bool)

(assert (=> d!136665 (=> (not res!828528) (not e!704246))))

(assert (=> d!136665 (= res!828528 (isStrictlySorted!764 lt!562240))))

(assert (=> d!136665 (= lt!562240 e!704247)))

(declare-fun c!121636 () Bool)

(assert (=> d!136665 (= c!121636 (and ((_ is Cons!27367) (t!40834 (t!40834 l!644))) (= (_1!10153 (h!28576 (t!40834 (t!40834 l!644)))) key2!15)))))

(assert (=> d!136665 (isStrictlySorted!764 (t!40834 (t!40834 l!644)))))

(assert (=> d!136665 (= (removeStrictlySorted!131 (t!40834 (t!40834 l!644)) key2!15) lt!562240)))

(declare-fun b!1242405 () Bool)

(assert (=> b!1242405 (= e!704247 e!704245)))

(declare-fun c!121637 () Bool)

(assert (=> b!1242405 (= c!121637 (and ((_ is Cons!27367) (t!40834 (t!40834 l!644))) (not (= (_1!10153 (h!28576 (t!40834 (t!40834 l!644)))) key2!15))))))

(assert (= (and d!136665 c!121636) b!1242403))

(assert (= (and d!136665 (not c!121636)) b!1242405))

(assert (= (and b!1242405 c!121637) b!1242402))

(assert (= (and b!1242405 (not c!121637)) b!1242404))

(assert (= (and d!136665 res!828528) b!1242401))

(declare-fun m!1145075 () Bool)

(assert (=> b!1242401 m!1145075))

(declare-fun m!1145077 () Bool)

(assert (=> b!1242402 m!1145077))

(assert (=> b!1242402 m!1145077))

(declare-fun m!1145079 () Bool)

(assert (=> b!1242402 m!1145079))

(declare-fun m!1145081 () Bool)

(assert (=> d!136665 m!1145081))

(assert (=> d!136665 m!1144839))

(assert (=> b!1242381 d!136665))

(declare-fun d!136667 () Bool)

(declare-fun res!828529 () Bool)

(declare-fun e!704248 () Bool)

(assert (=> d!136667 (=> res!828529 e!704248)))

(assert (=> d!136667 (= res!828529 (or ((_ is Nil!27368) lt!562228) ((_ is Nil!27368) (t!40834 lt!562228))))))

(assert (=> d!136667 (= (isStrictlySorted!764 lt!562228) e!704248)))

(declare-fun b!1242406 () Bool)

(declare-fun e!704249 () Bool)

(assert (=> b!1242406 (= e!704248 e!704249)))

(declare-fun res!828530 () Bool)

(assert (=> b!1242406 (=> (not res!828530) (not e!704249))))

(assert (=> b!1242406 (= res!828530 (bvslt (_1!10153 (h!28576 lt!562228)) (_1!10153 (h!28576 (t!40834 lt!562228)))))))

(declare-fun b!1242407 () Bool)

(assert (=> b!1242407 (= e!704249 (isStrictlySorted!764 (t!40834 lt!562228)))))

(assert (= (and d!136667 (not res!828529)) b!1242406))

(assert (= (and b!1242406 res!828530) b!1242407))

(declare-fun m!1145083 () Bool)

(assert (=> b!1242407 m!1145083))

(assert (=> d!136643 d!136667))

(declare-fun d!136669 () Bool)

(declare-fun res!828531 () Bool)

(declare-fun e!704250 () Bool)

(assert (=> d!136669 (=> res!828531 e!704250)))

(assert (=> d!136669 (= res!828531 (or ((_ is Nil!27368) (removeStrictlySorted!131 l!644 key2!15)) ((_ is Nil!27368) (t!40834 (removeStrictlySorted!131 l!644 key2!15)))))))

(assert (=> d!136669 (= (isStrictlySorted!764 (removeStrictlySorted!131 l!644 key2!15)) e!704250)))

(declare-fun b!1242408 () Bool)

(declare-fun e!704251 () Bool)

(assert (=> b!1242408 (= e!704250 e!704251)))

(declare-fun res!828532 () Bool)

(assert (=> b!1242408 (=> (not res!828532) (not e!704251))))

(assert (=> b!1242408 (= res!828532 (bvslt (_1!10153 (h!28576 (removeStrictlySorted!131 l!644 key2!15))) (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 l!644 key2!15))))))))

(declare-fun b!1242409 () Bool)

(assert (=> b!1242409 (= e!704251 (isStrictlySorted!764 (t!40834 (removeStrictlySorted!131 l!644 key2!15))))))

(assert (= (and d!136669 (not res!828531)) b!1242408))

(assert (= (and b!1242408 res!828532) b!1242409))

(declare-fun m!1145085 () Bool)

(assert (=> b!1242409 m!1145085))

(assert (=> d!136643 d!136669))

(declare-fun d!136671 () Bool)

(declare-fun res!828537 () Bool)

(declare-fun e!704256 () Bool)

(assert (=> d!136671 (=> res!828537 e!704256)))

(assert (=> d!136671 (= res!828537 (and ((_ is Cons!27367) lt!562235) (= (_1!10153 (h!28576 lt!562235)) key2!15)))))

(assert (=> d!136671 (= (containsKey!614 lt!562235 key2!15) e!704256)))

(declare-fun b!1242414 () Bool)

(declare-fun e!704257 () Bool)

(assert (=> b!1242414 (= e!704256 e!704257)))

(declare-fun res!828538 () Bool)

(assert (=> b!1242414 (=> (not res!828538) (not e!704257))))

(assert (=> b!1242414 (= res!828538 (and (or (not ((_ is Cons!27367) lt!562235)) (bvsle (_1!10153 (h!28576 lt!562235)) key2!15)) ((_ is Cons!27367) lt!562235) (bvslt (_1!10153 (h!28576 lt!562235)) key2!15)))))

(declare-fun b!1242415 () Bool)

(assert (=> b!1242415 (= e!704257 (containsKey!614 (t!40834 lt!562235) key2!15))))

(assert (= (and d!136671 (not res!828537)) b!1242414))

(assert (= (and b!1242414 res!828538) b!1242415))

(declare-fun m!1145087 () Bool)

(assert (=> b!1242415 m!1145087))

(assert (=> b!1242380 d!136671))

(declare-fun d!136673 () Bool)

(declare-fun res!828539 () Bool)

(declare-fun e!704258 () Bool)

(assert (=> d!136673 (=> res!828539 e!704258)))

(assert (=> d!136673 (= res!828539 (or ((_ is Nil!27368) lt!562229) ((_ is Nil!27368) (t!40834 lt!562229))))))

(assert (=> d!136673 (= (isStrictlySorted!764 lt!562229) e!704258)))

(declare-fun b!1242416 () Bool)

(declare-fun e!704259 () Bool)

(assert (=> b!1242416 (= e!704258 e!704259)))

(declare-fun res!828540 () Bool)

(assert (=> b!1242416 (=> (not res!828540) (not e!704259))))

(assert (=> b!1242416 (= res!828540 (bvslt (_1!10153 (h!28576 lt!562229)) (_1!10153 (h!28576 (t!40834 lt!562229)))))))

(declare-fun b!1242417 () Bool)

(assert (=> b!1242417 (= e!704259 (isStrictlySorted!764 (t!40834 lt!562229)))))

(assert (= (and d!136673 (not res!828539)) b!1242416))

(assert (= (and b!1242416 res!828540) b!1242417))

(declare-fun m!1145089 () Bool)

(assert (=> b!1242417 m!1145089))

(assert (=> d!136645 d!136673))

(assert (=> d!136645 d!136597))

(declare-fun d!136675 () Bool)

(assert (=> d!136675 (= ($colon$colon!628 e!704217 (ite c!121621 (h!28576 (removeStrictlySorted!131 l!644 key2!15)) (tuple2!20285 key1!25 v1!20))) (Cons!27367 (ite c!121621 (h!28576 (removeStrictlySorted!131 l!644 key2!15)) (tuple2!20285 key1!25 v1!20)) e!704217))))

(assert (=> bm!61320 d!136675))

(declare-fun d!136677 () Bool)

(declare-fun res!828541 () Bool)

(declare-fun e!704260 () Bool)

(assert (=> d!136677 (=> res!828541 e!704260)))

(assert (=> d!136677 (= res!828541 (and ((_ is Cons!27367) lt!562233) (= (_1!10153 (h!28576 lt!562233)) key1!25)))))

(assert (=> d!136677 (= (containsKey!614 lt!562233 key1!25) e!704260)))

(declare-fun b!1242418 () Bool)

(declare-fun e!704261 () Bool)

(assert (=> b!1242418 (= e!704260 e!704261)))

(declare-fun res!828542 () Bool)

(assert (=> b!1242418 (=> (not res!828542) (not e!704261))))

(assert (=> b!1242418 (= res!828542 (and (or (not ((_ is Cons!27367) lt!562233)) (bvsle (_1!10153 (h!28576 lt!562233)) key1!25)) ((_ is Cons!27367) lt!562233) (bvslt (_1!10153 (h!28576 lt!562233)) key1!25)))))

(declare-fun b!1242419 () Bool)

(assert (=> b!1242419 (= e!704261 (containsKey!614 (t!40834 lt!562233) key1!25))))

(assert (= (and d!136677 (not res!828541)) b!1242418))

(assert (= (and b!1242418 res!828542) b!1242419))

(declare-fun m!1145091 () Bool)

(assert (=> b!1242419 m!1145091))

(assert (=> b!1242374 d!136677))

(declare-fun d!136679 () Bool)

(assert (=> d!136679 (= (insertStrictlySorted!438 (removeStrictlySorted!131 (t!40834 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20) key2!15))))

(assert (=> d!136679 true))

(declare-fun _$3!70 () Unit!41263)

(assert (=> d!136679 (= (choose!1841 (t!40834 l!644) key1!25 v1!20 key2!15) _$3!70)))

(declare-fun bs!34979 () Bool)

(assert (= bs!34979 d!136679))

(assert (=> bs!34979 m!1144789))

(assert (=> bs!34979 m!1144789))

(assert (=> bs!34979 m!1144791))

(assert (=> bs!34979 m!1144785))

(assert (=> bs!34979 m!1144785))

(assert (=> bs!34979 m!1144787))

(assert (=> d!136647 d!136679))

(assert (=> d!136647 d!136601))

(assert (=> d!136647 d!136623))

(assert (=> d!136647 d!136649))

(assert (=> d!136647 d!136653))

(declare-fun d!136681 () Bool)

(assert (=> d!136681 (= ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)) key2!15) (h!28576 (insertStrictlySorted!438 l!644 key1!25 v1!20))) (Cons!27367 (h!28576 (insertStrictlySorted!438 l!644 key1!25 v1!20)) (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242376 d!136681))

(declare-fun b!1242420 () Bool)

(declare-fun e!704263 () Bool)

(declare-fun lt!562241 () List!27371)

(assert (=> b!1242420 (= e!704263 (not (containsKey!614 lt!562241 key2!15)))))

(declare-fun b!1242421 () Bool)

(declare-fun e!704262 () List!27371)

(assert (=> b!1242421 (= e!704262 ($colon$colon!628 (removeStrictlySorted!131 (t!40834 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20))) key2!15) (h!28576 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)))))))

(declare-fun b!1242422 () Bool)

(declare-fun e!704264 () List!27371)

(assert (=> b!1242422 (= e!704264 (t!40834 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20))))))

(declare-fun b!1242423 () Bool)

(assert (=> b!1242423 (= e!704262 Nil!27368)))

(declare-fun d!136683 () Bool)

(assert (=> d!136683 e!704263))

(declare-fun res!828543 () Bool)

(assert (=> d!136683 (=> (not res!828543) (not e!704263))))

(assert (=> d!136683 (= res!828543 (isStrictlySorted!764 lt!562241))))

(assert (=> d!136683 (= lt!562241 e!704264)))

(declare-fun c!121638 () Bool)

(assert (=> d!136683 (= c!121638 (and ((_ is Cons!27367) (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20))) (= (_1!10153 (h!28576 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136683 (isStrictlySorted!764 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)))))

(assert (=> d!136683 (= (removeStrictlySorted!131 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)) key2!15) lt!562241)))

(declare-fun b!1242424 () Bool)

(assert (=> b!1242424 (= e!704264 e!704262)))

(declare-fun c!121639 () Bool)

(assert (=> b!1242424 (= c!121639 (and ((_ is Cons!27367) (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20))) (not (= (_1!10153 (h!28576 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)))) key2!15))))))

(assert (= (and d!136683 c!121638) b!1242422))

(assert (= (and d!136683 (not c!121638)) b!1242424))

(assert (= (and b!1242424 c!121639) b!1242421))

(assert (= (and b!1242424 (not c!121639)) b!1242423))

(assert (= (and d!136683 res!828543) b!1242420))

(declare-fun m!1145093 () Bool)

(assert (=> b!1242420 m!1145093))

(declare-fun m!1145095 () Bool)

(assert (=> b!1242421 m!1145095))

(assert (=> b!1242421 m!1145095))

(declare-fun m!1145097 () Bool)

(assert (=> b!1242421 m!1145097))

(declare-fun m!1145099 () Bool)

(assert (=> d!136683 m!1145099))

(declare-fun m!1145101 () Bool)

(assert (=> d!136683 m!1145101))

(assert (=> b!1242376 d!136683))

(declare-fun d!136685 () Bool)

(declare-fun res!828544 () Bool)

(declare-fun e!704265 () Bool)

(assert (=> d!136685 (=> res!828544 e!704265)))

(assert (=> d!136685 (= res!828544 (and ((_ is Cons!27367) lt!562234) (= (_1!10153 (h!28576 lt!562234)) key2!15)))))

(assert (=> d!136685 (= (containsKey!614 lt!562234 key2!15) e!704265)))

(declare-fun b!1242425 () Bool)

(declare-fun e!704266 () Bool)

(assert (=> b!1242425 (= e!704265 e!704266)))

(declare-fun res!828545 () Bool)

(assert (=> b!1242425 (=> (not res!828545) (not e!704266))))

(assert (=> b!1242425 (= res!828545 (and (or (not ((_ is Cons!27367) lt!562234)) (bvsle (_1!10153 (h!28576 lt!562234)) key2!15)) ((_ is Cons!27367) lt!562234) (bvslt (_1!10153 (h!28576 lt!562234)) key2!15)))))

(declare-fun b!1242426 () Bool)

(assert (=> b!1242426 (= e!704266 (containsKey!614 (t!40834 lt!562234) key2!15))))

(assert (= (and d!136685 (not res!828544)) b!1242425))

(assert (= (and b!1242425 res!828545) b!1242426))

(declare-fun m!1145103 () Bool)

(assert (=> b!1242426 m!1145103))

(assert (=> b!1242375 d!136685))

(assert (=> b!1242116 d!136599))

(declare-fun b!1242427 () Bool)

(declare-fun e!704268 () List!27371)

(declare-fun call!61330 () List!27371)

(assert (=> b!1242427 (= e!704268 call!61330)))

(declare-fun d!136687 () Bool)

(declare-fun e!704271 () Bool)

(assert (=> d!136687 e!704271))

(declare-fun res!828546 () Bool)

(assert (=> d!136687 (=> (not res!828546) (not e!704271))))

(declare-fun lt!562242 () List!27371)

(assert (=> d!136687 (= res!828546 (isStrictlySorted!764 lt!562242))))

(declare-fun e!704269 () List!27371)

(assert (=> d!136687 (= lt!562242 e!704269)))

(declare-fun c!121641 () Bool)

(assert (=> d!136687 (= c!121641 (and ((_ is Cons!27367) (t!40834 (t!40834 l!644))) (bvslt (_1!10153 (h!28576 (t!40834 (t!40834 l!644)))) key1!25)))))

(assert (=> d!136687 (isStrictlySorted!764 (t!40834 (t!40834 l!644)))))

(assert (=> d!136687 (= (insertStrictlySorted!438 (t!40834 (t!40834 l!644)) key1!25 v1!20) lt!562242)))

(declare-fun bm!61325 () Bool)

(declare-fun call!61328 () List!27371)

(assert (=> bm!61325 (= call!61330 call!61328)))

(declare-fun b!1242428 () Bool)

(declare-fun c!121640 () Bool)

(assert (=> b!1242428 (= c!121640 (and ((_ is Cons!27367) (t!40834 (t!40834 l!644))) (bvsgt (_1!10153 (h!28576 (t!40834 (t!40834 l!644)))) key1!25)))))

(declare-fun e!704267 () List!27371)

(assert (=> b!1242428 (= e!704267 e!704268)))

(declare-fun b!1242429 () Bool)

(assert (=> b!1242429 (= e!704269 e!704267)))

(declare-fun c!121643 () Bool)

(assert (=> b!1242429 (= c!121643 (and ((_ is Cons!27367) (t!40834 (t!40834 l!644))) (= (_1!10153 (h!28576 (t!40834 (t!40834 l!644)))) key1!25)))))

(declare-fun call!61329 () List!27371)

(declare-fun e!704270 () List!27371)

(declare-fun bm!61326 () Bool)

(assert (=> bm!61326 (= call!61329 ($colon$colon!628 e!704270 (ite c!121641 (h!28576 (t!40834 (t!40834 l!644))) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121642 () Bool)

(assert (=> bm!61326 (= c!121642 c!121641)))

(declare-fun b!1242430 () Bool)

(assert (=> b!1242430 (= e!704269 call!61329)))

(declare-fun b!1242431 () Bool)

(assert (=> b!1242431 (= e!704271 (contains!7395 lt!562242 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242432 () Bool)

(assert (=> b!1242432 (= e!704268 call!61330)))

(declare-fun b!1242433 () Bool)

(assert (=> b!1242433 (= e!704267 call!61328)))

(declare-fun b!1242434 () Bool)

(assert (=> b!1242434 (= e!704270 (ite c!121643 (t!40834 (t!40834 (t!40834 l!644))) (ite c!121640 (Cons!27367 (h!28576 (t!40834 (t!40834 l!644))) (t!40834 (t!40834 (t!40834 l!644)))) Nil!27368)))))

(declare-fun b!1242435 () Bool)

(assert (=> b!1242435 (= e!704270 (insertStrictlySorted!438 (t!40834 (t!40834 (t!40834 l!644))) key1!25 v1!20))))

(declare-fun bm!61327 () Bool)

(assert (=> bm!61327 (= call!61328 call!61329)))

(declare-fun b!1242436 () Bool)

(declare-fun res!828547 () Bool)

(assert (=> b!1242436 (=> (not res!828547) (not e!704271))))

(assert (=> b!1242436 (= res!828547 (containsKey!614 lt!562242 key1!25))))

(assert (= (and d!136687 c!121641) b!1242430))

(assert (= (and d!136687 (not c!121641)) b!1242429))

(assert (= (and b!1242429 c!121643) b!1242433))

(assert (= (and b!1242429 (not c!121643)) b!1242428))

(assert (= (and b!1242428 c!121640) b!1242427))

(assert (= (and b!1242428 (not c!121640)) b!1242432))

(assert (= (or b!1242427 b!1242432) bm!61325))

(assert (= (or b!1242433 bm!61325) bm!61327))

(assert (= (or b!1242430 bm!61327) bm!61326))

(assert (= (and bm!61326 c!121642) b!1242435))

(assert (= (and bm!61326 (not c!121642)) b!1242434))

(assert (= (and d!136687 res!828546) b!1242436))

(assert (= (and b!1242436 res!828547) b!1242431))

(declare-fun m!1145105 () Bool)

(assert (=> b!1242436 m!1145105))

(declare-fun m!1145107 () Bool)

(assert (=> d!136687 m!1145107))

(assert (=> d!136687 m!1144839))

(declare-fun m!1145109 () Bool)

(assert (=> b!1242431 m!1145109))

(declare-fun m!1145111 () Bool)

(assert (=> bm!61326 m!1145111))

(declare-fun m!1145113 () Bool)

(assert (=> b!1242435 m!1145113))

(assert (=> b!1242373 d!136687))

(declare-fun lt!562243 () Bool)

(declare-fun d!136689 () Bool)

(assert (=> d!136689 (= lt!562243 (select (content!602 lt!562233) (tuple2!20285 key1!25 v1!20)))))

(declare-fun e!704273 () Bool)

(assert (=> d!136689 (= lt!562243 e!704273)))

(declare-fun res!828548 () Bool)

(assert (=> d!136689 (=> (not res!828548) (not e!704273))))

(assert (=> d!136689 (= res!828548 ((_ is Cons!27367) lt!562233))))

(assert (=> d!136689 (= (contains!7395 lt!562233 (tuple2!20285 key1!25 v1!20)) lt!562243)))

(declare-fun b!1242437 () Bool)

(declare-fun e!704272 () Bool)

(assert (=> b!1242437 (= e!704273 e!704272)))

(declare-fun res!828549 () Bool)

(assert (=> b!1242437 (=> res!828549 e!704272)))

(assert (=> b!1242437 (= res!828549 (= (h!28576 lt!562233) (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242438 () Bool)

(assert (=> b!1242438 (= e!704272 (contains!7395 (t!40834 lt!562233) (tuple2!20285 key1!25 v1!20)))))

(assert (= (and d!136689 res!828548) b!1242437))

(assert (= (and b!1242437 (not res!828549)) b!1242438))

(declare-fun m!1145115 () Bool)

(assert (=> d!136689 m!1145115))

(declare-fun m!1145117 () Bool)

(assert (=> d!136689 m!1145117))

(declare-fun m!1145119 () Bool)

(assert (=> b!1242438 m!1145119))

(assert (=> b!1242369 d!136689))

(declare-fun d!136691 () Bool)

(declare-fun res!828550 () Bool)

(declare-fun e!704274 () Bool)

(assert (=> d!136691 (=> res!828550 e!704274)))

(assert (=> d!136691 (= res!828550 (or ((_ is Nil!27368) lt!562233) ((_ is Nil!27368) (t!40834 lt!562233))))))

(assert (=> d!136691 (= (isStrictlySorted!764 lt!562233) e!704274)))

(declare-fun b!1242439 () Bool)

(declare-fun e!704275 () Bool)

(assert (=> b!1242439 (= e!704274 e!704275)))

(declare-fun res!828551 () Bool)

(assert (=> b!1242439 (=> (not res!828551) (not e!704275))))

(assert (=> b!1242439 (= res!828551 (bvslt (_1!10153 (h!28576 lt!562233)) (_1!10153 (h!28576 (t!40834 lt!562233)))))))

(declare-fun b!1242440 () Bool)

(assert (=> b!1242440 (= e!704275 (isStrictlySorted!764 (t!40834 lt!562233)))))

(assert (= (and d!136691 (not res!828550)) b!1242439))

(assert (= (and b!1242439 res!828551) b!1242440))

(declare-fun m!1145121 () Bool)

(assert (=> b!1242440 m!1145121))

(assert (=> d!136649 d!136691))

(assert (=> d!136649 d!136599))

(declare-fun d!136693 () Bool)

(declare-fun res!828552 () Bool)

(declare-fun e!704276 () Bool)

(assert (=> d!136693 (=> res!828552 e!704276)))

(assert (=> d!136693 (= res!828552 (or ((_ is Nil!27368) lt!562235) ((_ is Nil!27368) (t!40834 lt!562235))))))

(assert (=> d!136693 (= (isStrictlySorted!764 lt!562235) e!704276)))

(declare-fun b!1242441 () Bool)

(declare-fun e!704277 () Bool)

(assert (=> b!1242441 (= e!704276 e!704277)))

(declare-fun res!828553 () Bool)

(assert (=> b!1242441 (=> (not res!828553) (not e!704277))))

(assert (=> b!1242441 (= res!828553 (bvslt (_1!10153 (h!28576 lt!562235)) (_1!10153 (h!28576 (t!40834 lt!562235)))))))

(declare-fun b!1242442 () Bool)

(assert (=> b!1242442 (= e!704277 (isStrictlySorted!764 (t!40834 lt!562235)))))

(assert (= (and d!136693 (not res!828552)) b!1242441))

(assert (= (and b!1242441 res!828553) b!1242442))

(declare-fun m!1145123 () Bool)

(assert (=> b!1242442 m!1145123))

(assert (=> d!136653 d!136693))

(assert (=> d!136653 d!136599))

(declare-fun d!136695 () Bool)

(declare-fun res!828554 () Bool)

(declare-fun e!704278 () Bool)

(assert (=> d!136695 (=> res!828554 e!704278)))

(assert (=> d!136695 (= res!828554 (and ((_ is Cons!27367) lt!562226) (= (_1!10153 (h!28576 lt!562226)) key1!25)))))

(assert (=> d!136695 (= (containsKey!614 lt!562226 key1!25) e!704278)))

(declare-fun b!1242443 () Bool)

(declare-fun e!704279 () Bool)

(assert (=> b!1242443 (= e!704278 e!704279)))

(declare-fun res!828555 () Bool)

(assert (=> b!1242443 (=> (not res!828555) (not e!704279))))

(assert (=> b!1242443 (= res!828555 (and (or (not ((_ is Cons!27367) lt!562226)) (bvsle (_1!10153 (h!28576 lt!562226)) key1!25)) ((_ is Cons!27367) lt!562226) (bvslt (_1!10153 (h!28576 lt!562226)) key1!25)))))

(declare-fun b!1242444 () Bool)

(assert (=> b!1242444 (= e!704279 (containsKey!614 (t!40834 lt!562226) key1!25))))

(assert (= (and d!136695 (not res!828554)) b!1242443))

(assert (= (and b!1242443 res!828555) b!1242444))

(declare-fun m!1145125 () Bool)

(assert (=> b!1242444 m!1145125))

(assert (=> b!1242339 d!136695))

(declare-fun d!136697 () Bool)

(assert (=> d!136697 (= ($colon$colon!628 e!704225 (ite c!121627 (h!28576 (t!40834 l!644)) (tuple2!20285 key1!25 v1!20))) (Cons!27367 (ite c!121627 (h!28576 (t!40834 l!644)) (tuple2!20285 key1!25 v1!20)) e!704225))))

(assert (=> bm!61323 d!136697))

(declare-fun d!136699 () Bool)

(declare-fun res!828556 () Bool)

(declare-fun e!704280 () Bool)

(assert (=> d!136699 (=> res!828556 e!704280)))

(assert (=> d!136699 (= res!828556 (and ((_ is Cons!27367) lt!562227) (= (_1!10153 (h!28576 lt!562227)) key1!25)))))

(assert (=> d!136699 (= (containsKey!614 lt!562227 key1!25) e!704280)))

(declare-fun b!1242445 () Bool)

(declare-fun e!704281 () Bool)

(assert (=> b!1242445 (= e!704280 e!704281)))

(declare-fun res!828557 () Bool)

(assert (=> b!1242445 (=> (not res!828557) (not e!704281))))

(assert (=> b!1242445 (= res!828557 (and (or (not ((_ is Cons!27367) lt!562227)) (bvsle (_1!10153 (h!28576 lt!562227)) key1!25)) ((_ is Cons!27367) lt!562227) (bvslt (_1!10153 (h!28576 lt!562227)) key1!25)))))

(declare-fun b!1242446 () Bool)

(assert (=> b!1242446 (= e!704281 (containsKey!614 (t!40834 lt!562227) key1!25))))

(assert (= (and d!136699 (not res!828556)) b!1242445))

(assert (= (and b!1242445 res!828557) b!1242446))

(declare-fun m!1145127 () Bool)

(assert (=> b!1242446 m!1145127))

(assert (=> b!1242349 d!136699))

(declare-fun d!136701 () Bool)

(declare-fun res!828558 () Bool)

(declare-fun e!704282 () Bool)

(assert (=> d!136701 (=> res!828558 e!704282)))

(assert (=> d!136701 (= res!828558 (or ((_ is Nil!27368) lt!562234) ((_ is Nil!27368) (t!40834 lt!562234))))))

(assert (=> d!136701 (= (isStrictlySorted!764 lt!562234) e!704282)))

(declare-fun b!1242447 () Bool)

(declare-fun e!704283 () Bool)

(assert (=> b!1242447 (= e!704282 e!704283)))

(declare-fun res!828559 () Bool)

(assert (=> b!1242447 (=> (not res!828559) (not e!704283))))

(assert (=> b!1242447 (= res!828559 (bvslt (_1!10153 (h!28576 lt!562234)) (_1!10153 (h!28576 (t!40834 lt!562234)))))))

(declare-fun b!1242448 () Bool)

(assert (=> b!1242448 (= e!704283 (isStrictlySorted!764 (t!40834 lt!562234)))))

(assert (= (and d!136701 (not res!828558)) b!1242447))

(assert (= (and b!1242447 res!828559) b!1242448))

(declare-fun m!1145129 () Bool)

(assert (=> b!1242448 m!1145129))

(assert (=> d!136651 d!136701))

(declare-fun d!136703 () Bool)

(declare-fun res!828560 () Bool)

(declare-fun e!704284 () Bool)

(assert (=> d!136703 (=> res!828560 e!704284)))

(assert (=> d!136703 (= res!828560 (or ((_ is Nil!27368) (insertStrictlySorted!438 l!644 key1!25 v1!20)) ((_ is Nil!27368) (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20)))))))

(assert (=> d!136703 (= (isStrictlySorted!764 (insertStrictlySorted!438 l!644 key1!25 v1!20)) e!704284)))

(declare-fun b!1242449 () Bool)

(declare-fun e!704285 () Bool)

(assert (=> b!1242449 (= e!704284 e!704285)))

(declare-fun res!828561 () Bool)

(assert (=> b!1242449 (=> (not res!828561) (not e!704285))))

(assert (=> b!1242449 (= res!828561 (bvslt (_1!10153 (h!28576 (insertStrictlySorted!438 l!644 key1!25 v1!20))) (_1!10153 (h!28576 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20))))))))

(declare-fun b!1242450 () Bool)

(assert (=> b!1242450 (= e!704285 (isStrictlySorted!764 (t!40834 (insertStrictlySorted!438 l!644 key1!25 v1!20))))))

(assert (= (and d!136703 (not res!828560)) b!1242449))

(assert (= (and b!1242449 res!828561) b!1242450))

(assert (=> b!1242450 m!1145101))

(assert (=> d!136651 d!136703))

(declare-fun d!136705 () Bool)

(declare-fun res!828562 () Bool)

(declare-fun e!704286 () Bool)

(assert (=> d!136705 (=> res!828562 e!704286)))

(assert (=> d!136705 (= res!828562 (or ((_ is Nil!27368) (t!40834 (t!40834 l!644))) ((_ is Nil!27368) (t!40834 (t!40834 (t!40834 l!644))))))))

(assert (=> d!136705 (= (isStrictlySorted!764 (t!40834 (t!40834 l!644))) e!704286)))

(declare-fun b!1242451 () Bool)

(declare-fun e!704287 () Bool)

(assert (=> b!1242451 (= e!704286 e!704287)))

(declare-fun res!828563 () Bool)

(assert (=> b!1242451 (=> (not res!828563) (not e!704287))))

(assert (=> b!1242451 (= res!828563 (bvslt (_1!10153 (h!28576 (t!40834 (t!40834 l!644)))) (_1!10153 (h!28576 (t!40834 (t!40834 (t!40834 l!644)))))))))

(declare-fun b!1242452 () Bool)

(assert (=> b!1242452 (= e!704287 (isStrictlySorted!764 (t!40834 (t!40834 (t!40834 l!644)))))))

(assert (= (and d!136705 (not res!828562)) b!1242451))

(assert (= (and b!1242451 res!828563) b!1242452))

(declare-fun m!1145131 () Bool)

(assert (=> b!1242452 m!1145131))

(assert (=> b!1242118 d!136705))

(declare-fun b!1242453 () Bool)

(declare-fun e!704289 () List!27371)

(declare-fun call!61333 () List!27371)

(assert (=> b!1242453 (= e!704289 call!61333)))

(declare-fun d!136707 () Bool)

(declare-fun e!704292 () Bool)

(assert (=> d!136707 e!704292))

(declare-fun res!828564 () Bool)

(assert (=> d!136707 (=> (not res!828564) (not e!704292))))

(declare-fun lt!562244 () List!27371)

(assert (=> d!136707 (= res!828564 (isStrictlySorted!764 lt!562244))))

(declare-fun e!704290 () List!27371)

(assert (=> d!136707 (= lt!562244 e!704290)))

(declare-fun c!121645 () Bool)

(assert (=> d!136707 (= c!121645 (and ((_ is Cons!27367) (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (bvslt (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)))) key1!25)))))

(assert (=> d!136707 (isStrictlySorted!764 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)))))

(assert (=> d!136707 (= (insertStrictlySorted!438 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) key1!25 v1!20) lt!562244)))

(declare-fun bm!61328 () Bool)

(declare-fun call!61331 () List!27371)

(assert (=> bm!61328 (= call!61333 call!61331)))

(declare-fun b!1242454 () Bool)

(declare-fun c!121644 () Bool)

(assert (=> b!1242454 (= c!121644 (and ((_ is Cons!27367) (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (bvsgt (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)))) key1!25)))))

(declare-fun e!704288 () List!27371)

(assert (=> b!1242454 (= e!704288 e!704289)))

(declare-fun b!1242455 () Bool)

(assert (=> b!1242455 (= e!704290 e!704288)))

(declare-fun c!121647 () Bool)

(assert (=> b!1242455 (= c!121647 (and ((_ is Cons!27367) (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (= (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)))) key1!25)))))

(declare-fun call!61332 () List!27371)

(declare-fun bm!61329 () Bool)

(declare-fun e!704291 () List!27371)

(assert (=> bm!61329 (= call!61332 ($colon$colon!628 e!704291 (ite c!121645 (h!28576 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121646 () Bool)

(assert (=> bm!61329 (= c!121646 c!121645)))

(declare-fun b!1242456 () Bool)

(assert (=> b!1242456 (= e!704290 call!61332)))

(declare-fun b!1242457 () Bool)

(assert (=> b!1242457 (= e!704292 (contains!7395 lt!562244 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242458 () Bool)

(assert (=> b!1242458 (= e!704289 call!61333)))

(declare-fun b!1242459 () Bool)

(assert (=> b!1242459 (= e!704288 call!61331)))

(declare-fun b!1242460 () Bool)

(assert (=> b!1242460 (= e!704291 (ite c!121647 (t!40834 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (ite c!121644 (Cons!27367 (h!28576 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (t!40834 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)))) Nil!27368)))))

(declare-fun b!1242461 () Bool)

(assert (=> b!1242461 (= e!704291 (insertStrictlySorted!438 (t!40834 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) key1!25 v1!20))))

(declare-fun bm!61330 () Bool)

(assert (=> bm!61330 (= call!61331 call!61332)))

(declare-fun b!1242462 () Bool)

(declare-fun res!828565 () Bool)

(assert (=> b!1242462 (=> (not res!828565) (not e!704292))))

(assert (=> b!1242462 (= res!828565 (containsKey!614 lt!562244 key1!25))))

(assert (= (and d!136707 c!121645) b!1242456))

(assert (= (and d!136707 (not c!121645)) b!1242455))

(assert (= (and b!1242455 c!121647) b!1242459))

(assert (= (and b!1242455 (not c!121647)) b!1242454))

(assert (= (and b!1242454 c!121644) b!1242453))

(assert (= (and b!1242454 (not c!121644)) b!1242458))

(assert (= (or b!1242453 b!1242458) bm!61328))

(assert (= (or b!1242459 bm!61328) bm!61330))

(assert (= (or b!1242456 bm!61330) bm!61329))

(assert (= (and bm!61329 c!121646) b!1242461))

(assert (= (and bm!61329 (not c!121646)) b!1242460))

(assert (= (and d!136707 res!828564) b!1242462))

(assert (= (and b!1242462 res!828565) b!1242457))

(declare-fun m!1145133 () Bool)

(assert (=> b!1242462 m!1145133))

(declare-fun m!1145135 () Bool)

(assert (=> d!136707 m!1145135))

(declare-fun m!1145137 () Bool)

(assert (=> d!136707 m!1145137))

(declare-fun m!1145139 () Bool)

(assert (=> b!1242457 m!1145139))

(declare-fun m!1145141 () Bool)

(assert (=> bm!61329 m!1145141))

(declare-fun m!1145143 () Bool)

(assert (=> b!1242461 m!1145143))

(assert (=> b!1242338 d!136707))

(declare-fun d!136709 () Bool)

(declare-fun res!828566 () Bool)

(declare-fun e!704293 () Bool)

(assert (=> d!136709 (=> res!828566 e!704293)))

(assert (=> d!136709 (= res!828566 (or ((_ is Nil!27368) lt!562226) ((_ is Nil!27368) (t!40834 lt!562226))))))

(assert (=> d!136709 (= (isStrictlySorted!764 lt!562226) e!704293)))

(declare-fun b!1242463 () Bool)

(declare-fun e!704294 () Bool)

(assert (=> b!1242463 (= e!704293 e!704294)))

(declare-fun res!828567 () Bool)

(assert (=> b!1242463 (=> (not res!828567) (not e!704294))))

(assert (=> b!1242463 (= res!828567 (bvslt (_1!10153 (h!28576 lt!562226)) (_1!10153 (h!28576 (t!40834 lt!562226)))))))

(declare-fun b!1242464 () Bool)

(assert (=> b!1242464 (= e!704294 (isStrictlySorted!764 (t!40834 lt!562226)))))

(assert (= (and d!136709 (not res!828566)) b!1242463))

(assert (= (and b!1242463 res!828567) b!1242464))

(declare-fun m!1145145 () Bool)

(assert (=> b!1242464 m!1145145))

(assert (=> d!136623 d!136709))

(declare-fun d!136711 () Bool)

(declare-fun res!828568 () Bool)

(declare-fun e!704295 () Bool)

(assert (=> d!136711 (=> res!828568 e!704295)))

(assert (=> d!136711 (= res!828568 (or ((_ is Nil!27368) (removeStrictlySorted!131 (t!40834 l!644) key2!15)) ((_ is Nil!27368) (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15)))))))

(assert (=> d!136711 (= (isStrictlySorted!764 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) e!704295)))

(declare-fun b!1242465 () Bool)

(declare-fun e!704296 () Bool)

(assert (=> b!1242465 (= e!704295 e!704296)))

(declare-fun res!828569 () Bool)

(assert (=> b!1242465 (=> (not res!828569) (not e!704296))))

(assert (=> b!1242465 (= res!828569 (bvslt (_1!10153 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15))) (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))))))))

(declare-fun b!1242466 () Bool)

(assert (=> b!1242466 (= e!704296 (isStrictlySorted!764 (t!40834 (removeStrictlySorted!131 (t!40834 l!644) key2!15))))))

(assert (= (and d!136711 (not res!828568)) b!1242465))

(assert (= (and b!1242465 res!828569) b!1242466))

(assert (=> b!1242466 m!1145137))

(assert (=> d!136623 d!136711))

(assert (=> b!1242348 d!136649))

(declare-fun d!136713 () Bool)

(assert (=> d!136713 (= ($colon$colon!628 (removeStrictlySorted!131 (t!40834 l!644) key2!15) (h!28576 l!644)) (Cons!27367 (h!28576 l!644) (removeStrictlySorted!131 (t!40834 l!644) key2!15)))))

(assert (=> b!1242361 d!136713))

(assert (=> b!1242361 d!136653))

(declare-fun d!136715 () Bool)

(declare-fun res!828570 () Bool)

(declare-fun e!704297 () Bool)

(assert (=> d!136715 (=> res!828570 e!704297)))

(assert (=> d!136715 (= res!828570 (and ((_ is Cons!27367) lt!562229) (= (_1!10153 (h!28576 lt!562229)) key2!15)))))

(assert (=> d!136715 (= (containsKey!614 lt!562229 key2!15) e!704297)))

(declare-fun b!1242467 () Bool)

(declare-fun e!704298 () Bool)

(assert (=> b!1242467 (= e!704297 e!704298)))

(declare-fun res!828571 () Bool)

(assert (=> b!1242467 (=> (not res!828571) (not e!704298))))

(assert (=> b!1242467 (= res!828571 (and (or (not ((_ is Cons!27367) lt!562229)) (bvsle (_1!10153 (h!28576 lt!562229)) key2!15)) ((_ is Cons!27367) lt!562229) (bvslt (_1!10153 (h!28576 lt!562229)) key2!15)))))

(declare-fun b!1242468 () Bool)

(assert (=> b!1242468 (= e!704298 (containsKey!614 (t!40834 lt!562229) key2!15))))

(assert (= (and d!136715 (not res!828570)) b!1242467))

(assert (= (and b!1242467 res!828571) b!1242468))

(declare-fun m!1145147 () Bool)

(assert (=> b!1242468 m!1145147))

(assert (=> b!1242360 d!136715))

(declare-fun d!136717 () Bool)

(declare-fun res!828572 () Bool)

(declare-fun e!704299 () Bool)

(assert (=> d!136717 (=> res!828572 e!704299)))

(assert (=> d!136717 (= res!828572 (and ((_ is Cons!27367) lt!562228) (= (_1!10153 (h!28576 lt!562228)) key1!25)))))

(assert (=> d!136717 (= (containsKey!614 lt!562228 key1!25) e!704299)))

(declare-fun b!1242469 () Bool)

(declare-fun e!704300 () Bool)

(assert (=> b!1242469 (= e!704299 e!704300)))

(declare-fun res!828573 () Bool)

(assert (=> b!1242469 (=> (not res!828573) (not e!704300))))

(assert (=> b!1242469 (= res!828573 (and (or (not ((_ is Cons!27367) lt!562228)) (bvsle (_1!10153 (h!28576 lt!562228)) key1!25)) ((_ is Cons!27367) lt!562228) (bvslt (_1!10153 (h!28576 lt!562228)) key1!25)))))

(declare-fun b!1242470 () Bool)

(assert (=> b!1242470 (= e!704300 (containsKey!614 (t!40834 lt!562228) key1!25))))

(assert (= (and d!136717 (not res!828572)) b!1242469))

(assert (= (and b!1242469 res!828573) b!1242470))

(declare-fun m!1145149 () Bool)

(assert (=> b!1242470 m!1145149))

(assert (=> b!1242359 d!136717))

(declare-fun d!136719 () Bool)

(declare-fun res!828574 () Bool)

(declare-fun e!704301 () Bool)

(assert (=> d!136719 (=> res!828574 e!704301)))

(assert (=> d!136719 (= res!828574 (or ((_ is Nil!27368) lt!562213) ((_ is Nil!27368) (t!40834 lt!562213))))))

(assert (=> d!136719 (= (isStrictlySorted!764 lt!562213) e!704301)))

(declare-fun b!1242471 () Bool)

(declare-fun e!704302 () Bool)

(assert (=> b!1242471 (= e!704301 e!704302)))

(declare-fun res!828575 () Bool)

(assert (=> b!1242471 (=> (not res!828575) (not e!704302))))

(assert (=> b!1242471 (= res!828575 (bvslt (_1!10153 (h!28576 lt!562213)) (_1!10153 (h!28576 (t!40834 lt!562213)))))))

(declare-fun b!1242472 () Bool)

(assert (=> b!1242472 (= e!704302 (isStrictlySorted!764 (t!40834 lt!562213)))))

(assert (= (and d!136719 (not res!828574)) b!1242471))

(assert (= (and b!1242471 res!828575) b!1242472))

(declare-fun m!1145151 () Bool)

(assert (=> b!1242472 m!1145151))

(assert (=> d!136601 d!136719))

(declare-fun d!136721 () Bool)

(declare-fun res!828576 () Bool)

(declare-fun e!704303 () Bool)

(assert (=> d!136721 (=> res!828576 e!704303)))

(assert (=> d!136721 (= res!828576 (or ((_ is Nil!27368) (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) ((_ is Nil!27368) (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)))))))

(assert (=> d!136721 (= (isStrictlySorted!764 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20)) e!704303)))

(declare-fun b!1242473 () Bool)

(declare-fun e!704304 () Bool)

(assert (=> b!1242473 (= e!704303 e!704304)))

(declare-fun res!828577 () Bool)

(assert (=> b!1242473 (=> (not res!828577) (not e!704304))))

(assert (=> b!1242473 (= res!828577 (bvslt (_1!10153 (h!28576 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))) (_1!10153 (h!28576 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))))))))

(declare-fun b!1242474 () Bool)

(assert (=> b!1242474 (= e!704304 (isStrictlySorted!764 (t!40834 (insertStrictlySorted!438 (t!40834 l!644) key1!25 v1!20))))))

(assert (= (and d!136721 (not res!828576)) b!1242473))

(assert (= (and b!1242473 res!828577) b!1242474))

(assert (=> b!1242474 m!1145067))

(assert (=> d!136601 d!136721))

(declare-fun d!136723 () Bool)

(declare-fun lt!562245 () Bool)

(assert (=> d!136723 (= lt!562245 (select (content!602 lt!562226) (tuple2!20285 key1!25 v1!20)))))

(declare-fun e!704306 () Bool)

(assert (=> d!136723 (= lt!562245 e!704306)))

(declare-fun res!828578 () Bool)

(assert (=> d!136723 (=> (not res!828578) (not e!704306))))

(assert (=> d!136723 (= res!828578 ((_ is Cons!27367) lt!562226))))

(assert (=> d!136723 (= (contains!7395 lt!562226 (tuple2!20285 key1!25 v1!20)) lt!562245)))

(declare-fun b!1242475 () Bool)

(declare-fun e!704305 () Bool)

(assert (=> b!1242475 (= e!704306 e!704305)))

(declare-fun res!828579 () Bool)

(assert (=> b!1242475 (=> res!828579 e!704305)))

(assert (=> b!1242475 (= res!828579 (= (h!28576 lt!562226) (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242476 () Bool)

(assert (=> b!1242476 (= e!704305 (contains!7395 (t!40834 lt!562226) (tuple2!20285 key1!25 v1!20)))))

(assert (= (and d!136723 res!828578) b!1242475))

(assert (= (and b!1242475 (not res!828579)) b!1242476))

(declare-fun m!1145153 () Bool)

(assert (=> d!136723 m!1145153))

(declare-fun m!1145155 () Bool)

(assert (=> d!136723 m!1145155))

(declare-fun m!1145157 () Bool)

(assert (=> b!1242476 m!1145157))

(assert (=> b!1242334 d!136723))

(declare-fun d!136725 () Bool)

(declare-fun lt!562246 () Bool)

(assert (=> d!136725 (= lt!562246 (select (content!602 lt!562227) (tuple2!20285 key1!25 v1!20)))))

(declare-fun e!704308 () Bool)

(assert (=> d!136725 (= lt!562246 e!704308)))

(declare-fun res!828580 () Bool)

(assert (=> d!136725 (=> (not res!828580) (not e!704308))))

(assert (=> d!136725 (= res!828580 ((_ is Cons!27367) lt!562227))))

(assert (=> d!136725 (= (contains!7395 lt!562227 (tuple2!20285 key1!25 v1!20)) lt!562246)))

(declare-fun b!1242477 () Bool)

(declare-fun e!704307 () Bool)

(assert (=> b!1242477 (= e!704308 e!704307)))

(declare-fun res!828581 () Bool)

(assert (=> b!1242477 (=> res!828581 e!704307)))

(assert (=> b!1242477 (= res!828581 (= (h!28576 lt!562227) (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242478 () Bool)

(assert (=> b!1242478 (= e!704307 (contains!7395 (t!40834 lt!562227) (tuple2!20285 key1!25 v1!20)))))

(assert (= (and d!136725 res!828580) b!1242477))

(assert (= (and b!1242477 (not res!828581)) b!1242478))

(declare-fun m!1145159 () Bool)

(assert (=> d!136725 m!1145159))

(declare-fun m!1145161 () Bool)

(assert (=> d!136725 m!1145161))

(declare-fun m!1145163 () Bool)

(assert (=> b!1242478 m!1145163))

(assert (=> b!1242344 d!136725))

(declare-fun d!136727 () Bool)

(declare-fun res!828582 () Bool)

(declare-fun e!704309 () Bool)

(assert (=> d!136727 (=> res!828582 e!704309)))

(assert (=> d!136727 (= res!828582 (or ((_ is Nil!27368) lt!562227) ((_ is Nil!27368) (t!40834 lt!562227))))))

(assert (=> d!136727 (= (isStrictlySorted!764 lt!562227) e!704309)))

(declare-fun b!1242479 () Bool)

(declare-fun e!704310 () Bool)

(assert (=> b!1242479 (= e!704309 e!704310)))

(declare-fun res!828583 () Bool)

(assert (=> b!1242479 (=> (not res!828583) (not e!704310))))

(assert (=> b!1242479 (= res!828583 (bvslt (_1!10153 (h!28576 lt!562227)) (_1!10153 (h!28576 (t!40834 lt!562227)))))))

(declare-fun b!1242480 () Bool)

(assert (=> b!1242480 (= e!704310 (isStrictlySorted!764 (t!40834 lt!562227)))))

(assert (= (and d!136727 (not res!828582)) b!1242479))

(assert (= (and b!1242479 res!828583) b!1242480))

(declare-fun m!1145165 () Bool)

(assert (=> b!1242480 m!1145165))

(assert (=> d!136641 d!136727))

(assert (=> d!136641 d!136597))

(declare-fun b!1242481 () Bool)

(declare-fun e!704312 () List!27371)

(declare-fun call!61336 () List!27371)

(assert (=> b!1242481 (= e!704312 call!61336)))

(declare-fun d!136729 () Bool)

(declare-fun e!704315 () Bool)

(assert (=> d!136729 e!704315))

(declare-fun res!828584 () Bool)

(assert (=> d!136729 (=> (not res!828584) (not e!704315))))

(declare-fun lt!562247 () List!27371)

(assert (=> d!136729 (= res!828584 (isStrictlySorted!764 lt!562247))))

(declare-fun e!704313 () List!27371)

(assert (=> d!136729 (= lt!562247 e!704313)))

(declare-fun c!121649 () Bool)

(assert (=> d!136729 (= c!121649 (and ((_ is Cons!27367) (t!40834 (removeStrictlySorted!131 l!644 key2!15))) (bvslt (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 l!644 key2!15)))) key1!25)))))

(assert (=> d!136729 (isStrictlySorted!764 (t!40834 (removeStrictlySorted!131 l!644 key2!15)))))

(assert (=> d!136729 (= (insertStrictlySorted!438 (t!40834 (removeStrictlySorted!131 l!644 key2!15)) key1!25 v1!20) lt!562247)))

(declare-fun bm!61331 () Bool)

(declare-fun call!61334 () List!27371)

(assert (=> bm!61331 (= call!61336 call!61334)))

(declare-fun b!1242482 () Bool)

(declare-fun c!121648 () Bool)

(assert (=> b!1242482 (= c!121648 (and ((_ is Cons!27367) (t!40834 (removeStrictlySorted!131 l!644 key2!15))) (bvsgt (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 l!644 key2!15)))) key1!25)))))

(declare-fun e!704311 () List!27371)

(assert (=> b!1242482 (= e!704311 e!704312)))

(declare-fun b!1242483 () Bool)

(assert (=> b!1242483 (= e!704313 e!704311)))

(declare-fun c!121651 () Bool)

(assert (=> b!1242483 (= c!121651 (and ((_ is Cons!27367) (t!40834 (removeStrictlySorted!131 l!644 key2!15))) (= (_1!10153 (h!28576 (t!40834 (removeStrictlySorted!131 l!644 key2!15)))) key1!25)))))

(declare-fun call!61335 () List!27371)

(declare-fun e!704314 () List!27371)

(declare-fun bm!61332 () Bool)

(assert (=> bm!61332 (= call!61335 ($colon$colon!628 e!704314 (ite c!121649 (h!28576 (t!40834 (removeStrictlySorted!131 l!644 key2!15))) (tuple2!20285 key1!25 v1!20))))))

(declare-fun c!121650 () Bool)

(assert (=> bm!61332 (= c!121650 c!121649)))

(declare-fun b!1242484 () Bool)

(assert (=> b!1242484 (= e!704313 call!61335)))

(declare-fun b!1242485 () Bool)

(assert (=> b!1242485 (= e!704315 (contains!7395 lt!562247 (tuple2!20285 key1!25 v1!20)))))

(declare-fun b!1242486 () Bool)

(assert (=> b!1242486 (= e!704312 call!61336)))

(declare-fun b!1242487 () Bool)

(assert (=> b!1242487 (= e!704311 call!61334)))

(declare-fun b!1242488 () Bool)

(assert (=> b!1242488 (= e!704314 (ite c!121651 (t!40834 (t!40834 (removeStrictlySorted!131 l!644 key2!15))) (ite c!121648 (Cons!27367 (h!28576 (t!40834 (removeStrictlySorted!131 l!644 key2!15))) (t!40834 (t!40834 (removeStrictlySorted!131 l!644 key2!15)))) Nil!27368)))))

(declare-fun b!1242489 () Bool)

(assert (=> b!1242489 (= e!704314 (insertStrictlySorted!438 (t!40834 (t!40834 (removeStrictlySorted!131 l!644 key2!15))) key1!25 v1!20))))

(declare-fun bm!61333 () Bool)

(assert (=> bm!61333 (= call!61334 call!61335)))

(declare-fun b!1242490 () Bool)

(declare-fun res!828585 () Bool)

(assert (=> b!1242490 (=> (not res!828585) (not e!704315))))

(assert (=> b!1242490 (= res!828585 (containsKey!614 lt!562247 key1!25))))

(assert (= (and d!136729 c!121649) b!1242484))

(assert (= (and d!136729 (not c!121649)) b!1242483))

(assert (= (and b!1242483 c!121651) b!1242487))

(assert (= (and b!1242483 (not c!121651)) b!1242482))

(assert (= (and b!1242482 c!121648) b!1242481))

(assert (= (and b!1242482 (not c!121648)) b!1242486))

(assert (= (or b!1242481 b!1242486) bm!61331))

(assert (= (or b!1242487 bm!61331) bm!61333))

(assert (= (or b!1242484 bm!61333) bm!61332))

(assert (= (and bm!61332 c!121650) b!1242489))

(assert (= (and bm!61332 (not c!121650)) b!1242488))

(assert (= (and d!136729 res!828584) b!1242490))

(assert (= (and b!1242490 res!828585) b!1242485))

(declare-fun m!1145167 () Bool)

(assert (=> b!1242490 m!1145167))

(declare-fun m!1145169 () Bool)

(assert (=> d!136729 m!1145169))

(assert (=> d!136729 m!1145085))

(declare-fun m!1145171 () Bool)

(assert (=> b!1242485 m!1145171))

(declare-fun m!1145173 () Bool)

(assert (=> bm!61332 m!1145173))

(declare-fun m!1145175 () Bool)

(assert (=> b!1242489 m!1145175))

(assert (=> b!1242358 d!136729))

(declare-fun d!136731 () Bool)

(declare-fun res!828586 () Bool)

(declare-fun e!704316 () Bool)

(assert (=> d!136731 (=> res!828586 e!704316)))

(assert (=> d!136731 (= res!828586 (and ((_ is Cons!27367) lt!562213) (= (_1!10153 (h!28576 lt!562213)) key2!15)))))

(assert (=> d!136731 (= (containsKey!614 lt!562213 key2!15) e!704316)))

(declare-fun b!1242491 () Bool)

(declare-fun e!704317 () Bool)

(assert (=> b!1242491 (= e!704316 e!704317)))

(declare-fun res!828587 () Bool)

(assert (=> b!1242491 (=> (not res!828587) (not e!704317))))

(assert (=> b!1242491 (= res!828587 (and (or (not ((_ is Cons!27367) lt!562213)) (bvsle (_1!10153 (h!28576 lt!562213)) key2!15)) ((_ is Cons!27367) lt!562213) (bvslt (_1!10153 (h!28576 lt!562213)) key2!15)))))

(declare-fun b!1242492 () Bool)

(assert (=> b!1242492 (= e!704317 (containsKey!614 (t!40834 lt!562213) key2!15))))

(assert (= (and d!136731 (not res!828586)) b!1242491))

(assert (= (and b!1242491 res!828587) b!1242492))

(declare-fun m!1145177 () Bool)

(assert (=> b!1242492 m!1145177))

(assert (=> b!1242239 d!136731))

(declare-fun d!136733 () Bool)

(assert (=> d!136733 (= ($colon$colon!628 e!704207 (ite c!121613 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (tuple2!20285 key1!25 v1!20))) (Cons!27367 (ite c!121613 (h!28576 (removeStrictlySorted!131 (t!40834 l!644) key2!15)) (tuple2!20285 key1!25 v1!20)) e!704207))))

(assert (=> bm!61314 d!136733))

(declare-fun b!1242493 () Bool)

(declare-fun e!704318 () Bool)

(declare-fun tp!92760 () Bool)

(assert (=> b!1242493 (= e!704318 (and tp_is_empty!31287 tp!92760))))

(assert (=> b!1242389 (= tp!92759 e!704318)))

(assert (= (and b!1242389 ((_ is Cons!27367) (t!40834 (t!40834 l!644)))) b!1242493))

(check-sat (not d!136661) (not b!1242407) (not b!1242468) (not b!1242417) (not b!1242435) (not b!1242440) (not b!1242490) (not bm!61329) (not d!136665) (not bm!61326) (not b!1242450) (not b!1242470) (not b!1242489) (not d!136679) (not b!1242485) (not b!1242448) (not b!1242391) (not b!1242462) (not d!136729) (not b!1242446) (not bm!61332) (not b!1242400) (not b!1242464) (not b!1242415) (not b!1242480) (not b!1242457) (not b!1242431) (not d!136689) (not d!136707) (not b!1242390) (not b!1242401) (not b!1242474) (not b!1242421) (not b!1242472) (not b!1242420) (not d!136659) (not b!1242461) (not b!1242419) (not b!1242438) tp_is_empty!31287 (not b!1242444) (not b!1242442) (not b!1242466) (not b!1242436) (not d!136687) (not d!136723) (not b!1242409) (not b!1242493) (not b!1242452) (not b!1242426) (not b!1242492) (not d!136725) (not d!136683) (not b!1242478) (not b!1242402) (not b!1242476))
(check-sat)
