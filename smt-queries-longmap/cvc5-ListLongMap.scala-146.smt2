; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2676 () Bool)

(assert start!2676)

(declare-fun b_free!553 () Bool)

(declare-fun b_next!553 () Bool)

(assert (=> start!2676 (= b_free!553 (not b_next!553))))

(declare-fun tp!2794 () Bool)

(declare-fun b_and!1053 () Bool)

(assert (=> start!2676 (= tp!2794 b_and!1053)))

(declare-fun res!11922 () Bool)

(declare-fun e!9743 () Bool)

(assert (=> start!2676 (=> (not res!11922) (not e!9743))))

(declare-datatypes ((B!674 0))(
  ( (B!675 (val!435 Int)) )
))
(declare-datatypes ((tuple2!670 0))(
  ( (tuple2!671 (_1!335 (_ BitVec 64)) (_2!335 B!674)) )
))
(declare-datatypes ((List!520 0))(
  ( (Nil!517) (Cons!516 (h!1082 tuple2!670) (t!3012 List!520)) )
))
(declare-datatypes ((ListLongMap!501 0))(
  ( (ListLongMap!502 (toList!266 List!520)) )
))
(declare-fun lm!221 () ListLongMap!501)

(declare-fun p!191 () Int)

(declare-fun forall!137 (List!520 Int) Bool)

(assert (=> start!2676 (= res!11922 (forall!137 (toList!266 lm!221) p!191))))

(assert (=> start!2676 e!9743))

(declare-fun e!9742 () Bool)

(declare-fun inv!872 (ListLongMap!501) Bool)

(assert (=> start!2676 (and (inv!872 lm!221) e!9742)))

(assert (=> start!2676 tp!2794))

(declare-fun b!15930 () Bool)

(declare-fun res!11923 () Bool)

(assert (=> b!15930 (=> (not res!11923) (not e!9743))))

(declare-fun isEmpty!144 (ListLongMap!501) Bool)

(assert (=> b!15930 (= res!11923 (not (isEmpty!144 lm!221)))))

(declare-fun b!15931 () Bool)

(declare-fun tail!68 (ListLongMap!501) ListLongMap!501)

(assert (=> b!15931 (= e!9743 (not (forall!137 (toList!266 (tail!68 lm!221)) p!191)))))

(declare-fun b!15932 () Bool)

(declare-fun tp!2795 () Bool)

(assert (=> b!15932 (= e!9742 tp!2795)))

(assert (= (and start!2676 res!11922) b!15930))

(assert (= (and b!15930 res!11923) b!15931))

(assert (= start!2676 b!15932))

(declare-fun m!10937 () Bool)

(assert (=> start!2676 m!10937))

(declare-fun m!10939 () Bool)

(assert (=> start!2676 m!10939))

(declare-fun m!10941 () Bool)

(assert (=> b!15930 m!10941))

(declare-fun m!10943 () Bool)

(assert (=> b!15931 m!10943))

(declare-fun m!10945 () Bool)

(assert (=> b!15931 m!10945))

(push 1)

(assert (not b!15932))

(assert (not start!2676))

(assert b_and!1053)

(assert (not b_next!553))

(assert (not b!15930))

(assert (not b!15931))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1053)

(assert (not b_next!553))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2885 () Bool)

(declare-fun isEmpty!147 (List!520) Bool)

(assert (=> d!2885 (= (isEmpty!144 lm!221) (isEmpty!147 (toList!266 lm!221)))))

(declare-fun bs!735 () Bool)

(assert (= bs!735 d!2885))

(declare-fun m!10967 () Bool)

(assert (=> bs!735 m!10967))

(assert (=> b!15930 d!2885))

(declare-fun d!2891 () Bool)

(declare-fun res!11948 () Bool)

(declare-fun e!9768 () Bool)

(assert (=> d!2891 (=> res!11948 e!9768)))

(assert (=> d!2891 (= res!11948 (is-Nil!517 (toList!266 (tail!68 lm!221))))))

