; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7302 () Bool)

(assert start!7302)

(declare-fun res!27337 () Bool)

(declare-fun e!29887 () Bool)

(assert (=> start!7302 (=> (not res!27337) (not e!29887))))

(declare-datatypes ((B!896 0))(
  ( (B!897 (val!1035 Int)) )
))
(declare-datatypes ((tuple2!1722 0))(
  ( (tuple2!1723 (_1!872 (_ BitVec 64)) (_2!872 B!896)) )
))
(declare-datatypes ((List!1246 0))(
  ( (Nil!1243) (Cons!1242 (h!1822 tuple2!1722) (t!4273 List!1246)) )
))
(declare-fun l!812 () List!1246)

(declare-fun isStrictlySorted!239 (List!1246) Bool)

(assert (=> start!7302 (= res!27337 (isStrictlySorted!239 l!812))))

(assert (=> start!7302 e!29887))

(declare-fun e!29886 () Bool)

(assert (=> start!7302 e!29886))

(assert (=> start!7302 true))

(declare-fun b!46816 () Bool)

(declare-fun res!27336 () Bool)

(assert (=> b!46816 (=> (not res!27336) (not e!29887))))

(get-info :version)

(assert (=> b!46816 (= res!27336 (not ((_ is Cons!1242) l!812)))))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46817 () Bool)

(declare-fun removeStrictlySorted!45 (List!1246 (_ BitVec 64)) List!1246)

(assert (=> b!46817 (= e!29887 (not (= (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key1!43) key2!27) (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key2!27) key1!43))))))

(declare-fun b!46818 () Bool)

(declare-fun tp_is_empty!1993 () Bool)

(declare-fun tp!6158 () Bool)

(assert (=> b!46818 (= e!29886 (and tp_is_empty!1993 tp!6158))))

(assert (= (and start!7302 res!27337) b!46816))

(assert (= (and b!46816 res!27336) b!46817))

(assert (= (and start!7302 ((_ is Cons!1242) l!812)) b!46818))

(declare-fun m!41183 () Bool)

(assert (=> start!7302 m!41183))

(declare-fun m!41185 () Bool)

(assert (=> b!46817 m!41185))

(assert (=> b!46817 m!41185))

(declare-fun m!41187 () Bool)

(assert (=> b!46817 m!41187))

(declare-fun m!41189 () Bool)

(assert (=> b!46817 m!41189))

(assert (=> b!46817 m!41189))

(declare-fun m!41191 () Bool)

(assert (=> b!46817 m!41191))

(check-sat (not b!46817) (not start!7302) (not b!46818) tp_is_empty!1993)
(check-sat)
(get-model)

(declare-fun d!9351 () Bool)

(declare-fun e!29936 () Bool)

(assert (=> d!9351 e!29936))

(declare-fun res!27366 () Bool)

(assert (=> d!9351 (=> (not res!27366) (not e!29936))))

(declare-fun lt!20357 () List!1246)

(assert (=> d!9351 (= res!27366 (isStrictlySorted!239 lt!20357))))

(declare-fun e!29937 () List!1246)

(assert (=> d!9351 (= lt!20357 e!29937)))

(declare-fun c!6358 () Bool)

(assert (=> d!9351 (= c!6358 (and ((_ is Cons!1242) (removeStrictlySorted!45 l!812 key1!43)) (= (_1!872 (h!1822 (removeStrictlySorted!45 l!812 key1!43))) key2!27)))))

(assert (=> d!9351 (isStrictlySorted!239 (removeStrictlySorted!45 l!812 key1!43))))

(assert (=> d!9351 (= (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key1!43) key2!27) lt!20357)))

(declare-fun e!29938 () List!1246)

(declare-fun b!46893 () Bool)

(declare-fun $colon$colon!47 (List!1246 tuple2!1722) List!1246)

(assert (=> b!46893 (= e!29938 ($colon$colon!47 (removeStrictlySorted!45 (t!4273 (removeStrictlySorted!45 l!812 key1!43)) key2!27) (h!1822 (removeStrictlySorted!45 l!812 key1!43))))))

