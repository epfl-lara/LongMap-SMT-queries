; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103730 () Bool)

(assert start!103730)

(declare-fun b!1241953 () Bool)

(declare-fun res!828367 () Bool)

(declare-fun e!703988 () Bool)

(assert (=> b!1241953 (=> (not res!828367) (not e!703988))))

(declare-datatypes ((B!1882 0))(
  ( (B!1883 (val!15703 Int)) )
))
(declare-datatypes ((tuple2!20278 0))(
  ( (tuple2!20279 (_1!10150 (_ BitVec 64)) (_2!10150 B!1882)) )
))
(declare-datatypes ((List!27368 0))(
  ( (Nil!27365) (Cons!27364 (h!28573 tuple2!20278) (t!40831 List!27368)) )
))
(declare-fun l!644 () List!27368)

(declare-fun isStrictlySorted!761 (List!27368) Bool)

(assert (=> b!1241953 (= res!828367 (isStrictlySorted!761 l!644))))

(declare-fun b!1241954 () Bool)

(declare-fun ListPrimitiveSize!149 (List!27368) Int)

(assert (=> b!1241954 (= e!703988 (>= (ListPrimitiveSize!149 (t!40831 l!644)) (ListPrimitiveSize!149 l!644)))))

(declare-fun b!1241955 () Bool)

(declare-fun res!828370 () Bool)

(assert (=> b!1241955 (=> (not res!828370) (not e!703988))))

(assert (=> b!1241955 (= res!828370 (isStrictlySorted!761 (t!40831 l!644)))))

(declare-fun b!1241956 () Bool)

(declare-fun res!828368 () Bool)

(assert (=> b!1241956 (=> (not res!828368) (not e!703988))))

(get-info :version)

(assert (=> b!1241956 (= res!828368 ((_ is Cons!27364) l!644))))

(declare-fun b!1241957 () Bool)

(declare-fun e!703989 () Bool)

(declare-fun tp_is_empty!31281 () Bool)

(declare-fun tp!92729 () Bool)

(assert (=> b!1241957 (= e!703989 (and tp_is_empty!31281 tp!92729))))

(declare-fun res!828369 () Bool)

(assert (=> start!103730 (=> (not res!828369) (not e!703988))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103730 (= res!828369 (not (= key1!25 key2!15)))))

(assert (=> start!103730 e!703988))

(assert (=> start!103730 true))

(assert (=> start!103730 e!703989))

(assert (= (and start!103730 res!828369) b!1241953))

(assert (= (and b!1241953 res!828367) b!1241956))

(assert (= (and b!1241956 res!828368) b!1241955))

(assert (= (and b!1241955 res!828370) b!1241954))

(assert (= (and start!103730 ((_ is Cons!27364) l!644)) b!1241957))

(declare-fun m!1144725 () Bool)

(assert (=> b!1241953 m!1144725))

(declare-fun m!1144727 () Bool)

(assert (=> b!1241954 m!1144727))

(declare-fun m!1144729 () Bool)

(assert (=> b!1241954 m!1144729))

(declare-fun m!1144731 () Bool)

(assert (=> b!1241955 m!1144731))

(check-sat tp_is_empty!31281 (not b!1241955) (not b!1241954) (not b!1241957) (not b!1241953))
(check-sat)
(get-model)

(declare-fun d!136563 () Bool)

(declare-fun res!828387 () Bool)

(declare-fun e!704003 () Bool)

(assert (=> d!136563 (=> res!828387 e!704003)))

(assert (=> d!136563 (= res!828387 (or ((_ is Nil!27365) l!644) ((_ is Nil!27365) (t!40831 l!644))))))

(assert (=> d!136563 (= (isStrictlySorted!761 l!644) e!704003)))

(declare-fun b!1241983 () Bool)

(declare-fun e!704004 () Bool)

(assert (=> b!1241983 (= e!704003 e!704004)))

(declare-fun res!828388 () Bool)

(assert (=> b!1241983 (=> (not res!828388) (not e!704004))))

(assert (=> b!1241983 (= res!828388 (bvslt (_1!10150 (h!28573 l!644)) (_1!10150 (h!28573 (t!40831 l!644)))))))

(declare-fun b!1241984 () Bool)

(assert (=> b!1241984 (= e!704004 (isStrictlySorted!761 (t!40831 l!644)))))

