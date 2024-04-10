; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107728 () Bool)

(assert start!107728)

(declare-datatypes ((B!2110 0))(
  ( (B!2111 (val!16651 Int)) )
))
(declare-datatypes ((tuple2!21384 0))(
  ( (tuple2!21385 (_1!10703 (_ BitVec 64)) (_2!10703 B!2110)) )
))
(declare-datatypes ((List!28577 0))(
  ( (Nil!28574) (Cons!28573 (h!29782 tuple2!21384) (t!42110 List!28577)) )
))
(declare-datatypes ((ListLongMap!19113 0))(
  ( (ListLongMap!19114 (toList!9572 List!28577)) )
))
(declare-fun thiss!217 () ListLongMap!19113)

(declare-fun key!129 () (_ BitVec 64))

(declare-fun inv!44700 (ListLongMap!19113) Bool)

(declare-fun removeStrictlySorted!174 (List!28577 (_ BitVec 64)) List!28577)

(assert (=> start!107728 (not (inv!44700 (ListLongMap!19114 (removeStrictlySorted!174 (toList!9572 thiss!217) key!129))))))

(declare-fun e!727249 () Bool)

(assert (=> start!107728 (and (inv!44700 thiss!217) e!727249)))

(assert (=> start!107728 true))

(declare-fun b!1274370 () Bool)

(declare-fun tp!97916 () Bool)

(assert (=> b!1274370 (= e!727249 tp!97916)))

(assert (= start!107728 b!1274370))

(declare-fun m!1171147 () Bool)

(assert (=> start!107728 m!1171147))

(declare-fun m!1171149 () Bool)

(assert (=> start!107728 m!1171149))

(declare-fun m!1171151 () Bool)

(assert (=> start!107728 m!1171151))

(check-sat (not start!107728) (not b!1274370))
(check-sat)
(get-model)

(declare-fun d!140137 () Bool)

(declare-fun isStrictlySorted!840 (List!28577) Bool)

(assert (=> d!140137 (= (inv!44700 (ListLongMap!19114 (removeStrictlySorted!174 (toList!9572 thiss!217) key!129))) (isStrictlySorted!840 (toList!9572 (ListLongMap!19114 (removeStrictlySorted!174 (toList!9572 thiss!217) key!129)))))))

(declare-fun bs!36185 () Bool)

(assert (= bs!36185 d!140137))

(declare-fun m!1171163 () Bool)

(assert (=> bs!36185 m!1171163))

(assert (=> start!107728 d!140137))

(declare-fun b!1274424 () Bool)

(declare-fun e!727284 () List!28577)

(declare-fun e!727285 () List!28577)

(assert (=> b!1274424 (= e!727284 e!727285)))

(declare-fun c!123842 () Bool)

(get-info :version)

(assert (=> b!1274424 (= c!123842 (and ((_ is Cons!28573) (toList!9572 thiss!217)) (not (= (_1!10703 (h!29782 (toList!9572 thiss!217))) key!129))))))

(declare-fun b!1274425 () Bool)

(assert (=> b!1274425 (= e!727285 Nil!28574)))

(declare-fun b!1274426 () Bool)

(assert (=> b!1274426 (= e!727284 (t!42110 (toList!9572 thiss!217)))))

(declare-fun b!1274427 () Bool)

(declare-fun e!727283 () Bool)

(declare-fun lt!575226 () List!28577)

(declare-fun containsKey!696 (List!28577 (_ BitVec 64)) Bool)

(assert (=> b!1274427 (= e!727283 (not (containsKey!696 lt!575226 key!129)))))

(declare-fun d!140139 () Bool)

(assert (=> d!140139 e!727283))

(declare-fun res!847249 () Bool)

(assert (=> d!140139 (=> (not res!847249) (not e!727283))))

(assert (=> d!140139 (= res!847249 (isStrictlySorted!840 lt!575226))))

(assert (=> d!140139 (= lt!575226 e!727284)))

(declare-fun c!123843 () Bool)

(assert (=> d!140139 (= c!123843 (and ((_ is Cons!28573) (toList!9572 thiss!217)) (= (_1!10703 (h!29782 (toList!9572 thiss!217))) key!129)))))

(assert (=> d!140139 (isStrictlySorted!840 (toList!9572 thiss!217))))

(assert (=> d!140139 (= (removeStrictlySorted!174 (toList!9572 thiss!217) key!129) lt!575226)))

(declare-fun b!1274428 () Bool)

(declare-fun $colon$colon!658 (List!28577 tuple2!21384) List!28577)

(assert (=> b!1274428 (= e!727285 ($colon$colon!658 (removeStrictlySorted!174 (t!42110 (toList!9572 thiss!217)) key!129) (h!29782 (toList!9572 thiss!217))))))

(assert (= (and d!140139 c!123843) b!1274426))

(assert (= (and d!140139 (not c!123843)) b!1274424))

(assert (= (and b!1274424 c!123842) b!1274428))

(assert (= (and b!1274424 (not c!123842)) b!1274425))

