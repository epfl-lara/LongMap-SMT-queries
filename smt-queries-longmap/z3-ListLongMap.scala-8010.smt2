; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98894 () Bool)

(assert start!98894)

(declare-fun b_free!24505 () Bool)

(declare-fun b_next!24505 () Bool)

(assert (=> start!98894 (= b_free!24505 (not b_next!24505))))

(declare-fun tp!86226 () Bool)

(declare-fun b_and!39837 () Bool)

(assert (=> start!98894 (= tp!86226 b_and!39837)))

(declare-datatypes ((V!43841 0))(
  ( (V!43842 (val!14574 Int)) )
))
(declare-datatypes ((tuple2!18632 0))(
  ( (tuple2!18633 (_1!9327 (_ BitVec 64)) (_2!9327 V!43841)) )
))
(declare-datatypes ((List!25357 0))(
  ( (Nil!25354) (Cons!25353 (h!26562 tuple2!18632) (t!36845 List!25357)) )
))
(declare-datatypes ((ListLongMap!16601 0))(
  ( (ListLongMap!16602 (toList!8316 List!25357)) )
))
(declare-fun lt!520209 () ListLongMap!16601)

(declare-fun c!115380 () Bool)

(declare-fun minValue!944 () V!43841)

(declare-fun bm!55576 () Bool)

(declare-fun zeroValue!944 () V!43841)

(declare-fun c!115381 () Bool)

(declare-fun call!55582 () ListLongMap!16601)

(declare-fun lt!520206 () ListLongMap!16601)

(declare-fun +!3725 (ListLongMap!16601 tuple2!18632) ListLongMap!16601)

