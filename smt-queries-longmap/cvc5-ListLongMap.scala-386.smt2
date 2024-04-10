; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7300 () Bool)

(assert start!7300)

(declare-fun res!27357 () Bool)

(declare-fun e!29929 () Bool)

(assert (=> start!7300 (=> (not res!27357) (not e!29929))))

(declare-datatypes ((B!896 0))(
  ( (B!897 (val!1035 Int)) )
))
(declare-datatypes ((tuple2!1718 0))(
  ( (tuple2!1719 (_1!870 (_ BitVec 64)) (_2!870 B!896)) )
))
(declare-datatypes ((List!1253 0))(
  ( (Nil!1250) (Cons!1249 (h!1829 tuple2!1718) (t!4281 List!1253)) )
))
(declare-fun l!812 () List!1253)

(declare-fun isStrictlySorted!244 (List!1253) Bool)

(assert (=> start!7300 (= res!27357 (isStrictlySorted!244 l!812))))

(assert (=> start!7300 e!29929))

(declare-fun e!29930 () Bool)

(assert (=> start!7300 e!29930))

(assert (=> start!7300 true))

(declare-fun b!46882 () Bool)

(declare-fun res!27356 () Bool)

(assert (=> b!46882 (=> (not res!27356) (not e!29929))))

(assert (=> b!46882 (= res!27356 (not (is-Cons!1249 l!812)))))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun b!46883 () Bool)

(declare-fun removeStrictlySorted!45 (List!1253 (_ BitVec 64)) List!1253)

(assert (=> b!46883 (= e!29929 (not (= (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key1!43) key2!27) (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key2!27) key1!43))))))

(declare-fun b!46884 () Bool)

(declare-fun tp_is_empty!1993 () Bool)

(declare-fun tp!6158 () Bool)

(assert (=> b!46884 (= e!29930 (and tp_is_empty!1993 tp!6158))))

(assert (= (and start!7300 res!27357) b!46882))

(assert (= (and b!46882 res!27356) b!46883))

(assert (= (and start!7300 (is-Cons!1249 l!812)) b!46884))

(declare-fun m!41265 () Bool)

(assert (=> start!7300 m!41265))

(declare-fun m!41267 () Bool)

(assert (=> b!46883 m!41267))

(assert (=> b!46883 m!41267))

(declare-fun m!41269 () Bool)

(assert (=> b!46883 m!41269))

(declare-fun m!41271 () Bool)

(assert (=> b!46883 m!41271))

(assert (=> b!46883 m!41271))

(declare-fun m!41273 () Bool)

(assert (=> b!46883 m!41273))

(push 1)

(assert (not b!46883))

(assert (not start!7300))

(assert (not b!46884))

(assert tp_is_empty!1993)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!46927 () Bool)

(declare-fun e!29959 () Bool)

(declare-fun lt!20367 () List!1253)

(declare-fun containsKey!93 (List!1253 (_ BitVec 64)) Bool)

(assert (=> b!46927 (= e!29959 (not (containsKey!93 lt!20367 key2!27)))))

(declare-fun b!46928 () Bool)

(declare-fun e!29961 () List!1253)

(assert (=> b!46928 (= e!29961 Nil!1250)))

(declare-fun b!46929 () Bool)

(declare-fun e!29960 () List!1253)

(assert (=> b!46929 (= e!29960 (t!4281 (removeStrictlySorted!45 l!812 key1!43)))))

(declare-fun b!46930 () Bool)

(declare-fun $colon$colon!47 (List!1253 tuple2!1718) List!1253)

(assert (=> b!46930 (= e!29961 ($colon$colon!47 (removeStrictlySorted!45 (t!4281 (removeStrictlySorted!45 l!812 key1!43)) key2!27) (h!1829 (removeStrictlySorted!45 l!812 key1!43))))))

(declare-fun d!9375 () Bool)

(assert (=> d!9375 e!29959))

(declare-fun res!27378 () Bool)

(assert (=> d!9375 (=> (not res!27378) (not e!29959))))

(assert (=> d!9375 (= res!27378 (isStrictlySorted!244 lt!20367))))

