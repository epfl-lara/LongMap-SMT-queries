; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1938 () Bool)

(assert start!1938)

(declare-fun b!13052 () Bool)

(assert (=> b!13052 true))

(declare-fun res!10338 () Bool)

(declare-fun e!7830 () Bool)

(assert (=> b!13052 (=> (not res!10338) (not e!7830))))

(declare-datatypes ((B!470 0))(
  ( (B!471 (val!333 Int)) )
))
(declare-datatypes ((tuple2!462 0))(
  ( (tuple2!463 (_1!231 (_ BitVec 64)) (_2!231 B!470)) )
))
(declare-datatypes ((List!384 0))(
  ( (Nil!381) (Cons!380 (h!946 tuple2!462) (t!2777 List!384)) )
))
(declare-fun lt!3483 () List!384)

(declare-fun lambda!44 () Int)

(declare-fun forall!68 (List!384 Int) Bool)

(assert (=> b!13052 (= res!10338 (forall!68 lt!3483 lambda!44))))

(declare-fun b!13053 () Bool)

(declare-fun e!7832 () Bool)

(declare-fun tp_is_empty!649 () Bool)

(declare-fun tp!2141 () Bool)

(assert (=> b!13053 (= e!7832 (and tp_is_empty!649 tp!2141))))

(declare-fun b!13054 () Bool)

(assert (=> b!13054 (= e!7830 (= lt!3483 Nil!381))))

(declare-fun b!13055 () Bool)

(declare-fun res!10341 () Bool)

(assert (=> b!13055 (=> (not res!10341) (not e!7830))))

(declare-fun l!522 () List!384)

(declare-fun isEmpty!75 (List!384) Bool)

(assert (=> b!13055 (= res!10341 (not (isEmpty!75 l!522)))))

(declare-fun b!13056 () Bool)

(declare-fun e!7831 () Bool)

(assert (=> b!13056 (= e!7831 e!7830)))

(declare-fun res!10339 () Bool)

(assert (=> b!13056 (=> (not res!10339) (not e!7830))))

(declare-fun isStrictlySorted!72 (List!384) Bool)

(assert (=> b!13056 (= res!10339 (isStrictlySorted!72 lt!3483))))

(declare-fun value!159 () B!470)

(declare-fun $colon$colon!9 (List!384 tuple2!462) List!384)

(declare-fun filterByValue!1 (List!384 B!470) List!384)

(assert (=> b!13056 (= lt!3483 ($colon$colon!9 (filterByValue!1 (t!2777 l!522) value!159) (h!946 l!522)))))

(declare-fun b!13057 () Bool)

(declare-fun res!10342 () Bool)

(assert (=> b!13057 (=> (not res!10342) (not e!7830))))

(assert (=> b!13057 (= res!10342 (not (isEmpty!75 lt!3483)))))

(declare-fun b!13058 () Bool)

(declare-fun res!10337 () Bool)

(assert (=> b!13058 (=> (not res!10337) (not e!7831))))

(get-info :version)

(assert (=> b!13058 (= res!10337 (and ((_ is Cons!380) l!522) (= (_2!231 (h!946 l!522)) value!159)))))

(declare-fun res!10340 () Bool)

(assert (=> start!1938 (=> (not res!10340) (not e!7831))))

(assert (=> start!1938 (= res!10340 (isStrictlySorted!72 l!522))))

(assert (=> start!1938 e!7831))

(assert (=> start!1938 e!7832))

(assert (=> start!1938 tp_is_empty!649))

(assert (= (and start!1938 res!10340) b!13058))

(assert (= (and b!13058 res!10337) b!13056))

(assert (= (and b!13056 res!10339) b!13052))

(assert (= (and b!13052 res!10338) b!13055))

(assert (= (and b!13055 res!10341) b!13057))

(assert (= (and b!13057 res!10342) b!13054))

(assert (= (and start!1938 ((_ is Cons!380) l!522)) b!13053))

