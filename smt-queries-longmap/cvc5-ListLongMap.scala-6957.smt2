; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87798 () Bool)

(assert start!87798)

(declare-fun b!1014922 () Bool)

(assert (=> b!1014922 true))

(assert (=> b!1014922 true))

(declare-fun b!1014919 () Bool)

(declare-datatypes ((Unit!33197 0))(
  ( (Unit!33198) )
))
(declare-fun e!570942 () Unit!33197)

(declare-fun Unit!33199 () Unit!33197)

(assert (=> b!1014919 (= e!570942 Unit!33199)))

(declare-fun b!1014920 () Bool)

(declare-fun e!570943 () Bool)

(declare-fun tp_is_empty!23515 () Bool)

(declare-fun tp!70574 () Bool)

(assert (=> b!1014920 (= e!570943 (and tp_is_empty!23515 tp!70574))))

(declare-fun b!1014921 () Bool)

(declare-fun res!680927 () Bool)

(declare-fun e!570941 () Bool)

(assert (=> b!1014921 (=> (not res!680927) (not e!570941))))

(declare-datatypes ((B!1448 0))(
  ( (B!1449 (val!11808 Int)) )
))
(declare-datatypes ((tuple2!15162 0))(
  ( (tuple2!15163 (_1!7592 (_ BitVec 64)) (_2!7592 B!1448)) )
))
(declare-datatypes ((List!21448 0))(
  ( (Nil!21445) (Cons!21444 (h!22642 tuple2!15162) (t!30449 List!21448)) )
))
(declare-fun l!412 () List!21448)

(declare-fun value!115 () B!1448)

(assert (=> b!1014921 (= res!680927 (and (not (= (_2!7592 (h!22642 l!412)) value!115)) (is-Cons!21444 l!412)))))

(declare-fun lt!448855 () Unit!33197)

(assert (=> b!1014922 (= e!570942 lt!448855)))

(declare-datatypes ((List!21449 0))(
  ( (Nil!21446) (Cons!21445 (h!22643 (_ BitVec 64)) (t!30450 List!21449)) )
))
(declare-fun lt!448856 () List!21449)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!41 (List!21448 List!21449 B!1448 tuple2!15162) Unit!33197)

(assert (=> b!1014922 (= lt!448855 (lemmaForallGetValueByKeySameWithASmallerHead!41 (t!30449 l!412) lt!448856 value!115 (h!22642 l!412)))))

(declare-fun lambda!776 () Int)

(declare-fun forall!247 (List!21449 Int) Bool)

(assert (=> b!1014922 (forall!247 lt!448856 lambda!776)))

(declare-fun res!680928 () Bool)

(assert (=> start!87798 (=> (not res!680928) (not e!570941))))

(declare-fun isStrictlySorted!582 (List!21448) Bool)

(assert (=> start!87798 (= res!680928 (isStrictlySorted!582 l!412))))

(assert (=> start!87798 e!570941))

(assert (=> start!87798 e!570943))

(assert (=> start!87798 tp_is_empty!23515))

(declare-fun b!1014923 () Bool)

(declare-fun ListPrimitiveSize!118 (List!21448) Int)

(assert (=> b!1014923 (= e!570941 (>= (ListPrimitiveSize!118 (t!30449 l!412)) (ListPrimitiveSize!118 l!412)))))

(declare-fun lt!448857 () Unit!33197)

(assert (=> b!1014923 (= lt!448857 e!570942)))

(declare-fun c!102792 () Bool)

(declare-fun isEmpty!845 (List!21449) Bool)

(assert (=> b!1014923 (= c!102792 (not (isEmpty!845 lt!448856)))))

(declare-fun getKeysOf!55 (List!21448 B!1448) List!21449)

(assert (=> b!1014923 (= lt!448856 (getKeysOf!55 (t!30449 l!412) value!115))))

(assert (= (and start!87798 res!680928) b!1014921))

(assert (= (and b!1014921 res!680927) b!1014923))

(assert (= (and b!1014923 c!102792) b!1014922))

(assert (= (and b!1014923 (not c!102792)) b!1014919))

(assert (= (and start!87798 (is-Cons!21444 l!412)) b!1014920))

