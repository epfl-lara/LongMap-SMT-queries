; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42796 () Bool)

(assert start!42796)

(declare-fun b_free!12097 () Bool)

(declare-fun b_next!12097 () Bool)

(assert (=> start!42796 (= b_free!12097 (not b_next!12097))))

(declare-fun tp!42366 () Bool)

(declare-fun b_and!20655 () Bool)

(assert (=> start!42796 (= tp!42366 b_and!20655)))

(declare-fun b!476455 () Bool)

(declare-fun e!279864 () Bool)

(declare-fun tp!42367 () Bool)

(assert (=> b!476455 (= e!279864 tp!42367)))

(declare-fun b!476456 () Bool)

(declare-fun res!284454 () Bool)

(declare-fun e!279865 () Bool)

(assert (=> b!476456 (=> (not res!284454) (not e!279865))))

(declare-datatypes ((B!1046 0))(
  ( (B!1047 (val!6807 Int)) )
))
(declare-datatypes ((tuple2!9046 0))(
  ( (tuple2!9047 (_1!4534 (_ BitVec 64)) (_2!4534 B!1046)) )
))
(declare-datatypes ((List!9095 0))(
  ( (Nil!9092) (Cons!9091 (h!9947 tuple2!9046) (t!15120 List!9095)) )
))
(declare-datatypes ((ListLongMap!7949 0))(
  ( (ListLongMap!7950 (toList!3990 List!9095)) )
))
(declare-fun lm!215 () ListLongMap!7949)

(declare-fun isEmpty!599 (ListLongMap!7949) Bool)

(assert (=> b!476456 (= res!284454 (not (isEmpty!599 lm!215)))))

(declare-fun res!284452 () Bool)

(assert (=> start!42796 (=> (not res!284452) (not e!279865))))

(declare-fun p!166 () Int)

(declare-fun forall!194 (List!9095 Int) Bool)

(assert (=> start!42796 (= res!284452 (forall!194 (toList!3990 lm!215) p!166))))

(assert (=> start!42796 e!279865))

(declare-fun inv!15487 (ListLongMap!7949) Bool)

(assert (=> start!42796 (and (inv!15487 lm!215) e!279864)))

(assert (=> start!42796 tp!42366))

(assert (=> start!42796 true))

(declare-fun tp_is_empty!13519 () Bool)

(assert (=> start!42796 tp_is_empty!13519))

(declare-fun b!476457 () Bool)

(declare-fun e!279863 () Bool)

(declare-fun lt!217077 () ListLongMap!7949)

(declare-fun size!15137 (List!9095) Int)

(assert (=> b!476457 (= e!279863 (>= (size!15137 (toList!3990 lt!217077)) (size!15137 (toList!3990 lm!215))))))

(declare-fun b!476458 () Bool)

(assert (=> b!476458 (= e!279865 e!279863)))

(declare-fun res!284455 () Bool)

(assert (=> b!476458 (=> (not res!284455) (not e!279863))))

(assert (=> b!476458 (= res!284455 (forall!194 (toList!3990 lt!217077) p!166))))

(declare-fun tail!119 (ListLongMap!7949) ListLongMap!7949)

(assert (=> b!476458 (= lt!217077 (tail!119 lm!215))))

(declare-fun b!476459 () Bool)

(declare-fun res!284453 () Bool)

(assert (=> b!476459 (=> (not res!284453) (not e!279865))))

(declare-fun b!85 () B!1046)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!944 (Int tuple2!9046) Bool)

(assert (=> b!476459 (= res!284453 (dynLambda!944 p!166 (tuple2!9047 a!501 b!85)))))

(assert (= (and start!42796 res!284452) b!476459))

(assert (= (and b!476459 res!284453) b!476456))

(assert (= (and b!476456 res!284454) b!476458))

(assert (= (and b!476458 res!284455) b!476457))

(assert (= start!42796 b!476455))

(declare-fun b_lambda!10437 () Bool)

(assert (=> (not b_lambda!10437) (not b!476459)))

(declare-fun t!15119 () Bool)

(declare-fun tb!3983 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15119) tb!3983))

(declare-fun result!7539 () Bool)

(assert (=> tb!3983 (= result!7539 true)))

(assert (=> b!476459 t!15119))

(declare-fun b_and!20657 () Bool)

(assert (= b_and!20655 (and (=> t!15119 result!7539) b_and!20657)))

(declare-fun m!458261 () Bool)

(assert (=> b!476458 m!458261))

(declare-fun m!458263 () Bool)

(assert (=> b!476458 m!458263))

(declare-fun m!458265 () Bool)