(declare-fun m!8919 () Bool)

(assert (=> b!13056 m!8919))

(declare-fun m!8921 () Bool)

(assert (=> b!13056 m!8921))

(assert (=> b!13056 m!8921))

(declare-fun m!8923 () Bool)

(assert (=> b!13056 m!8923))

(declare-fun m!8925 () Bool)

(assert (=> b!13055 m!8925))

(declare-fun m!8927 () Bool)

(assert (=> b!13052 m!8927))

(declare-fun m!8929 () Bool)

(assert (=> b!13057 m!8929))

(declare-fun m!8931 () Bool)

(assert (=> start!1938 m!8931))

(check-sat (not b!13055) (not b!13057) tp_is_empty!649 (not b!13056) (not start!1938) (not b!13052) (not b!13053))
(check-sat)
(get-model)

(declare-fun d!1947 () Bool)

(declare-fun res!10383 () Bool)

(declare-fun e!7855 () Bool)

(assert (=> d!1947 (=> res!10383 e!7855)))

(assert (=> d!1947 (= res!10383 ((_ is Nil!381) lt!3483))))

(assert (=> d!1947 (= (forall!68 lt!3483 lambda!44) e!7855)))

(declare-fun b!13111 () Bool)

(declare-fun e!7856 () Bool)

(assert (=> b!13111 (= e!7855 e!7856)))

(declare-fun res!10384 () Bool)

(assert (=> b!13111 (=> (not res!10384) (not e!7856))))

(declare-fun dynLambda!82 (Int tuple2!462) Bool)

(assert (=> b!13111 (= res!10384 (dynLambda!82 lambda!44 (h!946 lt!3483)))))

(declare-fun b!13112 () Bool)

(assert (=> b!13112 (= e!7856 (forall!68 (t!2777 lt!3483) lambda!44))))

(assert (= (and d!1947 (not res!10383)) b!13111))

(assert (= (and b!13111 res!10384) b!13112))

(declare-fun b_lambda!863 () Bool)

(assert (=> (not b_lambda!863) (not b!13111)))

(declare-fun m!8961 () Bool)

(assert (=> b!13111 m!8961))

(declare-fun m!8963 () Bool)

(assert (=> b!13112 m!8963))

(assert (=> b!13052 d!1947))

(declare-fun d!1951 () Bool)

(declare-fun res!10395 () Bool)

(declare-fun e!7867 () Bool)

(assert (=> d!1951 (=> res!10395 e!7867)))

(assert (=> d!1951 (= res!10395 (or ((_ is Nil!381) lt!3483) ((_ is Nil!381) (t!2777 lt!3483))))))

(assert (=> d!1951 (= (isStrictlySorted!72 lt!3483) e!7867)))

(declare-fun b!13123 () Bool)

(declare-fun e!7868 () Bool)

(assert (=> b!13123 (= e!7867 e!7868)))

(declare-fun res!10396 () Bool)

(assert (=> b!13123 (=> (not res!10396) (not e!7868))))

(assert (=> b!13123 (= res!10396 (bvslt (_1!231 (h!946 lt!3483)) (_1!231 (h!946 (t!2777 lt!3483)))))))

(declare-fun b!13124 () Bool)

(assert (=> b!13124 (= e!7868 (isStrictlySorted!72 (t!2777 lt!3483)))))

(assert (= (and d!1951 (not res!10395)) b!13123))

(assert (= (and b!13123 res!10396) b!13124))

(declare-fun m!8967 () Bool)

(assert (=> b!13124 m!8967))

(assert (=> b!13056 d!1951))

(declare-fun d!1959 () Bool)

(assert (=> d!1959 (= ($colon$colon!9 (filterByValue!1 (t!2777 l!522) value!159) (h!946 l!522)) (Cons!380 (h!946 l!522) (filterByValue!1 (t!2777 l!522) value!159)))))

(assert (=> b!13056 d!1959))

