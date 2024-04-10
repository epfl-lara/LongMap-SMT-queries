; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42866 () Bool)

(assert start!42866)

(declare-fun b_free!12105 () Bool)

(declare-fun b_next!12105 () Bool)

(assert (=> start!42866 (= b_free!12105 (not b_next!12105))))

(declare-fun tp!42402 () Bool)

(declare-fun b_and!20721 () Bool)

(assert (=> start!42866 (= tp!42402 b_and!20721)))

(declare-fun b!476894 () Bool)

(declare-fun e!280162 () Bool)

(declare-fun e!280164 () Bool)

(assert (=> b!476894 (= e!280162 e!280164)))

(declare-fun res!284686 () Bool)

(assert (=> b!476894 (=> (not res!284686) (not e!280164))))

(declare-fun p!166 () Int)

(declare-datatypes ((B!1054 0))(
  ( (B!1055 (val!6811 Int)) )
))
(declare-datatypes ((tuple2!8994 0))(
  ( (tuple2!8995 (_1!4508 (_ BitVec 64)) (_2!4508 B!1054)) )
))
(declare-fun lt!217352 () tuple2!8994)

(declare-fun dynLambda!945 (Int tuple2!8994) Bool)

(assert (=> b!476894 (= res!284686 (dynLambda!945 p!166 lt!217352))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1054)

(assert (=> b!476894 (= lt!217352 (tuple2!8995 a!501 b!85))))

(declare-fun res!284685 () Bool)

(assert (=> start!42866 (=> (not res!284685) (not e!280162))))

(declare-datatypes ((List!9054 0))(
  ( (Nil!9051) (Cons!9050 (h!9906 tuple2!8994) (t!15120 List!9054)) )
))
(declare-datatypes ((ListLongMap!7907 0))(
  ( (ListLongMap!7908 (toList!3969 List!9054)) )
))
(declare-fun lm!215 () ListLongMap!7907)

(declare-fun forall!198 (List!9054 Int) Bool)

(assert (=> start!42866 (= res!284685 (forall!198 (toList!3969 lm!215) p!166))))

(assert (=> start!42866 e!280162))

(declare-fun e!280163 () Bool)

(declare-fun inv!15496 (ListLongMap!7907) Bool)

(assert (=> start!42866 (and (inv!15496 lm!215) e!280163)))

(assert (=> start!42866 tp!42402))

(declare-fun tp_is_empty!13527 () Bool)

(assert (=> start!42866 tp_is_empty!13527))

(assert (=> start!42866 true))

(declare-fun b!476895 () Bool)

(declare-fun tp!42403 () Bool)

(assert (=> b!476895 (= e!280163 tp!42403)))

(declare-fun b!476896 () Bool)

(declare-fun e!280165 () Bool)

(assert (=> b!476896 (= e!280164 e!280165)))

(declare-fun res!284683 () Bool)

(assert (=> b!476896 (=> (not res!284683) (not e!280165))))

(declare-fun lt!217351 () ListLongMap!7907)

(assert (=> b!476896 (= res!284683 (forall!198 (toList!3969 lt!217351) p!166))))

(declare-fun tail!126 (ListLongMap!7907) ListLongMap!7907)

(assert (=> b!476896 (= lt!217351 (tail!126 lm!215))))

(declare-fun b!476897 () Bool)

(declare-fun +!1766 (ListLongMap!7907 tuple2!8994) ListLongMap!7907)

(assert (=> b!476897 (= e!280165 (not (forall!198 (toList!3969 (+!1766 lm!215 lt!217352)) p!166)))))

(assert (=> b!476897 (forall!198 (toList!3969 (+!1766 lt!217351 lt!217352)) p!166)))

(declare-datatypes ((Unit!14036 0))(
  ( (Unit!14037) )
))
(declare-fun lt!217353 () Unit!14036)

(declare-fun addValidProp!21 (ListLongMap!7907 Int (_ BitVec 64) B!1054) Unit!14036)

(assert (=> b!476897 (= lt!217353 (addValidProp!21 lt!217351 p!166 a!501 b!85))))

(declare-fun b!476898 () Bool)

(declare-fun res!284684 () Bool)

(assert (=> b!476898 (=> (not res!284684) (not e!280164))))

(declare-fun isEmpty!602 (ListLongMap!7907) Bool)

(assert (=> b!476898 (= res!284684 (not (isEmpty!602 lm!215)))))

(assert (= (and start!42866 res!284685) b!476894))

(assert (= (and b!476894 res!284686) b!476898))

(assert (= (and b!476898 res!284684) b!476896))

(assert (= (and b!476896 res!284683) b!476897))

(assert (= start!42866 b!476895))

(declare-fun b_lambda!10517 () Bool)

(assert (=> (not b_lambda!10517) (not b!476894)))

(declare-fun t!15119 () Bool)

(declare-fun tb!4023 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15119) tb!4023))

(declare-fun result!7585 () Bool)

(assert (=> tb!4023 (= result!7585 true)))

(assert (=> b!476894 t!15119))

(declare-fun b_and!20723 () Bool)

(assert (= b_and!20721 (and (=> t!15119 result!7585) b_and!20723)))

(declare-fun m!459161 () Bool)

(assert (=> b!476894 m!459161))

(declare-fun m!459163 () Bool)

(assert (=> b!476897 m!459163))

(declare-fun m!459165 () Bool)

(assert (=> b!476897 m!459165))

(declare-fun m!459167 () Bool)

(assert (=> b!476897 m!459167))

(declare-fun m!459169 () Bool)

(assert (=> b!476897 m!459169))

(declare-fun m!459171 () Bool)

(assert (=> b!476897 m!459171))

(declare-fun m!459173 () Bool)

(assert (=> start!42866 m!459173))

(declare-fun m!459175 () Bool)

(assert (=> start!42866 m!459175))

(declare-fun m!459177 () Bool)

(assert (=> b!476896 m!459177))

(declare-fun m!459179 () Bool)

(assert (=> b!476896 m!459179))

(declare-fun m!459181 () Bool)

(assert (=> b!476898 m!459181))

(check-sat (not b_lambda!10517) tp_is_empty!13527 (not start!42866) (not b_next!12105) (not b!476895) (not b!476898) (not b!476897) (not b!476896) b_and!20723)
(check-sat b_and!20723 (not b_next!12105))
(get-model)

(declare-fun b_lambda!10521 () Bool)

(assert (= b_lambda!10517 (or (and start!42866 b_free!12105) b_lambda!10521)))

(check-sat tp_is_empty!13527 (not start!42866) (not b_next!12105) (not b!476895) (not b_lambda!10521) (not b!476898) (not b!476897) (not b!476896) b_and!20723)
(check-sat b_and!20723 (not b_next!12105))
(get-model)

(declare-fun d!75911 () Bool)

(declare-fun isEmpty!604 (List!9054) Bool)

(assert (=> d!75911 (= (isEmpty!602 lm!215) (isEmpty!604 (toList!3969 lm!215)))))

(declare-fun bs!15159 () Bool)

(assert (= bs!15159 d!75911))

(declare-fun m!459205 () Bool)

(assert (=> bs!15159 m!459205))

(assert (=> b!476898 d!75911))

(declare-fun d!75915 () Bool)

(declare-fun res!284713 () Bool)

(declare-fun e!280192 () Bool)

(assert (=> d!75915 (=> res!284713 e!280192)))

(get-info :version)

(assert (=> d!75915 (= res!284713 ((_ is Nil!9051) (toList!3969 (+!1766 lm!215 lt!217352))))))

(assert (=> d!75915 (= (forall!198 (toList!3969 (+!1766 lm!215 lt!217352)) p!166) e!280192)))

(declare-fun b!476928 () Bool)

(declare-fun e!280193 () Bool)

(assert (=> b!476928 (= e!280192 e!280193)))

(declare-fun res!284714 () Bool)

(assert (=> b!476928 (=> (not res!284714) (not e!280193))))

(assert (=> b!476928 (= res!284714 (dynLambda!945 p!166 (h!9906 (toList!3969 (+!1766 lm!215 lt!217352)))))))

(declare-fun b!476929 () Bool)

(assert (=> b!476929 (= e!280193 (forall!198 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352))) p!166))))

(assert (= (and d!75915 (not res!284713)) b!476928))

(assert (= (and b!476928 res!284714) b!476929))

(declare-fun b_lambda!10529 () Bool)

(assert (=> (not b_lambda!10529) (not b!476928)))

(declare-fun t!15127 () Bool)

(declare-fun tb!4029 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15127) tb!4029))

(declare-fun result!7591 () Bool)

(assert (=> tb!4029 (= result!7591 true)))

(assert (=> b!476928 t!15127))

(declare-fun b_and!20731 () Bool)

(assert (= b_and!20723 (and (=> t!15127 result!7591) b_and!20731)))

(declare-fun m!459211 () Bool)

(assert (=> b!476928 m!459211))

(declare-fun m!459213 () Bool)

(assert (=> b!476929 m!459213))

(assert (=> b!476897 d!75915))

(declare-fun d!75919 () Bool)

(declare-fun res!284717 () Bool)

(declare-fun e!280196 () Bool)

(assert (=> d!75919 (=> res!284717 e!280196)))

(assert (=> d!75919 (= res!284717 ((_ is Nil!9051) (toList!3969 (+!1766 lt!217351 lt!217352))))))

(assert (=> d!75919 (= (forall!198 (toList!3969 (+!1766 lt!217351 lt!217352)) p!166) e!280196)))

(declare-fun b!476932 () Bool)

(declare-fun e!280197 () Bool)

(assert (=> b!476932 (= e!280196 e!280197)))

(declare-fun res!284718 () Bool)

(assert (=> b!476932 (=> (not res!284718) (not e!280197))))

(assert (=> b!476932 (= res!284718 (dynLambda!945 p!166 (h!9906 (toList!3969 (+!1766 lt!217351 lt!217352)))))))

(declare-fun b!476933 () Bool)

(assert (=> b!476933 (= e!280197 (forall!198 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352))) p!166))))

(assert (= (and d!75919 (not res!284717)) b!476932))

(assert (= (and b!476932 res!284718) b!476933))

(declare-fun b_lambda!10533 () Bool)

(assert (=> (not b_lambda!10533) (not b!476932)))

(declare-fun t!15131 () Bool)

(declare-fun tb!4033 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15131) tb!4033))

(declare-fun result!7593 () Bool)

(assert (=> tb!4033 (= result!7593 true)))

(assert (=> b!476932 t!15131))

(declare-fun b_and!20733 () Bool)

(assert (= b_and!20731 (and (=> t!15131 result!7593) b_and!20733)))

(declare-fun m!459217 () Bool)

(assert (=> b!476932 m!459217))

(declare-fun m!459221 () Bool)

(assert (=> b!476933 m!459221))

(assert (=> b!476897 d!75919))

(declare-fun d!75923 () Bool)

(declare-fun e!280202 () Bool)

(assert (=> d!75923 e!280202))

(declare-fun res!284725 () Bool)

(assert (=> d!75923 (=> (not res!284725) (not e!280202))))

(declare-fun lt!217373 () ListLongMap!7907)

(declare-fun contains!2568 (ListLongMap!7907 (_ BitVec 64)) Bool)

(assert (=> d!75923 (= res!284725 (contains!2568 lt!217373 (_1!4508 lt!217352)))))

(declare-fun lt!217371 () List!9054)

(assert (=> d!75923 (= lt!217373 (ListLongMap!7908 lt!217371))))

(declare-fun lt!217372 () Unit!14036)

(declare-fun lt!217374 () Unit!14036)

(assert (=> d!75923 (= lt!217372 lt!217374)))

(declare-datatypes ((Option!392 0))(
  ( (Some!391 (v!9092 B!1054)) (None!390) )
))
(declare-fun getValueByKey!386 (List!9054 (_ BitVec 64)) Option!392)

(assert (=> d!75923 (= (getValueByKey!386 lt!217371 (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352)))))

(declare-fun lemmaContainsTupThenGetReturnValue!208 (List!9054 (_ BitVec 64) B!1054) Unit!14036)

