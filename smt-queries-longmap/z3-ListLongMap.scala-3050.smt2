; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42982 () Bool)

(assert start!42982)

(declare-fun b_free!12109 () Bool)

(declare-fun b_next!12109 () Bool)

(assert (=> start!42982 (= b_free!12109 (not b_next!12109))))

(declare-fun tp!42430 () Bool)

(declare-fun b_and!20793 () Bool)

(assert (=> start!42982 (= tp!42430 b_and!20793)))

(declare-fun b!477447 () Bool)

(declare-fun res!284978 () Bool)

(declare-fun e!280559 () Bool)

(assert (=> b!477447 (=> (not res!284978) (not e!280559))))

(declare-datatypes ((B!1058 0))(
  ( (B!1059 (val!6813 Int)) )
))
(declare-datatypes ((tuple2!9058 0))(
  ( (tuple2!9059 (_1!4540 (_ BitVec 64)) (_2!4540 B!1058)) )
))
(declare-datatypes ((List!9101 0))(
  ( (Nil!9098) (Cons!9097 (h!9953 tuple2!9058) (t!15255 List!9101)) )
))
(declare-datatypes ((ListLongMap!7961 0))(
  ( (ListLongMap!7962 (toList!3996 List!9101)) )
))
(declare-fun lm!215 () ListLongMap!7961)

(declare-fun isEmpty!614 (ListLongMap!7961) Bool)

(assert (=> b!477447 (= res!284978 (isEmpty!614 lm!215))))

(declare-fun b!477449 () Bool)

(declare-fun e!280560 () Bool)

(declare-fun tp!42429 () Bool)

(assert (=> b!477449 (= e!280560 tp!42429)))

(declare-fun res!284980 () Bool)

(declare-fun e!280561 () Bool)

(assert (=> start!42982 (=> (not res!284980) (not e!280561))))

(declare-fun p!166 () Int)

(declare-fun forall!200 (List!9101 Int) Bool)

(assert (=> start!42982 (= res!284980 (forall!200 (toList!3996 lm!215) p!166))))

(assert (=> start!42982 e!280561))

(declare-fun inv!15503 (ListLongMap!7961) Bool)

(assert (=> start!42982 (and (inv!15503 lm!215) e!280560)))

(assert (=> start!42982 tp!42430))

(declare-fun tp_is_empty!13531 () Bool)

(assert (=> start!42982 tp_is_empty!13531))

(assert (=> start!42982 true))

(declare-fun b!477448 () Bool)

(declare-fun lt!217341 () tuple2!9058)

(declare-fun +!1804 (ListLongMap!7961 tuple2!9058) ListLongMap!7961)

(assert (=> b!477448 (= e!280559 (not (forall!200 (toList!3996 (+!1804 lm!215 lt!217341)) p!166)))))

(declare-fun b!477446 () Bool)

(assert (=> b!477446 (= e!280561 e!280559)))

(declare-fun res!284979 () Bool)

(assert (=> b!477446 (=> (not res!284979) (not e!280559))))

(declare-fun dynLambda!950 (Int tuple2!9058) Bool)

(assert (=> b!477446 (= res!284979 (dynLambda!950 p!166 lt!217341))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1058)

(assert (=> b!477446 (= lt!217341 (tuple2!9059 a!501 b!85))))

(assert (= (and start!42982 res!284980) b!477446))

(assert (= (and b!477446 res!284979) b!477447))

(assert (= (and b!477447 res!284978) b!477448))

(assert (= start!42982 b!477449))

(declare-fun b_lambda!10689 () Bool)

(assert (=> (not b_lambda!10689) (not b!477446)))

(declare-fun t!15254 () Bool)

(declare-fun tb!4109 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15254) tb!4109))

(declare-fun result!7677 () Bool)

(assert (=> tb!4109 (= result!7677 true)))

(assert (=> b!477446 t!15254))

(declare-fun b_and!20795 () Bool)

(assert (= b_and!20793 (and (=> t!15254 result!7677) b_and!20795)))

(declare-fun m!459419 () Bool)

(assert (=> b!477447 m!459419))

(declare-fun m!459421 () Bool)

(assert (=> start!42982 m!459421))

(declare-fun m!459423 () Bool)

(assert (=> start!42982 m!459423))

(declare-fun m!459425 () Bool)

(assert (=> b!477448 m!459425))

(declare-fun m!459427 () Bool)

(assert (=> b!477448 m!459427))

(declare-fun m!459429 () Bool)

(assert (=> b!477446 m!459429))

(check-sat (not b!477449) (not b_lambda!10689) (not b!477448) (not b_next!12109) (not start!42982) b_and!20795 (not b!477447) tp_is_empty!13531)
(check-sat b_and!20795 (not b_next!12109))
(get-model)

(declare-fun b_lambda!10699 () Bool)

(assert (= b_lambda!10689 (or (and start!42982 b_free!12109) b_lambda!10699)))

(check-sat (not b!477449) (not b!477448) (not b_next!12109) (not start!42982) b_and!20795 (not b_lambda!10699) (not b!477447) tp_is_empty!13531)
(check-sat b_and!20795 (not b_next!12109))
(get-model)

(declare-fun d!76177 () Bool)

(declare-fun res!285015 () Bool)

(declare-fun e!280596 () Bool)

(assert (=> d!76177 (=> res!285015 e!280596)))

(get-info :version)

(assert (=> d!76177 (= res!285015 ((_ is Nil!9098) (toList!3996 (+!1804 lm!215 lt!217341))))))

(assert (=> d!76177 (= (forall!200 (toList!3996 (+!1804 lm!215 lt!217341)) p!166) e!280596)))

(declare-fun b!477490 () Bool)

(declare-fun e!280597 () Bool)

(assert (=> b!477490 (= e!280596 e!280597)))

(declare-fun res!285016 () Bool)

(assert (=> b!477490 (=> (not res!285016) (not e!280597))))

(assert (=> b!477490 (= res!285016 (dynLambda!950 p!166 (h!9953 (toList!3996 (+!1804 lm!215 lt!217341)))))))

(declare-fun b!477491 () Bool)

(assert (=> b!477491 (= e!280597 (forall!200 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341))) p!166))))

(assert (= (and d!76177 (not res!285015)) b!477490))

(assert (= (and b!477490 res!285016) b!477491))

(declare-fun b_lambda!10705 () Bool)

(assert (=> (not b_lambda!10705) (not b!477490)))

(declare-fun t!15267 () Bool)

(declare-fun tb!4119 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15267) tb!4119))

(declare-fun result!7687 () Bool)

(assert (=> tb!4119 (= result!7687 true)))

(assert (=> b!477490 t!15267))

(declare-fun b_and!20809 () Bool)

(assert (= b_and!20795 (and (=> t!15267 result!7687) b_and!20809)))

(declare-fun m!459463 () Bool)

(assert (=> b!477490 m!459463))

(declare-fun m!459465 () Bool)

(assert (=> b!477491 m!459465))

(assert (=> b!477448 d!76177))

(declare-fun d!76179 () Bool)

(declare-fun e!280613 () Bool)

(assert (=> d!76179 e!280613))

(declare-fun res!285037 () Bool)

(assert (=> d!76179 (=> (not res!285037) (not e!280613))))

(declare-fun lt!217383 () ListLongMap!7961)

(declare-fun contains!2567 (ListLongMap!7961 (_ BitVec 64)) Bool)

(assert (=> d!76179 (= res!285037 (contains!2567 lt!217383 (_1!4540 lt!217341)))))

(declare-fun lt!217382 () List!9101)

(assert (=> d!76179 (= lt!217383 (ListLongMap!7962 lt!217382))))

(declare-datatypes ((Unit!14033 0))(
  ( (Unit!14034) )
))
(declare-fun lt!217381 () Unit!14033)

(declare-fun lt!217380 () Unit!14033)

(assert (=> d!76179 (= lt!217381 lt!217380)))

(declare-datatypes ((Option!395 0))(
  ( (Some!394 (v!9094 B!1058)) (None!393) )
))
(declare-fun getValueByKey!389 (List!9101 (_ BitVec 64)) Option!395)

(assert (=> d!76179 (= (getValueByKey!389 lt!217382 (_1!4540 lt!217341)) (Some!394 (_2!4540 lt!217341)))))

(declare-fun lemmaContainsTupThenGetReturnValue!214 (List!9101 (_ BitVec 64) B!1058) Unit!14033)

