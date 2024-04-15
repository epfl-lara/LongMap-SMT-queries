; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2680 () Bool)

(assert start!2680)

(declare-fun b_free!557 () Bool)

(declare-fun b_next!557 () Bool)

(assert (=> start!2680 (= b_free!557 (not b_next!557))))

(declare-fun tp!2807 () Bool)

(declare-fun b_and!1057 () Bool)

(assert (=> start!2680 (= tp!2807 b_and!1057)))

(declare-fun res!11934 () Bool)

(declare-fun e!9755 () Bool)

(assert (=> start!2680 (=> (not res!11934) (not e!9755))))

(declare-datatypes ((B!678 0))(
  ( (B!679 (val!437 Int)) )
))
(declare-datatypes ((tuple2!670 0))(
  ( (tuple2!671 (_1!335 (_ BitVec 64)) (_2!335 B!678)) )
))
(declare-datatypes ((List!518 0))(
  ( (Nil!515) (Cons!514 (h!1080 tuple2!670) (t!3010 List!518)) )
))
(declare-datatypes ((ListLongMap!501 0))(
  ( (ListLongMap!502 (toList!266 List!518)) )
))
(declare-fun lm!221 () ListLongMap!501)

(declare-fun p!191 () Int)

(declare-fun forall!139 (List!518 Int) Bool)

(assert (=> start!2680 (= res!11934 (forall!139 (toList!266 lm!221) p!191))))

(assert (=> start!2680 e!9755))

(declare-fun e!9754 () Bool)

(declare-fun inv!874 (ListLongMap!501) Bool)

(assert (=> start!2680 (and (inv!874 lm!221) e!9754)))

(assert (=> start!2680 tp!2807))

(declare-fun b!15948 () Bool)

(declare-fun res!11935 () Bool)

(assert (=> b!15948 (=> (not res!11935) (not e!9755))))

(declare-fun isEmpty!146 (ListLongMap!501) Bool)

(assert (=> b!15948 (= res!11935 (not (isEmpty!146 lm!221)))))

(declare-fun b!15949 () Bool)

(declare-fun tail!70 (ListLongMap!501) ListLongMap!501)

(assert (=> b!15949 (= e!9755 (not (forall!139 (toList!266 (tail!70 lm!221)) p!191)))))

(declare-fun b!15950 () Bool)

(declare-fun tp!2806 () Bool)

(assert (=> b!15950 (= e!9754 tp!2806)))

(assert (= (and start!2680 res!11934) b!15948))

(assert (= (and b!15948 res!11935) b!15949))

(assert (= start!2680 b!15950))

(declare-fun m!10949 () Bool)

(assert (=> start!2680 m!10949))

(declare-fun m!10951 () Bool)

(assert (=> start!2680 m!10951))

(declare-fun m!10953 () Bool)

(assert (=> b!15948 m!10953))

(declare-fun m!10955 () Bool)

(assert (=> b!15949 m!10955))

(declare-fun m!10957 () Bool)

(assert (=> b!15949 m!10957))

(push 1)

(assert (not start!2680))

(assert (not b!15950))

(assert (not b!15949))

(assert (not b!15948))

(assert b_and!1057)

(assert (not b_next!557))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1057)

(assert (not b_next!557))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2886 () Bool)

(declare-fun res!11944 () Bool)

(declare-fun e!9764 () Bool)

(assert (=> d!2886 (=> res!11944 e!9764)))

(assert (=> d!2886 (= res!11944 (is-Nil!515 (toList!266 lm!221)))))

(assert (=> d!2886 (= (forall!139 (toList!266 lm!221) p!191) e!9764)))

(declare-fun b!15959 () Bool)

(declare-fun e!9765 () Bool)

(assert (=> b!15959 (= e!9764 e!9765)))

(declare-fun res!11945 () Bool)

(assert (=> b!15959 (=> (not res!11945) (not e!9765))))

(declare-fun dynLambda!119 (Int tuple2!670) Bool)

(assert (=> b!15959 (= res!11945 (dynLambda!119 p!191 (h!1080 (toList!266 lm!221))))))

