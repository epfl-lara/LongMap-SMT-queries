; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101168 () Bool)

(assert start!101168)

(declare-fun b_free!26091 () Bool)

(declare-fun b_next!26091 () Bool)

(assert (=> start!101168 (= b_free!26091 (not b_next!26091))))

(declare-fun tp!91294 () Bool)

(declare-fun b_and!43299 () Bool)

(assert (=> start!101168 (= tp!91294 b_and!43299)))

(declare-datatypes ((array!78377 0))(
  ( (array!78378 (arr!37823 (Array (_ BitVec 32) (_ BitVec 64))) (size!38359 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78377)

(declare-fun b!1214212 () Bool)

(declare-fun e!689547 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!78377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214212 (= e!689547 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60572 () Bool)

(declare-datatypes ((Unit!40269 0))(
  ( (Unit!40270) )
))
(declare-fun call!60577 () Unit!40269)

(declare-fun call!60576 () Unit!40269)

(assert (=> bm!60572 (= call!60577 call!60576)))

(declare-fun b!1214213 () Bool)

(declare-datatypes ((V!46187 0))(
  ( (V!46188 (val!15454 Int)) )
))
(declare-datatypes ((tuple2!19868 0))(
  ( (tuple2!19869 (_1!9945 (_ BitVec 64)) (_2!9945 V!46187)) )
))
(declare-datatypes ((List!26666 0))(
  ( (Nil!26663) (Cons!26662 (h!27871 tuple2!19868) (t!39737 List!26666)) )
))
(declare-datatypes ((ListLongMap!17837 0))(
  ( (ListLongMap!17838 (toList!8934 List!26666)) )
))
(declare-fun call!60580 () ListLongMap!17837)

(declare-fun call!60579 () ListLongMap!17837)

(declare-fun e!689557 () Bool)

(declare-fun -!1879 (ListLongMap!17837 (_ BitVec 64)) ListLongMap!17837)

(assert (=> b!1214213 (= e!689557 (= call!60580 (-!1879 call!60579 k0!934)))))

(declare-fun b!1214214 () Bool)

(declare-fun e!689561 () Bool)

(declare-fun tp_is_empty!30795 () Bool)

(assert (=> b!1214214 (= e!689561 tp_is_empty!30795)))

(declare-fun b!1214215 () Bool)

(declare-fun e!689548 () Unit!40269)

(declare-fun Unit!40271 () Unit!40269)

(assert (=> b!1214215 (= e!689548 Unit!40271)))

(declare-fun lt!552239 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1214215 (= lt!552239 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!120025 () Bool)

(assert (=> b!1214215 (= c!120025 (and (not lt!552239) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!552237 () Unit!40269)

(declare-fun e!689552 () Unit!40269)

(assert (=> b!1214215 (= lt!552237 e!689552)))

(declare-fun zeroValue!944 () V!46187)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!552243 () Unit!40269)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14688 0))(
  ( (ValueCellFull!14688 (v!18107 V!46187)) (EmptyCell!14688) )
))
(declare-datatypes ((array!78379 0))(
  ( (array!78380 (arr!37824 (Array (_ BitVec 32) ValueCell!14688)) (size!38360 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78379)

(declare-fun minValue!944 () V!46187)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!622 (array!78377 array!78379 (_ BitVec 32) (_ BitVec 32) V!46187 V!46187 (_ BitVec 64) (_ BitVec 32) Int) Unit!40269)

(assert (=> b!1214215 (= lt!552243 (lemmaListMapContainsThenArrayContainsFrom!622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120028 () Bool)

(assert (=> b!1214215 (= c!120028 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!806117 () Bool)

(assert (=> b!1214215 (= res!806117 e!689547)))

(declare-fun e!689556 () Bool)

(assert (=> b!1214215 (=> (not res!806117) (not e!689556))))

(assert (=> b!1214215 e!689556))

(declare-fun lt!552246 () Unit!40269)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78377 (_ BitVec 32) (_ BitVec 32)) Unit!40269)

(assert (=> b!1214215 (= lt!552246 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26667 0))(
  ( (Nil!26664) (Cons!26663 (h!27872 (_ BitVec 64)) (t!39738 List!26667)) )
))
(declare-fun arrayNoDuplicates!0 (array!78377 (_ BitVec 32) List!26667) Bool)

(assert (=> b!1214215 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26664)))

(declare-fun lt!552230 () Unit!40269)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78377 (_ BitVec 64) (_ BitVec 32) List!26667) Unit!40269)

(assert (=> b!1214215 (= lt!552230 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26664))))

(assert (=> b!1214215 false))

(declare-fun b!1214216 () Bool)

(declare-fun res!806121 () Bool)

(declare-fun e!689551 () Bool)

(assert (=> b!1214216 (=> (not res!806121) (not e!689551))))

(declare-fun lt!552244 () array!78377)

(assert (=> b!1214216 (= res!806121 (arrayNoDuplicates!0 lt!552244 #b00000000000000000000000000000000 Nil!26664))))

(declare-fun b!1214217 () Bool)

(declare-fun e!689563 () Bool)

(assert (=> b!1214217 (= e!689563 e!689551)))

(declare-fun res!806119 () Bool)

(assert (=> b!1214217 (=> (not res!806119) (not e!689551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78377 (_ BitVec 32)) Bool)

(assert (=> b!1214217 (= res!806119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552244 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1214217 (= lt!552244 (array!78378 (store (arr!37823 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38359 _keys!1208)))))

(declare-fun b!1214218 () Bool)

(declare-fun e!689549 () Bool)

(declare-fun e!689550 () Bool)

(assert (=> b!1214218 (= e!689549 e!689550)))

(declare-fun res!806127 () Bool)

(assert (=> b!1214218 (=> res!806127 e!689550)))

(assert (=> b!1214218 (= res!806127 (not (= from!1455 i!673)))))

(declare-fun lt!552228 () ListLongMap!17837)

(declare-fun lt!552227 () array!78379)

(declare-fun getCurrentListMapNoExtraKeys!5361 (array!78377 array!78379 (_ BitVec 32) (_ BitVec 32) V!46187 V!46187 (_ BitVec 32) Int) ListLongMap!17837)

(assert (=> b!1214218 (= lt!552228 (getCurrentListMapNoExtraKeys!5361 lt!552244 lt!552227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552245 () V!46187)

(assert (=> b!1214218 (= lt!552227 (array!78380 (store (arr!37824 _values!996) i!673 (ValueCellFull!14688 lt!552245)) (size!38360 _values!996)))))

(declare-fun dynLambda!3250 (Int (_ BitVec 64)) V!46187)

(assert (=> b!1214218 (= lt!552245 (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!552236 () ListLongMap!17837)

(assert (=> b!1214218 (= lt!552236 (getCurrentListMapNoExtraKeys!5361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!806115 () Bool)

(assert (=> start!101168 (=> (not res!806115) (not e!689563))))

(assert (=> start!101168 (= res!806115 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38359 _keys!1208))))))

(assert (=> start!101168 e!689563))

(assert (=> start!101168 tp_is_empty!30795))

(declare-fun array_inv!28802 (array!78377) Bool)

(assert (=> start!101168 (array_inv!28802 _keys!1208)))

(assert (=> start!101168 true))

(assert (=> start!101168 tp!91294))

(declare-fun e!689559 () Bool)

(declare-fun array_inv!28803 (array!78379) Bool)

(assert (=> start!101168 (and (array_inv!28803 _values!996) e!689559)))

(declare-fun b!1214219 () Bool)

(declare-fun res!806125 () Bool)

(assert (=> b!1214219 (=> (not res!806125) (not e!689563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214219 (= res!806125 (validMask!0 mask!1564))))

(declare-fun b!1214220 () Bool)

(declare-fun res!806123 () Bool)

(assert (=> b!1214220 (=> (not res!806123) (not e!689563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214220 (= res!806123 (validKeyInArray!0 k0!934))))

(declare-fun bm!60573 () Bool)

(declare-fun call!60581 () Bool)

(declare-fun call!60575 () Bool)

(assert (=> bm!60573 (= call!60581 call!60575)))

(declare-fun b!1214221 () Bool)

(declare-fun e!689554 () Unit!40269)

(declare-fun e!689558 () Unit!40269)

(assert (=> b!1214221 (= e!689554 e!689558)))

(declare-fun c!120026 () Bool)

(assert (=> b!1214221 (= c!120026 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!552239))))

(declare-fun mapIsEmpty!48067 () Bool)

(declare-fun mapRes!48067 () Bool)

(assert (=> mapIsEmpty!48067 mapRes!48067))

(declare-fun b!1214222 () Bool)

(declare-fun res!806118 () Bool)

(assert (=> b!1214222 (=> (not res!806118) (not e!689563))))

(assert (=> b!1214222 (= res!806118 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38359 _keys!1208))))))

(declare-fun b!1214223 () Bool)

(assert (=> b!1214223 (= e!689551 (not e!689549))))

(declare-fun res!806122 () Bool)

(assert (=> b!1214223 (=> res!806122 e!689549)))

(assert (=> b!1214223 (= res!806122 (bvsgt from!1455 i!673))))

(assert (=> b!1214223 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!552229 () Unit!40269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78377 (_ BitVec 64) (_ BitVec 32)) Unit!40269)

(assert (=> b!1214223 (= lt!552229 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214224 () Bool)

(declare-fun res!806126 () Bool)

(assert (=> b!1214224 (=> (not res!806126) (not e!689563))))

(assert (=> b!1214224 (= res!806126 (and (= (size!38360 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38359 _keys!1208) (size!38360 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214225 () Bool)

(declare-fun Unit!40272 () Unit!40269)

(assert (=> b!1214225 (= e!689548 Unit!40272)))

(declare-fun lt!552225 () ListLongMap!17837)

(declare-fun e!689560 () Bool)

(declare-fun b!1214226 () Bool)

(assert (=> b!1214226 (= e!689560 (= lt!552225 (getCurrentListMapNoExtraKeys!5361 lt!552244 lt!552227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1214227 () Bool)

(declare-fun res!806116 () Bool)

(assert (=> b!1214227 (=> (not res!806116) (not e!689563))))

(assert (=> b!1214227 (= res!806116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48067 () Bool)

(declare-fun tp!91295 () Bool)

(assert (=> mapNonEmpty!48067 (= mapRes!48067 (and tp!91295 e!689561))))

(declare-fun mapRest!48067 () (Array (_ BitVec 32) ValueCell!14688))

(declare-fun mapValue!48067 () ValueCell!14688)

(declare-fun mapKey!48067 () (_ BitVec 32))

(assert (=> mapNonEmpty!48067 (= (arr!37824 _values!996) (store mapRest!48067 mapKey!48067 mapValue!48067))))

(declare-fun b!1214228 () Bool)

(declare-fun e!689555 () Bool)

(assert (=> b!1214228 (= e!689555 (or (not (= lt!552225 lt!552228)) (= lt!552228 lt!552225)))))

(assert (=> b!1214228 e!689560))

(declare-fun res!806128 () Bool)

(assert (=> b!1214228 (=> (not res!806128) (not e!689560))))

(declare-fun lt!552240 () ListLongMap!17837)

(assert (=> b!1214228 (= res!806128 (= lt!552225 lt!552240))))

(assert (=> b!1214228 (= lt!552225 (-!1879 lt!552236 k0!934))))

(declare-fun lt!552231 () V!46187)

(declare-fun +!4046 (ListLongMap!17837 tuple2!19868) ListLongMap!17837)

(assert (=> b!1214228 (= (-!1879 (+!4046 lt!552240 (tuple2!19869 (select (arr!37823 _keys!1208) from!1455) lt!552231)) (select (arr!37823 _keys!1208) from!1455)) lt!552240)))

(declare-fun lt!552233 () Unit!40269)

(declare-fun addThenRemoveForNewKeyIsSame!290 (ListLongMap!17837 (_ BitVec 64) V!46187) Unit!40269)

(assert (=> b!1214228 (= lt!552233 (addThenRemoveForNewKeyIsSame!290 lt!552240 (select (arr!37823 _keys!1208) from!1455) lt!552231))))

(declare-fun get!19283 (ValueCell!14688 V!46187) V!46187)

(assert (=> b!1214228 (= lt!552231 (get!19283 (select (arr!37824 _values!996) from!1455) lt!552245))))

(declare-fun lt!552232 () Unit!40269)

(assert (=> b!1214228 (= lt!552232 e!689548)))

(declare-fun c!120030 () Bool)

(declare-fun contains!7004 (ListLongMap!17837 (_ BitVec 64)) Bool)

(assert (=> b!1214228 (= c!120030 (contains!7004 lt!552240 k0!934))))

(assert (=> b!1214228 (= lt!552240 (getCurrentListMapNoExtraKeys!5361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214229 () Bool)

(declare-fun res!806129 () Bool)

(assert (=> b!1214229 (=> (not res!806129) (not e!689563))))

(assert (=> b!1214229 (= res!806129 (= (select (arr!37823 _keys!1208) i!673) k0!934))))

(declare-fun b!1214230 () Bool)

(assert (=> b!1214230 (= e!689556 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214231 () Bool)

(assert (=> b!1214231 (= e!689550 e!689555)))

(declare-fun res!806120 () Bool)

(assert (=> b!1214231 (=> res!806120 e!689555)))

(assert (=> b!1214231 (= res!806120 (not (= (select (arr!37823 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1214231 e!689557))

(declare-fun c!120027 () Bool)

(assert (=> b!1214231 (= c!120027 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!552241 () Unit!40269)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1086 (array!78377 array!78379 (_ BitVec 32) (_ BitVec 32) V!46187 V!46187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40269)

(assert (=> b!1214231 (= lt!552241 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1086 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60574 () Bool)

(assert (=> bm!60574 (= call!60579 (getCurrentListMapNoExtraKeys!5361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214232 () Bool)

(assert (=> b!1214232 call!60581))

(declare-fun lt!552242 () Unit!40269)

(assert (=> b!1214232 (= lt!552242 call!60577)))

(assert (=> b!1214232 (= e!689558 lt!552242)))

(declare-fun b!1214233 () Bool)

(assert (=> b!1214233 (= e!689547 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!552239) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60575 () Bool)

(declare-fun call!60582 () ListLongMap!17837)

(declare-fun call!60578 () ListLongMap!17837)

(assert (=> bm!60575 (= call!60582 call!60578)))

(declare-fun b!1214234 () Bool)

(declare-fun res!806124 () Bool)

(assert (=> b!1214234 (=> (not res!806124) (not e!689563))))

(assert (=> b!1214234 (= res!806124 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26664))))

(declare-fun b!1214235 () Bool)

(assert (=> b!1214235 (= e!689557 (= call!60580 call!60579))))

(declare-fun b!1214236 () Bool)

(declare-fun Unit!40273 () Unit!40269)

(assert (=> b!1214236 (= e!689558 Unit!40273)))

(declare-fun bm!60576 () Bool)

(assert (=> bm!60576 (= call!60580 (getCurrentListMapNoExtraKeys!5361 lt!552244 lt!552227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60577 () Bool)

(declare-fun lt!552234 () ListLongMap!17837)

(assert (=> bm!60577 (= call!60575 (contains!7004 (ite c!120025 lt!552234 call!60582) k0!934))))

(declare-fun bm!60578 () Bool)

(declare-fun c!120029 () Bool)

(assert (=> bm!60578 (= call!60578 (+!4046 (ite c!120025 lt!552234 lt!552240) (ite c!120025 (tuple2!19869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120029 (tuple2!19869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19869 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1214237 () Bool)

(assert (=> b!1214237 (contains!7004 call!60578 k0!934)))

(declare-fun lt!552238 () Unit!40269)

(assert (=> b!1214237 (= lt!552238 call!60576)))

(assert (=> b!1214237 call!60575))

(assert (=> b!1214237 (= lt!552234 (+!4046 lt!552240 (tuple2!19869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!552235 () Unit!40269)

(declare-fun addStillContains!1074 (ListLongMap!17837 (_ BitVec 64) V!46187 (_ BitVec 64)) Unit!40269)

(assert (=> b!1214237 (= lt!552235 (addStillContains!1074 lt!552240 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1214237 (= e!689552 lt!552238)))

(declare-fun bm!60579 () Bool)

(assert (=> bm!60579 (= call!60576 (addStillContains!1074 (ite c!120025 lt!552234 lt!552240) (ite c!120025 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120029 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120025 minValue!944 (ite c!120029 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1214238 () Bool)

(declare-fun e!689562 () Bool)

(assert (=> b!1214238 (= e!689562 tp_is_empty!30795)))

(declare-fun b!1214239 () Bool)

(assert (=> b!1214239 (= c!120029 (and (not lt!552239) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1214239 (= e!689552 e!689554)))

(declare-fun b!1214240 () Bool)

(declare-fun lt!552226 () Unit!40269)

(assert (=> b!1214240 (= e!689554 lt!552226)))

(assert (=> b!1214240 (= lt!552226 call!60577)))

(assert (=> b!1214240 call!60581))

(declare-fun b!1214241 () Bool)

(assert (=> b!1214241 (= e!689559 (and e!689562 mapRes!48067))))

(declare-fun condMapEmpty!48067 () Bool)

(declare-fun mapDefault!48067 () ValueCell!14688)

(assert (=> b!1214241 (= condMapEmpty!48067 (= (arr!37824 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14688)) mapDefault!48067)))))

(assert (= (and start!101168 res!806115) b!1214219))

(assert (= (and b!1214219 res!806125) b!1214224))

(assert (= (and b!1214224 res!806126) b!1214227))

(assert (= (and b!1214227 res!806116) b!1214234))

(assert (= (and b!1214234 res!806124) b!1214222))

(assert (= (and b!1214222 res!806118) b!1214220))

(assert (= (and b!1214220 res!806123) b!1214229))

(assert (= (and b!1214229 res!806129) b!1214217))

(assert (= (and b!1214217 res!806119) b!1214216))

(assert (= (and b!1214216 res!806121) b!1214223))

(assert (= (and b!1214223 (not res!806122)) b!1214218))

(assert (= (and b!1214218 (not res!806127)) b!1214231))

(assert (= (and b!1214231 c!120027) b!1214213))

(assert (= (and b!1214231 (not c!120027)) b!1214235))

(assert (= (or b!1214213 b!1214235) bm!60576))

(assert (= (or b!1214213 b!1214235) bm!60574))

(assert (= (and b!1214231 (not res!806120)) b!1214228))

(assert (= (and b!1214228 c!120030) b!1214215))

(assert (= (and b!1214228 (not c!120030)) b!1214225))

(assert (= (and b!1214215 c!120025) b!1214237))

(assert (= (and b!1214215 (not c!120025)) b!1214239))

(assert (= (and b!1214239 c!120029) b!1214240))

(assert (= (and b!1214239 (not c!120029)) b!1214221))

(assert (= (and b!1214221 c!120026) b!1214232))

(assert (= (and b!1214221 (not c!120026)) b!1214236))

(assert (= (or b!1214240 b!1214232) bm!60572))

(assert (= (or b!1214240 b!1214232) bm!60575))

(assert (= (or b!1214240 b!1214232) bm!60573))

(assert (= (or b!1214237 bm!60573) bm!60577))

(assert (= (or b!1214237 bm!60572) bm!60579))

(assert (= (or b!1214237 bm!60575) bm!60578))

(assert (= (and b!1214215 c!120028) b!1214212))

(assert (= (and b!1214215 (not c!120028)) b!1214233))

(assert (= (and b!1214215 res!806117) b!1214230))

(assert (= (and b!1214228 res!806128) b!1214226))

(assert (= (and b!1214241 condMapEmpty!48067) mapIsEmpty!48067))

(assert (= (and b!1214241 (not condMapEmpty!48067)) mapNonEmpty!48067))

(get-info :version)

(assert (= (and mapNonEmpty!48067 ((_ is ValueCellFull!14688) mapValue!48067)) b!1214214))

(assert (= (and b!1214241 ((_ is ValueCellFull!14688) mapDefault!48067)) b!1214238))

(assert (= start!101168 b!1214241))

(declare-fun b_lambda!21767 () Bool)

(assert (=> (not b_lambda!21767) (not b!1214218)))

(declare-fun t!39736 () Bool)

(declare-fun tb!10891 () Bool)

(assert (=> (and start!101168 (= defaultEntry!1004 defaultEntry!1004) t!39736) tb!10891))

(declare-fun result!22379 () Bool)

(assert (=> tb!10891 (= result!22379 tp_is_empty!30795)))

(assert (=> b!1214218 t!39736))

(declare-fun b_and!43301 () Bool)

(assert (= b_and!43299 (and (=> t!39736 result!22379) b_and!43301)))

(declare-fun m!1119419 () Bool)

(assert (=> start!101168 m!1119419))

(declare-fun m!1119421 () Bool)

(assert (=> start!101168 m!1119421))

(declare-fun m!1119423 () Bool)

(assert (=> b!1214212 m!1119423))

(assert (=> b!1214230 m!1119423))

(declare-fun m!1119425 () Bool)

(assert (=> b!1214226 m!1119425))

(declare-fun m!1119427 () Bool)

(assert (=> b!1214219 m!1119427))

(declare-fun m!1119429 () Bool)

(assert (=> b!1214231 m!1119429))

(declare-fun m!1119431 () Bool)

(assert (=> b!1214231 m!1119431))

(declare-fun m!1119433 () Bool)

(assert (=> b!1214237 m!1119433))

(declare-fun m!1119435 () Bool)

(assert (=> b!1214237 m!1119435))

(declare-fun m!1119437 () Bool)

(assert (=> b!1214237 m!1119437))

(declare-fun m!1119439 () Bool)

(assert (=> mapNonEmpty!48067 m!1119439))

(declare-fun m!1119441 () Bool)

(assert (=> b!1214223 m!1119441))

(declare-fun m!1119443 () Bool)

(assert (=> b!1214223 m!1119443))

(declare-fun m!1119445 () Bool)

(assert (=> b!1214216 m!1119445))

(declare-fun m!1119447 () Bool)

(assert (=> b!1214215 m!1119447))

(declare-fun m!1119449 () Bool)

(assert (=> b!1214215 m!1119449))

(declare-fun m!1119451 () Bool)

(assert (=> b!1214215 m!1119451))

(declare-fun m!1119453 () Bool)

(assert (=> b!1214215 m!1119453))

(declare-fun m!1119455 () Bool)

(assert (=> b!1214220 m!1119455))

(declare-fun m!1119457 () Bool)

(assert (=> b!1214217 m!1119457))

(declare-fun m!1119459 () Bool)

(assert (=> b!1214217 m!1119459))

(declare-fun m!1119461 () Bool)

(assert (=> b!1214227 m!1119461))

(declare-fun m!1119463 () Bool)

(assert (=> bm!60574 m!1119463))

(declare-fun m!1119465 () Bool)

(assert (=> b!1214234 m!1119465))

(assert (=> bm!60576 m!1119425))

(declare-fun m!1119467 () Bool)

(assert (=> b!1214228 m!1119467))

(declare-fun m!1119469 () Bool)

(assert (=> b!1214228 m!1119469))

(assert (=> b!1214228 m!1119467))

(declare-fun m!1119471 () Bool)

(assert (=> b!1214228 m!1119471))

(assert (=> b!1214228 m!1119429))

(declare-fun m!1119473 () Bool)

(assert (=> b!1214228 m!1119473))

(declare-fun m!1119475 () Bool)

(assert (=> b!1214228 m!1119475))

(assert (=> b!1214228 m!1119429))

(declare-fun m!1119477 () Bool)

(assert (=> b!1214228 m!1119477))

(assert (=> b!1214228 m!1119429))

(assert (=> b!1214228 m!1119463))

(declare-fun m!1119479 () Bool)

(assert (=> b!1214228 m!1119479))

(assert (=> b!1214228 m!1119475))

(declare-fun m!1119481 () Bool)

(assert (=> bm!60579 m!1119481))

(declare-fun m!1119483 () Bool)

(assert (=> b!1214229 m!1119483))

(declare-fun m!1119485 () Bool)

(assert (=> b!1214213 m!1119485))

(declare-fun m!1119487 () Bool)

(assert (=> b!1214218 m!1119487))

(declare-fun m!1119489 () Bool)

(assert (=> b!1214218 m!1119489))

(declare-fun m!1119491 () Bool)

(assert (=> b!1214218 m!1119491))

(declare-fun m!1119493 () Bool)

(assert (=> b!1214218 m!1119493))

(declare-fun m!1119495 () Bool)

(assert (=> bm!60578 m!1119495))

(declare-fun m!1119497 () Bool)

(assert (=> bm!60577 m!1119497))

(check-sat (not mapNonEmpty!48067) b_and!43301 (not b!1214213) (not b!1214226) (not b!1214216) (not b!1214218) (not b!1214231) (not b!1214220) (not b!1214230) (not b!1214237) (not b!1214223) tp_is_empty!30795 (not b!1214228) (not bm!60578) (not b!1214212) (not b!1214217) (not bm!60579) (not b_next!26091) (not bm!60577) (not bm!60574) (not bm!60576) (not b!1214215) (not b!1214219) (not b_lambda!21767) (not start!101168) (not b!1214234) (not b!1214227))
(check-sat b_and!43301 (not b_next!26091))
