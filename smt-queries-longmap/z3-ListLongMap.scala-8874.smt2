; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107968 () Bool)

(assert start!107968)

(declare-datatypes ((B!2114 0))(
  ( (B!2115 (val!16653 Int)) )
))
(declare-datatypes ((tuple2!21396 0))(
  ( (tuple2!21397 (_1!10709 (_ BitVec 64)) (_2!10709 B!2114)) )
))
(declare-datatypes ((List!28607 0))(
  ( (Nil!28604) (Cons!28603 (h!29821 tuple2!21396) (t!42132 List!28607)) )
))
(declare-datatypes ((ListLongMap!19133 0))(
  ( (ListLongMap!19134 (toList!9582 List!28607)) )
))
(declare-fun thiss!217 () ListLongMap!19133)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun contains!7703 (ListLongMap!19133 (_ BitVec 64)) Bool)

(declare-fun removeStrictlySorted!175 (List!28607 (_ BitVec 64)) List!28607)

(assert (=> start!107968 (contains!7703 (ListLongMap!19134 (removeStrictlySorted!175 (toList!9582 thiss!217) key!129)) key!129)))

(declare-fun e!728138 () Bool)

(declare-fun inv!44707 (ListLongMap!19133) Bool)

(assert (=> start!107968 (and (inv!44707 thiss!217) e!728138)))

(assert (=> start!107968 true))

(declare-fun b!1275741 () Bool)

(declare-fun tp!97931 () Bool)

(assert (=> b!1275741 (= e!728138 tp!97931)))

(assert (= start!107968 b!1275741))

(declare-fun m!1172807 () Bool)

(assert (=> start!107968 m!1172807))

(declare-fun m!1172809 () Bool)

(assert (=> start!107968 m!1172809))

(declare-fun m!1172811 () Bool)

(assert (=> start!107968 m!1172811))

(check-sat (not start!107968) (not b!1275741))
(check-sat)
(get-model)

(declare-fun d!140597 () Bool)

(declare-fun e!728162 () Bool)

(assert (=> d!140597 e!728162))

(declare-fun res!847778 () Bool)

(assert (=> d!140597 (=> res!847778 e!728162)))

(declare-fun lt!575745 () Bool)

(assert (=> d!140597 (= res!847778 (not lt!575745))))

(declare-fun lt!575746 () Bool)

(assert (=> d!140597 (= lt!575745 lt!575746)))

(declare-datatypes ((Unit!42315 0))(
  ( (Unit!42316) )
))
(declare-fun lt!575744 () Unit!42315)

(declare-fun e!728161 () Unit!42315)

(assert (=> d!140597 (= lt!575744 e!728161)))

(declare-fun c!124252 () Bool)

(assert (=> d!140597 (= c!124252 lt!575746)))

(declare-fun containsKey!697 (List!28607 (_ BitVec 64)) Bool)

(assert (=> d!140597 (= lt!575746 (containsKey!697 (toList!9582 (ListLongMap!19134 (removeStrictlySorted!175 (toList!9582 thiss!217) key!129))) key!129))))

(assert (=> d!140597 (= (contains!7703 (ListLongMap!19134 (removeStrictlySorted!175 (toList!9582 thiss!217) key!129)) key!129) lt!575745)))

(declare-fun b!1275772 () Bool)

(declare-fun lt!575743 () Unit!42315)

