; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7140 () Bool)

(assert start!7140)

(declare-fun b!45704 () Bool)

(declare-fun e!29088 () Bool)

(declare-datatypes ((B!842 0))(
  ( (B!843 (val!1008 Int)) )
))
(declare-datatypes ((tuple2!1668 0))(
  ( (tuple2!1669 (_1!845 (_ BitVec 64)) (_2!845 B!842)) )
))
(declare-datatypes ((List!1219 0))(
  ( (Nil!1216) (Cons!1215 (h!1795 tuple2!1668) (t!4243 List!1219)) )
))
(declare-fun l!812 () List!1219)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun isStrictlySorted!218 (List!1219) Bool)

(declare-fun removeStrictlySorted!33 (List!1219 (_ BitVec 64)) List!1219)

(assert (=> b!45704 (= e!29088 (not (isStrictlySorted!218 (removeStrictlySorted!33 l!812 key2!27))))))

(declare-fun key1!43 () (_ BitVec 64))

(assert (=> b!45704 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4243 l!812) key1!43) key2!27) (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4243 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1320 0))(
  ( (Unit!1321) )
))
(declare-fun lt!20205 () Unit!1320)

(declare-fun lemmaRemoveStrictlySortedCommutative!13 (List!1219 (_ BitVec 64) (_ BitVec 64)) Unit!1320)

(assert (=> b!45704 (= lt!20205 (lemmaRemoveStrictlySortedCommutative!13 (t!4243 l!812) key1!43 key2!27))))

(declare-fun b!45705 () Bool)

(declare-fun e!29089 () Bool)

(declare-fun tp_is_empty!1939 () Bool)

(declare-fun tp!6011 () Bool)

(assert (=> b!45705 (= e!29089 (and tp_is_empty!1939 tp!6011))))

(declare-fun b!45703 () Bool)

(declare-fun res!26803 () Bool)

(assert (=> b!45703 (=> (not res!26803) (not e!29088))))

(assert (=> b!45703 (= res!26803 (isStrictlySorted!218 (t!4243 l!812)))))

(declare-fun b!45702 () Bool)

(declare-fun res!26802 () Bool)

(assert (=> b!45702 (=> (not res!26802) (not e!29088))))

(get-info :version)

(assert (=> b!45702 (= res!26802 ((_ is Cons!1215) l!812))))

(declare-fun res!26801 () Bool)

(assert (=> start!7140 (=> (not res!26801) (not e!29088))))

(assert (=> start!7140 (= res!26801 (isStrictlySorted!218 l!812))))

(assert (=> start!7140 e!29088))

(assert (=> start!7140 e!29089))

(assert (=> start!7140 true))

(assert (= (and start!7140 res!26801) b!45702))

(assert (= (and b!45702 res!26802) b!45703))

(assert (= (and b!45703 res!26803) b!45704))

(assert (= (and start!7140 ((_ is Cons!1215) l!812)) b!45705))

(declare-fun m!40247 () Bool)

(assert (=> b!45704 m!40247))

(declare-fun m!40249 () Bool)

(assert (=> b!45704 m!40249))

(declare-fun m!40251 () Bool)

(assert (=> b!45704 m!40251))

(declare-fun m!40253 () Bool)

(assert (=> b!45704 m!40253))

(assert (=> b!45704 m!40251))

(assert (=> b!45704 m!40249))

(declare-fun m!40255 () Bool)

(assert (=> b!45704 m!40255))

(assert (=> b!45704 m!40247))

(declare-fun m!40257 () Bool)

(assert (=> b!45704 m!40257))

(declare-fun m!40259 () Bool)

(assert (=> b!45704 m!40259))

(declare-fun m!40261 () Bool)

(assert (=> b!45703 m!40261))

(declare-fun m!40263 () Bool)

(assert (=> start!7140 m!40263))

(check-sat tp_is_empty!1939 (not b!45703) (not b!45705) (not b!45704) (not start!7140))
(check-sat)
(get-model)

(declare-fun b!45746 () Bool)

(declare-fun e!29116 () Bool)

(declare-fun lt!20214 () List!1219)

(declare-fun containsKey!80 (List!1219 (_ BitVec 64)) Bool)