(declare-fun b!15960 () Bool)

(assert (=> b!15960 (= e!9765 (forall!139 (t!3010 (toList!266 lm!221)) p!191))))

(assert (= (and d!2886 (not res!11944)) b!15959))

(assert (= (and b!15959 res!11945) b!15960))

(declare-fun b_lambda!1151 () Bool)

(assert (=> (not b_lambda!1151) (not b!15959)))

(declare-fun t!3012 () Bool)

(declare-fun tb!483 () Bool)

(assert (=> (and start!2680 (= p!191 p!191) t!3012) tb!483))

(declare-fun result!837 () Bool)

(assert (=> tb!483 (= result!837 true)))

(assert (=> b!15959 t!3012))

(declare-fun b_and!1059 () Bool)

(assert (= b_and!1057 (and (=> t!3012 result!837) b_and!1059)))

(declare-fun m!10959 () Bool)

(assert (=> b!15959 m!10959))

(declare-fun m!10961 () Bool)

(assert (=> b!15960 m!10961))

(assert (=> start!2680 d!2886))

(declare-fun d!2891 () Bool)

(declare-fun isStrictlySorted!152 (List!518) Bool)

(assert (=> d!2891 (= (inv!874 lm!221) (isStrictlySorted!152 (toList!266 lm!221)))))

(declare-fun bs!735 () Bool)

(assert (= bs!735 d!2891))

(declare-fun m!10967 () Bool)

(assert (=> bs!735 m!10967))

(assert (=> start!2680 d!2891))

(declare-fun d!2895 () Bool)

(declare-fun isEmpty!147 (List!518) Bool)

(assert (=> d!2895 (= (isEmpty!146 lm!221) (isEmpty!147 (toList!266 lm!221)))))

(declare-fun bs!736 () Bool)

(assert (= bs!736 d!2895))

(declare-fun m!10969 () Bool)

(assert (=> bs!736 m!10969))

(assert (=> b!15948 d!2895))

(declare-fun d!2897 () Bool)

(declare-fun res!11954 () Bool)

(declare-fun e!9774 () Bool)

(assert (=> d!2897 (=> res!11954 e!9774)))

(assert (=> d!2897 (= res!11954 (is-Nil!515 (toList!266 (tail!70 lm!221))))))

(assert (=> d!2897 (= (forall!139 (toList!266 (tail!70 lm!221)) p!191) e!9774)))

(declare-fun b!15969 () Bool)

(declare-fun e!9775 () Bool)

(assert (=> b!15969 (= e!9774 e!9775)))

(declare-fun res!11955 () Bool)

(assert (=> b!15969 (=> (not res!11955) (not e!9775))))

(assert (=> b!15969 (= res!11955 (dynLambda!119 p!191 (h!1080 (toList!266 (tail!70 lm!221)))))))

(declare-fun b!15970 () Bool)

(assert (=> b!15970 (= e!9775 (forall!139 (t!3010 (toList!266 (tail!70 lm!221))) p!191))))

(assert (= (and d!2897 (not res!11954)) b!15969))

(assert (= (and b!15969 res!11955) b!15970))

(declare-fun b_lambda!1157 () Bool)

(assert (=> (not b_lambda!1157) (not b!15969)))

(declare-fun t!3018 () Bool)

(declare-fun tb!489 () Bool)

(assert (=> (and start!2680 (= p!191 p!191) t!3018) tb!489))

(declare-fun result!843 () Bool)

(assert (=> tb!489 (= result!843 true)))

(assert (=> b!15969 t!3018))

(declare-fun b_and!1065 () Bool)

(assert (= b_and!1059 (and (=> t!3018 result!843) b_and!1065)))

(declare-fun m!10977 () Bool)

(assert (=> b!15969 m!10977))

(declare-fun m!10979 () Bool)

(assert (=> b!15970 m!10979))

(assert (=> b!15949 d!2897))

(declare-fun d!2903 () Bool)

(declare-fun tail!71 (List!518) List!518)

(assert (=> d!2903 (= (tail!70 lm!221) (ListLongMap!502 (tail!71 (toList!266 lm!221))))))

