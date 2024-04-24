; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42748 () Bool)

(assert start!42748)

(declare-fun b_free!12091 () Bool)

(declare-fun b_next!12091 () Bool)

(assert (=> start!42748 (= b_free!12091 (not b_next!12091))))

(declare-fun tp!42337 () Bool)

(declare-fun b_and!20655 () Bool)

(assert (=> start!42748 (= tp!42337 b_and!20655)))

(declare-fun b!476557 () Bool)

(declare-fun e!279912 () Bool)

(declare-datatypes ((B!1040 0))(
  ( (B!1041 (val!6804 Int)) )
))
(declare-datatypes ((tuple2!8904 0))(
  ( (tuple2!8905 (_1!4463 (_ BitVec 64)) (_2!4463 B!1040)) )
))
(declare-datatypes ((List!8956 0))(
  ( (Nil!8953) (Cons!8952 (h!9808 tuple2!8904) (t!14952 List!8956)) )
))
(declare-datatypes ((ListLongMap!7819 0))(
  ( (ListLongMap!7820 (toList!3925 List!8956)) )
))
(declare-fun lm!215 () ListLongMap!7819)

(declare-fun p!166 () Int)

(declare-fun forall!191 (List!8956 Int) Bool)

(declare-fun tail!113 (ListLongMap!7819) ListLongMap!7819)

(assert (=> b!476557 (= e!279912 (not (forall!191 (toList!3925 (tail!113 lm!215)) p!166)))))

(declare-fun res!284493 () Bool)

(assert (=> start!42748 (=> (not res!284493) (not e!279912))))

(assert (=> start!42748 (= res!284493 (forall!191 (toList!3925 lm!215) p!166))))

(assert (=> start!42748 e!279912))

(declare-fun e!279913 () Bool)

(declare-fun inv!15479 (ListLongMap!7819) Bool)

(assert (=> start!42748 (and (inv!15479 lm!215) e!279913)))

(assert (=> start!42748 tp!42337))

(assert (=> start!42748 true))

(declare-fun tp_is_empty!13513 () Bool)

(assert (=> start!42748 tp_is_empty!13513))

(declare-fun b!476555 () Bool)

(declare-fun res!284492 () Bool)

(assert (=> b!476555 (=> (not res!284492) (not e!279912))))

(declare-fun b!85 () B!1040)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!935 (Int tuple2!8904) Bool)

(assert (=> b!476555 (= res!284492 (dynLambda!935 p!166 (tuple2!8905 a!501 b!85)))))

(declare-fun b!476558 () Bool)

(declare-fun tp!42336 () Bool)

(assert (=> b!476558 (= e!279913 tp!42336)))

(declare-fun b!476556 () Bool)

(declare-fun res!284491 () Bool)

(assert (=> b!476556 (=> (not res!284491) (not e!279912))))

(declare-fun isEmpty!595 (ListLongMap!7819) Bool)

(assert (=> b!476556 (= res!284491 (not (isEmpty!595 lm!215)))))

(assert (= (and start!42748 res!284493) b!476555))

(assert (= (and b!476555 res!284492) b!476556))

(assert (= (and b!476556 res!284491) b!476557))

(assert (= start!42748 b!476558))

(declare-fun b_lambda!10409 () Bool)

(assert (=> (not b_lambda!10409) (not b!476555)))

(declare-fun t!14951 () Bool)

(declare-fun tb!3953 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!14951) tb!3953))

(declare-fun result!7503 () Bool)

(assert (=> tb!3953 (= result!7503 true)))

(assert (=> b!476555 t!14951))

(declare-fun b_and!20657 () Bool)

(assert (= b_and!20655 (and (=> t!14951 result!7503) b_and!20657)))

(declare-fun m!459069 () Bool)

(assert (=> b!476557 m!459069))

(declare-fun m!459071 () Bool)

(assert (=> b!476557 m!459071))

(declare-fun m!459073 () Bool)

(assert (=> start!42748 m!459073))

(declare-fun m!459075 () Bool)

(assert (=> start!42748 m!459075))

(declare-fun m!459077 () Bool)

(assert (=> b!476555 m!459077))

(declare-fun m!459079 () Bool)

(assert (=> b!476556 m!459079))

(check-sat tp_is_empty!13513 (not start!42748) b_and!20657 (not b!476556) (not b_next!12091) (not b!476558) (not b_lambda!10409) (not b!476557))
(check-sat b_and!20657 (not b_next!12091))
(get-model)

