; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88656 () Bool)

(assert start!88656)

(declare-fun res!682958 () Bool)

(declare-fun e!573304 () Bool)

(assert (=> start!88656 (=> (not res!682958) (not e!573304))))

(declare-datatypes ((B!1586 0))(
  ( (B!1587 (val!11877 Int)) )
))
(declare-datatypes ((tuple2!15304 0))(
  ( (tuple2!15305 (_1!7663 (_ BitVec 64)) (_2!7663 B!1586)) )
))
(declare-datatypes ((List!21554 0))(
  ( (Nil!21551) (Cons!21550 (h!22757 tuple2!15304) (t!30547 List!21554)) )
))
(declare-fun l!1036 () List!21554)

(declare-fun isStrictlySorted!624 (List!21554) Bool)

(assert (=> start!88656 (= res!682958 (isStrictlySorted!624 l!1036))))

(assert (=> start!88656 e!573304))

(declare-fun e!573303 () Bool)

(assert (=> start!88656 e!573303))

(assert (=> start!88656 true))

(declare-fun b!1018822 () Bool)

(declare-fun res!682959 () Bool)

(assert (=> b!1018822 (=> (not res!682959) (not e!573304))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!616 0))(
  ( (Some!615 (v!14466 B!1586)) (None!614) )
))
(declare-fun isDefined!415 (Option!616) Bool)

(declare-fun getValueByKey!565 (List!21554 (_ BitVec 64)) Option!616)

(assert (=> b!1018822 (= res!682959 (isDefined!415 (getValueByKey!565 l!1036 key!271)))))

(declare-fun b!1018823 () Bool)

(declare-fun ListPrimitiveSize!127 (List!21554) Int)

(assert (=> b!1018823 (= e!573304 (< (ListPrimitiveSize!127 l!1036) 0))))

(declare-fun b!1018824 () Bool)

(declare-fun tp_is_empty!23653 () Bool)

(declare-fun tp!70901 () Bool)

(assert (=> b!1018824 (= e!573303 (and tp_is_empty!23653 tp!70901))))

(assert (= (and start!88656 res!682958) b!1018822))

(assert (= (and b!1018822 res!682959) b!1018823))

(get-info :version)

(assert (= (and start!88656 ((_ is Cons!21550) l!1036)) b!1018824))

(declare-fun m!940503 () Bool)

(assert (=> start!88656 m!940503))

(declare-fun m!940505 () Bool)

(assert (=> b!1018822 m!940505))

(assert (=> b!1018822 m!940505))

(declare-fun m!940507 () Bool)

(assert (=> b!1018822 m!940507))

(declare-fun m!940509 () Bool)

(assert (=> b!1018823 m!940509))

(check-sat (not b!1018823) (not b!1018822) tp_is_empty!23653 (not start!88656) (not b!1018824))
(check-sat)
(get-model)

(declare-fun d!122093 () Bool)

(declare-fun res!682980 () Bool)

(declare-fun e!573327 () Bool)

(assert (=> d!122093 (=> res!682980 e!573327)))

(assert (=> d!122093 (= res!682980 (or ((_ is Nil!21551) l!1036) ((_ is Nil!21551) (t!30547 l!1036))))))

(assert (=> d!122093 (= (isStrictlySorted!624 l!1036) e!573327)))

(declare-fun b!1018855 () Bool)

(declare-fun e!573328 () Bool)

(assert (=> b!1018855 (= e!573327 e!573328)))

(declare-fun res!682981 () Bool)

(assert (=> b!1018855 (=> (not res!682981) (not e!573328))))

(assert (=> b!1018855 (= res!682981 (bvslt (_1!7663 (h!22757 l!1036)) (_1!7663 (h!22757 (t!30547 l!1036)))))))

(declare-fun b!1018856 () Bool)

(assert (=> b!1018856 (= e!573328 (isStrictlySorted!624 (t!30547 l!1036)))))

(assert (= (and d!122093 (not res!682980)) b!1018855))