(assert (=> d!2891 (= (forall!137 (toList!266 (tail!68 lm!221)) p!191) e!9768)))

(declare-fun b!15963 () Bool)

(declare-fun e!9769 () Bool)

(assert (=> b!15963 (= e!9768 e!9769)))

(declare-fun res!11949 () Bool)

(assert (=> b!15963 (=> (not res!11949) (not e!9769))))

(declare-fun dynLambda!120 (Int tuple2!670) Bool)

(assert (=> b!15963 (= res!11949 (dynLambda!120 p!191 (h!1082 (toList!266 (tail!68 lm!221)))))))

(declare-fun b!15964 () Bool)

(assert (=> b!15964 (= e!9769 (forall!137 (t!3012 (toList!266 (tail!68 lm!221))) p!191))))

(assert (= (and d!2891 (not res!11948)) b!15963))

(assert (= (and b!15963 res!11949) b!15964))

(declare-fun b_lambda!1151 () Bool)

(assert (=> (not b_lambda!1151) (not b!15963)))

(declare-fun t!3016 () Bool)

(declare-fun tb!483 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3016) tb!483))

(declare-fun result!837 () Bool)

(assert (=> tb!483 (= result!837 true)))

(assert (=> b!15963 t!3016))

(declare-fun b_and!1059 () Bool)

(assert (= b_and!1053 (and (=> t!3016 result!837) b_and!1059)))

(declare-fun m!10973 () Bool)

(assert (=> b!15963 m!10973))

(declare-fun m!10975 () Bool)

(assert (=> b!15964 m!10975))

(assert (=> b!15931 d!2891))

(declare-fun d!2897 () Bool)

(declare-fun tail!71 (List!520) List!520)

(assert (=> d!2897 (= (tail!68 lm!221) (ListLongMap!502 (tail!71 (toList!266 lm!221))))))

(declare-fun bs!738 () Bool)

(assert (= bs!738 d!2897))

(declare-fun m!10985 () Bool)

(assert (=> bs!738 m!10985))

(assert (=> b!15931 d!2897))

(declare-fun d!2903 () Bool)

(declare-fun res!11954 () Bool)

(declare-fun e!9774 () Bool)

(assert (=> d!2903 (=> res!11954 e!9774)))

(assert (=> d!2903 (= res!11954 (is-Nil!517 (toList!266 lm!221)))))

(assert (=> d!2903 (= (forall!137 (toList!266 lm!221) p!191) e!9774)))

(declare-fun b!15969 () Bool)

(declare-fun e!9775 () Bool)

(assert (=> b!15969 (= e!9774 e!9775)))

(declare-fun res!11955 () Bool)

(assert (=> b!15969 (=> (not res!11955) (not e!9775))))

(assert (=> b!15969 (= res!11955 (dynLambda!120 p!191 (h!1082 (toList!266 lm!221))))))

(declare-fun b!15970 () Bool)

(assert (=> b!15970 (= e!9775 (forall!137 (t!3012 (toList!266 lm!221)) p!191))))

(assert (= (and d!2903 (not res!11954)) b!15969))

(assert (= (and b!15969 res!11955) b!15970))

(declare-fun b_lambda!1157 () Bool)

(assert (=> (not b_lambda!1157) (not b!15969)))

(declare-fun t!3022 () Bool)

(declare-fun tb!489 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3022) tb!489))

(declare-fun result!843 () Bool)

(assert (=> tb!489 (= result!843 true)))

(assert (=> b!15969 t!3022))

(declare-fun b_and!1065 () Bool)

(assert (= b_and!1059 (and (=> t!3022 result!843) b_and!1065)))

(declare-fun m!10989 () Bool)

(assert (=> b!15969 m!10989))

(declare-fun m!10991 () Bool)

(assert (=> b!15970 m!10991))

(assert (=> start!2676 d!2903))

(declare-fun d!2907 () Bool)