(assert (=> d!9375 (= lt!20367 e!29960)))

(declare-fun c!6369 () Bool)

(assert (=> d!9375 (= c!6369 (and (is-Cons!1249 (removeStrictlySorted!45 l!812 key1!43)) (= (_1!870 (h!1829 (removeStrictlySorted!45 l!812 key1!43))) key2!27)))))

(assert (=> d!9375 (isStrictlySorted!244 (removeStrictlySorted!45 l!812 key1!43))))

(assert (=> d!9375 (= (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key1!43) key2!27) lt!20367)))

(declare-fun b!46931 () Bool)

(assert (=> b!46931 (= e!29960 e!29961)))

(declare-fun c!6370 () Bool)

(assert (=> b!46931 (= c!6370 (and (is-Cons!1249 (removeStrictlySorted!45 l!812 key1!43)) (not (= (_1!870 (h!1829 (removeStrictlySorted!45 l!812 key1!43))) key2!27))))))

(assert (= (and d!9375 c!6369) b!46929))

(assert (= (and d!9375 (not c!6369)) b!46931))

(assert (= (and b!46931 c!6370) b!46930))

(assert (= (and b!46931 (not c!6370)) b!46928))

(assert (= (and d!9375 res!27378) b!46927))

(declare-fun m!41297 () Bool)

(assert (=> b!46927 m!41297))

(declare-fun m!41299 () Bool)

(assert (=> b!46930 m!41299))

(assert (=> b!46930 m!41299))

(declare-fun m!41301 () Bool)

(assert (=> b!46930 m!41301))

(declare-fun m!41303 () Bool)

(assert (=> d!9375 m!41303))

(assert (=> d!9375 m!41267))

(declare-fun m!41305 () Bool)

(assert (=> d!9375 m!41305))

(assert (=> b!46883 d!9375))

(declare-fun b!46932 () Bool)

(declare-fun e!29964 () Bool)

(declare-fun lt!20368 () List!1253)

(assert (=> b!46932 (= e!29964 (not (containsKey!93 lt!20368 key1!43)))))

(declare-fun b!46933 () Bool)

(declare-fun e!29966 () List!1253)

(assert (=> b!46933 (= e!29966 Nil!1250)))

(declare-fun b!46934 () Bool)

(declare-fun e!29965 () List!1253)

(assert (=> b!46934 (= e!29965 (t!4281 l!812))))

(declare-fun b!46935 () Bool)

(assert (=> b!46935 (= e!29966 ($colon$colon!47 (removeStrictlySorted!45 (t!4281 l!812) key1!43) (h!1829 l!812)))))

(declare-fun d!9381 () Bool)

(assert (=> d!9381 e!29964))

(declare-fun res!27379 () Bool)

(assert (=> d!9381 (=> (not res!27379) (not e!29964))))

(assert (=> d!9381 (= res!27379 (isStrictlySorted!244 lt!20368))))

(assert (=> d!9381 (= lt!20368 e!29965)))

(declare-fun c!6371 () Bool)

(assert (=> d!9381 (= c!6371 (and (is-Cons!1249 l!812) (= (_1!870 (h!1829 l!812)) key1!43)))))

(assert (=> d!9381 (isStrictlySorted!244 l!812)))

(assert (=> d!9381 (= (removeStrictlySorted!45 l!812 key1!43) lt!20368)))

(declare-fun b!46936 () Bool)

(assert (=> b!46936 (= e!29965 e!29966)))

(declare-fun c!6372 () Bool)

(assert (=> b!46936 (= c!6372 (and (is-Cons!1249 l!812) (not (= (_1!870 (h!1829 l!812)) key1!43))))))

(assert (= (and d!9381 c!6371) b!46934))

(assert (= (and d!9381 (not c!6371)) b!46936))

(assert (= (and b!46936 c!6372) b!46935))

(assert (= (and b!46936 (not c!6372)) b!46933))

(assert (= (and d!9381 res!27379) b!46932))

(declare-fun m!41307 () Bool)

(assert (=> b!46932 m!41307))

