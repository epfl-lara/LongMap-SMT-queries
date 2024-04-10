; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87278 () Bool)

(assert start!87278)

(declare-fun res!679733 () Bool)

(declare-fun e!569182 () Bool)

(assert (=> start!87278 (=> (not res!679733) (not e!569182))))

(declare-datatypes ((B!1312 0))(
  ( (B!1313 (val!11740 Int)) )
))
(declare-datatypes ((tuple2!15026 0))(
  ( (tuple2!15027 (_1!7524 (_ BitVec 64)) (_2!7524 B!1312)) )
))
(declare-datatypes ((List!21332 0))(
  ( (Nil!21329) (Cons!21328 (h!22526 tuple2!15026) (t!30333 List!21332)) )
))
(declare-fun l!412 () List!21332)

(declare-fun isStrictlySorted!520 (List!21332) Bool)

(assert (=> start!87278 (= res!679733 (isStrictlySorted!520 l!412))))

(assert (=> start!87278 e!569182))

(declare-fun e!569181 () Bool)

(assert (=> start!87278 e!569181))

(declare-fun tp_is_empty!23379 () Bool)

(assert (=> start!87278 tp_is_empty!23379))

(declare-fun b!1011789 () Bool)

(declare-fun res!679734 () Bool)

(assert (=> b!1011789 (=> (not res!679734) (not e!569182))))

(declare-fun value!115 () B!1312)

(get-info :version)

(assert (=> b!1011789 (= res!679734 (and ((_ is Cons!21328) l!412) (= (_2!7524 (h!22526 l!412)) value!115)))))

(declare-fun b!1011790 () Bool)

(assert (=> b!1011790 (= e!569182 (not (isStrictlySorted!520 (t!30333 l!412))))))

(declare-fun b!1011791 () Bool)

(declare-fun tp!70214 () Bool)

(assert (=> b!1011791 (= e!569181 (and tp_is_empty!23379 tp!70214))))

(assert (= (and start!87278 res!679733) b!1011789))

(assert (= (and b!1011789 res!679734) b!1011790))

(assert (= (and start!87278 ((_ is Cons!21328) l!412)) b!1011791))

(declare-fun m!935743 () Bool)

(assert (=> start!87278 m!935743))

(declare-fun m!935745 () Bool)

(assert (=> b!1011790 m!935745))

(check-sat (not start!87278) (not b!1011790) (not b!1011791) tp_is_empty!23379)
(check-sat)
(get-model)

(declare-fun d!120195 () Bool)

(declare-fun res!679758 () Bool)

(declare-fun e!569209 () Bool)

(assert (=> d!120195 (=> res!679758 e!569209)))

(assert (=> d!120195 (= res!679758 (or ((_ is Nil!21329) l!412) ((_ is Nil!21329) (t!30333 l!412))))))

(assert (=> d!120195 (= (isStrictlySorted!520 l!412) e!569209)))

(declare-fun b!1011822 () Bool)

(declare-fun e!569211 () Bool)

(assert (=> b!1011822 (= e!569209 e!569211)))

(declare-fun res!679760 () Bool)

(assert (=> b!1011822 (=> (not res!679760) (not e!569211))))

(assert (=> b!1011822 (= res!679760 (bvslt (_1!7524 (h!22526 l!412)) (_1!7524 (h!22526 (t!30333 l!412)))))))

(declare-fun b!1011824 () Bool)

(assert (=> b!1011824 (= e!569211 (isStrictlySorted!520 (t!30333 l!412)))))

(assert (= (and d!120195 (not res!679758)) b!1011822))

(assert (= (and b!1011822 res!679760) b!1011824))

(assert (=> b!1011824 m!935745))

(assert (=> start!87278 d!120195))

(declare-fun d!120203 () Bool)

(declare-fun res!679763 () Bool)

(declare-fun e!569214 () Bool)

(assert (=> d!120203 (=> res!679763 e!569214)))

(assert (=> d!120203 (= res!679763 (or ((_ is Nil!21329) (t!30333 l!412)) ((_ is Nil!21329) (t!30333 (t!30333 l!412)))))))

(assert (=> d!120203 (= (isStrictlySorted!520 (t!30333 l!412)) e!569214)))

(declare-fun b!1011828 () Bool)

(declare-fun e!569215 () Bool)

(assert (=> b!1011828 (= e!569214 e!569215)))

(declare-fun res!679764 () Bool)

(assert (=> b!1011828 (=> (not res!679764) (not e!569215))))

(assert (=> b!1011828 (= res!679764 (bvslt (_1!7524 (h!22526 (t!30333 l!412))) (_1!7524 (h!22526 (t!30333 (t!30333 l!412))))))))

(declare-fun b!1011829 () Bool)

(assert (=> b!1011829 (= e!569215 (isStrictlySorted!520 (t!30333 (t!30333 l!412))))))

(assert (= (and d!120203 (not res!679763)) b!1011828))

(assert (= (and b!1011828 res!679764) b!1011829))

(declare-fun m!935755 () Bool)

(assert (=> b!1011829 m!935755))

(assert (=> b!1011790 d!120203))

(declare-fun b!1011838 () Bool)

(declare-fun e!569220 () Bool)

(declare-fun tp!70225 () Bool)

(assert (=> b!1011838 (= e!569220 (and tp_is_empty!23379 tp!70225))))

(assert (=> b!1011791 (= tp!70214 e!569220)))

(assert (= (and b!1011791 ((_ is Cons!21328) (t!30333 l!412))) b!1011838))

(check-sat (not b!1011824) (not b!1011829) (not b!1011838) tp_is_empty!23379)