(declare-fun b_lambda!10419 () Bool)

(assert (= b_lambda!10409 (or (and start!42748 b_free!12091) b_lambda!10419)))

(check-sat (not b_lambda!10419) tp_is_empty!13513 (not start!42748) b_and!20657 (not b!476556) (not b_next!12091) (not b!476557) (not b!476558))
(check-sat b_and!20657 (not b_next!12091))
(get-model)

(declare-fun d!75793 () Bool)

(declare-fun res!284528 () Bool)

(declare-fun e!279942 () Bool)

(assert (=> d!75793 (=> res!284528 e!279942)))

(get-info :version)

(assert (=> d!75793 (= res!284528 ((_ is Nil!8953) (toList!3925 (tail!113 lm!215))))))

(assert (=> d!75793 (= (forall!191 (toList!3925 (tail!113 lm!215)) p!166) e!279942)))

(declare-fun b!476599 () Bool)

(declare-fun e!279943 () Bool)

(assert (=> b!476599 (= e!279942 e!279943)))

(declare-fun res!284529 () Bool)

(assert (=> b!476599 (=> (not res!284529) (not e!279943))))

(assert (=> b!476599 (= res!284529 (dynLambda!935 p!166 (h!9808 (toList!3925 (tail!113 lm!215)))))))

(declare-fun b!476600 () Bool)

(assert (=> b!476600 (= e!279943 (forall!191 (t!14952 (toList!3925 (tail!113 lm!215))) p!166))))

(assert (= (and d!75793 (not res!284528)) b!476599))

(assert (= (and b!476599 res!284529) b!476600))

(declare-fun b_lambda!10425 () Bool)

(assert (=> (not b_lambda!10425) (not b!476599)))

(declare-fun t!14964 () Bool)

(declare-fun tb!3963 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!14964) tb!3963))

(declare-fun result!7513 () Bool)

(assert (=> tb!3963 (= result!7513 true)))

(assert (=> b!476599 t!14964))

(declare-fun b_and!20671 () Bool)

(assert (= b_and!20657 (and (=> t!14964 result!7513) b_and!20671)))

(declare-fun m!459117 () Bool)

(assert (=> b!476599 m!459117))

(declare-fun m!459119 () Bool)

(assert (=> b!476600 m!459119))

(assert (=> b!476557 d!75793))

(declare-fun d!75803 () Bool)

(declare-fun tail!117 (List!8956) List!8956)

(assert (=> d!75803 (= (tail!113 lm!215) (ListLongMap!7820 (tail!117 (toList!3925 lm!215))))))

(declare-fun bs!15155 () Bool)

(assert (= bs!15155 d!75803))

(declare-fun m!459125 () Bool)

(assert (=> bs!15155 m!459125))

(assert (=> b!476557 d!75803))

(declare-fun d!75809 () Bool)

(declare-fun isEmpty!599 (List!8956) Bool)

(assert (=> d!75809 (= (isEmpty!595 lm!215) (isEmpty!599 (toList!3925 lm!215)))))

(declare-fun bs!15156 () Bool)

(assert (= bs!15156 d!75809))

(declare-fun m!459135 () Bool)

(assert (=> bs!15156 m!459135))

(assert (=> b!476556 d!75809))

(declare-fun d!75815 () Bool)

(declare-fun res!284534 () Bool)

(declare-fun e!279948 () Bool)

(assert (=> d!75815 (=> res!284534 e!279948)))

(assert (=> d!75815 (= res!284534 ((_ is Nil!8953) (toList!3925 lm!215)))))

(assert (=> d!75815 (= (forall!191 (toList!3925 lm!215) p!166) e!279948)))

(declare-fun b!476605 () Bool)

(declare-fun e!279949 () Bool)

(assert (=> b!476605 (= e!279948 e!279949)))

(declare-fun res!284535 () Bool)

(assert (=> b!476605 (=> (not res!284535) (not e!279949))))

(assert (=> b!476605 (= res!284535 (dynLambda!935 p!166 (h!9808 (toList!3925 lm!215))))))

(declare-fun b!476606 () Bool)

(assert (=> b!476606 (= e!279949 (forall!191 (t!14952 (toList!3925 lm!215)) p!166))))

(assert (= (and d!75815 (not res!284534)) b!476605))

(assert (= (and b!476605 res!284535) b!476606))

(declare-fun b_lambda!10431 () Bool)

(assert (=> (not b_lambda!10431) (not b!476605)))

(declare-fun t!14970 () Bool)

