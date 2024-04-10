; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7142 () Bool)

(assert start!7142)

(declare-fun res!26841 () Bool)

(declare-fun e!29143 () Bool)

(assert (=> start!7142 (=> (not res!26841) (not e!29143))))

(declare-datatypes ((B!846 0))(
  ( (B!847 (val!1010 Int)) )
))
(declare-datatypes ((tuple2!1668 0))(
  ( (tuple2!1669 (_1!845 (_ BitVec 64)) (_2!845 B!846)) )
))
(declare-datatypes ((List!1228 0))(
  ( (Nil!1225) (Cons!1224 (h!1804 tuple2!1668) (t!4253 List!1228)) )
))
(declare-fun l!812 () List!1228)

(declare-fun isStrictlySorted!225 (List!1228) Bool)

(assert (=> start!7142 (= res!26841 (isStrictlySorted!225 l!812))))

(assert (=> start!7142 e!29143))

(declare-fun e!29144 () Bool)

(assert (=> start!7142 e!29144))

(assert (=> start!7142 true))

(declare-fun b!45792 () Bool)

(declare-fun res!26840 () Bool)

(assert (=> b!45792 (=> (not res!26840) (not e!29143))))

(assert (=> b!45792 (= res!26840 (is-Cons!1224 l!812))))

(declare-fun b!45795 () Bool)

(declare-fun tp_is_empty!1943 () Bool)

(declare-fun tp!6017 () Bool)

(assert (=> b!45795 (= e!29144 (and tp_is_empty!1943 tp!6017))))

(declare-fun b!45793 () Bool)

(declare-fun res!26839 () Bool)

(assert (=> b!45793 (=> (not res!26839) (not e!29143))))

(assert (=> b!45793 (= res!26839 (isStrictlySorted!225 (t!4253 l!812)))))

(declare-fun b!45794 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!35 (List!1228 (_ BitVec 64)) List!1228)

(assert (=> b!45794 (= e!29143 (not (isStrictlySorted!225 (removeStrictlySorted!35 l!812 key2!27))))))

(declare-fun key1!43 () (_ BitVec 64))

