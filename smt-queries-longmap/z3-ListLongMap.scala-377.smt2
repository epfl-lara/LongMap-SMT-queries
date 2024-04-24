; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7144 () Bool)

(assert start!7144)

(declare-fun b!45713 () Bool)

(declare-fun e!29095 () Bool)

(declare-datatypes ((B!842 0))(
  ( (B!843 (val!1008 Int)) )
))
(declare-datatypes ((tuple2!1646 0))(
  ( (tuple2!1647 (_1!834 (_ BitVec 64)) (_2!834 B!842)) )
))
(declare-datatypes ((List!1212 0))(
  ( (Nil!1209) (Cons!1208 (h!1788 tuple2!1646) (t!4237 List!1212)) )
))
(declare-fun l!812 () List!1212)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun isStrictlySorted!211 (List!1212) Bool)

(declare-fun removeStrictlySorted!32 (List!1212 (_ BitVec 64)) List!1212)

(assert (=> b!45713 (= e!29095 (not (isStrictlySorted!211 (removeStrictlySorted!32 l!812 key2!27))))))

(declare-fun key1!43 () (_ BitVec 64))

(assert (=> b!45713 (= (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4237 l!812) key1!43) key2!27) (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4237 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1326 0))(
  ( (Unit!1327) )
))
(declare-fun lt!20178 () Unit!1326)

(declare-fun lemmaRemoveStrictlySortedCommutative!13 (List!1212 (_ BitVec 64) (_ BitVec 64)) Unit!1326)

(assert (=> b!45713 (= lt!20178 (lemmaRemoveStrictlySortedCommutative!13 (t!4237 l!812) key1!43 key2!27))))

(declare-fun b!45712 () Bool)

(declare-fun res!26797 () Bool)

(assert (=> b!45712 (=> (not res!26797) (not e!29095))))

(assert (=> b!45712 (= res!26797 (isStrictlySorted!211 (t!4237 l!812)))))

(declare-fun res!26798 () Bool)

(assert (=> start!7144 (=> (not res!26798) (not e!29095))))

(assert (=> start!7144 (= res!26798 (isStrictlySorted!211 l!812))))

(assert (=> start!7144 e!29095))

(declare-fun e!29094 () Bool)

(assert (=> start!7144 e!29094))

(assert (=> start!7144 true))

(declare-fun b!45714 () Bool)

(declare-fun tp_is_empty!1939 () Bool)

(declare-fun tp!6011 () Bool)

(assert (=> b!45714 (= e!29094 (and tp_is_empty!1939 tp!6011))))

(declare-fun b!45711 () Bool)

(declare-fun res!26796 () Bool)

(assert (=> b!45711 (=> (not res!26796) (not e!29095))))

(get-info :version)

(assert (=> b!45711 (= res!26796 ((_ is Cons!1208) l!812))))

(assert (= (and start!7144 res!26798) b!45711))

(assert (= (and b!45711 res!26796) b!45712))

(assert (= (and b!45712 res!26797) b!45713))

(assert (= (and start!7144 ((_ is Cons!1208) l!812)) b!45714))

(declare-fun m!40205 () Bool)

(assert (=> b!45713 m!40205))

(declare-fun m!40207 () Bool)

(assert (=> b!45713 m!40207))

(declare-fun m!40209 () Bool)

(assert (=> b!45713 m!40209))

(declare-fun m!40211 () Bool)

(assert (=> b!45713 m!40211))

(assert (=> b!45713 m!40209))

(assert (=> b!45713 m!40207))

(declare-fun m!40213 () Bool)

(assert (=> b!45713 m!40213))

(assert (=> b!45713 m!40205))

(declare-fun m!40215 () Bool)

(assert (=> b!45713 m!40215))

(declare-fun m!40217 () Bool)

(assert (=> b!45713 m!40217))

(declare-fun m!40219 () Bool)

(assert (=> b!45712 m!40219))

(declare-fun m!40221 () Bool)

(assert (=> start!7144 m!40221))

(check-sat (not b!45712) (not start!7144) (not b!45713) (not b!45714) tp_is_empty!1939)
(check-sat)
(get-model)

(declare-fun d!8923 () Bool)

