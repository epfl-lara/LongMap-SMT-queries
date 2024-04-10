; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98860 () Bool)

(assert start!98860)

(declare-fun b_free!24465 () Bool)

(declare-fun b_next!24465 () Bool)

(assert (=> start!98860 (= b_free!24465 (not b_next!24465))))

(declare-fun tp!86105 () Bool)

(declare-fun b_and!39779 () Bool)

(assert (=> start!98860 (= tp!86105 b_and!39779)))

(declare-fun b!1156403 () Bool)

(declare-fun e!657652 () Bool)

(declare-datatypes ((V!43787 0))(
  ( (V!43788 (val!14554 Int)) )
))
(declare-datatypes ((tuple2!18516 0))(
  ( (tuple2!18517 (_1!9269 (_ BitVec 64)) (_2!9269 V!43787)) )
))
(declare-datatypes ((List!25257 0))(
  ( (Nil!25254) (Cons!25253 (h!26462 tuple2!18516) (t!36714 List!25257)) )
))
(declare-datatypes ((ListLongMap!16485 0))(
  ( (ListLongMap!16486 (toList!8258 List!25257)) )
))
(declare-fun call!55129 () ListLongMap!16485)

(declare-fun call!55128 () ListLongMap!16485)

(assert (=> b!1156403 (= e!657652 (= call!55129 call!55128))))

(declare-fun b!1156404 () Bool)

(declare-fun e!657646 () Bool)

(declare-fun e!657642 () Bool)

(assert (=> b!1156404 (= e!657646 e!657642)))

(declare-fun res!768131 () Bool)

(assert (=> b!1156404 (=> res!768131 e!657642)))

