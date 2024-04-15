; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7110 () Bool)

(assert start!7110)

(declare-fun b!45482 () Bool)

(declare-fun e!28950 () Bool)

(declare-datatypes ((B!830 0))(
  ( (B!831 (val!1002 Int)) )
))
(declare-datatypes ((tuple2!1656 0))(
  ( (tuple2!1657 (_1!839 (_ BitVec 64)) (_2!839 B!830)) )
))
(declare-datatypes ((List!1213 0))(
  ( (Nil!1210) (Cons!1209 (h!1789 tuple2!1656) (t!4237 List!1213)) )
))
(declare-fun l!812 () List!1213)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun isStrictlySorted!212 (List!1213) Bool)

(declare-fun removeStrictlySorted!27 (List!1213 (_ BitVec 64)) List!1213)

(assert (=> b!45482 (= e!28950 (not (isStrictlySorted!212 (removeStrictlySorted!27 l!812 key1!43))))))

(declare-fun key2!27 () (_ BitVec 64))

(assert (=> b!45482 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4237 l!812) key1!43) key2!27) (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4237 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1308 0))(
  ( (Unit!1309) )
))
(declare-fun lt!20157 () Unit!1308)

(declare-fun lemmaRemoveStrictlySortedCommutative!7 (List!1213 (_ BitVec 64) (_ BitVec 64)) Unit!1308)

(assert (=> b!45482 (= lt!20157 (lemmaRemoveStrictlySortedCommutative!7 (t!4237 l!812) key1!43 key2!27))))

(declare-fun b!45480 () Bool)

(declare-fun res!26696 () Bool)

(assert (=> b!45480 (=> (not res!26696) (not e!28950))))

(get-info :version)

(assert (=> b!45480 (= res!26696 ((_ is Cons!1209) l!812))))

(declare-fun b!45483 () Bool)

(declare-fun e!28951 () Bool)

(declare-fun tp_is_empty!1927 () Bool)

(declare-fun tp!5984 () Bool)

(assert (=> b!45483 (= e!28951 (and tp_is_empty!1927 tp!5984))))

(declare-fun res!26697 () Bool)

(assert (=> start!7110 (=> (not res!26697) (not e!28950))))

(assert (=> start!7110 (= res!26697 (isStrictlySorted!212 l!812))))

(assert (=> start!7110 e!28950))

(assert (=> start!7110 e!28951))

(assert (=> start!7110 true))

(declare-fun b!45481 () Bool)

(declare-fun res!26698 () Bool)

(assert (=> b!45481 (=> (not res!26698) (not e!28950))))

(assert (=> b!45481 (= res!26698 (isStrictlySorted!212 (t!4237 l!812)))))

(assert (= (and start!7110 res!26697) b!45480))

(assert (= (and b!45480 res!26696) b!45481))

(assert (= (and b!45481 res!26698) b!45482))

(assert (= (and start!7110 ((_ is Cons!1209) l!812)) b!45483))

(declare-fun m!40007 () Bool)

(assert (=> b!45482 m!40007))

(declare-fun m!40009 () Bool)

(assert (=> b!45482 m!40009))

(declare-fun m!40011 () Bool)

(assert (=> b!45482 m!40011))

(assert (=> b!45482 m!40007))

(declare-fun m!40013 () Bool)

(assert (=> b!45482 m!40013))

(declare-fun m!40015 () Bool)

(assert (=> b!45482 m!40015))

(declare-fun m!40017 () Bool)

(assert (=> b!45482 m!40017))

(assert (=> b!45482 m!40013))

(assert (=> b!45482 m!40011))

(declare-fun m!40019 () Bool)

(assert (=> b!45482 m!40019))

(declare-fun m!40021 () Bool)

(assert (=> start!7110 m!40021))

(declare-fun m!40023 () Bool)

(assert (=> b!45481 m!40023))

(check-sat (not b!45482) tp_is_empty!1927 (not b!45481) (not b!45483) (not start!7110))
(check-sat)
(get-model)

(declare-fun b!45548 () Bool)

(declare-fun e!28989 () Bool)

(declare-fun lt!20174 () List!1213)