(assert (=> d!76179 (= lt!217380 (lemmaContainsTupThenGetReturnValue!214 lt!217382 (_1!4540 lt!217341) (_2!4540 lt!217341)))))

(declare-fun insertStrictlySorted!217 (List!9101 (_ BitVec 64) B!1058) List!9101)

(assert (=> d!76179 (= lt!217382 (insertStrictlySorted!217 (toList!3996 lm!215) (_1!4540 lt!217341) (_2!4540 lt!217341)))))

(assert (=> d!76179 (= (+!1804 lm!215 lt!217341) lt!217383)))

(declare-fun b!477517 () Bool)

(declare-fun res!285038 () Bool)

(assert (=> b!477517 (=> (not res!285038) (not e!280613))))

(assert (=> b!477517 (= res!285038 (= (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341)) (Some!394 (_2!4540 lt!217341))))))

(declare-fun b!477518 () Bool)

(declare-fun contains!2570 (List!9101 tuple2!9058) Bool)

(assert (=> b!477518 (= e!280613 (contains!2570 (toList!3996 lt!217383) lt!217341))))

(assert (= (and d!76179 res!285037) b!477517))

(assert (= (and b!477517 res!285038) b!477518))

(declare-fun m!459503 () Bool)

(assert (=> d!76179 m!459503))

(declare-fun m!459505 () Bool)

(assert (=> d!76179 m!459505))

(declare-fun m!459509 () Bool)

(assert (=> d!76179 m!459509))

(declare-fun m!459511 () Bool)

(assert (=> d!76179 m!459511))

(declare-fun m!459513 () Bool)

(assert (=> b!477517 m!459513))

(declare-fun m!459515 () Bool)

(assert (=> b!477518 m!459515))

(assert (=> b!477448 d!76179))

(declare-fun d!76193 () Bool)

(declare-fun res!285039 () Bool)

(declare-fun e!280614 () Bool)

(assert (=> d!76193 (=> res!285039 e!280614)))

(assert (=> d!76193 (= res!285039 ((_ is Nil!9098) (toList!3996 lm!215)))))

(assert (=> d!76193 (= (forall!200 (toList!3996 lm!215) p!166) e!280614)))

(declare-fun b!477519 () Bool)

(declare-fun e!280615 () Bool)

(assert (=> b!477519 (= e!280614 e!280615)))

(declare-fun res!285040 () Bool)

(assert (=> b!477519 (=> (not res!285040) (not e!280615))))

(assert (=> b!477519 (= res!285040 (dynLambda!950 p!166 (h!9953 (toList!3996 lm!215))))))

(declare-fun b!477520 () Bool)

(assert (=> b!477520 (= e!280615 (forall!200 (t!15255 (toList!3996 lm!215)) p!166))))

(assert (= (and d!76193 (not res!285039)) b!477519))

(assert (= (and b!477519 res!285040) b!477520))

(declare-fun b_lambda!10715 () Bool)

(assert (=> (not b_lambda!10715) (not b!477519)))

(declare-fun t!15273 () Bool)

(declare-fun tb!4125 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15273) tb!4125))

(declare-fun result!7695 () Bool)

(assert (=> tb!4125 (= result!7695 true)))

(assert (=> b!477519 t!15273))

(declare-fun b_and!20815 () Bool)

(assert (= b_and!20809 (and (=> t!15273 result!7695) b_and!20815)))

(declare-fun m!459517 () Bool)

(assert (=> b!477519 m!459517))

(declare-fun m!459519 () Bool)

(assert (=> b!477520 m!459519))

(assert (=> start!42982 d!76193))

(declare-fun d!76195 () Bool)

(declare-fun isStrictlySorted!387 (List!9101) Bool)

(assert (=> d!76195 (= (inv!15503 lm!215) (isStrictlySorted!387 (toList!3996 lm!215)))))

(declare-fun bs!15160 () Bool)

(assert (= bs!15160 d!76195))

(declare-fun m!459523 () Bool)

(assert (=> bs!15160 m!459523))

(assert (=> start!42982 d!76195))

(declare-fun d!76197 () Bool)

(declare-fun isEmpty!618 (List!9101) Bool)

(assert (=> d!76197 (= (isEmpty!614 lm!215) (isEmpty!618 (toList!3996 lm!215)))))

(declare-fun bs!15161 () Bool)

(assert (= bs!15161 d!76197))

(declare-fun m!459525 () Bool)

(assert (=> bs!15161 m!459525))

(assert (=> b!477447 d!76197))

(declare-fun b!477530 () Bool)

(declare-fun e!280621 () Bool)

(declare-fun tp!42451 () Bool)

(assert (=> b!477530 (= e!280621 (and tp_is_empty!13531 tp!42451))))

(assert (=> b!477449 (= tp!42429 e!280621)))

(assert (= (and b!477449 ((_ is Cons!9097) (toList!3996 lm!215))) b!477530))

(declare-fun b_lambda!10721 () Bool)

(assert (= b_lambda!10705 (or (and start!42982 b_free!12109) b_lambda!10721)))

(declare-fun b_lambda!10723 () Bool)

(assert (= b_lambda!10715 (or (and start!42982 b_free!12109) b_lambda!10723)))

(check-sat (not b!477530) (not b_next!12109) (not d!76179) tp_is_empty!13531 (not b!477491) (not d!76195) (not d!76197) (not b!477520) (not b_lambda!10699) (not b!477517) (not b_lambda!10721) (not b!477518) (not b_lambda!10723) b_and!20815)
(check-sat b_and!20815 (not b_next!12109))
(get-model)

(declare-fun d!76199 () Bool)

(declare-fun res!285045 () Bool)

(declare-fun e!280626 () Bool)

(assert (=> d!76199 (=> res!285045 e!280626)))

(assert (=> d!76199 (= res!285045 (or ((_ is Nil!9098) (toList!3996 lm!215)) ((_ is Nil!9098) (t!15255 (toList!3996 lm!215)))))))

(assert (=> d!76199 (= (isStrictlySorted!387 (toList!3996 lm!215)) e!280626)))

(declare-fun b!477535 () Bool)

(declare-fun e!280627 () Bool)

(assert (=> b!477535 (= e!280626 e!280627)))

(declare-fun res!285046 () Bool)

(assert (=> b!477535 (=> (not res!285046) (not e!280627))))

(assert (=> b!477535 (= res!285046 (bvslt (_1!4540 (h!9953 (toList!3996 lm!215))) (_1!4540 (h!9953 (t!15255 (toList!3996 lm!215))))))))

(declare-fun b!477536 () Bool)

(assert (=> b!477536 (= e!280627 (isStrictlySorted!387 (t!15255 (toList!3996 lm!215))))))

(assert (= (and d!76199 (not res!285045)) b!477535))

(assert (= (and b!477535 res!285046) b!477536))

(declare-fun m!459527 () Bool)

(assert (=> b!477536 m!459527))

(assert (=> d!76195 d!76199))

(declare-fun d!76203 () Bool)

(declare-fun res!285047 () Bool)

(declare-fun e!280628 () Bool)

(assert (=> d!76203 (=> res!285047 e!280628)))

(assert (=> d!76203 (= res!285047 ((_ is Nil!9098) (t!15255 (toList!3996 (+!1804 lm!215 lt!217341)))))))

(assert (=> d!76203 (= (forall!200 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341))) p!166) e!280628)))

(declare-fun b!477537 () Bool)

(declare-fun e!280629 () Bool)

(assert (=> b!477537 (= e!280628 e!280629)))

(declare-fun res!285048 () Bool)

(assert (=> b!477537 (=> (not res!285048) (not e!280629))))

(assert (=> b!477537 (= res!285048 (dynLambda!950 p!166 (h!9953 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341))))))))

(declare-fun b!477538 () Bool)

(assert (=> b!477538 (= e!280629 (forall!200 (t!15255 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341)))) p!166))))

(assert (= (and d!76203 (not res!285047)) b!477537))

(assert (= (and b!477537 res!285048) b!477538))

(declare-fun b_lambda!10725 () Bool)

(assert (=> (not b_lambda!10725) (not b!477537)))

(declare-fun t!15275 () Bool)

(declare-fun tb!4127 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15275) tb!4127))

(declare-fun result!7701 () Bool)

(assert (=> tb!4127 (= result!7701 true)))

(assert (=> b!477537 t!15275))

(declare-fun b_and!20817 () Bool)

(assert (= b_and!20815 (and (=> t!15275 result!7701) b_and!20817)))

(declare-fun m!459529 () Bool)

