; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98948 () Bool)

(assert start!98948)

(declare-fun b_free!24559 () Bool)

(declare-fun b_next!24559 () Bool)

(assert (=> start!98948 (= b_free!24559 (not b_next!24559))))

(declare-fun tp!86387 () Bool)

(declare-fun b_and!39945 () Bool)

(assert (=> start!98948 (= tp!86387 b_and!39945)))

(declare-fun mapIsEmpty!45458 () Bool)

(declare-fun mapRes!45458 () Bool)

(assert (=> mapIsEmpty!45458 mapRes!45458))

(declare-datatypes ((V!43913 0))(
  ( (V!43914 (val!14601 Int)) )
))
(declare-datatypes ((tuple2!18686 0))(
  ( (tuple2!18687 (_1!9354 (_ BitVec 64)) (_2!9354 V!43913)) )
))
(declare-datatypes ((List!25405 0))(
  ( (Nil!25402) (Cons!25401 (h!26610 tuple2!18686) (t!36947 List!25405)) )
))
(declare-datatypes ((ListLongMap!16655 0))(
  ( (ListLongMap!16656 (toList!8343 List!25405)) )
))
(declare-fun call!56228 () ListLongMap!16655)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!659968 () Bool)

(declare-fun call!56229 () ListLongMap!16655)

(declare-fun b!1160602 () Bool)

(declare-fun -!1393 (ListLongMap!16655 (_ BitVec 64)) ListLongMap!16655)

(assert (=> b!1160602 (= e!659968 (= call!56228 (-!1393 call!56229 k0!934)))))

(declare-fun b!1160603 () Bool)

(declare-fun res!770178 () Bool)

(declare-fun e!659962 () Bool)

(assert (=> b!1160603 (=> (not res!770178) (not e!659962))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1160603 (= res!770178 (validMask!0 mask!1564))))

(declare-fun b!1160604 () Bool)

(declare-fun call!56234 () ListLongMap!16655)

(declare-fun contains!6791 (ListLongMap!16655 (_ BitVec 64)) Bool)

(assert (=> b!1160604 (contains!6791 call!56234 k0!934)))

(declare-fun lt!521993 () ListLongMap!16655)

(declare-datatypes ((Unit!38111 0))(
  ( (Unit!38112) )
))
(declare-fun lt!522000 () Unit!38111)

(declare-fun minValue!944 () V!43913)

(declare-fun addStillContains!956 (ListLongMap!16655 (_ BitVec 64) V!43913 (_ BitVec 64)) Unit!38111)