(assert (=> d!75923 (= lt!217374 (lemmaContainsTupThenGetReturnValue!208 lt!217371 (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun insertStrictlySorted!211 (List!9054 (_ BitVec 64) B!1054) List!9054)

(assert (=> d!75923 (= lt!217371 (insertStrictlySorted!211 (toList!3969 lm!215) (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(assert (=> d!75923 (= (+!1766 lm!215 lt!217352) lt!217373)))

(declare-fun b!476940 () Bool)

(declare-fun res!284726 () Bool)

(assert (=> b!476940 (=> (not res!284726) (not e!280202))))

(assert (=> b!476940 (= res!284726 (= (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352))))))

(declare-fun b!476941 () Bool)

(declare-fun contains!2569 (List!9054 tuple2!8994) Bool)

(assert (=> b!476941 (= e!280202 (contains!2569 (toList!3969 lt!217373) lt!217352))))

(assert (= (and d!75923 res!284725) b!476940))

(assert (= (and b!476940 res!284726) b!476941))

(declare-fun m!459235 () Bool)

(assert (=> d!75923 m!459235))

(declare-fun m!459237 () Bool)

(assert (=> d!75923 m!459237))

(declare-fun m!459239 () Bool)

(assert (=> d!75923 m!459239))

(declare-fun m!459241 () Bool)

(assert (=> d!75923 m!459241))

(declare-fun m!459243 () Bool)

(assert (=> b!476940 m!459243))

(declare-fun m!459245 () Bool)

(assert (=> b!476941 m!459245))

(assert (=> b!476897 d!75923))

(declare-fun d!75935 () Bool)

(assert (=> d!75935 (forall!198 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85))) p!166)))

(declare-fun lt!217388 () Unit!14036)

(declare-fun choose!1361 (ListLongMap!7907 Int (_ BitVec 64) B!1054) Unit!14036)

(assert (=> d!75935 (= lt!217388 (choose!1361 lt!217351 p!166 a!501 b!85))))

(declare-fun e!280212 () Bool)

(assert (=> d!75935 e!280212))

(declare-fun res!284738 () Bool)

(assert (=> d!75935 (=> (not res!284738) (not e!280212))))

(assert (=> d!75935 (= res!284738 (forall!198 (toList!3969 lt!217351) p!166))))

(assert (=> d!75935 (= (addValidProp!21 lt!217351 p!166 a!501 b!85) lt!217388)))

(declare-fun b!476955 () Bool)

(assert (=> b!476955 (= e!280212 (dynLambda!945 p!166 (tuple2!8995 a!501 b!85)))))

(assert (= (and d!75935 res!284738) b!476955))

(declare-fun b_lambda!10541 () Bool)

(assert (=> (not b_lambda!10541) (not b!476955)))

(declare-fun t!15139 () Bool)

(declare-fun tb!4041 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15139) tb!4041))

(declare-fun result!7603 () Bool)

(assert (=> tb!4041 (= result!7603 true)))

(assert (=> b!476955 t!15139))

(declare-fun b_and!20743 () Bool)

(assert (= b_and!20733 (and (=> t!15139 result!7603) b_and!20743)))

(declare-fun m!459259 () Bool)

(assert (=> d!75935 m!459259))

(declare-fun m!459261 () Bool)

(assert (=> d!75935 m!459261))

(declare-fun m!459263 () Bool)

(assert (=> d!75935 m!459263))

(assert (=> d!75935 m!459177))

(declare-fun m!459265 () Bool)

(assert (=> b!476955 m!459265))

(assert (=> b!476897 d!75935))

(declare-fun d!75941 () Bool)

(declare-fun e!280213 () Bool)

(assert (=> d!75941 e!280213))

(declare-fun res!284739 () Bool)

(assert (=> d!75941 (=> (not res!284739) (not e!280213))))

(declare-fun lt!217391 () ListLongMap!7907)

(assert (=> d!75941 (= res!284739 (contains!2568 lt!217391 (_1!4508 lt!217352)))))

(declare-fun lt!217389 () List!9054)

(assert (=> d!75941 (= lt!217391 (ListLongMap!7908 lt!217389))))

(declare-fun lt!217390 () Unit!14036)

(declare-fun lt!217392 () Unit!14036)

(assert (=> d!75941 (= lt!217390 lt!217392)))

(assert (=> d!75941 (= (getValueByKey!386 lt!217389 (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352)))))

(assert (=> d!75941 (= lt!217392 (lemmaContainsTupThenGetReturnValue!208 lt!217389 (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(assert (=> d!75941 (= lt!217389 (insertStrictlySorted!211 (toList!3969 lt!217351) (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(assert (=> d!75941 (= (+!1766 lt!217351 lt!217352) lt!217391)))

(declare-fun b!476956 () Bool)

(declare-fun res!284740 () Bool)

(assert (=> b!476956 (=> (not res!284740) (not e!280213))))

(assert (=> b!476956 (= res!284740 (= (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352))))))

(declare-fun b!476957 () Bool)

(assert (=> b!476957 (= e!280213 (contains!2569 (toList!3969 lt!217391) lt!217352))))

(assert (= (and d!75941 res!284739) b!476956))

(assert (= (and b!476956 res!284740) b!476957))

(declare-fun m!459267 () Bool)

(assert (=> d!75941 m!459267))

(declare-fun m!459269 () Bool)

(assert (=> d!75941 m!459269))

(declare-fun m!459271 () Bool)

(assert (=> d!75941 m!459271))

(declare-fun m!459273 () Bool)

(assert (=> d!75941 m!459273))

(declare-fun m!459275 () Bool)

(assert (=> b!476956 m!459275))

(declare-fun m!459277 () Bool)

(assert (=> b!476957 m!459277))

(assert (=> b!476897 d!75941))

(declare-fun d!75943 () Bool)

(declare-fun res!284741 () Bool)

(declare-fun e!280214 () Bool)

(assert (=> d!75943 (=> res!284741 e!280214)))

(assert (=> d!75943 (= res!284741 ((_ is Nil!9051) (toList!3969 lm!215)))))

(assert (=> d!75943 (= (forall!198 (toList!3969 lm!215) p!166) e!280214)))

(declare-fun b!476958 () Bool)

(declare-fun e!280215 () Bool)

(assert (=> b!476958 (= e!280214 e!280215)))

(declare-fun res!284742 () Bool)

(assert (=> b!476958 (=> (not res!284742) (not e!280215))))

(assert (=> b!476958 (= res!284742 (dynLambda!945 p!166 (h!9906 (toList!3969 lm!215))))))

(declare-fun b!476959 () Bool)

(assert (=> b!476959 (= e!280215 (forall!198 (t!15120 (toList!3969 lm!215)) p!166))))

(assert (= (and d!75943 (not res!284741)) b!476958))

(assert (= (and b!476958 res!284742) b!476959))

(declare-fun b_lambda!10543 () Bool)

(assert (=> (not b_lambda!10543) (not b!476958)))

(declare-fun t!15141 () Bool)

(declare-fun tb!4043 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15141) tb!4043))

(declare-fun result!7605 () Bool)

(assert (=> tb!4043 (= result!7605 true)))

(assert (=> b!476958 t!15141))

(declare-fun b_and!20745 () Bool)

(assert (= b_and!20743 (and (=> t!15141 result!7605) b_and!20745)))

(declare-fun m!459279 () Bool)

(assert (=> b!476958 m!459279))

(declare-fun m!459281 () Bool)

(assert (=> b!476959 m!459281))

(assert (=> start!42866 d!75943))

(declare-fun d!75945 () Bool)

(declare-fun isStrictlySorted!388 (List!9054) Bool)

(assert (=> d!75945 (= (inv!15496 lm!215) (isStrictlySorted!388 (toList!3969 lm!215)))))

(declare-fun bs!15164 () Bool)

(assert (= bs!15164 d!75945))

(declare-fun m!459295 () Bool)

(assert (=> bs!15164 m!459295))

(assert (=> start!42866 d!75945))

(declare-fun d!75949 () Bool)

(declare-fun res!284747 () Bool)

(declare-fun e!280218 () Bool)

(assert (=> d!75949 (=> res!284747 e!280218)))

(assert (=> d!75949 (= res!284747 ((_ is Nil!9051) (toList!3969 lt!217351)))))

(assert (=> d!75949 (= (forall!198 (toList!3969 lt!217351) p!166) e!280218)))

(declare-fun b!476964 () Bool)

(declare-fun e!280219 () Bool)

(assert (=> b!476964 (= e!280218 e!280219)))

(declare-fun res!284748 () Bool)

(assert (=> b!476964 (=> (not res!284748) (not e!280219))))

(assert (=> b!476964 (= res!284748 (dynLambda!945 p!166 (h!9906 (toList!3969 lt!217351))))))

(declare-fun b!476965 () Bool)

(assert (=> b!476965 (= e!280219 (forall!198 (t!15120 (toList!3969 lt!217351)) p!166))))

(assert (= (and d!75949 (not res!284747)) b!476964))

(assert (= (and b!476964 res!284748) b!476965))

(declare-fun b_lambda!10545 () Bool)

(assert (=> (not b_lambda!10545) (not b!476964)))

(declare-fun t!15143 () Bool)

(declare-fun tb!4045 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15143) tb!4045))

(declare-fun result!7607 () Bool)

(assert (=> tb!4045 (= result!7607 true)))

(assert (=> b!476964 t!15143))

(declare-fun b_and!20747 () Bool)

(assert (= b_and!20745 (and (=> t!15143 result!7607) b_and!20747)))

(declare-fun m!459305 () Bool)

(assert (=> b!476964 m!459305))

(declare-fun m!459307 () Bool)

(assert (=> b!476965 m!459307))

(assert (=> b!476896 d!75949))

(declare-fun d!75951 () Bool)

(declare-fun tail!130 (List!9054) List!9054)

(assert (=> d!75951 (= (tail!126 lm!215) (ListLongMap!7908 (tail!130 (toList!3969 lm!215))))))

(declare-fun bs!15165 () Bool)

(assert (= bs!15165 d!75951))

(declare-fun m!459313 () Bool)

(assert (=> bs!15165 m!459313))

(assert (=> b!476896 d!75951))

(declare-fun b!476970 () Bool)

(declare-fun e!280222 () Bool)

(declare-fun tp!42412 () Bool)

(assert (=> b!476970 (= e!280222 (and tp_is_empty!13527 tp!42412))))

(assert (=> b!476895 (= tp!42403 e!280222)))

(assert (= (and b!476895 ((_ is Cons!9050) (toList!3969 lm!215))) b!476970))

(declare-fun b_lambda!10547 () Bool)

(assert (= b_lambda!10529 (or (and start!42866 b_free!12105) b_lambda!10547)))

(declare-fun b_lambda!10549 () Bool)

(assert (= b_lambda!10545 (or (and start!42866 b_free!12105) b_lambda!10549)))

(declare-fun b_lambda!10551 () Bool)

(assert (= b_lambda!10543 (or (and start!42866 b_free!12105) b_lambda!10551)))

(declare-fun b_lambda!10553 () Bool)

(assert (= b_lambda!10533 (or (and start!42866 b_free!12105) b_lambda!10553)))

(declare-fun b_lambda!10555 () Bool)

(assert (= b_lambda!10541 (or (and start!42866 b_free!12105) b_lambda!10555)))

(check-sat tp_is_empty!13527 (not b_lambda!10549) (not b!476929) (not d!75951) (not b_lambda!10521) (not d!75911) (not b!476959) (not b!476941) (not d!75923) (not b!476965) (not d!75941) (not d!75945) (not b_next!12105) (not b!476956) (not b!476957) (not b_lambda!10547) (not b!476970) (not b!476940) (not b_lambda!10551) (not b_lambda!10553) b_and!20747 (not b_lambda!10555) (not b!476933) (not d!75935))
(check-sat b_and!20747 (not b_next!12105))
(get-model)

(declare-fun b!477012 () Bool)

(declare-fun e!280249 () Option!392)

(assert (=> b!477012 (= e!280249 None!390)))

(declare-fun b!477009 () Bool)

(declare-fun e!280248 () Option!392)

(assert (=> b!477009 (= e!280248 (Some!391 (_2!4508 (h!9906 (toList!3969 lt!217391)))))))

(declare-fun b!477011 () Bool)

(assert (=> b!477011 (= e!280249 (getValueByKey!386 (t!15120 (toList!3969 lt!217391)) (_1!4508 lt!217352)))))

(declare-fun d!75969 () Bool)

(declare-fun c!57378 () Bool)

(assert (=> d!75969 (= c!57378 (and ((_ is Cons!9050) (toList!3969 lt!217391)) (= (_1!4508 (h!9906 (toList!3969 lt!217391))) (_1!4508 lt!217352))))))

(assert (=> d!75969 (= (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352)) e!280248)))

(declare-fun b!477010 () Bool)

(assert (=> b!477010 (= e!280248 e!280249)))

(declare-fun c!57379 () Bool)

(assert (=> b!477010 (= c!57379 (and ((_ is Cons!9050) (toList!3969 lt!217391)) (not (= (_1!4508 (h!9906 (toList!3969 lt!217391))) (_1!4508 lt!217352)))))))

(assert (= (and d!75969 c!57378) b!477009))

(assert (= (and d!75969 (not c!57378)) b!477010))

(assert (= (and b!477010 c!57379) b!477011))

(assert (= (and b!477010 (not c!57379)) b!477012))

(declare-fun m!459367 () Bool)

(assert (=> b!477011 m!459367))

(assert (=> b!476956 d!75969))

(declare-fun d!75971 () Bool)

(declare-fun res!284768 () Bool)

(declare-fun e!280250 () Bool)

(assert (=> d!75971 (=> res!284768 e!280250)))

(assert (=> d!75971 (= res!284768 ((_ is Nil!9051) (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85)))))))

(assert (=> d!75971 (= (forall!198 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85))) p!166) e!280250)))

(declare-fun b!477013 () Bool)

(declare-fun e!280251 () Bool)

(assert (=> b!477013 (= e!280250 e!280251)))

(declare-fun res!284769 () Bool)

(assert (=> b!477013 (=> (not res!284769) (not e!280251))))

(assert (=> b!477013 (= res!284769 (dynLambda!945 p!166 (h!9906 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85))))))))

(declare-fun b!477014 () Bool)

(assert (=> b!477014 (= e!280251 (forall!198 (t!15120 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85)))) p!166))))

(assert (= (and d!75971 (not res!284768)) b!477013))

(assert (= (and b!477013 res!284769) b!477014))

(declare-fun b_lambda!10587 () Bool)

(assert (=> (not b_lambda!10587) (not b!477013)))

(declare-fun t!15155 () Bool)

(declare-fun tb!4057 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15155) tb!4057))

(declare-fun result!7625 () Bool)

(assert (=> tb!4057 (= result!7625 true)))

(assert (=> b!477013 t!15155))

(declare-fun b_and!20759 () Bool)

(assert (= b_and!20747 (and (=> t!15155 result!7625) b_and!20759)))

(declare-fun m!459369 () Bool)

(assert (=> b!477013 m!459369))

(declare-fun m!459371 () Bool)

(assert (=> b!477014 m!459371))

(assert (=> d!75935 d!75971))

(declare-fun d!75973 () Bool)

(declare-fun e!280252 () Bool)

(assert (=> d!75973 e!280252))

(declare-fun res!284770 () Bool)

(assert (=> d!75973 (=> (not res!284770) (not e!280252))))

(declare-fun lt!217422 () ListLongMap!7907)

(assert (=> d!75973 (= res!284770 (contains!2568 lt!217422 (_1!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun lt!217420 () List!9054)

(assert (=> d!75973 (= lt!217422 (ListLongMap!7908 lt!217420))))

(declare-fun lt!217421 () Unit!14036)

(declare-fun lt!217423 () Unit!14036)

(assert (=> d!75973 (= lt!217421 lt!217423)))

(assert (=> d!75973 (= (getValueByKey!386 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85))) (Some!391 (_2!4508 (tuple2!8995 a!501 b!85))))))

(assert (=> d!75973 (= lt!217423 (lemmaContainsTupThenGetReturnValue!208 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))))))

(assert (=> d!75973 (= lt!217420 (insertStrictlySorted!211 (toList!3969 lt!217351) (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))))))

(assert (=> d!75973 (= (+!1766 lt!217351 (tuple2!8995 a!501 b!85)) lt!217422)))

(declare-fun b!477015 () Bool)

(declare-fun res!284771 () Bool)

(assert (=> b!477015 (=> (not res!284771) (not e!280252))))

(assert (=> b!477015 (= res!284771 (= (getValueByKey!386 (toList!3969 lt!217422) (_1!4508 (tuple2!8995 a!501 b!85))) (Some!391 (_2!4508 (tuple2!8995 a!501 b!85)))))))

(declare-fun b!477016 () Bool)

(assert (=> b!477016 (= e!280252 (contains!2569 (toList!3969 lt!217422) (tuple2!8995 a!501 b!85)))))

(assert (= (and d!75973 res!284770) b!477015))

(assert (= (and b!477015 res!284771) b!477016))

(declare-fun m!459373 () Bool)

(assert (=> d!75973 m!459373))

(declare-fun m!459375 () Bool)

(assert (=> d!75973 m!459375))

(declare-fun m!459377 () Bool)

(assert (=> d!75973 m!459377))

(declare-fun m!459379 () Bool)

(assert (=> d!75973 m!459379))

(declare-fun m!459381 () Bool)

(assert (=> b!477015 m!459381))

(declare-fun m!459383 () Bool)

(assert (=> b!477016 m!459383))

(assert (=> d!75935 d!75973))

(declare-fun d!75975 () Bool)

(assert (=> d!75975 (forall!198 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85))) p!166)))

(assert (=> d!75975 true))

(declare-fun _$30!87 () Unit!14036)

(assert (=> d!75975 (= (choose!1361 lt!217351 p!166 a!501 b!85) _$30!87)))

(declare-fun bs!15168 () Bool)

(assert (= bs!15168 d!75975))

(assert (=> bs!15168 m!459259))

(assert (=> bs!15168 m!459261))

(assert (=> d!75935 d!75975))

(assert (=> d!75935 d!75949))

(declare-fun d!75977 () Bool)

(declare-fun res!284772 () Bool)

(declare-fun e!280253 () Bool)

(assert (=> d!75977 (=> res!284772 e!280253)))

(assert (=> d!75977 (= res!284772 ((_ is Nil!9051) (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352)))))))

(assert (=> d!75977 (= (forall!198 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352))) p!166) e!280253)))

(declare-fun b!477018 () Bool)

(declare-fun e!280254 () Bool)

(assert (=> b!477018 (= e!280253 e!280254)))

(declare-fun res!284773 () Bool)

(assert (=> b!477018 (=> (not res!284773) (not e!280254))))

(assert (=> b!477018 (= res!284773 (dynLambda!945 p!166 (h!9906 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352))))))))

(declare-fun b!477019 () Bool)

(assert (=> b!477019 (= e!280254 (forall!198 (t!15120 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352)))) p!166))))

(assert (= (and d!75977 (not res!284772)) b!477018))

(assert (= (and b!477018 res!284773) b!477019))

(declare-fun b_lambda!10589 () Bool)

(assert (=> (not b_lambda!10589) (not b!477018)))

(declare-fun t!15157 () Bool)

(declare-fun tb!4059 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15157) tb!4059))

(declare-fun result!7627 () Bool)

(assert (=> tb!4059 (= result!7627 true)))

(assert (=> b!477018 t!15157))

(declare-fun b_and!20761 () Bool)

(assert (= b_and!20759 (and (=> t!15157 result!7627) b_and!20761)))

(declare-fun m!459385 () Bool)

(assert (=> b!477018 m!459385))

(declare-fun m!459387 () Bool)

(assert (=> b!477019 m!459387))

(assert (=> b!476933 d!75977))

(declare-fun d!75979 () Bool)

(declare-fun res!284774 () Bool)

(declare-fun e!280255 () Bool)

(assert (=> d!75979 (=> res!284774 e!280255)))

(assert (=> d!75979 (= res!284774 ((_ is Nil!9051) (t!15120 (toList!3969 lm!215))))))

(assert (=> d!75979 (= (forall!198 (t!15120 (toList!3969 lm!215)) p!166) e!280255)))

(declare-fun b!477020 () Bool)

(declare-fun e!280256 () Bool)

(assert (=> b!477020 (= e!280255 e!280256)))

(declare-fun res!284775 () Bool)

(assert (=> b!477020 (=> (not res!284775) (not e!280256))))

(assert (=> b!477020 (= res!284775 (dynLambda!945 p!166 (h!9906 (t!15120 (toList!3969 lm!215)))))))

(declare-fun b!477021 () Bool)

(assert (=> b!477021 (= e!280256 (forall!198 (t!15120 (t!15120 (toList!3969 lm!215))) p!166))))

(assert (= (and d!75979 (not res!284774)) b!477020))

(assert (= (and b!477020 res!284775) b!477021))

(declare-fun b_lambda!10591 () Bool)

(assert (=> (not b_lambda!10591) (not b!477020)))

(declare-fun t!15159 () Bool)

(declare-fun tb!4061 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15159) tb!4061))

(declare-fun result!7629 () Bool)

(assert (=> tb!4061 (= result!7629 true)))

(assert (=> b!477020 t!15159))

(declare-fun b_and!20763 () Bool)

(assert (= b_and!20761 (and (=> t!15159 result!7629) b_and!20763)))

(declare-fun m!459389 () Bool)

(assert (=> b!477020 m!459389))

(declare-fun m!459391 () Bool)

(assert (=> b!477021 m!459391))

(assert (=> b!476959 d!75979))

(declare-fun d!75981 () Bool)

(declare-fun lt!217426 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!206 (List!9054) (InoxSet tuple2!8994))

(assert (=> d!75981 (= lt!217426 (select (content!206 (toList!3969 lt!217391)) lt!217352))))

(declare-fun e!280261 () Bool)

(assert (=> d!75981 (= lt!217426 e!280261)))

(declare-fun res!284780 () Bool)

(assert (=> d!75981 (=> (not res!284780) (not e!280261))))

(assert (=> d!75981 (= res!284780 ((_ is Cons!9050) (toList!3969 lt!217391)))))

(assert (=> d!75981 (= (contains!2569 (toList!3969 lt!217391) lt!217352) lt!217426)))

(declare-fun b!477026 () Bool)

(declare-fun e!280262 () Bool)

(assert (=> b!477026 (= e!280261 e!280262)))

(declare-fun res!284781 () Bool)

(assert (=> b!477026 (=> res!284781 e!280262)))

(assert (=> b!477026 (= res!284781 (= (h!9906 (toList!3969 lt!217391)) lt!217352))))

(declare-fun b!477027 () Bool)

(assert (=> b!477027 (= e!280262 (contains!2569 (t!15120 (toList!3969 lt!217391)) lt!217352))))

(assert (= (and d!75981 res!284780) b!477026))

(assert (= (and b!477026 (not res!284781)) b!477027))

(declare-fun m!459393 () Bool)

(assert (=> d!75981 m!459393))

(declare-fun m!459395 () Bool)

(assert (=> d!75981 m!459395))

(declare-fun m!459397 () Bool)

(assert (=> b!477027 m!459397))

(assert (=> b!476957 d!75981))

(declare-fun d!75983 () Bool)

(declare-fun res!284782 () Bool)

(declare-fun e!280263 () Bool)

(assert (=> d!75983 (=> res!284782 e!280263)))

(assert (=> d!75983 (= res!284782 ((_ is Nil!9051) (t!15120 (toList!3969 (+!1766 lm!215 lt!217352)))))))

(assert (=> d!75983 (= (forall!198 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352))) p!166) e!280263)))

(declare-fun b!477028 () Bool)

(declare-fun e!280264 () Bool)

(assert (=> b!477028 (= e!280263 e!280264)))

(declare-fun res!284783 () Bool)

(assert (=> b!477028 (=> (not res!284783) (not e!280264))))

(assert (=> b!477028 (= res!284783 (dynLambda!945 p!166 (h!9906 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352))))))))

(declare-fun b!477029 () Bool)

(assert (=> b!477029 (= e!280264 (forall!198 (t!15120 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352)))) p!166))))

(assert (= (and d!75983 (not res!284782)) b!477028))

(assert (= (and b!477028 res!284783) b!477029))

(declare-fun b_lambda!10593 () Bool)

