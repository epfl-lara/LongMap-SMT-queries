; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99006 () Bool)

(assert start!99006)

(declare-fun b_free!24611 () Bool)

(declare-fun b_next!24611 () Bool)

(assert (=> start!99006 (= b_free!24611 (not b_next!24611))))

(declare-fun tp!86544 () Bool)

(declare-fun b_and!40071 () Bool)

(assert (=> start!99006 (= tp!86544 b_and!40071)))

(declare-fun bm!56871 () Bool)

(declare-datatypes ((V!43981 0))(
  ( (V!43982 (val!14627 Int)) )
))
(declare-datatypes ((tuple2!18650 0))(
  ( (tuple2!18651 (_1!9336 (_ BitVec 64)) (_2!9336 V!43981)) )
))
(declare-datatypes ((List!25383 0))(
  ( (Nil!25380) (Cons!25379 (h!26588 tuple2!18650) (t!36986 List!25383)) )
))
(declare-datatypes ((ListLongMap!16619 0))(
  ( (ListLongMap!16620 (toList!8325 List!25383)) )
))
(declare-fun call!56877 () ListLongMap!16619)

(declare-fun call!56875 () ListLongMap!16619)

(assert (=> bm!56871 (= call!56877 call!56875)))

(declare-fun b!1163118 () Bool)

(declare-fun res!771420 () Bool)

(declare-fun e!661380 () Bool)

