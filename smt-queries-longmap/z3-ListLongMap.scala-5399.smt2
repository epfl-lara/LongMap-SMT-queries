; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72036 () Bool)

(assert start!72036)

(declare-fun b!836497 () Bool)

(declare-fun e!466701 () Bool)

(declare-datatypes ((List!15987 0))(
  ( (Nil!15984) (Cons!15983 (h!17114 (_ BitVec 64)) (t!22358 List!15987)) )
))
(declare-fun lt!380416 () List!15987)

(declare-datatypes ((B!1198 0))(
  ( (B!1199 (val!7681 Int)) )
))
(declare-datatypes ((tuple2!10222 0))(
  ( (tuple2!10223 (_1!5122 (_ BitVec 64)) (_2!5122 B!1198)) )
))
(declare-datatypes ((List!15988 0))(
  ( (Nil!15985) (Cons!15984 (h!17115 tuple2!10222) (t!22359 List!15988)) )
))
(declare-fun l!390 () List!15988)

(declare-fun length!19 (List!15987) Int)

(declare-fun length!20 (List!15988) Int)

(assert (=> b!836497 (= e!466701 (not (= (length!19 lt!380416) (length!20 l!390))))))

(declare-fun res!569081 () Bool)

(declare-fun e!466700 () Bool)

(assert (=> start!72036 (=> (not res!569081) (not e!466700))))

(declare-fun isStrictlySorted!456 (List!15988) Bool)

(assert (=> start!72036 (= res!569081 (isStrictlySorted!456 l!390))))

(assert (=> start!72036 e!466700))

(declare-fun e!466699 () Bool)

(assert (=> start!72036 e!466699))

(declare-fun b!836498 () Bool)

(declare-fun tp_is_empty!15267 () Bool)

(declare-fun tp!47462 () Bool)

(assert (=> b!836498 (= e!466699 (and tp_is_empty!15267 tp!47462))))

(declare-fun b!836496 () Bool)

(assert (=> b!836496 (= e!466700 e!466701)))

(declare-fun res!569079 () Bool)

(assert (=> b!836496 (=> res!569079 e!466701)))

(declare-fun isStrictlySortedLong!0 (List!15987) Bool)

(assert (=> b!836496 (= res!569079 (not (isStrictlySortedLong!0 lt!380416)))))

(declare-fun getKeysList!5 (List!15988) List!15987)

(assert (=> b!836496 (= lt!380416 (Cons!15983 (_1!5122 (h!17115 l!390)) (getKeysList!5 (t!22359 l!390))))))

(declare-fun b!836495 () Bool)

(declare-fun res!569080 () Bool)

(assert (=> b!836495 (=> (not res!569080) (not e!466700))))

(get-info :version)

(assert (=> b!836495 (= res!569080 ((_ is Cons!15984) l!390))))

(assert (= (and start!72036 res!569081) b!836495))

(assert (= (and b!836495 res!569080) b!836496))

(assert (= (and b!836496 (not res!569079)) b!836497))

(assert (= (and start!72036 ((_ is Cons!15984) l!390)) b!836498))

(declare-fun m!781721 () Bool)

(assert (=> b!836497 m!781721))

(declare-fun m!781723 () Bool)

(assert (=> b!836497 m!781723))

(declare-fun m!781725 () Bool)

(assert (=> start!72036 m!781725))

(declare-fun m!781727 () Bool)

(assert (=> b!836496 m!781727))

(declare-fun m!781729 () Bool)

(assert (=> b!836496 m!781729))

(check-sat (not b!836497) (not start!72036) (not b!836498) tp_is_empty!15267 (not b!836496))
(check-sat)
(get-model)

(declare-fun d!107599 () Bool)

(declare-fun size!22896 (List!15987) Int)

(assert (=> d!107599 (= (length!19 lt!380416) (size!22896 lt!380416))))

(declare-fun bs!23488 () Bool)

(assert (= bs!23488 d!107599))

(declare-fun m!781745 () Bool)

(assert (=> bs!23488 m!781745))

(assert (=> b!836497 d!107599))

(declare-fun d!107609 () Bool)

(declare-fun size!22897 (List!15988) Int)

(assert (=> d!107609 (= (length!20 l!390) (size!22897 l!390))))

(declare-fun bs!23489 () Bool)

(assert (= bs!23489 d!107609))

(declare-fun m!781749 () Bool)

(assert (=> bs!23489 m!781749))

(assert (=> b!836497 d!107609))

(declare-fun d!107613 () Bool)

(declare-fun res!569119 () Bool)

(declare-fun e!466739 () Bool)

(assert (=> d!107613 (=> res!569119 e!466739)))

(assert (=> d!107613 (= res!569119 (or ((_ is Nil!15985) l!390) ((_ is Nil!15985) (t!22359 l!390))))))

