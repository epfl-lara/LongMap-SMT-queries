; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2656 () Bool)

(assert start!2656)

(declare-fun b_free!551 () Bool)

(declare-fun b_next!551 () Bool)

(assert (=> start!2656 (= b_free!551 (not b_next!551))))

(declare-fun tp!2779 () Bool)

(declare-fun b_and!1045 () Bool)

(assert (=> start!2656 (= tp!2779 b_and!1045)))

(declare-fun res!11899 () Bool)

(declare-fun e!9701 () Bool)

(assert (=> start!2656 (=> (not res!11899) (not e!9701))))

(declare-datatypes ((B!672 0))(
  ( (B!673 (val!434 Int)) )
))
(declare-datatypes ((tuple2!668 0))(
  ( (tuple2!669 (_1!334 (_ BitVec 64)) (_2!334 B!672)) )
))
(declare-datatypes ((List!519 0))(
  ( (Nil!516) (Cons!515 (h!1081 tuple2!668) (t!3005 List!519)) )
))
(declare-datatypes ((ListLongMap!499 0))(
  ( (ListLongMap!500 (toList!265 List!519)) )
))
(declare-fun lm!221 () ListLongMap!499)

(declare-fun p!191 () Int)

(declare-fun forall!136 (List!519 Int) Bool)

(assert (=> start!2656 (= res!11899 (forall!136 (toList!265 lm!221) p!191))))

(assert (=> start!2656 e!9701))

(declare-fun e!9700 () Bool)

(declare-fun inv!866 (ListLongMap!499) Bool)

(assert (=> start!2656 (and (inv!866 lm!221) e!9700)))

(assert (=> start!2656 tp!2779))

(declare-fun b!15871 () Bool)

(declare-fun size!510 (List!519) Int)

(assert (=> b!15871 (= e!9701 (< (size!510 (toList!265 lm!221)) 0))))

(declare-fun b!15872 () Bool)

(declare-fun tp!2780 () Bool)

(assert (=> b!15872 (= e!9700 tp!2780)))

(assert (= (and start!2656 res!11899) b!15871))

(assert (= start!2656 b!15872))

(declare-fun m!10907 () Bool)

(assert (=> start!2656 m!10907))

(declare-fun m!10909 () Bool)

(assert (=> start!2656 m!10909))

(declare-fun m!10911 () Bool)

(assert (=> b!15871 m!10911))

(push 1)

(assert (not b_next!551))

(assert (not b!15871))

(assert (not b!15872))

(assert b_and!1045)

(assert (not start!2656))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1045)

(assert (not b_next!551))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2865 () Bool)

(declare-fun lt!3931 () Int)

(assert (=> d!2865 (>= lt!3931 0)))

(declare-fun e!9708 () Int)

(assert (=> d!2865 (= lt!3931 e!9708)))

(declare-fun c!1500 () Bool)

(assert (=> d!2865 (= c!1500 (is-Nil!516 (toList!265 lm!221)))))

(assert (=> d!2865 (= (size!510 (toList!265 lm!221)) lt!3931)))

(declare-fun b!15885 () Bool)

(assert (=> b!15885 (= e!9708 0)))

(declare-fun b!15886 () Bool)

(assert (=> b!15886 (= e!9708 (+ 1 (size!510 (t!3005 (toList!265 lm!221)))))))

(assert (= (and d!2865 c!1500) b!15885))

(assert (= (and d!2865 (not c!1500)) b!15886))

(declare-fun m!10915 () Bool)

(assert (=> b!15886 m!10915))

(assert (=> b!15871 d!2865))

(declare-fun d!2873 () Bool)

(declare-fun res!11914 () Bool)

(declare-fun e!9725 () Bool)

(assert (=> d!2873 (=> res!11914 e!9725)))

(assert (=> d!2873 (= res!11914 (is-Nil!516 (toList!265 lm!221)))))

(assert (=> d!2873 (= (forall!136 (toList!265 lm!221) p!191) e!9725)))

(declare-fun b!15905 () Bool)

(declare-fun e!9726 () Bool)

(assert (=> b!15905 (= e!9725 e!9726)))

(declare-fun res!11915 () Bool)

(assert (=> b!15905 (=> (not res!11915) (not e!9726))))

(declare-fun dynLambda!119 (Int tuple2!668) Bool)

(assert (=> b!15905 (= res!11915 (dynLambda!119 p!191 (h!1081 (toList!265 lm!221))))))

(declare-fun b!15906 () Bool)

(assert (=> b!15906 (= e!9726 (forall!136 (t!3005 (toList!265 lm!221)) p!191))))

(assert (= (and d!2873 (not res!11914)) b!15905))

(assert (= (and b!15905 res!11915) b!15906))

(declare-fun b_lambda!1141 () Bool)

(assert (=> (not b_lambda!1141) (not b!15905)))

(declare-fun t!3009 () Bool)

(declare-fun tb!479 () Bool)

(assert (=> (and start!2656 (= p!191 p!191) t!3009) tb!479))

(declare-fun result!827 () Bool)

(assert (=> tb!479 (= result!827 true)))

(assert (=> b!15905 t!3009))

(declare-fun b_and!1049 () Bool)

(assert (= b_and!1045 (and (=> t!3009 result!827) b_and!1049)))

(declare-fun m!10921 () Bool)

(assert (=> b!15905 m!10921))

(declare-fun m!10925 () Bool)

(assert (=> b!15906 m!10925))

(assert (=> start!2656 d!2873))

(declare-fun d!2879 () Bool)

(declare-fun isStrictlySorted!157 (List!519) Bool)

(assert (=> d!2879 (= (inv!866 lm!221) (isStrictlySorted!157 (toList!265 lm!221)))))

(declare-fun bs!730 () Bool)

(assert (= bs!730 d!2879))

(declare-fun m!10933 () Bool)

(assert (=> bs!730 m!10933))

(assert (=> start!2656 d!2879))

(declare-fun b!15918 () Bool)

(declare-fun e!9734 () Bool)

(declare-fun tp_is_empty!812 () Bool)

(declare-fun tp!2786 () Bool)

(assert (=> b!15918 (= e!9734 (and tp_is_empty!812 tp!2786))))

(assert (=> b!15872 (= tp!2780 e!9734)))

(assert (= (and b!15872 (is-Cons!515 (toList!265 lm!221))) b!15918))

(declare-fun b_lambda!1147 () Bool)

(assert (= b_lambda!1141 (or (and start!2656 b_free!551) b_lambda!1147)))

(push 1)

