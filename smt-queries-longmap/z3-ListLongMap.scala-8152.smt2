; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100014 () Bool)

(assert start!100014)

(declare-fun b_free!25357 () Bool)

(declare-fun b_next!25357 () Bool)

(assert (=> start!100014 (= b_free!25357 (not b_next!25357))))

(declare-fun tp!88785 () Bool)

(declare-fun b_and!41583 () Bool)

(assert (=> start!100014 (= tp!88785 b_and!41583)))

(declare-fun b!1186642 () Bool)

(declare-fun res!788445 () Bool)

(declare-fun e!674787 () Bool)

(assert (=> b!1186642 (=> (not res!788445) (not e!674787))))

(declare-datatypes ((array!76619 0))(
  ( (array!76620 (arr!36953 (Array (_ BitVec 32) (_ BitVec 64))) (size!37490 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76619)

(declare-datatypes ((List!26018 0))(
  ( (Nil!26015) (Cons!26014 (h!27232 (_ BitVec 64)) (t!38359 List!26018)) )
))
(declare-fun arrayNoDuplicates!0 (array!76619 (_ BitVec 32) List!26018) Bool)

(assert (=> b!1186642 (= res!788445 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26015))))

(declare-fun b!1186643 () Bool)

(declare-datatypes ((Unit!39269 0))(
  ( (Unit!39270) )
))
(declare-fun e!674793 () Unit!39269)

(declare-fun Unit!39271 () Unit!39269)

(assert (=> b!1186643 (= e!674793 Unit!39271)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538420 () Unit!39269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39269)

(assert (=> b!1186643 (= lt!538420 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186643 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538416 () Unit!39269)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76619 (_ BitVec 32) (_ BitVec 32)) Unit!39269)

(assert (=> b!1186643 (= lt!538416 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186643 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26015)))

(declare-fun lt!538411 () Unit!39269)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76619 (_ BitVec 64) (_ BitVec 32) List!26018) Unit!39269)

(assert (=> b!1186643 (= lt!538411 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26015))))

(assert (=> b!1186643 false))

(declare-fun b!1186644 () Bool)

(declare-fun e!674789 () Bool)

(assert (=> b!1186644 (= e!674789 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186645 () Bool)

(declare-fun Unit!39272 () Unit!39269)

(assert (=> b!1186645 (= e!674793 Unit!39272)))

(declare-fun b!1186646 () Bool)

(declare-fun res!788453 () Bool)

(assert (=> b!1186646 (=> (not res!788453) (not e!674787))))

(assert (=> b!1186646 (= res!788453 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37490 _keys!1208))))))

(declare-fun b!1186647 () Bool)

(declare-fun e!674798 () Bool)

(declare-fun e!674788 () Bool)

(assert (=> b!1186647 (= e!674798 e!674788)))

(declare-fun res!788450 () Bool)

(assert (=> b!1186647 (=> res!788450 e!674788)))

(assert (=> b!1186647 (= res!788450 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44977 0))(
  ( (V!44978 (val!15000 Int)) )
))
(declare-fun zeroValue!944 () V!44977)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19284 0))(
  ( (tuple2!19285 (_1!9653 (_ BitVec 64)) (_2!9653 V!44977)) )
))
(declare-datatypes ((List!26019 0))(
  ( (Nil!26016) (Cons!26015 (h!27233 tuple2!19284) (t!38360 List!26019)) )
))
(declare-datatypes ((ListLongMap!17261 0))(
  ( (ListLongMap!17262 (toList!8646 List!26019)) )
))
(declare-fun lt!538413 () ListLongMap!17261)

(declare-fun lt!538417 () array!76619)

(declare-datatypes ((ValueCell!14234 0))(
  ( (ValueCellFull!14234 (v!17634 V!44977)) (EmptyCell!14234) )
))
(declare-datatypes ((array!76621 0))(
  ( (array!76622 (arr!36954 (Array (_ BitVec 32) ValueCell!14234)) (size!37491 (_ BitVec 32))) )
))
(declare-fun lt!538426 () array!76621)

