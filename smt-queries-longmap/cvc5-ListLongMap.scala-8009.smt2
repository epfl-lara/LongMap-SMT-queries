; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98894 () Bool)

(assert start!98894)

(declare-fun b_free!24499 () Bool)

(declare-fun b_next!24499 () Bool)

(assert (=> start!98894 (= b_free!24499 (not b_next!24499))))

(declare-fun tp!86208 () Bool)

(declare-fun b_and!39847 () Bool)

(assert (=> start!98894 (= tp!86208 b_and!39847)))

(declare-datatypes ((V!43833 0))(
  ( (V!43834 (val!14571 Int)) )
))
(declare-fun zeroValue!944 () V!43833)

(declare-datatypes ((Unit!38152 0))(
  ( (Unit!38153) )
))
(declare-fun call!55532 () Unit!38152)

(declare-datatypes ((tuple2!18544 0))(
  ( (tuple2!18545 (_1!9283 (_ BitVec 64)) (_2!9283 V!43833)) )
))
(declare-datatypes ((List!25284 0))(
  ( (Nil!25281) (Cons!25280 (h!26489 tuple2!18544) (t!36775 List!25284)) )
))
(declare-datatypes ((ListLongMap!16513 0))(
  ( (ListLongMap!16514 (toList!8272 List!25284)) )
))
(declare-fun lt!520216 () ListLongMap!16513)

(declare-fun bm!55527 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!115351 () Bool)

(declare-fun c!115352 () Bool)

(declare-fun minValue!944 () V!43833)

(declare-fun addStillContains!924 (ListLongMap!16513 (_ BitVec 64) V!43833 (_ BitVec 64)) Unit!38152)