(declare-datatypes ((array!74837 0))(
  ( (array!74838 (arr!36069 (Array (_ BitVec 32) (_ BitVec 64))) (size!36605 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74837)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1156404 (= res!768131 (not (= (select (arr!36069 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156404 e!657652))

(declare-fun c!115043 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156404 (= c!115043 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43787)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13788 0))(
  ( (ValueCellFull!13788 (v!17191 V!43787)) (EmptyCell!13788) )
))
(declare-datatypes ((array!74839 0))(
  ( (array!74840 (arr!36070 (Array (_ BitVec 32) ValueCell!13788)) (size!36606 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74839)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!38091 0))(
  ( (Unit!38092) )
))
(declare-fun lt!519095 () Unit!38091)

(declare-fun minValue!944 () V!43787)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!606 (array!74837 array!74839 (_ BitVec 32) (_ BitVec 32) V!43787 V!43787 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38091)

(assert (=> b!1156404 (= lt!519095 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!606 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156405 () Bool)

(declare-fun e!657654 () Bool)

(declare-fun tp_is_empty!28995 () Bool)

(assert (=> b!1156405 (= e!657654 tp_is_empty!28995)))

(declare-fun call!55123 () ListLongMap!16485)

(declare-fun c!115047 () Bool)

(declare-fun c!115044 () Bool)

(declare-fun bm!55119 () Bool)

(declare-fun lt!519097 () ListLongMap!16485)

(declare-fun +!3671 (ListLongMap!16485 tuple2!18516) ListLongMap!16485)

(assert (=> bm!55119 (= call!55123 (+!3671 lt!519097 (ite (or c!115044 c!115047) (tuple2!18517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1156406 () Bool)

(declare-fun lt!519099 () ListLongMap!16485)

(declare-fun contains!6770 (ListLongMap!16485 (_ BitVec 64)) Bool)

(assert (=> b!1156406 (contains!6770 (+!3671 lt!519099 (tuple2!18517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!519080 () Unit!38091)

(declare-fun call!55126 () Unit!38091)

(assert (=> b!1156406 (= lt!519080 call!55126)))

(declare-fun call!55125 () Bool)

(assert (=> b!1156406 call!55125))

(assert (=> b!1156406 (= lt!519099 call!55123)))

(declare-fun lt!519086 () Unit!38091)

(declare-fun addStillContains!913 (ListLongMap!16485 (_ BitVec 64) V!43787 (_ BitVec 64)) Unit!38091)

(assert (=> b!1156406 (= lt!519086 (addStillContains!913 lt!519097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!657648 () Unit!38091)

(assert (=> b!1156406 (= e!657648 lt!519080)))

(declare-fun b!1156407 () Bool)

(declare-fun res!768140 () Bool)

(declare-fun e!657656 () Bool)

(assert (=> b!1156407 (=> (not res!768140) (not e!657656))))

(declare-fun lt!519089 () array!74837)

(declare-datatypes ((List!25258 0))(
  ( (Nil!25255) (Cons!25254 (h!26463 (_ BitVec 64)) (t!36715 List!25258)) )
))
(declare-fun arrayNoDuplicates!0 (array!74837 (_ BitVec 32) List!25258) Bool)

(assert (=> b!1156407 (= res!768140 (arrayNoDuplicates!0 lt!519089 #b00000000000000000000000000000000 Nil!25255))))

(declare-fun b!1156408 () Bool)

(declare-fun lt!519082 () Bool)

(assert (=> b!1156408 (= c!115047 (and (not lt!519082) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657650 () Unit!38091)

(assert (=> b!1156408 (= e!657648 e!657650)))

(declare-fun b!1156409 () Bool)

(declare-fun e!657644 () Bool)

(assert (=> b!1156409 (= e!657644 e!657646)))

(declare-fun res!768130 () Bool)

(assert (=> b!1156409 (=> res!768130 e!657646)))

(assert (=> b!1156409 (= res!768130 (not (= from!1455 i!673)))))

(declare-fun lt!519078 () array!74839)

(declare-fun lt!519091 () ListLongMap!16485)

(declare-fun getCurrentListMapNoExtraKeys!4726 (array!74837 array!74839 (_ BitVec 32) (_ BitVec 32) V!43787 V!43787 (_ BitVec 32) Int) ListLongMap!16485)

(assert (=> b!1156409 (= lt!519091 (getCurrentListMapNoExtraKeys!4726 lt!519089 lt!519078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!519087 () V!43787)

(assert (=> b!1156409 (= lt!519078 (array!74840 (store (arr!36070 _values!996) i!673 (ValueCellFull!13788 lt!519087)) (size!36606 _values!996)))))

(declare-fun dynLambda!2734 (Int (_ BitVec 64)) V!43787)

(assert (=> b!1156409 (= lt!519087 (dynLambda!2734 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!519084 () ListLongMap!16485)

(assert (=> b!1156409 (= lt!519084 (getCurrentListMapNoExtraKeys!4726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!55120 () Bool)

(declare-fun call!55124 () ListLongMap!16485)

(assert (=> bm!55120 (= call!55124 call!55123)))

(declare-fun b!1156410 () Bool)

(declare-fun lt!519088 () ListLongMap!16485)

(declare-fun e!657643 () Bool)

(assert (=> b!1156410 (= e!657643 (= lt!519088 (getCurrentListMapNoExtraKeys!4726 lt!519089 lt!519078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156411 () Bool)

(declare-fun call!55122 () Bool)

(assert (=> b!1156411 call!55122))

(declare-fun lt!519085 () Unit!38091)

(declare-fun call!55127 () Unit!38091)

(assert (=> b!1156411 (= lt!519085 call!55127)))

(declare-fun e!657645 () Unit!38091)

(assert (=> b!1156411 (= e!657645 lt!519085)))

(declare-fun bm!55121 () Bool)

(assert (=> bm!55121 (= call!55126 (addStillContains!913 (ite c!115044 lt!519099 lt!519097) (ite c!115044 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115047 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115044 minValue!944 (ite c!115047 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1156412 () Bool)

(declare-fun res!768142 () Bool)

(declare-fun e!657641 () Bool)

(assert (=> b!1156412 (=> (not res!768142) (not e!657641))))

(assert (=> b!1156412 (= res!768142 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36605 _keys!1208))))))

(declare-fun b!1156413 () Bool)

(declare-fun e!657651 () Bool)

(declare-fun arrayContainsKey!0 (array!74837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156413 (= e!657651 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156414 () Bool)

(declare-fun res!768134 () Bool)

(assert (=> b!1156414 (=> (not res!768134) (not e!657641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74837 (_ BitVec 32)) Bool)

(assert (=> b!1156414 (= res!768134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156415 () Bool)

(declare-fun lt!519093 () Unit!38091)

(assert (=> b!1156415 (= e!657650 lt!519093)))

(assert (=> b!1156415 (= lt!519093 call!55127)))

(assert (=> b!1156415 call!55122))

(declare-fun b!1156416 () Bool)

(declare-fun res!768129 () Bool)

(assert (=> b!1156416 (=> (not res!768129) (not e!657641))))

(assert (=> b!1156416 (= res!768129 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25255))))

(declare-fun bm!55122 () Bool)

(assert (=> bm!55122 (= call!55127 call!55126)))

(declare-fun b!1156417 () Bool)

(declare-fun res!768132 () Bool)

(assert (=> b!1156417 (=> (not res!768132) (not e!657641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156417 (= res!768132 (validMask!0 mask!1564))))

(declare-fun b!1156418 () Bool)

(declare-fun e!657649 () Unit!38091)

(declare-fun Unit!38093 () Unit!38091)

(assert (=> b!1156418 (= e!657649 Unit!38093)))

(declare-fun mapNonEmpty!45317 () Bool)

(declare-fun mapRes!45317 () Bool)

(declare-fun tp!86106 () Bool)

(assert (=> mapNonEmpty!45317 (= mapRes!45317 (and tp!86106 e!657654))))

(declare-fun mapKey!45317 () (_ BitVec 32))

(declare-fun mapRest!45317 () (Array (_ BitVec 32) ValueCell!13788))

(declare-fun mapValue!45317 () ValueCell!13788)

(assert (=> mapNonEmpty!45317 (= (arr!36070 _values!996) (store mapRest!45317 mapKey!45317 mapValue!45317))))

(declare-fun b!1156419 () Bool)

(assert (=> b!1156419 (= e!657650 e!657645)))

(declare-fun c!115048 () Bool)

(assert (=> b!1156419 (= c!115048 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519082))))

(declare-fun b!1156420 () Bool)

(declare-fun e!657653 () Bool)

(assert (=> b!1156420 (= e!657653 tp_is_empty!28995)))

(declare-fun b!1156421 () Bool)

(declare-fun -!1374 (ListLongMap!16485 (_ BitVec 64)) ListLongMap!16485)

(assert (=> b!1156421 (= e!657652 (= call!55129 (-!1374 call!55128 k0!934)))))

(declare-fun b!1156422 () Bool)

(declare-fun e!657655 () Bool)

(assert (=> b!1156422 (= e!657655 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!768133 () Bool)

(assert (=> start!98860 (=> (not res!768133) (not e!657641))))

(assert (=> start!98860 (= res!768133 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36605 _keys!1208))))))

(assert (=> start!98860 e!657641))

(assert (=> start!98860 tp_is_empty!28995))

(declare-fun array_inv!27606 (array!74837) Bool)

(assert (=> start!98860 (array_inv!27606 _keys!1208)))

(assert (=> start!98860 true))

(assert (=> start!98860 tp!86105))

(declare-fun e!657657 () Bool)

(declare-fun array_inv!27607 (array!74839) Bool)

(assert (=> start!98860 (and (array_inv!27607 _values!996) e!657657)))

(declare-fun b!1156402 () Bool)

(assert (=> b!1156402 (= e!657656 (not e!657644))))

(declare-fun res!768135 () Bool)

(assert (=> b!1156402 (=> res!768135 e!657644)))

(assert (=> b!1156402 (= res!768135 (bvsgt from!1455 i!673))))

(assert (=> b!1156402 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!519083 () Unit!38091)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74837 (_ BitVec 64) (_ BitVec 32)) Unit!38091)

(assert (=> b!1156402 (= lt!519083 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1156423 () Bool)

(declare-fun res!768138 () Bool)

(assert (=> b!1156423 (=> (not res!768138) (not e!657641))))

(assert (=> b!1156423 (= res!768138 (and (= (size!36606 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36605 _keys!1208) (size!36606 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1156424 () Bool)

(declare-fun res!768139 () Bool)

(assert (=> b!1156424 (=> (not res!768139) (not e!657641))))

(assert (=> b!1156424 (= res!768139 (= (select (arr!36069 _keys!1208) i!673) k0!934))))

(declare-fun b!1156425 () Bool)

(declare-fun res!768136 () Bool)

(assert (=> b!1156425 (=> (not res!768136) (not e!657641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156425 (= res!768136 (validKeyInArray!0 k0!934))))

(declare-fun b!1156426 () Bool)

(assert (=> b!1156426 (= e!657651 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519082) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55123 () Bool)

(assert (=> bm!55123 (= call!55128 (getCurrentListMapNoExtraKeys!4726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55124 () Bool)

(assert (=> bm!55124 (= call!55125 (contains!6770 (ite c!115044 lt!519099 call!55124) k0!934))))

(declare-fun b!1156427 () Bool)

(declare-fun Unit!38094 () Unit!38091)

(assert (=> b!1156427 (= e!657645 Unit!38094)))

(declare-fun b!1156428 () Bool)

(declare-fun Unit!38095 () Unit!38091)

(assert (=> b!1156428 (= e!657649 Unit!38095)))

(assert (=> b!1156428 (= lt!519082 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156428 (= c!115044 (and (not lt!519082) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!519098 () Unit!38091)

(assert (=> b!1156428 (= lt!519098 e!657648)))

(declare-fun lt!519079 () Unit!38091)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!501 (array!74837 array!74839 (_ BitVec 32) (_ BitVec 32) V!43787 V!43787 (_ BitVec 64) (_ BitVec 32) Int) Unit!38091)

(assert (=> b!1156428 (= lt!519079 (lemmaListMapContainsThenArrayContainsFrom!501 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115046 () Bool)

(assert (=> b!1156428 (= c!115046 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768143 () Bool)

(assert (=> b!1156428 (= res!768143 e!657651)))

(assert (=> b!1156428 (=> (not res!768143) (not e!657655))))

(assert (=> b!1156428 e!657655))

(declare-fun lt!519081 () Unit!38091)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74837 (_ BitVec 32) (_ BitVec 32)) Unit!38091)

(assert (=> b!1156428 (= lt!519081 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156428 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25255)))

(declare-fun lt!519090 () Unit!38091)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74837 (_ BitVec 64) (_ BitVec 32) List!25258) Unit!38091)

(assert (=> b!1156428 (= lt!519090 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25255))))

(assert (=> b!1156428 false))

(declare-fun b!1156429 () Bool)

(assert (=> b!1156429 (= e!657641 e!657656)))

(declare-fun res!768137 () Bool)

(assert (=> b!1156429 (=> (not res!768137) (not e!657656))))

(assert (=> b!1156429 (= res!768137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519089 mask!1564))))

(assert (=> b!1156429 (= lt!519089 (array!74838 (store (arr!36069 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36605 _keys!1208)))))

(declare-fun mapIsEmpty!45317 () Bool)

(assert (=> mapIsEmpty!45317 mapRes!45317))

(declare-fun b!1156430 () Bool)

(assert (=> b!1156430 (= e!657657 (and e!657653 mapRes!45317))))

(declare-fun condMapEmpty!45317 () Bool)

(declare-fun mapDefault!45317 () ValueCell!13788)

(assert (=> b!1156430 (= condMapEmpty!45317 (= (arr!36070 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13788)) mapDefault!45317)))))

(declare-fun bm!55125 () Bool)

(assert (=> bm!55125 (= call!55122 call!55125)))

(declare-fun b!1156431 () Bool)

(assert (=> b!1156431 (= e!657642 true)))

(assert (=> b!1156431 e!657643))

(declare-fun res!768141 () Bool)

(assert (=> b!1156431 (=> (not res!768141) (not e!657643))))

(assert (=> b!1156431 (= res!768141 (= lt!519088 lt!519097))))

(assert (=> b!1156431 (= lt!519088 (-!1374 lt!519084 k0!934))))

(declare-fun lt!519092 () V!43787)

(assert (=> b!1156431 (= (-!1374 (+!3671 lt!519097 (tuple2!18517 (select (arr!36069 _keys!1208) from!1455) lt!519092)) (select (arr!36069 _keys!1208) from!1455)) lt!519097)))

(declare-fun lt!519094 () Unit!38091)

(declare-fun addThenRemoveForNewKeyIsSame!213 (ListLongMap!16485 (_ BitVec 64) V!43787) Unit!38091)

(assert (=> b!1156431 (= lt!519094 (addThenRemoveForNewKeyIsSame!213 lt!519097 (select (arr!36069 _keys!1208) from!1455) lt!519092))))

(declare-fun get!18381 (ValueCell!13788 V!43787) V!43787)

(assert (=> b!1156431 (= lt!519092 (get!18381 (select (arr!36070 _values!996) from!1455) lt!519087))))

(declare-fun lt!519096 () Unit!38091)

(assert (=> b!1156431 (= lt!519096 e!657649)))

(declare-fun c!115045 () Bool)

(assert (=> b!1156431 (= c!115045 (contains!6770 lt!519097 k0!934))))

(assert (=> b!1156431 (= lt!519097 (getCurrentListMapNoExtraKeys!4726 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55126 () Bool)

(assert (=> bm!55126 (= call!55129 (getCurrentListMapNoExtraKeys!4726 lt!519089 lt!519078 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98860 res!768133) b!1156417))

(assert (= (and b!1156417 res!768132) b!1156423))

(assert (= (and b!1156423 res!768138) b!1156414))

(assert (= (and b!1156414 res!768134) b!1156416))

(assert (= (and b!1156416 res!768129) b!1156412))

(assert (= (and b!1156412 res!768142) b!1156425))

(assert (= (and b!1156425 res!768136) b!1156424))

(assert (= (and b!1156424 res!768139) b!1156429))

(assert (= (and b!1156429 res!768137) b!1156407))

(assert (= (and b!1156407 res!768140) b!1156402))

(assert (= (and b!1156402 (not res!768135)) b!1156409))

(assert (= (and b!1156409 (not res!768130)) b!1156404))

(assert (= (and b!1156404 c!115043) b!1156421))

(assert (= (and b!1156404 (not c!115043)) b!1156403))

(assert (= (or b!1156421 b!1156403) bm!55126))

(assert (= (or b!1156421 b!1156403) bm!55123))

(assert (= (and b!1156404 (not res!768131)) b!1156431))

(assert (= (and b!1156431 c!115045) b!1156428))

(assert (= (and b!1156431 (not c!115045)) b!1156418))

(assert (= (and b!1156428 c!115044) b!1156406))

(assert (= (and b!1156428 (not c!115044)) b!1156408))

(assert (= (and b!1156408 c!115047) b!1156415))

(assert (= (and b!1156408 (not c!115047)) b!1156419))

(assert (= (and b!1156419 c!115048) b!1156411))

(assert (= (and b!1156419 (not c!115048)) b!1156427))

(assert (= (or b!1156415 b!1156411) bm!55122))

(assert (= (or b!1156415 b!1156411) bm!55120))

(assert (= (or b!1156415 b!1156411) bm!55125))

(assert (= (or b!1156406 bm!55125) bm!55124))

(assert (= (or b!1156406 bm!55122) bm!55121))

(assert (= (or b!1156406 bm!55120) bm!55119))

(assert (= (and b!1156428 c!115046) b!1156413))

(assert (= (and b!1156428 (not c!115046)) b!1156426))

(assert (= (and b!1156428 res!768143) b!1156422))

(assert (= (and b!1156431 res!768141) b!1156410))

(assert (= (and b!1156430 condMapEmpty!45317) mapIsEmpty!45317))

(assert (= (and b!1156430 (not condMapEmpty!45317)) mapNonEmpty!45317))

(get-info :version)

(assert (= (and mapNonEmpty!45317 ((_ is ValueCellFull!13788) mapValue!45317)) b!1156405))

(assert (= (and b!1156430 ((_ is ValueCellFull!13788) mapDefault!45317)) b!1156420))

(assert (= start!98860 b!1156430))

(declare-fun b_lambda!19571 () Bool)

(assert (=> (not b_lambda!19571) (not b!1156409)))

(declare-fun t!36713 () Bool)

(declare-fun tb!9277 () Bool)

(assert (=> (and start!98860 (= defaultEntry!1004 defaultEntry!1004) t!36713) tb!9277))

(declare-fun result!19119 () Bool)

(assert (=> tb!9277 (= result!19119 tp_is_empty!28995)))

(assert (=> b!1156409 t!36713))

(declare-fun b_and!39781 () Bool)

(assert (= b_and!39779 (and (=> t!36713 result!19119) b_and!39781)))

(declare-fun m!1065869 () Bool)

(assert (=> start!98860 m!1065869))

(declare-fun m!1065871 () Bool)

(assert (=> start!98860 m!1065871))

(declare-fun m!1065873 () Bool)

(assert (=> b!1156416 m!1065873))

(declare-fun m!1065875 () Bool)

(assert (=> b!1156410 m!1065875))

(declare-fun m!1065877 () Bool)

(assert (=> b!1156421 m!1065877))

(declare-fun m!1065879 () Bool)

(assert (=> bm!55123 m!1065879))

(assert (=> b!1156431 m!1065879))

(declare-fun m!1065881 () Bool)

(assert (=> b!1156431 m!1065881))

(declare-fun m!1065883 () Bool)

(assert (=> b!1156431 m!1065883))

(declare-fun m!1065885 () Bool)

(assert (=> b!1156431 m!1065885))

(declare-fun m!1065887 () Bool)

(assert (=> b!1156431 m!1065887))

(declare-fun m!1065889 () Bool)

(assert (=> b!1156431 m!1065889))

(assert (=> b!1156431 m!1065885))

(assert (=> b!1156431 m!1065887))

(declare-fun m!1065891 () Bool)

(assert (=> b!1156431 m!1065891))

(declare-fun m!1065893 () Bool)

(assert (=> b!1156431 m!1065893))

(assert (=> b!1156431 m!1065887))

(assert (=> b!1156431 m!1065881))

(declare-fun m!1065895 () Bool)

(assert (=> b!1156431 m!1065895))

(declare-fun m!1065897 () Bool)

(assert (=> b!1156414 m!1065897))

(declare-fun m!1065899 () Bool)

(assert (=> b!1156406 m!1065899))

(assert (=> b!1156406 m!1065899))

(declare-fun m!1065901 () Bool)

(assert (=> b!1156406 m!1065901))

(declare-fun m!1065903 () Bool)

(assert (=> b!1156406 m!1065903))

(declare-fun m!1065905 () Bool)

(assert (=> b!1156429 m!1065905))

(declare-fun m!1065907 () Bool)

(assert (=> b!1156429 m!1065907))

(declare-fun m!1065909 () Bool)

(assert (=> b!1156413 m!1065909))

(assert (=> bm!55126 m!1065875))

(declare-fun m!1065911 () Bool)

(assert (=> bm!55121 m!1065911))

(declare-fun m!1065913 () Bool)

(assert (=> b!1156402 m!1065913))

(declare-fun m!1065915 () Bool)

(assert (=> b!1156402 m!1065915))

(assert (=> b!1156422 m!1065909))

(declare-fun m!1065917 () Bool)

(assert (=> mapNonEmpty!45317 m!1065917))

(declare-fun m!1065919 () Bool)

(assert (=> b!1156409 m!1065919))

(declare-fun m!1065921 () Bool)

(assert (=> b!1156409 m!1065921))

(declare-fun m!1065923 () Bool)

(assert (=> b!1156409 m!1065923))

(declare-fun m!1065925 () Bool)

(assert (=> b!1156409 m!1065925))

(declare-fun m!1065927 () Bool)

(assert (=> b!1156417 m!1065927))

(declare-fun m!1065929 () Bool)

(assert (=> b!1156425 m!1065929))

(declare-fun m!1065931 () Bool)

(assert (=> b!1156428 m!1065931))

(declare-fun m!1065933 () Bool)

(assert (=> b!1156428 m!1065933))

(declare-fun m!1065935 () Bool)

(assert (=> b!1156428 m!1065935))

(declare-fun m!1065937 () Bool)

(assert (=> b!1156428 m!1065937))

(declare-fun m!1065939 () Bool)

(assert (=> b!1156424 m!1065939))

(declare-fun m!1065941 () Bool)

(assert (=> b!1156407 m!1065941))

(assert (=> b!1156404 m!1065887))

(declare-fun m!1065943 () Bool)

(assert (=> b!1156404 m!1065943))

(declare-fun m!1065945 () Bool)

(assert (=> bm!55119 m!1065945))

(declare-fun m!1065947 () Bool)

(assert (=> bm!55124 m!1065947))

(check-sat (not mapNonEmpty!45317) (not b!1156402) (not b!1156404) (not b!1156429) (not b!1156416) (not bm!55126) (not b!1156421) (not b_next!24465) (not b!1156414) (not b!1156407) tp_is_empty!28995 (not bm!55123) (not b!1156413) (not b!1156410) (not start!98860) (not bm!55124) b_and!39781 (not b_lambda!19571) (not b!1156409) (not b!1156431) (not bm!55119) (not bm!55121) (not b!1156425) (not b!1156428) (not b!1156417) (not b!1156406) (not b!1156422))
(check-sat b_and!39781 (not b_next!24465))
