; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7302 () Bool)

(assert start!7302)

(declare-fun res!27362 () Bool)

(declare-fun e!29936 () Bool)

(assert (=> start!7302 (=> (not res!27362) (not e!29936))))

(declare-datatypes ((B!898 0))(
  ( (B!899 (val!1036 Int)) )
))
(declare-datatypes ((tuple2!1720 0))(
  ( (tuple2!1721 (_1!871 (_ BitVec 64)) (_2!871 B!898)) )
))
(declare-datatypes ((List!1254 0))(
  ( (Nil!1251) (Cons!1250 (h!1830 tuple2!1720) (t!4282 List!1254)) )
))
(declare-fun l!812 () List!1254)

(declare-fun isStrictlySorted!245 (List!1254) Bool)

(assert (=> start!7302 (= res!27362 (isStrictlySorted!245 l!812))))

(assert (=> start!7302 e!29936))

(declare-fun e!29935 () Bool)

(assert (=> start!7302 e!29935))

(assert (=> start!7302 true))

(declare-fun b!46891 () Bool)

(declare-fun res!27363 () Bool)

(assert (=> b!46891 (=> (not res!27363) (not e!29936))))

(get-info :version)

(assert (=> b!46891 (= res!27363 (not ((_ is Cons!1250) l!812)))))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun b!46892 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!46 (List!1254 (_ BitVec 64)) List!1254)

(assert (=> b!46892 (= e!29936 (not (= (removeStrictlySorted!46 (removeStrictlySorted!46 l!812 key1!43) key2!27) (removeStrictlySorted!46 (removeStrictlySorted!46 l!812 key2!27) key1!43))))))

(declare-fun b!46893 () Bool)

(declare-fun tp_is_empty!1995 () Bool)

(declare-fun tp!6161 () Bool)

(assert (=> b!46893 (= e!29935 (and tp_is_empty!1995 tp!6161))))

(assert (= (and start!7302 res!27362) b!46891))

(assert (= (and b!46891 res!27363) b!46892))

(assert (= (and start!7302 ((_ is Cons!1250) l!812)) b!46893))

(declare-fun m!41275 () Bool)

(assert (=> start!7302 m!41275))

(declare-fun m!41277 () Bool)

(assert (=> b!46892 m!41277))

(assert (=> b!46892 m!41277))

(declare-fun m!41279 () Bool)

(assert (=> b!46892 m!41279))

(declare-fun m!41281 () Bool)

(assert (=> b!46892 m!41281))

(assert (=> b!46892 m!41281))

(declare-fun m!41283 () Bool)

(assert (=> b!46892 m!41283))

(check-sat (not b!46892) (not start!7302) (not b!46893) tp_is_empty!1995)
(check-sat)
(get-model)

(declare-fun b!46949 () Bool)

(declare-fun e!29973 () List!1254)

(assert (=> b!46949 (= e!29973 (t!4282 (removeStrictlySorted!46 l!812 key1!43)))))

(declare-fun b!46950 () Bool)

(declare-fun e!29974 () List!1254)

(assert (=> b!46950 (= e!29973 e!29974)))

(declare-fun c!6378 () Bool)

(assert (=> b!46950 (= c!6378 (and ((_ is Cons!1250) (removeStrictlySorted!46 l!812 key1!43)) (not (= (_1!871 (h!1830 (removeStrictlySorted!46 l!812 key1!43))) key2!27))))))

(declare-fun d!9373 () Bool)

(declare-fun e!29975 () Bool)

(assert (=> d!9373 e!29975))

(declare-fun res!27384 () Bool)

(assert (=> d!9373 (=> (not res!27384) (not e!29975))))

(declare-fun lt!20371 () List!1254)

(assert (=> d!9373 (= res!27384 (isStrictlySorted!245 lt!20371))))

(assert (=> d!9373 (= lt!20371 e!29973)))

(declare-fun c!6377 () Bool)

(assert (=> d!9373 (= c!6377 (and ((_ is Cons!1250) (removeStrictlySorted!46 l!812 key1!43)) (= (_1!871 (h!1830 (removeStrictlySorted!46 l!812 key1!43))) key2!27)))))

