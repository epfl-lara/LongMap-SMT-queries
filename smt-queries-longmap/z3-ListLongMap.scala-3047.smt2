; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42764 () Bool)

(assert start!42764)

(declare-fun b_free!12093 () Bool)

(declare-fun b_next!12093 () Bool)

(assert (=> start!42764 (= b_free!12093 (not b_next!12093))))

(declare-fun tp!42343 () Bool)

(declare-fun b_and!20649 () Bool)

(assert (=> start!42764 (= tp!42343 b_and!20649)))

(declare-fun b!476631 () Bool)

(declare-fun e!279958 () Bool)

(declare-fun tp!42342 () Bool)

(assert (=> b!476631 (= e!279958 tp!42342)))

(declare-fun b!476630 () Bool)

(declare-fun e!279957 () Bool)

(declare-datatypes ((B!1042 0))(
  ( (B!1043 (val!6805 Int)) )
))
(declare-datatypes ((tuple2!8982 0))(
  ( (tuple2!8983 (_1!4502 (_ BitVec 64)) (_2!4502 B!1042)) )
))
(declare-datatypes ((List!9048 0))(
  ( (Nil!9045) (Cons!9044 (h!9900 tuple2!8982) (t!15054 List!9048)) )
))
(declare-datatypes ((ListLongMap!7895 0))(
  ( (ListLongMap!7896 (toList!3963 List!9048)) )
))
(declare-fun lm!215 () ListLongMap!7895)

(declare-fun p!166 () Int)

(declare-fun forall!192 (List!9048 Int) Bool)

(declare-fun tail!114 (ListLongMap!7895) ListLongMap!7895)

(assert (=> b!476630 (= e!279957 (not (forall!192 (toList!3963 (tail!114 lm!215)) p!166)))))

(declare-fun b!476628 () Bool)

(declare-fun res!284509 () Bool)

(assert (=> b!476628 (=> (not res!284509) (not e!279957))))

(declare-fun b!85 () B!1042)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!939 (Int tuple2!8982) Bool)

(assert (=> b!476628 (= res!284509 (dynLambda!939 p!166 (tuple2!8983 a!501 b!85)))))

(declare-fun b!476629 () Bool)

(declare-fun res!284507 () Bool)

(assert (=> b!476629 (=> (not res!284507) (not e!279957))))

(declare-fun isEmpty!590 (ListLongMap!7895) Bool)

(assert (=> b!476629 (= res!284507 (not (isEmpty!590 lm!215)))))

(declare-fun res!284508 () Bool)

(assert (=> start!42764 (=> (not res!284508) (not e!279957))))

(assert (=> start!42764 (= res!284508 (forall!192 (toList!3963 lm!215) p!166))))

(assert (=> start!42764 e!279957))

(declare-fun inv!15480 (ListLongMap!7895) Bool)

(assert (=> start!42764 (and (inv!15480 lm!215) e!279958)))

(assert (=> start!42764 tp!42343))

(assert (=> start!42764 true))

(declare-fun tp_is_empty!13515 () Bool)

(assert (=> start!42764 tp_is_empty!13515))

(assert (= (and start!42764 res!284508) b!476628))

(assert (= (and b!476628 res!284509) b!476629))

(assert (= (and b!476629 res!284507) b!476630))

(assert (= start!42764 b!476631))

(declare-fun b_lambda!10397 () Bool)

(assert (=> (not b_lambda!10397) (not b!476628)))

(declare-fun t!15053 () Bool)

(declare-fun tb!3963 () Bool)

(assert (=> (and start!42764 (= p!166 p!166) t!15053) tb!3963))

(declare-fun result!7513 () Bool)

(assert (=> tb!3963 (= result!7513 true)))

(assert (=> b!476628 t!15053))

(declare-fun b_and!20651 () Bool)

(assert (= b_and!20649 (and (=> t!15053 result!7513) b_and!20651)))

(declare-fun m!458899 () Bool)

(assert (=> b!476630 m!458899))

(declare-fun m!458901 () Bool)

(assert (=> b!476630 m!458901))

(declare-fun m!458903 () Bool)

(assert (=> b!476628 m!458903))

(declare-fun m!458905 () Bool)

(assert (=> b!476629 m!458905))

(declare-fun m!458907 () Bool)

(assert (=> start!42764 m!458907))

(declare-fun m!458909 () Bool)

(assert (=> start!42764 m!458909))

(check-sat (not start!42764) (not b_lambda!10397) (not b!476631) tp_is_empty!13515 (not b!476629) (not b_next!12093) b_and!20651 (not b!476630))
(check-sat b_and!20651 (not b_next!12093))
(get-model)

