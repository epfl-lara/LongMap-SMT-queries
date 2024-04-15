; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101736 () Bool)

(assert start!101736)

(declare-fun b_free!26431 () Bool)

(declare-fun b_next!26431 () Bool)

(assert (=> start!101736 (= b_free!26431 (not b_next!26431))))

(declare-fun tp!92338 () Bool)

(declare-fun b_and!44105 () Bool)

(assert (=> start!101736 (= tp!92338 b_and!44105)))

(declare-fun b!1224714 () Bool)

(declare-fun res!813861 () Bool)

(declare-fun e!695579 () Bool)

(assert (=> b!1224714 (=> (not res!813861) (not e!695579))))

(declare-datatypes ((array!78974 0))(
  ( (array!78975 (arr!38114 (Array (_ BitVec 32) (_ BitVec 64))) (size!38652 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78974)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78974 (_ BitVec 32)) Bool)

(assert (=> b!1224714 (= res!813861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1224715 () Bool)

(declare-fun res!813847 () Bool)

(assert (=> b!1224715 (=> (not res!813847) (not e!695579))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224715 (= res!813847 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38652 _keys!1208))))))

(declare-fun b!1224716 () Bool)

(declare-fun e!695587 () Bool)

(declare-fun tp_is_empty!31135 () Bool)

(assert (=> b!1224716 (= e!695587 tp_is_empty!31135)))

(declare-fun b!1224717 () Bool)

(declare-fun e!695586 () Bool)

(declare-datatypes ((V!46641 0))(
  ( (V!46642 (val!15624 Int)) )
))
(declare-datatypes ((ValueCell!14858 0))(
  ( (ValueCellFull!14858 (v!18285 V!46641)) (EmptyCell!14858) )
))
(declare-datatypes ((array!78976 0))(
  ( (array!78977 (arr!38115 (Array (_ BitVec 32) ValueCell!14858)) (size!38653 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78976)

(assert (=> b!1224717 (= e!695586 (bvslt i!673 (size!38653 _values!996)))))

(declare-datatypes ((tuple2!20220 0))(
  ( (tuple2!20221 (_1!10121 (_ BitVec 64)) (_2!10121 V!46641)) )
))
(declare-datatypes ((List!26999 0))(
  ( (Nil!26996) (Cons!26995 (h!28204 tuple2!20220) (t!40401 List!26999)) )
))
(declare-datatypes ((ListLongMap!18189 0))(
  ( (ListLongMap!18190 (toList!9110 List!26999)) )
))
(declare-fun lt!557650 () ListLongMap!18189)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!557662 () ListLongMap!18189)

(declare-fun -!1927 (ListLongMap!18189 (_ BitVec 64)) ListLongMap!18189)

(assert (=> b!1224717 (= (-!1927 lt!557650 k0!934) lt!557662)))

(declare-fun lt!557667 () ListLongMap!18189)

(declare-fun lt!557654 () V!46641)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!40431 0))(
  ( (Unit!40432) )
))
(declare-fun lt!557657 () Unit!40431)

(declare-fun addRemoveCommutativeForDiffKeys!212 (ListLongMap!18189 (_ BitVec 64) V!46641 (_ BitVec 64)) Unit!40431)

(assert (=> b!1224717 (= lt!557657 (addRemoveCommutativeForDiffKeys!212 lt!557667 (select (arr!38114 _keys!1208) from!1455) lt!557654 k0!934))))

(declare-fun lt!557659 () ListLongMap!18189)

(declare-fun lt!557658 () ListLongMap!18189)

(declare-fun lt!557663 () ListLongMap!18189)

(assert (=> b!1224717 (and (= lt!557663 lt!557650) (= lt!557658 lt!557659))))

(declare-fun lt!557651 () tuple2!20220)

(declare-fun +!4170 (ListLongMap!18189 tuple2!20220) ListLongMap!18189)

(assert (=> b!1224717 (= lt!557650 (+!4170 lt!557667 lt!557651))))

(assert (=> b!1224717 (not (= (select (arr!38114 _keys!1208) from!1455) k0!934))))

(declare-fun lt!557661 () Unit!40431)

(declare-fun e!695580 () Unit!40431)

(assert (=> b!1224717 (= lt!557661 e!695580)))

(declare-fun c!120446 () Bool)

(assert (=> b!1224717 (= c!120446 (= (select (arr!38114 _keys!1208) from!1455) k0!934))))

(declare-fun e!695577 () Bool)

(assert (=> b!1224717 e!695577))

(declare-fun res!813849 () Bool)

(assert (=> b!1224717 (=> (not res!813849) (not e!695577))))

(declare-fun lt!557666 () ListLongMap!18189)

(assert (=> b!1224717 (= res!813849 (= lt!557666 lt!557662))))

(assert (=> b!1224717 (= lt!557662 (+!4170 lt!557658 lt!557651))))

(assert (=> b!1224717 (= lt!557651 (tuple2!20221 (select (arr!38114 _keys!1208) from!1455) lt!557654))))

(declare-fun lt!557665 () V!46641)

(declare-fun get!19487 (ValueCell!14858 V!46641) V!46641)

(assert (=> b!1224717 (= lt!557654 (get!19487 (select (arr!38115 _values!996) from!1455) lt!557665))))

(declare-fun b!1224718 () Bool)

(declare-fun e!695584 () Bool)

(assert (=> b!1224718 (= e!695579 e!695584)))

(declare-fun res!813855 () Bool)

(assert (=> b!1224718 (=> (not res!813855) (not e!695584))))

(declare-fun lt!557660 () array!78974)

(assert (=> b!1224718 (= res!813855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557660 mask!1564))))

