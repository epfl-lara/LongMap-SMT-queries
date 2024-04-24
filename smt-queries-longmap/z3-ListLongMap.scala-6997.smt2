; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88990 () Bool)

(assert start!88990)

(declare-fun res!683893 () Bool)

(declare-fun e!574503 () Bool)

(assert (=> start!88990 (=> (not res!683893) (not e!574503))))

(declare-datatypes ((B!1688 0))(
  ( (B!1689 (val!11928 Int)) )
))
(declare-datatypes ((tuple2!15406 0))(
  ( (tuple2!15407 (_1!7714 (_ BitVec 64)) (_2!7714 B!1688)) )
))
(declare-datatypes ((List!21605 0))(
  ( (Nil!21602) (Cons!21601 (h!22808 tuple2!15406) (t!30601 List!21605)) )
))
(declare-fun l!996 () List!21605)

(declare-fun isStrictlySorted!669 (List!21605) Bool)

(assert (=> start!88990 (= res!683893 (isStrictlySorted!669 l!996))))

(assert (=> start!88990 e!574503))

(declare-fun e!574502 () Bool)

(assert (=> start!88990 e!574502))

(assert (=> start!88990 true))

(declare-fun tp_is_empty!23755 () Bool)

(assert (=> start!88990 tp_is_empty!23755))

(declare-fun b!1020685 () Bool)

(declare-fun res!683895 () Bool)

(declare-fun e!574501 () Bool)

(assert (=> b!1020685 (=> (not res!683895) (not e!574501))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!543 (List!21605 (_ BitVec 64)) Bool)

(assert (=> b!1020685 (= res!683895 (containsKey!543 (t!30601 l!996) key!261))))

(declare-fun b!1020686 () Bool)

(declare-fun res!683897 () Bool)

(assert (=> b!1020686 (=> (not res!683897) (not e!574503))))

(assert (=> b!1020686 (= res!683897 (containsKey!543 l!996 key!261))))

(declare-fun b!1020687 () Bool)

(declare-fun res!683896 () Bool)

(assert (=> b!1020687 (=> (not res!683896) (not e!574501))))

(assert (=> b!1020687 (= res!683896 (isStrictlySorted!669 (t!30601 l!996)))))

(declare-fun b!1020688 () Bool)

(assert (=> b!1020688 (= e!574503 e!574501)))

(declare-fun res!683894 () Bool)

(assert (=> b!1020688 (=> (not res!683894) (not e!574501))))

(get-info :version)

(assert (=> b!1020688 (= res!683894 (and ((_ is Cons!21601) l!996) (bvslt (_1!7714 (h!22808 l!996)) key!261)))))

(declare-fun lt!450175 () List!21605)

(declare-fun value!172 () B!1688)

(declare-fun insertStrictlySorted!360 (List!21605 (_ BitVec 64) B!1688) List!21605)

(assert (=> b!1020688 (= lt!450175 (insertStrictlySorted!360 l!996 key!261 value!172))))

(declare-fun b!1020689 () Bool)

(declare-fun tp!71149 () Bool)

(assert (=> b!1020689 (= e!574502 (and tp_is_empty!23755 tp!71149))))

(declare-fun b!1020690 () Bool)

(declare-fun length!44 (List!21605) Int)

(assert (=> b!1020690 (= e!574501 (not (= (length!44 lt!450175) (length!44 l!996))))))

(assert (=> b!1020690 (= (length!44 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)) (length!44 (t!30601 l!996)))))

(declare-datatypes ((Unit!33288 0))(
  ( (Unit!33289) )
))
(declare-fun lt!450176 () Unit!33288)

(declare-fun lemmaAddExistingKeyPreservesSize!4 (List!21605 (_ BitVec 64) B!1688) Unit!33288)

(assert (=> b!1020690 (= lt!450176 (lemmaAddExistingKeyPreservesSize!4 (t!30601 l!996) key!261 value!172))))

(assert (= (and start!88990 res!683893) b!1020686))

(assert (= (and b!1020686 res!683897) b!1020688))

(assert (= (and b!1020688 res!683894) b!1020687))

(assert (= (and b!1020687 res!683896) b!1020685))

(assert (= (and b!1020685 res!683895) b!1020690))

(assert (= (and start!88990 ((_ is Cons!21601) l!996)) b!1020689))

(declare-fun m!941361 () Bool)

(assert (=> b!1020687 m!941361))

(declare-fun m!941363 () Bool)

(assert (=> b!1020688 m!941363))

(declare-fun m!941365 () Bool)

(assert (=> b!1020686 m!941365))

(declare-fun m!941367 () Bool)

(assert (=> b!1020690 m!941367))

(declare-fun m!941369 () Bool)

(assert (=> b!1020690 m!941369))

(declare-fun m!941371 () Bool)

(assert (=> b!1020690 m!941371))

(declare-fun m!941373 () Bool)

(assert (=> b!1020690 m!941373))

(declare-fun m!941375 () Bool)

(assert (=> b!1020690 m!941375))

(assert (=> b!1020690 m!941367))

(declare-fun m!941377 () Bool)

(assert (=> b!1020690 m!941377))

(declare-fun m!941379 () Bool)

(assert (=> b!1020685 m!941379))

(declare-fun m!941381 () Bool)

(assert (=> start!88990 m!941381))

(check-sat (not b!1020685) (not b!1020686) (not b!1020687) (not b!1020688) (not start!88990) tp_is_empty!23755 (not b!1020689) (not b!1020690))
(check-sat)
(get-model)

(declare-fun b!1020765 () Bool)

(declare-fun e!574550 () List!21605)

(declare-fun call!43149 () List!21605)

(assert (=> b!1020765 (= e!574550 call!43149)))

(declare-fun e!574552 () Bool)

(declare-fun lt!450191 () List!21605)

(declare-fun b!1020766 () Bool)

(declare-fun contains!5931 (List!21605 tuple2!15406) Bool)

(assert (=> b!1020766 (= e!574552 (contains!5931 lt!450191 (tuple2!15407 key!261 value!172)))))

(declare-fun b!1020767 () Bool)