(declare-fun b_lambda!10405 () Bool)

(assert (= b_lambda!10397 (or (and start!42764 b_free!12093) b_lambda!10405)))

(check-sat (not start!42764) tp_is_empty!13515 (not b!476629) (not b_next!12093) b_and!20651 (not b!476630) (not b!476631) (not b_lambda!10405))
(check-sat b_and!20651 (not b_next!12093))
(get-model)

(declare-fun d!75769 () Bool)

(declare-fun isEmpty!593 (List!9048) Bool)

(assert (=> d!75769 (= (isEmpty!590 lm!215) (isEmpty!593 (toList!3963 lm!215)))))

(declare-fun bs!15137 () Bool)

(assert (= bs!15137 d!75769))

(declare-fun m!458933 () Bool)

(assert (=> bs!15137 m!458933))

(assert (=> b!476629 d!75769))

(declare-fun d!75773 () Bool)

(declare-fun res!284537 () Bool)

(declare-fun e!279986 () Bool)

(assert (=> d!75773 (=> res!284537 e!279986)))

(get-info :version)

(assert (=> d!75773 (= res!284537 ((_ is Nil!9045) (toList!3963 lm!215)))))

(assert (=> d!75773 (= (forall!192 (toList!3963 lm!215) p!166) e!279986)))

(declare-fun b!476667 () Bool)

(declare-fun e!279987 () Bool)

(assert (=> b!476667 (= e!279986 e!279987)))

(declare-fun res!284538 () Bool)

(assert (=> b!476667 (=> (not res!284538) (not e!279987))))

(assert (=> b!476667 (= res!284538 (dynLambda!939 p!166 (h!9900 (toList!3963 lm!215))))))

(declare-fun b!476668 () Bool)

(assert (=> b!476668 (= e!279987 (forall!192 (t!15054 (toList!3963 lm!215)) p!166))))

(assert (= (and d!75773 (not res!284537)) b!476667))

(assert (= (and b!476667 res!284538) b!476668))

(declare-fun b_lambda!10417 () Bool)

(assert (=> (not b_lambda!10417) (not b!476667)))

(declare-fun t!15065 () Bool)

(declare-fun tb!3973 () Bool)

(assert (=> (and start!42764 (= p!166 p!166) t!15065) tb!3973))

(declare-fun result!7525 () Bool)

(assert (=> tb!3973 (= result!7525 true)))

(assert (=> b!476667 t!15065))

(declare-fun b_and!20663 () Bool)

(assert (= b_and!20651 (and (=> t!15065 result!7525) b_and!20663)))

(declare-fun m!458947 () Bool)

(assert (=> b!476667 m!458947))

(declare-fun m!458949 () Bool)

(assert (=> b!476668 m!458949))

(assert (=> start!42764 d!75773))

(declare-fun d!75783 () Bool)

(declare-fun isStrictlySorted!382 (List!9048) Bool)

(assert (=> d!75783 (= (inv!15480 lm!215) (isStrictlySorted!382 (toList!3963 lm!215)))))

(declare-fun bs!15141 () Bool)

(assert (= bs!15141 d!75783))

(declare-fun m!458955 () Bool)

(assert (=> bs!15141 m!458955))

(assert (=> start!42764 d!75783))

(declare-fun d!75787 () Bool)

(declare-fun res!284541 () Bool)

(declare-fun e!279990 () Bool)

(assert (=> d!75787 (=> res!284541 e!279990)))

(assert (=> d!75787 (= res!284541 ((_ is Nil!9045) (toList!3963 (tail!114 lm!215))))))

(assert (=> d!75787 (= (forall!192 (toList!3963 (tail!114 lm!215)) p!166) e!279990)))

(declare-fun b!476671 () Bool)

(declare-fun e!279991 () Bool)

(assert (=> b!476671 (= e!279990 e!279991)))

(declare-fun res!284542 () Bool)

(assert (=> b!476671 (=> (not res!284542) (not e!279991))))

(assert (=> b!476671 (= res!284542 (dynLambda!939 p!166 (h!9900 (toList!3963 (tail!114 lm!215)))))))

(declare-fun b!476672 () Bool)

(assert (=> b!476672 (= e!279991 (forall!192 (t!15054 (toList!3963 (tail!114 lm!215))) p!166))))

(assert (= (and d!75787 (not res!284541)) b!476671))

(assert (= (and b!476671 res!284542) b!476672))

(declare-fun b_lambda!10421 () Bool)