(declare-fun b!46894 () Bool)

(assert (=> b!46894 (= e!29937 e!29938)))

(declare-fun c!6359 () Bool)

(assert (=> b!46894 (= c!6359 (and ((_ is Cons!1242) (removeStrictlySorted!45 l!812 key1!43)) (not (= (_1!872 (h!1822 (removeStrictlySorted!45 l!812 key1!43))) key2!27))))))

(declare-fun b!46895 () Bool)

(assert (=> b!46895 (= e!29938 Nil!1243)))

(declare-fun b!46896 () Bool)

(declare-fun containsKey!92 (List!1246 (_ BitVec 64)) Bool)

(assert (=> b!46896 (= e!29936 (not (containsKey!92 lt!20357 key2!27)))))

(declare-fun b!46897 () Bool)

(assert (=> b!46897 (= e!29937 (t!4273 (removeStrictlySorted!45 l!812 key1!43)))))

(assert (= (and d!9351 c!6358) b!46897))

(assert (= (and d!9351 (not c!6358)) b!46894))

(assert (= (and b!46894 c!6359) b!46893))

(assert (= (and b!46894 (not c!6359)) b!46895))

(assert (= (and d!9351 res!27366) b!46896))

(declare-fun m!41251 () Bool)

(assert (=> d!9351 m!41251))

(assert (=> d!9351 m!41185))

(declare-fun m!41253 () Bool)

(assert (=> d!9351 m!41253))

(declare-fun m!41255 () Bool)

(assert (=> b!46893 m!41255))

(assert (=> b!46893 m!41255))

(declare-fun m!41257 () Bool)

(assert (=> b!46893 m!41257))

(declare-fun m!41259 () Bool)

(assert (=> b!46896 m!41259))

(assert (=> b!46817 d!9351))

(declare-fun d!9363 () Bool)

(declare-fun e!29942 () Bool)

(assert (=> d!9363 e!29942))

(declare-fun res!27368 () Bool)

(assert (=> d!9363 (=> (not res!27368) (not e!29942))))

(declare-fun lt!20359 () List!1246)

(assert (=> d!9363 (= res!27368 (isStrictlySorted!239 lt!20359))))

(declare-fun e!29943 () List!1246)

(assert (=> d!9363 (= lt!20359 e!29943)))

(declare-fun c!6362 () Bool)

(assert (=> d!9363 (= c!6362 (and ((_ is Cons!1242) l!812) (= (_1!872 (h!1822 l!812)) key1!43)))))

(assert (=> d!9363 (isStrictlySorted!239 l!812)))

(assert (=> d!9363 (= (removeStrictlySorted!45 l!812 key1!43) lt!20359)))

(declare-fun b!46903 () Bool)

(declare-fun e!29944 () List!1246)

(assert (=> b!46903 (= e!29944 ($colon$colon!47 (removeStrictlySorted!45 (t!4273 l!812) key1!43) (h!1822 l!812)))))

(declare-fun b!46904 () Bool)

(assert (=> b!46904 (= e!29943 e!29944)))

(declare-fun c!6363 () Bool)

(assert (=> b!46904 (= c!6363 (and ((_ is Cons!1242) l!812) (not (= (_1!872 (h!1822 l!812)) key1!43))))))

(declare-fun b!46905 () Bool)

(assert (=> b!46905 (= e!29944 Nil!1243)))

(declare-fun b!46906 () Bool)

(assert (=> b!46906 (= e!29942 (not (containsKey!92 lt!20359 key1!43)))))

(declare-fun b!46907 () Bool)

(assert (=> b!46907 (= e!29943 (t!4273 l!812))))

(assert (= (and d!9363 c!6362) b!46907))

(assert (= (and d!9363 (not c!6362)) b!46904))

(assert (= (and b!46904 c!6363) b!46903))

(assert (= (and b!46904 (not c!6363)) b!46905))

(assert (= (and d!9363 res!27368) b!46906))

(declare-fun m!41263 () Bool)