(assert (=> start!42796 m!458265))

(declare-fun m!458267 () Bool)

(assert (=> start!42796 m!458267))

(declare-fun m!458269 () Bool)

(assert (=> b!476456 m!458269))

(declare-fun m!458271 () Bool)

(assert (=> b!476459 m!458271))

(declare-fun m!458273 () Bool)

(assert (=> b!476457 m!458273))

(declare-fun m!458275 () Bool)

(assert (=> b!476457 m!458275))

(check-sat (not start!42796) b_and!20657 (not b_next!12097) tp_is_empty!13519 (not b!476456) (not b!476458) (not b!476457) (not b!476455) (not b_lambda!10437))
(check-sat b_and!20657 (not b_next!12097))
(get-model)

(declare-fun b_lambda!10445 () Bool)

(assert (= b_lambda!10437 (or (and start!42796 b_free!12097) b_lambda!10445)))

(check-sat (not start!42796) b_and!20657 (not b_next!12097) tp_is_empty!13519 (not b!476456) (not b!476458) (not b_lambda!10445) (not b!476457) (not b!476455))
(check-sat b_and!20657 (not b_next!12097))
(get-model)

(declare-fun d!75623 () Bool)

(declare-fun res!284490 () Bool)

(declare-fun e!279898 () Bool)

(assert (=> d!75623 (=> res!284490 e!279898)))

(get-info :version)

(assert (=> d!75623 (= res!284490 ((_ is Nil!9092) (toList!3990 lt!217077)))))

(assert (=> d!75623 (= (forall!194 (toList!3990 lt!217077) p!166) e!279898)))

(declare-fun b!476508 () Bool)

(declare-fun e!279899 () Bool)

(assert (=> b!476508 (= e!279898 e!279899)))

(declare-fun res!284491 () Bool)

(assert (=> b!476508 (=> (not res!284491) (not e!279899))))

(assert (=> b!476508 (= res!284491 (dynLambda!944 p!166 (h!9947 (toList!3990 lt!217077))))))

(declare-fun b!476509 () Bool)

(assert (=> b!476509 (= e!279899 (forall!194 (t!15120 (toList!3990 lt!217077)) p!166))))

(assert (= (and d!75623 (not res!284490)) b!476508))

(assert (= (and b!476508 res!284491) b!476509))

(declare-fun b_lambda!10451 () Bool)

(assert (=> (not b_lambda!10451) (not b!476508)))

(declare-fun t!15130 () Bool)

(declare-fun tb!3991 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15130) tb!3991))

(declare-fun result!7547 () Bool)

(assert (=> tb!3991 (= result!7547 true)))

(assert (=> b!476508 t!15130))

(declare-fun b_and!20669 () Bool)

(assert (= b_and!20657 (and (=> t!15130 result!7547) b_and!20669)))

(declare-fun m!458317 () Bool)

(assert (=> b!476508 m!458317))

(declare-fun m!458319 () Bool)

(assert (=> b!476509 m!458319))

(assert (=> b!476458 d!75623))

(declare-fun d!75631 () Bool)

(declare-fun tail!122 (List!9095) List!9095)

(assert (=> d!75631 (= (tail!119 lm!215) (ListLongMap!7950 (tail!122 (toList!3990 lm!215))))))

(declare-fun bs!15118 () Bool)

(assert (= bs!15118 d!75631))

(declare-fun m!458323 () Bool)

(assert (=> bs!15118 m!458323))

(assert (=> b!476458 d!75631))

(declare-fun d!75635 () Bool)

(declare-fun lt!217090 () Int)

(assert (=> d!75635 (>= lt!217090 0)))

(declare-fun e!279910 () Int)

(assert (=> d!75635 (= lt!217090 e!279910)))

(declare-fun c!57291 () Bool)

(assert (=> d!75635 (= c!57291 ((_ is Nil!9092) (toList!3990 lt!217077)))))

(assert (=> d!75635 (= (size!15137 (toList!3990 lt!217077)) lt!217090)))

(declare-fun b!476522 () Bool)

(assert (=> b!476522 (= e!279910 0)))

(declare-fun b!476523 () Bool)

(assert (=> b!476523 (= e!279910 (+ 1 (size!15137 (t!15120 (toList!3990 lt!217077)))))))

(assert (= (and d!75635 c!57291) b!476522))

(assert (= (and d!75635 (not c!57291)) b!476523))

(declare-fun m!458337 () Bool)

(assert (=> b!476523 m!458337))

(assert (=> b!476457 d!75635))

(declare-fun d!75645 () Bool)

