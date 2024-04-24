; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1938 () Bool)

(assert start!1938)

(declare-fun b!13052 () Bool)

(assert (=> b!13052 true))

(declare-fun b!13046 () Bool)

(declare-fun res!10335 () Bool)

(declare-fun e!7826 () Bool)

(assert (=> b!13046 (=> (not res!10335) (not e!7826))))

(declare-datatypes ((B!470 0))(
  ( (B!471 (val!333 Int)) )
))
(declare-datatypes ((tuple2!462 0))(
  ( (tuple2!463 (_1!231 (_ BitVec 64)) (_2!231 B!470)) )
))
(declare-datatypes ((List!384 0))(
  ( (Nil!381) (Cons!380 (h!946 tuple2!462) (t!2777 List!384)) )
))
(declare-fun l!522 () List!384)

(declare-fun value!159 () B!470)

(get-info :version)

(assert (=> b!13046 (= res!10335 (and ((_ is Cons!380) l!522) (= (_2!231 (h!946 l!522)) value!159)))))

(declare-fun b!13047 () Bool)

(declare-fun e!7828 () Bool)

(declare-fun tp_is_empty!649 () Bool)

(declare-fun tp!2141 () Bool)

(assert (=> b!13047 (= e!7828 (and tp_is_empty!649 tp!2141))))

(declare-fun b!13048 () Bool)

(declare-fun e!7827 () Bool)

(declare-fun lt!3483 () List!384)

(assert (=> b!13048 (= e!7827 (= lt!3483 Nil!381))))

(declare-fun res!10340 () Bool)

(assert (=> start!1938 (=> (not res!10340) (not e!7826))))

(declare-fun isStrictlySorted!69 (List!384) Bool)

(assert (=> start!1938 (= res!10340 (isStrictlySorted!69 l!522))))

(assert (=> start!1938 e!7826))

(assert (=> start!1938 e!7828))

(assert (=> start!1938 tp_is_empty!649))

(declare-fun b!13049 () Bool)

(declare-fun res!10338 () Bool)

(assert (=> b!13049 (=> (not res!10338) (not e!7827))))

(declare-fun isEmpty!75 (List!384) Bool)

(assert (=> b!13049 (= res!10338 (not (isEmpty!75 l!522)))))

(declare-fun b!13050 () Bool)

(declare-fun res!10339 () Bool)

(assert (=> b!13050 (=> (not res!10339) (not e!7827))))

(assert (=> b!13050 (= res!10339 (not (isEmpty!75 lt!3483)))))

(declare-fun b!13051 () Bool)

(assert (=> b!13051 (= e!7826 e!7827)))

(declare-fun res!10337 () Bool)

(assert (=> b!13051 (=> (not res!10337) (not e!7827))))

(assert (=> b!13051 (= res!10337 (isStrictlySorted!69 lt!3483))))

(declare-fun $colon$colon!9 (List!384 tuple2!462) List!384)

(declare-fun filterByValue!1 (List!384 B!470) List!384)

(assert (=> b!13051 (= lt!3483 ($colon$colon!9 (filterByValue!1 (t!2777 l!522) value!159) (h!946 l!522)))))

(declare-fun res!10336 () Bool)

(assert (=> b!13052 (=> (not res!10336) (not e!7827))))

(declare-fun lambda!44 () Int)

(declare-fun forall!68 (List!384 Int) Bool)

(assert (=> b!13052 (= res!10336 (forall!68 lt!3483 lambda!44))))

(assert (= (and start!1938 res!10340) b!13046))

(assert (= (and b!13046 res!10335) b!13051))

(assert (= (and b!13051 res!10337) b!13052))

(assert (= (and b!13052 res!10336) b!13049))

(assert (= (and b!13049 res!10338) b!13050))

(assert (= (and b!13050 res!10339) b!13048))

(assert (= (and start!1938 ((_ is Cons!380) l!522)) b!13047))

