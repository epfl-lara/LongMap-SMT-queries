; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42814 () Bool)

(assert start!42814)

(declare-fun b_free!12101 () Bool)

(declare-fun b_next!12101 () Bool)

(assert (=> start!42814 (= b_free!12101 (not b_next!12101))))

(declare-fun tp!42379 () Bool)

(declare-fun b_and!20689 () Bool)

(assert (=> start!42814 (= tp!42379 b_and!20689)))

(declare-fun b!476756 () Bool)

(declare-fun res!284606 () Bool)

(declare-fun e!280055 () Bool)

(assert (=> b!476756 (=> (not res!284606) (not e!280055))))

(declare-datatypes ((B!1050 0))(
  ( (B!1051 (val!6809 Int)) )
))
(declare-fun b!85 () B!1050)

(declare-fun p!166 () Int)

(declare-fun a!501 () (_ BitVec 64))

(declare-datatypes ((tuple2!8990 0))(
  ( (tuple2!8991 (_1!4506 (_ BitVec 64)) (_2!4506 B!1050)) )
))
(declare-fun dynLambda!943 (Int tuple2!8990) Bool)

(assert (=> b!476756 (= res!284606 (dynLambda!943 p!166 (tuple2!8991 a!501 b!85)))))

(declare-fun res!284608 () Bool)

(assert (=> start!42814 (=> (not res!284608) (not e!280055))))

(declare-datatypes ((List!9052 0))(
  ( (Nil!9049) (Cons!9048 (h!9904 tuple2!8990) (t!15090 List!9052)) )
))
(declare-datatypes ((ListLongMap!7903 0))(
  ( (ListLongMap!7904 (toList!3967 List!9052)) )
))
(declare-fun lm!215 () ListLongMap!7903)

(declare-fun forall!196 (List!9052 Int) Bool)

(assert (=> start!42814 (= res!284608 (forall!196 (toList!3967 lm!215) p!166))))

(assert (=> start!42814 e!280055))

(declare-fun e!280057 () Bool)

(declare-fun inv!15489 (ListLongMap!7903) Bool)

(assert (=> start!42814 (and (inv!15489 lm!215) e!280057)))

(assert (=> start!42814 tp!42379))

(assert (=> start!42814 true))

(declare-fun tp_is_empty!13523 () Bool)

(assert (=> start!42814 tp_is_empty!13523))

(declare-fun b!476757 () Bool)

(declare-fun tp!42378 () Bool)

(assert (=> b!476757 (= e!280057 tp!42378)))

(declare-fun b!476758 () Bool)

(declare-fun e!280056 () Bool)

(declare-fun lt!217317 () ListLongMap!7903)

(declare-fun size!15142 (List!9052) Int)

(assert (=> b!476758 (= e!280056 (>= (size!15142 (toList!3967 lt!217317)) (size!15142 (toList!3967 lm!215))))))

(declare-fun b!476759 () Bool)

(assert (=> b!476759 (= e!280055 e!280056)))

(declare-fun res!284605 () Bool)

(assert (=> b!476759 (=> (not res!284605) (not e!280056))))

(assert (=> b!476759 (= res!284605 (forall!196 (toList!3967 lt!217317) p!166))))

(declare-fun tail!121 (ListLongMap!7903) ListLongMap!7903)

(assert (=> b!476759 (= lt!217317 (tail!121 lm!215))))

(declare-fun b!476760 () Bool)

(declare-fun res!284607 () Bool)

(assert (=> b!476760 (=> (not res!284607) (not e!280055))))

(declare-fun isEmpty!597 (ListLongMap!7903) Bool)

(assert (=> b!476760 (= res!284607 (not (isEmpty!597 lm!215)))))

(assert (= (and start!42814 res!284608) b!476756))

(assert (= (and b!476756 res!284606) b!476760))

(assert (= (and b!476760 res!284607) b!476759))

(assert (= (and b!476759 res!284605) b!476758))

(assert (= start!42814 b!476757))

(declare-fun b_lambda!10459 () Bool)

(assert (=> (not b_lambda!10459) (not b!476756)))

(declare-fun t!15089 () Bool)

(declare-fun tb!3995 () Bool)

(assert (=> (and start!42814 (= p!166 p!166) t!15089) tb!3995))

(declare-fun result!7551 () Bool)

(assert (=> tb!3995 (= result!7551 true)))

(assert (=> b!476756 t!15089))

(declare-fun b_and!20691 () Bool)

(assert (= b_and!20689 (and (=> t!15089 result!7551) b_and!20691)))

(declare-fun m!459027 () Bool)

(assert (=> start!42814 m!459027))

(declare-fun m!459029 () Bool)

(assert (=> start!42814 m!459029))

(declare-fun m!459031 () Bool)

(assert (=> b!476759 m!459031))