(assert (=> d!9363 m!41263))

(assert (=> d!9363 m!41183))

(declare-fun m!41267 () Bool)

(assert (=> b!46903 m!41267))

(assert (=> b!46903 m!41267))

(declare-fun m!41271 () Bool)

(assert (=> b!46903 m!41271))

(declare-fun m!41275 () Bool)

(assert (=> b!46906 m!41275))

(assert (=> b!46817 d!9363))

(declare-fun d!9365 () Bool)

(declare-fun e!29945 () Bool)

(assert (=> d!9365 e!29945))

(declare-fun res!27369 () Bool)

(assert (=> d!9365 (=> (not res!27369) (not e!29945))))

(declare-fun lt!20361 () List!1246)

(assert (=> d!9365 (= res!27369 (isStrictlySorted!239 lt!20361))))

(declare-fun e!29946 () List!1246)

(assert (=> d!9365 (= lt!20361 e!29946)))

(declare-fun c!6364 () Bool)

(assert (=> d!9365 (= c!6364 (and ((_ is Cons!1242) (removeStrictlySorted!45 l!812 key2!27)) (= (_1!872 (h!1822 (removeStrictlySorted!45 l!812 key2!27))) key1!43)))))

(assert (=> d!9365 (isStrictlySorted!239 (removeStrictlySorted!45 l!812 key2!27))))

(assert (=> d!9365 (= (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key2!27) key1!43) lt!20361)))

(declare-fun b!46908 () Bool)

(declare-fun e!29947 () List!1246)

(assert (=> b!46908 (= e!29947 ($colon$colon!47 (removeStrictlySorted!45 (t!4273 (removeStrictlySorted!45 l!812 key2!27)) key1!43) (h!1822 (removeStrictlySorted!45 l!812 key2!27))))))

(declare-fun b!46909 () Bool)

(assert (=> b!46909 (= e!29946 e!29947)))

(declare-fun c!6366 () Bool)

(assert (=> b!46909 (= c!6366 (and ((_ is Cons!1242) (removeStrictlySorted!45 l!812 key2!27)) (not (= (_1!872 (h!1822 (removeStrictlySorted!45 l!812 key2!27))) key1!43))))))

(declare-fun b!46910 () Bool)

(assert (=> b!46910 (= e!29947 Nil!1243)))

(declare-fun b!46911 () Bool)

(assert (=> b!46911 (= e!29945 (not (containsKey!92 lt!20361 key1!43)))))

(declare-fun b!46912 () Bool)

(assert (=> b!46912 (= e!29946 (t!4273 (removeStrictlySorted!45 l!812 key2!27)))))

(assert (= (and d!9365 c!6364) b!46912))

(assert (= (and d!9365 (not c!6364)) b!46909))

(assert (= (and b!46909 c!6366) b!46908))

(assert (= (and b!46909 (not c!6366)) b!46910))

(assert (= (and d!9365 res!27369) b!46911))

(declare-fun m!41279 () Bool)

(assert (=> d!9365 m!41279))

(assert (=> d!9365 m!41189))

(declare-fun m!41283 () Bool)

(assert (=> d!9365 m!41283))

(declare-fun m!41287 () Bool)

(assert (=> b!46908 m!41287))

(assert (=> b!46908 m!41287))

(declare-fun m!41291 () Bool)

(assert (=> b!46908 m!41291))

(declare-fun m!41295 () Bool)

(assert (=> b!46911 m!41295))

(assert (=> b!46817 d!9365))

(declare-fun d!9371 () Bool)

(declare-fun e!29956 () Bool)

(assert (=> d!9371 e!29956))

(declare-fun res!27375 () Bool)

(assert (=> d!9371 (=> (not res!27375) (not e!29956))))

(declare-fun lt!20363 () List!1246)

(assert (=> d!9371 (= res!27375 (isStrictlySorted!239 lt!20363))))

(declare-fun e!29957 () List!1246)

(assert (=> d!9371 (= lt!20363 e!29957)))

(declare-fun c!6370 () Bool)

