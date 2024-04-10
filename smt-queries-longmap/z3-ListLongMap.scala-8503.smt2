; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103652 () Bool)

(assert start!103652)

(declare-fun b!1241492 () Bool)

(declare-fun res!828146 () Bool)

(declare-fun e!703692 () Bool)

(assert (=> b!1241492 (=> (not res!828146) (not e!703692))))

(declare-datatypes ((B!1846 0))(
  ( (B!1847 (val!15685 Int)) )
))
(declare-datatypes ((tuple2!20242 0))(
  ( (tuple2!20243 (_1!10132 (_ BitVec 64)) (_2!10132 B!1846)) )
))
(declare-datatypes ((List!27350 0))(
  ( (Nil!27347) (Cons!27346 (h!28555 tuple2!20242) (t!40813 List!27350)) )
))
(declare-fun l!644 () List!27350)

(declare-fun isStrictlySorted!749 (List!27350) Bool)

(assert (=> b!1241492 (= res!828146 (isStrictlySorted!749 l!644))))

(declare-fun b!1241494 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun removeStrictlySorted!128 (List!27350 (_ BitVec 64)) List!27350)

(assert (=> b!1241494 (= e!703692 (not (isStrictlySorted!749 (removeStrictlySorted!128 l!644 key2!15))))))

(declare-fun res!828148 () Bool)

(assert (=> start!103652 (=> (not res!828148) (not e!703692))))

(declare-fun key1!25 () (_ BitVec 64))

(assert (=> start!103652 (= res!828148 (not (= key1!25 key2!15)))))

(assert (=> start!103652 e!703692))

(assert (=> start!103652 true))

(declare-fun e!703691 () Bool)

(assert (=> start!103652 e!703691))

(declare-fun b!1241495 () Bool)

(declare-fun tp_is_empty!31245 () Bool)

(declare-fun tp!92639 () Bool)

(assert (=> b!1241495 (= e!703691 (and tp_is_empty!31245 tp!92639))))

(declare-fun b!1241493 () Bool)

(declare-fun res!828147 () Bool)

(assert (=> b!1241493 (=> (not res!828147) (not e!703692))))

(get-info :version)

(assert (=> b!1241493 (= res!828147 (not ((_ is Cons!27346) l!644)))))

(assert (= (and start!103652 res!828148) b!1241492))

(assert (= (and b!1241492 res!828146) b!1241493))

(assert (= (and b!1241493 res!828147) b!1241494))

(assert (= (and start!103652 ((_ is Cons!27346) l!644)) b!1241495))

(declare-fun m!1144567 () Bool)

(assert (=> b!1241492 m!1144567))

(declare-fun m!1144569 () Bool)

(assert (=> b!1241494 m!1144569))

(assert (=> b!1241494 m!1144569))

(declare-fun m!1144571 () Bool)

(assert (=> b!1241494 m!1144571))

(check-sat (not b!1241494) (not b!1241492) (not b!1241495) tp_is_empty!31245)
(check-sat)
(get-model)

(declare-fun d!136491 () Bool)

(declare-fun res!828162 () Bool)

(declare-fun e!703703 () Bool)

(assert (=> d!136491 (=> res!828162 e!703703)))

(assert (=> d!136491 (= res!828162 (or ((_ is Nil!27347) (removeStrictlySorted!128 l!644 key2!15)) ((_ is Nil!27347) (t!40813 (removeStrictlySorted!128 l!644 key2!15)))))))

(assert (=> d!136491 (= (isStrictlySorted!749 (removeStrictlySorted!128 l!644 key2!15)) e!703703)))

(declare-fun b!1241512 () Bool)

(declare-fun e!703704 () Bool)

(assert (=> b!1241512 (= e!703703 e!703704)))

(declare-fun res!828163 () Bool)

(assert (=> b!1241512 (=> (not res!828163) (not e!703704))))

(assert (=> b!1241512 (= res!828163 (bvslt (_1!10132 (h!28555 (removeStrictlySorted!128 l!644 key2!15))) (_1!10132 (h!28555 (t!40813 (removeStrictlySorted!128 l!644 key2!15))))))))

(declare-fun b!1241513 () Bool)

(assert (=> b!1241513 (= e!703704 (isStrictlySorted!749 (t!40813 (removeStrictlySorted!128 l!644 key2!15))))))

(assert (= (and d!136491 (not res!828162)) b!1241512))

(assert (= (and b!1241512 res!828163) b!1241513))

(declare-fun m!1144579 () Bool)

(assert (=> b!1241513 m!1144579))

(assert (=> b!1241494 d!136491))

(declare-fun b!1241546 () Bool)

(declare-fun e!703730 () List!27350)