(assert (=> b!45746 (= e!29116 (not (containsKey!80 lt!20214 key2!27)))))

(declare-fun b!45747 () Bool)

(declare-fun e!29115 () List!1219)

(declare-fun $colon$colon!34 (List!1219 tuple2!1668) List!1219)

(assert (=> b!45747 (= e!29115 ($colon$colon!34 (removeStrictlySorted!33 (t!4243 l!812) key2!27) (h!1795 l!812)))))

(declare-fun d!8909 () Bool)

(assert (=> d!8909 e!29116))

(declare-fun res!26830 () Bool)

(assert (=> d!8909 (=> (not res!26830) (not e!29116))))

(assert (=> d!8909 (= res!26830 (isStrictlySorted!218 lt!20214))))

(declare-fun e!29114 () List!1219)

(assert (=> d!8909 (= lt!20214 e!29114)))

(declare-fun c!6148 () Bool)

(assert (=> d!8909 (= c!6148 (and ((_ is Cons!1215) l!812) (= (_1!845 (h!1795 l!812)) key2!27)))))

(assert (=> d!8909 (isStrictlySorted!218 l!812)))

(assert (=> d!8909 (= (removeStrictlySorted!33 l!812 key2!27) lt!20214)))

(declare-fun b!45748 () Bool)

(assert (=> b!45748 (= e!29114 e!29115)))

(declare-fun c!6147 () Bool)

(assert (=> b!45748 (= c!6147 (and ((_ is Cons!1215) l!812) (not (= (_1!845 (h!1795 l!812)) key2!27))))))

(declare-fun b!45749 () Bool)

(assert (=> b!45749 (= e!29114 (t!4243 l!812))))

(declare-fun b!45750 () Bool)

(assert (=> b!45750 (= e!29115 Nil!1216)))

(assert (= (and d!8909 c!6148) b!45749))

(assert (= (and d!8909 (not c!6148)) b!45748))

(assert (= (and b!45748 c!6147) b!45747))

(assert (= (and b!45748 (not c!6147)) b!45750))

(assert (= (and d!8909 res!26830) b!45746))

(declare-fun m!40301 () Bool)

(assert (=> b!45746 m!40301))

(assert (=> b!45747 m!40247))

(assert (=> b!45747 m!40247))

(declare-fun m!40303 () Bool)

(assert (=> b!45747 m!40303))

(declare-fun m!40305 () Bool)

(assert (=> d!8909 m!40305))

(assert (=> d!8909 m!40263))

(assert (=> b!45704 d!8909))

(declare-fun d!8917 () Bool)

(declare-fun res!26837 () Bool)

(declare-fun e!29131 () Bool)

(assert (=> d!8917 (=> res!26837 e!29131)))

(assert (=> d!8917 (= res!26837 (or ((_ is Nil!1216) (removeStrictlySorted!33 l!812 key2!27)) ((_ is Nil!1216) (t!4243 (removeStrictlySorted!33 l!812 key2!27)))))))

(assert (=> d!8917 (= (isStrictlySorted!218 (removeStrictlySorted!33 l!812 key2!27)) e!29131)))

(declare-fun b!45773 () Bool)

(declare-fun e!29132 () Bool)

(assert (=> b!45773 (= e!29131 e!29132)))

(declare-fun res!26838 () Bool)

(assert (=> b!45773 (=> (not res!26838) (not e!29132))))

(assert (=> b!45773 (= res!26838 (bvslt (_1!845 (h!1795 (removeStrictlySorted!33 l!812 key2!27))) (_1!845 (h!1795 (t!4243 (removeStrictlySorted!33 l!812 key2!27))))))))

(declare-fun b!45774 () Bool)

(assert (=> b!45774 (= e!29132 (isStrictlySorted!218 (t!4243 (removeStrictlySorted!33 l!812 key2!27))))))

(assert (= (and d!8917 (not res!26837)) b!45773))

(assert (= (and b!45773 res!26838) b!45774))

(declare-fun m!40307 () Bool)

(assert (=> b!45774 m!40307))

(assert (=> b!45704 d!8917))

(declare-fun b!45780 () Bool)