(declare-fun containsKey!78 (List!1213 (_ BitVec 64)) Bool)

(assert (=> b!45548 (= e!28989 (not (containsKey!78 lt!20174 key1!43)))))

(declare-fun d!8853 () Bool)

(assert (=> d!8853 e!28989))

(declare-fun res!26725 () Bool)

(assert (=> d!8853 (=> (not res!26725) (not e!28989))))

(assert (=> d!8853 (= res!26725 (isStrictlySorted!212 lt!20174))))

(declare-fun e!28988 () List!1213)

(assert (=> d!8853 (= lt!20174 e!28988)))

(declare-fun c!6118 () Bool)

(assert (=> d!8853 (= c!6118 (and ((_ is Cons!1209) l!812) (= (_1!839 (h!1789 l!812)) key1!43)))))

(assert (=> d!8853 (isStrictlySorted!212 l!812)))

(assert (=> d!8853 (= (removeStrictlySorted!27 l!812 key1!43) lt!20174)))

(declare-fun b!45549 () Bool)

(declare-fun e!28990 () List!1213)

(declare-fun $colon$colon!33 (List!1213 tuple2!1656) List!1213)

(assert (=> b!45549 (= e!28990 ($colon$colon!33 (removeStrictlySorted!27 (t!4237 l!812) key1!43) (h!1789 l!812)))))

(declare-fun b!45550 () Bool)

(assert (=> b!45550 (= e!28990 Nil!1210)))

(declare-fun b!45551 () Bool)

(assert (=> b!45551 (= e!28988 e!28990)))

(declare-fun c!6117 () Bool)

(assert (=> b!45551 (= c!6117 (and ((_ is Cons!1209) l!812) (not (= (_1!839 (h!1789 l!812)) key1!43))))))

(declare-fun b!45552 () Bool)

(assert (=> b!45552 (= e!28988 (t!4237 l!812))))

(assert (= (and d!8853 c!6118) b!45552))

(assert (= (and d!8853 (not c!6118)) b!45551))

(assert (= (and b!45551 c!6117) b!45549))

(assert (= (and b!45551 (not c!6117)) b!45550))

(assert (= (and d!8853 res!26725) b!45548))

(declare-fun m!40075 () Bool)

(assert (=> b!45548 m!40075))

(declare-fun m!40077 () Bool)

(assert (=> d!8853 m!40077))

(assert (=> d!8853 m!40021))

(assert (=> b!45549 m!40007))

(assert (=> b!45549 m!40007))

(declare-fun m!40079 () Bool)

(assert (=> b!45549 m!40079))

(assert (=> b!45482 d!8853))

(declare-fun b!45558 () Bool)

(declare-fun e!28995 () Bool)

(declare-fun lt!20177 () List!1213)

(assert (=> b!45558 (= e!28995 (not (containsKey!78 lt!20177 key2!27)))))

(declare-fun d!8861 () Bool)

(assert (=> d!8861 e!28995))

(declare-fun res!26727 () Bool)

(assert (=> d!8861 (=> (not res!26727) (not e!28995))))

(assert (=> d!8861 (= res!26727 (isStrictlySorted!212 lt!20177))))

(declare-fun e!28994 () List!1213)

(assert (=> d!8861 (= lt!20177 e!28994)))

(declare-fun c!6122 () Bool)

(assert (=> d!8861 (= c!6122 (and ((_ is Cons!1209) (t!4237 l!812)) (= (_1!839 (h!1789 (t!4237 l!812))) key2!27)))))

(assert (=> d!8861 (isStrictlySorted!212 (t!4237 l!812))))

(assert (=> d!8861 (= (removeStrictlySorted!27 (t!4237 l!812) key2!27) lt!20177)))

(declare-fun b!45559 () Bool)

(declare-fun e!28996 () List!1213)

(assert (=> b!45559 (= e!28996 ($colon$colon!33 (removeStrictlySorted!27 (t!4237 (t!4237 l!812)) key2!27) (h!1789 (t!4237 l!812))))))

(declare-fun b!45560 () Bool)

(assert (=> b!45560 (= e!28996 Nil!1210)))

(declare-fun b!45561 () Bool)

