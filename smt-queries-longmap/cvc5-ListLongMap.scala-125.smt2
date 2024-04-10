; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2148 () Bool)

(assert start!2148)

(declare-fun b!14447 () Bool)

(assert (=> b!14447 true))

(declare-fun b!14443 () Bool)

(declare-fun e!8654 () Bool)

(declare-fun tp_is_empty!727 () Bool)

(declare-fun tp!2342 () Bool)

(assert (=> b!14443 (= e!8654 (and tp_is_empty!727 tp!2342))))

(declare-fun b!14444 () Bool)

(declare-fun e!8653 () Bool)

(declare-fun e!8650 () Bool)

(assert (=> b!14444 (= e!8653 e!8650)))

(declare-fun c!1349 () Bool)

(declare-datatypes ((B!548 0))(
  ( (B!549 (val!372 Int)) )
))
(declare-datatypes ((tuple2!544 0))(
  ( (tuple2!545 (_1!272 (_ BitVec 64)) (_2!272 B!548)) )
))
(declare-datatypes ((List!427 0))(
  ( (Nil!424) (Cons!423 (h!989 tuple2!544) (t!2826 List!427)) )
))
(declare-fun l!522 () List!427)

(declare-fun isEmpty!102 (List!427) Bool)

(assert (=> b!14444 (= c!1349 (isEmpty!102 l!522))))

(declare-fun b!14445 () Bool)

(declare-fun e!8651 () Bool)

(assert (=> b!14445 (= e!8650 e!8651)))

(declare-fun res!11163 () Bool)

(declare-fun call!419 () Bool)

(assert (=> b!14445 (= res!11163 (not call!419))))

(assert (=> b!14445 (=> (not res!11163) (not e!8651))))

(declare-fun b!14446 () Bool)

(declare-fun e!8652 () Bool)

(assert (=> b!14446 (= e!8652 e!8653)))

(declare-fun res!11165 () Bool)

(assert (=> b!14446 (=> res!11165 e!8653)))

(declare-fun lt!3609 () List!427)

(declare-fun isStrictlySorted!114 (List!427) Bool)

(assert (=> b!14446 (= res!11165 (not (isStrictlySorted!114 lt!3609)))))

(declare-fun value!159 () B!548)

(declare-fun filterByValue!16 (List!427 B!548) List!427)

(assert (=> b!14446 (= lt!3609 (filterByValue!16 (t!2826 l!522) value!159))))

(declare-fun res!11164 () Bool)

(assert (=> b!14447 (=> res!11164 e!8653)))

(declare-fun lambda!155 () Int)

(declare-fun forall!95 (List!427 Int) Bool)

(assert (=> b!14447 (= res!11164 (not (forall!95 lt!3609 lambda!155)))))

(declare-fun res!11166 () Bool)

(assert (=> start!2148 (=> (not res!11166) (not e!8652))))

(assert (=> start!2148 (= res!11166 (isStrictlySorted!114 l!522))))

(assert (=> start!2148 e!8652))

(assert (=> start!2148 e!8654))

(assert (=> start!2148 tp_is_empty!727))

(declare-fun b!14448 () Bool)

(declare-fun head!791 (List!427) tuple2!544)

(assert (=> b!14448 (= e!8651 (bvslt (_1!272 (head!791 lt!3609)) (_1!272 (head!791 l!522))))))

(declare-fun b!14449 () Bool)

(assert (=> b!14449 (= e!8650 (not call!419))))

(declare-fun b!14450 () Bool)

(declare-fun res!11167 () Bool)

(assert (=> b!14450 (=> (not res!11167) (not e!8652))))

(assert (=> b!14450 (= res!11167 (and (not (= (_2!272 (h!989 l!522)) value!159)) (is-Cons!423 l!522)))))

(declare-fun bm!416 () Bool)

(assert (=> bm!416 (= call!419 (isEmpty!102 lt!3609))))

(assert (= (and start!2148 res!11166) b!14450))

