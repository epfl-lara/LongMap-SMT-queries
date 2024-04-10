; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138304 () Bool)

(assert start!138304)

(declare-fun b!1585834 () Bool)

(declare-fun e!885460 () Bool)

(declare-datatypes ((B!2998 0))(
  ( (B!2999 (val!19861 Int)) )
))
(declare-datatypes ((tuple2!25890 0))(
  ( (tuple2!25891 (_1!12956 (_ BitVec 64)) (_2!12956 B!2998)) )
))
(declare-datatypes ((List!36981 0))(
  ( (Nil!36978) (Cons!36977 (h!38520 tuple2!25890) (t!51905 List!36981)) )
))
(declare-fun lt!677444 () List!36981)

(declare-fun lt!677445 () tuple2!25890)

(declare-fun contains!10539 (List!36981 tuple2!25890) Bool)

(assert (=> b!1585834 (= e!885460 (not (contains!10539 lt!677444 lt!677445)))))

(declare-fun b!1585835 () Bool)

(declare-fun res!1083032 () Bool)

(assert (=> b!1585835 (=> res!1083032 e!885460)))

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1016 (List!36981 (_ BitVec 64)) Bool)

(assert (=> b!1585835 (= res!1083032 (not (containsKey!1016 lt!677444 newKey!21)))))

(declare-fun b!1585836 () Bool)

(declare-fun res!1083029 () Bool)

(declare-fun e!885461 () Bool)

(assert (=> b!1585836 (=> (not res!1083029) (not e!885461))))

(declare-fun l!556 () List!36981)

(get-info :version)

(assert (=> b!1585836 (= res!1083029 (and (or (not ((_ is Cons!36977) l!556)) (bvsge (_1!12956 (h!38520 l!556)) newKey!21)) (not (= (_1!12956 (h!38520 l!556)) newKey!21)) ((_ is Cons!36977) l!556) (bvsgt (_1!12956 (h!38520 l!556)) newKey!21)))))

(declare-fun b!1585837 () Bool)

(declare-fun e!885462 () Bool)

(declare-fun tp_is_empty!39531 () Bool)

(declare-fun tp!115302 () Bool)

(assert (=> b!1585837 (= e!885462 (and tp_is_empty!39531 tp!115302))))

(declare-fun b!1585838 () Bool)

(assert (=> b!1585838 (= e!885461 e!885460)))

(declare-fun res!1083030 () Bool)

(assert (=> b!1585838 (=> res!1083030 e!885460)))

(declare-fun isStrictlySorted!1203 (List!36981) Bool)

(assert (=> b!1585838 (= res!1083030 (not (isStrictlySorted!1203 lt!677444)))))

(declare-fun $colon$colon!1047 (List!36981 tuple2!25890) List!36981)

(assert (=> b!1585838 (= lt!677444 ($colon$colon!1047 l!556 lt!677445))))

(declare-fun newValue!21 () B!2998)

(assert (=> b!1585838 (= lt!677445 (tuple2!25891 newKey!21 newValue!21))))

(declare-fun res!1083031 () Bool)

(assert (=> start!138304 (=> (not res!1083031) (not e!885461))))

(assert (=> start!138304 (= res!1083031 (isStrictlySorted!1203 l!556))))

(assert (=> start!138304 e!885461))

(assert (=> start!138304 e!885462))

(assert (=> start!138304 true))

(assert (=> start!138304 tp_is_empty!39531))

(assert (= (and start!138304 res!1083031) b!1585836))

(assert (= (and b!1585836 res!1083029) b!1585838))

(assert (= (and b!1585838 (not res!1083030)) b!1585835))

(assert (= (and b!1585835 (not res!1083032)) b!1585834))

(assert (= (and start!138304 ((_ is Cons!36977) l!556)) b!1585837))

(declare-fun m!1454509 () Bool)

(assert (=> b!1585834 m!1454509))

(declare-fun m!1454511 () Bool)

(assert (=> b!1585835 m!1454511))

(declare-fun m!1454513 () Bool)

(assert (=> b!1585838 m!1454513))

(declare-fun m!1454515 () Bool)

(assert (=> b!1585838 m!1454515))

(declare-fun m!1454517 () Bool)

(assert (=> start!138304 m!1454517))

(check-sat (not b!1585834) (not b!1585835) (not b!1585837) (not start!138304) tp_is_empty!39531 (not b!1585838))
(check-sat)
(get-model)

(declare-fun d!167801 () Bool)

(declare-fun res!1083049 () Bool)

(declare-fun e!885476 () Bool)

(assert (=> d!167801 (=> res!1083049 e!885476)))

(assert (=> d!167801 (= res!1083049 (or ((_ is Nil!36978) lt!677444) ((_ is Nil!36978) (t!51905 lt!677444))))))

(assert (=> d!167801 (= (isStrictlySorted!1203 lt!677444) e!885476)))

(declare-fun b!1585858 () Bool)

(declare-fun e!885477 () Bool)

(assert (=> b!1585858 (= e!885476 e!885477)))

(declare-fun res!1083050 () Bool)

(assert (=> b!1585858 (=> (not res!1083050) (not e!885477))))

(assert (=> b!1585858 (= res!1083050 (bvslt (_1!12956 (h!38520 lt!677444)) (_1!12956 (h!38520 (t!51905 lt!677444)))))))

(declare-fun b!1585859 () Bool)

(assert (=> b!1585859 (= e!885477 (isStrictlySorted!1203 (t!51905 lt!677444)))))

(assert (= (and d!167801 (not res!1083049)) b!1585858))

