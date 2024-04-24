; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107950 () Bool)

(assert start!107950)

(declare-datatypes ((B!2108 0))(
  ( (B!2109 (val!16650 Int)) )
))
(declare-datatypes ((tuple2!21390 0))(
  ( (tuple2!21391 (_1!10706 (_ BitVec 64)) (_2!10706 B!2108)) )
))
(declare-datatypes ((List!28604 0))(
  ( (Nil!28601) (Cons!28600 (h!29818 tuple2!21390) (t!42129 List!28604)) )
))
(declare-datatypes ((ListLongMap!19127 0))(
  ( (ListLongMap!19128 (toList!9579 List!28604)) )
))
(declare-fun thiss!217 () ListLongMap!19127)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun inv!44699 (ListLongMap!19127) Bool)

(declare-fun removeStrictlySorted!172 (List!28604 (_ BitVec 64)) List!28604)

(assert (=> start!107950 (not (inv!44699 (ListLongMap!19128 (removeStrictlySorted!172 (toList!9579 thiss!217) key!129))))))

(declare-fun e!728093 () Bool)

(assert (=> start!107950 (and (inv!44699 thiss!217) e!728093)))

(assert (=> start!107950 true))

(declare-fun b!1275672 () Bool)

(declare-fun tp!97913 () Bool)

(assert (=> b!1275672 (= e!728093 tp!97913)))

(assert (= start!107950 b!1275672))

(declare-fun m!1172753 () Bool)

(assert (=> start!107950 m!1172753))

(declare-fun m!1172755 () Bool)

(assert (=> start!107950 m!1172755))

(declare-fun m!1172757 () Bool)

(assert (=> start!107950 m!1172757))

(check-sat (not start!107950) (not b!1275672))
(check-sat)
(get-model)

(declare-fun d!140583 () Bool)

(declare-fun isStrictlySorted!828 (List!28604) Bool)

(assert (=> d!140583 (= (inv!44699 (ListLongMap!19128 (removeStrictlySorted!172 (toList!9579 thiss!217) key!129))) (isStrictlySorted!828 (toList!9579 (ListLongMap!19128 (removeStrictlySorted!172 (toList!9579 thiss!217) key!129)))))))

(declare-fun bs!36201 () Bool)

(assert (= bs!36201 d!140583))

(declare-fun m!1172775 () Bool)

(assert (=> bs!36201 m!1172775))

(assert (=> start!107950 d!140583))

(declare-fun b!1275722 () Bool)

(declare-fun e!728124 () List!28604)

(assert (=> b!1275722 (= e!728124 Nil!28601)))

(declare-fun b!1275723 () Bool)

(declare-fun e!728125 () Bool)

(declare-fun lt!575710 () List!28604)

(declare-fun containsKey!694 (List!28604 (_ BitVec 64)) Bool)

(assert (=> b!1275723 (= e!728125 (not (containsKey!694 lt!575710 key!129)))))

(declare-fun b!1275724 () Bool)

(declare-fun e!728126 () List!28604)

(assert (=> b!1275724 (= e!728126 e!728124)))

(declare-fun c!124242 () Bool)

(get-info :version)

(assert (=> b!1275724 (= c!124242 (and ((_ is Cons!28600) (toList!9579 thiss!217)) (not (= (_1!10706 (h!29818 (toList!9579 thiss!217))) key!129))))))

(declare-fun b!1275725 () Bool)

(assert (=> b!1275725 (= e!728126 (t!42129 (toList!9579 thiss!217)))))

(declare-fun d!140587 () Bool)

(assert (=> d!140587 e!728125))

(declare-fun res!847769 () Bool)

(assert (=> d!140587 (=> (not res!847769) (not e!728125))))

(assert (=> d!140587 (= res!847769 (isStrictlySorted!828 lt!575710))))

(assert (=> d!140587 (= lt!575710 e!728126)))

(declare-fun c!124243 () Bool)

(assert (=> d!140587 (= c!124243 (and ((_ is Cons!28600) (toList!9579 thiss!217)) (= (_1!10706 (h!29818 (toList!9579 thiss!217))) key!129)))))

(assert (=> d!140587 (isStrictlySorted!828 (toList!9579 thiss!217))))

(assert (=> d!140587 (= (removeStrictlySorted!172 (toList!9579 thiss!217) key!129) lt!575710)))

(declare-fun b!1275726 () Bool)

(declare-fun $colon$colon!655 (List!28604 tuple2!21390) List!28604)

(assert (=> b!1275726 (= e!728124 ($colon$colon!655 (removeStrictlySorted!172 (t!42129 (toList!9579 thiss!217)) key!129) (h!29818 (toList!9579 thiss!217))))))

(assert (= (and d!140587 c!124243) b!1275725))

(assert (= (and d!140587 (not c!124243)) b!1275724))

(assert (= (and b!1275724 c!124242) b!1275726))

(assert (= (and b!1275724 (not c!124242)) b!1275722))

(assert (= (and d!140587 res!847769) b!1275723))

(declare-fun m!1172797 () Bool)

(assert (=> b!1275723 m!1172797))

(declare-fun m!1172799 () Bool)

(assert (=> d!140587 m!1172799))

(declare-fun m!1172801 () Bool)

(assert (=> d!140587 m!1172801))

(declare-fun m!1172803 () Bool)

(assert (=> b!1275726 m!1172803))

(assert (=> b!1275726 m!1172803))

(declare-fun m!1172805 () Bool)

(assert (=> b!1275726 m!1172805))

(assert (=> start!107950 d!140587))

(declare-fun d!140593 () Bool)

(assert (=> d!140593 (= (inv!44699 thiss!217) (isStrictlySorted!828 (toList!9579 thiss!217)))))

(declare-fun bs!36204 () Bool)

(assert (= bs!36204 d!140593))

(assert (=> bs!36204 m!1172801))

(assert (=> start!107950 d!140593))

(declare-fun b!1275738 () Bool)

(declare-fun e!728135 () Bool)

(declare-fun tp_is_empty!33155 () Bool)

(declare-fun tp!97928 () Bool)

(assert (=> b!1275738 (= e!728135 (and tp_is_empty!33155 tp!97928))))

(assert (=> b!1275672 (= tp!97913 e!728135)))

(assert (= (and b!1275672 ((_ is Cons!28600) (toList!9579 thiss!217))) b!1275738))

(check-sat tp_is_empty!33155 (not d!140587) (not b!1275723) (not d!140583) (not d!140593) (not b!1275726) (not b!1275738))
(check-sat)
