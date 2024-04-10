; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107746 () Bool)

(assert start!107746)

(declare-datatypes ((B!2116 0))(
  ( (B!2117 (val!16654 Int)) )
))
(declare-datatypes ((tuple2!21390 0))(
  ( (tuple2!21391 (_1!10706 (_ BitVec 64)) (_2!10706 B!2116)) )
))
(declare-datatypes ((List!28580 0))(
  ( (Nil!28577) (Cons!28576 (h!29785 tuple2!21390) (t!42113 List!28580)) )
))
(declare-datatypes ((ListLongMap!19119 0))(
  ( (ListLongMap!19120 (toList!9575 List!28580)) )
))
(declare-fun thiss!217 () ListLongMap!19119)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun contains!7680 (ListLongMap!19119 (_ BitVec 64)) Bool)

(declare-fun removeStrictlySorted!177 (List!28580 (_ BitVec 64)) List!28580)

(assert (=> start!107746 (contains!7680 (ListLongMap!19120 (removeStrictlySorted!177 (toList!9575 thiss!217) key!129)) key!129)))

(declare-fun e!727294 () Bool)

(declare-fun inv!44708 (ListLongMap!19119) Bool)

(assert (=> start!107746 (and (inv!44708 thiss!217) e!727294)))

(assert (=> start!107746 true))

(declare-fun b!1274439 () Bool)

(declare-fun tp!97934 () Bool)

(assert (=> b!1274439 (= e!727294 tp!97934)))

(assert (= start!107746 b!1274439))

(declare-fun m!1171201 () Bool)

(assert (=> start!107746 m!1171201))

(declare-fun m!1171203 () Bool)

(assert (=> start!107746 m!1171203))

(declare-fun m!1171205 () Bool)

(assert (=> start!107746 m!1171205))

(check-sat (not start!107746) (not b!1274439))
(check-sat)
(get-model)

(declare-fun d!140149 () Bool)

(declare-fun e!727307 () Bool)

(assert (=> d!140149 e!727307))

(declare-fun res!847254 () Bool)

(assert (=> d!140149 (=> res!847254 e!727307)))

(declare-fun lt!575245 () Bool)

(assert (=> d!140149 (= res!847254 (not lt!575245))))

(declare-fun lt!575246 () Bool)

(assert (=> d!140149 (= lt!575245 lt!575246)))

(declare-datatypes ((Unit!42342 0))(
  ( (Unit!42343) )
))
(declare-fun lt!575244 () Unit!42342)

(declare-fun e!727306 () Unit!42342)

(assert (=> d!140149 (= lt!575244 e!727306)))

(declare-fun c!123848 () Bool)

(assert (=> d!140149 (= c!123848 lt!575246)))

(declare-fun containsKey!697 (List!28580 (_ BitVec 64)) Bool)

(assert (=> d!140149 (= lt!575246 (containsKey!697 (toList!9575 (ListLongMap!19120 (removeStrictlySorted!177 (toList!9575 thiss!217) key!129))) key!129))))

(assert (=> d!140149 (= (contains!7680 (ListLongMap!19120 (removeStrictlySorted!177 (toList!9575 thiss!217) key!129)) key!129) lt!575245)))

(declare-fun b!1274455 () Bool)

(declare-fun lt!575243 () Unit!42342)

