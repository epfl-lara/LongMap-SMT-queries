; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1940 () Bool)

(assert start!1940)

(declare-fun b!13081 () Bool)

(assert (=> b!13081 true))

(declare-fun b!13075 () Bool)

(declare-fun res!10357 () Bool)

(declare-fun e!7839 () Bool)

(assert (=> b!13075 (=> (not res!10357) (not e!7839))))

(declare-datatypes ((B!472 0))(
  ( (B!473 (val!334 Int)) )
))
(declare-datatypes ((tuple2!468 0))(
  ( (tuple2!469 (_1!234 (_ BitVec 64)) (_2!234 B!472)) )
))
(declare-datatypes ((List!389 0))(
  ( (Nil!386) (Cons!385 (h!951 tuple2!468) (t!2782 List!389)) )
))
(declare-fun l!522 () List!389)

(declare-fun isEmpty!76 (List!389) Bool)

(assert (=> b!13075 (= res!10357 (not (isEmpty!76 l!522)))))

(declare-fun b!13076 () Bool)

(declare-fun res!10358 () Bool)

(declare-fun e!7840 () Bool)

(assert (=> b!13076 (=> (not res!10358) (not e!7840))))

(declare-fun value!159 () B!472)

(get-info :version)

(assert (=> b!13076 (= res!10358 (and ((_ is Cons!385) l!522) (= (_2!234 (h!951 l!522)) value!159)))))

(declare-fun res!10355 () Bool)

(assert (=> start!1940 (=> (not res!10355) (not e!7840))))

(declare-fun isStrictlySorted!76 (List!389) Bool)

(assert (=> start!1940 (= res!10355 (isStrictlySorted!76 l!522))))

(assert (=> start!1940 e!7840))

(declare-fun e!7841 () Bool)

(assert (=> start!1940 e!7841))

(declare-fun tp_is_empty!651 () Bool)

(assert (=> start!1940 tp_is_empty!651))

(declare-fun b!13077 () Bool)

(declare-fun lt!3486 () List!389)

(assert (=> b!13077 (= e!7839 (= lt!3486 Nil!386))))

(declare-fun b!13078 () Bool)

(assert (=> b!13078 (= e!7840 e!7839)))

(declare-fun res!10360 () Bool)

(assert (=> b!13078 (=> (not res!10360) (not e!7839))))

(assert (=> b!13078 (= res!10360 (isStrictlySorted!76 lt!3486))))

(declare-fun $colon$colon!10 (List!389 tuple2!468) List!389)

(declare-fun filterByValue!2 (List!389 B!472) List!389)

(assert (=> b!13078 (= lt!3486 ($colon$colon!10 (filterByValue!2 (t!2782 l!522) value!159) (h!951 l!522)))))

(declare-fun b!13079 () Bool)

(declare-fun tp!2144 () Bool)

(assert (=> b!13079 (= e!7841 (and tp_is_empty!651 tp!2144))))

(declare-fun b!13080 () Bool)

(declare-fun res!10356 () Bool)

(assert (=> b!13080 (=> (not res!10356) (not e!7839))))

(assert (=> b!13080 (= res!10356 (not (isEmpty!76 lt!3486)))))

(declare-fun res!10359 () Bool)

(assert (=> b!13081 (=> (not res!10359) (not e!7839))))

(declare-fun lambda!47 () Int)

(declare-fun forall!69 (List!389 Int) Bool)

(assert (=> b!13081 (= res!10359 (forall!69 lt!3486 lambda!47))))

(assert (= (and start!1940 res!10355) b!13076))

(assert (= (and b!13076 res!10358) b!13078))

(assert (= (and b!13078 res!10360) b!13081))

(assert (= (and b!13081 res!10359) b!13075))

(assert (= (and b!13075 res!10357) b!13080))

(assert (= (and b!13080 res!10356) b!13077))

(assert (= (and start!1940 ((_ is Cons!385) l!522)) b!13079))