(assert (=> bm!55527 (= call!55532 (addStillContains!924 lt!520216 (ite (or c!115352 c!115351) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115352 c!115351) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1157967 () Bool)

(declare-fun call!55533 () ListLongMap!16513)

(declare-fun contains!6783 (ListLongMap!16513 (_ BitVec 64)) Bool)

(assert (=> b!1157967 (contains!6783 call!55533 k!934)))

(declare-fun lt!520215 () Unit!38152)

(declare-fun lt!520206 () ListLongMap!16513)

(assert (=> b!1157967 (= lt!520215 (addStillContains!924 lt!520206 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!55531 () Bool)

(assert (=> b!1157967 call!55531))

(declare-fun +!3682 (ListLongMap!16513 tuple2!18544) ListLongMap!16513)

(assert (=> b!1157967 (= lt!520206 (+!3682 lt!520216 (tuple2!18545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520207 () Unit!38152)

(assert (=> b!1157967 (= lt!520207 call!55532)))

(declare-fun e!658522 () Unit!38152)

(assert (=> b!1157967 (= e!658522 lt!520215)))

(declare-fun b!1157968 () Bool)

(declare-fun e!658516 () Unit!38152)

(declare-fun Unit!38154 () Unit!38152)

(assert (=> b!1157968 (= e!658516 Unit!38154)))

(declare-fun lt!520217 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1157968 (= lt!520217 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157968 (= c!115352 (and (not lt!520217) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520202 () Unit!38152)

(assert (=> b!1157968 (= lt!520202 e!658522)))

(declare-datatypes ((array!74901 0))(
  ( (array!74902 (arr!36101 (Array (_ BitVec 32) (_ BitVec 64))) (size!36637 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74901)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13805 0))(
  ( (ValueCellFull!13805 (v!17208 V!43833)) (EmptyCell!13805) )
))
(declare-datatypes ((array!74903 0))(
  ( (array!74904 (arr!36102 (Array (_ BitVec 32) ValueCell!13805)) (size!36638 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74903)

(declare-fun lt!520203 () Unit!38152)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!510 (array!74901 array!74903 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 64) (_ BitVec 32) Int) Unit!38152)

(assert (=> b!1157968 (= lt!520203 (lemmaListMapContainsThenArrayContainsFrom!510 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115354 () Bool)

(assert (=> b!1157968 (= c!115354 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768896 () Bool)

(declare-fun e!658518 () Bool)

(assert (=> b!1157968 (= res!768896 e!658518)))

(declare-fun e!658515 () Bool)

(assert (=> b!1157968 (=> (not res!768896) (not e!658515))))

(assert (=> b!1157968 e!658515))

(declare-fun lt!520214 () Unit!38152)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74901 (_ BitVec 32) (_ BitVec 32)) Unit!38152)

(assert (=> b!1157968 (= lt!520214 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25285 0))(
  ( (Nil!25282) (Cons!25281 (h!26490 (_ BitVec 64)) (t!36776 List!25285)) )
))
(declare-fun arrayNoDuplicates!0 (array!74901 (_ BitVec 32) List!25285) Bool)

(assert (=> b!1157968 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25282)))

(declare-fun lt!520210 () Unit!38152)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74901 (_ BitVec 64) (_ BitVec 32) List!25285) Unit!38152)

(assert (=> b!1157968 (= lt!520210 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25282))))

(assert (=> b!1157968 false))

(declare-fun bm!55528 () Bool)

(declare-fun call!55530 () Unit!38152)

(assert (=> bm!55528 (= call!55530 call!55532)))

(declare-fun b!1157969 () Bool)

(declare-fun Unit!38155 () Unit!38152)

(assert (=> b!1157969 (= e!658516 Unit!38155)))

(declare-fun b!1157970 () Bool)

(declare-fun e!658510 () Bool)

(declare-fun e!658520 () Bool)

(assert (=> b!1157970 (= e!658510 (not e!658520))))

(declare-fun res!768905 () Bool)

(assert (=> b!1157970 (=> res!768905 e!658520)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157970 (= res!768905 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157970 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!520213 () Unit!38152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74901 (_ BitVec 64) (_ BitVec 32)) Unit!38152)

(assert (=> b!1157970 (= lt!520213 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1157971 () Bool)

(declare-fun res!768902 () Bool)

(declare-fun e!658523 () Bool)

(assert (=> b!1157971 (=> (not res!768902) (not e!658523))))

(assert (=> b!1157971 (= res!768902 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36637 _keys!1208))))))

(declare-fun b!1157972 () Bool)

(declare-fun res!768907 () Bool)

(assert (=> b!1157972 (=> (not res!768907) (not e!658510))))

(declare-fun lt!520204 () array!74901)

(assert (=> b!1157972 (= res!768907 (arrayNoDuplicates!0 lt!520204 #b00000000000000000000000000000000 Nil!25282))))

(declare-fun b!1157973 () Bool)

(declare-fun res!768899 () Bool)

(assert (=> b!1157973 (=> (not res!768899) (not e!658523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157973 (= res!768899 (validMask!0 mask!1564))))

(declare-fun b!1157974 () Bool)

(declare-fun call!55536 () Bool)

(assert (=> b!1157974 call!55536))

(declare-fun lt!520212 () Unit!38152)

(assert (=> b!1157974 (= lt!520212 call!55530)))

(declare-fun e!658513 () Unit!38152)

(assert (=> b!1157974 (= e!658513 lt!520212)))

(declare-fun b!1157975 () Bool)

(declare-fun e!658517 () Unit!38152)

(assert (=> b!1157975 (= e!658517 e!658513)))

(declare-fun c!115353 () Bool)

(assert (=> b!1157975 (= c!115353 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520217))))

(declare-fun bm!55529 () Bool)

(assert (=> bm!55529 (= call!55533 (+!3682 (ite c!115352 lt!520206 lt!520216) (ite c!115352 (tuple2!18545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115351 (tuple2!18545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18545 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1157976 () Bool)

(declare-fun e!658521 () Bool)

(declare-fun tp_is_empty!29029 () Bool)

(assert (=> b!1157976 (= e!658521 tp_is_empty!29029)))

(declare-fun b!1157977 () Bool)

(assert (=> b!1157977 (= e!658523 e!658510)))

(declare-fun res!768897 () Bool)

(assert (=> b!1157977 (=> (not res!768897) (not e!658510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74901 (_ BitVec 32)) Bool)

(assert (=> b!1157977 (= res!768897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520204 mask!1564))))

(assert (=> b!1157977 (= lt!520204 (array!74902 (store (arr!36101 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36637 _keys!1208)))))

(declare-fun b!1157978 () Bool)

(declare-fun res!768901 () Bool)

(assert (=> b!1157978 (=> (not res!768901) (not e!658523))))

(assert (=> b!1157978 (= res!768901 (and (= (size!36638 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36637 _keys!1208) (size!36638 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157979 () Bool)

(declare-fun e!658509 () Bool)

(declare-fun e!658512 () Bool)

(assert (=> b!1157979 (= e!658509 e!658512)))

(declare-fun res!768908 () Bool)

(assert (=> b!1157979 (=> res!768908 e!658512)))

(assert (=> b!1157979 (= res!768908 (not (= (select (arr!36101 _keys!1208) from!1455) k!934)))))

(declare-fun e!658524 () Bool)

(assert (=> b!1157979 e!658524))

(declare-fun c!115350 () Bool)

(assert (=> b!1157979 (= c!115350 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520208 () Unit!38152)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!618 (array!74901 array!74903 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38152)

(assert (=> b!1157979 (= lt!520208 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!618 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157980 () Bool)

(declare-fun call!55534 () ListLongMap!16513)

(declare-fun call!55537 () ListLongMap!16513)

(declare-fun -!1386 (ListLongMap!16513 (_ BitVec 64)) ListLongMap!16513)

(assert (=> b!1157980 (= e!658524 (= call!55534 (-!1386 call!55537 k!934)))))

(declare-fun b!1157981 () Bool)

(declare-fun Unit!38156 () Unit!38152)

(assert (=> b!1157981 (= e!658513 Unit!38156)))

(declare-fun b!1157982 () Bool)

(declare-fun e!658508 () Bool)

(declare-fun mapRes!45368 () Bool)

(assert (=> b!1157982 (= e!658508 (and e!658521 mapRes!45368))))

(declare-fun condMapEmpty!45368 () Bool)

(declare-fun mapDefault!45368 () ValueCell!13805)

