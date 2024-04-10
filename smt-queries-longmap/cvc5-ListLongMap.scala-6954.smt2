; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87702 () Bool)

(assert start!87702)

(declare-fun res!680751 () Bool)

(declare-fun e!570631 () Bool)

(assert (=> start!87702 (=> (not res!680751) (not e!570631))))

(declare-datatypes ((B!1430 0))(
  ( (B!1431 (val!11799 Int)) )
))
(declare-datatypes ((tuple2!15144 0))(
  ( (tuple2!15145 (_1!7583 (_ BitVec 64)) (_2!7583 B!1430)) )
))
(declare-datatypes ((List!21430 0))(
  ( (Nil!21427) (Cons!21426 (h!22624 tuple2!15144) (t!30431 List!21430)) )
))
(declare-fun l!412 () List!21430)

(declare-fun isStrictlySorted!573 (List!21430) Bool)

(assert (=> start!87702 (= res!680751 (isStrictlySorted!573 l!412))))

(assert (=> start!87702 e!570631))

(declare-fun e!570630 () Bool)

(assert (=> start!87702 e!570630))

(declare-fun tp_is_empty!23497 () Bool)

(assert (=> start!87702 tp_is_empty!23497))

(declare-fun b!1014348 () Bool)

(declare-fun res!680750 () Bool)

(assert (=> b!1014348 (=> (not res!680750) (not e!570631))))

(declare-fun value!115 () B!1430)

(assert (=> b!1014348 (= res!680750 (and (not (= (_2!7583 (h!22624 l!412)) value!115)) (is-Cons!21426 l!412)))))

(declare-fun b!1014349 () Bool)

(declare-fun ListPrimitiveSize!112 (List!21430) Int)

(assert (=> b!1014349 (= e!570631 (>= (ListPrimitiveSize!112 (t!30431 l!412)) (ListPrimitiveSize!112 l!412)))))

(declare-datatypes ((List!21431 0))(
  ( (Nil!21428) (Cons!21427 (h!22625 (_ BitVec 64)) (t!30432 List!21431)) )
))
(declare-fun lt!448485 () List!21431)

(declare-fun getKeysOf!46 (List!21430 B!1430) List!21431)

(assert (=> b!1014349 (= lt!448485 (getKeysOf!46 (t!30431 l!412) value!115))))

(declare-fun b!1014350 () Bool)

(declare-fun tp!70520 () Bool)

(assert (=> b!1014350 (= e!570630 (and tp_is_empty!23497 tp!70520))))

(assert (= (and start!87702 res!680751) b!1014348))

(assert (= (and b!1014348 res!680750) b!1014349))

(assert (= (and start!87702 (is-Cons!21426 l!412)) b!1014350))

(declare-fun m!937011 () Bool)

(assert (=> start!87702 m!937011))

(declare-fun m!937013 () Bool)

(assert (=> b!1014349 m!937013))

(declare-fun m!937015 () Bool)

(assert (=> b!1014349 m!937015))

(declare-fun m!937017 () Bool)

(assert (=> b!1014349 m!937017))

(push 1)

(assert (not b!1014349))

(assert (not start!87702))

(assert (not b!1014350))

(assert tp_is_empty!23497)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120749 () Bool)

(declare-fun lt!448496 () Int)

(assert (=> d!120749 (>= lt!448496 0)))

(declare-fun e!570648 () Int)

(assert (=> d!120749 (= lt!448496 e!570648)))

(declare-fun c!102662 () Bool)

(assert (=> d!120749 (= c!102662 (is-Nil!21427 (t!30431 l!412)))))

(assert (=> d!120749 (= (ListPrimitiveSize!112 (t!30431 l!412)) lt!448496)))

(declare-fun b!1014377 () Bool)

(assert (=> b!1014377 (= e!570648 0)))

(declare-fun b!1014378 () Bool)

(assert (=> b!1014378 (= e!570648 (+ 1 (ListPrimitiveSize!112 (t!30431 (t!30431 l!412)))))))

(assert (= (and d!120749 c!102662) b!1014377))

(assert (= (and d!120749 (not c!102662)) b!1014378))

(declare-fun m!937035 () Bool)

(assert (=> b!1014378 m!937035))

(assert (=> b!1014349 d!120749))

(declare-fun d!120753 () Bool)

(declare-fun lt!448498 () Int)

(assert (=> d!120753 (>= lt!448498 0)))

(declare-fun e!570650 () Int)

(assert (=> d!120753 (= lt!448498 e!570650)))

(declare-fun c!102664 () Bool)

(assert (=> d!120753 (= c!102664 (is-Nil!21427 l!412))))

(assert (=> d!120753 (= (ListPrimitiveSize!112 l!412) lt!448498)))

(declare-fun b!1014381 () Bool)

(assert (=> b!1014381 (= e!570650 0)))

(declare-fun b!1014382 () Bool)

(assert (=> b!1014382 (= e!570650 (+ 1 (ListPrimitiveSize!112 (t!30431 l!412))))))

(assert (= (and d!120753 c!102664) b!1014381))