(declare-fun m!937245 () Bool)

(assert (=> b!1014922 m!937245))

(declare-fun m!937247 () Bool)

(assert (=> b!1014922 m!937247))

(declare-fun m!937249 () Bool)

(assert (=> start!87798 m!937249))

(declare-fun m!937251 () Bool)

(assert (=> b!1014923 m!937251))

(declare-fun m!937253 () Bool)

(assert (=> b!1014923 m!937253))

(declare-fun m!937255 () Bool)

(assert (=> b!1014923 m!937255))

(declare-fun m!937257 () Bool)

(assert (=> b!1014923 m!937257))

(push 1)

(assert tp_is_empty!23515)

(assert (not b!1014922))

(assert (not b!1014923))

(assert (not b!1014920))

(assert (not start!87798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120863 () Bool)

(declare-fun res!680945 () Bool)

(declare-fun e!570970 () Bool)

(assert (=> d!120863 (=> res!680945 e!570970)))

(assert (=> d!120863 (= res!680945 (or (is-Nil!21445 l!412) (is-Nil!21445 (t!30449 l!412))))))

(assert (=> d!120863 (= (isStrictlySorted!582 l!412) e!570970)))

(declare-fun b!1014978 () Bool)

(declare-fun e!570971 () Bool)

(assert (=> b!1014978 (= e!570970 e!570971)))

(declare-fun res!680946 () Bool)

(assert (=> b!1014978 (=> (not res!680946) (not e!570971))))

(assert (=> b!1014978 (= res!680946 (bvslt (_1!7592 (h!22642 l!412)) (_1!7592 (h!22642 (t!30449 l!412)))))))

(declare-fun b!1014979 () Bool)

(assert (=> b!1014979 (= e!570971 (isStrictlySorted!582 (t!30449 l!412)))))

(assert (= (and d!120863 (not res!680945)) b!1014978))

(assert (= (and b!1014978 res!680946) b!1014979))

(declare-fun m!937289 () Bool)

(assert (=> b!1014979 m!937289))

(assert (=> start!87798 d!120863))

(declare-fun bs!29313 () Bool)

(declare-fun b!1014987 () Bool)

(assert (= bs!29313 (and b!1014987 b!1014922)))

(declare-fun lambda!787 () Int)

(assert (=> bs!29313 (= (= (t!30449 l!412) l!412) (= lambda!787 lambda!776))))

(assert (=> b!1014987 true))

(assert (=> b!1014987 true))

(declare-fun bs!29314 () Bool)

(declare-fun d!120867 () Bool)

(assert (= bs!29314 (and d!120867 b!1014922)))

(declare-fun lambda!788 () Int)

(assert (=> bs!29314 (= (= (Cons!21444 (h!22642 l!412) (t!30449 l!412)) l!412) (= lambda!788 lambda!776))))

(declare-fun bs!29315 () Bool)

(assert (= bs!29315 (and d!120867 b!1014987)))

(assert (=> bs!29315 (= (= (Cons!21444 (h!22642 l!412) (t!30449 l!412)) (t!30449 l!412)) (= lambda!788 lambda!787))))

(assert (=> d!120867 true))

(assert (=> d!120867 true))

(assert (=> d!120867 true))

(assert (=> d!120867 (forall!247 lt!448856 lambda!788)))

(declare-fun lt!448882 () Unit!33197)

(declare-fun choose!1635 (List!21448 List!21449 B!1448 tuple2!15162) Unit!33197)

(assert (=> d!120867 (= lt!448882 (choose!1635 (t!30449 l!412) lt!448856 value!115 (h!22642 l!412)))))

(declare-fun e!570974 () Bool)

(assert (=> d!120867 e!570974))

(declare-fun res!680955 () Bool)

(assert (=> d!120867 (=> (not res!680955) (not e!570974))))

(assert (=> d!120867 (= res!680955 (isStrictlySorted!582 (t!30449 l!412)))))

(assert (=> d!120867 (= (lemmaForallGetValueByKeySameWithASmallerHead!41 (t!30449 l!412) lt!448856 value!115 (h!22642 l!412)) lt!448882)))

(declare-fun b!1014986 () Bool)

(declare-fun res!680954 () Bool)

(assert (=> b!1014986 (=> (not res!680954) (not e!570974))))

(declare-fun isEmpty!848 (List!21448) Bool)

(assert (=> b!1014986 (= res!680954 (not (isEmpty!848 (t!30449 l!412))))))

(declare-fun res!680953 () Bool)

(assert (=> b!1014987 (=> (not res!680953) (not e!570974))))

(assert (=> b!1014987 (= res!680953 (forall!247 lt!448856 lambda!787))))

(declare-fun b!1014988 () Bool)

(declare-fun head!944 (List!21448) tuple2!15162)

(assert (=> b!1014988 (= e!570974 (bvslt (_1!7592 (h!22642 l!412)) (_1!7592 (head!944 (t!30449 l!412)))))))

(assert (= (and d!120867 res!680955) b!1014986))

(assert (= (and b!1014986 res!680954) b!1014987))

(assert (= (and b!1014987 res!680953) b!1014988))

(declare-fun m!937291 () Bool)

(assert (=> d!120867 m!937291))

(declare-fun m!937293 () Bool)

(assert (=> d!120867 m!937293))

(assert (=> d!120867 m!937289))

(declare-fun m!937295 () Bool)

(assert (=> b!1014986 m!937295))

(declare-fun m!937297 () Bool)

(assert (=> b!1014987 m!937297))

(declare-fun m!937299 () Bool)

(assert (=> b!1014988 m!937299))

(assert (=> b!1014922 d!120867))

(declare-fun d!120871 () Bool)

(declare-fun res!680960 () Bool)

(declare-fun e!570981 () Bool)

(assert (=> d!120871 (=> res!680960 e!570981)))

(assert (=> d!120871 (= res!680960 (is-Nil!21446 lt!448856))))

(assert (=> d!120871 (= (forall!247 lt!448856 lambda!776) e!570981)))

(declare-fun b!1014999 () Bool)

(declare-fun e!570982 () Bool)

(assert (=> b!1014999 (= e!570981 e!570982)))

(declare-fun res!680961 () Bool)

(assert (=> b!1014999 (=> (not res!680961) (not e!570982))))

(declare-fun dynLambda!1894 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014999 (= res!680961 (dynLambda!1894 lambda!776 (h!22643 lt!448856)))))

