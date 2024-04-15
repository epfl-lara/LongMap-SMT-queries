; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100538 () Bool)

(assert start!100538)

(declare-fun b_free!25867 () Bool)

(declare-fun b_next!25867 () Bool)

(assert (=> start!100538 (= b_free!25867 (not b_next!25867))))

(declare-fun tp!90590 () Bool)

(declare-fun b_and!42599 () Bool)

(assert (=> start!100538 (= tp!90590 b_and!42599)))

(declare-fun b!1201860 () Bool)

(declare-datatypes ((Unit!39695 0))(
  ( (Unit!39696) )
))
(declare-fun e!682482 () Unit!39695)

(declare-fun lt!544558 () Unit!39695)

(assert (=> b!1201860 (= e!682482 lt!544558)))

(declare-datatypes ((V!45889 0))(
  ( (V!45890 (val!15342 Int)) )
))
(declare-fun zeroValue!944 () V!45889)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!19734 0))(
  ( (tuple2!19735 (_1!9878 (_ BitVec 64)) (_2!9878 V!45889)) )
))
(declare-datatypes ((List!26522 0))(
  ( (Nil!26519) (Cons!26518 (h!27727 tuple2!19734) (t!39360 List!26522)) )
))
(declare-datatypes ((ListLongMap!17703 0))(
  ( (ListLongMap!17704 (toList!8867 List!26522)) )
))
(declare-fun lt!544564 () ListLongMap!17703)

(declare-fun lt!544557 () Unit!39695)

(declare-fun addStillContains!987 (ListLongMap!17703 (_ BitVec 64) V!45889 (_ BitVec 64)) Unit!39695)