(assert (=> b!477537 m!459529))

(declare-fun m!459531 () Bool)

(assert (=> b!477538 m!459531))

(assert (=> b!477491 d!76203))

(declare-fun d!76205 () Bool)

(declare-fun e!280647 () Bool)

(assert (=> d!76205 e!280647))

(declare-fun res!285057 () Bool)

(assert (=> d!76205 (=> res!285057 e!280647)))

(declare-fun lt!217394 () Bool)

(assert (=> d!76205 (= res!285057 (not lt!217394))))

(declare-fun lt!217395 () Bool)

(assert (=> d!76205 (= lt!217394 lt!217395)))

(declare-fun lt!217397 () Unit!14033)

(declare-fun e!280646 () Unit!14033)

(assert (=> d!76205 (= lt!217397 e!280646)))

(declare-fun c!57494 () Bool)

(assert (=> d!76205 (= c!57494 lt!217395)))

(declare-fun containsKey!349 (List!9101 (_ BitVec 64)) Bool)

(assert (=> d!76205 (= lt!217395 (containsKey!349 (toList!3996 lt!217383) (_1!4540 lt!217341)))))

(assert (=> d!76205 (= (contains!2567 lt!217383 (_1!4540 lt!217341)) lt!217394)))

(declare-fun b!477563 () Bool)

(declare-fun lt!217396 () Unit!14033)

(assert (=> b!477563 (= e!280646 lt!217396)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!298 (List!9101 (_ BitVec 64)) Unit!14033)

(assert (=> b!477563 (= lt!217396 (lemmaContainsKeyImpliesGetValueByKeyDefined!298 (toList!3996 lt!217383) (_1!4540 lt!217341)))))

(declare-fun isDefined!299 (Option!395) Bool)

(assert (=> b!477563 (isDefined!299 (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341)))))

(declare-fun b!477564 () Bool)

(declare-fun Unit!14035 () Unit!14033)

(assert (=> b!477564 (= e!280646 Unit!14035)))

(declare-fun b!477565 () Bool)

(assert (=> b!477565 (= e!280647 (isDefined!299 (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341))))))

(assert (= (and d!76205 c!57494) b!477563))

(assert (= (and d!76205 (not c!57494)) b!477564))

(assert (= (and d!76205 (not res!285057)) b!477565))

(declare-fun m!459537 () Bool)

(assert (=> d!76205 m!459537))

(declare-fun m!459539 () Bool)

(assert (=> b!477563 m!459539))

(assert (=> b!477563 m!459513))

(assert (=> b!477563 m!459513))

(declare-fun m!459541 () Bool)

(assert (=> b!477563 m!459541))

(assert (=> b!477565 m!459513))

(assert (=> b!477565 m!459513))

(assert (=> b!477565 m!459541))

(assert (=> d!76179 d!76205))

(declare-fun b!477588 () Bool)

(declare-fun e!280666 () Option!395)

(assert (=> b!477588 (= e!280666 (Some!394 (_2!4540 (h!9953 lt!217382))))))

(declare-fun d!76213 () Bool)

(declare-fun c!57499 () Bool)

(assert (=> d!76213 (= c!57499 (and ((_ is Cons!9097) lt!217382) (= (_1!4540 (h!9953 lt!217382)) (_1!4540 lt!217341))))))

(assert (=> d!76213 (= (getValueByKey!389 lt!217382 (_1!4540 lt!217341)) e!280666)))

(declare-fun b!477589 () Bool)

(declare-fun e!280667 () Option!395)

(assert (=> b!477589 (= e!280666 e!280667)))

(declare-fun c!57500 () Bool)

(assert (=> b!477589 (= c!57500 (and ((_ is Cons!9097) lt!217382) (not (= (_1!4540 (h!9953 lt!217382)) (_1!4540 lt!217341)))))))

(declare-fun b!477591 () Bool)

(assert (=> b!477591 (= e!280667 None!393)))

(declare-fun b!477590 () Bool)

(assert (=> b!477590 (= e!280667 (getValueByKey!389 (t!15255 lt!217382) (_1!4540 lt!217341)))))

(assert (= (and d!76213 c!57499) b!477588))

(assert (= (and d!76213 (not c!57499)) b!477589))

(assert (= (and b!477589 c!57500) b!477590))

(assert (= (and b!477589 (not c!57500)) b!477591))

(declare-fun m!459559 () Bool)

(assert (=> b!477590 m!459559))

(assert (=> d!76179 d!76213))

(declare-fun d!76223 () Bool)

(assert (=> d!76223 (= (getValueByKey!389 lt!217382 (_1!4540 lt!217341)) (Some!394 (_2!4540 lt!217341)))))

(declare-fun lt!217420 () Unit!14033)

(declare-fun choose!1377 (List!9101 (_ BitVec 64) B!1058) Unit!14033)

(assert (=> d!76223 (= lt!217420 (choose!1377 lt!217382 (_1!4540 lt!217341) (_2!4540 lt!217341)))))

(declare-fun e!280676 () Bool)

(assert (=> d!76223 e!280676))

(declare-fun res!285078 () Bool)

(assert (=> d!76223 (=> (not res!285078) (not e!280676))))

(assert (=> d!76223 (= res!285078 (isStrictlySorted!387 lt!217382))))

(assert (=> d!76223 (= (lemmaContainsTupThenGetReturnValue!214 lt!217382 (_1!4540 lt!217341) (_2!4540 lt!217341)) lt!217420)))

(declare-fun b!477606 () Bool)

(declare-fun res!285079 () Bool)

(assert (=> b!477606 (=> (not res!285079) (not e!280676))))

(assert (=> b!477606 (= res!285079 (containsKey!349 lt!217382 (_1!4540 lt!217341)))))

(declare-fun b!477607 () Bool)

