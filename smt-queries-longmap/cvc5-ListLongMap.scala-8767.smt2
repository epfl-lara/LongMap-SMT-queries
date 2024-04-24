; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106732 () Bool)

(assert start!106732)

(declare-fun res!843454 () Bool)

(declare-fun e!721860 () Bool)

(assert (=> start!106732 (=> (not res!843454) (not e!721860))))

(declare-datatypes ((B!1998 0))(
  ( (B!1999 (val!16334 Int)) )
))
(declare-datatypes ((tuple2!21196 0))(
  ( (tuple2!21197 (_1!10609 (_ BitVec 64)) (_2!10609 B!1998)) )
))
(declare-datatypes ((List!28362 0))(
  ( (Nil!28359) (Cons!28358 (h!29576 tuple2!21196) (t!41875 List!28362)) )
))
(declare-fun l!706 () List!28362)

(declare-fun isStrictlySorted!789 (List!28362) Bool)

(assert (=> start!106732 (= res!843454 (isStrictlySorted!789 l!706))))

(assert (=> start!106732 e!721860))

(declare-fun e!721859 () Bool)

(assert (=> start!106732 e!721859))

(assert (=> start!106732 true))

(declare-fun tp_is_empty!32531 () Bool)

(assert (=> start!106732 tp_is_empty!32531))

(declare-fun b!1267301 () Bool)

(declare-fun tp!96416 () Bool)

(assert (=> b!1267301 (= e!721859 (and tp_is_empty!32531 tp!96416))))

(declare-fun v1!26 () B!1998)

(declare-fun b!1267302 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun removeStrictlySorted!156 (List!28362 (_ BitVec 64)) List!28362)

(declare-fun insertStrictlySorted!468 (List!28362 (_ BitVec 64) B!1998) List!28362)

(assert (=> b!1267302 (= e!721860 (not (= (removeStrictlySorted!156 (insertStrictlySorted!468 l!706 key1!31 v1!26) key1!31) l!706)))))

(assert (=> b!1267302 (= (removeStrictlySorted!156 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26) key1!31) (t!41875 l!706))))

(declare-datatypes ((Unit!42161 0))(
  ( (Unit!42162) )
))
(declare-fun lt!574564 () Unit!42161)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!12 (List!28362 (_ BitVec 64) B!1998) Unit!42161)

(assert (=> b!1267302 (= lt!574564 (lemmaInsertStrictlySortedThenRemoveIsSame!12 (t!41875 l!706) key1!31 v1!26))))

(declare-fun b!1267303 () Bool)

(declare-fun res!843452 () Bool)

(assert (=> b!1267303 (=> (not res!843452) (not e!721860))))

(declare-fun containsKey!660 (List!28362 (_ BitVec 64)) Bool)

(assert (=> b!1267303 (= res!843452 (not (containsKey!660 (t!41875 l!706) key1!31)))))

(declare-fun b!1267304 () Bool)

(declare-fun res!843451 () Bool)

(assert (=> b!1267304 (=> (not res!843451) (not e!721860))))

(assert (=> b!1267304 (= res!843451 (not (containsKey!660 l!706 key1!31)))))

(declare-fun b!1267305 () Bool)

(declare-fun res!843453 () Bool)

(assert (=> b!1267305 (=> (not res!843453) (not e!721860))))

(assert (=> b!1267305 (= res!843453 (is-Cons!28358 l!706))))

(declare-fun b!1267306 () Bool)

(declare-fun res!843455 () Bool)

(assert (=> b!1267306 (=> (not res!843455) (not e!721860))))

(assert (=> b!1267306 (= res!843455 (isStrictlySorted!789 (t!41875 l!706)))))

(assert (= (and start!106732 res!843454) b!1267304))

(assert (= (and b!1267304 res!843451) b!1267305))

(assert (= (and b!1267305 res!843453) b!1267306))

(assert (= (and b!1267306 res!843455) b!1267303))

(assert (= (and b!1267303 res!843452) b!1267302))

(assert (= (and start!106732 (is-Cons!28358 l!706)) b!1267301))

(declare-fun m!1167451 () Bool)

(assert (=> b!1267303 m!1167451))

(declare-fun m!1167453 () Bool)

(assert (=> start!106732 m!1167453))

(declare-fun m!1167455 () Bool)

(assert (=> b!1267302 m!1167455))

(declare-fun m!1167457 () Bool)

(assert (=> b!1267302 m!1167457))

(assert (=> b!1267302 m!1167455))

(declare-fun m!1167459 () Bool)

(assert (=> b!1267302 m!1167459))

(declare-fun m!1167461 () Bool)

(assert (=> b!1267302 m!1167461))

(assert (=> b!1267302 m!1167461))

(declare-fun m!1167463 () Bool)

(assert (=> b!1267302 m!1167463))

(declare-fun m!1167465 () Bool)

(assert (=> b!1267306 m!1167465))

(declare-fun m!1167467 () Bool)

(assert (=> b!1267304 m!1167467))

(push 1)

(assert (not b!1267306))

(assert (not b!1267303))

(assert tp_is_empty!32531)

(assert (not start!106732))

(assert (not b!1267301))

(assert (not b!1267302))

(assert (not b!1267304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139479 () Bool)

(declare-fun res!843464 () Bool)

(declare-fun e!721869 () Bool)

(assert (=> d!139479 (=> res!843464 e!721869)))

(assert (=> d!139479 (= res!843464 (or (is-Nil!28359 (t!41875 l!706)) (is-Nil!28359 (t!41875 (t!41875 l!706)))))))

(assert (=> d!139479 (= (isStrictlySorted!789 (t!41875 l!706)) e!721869)))

(declare-fun b!1267313 () Bool)

(declare-fun e!721870 () Bool)

(assert (=> b!1267313 (= e!721869 e!721870)))

(declare-fun res!843465 () Bool)

(assert (=> b!1267313 (=> (not res!843465) (not e!721870))))

(assert (=> b!1267313 (= res!843465 (bvslt (_1!10609 (h!29576 (t!41875 l!706))) (_1!10609 (h!29576 (t!41875 (t!41875 l!706))))))))

(declare-fun b!1267314 () Bool)

(assert (=> b!1267314 (= e!721870 (isStrictlySorted!789 (t!41875 (t!41875 l!706))))))

(assert (= (and d!139479 (not res!843464)) b!1267313))

(assert (= (and b!1267313 res!843465) b!1267314))

(declare-fun m!1167469 () Bool)

(assert (=> b!1267314 m!1167469))

(assert (=> b!1267306 d!139479))

(declare-fun d!139485 () Bool)

(declare-fun res!843466 () Bool)

(declare-fun e!721871 () Bool)

(assert (=> d!139485 (=> res!843466 e!721871)))

(assert (=> d!139485 (= res!843466 (or (is-Nil!28359 l!706) (is-Nil!28359 (t!41875 l!706))))))

(assert (=> d!139485 (= (isStrictlySorted!789 l!706) e!721871)))

(declare-fun b!1267317 () Bool)

(declare-fun e!721872 () Bool)

(assert (=> b!1267317 (= e!721871 e!721872)))

(declare-fun res!843467 () Bool)

(assert (=> b!1267317 (=> (not res!843467) (not e!721872))))

(assert (=> b!1267317 (= res!843467 (bvslt (_1!10609 (h!29576 l!706)) (_1!10609 (h!29576 (t!41875 l!706)))))))

(declare-fun b!1267318 () Bool)

(assert (=> b!1267318 (= e!721872 (isStrictlySorted!789 (t!41875 l!706)))))

(assert (= (and d!139485 (not res!843466)) b!1267317))

(assert (= (and b!1267317 res!843467) b!1267318))

(assert (=> b!1267318 m!1167465))

(assert (=> start!106732 d!139485))

(declare-fun b!1267356 () Bool)

(declare-fun e!721897 () List!28362)

(assert (=> b!1267356 (= e!721897 Nil!28359)))

(declare-fun b!1267357 () Bool)

(declare-fun $colon$colon!641 (List!28362 tuple2!21196) List!28362)

(assert (=> b!1267357 (= e!721897 ($colon$colon!641 (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) key1!31) (h!29576 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))))))