(declare-fun b!1015000 () Bool)

(assert (=> b!1015000 (= e!570982 (forall!247 (t!30450 lt!448856) lambda!776))))

(assert (= (and d!120871 (not res!680960)) b!1014999))

(assert (= (and b!1014999 res!680961) b!1015000))

(declare-fun b_lambda!15379 () Bool)

(assert (=> (not b_lambda!15379) (not b!1014999)))

(declare-fun m!937301 () Bool)

(assert (=> b!1014999 m!937301))

(declare-fun m!937303 () Bool)

(assert (=> b!1015000 m!937303))

(assert (=> b!1014922 d!120871))

(declare-fun d!120873 () Bool)

(declare-fun lt!448901 () Int)

(assert (=> d!120873 (>= lt!448901 0)))

(declare-fun e!570991 () Int)

(assert (=> d!120873 (= lt!448901 e!570991)))

(declare-fun c!102813 () Bool)

(assert (=> d!120873 (= c!102813 (is-Nil!21445 (t!30449 l!412)))))

(assert (=> d!120873 (= (ListPrimitiveSize!118 (t!30449 l!412)) lt!448901)))

(declare-fun b!1015017 () Bool)

(assert (=> b!1015017 (= e!570991 0)))

(declare-fun b!1015018 () Bool)

(assert (=> b!1015018 (= e!570991 (+ 1 (ListPrimitiveSize!118 (t!30449 (t!30449 l!412)))))))

(assert (= (and d!120873 c!102813) b!1015017))

(assert (= (and d!120873 (not c!102813)) b!1015018))

(declare-fun m!937307 () Bool)

(assert (=> b!1015018 m!937307))

(assert (=> b!1014923 d!120873))

(declare-fun d!120877 () Bool)