(declare-fun isStrictlySorted!158 (List!520) Bool)

(assert (=> d!2907 (= (inv!872 lm!221) (isStrictlySorted!158 (toList!266 lm!221)))))

(declare-fun bs!741 () Bool)

(assert (= bs!741 d!2907))

(declare-fun m!11003 () Bool)

(assert (=> bs!741 m!11003))

(assert (=> start!2676 d!2907))

(declare-fun b!15983 () Bool)

(declare-fun e!9784 () Bool)

(declare-fun tp_is_empty!817 () Bool)

(declare-fun tp!2810 () Bool)

(assert (=> b!15983 (= e!9784 (and tp_is_empty!817 tp!2810))))

(assert (=> b!15932 (= tp!2795 e!9784)))

(assert (= (and b!15932 (is-Cons!516 (toList!266 lm!221))) b!15983))

(declare-fun b_lambda!1163 () Bool)

(assert (= b_lambda!1151 (or (and start!2676 b_free!553) b_lambda!1163)))

(declare-fun b_lambda!1165 () Bool)

(assert (= b_lambda!1157 (or (and start!2676 b_free!553) b_lambda!1165)))

(push 1)

(assert (not d!2885))

(assert (not b_lambda!1163))

(assert (not d!2907))

(assert b_and!1065)

(assert tp_is_empty!817)

(assert (not b_lambda!1165))

(assert (not b!15964))

(assert (not b!15983))

(assert (not d!2897))

(assert (not b!15970))

(assert (not b_next!553))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1065)

(assert (not b_next!553))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2917 () Bool)

(assert (=> d!2917 (= (tail!71 (toList!266 lm!221)) (t!3012 (toList!266 lm!221)))))

(assert (=> d!2897 d!2917))

(declare-fun d!2919 () Bool)

(declare-fun res!11970 () Bool)

(declare-fun e!9799 () Bool)

(assert (=> d!2919 (=> res!11970 e!9799)))

(assert (=> d!2919 (= res!11970 (or (is-Nil!517 (toList!266 lm!221)) (is-Nil!517 (t!3012 (toList!266 lm!221)))))))

(assert (=> d!2919 (= (isStrictlySorted!158 (toList!266 lm!221)) e!9799)))

(declare-fun b!16000 () Bool)

(declare-fun e!9800 () Bool)

(assert (=> b!16000 (= e!9799 e!9800)))

(declare-fun res!11971 () Bool)

(assert (=> b!16000 (=> (not res!11971) (not e!9800))))

(assert (=> b!16000 (= res!11971 (bvslt (_1!335 (h!1082 (toList!266 lm!221))) (_1!335 (h!1082 (t!3012 (toList!266 lm!221))))))))

(declare-fun b!16001 () Bool)

(assert (=> b!16001 (= e!9800 (isStrictlySorted!158 (t!3012 (toList!266 lm!221))))))

(assert (= (and d!2919 (not res!11970)) b!16000))

(assert (= (and b!16000 res!11971) b!16001))

(declare-fun m!11011 () Bool)

(assert (=> b!16001 m!11011))

(assert (=> d!2907 d!2919))

(declare-fun d!2927 () Bool)

(assert (=> d!2927 (= (isEmpty!147 (toList!266 lm!221)) (is-Nil!517 (toList!266 lm!221)))))

(assert (=> d!2885 d!2927))

(declare-fun d!2929 () Bool)

(declare-fun res!11974 () Bool)

(declare-fun e!9803 () Bool)

(assert (=> d!2929 (=> res!11974 e!9803)))

(assert (=> d!2929 (= res!11974 (is-Nil!517 (t!3012 (toList!266 (tail!68 lm!221)))))))

(assert (=> d!2929 (= (forall!137 (t!3012 (toList!266 (tail!68 lm!221))) p!191) e!9803)))

(declare-fun b!16004 () Bool)

(declare-fun e!9804 () Bool)

