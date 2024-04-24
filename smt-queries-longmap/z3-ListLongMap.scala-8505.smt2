; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103910 () Bool)

(assert start!103910)

(declare-datatypes ((B!1856 0))(
  ( (B!1857 (val!15690 Int)) )
))
(declare-datatypes ((tuple2!20268 0))(
  ( (tuple2!20269 (_1!10145 (_ BitVec 64)) (_2!10145 B!1856)) )
))
(declare-datatypes ((List!27380 0))(
  ( (Nil!27377) (Cons!27376 (h!28594 tuple2!20268) (t!40835 List!27380)) )
))
(declare-fun l!644 () List!27380)

(declare-fun v1!20 () B!1856)

(declare-fun b!1242935 () Bool)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun e!704636 () Bool)

(declare-fun isStrictlySorted!739 (List!27380) Bool)

(declare-fun insertStrictlySorted!435 (List!27380 (_ BitVec 64) B!1856) List!27380)

(assert (=> b!1242935 (= e!704636 (not (isStrictlySorted!739 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))

(declare-fun b!1242936 () Bool)

(declare-fun e!704635 () Bool)

(declare-fun tp_is_empty!31255 () Bool)

(declare-fun tp!92663 () Bool)

(assert (=> b!1242936 (= e!704635 (and tp_is_empty!31255 tp!92663))))

(declare-fun res!828731 () Bool)

(assert (=> start!103910 (=> (not res!828731) (not e!704636))))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103910 (= res!828731 (not (= key1!25 key2!15)))))

(assert (=> start!103910 e!704636))

(assert (=> start!103910 true))

(assert (=> start!103910 e!704635))

(assert (=> start!103910 tp_is_empty!31255))

(declare-fun b!1242933 () Bool)

(declare-fun res!828732 () Bool)

(assert (=> b!1242933 (=> (not res!828732) (not e!704636))))

(assert (=> b!1242933 (= res!828732 (isStrictlySorted!739 l!644))))

(declare-fun b!1242934 () Bool)

(declare-fun res!828730 () Bool)

(assert (=> b!1242934 (=> (not res!828730) (not e!704636))))

(get-info :version)

(assert (=> b!1242934 (= res!828730 (not ((_ is Cons!27376) l!644)))))

(assert (= (and start!103910 res!828731) b!1242933))

(assert (= (and b!1242933 res!828732) b!1242934))

(assert (= (and b!1242934 res!828730) b!1242935))

(assert (= (and start!103910 ((_ is Cons!27376) l!644)) b!1242936))

(declare-fun m!1146257 () Bool)

(assert (=> b!1242935 m!1146257))

(assert (=> b!1242935 m!1146257))

(declare-fun m!1146259 () Bool)

(assert (=> b!1242935 m!1146259))

(declare-fun m!1146261 () Bool)

(assert (=> b!1242933 m!1146261))

(check-sat (not b!1242935) (not b!1242933) (not b!1242936) tp_is_empty!31255)
(check-sat)
(get-model)

(declare-fun d!136979 () Bool)

(declare-fun res!828761 () Bool)

(declare-fun e!704659 () Bool)

(assert (=> d!136979 (=> res!828761 e!704659)))

(assert (=> d!136979 (= res!828761 (or ((_ is Nil!27377) (insertStrictlySorted!435 l!644 key1!25 v1!20)) ((_ is Nil!27377) (t!40835 (insertStrictlySorted!435 l!644 key1!25 v1!20)))))))

(assert (=> d!136979 (= (isStrictlySorted!739 (insertStrictlySorted!435 l!644 key1!25 v1!20)) e!704659)))

(declare-fun b!1242971 () Bool)

(declare-fun e!704660 () Bool)

(assert (=> b!1242971 (= e!704659 e!704660)))

(declare-fun res!828762 () Bool)

(assert (=> b!1242971 (=> (not res!828762) (not e!704660))))

(assert (=> b!1242971 (= res!828762 (bvslt (_1!10145 (h!28594 (insertStrictlySorted!435 l!644 key1!25 v1!20))) (_1!10145 (h!28594 (t!40835 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))))

(declare-fun b!1242972 () Bool)

(assert (=> b!1242972 (= e!704660 (isStrictlySorted!739 (t!40835 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))

(assert (= (and d!136979 (not res!828761)) b!1242971))

(assert (= (and b!1242971 res!828762) b!1242972))

(declare-fun m!1146277 () Bool)

(assert (=> b!1242972 m!1146277))

(assert (=> b!1242935 d!136979))

(declare-fun b!1243029 () Bool)

(declare-fun c!121895 () Bool)

(assert (=> b!1243029 (= c!121895 (and ((_ is Cons!27376) l!644) (bvsgt (_1!10145 (h!28594 l!644)) key1!25)))))

(declare-fun e!704693 () List!27380)

(declare-fun e!704696 () List!27380)

(assert (=> b!1243029 (= e!704693 e!704696)))

(declare-fun e!704692 () List!27380)

(declare-fun b!1243030 () Bool)

(declare-fun c!121892 () Bool)

(assert (=> b!1243030 (= e!704692 (ite c!121892 (t!40835 l!644) (ite c!121895 (Cons!27376 (h!28594 l!644) (t!40835 l!644)) Nil!27377)))))

(declare-fun b!1243031 () Bool)

(declare-fun e!704694 () List!27380)

(declare-fun call!61332 () List!27380)

(assert (=> b!1243031 (= e!704694 call!61332)))

(declare-fun bm!61327 () Bool)

(declare-fun c!121894 () Bool)

(declare-fun $colon$colon!623 (List!27380 tuple2!20268) List!27380)

(assert (=> bm!61327 (= call!61332 ($colon$colon!623 e!704692 (ite c!121894 (h!28594 l!644) (tuple2!20269 key1!25 v1!20))))))

(declare-fun c!121893 () Bool)

(assert (=> bm!61327 (= c!121893 c!121894)))

(declare-fun b!1243032 () Bool)

(declare-fun e!704695 () Bool)

(declare-fun lt!562643 () List!27380)

(declare-fun contains!7424 (List!27380 tuple2!20268) Bool)

(assert (=> b!1243032 (= e!704695 (contains!7424 lt!562643 (tuple2!20269 key1!25 v1!20)))))

(declare-fun b!1243033 () Bool)

(declare-fun res!828779 () Bool)

(assert (=> b!1243033 (=> (not res!828779) (not e!704695))))

(declare-fun containsKey!611 (List!27380 (_ BitVec 64)) Bool)

(assert (=> b!1243033 (= res!828779 (containsKey!611 lt!562643 key1!25))))

(declare-fun b!1243034 () Bool)

(declare-fun call!61331 () List!27380)

(assert (=> b!1243034 (= e!704696 call!61331)))

(declare-fun b!1243035 () Bool)

(declare-fun call!61330 () List!27380)

(assert (=> b!1243035 (= e!704693 call!61330)))

(declare-fun b!1243036 () Bool)

(assert (=> b!1243036 (= e!704696 call!61331)))

(declare-fun bm!61328 () Bool)

(assert (=> bm!61328 (= call!61330 call!61332)))

(declare-fun d!136985 () Bool)

(assert (=> d!136985 e!704695))

(declare-fun res!828780 () Bool)

(assert (=> d!136985 (=> (not res!828780) (not e!704695))))

(assert (=> d!136985 (= res!828780 (isStrictlySorted!739 lt!562643))))

(assert (=> d!136985 (= lt!562643 e!704694)))

(assert (=> d!136985 (= c!121894 (and ((_ is Cons!27376) l!644) (bvslt (_1!10145 (h!28594 l!644)) key1!25)))))

(assert (=> d!136985 (isStrictlySorted!739 l!644)))

(assert (=> d!136985 (= (insertStrictlySorted!435 l!644 key1!25 v1!20) lt!562643)))

(declare-fun bm!61329 () Bool)

(assert (=> bm!61329 (= call!61331 call!61330)))

(declare-fun b!1243037 () Bool)

(assert (=> b!1243037 (= e!704694 e!704693)))

(assert (=> b!1243037 (= c!121892 (and ((_ is Cons!27376) l!644) (= (_1!10145 (h!28594 l!644)) key1!25)))))

(declare-fun b!1243038 () Bool)

(assert (=> b!1243038 (= e!704692 (insertStrictlySorted!435 (t!40835 l!644) key1!25 v1!20))))

(assert (= (and d!136985 c!121894) b!1243031))

(assert (= (and d!136985 (not c!121894)) b!1243037))

(assert (= (and b!1243037 c!121892) b!1243035))

(assert (= (and b!1243037 (not c!121892)) b!1243029))

(assert (= (and b!1243029 c!121895) b!1243036))

(assert (= (and b!1243029 (not c!121895)) b!1243034))

(assert (= (or b!1243036 b!1243034) bm!61329))

(assert (= (or b!1243035 bm!61329) bm!61328))

(assert (= (or b!1243031 bm!61328) bm!61327))

(assert (= (and bm!61327 c!121893) b!1243038))

(assert (= (and bm!61327 (not c!121893)) b!1243030))

(assert (= (and d!136985 res!828780) b!1243033))

(assert (= (and b!1243033 res!828779) b!1243032))

(declare-fun m!1146285 () Bool)

(assert (=> b!1243038 m!1146285))

(declare-fun m!1146289 () Bool)

(assert (=> d!136985 m!1146289))

(assert (=> d!136985 m!1146261))

(declare-fun m!1146295 () Bool)

(assert (=> bm!61327 m!1146295))

(declare-fun m!1146297 () Bool)

(assert (=> b!1243032 m!1146297))

(declare-fun m!1146299 () Bool)

(assert (=> b!1243033 m!1146299))

(assert (=> b!1242935 d!136985))

(declare-fun d!136991 () Bool)

(declare-fun res!828783 () Bool)

(declare-fun e!704699 () Bool)

(assert (=> d!136991 (=> res!828783 e!704699)))

(assert (=> d!136991 (= res!828783 (or ((_ is Nil!27377) l!644) ((_ is Nil!27377) (t!40835 l!644))))))

(assert (=> d!136991 (= (isStrictlySorted!739 l!644) e!704699)))

(declare-fun b!1243041 () Bool)

(declare-fun e!704700 () Bool)

(assert (=> b!1243041 (= e!704699 e!704700)))

(declare-fun res!828784 () Bool)

(assert (=> b!1243041 (=> (not res!828784) (not e!704700))))

(assert (=> b!1243041 (= res!828784 (bvslt (_1!10145 (h!28594 l!644)) (_1!10145 (h!28594 (t!40835 l!644)))))))

(declare-fun b!1243042 () Bool)

(assert (=> b!1243042 (= e!704700 (isStrictlySorted!739 (t!40835 l!644)))))

(assert (= (and d!136991 (not res!828783)) b!1243041))

(assert (= (and b!1243041 res!828784) b!1243042))

(declare-fun m!1146303 () Bool)

(assert (=> b!1243042 m!1146303))

(assert (=> b!1242933 d!136991))

(declare-fun b!1243052 () Bool)

(declare-fun e!704706 () Bool)

(declare-fun tp!92675 () Bool)

(assert (=> b!1243052 (= e!704706 (and tp_is_empty!31255 tp!92675))))

(assert (=> b!1242936 (= tp!92663 e!704706)))

(assert (= (and b!1242936 ((_ is Cons!27376) (t!40835 l!644))) b!1243052))

(check-sat (not bm!61327) (not b!1243052) (not b!1243038) (not b!1243042) tp_is_empty!31255 (not b!1242972) (not b!1243032) (not b!1243033) (not d!136985))
(check-sat)