(assert (=> b!1201860 (= lt!544557 (addStillContains!987 lt!544564 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!544560 () ListLongMap!17703)

(declare-fun call!57584 () ListLongMap!17703)

(assert (=> b!1201860 (= lt!544560 call!57584)))

(declare-fun call!57586 () Bool)

(assert (=> b!1201860 call!57586))

(declare-fun call!57581 () Unit!39695)

(assert (=> b!1201860 (= lt!544558 call!57581)))

(declare-fun minValue!944 () V!45889)

(declare-fun contains!6861 (ListLongMap!17703 (_ BitVec 64)) Bool)

(declare-fun +!4003 (ListLongMap!17703 tuple2!19734) ListLongMap!17703)

(assert (=> b!1201860 (contains!6861 (+!4003 lt!544560 (tuple2!19735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1201861 () Bool)

(declare-fun c!117576 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!544562 () Bool)

(assert (=> b!1201861 (= c!117576 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544562))))

(declare-fun e!682489 () Unit!39695)

(declare-fun e!682480 () Unit!39695)

(assert (=> b!1201861 (= e!682489 e!682480)))

(declare-fun b!1201862 () Bool)

(declare-fun res!800006 () Bool)

(declare-fun e!682481 () Bool)

(assert (=> b!1201862 (=> (not res!800006) (not e!682481))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77834 0))(
  ( (array!77835 (arr!37562 (Array (_ BitVec 32) (_ BitVec 64))) (size!38100 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77834)

(assert (=> b!1201862 (= res!800006 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38100 _keys!1208))))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57578 () Bool)

(declare-datatypes ((ValueCell!14576 0))(
  ( (ValueCellFull!14576 (v!17979 V!45889)) (EmptyCell!14576) )
))
(declare-datatypes ((array!77836 0))(
  ( (array!77837 (arr!37563 (Array (_ BitVec 32) ValueCell!14576)) (size!38101 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77836)

(declare-fun call!57587 () ListLongMap!17703)

(declare-fun getCurrentListMapNoExtraKeys!5314 (array!77834 array!77836 (_ BitVec 32) (_ BitVec 32) V!45889 V!45889 (_ BitVec 32) Int) ListLongMap!17703)

(assert (=> bm!57578 (= call!57587 (getCurrentListMapNoExtraKeys!5314 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201863 () Bool)

(declare-fun res!800014 () Bool)

(assert (=> b!1201863 (=> (not res!800014) (not e!682481))))

(assert (=> b!1201863 (= res!800014 (= (select (arr!37562 _keys!1208) i!673) k0!934))))

(declare-fun b!1201864 () Bool)

(declare-fun res!800010 () Bool)

(assert (=> b!1201864 (=> (not res!800010) (not e!682481))))

(assert (=> b!1201864 (= res!800010 (and (= (size!38101 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38100 _keys!1208) (size!38101 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun c!117573 () Bool)

(declare-fun bm!57579 () Bool)

(declare-fun c!117575 () Bool)

(assert (=> bm!57579 (= call!57581 (addStillContains!987 (ite c!117575 lt!544560 lt!544564) (ite c!117575 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117573 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117575 minValue!944 (ite c!117573 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1201865 () Bool)

(declare-fun e!682483 () Bool)

(declare-fun e!682477 () Bool)

(assert (=> b!1201865 (= e!682483 (not e!682477))))

(declare-fun res!800012 () Bool)

(assert (=> b!1201865 (=> res!800012 e!682477)))

(assert (=> b!1201865 (= res!800012 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201865 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544569 () Unit!39695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77834 (_ BitVec 64) (_ BitVec 32)) Unit!39695)

(assert (=> b!1201865 (= lt!544569 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201866 () Bool)

(declare-fun res!800007 () Bool)

(assert (=> b!1201866 (=> (not res!800007) (not e!682483))))

(declare-fun lt!544559 () array!77834)

(declare-datatypes ((List!26523 0))(
  ( (Nil!26520) (Cons!26519 (h!27728 (_ BitVec 64)) (t!39361 List!26523)) )
))
(declare-fun arrayNoDuplicates!0 (array!77834 (_ BitVec 32) List!26523) Bool)

(assert (=> b!1201866 (= res!800007 (arrayNoDuplicates!0 lt!544559 #b00000000000000000000000000000000 Nil!26520))))

(declare-fun bm!57580 () Bool)

(declare-fun call!57585 () Unit!39695)

(assert (=> bm!57580 (= call!57585 call!57581)))

(declare-fun b!1201867 () Bool)

(declare-fun res!800005 () Bool)

(assert (=> b!1201867 (=> (not res!800005) (not e!682481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77834 (_ BitVec 32)) Bool)

(assert (=> b!1201867 (= res!800005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57581 () Bool)

(declare-fun call!57588 () ListLongMap!17703)

(assert (=> bm!57581 (= call!57588 call!57584)))

(declare-fun res!800009 () Bool)

(assert (=> start!100538 (=> (not res!800009) (not e!682481))))

(assert (=> start!100538 (= res!800009 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38100 _keys!1208))))))

(assert (=> start!100538 e!682481))

(declare-fun tp_is_empty!30571 () Bool)

(assert (=> start!100538 tp_is_empty!30571))

(declare-fun array_inv!28732 (array!77834) Bool)

(assert (=> start!100538 (array_inv!28732 _keys!1208)))

(assert (=> start!100538 true))

(assert (=> start!100538 tp!90590))

(declare-fun e!682485 () Bool)

(declare-fun array_inv!28733 (array!77836) Bool)

(assert (=> start!100538 (and (array_inv!28733 _values!996) e!682485)))

(declare-fun b!1201868 () Bool)

(declare-fun res!800015 () Bool)

(assert (=> b!1201868 (=> (not res!800015) (not e!682481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201868 (= res!800015 (validMask!0 mask!1564))))

(declare-fun b!1201869 () Bool)

(declare-fun call!57583 () Bool)

(assert (=> b!1201869 call!57583))

(declare-fun lt!544567 () Unit!39695)

(assert (=> b!1201869 (= lt!544567 call!57585)))

(assert (=> b!1201869 (= e!682489 lt!544567)))

(declare-fun b!1201870 () Bool)

(declare-fun e!682484 () Bool)

(declare-fun call!57582 () ListLongMap!17703)

(assert (=> b!1201870 (= e!682484 (= call!57582 call!57587))))

(declare-fun b!1201871 () Bool)

(assert (=> b!1201871 (= e!682482 e!682489)))

(assert (=> b!1201871 (= c!117573 (and (not lt!544562) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201872 () Bool)

(declare-fun e!682487 () Bool)

(assert (=> b!1201872 (= e!682477 e!682487)))

(declare-fun res!800008 () Bool)

(assert (=> b!1201872 (=> res!800008 e!682487)))

(assert (=> b!1201872 (= res!800008 (not (= from!1455 i!673)))))

(declare-fun lt!544561 () array!77836)

(declare-fun lt!544568 () ListLongMap!17703)

(assert (=> b!1201872 (= lt!544568 (getCurrentListMapNoExtraKeys!5314 lt!544559 lt!544561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3190 (Int (_ BitVec 64)) V!45889)

(assert (=> b!1201872 (= lt!544561 (array!77837 (store (arr!37563 _values!996) i!673 (ValueCellFull!14576 (dynLambda!3190 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38101 _values!996)))))

(declare-fun lt!544566 () ListLongMap!17703)

(assert (=> b!1201872 (= lt!544566 (getCurrentListMapNoExtraKeys!5314 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57582 () Bool)

(assert (=> bm!57582 (= call!57584 (+!4003 lt!544564 (ite (or c!117575 c!117573) (tuple2!19735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1201873 () Bool)

(declare-fun -!1765 (ListLongMap!17703 (_ BitVec 64)) ListLongMap!17703)

(assert (=> b!1201873 (= e!682484 (= call!57582 (-!1765 call!57587 k0!934)))))

(declare-fun b!1201874 () Bool)

(declare-fun e!682478 () Bool)

(declare-fun e!682488 () Bool)

(assert (=> b!1201874 (= e!682478 e!682488)))

(declare-fun res!800004 () Bool)

(assert (=> b!1201874 (=> res!800004 e!682488)))

(assert (=> b!1201874 (= res!800004 (not (contains!6861 lt!544564 k0!934)))))

(assert (=> b!1201874 (= lt!544564 (getCurrentListMapNoExtraKeys!5314 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57583 () Bool)

(assert (=> bm!57583 (= call!57586 (contains!6861 (ite c!117575 lt!544560 call!57588) k0!934))))

(declare-fun mapNonEmpty!47699 () Bool)

(declare-fun mapRes!47699 () Bool)

(declare-fun tp!90591 () Bool)

(declare-fun e!682476 () Bool)

(assert (=> mapNonEmpty!47699 (= mapRes!47699 (and tp!90591 e!682476))))

(declare-fun mapKey!47699 () (_ BitVec 32))

(declare-fun mapRest!47699 () (Array (_ BitVec 32) ValueCell!14576))

(declare-fun mapValue!47699 () ValueCell!14576)

(assert (=> mapNonEmpty!47699 (= (arr!37563 _values!996) (store mapRest!47699 mapKey!47699 mapValue!47699))))

(declare-fun b!1201875 () Bool)

(declare-fun e!682479 () Bool)

(assert (=> b!1201875 (= e!682485 (and e!682479 mapRes!47699))))

(declare-fun condMapEmpty!47699 () Bool)

(declare-fun mapDefault!47699 () ValueCell!14576)

(assert (=> b!1201875 (= condMapEmpty!47699 (= (arr!37563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14576)) mapDefault!47699)))))

(declare-fun b!1201876 () Bool)

(assert (=> b!1201876 (= e!682487 e!682478)))

(declare-fun res!800016 () Bool)

(assert (=> b!1201876 (=> res!800016 e!682478)))

(assert (=> b!1201876 (= res!800016 (not (= (select (arr!37562 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201876 e!682484))

(declare-fun c!117574 () Bool)

(assert (=> b!1201876 (= c!117574 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544570 () Unit!39695)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1013 (array!77834 array!77836 (_ BitVec 32) (_ BitVec 32) V!45889 V!45889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39695)

(assert (=> b!1201876 (= lt!544570 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201877 () Bool)

(declare-fun Unit!39697 () Unit!39695)

(assert (=> b!1201877 (= e!682480 Unit!39697)))

(declare-fun b!1201878 () Bool)

(assert (=> b!1201878 (= e!682476 tp_is_empty!30571)))

(declare-fun bm!57584 () Bool)

(assert (=> bm!57584 (= call!57583 call!57586)))

(declare-fun b!1201879 () Bool)

(declare-fun res!800013 () Bool)

(assert (=> b!1201879 (=> (not res!800013) (not e!682481))))

(assert (=> b!1201879 (= res!800013 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26520))))

(declare-fun b!1201880 () Bool)

(assert (=> b!1201880 (= e!682479 tp_is_empty!30571)))

(declare-fun b!1201881 () Bool)

(assert (=> b!1201881 (= e!682481 e!682483)))

(declare-fun res!800011 () Bool)

(assert (=> b!1201881 (=> (not res!800011) (not e!682483))))

(assert (=> b!1201881 (= res!800011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544559 mask!1564))))

(assert (=> b!1201881 (= lt!544559 (array!77835 (store (arr!37562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38100 _keys!1208)))))

(declare-fun b!1201882 () Bool)

(declare-fun lt!544563 () Unit!39695)

(assert (=> b!1201882 (= e!682480 lt!544563)))

(assert (=> b!1201882 (= lt!544563 call!57585)))

(assert (=> b!1201882 call!57583))

(declare-fun b!1201883 () Bool)

(declare-fun res!800003 () Bool)

(assert (=> b!1201883 (=> (not res!800003) (not e!682481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201883 (= res!800003 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47699 () Bool)

(assert (=> mapIsEmpty!47699 mapRes!47699))

(declare-fun bm!57585 () Bool)

(assert (=> bm!57585 (= call!57582 (getCurrentListMapNoExtraKeys!5314 lt!544559 lt!544561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201884 () Bool)

(assert (=> b!1201884 (= e!682488 true)))

(declare-fun lt!544565 () Unit!39695)

(assert (=> b!1201884 (= lt!544565 e!682482)))

(assert (=> b!1201884 (= c!117575 (and (not lt!544562) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201884 (= lt!544562 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!100538 res!800009) b!1201868))

(assert (= (and b!1201868 res!800015) b!1201864))

(assert (= (and b!1201864 res!800010) b!1201867))

(assert (= (and b!1201867 res!800005) b!1201879))

(assert (= (and b!1201879 res!800013) b!1201862))

(assert (= (and b!1201862 res!800006) b!1201883))

(assert (= (and b!1201883 res!800003) b!1201863))

(assert (= (and b!1201863 res!800014) b!1201881))

(assert (= (and b!1201881 res!800011) b!1201866))

(assert (= (and b!1201866 res!800007) b!1201865))

(assert (= (and b!1201865 (not res!800012)) b!1201872))

(assert (= (and b!1201872 (not res!800008)) b!1201876))

(assert (= (and b!1201876 c!117574) b!1201873))

(assert (= (and b!1201876 (not c!117574)) b!1201870))

(assert (= (or b!1201873 b!1201870) bm!57585))

(assert (= (or b!1201873 b!1201870) bm!57578))

(assert (= (and b!1201876 (not res!800016)) b!1201874))

(assert (= (and b!1201874 (not res!800004)) b!1201884))

(assert (= (and b!1201884 c!117575) b!1201860))

(assert (= (and b!1201884 (not c!117575)) b!1201871))

(assert (= (and b!1201871 c!117573) b!1201869))

(assert (= (and b!1201871 (not c!117573)) b!1201861))

(assert (= (and b!1201861 c!117576) b!1201882))

(assert (= (and b!1201861 (not c!117576)) b!1201877))

(assert (= (or b!1201869 b!1201882) bm!57580))

(assert (= (or b!1201869 b!1201882) bm!57581))

(assert (= (or b!1201869 b!1201882) bm!57584))

(assert (= (or b!1201860 bm!57584) bm!57583))

(assert (= (or b!1201860 bm!57580) bm!57579))

(assert (= (or b!1201860 bm!57581) bm!57582))

(assert (= (and b!1201875 condMapEmpty!47699) mapIsEmpty!47699))

(assert (= (and b!1201875 (not condMapEmpty!47699)) mapNonEmpty!47699))

(get-info :version)

(assert (= (and mapNonEmpty!47699 ((_ is ValueCellFull!14576) mapValue!47699)) b!1201878))

(assert (= (and b!1201875 ((_ is ValueCellFull!14576) mapDefault!47699)) b!1201880))

(assert (= start!100538 b!1201875))

(declare-fun b_lambda!21045 () Bool)

(assert (=> (not b_lambda!21045) (not b!1201872)))

(declare-fun t!39359 () Bool)

(declare-fun tb!10659 () Bool)

(assert (=> (and start!100538 (= defaultEntry!1004 defaultEntry!1004) t!39359) tb!10659))

(declare-fun result!21903 () Bool)

(assert (=> tb!10659 (= result!21903 tp_is_empty!30571)))

(assert (=> b!1201872 t!39359))

(declare-fun b_and!42601 () Bool)

(assert (= b_and!42599 (and (=> t!39359 result!21903) b_and!42601)))

(declare-fun m!1107345 () Bool)

(assert (=> bm!57578 m!1107345))

(declare-fun m!1107347 () Bool)

(assert (=> b!1201866 m!1107347))

(declare-fun m!1107349 () Bool)

(assert (=> b!1201860 m!1107349))

(declare-fun m!1107351 () Bool)

(assert (=> b!1201860 m!1107351))

(assert (=> b!1201860 m!1107351))

(declare-fun m!1107353 () Bool)

(assert (=> b!1201860 m!1107353))

(declare-fun m!1107355 () Bool)

(assert (=> b!1201874 m!1107355))

(assert (=> b!1201874 m!1107345))

(declare-fun m!1107357 () Bool)

(assert (=> b!1201876 m!1107357))

(declare-fun m!1107359 () Bool)

(assert (=> b!1201876 m!1107359))

(declare-fun m!1107361 () Bool)

(assert (=> bm!57583 m!1107361))

(declare-fun m!1107363 () Bool)

(assert (=> b!1201863 m!1107363))

(declare-fun m!1107365 () Bool)

(assert (=> b!1201873 m!1107365))

(declare-fun m!1107367 () Bool)

(assert (=> b!1201881 m!1107367))

(declare-fun m!1107369 () Bool)

(assert (=> b!1201881 m!1107369))

(declare-fun m!1107371 () Bool)

(assert (=> bm!57579 m!1107371))

(declare-fun m!1107373 () Bool)

(assert (=> b!1201868 m!1107373))

(declare-fun m!1107375 () Bool)

(assert (=> b!1201865 m!1107375))

(declare-fun m!1107377 () Bool)

(assert (=> b!1201865 m!1107377))

(declare-fun m!1107379 () Bool)

(assert (=> b!1201879 m!1107379))

(declare-fun m!1107381 () Bool)

(assert (=> start!100538 m!1107381))

(declare-fun m!1107383 () Bool)

(assert (=> start!100538 m!1107383))

(declare-fun m!1107385 () Bool)

(assert (=> bm!57585 m!1107385))

(declare-fun m!1107387 () Bool)

(assert (=> mapNonEmpty!47699 m!1107387))

(declare-fun m!1107389 () Bool)

(assert (=> b!1201872 m!1107389))

(declare-fun m!1107391 () Bool)

(assert (=> b!1201872 m!1107391))

(declare-fun m!1107393 () Bool)

(assert (=> b!1201872 m!1107393))

(declare-fun m!1107395 () Bool)

(assert (=> b!1201872 m!1107395))

(declare-fun m!1107397 () Bool)

(assert (=> b!1201883 m!1107397))

(declare-fun m!1107399 () Bool)

(assert (=> b!1201867 m!1107399))

(declare-fun m!1107401 () Bool)

(assert (=> bm!57582 m!1107401))

(check-sat tp_is_empty!30571 (not bm!57579) b_and!42601 (not b!1201874) (not b!1201860) (not b!1201866) (not b!1201879) (not b!1201872) (not b!1201883) (not bm!57578) (not bm!57585) (not bm!57583) (not start!100538) (not b!1201873) (not b_next!25867) (not mapNonEmpty!47699) (not bm!57582) (not b_lambda!21045) (not b!1201881) (not b!1201868) (not b!1201865) (not b!1201867) (not b!1201876))
(check-sat b_and!42601 (not b_next!25867))