(declare-fun minValue!944 () V!44977)

(declare-fun getCurrentListMapNoExtraKeys!5117 (array!76619 array!76621 (_ BitVec 32) (_ BitVec 32) V!44977 V!44977 (_ BitVec 32) Int) ListLongMap!17261)

(assert (=> b!1186647 (= lt!538413 (getCurrentListMapNoExtraKeys!5117 lt!538417 lt!538426 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76621)

(declare-fun lt!538415 () V!44977)

(assert (=> b!1186647 (= lt!538426 (array!76622 (store (arr!36954 _values!996) i!673 (ValueCellFull!14234 lt!538415)) (size!37491 _values!996)))))

(declare-fun dynLambda!3078 (Int (_ BitVec 64)) V!44977)

(assert (=> b!1186647 (= lt!538415 (dynLambda!3078 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538414 () ListLongMap!17261)

(assert (=> b!1186647 (= lt!538414 (getCurrentListMapNoExtraKeys!5117 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186648 () Bool)

(declare-fun res!788448 () Bool)

(declare-fun e!674790 () Bool)

(assert (=> b!1186648 (=> (not res!788448) (not e!674790))))

(assert (=> b!1186648 (= res!788448 (arrayNoDuplicates!0 lt!538417 #b00000000000000000000000000000000 Nil!26015))))

(declare-fun b!1186649 () Bool)

(declare-fun res!788442 () Bool)

(assert (=> b!1186649 (=> (not res!788442) (not e!674787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76619 (_ BitVec 32)) Bool)

(assert (=> b!1186649 (= res!788442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186650 () Bool)

(declare-fun e!674794 () Bool)

(assert (=> b!1186650 (= e!674788 e!674794)))

(declare-fun res!788456 () Bool)

(assert (=> b!1186650 (=> res!788456 e!674794)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186650 (= res!788456 (not (validKeyInArray!0 (select (arr!36953 _keys!1208) from!1455))))))

(declare-fun lt!538422 () ListLongMap!17261)

(declare-fun lt!538427 () ListLongMap!17261)

(assert (=> b!1186650 (= lt!538422 lt!538427)))

(declare-fun lt!538428 () ListLongMap!17261)

(declare-fun -!1667 (ListLongMap!17261 (_ BitVec 64)) ListLongMap!17261)

(assert (=> b!1186650 (= lt!538427 (-!1667 lt!538428 k0!934))))

(assert (=> b!1186650 (= lt!538422 (getCurrentListMapNoExtraKeys!5117 lt!538417 lt!538426 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186650 (= lt!538428 (getCurrentListMapNoExtraKeys!5117 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538429 () Unit!39269)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!887 (array!76619 array!76621 (_ BitVec 32) (_ BitVec 32) V!44977 V!44977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39269)

(assert (=> b!1186650 (= lt!538429 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!887 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186651 () Bool)

(declare-fun e!674797 () Bool)

(declare-fun tp_is_empty!29887 () Bool)

(assert (=> b!1186651 (= e!674797 tp_is_empty!29887)))

(declare-fun b!1186652 () Bool)

(declare-fun res!788451 () Bool)

(assert (=> b!1186652 (=> (not res!788451) (not e!674787))))

(assert (=> b!1186652 (= res!788451 (validKeyInArray!0 k0!934))))

(declare-fun b!1186653 () Bool)

(assert (=> b!1186653 (= e!674794 true)))

(declare-fun lt!538418 () ListLongMap!17261)

(declare-fun lt!538412 () ListLongMap!17261)

(assert (=> b!1186653 (= (-!1667 lt!538418 k0!934) lt!538412)))

(declare-fun lt!538424 () V!44977)

(declare-fun lt!538425 () Unit!39269)

(declare-fun addRemoveCommutativeForDiffKeys!180 (ListLongMap!17261 (_ BitVec 64) V!44977 (_ BitVec 64)) Unit!39269)

(assert (=> b!1186653 (= lt!538425 (addRemoveCommutativeForDiffKeys!180 lt!538428 (select (arr!36953 _keys!1208) from!1455) lt!538424 k0!934))))

(assert (=> b!1186653 (and (= lt!538414 lt!538418) (= lt!538427 lt!538422))))

(declare-fun lt!538421 () tuple2!19284)

(declare-fun +!3964 (ListLongMap!17261 tuple2!19284) ListLongMap!17261)

(assert (=> b!1186653 (= lt!538418 (+!3964 lt!538428 lt!538421))))

(assert (=> b!1186653 (not (= (select (arr!36953 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538419 () Unit!39269)

(assert (=> b!1186653 (= lt!538419 e!674793)))

(declare-fun c!117557 () Bool)

(assert (=> b!1186653 (= c!117557 (= (select (arr!36953 _keys!1208) from!1455) k0!934))))

(declare-fun e!674792 () Bool)

(assert (=> b!1186653 e!674792))

(declare-fun res!788447 () Bool)

(assert (=> b!1186653 (=> (not res!788447) (not e!674792))))

(assert (=> b!1186653 (= res!788447 (= lt!538413 lt!538412))))

(assert (=> b!1186653 (= lt!538412 (+!3964 lt!538427 lt!538421))))

(assert (=> b!1186653 (= lt!538421 (tuple2!19285 (select (arr!36953 _keys!1208) from!1455) lt!538424))))

(declare-fun get!18961 (ValueCell!14234 V!44977) V!44977)

(assert (=> b!1186653 (= lt!538424 (get!18961 (select (arr!36954 _values!996) from!1455) lt!538415))))

(declare-fun b!1186654 () Bool)

(declare-fun e!674795 () Bool)

(declare-fun mapRes!46658 () Bool)

(assert (=> b!1186654 (= e!674795 (and e!674797 mapRes!46658))))

(declare-fun condMapEmpty!46658 () Bool)

(declare-fun mapDefault!46658 () ValueCell!14234)

(assert (=> b!1186654 (= condMapEmpty!46658 (= (arr!36954 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14234)) mapDefault!46658)))))

(declare-fun b!1186655 () Bool)

(declare-fun res!788443 () Bool)

(assert (=> b!1186655 (=> (not res!788443) (not e!674787))))

(assert (=> b!1186655 (= res!788443 (and (= (size!37491 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37490 _keys!1208) (size!37491 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186656 () Bool)

(declare-fun res!788454 () Bool)

(assert (=> b!1186656 (=> (not res!788454) (not e!674787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186656 (= res!788454 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!46658 () Bool)

(declare-fun tp!88784 () Bool)

(declare-fun e!674796 () Bool)

(assert (=> mapNonEmpty!46658 (= mapRes!46658 (and tp!88784 e!674796))))

(declare-fun mapKey!46658 () (_ BitVec 32))

(declare-fun mapValue!46658 () ValueCell!14234)

(declare-fun mapRest!46658 () (Array (_ BitVec 32) ValueCell!14234))

(assert (=> mapNonEmpty!46658 (= (arr!36954 _values!996) (store mapRest!46658 mapKey!46658 mapValue!46658))))

(declare-fun b!1186657 () Bool)

(declare-fun res!788455 () Bool)

(assert (=> b!1186657 (=> (not res!788455) (not e!674787))))

(assert (=> b!1186657 (= res!788455 (= (select (arr!36953 _keys!1208) i!673) k0!934))))

(declare-fun b!1186658 () Bool)

(assert (=> b!1186658 (= e!674790 (not e!674798))))

(declare-fun res!788452 () Bool)

(assert (=> b!1186658 (=> res!788452 e!674798)))

(assert (=> b!1186658 (= res!788452 (bvsgt from!1455 i!673))))

(assert (=> b!1186658 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538423 () Unit!39269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76619 (_ BitVec 64) (_ BitVec 32)) Unit!39269)

(assert (=> b!1186658 (= lt!538423 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186659 () Bool)

(assert (=> b!1186659 (= e!674787 e!674790)))

(declare-fun res!788449 () Bool)

(assert (=> b!1186659 (=> (not res!788449) (not e!674790))))

(assert (=> b!1186659 (= res!788449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538417 mask!1564))))

(assert (=> b!1186659 (= lt!538417 (array!76620 (store (arr!36953 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37490 _keys!1208)))))

(declare-fun b!1186660 () Bool)

(assert (=> b!1186660 (= e!674792 e!674789)))

(declare-fun res!788444 () Bool)

(assert (=> b!1186660 (=> res!788444 e!674789)))

(assert (=> b!1186660 (= res!788444 (not (= (select (arr!36953 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186661 () Bool)

(assert (=> b!1186661 (= e!674796 tp_is_empty!29887)))

(declare-fun mapIsEmpty!46658 () Bool)

(assert (=> mapIsEmpty!46658 mapRes!46658))

(declare-fun res!788446 () Bool)

(assert (=> start!100014 (=> (not res!788446) (not e!674787))))

(assert (=> start!100014 (= res!788446 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37490 _keys!1208))))))

(assert (=> start!100014 e!674787))

(assert (=> start!100014 tp_is_empty!29887))

(declare-fun array_inv!28276 (array!76619) Bool)

(assert (=> start!100014 (array_inv!28276 _keys!1208)))

(assert (=> start!100014 true))

(assert (=> start!100014 tp!88785))

(declare-fun array_inv!28277 (array!76621) Bool)

(assert (=> start!100014 (and (array_inv!28277 _values!996) e!674795)))

(assert (= (and start!100014 res!788446) b!1186656))

(assert (= (and b!1186656 res!788454) b!1186655))

(assert (= (and b!1186655 res!788443) b!1186649))

(assert (= (and b!1186649 res!788442) b!1186642))

(assert (= (and b!1186642 res!788445) b!1186646))

(assert (= (and b!1186646 res!788453) b!1186652))

(assert (= (and b!1186652 res!788451) b!1186657))

(assert (= (and b!1186657 res!788455) b!1186659))

(assert (= (and b!1186659 res!788449) b!1186648))

(assert (= (and b!1186648 res!788448) b!1186658))

(assert (= (and b!1186658 (not res!788452)) b!1186647))

(assert (= (and b!1186647 (not res!788450)) b!1186650))

(assert (= (and b!1186650 (not res!788456)) b!1186653))

(assert (= (and b!1186653 res!788447) b!1186660))

(assert (= (and b!1186660 (not res!788444)) b!1186644))

(assert (= (and b!1186653 c!117557) b!1186643))

(assert (= (and b!1186653 (not c!117557)) b!1186645))

(assert (= (and b!1186654 condMapEmpty!46658) mapIsEmpty!46658))

(assert (= (and b!1186654 (not condMapEmpty!46658)) mapNonEmpty!46658))

(get-info :version)

(assert (= (and mapNonEmpty!46658 ((_ is ValueCellFull!14234) mapValue!46658)) b!1186661))

(assert (= (and b!1186654 ((_ is ValueCellFull!14234) mapDefault!46658)) b!1186651))

(assert (= start!100014 b!1186654))

(declare-fun b_lambda!20495 () Bool)

(assert (=> (not b_lambda!20495) (not b!1186647)))

(declare-fun t!38358 () Bool)

(declare-fun tb!10161 () Bool)

(assert (=> (and start!100014 (= defaultEntry!1004 defaultEntry!1004) t!38358) tb!10161))

(declare-fun result!20897 () Bool)

(assert (=> tb!10161 (= result!20897 tp_is_empty!29887)))

(assert (=> b!1186647 t!38358))

(declare-fun b_and!41585 () Bool)

(assert (= b_and!41583 (and (=> t!38358 result!20897) b_and!41585)))

(declare-fun m!1095327 () Bool)

(assert (=> b!1186650 m!1095327))

(declare-fun m!1095329 () Bool)

(assert (=> b!1186650 m!1095329))

(declare-fun m!1095331 () Bool)

(assert (=> b!1186650 m!1095331))

(declare-fun m!1095333 () Bool)

(assert (=> b!1186650 m!1095333))

(declare-fun m!1095335 () Bool)

(assert (=> b!1186650 m!1095335))

(declare-fun m!1095337 () Bool)

(assert (=> b!1186650 m!1095337))

(assert (=> b!1186650 m!1095333))

(declare-fun m!1095339 () Bool)

(assert (=> b!1186644 m!1095339))

(declare-fun m!1095341 () Bool)

(assert (=> b!1186642 m!1095341))

(declare-fun m!1095343 () Bool)

(assert (=> b!1186643 m!1095343))

(declare-fun m!1095345 () Bool)

(assert (=> b!1186643 m!1095345))

(declare-fun m!1095347 () Bool)

(assert (=> b!1186643 m!1095347))

(declare-fun m!1095349 () Bool)

(assert (=> b!1186643 m!1095349))

(declare-fun m!1095351 () Bool)

(assert (=> b!1186643 m!1095351))

(declare-fun m!1095353 () Bool)

(assert (=> b!1186653 m!1095353))

(declare-fun m!1095355 () Bool)

(assert (=> b!1186653 m!1095355))

(declare-fun m!1095357 () Bool)

(assert (=> b!1186653 m!1095357))

(assert (=> b!1186653 m!1095353))

(declare-fun m!1095359 () Bool)

(assert (=> b!1186653 m!1095359))

(assert (=> b!1186653 m!1095333))

(declare-fun m!1095361 () Bool)

(assert (=> b!1186653 m!1095361))

(assert (=> b!1186653 m!1095333))

(declare-fun m!1095363 () Bool)

(assert (=> b!1186653 m!1095363))

(declare-fun m!1095365 () Bool)

(assert (=> b!1186647 m!1095365))

(declare-fun m!1095367 () Bool)

(assert (=> b!1186647 m!1095367))

(declare-fun m!1095369 () Bool)

(assert (=> b!1186647 m!1095369))

(declare-fun m!1095371 () Bool)

(assert (=> b!1186647 m!1095371))

(assert (=> b!1186660 m!1095333))

(declare-fun m!1095373 () Bool)

(assert (=> start!100014 m!1095373))

(declare-fun m!1095375 () Bool)

(assert (=> start!100014 m!1095375))

(declare-fun m!1095377 () Bool)

(assert (=> b!1186649 m!1095377))

(declare-fun m!1095379 () Bool)

(assert (=> b!1186652 m!1095379))

(declare-fun m!1095381 () Bool)

(assert (=> b!1186659 m!1095381))

(declare-fun m!1095383 () Bool)

(assert (=> b!1186659 m!1095383))

(declare-fun m!1095385 () Bool)

(assert (=> b!1186657 m!1095385))

(declare-fun m!1095387 () Bool)

(assert (=> b!1186648 m!1095387))

(declare-fun m!1095389 () Bool)

(assert (=> mapNonEmpty!46658 m!1095389))

(declare-fun m!1095391 () Bool)

(assert (=> b!1186656 m!1095391))

(declare-fun m!1095393 () Bool)

(assert (=> b!1186658 m!1095393))

(declare-fun m!1095395 () Bool)

(assert (=> b!1186658 m!1095395))

(check-sat (not b_next!25357) (not b!1186648) (not b!1186652) (not b!1186653) (not b!1186656) b_and!41585 (not b!1186647) (not b!1186659) (not b!1186642) (not b!1186649) (not mapNonEmpty!46658) (not start!100014) (not b!1186658) (not b_lambda!20495) (not b!1186644) (not b!1186643) (not b!1186650) tp_is_empty!29887)
(check-sat b_and!41585 (not b_next!25357))
