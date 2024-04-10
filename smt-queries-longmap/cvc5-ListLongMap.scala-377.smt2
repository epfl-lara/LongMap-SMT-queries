; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7138 () Bool)

(assert start!7138)

(declare-fun res!26822 () Bool)

(declare-fun e!29131 () Bool)

(assert (=> start!7138 (=> (not res!26822) (not e!29131))))

(declare-datatypes ((B!842 0))(
  ( (B!843 (val!1008 Int)) )
))
(declare-datatypes ((tuple2!1664 0))(
  ( (tuple2!1665 (_1!843 (_ BitVec 64)) (_2!843 B!842)) )
))
(declare-datatypes ((List!1226 0))(
  ( (Nil!1223) (Cons!1222 (h!1802 tuple2!1664) (t!4251 List!1226)) )
))
(declare-fun l!812 () List!1226)

(declare-fun isStrictlySorted!223 (List!1226) Bool)

(assert (=> start!7138 (= res!26822 (isStrictlySorted!223 l!812))))

(assert (=> start!7138 e!29131))

(declare-fun e!29132 () Bool)

(assert (=> start!7138 e!29132))

(assert (=> start!7138 true))

(declare-fun b!45770 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!33 (List!1226 (_ BitVec 64)) List!1226)

(assert (=> b!45770 (= e!29131 (not (isStrictlySorted!223 (removeStrictlySorted!33 l!812 key2!27))))))

(declare-fun key1!43 () (_ BitVec 64))

(assert (=> b!45770 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4251 l!812) key1!43) key2!27) (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4251 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1315 0))(
  ( (Unit!1316) )
))
(declare-fun lt!20221 () Unit!1315)

(declare-fun lemmaRemoveStrictlySortedCommutative!13 (List!1226 (_ BitVec 64) (_ BitVec 64)) Unit!1315)

(assert (=> b!45770 (= lt!20221 (lemmaRemoveStrictlySortedCommutative!13 (t!4251 l!812) key1!43 key2!27))))

(declare-fun b!45769 () Bool)

(declare-fun res!26821 () Bool)

(assert (=> b!45769 (=> (not res!26821) (not e!29131))))

(assert (=> b!45769 (= res!26821 (isStrictlySorted!223 (t!4251 l!812)))))

(declare-fun b!45771 () Bool)

(declare-fun tp_is_empty!1939 () Bool)

(declare-fun tp!6011 () Bool)

(assert (=> b!45771 (= e!29132 (and tp_is_empty!1939 tp!6011))))

(declare-fun b!45768 () Bool)

(declare-fun res!26823 () Bool)

(assert (=> b!45768 (=> (not res!26823) (not e!29131))))

(assert (=> b!45768 (= res!26823 (is-Cons!1222 l!812))))

(assert (= (and start!7138 res!26822) b!45768))

(assert (= (and b!45768 res!26823) b!45769))

(assert (= (and b!45769 res!26821) b!45770))

(assert (= (and start!7138 (is-Cons!1222 l!812)) b!45771))

(declare-fun m!40329 () Bool)

(assert (=> start!7138 m!40329))

(declare-fun m!40331 () Bool)

(assert (=> b!45770 m!40331))

(declare-fun m!40333 () Bool)

(assert (=> b!45770 m!40333))

(declare-fun m!40335 () Bool)

(assert (=> b!45770 m!40335))

(declare-fun m!40337 () Bool)

(assert (=> b!45770 m!40337))

(assert (=> b!45770 m!40335))

(assert (=> b!45770 m!40333))

(declare-fun m!40339 () Bool)

(assert (=> b!45770 m!40339))

(assert (=> b!45770 m!40331))

(declare-fun m!40341 () Bool)

(assert (=> b!45770 m!40341))

(declare-fun m!40343 () Bool)

(assert (=> b!45770 m!40343))

(declare-fun m!40345 () Bool)

(assert (=> b!45769 m!40345))

(push 1)

(assert (not b!45771))

(assert (not b!45769))

(assert tp_is_empty!1939)

(assert (not start!7138))