(declare-fun m!459033 () Bool)

(assert (=> b!476759 m!459033))

(declare-fun m!459035 () Bool)

(assert (=> b!476756 m!459035))

(declare-fun m!459037 () Bool)

(assert (=> b!476758 m!459037))

(declare-fun m!459039 () Bool)

(assert (=> b!476758 m!459039))

(declare-fun m!459041 () Bool)

(assert (=> b!476760 m!459041))

(push 1)

(assert (not b!476759))

(assert (not b_next!12101))

(assert (not b!476757))

(assert (not b_lambda!10459))

(assert b_and!20691)

(assert tp_is_empty!13523)

(assert (not b!476760))

(assert (not start!42814))

(assert (not b!476758))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20691)

(assert (not b_next!12101))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10465 () Bool)

(assert (= b_lambda!10459 (or (and start!42814 b_free!12101) b_lambda!10465)))

(push 1)

(assert (not b!476759))

(assert (not b_next!12101))

(assert (not b!476757))

(assert b_and!20691)

(assert tp_is_empty!13523)

(assert (not b_lambda!10465))

(assert (not b!476760))

(assert (not start!42814))

(assert (not b!476758))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20691)

(assert (not b_next!12101))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75827 () Bool)

(declare-fun res!284619 () Bool)

(declare-fun e!280072 () Bool)

(assert (=> d!75827 (=> res!284619 e!280072)))

(assert (=> d!75827 (= res!284619 (is-Nil!9049 (toList!3967 lm!215)))))

(assert (=> d!75827 (= (forall!196 (toList!3967 lm!215) p!166) e!280072)))

(declare-fun b!476779 () Bool)

(declare-fun e!280073 () Bool)

(assert (=> b!476779 (= e!280072 e!280073)))

(declare-fun res!284620 () Bool)

(assert (=> b!476779 (=> (not res!284620) (not e!280073))))

(assert (=> b!476779 (= res!284620 (dynLambda!943 p!166 (h!9904 (toList!3967 lm!215))))))

(declare-fun b!476780 () Bool)

(assert (=> b!476780 (= e!280073 (forall!196 (t!15090 (toList!3967 lm!215)) p!166))))

(assert (= (and d!75827 (not res!284619)) b!476779))

(assert (= (and b!476779 res!284620) b!476780))

(declare-fun b_lambda!10469 () Bool)

(assert (=> (not b_lambda!10469) (not b!476779)))

(declare-fun t!15094 () Bool)

(declare-fun tb!3999 () Bool)

(assert (=> (and start!42814 (= p!166 p!166) t!15094) tb!3999))

(declare-fun result!7555 () Bool)

(assert (=> tb!3999 (= result!7555 true)))

(assert (=> b!476779 t!15094))

(declare-fun b_and!20695 () Bool)

(assert (= b_and!20691 (and (=> t!15094 result!7555) b_and!20695)))

(declare-fun m!459053 () Bool)

(assert (=> b!476779 m!459053))

(declare-fun m!459055 () Bool)

(assert (=> b!476780 m!459055))

(assert (=> start!42814 d!75827))

(declare-fun d!75837 () Bool)

(declare-fun isStrictlySorted!384 (List!9052) Bool)

(assert (=> d!75837 (= (inv!15489 lm!215) (isStrictlySorted!384 (toList!3967 lm!215)))))

(declare-fun bs!15148 () Bool)

(assert (= bs!15148 d!75837))

(declare-fun m!459059 () Bool)

(assert (=> bs!15148 m!459059))

(assert (=> start!42814 d!75837))

(declare-fun d!75841 () Bool)

(declare-fun res!284625 () Bool)

(declare-fun e!280082 () Bool)

(assert (=> d!75841 (=> res!284625 e!280082)))

(assert (=> d!75841 (= res!284625 (is-Nil!9049 (toList!3967 lt!217317)))))

(assert (=> d!75841 (= (forall!196 (toList!3967 lt!217317) p!166) e!280082)))

(declare-fun b!476793 () Bool)

(declare-fun e!280084 () Bool)

(assert (=> b!476793 (= e!280082 e!280084)))

(declare-fun res!284627 () Bool)

(assert (=> b!476793 (=> (not res!284627) (not e!280084))))

(assert (=> b!476793 (= res!284627 (dynLambda!943 p!166 (h!9904 (toList!3967 lt!217317))))))

(declare-fun b!476795 () Bool)

(assert (=> b!476795 (= e!280084 (forall!196 (t!15090 (toList!3967 lt!217317)) p!166))))

(assert (= (and d!75841 (not res!284625)) b!476793))

(assert (= (and b!476793 res!284627) b!476795))

(declare-fun b_lambda!10473 () Bool)

(assert (=> (not b_lambda!10473) (not b!476793)))

(declare-fun t!15096 () Bool)