(declare-fun bs!511 () Bool)

(declare-fun b!13182 () Bool)

(assert (= bs!511 (and b!13182 b!13052)))

(declare-fun lambda!56 () Int)

(assert (=> bs!511 (= lambda!56 lambda!44)))

(assert (=> b!13182 true))

(declare-fun b!13177 () Bool)

(declare-fun e!7904 () List!384)

(declare-fun call!359 () List!384)

(assert (=> b!13177 (= e!7904 call!359)))

(declare-fun b!13179 () Bool)

(declare-fun e!7902 () Bool)

(declare-fun e!7903 () Bool)

(assert (=> b!13179 (= e!7902 e!7903)))

(declare-fun c!1232 () Bool)

(assert (=> b!13179 (= c!1232 (isEmpty!75 (t!2777 l!522)))))

(declare-fun b!13180 () Bool)

(declare-fun e!7901 () List!384)

(assert (=> b!13180 (= e!7901 ($colon$colon!9 call!359 (h!946 (t!2777 l!522))))))

(declare-fun b!13181 () Bool)

(declare-fun e!7900 () Bool)

(declare-fun lt!3497 () List!384)

(declare-fun head!782 (List!384) tuple2!462)

(assert (=> b!13181 (= e!7900 (bvsge (_1!231 (head!782 lt!3497)) (_1!231 (head!782 (t!2777 l!522)))))))

(declare-fun res!10418 () Bool)

(assert (=> b!13182 (=> (not res!10418) (not e!7902))))

(assert (=> b!13182 (= res!10418 (forall!68 lt!3497 lambda!56))))

(declare-fun b!13183 () Bool)

(assert (=> b!13183 (= e!7904 Nil!381)))

(declare-fun bm!355 () Bool)

(declare-fun call!358 () Bool)

(assert (=> bm!355 (= call!358 (isEmpty!75 lt!3497))))

(declare-fun d!1961 () Bool)

(assert (=> d!1961 e!7902))

(declare-fun res!10419 () Bool)

(assert (=> d!1961 (=> (not res!10419) (not e!7902))))

(assert (=> d!1961 (= res!10419 (isStrictlySorted!72 lt!3497))))

(assert (=> d!1961 (= lt!3497 e!7901)))

(declare-fun c!1231 () Bool)

(assert (=> d!1961 (= c!1231 (and ((_ is Cons!380) (t!2777 l!522)) (= (_2!231 (h!946 (t!2777 l!522))) value!159)))))

(assert (=> d!1961 (isStrictlySorted!72 (t!2777 l!522))))

(assert (=> d!1961 (= (filterByValue!1 (t!2777 l!522) value!159) lt!3497)))

(declare-fun b!13184 () Bool)

(assert (=> b!13184 (= e!7903 call!358)))

(declare-fun bm!356 () Bool)

(assert (=> bm!356 (= call!359 (filterByValue!1 (t!2777 (t!2777 l!522)) value!159))))

(declare-fun b!13185 () Bool)

(assert (=> b!13185 (= e!7903 e!7900)))

(declare-fun res!10420 () Bool)

(assert (=> b!13185 (= res!10420 call!358)))

(assert (=> b!13185 (=> res!10420 e!7900)))

(declare-fun b!13186 () Bool)

(assert (=> b!13186 (= e!7901 e!7904)))

(declare-fun c!1230 () Bool)

(assert (=> b!13186 (= c!1230 (and ((_ is Cons!380) (t!2777 l!522)) (not (= (_2!231 (h!946 (t!2777 l!522))) value!159))))))

(assert (= (and d!1961 c!1231) b!13180))

(assert (= (and d!1961 (not c!1231)) b!13186))

(assert (= (and b!13186 c!1230) b!13177))

(assert (= (and b!13186 (not c!1230)) b!13183))

(assert (= (or b!13180 b!13177) bm!356))

(assert (= (and d!1961 res!10419) b!13182))