(assert (=> b!45561 (= e!28994 e!28996)))

(declare-fun c!6121 () Bool)

(assert (=> b!45561 (= c!6121 (and ((_ is Cons!1209) (t!4237 l!812)) (not (= (_1!839 (h!1789 (t!4237 l!812))) key2!27))))))

(declare-fun b!45562 () Bool)

(assert (=> b!45562 (= e!28994 (t!4237 (t!4237 l!812)))))

(assert (= (and d!8861 c!6122) b!45562))

(assert (= (and d!8861 (not c!6122)) b!45561))

(assert (= (and b!45561 c!6121) b!45559))

(assert (= (and b!45561 (not c!6121)) b!45560))

(assert (= (and d!8861 res!26727) b!45558))

(declare-fun m!40089 () Bool)

(assert (=> b!45558 m!40089))

(declare-fun m!40091 () Bool)

(assert (=> d!8861 m!40091))

(assert (=> d!8861 m!40023))

(declare-fun m!40097 () Bool)

(assert (=> b!45559 m!40097))

(assert (=> b!45559 m!40097))

(declare-fun m!40103 () Bool)

(assert (=> b!45559 m!40103))

(assert (=> b!45482 d!8861))

(declare-fun d!8869 () Bool)

(assert (=> d!8869 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4237 l!812) key1!43) key2!27) (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4237 l!812) key2!27) key1!43))))

(declare-fun lt!20186 () Unit!1308)

(declare-fun choose!279 (List!1213 (_ BitVec 64) (_ BitVec 64)) Unit!1308)

(assert (=> d!8869 (= lt!20186 (choose!279 (t!4237 l!812) key1!43 key2!27))))

(assert (=> d!8869 (isStrictlySorted!212 (t!4237 l!812))))

(assert (=> d!8869 (= (lemmaRemoveStrictlySortedCommutative!7 (t!4237 l!812) key1!43 key2!27) lt!20186)))

(declare-fun bs!2146 () Bool)

(assert (= bs!2146 d!8869))

(assert (=> bs!2146 m!40023))

(declare-fun m!40137 () Bool)

(assert (=> bs!2146 m!40137))

(assert (=> bs!2146 m!40013))

(assert (=> bs!2146 m!40015))

(assert (=> bs!2146 m!40013))

(assert (=> bs!2146 m!40007))

(assert (=> bs!2146 m!40007))

(assert (=> bs!2146 m!40009))

(assert (=> b!45482 d!8869))

(declare-fun b!45598 () Bool)

(declare-fun e!29023 () Bool)

(declare-fun lt!20188 () List!1213)

(assert (=> b!45598 (= e!29023 (not (containsKey!78 lt!20188 key2!27)))))

(declare-fun d!8881 () Bool)

(assert (=> d!8881 e!29023))

(declare-fun res!26742 () Bool)

(assert (=> d!8881 (=> (not res!26742) (not e!29023))))

(assert (=> d!8881 (= res!26742 (isStrictlySorted!212 lt!20188))))

(declare-fun e!29022 () List!1213)

(assert (=> d!8881 (= lt!20188 e!29022)))

(declare-fun c!6132 () Bool)

(assert (=> d!8881 (= c!6132 (and ((_ is Cons!1209) (removeStrictlySorted!27 (t!4237 l!812) key1!43)) (= (_1!839 (h!1789 (removeStrictlySorted!27 (t!4237 l!812) key1!43))) key2!27)))))

(assert (=> d!8881 (isStrictlySorted!212 (removeStrictlySorted!27 (t!4237 l!812) key1!43))))

(assert (=> d!8881 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4237 l!812) key1!43) key2!27) lt!20188)))

(declare-fun e!29024 () List!1213)

(declare-fun b!45599 () Bool)

(assert (=> b!45599 (= e!29024 ($colon$colon!33 (removeStrictlySorted!27 (t!4237 (removeStrictlySorted!27 (t!4237 l!812) key1!43)) key2!27) (h!1789 (removeStrictlySorted!27 (t!4237 l!812) key1!43))))))

(declare-fun b!45600 () Bool)

(assert (=> b!45600 (= e!29024 Nil!1210)))