(assert (not b!45770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!45821 () Bool)

(declare-fun e!29161 () List!1226)

(declare-fun $colon$colon!35 (List!1226 tuple2!1664) List!1226)

(assert (=> b!45821 (= e!29161 ($colon$colon!35 (removeStrictlySorted!33 (t!4251 l!812) key2!27) (h!1802 l!812)))))

(declare-fun b!45822 () Bool)

(declare-fun e!29162 () List!1226)

(assert (=> b!45822 (= e!29162 e!29161)))

(declare-fun c!6177 () Bool)

(assert (=> b!45822 (= c!6177 (and (is-Cons!1222 l!812) (not (= (_1!843 (h!1802 l!812)) key2!27))))))

(declare-fun b!45823 () Bool)

(declare-fun e!29160 () Bool)

(declare-fun lt!20233 () List!1226)

(declare-fun containsKey!82 (List!1226 (_ BitVec 64)) Bool)

(assert (=> b!45823 (= e!29160 (not (containsKey!82 lt!20233 key2!27)))))

(declare-fun d!8937 () Bool)

(assert (=> d!8937 e!29160))

(declare-fun res!26847 () Bool)

(assert (=> d!8937 (=> (not res!26847) (not e!29160))))

(assert (=> d!8937 (= res!26847 (isStrictlySorted!223 lt!20233))))

(assert (=> d!8937 (= lt!20233 e!29162)))

(declare-fun c!6176 () Bool)

(assert (=> d!8937 (= c!6176 (and (is-Cons!1222 l!812) (= (_1!843 (h!1802 l!812)) key2!27)))))

(assert (=> d!8937 (isStrictlySorted!223 l!812)))

(assert (=> d!8937 (= (removeStrictlySorted!33 l!812 key2!27) lt!20233)))

(declare-fun b!45824 () Bool)

(assert (=> b!45824 (= e!29161 Nil!1223)))

(declare-fun b!45825 () Bool)

(assert (=> b!45825 (= e!29162 (t!4251 l!812))))

(assert (= (and d!8937 c!6176) b!45825))

(assert (= (and d!8937 (not c!6176)) b!45822))

(assert (= (and b!45822 c!6177) b!45821))

(assert (= (and b!45822 (not c!6177)) b!45824))

(assert (= (and d!8937 res!26847) b!45823))

(assert (=> b!45821 m!40331))

(assert (=> b!45821 m!40331))

(declare-fun m!40389 () Bool)

(assert (=> b!45821 m!40389))

(declare-fun m!40391 () Bool)

(assert (=> b!45823 m!40391))

(declare-fun m!40393 () Bool)

(assert (=> d!8937 m!40393))

(assert (=> d!8937 m!40329))

(assert (=> b!45770 d!8937))

(declare-fun d!8943 () Bool)

(declare-fun res!26862 () Bool)

(declare-fun e!29177 () Bool)

(assert (=> d!8943 (=> res!26862 e!29177)))

(assert (=> d!8943 (= res!26862 (or (is-Nil!1223 (removeStrictlySorted!33 l!812 key2!27)) (is-Nil!1223 (t!4251 (removeStrictlySorted!33 l!812 key2!27)))))))

(assert (=> d!8943 (= (isStrictlySorted!223 (removeStrictlySorted!33 l!812 key2!27)) e!29177)))

(declare-fun b!45840 () Bool)

(declare-fun e!29178 () Bool)

(assert (=> b!45840 (= e!29177 e!29178)))

(declare-fun res!26863 () Bool)

(assert (=> b!45840 (=> (not res!26863) (not e!29178))))

(assert (=> b!45840 (= res!26863 (bvslt (_1!843 (h!1802 (removeStrictlySorted!33 l!812 key2!27))) (_1!843 (h!1802 (t!4251 (removeStrictlySorted!33 l!812 key2!27))))))))

(declare-fun b!45841 () Bool)

(assert (=> b!45841 (= e!29178 (isStrictlySorted!223 (t!4251 (removeStrictlySorted!33 l!812 key2!27))))))

(assert (= (and d!8943 (not res!26862)) b!45840))

(assert (= (and b!45840 res!26863) b!45841))

(declare-fun m!40397 () Bool)

(assert (=> b!45841 m!40397))

(assert (=> b!45770 d!8943))

(declare-fun b!45847 () Bool)

(declare-fun e!29183 () List!1226)

(assert (=> b!45847 (= e!29183 ($colon$colon!35 (removeStrictlySorted!33 (t!4251 (t!4251 l!812)) key2!27) (h!1802 (t!4251 l!812))))))

(declare-fun b!45848 () Bool)

(declare-fun e!29184 () List!1226)

(assert (=> b!45848 (= e!29184 e!29183)))

(declare-fun c!6181 () Bool)

(assert (=> b!45848 (= c!6181 (and (is-Cons!1222 (t!4251 l!812)) (not (= (_1!843 (h!1802 (t!4251 l!812))) key2!27))))))

(declare-fun b!45849 () Bool)

(declare-fun e!29182 () Bool)

(declare-fun lt!20235 () List!1226)

(assert (=> b!45849 (= e!29182 (not (containsKey!82 lt!20235 key2!27)))))

(declare-fun d!8947 () Bool)

(assert (=> d!8947 e!29182))

(declare-fun res!26865 () Bool)

(assert (=> d!8947 (=> (not res!26865) (not e!29182))))

(assert (=> d!8947 (= res!26865 (isStrictlySorted!223 lt!20235))))

(assert (=> d!8947 (= lt!20235 e!29184)))

(declare-fun c!6180 () Bool)

(assert (=> d!8947 (= c!6180 (and (is-Cons!1222 (t!4251 l!812)) (= (_1!843 (h!1802 (t!4251 l!812))) key2!27)))))

(assert (=> d!8947 (isStrictlySorted!223 (t!4251 l!812))))

(assert (=> d!8947 (= (removeStrictlySorted!33 (t!4251 l!812) key2!27) lt!20235)))

(declare-fun b!45850 () Bool)

(assert (=> b!45850 (= e!29183 Nil!1223)))

(declare-fun b!45851 () Bool)

(assert (=> b!45851 (= e!29184 (t!4251 (t!4251 l!812)))))

(assert (= (and d!8947 c!6180) b!45851))

(assert (= (and d!8947 (not c!6180)) b!45848))

(assert (= (and b!45848 c!6181) b!45847))

(assert (= (and b!45848 (not c!6181)) b!45850))

(assert (= (and d!8947 res!26865) b!45849))

(declare-fun m!40407 () Bool)

(assert (=> b!45847 m!40407))

(assert (=> b!45847 m!40407))

(declare-fun m!40409 () Bool)

(assert (=> b!45847 m!40409))

(declare-fun m!40411 () Bool)

(assert (=> b!45849 m!40411))

(declare-fun m!40413 () Bool)

(assert (=> d!8947 m!40413))

(assert (=> d!8947 m!40345))

(assert (=> b!45770 d!8947))

(declare-fun d!8951 () Bool)

(assert (=> d!8951 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4251 l!812) key1!43) key2!27) (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4251 l!812) key2!27) key1!43))))