(declare-fun e!721896 () List!28362)

(declare-fun b!1267358 () Bool)

(assert (=> b!1267358 (= e!721896 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)))))

(declare-fun b!1267359 () Bool)

(declare-fun e!721898 () Bool)

(declare-fun lt!574572 () List!28362)

(assert (=> b!1267359 (= e!721898 (not (containsKey!660 lt!574572 key1!31)))))

(declare-fun d!139487 () Bool)

(assert (=> d!139487 e!721898))

(declare-fun res!843477 () Bool)

(assert (=> d!139487 (=> (not res!843477) (not e!721898))))

(assert (=> d!139487 (= res!843477 (isStrictlySorted!789 lt!574572))))

(assert (=> d!139487 (= lt!574572 e!721896)))

(declare-fun c!123756 () Bool)

(assert (=> d!139487 (= c!123756 (and (is-Cons!28358 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) (= (_1!10609 (h!29576 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!139487 (isStrictlySorted!789 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))))

(assert (=> d!139487 (= (removeStrictlySorted!156 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26) key1!31) lt!574572)))

(declare-fun b!1267360 () Bool)

(assert (=> b!1267360 (= e!721896 e!721897)))

(declare-fun c!123755 () Bool)

(assert (=> b!1267360 (= c!123755 (and (is-Cons!28358 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) (not (= (_1!10609 (h!29576 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) key1!31))))))

(assert (= (and d!139487 c!123756) b!1267358))

(assert (= (and d!139487 (not c!123756)) b!1267360))

(assert (= (and b!1267360 c!123755) b!1267357))

(assert (= (and b!1267360 (not c!123755)) b!1267356))

(assert (= (and d!139487 res!843477) b!1267359))

(declare-fun m!1167481 () Bool)

(assert (=> b!1267357 m!1167481))

(assert (=> b!1267357 m!1167481))

(declare-fun m!1167483 () Bool)

(assert (=> b!1267357 m!1167483))

(declare-fun m!1167485 () Bool)

(assert (=> b!1267359 m!1167485))

(declare-fun m!1167487 () Bool)

(assert (=> d!139487 m!1167487))

(assert (=> d!139487 m!1167455))

(declare-fun m!1167489 () Bool)

(assert (=> d!139487 m!1167489))

(assert (=> b!1267302 d!139487))

(declare-fun b!1267441 () Bool)

(declare-fun e!721944 () List!28362)

(declare-fun call!62510 () List!28362)

(assert (=> b!1267441 (= e!721944 call!62510)))

(declare-fun e!721943 () List!28362)

(declare-fun b!1267442 () Bool)

(declare-fun c!123791 () Bool)

(declare-fun c!123790 () Bool)

(assert (=> b!1267442 (= e!721943 (ite c!123791 (t!41875 l!706) (ite c!123790 (Cons!28358 (h!29576 l!706) (t!41875 l!706)) Nil!28359)))))

(declare-fun c!123789 () Bool)

(declare-fun call!62509 () List!28362)

(declare-fun bm!62506 () Bool)

(assert (=> bm!62506 (= call!62509 ($colon$colon!641 e!721943 (ite c!123789 (h!29576 l!706) (tuple2!21197 key1!31 v1!26))))))

(declare-fun c!123792 () Bool)

(assert (=> bm!62506 (= c!123792 c!123789)))

(declare-fun d!139493 () Bool)

(declare-fun e!721942 () Bool)

(assert (=> d!139493 e!721942))

(declare-fun res!843494 () Bool)

(assert (=> d!139493 (=> (not res!843494) (not e!721942))))

(declare-fun lt!574582 () List!28362)

(assert (=> d!139493 (= res!843494 (isStrictlySorted!789 lt!574582))))

(declare-fun e!721940 () List!28362)

(assert (=> d!139493 (= lt!574582 e!721940)))

(assert (=> d!139493 (= c!123789 (and (is-Cons!28358 l!706) (bvslt (_1!10609 (h!29576 l!706)) key1!31)))))

(assert (=> d!139493 (isStrictlySorted!789 l!706)))

(assert (=> d!139493 (= (insertStrictlySorted!468 l!706 key1!31 v1!26) lt!574582)))

(declare-fun bm!62507 () Bool)

(declare-fun call!62511 () List!28362)

(assert (=> bm!62507 (= call!62510 call!62511)))

(declare-fun b!1267443 () Bool)

(declare-fun contains!7665 (List!28362 tuple2!21196) Bool)

(assert (=> b!1267443 (= e!721942 (contains!7665 lt!574582 (tuple2!21197 key1!31 v1!26)))))

(declare-fun b!1267444 () Bool)

(declare-fun e!721941 () List!28362)

(assert (=> b!1267444 (= e!721940 e!721941)))

(assert (=> b!1267444 (= c!123791 (and (is-Cons!28358 l!706) (= (_1!10609 (h!29576 l!706)) key1!31)))))

(declare-fun b!1267445 () Bool)

(declare-fun res!843495 () Bool)

(assert (=> b!1267445 (=> (not res!843495) (not e!721942))))

(assert (=> b!1267445 (= res!843495 (containsKey!660 lt!574582 key1!31))))

(declare-fun b!1267446 () Bool)

(assert (=> b!1267446 (= e!721944 call!62510)))

(declare-fun b!1267447 () Bool)

(assert (=> b!1267447 (= c!123790 (and (is-Cons!28358 l!706) (bvsgt (_1!10609 (h!29576 l!706)) key1!31)))))

(assert (=> b!1267447 (= e!721941 e!721944)))

(declare-fun b!1267448 () Bool)

(assert (=> b!1267448 (= e!721941 call!62511)))

(declare-fun b!1267449 () Bool)

(assert (=> b!1267449 (= e!721940 call!62509)))

(declare-fun bm!62508 () Bool)

(assert (=> bm!62508 (= call!62511 call!62509)))

(declare-fun b!1267450 () Bool)

(assert (=> b!1267450 (= e!721943 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))))

(assert (= (and d!139493 c!123789) b!1267449))

(assert (= (and d!139493 (not c!123789)) b!1267444))

(assert (= (and b!1267444 c!123791) b!1267448))

(assert (= (and b!1267444 (not c!123791)) b!1267447))

(assert (= (and b!1267447 c!123790) b!1267446))

(assert (= (and b!1267447 (not c!123790)) b!1267441))

(assert (= (or b!1267446 b!1267441) bm!62507))

(assert (= (or b!1267448 bm!62507) bm!62508))

(assert (= (or b!1267449 bm!62508) bm!62506))

(assert (= (and bm!62506 c!123792) b!1267450))

(assert (= (and bm!62506 (not c!123792)) b!1267442))

(assert (= (and d!139493 res!843494) b!1267445))

(assert (= (and b!1267445 res!843495) b!1267443))

(declare-fun m!1167519 () Bool)

(assert (=> b!1267443 m!1167519))

(declare-fun m!1167521 () Bool)

(assert (=> b!1267445 m!1167521))

(declare-fun m!1167523 () Bool)

(assert (=> d!139493 m!1167523))

(assert (=> d!139493 m!1167453))

(declare-fun m!1167525 () Bool)

(assert (=> bm!62506 m!1167525))

(assert (=> b!1267450 m!1167455))

(assert (=> b!1267302 d!139493))

(declare-fun b!1267461 () Bool)

(declare-fun e!721951 () List!28362)

(assert (=> b!1267461 (= e!721951 Nil!28359)))

(declare-fun b!1267462 () Bool)

(assert (=> b!1267462 (= e!721951 ($colon$colon!641 (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) (h!29576 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(declare-fun b!1267463 () Bool)

(declare-fun e!721950 () List!28362)

(assert (=> b!1267463 (= e!721950 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))

(declare-fun b!1267464 () Bool)

(declare-fun e!721952 () Bool)

(declare-fun lt!574584 () List!28362)

(assert (=> b!1267464 (= e!721952 (not (containsKey!660 lt!574584 key1!31)))))

(declare-fun d!139501 () Bool)

(assert (=> d!139501 e!721952))

(declare-fun res!843498 () Bool)

(assert (=> d!139501 (=> (not res!843498) (not e!721952))))

(assert (=> d!139501 (= res!843498 (isStrictlySorted!789 lt!574584))))

(assert (=> d!139501 (= lt!574584 e!721950)))

(declare-fun c!123798 () Bool)

(assert (=> d!139501 (= c!123798 (and (is-Cons!28358 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (= (_1!10609 (h!29576 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139501 (isStrictlySorted!789 (insertStrictlySorted!468 l!706 key1!31 v1!26))))

(assert (=> d!139501 (= (removeStrictlySorted!156 (insertStrictlySorted!468 l!706 key1!31 v1!26) key1!31) lt!574584)))

(declare-fun b!1267465 () Bool)

(assert (=> b!1267465 (= e!721950 e!721951)))

(declare-fun c!123797 () Bool)

(assert (=> b!1267465 (= c!123797 (and (is-Cons!28358 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (not (= (_1!10609 (h!29576 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31))))))

(assert (= (and d!139501 c!123798) b!1267463))

(assert (= (and d!139501 (not c!123798)) b!1267465))

(assert (= (and b!1267465 c!123797) b!1267462))

(assert (= (and b!1267465 (not c!123797)) b!1267461))

(assert (= (and d!139501 res!843498) b!1267464))

(declare-fun m!1167527 () Bool)

(assert (=> b!1267462 m!1167527))

(assert (=> b!1267462 m!1167527))

(declare-fun m!1167531 () Bool)

(assert (=> b!1267462 m!1167531))

(declare-fun m!1167535 () Bool)

(assert (=> b!1267464 m!1167535))

(declare-fun m!1167537 () Bool)

(assert (=> d!139501 m!1167537))

(assert (=> d!139501 m!1167461))

(declare-fun m!1167541 () Bool)

(assert (=> d!139501 m!1167541))

(assert (=> b!1267302 d!139501))

(declare-fun d!139503 () Bool)

(assert (=> d!139503 (= (removeStrictlySorted!156 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26) key1!31) (t!41875 l!706))))

(declare-fun lt!574592 () Unit!42161)

(declare-fun choose!1890 (List!28362 (_ BitVec 64) B!1998) Unit!42161)

(assert (=> d!139503 (= lt!574592 (choose!1890 (t!41875 l!706) key1!31 v1!26))))

(assert (=> d!139503 (isStrictlySorted!789 (t!41875 l!706))))

(assert (=> d!139503 (= (lemmaInsertStrictlySortedThenRemoveIsSame!12 (t!41875 l!706) key1!31 v1!26) lt!574592)))

(declare-fun bs!35851 () Bool)

(assert (= bs!35851 d!139503))

(assert (=> bs!35851 m!1167455))

(assert (=> bs!35851 m!1167455))

(assert (=> bs!35851 m!1167459))

(declare-fun m!1167567 () Bool)

(assert (=> bs!35851 m!1167567))

(assert (=> bs!35851 m!1167465))

(assert (=> b!1267302 d!139503))

(declare-fun b!1267481 () Bool)

(declare-fun e!721965 () List!28362)

(declare-fun call!62519 () List!28362)

(assert (=> b!1267481 (= e!721965 call!62519)))

(declare-fun b!1267482 () Bool)

(declare-fun c!123807 () Bool)

(declare-fun c!123806 () Bool)

(declare-fun e!721964 () List!28362)

(assert (=> b!1267482 (= e!721964 (ite c!123807 (t!41875 (t!41875 l!706)) (ite c!123806 (Cons!28358 (h!29576 (t!41875 l!706)) (t!41875 (t!41875 l!706))) Nil!28359)))))

(declare-fun call!62518 () List!28362)

(declare-fun bm!62515 () Bool)

(declare-fun c!123805 () Bool)

(assert (=> bm!62515 (= call!62518 ($colon$colon!641 e!721964 (ite c!123805 (h!29576 (t!41875 l!706)) (tuple2!21197 key1!31 v1!26))))))

(declare-fun c!123808 () Bool)

(assert (=> bm!62515 (= c!123808 c!123805)))

(declare-fun d!139513 () Bool)

(declare-fun e!721963 () Bool)

(assert (=> d!139513 e!721963))

(declare-fun res!843502 () Bool)

(assert (=> d!139513 (=> (not res!843502) (not e!721963))))

(declare-fun lt!574595 () List!28362)

(assert (=> d!139513 (= res!843502 (isStrictlySorted!789 lt!574595))))

(declare-fun e!721961 () List!28362)

(assert (=> d!139513 (= lt!574595 e!721961)))

(assert (=> d!139513 (= c!123805 (and (is-Cons!28358 (t!41875 l!706)) (bvslt (_1!10609 (h!29576 (t!41875 l!706))) key1!31)))))

(assert (=> d!139513 (isStrictlySorted!789 (t!41875 l!706))))

(assert (=> d!139513 (= (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26) lt!574595)))

(declare-fun bm!62516 () Bool)

(declare-fun call!62520 () List!28362)

(assert (=> bm!62516 (= call!62519 call!62520)))

(declare-fun b!1267483 () Bool)

(assert (=> b!1267483 (= e!721963 (contains!7665 lt!574595 (tuple2!21197 key1!31 v1!26)))))

(declare-fun b!1267484 () Bool)

(declare-fun e!721962 () List!28362)

(assert (=> b!1267484 (= e!721961 e!721962)))

(assert (=> b!1267484 (= c!123807 (and (is-Cons!28358 (t!41875 l!706)) (= (_1!10609 (h!29576 (t!41875 l!706))) key1!31)))))

(declare-fun b!1267485 () Bool)

(declare-fun res!843503 () Bool)

(assert (=> b!1267485 (=> (not res!843503) (not e!721963))))

(assert (=> b!1267485 (= res!843503 (containsKey!660 lt!574595 key1!31))))

(declare-fun b!1267486 () Bool)

(assert (=> b!1267486 (= e!721965 call!62519)))

(declare-fun b!1267487 () Bool)

(assert (=> b!1267487 (= c!123806 (and (is-Cons!28358 (t!41875 l!706)) (bvsgt (_1!10609 (h!29576 (t!41875 l!706))) key1!31)))))

(assert (=> b!1267487 (= e!721962 e!721965)))

(declare-fun b!1267488 () Bool)

(assert (=> b!1267488 (= e!721962 call!62520)))

(declare-fun b!1267489 () Bool)

(assert (=> b!1267489 (= e!721961 call!62518)))

(declare-fun bm!62517 () Bool)

(assert (=> bm!62517 (= call!62520 call!62518)))

(declare-fun b!1267490 () Bool)

(assert (=> b!1267490 (= e!721964 (insertStrictlySorted!468 (t!41875 (t!41875 l!706)) key1!31 v1!26))))

(assert (= (and d!139513 c!123805) b!1267489))

(assert (= (and d!139513 (not c!123805)) b!1267484))

(assert (= (and b!1267484 c!123807) b!1267488))

(assert (= (and b!1267484 (not c!123807)) b!1267487))

(assert (= (and b!1267487 c!123806) b!1267486))

(assert (= (and b!1267487 (not c!123806)) b!1267481))

(assert (= (or b!1267486 b!1267481) bm!62516))

(assert (= (or b!1267488 bm!62516) bm!62517))

(assert (= (or b!1267489 bm!62517) bm!62515))

(assert (= (and bm!62515 c!123808) b!1267490))

(assert (= (and bm!62515 (not c!123808)) b!1267482))

(assert (= (and d!139513 res!843502) b!1267485))

(assert (= (and b!1267485 res!843503) b!1267483))

(declare-fun m!1167571 () Bool)

(assert (=> b!1267483 m!1167571))

(declare-fun m!1167573 () Bool)

(assert (=> b!1267485 m!1167573))

(declare-fun m!1167575 () Bool)

(assert (=> d!139513 m!1167575))

(assert (=> d!139513 m!1167465))

(declare-fun m!1167577 () Bool)

(assert (=> bm!62515 m!1167577))

(declare-fun m!1167579 () Bool)

(assert (=> b!1267490 m!1167579))

(assert (=> b!1267302 d!139513))

(declare-fun d!139517 () Bool)

(declare-fun res!843524 () Bool)

(declare-fun e!721989 () Bool)

(assert (=> d!139517 (=> res!843524 e!721989)))

(assert (=> d!139517 (= res!843524 (and (is-Cons!28358 l!706) (= (_1!10609 (h!29576 l!706)) key1!31)))))

(assert (=> d!139517 (= (containsKey!660 l!706 key1!31) e!721989)))

(declare-fun b!1267519 () Bool)

(declare-fun e!721990 () Bool)

(assert (=> b!1267519 (= e!721989 e!721990)))

(declare-fun res!843525 () Bool)

(assert (=> b!1267519 (=> (not res!843525) (not e!721990))))

(assert (=> b!1267519 (= res!843525 (and (or (not (is-Cons!28358 l!706)) (bvsle (_1!10609 (h!29576 l!706)) key1!31)) (is-Cons!28358 l!706) (bvslt (_1!10609 (h!29576 l!706)) key1!31)))))

(declare-fun b!1267520 () Bool)

(assert (=> b!1267520 (= e!721990 (containsKey!660 (t!41875 l!706) key1!31))))

(assert (= (and d!139517 (not res!843524)) b!1267519))

(assert (= (and b!1267519 res!843525) b!1267520))

(assert (=> b!1267520 m!1167451))

(assert (=> b!1267304 d!139517))

(declare-fun d!139523 () Bool)

(declare-fun res!843528 () Bool)

(declare-fun e!721993 () Bool)

(assert (=> d!139523 (=> res!843528 e!721993)))

(assert (=> d!139523 (= res!843528 (and (is-Cons!28358 (t!41875 l!706)) (= (_1!10609 (h!29576 (t!41875 l!706))) key1!31)))))

(assert (=> d!139523 (= (containsKey!660 (t!41875 l!706) key1!31) e!721993)))

(declare-fun b!1267523 () Bool)

(declare-fun e!721994 () Bool)

(assert (=> b!1267523 (= e!721993 e!721994)))

(declare-fun res!843529 () Bool)

(assert (=> b!1267523 (=> (not res!843529) (not e!721994))))

(assert (=> b!1267523 (= res!843529 (and (or (not (is-Cons!28358 (t!41875 l!706))) (bvsle (_1!10609 (h!29576 (t!41875 l!706))) key1!31)) (is-Cons!28358 (t!41875 l!706)) (bvslt (_1!10609 (h!29576 (t!41875 l!706))) key1!31)))))

(declare-fun b!1267524 () Bool)

(assert (=> b!1267524 (= e!721994 (containsKey!660 (t!41875 (t!41875 l!706)) key1!31))))

(assert (= (and d!139523 (not res!843528)) b!1267523))

(assert (= (and b!1267523 res!843529) b!1267524))

(declare-fun m!1167593 () Bool)

(assert (=> b!1267524 m!1167593))

(assert (=> b!1267303 d!139523))

(declare-fun b!1267539 () Bool)

(declare-fun e!722007 () Bool)

(declare-fun tp!96419 () Bool)

(assert (=> b!1267539 (= e!722007 (and tp_is_empty!32531 tp!96419))))

(assert (=> b!1267301 (= tp!96416 e!722007)))

(assert (= (and b!1267301 (is-Cons!28358 (t!41875 l!706))) b!1267539))

(push 1)

(assert (not b!1267490))

(assert (not b!1267483))

(assert (not d!139501))

(assert tp_is_empty!32531)

(assert (not b!1267357))

(assert (not d!139487))

(assert (not b!1267359))

(assert (not d!139493))

(assert (not b!1267450))

(assert (not b!1267485))

(assert (not b!1267524))

(assert (not b!1267539))

(assert (not bm!62506))

(assert (not d!139513))

(assert (not b!1267443))

(assert (not b!1267464))

(assert (not bm!62515))

(assert (not d!139503))

(assert (not b!1267462))

(assert (not b!1267445))

(assert (not b!1267314))

(assert (not b!1267318))

(assert (not b!1267520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!574605 () Bool)

(declare-fun d!139555 () Bool)

(declare-fun content!632 (List!28362) (Set tuple2!21196))

(assert (=> d!139555 (= lt!574605 (set.member (tuple2!21197 key1!31 v1!26) (content!632 lt!574582)))))

(declare-fun e!722054 () Bool)

(assert (=> d!139555 (= lt!574605 e!722054)))

(declare-fun res!843575 () Bool)

(assert (=> d!139555 (=> (not res!843575) (not e!722054))))

(assert (=> d!139555 (= res!843575 (is-Cons!28358 lt!574582))))

(assert (=> d!139555 (= (contains!7665 lt!574582 (tuple2!21197 key1!31 v1!26)) lt!574605)))

(declare-fun b!1267597 () Bool)

(declare-fun e!722055 () Bool)

(assert (=> b!1267597 (= e!722054 e!722055)))

(declare-fun res!843576 () Bool)

(assert (=> b!1267597 (=> res!843576 e!722055)))

(assert (=> b!1267597 (= res!843576 (= (h!29576 lt!574582) (tuple2!21197 key1!31 v1!26)))))

(declare-fun b!1267598 () Bool)

(assert (=> b!1267598 (= e!722055 (contains!7665 (t!41875 lt!574582) (tuple2!21197 key1!31 v1!26)))))

(assert (= (and d!139555 res!843575) b!1267597))

(assert (= (and b!1267597 (not res!843576)) b!1267598))

(declare-fun m!1167647 () Bool)

(assert (=> d!139555 m!1167647))

(declare-fun m!1167649 () Bool)

(assert (=> d!139555 m!1167649))

(declare-fun m!1167651 () Bool)

(assert (=> b!1267598 m!1167651))

(assert (=> b!1267443 d!139555))

(declare-fun d!139571 () Bool)

(assert (=> d!139571 (= ($colon$colon!641 (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) (h!29576 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (Cons!28358 (h!29576 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1267462 d!139571))

(declare-fun b!1267604 () Bool)

(declare-fun e!722060 () List!28362)

(assert (=> b!1267604 (= e!722060 Nil!28359)))

(declare-fun b!1267605 () Bool)

(assert (=> b!1267605 (= e!722060 ($colon$colon!641 (removeStrictlySorted!156 (t!41875 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31) (h!29576 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))))

(declare-fun b!1267606 () Bool)

(declare-fun e!722059 () List!28362)

(assert (=> b!1267606 (= e!722059 (t!41875 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(declare-fun b!1267607 () Bool)

(declare-fun e!722061 () Bool)

(declare-fun lt!574607 () List!28362)

(assert (=> b!1267607 (= e!722061 (not (containsKey!660 lt!574607 key1!31)))))

(declare-fun d!139577 () Bool)

(assert (=> d!139577 e!722061))

(declare-fun res!843578 () Bool)

(assert (=> d!139577 (=> (not res!843578) (not e!722061))))

(assert (=> d!139577 (= res!843578 (isStrictlySorted!789 lt!574607))))

(assert (=> d!139577 (= lt!574607 e!722059)))

(declare-fun c!123822 () Bool)

(assert (=> d!139577 (= c!123822 (and (is-Cons!28358 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (= (_1!10609 (h!29576 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139577 (isStrictlySorted!789 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))

(assert (=> d!139577 (= (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) lt!574607)))

(declare-fun b!1267608 () Bool)

(assert (=> b!1267608 (= e!722059 e!722060)))

(declare-fun c!123821 () Bool)

(assert (=> b!1267608 (= c!123821 (and (is-Cons!28358 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (not (= (_1!10609 (h!29576 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)))) key1!31))))))

(assert (= (and d!139577 c!123822) b!1267606))

(assert (= (and d!139577 (not c!123822)) b!1267608))

(assert (= (and b!1267608 c!123821) b!1267605))

(assert (= (and b!1267608 (not c!123821)) b!1267604))

(assert (= (and d!139577 res!843578) b!1267607))

(declare-fun m!1167657 () Bool)

(assert (=> b!1267605 m!1167657))

(assert (=> b!1267605 m!1167657))

(declare-fun m!1167661 () Bool)

(assert (=> b!1267605 m!1167661))

(declare-fun m!1167665 () Bool)

(assert (=> b!1267607 m!1167665))

(declare-fun m!1167667 () Bool)

(assert (=> d!139577 m!1167667))

(declare-fun m!1167669 () Bool)

(assert (=> d!139577 m!1167669))

(assert (=> b!1267462 d!139577))

(declare-fun b!1267611 () Bool)

(declare-fun e!722068 () List!28362)

(declare-fun call!62528 () List!28362)

(assert (=> b!1267611 (= e!722068 call!62528)))

(declare-fun e!722067 () List!28362)

(declare-fun c!123824 () Bool)

(declare-fun b!1267612 () Bool)

(declare-fun c!123825 () Bool)

(assert (=> b!1267612 (= e!722067 (ite c!123825 (t!41875 (t!41875 (t!41875 l!706))) (ite c!123824 (Cons!28358 (h!29576 (t!41875 (t!41875 l!706))) (t!41875 (t!41875 (t!41875 l!706)))) Nil!28359)))))

(declare-fun bm!62524 () Bool)

(declare-fun call!62527 () List!28362)

(declare-fun c!123823 () Bool)

(assert (=> bm!62524 (= call!62527 ($colon$colon!641 e!722067 (ite c!123823 (h!29576 (t!41875 (t!41875 l!706))) (tuple2!21197 key1!31 v1!26))))))

(declare-fun c!123826 () Bool)

(assert (=> bm!62524 (= c!123826 c!123823)))

(declare-fun d!139581 () Bool)

(declare-fun e!722066 () Bool)

(assert (=> d!139581 e!722066))

(declare-fun res!843581 () Bool)

(assert (=> d!139581 (=> (not res!843581) (not e!722066))))

(declare-fun lt!574608 () List!28362)

(assert (=> d!139581 (= res!843581 (isStrictlySorted!789 lt!574608))))

(declare-fun e!722064 () List!28362)

(assert (=> d!139581 (= lt!574608 e!722064)))

(assert (=> d!139581 (= c!123823 (and (is-Cons!28358 (t!41875 (t!41875 l!706))) (bvslt (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) key1!31)))))

(assert (=> d!139581 (isStrictlySorted!789 (t!41875 (t!41875 l!706)))))

(assert (=> d!139581 (= (insertStrictlySorted!468 (t!41875 (t!41875 l!706)) key1!31 v1!26) lt!574608)))

(declare-fun bm!62525 () Bool)

(declare-fun call!62529 () List!28362)

(assert (=> bm!62525 (= call!62528 call!62529)))

(declare-fun b!1267613 () Bool)

(assert (=> b!1267613 (= e!722066 (contains!7665 lt!574608 (tuple2!21197 key1!31 v1!26)))))

(declare-fun b!1267614 () Bool)

(declare-fun e!722065 () List!28362)

(assert (=> b!1267614 (= e!722064 e!722065)))

(assert (=> b!1267614 (= c!123825 (and (is-Cons!28358 (t!41875 (t!41875 l!706))) (= (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) key1!31)))))

(declare-fun b!1267615 () Bool)

(declare-fun res!843582 () Bool)

(assert (=> b!1267615 (=> (not res!843582) (not e!722066))))

(assert (=> b!1267615 (= res!843582 (containsKey!660 lt!574608 key1!31))))

(declare-fun b!1267616 () Bool)

(assert (=> b!1267616 (= e!722068 call!62528)))

(declare-fun b!1267617 () Bool)

(assert (=> b!1267617 (= c!123824 (and (is-Cons!28358 (t!41875 (t!41875 l!706))) (bvsgt (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) key1!31)))))

(assert (=> b!1267617 (= e!722065 e!722068)))

(declare-fun b!1267618 () Bool)

(assert (=> b!1267618 (= e!722065 call!62529)))

(declare-fun b!1267619 () Bool)

(assert (=> b!1267619 (= e!722064 call!62527)))

(declare-fun bm!62526 () Bool)

(assert (=> bm!62526 (= call!62529 call!62527)))

(declare-fun b!1267620 () Bool)

(assert (=> b!1267620 (= e!722067 (insertStrictlySorted!468 (t!41875 (t!41875 (t!41875 l!706))) key1!31 v1!26))))

(assert (= (and d!139581 c!123823) b!1267619))

(assert (= (and d!139581 (not c!123823)) b!1267614))

(assert (= (and b!1267614 c!123825) b!1267618))

(assert (= (and b!1267614 (not c!123825)) b!1267617))

(assert (= (and b!1267617 c!123824) b!1267616))

(assert (= (and b!1267617 (not c!123824)) b!1267611))

(assert (= (or b!1267616 b!1267611) bm!62525))

(assert (= (or b!1267618 bm!62525) bm!62526))

(assert (= (or b!1267619 bm!62526) bm!62524))

(assert (= (and bm!62524 c!123826) b!1267620))

(assert (= (and bm!62524 (not c!123826)) b!1267612))

(assert (= (and d!139581 res!843581) b!1267615))

(assert (= (and b!1267615 res!843582) b!1267613))

(declare-fun m!1167673 () Bool)

(assert (=> b!1267613 m!1167673))

(declare-fun m!1167677 () Bool)

(assert (=> b!1267615 m!1167677))

(declare-fun m!1167679 () Bool)

(assert (=> d!139581 m!1167679))

(assert (=> d!139581 m!1167469))

(declare-fun m!1167685 () Bool)

(assert (=> bm!62524 m!1167685))

(declare-fun m!1167687 () Bool)

(assert (=> b!1267620 m!1167687))

(assert (=> b!1267490 d!139581))

(declare-fun d!139585 () Bool)

(declare-fun res!843585 () Bool)

(declare-fun e!722071 () Bool)

(assert (=> d!139585 (=> res!843585 e!722071)))

(assert (=> d!139585 (= res!843585 (and (is-Cons!28358 lt!574582) (= (_1!10609 (h!29576 lt!574582)) key1!31)))))

(assert (=> d!139585 (= (containsKey!660 lt!574582 key1!31) e!722071)))

(declare-fun b!1267623 () Bool)

(declare-fun e!722072 () Bool)

(assert (=> b!1267623 (= e!722071 e!722072)))

(declare-fun res!843586 () Bool)

(assert (=> b!1267623 (=> (not res!843586) (not e!722072))))

(assert (=> b!1267623 (= res!843586 (and (or (not (is-Cons!28358 lt!574582)) (bvsle (_1!10609 (h!29576 lt!574582)) key1!31)) (is-Cons!28358 lt!574582) (bvslt (_1!10609 (h!29576 lt!574582)) key1!31)))))

(declare-fun b!1267624 () Bool)

(assert (=> b!1267624 (= e!722072 (containsKey!660 (t!41875 lt!574582) key1!31))))

(assert (= (and d!139585 (not res!843585)) b!1267623))

(assert (= (and b!1267623 res!843586) b!1267624))

(declare-fun m!1167689 () Bool)

(assert (=> b!1267624 m!1167689))

(assert (=> b!1267445 d!139585))

(declare-fun d!139587 () Bool)

(assert (=> d!139587 (= ($colon$colon!641 e!721964 (ite c!123805 (h!29576 (t!41875 l!706)) (tuple2!21197 key1!31 v1!26))) (Cons!28358 (ite c!123805 (h!29576 (t!41875 l!706)) (tuple2!21197 key1!31 v1!26)) e!721964))))

(assert (=> bm!62515 d!139587))

(declare-fun d!139589 () Bool)

(declare-fun res!843587 () Bool)

(declare-fun e!722074 () Bool)

(assert (=> d!139589 (=> res!843587 e!722074)))

(assert (=> d!139589 (= res!843587 (and (is-Cons!28358 (t!41875 (t!41875 l!706))) (= (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) key1!31)))))

(assert (=> d!139589 (= (containsKey!660 (t!41875 (t!41875 l!706)) key1!31) e!722074)))

(declare-fun b!1267626 () Bool)

(declare-fun e!722075 () Bool)

(assert (=> b!1267626 (= e!722074 e!722075)))

(declare-fun res!843588 () Bool)

(assert (=> b!1267626 (=> (not res!843588) (not e!722075))))

(assert (=> b!1267626 (= res!843588 (and (or (not (is-Cons!28358 (t!41875 (t!41875 l!706)))) (bvsle (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) key1!31)) (is-Cons!28358 (t!41875 (t!41875 l!706))) (bvslt (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) key1!31)))))

(declare-fun b!1267627 () Bool)

(assert (=> b!1267627 (= e!722075 (containsKey!660 (t!41875 (t!41875 (t!41875 l!706))) key1!31))))

(assert (= (and d!139589 (not res!843587)) b!1267626))

(assert (= (and b!1267626 res!843588) b!1267627))

(declare-fun m!1167691 () Bool)

(assert (=> b!1267627 m!1167691))

(assert (=> b!1267524 d!139589))

(declare-fun d!139591 () Bool)

(declare-fun res!843589 () Bool)

(declare-fun e!722076 () Bool)

(assert (=> d!139591 (=> res!843589 e!722076)))

(assert (=> d!139591 (= res!843589 (and (is-Cons!28358 lt!574584) (= (_1!10609 (h!29576 lt!574584)) key1!31)))))

(assert (=> d!139591 (= (containsKey!660 lt!574584 key1!31) e!722076)))

(declare-fun b!1267628 () Bool)

(declare-fun e!722077 () Bool)

(assert (=> b!1267628 (= e!722076 e!722077)))

(declare-fun res!843590 () Bool)

(assert (=> b!1267628 (=> (not res!843590) (not e!722077))))

(assert (=> b!1267628 (= res!843590 (and (or (not (is-Cons!28358 lt!574584)) (bvsle (_1!10609 (h!29576 lt!574584)) key1!31)) (is-Cons!28358 lt!574584) (bvslt (_1!10609 (h!29576 lt!574584)) key1!31)))))

(declare-fun b!1267629 () Bool)

(assert (=> b!1267629 (= e!722077 (containsKey!660 (t!41875 lt!574584) key1!31))))

(assert (= (and d!139591 (not res!843589)) b!1267628))

(assert (= (and b!1267628 res!843590) b!1267629))

(declare-fun m!1167693 () Bool)

(assert (=> b!1267629 m!1167693))

(assert (=> b!1267464 d!139591))

(declare-fun d!139593 () Bool)

(declare-fun res!843591 () Bool)

(declare-fun e!722078 () Bool)

(assert (=> d!139593 (=> res!843591 e!722078)))

(assert (=> d!139593 (= res!843591 (or (is-Nil!28359 lt!574584) (is-Nil!28359 (t!41875 lt!574584))))))

(assert (=> d!139593 (= (isStrictlySorted!789 lt!574584) e!722078)))

(declare-fun b!1267630 () Bool)

(declare-fun e!722079 () Bool)

(assert (=> b!1267630 (= e!722078 e!722079)))

(declare-fun res!843592 () Bool)

(assert (=> b!1267630 (=> (not res!843592) (not e!722079))))

(assert (=> b!1267630 (= res!843592 (bvslt (_1!10609 (h!29576 lt!574584)) (_1!10609 (h!29576 (t!41875 lt!574584)))))))

(declare-fun b!1267631 () Bool)

(assert (=> b!1267631 (= e!722079 (isStrictlySorted!789 (t!41875 lt!574584)))))

(assert (= (and d!139593 (not res!843591)) b!1267630))

(assert (= (and b!1267630 res!843592) b!1267631))

(declare-fun m!1167695 () Bool)

(assert (=> b!1267631 m!1167695))

(assert (=> d!139501 d!139593))

(declare-fun d!139595 () Bool)

(declare-fun res!843593 () Bool)

(declare-fun e!722080 () Bool)

(assert (=> d!139595 (=> res!843593 e!722080)))

(assert (=> d!139595 (= res!843593 (or (is-Nil!28359 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (is-Nil!28359 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))))

(assert (=> d!139595 (= (isStrictlySorted!789 (insertStrictlySorted!468 l!706 key1!31 v1!26)) e!722080)))

(declare-fun b!1267632 () Bool)

(declare-fun e!722081 () Bool)

(assert (=> b!1267632 (= e!722080 e!722081)))

(declare-fun res!843594 () Bool)

(assert (=> b!1267632 (=> (not res!843594) (not e!722081))))

(assert (=> b!1267632 (= res!843594 (bvslt (_1!10609 (h!29576 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (_1!10609 (h!29576 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))))

(declare-fun b!1267633 () Bool)

(assert (=> b!1267633 (= e!722081 (isStrictlySorted!789 (t!41875 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(assert (= (and d!139595 (not res!843593)) b!1267632))

(assert (= (and b!1267632 res!843594) b!1267633))

(assert (=> b!1267633 m!1167669))

(assert (=> d!139501 d!139595))

(assert (=> d!139503 d!139487))

(assert (=> d!139503 d!139513))

(declare-fun d!139597 () Bool)

(assert (=> d!139597 (= (removeStrictlySorted!156 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26) key1!31) (t!41875 l!706))))

(assert (=> d!139597 true))

(declare-fun _$4!64 () Unit!42161)

(assert (=> d!139597 (= (choose!1890 (t!41875 l!706) key1!31 v1!26) _$4!64)))

(declare-fun bs!35854 () Bool)

(assert (= bs!35854 d!139597))

(assert (=> bs!35854 m!1167455))

(assert (=> bs!35854 m!1167455))

(assert (=> bs!35854 m!1167459))

(assert (=> d!139503 d!139597))

(assert (=> d!139503 d!139479))

(declare-fun d!139599 () Bool)

(declare-fun res!843595 () Bool)

(declare-fun e!722082 () Bool)

(assert (=> d!139599 (=> res!843595 e!722082)))

(assert (=> d!139599 (= res!843595 (or (is-Nil!28359 (t!41875 (t!41875 l!706))) (is-Nil!28359 (t!41875 (t!41875 (t!41875 l!706))))))))

(assert (=> d!139599 (= (isStrictlySorted!789 (t!41875 (t!41875 l!706))) e!722082)))

(declare-fun b!1267634 () Bool)

(declare-fun e!722083 () Bool)

(assert (=> b!1267634 (= e!722082 e!722083)))

(declare-fun res!843596 () Bool)

(assert (=> b!1267634 (=> (not res!843596) (not e!722083))))

(assert (=> b!1267634 (= res!843596 (bvslt (_1!10609 (h!29576 (t!41875 (t!41875 l!706)))) (_1!10609 (h!29576 (t!41875 (t!41875 (t!41875 l!706)))))))))

(declare-fun b!1267635 () Bool)

(assert (=> b!1267635 (= e!722083 (isStrictlySorted!789 (t!41875 (t!41875 (t!41875 l!706)))))))

(assert (= (and d!139599 (not res!843595)) b!1267634))

(assert (= (and b!1267634 res!843596) b!1267635))

(declare-fun m!1167697 () Bool)

(assert (=> b!1267635 m!1167697))

(assert (=> b!1267314 d!139599))

(declare-fun d!139601 () Bool)

(declare-fun lt!574610 () Bool)

(assert (=> d!139601 (= lt!574610 (set.member (tuple2!21197 key1!31 v1!26) (content!632 lt!574595)))))

(declare-fun e!722084 () Bool)

(assert (=> d!139601 (= lt!574610 e!722084)))

(declare-fun res!843597 () Bool)

(assert (=> d!139601 (=> (not res!843597) (not e!722084))))

(assert (=> d!139601 (= res!843597 (is-Cons!28358 lt!574595))))

(assert (=> d!139601 (= (contains!7665 lt!574595 (tuple2!21197 key1!31 v1!26)) lt!574610)))

(declare-fun b!1267636 () Bool)

(declare-fun e!722085 () Bool)

(assert (=> b!1267636 (= e!722084 e!722085)))

(declare-fun res!843598 () Bool)

(assert (=> b!1267636 (=> res!843598 e!722085)))

(assert (=> b!1267636 (= res!843598 (= (h!29576 lt!574595) (tuple2!21197 key1!31 v1!26)))))

(declare-fun b!1267637 () Bool)

(assert (=> b!1267637 (= e!722085 (contains!7665 (t!41875 lt!574595) (tuple2!21197 key1!31 v1!26)))))

(assert (= (and d!139601 res!843597) b!1267636))

(assert (= (and b!1267636 (not res!843598)) b!1267637))

(declare-fun m!1167699 () Bool)

(assert (=> d!139601 m!1167699))

(declare-fun m!1167701 () Bool)

(assert (=> d!139601 m!1167701))

(declare-fun m!1167703 () Bool)

(assert (=> b!1267637 m!1167703))

(assert (=> b!1267483 d!139601))

(assert (=> b!1267318 d!139479))

(declare-fun d!139603 () Bool)

(assert (=> d!139603 (= ($colon$colon!641 (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) key1!31) (h!29576 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) (Cons!28358 (h!29576 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) key1!31)))))

(assert (=> b!1267357 d!139603))

(declare-fun b!1267638 () Bool)

(declare-fun e!722087 () List!28362)

(assert (=> b!1267638 (= e!722087 Nil!28359)))

(declare-fun b!1267639 () Bool)

(assert (=> b!1267639 (= e!722087 ($colon$colon!641 (removeStrictlySorted!156 (t!41875 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) key1!31) (h!29576 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)))))))

(declare-fun e!722086 () List!28362)

(declare-fun b!1267640 () Bool)

(assert (=> b!1267640 (= e!722086 (t!41875 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))))))

(declare-fun b!1267641 () Bool)

(declare-fun e!722088 () Bool)

(declare-fun lt!574611 () List!28362)

(assert (=> b!1267641 (= e!722088 (not (containsKey!660 lt!574611 key1!31)))))

(declare-fun d!139605 () Bool)

(assert (=> d!139605 e!722088))

(declare-fun res!843599 () Bool)

(assert (=> d!139605 (=> (not res!843599) (not e!722088))))

(assert (=> d!139605 (= res!843599 (isStrictlySorted!789 lt!574611))))

(assert (=> d!139605 (= lt!574611 e!722086)))

(declare-fun c!123828 () Bool)

(assert (=> d!139605 (= c!123828 (and (is-Cons!28358 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) (= (_1!10609 (h!29576 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)))) key1!31)))))

(assert (=> d!139605 (isStrictlySorted!789 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)))))

(assert (=> d!139605 (= (removeStrictlySorted!156 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) key1!31) lt!574611)))

(declare-fun b!1267642 () Bool)

(assert (=> b!1267642 (= e!722086 e!722087)))

(declare-fun c!123827 () Bool)

(assert (=> b!1267642 (= c!123827 (and (is-Cons!28358 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) (not (= (_1!10609 (h!29576 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)))) key1!31))))))

(assert (= (and d!139605 c!123828) b!1267640))

(assert (= (and d!139605 (not c!123828)) b!1267642))

(assert (= (and b!1267642 c!123827) b!1267639))

(assert (= (and b!1267642 (not c!123827)) b!1267638))

(assert (= (and d!139605 res!843599) b!1267641))

(declare-fun m!1167705 () Bool)

(assert (=> b!1267639 m!1167705))

(assert (=> b!1267639 m!1167705))

(declare-fun m!1167707 () Bool)

(assert (=> b!1267639 m!1167707))

(declare-fun m!1167709 () Bool)

(assert (=> b!1267641 m!1167709))

(declare-fun m!1167711 () Bool)

(assert (=> d!139605 m!1167711))

(declare-fun m!1167713 () Bool)

(assert (=> d!139605 m!1167713))

(assert (=> b!1267357 d!139605))

(declare-fun d!139607 () Bool)

(declare-fun res!843600 () Bool)

(declare-fun e!722089 () Bool)

(assert (=> d!139607 (=> res!843600 e!722089)))

(assert (=> d!139607 (= res!843600 (or (is-Nil!28359 lt!574595) (is-Nil!28359 (t!41875 lt!574595))))))

(assert (=> d!139607 (= (isStrictlySorted!789 lt!574595) e!722089)))

(declare-fun b!1267643 () Bool)

(declare-fun e!722090 () Bool)

(assert (=> b!1267643 (= e!722089 e!722090)))

(declare-fun res!843601 () Bool)

(assert (=> b!1267643 (=> (not res!843601) (not e!722090))))

(assert (=> b!1267643 (= res!843601 (bvslt (_1!10609 (h!29576 lt!574595)) (_1!10609 (h!29576 (t!41875 lt!574595)))))))

(declare-fun b!1267644 () Bool)

(assert (=> b!1267644 (= e!722090 (isStrictlySorted!789 (t!41875 lt!574595)))))

(assert (= (and d!139607 (not res!843600)) b!1267643))

(assert (= (and b!1267643 res!843601) b!1267644))

(declare-fun m!1167715 () Bool)

(assert (=> b!1267644 m!1167715))

(assert (=> d!139513 d!139607))

(assert (=> d!139513 d!139479))

(declare-fun d!139609 () Bool)

(declare-fun res!843602 () Bool)

(declare-fun e!722091 () Bool)

(assert (=> d!139609 (=> res!843602 e!722091)))

(assert (=> d!139609 (= res!843602 (and (is-Cons!28358 lt!574572) (= (_1!10609 (h!29576 lt!574572)) key1!31)))))

(assert (=> d!139609 (= (containsKey!660 lt!574572 key1!31) e!722091)))

(declare-fun b!1267645 () Bool)

(declare-fun e!722092 () Bool)

(assert (=> b!1267645 (= e!722091 e!722092)))

(declare-fun res!843603 () Bool)

(assert (=> b!1267645 (=> (not res!843603) (not e!722092))))

(assert (=> b!1267645 (= res!843603 (and (or (not (is-Cons!28358 lt!574572)) (bvsle (_1!10609 (h!29576 lt!574572)) key1!31)) (is-Cons!28358 lt!574572) (bvslt (_1!10609 (h!29576 lt!574572)) key1!31)))))

(declare-fun b!1267646 () Bool)

(assert (=> b!1267646 (= e!722092 (containsKey!660 (t!41875 lt!574572) key1!31))))

(assert (= (and d!139609 (not res!843602)) b!1267645))

(assert (= (and b!1267645 res!843603) b!1267646))

(declare-fun m!1167717 () Bool)

(assert (=> b!1267646 m!1167717))

(assert (=> b!1267359 d!139609))

(declare-fun d!139611 () Bool)

(declare-fun res!843604 () Bool)

(declare-fun e!722093 () Bool)

(assert (=> d!139611 (=> res!843604 e!722093)))

(assert (=> d!139611 (= res!843604 (and (is-Cons!28358 lt!574595) (= (_1!10609 (h!29576 lt!574595)) key1!31)))))

(assert (=> d!139611 (= (containsKey!660 lt!574595 key1!31) e!722093)))

(declare-fun b!1267647 () Bool)

(declare-fun e!722094 () Bool)

(assert (=> b!1267647 (= e!722093 e!722094)))

(declare-fun res!843605 () Bool)

(assert (=> b!1267647 (=> (not res!843605) (not e!722094))))

(assert (=> b!1267647 (= res!843605 (and (or (not (is-Cons!28358 lt!574595)) (bvsle (_1!10609 (h!29576 lt!574595)) key1!31)) (is-Cons!28358 lt!574595) (bvslt (_1!10609 (h!29576 lt!574595)) key1!31)))))

(declare-fun b!1267648 () Bool)

(assert (=> b!1267648 (= e!722094 (containsKey!660 (t!41875 lt!574595) key1!31))))

(assert (= (and d!139611 (not res!843604)) b!1267647))

(assert (= (and b!1267647 res!843605) b!1267648))

(declare-fun m!1167719 () Bool)

(assert (=> b!1267648 m!1167719))

(assert (=> b!1267485 d!139611))

(declare-fun d!139613 () Bool)

(assert (=> d!139613 (= ($colon$colon!641 e!721943 (ite c!123789 (h!29576 l!706) (tuple2!21197 key1!31 v1!26))) (Cons!28358 (ite c!123789 (h!29576 l!706) (tuple2!21197 key1!31 v1!26)) e!721943))))

(assert (=> bm!62506 d!139613))

(assert (=> b!1267450 d!139513))

(declare-fun d!139615 () Bool)

(declare-fun res!843606 () Bool)

(declare-fun e!722095 () Bool)

(assert (=> d!139615 (=> res!843606 e!722095)))

(assert (=> d!139615 (= res!843606 (or (is-Nil!28359 lt!574572) (is-Nil!28359 (t!41875 lt!574572))))))

(assert (=> d!139615 (= (isStrictlySorted!789 lt!574572) e!722095)))

(declare-fun b!1267649 () Bool)

(declare-fun e!722096 () Bool)

(assert (=> b!1267649 (= e!722095 e!722096)))

(declare-fun res!843607 () Bool)

(assert (=> b!1267649 (=> (not res!843607) (not e!722096))))

(assert (=> b!1267649 (= res!843607 (bvslt (_1!10609 (h!29576 lt!574572)) (_1!10609 (h!29576 (t!41875 lt!574572)))))))

(declare-fun b!1267650 () Bool)

(assert (=> b!1267650 (= e!722096 (isStrictlySorted!789 (t!41875 lt!574572)))))

(assert (= (and d!139615 (not res!843606)) b!1267649))

(assert (= (and b!1267649 res!843607) b!1267650))

(declare-fun m!1167721 () Bool)

(assert (=> b!1267650 m!1167721))

(assert (=> d!139487 d!139615))

(declare-fun d!139617 () Bool)

(declare-fun res!843608 () Bool)

(declare-fun e!722097 () Bool)

(assert (=> d!139617 (=> res!843608 e!722097)))

(assert (=> d!139617 (= res!843608 (or (is-Nil!28359 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) (is-Nil!28359 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)))))))

(assert (=> d!139617 (= (isStrictlySorted!789 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26)) e!722097)))

(declare-fun b!1267651 () Bool)

(declare-fun e!722098 () Bool)

(assert (=> b!1267651 (= e!722097 e!722098)))

(declare-fun res!843609 () Bool)

(assert (=> b!1267651 (=> (not res!843609) (not e!722098))))

(assert (=> b!1267651 (= res!843609 (bvslt (_1!10609 (h!29576 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))) (_1!10609 (h!29576 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))))))))

(declare-fun b!1267652 () Bool)

(assert (=> b!1267652 (= e!722098 (isStrictlySorted!789 (t!41875 (insertStrictlySorted!468 (t!41875 l!706) key1!31 v1!26))))))

(assert (= (and d!139617 (not res!843608)) b!1267651))

(assert (= (and b!1267651 res!843609) b!1267652))

(assert (=> b!1267652 m!1167713))

(assert (=> d!139487 d!139617))

(assert (=> b!1267520 d!139523))

(declare-fun d!139619 () Bool)

(declare-fun res!843610 () Bool)

(declare-fun e!722099 () Bool)

(assert (=> d!139619 (=> res!843610 e!722099)))

(assert (=> d!139619 (= res!843610 (or (is-Nil!28359 lt!574582) (is-Nil!28359 (t!41875 lt!574582))))))

(assert (=> d!139619 (= (isStrictlySorted!789 lt!574582) e!722099)))

(declare-fun b!1267653 () Bool)

(declare-fun e!722100 () Bool)

(assert (=> b!1267653 (= e!722099 e!722100)))

(declare-fun res!843611 () Bool)

(assert (=> b!1267653 (=> (not res!843611) (not e!722100))))

(assert (=> b!1267653 (= res!843611 (bvslt (_1!10609 (h!29576 lt!574582)) (_1!10609 (h!29576 (t!41875 lt!574582)))))))

(declare-fun b!1267654 () Bool)

(assert (=> b!1267654 (= e!722100 (isStrictlySorted!789 (t!41875 lt!574582)))))

(assert (= (and d!139619 (not res!843610)) b!1267653))

(assert (= (and b!1267653 res!843611) b!1267654))

(declare-fun m!1167723 () Bool)

(assert (=> b!1267654 m!1167723))

(assert (=> d!139493 d!139619))

(assert (=> d!139493 d!139485))

(declare-fun b!1267655 () Bool)

(declare-fun e!722101 () Bool)

(declare-fun tp!96427 () Bool)

(assert (=> b!1267655 (= e!722101 (and tp_is_empty!32531 tp!96427))))

(assert (=> b!1267539 (= tp!96419 e!722101)))

(assert (= (and b!1267539 (is-Cons!28358 (t!41875 (t!41875 l!706)))) b!1267655))

(push 1)

(assert (not b!1267654))

(assert tp_is_empty!32531)

(assert (not b!1267613))

(assert (not b!1267635))

(assert (not b!1267652))

(assert (not d!139597))

(assert (not bm!62524))

(assert (not b!1267639))

(assert (not b!1267629))

(assert (not d!139577))

(assert (not b!1267633))

(assert (not d!139601))

(assert (not b!1267627))

(assert (not b!1267631))

(assert (not b!1267620))

(assert (not b!1267655))

(assert (not b!1267598))

(assert (not b!1267641))

(assert (not b!1267646))

(assert (not b!1267615))

(assert (not b!1267624))

(assert (not b!1267605))

(assert (not d!139605))

(assert (not b!1267607))

(assert (not b!1267650))

(assert (not b!1267644))

(assert (not b!1267637))

(assert (not d!139581))

(assert (not b!1267648))

(assert (not d!139555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