(assert (=> d!9373 (isStrictlySorted!245 (removeStrictlySorted!46 l!812 key1!43))))

(assert (=> d!9373 (= (removeStrictlySorted!46 (removeStrictlySorted!46 l!812 key1!43) key2!27) lt!20371)))

(declare-fun b!46951 () Bool)

(assert (=> b!46951 (= e!29974 Nil!1251)))

(declare-fun b!46952 () Bool)

(declare-fun containsKey!94 (List!1254 (_ BitVec 64)) Bool)

(assert (=> b!46952 (= e!29975 (not (containsKey!94 lt!20371 key2!27)))))

(declare-fun b!46953 () Bool)

(declare-fun $colon$colon!48 (List!1254 tuple2!1720) List!1254)

(assert (=> b!46953 (= e!29974 ($colon$colon!48 (removeStrictlySorted!46 (t!4282 (removeStrictlySorted!46 l!812 key1!43)) key2!27) (h!1830 (removeStrictlySorted!46 l!812 key1!43))))))

(assert (= (and d!9373 c!6377) b!46949))

(assert (= (and d!9373 (not c!6377)) b!46950))

(assert (= (and b!46950 c!6378) b!46953))

(assert (= (and b!46950 (not c!6378)) b!46951))

(assert (= (and d!9373 res!27384) b!46952))

(declare-fun m!41333 () Bool)

(assert (=> d!9373 m!41333))

(assert (=> d!9373 m!41277))

(declare-fun m!41335 () Bool)

(assert (=> d!9373 m!41335))

(declare-fun m!41337 () Bool)

(assert (=> b!46952 m!41337))

(declare-fun m!41339 () Bool)

(assert (=> b!46953 m!41339))

(assert (=> b!46953 m!41339))

(declare-fun m!41341 () Bool)

(assert (=> b!46953 m!41341))

(assert (=> b!46892 d!9373))

(declare-fun b!46962 () Bool)

(declare-fun e!29980 () List!1254)

(assert (=> b!46962 (= e!29980 (t!4282 l!812))))

(declare-fun b!46963 () Bool)

(declare-fun e!29982 () List!1254)

(assert (=> b!46963 (= e!29980 e!29982)))

(declare-fun c!6384 () Bool)

(assert (=> b!46963 (= c!6384 (and ((_ is Cons!1250) l!812) (not (= (_1!871 (h!1830 l!812)) key1!43))))))

(declare-fun d!9389 () Bool)

(declare-fun e!29984 () Bool)

(assert (=> d!9389 e!29984))

(declare-fun res!27385 () Bool)

(assert (=> d!9389 (=> (not res!27385) (not e!29984))))

(declare-fun lt!20374 () List!1254)

(assert (=> d!9389 (= res!27385 (isStrictlySorted!245 lt!20374))))

(assert (=> d!9389 (= lt!20374 e!29980)))

(declare-fun c!6383 () Bool)

(assert (=> d!9389 (= c!6383 (and ((_ is Cons!1250) l!812) (= (_1!871 (h!1830 l!812)) key1!43)))))

(assert (=> d!9389 (isStrictlySorted!245 l!812)))

(assert (=> d!9389 (= (removeStrictlySorted!46 l!812 key1!43) lt!20374)))

(declare-fun b!46964 () Bool)

(assert (=> b!46964 (= e!29982 Nil!1251)))

(declare-fun b!46965 () Bool)

(assert (=> b!46965 (= e!29984 (not (containsKey!94 lt!20374 key1!43)))))

(declare-fun b!46966 () Bool)

(assert (=> b!46966 (= e!29982 ($colon$colon!48 (removeStrictlySorted!46 (t!4282 l!812) key1!43) (h!1830 l!812)))))

(assert (= (and d!9389 c!6383) b!46962))

(assert (= (and d!9389 (not c!6383)) b!46963))

(assert (= (and b!46963 c!6384) b!46966))

(assert (= (and b!46963 (not c!6384)) b!46964))

(assert (= (and d!9389 res!27385) b!46965))