(declare-fun e!29138 () Bool)

(declare-fun lt!20220 () List!1219)

(assert (=> b!45780 (= e!29138 (not (containsKey!80 lt!20220 key2!27)))))

(declare-fun b!45781 () Bool)

(declare-fun e!29137 () List!1219)

(assert (=> b!45781 (= e!29137 ($colon$colon!34 (removeStrictlySorted!33 (t!4243 (t!4243 l!812)) key2!27) (h!1795 (t!4243 l!812))))))

(declare-fun d!8919 () Bool)

(assert (=> d!8919 e!29138))

(declare-fun res!26840 () Bool)

(assert (=> d!8919 (=> (not res!26840) (not e!29138))))

(assert (=> d!8919 (= res!26840 (isStrictlySorted!218 lt!20220))))

(declare-fun e!29136 () List!1219)

(assert (=> d!8919 (= lt!20220 e!29136)))

(declare-fun c!6160 () Bool)

(assert (=> d!8919 (= c!6160 (and ((_ is Cons!1215) (t!4243 l!812)) (= (_1!845 (h!1795 (t!4243 l!812))) key2!27)))))

(assert (=> d!8919 (isStrictlySorted!218 (t!4243 l!812))))

(assert (=> d!8919 (= (removeStrictlySorted!33 (t!4243 l!812) key2!27) lt!20220)))

(declare-fun b!45782 () Bool)

(assert (=> b!45782 (= e!29136 e!29137)))

(declare-fun c!6159 () Bool)

(assert (=> b!45782 (= c!6159 (and ((_ is Cons!1215) (t!4243 l!812)) (not (= (_1!845 (h!1795 (t!4243 l!812))) key2!27))))))

(declare-fun b!45783 () Bool)

(assert (=> b!45783 (= e!29136 (t!4243 (t!4243 l!812)))))

(declare-fun b!45784 () Bool)

(assert (=> b!45784 (= e!29137 Nil!1216)))

(assert (= (and d!8919 c!6160) b!45783))

(assert (= (and d!8919 (not c!6160)) b!45782))

(assert (= (and b!45782 c!6159) b!45781))

(assert (= (and b!45782 (not c!6159)) b!45784))

(assert (= (and d!8919 res!26840) b!45780))

(declare-fun m!40315 () Bool)

(assert (=> b!45780 m!40315))

(declare-fun m!40317 () Bool)

(assert (=> b!45781 m!40317))

(assert (=> b!45781 m!40317))

(declare-fun m!40319 () Bool)

(assert (=> b!45781 m!40319))

(declare-fun m!40321 () Bool)

(assert (=> d!8919 m!40321))

(assert (=> d!8919 m!40261))

(assert (=> b!45704 d!8919))

(declare-fun d!8923 () Bool)

(assert (=> d!8923 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4243 l!812) key1!43) key2!27) (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4243 l!812) key2!27) key1!43))))

(declare-fun lt!20226 () Unit!1320)

(declare-fun choose!281 (List!1219 (_ BitVec 64) (_ BitVec 64)) Unit!1320)

(assert (=> d!8923 (= lt!20226 (choose!281 (t!4243 l!812) key1!43 key2!27))))

(assert (=> d!8923 (isStrictlySorted!218 (t!4243 l!812))))

(assert (=> d!8923 (= (lemmaRemoveStrictlySortedCommutative!13 (t!4243 l!812) key1!43 key2!27) lt!20226)))

(declare-fun bs!2154 () Bool)

(assert (= bs!2154 d!8923))

(declare-fun m!40333 () Bool)

(assert (=> bs!2154 m!40333))

(assert (=> bs!2154 m!40247))

(assert (=> bs!2154 m!40257))

(assert (=> bs!2154 m!40261))

(assert (=> bs!2154 m!40247))

(assert (=> bs!2154 m!40251))

(assert (=> bs!2154 m!40253))

(assert (=> bs!2154 m!40251))

(assert (=> b!45704 d!8923))

(declare-fun b!45799 () Bool)

(declare-fun e!29151 () Bool)

(declare-fun lt!20229 () List!1219)