(declare-fun res!26825 () Bool)

(declare-fun e!29116 () Bool)

(assert (=> d!8923 (=> res!26825 e!29116)))

(assert (=> d!8923 (= res!26825 (or ((_ is Nil!1209) l!812) ((_ is Nil!1209) (t!4237 l!812))))))

(assert (=> d!8923 (= (isStrictlySorted!211 l!812) e!29116)))

(declare-fun b!45747 () Bool)

(declare-fun e!29117 () Bool)

(assert (=> b!45747 (= e!29116 e!29117)))

(declare-fun res!26826 () Bool)

(assert (=> b!45747 (=> (not res!26826) (not e!29117))))

(assert (=> b!45747 (= res!26826 (bvslt (_1!834 (h!1788 l!812)) (_1!834 (h!1788 (t!4237 l!812)))))))

(declare-fun b!45748 () Bool)

(assert (=> b!45748 (= e!29117 (isStrictlySorted!211 (t!4237 l!812)))))

(assert (= (and d!8923 (not res!26825)) b!45747))

(assert (= (and b!45747 res!26826) b!45748))

(assert (=> b!45748 m!40219))

(assert (=> start!7144 d!8923))

(declare-fun b!45790 () Bool)

(declare-fun e!29147 () List!1212)

(declare-fun $colon$colon!34 (List!1212 tuple2!1646) List!1212)

(assert (=> b!45790 (= e!29147 ($colon$colon!34 (removeStrictlySorted!32 (t!4237 l!812) key2!27) (h!1788 l!812)))))

(declare-fun b!45792 () Bool)

(declare-fun e!29145 () Bool)

(declare-fun lt!20192 () List!1212)

(declare-fun containsKey!83 (List!1212 (_ BitVec 64)) Bool)

(assert (=> b!45792 (= e!29145 (not (containsKey!83 lt!20192 key2!27)))))

(declare-fun b!45793 () Bool)

(assert (=> b!45793 (= e!29147 Nil!1209)))

(declare-fun b!45794 () Bool)

(declare-fun e!29146 () List!1212)

(assert (=> b!45794 (= e!29146 (t!4237 l!812))))

(declare-fun b!45791 () Bool)

(assert (=> b!45791 (= e!29146 e!29147)))

(declare-fun c!6165 () Bool)

(assert (=> b!45791 (= c!6165 (and ((_ is Cons!1208) l!812) (not (= (_1!834 (h!1788 l!812)) key2!27))))))

(declare-fun d!8929 () Bool)

(assert (=> d!8929 e!29145))

(declare-fun res!26840 () Bool)

(assert (=> d!8929 (=> (not res!26840) (not e!29145))))

(assert (=> d!8929 (= res!26840 (isStrictlySorted!211 lt!20192))))

(assert (=> d!8929 (= lt!20192 e!29146)))

(declare-fun c!6164 () Bool)

(assert (=> d!8929 (= c!6164 (and ((_ is Cons!1208) l!812) (= (_1!834 (h!1788 l!812)) key2!27)))))

(assert (=> d!8929 (isStrictlySorted!211 l!812)))

(assert (=> d!8929 (= (removeStrictlySorted!32 l!812 key2!27) lt!20192)))

(assert (= (and d!8929 c!6164) b!45794))

(assert (= (and d!8929 (not c!6164)) b!45791))

(assert (= (and b!45791 c!6165) b!45790))

(assert (= (and b!45791 (not c!6165)) b!45793))

(assert (= (and d!8929 res!26840) b!45792))

(assert (=> b!45790 m!40205))

(assert (=> b!45790 m!40205))

(declare-fun m!40265 () Bool)

(assert (=> b!45790 m!40265))

(declare-fun m!40267 () Bool)

(assert (=> b!45792 m!40267))

(declare-fun m!40269 () Bool)

(assert (=> d!8929 m!40269))

(assert (=> d!8929 m!40221))

(assert (=> b!45713 d!8929))

(declare-fun d!8935 () Bool)

(declare-fun res!26844 () Bool)

(declare-fun e!29153 () Bool)

(assert (=> d!8935 (=> res!26844 e!29153)))

