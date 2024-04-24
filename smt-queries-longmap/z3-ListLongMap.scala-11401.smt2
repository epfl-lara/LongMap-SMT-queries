; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133152 () Bool)

(assert start!133152)

(declare-fun b!1557673 () Bool)

(declare-fun res!1065064 () Bool)

(declare-fun e!867585 () Bool)

(assert (=> b!1557673 (=> (not res!1065064) (not e!867585))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2282 0))(
  ( (B!2283 (val!19227 Int)) )
))
(declare-datatypes ((tuple2!24884 0))(
  ( (tuple2!24885 (_1!12453 (_ BitVec 64)) (_2!12453 B!2282)) )
))
(declare-datatypes ((List!36290 0))(
  ( (Nil!36287) (Cons!36286 (h!37750 tuple2!24884) (t!51003 List!36290)) )
))
(declare-fun l!1177 () List!36290)

(get-info :version)

(assert (=> b!1557673 (= res!1065064 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36286) l!1177) (not (= (_1!12453 (h!37750 l!1177)) otherKey!50))))))

(declare-fun b!1557674 () Bool)

(declare-fun e!867586 () Bool)

(assert (=> b!1557674 (= e!867585 (not e!867586))))

(declare-fun res!1065063 () Bool)

(assert (=> b!1557674 (=> res!1065063 e!867586)))

(declare-fun lt!671165 () List!36290)

(declare-fun containsKey!791 (List!36290 (_ BitVec 64)) Bool)

