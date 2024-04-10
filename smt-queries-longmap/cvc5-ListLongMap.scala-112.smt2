; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1938 () Bool)

(assert start!1938)

(declare-fun b!13055 () Bool)

(assert (=> b!13055 true))

(declare-fun b!13052 () Bool)

(declare-fun e!7830 () Bool)

(declare-fun e!7832 () Bool)

(assert (=> b!13052 (= e!7830 e!7832)))

(declare-fun res!10339 () Bool)

(assert (=> b!13052 (=> (not res!10339) (not e!7832))))

(declare-datatypes ((B!470 0))(
  ( (B!471 (val!333 Int)) )
))
(declare-datatypes ((tuple2!466 0))(
  ( (tuple2!467 (_1!233 (_ BitVec 64)) (_2!233 B!470)) )
))
(declare-datatypes ((List!388 0))(
  ( (Nil!385) (Cons!384 (h!950 tuple2!466) (t!2781 List!388)) )
))
(declare-fun lt!3483 () List!388)

(declare-fun isStrictlySorted!75 (List!388) Bool)

(assert (=> b!13052 (= res!10339 (isStrictlySorted!75 lt!3483))))

(declare-fun l!522 () List!388)

(declare-fun value!159 () B!470)

(declare-fun $colon$colon!9 (List!388 tuple2!466) List!388)

(declare-fun filterByValue!1 (List!388 B!470) List!388)

(assert (=> b!13052 (= lt!3483 ($colon$colon!9 (filterByValue!1 (t!2781 l!522) value!159) (h!950 l!522)))))

(declare-fun b!13053 () Bool)

(declare-fun res!10338 () Bool)

(assert (=> b!13053 (=> (not res!10338) (not e!7832))))

(declare-fun isEmpty!75 (List!388) Bool)

(assert (=> b!13053 (= res!10338 (not (isEmpty!75 lt!3483)))))

(declare-fun b!13054 () Bool)

(declare-fun e!7831 () Bool)

(declare-fun tp_is_empty!649 () Bool)

(declare-fun tp!2141 () Bool)

(assert (=> b!13054 (= e!7831 (and tp_is_empty!649 tp!2141))))

(declare-fun res!10337 () Bool)

(assert (=> start!1938 (=> (not res!10337) (not e!7830))))

(assert (=> start!1938 (= res!10337 (isStrictlySorted!75 l!522))))

(assert (=> start!1938 e!7830))

(assert (=> start!1938 e!7831))

(assert (=> start!1938 tp_is_empty!649))

(declare-fun res!10340 () Bool)

(assert (=> b!13055 (=> (not res!10340) (not e!7832))))

(declare-fun lambda!44 () Int)

(declare-fun forall!68 (List!388 Int) Bool)

(assert (=> b!13055 (= res!10340 (forall!68 lt!3483 lambda!44))))

(declare-fun b!13056 () Bool)

(declare-fun res!10341 () Bool)

(assert (=> b!13056 (=> (not res!10341) (not e!7832))))

(assert (=> b!13056 (= res!10341 (not (isEmpty!75 l!522)))))

(declare-fun b!13057 () Bool)

(assert (=> b!13057 (= e!7832 (= lt!3483 Nil!385))))

(declare-fun b!13058 () Bool)

(declare-fun res!10342 () Bool)

(assert (=> b!13058 (=> (not res!10342) (not e!7830))))

(assert (=> b!13058 (= res!10342 (and (is-Cons!384 l!522) (= (_2!233 (h!950 l!522)) value!159)))))

(assert (= (and start!1938 res!10337) b!13058))

(assert (= (and b!13058 res!10342) b!13052))

(assert (= (and b!13052 res!10339) b!13055))

(assert (= (and b!13055 res!10340) b!13056))

(assert (= (and b!13056 res!10341) b!13053))

(assert (= (and b!13053 res!10338) b!13057))

(assert (= (and start!1938 (is-Cons!384 l!522)) b!13054))

(declare-fun m!8927 () Bool)

(assert (=> start!1938 m!8927))

(declare-fun m!8929 () Bool)

(assert (=> b!13053 m!8929))

(declare-fun m!8931 () Bool)

(assert (=> b!13052 m!8931))

(declare-fun m!8933 () Bool)

(assert (=> b!13052 m!8933))

(assert (=> b!13052 m!8933))

(declare-fun m!8935 () Bool)

(assert (=> b!13052 m!8935))

(declare-fun m!8937 () Bool)

(assert (=> b!13055 m!8937))

(declare-fun m!8939 () Bool)

(assert (=> b!13056 m!8939))

(push 1)

(assert (not b!13053))

(assert (not b!13052))

(assert (not b!13054))

(assert tp_is_empty!649)

(assert (not b!13055))

(assert (not b!13056))