(declare-fun m!8919 () Bool)

(assert (=> b!13052 m!8919))

(declare-fun m!8921 () Bool)

(assert (=> b!13049 m!8921))

(declare-fun m!8923 () Bool)

(assert (=> b!13051 m!8923))

(declare-fun m!8925 () Bool)

(assert (=> b!13051 m!8925))

(assert (=> b!13051 m!8925))

(declare-fun m!8927 () Bool)

(assert (=> b!13051 m!8927))

(declare-fun m!8929 () Bool)

(assert (=> start!1938 m!8929))

(declare-fun m!8931 () Bool)

(assert (=> b!13050 m!8931))

(check-sat (not b!13047) tp_is_empty!649 (not b!13049) (not b!13052) (not start!1938) (not b!13051) (not b!13050))
(check-sat)
(get-model)

(declare-fun d!1945 () Bool)

(declare-fun res!10385 () Bool)

(declare-fun e!7855 () Bool)

(assert (=> d!1945 (=> res!10385 e!7855)))

(assert (=> d!1945 (= res!10385 ((_ is Nil!381) lt!3483))))

(assert (=> d!1945 (= (forall!68 lt!3483 lambda!44) e!7855)))

(declare-fun b!13109 () Bool)

(declare-fun e!7857 () Bool)

(assert (=> b!13109 (= e!7855 e!7857)))

(declare-fun res!10387 () Bool)

(assert (=> b!13109 (=> (not res!10387) (not e!7857))))

(declare-fun dynLambda!82 (Int tuple2!462) Bool)

(assert (=> b!13109 (= res!10387 (dynLambda!82 lambda!44 (h!946 lt!3483)))))

(declare-fun b!13111 () Bool)

(assert (=> b!13111 (= e!7857 (forall!68 (t!2777 lt!3483) lambda!44))))

(assert (= (and d!1945 (not res!10385)) b!13109))

(assert (= (and b!13109 res!10387) b!13111))

(declare-fun b_lambda!865 () Bool)

(assert (=> (not b_lambda!865) (not b!13109)))

(declare-fun m!8962 () Bool)

(assert (=> b!13109 m!8962))

(declare-fun m!8966 () Bool)

(assert (=> b!13111 m!8966))

(assert (=> b!13052 d!1945))

(declare-fun d!1949 () Bool)

(assert (=> d!1949 (= (isEmpty!75 lt!3483) ((_ is Nil!381) lt!3483))))

(assert (=> b!13050 d!1949))

(declare-fun d!1953 () Bool)

(declare-fun res!10397 () Bool)

(declare-fun e!7867 () Bool)

(assert (=> d!1953 (=> res!10397 e!7867)))

(assert (=> d!1953 (= res!10397 (or ((_ is Nil!381) lt!3483) ((_ is Nil!381) (t!2777 lt!3483))))))

(assert (=> d!1953 (= (isStrictlySorted!69 lt!3483) e!7867)))

(declare-fun b!13121 () Bool)

(declare-fun e!7868 () Bool)

(assert (=> b!13121 (= e!7867 e!7868)))

(declare-fun res!10398 () Bool)

(assert (=> b!13121 (=> (not res!10398) (not e!7868))))

(assert (=> b!13121 (= res!10398 (bvslt (_1!231 (h!946 lt!3483)) (_1!231 (h!946 (t!2777 lt!3483)))))))

(declare-fun b!13122 () Bool)

(assert (=> b!13122 (= e!7868 (isStrictlySorted!69 (t!2777 lt!3483)))))

(assert (= (and d!1953 (not res!10397)) b!13121))

(assert (= (and b!13121 res!10398) b!13122))

(declare-fun m!8969 () Bool)

(assert (=> b!13122 m!8969))

(assert (=> b!13051 d!1953))

(declare-fun d!1955 () Bool)