(assert (= (and b!13182 res!10418) b!13179))

(assert (= (and b!13179 c!1232) b!13184))

(assert (= (and b!13179 (not c!1232)) b!13185))

(assert (= (and b!13185 (not res!10420)) b!13181))

(assert (= (or b!13184 b!13185) bm!355))

(declare-fun m!8989 () Bool)

(assert (=> b!13181 m!8989))

(declare-fun m!8991 () Bool)

(assert (=> b!13181 m!8991))

(declare-fun m!8993 () Bool)

(assert (=> b!13182 m!8993))

(declare-fun m!8995 () Bool)

(assert (=> bm!356 m!8995))

(declare-fun m!8997 () Bool)

(assert (=> bm!355 m!8997))

(declare-fun m!8999 () Bool)

(assert (=> d!1961 m!8999))

(declare-fun m!9001 () Bool)

(assert (=> d!1961 m!9001))

(declare-fun m!9003 () Bool)

(assert (=> b!13179 m!9003))

(declare-fun m!9005 () Bool)

(assert (=> b!13180 m!9005))

(assert (=> b!13056 d!1961))

(declare-fun d!1969 () Bool)

(declare-fun res!10421 () Bool)

(declare-fun e!7909 () Bool)

(assert (=> d!1969 (=> res!10421 e!7909)))

(assert (=> d!1969 (= res!10421 (or ((_ is Nil!381) l!522) ((_ is Nil!381) (t!2777 l!522))))))

(assert (=> d!1969 (= (isStrictlySorted!72 l!522) e!7909)))

(declare-fun b!13193 () Bool)

(declare-fun e!7910 () Bool)

(assert (=> b!13193 (= e!7909 e!7910)))

(declare-fun res!10422 () Bool)

(assert (=> b!13193 (=> (not res!10422) (not e!7910))))

(assert (=> b!13193 (= res!10422 (bvslt (_1!231 (h!946 l!522)) (_1!231 (h!946 (t!2777 l!522)))))))

(declare-fun b!13194 () Bool)

(assert (=> b!13194 (= e!7910 (isStrictlySorted!72 (t!2777 l!522)))))

(assert (= (and d!1969 (not res!10421)) b!13193))

(assert (= (and b!13193 res!10422) b!13194))

(assert (=> b!13194 m!9001))

(assert (=> start!1938 d!1969))

(declare-fun d!1973 () Bool)

(assert (=> d!1973 (= (isEmpty!75 lt!3483) ((_ is Nil!381) lt!3483))))

(assert (=> b!13057 d!1973))

(declare-fun d!1977 () Bool)

(assert (=> d!1977 (= (isEmpty!75 l!522) ((_ is Nil!381) l!522))))

(assert (=> b!13055 d!1977))

(declare-fun b!13213 () Bool)

(declare-fun e!7923 () Bool)

(declare-fun tp!2150 () Bool)

(assert (=> b!13213 (= e!7923 (and tp_is_empty!649 tp!2150))))

(assert (=> b!13053 (= tp!2141 e!7923)))

(assert (= (and b!13053 ((_ is Cons!380) (t!2777 l!522))) b!13213))

(declare-fun b_lambda!865 () Bool)

(assert (= b_lambda!863 (or b!13052 b_lambda!865)))

(declare-fun bs!512 () Bool)

(declare-fun d!1979 () Bool)

(assert (= bs!512 (and d!1979 b!13052)))

(assert (=> bs!512 (= (dynLambda!82 lambda!44 (h!946 lt!3483)) (= (_2!231 (h!946 lt!3483)) value!159))))

(assert (=> b!13111 d!1979))

(check-sat (not b!13213) (not b_lambda!865) tp_is_empty!649 (not b!13181) (not b!13112) (not b!13124) (not bm!355) (not b!13194) (not b!13182) (not d!1961) (not b!13179) (not b!13180) (not bm!356))
(check-sat)