(assert (= (and b!14450 res!11167) b!14446))

(assert (= (and b!14446 (not res!11165)) b!14447))

(assert (= (and b!14447 (not res!11164)) b!14444))

(assert (= (and b!14444 c!1349) b!14449))

(assert (= (and b!14444 (not c!1349)) b!14445))

(assert (= (and b!14445 res!11163) b!14448))

(assert (= (or b!14449 b!14445) bm!416))

(assert (= (and start!2148 (is-Cons!423 l!522)) b!14443))

(declare-fun m!9641 () Bool)

(assert (=> b!14447 m!9641))

(declare-fun m!9643 () Bool)

(assert (=> bm!416 m!9643))

(declare-fun m!9645 () Bool)

(assert (=> b!14446 m!9645))

(declare-fun m!9647 () Bool)

(assert (=> b!14446 m!9647))

(declare-fun m!9649 () Bool)

(assert (=> b!14448 m!9649))

(declare-fun m!9651 () Bool)

(assert (=> b!14448 m!9651))

(declare-fun m!9653 () Bool)

(assert (=> start!2148 m!9653))

(declare-fun m!9655 () Bool)

(assert (=> b!14444 m!9655))

(push 1)

(assert (not b!14443))

(assert tp_is_empty!727)

(assert (not b!14447))

(assert (not b!14448))

(assert (not b!14444))

(assert (not b!14446))

(assert (not start!2148))

