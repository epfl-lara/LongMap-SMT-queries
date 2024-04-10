; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42738 () Bool)

(assert start!42738)

(declare-fun b_free!12085 () Bool)

(declare-fun b_next!12085 () Bool)

(assert (=> start!42738 (= b_free!12085 (not b_next!12085))))

(declare-fun tp!42309 () Bool)

(declare-fun b_and!20627 () Bool)

(assert (=> start!42738 (= tp!42309 b_and!20627)))

(declare-fun res!284460 () Bool)

(declare-fun e!279898 () Bool)

(assert (=> start!42738 (=> (not res!284460) (not e!279898))))

(declare-datatypes ((B!1034 0))(
  ( (B!1035 (val!6801 Int)) )
))
(declare-datatypes ((tuple2!8974 0))(
  ( (tuple2!8975 (_1!4498 (_ BitVec 64)) (_2!4498 B!1034)) )
))
(declare-datatypes ((List!9044 0))(
  ( (Nil!9041) (Cons!9040 (h!9896 tuple2!8974) (t!15036 List!9044)) )
))
(declare-datatypes ((ListLongMap!7887 0))(
  ( (ListLongMap!7888 (toList!3959 List!9044)) )
))
(declare-fun lm!215 () ListLongMap!7887)

(declare-fun p!166 () Int)

(declare-fun forall!188 (List!9044 Int) Bool)

(assert (=> start!42738 (= res!284460 (forall!188 (toList!3959 lm!215) p!166))))

(assert (=> start!42738 e!279898))

(declare-fun e!279897 () Bool)

(declare-fun inv!15471 (ListLongMap!7887) Bool)

(assert (=> start!42738 (and (inv!15471 lm!215) e!279897)))

(assert (=> start!42738 tp!42309))

(assert (=> start!42738 true))

(declare-fun tp_is_empty!13507 () Bool)

(assert (=> start!42738 tp_is_empty!13507))

(declare-fun b!476536 () Bool)

(declare-fun res!284461 () Bool)

(assert (=> b!476536 (=> (not res!284461) (not e!279898))))

(declare-fun b!85 () B!1034)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!935 (Int tuple2!8974) Bool)

(assert (=> b!476536 (= res!284461 (dynLambda!935 p!166 (tuple2!8975 a!501 b!85)))))

(declare-fun b!476537 () Bool)

(declare-fun size!15137 (List!9044) Int)

(assert (=> b!476537 (= e!279898 (< (size!15137 (toList!3959 lm!215)) 0))))

(declare-fun b!476538 () Bool)

(declare-fun tp!42310 () Bool)

(assert (=> b!476538 (= e!279897 tp!42310)))

(assert (= (and start!42738 res!284460) b!476536))

(assert (= (and b!476536 res!284461) b!476537))

(assert (= start!42738 b!476538))

(declare-fun b_lambda!10371 () Bool)

(assert (=> (not b_lambda!10371) (not b!476536)))

(declare-fun t!15035 () Bool)

(declare-fun tb!3949 () Bool)

(assert (=> (and start!42738 (= p!166 p!166) t!15035) tb!3949))

(declare-fun result!7493 () Bool)

(assert (=> tb!3949 (= result!7493 true)))

(assert (=> b!476536 t!15035))

(declare-fun b_and!20629 () Bool)

(assert (= b_and!20627 (and (=> t!15035 result!7493) b_and!20629)))

(declare-fun m!458839 () Bool)

(assert (=> start!42738 m!458839))

(declare-fun m!458841 () Bool)

(assert (=> start!42738 m!458841))

(declare-fun m!458843 () Bool)

(assert (=> b!476536 m!458843))

(declare-fun m!458845 () Bool)

(assert (=> b!476537 m!458845))

(push 1)

(assert (not b_lambda!10371))

(assert tp_is_empty!13507)

(assert (not b!476537))

(assert b_and!20629)

(assert (not start!42738))

(assert (not b!476538))

(assert (not b_next!12085))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20629)

(assert (not b_next!12085))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10377 () Bool)

(assert (= b_lambda!10371 (or (and start!42738 b_free!12085) b_lambda!10377)))

(push 1)

(assert (not b_lambda!10377))