(assert (=> b!477607 (= e!280676 (contains!2570 lt!217382 (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(assert (= (and d!76223 res!285078) b!477606))

(assert (= (and b!477606 res!285079) b!477607))

(assert (=> d!76223 m!459505))

(declare-fun m!459561 () Bool)

(assert (=> d!76223 m!459561))

(declare-fun m!459563 () Bool)

(assert (=> d!76223 m!459563))

(declare-fun m!459565 () Bool)

(assert (=> b!477606 m!459565))

(declare-fun m!459567 () Bool)

(assert (=> b!477607 m!459567))

(assert (=> d!76179 d!76223))

(declare-fun b!477664 () Bool)

(declare-fun res!285101 () Bool)

(declare-fun e!280711 () Bool)

(assert (=> b!477664 (=> (not res!285101) (not e!280711))))

(declare-fun lt!217437 () List!9101)

(assert (=> b!477664 (= res!285101 (containsKey!349 lt!217437 (_1!4540 lt!217341)))))

(declare-fun bm!30772 () Bool)

(declare-fun call!30776 () List!9101)

(declare-fun e!280709 () List!9101)

(declare-fun c!57526 () Bool)

(declare-fun $colon$colon!112 (List!9101 tuple2!9058) List!9101)

(assert (=> bm!30772 (= call!30776 ($colon$colon!112 e!280709 (ite c!57526 (h!9953 (toList!3996 lm!215)) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341)))))))

(declare-fun c!57523 () Bool)

(assert (=> bm!30772 (= c!57523 c!57526)))

(declare-fun d!76225 () Bool)

(assert (=> d!76225 e!280711))

(declare-fun res!285100 () Bool)

(assert (=> d!76225 (=> (not res!285100) (not e!280711))))

(assert (=> d!76225 (= res!285100 (isStrictlySorted!387 lt!217437))))

(declare-fun e!280707 () List!9101)

(assert (=> d!76225 (= lt!217437 e!280707)))

(assert (=> d!76225 (= c!57526 (and ((_ is Cons!9097) (toList!3996 lm!215)) (bvslt (_1!4540 (h!9953 (toList!3996 lm!215))) (_1!4540 lt!217341))))))

(assert (=> d!76225 (isStrictlySorted!387 (toList!3996 lm!215))))

(assert (=> d!76225 (= (insertStrictlySorted!217 (toList!3996 lm!215) (_1!4540 lt!217341) (_2!4540 lt!217341)) lt!217437)))

(declare-fun b!477665 () Bool)

(declare-fun e!280708 () List!9101)

(declare-fun call!30775 () List!9101)

(assert (=> b!477665 (= e!280708 call!30775)))

(declare-fun b!477666 () Bool)

(declare-fun e!280710 () List!9101)

(declare-fun call!30777 () List!9101)

(assert (=> b!477666 (= e!280710 call!30777)))

(declare-fun bm!30773 () Bool)

(assert (=> bm!30773 (= call!30775 call!30777)))

(declare-fun b!477667 () Bool)

(assert (=> b!477667 (= e!280711 (contains!2570 lt!217437 (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(declare-fun b!477668 () Bool)

(assert (=> b!477668 (= e!280707 call!30776)))

(declare-fun b!477669 () Bool)

(assert (=> b!477669 (= e!280709 (insertStrictlySorted!217 (t!15255 (toList!3996 lm!215)) (_1!4540 lt!217341) (_2!4540 lt!217341)))))

(declare-fun b!477670 () Bool)

(assert (=> b!477670 (= e!280707 e!280710)))

(declare-fun c!57525 () Bool)

(assert (=> b!477670 (= c!57525 (and ((_ is Cons!9097) (toList!3996 lm!215)) (= (_1!4540 (h!9953 (toList!3996 lm!215))) (_1!4540 lt!217341))))))

(declare-fun b!477671 () Bool)

(assert (=> b!477671 (= e!280708 call!30775)))

(declare-fun bm!30774 () Bool)

(assert (=> bm!30774 (= call!30777 call!30776)))

(declare-fun b!477672 () Bool)

(declare-fun c!57524 () Bool)

(assert (=> b!477672 (= e!280709 (ite c!57525 (t!15255 (toList!3996 lm!215)) (ite c!57524 (Cons!9097 (h!9953 (toList!3996 lm!215)) (t!15255 (toList!3996 lm!215))) Nil!9098)))))

(declare-fun b!477673 () Bool)

(assert (=> b!477673 (= c!57524 (and ((_ is Cons!9097) (toList!3996 lm!215)) (bvsgt (_1!4540 (h!9953 (toList!3996 lm!215))) (_1!4540 lt!217341))))))

(assert (=> b!477673 (= e!280710 e!280708)))

(assert (= (and d!76225 c!57526) b!477668))

(assert (= (and d!76225 (not c!57526)) b!477670))

(assert (= (and b!477670 c!57525) b!477666))

(assert (= (and b!477670 (not c!57525)) b!477673))

(assert (= (and b!477673 c!57524) b!477671))

(assert (= (and b!477673 (not c!57524)) b!477665))

(assert (= (or b!477671 b!477665) bm!30773))

(assert (= (or b!477666 bm!30773) bm!30774))

(assert (= (or b!477668 bm!30774) bm!30772))

(assert (= (and bm!30772 c!57523) b!477669))

(assert (= (and bm!30772 (not c!57523)) b!477672))

(assert (= (and d!76225 res!285100) b!477664))

(assert (= (and b!477664 res!285101) b!477667))

(declare-fun m!459601 () Bool)

(assert (=> b!477664 m!459601))

(declare-fun m!459603 () Bool)

(assert (=> b!477667 m!459603))

(declare-fun m!459605 () Bool)

(assert (=> bm!30772 m!459605))

(declare-fun m!459607 () Bool)

(assert (=> d!76225 m!459607))

(assert (=> d!76225 m!459523))

(declare-fun m!459609 () Bool)

(assert (=> b!477669 m!459609))

(assert (=> d!76179 d!76225))

(declare-fun b!477686 () Bool)

(declare-fun e!280718 () Option!395)

(assert (=> b!477686 (= e!280718 (Some!394 (_2!4540 (h!9953 (toList!3996 lt!217383)))))))

(declare-fun d!76239 () Bool)

(declare-fun c!57533 () Bool)

(assert (=> d!76239 (= c!57533 (and ((_ is Cons!9097) (toList!3996 lt!217383)) (= (_1!4540 (h!9953 (toList!3996 lt!217383))) (_1!4540 lt!217341))))))

(assert (=> d!76239 (= (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341)) e!280718)))

(declare-fun b!477687 () Bool)

(declare-fun e!280719 () Option!395)

(assert (=> b!477687 (= e!280718 e!280719)))

(declare-fun c!57534 () Bool)

(assert (=> b!477687 (= c!57534 (and ((_ is Cons!9097) (toList!3996 lt!217383)) (not (= (_1!4540 (h!9953 (toList!3996 lt!217383))) (_1!4540 lt!217341)))))))

(declare-fun b!477689 () Bool)

(assert (=> b!477689 (= e!280719 None!393)))

(declare-fun b!477688 () Bool)

(assert (=> b!477688 (= e!280719 (getValueByKey!389 (t!15255 (toList!3996 lt!217383)) (_1!4540 lt!217341)))))

(assert (= (and d!76239 c!57533) b!477686))

(assert (= (and d!76239 (not c!57533)) b!477687))

(assert (= (and b!477687 c!57534) b!477688))

(assert (= (and b!477687 (not c!57534)) b!477689))

(declare-fun m!459611 () Bool)

(assert (=> b!477688 m!459611))

(assert (=> b!477517 d!76239))

(declare-fun d!76241 () Bool)

(declare-fun res!285102 () Bool)

(declare-fun e!280720 () Bool)

(assert (=> d!76241 (=> res!285102 e!280720)))

(assert (=> d!76241 (= res!285102 ((_ is Nil!9098) (t!15255 (toList!3996 lm!215))))))

(assert (=> d!76241 (= (forall!200 (t!15255 (toList!3996 lm!215)) p!166) e!280720)))

(declare-fun b!477690 () Bool)

(declare-fun e!280721 () Bool)

(assert (=> b!477690 (= e!280720 e!280721)))

(declare-fun res!285103 () Bool)

(assert (=> b!477690 (=> (not res!285103) (not e!280721))))

(assert (=> b!477690 (= res!285103 (dynLambda!950 p!166 (h!9953 (t!15255 (toList!3996 lm!215)))))))

(declare-fun b!477691 () Bool)

(assert (=> b!477691 (= e!280721 (forall!200 (t!15255 (t!15255 (toList!3996 lm!215))) p!166))))

(assert (= (and d!76241 (not res!285102)) b!477690))

(assert (= (and b!477690 res!285103) b!477691))

(declare-fun b_lambda!10729 () Bool)

(assert (=> (not b_lambda!10729) (not b!477690)))

(declare-fun t!15279 () Bool)

(declare-fun tb!4131 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15279) tb!4131))

(declare-fun result!7705 () Bool)

(assert (=> tb!4131 (= result!7705 true)))

(assert (=> b!477690 t!15279))

(declare-fun b_and!20821 () Bool)

(assert (= b_and!20817 (and (=> t!15279 result!7705) b_and!20821)))

(declare-fun m!459613 () Bool)

(assert (=> b!477690 m!459613))

(declare-fun m!459615 () Bool)

(assert (=> b!477691 m!459615))

(assert (=> b!477520 d!76241))

(declare-fun d!76243 () Bool)

(declare-fun lt!217444 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!212 (List!9101) (InoxSet tuple2!9058))

(assert (=> d!76243 (= lt!217444 (select (content!212 (toList!3996 lt!217383)) lt!217341))))

(declare-fun e!280738 () Bool)

(assert (=> d!76243 (= lt!217444 e!280738)))

(declare-fun res!285112 () Bool)

(assert (=> d!76243 (=> (not res!285112) (not e!280738))))

(assert (=> d!76243 (= res!285112 ((_ is Cons!9097) (toList!3996 lt!217383)))))

(assert (=> d!76243 (= (contains!2570 (toList!3996 lt!217383) lt!217341) lt!217444)))

(declare-fun b!477720 () Bool)

(declare-fun e!280739 () Bool)

(assert (=> b!477720 (= e!280738 e!280739)))

(declare-fun res!285113 () Bool)

(assert (=> b!477720 (=> res!285113 e!280739)))

(assert (=> b!477720 (= res!285113 (= (h!9953 (toList!3996 lt!217383)) lt!217341))))

(declare-fun b!477721 () Bool)

(assert (=> b!477721 (= e!280739 (contains!2570 (t!15255 (toList!3996 lt!217383)) lt!217341))))

(assert (= (and d!76243 res!285112) b!477720))

(assert (= (and b!477720 (not res!285113)) b!477721))

(declare-fun m!459617 () Bool)

(assert (=> d!76243 m!459617))

(declare-fun m!459619 () Bool)

(assert (=> d!76243 m!459619))

(declare-fun m!459621 () Bool)

(assert (=> b!477721 m!459621))

(assert (=> b!477518 d!76243))

(declare-fun d!76245 () Bool)

(assert (=> d!76245 (= (isEmpty!618 (toList!3996 lm!215)) ((_ is Nil!9098) (toList!3996 lm!215)))))

(assert (=> d!76197 d!76245))

(declare-fun b!477726 () Bool)

(declare-fun e!280742 () Bool)

(declare-fun tp!42452 () Bool)

(assert (=> b!477726 (= e!280742 (and tp_is_empty!13531 tp!42452))))

(assert (=> b!477530 (= tp!42451 e!280742)))

(assert (= (and b!477530 ((_ is Cons!9097) (t!15255 (toList!3996 lm!215)))) b!477726))

(declare-fun b_lambda!10731 () Bool)

(assert (= b_lambda!10725 (or (and start!42982 b_free!12109) b_lambda!10731)))

(declare-fun b_lambda!10733 () Bool)

(assert (= b_lambda!10729 (or (and start!42982 b_free!12109) b_lambda!10733)))

(check-sat (not b_next!12109) (not b!477669) (not d!76205) (not b!477721) (not b!477688) (not b_lambda!10723) (not b_lambda!10699) (not b_lambda!10721) (not b!477607) (not bm!30772) (not b!477726) (not b!477536) (not b!477664) (not b!477563) (not b!477565) tp_is_empty!13531 (not b!477691) (not b!477606) (not b_lambda!10733) (not b!477590) (not d!76225) (not b_lambda!10731) (not d!76223) (not d!76243) (not b!477667) (not b!477538) b_and!20821)
(check-sat b_and!20821 (not b_next!12109))
(get-model)

(declare-fun d!76259 () Bool)

(declare-fun res!285138 () Bool)

(declare-fun e!280773 () Bool)

(assert (=> d!76259 (=> res!285138 e!280773)))

(assert (=> d!76259 (= res!285138 (and ((_ is Cons!9097) lt!217437) (= (_1!4540 (h!9953 lt!217437)) (_1!4540 lt!217341))))))

(assert (=> d!76259 (= (containsKey!349 lt!217437 (_1!4540 lt!217341)) e!280773)))

(declare-fun b!477769 () Bool)

(declare-fun e!280774 () Bool)

(assert (=> b!477769 (= e!280773 e!280774)))

(declare-fun res!285139 () Bool)

(assert (=> b!477769 (=> (not res!285139) (not e!280774))))

(assert (=> b!477769 (= res!285139 (and (or (not ((_ is Cons!9097) lt!217437)) (bvsle (_1!4540 (h!9953 lt!217437)) (_1!4540 lt!217341))) ((_ is Cons!9097) lt!217437) (bvslt (_1!4540 (h!9953 lt!217437)) (_1!4540 lt!217341))))))

(declare-fun b!477770 () Bool)

(assert (=> b!477770 (= e!280774 (containsKey!349 (t!15255 lt!217437) (_1!4540 lt!217341)))))

(assert (= (and d!76259 (not res!285138)) b!477769))

(assert (= (and b!477769 res!285139) b!477770))

(declare-fun m!459659 () Bool)

(assert (=> b!477770 m!459659))

(assert (=> b!477664 d!76259))

(declare-fun b!477771 () Bool)

(declare-fun e!280775 () Option!395)

(assert (=> b!477771 (= e!280775 (Some!394 (_2!4540 (h!9953 (t!15255 (toList!3996 lt!217383))))))))

(declare-fun d!76261 () Bool)

(declare-fun c!57555 () Bool)

(assert (=> d!76261 (= c!57555 (and ((_ is Cons!9097) (t!15255 (toList!3996 lt!217383))) (= (_1!4540 (h!9953 (t!15255 (toList!3996 lt!217383)))) (_1!4540 lt!217341))))))

(assert (=> d!76261 (= (getValueByKey!389 (t!15255 (toList!3996 lt!217383)) (_1!4540 lt!217341)) e!280775)))

(declare-fun b!477772 () Bool)

(declare-fun e!280776 () Option!395)

(assert (=> b!477772 (= e!280775 e!280776)))

(declare-fun c!57556 () Bool)

(assert (=> b!477772 (= c!57556 (and ((_ is Cons!9097) (t!15255 (toList!3996 lt!217383))) (not (= (_1!4540 (h!9953 (t!15255 (toList!3996 lt!217383)))) (_1!4540 lt!217341)))))))

(declare-fun b!477774 () Bool)

(assert (=> b!477774 (= e!280776 None!393)))

(declare-fun b!477773 () Bool)

(assert (=> b!477773 (= e!280776 (getValueByKey!389 (t!15255 (t!15255 (toList!3996 lt!217383))) (_1!4540 lt!217341)))))

(assert (= (and d!76261 c!57555) b!477771))

(assert (= (and d!76261 (not c!57555)) b!477772))

(assert (= (and b!477772 c!57556) b!477773))

(assert (= (and b!477772 (not c!57556)) b!477774))

(declare-fun m!459661 () Bool)

(assert (=> b!477773 m!459661))

(assert (=> b!477688 d!76261))

(declare-fun b!477775 () Bool)

(declare-fun e!280777 () Option!395)

(assert (=> b!477775 (= e!280777 (Some!394 (_2!4540 (h!9953 (t!15255 lt!217382)))))))

(declare-fun d!76263 () Bool)

(declare-fun c!57557 () Bool)

(assert (=> d!76263 (= c!57557 (and ((_ is Cons!9097) (t!15255 lt!217382)) (= (_1!4540 (h!9953 (t!15255 lt!217382))) (_1!4540 lt!217341))))))

(assert (=> d!76263 (= (getValueByKey!389 (t!15255 lt!217382) (_1!4540 lt!217341)) e!280777)))

(declare-fun b!477776 () Bool)

(declare-fun e!280778 () Option!395)

(assert (=> b!477776 (= e!280777 e!280778)))

(declare-fun c!57558 () Bool)

(assert (=> b!477776 (= c!57558 (and ((_ is Cons!9097) (t!15255 lt!217382)) (not (= (_1!4540 (h!9953 (t!15255 lt!217382))) (_1!4540 lt!217341)))))))

(declare-fun b!477778 () Bool)

(assert (=> b!477778 (= e!280778 None!393)))

(declare-fun b!477777 () Bool)

(assert (=> b!477777 (= e!280778 (getValueByKey!389 (t!15255 (t!15255 lt!217382)) (_1!4540 lt!217341)))))

(assert (= (and d!76263 c!57557) b!477775))

(assert (= (and d!76263 (not c!57557)) b!477776))

(assert (= (and b!477776 c!57558) b!477777))

(assert (= (and b!477776 (not c!57558)) b!477778))

(declare-fun m!459663 () Bool)

(assert (=> b!477777 m!459663))

(assert (=> b!477590 d!76263))

(declare-fun d!76265 () Bool)

(declare-fun res!285140 () Bool)

(declare-fun e!280779 () Bool)

(assert (=> d!76265 (=> res!285140 e!280779)))

(assert (=> d!76265 (= res!285140 ((_ is Nil!9098) (t!15255 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341))))))))

(assert (=> d!76265 (= (forall!200 (t!15255 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341)))) p!166) e!280779)))

