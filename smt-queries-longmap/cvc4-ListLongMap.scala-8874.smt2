; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107748 () Bool)

(assert start!107748)

(declare-datatypes ((B!2118 0))(
  ( (B!2119 (val!16655 Int)) )
))
(declare-datatypes ((tuple2!21392 0))(
  ( (tuple2!21393 (_1!10707 (_ BitVec 64)) (_2!10707 B!2118)) )
))
(declare-datatypes ((List!28581 0))(
  ( (Nil!28578) (Cons!28577 (h!29786 tuple2!21392) (t!42114 List!28581)) )
))
(declare-datatypes ((ListLongMap!19121 0))(
  ( (ListLongMap!19122 (toList!9576 List!28581)) )
))
(declare-fun thiss!217 () ListLongMap!19121)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun contains!7681 (ListLongMap!19121 (_ BitVec 64)) Bool)

(declare-fun removeStrictlySorted!178 (List!28581 (_ BitVec 64)) List!28581)

(assert (=> start!107748 (contains!7681 (ListLongMap!19122 (removeStrictlySorted!178 (toList!9576 thiss!217) key!129)) key!129)))

(declare-fun e!727297 () Bool)

(declare-fun inv!44709 (ListLongMap!19121) Bool)

(assert (=> start!107748 (and (inv!44709 thiss!217) e!727297)))

(assert (=> start!107748 true))

(declare-fun b!1274442 () Bool)

(declare-fun tp!97937 () Bool)

(assert (=> b!1274442 (= e!727297 tp!97937)))

(assert (= start!107748 b!1274442))

(declare-fun m!1171207 () Bool)

(assert (=> start!107748 m!1171207))

(declare-fun m!1171209 () Bool)

(assert (=> start!107748 m!1171209))

(declare-fun m!1171211 () Bool)

(assert (=> start!107748 m!1171211))

(push 1)

(assert (not start!107748))

(assert (not b!1274442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140153 () Bool)

(declare-fun e!727332 () Bool)

(assert (=> d!140153 e!727332))

(declare-fun res!847264 () Bool)

(assert (=> d!140153 (=> res!847264 e!727332)))

(declare-fun lt!575267 () Bool)

(assert (=> d!140153 (= res!847264 (not lt!575267))))

(declare-fun lt!575268 () Bool)

(assert (=> d!140153 (= lt!575267 lt!575268)))

(declare-datatypes ((Unit!42348 0))(
  ( (Unit!42349) )
))
(declare-fun lt!575265 () Unit!42348)

(declare-fun e!727333 () Unit!42348)

(assert (=> d!140153 (= lt!575265 e!727333)))

(declare-fun c!123864 () Bool)

(assert (=> d!140153 (= c!123864 lt!575268)))

(declare-fun containsKey!699 (List!28581 (_ BitVec 64)) Bool)

(assert (=> d!140153 (= lt!575268 (containsKey!699 (toList!9576 (ListLongMap!19122 (removeStrictlySorted!178 (toList!9576 thiss!217) key!129))) key!129))))

(assert (=> d!140153 (= (contains!7681 (ListLongMap!19122 (removeStrictlySorted!178 (toList!9576 thiss!217) key!129)) key!129) lt!575267)))

(declare-fun b!1274497 () Bool)

(declare-fun lt!575266 () Unit!42348)

(assert (=> b!1274497 (= e!727333 lt!575266)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!457 (List!28581 (_ BitVec 64)) Unit!42348)

(assert (=> b!1274497 (= lt!575266 (lemmaContainsKeyImpliesGetValueByKeyDefined!457 (toList!9576 (ListLongMap!19122 (removeStrictlySorted!178 (toList!9576 thiss!217) key!129))) key!129))))

(declare-datatypes ((Option!741 0))(
  ( (Some!740 (v!19287 B!2118)) (None!739) )
))
(declare-fun isDefined!496 (Option!741) Bool)

(declare-fun getValueByKey!689 (List!28581 (_ BitVec 64)) Option!741)

(assert (=> b!1274497 (isDefined!496 (getValueByKey!689 (toList!9576 (ListLongMap!19122 (removeStrictlySorted!178 (toList!9576 thiss!217) key!129))) key!129))))

(declare-fun b!1274498 () Bool)

(declare-fun Unit!42350 () Unit!42348)

(assert (=> b!1274498 (= e!727333 Unit!42350)))

(declare-fun b!1274499 () Bool)

(assert (=> b!1274499 (= e!727332 (isDefined!496 (getValueByKey!689 (toList!9576 (ListLongMap!19122 (removeStrictlySorted!178 (toList!9576 thiss!217) key!129))) key!129)))))

(assert (= (and d!140153 c!123864) b!1274497))

(assert (= (and d!140153 (not c!123864)) b!1274498))

(assert (= (and d!140153 (not res!847264)) b!1274499))

(declare-fun m!1171233 () Bool)

(assert (=> d!140153 m!1171233))

(declare-fun m!1171241 () Bool)

(assert (=> b!1274497 m!1171241))

(declare-fun m!1171247 () Bool)

(assert (=> b!1274497 m!1171247))

(assert (=> b!1274497 m!1171247))

