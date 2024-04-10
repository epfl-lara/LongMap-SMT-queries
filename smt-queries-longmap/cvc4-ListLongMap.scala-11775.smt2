; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138276 () Bool)

(assert start!138276)

(declare-fun b!1585729 () Bool)

(declare-fun res!1082945 () Bool)

(declare-fun e!885373 () Bool)

(assert (=> b!1585729 (=> res!1082945 e!885373)))

(declare-datatypes ((B!2994 0))(
  ( (B!2995 (val!19859 Int)) )
))
(declare-datatypes ((tuple2!25886 0))(
  ( (tuple2!25887 (_1!12954 (_ BitVec 64)) (_2!12954 B!2994)) )
))
(declare-datatypes ((List!36979 0))(
  ( (Nil!36976) (Cons!36975 (h!38518 tuple2!25886) (t!51900 List!36979)) )
))
(declare-fun lt!677424 () List!36979)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1014 (List!36979 (_ BitVec 64)) Bool)

(assert (=> b!1585729 (= res!1082945 (not (containsKey!1014 lt!677424 newKey!21)))))

(declare-fun b!1585730 () Bool)

(declare-fun e!885374 () Bool)

(assert (=> b!1585730 (= e!885374 e!885373)))

(declare-fun res!1082947 () Bool)

(assert (=> b!1585730 (=> res!1082947 e!885373)))

(declare-fun isStrictlySorted!1201 (List!36979) Bool)

(assert (=> b!1585730 (= res!1082947 (not (isStrictlySorted!1201 lt!677424)))))

(declare-fun l!556 () List!36979)

(declare-fun lt!677423 () tuple2!25886)

(declare-fun $colon$colon!1045 (List!36979 tuple2!25886) List!36979)

(assert (=> b!1585730 (= lt!677424 ($colon$colon!1045 (t!51900 l!556) lt!677423))))

(declare-fun newValue!21 () B!2994)

(assert (=> b!1585730 (= lt!677423 (tuple2!25887 newKey!21 newValue!21))))

(declare-fun b!1585731 () Bool)

(declare-fun e!885375 () Bool)

(declare-fun tp_is_empty!39527 () Bool)

(declare-fun tp!115287 () Bool)

(assert (=> b!1585731 (= e!885375 (and tp_is_empty!39527 tp!115287))))

(declare-fun b!1585732 () Bool)

(declare-fun contains!10537 (List!36979 tuple2!25886) Bool)

(assert (=> b!1585732 (= e!885373 (not (contains!10537 lt!677424 lt!677423)))))

(declare-fun res!1082948 () Bool)

(assert (=> start!138276 (=> (not res!1082948) (not e!885374))))

(assert (=> start!138276 (= res!1082948 (isStrictlySorted!1201 l!556))))

(assert (=> start!138276 e!885374))

(assert (=> start!138276 e!885375))

(assert (=> start!138276 true))

(assert (=> start!138276 tp_is_empty!39527))

(declare-fun b!1585733 () Bool)

(declare-fun res!1082946 () Bool)

(assert (=> b!1585733 (=> (not res!1082946) (not e!885374))))

(assert (=> b!1585733 (= res!1082946 (and (bvsge (_1!12954 (h!38518 l!556)) newKey!21) (is-Cons!36975 l!556) (= (_1!12954 (h!38518 l!556)) newKey!21)))))

(assert (= (and start!138276 res!1082948) b!1585733))

(assert (= (and b!1585733 res!1082946) b!1585730))

(assert (= (and b!1585730 (not res!1082947)) b!1585729))

(assert (= (and b!1585729 (not res!1082945)) b!1585732))

(assert (= (and start!138276 (is-Cons!36975 l!556)) b!1585731))

(declare-fun m!1454453 () Bool)

(assert (=> b!1585729 m!1454453))

(declare-fun m!1454455 () Bool)

(assert (=> b!1585730 m!1454455))

(declare-fun m!1454457 () Bool)

(assert (=> b!1585730 m!1454457))

(declare-fun m!1454459 () Bool)

(assert (=> b!1585732 m!1454459))

(declare-fun m!1454461 () Bool)

(assert (=> start!138276 m!1454461))

(push 1)

(assert (not start!138276))

(assert tp_is_empty!39527)

(assert (not b!1585731))

(assert (not b!1585732))

(assert (not b!1585730))

