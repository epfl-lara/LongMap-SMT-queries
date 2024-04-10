; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2680 () Bool)

(assert start!2680)

(declare-fun b_free!557 () Bool)

(declare-fun b_next!557 () Bool)

(assert (=> start!2680 (= b_free!557 (not b_next!557))))

(declare-fun tp!2806 () Bool)

(declare-fun b_and!1057 () Bool)

(assert (=> start!2680 (= tp!2806 b_and!1057)))

(declare-fun res!11935 () Bool)

(declare-fun e!9755 () Bool)

(assert (=> start!2680 (=> (not res!11935) (not e!9755))))

(declare-datatypes ((B!678 0))(
  ( (B!679 (val!437 Int)) )
))
(declare-datatypes ((tuple2!674 0))(
  ( (tuple2!675 (_1!337 (_ BitVec 64)) (_2!337 B!678)) )
))
(declare-datatypes ((List!522 0))(
  ( (Nil!519) (Cons!518 (h!1084 tuple2!674) (t!3014 List!522)) )
))
(declare-datatypes ((ListLongMap!505 0))(
  ( (ListLongMap!506 (toList!268 List!522)) )
))
(declare-fun lm!221 () ListLongMap!505)

(declare-fun p!191 () Int)

(declare-fun forall!139 (List!522 Int) Bool)

(assert (=> start!2680 (= res!11935 (forall!139 (toList!268 lm!221) p!191))))

(assert (=> start!2680 e!9755))

(declare-fun e!9754 () Bool)

(declare-fun inv!874 (ListLongMap!505) Bool)

(assert (=> start!2680 (and (inv!874 lm!221) e!9754)))

(assert (=> start!2680 tp!2806))

(declare-fun b!15948 () Bool)

(declare-fun res!11934 () Bool)

(assert (=> b!15948 (=> (not res!11934) (not e!9755))))

(declare-fun isEmpty!146 (ListLongMap!505) Bool)

(assert (=> b!15948 (= res!11934 (not (isEmpty!146 lm!221)))))

(declare-fun b!15949 () Bool)

(declare-fun tail!70 (ListLongMap!505) ListLongMap!505)

(assert (=> b!15949 (= e!9755 (not (forall!139 (toList!268 (tail!70 lm!221)) p!191)))))

(declare-fun b!15950 () Bool)

(declare-fun tp!2807 () Bool)

(assert (=> b!15950 (= e!9754 tp!2807)))

(assert (= (and start!2680 res!11935) b!15948))

(assert (= (and b!15948 res!11934) b!15949))

(assert (= start!2680 b!15950))

(declare-fun m!10957 () Bool)

(assert (=> start!2680 m!10957))

(declare-fun m!10959 () Bool)

(assert (=> start!2680 m!10959))

(declare-fun m!10961 () Bool)

(assert (=> b!15948 m!10961))

(declare-fun m!10963 () Bool)

(assert (=> b!15949 m!10963))

(declare-fun m!10965 () Bool)

(assert (=> b!15949 m!10965))

(push 1)

(assert (not b!15949))

(assert (not b!15948))

(assert b_and!1057)

(assert (not start!2680))

(assert (not b_next!557))

(assert (not b!15950))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1057)

(assert (not b_next!557))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2887 () Bool)

(declare-fun isEmpty!148 (List!522) Bool)

(assert (=> d!2887 (= (isEmpty!146 lm!221) (isEmpty!148 (toList!268 lm!221)))))

(declare-fun bs!736 () Bool)

(assert (= bs!736 d!2887))

(declare-fun m!10969 () Bool)

(assert (=> bs!736 m!10969))

(assert (=> b!15948 d!2887))

(declare-fun d!2893 () Bool)

(declare-fun res!11950 () Bool)

(declare-fun e!9770 () Bool)

(assert (=> d!2893 (=> res!11950 e!9770)))

(assert (=> d!2893 (= res!11950 (is-Nil!519 (toList!268 (tail!70 lm!221))))))

(assert (=> d!2893 (= (forall!139 (toList!268 (tail!70 lm!221)) p!191) e!9770)))

(declare-fun b!15965 () Bool)

