; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99834 () Bool)

(assert start!99834)

(declare-fun b_free!25413 () Bool)

(declare-fun b_next!25413 () Bool)

(assert (=> start!99834 (= b_free!25413 (not b_next!25413))))

(declare-fun tp!88953 () Bool)

(declare-fun b_and!41693 () Bool)

(assert (=> start!99834 (= tp!88953 b_and!41693)))

(declare-fun b!1187089 () Bool)

(declare-fun e!674966 () Bool)

(declare-fun tp_is_empty!29943 () Bool)

(assert (=> b!1187089 (= e!674966 tp_is_empty!29943)))

(declare-fun b!1187090 () Bool)

(declare-fun e!674965 () Bool)

(declare-fun e!674971 () Bool)

(assert (=> b!1187090 (= e!674965 e!674971)))

(declare-fun res!789197 () Bool)

(assert (=> b!1187090 (=> res!789197 e!674971)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187090 (= res!789197 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45051 0))(
  ( (V!45052 (val!15028 Int)) )
))
(declare-fun zeroValue!944 () V!45051)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!76681 0))(
  ( (array!76682 (arr!36990 (Array (_ BitVec 32) (_ BitVec 64))) (size!37526 (_ BitVec 32))) )
))
(declare-fun lt!539540 () array!76681)

(declare-fun minValue!944 () V!45051)

(declare-datatypes ((ValueCell!14262 0))(
  ( (ValueCellFull!14262 (v!17666 V!45051)) (EmptyCell!14262) )
))
(declare-datatypes ((array!76683 0))(
  ( (array!76684 (arr!36991 (Array (_ BitVec 32) ValueCell!14262)) (size!37527 (_ BitVec 32))) )
))
(declare-fun lt!539527 () array!76683)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19288 0))(
  ( (tuple2!19289 (_1!9655 (_ BitVec 64)) (_2!9655 V!45051)) )
))
(declare-datatypes ((List!26028 0))(
  ( (Nil!26025) (Cons!26024 (h!27233 tuple2!19288) (t!38433 List!26028)) )
))
(declare-datatypes ((ListLongMap!17257 0))(
  ( (ListLongMap!17258 (toList!8644 List!26028)) )
))
(declare-fun lt!539528 () ListLongMap!17257)

(declare-fun getCurrentListMapNoExtraKeys!5087 (array!76681 array!76683 (_ BitVec 32) (_ BitVec 32) V!45051 V!45051 (_ BitVec 32) Int) ListLongMap!17257)

