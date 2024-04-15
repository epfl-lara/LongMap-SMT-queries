; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101718 () Bool)

(assert start!101718)

(declare-fun b_free!26413 () Bool)

(declare-fun b_next!26413 () Bool)

(assert (=> start!101718 (= b_free!26413 (not b_next!26413))))

(declare-fun tp!92284 () Bool)

(declare-fun b_and!44069 () Bool)

(assert (=> start!101718 (= tp!92284 b_and!44069)))

(declare-fun b!1224124 () Bool)

(declare-fun e!695243 () Bool)

(declare-fun e!695245 () Bool)

(assert (=> b!1224124 (= e!695243 e!695245)))

(declare-fun res!813419 () Bool)

(assert (=> b!1224124 (=> res!813419 e!695245)))

(declare-datatypes ((array!78938 0))(
  ( (array!78939 (arr!38096 (Array (_ BitVec 32) (_ BitVec 64))) (size!38634 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78938)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224124 (= res!813419 (not (validKeyInArray!0 (select (arr!38096 _keys!1208) from!1455))))))

(declare-datatypes ((V!46617 0))(
  ( (V!46618 (val!15615 Int)) )
))
(declare-datatypes ((tuple2!20204 0))(
  ( (tuple2!20205 (_1!10113 (_ BitVec 64)) (_2!10113 V!46617)) )
))
(declare-datatypes ((List!26984 0))(
  ( (Nil!26981) (Cons!26980 (h!28189 tuple2!20204) (t!40368 List!26984)) )
))
(declare-datatypes ((ListLongMap!18173 0))(
  ( (ListLongMap!18174 (toList!9102 List!26984)) )
))
(declare-fun lt!557205 () ListLongMap!18173)

(declare-fun lt!557209 () ListLongMap!18173)

(assert (=> b!1224124 (= lt!557205 lt!557209)))

(declare-fun lt!557214 () ListLongMap!18173)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1921 (ListLongMap!18173 (_ BitVec 64)) ListLongMap!18173)

(assert (=> b!1224124 (= lt!557209 (-!1921 lt!557214 k0!934))))

(declare-fun zeroValue!944 () V!46617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557206 () array!78938)

(declare-datatypes ((ValueCell!14849 0))(
  ( (ValueCellFull!14849 (v!18276 V!46617)) (EmptyCell!14849) )
))
(declare-datatypes ((array!78940 0))(
  ( (array!78941 (arr!38097 (Array (_ BitVec 32) ValueCell!14849)) (size!38635 (_ BitVec 32))) )
))
(declare-fun lt!557201 () array!78940)

(declare-fun minValue!944 () V!46617)

(declare-fun getCurrentListMapNoExtraKeys!5534 (array!78938 array!78940 (_ BitVec 32) (_ BitVec 32) V!46617 V!46617 (_ BitVec 32) Int) ListLongMap!18173)

(assert (=> b!1224124 (= lt!557205 (getCurrentListMapNoExtraKeys!5534 lt!557206 lt!557201 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78940)

(assert (=> b!1224124 (= lt!557214 (getCurrentListMapNoExtraKeys!5534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40402 0))(
  ( (Unit!40403) )
))
(declare-fun lt!557207 () Unit!40402)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1156 (array!78938 array!78940 (_ BitVec 32) (_ BitVec 32) V!46617 V!46617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40402)

(assert (=> b!1224124 (= lt!557207 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1156 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!695242 () Bool)

(declare-fun b!1224125 () Bool)

(declare-fun arrayContainsKey!0 (array!78938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224125 (= e!695242 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224126 () Bool)

(declare-fun e!695248 () Bool)

(assert (=> b!1224126 (= e!695248 e!695242)))

(declare-fun res!813412 () Bool)

(assert (=> b!1224126 (=> res!813412 e!695242)))

(assert (=> b!1224126 (= res!813412 (not (= (select (arr!38096 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224127 () Bool)

(declare-fun res!813413 () Bool)

(declare-fun e!695244 () Bool)

(assert (=> b!1224127 (=> (not res!813413) (not e!695244))))

(assert (=> b!1224127 (= res!813413 (validKeyInArray!0 k0!934))))

(declare-fun res!813415 () Bool)

(assert (=> start!101718 (=> (not res!813415) (not e!695244))))

(assert (=> start!101718 (= res!813415 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38634 _keys!1208))))))

(assert (=> start!101718 e!695244))

(declare-fun tp_is_empty!31117 () Bool)

(assert (=> start!101718 tp_is_empty!31117))

(declare-fun array_inv!29104 (array!78938) Bool)

(assert (=> start!101718 (array_inv!29104 _keys!1208)))

(assert (=> start!101718 true))

(assert (=> start!101718 tp!92284))

(declare-fun e!695238 () Bool)

(declare-fun array_inv!29105 (array!78940) Bool)

(assert (=> start!101718 (and (array_inv!29105 _values!996) e!695238)))

(declare-fun b!1224128 () Bool)

(declare-fun res!813425 () Bool)

(assert (=> b!1224128 (=> (not res!813425) (not e!695244))))

(declare-datatypes ((List!26985 0))(
  ( (Nil!26982) (Cons!26981 (h!28190 (_ BitVec 64)) (t!40369 List!26985)) )
))
(declare-fun arrayNoDuplicates!0 (array!78938 (_ BitVec 32) List!26985) Bool)

(assert (=> b!1224128 (= res!813425 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26982))))

(declare-fun b!1224129 () Bool)

(declare-fun res!813417 () Bool)

(assert (=> b!1224129 (=> (not res!813417) (not e!695244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224129 (= res!813417 (validMask!0 mask!1564))))

(declare-fun b!1224130 () Bool)

(declare-fun e!695241 () Unit!40402)

(declare-fun Unit!40404 () Unit!40402)

(assert (=> b!1224130 (= e!695241 Unit!40404)))

(declare-fun b!1224131 () Bool)

(declare-fun res!813426 () Bool)

(assert (=> b!1224131 (=> (not res!813426) (not e!695244))))

(assert (=> b!1224131 (= res!813426 (and (= (size!38635 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38634 _keys!1208) (size!38635 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224132 () Bool)

(declare-fun e!695239 () Bool)

(assert (=> b!1224132 (= e!695244 e!695239)))

(declare-fun res!813414 () Bool)

(assert (=> b!1224132 (=> (not res!813414) (not e!695239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78938 (_ BitVec 32)) Bool)

(assert (=> b!1224132 (= res!813414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557206 mask!1564))))

(assert (=> b!1224132 (= lt!557206 (array!78939 (store (arr!38096 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38634 _keys!1208)))))

(declare-fun b!1224133 () Bool)

(declare-fun e!695236 () Bool)

(assert (=> b!1224133 (= e!695236 e!695243)))

(declare-fun res!813416 () Bool)

(assert (=> b!1224133 (=> res!813416 e!695243)))

(assert (=> b!1224133 (= res!813416 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!557211 () ListLongMap!18173)

(assert (=> b!1224133 (= lt!557211 (getCurrentListMapNoExtraKeys!5534 lt!557206 lt!557201 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!557213 () V!46617)

(assert (=> b!1224133 (= lt!557201 (array!78941 (store (arr!38097 _values!996) i!673 (ValueCellFull!14849 lt!557213)) (size!38635 _values!996)))))

(declare-fun dynLambda!3380 (Int (_ BitVec 64)) V!46617)

(assert (=> b!1224133 (= lt!557213 (dynLambda!3380 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!557210 () ListLongMap!18173)

(assert (=> b!1224133 (= lt!557210 (getCurrentListMapNoExtraKeys!5534 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!48574 () Bool)

(declare-fun mapRes!48574 () Bool)

(assert (=> mapIsEmpty!48574 mapRes!48574))

(declare-fun b!1224134 () Bool)

(declare-fun res!813418 () Bool)

(assert (=> b!1224134 (=> (not res!813418) (not e!695244))))

(assert (=> b!1224134 (= res!813418 (= (select (arr!38096 _keys!1208) i!673) k0!934))))

(declare-fun b!1224135 () Bool)

(declare-fun res!813423 () Bool)

(assert (=> b!1224135 (=> (not res!813423) (not e!695244))))

(assert (=> b!1224135 (= res!813423 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38634 _keys!1208))))))

(declare-fun b!1224136 () Bool)

(assert (=> b!1224136 (= e!695245 (bvslt from!1455 (size!38635 _values!996)))))

(declare-fun e!695237 () Bool)

(assert (=> b!1224136 e!695237))

(declare-fun res!813411 () Bool)

(assert (=> b!1224136 (=> (not res!813411) (not e!695237))))

(assert (=> b!1224136 (= res!813411 (not (= (select (arr!38096 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!557215 () Unit!40402)

(assert (=> b!1224136 (= lt!557215 e!695241)))

(declare-fun c!120419 () Bool)

(assert (=> b!1224136 (= c!120419 (= (select (arr!38096 _keys!1208) from!1455) k0!934))))

(assert (=> b!1224136 e!695248))

(declare-fun res!813410 () Bool)

(assert (=> b!1224136 (=> (not res!813410) (not e!695248))))

(declare-fun lt!557203 () tuple2!20204)

(declare-fun +!4163 (ListLongMap!18173 tuple2!20204) ListLongMap!18173)

(assert (=> b!1224136 (= res!813410 (= lt!557211 (+!4163 lt!557209 lt!557203)))))

(declare-fun get!19474 (ValueCell!14849 V!46617) V!46617)

(assert (=> b!1224136 (= lt!557203 (tuple2!20205 (select (arr!38096 _keys!1208) from!1455) (get!19474 (select (arr!38097 _values!996) from!1455) lt!557213)))))

(declare-fun b!1224137 () Bool)

(declare-fun res!813422 () Bool)

(assert (=> b!1224137 (=> (not res!813422) (not e!695237))))

(assert (=> b!1224137 (= res!813422 (= lt!557210 (+!4163 lt!557214 lt!557203)))))

(declare-fun b!1224138 () Bool)

(assert (=> b!1224138 (= e!695237 (= lt!557209 lt!557205))))

(declare-fun b!1224139 () Bool)

(declare-fun res!813421 () Bool)

(assert (=> b!1224139 (=> (not res!813421) (not e!695244))))

(assert (=> b!1224139 (= res!813421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48574 () Bool)

(declare-fun tp!92285 () Bool)

(declare-fun e!695240 () Bool)

(assert (=> mapNonEmpty!48574 (= mapRes!48574 (and tp!92285 e!695240))))

(declare-fun mapValue!48574 () ValueCell!14849)

(declare-fun mapRest!48574 () (Array (_ BitVec 32) ValueCell!14849))

(declare-fun mapKey!48574 () (_ BitVec 32))

(assert (=> mapNonEmpty!48574 (= (arr!38097 _values!996) (store mapRest!48574 mapKey!48574 mapValue!48574))))

(declare-fun b!1224140 () Bool)

(declare-fun Unit!40405 () Unit!40402)

(assert (=> b!1224140 (= e!695241 Unit!40405)))

(declare-fun lt!557204 () Unit!40402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78938 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40402)

(assert (=> b!1224140 (= lt!557204 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224140 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557212 () Unit!40402)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78938 (_ BitVec 32) (_ BitVec 32)) Unit!40402)

(assert (=> b!1224140 (= lt!557212 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224140 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26982)))

(declare-fun lt!557202 () Unit!40402)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78938 (_ BitVec 64) (_ BitVec 32) List!26985) Unit!40402)

(assert (=> b!1224140 (= lt!557202 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26982))))

(assert (=> b!1224140 false))

(declare-fun b!1224141 () Bool)

(assert (=> b!1224141 (= e!695240 tp_is_empty!31117)))

(declare-fun b!1224142 () Bool)

(assert (=> b!1224142 (= e!695239 (not e!695236))))

(declare-fun res!813424 () Bool)

(assert (=> b!1224142 (=> res!813424 e!695236)))

(assert (=> b!1224142 (= res!813424 (bvsgt from!1455 i!673))))

(assert (=> b!1224142 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557208 () Unit!40402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78938 (_ BitVec 64) (_ BitVec 32)) Unit!40402)

(assert (=> b!1224142 (= lt!557208 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224143 () Bool)

(declare-fun res!813420 () Bool)

(assert (=> b!1224143 (=> (not res!813420) (not e!695239))))

(assert (=> b!1224143 (= res!813420 (arrayNoDuplicates!0 lt!557206 #b00000000000000000000000000000000 Nil!26982))))

(declare-fun b!1224144 () Bool)

(declare-fun e!695246 () Bool)

(assert (=> b!1224144 (= e!695246 tp_is_empty!31117)))

(declare-fun b!1224145 () Bool)

(assert (=> b!1224145 (= e!695238 (and e!695246 mapRes!48574))))

(declare-fun condMapEmpty!48574 () Bool)

(declare-fun mapDefault!48574 () ValueCell!14849)

(assert (=> b!1224145 (= condMapEmpty!48574 (= (arr!38097 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14849)) mapDefault!48574)))))

(assert (= (and start!101718 res!813415) b!1224129))

(assert (= (and b!1224129 res!813417) b!1224131))

(assert (= (and b!1224131 res!813426) b!1224139))

(assert (= (and b!1224139 res!813421) b!1224128))

(assert (= (and b!1224128 res!813425) b!1224135))

(assert (= (and b!1224135 res!813423) b!1224127))

(assert (= (and b!1224127 res!813413) b!1224134))

(assert (= (and b!1224134 res!813418) b!1224132))

(assert (= (and b!1224132 res!813414) b!1224143))

(assert (= (and b!1224143 res!813420) b!1224142))

(assert (= (and b!1224142 (not res!813424)) b!1224133))

(assert (= (and b!1224133 (not res!813416)) b!1224124))

(assert (= (and b!1224124 (not res!813419)) b!1224136))

(assert (= (and b!1224136 res!813410) b!1224126))

(assert (= (and b!1224126 (not res!813412)) b!1224125))

(assert (= (and b!1224136 c!120419) b!1224140))

(assert (= (and b!1224136 (not c!120419)) b!1224130))

(assert (= (and b!1224136 res!813411) b!1224137))

(assert (= (and b!1224137 res!813422) b!1224138))

(assert (= (and b!1224145 condMapEmpty!48574) mapIsEmpty!48574))

(assert (= (and b!1224145 (not condMapEmpty!48574)) mapNonEmpty!48574))

(get-info :version)

(assert (= (and mapNonEmpty!48574 ((_ is ValueCellFull!14849) mapValue!48574)) b!1224141))

(assert (= (and b!1224145 ((_ is ValueCellFull!14849) mapDefault!48574)) b!1224144))

(assert (= start!101718 b!1224145))

(declare-fun b_lambda!22383 () Bool)

(assert (=> (not b_lambda!22383) (not b!1224133)))

(declare-fun t!40367 () Bool)

(declare-fun tb!11205 () Bool)

(assert (=> (and start!101718 (= defaultEntry!1004 defaultEntry!1004) t!40367) tb!11205))

(declare-fun result!23031 () Bool)

(assert (=> tb!11205 (= result!23031 tp_is_empty!31117)))

(assert (=> b!1224133 t!40367))

(declare-fun b_and!44071 () Bool)

(assert (= b_and!44069 (and (=> t!40367 result!23031) b_and!44071)))

(declare-fun m!1128677 () Bool)

(assert (=> b!1224129 m!1128677))

(declare-fun m!1128679 () Bool)

(assert (=> b!1224143 m!1128679))

(declare-fun m!1128681 () Bool)

(assert (=> b!1224133 m!1128681))

(declare-fun m!1128683 () Bool)

(assert (=> b!1224133 m!1128683))

(declare-fun m!1128685 () Bool)

(assert (=> b!1224133 m!1128685))

(declare-fun m!1128687 () Bool)

(assert (=> b!1224133 m!1128687))

(declare-fun m!1128689 () Bool)

(assert (=> b!1224136 m!1128689))

(declare-fun m!1128691 () Bool)

(assert (=> b!1224136 m!1128691))

(declare-fun m!1128693 () Bool)

(assert (=> b!1224136 m!1128693))

(assert (=> b!1224136 m!1128693))

(declare-fun m!1128695 () Bool)

(assert (=> b!1224136 m!1128695))

(declare-fun m!1128697 () Bool)

(assert (=> b!1224127 m!1128697))

(declare-fun m!1128699 () Bool)

(assert (=> b!1224132 m!1128699))

(declare-fun m!1128701 () Bool)

(assert (=> b!1224132 m!1128701))

(declare-fun m!1128703 () Bool)

(assert (=> mapNonEmpty!48574 m!1128703))

(declare-fun m!1128705 () Bool)

(assert (=> b!1224140 m!1128705))

(declare-fun m!1128707 () Bool)

(assert (=> b!1224140 m!1128707))

(declare-fun m!1128709 () Bool)

(assert (=> b!1224140 m!1128709))

(declare-fun m!1128711 () Bool)

(assert (=> b!1224140 m!1128711))

(declare-fun m!1128713 () Bool)

(assert (=> b!1224140 m!1128713))

(declare-fun m!1128715 () Bool)

(assert (=> b!1224142 m!1128715))

(declare-fun m!1128717 () Bool)

(assert (=> b!1224142 m!1128717))

(assert (=> b!1224126 m!1128689))

(declare-fun m!1128719 () Bool)

(assert (=> b!1224139 m!1128719))

(declare-fun m!1128721 () Bool)

(assert (=> b!1224134 m!1128721))

(declare-fun m!1128723 () Bool)

(assert (=> b!1224128 m!1128723))

(declare-fun m!1128725 () Bool)

(assert (=> b!1224124 m!1128725))

(declare-fun m!1128727 () Bool)

(assert (=> b!1224124 m!1128727))

(declare-fun m!1128729 () Bool)

(assert (=> b!1224124 m!1128729))

(declare-fun m!1128731 () Bool)

(assert (=> b!1224124 m!1128731))

(assert (=> b!1224124 m!1128689))

(declare-fun m!1128733 () Bool)

(assert (=> b!1224124 m!1128733))

(assert (=> b!1224124 m!1128689))

(declare-fun m!1128735 () Bool)

(assert (=> b!1224137 m!1128735))

(declare-fun m!1128737 () Bool)

(assert (=> b!1224125 m!1128737))

(declare-fun m!1128739 () Bool)

(assert (=> start!101718 m!1128739))

(declare-fun m!1128741 () Bool)

(assert (=> start!101718 m!1128741))

(check-sat (not b!1224133) (not b!1224127) (not b!1224129) (not b!1224143) tp_is_empty!31117 (not b!1224140) (not b!1224124) b_and!44071 (not b_next!26413) (not b!1224125) (not mapNonEmpty!48574) (not b!1224132) (not b_lambda!22383) (not b!1224139) (not b!1224128) (not b!1224137) (not b!1224136) (not start!101718) (not b!1224142))
(check-sat b_and!44071 (not b_next!26413))