(declare-fun lt!20241 () Unit!1315)

(declare-fun choose!274 (List!1226 (_ BitVec 64) (_ BitVec 64)) Unit!1315)

(assert (=> d!8951 (= lt!20241 (choose!274 (t!4251 l!812) key1!43 key2!27))))

(assert (=> d!8951 (isStrictlySorted!223 (t!4251 l!812))))

(assert (=> d!8951 (= (lemmaRemoveStrictlySortedCommutative!13 (t!4251 l!812) key1!43 key2!27) lt!20241)))

(declare-fun bs!2156 () Bool)

(assert (= bs!2156 d!8951))

(assert (=> bs!2156 m!40331))

(assert (=> bs!2156 m!40341))

(declare-fun m!40419 () Bool)

(assert (=> bs!2156 m!40419))

(assert (=> bs!2156 m!40331))

(assert (=> bs!2156 m!40335))

(assert (=> bs!2156 m!40337))

(assert (=> bs!2156 m!40345))

(assert (=> bs!2156 m!40335))

(assert (=> b!45770 d!8951))

(declare-fun e!29193 () List!1226)

(declare-fun b!45861 () Bool)

(assert (=> b!45861 (= e!29193 ($colon$colon!35 (removeStrictlySorted!33 (t!4251 (removeStrictlySorted!33 (t!4251 l!812) key1!43)) key2!27) (h!1802 (removeStrictlySorted!33 (t!4251 l!812) key1!43))))))