(assert (= (and d!136563 (not res!828387)) b!1241983))

(assert (= (and b!1241983 res!828388) b!1241984))

(assert (=> b!1241984 m!1144731))

(assert (=> b!1241953 d!136563))

(declare-fun d!136571 () Bool)

(declare-fun lt!562176 () Int)

(assert (=> d!136571 (>= lt!562176 0)))

(declare-fun e!704020 () Int)

(assert (=> d!136571 (= lt!562176 e!704020)))

(declare-fun c!121520 () Bool)

(assert (=> d!136571 (= c!121520 ((_ is Nil!27365) (t!40831 l!644)))))

(assert (=> d!136571 (= (ListPrimitiveSize!149 (t!40831 l!644)) lt!562176)))

(declare-fun b!1242003 () Bool)

(assert (=> b!1242003 (= e!704020 0)))

(declare-fun b!1242004 () Bool)

(assert (=> b!1242004 (= e!704020 (+ 1 (ListPrimitiveSize!149 (t!40831 (t!40831 l!644)))))))

(assert (= (and d!136571 c!121520) b!1242003))

(assert (= (and d!136571 (not c!121520)) b!1242004))

(declare-fun m!1144745 () Bool)

(assert (=> b!1242004 m!1144745))

(assert (=> b!1241954 d!136571))

(declare-fun d!136579 () Bool)

(declare-fun lt!562179 () Int)

(assert (=> d!136579 (>= lt!562179 0)))

(declare-fun e!704023 () Int)

(assert (=> d!136579 (= lt!562179 e!704023)))

(declare-fun c!121523 () Bool)

(assert (=> d!136579 (= c!121523 ((_ is Nil!27365) l!644))))

(assert (=> d!136579 (= (ListPrimitiveSize!149 l!644) lt!562179)))

(declare-fun b!1242009 () Bool)

(assert (=> b!1242009 (= e!704023 0)))

(declare-fun b!1242010 () Bool)

(assert (=> b!1242010 (= e!704023 (+ 1 (ListPrimitiveSize!149 (t!40831 l!644))))))

(assert (= (and d!136579 c!121523) b!1242009))

(assert (= (and d!136579 (not c!121523)) b!1242010))

(assert (=> b!1242010 m!1144727))

(assert (=> b!1241954 d!136579))

(declare-fun d!136581 () Bool)

(declare-fun res!828403 () Bool)

(declare-fun e!704026 () Bool)

(assert (=> d!136581 (=> res!828403 e!704026)))

(assert (=> d!136581 (= res!828403 (or ((_ is Nil!27365) (t!40831 l!644)) ((_ is Nil!27365) (t!40831 (t!40831 l!644)))))))

(assert (=> d!136581 (= (isStrictlySorted!761 (t!40831 l!644)) e!704026)))

(declare-fun b!1242013 () Bool)

(declare-fun e!704027 () Bool)

(assert (=> b!1242013 (= e!704026 e!704027)))

(declare-fun res!828404 () Bool)

(assert (=> b!1242013 (=> (not res!828404) (not e!704027))))

(assert (=> b!1242013 (= res!828404 (bvslt (_1!10150 (h!28573 (t!40831 l!644))) (_1!10150 (h!28573 (t!40831 (t!40831 l!644))))))))

(declare-fun b!1242014 () Bool)

(assert (=> b!1242014 (= e!704027 (isStrictlySorted!761 (t!40831 (t!40831 l!644))))))

(assert (= (and d!136581 (not res!828403)) b!1242013))

(assert (= (and b!1242013 res!828404) b!1242014))

(declare-fun m!1144749 () Bool)

(assert (=> b!1242014 m!1144749))

(assert (=> b!1241955 d!136581))

(declare-fun b!1242029 () Bool)

(declare-fun e!704036 () Bool)

(declare-fun tp!92737 () Bool)

(assert (=> b!1242029 (= e!704036 (and tp_is_empty!31281 tp!92737))))

(assert (=> b!1241957 (= tp!92729 e!704036)))

(assert (= (and b!1241957 ((_ is Cons!27364) (t!40831 l!644))) b!1242029))

(check-sat (not b!1242029) (not b!1242014) tp_is_empty!31281 (not b!1241984) (not b!1242010) (not b!1242004))
(check-sat)