(declare-fun lt!448902 () Int)

(assert (=> d!120877 (>= lt!448902 0)))

(declare-fun e!570992 () Int)

(assert (=> d!120877 (= lt!448902 e!570992)))

(declare-fun c!102814 () Bool)

(assert (=> d!120877 (= c!102814 (is-Nil!21445 l!412))))

(assert (=> d!120877 (= (ListPrimitiveSize!118 l!412) lt!448902)))

(declare-fun b!1015019 () Bool)

(assert (=> b!1015019 (= e!570992 0)))

(declare-fun b!1015020 () Bool)

(assert (=> b!1015020 (= e!570992 (+ 1 (ListPrimitiveSize!118 (t!30449 l!412))))))

(assert (= (and d!120877 c!102814) b!1015019))

(assert (= (and d!120877 (not c!102814)) b!1015020))

(assert (=> b!1015020 m!937251))

(assert (=> b!1014923 d!120877))

(declare-fun d!120881 () Bool)

(assert (=> d!120881 (= (isEmpty!845 lt!448856) (is-Nil!21446 lt!448856))))

(assert (=> b!1014923 d!120881))

(declare-fun bs!29331 () Bool)

(declare-fun b!1015093 () Bool)

(assert (= bs!29331 (and b!1015093 b!1014922)))

(declare-fun lambda!814 () Int)

(declare-fun lt!448979 () List!21448)

(declare-fun lt!448989 () tuple2!15162)

(assert (=> bs!29331 (= (= (Cons!21444 lt!448989 lt!448979) l!412) (= lambda!814 lambda!776))))

(declare-fun bs!29332 () Bool)

(assert (= bs!29332 (and b!1015093 b!1014987)))

(assert (=> bs!29332 (= (= (Cons!21444 lt!448989 lt!448979) (t!30449 l!412)) (= lambda!814 lambda!787))))

(declare-fun bs!29333 () Bool)

(assert (= bs!29333 (and b!1015093 d!120867)))

(assert (=> bs!29333 (= (= (Cons!21444 lt!448989 lt!448979) (Cons!21444 (h!22642 l!412) (t!30449 l!412))) (= lambda!814 lambda!788))))

(assert (=> b!1015093 true))

(assert (=> b!1015093 true))

(assert (=> b!1015093 true))

(declare-fun bs!29334 () Bool)

(declare-fun b!1015086 () Bool)

(assert (= bs!29334 (and b!1015086 b!1014922)))

(declare-fun lt!448988 () List!21448)

(declare-fun lambda!815 () Int)

(declare-fun lt!448986 () tuple2!15162)

(assert (=> bs!29334 (= (= (Cons!21444 lt!448986 lt!448988) l!412) (= lambda!815 lambda!776))))

(declare-fun bs!29335 () Bool)

(assert (= bs!29335 (and b!1015086 b!1014987)))

(assert (=> bs!29335 (= (= (Cons!21444 lt!448986 lt!448988) (t!30449 l!412)) (= lambda!815 lambda!787))))

(declare-fun bs!29336 () Bool)

(assert (= bs!29336 (and b!1015086 d!120867)))

(assert (=> bs!29336 (= (= (Cons!21444 lt!448986 lt!448988) (Cons!21444 (h!22642 l!412) (t!30449 l!412))) (= lambda!815 lambda!788))))

(declare-fun bs!29337 () Bool)

(assert (= bs!29337 (and b!1015086 b!1015093)))

(assert (=> bs!29337 (= (= (Cons!21444 lt!448986 lt!448988) (Cons!21444 lt!448989 lt!448979)) (= lambda!815 lambda!814))))

(assert (=> b!1015086 true))

(assert (=> b!1015086 true))

(assert (=> b!1015086 true))

(declare-fun bs!29338 () Bool)

(declare-fun d!120883 () Bool)

(assert (= bs!29338 (and d!120883 d!120867)))

(declare-fun lambda!816 () Int)

(assert (=> bs!29338 (= (= (t!30449 l!412) (Cons!21444 (h!22642 l!412) (t!30449 l!412))) (= lambda!816 lambda!788))))

(declare-fun bs!29339 () Bool)

