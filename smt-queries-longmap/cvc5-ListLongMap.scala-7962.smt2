; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98612 () Bool)

(assert start!98612)

(declare-fun b_free!24217 () Bool)

(declare-fun b_next!24217 () Bool)

(assert (=> start!98612 (= b_free!24217 (not b_next!24217))))

(declare-fun tp!85361 () Bool)

(declare-fun b_and!39283 () Bool)

(assert (=> start!98612 (= tp!85361 b_and!39283)))

(declare-datatypes ((V!43457 0))(
  ( (V!43458 (val!14430 Int)) )
))
(declare-datatypes ((tuple2!18274 0))(
  ( (tuple2!18275 (_1!9148 (_ BitVec 64)) (_2!9148 V!43457)) )
))
(declare-datatypes ((List!25027 0))(
  ( (Nil!25024) (Cons!25023 (h!26232 tuple2!18274) (t!36236 List!25027)) )
))
(declare-datatypes ((ListLongMap!16243 0))(
  ( (ListLongMap!16244 (toList!8137 List!25027)) )
))
(declare-fun lt!511039 () ListLongMap!16243)

(declare-fun call!52152 () ListLongMap!16243)

(declare-fun call!52148 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!52143 () Bool)

(declare-fun c!112813 () Bool)

(declare-fun contains!6666 (ListLongMap!16243 (_ BitVec 64)) Bool)

(assert (=> bm!52143 (= call!52148 (contains!6666 (ite c!112813 lt!511039 call!52152) k!934))))

(declare-fun mapNonEmpty!44945 () Bool)

(declare-fun mapRes!44945 () Bool)

(declare-fun tp!85362 () Bool)

(declare-fun e!651318 () Bool)

(assert (=> mapNonEmpty!44945 (= mapRes!44945 (and tp!85362 e!651318))))

(declare-datatypes ((ValueCell!13664 0))(
  ( (ValueCellFull!13664 (v!17067 V!43457)) (EmptyCell!13664) )
))
(declare-fun mapValue!44945 () ValueCell!13664)