(declare-fun b!45862 () Bool)

(declare-fun e!29194 () List!1226)

(assert (=> b!45862 (= e!29194 e!29193)))

(declare-fun c!6185 () Bool)

(assert (=> b!45862 (= c!6185 (and (is-Cons!1222 (removeStrictlySorted!33 (t!4251 l!812) key1!43)) (not (= (_1!843 (h!1802 (removeStrictlySorted!33 (t!4251 l!812) key1!43))) key2!27))))))

(declare-fun b!45863 () Bool)

(declare-fun e!29192 () Bool)

(declare-fun lt!20243 () List!1226)

(assert (=> b!45863 (= e!29192 (not (containsKey!82 lt!20243 key2!27)))))

(declare-fun d!8959 () Bool)

(assert (=> d!8959 e!29192))

(declare-fun res!26871 () Bool)

(assert (=> d!8959 (=> (not res!26871) (not e!29192))))

(assert (=> d!8959 (= res!26871 (isStrictlySorted!223 lt!20243))))

(assert (=> d!8959 (= lt!20243 e!29194)))

(declare-fun c!6184 () Bool)

(assert (=> d!8959 (= c!6184 (and (is-Cons!1222 (removeStrictlySorted!33 (t!4251 l!812) key1!43)) (= (_1!843 (h!1802 (removeStrictlySorted!33 (t!4251 l!812) key1!43))) key2!27)))))

(assert (=> d!8959 (isStrictlySorted!223 (removeStrictlySorted!33 (t!4251 l!812) key1!43))))

(assert (=> d!8959 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4251 l!812) key1!43) key2!27) lt!20243)))

(declare-fun b!45864 () Bool)

(assert (=> b!45864 (= e!29193 Nil!1223)))

(declare-fun b!45865 () Bool)

(assert (=> b!45865 (= e!29194 (t!4251 (removeStrictlySorted!33 (t!4251 l!812) key1!43)))))

(assert (= (and d!8959 c!6184) b!45865))

(assert (= (and d!8959 (not c!6184)) b!45862))

(assert (= (and b!45862 c!6185) b!45861))

(assert (= (and b!45862 (not c!6185)) b!45864))

(assert (= (and d!8959 res!26871) b!45863))

(declare-fun m!40425 () Bool)

(assert (=> b!45861 m!40425))

(assert (=> b!45861 m!40425))

(declare-fun m!40431 () Bool)

(assert (=> b!45861 m!40431))

(declare-fun m!40435 () Bool)

(assert (=> b!45863 m!40435))

(declare-fun m!40437 () Bool)

(assert (=> d!8959 m!40437))

(assert (=> d!8959 m!40335))

(declare-fun m!40439 () Bool)

(assert (=> d!8959 m!40439))

(assert (=> b!45770 d!8959))

(declare-fun b!45871 () Bool)

(declare-fun e!29199 () List!1226)

(assert (=> b!45871 (= e!29199 ($colon$colon!35 (removeStrictlySorted!33 (t!4251 (t!4251 l!812)) key1!43) (h!1802 (t!4251 l!812))))))

(declare-fun b!45872 () Bool)

(declare-fun e!29200 () List!1226)

(assert (=> b!45872 (= e!29200 e!29199)))

(declare-fun c!6189 () Bool)

(assert (=> b!45872 (= c!6189 (and (is-Cons!1222 (t!4251 l!812)) (not (= (_1!843 (h!1802 (t!4251 l!812))) key1!43))))))

(declare-fun b!45873 () Bool)

(declare-fun e!29198 () Bool)

(declare-fun lt!20245 () List!1226)

(assert (=> b!45873 (= e!29198 (not (containsKey!82 lt!20245 key1!43)))))

(declare-fun d!8963 () Bool)

(assert (=> d!8963 e!29198))

(declare-fun res!26873 () Bool)

(assert (=> d!8963 (=> (not res!26873) (not e!29198))))

(assert (=> d!8963 (= res!26873 (isStrictlySorted!223 lt!20245))))