(declare-fun b!45601 () Bool)

(assert (=> b!45601 (= e!29022 e!29024)))

(declare-fun c!6131 () Bool)

(assert (=> b!45601 (= c!6131 (and ((_ is Cons!1209) (removeStrictlySorted!27 (t!4237 l!812) key1!43)) (not (= (_1!839 (h!1789 (removeStrictlySorted!27 (t!4237 l!812) key1!43))) key2!27))))))

(declare-fun b!45602 () Bool)

(assert (=> b!45602 (= e!29022 (t!4237 (removeStrictlySorted!27 (t!4237 l!812) key1!43)))))

(assert (= (and d!8881 c!6132) b!45602))

(assert (= (and d!8881 (not c!6132)) b!45601))

(assert (= (and b!45601 c!6131) b!45599))

(assert (= (and b!45601 (not c!6131)) b!45600))

(assert (= (and d!8881 res!26742) b!45598))

(declare-fun m!40141 () Bool)

(assert (=> b!45598 m!40141))

(declare-fun m!40143 () Bool)

(assert (=> d!8881 m!40143))

(assert (=> d!8881 m!40007))

(declare-fun m!40145 () Bool)

(assert (=> d!8881 m!40145))

(declare-fun m!40147 () Bool)

(assert (=> b!45599 m!40147))

(assert (=> b!45599 m!40147))

(declare-fun m!40149 () Bool)

(assert (=> b!45599 m!40149))

(assert (=> b!45482 d!8881))

(declare-fun b!45608 () Bool)

(declare-fun e!29029 () Bool)

(declare-fun lt!20190 () List!1213)

(assert (=> b!45608 (= e!29029 (not (containsKey!78 lt!20190 key1!43)))))

(declare-fun d!8885 () Bool)

(assert (=> d!8885 e!29029))

(declare-fun res!26744 () Bool)

(assert (=> d!8885 (=> (not res!26744) (not e!29029))))

(assert (=> d!8885 (= res!26744 (isStrictlySorted!212 lt!20190))))

(declare-fun e!29028 () List!1213)

(assert (=> d!8885 (= lt!20190 e!29028)))

(declare-fun c!6136 () Bool)

(assert (=> d!8885 (= c!6136 (and ((_ is Cons!1209) (removeStrictlySorted!27 (t!4237 l!812) key2!27)) (= (_1!839 (h!1789 (removeStrictlySorted!27 (t!4237 l!812) key2!27))) key1!43)))))

(assert (=> d!8885 (isStrictlySorted!212 (removeStrictlySorted!27 (t!4237 l!812) key2!27))))

(assert (=> d!8885 (= (removeStrictlySorted!27 (removeStrictlySorted!27 (t!4237 l!812) key2!27) key1!43) lt!20190)))

(declare-fun b!45609 () Bool)

(declare-fun e!29030 () List!1213)

(assert (=> b!45609 (= e!29030 ($colon$colon!33 (removeStrictlySorted!27 (t!4237 (removeStrictlySorted!27 (t!4237 l!812) key2!27)) key1!43) (h!1789 (removeStrictlySorted!27 (t!4237 l!812) key2!27))))))

(declare-fun b!45610 () Bool)

(assert (=> b!45610 (= e!29030 Nil!1210)))

(declare-fun b!45611 () Bool)

(assert (=> b!45611 (= e!29028 e!29030)))

(declare-fun c!6135 () Bool)

(assert (=> b!45611 (= c!6135 (and ((_ is Cons!1209) (removeStrictlySorted!27 (t!4237 l!812) key2!27)) (not (= (_1!839 (h!1789 (removeStrictlySorted!27 (t!4237 l!812) key2!27))) key1!43))))))

(declare-fun b!45612 () Bool)

(assert (=> b!45612 (= e!29028 (t!4237 (removeStrictlySorted!27 (t!4237 l!812) key2!27)))))

(assert (= (and d!8885 c!6136) b!45612))

(assert (= (and d!8885 (not c!6136)) b!45611))

(assert (= (and b!45611 c!6135) b!45609))

(assert (= (and b!45611 (not c!6135)) b!45610))

(assert (= (and d!8885 res!26744) b!45608))

