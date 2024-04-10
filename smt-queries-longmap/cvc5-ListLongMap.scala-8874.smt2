; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107744 () Bool)

(assert start!107744)

(declare-datatypes ((B!2114 0))(
  ( (B!2115 (val!16653 Int)) )
))
(declare-datatypes ((tuple2!21388 0))(
  ( (tuple2!21389 (_1!10705 (_ BitVec 64)) (_2!10705 B!2114)) )
))
(declare-datatypes ((List!28579 0))(
  ( (Nil!28576) (Cons!28575 (h!29784 tuple2!21388) (t!42112 List!28579)) )
))
(declare-datatypes ((ListLongMap!19117 0))(
  ( (ListLongMap!19118 (toList!9574 List!28579)) )
))
(declare-fun thiss!217 () ListLongMap!19117)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun contains!7679 (ListLongMap!19117 (_ BitVec 64)) Bool)

(declare-fun removeStrictlySorted!176 (List!28579 (_ BitVec 64)) List!28579)

(assert (=> start!107744 (contains!7679 (ListLongMap!19118 (removeStrictlySorted!176 (toList!9574 thiss!217) key!129)) key!129)))

(declare-fun e!727291 () Bool)

(declare-fun inv!44707 (ListLongMap!19117) Bool)

(assert (=> start!107744 (and (inv!44707 thiss!217) e!727291)))

(assert (=> start!107744 true))

(declare-fun b!1274436 () Bool)

(declare-fun tp!97931 () Bool)

(assert (=> b!1274436 (= e!727291 tp!97931)))

(assert (= start!107744 b!1274436))

(declare-fun m!1171195 () Bool)

(assert (=> start!107744 m!1171195))

(declare-fun m!1171197 () Bool)

(assert (=> start!107744 m!1171197))

(declare-fun m!1171199 () Bool)

(assert (=> start!107744 m!1171199))

(push 1)

(assert (not start!107744))