(declare-fun m!8941 () Bool)

(assert (=> b!13080 m!8941))

(declare-fun m!8943 () Bool)

(assert (=> start!1940 m!8943))

(declare-fun m!8945 () Bool)

(assert (=> b!13075 m!8945))

(declare-fun m!8947 () Bool)

(assert (=> b!13078 m!8947))

(declare-fun m!8949 () Bool)

(assert (=> b!13078 m!8949))

(assert (=> b!13078 m!8949))

(declare-fun m!8951 () Bool)

(assert (=> b!13078 m!8951))

(declare-fun m!8953 () Bool)

(assert (=> b!13081 m!8953))

(check-sat (not b!13079) (not b!13075) tp_is_empty!651 (not b!13080) (not start!1940) (not b!13078) (not b!13081))
(check-sat)
(get-model)

(declare-fun d!1949 () Bool)

(assert (=> d!1949 (= (isEmpty!76 l!522) ((_ is Nil!386) l!522))))

(assert (=> b!13075 d!1949))

(declare-fun d!1954 () Bool)

(declare-fun res!10395 () Bool)

(declare-fun e!7867 () Bool)

(assert (=> d!1954 (=> res!10395 e!7867)))

(assert (=> d!1954 (= res!10395 (or ((_ is Nil!386) l!522) ((_ is Nil!386) (t!2782 l!522))))))

(assert (=> d!1954 (= (isStrictlySorted!76 l!522) e!7867)))

(declare-fun b!13123 () Bool)

(declare-fun e!7868 () Bool)

(assert (=> b!13123 (= e!7867 e!7868)))

(declare-fun res!10396 () Bool)

(assert (=> b!13123 (=> (not res!10396) (not e!7868))))

(assert (=> b!13123 (= res!10396 (bvslt (_1!234 (h!951 l!522)) (_1!234 (h!951 (t!2782 l!522)))))))

(declare-fun b!13124 () Bool)

(assert (=> b!13124 (= e!7868 (isStrictlySorted!76 (t!2782 l!522)))))

(assert (= (and d!1954 (not res!10395)) b!13123))

(assert (= (and b!13123 res!10396) b!13124))

(declare-fun m!8977 () Bool)

(assert (=> b!13124 m!8977))

(assert (=> start!1940 d!1954))

(declare-fun d!1961 () Bool)

(assert (=> d!1961 (= (isEmpty!76 lt!3486) ((_ is Nil!386) lt!3486))))

(assert (=> b!13080 d!1961))

(declare-fun d!1965 () Bool)

(declare-fun res!10409 () Bool)

(declare-fun e!7881 () Bool)

(assert (=> d!1965 (=> res!10409 e!7881)))

(assert (=> d!1965 (= res!10409 ((_ is Nil!386) lt!3486))))

(assert (=> d!1965 (= (forall!69 lt!3486 lambda!47) e!7881)))

(declare-fun b!13137 () Bool)

(declare-fun e!7883 () Bool)

(assert (=> b!13137 (= e!7881 e!7883)))

(declare-fun res!10411 () Bool)

(assert (=> b!13137 (=> (not res!10411) (not e!7883))))

(declare-fun dynLambda!84 (Int tuple2!468) Bool)

(assert (=> b!13137 (= res!10411 (dynLambda!84 lambda!47 (h!951 lt!3486)))))

(declare-fun b!13138 () Bool)

(assert (=> b!13138 (= e!7883 (forall!69 (t!2782 lt!3486) lambda!47))))

(assert (= (and d!1965 (not res!10409)) b!13137))

(assert (= (and b!13137 res!10411) b!13138))

(declare-fun b_lambda!867 () Bool)

(assert (=> (not b_lambda!867) (not b!13137)))

(declare-fun m!8981 () Bool)

(assert (=> b!13137 m!8981))

(declare-fun m!8983 () Bool)

(assert (=> b!13138 m!8983))

