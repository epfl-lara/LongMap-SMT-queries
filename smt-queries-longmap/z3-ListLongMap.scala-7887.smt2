; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98302 () Bool)

(assert start!98302)

(declare-fun b_free!23767 () Bool)

(declare-fun b_next!23767 () Bool)

(assert (=> start!98302 (= b_free!23767 (not b_next!23767))))

(declare-fun tp!84005 () Bool)

(declare-fun b_and!38327 () Bool)

(assert (=> start!98302 (= tp!84005 b_and!38327)))

(declare-fun b!1127393 () Bool)

(declare-fun e!641825 () Bool)

(declare-datatypes ((V!42857 0))(
  ( (V!42858 (val!14205 Int)) )
))
(declare-datatypes ((tuple2!17870 0))(
  ( (tuple2!17871 (_1!8946 (_ BitVec 64)) (_2!8946 V!42857)) )
))
(declare-datatypes ((List!24659 0))(
  ( (Nil!24656) (Cons!24655 (h!25873 tuple2!17870) (t!35410 List!24659)) )
))
(declare-datatypes ((ListLongMap!15847 0))(
  ( (ListLongMap!15848 (toList!7939 List!24659)) )
))
(declare-fun call!47650 () ListLongMap!15847)

(declare-fun call!47651 () ListLongMap!15847)

(assert (=> b!1127393 (= e!641825 (= call!47650 call!47651))))

(declare-fun b!1127394 () Bool)

(declare-fun res!752980 () Bool)

(declare-fun e!641831 () Bool)

(assert (=> b!1127394 (=> (not res!752980) (not e!641831))))