(declare-fun b!477779 () Bool)

(declare-fun e!280780 () Bool)

(assert (=> b!477779 (= e!280779 e!280780)))

(declare-fun res!285141 () Bool)

(assert (=> b!477779 (=> (not res!285141) (not e!280780))))

(assert (=> b!477779 (= res!285141 (dynLambda!950 p!166 (h!9953 (t!15255 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341)))))))))

(declare-fun b!477780 () Bool)

(assert (=> b!477780 (= e!280780 (forall!200 (t!15255 (t!15255 (t!15255 (toList!3996 (+!1804 lm!215 lt!217341))))) p!166))))

(assert (= (and d!76265 (not res!285140)) b!477779))

(assert (= (and b!477779 res!285141) b!477780))

(declare-fun b_lambda!10749 () Bool)

(assert (=> (not b_lambda!10749) (not b!477779)))

(declare-fun t!15287 () Bool)

(declare-fun tb!4139 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15287) tb!4139))

(declare-fun result!7713 () Bool)

(assert (=> tb!4139 (= result!7713 true)))

(assert (=> b!477779 t!15287))

(declare-fun b_and!20829 () Bool)

(assert (= b_and!20821 (and (=> t!15287 result!7713) b_and!20829)))

(declare-fun m!459665 () Bool)

(assert (=> b!477779 m!459665))

