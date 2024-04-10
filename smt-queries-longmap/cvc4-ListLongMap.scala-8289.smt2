; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101010 () Bool)

(assert start!101010)

(declare-fun b_free!26009 () Bool)

(declare-fun b_next!26009 () Bool)

(assert (=> start!101010 (= b_free!26009 (not b_next!26009))))

(declare-fun tp!91043 () Bool)

(declare-fun b_and!43099 () Bool)

(assert (=> start!101010 (= tp!91043 b_and!43099)))

(declare-datatypes ((V!46077 0))(
  ( (V!46078 (val!15413 Int)) )
))
(declare-datatypes ((tuple2!19792 0))(
  ( (tuple2!19793 (_1!9907 (_ BitVec 64)) (_2!9907 V!46077)) )
))
(declare-datatypes ((List!26593 0))(
  ( (Nil!26590) (Cons!26589 (h!27798 tuple2!19792) (t!39582 List!26593)) )
))
(declare-datatypes ((ListLongMap!17761 0))(
  ( (ListLongMap!17762 (toList!8896 List!26593)) )
))
(declare-fun call!59555 () ListLongMap!17761)

(declare-fun call!59553 () ListLongMap!17761)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!687264 () Bool)

(declare-fun b!1210125 () Bool)

(declare-fun -!1846 (ListLongMap!17761 (_ BitVec 64)) ListLongMap!17761)

(assert (=> b!1210125 (= e!687264 (= call!59555 (-!1846 call!59553 k!934)))))

(declare-fun b!1210126 () Bool)

(declare-fun res!804170 () Bool)

(declare-fun e!687265 () Bool)