(declare-fun m!41343 () Bool)

(assert (=> d!9389 m!41343))

(assert (=> d!9389 m!41275))

(declare-fun m!41345 () Bool)

(assert (=> b!46965 m!41345))

(declare-fun m!41347 () Bool)

(assert (=> b!46966 m!41347))

(assert (=> b!46966 m!41347))

(declare-fun m!41349 () Bool)

(assert (=> b!46966 m!41349))

(assert (=> b!46892 d!9389))

(declare-fun b!46973 () Bool)

(declare-fun e!29989 () List!1254)

(assert (=> b!46973 (= e!29989 (t!4282 (removeStrictlySorted!46 l!812 key2!27)))))

(declare-fun b!46974 () Bool)

(declare-fun e!29990 () List!1254)

(assert (=> b!46974 (= e!29989 e!29990)))

(declare-fun c!6386 () Bool)

(assert (=> b!46974 (= c!6386 (and ((_ is Cons!1250) (removeStrictlySorted!46 l!812 key2!27)) (not (= (_1!871 (h!1830 (removeStrictlySorted!46 l!812 key2!27))) key1!43))))))

(declare-fun d!9391 () Bool)

(declare-fun e!29991 () Bool)

(assert (=> d!9391 e!29991))

(declare-fun res!27392 () Bool)

(assert (=> d!9391 (=> (not res!27392) (not e!29991))))

(declare-fun lt!20375 () List!1254)

(assert (=> d!9391 (= res!27392 (isStrictlySorted!245 lt!20375))))

(assert (=> d!9391 (= lt!20375 e!29989)))

(declare-fun c!6385 () Bool)

(assert (=> d!9391 (= c!6385 (and ((_ is Cons!1250) (removeStrictlySorted!46 l!812 key2!27)) (= (_1!871 (h!1830 (removeStrictlySorted!46 l!812 key2!27))) key1!43)))))

(assert (=> d!9391 (isStrictlySorted!245 (removeStrictlySorted!46 l!812 key2!27))))

(assert (=> d!9391 (= (removeStrictlySorted!46 (removeStrictlySorted!46 l!812 key2!27) key1!43) lt!20375)))

(declare-fun b!46975 () Bool)

(assert (=> b!46975 (= e!29990 Nil!1251)))

(declare-fun b!46976 () Bool)

(assert (=> b!46976 (= e!29991 (not (containsKey!94 lt!20375 key1!43)))))

(declare-fun b!46977 () Bool)

(assert (=> b!46977 (= e!29990 ($colon$colon!48 (removeStrictlySorted!46 (t!4282 (removeStrictlySorted!46 l!812 key2!27)) key1!43) (h!1830 (removeStrictlySorted!46 l!812 key2!27))))))

(assert (= (and d!9391 c!6385) b!46973))

(assert (= (and d!9391 (not c!6385)) b!46974))

(assert (= (and b!46974 c!6386) b!46977))

(assert (= (and b!46974 (not c!6386)) b!46975))

(assert (= (and d!9391 res!27392) b!46976))

(declare-fun m!41351 () Bool)

(assert (=> d!9391 m!41351))

(assert (=> d!9391 m!41281))

(declare-fun m!41353 () Bool)

(assert (=> d!9391 m!41353))

(declare-fun m!41355 () Bool)

(assert (=> b!46976 m!41355))

(declare-fun m!41357 () Bool)

(assert (=> b!46977 m!41357))

(assert (=> b!46977 m!41357))

(declare-fun m!41361 () Bool)

(assert (=> b!46977 m!41361))

(assert (=> b!46892 d!9391))

(declare-fun b!46980 () Bool)

(declare-fun e!29994 () List!1254)

(assert (=> b!46980 (= e!29994 (t!4282 l!812))))

(declare-fun b!46981 () Bool)

(declare-fun e!29995 () List!1254)

(assert (=> b!46981 (= e!29994 e!29995)))

(declare-fun c!6388 () Bool)

(assert (=> b!46981 (= c!6388 (and ((_ is Cons!1250) l!812) (not (= (_1!871 (h!1830 l!812)) key2!27))))))

