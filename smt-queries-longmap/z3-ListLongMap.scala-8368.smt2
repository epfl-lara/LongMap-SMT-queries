; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102026 () Bool)

(assert start!102026)

(declare-fun b_free!26479 () Bool)

(declare-fun b_next!26479 () Bool)

(assert (=> start!102026 (= b_free!26479 (not b_next!26479))))

(declare-fun tp!92483 () Bool)

(declare-fun b_and!44221 () Bool)

(assert (=> start!102026 (= tp!92483 b_and!44221)))

(declare-fun mapIsEmpty!48673 () Bool)

(declare-fun mapRes!48673 () Bool)

(assert (=> mapIsEmpty!48673 mapRes!48673))

(declare-fun b!1227420 () Bool)

(declare-fun res!815399 () Bool)

(declare-fun e!697202 () Bool)

(assert (=> b!1227420 (=> (not res!815399) (not e!697202))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1227420 (= res!815399 (validMask!0 mask!1564))))

(declare-fun b!1227421 () Bool)

(declare-fun res!815393 () Bool)

(assert (=> b!1227421 (=> (not res!815393) (not e!697202))))

(declare-datatypes ((array!79179 0))(
  ( (array!79180 (arr!38210 (Array (_ BitVec 32) (_ BitVec 64))) (size!38747 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79179)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79179 (_ BitVec 32)) Bool)

(assert (=> b!1227421 (= res!815393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1227422 () Bool)

(declare-fun e!697201 () Bool)

(declare-fun e!697200 () Bool)

(assert (=> b!1227422 (= e!697201 (and e!697200 mapRes!48673))))

(declare-fun condMapEmpty!48673 () Bool)

(declare-datatypes ((V!46705 0))(
  ( (V!46706 (val!15648 Int)) )
))
(declare-datatypes ((ValueCell!14882 0))(
  ( (ValueCellFull!14882 (v!18306 V!46705)) (EmptyCell!14882) )
))
(declare-datatypes ((array!79181 0))(
  ( (array!79182 (arr!38211 (Array (_ BitVec 32) ValueCell!14882)) (size!38748 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79181)

(declare-fun mapDefault!48673 () ValueCell!14882)

(assert (=> b!1227422 (= condMapEmpty!48673 (= (arr!38211 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14882)) mapDefault!48673)))))

(declare-fun b!1227423 () Bool)

(declare-fun e!697203 () Bool)

(declare-fun tp_is_empty!31183 () Bool)

(assert (=> b!1227423 (= e!697203 tp_is_empty!31183)))

(declare-fun b!1227424 () Bool)

(declare-fun res!815403 () Bool)

(assert (=> b!1227424 (=> (not res!815403) (not e!697202))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1227424 (= res!815403 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38747 _keys!1208))))))

(declare-fun b!1227425 () Bool)

(declare-fun res!815397 () Bool)

(assert (=> b!1227425 (=> (not res!815397) (not e!697202))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1227425 (= res!815397 (= (select (arr!38210 _keys!1208) i!673) k0!934))))

(declare-fun b!1227419 () Bool)

(declare-fun e!697205 () Bool)

(declare-fun e!697207 () Bool)

(assert (=> b!1227419 (= e!697205 e!697207)))

(declare-fun res!815395 () Bool)

(assert (=> b!1227419 (=> res!815395 e!697207)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1227419 (= res!815395 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!20188 0))(
  ( (tuple2!20189 (_1!10105 (_ BitVec 64)) (_2!10105 V!46705)) )
))
(declare-datatypes ((List!26999 0))(
  ( (Nil!26996) (Cons!26995 (h!28213 tuple2!20188) (t!40450 List!26999)) )
))
(declare-datatypes ((ListLongMap!18165 0))(
  ( (ListLongMap!18166 (toList!9098 List!26999)) )
))
(declare-fun lt!559190 () ListLongMap!18165)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!559187 () array!79179)

(declare-fun lt!559188 () array!79181)

(declare-fun minValue!944 () V!46705)

(declare-fun getCurrentListMapNoExtraKeys!5545 (array!79179 array!79181 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) Int) ListLongMap!18165)

(assert (=> b!1227419 (= lt!559190 (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3439 (Int (_ BitVec 64)) V!46705)

(assert (=> b!1227419 (= lt!559188 (array!79182 (store (arr!38211 _values!996) i!673 (ValueCellFull!14882 (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38748 _values!996)))))

(declare-fun lt!559189 () ListLongMap!18165)

(assert (=> b!1227419 (= lt!559189 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!815401 () Bool)

(assert (=> start!102026 (=> (not res!815401) (not e!697202))))

(assert (=> start!102026 (= res!815401 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38747 _keys!1208))))))

(assert (=> start!102026 e!697202))

(assert (=> start!102026 tp_is_empty!31183))

(declare-fun array_inv!29152 (array!79179) Bool)

(assert (=> start!102026 (array_inv!29152 _keys!1208)))

(assert (=> start!102026 true))

(assert (=> start!102026 tp!92483))

(declare-fun array_inv!29153 (array!79181) Bool)

(assert (=> start!102026 (and (array_inv!29153 _values!996) e!697201)))

(declare-fun b!1227426 () Bool)

(declare-fun e!697204 () Bool)

(declare-fun -!1966 (ListLongMap!18165 (_ BitVec 64)) ListLongMap!18165)

(assert (=> b!1227426 (= e!697204 (= lt!559190 (-!1966 lt!559189 k0!934)))))

(declare-fun b!1227427 () Bool)

(declare-fun res!815400 () Bool)

(assert (=> b!1227427 (=> (not res!815400) (not e!697202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227427 (= res!815400 (validKeyInArray!0 k0!934))))

(declare-fun b!1227428 () Bool)

(declare-fun res!815402 () Bool)

(declare-fun e!697199 () Bool)

(assert (=> b!1227428 (=> (not res!815402) (not e!697199))))

(declare-datatypes ((List!27000 0))(
  ( (Nil!26997) (Cons!26996 (h!28214 (_ BitVec 64)) (t!40451 List!27000)) )
))
(declare-fun arrayNoDuplicates!0 (array!79179 (_ BitVec 32) List!27000) Bool)

(assert (=> b!1227428 (= res!815402 (arrayNoDuplicates!0 lt!559187 #b00000000000000000000000000000000 Nil!26997))))

(declare-fun b!1227429 () Bool)

(declare-fun res!815394 () Bool)

(assert (=> b!1227429 (=> (not res!815394) (not e!697202))))

(assert (=> b!1227429 (= res!815394 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26997))))

(declare-fun b!1227430 () Bool)

(assert (=> b!1227430 (= e!697200 tp_is_empty!31183)))

(declare-fun mapNonEmpty!48673 () Bool)

(declare-fun tp!92482 () Bool)

(assert (=> mapNonEmpty!48673 (= mapRes!48673 (and tp!92482 e!697203))))

(declare-fun mapRest!48673 () (Array (_ BitVec 32) ValueCell!14882))

(declare-fun mapValue!48673 () ValueCell!14882)

(declare-fun mapKey!48673 () (_ BitVec 32))

(assert (=> mapNonEmpty!48673 (= (arr!38211 _values!996) (store mapRest!48673 mapKey!48673 mapValue!48673))))

(declare-fun b!1227431 () Bool)

(assert (=> b!1227431 (= e!697207 e!697204)))

(declare-fun res!815398 () Bool)

(assert (=> b!1227431 (=> res!815398 e!697204)))

(assert (=> b!1227431 (= res!815398 (validKeyInArray!0 (select (arr!38210 _keys!1208) from!1455)))))

(assert (=> b!1227431 (= (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1966 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40609 0))(
  ( (Unit!40610) )
))
(declare-fun lt!559186 () Unit!40609)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1181 (array!79179 array!79181 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40609)

(assert (=> b!1227431 (= lt!559186 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1227432 () Bool)

(assert (=> b!1227432 (= e!697202 e!697199)))

(declare-fun res!815391 () Bool)

(assert (=> b!1227432 (=> (not res!815391) (not e!697199))))

(assert (=> b!1227432 (= res!815391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!559187 mask!1564))))

(assert (=> b!1227432 (= lt!559187 (array!79180 (store (arr!38210 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38747 _keys!1208)))))

(declare-fun b!1227433 () Bool)

(assert (=> b!1227433 (= e!697199 (not e!697205))))

(declare-fun res!815392 () Bool)

(assert (=> b!1227433 (=> res!815392 e!697205)))

(assert (=> b!1227433 (= res!815392 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227433 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!559185 () Unit!40609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79179 (_ BitVec 64) (_ BitVec 32)) Unit!40609)

(assert (=> b!1227433 (= lt!559185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1227434 () Bool)

(declare-fun res!815396 () Bool)

(assert (=> b!1227434 (=> (not res!815396) (not e!697202))))

(assert (=> b!1227434 (= res!815396 (and (= (size!38748 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38747 _keys!1208) (size!38748 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!102026 res!815401) b!1227420))

(assert (= (and b!1227420 res!815399) b!1227434))

(assert (= (and b!1227434 res!815396) b!1227421))

(assert (= (and b!1227421 res!815393) b!1227429))

(assert (= (and b!1227429 res!815394) b!1227424))

(assert (= (and b!1227424 res!815403) b!1227427))

(assert (= (and b!1227427 res!815400) b!1227425))

(assert (= (and b!1227425 res!815397) b!1227432))

(assert (= (and b!1227432 res!815391) b!1227428))

(assert (= (and b!1227428 res!815402) b!1227433))

(assert (= (and b!1227433 (not res!815392)) b!1227419))

(assert (= (and b!1227419 (not res!815395)) b!1227431))

(assert (= (and b!1227431 (not res!815398)) b!1227426))

(assert (= (and b!1227422 condMapEmpty!48673) mapIsEmpty!48673))

(assert (= (and b!1227422 (not condMapEmpty!48673)) mapNonEmpty!48673))

(get-info :version)

(assert (= (and mapNonEmpty!48673 ((_ is ValueCellFull!14882) mapValue!48673)) b!1227423))

(assert (= (and b!1227422 ((_ is ValueCellFull!14882) mapDefault!48673)) b!1227430))

(assert (= start!102026 b!1227422))

(declare-fun b_lambda!22453 () Bool)

(assert (=> (not b_lambda!22453) (not b!1227419)))

(declare-fun t!40449 () Bool)

(declare-fun tb!11271 () Bool)

(assert (=> (and start!102026 (= defaultEntry!1004 defaultEntry!1004) t!40449) tb!11271))

(declare-fun result!23163 () Bool)

(assert (=> tb!11271 (= result!23163 tp_is_empty!31183)))

(assert (=> b!1227419 t!40449))

(declare-fun b_and!44223 () Bool)

(assert (= b_and!44221 (and (=> t!40449 result!23163) b_and!44223)))

(declare-fun m!1132799 () Bool)

(assert (=> mapNonEmpty!48673 m!1132799))

(declare-fun m!1132801 () Bool)

(assert (=> b!1227429 m!1132801))

(declare-fun m!1132803 () Bool)

(assert (=> b!1227427 m!1132803))

(declare-fun m!1132805 () Bool)

(assert (=> b!1227432 m!1132805))

(declare-fun m!1132807 () Bool)

(assert (=> b!1227432 m!1132807))

(declare-fun m!1132809 () Bool)

(assert (=> b!1227426 m!1132809))

(declare-fun m!1132811 () Bool)

(assert (=> b!1227431 m!1132811))

(declare-fun m!1132813 () Bool)

(assert (=> b!1227431 m!1132813))

(declare-fun m!1132815 () Bool)

(assert (=> b!1227431 m!1132815))

(assert (=> b!1227431 m!1132811))

(declare-fun m!1132817 () Bool)

(assert (=> b!1227431 m!1132817))

(declare-fun m!1132819 () Bool)

(assert (=> b!1227431 m!1132819))

(declare-fun m!1132821 () Bool)

(assert (=> b!1227431 m!1132821))

(assert (=> b!1227431 m!1132819))

(declare-fun m!1132823 () Bool)

(assert (=> b!1227428 m!1132823))

(declare-fun m!1132825 () Bool)

(assert (=> start!102026 m!1132825))

(declare-fun m!1132827 () Bool)

(assert (=> start!102026 m!1132827))

(declare-fun m!1132829 () Bool)

(assert (=> b!1227425 m!1132829))

(declare-fun m!1132831 () Bool)

(assert (=> b!1227421 m!1132831))

(declare-fun m!1132833 () Bool)

(assert (=> b!1227419 m!1132833))

(declare-fun m!1132835 () Bool)

(assert (=> b!1227419 m!1132835))

(declare-fun m!1132837 () Bool)

(assert (=> b!1227419 m!1132837))

(declare-fun m!1132839 () Bool)

(assert (=> b!1227419 m!1132839))

(declare-fun m!1132841 () Bool)

(assert (=> b!1227420 m!1132841))

(declare-fun m!1132843 () Bool)

(assert (=> b!1227433 m!1132843))

(declare-fun m!1132845 () Bool)

(assert (=> b!1227433 m!1132845))

(check-sat (not b!1227419) (not b!1227431) (not b_next!26479) (not mapNonEmpty!48673) (not b!1227420) (not b!1227426) tp_is_empty!31183 (not b!1227421) (not b!1227432) (not start!102026) b_and!44223 (not b!1227429) (not b!1227427) (not b!1227428) (not b_lambda!22453) (not b!1227433))
(check-sat b_and!44223 (not b_next!26479))
(get-model)

(declare-fun b_lambda!22459 () Bool)

(assert (= b_lambda!22453 (or (and start!102026 b_free!26479) b_lambda!22459)))

(check-sat (not b!1227419) (not b!1227431) (not b_next!26479) (not mapNonEmpty!48673) (not b!1227420) (not b!1227426) tp_is_empty!31183 (not b!1227421) (not b_lambda!22459) (not b!1227432) (not start!102026) b_and!44223 (not b!1227429) (not b!1227427) (not b!1227428) (not b!1227433))
(check-sat b_and!44223 (not b_next!26479))
(get-model)

(declare-fun b!1227547 () Bool)

(declare-fun e!697272 () Bool)

(declare-fun call!60838 () Bool)

(assert (=> b!1227547 (= e!697272 call!60838)))

(declare-fun d!134443 () Bool)

(declare-fun res!815490 () Bool)

(declare-fun e!697271 () Bool)

(assert (=> d!134443 (=> res!815490 e!697271)))

(assert (=> d!134443 (= res!815490 (bvsge #b00000000000000000000000000000000 (size!38747 lt!559187)))))

(assert (=> d!134443 (= (arrayNoDuplicates!0 lt!559187 #b00000000000000000000000000000000 Nil!26997) e!697271)))

(declare-fun bm!60835 () Bool)

(declare-fun c!120901 () Bool)

(assert (=> bm!60835 (= call!60838 (arrayNoDuplicates!0 lt!559187 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120901 (Cons!26996 (select (arr!38210 lt!559187) #b00000000000000000000000000000000) Nil!26997) Nil!26997)))))

(declare-fun b!1227548 () Bool)

(declare-fun e!697270 () Bool)

(assert (=> b!1227548 (= e!697271 e!697270)))

(declare-fun res!815489 () Bool)

(assert (=> b!1227548 (=> (not res!815489) (not e!697270))))

(declare-fun e!697273 () Bool)

(assert (=> b!1227548 (= res!815489 (not e!697273))))

(declare-fun res!815488 () Bool)

(assert (=> b!1227548 (=> (not res!815488) (not e!697273))))

(assert (=> b!1227548 (= res!815488 (validKeyInArray!0 (select (arr!38210 lt!559187) #b00000000000000000000000000000000)))))

(declare-fun b!1227549 () Bool)

(assert (=> b!1227549 (= e!697270 e!697272)))

(assert (=> b!1227549 (= c!120901 (validKeyInArray!0 (select (arr!38210 lt!559187) #b00000000000000000000000000000000)))))

(declare-fun b!1227550 () Bool)

(declare-fun contains!7071 (List!27000 (_ BitVec 64)) Bool)

(assert (=> b!1227550 (= e!697273 (contains!7071 Nil!26997 (select (arr!38210 lt!559187) #b00000000000000000000000000000000)))))

(declare-fun b!1227551 () Bool)

(assert (=> b!1227551 (= e!697272 call!60838)))

(assert (= (and d!134443 (not res!815490)) b!1227548))

(assert (= (and b!1227548 res!815488) b!1227550))

(assert (= (and b!1227548 res!815489) b!1227549))

(assert (= (and b!1227549 c!120901) b!1227547))

(assert (= (and b!1227549 (not c!120901)) b!1227551))

(assert (= (or b!1227547 b!1227551) bm!60835))

(declare-fun m!1132943 () Bool)

(assert (=> bm!60835 m!1132943))

(declare-fun m!1132945 () Bool)

(assert (=> bm!60835 m!1132945))

(assert (=> b!1227548 m!1132943))

(assert (=> b!1227548 m!1132943))

(declare-fun m!1132947 () Bool)

(assert (=> b!1227548 m!1132947))

(assert (=> b!1227549 m!1132943))

(assert (=> b!1227549 m!1132943))

(assert (=> b!1227549 m!1132947))

(assert (=> b!1227550 m!1132943))

(assert (=> b!1227550 m!1132943))

(declare-fun m!1132949 () Bool)

(assert (=> b!1227550 m!1132949))

(assert (=> b!1227428 d!134443))

(declare-fun b!1227552 () Bool)

(declare-fun e!697276 () Bool)

(declare-fun call!60839 () Bool)

(assert (=> b!1227552 (= e!697276 call!60839)))

(declare-fun d!134445 () Bool)

(declare-fun res!815493 () Bool)

(declare-fun e!697275 () Bool)

(assert (=> d!134445 (=> res!815493 e!697275)))

(assert (=> d!134445 (= res!815493 (bvsge #b00000000000000000000000000000000 (size!38747 _keys!1208)))))

(assert (=> d!134445 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26997) e!697275)))

(declare-fun bm!60836 () Bool)

(declare-fun c!120902 () Bool)

(assert (=> bm!60836 (= call!60839 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120902 (Cons!26996 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000) Nil!26997) Nil!26997)))))

(declare-fun b!1227553 () Bool)

(declare-fun e!697274 () Bool)

(assert (=> b!1227553 (= e!697275 e!697274)))

(declare-fun res!815492 () Bool)

(assert (=> b!1227553 (=> (not res!815492) (not e!697274))))

(declare-fun e!697277 () Bool)

(assert (=> b!1227553 (= res!815492 (not e!697277))))

(declare-fun res!815491 () Bool)

(assert (=> b!1227553 (=> (not res!815491) (not e!697277))))

(assert (=> b!1227553 (= res!815491 (validKeyInArray!0 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1227554 () Bool)

(assert (=> b!1227554 (= e!697274 e!697276)))

(assert (=> b!1227554 (= c!120902 (validKeyInArray!0 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1227555 () Bool)

(assert (=> b!1227555 (= e!697277 (contains!7071 Nil!26997 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1227556 () Bool)

(assert (=> b!1227556 (= e!697276 call!60839)))

(assert (= (and d!134445 (not res!815493)) b!1227553))

(assert (= (and b!1227553 res!815491) b!1227555))

(assert (= (and b!1227553 res!815492) b!1227554))

(assert (= (and b!1227554 c!120902) b!1227552))

(assert (= (and b!1227554 (not c!120902)) b!1227556))

(assert (= (or b!1227552 b!1227556) bm!60836))

(declare-fun m!1132951 () Bool)

(assert (=> bm!60836 m!1132951))

(declare-fun m!1132953 () Bool)

(assert (=> bm!60836 m!1132953))

(assert (=> b!1227553 m!1132951))

(assert (=> b!1227553 m!1132951))

(declare-fun m!1132955 () Bool)

(assert (=> b!1227553 m!1132955))

(assert (=> b!1227554 m!1132951))

(assert (=> b!1227554 m!1132951))

(assert (=> b!1227554 m!1132955))

(assert (=> b!1227555 m!1132951))

(assert (=> b!1227555 m!1132951))

(declare-fun m!1132957 () Bool)

(assert (=> b!1227555 m!1132957))

(assert (=> b!1227429 d!134445))

(declare-fun d!134447 () Bool)

(assert (=> d!134447 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1227427 d!134447))

(declare-fun d!134449 () Bool)

(declare-fun lt!559229 () ListLongMap!18165)

(declare-fun contains!7072 (ListLongMap!18165 (_ BitVec 64)) Bool)

(assert (=> d!134449 (not (contains!7072 lt!559229 k0!934))))

(declare-fun removeStrictlySorted!110 (List!26999 (_ BitVec 64)) List!26999)

(assert (=> d!134449 (= lt!559229 (ListLongMap!18166 (removeStrictlySorted!110 (toList!9098 lt!559189) k0!934)))))

(assert (=> d!134449 (= (-!1966 lt!559189 k0!934) lt!559229)))

(declare-fun bs!34482 () Bool)

(assert (= bs!34482 d!134449))

(declare-fun m!1132959 () Bool)

(assert (=> bs!34482 m!1132959))

(declare-fun m!1132961 () Bool)

(assert (=> bs!34482 m!1132961))

(assert (=> b!1227426 d!134449))

(declare-fun d!134451 () Bool)

(declare-fun res!815498 () Bool)

(declare-fun e!697282 () Bool)

(assert (=> d!134451 (=> res!815498 e!697282)))

(assert (=> d!134451 (= res!815498 (= (select (arr!38210 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!134451 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!697282)))

(declare-fun b!1227561 () Bool)

(declare-fun e!697283 () Bool)

(assert (=> b!1227561 (= e!697282 e!697283)))

(declare-fun res!815499 () Bool)

(assert (=> b!1227561 (=> (not res!815499) (not e!697283))))

(assert (=> b!1227561 (= res!815499 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38747 _keys!1208)))))

(declare-fun b!1227562 () Bool)

(assert (=> b!1227562 (= e!697283 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!134451 (not res!815498)) b!1227561))

(assert (= (and b!1227561 res!815499) b!1227562))

(assert (=> d!134451 m!1132951))

(declare-fun m!1132963 () Bool)

(assert (=> b!1227562 m!1132963))

(assert (=> b!1227433 d!134451))

(declare-fun d!134453 () Bool)

(assert (=> d!134453 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!559232 () Unit!40609)

(declare-fun choose!13 (array!79179 (_ BitVec 64) (_ BitVec 32)) Unit!40609)

(assert (=> d!134453 (= lt!559232 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!134453 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!134453 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!559232)))

(declare-fun bs!34483 () Bool)

(assert (= bs!34483 d!134453))

(assert (=> bs!34483 m!1132843))

(declare-fun m!1132965 () Bool)

(assert (=> bs!34483 m!1132965))

(assert (=> b!1227433 d!134453))

(declare-fun b!1227587 () Bool)

(declare-fun e!697301 () Bool)

(assert (=> b!1227587 (= e!697301 (validKeyInArray!0 (select (arr!38210 lt!559187) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1227587 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1227588 () Bool)

(declare-fun e!697303 () Bool)

(declare-fun lt!559252 () ListLongMap!18165)

(declare-fun isEmpty!1006 (ListLongMap!18165) Bool)

(assert (=> b!1227588 (= e!697303 (isEmpty!1006 lt!559252))))

(declare-fun call!60842 () ListLongMap!18165)

(declare-fun bm!60839 () Bool)

(assert (=> bm!60839 (= call!60842 (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1227589 () Bool)

(declare-fun e!697298 () ListLongMap!18165)

(assert (=> b!1227589 (= e!697298 (ListLongMap!18166 Nil!26996))))

(declare-fun b!1227591 () Bool)

(assert (=> b!1227591 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 lt!559187)))))

(assert (=> b!1227591 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38748 lt!559188)))))

(declare-fun e!697299 () Bool)

(declare-fun apply!987 (ListLongMap!18165 (_ BitVec 64)) V!46705)

(declare-fun get!19562 (ValueCell!14882 V!46705) V!46705)

(assert (=> b!1227591 (= e!697299 (= (apply!987 lt!559252 (select (arr!38210 lt!559187) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19562 (select (arr!38211 lt!559188) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1227592 () Bool)

(assert (=> b!1227592 (= e!697303 (= lt!559252 (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1227593 () Bool)

(declare-fun lt!559251 () Unit!40609)

(declare-fun lt!559247 () Unit!40609)

(assert (=> b!1227593 (= lt!559251 lt!559247)))

(declare-fun lt!559248 () ListLongMap!18165)

(declare-fun lt!559249 () (_ BitVec 64))

(declare-fun lt!559253 () V!46705)

(declare-fun lt!559250 () (_ BitVec 64))

(declare-fun +!4188 (ListLongMap!18165 tuple2!20188) ListLongMap!18165)

(assert (=> b!1227593 (not (contains!7072 (+!4188 lt!559248 (tuple2!20189 lt!559249 lt!559253)) lt!559250))))

(declare-fun addStillNotContains!308 (ListLongMap!18165 (_ BitVec 64) V!46705 (_ BitVec 64)) Unit!40609)

(assert (=> b!1227593 (= lt!559247 (addStillNotContains!308 lt!559248 lt!559249 lt!559253 lt!559250))))

(assert (=> b!1227593 (= lt!559250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1227593 (= lt!559253 (get!19562 (select (arr!38211 lt!559188) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1227593 (= lt!559249 (select (arr!38210 lt!559187) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1227593 (= lt!559248 call!60842)))

(declare-fun e!697300 () ListLongMap!18165)

(assert (=> b!1227593 (= e!697300 (+!4188 call!60842 (tuple2!20189 (select (arr!38210 lt!559187) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19562 (select (arr!38211 lt!559188) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1227594 () Bool)

(declare-fun e!697304 () Bool)

(assert (=> b!1227594 (= e!697304 e!697303)))

(declare-fun c!120913 () Bool)

(assert (=> b!1227594 (= c!120913 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 lt!559187)))))

(declare-fun b!1227595 () Bool)

(assert (=> b!1227595 (= e!697298 e!697300)))

(declare-fun c!120911 () Bool)

(assert (=> b!1227595 (= c!120911 (validKeyInArray!0 (select (arr!38210 lt!559187) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1227596 () Bool)

(declare-fun res!815509 () Bool)

(declare-fun e!697302 () Bool)

(assert (=> b!1227596 (=> (not res!815509) (not e!697302))))

(assert (=> b!1227596 (= res!815509 (not (contains!7072 lt!559252 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227590 () Bool)

(assert (=> b!1227590 (= e!697304 e!697299)))

(assert (=> b!1227590 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 lt!559187)))))

(declare-fun res!815510 () Bool)

(assert (=> b!1227590 (= res!815510 (contains!7072 lt!559252 (select (arr!38210 lt!559187) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1227590 (=> (not res!815510) (not e!697299))))

(declare-fun d!134455 () Bool)

(assert (=> d!134455 e!697302))

(declare-fun res!815508 () Bool)

(assert (=> d!134455 (=> (not res!815508) (not e!697302))))

(assert (=> d!134455 (= res!815508 (not (contains!7072 lt!559252 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134455 (= lt!559252 e!697298)))

(declare-fun c!120914 () Bool)

(assert (=> d!134455 (= c!120914 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 lt!559187)))))

(assert (=> d!134455 (validMask!0 mask!1564)))

(assert (=> d!134455 (= (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!559252)))

(declare-fun b!1227597 () Bool)

(assert (=> b!1227597 (= e!697300 call!60842)))

(declare-fun b!1227598 () Bool)

(assert (=> b!1227598 (= e!697302 e!697304)))

(declare-fun c!120912 () Bool)

(assert (=> b!1227598 (= c!120912 e!697301)))

(declare-fun res!815511 () Bool)

(assert (=> b!1227598 (=> (not res!815511) (not e!697301))))

(assert (=> b!1227598 (= res!815511 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 lt!559187)))))

(assert (= (and d!134455 c!120914) b!1227589))

(assert (= (and d!134455 (not c!120914)) b!1227595))

(assert (= (and b!1227595 c!120911) b!1227593))

(assert (= (and b!1227595 (not c!120911)) b!1227597))

(assert (= (or b!1227593 b!1227597) bm!60839))

(assert (= (and d!134455 res!815508) b!1227596))

(assert (= (and b!1227596 res!815509) b!1227598))

(assert (= (and b!1227598 res!815511) b!1227587))

(assert (= (and b!1227598 c!120912) b!1227590))

(assert (= (and b!1227598 (not c!120912)) b!1227594))

(assert (= (and b!1227590 res!815510) b!1227591))

(assert (= (and b!1227594 c!120913) b!1227592))

(assert (= (and b!1227594 (not c!120913)) b!1227588))

(declare-fun b_lambda!22461 () Bool)

(assert (=> (not b_lambda!22461) (not b!1227591)))

(assert (=> b!1227591 t!40449))

(declare-fun b_and!44233 () Bool)

(assert (= b_and!44223 (and (=> t!40449 result!23163) b_and!44233)))

(declare-fun b_lambda!22463 () Bool)

(assert (=> (not b_lambda!22463) (not b!1227593)))

(assert (=> b!1227593 t!40449))

(declare-fun b_and!44235 () Bool)

(assert (= b_and!44233 (and (=> t!40449 result!23163) b_and!44235)))

(declare-fun m!1132967 () Bool)

(assert (=> b!1227590 m!1132967))

(assert (=> b!1227590 m!1132967))

(declare-fun m!1132969 () Bool)

(assert (=> b!1227590 m!1132969))

(declare-fun m!1132971 () Bool)

(assert (=> bm!60839 m!1132971))

(declare-fun m!1132973 () Bool)

(assert (=> d!134455 m!1132973))

(assert (=> d!134455 m!1132841))

(assert (=> b!1227595 m!1132967))

(assert (=> b!1227595 m!1132967))

(declare-fun m!1132975 () Bool)

(assert (=> b!1227595 m!1132975))

(declare-fun m!1132977 () Bool)

(assert (=> b!1227591 m!1132977))

(assert (=> b!1227591 m!1132835))

(declare-fun m!1132979 () Bool)

(assert (=> b!1227591 m!1132979))

(assert (=> b!1227591 m!1132835))

(assert (=> b!1227591 m!1132967))

(declare-fun m!1132981 () Bool)

(assert (=> b!1227591 m!1132981))

(assert (=> b!1227591 m!1132967))

(assert (=> b!1227591 m!1132977))

(declare-fun m!1132983 () Bool)

(assert (=> b!1227593 m!1132983))

(declare-fun m!1132985 () Bool)

(assert (=> b!1227593 m!1132985))

(assert (=> b!1227593 m!1132977))

(assert (=> b!1227593 m!1132835))

(assert (=> b!1227593 m!1132979))

(assert (=> b!1227593 m!1132835))

(declare-fun m!1132987 () Bool)

(assert (=> b!1227593 m!1132987))

(assert (=> b!1227593 m!1132983))

(assert (=> b!1227593 m!1132977))

(declare-fun m!1132989 () Bool)

(assert (=> b!1227593 m!1132989))

(assert (=> b!1227593 m!1132967))

(assert (=> b!1227592 m!1132971))

(declare-fun m!1132991 () Bool)

(assert (=> b!1227588 m!1132991))

(declare-fun m!1132993 () Bool)

(assert (=> b!1227596 m!1132993))

(assert (=> b!1227587 m!1132967))

(assert (=> b!1227587 m!1132967))

(assert (=> b!1227587 m!1132975))

(assert (=> b!1227431 d!134455))

(declare-fun d!134457 () Bool)

(assert (=> d!134457 (= (validKeyInArray!0 (select (arr!38210 _keys!1208) from!1455)) (and (not (= (select (arr!38210 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38210 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1227431 d!134457))

(declare-fun bm!60844 () Bool)

(declare-fun call!60847 () ListLongMap!18165)

(assert (=> bm!60844 (= call!60847 (getCurrentListMapNoExtraKeys!5545 (array!79180 (store (arr!38210 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38747 _keys!1208)) (array!79182 (store (arr!38211 _values!996) i!673 (ValueCellFull!14882 (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38748 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!60848 () ListLongMap!18165)

(declare-fun bm!60845 () Bool)

(assert (=> bm!60845 (= call!60848 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!134459 () Bool)

(declare-fun e!697309 () Bool)

(assert (=> d!134459 e!697309))

(declare-fun res!815514 () Bool)

(assert (=> d!134459 (=> (not res!815514) (not e!697309))))

(assert (=> d!134459 (= res!815514 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38747 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38747 _keys!1208))))))))

(declare-fun lt!559256 () Unit!40609)

(declare-fun choose!1834 (array!79179 array!79181 (_ BitVec 32) (_ BitVec 32) V!46705 V!46705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40609)

(assert (=> d!134459 (= lt!559256 (choose!1834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!134459 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 _keys!1208)))))

(assert (=> d!134459 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1181 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!559256)))

(declare-fun b!1227605 () Bool)

(declare-fun e!697310 () Bool)

(assert (=> b!1227605 (= e!697310 (= call!60847 call!60848))))

(assert (=> b!1227605 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38748 _values!996)))))

(declare-fun b!1227606 () Bool)

(assert (=> b!1227606 (= e!697310 (= call!60847 (-!1966 call!60848 k0!934)))))

(assert (=> b!1227606 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38748 _values!996)))))

(declare-fun b!1227607 () Bool)

(assert (=> b!1227607 (= e!697309 e!697310)))

(declare-fun c!120917 () Bool)

(assert (=> b!1227607 (= c!120917 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(assert (= (and d!134459 res!815514) b!1227607))

(assert (= (and b!1227607 c!120917) b!1227606))

(assert (= (and b!1227607 (not c!120917)) b!1227605))

(assert (= (or b!1227606 b!1227605) bm!60845))

(assert (= (or b!1227606 b!1227605) bm!60844))

(declare-fun b_lambda!22465 () Bool)

(assert (=> (not b_lambda!22465) (not bm!60844)))

(assert (=> bm!60844 t!40449))

(declare-fun b_and!44237 () Bool)

(assert (= b_and!44235 (and (=> t!40449 result!23163) b_and!44237)))

(assert (=> bm!60844 m!1132807))

(assert (=> bm!60844 m!1132835))

(assert (=> bm!60844 m!1132837))

(declare-fun m!1132995 () Bool)

(assert (=> bm!60844 m!1132995))

(assert (=> bm!60845 m!1132811))

(declare-fun m!1132997 () Bool)

(assert (=> d!134459 m!1132997))

(declare-fun m!1132999 () Bool)

(assert (=> b!1227606 m!1132999))

(assert (=> b!1227431 d!134459))

(declare-fun b!1227608 () Bool)

(declare-fun e!697314 () Bool)

(assert (=> b!1227608 (= e!697314 (validKeyInArray!0 (select (arr!38210 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1227608 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1227609 () Bool)

(declare-fun e!697316 () Bool)

(declare-fun lt!559262 () ListLongMap!18165)

(assert (=> b!1227609 (= e!697316 (isEmpty!1006 lt!559262))))

(declare-fun call!60849 () ListLongMap!18165)

(declare-fun bm!60846 () Bool)

(assert (=> bm!60846 (= call!60849 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1227610 () Bool)

(declare-fun e!697311 () ListLongMap!18165)

(assert (=> b!1227610 (= e!697311 (ListLongMap!18166 Nil!26996))))

(declare-fun b!1227612 () Bool)

(assert (=> b!1227612 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 _keys!1208)))))

(assert (=> b!1227612 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38748 _values!996)))))

(declare-fun e!697312 () Bool)

(assert (=> b!1227612 (= e!697312 (= (apply!987 lt!559262 (select (arr!38210 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19562 (select (arr!38211 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1227613 () Bool)

(assert (=> b!1227613 (= e!697316 (= lt!559262 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1227614 () Bool)

(declare-fun lt!559261 () Unit!40609)

(declare-fun lt!559257 () Unit!40609)

(assert (=> b!1227614 (= lt!559261 lt!559257)))

(declare-fun lt!559263 () V!46705)

(declare-fun lt!559258 () ListLongMap!18165)

(declare-fun lt!559260 () (_ BitVec 64))

(declare-fun lt!559259 () (_ BitVec 64))

(assert (=> b!1227614 (not (contains!7072 (+!4188 lt!559258 (tuple2!20189 lt!559259 lt!559263)) lt!559260))))

(assert (=> b!1227614 (= lt!559257 (addStillNotContains!308 lt!559258 lt!559259 lt!559263 lt!559260))))

(assert (=> b!1227614 (= lt!559260 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1227614 (= lt!559263 (get!19562 (select (arr!38211 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1227614 (= lt!559259 (select (arr!38210 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1227614 (= lt!559258 call!60849)))

(declare-fun e!697313 () ListLongMap!18165)

(assert (=> b!1227614 (= e!697313 (+!4188 call!60849 (tuple2!20189 (select (arr!38210 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19562 (select (arr!38211 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1227615 () Bool)

(declare-fun e!697317 () Bool)

(assert (=> b!1227615 (= e!697317 e!697316)))

(declare-fun c!120920 () Bool)

(assert (=> b!1227615 (= c!120920 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 _keys!1208)))))

(declare-fun b!1227616 () Bool)

(assert (=> b!1227616 (= e!697311 e!697313)))

(declare-fun c!120918 () Bool)

(assert (=> b!1227616 (= c!120918 (validKeyInArray!0 (select (arr!38210 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1227617 () Bool)

(declare-fun res!815516 () Bool)

(declare-fun e!697315 () Bool)

(assert (=> b!1227617 (=> (not res!815516) (not e!697315))))

(assert (=> b!1227617 (= res!815516 (not (contains!7072 lt!559262 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227611 () Bool)

(assert (=> b!1227611 (= e!697317 e!697312)))

(assert (=> b!1227611 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 _keys!1208)))))

(declare-fun res!815517 () Bool)

(assert (=> b!1227611 (= res!815517 (contains!7072 lt!559262 (select (arr!38210 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1227611 (=> (not res!815517) (not e!697312))))

(declare-fun d!134461 () Bool)

(assert (=> d!134461 e!697315))

(declare-fun res!815515 () Bool)

(assert (=> d!134461 (=> (not res!815515) (not e!697315))))

(assert (=> d!134461 (= res!815515 (not (contains!7072 lt!559262 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134461 (= lt!559262 e!697311)))

(declare-fun c!120921 () Bool)

(assert (=> d!134461 (= c!120921 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 _keys!1208)))))

(assert (=> d!134461 (validMask!0 mask!1564)))

(assert (=> d!134461 (= (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!559262)))

(declare-fun b!1227618 () Bool)

(assert (=> b!1227618 (= e!697313 call!60849)))

(declare-fun b!1227619 () Bool)

(assert (=> b!1227619 (= e!697315 e!697317)))

(declare-fun c!120919 () Bool)

(assert (=> b!1227619 (= c!120919 e!697314)))

(declare-fun res!815518 () Bool)

(assert (=> b!1227619 (=> (not res!815518) (not e!697314))))

(assert (=> b!1227619 (= res!815518 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38747 _keys!1208)))))

(assert (= (and d!134461 c!120921) b!1227610))

(assert (= (and d!134461 (not c!120921)) b!1227616))

(assert (= (and b!1227616 c!120918) b!1227614))

(assert (= (and b!1227616 (not c!120918)) b!1227618))

(assert (= (or b!1227614 b!1227618) bm!60846))

(assert (= (and d!134461 res!815515) b!1227617))

(assert (= (and b!1227617 res!815516) b!1227619))

(assert (= (and b!1227619 res!815518) b!1227608))

(assert (= (and b!1227619 c!120919) b!1227611))

(assert (= (and b!1227619 (not c!120919)) b!1227615))

(assert (= (and b!1227611 res!815517) b!1227612))

(assert (= (and b!1227615 c!120920) b!1227613))

(assert (= (and b!1227615 (not c!120920)) b!1227609))

(declare-fun b_lambda!22467 () Bool)

(assert (=> (not b_lambda!22467) (not b!1227612)))

(assert (=> b!1227612 t!40449))

(declare-fun b_and!44239 () Bool)

(assert (= b_and!44237 (and (=> t!40449 result!23163) b_and!44239)))

(declare-fun b_lambda!22469 () Bool)

(assert (=> (not b_lambda!22469) (not b!1227614)))

(assert (=> b!1227614 t!40449))

(declare-fun b_and!44241 () Bool)

(assert (= b_and!44239 (and (=> t!40449 result!23163) b_and!44241)))

(declare-fun m!1133001 () Bool)

(assert (=> b!1227611 m!1133001))

(assert (=> b!1227611 m!1133001))

(declare-fun m!1133003 () Bool)

(assert (=> b!1227611 m!1133003))

(declare-fun m!1133005 () Bool)

(assert (=> bm!60846 m!1133005))

(declare-fun m!1133007 () Bool)

(assert (=> d!134461 m!1133007))

(assert (=> d!134461 m!1132841))

(assert (=> b!1227616 m!1133001))

(assert (=> b!1227616 m!1133001))

(declare-fun m!1133009 () Bool)

(assert (=> b!1227616 m!1133009))

(declare-fun m!1133011 () Bool)

(assert (=> b!1227612 m!1133011))

(assert (=> b!1227612 m!1132835))

(declare-fun m!1133013 () Bool)

(assert (=> b!1227612 m!1133013))

(assert (=> b!1227612 m!1132835))

(assert (=> b!1227612 m!1133001))

(declare-fun m!1133015 () Bool)

(assert (=> b!1227612 m!1133015))

(assert (=> b!1227612 m!1133001))

(assert (=> b!1227612 m!1133011))

(declare-fun m!1133017 () Bool)

(assert (=> b!1227614 m!1133017))

(declare-fun m!1133019 () Bool)

(assert (=> b!1227614 m!1133019))

(assert (=> b!1227614 m!1133011))

(assert (=> b!1227614 m!1132835))

(assert (=> b!1227614 m!1133013))

(assert (=> b!1227614 m!1132835))

(declare-fun m!1133021 () Bool)

(assert (=> b!1227614 m!1133021))

(assert (=> b!1227614 m!1133017))

(assert (=> b!1227614 m!1133011))

(declare-fun m!1133023 () Bool)

(assert (=> b!1227614 m!1133023))

(assert (=> b!1227614 m!1133001))

(assert (=> b!1227613 m!1133005))

(declare-fun m!1133025 () Bool)

(assert (=> b!1227609 m!1133025))

(declare-fun m!1133027 () Bool)

(assert (=> b!1227617 m!1133027))

(assert (=> b!1227608 m!1133001))

(assert (=> b!1227608 m!1133001))

(assert (=> b!1227608 m!1133009))

(assert (=> b!1227431 d!134461))

(declare-fun d!134463 () Bool)

(declare-fun lt!559264 () ListLongMap!18165)

(assert (=> d!134463 (not (contains!7072 lt!559264 k0!934))))

(assert (=> d!134463 (= lt!559264 (ListLongMap!18166 (removeStrictlySorted!110 (toList!9098 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934)))))

(assert (=> d!134463 (= (-!1966 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934) lt!559264)))

(declare-fun bs!34484 () Bool)

(assert (= bs!34484 d!134463))

(declare-fun m!1133029 () Bool)

(assert (=> bs!34484 m!1133029))

(declare-fun m!1133031 () Bool)

(assert (=> bs!34484 m!1133031))

(assert (=> b!1227431 d!134463))

(declare-fun b!1227628 () Bool)

(declare-fun e!697324 () Bool)

(declare-fun call!60852 () Bool)

(assert (=> b!1227628 (= e!697324 call!60852)))

(declare-fun b!1227629 () Bool)

(declare-fun e!697326 () Bool)

(assert (=> b!1227629 (= e!697326 e!697324)))

(declare-fun c!120924 () Bool)

(assert (=> b!1227629 (= c!120924 (validKeyInArray!0 (select (arr!38210 lt!559187) #b00000000000000000000000000000000)))))

(declare-fun b!1227630 () Bool)

(declare-fun e!697325 () Bool)

(assert (=> b!1227630 (= e!697325 call!60852)))

(declare-fun bm!60849 () Bool)

(assert (=> bm!60849 (= call!60852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!559187 mask!1564))))

(declare-fun b!1227631 () Bool)

(assert (=> b!1227631 (= e!697324 e!697325)))

(declare-fun lt!559273 () (_ BitVec 64))

(assert (=> b!1227631 (= lt!559273 (select (arr!38210 lt!559187) #b00000000000000000000000000000000))))

(declare-fun lt!559272 () Unit!40609)

(assert (=> b!1227631 (= lt!559272 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!559187 lt!559273 #b00000000000000000000000000000000))))

(assert (=> b!1227631 (arrayContainsKey!0 lt!559187 lt!559273 #b00000000000000000000000000000000)))

(declare-fun lt!559271 () Unit!40609)

(assert (=> b!1227631 (= lt!559271 lt!559272)))

(declare-fun res!815523 () Bool)

(declare-datatypes ((SeekEntryResult!9907 0))(
  ( (MissingZero!9907 (index!41999 (_ BitVec 32))) (Found!9907 (index!42000 (_ BitVec 32))) (Intermediate!9907 (undefined!10719 Bool) (index!42001 (_ BitVec 32)) (x!107922 (_ BitVec 32))) (Undefined!9907) (MissingVacant!9907 (index!42002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!79179 (_ BitVec 32)) SeekEntryResult!9907)

(assert (=> b!1227631 (= res!815523 (= (seekEntryOrOpen!0 (select (arr!38210 lt!559187) #b00000000000000000000000000000000) lt!559187 mask!1564) (Found!9907 #b00000000000000000000000000000000)))))

(assert (=> b!1227631 (=> (not res!815523) (not e!697325))))

(declare-fun d!134465 () Bool)

(declare-fun res!815524 () Bool)

(assert (=> d!134465 (=> res!815524 e!697326)))

(assert (=> d!134465 (= res!815524 (bvsge #b00000000000000000000000000000000 (size!38747 lt!559187)))))

(assert (=> d!134465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!559187 mask!1564) e!697326)))

(assert (= (and d!134465 (not res!815524)) b!1227629))

(assert (= (and b!1227629 c!120924) b!1227631))

(assert (= (and b!1227629 (not c!120924)) b!1227628))

(assert (= (and b!1227631 res!815523) b!1227630))

(assert (= (or b!1227630 b!1227628) bm!60849))

(assert (=> b!1227629 m!1132943))

(assert (=> b!1227629 m!1132943))

(assert (=> b!1227629 m!1132947))

(declare-fun m!1133033 () Bool)

(assert (=> bm!60849 m!1133033))

(assert (=> b!1227631 m!1132943))

(declare-fun m!1133035 () Bool)

(assert (=> b!1227631 m!1133035))

(declare-fun m!1133037 () Bool)

(assert (=> b!1227631 m!1133037))

(assert (=> b!1227631 m!1132943))

(declare-fun m!1133039 () Bool)

(assert (=> b!1227631 m!1133039))

(assert (=> b!1227432 d!134465))

(declare-fun d!134467 () Bool)

(assert (=> d!134467 (= (array_inv!29152 _keys!1208) (bvsge (size!38747 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!102026 d!134467))

(declare-fun d!134469 () Bool)

(assert (=> d!134469 (= (array_inv!29153 _values!996) (bvsge (size!38748 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!102026 d!134469))

(declare-fun d!134471 () Bool)

(assert (=> d!134471 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1227420 d!134471))

(declare-fun b!1227632 () Bool)

(declare-fun e!697327 () Bool)

(declare-fun call!60853 () Bool)

(assert (=> b!1227632 (= e!697327 call!60853)))

(declare-fun b!1227633 () Bool)

(declare-fun e!697329 () Bool)

(assert (=> b!1227633 (= e!697329 e!697327)))

(declare-fun c!120925 () Bool)

(assert (=> b!1227633 (= c!120925 (validKeyInArray!0 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1227634 () Bool)

(declare-fun e!697328 () Bool)

(assert (=> b!1227634 (= e!697328 call!60853)))

(declare-fun bm!60850 () Bool)

(assert (=> bm!60850 (= call!60853 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1227635 () Bool)

(assert (=> b!1227635 (= e!697327 e!697328)))

(declare-fun lt!559276 () (_ BitVec 64))

(assert (=> b!1227635 (= lt!559276 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!559275 () Unit!40609)

(assert (=> b!1227635 (= lt!559275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!559276 #b00000000000000000000000000000000))))

(assert (=> b!1227635 (arrayContainsKey!0 _keys!1208 lt!559276 #b00000000000000000000000000000000)))

(declare-fun lt!559274 () Unit!40609)

(assert (=> b!1227635 (= lt!559274 lt!559275)))

(declare-fun res!815525 () Bool)

(assert (=> b!1227635 (= res!815525 (= (seekEntryOrOpen!0 (select (arr!38210 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9907 #b00000000000000000000000000000000)))))

(assert (=> b!1227635 (=> (not res!815525) (not e!697328))))

(declare-fun d!134473 () Bool)

(declare-fun res!815526 () Bool)

(assert (=> d!134473 (=> res!815526 e!697329)))

(assert (=> d!134473 (= res!815526 (bvsge #b00000000000000000000000000000000 (size!38747 _keys!1208)))))

(assert (=> d!134473 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!697329)))

(assert (= (and d!134473 (not res!815526)) b!1227633))

(assert (= (and b!1227633 c!120925) b!1227635))

(assert (= (and b!1227633 (not c!120925)) b!1227632))

(assert (= (and b!1227635 res!815525) b!1227634))

(assert (= (or b!1227634 b!1227632) bm!60850))

(assert (=> b!1227633 m!1132951))

(assert (=> b!1227633 m!1132951))

(assert (=> b!1227633 m!1132955))

(declare-fun m!1133041 () Bool)

(assert (=> bm!60850 m!1133041))

(assert (=> b!1227635 m!1132951))

(declare-fun m!1133043 () Bool)

(assert (=> b!1227635 m!1133043))

(declare-fun m!1133045 () Bool)

(assert (=> b!1227635 m!1133045))

(assert (=> b!1227635 m!1132951))

(declare-fun m!1133047 () Bool)

(assert (=> b!1227635 m!1133047))

(assert (=> b!1227421 d!134473))

(declare-fun b!1227636 () Bool)

(declare-fun e!697333 () Bool)

(assert (=> b!1227636 (= e!697333 (validKeyInArray!0 (select (arr!38210 lt!559187) from!1455)))))

(assert (=> b!1227636 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1227637 () Bool)

(declare-fun e!697335 () Bool)

(declare-fun lt!559282 () ListLongMap!18165)

(assert (=> b!1227637 (= e!697335 (isEmpty!1006 lt!559282))))

(declare-fun call!60854 () ListLongMap!18165)

(declare-fun bm!60851 () Bool)

(assert (=> bm!60851 (= call!60854 (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1227638 () Bool)

(declare-fun e!697330 () ListLongMap!18165)

(assert (=> b!1227638 (= e!697330 (ListLongMap!18166 Nil!26996))))

(declare-fun b!1227640 () Bool)

(assert (=> b!1227640 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38747 lt!559187)))))

(assert (=> b!1227640 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38748 lt!559188)))))

(declare-fun e!697331 () Bool)

(assert (=> b!1227640 (= e!697331 (= (apply!987 lt!559282 (select (arr!38210 lt!559187) from!1455)) (get!19562 (select (arr!38211 lt!559188) from!1455) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1227641 () Bool)

(assert (=> b!1227641 (= e!697335 (= lt!559282 (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1227642 () Bool)

(declare-fun lt!559281 () Unit!40609)

(declare-fun lt!559277 () Unit!40609)

(assert (=> b!1227642 (= lt!559281 lt!559277)))

(declare-fun lt!559283 () V!46705)

(declare-fun lt!559278 () ListLongMap!18165)

(declare-fun lt!559279 () (_ BitVec 64))

(declare-fun lt!559280 () (_ BitVec 64))

(assert (=> b!1227642 (not (contains!7072 (+!4188 lt!559278 (tuple2!20189 lt!559279 lt!559283)) lt!559280))))

(assert (=> b!1227642 (= lt!559277 (addStillNotContains!308 lt!559278 lt!559279 lt!559283 lt!559280))))

(assert (=> b!1227642 (= lt!559280 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1227642 (= lt!559283 (get!19562 (select (arr!38211 lt!559188) from!1455) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1227642 (= lt!559279 (select (arr!38210 lt!559187) from!1455))))

(assert (=> b!1227642 (= lt!559278 call!60854)))

(declare-fun e!697332 () ListLongMap!18165)

(assert (=> b!1227642 (= e!697332 (+!4188 call!60854 (tuple2!20189 (select (arr!38210 lt!559187) from!1455) (get!19562 (select (arr!38211 lt!559188) from!1455) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1227643 () Bool)

(declare-fun e!697336 () Bool)

(assert (=> b!1227643 (= e!697336 e!697335)))

(declare-fun c!120928 () Bool)

(assert (=> b!1227643 (= c!120928 (bvslt from!1455 (size!38747 lt!559187)))))

(declare-fun b!1227644 () Bool)

(assert (=> b!1227644 (= e!697330 e!697332)))

(declare-fun c!120926 () Bool)

(assert (=> b!1227644 (= c!120926 (validKeyInArray!0 (select (arr!38210 lt!559187) from!1455)))))

(declare-fun b!1227645 () Bool)

(declare-fun res!815528 () Bool)

(declare-fun e!697334 () Bool)

(assert (=> b!1227645 (=> (not res!815528) (not e!697334))))

(assert (=> b!1227645 (= res!815528 (not (contains!7072 lt!559282 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227639 () Bool)

(assert (=> b!1227639 (= e!697336 e!697331)))

(assert (=> b!1227639 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38747 lt!559187)))))

(declare-fun res!815529 () Bool)

(assert (=> b!1227639 (= res!815529 (contains!7072 lt!559282 (select (arr!38210 lt!559187) from!1455)))))

(assert (=> b!1227639 (=> (not res!815529) (not e!697331))))

(declare-fun d!134475 () Bool)

(assert (=> d!134475 e!697334))

(declare-fun res!815527 () Bool)

(assert (=> d!134475 (=> (not res!815527) (not e!697334))))

(assert (=> d!134475 (= res!815527 (not (contains!7072 lt!559282 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134475 (= lt!559282 e!697330)))

(declare-fun c!120929 () Bool)

(assert (=> d!134475 (= c!120929 (bvsge from!1455 (size!38747 lt!559187)))))

(assert (=> d!134475 (validMask!0 mask!1564)))

(assert (=> d!134475 (= (getCurrentListMapNoExtraKeys!5545 lt!559187 lt!559188 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!559282)))

(declare-fun b!1227646 () Bool)

(assert (=> b!1227646 (= e!697332 call!60854)))

(declare-fun b!1227647 () Bool)

(assert (=> b!1227647 (= e!697334 e!697336)))

(declare-fun c!120927 () Bool)

(assert (=> b!1227647 (= c!120927 e!697333)))

(declare-fun res!815530 () Bool)

(assert (=> b!1227647 (=> (not res!815530) (not e!697333))))

(assert (=> b!1227647 (= res!815530 (bvslt from!1455 (size!38747 lt!559187)))))

(assert (= (and d!134475 c!120929) b!1227638))

(assert (= (and d!134475 (not c!120929)) b!1227644))

(assert (= (and b!1227644 c!120926) b!1227642))

(assert (= (and b!1227644 (not c!120926)) b!1227646))

(assert (= (or b!1227642 b!1227646) bm!60851))

(assert (= (and d!134475 res!815527) b!1227645))

(assert (= (and b!1227645 res!815528) b!1227647))

(assert (= (and b!1227647 res!815530) b!1227636))

(assert (= (and b!1227647 c!120927) b!1227639))

(assert (= (and b!1227647 (not c!120927)) b!1227643))

(assert (= (and b!1227639 res!815529) b!1227640))

(assert (= (and b!1227643 c!120928) b!1227641))

(assert (= (and b!1227643 (not c!120928)) b!1227637))

(declare-fun b_lambda!22471 () Bool)

(assert (=> (not b_lambda!22471) (not b!1227640)))

(assert (=> b!1227640 t!40449))

(declare-fun b_and!44243 () Bool)

(assert (= b_and!44241 (and (=> t!40449 result!23163) b_and!44243)))

(declare-fun b_lambda!22473 () Bool)

(assert (=> (not b_lambda!22473) (not b!1227642)))

(assert (=> b!1227642 t!40449))

(declare-fun b_and!44245 () Bool)

(assert (= b_and!44243 (and (=> t!40449 result!23163) b_and!44245)))

(declare-fun m!1133049 () Bool)

(assert (=> b!1227639 m!1133049))

(assert (=> b!1227639 m!1133049))

(declare-fun m!1133051 () Bool)

(assert (=> b!1227639 m!1133051))

(declare-fun m!1133053 () Bool)

(assert (=> bm!60851 m!1133053))

(declare-fun m!1133055 () Bool)

(assert (=> d!134475 m!1133055))

(assert (=> d!134475 m!1132841))

(assert (=> b!1227644 m!1133049))

(assert (=> b!1227644 m!1133049))

(declare-fun m!1133057 () Bool)

(assert (=> b!1227644 m!1133057))

(declare-fun m!1133059 () Bool)

(assert (=> b!1227640 m!1133059))

(assert (=> b!1227640 m!1132835))

(declare-fun m!1133061 () Bool)

(assert (=> b!1227640 m!1133061))

(assert (=> b!1227640 m!1132835))

(assert (=> b!1227640 m!1133049))

(declare-fun m!1133063 () Bool)

(assert (=> b!1227640 m!1133063))

(assert (=> b!1227640 m!1133049))

(assert (=> b!1227640 m!1133059))

(declare-fun m!1133065 () Bool)

(assert (=> b!1227642 m!1133065))

(declare-fun m!1133067 () Bool)

(assert (=> b!1227642 m!1133067))

(assert (=> b!1227642 m!1133059))

(assert (=> b!1227642 m!1132835))

(assert (=> b!1227642 m!1133061))

(assert (=> b!1227642 m!1132835))

(declare-fun m!1133069 () Bool)

(assert (=> b!1227642 m!1133069))

(assert (=> b!1227642 m!1133065))

(assert (=> b!1227642 m!1133059))

(declare-fun m!1133071 () Bool)

(assert (=> b!1227642 m!1133071))

(assert (=> b!1227642 m!1133049))

(assert (=> b!1227641 m!1133053))

(declare-fun m!1133073 () Bool)

(assert (=> b!1227637 m!1133073))

(declare-fun m!1133075 () Bool)

(assert (=> b!1227645 m!1133075))

(assert (=> b!1227636 m!1133049))

(assert (=> b!1227636 m!1133049))

(assert (=> b!1227636 m!1133057))

(assert (=> b!1227419 d!134475))

(declare-fun b!1227648 () Bool)

(declare-fun e!697340 () Bool)

(assert (=> b!1227648 (= e!697340 (validKeyInArray!0 (select (arr!38210 _keys!1208) from!1455)))))

(assert (=> b!1227648 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1227649 () Bool)

(declare-fun e!697342 () Bool)

(declare-fun lt!559289 () ListLongMap!18165)

(assert (=> b!1227649 (= e!697342 (isEmpty!1006 lt!559289))))

(declare-fun bm!60852 () Bool)

(declare-fun call!60855 () ListLongMap!18165)

(assert (=> bm!60852 (= call!60855 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1227650 () Bool)

(declare-fun e!697337 () ListLongMap!18165)

(assert (=> b!1227650 (= e!697337 (ListLongMap!18166 Nil!26996))))

(declare-fun b!1227652 () Bool)

(assert (=> b!1227652 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38747 _keys!1208)))))

(assert (=> b!1227652 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38748 _values!996)))))

(declare-fun e!697338 () Bool)

(assert (=> b!1227652 (= e!697338 (= (apply!987 lt!559289 (select (arr!38210 _keys!1208) from!1455)) (get!19562 (select (arr!38211 _values!996) from!1455) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1227653 () Bool)

(assert (=> b!1227653 (= e!697342 (= lt!559289 (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1227654 () Bool)

(declare-fun lt!559288 () Unit!40609)

(declare-fun lt!559284 () Unit!40609)

(assert (=> b!1227654 (= lt!559288 lt!559284)))

(declare-fun lt!559285 () ListLongMap!18165)

(declare-fun lt!559290 () V!46705)

(declare-fun lt!559286 () (_ BitVec 64))

(declare-fun lt!559287 () (_ BitVec 64))

(assert (=> b!1227654 (not (contains!7072 (+!4188 lt!559285 (tuple2!20189 lt!559286 lt!559290)) lt!559287))))

(assert (=> b!1227654 (= lt!559284 (addStillNotContains!308 lt!559285 lt!559286 lt!559290 lt!559287))))

(assert (=> b!1227654 (= lt!559287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1227654 (= lt!559290 (get!19562 (select (arr!38211 _values!996) from!1455) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1227654 (= lt!559286 (select (arr!38210 _keys!1208) from!1455))))

(assert (=> b!1227654 (= lt!559285 call!60855)))

(declare-fun e!697339 () ListLongMap!18165)

(assert (=> b!1227654 (= e!697339 (+!4188 call!60855 (tuple2!20189 (select (arr!38210 _keys!1208) from!1455) (get!19562 (select (arr!38211 _values!996) from!1455) (dynLambda!3439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1227655 () Bool)

(declare-fun e!697343 () Bool)

(assert (=> b!1227655 (= e!697343 e!697342)))

(declare-fun c!120932 () Bool)

(assert (=> b!1227655 (= c!120932 (bvslt from!1455 (size!38747 _keys!1208)))))

(declare-fun b!1227656 () Bool)

(assert (=> b!1227656 (= e!697337 e!697339)))

(declare-fun c!120930 () Bool)

(assert (=> b!1227656 (= c!120930 (validKeyInArray!0 (select (arr!38210 _keys!1208) from!1455)))))

(declare-fun b!1227657 () Bool)

(declare-fun res!815532 () Bool)

(declare-fun e!697341 () Bool)

(assert (=> b!1227657 (=> (not res!815532) (not e!697341))))

(assert (=> b!1227657 (= res!815532 (not (contains!7072 lt!559289 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227651 () Bool)

(assert (=> b!1227651 (= e!697343 e!697338)))

(assert (=> b!1227651 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38747 _keys!1208)))))

(declare-fun res!815533 () Bool)

(assert (=> b!1227651 (= res!815533 (contains!7072 lt!559289 (select (arr!38210 _keys!1208) from!1455)))))

(assert (=> b!1227651 (=> (not res!815533) (not e!697338))))

(declare-fun d!134477 () Bool)

(assert (=> d!134477 e!697341))

(declare-fun res!815531 () Bool)

(assert (=> d!134477 (=> (not res!815531) (not e!697341))))

(assert (=> d!134477 (= res!815531 (not (contains!7072 lt!559289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!134477 (= lt!559289 e!697337)))

(declare-fun c!120933 () Bool)

(assert (=> d!134477 (= c!120933 (bvsge from!1455 (size!38747 _keys!1208)))))

(assert (=> d!134477 (validMask!0 mask!1564)))

(assert (=> d!134477 (= (getCurrentListMapNoExtraKeys!5545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!559289)))

(declare-fun b!1227658 () Bool)

(assert (=> b!1227658 (= e!697339 call!60855)))

(declare-fun b!1227659 () Bool)

(assert (=> b!1227659 (= e!697341 e!697343)))

(declare-fun c!120931 () Bool)

(assert (=> b!1227659 (= c!120931 e!697340)))

(declare-fun res!815534 () Bool)

(assert (=> b!1227659 (=> (not res!815534) (not e!697340))))

(assert (=> b!1227659 (= res!815534 (bvslt from!1455 (size!38747 _keys!1208)))))

(assert (= (and d!134477 c!120933) b!1227650))

(assert (= (and d!134477 (not c!120933)) b!1227656))

(assert (= (and b!1227656 c!120930) b!1227654))

(assert (= (and b!1227656 (not c!120930)) b!1227658))

(assert (= (or b!1227654 b!1227658) bm!60852))

(assert (= (and d!134477 res!815531) b!1227657))

(assert (= (and b!1227657 res!815532) b!1227659))

(assert (= (and b!1227659 res!815534) b!1227648))

(assert (= (and b!1227659 c!120931) b!1227651))

(assert (= (and b!1227659 (not c!120931)) b!1227655))

(assert (= (and b!1227651 res!815533) b!1227652))

(assert (= (and b!1227655 c!120932) b!1227653))

(assert (= (and b!1227655 (not c!120932)) b!1227649))

(declare-fun b_lambda!22475 () Bool)

(assert (=> (not b_lambda!22475) (not b!1227652)))

(assert (=> b!1227652 t!40449))

(declare-fun b_and!44247 () Bool)

(assert (= b_and!44245 (and (=> t!40449 result!23163) b_and!44247)))

(declare-fun b_lambda!22477 () Bool)

(assert (=> (not b_lambda!22477) (not b!1227654)))

(assert (=> b!1227654 t!40449))

(declare-fun b_and!44249 () Bool)

(assert (= b_and!44247 (and (=> t!40449 result!23163) b_and!44249)))

(assert (=> b!1227651 m!1132819))

(assert (=> b!1227651 m!1132819))

(declare-fun m!1133077 () Bool)

(assert (=> b!1227651 m!1133077))

(declare-fun m!1133079 () Bool)

(assert (=> bm!60852 m!1133079))

(declare-fun m!1133081 () Bool)

(assert (=> d!134477 m!1133081))

(assert (=> d!134477 m!1132841))

(assert (=> b!1227656 m!1132819))

(assert (=> b!1227656 m!1132819))

(assert (=> b!1227656 m!1132821))

(declare-fun m!1133083 () Bool)

(assert (=> b!1227652 m!1133083))

(assert (=> b!1227652 m!1132835))

(declare-fun m!1133085 () Bool)

(assert (=> b!1227652 m!1133085))

(assert (=> b!1227652 m!1132835))

(assert (=> b!1227652 m!1132819))

(declare-fun m!1133087 () Bool)

(assert (=> b!1227652 m!1133087))

(assert (=> b!1227652 m!1132819))

(assert (=> b!1227652 m!1133083))

(declare-fun m!1133089 () Bool)

(assert (=> b!1227654 m!1133089))

(declare-fun m!1133091 () Bool)

(assert (=> b!1227654 m!1133091))

(assert (=> b!1227654 m!1133083))

(assert (=> b!1227654 m!1132835))

(assert (=> b!1227654 m!1133085))

(assert (=> b!1227654 m!1132835))

(declare-fun m!1133093 () Bool)

(assert (=> b!1227654 m!1133093))

(assert (=> b!1227654 m!1133089))

(assert (=> b!1227654 m!1133083))

(declare-fun m!1133095 () Bool)

(assert (=> b!1227654 m!1133095))

(assert (=> b!1227654 m!1132819))

(assert (=> b!1227653 m!1133079))

(declare-fun m!1133097 () Bool)

(assert (=> b!1227649 m!1133097))

(declare-fun m!1133099 () Bool)

(assert (=> b!1227657 m!1133099))

(assert (=> b!1227648 m!1132819))

(assert (=> b!1227648 m!1132819))

(assert (=> b!1227648 m!1132821))

(assert (=> b!1227419 d!134477))

(declare-fun b!1227667 () Bool)

(declare-fun e!697348 () Bool)

(assert (=> b!1227667 (= e!697348 tp_is_empty!31183)))

(declare-fun b!1227666 () Bool)

(declare-fun e!697349 () Bool)

(assert (=> b!1227666 (= e!697349 tp_is_empty!31183)))

(declare-fun mapIsEmpty!48682 () Bool)

(declare-fun mapRes!48682 () Bool)

(assert (=> mapIsEmpty!48682 mapRes!48682))

(declare-fun mapNonEmpty!48682 () Bool)

(declare-fun tp!92498 () Bool)

(assert (=> mapNonEmpty!48682 (= mapRes!48682 (and tp!92498 e!697349))))

(declare-fun mapValue!48682 () ValueCell!14882)

(declare-fun mapKey!48682 () (_ BitVec 32))

(declare-fun mapRest!48682 () (Array (_ BitVec 32) ValueCell!14882))

(assert (=> mapNonEmpty!48682 (= mapRest!48673 (store mapRest!48682 mapKey!48682 mapValue!48682))))

(declare-fun condMapEmpty!48682 () Bool)

(declare-fun mapDefault!48682 () ValueCell!14882)

(assert (=> mapNonEmpty!48673 (= condMapEmpty!48682 (= mapRest!48673 ((as const (Array (_ BitVec 32) ValueCell!14882)) mapDefault!48682)))))

(assert (=> mapNonEmpty!48673 (= tp!92482 (and e!697348 mapRes!48682))))

(assert (= (and mapNonEmpty!48673 condMapEmpty!48682) mapIsEmpty!48682))

(assert (= (and mapNonEmpty!48673 (not condMapEmpty!48682)) mapNonEmpty!48682))

(assert (= (and mapNonEmpty!48682 ((_ is ValueCellFull!14882) mapValue!48682)) b!1227666))

(assert (= (and mapNonEmpty!48673 ((_ is ValueCellFull!14882) mapDefault!48682)) b!1227667))

(declare-fun m!1133101 () Bool)

(assert (=> mapNonEmpty!48682 m!1133101))

(declare-fun b_lambda!22479 () Bool)

(assert (= b_lambda!22475 (or (and start!102026 b_free!26479) b_lambda!22479)))

(declare-fun b_lambda!22481 () Bool)

(assert (= b_lambda!22471 (or (and start!102026 b_free!26479) b_lambda!22481)))

(declare-fun b_lambda!22483 () Bool)

(assert (= b_lambda!22461 (or (and start!102026 b_free!26479) b_lambda!22483)))

(declare-fun b_lambda!22485 () Bool)

(assert (= b_lambda!22473 (or (and start!102026 b_free!26479) b_lambda!22485)))

(declare-fun b_lambda!22487 () Bool)

(assert (= b_lambda!22467 (or (and start!102026 b_free!26479) b_lambda!22487)))

(declare-fun b_lambda!22489 () Bool)

(assert (= b_lambda!22463 (or (and start!102026 b_free!26479) b_lambda!22489)))

(declare-fun b_lambda!22491 () Bool)

(assert (= b_lambda!22477 (or (and start!102026 b_free!26479) b_lambda!22491)))

(declare-fun b_lambda!22493 () Bool)

(assert (= b_lambda!22469 (or (and start!102026 b_free!26479) b_lambda!22493)))

(declare-fun b_lambda!22495 () Bool)

(assert (= b_lambda!22465 (or (and start!102026 b_free!26479) b_lambda!22495)))

(check-sat (not b!1227550) (not b!1227640) (not b_lambda!22485) (not b!1227616) (not b!1227654) (not bm!60836) (not b!1227635) (not d!134477) (not b!1227596) (not d!134455) (not bm!60844) (not b!1227606) (not b_lambda!22495) (not bm!60850) (not b!1227611) (not b!1227639) (not b!1227642) (not b_lambda!22493) (not b!1227648) b_and!44249 (not b!1227555) (not d!134453) (not b!1227587) (not b_lambda!22481) (not b!1227613) (not b!1227617) (not b!1227553) (not b!1227637) (not b!1227608) (not b!1227592) (not b_next!26479) (not d!134463) (not bm!60849) (not d!134475) (not b!1227591) (not b!1227554) (not b_lambda!22487) (not b!1227633) (not b!1227629) (not b!1227651) (not b!1227588) (not b!1227653) (not b!1227636) (not b!1227612) (not bm!60839) (not d!134461) (not b!1227548) (not mapNonEmpty!48682) (not b_lambda!22479) (not b!1227590) (not b!1227549) (not b!1227641) (not bm!60845) (not b_lambda!22491) (not b!1227656) (not b!1227657) tp_is_empty!31183 (not b!1227593) (not d!134459) (not b!1227652) (not b!1227645) (not b!1227649) (not b!1227595) (not b!1227562) (not b!1227609) (not b_lambda!22459) (not bm!60835) (not bm!60846) (not b!1227644) (not bm!60852) (not b!1227631) (not b!1227614) (not b_lambda!22483) (not d!134449) (not b_lambda!22489) (not bm!60851))
(check-sat b_and!44249 (not b_next!26479))