(assert (=> b!45799 (= e!29151 (not (containsKey!80 lt!20229 key2!27)))))

(declare-fun b!45800 () Bool)

(declare-fun e!29150 () List!1219)

(assert (=> b!45800 (= e!29150 ($colon$colon!34 (removeStrictlySorted!33 (t!4243 (removeStrictlySorted!33 (t!4243 l!812) key1!43)) key2!27) (h!1795 (removeStrictlySorted!33 (t!4243 l!812) key1!43))))))

(declare-fun d!8929 () Bool)

(assert (=> d!8929 e!29151))

(declare-fun res!26847 () Bool)

(assert (=> d!8929 (=> (not res!26847) (not e!29151))))

(assert (=> d!8929 (= res!26847 (isStrictlySorted!218 lt!20229))))

(declare-fun e!29149 () List!1219)

(assert (=> d!8929 (= lt!20229 e!29149)))

(declare-fun c!6166 () Bool)

(assert (=> d!8929 (= c!6166 (and ((_ is Cons!1215) (removeStrictlySorted!33 (t!4243 l!812) key1!43)) (= (_1!845 (h!1795 (removeStrictlySorted!33 (t!4243 l!812) key1!43))) key2!27)))))

(assert (=> d!8929 (isStrictlySorted!218 (removeStrictlySorted!33 (t!4243 l!812) key1!43))))

(assert (=> d!8929 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4243 l!812) key1!43) key2!27) lt!20229)))

(declare-fun b!45801 () Bool)

(assert (=> b!45801 (= e!29149 e!29150)))

(declare-fun c!6165 () Bool)

(assert (=> b!45801 (= c!6165 (and ((_ is Cons!1215) (removeStrictlySorted!33 (t!4243 l!812) key1!43)) (not (= (_1!845 (h!1795 (removeStrictlySorted!33 (t!4243 l!812) key1!43))) key2!27))))))

(declare-fun b!45802 () Bool)

(assert (=> b!45802 (= e!29149 (t!4243 (removeStrictlySorted!33 (t!4243 l!812) key1!43)))))

(declare-fun b!45803 () Bool)

(assert (=> b!45803 (= e!29150 Nil!1216)))

(assert (= (and d!8929 c!6166) b!45802))

(assert (= (and d!8929 (not c!6166)) b!45801))

(assert (= (and b!45801 c!6165) b!45800))

(assert (= (and b!45801 (not c!6165)) b!45803))

(assert (= (and d!8929 res!26847) b!45799))

(declare-fun m!40337 () Bool)

(assert (=> b!45799 m!40337))

(declare-fun m!40339 () Bool)

(assert (=> b!45800 m!40339))

(assert (=> b!45800 m!40339))

(declare-fun m!40341 () Bool)

(assert (=> b!45800 m!40341))

(declare-fun m!40343 () Bool)

(assert (=> d!8929 m!40343))

(assert (=> d!8929 m!40251))

(declare-fun m!40345 () Bool)

(assert (=> d!8929 m!40345))

(assert (=> b!45704 d!8929))

(declare-fun b!45809 () Bool)

(declare-fun e!29157 () Bool)

(declare-fun lt!20231 () List!1219)

(assert (=> b!45809 (= e!29157 (not (containsKey!80 lt!20231 key1!43)))))

(declare-fun b!45810 () Bool)

(declare-fun e!29156 () List!1219)

(assert (=> b!45810 (= e!29156 ($colon$colon!34 (removeStrictlySorted!33 (t!4243 (t!4243 l!812)) key1!43) (h!1795 (t!4243 l!812))))))

(declare-fun d!8933 () Bool)

(assert (=> d!8933 e!29157))

(declare-fun res!26849 () Bool)

(assert (=> d!8933 (=> (not res!26849) (not e!29157))))

(assert (=> d!8933 (= res!26849 (isStrictlySorted!218 lt!20231))))

(declare-fun e!29155 () List!1219)

(assert (=> d!8933 (= lt!20231 e!29155)))

(declare-fun c!6170 () Bool)

(assert (=> d!8933 (= c!6170 (and ((_ is Cons!1215) (t!4243 l!812)) (= (_1!845 (h!1795 (t!4243 l!812))) key1!43)))))