(assert (=> d!8963 (= lt!20245 e!29200)))

(declare-fun c!6188 () Bool)

(assert (=> d!8963 (= c!6188 (and (is-Cons!1222 (t!4251 l!812)) (= (_1!843 (h!1802 (t!4251 l!812))) key1!43)))))

(assert (=> d!8963 (isStrictlySorted!223 (t!4251 l!812))))

(assert (=> d!8963 (= (removeStrictlySorted!33 (t!4251 l!812) key1!43) lt!20245)))

(declare-fun b!45874 () Bool)

(assert (=> b!45874 (= e!29199 Nil!1223)))

(declare-fun b!45875 () Bool)

(assert (=> b!45875 (= e!29200 (t!4251 (t!4251 l!812)))))

(assert (= (and d!8963 c!6188) b!45875))

(assert (= (and d!8963 (not c!6188)) b!45872))

(assert (= (and b!45872 c!6189) b!45871))

(assert (= (and b!45872 (not c!6189)) b!45874))

(assert (= (and d!8963 res!26873) b!45873))

(declare-fun m!40445 () Bool)

(assert (=> b!45871 m!40445))

(assert (=> b!45871 m!40445))

(declare-fun m!40451 () Bool)

(assert (=> b!45871 m!40451))

(declare-fun m!40453 () Bool)

(assert (=> b!45873 m!40453))

(declare-fun m!40455 () Bool)

(assert (=> d!8963 m!40455))

(assert (=> d!8963 m!40345))

(assert (=> b!45770 d!8963))

(declare-fun e!29205 () List!1226)

(declare-fun b!45881 () Bool)

(assert (=> b!45881 (= e!29205 ($colon$colon!35 (removeStrictlySorted!33 (t!4251 (removeStrictlySorted!33 (t!4251 l!812) key2!27)) key1!43) (h!1802 (removeStrictlySorted!33 (t!4251 l!812) key2!27))))))

(declare-fun b!45882 () Bool)

(declare-fun e!29206 () List!1226)

(assert (=> b!45882 (= e!29206 e!29205)))

(declare-fun c!6193 () Bool)

(assert (=> b!45882 (= c!6193 (and (is-Cons!1222 (removeStrictlySorted!33 (t!4251 l!812) key2!27)) (not (= (_1!843 (h!1802 (removeStrictlySorted!33 (t!4251 l!812) key2!27))) key1!43))))))

(declare-fun b!45883 () Bool)

(declare-fun e!29204 () Bool)

(declare-fun lt!20247 () List!1226)

(assert (=> b!45883 (= e!29204 (not (containsKey!82 lt!20247 key1!43)))))

(declare-fun d!8967 () Bool)

(assert (=> d!8967 e!29204))

(declare-fun res!26875 () Bool)

(assert (=> d!8967 (=> (not res!26875) (not e!29204))))

(assert (=> d!8967 (= res!26875 (isStrictlySorted!223 lt!20247))))

(assert (=> d!8967 (= lt!20247 e!29206)))

(declare-fun c!6192 () Bool)

(assert (=> d!8967 (= c!6192 (and (is-Cons!1222 (removeStrictlySorted!33 (t!4251 l!812) key2!27)) (= (_1!843 (h!1802 (removeStrictlySorted!33 (t!4251 l!812) key2!27))) key1!43)))))

(assert (=> d!8967 (isStrictlySorted!223 (removeStrictlySorted!33 (t!4251 l!812) key2!27))))

(assert (=> d!8967 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4251 l!812) key2!27) key1!43) lt!20247)))

(declare-fun b!45884 () Bool)

(assert (=> b!45884 (= e!29205 Nil!1223)))

(declare-fun b!45885 () Bool)

(assert (=> b!45885 (= e!29206 (t!4251 (removeStrictlySorted!33 (t!4251 l!812) key2!27)))))

(assert (= (and d!8967 c!6192) b!45885))

(assert (= (and d!8967 (not c!6192)) b!45882))

(assert (= (and b!45882 c!6193) b!45881))

(assert (= (and b!45882 (not c!6193)) b!45884))

(assert (= (and d!8967 res!26875) b!45883))