(assert (=> d!1955 (= ($colon$colon!9 (filterByValue!1 (t!2777 l!522) value!159) (h!946 l!522)) (Cons!380 (h!946 l!522) (filterByValue!1 (t!2777 l!522) value!159)))))

(assert (=> b!13051 d!1955))

(declare-fun bs!510 () Bool)

(declare-fun b!13185 () Bool)

(assert (= bs!510 (and b!13185 b!13052)))

(declare-fun lambda!55 () Int)

(assert (=> bs!510 (= lambda!55 lambda!44)))

(assert (=> b!13185 true))

(declare-fun b!13184 () Bool)

(declare-fun e!7911 () List!384)

(assert (=> b!13184 (= e!7911 Nil!381)))

(declare-fun res!10432 () Bool)

(declare-fun e!7910 () Bool)

(assert (=> b!13185 (=> (not res!10432) (not e!7910))))

(declare-fun lt!3495 () List!384)

(assert (=> b!13185 (= res!10432 (forall!68 lt!3495 lambda!55))))

(declare-fun d!1962 () Bool)

(assert (=> d!1962 e!7910))

(declare-fun res!10431 () Bool)

(assert (=> d!1962 (=> (not res!10431) (not e!7910))))

(assert (=> d!1962 (= res!10431 (isStrictlySorted!69 lt!3495))))

(declare-fun e!7914 () List!384)

(assert (=> d!1962 (= lt!3495 e!7914)))

(declare-fun c!1230 () Bool)

(assert (=> d!1962 (= c!1230 (and ((_ is Cons!380) (t!2777 l!522)) (= (_2!231 (h!946 (t!2777 l!522))) value!159)))))

(assert (=> d!1962 (isStrictlySorted!69 (t!2777 l!522))))

(assert (=> d!1962 (= (filterByValue!1 (t!2777 l!522) value!159) lt!3495)))

(declare-fun b!13186 () Bool)

(assert (=> b!13186 (= e!7914 e!7911)))

(declare-fun c!1228 () Bool)

(assert (=> b!13186 (= c!1228 (and ((_ is Cons!380) (t!2777 l!522)) (not (= (_2!231 (h!946 (t!2777 l!522))) value!159))))))

(declare-fun bm!355 () Bool)

(declare-fun call!358 () Bool)

(assert (=> bm!355 (= call!358 (isEmpty!75 lt!3495))))

(declare-fun b!13187 () Bool)

(declare-fun e!7912 () Bool)

(declare-fun e!7913 () Bool)

(assert (=> b!13187 (= e!7912 e!7913)))

(declare-fun res!10430 () Bool)

(assert (=> b!13187 (= res!10430 call!358)))

(assert (=> b!13187 (=> res!10430 e!7913)))

(declare-fun b!13188 () Bool)

(assert (=> b!13188 (= e!7912 call!358)))

(declare-fun b!13189 () Bool)

(declare-fun call!359 () List!384)

(assert (=> b!13189 (= e!7914 ($colon$colon!9 call!359 (h!946 (t!2777 l!522))))))

(declare-fun bm!356 () Bool)

(assert (=> bm!356 (= call!359 (filterByValue!1 (t!2777 (t!2777 l!522)) value!159))))

(declare-fun b!13190 () Bool)

(assert (=> b!13190 (= e!7911 call!359)))

(declare-fun b!13191 () Bool)

(assert (=> b!13191 (= e!7910 e!7912)))

(declare-fun c!1229 () Bool)

(assert (=> b!13191 (= c!1229 (isEmpty!75 (t!2777 l!522)))))

(declare-fun b!13192 () Bool)

(declare-fun head!782 (List!384) tuple2!462)

(assert (=> b!13192 (= e!7913 (bvsge (_1!231 (head!782 lt!3495)) (_1!231 (head!782 (t!2777 l!522)))))))

(assert (= (and d!1962 c!1230) b!13189))

(assert (= (and d!1962 (not c!1230)) b!13186))