(assert (=> b!13081 d!1965))

(declare-fun d!1973 () Bool)

(declare-fun res!10417 () Bool)

(declare-fun e!7889 () Bool)

(assert (=> d!1973 (=> res!10417 e!7889)))

(assert (=> d!1973 (= res!10417 (or ((_ is Nil!386) lt!3486) ((_ is Nil!386) (t!2782 lt!3486))))))

(assert (=> d!1973 (= (isStrictlySorted!76 lt!3486) e!7889)))

(declare-fun b!13145 () Bool)

(declare-fun e!7890 () Bool)

(assert (=> b!13145 (= e!7889 e!7890)))

(declare-fun res!10418 () Bool)

(assert (=> b!13145 (=> (not res!10418) (not e!7890))))

(assert (=> b!13145 (= res!10418 (bvslt (_1!234 (h!951 lt!3486)) (_1!234 (h!951 (t!2782 lt!3486)))))))

(declare-fun b!13146 () Bool)

(assert (=> b!13146 (= e!7890 (isStrictlySorted!76 (t!2782 lt!3486)))))

(assert (= (and d!1973 (not res!10417)) b!13145))

(assert (= (and b!13145 res!10418) b!13146))

(declare-fun m!8989 () Bool)

(assert (=> b!13146 m!8989))

(assert (=> b!13078 d!1973))

(declare-fun d!1979 () Bool)

(assert (=> d!1979 (= ($colon$colon!10 (filterByValue!2 (t!2782 l!522) value!159) (h!951 l!522)) (Cons!385 (h!951 l!522) (filterByValue!2 (t!2782 l!522) value!159)))))

(assert (=> b!13078 d!1979))

(declare-fun bs!511 () Bool)

(declare-fun b!13216 () Bool)

(assert (= bs!511 (and b!13216 b!13081)))

(declare-fun lambda!57 () Int)

(assert (=> bs!511 (= lambda!57 lambda!47)))

(assert (=> b!13216 true))

(declare-fun b!13212 () Bool)

(declare-fun e!7929 () List!389)

(declare-fun e!7928 () List!389)

(assert (=> b!13212 (= e!7929 e!7928)))

(declare-fun c!1238 () Bool)

(assert (=> b!13212 (= c!1238 (and ((_ is Cons!385) (t!2782 l!522)) (not (= (_2!234 (h!951 (t!2782 l!522))) value!159))))))

(declare-fun b!13213 () Bool)

(declare-fun e!7932 () Bool)

(declare-fun call!363 () Bool)

(assert (=> b!13213 (= e!7932 call!363)))

(declare-fun b!13214 () Bool)

(declare-fun call!362 () List!389)

(assert (=> b!13214 (= e!7929 ($colon$colon!10 call!362 (h!951 (t!2782 l!522))))))

(declare-fun b!13215 () Bool)

(declare-fun e!7931 () Bool)

(declare-fun lt!3497 () List!389)

(declare-fun head!782 (List!389) tuple2!468)

(assert (=> b!13215 (= e!7931 (bvsge (_1!234 (head!782 lt!3497)) (_1!234 (head!782 (t!2782 l!522)))))))

(declare-fun d!1985 () Bool)

(declare-fun e!7930 () Bool)

(assert (=> d!1985 e!7930))

(declare-fun res!10442 () Bool)

(assert (=> d!1985 (=> (not res!10442) (not e!7930))))

(assert (=> d!1985 (= res!10442 (isStrictlySorted!76 lt!3497))))

(assert (=> d!1985 (= lt!3497 e!7929)))

(declare-fun c!1237 () Bool)

(assert (=> d!1985 (= c!1237 (and ((_ is Cons!385) (t!2782 l!522)) (= (_2!234 (h!951 (t!2782 l!522))) value!159)))))

(assert (=> d!1985 (isStrictlySorted!76 (t!2782 l!522))))

