; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7110 () Bool)

(assert start!7110)

(declare-fun b!45560 () Bool)

(declare-fun e!29000 () Bool)

(declare-datatypes ((B!832 0))(
  ( (B!833 (val!1003 Int)) )
))
(declare-datatypes ((tuple2!1654 0))(
  ( (tuple2!1655 (_1!838 (_ BitVec 64)) (_2!838 B!832)) )
))
(declare-datatypes ((List!1221 0))(
  ( (Nil!1218) (Cons!1217 (h!1797 tuple2!1654) (t!4246 List!1221)) )
))
(declare-fun l!812 () List!1221)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun isStrictlySorted!218 (List!1221) Bool)

(declare-fun removeStrictlySorted!28 (List!1221 (_ BitVec 64)) List!1221)

(assert (=> b!45560 (= e!29000 (not (isStrictlySorted!218 (removeStrictlySorted!28 l!812 key1!43))))))

(declare-fun key2!27 () (_ BitVec 64))

(assert (=> b!45560 (= (removeStrictlySorted!28 (removeStrictlySorted!28 (t!4246 l!812) key1!43) key2!27) (removeStrictlySorted!28 (removeStrictlySorted!28 (t!4246 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1305 0))(
  ( (Unit!1306) )
))
(declare-fun lt!20176 () Unit!1305)

(declare-fun lemmaRemoveStrictlySortedCommutative!8 (List!1221 (_ BitVec 64) (_ BitVec 64)) Unit!1305)

(assert (=> b!45560 (= lt!20176 (lemmaRemoveStrictlySortedCommutative!8 (t!4246 l!812) key1!43 key2!27))))

(declare-fun b!45558 () Bool)

(declare-fun res!26727 () Bool)

(assert (=> b!45558 (=> (not res!26727) (not e!29000))))

(get-info :version)

(assert (=> b!45558 (= res!26727 ((_ is Cons!1217) l!812))))

(declare-fun b!45561 () Bool)

(declare-fun e!28999 () Bool)

(declare-fun tp_is_empty!1929 () Bool)

(declare-fun tp!5987 () Bool)

(assert (=> b!45561 (= e!28999 (and tp_is_empty!1929 tp!5987))))

(declare-fun b!45559 () Bool)

(declare-fun res!26726 () Bool)

(assert (=> b!45559 (=> (not res!26726) (not e!29000))))

(assert (=> b!45559 (= res!26726 (isStrictlySorted!218 (t!4246 l!812)))))

(declare-fun res!26725 () Bool)

(assert (=> start!7110 (=> (not res!26725) (not e!29000))))

(assert (=> start!7110 (= res!26725 (isStrictlySorted!218 l!812))))

(assert (=> start!7110 e!29000))

(assert (=> start!7110 e!28999))

(assert (=> start!7110 true))

(assert (= (and start!7110 res!26725) b!45558))

(assert (= (and b!45558 res!26727) b!45559))

(assert (= (and b!45559 res!26726) b!45560))

(assert (= (and start!7110 ((_ is Cons!1217) l!812)) b!45561))

(declare-fun m!40107 () Bool)

(assert (=> b!45560 m!40107))

(declare-fun m!40109 () Bool)

(assert (=> b!45560 m!40109))

(declare-fun m!40111 () Bool)

(assert (=> b!45560 m!40111))

(assert (=> b!45560 m!40107))

(declare-fun m!40113 () Bool)

(assert (=> b!45560 m!40113))

(declare-fun m!40115 () Bool)

(assert (=> b!45560 m!40115))

(declare-fun m!40117 () Bool)

(assert (=> b!45560 m!40117))

(assert (=> b!45560 m!40113))

(assert (=> b!45560 m!40111))

(declare-fun m!40119 () Bool)

(assert (=> b!45560 m!40119))

(declare-fun m!40121 () Bool)

(assert (=> b!45559 m!40121))

(declare-fun m!40123 () Bool)

(assert (=> start!7110 m!40123))

(check-sat tp_is_empty!1929 (not start!7110) (not b!45559) (not b!45560) (not b!45561))
(check-sat)
(get-model)

(declare-fun b!45596 () Bool)

(declare-fun e!29026 () List!1221)

(assert (=> b!45596 (= e!29026 (t!4246 l!812))))

(declare-fun d!8879 () Bool)

(declare-fun e!29027 () Bool)

(assert (=> d!8879 e!29027))

(declare-fun res!26751 () Bool)

(assert (=> d!8879 (=> (not res!26751) (not e!29027))))

(declare-fun lt!20182 () List!1221)

(assert (=> d!8879 (= res!26751 (isStrictlySorted!218 lt!20182))))

(assert (=> d!8879 (= lt!20182 e!29026)))

(declare-fun c!6128 () Bool)

(assert (=> d!8879 (= c!6128 (and ((_ is Cons!1217) l!812) (= (_1!838 (h!1797 l!812)) key1!43)))))

(assert (=> d!8879 (isStrictlySorted!218 l!812)))

(assert (=> d!8879 (= (removeStrictlySorted!28 l!812 key1!43) lt!20182)))

(declare-fun b!45597 () Bool)

(declare-fun containsKey!78 (List!1221 (_ BitVec 64)) Bool)

(assert (=> b!45597 (= e!29027 (not (containsKey!78 lt!20182 key1!43)))))

(declare-fun b!45598 () Bool)

(declare-fun e!29025 () List!1221)

(assert (=> b!45598 (= e!29026 e!29025)))

(declare-fun c!6129 () Bool)

(assert (=> b!45598 (= c!6129 (and ((_ is Cons!1217) l!812) (not (= (_1!838 (h!1797 l!812)) key1!43))))))

(declare-fun b!45599 () Bool)

(assert (=> b!45599 (= e!29025 Nil!1218)))

(declare-fun b!45600 () Bool)

(declare-fun $colon$colon!32 (List!1221 tuple2!1654) List!1221)

(assert (=> b!45600 (= e!29025 ($colon$colon!32 (removeStrictlySorted!28 (t!4246 l!812) key1!43) (h!1797 l!812)))))

(assert (= (and d!8879 c!6128) b!45596))

(assert (= (and d!8879 (not c!6128)) b!45598))

(assert (= (and b!45598 c!6129) b!45600))

(assert (= (and b!45598 (not c!6129)) b!45599))

(assert (= (and d!8879 res!26751) b!45597))

(declare-fun m!40143 () Bool)

(assert (=> d!8879 m!40143))

(assert (=> d!8879 m!40123))

(declare-fun m!40145 () Bool)

(assert (=> b!45597 m!40145))

(assert (=> b!45600 m!40107))

(assert (=> b!45600 m!40107))

(declare-fun m!40147 () Bool)

(assert (=> b!45600 m!40147))

(assert (=> b!45560 d!8879))

(declare-fun b!45601 () Bool)

(declare-fun e!29029 () List!1221)

(assert (=> b!45601 (= e!29029 (t!4246 (t!4246 l!812)))))

(declare-fun d!8887 () Bool)

(declare-fun e!29030 () Bool)

(assert (=> d!8887 e!29030))

(declare-fun res!26752 () Bool)

(assert (=> d!8887 (=> (not res!26752) (not e!29030))))

(declare-fun lt!20185 () List!1221)

(assert (=> d!8887 (= res!26752 (isStrictlySorted!218 lt!20185))))

(assert (=> d!8887 (= lt!20185 e!29029)))

(declare-fun c!6130 () Bool)

(assert (=> d!8887 (= c!6130 (and ((_ is Cons!1217) (t!4246 l!812)) (= (_1!838 (h!1797 (t!4246 l!812))) key2!27)))))

(assert (=> d!8887 (isStrictlySorted!218 (t!4246 l!812))))

(assert (=> d!8887 (= (removeStrictlySorted!28 (t!4246 l!812) key2!27) lt!20185)))

(declare-fun b!45602 () Bool)

(assert (=> b!45602 (= e!29030 (not (containsKey!78 lt!20185 key2!27)))))

(declare-fun b!45603 () Bool)

(declare-fun e!29028 () List!1221)

(assert (=> b!45603 (= e!29029 e!29028)))

(declare-fun c!6131 () Bool)

(assert (=> b!45603 (= c!6131 (and ((_ is Cons!1217) (t!4246 l!812)) (not (= (_1!838 (h!1797 (t!4246 l!812))) key2!27))))))

(declare-fun b!45604 () Bool)

(assert (=> b!45604 (= e!29028 Nil!1218)))

(declare-fun b!45605 () Bool)

(assert (=> b!45605 (= e!29028 ($colon$colon!32 (removeStrictlySorted!28 (t!4246 (t!4246 l!812)) key2!27) (h!1797 (t!4246 l!812))))))

(assert (= (and d!8887 c!6130) b!45601))

(assert (= (and d!8887 (not c!6130)) b!45603))

(assert (= (and b!45603 c!6131) b!45605))

(assert (= (and b!45603 (not c!6131)) b!45604))

(assert (= (and d!8887 res!26752) b!45602))

(declare-fun m!40149 () Bool)

(assert (=> d!8887 m!40149))

(assert (=> d!8887 m!40121))

(declare-fun m!40151 () Bool)

(assert (=> b!45602 m!40151))

(declare-fun m!40153 () Bool)

(assert (=> b!45605 m!40153))

(assert (=> b!45605 m!40153))

(declare-fun m!40155 () Bool)

(assert (=> b!45605 m!40155))

(assert (=> b!45560 d!8887))

(declare-fun d!8889 () Bool)

(assert (=> d!8889 (= (removeStrictlySorted!28 (removeStrictlySorted!28 (t!4246 l!812) key1!43) key2!27) (removeStrictlySorted!28 (removeStrictlySorted!28 (t!4246 l!812) key2!27) key1!43))))

(declare-fun lt!20190 () Unit!1305)

(declare-fun choose!271 (List!1221 (_ BitVec 64) (_ BitVec 64)) Unit!1305)

(assert (=> d!8889 (= lt!20190 (choose!271 (t!4246 l!812) key1!43 key2!27))))

(assert (=> d!8889 (isStrictlySorted!218 (t!4246 l!812))))

(assert (=> d!8889 (= (lemmaRemoveStrictlySortedCommutative!8 (t!4246 l!812) key1!43 key2!27) lt!20190)))

(declare-fun bs!2146 () Bool)

(assert (= bs!2146 d!8889))

(assert (=> bs!2146 m!40113))

(assert (=> bs!2146 m!40113))

(assert (=> bs!2146 m!40115))

(assert (=> bs!2146 m!40107))

(assert (=> bs!2146 m!40109))

(declare-fun m!40157 () Bool)

(assert (=> bs!2146 m!40157))

(assert (=> bs!2146 m!40121))

(assert (=> bs!2146 m!40107))

(assert (=> b!45560 d!8889))

(declare-fun b!45636 () Bool)

(declare-fun e!29050 () List!1221)

(assert (=> b!45636 (= e!29050 (t!4246 (removeStrictlySorted!28 (t!4246 l!812) key1!43)))))

(declare-fun d!8891 () Bool)

(declare-fun e!29051 () Bool)

(assert (=> d!8891 e!29051))

(declare-fun res!26759 () Bool)

(assert (=> d!8891 (=> (not res!26759) (not e!29051))))

(declare-fun lt!20193 () List!1221)

(assert (=> d!8891 (= res!26759 (isStrictlySorted!218 lt!20193))))

(assert (=> d!8891 (= lt!20193 e!29050)))

(declare-fun c!6144 () Bool)

(assert (=> d!8891 (= c!6144 (and ((_ is Cons!1217) (removeStrictlySorted!28 (t!4246 l!812) key1!43)) (= (_1!838 (h!1797 (removeStrictlySorted!28 (t!4246 l!812) key1!43))) key2!27)))))

(assert (=> d!8891 (isStrictlySorted!218 (removeStrictlySorted!28 (t!4246 l!812) key1!43))))

(assert (=> d!8891 (= (removeStrictlySorted!28 (removeStrictlySorted!28 (t!4246 l!812) key1!43) key2!27) lt!20193)))

(declare-fun b!45637 () Bool)

(assert (=> b!45637 (= e!29051 (not (containsKey!78 lt!20193 key2!27)))))

(declare-fun b!45638 () Bool)

(declare-fun e!29049 () List!1221)

(assert (=> b!45638 (= e!29050 e!29049)))

(declare-fun c!6145 () Bool)

(assert (=> b!45638 (= c!6145 (and ((_ is Cons!1217) (removeStrictlySorted!28 (t!4246 l!812) key1!43)) (not (= (_1!838 (h!1797 (removeStrictlySorted!28 (t!4246 l!812) key1!43))) key2!27))))))

(declare-fun b!45639 () Bool)

(assert (=> b!45639 (= e!29049 Nil!1218)))

(declare-fun b!45640 () Bool)

(assert (=> b!45640 (= e!29049 ($colon$colon!32 (removeStrictlySorted!28 (t!4246 (removeStrictlySorted!28 (t!4246 l!812) key1!43)) key2!27) (h!1797 (removeStrictlySorted!28 (t!4246 l!812) key1!43))))))

(assert (= (and d!8891 c!6144) b!45636))

(assert (= (and d!8891 (not c!6144)) b!45638))

(assert (= (and b!45638 c!6145) b!45640))

(assert (= (and b!45638 (not c!6145)) b!45639))

(assert (= (and d!8891 res!26759) b!45637))

(declare-fun m!40171 () Bool)

(assert (=> d!8891 m!40171))

(assert (=> d!8891 m!40107))

(declare-fun m!40173 () Bool)

(assert (=> d!8891 m!40173))

(declare-fun m!40175 () Bool)

(assert (=> b!45637 m!40175))

(declare-fun m!40177 () Bool)

(assert (=> b!45640 m!40177))

(assert (=> b!45640 m!40177))

(declare-fun m!40183 () Bool)

(assert (=> b!45640 m!40183))

(assert (=> b!45560 d!8891))

(declare-fun b!45651 () Bool)

(declare-fun e!29059 () List!1221)

(assert (=> b!45651 (= e!29059 (t!4246 (removeStrictlySorted!28 (t!4246 l!812) key2!27)))))

(declare-fun d!8897 () Bool)

(declare-fun e!29060 () Bool)

(assert (=> d!8897 e!29060))

(declare-fun res!26762 () Bool)

(assert (=> d!8897 (=> (not res!26762) (not e!29060))))

(declare-fun lt!20196 () List!1221)

(assert (=> d!8897 (= res!26762 (isStrictlySorted!218 lt!20196))))

(assert (=> d!8897 (= lt!20196 e!29059)))

(declare-fun c!6150 () Bool)

(assert (=> d!8897 (= c!6150 (and ((_ is Cons!1217) (removeStrictlySorted!28 (t!4246 l!812) key2!27)) (= (_1!838 (h!1797 (removeStrictlySorted!28 (t!4246 l!812) key2!27))) key1!43)))))

(assert (=> d!8897 (isStrictlySorted!218 (removeStrictlySorted!28 (t!4246 l!812) key2!27))))

(assert (=> d!8897 (= (removeStrictlySorted!28 (removeStrictlySorted!28 (t!4246 l!812) key2!27) key1!43) lt!20196)))

(declare-fun b!45652 () Bool)

(assert (=> b!45652 (= e!29060 (not (containsKey!78 lt!20196 key1!43)))))

(declare-fun b!45653 () Bool)

(declare-fun e!29058 () List!1221)

(assert (=> b!45653 (= e!29059 e!29058)))

(declare-fun c!6151 () Bool)

(assert (=> b!45653 (= c!6151 (and ((_ is Cons!1217) (removeStrictlySorted!28 (t!4246 l!812) key2!27)) (not (= (_1!838 (h!1797 (removeStrictlySorted!28 (t!4246 l!812) key2!27))) key1!43))))))

(declare-fun b!45654 () Bool)

(assert (=> b!45654 (= e!29058 Nil!1218)))

(declare-fun b!45655 () Bool)

(assert (=> b!45655 (= e!29058 ($colon$colon!32 (removeStrictlySorted!28 (t!4246 (removeStrictlySorted!28 (t!4246 l!812) key2!27)) key1!43) (h!1797 (removeStrictlySorted!28 (t!4246 l!812) key2!27))))))

(assert (= (and d!8897 c!6150) b!45651))

(assert (= (and d!8897 (not c!6150)) b!45653))

(assert (= (and b!45653 c!6151) b!45655))

(assert (= (and b!45653 (not c!6151)) b!45654))

(assert (= (and d!8897 res!26762) b!45652))

(declare-fun m!40197 () Bool)

(assert (=> d!8897 m!40197))

(assert (=> d!8897 m!40113))

(declare-fun m!40199 () Bool)

(assert (=> d!8897 m!40199))

(declare-fun m!40201 () Bool)

(assert (=> b!45652 m!40201))

(declare-fun m!40203 () Bool)

(assert (=> b!45655 m!40203))

(assert (=> b!45655 m!40203))

(declare-fun m!40205 () Bool)

(assert (=> b!45655 m!40205))

(assert (=> b!45560 d!8897))

(declare-fun b!45656 () Bool)

(declare-fun e!29062 () List!1221)

(assert (=> b!45656 (= e!29062 (t!4246 (t!4246 l!812)))))

(declare-fun d!8903 () Bool)

(declare-fun e!29063 () Bool)

(assert (=> d!8903 e!29063))

(declare-fun res!26763 () Bool)

(assert (=> d!8903 (=> (not res!26763) (not e!29063))))

(declare-fun lt!20197 () List!1221)

(assert (=> d!8903 (= res!26763 (isStrictlySorted!218 lt!20197))))

(assert (=> d!8903 (= lt!20197 e!29062)))

(declare-fun c!6152 () Bool)

(assert (=> d!8903 (= c!6152 (and ((_ is Cons!1217) (t!4246 l!812)) (= (_1!838 (h!1797 (t!4246 l!812))) key1!43)))))

(assert (=> d!8903 (isStrictlySorted!218 (t!4246 l!812))))

(assert (=> d!8903 (= (removeStrictlySorted!28 (t!4246 l!812) key1!43) lt!20197)))

(declare-fun b!45657 () Bool)

(assert (=> b!45657 (= e!29063 (not (containsKey!78 lt!20197 key1!43)))))

(declare-fun b!45658 () Bool)

(declare-fun e!29061 () List!1221)

(assert (=> b!45658 (= e!29062 e!29061)))

(declare-fun c!6153 () Bool)

(assert (=> b!45658 (= c!6153 (and ((_ is Cons!1217) (t!4246 l!812)) (not (= (_1!838 (h!1797 (t!4246 l!812))) key1!43))))))

(declare-fun b!45659 () Bool)

(assert (=> b!45659 (= e!29061 Nil!1218)))

(declare-fun b!45660 () Bool)

(assert (=> b!45660 (= e!29061 ($colon$colon!32 (removeStrictlySorted!28 (t!4246 (t!4246 l!812)) key1!43) (h!1797 (t!4246 l!812))))))

(assert (= (and d!8903 c!6152) b!45656))

(assert (= (and d!8903 (not c!6152)) b!45658))

(assert (= (and b!45658 c!6153) b!45660))

(assert (= (and b!45658 (not c!6153)) b!45659))

(assert (= (and d!8903 res!26763) b!45657))

(declare-fun m!40207 () Bool)

(assert (=> d!8903 m!40207))

(assert (=> d!8903 m!40121))

(declare-fun m!40209 () Bool)

(assert (=> b!45657 m!40209))

(declare-fun m!40211 () Bool)

(assert (=> b!45660 m!40211))

(assert (=> b!45660 m!40211))

(declare-fun m!40213 () Bool)

(assert (=> b!45660 m!40213))

(assert (=> b!45560 d!8903))

(declare-fun d!8905 () Bool)

(declare-fun res!26769 () Bool)

(declare-fun e!29071 () Bool)

(assert (=> d!8905 (=> res!26769 e!29071)))

(assert (=> d!8905 (= res!26769 (or ((_ is Nil!1218) (removeStrictlySorted!28 l!812 key1!43)) ((_ is Nil!1218) (t!4246 (removeStrictlySorted!28 l!812 key1!43)))))))

(assert (=> d!8905 (= (isStrictlySorted!218 (removeStrictlySorted!28 l!812 key1!43)) e!29071)))

(declare-fun b!45670 () Bool)

(declare-fun e!29072 () Bool)

(assert (=> b!45670 (= e!29071 e!29072)))

(declare-fun res!26770 () Bool)

(assert (=> b!45670 (=> (not res!26770) (not e!29072))))

(assert (=> b!45670 (= res!26770 (bvslt (_1!838 (h!1797 (removeStrictlySorted!28 l!812 key1!43))) (_1!838 (h!1797 (t!4246 (removeStrictlySorted!28 l!812 key1!43))))))))

(declare-fun b!45671 () Bool)

(assert (=> b!45671 (= e!29072 (isStrictlySorted!218 (t!4246 (removeStrictlySorted!28 l!812 key1!43))))))

(assert (= (and d!8905 (not res!26769)) b!45670))

(assert (= (and b!45670 res!26770) b!45671))

(declare-fun m!40221 () Bool)

(assert (=> b!45671 m!40221))

(assert (=> b!45560 d!8905))

(declare-fun d!8909 () Bool)

(declare-fun res!26771 () Bool)

(declare-fun e!29073 () Bool)

(assert (=> d!8909 (=> res!26771 e!29073)))

(assert (=> d!8909 (= res!26771 (or ((_ is Nil!1218) (t!4246 l!812)) ((_ is Nil!1218) (t!4246 (t!4246 l!812)))))))

(assert (=> d!8909 (= (isStrictlySorted!218 (t!4246 l!812)) e!29073)))

(declare-fun b!45672 () Bool)

(declare-fun e!29074 () Bool)

(assert (=> b!45672 (= e!29073 e!29074)))

(declare-fun res!26772 () Bool)

(assert (=> b!45672 (=> (not res!26772) (not e!29074))))

(assert (=> b!45672 (= res!26772 (bvslt (_1!838 (h!1797 (t!4246 l!812))) (_1!838 (h!1797 (t!4246 (t!4246 l!812))))))))

(declare-fun b!45673 () Bool)

(assert (=> b!45673 (= e!29074 (isStrictlySorted!218 (t!4246 (t!4246 l!812))))))

(assert (= (and d!8909 (not res!26771)) b!45672))

(assert (= (and b!45672 res!26772) b!45673))

(declare-fun m!40229 () Bool)

(assert (=> b!45673 m!40229))

(assert (=> b!45559 d!8909))

(declare-fun d!8913 () Bool)

(declare-fun res!26774 () Bool)

(declare-fun e!29078 () Bool)

(assert (=> d!8913 (=> res!26774 e!29078)))

(assert (=> d!8913 (= res!26774 (or ((_ is Nil!1218) l!812) ((_ is Nil!1218) (t!4246 l!812))))))

(assert (=> d!8913 (= (isStrictlySorted!218 l!812) e!29078)))

(declare-fun b!45679 () Bool)

(declare-fun e!29079 () Bool)

(assert (=> b!45679 (= e!29078 e!29079)))

(declare-fun res!26775 () Bool)

(assert (=> b!45679 (=> (not res!26775) (not e!29079))))

(assert (=> b!45679 (= res!26775 (bvslt (_1!838 (h!1797 l!812)) (_1!838 (h!1797 (t!4246 l!812)))))))

(declare-fun b!45680 () Bool)

(assert (=> b!45680 (= e!29079 (isStrictlySorted!218 (t!4246 l!812)))))

(assert (= (and d!8913 (not res!26774)) b!45679))

(assert (= (and b!45679 res!26775) b!45680))

(assert (=> b!45680 m!40121))

(assert (=> start!7110 d!8913))

(declare-fun b!45695 () Bool)

(declare-fun e!29088 () Bool)

(declare-fun tp!5993 () Bool)

(assert (=> b!45695 (= e!29088 (and tp_is_empty!1929 tp!5993))))

(assert (=> b!45561 (= tp!5987 e!29088)))

(assert (= (and b!45561 ((_ is Cons!1217) (t!4246 l!812))) b!45695))

(check-sat tp_is_empty!1929 (not d!8887) (not b!45695) (not b!45660) (not b!45600) (not d!8903) (not b!45673) (not d!8897) (not b!45671) (not b!45655) (not b!45657) (not b!45640) (not b!45597) (not d!8879) (not b!45680) (not b!45602) (not b!45605) (not d!8889) (not b!45637) (not d!8891) (not b!45652))
(check-sat)