(assert (=> b!45794 (= (removeStrictlySorted!35 (removeStrictlySorted!35 (t!4253 l!812) key1!43) key2!27) (removeStrictlySorted!35 (removeStrictlySorted!35 (t!4253 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1319 0))(
  ( (Unit!1320) )
))
(declare-fun lt!20227 () Unit!1319)

(declare-fun lemmaRemoveStrictlySortedCommutative!15 (List!1228 (_ BitVec 64) (_ BitVec 64)) Unit!1319)

(assert (=> b!45794 (= lt!20227 (lemmaRemoveStrictlySortedCommutative!15 (t!4253 l!812) key1!43 key2!27))))

(assert (= (and start!7142 res!26841) b!45792))

(assert (= (and b!45792 res!26840) b!45793))

(assert (= (and b!45793 res!26839) b!45794))

(assert (= (and start!7142 (is-Cons!1224 l!812)) b!45795))

(declare-fun m!40365 () Bool)

(assert (=> start!7142 m!40365))

(declare-fun m!40367 () Bool)

(assert (=> b!45793 m!40367))

(declare-fun m!40369 () Bool)

(assert (=> b!45794 m!40369))

(declare-fun m!40371 () Bool)

(assert (=> b!45794 m!40371))

(declare-fun m!40373 () Bool)

(assert (=> b!45794 m!40373))

(declare-fun m!40375 () Bool)

(assert (=> b!45794 m!40375))

(assert (=> b!45794 m!40373))

(assert (=> b!45794 m!40371))

(declare-fun m!40377 () Bool)

(assert (=> b!45794 m!40377))

(assert (=> b!45794 m!40369))

(declare-fun m!40379 () Bool)

(assert (=> b!45794 m!40379))

(declare-fun m!40381 () Bool)

(assert (=> b!45794 m!40381))

(push 1)

(assert (not b!45795))

(assert (not b!45793))

(assert tp_is_empty!1943)

(assert (not b!45794))

(assert (not start!7142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!45817 () Bool)

(declare-fun e!29158 () Bool)

(declare-fun lt!20232 () List!1228)

(declare-fun containsKey!81 (List!1228 (_ BitVec 64)) Bool)

(assert (=> b!45817 (= e!29158 (not (containsKey!81 lt!20232 key2!27)))))

(declare-fun b!45818 () Bool)

(declare-fun e!29159 () List!1228)

(assert (=> b!45818 (= e!29159 Nil!1225)))

(declare-fun b!45819 () Bool)

(declare-fun e!29157 () List!1228)

(assert (=> b!45819 (= e!29157 e!29159)))

(declare-fun c!6175 () Bool)

(assert (=> b!45819 (= c!6175 (and (is-Cons!1224 l!812) (not (= (_1!845 (h!1804 l!812)) key2!27))))))

(declare-fun b!45820 () Bool)

(assert (=> b!45820 (= e!29157 (t!4253 l!812))))

(declare-fun b!45816 () Bool)

(declare-fun $colon$colon!36 (List!1228 tuple2!1668) List!1228)

(assert (=> b!45816 (= e!29159 ($colon$colon!36 (removeStrictlySorted!35 (t!4253 l!812) key2!27) (h!1804 l!812)))))

(declare-fun d!8935 () Bool)

(assert (=> d!8935 e!29158))

(declare-fun res!26846 () Bool)

(assert (=> d!8935 (=> (not res!26846) (not e!29158))))

(assert (=> d!8935 (= res!26846 (isStrictlySorted!225 lt!20232))))

(assert (=> d!8935 (= lt!20232 e!29157)))

(declare-fun c!6174 () Bool)

(assert (=> d!8935 (= c!6174 (and (is-Cons!1224 l!812) (= (_1!845 (h!1804 l!812)) key2!27)))))

(assert (=> d!8935 (isStrictlySorted!225 l!812)))

(assert (=> d!8935 (= (removeStrictlySorted!35 l!812 key2!27) lt!20232)))

(assert (= (and d!8935 c!6174) b!45820))

(assert (= (and d!8935 (not c!6174)) b!45819))

(assert (= (and b!45819 c!6175) b!45816))

(assert (= (and b!45819 (not c!6175)) b!45818))

(assert (= (and d!8935 res!26846) b!45817))

(declare-fun m!40383 () Bool)

(assert (=> b!45817 m!40383))

(assert (=> b!45816 m!40369))

(assert (=> b!45816 m!40369))

(declare-fun m!40385 () Bool)

(assert (=> b!45816 m!40385))

(declare-fun m!40387 () Bool)

(assert (=> d!8935 m!40387))

(assert (=> d!8935 m!40365))

(assert (=> b!45794 d!8935))

(declare-fun d!8941 () Bool)

(declare-fun res!26860 () Bool)

(declare-fun e!29175 () Bool)

(assert (=> d!8941 (=> res!26860 e!29175)))

(assert (=> d!8941 (= res!26860 (or (is-Nil!1225 (removeStrictlySorted!35 l!812 key2!27)) (is-Nil!1225 (t!4253 (removeStrictlySorted!35 l!812 key2!27)))))))

(assert (=> d!8941 (= (isStrictlySorted!225 (removeStrictlySorted!35 l!812 key2!27)) e!29175)))

(declare-fun b!45838 () Bool)

(declare-fun e!29176 () Bool)

(assert (=> b!45838 (= e!29175 e!29176)))

(declare-fun res!26861 () Bool)

(assert (=> b!45838 (=> (not res!26861) (not e!29176))))

(assert (=> b!45838 (= res!26861 (bvslt (_1!845 (h!1804 (removeStrictlySorted!35 l!812 key2!27))) (_1!845 (h!1804 (t!4253 (removeStrictlySorted!35 l!812 key2!27))))))))

(declare-fun b!45839 () Bool)

(assert (=> b!45839 (= e!29176 (isStrictlySorted!225 (t!4253 (removeStrictlySorted!35 l!812 key2!27))))))

(assert (= (and d!8941 (not res!26860)) b!45838))

(assert (= (and b!45838 res!26861) b!45839))

(declare-fun m!40395 () Bool)

(assert (=> b!45839 m!40395))

(assert (=> b!45794 d!8941))

(declare-fun b!45843 () Bool)

(declare-fun e!29180 () Bool)

(declare-fun lt!20234 () List!1228)

(assert (=> b!45843 (= e!29180 (not (containsKey!81 lt!20234 key2!27)))))

(declare-fun b!45844 () Bool)

(declare-fun e!29181 () List!1228)

(assert (=> b!45844 (= e!29181 Nil!1225)))

(declare-fun b!45845 () Bool)

(declare-fun e!29179 () List!1228)

(assert (=> b!45845 (= e!29179 e!29181)))

(declare-fun c!6179 () Bool)

(assert (=> b!45845 (= c!6179 (and (is-Cons!1224 (t!4253 l!812)) (not (= (_1!845 (h!1804 (t!4253 l!812))) key2!27))))))

(declare-fun b!45846 () Bool)

(assert (=> b!45846 (= e!29179 (t!4253 (t!4253 l!812)))))

(declare-fun b!45842 () Bool)

(assert (=> b!45842 (= e!29181 ($colon$colon!36 (removeStrictlySorted!35 (t!4253 (t!4253 l!812)) key2!27) (h!1804 (t!4253 l!812))))))

(declare-fun d!8945 () Bool)

(assert (=> d!8945 e!29180))

(declare-fun res!26864 () Bool)

(assert (=> d!8945 (=> (not res!26864) (not e!29180))))

(assert (=> d!8945 (= res!26864 (isStrictlySorted!225 lt!20234))))

(assert (=> d!8945 (= lt!20234 e!29179)))

(declare-fun c!6178 () Bool)

(assert (=> d!8945 (= c!6178 (and (is-Cons!1224 (t!4253 l!812)) (= (_1!845 (h!1804 (t!4253 l!812))) key2!27)))))

(assert (=> d!8945 (isStrictlySorted!225 (t!4253 l!812))))

(assert (=> d!8945 (= (removeStrictlySorted!35 (t!4253 l!812) key2!27) lt!20234)))

(assert (= (and d!8945 c!6178) b!45846))

(assert (= (and d!8945 (not c!6178)) b!45845))

(assert (= (and b!45845 c!6179) b!45842))

(assert (= (and b!45845 (not c!6179)) b!45844))

(assert (= (and d!8945 res!26864) b!45843))

(declare-fun m!40399 () Bool)

(assert (=> b!45843 m!40399))

(declare-fun m!40401 () Bool)

(assert (=> b!45842 m!40401))

(assert (=> b!45842 m!40401))

(declare-fun m!40403 () Bool)

(assert (=> b!45842 m!40403))

(declare-fun m!40405 () Bool)

(assert (=> d!8945 m!40405))

(assert (=> d!8945 m!40367))

(assert (=> b!45794 d!8945))

(declare-fun d!8949 () Bool)

(assert (=> d!8949 (= (removeStrictlySorted!35 (removeStrictlySorted!35 (t!4253 l!812) key1!43) key2!27) (removeStrictlySorted!35 (removeStrictlySorted!35 (t!4253 l!812) key2!27) key1!43))))

(declare-fun lt!20240 () Unit!1319)

(declare-fun choose!275 (List!1228 (_ BitVec 64) (_ BitVec 64)) Unit!1319)

(assert (=> d!8949 (= lt!20240 (choose!275 (t!4253 l!812) key1!43 key2!27))))

(assert (=> d!8949 (isStrictlySorted!225 (t!4253 l!812))))

(assert (=> d!8949 (= (lemmaRemoveStrictlySortedCommutative!15 (t!4253 l!812) key1!43 key2!27) lt!20240)))

(declare-fun bs!2155 () Bool)

(assert (= bs!2155 d!8949))

(assert (=> bs!2155 m!40369))

(assert (=> bs!2155 m!40373))

(assert (=> bs!2155 m!40375))

(assert (=> bs!2155 m!40367))

(declare-fun m!40417 () Bool)

(assert (=> bs!2155 m!40417))

(assert (=> bs!2155 m!40369))

(assert (=> bs!2155 m!40379))

(assert (=> bs!2155 m!40373))

(assert (=> b!45794 d!8949))

(declare-fun b!45857 () Bool)

(declare-fun e!29190 () Bool)

(declare-fun lt!20242 () List!1228)

(assert (=> b!45857 (= e!29190 (not (containsKey!81 lt!20242 key2!27)))))

(declare-fun b!45858 () Bool)

(declare-fun e!29191 () List!1228)

(assert (=> b!45858 (= e!29191 Nil!1225)))

(declare-fun b!45859 () Bool)

(declare-fun e!29189 () List!1228)

(assert (=> b!45859 (= e!29189 e!29191)))

(declare-fun c!6183 () Bool)

(assert (=> b!45859 (= c!6183 (and (is-Cons!1224 (removeStrictlySorted!35 (t!4253 l!812) key1!43)) (not (= (_1!845 (h!1804 (removeStrictlySorted!35 (t!4253 l!812) key1!43))) key2!27))))))

(declare-fun b!45860 () Bool)

(assert (=> b!45860 (= e!29189 (t!4253 (removeStrictlySorted!35 (t!4253 l!812) key1!43)))))

(declare-fun b!45856 () Bool)

(assert (=> b!45856 (= e!29191 ($colon$colon!36 (removeStrictlySorted!35 (t!4253 (removeStrictlySorted!35 (t!4253 l!812) key1!43)) key2!27) (h!1804 (removeStrictlySorted!35 (t!4253 l!812) key1!43))))))

(declare-fun d!8957 () Bool)

(assert (=> d!8957 e!29190))

(declare-fun res!26870 () Bool)

(assert (=> d!8957 (=> (not res!26870) (not e!29190))))

(assert (=> d!8957 (= res!26870 (isStrictlySorted!225 lt!20242))))

(assert (=> d!8957 (= lt!20242 e!29189)))

(declare-fun c!6182 () Bool)

(assert (=> d!8957 (= c!6182 (and (is-Cons!1224 (removeStrictlySorted!35 (t!4253 l!812) key1!43)) (= (_1!845 (h!1804 (removeStrictlySorted!35 (t!4253 l!812) key1!43))) key2!27)))))

(assert (=> d!8957 (isStrictlySorted!225 (removeStrictlySorted!35 (t!4253 l!812) key1!43))))

(assert (=> d!8957 (= (removeStrictlySorted!35 (removeStrictlySorted!35 (t!4253 l!812) key1!43) key2!27) lt!20242)))

(assert (= (and d!8957 c!6182) b!45860))

(assert (= (and d!8957 (not c!6182)) b!45859))

(assert (= (and b!45859 c!6183) b!45856))

(assert (= (and b!45859 (not c!6183)) b!45858))

(assert (= (and d!8957 res!26870) b!45857))

(declare-fun m!40421 () Bool)

(assert (=> b!45857 m!40421))

(declare-fun m!40423 () Bool)

(assert (=> b!45856 m!40423))

(assert (=> b!45856 m!40423))

(declare-fun m!40427 () Bool)

(assert (=> b!45856 m!40427))

(declare-fun m!40429 () Bool)

(assert (=> d!8957 m!40429))

(assert (=> d!8957 m!40373))

(declare-fun m!40433 () Bool)

(assert (=> d!8957 m!40433))

(assert (=> b!45794 d!8957))

(declare-fun b!45867 () Bool)

(declare-fun e!29196 () Bool)

(declare-fun lt!20244 () List!1228)

(assert (=> b!45867 (= e!29196 (not (containsKey!81 lt!20244 key1!43)))))

(declare-fun b!45868 () Bool)

(declare-fun e!29197 () List!1228)

(assert (=> b!45868 (= e!29197 Nil!1225)))

(declare-fun b!45869 () Bool)

(declare-fun e!29195 () List!1228)

(assert (=> b!45869 (= e!29195 e!29197)))

(declare-fun c!6187 () Bool)

(assert (=> b!45869 (= c!6187 (and (is-Cons!1224 (t!4253 l!812)) (not (= (_1!845 (h!1804 (t!4253 l!812))) key1!43))))))

(declare-fun b!45870 () Bool)

(assert (=> b!45870 (= e!29195 (t!4253 (t!4253 l!812)))))

(declare-fun b!45866 () Bool)

(assert (=> b!45866 (= e!29197 ($colon$colon!36 (removeStrictlySorted!35 (t!4253 (t!4253 l!812)) key1!43) (h!1804 (t!4253 l!812))))))

(declare-fun d!8961 () Bool)

(assert (=> d!8961 e!29196))

(declare-fun res!26872 () Bool)

(assert (=> d!8961 (=> (not res!26872) (not e!29196))))

(assert (=> d!8961 (= res!26872 (isStrictlySorted!225 lt!20244))))

(assert (=> d!8961 (= lt!20244 e!29195)))

(declare-fun c!6186 () Bool)

(assert (=> d!8961 (= c!6186 (and (is-Cons!1224 (t!4253 l!812)) (= (_1!845 (h!1804 (t!4253 l!812))) key1!43)))))

(assert (=> d!8961 (isStrictlySorted!225 (t!4253 l!812))))

(assert (=> d!8961 (= (removeStrictlySorted!35 (t!4253 l!812) key1!43) lt!20244)))

(assert (= (and d!8961 c!6186) b!45870))

(assert (= (and d!8961 (not c!6186)) b!45869))

(assert (= (and b!45869 c!6187) b!45866))

(assert (= (and b!45869 (not c!6187)) b!45868))

(assert (= (and d!8961 res!26872) b!45867))

(declare-fun m!40441 () Bool)

(assert (=> b!45867 m!40441))

(declare-fun m!40443 () Bool)

(assert (=> b!45866 m!40443))

(assert (=> b!45866 m!40443))

(declare-fun m!40447 () Bool)

(assert (=> b!45866 m!40447))

(declare-fun m!40449 () Bool)

(assert (=> d!8961 m!40449))

(assert (=> d!8961 m!40367))

(assert (=> b!45794 d!8961))

(declare-fun b!45877 () Bool)

(declare-fun e!29202 () Bool)

(declare-fun lt!20246 () List!1228)

(assert (=> b!45877 (= e!29202 (not (containsKey!81 lt!20246 key1!43)))))

(declare-fun b!45878 () Bool)

(declare-fun e!29203 () List!1228)

(assert (=> b!45878 (= e!29203 Nil!1225)))

(declare-fun b!45879 () Bool)

(declare-fun e!29201 () List!1228)

(assert (=> b!45879 (= e!29201 e!29203)))

(declare-fun c!6191 () Bool)

(assert (=> b!45879 (= c!6191 (and (is-Cons!1224 (removeStrictlySorted!35 (t!4253 l!812) key2!27)) (not (= (_1!845 (h!1804 (removeStrictlySorted!35 (t!4253 l!812) key2!27))) key1!43))))))

(declare-fun b!45880 () Bool)

(assert (=> b!45880 (= e!29201 (t!4253 (removeStrictlySorted!35 (t!4253 l!812) key2!27)))))

(declare-fun b!45876 () Bool)

(assert (=> b!45876 (= e!29203 ($colon$colon!36 (removeStrictlySorted!35 (t!4253 (removeStrictlySorted!35 (t!4253 l!812) key2!27)) key1!43) (h!1804 (removeStrictlySorted!35 (t!4253 l!812) key2!27))))))

(declare-fun d!8965 () Bool)

(assert (=> d!8965 e!29202))

(declare-fun res!26874 () Bool)

(assert (=> d!8965 (=> (not res!26874) (not e!29202))))

(assert (=> d!8965 (= res!26874 (isStrictlySorted!225 lt!20246))))

(assert (=> d!8965 (= lt!20246 e!29201)))

(declare-fun c!6190 () Bool)

(assert (=> d!8965 (= c!6190 (and (is-Cons!1224 (removeStrictlySorted!35 (t!4253 l!812) key2!27)) (= (_1!845 (h!1804 (removeStrictlySorted!35 (t!4253 l!812) key2!27))) key1!43)))))

(assert (=> d!8965 (isStrictlySorted!225 (removeStrictlySorted!35 (t!4253 l!812) key2!27))))

(assert (=> d!8965 (= (removeStrictlySorted!35 (removeStrictlySorted!35 (t!4253 l!812) key2!27) key1!43) lt!20246)))

(assert (= (and d!8965 c!6190) b!45880))

(assert (= (and d!8965 (not c!6190)) b!45879))

(assert (= (and b!45879 c!6191) b!45876))

(assert (= (and b!45879 (not c!6191)) b!45878))

(assert (= (and d!8965 res!26874) b!45877))

(declare-fun m!40457 () Bool)

(assert (=> b!45877 m!40457))

(declare-fun m!40459 () Bool)

(assert (=> b!45876 m!40459))

(assert (=> b!45876 m!40459))

(declare-fun m!40463 () Bool)

(assert (=> b!45876 m!40463))

(declare-fun m!40465 () Bool)

(assert (=> d!8965 m!40465))

(assert (=> d!8965 m!40369))

(declare-fun m!40469 () Bool)

(assert (=> d!8965 m!40469))

(assert (=> b!45794 d!8965))

(declare-fun d!8969 () Bool)

(declare-fun res!26876 () Bool)

(declare-fun e!29207 () Bool)

(assert (=> d!8969 (=> res!26876 e!29207)))

(assert (=> d!8969 (= res!26876 (or (is-Nil!1225 (t!4253 l!812)) (is-Nil!1225 (t!4253 (t!4253 l!812)))))))

(assert (=> d!8969 (= (isStrictlySorted!225 (t!4253 l!812)) e!29207)))

(declare-fun b!45886 () Bool)

(declare-fun e!29208 () Bool)

(assert (=> b!45886 (= e!29207 e!29208)))

(declare-fun res!26877 () Bool)

(assert (=> b!45886 (=> (not res!26877) (not e!29208))))

(assert (=> b!45886 (= res!26877 (bvslt (_1!845 (h!1804 (t!4253 l!812))) (_1!845 (h!1804 (t!4253 (t!4253 l!812))))))))

(declare-fun b!45887 () Bool)

(assert (=> b!45887 (= e!29208 (isStrictlySorted!225 (t!4253 (t!4253 l!812))))))

(assert (= (and d!8969 (not res!26876)) b!45886))

(assert (= (and b!45886 res!26877) b!45887))

(declare-fun m!40477 () Bool)

(assert (=> b!45887 m!40477))

(assert (=> b!45793 d!8969))

(declare-fun d!8973 () Bool)

(declare-fun res!26880 () Bool)

(declare-fun e!29211 () Bool)

(assert (=> d!8973 (=> res!26880 e!29211)))

(assert (=> d!8973 (= res!26880 (or (is-Nil!1225 l!812) (is-Nil!1225 (t!4253 l!812))))))

(assert (=> d!8973 (= (isStrictlySorted!225 l!812) e!29211)))

(declare-fun b!45890 () Bool)

(declare-fun e!29212 () Bool)

(assert (=> b!45890 (= e!29211 e!29212)))

(declare-fun res!26881 () Bool)

(assert (=> b!45890 (=> (not res!26881) (not e!29212))))

(assert (=> b!45890 (= res!26881 (bvslt (_1!845 (h!1804 l!812)) (_1!845 (h!1804 (t!4253 l!812)))))))

(declare-fun b!45891 () Bool)

(assert (=> b!45891 (= e!29212 (isStrictlySorted!225 (t!4253 l!812)))))

(assert (= (and d!8973 (not res!26880)) b!45890))

(assert (= (and b!45890 res!26881) b!45891))

(assert (=> b!45891 m!40367))

(assert (=> start!7142 d!8973))

(declare-fun b!45903 () Bool)

(declare-fun e!29220 () Bool)

(declare-fun tp!6023 () Bool)

(assert (=> b!45903 (= e!29220 (and tp_is_empty!1943 tp!6023))))