(assert (= bs!29339 (and d!120883 b!1015093)))

(assert (=> bs!29339 (= (= (t!30449 l!412) (Cons!21444 lt!448989 lt!448979)) (= lambda!816 lambda!814))))

(declare-fun bs!29340 () Bool)

(assert (= bs!29340 (and d!120883 b!1014922)))

(assert (=> bs!29340 (= (= (t!30449 l!412) l!412) (= lambda!816 lambda!776))))

(declare-fun bs!29341 () Bool)

(assert (= bs!29341 (and d!120883 b!1015086)))

(assert (=> bs!29341 (= (= (t!30449 l!412) (Cons!21444 lt!448986 lt!448988)) (= lambda!816 lambda!815))))

(declare-fun bs!29342 () Bool)

(assert (= bs!29342 (and d!120883 b!1014987)))

(assert (=> bs!29342 (= lambda!816 lambda!787)))

(assert (=> d!120883 true))

(assert (=> d!120883 true))

(declare-fun bm!42903 () Bool)

(declare-fun call!42907 () List!21449)

(assert (=> bm!42903 (= call!42907 (getKeysOf!55 (t!30449 (t!30449 l!412)) value!115))))

(declare-fun call!42906 () Bool)

(declare-fun bm!42904 () Bool)

(declare-fun lt!448985 () List!21449)

(declare-fun c!102842 () Bool)

(declare-fun lt!448980 () List!21449)

(assert (=> bm!42904 (= call!42906 (forall!247 (ite c!102842 lt!448985 lt!448980) (ite c!102842 lambda!814 lambda!815)))))

(declare-fun e!571026 () Unit!33197)

(declare-fun lt!448987 () Unit!33197)

(assert (=> b!1015086 (= e!571026 lt!448987)))

(assert (=> b!1015086 (= lt!448988 (t!30449 (t!30449 l!412)))))

(assert (=> b!1015086 (= lt!448980 call!42907)))

(assert (=> b!1015086 (= lt!448986 (h!22642 (t!30449 l!412)))))

(declare-fun call!42909 () Unit!33197)

(assert (=> b!1015086 (= lt!448987 call!42909)))

(assert (=> b!1015086 call!42906))

(declare-fun b!1015087 () Bool)

(declare-fun e!571028 () Unit!33197)

(declare-fun Unit!33208 () Unit!33197)

(assert (=> b!1015087 (= e!571028 Unit!33208)))

(declare-fun b!1015088 () Bool)

(declare-fun Unit!33209 () Unit!33197)

(assert (=> b!1015088 (= e!571026 Unit!33209)))

(declare-fun b!1015089 () Bool)

(declare-fun e!571027 () List!21449)

(assert (=> b!1015089 (= e!571027 (Cons!21445 (_1!7592 (h!22642 (t!30449 l!412))) call!42907))))

(declare-fun c!102840 () Bool)

(declare-fun call!42908 () Bool)

(assert (=> b!1015089 (= c!102840 (not call!42908))))

(declare-fun lt!448982 () Unit!33197)

(assert (=> b!1015089 (= lt!448982 e!571028)))

(declare-fun b!1015091 () Bool)

(declare-fun e!571029 () List!21449)

(assert (=> b!1015091 (= e!571027 e!571029)))

(declare-fun c!102841 () Bool)

(assert (=> b!1015091 (= c!102841 (and (is-Cons!21444 (t!30449 l!412)) (not (= (_2!7592 (h!22642 (t!30449 l!412))) value!115))))))

(declare-fun b!1015092 () Bool)

(assert (=> b!1015092 (= e!571029 Nil!21446)))

(declare-fun bm!42905 () Bool)

(assert (=> bm!42905 (= call!42908 (isEmpty!845 call!42907))))

(assert (=> b!1015093 call!42906))

(declare-fun lt!448984 () Unit!33197)

(assert (=> b!1015093 (= lt!448984 call!42909)))

(assert (=> b!1015093 (= lt!448989 (h!22642 (t!30449 l!412)))))

(assert (=> b!1015093 (= lt!448985 call!42907)))

(assert (=> b!1015093 (= lt!448979 (t!30449 (t!30449 l!412)))))