(assert (=> (not b_lambda!10593) (not b!477028)))

(declare-fun t!15161 () Bool)

(declare-fun tb!4063 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15161) tb!4063))

(declare-fun result!7631 () Bool)

(assert (=> tb!4063 (= result!7631 true)))

(assert (=> b!477028 t!15161))

(declare-fun b_and!20765 () Bool)

(assert (= b_and!20763 (and (=> t!15161 result!7631) b_and!20765)))

(declare-fun m!459399 () Bool)

(assert (=> b!477028 m!459399))

(declare-fun m!459401 () Bool)

(assert (=> b!477029 m!459401))

(assert (=> b!476929 d!75983))

(declare-fun d!75985 () Bool)

(declare-fun e!280271 () Bool)

(assert (=> d!75985 e!280271))

(declare-fun res!284788 () Bool)

(assert (=> d!75985 (=> res!284788 e!280271)))

(declare-fun lt!217435 () Bool)

(assert (=> d!75985 (= res!284788 (not lt!217435))))

(declare-fun lt!217437 () Bool)

(assert (=> d!75985 (= lt!217435 lt!217437)))

(declare-fun lt!217438 () Unit!14036)

(declare-fun e!280272 () Unit!14036)

(assert (=> d!75985 (= lt!217438 e!280272)))

(declare-fun c!57382 () Bool)

(assert (=> d!75985 (= c!57382 lt!217437)))

(declare-fun containsKey!348 (List!9054 (_ BitVec 64)) Bool)

(assert (=> d!75985 (= lt!217437 (containsKey!348 (toList!3969 lt!217391) (_1!4508 lt!217352)))))

(assert (=> d!75985 (= (contains!2568 lt!217391 (_1!4508 lt!217352)) lt!217435)))

(declare-fun b!477038 () Bool)

(declare-fun lt!217436 () Unit!14036)

(assert (=> b!477038 (= e!280272 lt!217436)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!296 (List!9054 (_ BitVec 64)) Unit!14036)

(assert (=> b!477038 (= lt!217436 (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3969 lt!217391) (_1!4508 lt!217352)))))

(declare-fun isDefined!297 (Option!392) Bool)

(assert (=> b!477038 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352)))))

(declare-fun b!477039 () Bool)

(declare-fun Unit!14040 () Unit!14036)

(assert (=> b!477039 (= e!280272 Unit!14040)))

(declare-fun b!477040 () Bool)

(assert (=> b!477040 (= e!280271 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352))))))

(assert (= (and d!75985 c!57382) b!477038))

(assert (= (and d!75985 (not c!57382)) b!477039))

(assert (= (and d!75985 (not res!284788)) b!477040))

(declare-fun m!459407 () Bool)

(assert (=> d!75985 m!459407))

(declare-fun m!459409 () Bool)

(assert (=> b!477038 m!459409))

(assert (=> b!477038 m!459275))

(assert (=> b!477038 m!459275))

(declare-fun m!459411 () Bool)

(assert (=> b!477038 m!459411))

(assert (=> b!477040 m!459275))

(assert (=> b!477040 m!459275))

(assert (=> b!477040 m!459411))

(assert (=> d!75941 d!75985))

(declare-fun b!477046 () Bool)

(declare-fun e!280274 () Option!392)

(assert (=> b!477046 (= e!280274 None!390)))

(declare-fun b!477043 () Bool)

(declare-fun e!280273 () Option!392)

(assert (=> b!477043 (= e!280273 (Some!391 (_2!4508 (h!9906 lt!217389))))))

(declare-fun b!477045 () Bool)

(assert (=> b!477045 (= e!280274 (getValueByKey!386 (t!15120 lt!217389) (_1!4508 lt!217352)))))

(declare-fun d!75993 () Bool)

(declare-fun c!57383 () Bool)

(assert (=> d!75993 (= c!57383 (and ((_ is Cons!9050) lt!217389) (= (_1!4508 (h!9906 lt!217389)) (_1!4508 lt!217352))))))

(assert (=> d!75993 (= (getValueByKey!386 lt!217389 (_1!4508 lt!217352)) e!280273)))

(declare-fun b!477044 () Bool)

(assert (=> b!477044 (= e!280273 e!280274)))

(declare-fun c!57384 () Bool)

(assert (=> b!477044 (= c!57384 (and ((_ is Cons!9050) lt!217389) (not (= (_1!4508 (h!9906 lt!217389)) (_1!4508 lt!217352)))))))

(assert (= (and d!75993 c!57383) b!477043))

(assert (= (and d!75993 (not c!57383)) b!477044))

(assert (= (and b!477044 c!57384) b!477045))

(assert (= (and b!477044 (not c!57384)) b!477046))

(declare-fun m!459413 () Bool)

(assert (=> b!477045 m!459413))

(assert (=> d!75941 d!75993))

(declare-fun d!75995 () Bool)

(assert (=> d!75995 (= (getValueByKey!386 lt!217389 (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352)))))

(declare-fun lt!217441 () Unit!14036)

(declare-fun choose!1364 (List!9054 (_ BitVec 64) B!1054) Unit!14036)