(declare-fun $colon$colon!620 (List!27350 tuple2!20242) List!27350)

(assert (=> b!1241546 (= e!703730 ($colon$colon!620 (removeStrictlySorted!128 (t!40813 l!644) key2!15) (h!28555 l!644)))))

(declare-fun b!1241547 () Bool)

(declare-fun e!703731 () List!27350)

(assert (=> b!1241547 (= e!703731 e!703730)))

(declare-fun c!121460 () Bool)

(assert (=> b!1241547 (= c!121460 (and ((_ is Cons!27346) l!644) (not (= (_1!10132 (h!28555 l!644)) key2!15))))))

(declare-fun b!1241548 () Bool)

(assert (=> b!1241548 (= e!703730 Nil!27347)))

(declare-fun b!1241549 () Bool)

(assert (=> b!1241549 (= e!703731 (t!40813 l!644))))

(declare-fun d!136497 () Bool)

(declare-fun e!703729 () Bool)

(assert (=> d!136497 e!703729))

(declare-fun res!828180 () Bool)

(assert (=> d!136497 (=> (not res!828180) (not e!703729))))

(declare-fun lt!562147 () List!27350)

(assert (=> d!136497 (= res!828180 (isStrictlySorted!749 lt!562147))))

(assert (=> d!136497 (= lt!562147 e!703731)))

(declare-fun c!121459 () Bool)

(assert (=> d!136497 (= c!121459 (and ((_ is Cons!27346) l!644) (= (_1!10132 (h!28555 l!644)) key2!15)))))

(assert (=> d!136497 (isStrictlySorted!749 l!644)))

(assert (=> d!136497 (= (removeStrictlySorted!128 l!644 key2!15) lt!562147)))

(declare-fun b!1241550 () Bool)

(declare-fun containsKey!606 (List!27350 (_ BitVec 64)) Bool)

(assert (=> b!1241550 (= e!703729 (not (containsKey!606 lt!562147 key2!15)))))

(assert (= (and d!136497 c!121459) b!1241549))

(assert (= (and d!136497 (not c!121459)) b!1241547))

(assert (= (and b!1241547 c!121460) b!1241546))

(assert (= (and b!1241547 (not c!121460)) b!1241548))

(assert (= (and d!136497 res!828180) b!1241550))

(declare-fun m!1144585 () Bool)

(assert (=> b!1241546 m!1144585))

(assert (=> b!1241546 m!1144585))

(declare-fun m!1144587 () Bool)

(assert (=> b!1241546 m!1144587))

(declare-fun m!1144589 () Bool)

(assert (=> d!136497 m!1144589))

(assert (=> d!136497 m!1144567))

(declare-fun m!1144591 () Bool)

(assert (=> b!1241550 m!1144591))

(assert (=> b!1241494 d!136497))

(declare-fun d!136503 () Bool)

(declare-fun res!828181 () Bool)

(declare-fun e!703732 () Bool)

(assert (=> d!136503 (=> res!828181 e!703732)))

(assert (=> d!136503 (= res!828181 (or ((_ is Nil!27347) l!644) ((_ is Nil!27347) (t!40813 l!644))))))

(assert (=> d!136503 (= (isStrictlySorted!749 l!644) e!703732)))

(declare-fun b!1241551 () Bool)

(declare-fun e!703733 () Bool)

(assert (=> b!1241551 (= e!703732 e!703733)))

(declare-fun res!828182 () Bool)

(assert (=> b!1241551 (=> (not res!828182) (not e!703733))))

(assert (=> b!1241551 (= res!828182 (bvslt (_1!10132 (h!28555 l!644)) (_1!10132 (h!28555 (t!40813 l!644)))))))

(declare-fun b!1241552 () Bool)

(assert (=> b!1241552 (= e!703733 (isStrictlySorted!749 (t!40813 l!644)))))

(assert (= (and d!136503 (not res!828181)) b!1241551))

(assert (= (and b!1241551 res!828182) b!1241552))

(declare-fun m!1144593 () Bool)

(assert (=> b!1241552 m!1144593))

(assert (=> b!1241492 d!136503))

(declare-fun b!1241562 () Bool)

(declare-fun e!703739 () Bool)

(declare-fun tp!92645 () Bool)

(assert (=> b!1241562 (= e!703739 (and tp_is_empty!31245 tp!92645))))

(assert (=> b!1241495 (= tp!92639 e!703739)))

(assert (= (and b!1241495 ((_ is Cons!27346) (t!40813 l!644))) b!1241562))

(check-sat (not b!1241546) (not b!1241552) (not b!1241562) tp_is_empty!31245 (not b!1241513) (not b!1241550) (not d!136497))
(check-sat)
