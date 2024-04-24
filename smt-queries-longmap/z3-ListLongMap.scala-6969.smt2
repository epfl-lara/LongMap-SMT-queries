; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88288 () Bool)

(assert start!88288)

(declare-fun b!1017486 () Bool)

(assert (=> b!1017486 true))

(assert (=> b!1017486 true))

(declare-fun res!682120 () Bool)

(declare-fun e!572496 () Bool)

(assert (=> b!1017486 (=> (not res!682120) (not e!572496))))

(declare-datatypes ((List!21500 0))(
  ( (Nil!21497) (Cons!21496 (h!22703 (_ BitVec 64)) (t!30493 List!21500)) )
))
(declare-fun keys!40 () List!21500)

(declare-fun lambda!1001 () Int)

(declare-fun forall!276 (List!21500 Int) Bool)

(assert (=> b!1017486 (= res!682120 (forall!276 keys!40 lambda!1001))))

(declare-fun b!1017487 () Bool)

(declare-fun res!682118 () Bool)

(assert (=> b!1017487 (=> (not res!682118) (not e!572496))))

(declare-datatypes ((B!1520 0))(
  ( (B!1521 (val!11844 Int)) )
))
(declare-datatypes ((tuple2!15238 0))(
  ( (tuple2!15239 (_1!7630 (_ BitVec 64)) (_2!7630 B!1520)) )
))
(declare-fun newHead!31 () tuple2!15238)

(declare-datatypes ((List!21501 0))(
  ( (Nil!21498) (Cons!21497 (h!22704 tuple2!15238) (t!30494 List!21501)) )
))
(declare-fun l!1114 () List!21501)

(declare-fun head!957 (List!21501) tuple2!15238)

(assert (=> b!1017487 (= res!682118 (bvslt (_1!7630 newHead!31) (_1!7630 (head!957 l!1114))))))

(declare-fun res!682119 () Bool)

(assert (=> start!88288 (=> (not res!682119) (not e!572496))))

(declare-fun isStrictlySorted!600 (List!21501) Bool)

(assert (=> start!88288 (= res!682119 (isStrictlySorted!600 l!1114))))

(assert (=> start!88288 e!572496))

(declare-fun e!572495 () Bool)

(assert (=> start!88288 e!572495))

(assert (=> start!88288 true))

(declare-fun tp_is_empty!23587 () Bool)

(assert (=> start!88288 tp_is_empty!23587))

(declare-fun b!1017488 () Bool)

(declare-fun ListPrimitiveSize!121 (List!21500) Int)

(assert (=> b!1017488 (= e!572496 (< (ListPrimitiveSize!121 keys!40) 0))))

(declare-fun b!1017489 () Bool)

(declare-fun tp!70737 () Bool)

(assert (=> b!1017489 (= e!572495 (and tp_is_empty!23587 tp!70737))))

(declare-fun b!1017490 () Bool)

(declare-fun res!682121 () Bool)

(assert (=> b!1017490 (=> (not res!682121) (not e!572496))))

(declare-fun isEmpty!878 (List!21501) Bool)

(assert (=> b!1017490 (= res!682121 (not (isEmpty!878 l!1114)))))

(assert (= (and start!88288 res!682119) b!1017490))

(assert (= (and b!1017490 res!682121) b!1017486))

(assert (= (and b!1017486 res!682120) b!1017487))

(assert (= (and b!1017487 res!682118) b!1017488))

(get-info :version)

(assert (= (and start!88288 ((_ is Cons!21497) l!1114)) b!1017489))

(declare-fun m!939635 () Bool)

(assert (=> b!1017486 m!939635))

(declare-fun m!939637 () Bool)

(assert (=> start!88288 m!939637))

(declare-fun m!939639 () Bool)

(assert (=> b!1017488 m!939639))

(declare-fun m!939641 () Bool)

(assert (=> b!1017487 m!939641))

(declare-fun m!939643 () Bool)

(assert (=> b!1017490 m!939643))

(check-sat (not b!1017487) (not start!88288) (not b!1017486) (not b!1017488) (not b!1017489) tp_is_empty!23587 (not b!1017490))
(check-sat)
(get-model)

(declare-fun d!121627 () Bool)

(declare-fun lt!449765 () Int)

(assert (=> d!121627 (>= lt!449765 0)))

(declare-fun e!572511 () Int)

(assert (=> d!121627 (= lt!449765 e!572511)))

(declare-fun c!103327 () Bool)

(assert (=> d!121627 (= c!103327 ((_ is Nil!21497) keys!40))))

(assert (=> d!121627 (= (ListPrimitiveSize!121 keys!40) lt!449765)))

(declare-fun b!1017537 () Bool)

(assert (=> b!1017537 (= e!572511 0)))

(declare-fun b!1017538 () Bool)

(assert (=> b!1017538 (= e!572511 (+ 1 (ListPrimitiveSize!121 (t!30493 keys!40))))))