(declare-fun e!9771 () Bool)

(assert (=> b!15965 (= e!9770 e!9771)))

(declare-fun res!11951 () Bool)

(assert (=> b!15965 (=> (not res!11951) (not e!9771))))

(declare-fun dynLambda!121 (Int tuple2!674) Bool)

(assert (=> b!15965 (= res!11951 (dynLambda!121 p!191 (h!1084 (toList!268 (tail!70 lm!221)))))))

(declare-fun b!15966 () Bool)

(assert (=> b!15966 (= e!9771 (forall!139 (t!3014 (toList!268 (tail!70 lm!221))) p!191))))

(assert (= (and d!2893 (not res!11950)) b!15965))

(assert (= (and b!15965 res!11951) b!15966))

(declare-fun b_lambda!1153 () Bool)

(assert (=> (not b_lambda!1153) (not b!15965)))

(declare-fun t!3018 () Bool)

(declare-fun tb!485 () Bool)

(assert (=> (and start!2680 (= p!191 p!191) t!3018) tb!485))

(declare-fun result!839 () Bool)

(assert (=> tb!485 (= result!839 true)))

(assert (=> b!15965 t!3018))

(declare-fun b_and!1061 () Bool)

(assert (= b_and!1057 (and (=> t!3018 result!839) b_and!1061)))

(declare-fun m!10977 () Bool)

(assert (=> b!15965 m!10977))

(declare-fun m!10979 () Bool)

(assert (=> b!15966 m!10979))

(assert (=> b!15949 d!2893))

(declare-fun d!2899 () Bool)

(declare-fun tail!73 (List!522) List!522)

(assert (=> d!2899 (= (tail!70 lm!221) (ListLongMap!506 (tail!73 (toList!268 lm!221))))))

(declare-fun bs!739 () Bool)

(assert (= bs!739 d!2899))

(declare-fun m!10987 () Bool)

(assert (=> bs!739 m!10987))

(assert (=> b!15949 d!2899))

(declare-fun d!2905 () Bool)

(declare-fun res!11956 () Bool)

(declare-fun e!9776 () Bool)

(assert (=> d!2905 (=> res!11956 e!9776)))

(assert (=> d!2905 (= res!11956 (is-Nil!519 (toList!268 lm!221)))))

(assert (=> d!2905 (= (forall!139 (toList!268 lm!221) p!191) e!9776)))

(declare-fun b!15971 () Bool)

(declare-fun e!9777 () Bool)

(assert (=> b!15971 (= e!9776 e!9777)))

(declare-fun res!11957 () Bool)

(assert (=> b!15971 (=> (not res!11957) (not e!9777))))

(assert (=> b!15971 (= res!11957 (dynLambda!121 p!191 (h!1084 (toList!268 lm!221))))))

(declare-fun b!15972 () Bool)

(assert (=> b!15972 (= e!9777 (forall!139 (t!3014 (toList!268 lm!221)) p!191))))

(assert (= (and d!2905 (not res!11956)) b!15971))

(assert (= (and b!15971 res!11957) b!15972))

(declare-fun b_lambda!1159 () Bool)

(assert (=> (not b_lambda!1159) (not b!15971)))

(declare-fun t!3024 () Bool)

(declare-fun tb!491 () Bool)

(assert (=> (and start!2680 (= p!191 p!191) t!3024) tb!491))

(declare-fun result!845 () Bool)

(assert (=> tb!491 (= result!845 true)))

(assert (=> b!15971 t!3024))

(declare-fun b_and!1067 () Bool)

(assert (= b_and!1061 (and (=> t!3024 result!845) b_and!1067)))

(declare-fun m!10995 () Bool)

(assert (=> b!15971 m!10995))

(declare-fun m!10997 () Bool)

(assert (=> b!15972 m!10997))

(assert (=> start!2680 d!2905))

(declare-fun d!2911 () Bool)

(declare-fun isStrictlySorted!160 (List!522) Bool)

(assert (=> d!2911 (= (inv!874 lm!221) (isStrictlySorted!160 (toList!268 lm!221)))))

(declare-fun bs!742 () Bool)

(assert (= bs!742 d!2911))

