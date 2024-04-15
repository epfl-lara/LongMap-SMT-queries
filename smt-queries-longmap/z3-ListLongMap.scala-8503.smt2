; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103642 () Bool)

(assert start!103642)

(declare-fun b!1241394 () Bool)

(declare-fun e!703635 () Bool)

(declare-datatypes ((B!1844 0))(
  ( (B!1845 (val!15684 Int)) )
))
(declare-datatypes ((tuple2!20324 0))(
  ( (tuple2!20325 (_1!10173 (_ BitVec 64)) (_2!10173 B!1844)) )
))
(declare-datatypes ((List!27411 0))(
  ( (Nil!27408) (Cons!27407 (h!28616 tuple2!20324) (t!40865 List!27411)) )
))
(declare-fun l!644 () List!27411)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun isStrictlySorted!744 (List!27411) Bool)

(declare-fun removeStrictlySorted!127 (List!27411 (_ BitVec 64)) List!27411)

(assert (=> b!1241394 (= e!703635 (not (isStrictlySorted!744 (removeStrictlySorted!127 l!644 key2!15))))))

(declare-fun res!828092 () Bool)

(assert (=> start!103642 (=> (not res!828092) (not e!703635))))

(declare-fun key1!25 () (_ BitVec 64))

(assert (=> start!103642 (= res!828092 (not (= key1!25 key2!15)))))

(assert (=> start!103642 e!703635))

(assert (=> start!103642 true))

(declare-fun e!703634 () Bool)

(assert (=> start!103642 e!703634))

(declare-fun b!1241392 () Bool)

(declare-fun res!828091 () Bool)

(assert (=> b!1241392 (=> (not res!828091) (not e!703635))))

(assert (=> b!1241392 (= res!828091 (isStrictlySorted!744 l!644))))

(declare-fun b!1241395 () Bool)

(declare-fun tp_is_empty!31243 () Bool)

(declare-fun tp!92636 () Bool)

(assert (=> b!1241395 (= e!703634 (and tp_is_empty!31243 tp!92636))))

(declare-fun b!1241393 () Bool)

(declare-fun res!828093 () Bool)

(assert (=> b!1241393 (=> (not res!828093) (not e!703635))))

(get-info :version)

(assert (=> b!1241393 (= res!828093 (not ((_ is Cons!27407) l!644)))))

(assert (= (and start!103642 res!828092) b!1241392))

(assert (= (and b!1241392 res!828091) b!1241393))

(assert (= (and b!1241393 res!828093) b!1241394))

(assert (= (and start!103642 ((_ is Cons!27407) l!644)) b!1241395))

(declare-fun m!1144029 () Bool)

(assert (=> b!1241394 m!1144029))

(assert (=> b!1241394 m!1144029))

(declare-fun m!1144031 () Bool)

(assert (=> b!1241394 m!1144031))

(declare-fun m!1144033 () Bool)

(assert (=> b!1241392 m!1144033))

(check-sat (not b!1241394) (not b!1241392) (not b!1241395) tp_is_empty!31243)
(check-sat)
(get-model)

(declare-fun d!136355 () Bool)

(declare-fun res!828118 () Bool)

(declare-fun e!703654 () Bool)

(assert (=> d!136355 (=> res!828118 e!703654)))

(assert (=> d!136355 (= res!828118 (or ((_ is Nil!27408) (removeStrictlySorted!127 l!644 key2!15)) ((_ is Nil!27408) (t!40865 (removeStrictlySorted!127 l!644 key2!15)))))))

(assert (=> d!136355 (= (isStrictlySorted!744 (removeStrictlySorted!127 l!644 key2!15)) e!703654)))

(declare-fun b!1241426 () Bool)

(declare-fun e!703655 () Bool)

(assert (=> b!1241426 (= e!703654 e!703655)))

(declare-fun res!828119 () Bool)

(assert (=> b!1241426 (=> (not res!828119) (not e!703655))))

(assert (=> b!1241426 (= res!828119 (bvslt (_1!10173 (h!28616 (removeStrictlySorted!127 l!644 key2!15))) (_1!10173 (h!28616 (t!40865 (removeStrictlySorted!127 l!644 key2!15))))))))

(declare-fun b!1241427 () Bool)

(assert (=> b!1241427 (= e!703655 (isStrictlySorted!744 (t!40865 (removeStrictlySorted!127 l!644 key2!15))))))

(assert (= (and d!136355 (not res!828118)) b!1241426))

(assert (= (and b!1241426 res!828119) b!1241427))

(declare-fun m!1144047 () Bool)

(assert (=> b!1241427 m!1144047))

(assert (=> b!1241394 d!136355))

(declare-fun b!1241456 () Bool)