(assert (= (and b!1585858 res!1083050) b!1585859))

(declare-fun m!1454529 () Bool)

(assert (=> b!1585859 m!1454529))

(assert (=> b!1585838 d!167801))

(declare-fun d!167803 () Bool)

(assert (=> d!167803 (= ($colon$colon!1047 l!556 lt!677445) (Cons!36977 lt!677445 l!556))))

(assert (=> b!1585838 d!167803))

(declare-fun d!167805 () Bool)

(declare-fun res!1083051 () Bool)

(declare-fun e!885478 () Bool)

(assert (=> d!167805 (=> res!1083051 e!885478)))

(assert (=> d!167805 (= res!1083051 (or ((_ is Nil!36978) l!556) ((_ is Nil!36978) (t!51905 l!556))))))

(assert (=> d!167805 (= (isStrictlySorted!1203 l!556) e!885478)))

(declare-fun b!1585860 () Bool)

(declare-fun e!885479 () Bool)

(assert (=> b!1585860 (= e!885478 e!885479)))

(declare-fun res!1083052 () Bool)

(assert (=> b!1585860 (=> (not res!1083052) (not e!885479))))

(assert (=> b!1585860 (= res!1083052 (bvslt (_1!12956 (h!38520 l!556)) (_1!12956 (h!38520 (t!51905 l!556)))))))

(declare-fun b!1585861 () Bool)

(assert (=> b!1585861 (= e!885479 (isStrictlySorted!1203 (t!51905 l!556)))))

(assert (= (and d!167805 (not res!1083051)) b!1585860))

(assert (= (and b!1585860 res!1083052) b!1585861))

(declare-fun m!1454531 () Bool)

(assert (=> b!1585861 m!1454531))

(assert (=> start!138304 d!167805))

(declare-fun d!167807 () Bool)

(declare-fun lt!677454 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!870 (List!36981) (InoxSet tuple2!25890))

(assert (=> d!167807 (= lt!677454 (select (content!870 lt!677444) lt!677445))))

(declare-fun e!885484 () Bool)

(assert (=> d!167807 (= lt!677454 e!885484)))

(declare-fun res!1083058 () Bool)

(assert (=> d!167807 (=> (not res!1083058) (not e!885484))))

(assert (=> d!167807 (= res!1083058 ((_ is Cons!36977) lt!677444))))

(assert (=> d!167807 (= (contains!10539 lt!677444 lt!677445) lt!677454)))

(declare-fun b!1585866 () Bool)

(declare-fun e!885485 () Bool)

(assert (=> b!1585866 (= e!885484 e!885485)))

(declare-fun res!1083057 () Bool)

(assert (=> b!1585866 (=> res!1083057 e!885485)))

(assert (=> b!1585866 (= res!1083057 (= (h!38520 lt!677444) lt!677445))))

(declare-fun b!1585867 () Bool)

(assert (=> b!1585867 (= e!885485 (contains!10539 (t!51905 lt!677444) lt!677445))))

(assert (= (and d!167807 res!1083058) b!1585866))

(assert (= (and b!1585866 (not res!1083057)) b!1585867))

(declare-fun m!1454533 () Bool)

(assert (=> d!167807 m!1454533))

(declare-fun m!1454535 () Bool)

(assert (=> d!167807 m!1454535))

(declare-fun m!1454537 () Bool)

(assert (=> b!1585867 m!1454537))

(assert (=> b!1585834 d!167807))

(declare-fun d!167811 () Bool)

(declare-fun res!1083075 () Bool)

(declare-fun e!885502 () Bool)

(assert (=> d!167811 (=> res!1083075 e!885502)))

(assert (=> d!167811 (= res!1083075 (and ((_ is Cons!36977) lt!677444) (= (_1!12956 (h!38520 lt!677444)) newKey!21)))))

(assert (=> d!167811 (= (containsKey!1016 lt!677444 newKey!21) e!885502)))

(declare-fun b!1585884 () Bool)

(declare-fun e!885503 () Bool)

(assert (=> b!1585884 (= e!885502 e!885503)))

(declare-fun res!1083076 () Bool)

(assert (=> b!1585884 (=> (not res!1083076) (not e!885503))))

(assert (=> b!1585884 (= res!1083076 (and (or (not ((_ is Cons!36977) lt!677444)) (bvsle (_1!12956 (h!38520 lt!677444)) newKey!21)) ((_ is Cons!36977) lt!677444) (bvslt (_1!12956 (h!38520 lt!677444)) newKey!21)))))

(declare-fun b!1585885 () Bool)

(assert (=> b!1585885 (= e!885503 (containsKey!1016 (t!51905 lt!677444) newKey!21))))

(assert (= (and d!167811 (not res!1083075)) b!1585884))

(assert (= (and b!1585884 res!1083076) b!1585885))

(declare-fun m!1454543 () Bool)

(assert (=> b!1585885 m!1454543))

(assert (=> b!1585835 d!167811))

(declare-fun b!1585892 () Bool)

(declare-fun e!885508 () Bool)

(declare-fun tp!115308 () Bool)

(assert (=> b!1585892 (= e!885508 (and tp_is_empty!39531 tp!115308))))

(assert (=> b!1585837 (= tp!115302 e!885508)))

(assert (= (and b!1585837 ((_ is Cons!36977) (t!51905 l!556))) b!1585892))

(check-sat tp_is_empty!39531 (not b!1585885) (not b!1585892) (not b!1585859) (not d!167807) (not b!1585861) (not b!1585867))
