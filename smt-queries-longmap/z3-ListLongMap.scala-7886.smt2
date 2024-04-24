; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98296 () Bool)

(assert start!98296)

(declare-fun b_free!23761 () Bool)

(declare-fun b_next!23761 () Bool)

(assert (=> start!98296 (= b_free!23761 (not b_next!23761))))

(declare-fun tp!83987 () Bool)

(declare-fun b_and!38315 () Bool)

(assert (=> start!98296 (= tp!83987 b_and!38315)))

(declare-datatypes ((V!42849 0))(
  ( (V!42850 (val!14202 Int)) )
))
(declare-fun zeroValue!944 () V!42849)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!47629 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13436 0))(
  ( (ValueCellFull!13436 (v!16831 V!42849)) (EmptyCell!13436) )
))
(declare-datatypes ((array!73493 0))(
  ( (array!73494 (arr!35393 (Array (_ BitVec 32) ValueCell!13436)) (size!35930 (_ BitVec 32))) )
))
(declare-fun lt!500542 () array!73493)

(declare-datatypes ((tuple2!17864 0))(
  ( (tuple2!17865 (_1!8943 (_ BitVec 64)) (_2!8943 V!42849)) )
))
(declare-datatypes ((List!24654 0))(
  ( (Nil!24651) (Cons!24650 (h!25868 tuple2!17864) (t!35399 List!24654)) )
))
(declare-datatypes ((ListLongMap!15841 0))(
  ( (ListLongMap!15842 (toList!7936 List!24654)) )
))
(declare-fun call!47632 () ListLongMap!15841)

(declare-fun minValue!944 () V!42849)

(declare-datatypes ((array!73495 0))(
  ( (array!73496 (arr!35394 (Array (_ BitVec 32) (_ BitVec 64))) (size!35931 (_ BitVec 32))) )
))
(declare-fun lt!500541 () array!73495)

(declare-fun getCurrentListMapNoExtraKeys!4461 (array!73495 array!73493 (_ BitVec 32) (_ BitVec 32) V!42849 V!42849 (_ BitVec 32) Int) ListLongMap!15841)

