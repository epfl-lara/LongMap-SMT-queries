; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7306 () Bool)

(assert start!7306)

(declare-fun res!27331 () Bool)

(declare-fun e!29893 () Bool)

(assert (=> start!7306 (=> (not res!27331) (not e!29893))))

(declare-datatypes ((B!896 0))(
  ( (B!897 (val!1035 Int)) )
))
(declare-datatypes ((tuple2!1700 0))(
  ( (tuple2!1701 (_1!861 (_ BitVec 64)) (_2!861 B!896)) )
))
(declare-datatypes ((List!1239 0))(
  ( (Nil!1236) (Cons!1235 (h!1815 tuple2!1700) (t!4267 List!1239)) )
))
(declare-fun l!812 () List!1239)

(declare-fun isStrictlySorted!232 (List!1239) Bool)

(assert (=> start!7306 (= res!27331 (isStrictlySorted!232 l!812))))

(assert (=> start!7306 e!29893))

(declare-fun e!29892 () Bool)

(assert (=> start!7306 e!29892))

(assert (=> start!7306 true))

(declare-fun b!46825 () Bool)

(declare-fun res!27332 () Bool)

(assert (=> b!46825 (=> (not res!27332) (not e!29893))))

(get-info :version)

(assert (=> b!46825 (= res!27332 (not ((_ is Cons!1235) l!812)))))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46826 () Bool)

(declare-fun removeStrictlySorted!44 (List!1239 (_ BitVec 64)) List!1239)

(assert (=> b!46826 (= e!29893 (not (= (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key1!43) key2!27) (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key2!27) key1!43))))))

(declare-fun b!46827 () Bool)

(declare-fun tp_is_empty!1993 () Bool)

(declare-fun tp!6158 () Bool)

(assert (=> b!46827 (= e!29892 (and tp_is_empty!1993 tp!6158))))

(assert (= (and start!7306 res!27331) b!46825))

(assert (= (and b!46825 res!27332) b!46826))

(assert (= (and start!7306 ((_ is Cons!1235) l!812)) b!46827))

(declare-fun m!41141 () Bool)

(assert (=> start!7306 m!41141))

(declare-fun m!41143 () Bool)

(assert (=> b!46826 m!41143))

(assert (=> b!46826 m!41143))

(declare-fun m!41145 () Bool)

(assert (=> b!46826 m!41145))

(declare-fun m!41147 () Bool)

(assert (=> b!46826 m!41147))

(assert (=> b!46826 m!41147))

(declare-fun m!41149 () Bool)

(assert (=> b!46826 m!41149))

(check-sat (not b!46826) (not start!7306) (not b!46827) tp_is_empty!1993)
(check-sat)
(get-model)

(declare-fun d!9363 () Bool)

(declare-fun e!29920 () Bool)

(assert (=> d!9363 e!29920))

(declare-fun res!27353 () Bool)

(assert (=> d!9363 (=> (not res!27353) (not e!29920))))

(declare-fun lt!20324 () List!1239)

(assert (=> d!9363 (= res!27353 (isStrictlySorted!232 lt!20324))))

(declare-fun e!29918 () List!1239)

(assert (=> d!9363 (= lt!20324 e!29918)))

(declare-fun c!6350 () Bool)

(assert (=> d!9363 (= c!6350 (and ((_ is Cons!1235) (removeStrictlySorted!44 l!812 key1!43)) (= (_1!861 (h!1815 (removeStrictlySorted!44 l!812 key1!43))) key2!27)))))

(assert (=> d!9363 (isStrictlySorted!232 (removeStrictlySorted!44 l!812 key1!43))))

(assert (=> d!9363 (= (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key1!43) key2!27) lt!20324)))

(declare-fun b!46863 () Bool)

(declare-fun e!29919 () List!1239)

(declare-fun $colon$colon!46 (List!1239 tuple2!1700) List!1239)

(assert (=> b!46863 (= e!29919 ($colon$colon!46 (removeStrictlySorted!44 (t!4267 (removeStrictlySorted!44 l!812 key1!43)) key2!27) (h!1815 (removeStrictlySorted!44 l!812 key1!43))))))