(assert (=> d!75995 (= lt!217441 (choose!1364 lt!217389 (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun e!280287 () Bool)

(assert (=> d!75995 e!280287))

(declare-fun res!284797 () Bool)

(assert (=> d!75995 (=> (not res!284797) (not e!280287))))

(assert (=> d!75995 (= res!284797 (isStrictlySorted!388 lt!217389))))

(assert (=> d!75995 (= (lemmaContainsTupThenGetReturnValue!208 lt!217389 (_1!4508 lt!217352) (_2!4508 lt!217352)) lt!217441)))

(declare-fun b!477065 () Bool)

(declare-fun res!284798 () Bool)

(assert (=> b!477065 (=> (not res!284798) (not e!280287))))

(assert (=> b!477065 (= res!284798 (containsKey!348 lt!217389 (_1!4508 lt!217352)))))

(declare-fun b!477066 () Bool)

(assert (=> b!477066 (= e!280287 (contains!2569 lt!217389 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(assert (= (and d!75995 res!284797) b!477065))

(assert (= (and b!477065 res!284798) b!477066))

(assert (=> d!75995 m!459269))

(declare-fun m!459425 () Bool)

(assert (=> d!75995 m!459425))

(declare-fun m!459427 () Bool)

(assert (=> d!75995 m!459427))

(declare-fun m!459429 () Bool)

(assert (=> b!477065 m!459429))

(declare-fun m!459431 () Bool)

(assert (=> b!477066 m!459431))

(assert (=> d!75941 d!75995))

(declare-fun bm!30734 () Bool)

(declare-fun call!30738 () List!9054)

(declare-fun call!30737 () List!9054)

(assert (=> bm!30734 (= call!30738 call!30737)))

(declare-fun b!477108 () Bool)

(declare-fun e!280316 () List!9054)

(declare-fun e!280318 () List!9054)

(assert (=> b!477108 (= e!280316 e!280318)))

(declare-fun c!57404 () Bool)

(assert (=> b!477108 (= c!57404 (and ((_ is Cons!9050) (toList!3969 lt!217351)) (= (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 lt!217352))))))

(declare-fun bm!30735 () Bool)

(declare-fun call!30739 () List!9054)

(assert (=> bm!30735 (= call!30739 call!30738)))

(declare-fun b!477109 () Bool)

(assert (=> b!477109 (= e!280318 call!30738)))

(declare-fun b!477110 () Bool)

(declare-fun e!280319 () List!9054)

(assert (=> b!477110 (= e!280319 call!30739)))

(declare-fun b!477112 () Bool)

(assert (=> b!477112 (= e!280316 call!30737)))

(declare-fun b!477113 () Bool)

(declare-fun e!280315 () Bool)

(declare-fun lt!217451 () List!9054)

(assert (=> b!477113 (= e!280315 (contains!2569 lt!217451 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477114 () Bool)

(assert (=> b!477114 (= e!280319 call!30739)))

(declare-fun b!477115 () Bool)

(declare-fun e!280317 () List!9054)

(assert (=> b!477115 (= e!280317 (insertStrictlySorted!211 (t!15120 (toList!3969 lt!217351)) (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun b!477116 () Bool)

(declare-fun c!57401 () Bool)

(assert (=> b!477116 (= e!280317 (ite c!57404 (t!15120 (toList!3969 lt!217351)) (ite c!57401 (Cons!9050 (h!9906 (toList!3969 lt!217351)) (t!15120 (toList!3969 lt!217351))) Nil!9051)))))

(declare-fun b!477111 () Bool)

(declare-fun res!284819 () Bool)

(assert (=> b!477111 (=> (not res!284819) (not e!280315))))

(assert (=> b!477111 (= res!284819 (containsKey!348 lt!217451 (_1!4508 lt!217352)))))

(declare-fun d!76003 () Bool)

(assert (=> d!76003 e!280315))

(declare-fun res!284820 () Bool)

(assert (=> d!76003 (=> (not res!284820) (not e!280315))))

(assert (=> d!76003 (= res!284820 (isStrictlySorted!388 lt!217451))))

(assert (=> d!76003 (= lt!217451 e!280316)))

(declare-fun c!57402 () Bool)

(assert (=> d!76003 (= c!57402 (and ((_ is Cons!9050) (toList!3969 lt!217351)) (bvslt (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 lt!217352))))))

(assert (=> d!76003 (isStrictlySorted!388 (toList!3969 lt!217351))))

(assert (=> d!76003 (= (insertStrictlySorted!211 (toList!3969 lt!217351) (_1!4508 lt!217352) (_2!4508 lt!217352)) lt!217451)))

(declare-fun bm!30736 () Bool)

(declare-fun $colon$colon!110 (List!9054 tuple2!8994) List!9054)

(assert (=> bm!30736 (= call!30737 ($colon$colon!110 e!280317 (ite c!57402 (h!9906 (toList!3969 lt!217351)) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352)))))))

(declare-fun c!57403 () Bool)

(assert (=> bm!30736 (= c!57403 c!57402)))

(declare-fun b!477117 () Bool)

(assert (=> b!477117 (= c!57401 (and ((_ is Cons!9050) (toList!3969 lt!217351)) (bvsgt (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 lt!217352))))))

(assert (=> b!477117 (= e!280318 e!280319)))

(assert (= (and d!76003 c!57402) b!477112))

(assert (= (and d!76003 (not c!57402)) b!477108))

(assert (= (and b!477108 c!57404) b!477109))

(assert (= (and b!477108 (not c!57404)) b!477117))

(assert (= (and b!477117 c!57401) b!477114))

(assert (= (and b!477117 (not c!57401)) b!477110))

(assert (= (or b!477114 b!477110) bm!30735))

(assert (= (or b!477109 bm!30735) bm!30734))

(assert (= (or b!477112 bm!30734) bm!30736))

(assert (= (and bm!30736 c!57403) b!477115))

(assert (= (and bm!30736 (not c!57403)) b!477116))

(assert (= (and d!76003 res!284820) b!477111))

(assert (= (and b!477111 res!284819) b!477113))

(declare-fun m!459459 () Bool)

(assert (=> b!477115 m!459459))

(declare-fun m!459461 () Bool)

(assert (=> d!76003 m!459461))

(declare-fun m!459463 () Bool)

(assert (=> d!76003 m!459463))

(declare-fun m!459465 () Bool)

(assert (=> b!477111 m!459465))

(declare-fun m!459467 () Bool)

(assert (=> bm!30736 m!459467))

(declare-fun m!459469 () Bool)

(assert (=> b!477113 m!459469))

(assert (=> d!75941 d!76003))

(declare-fun d!76019 () Bool)

(assert (=> d!76019 (= (tail!130 (toList!3969 lm!215)) (t!15120 (toList!3969 lm!215)))))

(assert (=> d!75951 d!76019))

(declare-fun d!76021 () Bool)

(declare-fun res!284827 () Bool)

(declare-fun e!280328 () Bool)

(assert (=> d!76021 (=> res!284827 e!280328)))

(assert (=> d!76021 (= res!284827 (or ((_ is Nil!9051) (toList!3969 lm!215)) ((_ is Nil!9051) (t!15120 (toList!3969 lm!215)))))))

(assert (=> d!76021 (= (isStrictlySorted!388 (toList!3969 lm!215)) e!280328)))

(declare-fun b!477128 () Bool)

(declare-fun e!280329 () Bool)

(assert (=> b!477128 (= e!280328 e!280329)))

(declare-fun res!284828 () Bool)

(assert (=> b!477128 (=> (not res!284828) (not e!280329))))

(assert (=> b!477128 (= res!284828 (bvslt (_1!4508 (h!9906 (toList!3969 lm!215))) (_1!4508 (h!9906 (t!15120 (toList!3969 lm!215))))))))

(declare-fun b!477129 () Bool)

(assert (=> b!477129 (= e!280329 (isStrictlySorted!388 (t!15120 (toList!3969 lm!215))))))

(assert (= (and d!76021 (not res!284827)) b!477128))

(assert (= (and b!477128 res!284828) b!477129))

(declare-fun m!459471 () Bool)

(assert (=> b!477129 m!459471))

(assert (=> d!75945 d!76021))

(declare-fun d!76023 () Bool)

(declare-fun e!280330 () Bool)

(assert (=> d!76023 e!280330))

(declare-fun res!284829 () Bool)

(assert (=> d!76023 (=> res!284829 e!280330)))

(declare-fun lt!217460 () Bool)

(assert (=> d!76023 (= res!284829 (not lt!217460))))

(declare-fun lt!217462 () Bool)

(assert (=> d!76023 (= lt!217460 lt!217462)))

(declare-fun lt!217463 () Unit!14036)

(declare-fun e!280331 () Unit!14036)

(assert (=> d!76023 (= lt!217463 e!280331)))

(declare-fun c!57407 () Bool)

(assert (=> d!76023 (= c!57407 lt!217462)))

(assert (=> d!76023 (= lt!217462 (containsKey!348 (toList!3969 lt!217373) (_1!4508 lt!217352)))))

(assert (=> d!76023 (= (contains!2568 lt!217373 (_1!4508 lt!217352)) lt!217460)))

(declare-fun b!477130 () Bool)

(declare-fun lt!217461 () Unit!14036)

(assert (=> b!477130 (= e!280331 lt!217461)))

(assert (=> b!477130 (= lt!217461 (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3969 lt!217373) (_1!4508 lt!217352)))))

(assert (=> b!477130 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352)))))

(declare-fun b!477131 () Bool)

(declare-fun Unit!14042 () Unit!14036)

(assert (=> b!477131 (= e!280331 Unit!14042)))

(declare-fun b!477132 () Bool)

(assert (=> b!477132 (= e!280330 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352))))))

(assert (= (and d!76023 c!57407) b!477130))

(assert (= (and d!76023 (not c!57407)) b!477131))

(assert (= (and d!76023 (not res!284829)) b!477132))

(declare-fun m!459473 () Bool)

(assert (=> d!76023 m!459473))

(declare-fun m!459475 () Bool)

(assert (=> b!477130 m!459475))

(assert (=> b!477130 m!459243))

(assert (=> b!477130 m!459243))

(declare-fun m!459477 () Bool)

(assert (=> b!477130 m!459477))

(assert (=> b!477132 m!459243))

(assert (=> b!477132 m!459243))

(assert (=> b!477132 m!459477))

(assert (=> d!75923 d!76023))

(declare-fun b!477139 () Bool)

(declare-fun e!280335 () Option!392)

(assert (=> b!477139 (= e!280335 None!390)))

(declare-fun b!477136 () Bool)

(declare-fun e!280334 () Option!392)

(assert (=> b!477136 (= e!280334 (Some!391 (_2!4508 (h!9906 lt!217371))))))

(declare-fun b!477138 () Bool)

(assert (=> b!477138 (= e!280335 (getValueByKey!386 (t!15120 lt!217371) (_1!4508 lt!217352)))))

(declare-fun d!76025 () Bool)

(declare-fun c!57409 () Bool)

(assert (=> d!76025 (= c!57409 (and ((_ is Cons!9050) lt!217371) (= (_1!4508 (h!9906 lt!217371)) (_1!4508 lt!217352))))))

(assert (=> d!76025 (= (getValueByKey!386 lt!217371 (_1!4508 lt!217352)) e!280334)))

(declare-fun b!477137 () Bool)

(assert (=> b!477137 (= e!280334 e!280335)))

(declare-fun c!57410 () Bool)

(assert (=> b!477137 (= c!57410 (and ((_ is Cons!9050) lt!217371) (not (= (_1!4508 (h!9906 lt!217371)) (_1!4508 lt!217352)))))))

(assert (= (and d!76025 c!57409) b!477136))

(assert (= (and d!76025 (not c!57409)) b!477137))

(assert (= (and b!477137 c!57410) b!477138))

(assert (= (and b!477137 (not c!57410)) b!477139))

(declare-fun m!459485 () Bool)

(assert (=> b!477138 m!459485))

(assert (=> d!75923 d!76025))

(declare-fun d!76027 () Bool)

(assert (=> d!76027 (= (getValueByKey!386 lt!217371 (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352)))))

(declare-fun lt!217468 () Unit!14036)

(assert (=> d!76027 (= lt!217468 (choose!1364 lt!217371 (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun e!280336 () Bool)

(assert (=> d!76027 e!280336))

(declare-fun res!284831 () Bool)

(assert (=> d!76027 (=> (not res!284831) (not e!280336))))

(assert (=> d!76027 (= res!284831 (isStrictlySorted!388 lt!217371))))

(assert (=> d!76027 (= (lemmaContainsTupThenGetReturnValue!208 lt!217371 (_1!4508 lt!217352) (_2!4508 lt!217352)) lt!217468)))

(declare-fun b!477140 () Bool)

(declare-fun res!284832 () Bool)

(assert (=> b!477140 (=> (not res!284832) (not e!280336))))

(assert (=> b!477140 (= res!284832 (containsKey!348 lt!217371 (_1!4508 lt!217352)))))

(declare-fun b!477141 () Bool)

(assert (=> b!477141 (= e!280336 (contains!2569 lt!217371 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(assert (= (and d!76027 res!284831) b!477140))

(assert (= (and b!477140 res!284832) b!477141))

(assert (=> d!76027 m!459237))

(declare-fun m!459487 () Bool)

(assert (=> d!76027 m!459487))

(declare-fun m!459489 () Bool)

(assert (=> d!76027 m!459489))

(declare-fun m!459491 () Bool)

(assert (=> b!477140 m!459491))

(declare-fun m!459495 () Bool)

(assert (=> b!477141 m!459495))

(assert (=> d!75923 d!76027))

(declare-fun bm!30737 () Bool)

(declare-fun call!30741 () List!9054)

(declare-fun call!30740 () List!9054)

(assert (=> bm!30737 (= call!30741 call!30740)))

(declare-fun b!477146 () Bool)

(declare-fun e!280340 () List!9054)

(declare-fun e!280342 () List!9054)

(assert (=> b!477146 (= e!280340 e!280342)))

(declare-fun c!57416 () Bool)

(assert (=> b!477146 (= c!57416 (and ((_ is Cons!9050) (toList!3969 lm!215)) (= (_1!4508 (h!9906 (toList!3969 lm!215))) (_1!4508 lt!217352))))))

(declare-fun bm!30738 () Bool)

(declare-fun call!30742 () List!9054)

(assert (=> bm!30738 (= call!30742 call!30741)))

(declare-fun b!477147 () Bool)

(assert (=> b!477147 (= e!280342 call!30741)))

(declare-fun b!477148 () Bool)

(declare-fun e!280343 () List!9054)

(assert (=> b!477148 (= e!280343 call!30742)))

(declare-fun b!477150 () Bool)

(assert (=> b!477150 (= e!280340 call!30740)))

(declare-fun b!477151 () Bool)

(declare-fun e!280339 () Bool)

(declare-fun lt!217469 () List!9054)

(assert (=> b!477151 (= e!280339 (contains!2569 lt!217469 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477152 () Bool)

(assert (=> b!477152 (= e!280343 call!30742)))

(declare-fun b!477153 () Bool)

(declare-fun e!280341 () List!9054)

(assert (=> b!477153 (= e!280341 (insertStrictlySorted!211 (t!15120 (toList!3969 lm!215)) (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun c!57413 () Bool)

(declare-fun b!477154 () Bool)

(assert (=> b!477154 (= e!280341 (ite c!57416 (t!15120 (toList!3969 lm!215)) (ite c!57413 (Cons!9050 (h!9906 (toList!3969 lm!215)) (t!15120 (toList!3969 lm!215))) Nil!9051)))))

(declare-fun b!477149 () Bool)

(declare-fun res!284833 () Bool)

(assert (=> b!477149 (=> (not res!284833) (not e!280339))))

(assert (=> b!477149 (= res!284833 (containsKey!348 lt!217469 (_1!4508 lt!217352)))))

(declare-fun d!76033 () Bool)

(assert (=> d!76033 e!280339))

(declare-fun res!284834 () Bool)

(assert (=> d!76033 (=> (not res!284834) (not e!280339))))

(assert (=> d!76033 (= res!284834 (isStrictlySorted!388 lt!217469))))

(assert (=> d!76033 (= lt!217469 e!280340)))

(declare-fun c!57414 () Bool)

(assert (=> d!76033 (= c!57414 (and ((_ is Cons!9050) (toList!3969 lm!215)) (bvslt (_1!4508 (h!9906 (toList!3969 lm!215))) (_1!4508 lt!217352))))))

(assert (=> d!76033 (isStrictlySorted!388 (toList!3969 lm!215))))

(assert (=> d!76033 (= (insertStrictlySorted!211 (toList!3969 lm!215) (_1!4508 lt!217352) (_2!4508 lt!217352)) lt!217469)))

(declare-fun bm!30739 () Bool)

(assert (=> bm!30739 (= call!30740 ($colon$colon!110 e!280341 (ite c!57414 (h!9906 (toList!3969 lm!215)) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352)))))))

(declare-fun c!57415 () Bool)

(assert (=> bm!30739 (= c!57415 c!57414)))

(declare-fun b!477155 () Bool)

(assert (=> b!477155 (= c!57413 (and ((_ is Cons!9050) (toList!3969 lm!215)) (bvsgt (_1!4508 (h!9906 (toList!3969 lm!215))) (_1!4508 lt!217352))))))

(assert (=> b!477155 (= e!280342 e!280343)))

(assert (= (and d!76033 c!57414) b!477150))

(assert (= (and d!76033 (not c!57414)) b!477146))

(assert (= (and b!477146 c!57416) b!477147))

(assert (= (and b!477146 (not c!57416)) b!477155))

(assert (= (and b!477155 c!57413) b!477152))

(assert (= (and b!477155 (not c!57413)) b!477148))

(assert (= (or b!477152 b!477148) bm!30738))

(assert (= (or b!477147 bm!30738) bm!30737))

(assert (= (or b!477150 bm!30737) bm!30739))

(assert (= (and bm!30739 c!57415) b!477153))

(assert (= (and bm!30739 (not c!57415)) b!477154))

(assert (= (and d!76033 res!284834) b!477149))

(assert (= (and b!477149 res!284833) b!477151))

(declare-fun m!459497 () Bool)

(assert (=> b!477153 m!459497))

(declare-fun m!459499 () Bool)

(assert (=> d!76033 m!459499))

(assert (=> d!76033 m!459295))

(declare-fun m!459501 () Bool)

(assert (=> b!477149 m!459501))

(declare-fun m!459503 () Bool)

(assert (=> bm!30739 m!459503))

(declare-fun m!459505 () Bool)

(assert (=> b!477151 m!459505))

(assert (=> d!75923 d!76033))

(declare-fun b!477159 () Bool)

(declare-fun e!280345 () Option!392)

(assert (=> b!477159 (= e!280345 None!390)))

(declare-fun b!477156 () Bool)

(declare-fun e!280344 () Option!392)

(assert (=> b!477156 (= e!280344 (Some!391 (_2!4508 (h!9906 (toList!3969 lt!217373)))))))

(declare-fun b!477158 () Bool)

(assert (=> b!477158 (= e!280345 (getValueByKey!386 (t!15120 (toList!3969 lt!217373)) (_1!4508 lt!217352)))))

(declare-fun d!76035 () Bool)

(declare-fun c!57417 () Bool)

(assert (=> d!76035 (= c!57417 (and ((_ is Cons!9050) (toList!3969 lt!217373)) (= (_1!4508 (h!9906 (toList!3969 lt!217373))) (_1!4508 lt!217352))))))

(assert (=> d!76035 (= (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352)) e!280344)))

(declare-fun b!477157 () Bool)

(assert (=> b!477157 (= e!280344 e!280345)))

(declare-fun c!57418 () Bool)

(assert (=> b!477157 (= c!57418 (and ((_ is Cons!9050) (toList!3969 lt!217373)) (not (= (_1!4508 (h!9906 (toList!3969 lt!217373))) (_1!4508 lt!217352)))))))

(assert (= (and d!76035 c!57417) b!477156))

(assert (= (and d!76035 (not c!57417)) b!477157))

(assert (= (and b!477157 c!57418) b!477158))

(assert (= (and b!477157 (not c!57418)) b!477159))

(declare-fun m!459507 () Bool)

(assert (=> b!477158 m!459507))

(assert (=> b!476940 d!76035))

(declare-fun d!76037 () Bool)

(assert (=> d!76037 (= (isEmpty!604 (toList!3969 lm!215)) ((_ is Nil!9051) (toList!3969 lm!215)))))

(assert (=> d!75911 d!76037))

(declare-fun d!76039 () Bool)

(declare-fun res!284835 () Bool)

(declare-fun e!280346 () Bool)

(assert (=> d!76039 (=> res!284835 e!280346)))

(assert (=> d!76039 (= res!284835 ((_ is Nil!9051) (t!15120 (toList!3969 lt!217351))))))

(assert (=> d!76039 (= (forall!198 (t!15120 (toList!3969 lt!217351)) p!166) e!280346)))

(declare-fun b!477160 () Bool)

(declare-fun e!280347 () Bool)

(assert (=> b!477160 (= e!280346 e!280347)))

(declare-fun res!284836 () Bool)

(assert (=> b!477160 (=> (not res!284836) (not e!280347))))

(assert (=> b!477160 (= res!284836 (dynLambda!945 p!166 (h!9906 (t!15120 (toList!3969 lt!217351)))))))

(declare-fun b!477161 () Bool)

(assert (=> b!477161 (= e!280347 (forall!198 (t!15120 (t!15120 (toList!3969 lt!217351))) p!166))))

(assert (= (and d!76039 (not res!284835)) b!477160))

(assert (= (and b!477160 res!284836) b!477161))

(declare-fun b_lambda!10603 () Bool)

(assert (=> (not b_lambda!10603) (not b!477160)))

(declare-fun t!15171 () Bool)

(declare-fun tb!4073 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15171) tb!4073))

(declare-fun result!7641 () Bool)

(assert (=> tb!4073 (= result!7641 true)))

(assert (=> b!477160 t!15171))

(declare-fun b_and!20775 () Bool)

(assert (= b_and!20765 (and (=> t!15171 result!7641) b_and!20775)))

(declare-fun m!459509 () Bool)

(assert (=> b!477160 m!459509))

(declare-fun m!459511 () Bool)

(assert (=> b!477161 m!459511))

(assert (=> b!476965 d!76039))

(declare-fun d!76043 () Bool)

(declare-fun lt!217472 () Bool)

(assert (=> d!76043 (= lt!217472 (select (content!206 (toList!3969 lt!217373)) lt!217352))))

(declare-fun e!280350 () Bool)

(assert (=> d!76043 (= lt!217472 e!280350)))

(declare-fun res!284841 () Bool)

(assert (=> d!76043 (=> (not res!284841) (not e!280350))))

(assert (=> d!76043 (= res!284841 ((_ is Cons!9050) (toList!3969 lt!217373)))))

(assert (=> d!76043 (= (contains!2569 (toList!3969 lt!217373) lt!217352) lt!217472)))

(declare-fun b!477166 () Bool)

(declare-fun e!280351 () Bool)

(assert (=> b!477166 (= e!280350 e!280351)))

(declare-fun res!284842 () Bool)

(assert (=> b!477166 (=> res!284842 e!280351)))

(assert (=> b!477166 (= res!284842 (= (h!9906 (toList!3969 lt!217373)) lt!217352))))

(declare-fun b!477167 () Bool)

(assert (=> b!477167 (= e!280351 (contains!2569 (t!15120 (toList!3969 lt!217373)) lt!217352))))

(assert (= (and d!76043 res!284841) b!477166))

(assert (= (and b!477166 (not res!284842)) b!477167))

(declare-fun m!459513 () Bool)

(assert (=> d!76043 m!459513))

(declare-fun m!459515 () Bool)

(assert (=> d!76043 m!459515))

(declare-fun m!459517 () Bool)

(assert (=> b!477167 m!459517))

(assert (=> b!476941 d!76043))

(declare-fun b!477168 () Bool)

(declare-fun e!280352 () Bool)

(declare-fun tp!42419 () Bool)

(assert (=> b!477168 (= e!280352 (and tp_is_empty!13527 tp!42419))))

(assert (=> b!476970 (= tp!42412 e!280352)))

(assert (= (and b!476970 ((_ is Cons!9050) (t!15120 (toList!3969 lm!215)))) b!477168))

(declare-fun b_lambda!10605 () Bool)

(assert (= b_lambda!10593 (or (and start!42866 b_free!12105) b_lambda!10605)))

(declare-fun b_lambda!10607 () Bool)

(assert (= b_lambda!10603 (or (and start!42866 b_free!12105) b_lambda!10607)))

(declare-fun b_lambda!10609 () Bool)

(assert (= b_lambda!10587 (or (and start!42866 b_free!12105) b_lambda!10609)))

(declare-fun b_lambda!10611 () Bool)

(assert (= b_lambda!10589 (or (and start!42866 b_free!12105) b_lambda!10611)))

(declare-fun b_lambda!10613 () Bool)

(assert (= b_lambda!10591 (or (and start!42866 b_free!12105) b_lambda!10613)))

(check-sat (not b_lambda!10611) (not b_next!12105) (not b!477038) (not b!477019) (not b_lambda!10547) (not d!75975) (not b!477014) (not b!477138) (not d!76033) (not b_lambda!10613) (not d!76043) tp_is_empty!13527 (not d!76003) (not b_lambda!10605) (not b_lambda!10549) (not b!477130) (not b!477111) (not b!477161) (not bm!30736) (not b!477132) (not b_lambda!10609) (not b!477141) (not b!477113) (not b!477011) (not b!477065) (not d!75985) (not b!477153) (not b!477158) (not b_lambda!10607) (not b!477021) (not d!75981) (not bm!30739) (not b!477151) (not d!76023) (not b!477168) (not b_lambda!10551) (not b_lambda!10553) (not b!477149) (not b!477129) (not b!477066) (not b_lambda!10521) (not b!477016) (not b!477015) (not b_lambda!10555) (not b!477027) (not d!75973) (not b!477140) b_and!20775 (not d!75995) (not b!477029) (not d!76027) (not b!477167) (not b!477115) (not b!477045) (not b!477040))
(check-sat b_and!20775 (not b_next!12105))
(get-model)

(declare-fun bm!30764 () Bool)

(declare-fun call!30768 () List!9054)

(declare-fun call!30767 () List!9054)

(assert (=> bm!30764 (= call!30768 call!30767)))

(declare-fun b!477337 () Bool)

(declare-fun e!280455 () List!9054)

(declare-fun e!280457 () List!9054)

(assert (=> b!477337 (= e!280455 e!280457)))

(declare-fun c!57473 () Bool)

(assert (=> b!477337 (= c!57473 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217351))) (= (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217351)))) (_1!4508 lt!217352))))))

(declare-fun bm!30765 () Bool)

(declare-fun call!30769 () List!9054)

(assert (=> bm!30765 (= call!30769 call!30768)))

(declare-fun b!477338 () Bool)

(assert (=> b!477338 (= e!280457 call!30768)))

(declare-fun b!477339 () Bool)

(declare-fun e!280458 () List!9054)

(assert (=> b!477339 (= e!280458 call!30769)))

(declare-fun b!477341 () Bool)

(assert (=> b!477341 (= e!280455 call!30767)))

(declare-fun b!477342 () Bool)

(declare-fun e!280454 () Bool)

(declare-fun lt!217516 () List!9054)

(assert (=> b!477342 (= e!280454 (contains!2569 lt!217516 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477343 () Bool)

(assert (=> b!477343 (= e!280458 call!30769)))

(declare-fun b!477344 () Bool)

(declare-fun e!280456 () List!9054)

(assert (=> b!477344 (= e!280456 (insertStrictlySorted!211 (t!15120 (t!15120 (toList!3969 lt!217351))) (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun b!477345 () Bool)

(declare-fun c!57470 () Bool)

(assert (=> b!477345 (= e!280456 (ite c!57473 (t!15120 (t!15120 (toList!3969 lt!217351))) (ite c!57470 (Cons!9050 (h!9906 (t!15120 (toList!3969 lt!217351))) (t!15120 (t!15120 (toList!3969 lt!217351)))) Nil!9051)))))

(declare-fun b!477340 () Bool)

(declare-fun res!284906 () Bool)

(assert (=> b!477340 (=> (not res!284906) (not e!280454))))

(assert (=> b!477340 (= res!284906 (containsKey!348 lt!217516 (_1!4508 lt!217352)))))

(declare-fun d!76101 () Bool)

(assert (=> d!76101 e!280454))

(declare-fun res!284907 () Bool)

(assert (=> d!76101 (=> (not res!284907) (not e!280454))))

(assert (=> d!76101 (= res!284907 (isStrictlySorted!388 lt!217516))))

(assert (=> d!76101 (= lt!217516 e!280455)))

(declare-fun c!57471 () Bool)

(assert (=> d!76101 (= c!57471 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217351))) (bvslt (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217351)))) (_1!4508 lt!217352))))))

(assert (=> d!76101 (isStrictlySorted!388 (t!15120 (toList!3969 lt!217351)))))

(assert (=> d!76101 (= (insertStrictlySorted!211 (t!15120 (toList!3969 lt!217351)) (_1!4508 lt!217352) (_2!4508 lt!217352)) lt!217516)))

(declare-fun bm!30766 () Bool)

(assert (=> bm!30766 (= call!30767 ($colon$colon!110 e!280456 (ite c!57471 (h!9906 (t!15120 (toList!3969 lt!217351))) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352)))))))

(declare-fun c!57472 () Bool)

(assert (=> bm!30766 (= c!57472 c!57471)))

(declare-fun b!477346 () Bool)

(assert (=> b!477346 (= c!57470 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217351))) (bvsgt (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217351)))) (_1!4508 lt!217352))))))

(assert (=> b!477346 (= e!280457 e!280458)))

(assert (= (and d!76101 c!57471) b!477341))

(assert (= (and d!76101 (not c!57471)) b!477337))

(assert (= (and b!477337 c!57473) b!477338))

(assert (= (and b!477337 (not c!57473)) b!477346))

(assert (= (and b!477346 c!57470) b!477343))

(assert (= (and b!477346 (not c!57470)) b!477339))

(assert (= (or b!477343 b!477339) bm!30765))

(assert (= (or b!477338 bm!30765) bm!30764))

(assert (= (or b!477341 bm!30764) bm!30766))

(assert (= (and bm!30766 c!57472) b!477344))

(assert (= (and bm!30766 (not c!57472)) b!477345))

(assert (= (and d!76101 res!284907) b!477340))

(assert (= (and b!477340 res!284906) b!477342))

(declare-fun m!459679 () Bool)

(assert (=> b!477344 m!459679))

(declare-fun m!459681 () Bool)

(assert (=> d!76101 m!459681))

(declare-fun m!459683 () Bool)

(assert (=> d!76101 m!459683))

(declare-fun m!459685 () Bool)

(assert (=> b!477340 m!459685))

(declare-fun m!459687 () Bool)

(assert (=> bm!30766 m!459687))

(declare-fun m!459689 () Bool)

(assert (=> b!477342 m!459689))

(assert (=> b!477115 d!76101))

(declare-fun d!76103 () Bool)

(declare-fun lt!217517 () Bool)

(assert (=> d!76103 (= lt!217517 (select (content!206 (t!15120 (toList!3969 lt!217391))) lt!217352))))