(declare-fun m!41309 () Bool)

(assert (=> b!46935 m!41309))

(assert (=> b!46935 m!41309))

(declare-fun m!41311 () Bool)

(assert (=> b!46935 m!41311))

(declare-fun m!41313 () Bool)

(assert (=> d!9381 m!41313))

(assert (=> d!9381 m!41265))

(assert (=> b!46883 d!9381))

(declare-fun b!46939 () Bool)

(declare-fun e!29967 () Bool)

(declare-fun lt!20369 () List!1253)

(assert (=> b!46939 (= e!29967 (not (containsKey!93 lt!20369 key1!43)))))

(declare-fun b!46940 () Bool)

(declare-fun e!29969 () List!1253)

(assert (=> b!46940 (= e!29969 Nil!1250)))

(declare-fun b!46941 () Bool)

(declare-fun e!29968 () List!1253)

(assert (=> b!46941 (= e!29968 (t!4281 (removeStrictlySorted!45 l!812 key2!27)))))

(declare-fun b!46942 () Bool)

(assert (=> b!46942 (= e!29969 ($colon$colon!47 (removeStrictlySorted!45 (t!4281 (removeStrictlySorted!45 l!812 key2!27)) key1!43) (h!1829 (removeStrictlySorted!45 l!812 key2!27))))))

(declare-fun d!9383 () Bool)

(assert (=> d!9383 e!29967))

(declare-fun res!27382 () Bool)

(assert (=> d!9383 (=> (not res!27382) (not e!29967))))

(assert (=> d!9383 (= res!27382 (isStrictlySorted!244 lt!20369))))

(assert (=> d!9383 (= lt!20369 e!29968)))

(declare-fun c!6373 () Bool)

(assert (=> d!9383 (= c!6373 (and (is-Cons!1249 (removeStrictlySorted!45 l!812 key2!27)) (= (_1!870 (h!1829 (removeStrictlySorted!45 l!812 key2!27))) key1!43)))))

(assert (=> d!9383 (isStrictlySorted!244 (removeStrictlySorted!45 l!812 key2!27))))

(assert (=> d!9383 (= (removeStrictlySorted!45 (removeStrictlySorted!45 l!812 key2!27) key1!43) lt!20369)))

(declare-fun b!46943 () Bool)

(assert (=> b!46943 (= e!29968 e!29969)))

(declare-fun c!6374 () Bool)

(assert (=> b!46943 (= c!6374 (and (is-Cons!1249 (removeStrictlySorted!45 l!812 key2!27)) (not (= (_1!870 (h!1829 (removeStrictlySorted!45 l!812 key2!27))) key1!43))))))

(assert (= (and d!9383 c!6373) b!46941))

(assert (= (and d!9383 (not c!6373)) b!46943))

(assert (= (and b!46943 c!6374) b!46942))

(assert (= (and b!46943 (not c!6374)) b!46940))

(assert (= (and d!9383 res!27382) b!46939))

(declare-fun m!41315 () Bool)

(assert (=> b!46939 m!41315))

(declare-fun m!41317 () Bool)

(assert (=> b!46942 m!41317))

(assert (=> b!46942 m!41317))

(declare-fun m!41319 () Bool)

(assert (=> b!46942 m!41319))

(declare-fun m!41321 () Bool)

(assert (=> d!9383 m!41321))

(assert (=> d!9383 m!41271))

(declare-fun m!41323 () Bool)

(assert (=> d!9383 m!41323))

(assert (=> b!46883 d!9383))

(declare-fun b!46944 () Bool)

(declare-fun e!29970 () Bool)

(declare-fun lt!20370 () List!1253)

(assert (=> b!46944 (= e!29970 (not (containsKey!93 lt!20370 key2!27)))))

(declare-fun b!46945 () Bool)

(declare-fun e!29972 () List!1253)

(assert (=> b!46945 (= e!29972 Nil!1250)))

(declare-fun b!46946 () Bool)

(declare-fun e!29971 () List!1253)

(assert (=> b!46946 (= e!29971 (t!4281 l!812))))

