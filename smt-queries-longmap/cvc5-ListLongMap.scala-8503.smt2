; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103650 () Bool)

(assert start!103650)

(declare-fun res!828137 () Bool)

(declare-fun e!703686 () Bool)

(assert (=> start!103650 (=> (not res!828137) (not e!703686))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103650 (= res!828137 (not (= key1!25 key2!15)))))

(assert (=> start!103650 e!703686))

(assert (=> start!103650 true))

(declare-fun e!703685 () Bool)

(assert (=> start!103650 e!703685))

(declare-fun b!1241483 () Bool)

(declare-fun tp_is_empty!31243 () Bool)

(declare-fun tp!92636 () Bool)

(assert (=> b!1241483 (= e!703685 (and tp_is_empty!31243 tp!92636))))

(declare-fun b!1241480 () Bool)

(declare-fun res!828138 () Bool)

(assert (=> b!1241480 (=> (not res!828138) (not e!703686))))

(declare-datatypes ((B!1844 0))(
  ( (B!1845 (val!15684 Int)) )
))
(declare-datatypes ((tuple2!20240 0))(
  ( (tuple2!20241 (_1!10131 (_ BitVec 64)) (_2!10131 B!1844)) )
))
(declare-datatypes ((List!27349 0))(
  ( (Nil!27346) (Cons!27345 (h!28554 tuple2!20240) (t!40812 List!27349)) )
))
(declare-fun l!644 () List!27349)

(declare-fun isStrictlySorted!748 (List!27349) Bool)

(assert (=> b!1241480 (= res!828138 (isStrictlySorted!748 l!644))))

(declare-fun b!1241482 () Bool)

(declare-fun removeStrictlySorted!127 (List!27349 (_ BitVec 64)) List!27349)

(assert (=> b!1241482 (= e!703686 (not (isStrictlySorted!748 (removeStrictlySorted!127 l!644 key2!15))))))

(declare-fun b!1241481 () Bool)

(declare-fun res!828139 () Bool)

(assert (=> b!1241481 (=> (not res!828139) (not e!703686))))

(assert (=> b!1241481 (= res!828139 (not (is-Cons!27345 l!644)))))

(assert (= (and start!103650 res!828137) b!1241480))

(assert (= (and b!1241480 res!828138) b!1241481))

(assert (= (and b!1241481 res!828139) b!1241482))

(assert (= (and start!103650 (is-Cons!27345 l!644)) b!1241483))

(declare-fun m!1144561 () Bool)

(assert (=> b!1241480 m!1144561))

(declare-fun m!1144563 () Bool)

(assert (=> b!1241482 m!1144563))

(assert (=> b!1241482 m!1144563))

(declare-fun m!1144565 () Bool)

(assert (=> b!1241482 m!1144565))

(push 1)

(assert (not b!1241482))

(assert (not b!1241480))

(assert (not b!1241483))

(assert tp_is_empty!31243)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136493 () Bool)

(declare-fun res!828168 () Bool)

(declare-fun e!703709 () Bool)

(assert (=> d!136493 (=> res!828168 e!703709)))

(assert (=> d!136493 (= res!828168 (or (is-Nil!27346 (removeStrictlySorted!127 l!644 key2!15)) (is-Nil!27346 (t!40812 (removeStrictlySorted!127 l!644 key2!15)))))))

(assert (=> d!136493 (= (isStrictlySorted!748 (removeStrictlySorted!127 l!644 key2!15)) e!703709)))

(declare-fun b!1241518 () Bool)

(declare-fun e!703710 () Bool)

(assert (=> b!1241518 (= e!703709 e!703710)))

(declare-fun res!828169 () Bool)

(assert (=> b!1241518 (=> (not res!828169) (not e!703710))))

(assert (=> b!1241518 (= res!828169 (bvslt (_1!10131 (h!28554 (removeStrictlySorted!127 l!644 key2!15))) (_1!10131 (h!28554 (t!40812 (removeStrictlySorted!127 l!644 key2!15))))))))

(declare-fun b!1241519 () Bool)

(assert (=> b!1241519 (= e!703710 (isStrictlySorted!748 (t!40812 (removeStrictlySorted!127 l!644 key2!15))))))

(assert (= (and d!136493 (not res!828168)) b!1241518))

(assert (= (and b!1241518 res!828169) b!1241519))

(declare-fun m!1144581 () Bool)

(assert (=> b!1241519 m!1144581))

(assert (=> b!1241482 d!136493))

(declare-fun b!1241557 () Bool)

