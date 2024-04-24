; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100050 () Bool)

(assert start!100050)

(declare-fun b_free!25393 () Bool)

(declare-fun b_next!25393 () Bool)

(assert (=> start!100050 (= b_free!25393 (not b_next!25393))))

(declare-fun tp!88893 () Bool)

(declare-fun b_and!41655 () Bool)

(assert (=> start!100050 (= tp!88893 b_and!41655)))

(declare-fun b!1187758 () Bool)

(declare-fun e!675442 () Bool)

(declare-fun tp_is_empty!29923 () Bool)

(assert (=> b!1187758 (= e!675442 tp_is_empty!29923)))

(declare-fun b!1187759 () Bool)

(declare-fun e!675435 () Bool)

(assert (=> b!1187759 (= e!675435 true)))

(declare-datatypes ((V!45025 0))(
  ( (V!45026 (val!15018 Int)) )
))
(declare-datatypes ((tuple2!19314 0))(
  ( (tuple2!19315 (_1!9668 (_ BitVec 64)) (_2!9668 V!45025)) )
))
(declare-datatypes ((List!26049 0))(
  ( (Nil!26046) (Cons!26045 (h!27263 tuple2!19314) (t!38426 List!26049)) )
))
(declare-datatypes ((ListLongMap!17291 0))(
  ( (ListLongMap!17292 (toList!8661 List!26049)) )
))
(declare-fun lt!539451 () ListLongMap!17291)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!539454 () ListLongMap!17291)

(declare-fun -!1681 (ListLongMap!17291 (_ BitVec 64)) ListLongMap!17291)

(assert (=> b!1187759 (= (-!1681 lt!539451 k0!934) lt!539454)))