(declare-fun m!40161 () Bool)

(assert (=> b!45608 m!40161))

(declare-fun m!40163 () Bool)

(assert (=> d!8885 m!40163))

(assert (=> d!8885 m!40013))

(declare-fun m!40165 () Bool)

(assert (=> d!8885 m!40165))

(declare-fun m!40167 () Bool)

(assert (=> b!45609 m!40167))

(assert (=> b!45609 m!40167))

(declare-fun m!40169 () Bool)

(assert (=> b!45609 m!40169))

(assert (=> b!45482 d!8885))

(declare-fun b!45618 () Bool)

(declare-fun e!29035 () Bool)

(declare-fun lt!20192 () List!1213)

(assert (=> b!45618 (= e!29035 (not (containsKey!78 lt!20192 key1!43)))))

(declare-fun d!8889 () Bool)

(assert (=> d!8889 e!29035))

(declare-fun res!26746 () Bool)

(assert (=> d!8889 (=> (not res!26746) (not e!29035))))

(assert (=> d!8889 (= res!26746 (isStrictlySorted!212 lt!20192))))

(declare-fun e!29034 () List!1213)

(assert (=> d!8889 (= lt!20192 e!29034)))

(declare-fun c!6140 () Bool)

(assert (=> d!8889 (= c!6140 (and ((_ is Cons!1209) (t!4237 l!812)) (= (_1!839 (h!1789 (t!4237 l!812))) key1!43)))))

(assert (=> d!8889 (isStrictlySorted!212 (t!4237 l!812))))

(assert (=> d!8889 (= (removeStrictlySorted!27 (t!4237 l!812) key1!43) lt!20192)))

(declare-fun b!45619 () Bool)

(declare-fun e!29036 () List!1213)

(assert (=> b!45619 (= e!29036 ($colon$colon!33 (removeStrictlySorted!27 (t!4237 (t!4237 l!812)) key1!43) (h!1789 (t!4237 l!812))))))

(declare-fun b!45620 () Bool)

(assert (=> b!45620 (= e!29036 Nil!1210)))

(declare-fun b!45621 () Bool)

(assert (=> b!45621 (= e!29034 e!29036)))

(declare-fun c!6139 () Bool)

(assert (=> b!45621 (= c!6139 (and ((_ is Cons!1209) (t!4237 l!812)) (not (= (_1!839 (h!1789 (t!4237 l!812))) key1!43))))))

(declare-fun b!45622 () Bool)

(assert (=> b!45622 (= e!29034 (t!4237 (t!4237 l!812)))))

(assert (= (and d!8889 c!6140) b!45622))

(assert (= (and d!8889 (not c!6140)) b!45621))

(assert (= (and b!45621 c!6139) b!45619))

(assert (= (and b!45621 (not c!6139)) b!45620))

(assert (= (and d!8889 res!26746) b!45618))

(declare-fun m!40181 () Bool)

(assert (=> b!45618 m!40181))

(declare-fun m!40183 () Bool)

(assert (=> d!8889 m!40183))

(assert (=> d!8889 m!40023))

(declare-fun m!40185 () Bool)

(assert (=> b!45619 m!40185))

(assert (=> b!45619 m!40185))

(declare-fun m!40187 () Bool)

(assert (=> b!45619 m!40187))

(assert (=> b!45482 d!8889))

(declare-fun d!8893 () Bool)

(declare-fun res!26756 () Bool)

(declare-fun e!29048 () Bool)

(assert (=> d!8893 (=> res!26756 e!29048)))

(assert (=> d!8893 (= res!26756 (or ((_ is Nil!1210) (removeStrictlySorted!27 l!812 key1!43)) ((_ is Nil!1210) (t!4237 (removeStrictlySorted!27 l!812 key1!43)))))))

(assert (=> d!8893 (= (isStrictlySorted!212 (removeStrictlySorted!27 l!812 key1!43)) e!29048)))

(declare-fun b!45636 () Bool)

(declare-fun e!29049 () Bool)

(assert (=> b!45636 (= e!29048 e!29049)))

(declare-fun res!26757 () Bool)

(assert (=> b!45636 (=> (not res!26757) (not e!29049))))