(declare-fun lt!217091 () Int)

(assert (=> d!75645 (>= lt!217091 0)))

(declare-fun e!279913 () Int)

(assert (=> d!75645 (= lt!217091 e!279913)))

(declare-fun c!57292 () Bool)

(assert (=> d!75645 (= c!57292 ((_ is Nil!9092) (toList!3990 lm!215)))))

(assert (=> d!75645 (= (size!15137 (toList!3990 lm!215)) lt!217091)))

(declare-fun b!476526 () Bool)

(assert (=> b!476526 (= e!279913 0)))

(declare-fun b!476527 () Bool)

(assert (=> b!476527 (= e!279913 (+ 1 (size!15137 (t!15120 (toList!3990 lm!215)))))))

(assert (= (and d!75645 c!57292) b!476526))

(assert (= (and d!75645 (not c!57292)) b!476527))

(declare-fun m!458339 () Bool)

(assert (=> b!476527 m!458339))

(assert (=> b!476457 d!75645))

(declare-fun d!75647 () Bool)

(declare-fun isEmpty!602 (List!9095) Bool)

(assert (=> d!75647 (= (isEmpty!599 lm!215) (isEmpty!602 (toList!3990 lm!215)))))

(declare-fun bs!15122 () Bool)

(assert (= bs!15122 d!75647))

(declare-fun m!458347 () Bool)

(assert (=> bs!15122 m!458347))

(assert (=> b!476456 d!75647))

(declare-fun d!75653 () Bool)

(declare-fun res!284502 () Bool)

(declare-fun e!279914 () Bool)

(assert (=> d!75653 (=> res!284502 e!279914)))

(assert (=> d!75653 (= res!284502 ((_ is Nil!9092) (toList!3990 lm!215)))))

(assert (=> d!75653 (= (forall!194 (toList!3990 lm!215) p!166) e!279914)))

(declare-fun b!476528 () Bool)

(declare-fun e!279915 () Bool)

(assert (=> b!476528 (= e!279914 e!279915)))

(declare-fun res!284503 () Bool)

(assert (=> b!476528 (=> (not res!284503) (not e!279915))))

(assert (=> b!476528 (= res!284503 (dynLambda!944 p!166 (h!9947 (toList!3990 lm!215))))))

(declare-fun b!476529 () Bool)

(assert (=> b!476529 (= e!279915 (forall!194 (t!15120 (toList!3990 lm!215)) p!166))))

(assert (= (and d!75653 (not res!284502)) b!476528))

(assert (= (and b!476528 res!284503) b!476529))

(declare-fun b_lambda!10459 () Bool)

(assert (=> (not b_lambda!10459) (not b!476528)))

(declare-fun t!15138 () Bool)

(declare-fun tb!3999 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15138) tb!3999))

(declare-fun result!7555 () Bool)

(assert (=> tb!3999 (= result!7555 true)))

(assert (=> b!476528 t!15138))

(declare-fun b_and!20677 () Bool)

(assert (= b_and!20669 (and (=> t!15138 result!7555) b_and!20677)))

(declare-fun m!458349 () Bool)

(assert (=> b!476528 m!458349))

(declare-fun m!458351 () Bool)

(assert (=> b!476529 m!458351))

(assert (=> start!42796 d!75653))

(declare-fun d!75655 () Bool)

(declare-fun isStrictlySorted!381 (List!9095) Bool)

(assert (=> d!75655 (= (inv!15487 lm!215) (isStrictlySorted!381 (toList!3990 lm!215)))))

(declare-fun bs!15125 () Bool)

(assert (= bs!15125 d!75655))

(declare-fun m!458361 () Bool)

(assert (=> bs!15125 m!458361))

(assert (=> start!42796 d!75655))

(declare-fun b!476552 () Bool)

(declare-fun e!279928 () Bool)

(declare-fun tp!42388 () Bool)

(assert (=> b!476552 (= e!279928 (and tp_is_empty!13519 tp!42388))))

(assert (=> b!476455 (= tp!42367 e!279928)))

(assert (= (and b!476455 ((_ is Cons!9091) (toList!3990 lm!215))) b!476552))

(declare-fun b_lambda!10469 () Bool)

(assert (= b_lambda!10459 (or (and start!42796 b_free!12097) b_lambda!10469)))

(declare-fun b_lambda!10471 () Bool)

(assert (= b_lambda!10451 (or (and start!42796 b_free!12097) b_lambda!10471)))

