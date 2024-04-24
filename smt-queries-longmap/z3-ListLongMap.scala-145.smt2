; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2652 () Bool)

(assert start!2652)

(declare-fun b_free!547 () Bool)

(declare-fun b_next!547 () Bool)

(assert (=> start!2652 (= b_free!547 (not b_next!547))))

(declare-fun tp!2768 () Bool)

(declare-fun b_and!1041 () Bool)

(assert (=> start!2652 (= tp!2768 b_and!1041)))

(declare-fun res!11891 () Bool)

(declare-fun e!9685 () Bool)

(assert (=> start!2652 (=> (not res!11891) (not e!9685))))

(declare-datatypes ((B!668 0))(
  ( (B!669 (val!432 Int)) )
))
(declare-datatypes ((tuple2!660 0))(
  ( (tuple2!661 (_1!330 (_ BitVec 64)) (_2!330 B!668)) )
))
(declare-datatypes ((List!513 0))(
  ( (Nil!510) (Cons!509 (h!1075 tuple2!660) (t!2999 List!513)) )
))
(declare-datatypes ((ListLongMap!491 0))(
  ( (ListLongMap!492 (toList!261 List!513)) )
))
(declare-fun lm!221 () ListLongMap!491)

(declare-fun p!191 () Int)

(declare-fun forall!134 (List!513 Int) Bool)

(assert (=> start!2652 (= res!11891 (forall!134 (toList!261 lm!221) p!191))))

(assert (=> start!2652 e!9685))

(declare-fun e!9684 () Bool)

(declare-fun inv!864 (ListLongMap!491) Bool)

(assert (=> start!2652 (and (inv!864 lm!221) e!9684)))

(assert (=> start!2652 tp!2768))

(declare-fun b!15853 () Bool)

(declare-fun size!499 (List!513) Int)

(assert (=> b!15853 (= e!9685 (< (size!499 (toList!261 lm!221)) 0))))

(declare-fun b!15854 () Bool)

(declare-fun tp!2767 () Bool)

(assert (=> b!15854 (= e!9684 tp!2767)))

(assert (= (and start!2652 res!11891) b!15853))

(assert (= start!2652 b!15854))

(declare-fun m!10887 () Bool)

(assert (=> start!2652 m!10887))

(declare-fun m!10889 () Bool)

(assert (=> start!2652 m!10889))

(declare-fun m!10891 () Bool)

(assert (=> b!15853 m!10891))

(check-sat b_and!1041 (not start!2652) (not b!15853) (not b_next!547) (not b!15854))
(check-sat b_and!1041 (not b_next!547))
(get-model)

(declare-fun d!2863 () Bool)

(declare-fun res!11906 () Bool)

(declare-fun e!9706 () Bool)

(assert (=> d!2863 (=> res!11906 e!9706)))

(get-info :version)

(assert (=> d!2863 (= res!11906 ((_ is Nil!510) (toList!261 lm!221)))))

(assert (=> d!2863 (= (forall!134 (toList!261 lm!221) p!191) e!9706)))

(declare-fun b!15875 () Bool)

(declare-fun e!9708 () Bool)

(assert (=> b!15875 (= e!9706 e!9708)))

(declare-fun res!11908 () Bool)

(assert (=> b!15875 (=> (not res!11908) (not e!9708))))

(declare-fun dynLambda!114 (Int tuple2!660) Bool)

(assert (=> b!15875 (= res!11908 (dynLambda!114 p!191 (h!1075 (toList!261 lm!221))))))

(declare-fun b!15877 () Bool)

(assert (=> b!15877 (= e!9708 (forall!134 (t!2999 (toList!261 lm!221)) p!191))))

(assert (= (and d!2863 (not res!11906)) b!15875))

(assert (= (and b!15875 res!11908) b!15877))

(declare-fun b_lambda!1141 () Bool)

(assert (=> (not b_lambda!1141) (not b!15875)))

(declare-fun t!3004 () Bool)

(declare-fun tb!478 () Bool)

(assert (=> (and start!2652 (= p!191 p!191) t!3004) tb!478))

(declare-fun result!827 () Bool)

(assert (=> tb!478 (= result!827 true)))

(assert (=> b!15875 t!3004))

(declare-fun b_and!1049 () Bool)

(assert (= b_and!1041 (and (=> t!3004 result!827) b_and!1049)))

(declare-fun m!10907 () Bool)

(assert (=> b!15875 m!10907))

(declare-fun m!10909 () Bool)

(assert (=> b!15877 m!10909))

(assert (=> start!2652 d!2863))

(declare-fun d!2869 () Bool)

(declare-fun isStrictlySorted!143 (List!513) Bool)

(assert (=> d!2869 (= (inv!864 lm!221) (isStrictlySorted!143 (toList!261 lm!221)))))

(declare-fun bs!729 () Bool)

(assert (= bs!729 d!2869))

(declare-fun m!10913 () Bool)

(assert (=> bs!729 m!10913))

(assert (=> start!2652 d!2869))

(declare-fun d!2871 () Bool)

(declare-fun lt!3932 () Int)

(assert (=> d!2871 (>= lt!3932 0)))

(declare-fun e!9717 () Int)

(assert (=> d!2871 (= lt!3932 e!9717)))

(declare-fun c!1499 () Bool)

(assert (=> d!2871 (= c!1499 ((_ is Nil!510) (toList!261 lm!221)))))

(assert (=> d!2871 (= (size!499 (toList!261 lm!221)) lt!3932)))

(declare-fun b!15892 () Bool)

(assert (=> b!15892 (= e!9717 0)))

(declare-fun b!15894 () Bool)

(assert (=> b!15894 (= e!9717 (+ 1 (size!499 (t!2999 (toList!261 lm!221)))))))

(assert (= (and d!2871 c!1499) b!15892))

(assert (= (and d!2871 (not c!1499)) b!15894))

(declare-fun m!10918 () Bool)

(assert (=> b!15894 m!10918))

(assert (=> b!15853 d!2871))

(declare-fun b!15906 () Bool)

(declare-fun e!9724 () Bool)

(declare-fun tp_is_empty!813 () Bool)

(declare-fun tp!2786 () Bool)

(assert (=> b!15906 (= e!9724 (and tp_is_empty!813 tp!2786))))

(assert (=> b!15854 (= tp!2767 e!9724)))

(assert (= (and b!15854 ((_ is Cons!509) (toList!261 lm!221))) b!15906))

(declare-fun b_lambda!1145 () Bool)

(assert (= b_lambda!1141 (or (and start!2652 b_free!547) b_lambda!1145)))

(check-sat (not d!2869) b_and!1049 (not b_lambda!1145) tp_is_empty!813 (not b_next!547) (not b!15877) (not b!15894) (not b!15906))
(check-sat b_and!1049 (not b_next!547))