(assert (=> d!8933 (isStrictlySorted!218 (t!4243 l!812))))

(assert (=> d!8933 (= (removeStrictlySorted!33 (t!4243 l!812) key1!43) lt!20231)))

(declare-fun b!45811 () Bool)

(assert (=> b!45811 (= e!29155 e!29156)))

(declare-fun c!6169 () Bool)

(assert (=> b!45811 (= c!6169 (and ((_ is Cons!1215) (t!4243 l!812)) (not (= (_1!845 (h!1795 (t!4243 l!812))) key1!43))))))

(declare-fun b!45812 () Bool)

(assert (=> b!45812 (= e!29155 (t!4243 (t!4243 l!812)))))

(declare-fun b!45813 () Bool)

(assert (=> b!45813 (= e!29156 Nil!1216)))

(assert (= (and d!8933 c!6170) b!45812))

(assert (= (and d!8933 (not c!6170)) b!45811))

(assert (= (and b!45811 c!6169) b!45810))

(assert (= (and b!45811 (not c!6169)) b!45813))

(assert (= (and d!8933 res!26849) b!45809))

(declare-fun m!40355 () Bool)

(assert (=> b!45809 m!40355))

(declare-fun m!40357 () Bool)

(assert (=> b!45810 m!40357))

(assert (=> b!45810 m!40357))

(declare-fun m!40365 () Bool)

(assert (=> b!45810 m!40365))

(declare-fun m!40369 () Bool)

(assert (=> d!8933 m!40369))

(assert (=> d!8933 m!40261))

(assert (=> b!45704 d!8933))

(declare-fun b!45819 () Bool)

(declare-fun e!29163 () Bool)

(declare-fun lt!20233 () List!1219)

(assert (=> b!45819 (= e!29163 (not (containsKey!80 lt!20233 key1!43)))))

(declare-fun e!29162 () List!1219)

(declare-fun b!45820 () Bool)

(assert (=> b!45820 (= e!29162 ($colon$colon!34 (removeStrictlySorted!33 (t!4243 (removeStrictlySorted!33 (t!4243 l!812) key2!27)) key1!43) (h!1795 (removeStrictlySorted!33 (t!4243 l!812) key2!27))))))

(declare-fun d!8939 () Bool)

(assert (=> d!8939 e!29163))

(declare-fun res!26851 () Bool)

(assert (=> d!8939 (=> (not res!26851) (not e!29163))))

(assert (=> d!8939 (= res!26851 (isStrictlySorted!218 lt!20233))))

(declare-fun e!29161 () List!1219)

(assert (=> d!8939 (= lt!20233 e!29161)))

(declare-fun c!6174 () Bool)

(assert (=> d!8939 (= c!6174 (and ((_ is Cons!1215) (removeStrictlySorted!33 (t!4243 l!812) key2!27)) (= (_1!845 (h!1795 (removeStrictlySorted!33 (t!4243 l!812) key2!27))) key1!43)))))

(assert (=> d!8939 (isStrictlySorted!218 (removeStrictlySorted!33 (t!4243 l!812) key2!27))))

(assert (=> d!8939 (= (removeStrictlySorted!33 (removeStrictlySorted!33 (t!4243 l!812) key2!27) key1!43) lt!20233)))

(declare-fun b!45821 () Bool)

(assert (=> b!45821 (= e!29161 e!29162)))

(declare-fun c!6173 () Bool)

(assert (=> b!45821 (= c!6173 (and ((_ is Cons!1215) (removeStrictlySorted!33 (t!4243 l!812) key2!27)) (not (= (_1!845 (h!1795 (removeStrictlySorted!33 (t!4243 l!812) key2!27))) key1!43))))))

(declare-fun b!45822 () Bool)

(assert (=> b!45822 (= e!29161 (t!4243 (removeStrictlySorted!33 (t!4243 l!812) key2!27)))))

(declare-fun b!45823 () Bool)

(assert (=> b!45823 (= e!29162 Nil!1216)))

(assert (= (and d!8939 c!6174) b!45822))

(assert (= (and d!8939 (not c!6174)) b!45821))