(check-sat (not b_next!12097) tp_is_empty!13519 b_and!20677 (not b!476509) (not b!476552) (not d!75631) (not d!75647) (not b_lambda!10469) (not b!476527) (not b_lambda!10471) (not b!476529) (not b_lambda!10445) (not b!476523) (not d!75655))
(check-sat b_and!20677 (not b_next!12097))
(get-model)

(declare-fun d!75661 () Bool)

(declare-fun lt!217096 () Int)

(assert (=> d!75661 (>= lt!217096 0)))

(declare-fun e!279929 () Int)

(assert (=> d!75661 (= lt!217096 e!279929)))

(declare-fun c!57297 () Bool)

(assert (=> d!75661 (= c!57297 ((_ is Nil!9092) (t!15120 (toList!3990 lm!215))))))

(assert (=> d!75661 (= (size!15137 (t!15120 (toList!3990 lm!215))) lt!217096)))

(declare-fun b!476553 () Bool)

(assert (=> b!476553 (= e!279929 0)))

(declare-fun b!476554 () Bool)

(assert (=> b!476554 (= e!279929 (+ 1 (size!15137 (t!15120 (t!15120 (toList!3990 lm!215))))))))

(assert (= (and d!75661 c!57297) b!476553))

(assert (= (and d!75661 (not c!57297)) b!476554))

(declare-fun m!458363 () Bool)

(assert (=> b!476554 m!458363))

(assert (=> b!476527 d!75661))

(declare-fun d!75663 () Bool)

(declare-fun res!284504 () Bool)

(declare-fun e!279930 () Bool)

(assert (=> d!75663 (=> res!284504 e!279930)))

(assert (=> d!75663 (= res!284504 ((_ is Nil!9092) (t!15120 (toList!3990 lm!215))))))

(assert (=> d!75663 (= (forall!194 (t!15120 (toList!3990 lm!215)) p!166) e!279930)))

(declare-fun b!476555 () Bool)

(declare-fun e!279931 () Bool)

(assert (=> b!476555 (= e!279930 e!279931)))

(declare-fun res!284505 () Bool)

(assert (=> b!476555 (=> (not res!284505) (not e!279931))))

(assert (=> b!476555 (= res!284505 (dynLambda!944 p!166 (h!9947 (t!15120 (toList!3990 lm!215)))))))

(declare-fun b!476556 () Bool)

(assert (=> b!476556 (= e!279931 (forall!194 (t!15120 (t!15120 (toList!3990 lm!215))) p!166))))

(assert (= (and d!75663 (not res!284504)) b!476555))

(assert (= (and b!476555 res!284505) b!476556))

(declare-fun b_lambda!10473 () Bool)

(assert (=> (not b_lambda!10473) (not b!476555)))

(declare-fun t!15140 () Bool)

(declare-fun tb!4001 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15140) tb!4001))

(declare-fun result!7563 () Bool)

(assert (=> tb!4001 (= result!7563 true)))

(assert (=> b!476555 t!15140))

(declare-fun b_and!20679 () Bool)

(assert (= b_and!20677 (and (=> t!15140 result!7563) b_and!20679)))

(declare-fun m!458365 () Bool)

(assert (=> b!476555 m!458365))

(declare-fun m!458367 () Bool)

(assert (=> b!476556 m!458367))

(assert (=> b!476529 d!75663))

(declare-fun d!75665 () Bool)

(declare-fun res!284510 () Bool)

(declare-fun e!279936 () Bool)

(assert (=> d!75665 (=> res!284510 e!279936)))

(assert (=> d!75665 (= res!284510 (or ((_ is Nil!9092) (toList!3990 lm!215)) ((_ is Nil!9092) (t!15120 (toList!3990 lm!215)))))))

(assert (=> d!75665 (= (isStrictlySorted!381 (toList!3990 lm!215)) e!279936)))

(declare-fun b!476561 () Bool)

(declare-fun e!279937 () Bool)

(assert (=> b!476561 (= e!279936 e!279937)))

(declare-fun res!284511 () Bool)

(assert (=> b!476561 (=> (not res!284511) (not e!279937))))

(assert (=> b!476561 (= res!284511 (bvslt (_1!4534 (h!9947 (toList!3990 lm!215))) (_1!4534 (h!9947 (t!15120 (toList!3990 lm!215))))))))

(declare-fun b!476562 () Bool)

(assert (=> b!476562 (= e!279937 (isStrictlySorted!381 (t!15120 (toList!3990 lm!215))))))

(assert (= (and d!75665 (not res!284510)) b!476561))

(assert (= (and b!476561 res!284511) b!476562))

(declare-fun m!458369 () Bool)

(assert (=> b!476562 m!458369))

