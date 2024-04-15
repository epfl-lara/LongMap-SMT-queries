; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107744 () Bool)

(assert start!107744)

(declare-datatypes ((B!2114 0))(
  ( (B!2115 (val!16653 Int)) )
))
(declare-datatypes ((tuple2!21464 0))(
  ( (tuple2!21465 (_1!10743 (_ BitVec 64)) (_2!10743 B!2114)) )
))
(declare-datatypes ((List!28652 0))(
  ( (Nil!28649) (Cons!28648 (h!29857 tuple2!21464) (t!42177 List!28652)) )
))
(declare-datatypes ((ListLongMap!19193 0))(
  ( (ListLongMap!19194 (toList!9612 List!28652)) )
))
(declare-fun thiss!217 () ListLongMap!19193)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun contains!7648 (ListLongMap!19193 (_ BitVec 64)) Bool)

(declare-fun removeStrictlySorted!176 (List!28652 (_ BitVec 64)) List!28652)

(assert (=> start!107744 (contains!7648 (ListLongMap!19194 (removeStrictlySorted!176 (toList!9612 thiss!217) key!129)) key!129)))

(declare-fun e!727262 () Bool)

(declare-fun inv!44707 (ListLongMap!19193) Bool)

(assert (=> start!107744 (and (inv!44707 thiss!217) e!727262)))

(assert (=> start!107744 true))

(declare-fun b!1274372 () Bool)

(declare-fun tp!97932 () Bool)

(assert (=> b!1274372 (= e!727262 tp!97932)))

(assert (= start!107744 b!1274372))

(declare-fun m!1170695 () Bool)

(assert (=> start!107744 m!1170695))

(declare-fun m!1170697 () Bool)

(assert (=> start!107744 m!1170697))

(declare-fun m!1170699 () Bool)

(assert (=> start!107744 m!1170699))

(check-sat (not start!107744) (not b!1274372))
(check-sat)
(get-model)

(declare-fun d!140037 () Bool)

(declare-fun e!727284 () Bool)

(assert (=> d!140037 e!727284))

(declare-fun res!847230 () Bool)

(assert (=> d!140037 (=> res!847230 e!727284)))

(declare-fun lt!575078 () Bool)

(assert (=> d!140037 (= res!847230 (not lt!575078))))

(declare-fun lt!575079 () Bool)

(assert (=> d!140037 (= lt!575078 lt!575079)))

(declare-datatypes ((Unit!42191 0))(
  ( (Unit!42192) )
))
(declare-fun lt!575080 () Unit!42191)

(declare-fun e!727283 () Unit!42191)

(assert (=> d!140037 (= lt!575080 e!727283)))

(declare-fun c!123835 () Bool)

(assert (=> d!140037 (= c!123835 lt!575079)))

(declare-fun containsKey!696 (List!28652 (_ BitVec 64)) Bool)

(assert (=> d!140037 (= lt!575079 (containsKey!696 (toList!9612 (ListLongMap!19194 (removeStrictlySorted!176 (toList!9612 thiss!217) key!129))) key!129))))

(assert (=> d!140037 (= (contains!7648 (ListLongMap!19194 (removeStrictlySorted!176 (toList!9612 thiss!217) key!129)) key!129) lt!575078)))

(declare-fun b!1274400 () Bool)

(declare-fun lt!575077 () Unit!42191)