(assert (=> d!1985 (= (filterByValue!2 (t!2782 l!522) value!159) lt!3497)))

(declare-fun res!10444 () Bool)

(assert (=> b!13216 (=> (not res!10444) (not e!7930))))

(assert (=> b!13216 (= res!10444 (forall!69 lt!3497 lambda!57))))

(declare-fun bm!359 () Bool)

(assert (=> bm!359 (= call!363 (isEmpty!76 lt!3497))))

(declare-fun bm!360 () Bool)

(assert (=> bm!360 (= call!362 (filterByValue!2 (t!2782 (t!2782 l!522)) value!159))))

(declare-fun b!13217 () Bool)

(assert (=> b!13217 (= e!7928 call!362)))

(declare-fun b!13218 () Bool)

(assert (=> b!13218 (= e!7928 Nil!386)))

(declare-fun b!13219 () Bool)

(assert (=> b!13219 (= e!7932 e!7931)))

(declare-fun res!10443 () Bool)

(assert (=> b!13219 (= res!10443 call!363)))

(assert (=> b!13219 (=> res!10443 e!7931)))

(declare-fun b!13220 () Bool)

(assert (=> b!13220 (= e!7930 e!7932)))

(declare-fun c!1236 () Bool)

(assert (=> b!13220 (= c!1236 (isEmpty!76 (t!2782 l!522)))))

(assert (= (and d!1985 c!1237) b!13214))

(assert (= (and d!1985 (not c!1237)) b!13212))

(assert (= (and b!13212 c!1238) b!13217))

(assert (= (and b!13212 (not c!1238)) b!13218))

(assert (= (or b!13214 b!13217) bm!360))

(assert (= (and d!1985 res!10442) b!13216))

(assert (= (and b!13216 res!10444) b!13220))

(assert (= (and b!13220 c!1236) b!13213))

(assert (= (and b!13220 (not c!1236)) b!13219))

(assert (= (and b!13219 (not res!10443)) b!13215))

(assert (= (or b!13213 b!13219) bm!359))

(declare-fun m!8997 () Bool)

(assert (=> b!13220 m!8997))

(declare-fun m!9003 () Bool)

(assert (=> b!13215 m!9003))

(declare-fun m!9009 () Bool)

(assert (=> b!13215 m!9009))

(declare-fun m!9015 () Bool)

(assert (=> bm!360 m!9015))

(declare-fun m!9021 () Bool)

(assert (=> b!13216 m!9021))

(declare-fun m!9027 () Bool)

(assert (=> bm!359 m!9027))

(declare-fun m!9031 () Bool)

(assert (=> b!13214 m!9031))

(declare-fun m!9035 () Bool)

(assert (=> d!1985 m!9035))

(assert (=> d!1985 m!8977))

(assert (=> b!13078 d!1985))

(declare-fun b!13244 () Bool)

(declare-fun e!7946 () Bool)

(declare-fun tp!2156 () Bool)

(assert (=> b!13244 (= e!7946 (and tp_is_empty!651 tp!2156))))

(assert (=> b!13079 (= tp!2144 e!7946)))

(assert (= (and b!13079 ((_ is Cons!385) (t!2782 l!522))) b!13244))

(declare-fun b_lambda!873 () Bool)

(assert (= b_lambda!867 (or b!13081 b_lambda!873)))

(declare-fun bs!513 () Bool)

(declare-fun d!1990 () Bool)

(assert (= bs!513 (and d!1990 b!13081)))

(assert (=> bs!513 (= (dynLambda!84 lambda!47 (h!951 lt!3486)) (= (_2!234 (h!951 lt!3486)) value!159))))

(assert (=> b!13137 d!1990))

(check-sat (not b!13124) (not bm!359) (not b!13214) (not b_lambda!873) (not b!13146) (not b!13138) tp_is_empty!651 (not bm!360) (not b!13216) (not d!1985) (not b!13220) (not b!13244) (not b!13215))
(check-sat)