(assert (= (and d!120753 (not c!102664)) b!1014382))

(assert (=> b!1014382 m!937013))

(assert (=> b!1014349 d!120753))

(declare-fun b!1014435 () Bool)

(assert (=> b!1014435 true))

(assert (=> b!1014435 true))

(assert (=> b!1014435 true))

(declare-fun bs!29266 () Bool)

(declare-fun b!1014445 () Bool)

(assert (= bs!29266 (and b!1014445 b!1014435)))

(declare-fun lt!448578 () List!21430)

(declare-fun lt!448582 () tuple2!15144)

(declare-fun lt!448587 () List!21430)

(declare-fun lambda!697 () Int)

(declare-fun lt!448571 () tuple2!15144)

(declare-fun lambda!699 () Int)

(assert (=> bs!29266 (= (= (Cons!21426 lt!448582 lt!448587) (Cons!21426 lt!448571 lt!448578)) (= lambda!699 lambda!697))))

(assert (=> b!1014445 true))

(assert (=> b!1014445 true))

(assert (=> b!1014445 true))

(declare-fun bs!29268 () Bool)

(declare-fun d!120757 () Bool)

(assert (= bs!29268 (and d!120757 b!1014435)))

(declare-fun lambda!701 () Int)

(assert (=> bs!29268 (= (= (t!30431 l!412) (Cons!21426 lt!448571 lt!448578)) (= lambda!701 lambda!697))))

(declare-fun bs!29270 () Bool)

(assert (= bs!29270 (and d!120757 b!1014445)))

(assert (=> bs!29270 (= (= (t!30431 l!412) (Cons!21426 lt!448582 lt!448587)) (= lambda!701 lambda!699))))

(assert (=> d!120757 true))

(assert (=> d!120757 true))

(declare-fun b!1014433 () Bool)

(declare-fun e!570680 () List!21431)

(declare-fun call!42796 () List!21431)

(assert (=> b!1014433 (= e!570680 (Cons!21427 (_1!7583 (h!22624 (t!30431 l!412))) call!42796))))

(declare-fun c!102696 () Bool)

(declare-fun call!42794 () Bool)

(assert (=> b!1014433 (= c!102696 (not call!42794))))

(declare-datatypes ((Unit!33168 0))(
  ( (Unit!33169) )
))
(declare-fun lt!448579 () Unit!33168)

(declare-fun e!570676 () Unit!33168)

(assert (=> b!1014433 (= lt!448579 e!570676)))

(declare-fun call!42800 () Bool)

(assert (=> b!1014435 call!42800))

(declare-fun lt!448580 () Unit!33168)

(declare-fun call!42798 () Unit!33168)

(assert (=> b!1014435 (= lt!448580 call!42798)))

(assert (=> b!1014435 (= lt!448571 (h!22624 (t!30431 l!412)))))

(declare-fun lt!448567 () List!21431)

(assert (=> b!1014435 (= lt!448567 call!42796)))

(assert (=> b!1014435 (= lt!448578 (t!30431 (t!30431 l!412)))))

(assert (=> b!1014435 (= e!570676 lt!448580)))

(declare-fun lt!448584 () List!21431)

(declare-fun bm!42791 () Bool)

(declare-fun c!102690 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!34 (List!21430 List!21431 B!1430 tuple2!15144) Unit!33168)

(assert (=> bm!42791 (= call!42798 (lemmaForallGetValueByKeySameWithASmallerHead!34 (ite c!102690 lt!448578 lt!448587) (ite c!102690 lt!448567 lt!448584) value!115 (ite c!102690 lt!448571 lt!448582)))))

(declare-fun b!1014439 () Bool)

(declare-fun Unit!33171 () Unit!33168)

(assert (=> b!1014439 (= e!570676 Unit!33171)))

(declare-fun b!1014440 () Bool)

(declare-fun e!570678 () List!21431)

(assert (=> b!1014440 (= e!570678 Nil!21428)))

(declare-fun bm!42795 () Bool)

(declare-fun forall!239 (List!21431 Int) Bool)

(assert (=> bm!42795 (= call!42800 (forall!239 (ite c!102690 lt!448567 lt!448584) (ite c!102690 lambda!697 lambda!699)))))

(declare-fun b!1014441 () Bool)

(declare-fun e!570682 () Unit!33168)

(declare-fun Unit!33172 () Unit!33168)

(assert (=> b!1014441 (= e!570682 Unit!33172)))

(declare-fun lt!448569 () List!21431)

(assert (=> d!120757 (forall!239 lt!448569 lambda!701)))

(assert (=> d!120757 (= lt!448569 e!570680)))

(assert (=> d!120757 (= c!102690 (and (is-Cons!21426 (t!30431 l!412)) (= (_2!7583 (h!22624 (t!30431 l!412))) value!115)))))

(assert (=> d!120757 (isStrictlySorted!573 (t!30431 l!412))))

(assert (=> d!120757 (= (getKeysOf!46 (t!30431 l!412) value!115) lt!448569)))