(assert (=> (not b_lambda!10421) (not b!476671)))

(declare-fun t!15069 () Bool)

(declare-fun tb!3977 () Bool)

(assert (=> (and start!42764 (= p!166 p!166) t!15069) tb!3977))

(declare-fun result!7531 () Bool)

(assert (=> tb!3977 (= result!7531 true)))

(assert (=> b!476671 t!15069))

(declare-fun b_and!20667 () Bool)

(assert (= b_and!20663 (and (=> t!15069 result!7531) b_and!20667)))

(declare-fun m!458959 () Bool)

(assert (=> b!476671 m!458959))

(declare-fun m!458961 () Bool)

(assert (=> b!476672 m!458961))

(assert (=> b!476630 d!75787))

(declare-fun d!75789 () Bool)

(declare-fun tail!118 (List!9048) List!9048)

(assert (=> d!75789 (= (tail!114 lm!215) (ListLongMap!7896 (tail!118 (toList!3963 lm!215))))))

(declare-fun bs!15143 () Bool)

(assert (= bs!15143 d!75789))

(declare-fun m!458963 () Bool)

(assert (=> bs!15143 m!458963))

(assert (=> b!476630 d!75789))

(declare-fun b!476682 () Bool)

(declare-fun e!279997 () Bool)

(declare-fun tp!42358 () Bool)

(assert (=> b!476682 (= e!279997 (and tp_is_empty!13515 tp!42358))))

(assert (=> b!476631 (= tp!42342 e!279997)))

(assert (= (and b!476631 ((_ is Cons!9044) (toList!3963 lm!215))) b!476682))

(declare-fun b_lambda!10427 () Bool)

(assert (= b_lambda!10421 (or (and start!42764 b_free!12093) b_lambda!10427)))

(declare-fun b_lambda!10429 () Bool)

(assert (= b_lambda!10417 (or (and start!42764 b_free!12093) b_lambda!10429)))

(check-sat (not b!476672) b_and!20667 (not d!75789) tp_is_empty!13515 (not d!75783) (not d!75769) (not b_next!12093) (not b_lambda!10429) (not b_lambda!10427) (not b_lambda!10405) (not b!476682) (not b!476668))
(check-sat b_and!20667 (not b_next!12093))
(get-model)

(declare-fun d!75801 () Bool)

(declare-fun res!284557 () Bool)

(declare-fun e!280013 () Bool)

(assert (=> d!75801 (=> res!284557 e!280013)))

(assert (=> d!75801 (= res!284557 (or ((_ is Nil!9045) (toList!3963 lm!215)) ((_ is Nil!9045) (t!15054 (toList!3963 lm!215)))))))

(assert (=> d!75801 (= (isStrictlySorted!382 (toList!3963 lm!215)) e!280013)))

(declare-fun b!476698 () Bool)

(declare-fun e!280014 () Bool)

(assert (=> b!476698 (= e!280013 e!280014)))

(declare-fun res!284558 () Bool)

(assert (=> b!476698 (=> (not res!284558) (not e!280014))))

(assert (=> b!476698 (= res!284558 (bvslt (_1!4502 (h!9900 (toList!3963 lm!215))) (_1!4502 (h!9900 (t!15054 (toList!3963 lm!215))))))))

(declare-fun b!476699 () Bool)

(assert (=> b!476699 (= e!280014 (isStrictlySorted!382 (t!15054 (toList!3963 lm!215))))))

(assert (= (and d!75801 (not res!284557)) b!476698))

(assert (= (and b!476698 res!284558) b!476699))

(declare-fun m!458975 () Bool)

(assert (=> b!476699 m!458975))

(assert (=> d!75783 d!75801))

(declare-fun d!75803 () Bool)

(declare-fun res!284559 () Bool)

(declare-fun e!280015 () Bool)

(assert (=> d!75803 (=> res!284559 e!280015)))

(assert (=> d!75803 (= res!284559 ((_ is Nil!9045) (t!15054 (toList!3963 (tail!114 lm!215)))))))

(assert (=> d!75803 (= (forall!192 (t!15054 (toList!3963 (tail!114 lm!215))) p!166) e!280015)))

(declare-fun b!476700 () Bool)

(declare-fun e!280016 () Bool)

(assert (=> b!476700 (= e!280015 e!280016)))

(declare-fun res!284560 () Bool)

(assert (=> b!476700 (=> (not res!284560) (not e!280016))))

(assert (=> b!476700 (= res!284560 (dynLambda!939 p!166 (h!9900 (t!15054 (toList!3963 (tail!114 lm!215))))))))