(declare-fun e!280459 () Bool)

(assert (=> d!76103 (= lt!217517 e!280459)))

(declare-fun res!284908 () Bool)

(assert (=> d!76103 (=> (not res!284908) (not e!280459))))

(assert (=> d!76103 (= res!284908 ((_ is Cons!9050) (t!15120 (toList!3969 lt!217391))))))

(assert (=> d!76103 (= (contains!2569 (t!15120 (toList!3969 lt!217391)) lt!217352) lt!217517)))

(declare-fun b!477347 () Bool)

(declare-fun e!280460 () Bool)

(assert (=> b!477347 (= e!280459 e!280460)))

(declare-fun res!284909 () Bool)

(assert (=> b!477347 (=> res!284909 e!280460)))

(assert (=> b!477347 (= res!284909 (= (h!9906 (t!15120 (toList!3969 lt!217391))) lt!217352))))

(declare-fun b!477348 () Bool)

(assert (=> b!477348 (= e!280460 (contains!2569 (t!15120 (t!15120 (toList!3969 lt!217391))) lt!217352))))

(assert (= (and d!76103 res!284908) b!477347))

(assert (= (and b!477347 (not res!284909)) b!477348))

(declare-fun m!459691 () Bool)

(assert (=> d!76103 m!459691))

(declare-fun m!459693 () Bool)

(assert (=> d!76103 m!459693))

(declare-fun m!459695 () Bool)

(assert (=> b!477348 m!459695))

(assert (=> b!477027 d!76103))

(declare-fun d!76105 () Bool)

(declare-fun res!284910 () Bool)

(declare-fun e!280461 () Bool)

(assert (=> d!76105 (=> res!284910 e!280461)))

(assert (=> d!76105 (= res!284910 ((_ is Nil!9051) (t!15120 (t!15120 (toList!3969 lm!215)))))))

(assert (=> d!76105 (= (forall!198 (t!15120 (t!15120 (toList!3969 lm!215))) p!166) e!280461)))

(declare-fun b!477349 () Bool)

(declare-fun e!280462 () Bool)

(assert (=> b!477349 (= e!280461 e!280462)))

(declare-fun res!284911 () Bool)

(assert (=> b!477349 (=> (not res!284911) (not e!280462))))

(assert (=> b!477349 (= res!284911 (dynLambda!945 p!166 (h!9906 (t!15120 (t!15120 (toList!3969 lm!215))))))))

(declare-fun b!477350 () Bool)

(assert (=> b!477350 (= e!280462 (forall!198 (t!15120 (t!15120 (t!15120 (toList!3969 lm!215)))) p!166))))

(assert (= (and d!76105 (not res!284910)) b!477349))

(assert (= (and b!477349 res!284911) b!477350))

(declare-fun b_lambda!10647 () Bool)

(assert (=> (not b_lambda!10647) (not b!477349)))

(declare-fun t!15185 () Bool)

(declare-fun tb!4087 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15185) tb!4087))

(declare-fun result!7655 () Bool)

(assert (=> tb!4087 (= result!7655 true)))

(assert (=> b!477349 t!15185))

(declare-fun b_and!20789 () Bool)

(assert (= b_and!20775 (and (=> t!15185 result!7655) b_and!20789)))

(declare-fun m!459697 () Bool)

(assert (=> b!477349 m!459697))

(declare-fun m!459699 () Bool)

(assert (=> b!477350 m!459699))

(assert (=> b!477021 d!76105))

(declare-fun d!76107 () Bool)

(declare-fun e!280463 () Bool)

(assert (=> d!76107 e!280463))

(declare-fun res!284912 () Bool)

(assert (=> d!76107 (=> res!284912 e!280463)))

(declare-fun lt!217518 () Bool)

(assert (=> d!76107 (= res!284912 (not lt!217518))))

(declare-fun lt!217520 () Bool)

(assert (=> d!76107 (= lt!217518 lt!217520)))

(declare-fun lt!217521 () Unit!14036)

(declare-fun e!280464 () Unit!14036)

(assert (=> d!76107 (= lt!217521 e!280464)))

(declare-fun c!57474 () Bool)

(assert (=> d!76107 (= c!57474 lt!217520)))

(assert (=> d!76107 (= lt!217520 (containsKey!348 (toList!3969 lt!217422) (_1!4508 (tuple2!8995 a!501 b!85))))))

(assert (=> d!76107 (= (contains!2568 lt!217422 (_1!4508 (tuple2!8995 a!501 b!85))) lt!217518)))

(declare-fun b!477351 () Bool)

(declare-fun lt!217519 () Unit!14036)

(assert (=> b!477351 (= e!280464 lt!217519)))

(assert (=> b!477351 (= lt!217519 (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3969 lt!217422) (_1!4508 (tuple2!8995 a!501 b!85))))))

(assert (=> b!477351 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217422) (_1!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun b!477352 () Bool)

(declare-fun Unit!14046 () Unit!14036)

(assert (=> b!477352 (= e!280464 Unit!14046)))

(declare-fun b!477353 () Bool)

(assert (=> b!477353 (= e!280463 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217422) (_1!4508 (tuple2!8995 a!501 b!85)))))))

(assert (= (and d!76107 c!57474) b!477351))

(assert (= (and d!76107 (not c!57474)) b!477352))

(assert (= (and d!76107 (not res!284912)) b!477353))

(declare-fun m!459701 () Bool)

(assert (=> d!76107 m!459701))

(declare-fun m!459703 () Bool)

(assert (=> b!477351 m!459703))

(assert (=> b!477351 m!459381))

(assert (=> b!477351 m!459381))

(declare-fun m!459705 () Bool)

(assert (=> b!477351 m!459705))

(assert (=> b!477353 m!459381))

(assert (=> b!477353 m!459381))

(assert (=> b!477353 m!459705))

(assert (=> d!75973 d!76107))

(declare-fun b!477357 () Bool)

(declare-fun e!280466 () Option!392)

(assert (=> b!477357 (= e!280466 None!390)))

(declare-fun b!477354 () Bool)

(declare-fun e!280465 () Option!392)

(assert (=> b!477354 (= e!280465 (Some!391 (_2!4508 (h!9906 lt!217420))))))

(declare-fun b!477356 () Bool)

