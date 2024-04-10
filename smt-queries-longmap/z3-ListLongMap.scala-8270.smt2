; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100570 () Bool)

(assert start!100570)

(declare-fun b_free!25893 () Bool)

(declare-fun b_next!25893 () Bool)

(assert (=> start!100570 (= b_free!25893 (not b_next!25893))))

(declare-fun tp!90669 () Bool)

(declare-fun b_and!42673 () Bool)

(assert (=> start!100570 (= tp!90669 b_and!42673)))

(declare-fun mapNonEmpty!47738 () Bool)

(declare-fun mapRes!47738 () Bool)

(declare-fun tp!90668 () Bool)

(declare-fun e!683100 () Bool)

(assert (=> mapNonEmpty!47738 (= mapRes!47738 (and tp!90668 e!683100))))

(declare-fun mapKey!47738 () (_ BitVec 32))

(declare-datatypes ((V!45923 0))(
  ( (V!45924 (val!15355 Int)) )
))
(declare-datatypes ((ValueCell!14589 0))(
  ( (ValueCellFull!14589 (v!17993 V!45923)) (EmptyCell!14589) )
))
(declare-fun mapRest!47738 () (Array (_ BitVec 32) ValueCell!14589))

(declare-fun mapValue!47738 () ValueCell!14589)

