; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7140 () Bool)

(assert start!7140)

(declare-fun b!45782 () Bool)

(declare-fun e!29137 () Bool)

(declare-datatypes ((B!844 0))(
  ( (B!845 (val!1009 Int)) )
))
(declare-datatypes ((tuple2!1666 0))(
  ( (tuple2!1667 (_1!844 (_ BitVec 64)) (_2!844 B!844)) )
))
(declare-datatypes ((List!1227 0))(
  ( (Nil!1224) (Cons!1223 (h!1803 tuple2!1666) (t!4252 List!1227)) )
))
(declare-fun l!812 () List!1227)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun isStrictlySorted!224 (List!1227) Bool)

(declare-fun removeStrictlySorted!34 (List!1227 (_ BitVec 64)) List!1227)

(assert (=> b!45782 (= e!29137 (not (isStrictlySorted!224 (removeStrictlySorted!34 l!812 key2!27))))))

(declare-fun key1!43 () (_ BitVec 64))

(assert (=> b!45782 (= (removeStrictlySorted!34 (removeStrictlySorted!34 (t!4252 l!812) key1!43) key2!27) (removeStrictlySorted!34 (removeStrictlySorted!34 (t!4252 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1317 0))(
  ( (Unit!1318) )
))
(declare-fun lt!20224 () Unit!1317)

(declare-fun lemmaRemoveStrictlySortedCommutative!14 (List!1227 (_ BitVec 64) (_ BitVec 64)) Unit!1317)

(assert (=> b!45782 (= lt!20224 (lemmaRemoveStrictlySortedCommutative!14 (t!4252 l!812) key1!43 key2!27))))

(declare-fun res!26830 () Bool)

(assert (=> start!7140 (=> (not res!26830) (not e!29137))))

(assert (=> start!7140 (= res!26830 (isStrictlySorted!224 l!812))))

(assert (=> start!7140 e!29137))

(declare-fun e!29138 () Bool)

(assert (=> start!7140 e!29138))

(assert (=> start!7140 true))

(declare-fun b!45781 () Bool)

(declare-fun res!26832 () Bool)

(assert (=> b!45781 (=> (not res!26832) (not e!29137))))

(assert (=> b!45781 (= res!26832 (isStrictlySorted!224 (t!4252 l!812)))))

(declare-fun b!45780 () Bool)

(declare-fun res!26831 () Bool)

(assert (=> b!45780 (=> (not res!26831) (not e!29137))))

(get-info :version)

(assert (=> b!45780 (= res!26831 ((_ is Cons!1223) l!812))))

(declare-fun b!45783 () Bool)

(declare-fun tp_is_empty!1941 () Bool)

(declare-fun tp!6014 () Bool)

(assert (=> b!45783 (= e!29138 (and tp_is_empty!1941 tp!6014))))

(assert (= (and start!7140 res!26830) b!45780))

(assert (= (and b!45780 res!26831) b!45781))

(assert (= (and b!45781 res!26832) b!45782))

(assert (= (and start!7140 ((_ is Cons!1223) l!812)) b!45783))

(declare-fun m!40347 () Bool)

(assert (=> b!45782 m!40347))

(declare-fun m!40349 () Bool)

(assert (=> b!45782 m!40349))

(declare-fun m!40351 () Bool)

(assert (=> b!45782 m!40351))

(declare-fun m!40353 () Bool)

(assert (=> b!45782 m!40353))

(assert (=> b!45782 m!40351))

(assert (=> b!45782 m!40349))

(declare-fun m!40355 () Bool)

(assert (=> b!45782 m!40355))

(assert (=> b!45782 m!40347))

(declare-fun m!40357 () Bool)

(assert (=> b!45782 m!40357))

(declare-fun m!40359 () Bool)

(assert (=> b!45782 m!40359))

(declare-fun m!40361 () Bool)

(assert (=> start!7140 m!40361))

(declare-fun m!40363 () Bool)

(assert (=> b!45781 m!40363))

(check-sat (not b!45781) (not b!45782) (not start!7140) tp_is_empty!1941 (not b!45783))
(check-sat)
(get-model)

(declare-fun d!8939 () Bool)

(declare-fun res!26866 () Bool)

(declare-fun e!29185 () Bool)

(assert (=> d!8939 (=> res!26866 e!29185)))

(assert (=> d!8939 (= res!26866 (or ((_ is Nil!1224) (t!4252 l!812)) ((_ is Nil!1224) (t!4252 (t!4252 l!812)))))))

(assert (=> d!8939 (= (isStrictlySorted!224 (t!4252 l!812)) e!29185)))

(declare-fun b!45852 () Bool)

(declare-fun e!29186 () Bool)

(assert (=> b!45852 (= e!29185 e!29186)))

(declare-fun res!26867 () Bool)

(assert (=> b!45852 (=> (not res!26867) (not e!29186))))

(assert (=> b!45852 (= res!26867 (bvslt (_1!844 (h!1803 (t!4252 l!812))) (_1!844 (h!1803 (t!4252 (t!4252 l!812))))))))

(declare-fun b!45853 () Bool)

(assert (=> b!45853 (= e!29186 (isStrictlySorted!224 (t!4252 (t!4252 l!812))))))

(assert (= (and d!8939 (not res!26866)) b!45852))

(assert (= (and b!45852 res!26867) b!45853))

(declare-fun m!40415 () Bool)

(assert (=> b!45853 m!40415))

(assert (=> b!45781 d!8939))

(declare-fun d!8953 () Bool)

(declare-fun res!26868 () Bool)

(declare-fun e!29187 () Bool)

(assert (=> d!8953 (=> res!26868 e!29187)))

(assert (=> d!8953 (= res!26868 (or ((_ is Nil!1224) l!812) ((_ is Nil!1224) (t!4252 l!812))))))

(assert (=> d!8953 (= (isStrictlySorted!224 l!812) e!29187)))

(declare-fun b!45854 () Bool)

(declare-fun e!29188 () Bool)

(assert (=> b!45854 (= e!29187 e!29188)))

(declare-fun res!26869 () Bool)

(assert (=> b!45854 (=> (not res!26869) (not e!29188))))

(assert (=> b!45854 (= res!26869 (bvslt (_1!844 (h!1803 l!812)) (_1!844 (h!1803 (t!4252 l!812)))))))

(declare-fun b!45855 () Bool)

(assert (=> b!45855 (= e!29188 (isStrictlySorted!224 (t!4252 l!812)))))

(assert (= (and d!8953 (not res!26868)) b!45854))

(assert (= (and b!45854 res!26869) b!45855))

(assert (=> b!45855 m!40363))

(assert (=> start!7140 d!8953))

(declare-fun b!45915 () Bool)

(declare-fun e!29229 () List!1227)

(declare-fun $colon$colon!37 (List!1227 tuple2!1666) List!1227)

(assert (=> b!45915 (= e!29229 ($colon$colon!37 (removeStrictlySorted!34 (t!4252 l!812) key2!27) (h!1803 l!812)))))

(declare-fun b!45916 () Bool)

(declare-fun e!29227 () Bool)

(declare-fun lt!20250 () List!1227)

(declare-fun containsKey!83 (List!1227 (_ BitVec 64)) Bool)

(assert (=> b!45916 (= e!29227 (not (containsKey!83 lt!20250 key2!27)))))

(declare-fun b!45914 () Bool)

(assert (=> b!45914 (= e!29229 Nil!1224)))

(declare-fun d!8955 () Bool)

(assert (=> d!8955 e!29227))

(declare-fun res!26886 () Bool)

(assert (=> d!8955 (=> (not res!26886) (not e!29227))))

(assert (=> d!8955 (= res!26886 (isStrictlySorted!224 lt!20250))))

(declare-fun e!29228 () List!1227)

(assert (=> d!8955 (= lt!20250 e!29228)))

(declare-fun c!6199 () Bool)

(assert (=> d!8955 (= c!6199 (and ((_ is Cons!1223) l!812) (= (_1!844 (h!1803 l!812)) key2!27)))))

(assert (=> d!8955 (isStrictlySorted!224 l!812)))

(assert (=> d!8955 (= (removeStrictlySorted!34 l!812 key2!27) lt!20250)))

(declare-fun b!45917 () Bool)

(assert (=> b!45917 (= e!29228 (t!4252 l!812))))

(declare-fun b!45918 () Bool)

(assert (=> b!45918 (= e!29228 e!29229)))

(declare-fun c!6198 () Bool)

(assert (=> b!45918 (= c!6198 (and ((_ is Cons!1223) l!812) (not (= (_1!844 (h!1803 l!812)) key2!27))))))

(assert (= (and d!8955 c!6199) b!45917))

(assert (= (and d!8955 (not c!6199)) b!45918))

(assert (= (and b!45918 c!6198) b!45915))

(assert (= (and b!45918 (not c!6198)) b!45914))

(assert (= (and d!8955 res!26886) b!45916))

(assert (=> b!45915 m!40347))

(assert (=> b!45915 m!40347))

(declare-fun m!40481 () Bool)

(assert (=> b!45915 m!40481))

(declare-fun m!40483 () Bool)

(assert (=> b!45916 m!40483))

(declare-fun m!40485 () Bool)

(assert (=> d!8955 m!40485))

(assert (=> d!8955 m!40361))

(assert (=> b!45782 d!8955))

(declare-fun d!8977 () Bool)

(declare-fun res!26887 () Bool)

(declare-fun e!29230 () Bool)

(assert (=> d!8977 (=> res!26887 e!29230)))

(assert (=> d!8977 (= res!26887 (or ((_ is Nil!1224) (removeStrictlySorted!34 l!812 key2!27)) ((_ is Nil!1224) (t!4252 (removeStrictlySorted!34 l!812 key2!27)))))))

(assert (=> d!8977 (= (isStrictlySorted!224 (removeStrictlySorted!34 l!812 key2!27)) e!29230)))

(declare-fun b!45919 () Bool)

(declare-fun e!29231 () Bool)

(assert (=> b!45919 (= e!29230 e!29231)))

(declare-fun res!26888 () Bool)

(assert (=> b!45919 (=> (not res!26888) (not e!29231))))

(assert (=> b!45919 (= res!26888 (bvslt (_1!844 (h!1803 (removeStrictlySorted!34 l!812 key2!27))) (_1!844 (h!1803 (t!4252 (removeStrictlySorted!34 l!812 key2!27))))))))

(declare-fun b!45920 () Bool)

(assert (=> b!45920 (= e!29231 (isStrictlySorted!224 (t!4252 (removeStrictlySorted!34 l!812 key2!27))))))

(assert (= (and d!8977 (not res!26887)) b!45919))

(assert (= (and b!45919 res!26888) b!45920))

(declare-fun m!40487 () Bool)

(assert (=> b!45920 m!40487))

(assert (=> b!45782 d!8977))

(declare-fun b!45922 () Bool)

(declare-fun e!29234 () List!1227)

(assert (=> b!45922 (= e!29234 ($colon$colon!37 (removeStrictlySorted!34 (t!4252 (t!4252 l!812)) key2!27) (h!1803 (t!4252 l!812))))))

(declare-fun b!45923 () Bool)

(declare-fun e!29232 () Bool)

(declare-fun lt!20251 () List!1227)

(assert (=> b!45923 (= e!29232 (not (containsKey!83 lt!20251 key2!27)))))

(declare-fun b!45921 () Bool)

(assert (=> b!45921 (= e!29234 Nil!1224)))

(declare-fun d!8979 () Bool)

(assert (=> d!8979 e!29232))

(declare-fun res!26889 () Bool)

(assert (=> d!8979 (=> (not res!26889) (not e!29232))))

(assert (=> d!8979 (= res!26889 (isStrictlySorted!224 lt!20251))))

(declare-fun e!29233 () List!1227)

(assert (=> d!8979 (= lt!20251 e!29233)))

(declare-fun c!6201 () Bool)

(assert (=> d!8979 (= c!6201 (and ((_ is Cons!1223) (t!4252 l!812)) (= (_1!844 (h!1803 (t!4252 l!812))) key2!27)))))

(assert (=> d!8979 (isStrictlySorted!224 (t!4252 l!812))))

(assert (=> d!8979 (= (removeStrictlySorted!34 (t!4252 l!812) key2!27) lt!20251)))

(declare-fun b!45924 () Bool)

(assert (=> b!45924 (= e!29233 (t!4252 (t!4252 l!812)))))

(declare-fun b!45925 () Bool)

(assert (=> b!45925 (= e!29233 e!29234)))

(declare-fun c!6200 () Bool)

(assert (=> b!45925 (= c!6200 (and ((_ is Cons!1223) (t!4252 l!812)) (not (= (_1!844 (h!1803 (t!4252 l!812))) key2!27))))))

(assert (= (and d!8979 c!6201) b!45924))

(assert (= (and d!8979 (not c!6201)) b!45925))

(assert (= (and b!45925 c!6200) b!45922))

(assert (= (and b!45925 (not c!6200)) b!45921))

(assert (= (and d!8979 res!26889) b!45923))

(declare-fun m!40489 () Bool)

(assert (=> b!45922 m!40489))

(assert (=> b!45922 m!40489))

(declare-fun m!40491 () Bool)

(assert (=> b!45922 m!40491))

(declare-fun m!40493 () Bool)

(assert (=> b!45923 m!40493))

(declare-fun m!40495 () Bool)

(assert (=> d!8979 m!40495))

(assert (=> d!8979 m!40363))

(assert (=> b!45782 d!8979))

(declare-fun d!8981 () Bool)

(assert (=> d!8981 (= (removeStrictlySorted!34 (removeStrictlySorted!34 (t!4252 l!812) key1!43) key2!27) (removeStrictlySorted!34 (removeStrictlySorted!34 (t!4252 l!812) key2!27) key1!43))))

(declare-fun lt!20254 () Unit!1317)

(declare-fun choose!276 (List!1227 (_ BitVec 64) (_ BitVec 64)) Unit!1317)

(assert (=> d!8981 (= lt!20254 (choose!276 (t!4252 l!812) key1!43 key2!27))))

(assert (=> d!8981 (isStrictlySorted!224 (t!4252 l!812))))

(assert (=> d!8981 (= (lemmaRemoveStrictlySortedCommutative!14 (t!4252 l!812) key1!43 key2!27) lt!20254)))

(declare-fun bs!2157 () Bool)

(assert (= bs!2157 d!8981))

(assert (=> bs!2157 m!40347))

(assert (=> bs!2157 m!40363))

(assert (=> bs!2157 m!40351))

(assert (=> bs!2157 m!40351))

(assert (=> bs!2157 m!40353))

(assert (=> bs!2157 m!40347))

(assert (=> bs!2157 m!40357))

(declare-fun m!40497 () Bool)

(assert (=> bs!2157 m!40497))

(assert (=> b!45782 d!8981))

(declare-fun b!45927 () Bool)

(declare-fun e!29237 () List!1227)

(assert (=> b!45927 (= e!29237 ($colon$colon!37 (removeStrictlySorted!34 (t!4252 (removeStrictlySorted!34 (t!4252 l!812) key1!43)) key2!27) (h!1803 (removeStrictlySorted!34 (t!4252 l!812) key1!43))))))

(declare-fun b!45928 () Bool)

(declare-fun e!29235 () Bool)

(declare-fun lt!20255 () List!1227)

(assert (=> b!45928 (= e!29235 (not (containsKey!83 lt!20255 key2!27)))))

(declare-fun b!45926 () Bool)

(assert (=> b!45926 (= e!29237 Nil!1224)))

(declare-fun d!8983 () Bool)

(assert (=> d!8983 e!29235))

(declare-fun res!26890 () Bool)

(assert (=> d!8983 (=> (not res!26890) (not e!29235))))

(assert (=> d!8983 (= res!26890 (isStrictlySorted!224 lt!20255))))

(declare-fun e!29236 () List!1227)

(assert (=> d!8983 (= lt!20255 e!29236)))

(declare-fun c!6203 () Bool)

(assert (=> d!8983 (= c!6203 (and ((_ is Cons!1223) (removeStrictlySorted!34 (t!4252 l!812) key1!43)) (= (_1!844 (h!1803 (removeStrictlySorted!34 (t!4252 l!812) key1!43))) key2!27)))))

(assert (=> d!8983 (isStrictlySorted!224 (removeStrictlySorted!34 (t!4252 l!812) key1!43))))

(assert (=> d!8983 (= (removeStrictlySorted!34 (removeStrictlySorted!34 (t!4252 l!812) key1!43) key2!27) lt!20255)))

(declare-fun b!45929 () Bool)

(assert (=> b!45929 (= e!29236 (t!4252 (removeStrictlySorted!34 (t!4252 l!812) key1!43)))))

(declare-fun b!45930 () Bool)

(assert (=> b!45930 (= e!29236 e!29237)))

(declare-fun c!6202 () Bool)

(assert (=> b!45930 (= c!6202 (and ((_ is Cons!1223) (removeStrictlySorted!34 (t!4252 l!812) key1!43)) (not (= (_1!844 (h!1803 (removeStrictlySorted!34 (t!4252 l!812) key1!43))) key2!27))))))

(assert (= (and d!8983 c!6203) b!45929))

(assert (= (and d!8983 (not c!6203)) b!45930))

(assert (= (and b!45930 c!6202) b!45927))

(assert (= (and b!45930 (not c!6202)) b!45926))

(assert (= (and d!8983 res!26890) b!45928))

(declare-fun m!40499 () Bool)

(assert (=> b!45927 m!40499))

(assert (=> b!45927 m!40499))

(declare-fun m!40501 () Bool)

(assert (=> b!45927 m!40501))

(declare-fun m!40503 () Bool)

(assert (=> b!45928 m!40503))

(declare-fun m!40505 () Bool)

(assert (=> d!8983 m!40505))

(assert (=> d!8983 m!40351))

(declare-fun m!40507 () Bool)

(assert (=> d!8983 m!40507))

(assert (=> b!45782 d!8983))

(declare-fun b!45932 () Bool)

(declare-fun e!29240 () List!1227)

(assert (=> b!45932 (= e!29240 ($colon$colon!37 (removeStrictlySorted!34 (t!4252 (t!4252 l!812)) key1!43) (h!1803 (t!4252 l!812))))))

(declare-fun b!45933 () Bool)

(declare-fun e!29238 () Bool)

(declare-fun lt!20256 () List!1227)

(assert (=> b!45933 (= e!29238 (not (containsKey!83 lt!20256 key1!43)))))

(declare-fun b!45931 () Bool)

(assert (=> b!45931 (= e!29240 Nil!1224)))

(declare-fun d!8985 () Bool)

(assert (=> d!8985 e!29238))

(declare-fun res!26891 () Bool)

(assert (=> d!8985 (=> (not res!26891) (not e!29238))))

(assert (=> d!8985 (= res!26891 (isStrictlySorted!224 lt!20256))))

(declare-fun e!29239 () List!1227)

(assert (=> d!8985 (= lt!20256 e!29239)))

(declare-fun c!6205 () Bool)

(assert (=> d!8985 (= c!6205 (and ((_ is Cons!1223) (t!4252 l!812)) (= (_1!844 (h!1803 (t!4252 l!812))) key1!43)))))

(assert (=> d!8985 (isStrictlySorted!224 (t!4252 l!812))))

(assert (=> d!8985 (= (removeStrictlySorted!34 (t!4252 l!812) key1!43) lt!20256)))

(declare-fun b!45934 () Bool)

(assert (=> b!45934 (= e!29239 (t!4252 (t!4252 l!812)))))

(declare-fun b!45935 () Bool)

(assert (=> b!45935 (= e!29239 e!29240)))

(declare-fun c!6204 () Bool)

(assert (=> b!45935 (= c!6204 (and ((_ is Cons!1223) (t!4252 l!812)) (not (= (_1!844 (h!1803 (t!4252 l!812))) key1!43))))))

(assert (= (and d!8985 c!6205) b!45934))

(assert (= (and d!8985 (not c!6205)) b!45935))

(assert (= (and b!45935 c!6204) b!45932))

(assert (= (and b!45935 (not c!6204)) b!45931))

(assert (= (and d!8985 res!26891) b!45933))

(declare-fun m!40509 () Bool)

(assert (=> b!45932 m!40509))

(assert (=> b!45932 m!40509))

(declare-fun m!40511 () Bool)

(assert (=> b!45932 m!40511))

(declare-fun m!40513 () Bool)

(assert (=> b!45933 m!40513))

(declare-fun m!40515 () Bool)

(assert (=> d!8985 m!40515))

(assert (=> d!8985 m!40363))

(assert (=> b!45782 d!8985))

(declare-fun b!45937 () Bool)

(declare-fun e!29243 () List!1227)

(assert (=> b!45937 (= e!29243 ($colon$colon!37 (removeStrictlySorted!34 (t!4252 (removeStrictlySorted!34 (t!4252 l!812) key2!27)) key1!43) (h!1803 (removeStrictlySorted!34 (t!4252 l!812) key2!27))))))

(declare-fun b!45938 () Bool)

(declare-fun e!29241 () Bool)

(declare-fun lt!20257 () List!1227)

(assert (=> b!45938 (= e!29241 (not (containsKey!83 lt!20257 key1!43)))))

(declare-fun b!45936 () Bool)

(assert (=> b!45936 (= e!29243 Nil!1224)))

(declare-fun d!8987 () Bool)

(assert (=> d!8987 e!29241))

(declare-fun res!26892 () Bool)

(assert (=> d!8987 (=> (not res!26892) (not e!29241))))

(assert (=> d!8987 (= res!26892 (isStrictlySorted!224 lt!20257))))

(declare-fun e!29242 () List!1227)

(assert (=> d!8987 (= lt!20257 e!29242)))

(declare-fun c!6207 () Bool)

(assert (=> d!8987 (= c!6207 (and ((_ is Cons!1223) (removeStrictlySorted!34 (t!4252 l!812) key2!27)) (= (_1!844 (h!1803 (removeStrictlySorted!34 (t!4252 l!812) key2!27))) key1!43)))))

(assert (=> d!8987 (isStrictlySorted!224 (removeStrictlySorted!34 (t!4252 l!812) key2!27))))

(assert (=> d!8987 (= (removeStrictlySorted!34 (removeStrictlySorted!34 (t!4252 l!812) key2!27) key1!43) lt!20257)))

(declare-fun b!45939 () Bool)

(assert (=> b!45939 (= e!29242 (t!4252 (removeStrictlySorted!34 (t!4252 l!812) key2!27)))))

(declare-fun b!45940 () Bool)

(assert (=> b!45940 (= e!29242 e!29243)))

(declare-fun c!6206 () Bool)

(assert (=> b!45940 (= c!6206 (and ((_ is Cons!1223) (removeStrictlySorted!34 (t!4252 l!812) key2!27)) (not (= (_1!844 (h!1803 (removeStrictlySorted!34 (t!4252 l!812) key2!27))) key1!43))))))

(assert (= (and d!8987 c!6207) b!45939))

(assert (= (and d!8987 (not c!6207)) b!45940))

(assert (= (and b!45940 c!6206) b!45937))

(assert (= (and b!45940 (not c!6206)) b!45936))

(assert (= (and d!8987 res!26892) b!45938))

(declare-fun m!40517 () Bool)

(assert (=> b!45937 m!40517))

(assert (=> b!45937 m!40517))

(declare-fun m!40519 () Bool)

(assert (=> b!45937 m!40519))

(declare-fun m!40521 () Bool)

(assert (=> b!45938 m!40521))

(declare-fun m!40523 () Bool)

(assert (=> d!8987 m!40523))

(assert (=> d!8987 m!40347))

(declare-fun m!40525 () Bool)

(assert (=> d!8987 m!40525))

(assert (=> b!45782 d!8987))

(declare-fun b!45945 () Bool)

(declare-fun e!29246 () Bool)

(declare-fun tp!6026 () Bool)

(assert (=> b!45945 (= e!29246 (and tp_is_empty!1941 tp!6026))))

(assert (=> b!45783 (= tp!6014 e!29246)))

(assert (= (and b!45783 ((_ is Cons!1223) (t!4252 l!812))) b!45945))

(check-sat (not d!8987) (not b!45937) (not b!45922) (not b!45932) (not b!45855) (not b!45915) (not b!45928) (not b!45945) (not b!45927) (not b!45923) (not d!8979) tp_is_empty!1941 (not b!45938) (not b!45853) (not b!45933) (not d!8981) (not d!8983) (not b!45920) (not d!8955) (not d!8985) (not b!45916))
(check-sat)
