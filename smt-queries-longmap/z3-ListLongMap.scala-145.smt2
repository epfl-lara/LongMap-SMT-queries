; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2654 () Bool)

(assert start!2654)

(declare-fun b_free!549 () Bool)

(declare-fun b_next!549 () Bool)

(assert (=> start!2654 (= b_free!549 (not b_next!549))))

(declare-fun tp!2774 () Bool)

(declare-fun b_and!1043 () Bool)

(assert (=> start!2654 (= tp!2774 b_and!1043)))

(declare-fun res!11896 () Bool)

(declare-fun e!9695 () Bool)

(assert (=> start!2654 (=> (not res!11896) (not e!9695))))

(declare-datatypes ((B!670 0))(
  ( (B!671 (val!433 Int)) )
))
(declare-datatypes ((tuple2!666 0))(
  ( (tuple2!667 (_1!333 (_ BitVec 64)) (_2!333 B!670)) )
))
(declare-datatypes ((List!518 0))(
  ( (Nil!515) (Cons!514 (h!1080 tuple2!666) (t!3004 List!518)) )
))
(declare-datatypes ((ListLongMap!497 0))(
  ( (ListLongMap!498 (toList!264 List!518)) )
))
(declare-fun lm!221 () ListLongMap!497)

(declare-fun p!191 () Int)

(declare-fun forall!135 (List!518 Int) Bool)

(assert (=> start!2654 (= res!11896 (forall!135 (toList!264 lm!221) p!191))))

(assert (=> start!2654 e!9695))

(declare-fun e!9694 () Bool)

(declare-fun inv!865 (ListLongMap!497) Bool)

(assert (=> start!2654 (and (inv!865 lm!221) e!9694)))

(assert (=> start!2654 tp!2774))

(declare-fun b!15865 () Bool)

(declare-fun size!509 (List!518) Int)

(assert (=> b!15865 (= e!9695 (< (size!509 (toList!264 lm!221)) 0))))

(declare-fun b!15866 () Bool)

(declare-fun tp!2773 () Bool)

(assert (=> b!15866 (= e!9694 tp!2773)))

(assert (= (and start!2654 res!11896) b!15865))

(assert (= start!2654 b!15866))

(declare-fun m!10901 () Bool)

(assert (=> start!2654 m!10901))

(declare-fun m!10903 () Bool)

(assert (=> start!2654 m!10903))

(declare-fun m!10905 () Bool)

(assert (=> b!15865 m!10905))

(check-sat (not b_next!549) (not b!15866) (not start!2654) b_and!1043 (not b!15865))
(check-sat b_and!1043 (not b_next!549))
(get-model)

(declare-fun d!2869 () Bool)

(declare-fun lt!3933 () Int)

(assert (=> d!2869 (>= lt!3933 0)))

(declare-fun e!9710 () Int)

(assert (=> d!2869 (= lt!3933 e!9710)))

(declare-fun c!1502 () Bool)

(get-info :version)

(assert (=> d!2869 (= c!1502 ((_ is Nil!515) (toList!264 lm!221)))))

(assert (=> d!2869 (= (size!509 (toList!264 lm!221)) lt!3933)))

(declare-fun b!15889 () Bool)

(assert (=> b!15889 (= e!9710 0)))

(declare-fun b!15890 () Bool)

(assert (=> b!15890 (= e!9710 (+ 1 (size!509 (t!3004 (toList!264 lm!221)))))))

(assert (= (and d!2869 c!1502) b!15889))

(assert (= (and d!2869 (not c!1502)) b!15890))

(declare-fun m!10917 () Bool)

(assert (=> b!15890 m!10917))

(assert (=> b!15865 d!2869))

(declare-fun d!2875 () Bool)

(declare-fun res!11916 () Bool)

(declare-fun e!9727 () Bool)

(assert (=> d!2875 (=> res!11916 e!9727)))

(assert (=> d!2875 (= res!11916 ((_ is Nil!515) (toList!264 lm!221)))))

(assert (=> d!2875 (= (forall!135 (toList!264 lm!221) p!191) e!9727)))

(declare-fun b!15907 () Bool)

(declare-fun e!9728 () Bool)

(assert (=> b!15907 (= e!9727 e!9728)))

(declare-fun res!11917 () Bool)

(assert (=> b!15907 (=> (not res!11917) (not e!9728))))

(declare-fun dynLambda!118 (Int tuple2!666) Bool)

(assert (=> b!15907 (= res!11917 (dynLambda!118 p!191 (h!1080 (toList!264 lm!221))))))

(declare-fun b!15908 () Bool)

(assert (=> b!15908 (= e!9728 (forall!135 (t!3004 (toList!264 lm!221)) p!191))))

(assert (= (and d!2875 (not res!11916)) b!15907))

(assert (= (and b!15907 res!11917) b!15908))

(declare-fun b_lambda!1143 () Bool)

(assert (=> (not b_lambda!1143) (not b!15907)))

(declare-fun t!3011 () Bool)

(declare-fun tb!481 () Bool)

(assert (=> (and start!2654 (= p!191 p!191) t!3011) tb!481))

(declare-fun result!829 () Bool)

(assert (=> tb!481 (= result!829 true)))

(assert (=> b!15907 t!3011))

(declare-fun b_and!1051 () Bool)

(assert (= b_and!1043 (and (=> t!3011 result!829) b_and!1051)))

(declare-fun m!10927 () Bool)

(assert (=> b!15907 m!10927))

(declare-fun m!10929 () Bool)

(assert (=> b!15908 m!10929))

(assert (=> start!2654 d!2875))

(declare-fun d!2881 () Bool)

(declare-fun isStrictlySorted!156 (List!518) Bool)

(assert (=> d!2881 (= (inv!865 lm!221) (isStrictlySorted!156 (toList!264 lm!221)))))

(declare-fun bs!731 () Bool)

(assert (= bs!731 d!2881))

(declare-fun m!10935 () Bool)

(assert (=> bs!731 m!10935))

(assert (=> start!2654 d!2881))

(declare-fun b!15923 () Bool)

(declare-fun e!9737 () Bool)

(declare-fun tp_is_empty!815 () Bool)

(declare-fun tp!2789 () Bool)

(assert (=> b!15923 (= e!9737 (and tp_is_empty!815 tp!2789))))

(assert (=> b!15866 (= tp!2773 e!9737)))

(assert (= (and b!15866 ((_ is Cons!514) (toList!264 lm!221))) b!15923))

(declare-fun b_lambda!1149 () Bool)

(assert (= b_lambda!1143 (or (and start!2654 b_free!549) b_lambda!1149)))

(check-sat (not b_next!549) (not b_lambda!1149) b_and!1051 (not d!2881) (not b!15890) (not b!15923) (not b!15908) tp_is_empty!815)
(check-sat b_and!1051 (not b_next!549))