(declare-fun b!46865 () Bool)

(assert (=> b!46865 (= e!29918 (t!4267 (removeStrictlySorted!44 l!812 key1!43)))))

(declare-fun b!46866 () Bool)

(declare-fun containsKey!93 (List!1239 (_ BitVec 64)) Bool)

(assert (=> b!46866 (= e!29920 (not (containsKey!93 lt!20324 key2!27)))))

(declare-fun b!46867 () Bool)

(assert (=> b!46867 (= e!29918 e!29919)))

(declare-fun c!6349 () Bool)

(assert (=> b!46867 (= c!6349 (and ((_ is Cons!1235) (removeStrictlySorted!44 l!812 key1!43)) (not (= (_1!861 (h!1815 (removeStrictlySorted!44 l!812 key1!43))) key2!27))))))

(declare-fun b!46868 () Bool)

(assert (=> b!46868 (= e!29919 Nil!1236)))

(assert (= (and d!9363 c!6350) b!46865))

(assert (= (and d!9363 (not c!6350)) b!46867))

(assert (= (and b!46867 c!6349) b!46863))

(assert (= (and b!46867 (not c!6349)) b!46868))

(assert (= (and d!9363 res!27353) b!46866))

(declare-fun m!41173 () Bool)

(assert (=> d!9363 m!41173))

(assert (=> d!9363 m!41143))

(declare-fun m!41175 () Bool)

(assert (=> d!9363 m!41175))

(declare-fun m!41177 () Bool)

(assert (=> b!46863 m!41177))

(assert (=> b!46863 m!41177))

(declare-fun m!41179 () Bool)

(assert (=> b!46863 m!41179))

(declare-fun m!41181 () Bool)

(assert (=> b!46866 m!41181))

(assert (=> b!46826 d!9363))

(declare-fun d!9369 () Bool)

(declare-fun e!29927 () Bool)

(assert (=> d!9369 e!29927))

(declare-fun res!27354 () Bool)

(assert (=> d!9369 (=> (not res!27354) (not e!29927))))

(declare-fun lt!20325 () List!1239)

(assert (=> d!9369 (= res!27354 (isStrictlySorted!232 lt!20325))))

(declare-fun e!29925 () List!1239)

(assert (=> d!9369 (= lt!20325 e!29925)))

(declare-fun c!6356 () Bool)

(assert (=> d!9369 (= c!6356 (and ((_ is Cons!1235) l!812) (= (_1!861 (h!1815 l!812)) key1!43)))))

(assert (=> d!9369 (isStrictlySorted!232 l!812)))

(assert (=> d!9369 (= (removeStrictlySorted!44 l!812 key1!43) lt!20325)))

(declare-fun b!46875 () Bool)

(declare-fun e!29926 () List!1239)

(assert (=> b!46875 (= e!29926 ($colon$colon!46 (removeStrictlySorted!44 (t!4267 l!812) key1!43) (h!1815 l!812)))))

(declare-fun b!46876 () Bool)

(assert (=> b!46876 (= e!29925 (t!4267 l!812))))

(declare-fun b!46877 () Bool)

(assert (=> b!46877 (= e!29927 (not (containsKey!93 lt!20325 key1!43)))))

(declare-fun b!46878 () Bool)

(assert (=> b!46878 (= e!29925 e!29926)))

(declare-fun c!6355 () Bool)

(assert (=> b!46878 (= c!6355 (and ((_ is Cons!1235) l!812) (not (= (_1!861 (h!1815 l!812)) key1!43))))))

(declare-fun b!46879 () Bool)

(assert (=> b!46879 (= e!29926 Nil!1236)))

(assert (= (and d!9369 c!6356) b!46876))

(assert (= (and d!9369 (not c!6356)) b!46878))

(assert (= (and b!46878 c!6355) b!46875))

(assert (= (and b!46878 (not c!6355)) b!46879))

(assert (= (and d!9369 res!27354) b!46877))

(declare-fun m!41183 () Bool)