(assert (=> d!107613 (= (isStrictlySorted!456 l!390) e!466739)))

(declare-fun b!836539 () Bool)

(declare-fun e!466740 () Bool)

(assert (=> b!836539 (= e!466739 e!466740)))

(declare-fun res!569120 () Bool)

(assert (=> b!836539 (=> (not res!569120) (not e!466740))))

(assert (=> b!836539 (= res!569120 (bvslt (_1!5122 (h!17115 l!390)) (_1!5122 (h!17115 (t!22359 l!390)))))))

(declare-fun b!836540 () Bool)

(assert (=> b!836540 (= e!466740 (isStrictlySorted!456 (t!22359 l!390)))))

(assert (= (and d!107613 (not res!569119)) b!836539))

(assert (= (and b!836539 res!569120) b!836540))

(declare-fun m!781757 () Bool)

(assert (=> b!836540 m!781757))

(assert (=> start!72036 d!107613))

(declare-fun d!107621 () Bool)

(declare-fun res!569131 () Bool)

(declare-fun e!466763 () Bool)

(assert (=> d!107621 (=> res!569131 e!466763)))

(assert (=> d!107621 (= res!569131 (or ((_ is Nil!15984) lt!380416) ((_ is Nil!15984) (t!22358 lt!380416))))))

(assert (=> d!107621 (= (isStrictlySortedLong!0 lt!380416) e!466763)))

(declare-fun b!836573 () Bool)

(declare-fun e!466764 () Bool)

(assert (=> b!836573 (= e!466763 e!466764)))

(declare-fun res!569132 () Bool)

(assert (=> b!836573 (=> (not res!569132) (not e!466764))))

(assert (=> b!836573 (= res!569132 (bvslt (h!17114 lt!380416) (h!17114 (t!22358 lt!380416))))))

(declare-fun b!836574 () Bool)

(assert (=> b!836574 (= e!466764 (isStrictlySortedLong!0 (t!22358 lt!380416)))))

(assert (= (and d!107621 (not res!569131)) b!836573))

(assert (= (and b!836573 res!569132) b!836574))

(declare-fun m!781779 () Bool)

(assert (=> b!836574 m!781779))

(assert (=> b!836496 d!107621))

(declare-fun d!107627 () Bool)

(declare-fun e!466770 () Bool)

(assert (=> d!107627 e!466770))

(declare-fun res!569135 () Bool)

(assert (=> d!107627 (=> (not res!569135) (not e!466770))))

(declare-fun lt!380428 () List!15987)

(assert (=> d!107627 (= res!569135 (isStrictlySortedLong!0 lt!380428))))

(declare-fun e!466769 () List!15987)

(assert (=> d!107627 (= lt!380428 e!466769)))

(declare-fun c!91061 () Bool)

(assert (=> d!107627 (= c!91061 ((_ is Cons!15984) (t!22359 l!390)))))

(assert (=> d!107627 (isStrictlySorted!456 (t!22359 l!390))))

(assert (=> d!107627 (= (getKeysList!5 (t!22359 l!390)) lt!380428)))

(declare-fun b!836581 () Bool)

(assert (=> b!836581 (= e!466769 (Cons!15983 (_1!5122 (h!17115 (t!22359 l!390))) (getKeysList!5 (t!22359 (t!22359 l!390)))))))

(declare-fun b!836582 () Bool)

(assert (=> b!836582 (= e!466769 Nil!15984)))

(declare-fun b!836583 () Bool)

(assert (=> b!836583 (= e!466770 (= (length!19 lt!380428) (length!20 (t!22359 l!390))))))

(assert (= (and d!107627 c!91061) b!836581))

(assert (= (and d!107627 (not c!91061)) b!836582))

(assert (= (and d!107627 res!569135) b!836583))

(declare-fun m!781781 () Bool)

(assert (=> d!107627 m!781781))

(assert (=> d!107627 m!781757))

(declare-fun m!781783 () Bool)

(assert (=> b!836581 m!781783))

(declare-fun m!781785 () Bool)

(assert (=> b!836583 m!781785))

(declare-fun m!781787 () Bool)

(assert (=> b!836583 m!781787))

(assert (=> b!836496 d!107627))

(declare-fun b!836588 () Bool)

(declare-fun e!466773 () Bool)

(declare-fun tp!47474 () Bool)

(assert (=> b!836588 (= e!466773 (and tp_is_empty!15267 tp!47474))))

(assert (=> b!836498 (= tp!47462 e!466773)))

(assert (= (and b!836498 ((_ is Cons!15984) (t!22359 l!390))) b!836588))

(check-sat (not d!107627) (not b!836583) (not b!836588) (not b!836540) (not d!107599) (not b!836574) tp_is_empty!15267 (not b!836581) (not d!107609))
(check-sat)
(get-model)

