; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2676 () Bool)

(assert start!2676)

(declare-fun b_free!553 () Bool)

(declare-fun b_next!553 () Bool)

(assert (=> start!2676 (= b_free!553 (not b_next!553))))

(declare-fun tp!2795 () Bool)

(declare-fun b_and!1053 () Bool)

(assert (=> start!2676 (= tp!2795 b_and!1053)))

(declare-fun res!11921 () Bool)

(declare-fun e!9739 () Bool)

(assert (=> start!2676 (=> (not res!11921) (not e!9739))))

(declare-datatypes ((B!674 0))(
  ( (B!675 (val!435 Int)) )
))
(declare-datatypes ((tuple2!666 0))(
  ( (tuple2!667 (_1!333 (_ BitVec 64)) (_2!333 B!674)) )
))
(declare-datatypes ((List!516 0))(
  ( (Nil!513) (Cons!512 (h!1078 tuple2!666) (t!3008 List!516)) )
))
(declare-datatypes ((ListLongMap!497 0))(
  ( (ListLongMap!498 (toList!264 List!516)) )
))
(declare-fun lm!221 () ListLongMap!497)

(declare-fun p!191 () Int)

(declare-fun forall!137 (List!516 Int) Bool)

(assert (=> start!2676 (= res!11921 (forall!137 (toList!264 lm!221) p!191))))

(assert (=> start!2676 e!9739))

(declare-fun e!9738 () Bool)

(declare-fun inv!872 (ListLongMap!497) Bool)

(assert (=> start!2676 (and (inv!872 lm!221) e!9738)))

(assert (=> start!2676 tp!2795))

(declare-fun b!15924 () Bool)

(declare-fun res!11920 () Bool)

(assert (=> b!15924 (=> (not res!11920) (not e!9739))))

(declare-fun isEmpty!144 (ListLongMap!497) Bool)

(assert (=> b!15924 (= res!11920 (not (isEmpty!144 lm!221)))))

(declare-fun b!15925 () Bool)

(declare-fun tail!68 (ListLongMap!497) ListLongMap!497)

(assert (=> b!15925 (= e!9739 (not (forall!137 (toList!264 (tail!68 lm!221)) p!191)))))

(declare-fun b!15926 () Bool)

(declare-fun tp!2794 () Bool)

(assert (=> b!15926 (= e!9738 tp!2794)))

(assert (= (and start!2676 res!11921) b!15924))

(assert (= (and b!15924 res!11920) b!15925))

(assert (= start!2676 b!15926))

(declare-fun m!10929 () Bool)

(assert (=> start!2676 m!10929))

(declare-fun m!10931 () Bool)

(assert (=> start!2676 m!10931))

(declare-fun m!10933 () Bool)

(assert (=> b!15924 m!10933))

(declare-fun m!10935 () Bool)

(assert (=> b!15925 m!10935))

(declare-fun m!10937 () Bool)

(assert (=> b!15925 m!10937))

(check-sat (not b_next!553) (not b!15925) (not b!15926) b_and!1053 (not start!2676) (not b!15924))
(check-sat b_and!1053 (not b_next!553))
(get-model)

(declare-fun d!2885 () Bool)

(declare-fun isEmpty!148 (List!516) Bool)

(assert (=> d!2885 (= (isEmpty!144 lm!221) (isEmpty!148 (toList!264 lm!221)))))

(declare-fun bs!736 () Bool)

(assert (= bs!736 d!2885))

(declare-fun m!10961 () Bool)

(assert (=> bs!736 m!10961))

(assert (=> b!15924 d!2885))

(declare-fun d!2887 () Bool)

(declare-fun res!11944 () Bool)

(declare-fun e!9762 () Bool)

(assert (=> d!2887 (=> res!11944 e!9762)))

(get-info :version)

(assert (=> d!2887 (= res!11944 ((_ is Nil!513) (toList!264 (tail!68 lm!221))))))

(assert (=> d!2887 (= (forall!137 (toList!264 (tail!68 lm!221)) p!191) e!9762)))

