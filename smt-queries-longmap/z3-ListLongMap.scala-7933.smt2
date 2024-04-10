; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98440 () Bool)

(assert start!98440)

(declare-fun b_free!24045 () Bool)

(declare-fun b_next!24045 () Bool)

(assert (=> start!98440 (= b_free!24045 (not b_next!24045))))

(declare-fun tp!84846 () Bool)

(declare-fun b_and!38939 () Bool)

(assert (=> start!98440 (= tp!84846 b_and!38939)))

(declare-fun res!758921 () Bool)

(declare-fun e!647165 () Bool)

(assert (=> start!98440 (=> (not res!758921) (not e!647165))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74011 0))(
  ( (array!74012 (arr!35656 (Array (_ BitVec 32) (_ BitVec 64))) (size!36192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74011)

(assert (=> start!98440 (= res!758921 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36192 _keys!1208))))))

(assert (=> start!98440 e!647165))

(declare-fun tp_is_empty!28575 () Bool)

(assert (=> start!98440 tp_is_empty!28575))

(declare-fun array_inv!27340 (array!74011) Bool)

(assert (=> start!98440 (array_inv!27340 _keys!1208)))

(assert (=> start!98440 true))

(assert (=> start!98440 tp!84846))

(declare-datatypes ((V!43227 0))(
  ( (V!43228 (val!14344 Int)) )
))
(declare-datatypes ((ValueCell!13578 0))(
  ( (ValueCellFull!13578 (v!16981 V!43227)) (EmptyCell!13578) )
))
(declare-datatypes ((array!74013 0))(
  ( (array!74014 (arr!35657 (Array (_ BitVec 32) ValueCell!13578)) (size!36193 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74013)

(declare-fun e!647164 () Bool)

(declare-fun array_inv!27341 (array!74013) Bool)

(assert (=> start!98440 (and (array_inv!27341 _values!996) e!647164)))

(declare-fun b!1137311 () Bool)

(declare-fun res!758915 () Bool)

(assert (=> b!1137311 (=> (not res!758915) (not e!647165))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1137311 (= res!758915 (and (= (size!36193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36192 _keys!1208) (size!36193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137312 () Bool)

(declare-fun e!647167 () Bool)

(declare-fun e!647166 () Bool)

(assert (=> b!1137312 (= e!647167 e!647166)))

(declare-fun res!758912 () Bool)

(assert (=> b!1137312 (=> res!758912 e!647166)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137312 (= res!758912 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43227)

(declare-fun lt!505810 () array!74013)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!505803 () array!74011)

(declare-datatypes ((tuple2!18116 0))(
  ( (tuple2!18117 (_1!9069 (_ BitVec 64)) (_2!9069 V!43227)) )
))
(declare-datatypes ((List!24874 0))(
  ( (Nil!24871) (Cons!24870 (h!26079 tuple2!18116) (t!35911 List!24874)) )
))
(declare-datatypes ((ListLongMap!16085 0))(
  ( (ListLongMap!16086 (toList!8058 List!24874)) )
))
(declare-fun lt!505816 () ListLongMap!16085)

(declare-fun minValue!944 () V!43227)

(declare-fun getCurrentListMapNoExtraKeys!4542 (array!74011 array!74013 (_ BitVec 32) (_ BitVec 32) V!43227 V!43227 (_ BitVec 32) Int) ListLongMap!16085)

(assert (=> b!1137312 (= lt!505816 (getCurrentListMapNoExtraKeys!4542 lt!505803 lt!505810 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2598 (Int (_ BitVec 64)) V!43227)

(assert (=> b!1137312 (= lt!505810 (array!74014 (store (arr!35657 _values!996) i!673 (ValueCellFull!13578 (dynLambda!2598 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36193 _values!996)))))

(declare-fun lt!505815 () ListLongMap!16085)

(assert (=> b!1137312 (= lt!505815 (getCurrentListMapNoExtraKeys!4542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137313 () Bool)

(declare-datatypes ((Unit!37253 0))(
  ( (Unit!37254) )
))
(declare-fun e!647169 () Unit!37253)

(declare-fun lt!505804 () Unit!37253)

(assert (=> b!1137313 (= e!647169 lt!505804)))

(declare-fun call!50084 () Unit!37253)

(assert (=> b!1137313 (= lt!505804 call!50084)))

(declare-fun call!50082 () Bool)

(assert (=> b!1137313 call!50082))

(declare-fun mapIsEmpty!44687 () Bool)

(declare-fun mapRes!44687 () Bool)

(assert (=> mapIsEmpty!44687 mapRes!44687))

(declare-fun bm!50079 () Bool)

(declare-fun call!50088 () ListLongMap!16085)

(declare-fun call!50085 () ListLongMap!16085)

(assert (=> bm!50079 (= call!50088 call!50085)))

(declare-fun bm!50080 () Bool)

(declare-fun c!111264 () Bool)

(declare-fun c!111268 () Bool)

(declare-fun lt!505808 () ListLongMap!16085)

(declare-fun +!3493 (ListLongMap!16085 tuple2!18116) ListLongMap!16085)

(assert (=> bm!50080 (= call!50085 (+!3493 lt!505808 (ite (or c!111264 c!111268) (tuple2!18117 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!50081 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!505802 () ListLongMap!16085)

(declare-fun call!50087 () Bool)

(declare-fun contains!6596 (ListLongMap!16085 (_ BitVec 64)) Bool)

(assert (=> bm!50081 (= call!50087 (contains!6596 (ite c!111264 lt!505802 call!50088) k0!934))))

(declare-fun e!647160 () Bool)

(declare-fun b!1137314 () Bool)

(declare-fun arrayContainsKey!0 (array!74011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137314 (= e!647160 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137315 () Bool)

(declare-fun e!647161 () Unit!37253)

(declare-fun Unit!37255 () Unit!37253)

(assert (=> b!1137315 (= e!647161 Unit!37255)))

(declare-fun lt!505806 () Bool)

(assert (=> b!1137315 (= lt!505806 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137315 (= c!111264 (and (not lt!505806) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505818 () Unit!37253)

(declare-fun e!647163 () Unit!37253)

(assert (=> b!1137315 (= lt!505818 e!647163)))

(declare-fun lt!505811 () Unit!37253)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!357 (array!74011 array!74013 (_ BitVec 32) (_ BitVec 32) V!43227 V!43227 (_ BitVec 64) (_ BitVec 32) Int) Unit!37253)

(assert (=> b!1137315 (= lt!505811 (lemmaListMapContainsThenArrayContainsFrom!357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111265 () Bool)

(assert (=> b!1137315 (= c!111265 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758918 () Bool)

(assert (=> b!1137315 (= res!758918 e!647160)))

(declare-fun e!647170 () Bool)

(assert (=> b!1137315 (=> (not res!758918) (not e!647170))))

(assert (=> b!1137315 e!647170))

(declare-fun lt!505805 () Unit!37253)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74011 (_ BitVec 32) (_ BitVec 32)) Unit!37253)

(assert (=> b!1137315 (= lt!505805 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24875 0))(
  ( (Nil!24872) (Cons!24871 (h!26080 (_ BitVec 64)) (t!35912 List!24875)) )
))
(declare-fun arrayNoDuplicates!0 (array!74011 (_ BitVec 32) List!24875) Bool)

(assert (=> b!1137315 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24872)))

(declare-fun lt!505807 () Unit!37253)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74011 (_ BitVec 64) (_ BitVec 32) List!24875) Unit!37253)

(assert (=> b!1137315 (= lt!505807 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24872))))

(assert (=> b!1137315 false))

(declare-fun bm!50082 () Bool)

(assert (=> bm!50082 (= call!50082 call!50087)))

(declare-fun b!1137316 () Bool)

(declare-fun e!647172 () Bool)

(assert (=> b!1137316 (= e!647172 (not e!647167))))

(declare-fun res!758919 () Bool)

(assert (=> b!1137316 (=> res!758919 e!647167)))

(assert (=> b!1137316 (= res!758919 (bvsgt from!1455 i!673))))

(assert (=> b!1137316 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505814 () Unit!37253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74011 (_ BitVec 64) (_ BitVec 32)) Unit!37253)

(assert (=> b!1137316 (= lt!505814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137317 () Bool)

(declare-fun e!647171 () Bool)

(assert (=> b!1137317 (= e!647171 tp_is_empty!28575)))

(declare-fun b!1137318 () Bool)

(declare-fun res!758917 () Bool)

(assert (=> b!1137318 (=> (not res!758917) (not e!647172))))

(assert (=> b!1137318 (= res!758917 (arrayNoDuplicates!0 lt!505803 #b00000000000000000000000000000000 Nil!24872))))

(declare-fun bm!50083 () Bool)

(declare-fun call!50083 () ListLongMap!16085)

(assert (=> bm!50083 (= call!50083 (getCurrentListMapNoExtraKeys!4542 lt!505803 lt!505810 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137319 () Bool)

(declare-fun res!758909 () Bool)

(assert (=> b!1137319 (=> (not res!758909) (not e!647165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137319 (= res!758909 (validKeyInArray!0 k0!934))))

(declare-fun b!1137320 () Bool)

(declare-fun res!758914 () Bool)

(assert (=> b!1137320 (=> (not res!758914) (not e!647165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137320 (= res!758914 (validMask!0 mask!1564))))

(declare-fun b!1137321 () Bool)

(declare-fun Unit!37256 () Unit!37253)

(assert (=> b!1137321 (= e!647161 Unit!37256)))

(declare-fun b!1137322 () Bool)

(assert (=> b!1137322 (= e!647170 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137323 () Bool)

(declare-fun e!647162 () Bool)

(declare-fun call!50089 () ListLongMap!16085)

(assert (=> b!1137323 (= e!647162 (= call!50083 call!50089))))

(declare-fun b!1137324 () Bool)

(assert (=> b!1137324 (= e!647165 e!647172)))

(declare-fun res!758913 () Bool)

(assert (=> b!1137324 (=> (not res!758913) (not e!647172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74011 (_ BitVec 32)) Bool)

(assert (=> b!1137324 (= res!758913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505803 mask!1564))))

(assert (=> b!1137324 (= lt!505803 (array!74012 (store (arr!35656 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36192 _keys!1208)))))

(declare-fun b!1137325 () Bool)

(assert (=> b!1137325 call!50082))

(declare-fun lt!505817 () Unit!37253)

(assert (=> b!1137325 (= lt!505817 call!50084)))

(declare-fun e!647168 () Unit!37253)

(assert (=> b!1137325 (= e!647168 lt!505817)))

(declare-fun b!1137326 () Bool)

(declare-fun -!1216 (ListLongMap!16085 (_ BitVec 64)) ListLongMap!16085)

(assert (=> b!1137326 (= e!647162 (= call!50083 (-!1216 call!50089 k0!934)))))

(declare-fun b!1137327 () Bool)

(declare-fun res!758920 () Bool)

(assert (=> b!1137327 (=> (not res!758920) (not e!647165))))

(assert (=> b!1137327 (= res!758920 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36192 _keys!1208))))))

(declare-fun b!1137328 () Bool)

(declare-fun e!647174 () Bool)

(assert (=> b!1137328 (= e!647174 true)))

(declare-fun lt!505813 () Unit!37253)

(assert (=> b!1137328 (= lt!505813 e!647161)))

(declare-fun c!111267 () Bool)

(assert (=> b!1137328 (= c!111267 (contains!6596 lt!505808 k0!934))))

(assert (=> b!1137328 (= lt!505808 (getCurrentListMapNoExtraKeys!4542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50084 () Bool)

(declare-fun call!50086 () Unit!37253)

(assert (=> bm!50084 (= call!50084 call!50086)))

(declare-fun b!1137329 () Bool)

(declare-fun res!758910 () Bool)

(assert (=> b!1137329 (=> (not res!758910) (not e!647165))))

(assert (=> b!1137329 (= res!758910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50085 () Bool)

(declare-fun addStillContains!753 (ListLongMap!16085 (_ BitVec 64) V!43227 (_ BitVec 64)) Unit!37253)

(assert (=> bm!50085 (= call!50086 (addStillContains!753 (ite c!111264 lt!505802 lt!505808) (ite c!111264 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111268 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111264 minValue!944 (ite c!111268 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1137330 () Bool)

(assert (=> b!1137330 (= e!647160 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505806) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137331 () Bool)

(assert (=> b!1137331 (= e!647166 e!647174)))

(declare-fun res!758916 () Bool)

(assert (=> b!1137331 (=> res!758916 e!647174)))

(assert (=> b!1137331 (= res!758916 (not (= (select (arr!35656 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137331 e!647162))

(declare-fun c!111263 () Bool)

(assert (=> b!1137331 (= c!111263 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505812 () Unit!37253)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!462 (array!74011 array!74013 (_ BitVec 32) (_ BitVec 32) V!43227 V!43227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37253)

(assert (=> b!1137331 (= lt!505812 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!462 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137332 () Bool)

(assert (=> b!1137332 (= c!111268 (and (not lt!505806) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1137332 (= e!647163 e!647169)))

(declare-fun b!1137333 () Bool)

(declare-fun Unit!37257 () Unit!37253)

(assert (=> b!1137333 (= e!647168 Unit!37257)))

(declare-fun bm!50086 () Bool)

(assert (=> bm!50086 (= call!50089 (getCurrentListMapNoExtraKeys!4542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137334 () Bool)

(declare-fun res!758911 () Bool)

(assert (=> b!1137334 (=> (not res!758911) (not e!647165))))

(assert (=> b!1137334 (= res!758911 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24872))))

(declare-fun b!1137335 () Bool)

(assert (=> b!1137335 (= e!647169 e!647168)))

(declare-fun c!111266 () Bool)

(assert (=> b!1137335 (= c!111266 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505806))))

(declare-fun b!1137336 () Bool)

(declare-fun e!647175 () Bool)

(assert (=> b!1137336 (= e!647164 (and e!647175 mapRes!44687))))

(declare-fun condMapEmpty!44687 () Bool)

(declare-fun mapDefault!44687 () ValueCell!13578)

(assert (=> b!1137336 (= condMapEmpty!44687 (= (arr!35657 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13578)) mapDefault!44687)))))

(declare-fun b!1137337 () Bool)

(assert (=> b!1137337 (contains!6596 (+!3493 lt!505802 (tuple2!18117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!505809 () Unit!37253)

(assert (=> b!1137337 (= lt!505809 call!50086)))

(assert (=> b!1137337 call!50087))

(assert (=> b!1137337 (= lt!505802 call!50085)))

(declare-fun lt!505801 () Unit!37253)

(assert (=> b!1137337 (= lt!505801 (addStillContains!753 lt!505808 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1137337 (= e!647163 lt!505809)))

(declare-fun mapNonEmpty!44687 () Bool)

(declare-fun tp!84845 () Bool)

(assert (=> mapNonEmpty!44687 (= mapRes!44687 (and tp!84845 e!647171))))

(declare-fun mapValue!44687 () ValueCell!13578)

(declare-fun mapKey!44687 () (_ BitVec 32))

(declare-fun mapRest!44687 () (Array (_ BitVec 32) ValueCell!13578))

(assert (=> mapNonEmpty!44687 (= (arr!35657 _values!996) (store mapRest!44687 mapKey!44687 mapValue!44687))))

(declare-fun b!1137338 () Bool)

(declare-fun res!758908 () Bool)

(assert (=> b!1137338 (=> (not res!758908) (not e!647165))))

(assert (=> b!1137338 (= res!758908 (= (select (arr!35656 _keys!1208) i!673) k0!934))))

(declare-fun b!1137339 () Bool)

(assert (=> b!1137339 (= e!647175 tp_is_empty!28575)))

(assert (= (and start!98440 res!758921) b!1137320))

(assert (= (and b!1137320 res!758914) b!1137311))

(assert (= (and b!1137311 res!758915) b!1137329))

(assert (= (and b!1137329 res!758910) b!1137334))

(assert (= (and b!1137334 res!758911) b!1137327))

(assert (= (and b!1137327 res!758920) b!1137319))

(assert (= (and b!1137319 res!758909) b!1137338))

(assert (= (and b!1137338 res!758908) b!1137324))

(assert (= (and b!1137324 res!758913) b!1137318))

(assert (= (and b!1137318 res!758917) b!1137316))

(assert (= (and b!1137316 (not res!758919)) b!1137312))

(assert (= (and b!1137312 (not res!758912)) b!1137331))

(assert (= (and b!1137331 c!111263) b!1137326))

(assert (= (and b!1137331 (not c!111263)) b!1137323))

(assert (= (or b!1137326 b!1137323) bm!50083))

(assert (= (or b!1137326 b!1137323) bm!50086))

(assert (= (and b!1137331 (not res!758916)) b!1137328))

(assert (= (and b!1137328 c!111267) b!1137315))

(assert (= (and b!1137328 (not c!111267)) b!1137321))

(assert (= (and b!1137315 c!111264) b!1137337))

(assert (= (and b!1137315 (not c!111264)) b!1137332))

(assert (= (and b!1137332 c!111268) b!1137313))

(assert (= (and b!1137332 (not c!111268)) b!1137335))

(assert (= (and b!1137335 c!111266) b!1137325))

(assert (= (and b!1137335 (not c!111266)) b!1137333))

(assert (= (or b!1137313 b!1137325) bm!50084))

(assert (= (or b!1137313 b!1137325) bm!50079))

(assert (= (or b!1137313 b!1137325) bm!50082))

(assert (= (or b!1137337 bm!50082) bm!50081))

(assert (= (or b!1137337 bm!50084) bm!50085))

(assert (= (or b!1137337 bm!50079) bm!50080))

(assert (= (and b!1137315 c!111265) b!1137314))

(assert (= (and b!1137315 (not c!111265)) b!1137330))

(assert (= (and b!1137315 res!758918) b!1137322))

(assert (= (and b!1137336 condMapEmpty!44687) mapIsEmpty!44687))

(assert (= (and b!1137336 (not condMapEmpty!44687)) mapNonEmpty!44687))

(get-info :version)

(assert (= (and mapNonEmpty!44687 ((_ is ValueCellFull!13578) mapValue!44687)) b!1137317))

(assert (= (and b!1137336 ((_ is ValueCellFull!13578) mapDefault!44687)) b!1137339))

(assert (= start!98440 b!1137336))

(declare-fun b_lambda!19151 () Bool)

(assert (=> (not b_lambda!19151) (not b!1137312)))

(declare-fun t!35910 () Bool)

(declare-fun tb!8857 () Bool)

(assert (=> (and start!98440 (= defaultEntry!1004 defaultEntry!1004) t!35910) tb!8857))

(declare-fun result!18279 () Bool)

(assert (=> tb!8857 (= result!18279 tp_is_empty!28575)))

(assert (=> b!1137312 t!35910))

(declare-fun b_and!38941 () Bool)

(assert (= b_and!38939 (and (=> t!35910 result!18279) b_and!38941)))

(declare-fun m!1049429 () Bool)

(assert (=> b!1137324 m!1049429))

(declare-fun m!1049431 () Bool)

(assert (=> b!1137324 m!1049431))

(declare-fun m!1049433 () Bool)

(assert (=> b!1137314 m!1049433))

(declare-fun m!1049435 () Bool)

(assert (=> b!1137318 m!1049435))

(declare-fun m!1049437 () Bool)

(assert (=> bm!50085 m!1049437))

(declare-fun m!1049439 () Bool)

(assert (=> b!1137320 m!1049439))

(declare-fun m!1049441 () Bool)

(assert (=> b!1137312 m!1049441))

(declare-fun m!1049443 () Bool)

(assert (=> b!1137312 m!1049443))

(declare-fun m!1049445 () Bool)

(assert (=> b!1137312 m!1049445))

(declare-fun m!1049447 () Bool)

(assert (=> b!1137312 m!1049447))

(declare-fun m!1049449 () Bool)

(assert (=> bm!50086 m!1049449))

(declare-fun m!1049451 () Bool)

(assert (=> b!1137316 m!1049451))

(declare-fun m!1049453 () Bool)

(assert (=> b!1137316 m!1049453))

(declare-fun m!1049455 () Bool)

(assert (=> b!1137328 m!1049455))

(assert (=> b!1137328 m!1049449))

(assert (=> b!1137322 m!1049433))

(declare-fun m!1049457 () Bool)

(assert (=> bm!50081 m!1049457))

(declare-fun m!1049459 () Bool)

(assert (=> b!1137326 m!1049459))

(declare-fun m!1049461 () Bool)

(assert (=> bm!50083 m!1049461))

(declare-fun m!1049463 () Bool)

(assert (=> b!1137329 m!1049463))

(declare-fun m!1049465 () Bool)

(assert (=> b!1137315 m!1049465))

(declare-fun m!1049467 () Bool)

(assert (=> b!1137315 m!1049467))

(declare-fun m!1049469 () Bool)

(assert (=> b!1137315 m!1049469))

(declare-fun m!1049471 () Bool)

(assert (=> b!1137315 m!1049471))

(declare-fun m!1049473 () Bool)

(assert (=> b!1137337 m!1049473))

(assert (=> b!1137337 m!1049473))

(declare-fun m!1049475 () Bool)

(assert (=> b!1137337 m!1049475))

(declare-fun m!1049477 () Bool)

(assert (=> b!1137337 m!1049477))

(declare-fun m!1049479 () Bool)

(assert (=> b!1137319 m!1049479))

(declare-fun m!1049481 () Bool)

(assert (=> b!1137338 m!1049481))

(declare-fun m!1049483 () Bool)

(assert (=> bm!50080 m!1049483))

(declare-fun m!1049485 () Bool)

(assert (=> b!1137331 m!1049485))

(declare-fun m!1049487 () Bool)

(assert (=> b!1137331 m!1049487))

(declare-fun m!1049489 () Bool)

(assert (=> start!98440 m!1049489))

(declare-fun m!1049491 () Bool)

(assert (=> start!98440 m!1049491))

(declare-fun m!1049493 () Bool)

(assert (=> b!1137334 m!1049493))

(declare-fun m!1049495 () Bool)

(assert (=> mapNonEmpty!44687 m!1049495))

(check-sat (not b!1137322) (not bm!50083) (not bm!50085) (not b!1137315) b_and!38941 tp_is_empty!28575 (not bm!50081) (not b!1137320) (not b!1137319) (not b!1137324) (not b!1137331) (not b!1137334) (not b!1137314) (not b!1137316) (not b_lambda!19151) (not start!98440) (not bm!50080) (not b!1137318) (not b!1137328) (not b!1137312) (not b!1137337) (not b_next!24045) (not bm!50086) (not b!1137326) (not b!1137329) (not mapNonEmpty!44687))
(check-sat b_and!38941 (not b_next!24045))