(assert (=> d!8935 (= res!26844 (or ((_ is Nil!1209) (removeStrictlySorted!32 l!812 key2!27)) ((_ is Nil!1209) (t!4237 (removeStrictlySorted!32 l!812 key2!27)))))))

(assert (=> d!8935 (= (isStrictlySorted!211 (removeStrictlySorted!32 l!812 key2!27)) e!29153)))

(declare-fun b!45802 () Bool)

(declare-fun e!29154 () Bool)

(assert (=> b!45802 (= e!29153 e!29154)))

(declare-fun res!26845 () Bool)

(assert (=> b!45802 (=> (not res!26845) (not e!29154))))

(assert (=> b!45802 (= res!26845 (bvslt (_1!834 (h!1788 (removeStrictlySorted!32 l!812 key2!27))) (_1!834 (h!1788 (t!4237 (removeStrictlySorted!32 l!812 key2!27))))))))

(declare-fun b!45803 () Bool)

(assert (=> b!45803 (= e!29154 (isStrictlySorted!211 (t!4237 (removeStrictlySorted!32 l!812 key2!27))))))

(assert (= (and d!8935 (not res!26844)) b!45802))

(assert (= (and b!45802 res!26845) b!45803))

(declare-fun m!40279 () Bool)

(assert (=> b!45803 m!40279))

(assert (=> b!45713 d!8935))

(declare-fun b!45809 () Bool)

(declare-fun e!29160 () List!1212)

(assert (=> b!45809 (= e!29160 ($colon$colon!34 (removeStrictlySorted!32 (t!4237 (t!4237 l!812)) key2!27) (h!1788 (t!4237 l!812))))))

(declare-fun b!45811 () Bool)

(declare-fun e!29158 () Bool)

(declare-fun lt!20195 () List!1212)

(assert (=> b!45811 (= e!29158 (not (containsKey!83 lt!20195 key2!27)))))

(declare-fun b!45812 () Bool)

(assert (=> b!45812 (= e!29160 Nil!1209)))

(declare-fun b!45813 () Bool)

(declare-fun e!29159 () List!1212)

(assert (=> b!45813 (= e!29159 (t!4237 (t!4237 l!812)))))

(declare-fun b!45810 () Bool)

(assert (=> b!45810 (= e!29159 e!29160)))

(declare-fun c!6171 () Bool)

(assert (=> b!45810 (= c!6171 (and ((_ is Cons!1208) (t!4237 l!812)) (not (= (_1!834 (h!1788 (t!4237 l!812))) key2!27))))))

(declare-fun d!8939 () Bool)

(assert (=> d!8939 e!29158))

(declare-fun res!26847 () Bool)

(assert (=> d!8939 (=> (not res!26847) (not e!29158))))

(assert (=> d!8939 (= res!26847 (isStrictlySorted!211 lt!20195))))

(assert (=> d!8939 (= lt!20195 e!29159)))

(declare-fun c!6170 () Bool)

(assert (=> d!8939 (= c!6170 (and ((_ is Cons!1208) (t!4237 l!812)) (= (_1!834 (h!1788 (t!4237 l!812))) key2!27)))))

(assert (=> d!8939 (isStrictlySorted!211 (t!4237 l!812))))

(assert (=> d!8939 (= (removeStrictlySorted!32 (t!4237 l!812) key2!27) lt!20195)))

(assert (= (and d!8939 c!6170) b!45813))

(assert (= (and d!8939 (not c!6170)) b!45810))

(assert (= (and b!45810 c!6171) b!45809))

(assert (= (and b!45810 (not c!6171)) b!45812))

(assert (= (and d!8939 res!26847) b!45811))

(declare-fun m!40291 () Bool)

(assert (=> b!45809 m!40291))

(assert (=> b!45809 m!40291))

(declare-fun m!40293 () Bool)

(assert (=> b!45809 m!40293))

(declare-fun m!40295 () Bool)

(assert (=> b!45811 m!40295))

(declare-fun m!40297 () Bool)

(assert (=> d!8939 m!40297))

(assert (=> d!8939 m!40219))

(assert (=> b!45713 d!8939))

(declare-fun d!8947 () Bool)