(assert (=> b!1160604 (= lt!522000 (addStillContains!956 lt!521993 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56233 () Bool)

(assert (=> b!1160604 call!56233))

(declare-fun lt!522007 () ListLongMap!16655)

(declare-fun zeroValue!944 () V!43913)

(declare-fun +!3749 (ListLongMap!16655 tuple2!18686) ListLongMap!16655)

(assert (=> b!1160604 (= lt!521993 (+!3749 lt!522007 (tuple2!18687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!521992 () Unit!38111)

(declare-fun call!56227 () Unit!38111)

(assert (=> b!1160604 (= lt!521992 call!56227)))

(declare-fun e!659973 () Unit!38111)

(assert (=> b!1160604 (= e!659973 lt!522000)))

(declare-fun bm!56224 () Bool)

(declare-fun call!56232 () Unit!38111)

(assert (=> bm!56224 (= call!56232 call!56227)))

(declare-fun b!1160605 () Bool)

(declare-fun res!770181 () Bool)

(assert (=> b!1160605 (=> (not res!770181) (not e!659962))))

(declare-datatypes ((array!74938 0))(
  ( (array!74939 (arr!36120 (Array (_ BitVec 32) (_ BitVec 64))) (size!36658 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74938)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1160605 (= res!770181 (= (select (arr!36120 _keys!1208) i!673) k0!934))))

(declare-fun e!659967 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!521999 () Bool)

(declare-fun b!1160606 () Bool)

(assert (=> b!1160606 (= e!659967 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!521999) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1160607 () Bool)

(declare-fun res!770189 () Bool)

(assert (=> b!1160607 (=> (not res!770189) (not e!659962))))

(declare-datatypes ((ValueCell!13835 0))(
  ( (ValueCellFull!13835 (v!17237 V!43913)) (EmptyCell!13835) )
))
(declare-datatypes ((array!74940 0))(
  ( (array!74941 (arr!36121 (Array (_ BitVec 32) ValueCell!13835)) (size!36659 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74940)

(assert (=> b!1160607 (= res!770189 (and (= (size!36659 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36658 _keys!1208) (size!36659 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!56225 () Bool)

(declare-fun call!56230 () Bool)

(assert (=> bm!56225 (= call!56230 call!56233)))

(declare-fun b!1160608 () Bool)

(declare-fun e!659970 () Bool)

(declare-fun tp_is_empty!29089 () Bool)

(assert (=> b!1160608 (= e!659970 tp_is_empty!29089)))

(declare-fun b!1160609 () Bool)

(declare-fun e!659972 () Bool)

(declare-fun e!659960 () Bool)

(assert (=> b!1160609 (= e!659972 (and e!659960 mapRes!45458))))

(declare-fun condMapEmpty!45458 () Bool)

(declare-fun mapDefault!45458 () ValueCell!13835)

(assert (=> b!1160609 (= condMapEmpty!45458 (= (arr!36121 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13835)) mapDefault!45458)))))

(declare-fun b!1160611 () Bool)

(assert (=> b!1160611 call!56230))

(declare-fun lt!521995 () Unit!38111)

(assert (=> b!1160611 (= lt!521995 call!56232)))

(declare-fun e!659969 () Unit!38111)

(assert (=> b!1160611 (= e!659969 lt!521995)))

(declare-fun mapNonEmpty!45458 () Bool)

(declare-fun tp!86388 () Bool)

(assert (=> mapNonEmpty!45458 (= mapRes!45458 (and tp!86388 e!659970))))

(declare-fun mapKey!45458 () (_ BitVec 32))

(declare-fun mapValue!45458 () ValueCell!13835)

(declare-fun mapRest!45458 () (Array (_ BitVec 32) ValueCell!13835))

(assert (=> mapNonEmpty!45458 (= (arr!36121 _values!996) (store mapRest!45458 mapKey!45458 mapValue!45458))))

(declare-fun b!1160612 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!522003 () ListLongMap!16655)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!659976 () Bool)

(declare-fun lt!521996 () array!74940)

(declare-fun lt!521998 () array!74938)

(declare-fun getCurrentListMapNoExtraKeys!4821 (array!74938 array!74940 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 32) Int) ListLongMap!16655)

(assert (=> b!1160612 (= e!659976 (= lt!522003 (getCurrentListMapNoExtraKeys!4821 lt!521998 lt!521996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56226 () Bool)

(declare-fun call!56231 () ListLongMap!16655)

(assert (=> bm!56226 (= call!56231 call!56234)))

(declare-fun b!1160613 () Bool)

(declare-fun res!770179 () Bool)

(assert (=> b!1160613 (=> (not res!770179) (not e!659962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74938 (_ BitVec 32)) Bool)

(assert (=> b!1160613 (= res!770179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1160614 () Bool)

(declare-fun e!659963 () Bool)

(assert (=> b!1160614 (= e!659962 e!659963)))

(declare-fun res!770191 () Bool)

(assert (=> b!1160614 (=> (not res!770191) (not e!659963))))

(assert (=> b!1160614 (= res!770191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!521998 mask!1564))))

(assert (=> b!1160614 (= lt!521998 (array!74939 (store (arr!36120 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36658 _keys!1208)))))

(declare-fun b!1160615 () Bool)

(declare-fun e!659966 () Unit!38111)

(assert (=> b!1160615 (= e!659966 e!659969)))

(declare-fun c!115867 () Bool)

(assert (=> b!1160615 (= c!115867 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!521999))))

(declare-fun b!1160616 () Bool)

(assert (=> b!1160616 (= e!659968 (= call!56228 call!56229))))

(declare-fun bm!56227 () Bool)

(assert (=> bm!56227 (= call!56229 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160617 () Bool)

(declare-fun res!770190 () Bool)

(assert (=> b!1160617 (=> (not res!770190) (not e!659962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1160617 (= res!770190 (validKeyInArray!0 k0!934))))

(declare-fun c!115863 () Bool)

(declare-fun bm!56228 () Bool)

(declare-fun c!115864 () Bool)

(assert (=> bm!56228 (= call!56227 (addStillContains!956 lt!522007 (ite (or c!115864 c!115863) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115864 c!115863) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1160618 () Bool)

(assert (=> b!1160618 (= e!659960 tp_is_empty!29089)))

(declare-fun b!1160619 () Bool)

(declare-fun e!659961 () Bool)

(assert (=> b!1160619 (= e!659963 (not e!659961))))

(declare-fun res!770188 () Bool)

(assert (=> b!1160619 (=> res!770188 e!659961)))

(assert (=> b!1160619 (= res!770188 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1160619 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!521994 () Unit!38111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74938 (_ BitVec 64) (_ BitVec 32)) Unit!38111)

(assert (=> b!1160619 (= lt!521994 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1160620 () Bool)

(assert (=> b!1160620 (= e!659967 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1160621 () Bool)

(declare-fun e!659971 () Bool)

(assert (=> b!1160621 (= e!659961 e!659971)))

(declare-fun res!770183 () Bool)

(assert (=> b!1160621 (=> res!770183 e!659971)))

(assert (=> b!1160621 (= res!770183 (not (= from!1455 i!673)))))

(declare-fun lt!522008 () ListLongMap!16655)

(assert (=> b!1160621 (= lt!522008 (getCurrentListMapNoExtraKeys!4821 lt!521998 lt!521996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!521989 () V!43913)

(assert (=> b!1160621 (= lt!521996 (array!74941 (store (arr!36121 _values!996) i!673 (ValueCellFull!13835 lt!521989)) (size!36659 _values!996)))))

(declare-fun dynLambda!2765 (Int (_ BitVec 64)) V!43913)

(assert (=> b!1160621 (= lt!521989 (dynLambda!2765 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!521990 () ListLongMap!16655)

(assert (=> b!1160621 (= lt!521990 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1160622 () Bool)

(declare-fun res!770182 () Bool)

(assert (=> b!1160622 (=> (not res!770182) (not e!659963))))

(declare-datatypes ((List!25406 0))(
  ( (Nil!25403) (Cons!25402 (h!26611 (_ BitVec 64)) (t!36948 List!25406)) )
))
(declare-fun arrayNoDuplicates!0 (array!74938 (_ BitVec 32) List!25406) Bool)

(assert (=> b!1160622 (= res!770182 (arrayNoDuplicates!0 lt!521998 #b00000000000000000000000000000000 Nil!25403))))

(declare-fun b!1160623 () Bool)

(declare-fun Unit!38113 () Unit!38111)

(assert (=> b!1160623 (= e!659969 Unit!38113)))

(declare-fun b!1160624 () Bool)

(assert (=> b!1160624 (= c!115863 (and (not lt!521999) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1160624 (= e!659973 e!659966)))

(declare-fun b!1160625 () Bool)

(declare-fun e!659975 () Unit!38111)

(declare-fun Unit!38114 () Unit!38111)

(assert (=> b!1160625 (= e!659975 Unit!38114)))

(declare-fun b!1160626 () Bool)

(declare-fun e!659974 () Bool)

(assert (=> b!1160626 (= e!659974 true)))

(assert (=> b!1160626 e!659976))

(declare-fun res!770187 () Bool)

(assert (=> b!1160626 (=> (not res!770187) (not e!659976))))

(assert (=> b!1160626 (= res!770187 (= lt!522003 lt!522007))))

(assert (=> b!1160626 (= lt!522003 (-!1393 lt!521990 k0!934))))

(declare-fun lt!522006 () V!43913)

(assert (=> b!1160626 (= (-!1393 (+!3749 lt!522007 (tuple2!18687 (select (arr!36120 _keys!1208) from!1455) lt!522006)) (select (arr!36120 _keys!1208) from!1455)) lt!522007)))

(declare-fun lt!521991 () Unit!38111)

(declare-fun addThenRemoveForNewKeyIsSame!238 (ListLongMap!16655 (_ BitVec 64) V!43913) Unit!38111)

(assert (=> b!1160626 (= lt!521991 (addThenRemoveForNewKeyIsSame!238 lt!522007 (select (arr!36120 _keys!1208) from!1455) lt!522006))))

(declare-fun get!18438 (ValueCell!13835 V!43913) V!43913)

(assert (=> b!1160626 (= lt!522006 (get!18438 (select (arr!36121 _values!996) from!1455) lt!521989))))

(declare-fun lt!522004 () Unit!38111)

(assert (=> b!1160626 (= lt!522004 e!659975)))

(declare-fun c!115868 () Bool)

(assert (=> b!1160626 (= c!115868 (contains!6791 lt!522007 k0!934))))

(assert (=> b!1160626 (= lt!522007 (getCurrentListMapNoExtraKeys!4821 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160627 () Bool)

(declare-fun Unit!38115 () Unit!38111)

(assert (=> b!1160627 (= e!659975 Unit!38115)))

(assert (=> b!1160627 (= lt!521999 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1160627 (= c!115864 (and (not lt!521999) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522002 () Unit!38111)

(assert (=> b!1160627 (= lt!522002 e!659973)))

(declare-fun lt!521988 () Unit!38111)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!529 (array!74938 array!74940 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 64) (_ BitVec 32) Int) Unit!38111)

(assert (=> b!1160627 (= lt!521988 (lemmaListMapContainsThenArrayContainsFrom!529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115865 () Bool)

(assert (=> b!1160627 (= c!115865 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770186 () Bool)

(assert (=> b!1160627 (= res!770186 e!659967)))

(declare-fun e!659965 () Bool)

(assert (=> b!1160627 (=> (not res!770186) (not e!659965))))

(assert (=> b!1160627 e!659965))

(declare-fun lt!521997 () Unit!38111)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74938 (_ BitVec 32) (_ BitVec 32)) Unit!38111)

(assert (=> b!1160627 (= lt!521997 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1160627 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25403)))

(declare-fun lt!522009 () Unit!38111)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74938 (_ BitVec 64) (_ BitVec 32) List!25406) Unit!38111)

(assert (=> b!1160627 (= lt!522009 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25403))))

(assert (=> b!1160627 false))

(declare-fun b!1160628 () Bool)

(declare-fun lt!522001 () Unit!38111)

(assert (=> b!1160628 (= e!659966 lt!522001)))

(assert (=> b!1160628 (= lt!522001 call!56232)))

(assert (=> b!1160628 call!56230))

(declare-fun b!1160629 () Bool)

(assert (=> b!1160629 (= e!659965 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!56229 () Bool)

(assert (=> bm!56229 (= call!56234 (+!3749 (ite c!115864 lt!521993 lt!522007) (ite c!115864 (tuple2!18687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115863 (tuple2!18687 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18687 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1160630 () Bool)

(declare-fun res!770185 () Bool)

(assert (=> b!1160630 (=> (not res!770185) (not e!659962))))

(assert (=> b!1160630 (= res!770185 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25403))))

(declare-fun b!1160610 () Bool)

(assert (=> b!1160610 (= e!659971 e!659974)))

(declare-fun res!770184 () Bool)

(assert (=> b!1160610 (=> res!770184 e!659974)))

(assert (=> b!1160610 (= res!770184 (not (= (select (arr!36120 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1160610 e!659968))

(declare-fun c!115866 () Bool)

(assert (=> b!1160610 (= c!115866 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522005 () Unit!38111)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!661 (array!74938 array!74940 (_ BitVec 32) (_ BitVec 32) V!43913 V!43913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38111)

(assert (=> b!1160610 (= lt!522005 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!661 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770192 () Bool)

(assert (=> start!98948 (=> (not res!770192) (not e!659962))))

(assert (=> start!98948 (= res!770192 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36658 _keys!1208))))))

(assert (=> start!98948 e!659962))

(assert (=> start!98948 tp_is_empty!29089))

(declare-fun array_inv!27754 (array!74938) Bool)

(assert (=> start!98948 (array_inv!27754 _keys!1208)))

(assert (=> start!98948 true))

(assert (=> start!98948 tp!86387))

(declare-fun array_inv!27755 (array!74940) Bool)

(assert (=> start!98948 (and (array_inv!27755 _values!996) e!659972)))

(declare-fun bm!56230 () Bool)

(assert (=> bm!56230 (= call!56233 (contains!6791 (ite c!115864 lt!521993 call!56231) k0!934))))

(declare-fun bm!56231 () Bool)

(assert (=> bm!56231 (= call!56228 (getCurrentListMapNoExtraKeys!4821 lt!521998 lt!521996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1160631 () Bool)

(declare-fun res!770180 () Bool)

(assert (=> b!1160631 (=> (not res!770180) (not e!659962))))

(assert (=> b!1160631 (= res!770180 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36658 _keys!1208))))))

(assert (= (and start!98948 res!770192) b!1160603))

(assert (= (and b!1160603 res!770178) b!1160607))

(assert (= (and b!1160607 res!770189) b!1160613))

(assert (= (and b!1160613 res!770179) b!1160630))

(assert (= (and b!1160630 res!770185) b!1160631))

(assert (= (and b!1160631 res!770180) b!1160617))

(assert (= (and b!1160617 res!770190) b!1160605))

(assert (= (and b!1160605 res!770181) b!1160614))

(assert (= (and b!1160614 res!770191) b!1160622))

(assert (= (and b!1160622 res!770182) b!1160619))

(assert (= (and b!1160619 (not res!770188)) b!1160621))

(assert (= (and b!1160621 (not res!770183)) b!1160610))

(assert (= (and b!1160610 c!115866) b!1160602))

(assert (= (and b!1160610 (not c!115866)) b!1160616))

(assert (= (or b!1160602 b!1160616) bm!56231))

(assert (= (or b!1160602 b!1160616) bm!56227))

(assert (= (and b!1160610 (not res!770184)) b!1160626))

(assert (= (and b!1160626 c!115868) b!1160627))

(assert (= (and b!1160626 (not c!115868)) b!1160625))

(assert (= (and b!1160627 c!115864) b!1160604))

(assert (= (and b!1160627 (not c!115864)) b!1160624))

(assert (= (and b!1160624 c!115863) b!1160628))

(assert (= (and b!1160624 (not c!115863)) b!1160615))

(assert (= (and b!1160615 c!115867) b!1160611))

(assert (= (and b!1160615 (not c!115867)) b!1160623))

(assert (= (or b!1160628 b!1160611) bm!56224))

(assert (= (or b!1160628 b!1160611) bm!56226))

(assert (= (or b!1160628 b!1160611) bm!56225))

(assert (= (or b!1160604 bm!56225) bm!56230))

(assert (= (or b!1160604 bm!56224) bm!56228))

(assert (= (or b!1160604 bm!56226) bm!56229))

(assert (= (and b!1160627 c!115865) b!1160620))

(assert (= (and b!1160627 (not c!115865)) b!1160606))

(assert (= (and b!1160627 res!770186) b!1160629))

(assert (= (and b!1160626 res!770187) b!1160612))

(assert (= (and b!1160609 condMapEmpty!45458) mapIsEmpty!45458))

(assert (= (and b!1160609 (not condMapEmpty!45458)) mapNonEmpty!45458))

(get-info :version)

(assert (= (and mapNonEmpty!45458 ((_ is ValueCellFull!13835) mapValue!45458)) b!1160608))

(assert (= (and b!1160609 ((_ is ValueCellFull!13835) mapDefault!45458)) b!1160618))

(assert (= start!98948 b!1160609))

(declare-fun b_lambda!19647 () Bool)

(assert (=> (not b_lambda!19647) (not b!1160621)))

(declare-fun t!36946 () Bool)

(declare-fun tb!9363 () Bool)

(assert (=> (and start!98948 (= defaultEntry!1004 defaultEntry!1004) t!36946) tb!9363))

(declare-fun result!19299 () Bool)

(assert (=> tb!9363 (= result!19299 tp_is_empty!29089)))

(assert (=> b!1160621 t!36946))

(declare-fun b_and!39947 () Bool)

(assert (= b_and!39945 (and (=> t!36946 result!19299) b_and!39947)))

(declare-fun m!1069035 () Bool)

(assert (=> b!1160619 m!1069035))

(declare-fun m!1069037 () Bool)

(assert (=> b!1160619 m!1069037))

(declare-fun m!1069039 () Bool)

(assert (=> b!1160612 m!1069039))

(declare-fun m!1069041 () Bool)

(assert (=> start!98948 m!1069041))

(declare-fun m!1069043 () Bool)

(assert (=> start!98948 m!1069043))

(declare-fun m!1069045 () Bool)

(assert (=> b!1160605 m!1069045))

(declare-fun m!1069047 () Bool)

(assert (=> b!1160626 m!1069047))

(assert (=> b!1160626 m!1069047))

(declare-fun m!1069049 () Bool)

(assert (=> b!1160626 m!1069049))

(declare-fun m!1069051 () Bool)

(assert (=> b!1160626 m!1069051))

(declare-fun m!1069053 () Bool)

(assert (=> b!1160626 m!1069053))

(declare-fun m!1069055 () Bool)

(assert (=> b!1160626 m!1069055))

(declare-fun m!1069057 () Bool)

(assert (=> b!1160626 m!1069057))

(assert (=> b!1160626 m!1069051))

(assert (=> b!1160626 m!1069055))

(declare-fun m!1069059 () Bool)

(assert (=> b!1160626 m!1069059))

(assert (=> b!1160626 m!1069055))

(declare-fun m!1069061 () Bool)

(assert (=> b!1160626 m!1069061))

(declare-fun m!1069063 () Bool)

(assert (=> b!1160626 m!1069063))

(declare-fun m!1069065 () Bool)

(assert (=> bm!56230 m!1069065))

(declare-fun m!1069067 () Bool)

(assert (=> b!1160627 m!1069067))

(declare-fun m!1069069 () Bool)

(assert (=> b!1160627 m!1069069))

(declare-fun m!1069071 () Bool)

(assert (=> b!1160627 m!1069071))

(declare-fun m!1069073 () Bool)

(assert (=> b!1160627 m!1069073))

(declare-fun m!1069075 () Bool)

(assert (=> b!1160620 m!1069075))

(assert (=> bm!56231 m!1069039))

(declare-fun m!1069077 () Bool)

(assert (=> b!1160603 m!1069077))

(declare-fun m!1069079 () Bool)

(assert (=> b!1160617 m!1069079))

(assert (=> b!1160629 m!1069075))

(assert (=> bm!56227 m!1069061))

(declare-fun m!1069081 () Bool)

(assert (=> b!1160630 m!1069081))

(assert (=> b!1160610 m!1069055))

(declare-fun m!1069083 () Bool)

(assert (=> b!1160610 m!1069083))

(declare-fun m!1069085 () Bool)

(assert (=> bm!56228 m!1069085))

(declare-fun m!1069087 () Bool)

(assert (=> bm!56229 m!1069087))

(declare-fun m!1069089 () Bool)

(assert (=> b!1160621 m!1069089))

(declare-fun m!1069091 () Bool)

(assert (=> b!1160621 m!1069091))

(declare-fun m!1069093 () Bool)

(assert (=> b!1160621 m!1069093))

(declare-fun m!1069095 () Bool)

(assert (=> b!1160621 m!1069095))

(declare-fun m!1069097 () Bool)

(assert (=> b!1160604 m!1069097))

(declare-fun m!1069099 () Bool)

(assert (=> b!1160604 m!1069099))

(declare-fun m!1069101 () Bool)

(assert (=> b!1160604 m!1069101))

(declare-fun m!1069103 () Bool)

(assert (=> b!1160614 m!1069103))

(declare-fun m!1069105 () Bool)

(assert (=> b!1160614 m!1069105))

(declare-fun m!1069107 () Bool)

(assert (=> b!1160622 m!1069107))

(declare-fun m!1069109 () Bool)

(assert (=> mapNonEmpty!45458 m!1069109))

(declare-fun m!1069111 () Bool)

(assert (=> b!1160602 m!1069111))

(declare-fun m!1069113 () Bool)

(assert (=> b!1160613 m!1069113))

(check-sat (not bm!56231) (not bm!56227) (not b!1160602) (not bm!56229) (not b!1160603) (not b!1160626) (not b!1160614) (not b_lambda!19647) (not b!1160627) (not bm!56228) (not b!1160604) (not b!1160620) (not start!98948) (not mapNonEmpty!45458) (not b!1160612) (not b!1160619) (not b!1160610) (not b!1160613) (not b_next!24559) (not b!1160629) b_and!39947 (not b!1160622) (not bm!56230) tp_is_empty!29089 (not b!1160630) (not b!1160617) (not b!1160621))
(check-sat b_and!39947 (not b_next!24559))
