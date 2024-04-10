; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87582 () Bool)

(assert start!87582)

(declare-fun b!1013689 () Bool)

(assert (=> b!1013689 true))

(assert (=> b!1013689 true))

(declare-fun b!1013686 () Bool)

(declare-datatypes ((Unit!33134 0))(
  ( (Unit!33135) )
))
(declare-fun e!570241 () Unit!33134)

(declare-fun Unit!33136 () Unit!33134)

(assert (=> b!1013686 (= e!570241 Unit!33136)))

(declare-fun b!1013687 () Bool)

(declare-fun e!570239 () Bool)

(declare-datatypes ((B!1412 0))(
  ( (B!1413 (val!11790 Int)) )
))
(declare-datatypes ((tuple2!15126 0))(
  ( (tuple2!15127 (_1!7574 (_ BitVec 64)) (_2!7574 B!1412)) )
))
(declare-datatypes ((List!21415 0))(
  ( (Nil!21412) (Cons!21411 (h!22609 tuple2!15126) (t!30416 List!21415)) )
))
(declare-fun l!412 () List!21415)

(declare-fun ListPrimitiveSize!106 (List!21415) Int)

(assert (=> b!1013687 (= e!570239 (>= (ListPrimitiveSize!106 (t!30416 l!412)) (ListPrimitiveSize!106 l!412)))))

(declare-fun lt!448138 () Unit!33134)

(assert (=> b!1013687 (= lt!448138 e!570241)))

(declare-fun c!102510 () Bool)

(declare-datatypes ((List!21416 0))(
  ( (Nil!21413) (Cons!21412 (h!22610 (_ BitVec 64)) (t!30417 List!21416)) )
))
(declare-fun lt!448140 () List!21416)

(declare-fun isEmpty!822 (List!21416) Bool)

(assert (=> b!1013687 (= c!102510 (not (isEmpty!822 lt!448140)))))

(declare-fun value!115 () B!1412)

(declare-fun getKeysOf!40 (List!21415 B!1412) List!21416)

(assert (=> b!1013687 (= lt!448140 (getKeysOf!40 (t!30416 l!412) value!115))))

(declare-fun b!1013688 () Bool)

(declare-fun res!680495 () Bool)

(assert (=> b!1013688 (=> (not res!680495) (not e!570239))))

(assert (=> b!1013688 (= res!680495 (and (is-Cons!21411 l!412) (= (_2!7574 (h!22609 l!412)) value!115)))))

(declare-fun lt!448139 () Unit!33134)