(assert (= (and b!1018855 res!682981) b!1018856))

(declare-fun m!940529 () Bool)

(assert (=> b!1018856 m!940529))

(assert (=> start!88656 d!122093))

(declare-fun d!122101 () Bool)

(declare-fun lt!449977 () Int)

(assert (=> d!122101 (>= lt!449977 0)))

(declare-fun e!573339 () Int)

(assert (=> d!122101 (= lt!449977 e!573339)))

(declare-fun c!103432 () Bool)

(assert (=> d!122101 (= c!103432 ((_ is Nil!21551) l!1036))))

(assert (=> d!122101 (= (ListPrimitiveSize!127 l!1036) lt!449977)))

(declare-fun b!1018875 () Bool)

(assert (=> b!1018875 (= e!573339 0)))

(declare-fun b!1018876 () Bool)

(assert (=> b!1018876 (= e!573339 (+ 1 (ListPrimitiveSize!127 (t!30547 l!1036))))))

(assert (= (and d!122101 c!103432) b!1018875))

(assert (= (and d!122101 (not c!103432)) b!1018876))

(declare-fun m!940535 () Bool)

(assert (=> b!1018876 m!940535))

(assert (=> b!1018823 d!122101))

(declare-fun d!122107 () Bool)

(declare-fun isEmpty!912 (Option!616) Bool)

(assert (=> d!122107 (= (isDefined!415 (getValueByKey!565 l!1036 key!271)) (not (isEmpty!912 (getValueByKey!565 l!1036 key!271))))))

(declare-fun bs!29632 () Bool)

(assert (= bs!29632 d!122107))

(assert (=> bs!29632 m!940505))

(declare-fun m!940539 () Bool)

(assert (=> bs!29632 m!940539))

(assert (=> b!1018822 d!122107))

(declare-fun b!1018907 () Bool)

(declare-fun e!573358 () Option!616)

(assert (=> b!1018907 (= e!573358 (getValueByKey!565 (t!30547 l!1036) key!271))))

(declare-fun b!1018905 () Bool)

(declare-fun e!573357 () Option!616)

(assert (=> b!1018905 (= e!573357 (Some!615 (_2!7663 (h!22757 l!1036))))))

(declare-fun b!1018906 () Bool)

(assert (=> b!1018906 (= e!573357 e!573358)))

(declare-fun c!103445 () Bool)

(assert (=> b!1018906 (= c!103445 (and ((_ is Cons!21550) l!1036) (not (= (_1!7663 (h!22757 l!1036)) key!271))))))

(declare-fun b!1018908 () Bool)

(assert (=> b!1018908 (= e!573358 None!614)))

(declare-fun d!122111 () Bool)

(declare-fun c!103444 () Bool)

(assert (=> d!122111 (= c!103444 (and ((_ is Cons!21550) l!1036) (= (_1!7663 (h!22757 l!1036)) key!271)))))

(assert (=> d!122111 (= (getValueByKey!565 l!1036 key!271) e!573357)))

(assert (= (and d!122111 c!103444) b!1018905))

(assert (= (and d!122111 (not c!103444)) b!1018906))

(assert (= (and b!1018906 c!103445) b!1018907))

(assert (= (and b!1018906 (not c!103445)) b!1018908))

(declare-fun m!940545 () Bool)

(assert (=> b!1018907 m!940545))

(assert (=> b!1018822 d!122111))

(declare-fun b!1018927 () Bool)

(declare-fun e!573368 () Bool)

(declare-fun tp!70914 () Bool)

(assert (=> b!1018927 (= e!573368 (and tp_is_empty!23653 tp!70914))))

(assert (=> b!1018824 (= tp!70901 e!573368)))

(assert (= (and b!1018824 ((_ is Cons!21550) (t!30547 l!1036))) b!1018927))

(check-sat (not d!122107) (not b!1018856) (not b!1018927) tp_is_empty!23653 (not b!1018907) (not b!1018876))
(check-sat)