(declare-fun c!103742 () Bool)

(assert (=> b!1020767 (= c!103742 (and ((_ is Cons!21601) l!996) (bvsgt (_1!7714 (h!22808 l!996)) key!261)))))

(declare-fun e!574551 () List!21605)

(assert (=> b!1020767 (= e!574551 e!574550)))

(declare-fun d!122503 () Bool)

(assert (=> d!122503 e!574552))

(declare-fun res!683951 () Bool)

(assert (=> d!122503 (=> (not res!683951) (not e!574552))))

(assert (=> d!122503 (= res!683951 (isStrictlySorted!669 lt!450191))))

(declare-fun e!574553 () List!21605)

(assert (=> d!122503 (= lt!450191 e!574553)))

(declare-fun c!103743 () Bool)

(assert (=> d!122503 (= c!103743 (and ((_ is Cons!21601) l!996) (bvslt (_1!7714 (h!22808 l!996)) key!261)))))

(assert (=> d!122503 (isStrictlySorted!669 l!996)))

(assert (=> d!122503 (= (insertStrictlySorted!360 l!996 key!261 value!172) lt!450191)))

(declare-fun b!1020768 () Bool)

(assert (=> b!1020768 (= e!574553 e!574551)))

(declare-fun c!103740 () Bool)

(assert (=> b!1020768 (= c!103740 (and ((_ is Cons!21601) l!996) (= (_1!7714 (h!22808 l!996)) key!261)))))

(declare-fun bm!43145 () Bool)

(declare-fun call!43150 () List!21605)

(declare-fun e!574554 () List!21605)

(declare-fun $colon$colon!590 (List!21605 tuple2!15406) List!21605)

(assert (=> bm!43145 (= call!43150 ($colon$colon!590 e!574554 (ite c!103743 (h!22808 l!996) (tuple2!15407 key!261 value!172))))))

(declare-fun c!103741 () Bool)

(assert (=> bm!43145 (= c!103741 c!103743)))

(declare-fun b!1020769 () Bool)

(assert (=> b!1020769 (= e!574554 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172))))

(declare-fun bm!43146 () Bool)

(declare-fun call!43148 () List!21605)

(assert (=> bm!43146 (= call!43149 call!43148)))

(declare-fun bm!43147 () Bool)

(assert (=> bm!43147 (= call!43148 call!43150)))

(declare-fun b!1020770 () Bool)

(assert (=> b!1020770 (= e!574550 call!43149)))

(declare-fun b!1020771 () Bool)

(assert (=> b!1020771 (= e!574553 call!43150)))

(declare-fun b!1020772 () Bool)

(assert (=> b!1020772 (= e!574554 (ite c!103740 (t!30601 l!996) (ite c!103742 (Cons!21601 (h!22808 l!996) (t!30601 l!996)) Nil!21602)))))

(declare-fun b!1020773 () Bool)

(assert (=> b!1020773 (= e!574551 call!43148)))

(declare-fun b!1020774 () Bool)

(declare-fun res!683950 () Bool)

(assert (=> b!1020774 (=> (not res!683950) (not e!574552))))

(assert (=> b!1020774 (= res!683950 (containsKey!543 lt!450191 key!261))))

(assert (= (and d!122503 c!103743) b!1020771))

(assert (= (and d!122503 (not c!103743)) b!1020768))

(assert (= (and b!1020768 c!103740) b!1020773))

(assert (= (and b!1020768 (not c!103740)) b!1020767))

(assert (= (and b!1020767 c!103742) b!1020770))

(assert (= (and b!1020767 (not c!103742)) b!1020765))

(assert (= (or b!1020770 b!1020765) bm!43146))

(assert (= (or b!1020773 bm!43146) bm!43147))

(assert (= (or b!1020771 bm!43147) bm!43145))

(assert (= (and bm!43145 c!103741) b!1020769))

(assert (= (and bm!43145 (not c!103741)) b!1020772))

(assert (= (and d!122503 res!683951) b!1020774))

(assert (= (and b!1020774 res!683950) b!1020766))

(assert (=> b!1020769 m!941367))

(declare-fun m!941433 () Bool)

(assert (=> d!122503 m!941433))

(assert (=> d!122503 m!941381))

(declare-fun m!941435 () Bool)

(assert (=> bm!43145 m!941435))

(declare-fun m!941437 () Bool)

(assert (=> b!1020774 m!941437))

(declare-fun m!941439 () Bool)

(assert (=> b!1020766 m!941439))

(assert (=> b!1020688 d!122503))

(declare-fun d!122515 () Bool)

(declare-fun res!683956 () Bool)

(declare-fun e!574565 () Bool)

(assert (=> d!122515 (=> res!683956 e!574565)))

(assert (=> d!122515 (= res!683956 (and ((_ is Cons!21601) l!996) (= (_1!7714 (h!22808 l!996)) key!261)))))

(assert (=> d!122515 (= (containsKey!543 l!996 key!261) e!574565)))

(declare-fun b!1020791 () Bool)

(declare-fun e!574566 () Bool)

(assert (=> b!1020791 (= e!574565 e!574566)))

(declare-fun res!683957 () Bool)

(assert (=> b!1020791 (=> (not res!683957) (not e!574566))))

(assert (=> b!1020791 (= res!683957 (and (or (not ((_ is Cons!21601) l!996)) (bvsle (_1!7714 (h!22808 l!996)) key!261)) ((_ is Cons!21601) l!996) (bvslt (_1!7714 (h!22808 l!996)) key!261)))))

(declare-fun b!1020792 () Bool)

(assert (=> b!1020792 (= e!574566 (containsKey!543 (t!30601 l!996) key!261))))

(assert (= (and d!122515 (not res!683956)) b!1020791))

(assert (= (and b!1020791 res!683957) b!1020792))

(assert (=> b!1020792 m!941379))

(assert (=> b!1020686 d!122515))

(declare-fun d!122517 () Bool)

(declare-fun res!683966 () Bool)

(declare-fun e!574581 () Bool)

(assert (=> d!122517 (=> res!683966 e!574581)))