(assert (=> b!1013689 (= e!570241 lt!448139)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!28 (List!21415 List!21416 B!1412 tuple2!15126) Unit!33134)

(assert (=> b!1013689 (= lt!448139 (lemmaForallGetValueByKeySameWithASmallerHead!28 (t!30416 l!412) lt!448140 value!115 (h!22609 l!412)))))

(declare-fun lambda!545 () Int)

(declare-fun forall!233 (List!21416 Int) Bool)

(assert (=> b!1013689 (forall!233 lt!448140 lambda!545)))

(declare-fun b!1013690 () Bool)

(declare-fun e!570240 () Bool)

(declare-fun tp_is_empty!23479 () Bool)

(declare-fun tp!70463 () Bool)

(assert (=> b!1013690 (= e!570240 (and tp_is_empty!23479 tp!70463))))

(declare-fun res!680496 () Bool)

(assert (=> start!87582 (=> (not res!680496) (not e!570239))))

(declare-fun isStrictlySorted!564 (List!21415) Bool)

(assert (=> start!87582 (= res!680496 (isStrictlySorted!564 l!412))))

(assert (=> start!87582 e!570239))

(assert (=> start!87582 e!570240))

(assert (=> start!87582 tp_is_empty!23479))

(assert (= (and start!87582 res!680496) b!1013688))

(assert (= (and b!1013688 res!680495) b!1013687))

(assert (= (and b!1013687 c!102510) b!1013689))

(assert (= (and b!1013687 (not c!102510)) b!1013686))

(assert (= (and start!87582 (is-Cons!21411 l!412)) b!1013690))

(declare-fun m!936525 () Bool)

(assert (=> b!1013687 m!936525))

(declare-fun m!936527 () Bool)

(assert (=> b!1013687 m!936527))

(declare-fun m!936529 () Bool)

(assert (=> b!1013687 m!936529))

(declare-fun m!936531 () Bool)

(assert (=> b!1013687 m!936531))

(declare-fun m!936533 () Bool)

(assert (=> b!1013689 m!936533))

(declare-fun m!936535 () Bool)

(assert (=> b!1013689 m!936535))

(declare-fun m!936537 () Bool)

(assert (=> start!87582 m!936537))

(push 1)

(assert (not start!87582))

(assert tp_is_empty!23479)

(assert (not b!1013687))

(assert (not b!1013690))

(assert (not b!1013689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120511 () Bool)

(declare-fun lt!448161 () Int)

(assert (=> d!120511 (>= lt!448161 0)))

(declare-fun e!570268 () Int)

(assert (=> d!120511 (= lt!448161 e!570268)))

(declare-fun c!102519 () Bool)

(assert (=> d!120511 (= c!102519 (is-Nil!21412 (t!30416 l!412)))))

(assert (=> d!120511 (= (ListPrimitiveSize!106 (t!30416 l!412)) lt!448161)))

(declare-fun b!1013743 () Bool)

(assert (=> b!1013743 (= e!570268 0)))

(declare-fun b!1013744 () Bool)

(assert (=> b!1013744 (= e!570268 (+ 1 (ListPrimitiveSize!106 (t!30416 (t!30416 l!412)))))))

(assert (= (and d!120511 c!102519) b!1013743))

(assert (= (and d!120511 (not c!102519)) b!1013744))

(declare-fun m!936569 () Bool)

(assert (=> b!1013744 m!936569))

(assert (=> b!1013687 d!120511))

(declare-fun d!120515 () Bool)

(declare-fun lt!448162 () Int)

(assert (=> d!120515 (>= lt!448162 0)))

(declare-fun e!570269 () Int)

(assert (=> d!120515 (= lt!448162 e!570269)))

(declare-fun c!102520 () Bool)

(assert (=> d!120515 (= c!102520 (is-Nil!21412 l!412))))

(assert (=> d!120515 (= (ListPrimitiveSize!106 l!412) lt!448162)))

(declare-fun b!1013745 () Bool)

(assert (=> b!1013745 (= e!570269 0)))

(declare-fun b!1013746 () Bool)

(assert (=> b!1013746 (= e!570269 (+ 1 (ListPrimitiveSize!106 (t!30416 l!412))))))

(assert (= (and d!120515 c!102520) b!1013745))

(assert (= (and d!120515 (not c!102520)) b!1013746))

(assert (=> b!1013746 m!936525))

(assert (=> b!1013687 d!120515))

(declare-fun d!120517 () Bool)

(assert (=> d!120517 (= (isEmpty!822 lt!448140) (is-Nil!21413 lt!448140))))

(assert (=> b!1013687 d!120517))

(declare-fun bs!28956 () Bool)

(declare-fun b!1013801 () Bool)

(assert (= bs!28956 (and b!1013801 b!1013689)))

(declare-fun lambda!570 () Int)

(declare-fun lt!448197 () List!21415)

(declare-fun lt!448203 () tuple2!15126)

(assert (=> bs!28956 (= (= (Cons!21411 lt!448203 lt!448197) l!412) (= lambda!570 lambda!545))))

(assert (=> b!1013801 true))

(assert (=> b!1013801 true))

(assert (=> b!1013801 true))

(declare-fun bs!28957 () Bool)

(declare-fun b!1013804 () Bool)

(assert (= bs!28957 (and b!1013804 b!1013689)))

(declare-fun lt!448208 () List!21415)

(declare-fun lt!448207 () tuple2!15126)

(declare-fun lambda!571 () Int)

(assert (=> bs!28957 (= (= (Cons!21411 lt!448207 lt!448208) l!412) (= lambda!571 lambda!545))))

(declare-fun bs!28958 () Bool)

(assert (= bs!28958 (and b!1013804 b!1013801)))

(assert (=> bs!28958 (= (= (Cons!21411 lt!448207 lt!448208) (Cons!21411 lt!448203 lt!448197)) (= lambda!571 lambda!570))))

(assert (=> b!1013804 true))

(assert (=> b!1013804 true))

(assert (=> b!1013804 true))

(declare-fun bs!28959 () Bool)

(declare-fun d!120519 () Bool)

(assert (= bs!28959 (and d!120519 b!1013689)))

(declare-fun lambda!572 () Int)

(assert (=> bs!28959 (= (= (t!30416 l!412) l!412) (= lambda!572 lambda!545))))

(declare-fun bs!28960 () Bool)

(assert (= bs!28960 (and d!120519 b!1013801)))

(assert (=> bs!28960 (= (= (t!30416 l!412) (Cons!21411 lt!448203 lt!448197)) (= lambda!572 lambda!570))))

(declare-fun bs!28961 () Bool)

(assert (= bs!28961 (and d!120519 b!1013804)))

(assert (=> bs!28961 (= (= (t!30416 l!412) (Cons!21411 lt!448207 lt!448208)) (= lambda!572 lambda!571))))

(assert (=> d!120519 true))

(assert (=> d!120519 true))

(declare-fun b!1013799 () Bool)

(declare-fun e!570295 () Unit!33134)

(declare-fun Unit!33143 () Unit!33134)

(assert (=> b!1013799 (= e!570295 Unit!33143)))

(declare-fun b!1013800 () Bool)

(declare-fun e!570297 () List!21416)

(assert (=> b!1013800 (= e!570297 Nil!21413)))

(declare-fun bm!42699 () Bool)

(declare-fun call!42705 () List!21416)

(assert (=> bm!42699 (= call!42705 (getKeysOf!40 (t!30416 (t!30416 l!412)) value!115))))

(declare-fun call!42704 () Bool)

(assert (=> b!1013801 call!42704))

(declare-fun lt!448204 () Unit!33134)

(declare-fun call!42702 () Unit!33134)

(assert (=> b!1013801 (= lt!448204 call!42702)))

(assert (=> b!1013801 (= lt!448203 (h!22609 (t!30416 l!412)))))

(declare-fun lt!448205 () List!21416)

(assert (=> b!1013801 (= lt!448205 call!42705)))

(assert (=> b!1013801 (= lt!448197 (t!30416 (t!30416 l!412)))))

(declare-fun e!570296 () Unit!33134)

(assert (=> b!1013801 (= e!570296 lt!448204)))

(declare-fun b!1013802 () Bool)

(declare-fun Unit!33144 () Unit!33134)

(assert (=> b!1013802 (= e!570296 Unit!33144)))

(declare-fun lt!448198 () List!21416)

(declare-fun bm!42700 () Bool)

(declare-fun c!102535 () Bool)

(assert (=> bm!42700 (= call!42704 (forall!233 (ite c!102535 lt!448205 lt!448198) (ite c!102535 lambda!570 lambda!571)))))

(declare-fun b!1013803 () Bool)

(declare-fun e!570294 () List!21416)

(assert (=> b!1013803 (= e!570294 e!570297)))

(declare-fun c!102536 () Bool)

(assert (=> b!1013803 (= c!102536 (and (is-Cons!21411 (t!30416 l!412)) (not (= (_2!7574 (h!22609 (t!30416 l!412))) value!115))))))

(declare-fun lt!448202 () Unit!33134)

(assert (=> b!1013804 (= e!570295 lt!448202)))

(assert (=> b!1013804 (= lt!448208 (t!30416 (t!30416 l!412)))))

(assert (=> b!1013804 (= lt!448198 call!42705)))

(assert (=> b!1013804 (= lt!448207 (h!22609 (t!30416 l!412)))))

(assert (=> b!1013804 (= lt!448202 call!42702)))

(assert (=> b!1013804 call!42704))

(declare-fun b!1013805 () Bool)

(assert (=> b!1013805 (= e!570294 (Cons!21412 (_1!7574 (h!22609 (t!30416 l!412))) call!42705))))

(declare-fun c!102534 () Bool)

(declare-fun call!42703 () Bool)

(assert (=> b!1013805 (= c!102534 (not call!42703))))

(declare-fun lt!448199 () Unit!33134)

(assert (=> b!1013805 (= lt!448199 e!570296)))

(declare-fun bm!42701 () Bool)

(assert (=> bm!42701 (= call!42702 (lemmaForallGetValueByKeySameWithASmallerHead!28 (ite c!102535 lt!448197 lt!448208) (ite c!102535 lt!448205 lt!448198) value!115 (ite c!102535 lt!448203 lt!448207)))))

(declare-fun lt!448206 () List!21416)

(assert (=> d!120519 (forall!233 lt!448206 lambda!572)))

(assert (=> d!120519 (= lt!448206 e!570294)))

(assert (=> d!120519 (= c!102535 (and (is-Cons!21411 (t!30416 l!412)) (= (_2!7574 (h!22609 (t!30416 l!412))) value!115)))))

(assert (=> d!120519 (isStrictlySorted!564 (t!30416 l!412))))

(assert (=> d!120519 (= (getKeysOf!40 (t!30416 l!412) value!115) lt!448206)))

(declare-fun b!1013806 () Bool)

(declare-fun lt!448200 () Unit!33134)

(assert (=> b!1013806 (= lt!448200 e!570295)))

(declare-fun c!102533 () Bool)

(assert (=> b!1013806 (= c!102533 (not call!42703))))

(declare-fun lt!448201 () List!21416)

(assert (=> b!1013806 (= lt!448201 call!42705)))

(assert (=> b!1013806 (= e!570297 call!42705)))

(declare-fun bm!42702 () Bool)

(assert (=> bm!42702 (= call!42703 (isEmpty!822 call!42705))))

(assert (= (and d!120519 c!102535) b!1013805))

(assert (= (and d!120519 (not c!102535)) b!1013803))

(assert (= (and b!1013805 c!102534) b!1013801))

(assert (= (and b!1013805 (not c!102534)) b!1013802))

(assert (= (and b!1013803 c!102536) b!1013806))

(assert (= (and b!1013803 (not c!102536)) b!1013800))

(assert (= (and b!1013806 c!102533) b!1013804))

(assert (= (and b!1013806 (not c!102533)) b!1013799))

(assert (= (or b!1013801 b!1013804) bm!42701))

(assert (= (or b!1013801 b!1013804) bm!42700))

(assert (= (or b!1013805 b!1013801 b!1013806 b!1013804) bm!42699))

(assert (= (or b!1013805 b!1013806) bm!42702))

(declare-fun m!936603 () Bool)

(assert (=> bm!42699 m!936603))

(declare-fun m!936605 () Bool)

(assert (=> bm!42701 m!936605))

(declare-fun m!936607 () Bool)

(assert (=> bm!42702 m!936607))

(declare-fun m!936609 () Bool)

(assert (=> bm!42700 m!936609))

(declare-fun m!936611 () Bool)

(assert (=> d!120519 m!936611))

(declare-fun m!936613 () Bool)

(assert (=> d!120519 m!936613))

(assert (=> b!1013687 d!120519))

(declare-fun d!120537 () Bool)

(declare-fun res!680555 () Bool)

(declare-fun e!570322 () Bool)

(assert (=> d!120537 (=> res!680555 e!570322)))

(assert (=> d!120537 (= res!680555 (or (is-Nil!21412 l!412) (is-Nil!21412 (t!30416 l!412))))))

(assert (=> d!120537 (= (isStrictlySorted!564 l!412) e!570322)))

(declare-fun b!1013841 () Bool)

(declare-fun e!570323 () Bool)

(assert (=> b!1013841 (= e!570322 e!570323)))

(declare-fun res!680556 () Bool)

(assert (=> b!1013841 (=> (not res!680556) (not e!570323))))

(assert (=> b!1013841 (= res!680556 (bvslt (_1!7574 (h!22609 l!412)) (_1!7574 (h!22609 (t!30416 l!412)))))))

(declare-fun b!1013842 () Bool)

(assert (=> b!1013842 (= e!570323 (isStrictlySorted!564 (t!30416 l!412)))))

(assert (= (and d!120537 (not res!680555)) b!1013841))

(assert (= (and b!1013841 res!680556) b!1013842))

(assert (=> b!1013842 m!936613))

(assert (=> start!87582 d!120537))

(declare-fun bs!28964 () Bool)

(declare-fun b!1013866 () Bool)

(assert (= bs!28964 (and b!1013866 b!1013689)))

(declare-fun lambda!584 () Int)

(assert (=> bs!28964 (= (= (t!30416 l!412) l!412) (= lambda!584 lambda!545))))

(declare-fun bs!28966 () Bool)

(assert (= bs!28966 (and b!1013866 b!1013801)))

(assert (=> bs!28966 (= (= (t!30416 l!412) (Cons!21411 lt!448203 lt!448197)) (= lambda!584 lambda!570))))

(declare-fun bs!28967 () Bool)

(assert (= bs!28967 (and b!1013866 b!1013804)))

(assert (=> bs!28967 (= (= (t!30416 l!412) (Cons!21411 lt!448207 lt!448208)) (= lambda!584 lambda!571))))

(declare-fun bs!28968 () Bool)

(assert (= bs!28968 (and b!1013866 d!120519)))

(assert (=> bs!28968 (= lambda!584 lambda!572)))

(assert (=> b!1013866 true))

(assert (=> b!1013866 true))

(declare-fun bs!28971 () Bool)

(declare-fun d!120541 () Bool)

(assert (= bs!28971 (and d!120541 b!1013866)))

(declare-fun lambda!586 () Int)

(assert (=> bs!28971 (= (= (Cons!21411 (h!22609 l!412) (t!30416 l!412)) (t!30416 l!412)) (= lambda!586 lambda!584))))

(declare-fun bs!28973 () Bool)

(assert (= bs!28973 (and d!120541 b!1013804)))

(assert (=> bs!28973 (= (= (Cons!21411 (h!22609 l!412) (t!30416 l!412)) (Cons!21411 lt!448207 lt!448208)) (= lambda!586 lambda!571))))

(declare-fun bs!28975 () Bool)

(assert (= bs!28975 (and d!120541 d!120519)))

(assert (=> bs!28975 (= (= (Cons!21411 (h!22609 l!412) (t!30416 l!412)) (t!30416 l!412)) (= lambda!586 lambda!572))))

(declare-fun bs!28976 () Bool)

(assert (= bs!28976 (and d!120541 b!1013689)))

(assert (=> bs!28976 (= (= (Cons!21411 (h!22609 l!412) (t!30416 l!412)) l!412) (= lambda!586 lambda!545))))

(declare-fun bs!28977 () Bool)

(assert (= bs!28977 (and d!120541 b!1013801)))

(assert (=> bs!28977 (= (= (Cons!21411 (h!22609 l!412) (t!30416 l!412)) (Cons!21411 lt!448203 lt!448197)) (= lambda!586 lambda!570))))

(assert (=> d!120541 true))

(assert (=> d!120541 true))

(assert (=> d!120541 true))

(assert (=> d!120541 (forall!233 lt!448140 lambda!586)))

(declare-fun lt!448251 () Unit!33134)

(declare-fun choose!1630 (List!21415 List!21416 B!1412 tuple2!15126) Unit!33134)

(assert (=> d!120541 (= lt!448251 (choose!1630 (t!30416 l!412) lt!448140 value!115 (h!22609 l!412)))))

(declare-fun e!570334 () Bool)

(assert (=> d!120541 e!570334))

(declare-fun res!680563 () Bool)

(assert (=> d!120541 (=> (not res!680563) (not e!570334))))

(assert (=> d!120541 (= res!680563 (isStrictlySorted!564 (t!30416 l!412)))))

(assert (=> d!120541 (= (lemmaForallGetValueByKeySameWithASmallerHead!28 (t!30416 l!412) lt!448140 value!115 (h!22609 l!412)) lt!448251)))

(declare-fun b!1013865 () Bool)

(declare-fun res!680564 () Bool)

(assert (=> b!1013865 (=> (not res!680564) (not e!570334))))

(declare-fun isEmpty!826 (List!21415) Bool)

(assert (=> b!1013865 (= res!680564 (not (isEmpty!826 (t!30416 l!412))))))

(declare-fun res!680565 () Bool)

(assert (=> b!1013866 (=> (not res!680565) (not e!570334))))

(assert (=> b!1013866 (= res!680565 (forall!233 lt!448140 lambda!584))))

(declare-fun b!1013867 () Bool)

(declare-fun head!936 (List!21415) tuple2!15126)

(assert (=> b!1013867 (= e!570334 (bvslt (_1!7574 (h!22609 l!412)) (_1!7574 (head!936 (t!30416 l!412)))))))

(assert (= (and d!120541 res!680563) b!1013865))

(assert (= (and b!1013865 res!680564) b!1013866))

(assert (= (and b!1013866 res!680565) b!1013867))

(declare-fun m!936617 () Bool)

(assert (=> d!120541 m!936617))

(declare-fun m!936619 () Bool)

(assert (=> d!120541 m!936619))

(assert (=> d!120541 m!936613))

(declare-fun m!936621 () Bool)

(assert (=> b!1013865 m!936621))

(declare-fun m!936623 () Bool)

(assert (=> b!1013866 m!936623))

(declare-fun m!936625 () Bool)

(assert (=> b!1013867 m!936625))

(assert (=> b!1013689 d!120541))

(declare-fun d!120549 () Bool)

(declare-fun res!680570 () Bool)

(declare-fun e!570339 () Bool)

(assert (=> d!120549 (=> res!680570 e!570339)))

(assert (=> d!120549 (= res!680570 (is-Nil!21413 lt!448140))))

(assert (=> d!120549 (= (forall!233 lt!448140 lambda!545) e!570339)))

(declare-fun b!1013872 () Bool)

(declare-fun e!570340 () Bool)

(assert (=> b!1013872 (= e!570339 e!570340)))

(declare-fun res!680571 () Bool)

(assert (=> b!1013872 (=> (not res!680571) (not e!570340))))

(declare-fun dynLambda!1887 (Int (_ BitVec 64)) Bool)