(assert (=> b!1557674 (= res!1065063 (not (= (containsKey!791 lt!671165 otherKey!50) (containsKey!791 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2282)

(declare-fun insertStrictlySorted!532 (List!36290 (_ BitVec 64) B!2282) List!36290)

(assert (=> b!1557674 (= lt!671165 (insertStrictlySorted!532 l!1177 newKey!105 newValue!105))))

(declare-fun e!867584 () Bool)

(assert (=> b!1557674 e!867584))

(declare-fun res!1065065 () Bool)

(assert (=> b!1557674 (=> (not res!1065065) (not e!867584))))

(declare-fun lt!671167 () List!36290)

(assert (=> b!1557674 (= res!1065065 (= (containsKey!791 lt!671167 otherKey!50) (containsKey!791 (t!51003 l!1177) otherKey!50)))))

(assert (=> b!1557674 (= lt!671167 (insertStrictlySorted!532 (t!51003 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51737 0))(
  ( (Unit!51738) )
))
(declare-fun lt!671166 () Unit!51737)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (List!36290 (_ BitVec 64) B!2282 (_ BitVec 64)) Unit!51737)

(assert (=> b!1557674 (= lt!671166 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (t!51003 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1557675 () Bool)

(declare-fun e!867587 () Bool)

(declare-fun tp_is_empty!38293 () Bool)

(declare-fun tp!112272 () Bool)

(assert (=> b!1557675 (= e!867587 (and tp_is_empty!38293 tp!112272))))

(declare-fun b!1557672 () Bool)

(declare-fun isStrictlySorted!907 (List!36290) Bool)

(assert (=> b!1557672 (= e!867586 (isStrictlySorted!907 lt!671165))))

(declare-fun res!1065066 () Bool)

(assert (=> start!133152 (=> (not res!1065066) (not e!867585))))

(assert (=> start!133152 (= res!1065066 (isStrictlySorted!907 l!1177))))

(assert (=> start!133152 e!867585))

(assert (=> start!133152 e!867587))

(assert (=> start!133152 true))

(assert (=> start!133152 tp_is_empty!38293))

(declare-fun b!1557676 () Bool)

(declare-datatypes ((Option!840 0))(
  ( (Some!839 (v!22021 B!2282)) (None!838) )
))
(declare-fun getValueByKey!765 (List!36290 (_ BitVec 64)) Option!840)

(assert (=> b!1557676 (= e!867584 (= (getValueByKey!765 lt!671167 otherKey!50) (getValueByKey!765 (t!51003 l!1177) otherKey!50)))))

(declare-fun b!1557677 () Bool)

(declare-fun res!1065062 () Bool)

(assert (=> b!1557677 (=> (not res!1065062) (not e!867585))))

(assert (=> b!1557677 (= res!1065062 (isStrictlySorted!907 (t!51003 l!1177)))))

(assert (= (and start!133152 res!1065066) b!1557673))

(assert (= (and b!1557673 res!1065064) b!1557677))

(assert (= (and b!1557677 res!1065062) b!1557674))

(assert (= (and b!1557674 res!1065065) b!1557676))

(assert (= (and b!1557674 (not res!1065063)) b!1557672))

(assert (= (and start!133152 ((_ is Cons!36286) l!1177)) b!1557675))

(declare-fun m!1435583 () Bool)

(assert (=> b!1557676 m!1435583))

(declare-fun m!1435585 () Bool)

(assert (=> b!1557676 m!1435585))

(declare-fun m!1435587 () Bool)

(assert (=> b!1557674 m!1435587))

(declare-fun m!1435589 () Bool)

(assert (=> b!1557674 m!1435589))

(declare-fun m!1435591 () Bool)

(assert (=> b!1557674 m!1435591))

(declare-fun m!1435593 () Bool)

(assert (=> b!1557674 m!1435593))

(declare-fun m!1435595 () Bool)

(assert (=> b!1557674 m!1435595))

(declare-fun m!1435597 () Bool)

(assert (=> b!1557674 m!1435597))

(declare-fun m!1435599 () Bool)

(assert (=> b!1557674 m!1435599))

(declare-fun m!1435601 () Bool)

(assert (=> b!1557672 m!1435601))

(declare-fun m!1435603 () Bool)

(assert (=> b!1557677 m!1435603))

(declare-fun m!1435605 () Bool)

(assert (=> start!133152 m!1435605))

(check-sat (not start!133152) (not b!1557677) (not b!1557676) (not b!1557672) (not b!1557675) tp_is_empty!38293 (not b!1557674))
(check-sat)
(get-model)

(declare-fun b!1557762 () Bool)

(declare-fun e!867643 () List!36290)

(declare-fun e!867645 () List!36290)

(assert (=> b!1557762 (= e!867643 e!867645)))

(declare-fun c!144378 () Bool)

(assert (=> b!1557762 (= c!144378 (and ((_ is Cons!36286) l!1177) (= (_1!12453 (h!37750 l!1177)) newKey!105)))))

(declare-fun b!1557763 () Bool)

(declare-fun res!1065114 () Bool)

(declare-fun e!867646 () Bool)

(assert (=> b!1557763 (=> (not res!1065114) (not e!867646))))

(declare-fun lt!671188 () List!36290)

(assert (=> b!1557763 (= res!1065114 (containsKey!791 lt!671188 newKey!105))))

(declare-fun d!162613 () Bool)

(assert (=> d!162613 e!867646))

(declare-fun res!1065113 () Bool)

(assert (=> d!162613 (=> (not res!1065113) (not e!867646))))

(assert (=> d!162613 (= res!1065113 (isStrictlySorted!907 lt!671188))))

(assert (=> d!162613 (= lt!671188 e!867643)))

(declare-fun c!144379 () Bool)

(assert (=> d!162613 (= c!144379 (and ((_ is Cons!36286) l!1177) (bvslt (_1!12453 (h!37750 l!1177)) newKey!105)))))

(assert (=> d!162613 (isStrictlySorted!907 l!1177)))

(assert (=> d!162613 (= (insertStrictlySorted!532 l!1177 newKey!105 newValue!105) lt!671188)))

(declare-fun b!1557764 () Bool)

(declare-fun e!867644 () List!36290)

(declare-fun call!71649 () List!36290)

(assert (=> b!1557764 (= e!867644 call!71649)))

(declare-fun b!1557765 () Bool)

(declare-fun call!71647 () List!36290)

(assert (=> b!1557765 (= e!867643 call!71647)))

(declare-fun bm!71644 () Bool)

(declare-fun e!867642 () List!36290)

(declare-fun $colon$colon!956 (List!36290 tuple2!24884) List!36290)

(assert (=> bm!71644 (= call!71647 ($colon$colon!956 e!867642 (ite c!144379 (h!37750 l!1177) (tuple2!24885 newKey!105 newValue!105))))))

(declare-fun c!144380 () Bool)

(assert (=> bm!71644 (= c!144380 c!144379)))

(declare-fun bm!71645 () Bool)

(declare-fun call!71648 () List!36290)

(assert (=> bm!71645 (= call!71649 call!71648)))

(declare-fun c!144381 () Bool)

(declare-fun b!1557766 () Bool)

(assert (=> b!1557766 (= e!867642 (ite c!144378 (t!51003 l!1177) (ite c!144381 (Cons!36286 (h!37750 l!1177) (t!51003 l!1177)) Nil!36287)))))

(declare-fun b!1557767 () Bool)

(assert (=> b!1557767 (= e!867645 call!71648)))

(declare-fun b!1557768 () Bool)

(assert (=> b!1557768 (= e!867642 (insertStrictlySorted!532 (t!51003 l!1177) newKey!105 newValue!105))))

(declare-fun b!1557769 () Bool)

(assert (=> b!1557769 (= c!144381 (and ((_ is Cons!36286) l!1177) (bvsgt (_1!12453 (h!37750 l!1177)) newKey!105)))))

(assert (=> b!1557769 (= e!867645 e!867644)))

(declare-fun bm!71646 () Bool)

(assert (=> bm!71646 (= call!71648 call!71647)))

(declare-fun b!1557770 () Bool)

(assert (=> b!1557770 (= e!867644 call!71649)))

(declare-fun b!1557771 () Bool)

(declare-fun contains!10217 (List!36290 tuple2!24884) Bool)

(assert (=> b!1557771 (= e!867646 (contains!10217 lt!671188 (tuple2!24885 newKey!105 newValue!105)))))

(assert (= (and d!162613 c!144379) b!1557765))

(assert (= (and d!162613 (not c!144379)) b!1557762))

(assert (= (and b!1557762 c!144378) b!1557767))

(assert (= (and b!1557762 (not c!144378)) b!1557769))

(assert (= (and b!1557769 c!144381) b!1557770))

(assert (= (and b!1557769 (not c!144381)) b!1557764))

(assert (= (or b!1557770 b!1557764) bm!71645))

(assert (= (or b!1557767 bm!71645) bm!71646))

(assert (= (or b!1557765 bm!71646) bm!71644))

(assert (= (and bm!71644 c!144380) b!1557768))

(assert (= (and bm!71644 (not c!144380)) b!1557766))

(assert (= (and d!162613 res!1065113) b!1557763))

(assert (= (and b!1557763 res!1065114) b!1557771))

(declare-fun m!1435659 () Bool)

(assert (=> d!162613 m!1435659))

(assert (=> d!162613 m!1435605))

(assert (=> b!1557768 m!1435593))

(declare-fun m!1435661 () Bool)

(assert (=> b!1557771 m!1435661))

(declare-fun m!1435663 () Bool)

(assert (=> bm!71644 m!1435663))

(declare-fun m!1435665 () Bool)

(assert (=> b!1557763 m!1435665))

(assert (=> b!1557674 d!162613))

(declare-fun d!162627 () Bool)

(declare-fun e!867672 () Bool)

(assert (=> d!162627 e!867672))

(declare-fun res!1065128 () Bool)

(assert (=> d!162627 (=> (not res!1065128) (not e!867672))))

(assert (=> d!162627 (= res!1065128 (= (containsKey!791 (insertStrictlySorted!532 (t!51003 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!791 (t!51003 l!1177) otherKey!50)))))

(declare-fun lt!671195 () Unit!51737)

(declare-fun choose!2052 (List!36290 (_ BitVec 64) B!2282 (_ BitVec 64)) Unit!51737)

(assert (=> d!162627 (= lt!671195 (choose!2052 (t!51003 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!867671 () Bool)

(assert (=> d!162627 e!867671))

(declare-fun res!1065127 () Bool)

(assert (=> d!162627 (=> (not res!1065127) (not e!867671))))

(assert (=> d!162627 (= res!1065127 (isStrictlySorted!907 (t!51003 l!1177)))))

(assert (=> d!162627 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (t!51003 l!1177) newKey!105 newValue!105 otherKey!50) lt!671195)))

(declare-fun b!1557816 () Bool)

(assert (=> b!1557816 (= e!867671 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1557817 () Bool)

(assert (=> b!1557817 (= e!867672 (= (getValueByKey!765 (insertStrictlySorted!532 (t!51003 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!765 (t!51003 l!1177) otherKey!50)))))

(assert (= (and d!162627 res!1065127) b!1557816))

(assert (= (and d!162627 res!1065128) b!1557817))

(assert (=> d!162627 m!1435593))

(declare-fun m!1435667 () Bool)

(assert (=> d!162627 m!1435667))

(declare-fun m!1435669 () Bool)

(assert (=> d!162627 m!1435669))

(assert (=> d!162627 m!1435603))

(assert (=> d!162627 m!1435593))

(assert (=> d!162627 m!1435595))

(assert (=> b!1557817 m!1435593))

(assert (=> b!1557817 m!1435593))

(declare-fun m!1435671 () Bool)

(assert (=> b!1557817 m!1435671))

(assert (=> b!1557817 m!1435585))

(assert (=> b!1557674 d!162627))

(declare-fun d!162629 () Bool)

(declare-fun res!1065137 () Bool)

(declare-fun e!867687 () Bool)

(assert (=> d!162629 (=> res!1065137 e!867687)))

(assert (=> d!162629 (= res!1065137 (and ((_ is Cons!36286) lt!671167) (= (_1!12453 (h!37750 lt!671167)) otherKey!50)))))

(assert (=> d!162629 (= (containsKey!791 lt!671167 otherKey!50) e!867687)))

(declare-fun b!1557842 () Bool)

(declare-fun e!867688 () Bool)

(assert (=> b!1557842 (= e!867687 e!867688)))

(declare-fun res!1065138 () Bool)

(assert (=> b!1557842 (=> (not res!1065138) (not e!867688))))

(assert (=> b!1557842 (= res!1065138 (and (or (not ((_ is Cons!36286) lt!671167)) (bvsle (_1!12453 (h!37750 lt!671167)) otherKey!50)) ((_ is Cons!36286) lt!671167) (bvslt (_1!12453 (h!37750 lt!671167)) otherKey!50)))))

(declare-fun b!1557843 () Bool)

(assert (=> b!1557843 (= e!867688 (containsKey!791 (t!51003 lt!671167) otherKey!50))))

(assert (= (and d!162629 (not res!1065137)) b!1557842))

(assert (= (and b!1557842 res!1065138) b!1557843))

(declare-fun m!1435689 () Bool)

(assert (=> b!1557843 m!1435689))

(assert (=> b!1557674 d!162629))

(declare-fun d!162635 () Bool)

(declare-fun res!1065139 () Bool)

(declare-fun e!867689 () Bool)

(assert (=> d!162635 (=> res!1065139 e!867689)))

(assert (=> d!162635 (= res!1065139 (and ((_ is Cons!36286) l!1177) (= (_1!12453 (h!37750 l!1177)) otherKey!50)))))

(assert (=> d!162635 (= (containsKey!791 l!1177 otherKey!50) e!867689)))

(declare-fun b!1557844 () Bool)

(declare-fun e!867690 () Bool)

(assert (=> b!1557844 (= e!867689 e!867690)))

(declare-fun res!1065140 () Bool)

(assert (=> b!1557844 (=> (not res!1065140) (not e!867690))))

(assert (=> b!1557844 (= res!1065140 (and (or (not ((_ is Cons!36286) l!1177)) (bvsle (_1!12453 (h!37750 l!1177)) otherKey!50)) ((_ is Cons!36286) l!1177) (bvslt (_1!12453 (h!37750 l!1177)) otherKey!50)))))

(declare-fun b!1557845 () Bool)

(assert (=> b!1557845 (= e!867690 (containsKey!791 (t!51003 l!1177) otherKey!50))))

(assert (= (and d!162635 (not res!1065139)) b!1557844))

(assert (= (and b!1557844 res!1065140) b!1557845))

(assert (=> b!1557845 m!1435595))

(assert (=> b!1557674 d!162635))

(declare-fun d!162637 () Bool)

(declare-fun res!1065141 () Bool)

(declare-fun e!867691 () Bool)

(assert (=> d!162637 (=> res!1065141 e!867691)))

(assert (=> d!162637 (= res!1065141 (and ((_ is Cons!36286) lt!671165) (= (_1!12453 (h!37750 lt!671165)) otherKey!50)))))

(assert (=> d!162637 (= (containsKey!791 lt!671165 otherKey!50) e!867691)))

(declare-fun b!1557846 () Bool)

(declare-fun e!867692 () Bool)

(assert (=> b!1557846 (= e!867691 e!867692)))

(declare-fun res!1065142 () Bool)

(assert (=> b!1557846 (=> (not res!1065142) (not e!867692))))

(assert (=> b!1557846 (= res!1065142 (and (or (not ((_ is Cons!36286) lt!671165)) (bvsle (_1!12453 (h!37750 lt!671165)) otherKey!50)) ((_ is Cons!36286) lt!671165) (bvslt (_1!12453 (h!37750 lt!671165)) otherKey!50)))))

(declare-fun b!1557847 () Bool)

(assert (=> b!1557847 (= e!867692 (containsKey!791 (t!51003 lt!671165) otherKey!50))))

(assert (= (and d!162637 (not res!1065141)) b!1557846))

(assert (= (and b!1557846 res!1065142) b!1557847))

(declare-fun m!1435691 () Bool)

(assert (=> b!1557847 m!1435691))

(assert (=> b!1557674 d!162637))

(declare-fun b!1557848 () Bool)

(declare-fun e!867694 () List!36290)

(declare-fun e!867696 () List!36290)

(assert (=> b!1557848 (= e!867694 e!867696)))

(declare-fun c!144406 () Bool)

(assert (=> b!1557848 (= c!144406 (and ((_ is Cons!36286) (t!51003 l!1177)) (= (_1!12453 (h!37750 (t!51003 l!1177))) newKey!105)))))

(declare-fun b!1557849 () Bool)

(declare-fun res!1065144 () Bool)

(declare-fun e!867697 () Bool)

(assert (=> b!1557849 (=> (not res!1065144) (not e!867697))))

(declare-fun lt!671198 () List!36290)

(assert (=> b!1557849 (= res!1065144 (containsKey!791 lt!671198 newKey!105))))

(declare-fun d!162639 () Bool)

(assert (=> d!162639 e!867697))

(declare-fun res!1065143 () Bool)

(assert (=> d!162639 (=> (not res!1065143) (not e!867697))))

(assert (=> d!162639 (= res!1065143 (isStrictlySorted!907 lt!671198))))

(assert (=> d!162639 (= lt!671198 e!867694)))

(declare-fun c!144407 () Bool)

(assert (=> d!162639 (= c!144407 (and ((_ is Cons!36286) (t!51003 l!1177)) (bvslt (_1!12453 (h!37750 (t!51003 l!1177))) newKey!105)))))

(assert (=> d!162639 (isStrictlySorted!907 (t!51003 l!1177))))

(assert (=> d!162639 (= (insertStrictlySorted!532 (t!51003 l!1177) newKey!105 newValue!105) lt!671198)))

(declare-fun b!1557850 () Bool)

(declare-fun e!867695 () List!36290)

(declare-fun call!71670 () List!36290)

(assert (=> b!1557850 (= e!867695 call!71670)))

(declare-fun b!1557851 () Bool)

(declare-fun call!71668 () List!36290)

(assert (=> b!1557851 (= e!867694 call!71668)))

(declare-fun bm!71665 () Bool)

(declare-fun e!867693 () List!36290)

(assert (=> bm!71665 (= call!71668 ($colon$colon!956 e!867693 (ite c!144407 (h!37750 (t!51003 l!1177)) (tuple2!24885 newKey!105 newValue!105))))))

(declare-fun c!144408 () Bool)

(assert (=> bm!71665 (= c!144408 c!144407)))

(declare-fun bm!71666 () Bool)

(declare-fun call!71669 () List!36290)

(assert (=> bm!71666 (= call!71670 call!71669)))

(declare-fun b!1557852 () Bool)

(declare-fun c!144409 () Bool)

(assert (=> b!1557852 (= e!867693 (ite c!144406 (t!51003 (t!51003 l!1177)) (ite c!144409 (Cons!36286 (h!37750 (t!51003 l!1177)) (t!51003 (t!51003 l!1177))) Nil!36287)))))

(declare-fun b!1557853 () Bool)

(assert (=> b!1557853 (= e!867696 call!71669)))

(declare-fun b!1557854 () Bool)

(assert (=> b!1557854 (= e!867693 (insertStrictlySorted!532 (t!51003 (t!51003 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1557855 () Bool)

(assert (=> b!1557855 (= c!144409 (and ((_ is Cons!36286) (t!51003 l!1177)) (bvsgt (_1!12453 (h!37750 (t!51003 l!1177))) newKey!105)))))

(assert (=> b!1557855 (= e!867696 e!867695)))

(declare-fun bm!71667 () Bool)

(assert (=> bm!71667 (= call!71669 call!71668)))

(declare-fun b!1557856 () Bool)

(assert (=> b!1557856 (= e!867695 call!71670)))

(declare-fun b!1557857 () Bool)

(assert (=> b!1557857 (= e!867697 (contains!10217 lt!671198 (tuple2!24885 newKey!105 newValue!105)))))

(assert (= (and d!162639 c!144407) b!1557851))

(assert (= (and d!162639 (not c!144407)) b!1557848))

(assert (= (and b!1557848 c!144406) b!1557853))

(assert (= (and b!1557848 (not c!144406)) b!1557855))

(assert (= (and b!1557855 c!144409) b!1557856))

(assert (= (and b!1557855 (not c!144409)) b!1557850))

(assert (= (or b!1557856 b!1557850) bm!71666))

(assert (= (or b!1557853 bm!71666) bm!71667))

(assert (= (or b!1557851 bm!71667) bm!71665))

(assert (= (and bm!71665 c!144408) b!1557854))

(assert (= (and bm!71665 (not c!144408)) b!1557852))

(assert (= (and d!162639 res!1065143) b!1557849))

(assert (= (and b!1557849 res!1065144) b!1557857))

(declare-fun m!1435693 () Bool)

(assert (=> d!162639 m!1435693))

(assert (=> d!162639 m!1435603))

(declare-fun m!1435695 () Bool)

(assert (=> b!1557854 m!1435695))

(declare-fun m!1435697 () Bool)

(assert (=> b!1557857 m!1435697))

(declare-fun m!1435699 () Bool)

(assert (=> bm!71665 m!1435699))

(declare-fun m!1435701 () Bool)

(assert (=> b!1557849 m!1435701))

(assert (=> b!1557674 d!162639))

(declare-fun d!162641 () Bool)

(declare-fun res!1065153 () Bool)

(declare-fun e!867706 () Bool)

(assert (=> d!162641 (=> res!1065153 e!867706)))

(assert (=> d!162641 (= res!1065153 (and ((_ is Cons!36286) (t!51003 l!1177)) (= (_1!12453 (h!37750 (t!51003 l!1177))) otherKey!50)))))

(assert (=> d!162641 (= (containsKey!791 (t!51003 l!1177) otherKey!50) e!867706)))

(declare-fun b!1557866 () Bool)

(declare-fun e!867707 () Bool)

(assert (=> b!1557866 (= e!867706 e!867707)))

(declare-fun res!1065154 () Bool)

(assert (=> b!1557866 (=> (not res!1065154) (not e!867707))))

(assert (=> b!1557866 (= res!1065154 (and (or (not ((_ is Cons!36286) (t!51003 l!1177))) (bvsle (_1!12453 (h!37750 (t!51003 l!1177))) otherKey!50)) ((_ is Cons!36286) (t!51003 l!1177)) (bvslt (_1!12453 (h!37750 (t!51003 l!1177))) otherKey!50)))))

(declare-fun b!1557867 () Bool)

(assert (=> b!1557867 (= e!867707 (containsKey!791 (t!51003 (t!51003 l!1177)) otherKey!50))))

(assert (= (and d!162641 (not res!1065153)) b!1557866))

(assert (= (and b!1557866 res!1065154) b!1557867))

(declare-fun m!1435703 () Bool)

(assert (=> b!1557867 m!1435703))

(assert (=> b!1557674 d!162641))

(declare-fun d!162643 () Bool)

(declare-fun res!1065163 () Bool)

(declare-fun e!867716 () Bool)

(assert (=> d!162643 (=> res!1065163 e!867716)))

(assert (=> d!162643 (= res!1065163 (or ((_ is Nil!36287) l!1177) ((_ is Nil!36287) (t!51003 l!1177))))))

(assert (=> d!162643 (= (isStrictlySorted!907 l!1177) e!867716)))

(declare-fun b!1557876 () Bool)

(declare-fun e!867717 () Bool)

(assert (=> b!1557876 (= e!867716 e!867717)))

(declare-fun res!1065164 () Bool)

(assert (=> b!1557876 (=> (not res!1065164) (not e!867717))))

(assert (=> b!1557876 (= res!1065164 (bvslt (_1!12453 (h!37750 l!1177)) (_1!12453 (h!37750 (t!51003 l!1177)))))))

(declare-fun b!1557877 () Bool)

(assert (=> b!1557877 (= e!867717 (isStrictlySorted!907 (t!51003 l!1177)))))

(assert (= (and d!162643 (not res!1065163)) b!1557876))

(assert (= (and b!1557876 res!1065164) b!1557877))

(assert (=> b!1557877 m!1435603))

(assert (=> start!133152 d!162643))

(declare-fun d!162649 () Bool)

(declare-fun res!1065165 () Bool)

(declare-fun e!867718 () Bool)

(assert (=> d!162649 (=> res!1065165 e!867718)))

(assert (=> d!162649 (= res!1065165 (or ((_ is Nil!36287) lt!671165) ((_ is Nil!36287) (t!51003 lt!671165))))))

(assert (=> d!162649 (= (isStrictlySorted!907 lt!671165) e!867718)))

(declare-fun b!1557878 () Bool)

(declare-fun e!867719 () Bool)

(assert (=> b!1557878 (= e!867718 e!867719)))

(declare-fun res!1065166 () Bool)

(assert (=> b!1557878 (=> (not res!1065166) (not e!867719))))

(assert (=> b!1557878 (= res!1065166 (bvslt (_1!12453 (h!37750 lt!671165)) (_1!12453 (h!37750 (t!51003 lt!671165)))))))

(declare-fun b!1557879 () Bool)

(assert (=> b!1557879 (= e!867719 (isStrictlySorted!907 (t!51003 lt!671165)))))

(assert (= (and d!162649 (not res!1065165)) b!1557878))

(assert (= (and b!1557878 res!1065166) b!1557879))

(declare-fun m!1435713 () Bool)

(assert (=> b!1557879 m!1435713))

(assert (=> b!1557672 d!162649))

(declare-fun d!162651 () Bool)

(declare-fun res!1065167 () Bool)

(declare-fun e!867720 () Bool)

(assert (=> d!162651 (=> res!1065167 e!867720)))

(assert (=> d!162651 (= res!1065167 (or ((_ is Nil!36287) (t!51003 l!1177)) ((_ is Nil!36287) (t!51003 (t!51003 l!1177)))))))

(assert (=> d!162651 (= (isStrictlySorted!907 (t!51003 l!1177)) e!867720)))

(declare-fun b!1557880 () Bool)

(declare-fun e!867721 () Bool)

(assert (=> b!1557880 (= e!867720 e!867721)))

(declare-fun res!1065168 () Bool)

(assert (=> b!1557880 (=> (not res!1065168) (not e!867721))))

(assert (=> b!1557880 (= res!1065168 (bvslt (_1!12453 (h!37750 (t!51003 l!1177))) (_1!12453 (h!37750 (t!51003 (t!51003 l!1177))))))))

(declare-fun b!1557881 () Bool)

(assert (=> b!1557881 (= e!867721 (isStrictlySorted!907 (t!51003 (t!51003 l!1177))))))

(assert (= (and d!162651 (not res!1065167)) b!1557880))

(assert (= (and b!1557880 res!1065168) b!1557881))

(declare-fun m!1435715 () Bool)

(assert (=> b!1557881 m!1435715))

(assert (=> b!1557677 d!162651))

(declare-fun d!162653 () Bool)

(declare-fun c!144418 () Bool)

(assert (=> d!162653 (= c!144418 (and ((_ is Cons!36286) lt!671167) (= (_1!12453 (h!37750 lt!671167)) otherKey!50)))))

(declare-fun e!867747 () Option!840)

(assert (=> d!162653 (= (getValueByKey!765 lt!671167 otherKey!50) e!867747)))

(declare-fun b!1557919 () Bool)

(declare-fun e!867749 () Option!840)

(assert (=> b!1557919 (= e!867749 None!838)))

(declare-fun b!1557917 () Bool)

(assert (=> b!1557917 (= e!867747 e!867749)))

(declare-fun c!144419 () Bool)

(assert (=> b!1557917 (= c!144419 (and ((_ is Cons!36286) lt!671167) (not (= (_1!12453 (h!37750 lt!671167)) otherKey!50))))))

(declare-fun b!1557916 () Bool)

(assert (=> b!1557916 (= e!867747 (Some!839 (_2!12453 (h!37750 lt!671167))))))

(declare-fun b!1557918 () Bool)

(assert (=> b!1557918 (= e!867749 (getValueByKey!765 (t!51003 lt!671167) otherKey!50))))

(assert (= (and d!162653 c!144418) b!1557916))

(assert (= (and d!162653 (not c!144418)) b!1557917))

(assert (= (and b!1557917 c!144419) b!1557918))

(assert (= (and b!1557917 (not c!144419)) b!1557919))

(declare-fun m!1435739 () Bool)

(assert (=> b!1557918 m!1435739))

(assert (=> b!1557676 d!162653))

(declare-fun d!162667 () Bool)

(declare-fun c!144420 () Bool)

(assert (=> d!162667 (= c!144420 (and ((_ is Cons!36286) (t!51003 l!1177)) (= (_1!12453 (h!37750 (t!51003 l!1177))) otherKey!50)))))

(declare-fun e!867756 () Option!840)

(assert (=> d!162667 (= (getValueByKey!765 (t!51003 l!1177) otherKey!50) e!867756)))

(declare-fun b!1557931 () Bool)

(declare-fun e!867758 () Option!840)

(assert (=> b!1557931 (= e!867758 None!838)))

(declare-fun b!1557929 () Bool)

(assert (=> b!1557929 (= e!867756 e!867758)))

(declare-fun c!144421 () Bool)

(assert (=> b!1557929 (= c!144421 (and ((_ is Cons!36286) (t!51003 l!1177)) (not (= (_1!12453 (h!37750 (t!51003 l!1177))) otherKey!50))))))

(declare-fun b!1557927 () Bool)

(assert (=> b!1557927 (= e!867756 (Some!839 (_2!12453 (h!37750 (t!51003 l!1177)))))))

(declare-fun b!1557930 () Bool)

(assert (=> b!1557930 (= e!867758 (getValueByKey!765 (t!51003 (t!51003 l!1177)) otherKey!50))))

(assert (= (and d!162667 c!144420) b!1557927))

(assert (= (and d!162667 (not c!144420)) b!1557929))

(assert (= (and b!1557929 c!144421) b!1557930))

(assert (= (and b!1557929 (not c!144421)) b!1557931))

(declare-fun m!1435745 () Bool)

(assert (=> b!1557930 m!1435745))

(assert (=> b!1557676 d!162667))

(declare-fun b!1557946 () Bool)

(declare-fun e!867766 () Bool)

(declare-fun tp!112281 () Bool)

(assert (=> b!1557946 (= e!867766 (and tp_is_empty!38293 tp!112281))))

(assert (=> b!1557675 (= tp!112272 e!867766)))

(assert (= (and b!1557675 ((_ is Cons!36286) (t!51003 l!1177))) b!1557946))

(check-sat (not b!1557946) (not b!1557845) (not b!1557867) (not b!1557763) (not b!1557771) (not b!1557849) (not b!1557817) (not b!1557768) (not b!1557857) (not b!1557930) (not bm!71644) (not d!162627) (not b!1557877) tp_is_empty!38293 (not d!162639) (not b!1557881) (not b!1557843) (not d!162613) (not b!1557854) (not b!1557847) (not bm!71665) (not b!1557879) (not b!1557918))
(check-sat)