(assert (=> b!45636 (= res!26757 (bvslt (_1!839 (h!1789 (removeStrictlySorted!27 l!812 key1!43))) (_1!839 (h!1789 (t!4237 (removeStrictlySorted!27 l!812 key1!43))))))))

(declare-fun b!45637 () Bool)

(assert (=> b!45637 (= e!29049 (isStrictlySorted!212 (t!4237 (removeStrictlySorted!27 l!812 key1!43))))))

(assert (= (and d!8893 (not res!26756)) b!45636))

(assert (= (and b!45636 res!26757) b!45637))

(declare-fun m!40197 () Bool)

(assert (=> b!45637 m!40197))

(assert (=> b!45482 d!8893))

(declare-fun d!8897 () Bool)

(declare-fun res!26760 () Bool)

(declare-fun e!29052 () Bool)

(assert (=> d!8897 (=> res!26760 e!29052)))

(assert (=> d!8897 (= res!26760 (or ((_ is Nil!1210) (t!4237 l!812)) ((_ is Nil!1210) (t!4237 (t!4237 l!812)))))))

(assert (=> d!8897 (= (isStrictlySorted!212 (t!4237 l!812)) e!29052)))

(declare-fun b!45640 () Bool)

(declare-fun e!29053 () Bool)

(assert (=> b!45640 (= e!29052 e!29053)))

(declare-fun res!26761 () Bool)

(assert (=> b!45640 (=> (not res!26761) (not e!29053))))

(assert (=> b!45640 (= res!26761 (bvslt (_1!839 (h!1789 (t!4237 l!812))) (_1!839 (h!1789 (t!4237 (t!4237 l!812))))))))

(declare-fun b!45641 () Bool)

(assert (=> b!45641 (= e!29053 (isStrictlySorted!212 (t!4237 (t!4237 l!812))))))

(assert (= (and d!8897 (not res!26760)) b!45640))

(assert (= (and b!45640 res!26761) b!45641))

(declare-fun m!40201 () Bool)

(assert (=> b!45641 m!40201))

(assert (=> b!45481 d!8897))

(declare-fun d!8901 () Bool)

(declare-fun res!26764 () Bool)

(declare-fun e!29056 () Bool)

(assert (=> d!8901 (=> res!26764 e!29056)))

(assert (=> d!8901 (= res!26764 (or ((_ is Nil!1210) l!812) ((_ is Nil!1210) (t!4237 l!812))))))

(assert (=> d!8901 (= (isStrictlySorted!212 l!812) e!29056)))

(declare-fun b!45644 () Bool)

(declare-fun e!29057 () Bool)

(assert (=> b!45644 (= e!29056 e!29057)))

(declare-fun res!26765 () Bool)

(assert (=> b!45644 (=> (not res!26765) (not e!29057))))

(assert (=> b!45644 (= res!26765 (bvslt (_1!839 (h!1789 l!812)) (_1!839 (h!1789 (t!4237 l!812)))))))

(declare-fun b!45645 () Bool)

(assert (=> b!45645 (= e!29057 (isStrictlySorted!212 (t!4237 l!812)))))

(assert (= (and d!8901 (not res!26764)) b!45644))

(assert (= (and b!45644 res!26765) b!45645))

(assert (=> b!45645 m!40023))

(assert (=> start!7110 d!8901))

(declare-fun b!45656 () Bool)

(declare-fun e!29064 () Bool)

(declare-fun tp!5998 () Bool)

(assert (=> b!45656 (= e!29064 (and tp_is_empty!1927 tp!5998))))

(assert (=> b!45483 (= tp!5984 e!29064)))

(assert (= (and b!45483 ((_ is Cons!1209) (t!4237 l!812))) b!45656))

(check-sat (not b!45618) (not d!8853) (not b!45558) (not d!8885) (not d!8881) (not d!8869) (not b!45608) (not b!45598) (not b!45599) tp_is_empty!1927 (not b!45609) (not d!8889) (not b!45656) (not b!45637) (not b!45559) (not b!45548) (not b!45549) (not d!8861) (not b!45645) (not b!45619) (not b!45641))
(check-sat)