(declare-fun d!9393 () Bool)

(declare-fun e!29996 () Bool)

(assert (=> d!9393 e!29996))

(declare-fun res!27395 () Bool)

(assert (=> d!9393 (=> (not res!27395) (not e!29996))))

(declare-fun lt!20376 () List!1254)

(assert (=> d!9393 (= res!27395 (isStrictlySorted!245 lt!20376))))

(assert (=> d!9393 (= lt!20376 e!29994)))

(declare-fun c!6387 () Bool)

(assert (=> d!9393 (= c!6387 (and ((_ is Cons!1250) l!812) (= (_1!871 (h!1830 l!812)) key2!27)))))

(assert (=> d!9393 (isStrictlySorted!245 l!812)))

(assert (=> d!9393 (= (removeStrictlySorted!46 l!812 key2!27) lt!20376)))

(declare-fun b!46982 () Bool)

(assert (=> b!46982 (= e!29995 Nil!1251)))

(declare-fun b!46983 () Bool)

(assert (=> b!46983 (= e!29996 (not (containsKey!94 lt!20376 key2!27)))))

(declare-fun b!46984 () Bool)

(assert (=> b!46984 (= e!29995 ($colon$colon!48 (removeStrictlySorted!46 (t!4282 l!812) key2!27) (h!1830 l!812)))))

(assert (= (and d!9393 c!6387) b!46980))

(assert (= (and d!9393 (not c!6387)) b!46981))

(assert (= (and b!46981 c!6388) b!46984))

(assert (= (and b!46981 (not c!6388)) b!46982))

(assert (= (and d!9393 res!27395) b!46983))

(declare-fun m!41363 () Bool)

(assert (=> d!9393 m!41363))

(assert (=> d!9393 m!41275))

(declare-fun m!41365 () Bool)

(assert (=> b!46983 m!41365))

(declare-fun m!41367 () Bool)

(assert (=> b!46984 m!41367))

(assert (=> b!46984 m!41367))

(declare-fun m!41369 () Bool)

(assert (=> b!46984 m!41369))

(assert (=> b!46892 d!9393))

(declare-fun d!9395 () Bool)

(declare-fun res!27404 () Bool)

(declare-fun e!30016 () Bool)

(assert (=> d!9395 (=> res!27404 e!30016)))

(assert (=> d!9395 (= res!27404 (or ((_ is Nil!1251) l!812) ((_ is Nil!1251) (t!4282 l!812))))))

(assert (=> d!9395 (= (isStrictlySorted!245 l!812) e!30016)))

(declare-fun b!47014 () Bool)

(declare-fun e!30017 () Bool)

(assert (=> b!47014 (= e!30016 e!30017)))

(declare-fun res!27405 () Bool)

(assert (=> b!47014 (=> (not res!27405) (not e!30017))))

(assert (=> b!47014 (= res!27405 (bvslt (_1!871 (h!1830 l!812)) (_1!871 (h!1830 (t!4282 l!812)))))))

(declare-fun b!47015 () Bool)

(assert (=> b!47015 (= e!30017 (isStrictlySorted!245 (t!4282 l!812)))))

(assert (= (and d!9395 (not res!27404)) b!47014))

(assert (= (and b!47014 res!27405) b!47015))

(declare-fun m!41403 () Bool)

(assert (=> b!47015 m!41403))

(assert (=> start!7302 d!9395))

(declare-fun b!47024 () Bool)

(declare-fun e!30022 () Bool)

(declare-fun tp!6172 () Bool)

(assert (=> b!47024 (= e!30022 (and tp_is_empty!1995 tp!6172))))

(assert (=> b!46893 (= tp!6161 e!30022)))

(assert (= (and b!46893 ((_ is Cons!1250) (t!4282 l!812))) b!47024))

(check-sat (not b!46965) (not b!46983) (not b!46977) (not d!9373) (not d!9389) (not d!9393) (not b!47024) (not b!46952) (not b!46976) (not b!47015) (not d!9391) (not b!46966) (not b!46953) tp_is_empty!1995 (not b!46984))
(check-sat)
