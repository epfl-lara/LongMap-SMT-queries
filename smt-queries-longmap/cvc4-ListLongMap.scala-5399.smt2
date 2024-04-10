; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72038 () Bool)

(assert start!72038)

(declare-fun b!836508 () Bool)

(declare-fun e!466709 () Bool)

(declare-fun e!466710 () Bool)

(assert (=> b!836508 (= e!466709 e!466710)))

(declare-fun res!569090 () Bool)

(assert (=> b!836508 (=> res!569090 e!466710)))

(declare-datatypes ((List!15989 0))(
  ( (Nil!15986) (Cons!15985 (h!17116 (_ BitVec 64)) (t!22360 List!15989)) )
))
(declare-fun lt!380419 () List!15989)

(declare-fun isStrictlySortedLong!0 (List!15989) Bool)

(assert (=> b!836508 (= res!569090 (not (isStrictlySortedLong!0 lt!380419)))))

(declare-datatypes ((B!1200 0))(
  ( (B!1201 (val!7682 Int)) )
))
(declare-datatypes ((tuple2!10224 0))(
  ( (tuple2!10225 (_1!5123 (_ BitVec 64)) (_2!5123 B!1200)) )
))
(declare-datatypes ((List!15990 0))(
  ( (Nil!15987) (Cons!15986 (h!17117 tuple2!10224) (t!22361 List!15990)) )
))
(declare-fun l!390 () List!15990)

(declare-fun getKeysList!6 (List!15990) List!15989)

(assert (=> b!836508 (= lt!380419 (Cons!15985 (_1!5123 (h!17117 l!390)) (getKeysList!6 (t!22361 l!390))))))

(declare-fun res!569089 () Bool)

(assert (=> start!72038 (=> (not res!569089) (not e!466709))))

(declare-fun isStrictlySorted!457 (List!15990) Bool)

(assert (=> start!72038 (= res!569089 (isStrictlySorted!457 l!390))))

(assert (=> start!72038 e!466709))

(declare-fun e!466708 () Bool)

(assert (=> start!72038 e!466708))

(declare-fun b!836507 () Bool)

(declare-fun res!569088 () Bool)

(assert (=> b!836507 (=> (not res!569088) (not e!466709))))

(assert (=> b!836507 (= res!569088 (is-Cons!15986 l!390))))

(declare-fun b!836509 () Bool)

(declare-fun length!21 (List!15989) Int)

(declare-fun length!22 (List!15990) Int)

(assert (=> b!836509 (= e!466710 (not (= (length!21 lt!380419) (length!22 l!390))))))

(declare-fun b!836510 () Bool)

(declare-fun tp_is_empty!15269 () Bool)

(declare-fun tp!47465 () Bool)

(assert (=> b!836510 (= e!466708 (and tp_is_empty!15269 tp!47465))))

(assert (= (and start!72038 res!569089) b!836507))

(assert (= (and b!836507 res!569088) b!836508))

(assert (= (and b!836508 (not res!569090)) b!836509))

(assert (= (and start!72038 (is-Cons!15986 l!390)) b!836510))

(declare-fun m!781731 () Bool)

(assert (=> b!836508 m!781731))

(declare-fun m!781733 () Bool)

(assert (=> b!836508 m!781733))

(declare-fun m!781735 () Bool)

(assert (=> start!72038 m!781735))

(declare-fun m!781737 () Bool)

(assert (=> b!836509 m!781737))

(declare-fun m!781739 () Bool)

(assert (=> b!836509 m!781739))

(push 1)

(assert (not b!836510))

(assert (not b!836509))

(assert tp_is_empty!15269)

(assert (not start!72038))