(assert (=> d!8947 (= (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4237 l!812) key1!43) key2!27) (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4237 l!812) key2!27) key1!43))))

(declare-fun lt!20204 () Unit!1326)

(declare-fun choose!281 (List!1212 (_ BitVec 64) (_ BitVec 64)) Unit!1326)

(assert (=> d!8947 (= lt!20204 (choose!281 (t!4237 l!812) key1!43 key2!27))))

(assert (=> d!8947 (isStrictlySorted!211 (t!4237 l!812))))

(assert (=> d!8947 (= (lemmaRemoveStrictlySortedCommutative!13 (t!4237 l!812) key1!43 key2!27) lt!20204)))

(declare-fun bs!2156 () Bool)

(assert (= bs!2156 d!8947))

(assert (=> bs!2156 m!40205))

(assert (=> bs!2156 m!40209))

(assert (=> bs!2156 m!40209))

(assert (=> bs!2156 m!40211))

(assert (=> bs!2156 m!40205))

(assert (=> bs!2156 m!40215))

(assert (=> bs!2156 m!40219))

(declare-fun m!40309 () Bool)

(assert (=> bs!2156 m!40309))

(assert (=> b!45713 d!8947))

(declare-fun b!45826 () Bool)

(declare-fun e!29171 () List!1212)

(assert (=> b!45826 (= e!29171 ($colon$colon!34 (removeStrictlySorted!32 (t!4237 (removeStrictlySorted!32 (t!4237 l!812) key1!43)) key2!27) (h!1788 (removeStrictlySorted!32 (t!4237 l!812) key1!43))))))

(declare-fun b!45828 () Bool)

(declare-fun e!29169 () Bool)

(declare-fun lt!20207 () List!1212)

(assert (=> b!45828 (= e!29169 (not (containsKey!83 lt!20207 key2!27)))))

(declare-fun b!45829 () Bool)

(assert (=> b!45829 (= e!29171 Nil!1209)))

(declare-fun b!45830 () Bool)

(declare-fun e!29170 () List!1212)

(assert (=> b!45830 (= e!29170 (t!4237 (removeStrictlySorted!32 (t!4237 l!812) key1!43)))))

(declare-fun b!45827 () Bool)

(assert (=> b!45827 (= e!29170 e!29171)))

(declare-fun c!6177 () Bool)

(assert (=> b!45827 (= c!6177 (and ((_ is Cons!1208) (removeStrictlySorted!32 (t!4237 l!812) key1!43)) (not (= (_1!834 (h!1788 (removeStrictlySorted!32 (t!4237 l!812) key1!43))) key2!27))))))

(declare-fun d!8953 () Bool)

(assert (=> d!8953 e!29169))

(declare-fun res!26852 () Bool)

(assert (=> d!8953 (=> (not res!26852) (not e!29169))))

(assert (=> d!8953 (= res!26852 (isStrictlySorted!211 lt!20207))))

(assert (=> d!8953 (= lt!20207 e!29170)))

(declare-fun c!6176 () Bool)

(assert (=> d!8953 (= c!6176 (and ((_ is Cons!1208) (removeStrictlySorted!32 (t!4237 l!812) key1!43)) (= (_1!834 (h!1788 (removeStrictlySorted!32 (t!4237 l!812) key1!43))) key2!27)))))

(assert (=> d!8953 (isStrictlySorted!211 (removeStrictlySorted!32 (t!4237 l!812) key1!43))))

(assert (=> d!8953 (= (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4237 l!812) key1!43) key2!27) lt!20207)))

(assert (= (and d!8953 c!6176) b!45830))

(assert (= (and d!8953 (not c!6176)) b!45827))

(assert (= (and b!45827 c!6177) b!45826))

(assert (= (and b!45827 (not c!6177)) b!45829))

(assert (= (and d!8953 res!26852) b!45828))

(declare-fun m!40323 () Bool)

(assert (=> b!45826 m!40323))

(assert (=> b!45826 m!40323))

(declare-fun m!40325 () Bool)

(assert (=> b!45826 m!40325))

(declare-fun m!40327 () Bool)

(assert (=> b!45828 m!40327))

(declare-fun m!40329 () Bool)