(declare-fun tb!3969 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!14970) tb!3969))

(declare-fun result!7519 () Bool)

(assert (=> tb!3969 (= result!7519 true)))

(assert (=> b!476605 t!14970))

(declare-fun b_and!20677 () Bool)

(assert (= b_and!20671 (and (=> t!14970 result!7519) b_and!20677)))

(declare-fun m!459137 () Bool)

(assert (=> b!476605 m!459137))

(declare-fun m!459139 () Bool)

(assert (=> b!476606 m!459139))

(assert (=> start!42748 d!75815))

(declare-fun d!75817 () Bool)

(declare-fun isStrictlySorted!369 (List!8956) Bool)

(assert (=> d!75817 (= (inv!15479 lm!215) (isStrictlySorted!369 (toList!3925 lm!215)))))

(declare-fun bs!15159 () Bool)

(assert (= bs!15159 d!75817))

(declare-fun m!459145 () Bool)

(assert (=> bs!15159 m!459145))

(assert (=> start!42748 d!75817))

(declare-fun b!476621 () Bool)

(declare-fun e!279958 () Bool)

(declare-fun tp!42358 () Bool)

(assert (=> b!476621 (= e!279958 (and tp_is_empty!13513 tp!42358))))

(assert (=> b!476558 (= tp!42336 e!279958)))

(assert (= (and b!476558 ((_ is Cons!8952) (toList!3925 lm!215))) b!476621))

(declare-fun b_lambda!10441 () Bool)

(assert (= b_lambda!10425 (or (and start!42748 b_free!12091) b_lambda!10441)))

(declare-fun b_lambda!10443 () Bool)

(assert (= b_lambda!10431 (or (and start!42748 b_free!12091) b_lambda!10443)))

(check-sat (not b_lambda!10419) (not b!476600) (not d!75809) tp_is_empty!13513 (not d!75803) (not b!476606) (not b_lambda!10441) (not b_next!12091) b_and!20677 (not b!476621) (not d!75817) (not b_lambda!10443))
(check-sat b_and!20677 (not b_next!12091))
(get-model)

(declare-fun d!75819 () Bool)

(declare-fun res!284536 () Bool)

(declare-fun e!279959 () Bool)

(assert (=> d!75819 (=> res!284536 e!279959)))

(assert (=> d!75819 (= res!284536 ((_ is Nil!8953) (t!14952 (toList!3925 lm!215))))))

(assert (=> d!75819 (= (forall!191 (t!14952 (toList!3925 lm!215)) p!166) e!279959)))

(declare-fun b!476622 () Bool)

(declare-fun e!279960 () Bool)

(assert (=> b!476622 (= e!279959 e!279960)))

(declare-fun res!284537 () Bool)

(assert (=> b!476622 (=> (not res!284537) (not e!279960))))

(assert (=> b!476622 (= res!284537 (dynLambda!935 p!166 (h!9808 (t!14952 (toList!3925 lm!215)))))))

(declare-fun b!476623 () Bool)

(assert (=> b!476623 (= e!279960 (forall!191 (t!14952 (t!14952 (toList!3925 lm!215))) p!166))))

(assert (= (and d!75819 (not res!284536)) b!476622))

(assert (= (and b!476622 res!284537) b!476623))

(declare-fun b_lambda!10445 () Bool)

(assert (=> (not b_lambda!10445) (not b!476622)))

(declare-fun t!14972 () Bool)

(declare-fun tb!3971 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!14972) tb!3971))

(declare-fun result!7527 () Bool)

(assert (=> tb!3971 (= result!7527 true)))

(assert (=> b!476622 t!14972))

(declare-fun b_and!20679 () Bool)

(assert (= b_and!20677 (and (=> t!14972 result!7527) b_and!20679)))

(declare-fun m!459147 () Bool)

(assert (=> b!476622 m!459147))

(declare-fun m!459149 () Bool)

(assert (=> b!476623 m!459149))

(assert (=> b!476606 d!75819))

(declare-fun d!75821 () Bool)

(declare-fun res!284538 () Bool)

(declare-fun e!279961 () Bool)

(assert (=> d!75821 (=> res!284538 e!279961)))

(assert (=> d!75821 (= res!284538 ((_ is Nil!8953) (t!14952 (toList!3925 (tail!113 lm!215)))))))

(assert (=> d!75821 (= (forall!191 (t!14952 (toList!3925 (tail!113 lm!215))) p!166) e!279961)))

