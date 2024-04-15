; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98066 () Bool)

(assert start!98066)

(declare-fun b_free!23773 () Bool)

(declare-fun b_next!23773 () Bool)

(assert (=> start!98066 (= b_free!23773 (not b_next!23773))))

(declare-fun tp!84022 () Bool)

(declare-fun b_and!38307 () Bool)

(assert (=> start!98066 (= tp!84022 b_and!38307)))

(declare-fun res!752510 () Bool)

(declare-fun e!640978 () Bool)

(assert (=> start!98066 (=> (not res!752510) (not e!640978))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73396 0))(
  ( (array!73397 (arr!35351 (Array (_ BitVec 32) (_ BitVec 64))) (size!35889 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73396)

(assert (=> start!98066 (= res!752510 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35889 _keys!1208))))))

(assert (=> start!98066 e!640978))

(declare-fun tp_is_empty!28303 () Bool)

(assert (=> start!98066 tp_is_empty!28303))

(declare-fun array_inv!27206 (array!73396) Bool)

(assert (=> start!98066 (array_inv!27206 _keys!1208)))

(assert (=> start!98066 true))

(assert (=> start!98066 tp!84022))

(declare-datatypes ((V!42865 0))(
  ( (V!42866 (val!14208 Int)) )
))
(declare-datatypes ((ValueCell!13442 0))(
  ( (ValueCellFull!13442 (v!16840 V!42865)) (EmptyCell!13442) )
))
(declare-datatypes ((array!73398 0))(
  ( (array!73399 (arr!35352 (Array (_ BitVec 32) ValueCell!13442)) (size!35890 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73398)

(declare-fun e!640983 () Bool)

(declare-fun array_inv!27207 (array!73398) Bool)

(assert (=> start!98066 (and (array_inv!27207 _values!996) e!640983)))

(declare-fun e!640981 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!17954 0))(
  ( (tuple2!17955 (_1!8988 (_ BitVec 64)) (_2!8988 V!42865)) )
))
(declare-datatypes ((List!24713 0))(
  ( (Nil!24710) (Cons!24709 (h!25918 tuple2!17954) (t!35469 List!24713)) )
))
(declare-datatypes ((ListLongMap!15923 0))(
  ( (ListLongMap!15924 (toList!7977 List!24713)) )
))
(declare-fun call!47579 () ListLongMap!15923)

(declare-fun b!1126105 () Bool)

(declare-fun call!47578 () ListLongMap!15923)

(declare-fun -!1105 (ListLongMap!15923 (_ BitVec 64)) ListLongMap!15923)

(assert (=> b!1126105 (= e!640981 (= call!47579 (-!1105 call!47578 k0!934)))))

(declare-fun b!1126106 () Bool)

(declare-fun e!640982 () Bool)

(declare-fun mapRes!44272 () Bool)

(assert (=> b!1126106 (= e!640983 (and e!640982 mapRes!44272))))

(declare-fun condMapEmpty!44272 () Bool)

(declare-fun mapDefault!44272 () ValueCell!13442)

(assert (=> b!1126106 (= condMapEmpty!44272 (= (arr!35352 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13442)) mapDefault!44272)))))

(declare-fun b!1126107 () Bool)

(declare-fun e!640979 () Bool)

(declare-fun e!640984 () Bool)

(assert (=> b!1126107 (= e!640979 e!640984)))

(declare-fun res!752518 () Bool)