(assert (=> b!1224718 (= lt!557660 (array!78975 (store (arr!38114 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38652 _keys!1208)))))

(declare-fun b!1224719 () Bool)

(declare-fun res!813854 () Bool)

(assert (=> b!1224719 (=> (not res!813854) (not e!695579))))

(declare-datatypes ((List!27000 0))(
  ( (Nil!26997) (Cons!26996 (h!28205 (_ BitVec 64)) (t!40402 List!27000)) )
))
(declare-fun arrayNoDuplicates!0 (array!78974 (_ BitVec 32) List!27000) Bool)

(assert (=> b!1224719 (= res!813854 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26997))))

(declare-fun b!1224720 () Bool)

(declare-fun res!813857 () Bool)

(assert (=> b!1224720 (=> (not res!813857) (not e!695579))))

(assert (=> b!1224720 (= res!813857 (= (select (arr!38114 _keys!1208) i!673) k0!934))))

(declare-fun b!1224721 () Bool)

(declare-fun e!695583 () Bool)

(declare-fun mapRes!48601 () Bool)

(assert (=> b!1224721 (= e!695583 (and e!695587 mapRes!48601))))

(declare-fun condMapEmpty!48601 () Bool)

(declare-fun mapDefault!48601 () ValueCell!14858)

(assert (=> b!1224721 (= condMapEmpty!48601 (= (arr!38115 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14858)) mapDefault!48601)))))

(declare-fun b!1224722 () Bool)

(declare-fun res!813856 () Bool)