(assert (not b!836508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107603 () Bool)

(declare-fun size!22894 (List!15989) Int)

(assert (=> d!107603 (= (length!21 lt!380419) (size!22894 lt!380419))))

(declare-fun bs!23486 () Bool)

(assert (= bs!23486 d!107603))

(declare-fun m!781741 () Bool)

(assert (=> bs!23486 m!781741))

(assert (=> b!836509 d!107603))

(declare-fun d!107605 () Bool)

(declare-fun size!22895 (List!15990) Int)

(assert (=> d!107605 (= (length!22 l!390) (size!22895 l!390))))

(declare-fun bs!23487 () Bool)

(assert (= bs!23487 d!107605))

(declare-fun m!781743 () Bool)

(assert (=> bs!23487 m!781743))

(assert (=> b!836509 d!107605))

(declare-fun d!107607 () Bool)

(declare-fun res!569101 () Bool)

(declare-fun e!466721 () Bool)

(assert (=> d!107607 (=> res!569101 e!466721)))

(assert (=> d!107607 (= res!569101 (or (is-Nil!15987 l!390) (is-Nil!15987 (t!22361 l!390))))))

(assert (=> d!107607 (= (isStrictlySorted!457 l!390) e!466721)))

(declare-fun b!836521 () Bool)

(declare-fun e!466722 () Bool)

(assert (=> b!836521 (= e!466721 e!466722)))

(declare-fun res!569102 () Bool)

(assert (=> b!836521 (=> (not res!569102) (not e!466722))))

(assert (=> b!836521 (= res!569102 (bvslt (_1!5123 (h!17117 l!390)) (_1!5123 (h!17117 (t!22361 l!390)))))))

(declare-fun b!836522 () Bool)

(assert (=> b!836522 (= e!466722 (isStrictlySorted!457 (t!22361 l!390)))))

(assert (= (and d!107607 (not res!569101)) b!836521))

(assert (= (and b!836521 res!569102) b!836522))

(declare-fun m!781751 () Bool)

(assert (=> b!836522 m!781751))

(assert (=> start!72038 d!107607))

(declare-fun d!107615 () Bool)

(declare-fun res!569117 () Bool)

(declare-fun e!466737 () Bool)

(assert (=> d!107615 (=> res!569117 e!466737)))

(assert (=> d!107615 (= res!569117 (or (is-Nil!15986 lt!380419) (is-Nil!15986 (t!22360 lt!380419))))))

(assert (=> d!107615 (= (isStrictlySortedLong!0 lt!380419) e!466737)))

(declare-fun b!836537 () Bool)

(declare-fun e!466738 () Bool)

(assert (=> b!836537 (= e!466737 e!466738)))

(declare-fun res!569118 () Bool)

(assert (=> b!836537 (=> (not res!569118) (not e!466738))))

(assert (=> b!836537 (= res!569118 (bvslt (h!17116 lt!380419) (h!17116 (t!22360 lt!380419))))))

(declare-fun b!836538 () Bool)

(assert (=> b!836538 (= e!466738 (isStrictlySortedLong!0 (t!22360 lt!380419)))))

(assert (= (and d!107615 (not res!569117)) b!836537))

(assert (= (and b!836537 res!569118) b!836538))

(declare-fun m!781755 () Bool)

(assert (=> b!836538 m!781755))

(assert (=> b!836508 d!107615))

(declare-fun d!107619 () Bool)

(declare-fun e!466755 () Bool)

(assert (=> d!107619 e!466755))

(declare-fun res!569130 () Bool)

(assert (=> d!107619 (=> (not res!569130) (not e!466755))))

(declare-fun lt!380425 () List!15989)

(assert (=> d!107619 (= res!569130 (isStrictlySortedLong!0 lt!380425))))

(declare-fun e!466756 () List!15989)

(assert (=> d!107619 (= lt!380425 e!466756)))

(declare-fun c!91058 () Bool)

(assert (=> d!107619 (= c!91058 (is-Cons!15986 (t!22361 l!390)))))

(assert (=> d!107619 (isStrictlySorted!457 (t!22361 l!390))))

(assert (=> d!107619 (= (getKeysList!6 (t!22361 l!390)) lt!380425)))

(declare-fun b!836560 () Bool)

(assert (=> b!836560 (= e!466756 (Cons!15985 (_1!5123 (h!17117 (t!22361 l!390))) (getKeysList!6 (t!22361 (t!22361 l!390)))))))

(declare-fun b!836561 () Bool)

(assert (=> b!836561 (= e!466756 Nil!15986)))

(declare-fun b!836562 () Bool)

(assert (=> b!836562 (= e!466755 (= (length!21 lt!380425) (length!22 (t!22361 l!390))))))

(assert (= (and d!107619 c!91058) b!836560))

(assert (= (and d!107619 (not c!91058)) b!836561))

(assert (= (and d!107619 res!569130) b!836562))

(declare-fun m!781769 () Bool)

(assert (=> d!107619 m!781769))

(assert (=> d!107619 m!781751))

(declare-fun m!781771 () Bool)

(assert (=> b!836560 m!781771))

(declare-fun m!781773 () Bool)

(assert (=> b!836562 m!781773))

(declare-fun m!781775 () Bool)

(assert (=> b!836562 m!781775))

(assert (=> b!836508 d!107619))

(declare-fun b!836571 () Bool)

(declare-fun e!466761 () Bool)

(declare-fun tp!47470 () Bool)

(assert (=> b!836571 (= e!466761 (and tp_is_empty!15269 tp!47470))))

(assert (=> b!836510 (= tp!47465 e!466761)))

(assert (= (and b!836510 (is-Cons!15986 (t!22361 l!390))) b!836571))

(push 1)

(assert (not b!836522))

(assert tp_is_empty!15269)

(assert (not d!107603))

(assert (not d!107605))

(assert (not d!107619))

(assert (not b!836562))

(assert (not b!836571))

(assert (not b!836560))

(assert (not b!836538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107661 () Bool)

(declare-fun res!569150 () Bool)

(declare-fun e!466804 () Bool)

(assert (=> d!107661 (=> res!569150 e!466804)))

(assert (=> d!107661 (= res!569150 (or (is-Nil!15986 (t!22360 lt!380419)) (is-Nil!15986 (t!22360 (t!22360 lt!380419)))))))

(assert (=> d!107661 (= (isStrictlySortedLong!0 (t!22360 lt!380419)) e!466804)))

(declare-fun b!836633 () Bool)

(declare-fun e!466805 () Bool)

(assert (=> b!836633 (= e!466804 e!466805)))

(declare-fun res!569151 () Bool)

(assert (=> b!836633 (=> (not res!569151) (not e!466805))))

(assert (=> b!836633 (= res!569151 (bvslt (h!17116 (t!22360 lt!380419)) (h!17116 (t!22360 (t!22360 lt!380419)))))))

(declare-fun b!836634 () Bool)

(assert (=> b!836634 (= e!466805 (isStrictlySortedLong!0 (t!22360 (t!22360 lt!380419))))))

(assert (= (and d!107661 (not res!569150)) b!836633))

(assert (= (and b!836633 res!569151) b!836634))

(declare-fun m!781829 () Bool)

(assert (=> b!836634 m!781829))

(assert (=> b!836538 d!107661))

(declare-fun d!107663 () Bool)

(declare-fun lt!380445 () Int)

(assert (=> d!107663 (>= lt!380445 0)))

(declare-fun e!466808 () Int)

(assert (=> d!107663 (= lt!380445 e!466808)))

(declare-fun c!91078 () Bool)

(assert (=> d!107663 (= c!91078 (is-Nil!15986 lt!380419))))

(assert (=> d!107663 (= (size!22894 lt!380419) lt!380445)))

(declare-fun b!836639 () Bool)

(assert (=> b!836639 (= e!466808 0)))

(declare-fun b!836640 () Bool)

(assert (=> b!836640 (= e!466808 (+ 1 (size!22894 (t!22360 lt!380419))))))

(assert (= (and d!107663 c!91078) b!836639))

(assert (= (and d!107663 (not c!91078)) b!836640))

(declare-fun m!781831 () Bool)

(assert (=> b!836640 m!781831))

(assert (=> d!107603 d!107663))

(declare-fun d!107665 () Bool)

(declare-fun res!569152 () Bool)

(declare-fun e!466809 () Bool)

(assert (=> d!107665 (=> res!569152 e!466809)))

(assert (=> d!107665 (= res!569152 (or (is-Nil!15986 lt!380425) (is-Nil!15986 (t!22360 lt!380425))))))

(assert (=> d!107665 (= (isStrictlySortedLong!0 lt!380425) e!466809)))

(declare-fun b!836641 () Bool)

(declare-fun e!466810 () Bool)

(assert (=> b!836641 (= e!466809 e!466810)))

(declare-fun res!569153 () Bool)

(assert (=> b!836641 (=> (not res!569153) (not e!466810))))

(assert (=> b!836641 (= res!569153 (bvslt (h!17116 lt!380425) (h!17116 (t!22360 lt!380425))))))

(declare-fun b!836642 () Bool)

(assert (=> b!836642 (= e!466810 (isStrictlySortedLong!0 (t!22360 lt!380425)))))

(assert (= (and d!107665 (not res!569152)) b!836641))

(assert (= (and b!836641 res!569153) b!836642))

(declare-fun m!781833 () Bool)

(assert (=> b!836642 m!781833))

(assert (=> d!107619 d!107665))

(declare-fun d!107667 () Bool)

(declare-fun res!569154 () Bool)

(declare-fun e!466811 () Bool)

(assert (=> d!107667 (=> res!569154 e!466811)))

(assert (=> d!107667 (= res!569154 (or (is-Nil!15987 (t!22361 l!390)) (is-Nil!15987 (t!22361 (t!22361 l!390)))))))

(assert (=> d!107667 (= (isStrictlySorted!457 (t!22361 l!390)) e!466811)))

(declare-fun b!836643 () Bool)

(declare-fun e!466812 () Bool)

(assert (=> b!836643 (= e!466811 e!466812)))

(declare-fun res!569155 () Bool)

(assert (=> b!836643 (=> (not res!569155) (not e!466812))))

(assert (=> b!836643 (= res!569155 (bvslt (_1!5123 (h!17117 (t!22361 l!390))) (_1!5123 (h!17117 (t!22361 (t!22361 l!390))))))))

(declare-fun b!836644 () Bool)

(assert (=> b!836644 (= e!466812 (isStrictlySorted!457 (t!22361 (t!22361 l!390))))))

(assert (= (and d!107667 (not res!569154)) b!836643))

(assert (= (and b!836643 res!569155) b!836644))

(declare-fun m!781835 () Bool)

(assert (=> b!836644 m!781835))

(assert (=> d!107619 d!107667))

(assert (=> b!836522 d!107667))

(declare-fun d!107669 () Bool)

(assert (=> d!107669 (= (length!21 lt!380425) (size!22894 lt!380425))))

(declare-fun bs!23496 () Bool)

(assert (= bs!23496 d!107669))

(declare-fun m!781837 () Bool)

(assert (=> bs!23496 m!781837))

(assert (=> b!836562 d!107669))

(declare-fun d!107671 () Bool)

(assert (=> d!107671 (= (length!22 (t!22361 l!390)) (size!22895 (t!22361 l!390)))))

(declare-fun bs!23497 () Bool)

(assert (= bs!23497 d!107671))

(declare-fun m!781839 () Bool)

(assert (=> bs!23497 m!781839))

(assert (=> b!836562 d!107671))

(declare-fun d!107673 () Bool)

(declare-fun e!466813 () Bool)

(assert (=> d!107673 e!466813))

(declare-fun res!569156 () Bool)

(assert (=> d!107673 (=> (not res!569156) (not e!466813))))

(declare-fun lt!380446 () List!15989)

(assert (=> d!107673 (= res!569156 (isStrictlySortedLong!0 lt!380446))))

(declare-fun e!466814 () List!15989)

(assert (=> d!107673 (= lt!380446 e!466814)))

(declare-fun c!91079 () Bool)

(assert (=> d!107673 (= c!91079 (is-Cons!15986 (t!22361 (t!22361 l!390))))))

(assert (=> d!107673 (isStrictlySorted!457 (t!22361 (t!22361 l!390)))))

(assert (=> d!107673 (= (getKeysList!6 (t!22361 (t!22361 l!390))) lt!380446)))

(declare-fun b!836645 () Bool)

(assert (=> b!836645 (= e!466814 (Cons!15985 (_1!5123 (h!17117 (t!22361 (t!22361 l!390)))) (getKeysList!6 (t!22361 (t!22361 (t!22361 l!390))))))))

(declare-fun b!836646 () Bool)

(assert (=> b!836646 (= e!466814 Nil!15986)))

(declare-fun b!836647 () Bool)

(assert (=> b!836647 (= e!466813 (= (length!21 lt!380446) (length!22 (t!22361 (t!22361 l!390)))))))

(assert (= (and d!107673 c!91079) b!836645))

(assert (= (and d!107673 (not c!91079)) b!836646))

(assert (= (and d!107673 res!569156) b!836647))

(declare-fun m!781841 () Bool)

(assert (=> d!107673 m!781841))

(assert (=> d!107673 m!781835))

(declare-fun m!781843 () Bool)

(assert (=> b!836645 m!781843))

(declare-fun m!781845 () Bool)

(assert (=> b!836647 m!781845))

(declare-fun m!781847 () Bool)

(assert (=> b!836647 m!781847))

(assert (=> b!836560 d!107673))

(declare-fun d!107675 () Bool)

(declare-fun lt!380449 () Int)

(assert (=> d!107675 (>= lt!380449 0)))

(declare-fun e!466817 () Int)

(assert (=> d!107675 (= lt!380449 e!466817)))

(declare-fun c!91082 () Bool)

(assert (=> d!107675 (= c!91082 (is-Nil!15987 l!390))))

(assert (=> d!107675 (= (size!22895 l!390) lt!380449)))

(declare-fun b!836652 () Bool)

(assert (=> b!836652 (= e!466817 0)))

(declare-fun b!836653 () Bool)

(assert (=> b!836653 (= e!466817 (+ 1 (size!22895 (t!22361 l!390))))))

(assert (= (and d!107675 c!91082) b!836652))

(assert (= (and d!107675 (not c!91082)) b!836653))

(assert (=> b!836653 m!781839))

(assert (=> d!107605 d!107675))

