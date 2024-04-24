; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42724 () Bool)

(assert start!42724)

(declare-fun b_free!12085 () Bool)

(declare-fun b_next!12085 () Bool)

(assert (=> start!42724 (= b_free!12085 (not b_next!12085))))

(declare-fun tp!42310 () Bool)

(declare-fun b_and!20637 () Bool)

(assert (=> start!42724 (= tp!42310 b_and!20637)))

(declare-fun res!284453 () Bool)

(declare-fun e!279859 () Bool)

(assert (=> start!42724 (=> (not res!284453) (not e!279859))))

(declare-datatypes ((B!1034 0))(
  ( (B!1035 (val!6801 Int)) )
))
(declare-datatypes ((tuple2!8898 0))(
  ( (tuple2!8899 (_1!4460 (_ BitVec 64)) (_2!4460 B!1034)) )
))
(declare-datatypes ((List!8953 0))(
  ( (Nil!8950) (Cons!8949 (h!9805 tuple2!8898) (t!14937 List!8953)) )
))
(declare-datatypes ((ListLongMap!7813 0))(
  ( (ListLongMap!7814 (toList!3922 List!8953)) )
))
(declare-fun lm!215 () ListLongMap!7813)

(declare-fun p!166 () Int)

(declare-fun forall!188 (List!8953 Int) Bool)

(assert (=> start!42724 (= res!284453 (forall!188 (toList!3922 lm!215) p!166))))

(assert (=> start!42724 e!279859))

(declare-fun e!279858 () Bool)

(declare-fun inv!15471 (ListLongMap!7813) Bool)

(assert (=> start!42724 (and (inv!15471 lm!215) e!279858)))

(assert (=> start!42724 tp!42310))

(assert (=> start!42724 true))

(declare-fun tp_is_empty!13507 () Bool)

(assert (=> start!42724 tp_is_empty!13507))

(declare-fun b!476475 () Bool)

(declare-fun res!284454 () Bool)

(assert (=> b!476475 (=> (not res!284454) (not e!279859))))

(declare-fun b!85 () B!1034)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!932 (Int tuple2!8898) Bool)

(assert (=> b!476475 (= res!284454 (dynLambda!932 p!166 (tuple2!8899 a!501 b!85)))))

(declare-fun b!476476 () Bool)

(declare-fun size!15131 (List!8953) Int)

(assert (=> b!476476 (= e!279859 (< (size!15131 (toList!3922 lm!215)) 0))))

(declare-fun b!476477 () Bool)

(declare-fun tp!42309 () Bool)

(assert (=> b!476477 (= e!279858 tp!42309)))

(assert (= (and start!42724 res!284453) b!476475))

(assert (= (and b!476475 res!284454) b!476476))

(assert (= start!42724 b!476477))

(declare-fun b_lambda!10385 () Bool)

(assert (=> (not b_lambda!10385) (not b!476475)))

(declare-fun t!14936 () Bool)

(declare-fun tb!3941 () Bool)

(assert (=> (and start!42724 (= p!166 p!166) t!14936) tb!3941))

(declare-fun result!7485 () Bool)

(assert (=> tb!3941 (= result!7485 true)))

(assert (=> b!476475 t!14936))

(declare-fun b_and!20639 () Bool)

(assert (= b_and!20637 (and (=> t!14936 result!7485) b_and!20639)))

(declare-fun m!459021 () Bool)

(assert (=> start!42724 m!459021))

(declare-fun m!459023 () Bool)

(assert (=> start!42724 m!459023))

(declare-fun m!459025 () Bool)

(assert (=> b!476475 m!459025))

(declare-fun m!459027 () Bool)

(assert (=> b!476476 m!459027))

(check-sat b_and!20639 (not b_lambda!10385) (not start!42724) (not b!476476) tp_is_empty!13507 (not b!476477) (not b_next!12085))
(check-sat b_and!20639 (not b_next!12085))
(get-model)

(declare-fun b_lambda!10395 () Bool)

(assert (= b_lambda!10385 (or (and start!42724 b_free!12085) b_lambda!10395)))

(check-sat (not start!42724) (not b!476476) tp_is_empty!13507 b_and!20639 (not b_lambda!10395) (not b!476477) (not b_next!12085))
(check-sat b_and!20639 (not b_next!12085))
(get-model)

