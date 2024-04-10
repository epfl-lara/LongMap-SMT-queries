; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103746 () Bool)

(assert start!103746)

(declare-fun b!1242046 () Bool)

(declare-fun res!828415 () Bool)

(declare-fun e!704046 () Bool)

(assert (=> b!1242046 (=> (not res!828415) (not e!704046))))

(declare-datatypes ((B!1886 0))(
  ( (B!1887 (val!15705 Int)) )
))
(declare-datatypes ((tuple2!20282 0))(
  ( (tuple2!20283 (_1!10152 (_ BitVec 64)) (_2!10152 B!1886)) )
))
(declare-datatypes ((List!27370 0))(
  ( (Nil!27367) (Cons!27366 (h!28575 tuple2!20282) (t!40833 List!27370)) )
))
(declare-fun l!644 () List!27370)

(declare-fun isStrictlySorted!763 (List!27370) Bool)

(assert (=> b!1242046 (= res!828415 (isStrictlySorted!763 (t!40833 l!644)))))

(declare-fun b!1242047 () Bool)

(declare-fun res!828417 () Bool)

(assert (=> b!1242047 (=> (not res!828417) (not e!704046))))

(assert (=> b!1242047 (= res!828417 (is-Cons!27366 l!644))))

(declare-fun b!1242048 () Bool)

(declare-fun res!828416 () Bool)

(assert (=> b!1242048 (=> (not res!828416) (not e!704046))))

(assert (=> b!1242048 (= res!828416 (isStrictlySorted!763 l!644))))

(declare-fun b!1242049 () Bool)

(declare-fun e!704045 () Bool)

(declare-fun tp_is_empty!31285 () Bool)

(declare-fun tp!92744 () Bool)

(assert (=> b!1242049 (= e!704045 (and tp_is_empty!31285 tp!92744))))

(declare-fun res!828418 () Bool)

(assert (=> start!103746 (=> (not res!828418) (not e!704046))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103746 (= res!828418 (not (= key1!25 key2!15)))))

(assert (=> start!103746 e!704046))

(assert (=> start!103746 true))

(assert (=> start!103746 e!704045))

(assert (=> start!103746 tp_is_empty!31285))

(declare-fun v1!20 () B!1886)

(declare-fun b!1242050 () Bool)

(declare-fun insertStrictlySorted!437 (List!27370 (_ BitVec 64) B!1886) List!27370)

(declare-fun removeStrictlySorted!130 (List!27370 (_ BitVec 64)) List!27370)