(assert (=> b!1015093 (= e!571028 lt!448984)))

(declare-fun bm!42906 () Bool)

(assert (=> bm!42906 (= call!42909 (lemmaForallGetValueByKeySameWithASmallerHead!41 (ite c!102842 lt!448979 lt!448988) (ite c!102842 lt!448985 lt!448980) value!115 (ite c!102842 lt!448989 lt!448986)))))

(declare-fun lt!448983 () List!21449)

(assert (=> d!120883 (forall!247 lt!448983 lambda!816)))

(assert (=> d!120883 (= lt!448983 e!571027)))

(assert (=> d!120883 (= c!102842 (and (is-Cons!21444 (t!30449 l!412)) (= (_2!7592 (h!22642 (t!30449 l!412))) value!115)))))

(assert (=> d!120883 (isStrictlySorted!582 (t!30449 l!412))))

(assert (=> d!120883 (= (getKeysOf!55 (t!30449 l!412) value!115) lt!448983)))

(declare-fun b!1015090 () Bool)

(declare-fun lt!448978 () Unit!33197)

(assert (=> b!1015090 (= lt!448978 e!571026)))

(declare-fun c!102839 () Bool)

(assert (=> b!1015090 (= c!102839 (not call!42908))))

(declare-fun lt!448981 () List!21449)

(assert (=> b!1015090 (= lt!448981 call!42907)))

(assert (=> b!1015090 (= e!571029 call!42907)))

(assert (= (and d!120883 c!102842) b!1015089))

(assert (= (and d!120883 (not c!102842)) b!1015091))

(assert (= (and b!1015089 c!102840) b!1015093))

(assert (= (and b!1015089 (not c!102840)) b!1015087))

(assert (= (and b!1015091 c!102841) b!1015090))

(assert (= (and b!1015091 (not c!102841)) b!1015092))

(assert (= (and b!1015090 c!102839) b!1015086))

(assert (= (and b!1015090 (not c!102839)) b!1015088))

(assert (= (or b!1015093 b!1015086) bm!42906))

(assert (= (or b!1015093 b!1015086) bm!42904))

(assert (= (or b!1015089 b!1015093 b!1015086 b!1015090) bm!42903))

(assert (= (or b!1015089 b!1015090) bm!42905))

(declare-fun m!937335 () Bool)

(assert (=> d!120883 m!937335))

(assert (=> d!120883 m!937289))

(declare-fun m!937337 () Bool)

(assert (=> bm!42905 m!937337))

(declare-fun m!937339 () Bool)

(assert (=> bm!42906 m!937339))

(declare-fun m!937341 () Bool)

(assert (=> bm!42904 m!937341))

(declare-fun m!937343 () Bool)

(assert (=> bm!42903 m!937343))

(assert (=> b!1014923 d!120883))

(declare-fun b!1015109 () Bool)

(declare-fun e!571041 () Bool)

(declare-fun tp!70586 () Bool)

(assert (=> b!1015109 (= e!571041 (and tp_is_empty!23515 tp!70586))))

(assert (=> b!1014920 (= tp!70574 e!571041)))

(assert (= (and b!1014920 (is-Cons!21444 (t!30449 l!412))) b!1015109))

(declare-fun b_lambda!15385 () Bool)

(assert (= b_lambda!15379 (or b!1014922 b_lambda!15385)))

(declare-fun bs!29344 () Bool)

(declare-fun d!120895 () Bool)

(assert (= bs!29344 (and d!120895 b!1014922)))

(declare-datatypes ((Option!579 0))(
  ( (Some!578 (v!14429 B!1448)) (None!577) )
))
(declare-fun getValueByKey!528 (List!21448 (_ BitVec 64)) Option!579)

(assert (=> bs!29344 (= (dynLambda!1894 lambda!776 (h!22643 lt!448856)) (= (getValueByKey!528 l!412 (h!22643 lt!448856)) (Some!578 value!115)))))

(declare-fun m!937347 () Bool)

(assert (=> bs!29344 m!937347))

(assert (=> b!1014999 d!120895))

(push 1)

(assert (not b!1014986))