(assert (=> d!8953 m!40329))

(assert (=> d!8953 m!40209))

(declare-fun m!40331 () Bool)

(assert (=> d!8953 m!40331))

(assert (=> b!45713 d!8953))

(declare-fun b!45841 () Bool)

(declare-fun e!29180 () List!1212)

(assert (=> b!45841 (= e!29180 ($colon$colon!34 (removeStrictlySorted!32 (t!4237 (t!4237 l!812)) key1!43) (h!1788 (t!4237 l!812))))))

(declare-fun b!45843 () Bool)

(declare-fun e!29178 () Bool)

(declare-fun lt!20210 () List!1212)

(assert (=> b!45843 (= e!29178 (not (containsKey!83 lt!20210 key1!43)))))

(declare-fun b!45844 () Bool)

(assert (=> b!45844 (= e!29180 Nil!1209)))

(declare-fun b!45845 () Bool)

(declare-fun e!29179 () List!1212)

(assert (=> b!45845 (= e!29179 (t!4237 (t!4237 l!812)))))

(declare-fun b!45842 () Bool)

(assert (=> b!45842 (= e!29179 e!29180)))

(declare-fun c!6183 () Bool)

(assert (=> b!45842 (= c!6183 (and ((_ is Cons!1208) (t!4237 l!812)) (not (= (_1!834 (h!1788 (t!4237 l!812))) key1!43))))))

(declare-fun d!8959 () Bool)

(assert (=> d!8959 e!29178))

(declare-fun res!26855 () Bool)

(assert (=> d!8959 (=> (not res!26855) (not e!29178))))

(assert (=> d!8959 (= res!26855 (isStrictlySorted!211 lt!20210))))

(assert (=> d!8959 (= lt!20210 e!29179)))

(declare-fun c!6182 () Bool)

(assert (=> d!8959 (= c!6182 (and ((_ is Cons!1208) (t!4237 l!812)) (= (_1!834 (h!1788 (t!4237 l!812))) key1!43)))))

(assert (=> d!8959 (isStrictlySorted!211 (t!4237 l!812))))

(assert (=> d!8959 (= (removeStrictlySorted!32 (t!4237 l!812) key1!43) lt!20210)))

(assert (= (and d!8959 c!6182) b!45845))

(assert (= (and d!8959 (not c!6182)) b!45842))

(assert (= (and b!45842 c!6183) b!45841))

(assert (= (and b!45842 (not c!6183)) b!45844))

(assert (= (and d!8959 res!26855) b!45843))

(declare-fun m!40351 () Bool)

(assert (=> b!45841 m!40351))

(assert (=> b!45841 m!40351))

(declare-fun m!40353 () Bool)

(assert (=> b!45841 m!40353))

(declare-fun m!40355 () Bool)

(assert (=> b!45843 m!40355))

(declare-fun m!40357 () Bool)

(assert (=> d!8959 m!40357))

(assert (=> d!8959 m!40219))

(assert (=> b!45713 d!8959))

(declare-fun e!29189 () List!1212)

(declare-fun b!45856 () Bool)

(assert (=> b!45856 (= e!29189 ($colon$colon!34 (removeStrictlySorted!32 (t!4237 (removeStrictlySorted!32 (t!4237 l!812) key2!27)) key1!43) (h!1788 (removeStrictlySorted!32 (t!4237 l!812) key2!27))))))

(declare-fun b!45858 () Bool)

(declare-fun e!29187 () Bool)

(declare-fun lt!20213 () List!1212)

(assert (=> b!45858 (= e!29187 (not (containsKey!83 lt!20213 key1!43)))))

(declare-fun b!45859 () Bool)

(assert (=> b!45859 (= e!29189 Nil!1209)))

(declare-fun b!45860 () Bool)

(declare-fun e!29188 () List!1212)

(assert (=> b!45860 (= e!29188 (t!4237 (removeStrictlySorted!32 (t!4237 l!812) key2!27)))))

(declare-fun b!45857 () Bool)

(assert (=> b!45857 (= e!29188 e!29189)))

(declare-fun c!6189 () Bool)

