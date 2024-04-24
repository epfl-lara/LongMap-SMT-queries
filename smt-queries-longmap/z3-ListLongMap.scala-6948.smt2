; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87730 () Bool)

(assert start!87730)

(declare-fun res!680837 () Bool)

(declare-fun e!570822 () Bool)

(assert (=> start!87730 (=> (not res!680837) (not e!570822))))

(declare-datatypes ((B!1394 0))(
  ( (B!1395 (val!11781 Int)) )
))
(declare-datatypes ((tuple2!15112 0))(
  ( (tuple2!15113 (_1!7567 (_ BitVec 64)) (_2!7567 B!1394)) )
))
(declare-datatypes ((List!21389 0))(
  ( (Nil!21386) (Cons!21385 (h!22592 tuple2!15112) (t!30382 List!21389)) )
))
(declare-fun l!412 () List!21389)

(declare-fun isStrictlySorted!543 (List!21389) Bool)

(assert (=> start!87730 (= res!680837 (isStrictlySorted!543 l!412))))

(assert (=> start!87730 e!570822))

(declare-fun e!570821 () Bool)

(assert (=> start!87730 e!570821))

(declare-fun tp_is_empty!23461 () Bool)

(assert (=> start!87730 tp_is_empty!23461))

(declare-fun b!1014539 () Bool)

(declare-fun res!680836 () Bool)

(assert (=> b!1014539 (=> (not res!680836) (not e!570822))))

(declare-fun value!115 () B!1394)

(get-info :version)

(assert (=> b!1014539 (= res!680836 (and ((_ is Cons!21385) l!412) (= (_2!7567 (h!22592 l!412)) value!115)))))

(declare-fun b!1014540 () Bool)

(declare-fun ListPrimitiveSize!100 (List!21389) Int)

(assert (=> b!1014540 (= e!570822 (>= (ListPrimitiveSize!100 (t!30382 l!412)) (ListPrimitiveSize!100 l!412)))))

(declare-fun b!1014541 () Bool)

(declare-fun tp!70410 () Bool)

(assert (=> b!1014541 (= e!570821 (and tp_is_empty!23461 tp!70410))))

(assert (= (and start!87730 res!680837) b!1014539))

(assert (= (and b!1014539 res!680836) b!1014540))

(assert (= (and start!87730 ((_ is Cons!21385) l!412)) b!1014541))

(declare-fun m!938003 () Bool)

(assert (=> start!87730 m!938003))

(declare-fun m!938005 () Bool)

(assert (=> b!1014540 m!938005))

(declare-fun m!938007 () Bool)

(assert (=> b!1014540 m!938007))

(check-sat (not start!87730) (not b!1014540) (not b!1014541) tp_is_empty!23461)
(check-sat)
(get-model)

(declare-fun d!120883 () Bool)

(declare-fun res!680854 () Bool)

(declare-fun e!570839 () Bool)

(assert (=> d!120883 (=> res!680854 e!570839)))

(assert (=> d!120883 (= res!680854 (or ((_ is Nil!21386) l!412) ((_ is Nil!21386) (t!30382 l!412))))))

(assert (=> d!120883 (= (isStrictlySorted!543 l!412) e!570839)))

(declare-fun b!1014564 () Bool)

(declare-fun e!570840 () Bool)

(assert (=> b!1014564 (= e!570839 e!570840)))

(declare-fun res!680855 () Bool)

(assert (=> b!1014564 (=> (not res!680855) (not e!570840))))

(assert (=> b!1014564 (= res!680855 (bvslt (_1!7567 (h!22592 l!412)) (_1!7567 (h!22592 (t!30382 l!412)))))))

(declare-fun b!1014565 () Bool)

(assert (=> b!1014565 (= e!570840 (isStrictlySorted!543 (t!30382 l!412)))))

(assert (= (and d!120883 (not res!680854)) b!1014564))

(assert (= (and b!1014564 res!680855) b!1014565))

(declare-fun m!938021 () Bool)

(assert (=> b!1014565 m!938021))

(assert (=> start!87730 d!120883))

(declare-fun d!120889 () Bool)

(declare-fun lt!448400 () Int)

(assert (=> d!120889 (>= lt!448400 0)))

(declare-fun e!570855 () Int)

(assert (=> d!120889 (= lt!448400 e!570855)))

(declare-fun c!102829 () Bool)

(assert (=> d!120889 (= c!102829 ((_ is Nil!21386) (t!30382 l!412)))))

(assert (=> d!120889 (= (ListPrimitiveSize!100 (t!30382 l!412)) lt!448400)))

(declare-fun b!1014582 () Bool)

(assert (=> b!1014582 (= e!570855 0)))

(declare-fun b!1014583 () Bool)

(assert (=> b!1014583 (= e!570855 (+ 1 (ListPrimitiveSize!100 (t!30382 (t!30382 l!412)))))))

(assert (= (and d!120889 c!102829) b!1014582))

(assert (= (and d!120889 (not c!102829)) b!1014583))

(declare-fun m!938027 () Bool)

(assert (=> b!1014583 m!938027))

(assert (=> b!1014540 d!120889))

(declare-fun d!120895 () Bool)

(declare-fun lt!448401 () Int)

(assert (=> d!120895 (>= lt!448401 0)))

(declare-fun e!570856 () Int)

(assert (=> d!120895 (= lt!448401 e!570856)))

(declare-fun c!102830 () Bool)

(assert (=> d!120895 (= c!102830 ((_ is Nil!21386) l!412))))

(assert (=> d!120895 (= (ListPrimitiveSize!100 l!412) lt!448401)))

(declare-fun b!1014584 () Bool)

(assert (=> b!1014584 (= e!570856 0)))

(declare-fun b!1014585 () Bool)

(assert (=> b!1014585 (= e!570856 (+ 1 (ListPrimitiveSize!100 (t!30382 l!412))))))

(assert (= (and d!120895 c!102830) b!1014584))

(assert (= (and d!120895 (not c!102830)) b!1014585))

(assert (=> b!1014585 m!938005))

(assert (=> b!1014540 d!120895))

(declare-fun b!1014590 () Bool)

(declare-fun e!570859 () Bool)

(declare-fun tp!70419 () Bool)

(assert (=> b!1014590 (= e!570859 (and tp_is_empty!23461 tp!70419))))

(assert (=> b!1014541 (= tp!70410 e!570859)))

(assert (= (and b!1014541 ((_ is Cons!21385) (t!30382 l!412))) b!1014590))

(check-sat (not b!1014590) (not b!1014565) (not b!1014585) (not b!1014583) tp_is_empty!23461)
(check-sat)