(declare-fun m!459667 () Bool)

(assert (=> b!477780 m!459667))

(assert (=> b!477538 d!76265))

(declare-fun b!477781 () Bool)

(declare-fun res!285143 () Bool)

(declare-fun e!280785 () Bool)

(assert (=> b!477781 (=> (not res!285143) (not e!280785))))

(declare-fun lt!217447 () List!9101)

(assert (=> b!477781 (= res!285143 (containsKey!349 lt!217447 (_1!4540 lt!217341)))))

(declare-fun c!57562 () Bool)

(declare-fun e!280783 () List!9101)

(declare-fun bm!30793 () Bool)

(declare-fun call!30797 () List!9101)

(assert (=> bm!30793 (= call!30797 ($colon$colon!112 e!280783 (ite c!57562 (h!9953 (t!15255 (toList!3996 lm!215))) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341)))))))

(declare-fun c!57559 () Bool)

(assert (=> bm!30793 (= c!57559 c!57562)))

(declare-fun d!76267 () Bool)

(assert (=> d!76267 e!280785))

(declare-fun res!285142 () Bool)

(assert (=> d!76267 (=> (not res!285142) (not e!280785))))

(assert (=> d!76267 (= res!285142 (isStrictlySorted!387 lt!217447))))

(declare-fun e!280781 () List!9101)

(assert (=> d!76267 (= lt!217447 e!280781)))

(assert (=> d!76267 (= c!57562 (and ((_ is Cons!9097) (t!15255 (toList!3996 lm!215))) (bvslt (_1!4540 (h!9953 (t!15255 (toList!3996 lm!215)))) (_1!4540 lt!217341))))))

(assert (=> d!76267 (isStrictlySorted!387 (t!15255 (toList!3996 lm!215)))))

(assert (=> d!76267 (= (insertStrictlySorted!217 (t!15255 (toList!3996 lm!215)) (_1!4540 lt!217341) (_2!4540 lt!217341)) lt!217447)))

(declare-fun b!477782 () Bool)

(declare-fun e!280782 () List!9101)

(declare-fun call!30796 () List!9101)

(assert (=> b!477782 (= e!280782 call!30796)))

(declare-fun b!477783 () Bool)

(declare-fun e!280784 () List!9101)

(declare-fun call!30798 () List!9101)

(assert (=> b!477783 (= e!280784 call!30798)))

(declare-fun bm!30794 () Bool)

(assert (=> bm!30794 (= call!30796 call!30798)))

(declare-fun b!477784 () Bool)