(declare-fun b!15955 () Bool)

(declare-fun e!9763 () Bool)

(assert (=> b!15955 (= e!9762 e!9763)))

(declare-fun res!11945 () Bool)

(assert (=> b!15955 (=> (not res!11945) (not e!9763))))

(declare-fun dynLambda!117 (Int tuple2!666) Bool)

(assert (=> b!15955 (= res!11945 (dynLambda!117 p!191 (h!1078 (toList!264 (tail!68 lm!221)))))))

(declare-fun b!15956 () Bool)

(assert (=> b!15956 (= e!9763 (forall!137 (t!3008 (toList!264 (tail!68 lm!221))) p!191))))

(assert (= (and d!2887 (not res!11944)) b!15955))

(assert (= (and b!15955 res!11945) b!15956))

(declare-fun b_lambda!1153 () Bool)

(assert (=> (not b_lambda!1153) (not b!15955)))

(declare-fun t!3014 () Bool)

(declare-fun tb!485 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3014) tb!485))

(declare-fun result!839 () Bool)

(assert (=> tb!485 (= result!839 true)))

(assert (=> b!15955 t!3014))

(declare-fun b_and!1061 () Bool)

(assert (= b_and!1053 (and (=> t!3014 result!839) b_and!1061)))

(declare-fun m!10967 () Bool)

(assert (=> b!15955 m!10967))

(declare-fun m!10969 () Bool)

(assert (=> b!15956 m!10969))

(assert (=> b!15925 d!2887))

(declare-fun d!2893 () Bool)

(declare-fun tail!72 (List!516) List!516)

(assert (=> d!2893 (= (tail!68 lm!221) (ListLongMap!498 (tail!72 (toList!264 lm!221))))))

(declare-fun bs!738 () Bool)

(assert (= bs!738 d!2893))

(declare-fun m!10977 () Bool)

(assert (=> bs!738 m!10977))

(assert (=> b!15925 d!2893))

(declare-fun d!2899 () Bool)

(declare-fun res!11948 () Bool)

(declare-fun e!9766 () Bool)

(assert (=> d!2899 (=> res!11948 e!9766)))

(assert (=> d!2899 (= res!11948 ((_ is Nil!513) (toList!264 lm!221)))))

(assert (=> d!2899 (= (forall!137 (toList!264 lm!221) p!191) e!9766)))

(declare-fun b!15959 () Bool)

(declare-fun e!9767 () Bool)

(assert (=> b!15959 (= e!9766 e!9767)))

(declare-fun res!11949 () Bool)

(assert (=> b!15959 (=> (not res!11949) (not e!9767))))

(assert (=> b!15959 (= res!11949 (dynLambda!117 p!191 (h!1078 (toList!264 lm!221))))))

(declare-fun b!15960 () Bool)

(assert (=> b!15960 (= e!9767 (forall!137 (t!3008 (toList!264 lm!221)) p!191))))

(assert (= (and d!2899 (not res!11948)) b!15959))

(assert (= (and b!15959 res!11949) b!15960))

(declare-fun b_lambda!1157 () Bool)

(assert (=> (not b_lambda!1157) (not b!15959)))

(declare-fun t!3018 () Bool)

(declare-fun tb!489 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3018) tb!489))

(declare-fun result!843 () Bool)

(assert (=> tb!489 (= result!843 true)))

(assert (=> b!15959 t!3018))

(declare-fun b_and!1065 () Bool)

(assert (= b_and!1061 (and (=> t!3018 result!843) b_and!1065)))

(declare-fun m!10979 () Bool)

(assert (=> b!15959 m!10979))

(declare-fun m!10981 () Bool)

(assert (=> b!15960 m!10981))

(assert (=> start!2676 d!2899))

(declare-fun d!2901 () Bool)

(declare-fun isStrictlySorted!146 (List!516) Bool)

(assert (=> d!2901 (= (inv!872 lm!221) (isStrictlySorted!146 (toList!264 lm!221)))))