(assert (=> d!122517 (= res!683966 (or ((_ is Nil!21602) (t!30601 l!996)) ((_ is Nil!21602) (t!30601 (t!30601 l!996)))))))

(assert (=> d!122517 (= (isStrictlySorted!669 (t!30601 l!996)) e!574581)))

(declare-fun b!1020817 () Bool)

(declare-fun e!574582 () Bool)

(assert (=> b!1020817 (= e!574581 e!574582)))

(declare-fun res!683967 () Bool)

(assert (=> b!1020817 (=> (not res!683967) (not e!574582))))

(assert (=> b!1020817 (= res!683967 (bvslt (_1!7714 (h!22808 (t!30601 l!996))) (_1!7714 (h!22808 (t!30601 (t!30601 l!996))))))))

(declare-fun b!1020818 () Bool)

(assert (=> b!1020818 (= e!574582 (isStrictlySorted!669 (t!30601 (t!30601 l!996))))))

(assert (= (and d!122517 (not res!683966)) b!1020817))

(assert (= (and b!1020817 res!683967) b!1020818))

(declare-fun m!941441 () Bool)

(assert (=> b!1020818 m!941441))

(assert (=> b!1020687 d!122517))

(declare-fun d!122519 () Bool)

(declare-fun size!31176 (List!21605) Int)

(assert (=> d!122519 (= (length!44 lt!450175) (size!31176 lt!450175))))

(declare-fun bs!29706 () Bool)

(assert (= bs!29706 d!122519))

(declare-fun m!941443 () Bool)

(assert (=> bs!29706 m!941443))

(assert (=> b!1020690 d!122519))

(declare-fun b!1020819 () Bool)

(declare-fun e!574583 () List!21605)

(declare-fun call!43164 () List!21605)

(assert (=> b!1020819 (= e!574583 call!43164)))

(declare-fun lt!450196 () List!21605)

(declare-fun e!574585 () Bool)

(declare-fun b!1020820 () Bool)

(assert (=> b!1020820 (= e!574585 (contains!5931 lt!450196 (tuple2!15407 key!261 value!172)))))

(declare-fun b!1020821 () Bool)

(declare-fun c!103760 () Bool)

(assert (=> b!1020821 (= c!103760 (and ((_ is Cons!21601) (t!30601 l!996)) (bvsgt (_1!7714 (h!22808 (t!30601 l!996))) key!261)))))

(declare-fun e!574584 () List!21605)

(assert (=> b!1020821 (= e!574584 e!574583)))

(declare-fun d!122521 () Bool)

(assert (=> d!122521 e!574585))

(declare-fun res!683969 () Bool)

(assert (=> d!122521 (=> (not res!683969) (not e!574585))))

(assert (=> d!122521 (= res!683969 (isStrictlySorted!669 lt!450196))))

(declare-fun e!574586 () List!21605)

(assert (=> d!122521 (= lt!450196 e!574586)))

(declare-fun c!103761 () Bool)

(assert (=> d!122521 (= c!103761 (and ((_ is Cons!21601) (t!30601 l!996)) (bvslt (_1!7714 (h!22808 (t!30601 l!996))) key!261)))))

(assert (=> d!122521 (isStrictlySorted!669 (t!30601 l!996))))

(assert (=> d!122521 (= (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172) lt!450196)))

(declare-fun b!1020822 () Bool)

(assert (=> b!1020822 (= e!574586 e!574584)))

(declare-fun c!103758 () Bool)

(assert (=> b!1020822 (= c!103758 (and ((_ is Cons!21601) (t!30601 l!996)) (= (_1!7714 (h!22808 (t!30601 l!996))) key!261)))))

(declare-fun bm!43158 () Bool)

(declare-fun call!43165 () List!21605)

(declare-fun e!574587 () List!21605)

(assert (=> bm!43158 (= call!43165 ($colon$colon!590 e!574587 (ite c!103761 (h!22808 (t!30601 l!996)) (tuple2!15407 key!261 value!172))))))

(declare-fun c!103759 () Bool)

(assert (=> bm!43158 (= c!103759 c!103761)))

(declare-fun b!1020823 () Bool)

(assert (=> b!1020823 (= e!574587 (insertStrictlySorted!360 (t!30601 (t!30601 l!996)) key!261 value!172))))

(declare-fun bm!43159 () Bool)

(declare-fun call!43163 () List!21605)

(assert (=> bm!43159 (= call!43164 call!43163)))

(declare-fun bm!43160 () Bool)

(assert (=> bm!43160 (= call!43163 call!43165)))

(declare-fun b!1020824 () Bool)

(assert (=> b!1020824 (= e!574583 call!43164)))

(declare-fun b!1020825 () Bool)

(assert (=> b!1020825 (= e!574586 call!43165)))

(declare-fun b!1020826 () Bool)

(assert (=> b!1020826 (= e!574587 (ite c!103758 (t!30601 (t!30601 l!996)) (ite c!103760 (Cons!21601 (h!22808 (t!30601 l!996)) (t!30601 (t!30601 l!996))) Nil!21602)))))

(declare-fun b!1020827 () Bool)

(assert (=> b!1020827 (= e!574584 call!43163)))

(declare-fun b!1020828 () Bool)

(declare-fun res!683968 () Bool)

(assert (=> b!1020828 (=> (not res!683968) (not e!574585))))

(assert (=> b!1020828 (= res!683968 (containsKey!543 lt!450196 key!261))))

(assert (= (and d!122521 c!103761) b!1020825))

(assert (= (and d!122521 (not c!103761)) b!1020822))

(assert (= (and b!1020822 c!103758) b!1020827))

(assert (= (and b!1020822 (not c!103758)) b!1020821))

(assert (= (and b!1020821 c!103760) b!1020824))

(assert (= (and b!1020821 (not c!103760)) b!1020819))

(assert (= (or b!1020824 b!1020819) bm!43159))

(assert (= (or b!1020827 bm!43159) bm!43160))

(assert (= (or b!1020825 bm!43160) bm!43158))

(assert (= (and bm!43158 c!103759) b!1020823))