(assert (=> b!1274455 (= e!727306 lt!575243)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!455 (List!28580 (_ BitVec 64)) Unit!42342)

(assert (=> b!1274455 (= lt!575243 (lemmaContainsKeyImpliesGetValueByKeyDefined!455 (toList!9575 (ListLongMap!19120 (removeStrictlySorted!177 (toList!9575 thiss!217) key!129))) key!129))))

(declare-datatypes ((Option!739 0))(
  ( (Some!738 (v!19285 B!2116)) (None!737) )
))
(declare-fun isDefined!494 (Option!739) Bool)

(declare-fun getValueByKey!687 (List!28580 (_ BitVec 64)) Option!739)

(assert (=> b!1274455 (isDefined!494 (getValueByKey!687 (toList!9575 (ListLongMap!19120 (removeStrictlySorted!177 (toList!9575 thiss!217) key!129))) key!129))))

(declare-fun b!1274456 () Bool)

(declare-fun Unit!42346 () Unit!42342)

(assert (=> b!1274456 (= e!727306 Unit!42346)))

(declare-fun b!1274457 () Bool)

(assert (=> b!1274457 (= e!727307 (isDefined!494 (getValueByKey!687 (toList!9575 (ListLongMap!19120 (removeStrictlySorted!177 (toList!9575 thiss!217) key!129))) key!129)))))

(assert (= (and d!140149 c!123848) b!1274455))

(assert (= (and d!140149 (not c!123848)) b!1274456))

(assert (= (and d!140149 (not res!847254)) b!1274457))

(declare-fun m!1171213 () Bool)

(assert (=> d!140149 m!1171213))

(declare-fun m!1171217 () Bool)

(assert (=> b!1274455 m!1171217))

(declare-fun m!1171221 () Bool)

(assert (=> b!1274455 m!1171221))

(assert (=> b!1274455 m!1171221))

(declare-fun m!1171225 () Bool)

(assert (=> b!1274455 m!1171225))

(assert (=> b!1274457 m!1171221))

(assert (=> b!1274457 m!1171221))

(assert (=> b!1274457 m!1171225))

(assert (=> start!107746 d!140149))

(declare-fun b!1274492 () Bool)

(declare-fun e!727330 () List!28580)

(assert (=> b!1274492 (= e!727330 Nil!28577)))

(declare-fun b!1274493 () Bool)

(declare-fun e!727331 () Bool)

(declare-fun lt!575264 () List!28580)

(assert (=> b!1274493 (= e!727331 (not (containsKey!697 lt!575264 key!129)))))

(declare-fun d!140155 () Bool)

(assert (=> d!140155 e!727331))

(declare-fun res!847263 () Bool)

(assert (=> d!140155 (=> (not res!847263) (not e!727331))))

(declare-fun isStrictlySorted!841 (List!28580) Bool)

(assert (=> d!140155 (= res!847263 (isStrictlySorted!841 lt!575264))))

(declare-fun e!727329 () List!28580)

(assert (=> d!140155 (= lt!575264 e!727329)))

(declare-fun c!123862 () Bool)

(get-info :version)

(assert (=> d!140155 (= c!123862 (and ((_ is Cons!28576) (toList!9575 thiss!217)) (= (_1!10706 (h!29785 (toList!9575 thiss!217))) key!129)))))

(assert (=> d!140155 (isStrictlySorted!841 (toList!9575 thiss!217))))

(assert (=> d!140155 (= (removeStrictlySorted!177 (toList!9575 thiss!217) key!129) lt!575264)))

(declare-fun b!1274494 () Bool)

(assert (=> b!1274494 (= e!727329 e!727330)))

(declare-fun c!123863 () Bool)

(assert (=> b!1274494 (= c!123863 (and ((_ is Cons!28576) (toList!9575 thiss!217)) (not (= (_1!10706 (h!29785 (toList!9575 thiss!217))) key!129))))))

(declare-fun b!1274495 () Bool)

(declare-fun $colon$colon!660 (List!28580 tuple2!21390) List!28580)

(assert (=> b!1274495 (= e!727330 ($colon$colon!660 (removeStrictlySorted!177 (t!42113 (toList!9575 thiss!217)) key!129) (h!29785 (toList!9575 thiss!217))))))

(declare-fun b!1274496 () Bool)

(assert (=> b!1274496 (= e!727329 (t!42113 (toList!9575 thiss!217)))))

(assert (= (and d!140155 c!123862) b!1274496))

(assert (= (and d!140155 (not c!123862)) b!1274494))

(assert (= (and b!1274494 c!123863) b!1274495))

(assert (= (and b!1274494 (not c!123863)) b!1274492))

(assert (= (and d!140155 res!847263) b!1274493))

(declare-fun m!1171231 () Bool)

(assert (=> b!1274493 m!1171231))

(declare-fun m!1171235 () Bool)

(assert (=> d!140155 m!1171235))

(declare-fun m!1171237 () Bool)

(assert (=> d!140155 m!1171237))

(declare-fun m!1171243 () Bool)

(assert (=> b!1274495 m!1171243))

(assert (=> b!1274495 m!1171243))

(declare-fun m!1171253 () Bool)

(assert (=> b!1274495 m!1171253))

(assert (=> start!107746 d!140155))

(declare-fun d!140161 () Bool)

(assert (=> d!140161 (= (inv!44708 thiss!217) (isStrictlySorted!841 (toList!9575 thiss!217)))))

(declare-fun bs!36192 () Bool)

(assert (= bs!36192 d!140161))

(assert (=> bs!36192 m!1171237))

(assert (=> start!107746 d!140161))

(declare-fun b!1274508 () Bool)

(declare-fun e!727338 () Bool)

(declare-fun tp_is_empty!33159 () Bool)

(declare-fun tp!97942 () Bool)

(assert (=> b!1274508 (= e!727338 (and tp_is_empty!33159 tp!97942))))

(assert (=> b!1274439 (= tp!97934 e!727338)))

(assert (= (and b!1274439 ((_ is Cons!28576) (toList!9575 thiss!217))) b!1274508))

(check-sat (not b!1274495) (not d!140161) (not d!140149) (not b!1274508) (not b!1274493) (not b!1274455) tp_is_empty!33159 (not d!140155) (not b!1274457))
(check-sat)