(declare-datatypes ((array!73505 0))(
  ( (array!73506 (arr!35399 (Array (_ BitVec 32) (_ BitVec 64))) (size!35936 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73505)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13439 0))(
  ( (ValueCellFull!13439 (v!16834 V!42857)) (EmptyCell!13439) )
))
(declare-datatypes ((array!73507 0))(
  ( (array!73508 (arr!35400 (Array (_ BitVec 32) ValueCell!13439)) (size!35937 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73507)

(assert (=> b!1127394 (= res!752980 (and (= (size!35937 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35936 _keys!1208) (size!35937 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127395 () Bool)

(declare-fun res!752981 () Bool)

(declare-fun e!641826 () Bool)

(assert (=> b!1127395 (=> (not res!752981) (not e!641826))))

(declare-fun lt!500599 () array!73505)

(declare-datatypes ((List!24660 0))(
  ( (Nil!24657) (Cons!24656 (h!25874 (_ BitVec 64)) (t!35411 List!24660)) )
))
(declare-fun arrayNoDuplicates!0 (array!73505 (_ BitVec 32) List!24660) Bool)

(assert (=> b!1127395 (= res!752981 (arrayNoDuplicates!0 lt!500599 #b00000000000000000000000000000000 Nil!24657))))

(declare-fun b!1127396 () Bool)

(assert (=> b!1127396 (= e!641831 e!641826)))

(declare-fun res!752988 () Bool)

(assert (=> b!1127396 (=> (not res!752988) (not e!641826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73505 (_ BitVec 32)) Bool)

(assert (=> b!1127396 (= res!752988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500599 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127396 (= lt!500599 (array!73506 (store (arr!35399 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35936 _keys!1208)))))

(declare-fun b!1127398 () Bool)

(declare-fun res!752985 () Bool)

(assert (=> b!1127398 (=> (not res!752985) (not e!641831))))

(assert (=> b!1127398 (= res!752985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127399 () Bool)

(declare-fun e!641828 () Bool)

(declare-fun tp_is_empty!28297 () Bool)

(assert (=> b!1127399 (= e!641828 tp_is_empty!28297)))

(declare-fun b!1127400 () Bool)

(declare-fun res!752991 () Bool)

(assert (=> b!1127400 (=> (not res!752991) (not e!641831))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127400 (= res!752991 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!44263 () Bool)

(declare-fun mapRes!44263 () Bool)

(declare-fun tp!84004 () Bool)

(declare-fun e!641824 () Bool)

(assert (=> mapNonEmpty!44263 (= mapRes!44263 (and tp!84004 e!641824))))

(declare-fun mapRest!44263 () (Array (_ BitVec 32) ValueCell!13439))

(declare-fun mapValue!44263 () ValueCell!13439)

(declare-fun mapKey!44263 () (_ BitVec 32))

(assert (=> mapNonEmpty!44263 (= (arr!35400 _values!996) (store mapRest!44263 mapKey!44263 mapValue!44263))))

(declare-fun b!1127401 () Bool)

(declare-fun e!641823 () Bool)

(assert (=> b!1127401 (= e!641826 (not e!641823))))

(declare-fun res!752992 () Bool)

(assert (=> b!1127401 (=> res!752992 e!641823)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127401 (= res!752992 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127401 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36895 0))(
  ( (Unit!36896) )
))
(declare-fun lt!500605 () Unit!36895)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73505 (_ BitVec 64) (_ BitVec 32)) Unit!36895)

(assert (=> b!1127401 (= lt!500605 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127402 () Bool)

(declare-fun res!752982 () Bool)

(assert (=> b!1127402 (=> (not res!752982) (not e!641831))))

(assert (=> b!1127402 (= res!752982 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24657))))

(declare-fun mapIsEmpty!44263 () Bool)

(assert (=> mapIsEmpty!44263 mapRes!44263))

(declare-fun b!1127403 () Bool)

(declare-fun -!1118 (ListLongMap!15847 (_ BitVec 64)) ListLongMap!15847)

(assert (=> b!1127403 (= e!641825 (= call!47650 (-!1118 call!47651 k0!934)))))

(declare-fun b!1127404 () Bool)

(declare-fun e!641832 () Bool)

(assert (=> b!1127404 (= e!641832 (and e!641828 mapRes!44263))))

(declare-fun condMapEmpty!44263 () Bool)

(declare-fun mapDefault!44263 () ValueCell!13439)

(assert (=> b!1127404 (= condMapEmpty!44263 (= (arr!35400 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13439)) mapDefault!44263)))))

(declare-fun b!1127405 () Bool)

(declare-fun e!641830 () Bool)

(declare-fun e!641829 () Bool)

(assert (=> b!1127405 (= e!641830 e!641829)))

(declare-fun res!752990 () Bool)

(assert (=> b!1127405 (=> res!752990 e!641829)))

(assert (=> b!1127405 (= res!752990 (not (= (select (arr!35399 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127405 e!641825))

(declare-fun c!110051 () Bool)

(assert (=> b!1127405 (= c!110051 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42857)

(declare-fun lt!500603 () Unit!36895)

(declare-fun zeroValue!944 () V!42857)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!381 (array!73505 array!73507 (_ BitVec 32) (_ BitVec 32) V!42857 V!42857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36895)

(assert (=> b!1127405 (= lt!500603 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47647 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4464 (array!73505 array!73507 (_ BitVec 32) (_ BitVec 32) V!42857 V!42857 (_ BitVec 32) Int) ListLongMap!15847)

(assert (=> bm!47647 (= call!47651 (getCurrentListMapNoExtraKeys!4464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127406 () Bool)

(declare-fun res!752989 () Bool)

(assert (=> b!1127406 (=> (not res!752989) (not e!641831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127406 (= res!752989 (validMask!0 mask!1564))))

(declare-fun res!752987 () Bool)

(assert (=> start!98302 (=> (not res!752987) (not e!641831))))

(assert (=> start!98302 (= res!752987 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35936 _keys!1208))))))

(assert (=> start!98302 e!641831))

(assert (=> start!98302 tp_is_empty!28297))

(declare-fun array_inv!27226 (array!73505) Bool)

(assert (=> start!98302 (array_inv!27226 _keys!1208)))

(assert (=> start!98302 true))

(assert (=> start!98302 tp!84005))

(declare-fun array_inv!27227 (array!73507) Bool)

(assert (=> start!98302 (and (array_inv!27227 _values!996) e!641832)))

(declare-fun b!1127397 () Bool)

(assert (=> b!1127397 (= e!641829 true)))

(declare-fun lt!500600 () Bool)

(declare-fun contains!6489 (ListLongMap!15847 (_ BitVec 64)) Bool)

(assert (=> b!1127397 (= lt!500600 (contains!6489 (getCurrentListMapNoExtraKeys!4464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127407 () Bool)

(assert (=> b!1127407 (= e!641823 e!641830)))

(declare-fun res!752986 () Bool)

(assert (=> b!1127407 (=> res!752986 e!641830)))

(assert (=> b!1127407 (= res!752986 (not (= from!1455 i!673)))))

(declare-fun lt!500601 () ListLongMap!15847)

(declare-fun lt!500602 () array!73507)

(assert (=> b!1127407 (= lt!500601 (getCurrentListMapNoExtraKeys!4464 lt!500599 lt!500602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2536 (Int (_ BitVec 64)) V!42857)

(assert (=> b!1127407 (= lt!500602 (array!73508 (store (arr!35400 _values!996) i!673 (ValueCellFull!13439 (dynLambda!2536 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35937 _values!996)))))

(declare-fun lt!500604 () ListLongMap!15847)

(assert (=> b!1127407 (= lt!500604 (getCurrentListMapNoExtraKeys!4464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127408 () Bool)

(assert (=> b!1127408 (= e!641824 tp_is_empty!28297)))

(declare-fun b!1127409 () Bool)

(declare-fun res!752984 () Bool)

(assert (=> b!1127409 (=> (not res!752984) (not e!641831))))

(assert (=> b!1127409 (= res!752984 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35936 _keys!1208))))))

(declare-fun bm!47648 () Bool)

(assert (=> bm!47648 (= call!47650 (getCurrentListMapNoExtraKeys!4464 lt!500599 lt!500602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127410 () Bool)

(declare-fun res!752983 () Bool)

(assert (=> b!1127410 (=> (not res!752983) (not e!641831))))

(assert (=> b!1127410 (= res!752983 (= (select (arr!35399 _keys!1208) i!673) k0!934))))

(assert (= (and start!98302 res!752987) b!1127406))

(assert (= (and b!1127406 res!752989) b!1127394))

(assert (= (and b!1127394 res!752980) b!1127398))

(assert (= (and b!1127398 res!752985) b!1127402))

(assert (= (and b!1127402 res!752982) b!1127409))

(assert (= (and b!1127409 res!752984) b!1127400))

(assert (= (and b!1127400 res!752991) b!1127410))

(assert (= (and b!1127410 res!752983) b!1127396))

(assert (= (and b!1127396 res!752988) b!1127395))

(assert (= (and b!1127395 res!752981) b!1127401))

(assert (= (and b!1127401 (not res!752992)) b!1127407))

(assert (= (and b!1127407 (not res!752986)) b!1127405))

(assert (= (and b!1127405 c!110051) b!1127403))

(assert (= (and b!1127405 (not c!110051)) b!1127393))

(assert (= (or b!1127403 b!1127393) bm!47648))

(assert (= (or b!1127403 b!1127393) bm!47647))

(assert (= (and b!1127405 (not res!752990)) b!1127397))

(assert (= (and b!1127404 condMapEmpty!44263) mapIsEmpty!44263))

(assert (= (and b!1127404 (not condMapEmpty!44263)) mapNonEmpty!44263))

(get-info :version)

(assert (= (and mapNonEmpty!44263 ((_ is ValueCellFull!13439) mapValue!44263)) b!1127408))

(assert (= (and b!1127404 ((_ is ValueCellFull!13439) mapDefault!44263)) b!1127399))

(assert (= start!98302 b!1127404))

(declare-fun b_lambda!18747 () Bool)

(assert (=> (not b_lambda!18747) (not b!1127407)))

(declare-fun t!35409 () Bool)

(declare-fun tb!8571 () Bool)

(assert (=> (and start!98302 (= defaultEntry!1004 defaultEntry!1004) t!35409) tb!8571))

(declare-fun result!17711 () Bool)

(assert (=> tb!8571 (= result!17711 tp_is_empty!28297)))

(assert (=> b!1127407 t!35409))

(declare-fun b_and!38329 () Bool)

(assert (= b_and!38327 (and (=> t!35409 result!17711) b_and!38329)))

(declare-fun m!1041767 () Bool)

(assert (=> b!1127410 m!1041767))

(declare-fun m!1041769 () Bool)

(assert (=> start!98302 m!1041769))

(declare-fun m!1041771 () Bool)

(assert (=> start!98302 m!1041771))

(declare-fun m!1041773 () Bool)

(assert (=> b!1127397 m!1041773))

(assert (=> b!1127397 m!1041773))

(declare-fun m!1041775 () Bool)

(assert (=> b!1127397 m!1041775))

(declare-fun m!1041777 () Bool)

(assert (=> b!1127401 m!1041777))

(declare-fun m!1041779 () Bool)

(assert (=> b!1127401 m!1041779))

(declare-fun m!1041781 () Bool)

(assert (=> b!1127405 m!1041781))

(declare-fun m!1041783 () Bool)

(assert (=> b!1127405 m!1041783))

(declare-fun m!1041785 () Bool)

(assert (=> b!1127402 m!1041785))

(declare-fun m!1041787 () Bool)

(assert (=> b!1127395 m!1041787))

(declare-fun m!1041789 () Bool)

(assert (=> b!1127406 m!1041789))

(declare-fun m!1041791 () Bool)

(assert (=> b!1127407 m!1041791))

(declare-fun m!1041793 () Bool)

(assert (=> b!1127407 m!1041793))

(declare-fun m!1041795 () Bool)

(assert (=> b!1127407 m!1041795))

(declare-fun m!1041797 () Bool)

(assert (=> b!1127407 m!1041797))

(assert (=> bm!47647 m!1041773))

(declare-fun m!1041799 () Bool)

(assert (=> mapNonEmpty!44263 m!1041799))

(declare-fun m!1041801 () Bool)

(assert (=> b!1127398 m!1041801))

(declare-fun m!1041803 () Bool)

(assert (=> b!1127400 m!1041803))

(declare-fun m!1041805 () Bool)

(assert (=> b!1127396 m!1041805))

(declare-fun m!1041807 () Bool)

(assert (=> b!1127396 m!1041807))

(declare-fun m!1041809 () Bool)

(assert (=> b!1127403 m!1041809))

(declare-fun m!1041811 () Bool)

(assert (=> bm!47648 m!1041811))

(check-sat b_and!38329 tp_is_empty!28297 (not b!1127395) (not mapNonEmpty!44263) (not b!1127396) (not b!1127402) (not bm!47647) (not b!1127405) (not b!1127407) (not b!1127403) (not start!98302) (not b!1127397) (not b!1127401) (not b!1127398) (not bm!47648) (not b_lambda!18747) (not b_next!23767) (not b!1127406) (not b!1127400))
(check-sat b_and!38329 (not b_next!23767))