(assert tp_is_empty!13507)

(assert (not b!476537))

(assert b_and!20629)

(assert (not start!42738))

(assert (not b!476538))

(assert (not b_next!12085))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20629)

(assert (not b_next!12085))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75741 () Bool)

(declare-fun res!284478 () Bool)

(declare-fun e!279917 () Bool)

(assert (=> d!75741 (=> res!284478 e!279917)))

(assert (=> d!75741 (= res!284478 (is-Nil!9041 (toList!3959 lm!215)))))

(assert (=> d!75741 (= (forall!188 (toList!3959 lm!215) p!166) e!279917)))

(declare-fun b!476565 () Bool)

(declare-fun e!279918 () Bool)

(assert (=> b!476565 (= e!279917 e!279918)))

(declare-fun res!284479 () Bool)

(assert (=> b!476565 (=> (not res!284479) (not e!279918))))

(assert (=> b!476565 (= res!284479 (dynLambda!935 p!166 (h!9896 (toList!3959 lm!215))))))

(declare-fun b!476566 () Bool)

(assert (=> b!476566 (= e!279918 (forall!188 (t!15036 (toList!3959 lm!215)) p!166))))

(assert (= (and d!75741 (not res!284478)) b!476565))

(assert (= (and b!476565 res!284479) b!476566))

(declare-fun b_lambda!10383 () Bool)

(assert (=> (not b_lambda!10383) (not b!476565)))

(declare-fun t!15044 () Bool)

(declare-fun tb!3955 () Bool)

(assert (=> (and start!42738 (= p!166 p!166) t!15044) tb!3955))

(declare-fun result!7499 () Bool)

(assert (=> tb!3955 (= result!7499 true)))

(assert (=> b!476565 t!15044))

(declare-fun b_and!20639 () Bool)

(assert (= b_and!20629 (and (=> t!15044 result!7499) b_and!20639)))

(declare-fun m!458865 () Bool)

(assert (=> b!476565 m!458865))

(declare-fun m!458867 () Bool)

(assert (=> b!476566 m!458867))

(assert (=> start!42738 d!75741))

(declare-fun d!75747 () Bool)

(declare-fun isStrictlySorted!379 (List!9044) Bool)

(assert (=> d!75747 (= (inv!15471 lm!215) (isStrictlySorted!379 (toList!3959 lm!215)))))

(declare-fun bs!15129 () Bool)

(assert (= bs!15129 d!75747))

(declare-fun m!458869 () Bool)

(assert (=> bs!15129 m!458869))

(assert (=> start!42738 d!75747))

(declare-fun d!75751 () Bool)

(declare-fun lt!217308 () Int)

(assert (=> d!75751 (>= lt!217308 0)))

(declare-fun e!279933 () Int)

(assert (=> d!75751 (= lt!217308 e!279933)))

(declare-fun c!57355 () Bool)

(assert (=> d!75751 (= c!57355 (is-Nil!9041 (toList!3959 lm!215)))))

(assert (=> d!75751 (= (size!15137 (toList!3959 lm!215)) lt!217308)))

(declare-fun b!476585 () Bool)

(assert (=> b!476585 (= e!279933 0)))

(declare-fun b!476586 () Bool)

(assert (=> b!476586 (= e!279933 (+ 1 (size!15137 (t!15036 (toList!3959 lm!215)))))))

(assert (= (and d!75751 c!57355) b!476585))

(assert (= (and d!75751 (not c!57355)) b!476586))

(declare-fun m!458877 () Bool)

(assert (=> b!476586 m!458877))

(assert (=> b!476537 d!75751))

(declare-fun b!476599 () Bool)

(declare-fun e!279940 () Bool)

(declare-fun tp!42327 () Bool)

(assert (=> b!476599 (= e!279940 (and tp_is_empty!13507 tp!42327))))

(assert (=> b!476538 (= tp!42310 e!279940)))

(assert (= (and b!476538 (is-Cons!9040 (toList!3959 lm!215))) b!476599))

(declare-fun b_lambda!10387 () Bool)

(assert (= b_lambda!10383 (or (and start!42738 b_free!12085) b_lambda!10387)))

(push 1)