(declare-fun e!703676 () List!27411)

(assert (=> b!1241456 (= e!703676 (t!40865 l!644))))

(declare-fun d!136359 () Bool)

(declare-fun e!703678 () Bool)

(assert (=> d!136359 e!703678))

(declare-fun res!828132 () Bool)

(assert (=> d!136359 (=> (not res!828132) (not e!703678))))

(declare-fun lt!561968 () List!27411)

(assert (=> d!136359 (= res!828132 (isStrictlySorted!744 lt!561968))))

(assert (=> d!136359 (= lt!561968 e!703676)))

(declare-fun c!121442 () Bool)

(assert (=> d!136359 (= c!121442 (and ((_ is Cons!27407) l!644) (= (_1!10173 (h!28616 l!644)) key2!15)))))

(assert (=> d!136359 (isStrictlySorted!744 l!644)))

(assert (=> d!136359 (= (removeStrictlySorted!127 l!644 key2!15) lt!561968)))

(declare-fun b!1241457 () Bool)

(declare-fun e!703677 () List!27411)

(assert (=> b!1241457 (= e!703677 Nil!27408)))

(declare-fun b!1241458 () Bool)

(declare-fun containsKey!607 (List!27411 (_ BitVec 64)) Bool)

(assert (=> b!1241458 (= e!703678 (not (containsKey!607 lt!561968 key2!15)))))

(declare-fun b!1241459 () Bool)

(assert (=> b!1241459 (= e!703676 e!703677)))

(declare-fun c!121441 () Bool)

(assert (=> b!1241459 (= c!121441 (and ((_ is Cons!27407) l!644) (not (= (_1!10173 (h!28616 l!644)) key2!15))))))

(declare-fun b!1241460 () Bool)

(declare-fun $colon$colon!623 (List!27411 tuple2!20324) List!27411)

(assert (=> b!1241460 (= e!703677 ($colon$colon!623 (removeStrictlySorted!127 (t!40865 l!644) key2!15) (h!28616 l!644)))))

(assert (= (and d!136359 c!121442) b!1241456))

(assert (= (and d!136359 (not c!121442)) b!1241459))

(assert (= (and b!1241459 c!121441) b!1241460))

(assert (= (and b!1241459 (not c!121441)) b!1241457))

(assert (= (and d!136359 res!828132) b!1241458))

(declare-fun m!1144051 () Bool)

(assert (=> d!136359 m!1144051))

(assert (=> d!136359 m!1144033))

(declare-fun m!1144053 () Bool)

(assert (=> b!1241458 m!1144053))

(declare-fun m!1144055 () Bool)

(assert (=> b!1241460 m!1144055))

(assert (=> b!1241460 m!1144055))

(declare-fun m!1144057 () Bool)

(assert (=> b!1241460 m!1144057))

(assert (=> b!1241394 d!136359))

(declare-fun d!136365 () Bool)

(declare-fun res!828133 () Bool)

(declare-fun e!703679 () Bool)

(assert (=> d!136365 (=> res!828133 e!703679)))

(assert (=> d!136365 (= res!828133 (or ((_ is Nil!27408) l!644) ((_ is Nil!27408) (t!40865 l!644))))))

(assert (=> d!136365 (= (isStrictlySorted!744 l!644) e!703679)))

(declare-fun b!1241461 () Bool)

(declare-fun e!703680 () Bool)

(assert (=> b!1241461 (= e!703679 e!703680)))

(declare-fun res!828134 () Bool)

(assert (=> b!1241461 (=> (not res!828134) (not e!703680))))

(assert (=> b!1241461 (= res!828134 (bvslt (_1!10173 (h!28616 l!644)) (_1!10173 (h!28616 (t!40865 l!644)))))))

(declare-fun b!1241462 () Bool)

(assert (=> b!1241462 (= e!703680 (isStrictlySorted!744 (t!40865 l!644)))))

(assert (= (and d!136365 (not res!828133)) b!1241461))

(assert (= (and b!1241461 res!828134) b!1241462))

(declare-fun m!1144059 () Bool)

(assert (=> b!1241462 m!1144059))

(assert (=> b!1241392 d!136365))

(declare-fun b!1241476 () Bool)

(declare-fun e!703690 () Bool)

(declare-fun tp!92645 () Bool)

(assert (=> b!1241476 (= e!703690 (and tp_is_empty!31243 tp!92645))))

(assert (=> b!1241395 (= tp!92636 e!703690)))

(assert (= (and b!1241395 ((_ is Cons!27407) (t!40865 l!644))) b!1241476))

(check-sat tp_is_empty!31243 (not d!136359) (not b!1241427) (not b!1241458) (not b!1241476) (not b!1241462) (not b!1241460))
(check-sat)