(declare-fun d!107629 () Bool)

(declare-fun e!466775 () Bool)

(assert (=> d!107629 e!466775))

(declare-fun res!569136 () Bool)

(assert (=> d!107629 (=> (not res!569136) (not e!466775))))

(declare-fun lt!380429 () List!15987)

(assert (=> d!107629 (= res!569136 (isStrictlySortedLong!0 lt!380429))))

(declare-fun e!466774 () List!15987)

(assert (=> d!107629 (= lt!380429 e!466774)))

(declare-fun c!91062 () Bool)

(assert (=> d!107629 (= c!91062 ((_ is Cons!15984) (t!22359 (t!22359 l!390))))))

(assert (=> d!107629 (isStrictlySorted!456 (t!22359 (t!22359 l!390)))))

(assert (=> d!107629 (= (getKeysList!5 (t!22359 (t!22359 l!390))) lt!380429)))

(declare-fun b!836589 () Bool)

(assert (=> b!836589 (= e!466774 (Cons!15983 (_1!5122 (h!17115 (t!22359 (t!22359 l!390)))) (getKeysList!5 (t!22359 (t!22359 (t!22359 l!390))))))))

(declare-fun b!836590 () Bool)

(assert (=> b!836590 (= e!466774 Nil!15984)))

(declare-fun b!836591 () Bool)

(assert (=> b!836591 (= e!466775 (= (length!19 lt!380429) (length!20 (t!22359 (t!22359 l!390)))))))

(assert (= (and d!107629 c!91062) b!836589))

(assert (= (and d!107629 (not c!91062)) b!836590))

(assert (= (and d!107629 res!569136) b!836591))

(declare-fun m!781789 () Bool)

(assert (=> d!107629 m!781789))

(declare-fun m!781791 () Bool)

(assert (=> d!107629 m!781791))

(declare-fun m!781793 () Bool)

(assert (=> b!836589 m!781793))

(declare-fun m!781795 () Bool)

(assert (=> b!836591 m!781795))

(declare-fun m!781797 () Bool)

(assert (=> b!836591 m!781797))

(assert (=> b!836581 d!107629))

(declare-fun d!107631 () Bool)

(declare-fun res!569137 () Bool)

(declare-fun e!466776 () Bool)

(assert (=> d!107631 (=> res!569137 e!466776)))

(assert (=> d!107631 (= res!569137 (or ((_ is Nil!15985) (t!22359 l!390)) ((_ is Nil!15985) (t!22359 (t!22359 l!390)))))))

(assert (=> d!107631 (= (isStrictlySorted!456 (t!22359 l!390)) e!466776)))

(declare-fun b!836592 () Bool)

(declare-fun e!466777 () Bool)

(assert (=> b!836592 (= e!466776 e!466777)))

(declare-fun res!569138 () Bool)

(assert (=> b!836592 (=> (not res!569138) (not e!466777))))

(assert (=> b!836592 (= res!569138 (bvslt (_1!5122 (h!17115 (t!22359 l!390))) (_1!5122 (h!17115 (t!22359 (t!22359 l!390))))))))

(declare-fun b!836593 () Bool)

(assert (=> b!836593 (= e!466777 (isStrictlySorted!456 (t!22359 (t!22359 l!390))))))

(assert (= (and d!107631 (not res!569137)) b!836592))

(assert (= (and b!836592 res!569138) b!836593))

(assert (=> b!836593 m!781791))

(assert (=> b!836540 d!107631))

(declare-fun d!107633 () Bool)

(assert (=> d!107633 (= (length!19 lt!380428) (size!22896 lt!380428))))

(declare-fun bs!23492 () Bool)

(assert (= bs!23492 d!107633))

(declare-fun m!781799 () Bool)

(assert (=> bs!23492 m!781799))

(assert (=> b!836583 d!107633))

(declare-fun d!107635 () Bool)

(assert (=> d!107635 (= (length!20 (t!22359 l!390)) (size!22897 (t!22359 l!390)))))

(declare-fun bs!23493 () Bool)

(assert (= bs!23493 d!107635))

(declare-fun m!781801 () Bool)

(assert (=> bs!23493 m!781801))

(assert (=> b!836583 d!107635))

(declare-fun d!107637 () Bool)

(declare-fun lt!380432 () Int)

(assert (=> d!107637 (>= lt!380432 0)))

(declare-fun e!466780 () Int)

(assert (=> d!107637 (= lt!380432 e!466780)))

(declare-fun c!91065 () Bool)

(assert (=> d!107637 (= c!91065 ((_ is Nil!15985) l!390))))

(assert (=> d!107637 (= (size!22897 l!390) lt!380432)))

(declare-fun b!836598 () Bool)