(declare-fun d!75773 () Bool)

(declare-fun res!284483 () Bool)

(declare-fun e!279888 () Bool)

(assert (=> d!75773 (=> res!284483 e!279888)))

(get-info :version)

(assert (=> d!75773 (= res!284483 ((_ is Nil!8950) (toList!3922 lm!215)))))

(assert (=> d!75773 (= (forall!188 (toList!3922 lm!215) p!166) e!279888)))

(declare-fun b!476512 () Bool)

(declare-fun e!279889 () Bool)

(assert (=> b!476512 (= e!279888 e!279889)))

(declare-fun res!284484 () Bool)

(assert (=> b!476512 (=> (not res!284484) (not e!279889))))

(assert (=> b!476512 (= res!284484 (dynLambda!932 p!166 (h!9805 (toList!3922 lm!215))))))

(declare-fun b!476513 () Bool)

(assert (=> b!476513 (= e!279889 (forall!188 (t!14937 (toList!3922 lm!215)) p!166))))

(assert (= (and d!75773 (not res!284483)) b!476512))

(assert (= (and b!476512 res!284484) b!476513))

(declare-fun b_lambda!10401 () Bool)

(assert (=> (not b_lambda!10401) (not b!476512)))

(declare-fun t!14949 () Bool)

(declare-fun tb!3951 () Bool)

(assert (=> (and start!42724 (= p!166 p!166) t!14949) tb!3951))

(declare-fun result!7495 () Bool)

(assert (=> tb!3951 (= result!7495 true)))

(assert (=> b!476512 t!14949))

(declare-fun b_and!20653 () Bool)

(assert (= b_and!20639 (and (=> t!14949 result!7495) b_and!20653)))

(declare-fun m!459055 () Bool)

(assert (=> b!476512 m!459055))

(declare-fun m!459057 () Bool)

(assert (=> b!476513 m!459057))

(assert (=> start!42724 d!75773))

(declare-fun d!75781 () Bool)

(declare-fun isStrictlySorted!368 (List!8953) Bool)

(assert (=> d!75781 (= (inv!15471 lm!215) (isStrictlySorted!368 (toList!3922 lm!215)))))

(declare-fun bs!15147 () Bool)

(assert (= bs!15147 d!75781))

(declare-fun m!459061 () Bool)

(assert (=> bs!15147 m!459061))

(assert (=> start!42724 d!75781))

(declare-fun d!75785 () Bool)

(declare-fun lt!217320 () Int)

(assert (=> d!75785 (>= lt!217320 0)))

(declare-fun e!279904 () Int)

(assert (=> d!75785 (= lt!217320 e!279904)))

(declare-fun c!57328 () Bool)

(assert (=> d!75785 (= c!57328 ((_ is Nil!8950) (toList!3922 lm!215)))))

(assert (=> d!75785 (= (size!15131 (toList!3922 lm!215)) lt!217320)))

(declare-fun b!476540 () Bool)

(assert (=> b!476540 (= e!279904 0)))

(declare-fun b!476541 () Bool)

(assert (=> b!476541 (= e!279904 (+ 1 (size!15131 (t!14937 (toList!3922 lm!215)))))))

(assert (= (and d!75785 c!57328) b!476540))

(assert (= (and d!75785 (not c!57328)) b!476541))

(declare-fun m!459067 () Bool)

(assert (=> b!476541 m!459067))

(assert (=> b!476476 d!75785))

(declare-fun b!476546 () Bool)

(declare-fun e!279907 () Bool)

(declare-fun tp!42331 () Bool)

(assert (=> b!476546 (= e!279907 (and tp_is_empty!13507 tp!42331))))

(assert (=> b!476477 (= tp!42309 e!279907)))

(assert (= (and b!476477 ((_ is Cons!8949) (toList!3922 lm!215))) b!476546))

(declare-fun b_lambda!10407 () Bool)

(assert (= b_lambda!10401 (or (and start!42724 b_free!12085) b_lambda!10407)))

(check-sat (not b_lambda!10395) (not b!476546) (not d!75781) b_and!20653 (not b_lambda!10407) (not b!476541) (not b_next!12085) (not b!476513) tp_is_empty!13507)
(check-sat b_and!20653 (not b_next!12085))