(assert (not b!1274436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140151 () Bool)

(declare-fun e!727308 () Bool)

(assert (=> d!140151 e!727308))

(declare-fun res!847255 () Bool)

(assert (=> d!140151 (=> res!847255 e!727308)))

(declare-fun lt!575248 () Bool)

(assert (=> d!140151 (= res!847255 (not lt!575248))))

(declare-fun lt!575247 () Bool)

(assert (=> d!140151 (= lt!575248 lt!575247)))

(declare-datatypes ((Unit!42344 0))(
  ( (Unit!42345) )
))
(declare-fun lt!575249 () Unit!42344)

(declare-fun e!727309 () Unit!42344)

(assert (=> d!140151 (= lt!575249 e!727309)))

(declare-fun c!123849 () Bool)

(assert (=> d!140151 (= c!123849 lt!575247)))

(declare-fun containsKey!698 (List!28579 (_ BitVec 64)) Bool)

(assert (=> d!140151 (= lt!575247 (containsKey!698 (toList!9574 (ListLongMap!19118 (removeStrictlySorted!176 (toList!9574 thiss!217) key!129))) key!129))))

(assert (=> d!140151 (= (contains!7679 (ListLongMap!19118 (removeStrictlySorted!176 (toList!9574 thiss!217) key!129)) key!129) lt!575248)))

(declare-fun b!1274458 () Bool)

(declare-fun lt!575250 () Unit!42344)

(assert (=> b!1274458 (= e!727309 lt!575250)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!456 (List!28579 (_ BitVec 64)) Unit!42344)

(assert (=> b!1274458 (= lt!575250 (lemmaContainsKeyImpliesGetValueByKeyDefined!456 (toList!9574 (ListLongMap!19118 (removeStrictlySorted!176 (toList!9574 thiss!217) key!129))) key!129))))

(declare-datatypes ((Option!740 0))(
  ( (Some!739 (v!19286 B!2114)) (None!738) )
))
(declare-fun isDefined!495 (Option!740) Bool)

(declare-fun getValueByKey!688 (List!28579 (_ BitVec 64)) Option!740)

(assert (=> b!1274458 (isDefined!495 (getValueByKey!688 (toList!9574 (ListLongMap!19118 (removeStrictlySorted!176 (toList!9574 thiss!217) key!129))) key!129))))

(declare-fun b!1274459 () Bool)

(declare-fun Unit!42347 () Unit!42344)

(assert (=> b!1274459 (= e!727309 Unit!42347)))

(declare-fun b!1274460 () Bool)

(assert (=> b!1274460 (= e!727308 (isDefined!495 (getValueByKey!688 (toList!9574 (ListLongMap!19118 (removeStrictlySorted!176 (toList!9574 thiss!217) key!129))) key!129)))))

(assert (= (and d!140151 c!123849) b!1274458))

(assert (= (and d!140151 (not c!123849)) b!1274459))

(assert (= (and d!140151 (not res!847255)) b!1274460))

(declare-fun m!1171215 () Bool)

(assert (=> d!140151 m!1171215))

(declare-fun m!1171219 () Bool)

(assert (=> b!1274458 m!1171219))

(declare-fun m!1171223 () Bool)

(assert (=> b!1274458 m!1171223))

(assert (=> b!1274458 m!1171223))

(declare-fun m!1171227 () Bool)

(assert (=> b!1274458 m!1171227))

(assert (=> b!1274460 m!1171223))

(assert (=> b!1274460 m!1171223))

(assert (=> b!1274460 m!1171227))

(assert (=> start!107744 d!140151))

(declare-fun b!1274487 () Bool)

(declare-fun e!727326 () List!28579)

(declare-fun e!727327 () List!28579)

(assert (=> b!1274487 (= e!727326 e!727327)))

(declare-fun c!123860 () Bool)

(assert (=> b!1274487 (= c!123860 (and (is-Cons!28575 (toList!9574 thiss!217)) (not (= (_1!10705 (h!29784 (toList!9574 thiss!217))) key!129))))))

(declare-fun b!1274488 () Bool)

(assert (=> b!1274488 (= e!727326 (t!42112 (toList!9574 thiss!217)))))

(declare-fun b!1274489 () Bool)

(declare-fun $colon$colon!659 (List!28579 tuple2!21388) List!28579)

(assert (=> b!1274489 (= e!727327 ($colon$colon!659 (removeStrictlySorted!176 (t!42112 (toList!9574 thiss!217)) key!129) (h!29784 (toList!9574 thiss!217))))))

(declare-fun b!1274490 () Bool)

(declare-fun e!727328 () Bool)

(declare-fun lt!575263 () List!28579)

(assert (=> b!1274490 (= e!727328 (not (containsKey!698 lt!575263 key!129)))))

(declare-fun d!140157 () Bool)

(assert (=> d!140157 e!727328))

(declare-fun res!847262 () Bool)

(assert (=> d!140157 (=> (not res!847262) (not e!727328))))

(declare-fun isStrictlySorted!842 (List!28579) Bool)

(assert (=> d!140157 (= res!847262 (isStrictlySorted!842 lt!575263))))

(assert (=> d!140157 (= lt!575263 e!727326)))

(declare-fun c!123861 () Bool)

(assert (=> d!140157 (= c!123861 (and (is-Cons!28575 (toList!9574 thiss!217)) (= (_1!10705 (h!29784 (toList!9574 thiss!217))) key!129)))))

(assert (=> d!140157 (isStrictlySorted!842 (toList!9574 thiss!217))))

(assert (=> d!140157 (= (removeStrictlySorted!176 (toList!9574 thiss!217) key!129) lt!575263)))

(declare-fun b!1274491 () Bool)

(assert (=> b!1274491 (= e!727327 Nil!28576)))

(assert (= (and d!140157 c!123861) b!1274488))

(assert (= (and d!140157 (not c!123861)) b!1274487))

(assert (= (and b!1274487 c!123860) b!1274489))

(assert (= (and b!1274487 (not c!123860)) b!1274491))

(assert (= (and d!140157 res!847262) b!1274490))

(declare-fun m!1171230 () Bool)

(assert (=> b!1274489 m!1171230))

(assert (=> b!1274489 m!1171230))

(declare-fun m!1171239 () Bool)

(assert (=> b!1274489 m!1171239))

(declare-fun m!1171245 () Bool)

(assert (=> b!1274490 m!1171245))

(declare-fun m!1171249 () Bool)

(assert (=> d!140157 m!1171249))

(declare-fun m!1171251 () Bool)

(assert (=> d!140157 m!1171251))

(assert (=> start!107744 d!140157))

(declare-fun d!140159 () Bool)

(assert (=> d!140159 (= (inv!44707 thiss!217) (isStrictlySorted!842 (toList!9574 thiss!217)))))

(declare-fun bs!36193 () Bool)

(assert (= bs!36193 d!140159))

(assert (=> bs!36193 m!1171251))

(assert (=> start!107744 d!140159))

(declare-fun b!1274509 () Bool)

(declare-fun e!727339 () Bool)

(declare-fun tp_is_empty!33158 () Bool)

