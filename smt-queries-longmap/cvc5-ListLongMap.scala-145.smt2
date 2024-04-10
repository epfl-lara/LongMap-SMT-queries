; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2652 () Bool)

(assert start!2652)

(declare-fun b_free!547 () Bool)

(declare-fun b_next!547 () Bool)

(assert (=> start!2652 (= b_free!547 (not b_next!547))))

(declare-fun tp!2767 () Bool)

(declare-fun b_and!1041 () Bool)

(assert (=> start!2652 (= tp!2767 b_and!1041)))

(declare-fun res!11893 () Bool)

(declare-fun e!9688 () Bool)

(assert (=> start!2652 (=> (not res!11893) (not e!9688))))

(declare-datatypes ((B!668 0))(
  ( (B!669 (val!432 Int)) )
))
(declare-datatypes ((tuple2!664 0))(
  ( (tuple2!665 (_1!332 (_ BitVec 64)) (_2!332 B!668)) )
))
(declare-datatypes ((List!517 0))(
  ( (Nil!514) (Cons!513 (h!1079 tuple2!664) (t!3003 List!517)) )
))
(declare-datatypes ((ListLongMap!495 0))(
  ( (ListLongMap!496 (toList!263 List!517)) )
))
(declare-fun lm!221 () ListLongMap!495)

(declare-fun p!191 () Int)

(declare-fun forall!134 (List!517 Int) Bool)

(assert (=> start!2652 (= res!11893 (forall!134 (toList!263 lm!221) p!191))))

(assert (=> start!2652 e!9688))

(declare-fun e!9689 () Bool)

(declare-fun inv!864 (ListLongMap!495) Bool)

(assert (=> start!2652 (and (inv!864 lm!221) e!9689)))

(assert (=> start!2652 tp!2767))

(declare-fun b!15859 () Bool)

(declare-fun size!508 (List!517) Int)

(assert (=> b!15859 (= e!9688 (< (size!508 (toList!263 lm!221)) 0))))

(declare-fun b!15860 () Bool)

(declare-fun tp!2768 () Bool)

(assert (=> b!15860 (= e!9689 tp!2768)))

(assert (= (and start!2652 res!11893) b!15859))

(assert (= start!2652 b!15860))

(declare-fun m!10895 () Bool)

(assert (=> start!2652 m!10895))

(declare-fun m!10897 () Bool)

(assert (=> start!2652 m!10897))

(declare-fun m!10899 () Bool)

(assert (=> b!15859 m!10899))

(push 1)

(assert (not b!15860))

(assert (not b!15859))

(assert (not start!2652))

(assert b_and!1041)

(assert (not b_next!547))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1041)

(assert (not b_next!547))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2867 () Bool)

(declare-fun lt!3932 () Int)

(assert (=> d!2867 (>= lt!3932 0)))

(declare-fun e!9709 () Int)

(assert (=> d!2867 (= lt!3932 e!9709)))

(declare-fun c!1501 () Bool)

(assert (=> d!2867 (= c!1501 (is-Nil!514 (toList!263 lm!221)))))

(assert (=> d!2867 (= (size!508 (toList!263 lm!221)) lt!3932)))

(declare-fun b!15887 () Bool)

(assert (=> b!15887 (= e!9709 0)))

(declare-fun b!15888 () Bool)

(assert (=> b!15888 (= e!9709 (+ 1 (size!508 (t!3003 (toList!263 lm!221)))))))

(assert (= (and d!2867 c!1501) b!15887))

(assert (= (and d!2867 (not c!1501)) b!15888))

(declare-fun m!10914 () Bool)

(assert (=> b!15888 m!10914))

(assert (=> b!15859 d!2867))

(declare-fun d!2872 () Bool)

(declare-fun res!11912 () Bool)

(declare-fun e!9723 () Bool)

(assert (=> d!2872 (=> res!11912 e!9723)))

(assert (=> d!2872 (= res!11912 (is-Nil!514 (toList!263 lm!221)))))

(assert (=> d!2872 (= (forall!134 (toList!263 lm!221) p!191) e!9723)))

(declare-fun b!15903 () Bool)

(declare-fun e!9724 () Bool)

(assert (=> b!15903 (= e!9723 e!9724)))

(declare-fun res!11913 () Bool)

(assert (=> b!15903 (=> (not res!11913) (not e!9724))))

(declare-fun dynLambda!117 (Int tuple2!664) Bool)

(assert (=> b!15903 (= res!11913 (dynLambda!117 p!191 (h!1079 (toList!263 lm!221))))))

(declare-fun b!15904 () Bool)

(assert (=> b!15904 (= e!9724 (forall!134 (t!3003 (toList!263 lm!221)) p!191))))

(assert (= (and d!2872 (not res!11912)) b!15903))

(assert (= (and b!15903 res!11913) b!15904))

(declare-fun b_lambda!1139 () Bool)

(assert (=> (not b_lambda!1139) (not b!15903)))

(declare-fun t!3007 () Bool)

(declare-fun tb!477 () Bool)

(assert (=> (and start!2652 (= p!191 p!191) t!3007) tb!477))

(declare-fun result!825 () Bool)

(assert (=> tb!477 (= result!825 true)))

(assert (=> b!15903 t!3007))

(declare-fun b_and!1048 () Bool)

(assert (= b_and!1041 (and (=> t!3007 result!825) b_and!1048)))

(declare-fun m!10920 () Bool)

(assert (=> b!15903 m!10920))

(declare-fun m!10924 () Bool)

(assert (=> b!15904 m!10924))

(assert (=> start!2652 d!2872))

(declare-fun d!2878 () Bool)

(declare-fun isStrictlySorted!155 (List!517) Bool)

(assert (=> d!2878 (= (inv!864 lm!221) (isStrictlySorted!155 (toList!263 lm!221)))))

(declare-fun bs!729 () Bool)

(assert (= bs!729 d!2878))

(declare-fun m!10931 () Bool)

(assert (=> bs!729 m!10931))

(assert (=> start!2652 d!2878))

(declare-fun b!15917 () Bool)

(declare-fun e!9733 () Bool)

(declare-fun tp_is_empty!813 () Bool)

(declare-fun tp!2785 () Bool)

(assert (=> b!15917 (= e!9733 (and tp_is_empty!813 tp!2785))))

(assert (=> b!15860 (= tp!2768 e!9733)))

(assert (= (and b!15860 (is-Cons!513 (toList!263 lm!221))) b!15917))

(declare-fun b_lambda!1146 () Bool)

(assert (= b_lambda!1139 (or (and start!2652 b_free!547) b_lambda!1146)))

(push 1)