(assert (=> b!1274400 (= e!727283 lt!575077)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!455 (List!28652 (_ BitVec 64)) Unit!42191)

(assert (=> b!1274400 (= lt!575077 (lemmaContainsKeyImpliesGetValueByKeyDefined!455 (toList!9612 (ListLongMap!19194 (removeStrictlySorted!176 (toList!9612 thiss!217) key!129))) key!129))))

(declare-datatypes ((Option!742 0))(
  ( (Some!741 (v!19285 B!2114)) (None!740) )
))
(declare-fun isDefined!498 (Option!742) Bool)

(declare-fun getValueByKey!691 (List!28652 (_ BitVec 64)) Option!742)

(assert (=> b!1274400 (isDefined!498 (getValueByKey!691 (toList!9612 (ListLongMap!19194 (removeStrictlySorted!176 (toList!9612 thiss!217) key!129))) key!129))))

(declare-fun b!1274401 () Bool)

(declare-fun Unit!42195 () Unit!42191)

(assert (=> b!1274401 (= e!727283 Unit!42195)))

(declare-fun b!1274402 () Bool)

(assert (=> b!1274402 (= e!727284 (isDefined!498 (getValueByKey!691 (toList!9612 (ListLongMap!19194 (removeStrictlySorted!176 (toList!9612 thiss!217) key!129))) key!129)))))

(assert (= (and d!140037 c!123835) b!1274400))

(assert (= (and d!140037 (not c!123835)) b!1274401))

(assert (= (and d!140037 (not res!847230)) b!1274402))

(declare-fun m!1170721 () Bool)

(assert (=> d!140037 m!1170721))

(declare-fun m!1170723 () Bool)

(assert (=> b!1274400 m!1170723))

(declare-fun m!1170725 () Bool)

(assert (=> b!1274400 m!1170725))

(assert (=> b!1274400 m!1170725))

(declare-fun m!1170727 () Bool)

(assert (=> b!1274400 m!1170727))

(assert (=> b!1274402 m!1170725))

(assert (=> b!1274402 m!1170725))

(assert (=> b!1274402 m!1170727))

(assert (=> start!107744 d!140037))

(declare-fun b!1274447 () Bool)

(declare-fun e!727314 () List!28652)

(declare-fun e!727313 () List!28652)

(assert (=> b!1274447 (= e!727314 e!727313)))

(declare-fun c!123851 () Bool)

(get-info :version)

(assert (=> b!1274447 (= c!123851 (and ((_ is Cons!28648) (toList!9612 thiss!217)) (not (= (_1!10743 (h!29857 (toList!9612 thiss!217))) key!129))))))

(declare-fun b!1274449 () Bool)

(assert (=> b!1274449 (= e!727314 (t!42177 (toList!9612 thiss!217)))))

(declare-fun b!1274451 () Bool)

(declare-fun $colon$colon!661 (List!28652 tuple2!21464) List!28652)

(assert (=> b!1274451 (= e!727313 ($colon$colon!661 (removeStrictlySorted!176 (t!42177 (toList!9612 thiss!217)) key!129) (h!29857 (toList!9612 thiss!217))))))

(declare-fun d!140045 () Bool)

(declare-fun e!727315 () Bool)

(assert (=> d!140045 e!727315))

(declare-fun res!847239 () Bool)

(assert (=> d!140045 (=> (not res!847239) (not e!727315))))

(declare-fun lt!575093 () List!28652)

(declare-fun isStrictlySorted!838 (List!28652) Bool)

(assert (=> d!140045 (= res!847239 (isStrictlySorted!838 lt!575093))))

(assert (=> d!140045 (= lt!575093 e!727314)))

(declare-fun c!123854 () Bool)

(assert (=> d!140045 (= c!123854 (and ((_ is Cons!28648) (toList!9612 thiss!217)) (= (_1!10743 (h!29857 (toList!9612 thiss!217))) key!129)))))

(assert (=> d!140045 (isStrictlySorted!838 (toList!9612 thiss!217))))

(assert (=> d!140045 (= (removeStrictlySorted!176 (toList!9612 thiss!217) key!129) lt!575093)))

(declare-fun b!1274453 () Bool)

(assert (=> b!1274453 (= e!727315 (not (containsKey!696 lt!575093 key!129)))))

(declare-fun b!1274455 () Bool)

(assert (=> b!1274455 (= e!727313 Nil!28649)))

(assert (= (and d!140045 c!123854) b!1274449))

(assert (= (and d!140045 (not c!123854)) b!1274447))

(assert (= (and b!1274447 c!123851) b!1274451))

(assert (= (and b!1274447 (not c!123851)) b!1274455))

(assert (= (and d!140045 res!847239) b!1274453))

(declare-fun m!1170749 () Bool)

(assert (=> b!1274451 m!1170749))

(assert (=> b!1274451 m!1170749))

(declare-fun m!1170752 () Bool)

(assert (=> b!1274451 m!1170752))

(declare-fun m!1170756 () Bool)

(assert (=> d!140045 m!1170756))

(declare-fun m!1170761 () Bool)

(assert (=> d!140045 m!1170761))

(declare-fun m!1170764 () Bool)

(assert (=> b!1274453 m!1170764))

(assert (=> start!107744 d!140045))

(declare-fun d!140053 () Bool)

(assert (=> d!140053 (= (inv!44707 thiss!217) (isStrictlySorted!838 (toList!9612 thiss!217)))))

(declare-fun bs!36166 () Bool)

(assert (= bs!36166 d!140053))

(assert (=> bs!36166 m!1170761))

(assert (=> start!107744 d!140053))

(declare-fun b!1274464 () Bool)

(declare-fun e!727321 () Bool)

(declare-fun tp_is_empty!33160 () Bool)

(declare-fun tp!97946 () Bool)

(assert (=> b!1274464 (= e!727321 (and tp_is_empty!33160 tp!97946))))

(assert (=> b!1274372 (= tp!97932 e!727321)))

(assert (= (and b!1274372 ((_ is Cons!28648) (toList!9612 thiss!217))) b!1274464))

(check-sat (not b!1274453) (not d!140037) tp_is_empty!33160 (not d!140045) (not b!1274451) (not d!140053) (not b!1274400) (not b!1274464) (not b!1274402))
(check-sat)