(declare-fun bs!739 () Bool)

(assert (= bs!739 d!2903))

(declare-fun m!10983 () Bool)

(assert (=> bs!739 m!10983))

(assert (=> b!15949 d!2903))

(declare-fun b!15977 () Bool)

(declare-fun e!9780 () Bool)

(declare-fun tp_is_empty!817 () Bool)

(declare-fun tp!2810 () Bool)

(assert (=> b!15977 (= e!9780 (and tp_is_empty!817 tp!2810))))

(assert (=> b!15950 (= tp!2806 e!9780)))

(assert (= (and b!15950 (is-Cons!514 (toList!266 lm!221))) b!15977))

(declare-fun b_lambda!1161 () Bool)

(assert (= b_lambda!1157 (or (and start!2680 b_free!557) b_lambda!1161)))

(declare-fun b_lambda!1163 () Bool)

(assert (= b_lambda!1151 (or (and start!2680 b_free!557) b_lambda!1163)))

(push 1)

(assert b_and!1065)

(assert (not b!15977))

(assert (not d!2895))

(assert (not d!2891))

(assert (not b!15960))

(assert tp_is_empty!817)

(assert (not b_lambda!1163))

(assert (not d!2903))

(assert (not b_lambda!1161))

(assert (not b_next!557))

(assert (not b!15970))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1065)

(assert (not b_next!557))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2915 () Bool)

(declare-fun res!11964 () Bool)

(declare-fun e!9793 () Bool)

(assert (=> d!2915 (=> res!11964 e!9793)))

(assert (=> d!2915 (= res!11964 (or (is-Nil!515 (toList!266 lm!221)) (is-Nil!515 (t!3010 (toList!266 lm!221)))))))

(assert (=> d!2915 (= (isStrictlySorted!152 (toList!266 lm!221)) e!9793)))

(declare-fun b!15994 () Bool)

(declare-fun e!9794 () Bool)

(assert (=> b!15994 (= e!9793 e!9794)))

(declare-fun res!11965 () Bool)

(assert (=> b!15994 (=> (not res!11965) (not e!9794))))

(assert (=> b!15994 (= res!11965 (bvslt (_1!335 (h!1080 (toList!266 lm!221))) (_1!335 (h!1080 (t!3010 (toList!266 lm!221))))))))

(declare-fun b!15995 () Bool)

(assert (=> b!15995 (= e!9794 (isStrictlySorted!152 (t!3010 (toList!266 lm!221))))))

(assert (= (and d!2915 (not res!11964)) b!15994))

(assert (= (and b!15994 res!11965) b!15995))

(declare-fun m!11001 () Bool)

(assert (=> b!15995 m!11001))

(assert (=> d!2891 d!2915))

(declare-fun d!2917 () Bool)

(assert (=> d!2917 (= (tail!71 (toList!266 lm!221)) (t!3010 (toList!266 lm!221)))))

(assert (=> d!2903 d!2917))

(declare-fun d!2919 () Bool)

(assert (=> d!2919 (= (isEmpty!147 (toList!266 lm!221)) (is-Nil!515 (toList!266 lm!221)))))

(assert (=> d!2895 d!2919))

(declare-fun d!2923 () Bool)

(declare-fun res!11966 () Bool)

(declare-fun e!9795 () Bool)

(assert (=> d!2923 (=> res!11966 e!9795)))

(assert (=> d!2923 (= res!11966 (is-Nil!515 (t!3010 (toList!266 (tail!70 lm!221)))))))

(assert (=> d!2923 (= (forall!139 (t!3010 (toList!266 (tail!70 lm!221))) p!191) e!9795)))

(declare-fun b!15996 () Bool)

(declare-fun e!9796 () Bool)

(assert (=> b!15996 (= e!9795 e!9796)))

(declare-fun res!11967 () Bool)

(assert (=> b!15996 (=> (not res!11967) (not e!9796))))

(assert (=> b!15996 (= res!11967 (dynLambda!119 p!191 (h!1080 (t!3010 (toList!266 (tail!70 lm!221))))))))

(declare-fun b!15997 () Bool)