(declare-fun b!46947 () Bool)

(assert (=> b!46947 (= e!29972 ($colon$colon!47 (removeStrictlySorted!45 (t!4281 l!812) key2!27) (h!1829 l!812)))))

(declare-fun d!9385 () Bool)

(assert (=> d!9385 e!29970))

(declare-fun res!27383 () Bool)

(assert (=> d!9385 (=> (not res!27383) (not e!29970))))

(assert (=> d!9385 (= res!27383 (isStrictlySorted!244 lt!20370))))

(assert (=> d!9385 (= lt!20370 e!29971)))

(declare-fun c!6375 () Bool)

(assert (=> d!9385 (= c!6375 (and (is-Cons!1249 l!812) (= (_1!870 (h!1829 l!812)) key2!27)))))

(assert (=> d!9385 (isStrictlySorted!244 l!812)))

(assert (=> d!9385 (= (removeStrictlySorted!45 l!812 key2!27) lt!20370)))

(declare-fun b!46948 () Bool)

(assert (=> b!46948 (= e!29971 e!29972)))

(declare-fun c!6376 () Bool)

(assert (=> b!46948 (= c!6376 (and (is-Cons!1249 l!812) (not (= (_1!870 (h!1829 l!812)) key2!27))))))

(assert (= (and d!9385 c!6375) b!46946))

(assert (= (and d!9385 (not c!6375)) b!46948))

(assert (= (and b!46948 c!6376) b!46947))

(assert (= (and b!46948 (not c!6376)) b!46945))

(assert (= (and d!9385 res!27383) b!46944))

(declare-fun m!41325 () Bool)

(assert (=> b!46944 m!41325))

(declare-fun m!41327 () Bool)

(assert (=> b!46947 m!41327))

(assert (=> b!46947 m!41327))

(declare-fun m!41329 () Bool)

(assert (=> b!46947 m!41329))

(declare-fun m!41331 () Bool)

(assert (=> d!9385 m!41331))

(assert (=> d!9385 m!41265))

(assert (=> b!46883 d!9385))

(declare-fun d!9387 () Bool)

(declare-fun res!27393 () Bool)

(declare-fun e!29992 () Bool)

(assert (=> d!9387 (=> res!27393 e!29992)))

(assert (=> d!9387 (= res!27393 (or (is-Nil!1250 l!812) (is-Nil!1250 (t!4281 l!812))))))

(assert (=> d!9387 (= (isStrictlySorted!244 l!812) e!29992)))

(declare-fun b!46978 () Bool)

(declare-fun e!29993 () Bool)

(assert (=> b!46978 (= e!29992 e!29993)))

(declare-fun res!27394 () Bool)

(assert (=> b!46978 (=> (not res!27394) (not e!29993))))

(assert (=> b!46978 (= res!27394 (bvslt (_1!870 (h!1829 l!812)) (_1!870 (h!1829 (t!4281 l!812)))))))

(declare-fun b!46979 () Bool)

(assert (=> b!46979 (= e!29993 (isStrictlySorted!244 (t!4281 l!812)))))

(assert (= (and d!9387 (not res!27393)) b!46978))

(assert (= (and b!46978 res!27394) b!46979))

(declare-fun m!41359 () Bool)

(assert (=> b!46979 m!41359))

(assert (=> start!7300 d!9387))

(declare-fun b!46994 () Bool)

(declare-fun e!30002 () Bool)

(declare-fun tp!6167 () Bool)

(assert (=> b!46994 (= e!30002 (and tp_is_empty!1993 tp!6167))))

(assert (=> b!46884 (= tp!6158 e!30002)))

(assert (= (and b!46884 (is-Cons!1249 (t!4281 l!812))) b!46994))

(push 1)

(assert tp_is_empty!1993)

(assert (not b!46944))

(assert (not b!46930))

(assert (not b!46935))

(assert (not b!46994))

(assert (not b!46942))

(assert (not d!9381))

(assert (not b!46947))

(assert (not d!9375))

(assert (not b!46979))

(assert (not b!46939))

(assert (not d!9383))