(assert (=> bm!55576 (= call!55582 (+!3725 (ite c!115380 lt!520209 lt!520206) (ite c!115380 (tuple2!18633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115381 (tuple2!18633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1158118 () Bool)

(declare-fun res!768970 () Bool)

(declare-fun e!658593 () Bool)

(assert (=> b!1158118 (=> (not res!768970) (not e!658593))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74832 0))(
  ( (array!74833 (arr!36067 (Array (_ BitVec 32) (_ BitVec 64))) (size!36605 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74832)

(assert (=> b!1158118 (= res!768970 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36605 _keys!1208))))))

(declare-fun b!1158119 () Bool)

(declare-datatypes ((Unit!38011 0))(
  ( (Unit!38012) )
))
(declare-fun e!658583 () Unit!38011)

(declare-fun e!658592 () Unit!38011)

(assert (=> b!1158119 (= e!658583 e!658592)))

(declare-fun c!115378 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!520211 () Bool)

(assert (=> b!1158119 (= c!115378 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520211))))

(declare-fun b!1158120 () Bool)

(declare-fun res!768967 () Bool)

(assert (=> b!1158120 (=> (not res!768967) (not e!658593))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158120 (= res!768967 (validMask!0 mask!1564))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1158121 () Bool)

(declare-fun e!658587 () Bool)

(declare-fun arrayContainsKey!0 (array!74832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158121 (= e!658587 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158122 () Bool)

(declare-fun e!658586 () Bool)

(declare-fun e!658598 () Bool)

(declare-fun mapRes!45377 () Bool)

(assert (=> b!1158122 (= e!658586 (and e!658598 mapRes!45377))))

(declare-fun condMapEmpty!45377 () Bool)

(declare-datatypes ((ValueCell!13808 0))(
  ( (ValueCellFull!13808 (v!17210 V!43841)) (EmptyCell!13808) )
))
(declare-datatypes ((array!74834 0))(
  ( (array!74835 (arr!36068 (Array (_ BitVec 32) ValueCell!13808)) (size!36606 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74834)

(declare-fun mapDefault!45377 () ValueCell!13808)

(assert (=> b!1158122 (= condMapEmpty!45377 (= (arr!36068 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13808)) mapDefault!45377)))))

(declare-fun bm!55577 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun call!55584 () ListLongMap!16601)

(declare-fun getCurrentListMapNoExtraKeys!4796 (array!74832 array!74834 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 32) Int) ListLongMap!16601)

(assert (=> bm!55577 (= call!55584 (getCurrentListMapNoExtraKeys!4796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158123 () Bool)

(declare-fun res!768964 () Bool)

(assert (=> b!1158123 (=> (not res!768964) (not e!658593))))

(assert (=> b!1158123 (= res!768964 (= (select (arr!36067 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!45377 () Bool)

(declare-fun tp!86225 () Bool)

(declare-fun e!658585 () Bool)

(assert (=> mapNonEmpty!45377 (= mapRes!45377 (and tp!86225 e!658585))))

(declare-fun mapRest!45377 () (Array (_ BitVec 32) ValueCell!13808))

(declare-fun mapValue!45377 () ValueCell!13808)

(declare-fun mapKey!45377 () (_ BitVec 32))

(assert (=> mapNonEmpty!45377 (= (arr!36068 _values!996) (store mapRest!45377 mapKey!45377 mapValue!45377))))

(declare-fun b!1158124 () Bool)

(declare-fun res!768976 () Bool)

(declare-fun e!658591 () Bool)

(assert (=> b!1158124 (=> (not res!768976) (not e!658591))))

(declare-fun lt!520208 () array!74832)

(declare-datatypes ((List!25358 0))(
  ( (Nil!25355) (Cons!25354 (h!26563 (_ BitVec 64)) (t!36846 List!25358)) )
))
(declare-fun arrayNoDuplicates!0 (array!74832 (_ BitVec 32) List!25358) Bool)

(assert (=> b!1158124 (= res!768976 (arrayNoDuplicates!0 lt!520208 #b00000000000000000000000000000000 Nil!25355))))

(declare-fun b!1158125 () Bool)

(declare-fun res!768969 () Bool)

(assert (=> b!1158125 (=> (not res!768969) (not e!658593))))

(assert (=> b!1158125 (= res!768969 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25355))))

(declare-fun lt!520226 () ListLongMap!16601)

(declare-fun b!1158126 () Bool)

(declare-fun lt!520219 () array!74834)

(declare-fun e!658584 () Bool)

(assert (=> b!1158126 (= e!658584 (= lt!520226 (getCurrentListMapNoExtraKeys!4796 lt!520208 lt!520219 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158127 () Bool)

(declare-fun e!658590 () Bool)

(declare-fun e!658588 () Bool)

(assert (=> b!1158127 (= e!658590 e!658588)))

(declare-fun res!768975 () Bool)

(assert (=> b!1158127 (=> res!768975 e!658588)))

(assert (=> b!1158127 (= res!768975 (not (= from!1455 i!673)))))

(declare-fun lt!520210 () ListLongMap!16601)

(assert (=> b!1158127 (= lt!520210 (getCurrentListMapNoExtraKeys!4796 lt!520208 lt!520219 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520227 () V!43841)

(assert (=> b!1158127 (= lt!520219 (array!74835 (store (arr!36068 _values!996) i!673 (ValueCellFull!13808 lt!520227)) (size!36606 _values!996)))))

(declare-fun dynLambda!2746 (Int (_ BitVec 64)) V!43841)

(assert (=> b!1158127 (= lt!520227 (dynLambda!2746 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520220 () ListLongMap!16601)

(assert (=> b!1158127 (= lt!520220 (getCurrentListMapNoExtraKeys!4796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158128 () Bool)

(assert (=> b!1158128 (= e!658587 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520211) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158129 () Bool)

(declare-fun res!768972 () Bool)

(assert (=> b!1158129 (=> (not res!768972) (not e!658593))))

(assert (=> b!1158129 (= res!768972 (and (= (size!36606 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36605 _keys!1208) (size!36606 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1158130 () Bool)

(declare-fun e!658596 () Unit!38011)

(declare-fun Unit!38013 () Unit!38011)

(assert (=> b!1158130 (= e!658596 Unit!38013)))

(declare-fun b!1158131 () Bool)

(declare-fun e!658589 () Bool)

(declare-fun call!55585 () ListLongMap!16601)

(assert (=> b!1158131 (= e!658589 (= call!55585 call!55584))))

(declare-fun e!658595 () Bool)

(declare-fun b!1158132 () Bool)

(assert (=> b!1158132 (= e!658595 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158133 () Bool)

(declare-fun tp_is_empty!29035 () Bool)

(assert (=> b!1158133 (= e!658585 tp_is_empty!29035)))

(declare-fun b!1158134 () Bool)

(declare-fun Unit!38014 () Unit!38011)

(assert (=> b!1158134 (= e!658592 Unit!38014)))

(declare-fun b!1158135 () Bool)

(assert (=> b!1158135 (= e!658593 e!658591)))

(declare-fun res!768973 () Bool)

(assert (=> b!1158135 (=> (not res!768973) (not e!658591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74832 (_ BitVec 32)) Bool)

(assert (=> b!1158135 (= res!768973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520208 mask!1564))))

(assert (=> b!1158135 (= lt!520208 (array!74833 (store (arr!36067 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36605 _keys!1208)))))

(declare-fun bm!55578 () Bool)

(declare-fun call!55579 () Bool)

(declare-fun call!55586 () Bool)

(assert (=> bm!55578 (= call!55579 call!55586)))

(declare-fun b!1158136 () Bool)

(declare-fun e!658597 () Bool)

(assert (=> b!1158136 (= e!658597 true)))

(assert (=> b!1158136 e!658584))

(declare-fun res!768971 () Bool)

(assert (=> b!1158136 (=> (not res!768971) (not e!658584))))

(assert (=> b!1158136 (= res!768971 (= lt!520226 lt!520206))))

(declare-fun -!1372 (ListLongMap!16601 (_ BitVec 64)) ListLongMap!16601)

(assert (=> b!1158136 (= lt!520226 (-!1372 lt!520220 k0!934))))

(declare-fun lt!520217 () V!43841)

(assert (=> b!1158136 (= (-!1372 (+!3725 lt!520206 (tuple2!18633 (select (arr!36067 _keys!1208) from!1455) lt!520217)) (select (arr!36067 _keys!1208) from!1455)) lt!520206)))

(declare-fun lt!520216 () Unit!38011)

(declare-fun addThenRemoveForNewKeyIsSame!222 (ListLongMap!16601 (_ BitVec 64) V!43841) Unit!38011)

(assert (=> b!1158136 (= lt!520216 (addThenRemoveForNewKeyIsSame!222 lt!520206 (select (arr!36067 _keys!1208) from!1455) lt!520217))))

(declare-fun get!18404 (ValueCell!13808 V!43841) V!43841)

(assert (=> b!1158136 (= lt!520217 (get!18404 (select (arr!36068 _values!996) from!1455) lt!520227))))

(declare-fun lt!520218 () Unit!38011)

(assert (=> b!1158136 (= lt!520218 e!658596)))

(declare-fun c!115382 () Bool)

(declare-fun contains!6768 (ListLongMap!16601 (_ BitVec 64)) Bool)

(assert (=> b!1158136 (= c!115382 (contains!6768 lt!520206 k0!934))))

(assert (=> b!1158136 (= lt!520206 (getCurrentListMapNoExtraKeys!4796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158137 () Bool)

(assert (=> b!1158137 call!55579))

(declare-fun lt!520223 () Unit!38011)

(declare-fun call!55581 () Unit!38011)

(assert (=> b!1158137 (= lt!520223 call!55581)))

(assert (=> b!1158137 (= e!658592 lt!520223)))

(declare-fun call!55580 () ListLongMap!16601)

(declare-fun bm!55579 () Bool)

(assert (=> bm!55579 (= call!55586 (contains!6768 (ite c!115380 lt!520209 call!55580) k0!934))))

(declare-fun b!1158138 () Bool)

(assert (=> b!1158138 (= e!658588 e!658597)))

(declare-fun res!768977 () Bool)

(assert (=> b!1158138 (=> res!768977 e!658597)))

(assert (=> b!1158138 (= res!768977 (not (= (select (arr!36067 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1158138 e!658589))

(declare-fun c!115379 () Bool)

(assert (=> b!1158138 (= c!115379 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520215 () Unit!38011)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!642 (array!74832 array!74834 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38011)

(assert (=> b!1158138 (= lt!520215 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!642 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!55583 () Unit!38011)

(declare-fun bm!55580 () Bool)

(declare-fun addStillContains!933 (ListLongMap!16601 (_ BitVec 64) V!43841 (_ BitVec 64)) Unit!38011)

(assert (=> bm!55580 (= call!55583 (addStillContains!933 lt!520206 (ite (or c!115380 c!115381) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115380 c!115381) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!55581 () Bool)

(assert (=> bm!55581 (= call!55580 call!55582)))

(declare-fun b!1158139 () Bool)

(assert (=> b!1158139 (= e!658589 (= call!55585 (-!1372 call!55584 k0!934)))))

(declare-fun b!1158140 () Bool)

(declare-fun res!768965 () Bool)

(assert (=> b!1158140 (=> (not res!768965) (not e!658593))))

(assert (=> b!1158140 (= res!768965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45377 () Bool)

(assert (=> mapIsEmpty!45377 mapRes!45377))

(declare-fun b!1158141 () Bool)

(declare-fun lt!520221 () Unit!38011)

(assert (=> b!1158141 (= e!658583 lt!520221)))

(assert (=> b!1158141 (= lt!520221 call!55581)))

(assert (=> b!1158141 call!55579))

(declare-fun b!1158142 () Bool)

(declare-fun Unit!38015 () Unit!38011)

(assert (=> b!1158142 (= e!658596 Unit!38015)))

(assert (=> b!1158142 (= lt!520211 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158142 (= c!115380 (and (not lt!520211) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520224 () Unit!38011)

(declare-fun e!658599 () Unit!38011)

(assert (=> b!1158142 (= lt!520224 e!658599)))

(declare-fun lt!520225 () Unit!38011)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!514 (array!74832 array!74834 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 64) (_ BitVec 32) Int) Unit!38011)

(assert (=> b!1158142 (= lt!520225 (lemmaListMapContainsThenArrayContainsFrom!514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115377 () Bool)

(assert (=> b!1158142 (= c!115377 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768966 () Bool)

(assert (=> b!1158142 (= res!768966 e!658587)))

(assert (=> b!1158142 (=> (not res!768966) (not e!658595))))

(assert (=> b!1158142 e!658595))

(declare-fun lt!520212 () Unit!38011)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74832 (_ BitVec 32) (_ BitVec 32)) Unit!38011)

(assert (=> b!1158142 (= lt!520212 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158142 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25355)))

(declare-fun lt!520213 () Unit!38011)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74832 (_ BitVec 64) (_ BitVec 32) List!25358) Unit!38011)

(assert (=> b!1158142 (= lt!520213 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25355))))

(assert (=> b!1158142 false))

(declare-fun bm!55582 () Bool)

(assert (=> bm!55582 (= call!55585 (getCurrentListMapNoExtraKeys!4796 lt!520208 lt!520219 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158143 () Bool)

(assert (=> b!1158143 (contains!6768 call!55582 k0!934)))

(declare-fun lt!520222 () Unit!38011)

(assert (=> b!1158143 (= lt!520222 (addStillContains!933 lt!520209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1158143 call!55586))

(assert (=> b!1158143 (= lt!520209 (+!3725 lt!520206 (tuple2!18633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520214 () Unit!38011)

(assert (=> b!1158143 (= lt!520214 call!55583)))

(assert (=> b!1158143 (= e!658599 lt!520222)))

(declare-fun b!1158144 () Bool)

(assert (=> b!1158144 (= c!115381 (and (not lt!520211) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1158144 (= e!658599 e!658583)))

(declare-fun b!1158145 () Bool)

(assert (=> b!1158145 (= e!658598 tp_is_empty!29035)))

(declare-fun b!1158146 () Bool)

(assert (=> b!1158146 (= e!658591 (not e!658590))))

(declare-fun res!768968 () Bool)

(assert (=> b!1158146 (=> res!768968 e!658590)))

(assert (=> b!1158146 (= res!768968 (bvsgt from!1455 i!673))))

(assert (=> b!1158146 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520207 () Unit!38011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74832 (_ BitVec 64) (_ BitVec 32)) Unit!38011)

(assert (=> b!1158146 (= lt!520207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!768963 () Bool)

(assert (=> start!98894 (=> (not res!768963) (not e!658593))))

(assert (=> start!98894 (= res!768963 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36605 _keys!1208))))))

(assert (=> start!98894 e!658593))

(assert (=> start!98894 tp_is_empty!29035))

(declare-fun array_inv!27714 (array!74832) Bool)

(assert (=> start!98894 (array_inv!27714 _keys!1208)))

(assert (=> start!98894 true))

(assert (=> start!98894 tp!86226))

(declare-fun array_inv!27715 (array!74834) Bool)

(assert (=> start!98894 (and (array_inv!27715 _values!996) e!658586)))

(declare-fun bm!55583 () Bool)

(assert (=> bm!55583 (= call!55581 call!55583)))

(declare-fun b!1158147 () Bool)

(declare-fun res!768974 () Bool)

(assert (=> b!1158147 (=> (not res!768974) (not e!658593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158147 (= res!768974 (validKeyInArray!0 k0!934))))

(assert (= (and start!98894 res!768963) b!1158120))

(assert (= (and b!1158120 res!768967) b!1158129))

(assert (= (and b!1158129 res!768972) b!1158140))

(assert (= (and b!1158140 res!768965) b!1158125))

(assert (= (and b!1158125 res!768969) b!1158118))

(assert (= (and b!1158118 res!768970) b!1158147))

(assert (= (and b!1158147 res!768974) b!1158123))

(assert (= (and b!1158123 res!768964) b!1158135))

(assert (= (and b!1158135 res!768973) b!1158124))

(assert (= (and b!1158124 res!768976) b!1158146))

(assert (= (and b!1158146 (not res!768968)) b!1158127))

(assert (= (and b!1158127 (not res!768975)) b!1158138))

(assert (= (and b!1158138 c!115379) b!1158139))

(assert (= (and b!1158138 (not c!115379)) b!1158131))

(assert (= (or b!1158139 b!1158131) bm!55582))

(assert (= (or b!1158139 b!1158131) bm!55577))

(assert (= (and b!1158138 (not res!768977)) b!1158136))

(assert (= (and b!1158136 c!115382) b!1158142))

(assert (= (and b!1158136 (not c!115382)) b!1158130))

(assert (= (and b!1158142 c!115380) b!1158143))

(assert (= (and b!1158142 (not c!115380)) b!1158144))

(assert (= (and b!1158144 c!115381) b!1158141))

(assert (= (and b!1158144 (not c!115381)) b!1158119))

(assert (= (and b!1158119 c!115378) b!1158137))

(assert (= (and b!1158119 (not c!115378)) b!1158134))

(assert (= (or b!1158141 b!1158137) bm!55583))

(assert (= (or b!1158141 b!1158137) bm!55581))

(assert (= (or b!1158141 b!1158137) bm!55578))

(assert (= (or b!1158143 bm!55578) bm!55579))

(assert (= (or b!1158143 bm!55583) bm!55580))

(assert (= (or b!1158143 bm!55581) bm!55576))

(assert (= (and b!1158142 c!115377) b!1158121))

(assert (= (and b!1158142 (not c!115377)) b!1158128))

(assert (= (and b!1158142 res!768966) b!1158132))

(assert (= (and b!1158136 res!768971) b!1158126))

(assert (= (and b!1158122 condMapEmpty!45377) mapIsEmpty!45377))

(assert (= (and b!1158122 (not condMapEmpty!45377)) mapNonEmpty!45377))

(get-info :version)

(assert (= (and mapNonEmpty!45377 ((_ is ValueCellFull!13808) mapValue!45377)) b!1158133))

(assert (= (and b!1158122 ((_ is ValueCellFull!13808) mapDefault!45377)) b!1158145))

(assert (= start!98894 b!1158122))

(declare-fun b_lambda!19593 () Bool)

(assert (=> (not b_lambda!19593) (not b!1158127)))

(declare-fun t!36844 () Bool)

(declare-fun tb!9309 () Bool)

(assert (=> (and start!98894 (= defaultEntry!1004 defaultEntry!1004) t!36844) tb!9309))

(declare-fun result!19191 () Bool)

(assert (=> tb!9309 (= result!19191 tp_is_empty!29035)))

(assert (=> b!1158127 t!36844))

(declare-fun b_and!39839 () Bool)

(assert (= b_and!39837 (and (=> t!36844 result!19191) b_and!39839)))

(declare-fun m!1066875 () Bool)

(assert (=> b!1158138 m!1066875))

(declare-fun m!1066877 () Bool)

(assert (=> b!1158138 m!1066877))

(declare-fun m!1066879 () Bool)

(assert (=> b!1158136 m!1066879))

(declare-fun m!1066881 () Bool)

(assert (=> b!1158136 m!1066881))

(declare-fun m!1066883 () Bool)

(assert (=> b!1158136 m!1066883))

(declare-fun m!1066885 () Bool)

(assert (=> b!1158136 m!1066885))

(assert (=> b!1158136 m!1066875))

(declare-fun m!1066887 () Bool)

(assert (=> b!1158136 m!1066887))

(assert (=> b!1158136 m!1066883))

(assert (=> b!1158136 m!1066881))

(assert (=> b!1158136 m!1066875))

(declare-fun m!1066889 () Bool)

(assert (=> b!1158136 m!1066889))

(declare-fun m!1066891 () Bool)

(assert (=> b!1158136 m!1066891))

(assert (=> b!1158136 m!1066875))

(declare-fun m!1066893 () Bool)

(assert (=> b!1158136 m!1066893))

(declare-fun m!1066895 () Bool)

(assert (=> b!1158120 m!1066895))

(declare-fun m!1066897 () Bool)

(assert (=> b!1158132 m!1066897))

(declare-fun m!1066899 () Bool)

(assert (=> b!1158123 m!1066899))

(declare-fun m!1066901 () Bool)

(assert (=> start!98894 m!1066901))

(declare-fun m!1066903 () Bool)

(assert (=> start!98894 m!1066903))

(declare-fun m!1066905 () Bool)

(assert (=> b!1158146 m!1066905))

(declare-fun m!1066907 () Bool)

(assert (=> b!1158146 m!1066907))

(declare-fun m!1066909 () Bool)

(assert (=> b!1158126 m!1066909))

(declare-fun m!1066911 () Bool)

(assert (=> b!1158127 m!1066911))

(declare-fun m!1066913 () Bool)

(assert (=> b!1158127 m!1066913))

(declare-fun m!1066915 () Bool)

(assert (=> b!1158127 m!1066915))

(declare-fun m!1066917 () Bool)

(assert (=> b!1158127 m!1066917))

(declare-fun m!1066919 () Bool)

(assert (=> b!1158140 m!1066919))

(declare-fun m!1066921 () Bool)

(assert (=> mapNonEmpty!45377 m!1066921))

(declare-fun m!1066923 () Bool)

(assert (=> b!1158142 m!1066923))

(declare-fun m!1066925 () Bool)

(assert (=> b!1158142 m!1066925))

(declare-fun m!1066927 () Bool)

(assert (=> b!1158142 m!1066927))

(declare-fun m!1066929 () Bool)

(assert (=> b!1158142 m!1066929))

(declare-fun m!1066931 () Bool)

(assert (=> b!1158124 m!1066931))

(declare-fun m!1066933 () Bool)

(assert (=> b!1158139 m!1066933))

(declare-fun m!1066935 () Bool)

(assert (=> b!1158147 m!1066935))

(declare-fun m!1066937 () Bool)

(assert (=> bm!55580 m!1066937))

(assert (=> bm!55577 m!1066879))

(declare-fun m!1066939 () Bool)

(assert (=> bm!55576 m!1066939))

(assert (=> b!1158121 m!1066897))

(assert (=> bm!55582 m!1066909))

(declare-fun m!1066941 () Bool)

(assert (=> b!1158125 m!1066941))

(declare-fun m!1066943 () Bool)

(assert (=> b!1158135 m!1066943))

(declare-fun m!1066945 () Bool)

(assert (=> b!1158135 m!1066945))

(declare-fun m!1066947 () Bool)

(assert (=> bm!55579 m!1066947))

(declare-fun m!1066949 () Bool)

(assert (=> b!1158143 m!1066949))

(declare-fun m!1066951 () Bool)

(assert (=> b!1158143 m!1066951))

(declare-fun m!1066953 () Bool)

(assert (=> b!1158143 m!1066953))

(check-sat (not b!1158146) (not bm!55576) (not mapNonEmpty!45377) (not b!1158120) (not b_next!24505) (not bm!55579) (not start!98894) (not b!1158126) (not b_lambda!19593) b_and!39839 (not bm!55580) (not b!1158142) (not b!1158125) (not bm!55577) (not b!1158135) (not b!1158127) (not b!1158139) (not b!1158147) tp_is_empty!29035 (not b!1158121) (not b!1158132) (not bm!55582) (not b!1158136) (not b!1158124) (not b!1158143) (not b!1158140) (not b!1158138))
(check-sat b_and!39839 (not b_next!24505))