(declare-fun e!703738 () List!27349)

(assert (=> b!1241557 (= e!703738 Nil!27346)))

(declare-fun d!136499 () Bool)

(declare-fun e!703737 () Bool)

(assert (=> d!136499 e!703737))

(declare-fun res!828183 () Bool)

(assert (=> d!136499 (=> (not res!828183) (not e!703737))))

(declare-fun lt!562148 () List!27349)

(assert (=> d!136499 (= res!828183 (isStrictlySorted!748 lt!562148))))

(declare-fun e!703736 () List!27349)

(assert (=> d!136499 (= lt!562148 e!703736)))

(declare-fun c!121461 () Bool)

(assert (=> d!136499 (= c!121461 (and (is-Cons!27345 l!644) (= (_1!10131 (h!28554 l!644)) key2!15)))))

(assert (=> d!136499 (isStrictlySorted!748 l!644)))

(assert (=> d!136499 (= (removeStrictlySorted!127 l!644 key2!15) lt!562148)))

(declare-fun b!1241558 () Bool)

(assert (=> b!1241558 (= e!703736 e!703738)))

(declare-fun c!121462 () Bool)

(assert (=> b!1241558 (= c!121462 (and (is-Cons!27345 l!644) (not (= (_1!10131 (h!28554 l!644)) key2!15))))))

(declare-fun b!1241559 () Bool)

(declare-fun $colon$colon!621 (List!27349 tuple2!20240) List!27349)

(assert (=> b!1241559 (= e!703738 ($colon$colon!621 (removeStrictlySorted!127 (t!40812 l!644) key2!15) (h!28554 l!644)))))

(declare-fun b!1241560 () Bool)

(declare-fun containsKey!607 (List!27349 (_ BitVec 64)) Bool)

(assert (=> b!1241560 (= e!703737 (not (containsKey!607 lt!562148 key2!15)))))

(declare-fun b!1241561 () Bool)

(assert (=> b!1241561 (= e!703736 (t!40812 l!644))))

(assert (= (and d!136499 c!121461) b!1241561))

(assert (= (and d!136499 (not c!121461)) b!1241558))

(assert (= (and b!1241558 c!121462) b!1241559))

(assert (= (and b!1241558 (not c!121462)) b!1241557))

(assert (= (and d!136499 res!828183) b!1241560))

(declare-fun m!1144595 () Bool)

(assert (=> d!136499 m!1144595))

(assert (=> d!136499 m!1144561))

(declare-fun m!1144597 () Bool)

(assert (=> b!1241559 m!1144597))

(assert (=> b!1241559 m!1144597))

(declare-fun m!1144599 () Bool)

(assert (=> b!1241559 m!1144599))

(declare-fun m!1144601 () Bool)

(assert (=> b!1241560 m!1144601))

(assert (=> b!1241482 d!136499))

(declare-fun d!136505 () Bool)

(declare-fun res!828184 () Bool)

(declare-fun e!703740 () Bool)

(assert (=> d!136505 (=> res!828184 e!703740)))

(assert (=> d!136505 (= res!828184 (or (is-Nil!27346 l!644) (is-Nil!27346 (t!40812 l!644))))))

(assert (=> d!136505 (= (isStrictlySorted!748 l!644) e!703740)))

(declare-fun b!1241563 () Bool)

(declare-fun e!703741 () Bool)

(assert (=> b!1241563 (= e!703740 e!703741)))

(declare-fun res!828185 () Bool)

(assert (=> b!1241563 (=> (not res!828185) (not e!703741))))

(assert (=> b!1241563 (= res!828185 (bvslt (_1!10131 (h!28554 l!644)) (_1!10131 (h!28554 (t!40812 l!644)))))))

(declare-fun b!1241564 () Bool)

(assert (=> b!1241564 (= e!703741 (isStrictlySorted!748 (t!40812 l!644)))))

(assert (= (and d!136505 (not res!828184)) b!1241563))

(assert (= (and b!1241563 res!828185) b!1241564))

(declare-fun m!1144603 () Bool)

(assert (=> b!1241564 m!1144603))

(assert (=> b!1241480 d!136505))

(declare-fun b!1241569 () Bool)

(declare-fun e!703744 () Bool)

(declare-fun tp!92648 () Bool)

(assert (=> b!1241569 (= e!703744 (and tp_is_empty!31243 tp!92648))))

(assert (=> b!1241483 (= tp!92636 e!703744)))

(assert (= (and b!1241483 (is-Cons!27345 (t!40812 l!644))) b!1241569))

(push 1)

