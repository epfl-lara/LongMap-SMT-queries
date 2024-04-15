; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

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

(assert (=> start!2652 (= res!11893 (forall!134 (toList!261 lm!221) p!191))))

(assert (=> start!2652 e!9688))

(declare-fun e!9689 () Bool)

(declare-fun inv!864 (ListLongMap!491) Bool)

(assert (=> start!2652 (and (inv!864 lm!221) e!9689)))

(assert (=> start!2652 tp!2767))

(declare-fun b!15859 () Bool)

(declare-fun size!499 (List!513) Int)

(assert (=> b!15859 (= e!9688 (< (size!499 (toList!261 lm!221)) 0))))

(declare-fun b!15860 () Bool)

(declare-fun tp!2768 () Bool)

(assert (=> b!15860 (= e!9689 tp!2768)))

(assert (= (and start!2652 res!11893) b!15859))

(assert (= start!2652 b!15860))

(declare-fun m!10887 () Bool)

(assert (=> start!2652 m!10887))

(declare-fun m!10889 () Bool)

(assert (=> start!2652 m!10889))

(declare-fun m!10891 () Bool)

(assert (=> b!15859 m!10891))

(check-sat (not b!15859) (not start!2652) (not b_next!547) (not b!15860) b_and!1041)
(check-sat b_and!1041 (not b_next!547))
(get-model)

(declare-fun d!2869 () Bool)

(declare-fun lt!3929 () Int)

(assert (=> d!2869 (>= lt!3929 0)))

(declare-fun e!9710 () Int)

(assert (=> d!2869 (= lt!3929 e!9710)))

(declare-fun c!1498 () Bool)

(get-info :version)

(assert (=> d!2869 (= c!1498 ((_ is Nil!510) (toList!261 lm!221)))))

(assert (=> d!2869 (= (size!499 (toList!261 lm!221)) lt!3929)))

(declare-fun b!15885 () Bool)

(assert (=> b!15885 (= e!9710 0)))

(declare-fun b!15886 () Bool)

(assert (=> b!15886 (= e!9710 (+ 1 (size!499 (t!2999 (toList!261 lm!221)))))))

(assert (= (and d!2869 c!1498) b!15885))

(assert (= (and d!2869 (not c!1498)) b!15886))

(declare-fun m!10907 () Bool)

(assert (=> b!15886 m!10907))

(assert (=> b!15859 d!2869))

(declare-fun d!2871 () Bool)

(declare-fun res!11914 () Bool)

(declare-fun e!9722 () Bool)

(assert (=> d!2871 (=> res!11914 e!9722)))

(assert (=> d!2871 (= res!11914 ((_ is Nil!510) (toList!261 lm!221)))))

(assert (=> d!2871 (= (forall!134 (toList!261 lm!221) p!191) e!9722)))

(declare-fun b!15899 () Bool)

(declare-fun e!9723 () Bool)

(assert (=> b!15899 (= e!9722 e!9723)))

(declare-fun res!11915 () Bool)

(assert (=> b!15899 (=> (not res!11915) (not e!9723))))

(declare-fun dynLambda!117 (Int tuple2!660) Bool)

(assert (=> b!15899 (= res!11915 (dynLambda!117 p!191 (h!1075 (toList!261 lm!221))))))

(declare-fun b!15901 () Bool)

(assert (=> b!15901 (= e!9723 (forall!134 (t!2999 (toList!261 lm!221)) p!191))))

(assert (= (and d!2871 (not res!11914)) b!15899))

(assert (= (and b!15899 res!11915) b!15901))

(declare-fun b_lambda!1141 () Bool)

(assert (=> (not b_lambda!1141) (not b!15899)))

(declare-fun t!3005 () Bool)

(declare-fun tb!479 () Bool)

(assert (=> (and start!2652 (= p!191 p!191) t!3005) tb!479))

(declare-fun result!827 () Bool)

(assert (=> tb!479 (= result!827 true)))

(assert (=> b!15899 t!3005))

(declare-fun b_and!1049 () Bool)

(assert (= b_and!1041 (and (=> t!3005 result!827) b_and!1049)))

(declare-fun m!10913 () Bool)

(assert (=> b!15899 m!10913))

(declare-fun m!10917 () Bool)

(assert (=> b!15901 m!10917))

(assert (=> start!2652 d!2871))

(declare-fun d!2877 () Bool)

(declare-fun isStrictlySorted!150 (List!513) Bool)

(assert (=> d!2877 (= (inv!864 lm!221) (isStrictlySorted!150 (toList!261 lm!221)))))

(declare-fun bs!731 () Bool)

(assert (= bs!731 d!2877))

(declare-fun m!10925 () Bool)

(assert (=> bs!731 m!10925))

(assert (=> start!2652 d!2877))

(declare-fun b!15916 () Bool)

(declare-fun e!9733 () Bool)

(declare-fun tp_is_empty!813 () Bool)

(declare-fun tp!2786 () Bool)

(assert (=> b!15916 (= e!9733 (and tp_is_empty!813 tp!2786))))

(assert (=> b!15860 (= tp!2768 e!9733)))

(assert (= (and b!15860 ((_ is Cons!509) (toList!261 lm!221))) b!15916))

(declare-fun b_lambda!1146 () Bool)

(assert (= b_lambda!1141 (or (and start!2652 b_free!547) b_lambda!1146)))

(check-sat (not b!15886) (not b!15901) tp_is_empty!813 (not b!15916) (not d!2877) b_and!1049 (not b_next!547) (not b_lambda!1146))
(check-sat b_and!1049 (not b_next!547))