(assert (=> d!75655 d!75665))

(declare-fun d!75667 () Bool)

(declare-fun res!284512 () Bool)

(declare-fun e!279938 () Bool)

(assert (=> d!75667 (=> res!284512 e!279938)))

(assert (=> d!75667 (= res!284512 ((_ is Nil!9092) (t!15120 (toList!3990 lt!217077))))))

(assert (=> d!75667 (= (forall!194 (t!15120 (toList!3990 lt!217077)) p!166) e!279938)))

(declare-fun b!476563 () Bool)

(declare-fun e!279939 () Bool)

(assert (=> b!476563 (= e!279938 e!279939)))

(declare-fun res!284513 () Bool)

(assert (=> b!476563 (=> (not res!284513) (not e!279939))))

(assert (=> b!476563 (= res!284513 (dynLambda!944 p!166 (h!9947 (t!15120 (toList!3990 lt!217077)))))))

(declare-fun b!476564 () Bool)

(assert (=> b!476564 (= e!279939 (forall!194 (t!15120 (t!15120 (toList!3990 lt!217077))) p!166))))

(assert (= (and d!75667 (not res!284512)) b!476563))

(assert (= (and b!476563 res!284513) b!476564))

(declare-fun b_lambda!10475 () Bool)

(assert (=> (not b_lambda!10475) (not b!476563)))

(declare-fun t!15142 () Bool)

(declare-fun tb!4003 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15142) tb!4003))

(declare-fun result!7565 () Bool)

(assert (=> tb!4003 (= result!7565 true)))

(assert (=> b!476563 t!15142))

(declare-fun b_and!20681 () Bool)

(assert (= b_and!20679 (and (=> t!15142 result!7565) b_and!20681)))

(declare-fun m!458371 () Bool)

(assert (=> b!476563 m!458371))

(declare-fun m!458373 () Bool)

(assert (=> b!476564 m!458373))

(assert (=> b!476509 d!75667))

(declare-fun d!75669 () Bool)

(assert (=> d!75669 (= (isEmpty!602 (toList!3990 lm!215)) ((_ is Nil!9092) (toList!3990 lm!215)))))

(assert (=> d!75647 d!75669))

(declare-fun d!75671 () Bool)

(assert (=> d!75671 (= (tail!122 (toList!3990 lm!215)) (t!15120 (toList!3990 lm!215)))))

(assert (=> d!75631 d!75671))

(declare-fun d!75673 () Bool)

(declare-fun lt!217097 () Int)

(assert (=> d!75673 (>= lt!217097 0)))

(declare-fun e!279940 () Int)

(assert (=> d!75673 (= lt!217097 e!279940)))

(declare-fun c!57298 () Bool)

(assert (=> d!75673 (= c!57298 ((_ is Nil!9092) (t!15120 (toList!3990 lt!217077))))))

(assert (=> d!75673 (= (size!15137 (t!15120 (toList!3990 lt!217077))) lt!217097)))

(declare-fun b!476565 () Bool)

(assert (=> b!476565 (= e!279940 0)))

(declare-fun b!476566 () Bool)

(assert (=> b!476566 (= e!279940 (+ 1 (size!15137 (t!15120 (t!15120 (toList!3990 lt!217077))))))))

(assert (= (and d!75673 c!57298) b!476565))

(assert (= (and d!75673 (not c!57298)) b!476566))

(declare-fun m!458375 () Bool)

(assert (=> b!476566 m!458375))

(assert (=> b!476523 d!75673))

(declare-fun b!476567 () Bool)

(declare-fun e!279941 () Bool)

(declare-fun tp!42389 () Bool)

(assert (=> b!476567 (= e!279941 (and tp_is_empty!13519 tp!42389))))

(assert (=> b!476552 (= tp!42388 e!279941)))

(assert (= (and b!476552 ((_ is Cons!9091) (t!15120 (toList!3990 lm!215)))) b!476567))

(declare-fun b_lambda!10477 () Bool)

(assert (= b_lambda!10473 (or (and start!42796 b_free!12097) b_lambda!10477)))

(declare-fun b_lambda!10479 () Bool)

(assert (= b_lambda!10475 (or (and start!42796 b_free!12097) b_lambda!10479)))

(check-sat (not b!476556) (not b!476566) (not b_lambda!10469) tp_is_empty!13519 (not b_lambda!10445) (not b_lambda!10479) (not b_next!12097) (not b!476562) (not b!476554) (not b!476564) (not b_lambda!10471) (not b!476567) (not b_lambda!10477) b_and!20681)
(check-sat b_and!20681 (not b_next!12097))