(assert (=> b!477356 (= e!280466 (getValueByKey!386 (t!15120 lt!217420) (_1!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun d!76109 () Bool)

(declare-fun c!57475 () Bool)

(assert (=> d!76109 (= c!57475 (and ((_ is Cons!9050) lt!217420) (= (_1!4508 (h!9906 lt!217420)) (_1!4508 (tuple2!8995 a!501 b!85)))))))

(assert (=> d!76109 (= (getValueByKey!386 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85))) e!280465)))

(declare-fun b!477355 () Bool)

(assert (=> b!477355 (= e!280465 e!280466)))

(declare-fun c!57476 () Bool)

(assert (=> b!477355 (= c!57476 (and ((_ is Cons!9050) lt!217420) (not (= (_1!4508 (h!9906 lt!217420)) (_1!4508 (tuple2!8995 a!501 b!85))))))))

(assert (= (and d!76109 c!57475) b!477354))

(assert (= (and d!76109 (not c!57475)) b!477355))

(assert (= (and b!477355 c!57476) b!477356))

(assert (= (and b!477355 (not c!57476)) b!477357))

(declare-fun m!459707 () Bool)

(assert (=> b!477356 m!459707))

(assert (=> d!75973 d!76109))

(declare-fun d!76111 () Bool)

(assert (=> d!76111 (= (getValueByKey!386 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85))) (Some!391 (_2!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun lt!217522 () Unit!14036)

(assert (=> d!76111 (= lt!217522 (choose!1364 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun e!280467 () Bool)

(assert (=> d!76111 e!280467))

(declare-fun res!284913 () Bool)

(assert (=> d!76111 (=> (not res!284913) (not e!280467))))

(assert (=> d!76111 (= res!284913 (isStrictlySorted!388 lt!217420))))

(assert (=> d!76111 (= (lemmaContainsTupThenGetReturnValue!208 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))) lt!217522)))

(declare-fun b!477358 () Bool)

(declare-fun res!284914 () Bool)

(assert (=> b!477358 (=> (not res!284914) (not e!280467))))

(assert (=> b!477358 (= res!284914 (containsKey!348 lt!217420 (_1!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun b!477359 () Bool)

(assert (=> b!477359 (= e!280467 (contains!2569 lt!217420 (tuple2!8995 (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85)))))))

(assert (= (and d!76111 res!284913) b!477358))

(assert (= (and b!477358 res!284914) b!477359))

(assert (=> d!76111 m!459375))

(declare-fun m!459709 () Bool)

(assert (=> d!76111 m!459709))

(declare-fun m!459711 () Bool)

(assert (=> d!76111 m!459711))

(declare-fun m!459713 () Bool)

(assert (=> b!477358 m!459713))

(declare-fun m!459715 () Bool)

(assert (=> b!477359 m!459715))

(assert (=> d!75973 d!76111))

(declare-fun bm!30767 () Bool)

(declare-fun call!30771 () List!9054)

(declare-fun call!30770 () List!9054)

(assert (=> bm!30767 (= call!30771 call!30770)))

(declare-fun b!477360 () Bool)

(declare-fun e!280469 () List!9054)

(declare-fun e!280471 () List!9054)

(assert (=> b!477360 (= e!280469 e!280471)))

(declare-fun c!57480 () Bool)

(assert (=> b!477360 (= c!57480 (and ((_ is Cons!9050) (toList!3969 lt!217351)) (= (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 (tuple2!8995 a!501 b!85)))))))

(declare-fun bm!30768 () Bool)

(declare-fun call!30772 () List!9054)

(assert (=> bm!30768 (= call!30772 call!30771)))

(declare-fun b!477361 () Bool)

(assert (=> b!477361 (= e!280471 call!30771)))

(declare-fun b!477362 () Bool)

(declare-fun e!280472 () List!9054)

(assert (=> b!477362 (= e!280472 call!30772)))

(declare-fun b!477364 () Bool)

(assert (=> b!477364 (= e!280469 call!30770)))

(declare-fun b!477365 () Bool)

(declare-fun lt!217523 () List!9054)

(declare-fun e!280468 () Bool)

(assert (=> b!477365 (= e!280468 (contains!2569 lt!217523 (tuple2!8995 (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85)))))))

(declare-fun b!477366 () Bool)

(assert (=> b!477366 (= e!280472 call!30772)))

(declare-fun e!280470 () List!9054)

(declare-fun b!477367 () Bool)

(assert (=> b!477367 (= e!280470 (insertStrictlySorted!211 (t!15120 (toList!3969 lt!217351)) (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun c!57477 () Bool)

(declare-fun b!477368 () Bool)

(assert (=> b!477368 (= e!280470 (ite c!57480 (t!15120 (toList!3969 lt!217351)) (ite c!57477 (Cons!9050 (h!9906 (toList!3969 lt!217351)) (t!15120 (toList!3969 lt!217351))) Nil!9051)))))

(declare-fun b!477363 () Bool)

(declare-fun res!284915 () Bool)

(assert (=> b!477363 (=> (not res!284915) (not e!280468))))

(assert (=> b!477363 (= res!284915 (containsKey!348 lt!217523 (_1!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun d!76113 () Bool)

(assert (=> d!76113 e!280468))

(declare-fun res!284916 () Bool)

(assert (=> d!76113 (=> (not res!284916) (not e!280468))))

(assert (=> d!76113 (= res!284916 (isStrictlySorted!388 lt!217523))))

(assert (=> d!76113 (= lt!217523 e!280469)))

(declare-fun c!57478 () Bool)

(assert (=> d!76113 (= c!57478 (and ((_ is Cons!9050) (toList!3969 lt!217351)) (bvslt (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 (tuple2!8995 a!501 b!85)))))))

(assert (=> d!76113 (isStrictlySorted!388 (toList!3969 lt!217351))))

(assert (=> d!76113 (= (insertStrictlySorted!211 (toList!3969 lt!217351) (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))) lt!217523)))

(declare-fun bm!30769 () Bool)

(assert (=> bm!30769 (= call!30770 ($colon$colon!110 e!280470 (ite c!57478 (h!9906 (toList!3969 lt!217351)) (tuple2!8995 (_1!4508 (tuple2!8995 a!501 b!85)) (_2!4508 (tuple2!8995 a!501 b!85))))))))

(declare-fun c!57479 () Bool)

(assert (=> bm!30769 (= c!57479 c!57478)))

(declare-fun b!477369 () Bool)

(assert (=> b!477369 (= c!57477 (and ((_ is Cons!9050) (toList!3969 lt!217351)) (bvsgt (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 (tuple2!8995 a!501 b!85)))))))

(assert (=> b!477369 (= e!280471 e!280472)))

(assert (= (and d!76113 c!57478) b!477364))

(assert (= (and d!76113 (not c!57478)) b!477360))

(assert (= (and b!477360 c!57480) b!477361))

(assert (= (and b!477360 (not c!57480)) b!477369))

(assert (= (and b!477369 c!57477) b!477366))

(assert (= (and b!477369 (not c!57477)) b!477362))

(assert (= (or b!477366 b!477362) bm!30768))

(assert (= (or b!477361 bm!30768) bm!30767))

(assert (= (or b!477364 bm!30767) bm!30769))

(assert (= (and bm!30769 c!57479) b!477367))

(assert (= (and bm!30769 (not c!57479)) b!477368))

(assert (= (and d!76113 res!284916) b!477363))

(assert (= (and b!477363 res!284915) b!477365))

(declare-fun m!459717 () Bool)

(assert (=> b!477367 m!459717))

(declare-fun m!459719 () Bool)

(assert (=> d!76113 m!459719))

(assert (=> d!76113 m!459463))

(declare-fun m!459721 () Bool)

(assert (=> b!477363 m!459721))

(declare-fun m!459723 () Bool)

(assert (=> bm!30769 m!459723))

(declare-fun m!459725 () Bool)

(assert (=> b!477365 m!459725))

(assert (=> d!75973 d!76113))

(declare-fun d!76115 () Bool)

(declare-fun c!57483 () Bool)

(assert (=> d!76115 (= c!57483 ((_ is Nil!9051) (toList!3969 lt!217373)))))

(declare-fun e!280475 () (InoxSet tuple2!8994))

(assert (=> d!76115 (= (content!206 (toList!3969 lt!217373)) e!280475)))

(declare-fun b!477374 () Bool)

(assert (=> b!477374 (= e!280475 ((as const (Array tuple2!8994 Bool)) false))))

(declare-fun b!477375 () Bool)

(assert (=> b!477375 (= e!280475 ((_ map or) (store ((as const (Array tuple2!8994 Bool)) false) (h!9906 (toList!3969 lt!217373)) true) (content!206 (t!15120 (toList!3969 lt!217373)))))))

(assert (= (and d!76115 c!57483) b!477374))

(assert (= (and d!76115 (not c!57483)) b!477375))

(declare-fun m!459727 () Bool)

(assert (=> b!477375 m!459727))

(declare-fun m!459729 () Bool)

(assert (=> b!477375 m!459729))

(assert (=> d!76043 d!76115))

(declare-fun d!76117 () Bool)

(declare-fun res!284921 () Bool)

(declare-fun e!280480 () Bool)

(assert (=> d!76117 (=> res!284921 e!280480)))

(assert (=> d!76117 (= res!284921 (and ((_ is Cons!9050) lt!217371) (= (_1!4508 (h!9906 lt!217371)) (_1!4508 lt!217352))))))

(assert (=> d!76117 (= (containsKey!348 lt!217371 (_1!4508 lt!217352)) e!280480)))

(declare-fun b!477380 () Bool)

(declare-fun e!280481 () Bool)

(assert (=> b!477380 (= e!280480 e!280481)))

(declare-fun res!284922 () Bool)

(assert (=> b!477380 (=> (not res!284922) (not e!280481))))

(assert (=> b!477380 (= res!284922 (and (or (not ((_ is Cons!9050) lt!217371)) (bvsle (_1!4508 (h!9906 lt!217371)) (_1!4508 lt!217352))) ((_ is Cons!9050) lt!217371) (bvslt (_1!4508 (h!9906 lt!217371)) (_1!4508 lt!217352))))))

(declare-fun b!477381 () Bool)

(assert (=> b!477381 (= e!280481 (containsKey!348 (t!15120 lt!217371) (_1!4508 lt!217352)))))

(assert (= (and d!76117 (not res!284921)) b!477380))

(assert (= (and b!477380 res!284922) b!477381))

(declare-fun m!459731 () Bool)

(assert (=> b!477381 m!459731))

(assert (=> b!477140 d!76117))

(assert (=> d!75975 d!75971))

(assert (=> d!75975 d!75973))

(declare-fun d!76119 () Bool)

(assert (=> d!76119 (= ($colon$colon!110 e!280317 (ite c!57402 (h!9906 (toList!3969 lt!217351)) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352)))) (Cons!9050 (ite c!57402 (h!9906 (toList!3969 lt!217351)) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))) e!280317))))

(assert (=> bm!30736 d!76119))

(declare-fun d!76121 () Bool)

(declare-fun lt!217524 () Bool)

(assert (=> d!76121 (= lt!217524 (select (content!206 lt!217371) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun e!280482 () Bool)

(assert (=> d!76121 (= lt!217524 e!280482)))

(declare-fun res!284923 () Bool)

(assert (=> d!76121 (=> (not res!284923) (not e!280482))))

(assert (=> d!76121 (= res!284923 ((_ is Cons!9050) lt!217371))))

(assert (=> d!76121 (= (contains!2569 lt!217371 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))) lt!217524)))

(declare-fun b!477382 () Bool)

(declare-fun e!280483 () Bool)

(assert (=> b!477382 (= e!280482 e!280483)))

(declare-fun res!284924 () Bool)

(assert (=> b!477382 (=> res!284924 e!280483)))

(assert (=> b!477382 (= res!284924 (= (h!9906 lt!217371) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477383 () Bool)

(assert (=> b!477383 (= e!280483 (contains!2569 (t!15120 lt!217371) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(assert (= (and d!76121 res!284923) b!477382))

(assert (= (and b!477382 (not res!284924)) b!477383))

(declare-fun m!459733 () Bool)

(assert (=> d!76121 m!459733))

(declare-fun m!459735 () Bool)

(assert (=> d!76121 m!459735))

(declare-fun m!459737 () Bool)

(assert (=> b!477383 m!459737))

(assert (=> b!477141 d!76121))

(declare-fun b!477387 () Bool)

(declare-fun e!280485 () Option!392)

(assert (=> b!477387 (= e!280485 None!390)))

(declare-fun b!477384 () Bool)

(declare-fun e!280484 () Option!392)

(assert (=> b!477384 (= e!280484 (Some!391 (_2!4508 (h!9906 (t!15120 lt!217371)))))))

(declare-fun b!477386 () Bool)

(assert (=> b!477386 (= e!280485 (getValueByKey!386 (t!15120 (t!15120 lt!217371)) (_1!4508 lt!217352)))))

(declare-fun d!76123 () Bool)

(declare-fun c!57484 () Bool)

(assert (=> d!76123 (= c!57484 (and ((_ is Cons!9050) (t!15120 lt!217371)) (= (_1!4508 (h!9906 (t!15120 lt!217371))) (_1!4508 lt!217352))))))

(assert (=> d!76123 (= (getValueByKey!386 (t!15120 lt!217371) (_1!4508 lt!217352)) e!280484)))

(declare-fun b!477385 () Bool)

(assert (=> b!477385 (= e!280484 e!280485)))

(declare-fun c!57485 () Bool)

(assert (=> b!477385 (= c!57485 (and ((_ is Cons!9050) (t!15120 lt!217371)) (not (= (_1!4508 (h!9906 (t!15120 lt!217371))) (_1!4508 lt!217352)))))))

(assert (= (and d!76123 c!57484) b!477384))

(assert (= (and d!76123 (not c!57484)) b!477385))

(assert (= (and b!477385 c!57485) b!477386))

(assert (= (and b!477385 (not c!57485)) b!477387))

(declare-fun m!459739 () Bool)

(assert (=> b!477386 m!459739))

(assert (=> b!477138 d!76123))

(declare-fun d!76125 () Bool)

(declare-fun res!284925 () Bool)

(declare-fun e!280486 () Bool)

(assert (=> d!76125 (=> res!284925 e!280486)))

(assert (=> d!76125 (= res!284925 ((_ is Nil!9051) (t!15120 (t!15120 (toList!3969 lt!217351)))))))

(assert (=> d!76125 (= (forall!198 (t!15120 (t!15120 (toList!3969 lt!217351))) p!166) e!280486)))

(declare-fun b!477388 () Bool)

(declare-fun e!280487 () Bool)

(assert (=> b!477388 (= e!280486 e!280487)))

(declare-fun res!284926 () Bool)

(assert (=> b!477388 (=> (not res!284926) (not e!280487))))

(assert (=> b!477388 (= res!284926 (dynLambda!945 p!166 (h!9906 (t!15120 (t!15120 (toList!3969 lt!217351))))))))

(declare-fun b!477389 () Bool)

(assert (=> b!477389 (= e!280487 (forall!198 (t!15120 (t!15120 (t!15120 (toList!3969 lt!217351)))) p!166))))

(assert (= (and d!76125 (not res!284925)) b!477388))

(assert (= (and b!477388 res!284926) b!477389))

(declare-fun b_lambda!10649 () Bool)

(assert (=> (not b_lambda!10649) (not b!477388)))

(declare-fun t!15188 () Bool)

(declare-fun tb!4089 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15188) tb!4089))

(declare-fun result!7657 () Bool)

(assert (=> tb!4089 (= result!7657 true)))

(assert (=> b!477388 t!15188))

(declare-fun b_and!20791 () Bool)

(assert (= b_and!20789 (and (=> t!15188 result!7657) b_and!20791)))

(declare-fun m!459741 () Bool)

(assert (=> b!477388 m!459741))

(declare-fun m!459743 () Bool)

(assert (=> b!477389 m!459743))

(assert (=> b!477161 d!76125))

(declare-fun d!76127 () Bool)

(declare-fun res!284927 () Bool)

(declare-fun e!280488 () Bool)

(assert (=> d!76127 (=> res!284927 e!280488)))

(assert (=> d!76127 (= res!284927 (and ((_ is Cons!9050) lt!217389) (= (_1!4508 (h!9906 lt!217389)) (_1!4508 lt!217352))))))

(assert (=> d!76127 (= (containsKey!348 lt!217389 (_1!4508 lt!217352)) e!280488)))

(declare-fun b!477390 () Bool)

(declare-fun e!280489 () Bool)

(assert (=> b!477390 (= e!280488 e!280489)))

(declare-fun res!284928 () Bool)

(assert (=> b!477390 (=> (not res!284928) (not e!280489))))

(assert (=> b!477390 (= res!284928 (and (or (not ((_ is Cons!9050) lt!217389)) (bvsle (_1!4508 (h!9906 lt!217389)) (_1!4508 lt!217352))) ((_ is Cons!9050) lt!217389) (bvslt (_1!4508 (h!9906 lt!217389)) (_1!4508 lt!217352))))))

(declare-fun b!477391 () Bool)

(assert (=> b!477391 (= e!280489 (containsKey!348 (t!15120 lt!217389) (_1!4508 lt!217352)))))

(assert (= (and d!76127 (not res!284927)) b!477390))

(assert (= (and b!477390 res!284928) b!477391))

(declare-fun m!459745 () Bool)

(assert (=> b!477391 m!459745))

(assert (=> b!477065 d!76127))

(declare-fun d!76129 () Bool)

(declare-fun res!284929 () Bool)

(declare-fun e!280490 () Bool)

(assert (=> d!76129 (=> res!284929 e!280490)))

(assert (=> d!76129 (= res!284929 (or ((_ is Nil!9051) (t!15120 (toList!3969 lm!215))) ((_ is Nil!9051) (t!15120 (t!15120 (toList!3969 lm!215))))))))

(assert (=> d!76129 (= (isStrictlySorted!388 (t!15120 (toList!3969 lm!215))) e!280490)))

(declare-fun b!477392 () Bool)

(declare-fun e!280491 () Bool)

(assert (=> b!477392 (= e!280490 e!280491)))

(declare-fun res!284930 () Bool)

(assert (=> b!477392 (=> (not res!284930) (not e!280491))))

(assert (=> b!477392 (= res!284930 (bvslt (_1!4508 (h!9906 (t!15120 (toList!3969 lm!215)))) (_1!4508 (h!9906 (t!15120 (t!15120 (toList!3969 lm!215)))))))))

(declare-fun b!477393 () Bool)

(assert (=> b!477393 (= e!280491 (isStrictlySorted!388 (t!15120 (t!15120 (toList!3969 lm!215)))))))

(assert (= (and d!76129 (not res!284929)) b!477392))

(assert (= (and b!477392 res!284930) b!477393))

(declare-fun m!459747 () Bool)

(assert (=> b!477393 m!459747))

(assert (=> b!477129 d!76129))

(declare-fun d!76131 () Bool)

(declare-fun res!284931 () Bool)

(declare-fun e!280492 () Bool)

(assert (=> d!76131 (=> res!284931 e!280492)))

(assert (=> d!76131 (= res!284931 (or ((_ is Nil!9051) lt!217469) ((_ is Nil!9051) (t!15120 lt!217469))))))

(assert (=> d!76131 (= (isStrictlySorted!388 lt!217469) e!280492)))

(declare-fun b!477394 () Bool)

(declare-fun e!280493 () Bool)

(assert (=> b!477394 (= e!280492 e!280493)))

(declare-fun res!284932 () Bool)

(assert (=> b!477394 (=> (not res!284932) (not e!280493))))

(assert (=> b!477394 (= res!284932 (bvslt (_1!4508 (h!9906 lt!217469)) (_1!4508 (h!9906 (t!15120 lt!217469)))))))

(declare-fun b!477395 () Bool)

(assert (=> b!477395 (= e!280493 (isStrictlySorted!388 (t!15120 lt!217469)))))

(assert (= (and d!76131 (not res!284931)) b!477394))

(assert (= (and b!477394 res!284932) b!477395))

(declare-fun m!459749 () Bool)

(assert (=> b!477395 m!459749))

(assert (=> d!76033 d!76131))

(assert (=> d!76033 d!76021))

(declare-fun d!76133 () Bool)

(declare-fun lt!217525 () Bool)

(assert (=> d!76133 (= lt!217525 (select (content!206 lt!217389) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun e!280494 () Bool)

(assert (=> d!76133 (= lt!217525 e!280494)))

(declare-fun res!284933 () Bool)

(assert (=> d!76133 (=> (not res!284933) (not e!280494))))

(assert (=> d!76133 (= res!284933 ((_ is Cons!9050) lt!217389))))

(assert (=> d!76133 (= (contains!2569 lt!217389 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))) lt!217525)))

(declare-fun b!477396 () Bool)

(declare-fun e!280495 () Bool)

(assert (=> b!477396 (= e!280494 e!280495)))

(declare-fun res!284934 () Bool)

(assert (=> b!477396 (=> res!284934 e!280495)))

(assert (=> b!477396 (= res!284934 (= (h!9906 lt!217389) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477397 () Bool)

(assert (=> b!477397 (= e!280495 (contains!2569 (t!15120 lt!217389) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(assert (= (and d!76133 res!284933) b!477396))

(assert (= (and b!477396 (not res!284934)) b!477397))

(declare-fun m!459751 () Bool)

(assert (=> d!76133 m!459751))

(declare-fun m!459753 () Bool)

(assert (=> d!76133 m!459753))

(declare-fun m!459755 () Bool)

(assert (=> b!477397 m!459755))

(assert (=> b!477066 d!76133))

(declare-fun d!76135 () Bool)

(declare-fun res!284935 () Bool)

(declare-fun e!280496 () Bool)

(assert (=> d!76135 (=> res!284935 e!280496)))

(assert (=> d!76135 (= res!284935 ((_ is Nil!9051) (t!15120 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85))))))))

(assert (=> d!76135 (= (forall!198 (t!15120 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85)))) p!166) e!280496)))

(declare-fun b!477398 () Bool)

(declare-fun e!280497 () Bool)

(assert (=> b!477398 (= e!280496 e!280497)))

(declare-fun res!284936 () Bool)

(assert (=> b!477398 (=> (not res!284936) (not e!280497))))

(assert (=> b!477398 (= res!284936 (dynLambda!945 p!166 (h!9906 (t!15120 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85)))))))))

(declare-fun b!477399 () Bool)

(assert (=> b!477399 (= e!280497 (forall!198 (t!15120 (t!15120 (toList!3969 (+!1766 lt!217351 (tuple2!8995 a!501 b!85))))) p!166))))

(assert (= (and d!76135 (not res!284935)) b!477398))

(assert (= (and b!477398 res!284936) b!477399))

(declare-fun b_lambda!10651 () Bool)

(assert (=> (not b_lambda!10651) (not b!477398)))

(declare-fun t!15190 () Bool)

(declare-fun tb!4091 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15190) tb!4091))

(declare-fun result!7659 () Bool)

(assert (=> tb!4091 (= result!7659 true)))

(assert (=> b!477398 t!15190))

(declare-fun b_and!20793 () Bool)

(assert (= b_and!20791 (and (=> t!15190 result!7659) b_and!20793)))

(declare-fun m!459757 () Bool)

(assert (=> b!477398 m!459757))

(declare-fun m!459759 () Bool)

(assert (=> b!477399 m!459759))

(assert (=> b!477014 d!76135))

(declare-fun d!76137 () Bool)

(declare-fun res!284937 () Bool)

(declare-fun e!280498 () Bool)

(assert (=> d!76137 (=> res!284937 e!280498)))

(assert (=> d!76137 (= res!284937 (and ((_ is Cons!9050) lt!217469) (= (_1!4508 (h!9906 lt!217469)) (_1!4508 lt!217352))))))

(assert (=> d!76137 (= (containsKey!348 lt!217469 (_1!4508 lt!217352)) e!280498)))

(declare-fun b!477400 () Bool)

(declare-fun e!280499 () Bool)

(assert (=> b!477400 (= e!280498 e!280499)))

(declare-fun res!284938 () Bool)

(assert (=> b!477400 (=> (not res!284938) (not e!280499))))

(assert (=> b!477400 (= res!284938 (and (or (not ((_ is Cons!9050) lt!217469)) (bvsle (_1!4508 (h!9906 lt!217469)) (_1!4508 lt!217352))) ((_ is Cons!9050) lt!217469) (bvslt (_1!4508 (h!9906 lt!217469)) (_1!4508 lt!217352))))))

(declare-fun b!477401 () Bool)

(assert (=> b!477401 (= e!280499 (containsKey!348 (t!15120 lt!217469) (_1!4508 lt!217352)))))

(assert (= (and d!76137 (not res!284937)) b!477400))

(assert (= (and b!477400 res!284938) b!477401))

(declare-fun m!459761 () Bool)

(assert (=> b!477401 m!459761))

(assert (=> b!477149 d!76137))

(declare-fun d!76139 () Bool)

(declare-fun lt!217526 () Bool)

(assert (=> d!76139 (= lt!217526 (select (content!206 (t!15120 (toList!3969 lt!217373))) lt!217352))))

(declare-fun e!280500 () Bool)

(assert (=> d!76139 (= lt!217526 e!280500)))

(declare-fun res!284939 () Bool)

(assert (=> d!76139 (=> (not res!284939) (not e!280500))))

(assert (=> d!76139 (= res!284939 ((_ is Cons!9050) (t!15120 (toList!3969 lt!217373))))))

(assert (=> d!76139 (= (contains!2569 (t!15120 (toList!3969 lt!217373)) lt!217352) lt!217526)))

(declare-fun b!477402 () Bool)

(declare-fun e!280501 () Bool)

(assert (=> b!477402 (= e!280500 e!280501)))

(declare-fun res!284940 () Bool)

(assert (=> b!477402 (=> res!284940 e!280501)))

(assert (=> b!477402 (= res!284940 (= (h!9906 (t!15120 (toList!3969 lt!217373))) lt!217352))))

(declare-fun b!477403 () Bool)

(assert (=> b!477403 (= e!280501 (contains!2569 (t!15120 (t!15120 (toList!3969 lt!217373))) lt!217352))))

(assert (= (and d!76139 res!284939) b!477402))

(assert (= (and b!477402 (not res!284940)) b!477403))

(assert (=> d!76139 m!459729))

(declare-fun m!459763 () Bool)

(assert (=> d!76139 m!459763))

(declare-fun m!459765 () Bool)

(assert (=> b!477403 m!459765))

(assert (=> b!477167 d!76139))

(declare-fun d!76141 () Bool)

(declare-fun lt!217527 () Bool)

(assert (=> d!76141 (= lt!217527 (select (content!206 lt!217469) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun e!280502 () Bool)

(assert (=> d!76141 (= lt!217527 e!280502)))

(declare-fun res!284941 () Bool)

(assert (=> d!76141 (=> (not res!284941) (not e!280502))))

(assert (=> d!76141 (= res!284941 ((_ is Cons!9050) lt!217469))))

(assert (=> d!76141 (= (contains!2569 lt!217469 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))) lt!217527)))

(declare-fun b!477404 () Bool)

(declare-fun e!280503 () Bool)

(assert (=> b!477404 (= e!280502 e!280503)))

(declare-fun res!284942 () Bool)

(assert (=> b!477404 (=> res!284942 e!280503)))

(assert (=> b!477404 (= res!284942 (= (h!9906 lt!217469) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477405 () Bool)

(assert (=> b!477405 (= e!280503 (contains!2569 (t!15120 lt!217469) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(assert (= (and d!76141 res!284941) b!477404))

(assert (= (and b!477404 (not res!284942)) b!477405))

(declare-fun m!459767 () Bool)

(assert (=> d!76141 m!459767))

(declare-fun m!459769 () Bool)

(assert (=> d!76141 m!459769))

(declare-fun m!459771 () Bool)

(assert (=> b!477405 m!459771))

(assert (=> b!477151 d!76141))

(declare-fun d!76143 () Bool)

(declare-fun lt!217528 () Bool)

(assert (=> d!76143 (= lt!217528 (select (content!206 (toList!3969 lt!217422)) (tuple2!8995 a!501 b!85)))))

(declare-fun e!280504 () Bool)

(assert (=> d!76143 (= lt!217528 e!280504)))

(declare-fun res!284943 () Bool)

(assert (=> d!76143 (=> (not res!284943) (not e!280504))))

(assert (=> d!76143 (= res!284943 ((_ is Cons!9050) (toList!3969 lt!217422)))))

(assert (=> d!76143 (= (contains!2569 (toList!3969 lt!217422) (tuple2!8995 a!501 b!85)) lt!217528)))

(declare-fun b!477406 () Bool)

(declare-fun e!280505 () Bool)

(assert (=> b!477406 (= e!280504 e!280505)))

(declare-fun res!284944 () Bool)

(assert (=> b!477406 (=> res!284944 e!280505)))

(assert (=> b!477406 (= res!284944 (= (h!9906 (toList!3969 lt!217422)) (tuple2!8995 a!501 b!85)))))

(declare-fun b!477407 () Bool)

(assert (=> b!477407 (= e!280505 (contains!2569 (t!15120 (toList!3969 lt!217422)) (tuple2!8995 a!501 b!85)))))

(assert (= (and d!76143 res!284943) b!477406))

(assert (= (and b!477406 (not res!284944)) b!477407))

(declare-fun m!459773 () Bool)

(assert (=> d!76143 m!459773))

(declare-fun m!459775 () Bool)

(assert (=> d!76143 m!459775))

(declare-fun m!459777 () Bool)

(assert (=> b!477407 m!459777))

(assert (=> b!477016 d!76143))

(declare-fun d!76145 () Bool)

(declare-fun res!284945 () Bool)

(declare-fun e!280506 () Bool)

(assert (=> d!76145 (=> res!284945 e!280506)))

(assert (=> d!76145 (= res!284945 (and ((_ is Cons!9050) (toList!3969 lt!217391)) (= (_1!4508 (h!9906 (toList!3969 lt!217391))) (_1!4508 lt!217352))))))

(assert (=> d!76145 (= (containsKey!348 (toList!3969 lt!217391) (_1!4508 lt!217352)) e!280506)))

(declare-fun b!477408 () Bool)

(declare-fun e!280507 () Bool)

(assert (=> b!477408 (= e!280506 e!280507)))

(declare-fun res!284946 () Bool)

(assert (=> b!477408 (=> (not res!284946) (not e!280507))))

(assert (=> b!477408 (= res!284946 (and (or (not ((_ is Cons!9050) (toList!3969 lt!217391))) (bvsle (_1!4508 (h!9906 (toList!3969 lt!217391))) (_1!4508 lt!217352))) ((_ is Cons!9050) (toList!3969 lt!217391)) (bvslt (_1!4508 (h!9906 (toList!3969 lt!217391))) (_1!4508 lt!217352))))))

(declare-fun b!477409 () Bool)

(assert (=> b!477409 (= e!280507 (containsKey!348 (t!15120 (toList!3969 lt!217391)) (_1!4508 lt!217352)))))

(assert (= (and d!76145 (not res!284945)) b!477408))

(assert (= (and b!477408 res!284946) b!477409))

(declare-fun m!459779 () Bool)

(assert (=> b!477409 m!459779))

(assert (=> d!75985 d!76145))

(declare-fun b!477413 () Bool)

(declare-fun e!280509 () Option!392)

(assert (=> b!477413 (= e!280509 None!390)))

(declare-fun b!477410 () Bool)

(declare-fun e!280508 () Option!392)

(assert (=> b!477410 (= e!280508 (Some!391 (_2!4508 (h!9906 (toList!3969 lt!217422)))))))

(declare-fun b!477412 () Bool)

(assert (=> b!477412 (= e!280509 (getValueByKey!386 (t!15120 (toList!3969 lt!217422)) (_1!4508 (tuple2!8995 a!501 b!85))))))

(declare-fun c!57486 () Bool)

(declare-fun d!76147 () Bool)

(assert (=> d!76147 (= c!57486 (and ((_ is Cons!9050) (toList!3969 lt!217422)) (= (_1!4508 (h!9906 (toList!3969 lt!217422))) (_1!4508 (tuple2!8995 a!501 b!85)))))))

(assert (=> d!76147 (= (getValueByKey!386 (toList!3969 lt!217422) (_1!4508 (tuple2!8995 a!501 b!85))) e!280508)))

(declare-fun b!477411 () Bool)

(assert (=> b!477411 (= e!280508 e!280509)))

(declare-fun c!57487 () Bool)

(assert (=> b!477411 (= c!57487 (and ((_ is Cons!9050) (toList!3969 lt!217422)) (not (= (_1!4508 (h!9906 (toList!3969 lt!217422))) (_1!4508 (tuple2!8995 a!501 b!85))))))))

(assert (= (and d!76147 c!57486) b!477410))

(assert (= (and d!76147 (not c!57486)) b!477411))

(assert (= (and b!477411 c!57487) b!477412))

(assert (= (and b!477411 (not c!57487)) b!477413))

(declare-fun m!459781 () Bool)

(assert (=> b!477412 m!459781))

(assert (=> b!477015 d!76147))

(declare-fun d!76149 () Bool)

(declare-fun res!284947 () Bool)

(declare-fun e!280510 () Bool)

(assert (=> d!76149 (=> res!284947 e!280510)))

(assert (=> d!76149 (= res!284947 (and ((_ is Cons!9050) (toList!3969 lt!217373)) (= (_1!4508 (h!9906 (toList!3969 lt!217373))) (_1!4508 lt!217352))))))

(assert (=> d!76149 (= (containsKey!348 (toList!3969 lt!217373) (_1!4508 lt!217352)) e!280510)))

(declare-fun b!477414 () Bool)

(declare-fun e!280511 () Bool)

(assert (=> b!477414 (= e!280510 e!280511)))

(declare-fun res!284948 () Bool)

(assert (=> b!477414 (=> (not res!284948) (not e!280511))))

(assert (=> b!477414 (= res!284948 (and (or (not ((_ is Cons!9050) (toList!3969 lt!217373))) (bvsle (_1!4508 (h!9906 (toList!3969 lt!217373))) (_1!4508 lt!217352))) ((_ is Cons!9050) (toList!3969 lt!217373)) (bvslt (_1!4508 (h!9906 (toList!3969 lt!217373))) (_1!4508 lt!217352))))))

(declare-fun b!477415 () Bool)

(assert (=> b!477415 (= e!280511 (containsKey!348 (t!15120 (toList!3969 lt!217373)) (_1!4508 lt!217352)))))

(assert (= (and d!76149 (not res!284947)) b!477414))

(assert (= (and b!477414 res!284948) b!477415))

(declare-fun m!459783 () Bool)

(assert (=> b!477415 m!459783))

(assert (=> d!76023 d!76149))

(declare-fun b!477419 () Bool)

(declare-fun e!280513 () Option!392)

(assert (=> b!477419 (= e!280513 None!390)))

(declare-fun b!477416 () Bool)

(declare-fun e!280512 () Option!392)

(assert (=> b!477416 (= e!280512 (Some!391 (_2!4508 (h!9906 (t!15120 (toList!3969 lt!217373))))))))

(declare-fun b!477418 () Bool)

(assert (=> b!477418 (= e!280513 (getValueByKey!386 (t!15120 (t!15120 (toList!3969 lt!217373))) (_1!4508 lt!217352)))))

(declare-fun d!76151 () Bool)

(declare-fun c!57488 () Bool)

(assert (=> d!76151 (= c!57488 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217373))) (= (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217373)))) (_1!4508 lt!217352))))))

(assert (=> d!76151 (= (getValueByKey!386 (t!15120 (toList!3969 lt!217373)) (_1!4508 lt!217352)) e!280512)))

(declare-fun b!477417 () Bool)

(assert (=> b!477417 (= e!280512 e!280513)))

(declare-fun c!57489 () Bool)

(assert (=> b!477417 (= c!57489 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217373))) (not (= (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217373)))) (_1!4508 lt!217352)))))))

(assert (= (and d!76151 c!57488) b!477416))

(assert (= (and d!76151 (not c!57488)) b!477417))

(assert (= (and b!477417 c!57489) b!477418))

(assert (= (and b!477417 (not c!57489)) b!477419))

(declare-fun m!459785 () Bool)

(assert (=> b!477418 m!459785))

(assert (=> b!477158 d!76151))

(declare-fun bm!30770 () Bool)

(declare-fun call!30774 () List!9054)

(declare-fun call!30773 () List!9054)

(assert (=> bm!30770 (= call!30774 call!30773)))

(declare-fun b!477420 () Bool)

(declare-fun e!280515 () List!9054)

(declare-fun e!280517 () List!9054)

(assert (=> b!477420 (= e!280515 e!280517)))

(declare-fun c!57493 () Bool)

(assert (=> b!477420 (= c!57493 (and ((_ is Cons!9050) (t!15120 (toList!3969 lm!215))) (= (_1!4508 (h!9906 (t!15120 (toList!3969 lm!215)))) (_1!4508 lt!217352))))))

(declare-fun bm!30771 () Bool)

(declare-fun call!30775 () List!9054)

(assert (=> bm!30771 (= call!30775 call!30774)))

(declare-fun b!477421 () Bool)

(assert (=> b!477421 (= e!280517 call!30774)))

(declare-fun b!477422 () Bool)

(declare-fun e!280518 () List!9054)

(assert (=> b!477422 (= e!280518 call!30775)))

(declare-fun b!477424 () Bool)

(assert (=> b!477424 (= e!280515 call!30773)))

(declare-fun b!477425 () Bool)

(declare-fun e!280514 () Bool)

(declare-fun lt!217529 () List!9054)

(assert (=> b!477425 (= e!280514 (contains!2569 lt!217529 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477426 () Bool)

(assert (=> b!477426 (= e!280518 call!30775)))

(declare-fun b!477427 () Bool)

(declare-fun e!280516 () List!9054)

(assert (=> b!477427 (= e!280516 (insertStrictlySorted!211 (t!15120 (t!15120 (toList!3969 lm!215))) (_1!4508 lt!217352) (_2!4508 lt!217352)))))

(declare-fun b!477428 () Bool)

(declare-fun c!57490 () Bool)

(assert (=> b!477428 (= e!280516 (ite c!57493 (t!15120 (t!15120 (toList!3969 lm!215))) (ite c!57490 (Cons!9050 (h!9906 (t!15120 (toList!3969 lm!215))) (t!15120 (t!15120 (toList!3969 lm!215)))) Nil!9051)))))

(declare-fun b!477423 () Bool)

(declare-fun res!284949 () Bool)

(assert (=> b!477423 (=> (not res!284949) (not e!280514))))

(assert (=> b!477423 (= res!284949 (containsKey!348 lt!217529 (_1!4508 lt!217352)))))

(declare-fun d!76153 () Bool)

(assert (=> d!76153 e!280514))

(declare-fun res!284950 () Bool)

(assert (=> d!76153 (=> (not res!284950) (not e!280514))))

(assert (=> d!76153 (= res!284950 (isStrictlySorted!388 lt!217529))))

(assert (=> d!76153 (= lt!217529 e!280515)))

(declare-fun c!57491 () Bool)

(assert (=> d!76153 (= c!57491 (and ((_ is Cons!9050) (t!15120 (toList!3969 lm!215))) (bvslt (_1!4508 (h!9906 (t!15120 (toList!3969 lm!215)))) (_1!4508 lt!217352))))))

(assert (=> d!76153 (isStrictlySorted!388 (t!15120 (toList!3969 lm!215)))))

(assert (=> d!76153 (= (insertStrictlySorted!211 (t!15120 (toList!3969 lm!215)) (_1!4508 lt!217352) (_2!4508 lt!217352)) lt!217529)))

(declare-fun bm!30772 () Bool)

(assert (=> bm!30772 (= call!30773 ($colon$colon!110 e!280516 (ite c!57491 (h!9906 (t!15120 (toList!3969 lm!215))) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352)))))))

(declare-fun c!57492 () Bool)

(assert (=> bm!30772 (= c!57492 c!57491)))

(declare-fun b!477429 () Bool)

(assert (=> b!477429 (= c!57490 (and ((_ is Cons!9050) (t!15120 (toList!3969 lm!215))) (bvsgt (_1!4508 (h!9906 (t!15120 (toList!3969 lm!215)))) (_1!4508 lt!217352))))))

(assert (=> b!477429 (= e!280517 e!280518)))

(assert (= (and d!76153 c!57491) b!477424))

(assert (= (and d!76153 (not c!57491)) b!477420))

(assert (= (and b!477420 c!57493) b!477421))

(assert (= (and b!477420 (not c!57493)) b!477429))

(assert (= (and b!477429 c!57490) b!477426))

(assert (= (and b!477429 (not c!57490)) b!477422))

(assert (= (or b!477426 b!477422) bm!30771))

(assert (= (or b!477421 bm!30771) bm!30770))

(assert (= (or b!477424 bm!30770) bm!30772))

(assert (= (and bm!30772 c!57492) b!477427))

(assert (= (and bm!30772 (not c!57492)) b!477428))

(assert (= (and d!76153 res!284950) b!477423))

(assert (= (and b!477423 res!284949) b!477425))

(declare-fun m!459787 () Bool)

(assert (=> b!477427 m!459787))

(declare-fun m!459789 () Bool)

(assert (=> d!76153 m!459789))

(assert (=> d!76153 m!459471))

(declare-fun m!459791 () Bool)

(assert (=> b!477423 m!459791))

(declare-fun m!459793 () Bool)

(assert (=> bm!30772 m!459793))

(declare-fun m!459795 () Bool)

(assert (=> b!477425 m!459795))

(assert (=> b!477153 d!76153))

(declare-fun d!76155 () Bool)

(assert (=> d!76155 (= ($colon$colon!110 e!280341 (ite c!57414 (h!9906 (toList!3969 lm!215)) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352)))) (Cons!9050 (ite c!57414 (h!9906 (toList!3969 lm!215)) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))) e!280341))))

(assert (=> bm!30739 d!76155))

(declare-fun d!76157 () Bool)

(assert (=> d!76157 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352)))))

(declare-fun lt!217532 () Unit!14036)

(declare-fun choose!1367 (List!9054 (_ BitVec 64)) Unit!14036)

(assert (=> d!76157 (= lt!217532 (choose!1367 (toList!3969 lt!217391) (_1!4508 lt!217352)))))

(declare-fun e!280521 () Bool)

(assert (=> d!76157 e!280521))

(declare-fun res!284953 () Bool)

(assert (=> d!76157 (=> (not res!284953) (not e!280521))))

(assert (=> d!76157 (= res!284953 (isStrictlySorted!388 (toList!3969 lt!217391)))))

(assert (=> d!76157 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3969 lt!217391) (_1!4508 lt!217352)) lt!217532)))