(assert (= (and bm!43158 (not c!103759)) b!1020826))

(assert (= (and d!122521 res!683969) b!1020828))

(assert (= (and b!1020828 res!683968) b!1020820))

(declare-fun m!941445 () Bool)

(assert (=> b!1020823 m!941445))

(declare-fun m!941447 () Bool)

(assert (=> d!122521 m!941447))

(assert (=> d!122521 m!941361))

(declare-fun m!941449 () Bool)

(assert (=> bm!43158 m!941449))

(declare-fun m!941451 () Bool)

(assert (=> b!1020828 m!941451))

(declare-fun m!941453 () Bool)

(assert (=> b!1020820 m!941453))

(assert (=> b!1020690 d!122521))

(declare-fun d!122523 () Bool)

(assert (=> d!122523 (= (length!44 (t!30601 l!996)) (size!31176 (t!30601 l!996)))))

(declare-fun bs!29707 () Bool)

(assert (= bs!29707 d!122523))

(declare-fun m!941455 () Bool)

(assert (=> bs!29707 m!941455))

(assert (=> b!1020690 d!122523))

(declare-fun d!122525 () Bool)

(assert (=> d!122525 (= (length!44 l!996) (size!31176 l!996))))

(declare-fun bs!29708 () Bool)

(assert (= bs!29708 d!122525))

(declare-fun m!941457 () Bool)

(assert (=> bs!29708 m!941457))

(assert (=> b!1020690 d!122525))

(declare-fun d!122527 () Bool)

(assert (=> d!122527 (= (length!44 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)) (length!44 (t!30601 l!996)))))

(declare-fun lt!450200 () Unit!33288)

(declare-fun choose!1680 (List!21605 (_ BitVec 64) B!1688) Unit!33288)

(assert (=> d!122527 (= lt!450200 (choose!1680 (t!30601 l!996) key!261 value!172))))

(assert (=> d!122527 (= (lemmaAddExistingKeyPreservesSize!4 (t!30601 l!996) key!261 value!172) lt!450200)))

(declare-fun bs!29712 () Bool)

(assert (= bs!29712 d!122527))

(assert (=> bs!29712 m!941367))

(assert (=> bs!29712 m!941367))

(assert (=> bs!29712 m!941369))

(assert (=> bs!29712 m!941377))

(declare-fun m!941475 () Bool)

(assert (=> bs!29712 m!941475))

(assert (=> b!1020690 d!122527))

(declare-fun d!122537 () Bool)

(assert (=> d!122537 (= (length!44 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)) (size!31176 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)))))

(declare-fun bs!29713 () Bool)

(assert (= bs!29713 d!122537))

(assert (=> bs!29713 m!941367))

(declare-fun m!941477 () Bool)

(assert (=> bs!29713 m!941477))

(assert (=> b!1020690 d!122537))

(declare-fun d!122539 () Bool)

(declare-fun res!683978 () Bool)

(declare-fun e!574602 () Bool)

(assert (=> d!122539 (=> res!683978 e!574602)))

(assert (=> d!122539 (= res!683978 (and ((_ is Cons!21601) (t!30601 l!996)) (= (_1!7714 (h!22808 (t!30601 l!996))) key!261)))))

(assert (=> d!122539 (= (containsKey!543 (t!30601 l!996) key!261) e!574602)))

(declare-fun b!1020857 () Bool)

(declare-fun e!574603 () Bool)

(assert (=> b!1020857 (= e!574602 e!574603)))

(declare-fun res!683979 () Bool)

(assert (=> b!1020857 (=> (not res!683979) (not e!574603))))

(assert (=> b!1020857 (= res!683979 (and (or (not ((_ is Cons!21601) (t!30601 l!996))) (bvsle (_1!7714 (h!22808 (t!30601 l!996))) key!261)) ((_ is Cons!21601) (t!30601 l!996)) (bvslt (_1!7714 (h!22808 (t!30601 l!996))) key!261)))))

(declare-fun b!1020858 () Bool)

(assert (=> b!1020858 (= e!574603 (containsKey!543 (t!30601 (t!30601 l!996)) key!261))))

(assert (= (and d!122539 (not res!683978)) b!1020857))

(assert (= (and b!1020857 res!683979) b!1020858))

(declare-fun m!941485 () Bool)

(assert (=> b!1020858 m!941485))

(assert (=> b!1020685 d!122539))

(declare-fun d!122541 () Bool)

(declare-fun res!683980 () Bool)

(declare-fun e!574604 () Bool)

(assert (=> d!122541 (=> res!683980 e!574604)))

(assert (=> d!122541 (= res!683980 (or ((_ is Nil!21602) l!996) ((_ is Nil!21602) (t!30601 l!996))))))

(assert (=> d!122541 (= (isStrictlySorted!669 l!996) e!574604)))

(declare-fun b!1020859 () Bool)

(declare-fun e!574605 () Bool)

(assert (=> b!1020859 (= e!574604 e!574605)))

(declare-fun res!683981 () Bool)

(assert (=> b!1020859 (=> (not res!683981) (not e!574605))))

(assert (=> b!1020859 (= res!683981 (bvslt (_1!7714 (h!22808 l!996)) (_1!7714 (h!22808 (t!30601 l!996)))))))

(declare-fun b!1020860 () Bool)

(assert (=> b!1020860 (= e!574605 (isStrictlySorted!669 (t!30601 l!996)))))

(assert (= (and d!122541 (not res!683980)) b!1020859))

(assert (= (and b!1020859 res!683981) b!1020860))

(assert (=> b!1020860 m!941361))

(assert (=> start!88990 d!122541))

(declare-fun b!1020865 () Bool)

(declare-fun e!574608 () Bool)

(declare-fun tp!71158 () Bool)

(assert (=> b!1020865 (= e!574608 (and tp_is_empty!23755 tp!71158))))

(assert (=> b!1020689 (= tp!71149 e!574608)))

(assert (= (and b!1020689 ((_ is Cons!21601) (t!30601 l!996))) b!1020865))