(declare-datatypes ((array!77967 0))(
  ( (array!77968 (arr!37628 (Array (_ BitVec 32) ValueCell!14589)) (size!38164 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77967)

(assert (=> mapNonEmpty!47738 (= (arr!37628 _values!996) (store mapRest!47738 mapKey!47738 mapValue!47738))))

(declare-fun zeroValue!944 () V!45923)

(declare-datatypes ((tuple2!19682 0))(
  ( (tuple2!19683 (_1!9852 (_ BitVec 64)) (_2!9852 V!45923)) )
))
(declare-datatypes ((List!26492 0))(
  ( (Nil!26489) (Cons!26488 (h!27697 tuple2!19682) (t!39365 List!26492)) )
))
(declare-datatypes ((ListLongMap!17651 0))(
  ( (ListLongMap!17652 (toList!8841 List!26492)) )
))
(declare-fun lt!545296 () ListLongMap!17651)

(declare-fun c!117758 () Bool)

(declare-fun bm!57913 () Bool)

(declare-fun call!57918 () ListLongMap!17651)

(declare-fun c!117756 () Bool)

(declare-fun minValue!944 () V!45923)

(declare-fun +!3967 (ListLongMap!17651 tuple2!19682) ListLongMap!17651)

(assert (=> bm!57913 (= call!57918 (+!3967 lt!545296 (ite (or c!117756 c!117758) (tuple2!19683 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1202985 () Bool)

(declare-fun e!683106 () Bool)

(declare-fun e!683109 () Bool)

(assert (=> b!1202985 (= e!683106 (and e!683109 mapRes!47738))))

(declare-fun condMapEmpty!47738 () Bool)

(declare-fun mapDefault!47738 () ValueCell!14589)

(assert (=> b!1202985 (= condMapEmpty!47738 (= (arr!37628 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14589)) mapDefault!47738)))))

(declare-datatypes ((array!77969 0))(
  ( (array!77970 (arr!37629 (Array (_ BitVec 32) (_ BitVec 64))) (size!38165 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57914 () Bool)

(declare-fun call!57923 () ListLongMap!17651)

(declare-fun getCurrentListMapNoExtraKeys!5277 (array!77969 array!77967 (_ BitVec 32) (_ BitVec 32) V!45923 V!45923 (_ BitVec 32) Int) ListLongMap!17651)

(assert (=> bm!57914 (= call!57923 (getCurrentListMapNoExtraKeys!5277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202986 () Bool)

(declare-fun e!683103 () Bool)

(declare-fun e!683112 () Bool)

(assert (=> b!1202986 (= e!683103 (not e!683112))))

(declare-fun res!800617 () Bool)

(assert (=> b!1202986 (=> res!800617 e!683112)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202986 (= res!800617 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202986 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39880 0))(
  ( (Unit!39881) )
))
(declare-fun lt!545298 () Unit!39880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77969 (_ BitVec 64) (_ BitVec 32)) Unit!39880)

(assert (=> b!1202986 (= lt!545298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202987 () Bool)

(declare-fun call!57920 () ListLongMap!17651)

(declare-fun e!683104 () Bool)

(declare-fun -!1808 (ListLongMap!17651 (_ BitVec 64)) ListLongMap!17651)

(assert (=> b!1202987 (= e!683104 (= call!57920 (-!1808 call!57923 k0!934)))))

(declare-fun b!1202988 () Bool)

(declare-fun e!683113 () Unit!39880)

(declare-fun Unit!39882 () Unit!39880)

(assert (=> b!1202988 (= e!683113 Unit!39882)))

(declare-fun res!800620 () Bool)

(declare-fun e!683111 () Bool)

(assert (=> start!100570 (=> (not res!800620) (not e!683111))))

(assert (=> start!100570 (= res!800620 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38165 _keys!1208))))))

(assert (=> start!100570 e!683111))

(declare-fun tp_is_empty!30597 () Bool)

(assert (=> start!100570 tp_is_empty!30597))

(declare-fun array_inv!28668 (array!77969) Bool)

(assert (=> start!100570 (array_inv!28668 _keys!1208)))

(assert (=> start!100570 true))

(assert (=> start!100570 tp!90669))

(declare-fun array_inv!28669 (array!77967) Bool)

(assert (=> start!100570 (and (array_inv!28669 _values!996) e!683106)))

(declare-fun b!1202989 () Bool)

(assert (=> b!1202989 (= e!683109 tp_is_empty!30597)))

(declare-fun b!1202990 () Bool)

(declare-fun e!683110 () Bool)

(declare-fun e!683108 () Bool)

(assert (=> b!1202990 (= e!683110 e!683108)))

(declare-fun res!800615 () Bool)

(assert (=> b!1202990 (=> res!800615 e!683108)))

(assert (=> b!1202990 (= res!800615 (not (= (select (arr!37629 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202990 e!683104))

(declare-fun c!117755 () Bool)

(assert (=> b!1202990 (= c!117755 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545301 () Unit!39880)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1013 (array!77969 array!77967 (_ BitVec 32) (_ BitVec 32) V!45923 V!45923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39880)

(assert (=> b!1202990 (= lt!545301 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202991 () Bool)

(declare-fun res!800626 () Bool)

(assert (=> b!1202991 (=> (not res!800626) (not e!683111))))

(assert (=> b!1202991 (= res!800626 (and (= (size!38164 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38165 _keys!1208) (size!38164 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57915 () Bool)

(declare-fun call!57922 () Bool)

(declare-fun call!57916 () Bool)

(assert (=> bm!57915 (= call!57922 call!57916)))

(declare-fun lt!545304 () array!77969)

(declare-fun bm!57916 () Bool)

(declare-fun lt!545299 () array!77967)

(assert (=> bm!57916 (= call!57920 (getCurrentListMapNoExtraKeys!5277 lt!545304 lt!545299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!545306 () ListLongMap!17651)

(declare-fun bm!57917 () Bool)

(declare-fun call!57919 () ListLongMap!17651)

(declare-fun contains!6895 (ListLongMap!17651 (_ BitVec 64)) Bool)

(assert (=> bm!57917 (= call!57916 (contains!6895 (ite c!117756 lt!545306 call!57919) k0!934))))

(declare-fun b!1202992 () Bool)

(assert (=> b!1202992 (= e!683104 (= call!57920 call!57923))))

(declare-fun b!1202993 () Bool)

(assert (=> b!1202993 (= e!683112 e!683110)))

(declare-fun res!800628 () Bool)

(assert (=> b!1202993 (=> res!800628 e!683110)))

(assert (=> b!1202993 (= res!800628 (not (= from!1455 i!673)))))

(declare-fun lt!545297 () ListLongMap!17651)

(assert (=> b!1202993 (= lt!545297 (getCurrentListMapNoExtraKeys!5277 lt!545304 lt!545299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3189 (Int (_ BitVec 64)) V!45923)

(assert (=> b!1202993 (= lt!545299 (array!77968 (store (arr!37628 _values!996) i!673 (ValueCellFull!14589 (dynLambda!3189 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38164 _values!996)))))

(declare-fun lt!545300 () ListLongMap!17651)

(assert (=> b!1202993 (= lt!545300 (getCurrentListMapNoExtraKeys!5277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202994 () Bool)

(declare-fun res!800619 () Bool)

(assert (=> b!1202994 (=> (not res!800619) (not e!683111))))

(assert (=> b!1202994 (= res!800619 (= (select (arr!37629 _keys!1208) i!673) k0!934))))

(declare-fun b!1202995 () Bool)

(declare-fun lt!545308 () Unit!39880)

(assert (=> b!1202995 (= e!683113 lt!545308)))

(declare-fun call!57921 () Unit!39880)

(assert (=> b!1202995 (= lt!545308 call!57921)))

(assert (=> b!1202995 call!57922))

(declare-fun b!1202996 () Bool)

(declare-fun res!800622 () Bool)

(assert (=> b!1202996 (=> (not res!800622) (not e!683111))))

(declare-datatypes ((List!26493 0))(
  ( (Nil!26490) (Cons!26489 (h!27698 (_ BitVec 64)) (t!39366 List!26493)) )
))
(declare-fun arrayNoDuplicates!0 (array!77969 (_ BitVec 32) List!26493) Bool)

(assert (=> b!1202996 (= res!800622 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26490))))

(declare-fun b!1202997 () Bool)

(assert (=> b!1202997 (= e!683100 tp_is_empty!30597)))

(declare-fun b!1202998 () Bool)

(declare-fun res!800623 () Bool)

(assert (=> b!1202998 (=> (not res!800623) (not e!683111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77969 (_ BitVec 32)) Bool)

(assert (=> b!1202998 (= res!800623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202999 () Bool)

(assert (=> b!1202999 (= e!683111 e!683103)))

(declare-fun res!800618 () Bool)

(assert (=> b!1202999 (=> (not res!800618) (not e!683103))))

(assert (=> b!1202999 (= res!800618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545304 mask!1564))))

(assert (=> b!1202999 (= lt!545304 (array!77970 (store (arr!37629 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38165 _keys!1208)))))

(declare-fun mapIsEmpty!47738 () Bool)

(assert (=> mapIsEmpty!47738 mapRes!47738))

(declare-fun bm!57918 () Bool)

(declare-fun call!57917 () Unit!39880)

(assert (=> bm!57918 (= call!57921 call!57917)))

(declare-fun b!1203000 () Bool)

(declare-fun e!683105 () Unit!39880)

(declare-fun lt!545305 () Unit!39880)

(assert (=> b!1203000 (= e!683105 lt!545305)))

(declare-fun lt!545307 () Unit!39880)

(assert (=> b!1203000 (= lt!545307 call!57917)))

(assert (=> b!1203000 (= lt!545306 call!57918)))

(assert (=> b!1203000 call!57916))

(declare-fun addStillContains!996 (ListLongMap!17651 (_ BitVec 64) V!45923 (_ BitVec 64)) Unit!39880)

(assert (=> b!1203000 (= lt!545305 (addStillContains!996 lt!545306 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1203000 (contains!6895 (+!3967 lt!545306 (tuple2!19683 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1203001 () Bool)

(declare-fun res!800625 () Bool)

(assert (=> b!1203001 (=> (not res!800625) (not e!683103))))

(assert (=> b!1203001 (= res!800625 (arrayNoDuplicates!0 lt!545304 #b00000000000000000000000000000000 Nil!26490))))

(declare-fun bm!57919 () Bool)

(assert (=> bm!57919 (= call!57917 (addStillContains!996 lt!545296 (ite (or c!117756 c!117758) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117756 c!117758) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1203002 () Bool)

(declare-fun res!800621 () Bool)

(assert (=> b!1203002 (=> (not res!800621) (not e!683111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203002 (= res!800621 (validMask!0 mask!1564))))

(declare-fun bm!57920 () Bool)

(assert (=> bm!57920 (= call!57919 call!57918)))

(declare-fun b!1203003 () Bool)

(declare-fun e!683107 () Unit!39880)

(assert (=> b!1203003 (= e!683105 e!683107)))

(declare-fun lt!545302 () Bool)

(assert (=> b!1203003 (= c!117758 (and (not lt!545302) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203004 () Bool)

(declare-fun c!117757 () Bool)

(assert (=> b!1203004 (= c!117757 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545302))))

(assert (=> b!1203004 (= e!683107 e!683113)))

(declare-fun b!1203005 () Bool)

(declare-fun e!683101 () Bool)

(assert (=> b!1203005 (= e!683108 e!683101)))

(declare-fun res!800616 () Bool)

(assert (=> b!1203005 (=> res!800616 e!683101)))

(assert (=> b!1203005 (= res!800616 (not (contains!6895 lt!545296 k0!934)))))

(assert (=> b!1203005 (= lt!545296 (getCurrentListMapNoExtraKeys!5277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203006 () Bool)

(declare-fun res!800624 () Bool)

(assert (=> b!1203006 (=> (not res!800624) (not e!683111))))

(assert (=> b!1203006 (= res!800624 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38165 _keys!1208))))))

(declare-fun b!1203007 () Bool)

(assert (=> b!1203007 (= e!683101 true)))

(declare-fun lt!545303 () Unit!39880)

(assert (=> b!1203007 (= lt!545303 e!683105)))

(assert (=> b!1203007 (= c!117756 (and (not lt!545302) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203007 (= lt!545302 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203008 () Bool)

(assert (=> b!1203008 call!57922))

(declare-fun lt!545295 () Unit!39880)

(assert (=> b!1203008 (= lt!545295 call!57921)))

(assert (=> b!1203008 (= e!683107 lt!545295)))

(declare-fun b!1203009 () Bool)

(declare-fun res!800627 () Bool)

(assert (=> b!1203009 (=> (not res!800627) (not e!683111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203009 (= res!800627 (validKeyInArray!0 k0!934))))

(assert (= (and start!100570 res!800620) b!1203002))

(assert (= (and b!1203002 res!800621) b!1202991))

(assert (= (and b!1202991 res!800626) b!1202998))

(assert (= (and b!1202998 res!800623) b!1202996))

(assert (= (and b!1202996 res!800622) b!1203006))

(assert (= (and b!1203006 res!800624) b!1203009))

(assert (= (and b!1203009 res!800627) b!1202994))

(assert (= (and b!1202994 res!800619) b!1202999))

(assert (= (and b!1202999 res!800618) b!1203001))

(assert (= (and b!1203001 res!800625) b!1202986))

(assert (= (and b!1202986 (not res!800617)) b!1202993))

(assert (= (and b!1202993 (not res!800628)) b!1202990))

(assert (= (and b!1202990 c!117755) b!1202987))

(assert (= (and b!1202990 (not c!117755)) b!1202992))

(assert (= (or b!1202987 b!1202992) bm!57916))

(assert (= (or b!1202987 b!1202992) bm!57914))

(assert (= (and b!1202990 (not res!800615)) b!1203005))

(assert (= (and b!1203005 (not res!800616)) b!1203007))

(assert (= (and b!1203007 c!117756) b!1203000))

(assert (= (and b!1203007 (not c!117756)) b!1203003))

(assert (= (and b!1203003 c!117758) b!1203008))

(assert (= (and b!1203003 (not c!117758)) b!1203004))

(assert (= (and b!1203004 c!117757) b!1202995))

(assert (= (and b!1203004 (not c!117757)) b!1202988))

(assert (= (or b!1203008 b!1202995) bm!57918))

(assert (= (or b!1203008 b!1202995) bm!57920))

(assert (= (or b!1203008 b!1202995) bm!57915))

(assert (= (or b!1203000 bm!57915) bm!57917))

(assert (= (or b!1203000 bm!57918) bm!57919))

(assert (= (or b!1203000 bm!57920) bm!57913))

(assert (= (and b!1202985 condMapEmpty!47738) mapIsEmpty!47738))

(assert (= (and b!1202985 (not condMapEmpty!47738)) mapNonEmpty!47738))

(get-info :version)

(assert (= (and mapNonEmpty!47738 ((_ is ValueCellFull!14589) mapValue!47738)) b!1202997))

(assert (= (and b!1202985 ((_ is ValueCellFull!14589) mapDefault!47738)) b!1202989))

(assert (= start!100570 b!1202985))

(declare-fun b_lambda!21089 () Bool)

(assert (=> (not b_lambda!21089) (not b!1202993)))

(declare-fun t!39364 () Bool)

(declare-fun tb!10693 () Bool)

(assert (=> (and start!100570 (= defaultEntry!1004 defaultEntry!1004) t!39364) tb!10693))

(declare-fun result!21963 () Bool)

(assert (=> tb!10693 (= result!21963 tp_is_empty!30597)))

(assert (=> b!1202993 t!39364))

(declare-fun b_and!42675 () Bool)

(assert (= b_and!42673 (and (=> t!39364 result!21963) b_and!42675)))

(declare-fun m!1108709 () Bool)

(assert (=> b!1203002 m!1108709))

(declare-fun m!1108711 () Bool)

(assert (=> b!1203009 m!1108711))

(declare-fun m!1108713 () Bool)

(assert (=> start!100570 m!1108713))

(declare-fun m!1108715 () Bool)

(assert (=> start!100570 m!1108715))

(declare-fun m!1108717 () Bool)

(assert (=> b!1202998 m!1108717))

(declare-fun m!1108719 () Bool)

(assert (=> b!1202990 m!1108719))

(declare-fun m!1108721 () Bool)

(assert (=> b!1202990 m!1108721))

(declare-fun m!1108723 () Bool)

(assert (=> b!1202993 m!1108723))

(declare-fun m!1108725 () Bool)

(assert (=> b!1202993 m!1108725))

(declare-fun m!1108727 () Bool)

(assert (=> b!1202993 m!1108727))

(declare-fun m!1108729 () Bool)

(assert (=> b!1202993 m!1108729))

(declare-fun m!1108731 () Bool)

(assert (=> bm!57914 m!1108731))

(declare-fun m!1108733 () Bool)

(assert (=> b!1203000 m!1108733))

(declare-fun m!1108735 () Bool)

(assert (=> b!1203000 m!1108735))

(assert (=> b!1203000 m!1108735))

(declare-fun m!1108737 () Bool)

(assert (=> b!1203000 m!1108737))

(declare-fun m!1108739 () Bool)

(assert (=> bm!57916 m!1108739))

(declare-fun m!1108741 () Bool)

(assert (=> b!1202994 m!1108741))

(declare-fun m!1108743 () Bool)

(assert (=> b!1202986 m!1108743))

(declare-fun m!1108745 () Bool)

(assert (=> b!1202986 m!1108745))

(declare-fun m!1108747 () Bool)

(assert (=> b!1202996 m!1108747))

(declare-fun m!1108749 () Bool)

(assert (=> mapNonEmpty!47738 m!1108749))

(declare-fun m!1108751 () Bool)

(assert (=> b!1203005 m!1108751))

(assert (=> b!1203005 m!1108731))

(declare-fun m!1108753 () Bool)

(assert (=> bm!57913 m!1108753))

(declare-fun m!1108755 () Bool)

(assert (=> b!1203001 m!1108755))

(declare-fun m!1108757 () Bool)

(assert (=> bm!57917 m!1108757))

(declare-fun m!1108759 () Bool)

(assert (=> bm!57919 m!1108759))

(declare-fun m!1108761 () Bool)

(assert (=> b!1202987 m!1108761))

(declare-fun m!1108763 () Bool)

(assert (=> b!1202999 m!1108763))

(declare-fun m!1108765 () Bool)

(assert (=> b!1202999 m!1108765))

(check-sat (not bm!57916) b_and!42675 (not b!1203000) (not b!1202987) (not b!1203005) (not bm!57917) tp_is_empty!30597 (not b!1202986) (not bm!57914) (not b!1202990) (not mapNonEmpty!47738) (not b_lambda!21089) (not bm!57913) (not b!1203001) (not b!1202996) (not b!1202993) (not b_next!25893) (not b!1203002) (not start!100570) (not b!1202999) (not b!1203009) (not b!1202998) (not bm!57919))
(check-sat b_and!42675 (not b_next!25893))