(assert (=> b!1224722 (=> (not res!813856) (not e!695579))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1224722 (= res!813856 (and (= (size!38653 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38652 _keys!1208) (size!38653 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1224724 () Bool)

(declare-fun Unit!40433 () Unit!40431)

(assert (=> b!1224724 (= e!695580 Unit!40433)))

(declare-fun b!1224725 () Bool)

(declare-fun res!813851 () Bool)

(assert (=> b!1224725 (=> (not res!813851) (not e!695579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1224725 (= res!813851 (validMask!0 mask!1564))))

(declare-fun b!1224726 () Bool)

(declare-fun res!813858 () Bool)

(assert (=> b!1224726 (=> (not res!813858) (not e!695579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1224726 (= res!813858 (validKeyInArray!0 k0!934))))

(declare-fun b!1224727 () Bool)

(declare-fun res!813852 () Bool)

(assert (=> b!1224727 (=> (not res!813852) (not e!695584))))

(assert (=> b!1224727 (= res!813852 (arrayNoDuplicates!0 lt!557660 #b00000000000000000000000000000000 Nil!26997))))

(declare-fun e!695581 () Bool)

(declare-fun b!1224728 () Bool)

(declare-fun arrayContainsKey!0 (array!78974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1224728 (= e!695581 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1224729 () Bool)

(assert (=> b!1224729 (= e!695577 e!695581)))

(declare-fun res!813848 () Bool)

(assert (=> b!1224729 (=> res!813848 e!695581)))

(assert (=> b!1224729 (= res!813848 (not (= (select (arr!38114 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1224730 () Bool)

(declare-fun e!695576 () Bool)

(assert (=> b!1224730 (= e!695576 e!695586)))

(declare-fun res!813850 () Bool)

(assert (=> b!1224730 (=> res!813850 e!695586)))

(assert (=> b!1224730 (= res!813850 (not (validKeyInArray!0 (select (arr!38114 _keys!1208) from!1455))))))

(assert (=> b!1224730 (= lt!557659 lt!557658)))

(assert (=> b!1224730 (= lt!557658 (-!1927 lt!557667 k0!934))))

(declare-fun zeroValue!944 () V!46641)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!557653 () array!78976)

(declare-fun minValue!944 () V!46641)

(declare-fun getCurrentListMapNoExtraKeys!5540 (array!78974 array!78976 (_ BitVec 32) (_ BitVec 32) V!46641 V!46641 (_ BitVec 32) Int) ListLongMap!18189)

(assert (=> b!1224730 (= lt!557659 (getCurrentListMapNoExtraKeys!5540 lt!557660 lt!557653 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1224730 (= lt!557667 (getCurrentListMapNoExtraKeys!5540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!557664 () Unit!40431)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1161 (array!78974 array!78976 (_ BitVec 32) (_ BitVec 32) V!46641 V!46641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40431)

(assert (=> b!1224730 (= lt!557664 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1161 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1224731 () Bool)

(declare-fun e!695585 () Bool)

(assert (=> b!1224731 (= e!695585 e!695576)))

(declare-fun res!813859 () Bool)

(assert (=> b!1224731 (=> res!813859 e!695576)))

(assert (=> b!1224731 (= res!813859 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1224731 (= lt!557666 (getCurrentListMapNoExtraKeys!5540 lt!557660 lt!557653 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1224731 (= lt!557653 (array!78977 (store (arr!38115 _values!996) i!673 (ValueCellFull!14858 lt!557665)) (size!38653 _values!996)))))

(declare-fun dynLambda!3385 (Int (_ BitVec 64)) V!46641)

(assert (=> b!1224731 (= lt!557665 (dynLambda!3385 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1224731 (= lt!557663 (getCurrentListMapNoExtraKeys!5540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48601 () Bool)

(declare-fun tp!92339 () Bool)

(declare-fun e!695582 () Bool)

(assert (=> mapNonEmpty!48601 (= mapRes!48601 (and tp!92339 e!695582))))

(declare-fun mapValue!48601 () ValueCell!14858)

(declare-fun mapRest!48601 () (Array (_ BitVec 32) ValueCell!14858))

(declare-fun mapKey!48601 () (_ BitVec 32))

(assert (=> mapNonEmpty!48601 (= (arr!38115 _values!996) (store mapRest!48601 mapKey!48601 mapValue!48601))))

(declare-fun b!1224732 () Bool)

(assert (=> b!1224732 (= e!695582 tp_is_empty!31135)))

(declare-fun res!813853 () Bool)

(assert (=> start!101736 (=> (not res!813853) (not e!695579))))

(assert (=> start!101736 (= res!813853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38652 _keys!1208))))))

(assert (=> start!101736 e!695579))

(assert (=> start!101736 tp_is_empty!31135))

(declare-fun array_inv!29114 (array!78974) Bool)

(assert (=> start!101736 (array_inv!29114 _keys!1208)))

(assert (=> start!101736 true))

(assert (=> start!101736 tp!92338))

(declare-fun array_inv!29115 (array!78976) Bool)

(assert (=> start!101736 (and (array_inv!29115 _values!996) e!695583)))

(declare-fun b!1224723 () Bool)

(declare-fun Unit!40434 () Unit!40431)

(assert (=> b!1224723 (= e!695580 Unit!40434)))

(declare-fun lt!557656 () Unit!40431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78974 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40431)

(assert (=> b!1224723 (= lt!557656 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1224723 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!557652 () Unit!40431)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78974 (_ BitVec 32) (_ BitVec 32)) Unit!40431)

(assert (=> b!1224723 (= lt!557652 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1224723 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26997)))

(declare-fun lt!557655 () Unit!40431)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78974 (_ BitVec 64) (_ BitVec 32) List!27000) Unit!40431)

(assert (=> b!1224723 (= lt!557655 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26997))))

(assert (=> b!1224723 false))

(declare-fun mapIsEmpty!48601 () Bool)

(assert (=> mapIsEmpty!48601 mapRes!48601))

(declare-fun b!1224733 () Bool)

(assert (=> b!1224733 (= e!695584 (not e!695585))))

(declare-fun res!813860 () Bool)

(assert (=> b!1224733 (=> res!813860 e!695585)))

(assert (=> b!1224733 (= res!813860 (bvsgt from!1455 i!673))))

(assert (=> b!1224733 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!557668 () Unit!40431)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78974 (_ BitVec 64) (_ BitVec 32)) Unit!40431)

(assert (=> b!1224733 (= lt!557668 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101736 res!813853) b!1224725))

(assert (= (and b!1224725 res!813851) b!1224722))

(assert (= (and b!1224722 res!813856) b!1224714))

(assert (= (and b!1224714 res!813861) b!1224719))

(assert (= (and b!1224719 res!813854) b!1224715))

(assert (= (and b!1224715 res!813847) b!1224726))

(assert (= (and b!1224726 res!813858) b!1224720))

(assert (= (and b!1224720 res!813857) b!1224718))

(assert (= (and b!1224718 res!813855) b!1224727))

(assert (= (and b!1224727 res!813852) b!1224733))

(assert (= (and b!1224733 (not res!813860)) b!1224731))

(assert (= (and b!1224731 (not res!813859)) b!1224730))

(assert (= (and b!1224730 (not res!813850)) b!1224717))

(assert (= (and b!1224717 res!813849) b!1224729))

(assert (= (and b!1224729 (not res!813848)) b!1224728))

(assert (= (and b!1224717 c!120446) b!1224723))

(assert (= (and b!1224717 (not c!120446)) b!1224724))

(assert (= (and b!1224721 condMapEmpty!48601) mapIsEmpty!48601))

(assert (= (and b!1224721 (not condMapEmpty!48601)) mapNonEmpty!48601))

(get-info :version)

(assert (= (and mapNonEmpty!48601 ((_ is ValueCellFull!14858) mapValue!48601)) b!1224732))

(assert (= (and b!1224721 ((_ is ValueCellFull!14858) mapDefault!48601)) b!1224716))

(assert (= start!101736 b!1224721))

(declare-fun b_lambda!22401 () Bool)

(assert (=> (not b_lambda!22401) (not b!1224731)))

(declare-fun t!40400 () Bool)

(declare-fun tb!11223 () Bool)

(assert (=> (and start!101736 (= defaultEntry!1004 defaultEntry!1004) t!40400) tb!11223))

(declare-fun result!23067 () Bool)

(assert (=> tb!11223 (= result!23067 tp_is_empty!31135)))

(assert (=> b!1224731 t!40400))

(declare-fun b_and!44107 () Bool)

(assert (= b_and!44105 (and (=> t!40400 result!23067) b_and!44107)))

(declare-fun m!1129283 () Bool)

(assert (=> mapNonEmpty!48601 m!1129283))

(declare-fun m!1129285 () Bool)

(assert (=> b!1224717 m!1129285))

(declare-fun m!1129287 () Bool)

(assert (=> b!1224717 m!1129287))

(declare-fun m!1129289 () Bool)

(assert (=> b!1224717 m!1129289))

(declare-fun m!1129291 () Bool)

(assert (=> b!1224717 m!1129291))

(declare-fun m!1129293 () Bool)

(assert (=> b!1224717 m!1129293))

(assert (=> b!1224717 m!1129287))

(declare-fun m!1129295 () Bool)

(assert (=> b!1224717 m!1129295))

(assert (=> b!1224717 m!1129293))

(declare-fun m!1129297 () Bool)

(assert (=> b!1224717 m!1129297))

(declare-fun m!1129299 () Bool)

(assert (=> b!1224730 m!1129299))

(declare-fun m!1129301 () Bool)

(assert (=> b!1224730 m!1129301))

(declare-fun m!1129303 () Bool)

(assert (=> b!1224730 m!1129303))

(declare-fun m!1129305 () Bool)

(assert (=> b!1224730 m!1129305))

(assert (=> b!1224730 m!1129293))

(declare-fun m!1129307 () Bool)

(assert (=> b!1224730 m!1129307))

(assert (=> b!1224730 m!1129293))

(declare-fun m!1129309 () Bool)

(assert (=> start!101736 m!1129309))

(declare-fun m!1129311 () Bool)

(assert (=> start!101736 m!1129311))

(assert (=> b!1224729 m!1129293))

(declare-fun m!1129313 () Bool)

(assert (=> b!1224725 m!1129313))

(declare-fun m!1129315 () Bool)

(assert (=> b!1224726 m!1129315))

(declare-fun m!1129317 () Bool)

(assert (=> b!1224728 m!1129317))

(declare-fun m!1129319 () Bool)

(assert (=> b!1224731 m!1129319))

(declare-fun m!1129321 () Bool)

(assert (=> b!1224731 m!1129321))

(declare-fun m!1129323 () Bool)

(assert (=> b!1224731 m!1129323))

(declare-fun m!1129325 () Bool)

(assert (=> b!1224731 m!1129325))

(declare-fun m!1129327 () Bool)

(assert (=> b!1224733 m!1129327))

(declare-fun m!1129329 () Bool)

(assert (=> b!1224733 m!1129329))

(declare-fun m!1129331 () Bool)

(assert (=> b!1224723 m!1129331))

(declare-fun m!1129333 () Bool)

(assert (=> b!1224723 m!1129333))

(declare-fun m!1129335 () Bool)

(assert (=> b!1224723 m!1129335))

(declare-fun m!1129337 () Bool)

(assert (=> b!1224723 m!1129337))

(declare-fun m!1129339 () Bool)

(assert (=> b!1224723 m!1129339))

(declare-fun m!1129341 () Bool)

(assert (=> b!1224727 m!1129341))

(declare-fun m!1129343 () Bool)

(assert (=> b!1224718 m!1129343))

(declare-fun m!1129345 () Bool)

(assert (=> b!1224718 m!1129345))

(declare-fun m!1129347 () Bool)

(assert (=> b!1224719 m!1129347))

(declare-fun m!1129349 () Bool)

(assert (=> b!1224720 m!1129349))

(declare-fun m!1129351 () Bool)

(assert (=> b!1224714 m!1129351))

(check-sat (not mapNonEmpty!48601) (not b!1224731) (not b_lambda!22401) (not b!1224714) (not b!1224727) (not b!1224718) (not b!1224730) (not b!1224728) (not b!1224725) tp_is_empty!31135 (not start!101736) (not b_next!26431) b_and!44107 (not b!1224733) (not b!1224723) (not b!1224726) (not b!1224717) (not b!1224719))
(check-sat b_and!44107 (not b_next!26431))