(assert (= (and b!13186 c!1228) b!13190))

(assert (= (and b!13186 (not c!1228)) b!13184))

(assert (= (or b!13189 b!13190) bm!356))

(assert (= (and d!1962 res!10431) b!13185))

(assert (= (and b!13185 res!10432) b!13191))

(assert (= (and b!13191 c!1229) b!13188))

(assert (= (and b!13191 (not c!1229)) b!13187))

(assert (= (and b!13187 (not res!10430)) b!13192))

(assert (= (or b!13188 b!13187) bm!355))

(declare-fun m!8981 () Bool)

(assert (=> d!1962 m!8981))

(declare-fun m!8985 () Bool)

(assert (=> d!1962 m!8985))

(declare-fun m!8989 () Bool)

(assert (=> b!13185 m!8989))

(declare-fun m!8993 () Bool)

(assert (=> b!13191 m!8993))

(declare-fun m!8997 () Bool)

(assert (=> bm!356 m!8997))

(declare-fun m!9003 () Bool)

(assert (=> b!13189 m!9003))

(declare-fun m!9007 () Bool)

(assert (=> bm!355 m!9007))

(declare-fun m!9011 () Bool)

(assert (=> b!13192 m!9011))

(declare-fun m!9015 () Bool)

(assert (=> b!13192 m!9015))

(assert (=> b!13051 d!1962))

(declare-fun d!1979 () Bool)

(declare-fun res!10433 () Bool)

(declare-fun e!7915 () Bool)

(assert (=> d!1979 (=> res!10433 e!7915)))

(assert (=> d!1979 (= res!10433 (or ((_ is Nil!381) l!522) ((_ is Nil!381) (t!2777 l!522))))))

(assert (=> d!1979 (= (isStrictlySorted!69 l!522) e!7915)))

(declare-fun b!13193 () Bool)

(declare-fun e!7916 () Bool)

(assert (=> b!13193 (= e!7915 e!7916)))

(declare-fun res!10434 () Bool)

(assert (=> b!13193 (=> (not res!10434) (not e!7916))))

(assert (=> b!13193 (= res!10434 (bvslt (_1!231 (h!946 l!522)) (_1!231 (h!946 (t!2777 l!522)))))))

(declare-fun b!13194 () Bool)

(assert (=> b!13194 (= e!7916 (isStrictlySorted!69 (t!2777 l!522)))))

(assert (= (and d!1979 (not res!10433)) b!13193))

(assert (= (and b!13193 res!10434) b!13194))

(assert (=> b!13194 m!8985))

(assert (=> start!1938 d!1979))

(declare-fun d!1983 () Bool)

(assert (=> d!1983 (= (isEmpty!75 l!522) ((_ is Nil!381) l!522))))

(assert (=> b!13049 d!1983))

(declare-fun b!13205 () Bool)

(declare-fun e!7923 () Bool)

(declare-fun tp!2152 () Bool)

(assert (=> b!13205 (= e!7923 (and tp_is_empty!649 tp!2152))))

(assert (=> b!13047 (= tp!2141 e!7923)))

(assert (= (and b!13047 ((_ is Cons!380) (t!2777 l!522))) b!13205))

(declare-fun b_lambda!870 () Bool)

(assert (= b_lambda!865 (or b!13052 b_lambda!870)))

(declare-fun bs!513 () Bool)

(declare-fun d!1987 () Bool)

(assert (= bs!513 (and d!1987 b!13052)))

(assert (=> bs!513 (= (dynLambda!82 lambda!44 (h!946 lt!3483)) (= (_2!231 (h!946 lt!3483)) value!159))))

(assert (=> b!13109 d!1987))

(check-sat (not b_lambda!870) (not b!13192) (not b!13189) tp_is_empty!649 (not b!13194) (not d!1962) (not b!13205) (not bm!356) (not b!13185) (not b!13191) (not b!13122) (not bm!355) (not b!13111))
(check-sat)