(assert (=> b!1275772 (= e!728161 lt!575743)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!455 (List!28607 (_ BitVec 64)) Unit!42315)

(assert (=> b!1275772 (= lt!575743 (lemmaContainsKeyImpliesGetValueByKeyDefined!455 (toList!9582 (ListLongMap!19134 (removeStrictlySorted!175 (toList!9582 thiss!217) key!129))) key!129))))

(declare-datatypes ((Option!734 0))(
  ( (Some!733 (v!19280 B!2114)) (None!732) )
))
(declare-fun isDefined!492 (Option!734) Bool)

(declare-fun getValueByKey!683 (List!28607 (_ BitVec 64)) Option!734)

(assert (=> b!1275772 (isDefined!492 (getValueByKey!683 (toList!9582 (ListLongMap!19134 (removeStrictlySorted!175 (toList!9582 thiss!217) key!129))) key!129))))

(declare-fun b!1275773 () Bool)

(declare-fun Unit!42319 () Unit!42315)

(assert (=> b!1275773 (= e!728161 Unit!42319)))

(declare-fun b!1275774 () Bool)

(assert (=> b!1275774 (= e!728162 (isDefined!492 (getValueByKey!683 (toList!9582 (ListLongMap!19134 (removeStrictlySorted!175 (toList!9582 thiss!217) key!129))) key!129)))))

(assert (= (and d!140597 c!124252) b!1275772))

(assert (= (and d!140597 (not c!124252)) b!1275773))

(assert (= (and d!140597 (not res!847778)) b!1275774))

(declare-fun m!1172829 () Bool)

(assert (=> d!140597 m!1172829))

(declare-fun m!1172835 () Bool)

(assert (=> b!1275772 m!1172835))

(declare-fun m!1172839 () Bool)

(assert (=> b!1275772 m!1172839))

(assert (=> b!1275772 m!1172839))

(declare-fun m!1172845 () Bool)

(assert (=> b!1275772 m!1172845))

(assert (=> b!1275774 m!1172839))

(assert (=> b!1275774 m!1172839))

(assert (=> b!1275774 m!1172845))

(assert (=> start!107968 d!140597))

(declare-fun b!1275805 () Bool)

(declare-fun e!728181 () List!28607)

(declare-fun e!728182 () List!28607)

(assert (=> b!1275805 (= e!728181 e!728182)))

(declare-fun c!124265 () Bool)

(get-info :version)

(assert (=> b!1275805 (= c!124265 (and ((_ is Cons!28603) (toList!9582 thiss!217)) (not (= (_1!10709 (h!29821 (toList!9582 thiss!217))) key!129))))))

(declare-fun b!1275806 () Bool)

(assert (=> b!1275806 (= e!728182 Nil!28604)))

(declare-fun b!1275807 () Bool)

(declare-fun $colon$colon!657 (List!28607 tuple2!21396) List!28607)

(assert (=> b!1275807 (= e!728182 ($colon$colon!657 (removeStrictlySorted!175 (t!42132 (toList!9582 thiss!217)) key!129) (h!29821 (toList!9582 thiss!217))))))

(declare-fun b!1275808 () Bool)

(declare-fun e!728183 () Bool)

(declare-fun lt!575753 () List!28607)

(assert (=> b!1275808 (= e!728183 (not (containsKey!697 lt!575753 key!129)))))

(declare-fun d!140605 () Bool)

(assert (=> d!140605 e!728183))

(declare-fun res!847785 () Bool)

(assert (=> d!140605 (=> (not res!847785) (not e!728183))))

(declare-fun isStrictlySorted!829 (List!28607) Bool)

(assert (=> d!140605 (= res!847785 (isStrictlySorted!829 lt!575753))))

(assert (=> d!140605 (= lt!575753 e!728181)))

(declare-fun c!124266 () Bool)

(assert (=> d!140605 (= c!124266 (and ((_ is Cons!28603) (toList!9582 thiss!217)) (= (_1!10709 (h!29821 (toList!9582 thiss!217))) key!129)))))

(assert (=> d!140605 (isStrictlySorted!829 (toList!9582 thiss!217))))

(assert (=> d!140605 (= (removeStrictlySorted!175 (toList!9582 thiss!217) key!129) lt!575753)))

(declare-fun b!1275809 () Bool)

(assert (=> b!1275809 (= e!728181 (t!42132 (toList!9582 thiss!217)))))

(assert (= (and d!140605 c!124266) b!1275809))

(assert (= (and d!140605 (not c!124266)) b!1275805))

(assert (= (and b!1275805 c!124265) b!1275807))

(assert (= (and b!1275805 (not c!124265)) b!1275806))

(assert (= (and d!140605 res!847785) b!1275808))

(declare-fun m!1172849 () Bool)

(assert (=> b!1275807 m!1172849))

(assert (=> b!1275807 m!1172849))

(declare-fun m!1172857 () Bool)

(assert (=> b!1275807 m!1172857))

(declare-fun m!1172861 () Bool)

(assert (=> b!1275808 m!1172861))

(declare-fun m!1172865 () Bool)

(assert (=> d!140605 m!1172865))

(declare-fun m!1172869 () Bool)

(assert (=> d!140605 m!1172869))

(assert (=> start!107968 d!140605))

(declare-fun d!140609 () Bool)

(assert (=> d!140609 (= (inv!44707 thiss!217) (isStrictlySorted!829 (toList!9582 thiss!217)))))

(declare-fun bs!36208 () Bool)

(assert (= bs!36208 d!140609))

(assert (=> bs!36208 m!1172869))

(assert (=> start!107968 d!140609))

(declare-fun b!1275832 () Bool)

(declare-fun e!728196 () Bool)

(declare-fun tp_is_empty!33159 () Bool)

(declare-fun tp!97944 () Bool)

(assert (=> b!1275832 (= e!728196 (and tp_is_empty!33159 tp!97944))))

(assert (=> b!1275741 (= tp!97931 e!728196)))

(assert (= (and b!1275741 ((_ is Cons!28603) (toList!9582 thiss!217))) b!1275832))

(check-sat (not d!140597) (not b!1275832) (not d!140605) (not b!1275808) (not b!1275807) (not b!1275772) tp_is_empty!33159 (not d!140609) (not b!1275774))
(check-sat)