(assert (not b!1585729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167783 () Bool)

(declare-fun lt!677433 () Bool)

(declare-fun content!868 (List!36979) (Set tuple2!25886))

(assert (=> d!167783 (= lt!677433 (member lt!677423 (content!868 lt!677424)))))

(declare-fun e!885417 () Bool)

(assert (=> d!167783 (= lt!677433 e!885417)))

(declare-fun res!1082987 () Bool)

(assert (=> d!167783 (=> (not res!1082987) (not e!885417))))

(assert (=> d!167783 (= res!1082987 (is-Cons!36975 lt!677424))))

(assert (=> d!167783 (= (contains!10537 lt!677424 lt!677423) lt!677433)))

(declare-fun b!1585777 () Bool)

(declare-fun e!885418 () Bool)

(assert (=> b!1585777 (= e!885417 e!885418)))

(declare-fun res!1082988 () Bool)

(assert (=> b!1585777 (=> res!1082988 e!885418)))

(assert (=> b!1585777 (= res!1082988 (= (h!38518 lt!677424) lt!677423))))

(declare-fun b!1585778 () Bool)

(assert (=> b!1585778 (= e!885418 (contains!10537 (t!51900 lt!677424) lt!677423))))

(assert (= (and d!167783 res!1082987) b!1585777))

(assert (= (and b!1585777 (not res!1082988)) b!1585778))

(declare-fun m!1454485 () Bool)

(assert (=> d!167783 m!1454485))

(declare-fun m!1454487 () Bool)

(assert (=> d!167783 m!1454487))

(declare-fun m!1454489 () Bool)

(assert (=> b!1585778 m!1454489))

(assert (=> b!1585732 d!167783))

(declare-fun d!167791 () Bool)

(declare-fun res!1082999 () Bool)

(declare-fun e!885429 () Bool)

(assert (=> d!167791 (=> res!1082999 e!885429)))

(assert (=> d!167791 (= res!1082999 (and (is-Cons!36975 lt!677424) (= (_1!12954 (h!38518 lt!677424)) newKey!21)))))

(assert (=> d!167791 (= (containsKey!1014 lt!677424 newKey!21) e!885429)))

(declare-fun b!1585789 () Bool)

(declare-fun e!885430 () Bool)

(assert (=> b!1585789 (= e!885429 e!885430)))

(declare-fun res!1083000 () Bool)

(assert (=> b!1585789 (=> (not res!1083000) (not e!885430))))

(assert (=> b!1585789 (= res!1083000 (and (or (not (is-Cons!36975 lt!677424)) (bvsle (_1!12954 (h!38518 lt!677424)) newKey!21)) (is-Cons!36975 lt!677424) (bvslt (_1!12954 (h!38518 lt!677424)) newKey!21)))))

(declare-fun b!1585790 () Bool)

(assert (=> b!1585790 (= e!885430 (containsKey!1014 (t!51900 lt!677424) newKey!21))))

(assert (= (and d!167791 (not res!1082999)) b!1585789))

(assert (= (and b!1585789 res!1083000) b!1585790))

(declare-fun m!1454491 () Bool)

(assert (=> b!1585790 m!1454491))

(assert (=> b!1585729 d!167791))

(declare-fun d!167793 () Bool)

(declare-fun res!1083005 () Bool)

(declare-fun e!885438 () Bool)

(assert (=> d!167793 (=> res!1083005 e!885438)))

(assert (=> d!167793 (= res!1083005 (or (is-Nil!36976 l!556) (is-Nil!36976 (t!51900 l!556))))))

(assert (=> d!167793 (= (isStrictlySorted!1201 l!556) e!885438)))

(declare-fun b!1585800 () Bool)

(declare-fun e!885439 () Bool)

(assert (=> b!1585800 (= e!885438 e!885439)))

(declare-fun res!1083006 () Bool)

(assert (=> b!1585800 (=> (not res!1083006) (not e!885439))))

(assert (=> b!1585800 (= res!1083006 (bvslt (_1!12954 (h!38518 l!556)) (_1!12954 (h!38518 (t!51900 l!556)))))))

(declare-fun b!1585801 () Bool)

(assert (=> b!1585801 (= e!885439 (isStrictlySorted!1201 (t!51900 l!556)))))

(assert (= (and d!167793 (not res!1083005)) b!1585800))

(assert (= (and b!1585800 res!1083006) b!1585801))

(declare-fun m!1454495 () Bool)

(assert (=> b!1585801 m!1454495))

(assert (=> start!138276 d!167793))

(declare-fun d!167795 () Bool)

(declare-fun res!1083007 () Bool)

(declare-fun e!885440 () Bool)

(assert (=> d!167795 (=> res!1083007 e!885440)))

(assert (=> d!167795 (= res!1083007 (or (is-Nil!36976 lt!677424) (is-Nil!36976 (t!51900 lt!677424))))))

(assert (=> d!167795 (= (isStrictlySorted!1201 lt!677424) e!885440)))

(declare-fun b!1585802 () Bool)

(declare-fun e!885441 () Bool)

(assert (=> b!1585802 (= e!885440 e!885441)))

(declare-fun res!1083008 () Bool)

(assert (=> b!1585802 (=> (not res!1083008) (not e!885441))))

(assert (=> b!1585802 (= res!1083008 (bvslt (_1!12954 (h!38518 lt!677424)) (_1!12954 (h!38518 (t!51900 lt!677424)))))))

(declare-fun b!1585803 () Bool)

(assert (=> b!1585803 (= e!885441 (isStrictlySorted!1201 (t!51900 lt!677424)))))

(assert (= (and d!167795 (not res!1083007)) b!1585802))

(assert (= (and b!1585802 res!1083008) b!1585803))

(declare-fun m!1454497 () Bool)

(assert (=> b!1585803 m!1454497))

(assert (=> b!1585730 d!167795))

(declare-fun d!167797 () Bool)

(assert (=> d!167797 (= ($colon$colon!1045 (t!51900 l!556) lt!677423) (Cons!36975 lt!677423 (t!51900 l!556)))))

(assert (=> b!1585730 d!167797))

(declare-fun b!1585808 () Bool)

(declare-fun e!885444 () Bool)

(declare-fun tp!115296 () Bool)

(assert (=> b!1585808 (= e!885444 (and tp_is_empty!39527 tp!115296))))

(assert (=> b!1585731 (= tp!115287 e!885444)))

(assert (= (and b!1585731 (is-Cons!36975 (t!51900 l!556))) b!1585808))

(push 1)

(assert (not b!1585778))

(assert (not b!1585801))

(assert (not b!1585790))

(assert tp_is_empty!39527)

(assert (not d!167783))

(assert (not b!1585808))

(assert (not b!1585803))

(check-sat)