(assert (=> b!16004 (= e!9803 e!9804)))

(declare-fun res!11975 () Bool)

(assert (=> b!16004 (=> (not res!11975) (not e!9804))))

(assert (=> b!16004 (= res!11975 (dynLambda!120 p!191 (h!1082 (t!3012 (toList!266 (tail!68 lm!221))))))))

(declare-fun b!16005 () Bool)

(assert (=> b!16005 (= e!9804 (forall!137 (t!3012 (t!3012 (toList!266 (tail!68 lm!221)))) p!191))))

(assert (= (and d!2929 (not res!11974)) b!16004))

(assert (= (and b!16004 res!11975) b!16005))

(declare-fun b_lambda!1177 () Bool)

(assert (=> (not b_lambda!1177) (not b!16004)))

(declare-fun t!3030 () Bool)

(declare-fun tb!497 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3030) tb!497))

(declare-fun result!857 () Bool)

(assert (=> tb!497 (= result!857 true)))

(assert (=> b!16004 t!3030))

(declare-fun b_and!1073 () Bool)

(assert (= b_and!1065 (and (=> t!3030 result!857) b_and!1073)))

(declare-fun m!11017 () Bool)

(assert (=> b!16004 m!11017))

(declare-fun m!11019 () Bool)

(assert (=> b!16005 m!11019))

(assert (=> b!15964 d!2929))

(declare-fun d!2933 () Bool)

(declare-fun res!11978 () Bool)

(declare-fun e!9807 () Bool)

(assert (=> d!2933 (=> res!11978 e!9807)))

(assert (=> d!2933 (= res!11978 (is-Nil!517 (t!3012 (toList!266 lm!221))))))

(assert (=> d!2933 (= (forall!137 (t!3012 (toList!266 lm!221)) p!191) e!9807)))

(declare-fun b!16008 () Bool)

(declare-fun e!9808 () Bool)

(assert (=> b!16008 (= e!9807 e!9808)))

(declare-fun res!11979 () Bool)

(assert (=> b!16008 (=> (not res!11979) (not e!9808))))

(assert (=> b!16008 (= res!11979 (dynLambda!120 p!191 (h!1082 (t!3012 (toList!266 lm!221)))))))

(declare-fun b!16009 () Bool)

(assert (=> b!16009 (= e!9808 (forall!137 (t!3012 (t!3012 (toList!266 lm!221))) p!191))))

(assert (= (and d!2933 (not res!11978)) b!16008))

(assert (= (and b!16008 res!11979) b!16009))

(declare-fun b_lambda!1181 () Bool)

(assert (=> (not b_lambda!1181) (not b!16008)))

(declare-fun t!3034 () Bool)

(declare-fun tb!501 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3034) tb!501))

(declare-fun result!861 () Bool)

(assert (=> tb!501 (= result!861 true)))

(assert (=> b!16008 t!3034))

(declare-fun b_and!1077 () Bool)

(assert (= b_and!1073 (and (=> t!3034 result!861) b_and!1077)))

(declare-fun m!11025 () Bool)

(assert (=> b!16008 m!11025))

(declare-fun m!11027 () Bool)

(assert (=> b!16009 m!11027))

(assert (=> b!15970 d!2933))

(declare-fun b!16011 () Bool)

(declare-fun e!9810 () Bool)

(declare-fun tp!2818 () Bool)

(assert (=> b!16011 (= e!9810 (and tp_is_empty!817 tp!2818))))

(assert (=> b!15983 (= tp!2810 e!9810)))

(assert (= (and b!15983 (is-Cons!516 (t!3012 (toList!266 lm!221)))) b!16011))

(declare-fun b_lambda!1187 () Bool)

(assert (= b_lambda!1181 (or (and start!2676 b_free!553) b_lambda!1187)))

(declare-fun b_lambda!1189 () Bool)

(assert (= b_lambda!1177 (or (and start!2676 b_free!553) b_lambda!1189)))

(push 1)

