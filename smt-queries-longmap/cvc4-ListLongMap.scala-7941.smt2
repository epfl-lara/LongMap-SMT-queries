; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98490 () Bool)

(assert start!98490)

(declare-fun b_free!24095 () Bool)

(declare-fun b_next!24095 () Bool)

(assert (=> start!98490 (= b_free!24095 (not b_next!24095))))

(declare-fun tp!84996 () Bool)

(declare-fun b_and!39039 () Bool)

(assert (=> start!98490 (= tp!84996 b_and!39039)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!507202 () Bool)

(declare-fun b!1139537 () Bool)

(declare-fun e!648360 () Bool)

(assert (=> b!1139537 (= e!648360 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507202) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!43293 0))(
  ( (V!43294 (val!14369 Int)) )
))
(declare-fun zeroValue!944 () V!43293)

(declare-fun bm!50679 () Bool)

(declare-fun c!111717 () Bool)

(declare-datatypes ((Unit!37350 0))(
  ( (Unit!37351) )
))
(declare-fun call!50686 () Unit!37350)

(declare-fun c!111716 () Bool)

(declare-fun minValue!944 () V!43293)

(declare-datatypes ((tuple2!18164 0))(
  ( (tuple2!18165 (_1!9093 (_ BitVec 64)) (_2!9093 V!43293)) )
))
(declare-datatypes ((List!24920 0))(
  ( (Nil!24917) (Cons!24916 (h!26125 tuple2!18164) (t!36007 List!24920)) )
))
(declare-datatypes ((ListLongMap!16133 0))(
  ( (ListLongMap!16134 (toList!8082 List!24920)) )
))
(declare-fun lt!507196 () ListLongMap!16133)

(declare-fun addStillContains!772 (ListLongMap!16133 (_ BitVec 64) V!43293 (_ BitVec 64)) Unit!37350)

