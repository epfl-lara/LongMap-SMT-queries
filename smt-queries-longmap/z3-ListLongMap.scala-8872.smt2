; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107708 () Bool)

(assert start!107708)

(declare-datatypes ((B!2102 0))(
  ( (B!2103 (val!16647 Int)) )
))
(declare-datatypes ((tuple2!21452 0))(
  ( (tuple2!21453 (_1!10737 (_ BitVec 64)) (_2!10737 B!2102)) )
))
(declare-datatypes ((List!28646 0))(
  ( (Nil!28643) (Cons!28642 (h!29851 tuple2!21452) (t!42171 List!28646)) )
))
(declare-datatypes ((ListLongMap!19181 0))(
  ( (ListLongMap!19182 (toList!9606 List!28646)) )
))
(declare-fun thiss!217 () ListLongMap!19181)

(declare-fun isStrictlySorted!831 (List!28646) Bool)

(assert (=> start!107708 (not (isStrictlySorted!831 (toList!9606 thiss!217)))))

(declare-fun e!727181 () Bool)

(declare-fun inv!44691 (ListLongMap!19181) Bool)

(assert (=> start!107708 (and (inv!44691 thiss!217) e!727181)))

(declare-fun b!1274261 () Bool)

(declare-fun tp!97896 () Bool)

(assert (=> b!1274261 (= e!727181 tp!97896)))

(assert (= start!107708 b!1274261))

(declare-fun m!1170623 () Bool)

(assert (=> start!107708 m!1170623))

(declare-fun m!1170625 () Bool)

(assert (=> start!107708 m!1170625))

(check-sat (not start!107708) (not b!1274261))
(check-sat)
(get-model)

(declare-fun d!140003 () Bool)

(declare-fun res!847210 () Bool)

(declare-fun e!727202 () Bool)

(assert (=> d!140003 (=> res!847210 e!727202)))

(get-info :version)

(assert (=> d!140003 (= res!847210 (or ((_ is Nil!28643) (toList!9606 thiss!217)) ((_ is Nil!28643) (t!42171 (toList!9606 thiss!217)))))))

(assert (=> d!140003 (= (isStrictlySorted!831 (toList!9606 thiss!217)) e!727202)))

(declare-fun b!1274282 () Bool)

(declare-fun e!727203 () Bool)

(assert (=> b!1274282 (= e!727202 e!727203)))

(declare-fun res!847211 () Bool)

(assert (=> b!1274282 (=> (not res!847211) (not e!727203))))

(assert (=> b!1274282 (= res!847211 (bvslt (_1!10737 (h!29851 (toList!9606 thiss!217))) (_1!10737 (h!29851 (t!42171 (toList!9606 thiss!217))))))))

(declare-fun b!1274283 () Bool)

(assert (=> b!1274283 (= e!727203 (isStrictlySorted!831 (t!42171 (toList!9606 thiss!217))))))

(assert (= (and d!140003 (not res!847210)) b!1274282))

(assert (= (and b!1274282 res!847211) b!1274283))

(declare-fun m!1170637 () Bool)

(assert (=> b!1274283 m!1170637))

(assert (=> start!107708 d!140003))

(declare-fun d!140011 () Bool)

(assert (=> d!140011 (= (inv!44691 thiss!217) (isStrictlySorted!831 (toList!9606 thiss!217)))))

(declare-fun bs!36151 () Bool)

(assert (= bs!36151 d!140011))

(assert (=> bs!36151 m!1170623))

(assert (=> start!107708 d!140011))

(declare-fun b!1274295 () Bool)

(declare-fun e!727211 () Bool)

(declare-fun tp_is_empty!33147 () Bool)

(declare-fun tp!97908 () Bool)

(assert (=> b!1274295 (= e!727211 (and tp_is_empty!33147 tp!97908))))

(assert (=> b!1274261 (= tp!97896 e!727211)))

(assert (= (and b!1274261 ((_ is Cons!28642) (toList!9606 thiss!217))) b!1274295))

(check-sat (not d!140011) (not b!1274283) (not b!1274295) tp_is_empty!33147)
(check-sat)