(assert (=> b!15997 (= e!9796 (forall!139 (t!3010 (t!3010 (toList!266 (tail!70 lm!221)))) p!191))))

(assert (= (and d!2923 (not res!11966)) b!15996))

(assert (= (and b!15996 res!11967) b!15997))

(declare-fun b_lambda!1175 () Bool)

(assert (=> (not b_lambda!1175) (not b!15996)))

(declare-fun t!3024 () Bool)

(declare-fun tb!495 () Bool)

(assert (=> (and start!2680 (= p!191 p!191) t!3024) tb!495))

(declare-fun result!855 () Bool)

(assert (=> tb!495 (= result!855 true)))

(assert (=> b!15996 t!3024))

(declare-fun b_and!1071 () Bool)

(assert (= b_and!1065 (and (=> t!3024 result!855) b_and!1071)))

(declare-fun m!11003 () Bool)

(assert (=> b!15996 m!11003))

(declare-fun m!11005 () Bool)

(assert (=> b!15997 m!11005))

(assert (=> b!15970 d!2923))

(declare-fun d!2927 () Bool)

(declare-fun res!11968 () Bool)

(declare-fun e!9797 () Bool)

(assert (=> d!2927 (=> res!11968 e!9797)))

(assert (=> d!2927 (= res!11968 (is-Nil!515 (t!3010 (toList!266 lm!221))))))

(assert (=> d!2927 (= (forall!139 (t!3010 (toList!266 lm!221)) p!191) e!9797)))

(declare-fun b!15998 () Bool)

(declare-fun e!9798 () Bool)

(assert (=> b!15998 (= e!9797 e!9798)))

(declare-fun res!11969 () Bool)

(assert (=> b!15998 (=> (not res!11969) (not e!9798))))

(assert (=> b!15998 (= res!11969 (dynLambda!119 p!191 (h!1080 (t!3010 (toList!266 lm!221)))))))

(declare-fun b!15999 () Bool)

(assert (=> b!15999 (= e!9798 (forall!139 (t!3010 (t!3010 (toList!266 lm!221))) p!191))))

(assert (= (and d!2927 (not res!11968)) b!15998))

(assert (= (and b!15998 res!11969) b!15999))

(declare-fun b_lambda!1177 () Bool)

(assert (=> (not b_lambda!1177) (not b!15998)))

(declare-fun t!3026 () Bool)

(declare-fun tb!497 () Bool)

(assert (=> (and start!2680 (= p!191 p!191) t!3026) tb!497))

(declare-fun result!857 () Bool)

(assert (=> tb!497 (= result!857 true)))

(assert (=> b!15998 t!3026))

(declare-fun b_and!1073 () Bool)

(assert (= b_and!1071 (and (=> t!3026 result!857) b_and!1073)))

(declare-fun m!11007 () Bool)

(assert (=> b!15998 m!11007))

(declare-fun m!11009 () Bool)

(assert (=> b!15999 m!11009))

(assert (=> b!15960 d!2927))

(declare-fun b!16004 () Bool)

(declare-fun e!9803 () Bool)

(declare-fun tp!2817 () Bool)

(assert (=> b!16004 (= e!9803 (and tp_is_empty!817 tp!2817))))

(assert (=> b!15977 (= tp!2810 e!9803)))

(assert (= (and b!15977 (is-Cons!514 (t!3010 (toList!266 lm!221)))) b!16004))

(declare-fun b_lambda!1179 () Bool)

(assert (= b_lambda!1177 (or (and start!2680 b_free!557) b_lambda!1179)))

(declare-fun b_lambda!1181 () Bool)

(assert (= b_lambda!1175 (or (and start!2680 b_free!557) b_lambda!1181)))

(push 1)

(assert (not b_lambda!1179))

(assert b_and!1073)

(assert tp_is_empty!817)

(assert (not b!15995))

(assert (not b_lambda!1161))

(assert (not b_next!557))

(assert (not b!15999))

(assert (not b!15997))

(assert (not b_lambda!1181))

(assert (not b!16004))

(assert (not b_lambda!1163))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1073)

(assert (not b_next!557))

(check-sat)

(pop 1)