(declare-datatypes ((array!74345 0))(
  ( (array!74346 (arr!35823 (Array (_ BitVec 32) ValueCell!13664)) (size!36359 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74345)

(declare-fun mapRest!44945 () (Array (_ BitVec 32) ValueCell!13664))

(declare-fun mapKey!44945 () (_ BitVec 32))

(assert (=> mapNonEmpty!44945 (= (arr!35823 _values!996) (store mapRest!44945 mapKey!44945 mapValue!44945))))

(declare-fun bm!52144 () Bool)

(declare-fun call!52146 () ListLongMap!16243)

(assert (=> bm!52144 (= call!52152 call!52146)))

(declare-fun b!1144994 () Bool)

(declare-fun e!651322 () Bool)

(assert (=> b!1144994 (= e!651322 true)))

(declare-fun e!651332 () Bool)

(assert (=> b!1144994 e!651332))

(declare-fun res!762553 () Bool)

(assert (=> b!1144994 (=> (not res!762553) (not e!651332))))

(declare-datatypes ((array!74347 0))(
  ( (array!74348 (arr!35824 (Array (_ BitVec 32) (_ BitVec 64))) (size!36360 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74347)

(declare-fun lt!511035 () ListLongMap!16243)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!511041 () V!43457)

(declare-fun -!1279 (ListLongMap!16243 (_ BitVec 64)) ListLongMap!16243)

(declare-fun +!3563 (ListLongMap!16243 tuple2!18274) ListLongMap!16243)

(assert (=> b!1144994 (= res!762553 (= (-!1279 (+!3563 lt!511035 (tuple2!18275 (select (arr!35824 _keys!1208) from!1455) lt!511041)) (select (arr!35824 _keys!1208) from!1455)) lt!511035))))

(declare-datatypes ((Unit!37584 0))(
  ( (Unit!37585) )
))
(declare-fun lt!511044 () Unit!37584)

(declare-fun addThenRemoveForNewKeyIsSame!129 (ListLongMap!16243 (_ BitVec 64) V!43457) Unit!37584)

(assert (=> b!1144994 (= lt!511044 (addThenRemoveForNewKeyIsSame!129 lt!511035 (select (arr!35824 _keys!1208) from!1455) lt!511041))))

(declare-fun lt!511037 () V!43457)

(declare-fun get!18215 (ValueCell!13664 V!43457) V!43457)

(assert (=> b!1144994 (= lt!511041 (get!18215 (select (arr!35823 _values!996) from!1455) lt!511037))))

(declare-fun lt!511036 () Unit!37584)

(declare-fun e!651328 () Unit!37584)

(assert (=> b!1144994 (= lt!511036 e!651328)))

(declare-fun c!112812 () Bool)

(assert (=> b!1144994 (= c!112812 (contains!6666 lt!511035 k!934))))

(declare-fun zeroValue!944 () V!43457)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43457)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4614 (array!74347 array!74345 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 32) Int) ListLongMap!16243)

(assert (=> b!1144994 (= lt!511035 (getCurrentListMapNoExtraKeys!4614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144995 () Bool)

(declare-fun call!52153 () Bool)

(assert (=> b!1144995 call!52153))

(declare-fun lt!511028 () Unit!37584)

(declare-fun call!52147 () Unit!37584)

(assert (=> b!1144995 (= lt!511028 call!52147)))

(declare-fun e!651329 () Unit!37584)

(assert (=> b!1144995 (= e!651329 lt!511028)))

(declare-fun c!112814 () Bool)

(declare-fun bm!52145 () Bool)

(declare-fun call!52149 () Unit!37584)

(declare-fun addStillContains!818 (ListLongMap!16243 (_ BitVec 64) V!43457 (_ BitVec 64)) Unit!37584)

(assert (=> bm!52145 (= call!52149 (addStillContains!818 lt!511035 (ite (or c!112813 c!112814) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112813 c!112814) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1144996 () Bool)

(declare-fun Unit!37586 () Unit!37584)

(assert (=> b!1144996 (= e!651328 Unit!37586)))

(declare-fun lt!511034 () Bool)

(assert (=> b!1144996 (= lt!511034 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144996 (= c!112813 (and (not lt!511034) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!511043 () Unit!37584)

(declare-fun e!651319 () Unit!37584)

(assert (=> b!1144996 (= lt!511043 e!651319)))

(declare-fun lt!511038 () Unit!37584)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!412 (array!74347 array!74345 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 64) (_ BitVec 32) Int) Unit!37584)

(assert (=> b!1144996 (= lt!511038 (lemmaListMapContainsThenArrayContainsFrom!412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112816 () Bool)

(assert (=> b!1144996 (= c!112816 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762550 () Bool)

(declare-fun e!651330 () Bool)

(assert (=> b!1144996 (= res!762550 e!651330)))

(declare-fun e!651327 () Bool)

(assert (=> b!1144996 (=> (not res!762550) (not e!651327))))

(assert (=> b!1144996 e!651327))

(declare-fun lt!511027 () Unit!37584)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74347 (_ BitVec 32) (_ BitVec 32)) Unit!37584)

(assert (=> b!1144996 (= lt!511027 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25028 0))(
  ( (Nil!25025) (Cons!25024 (h!26233 (_ BitVec 64)) (t!36237 List!25028)) )
))
(declare-fun arrayNoDuplicates!0 (array!74347 (_ BitVec 32) List!25028) Bool)

(assert (=> b!1144996 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25025)))

(declare-fun lt!511047 () Unit!37584)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74347 (_ BitVec 64) (_ BitVec 32) List!25028) Unit!37584)

(assert (=> b!1144996 (= lt!511047 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25025))))

(assert (=> b!1144996 false))

(declare-fun b!1144997 () Bool)

(declare-fun Unit!37587 () Unit!37584)

(assert (=> b!1144997 (= e!651329 Unit!37587)))

(declare-fun call!52150 () ListLongMap!16243)

(declare-fun bm!52146 () Bool)

(assert (=> bm!52146 (= call!52150 (getCurrentListMapNoExtraKeys!4614 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144998 () Bool)

(declare-fun e!651326 () Bool)

(declare-fun e!651323 () Bool)

(assert (=> b!1144998 (= e!651326 e!651323)))

(declare-fun res!762551 () Bool)

(assert (=> b!1144998 (=> (not res!762551) (not e!651323))))

(declare-fun lt!511040 () array!74347)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74347 (_ BitVec 32)) Bool)

(assert (=> b!1144998 (= res!762551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!511040 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144998 (= lt!511040 (array!74348 (store (arr!35824 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36360 _keys!1208)))))

(declare-fun b!1144999 () Bool)

(declare-fun arrayContainsKey!0 (array!74347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144999 (= e!651330 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1145000 () Bool)

(assert (=> b!1145000 (contains!6666 call!52146 k!934)))

(declare-fun lt!511042 () Unit!37584)

(assert (=> b!1145000 (= lt!511042 (addStillContains!818 lt!511039 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1145000 call!52148))

(assert (=> b!1145000 (= lt!511039 (+!3563 lt!511035 (tuple2!18275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!511045 () Unit!37584)

(assert (=> b!1145000 (= lt!511045 call!52149)))

(assert (=> b!1145000 (= e!651319 lt!511042)))

(declare-fun b!1145001 () Bool)

(assert (=> b!1145001 (= e!651327 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!762556 () Bool)

(assert (=> start!98612 (=> (not res!762556) (not e!651326))))

(assert (=> start!98612 (= res!762556 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36360 _keys!1208))))))

(assert (=> start!98612 e!651326))

(declare-fun tp_is_empty!28747 () Bool)

(assert (=> start!98612 tp_is_empty!28747))

(declare-fun array_inv!27446 (array!74347) Bool)

(assert (=> start!98612 (array_inv!27446 _keys!1208)))

(assert (=> start!98612 true))

(assert (=> start!98612 tp!85361))

(declare-fun e!651317 () Bool)

(declare-fun array_inv!27447 (array!74345) Bool)

(assert (=> start!98612 (and (array_inv!27447 _values!996) e!651317)))

(declare-fun b!1145002 () Bool)

(declare-fun e!651331 () Bool)

(assert (=> b!1145002 (= e!651317 (and e!651331 mapRes!44945))))

(declare-fun condMapEmpty!44945 () Bool)

(declare-fun mapDefault!44945 () ValueCell!13664)