(check-sat (not b!1020818) (not d!122527) (not d!122521) (not b!1020823) (not d!122537) (not b!1020766) (not d!122503) (not b!1020860) (not d!122519) (not b!1020774) (not b!1020828) (not bm!43158) (not b!1020792) (not d!122523) (not b!1020865) (not d!122525) (not b!1020769) (not bm!43145) tp_is_empty!23755 (not b!1020820) (not b!1020858))
(check-sat)
(get-model)

(declare-fun d!122569 () Bool)

(declare-fun lt!450212 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!490 (List!21605) (InoxSet tuple2!15406))

(assert (=> d!122569 (= lt!450212 (select (content!490 lt!450191) (tuple2!15407 key!261 value!172)))))

(declare-fun e!574643 () Bool)

(assert (=> d!122569 (= lt!450212 e!574643)))

(declare-fun res!684004 () Bool)

(assert (=> d!122569 (=> (not res!684004) (not e!574643))))

(assert (=> d!122569 (= res!684004 ((_ is Cons!21601) lt!450191))))

(assert (=> d!122569 (= (contains!5931 lt!450191 (tuple2!15407 key!261 value!172)) lt!450212)))

(declare-fun b!1020914 () Bool)

(declare-fun e!574644 () Bool)

(assert (=> b!1020914 (= e!574643 e!574644)))

(declare-fun res!684005 () Bool)

(assert (=> b!1020914 (=> res!684005 e!574644)))

(assert (=> b!1020914 (= res!684005 (= (h!22808 lt!450191) (tuple2!15407 key!261 value!172)))))

(declare-fun b!1020915 () Bool)

(assert (=> b!1020915 (= e!574644 (contains!5931 (t!30601 lt!450191) (tuple2!15407 key!261 value!172)))))

(assert (= (and d!122569 res!684004) b!1020914))

(assert (= (and b!1020914 (not res!684005)) b!1020915))

(declare-fun m!941523 () Bool)

(assert (=> d!122569 m!941523))

(declare-fun m!941525 () Bool)

(assert (=> d!122569 m!941525))

(declare-fun m!941527 () Bool)

(assert (=> b!1020915 m!941527))

(assert (=> b!1020766 d!122569))

(declare-fun d!122571 () Bool)

(declare-fun lt!450215 () Int)

(assert (=> d!122571 (>= lt!450215 0)))

(declare-fun e!574647 () Int)

(assert (=> d!122571 (= lt!450215 e!574647)))

(declare-fun c!103782 () Bool)

(assert (=> d!122571 (= c!103782 ((_ is Nil!21602) (t!30601 l!996)))))

(assert (=> d!122571 (= (size!31176 (t!30601 l!996)) lt!450215)))

(declare-fun b!1020920 () Bool)

(assert (=> b!1020920 (= e!574647 0)))

(declare-fun b!1020921 () Bool)

(assert (=> b!1020921 (= e!574647 (+ 1 (size!31176 (t!30601 (t!30601 l!996)))))))

(assert (= (and d!122571 c!103782) b!1020920))

(assert (= (and d!122571 (not c!103782)) b!1020921))

(declare-fun m!941529 () Bool)

(assert (=> b!1020921 m!941529))

(assert (=> d!122523 d!122571))

(assert (=> d!122527 d!122537))

(assert (=> d!122527 d!122521))

(assert (=> d!122527 d!122523))

(declare-fun d!122573 () Bool)

(assert (=> d!122573 (= (length!44 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)) (length!44 (t!30601 l!996)))))

(assert (=> d!122573 true))

(declare-fun _$10!25 () Unit!33288)

(assert (=> d!122573 (= (choose!1680 (t!30601 l!996) key!261 value!172) _$10!25)))

(declare-fun bs!29721 () Bool)

(assert (= bs!29721 d!122573))

(assert (=> bs!29721 m!941367))

(assert (=> bs!29721 m!941367))

(assert (=> bs!29721 m!941369))

(assert (=> bs!29721 m!941377))

(assert (=> d!122527 d!122573))

(declare-fun d!122575 () Bool)

(declare-fun res!684006 () Bool)

(declare-fun e!574648 () Bool)

(assert (=> d!122575 (=> res!684006 e!574648)))

(assert (=> d!122575 (= res!684006 (and ((_ is Cons!21601) lt!450191) (= (_1!7714 (h!22808 lt!450191)) key!261)))))

(assert (=> d!122575 (= (containsKey!543 lt!450191 key!261) e!574648)))

(declare-fun b!1020922 () Bool)

(declare-fun e!574649 () Bool)

(assert (=> b!1020922 (= e!574648 e!574649)))

(declare-fun res!684007 () Bool)

(assert (=> b!1020922 (=> (not res!684007) (not e!574649))))

(assert (=> b!1020922 (= res!684007 (and (or (not ((_ is Cons!21601) lt!450191)) (bvsle (_1!7714 (h!22808 lt!450191)) key!261)) ((_ is Cons!21601) lt!450191) (bvslt (_1!7714 (h!22808 lt!450191)) key!261)))))

(declare-fun b!1020923 () Bool)

(assert (=> b!1020923 (= e!574649 (containsKey!543 (t!30601 lt!450191) key!261))))

(assert (= (and d!122575 (not res!684006)) b!1020922))

(assert (= (and b!1020922 res!684007) b!1020923))

(declare-fun m!941531 () Bool)

(assert (=> b!1020923 m!941531))

(assert (=> b!1020774 d!122575))

(declare-fun d!122577 () Bool)

(assert (=> d!122577 (= ($colon$colon!590 e!574587 (ite c!103761 (h!22808 (t!30601 l!996)) (tuple2!15407 key!261 value!172))) (Cons!21601 (ite c!103761 (h!22808 (t!30601 l!996)) (tuple2!15407 key!261 value!172)) e!574587))))

(assert (=> bm!43158 d!122577))

(declare-fun d!122579 () Bool)

(declare-fun lt!450216 () Int)

(assert (=> d!122579 (>= lt!450216 0)))

(declare-fun e!574650 () Int)

(assert (=> d!122579 (= lt!450216 e!574650)))