(assert (=> b!1242050 (= e!704046 (not (= (insertStrictlySorted!437 (removeStrictlySorted!130 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!130 (insertStrictlySorted!437 l!644 key1!25 v1!20) key2!15))))))

(assert (=> b!1242050 (= (insertStrictlySorted!437 (removeStrictlySorted!130 (t!40833 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!130 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41261 0))(
  ( (Unit!41262) )
))
(declare-fun lt!562184 () Unit!41261)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!16 (List!27370 (_ BitVec 64) B!1886 (_ BitVec 64)) Unit!41261)

(assert (=> b!1242050 (= lt!562184 (lemmaInsertAndRemoveStrictlySortedCommutative!16 (t!40833 l!644) key1!25 v1!20 key2!15))))

(assert (= (and start!103746 res!828418) b!1242048))

(assert (= (and b!1242048 res!828416) b!1242047))

(assert (= (and b!1242047 res!828417) b!1242046))

(assert (= (and b!1242046 res!828415) b!1242050))

(assert (= (and start!103746 (is-Cons!27366 l!644)) b!1242049))

(declare-fun m!1144753 () Bool)

(assert (=> b!1242046 m!1144753))

(declare-fun m!1144755 () Bool)

(assert (=> b!1242048 m!1144755))

(declare-fun m!1144757 () Bool)

(assert (=> b!1242050 m!1144757))

(declare-fun m!1144759 () Bool)

(assert (=> b!1242050 m!1144759))

(assert (=> b!1242050 m!1144757))

(declare-fun m!1144761 () Bool)

(assert (=> b!1242050 m!1144761))

(declare-fun m!1144763 () Bool)

(assert (=> b!1242050 m!1144763))

(declare-fun m!1144765 () Bool)

(assert (=> b!1242050 m!1144765))

(assert (=> b!1242050 m!1144763))

(declare-fun m!1144767 () Bool)

(assert (=> b!1242050 m!1144767))

(declare-fun m!1144769 () Bool)

(assert (=> b!1242050 m!1144769))

(assert (=> b!1242050 m!1144767))

(assert (=> b!1242050 m!1144761))

(declare-fun m!1144771 () Bool)

(assert (=> b!1242050 m!1144771))

(declare-fun m!1144773 () Bool)

(assert (=> b!1242050 m!1144773))

(push 1)

(assert (not b!1242046))

(assert tp_is_empty!31285)

(assert (not b!1242048))

(assert (not b!1242050))

(assert (not b!1242049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1242106 () Bool)

(declare-fun e!704075 () Bool)

(declare-fun lt!562196 () List!27370)

(declare-fun containsKey!612 (List!27370 (_ BitVec 64)) Bool)

(assert (=> b!1242106 (= e!704075 (not (containsKey!612 lt!562196 key2!15)))))

(declare-fun d!136591 () Bool)

(assert (=> d!136591 e!704075))

(declare-fun res!828448 () Bool)

(assert (=> d!136591 (=> (not res!828448) (not e!704075))))

(assert (=> d!136591 (= res!828448 (isStrictlySorted!763 lt!562196))))

(declare-fun e!704074 () List!27370)

(assert (=> d!136591 (= lt!562196 e!704074)))

(declare-fun c!121537 () Bool)

(assert (=> d!136591 (= c!121537 (and (is-Cons!27366 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) (= (_1!10152 (h!28575 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136591 (isStrictlySorted!763 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))))

(assert (=> d!136591 (= (removeStrictlySorted!130 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20) key2!15) lt!562196)))

(declare-fun b!1242107 () Bool)

(declare-fun e!704076 () List!27370)

(assert (=> b!1242107 (= e!704076 Nil!27367)))

(declare-fun b!1242108 () Bool)

(declare-fun $colon$colon!626 (List!27370 tuple2!20282) List!27370)

(assert (=> b!1242108 (= e!704076 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) key2!15) (h!28575 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))))))

(declare-fun b!1242109 () Bool)

(assert (=> b!1242109 (= e!704074 e!704076)))

(declare-fun c!121536 () Bool)

(assert (=> b!1242109 (= c!121536 (and (is-Cons!27366 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) (not (= (_1!10152 (h!28575 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1242110 () Bool)

(assert (=> b!1242110 (= e!704074 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)))))

(assert (= (and d!136591 c!121537) b!1242110))

(assert (= (and d!136591 (not c!121537)) b!1242109))

(assert (= (and b!1242109 c!121536) b!1242108))

(assert (= (and b!1242109 (not c!121536)) b!1242107))

(assert (= (and d!136591 res!828448) b!1242106))

(declare-fun m!1144829 () Bool)

(assert (=> b!1242106 m!1144829))

(declare-fun m!1144831 () Bool)

(assert (=> d!136591 m!1144831))

(assert (=> d!136591 m!1144763))

(declare-fun m!1144833 () Bool)

(assert (=> d!136591 m!1144833))

(declare-fun m!1144835 () Bool)

(assert (=> b!1242108 m!1144835))

(assert (=> b!1242108 m!1144835))

(declare-fun m!1144837 () Bool)

(assert (=> b!1242108 m!1144837))

(assert (=> b!1242050 d!136591))

(declare-fun b!1242169 () Bool)

(declare-fun e!704113 () List!27370)

(declare-fun e!704111 () List!27370)

(assert (=> b!1242169 (= e!704113 e!704111)))

(declare-fun c!121561 () Bool)

(assert (=> b!1242169 (= c!121561 (and (is-Cons!27366 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (= (_1!10152 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) key1!25)))))

(declare-fun b!1242170 () Bool)

(declare-fun e!704110 () List!27370)

(declare-fun call!61290 () List!27370)

(assert (=> b!1242170 (= e!704110 call!61290)))

(declare-fun b!1242171 () Bool)

(declare-fun e!704112 () List!27370)

(assert (=> b!1242171 (= e!704112 (insertStrictlySorted!437 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) key1!25 v1!20))))

(declare-fun bm!61286 () Bool)

(declare-fun call!61291 () List!27370)

(assert (=> bm!61286 (= call!61290 call!61291)))

(declare-fun d!136595 () Bool)

(declare-fun e!704114 () Bool)

(assert (=> d!136595 e!704114))

(declare-fun res!828468 () Bool)

(assert (=> d!136595 (=> (not res!828468) (not e!704114))))

(declare-fun lt!562202 () List!27370)

(assert (=> d!136595 (= res!828468 (isStrictlySorted!763 lt!562202))))

(assert (=> d!136595 (= lt!562202 e!704113)))

(declare-fun c!121559 () Bool)

(assert (=> d!136595 (= c!121559 (and (is-Cons!27366 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (bvslt (_1!10152 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) key1!25)))))

(assert (=> d!136595 (isStrictlySorted!763 (removeStrictlySorted!130 (t!40833 l!644) key2!15))))

(assert (=> d!136595 (= (insertStrictlySorted!437 (removeStrictlySorted!130 (t!40833 l!644) key2!15) key1!25 v1!20) lt!562202)))

(declare-fun b!1242172 () Bool)

(declare-fun res!828467 () Bool)

(assert (=> b!1242172 (=> (not res!828467) (not e!704114))))

(assert (=> b!1242172 (= res!828467 (containsKey!612 lt!562202 key1!25))))

(declare-fun c!121558 () Bool)

(declare-fun b!1242173 () Bool)

(assert (=> b!1242173 (= c!121558 (and (is-Cons!27366 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (bvsgt (_1!10152 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) key1!25)))))

(assert (=> b!1242173 (= e!704111 e!704110)))

(declare-fun b!1242174 () Bool)

(assert (=> b!1242174 (= e!704110 call!61290)))

(declare-fun b!1242175 () Bool)

(assert (=> b!1242175 (= e!704111 call!61291)))

(declare-fun b!1242176 () Bool)

(declare-fun contains!7393 (List!27370 tuple2!20282) Bool)

(assert (=> b!1242176 (= e!704114 (contains!7393 lt!562202 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242177 () Bool)

(assert (=> b!1242177 (= e!704112 (ite c!121561 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (ite c!121558 (Cons!27366 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) Nil!27367)))))

(declare-fun bm!61287 () Bool)

(declare-fun call!61289 () List!27370)

(assert (=> bm!61287 (= call!61291 call!61289)))

(declare-fun b!1242178 () Bool)

(assert (=> b!1242178 (= e!704113 call!61289)))

(declare-fun bm!61288 () Bool)

(assert (=> bm!61288 (= call!61289 ($colon$colon!626 e!704112 (ite c!121559 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121560 () Bool)

(assert (=> bm!61288 (= c!121560 c!121559)))

(assert (= (and d!136595 c!121559) b!1242178))

(assert (= (and d!136595 (not c!121559)) b!1242169))

(assert (= (and b!1242169 c!121561) b!1242175))

(assert (= (and b!1242169 (not c!121561)) b!1242173))

(assert (= (and b!1242173 c!121558) b!1242174))

(assert (= (and b!1242173 (not c!121558)) b!1242170))

(assert (= (or b!1242174 b!1242170) bm!61286))

(assert (= (or b!1242175 bm!61286) bm!61287))

(assert (= (or b!1242178 bm!61287) bm!61288))

(assert (= (and bm!61288 c!121560) b!1242171))

(assert (= (and bm!61288 (not c!121560)) b!1242177))

(assert (= (and d!136595 res!828468) b!1242172))

(assert (= (and b!1242172 res!828467) b!1242176))

(declare-fun m!1144853 () Bool)

(assert (=> b!1242176 m!1144853))

(declare-fun m!1144855 () Bool)

(assert (=> b!1242172 m!1144855))

(declare-fun m!1144857 () Bool)

(assert (=> bm!61288 m!1144857))

(declare-fun m!1144859 () Bool)

(assert (=> d!136595 m!1144859))

(assert (=> d!136595 m!1144767))

(declare-fun m!1144861 () Bool)

(assert (=> d!136595 m!1144861))

(declare-fun m!1144863 () Bool)

(assert (=> b!1242171 m!1144863))

(assert (=> b!1242050 d!136595))

(declare-fun b!1242193 () Bool)

(declare-fun e!704125 () List!27370)

(declare-fun e!704123 () List!27370)

(assert (=> b!1242193 (= e!704125 e!704123)))

(declare-fun c!121571 () Bool)

(assert (=> b!1242193 (= c!121571 (and (is-Cons!27366 l!644) (= (_1!10152 (h!28575 l!644)) key1!25)))))

(declare-fun b!1242194 () Bool)

(declare-fun e!704122 () List!27370)

(declare-fun call!61296 () List!27370)

(assert (=> b!1242194 (= e!704122 call!61296)))

(declare-fun e!704124 () List!27370)

(declare-fun b!1242195 () Bool)

(assert (=> b!1242195 (= e!704124 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))))

(declare-fun bm!61292 () Bool)

(declare-fun call!61297 () List!27370)

(assert (=> bm!61292 (= call!61296 call!61297)))

(declare-fun d!136605 () Bool)

(declare-fun e!704126 () Bool)

(assert (=> d!136605 e!704126))

(declare-fun res!828472 () Bool)

(assert (=> d!136605 (=> (not res!828472) (not e!704126))))

(declare-fun lt!562206 () List!27370)

(assert (=> d!136605 (= res!828472 (isStrictlySorted!763 lt!562206))))

(assert (=> d!136605 (= lt!562206 e!704125)))

(declare-fun c!121569 () Bool)

(assert (=> d!136605 (= c!121569 (and (is-Cons!27366 l!644) (bvslt (_1!10152 (h!28575 l!644)) key1!25)))))

(assert (=> d!136605 (isStrictlySorted!763 l!644)))

(assert (=> d!136605 (= (insertStrictlySorted!437 l!644 key1!25 v1!20) lt!562206)))

(declare-fun b!1242196 () Bool)

(declare-fun res!828471 () Bool)

(assert (=> b!1242196 (=> (not res!828471) (not e!704126))))

(assert (=> b!1242196 (= res!828471 (containsKey!612 lt!562206 key1!25))))

(declare-fun b!1242197 () Bool)

(declare-fun c!121568 () Bool)

(assert (=> b!1242197 (= c!121568 (and (is-Cons!27366 l!644) (bvsgt (_1!10152 (h!28575 l!644)) key1!25)))))

(assert (=> b!1242197 (= e!704123 e!704122)))

(declare-fun b!1242198 () Bool)

(assert (=> b!1242198 (= e!704122 call!61296)))

(declare-fun b!1242199 () Bool)

(assert (=> b!1242199 (= e!704123 call!61297)))

(declare-fun b!1242200 () Bool)

(assert (=> b!1242200 (= e!704126 (contains!7393 lt!562206 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242201 () Bool)

(assert (=> b!1242201 (= e!704124 (ite c!121571 (t!40833 l!644) (ite c!121568 (Cons!27366 (h!28575 l!644) (t!40833 l!644)) Nil!27367)))))

(declare-fun bm!61293 () Bool)

(declare-fun call!61295 () List!27370)

(assert (=> bm!61293 (= call!61297 call!61295)))

(declare-fun b!1242202 () Bool)

(assert (=> b!1242202 (= e!704125 call!61295)))

(declare-fun bm!61294 () Bool)

(assert (=> bm!61294 (= call!61295 ($colon$colon!626 e!704124 (ite c!121569 (h!28575 l!644) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121570 () Bool)

(assert (=> bm!61294 (= c!121570 c!121569)))

(assert (= (and d!136605 c!121569) b!1242202))

(assert (= (and d!136605 (not c!121569)) b!1242193))

(assert (= (and b!1242193 c!121571) b!1242199))

(assert (= (and b!1242193 (not c!121571)) b!1242197))

(assert (= (and b!1242197 c!121568) b!1242198))

(assert (= (and b!1242197 (not c!121568)) b!1242194))

(assert (= (or b!1242198 b!1242194) bm!61292))

(assert (= (or b!1242199 bm!61292) bm!61293))

(assert (= (or b!1242202 bm!61293) bm!61294))

(assert (= (and bm!61294 c!121570) b!1242195))

(assert (= (and bm!61294 (not c!121570)) b!1242201))

(assert (= (and d!136605 res!828472) b!1242196))

(assert (= (and b!1242196 res!828471) b!1242200))

(declare-fun m!1144873 () Bool)

(assert (=> b!1242200 m!1144873))

(declare-fun m!1144875 () Bool)

(assert (=> b!1242196 m!1144875))

(declare-fun m!1144877 () Bool)

(assert (=> bm!61294 m!1144877))

(declare-fun m!1144879 () Bool)

(assert (=> d!136605 m!1144879))

(assert (=> d!136605 m!1144755))

(assert (=> b!1242195 m!1144763))

(assert (=> b!1242050 d!136605))

(declare-fun b!1242217 () Bool)

(declare-fun e!704137 () List!27370)

(declare-fun e!704135 () List!27370)

(assert (=> b!1242217 (= e!704137 e!704135)))

(declare-fun c!121581 () Bool)

(assert (=> b!1242217 (= c!121581 (and (is-Cons!27366 (removeStrictlySorted!130 l!644 key2!15)) (= (_1!10152 (h!28575 (removeStrictlySorted!130 l!644 key2!15))) key1!25)))))

(declare-fun b!1242218 () Bool)

(declare-fun e!704134 () List!27370)

(declare-fun call!61302 () List!27370)

(assert (=> b!1242218 (= e!704134 call!61302)))

(declare-fun e!704136 () List!27370)

(declare-fun b!1242219 () Bool)

(assert (=> b!1242219 (= e!704136 (insertStrictlySorted!437 (t!40833 (removeStrictlySorted!130 l!644 key2!15)) key1!25 v1!20))))

(declare-fun bm!61298 () Bool)

(declare-fun call!61303 () List!27370)

(assert (=> bm!61298 (= call!61302 call!61303)))

(declare-fun d!136609 () Bool)

(declare-fun e!704138 () Bool)

(assert (=> d!136609 e!704138))

(declare-fun res!828476 () Bool)

(assert (=> d!136609 (=> (not res!828476) (not e!704138))))

(declare-fun lt!562208 () List!27370)

(assert (=> d!136609 (= res!828476 (isStrictlySorted!763 lt!562208))))

(assert (=> d!136609 (= lt!562208 e!704137)))

(declare-fun c!121579 () Bool)

(assert (=> d!136609 (= c!121579 (and (is-Cons!27366 (removeStrictlySorted!130 l!644 key2!15)) (bvslt (_1!10152 (h!28575 (removeStrictlySorted!130 l!644 key2!15))) key1!25)))))

(assert (=> d!136609 (isStrictlySorted!763 (removeStrictlySorted!130 l!644 key2!15))))

(assert (=> d!136609 (= (insertStrictlySorted!437 (removeStrictlySorted!130 l!644 key2!15) key1!25 v1!20) lt!562208)))

(declare-fun b!1242220 () Bool)

(declare-fun res!828475 () Bool)

(assert (=> b!1242220 (=> (not res!828475) (not e!704138))))

(assert (=> b!1242220 (= res!828475 (containsKey!612 lt!562208 key1!25))))

(declare-fun b!1242221 () Bool)

(declare-fun c!121578 () Bool)

(assert (=> b!1242221 (= c!121578 (and (is-Cons!27366 (removeStrictlySorted!130 l!644 key2!15)) (bvsgt (_1!10152 (h!28575 (removeStrictlySorted!130 l!644 key2!15))) key1!25)))))

(assert (=> b!1242221 (= e!704135 e!704134)))

(declare-fun b!1242222 () Bool)

(assert (=> b!1242222 (= e!704134 call!61302)))

(declare-fun b!1242223 () Bool)

(assert (=> b!1242223 (= e!704135 call!61303)))

(declare-fun b!1242224 () Bool)

(assert (=> b!1242224 (= e!704138 (contains!7393 lt!562208 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242225 () Bool)

(assert (=> b!1242225 (= e!704136 (ite c!121581 (t!40833 (removeStrictlySorted!130 l!644 key2!15)) (ite c!121578 (Cons!27366 (h!28575 (removeStrictlySorted!130 l!644 key2!15)) (t!40833 (removeStrictlySorted!130 l!644 key2!15))) Nil!27367)))))

(declare-fun bm!61299 () Bool)

(declare-fun call!61301 () List!27370)

(assert (=> bm!61299 (= call!61303 call!61301)))

(declare-fun b!1242226 () Bool)

(assert (=> b!1242226 (= e!704137 call!61301)))

(declare-fun bm!61300 () Bool)

(assert (=> bm!61300 (= call!61301 ($colon$colon!626 e!704136 (ite c!121579 (h!28575 (removeStrictlySorted!130 l!644 key2!15)) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121580 () Bool)

(assert (=> bm!61300 (= c!121580 c!121579)))

(assert (= (and d!136609 c!121579) b!1242226))

(assert (= (and d!136609 (not c!121579)) b!1242217))

(assert (= (and b!1242217 c!121581) b!1242223))

(assert (= (and b!1242217 (not c!121581)) b!1242221))

(assert (= (and b!1242221 c!121578) b!1242222))

(assert (= (and b!1242221 (not c!121578)) b!1242218))

(assert (= (or b!1242222 b!1242218) bm!61298))

(assert (= (or b!1242223 bm!61298) bm!61299))

(assert (= (or b!1242226 bm!61299) bm!61300))

(assert (= (and bm!61300 c!121580) b!1242219))

(assert (= (and bm!61300 (not c!121580)) b!1242225))

(assert (= (and d!136609 res!828476) b!1242220))

(assert (= (and b!1242220 res!828475) b!1242224))

(declare-fun m!1144893 () Bool)

(assert (=> b!1242224 m!1144893))

(declare-fun m!1144895 () Bool)

(assert (=> b!1242220 m!1144895))

(declare-fun m!1144897 () Bool)

(assert (=> bm!61300 m!1144897))

(declare-fun m!1144899 () Bool)

(assert (=> d!136609 m!1144899))

(assert (=> d!136609 m!1144757))

(declare-fun m!1144901 () Bool)

(assert (=> d!136609 m!1144901))

(declare-fun m!1144903 () Bool)

(assert (=> b!1242219 m!1144903))

(assert (=> b!1242050 d!136609))

(declare-fun b!1242234 () Bool)

(declare-fun e!704145 () Bool)

(declare-fun lt!562210 () List!27370)

(assert (=> b!1242234 (= e!704145 (not (containsKey!612 lt!562210 key2!15)))))

(declare-fun d!136613 () Bool)

(assert (=> d!136613 e!704145))

(declare-fun res!828480 () Bool)

(assert (=> d!136613 (=> (not res!828480) (not e!704145))))

(assert (=> d!136613 (= res!828480 (isStrictlySorted!763 lt!562210))))

(declare-fun e!704144 () List!27370)

(assert (=> d!136613 (= lt!562210 e!704144)))

(declare-fun c!121585 () Bool)

(assert (=> d!136613 (= c!121585 (and (is-Cons!27366 l!644) (= (_1!10152 (h!28575 l!644)) key2!15)))))

(assert (=> d!136613 (isStrictlySorted!763 l!644)))

(assert (=> d!136613 (= (removeStrictlySorted!130 l!644 key2!15) lt!562210)))

(declare-fun b!1242235 () Bool)

(declare-fun e!704146 () List!27370)

(assert (=> b!1242235 (= e!704146 Nil!27367)))

(declare-fun b!1242236 () Bool)

(assert (=> b!1242236 (= e!704146 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 l!644) key2!15) (h!28575 l!644)))))

(declare-fun b!1242237 () Bool)

(assert (=> b!1242237 (= e!704144 e!704146)))

(declare-fun c!121584 () Bool)

(assert (=> b!1242237 (= c!121584 (and (is-Cons!27366 l!644) (not (= (_1!10152 (h!28575 l!644)) key2!15))))))

(declare-fun b!1242238 () Bool)

(assert (=> b!1242238 (= e!704144 (t!40833 l!644))))

(assert (= (and d!136613 c!121585) b!1242238))

(assert (= (and d!136613 (not c!121585)) b!1242237))

(assert (= (and b!1242237 c!121584) b!1242236))

(assert (= (and b!1242237 (not c!121584)) b!1242235))

(assert (= (and d!136613 res!828480) b!1242234))

(declare-fun m!1144911 () Bool)

(assert (=> b!1242234 m!1144911))

(declare-fun m!1144913 () Bool)

(assert (=> d!136613 m!1144913))

(assert (=> d!136613 m!1144755))

(assert (=> b!1242236 m!1144767))

(assert (=> b!1242236 m!1144767))

(declare-fun m!1144915 () Bool)

(assert (=> b!1242236 m!1144915))

(assert (=> b!1242050 d!136613))

(declare-fun d!136617 () Bool)

(assert (=> d!136617 (= (insertStrictlySorted!437 (removeStrictlySorted!130 (t!40833 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!130 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562217 () Unit!41261)

(declare-fun choose!1840 (List!27370 (_ BitVec 64) B!1886 (_ BitVec 64)) Unit!41261)

(assert (=> d!136617 (= lt!562217 (choose!1840 (t!40833 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136617 (not (= key1!25 key2!15))))

(assert (=> d!136617 (= (lemmaInsertAndRemoveStrictlySortedCommutative!16 (t!40833 l!644) key1!25 v1!20 key2!15) lt!562217)))

(declare-fun bs!34977 () Bool)

(assert (= bs!34977 d!136617))

(assert (=> bs!34977 m!1144763))

(assert (=> bs!34977 m!1144767))

(declare-fun m!1144923 () Bool)

(assert (=> bs!34977 m!1144923))

(assert (=> bs!34977 m!1144767))

(assert (=> bs!34977 m!1144769))

(assert (=> bs!34977 m!1144763))

(assert (=> bs!34977 m!1144765))

(assert (=> b!1242050 d!136617))

(declare-fun b!1242254 () Bool)

(declare-fun e!704158 () List!27370)

(declare-fun e!704156 () List!27370)

(assert (=> b!1242254 (= e!704158 e!704156)))

(declare-fun c!121595 () Bool)

(assert (=> b!1242254 (= c!121595 (and (is-Cons!27366 (t!40833 l!644)) (= (_1!10152 (h!28575 (t!40833 l!644))) key1!25)))))

(declare-fun b!1242255 () Bool)

(declare-fun e!704155 () List!27370)

(declare-fun call!61308 () List!27370)

(assert (=> b!1242255 (= e!704155 call!61308)))

(declare-fun b!1242256 () Bool)

(declare-fun e!704157 () List!27370)

(assert (=> b!1242256 (= e!704157 (insertStrictlySorted!437 (t!40833 (t!40833 l!644)) key1!25 v1!20))))

(declare-fun bm!61304 () Bool)

(declare-fun call!61309 () List!27370)

(assert (=> bm!61304 (= call!61308 call!61309)))

(declare-fun d!136621 () Bool)

(declare-fun e!704159 () Bool)

(assert (=> d!136621 e!704159))

(declare-fun res!828485 () Bool)

(assert (=> d!136621 (=> (not res!828485) (not e!704159))))

(declare-fun lt!562219 () List!27370)

(assert (=> d!136621 (= res!828485 (isStrictlySorted!763 lt!562219))))

(assert (=> d!136621 (= lt!562219 e!704158)))

(declare-fun c!121593 () Bool)

(assert (=> d!136621 (= c!121593 (and (is-Cons!27366 (t!40833 l!644)) (bvslt (_1!10152 (h!28575 (t!40833 l!644))) key1!25)))))

(assert (=> d!136621 (isStrictlySorted!763 (t!40833 l!644))))

(assert (=> d!136621 (= (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20) lt!562219)))

(declare-fun b!1242257 () Bool)

(declare-fun res!828484 () Bool)

(assert (=> b!1242257 (=> (not res!828484) (not e!704159))))

(assert (=> b!1242257 (= res!828484 (containsKey!612 lt!562219 key1!25))))

(declare-fun b!1242258 () Bool)

(declare-fun c!121592 () Bool)

(assert (=> b!1242258 (= c!121592 (and (is-Cons!27366 (t!40833 l!644)) (bvsgt (_1!10152 (h!28575 (t!40833 l!644))) key1!25)))))

(assert (=> b!1242258 (= e!704156 e!704155)))

(declare-fun b!1242259 () Bool)

(assert (=> b!1242259 (= e!704155 call!61308)))

(declare-fun b!1242260 () Bool)

(assert (=> b!1242260 (= e!704156 call!61309)))

(declare-fun b!1242261 () Bool)

(assert (=> b!1242261 (= e!704159 (contains!7393 lt!562219 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242262 () Bool)

(assert (=> b!1242262 (= e!704157 (ite c!121595 (t!40833 (t!40833 l!644)) (ite c!121592 (Cons!27366 (h!28575 (t!40833 l!644)) (t!40833 (t!40833 l!644))) Nil!27367)))))

(declare-fun bm!61305 () Bool)

(declare-fun call!61307 () List!27370)

(assert (=> bm!61305 (= call!61309 call!61307)))

(declare-fun b!1242263 () Bool)

(assert (=> b!1242263 (= e!704158 call!61307)))

(declare-fun bm!61306 () Bool)

(assert (=> bm!61306 (= call!61307 ($colon$colon!626 e!704157 (ite c!121593 (h!28575 (t!40833 l!644)) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121594 () Bool)

(assert (=> bm!61306 (= c!121594 c!121593)))

(assert (= (and d!136621 c!121593) b!1242263))

(assert (= (and d!136621 (not c!121593)) b!1242254))

(assert (= (and b!1242254 c!121595) b!1242260))

(assert (= (and b!1242254 (not c!121595)) b!1242258))

(assert (= (and b!1242258 c!121592) b!1242259))

(assert (= (and b!1242258 (not c!121592)) b!1242255))

(assert (= (or b!1242259 b!1242255) bm!61304))

(assert (= (or b!1242260 bm!61304) bm!61305))

(assert (= (or b!1242263 bm!61305) bm!61306))

(assert (= (and bm!61306 c!121594) b!1242256))

(assert (= (and bm!61306 (not c!121594)) b!1242262))

(assert (= (and d!136621 res!828485) b!1242257))

(assert (= (and b!1242257 res!828484) b!1242261))

(declare-fun m!1144941 () Bool)

(assert (=> b!1242261 m!1144941))

(declare-fun m!1144943 () Bool)

(assert (=> b!1242257 m!1144943))

(declare-fun m!1144945 () Bool)

(assert (=> bm!61306 m!1144945))

(declare-fun m!1144947 () Bool)

(assert (=> d!136621 m!1144947))

(assert (=> d!136621 m!1144753))

(declare-fun m!1144949 () Bool)

(assert (=> b!1242256 m!1144949))

(assert (=> b!1242050 d!136621))

(declare-fun b!1242269 () Bool)

(declare-fun e!704164 () Bool)

(declare-fun lt!562221 () List!27370)

(assert (=> b!1242269 (= e!704164 (not (containsKey!612 lt!562221 key2!15)))))

(declare-fun d!136627 () Bool)

(assert (=> d!136627 e!704164))

(declare-fun res!828487 () Bool)

(assert (=> d!136627 (=> (not res!828487) (not e!704164))))

(assert (=> d!136627 (= res!828487 (isStrictlySorted!763 lt!562221))))

(declare-fun e!704163 () List!27370)

(assert (=> d!136627 (= lt!562221 e!704163)))

(declare-fun c!121599 () Bool)

(assert (=> d!136627 (= c!121599 (and (is-Cons!27366 (insertStrictlySorted!437 l!644 key1!25 v1!20)) (= (_1!10152 (h!28575 (insertStrictlySorted!437 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136627 (isStrictlySorted!763 (insertStrictlySorted!437 l!644 key1!25 v1!20))))

(assert (=> d!136627 (= (removeStrictlySorted!130 (insertStrictlySorted!437 l!644 key1!25 v1!20) key2!15) lt!562221)))

(declare-fun b!1242270 () Bool)

(declare-fun e!704165 () List!27370)

(assert (=> b!1242270 (= e!704165 Nil!27367)))

(declare-fun b!1242271 () Bool)

(assert (=> b!1242271 (= e!704165 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)) key2!15) (h!28575 (insertStrictlySorted!437 l!644 key1!25 v1!20))))))

(declare-fun b!1242272 () Bool)

(assert (=> b!1242272 (= e!704163 e!704165)))

(declare-fun c!121598 () Bool)

(assert (=> b!1242272 (= c!121598 (and (is-Cons!27366 (insertStrictlySorted!437 l!644 key1!25 v1!20)) (not (= (_1!10152 (h!28575 (insertStrictlySorted!437 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1242273 () Bool)

(assert (=> b!1242273 (= e!704163 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)))))

(assert (= (and d!136627 c!121599) b!1242273))

(assert (= (and d!136627 (not c!121599)) b!1242272))

(assert (= (and b!1242272 c!121598) b!1242271))

(assert (= (and b!1242272 (not c!121598)) b!1242270))

(assert (= (and d!136627 res!828487) b!1242269))

(declare-fun m!1144961 () Bool)

(assert (=> b!1242269 m!1144961))

(declare-fun m!1144963 () Bool)

(assert (=> d!136627 m!1144963))

(assert (=> d!136627 m!1144761))

(declare-fun m!1144965 () Bool)

(assert (=> d!136627 m!1144965))

(declare-fun m!1144967 () Bool)

(assert (=> b!1242271 m!1144967))

(assert (=> b!1242271 m!1144967))

(declare-fun m!1144969 () Bool)

(assert (=> b!1242271 m!1144969))

(assert (=> b!1242050 d!136627))

(declare-fun b!1242279 () Bool)

(declare-fun e!704170 () Bool)

(declare-fun lt!562223 () List!27370)

(assert (=> b!1242279 (= e!704170 (not (containsKey!612 lt!562223 key2!15)))))

(declare-fun d!136631 () Bool)

(assert (=> d!136631 e!704170))

(declare-fun res!828489 () Bool)

(assert (=> d!136631 (=> (not res!828489) (not e!704170))))

(assert (=> d!136631 (= res!828489 (isStrictlySorted!763 lt!562223))))

(declare-fun e!704169 () List!27370)

(assert (=> d!136631 (= lt!562223 e!704169)))

(declare-fun c!121603 () Bool)

(assert (=> d!136631 (= c!121603 (and (is-Cons!27366 (t!40833 l!644)) (= (_1!10152 (h!28575 (t!40833 l!644))) key2!15)))))

(assert (=> d!136631 (isStrictlySorted!763 (t!40833 l!644))))

(assert (=> d!136631 (= (removeStrictlySorted!130 (t!40833 l!644) key2!15) lt!562223)))

(declare-fun b!1242280 () Bool)

(declare-fun e!704171 () List!27370)

(assert (=> b!1242280 (= e!704171 Nil!27367)))

(declare-fun b!1242281 () Bool)

(assert (=> b!1242281 (= e!704171 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (t!40833 l!644)) key2!15) (h!28575 (t!40833 l!644))))))

(declare-fun b!1242282 () Bool)

(assert (=> b!1242282 (= e!704169 e!704171)))

(declare-fun c!121602 () Bool)

(assert (=> b!1242282 (= c!121602 (and (is-Cons!27366 (t!40833 l!644)) (not (= (_1!10152 (h!28575 (t!40833 l!644))) key2!15))))))

(declare-fun b!1242283 () Bool)

(assert (=> b!1242283 (= e!704169 (t!40833 (t!40833 l!644)))))

(assert (= (and d!136631 c!121603) b!1242283))

(assert (= (and d!136631 (not c!121603)) b!1242282))

(assert (= (and b!1242282 c!121602) b!1242281))

(assert (= (and b!1242282 (not c!121602)) b!1242280))

(assert (= (and d!136631 res!828489) b!1242279))

(declare-fun m!1144979 () Bool)

(assert (=> b!1242279 m!1144979))

(declare-fun m!1144981 () Bool)

(assert (=> d!136631 m!1144981))

(assert (=> d!136631 m!1144753))

(declare-fun m!1144983 () Bool)

(assert (=> b!1242281 m!1144983))

(assert (=> b!1242281 m!1144983))

(declare-fun m!1144985 () Bool)

(assert (=> b!1242281 m!1144985))

(assert (=> b!1242050 d!136631))

(declare-fun d!136635 () Bool)

(declare-fun res!828500 () Bool)

(declare-fun e!704182 () Bool)

(assert (=> d!136635 (=> res!828500 e!704182)))

(assert (=> d!136635 (= res!828500 (or (is-Nil!27367 (t!40833 l!644)) (is-Nil!27367 (t!40833 (t!40833 l!644)))))))

(assert (=> d!136635 (= (isStrictlySorted!763 (t!40833 l!644)) e!704182)))

(declare-fun b!1242294 () Bool)

(declare-fun e!704183 () Bool)

(assert (=> b!1242294 (= e!704182 e!704183)))

(declare-fun res!828501 () Bool)

(assert (=> b!1242294 (=> (not res!828501) (not e!704183))))

(assert (=> b!1242294 (= res!828501 (bvslt (_1!10152 (h!28575 (t!40833 l!644))) (_1!10152 (h!28575 (t!40833 (t!40833 l!644))))))))

(declare-fun b!1242295 () Bool)

(assert (=> b!1242295 (= e!704183 (isStrictlySorted!763 (t!40833 (t!40833 l!644))))))

(assert (= (and d!136635 (not res!828500)) b!1242294))

(assert (= (and b!1242294 res!828501) b!1242295))

(declare-fun m!1144987 () Bool)

(assert (=> b!1242295 m!1144987))

(assert (=> b!1242046 d!136635))

(declare-fun d!136639 () Bool)

(declare-fun res!828504 () Bool)

(declare-fun e!704186 () Bool)

(assert (=> d!136639 (=> res!828504 e!704186)))

(assert (=> d!136639 (= res!828504 (or (is-Nil!27367 l!644) (is-Nil!27367 (t!40833 l!644))))))

(assert (=> d!136639 (= (isStrictlySorted!763 l!644) e!704186)))

(declare-fun b!1242298 () Bool)

(declare-fun e!704187 () Bool)

(assert (=> b!1242298 (= e!704186 e!704187)))

(declare-fun res!828505 () Bool)

(assert (=> b!1242298 (=> (not res!828505) (not e!704187))))

(assert (=> b!1242298 (= res!828505 (bvslt (_1!10152 (h!28575 l!644)) (_1!10152 (h!28575 (t!40833 l!644)))))))

(declare-fun b!1242299 () Bool)

(assert (=> b!1242299 (= e!704187 (isStrictlySorted!763 (t!40833 l!644)))))

(assert (= (and d!136639 (not res!828504)) b!1242298))

(assert (= (and b!1242298 res!828505) b!1242299))

(assert (=> b!1242299 m!1144753))

(assert (=> b!1242048 d!136639))

(declare-fun b!1242309 () Bool)

(declare-fun e!704193 () Bool)

(declare-fun tp!92756 () Bool)

(assert (=> b!1242309 (= e!704193 (and tp_is_empty!31285 tp!92756))))

(assert (=> b!1242049 (= tp!92744 e!704193)))

(assert (= (and b!1242049 (is-Cons!27366 (t!40833 l!644))) b!1242309))

(push 1)

(assert (not b!1242236))

(assert (not b!1242281))

(assert (not d!136613))

(assert (not b!1242176))

(assert (not b!1242219))

(assert (not d!136617))

(assert (not d!136591))

(assert (not b!1242224))

(assert (not b!1242295))

(assert (not b!1242220))

(assert (not b!1242269))

(assert (not d!136621))

(assert (not b!1242257))

(assert (not bm!61288))

(assert (not d!136595))

(assert (not b!1242171))

(assert (not bm!61300))

(assert (not bm!61294))

(assert (not b!1242195))

(assert (not b!1242261))

(assert (not b!1242200))

(assert (not b!1242234))

(assert tp_is_empty!31285)

(assert (not b!1242106))

(assert (not b!1242309))

(assert (not d!136627))

(assert (not bm!61306))

(assert (not b!1242256))

(assert (not b!1242196))

(assert (not b!1242271))

(assert (not b!1242108))

(assert (not b!1242279))

(assert (not d!136605))

(assert (not d!136609))

(assert (not b!1242299))

(assert (not d!136631))

(assert (not b!1242172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136735 () Bool)

(declare-fun res!828592 () Bool)

(declare-fun e!704323 () Bool)

(assert (=> d!136735 (=> res!828592 e!704323)))

(assert (=> d!136735 (= res!828592 (and (is-Cons!27366 lt!562196) (= (_1!10152 (h!28575 lt!562196)) key2!15)))))

(assert (=> d!136735 (= (containsKey!612 lt!562196 key2!15) e!704323)))

(declare-fun b!1242498 () Bool)

(declare-fun e!704324 () Bool)

(assert (=> b!1242498 (= e!704323 e!704324)))

(declare-fun res!828593 () Bool)

(assert (=> b!1242498 (=> (not res!828593) (not e!704324))))

(assert (=> b!1242498 (= res!828593 (and (or (not (is-Cons!27366 lt!562196)) (bvsle (_1!10152 (h!28575 lt!562196)) key2!15)) (is-Cons!27366 lt!562196) (bvslt (_1!10152 (h!28575 lt!562196)) key2!15)))))

(declare-fun b!1242499 () Bool)

(assert (=> b!1242499 (= e!704324 (containsKey!612 (t!40833 lt!562196) key2!15))))

(assert (= (and d!136735 (not res!828592)) b!1242498))

(assert (= (and b!1242498 res!828593) b!1242499))

(declare-fun m!1145179 () Bool)

(assert (=> b!1242499 m!1145179))

(assert (=> b!1242106 d!136735))

(declare-fun d!136737 () Bool)

(declare-fun res!828594 () Bool)

(declare-fun e!704325 () Bool)

(assert (=> d!136737 (=> res!828594 e!704325)))

(assert (=> d!136737 (= res!828594 (or (is-Nil!27367 lt!562221) (is-Nil!27367 (t!40833 lt!562221))))))

(assert (=> d!136737 (= (isStrictlySorted!763 lt!562221) e!704325)))

(declare-fun b!1242500 () Bool)

(declare-fun e!704326 () Bool)

(assert (=> b!1242500 (= e!704325 e!704326)))

(declare-fun res!828595 () Bool)

(assert (=> b!1242500 (=> (not res!828595) (not e!704326))))

(assert (=> b!1242500 (= res!828595 (bvslt (_1!10152 (h!28575 lt!562221)) (_1!10152 (h!28575 (t!40833 lt!562221)))))))

(declare-fun b!1242501 () Bool)

(assert (=> b!1242501 (= e!704326 (isStrictlySorted!763 (t!40833 lt!562221)))))

(assert (= (and d!136737 (not res!828594)) b!1242500))

(assert (= (and b!1242500 res!828595) b!1242501))

(declare-fun m!1145181 () Bool)

(assert (=> b!1242501 m!1145181))

(assert (=> d!136627 d!136737))

(declare-fun d!136739 () Bool)

(declare-fun res!828596 () Bool)

(declare-fun e!704327 () Bool)

(assert (=> d!136739 (=> res!828596 e!704327)))

(assert (=> d!136739 (= res!828596 (or (is-Nil!27367 (insertStrictlySorted!437 l!644 key1!25 v1!20)) (is-Nil!27367 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)))))))

(assert (=> d!136739 (= (isStrictlySorted!763 (insertStrictlySorted!437 l!644 key1!25 v1!20)) e!704327)))

(declare-fun b!1242502 () Bool)

(declare-fun e!704328 () Bool)

(assert (=> b!1242502 (= e!704327 e!704328)))

(declare-fun res!828597 () Bool)

(assert (=> b!1242502 (=> (not res!828597) (not e!704328))))

(assert (=> b!1242502 (= res!828597 (bvslt (_1!10152 (h!28575 (insertStrictlySorted!437 l!644 key1!25 v1!20))) (_1!10152 (h!28575 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20))))))))

(declare-fun b!1242503 () Bool)

(assert (=> b!1242503 (= e!704328 (isStrictlySorted!763 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20))))))

(assert (= (and d!136739 (not res!828596)) b!1242502))

(assert (= (and b!1242502 res!828597) b!1242503))

(declare-fun m!1145183 () Bool)

(assert (=> b!1242503 m!1145183))

(assert (=> d!136627 d!136739))

(declare-fun lt!562250 () Bool)

(declare-fun d!136741 () Bool)

(declare-fun content!603 (List!27370) (Set tuple2!20282))

(assert (=> d!136741 (= lt!562250 (set.member (tuple2!20283 key1!25 v1!20) (content!603 lt!562202)))))

(declare-fun e!704334 () Bool)

(assert (=> d!136741 (= lt!562250 e!704334)))

(declare-fun res!828602 () Bool)

(assert (=> d!136741 (=> (not res!828602) (not e!704334))))

(assert (=> d!136741 (= res!828602 (is-Cons!27366 lt!562202))))

(assert (=> d!136741 (= (contains!7393 lt!562202 (tuple2!20283 key1!25 v1!20)) lt!562250)))

(declare-fun b!1242508 () Bool)

(declare-fun e!704333 () Bool)

(assert (=> b!1242508 (= e!704334 e!704333)))

(declare-fun res!828603 () Bool)

(assert (=> b!1242508 (=> res!828603 e!704333)))

(assert (=> b!1242508 (= res!828603 (= (h!28575 lt!562202) (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242509 () Bool)

(assert (=> b!1242509 (= e!704333 (contains!7393 (t!40833 lt!562202) (tuple2!20283 key1!25 v1!20)))))

(assert (= (and d!136741 res!828602) b!1242508))

(assert (= (and b!1242508 (not res!828603)) b!1242509))

(declare-fun m!1145185 () Bool)

(assert (=> d!136741 m!1145185))

(declare-fun m!1145187 () Bool)

(assert (=> d!136741 m!1145187))

(declare-fun m!1145189 () Bool)

(assert (=> b!1242509 m!1145189))

(assert (=> b!1242176 d!136741))

(declare-fun lt!562251 () Bool)

(declare-fun d!136743 () Bool)

(assert (=> d!136743 (= lt!562251 (set.member (tuple2!20283 key1!25 v1!20) (content!603 lt!562219)))))

(declare-fun e!704336 () Bool)

(assert (=> d!136743 (= lt!562251 e!704336)))

(declare-fun res!828604 () Bool)

(assert (=> d!136743 (=> (not res!828604) (not e!704336))))

(assert (=> d!136743 (= res!828604 (is-Cons!27366 lt!562219))))

(assert (=> d!136743 (= (contains!7393 lt!562219 (tuple2!20283 key1!25 v1!20)) lt!562251)))

(declare-fun b!1242510 () Bool)

(declare-fun e!704335 () Bool)

(assert (=> b!1242510 (= e!704336 e!704335)))

(declare-fun res!828605 () Bool)

(assert (=> b!1242510 (=> res!828605 e!704335)))

(assert (=> b!1242510 (= res!828605 (= (h!28575 lt!562219) (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242511 () Bool)

(assert (=> b!1242511 (= e!704335 (contains!7393 (t!40833 lt!562219) (tuple2!20283 key1!25 v1!20)))))

(assert (= (and d!136743 res!828604) b!1242510))

(assert (= (and b!1242510 (not res!828605)) b!1242511))

(declare-fun m!1145191 () Bool)

(assert (=> d!136743 m!1145191))

(declare-fun m!1145193 () Bool)

(assert (=> d!136743 m!1145193))

(declare-fun m!1145195 () Bool)

(assert (=> b!1242511 m!1145195))

(assert (=> b!1242261 d!136743))

(declare-fun d!136745 () Bool)

(assert (=> d!136745 (= ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) key2!15) (h!28575 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) (Cons!27366 (h!28575 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) key2!15)))))

(assert (=> b!1242108 d!136745))

(declare-fun b!1242512 () Bool)

(declare-fun e!704338 () Bool)

(declare-fun lt!562252 () List!27370)

(assert (=> b!1242512 (= e!704338 (not (containsKey!612 lt!562252 key2!15)))))

(declare-fun d!136747 () Bool)

(assert (=> d!136747 e!704338))

(declare-fun res!828606 () Bool)

(assert (=> d!136747 (=> (not res!828606) (not e!704338))))

(assert (=> d!136747 (= res!828606 (isStrictlySorted!763 lt!562252))))

(declare-fun e!704337 () List!27370)

(assert (=> d!136747 (= lt!562252 e!704337)))

(declare-fun c!121653 () Bool)

(assert (=> d!136747 (= c!121653 (and (is-Cons!27366 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) (= (_1!10152 (h!28575 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)))) key2!15)))))

(assert (=> d!136747 (isStrictlySorted!763 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)))))

(assert (=> d!136747 (= (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) key2!15) lt!562252)))

(declare-fun b!1242513 () Bool)

(declare-fun e!704339 () List!27370)

(assert (=> b!1242513 (= e!704339 Nil!27367)))

(declare-fun b!1242514 () Bool)

(assert (=> b!1242514 (= e!704339 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) key2!15) (h!28575 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)))))))

(declare-fun b!1242515 () Bool)

(assert (=> b!1242515 (= e!704337 e!704339)))

(declare-fun c!121652 () Bool)

(assert (=> b!1242515 (= c!121652 (and (is-Cons!27366 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) (not (= (_1!10152 (h!28575 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242516 () Bool)

(assert (=> b!1242516 (= e!704337 (t!40833 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))))))

(assert (= (and d!136747 c!121653) b!1242516))

(assert (= (and d!136747 (not c!121653)) b!1242515))

(assert (= (and b!1242515 c!121652) b!1242514))

(assert (= (and b!1242515 (not c!121652)) b!1242513))

(assert (= (and d!136747 res!828606) b!1242512))

(declare-fun m!1145197 () Bool)

(assert (=> b!1242512 m!1145197))

(declare-fun m!1145199 () Bool)

(assert (=> d!136747 m!1145199))

(declare-fun m!1145201 () Bool)

(assert (=> d!136747 m!1145201))

(declare-fun m!1145203 () Bool)

(assert (=> b!1242514 m!1145203))

(assert (=> b!1242514 m!1145203))

(declare-fun m!1145205 () Bool)

(assert (=> b!1242514 m!1145205))

(assert (=> b!1242108 d!136747))

(declare-fun d!136749 () Bool)

(assert (=> d!136749 (= ($colon$colon!626 e!704112 (ite c!121559 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (tuple2!20283 key1!25 v1!20))) (Cons!27366 (ite c!121559 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (tuple2!20283 key1!25 v1!20)) e!704112))))

(assert (=> bm!61288 d!136749))

(declare-fun d!136751 () Bool)

(assert (=> d!136751 (= (insertStrictlySorted!437 (removeStrictlySorted!130 (t!40833 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!130 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20) key2!15))))

(assert (=> d!136751 true))

(declare-fun _$3!73 () Unit!41261)

(assert (=> d!136751 (= (choose!1840 (t!40833 l!644) key1!25 v1!20 key2!15) _$3!73)))

(declare-fun bs!34980 () Bool)

(assert (= bs!34980 d!136751))

(assert (=> bs!34980 m!1144767))

(assert (=> bs!34980 m!1144767))

(assert (=> bs!34980 m!1144769))

(assert (=> bs!34980 m!1144763))

(assert (=> bs!34980 m!1144763))

(assert (=> bs!34980 m!1144765))

(assert (=> d!136617 d!136751))

(assert (=> d!136617 d!136591))

(assert (=> d!136617 d!136595))

(assert (=> d!136617 d!136621))

(assert (=> d!136617 d!136631))

(declare-fun d!136753 () Bool)

(declare-fun res!828607 () Bool)

(declare-fun e!704340 () Bool)

(assert (=> d!136753 (=> res!828607 e!704340)))

(assert (=> d!136753 (= res!828607 (or (is-Nil!27367 lt!562202) (is-Nil!27367 (t!40833 lt!562202))))))

(assert (=> d!136753 (= (isStrictlySorted!763 lt!562202) e!704340)))

(declare-fun b!1242517 () Bool)

(declare-fun e!704341 () Bool)

(assert (=> b!1242517 (= e!704340 e!704341)))

(declare-fun res!828608 () Bool)

(assert (=> b!1242517 (=> (not res!828608) (not e!704341))))

(assert (=> b!1242517 (= res!828608 (bvslt (_1!10152 (h!28575 lt!562202)) (_1!10152 (h!28575 (t!40833 lt!562202)))))))

(declare-fun b!1242518 () Bool)

(assert (=> b!1242518 (= e!704341 (isStrictlySorted!763 (t!40833 lt!562202)))))

(assert (= (and d!136753 (not res!828607)) b!1242517))

(assert (= (and b!1242517 res!828608) b!1242518))

(declare-fun m!1145207 () Bool)

(assert (=> b!1242518 m!1145207))

(assert (=> d!136595 d!136753))

(declare-fun d!136755 () Bool)

(declare-fun res!828609 () Bool)

(declare-fun e!704342 () Bool)

(assert (=> d!136755 (=> res!828609 e!704342)))

(assert (=> d!136755 (= res!828609 (or (is-Nil!27367 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) (is-Nil!27367 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)))))))

(assert (=> d!136755 (= (isStrictlySorted!763 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) e!704342)))

(declare-fun b!1242519 () Bool)

(declare-fun e!704343 () Bool)

(assert (=> b!1242519 (= e!704342 e!704343)))

(declare-fun res!828610 () Bool)

(assert (=> b!1242519 (=> (not res!828610) (not e!704343))))

(assert (=> b!1242519 (= res!828610 (bvslt (_1!10152 (h!28575 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))))))))

(declare-fun b!1242520 () Bool)

(assert (=> b!1242520 (= e!704343 (isStrictlySorted!763 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))))))

(assert (= (and d!136755 (not res!828609)) b!1242519))

(assert (= (and b!1242519 res!828610) b!1242520))

(declare-fun m!1145209 () Bool)

(assert (=> b!1242520 m!1145209))

(assert (=> d!136595 d!136755))

(declare-fun d!136757 () Bool)

(declare-fun res!828611 () Bool)

(declare-fun e!704344 () Bool)

(assert (=> d!136757 (=> res!828611 e!704344)))

(assert (=> d!136757 (= res!828611 (and (is-Cons!27366 lt!562219) (= (_1!10152 (h!28575 lt!562219)) key1!25)))))

(assert (=> d!136757 (= (containsKey!612 lt!562219 key1!25) e!704344)))

(declare-fun b!1242521 () Bool)

(declare-fun e!704345 () Bool)

(assert (=> b!1242521 (= e!704344 e!704345)))

(declare-fun res!828612 () Bool)

(assert (=> b!1242521 (=> (not res!828612) (not e!704345))))

(assert (=> b!1242521 (= res!828612 (and (or (not (is-Cons!27366 lt!562219)) (bvsle (_1!10152 (h!28575 lt!562219)) key1!25)) (is-Cons!27366 lt!562219) (bvslt (_1!10152 (h!28575 lt!562219)) key1!25)))))

(declare-fun b!1242522 () Bool)

(assert (=> b!1242522 (= e!704345 (containsKey!612 (t!40833 lt!562219) key1!25))))

(assert (= (and d!136757 (not res!828611)) b!1242521))

(assert (= (and b!1242521 res!828612) b!1242522))

(declare-fun m!1145211 () Bool)

(assert (=> b!1242522 m!1145211))

(assert (=> b!1242257 d!136757))

(declare-fun b!1242523 () Bool)

(declare-fun e!704349 () List!27370)

(declare-fun e!704347 () List!27370)

(assert (=> b!1242523 (= e!704349 e!704347)))

(declare-fun c!121657 () Bool)

(assert (=> b!1242523 (= c!121657 (and (is-Cons!27366 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) (= (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 l!644 key2!15)))) key1!25)))))

(declare-fun b!1242524 () Bool)

(declare-fun e!704346 () List!27370)

(declare-fun call!61338 () List!27370)

(assert (=> b!1242524 (= e!704346 call!61338)))

(declare-fun e!704348 () List!27370)

(declare-fun b!1242525 () Bool)

(assert (=> b!1242525 (= e!704348 (insertStrictlySorted!437 (t!40833 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) key1!25 v1!20))))

(declare-fun bm!61334 () Bool)

(declare-fun call!61339 () List!27370)

(assert (=> bm!61334 (= call!61338 call!61339)))

(declare-fun d!136759 () Bool)

(declare-fun e!704350 () Bool)

(assert (=> d!136759 e!704350))

(declare-fun res!828614 () Bool)

(assert (=> d!136759 (=> (not res!828614) (not e!704350))))

(declare-fun lt!562253 () List!27370)

(assert (=> d!136759 (= res!828614 (isStrictlySorted!763 lt!562253))))

(assert (=> d!136759 (= lt!562253 e!704349)))

(declare-fun c!121655 () Bool)

(assert (=> d!136759 (= c!121655 (and (is-Cons!27366 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) (bvslt (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 l!644 key2!15)))) key1!25)))))

(assert (=> d!136759 (isStrictlySorted!763 (t!40833 (removeStrictlySorted!130 l!644 key2!15)))))

(assert (=> d!136759 (= (insertStrictlySorted!437 (t!40833 (removeStrictlySorted!130 l!644 key2!15)) key1!25 v1!20) lt!562253)))

(declare-fun b!1242526 () Bool)

(declare-fun res!828613 () Bool)

(assert (=> b!1242526 (=> (not res!828613) (not e!704350))))

(assert (=> b!1242526 (= res!828613 (containsKey!612 lt!562253 key1!25))))

(declare-fun b!1242527 () Bool)

(declare-fun c!121654 () Bool)

(assert (=> b!1242527 (= c!121654 (and (is-Cons!27366 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) (bvsgt (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 l!644 key2!15)))) key1!25)))))

(assert (=> b!1242527 (= e!704347 e!704346)))

(declare-fun b!1242528 () Bool)

(assert (=> b!1242528 (= e!704346 call!61338)))

(declare-fun b!1242529 () Bool)

(assert (=> b!1242529 (= e!704347 call!61339)))

(declare-fun b!1242530 () Bool)

(assert (=> b!1242530 (= e!704350 (contains!7393 lt!562253 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242531 () Bool)

(assert (=> b!1242531 (= e!704348 (ite c!121657 (t!40833 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) (ite c!121654 (Cons!27366 (h!28575 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) (t!40833 (t!40833 (removeStrictlySorted!130 l!644 key2!15)))) Nil!27367)))))

(declare-fun bm!61335 () Bool)

(declare-fun call!61337 () List!27370)

(assert (=> bm!61335 (= call!61339 call!61337)))

(declare-fun b!1242532 () Bool)

(assert (=> b!1242532 (= e!704349 call!61337)))

(declare-fun bm!61336 () Bool)

(assert (=> bm!61336 (= call!61337 ($colon$colon!626 e!704348 (ite c!121655 (h!28575 (t!40833 (removeStrictlySorted!130 l!644 key2!15))) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121656 () Bool)

(assert (=> bm!61336 (= c!121656 c!121655)))

(assert (= (and d!136759 c!121655) b!1242532))

(assert (= (and d!136759 (not c!121655)) b!1242523))

(assert (= (and b!1242523 c!121657) b!1242529))

(assert (= (and b!1242523 (not c!121657)) b!1242527))

(assert (= (and b!1242527 c!121654) b!1242528))

(assert (= (and b!1242527 (not c!121654)) b!1242524))

(assert (= (or b!1242528 b!1242524) bm!61334))

(assert (= (or b!1242529 bm!61334) bm!61335))

(assert (= (or b!1242532 bm!61335) bm!61336))

(assert (= (and bm!61336 c!121656) b!1242525))

(assert (= (and bm!61336 (not c!121656)) b!1242531))

(assert (= (and d!136759 res!828614) b!1242526))

(assert (= (and b!1242526 res!828613) b!1242530))

(declare-fun m!1145213 () Bool)

(assert (=> b!1242530 m!1145213))

(declare-fun m!1145215 () Bool)

(assert (=> b!1242526 m!1145215))

(declare-fun m!1145217 () Bool)

(assert (=> bm!61336 m!1145217))

(declare-fun m!1145219 () Bool)

(assert (=> d!136759 m!1145219))

(declare-fun m!1145221 () Bool)

(assert (=> d!136759 m!1145221))

(declare-fun m!1145223 () Bool)

(assert (=> b!1242525 m!1145223))

(assert (=> b!1242219 d!136759))

(declare-fun d!136761 () Bool)

(declare-fun res!828615 () Bool)

(declare-fun e!704351 () Bool)

(assert (=> d!136761 (=> res!828615 e!704351)))

(assert (=> d!136761 (= res!828615 (and (is-Cons!27366 lt!562210) (= (_1!10152 (h!28575 lt!562210)) key2!15)))))

(assert (=> d!136761 (= (containsKey!612 lt!562210 key2!15) e!704351)))

(declare-fun b!1242533 () Bool)

(declare-fun e!704352 () Bool)

(assert (=> b!1242533 (= e!704351 e!704352)))

(declare-fun res!828616 () Bool)

(assert (=> b!1242533 (=> (not res!828616) (not e!704352))))

(assert (=> b!1242533 (= res!828616 (and (or (not (is-Cons!27366 lt!562210)) (bvsle (_1!10152 (h!28575 lt!562210)) key2!15)) (is-Cons!27366 lt!562210) (bvslt (_1!10152 (h!28575 lt!562210)) key2!15)))))

(declare-fun b!1242534 () Bool)

(assert (=> b!1242534 (= e!704352 (containsKey!612 (t!40833 lt!562210) key2!15))))

(assert (= (and d!136761 (not res!828615)) b!1242533))

(assert (= (and b!1242533 res!828616) b!1242534))

(declare-fun m!1145225 () Bool)

(assert (=> b!1242534 m!1145225))

(assert (=> b!1242234 d!136761))

(declare-fun d!136763 () Bool)

(assert (=> d!136763 (= ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (t!40833 l!644)) key2!15) (h!28575 (t!40833 l!644))) (Cons!27366 (h!28575 (t!40833 l!644)) (removeStrictlySorted!130 (t!40833 (t!40833 l!644)) key2!15)))))

(assert (=> b!1242281 d!136763))

(declare-fun b!1242535 () Bool)

(declare-fun e!704354 () Bool)

(declare-fun lt!562254 () List!27370)

(assert (=> b!1242535 (= e!704354 (not (containsKey!612 lt!562254 key2!15)))))

(declare-fun d!136765 () Bool)

(assert (=> d!136765 e!704354))

(declare-fun res!828617 () Bool)

(assert (=> d!136765 (=> (not res!828617) (not e!704354))))

(assert (=> d!136765 (= res!828617 (isStrictlySorted!763 lt!562254))))

(declare-fun e!704353 () List!27370)

(assert (=> d!136765 (= lt!562254 e!704353)))

(declare-fun c!121659 () Bool)

(assert (=> d!136765 (= c!121659 (and (is-Cons!27366 (t!40833 (t!40833 l!644))) (= (_1!10152 (h!28575 (t!40833 (t!40833 l!644)))) key2!15)))))

(assert (=> d!136765 (isStrictlySorted!763 (t!40833 (t!40833 l!644)))))

(assert (=> d!136765 (= (removeStrictlySorted!130 (t!40833 (t!40833 l!644)) key2!15) lt!562254)))

(declare-fun b!1242536 () Bool)

(declare-fun e!704355 () List!27370)

(assert (=> b!1242536 (= e!704355 Nil!27367)))

(declare-fun b!1242537 () Bool)

(assert (=> b!1242537 (= e!704355 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (t!40833 (t!40833 l!644))) key2!15) (h!28575 (t!40833 (t!40833 l!644)))))))

(declare-fun b!1242538 () Bool)

(assert (=> b!1242538 (= e!704353 e!704355)))

(declare-fun c!121658 () Bool)

(assert (=> b!1242538 (= c!121658 (and (is-Cons!27366 (t!40833 (t!40833 l!644))) (not (= (_1!10152 (h!28575 (t!40833 (t!40833 l!644)))) key2!15))))))

(declare-fun b!1242539 () Bool)

(assert (=> b!1242539 (= e!704353 (t!40833 (t!40833 (t!40833 l!644))))))

(assert (= (and d!136765 c!121659) b!1242539))

(assert (= (and d!136765 (not c!121659)) b!1242538))

(assert (= (and b!1242538 c!121658) b!1242537))

(assert (= (and b!1242538 (not c!121658)) b!1242536))

(assert (= (and d!136765 res!828617) b!1242535))

(declare-fun m!1145227 () Bool)

(assert (=> b!1242535 m!1145227))

(declare-fun m!1145229 () Bool)

(assert (=> d!136765 m!1145229))

(assert (=> d!136765 m!1144987))

(declare-fun m!1145231 () Bool)

(assert (=> b!1242537 m!1145231))

(assert (=> b!1242537 m!1145231))

(declare-fun m!1145233 () Bool)

(assert (=> b!1242537 m!1145233))

(assert (=> b!1242281 d!136765))

(declare-fun d!136767 () Bool)

(declare-fun res!828618 () Bool)

(declare-fun e!704356 () Bool)

(assert (=> d!136767 (=> res!828618 e!704356)))

(assert (=> d!136767 (= res!828618 (or (is-Nil!27367 (t!40833 (t!40833 l!644))) (is-Nil!27367 (t!40833 (t!40833 (t!40833 l!644))))))))

(assert (=> d!136767 (= (isStrictlySorted!763 (t!40833 (t!40833 l!644))) e!704356)))

(declare-fun b!1242540 () Bool)

(declare-fun e!704357 () Bool)

(assert (=> b!1242540 (= e!704356 e!704357)))

(declare-fun res!828619 () Bool)

(assert (=> b!1242540 (=> (not res!828619) (not e!704357))))

(assert (=> b!1242540 (= res!828619 (bvslt (_1!10152 (h!28575 (t!40833 (t!40833 l!644)))) (_1!10152 (h!28575 (t!40833 (t!40833 (t!40833 l!644)))))))))

(declare-fun b!1242541 () Bool)

(assert (=> b!1242541 (= e!704357 (isStrictlySorted!763 (t!40833 (t!40833 (t!40833 l!644)))))))

(assert (= (and d!136767 (not res!828618)) b!1242540))

(assert (= (and b!1242540 res!828619) b!1242541))

(declare-fun m!1145235 () Bool)

(assert (=> b!1242541 m!1145235))

(assert (=> b!1242295 d!136767))

(assert (=> b!1242195 d!136621))

(declare-fun d!136769 () Bool)

(declare-fun res!828620 () Bool)

(declare-fun e!704358 () Bool)

(assert (=> d!136769 (=> res!828620 e!704358)))

(assert (=> d!136769 (= res!828620 (or (is-Nil!27367 lt!562196) (is-Nil!27367 (t!40833 lt!562196))))))

(assert (=> d!136769 (= (isStrictlySorted!763 lt!562196) e!704358)))

(declare-fun b!1242542 () Bool)

(declare-fun e!704359 () Bool)

(assert (=> b!1242542 (= e!704358 e!704359)))

(declare-fun res!828621 () Bool)

(assert (=> b!1242542 (=> (not res!828621) (not e!704359))))

(assert (=> b!1242542 (= res!828621 (bvslt (_1!10152 (h!28575 lt!562196)) (_1!10152 (h!28575 (t!40833 lt!562196)))))))

(declare-fun b!1242543 () Bool)

(assert (=> b!1242543 (= e!704359 (isStrictlySorted!763 (t!40833 lt!562196)))))

(assert (= (and d!136769 (not res!828620)) b!1242542))

(assert (= (and b!1242542 res!828621) b!1242543))

(declare-fun m!1145237 () Bool)

(assert (=> b!1242543 m!1145237))

(assert (=> d!136591 d!136769))

(declare-fun d!136771 () Bool)

(declare-fun res!828622 () Bool)

(declare-fun e!704360 () Bool)

(assert (=> d!136771 (=> res!828622 e!704360)))

(assert (=> d!136771 (= res!828622 (or (is-Nil!27367 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) (is-Nil!27367 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)))))))

(assert (=> d!136771 (= (isStrictlySorted!763 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20)) e!704360)))

(declare-fun b!1242544 () Bool)

(declare-fun e!704361 () Bool)

(assert (=> b!1242544 (= e!704360 e!704361)))

(declare-fun res!828623 () Bool)

(assert (=> b!1242544 (=> (not res!828623) (not e!704361))))

(assert (=> b!1242544 (= res!828623 (bvslt (_1!10152 (h!28575 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))) (_1!10152 (h!28575 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))))))))

(declare-fun b!1242545 () Bool)

(assert (=> b!1242545 (= e!704361 (isStrictlySorted!763 (t!40833 (insertStrictlySorted!437 (t!40833 l!644) key1!25 v1!20))))))

(assert (= (and d!136771 (not res!828622)) b!1242544))

(assert (= (and b!1242544 res!828623) b!1242545))

(assert (=> b!1242545 m!1145201))

(assert (=> d!136591 d!136771))

(declare-fun b!1242546 () Bool)

(declare-fun e!704365 () List!27370)

(declare-fun e!704363 () List!27370)

(assert (=> b!1242546 (= e!704365 e!704363)))

(declare-fun c!121663 () Bool)

(assert (=> b!1242546 (= c!121663 (and (is-Cons!27366 (t!40833 (t!40833 l!644))) (= (_1!10152 (h!28575 (t!40833 (t!40833 l!644)))) key1!25)))))

(declare-fun b!1242547 () Bool)

(declare-fun e!704362 () List!27370)

(declare-fun call!61341 () List!27370)

(assert (=> b!1242547 (= e!704362 call!61341)))

(declare-fun e!704364 () List!27370)

(declare-fun b!1242548 () Bool)

(assert (=> b!1242548 (= e!704364 (insertStrictlySorted!437 (t!40833 (t!40833 (t!40833 l!644))) key1!25 v1!20))))

(declare-fun bm!61337 () Bool)

(declare-fun call!61342 () List!27370)

(assert (=> bm!61337 (= call!61341 call!61342)))

(declare-fun d!136773 () Bool)

(declare-fun e!704366 () Bool)

(assert (=> d!136773 e!704366))

(declare-fun res!828625 () Bool)

(assert (=> d!136773 (=> (not res!828625) (not e!704366))))

(declare-fun lt!562255 () List!27370)

(assert (=> d!136773 (= res!828625 (isStrictlySorted!763 lt!562255))))

(assert (=> d!136773 (= lt!562255 e!704365)))

(declare-fun c!121661 () Bool)

(assert (=> d!136773 (= c!121661 (and (is-Cons!27366 (t!40833 (t!40833 l!644))) (bvslt (_1!10152 (h!28575 (t!40833 (t!40833 l!644)))) key1!25)))))

(assert (=> d!136773 (isStrictlySorted!763 (t!40833 (t!40833 l!644)))))

(assert (=> d!136773 (= (insertStrictlySorted!437 (t!40833 (t!40833 l!644)) key1!25 v1!20) lt!562255)))

(declare-fun b!1242549 () Bool)

(declare-fun res!828624 () Bool)

(assert (=> b!1242549 (=> (not res!828624) (not e!704366))))

(assert (=> b!1242549 (= res!828624 (containsKey!612 lt!562255 key1!25))))

(declare-fun b!1242550 () Bool)

(declare-fun c!121660 () Bool)

(assert (=> b!1242550 (= c!121660 (and (is-Cons!27366 (t!40833 (t!40833 l!644))) (bvsgt (_1!10152 (h!28575 (t!40833 (t!40833 l!644)))) key1!25)))))

(assert (=> b!1242550 (= e!704363 e!704362)))

(declare-fun b!1242551 () Bool)

(assert (=> b!1242551 (= e!704362 call!61341)))

(declare-fun b!1242552 () Bool)

(assert (=> b!1242552 (= e!704363 call!61342)))

(declare-fun b!1242553 () Bool)

(assert (=> b!1242553 (= e!704366 (contains!7393 lt!562255 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242554 () Bool)

(assert (=> b!1242554 (= e!704364 (ite c!121663 (t!40833 (t!40833 (t!40833 l!644))) (ite c!121660 (Cons!27366 (h!28575 (t!40833 (t!40833 l!644))) (t!40833 (t!40833 (t!40833 l!644)))) Nil!27367)))))

(declare-fun bm!61338 () Bool)

(declare-fun call!61340 () List!27370)

(assert (=> bm!61338 (= call!61342 call!61340)))

(declare-fun b!1242555 () Bool)

(assert (=> b!1242555 (= e!704365 call!61340)))

(declare-fun bm!61339 () Bool)

(assert (=> bm!61339 (= call!61340 ($colon$colon!626 e!704364 (ite c!121661 (h!28575 (t!40833 (t!40833 l!644))) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121662 () Bool)

(assert (=> bm!61339 (= c!121662 c!121661)))

(assert (= (and d!136773 c!121661) b!1242555))

(assert (= (and d!136773 (not c!121661)) b!1242546))

(assert (= (and b!1242546 c!121663) b!1242552))

(assert (= (and b!1242546 (not c!121663)) b!1242550))

(assert (= (and b!1242550 c!121660) b!1242551))

(assert (= (and b!1242550 (not c!121660)) b!1242547))

(assert (= (or b!1242551 b!1242547) bm!61337))

(assert (= (or b!1242552 bm!61337) bm!61338))

(assert (= (or b!1242555 bm!61338) bm!61339))

(assert (= (and bm!61339 c!121662) b!1242548))

(assert (= (and bm!61339 (not c!121662)) b!1242554))

(assert (= (and d!136773 res!828625) b!1242549))

(assert (= (and b!1242549 res!828624) b!1242553))

(declare-fun m!1145239 () Bool)

(assert (=> b!1242553 m!1145239))

(declare-fun m!1145241 () Bool)

(assert (=> b!1242549 m!1145241))

(declare-fun m!1145243 () Bool)

(assert (=> bm!61339 m!1145243))

(declare-fun m!1145245 () Bool)

(assert (=> d!136773 m!1145245))

(assert (=> d!136773 m!1144987))

(declare-fun m!1145247 () Bool)

(assert (=> b!1242548 m!1145247))

(assert (=> b!1242256 d!136773))

(assert (=> b!1242299 d!136635))

(declare-fun d!136775 () Bool)

(declare-fun res!828626 () Bool)

(declare-fun e!704367 () Bool)

(assert (=> d!136775 (=> res!828626 e!704367)))

(assert (=> d!136775 (= res!828626 (and (is-Cons!27366 lt!562208) (= (_1!10152 (h!28575 lt!562208)) key1!25)))))

(assert (=> d!136775 (= (containsKey!612 lt!562208 key1!25) e!704367)))

(declare-fun b!1242556 () Bool)

(declare-fun e!704368 () Bool)

(assert (=> b!1242556 (= e!704367 e!704368)))

(declare-fun res!828627 () Bool)

(assert (=> b!1242556 (=> (not res!828627) (not e!704368))))

(assert (=> b!1242556 (= res!828627 (and (or (not (is-Cons!27366 lt!562208)) (bvsle (_1!10152 (h!28575 lt!562208)) key1!25)) (is-Cons!27366 lt!562208) (bvslt (_1!10152 (h!28575 lt!562208)) key1!25)))))

(declare-fun b!1242557 () Bool)

(assert (=> b!1242557 (= e!704368 (containsKey!612 (t!40833 lt!562208) key1!25))))

(assert (= (and d!136775 (not res!828626)) b!1242556))

(assert (= (and b!1242556 res!828627) b!1242557))

(declare-fun m!1145249 () Bool)

(assert (=> b!1242557 m!1145249))

(assert (=> b!1242220 d!136775))

(declare-fun d!136777 () Bool)

(assert (=> d!136777 (= ($colon$colon!626 (removeStrictlySorted!130 (t!40833 l!644) key2!15) (h!28575 l!644)) (Cons!27366 (h!28575 l!644) (removeStrictlySorted!130 (t!40833 l!644) key2!15)))))

(assert (=> b!1242236 d!136777))

(assert (=> b!1242236 d!136631))

(declare-fun d!136779 () Bool)

(declare-fun res!828628 () Bool)

(declare-fun e!704369 () Bool)

(assert (=> d!136779 (=> res!828628 e!704369)))

(assert (=> d!136779 (= res!828628 (and (is-Cons!27366 lt!562223) (= (_1!10152 (h!28575 lt!562223)) key2!15)))))

(assert (=> d!136779 (= (containsKey!612 lt!562223 key2!15) e!704369)))

(declare-fun b!1242558 () Bool)

(declare-fun e!704370 () Bool)

(assert (=> b!1242558 (= e!704369 e!704370)))

(declare-fun res!828629 () Bool)

(assert (=> b!1242558 (=> (not res!828629) (not e!704370))))

(assert (=> b!1242558 (= res!828629 (and (or (not (is-Cons!27366 lt!562223)) (bvsle (_1!10152 (h!28575 lt!562223)) key2!15)) (is-Cons!27366 lt!562223) (bvslt (_1!10152 (h!28575 lt!562223)) key2!15)))))

(declare-fun b!1242559 () Bool)

(assert (=> b!1242559 (= e!704370 (containsKey!612 (t!40833 lt!562223) key2!15))))

(assert (= (and d!136779 (not res!828628)) b!1242558))

(assert (= (and b!1242558 res!828629) b!1242559))

(declare-fun m!1145251 () Bool)

(assert (=> b!1242559 m!1145251))

(assert (=> b!1242279 d!136779))

(declare-fun d!136781 () Bool)

(declare-fun res!828630 () Bool)

(declare-fun e!704371 () Bool)

(assert (=> d!136781 (=> res!828630 e!704371)))

(assert (=> d!136781 (= res!828630 (and (is-Cons!27366 lt!562206) (= (_1!10152 (h!28575 lt!562206)) key1!25)))))

(assert (=> d!136781 (= (containsKey!612 lt!562206 key1!25) e!704371)))

(declare-fun b!1242560 () Bool)

(declare-fun e!704372 () Bool)

(assert (=> b!1242560 (= e!704371 e!704372)))

(declare-fun res!828631 () Bool)

(assert (=> b!1242560 (=> (not res!828631) (not e!704372))))

(assert (=> b!1242560 (= res!828631 (and (or (not (is-Cons!27366 lt!562206)) (bvsle (_1!10152 (h!28575 lt!562206)) key1!25)) (is-Cons!27366 lt!562206) (bvslt (_1!10152 (h!28575 lt!562206)) key1!25)))))

(declare-fun b!1242561 () Bool)

(assert (=> b!1242561 (= e!704372 (containsKey!612 (t!40833 lt!562206) key1!25))))

(assert (= (and d!136781 (not res!828630)) b!1242560))

(assert (= (and b!1242560 res!828631) b!1242561))

(declare-fun m!1145253 () Bool)

(assert (=> b!1242561 m!1145253))

(assert (=> b!1242196 d!136781))

(declare-fun d!136783 () Bool)

(declare-fun res!828632 () Bool)

(declare-fun e!704373 () Bool)

(assert (=> d!136783 (=> res!828632 e!704373)))

(assert (=> d!136783 (= res!828632 (or (is-Nil!27367 lt!562208) (is-Nil!27367 (t!40833 lt!562208))))))

(assert (=> d!136783 (= (isStrictlySorted!763 lt!562208) e!704373)))

(declare-fun b!1242562 () Bool)

(declare-fun e!704374 () Bool)

(assert (=> b!1242562 (= e!704373 e!704374)))

(declare-fun res!828633 () Bool)

(assert (=> b!1242562 (=> (not res!828633) (not e!704374))))

(assert (=> b!1242562 (= res!828633 (bvslt (_1!10152 (h!28575 lt!562208)) (_1!10152 (h!28575 (t!40833 lt!562208)))))))

(declare-fun b!1242563 () Bool)

(assert (=> b!1242563 (= e!704374 (isStrictlySorted!763 (t!40833 lt!562208)))))

(assert (= (and d!136783 (not res!828632)) b!1242562))

(assert (= (and b!1242562 res!828633) b!1242563))

(declare-fun m!1145255 () Bool)

(assert (=> b!1242563 m!1145255))

(assert (=> d!136609 d!136783))

(declare-fun d!136785 () Bool)

(declare-fun res!828634 () Bool)

(declare-fun e!704375 () Bool)

(assert (=> d!136785 (=> res!828634 e!704375)))

(assert (=> d!136785 (= res!828634 (or (is-Nil!27367 (removeStrictlySorted!130 l!644 key2!15)) (is-Nil!27367 (t!40833 (removeStrictlySorted!130 l!644 key2!15)))))))

(assert (=> d!136785 (= (isStrictlySorted!763 (removeStrictlySorted!130 l!644 key2!15)) e!704375)))

(declare-fun b!1242564 () Bool)

(declare-fun e!704376 () Bool)

(assert (=> b!1242564 (= e!704375 e!704376)))

(declare-fun res!828635 () Bool)

(assert (=> b!1242564 (=> (not res!828635) (not e!704376))))

(assert (=> b!1242564 (= res!828635 (bvslt (_1!10152 (h!28575 (removeStrictlySorted!130 l!644 key2!15))) (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 l!644 key2!15))))))))

(declare-fun b!1242565 () Bool)

(assert (=> b!1242565 (= e!704376 (isStrictlySorted!763 (t!40833 (removeStrictlySorted!130 l!644 key2!15))))))

(assert (= (and d!136785 (not res!828634)) b!1242564))

(assert (= (and b!1242564 res!828635) b!1242565))

(assert (=> b!1242565 m!1145221))

(assert (=> d!136609 d!136785))

(declare-fun d!136787 () Bool)

(declare-fun res!828636 () Bool)

(declare-fun e!704377 () Bool)

(assert (=> d!136787 (=> res!828636 e!704377)))

(assert (=> d!136787 (= res!828636 (or (is-Nil!27367 lt!562206) (is-Nil!27367 (t!40833 lt!562206))))))

(assert (=> d!136787 (= (isStrictlySorted!763 lt!562206) e!704377)))

(declare-fun b!1242566 () Bool)

(declare-fun e!704378 () Bool)

(assert (=> b!1242566 (= e!704377 e!704378)))

(declare-fun res!828637 () Bool)

(assert (=> b!1242566 (=> (not res!828637) (not e!704378))))

(assert (=> b!1242566 (= res!828637 (bvslt (_1!10152 (h!28575 lt!562206)) (_1!10152 (h!28575 (t!40833 lt!562206)))))))

(declare-fun b!1242567 () Bool)

(assert (=> b!1242567 (= e!704378 (isStrictlySorted!763 (t!40833 lt!562206)))))

(assert (= (and d!136787 (not res!828636)) b!1242566))

(assert (= (and b!1242566 res!828637) b!1242567))

(declare-fun m!1145257 () Bool)

(assert (=> b!1242567 m!1145257))

(assert (=> d!136605 d!136787))

(assert (=> d!136605 d!136639))

(declare-fun d!136789 () Bool)

(assert (=> d!136789 (= ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)) key2!15) (h!28575 (insertStrictlySorted!437 l!644 key1!25 v1!20))) (Cons!27366 (h!28575 (insertStrictlySorted!437 l!644 key1!25 v1!20)) (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242271 d!136789))

(declare-fun b!1242568 () Bool)

(declare-fun e!704380 () Bool)

(declare-fun lt!562256 () List!27370)

(assert (=> b!1242568 (= e!704380 (not (containsKey!612 lt!562256 key2!15)))))

(declare-fun d!136791 () Bool)

(assert (=> d!136791 e!704380))

(declare-fun res!828638 () Bool)

(assert (=> d!136791 (=> (not res!828638) (not e!704380))))

(assert (=> d!136791 (= res!828638 (isStrictlySorted!763 lt!562256))))

(declare-fun e!704379 () List!27370)

(assert (=> d!136791 (= lt!562256 e!704379)))

(declare-fun c!121665 () Bool)

(assert (=> d!136791 (= c!121665 (and (is-Cons!27366 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20))) (= (_1!10152 (h!28575 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136791 (isStrictlySorted!763 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)))))

(assert (=> d!136791 (= (removeStrictlySorted!130 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)) key2!15) lt!562256)))

(declare-fun b!1242569 () Bool)

(declare-fun e!704381 () List!27370)

(assert (=> b!1242569 (= e!704381 Nil!27367)))

(declare-fun b!1242570 () Bool)

(assert (=> b!1242570 (= e!704381 ($colon$colon!626 (removeStrictlySorted!130 (t!40833 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20))) key2!15) (h!28575 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)))))))

(declare-fun b!1242571 () Bool)

(assert (=> b!1242571 (= e!704379 e!704381)))

(declare-fun c!121664 () Bool)

(assert (=> b!1242571 (= c!121664 (and (is-Cons!27366 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20))) (not (= (_1!10152 (h!28575 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242572 () Bool)

(assert (=> b!1242572 (= e!704379 (t!40833 (t!40833 (insertStrictlySorted!437 l!644 key1!25 v1!20))))))

(assert (= (and d!136791 c!121665) b!1242572))

(assert (= (and d!136791 (not c!121665)) b!1242571))

(assert (= (and b!1242571 c!121664) b!1242570))

(assert (= (and b!1242571 (not c!121664)) b!1242569))

(assert (= (and d!136791 res!828638) b!1242568))

(declare-fun m!1145259 () Bool)

(assert (=> b!1242568 m!1145259))

(declare-fun m!1145261 () Bool)

(assert (=> d!136791 m!1145261))

(assert (=> d!136791 m!1145183))

(declare-fun m!1145263 () Bool)

(assert (=> b!1242570 m!1145263))

(assert (=> b!1242570 m!1145263))

(declare-fun m!1145265 () Bool)

(assert (=> b!1242570 m!1145265))

(assert (=> b!1242271 d!136791))

(declare-fun d!136793 () Bool)

(declare-fun lt!562257 () Bool)

(assert (=> d!136793 (= lt!562257 (set.member (tuple2!20283 key1!25 v1!20) (content!603 lt!562208)))))

(declare-fun e!704383 () Bool)

(assert (=> d!136793 (= lt!562257 e!704383)))

(declare-fun res!828639 () Bool)

(assert (=> d!136793 (=> (not res!828639) (not e!704383))))

(assert (=> d!136793 (= res!828639 (is-Cons!27366 lt!562208))))

(assert (=> d!136793 (= (contains!7393 lt!562208 (tuple2!20283 key1!25 v1!20)) lt!562257)))

(declare-fun b!1242573 () Bool)

(declare-fun e!704382 () Bool)

(assert (=> b!1242573 (= e!704383 e!704382)))

(declare-fun res!828640 () Bool)

(assert (=> b!1242573 (=> res!828640 e!704382)))

(assert (=> b!1242573 (= res!828640 (= (h!28575 lt!562208) (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242574 () Bool)

(assert (=> b!1242574 (= e!704382 (contains!7393 (t!40833 lt!562208) (tuple2!20283 key1!25 v1!20)))))

(assert (= (and d!136793 res!828639) b!1242573))

(assert (= (and b!1242573 (not res!828640)) b!1242574))

(declare-fun m!1145267 () Bool)

(assert (=> d!136793 m!1145267))

(declare-fun m!1145269 () Bool)

(assert (=> d!136793 m!1145269))

(declare-fun m!1145271 () Bool)

(assert (=> b!1242574 m!1145271))

(assert (=> b!1242224 d!136793))

(declare-fun d!136795 () Bool)

(declare-fun lt!562258 () Bool)

(assert (=> d!136795 (= lt!562258 (set.member (tuple2!20283 key1!25 v1!20) (content!603 lt!562206)))))

(declare-fun e!704385 () Bool)

(assert (=> d!136795 (= lt!562258 e!704385)))

(declare-fun res!828641 () Bool)

(assert (=> d!136795 (=> (not res!828641) (not e!704385))))

(assert (=> d!136795 (= res!828641 (is-Cons!27366 lt!562206))))

(assert (=> d!136795 (= (contains!7393 lt!562206 (tuple2!20283 key1!25 v1!20)) lt!562258)))

(declare-fun b!1242575 () Bool)

(declare-fun e!704384 () Bool)

(assert (=> b!1242575 (= e!704385 e!704384)))

(declare-fun res!828642 () Bool)

(assert (=> b!1242575 (=> res!828642 e!704384)))

(assert (=> b!1242575 (= res!828642 (= (h!28575 lt!562206) (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242576 () Bool)

(assert (=> b!1242576 (= e!704384 (contains!7393 (t!40833 lt!562206) (tuple2!20283 key1!25 v1!20)))))

(assert (= (and d!136795 res!828641) b!1242575))

(assert (= (and b!1242575 (not res!828642)) b!1242576))

(declare-fun m!1145273 () Bool)

(assert (=> d!136795 m!1145273))

(declare-fun m!1145275 () Bool)

(assert (=> d!136795 m!1145275))

(declare-fun m!1145277 () Bool)

(assert (=> b!1242576 m!1145277))

(assert (=> b!1242200 d!136795))

(declare-fun d!136797 () Bool)

(declare-fun res!828643 () Bool)

(declare-fun e!704386 () Bool)

(assert (=> d!136797 (=> res!828643 e!704386)))

(assert (=> d!136797 (= res!828643 (and (is-Cons!27366 lt!562221) (= (_1!10152 (h!28575 lt!562221)) key2!15)))))

(assert (=> d!136797 (= (containsKey!612 lt!562221 key2!15) e!704386)))

(declare-fun b!1242577 () Bool)

(declare-fun e!704387 () Bool)

(assert (=> b!1242577 (= e!704386 e!704387)))

(declare-fun res!828644 () Bool)

(assert (=> b!1242577 (=> (not res!828644) (not e!704387))))

(assert (=> b!1242577 (= res!828644 (and (or (not (is-Cons!27366 lt!562221)) (bvsle (_1!10152 (h!28575 lt!562221)) key2!15)) (is-Cons!27366 lt!562221) (bvslt (_1!10152 (h!28575 lt!562221)) key2!15)))))

(declare-fun b!1242578 () Bool)

(assert (=> b!1242578 (= e!704387 (containsKey!612 (t!40833 lt!562221) key2!15))))

(assert (= (and d!136797 (not res!828643)) b!1242577))

(assert (= (and b!1242577 res!828644) b!1242578))

(declare-fun m!1145279 () Bool)

(assert (=> b!1242578 m!1145279))

(assert (=> b!1242269 d!136797))

(declare-fun d!136799 () Bool)

(declare-fun res!828645 () Bool)

(declare-fun e!704388 () Bool)

(assert (=> d!136799 (=> res!828645 e!704388)))

(assert (=> d!136799 (= res!828645 (or (is-Nil!27367 lt!562219) (is-Nil!27367 (t!40833 lt!562219))))))

(assert (=> d!136799 (= (isStrictlySorted!763 lt!562219) e!704388)))

(declare-fun b!1242579 () Bool)

(declare-fun e!704389 () Bool)

(assert (=> b!1242579 (= e!704388 e!704389)))

(declare-fun res!828646 () Bool)

(assert (=> b!1242579 (=> (not res!828646) (not e!704389))))

(assert (=> b!1242579 (= res!828646 (bvslt (_1!10152 (h!28575 lt!562219)) (_1!10152 (h!28575 (t!40833 lt!562219)))))))

(declare-fun b!1242580 () Bool)

(assert (=> b!1242580 (= e!704389 (isStrictlySorted!763 (t!40833 lt!562219)))))

(assert (= (and d!136799 (not res!828645)) b!1242579))

(assert (= (and b!1242579 res!828646) b!1242580))

(declare-fun m!1145281 () Bool)

(assert (=> b!1242580 m!1145281))

(assert (=> d!136621 d!136799))

(assert (=> d!136621 d!136635))

(declare-fun b!1242581 () Bool)

(declare-fun e!704393 () List!27370)

(declare-fun e!704391 () List!27370)

(assert (=> b!1242581 (= e!704393 e!704391)))

(declare-fun c!121669 () Bool)

(assert (=> b!1242581 (= c!121669 (and (is-Cons!27366 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (= (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)))) key1!25)))))

(declare-fun b!1242582 () Bool)

(declare-fun e!704390 () List!27370)

(declare-fun call!61344 () List!27370)

(assert (=> b!1242582 (= e!704390 call!61344)))

(declare-fun e!704392 () List!27370)

(declare-fun b!1242583 () Bool)

(assert (=> b!1242583 (= e!704392 (insertStrictlySorted!437 (t!40833 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) key1!25 v1!20))))

(declare-fun bm!61340 () Bool)

(declare-fun call!61345 () List!27370)

(assert (=> bm!61340 (= call!61344 call!61345)))

(declare-fun d!136801 () Bool)

(declare-fun e!704394 () Bool)

(assert (=> d!136801 e!704394))

(declare-fun res!828648 () Bool)

(assert (=> d!136801 (=> (not res!828648) (not e!704394))))

(declare-fun lt!562259 () List!27370)

(assert (=> d!136801 (= res!828648 (isStrictlySorted!763 lt!562259))))

(assert (=> d!136801 (= lt!562259 e!704393)))

(declare-fun c!121667 () Bool)

(assert (=> d!136801 (= c!121667 (and (is-Cons!27366 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (bvslt (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)))) key1!25)))))

(assert (=> d!136801 (isStrictlySorted!763 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)))))

(assert (=> d!136801 (= (insertStrictlySorted!437 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)) key1!25 v1!20) lt!562259)))

(declare-fun b!1242584 () Bool)

(declare-fun res!828647 () Bool)

(assert (=> b!1242584 (=> (not res!828647) (not e!704394))))

(assert (=> b!1242584 (= res!828647 (containsKey!612 lt!562259 key1!25))))

(declare-fun b!1242585 () Bool)

(declare-fun c!121666 () Bool)

(assert (=> b!1242585 (= c!121666 (and (is-Cons!27366 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (bvsgt (_1!10152 (h!28575 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)))) key1!25)))))

(assert (=> b!1242585 (= e!704391 e!704390)))

(declare-fun b!1242586 () Bool)

(assert (=> b!1242586 (= e!704390 call!61344)))

(declare-fun b!1242587 () Bool)

(assert (=> b!1242587 (= e!704391 call!61345)))

(declare-fun b!1242588 () Bool)

(assert (=> b!1242588 (= e!704394 (contains!7393 lt!562259 (tuple2!20283 key1!25 v1!20)))))

(declare-fun b!1242589 () Bool)

(assert (=> b!1242589 (= e!704392 (ite c!121669 (t!40833 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (ite c!121666 (Cons!27366 (h!28575 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (t!40833 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15)))) Nil!27367)))))

(declare-fun bm!61341 () Bool)

(declare-fun call!61343 () List!27370)

(assert (=> bm!61341 (= call!61345 call!61343)))

(declare-fun b!1242590 () Bool)

(assert (=> b!1242590 (= e!704393 call!61343)))

(declare-fun bm!61342 () Bool)

(assert (=> bm!61342 (= call!61343 ($colon$colon!626 e!704392 (ite c!121667 (h!28575 (t!40833 (removeStrictlySorted!130 (t!40833 l!644) key2!15))) (tuple2!20283 key1!25 v1!20))))))

(declare-fun c!121668 () Bool)

(assert (=> bm!61342 (= c!121668 c!121667)))

(assert (= (and d!136801 c!121667) b!1242590))

(assert (= (and d!136801 (not c!121667)) b!1242581))

(assert (= (and b!1242581 c!121669) b!1242587))

(assert (= (and b!1242581 (not c!121669)) b!1242585))

(assert (= (and b!1242585 c!121666) b!1242586))

(assert (= (and b!1242585 (not c!121666)) b!1242582))

(assert (= (or b!1242586 b!1242582) bm!61340))

(assert (= (or b!1242587 bm!61340) bm!61341))

(assert (= (or b!1242590 bm!61341) bm!61342))

(assert (= (and bm!61342 c!121668) b!1242583))

(assert (= (and bm!61342 (not c!121668)) b!1242589))

(assert (= (and d!136801 res!828648) b!1242584))

(assert (= (and b!1242584 res!828647) b!1242588))

(declare-fun m!1145283 () Bool)

(assert (=> b!1242588 m!1145283))

(declare-fun m!1145285 () Bool)

(assert (=> b!1242584 m!1145285))

(declare-fun m!1145287 () Bool)

(assert (=> bm!61342 m!1145287))

(declare-fun m!1145289 () Bool)

(assert (=> d!136801 m!1145289))

(assert (=> d!136801 m!1145209))

(declare-fun m!1145291 () Bool)

(assert (=> b!1242583 m!1145291))

(assert (=> b!1242171 d!136801))

(declare-fun d!136803 () Bool)

(assert (=> d!136803 (= ($colon$colon!626 e!704136 (ite c!121579 (h!28575 (removeStrictlySorted!130 l!644 key2!15)) (tuple2!20283 key1!25 v1!20))) (Cons!27366 (ite c!121579 (h!28575 (removeStrictlySorted!130 l!644 key2!15)) (tuple2!20283 key1!25 v1!20)) e!704136))))

(assert (=> bm!61300 d!136803))

(declare-fun d!136805 () Bool)

(declare-fun res!828649 () Bool)

(declare-fun e!704395 () Bool)

(assert (=> d!136805 (=> res!828649 e!704395)))

(assert (=> d!136805 (= res!828649 (or (is-Nil!27367 lt!562223) (is-Nil!27367 (t!40833 lt!562223))))))

(assert (=> d!136805 (= (isStrictlySorted!763 lt!562223) e!704395)))

(declare-fun b!1242591 () Bool)

(declare-fun e!704396 () Bool)

(assert (=> b!1242591 (= e!704395 e!704396)))

(declare-fun res!828650 () Bool)

(assert (=> b!1242591 (=> (not res!828650) (not e!704396))))

(assert (=> b!1242591 (= res!828650 (bvslt (_1!10152 (h!28575 lt!562223)) (_1!10152 (h!28575 (t!40833 lt!562223)))))))

(declare-fun b!1242592 () Bool)

(assert (=> b!1242592 (= e!704396 (isStrictlySorted!763 (t!40833 lt!562223)))))

(assert (= (and d!136805 (not res!828649)) b!1242591))

(assert (= (and b!1242591 res!828650) b!1242592))

(declare-fun m!1145293 () Bool)

(assert (=> b!1242592 m!1145293))

(assert (=> d!136631 d!136805))

(assert (=> d!136631 d!136635))

(declare-fun d!136807 () Bool)

(assert (=> d!136807 (= ($colon$colon!626 e!704124 (ite c!121569 (h!28575 l!644) (tuple2!20283 key1!25 v1!20))) (Cons!27366 (ite c!121569 (h!28575 l!644) (tuple2!20283 key1!25 v1!20)) e!704124))))

(assert (=> bm!61294 d!136807))

(declare-fun d!136809 () Bool)

(declare-fun res!828651 () Bool)

(declare-fun e!704397 () Bool)

(assert (=> d!136809 (=> res!828651 e!704397)))

(assert (=> d!136809 (= res!828651 (and (is-Cons!27366 lt!562202) (= (_1!10152 (h!28575 lt!562202)) key1!25)))))

(assert (=> d!136809 (= (containsKey!612 lt!562202 key1!25) e!704397)))

(declare-fun b!1242593 () Bool)

(declare-fun e!704398 () Bool)

(assert (=> b!1242593 (= e!704397 e!704398)))

(declare-fun res!828652 () Bool)

(assert (=> b!1242593 (=> (not res!828652) (not e!704398))))

(assert (=> b!1242593 (= res!828652 (and (or (not (is-Cons!27366 lt!562202)) (bvsle (_1!10152 (h!28575 lt!562202)) key1!25)) (is-Cons!27366 lt!562202) (bvslt (_1!10152 (h!28575 lt!562202)) key1!25)))))

(declare-fun b!1242594 () Bool)

(assert (=> b!1242594 (= e!704398 (containsKey!612 (t!40833 lt!562202) key1!25))))

(assert (= (and d!136809 (not res!828651)) b!1242593))

(assert (= (and b!1242593 res!828652) b!1242594))

(declare-fun m!1145295 () Bool)

(assert (=> b!1242594 m!1145295))

(assert (=> b!1242172 d!136809))

(declare-fun d!136811 () Bool)

(assert (=> d!136811 (= ($colon$colon!626 e!704157 (ite c!121593 (h!28575 (t!40833 l!644)) (tuple2!20283 key1!25 v1!20))) (Cons!27366 (ite c!121593 (h!28575 (t!40833 l!644)) (tuple2!20283 key1!25 v1!20)) e!704157))))

(assert (=> bm!61306 d!136811))

(declare-fun d!136813 () Bool)

(declare-fun res!828653 () Bool)

(declare-fun e!704399 () Bool)

(assert (=> d!136813 (=> res!828653 e!704399)))

(assert (=> d!136813 (= res!828653 (or (is-Nil!27367 lt!562210) (is-Nil!27367 (t!40833 lt!562210))))))

(assert (=> d!136813 (= (isStrictlySorted!763 lt!562210) e!704399)))

(declare-fun b!1242595 () Bool)

(declare-fun e!704400 () Bool)

(assert (=> b!1242595 (= e!704399 e!704400)))

(declare-fun res!828654 () Bool)

(assert (=> b!1242595 (=> (not res!828654) (not e!704400))))

(assert (=> b!1242595 (= res!828654 (bvslt (_1!10152 (h!28575 lt!562210)) (_1!10152 (h!28575 (t!40833 lt!562210)))))))

(declare-fun b!1242596 () Bool)

(assert (=> b!1242596 (= e!704400 (isStrictlySorted!763 (t!40833 lt!562210)))))

(assert (= (and d!136813 (not res!828653)) b!1242595))

(assert (= (and b!1242595 res!828654) b!1242596))

(declare-fun m!1145297 () Bool)

(assert (=> b!1242596 m!1145297))

(assert (=> d!136613 d!136813))

(assert (=> d!136613 d!136639))

(declare-fun b!1242597 () Bool)

(declare-fun e!704401 () Bool)

(declare-fun tp!92761 () Bool)

(assert (=> b!1242597 (= e!704401 (and tp_is_empty!31285 tp!92761))))

(assert (=> b!1242309 (= tp!92756 e!704401)))

(assert (= (and b!1242309 (is-Cons!27366 (t!40833 (t!40833 l!644)))) b!1242597))

(push 1)

(assert (not b!1242563))

(assert (not b!1242518))

(assert (not b!1242549))

(assert (not b!1242548))

(assert (not b!1242583))

(assert tp_is_empty!31285)

(assert (not b!1242578))

(assert (not b!1242526))

(assert (not b!1242535))

(assert (not b!1242594))

(assert (not b!1242557))

(assert (not d!136795))

(assert (not d!136791))

(assert (not b!1242541))

(assert (not b!1242511))

(assert (not b!1242499))

(assert (not b!1242567))

(assert (not b!1242565))

(assert (not b!1242592))

(assert (not b!1242522))

(assert (not b!1242584))

(assert (not d!136765))

(assert (not bm!61339))

(assert (not bm!61336))

(assert (not b!1242543))

(assert (not b!1242597))

(assert (not b!1242545))

(assert (not d!136773))

(assert (not b!1242530))

(assert (not d!136743))

(assert (not b!1242580))

(assert (not b!1242588))

(assert (not b!1242537))

(assert (not b!1242559))

(assert (not b!1242514))

(assert (not b!1242561))

(assert (not b!1242553))

(assert (not bm!61342))

(assert (not b!1242512))

(assert (not b!1242503))

(assert (not b!1242596))

(assert (not b!1242570))

(assert (not d!136793))

(assert (not b!1242520))

(assert (not b!1242509))

(assert (not b!1242568))

(assert (not b!1242534))

(assert (not b!1242574))

(assert (not d!136751))

(assert (not d!136741))

(assert (not b!1242576))

(assert (not b!1242525))

(assert (not d!136759))

(assert (not b!1242501))

(assert (not d!136747))

(assert (not d!136801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