(declare-fun b!476701 () Bool)

(assert (=> b!476701 (= e!280016 (forall!192 (t!15054 (t!15054 (toList!3963 (tail!114 lm!215)))) p!166))))

(assert (= (and d!75803 (not res!284559)) b!476700))

(assert (= (and b!476700 res!284560) b!476701))

(declare-fun b_lambda!10439 () Bool)

(assert (=> (not b_lambda!10439) (not b!476700)))

(declare-fun t!15075 () Bool)

(declare-fun tb!3983 () Bool)

(assert (=> (and start!42764 (= p!166 p!166) t!15075) tb!3983))

(declare-fun result!7539 () Bool)

(assert (=> tb!3983 (= result!7539 true)))

(assert (=> b!476700 t!15075))

(declare-fun b_and!20673 () Bool)

(assert (= b_and!20667 (and (=> t!15075 result!7539) b_and!20673)))

(declare-fun m!458977 () Bool)

(assert (=> b!476700 m!458977))

(declare-fun m!458979 () Bool)

(assert (=> b!476701 m!458979))

(assert (=> b!476672 d!75803))

(declare-fun d!75805 () Bool)

(assert (=> d!75805 (= (isEmpty!593 (toList!3963 lm!215)) ((_ is Nil!9045) (toList!3963 lm!215)))))

(assert (=> d!75769 d!75805))

(declare-fun d!75807 () Bool)

(assert (=> d!75807 (= (tail!118 (toList!3963 lm!215)) (t!15054 (toList!3963 lm!215)))))

(assert (=> d!75789 d!75807))

(declare-fun d!75809 () Bool)

(declare-fun res!284561 () Bool)

(declare-fun e!280017 () Bool)

(assert (=> d!75809 (=> res!284561 e!280017)))

(assert (=> d!75809 (= res!284561 ((_ is Nil!9045) (t!15054 (toList!3963 lm!215))))))

(assert (=> d!75809 (= (forall!192 (t!15054 (toList!3963 lm!215)) p!166) e!280017)))

(declare-fun b!476702 () Bool)

(declare-fun e!280018 () Bool)

(assert (=> b!476702 (= e!280017 e!280018)))

(declare-fun res!284562 () Bool)

(assert (=> b!476702 (=> (not res!284562) (not e!280018))))

(assert (=> b!476702 (= res!284562 (dynLambda!939 p!166 (h!9900 (t!15054 (toList!3963 lm!215)))))))

(declare-fun b!476703 () Bool)

(assert (=> b!476703 (= e!280018 (forall!192 (t!15054 (t!15054 (toList!3963 lm!215))) p!166))))

(assert (= (and d!75809 (not res!284561)) b!476702))

(assert (= (and b!476702 res!284562) b!476703))

(declare-fun b_lambda!10441 () Bool)

(assert (=> (not b_lambda!10441) (not b!476702)))

(declare-fun t!15077 () Bool)

(declare-fun tb!3985 () Bool)

(assert (=> (and start!42764 (= p!166 p!166) t!15077) tb!3985))

(declare-fun result!7541 () Bool)

(assert (=> tb!3985 (= result!7541 true)))

(assert (=> b!476702 t!15077))

(declare-fun b_and!20675 () Bool)

(assert (= b_and!20673 (and (=> t!15077 result!7541) b_and!20675)))

(declare-fun m!458981 () Bool)

(assert (=> b!476702 m!458981))

(declare-fun m!458983 () Bool)

(assert (=> b!476703 m!458983))

(assert (=> b!476668 d!75809))

(declare-fun b!476704 () Bool)

(declare-fun e!280019 () Bool)

(declare-fun tp!42360 () Bool)

(assert (=> b!476704 (= e!280019 (and tp_is_empty!13515 tp!42360))))

(assert (=> b!476682 (= tp!42358 e!280019)))

(assert (= (and b!476682 ((_ is Cons!9044) (t!15054 (toList!3963 lm!215)))) b!476704))

(declare-fun b_lambda!10443 () Bool)

(assert (= b_lambda!10441 (or (and start!42764 b_free!12093) b_lambda!10443)))

(declare-fun b_lambda!10445 () Bool)

(assert (= b_lambda!10439 (or (and start!42764 b_free!12093) b_lambda!10445)))

(check-sat b_and!20675 (not b!476703) (not b_lambda!10445) (not b!476701) tp_is_empty!13515 (not b!476704) (not b!476699) (not b_next!12093) (not b_lambda!10429) (not b_lambda!10443) (not b_lambda!10427) (not b_lambda!10405))