(assert (not bm!416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2271 () Bool)

(assert (=> d!2271 (= (isEmpty!102 l!522) (is-Nil!424 l!522))))

(assert (=> b!14444 d!2271))

(declare-fun d!2279 () Bool)

(declare-fun res!11220 () Bool)

(declare-fun e!8707 () Bool)

(assert (=> d!2279 (=> res!11220 e!8707)))

(assert (=> d!2279 (= res!11220 (is-Nil!424 lt!3609))))

(assert (=> d!2279 (= (forall!95 lt!3609 lambda!155) e!8707)))

(declare-fun b!14527 () Bool)

(declare-fun e!8708 () Bool)

(assert (=> b!14527 (= e!8707 e!8708)))

(declare-fun res!11221 () Bool)

(assert (=> b!14527 (=> (not res!11221) (not e!8708))))

(declare-fun dynLambda!92 (Int tuple2!544) Bool)

(assert (=> b!14527 (= res!11221 (dynLambda!92 lambda!155 (h!989 lt!3609)))))

(declare-fun b!14528 () Bool)

(assert (=> b!14528 (= e!8708 (forall!95 (t!2826 lt!3609) lambda!155))))

(assert (= (and d!2279 (not res!11220)) b!14527))

(assert (= (and b!14527 res!11221) b!14528))

(declare-fun b_lambda!925 () Bool)

(assert (=> (not b_lambda!925) (not b!14527)))

(declare-fun m!9697 () Bool)

(assert (=> b!14527 m!9697))

(declare-fun m!9701 () Bool)

(assert (=> b!14528 m!9701))

(assert (=> b!14447 d!2279))

(declare-fun d!2285 () Bool)

(assert (=> d!2285 (= (head!791 lt!3609) (h!989 lt!3609))))

(assert (=> b!14448 d!2285))

(declare-fun d!2287 () Bool)

(assert (=> d!2287 (= (head!791 l!522) (h!989 l!522))))

(assert (=> b!14448 d!2287))

(declare-fun d!2289 () Bool)

(assert (=> d!2289 (= (isEmpty!102 lt!3609) (is-Nil!424 lt!3609))))

(assert (=> bm!416 d!2289))

(declare-fun d!2291 () Bool)

(declare-fun res!11228 () Bool)

(declare-fun e!8715 () Bool)

(assert (=> d!2291 (=> res!11228 e!8715)))

(assert (=> d!2291 (= res!11228 (or (is-Nil!424 l!522) (is-Nil!424 (t!2826 l!522))))))

(assert (=> d!2291 (= (isStrictlySorted!114 l!522) e!8715)))

(declare-fun b!14535 () Bool)

(declare-fun e!8716 () Bool)

(assert (=> b!14535 (= e!8715 e!8716)))

(declare-fun res!11229 () Bool)

(assert (=> b!14535 (=> (not res!11229) (not e!8716))))

(assert (=> b!14535 (= res!11229 (bvslt (_1!272 (h!989 l!522)) (_1!272 (h!989 (t!2826 l!522)))))))

(declare-fun b!14536 () Bool)

(assert (=> b!14536 (= e!8716 (isStrictlySorted!114 (t!2826 l!522)))))

(assert (= (and d!2291 (not res!11228)) b!14535))

(assert (= (and b!14535 res!11229) b!14536))

(declare-fun m!9703 () Bool)

(assert (=> b!14536 m!9703))

(assert (=> start!2148 d!2291))

(declare-fun d!2293 () Bool)

(declare-fun res!11230 () Bool)

(declare-fun e!8721 () Bool)

(assert (=> d!2293 (=> res!11230 e!8721)))

(assert (=> d!2293 (= res!11230 (or (is-Nil!424 lt!3609) (is-Nil!424 (t!2826 lt!3609))))))

(assert (=> d!2293 (= (isStrictlySorted!114 lt!3609) e!8721)))

(declare-fun b!14545 () Bool)

(declare-fun e!8722 () Bool)

(assert (=> b!14545 (= e!8721 e!8722)))

(declare-fun res!11231 () Bool)

(assert (=> b!14545 (=> (not res!11231) (not e!8722))))

(assert (=> b!14545 (= res!11231 (bvslt (_1!272 (h!989 lt!3609)) (_1!272 (h!989 (t!2826 lt!3609)))))))

(declare-fun b!14546 () Bool)

(assert (=> b!14546 (= e!8722 (isStrictlySorted!114 (t!2826 lt!3609)))))

(assert (= (and d!2293 (not res!11230)) b!14545))

(assert (= (and b!14545 res!11231) b!14546))

(declare-fun m!9705 () Bool)

(assert (=> b!14546 m!9705))

(assert (=> b!14446 d!2293))

(declare-fun bs!582 () Bool)

(declare-fun b!14630 () Bool)

(assert (= bs!582 (and b!14630 b!14447)))

(declare-fun lambda!170 () Int)

(assert (=> bs!582 (= lambda!170 lambda!155)))

(assert (=> b!14630 true))

(declare-fun bm!439 () Bool)

(declare-fun call!442 () Bool)

(declare-fun lt!3624 () List!427)

(assert (=> bm!439 (= call!442 (isEmpty!102 lt!3624))))

(declare-fun b!14624 () Bool)

(declare-fun e!8771 () Bool)

(assert (=> b!14624 (= e!8771 call!442)))

(declare-fun b!14625 () Bool)

(declare-fun e!8770 () List!427)

(assert (=> b!14625 (= e!8770 Nil!424)))

(declare-fun bm!440 () Bool)

(declare-fun call!443 () List!427)

(assert (=> bm!440 (= call!443 (filterByValue!16 (t!2826 (t!2826 l!522)) value!159))))

(declare-fun b!14626 () Bool)

(assert (=> b!14626 (= e!8770 call!443)))

(declare-fun b!14627 () Bool)

(declare-fun e!8774 () List!427)

(assert (=> b!14627 (= e!8774 e!8770)))

(declare-fun c!1380 () Bool)

(assert (=> b!14627 (= c!1380 (and (is-Cons!423 (t!2826 l!522)) (not (= (_2!272 (h!989 (t!2826 l!522))) value!159))))))

(declare-fun d!2295 () Bool)

(declare-fun e!8772 () Bool)

(assert (=> d!2295 e!8772))

(declare-fun res!11265 () Bool)

(assert (=> d!2295 (=> (not res!11265) (not e!8772))))

(assert (=> d!2295 (= res!11265 (isStrictlySorted!114 lt!3624))))

(assert (=> d!2295 (= lt!3624 e!8774)))

(declare-fun c!1382 () Bool)

(assert (=> d!2295 (= c!1382 (and (is-Cons!423 (t!2826 l!522)) (= (_2!272 (h!989 (t!2826 l!522))) value!159)))))

(assert (=> d!2295 (isStrictlySorted!114 (t!2826 l!522))))

(assert (=> d!2295 (= (filterByValue!16 (t!2826 l!522) value!159) lt!3624)))

(declare-fun b!14628 () Bool)

(declare-fun e!8773 () Bool)

(assert (=> b!14628 (= e!8771 e!8773)))

(declare-fun res!11264 () Bool)

(assert (=> b!14628 (= res!11264 call!442)))

(assert (=> b!14628 (=> res!11264 e!8773)))

(declare-fun b!14629 () Bool)

(assert (=> b!14629 (= e!8773 (bvsge (_1!272 (head!791 lt!3624)) (_1!272 (head!791 (t!2826 l!522)))))))

(declare-fun res!11266 () Bool)

(assert (=> b!14630 (=> (not res!11266) (not e!8772))))

(assert (=> b!14630 (= res!11266 (forall!95 lt!3624 lambda!170))))

(declare-fun b!14631 () Bool)

(declare-fun $colon$colon!23 (List!427 tuple2!544) List!427)

(assert (=> b!14631 (= e!8774 ($colon$colon!23 call!443 (h!989 (t!2826 l!522))))))

(declare-fun b!14632 () Bool)

(assert (=> b!14632 (= e!8772 e!8771)))

(declare-fun c!1381 () Bool)

(assert (=> b!14632 (= c!1381 (isEmpty!102 (t!2826 l!522)))))

(assert (= (and d!2295 c!1382) b!14631))

(assert (= (and d!2295 (not c!1382)) b!14627))

(assert (= (and b!14627 c!1380) b!14626))

(assert (= (and b!14627 (not c!1380)) b!14625))

(assert (= (or b!14631 b!14626) bm!440))

(assert (= (and d!2295 res!11265) b!14630))

(assert (= (and b!14630 res!11266) b!14632))

(assert (= (and b!14632 c!1381) b!14624))

(assert (= (and b!14632 (not c!1381)) b!14628))

(assert (= (and b!14628 (not res!11264)) b!14629))

(assert (= (or b!14624 b!14628) bm!439))

(declare-fun m!9745 () Bool)

(assert (=> b!14630 m!9745))

(declare-fun m!9747 () Bool)

(assert (=> bm!439 m!9747))

(declare-fun m!9749 () Bool)

(assert (=> b!14631 m!9749))

(declare-fun m!9751 () Bool)

(assert (=> bm!440 m!9751))

(declare-fun m!9753 () Bool)

(assert (=> b!14629 m!9753))

(declare-fun m!9755 () Bool)

(assert (=> b!14629 m!9755))

(declare-fun m!9757 () Bool)

(assert (=> b!14632 m!9757))

(declare-fun m!9759 () Bool)

(assert (=> d!2295 m!9759))

(assert (=> d!2295 m!9703))

(assert (=> b!14446 d!2295))

(declare-fun b!14642 () Bool)

(declare-fun e!8780 () Bool)

(declare-fun tp!2357 () Bool)

(assert (=> b!14642 (= e!8780 (and tp_is_empty!727 tp!2357))))

(assert (=> b!14443 (= tp!2342 e!8780)))

(assert (= (and b!14443 (is-Cons!423 (t!2826 l!522))) b!14642))

(declare-fun b_lambda!933 () Bool)

(assert (= b_lambda!925 (or b!14447 b_lambda!933)))

(declare-fun bs!584 () Bool)

(declare-fun d!2313 () Bool)

(assert (= bs!584 (and d!2313 b!14447)))

(assert (=> bs!584 (= (dynLambda!92 lambda!155 (h!989 lt!3609)) (= (_2!272 (h!989 lt!3609)) value!159))))

(assert (=> b!14527 d!2313))

(push 1)

(assert (not b!14546))

(assert (not b!14536))

(assert tp_is_empty!727)

(assert (not b!14630))

(assert (not b_lambda!933))

(assert (not b!14632))

(assert (not b!14642))

(assert (not d!2295))

(assert (not b!14528))

(assert (not bm!439))

(assert (not bm!440))

(assert (not b!14631))

(assert (not b!14629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2341 () Bool)

(assert (=> d!2341 (= (head!791 lt!3624) (h!989 lt!3624))))

(assert (=> b!14629 d!2341))

(declare-fun d!2343 () Bool)

(assert (=> d!2343 (= (head!791 (t!2826 l!522)) (h!989 (t!2826 l!522)))))

(assert (=> b!14629 d!2343))

(declare-fun d!2345 () Bool)

(declare-fun res!11280 () Bool)

(declare-fun e!8797 () Bool)

(assert (=> d!2345 (=> res!11280 e!8797)))

(assert (=> d!2345 (= res!11280 (or (is-Nil!424 (t!2826 lt!3609)) (is-Nil!424 (t!2826 (t!2826 lt!3609)))))))

(assert (=> d!2345 (= (isStrictlySorted!114 (t!2826 lt!3609)) e!8797)))

(declare-fun b!14663 () Bool)

(declare-fun e!8798 () Bool)

(assert (=> b!14663 (= e!8797 e!8798)))

(declare-fun res!11281 () Bool)

(assert (=> b!14663 (=> (not res!11281) (not e!8798))))

(assert (=> b!14663 (= res!11281 (bvslt (_1!272 (h!989 (t!2826 lt!3609))) (_1!272 (h!989 (t!2826 (t!2826 lt!3609))))))))

(declare-fun b!14664 () Bool)

(assert (=> b!14664 (= e!8798 (isStrictlySorted!114 (t!2826 (t!2826 lt!3609))))))

(assert (= (and d!2345 (not res!11280)) b!14663))

(assert (= (and b!14663 res!11281) b!14664))

(declare-fun m!9791 () Bool)

(assert (=> b!14664 m!9791))

(assert (=> b!14546 d!2345))

(declare-fun d!2347 () Bool)

(assert (=> d!2347 (= ($colon$colon!23 call!443 (h!989 (t!2826 l!522))) (Cons!423 (h!989 (t!2826 l!522)) call!443))))

(assert (=> b!14631 d!2347))

(declare-fun bs!589 () Bool)

(declare-fun b!14671 () Bool)

(assert (= bs!589 (and b!14671 b!14447)))

(declare-fun lambda!172 () Int)

(assert (=> bs!589 (= lambda!172 lambda!155)))

(declare-fun bs!590 () Bool)

(assert (= bs!590 (and b!14671 b!14630)))

(assert (=> bs!590 (= lambda!172 lambda!170)))

(assert (=> b!14671 true))

(declare-fun bm!443 () Bool)

(declare-fun call!446 () Bool)

(declare-fun lt!3626 () List!427)

(assert (=> bm!443 (= call!446 (isEmpty!102 lt!3626))))

(declare-fun b!14665 () Bool)

(declare-fun e!8800 () Bool)

(assert (=> b!14665 (= e!8800 call!446)))

(declare-fun b!14666 () Bool)

(declare-fun e!8799 () List!427)

(assert (=> b!14666 (= e!8799 Nil!424)))

(declare-fun bm!444 () Bool)

(declare-fun call!447 () List!427)

(assert (=> bm!444 (= call!447 (filterByValue!16 (t!2826 (t!2826 (t!2826 l!522))) value!159))))

(declare-fun b!14667 () Bool)

(assert (=> b!14667 (= e!8799 call!447)))

(declare-fun b!14668 () Bool)

(declare-fun e!8803 () List!427)

(assert (=> b!14668 (= e!8803 e!8799)))

(declare-fun c!1386 () Bool)

(assert (=> b!14668 (= c!1386 (and (is-Cons!423 (t!2826 (t!2826 l!522))) (not (= (_2!272 (h!989 (t!2826 (t!2826 l!522)))) value!159))))))

(declare-fun d!2349 () Bool)

(declare-fun e!8801 () Bool)

(assert (=> d!2349 e!8801))

(declare-fun res!11283 () Bool)

(assert (=> d!2349 (=> (not res!11283) (not e!8801))))

(assert (=> d!2349 (= res!11283 (isStrictlySorted!114 lt!3626))))

(assert (=> d!2349 (= lt!3626 e!8803)))

(declare-fun c!1388 () Bool)

(assert (=> d!2349 (= c!1388 (and (is-Cons!423 (t!2826 (t!2826 l!522))) (= (_2!272 (h!989 (t!2826 (t!2826 l!522)))) value!159)))))

(assert (=> d!2349 (isStrictlySorted!114 (t!2826 (t!2826 l!522)))))

(assert (=> d!2349 (= (filterByValue!16 (t!2826 (t!2826 l!522)) value!159) lt!3626)))

(declare-fun b!14669 () Bool)

(declare-fun e!8802 () Bool)

(assert (=> b!14669 (= e!8800 e!8802)))

(declare-fun res!11282 () Bool)

(assert (=> b!14669 (= res!11282 call!446)))

(assert (=> b!14669 (=> res!11282 e!8802)))

(declare-fun b!14670 () Bool)

(assert (=> b!14670 (= e!8802 (bvsge (_1!272 (head!791 lt!3626)) (_1!272 (head!791 (t!2826 (t!2826 l!522))))))))

(declare-fun res!11284 () Bool)

(assert (=> b!14671 (=> (not res!11284) (not e!8801))))

(assert (=> b!14671 (= res!11284 (forall!95 lt!3626 lambda!172))))

(declare-fun b!14672 () Bool)

(assert (=> b!14672 (= e!8803 ($colon$colon!23 call!447 (h!989 (t!2826 (t!2826 l!522)))))))

(declare-fun b!14673 () Bool)

(assert (=> b!14673 (= e!8801 e!8800)))

(declare-fun c!1387 () Bool)

(assert (=> b!14673 (= c!1387 (isEmpty!102 (t!2826 (t!2826 l!522))))))

(assert (= (and d!2349 c!1388) b!14672))

(assert (= (and d!2349 (not c!1388)) b!14668))

(assert (= (and b!14668 c!1386) b!14667))

(assert (= (and b!14668 (not c!1386)) b!14666))

(assert (= (or b!14672 b!14667) bm!444))

(assert (= (and d!2349 res!11283) b!14671))

(assert (= (and b!14671 res!11284) b!14673))

(assert (= (and b!14673 c!1387) b!14665))

(assert (= (and b!14673 (not c!1387)) b!14669))

(assert (= (and b!14669 (not res!11282)) b!14670))

(assert (= (or b!14665 b!14669) bm!443))

(declare-fun m!9793 () Bool)

(assert (=> b!14671 m!9793))

(declare-fun m!9795 () Bool)

(assert (=> bm!443 m!9795))

(declare-fun m!9797 () Bool)

(assert (=> b!14672 m!9797))

(declare-fun m!9799 () Bool)

(assert (=> bm!444 m!9799))

(declare-fun m!9801 () Bool)

(assert (=> b!14670 m!9801))

(declare-fun m!9803 () Bool)

(assert (=> b!14670 m!9803))

(declare-fun m!9805 () Bool)

(assert (=> b!14673 m!9805))

(declare-fun m!9807 () Bool)

(assert (=> d!2349 m!9807))

(declare-fun m!9809 () Bool)

(assert (=> d!2349 m!9809))

(assert (=> bm!440 d!2349))

(declare-fun d!2351 () Bool)

(declare-fun res!11285 () Bool)

(declare-fun e!8804 () Bool)

(assert (=> d!2351 (=> res!11285 e!8804)))

(assert (=> d!2351 (= res!11285 (is-Nil!424 lt!3624))))

(assert (=> d!2351 (= (forall!95 lt!3624 lambda!170) e!8804)))

(declare-fun b!14674 () Bool)

(declare-fun e!8805 () Bool)

(assert (=> b!14674 (= e!8804 e!8805)))

(declare-fun res!11286 () Bool)

(assert (=> b!14674 (=> (not res!11286) (not e!8805))))

(assert (=> b!14674 (= res!11286 (dynLambda!92 lambda!170 (h!989 lt!3624)))))

(declare-fun b!14675 () Bool)

(assert (=> b!14675 (= e!8805 (forall!95 (t!2826 lt!3624) lambda!170))))

(assert (= (and d!2351 (not res!11285)) b!14674))

(assert (= (and b!14674 res!11286) b!14675))

(declare-fun b_lambda!943 () Bool)

(assert (=> (not b_lambda!943) (not b!14674)))

(declare-fun m!9811 () Bool)

(assert (=> b!14674 m!9811))

(declare-fun m!9813 () Bool)

(assert (=> b!14675 m!9813))

(assert (=> b!14630 d!2351))

(declare-fun d!2353 () Bool)

(assert (=> d!2353 (= (isEmpty!102 (t!2826 l!522)) (is-Nil!424 (t!2826 l!522)))))

(assert (=> b!14632 d!2353))

(declare-fun d!2355 () Bool)

(declare-fun res!11287 () Bool)

(declare-fun e!8806 () Bool)

(assert (=> d!2355 (=> res!11287 e!8806)))

(assert (=> d!2355 (= res!11287 (is-Nil!424 (t!2826 lt!3609)))))

(assert (=> d!2355 (= (forall!95 (t!2826 lt!3609) lambda!155) e!8806)))

(declare-fun b!14676 () Bool)

(declare-fun e!8807 () Bool)

(assert (=> b!14676 (= e!8806 e!8807)))

(declare-fun res!11288 () Bool)

(assert (=> b!14676 (=> (not res!11288) (not e!8807))))

(assert (=> b!14676 (= res!11288 (dynLambda!92 lambda!155 (h!989 (t!2826 lt!3609))))))

(declare-fun b!14677 () Bool)

(assert (=> b!14677 (= e!8807 (forall!95 (t!2826 (t!2826 lt!3609)) lambda!155))))

(assert (= (and d!2355 (not res!11287)) b!14676))

(assert (= (and b!14676 res!11288) b!14677))

(declare-fun b_lambda!945 () Bool)

(assert (=> (not b_lambda!945) (not b!14676)))

(declare-fun m!9815 () Bool)

(assert (=> b!14676 m!9815))

(declare-fun m!9817 () Bool)

(assert (=> b!14677 m!9817))

(assert (=> b!14528 d!2355))

(declare-fun d!2357 () Bool)

(declare-fun res!11289 () Bool)

(declare-fun e!8808 () Bool)

(assert (=> d!2357 (=> res!11289 e!8808)))

(assert (=> d!2357 (= res!11289 (or (is-Nil!424 lt!3624) (is-Nil!424 (t!2826 lt!3624))))))

(assert (=> d!2357 (= (isStrictlySorted!114 lt!3624) e!8808)))

(declare-fun b!14678 () Bool)

(declare-fun e!8809 () Bool)

(assert (=> b!14678 (= e!8808 e!8809)))

(declare-fun res!11290 () Bool)

(assert (=> b!14678 (=> (not res!11290) (not e!8809))))

(assert (=> b!14678 (= res!11290 (bvslt (_1!272 (h!989 lt!3624)) (_1!272 (h!989 (t!2826 lt!3624)))))))

(declare-fun b!14679 () Bool)

(assert (=> b!14679 (= e!8809 (isStrictlySorted!114 (t!2826 lt!3624)))))

(assert (= (and d!2357 (not res!11289)) b!14678))

(assert (= (and b!14678 res!11290) b!14679))

(declare-fun m!9819 () Bool)

(assert (=> b!14679 m!9819))

(assert (=> d!2295 d!2357))

(declare-fun d!2359 () Bool)

(declare-fun res!11291 () Bool)

(declare-fun e!8810 () Bool)

(assert (=> d!2359 (=> res!11291 e!8810)))

(assert (=> d!2359 (= res!11291 (or (is-Nil!424 (t!2826 l!522)) (is-Nil!424 (t!2826 (t!2826 l!522)))))))

(assert (=> d!2359 (= (isStrictlySorted!114 (t!2826 l!522)) e!8810)))

(declare-fun b!14680 () Bool)

(declare-fun e!8811 () Bool)

(assert (=> b!14680 (= e!8810 e!8811)))

(declare-fun res!11292 () Bool)

(assert (=> b!14680 (=> (not res!11292) (not e!8811))))

(assert (=> b!14680 (= res!11292 (bvslt (_1!272 (h!989 (t!2826 l!522))) (_1!272 (h!989 (t!2826 (t!2826 l!522))))))))

(declare-fun b!14681 () Bool)

(assert (=> b!14681 (= e!8811 (isStrictlySorted!114 (t!2826 (t!2826 l!522))))))

(assert (= (and d!2359 (not res!11291)) b!14680))

(assert (= (and b!14680 res!11292) b!14681))

(assert (=> b!14681 m!9809))

(assert (=> d!2295 d!2359))

(assert (=> b!14536 d!2359))

(declare-fun d!2361 () Bool)

(assert (=> d!2361 (= (isEmpty!102 lt!3624) (is-Nil!424 lt!3624))))

(assert (=> bm!439 d!2361))

(declare-fun b!14682 () Bool)

(declare-fun e!8812 () Bool)

(declare-fun tp!2359 () Bool)

(assert (=> b!14682 (= e!8812 (and tp_is_empty!727 tp!2359))))

(assert (=> b!14642 (= tp!2357 e!8812)))

(assert (= (and b!14642 (is-Cons!423 (t!2826 (t!2826 l!522)))) b!14682))

(declare-fun b_lambda!947 () Bool)

(assert (= b_lambda!945 (or b!14447 b_lambda!947)))

(declare-fun bs!591 () Bool)

(declare-fun d!2363 () Bool)

(assert (= bs!591 (and d!2363 b!14447)))

(assert (=> bs!591 (= (dynLambda!92 lambda!155 (h!989 (t!2826 lt!3609))) (= (_2!272 (h!989 (t!2826 lt!3609))) value!159))))

(assert (=> b!14676 d!2363))

(declare-fun b_lambda!949 () Bool)

(assert (= b_lambda!943 (or b!14630 b_lambda!949)))

(declare-fun bs!592 () Bool)

(declare-fun d!2365 () Bool)

(assert (= bs!592 (and d!2365 b!14630)))

(assert (=> bs!592 (= (dynLambda!92 lambda!170 (h!989 lt!3624)) (= (_2!272 (h!989 lt!3624)) value!159))))

(assert (=> b!14674 d!2365))

(push 1)

(assert (not b!14681))

(assert (not b!14671))

(assert (not b!14673))

(assert (not d!2349))

(assert (not bm!444))

(assert (not bm!443))

(assert (not b!14670))

(assert (not b_lambda!949))

(assert (not b_lambda!947))

(assert (not b!14682))

(assert (not b!14675))

(assert tp_is_empty!727)

(assert (not b!14664))

(assert (not b!14672))

(assert (not b_lambda!933))

(assert (not b!14677))

(assert (not b!14679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