(assert (=> d!9369 m!41183))

(assert (=> d!9369 m!41141))

(declare-fun m!41185 () Bool)

(assert (=> b!46875 m!41185))

(assert (=> b!46875 m!41185))

(declare-fun m!41187 () Bool)

(assert (=> b!46875 m!41187))

(declare-fun m!41189 () Bool)

(assert (=> b!46877 m!41189))

(assert (=> b!46826 d!9369))

(declare-fun d!9371 () Bool)

(declare-fun e!29932 () Bool)

(assert (=> d!9371 e!29932))

(declare-fun res!27357 () Bool)

(assert (=> d!9371 (=> (not res!27357) (not e!29932))))

(declare-fun lt!20326 () List!1239)

(assert (=> d!9371 (= res!27357 (isStrictlySorted!232 lt!20326))))

(declare-fun e!29930 () List!1239)

(assert (=> d!9371 (= lt!20326 e!29930)))

(declare-fun c!6358 () Bool)

(assert (=> d!9371 (= c!6358 (and ((_ is Cons!1235) (removeStrictlySorted!44 l!812 key2!27)) (= (_1!861 (h!1815 (removeStrictlySorted!44 l!812 key2!27))) key1!43)))))

(assert (=> d!9371 (isStrictlySorted!232 (removeStrictlySorted!44 l!812 key2!27))))

(assert (=> d!9371 (= (removeStrictlySorted!44 (removeStrictlySorted!44 l!812 key2!27) key1!43) lt!20326)))

(declare-fun b!46882 () Bool)

(declare-fun e!29931 () List!1239)

(assert (=> b!46882 (= e!29931 ($colon$colon!46 (removeStrictlySorted!44 (t!4267 (removeStrictlySorted!44 l!812 key2!27)) key1!43) (h!1815 (removeStrictlySorted!44 l!812 key2!27))))))

(declare-fun b!46883 () Bool)

(assert (=> b!46883 (= e!29930 (t!4267 (removeStrictlySorted!44 l!812 key2!27)))))

(declare-fun b!46884 () Bool)

(assert (=> b!46884 (= e!29932 (not (containsKey!93 lt!20326 key1!43)))))

(declare-fun b!46885 () Bool)

(assert (=> b!46885 (= e!29930 e!29931)))

(declare-fun c!6357 () Bool)

(assert (=> b!46885 (= c!6357 (and ((_ is Cons!1235) (removeStrictlySorted!44 l!812 key2!27)) (not (= (_1!861 (h!1815 (removeStrictlySorted!44 l!812 key2!27))) key1!43))))))

(declare-fun b!46886 () Bool)

(assert (=> b!46886 (= e!29931 Nil!1236)))

(assert (= (and d!9371 c!6358) b!46883))

(assert (= (and d!9371 (not c!6358)) b!46885))

(assert (= (and b!46885 c!6357) b!46882))

(assert (= (and b!46885 (not c!6357)) b!46886))

(assert (= (and d!9371 res!27357) b!46884))

(declare-fun m!41191 () Bool)

(assert (=> d!9371 m!41191))

(assert (=> d!9371 m!41147))

(declare-fun m!41193 () Bool)

(assert (=> d!9371 m!41193))

(declare-fun m!41195 () Bool)

(assert (=> b!46882 m!41195))

(assert (=> b!46882 m!41195))

(declare-fun m!41197 () Bool)

(assert (=> b!46882 m!41197))

(declare-fun m!41199 () Bool)

(assert (=> b!46884 m!41199))

(assert (=> b!46826 d!9371))

(declare-fun d!9373 () Bool)

(declare-fun e!29935 () Bool)

(assert (=> d!9373 e!29935))

(declare-fun res!27358 () Bool)

(assert (=> d!9373 (=> (not res!27358) (not e!29935))))

(declare-fun lt!20327 () List!1239)

(assert (=> d!9373 (= res!27358 (isStrictlySorted!232 lt!20327))))

(declare-fun e!29933 () List!1239)

(assert (=> d!9373 (= lt!20327 e!29933)))

(declare-fun c!6360 () Bool)