(assert (=> b!45857 (= c!6189 (and ((_ is Cons!1208) (removeStrictlySorted!32 (t!4237 l!812) key2!27)) (not (= (_1!834 (h!1788 (removeStrictlySorted!32 (t!4237 l!812) key2!27))) key1!43))))))

(declare-fun d!8965 () Bool)

(assert (=> d!8965 e!29187))

(declare-fun res!26858 () Bool)

(assert (=> d!8965 (=> (not res!26858) (not e!29187))))

(assert (=> d!8965 (= res!26858 (isStrictlySorted!211 lt!20213))))

(assert (=> d!8965 (= lt!20213 e!29188)))

(declare-fun c!6188 () Bool)

(assert (=> d!8965 (= c!6188 (and ((_ is Cons!1208) (removeStrictlySorted!32 (t!4237 l!812) key2!27)) (= (_1!834 (h!1788 (removeStrictlySorted!32 (t!4237 l!812) key2!27))) key1!43)))))

(assert (=> d!8965 (isStrictlySorted!211 (removeStrictlySorted!32 (t!4237 l!812) key2!27))))

(assert (=> d!8965 (= (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4237 l!812) key2!27) key1!43) lt!20213)))

(assert (= (and d!8965 c!6188) b!45860))

(assert (= (and d!8965 (not c!6188)) b!45857))

(assert (= (and b!45857 c!6189) b!45856))

(assert (= (and b!45857 (not c!6189)) b!45859))

(assert (= (and d!8965 res!26858) b!45858))

(declare-fun m!40377 () Bool)

(assert (=> b!45856 m!40377))

(assert (=> b!45856 m!40377))

(declare-fun m!40379 () Bool)

(assert (=> b!45856 m!40379))

(declare-fun m!40381 () Bool)

(assert (=> b!45858 m!40381))

(declare-fun m!40383 () Bool)

(assert (=> d!8965 m!40383))

(assert (=> d!8965 m!40205))

(declare-fun m!40385 () Bool)

(assert (=> d!8965 m!40385))

(assert (=> b!45713 d!8965))

(declare-fun d!8971 () Bool)

(declare-fun res!26862 () Bool)

(declare-fun e!29195 () Bool)

(assert (=> d!8971 (=> res!26862 e!29195)))

(assert (=> d!8971 (= res!26862 (or ((_ is Nil!1209) (t!4237 l!812)) ((_ is Nil!1209) (t!4237 (t!4237 l!812)))))))

(assert (=> d!8971 (= (isStrictlySorted!211 (t!4237 l!812)) e!29195)))

(declare-fun b!45868 () Bool)

(declare-fun e!29196 () Bool)

(assert (=> b!45868 (= e!29195 e!29196)))

(declare-fun res!26863 () Bool)

(assert (=> b!45868 (=> (not res!26863) (not e!29196))))

(assert (=> b!45868 (= res!26863 (bvslt (_1!834 (h!1788 (t!4237 l!812))) (_1!834 (h!1788 (t!4237 (t!4237 l!812))))))))

(declare-fun b!45869 () Bool)

(assert (=> b!45869 (= e!29196 (isStrictlySorted!211 (t!4237 (t!4237 l!812))))))

(assert (= (and d!8971 (not res!26862)) b!45868))

(assert (= (and b!45868 res!26863) b!45869))

(declare-fun m!40393 () Bool)

(assert (=> b!45869 m!40393))

(assert (=> b!45712 d!8971))

(declare-fun b!45887 () Bool)

(declare-fun e!29208 () Bool)

(declare-fun tp!6025 () Bool)

(assert (=> b!45887 (= e!29208 (and tp_is_empty!1939 tp!6025))))

(assert (=> b!45714 (= tp!6011 e!29208)))

(assert (= (and b!45714 ((_ is Cons!1208) (t!4237 l!812))) b!45887))

(check-sat (not b!45826) (not d!8953) (not d!8929) (not b!45856) (not b!45828) (not b!45809) (not b!45841) (not b!45790) (not d!8939) (not b!45811) (not b!45858) (not d!8959) (not d!8947) (not b!45887) (not b!45803) (not b!45843) (not b!45748) tp_is_empty!1939 (not d!8965) (not b!45792) (not b!45869))
(check-sat)