(declare-fun bs!741 () Bool)

(assert (= bs!741 d!2901))

(declare-fun m!10987 () Bool)

(assert (=> bs!741 m!10987))

(assert (=> start!2676 d!2901))

(declare-fun b!15970 () Bool)

(declare-fun e!9773 () Bool)

(declare-fun tp_is_empty!819 () Bool)

(declare-fun tp!2813 () Bool)

(assert (=> b!15970 (= e!9773 (and tp_is_empty!819 tp!2813))))

(assert (=> b!15926 (= tp!2794 e!9773)))

(assert (= (and b!15926 ((_ is Cons!512) (toList!264 lm!221))) b!15970))

(declare-fun b_lambda!1163 () Bool)

(assert (= b_lambda!1153 (or (and start!2676 b_free!553) b_lambda!1163)))

(declare-fun b_lambda!1165 () Bool)

(assert (= b_lambda!1157 (or (and start!2676 b_free!553) b_lambda!1165)))

(check-sat (not b_next!553) b_and!1065 (not d!2893) (not b!15956) tp_is_empty!819 (not b_lambda!1163) (not b_lambda!1165) (not d!2885) (not b!15960) (not d!2901) (not b!15970))
(check-sat b_and!1065 (not b_next!553))
(get-model)

(declare-fun d!2911 () Bool)

(assert (=> d!2911 (= (tail!72 (toList!264 lm!221)) (t!3008 (toList!264 lm!221)))))

(assert (=> d!2893 d!2911))

(declare-fun d!2915 () Bool)

(declare-fun res!11960 () Bool)

(declare-fun e!9787 () Bool)

(assert (=> d!2915 (=> res!11960 e!9787)))

(assert (=> d!2915 (= res!11960 ((_ is Nil!513) (t!3008 (toList!264 (tail!68 lm!221)))))))

(assert (=> d!2915 (= (forall!137 (t!3008 (toList!264 (tail!68 lm!221))) p!191) e!9787)))

(declare-fun b!15986 () Bool)

(declare-fun e!9788 () Bool)

(assert (=> b!15986 (= e!9787 e!9788)))

(declare-fun res!11961 () Bool)

(assert (=> b!15986 (=> (not res!11961) (not e!9788))))

(assert (=> b!15986 (= res!11961 (dynLambda!117 p!191 (h!1078 (t!3008 (toList!264 (tail!68 lm!221))))))))

(declare-fun b!15987 () Bool)

(assert (=> b!15987 (= e!9788 (forall!137 (t!3008 (t!3008 (toList!264 (tail!68 lm!221)))) p!191))))

(assert (= (and d!2915 (not res!11960)) b!15986))

(assert (= (and b!15986 res!11961) b!15987))

(declare-fun b_lambda!1177 () Bool)

(assert (=> (not b_lambda!1177) (not b!15986)))

(declare-fun t!3026 () Bool)

(declare-fun tb!497 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3026) tb!497))

(declare-fun result!855 () Bool)

(assert (=> tb!497 (= result!855 true)))

(assert (=> b!15986 t!3026))

(declare-fun b_and!1071 () Bool)

(assert (= b_and!1065 (and (=> t!3026 result!855) b_and!1071)))

(declare-fun m!11001 () Bool)

(assert (=> b!15986 m!11001))

(declare-fun m!11005 () Bool)

(assert (=> b!15987 m!11005))

(assert (=> b!15956 d!2915))

(declare-fun d!2917 () Bool)

(declare-fun res!11970 () Bool)

(declare-fun e!9797 () Bool)

(assert (=> d!2917 (=> res!11970 e!9797)))

(assert (=> d!2917 (= res!11970 (or ((_ is Nil!513) (toList!264 lm!221)) ((_ is Nil!513) (t!3008 (toList!264 lm!221)))))))

(assert (=> d!2917 (= (isStrictlySorted!146 (toList!264 lm!221)) e!9797)))

(declare-fun b!15996 () Bool)

(declare-fun e!9798 () Bool)