(declare-fun c!103783 () Bool)

(assert (=> d!122579 (= c!103783 ((_ is Nil!21602) lt!450175))))

(assert (=> d!122579 (= (size!31176 lt!450175) lt!450216)))

(declare-fun b!1020924 () Bool)

(assert (=> b!1020924 (= e!574650 0)))

(declare-fun b!1020925 () Bool)

(assert (=> b!1020925 (= e!574650 (+ 1 (size!31176 (t!30601 lt!450175))))))

(assert (= (and d!122579 c!103783) b!1020924))

(assert (= (and d!122579 (not c!103783)) b!1020925))

(declare-fun m!941533 () Bool)

(assert (=> b!1020925 m!941533))

(assert (=> d!122519 d!122579))

(declare-fun d!122581 () Bool)

(declare-fun lt!450217 () Int)

(assert (=> d!122581 (>= lt!450217 0)))

(declare-fun e!574651 () Int)

(assert (=> d!122581 (= lt!450217 e!574651)))

(declare-fun c!103784 () Bool)

(assert (=> d!122581 (= c!103784 ((_ is Nil!21602) (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)))))

(assert (=> d!122581 (= (size!31176 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)) lt!450217)))

(declare-fun b!1020926 () Bool)

(assert (=> b!1020926 (= e!574651 0)))

(declare-fun b!1020927 () Bool)

(assert (=> b!1020927 (= e!574651 (+ 1 (size!31176 (t!30601 (insertStrictlySorted!360 (t!30601 l!996) key!261 value!172)))))))

(assert (= (and d!122581 c!103784) b!1020926))

(assert (= (and d!122581 (not c!103784)) b!1020927))

(declare-fun m!941535 () Bool)

(assert (=> b!1020927 m!941535))

(assert (=> d!122537 d!122581))

(assert (=> b!1020792 d!122539))

(declare-fun d!122583 () Bool)

(declare-fun res!684008 () Bool)

(declare-fun e!574652 () Bool)

(assert (=> d!122583 (=> res!684008 e!574652)))

(assert (=> d!122583 (= res!684008 (or ((_ is Nil!21602) lt!450196) ((_ is Nil!21602) (t!30601 lt!450196))))))

(assert (=> d!122583 (= (isStrictlySorted!669 lt!450196) e!574652)))

(declare-fun b!1020928 () Bool)

(declare-fun e!574653 () Bool)

(assert (=> b!1020928 (= e!574652 e!574653)))

(declare-fun res!684009 () Bool)

(assert (=> b!1020928 (=> (not res!684009) (not e!574653))))

(assert (=> b!1020928 (= res!684009 (bvslt (_1!7714 (h!22808 lt!450196)) (_1!7714 (h!22808 (t!30601 lt!450196)))))))

(declare-fun b!1020929 () Bool)

(assert (=> b!1020929 (= e!574653 (isStrictlySorted!669 (t!30601 lt!450196)))))

(assert (= (and d!122583 (not res!684008)) b!1020928))

(assert (= (and b!1020928 res!684009) b!1020929))

(declare-fun m!941537 () Bool)

(assert (=> b!1020929 m!941537))

(assert (=> d!122521 d!122583))

(assert (=> d!122521 d!122517))

(declare-fun b!1020930 () Bool)

(declare-fun e!574654 () List!21605)

(declare-fun call!43179 () List!21605)

(assert (=> b!1020930 (= e!574654 call!43179)))

(declare-fun e!574656 () Bool)

(declare-fun b!1020931 () Bool)

(declare-fun lt!450218 () List!21605)

(assert (=> b!1020931 (= e!574656 (contains!5931 lt!450218 (tuple2!15407 key!261 value!172)))))

(declare-fun b!1020932 () Bool)

(declare-fun c!103787 () Bool)

(assert (=> b!1020932 (= c!103787 (and ((_ is Cons!21601) (t!30601 (t!30601 l!996))) (bvsgt (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) key!261)))))

(declare-fun e!574655 () List!21605)

(assert (=> b!1020932 (= e!574655 e!574654)))

(declare-fun d!122585 () Bool)

(assert (=> d!122585 e!574656))

(declare-fun res!684011 () Bool)

(assert (=> d!122585 (=> (not res!684011) (not e!574656))))

(assert (=> d!122585 (= res!684011 (isStrictlySorted!669 lt!450218))))

(declare-fun e!574657 () List!21605)

(assert (=> d!122585 (= lt!450218 e!574657)))

(declare-fun c!103788 () Bool)

(assert (=> d!122585 (= c!103788 (and ((_ is Cons!21601) (t!30601 (t!30601 l!996))) (bvslt (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) key!261)))))

(assert (=> d!122585 (isStrictlySorted!669 (t!30601 (t!30601 l!996)))))

(assert (=> d!122585 (= (insertStrictlySorted!360 (t!30601 (t!30601 l!996)) key!261 value!172) lt!450218)))

(declare-fun b!1020933 () Bool)

(assert (=> b!1020933 (= e!574657 e!574655)))

(declare-fun c!103785 () Bool)

(assert (=> b!1020933 (= c!103785 (and ((_ is Cons!21601) (t!30601 (t!30601 l!996))) (= (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) key!261)))))

(declare-fun e!574658 () List!21605)

(declare-fun call!43180 () List!21605)

(declare-fun bm!43175 () Bool)

(assert (=> bm!43175 (= call!43180 ($colon$colon!590 e!574658 (ite c!103788 (h!22808 (t!30601 (t!30601 l!996))) (tuple2!15407 key!261 value!172))))))

(declare-fun c!103786 () Bool)

(assert (=> bm!43175 (= c!103786 c!103788)))

(declare-fun b!1020934 () Bool)

(assert (=> b!1020934 (= e!574658 (insertStrictlySorted!360 (t!30601 (t!30601 (t!30601 l!996))) key!261 value!172))))

(declare-fun bm!43176 () Bool)

(declare-fun call!43178 () List!21605)

(assert (=> bm!43176 (= call!43179 call!43178)))

(declare-fun bm!43177 () Bool)