(declare-fun m!11005 () Bool)

(assert (=> bs!742 m!11005))

(assert (=> start!2680 d!2911))

(declare-fun b!15988 () Bool)

(declare-fun e!9787 () Bool)

(declare-fun tp_is_empty!819 () Bool)

(declare-fun tp!2813 () Bool)

(assert (=> b!15988 (= e!9787 (and tp_is_empty!819 tp!2813))))

(assert (=> b!15950 (= tp!2807 e!9787)))

(assert (= (and b!15950 (is-Cons!518 (toList!268 lm!221))) b!15988))

(declare-fun b_lambda!1167 () Bool)

(assert (= b_lambda!1153 (or (and start!2680 b_free!557) b_lambda!1167)))

(declare-fun b_lambda!1169 () Bool)

(assert (= b_lambda!1159 (or (and start!2680 b_free!557) b_lambda!1169)))

(push 1)

(assert b_and!1067)

(assert (not b_lambda!1167))

(assert (not d!2887))

(assert tp_is_empty!819)

(assert (not b!15972))

(assert (not b!15988))

(assert (not b_lambda!1169))

(assert (not b_next!557))

(assert (not b!15966))

(assert (not d!2899))

(assert (not d!2911))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1067)

(assert (not b_next!557))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2935 () Bool)

(assert (=> d!2935 (= (tail!73 (toList!268 lm!221)) (t!3014 (toList!268 lm!221)))))

(assert (=> d!2899 d!2935))

(declare-fun d!2937 () Bool)

(assert (=> d!2937 (= (isEmpty!148 (toList!268 lm!221)) (is-Nil!519 (toList!268 lm!221)))))

(assert (=> d!2887 d!2937))

(declare-fun d!2939 () Bool)

(declare-fun res!11984 () Bool)

(declare-fun e!9815 () Bool)

(assert (=> d!2939 (=> res!11984 e!9815)))

(assert (=> d!2939 (= res!11984 (or (is-Nil!519 (toList!268 lm!221)) (is-Nil!519 (t!3014 (toList!268 lm!221)))))))

(assert (=> d!2939 (= (isStrictlySorted!160 (toList!268 lm!221)) e!9815)))

(declare-fun b!16016 () Bool)

(declare-fun e!9816 () Bool)

(assert (=> b!16016 (= e!9815 e!9816)))

(declare-fun res!11985 () Bool)

(assert (=> b!16016 (=> (not res!11985) (not e!9816))))

(assert (=> b!16016 (= res!11985 (bvslt (_1!337 (h!1084 (toList!268 lm!221))) (_1!337 (h!1084 (t!3014 (toList!268 lm!221))))))))

(declare-fun b!16017 () Bool)

(assert (=> b!16017 (= e!9816 (isStrictlySorted!160 (t!3014 (toList!268 lm!221))))))

(assert (= (and d!2939 (not res!11984)) b!16016))

(assert (= (and b!16016 res!11985) b!16017))

(declare-fun m!11029 () Bool)

(assert (=> b!16017 m!11029))

(assert (=> d!2911 d!2939))

(declare-fun d!2941 () Bool)

(declare-fun res!11986 () Bool)

(declare-fun e!9817 () Bool)

(assert (=> d!2941 (=> res!11986 e!9817)))

(assert (=> d!2941 (= res!11986 (is-Nil!519 (t!3014 (toList!268 (tail!70 lm!221)))))))

(assert (=> d!2941 (= (forall!139 (t!3014 (toList!268 (tail!70 lm!221))) p!191) e!9817)))

(declare-fun b!16018 () Bool)

(declare-fun e!9818 () Bool)

(assert (=> b!16018 (= e!9817 e!9818)))

(declare-fun res!11987 () Bool)

(assert (=> b!16018 (=> (not res!11987) (not e!9818))))

(assert (=> b!16018 (= res!11987 (dynLambda!121 p!191 (h!1084 (t!3014 (toList!268 (tail!70 lm!221))))))))

(declare-fun b!16019 () Bool)

(assert (=> b!16019 (= e!9818 (forall!139 (t!3014 (t!3014 (toList!268 (tail!70 lm!221)))) p!191))))

