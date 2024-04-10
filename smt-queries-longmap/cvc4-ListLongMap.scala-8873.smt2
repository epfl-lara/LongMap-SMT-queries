; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107730 () Bool)

(assert start!107730)

(declare-datatypes ((B!2112 0))(
  ( (B!2113 (val!16652 Int)) )
))
(declare-datatypes ((tuple2!21386 0))(
  ( (tuple2!21387 (_1!10704 (_ BitVec 64)) (_2!10704 B!2112)) )
))
(declare-datatypes ((List!28578 0))(
  ( (Nil!28575) (Cons!28574 (h!29783 tuple2!21386) (t!42111 List!28578)) )
))
(declare-datatypes ((ListLongMap!19115 0))(
  ( (ListLongMap!19116 (toList!9573 List!28578)) )
))
(declare-fun thiss!217 () ListLongMap!19115)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun inv!44701 (ListLongMap!19115) Bool)

(declare-fun removeStrictlySorted!175 (List!28578 (_ BitVec 64)) List!28578)

(assert (=> start!107730 (not (inv!44701 (ListLongMap!19116 (removeStrictlySorted!175 (toList!9573 thiss!217) key!129))))))

(declare-fun e!727252 () Bool)

(assert (=> start!107730 (and (inv!44701 thiss!217) e!727252)))

(assert (=> start!107730 true))

(declare-fun b!1274373 () Bool)

(declare-fun tp!97919 () Bool)

(assert (=> b!1274373 (= e!727252 tp!97919)))

(assert (= start!107730 b!1274373))

(declare-fun m!1171153 () Bool)

(assert (=> start!107730 m!1171153))

(declare-fun m!1171155 () Bool)

(assert (=> start!107730 m!1171155))

(declare-fun m!1171157 () Bool)

(assert (=> start!107730 m!1171157))

(push 1)

(assert (not start!107730))

(assert (not b!1274373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140131 () Bool)

(declare-fun isStrictlySorted!839 (List!28578) Bool)

(assert (=> d!140131 (= (inv!44701 (ListLongMap!19116 (removeStrictlySorted!175 (toList!9573 thiss!217) key!129))) (isStrictlySorted!839 (toList!9573 (ListLongMap!19116 (removeStrictlySorted!175 (toList!9573 thiss!217) key!129)))))))

(declare-fun bs!36184 () Bool)

(assert (= bs!36184 d!140131))

(declare-fun m!1171161 () Bool)

(assert (=> bs!36184 m!1171161))

(assert (=> start!107730 d!140131))

(declare-fun b!1274399 () Bool)

(declare-fun e!727270 () Bool)

(declare-fun lt!575223 () List!28578)

(declare-fun containsKey!695 (List!28578 (_ BitVec 64)) Bool)

(assert (=> b!1274399 (= e!727270 (not (containsKey!695 lt!575223 key!129)))))

(declare-fun b!1274400 () Bool)

(declare-fun e!727268 () List!28578)

(assert (=> b!1274400 (= e!727268 Nil!28575)))

(declare-fun b!1274401 () Bool)

(declare-fun $colon$colon!656 (List!28578 tuple2!21386) List!28578)

(assert (=> b!1274401 (= e!727268 ($colon$colon!656 (removeStrictlySorted!175 (t!42111 (toList!9573 thiss!217)) key!129) (h!29783 (toList!9573 thiss!217))))))

(declare-fun d!140135 () Bool)

(assert (=> d!140135 e!727270))

(declare-fun res!847246 () Bool)

(assert (=> d!140135 (=> (not res!847246) (not e!727270))))

(assert (=> d!140135 (= res!847246 (isStrictlySorted!839 lt!575223))))

(declare-fun e!727269 () List!28578)

(assert (=> d!140135 (= lt!575223 e!727269)))

(declare-fun c!123836 () Bool)

(assert (=> d!140135 (= c!123836 (and (is-Cons!28574 (toList!9573 thiss!217)) (= (_1!10704 (h!29783 (toList!9573 thiss!217))) key!129)))))

(assert (=> d!140135 (isStrictlySorted!839 (toList!9573 thiss!217))))

(assert (=> d!140135 (= (removeStrictlySorted!175 (toList!9573 thiss!217) key!129) lt!575223)))

(declare-fun b!1274402 () Bool)

(assert (=> b!1274402 (= e!727269 (t!42111 (toList!9573 thiss!217)))))

(declare-fun b!1274403 () Bool)

(assert (=> b!1274403 (= e!727269 e!727268)))

(declare-fun c!123837 () Bool)

(assert (=> b!1274403 (= c!123837 (and (is-Cons!28574 (toList!9573 thiss!217)) (not (= (_1!10704 (h!29783 (toList!9573 thiss!217))) key!129))))))

(assert (= (and d!140135 c!123836) b!1274402))

(assert (= (and d!140135 (not c!123836)) b!1274403))

(assert (= (and b!1274403 c!123837) b!1274401))

(assert (= (and b!1274403 (not c!123837)) b!1274400))

(assert (= (and d!140135 res!847246) b!1274399))

(declare-fun m!1171175 () Bool)

(assert (=> b!1274399 m!1171175))

(declare-fun m!1171177 () Bool)

(assert (=> b!1274401 m!1171177))

(assert (=> b!1274401 m!1171177))

(declare-fun m!1171179 () Bool)

(assert (=> b!1274401 m!1171179))

(declare-fun m!1171181 () Bool)

(assert (=> d!140135 m!1171181))

(declare-fun m!1171183 () Bool)

(assert (=> d!140135 m!1171183))

(assert (=> start!107730 d!140135))

(declare-fun d!140143 () Bool)

(assert (=> d!140143 (= (inv!44701 thiss!217) (isStrictlySorted!839 (toList!9573 thiss!217)))))

(declare-fun bs!36187 () Bool)

(assert (= bs!36187 d!140143))

(assert (=> bs!36187 m!1171183))

(assert (=> start!107730 d!140143))

(declare-fun b!1274413 () Bool)

(declare-fun e!727276 () Bool)

(declare-fun tp_is_empty!33153 () Bool)

(declare-fun tp!97925 () Bool)

(assert (=> b!1274413 (= e!727276 (and tp_is_empty!33153 tp!97925))))

(assert (=> b!1274373 (= tp!97919 e!727276)))

(assert (= (and b!1274373 (is-Cons!28574 (toList!9573 thiss!217))) b!1274413))

(push 1)