(assert (=> b!1210126 (=> (not res!804170) (not e!687265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210126 (= res!804170 (validKeyInArray!0 k!934))))

(declare-fun b!1210127 () Bool)

(declare-fun res!804172 () Bool)

(assert (=> b!1210127 (=> (not res!804172) (not e!687265))))

(declare-datatypes ((array!78211 0))(
  ( (array!78212 (arr!37742 (Array (_ BitVec 32) (_ BitVec 64))) (size!38278 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78211)

(declare-datatypes ((List!26594 0))(
  ( (Nil!26591) (Cons!26590 (h!27799 (_ BitVec 64)) (t!39583 List!26594)) )
))
(declare-fun arrayNoDuplicates!0 (array!78211 (_ BitVec 32) List!26594) Bool)

(assert (=> b!1210127 (= res!804172 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26591))))

(declare-fun b!1210128 () Bool)

(declare-fun call!59554 () Bool)

(assert (=> b!1210128 call!59554))

(declare-datatypes ((Unit!40109 0))(
  ( (Unit!40110) )
))
(declare-fun lt!549385 () Unit!40109)

(declare-fun call!59549 () Unit!40109)

(assert (=> b!1210128 (= lt!549385 call!59549)))

(declare-fun e!687269 () Unit!40109)

(assert (=> b!1210128 (= e!687269 lt!549385)))

(declare-fun zeroValue!944 () V!46077)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14647 0))(
  ( (ValueCellFull!14647 (v!18064 V!46077)) (EmptyCell!14647) )
))
(declare-datatypes ((array!78213 0))(
  ( (array!78214 (arr!37743 (Array (_ BitVec 32) ValueCell!14647)) (size!38279 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78213)

(declare-fun minValue!944 () V!46077)

(declare-fun bm!59546 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5329 (array!78211 array!78213 (_ BitVec 32) (_ BitVec 32) V!46077 V!46077 (_ BitVec 32) Int) ListLongMap!17761)

(assert (=> bm!59546 (= call!59553 (getCurrentListMapNoExtraKeys!5329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210129 () Bool)

(declare-fun res!804165 () Bool)

(declare-fun e!687276 () Bool)

(assert (=> b!1210129 (=> (not res!804165) (not e!687276))))

(declare-fun lt!549396 () array!78211)

(assert (=> b!1210129 (= res!804165 (arrayNoDuplicates!0 lt!549396 #b00000000000000000000000000000000 Nil!26591))))

(declare-fun b!1210130 () Bool)

(declare-fun e!687278 () Unit!40109)

(declare-fun Unit!40111 () Unit!40109)

(assert (=> b!1210130 (= e!687278 Unit!40111)))

(declare-fun b!1210131 () Bool)

(declare-fun c!119195 () Bool)

(declare-fun lt!549384 () Bool)

(assert (=> b!1210131 (= c!119195 (and (not lt!549384) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687277 () Unit!40109)

(declare-fun e!687267 () Unit!40109)

(assert (=> b!1210131 (= e!687277 e!687267)))

(declare-fun b!1210132 () Bool)

(declare-fun e!687273 () Bool)

(declare-fun tp_is_empty!30713 () Bool)

(assert (=> b!1210132 (= e!687273 tp_is_empty!30713)))

(declare-fun b!1210133 () Bool)

(declare-fun e!687272 () Bool)

(declare-fun arrayContainsKey!0 (array!78211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210133 (= e!687272 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210134 () Bool)

(declare-fun Unit!40112 () Unit!40109)

(assert (=> b!1210134 (= e!687278 Unit!40112)))

(assert (=> b!1210134 (= lt!549384 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119194 () Bool)

(assert (=> b!1210134 (= c!119194 (and (not lt!549384) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549390 () Unit!40109)

(assert (=> b!1210134 (= lt!549390 e!687277)))

(declare-fun lt!549381 () Unit!40109)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!594 (array!78211 array!78213 (_ BitVec 32) (_ BitVec 32) V!46077 V!46077 (_ BitVec 64) (_ BitVec 32) Int) Unit!40109)

(assert (=> b!1210134 (= lt!549381 (lemmaListMapContainsThenArrayContainsFrom!594 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119197 () Bool)

(assert (=> b!1210134 (= c!119197 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804174 () Bool)

(declare-fun e!687271 () Bool)

(assert (=> b!1210134 (= res!804174 e!687271)))

(assert (=> b!1210134 (=> (not res!804174) (not e!687272))))

(assert (=> b!1210134 e!687272))

(declare-fun lt!549391 () Unit!40109)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78211 (_ BitVec 32) (_ BitVec 32)) Unit!40109)

(assert (=> b!1210134 (= lt!549391 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210134 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26591)))

(declare-fun lt!549397 () Unit!40109)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78211 (_ BitVec 64) (_ BitVec 32) List!26594) Unit!40109)

(assert (=> b!1210134 (= lt!549397 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26591))))

(assert (=> b!1210134 false))

(declare-fun b!1210135 () Bool)

(declare-fun res!804167 () Bool)

(assert (=> b!1210135 (=> (not res!804167) (not e!687265))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210135 (= res!804167 (= (select (arr!37742 _keys!1208) i!673) k!934))))

(declare-fun b!1210136 () Bool)

(declare-fun res!804166 () Bool)

(assert (=> b!1210136 (=> (not res!804166) (not e!687265))))

(assert (=> b!1210136 (= res!804166 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38278 _keys!1208))))))

(declare-fun bm!59547 () Bool)

(declare-fun call!59556 () ListLongMap!17761)

(declare-fun call!59551 () ListLongMap!17761)

(assert (=> bm!59547 (= call!59556 call!59551)))

(declare-fun b!1210137 () Bool)

(declare-fun e!687270 () Bool)

(assert (=> b!1210137 (= e!687270 (bvslt from!1455 (size!38278 _keys!1208)))))

(declare-fun lt!549386 () Unit!40109)

(assert (=> b!1210137 (= lt!549386 e!687278)))

(declare-fun c!119198 () Bool)

(declare-fun lt!549394 () ListLongMap!17761)

(declare-fun contains!6967 (ListLongMap!17761 (_ BitVec 64)) Bool)

(assert (=> b!1210137 (= c!119198 (contains!6967 lt!549394 k!934))))

(assert (=> b!1210137 (= lt!549394 (getCurrentListMapNoExtraKeys!5329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59548 () Bool)

(declare-fun call!59552 () Bool)

(assert (=> bm!59548 (= call!59554 call!59552)))

(declare-fun b!1210138 () Bool)

(declare-fun lt!549383 () Unit!40109)

(assert (=> b!1210138 (= e!687267 lt!549383)))

(assert (=> b!1210138 (= lt!549383 call!59549)))

(assert (=> b!1210138 call!59554))

(declare-fun bm!59549 () Bool)

(declare-fun lt!549380 () ListLongMap!17761)

(declare-fun +!4014 (ListLongMap!17761 tuple2!19792) ListLongMap!17761)

(assert (=> bm!59549 (= call!59551 (+!4014 (ite c!119194 lt!549380 lt!549394) (ite c!119194 (tuple2!19793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119195 (tuple2!19793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19793 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1210139 () Bool)

(declare-fun e!687275 () Bool)

(assert (=> b!1210139 (= e!687275 e!687270)))

(declare-fun res!804173 () Bool)

(assert (=> b!1210139 (=> res!804173 e!687270)))

(assert (=> b!1210139 (= res!804173 (not (= (select (arr!37742 _keys!1208) from!1455) k!934)))))

(assert (=> b!1210139 e!687264))

(declare-fun c!119196 () Bool)

(assert (=> b!1210139 (= c!119196 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549382 () Unit!40109)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 (array!78211 array!78213 (_ BitVec 32) (_ BitVec 32) V!46077 V!46077 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40109)

(assert (=> b!1210139 (= lt!549382 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1057 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59550 () Bool)

(declare-fun call!59550 () Unit!40109)

(assert (=> bm!59550 (= call!59549 call!59550)))

(declare-fun mapIsEmpty!47938 () Bool)

(declare-fun mapRes!47938 () Bool)

(assert (=> mapIsEmpty!47938 mapRes!47938))

(declare-fun b!1210140 () Bool)

(assert (=> b!1210140 (contains!6967 call!59551 k!934)))

(declare-fun lt!549392 () Unit!40109)

(declare-fun addStillContains!1042 (ListLongMap!17761 (_ BitVec 64) V!46077 (_ BitVec 64)) Unit!40109)

(assert (=> b!1210140 (= lt!549392 (addStillContains!1042 lt!549380 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1210140 call!59552))

(assert (=> b!1210140 (= lt!549380 (+!4014 lt!549394 (tuple2!19793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!549389 () Unit!40109)

(assert (=> b!1210140 (= lt!549389 call!59550)))

(assert (=> b!1210140 (= e!687277 lt!549392)))

(declare-fun b!1210141 () Bool)

(declare-fun res!804161 () Bool)

(assert (=> b!1210141 (=> (not res!804161) (not e!687265))))

(assert (=> b!1210141 (= res!804161 (and (= (size!38279 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38278 _keys!1208) (size!38279 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1210142 () Bool)

(declare-fun res!804169 () Bool)

(assert (=> b!1210142 (=> (not res!804169) (not e!687265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210142 (= res!804169 (validMask!0 mask!1564))))

(declare-fun b!1210143 () Bool)

(declare-fun e!687268 () Bool)

(assert (=> b!1210143 (= e!687268 tp_is_empty!30713)))

(declare-fun mapNonEmpty!47938 () Bool)

(declare-fun tp!91042 () Bool)

(assert (=> mapNonEmpty!47938 (= mapRes!47938 (and tp!91042 e!687268))))

(declare-fun mapKey!47938 () (_ BitVec 32))

(declare-fun mapValue!47938 () ValueCell!14647)

(declare-fun mapRest!47938 () (Array (_ BitVec 32) ValueCell!14647))

(assert (=> mapNonEmpty!47938 (= (arr!37743 _values!996) (store mapRest!47938 mapKey!47938 mapValue!47938))))

(declare-fun b!1210144 () Bool)

(declare-fun e!687263 () Bool)

(assert (=> b!1210144 (= e!687263 e!687275)))

(declare-fun res!804171 () Bool)

(assert (=> b!1210144 (=> res!804171 e!687275)))

(assert (=> b!1210144 (= res!804171 (not (= from!1455 i!673)))))

(declare-fun lt!549393 () ListLongMap!17761)

(declare-fun lt!549388 () array!78213)

(assert (=> b!1210144 (= lt!549393 (getCurrentListMapNoExtraKeys!5329 lt!549396 lt!549388 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3227 (Int (_ BitVec 64)) V!46077)

(assert (=> b!1210144 (= lt!549388 (array!78214 (store (arr!37743 _values!996) i!673 (ValueCellFull!14647 (dynLambda!3227 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38279 _values!996)))))

(declare-fun lt!549395 () ListLongMap!17761)

(assert (=> b!1210144 (= lt!549395 (getCurrentListMapNoExtraKeys!5329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210145 () Bool)

(assert (=> b!1210145 (= e!687276 (not e!687263))))

(declare-fun res!804164 () Bool)

(assert (=> b!1210145 (=> res!804164 e!687263)))

(assert (=> b!1210145 (= res!804164 (bvsgt from!1455 i!673))))

(assert (=> b!1210145 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549387 () Unit!40109)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78211 (_ BitVec 64) (_ BitVec 32)) Unit!40109)

(assert (=> b!1210145 (= lt!549387 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun bm!59551 () Bool)

(assert (=> bm!59551 (= call!59552 (contains!6967 (ite c!119194 lt!549380 call!59556) k!934))))

(declare-fun b!1210146 () Bool)

(declare-fun res!804163 () Bool)

(assert (=> b!1210146 (=> (not res!804163) (not e!687265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78211 (_ BitVec 32)) Bool)

(assert (=> b!1210146 (= res!804163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1210147 () Bool)

(assert (=> b!1210147 (= e!687264 (= call!59555 call!59553))))

(declare-fun b!1210148 () Bool)

(assert (=> b!1210148 (= e!687271 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210149 () Bool)

(declare-fun Unit!40113 () Unit!40109)

(assert (=> b!1210149 (= e!687269 Unit!40113)))

(declare-fun res!804162 () Bool)

(assert (=> start!101010 (=> (not res!804162) (not e!687265))))

(assert (=> start!101010 (= res!804162 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38278 _keys!1208))))))

(assert (=> start!101010 e!687265))

(assert (=> start!101010 tp_is_empty!30713))

(declare-fun array_inv!28750 (array!78211) Bool)

(assert (=> start!101010 (array_inv!28750 _keys!1208)))

(assert (=> start!101010 true))

(assert (=> start!101010 tp!91043))

(declare-fun e!687266 () Bool)

(declare-fun array_inv!28751 (array!78213) Bool)

(assert (=> start!101010 (and (array_inv!28751 _values!996) e!687266)))

(declare-fun bm!59552 () Bool)

(assert (=> bm!59552 (= call!59550 (addStillContains!1042 lt!549394 (ite (or c!119194 c!119195) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119194 c!119195) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1210150 () Bool)

(assert (=> b!1210150 (= e!687267 e!687269)))

(declare-fun c!119193 () Bool)

(assert (=> b!1210150 (= c!119193 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549384))))

(declare-fun bm!59553 () Bool)

(assert (=> bm!59553 (= call!59555 (getCurrentListMapNoExtraKeys!5329 lt!549396 lt!549388 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210151 () Bool)

(assert (=> b!1210151 (= e!687265 e!687276)))

(declare-fun res!804168 () Bool)

(assert (=> b!1210151 (=> (not res!804168) (not e!687276))))

(assert (=> b!1210151 (= res!804168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549396 mask!1564))))

(assert (=> b!1210151 (= lt!549396 (array!78212 (store (arr!37742 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38278 _keys!1208)))))

(declare-fun b!1210152 () Bool)

(assert (=> b!1210152 (= e!687271 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549384) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210153 () Bool)

(assert (=> b!1210153 (= e!687266 (and e!687273 mapRes!47938))))

(declare-fun condMapEmpty!47938 () Bool)

(declare-fun mapDefault!47938 () ValueCell!14647)