(assert (=> bm!50679 (= call!50686 (addStillContains!772 lt!507196 (ite (or c!111716 c!111717) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111716 c!111717) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1139538 () Bool)

(declare-fun call!50688 () ListLongMap!16133)

(declare-fun contains!6617 (ListLongMap!16133 (_ BitVec 64)) Bool)

(assert (=> b!1139538 (contains!6617 call!50688 k!934)))

(declare-fun lt!507188 () Unit!37350)

(declare-fun lt!507197 () ListLongMap!16133)

(assert (=> b!1139538 (= lt!507188 (addStillContains!772 lt!507197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!50685 () Bool)

(assert (=> b!1139538 call!50685))

(declare-fun +!3514 (ListLongMap!16133 tuple2!18164) ListLongMap!16133)

(assert (=> b!1139538 (= lt!507197 (+!3514 lt!507196 (tuple2!18165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507204 () Unit!37350)

(assert (=> b!1139538 (= lt!507204 call!50686)))

(declare-fun e!648370 () Unit!37350)

(assert (=> b!1139538 (= e!648370 lt!507188)))

(declare-datatypes ((array!74109 0))(
  ( (array!74110 (arr!35705 (Array (_ BitVec 32) (_ BitVec 64))) (size!36241 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74109)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun call!50687 () ListLongMap!16133)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!50680 () Bool)

(declare-datatypes ((ValueCell!13603 0))(
  ( (ValueCellFull!13603 (v!17006 V!43293)) (EmptyCell!13603) )
))
(declare-datatypes ((array!74111 0))(
  ( (array!74112 (arr!35706 (Array (_ BitVec 32) ValueCell!13603)) (size!36242 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74111)

(declare-fun getCurrentListMapNoExtraKeys!4565 (array!74109 array!74111 (_ BitVec 32) (_ BitVec 32) V!43293 V!43293 (_ BitVec 32) Int) ListLongMap!16133)

(assert (=> bm!50680 (= call!50687 (getCurrentListMapNoExtraKeys!4565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139539 () Bool)

(assert (=> b!1139539 (= c!111717 (and (not lt!507202) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648366 () Unit!37350)

(assert (=> b!1139539 (= e!648370 e!648366)))

(declare-fun mapIsEmpty!44762 () Bool)

(declare-fun mapRes!44762 () Bool)

(assert (=> mapIsEmpty!44762 mapRes!44762))

(declare-fun bm!50681 () Bool)

(declare-fun call!50689 () Bool)

(assert (=> bm!50681 (= call!50689 call!50685)))

(declare-fun bm!50682 () Bool)

(declare-fun call!50683 () ListLongMap!16133)

(assert (=> bm!50682 (= call!50683 call!50688)))

(declare-fun mapNonEmpty!44762 () Bool)

(declare-fun tp!84995 () Bool)

(declare-fun e!648367 () Bool)

(assert (=> mapNonEmpty!44762 (= mapRes!44762 (and tp!84995 e!648367))))

(declare-fun mapValue!44762 () ValueCell!13603)

(declare-fun mapKey!44762 () (_ BitVec 32))

(declare-fun mapRest!44762 () (Array (_ BitVec 32) ValueCell!13603))

(assert (=> mapNonEmpty!44762 (= (arr!35706 _values!996) (store mapRest!44762 mapKey!44762 mapValue!44762))))

(declare-fun b!1139540 () Bool)

(declare-fun e!648375 () Unit!37350)

(declare-fun Unit!37352 () Unit!37350)

(assert (=> b!1139540 (= e!648375 Unit!37352)))

(declare-fun bm!50683 () Bool)

(declare-fun call!50684 () Unit!37350)

(assert (=> bm!50683 (= call!50684 call!50686)))

(declare-fun b!1139541 () Bool)

(declare-fun e!648363 () Bool)

(declare-fun e!648374 () Bool)

(assert (=> b!1139541 (= e!648363 (not e!648374))))

(declare-fun res!759970 () Bool)

(assert (=> b!1139541 (=> res!759970 e!648374)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139541 (= res!759970 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139541 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!507201 () Unit!37350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74109 (_ BitVec 64) (_ BitVec 32)) Unit!37350)

(assert (=> b!1139541 (= lt!507201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1139542 () Bool)

(declare-fun e!648362 () Bool)

(assert (=> b!1139542 (= e!648374 e!648362)))

(declare-fun res!759962 () Bool)

(assert (=> b!1139542 (=> res!759962 e!648362)))

(assert (=> b!1139542 (= res!759962 (not (= from!1455 i!673)))))

(declare-fun lt!507200 () ListLongMap!16133)

(declare-fun lt!507184 () array!74111)

(declare-fun lt!507192 () array!74109)

(assert (=> b!1139542 (= lt!507200 (getCurrentListMapNoExtraKeys!4565 lt!507192 lt!507184 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507189 () V!43293)

(assert (=> b!1139542 (= lt!507184 (array!74112 (store (arr!35706 _values!996) i!673 (ValueCellFull!13603 lt!507189)) (size!36242 _values!996)))))

(declare-fun dynLambda!2614 (Int (_ BitVec 64)) V!43293)

(assert (=> b!1139542 (= lt!507189 (dynLambda!2614 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507195 () ListLongMap!16133)

(assert (=> b!1139542 (= lt!507195 (getCurrentListMapNoExtraKeys!4565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139543 () Bool)

(declare-fun res!759967 () Bool)

(declare-fun e!648361 () Bool)

(assert (=> b!1139543 (=> (not res!759967) (not e!648361))))

(assert (=> b!1139543 (= res!759967 (= (select (arr!35705 _keys!1208) i!673) k!934))))

(declare-fun b!1139544 () Bool)

(declare-fun e!648373 () Bool)

(declare-fun call!50682 () ListLongMap!16133)

(assert (=> b!1139544 (= e!648373 (= call!50682 call!50687))))

(declare-fun b!1139536 () Bool)

(assert (=> b!1139536 (= e!648360 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!759959 () Bool)

(assert (=> start!98490 (=> (not res!759959) (not e!648361))))

(assert (=> start!98490 (= res!759959 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36241 _keys!1208))))))

(assert (=> start!98490 e!648361))

(declare-fun tp_is_empty!28625 () Bool)

(assert (=> start!98490 tp_is_empty!28625))

(declare-fun array_inv!27368 (array!74109) Bool)

(assert (=> start!98490 (array_inv!27368 _keys!1208)))

(assert (=> start!98490 true))

(assert (=> start!98490 tp!84996))

(declare-fun e!648364 () Bool)

(declare-fun array_inv!27369 (array!74111) Bool)

(assert (=> start!98490 (and (array_inv!27369 _values!996) e!648364)))

(declare-fun b!1139545 () Bool)

(declare-fun res!759966 () Bool)

(assert (=> b!1139545 (=> (not res!759966) (not e!648363))))

(declare-datatypes ((List!24921 0))(
  ( (Nil!24918) (Cons!24917 (h!26126 (_ BitVec 64)) (t!36008 List!24921)) )
))
(declare-fun arrayNoDuplicates!0 (array!74109 (_ BitVec 32) List!24921) Bool)

(assert (=> b!1139545 (= res!759966 (arrayNoDuplicates!0 lt!507192 #b00000000000000000000000000000000 Nil!24918))))

(declare-fun b!1139546 () Bool)

(declare-fun res!759969 () Bool)

(assert (=> b!1139546 (=> (not res!759969) (not e!648361))))

(assert (=> b!1139546 (= res!759969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24918))))

(declare-fun b!1139547 () Bool)

(declare-fun lt!507198 () Unit!37350)

(assert (=> b!1139547 (= e!648366 lt!507198)))

(assert (=> b!1139547 (= lt!507198 call!50684)))

(assert (=> b!1139547 call!50689))

(declare-fun b!1139548 () Bool)

(declare-fun e!648365 () Bool)

(assert (=> b!1139548 (= e!648362 e!648365)))

(declare-fun res!759971 () Bool)

(assert (=> b!1139548 (=> res!759971 e!648365)))

(assert (=> b!1139548 (= res!759971 (not (= (select (arr!35705 _keys!1208) from!1455) k!934)))))

(assert (=> b!1139548 e!648373))

(declare-fun c!111714 () Bool)

(assert (=> b!1139548 (= c!111714 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507191 () Unit!37350)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!480 (array!74109 array!74111 (_ BitVec 32) (_ BitVec 32) V!43293 V!43293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37350)

(assert (=> b!1139548 (= lt!507191 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139549 () Bool)

(assert (=> b!1139549 (= e!648361 e!648363)))

(declare-fun res!759968 () Bool)

(assert (=> b!1139549 (=> (not res!759968) (not e!648363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74109 (_ BitVec 32)) Bool)

(assert (=> b!1139549 (= res!759968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507192 mask!1564))))

(assert (=> b!1139549 (= lt!507192 (array!74110 (store (arr!35705 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36241 _keys!1208)))))

(declare-fun bm!50684 () Bool)

(assert (=> bm!50684 (= call!50688 (+!3514 (ite c!111716 lt!507197 lt!507196) (ite c!111716 (tuple2!18165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111717 (tuple2!18165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18165 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1139550 () Bool)

(declare-fun res!759963 () Bool)

(assert (=> b!1139550 (=> (not res!759963) (not e!648361))))

(assert (=> b!1139550 (= res!759963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1139551 () Bool)

(declare-fun e!648369 () Unit!37350)

(declare-fun Unit!37353 () Unit!37350)

(assert (=> b!1139551 (= e!648369 Unit!37353)))

(declare-fun bm!50685 () Bool)

(assert (=> bm!50685 (= call!50685 (contains!6617 (ite c!111716 lt!507197 call!50683) k!934))))

(declare-fun b!1139552 () Bool)

(declare-fun res!759960 () Bool)

(assert (=> b!1139552 (=> (not res!759960) (not e!648361))))

(assert (=> b!1139552 (= res!759960 (and (= (size!36242 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36241 _keys!1208) (size!36242 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139553 () Bool)

(declare-fun e!648368 () Bool)

(assert (=> b!1139553 (= e!648368 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139554 () Bool)

(declare-fun Unit!37354 () Unit!37350)

(assert (=> b!1139554 (= e!648375 Unit!37354)))

(assert (=> b!1139554 (= lt!507202 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139554 (= c!111716 (and (not lt!507202) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507185 () Unit!37350)

(assert (=> b!1139554 (= lt!507185 e!648370)))

(declare-fun lt!507194 () Unit!37350)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!373 (array!74109 array!74111 (_ BitVec 32) (_ BitVec 32) V!43293 V!43293 (_ BitVec 64) (_ BitVec 32) Int) Unit!37350)

(assert (=> b!1139554 (= lt!507194 (lemmaListMapContainsThenArrayContainsFrom!373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111713 () Bool)

(assert (=> b!1139554 (= c!111713 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759961 () Bool)

(assert (=> b!1139554 (= res!759961 e!648360)))

(assert (=> b!1139554 (=> (not res!759961) (not e!648368))))

(assert (=> b!1139554 e!648368))

(declare-fun lt!507186 () Unit!37350)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74109 (_ BitVec 32) (_ BitVec 32)) Unit!37350)

(assert (=> b!1139554 (= lt!507186 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139554 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24918)))

(declare-fun lt!507190 () Unit!37350)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74109 (_ BitVec 64) (_ BitVec 32) List!24921) Unit!37350)

(assert (=> b!1139554 (= lt!507190 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!24918))))

(assert (=> b!1139554 false))

(declare-fun b!1139555 () Bool)

(assert (=> b!1139555 call!50689))

(declare-fun lt!507187 () Unit!37350)

(assert (=> b!1139555 (= lt!507187 call!50684)))

(assert (=> b!1139555 (= e!648369 lt!507187)))

(declare-fun b!1139556 () Bool)

(declare-fun -!1233 (ListLongMap!16133 (_ BitVec 64)) ListLongMap!16133)

(assert (=> b!1139556 (= e!648373 (= call!50682 (-!1233 call!50687 k!934)))))

(declare-fun b!1139557 () Bool)

(assert (=> b!1139557 (= e!648367 tp_is_empty!28625)))

(declare-fun b!1139558 () Bool)

(assert (=> b!1139558 (= e!648366 e!648369)))

(declare-fun c!111715 () Bool)

(assert (=> b!1139558 (= c!111715 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507202))))

(declare-fun b!1139559 () Bool)

(declare-fun res!759965 () Bool)

(assert (=> b!1139559 (=> (not res!759965) (not e!648361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139559 (= res!759965 (validMask!0 mask!1564))))

(declare-fun b!1139560 () Bool)

(assert (=> b!1139560 (= e!648365 true)))

(declare-fun lt!507199 () V!43293)

(assert (=> b!1139560 (= (-!1233 (+!3514 lt!507196 (tuple2!18165 (select (arr!35705 _keys!1208) from!1455) lt!507199)) (select (arr!35705 _keys!1208) from!1455)) lt!507196)))

(declare-fun lt!507193 () Unit!37350)

(declare-fun addThenRemoveForNewKeyIsSame!88 (ListLongMap!16133 (_ BitVec 64) V!43293) Unit!37350)

(assert (=> b!1139560 (= lt!507193 (addThenRemoveForNewKeyIsSame!88 lt!507196 (select (arr!35705 _keys!1208) from!1455) lt!507199))))

(declare-fun get!18132 (ValueCell!13603 V!43293) V!43293)

(assert (=> b!1139560 (= lt!507199 (get!18132 (select (arr!35706 _values!996) from!1455) lt!507189))))

(declare-fun lt!507203 () Unit!37350)

(assert (=> b!1139560 (= lt!507203 e!648375)))

(declare-fun c!111718 () Bool)

(assert (=> b!1139560 (= c!111718 (contains!6617 lt!507196 k!934))))

(assert (=> b!1139560 (= lt!507196 (getCurrentListMapNoExtraKeys!4565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139561 () Bool)

(declare-fun res!759964 () Bool)

(assert (=> b!1139561 (=> (not res!759964) (not e!648361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139561 (= res!759964 (validKeyInArray!0 k!934))))

(declare-fun b!1139562 () Bool)

(declare-fun e!648372 () Bool)

(assert (=> b!1139562 (= e!648364 (and e!648372 mapRes!44762))))

(declare-fun condMapEmpty!44762 () Bool)

(declare-fun mapDefault!44762 () ValueCell!13603)