(assert (=> bm!43177 (= call!43178 call!43180)))

(declare-fun b!1020935 () Bool)

(assert (=> b!1020935 (= e!574654 call!43179)))

(declare-fun b!1020936 () Bool)

(assert (=> b!1020936 (= e!574657 call!43180)))

(declare-fun b!1020937 () Bool)

(assert (=> b!1020937 (= e!574658 (ite c!103785 (t!30601 (t!30601 (t!30601 l!996))) (ite c!103787 (Cons!21601 (h!22808 (t!30601 (t!30601 l!996))) (t!30601 (t!30601 (t!30601 l!996)))) Nil!21602)))))

(declare-fun b!1020938 () Bool)

(assert (=> b!1020938 (= e!574655 call!43178)))

(declare-fun b!1020939 () Bool)

(declare-fun res!684010 () Bool)

(assert (=> b!1020939 (=> (not res!684010) (not e!574656))))

(assert (=> b!1020939 (= res!684010 (containsKey!543 lt!450218 key!261))))

(assert (= (and d!122585 c!103788) b!1020936))

(assert (= (and d!122585 (not c!103788)) b!1020933))

(assert (= (and b!1020933 c!103785) b!1020938))

(assert (= (and b!1020933 (not c!103785)) b!1020932))

(assert (= (and b!1020932 c!103787) b!1020935))

(assert (= (and b!1020932 (not c!103787)) b!1020930))

(assert (= (or b!1020935 b!1020930) bm!43176))

(assert (= (or b!1020938 bm!43176) bm!43177))

(assert (= (or b!1020936 bm!43177) bm!43175))

(assert (= (and bm!43175 c!103786) b!1020934))

(assert (= (and bm!43175 (not c!103786)) b!1020937))

(assert (= (and d!122585 res!684011) b!1020939))

(assert (= (and b!1020939 res!684010) b!1020931))

(declare-fun m!941539 () Bool)

(assert (=> b!1020934 m!941539))

(declare-fun m!941541 () Bool)

(assert (=> d!122585 m!941541))

(assert (=> d!122585 m!941441))

(declare-fun m!941543 () Bool)

(assert (=> bm!43175 m!941543))

(declare-fun m!941545 () Bool)

(assert (=> b!1020939 m!941545))

(declare-fun m!941547 () Bool)

(assert (=> b!1020931 m!941547))

(assert (=> b!1020823 d!122585))

(declare-fun d!122590 () Bool)

(declare-fun res!684012 () Bool)

(declare-fun e!574659 () Bool)

(assert (=> d!122590 (=> res!684012 e!574659)))

(assert (=> d!122590 (= res!684012 (and ((_ is Cons!21601) lt!450196) (= (_1!7714 (h!22808 lt!450196)) key!261)))))

(assert (=> d!122590 (= (containsKey!543 lt!450196 key!261) e!574659)))

(declare-fun b!1020940 () Bool)

(declare-fun e!574660 () Bool)

(assert (=> b!1020940 (= e!574659 e!574660)))

(declare-fun res!684013 () Bool)

(assert (=> b!1020940 (=> (not res!684013) (not e!574660))))

(assert (=> b!1020940 (= res!684013 (and (or (not ((_ is Cons!21601) lt!450196)) (bvsle (_1!7714 (h!22808 lt!450196)) key!261)) ((_ is Cons!21601) lt!450196) (bvslt (_1!7714 (h!22808 lt!450196)) key!261)))))

(declare-fun b!1020941 () Bool)

(assert (=> b!1020941 (= e!574660 (containsKey!543 (t!30601 lt!450196) key!261))))

(assert (= (and d!122590 (not res!684012)) b!1020940))

(assert (= (and b!1020940 res!684013) b!1020941))

(declare-fun m!941549 () Bool)

(assert (=> b!1020941 m!941549))

(assert (=> b!1020828 d!122590))

(declare-fun lt!450220 () Bool)

(declare-fun d!122593 () Bool)

(assert (=> d!122593 (= lt!450220 (select (content!490 lt!450196) (tuple2!15407 key!261 value!172)))))

(declare-fun e!574666 () Bool)

(assert (=> d!122593 (= lt!450220 e!574666)))

(declare-fun res!684016 () Bool)

(assert (=> d!122593 (=> (not res!684016) (not e!574666))))

(assert (=> d!122593 (= res!684016 ((_ is Cons!21601) lt!450196))))

(assert (=> d!122593 (= (contains!5931 lt!450196 (tuple2!15407 key!261 value!172)) lt!450220)))

(declare-fun b!1020952 () Bool)

(declare-fun e!574667 () Bool)

(assert (=> b!1020952 (= e!574666 e!574667)))

(declare-fun res!684017 () Bool)

(assert (=> b!1020952 (=> res!684017 e!574667)))

(assert (=> b!1020952 (= res!684017 (= (h!22808 lt!450196) (tuple2!15407 key!261 value!172)))))

(declare-fun b!1020953 () Bool)

(assert (=> b!1020953 (= e!574667 (contains!5931 (t!30601 lt!450196) (tuple2!15407 key!261 value!172)))))

(assert (= (and d!122593 res!684016) b!1020952))

(assert (= (and b!1020952 (not res!684017)) b!1020953))

(declare-fun m!941551 () Bool)

(assert (=> d!122593 m!941551))

(declare-fun m!941553 () Bool)

(assert (=> d!122593 m!941553))

(declare-fun m!941555 () Bool)

(assert (=> b!1020953 m!941555))

(assert (=> b!1020820 d!122593))

(declare-fun d!122595 () Bool)

(declare-fun lt!450221 () Int)

(assert (=> d!122595 (>= lt!450221 0)))

(declare-fun e!574668 () Int)

(assert (=> d!122595 (= lt!450221 e!574668)))

(declare-fun c!103793 () Bool)

(assert (=> d!122595 (= c!103793 ((_ is Nil!21602) l!996))))

(assert (=> d!122595 (= (size!31176 l!996) lt!450221)))

(declare-fun b!1020954 () Bool)

(assert (=> b!1020954 (= e!574668 0)))