(declare-fun m!40461 () Bool)

(assert (=> b!45881 m!40461))

(assert (=> b!45881 m!40461))

(declare-fun m!40467 () Bool)

(assert (=> b!45881 m!40467))

(declare-fun m!40471 () Bool)

(assert (=> b!45883 m!40471))

(declare-fun m!40473 () Bool)

(assert (=> d!8967 m!40473))

(assert (=> d!8967 m!40331))

(declare-fun m!40475 () Bool)

(assert (=> d!8967 m!40475))

(assert (=> b!45770 d!8967))

(declare-fun d!8971 () Bool)

(declare-fun res!26878 () Bool)

(declare-fun e!29209 () Bool)

(assert (=> d!8971 (=> res!26878 e!29209)))

(assert (=> d!8971 (= res!26878 (or (is-Nil!1223 (t!4251 l!812)) (is-Nil!1223 (t!4251 (t!4251 l!812)))))))

(assert (=> d!8971 (= (isStrictlySorted!223 (t!4251 l!812)) e!29209)))

(declare-fun b!45888 () Bool)

(declare-fun e!29210 () Bool)

(assert (=> b!45888 (= e!29209 e!29210)))

(declare-fun res!26879 () Bool)

(assert (=> b!45888 (=> (not res!26879) (not e!29210))))

(assert (=> b!45888 (= res!26879 (bvslt (_1!843 (h!1802 (t!4251 l!812))) (_1!843 (h!1802 (t!4251 (t!4251 l!812))))))))

(declare-fun b!45889 () Bool)

(assert (=> b!45889 (= e!29210 (isStrictlySorted!223 (t!4251 (t!4251 l!812))))))

(assert (= (and d!8971 (not res!26878)) b!45888))

(assert (= (and b!45888 res!26879) b!45889))

(declare-fun m!40479 () Bool)

(assert (=> b!45889 m!40479))

(assert (=> b!45769 d!8971))

(declare-fun d!8975 () Bool)

(declare-fun res!26882 () Bool)

(declare-fun e!29213 () Bool)

(assert (=> d!8975 (=> res!26882 e!29213)))

(assert (=> d!8975 (= res!26882 (or (is-Nil!1223 l!812) (is-Nil!1223 (t!4251 l!812))))))

(assert (=> d!8975 (= (isStrictlySorted!223 l!812) e!29213)))

(declare-fun b!45892 () Bool)

(declare-fun e!29214 () Bool)

(assert (=> b!45892 (= e!29213 e!29214)))

(declare-fun res!26883 () Bool)

(assert (=> b!45892 (=> (not res!26883) (not e!29214))))

(assert (=> b!45892 (= res!26883 (bvslt (_1!843 (h!1802 l!812)) (_1!843 (h!1802 (t!4251 l!812)))))))

(declare-fun b!45893 () Bool)

(assert (=> b!45893 (= e!29214 (isStrictlySorted!223 (t!4251 l!812)))))

(assert (= (and d!8975 (not res!26882)) b!45892))

(assert (= (and b!45892 res!26883) b!45893))

(assert (=> b!45893 m!40345))

(assert (=> start!7138 d!8975))

(declare-fun b!45902 () Bool)

(declare-fun e!29219 () Bool)

(declare-fun tp!6022 () Bool)

(assert (=> b!45902 (= e!29219 (and tp_is_empty!1939 tp!6022))))

(assert (=> b!45771 (= tp!6011 e!29219)))

(assert (= (and b!45771 (is-Cons!1222 (t!4251 l!812))) b!45902))

(push 1)

(assert (not d!8967))

(assert (not d!8951))

(assert (not b!45861))

(assert (not b!45871))

(assert tp_is_empty!1939)

(assert (not d!8947))

(assert (not b!45863))

(assert (not b!45881))

(assert (not b!45841))

(assert (not b!45883))

(assert (not d!8959))

(assert (not b!45849))

(assert (not b!45902))

(assert (not d!8937))

(assert (not b!45821))

(assert (not b!45823))

(assert (not d!8963))

(assert (not b!45847))

(assert (not b!45873))

(assert (not b!45889))

(assert (not b!45893))

(check-sat)

