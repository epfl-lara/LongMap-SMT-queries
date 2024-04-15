; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99394 () Bool)

(assert start!99394)

(declare-fun b_free!24979 () Bool)

(declare-fun b_next!24979 () Bool)

(assert (=> start!99394 (= b_free!24979 (not b_next!24979))))

(declare-fun tp!87650 () Bool)

(declare-fun b_and!40803 () Bool)

(assert (=> start!99394 (= tp!87650 b_and!40803)))

(declare-fun b!1173169 () Bool)

(declare-datatypes ((Unit!38512 0))(
  ( (Unit!38513) )
))
(declare-fun e!666824 () Unit!38512)

(declare-fun Unit!38514 () Unit!38512)

(assert (=> b!1173169 (= e!666824 Unit!38514)))

(declare-fun lt!528645 () Unit!38512)

(declare-datatypes ((array!75760 0))(
  ( (array!75761 (arr!36530 (Array (_ BitVec 32) (_ BitVec 64))) (size!37068 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75760)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38512)

(assert (=> b!1173169 (= lt!528645 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173169 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528635 () Unit!38512)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75760 (_ BitVec 32) (_ BitVec 32)) Unit!38512)

(assert (=> b!1173169 (= lt!528635 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25736 0))(
  ( (Nil!25733) (Cons!25732 (h!26941 (_ BitVec 64)) (t!37698 List!25736)) )
))
(declare-fun arrayNoDuplicates!0 (array!75760 (_ BitVec 32) List!25736) Bool)

(assert (=> b!1173169 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25733)))

(declare-fun lt!528642 () Unit!38512)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75760 (_ BitVec 64) (_ BitVec 32) List!25736) Unit!38512)

(assert (=> b!1173169 (= lt!528642 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25733))))

(assert (=> b!1173169 false))

(declare-fun mapNonEmpty!46091 () Bool)

(declare-fun mapRes!46091 () Bool)

(declare-fun tp!87651 () Bool)

(declare-fun e!666828 () Bool)

(assert (=> mapNonEmpty!46091 (= mapRes!46091 (and tp!87651 e!666828))))

(declare-fun mapKey!46091 () (_ BitVec 32))

(declare-datatypes ((V!44473 0))(
  ( (V!44474 (val!14811 Int)) )
))
(declare-datatypes ((ValueCell!14045 0))(
  ( (ValueCellFull!14045 (v!17448 V!44473)) (EmptyCell!14045) )
))
(declare-fun mapRest!46091 () (Array (_ BitVec 32) ValueCell!14045))

(declare-datatypes ((array!75762 0))(
  ( (array!75763 (arr!36531 (Array (_ BitVec 32) ValueCell!14045)) (size!37069 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75762)

(declare-fun mapValue!46091 () ValueCell!14045)

(assert (=> mapNonEmpty!46091 (= (arr!36531 _values!996) (store mapRest!46091 mapKey!46091 mapValue!46091))))

(declare-fun b!1173170 () Bool)

(declare-fun e!666825 () Bool)

(declare-fun e!666830 () Bool)

(assert (=> b!1173170 (= e!666825 (and e!666830 mapRes!46091))))

(declare-fun condMapEmpty!46091 () Bool)

(declare-fun mapDefault!46091 () ValueCell!14045)

(assert (=> b!1173170 (= condMapEmpty!46091 (= (arr!36531 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14045)) mapDefault!46091)))))

(declare-fun b!1173171 () Bool)

(declare-fun res!779026 () Bool)

(declare-fun e!666822 () Bool)

(assert (=> b!1173171 (=> (not res!779026) (not e!666822))))

(assert (=> b!1173171 (= res!779026 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37068 _keys!1208))))))

(declare-fun res!779023 () Bool)

(assert (=> start!99394 (=> (not res!779023) (not e!666822))))

(assert (=> start!99394 (= res!779023 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37068 _keys!1208))))))

(assert (=> start!99394 e!666822))

(declare-fun tp_is_empty!29509 () Bool)

(assert (=> start!99394 tp_is_empty!29509))

(declare-fun array_inv!28014 (array!75760) Bool)

(assert (=> start!99394 (array_inv!28014 _keys!1208)))

(assert (=> start!99394 true))

(assert (=> start!99394 tp!87650))

(declare-fun array_inv!28015 (array!75762) Bool)

(assert (=> start!99394 (and (array_inv!28015 _values!996) e!666825)))

(declare-fun b!1173172 () Bool)

(declare-fun e!666827 () Bool)

