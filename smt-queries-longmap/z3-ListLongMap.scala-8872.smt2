; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107932 () Bool)

(assert start!107932)

(declare-datatypes ((B!2102 0))(
  ( (B!2103 (val!16647 Int)) )
))
(declare-datatypes ((tuple2!21384 0))(
  ( (tuple2!21385 (_1!10703 (_ BitVec 64)) (_2!10703 B!2102)) )
))
(declare-datatypes ((List!28601 0))(
  ( (Nil!28598) (Cons!28597 (h!29815 tuple2!21384) (t!42126 List!28601)) )
))
(declare-datatypes ((ListLongMap!19121 0))(
  ( (ListLongMap!19122 (toList!9576 List!28601)) )
))
(declare-fun thiss!217 () ListLongMap!19121)

(declare-fun isStrictlySorted!823 (List!28601) Bool)

(assert (=> start!107932 (not (isStrictlySorted!823 (toList!9576 thiss!217)))))

(declare-fun e!728057 () Bool)

(declare-fun inv!44691 (ListLongMap!19121) Bool)

(assert (=> start!107932 (and (inv!44691 thiss!217) e!728057)))

(declare-fun b!1275630 () Bool)

(declare-fun tp!97895 () Bool)

(assert (=> b!1275630 (= e!728057 tp!97895)))

(assert (= start!107932 b!1275630))

(declare-fun m!1172735 () Bool)

(assert (=> start!107932 m!1172735))

(declare-fun m!1172737 () Bool)

(assert (=> start!107932 m!1172737))

(check-sat (not start!107932) (not b!1275630))
(check-sat)
(get-model)

(declare-fun d!140563 () Bool)

(declare-fun res!847755 () Bool)

(declare-fun e!728076 () Bool)

(assert (=> d!140563 (=> res!847755 e!728076)))

(get-info :version)

(assert (=> d!140563 (= res!847755 (or ((_ is Nil!28598) (toList!9576 thiss!217)) ((_ is Nil!28598) (t!42126 (toList!9576 thiss!217)))))))

(assert (=> d!140563 (= (isStrictlySorted!823 (toList!9576 thiss!217)) e!728076)))

(declare-fun b!1275649 () Bool)

(declare-fun e!728077 () Bool)

(assert (=> b!1275649 (= e!728076 e!728077)))

(declare-fun res!847756 () Bool)

(assert (=> b!1275649 (=> (not res!847756) (not e!728077))))

(assert (=> b!1275649 (= res!847756 (bvslt (_1!10703 (h!29815 (toList!9576 thiss!217))) (_1!10703 (h!29815 (t!42126 (toList!9576 thiss!217))))))))

(declare-fun b!1275650 () Bool)

(assert (=> b!1275650 (= e!728077 (isStrictlySorted!823 (t!42126 (toList!9576 thiss!217))))))

(assert (= (and d!140563 (not res!847755)) b!1275649))

(assert (= (and b!1275649 res!847756) b!1275650))

(declare-fun m!1172747 () Bool)

(assert (=> b!1275650 m!1172747))

(assert (=> start!107932 d!140563))

(declare-fun d!140569 () Bool)

(assert (=> d!140569 (= (inv!44691 thiss!217) (isStrictlySorted!823 (toList!9576 thiss!217)))))

(declare-fun bs!36193 () Bool)

(assert (= bs!36193 d!140569))

(assert (=> bs!36193 m!1172735))

(assert (=> start!107932 d!140569))

(declare-fun b!1275663 () Bool)

(declare-fun e!728086 () Bool)

(declare-fun tp_is_empty!33145 () Bool)

(declare-fun tp!97904 () Bool)

(assert (=> b!1275663 (= e!728086 (and tp_is_empty!33145 tp!97904))))

(assert (=> b!1275630 (= tp!97895 e!728086)))

(assert (= (and b!1275630 ((_ is Cons!28597) (toList!9576 thiss!217))) b!1275663))

(check-sat (not b!1275650) (not d!140569) (not b!1275663) tp_is_empty!33145)
(check-sat)