(assert (=> bm!47629 (= call!47632 (getCurrentListMapNoExtraKeys!4461 lt!500541 lt!500542 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127226 () Bool)

(declare-fun e!641737 () Bool)

(declare-fun tp_is_empty!28291 () Bool)

(assert (=> b!1127226 (= e!641737 tp_is_empty!28291)))

(declare-fun b!1127227 () Bool)

(declare-fun res!752866 () Bool)

(declare-fun e!641742 () Bool)

(assert (=> b!1127227 (=> (not res!752866) (not e!641742))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73495)

(assert (=> b!1127227 (= res!752866 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35931 _keys!1208))))))

(declare-fun b!1127228 () Bool)

(declare-fun e!641740 () Bool)

(declare-fun e!641735 () Bool)

(assert (=> b!1127228 (= e!641740 e!641735)))

(declare-fun res!752874 () Bool)

(assert (=> b!1127228 (=> res!752874 e!641735)))

(assert (=> b!1127228 (= res!752874 (not (= from!1455 i!673)))))

(declare-fun lt!500537 () ListLongMap!15841)

(assert (=> b!1127228 (= lt!500537 (getCurrentListMapNoExtraKeys!4461 lt!500541 lt!500542 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73493)

(declare-fun dynLambda!2535 (Int (_ BitVec 64)) V!42849)

(assert (=> b!1127228 (= lt!500542 (array!73494 (store (arr!35393 _values!996) i!673 (ValueCellFull!13436 (dynLambda!2535 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35930 _values!996)))))

(declare-fun lt!500538 () ListLongMap!15841)

(assert (=> b!1127228 (= lt!500538 (getCurrentListMapNoExtraKeys!4461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127229 () Bool)

(declare-fun e!641733 () Bool)

(assert (=> b!1127229 (= e!641735 e!641733)))

(declare-fun res!752872 () Bool)

(assert (=> b!1127229 (=> res!752872 e!641733)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1127229 (= res!752872 (not (= (select (arr!35394 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641736 () Bool)

(assert (=> b!1127229 e!641736))

(declare-fun c!110042 () Bool)

(assert (=> b!1127229 (= c!110042 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36891 0))(
  ( (Unit!36892) )
))
(declare-fun lt!500539 () Unit!36891)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!379 (array!73495 array!73493 (_ BitVec 32) (_ BitVec 32) V!42849 V!42849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36891)

(assert (=> b!1127229 (= lt!500539 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127230 () Bool)

(declare-fun res!752873 () Bool)

(assert (=> b!1127230 (=> (not res!752873) (not e!641742))))

(assert (=> b!1127230 (= res!752873 (= (select (arr!35394 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!44254 () Bool)

(declare-fun mapRes!44254 () Bool)

(declare-fun tp!83986 () Bool)

(assert (=> mapNonEmpty!44254 (= mapRes!44254 (and tp!83986 e!641737))))

(declare-fun mapRest!44254 () (Array (_ BitVec 32) ValueCell!13436))

(declare-fun mapKey!44254 () (_ BitVec 32))

(declare-fun mapValue!44254 () ValueCell!13436)

(assert (=> mapNonEmpty!44254 (= (arr!35393 _values!996) (store mapRest!44254 mapKey!44254 mapValue!44254))))

(declare-fun call!47633 () ListLongMap!15841)

(declare-fun b!1127231 () Bool)

(declare-fun -!1116 (ListLongMap!15841 (_ BitVec 64)) ListLongMap!15841)

(assert (=> b!1127231 (= e!641736 (= call!47632 (-!1116 call!47633 k0!934)))))

(declare-fun res!752875 () Bool)

(assert (=> start!98296 (=> (not res!752875) (not e!641742))))

(assert (=> start!98296 (= res!752875 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35931 _keys!1208))))))

(assert (=> start!98296 e!641742))

(assert (=> start!98296 tp_is_empty!28291))

(declare-fun array_inv!27222 (array!73495) Bool)

(assert (=> start!98296 (array_inv!27222 _keys!1208)))

(assert (=> start!98296 true))

(assert (=> start!98296 tp!83987))

(declare-fun e!641739 () Bool)

(declare-fun array_inv!27223 (array!73493) Bool)

(assert (=> start!98296 (and (array_inv!27223 _values!996) e!641739)))

(declare-fun b!1127225 () Bool)

(declare-fun res!752865 () Bool)

(declare-fun e!641741 () Bool)

(assert (=> b!1127225 (=> (not res!752865) (not e!641741))))

(declare-datatypes ((List!24655 0))(
  ( (Nil!24652) (Cons!24651 (h!25869 (_ BitVec 64)) (t!35400 List!24655)) )
))
(declare-fun arrayNoDuplicates!0 (array!73495 (_ BitVec 32) List!24655) Bool)

(assert (=> b!1127225 (= res!752865 (arrayNoDuplicates!0 lt!500541 #b00000000000000000000000000000000 Nil!24652))))

(declare-fun bm!47630 () Bool)

(assert (=> bm!47630 (= call!47633 (getCurrentListMapNoExtraKeys!4461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127232 () Bool)

(declare-fun res!752869 () Bool)

(assert (=> b!1127232 (=> (not res!752869) (not e!641742))))

(assert (=> b!1127232 (= res!752869 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24652))))

(declare-fun b!1127233 () Bool)

(declare-fun e!641734 () Bool)

(assert (=> b!1127233 (= e!641739 (and e!641734 mapRes!44254))))

(declare-fun condMapEmpty!44254 () Bool)

(declare-fun mapDefault!44254 () ValueCell!13436)

(assert (=> b!1127233 (= condMapEmpty!44254 (= (arr!35393 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13436)) mapDefault!44254)))))

(declare-fun b!1127234 () Bool)

(assert (=> b!1127234 (= e!641733 true)))

(declare-fun lt!500536 () Bool)

(declare-fun contains!6486 (ListLongMap!15841 (_ BitVec 64)) Bool)

(assert (=> b!1127234 (= lt!500536 (contains!6486 (getCurrentListMapNoExtraKeys!4461 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127235 () Bool)

(declare-fun res!752868 () Bool)

(assert (=> b!1127235 (=> (not res!752868) (not e!641742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73495 (_ BitVec 32)) Bool)

(assert (=> b!1127235 (= res!752868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127236 () Bool)

(assert (=> b!1127236 (= e!641742 e!641741)))

(declare-fun res!752863 () Bool)

(assert (=> b!1127236 (=> (not res!752863) (not e!641741))))

(assert (=> b!1127236 (= res!752863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500541 mask!1564))))

(assert (=> b!1127236 (= lt!500541 (array!73496 (store (arr!35394 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35931 _keys!1208)))))

(declare-fun mapIsEmpty!44254 () Bool)

(assert (=> mapIsEmpty!44254 mapRes!44254))

(declare-fun b!1127237 () Bool)

(declare-fun res!752867 () Bool)

(assert (=> b!1127237 (=> (not res!752867) (not e!641742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127237 (= res!752867 (validMask!0 mask!1564))))

(declare-fun b!1127238 () Bool)

(assert (=> b!1127238 (= e!641736 (= call!47632 call!47633))))

(declare-fun b!1127239 () Bool)

(assert (=> b!1127239 (= e!641741 (not e!641740))))

(declare-fun res!752870 () Bool)

(assert (=> b!1127239 (=> res!752870 e!641740)))

(assert (=> b!1127239 (= res!752870 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127239 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500540 () Unit!36891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73495 (_ BitVec 64) (_ BitVec 32)) Unit!36891)

(assert (=> b!1127239 (= lt!500540 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127240 () Bool)

(declare-fun res!752871 () Bool)

(assert (=> b!1127240 (=> (not res!752871) (not e!641742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127240 (= res!752871 (validKeyInArray!0 k0!934))))

(declare-fun b!1127241 () Bool)

(declare-fun res!752864 () Bool)

(assert (=> b!1127241 (=> (not res!752864) (not e!641742))))

(assert (=> b!1127241 (= res!752864 (and (= (size!35930 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35931 _keys!1208) (size!35930 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127242 () Bool)

(assert (=> b!1127242 (= e!641734 tp_is_empty!28291)))

(assert (= (and start!98296 res!752875) b!1127237))

(assert (= (and b!1127237 res!752867) b!1127241))

(assert (= (and b!1127241 res!752864) b!1127235))

(assert (= (and b!1127235 res!752868) b!1127232))

(assert (= (and b!1127232 res!752869) b!1127227))

(assert (= (and b!1127227 res!752866) b!1127240))

(assert (= (and b!1127240 res!752871) b!1127230))

(assert (= (and b!1127230 res!752873) b!1127236))

(assert (= (and b!1127236 res!752863) b!1127225))

(assert (= (and b!1127225 res!752865) b!1127239))

(assert (= (and b!1127239 (not res!752870)) b!1127228))

(assert (= (and b!1127228 (not res!752874)) b!1127229))

(assert (= (and b!1127229 c!110042) b!1127231))

(assert (= (and b!1127229 (not c!110042)) b!1127238))

(assert (= (or b!1127231 b!1127238) bm!47630))

(assert (= (or b!1127231 b!1127238) bm!47629))

(assert (= (and b!1127229 (not res!752872)) b!1127234))

(assert (= (and b!1127233 condMapEmpty!44254) mapIsEmpty!44254))

(assert (= (and b!1127233 (not condMapEmpty!44254)) mapNonEmpty!44254))

(get-info :version)

(assert (= (and mapNonEmpty!44254 ((_ is ValueCellFull!13436) mapValue!44254)) b!1127226))

(assert (= (and b!1127233 ((_ is ValueCellFull!13436) mapDefault!44254)) b!1127242))

(assert (= start!98296 b!1127233))

(declare-fun b_lambda!18741 () Bool)

(assert (=> (not b_lambda!18741) (not b!1127228)))

(declare-fun t!35398 () Bool)

(declare-fun tb!8565 () Bool)

(assert (=> (and start!98296 (= defaultEntry!1004 defaultEntry!1004) t!35398) tb!8565))

(declare-fun result!17699 () Bool)

(assert (=> tb!8565 (= result!17699 tp_is_empty!28291)))

(assert (=> b!1127228 t!35398))

(declare-fun b_and!38317 () Bool)

(assert (= b_and!38315 (and (=> t!35398 result!17699) b_and!38317)))

(declare-fun m!1041629 () Bool)

(assert (=> mapNonEmpty!44254 m!1041629))

(declare-fun m!1041631 () Bool)

(assert (=> b!1127236 m!1041631))

(declare-fun m!1041633 () Bool)

(assert (=> b!1127236 m!1041633))

(declare-fun m!1041635 () Bool)

(assert (=> start!98296 m!1041635))

(declare-fun m!1041637 () Bool)

(assert (=> start!98296 m!1041637))

(declare-fun m!1041639 () Bool)

(assert (=> b!1127234 m!1041639))

(assert (=> b!1127234 m!1041639))

(declare-fun m!1041641 () Bool)

(assert (=> b!1127234 m!1041641))

(declare-fun m!1041643 () Bool)

(assert (=> b!1127230 m!1041643))

(declare-fun m!1041645 () Bool)

(assert (=> b!1127239 m!1041645))

(declare-fun m!1041647 () Bool)

(assert (=> b!1127239 m!1041647))

(declare-fun m!1041649 () Bool)

(assert (=> b!1127225 m!1041649))

(assert (=> bm!47630 m!1041639))

(declare-fun m!1041651 () Bool)

(assert (=> b!1127237 m!1041651))

(declare-fun m!1041653 () Bool)

(assert (=> b!1127231 m!1041653))

(declare-fun m!1041655 () Bool)

(assert (=> b!1127228 m!1041655))

(declare-fun m!1041657 () Bool)

(assert (=> b!1127228 m!1041657))

(declare-fun m!1041659 () Bool)

(assert (=> b!1127228 m!1041659))

(declare-fun m!1041661 () Bool)

(assert (=> b!1127228 m!1041661))

(declare-fun m!1041663 () Bool)

(assert (=> b!1127229 m!1041663))

(declare-fun m!1041665 () Bool)

(assert (=> b!1127229 m!1041665))

(declare-fun m!1041667 () Bool)

(assert (=> b!1127232 m!1041667))

(declare-fun m!1041669 () Bool)

(assert (=> bm!47629 m!1041669))

(declare-fun m!1041671 () Bool)

(assert (=> b!1127240 m!1041671))

(declare-fun m!1041673 () Bool)

(assert (=> b!1127235 m!1041673))

(check-sat (not b!1127225) (not b_lambda!18741) (not b!1127232) (not b!1127237) (not mapNonEmpty!44254) (not b!1127234) tp_is_empty!28291 (not b!1127239) (not b!1127240) (not b_next!23761) (not start!98296) b_and!38317 (not bm!47629) (not b!1127235) (not b!1127229) (not b!1127228) (not b!1127236) (not bm!47630) (not b!1127231))
(check-sat b_and!38317 (not b_next!23761))