(declare-fun b!1020955 () Bool)

(assert (=> b!1020955 (= e!574668 (+ 1 (size!31176 (t!30601 l!996))))))

(assert (= (and d!122595 c!103793) b!1020954))

(assert (= (and d!122595 (not c!103793)) b!1020955))

(assert (=> b!1020955 m!941455))

(assert (=> d!122525 d!122595))

(declare-fun d!122597 () Bool)

(declare-fun res!684018 () Bool)

(declare-fun e!574669 () Bool)

(assert (=> d!122597 (=> res!684018 e!574669)))

(assert (=> d!122597 (= res!684018 (and ((_ is Cons!21601) (t!30601 (t!30601 l!996))) (= (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) key!261)))))

(assert (=> d!122597 (= (containsKey!543 (t!30601 (t!30601 l!996)) key!261) e!574669)))

(declare-fun b!1020956 () Bool)

(declare-fun e!574670 () Bool)

(assert (=> b!1020956 (= e!574669 e!574670)))

(declare-fun res!684019 () Bool)

(assert (=> b!1020956 (=> (not res!684019) (not e!574670))))

(assert (=> b!1020956 (= res!684019 (and (or (not ((_ is Cons!21601) (t!30601 (t!30601 l!996)))) (bvsle (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) key!261)) ((_ is Cons!21601) (t!30601 (t!30601 l!996))) (bvslt (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) key!261)))))

(declare-fun b!1020957 () Bool)

(assert (=> b!1020957 (= e!574670 (containsKey!543 (t!30601 (t!30601 (t!30601 l!996))) key!261))))

(assert (= (and d!122597 (not res!684018)) b!1020956))

(assert (= (and b!1020956 res!684019) b!1020957))

(declare-fun m!941567 () Bool)

(assert (=> b!1020957 m!941567))

(assert (=> b!1020858 d!122597))

(declare-fun d!122601 () Bool)

(declare-fun res!684020 () Bool)

(declare-fun e!574671 () Bool)

(assert (=> d!122601 (=> res!684020 e!574671)))

(assert (=> d!122601 (= res!684020 (or ((_ is Nil!21602) (t!30601 (t!30601 l!996))) ((_ is Nil!21602) (t!30601 (t!30601 (t!30601 l!996))))))))

(assert (=> d!122601 (= (isStrictlySorted!669 (t!30601 (t!30601 l!996))) e!574671)))

(declare-fun b!1020958 () Bool)

(declare-fun e!574672 () Bool)

(assert (=> b!1020958 (= e!574671 e!574672)))

(declare-fun res!684021 () Bool)

(assert (=> b!1020958 (=> (not res!684021) (not e!574672))))

(assert (=> b!1020958 (= res!684021 (bvslt (_1!7714 (h!22808 (t!30601 (t!30601 l!996)))) (_1!7714 (h!22808 (t!30601 (t!30601 (t!30601 l!996)))))))))

(declare-fun b!1020959 () Bool)

(assert (=> b!1020959 (= e!574672 (isStrictlySorted!669 (t!30601 (t!30601 (t!30601 l!996)))))))

(assert (= (and d!122601 (not res!684020)) b!1020958))

(assert (= (and b!1020958 res!684021) b!1020959))

(declare-fun m!941569 () Bool)

(assert (=> b!1020959 m!941569))

(assert (=> b!1020818 d!122601))

(assert (=> b!1020769 d!122521))

(declare-fun d!122603 () Bool)

(declare-fun res!684022 () Bool)

(declare-fun e!574673 () Bool)

(assert (=> d!122603 (=> res!684022 e!574673)))

(assert (=> d!122603 (= res!684022 (or ((_ is Nil!21602) lt!450191) ((_ is Nil!21602) (t!30601 lt!450191))))))

(assert (=> d!122603 (= (isStrictlySorted!669 lt!450191) e!574673)))

(declare-fun b!1020960 () Bool)

(declare-fun e!574674 () Bool)

(assert (=> b!1020960 (= e!574673 e!574674)))

(declare-fun res!684023 () Bool)

(assert (=> b!1020960 (=> (not res!684023) (not e!574674))))

(assert (=> b!1020960 (= res!684023 (bvslt (_1!7714 (h!22808 lt!450191)) (_1!7714 (h!22808 (t!30601 lt!450191)))))))

(declare-fun b!1020961 () Bool)

(assert (=> b!1020961 (= e!574674 (isStrictlySorted!669 (t!30601 lt!450191)))))

(assert (= (and d!122603 (not res!684022)) b!1020960))

(assert (= (and b!1020960 res!684023) b!1020961))

(declare-fun m!941571 () Bool)

(assert (=> b!1020961 m!941571))

(assert (=> d!122503 d!122603))

(assert (=> d!122503 d!122541))

(assert (=> b!1020860 d!122517))

(declare-fun d!122605 () Bool)

(assert (=> d!122605 (= ($colon$colon!590 e!574554 (ite c!103743 (h!22808 l!996) (tuple2!15407 key!261 value!172))) (Cons!21601 (ite c!103743 (h!22808 l!996) (tuple2!15407 key!261 value!172)) e!574554))))

(assert (=> bm!43145 d!122605))

(declare-fun b!1020964 () Bool)

(declare-fun e!574675 () Bool)

(declare-fun tp!71165 () Bool)

(assert (=> b!1020964 (= e!574675 (and tp_is_empty!23755 tp!71165))))

(assert (=> b!1020865 (= tp!71158 e!574675)))

(assert (= (and b!1020865 ((_ is Cons!21601) (t!30601 (t!30601 l!996)))) b!1020964))

(check-sat (not b!1020964) (not b!1020915) (not d!122569) (not b!1020957) (not b!1020953) (not d!122585) (not b!1020929) (not d!122593) (not b!1020955) (not b!1020921) (not b!1020941) (not bm!43175) (not b!1020934) (not d!122573) (not b!1020925) (not b!1020923) (not b!1020961) (not b!1020939) (not b!1020927) (not b!1020959) tp_is_empty!23755 (not b!1020931))
(check-sat)