(declare-fun b!476624 () Bool)

(declare-fun e!279962 () Bool)

(assert (=> b!476624 (= e!279961 e!279962)))

(declare-fun res!284539 () Bool)

(assert (=> b!476624 (=> (not res!284539) (not e!279962))))

(assert (=> b!476624 (= res!284539 (dynLambda!935 p!166 (h!9808 (t!14952 (toList!3925 (tail!113 lm!215))))))))

(declare-fun b!476625 () Bool)

(assert (=> b!476625 (= e!279962 (forall!191 (t!14952 (t!14952 (toList!3925 (tail!113 lm!215)))) p!166))))

(assert (= (and d!75821 (not res!284538)) b!476624))

(assert (= (and b!476624 res!284539) b!476625))

(declare-fun b_lambda!10447 () Bool)

(assert (=> (not b_lambda!10447) (not b!476624)))

(declare-fun t!14974 () Bool)

(declare-fun tb!3973 () Bool)

(assert (=> (and start!42748 (= p!166 p!166) t!14974) tb!3973))

(declare-fun result!7529 () Bool)

(assert (=> tb!3973 (= result!7529 true)))

(assert (=> b!476624 t!14974))

(declare-fun b_and!20681 () Bool)

(assert (= b_and!20679 (and (=> t!14974 result!7529) b_and!20681)))

(declare-fun m!459151 () Bool)

(assert (=> b!476624 m!459151))

(declare-fun m!459153 () Bool)

(assert (=> b!476625 m!459153))

(assert (=> b!476600 d!75821))

(declare-fun d!75823 () Bool)

(assert (=> d!75823 (= (tail!117 (toList!3925 lm!215)) (t!14952 (toList!3925 lm!215)))))

(assert (=> d!75803 d!75823))

(declare-fun d!75825 () Bool)

(declare-fun res!284544 () Bool)

(declare-fun e!279967 () Bool)

(assert (=> d!75825 (=> res!284544 e!279967)))

(assert (=> d!75825 (= res!284544 (or ((_ is Nil!8953) (toList!3925 lm!215)) ((_ is Nil!8953) (t!14952 (toList!3925 lm!215)))))))

(assert (=> d!75825 (= (isStrictlySorted!369 (toList!3925 lm!215)) e!279967)))

(declare-fun b!476630 () Bool)

(declare-fun e!279968 () Bool)

(assert (=> b!476630 (= e!279967 e!279968)))

(declare-fun res!284545 () Bool)

(assert (=> b!476630 (=> (not res!284545) (not e!279968))))

(assert (=> b!476630 (= res!284545 (bvslt (_1!4463 (h!9808 (toList!3925 lm!215))) (_1!4463 (h!9808 (t!14952 (toList!3925 lm!215))))))))

(declare-fun b!476631 () Bool)

(assert (=> b!476631 (= e!279968 (isStrictlySorted!369 (t!14952 (toList!3925 lm!215))))))

(assert (= (and d!75825 (not res!284544)) b!476630))

(assert (= (and b!476630 res!284545) b!476631))

(declare-fun m!459155 () Bool)

(assert (=> b!476631 m!459155))

(assert (=> d!75817 d!75825))

(declare-fun d!75827 () Bool)

(assert (=> d!75827 (= (isEmpty!599 (toList!3925 lm!215)) ((_ is Nil!8953) (toList!3925 lm!215)))))

(assert (=> d!75809 d!75827))

(declare-fun b!476634 () Bool)

(declare-fun e!279971 () Bool)

(declare-fun tp!42359 () Bool)

(assert (=> b!476634 (= e!279971 (and tp_is_empty!13513 tp!42359))))

(assert (=> b!476621 (= tp!42358 e!279971)))

(assert (= (and b!476621 ((_ is Cons!8952) (t!14952 (toList!3925 lm!215)))) b!476634))

(declare-fun b_lambda!10451 () Bool)

(assert (= b_lambda!10447 (or (and start!42748 b_free!12091) b_lambda!10451)))

(declare-fun b_lambda!10453 () Bool)

(assert (= b_lambda!10445 (or (and start!42748 b_free!12091) b_lambda!10453)))

(check-sat (not b!476634) (not b_lambda!10419) (not b_lambda!10451) (not b_lambda!10453) (not b!476631) (not b_lambda!10441) (not b_next!12091) (not b!476625) b_and!20681 tp_is_empty!13513 (not b!476623) (not b_lambda!10443))
(check-sat b_and!20681 (not b_next!12091))