(assert (= (and b!45821 c!6173) b!45820))

(assert (= (and b!45821 (not c!6173)) b!45823))

(assert (= (and d!8939 res!26851) b!45819))

(declare-fun m!40373 () Bool)

(assert (=> b!45819 m!40373))

(declare-fun m!40377 () Bool)

(assert (=> b!45820 m!40377))

(assert (=> b!45820 m!40377))

(declare-fun m!40383 () Bool)

(assert (=> b!45820 m!40383))

(declare-fun m!40385 () Bool)

(assert (=> d!8939 m!40385))

(assert (=> d!8939 m!40247))

(declare-fun m!40387 () Bool)

(assert (=> d!8939 m!40387))

(assert (=> b!45704 d!8939))

(declare-fun d!8943 () Bool)

(declare-fun res!26853 () Bool)

(declare-fun e!29167 () Bool)

(assert (=> d!8943 (=> res!26853 e!29167)))

(assert (=> d!8943 (= res!26853 (or ((_ is Nil!1216) (t!4243 l!812)) ((_ is Nil!1216) (t!4243 (t!4243 l!812)))))))

(assert (=> d!8943 (= (isStrictlySorted!218 (t!4243 l!812)) e!29167)))

(declare-fun b!45829 () Bool)

(declare-fun e!29168 () Bool)

(assert (=> b!45829 (= e!29167 e!29168)))

(declare-fun res!26854 () Bool)

(assert (=> b!45829 (=> (not res!26854) (not e!29168))))

(assert (=> b!45829 (= res!26854 (bvslt (_1!845 (h!1795 (t!4243 l!812))) (_1!845 (h!1795 (t!4243 (t!4243 l!812))))))))

(declare-fun b!45830 () Bool)

(assert (=> b!45830 (= e!29168 (isStrictlySorted!218 (t!4243 (t!4243 l!812))))))

(assert (= (and d!8943 (not res!26853)) b!45829))

(assert (= (and b!45829 res!26854) b!45830))

(declare-fun m!40389 () Bool)

(assert (=> b!45830 m!40389))

(assert (=> b!45703 d!8943))

(declare-fun d!8945 () Bool)

(declare-fun res!26855 () Bool)

(declare-fun e!29169 () Bool)

(assert (=> d!8945 (=> res!26855 e!29169)))

(assert (=> d!8945 (= res!26855 (or ((_ is Nil!1216) l!812) ((_ is Nil!1216) (t!4243 l!812))))))

(assert (=> d!8945 (= (isStrictlySorted!218 l!812) e!29169)))

(declare-fun b!45831 () Bool)

(declare-fun e!29170 () Bool)

(assert (=> b!45831 (= e!29169 e!29170)))

(declare-fun res!26856 () Bool)

(assert (=> b!45831 (=> (not res!26856) (not e!29170))))

(assert (=> b!45831 (= res!26856 (bvslt (_1!845 (h!1795 l!812)) (_1!845 (h!1795 (t!4243 l!812)))))))

(declare-fun b!45832 () Bool)

(assert (=> b!45832 (= e!29170 (isStrictlySorted!218 (t!4243 l!812)))))

(assert (= (and d!8945 (not res!26855)) b!45831))

(assert (= (and b!45831 res!26856) b!45832))

(assert (=> b!45832 m!40261))

(assert (=> start!7140 d!8945))

(declare-fun b!45847 () Bool)

(declare-fun e!29181 () Bool)

(declare-fun tp!6022 () Bool)

(assert (=> b!45847 (= e!29181 (and tp_is_empty!1939 tp!6022))))

(assert (=> b!45705 (= tp!6011 e!29181)))

(assert (= (and b!45705 ((_ is Cons!1215) (t!4243 l!812))) b!45847))

(check-sat tp_is_empty!1939 (not d!8923) (not b!45847) (not d!8909) (not b!45819) (not b!45800) (not b!45781) (not b!45746) (not b!45747) (not b!45799) (not b!45774) (not d!8929) (not d!8939) (not b!45820) (not b!45832) (not d!8919) (not b!45830) (not b!45809) (not b!45810) (not d!8933) (not b!45780))
(check-sat)