(declare-fun bm!42792 () Bool)

(declare-fun isEmpty!835 (List!21431) Bool)

(assert (=> bm!42792 (= call!42794 (isEmpty!835 call!42796))))

(declare-fun b!1014443 () Bool)

(assert (=> b!1014443 (= e!570680 e!570678)))

(declare-fun c!102694 () Bool)

(assert (=> b!1014443 (= c!102694 (and (is-Cons!21426 (t!30431 l!412)) (not (= (_2!7583 (h!22624 (t!30431 l!412))) value!115))))))

(declare-fun lt!448564 () Unit!33168)

(assert (=> b!1014445 (= e!570682 lt!448564)))

(assert (=> b!1014445 (= lt!448587 (t!30431 (t!30431 l!412)))))

(assert (=> b!1014445 (= lt!448584 call!42796)))

(assert (=> b!1014445 (= lt!448582 (h!22624 (t!30431 l!412)))))

(assert (=> b!1014445 (= lt!448564 call!42798)))

(assert (=> b!1014445 call!42800))

(declare-fun bm!42798 () Bool)

(assert (=> bm!42798 (= call!42796 (getKeysOf!46 (t!30431 (t!30431 l!412)) value!115))))

(declare-fun b!1014447 () Bool)

(declare-fun lt!448573 () Unit!33168)

(assert (=> b!1014447 (= lt!448573 e!570682)))

(declare-fun c!102692 () Bool)

(assert (=> b!1014447 (= c!102692 (not call!42794))))

(declare-fun lt!448575 () List!21431)

(assert (=> b!1014447 (= lt!448575 call!42796)))

(assert (=> b!1014447 (= e!570678 call!42796)))

(assert (= (and d!120757 c!102690) b!1014433))

(assert (= (and d!120757 (not c!102690)) b!1014443))

(assert (= (and b!1014433 c!102696) b!1014435))

(assert (= (and b!1014433 (not c!102696)) b!1014439))

(assert (= (and b!1014443 c!102694) b!1014447))

(assert (= (and b!1014443 (not c!102694)) b!1014440))

(assert (= (and b!1014447 c!102692) b!1014445))

(assert (= (and b!1014447 (not c!102692)) b!1014441))

(assert (= (or b!1014435 b!1014445) bm!42791))

(assert (= (or b!1014435 b!1014445) bm!42795))

(assert (= (or b!1014433 b!1014435 b!1014447 b!1014445) bm!42798))

(assert (= (or b!1014433 b!1014447) bm!42792))

(declare-fun m!937043 () Bool)

(assert (=> bm!42798 m!937043))

(declare-fun m!937045 () Bool)

(assert (=> bm!42792 m!937045))

(declare-fun m!937049 () Bool)

(assert (=> bm!42791 m!937049))

(declare-fun m!937053 () Bool)

(assert (=> bm!42795 m!937053))

(declare-fun m!937057 () Bool)

(assert (=> d!120757 m!937057))

(declare-fun m!937061 () Bool)

(assert (=> d!120757 m!937061))

(assert (=> b!1014349 d!120757))

(declare-fun d!120767 () Bool)

(declare-fun res!680774 () Bool)

(declare-fun e!570694 () Bool)

(assert (=> d!120767 (=> res!680774 e!570694)))

(assert (=> d!120767 (= res!680774 (or (is-Nil!21427 l!412) (is-Nil!21427 (t!30431 l!412))))))

(assert (=> d!120767 (= (isStrictlySorted!573 l!412) e!570694)))

(declare-fun b!1014471 () Bool)

(declare-fun e!570695 () Bool)

(assert (=> b!1014471 (= e!570694 e!570695)))

(declare-fun res!680775 () Bool)

(assert (=> b!1014471 (=> (not res!680775) (not e!570695))))

(assert (=> b!1014471 (= res!680775 (bvslt (_1!7583 (h!22624 l!412)) (_1!7583 (h!22624 (t!30431 l!412)))))))

(declare-fun b!1014472 () Bool)

(assert (=> b!1014472 (= e!570695 (isStrictlySorted!573 (t!30431 l!412)))))

(assert (= (and d!120767 (not res!680774)) b!1014471))

(assert (= (and b!1014471 res!680775) b!1014472))

(assert (=> b!1014472 m!937061))

(assert (=> start!87702 d!120767))

(declare-fun b!1014482 () Bool)

(declare-fun e!570701 () Bool)

(declare-fun tp!70532 () Bool)

(assert (=> b!1014482 (= e!570701 (and tp_is_empty!23497 tp!70532))))

(assert (=> b!1014350 (= tp!70520 e!570701)))

(assert (= (and b!1014350 (is-Cons!21426 (t!30431 l!412))) b!1014482))

(push 1)

(assert (not bm!42798))

(assert (not b!1014472))

(assert (not bm!42795))

(assert (not bm!42792))

(assert (not b!1014482))

(assert tp_is_empty!23497)

(assert (not bm!42791))

(assert (not b!1014378))

(assert (not b!1014382))

(assert (not d!120757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