(assert (=> d!9373 (= c!6360 (and ((_ is Cons!1235) l!812) (= (_1!861 (h!1815 l!812)) key2!27)))))

(assert (=> d!9373 (isStrictlySorted!232 l!812)))

(assert (=> d!9373 (= (removeStrictlySorted!44 l!812 key2!27) lt!20327)))

(declare-fun b!46887 () Bool)

(declare-fun e!29934 () List!1239)

(assert (=> b!46887 (= e!29934 ($colon$colon!46 (removeStrictlySorted!44 (t!4267 l!812) key2!27) (h!1815 l!812)))))

(declare-fun b!46888 () Bool)

(assert (=> b!46888 (= e!29933 (t!4267 l!812))))

(declare-fun b!46889 () Bool)

(assert (=> b!46889 (= e!29935 (not (containsKey!93 lt!20327 key2!27)))))

(declare-fun b!46890 () Bool)

(assert (=> b!46890 (= e!29933 e!29934)))

(declare-fun c!6359 () Bool)

(assert (=> b!46890 (= c!6359 (and ((_ is Cons!1235) l!812) (not (= (_1!861 (h!1815 l!812)) key2!27))))))

(declare-fun b!46891 () Bool)

(assert (=> b!46891 (= e!29934 Nil!1236)))

(assert (= (and d!9373 c!6360) b!46888))

(assert (= (and d!9373 (not c!6360)) b!46890))

(assert (= (and b!46890 c!6359) b!46887))

(assert (= (and b!46890 (not c!6359)) b!46891))

(assert (= (and d!9373 res!27358) b!46889))

(declare-fun m!41201 () Bool)

(assert (=> d!9373 m!41201))

(assert (=> d!9373 m!41141))

(declare-fun m!41203 () Bool)

(assert (=> b!46887 m!41203))

(assert (=> b!46887 m!41203))

(declare-fun m!41205 () Bool)

(assert (=> b!46887 m!41205))

(declare-fun m!41207 () Bool)

(assert (=> b!46889 m!41207))

(assert (=> b!46826 d!9373))

(declare-fun d!9375 () Bool)

(declare-fun res!27367 () Bool)

(declare-fun e!29956 () Bool)

(assert (=> d!9375 (=> res!27367 e!29956)))

(assert (=> d!9375 (= res!27367 (or ((_ is Nil!1236) l!812) ((_ is Nil!1236) (t!4267 l!812))))))

(assert (=> d!9375 (= (isStrictlySorted!232 l!812) e!29956)))

(declare-fun b!46924 () Bool)

(declare-fun e!29957 () Bool)

(assert (=> b!46924 (= e!29956 e!29957)))

(declare-fun res!27368 () Bool)

(assert (=> b!46924 (=> (not res!27368) (not e!29957))))

(assert (=> b!46924 (= res!27368 (bvslt (_1!861 (h!1815 l!812)) (_1!861 (h!1815 (t!4267 l!812)))))))

(declare-fun b!46925 () Bool)

(assert (=> b!46925 (= e!29957 (isStrictlySorted!232 (t!4267 l!812)))))

(assert (= (and d!9375 (not res!27367)) b!46924))

(assert (= (and b!46924 res!27368) b!46925))

(declare-fun m!41245 () Bool)

(assert (=> b!46925 m!41245))

(assert (=> start!7306 d!9375))

(declare-fun b!46937 () Bool)

(declare-fun e!29965 () Bool)

(declare-fun tp!6170 () Bool)

(assert (=> b!46937 (= e!29965 (and tp_is_empty!1993 tp!6170))))

(assert (=> b!46827 (= tp!6158 e!29965)))

(assert (= (and b!46827 ((_ is Cons!1235) (t!4267 l!812))) b!46937))

(check-sat (not b!46877) (not b!46866) (not d!9371) (not b!46875) (not b!46882) tp_is_empty!1993 (not b!46889) (not d!9373) (not b!46887) (not b!46937) (not b!46884) (not b!46863) (not d!9363) (not b!46925) (not d!9369))
(check-sat)