(assert (=> b!477784 (= e!280785 (contains!2570 lt!217447 (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(declare-fun b!477785 () Bool)

(assert (=> b!477785 (= e!280781 call!30797)))

(declare-fun b!477786 () Bool)

(assert (=> b!477786 (= e!280783 (insertStrictlySorted!217 (t!15255 (t!15255 (toList!3996 lm!215))) (_1!4540 lt!217341) (_2!4540 lt!217341)))))

(declare-fun b!477787 () Bool)

(assert (=> b!477787 (= e!280781 e!280784)))

(declare-fun c!57561 () Bool)

(assert (=> b!477787 (= c!57561 (and ((_ is Cons!9097) (t!15255 (toList!3996 lm!215))) (= (_1!4540 (h!9953 (t!15255 (toList!3996 lm!215)))) (_1!4540 lt!217341))))))

(declare-fun b!477788 () Bool)

(assert (=> b!477788 (= e!280782 call!30796)))

(declare-fun bm!30795 () Bool)

(assert (=> bm!30795 (= call!30798 call!30797)))

(declare-fun b!477789 () Bool)

(declare-fun c!57560 () Bool)

(assert (=> b!477789 (= e!280783 (ite c!57561 (t!15255 (t!15255 (toList!3996 lm!215))) (ite c!57560 (Cons!9097 (h!9953 (t!15255 (toList!3996 lm!215))) (t!15255 (t!15255 (toList!3996 lm!215)))) Nil!9098)))))

(declare-fun b!477790 () Bool)

(assert (=> b!477790 (= c!57560 (and ((_ is Cons!9097) (t!15255 (toList!3996 lm!215))) (bvsgt (_1!4540 (h!9953 (t!15255 (toList!3996 lm!215)))) (_1!4540 lt!217341))))))

(assert (=> b!477790 (= e!280784 e!280782)))

(assert (= (and d!76267 c!57562) b!477785))

(assert (= (and d!76267 (not c!57562)) b!477787))

(assert (= (and b!477787 c!57561) b!477783))

(assert (= (and b!477787 (not c!57561)) b!477790))

(assert (= (and b!477790 c!57560) b!477788))

(assert (= (and b!477790 (not c!57560)) b!477782))

(assert (= (or b!477788 b!477782) bm!30794))

(assert (= (or b!477783 bm!30794) bm!30795))

(assert (= (or b!477785 bm!30795) bm!30793))

(assert (= (and bm!30793 c!57559) b!477786))

(assert (= (and bm!30793 (not c!57559)) b!477789))

(assert (= (and d!76267 res!285142) b!477781))

(assert (= (and b!477781 res!285143) b!477784))

(declare-fun m!459669 () Bool)

(assert (=> b!477781 m!459669))

(declare-fun m!459671 () Bool)

(assert (=> b!477784 m!459671))

(declare-fun m!459673 () Bool)

(assert (=> bm!30793 m!459673))

(declare-fun m!459675 () Bool)

(assert (=> d!76267 m!459675))

(assert (=> d!76267 m!459527))

(declare-fun m!459677 () Bool)

(assert (=> b!477786 m!459677))

(assert (=> b!477669 d!76267))

(declare-fun d!76269 () Bool)

(declare-fun res!285144 () Bool)

(declare-fun e!280786 () Bool)

(assert (=> d!76269 (=> res!285144 e!280786)))

(assert (=> d!76269 (= res!285144 (or ((_ is Nil!9098) (t!15255 (toList!3996 lm!215))) ((_ is Nil!9098) (t!15255 (t!15255 (toList!3996 lm!215))))))))

(assert (=> d!76269 (= (isStrictlySorted!387 (t!15255 (toList!3996 lm!215))) e!280786)))

(declare-fun b!477791 () Bool)

(declare-fun e!280787 () Bool)

(assert (=> b!477791 (= e!280786 e!280787)))

(declare-fun res!285145 () Bool)

(assert (=> b!477791 (=> (not res!285145) (not e!280787))))

(assert (=> b!477791 (= res!285145 (bvslt (_1!4540 (h!9953 (t!15255 (toList!3996 lm!215)))) (_1!4540 (h!9953 (t!15255 (t!15255 (toList!3996 lm!215)))))))))

(declare-fun b!477792 () Bool)

(assert (=> b!477792 (= e!280787 (isStrictlySorted!387 (t!15255 (t!15255 (toList!3996 lm!215)))))))

(assert (= (and d!76269 (not res!285144)) b!477791))

(assert (= (and b!477791 res!285145) b!477792))

(declare-fun m!459679 () Bool)

(assert (=> b!477792 m!459679))

(assert (=> b!477536 d!76269))

(declare-fun d!76271 () Bool)

(declare-fun res!285146 () Bool)

(declare-fun e!280788 () Bool)

(assert (=> d!76271 (=> res!285146 e!280788)))

(assert (=> d!76271 (= res!285146 (and ((_ is Cons!9097) (toList!3996 lt!217383)) (= (_1!4540 (h!9953 (toList!3996 lt!217383))) (_1!4540 lt!217341))))))

(assert (=> d!76271 (= (containsKey!349 (toList!3996 lt!217383) (_1!4540 lt!217341)) e!280788)))

(declare-fun b!477793 () Bool)

(declare-fun e!280789 () Bool)

(assert (=> b!477793 (= e!280788 e!280789)))

(declare-fun res!285147 () Bool)

(assert (=> b!477793 (=> (not res!285147) (not e!280789))))

(assert (=> b!477793 (= res!285147 (and (or (not ((_ is Cons!9097) (toList!3996 lt!217383))) (bvsle (_1!4540 (h!9953 (toList!3996 lt!217383))) (_1!4540 lt!217341))) ((_ is Cons!9097) (toList!3996 lt!217383)) (bvslt (_1!4540 (h!9953 (toList!3996 lt!217383))) (_1!4540 lt!217341))))))

(declare-fun b!477794 () Bool)

(assert (=> b!477794 (= e!280789 (containsKey!349 (t!15255 (toList!3996 lt!217383)) (_1!4540 lt!217341)))))

(assert (= (and d!76271 (not res!285146)) b!477793))

(assert (= (and b!477793 res!285147) b!477794))

(declare-fun m!459681 () Bool)

(assert (=> b!477794 m!459681))

(assert (=> d!76205 d!76271))

(declare-fun d!76273 () Bool)

(declare-fun res!285148 () Bool)

(declare-fun e!280790 () Bool)

(assert (=> d!76273 (=> res!285148 e!280790)))

(assert (=> d!76273 (= res!285148 (and ((_ is Cons!9097) lt!217382) (= (_1!4540 (h!9953 lt!217382)) (_1!4540 lt!217341))))))

(assert (=> d!76273 (= (containsKey!349 lt!217382 (_1!4540 lt!217341)) e!280790)))

(declare-fun b!477795 () Bool)

(declare-fun e!280791 () Bool)

(assert (=> b!477795 (= e!280790 e!280791)))

(declare-fun res!285149 () Bool)

(assert (=> b!477795 (=> (not res!285149) (not e!280791))))

(assert (=> b!477795 (= res!285149 (and (or (not ((_ is Cons!9097) lt!217382)) (bvsle (_1!4540 (h!9953 lt!217382)) (_1!4540 lt!217341))) ((_ is Cons!9097) lt!217382) (bvslt (_1!4540 (h!9953 lt!217382)) (_1!4540 lt!217341))))))

(declare-fun b!477796 () Bool)

(assert (=> b!477796 (= e!280791 (containsKey!349 (t!15255 lt!217382) (_1!4540 lt!217341)))))

(assert (= (and d!76273 (not res!285148)) b!477795))

(assert (= (and b!477795 res!285149) b!477796))

(declare-fun m!459683 () Bool)

(assert (=> b!477796 m!459683))

(assert (=> b!477606 d!76273))

(declare-fun d!76275 () Bool)

(declare-fun lt!217448 () Bool)

(assert (=> d!76275 (= lt!217448 (select (content!212 lt!217437) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(declare-fun e!280792 () Bool)

(assert (=> d!76275 (= lt!217448 e!280792)))

(declare-fun res!285150 () Bool)

(assert (=> d!76275 (=> (not res!285150) (not e!280792))))

(assert (=> d!76275 (= res!285150 ((_ is Cons!9097) lt!217437))))

(assert (=> d!76275 (= (contains!2570 lt!217437 (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))) lt!217448)))

(declare-fun b!477797 () Bool)

(declare-fun e!280793 () Bool)

(assert (=> b!477797 (= e!280792 e!280793)))

(declare-fun res!285151 () Bool)

(assert (=> b!477797 (=> res!285151 e!280793)))

(assert (=> b!477797 (= res!285151 (= (h!9953 lt!217437) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(declare-fun b!477798 () Bool)

(assert (=> b!477798 (= e!280793 (contains!2570 (t!15255 lt!217437) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(assert (= (and d!76275 res!285150) b!477797))

(assert (= (and b!477797 (not res!285151)) b!477798))

(declare-fun m!459685 () Bool)

(assert (=> d!76275 m!459685))

(declare-fun m!459687 () Bool)

(assert (=> d!76275 m!459687))

(declare-fun m!459689 () Bool)

(assert (=> b!477798 m!459689))

(assert (=> b!477667 d!76275))

(declare-fun d!76277 () Bool)

(declare-fun lt!217449 () Bool)

(assert (=> d!76277 (= lt!217449 (select (content!212 lt!217382) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(declare-fun e!280794 () Bool)

(assert (=> d!76277 (= lt!217449 e!280794)))

(declare-fun res!285152 () Bool)

(assert (=> d!76277 (=> (not res!285152) (not e!280794))))

(assert (=> d!76277 (= res!285152 ((_ is Cons!9097) lt!217382))))

(assert (=> d!76277 (= (contains!2570 lt!217382 (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))) lt!217449)))

(declare-fun b!477799 () Bool)

(declare-fun e!280795 () Bool)

(assert (=> b!477799 (= e!280794 e!280795)))

(declare-fun res!285153 () Bool)

(assert (=> b!477799 (=> res!285153 e!280795)))

(assert (=> b!477799 (= res!285153 (= (h!9953 lt!217382) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(declare-fun b!477800 () Bool)

(assert (=> b!477800 (= e!280795 (contains!2570 (t!15255 lt!217382) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))))))

(assert (= (and d!76277 res!285152) b!477799))

(assert (= (and b!477799 (not res!285153)) b!477800))

(declare-fun m!459691 () Bool)

(assert (=> d!76277 m!459691))

(declare-fun m!459693 () Bool)

(assert (=> d!76277 m!459693))

(declare-fun m!459695 () Bool)

(assert (=> b!477800 m!459695))

(assert (=> b!477607 d!76277))

(declare-fun d!76279 () Bool)

(assert (=> d!76279 (isDefined!299 (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341)))))

(declare-fun lt!217452 () Unit!14033)

(declare-fun choose!1380 (List!9101 (_ BitVec 64)) Unit!14033)

(assert (=> d!76279 (= lt!217452 (choose!1380 (toList!3996 lt!217383) (_1!4540 lt!217341)))))

(declare-fun e!280798 () Bool)

(assert (=> d!76279 e!280798))

(declare-fun res!285156 () Bool)

(assert (=> d!76279 (=> (not res!285156) (not e!280798))))

(assert (=> d!76279 (= res!285156 (isStrictlySorted!387 (toList!3996 lt!217383)))))

(assert (=> d!76279 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!298 (toList!3996 lt!217383) (_1!4540 lt!217341)) lt!217452)))

(declare-fun b!477803 () Bool)

(assert (=> b!477803 (= e!280798 (containsKey!349 (toList!3996 lt!217383) (_1!4540 lt!217341)))))

(assert (= (and d!76279 res!285156) b!477803))

(assert (=> d!76279 m!459513))

(assert (=> d!76279 m!459513))

(assert (=> d!76279 m!459541))

(declare-fun m!459697 () Bool)

(assert (=> d!76279 m!459697))

(declare-fun m!459699 () Bool)

(assert (=> d!76279 m!459699))

(assert (=> b!477803 m!459537))

(assert (=> b!477563 d!76279))

(declare-fun d!76281 () Bool)

(declare-fun isEmpty!621 (Option!395) Bool)

(assert (=> d!76281 (= (isDefined!299 (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341))) (not (isEmpty!621 (getValueByKey!389 (toList!3996 lt!217383) (_1!4540 lt!217341)))))))

(declare-fun bs!15162 () Bool)

(assert (= bs!15162 d!76281))

(assert (=> bs!15162 m!459513))

(declare-fun m!459701 () Bool)

(assert (=> bs!15162 m!459701))

(assert (=> b!477563 d!76281))

(assert (=> b!477563 d!76239))

(declare-fun d!76283 () Bool)

(declare-fun lt!217453 () Bool)

(assert (=> d!76283 (= lt!217453 (select (content!212 (t!15255 (toList!3996 lt!217383))) lt!217341))))

(declare-fun e!280799 () Bool)

(assert (=> d!76283 (= lt!217453 e!280799)))

(declare-fun res!285157 () Bool)

(assert (=> d!76283 (=> (not res!285157) (not e!280799))))

(assert (=> d!76283 (= res!285157 ((_ is Cons!9097) (t!15255 (toList!3996 lt!217383))))))

(assert (=> d!76283 (= (contains!2570 (t!15255 (toList!3996 lt!217383)) lt!217341) lt!217453)))

(declare-fun b!477804 () Bool)

(declare-fun e!280800 () Bool)

(assert (=> b!477804 (= e!280799 e!280800)))

(declare-fun res!285158 () Bool)

(assert (=> b!477804 (=> res!285158 e!280800)))

(assert (=> b!477804 (= res!285158 (= (h!9953 (t!15255 (toList!3996 lt!217383))) lt!217341))))

(declare-fun b!477805 () Bool)

(assert (=> b!477805 (= e!280800 (contains!2570 (t!15255 (t!15255 (toList!3996 lt!217383))) lt!217341))))

(assert (= (and d!76283 res!285157) b!477804))

(assert (= (and b!477804 (not res!285158)) b!477805))

(declare-fun m!459703 () Bool)

(assert (=> d!76283 m!459703))

(declare-fun m!459705 () Bool)

(assert (=> d!76283 m!459705))

(declare-fun m!459707 () Bool)

(assert (=> b!477805 m!459707))

(assert (=> b!477721 d!76283))

(declare-fun d!76285 () Bool)

(declare-fun res!285159 () Bool)

(declare-fun e!280801 () Bool)

(assert (=> d!76285 (=> res!285159 e!280801)))

(assert (=> d!76285 (= res!285159 (or ((_ is Nil!9098) lt!217437) ((_ is Nil!9098) (t!15255 lt!217437))))))

(assert (=> d!76285 (= (isStrictlySorted!387 lt!217437) e!280801)))

(declare-fun b!477806 () Bool)

(declare-fun e!280802 () Bool)

(assert (=> b!477806 (= e!280801 e!280802)))

(declare-fun res!285160 () Bool)

(assert (=> b!477806 (=> (not res!285160) (not e!280802))))

(assert (=> b!477806 (= res!285160 (bvslt (_1!4540 (h!9953 lt!217437)) (_1!4540 (h!9953 (t!15255 lt!217437)))))))

(declare-fun b!477807 () Bool)

(assert (=> b!477807 (= e!280802 (isStrictlySorted!387 (t!15255 lt!217437)))))

(assert (= (and d!76285 (not res!285159)) b!477806))

(assert (= (and b!477806 res!285160) b!477807))

(declare-fun m!459709 () Bool)

(assert (=> b!477807 m!459709))

(assert (=> d!76225 d!76285))

(assert (=> d!76225 d!76199))

(assert (=> d!76223 d!76213))

(declare-fun d!76287 () Bool)

(assert (=> d!76287 (= (getValueByKey!389 lt!217382 (_1!4540 lt!217341)) (Some!394 (_2!4540 lt!217341)))))

(assert (=> d!76287 true))

(declare-fun _$22!559 () Unit!14033)

(assert (=> d!76287 (= (choose!1377 lt!217382 (_1!4540 lt!217341) (_2!4540 lt!217341)) _$22!559)))

(declare-fun bs!15163 () Bool)

(assert (= bs!15163 d!76287))

(assert (=> bs!15163 m!459505))

(assert (=> d!76223 d!76287))

(declare-fun d!76289 () Bool)

(declare-fun res!285161 () Bool)

(declare-fun e!280803 () Bool)

(assert (=> d!76289 (=> res!285161 e!280803)))

(assert (=> d!76289 (= res!285161 (or ((_ is Nil!9098) lt!217382) ((_ is Nil!9098) (t!15255 lt!217382))))))

(assert (=> d!76289 (= (isStrictlySorted!387 lt!217382) e!280803)))

(declare-fun b!477808 () Bool)

(declare-fun e!280804 () Bool)

(assert (=> b!477808 (= e!280803 e!280804)))

(declare-fun res!285162 () Bool)

(assert (=> b!477808 (=> (not res!285162) (not e!280804))))

(assert (=> b!477808 (= res!285162 (bvslt (_1!4540 (h!9953 lt!217382)) (_1!4540 (h!9953 (t!15255 lt!217382)))))))

(declare-fun b!477809 () Bool)

(assert (=> b!477809 (= e!280804 (isStrictlySorted!387 (t!15255 lt!217382)))))

(assert (= (and d!76289 (not res!285161)) b!477808))

(assert (= (and b!477808 res!285162) b!477809))

(declare-fun m!459711 () Bool)

(assert (=> b!477809 m!459711))

(assert (=> d!76223 d!76289))

(declare-fun d!76291 () Bool)

(declare-fun res!285163 () Bool)

(declare-fun e!280805 () Bool)

(assert (=> d!76291 (=> res!285163 e!280805)))

(assert (=> d!76291 (= res!285163 ((_ is Nil!9098) (t!15255 (t!15255 (toList!3996 lm!215)))))))

(assert (=> d!76291 (= (forall!200 (t!15255 (t!15255 (toList!3996 lm!215))) p!166) e!280805)))

(declare-fun b!477810 () Bool)

(declare-fun e!280806 () Bool)

(assert (=> b!477810 (= e!280805 e!280806)))

(declare-fun res!285164 () Bool)

(assert (=> b!477810 (=> (not res!285164) (not e!280806))))

(assert (=> b!477810 (= res!285164 (dynLambda!950 p!166 (h!9953 (t!15255 (t!15255 (toList!3996 lm!215))))))))

(declare-fun b!477811 () Bool)

(assert (=> b!477811 (= e!280806 (forall!200 (t!15255 (t!15255 (t!15255 (toList!3996 lm!215)))) p!166))))

(assert (= (and d!76291 (not res!285163)) b!477810))

(assert (= (and b!477810 res!285164) b!477811))

(declare-fun b_lambda!10751 () Bool)

(assert (=> (not b_lambda!10751) (not b!477810)))

(declare-fun t!15289 () Bool)

(declare-fun tb!4141 () Bool)

(assert (=> (and start!42982 (= p!166 p!166) t!15289) tb!4141))

(declare-fun result!7715 () Bool)

(assert (=> tb!4141 (= result!7715 true)))

(assert (=> b!477810 t!15289))

(declare-fun b_and!20831 () Bool)

(assert (= b_and!20829 (and (=> t!15289 result!7715) b_and!20831)))

(declare-fun m!459713 () Bool)

(assert (=> b!477810 m!459713))

(declare-fun m!459715 () Bool)

(assert (=> b!477811 m!459715))

(assert (=> b!477691 d!76291))

(assert (=> b!477565 d!76281))

(assert (=> b!477565 d!76239))

(declare-fun d!76293 () Bool)

(declare-fun c!57565 () Bool)

(assert (=> d!76293 (= c!57565 ((_ is Nil!9098) (toList!3996 lt!217383)))))

(declare-fun e!280809 () (InoxSet tuple2!9058))

(assert (=> d!76293 (= (content!212 (toList!3996 lt!217383)) e!280809)))

(declare-fun b!477816 () Bool)

(assert (=> b!477816 (= e!280809 ((as const (Array tuple2!9058 Bool)) false))))

(declare-fun b!477817 () Bool)

(assert (=> b!477817 (= e!280809 ((_ map or) (store ((as const (Array tuple2!9058 Bool)) false) (h!9953 (toList!3996 lt!217383)) true) (content!212 (t!15255 (toList!3996 lt!217383)))))))

(assert (= (and d!76293 c!57565) b!477816))

(assert (= (and d!76293 (not c!57565)) b!477817))

(declare-fun m!459717 () Bool)

(assert (=> b!477817 m!459717))

(assert (=> b!477817 m!459703))

(assert (=> d!76243 d!76293))

(declare-fun d!76295 () Bool)

(assert (=> d!76295 (= ($colon$colon!112 e!280709 (ite c!57526 (h!9953 (toList!3996 lm!215)) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341)))) (Cons!9097 (ite c!57526 (h!9953 (toList!3996 lm!215)) (tuple2!9059 (_1!4540 lt!217341) (_2!4540 lt!217341))) e!280709))))

(assert (=> bm!30772 d!76295))

(declare-fun b!477820 () Bool)

(declare-fun e!280812 () Bool)

(declare-fun tp!42455 () Bool)

(assert (=> b!477820 (= e!280812 (and tp_is_empty!13531 tp!42455))))

(assert (=> b!477726 (= tp!42452 e!280812)))

(assert (= (and b!477726 ((_ is Cons!9097) (t!15255 (t!15255 (toList!3996 lm!215))))) b!477820))

(declare-fun b_lambda!10753 () Bool)

(assert (= b_lambda!10751 (or (and start!42982 b_free!12109) b_lambda!10753)))

(declare-fun b_lambda!10755 () Bool)

(assert (= b_lambda!10749 (or (and start!42982 b_free!12109) b_lambda!10755)))

(check-sat (not b!477796) (not b!477786) (not b!477817) (not d!76287) (not d!76275) (not b!477811) (not b!477777) (not b!477770) (not d!76267) (not b!477800) (not b_lambda!10731) (not b_lambda!10721) (not b_lambda!10753) (not b!477784) b_and!20831 (not b!477792) (not b!477820) (not b!477807) (not b!477805) (not d!76281) (not b_next!12109) (not d!76279) (not d!76283) tp_is_empty!13531 (not b_lambda!10733) (not b!477780) (not b!477798) (not b_lambda!10755) (not b!477809) (not d!76277) (not b_lambda!10723) (not b!477773) (not b_lambda!10699) (not bm!30793) (not b!477803) (not b!477781) (not b!477794))
(check-sat b_and!20831 (not b_next!12109))
