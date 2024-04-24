; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100074 () Bool)

(assert start!100074)

(declare-fun b_free!25417 () Bool)

(declare-fun b_next!25417 () Bool)

(assert (=> start!100074 (= b_free!25417 (not b_next!25417))))

(declare-fun tp!88964 () Bool)

(declare-fun b_and!41703 () Bool)

(assert (=> start!100074 (= tp!88964 b_and!41703)))

(declare-fun mapIsEmpty!46748 () Bool)

(declare-fun mapRes!46748 () Bool)

(assert (=> mapIsEmpty!46748 mapRes!46748))

(declare-datatypes ((array!76735 0))(
  ( (array!76736 (arr!37011 (Array (_ BitVec 32) (_ BitVec 64))) (size!37548 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76735)

(declare-fun e!675873 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1188503 () Bool)

(declare-fun arrayContainsKey!0 (array!76735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188503 (= e!675873 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188504 () Bool)

(declare-fun e!675872 () Bool)

(declare-fun e!675868 () Bool)

(assert (=> b!1188504 (= e!675872 e!675868)))

(declare-fun res!789796 () Bool)

(assert (=> b!1188504 (=> (not res!789796) (not e!675868))))

(declare-fun lt!540137 () array!76735)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76735 (_ BitVec 32)) Bool)

(assert (=> b!1188504 (= res!789796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540137 mask!1564))))

(assert (=> b!1188504 (= lt!540137 (array!76736 (store (arr!37011 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37548 _keys!1208)))))

(declare-fun mapNonEmpty!46748 () Bool)

(declare-fun tp!88965 () Bool)

(declare-fun e!675867 () Bool)

(assert (=> mapNonEmpty!46748 (= mapRes!46748 (and tp!88965 e!675867))))

(declare-datatypes ((V!45057 0))(
  ( (V!45058 (val!15030 Int)) )
))
(declare-datatypes ((ValueCell!14264 0))(
  ( (ValueCellFull!14264 (v!17664 V!45057)) (EmptyCell!14264) )
))
(declare-fun mapValue!46748 () ValueCell!14264)

(declare-fun mapRest!46748 () (Array (_ BitVec 32) ValueCell!14264))

(declare-datatypes ((array!76737 0))(
  ( (array!76738 (arr!37012 (Array (_ BitVec 32) ValueCell!14264)) (size!37549 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76737)

(declare-fun mapKey!46748 () (_ BitVec 32))

(assert (=> mapNonEmpty!46748 (= (arr!37012 _values!996) (store mapRest!46748 mapKey!46748 mapValue!46748))))

(declare-fun b!1188505 () Bool)

(declare-fun e!675875 () Bool)

(assert (=> b!1188505 (= e!675868 (not e!675875))))

(declare-fun res!789794 () Bool)

(assert (=> b!1188505 (=> res!789794 e!675875)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188505 (= res!789794 (bvsgt from!1455 i!673))))

(assert (=> b!1188505 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39352 0))(
  ( (Unit!39353) )
))
(declare-fun lt!540123 () Unit!39352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76735 (_ BitVec 64) (_ BitVec 32)) Unit!39352)

(assert (=> b!1188505 (= lt!540123 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1188506 () Bool)

(declare-fun res!789793 () Bool)

(assert (=> b!1188506 (=> (not res!789793) (not e!675872))))

(assert (=> b!1188506 (= res!789793 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37548 _keys!1208))))))

(declare-fun b!1188507 () Bool)

(declare-fun res!789805 () Bool)

(assert (=> b!1188507 (=> (not res!789805) (not e!675872))))

(declare-datatypes ((List!26069 0))(
  ( (Nil!26066) (Cons!26065 (h!27283 (_ BitVec 64)) (t!38470 List!26069)) )
))
(declare-fun arrayNoDuplicates!0 (array!76735 (_ BitVec 32) List!26069) Bool)

(assert (=> b!1188507 (= res!789805 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26066))))

(declare-fun b!1188508 () Bool)

(declare-fun res!789795 () Bool)

(assert (=> b!1188508 (=> (not res!789795) (not e!675872))))

(assert (=> b!1188508 (= res!789795 (= (select (arr!37011 _keys!1208) i!673) k0!934))))

(declare-fun b!1188509 () Bool)

(declare-fun res!789797 () Bool)

(assert (=> b!1188509 (=> (not res!789797) (not e!675872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188509 (= res!789797 (validMask!0 mask!1564))))

(declare-fun b!1188510 () Bool)

(declare-fun res!789802 () Bool)

(assert (=> b!1188510 (=> (not res!789802) (not e!675872))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1188510 (= res!789802 (and (= (size!37549 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37548 _keys!1208) (size!37549 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188502 () Bool)

(declare-fun e!675869 () Bool)

(assert (=> b!1188502 (= e!675869 e!675873)))

(declare-fun res!789801 () Bool)

(assert (=> b!1188502 (=> res!789801 e!675873)))

(assert (=> b!1188502 (= res!789801 (not (= (select (arr!37011 _keys!1208) from!1455) k0!934)))))

(declare-fun res!789804 () Bool)

(assert (=> start!100074 (=> (not res!789804) (not e!675872))))

(assert (=> start!100074 (= res!789804 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37548 _keys!1208))))))

(assert (=> start!100074 e!675872))

(declare-fun tp_is_empty!29947 () Bool)

(assert (=> start!100074 tp_is_empty!29947))

(declare-fun array_inv!28312 (array!76735) Bool)

(assert (=> start!100074 (array_inv!28312 _keys!1208)))

(assert (=> start!100074 true))

(assert (=> start!100074 tp!88964))

(declare-fun e!675877 () Bool)

(declare-fun array_inv!28313 (array!76737) Bool)

(assert (=> start!100074 (and (array_inv!28313 _values!996) e!675877)))

(declare-fun b!1188511 () Bool)

(declare-fun res!789806 () Bool)

(assert (=> b!1188511 (=> (not res!789806) (not e!675868))))

(assert (=> b!1188511 (= res!789806 (arrayNoDuplicates!0 lt!540137 #b00000000000000000000000000000000 Nil!26066))))

(declare-fun b!1188512 () Bool)

(declare-fun e!675874 () Bool)

(declare-fun e!675871 () Bool)

(assert (=> b!1188512 (= e!675874 e!675871)))

(declare-fun res!789792 () Bool)

(assert (=> b!1188512 (=> res!789792 e!675871)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188512 (= res!789792 (not (validKeyInArray!0 (select (arr!37011 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19332 0))(
  ( (tuple2!19333 (_1!9677 (_ BitVec 64)) (_2!9677 V!45057)) )
))
(declare-datatypes ((List!26070 0))(
  ( (Nil!26067) (Cons!26066 (h!27284 tuple2!19332) (t!38471 List!26070)) )
))
(declare-datatypes ((ListLongMap!17309 0))(
  ( (ListLongMap!17310 (toList!8670 List!26070)) )
))
(declare-fun lt!540130 () ListLongMap!17309)

(declare-fun lt!540134 () ListLongMap!17309)

(assert (=> b!1188512 (= lt!540130 lt!540134)))

(declare-fun lt!540133 () ListLongMap!17309)

(declare-fun -!1690 (ListLongMap!17309 (_ BitVec 64)) ListLongMap!17309)

(assert (=> b!1188512 (= lt!540134 (-!1690 lt!540133 k0!934))))

(declare-fun zeroValue!944 () V!45057)

(declare-fun lt!540135 () array!76737)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45057)

(declare-fun getCurrentListMapNoExtraKeys!5139 (array!76735 array!76737 (_ BitVec 32) (_ BitVec 32) V!45057 V!45057 (_ BitVec 32) Int) ListLongMap!17309)

(assert (=> b!1188512 (= lt!540130 (getCurrentListMapNoExtraKeys!5139 lt!540137 lt!540135 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188512 (= lt!540133 (getCurrentListMapNoExtraKeys!5139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540139 () Unit!39352)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!906 (array!76735 array!76737 (_ BitVec 32) (_ BitVec 32) V!45057 V!45057 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39352)

(assert (=> b!1188512 (= lt!540139 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!906 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188513 () Bool)

(declare-fun e!675876 () Bool)

(assert (=> b!1188513 (= e!675876 tp_is_empty!29947)))

(declare-fun b!1188514 () Bool)

(assert (=> b!1188514 (= e!675875 e!675874)))

(declare-fun res!789799 () Bool)

(assert (=> b!1188514 (=> res!789799 e!675874)))

(assert (=> b!1188514 (= res!789799 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!540121 () ListLongMap!17309)

(assert (=> b!1188514 (= lt!540121 (getCurrentListMapNoExtraKeys!5139 lt!540137 lt!540135 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!540127 () V!45057)

(assert (=> b!1188514 (= lt!540135 (array!76738 (store (arr!37012 _values!996) i!673 (ValueCellFull!14264 lt!540127)) (size!37549 _values!996)))))

(declare-fun dynLambda!3098 (Int (_ BitVec 64)) V!45057)

(assert (=> b!1188514 (= lt!540127 (dynLambda!3098 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!540125 () ListLongMap!17309)

(assert (=> b!1188514 (= lt!540125 (getCurrentListMapNoExtraKeys!5139 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1188515 () Bool)

(declare-fun e!675870 () Unit!39352)

(declare-fun Unit!39354 () Unit!39352)

(assert (=> b!1188515 (= e!675870 Unit!39354)))

(declare-fun b!1188516 () Bool)

(assert (=> b!1188516 (= e!675867 tp_is_empty!29947)))

(declare-fun b!1188517 () Bool)

(declare-fun Unit!39355 () Unit!39352)

(assert (=> b!1188517 (= e!675870 Unit!39355)))

(declare-fun lt!540126 () Unit!39352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39352)

(assert (=> b!1188517 (= lt!540126 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1188517 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540122 () Unit!39352)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76735 (_ BitVec 32) (_ BitVec 32)) Unit!39352)

(assert (=> b!1188517 (= lt!540122 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1188517 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26066)))

(declare-fun lt!540132 () Unit!39352)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76735 (_ BitVec 64) (_ BitVec 32) List!26069) Unit!39352)

(assert (=> b!1188517 (= lt!540132 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26066))))

(assert (=> b!1188517 false))

(declare-fun b!1188518 () Bool)

(declare-fun res!789800 () Bool)

(assert (=> b!1188518 (=> (not res!789800) (not e!675872))))

(assert (=> b!1188518 (= res!789800 (validKeyInArray!0 k0!934))))

(declare-fun b!1188519 () Bool)

(assert (=> b!1188519 (= e!675877 (and e!675876 mapRes!46748))))

(declare-fun condMapEmpty!46748 () Bool)

(declare-fun mapDefault!46748 () ValueCell!14264)

(assert (=> b!1188519 (= condMapEmpty!46748 (= (arr!37012 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14264)) mapDefault!46748)))))

(declare-fun b!1188520 () Bool)

(assert (=> b!1188520 (= e!675871 true)))

(declare-fun lt!540138 () ListLongMap!17309)

(declare-fun lt!540129 () ListLongMap!17309)

(assert (=> b!1188520 (= (-!1690 lt!540138 k0!934) lt!540129)))

(declare-fun lt!540124 () V!45057)

(declare-fun lt!540131 () Unit!39352)

(declare-fun addRemoveCommutativeForDiffKeys!203 (ListLongMap!17309 (_ BitVec 64) V!45057 (_ BitVec 64)) Unit!39352)

(assert (=> b!1188520 (= lt!540131 (addRemoveCommutativeForDiffKeys!203 lt!540133 (select (arr!37011 _keys!1208) from!1455) lt!540124 k0!934))))

(assert (=> b!1188520 (and (= lt!540125 lt!540138) (= lt!540134 lt!540130))))

(declare-fun lt!540136 () tuple2!19332)

(declare-fun +!3987 (ListLongMap!17309 tuple2!19332) ListLongMap!17309)

(assert (=> b!1188520 (= lt!540138 (+!3987 lt!540133 lt!540136))))

(assert (=> b!1188520 (not (= (select (arr!37011 _keys!1208) from!1455) k0!934))))

(declare-fun lt!540128 () Unit!39352)

(assert (=> b!1188520 (= lt!540128 e!675870)))

(declare-fun c!117647 () Bool)

(assert (=> b!1188520 (= c!117647 (= (select (arr!37011 _keys!1208) from!1455) k0!934))))

(assert (=> b!1188520 e!675869))

(declare-fun res!789803 () Bool)

(assert (=> b!1188520 (=> (not res!789803) (not e!675869))))

(assert (=> b!1188520 (= res!789803 (= lt!540121 lt!540129))))

(assert (=> b!1188520 (= lt!540129 (+!3987 lt!540134 lt!540136))))

(assert (=> b!1188520 (= lt!540136 (tuple2!19333 (select (arr!37011 _keys!1208) from!1455) lt!540124))))

(declare-fun get!19004 (ValueCell!14264 V!45057) V!45057)

(assert (=> b!1188520 (= lt!540124 (get!19004 (select (arr!37012 _values!996) from!1455) lt!540127))))

(declare-fun b!1188521 () Bool)

(declare-fun res!789798 () Bool)

(assert (=> b!1188521 (=> (not res!789798) (not e!675872))))

(assert (=> b!1188521 (= res!789798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100074 res!789804) b!1188509))

(assert (= (and b!1188509 res!789797) b!1188510))

(assert (= (and b!1188510 res!789802) b!1188521))

(assert (= (and b!1188521 res!789798) b!1188507))

(assert (= (and b!1188507 res!789805) b!1188506))

(assert (= (and b!1188506 res!789793) b!1188518))

(assert (= (and b!1188518 res!789800) b!1188508))

(assert (= (and b!1188508 res!789795) b!1188504))

(assert (= (and b!1188504 res!789796) b!1188511))

(assert (= (and b!1188511 res!789806) b!1188505))

(assert (= (and b!1188505 (not res!789794)) b!1188514))

(assert (= (and b!1188514 (not res!789799)) b!1188512))

(assert (= (and b!1188512 (not res!789792)) b!1188520))

(assert (= (and b!1188520 res!789803) b!1188502))

(assert (= (and b!1188502 (not res!789801)) b!1188503))

(assert (= (and b!1188520 c!117647) b!1188517))

(assert (= (and b!1188520 (not c!117647)) b!1188515))

(assert (= (and b!1188519 condMapEmpty!46748) mapIsEmpty!46748))

(assert (= (and b!1188519 (not condMapEmpty!46748)) mapNonEmpty!46748))

(get-info :version)

(assert (= (and mapNonEmpty!46748 ((_ is ValueCellFull!14264) mapValue!46748)) b!1188516))

(assert (= (and b!1188519 ((_ is ValueCellFull!14264) mapDefault!46748)) b!1188513))

(assert (= start!100074 b!1188519))

(declare-fun b_lambda!20555 () Bool)

(assert (=> (not b_lambda!20555) (not b!1188514)))

(declare-fun t!38469 () Bool)

(declare-fun tb!10221 () Bool)

(assert (=> (and start!100074 (= defaultEntry!1004 defaultEntry!1004) t!38469) tb!10221))

(declare-fun result!21017 () Bool)

(assert (=> tb!10221 (= result!21017 tp_is_empty!29947)))

(assert (=> b!1188514 t!38469))

(declare-fun b_and!41705 () Bool)

(assert (= b_and!41703 (and (=> t!38469 result!21017) b_and!41705)))

(declare-fun m!1097427 () Bool)

(assert (=> b!1188521 m!1097427))

(declare-fun m!1097429 () Bool)

(assert (=> mapNonEmpty!46748 m!1097429))

(declare-fun m!1097431 () Bool)

(assert (=> b!1188509 m!1097431))

(declare-fun m!1097433 () Bool)

(assert (=> b!1188514 m!1097433))

(declare-fun m!1097435 () Bool)

(assert (=> b!1188514 m!1097435))

(declare-fun m!1097437 () Bool)

(assert (=> b!1188514 m!1097437))

(declare-fun m!1097439 () Bool)

(assert (=> b!1188514 m!1097439))

(declare-fun m!1097441 () Bool)

(assert (=> start!100074 m!1097441))

(declare-fun m!1097443 () Bool)

(assert (=> start!100074 m!1097443))

(declare-fun m!1097445 () Bool)

(assert (=> b!1188518 m!1097445))

(declare-fun m!1097447 () Bool)

(assert (=> b!1188503 m!1097447))

(declare-fun m!1097449 () Bool)

(assert (=> b!1188511 m!1097449))

(declare-fun m!1097451 () Bool)

(assert (=> b!1188508 m!1097451))

(declare-fun m!1097453 () Bool)

(assert (=> b!1188507 m!1097453))

(declare-fun m!1097455 () Bool)

(assert (=> b!1188502 m!1097455))

(declare-fun m!1097457 () Bool)

(assert (=> b!1188512 m!1097457))

(declare-fun m!1097459 () Bool)

(assert (=> b!1188512 m!1097459))

(declare-fun m!1097461 () Bool)

(assert (=> b!1188512 m!1097461))

(declare-fun m!1097463 () Bool)

(assert (=> b!1188512 m!1097463))

(assert (=> b!1188512 m!1097455))

(declare-fun m!1097465 () Bool)

(assert (=> b!1188512 m!1097465))

(assert (=> b!1188512 m!1097455))

(declare-fun m!1097467 () Bool)

(assert (=> b!1188505 m!1097467))

(declare-fun m!1097469 () Bool)

(assert (=> b!1188505 m!1097469))

(declare-fun m!1097471 () Bool)

(assert (=> b!1188504 m!1097471))

(declare-fun m!1097473 () Bool)

(assert (=> b!1188504 m!1097473))

(declare-fun m!1097475 () Bool)

(assert (=> b!1188517 m!1097475))

(declare-fun m!1097477 () Bool)

(assert (=> b!1188517 m!1097477))

(declare-fun m!1097479 () Bool)

(assert (=> b!1188517 m!1097479))

(declare-fun m!1097481 () Bool)

(assert (=> b!1188517 m!1097481))

(declare-fun m!1097483 () Bool)

(assert (=> b!1188517 m!1097483))

(declare-fun m!1097485 () Bool)

(assert (=> b!1188520 m!1097485))

(declare-fun m!1097487 () Bool)

(assert (=> b!1188520 m!1097487))

(declare-fun m!1097489 () Bool)

(assert (=> b!1188520 m!1097489))

(declare-fun m!1097491 () Bool)

(assert (=> b!1188520 m!1097491))

(assert (=> b!1188520 m!1097489))

(declare-fun m!1097493 () Bool)

(assert (=> b!1188520 m!1097493))

(assert (=> b!1188520 m!1097455))

(declare-fun m!1097495 () Bool)

(assert (=> b!1188520 m!1097495))

(assert (=> b!1188520 m!1097455))

(check-sat (not b!1188507) (not b!1188517) (not b!1188511) (not b!1188505) (not b!1188509) (not b!1188520) (not b!1188514) tp_is_empty!29947 (not b!1188521) (not b_lambda!20555) (not start!100074) b_and!41705 (not b!1188518) (not mapNonEmpty!46748) (not b!1188503) (not b_next!25417) (not b!1188512) (not b!1188504))
(check-sat b_and!41705 (not b_next!25417))