(declare-datatypes ((array!76687 0))(
  ( (array!76688 (arr!36987 (Array (_ BitVec 32) (_ BitVec 64))) (size!37524 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76687)

(declare-fun lt!539437 () ListLongMap!17291)

(declare-datatypes ((Unit!39321 0))(
  ( (Unit!39322) )
))
(declare-fun lt!539445 () Unit!39321)

(declare-fun lt!539438 () V!45025)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!194 (ListLongMap!17291 (_ BitVec 64) V!45025 (_ BitVec 64)) Unit!39321)

(assert (=> b!1187759 (= lt!539445 (addRemoveCommutativeForDiffKeys!194 lt!539437 (select (arr!36987 _keys!1208) from!1455) lt!539438 k0!934))))

(declare-fun lt!539443 () ListLongMap!17291)

(declare-fun lt!539452 () ListLongMap!17291)

(declare-fun lt!539447 () ListLongMap!17291)

(assert (=> b!1187759 (and (= lt!539447 lt!539451) (= lt!539443 lt!539452))))

(declare-fun lt!539448 () tuple2!19314)

(declare-fun +!3978 (ListLongMap!17291 tuple2!19314) ListLongMap!17291)

(assert (=> b!1187759 (= lt!539451 (+!3978 lt!539437 lt!539448))))

(assert (=> b!1187759 (not (= (select (arr!36987 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539441 () Unit!39321)

(declare-fun e!675443 () Unit!39321)

(assert (=> b!1187759 (= lt!539441 e!675443)))

(declare-fun c!117611 () Bool)

(assert (=> b!1187759 (= c!117611 (= (select (arr!36987 _keys!1208) from!1455) k0!934))))

(declare-fun e!675440 () Bool)

(assert (=> b!1187759 e!675440))

(declare-fun res!789261 () Bool)

(assert (=> b!1187759 (=> (not res!789261) (not e!675440))))

(declare-fun lt!539453 () ListLongMap!17291)

(assert (=> b!1187759 (= res!789261 (= lt!539453 lt!539454))))

(assert (=> b!1187759 (= lt!539454 (+!3978 lt!539443 lt!539448))))

(assert (=> b!1187759 (= lt!539448 (tuple2!19315 (select (arr!36987 _keys!1208) from!1455) lt!539438))))

(declare-fun lt!539440 () V!45025)

(declare-datatypes ((ValueCell!14252 0))(
  ( (ValueCellFull!14252 (v!17652 V!45025)) (EmptyCell!14252) )
))
(declare-datatypes ((array!76689 0))(
  ( (array!76690 (arr!36988 (Array (_ BitVec 32) ValueCell!14252)) (size!37525 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76689)

(declare-fun get!18987 (ValueCell!14252 V!45025) V!45025)

(assert (=> b!1187759 (= lt!539438 (get!18987 (select (arr!36988 _values!996) from!1455) lt!539440))))

(declare-fun b!1187760 () Bool)

(declare-fun e!675444 () Bool)

(assert (=> b!1187760 (= e!675444 tp_is_empty!29923)))

(declare-fun mapNonEmpty!46712 () Bool)

(declare-fun mapRes!46712 () Bool)

(declare-fun tp!88892 () Bool)

(assert (=> mapNonEmpty!46712 (= mapRes!46712 (and tp!88892 e!675442))))

(declare-fun mapKey!46712 () (_ BitVec 32))

(declare-fun mapValue!46712 () ValueCell!14252)

(declare-fun mapRest!46712 () (Array (_ BitVec 32) ValueCell!14252))

(assert (=> mapNonEmpty!46712 (= (arr!36988 _values!996) (store mapRest!46712 mapKey!46712 mapValue!46712))))

(declare-fun b!1187762 () Bool)

(declare-fun Unit!39323 () Unit!39321)

(assert (=> b!1187762 (= e!675443 Unit!39323)))

(declare-fun b!1187763 () Bool)

(declare-fun e!675446 () Bool)

(declare-fun e!675436 () Bool)

(assert (=> b!1187763 (= e!675446 (not e!675436))))

(declare-fun res!789259 () Bool)

(assert (=> b!1187763 (=> res!789259 e!675436)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187763 (= res!789259 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187763 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539446 () Unit!39321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76687 (_ BitVec 64) (_ BitVec 32)) Unit!39321)

(assert (=> b!1187763 (= lt!539446 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187764 () Bool)

(declare-fun res!789266 () Bool)

(declare-fun e!675438 () Bool)

(assert (=> b!1187764 (=> (not res!789266) (not e!675438))))

(assert (=> b!1187764 (= res!789266 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37524 _keys!1208))))))

(declare-fun b!1187765 () Bool)

(declare-fun e!675441 () Bool)

(assert (=> b!1187765 (= e!675441 (and e!675444 mapRes!46712))))

(declare-fun condMapEmpty!46712 () Bool)

(declare-fun mapDefault!46712 () ValueCell!14252)

(assert (=> b!1187765 (= condMapEmpty!46712 (= (arr!36988 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14252)) mapDefault!46712)))))

(declare-fun b!1187766 () Bool)

(declare-fun res!789255 () Bool)

(assert (=> b!1187766 (=> (not res!789255) (not e!675438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187766 (= res!789255 (validKeyInArray!0 k0!934))))

(declare-fun b!1187767 () Bool)

(declare-fun res!789263 () Bool)

(assert (=> b!1187767 (=> (not res!789263) (not e!675438))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187767 (= res!789263 (validMask!0 mask!1564))))

(declare-fun b!1187768 () Bool)

(declare-fun Unit!39324 () Unit!39321)

(assert (=> b!1187768 (= e!675443 Unit!39324)))

(declare-fun lt!539450 () Unit!39321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76687 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39321)

(assert (=> b!1187768 (= lt!539450 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187768 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539442 () Unit!39321)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76687 (_ BitVec 32) (_ BitVec 32)) Unit!39321)

(assert (=> b!1187768 (= lt!539442 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26050 0))(
  ( (Nil!26047) (Cons!26046 (h!27264 (_ BitVec 64)) (t!38427 List!26050)) )
))
(declare-fun arrayNoDuplicates!0 (array!76687 (_ BitVec 32) List!26050) Bool)

(assert (=> b!1187768 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26047)))

(declare-fun lt!539449 () Unit!39321)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76687 (_ BitVec 64) (_ BitVec 32) List!26050) Unit!39321)

(assert (=> b!1187768 (= lt!539449 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26047))))

(assert (=> b!1187768 false))

(declare-fun b!1187769 () Bool)

(declare-fun res!789258 () Bool)

(assert (=> b!1187769 (=> (not res!789258) (not e!675438))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1187769 (= res!789258 (and (= (size!37525 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37524 _keys!1208) (size!37525 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187770 () Bool)

(assert (=> b!1187770 (= e!675438 e!675446)))

(declare-fun res!789260 () Bool)

(assert (=> b!1187770 (=> (not res!789260) (not e!675446))))

(declare-fun lt!539455 () array!76687)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76687 (_ BitVec 32)) Bool)

(assert (=> b!1187770 (= res!789260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539455 mask!1564))))

(assert (=> b!1187770 (= lt!539455 (array!76688 (store (arr!36987 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37524 _keys!1208)))))

(declare-fun b!1187771 () Bool)

(declare-fun res!789262 () Bool)

(assert (=> b!1187771 (=> (not res!789262) (not e!675438))))

(assert (=> b!1187771 (= res!789262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!675445 () Bool)

(declare-fun b!1187772 () Bool)

(assert (=> b!1187772 (= e!675445 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187773 () Bool)

(declare-fun e!675439 () Bool)

(assert (=> b!1187773 (= e!675436 e!675439)))

(declare-fun res!789256 () Bool)

(assert (=> b!1187773 (=> res!789256 e!675439)))

(assert (=> b!1187773 (= res!789256 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45025)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539444 () array!76689)

(declare-fun minValue!944 () V!45025)

(declare-fun getCurrentListMapNoExtraKeys!5130 (array!76687 array!76689 (_ BitVec 32) (_ BitVec 32) V!45025 V!45025 (_ BitVec 32) Int) ListLongMap!17291)

(assert (=> b!1187773 (= lt!539453 (getCurrentListMapNoExtraKeys!5130 lt!539455 lt!539444 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187773 (= lt!539444 (array!76690 (store (arr!36988 _values!996) i!673 (ValueCellFull!14252 lt!539440)) (size!37525 _values!996)))))

(declare-fun dynLambda!3090 (Int (_ BitVec 64)) V!45025)

(assert (=> b!1187773 (= lt!539440 (dynLambda!3090 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187773 (= lt!539447 (getCurrentListMapNoExtraKeys!5130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187761 () Bool)

(declare-fun res!789253 () Bool)

(assert (=> b!1187761 (=> (not res!789253) (not e!675438))))

(assert (=> b!1187761 (= res!789253 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26047))))

(declare-fun res!789264 () Bool)

(assert (=> start!100050 (=> (not res!789264) (not e!675438))))

(assert (=> start!100050 (= res!789264 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37524 _keys!1208))))))

(assert (=> start!100050 e!675438))

(assert (=> start!100050 tp_is_empty!29923))

(declare-fun array_inv!28298 (array!76687) Bool)

(assert (=> start!100050 (array_inv!28298 _keys!1208)))

(assert (=> start!100050 true))

(assert (=> start!100050 tp!88893))

(declare-fun array_inv!28299 (array!76689) Bool)

(assert (=> start!100050 (and (array_inv!28299 _values!996) e!675441)))

(declare-fun b!1187774 () Bool)

(declare-fun res!789257 () Bool)

(assert (=> b!1187774 (=> (not res!789257) (not e!675446))))

(assert (=> b!1187774 (= res!789257 (arrayNoDuplicates!0 lt!539455 #b00000000000000000000000000000000 Nil!26047))))

(declare-fun b!1187775 () Bool)

(assert (=> b!1187775 (= e!675439 e!675435)))

(declare-fun res!789265 () Bool)

(assert (=> b!1187775 (=> res!789265 e!675435)))

(assert (=> b!1187775 (= res!789265 (not (validKeyInArray!0 (select (arr!36987 _keys!1208) from!1455))))))

(assert (=> b!1187775 (= lt!539452 lt!539443)))

(assert (=> b!1187775 (= lt!539443 (-!1681 lt!539437 k0!934))))

(assert (=> b!1187775 (= lt!539452 (getCurrentListMapNoExtraKeys!5130 lt!539455 lt!539444 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187775 (= lt!539437 (getCurrentListMapNoExtraKeys!5130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539439 () Unit!39321)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!898 (array!76687 array!76689 (_ BitVec 32) (_ BitVec 32) V!45025 V!45025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39321)

(assert (=> b!1187775 (= lt!539439 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!898 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187776 () Bool)

(assert (=> b!1187776 (= e!675440 e!675445)))

(declare-fun res!789254 () Bool)

(assert (=> b!1187776 (=> res!789254 e!675445)))

(assert (=> b!1187776 (= res!789254 (not (= (select (arr!36987 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1187777 () Bool)

(declare-fun res!789252 () Bool)

(assert (=> b!1187777 (=> (not res!789252) (not e!675438))))

(assert (=> b!1187777 (= res!789252 (= (select (arr!36987 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46712 () Bool)

(assert (=> mapIsEmpty!46712 mapRes!46712))

(assert (= (and start!100050 res!789264) b!1187767))

(assert (= (and b!1187767 res!789263) b!1187769))

(assert (= (and b!1187769 res!789258) b!1187771))

(assert (= (and b!1187771 res!789262) b!1187761))

(assert (= (and b!1187761 res!789253) b!1187764))

(assert (= (and b!1187764 res!789266) b!1187766))

(assert (= (and b!1187766 res!789255) b!1187777))

(assert (= (and b!1187777 res!789252) b!1187770))

(assert (= (and b!1187770 res!789260) b!1187774))

(assert (= (and b!1187774 res!789257) b!1187763))

(assert (= (and b!1187763 (not res!789259)) b!1187773))

(assert (= (and b!1187773 (not res!789256)) b!1187775))

(assert (= (and b!1187775 (not res!789265)) b!1187759))

(assert (= (and b!1187759 res!789261) b!1187776))

(assert (= (and b!1187776 (not res!789254)) b!1187772))

(assert (= (and b!1187759 c!117611) b!1187768))

(assert (= (and b!1187759 (not c!117611)) b!1187762))

(assert (= (and b!1187765 condMapEmpty!46712) mapIsEmpty!46712))

(assert (= (and b!1187765 (not condMapEmpty!46712)) mapNonEmpty!46712))

(get-info :version)

(assert (= (and mapNonEmpty!46712 ((_ is ValueCellFull!14252) mapValue!46712)) b!1187758))

(assert (= (and b!1187765 ((_ is ValueCellFull!14252) mapDefault!46712)) b!1187760))

(assert (= start!100050 b!1187765))

(declare-fun b_lambda!20531 () Bool)

(assert (=> (not b_lambda!20531) (not b!1187773)))

(declare-fun t!38425 () Bool)

(declare-fun tb!10197 () Bool)

(assert (=> (and start!100050 (= defaultEntry!1004 defaultEntry!1004) t!38425) tb!10197))

(declare-fun result!20969 () Bool)

(assert (=> tb!10197 (= result!20969 tp_is_empty!29923)))

(assert (=> b!1187773 t!38425))

(declare-fun b_and!41657 () Bool)

(assert (= b_and!41655 (and (=> t!38425 result!20969) b_and!41657)))

(declare-fun m!1096587 () Bool)

(assert (=> start!100050 m!1096587))

(declare-fun m!1096589 () Bool)

(assert (=> start!100050 m!1096589))

(declare-fun m!1096591 () Bool)

(assert (=> b!1187761 m!1096591))

(declare-fun m!1096593 () Bool)

(assert (=> b!1187777 m!1096593))

(declare-fun m!1096595 () Bool)

(assert (=> b!1187774 m!1096595))

(declare-fun m!1096597 () Bool)

(assert (=> b!1187770 m!1096597))

(declare-fun m!1096599 () Bool)

(assert (=> b!1187770 m!1096599))

(declare-fun m!1096601 () Bool)

(assert (=> b!1187773 m!1096601))

(declare-fun m!1096603 () Bool)

(assert (=> b!1187773 m!1096603))

(declare-fun m!1096605 () Bool)

(assert (=> b!1187773 m!1096605))

(declare-fun m!1096607 () Bool)

(assert (=> b!1187773 m!1096607))

(declare-fun m!1096609 () Bool)

(assert (=> b!1187763 m!1096609))

(declare-fun m!1096611 () Bool)

(assert (=> b!1187763 m!1096611))

(declare-fun m!1096613 () Bool)

(assert (=> b!1187759 m!1096613))

(declare-fun m!1096615 () Bool)

(assert (=> b!1187759 m!1096615))

(declare-fun m!1096617 () Bool)

(assert (=> b!1187759 m!1096617))

(declare-fun m!1096619 () Bool)

(assert (=> b!1187759 m!1096619))

(assert (=> b!1187759 m!1096613))

(declare-fun m!1096621 () Bool)

(assert (=> b!1187759 m!1096621))

(declare-fun m!1096623 () Bool)

(assert (=> b!1187759 m!1096623))

(assert (=> b!1187759 m!1096615))

(declare-fun m!1096625 () Bool)

(assert (=> b!1187759 m!1096625))

(declare-fun m!1096627 () Bool)

(assert (=> b!1187772 m!1096627))

(assert (=> b!1187776 m!1096615))

(declare-fun m!1096629 () Bool)

(assert (=> b!1187768 m!1096629))

(declare-fun m!1096631 () Bool)

(assert (=> b!1187768 m!1096631))

(declare-fun m!1096633 () Bool)

(assert (=> b!1187768 m!1096633))

(declare-fun m!1096635 () Bool)

(assert (=> b!1187768 m!1096635))

(declare-fun m!1096637 () Bool)

(assert (=> b!1187768 m!1096637))

(declare-fun m!1096639 () Bool)

(assert (=> b!1187771 m!1096639))

(declare-fun m!1096641 () Bool)

(assert (=> b!1187775 m!1096641))

(declare-fun m!1096643 () Bool)

(assert (=> b!1187775 m!1096643))

(declare-fun m!1096645 () Bool)

(assert (=> b!1187775 m!1096645))

(assert (=> b!1187775 m!1096615))

(declare-fun m!1096647 () Bool)

(assert (=> b!1187775 m!1096647))

(declare-fun m!1096649 () Bool)

(assert (=> b!1187775 m!1096649))

(assert (=> b!1187775 m!1096615))

(declare-fun m!1096651 () Bool)

(assert (=> b!1187767 m!1096651))

(declare-fun m!1096653 () Bool)

(assert (=> mapNonEmpty!46712 m!1096653))

(declare-fun m!1096655 () Bool)

(assert (=> b!1187766 m!1096655))

(check-sat (not b!1187773) (not b_lambda!20531) (not b_next!25393) (not b!1187775) tp_is_empty!29923 (not b!1187767) (not start!100050) (not b!1187768) (not b!1187759) (not b!1187766) (not b!1187774) (not b!1187770) b_and!41657 (not b!1187763) (not b!1187772) (not mapNonEmpty!46712) (not b!1187771) (not b!1187761))
(check-sat b_and!41657 (not b_next!25393))