(assert (=> b!1126107 (=> res!752518 e!640984)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126107 (= res!752518 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42865)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499951 () array!73398)

(declare-fun minValue!944 () V!42865)

(declare-fun lt!499948 () ListLongMap!15923)

(declare-fun lt!499953 () array!73396)

(declare-fun getCurrentListMapNoExtraKeys!4479 (array!73396 array!73398 (_ BitVec 32) (_ BitVec 32) V!42865 V!42865 (_ BitVec 32) Int) ListLongMap!15923)

(assert (=> b!1126107 (= lt!499948 (getCurrentListMapNoExtraKeys!4479 lt!499953 lt!499951 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2496 (Int (_ BitVec 64)) V!42865)

(assert (=> b!1126107 (= lt!499951 (array!73399 (store (arr!35352 _values!996) i!673 (ValueCellFull!13442 (dynLambda!2496 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35890 _values!996)))))

(declare-fun lt!499952 () ListLongMap!15923)

(assert (=> b!1126107 (= lt!499952 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126108 () Bool)

(declare-fun e!640980 () Bool)

(assert (=> b!1126108 (= e!640980 (not e!640979))))

(declare-fun res!752513 () Bool)

(assert (=> b!1126108 (=> res!752513 e!640979)))

(assert (=> b!1126108 (= res!752513 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126108 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36761 0))(
  ( (Unit!36762) )
))
(declare-fun lt!499947 () Unit!36761)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73396 (_ BitVec 64) (_ BitVec 32)) Unit!36761)

(assert (=> b!1126108 (= lt!499947 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126109 () Bool)

(declare-fun res!752507 () Bool)

(assert (=> b!1126109 (=> (not res!752507) (not e!640978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126109 (= res!752507 (validMask!0 mask!1564))))

(declare-fun b!1126110 () Bool)

(declare-fun e!640977 () Bool)

(assert (=> b!1126110 (= e!640984 e!640977)))

(declare-fun res!752508 () Bool)

(assert (=> b!1126110 (=> res!752508 e!640977)))

(assert (=> b!1126110 (= res!752508 (not (= (select (arr!35351 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126110 e!640981))

(declare-fun c!109623 () Bool)

(assert (=> b!1126110 (= c!109623 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499949 () Unit!36761)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!386 (array!73396 array!73398 (_ BitVec 32) (_ BitVec 32) V!42865 V!42865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36761)

(assert (=> b!1126110 (= lt!499949 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!386 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47575 () Bool)

(assert (=> bm!47575 (= call!47578 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126111 () Bool)

(assert (=> b!1126111 (= e!640978 e!640980)))

(declare-fun res!752514 () Bool)

(assert (=> b!1126111 (=> (not res!752514) (not e!640980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73396 (_ BitVec 32)) Bool)

(assert (=> b!1126111 (= res!752514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499953 mask!1564))))

(assert (=> b!1126111 (= lt!499953 (array!73397 (store (arr!35351 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35889 _keys!1208)))))

(declare-fun b!1126112 () Bool)

(assert (=> b!1126112 (= e!640981 (= call!47579 call!47578))))

(declare-fun b!1126113 () Bool)

(declare-fun res!752516 () Bool)

(assert (=> b!1126113 (=> (not res!752516) (not e!640978))))

(assert (=> b!1126113 (= res!752516 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35889 _keys!1208))))))

(declare-fun b!1126114 () Bool)

(declare-fun res!752515 () Bool)

(assert (=> b!1126114 (=> (not res!752515) (not e!640980))))

(declare-datatypes ((List!24714 0))(
  ( (Nil!24711) (Cons!24710 (h!25919 (_ BitVec 64)) (t!35470 List!24714)) )
))
(declare-fun arrayNoDuplicates!0 (array!73396 (_ BitVec 32) List!24714) Bool)

(assert (=> b!1126114 (= res!752515 (arrayNoDuplicates!0 lt!499953 #b00000000000000000000000000000000 Nil!24711))))

(declare-fun b!1126115 () Bool)

(declare-fun res!752511 () Bool)

(assert (=> b!1126115 (=> (not res!752511) (not e!640978))))

(assert (=> b!1126115 (= res!752511 (and (= (size!35890 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35889 _keys!1208) (size!35890 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126116 () Bool)

(declare-fun e!640986 () Bool)

(assert (=> b!1126116 (= e!640986 tp_is_empty!28303)))

(declare-fun b!1126117 () Bool)

(assert (=> b!1126117 (= e!640982 tp_is_empty!28303)))

(declare-fun b!1126118 () Bool)

(declare-fun res!752506 () Bool)

(assert (=> b!1126118 (=> (not res!752506) (not e!640978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126118 (= res!752506 (validKeyInArray!0 k0!934))))

(declare-fun b!1126119 () Bool)

(declare-fun res!752512 () Bool)

(assert (=> b!1126119 (=> (not res!752512) (not e!640978))))

(assert (=> b!1126119 (= res!752512 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24711))))

(declare-fun mapIsEmpty!44272 () Bool)

(assert (=> mapIsEmpty!44272 mapRes!44272))

(declare-fun mapNonEmpty!44272 () Bool)

(declare-fun tp!84023 () Bool)

(assert (=> mapNonEmpty!44272 (= mapRes!44272 (and tp!84023 e!640986))))

(declare-fun mapKey!44272 () (_ BitVec 32))

(declare-fun mapRest!44272 () (Array (_ BitVec 32) ValueCell!13442))

(declare-fun mapValue!44272 () ValueCell!13442)

(assert (=> mapNonEmpty!44272 (= (arr!35352 _values!996) (store mapRest!44272 mapKey!44272 mapValue!44272))))

(declare-fun b!1126120 () Bool)

(declare-fun res!752509 () Bool)

(assert (=> b!1126120 (=> (not res!752509) (not e!640978))))

(assert (=> b!1126120 (= res!752509 (= (select (arr!35351 _keys!1208) i!673) k0!934))))

(declare-fun bm!47576 () Bool)

(assert (=> bm!47576 (= call!47579 (getCurrentListMapNoExtraKeys!4479 lt!499953 lt!499951 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126121 () Bool)

(assert (=> b!1126121 (= e!640977 true)))

(declare-fun lt!499950 () Bool)

(declare-fun contains!6442 (ListLongMap!15923 (_ BitVec 64)) Bool)

(assert (=> b!1126121 (= lt!499950 (contains!6442 (getCurrentListMapNoExtraKeys!4479 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126122 () Bool)

(declare-fun res!752517 () Bool)

(assert (=> b!1126122 (=> (not res!752517) (not e!640978))))

(assert (=> b!1126122 (= res!752517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98066 res!752510) b!1126109))

(assert (= (and b!1126109 res!752507) b!1126115))

(assert (= (and b!1126115 res!752511) b!1126122))

(assert (= (and b!1126122 res!752517) b!1126119))

(assert (= (and b!1126119 res!752512) b!1126113))

(assert (= (and b!1126113 res!752516) b!1126118))

(assert (= (and b!1126118 res!752506) b!1126120))

(assert (= (and b!1126120 res!752509) b!1126111))

(assert (= (and b!1126111 res!752514) b!1126114))

(assert (= (and b!1126114 res!752515) b!1126108))

(assert (= (and b!1126108 (not res!752513)) b!1126107))

(assert (= (and b!1126107 (not res!752518)) b!1126110))

(assert (= (and b!1126110 c!109623) b!1126105))

(assert (= (and b!1126110 (not c!109623)) b!1126112))

(assert (= (or b!1126105 b!1126112) bm!47576))

(assert (= (or b!1126105 b!1126112) bm!47575))

(assert (= (and b!1126110 (not res!752508)) b!1126121))

(assert (= (and b!1126106 condMapEmpty!44272) mapIsEmpty!44272))

(assert (= (and b!1126106 (not condMapEmpty!44272)) mapNonEmpty!44272))

(get-info :version)

(assert (= (and mapNonEmpty!44272 ((_ is ValueCellFull!13442) mapValue!44272)) b!1126116))

(assert (= (and b!1126106 ((_ is ValueCellFull!13442) mapDefault!44272)) b!1126117))

(assert (= start!98066 b!1126106))

(declare-fun b_lambda!18725 () Bool)

(assert (=> (not b_lambda!18725) (not b!1126107)))

(declare-fun t!35468 () Bool)

(declare-fun tb!8577 () Bool)

(assert (=> (and start!98066 (= defaultEntry!1004 defaultEntry!1004) t!35468) tb!8577))

(declare-fun result!17723 () Bool)

(assert (=> tb!8577 (= result!17723 tp_is_empty!28303)))

(assert (=> b!1126107 t!35468))

(declare-fun b_and!38309 () Bool)

(assert (= b_and!38307 (and (=> t!35468 result!17723) b_and!38309)))

(declare-fun m!1039605 () Bool)

(assert (=> mapNonEmpty!44272 m!1039605))

(declare-fun m!1039607 () Bool)

(assert (=> bm!47575 m!1039607))

(declare-fun m!1039609 () Bool)

(assert (=> b!1126110 m!1039609))

(declare-fun m!1039611 () Bool)

(assert (=> b!1126110 m!1039611))

(declare-fun m!1039613 () Bool)

(assert (=> b!1126108 m!1039613))

(declare-fun m!1039615 () Bool)

(assert (=> b!1126108 m!1039615))

(declare-fun m!1039617 () Bool)

(assert (=> b!1126107 m!1039617))

(declare-fun m!1039619 () Bool)

(assert (=> b!1126107 m!1039619))

(declare-fun m!1039621 () Bool)

(assert (=> b!1126107 m!1039621))

(declare-fun m!1039623 () Bool)

(assert (=> b!1126107 m!1039623))

(declare-fun m!1039625 () Bool)

(assert (=> start!98066 m!1039625))

(declare-fun m!1039627 () Bool)

(assert (=> start!98066 m!1039627))

(declare-fun m!1039629 () Bool)

(assert (=> b!1126114 m!1039629))

(declare-fun m!1039631 () Bool)

(assert (=> bm!47576 m!1039631))

(declare-fun m!1039633 () Bool)

(assert (=> b!1126120 m!1039633))

(assert (=> b!1126121 m!1039607))

(assert (=> b!1126121 m!1039607))

(declare-fun m!1039635 () Bool)

(assert (=> b!1126121 m!1039635))

(declare-fun m!1039637 () Bool)

(assert (=> b!1126111 m!1039637))

(declare-fun m!1039639 () Bool)

(assert (=> b!1126111 m!1039639))

(declare-fun m!1039641 () Bool)

(assert (=> b!1126109 m!1039641))

(declare-fun m!1039643 () Bool)

(assert (=> b!1126118 m!1039643))

(declare-fun m!1039645 () Bool)

(assert (=> b!1126119 m!1039645))

(declare-fun m!1039647 () Bool)

(assert (=> b!1126122 m!1039647))

(declare-fun m!1039649 () Bool)

(assert (=> b!1126105 m!1039649))

(check-sat (not b!1126114) (not bm!47575) (not b_next!23773) (not b!1126122) (not b!1126111) (not b!1126107) (not b_lambda!18725) (not start!98066) b_and!38309 (not b!1126108) (not mapNonEmpty!44272) tp_is_empty!28303 (not bm!47576) (not b!1126110) (not b!1126118) (not b!1126119) (not b!1126105) (not b!1126109) (not b!1126121))
(check-sat b_and!38309 (not b_next!23773))