(assert (=> b!15996 (= e!9797 e!9798)))

(declare-fun res!11971 () Bool)

(assert (=> b!15996 (=> (not res!11971) (not e!9798))))

(assert (=> b!15996 (= res!11971 (bvslt (_1!333 (h!1078 (toList!264 lm!221))) (_1!333 (h!1078 (t!3008 (toList!264 lm!221))))))))

(declare-fun b!15997 () Bool)

(assert (=> b!15997 (= e!9798 (isStrictlySorted!146 (t!3008 (toList!264 lm!221))))))

(assert (= (and d!2917 (not res!11970)) b!15996))

(assert (= (and b!15996 res!11971) b!15997))

(declare-fun m!11009 () Bool)

(assert (=> b!15997 m!11009))

(assert (=> d!2901 d!2917))

(declare-fun d!2923 () Bool)

(assert (=> d!2923 (= (isEmpty!148 (toList!264 lm!221)) ((_ is Nil!513) (toList!264 lm!221)))))

(assert (=> d!2885 d!2923))

(declare-fun d!2927 () Bool)

(declare-fun res!11976 () Bool)

(declare-fun e!9803 () Bool)

(assert (=> d!2927 (=> res!11976 e!9803)))

(assert (=> d!2927 (= res!11976 ((_ is Nil!513) (t!3008 (toList!264 lm!221))))))

(assert (=> d!2927 (= (forall!137 (t!3008 (toList!264 lm!221)) p!191) e!9803)))

(declare-fun b!16002 () Bool)

(declare-fun e!9804 () Bool)

(assert (=> b!16002 (= e!9803 e!9804)))

(declare-fun res!11977 () Bool)

(assert (=> b!16002 (=> (not res!11977) (not e!9804))))

(assert (=> b!16002 (= res!11977 (dynLambda!117 p!191 (h!1078 (t!3008 (toList!264 lm!221)))))))

(declare-fun b!16003 () Bool)

(assert (=> b!16003 (= e!9804 (forall!137 (t!3008 (t!3008 (toList!264 lm!221))) p!191))))

(assert (= (and d!2927 (not res!11976)) b!16002))

(assert (= (and b!16002 res!11977) b!16003))

(declare-fun b_lambda!1181 () Bool)

(assert (=> (not b_lambda!1181) (not b!16002)))

(declare-fun t!3029 () Bool)

(declare-fun tb!500 () Bool)

(assert (=> (and start!2676 (= p!191 p!191) t!3029) tb!500))

(declare-fun result!860 () Bool)

(assert (=> tb!500 (= result!860 true)))

(assert (=> b!16002 t!3029))

(declare-fun b_and!1075 () Bool)

(assert (= b_and!1071 (and (=> t!3029 result!860) b_and!1075)))

(declare-fun m!11013 () Bool)

(assert (=> b!16002 m!11013))

(declare-fun m!11017 () Bool)

(assert (=> b!16003 m!11017))

(assert (=> b!15960 d!2927))

(declare-fun b!16004 () Bool)

(declare-fun e!9805 () Bool)

(declare-fun tp!2817 () Bool)

(assert (=> b!16004 (= e!9805 (and tp_is_empty!819 tp!2817))))

(assert (=> b!15970 (= tp!2813 e!9805)))

(assert (= (and b!15970 ((_ is Cons!512) (t!3008 (toList!264 lm!221)))) b!16004))

(declare-fun b_lambda!1183 () Bool)

(assert (= b_lambda!1181 (or (and start!2676 b_free!553) b_lambda!1183)))

(declare-fun b_lambda!1185 () Bool)

(assert (= b_lambda!1177 (or (and start!2676 b_free!553) b_lambda!1185)))

(check-sat (not b_next!553) (not b!15997) (not b_lambda!1185) (not b_lambda!1183) (not b!16004) (not b!15987) tp_is_empty!819 (not b!16003) (not b_lambda!1163) (not b_lambda!1165) b_and!1075)
(check-sat b_and!1075 (not b_next!553))