(declare-fun b!477432 () Bool)

(assert (=> b!477432 (= e!280521 (containsKey!348 (toList!3969 lt!217391) (_1!4508 lt!217352)))))

(assert (= (and d!76157 res!284953) b!477432))

(assert (=> d!76157 m!459275))

(assert (=> d!76157 m!459275))

(assert (=> d!76157 m!459411))

(declare-fun m!459797 () Bool)

(assert (=> d!76157 m!459797))

(declare-fun m!459799 () Bool)

(assert (=> d!76157 m!459799))

(assert (=> b!477432 m!459407))

(assert (=> b!477038 d!76157))

(declare-fun d!76159 () Bool)

(declare-fun isEmpty!607 (Option!392) Bool)

(assert (=> d!76159 (= (isDefined!297 (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352))) (not (isEmpty!607 (getValueByKey!386 (toList!3969 lt!217391) (_1!4508 lt!217352)))))))

(declare-fun bs!15171 () Bool)

(assert (= bs!15171 d!76159))

(assert (=> bs!15171 m!459275))

(declare-fun m!459801 () Bool)

(assert (=> bs!15171 m!459801))

(assert (=> b!477038 d!76159))

(assert (=> b!477038 d!75969))

(assert (=> d!75995 d!75993))

(declare-fun d!76161 () Bool)

(assert (=> d!76161 (= (getValueByKey!386 lt!217389 (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352)))))

(assert (=> d!76161 true))

(declare-fun _$22!547 () Unit!14036)

(assert (=> d!76161 (= (choose!1364 lt!217389 (_1!4508 lt!217352) (_2!4508 lt!217352)) _$22!547)))

(declare-fun bs!15172 () Bool)

(assert (= bs!15172 d!76161))

(assert (=> bs!15172 m!459269))

(assert (=> d!75995 d!76161))

(declare-fun d!76163 () Bool)

(declare-fun res!284954 () Bool)

(declare-fun e!280522 () Bool)

(assert (=> d!76163 (=> res!284954 e!280522)))

(assert (=> d!76163 (= res!284954 (or ((_ is Nil!9051) lt!217389) ((_ is Nil!9051) (t!15120 lt!217389))))))

(assert (=> d!76163 (= (isStrictlySorted!388 lt!217389) e!280522)))

(declare-fun b!477433 () Bool)

(declare-fun e!280523 () Bool)

(assert (=> b!477433 (= e!280522 e!280523)))

(declare-fun res!284955 () Bool)

(assert (=> b!477433 (=> (not res!284955) (not e!280523))))

(assert (=> b!477433 (= res!284955 (bvslt (_1!4508 (h!9906 lt!217389)) (_1!4508 (h!9906 (t!15120 lt!217389)))))))

(declare-fun b!477434 () Bool)

(assert (=> b!477434 (= e!280523 (isStrictlySorted!388 (t!15120 lt!217389)))))

(assert (= (and d!76163 (not res!284954)) b!477433))

(assert (= (and b!477433 res!284955) b!477434))

(declare-fun m!459803 () Bool)

(assert (=> b!477434 m!459803))

(assert (=> d!75995 d!76163))

(declare-fun d!76165 () Bool)

(declare-fun res!284956 () Bool)

(declare-fun e!280524 () Bool)

(assert (=> d!76165 (=> res!284956 e!280524)))

(assert (=> d!76165 (= res!284956 ((_ is Nil!9051) (t!15120 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352))))))))

(assert (=> d!76165 (= (forall!198 (t!15120 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352)))) p!166) e!280524)))

(declare-fun b!477435 () Bool)

(declare-fun e!280525 () Bool)

(assert (=> b!477435 (= e!280524 e!280525)))

(declare-fun res!284957 () Bool)

(assert (=> b!477435 (=> (not res!284957) (not e!280525))))

(assert (=> b!477435 (= res!284957 (dynLambda!945 p!166 (h!9906 (t!15120 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352)))))))))

(declare-fun b!477436 () Bool)

(assert (=> b!477436 (= e!280525 (forall!198 (t!15120 (t!15120 (t!15120 (toList!3969 (+!1766 lm!215 lt!217352))))) p!166))))

(assert (= (and d!76165 (not res!284956)) b!477435))

(assert (= (and b!477435 res!284957) b!477436))

(declare-fun b_lambda!10653 () Bool)

(assert (=> (not b_lambda!10653) (not b!477435)))

(declare-fun t!15192 () Bool)

(declare-fun tb!4093 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15192) tb!4093))

(declare-fun result!7661 () Bool)

(assert (=> tb!4093 (= result!7661 true)))

(assert (=> b!477435 t!15192))

(declare-fun b_and!20795 () Bool)

(assert (= b_and!20793 (and (=> t!15192 result!7661) b_and!20795)))

(declare-fun m!459805 () Bool)

(assert (=> b!477435 m!459805))

(declare-fun m!459807 () Bool)

(assert (=> b!477436 m!459807))

(assert (=> b!477029 d!76165))

(declare-fun b!477440 () Bool)

(declare-fun e!280527 () Option!392)

(assert (=> b!477440 (= e!280527 None!390)))

(declare-fun b!477437 () Bool)

(declare-fun e!280526 () Option!392)

(assert (=> b!477437 (= e!280526 (Some!391 (_2!4508 (h!9906 (t!15120 (toList!3969 lt!217391))))))))

(declare-fun b!477439 () Bool)

(assert (=> b!477439 (= e!280527 (getValueByKey!386 (t!15120 (t!15120 (toList!3969 lt!217391))) (_1!4508 lt!217352)))))

(declare-fun d!76167 () Bool)

(declare-fun c!57494 () Bool)