(declare-fun tb!4001 () Bool)

(assert (=> (and start!42814 (= p!166 p!166) t!15096) tb!4001))

(declare-fun result!7557 () Bool)

(assert (=> tb!4001 (= result!7557 true)))

(assert (=> b!476793 t!15096))

(declare-fun b_and!20697 () Bool)

(assert (= b_and!20695 (and (=> t!15096 result!7557) b_and!20697)))

(declare-fun m!459063 () Bool)

(assert (=> b!476793 m!459063))

(declare-fun m!459067 () Bool)

(assert (=> b!476795 m!459067))

(assert (=> b!476759 d!75841))

(declare-fun d!75845 () Bool)

(declare-fun tail!124 (List!9052) List!9052)

(assert (=> d!75845 (= (tail!121 lm!215) (ListLongMap!7904 (tail!124 (toList!3967 lm!215))))))

(declare-fun bs!15149 () Bool)

(assert (= bs!15149 d!75845))

(declare-fun m!459075 () Bool)

(assert (=> bs!15149 m!459075))

(assert (=> b!476759 d!75845))

(declare-fun d!75851 () Bool)

(declare-fun isEmpty!600 (List!9052) Bool)

(assert (=> d!75851 (= (isEmpty!597 lm!215) (isEmpty!600 (toList!3967 lm!215)))))

(declare-fun bs!15152 () Bool)

(assert (= bs!15152 d!75851))

(declare-fun m!459085 () Bool)

(assert (=> bs!15152 m!459085))

(assert (=> b!476760 d!75851))

(declare-fun d!75859 () Bool)

(declare-fun lt!217328 () Int)

(assert (=> d!75859 (>= lt!217328 0)))

(declare-fun e!280095 () Int)

(assert (=> d!75859 (= lt!217328 e!280095)))

(declare-fun c!57366 () Bool)

(assert (=> d!75859 (= c!57366 (is-Nil!9049 (toList!3967 lt!217317)))))

(assert (=> d!75859 (= (size!15142 (toList!3967 lt!217317)) lt!217328)))

(declare-fun b!476810 () Bool)

(assert (=> b!476810 (= e!280095 0)))

(declare-fun b!476811 () Bool)

(assert (=> b!476811 (= e!280095 (+ 1 (size!15142 (t!15090 (toList!3967 lt!217317)))))))

(assert (= (and d!75859 c!57366) b!476810))

(assert (= (and d!75859 (not c!57366)) b!476811))

(declare-fun m!459093 () Bool)

(assert (=> b!476811 m!459093))

(assert (=> b!476758 d!75859))

(declare-fun d!75863 () Bool)

(declare-fun lt!217329 () Int)

(assert (=> d!75863 (>= lt!217329 0)))

(declare-fun e!280096 () Int)

(assert (=> d!75863 (= lt!217329 e!280096)))

(declare-fun c!57367 () Bool)

(assert (=> d!75863 (= c!57367 (is-Nil!9049 (toList!3967 lm!215)))))

(assert (=> d!75863 (= (size!15142 (toList!3967 lm!215)) lt!217329)))

(declare-fun b!476814 () Bool)

(assert (=> b!476814 (= e!280096 0)))

(declare-fun b!476815 () Bool)

(assert (=> b!476815 (= e!280096 (+ 1 (size!15142 (t!15090 (toList!3967 lm!215)))))))

(assert (= (and d!75863 c!57367) b!476814))

(assert (= (and d!75863 (not c!57367)) b!476815))

(declare-fun m!459095 () Bool)

(assert (=> b!476815 m!459095))

(assert (=> b!476758 d!75863))

(declare-fun b!476823 () Bool)

(declare-fun e!280102 () Bool)

(declare-fun tp!42388 () Bool)

(assert (=> b!476823 (= e!280102 (and tp_is_empty!13523 tp!42388))))

(assert (=> b!476757 (= tp!42378 e!280102)))

(assert (= (and b!476757 (is-Cons!9048 (toList!3967 lm!215))) b!476823))

(declare-fun b_lambda!10487 () Bool)

(assert (= b_lambda!10473 (or (and start!42814 b_free!12101) b_lambda!10487)))

(declare-fun b_lambda!10489 () Bool)

(assert (= b_lambda!10469 (or (and start!42814 b_free!12101) b_lambda!10489)))

(push 1)

(assert (not d!75837))

(assert (not b_lambda!10487))

(assert (not b_next!12101))

(assert (not b!476823))

(assert tp_is_empty!13523)

(assert (not b!476780))

(assert (not b_lambda!10489))

(assert (not b_lambda!10465))

(assert b_and!20697)

(assert (not d!75845))

(assert (not d!75851))

(assert (not b!476795))

(assert (not b!476815))

(assert (not b!476811))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20697)

(assert (not b_next!12101))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75893 () Bool)