(assert (=> b!1163118 (=> (not res!771420) (not e!661380))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1163118 (= res!771420 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45536 () Bool)

(declare-fun mapRes!45536 () Bool)

(declare-fun tp!86543 () Bool)

(declare-fun e!661368 () Bool)

(assert (=> mapNonEmpty!45536 (= mapRes!45536 (and tp!86543 e!661368))))

(declare-datatypes ((ValueCell!13861 0))(
  ( (ValueCellFull!13861 (v!17264 V!43981)) (EmptyCell!13861) )
))
(declare-fun mapValue!45536 () ValueCell!13861)

(declare-datatypes ((array!75121 0))(
  ( (array!75122 (arr!36211 (Array (_ BitVec 32) ValueCell!13861)) (size!36747 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75121)

(declare-fun mapKey!45536 () (_ BitVec 32))

(declare-fun mapRest!45536 () (Array (_ BitVec 32) ValueCell!13861))

(assert (=> mapNonEmpty!45536 (= (arr!36211 _values!996) (store mapRest!45536 mapKey!45536 mapValue!45536))))

(declare-fun b!1163119 () Bool)

(declare-datatypes ((Unit!38383 0))(
  ( (Unit!38384) )
))
(declare-fun e!661379 () Unit!38383)

(declare-fun e!661369 () Unit!38383)

(assert (=> b!1163119 (= e!661379 e!661369)))

(declare-fun c!116357 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!523908 () Bool)

(assert (=> b!1163119 (= c!116357 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523908))))

(declare-fun b!1163120 () Bool)

(declare-fun res!771426 () Bool)

(assert (=> b!1163120 (=> (not res!771426) (not e!661380))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1163120 (= res!771426 (validKeyInArray!0 k!934))))

(declare-fun bm!56872 () Bool)

(declare-fun call!56880 () Unit!38383)

(declare-fun call!56881 () Unit!38383)

(assert (=> bm!56872 (= call!56880 call!56881)))

(declare-fun b!1163121 () Bool)

(declare-fun res!771417 () Bool)

(assert (=> b!1163121 (=> (not res!771417) (not e!661380))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75123 0))(
  ( (array!75124 (arr!36212 (Array (_ BitVec 32) (_ BitVec 64))) (size!36748 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75123)

(assert (=> b!1163121 (= res!771417 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36748 _keys!1208))))))

(declare-fun call!56878 () Bool)

(declare-fun lt!523896 () ListLongMap!16619)

(declare-fun bm!56873 () Bool)

(declare-fun c!116358 () Bool)

(declare-fun contains!6829 (ListLongMap!16619 (_ BitVec 64)) Bool)

(assert (=> bm!56873 (= call!56878 (contains!6829 (ite c!116358 lt!523896 call!56877) k!934))))

(declare-fun b!1163122 () Bool)

(declare-fun e!661371 () Bool)

(declare-fun e!661370 () Bool)

(assert (=> b!1163122 (= e!661371 e!661370)))

(declare-fun res!771414 () Bool)

(assert (=> b!1163122 (=> res!771414 e!661370)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1163122 (= res!771414 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43981)

(declare-fun lt!523907 () ListLongMap!16619)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!523917 () array!75121)

(declare-fun minValue!944 () V!43981)

(declare-fun lt!523910 () array!75123)

(declare-fun getCurrentListMapNoExtraKeys!4789 (array!75123 array!75121 (_ BitVec 32) (_ BitVec 32) V!43981 V!43981 (_ BitVec 32) Int) ListLongMap!16619)

(assert (=> b!1163122 (= lt!523907 (getCurrentListMapNoExtraKeys!4789 lt!523910 lt!523917 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523905 () V!43981)

(assert (=> b!1163122 (= lt!523917 (array!75122 (store (arr!36211 _values!996) i!673 (ValueCellFull!13861 lt!523905)) (size!36747 _values!996)))))

(declare-fun dynLambda!2783 (Int (_ BitVec 64)) V!43981)

(assert (=> b!1163122 (= lt!523905 (dynLambda!2783 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523900 () ListLongMap!16619)

(assert (=> b!1163122 (= lt!523900 (getCurrentListMapNoExtraKeys!4789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1163123 () Bool)

(declare-fun res!771424 () Bool)

(assert (=> b!1163123 (=> (not res!771424) (not e!661380))))

(assert (=> b!1163123 (= res!771424 (= (select (arr!36212 _keys!1208) i!673) k!934))))

(declare-fun call!56876 () ListLongMap!16619)

(declare-fun bm!56874 () Bool)

(assert (=> bm!56874 (= call!56876 (getCurrentListMapNoExtraKeys!4789 lt!523910 lt!523917 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163125 () Bool)

(declare-fun e!661365 () Bool)

(assert (=> b!1163125 (= e!661370 e!661365)))

(declare-fun res!771422 () Bool)

(assert (=> b!1163125 (=> res!771422 e!661365)))

(assert (=> b!1163125 (= res!771422 (not (= (select (arr!36212 _keys!1208) from!1455) k!934)))))

(declare-fun e!661378 () Bool)

(assert (=> b!1163125 e!661378))

(declare-fun c!116361 () Bool)

(assert (=> b!1163125 (= c!116361 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!523912 () Unit!38383)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!658 (array!75123 array!75121 (_ BitVec 32) (_ BitVec 32) V!43981 V!43981 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38383)

(assert (=> b!1163125 (= lt!523912 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!658 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1163126 () Bool)

(declare-fun e!661372 () Bool)

(assert (=> b!1163126 (= e!661380 e!661372)))

(declare-fun res!771423 () Bool)

(assert (=> b!1163126 (=> (not res!771423) (not e!661372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75123 (_ BitVec 32)) Bool)

(assert (=> b!1163126 (= res!771423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523910 mask!1564))))

(assert (=> b!1163126 (= lt!523910 (array!75124 (store (arr!36212 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36748 _keys!1208)))))

(declare-fun e!661364 () Bool)

(declare-fun b!1163127 () Bool)

(declare-fun lt!523915 () ListLongMap!16619)

(assert (=> b!1163127 (= e!661364 (= lt!523915 (getCurrentListMapNoExtraKeys!4789 lt!523910 lt!523917 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1163128 () Bool)

(declare-fun tp_is_empty!29141 () Bool)

(assert (=> b!1163128 (= e!661368 tp_is_empty!29141)))

(declare-fun b!1163129 () Bool)

(declare-fun e!661373 () Unit!38383)

(declare-fun Unit!38385 () Unit!38383)

(assert (=> b!1163129 (= e!661373 Unit!38385)))

(assert (=> b!1163129 (= lt!523908 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1163129 (= c!116358 (and (not lt!523908) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523914 () Unit!38383)

(declare-fun e!661375 () Unit!38383)

(assert (=> b!1163129 (= lt!523914 e!661375)))

(declare-fun lt!523901 () Unit!38383)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!554 (array!75123 array!75121 (_ BitVec 32) (_ BitVec 32) V!43981 V!43981 (_ BitVec 64) (_ BitVec 32) Int) Unit!38383)

(assert (=> b!1163129 (= lt!523901 (lemmaListMapContainsThenArrayContainsFrom!554 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116359 () Bool)

(assert (=> b!1163129 (= c!116359 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771428 () Bool)

(declare-fun e!661366 () Bool)

(assert (=> b!1163129 (= res!771428 e!661366)))

(declare-fun e!661377 () Bool)

(assert (=> b!1163129 (=> (not res!771428) (not e!661377))))

(assert (=> b!1163129 e!661377))

(declare-fun lt!523913 () Unit!38383)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75123 (_ BitVec 32) (_ BitVec 32)) Unit!38383)

(assert (=> b!1163129 (= lt!523913 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25384 0))(
  ( (Nil!25381) (Cons!25380 (h!26589 (_ BitVec 64)) (t!36987 List!25384)) )
))
(declare-fun arrayNoDuplicates!0 (array!75123 (_ BitVec 32) List!25384) Bool)

(assert (=> b!1163129 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25381)))

(declare-fun lt!523916 () Unit!38383)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75123 (_ BitVec 64) (_ BitVec 32) List!25384) Unit!38383)

(assert (=> b!1163129 (= lt!523916 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25381))))

(assert (=> b!1163129 false))

(declare-fun bm!56875 () Bool)

(declare-fun c!116360 () Bool)

(declare-fun lt!523909 () ListLongMap!16619)

(declare-fun addStillContains!969 (ListLongMap!16619 (_ BitVec 64) V!43981 (_ BitVec 64)) Unit!38383)

(assert (=> bm!56875 (= call!56881 (addStillContains!969 lt!523909 (ite (or c!116358 c!116360) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116358 c!116360) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1163130 () Bool)

(declare-fun arrayContainsKey!0 (array!75123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1163130 (= e!661366 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1163131 () Bool)

(declare-fun Unit!38386 () Unit!38383)

(assert (=> b!1163131 (= e!661369 Unit!38386)))

(declare-fun b!1163132 () Bool)

(declare-fun e!661376 () Bool)

(declare-fun e!661367 () Bool)

(assert (=> b!1163132 (= e!661376 (and e!661367 mapRes!45536))))

(declare-fun condMapEmpty!45536 () Bool)

(declare-fun mapDefault!45536 () ValueCell!13861)