(assert (=> b!1187090 (= lt!539528 (getCurrentListMapNoExtraKeys!5087 lt!539540 lt!539527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76683)

(declare-fun lt!539524 () V!45051)

(assert (=> b!1187090 (= lt!539527 (array!76684 (store (arr!36991 _values!996) i!673 (ValueCellFull!14262 lt!539524)) (size!37527 _values!996)))))

(declare-fun dynLambda!3036 (Int (_ BitVec 64)) V!45051)

(assert (=> b!1187090 (= lt!539524 (dynLambda!3036 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76681)

(declare-fun lt!539533 () ListLongMap!17257)

(assert (=> b!1187090 (= lt!539533 (getCurrentListMapNoExtraKeys!5087 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187091 () Bool)

(declare-fun res!789196 () Bool)

(declare-fun e!674972 () Bool)

(assert (=> b!1187091 (=> (not res!789196) (not e!674972))))

(assert (=> b!1187091 (= res!789196 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37526 _keys!1208))))))

(declare-fun b!1187092 () Bool)

(declare-fun res!789205 () Bool)

(assert (=> b!1187092 (=> (not res!789205) (not e!674972))))

(declare-datatypes ((List!26029 0))(
  ( (Nil!26026) (Cons!26025 (h!27234 (_ BitVec 64)) (t!38434 List!26029)) )
))
(declare-fun arrayNoDuplicates!0 (array!76681 (_ BitVec 32) List!26029) Bool)

(assert (=> b!1187092 (= res!789205 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26026))))

(declare-fun b!1187093 () Bool)

(declare-fun e!674964 () Bool)

(assert (=> b!1187093 (= e!674972 e!674964)))

(declare-fun res!789200 () Bool)

(assert (=> b!1187093 (=> (not res!789200) (not e!674964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76681 (_ BitVec 32)) Bool)

(assert (=> b!1187093 (= res!789200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539540 mask!1564))))

(assert (=> b!1187093 (= lt!539540 (array!76682 (store (arr!36990 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37526 _keys!1208)))))

(declare-fun b!1187094 () Bool)

(declare-fun e!674969 () Bool)

(assert (=> b!1187094 (= e!674969 tp_is_empty!29943)))

(declare-fun b!1187095 () Bool)

(assert (=> b!1187095 (= e!674964 (not e!674965))))

(declare-fun res!789203 () Bool)

(assert (=> b!1187095 (=> res!789203 e!674965)))

(assert (=> b!1187095 (= res!789203 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187095 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39357 0))(
  ( (Unit!39358) )
))
(declare-fun lt!539541 () Unit!39357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76681 (_ BitVec 64) (_ BitVec 32)) Unit!39357)

(assert (=> b!1187095 (= lt!539541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187096 () Bool)

(declare-fun res!789199 () Bool)

(assert (=> b!1187096 (=> (not res!789199) (not e!674964))))

(assert (=> b!1187096 (= res!789199 (arrayNoDuplicates!0 lt!539540 #b00000000000000000000000000000000 Nil!26026))))

(declare-fun b!1187097 () Bool)

(declare-fun e!674973 () Unit!39357)

(declare-fun Unit!39359 () Unit!39357)

(assert (=> b!1187097 (= e!674973 Unit!39359)))

(declare-fun b!1187098 () Bool)

(declare-fun res!789206 () Bool)

(assert (=> b!1187098 (=> (not res!789206) (not e!674972))))

(assert (=> b!1187098 (= res!789206 (= (select (arr!36990 _keys!1208) i!673) k0!934))))

(declare-fun b!1187099 () Bool)

(declare-fun e!674968 () Bool)

(declare-fun mapRes!46742 () Bool)

(assert (=> b!1187099 (= e!674968 (and e!674969 mapRes!46742))))

(declare-fun condMapEmpty!46742 () Bool)

(declare-fun mapDefault!46742 () ValueCell!14262)

(assert (=> b!1187099 (= condMapEmpty!46742 (= (arr!36991 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14262)) mapDefault!46742)))))

(declare-fun b!1187101 () Bool)

(declare-fun res!789201 () Bool)

(assert (=> b!1187101 (=> (not res!789201) (not e!674972))))

(assert (=> b!1187101 (= res!789201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187102 () Bool)

(declare-fun e!674970 () Bool)

(assert (=> b!1187102 (= e!674971 e!674970)))

(declare-fun res!789202 () Bool)

(assert (=> b!1187102 (=> res!789202 e!674970)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187102 (= res!789202 (not (validKeyInArray!0 (select (arr!36990 _keys!1208) from!1455))))))

(declare-fun lt!539531 () ListLongMap!17257)

(declare-fun lt!539537 () ListLongMap!17257)

(assert (=> b!1187102 (= lt!539531 lt!539537)))

(declare-fun lt!539536 () ListLongMap!17257)

(declare-fun -!1675 (ListLongMap!17257 (_ BitVec 64)) ListLongMap!17257)

(assert (=> b!1187102 (= lt!539537 (-!1675 lt!539536 k0!934))))

(assert (=> b!1187102 (= lt!539531 (getCurrentListMapNoExtraKeys!5087 lt!539540 lt!539527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187102 (= lt!539536 (getCurrentListMapNoExtraKeys!5087 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539526 () Unit!39357)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!887 (array!76681 array!76683 (_ BitVec 32) (_ BitVec 32) V!45051 V!45051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39357)

(assert (=> b!1187102 (= lt!539526 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187103 () Bool)

(assert (=> b!1187103 (= e!674970 true)))

(declare-fun lt!539530 () ListLongMap!17257)

(declare-fun lt!539523 () ListLongMap!17257)

(assert (=> b!1187103 (= (-!1675 lt!539530 k0!934) lt!539523)))

(declare-fun lt!539525 () V!45051)

(declare-fun lt!539538 () Unit!39357)

(declare-fun addRemoveCommutativeForDiffKeys!197 (ListLongMap!17257 (_ BitVec 64) V!45051 (_ BitVec 64)) Unit!39357)

(assert (=> b!1187103 (= lt!539538 (addRemoveCommutativeForDiffKeys!197 lt!539536 (select (arr!36990 _keys!1208) from!1455) lt!539525 k0!934))))

(assert (=> b!1187103 (and (= lt!539533 lt!539530) (= lt!539537 lt!539531))))

(declare-fun lt!539532 () tuple2!19288)

(declare-fun +!3934 (ListLongMap!17257 tuple2!19288) ListLongMap!17257)

(assert (=> b!1187103 (= lt!539530 (+!3934 lt!539536 lt!539532))))

(assert (=> b!1187103 (not (= (select (arr!36990 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539535 () Unit!39357)

(assert (=> b!1187103 (= lt!539535 e!674973)))

(declare-fun c!117243 () Bool)

(assert (=> b!1187103 (= c!117243 (= (select (arr!36990 _keys!1208) from!1455) k0!934))))

(declare-fun e!674963 () Bool)

(assert (=> b!1187103 e!674963))

(declare-fun res!789207 () Bool)

(assert (=> b!1187103 (=> (not res!789207) (not e!674963))))

(assert (=> b!1187103 (= res!789207 (= lt!539528 lt!539523))))

(assert (=> b!1187103 (= lt!539523 (+!3934 lt!539537 lt!539532))))

(assert (=> b!1187103 (= lt!539532 (tuple2!19289 (select (arr!36990 _keys!1208) from!1455) lt!539525))))

(declare-fun get!18945 (ValueCell!14262 V!45051) V!45051)

(assert (=> b!1187103 (= lt!539525 (get!18945 (select (arr!36991 _values!996) from!1455) lt!539524))))

(declare-fun b!1187104 () Bool)

(declare-fun res!789204 () Bool)

(assert (=> b!1187104 (=> (not res!789204) (not e!674972))))

(assert (=> b!1187104 (= res!789204 (validKeyInArray!0 k0!934))))

(declare-fun b!1187105 () Bool)

(declare-fun e!674974 () Bool)

(assert (=> b!1187105 (= e!674974 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187106 () Bool)

(declare-fun res!789198 () Bool)

(assert (=> b!1187106 (=> (not res!789198) (not e!674972))))

(assert (=> b!1187106 (= res!789198 (and (= (size!37527 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37526 _keys!1208) (size!37527 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187107 () Bool)

(assert (=> b!1187107 (= e!674963 e!674974)))

(declare-fun res!789195 () Bool)

(assert (=> b!1187107 (=> res!789195 e!674974)))

(assert (=> b!1187107 (= res!789195 (not (= (select (arr!36990 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!46742 () Bool)

(assert (=> mapIsEmpty!46742 mapRes!46742))

(declare-fun b!1187108 () Bool)

(declare-fun res!789208 () Bool)

(assert (=> b!1187108 (=> (not res!789208) (not e!674972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187108 (= res!789208 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46742 () Bool)

(declare-fun tp!88952 () Bool)

(assert (=> mapNonEmpty!46742 (= mapRes!46742 (and tp!88952 e!674966))))

(declare-fun mapKey!46742 () (_ BitVec 32))

(declare-fun mapRest!46742 () (Array (_ BitVec 32) ValueCell!14262))

(declare-fun mapValue!46742 () ValueCell!14262)

(assert (=> mapNonEmpty!46742 (= (arr!36991 _values!996) (store mapRest!46742 mapKey!46742 mapValue!46742))))

(declare-fun b!1187100 () Bool)

(declare-fun Unit!39360 () Unit!39357)

(assert (=> b!1187100 (= e!674973 Unit!39360)))

(declare-fun lt!539529 () Unit!39357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76681 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39357)

(assert (=> b!1187100 (= lt!539529 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187100 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539539 () Unit!39357)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76681 (_ BitVec 32) (_ BitVec 32)) Unit!39357)

(assert (=> b!1187100 (= lt!539539 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187100 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26026)))

(declare-fun lt!539534 () Unit!39357)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76681 (_ BitVec 64) (_ BitVec 32) List!26029) Unit!39357)

(assert (=> b!1187100 (= lt!539534 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26026))))

(assert (=> b!1187100 false))

(declare-fun res!789194 () Bool)

(assert (=> start!99834 (=> (not res!789194) (not e!674972))))

(assert (=> start!99834 (= res!789194 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37526 _keys!1208))))))

(assert (=> start!99834 e!674972))

(assert (=> start!99834 tp_is_empty!29943))

(declare-fun array_inv!28226 (array!76681) Bool)

(assert (=> start!99834 (array_inv!28226 _keys!1208)))

(assert (=> start!99834 true))

(assert (=> start!99834 tp!88953))

(declare-fun array_inv!28227 (array!76683) Bool)

(assert (=> start!99834 (and (array_inv!28227 _values!996) e!674968)))

(assert (= (and start!99834 res!789194) b!1187108))

(assert (= (and b!1187108 res!789208) b!1187106))

(assert (= (and b!1187106 res!789198) b!1187101))

(assert (= (and b!1187101 res!789201) b!1187092))

(assert (= (and b!1187092 res!789205) b!1187091))

(assert (= (and b!1187091 res!789196) b!1187104))

(assert (= (and b!1187104 res!789204) b!1187098))

(assert (= (and b!1187098 res!789206) b!1187093))

(assert (= (and b!1187093 res!789200) b!1187096))

(assert (= (and b!1187096 res!789199) b!1187095))

(assert (= (and b!1187095 (not res!789203)) b!1187090))

(assert (= (and b!1187090 (not res!789197)) b!1187102))

(assert (= (and b!1187102 (not res!789202)) b!1187103))

(assert (= (and b!1187103 res!789207) b!1187107))

(assert (= (and b!1187107 (not res!789195)) b!1187105))

(assert (= (and b!1187103 c!117243) b!1187100))

(assert (= (and b!1187103 (not c!117243)) b!1187097))

(assert (= (and b!1187099 condMapEmpty!46742) mapIsEmpty!46742))

(assert (= (and b!1187099 (not condMapEmpty!46742)) mapNonEmpty!46742))

(get-info :version)

(assert (= (and mapNonEmpty!46742 ((_ is ValueCellFull!14262) mapValue!46742)) b!1187089))

(assert (= (and b!1187099 ((_ is ValueCellFull!14262) mapDefault!46742)) b!1187094))

(assert (= start!99834 b!1187099))

(declare-fun b_lambda!20557 () Bool)

(assert (=> (not b_lambda!20557) (not b!1187090)))

(declare-fun t!38432 () Bool)

(declare-fun tb!10225 () Bool)

(assert (=> (and start!99834 (= defaultEntry!1004 defaultEntry!1004) t!38432) tb!10225))

(declare-fun result!21017 () Bool)

(assert (=> tb!10225 (= result!21017 tp_is_empty!29943)))

(assert (=> b!1187090 t!38432))

(declare-fun b_and!41695 () Bool)

(assert (= b_and!41693 (and (=> t!38432 result!21017) b_and!41695)))

(declare-fun m!1095715 () Bool)

(assert (=> b!1187093 m!1095715))

(declare-fun m!1095717 () Bool)

(assert (=> b!1187093 m!1095717))

(declare-fun m!1095719 () Bool)

(assert (=> b!1187102 m!1095719))

(declare-fun m!1095721 () Bool)

(assert (=> b!1187102 m!1095721))

(declare-fun m!1095723 () Bool)

(assert (=> b!1187102 m!1095723))

(declare-fun m!1095725 () Bool)

(assert (=> b!1187102 m!1095725))

(declare-fun m!1095727 () Bool)

(assert (=> b!1187102 m!1095727))

(declare-fun m!1095729 () Bool)

(assert (=> b!1187102 m!1095729))

(assert (=> b!1187102 m!1095727))

(declare-fun m!1095731 () Bool)

(assert (=> b!1187096 m!1095731))

(declare-fun m!1095733 () Bool)

(assert (=> start!99834 m!1095733))

(declare-fun m!1095735 () Bool)

(assert (=> start!99834 m!1095735))

(declare-fun m!1095737 () Bool)

(assert (=> b!1187100 m!1095737))

(declare-fun m!1095739 () Bool)

(assert (=> b!1187100 m!1095739))

(declare-fun m!1095741 () Bool)

(assert (=> b!1187100 m!1095741))

(declare-fun m!1095743 () Bool)

(assert (=> b!1187100 m!1095743))

(declare-fun m!1095745 () Bool)

(assert (=> b!1187100 m!1095745))

(assert (=> b!1187107 m!1095727))

(assert (=> b!1187103 m!1095727))

(declare-fun m!1095747 () Bool)

(assert (=> b!1187103 m!1095747))

(declare-fun m!1095749 () Bool)

(assert (=> b!1187103 m!1095749))

(declare-fun m!1095751 () Bool)

(assert (=> b!1187103 m!1095751))

(declare-fun m!1095753 () Bool)

(assert (=> b!1187103 m!1095753))

(declare-fun m!1095755 () Bool)

(assert (=> b!1187103 m!1095755))

(assert (=> b!1187103 m!1095727))

(assert (=> b!1187103 m!1095751))

(declare-fun m!1095757 () Bool)

(assert (=> b!1187103 m!1095757))

(declare-fun m!1095759 () Bool)

(assert (=> b!1187090 m!1095759))

(declare-fun m!1095761 () Bool)

(assert (=> b!1187090 m!1095761))

(declare-fun m!1095763 () Bool)

(assert (=> b!1187090 m!1095763))

(declare-fun m!1095765 () Bool)

(assert (=> b!1187090 m!1095765))

(declare-fun m!1095767 () Bool)

(assert (=> b!1187098 m!1095767))

(declare-fun m!1095769 () Bool)

(assert (=> b!1187104 m!1095769))

(declare-fun m!1095771 () Bool)

(assert (=> b!1187095 m!1095771))

(declare-fun m!1095773 () Bool)

(assert (=> b!1187095 m!1095773))

(declare-fun m!1095775 () Bool)

(assert (=> b!1187092 m!1095775))

(declare-fun m!1095777 () Bool)

(assert (=> b!1187101 m!1095777))

(declare-fun m!1095779 () Bool)

(assert (=> mapNonEmpty!46742 m!1095779))

(declare-fun m!1095781 () Bool)

(assert (=> b!1187105 m!1095781))

(declare-fun m!1095783 () Bool)

(assert (=> b!1187108 m!1095783))

(check-sat (not b!1187104) (not b!1187100) (not b!1187096) (not b!1187103) (not b!1187108) (not b_lambda!20557) (not b!1187095) (not b!1187101) (not b!1187090) (not b!1187093) tp_is_empty!29943 (not start!99834) (not b!1187102) (not b!1187105) (not b_next!25413) b_and!41695 (not mapNonEmpty!46742) (not b!1187092))
(check-sat b_and!41695 (not b_next!25413))