(assert (= (and d!121627 c!103327) b!1017537))

(assert (= (and d!121627 (not c!103327)) b!1017538))

(declare-fun m!939665 () Bool)

(assert (=> b!1017538 m!939665))

(assert (=> b!1017488 d!121627))

(declare-fun d!121629 () Bool)

(assert (=> d!121629 (= (head!957 l!1114) (h!22704 l!1114))))

(assert (=> b!1017487 d!121629))

(declare-fun d!121631 () Bool)

(declare-fun res!682150 () Bool)

(declare-fun e!572516 () Bool)

(assert (=> d!121631 (=> res!682150 e!572516)))

(assert (=> d!121631 (= res!682150 ((_ is Nil!21497) keys!40))))

(assert (=> d!121631 (= (forall!276 keys!40 lambda!1001) e!572516)))

(declare-fun b!1017543 () Bool)

(declare-fun e!572517 () Bool)

(assert (=> b!1017543 (= e!572516 e!572517)))

(declare-fun res!682151 () Bool)

(assert (=> b!1017543 (=> (not res!682151) (not e!572517))))

(declare-fun dynLambda!1934 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017543 (= res!682151 (dynLambda!1934 lambda!1001 (h!22703 keys!40)))))

(declare-fun b!1017544 () Bool)

(assert (=> b!1017544 (= e!572517 (forall!276 (t!30493 keys!40) lambda!1001))))

(assert (= (and d!121631 (not res!682150)) b!1017543))

(assert (= (and b!1017543 res!682151) b!1017544))

(declare-fun b_lambda!15501 () Bool)

(assert (=> (not b_lambda!15501) (not b!1017543)))

(declare-fun m!939667 () Bool)

(assert (=> b!1017543 m!939667))

(declare-fun m!939669 () Bool)

(assert (=> b!1017544 m!939669))

(assert (=> b!1017486 d!121631))

(declare-fun d!121635 () Bool)

(assert (=> d!121635 (= (isEmpty!878 l!1114) ((_ is Nil!21498) l!1114))))

(assert (=> b!1017490 d!121635))

(declare-fun d!121639 () Bool)

(declare-fun res!682162 () Bool)

(declare-fun e!572528 () Bool)

(assert (=> d!121639 (=> res!682162 e!572528)))

(assert (=> d!121639 (= res!682162 (or ((_ is Nil!21498) l!1114) ((_ is Nil!21498) (t!30494 l!1114))))))

(assert (=> d!121639 (= (isStrictlySorted!600 l!1114) e!572528)))

(declare-fun b!1017555 () Bool)

(declare-fun e!572529 () Bool)

(assert (=> b!1017555 (= e!572528 e!572529)))

(declare-fun res!682163 () Bool)

(assert (=> b!1017555 (=> (not res!682163) (not e!572529))))

(assert (=> b!1017555 (= res!682163 (bvslt (_1!7630 (h!22704 l!1114)) (_1!7630 (h!22704 (t!30494 l!1114)))))))

(declare-fun b!1017556 () Bool)

(assert (=> b!1017556 (= e!572529 (isStrictlySorted!600 (t!30494 l!1114)))))

(assert (= (and d!121639 (not res!682162)) b!1017555))

(assert (= (and b!1017555 res!682163) b!1017556))

(declare-fun m!939675 () Bool)

(assert (=> b!1017556 m!939675))

(assert (=> start!88288 d!121639))

(declare-fun b!1017565 () Bool)

(declare-fun e!572536 () Bool)

(declare-fun tp!70746 () Bool)

(assert (=> b!1017565 (= e!572536 (and tp_is_empty!23587 tp!70746))))

(assert (=> b!1017489 (= tp!70737 e!572536)))

(assert (= (and b!1017489 ((_ is Cons!21497) (t!30494 l!1114))) b!1017565))

(declare-fun b_lambda!15505 () Bool)

(assert (= b_lambda!15501 (or b!1017486 b_lambda!15505)))

(declare-fun bs!29525 () Bool)

(declare-fun d!121647 () Bool)

(assert (= bs!29525 (and d!121647 b!1017486)))

(declare-fun value!178 () B!1520)

(declare-datatypes ((Option!595 0))(
  ( (Some!594 (v!14445 B!1520)) (None!593) )
))
(declare-fun getValueByKey!544 (List!21501 (_ BitVec 64)) Option!595)

(assert (=> bs!29525 (= (dynLambda!1934 lambda!1001 (h!22703 keys!40)) (= (getValueByKey!544 l!1114 (h!22703 keys!40)) (Some!594 value!178)))))

(declare-fun m!939679 () Bool)

(assert (=> bs!29525 m!939679))

(assert (=> b!1017543 d!121647))

(check-sat (not b_lambda!15505) (not b!1017565) (not b!1017544) (not b!1017538) (not b!1017556) tp_is_empty!23587 (not bs!29525))
(check-sat)