(assert (=> d!76167 (= c!57494 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217391))) (= (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217391)))) (_1!4508 lt!217352))))))

(assert (=> d!76167 (= (getValueByKey!386 (t!15120 (toList!3969 lt!217391)) (_1!4508 lt!217352)) e!280526)))

(declare-fun b!477438 () Bool)

(assert (=> b!477438 (= e!280526 e!280527)))

(declare-fun c!57495 () Bool)

(assert (=> b!477438 (= c!57495 (and ((_ is Cons!9050) (t!15120 (toList!3969 lt!217391))) (not (= (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217391)))) (_1!4508 lt!217352)))))))

(assert (= (and d!76167 c!57494) b!477437))

(assert (= (and d!76167 (not c!57494)) b!477438))

(assert (= (and b!477438 c!57495) b!477439))

(assert (= (and b!477438 (not c!57495)) b!477440))

(declare-fun m!459809 () Bool)

(assert (=> b!477439 m!459809))

(assert (=> b!477011 d!76167))

(assert (=> b!477040 d!76159))

(assert (=> b!477040 d!75969))

(declare-fun b!477444 () Bool)

(declare-fun e!280529 () Option!392)

(assert (=> b!477444 (= e!280529 None!390)))

(declare-fun b!477441 () Bool)

(declare-fun e!280528 () Option!392)

(assert (=> b!477441 (= e!280528 (Some!391 (_2!4508 (h!9906 (t!15120 lt!217389)))))))

(declare-fun b!477443 () Bool)

(assert (=> b!477443 (= e!280529 (getValueByKey!386 (t!15120 (t!15120 lt!217389)) (_1!4508 lt!217352)))))

(declare-fun d!76169 () Bool)

(declare-fun c!57496 () Bool)

(assert (=> d!76169 (= c!57496 (and ((_ is Cons!9050) (t!15120 lt!217389)) (= (_1!4508 (h!9906 (t!15120 lt!217389))) (_1!4508 lt!217352))))))

(assert (=> d!76169 (= (getValueByKey!386 (t!15120 lt!217389) (_1!4508 lt!217352)) e!280528)))

(declare-fun b!477442 () Bool)

(assert (=> b!477442 (= e!280528 e!280529)))

(declare-fun c!57497 () Bool)

(assert (=> b!477442 (= c!57497 (and ((_ is Cons!9050) (t!15120 lt!217389)) (not (= (_1!4508 (h!9906 (t!15120 lt!217389))) (_1!4508 lt!217352)))))))

(assert (= (and d!76169 c!57496) b!477441))

(assert (= (and d!76169 (not c!57496)) b!477442))

(assert (= (and b!477442 c!57497) b!477443))

(assert (= (and b!477442 (not c!57497)) b!477444))

(declare-fun m!459811 () Bool)

(assert (=> b!477443 m!459811))

(assert (=> b!477045 d!76169))

(declare-fun d!76171 () Bool)

(declare-fun res!284958 () Bool)

(declare-fun e!280530 () Bool)

(assert (=> d!76171 (=> res!284958 e!280530)))

(assert (=> d!76171 (= res!284958 (and ((_ is Cons!9050) lt!217451) (= (_1!4508 (h!9906 lt!217451)) (_1!4508 lt!217352))))))

(assert (=> d!76171 (= (containsKey!348 lt!217451 (_1!4508 lt!217352)) e!280530)))

(declare-fun b!477445 () Bool)

(declare-fun e!280531 () Bool)

(assert (=> b!477445 (= e!280530 e!280531)))

(declare-fun res!284959 () Bool)

(assert (=> b!477445 (=> (not res!284959) (not e!280531))))

(assert (=> b!477445 (= res!284959 (and (or (not ((_ is Cons!9050) lt!217451)) (bvsle (_1!4508 (h!9906 lt!217451)) (_1!4508 lt!217352))) ((_ is Cons!9050) lt!217451) (bvslt (_1!4508 (h!9906 lt!217451)) (_1!4508 lt!217352))))))

(declare-fun b!477446 () Bool)

(assert (=> b!477446 (= e!280531 (containsKey!348 (t!15120 lt!217451) (_1!4508 lt!217352)))))

(assert (= (and d!76171 (not res!284958)) b!477445))

(assert (= (and b!477445 res!284959) b!477446))

(declare-fun m!459813 () Bool)

(assert (=> b!477446 m!459813))

(assert (=> b!477111 d!76171))

(declare-fun d!76173 () Bool)

(declare-fun res!284960 () Bool)

(declare-fun e!280532 () Bool)

(assert (=> d!76173 (=> res!284960 e!280532)))

(assert (=> d!76173 (= res!284960 (or ((_ is Nil!9051) lt!217451) ((_ is Nil!9051) (t!15120 lt!217451))))))

(assert (=> d!76173 (= (isStrictlySorted!388 lt!217451) e!280532)))

(declare-fun b!477447 () Bool)

(declare-fun e!280533 () Bool)

(assert (=> b!477447 (= e!280532 e!280533)))

(declare-fun res!284961 () Bool)

(assert (=> b!477447 (=> (not res!284961) (not e!280533))))

(assert (=> b!477447 (= res!284961 (bvslt (_1!4508 (h!9906 lt!217451)) (_1!4508 (h!9906 (t!15120 lt!217451)))))))

(declare-fun b!477448 () Bool)

(assert (=> b!477448 (= e!280533 (isStrictlySorted!388 (t!15120 lt!217451)))))

(assert (= (and d!76173 (not res!284960)) b!477447))

(assert (= (and b!477447 res!284961) b!477448))

(declare-fun m!459815 () Bool)

(assert (=> b!477448 m!459815))

(assert (=> d!76003 d!76173))

(declare-fun d!76175 () Bool)

(declare-fun res!284962 () Bool)

(declare-fun e!280534 () Bool)

(assert (=> d!76175 (=> res!284962 e!280534)))

(assert (=> d!76175 (= res!284962 (or ((_ is Nil!9051) (toList!3969 lt!217351)) ((_ is Nil!9051) (t!15120 (toList!3969 lt!217351)))))))

(assert (=> d!76175 (= (isStrictlySorted!388 (toList!3969 lt!217351)) e!280534)))

(declare-fun b!477449 () Bool)

(declare-fun e!280535 () Bool)

(assert (=> b!477449 (= e!280534 e!280535)))

(declare-fun res!284963 () Bool)

(assert (=> b!477449 (=> (not res!284963) (not e!280535))))

(assert (=> b!477449 (= res!284963 (bvslt (_1!4508 (h!9906 (toList!3969 lt!217351))) (_1!4508 (h!9906 (t!15120 (toList!3969 lt!217351))))))))

(declare-fun b!477450 () Bool)

(assert (=> b!477450 (= e!280535 (isStrictlySorted!388 (t!15120 (toList!3969 lt!217351))))))

(assert (= (and d!76175 (not res!284962)) b!477449))

(assert (= (and b!477449 res!284963) b!477450))

(assert (=> b!477450 m!459683))

(assert (=> d!76003 d!76175))

(declare-fun d!76177 () Bool)

(declare-fun c!57498 () Bool)

(assert (=> d!76177 (= c!57498 ((_ is Nil!9051) (toList!3969 lt!217391)))))

(declare-fun e!280536 () (InoxSet tuple2!8994))

(assert (=> d!76177 (= (content!206 (toList!3969 lt!217391)) e!280536)))

(declare-fun b!477451 () Bool)

(assert (=> b!477451 (= e!280536 ((as const (Array tuple2!8994 Bool)) false))))

(declare-fun b!477452 () Bool)

(assert (=> b!477452 (= e!280536 ((_ map or) (store ((as const (Array tuple2!8994 Bool)) false) (h!9906 (toList!3969 lt!217391)) true) (content!206 (t!15120 (toList!3969 lt!217391)))))))

(assert (= (and d!76177 c!57498) b!477451))

(assert (= (and d!76177 (not c!57498)) b!477452))

(declare-fun m!459817 () Bool)

(assert (=> b!477452 m!459817))

(assert (=> b!477452 m!459691))

(assert (=> d!75981 d!76177))

(declare-fun d!76179 () Bool)

(assert (=> d!76179 (isDefined!297 (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352)))))

(declare-fun lt!217533 () Unit!14036)

(assert (=> d!76179 (= lt!217533 (choose!1367 (toList!3969 lt!217373) (_1!4508 lt!217352)))))

(declare-fun e!280537 () Bool)

(assert (=> d!76179 e!280537))

(declare-fun res!284964 () Bool)

(assert (=> d!76179 (=> (not res!284964) (not e!280537))))

(assert (=> d!76179 (= res!284964 (isStrictlySorted!388 (toList!3969 lt!217373)))))

(assert (=> d!76179 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!296 (toList!3969 lt!217373) (_1!4508 lt!217352)) lt!217533)))

(declare-fun b!477453 () Bool)

(assert (=> b!477453 (= e!280537 (containsKey!348 (toList!3969 lt!217373) (_1!4508 lt!217352)))))

(assert (= (and d!76179 res!284964) b!477453))

(assert (=> d!76179 m!459243))

(assert (=> d!76179 m!459243))

(assert (=> d!76179 m!459477))

(declare-fun m!459819 () Bool)

(assert (=> d!76179 m!459819))

(declare-fun m!459821 () Bool)

(assert (=> d!76179 m!459821))

(assert (=> b!477453 m!459473))

(assert (=> b!477130 d!76179))

(declare-fun d!76181 () Bool)

(assert (=> d!76181 (= (isDefined!297 (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352))) (not (isEmpty!607 (getValueByKey!386 (toList!3969 lt!217373) (_1!4508 lt!217352)))))))

(declare-fun bs!15173 () Bool)

(assert (= bs!15173 d!76181))

(assert (=> bs!15173 m!459243))

(declare-fun m!459823 () Bool)

(assert (=> bs!15173 m!459823))

(assert (=> b!477130 d!76181))

(assert (=> b!477130 d!76035))

(declare-fun d!76183 () Bool)

(declare-fun res!284965 () Bool)

(declare-fun e!280538 () Bool)

(assert (=> d!76183 (=> res!284965 e!280538)))

(assert (=> d!76183 (= res!284965 ((_ is Nil!9051) (t!15120 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352))))))))

(assert (=> d!76183 (= (forall!198 (t!15120 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352)))) p!166) e!280538)))

(declare-fun b!477454 () Bool)

(declare-fun e!280539 () Bool)

(assert (=> b!477454 (= e!280538 e!280539)))

(declare-fun res!284966 () Bool)

(assert (=> b!477454 (=> (not res!284966) (not e!280539))))

(assert (=> b!477454 (= res!284966 (dynLambda!945 p!166 (h!9906 (t!15120 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352)))))))))

(declare-fun b!477455 () Bool)

(assert (=> b!477455 (= e!280539 (forall!198 (t!15120 (t!15120 (t!15120 (toList!3969 (+!1766 lt!217351 lt!217352))))) p!166))))

(assert (= (and d!76183 (not res!284965)) b!477454))

(assert (= (and b!477454 res!284966) b!477455))

(declare-fun b_lambda!10655 () Bool)

(assert (=> (not b_lambda!10655) (not b!477454)))

(declare-fun t!15194 () Bool)

(declare-fun tb!4095 () Bool)

(assert (=> (and start!42866 (= p!166 p!166) t!15194) tb!4095))

(declare-fun result!7663 () Bool)

(assert (=> tb!4095 (= result!7663 true)))

(assert (=> b!477454 t!15194))

(declare-fun b_and!20797 () Bool)

(assert (= b_and!20795 (and (=> t!15194 result!7663) b_and!20797)))

(declare-fun m!459825 () Bool)

(assert (=> b!477454 m!459825))

(declare-fun m!459827 () Bool)

(assert (=> b!477455 m!459827))

(assert (=> b!477019 d!76183))

(assert (=> b!477132 d!76181))

(assert (=> b!477132 d!76035))

(assert (=> d!76027 d!76025))

(declare-fun d!76185 () Bool)

(assert (=> d!76185 (= (getValueByKey!386 lt!217371 (_1!4508 lt!217352)) (Some!391 (_2!4508 lt!217352)))))

(assert (=> d!76185 true))

(declare-fun _$22!548 () Unit!14036)

(assert (=> d!76185 (= (choose!1364 lt!217371 (_1!4508 lt!217352) (_2!4508 lt!217352)) _$22!548)))

(declare-fun bs!15174 () Bool)

(assert (= bs!15174 d!76185))

(assert (=> bs!15174 m!459237))

(assert (=> d!76027 d!76185))

(declare-fun d!76187 () Bool)

(declare-fun res!284967 () Bool)

(declare-fun e!280540 () Bool)

(assert (=> d!76187 (=> res!284967 e!280540)))

(assert (=> d!76187 (= res!284967 (or ((_ is Nil!9051) lt!217371) ((_ is Nil!9051) (t!15120 lt!217371))))))

(assert (=> d!76187 (= (isStrictlySorted!388 lt!217371) e!280540)))

(declare-fun b!477456 () Bool)

(declare-fun e!280541 () Bool)

(assert (=> b!477456 (= e!280540 e!280541)))

(declare-fun res!284968 () Bool)

(assert (=> b!477456 (=> (not res!284968) (not e!280541))))

(assert (=> b!477456 (= res!284968 (bvslt (_1!4508 (h!9906 lt!217371)) (_1!4508 (h!9906 (t!15120 lt!217371)))))))

(declare-fun b!477457 () Bool)

(assert (=> b!477457 (= e!280541 (isStrictlySorted!388 (t!15120 lt!217371)))))

(assert (= (and d!76187 (not res!284967)) b!477456))

(assert (= (and b!477456 res!284968) b!477457))

(declare-fun m!459829 () Bool)

(assert (=> b!477457 m!459829))

(assert (=> d!76027 d!76187))

(declare-fun d!76189 () Bool)

(declare-fun lt!217534 () Bool)

(assert (=> d!76189 (= lt!217534 (select (content!206 lt!217451) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun e!280542 () Bool)

(assert (=> d!76189 (= lt!217534 e!280542)))

(declare-fun res!284969 () Bool)

(assert (=> d!76189 (=> (not res!284969) (not e!280542))))

(assert (=> d!76189 (= res!284969 ((_ is Cons!9050) lt!217451))))

(assert (=> d!76189 (= (contains!2569 lt!217451 (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))) lt!217534)))

(declare-fun b!477458 () Bool)

(declare-fun e!280543 () Bool)

(assert (=> b!477458 (= e!280542 e!280543)))

(declare-fun res!284970 () Bool)

(assert (=> b!477458 (=> res!284970 e!280543)))

(assert (=> b!477458 (= res!284970 (= (h!9906 lt!217451) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(declare-fun b!477459 () Bool)

(assert (=> b!477459 (= e!280543 (contains!2569 (t!15120 lt!217451) (tuple2!8995 (_1!4508 lt!217352) (_2!4508 lt!217352))))))

(assert (= (and d!76189 res!284969) b!477458))

(assert (= (and b!477458 (not res!284970)) b!477459))

(declare-fun m!459831 () Bool)

(assert (=> d!76189 m!459831))

(declare-fun m!459833 () Bool)

(assert (=> d!76189 m!459833))

(declare-fun m!459835 () Bool)

(assert (=> b!477459 m!459835))

(assert (=> b!477113 d!76189))

(declare-fun b!477460 () Bool)

(declare-fun e!280544 () Bool)

(declare-fun tp!42422 () Bool)

(assert (=> b!477460 (= e!280544 (and tp_is_empty!13527 tp!42422))))

(assert (=> b!477168 (= tp!42419 e!280544)))

(assert (= (and b!477168 ((_ is Cons!9050) (t!15120 (t!15120 (toList!3969 lm!215))))) b!477460))

(declare-fun b_lambda!10657 () Bool)

(assert (= b_lambda!10649 (or (and start!42866 b_free!12105) b_lambda!10657)))

(declare-fun b_lambda!10659 () Bool)

(assert (= b_lambda!10651 (or (and start!42866 b_free!12105) b_lambda!10659)))

(declare-fun b_lambda!10661 () Bool)

(assert (= b_lambda!10647 (or (and start!42866 b_free!12105) b_lambda!10661)))

(declare-fun b_lambda!10663 () Bool)

(assert (= b_lambda!10653 (or (and start!42866 b_free!12105) b_lambda!10663)))

(declare-fun b_lambda!10665 () Bool)

(assert (= b_lambda!10655 (or (and start!42866 b_free!12105) b_lambda!10665)))

(check-sat (not b!477443) (not d!76179) (not b_lambda!10657) (not b!477407) (not b!477358) (not b_lambda!10613) (not d!76107) tp_is_empty!13527 (not b!477348) (not d!76141) (not b_lambda!10605) (not b_lambda!10549) (not b!477399) (not b!477457) (not b!477460) (not b!477439) (not d!76143) (not b!477432) (not b!477383) (not b!477459) (not d!76189) (not b!477446) (not b!477350) (not b_lambda!10609) (not b!477356) (not d!76133) b_and!20797 (not d!76159) (not d!76157) (not b!477363) (not b!477397) (not b!477412) (not b_lambda!10611) (not b!477434) (not d!76161) (not b_lambda!10607) (not b!477436) (not b_next!12105) (not b!477409) (not b!477423) (not b!477351) (not b!477395) (not b!477403) (not b!477401) (not b!477367) (not b!477359) (not d!76153) (not b_lambda!10547) (not bm!30769) (not b_lambda!10663) (not b!477448) (not b!477418) (not b!477340) (not d!76101) (not b!477453) (not d!76181) (not b_lambda!10551) (not b!477375) (not b_lambda!10553) (not b_lambda!10659) (not b!477344) (not b_lambda!10521) (not b_lambda!10555) (not b!477415) (not b!477405) (not bm!30766) (not b!477342) (not d!76113) (not b!477386) (not b!477389) (not d!76121) (not b!477353) (not b!477452) (not d!76139) (not d!76185) (not b!477381) (not bm!30772) (not b!477393) (not b_lambda!10661) (not b!477427) (not b!477455) (not b!477450) (not b!477391) (not b_lambda!10665) (not b!477365) (not d!76111) (not d!76103) (not b!477425))
(check-sat b_and!20797 (not b_next!12105))