(assert (not start!1938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1947 () Bool)

(declare-fun res!10391 () Bool)

(declare-fun e!7863 () Bool)

(assert (=> d!1947 (=> res!10391 e!7863)))

(assert (=> d!1947 (= res!10391 (is-Nil!385 lt!3483))))

(assert (=> d!1947 (= (forall!68 lt!3483 lambda!44) e!7863)))

(declare-fun b!13117 () Bool)

(declare-fun e!7864 () Bool)

(assert (=> b!13117 (= e!7863 e!7864)))

(declare-fun res!10392 () Bool)

(assert (=> b!13117 (=> (not res!10392) (not e!7864))))

(declare-fun dynLambda!82 (Int tuple2!466) Bool)

(assert (=> b!13117 (= res!10392 (dynLambda!82 lambda!44 (h!950 lt!3483)))))

(declare-fun b!13118 () Bool)

(assert (=> b!13118 (= e!7864 (forall!68 (t!2781 lt!3483) lambda!44))))

(assert (= (and d!1947 (not res!10391)) b!13117))

(assert (= (and b!13117 res!10392) b!13118))

(declare-fun b_lambda!863 () Bool)

(assert (=> (not b_lambda!863) (not b!13117)))

(declare-fun m!8969 () Bool)

(assert (=> b!13117 m!8969))

(declare-fun m!8971 () Bool)

(assert (=> b!13118 m!8971))

(assert (=> b!13055 d!1947))

(declare-fun d!1957 () Bool)

(assert (=> d!1957 (= (isEmpty!75 l!522) (is-Nil!385 l!522))))

(assert (=> b!13056 d!1957))

(declare-fun d!1963 () Bool)

(assert (=> d!1963 (= (isEmpty!75 lt!3483) (is-Nil!385 lt!3483))))

(assert (=> b!13053 d!1963))

(declare-fun d!1967 () Bool)

(declare-fun res!10413 () Bool)

(declare-fun e!7885 () Bool)

(assert (=> d!1967 (=> res!10413 e!7885)))

(assert (=> d!1967 (= res!10413 (or (is-Nil!385 l!522) (is-Nil!385 (t!2781 l!522))))))

(assert (=> d!1967 (= (isStrictlySorted!75 l!522) e!7885)))

(declare-fun b!13141 () Bool)

(declare-fun e!7886 () Bool)

(assert (=> b!13141 (= e!7885 e!7886)))

(declare-fun res!10414 () Bool)

(assert (=> b!13141 (=> (not res!10414) (not e!7886))))

(assert (=> b!13141 (= res!10414 (bvslt (_1!233 (h!950 l!522)) (_1!233 (h!950 (t!2781 l!522)))))))

(declare-fun b!13142 () Bool)

(assert (=> b!13142 (= e!7886 (isStrictlySorted!75 (t!2781 l!522)))))

(assert (= (and d!1967 (not res!10413)) b!13141))

(assert (= (and b!13141 res!10414) b!13142))

(declare-fun m!8985 () Bool)

(assert (=> b!13142 m!8985))

(assert (=> start!1938 d!1967))

(declare-fun d!1975 () Bool)

(declare-fun res!10419 () Bool)

(declare-fun e!7891 () Bool)

(assert (=> d!1975 (=> res!10419 e!7891)))

(assert (=> d!1975 (= res!10419 (or (is-Nil!385 lt!3483) (is-Nil!385 (t!2781 lt!3483))))))

(assert (=> d!1975 (= (isStrictlySorted!75 lt!3483) e!7891)))

(declare-fun b!13147 () Bool)

(declare-fun e!7892 () Bool)

(assert (=> b!13147 (= e!7891 e!7892)))

(declare-fun res!10420 () Bool)

(assert (=> b!13147 (=> (not res!10420) (not e!7892))))

(assert (=> b!13147 (= res!10420 (bvslt (_1!233 (h!950 lt!3483)) (_1!233 (h!950 (t!2781 lt!3483)))))))

(declare-fun b!13148 () Bool)

(assert (=> b!13148 (= e!7892 (isStrictlySorted!75 (t!2781 lt!3483)))))

(assert (= (and d!1975 (not res!10419)) b!13147))

(assert (= (and b!13147 res!10420) b!13148))

(declare-fun m!8991 () Bool)

(assert (=> b!13148 m!8991))

(assert (=> b!13052 d!1975))

(declare-fun d!1981 () Bool)

(assert (=> d!1981 (= ($colon$colon!9 (filterByValue!1 (t!2781 l!522) value!159) (h!950 l!522)) (Cons!384 (h!950 l!522) (filterByValue!1 (t!2781 l!522) value!159)))))

(assert (=> b!13052 d!1981))

(declare-fun bs!510 () Bool)

(declare-fun b!13222 () Bool)

(assert (= bs!510 (and b!13222 b!13055)))

(declare-fun lambda!59 () Int)

(assert (=> bs!510 (= lambda!59 lambda!44)))

(assert (=> b!13222 true))

(declare-fun b!13221 () Bool)

(declare-fun e!7936 () Bool)

(declare-fun e!7935 () Bool)

(assert (=> b!13221 (= e!7936 e!7935)))

(declare-fun res!10447 () Bool)

(declare-fun call!364 () Bool)

(assert (=> b!13221 (= res!10447 call!364)))

(assert (=> b!13221 (=> res!10447 e!7935)))

(declare-fun res!10445 () Bool)

(declare-fun e!7934 () Bool)

(assert (=> b!13222 (=> (not res!10445) (not e!7934))))

(declare-fun lt!3498 () List!388)

(assert (=> b!13222 (= res!10445 (forall!68 lt!3498 lambda!59))))

(declare-fun b!13223 () Bool)

(declare-fun e!7937 () List!388)

(declare-fun call!365 () List!388)

(assert (=> b!13223 (= e!7937 ($colon$colon!9 call!365 (h!950 (t!2781 l!522))))))

(declare-fun b!13224 () Bool)

(declare-fun e!7933 () List!388)

(assert (=> b!13224 (= e!7933 call!365)))

(declare-fun bm!361 () Bool)

(assert (=> bm!361 (= call!364 (isEmpty!75 lt!3498))))

(declare-fun b!13225 () Bool)

(assert (=> b!13225 (= e!7936 call!364)))

(declare-fun bm!362 () Bool)

(assert (=> bm!362 (= call!365 (filterByValue!1 (t!2781 (t!2781 l!522)) value!159))))

(declare-fun d!1987 () Bool)

(assert (=> d!1987 e!7934))

(declare-fun res!10446 () Bool)

(assert (=> d!1987 (=> (not res!10446) (not e!7934))))

(assert (=> d!1987 (= res!10446 (isStrictlySorted!75 lt!3498))))

(assert (=> d!1987 (= lt!3498 e!7937)))

(declare-fun c!1240 () Bool)

(assert (=> d!1987 (= c!1240 (and (is-Cons!384 (t!2781 l!522)) (= (_2!233 (h!950 (t!2781 l!522))) value!159)))))

(assert (=> d!1987 (isStrictlySorted!75 (t!2781 l!522))))

(assert (=> d!1987 (= (filterByValue!1 (t!2781 l!522) value!159) lt!3498)))

(declare-fun b!13226 () Bool)

(declare-fun head!783 (List!388) tuple2!466)

(assert (=> b!13226 (= e!7935 (bvsge (_1!233 (head!783 lt!3498)) (_1!233 (head!783 (t!2781 l!522)))))))

(declare-fun b!13227 () Bool)

(assert (=> b!13227 (= e!7934 e!7936)))

(declare-fun c!1239 () Bool)

(assert (=> b!13227 (= c!1239 (isEmpty!75 (t!2781 l!522)))))

(declare-fun b!13228 () Bool)

(assert (=> b!13228 (= e!7933 Nil!385)))

(declare-fun b!13229 () Bool)

(assert (=> b!13229 (= e!7937 e!7933)))

(declare-fun c!1241 () Bool)

(assert (=> b!13229 (= c!1241 (and (is-Cons!384 (t!2781 l!522)) (not (= (_2!233 (h!950 (t!2781 l!522))) value!159))))))

(assert (= (and d!1987 c!1240) b!13223))

(assert (= (and d!1987 (not c!1240)) b!13229))

(assert (= (and b!13229 c!1241) b!13224))

(assert (= (and b!13229 (not c!1241)) b!13228))

(assert (= (or b!13223 b!13224) bm!362))

(assert (= (and d!1987 res!10446) b!13222))

(assert (= (and b!13222 res!10445) b!13227))

(assert (= (and b!13227 c!1239) b!13225))

(assert (= (and b!13227 (not c!1239)) b!13221))

(assert (= (and b!13221 (not res!10447)) b!13226))

(assert (= (or b!13225 b!13221) bm!361))

(declare-fun m!8993 () Bool)

(assert (=> b!13226 m!8993))

(declare-fun m!8999 () Bool)

(assert (=> b!13226 m!8999))

(declare-fun m!9005 () Bool)

(assert (=> bm!361 m!9005))

(declare-fun m!9011 () Bool)

(assert (=> b!13222 m!9011))

(declare-fun m!9017 () Bool)

(assert (=> d!1987 m!9017))

(assert (=> d!1987 m!8985))

(declare-fun m!9025 () Bool)

(assert (=> b!13227 m!9025))

(declare-fun m!9029 () Bool)

(assert (=> bm!362 m!9029))

(declare-fun m!9037 () Bool)

(assert (=> b!13223 m!9037))

(assert (=> b!13052 d!1987))

(declare-fun b!13243 () Bool)

(declare-fun e!7945 () Bool)

(declare-fun tp!2155 () Bool)

(assert (=> b!13243 (= e!7945 (and tp_is_empty!649 tp!2155))))

(assert (=> b!13054 (= tp!2141 e!7945)))

(assert (= (and b!13054 (is-Cons!384 (t!2781 l!522))) b!13243))

(declare-fun b_lambda!871 () Bool)

(assert (= b_lambda!863 (or b!13055 b_lambda!871)))

(declare-fun bs!515 () Bool)

(declare-fun d!1991 () Bool)

(assert (= bs!515 (and d!1991 b!13055)))

(assert (=> bs!515 (= (dynLambda!82 lambda!44 (h!950 lt!3483)) (= (_2!233 (h!950 lt!3483)) value!159))))

(assert (=> b!13117 d!1991))

(push 1)