(assert (=> d!9371 (= c!6370 (and ((_ is Cons!1242) l!812) (= (_1!872 (h!1822 l!812)) key2!27)))))

(assert (=> d!9371 (isStrictlySorted!239 l!812)))

(assert (=> d!9371 (= (removeStrictlySorted!45 l!812 key2!27) lt!20363)))

(declare-fun b!46923 () Bool)

(declare-fun e!29958 () List!1246)

(assert (=> b!46923 (= e!29958 ($colon$colon!47 (removeStrictlySorted!45 (t!4273 l!812) key2!27) (h!1822 l!812)))))

(declare-fun b!46925 () Bool)

(assert (=> b!46925 (= e!29957 e!29958)))

(declare-fun c!6371 () Bool)

(assert (=> b!46925 (= c!6371 (and ((_ is Cons!1242) l!812) (not (= (_1!872 (h!1822 l!812)) key2!27))))))

(declare-fun b!46927 () Bool)

(assert (=> b!46927 (= e!29958 Nil!1243)))

(declare-fun b!46929 () Bool)

(assert (=> b!46929 (= e!29956 (not (containsKey!92 lt!20363 key2!27)))))

(declare-fun b!46931 () Bool)

(assert (=> b!46931 (= e!29957 (t!4273 l!812))))

(assert (= (and d!9371 c!6370) b!46931))

(assert (= (and d!9371 (not c!6370)) b!46925))

(assert (= (and b!46925 c!6371) b!46923))

(assert (= (and b!46925 (not c!6371)) b!46927))

(assert (= (and d!9371 res!27375) b!46929))

(declare-fun m!41297 () Bool)

(assert (=> d!9371 m!41297))

(assert (=> d!9371 m!41183))

(declare-fun m!41301 () Bool)

(assert (=> b!46923 m!41301))

(assert (=> b!46923 m!41301))

(declare-fun m!41307 () Bool)

(assert (=> b!46923 m!41307))

(declare-fun m!41309 () Bool)

(assert (=> b!46929 m!41309))

(assert (=> b!46817 d!9371))

(declare-fun d!9373 () Bool)

(declare-fun res!27384 () Bool)

(declare-fun e!29976 () Bool)

(assert (=> d!9373 (=> res!27384 e!29976)))

(assert (=> d!9373 (= res!27384 (or ((_ is Nil!1243) l!812) ((_ is Nil!1243) (t!4273 l!812))))))

(assert (=> d!9373 (= (isStrictlySorted!239 l!812) e!29976)))

(declare-fun b!46953 () Bool)

(declare-fun e!29977 () Bool)

(assert (=> b!46953 (= e!29976 e!29977)))

(declare-fun res!27385 () Bool)

(assert (=> b!46953 (=> (not res!27385) (not e!29977))))

(assert (=> b!46953 (= res!27385 (bvslt (_1!872 (h!1822 l!812)) (_1!872 (h!1822 (t!4273 l!812)))))))

(declare-fun b!46954 () Bool)

(assert (=> b!46954 (= e!29977 (isStrictlySorted!239 (t!4273 l!812)))))

(assert (= (and d!9373 (not res!27384)) b!46953))

(assert (= (and b!46953 res!27385) b!46954))

(declare-fun m!41325 () Bool)

(assert (=> b!46954 m!41325))

(assert (=> start!7302 d!9373))

(declare-fun b!46959 () Bool)

(declare-fun e!29980 () Bool)

(declare-fun tp!6173 () Bool)

(assert (=> b!46959 (= e!29980 (and tp_is_empty!1993 tp!6173))))

(assert (=> b!46818 (= tp!6158 e!29980)))

(assert (= (and b!46818 ((_ is Cons!1242) (t!4273 l!812))) b!46959))

(check-sat (not b!46911) (not d!9363) (not b!46908) (not b!46906) (not b!46923) (not b!46893) (not d!9371) tp_is_empty!1993 (not b!46896) (not d!9351) (not b!46954) (not b!46903) (not b!46959) (not b!46929) (not d!9365))
(check-sat)