(assert (=> b!836598 (= e!466780 0)))

(declare-fun b!836599 () Bool)

(assert (=> b!836599 (= e!466780 (+ 1 (size!22897 (t!22359 l!390))))))

(assert (= (and d!107637 c!91065) b!836598))

(assert (= (and d!107637 (not c!91065)) b!836599))

(assert (=> b!836599 m!781801))

(assert (=> d!107609 d!107637))

(declare-fun d!107639 () Bool)

(declare-fun res!569139 () Bool)

(declare-fun e!466781 () Bool)

(assert (=> d!107639 (=> res!569139 e!466781)))

(assert (=> d!107639 (= res!569139 (or ((_ is Nil!15984) lt!380428) ((_ is Nil!15984) (t!22358 lt!380428))))))

(assert (=> d!107639 (= (isStrictlySortedLong!0 lt!380428) e!466781)))

(declare-fun b!836600 () Bool)

(declare-fun e!466782 () Bool)

(assert (=> b!836600 (= e!466781 e!466782)))

(declare-fun res!569140 () Bool)

(assert (=> b!836600 (=> (not res!569140) (not e!466782))))

(assert (=> b!836600 (= res!569140 (bvslt (h!17114 lt!380428) (h!17114 (t!22358 lt!380428))))))

(declare-fun b!836601 () Bool)

(assert (=> b!836601 (= e!466782 (isStrictlySortedLong!0 (t!22358 lt!380428)))))

(assert (= (and d!107639 (not res!569139)) b!836600))

(assert (= (and b!836600 res!569140) b!836601))

(declare-fun m!781803 () Bool)

(assert (=> b!836601 m!781803))

(assert (=> d!107627 d!107639))

(assert (=> d!107627 d!107631))

(declare-fun d!107641 () Bool)

(declare-fun res!569141 () Bool)

(declare-fun e!466783 () Bool)

(assert (=> d!107641 (=> res!569141 e!466783)))

(assert (=> d!107641 (= res!569141 (or ((_ is Nil!15984) (t!22358 lt!380416)) ((_ is Nil!15984) (t!22358 (t!22358 lt!380416)))))))

(assert (=> d!107641 (= (isStrictlySortedLong!0 (t!22358 lt!380416)) e!466783)))

(declare-fun b!836602 () Bool)

(declare-fun e!466784 () Bool)

(assert (=> b!836602 (= e!466783 e!466784)))

(declare-fun res!569142 () Bool)

(assert (=> b!836602 (=> (not res!569142) (not e!466784))))

(assert (=> b!836602 (= res!569142 (bvslt (h!17114 (t!22358 lt!380416)) (h!17114 (t!22358 (t!22358 lt!380416)))))))

(declare-fun b!836603 () Bool)

(assert (=> b!836603 (= e!466784 (isStrictlySortedLong!0 (t!22358 (t!22358 lt!380416))))))

(assert (= (and d!107641 (not res!569141)) b!836602))

(assert (= (and b!836602 res!569142) b!836603))

(declare-fun m!781805 () Bool)

(assert (=> b!836603 m!781805))

(assert (=> b!836574 d!107641))

(declare-fun d!107643 () Bool)

(declare-fun lt!380435 () Int)

(assert (=> d!107643 (>= lt!380435 0)))

(declare-fun e!466787 () Int)

(assert (=> d!107643 (= lt!380435 e!466787)))

(declare-fun c!91068 () Bool)

(assert (=> d!107643 (= c!91068 ((_ is Nil!15984) lt!380416))))

(assert (=> d!107643 (= (size!22896 lt!380416) lt!380435)))

(declare-fun b!836608 () Bool)

(assert (=> b!836608 (= e!466787 0)))

(declare-fun b!836609 () Bool)

(assert (=> b!836609 (= e!466787 (+ 1 (size!22896 (t!22358 lt!380416))))))

(assert (= (and d!107643 c!91068) b!836608))

(assert (= (and d!107643 (not c!91068)) b!836609))

(declare-fun m!781807 () Bool)

(assert (=> b!836609 m!781807))

(assert (=> d!107599 d!107643))

(declare-fun b!836612 () Bool)

(declare-fun e!466788 () Bool)

(declare-fun tp!47475 () Bool)

(assert (=> b!836612 (= e!466788 (and tp_is_empty!15267 tp!47475))))

(assert (=> b!836588 (= tp!47474 e!466788)))

(assert (= (and b!836588 ((_ is Cons!15984) (t!22359 (t!22359 l!390)))) b!836612))

(check-sat (not b!836593) (not b!836591) (not b!836589) (not b!836612) (not b!836601) tp_is_empty!15267 (not d!107635) (not b!836603) (not b!836609) (not b!836599) (not d!107633) (not d!107629))
(check-sat)