(assert (=> b!1173172 (= e!666827 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173173 () Bool)

(declare-fun res!779027 () Bool)

(assert (=> b!1173173 (=> (not res!779027) (not e!666822))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1173173 (= res!779027 (and (= (size!37069 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37068 _keys!1208) (size!37069 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173174 () Bool)

(declare-fun res!779033 () Bool)

(assert (=> b!1173174 (=> (not res!779033) (not e!666822))))

(assert (=> b!1173174 (= res!779033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25733))))

(declare-fun b!1173175 () Bool)

(declare-fun res!779029 () Bool)

(assert (=> b!1173175 (=> (not res!779029) (not e!666822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75760 (_ BitVec 32)) Bool)

(assert (=> b!1173175 (= res!779029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173176 () Bool)

(declare-fun e!666832 () Bool)

(assert (=> b!1173176 (= e!666832 e!666827)))

(declare-fun res!779030 () Bool)

(assert (=> b!1173176 (=> res!779030 e!666827)))

(assert (=> b!1173176 (= res!779030 (not (= (select (arr!36530 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!46091 () Bool)

(assert (=> mapIsEmpty!46091 mapRes!46091))

(declare-fun b!1173177 () Bool)

(declare-fun e!666829 () Bool)

(declare-fun e!666831 () Bool)

(assert (=> b!1173177 (= e!666829 e!666831)))

(declare-fun res!779034 () Bool)

(assert (=> b!1173177 (=> res!779034 e!666831)))

(assert (=> b!1173177 (= res!779034 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((tuple2!19020 0))(
  ( (tuple2!19021 (_1!9521 (_ BitVec 64)) (_2!9521 V!44473)) )
))
(declare-datatypes ((List!25737 0))(
  ( (Nil!25734) (Cons!25733 (h!26942 tuple2!19020) (t!37699 List!25737)) )
))
(declare-datatypes ((ListLongMap!16989 0))(
  ( (ListLongMap!16990 (toList!8510 List!25737)) )
))
(declare-fun lt!528638 () ListLongMap!16989)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528641 () array!75762)

(declare-fun minValue!944 () V!44473)

(declare-fun lt!528639 () array!75760)

(declare-fun zeroValue!944 () V!44473)

(declare-fun getCurrentListMapNoExtraKeys!4984 (array!75760 array!75762 (_ BitVec 32) (_ BitVec 32) V!44473 V!44473 (_ BitVec 32) Int) ListLongMap!16989)

(assert (=> b!1173177 (= lt!528638 (getCurrentListMapNoExtraKeys!4984 lt!528639 lt!528641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528646 () V!44473)

(assert (=> b!1173177 (= lt!528641 (array!75763 (store (arr!36531 _values!996) i!673 (ValueCellFull!14045 lt!528646)) (size!37069 _values!996)))))

(declare-fun dynLambda!2908 (Int (_ BitVec 64)) V!44473)

(assert (=> b!1173177 (= lt!528646 (dynLambda!2908 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528648 () ListLongMap!16989)

(assert (=> b!1173177 (= lt!528648 (getCurrentListMapNoExtraKeys!4984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173178 () Bool)

(declare-fun res!779021 () Bool)

(assert (=> b!1173178 (=> (not res!779021) (not e!666822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173178 (= res!779021 (validKeyInArray!0 k0!934))))

(declare-fun b!1173179 () Bool)

(declare-fun e!666826 () Bool)

(assert (=> b!1173179 (= e!666826 (not e!666829))))

(declare-fun res!779024 () Bool)

(assert (=> b!1173179 (=> res!779024 e!666829)))

(assert (=> b!1173179 (= res!779024 (bvsgt from!1455 i!673))))

(assert (=> b!1173179 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528647 () Unit!38512)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75760 (_ BitVec 64) (_ BitVec 32)) Unit!38512)

(assert (=> b!1173179 (= lt!528647 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173180 () Bool)

(assert (=> b!1173180 (= e!666830 tp_is_empty!29509)))

(declare-fun b!1173181 () Bool)

(declare-fun Unit!38515 () Unit!38512)

(assert (=> b!1173181 (= e!666824 Unit!38515)))

(declare-fun b!1173182 () Bool)

(declare-fun res!779031 () Bool)

(assert (=> b!1173182 (=> (not res!779031) (not e!666826))))

(assert (=> b!1173182 (= res!779031 (arrayNoDuplicates!0 lt!528639 #b00000000000000000000000000000000 Nil!25733))))

(declare-fun b!1173183 () Bool)

(declare-fun res!779032 () Bool)

(assert (=> b!1173183 (=> (not res!779032) (not e!666822))))

(assert (=> b!1173183 (= res!779032 (= (select (arr!36530 _keys!1208) i!673) k0!934))))

(declare-fun b!1173184 () Bool)

(declare-fun e!666823 () Bool)

(assert (=> b!1173184 (= e!666823 true)))

(assert (=> b!1173184 (not (= (select (arr!36530 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528643 () Unit!38512)

(assert (=> b!1173184 (= lt!528643 e!666824)))

(declare-fun c!116566 () Bool)

(assert (=> b!1173184 (= c!116566 (= (select (arr!36530 _keys!1208) from!1455) k0!934))))

(assert (=> b!1173184 e!666832))

(declare-fun res!779028 () Bool)

(assert (=> b!1173184 (=> (not res!779028) (not e!666832))))

(declare-fun lt!528640 () ListLongMap!16989)

(declare-fun +!3824 (ListLongMap!16989 tuple2!19020) ListLongMap!16989)

(declare-fun get!18650 (ValueCell!14045 V!44473) V!44473)

(assert (=> b!1173184 (= res!779028 (= lt!528638 (+!3824 lt!528640 (tuple2!19021 (select (arr!36530 _keys!1208) from!1455) (get!18650 (select (arr!36531 _values!996) from!1455) lt!528646)))))))

(declare-fun b!1173185 () Bool)

(declare-fun res!779022 () Bool)

(assert (=> b!1173185 (=> (not res!779022) (not e!666822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173185 (= res!779022 (validMask!0 mask!1564))))

(declare-fun b!1173186 () Bool)

(assert (=> b!1173186 (= e!666822 e!666826)))

(declare-fun res!779025 () Bool)

(assert (=> b!1173186 (=> (not res!779025) (not e!666826))))

(assert (=> b!1173186 (= res!779025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528639 mask!1564))))

(assert (=> b!1173186 (= lt!528639 (array!75761 (store (arr!36530 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37068 _keys!1208)))))

(declare-fun b!1173187 () Bool)

(assert (=> b!1173187 (= e!666831 e!666823)))

(declare-fun res!779035 () Bool)

(assert (=> b!1173187 (=> res!779035 e!666823)))

(assert (=> b!1173187 (= res!779035 (not (validKeyInArray!0 (select (arr!36530 _keys!1208) from!1455))))))

(declare-fun lt!528637 () ListLongMap!16989)

(assert (=> b!1173187 (= lt!528637 lt!528640)))

(declare-fun lt!528644 () ListLongMap!16989)

(declare-fun -!1498 (ListLongMap!16989 (_ BitVec 64)) ListLongMap!16989)

(assert (=> b!1173187 (= lt!528640 (-!1498 lt!528644 k0!934))))

(assert (=> b!1173187 (= lt!528637 (getCurrentListMapNoExtraKeys!4984 lt!528639 lt!528641 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173187 (= lt!528644 (getCurrentListMapNoExtraKeys!4984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528636 () Unit!38512)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!762 (array!75760 array!75762 (_ BitVec 32) (_ BitVec 32) V!44473 V!44473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38512)

(assert (=> b!1173187 (= lt!528636 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!762 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173188 () Bool)

(assert (=> b!1173188 (= e!666828 tp_is_empty!29509)))

(assert (= (and start!99394 res!779023) b!1173185))

(assert (= (and b!1173185 res!779022) b!1173173))

(assert (= (and b!1173173 res!779027) b!1173175))

(assert (= (and b!1173175 res!779029) b!1173174))

(assert (= (and b!1173174 res!779033) b!1173171))

(assert (= (and b!1173171 res!779026) b!1173178))

(assert (= (and b!1173178 res!779021) b!1173183))

(assert (= (and b!1173183 res!779032) b!1173186))

(assert (= (and b!1173186 res!779025) b!1173182))

(assert (= (and b!1173182 res!779031) b!1173179))

(assert (= (and b!1173179 (not res!779024)) b!1173177))

(assert (= (and b!1173177 (not res!779034)) b!1173187))

(assert (= (and b!1173187 (not res!779035)) b!1173184))

(assert (= (and b!1173184 res!779028) b!1173176))

(assert (= (and b!1173176 (not res!779030)) b!1173172))

(assert (= (and b!1173184 c!116566) b!1173169))

(assert (= (and b!1173184 (not c!116566)) b!1173181))

(assert (= (and b!1173170 condMapEmpty!46091) mapIsEmpty!46091))

(assert (= (and b!1173170 (not condMapEmpty!46091)) mapNonEmpty!46091))

(get-info :version)

(assert (= (and mapNonEmpty!46091 ((_ is ValueCellFull!14045) mapValue!46091)) b!1173188))

(assert (= (and b!1173170 ((_ is ValueCellFull!14045) mapDefault!46091)) b!1173180))

(assert (= start!99394 b!1173170))

(declare-fun b_lambda!20105 () Bool)

(assert (=> (not b_lambda!20105) (not b!1173177)))

(declare-fun t!37697 () Bool)

(declare-fun tb!9783 () Bool)

(assert (=> (and start!99394 (= defaultEntry!1004 defaultEntry!1004) t!37697) tb!9783))

(declare-fun result!20141 () Bool)

(assert (=> tb!9783 (= result!20141 tp_is_empty!29509)))

(assert (=> b!1173177 t!37697))

(declare-fun b_and!40805 () Bool)

(assert (= b_and!40803 (and (=> t!37697 result!20141) b_and!40805)))

(declare-fun m!1080521 () Bool)

(assert (=> b!1173172 m!1080521))

(declare-fun m!1080523 () Bool)

(assert (=> b!1173169 m!1080523))

(declare-fun m!1080525 () Bool)

(assert (=> b!1173169 m!1080525))

(declare-fun m!1080527 () Bool)

(assert (=> b!1173169 m!1080527))

(declare-fun m!1080529 () Bool)

(assert (=> b!1173169 m!1080529))

(declare-fun m!1080531 () Bool)

(assert (=> b!1173169 m!1080531))

(declare-fun m!1080533 () Bool)

(assert (=> b!1173175 m!1080533))

(declare-fun m!1080535 () Bool)

(assert (=> b!1173178 m!1080535))

(declare-fun m!1080537 () Bool)

(assert (=> b!1173176 m!1080537))

(declare-fun m!1080539 () Bool)

(assert (=> mapNonEmpty!46091 m!1080539))

(declare-fun m!1080541 () Bool)

(assert (=> b!1173174 m!1080541))

(declare-fun m!1080543 () Bool)

(assert (=> b!1173183 m!1080543))

(declare-fun m!1080545 () Bool)

(assert (=> b!1173182 m!1080545))

(assert (=> b!1173184 m!1080537))

(declare-fun m!1080547 () Bool)

(assert (=> b!1173184 m!1080547))

(assert (=> b!1173184 m!1080547))

(declare-fun m!1080549 () Bool)

(assert (=> b!1173184 m!1080549))

(declare-fun m!1080551 () Bool)

(assert (=> b!1173184 m!1080551))

(declare-fun m!1080553 () Bool)

(assert (=> b!1173185 m!1080553))

(declare-fun m!1080555 () Bool)

(assert (=> b!1173186 m!1080555))

(declare-fun m!1080557 () Bool)

(assert (=> b!1173186 m!1080557))

(declare-fun m!1080559 () Bool)

(assert (=> b!1173177 m!1080559))

(declare-fun m!1080561 () Bool)

(assert (=> b!1173177 m!1080561))

(declare-fun m!1080563 () Bool)

(assert (=> b!1173177 m!1080563))

(declare-fun m!1080565 () Bool)

(assert (=> b!1173177 m!1080565))

(declare-fun m!1080567 () Bool)

(assert (=> b!1173179 m!1080567))

(declare-fun m!1080569 () Bool)

(assert (=> b!1173179 m!1080569))

(declare-fun m!1080571 () Bool)

(assert (=> b!1173187 m!1080571))

(declare-fun m!1080573 () Bool)

(assert (=> b!1173187 m!1080573))

(declare-fun m!1080575 () Bool)

(assert (=> b!1173187 m!1080575))

(assert (=> b!1173187 m!1080537))

(declare-fun m!1080577 () Bool)

(assert (=> b!1173187 m!1080577))

(declare-fun m!1080579 () Bool)

(assert (=> b!1173187 m!1080579))

(assert (=> b!1173187 m!1080537))

(declare-fun m!1080581 () Bool)

(assert (=> start!99394 m!1080581))

(declare-fun m!1080583 () Bool)

(assert (=> start!99394 m!1080583))

(check-sat (not b_lambda!20105) (not b!1173178) (not b!1173179) (not b_next!24979) (not start!99394) (not b!1173172) (not b!1173186) (not b!1173174) (not b!1173182) (not b!1173177) b_and!40805 tp_is_empty!29509 (not b!1173169) (not b!1173184) (not b!1173187) (not b!1173185) (not mapNonEmpty!46091) (not b!1173175))
(check-sat b_and!40805 (not b_next!24979))
