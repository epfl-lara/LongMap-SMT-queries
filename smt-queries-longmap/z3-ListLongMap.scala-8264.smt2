; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100534 () Bool)

(assert start!100534)

(declare-fun b_free!25857 () Bool)

(declare-fun b_next!25857 () Bool)

(assert (=> start!100534 (= b_free!25857 (not b_next!25857))))

(declare-fun tp!90560 () Bool)

(declare-fun b_and!42601 () Bool)

(assert (=> start!100534 (= tp!90560 b_and!42601)))

(declare-fun b!1201599 () Bool)

(declare-fun res!799861 () Bool)

(declare-fun e!682352 () Bool)

(assert (=> b!1201599 (=> (not res!799861) (not e!682352))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201599 (= res!799861 (validKeyInArray!0 k0!934))))

(declare-fun b!1201600 () Bool)

(declare-fun e!682348 () Bool)

(declare-fun e!682345 () Bool)

(assert (=> b!1201600 (= e!682348 e!682345)))

(declare-fun res!799871 () Bool)

(assert (=> b!1201600 (=> res!799871 e!682345)))

(declare-datatypes ((V!45875 0))(
  ( (V!45876 (val!15337 Int)) )
))
(declare-datatypes ((tuple2!19646 0))(
  ( (tuple2!19647 (_1!9834 (_ BitVec 64)) (_2!9834 V!45875)) )
))
(declare-datatypes ((List!26462 0))(
  ( (Nil!26459) (Cons!26458 (h!27667 tuple2!19646) (t!39299 List!26462)) )
))
(declare-datatypes ((ListLongMap!17615 0))(
  ( (ListLongMap!17616 (toList!8823 List!26462)) )
))
(declare-fun lt!544548 () ListLongMap!17615)

(declare-fun contains!6880 (ListLongMap!17615 (_ BitVec 64)) Bool)

(assert (=> b!1201600 (= res!799871 (not (contains!6880 lt!544548 k0!934)))))

(declare-fun zeroValue!944 () V!45875)

(declare-datatypes ((array!77895 0))(
  ( (array!77896 (arr!37592 (Array (_ BitVec 32) (_ BitVec 64))) (size!38128 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77895)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14571 0))(
  ( (ValueCellFull!14571 (v!17975 V!45875)) (EmptyCell!14571) )
))
(declare-datatypes ((array!77897 0))(
  ( (array!77898 (arr!37593 (Array (_ BitVec 32) ValueCell!14571)) (size!38129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77897)

(declare-fun minValue!944 () V!45875)

(declare-fun getCurrentListMapNoExtraKeys!5261 (array!77895 array!77897 (_ BitVec 32) (_ BitVec 32) V!45875 V!45875 (_ BitVec 32) Int) ListLongMap!17615)

(assert (=> b!1201600 (= lt!544548 (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57481 () Bool)

(declare-datatypes ((Unit!39837 0))(
  ( (Unit!39838) )
))
(declare-fun call!57486 () Unit!39837)

(declare-fun call!57490 () Unit!39837)

(assert (=> bm!57481 (= call!57486 call!57490)))

(declare-fun b!1201601 () Bool)

(declare-fun res!799863 () Bool)

(assert (=> b!1201601 (=> (not res!799863) (not e!682352))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201601 (= res!799863 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38128 _keys!1208))))))

(declare-fun bm!57482 () Bool)

(declare-fun call!57485 () ListLongMap!17615)

(assert (=> bm!57482 (= call!57485 (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201602 () Bool)

(declare-fun res!799870 () Bool)

(declare-fun e!682350 () Bool)

(assert (=> b!1201602 (=> (not res!799870) (not e!682350))))

(declare-fun lt!544547 () array!77895)

(declare-datatypes ((List!26463 0))(
  ( (Nil!26460) (Cons!26459 (h!27668 (_ BitVec 64)) (t!39300 List!26463)) )
))
(declare-fun arrayNoDuplicates!0 (array!77895 (_ BitVec 32) List!26463) Bool)

(assert (=> b!1201602 (= res!799870 (arrayNoDuplicates!0 lt!544547 #b00000000000000000000000000000000 Nil!26460))))

(declare-fun b!1201603 () Bool)

(declare-fun e!682355 () Bool)

(declare-fun tp_is_empty!30561 () Bool)

(assert (=> b!1201603 (= e!682355 tp_is_empty!30561)))

(declare-fun b!1201604 () Bool)

(declare-fun e!682349 () Unit!39837)

(declare-fun e!682344 () Unit!39837)

(assert (=> b!1201604 (= e!682349 e!682344)))

(declare-fun c!117539 () Bool)

(declare-fun lt!544546 () Bool)

(assert (=> b!1201604 (= c!117539 (and (not lt!544546) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201605 () Bool)

(declare-fun c!117540 () Bool)

(assert (=> b!1201605 (= c!117540 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544546))))

(declare-fun e!682351 () Unit!39837)

(assert (=> b!1201605 (= e!682344 e!682351)))

(declare-fun res!799859 () Bool)

(assert (=> start!100534 (=> (not res!799859) (not e!682352))))

(assert (=> start!100534 (= res!799859 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38128 _keys!1208))))))

(assert (=> start!100534 e!682352))

(assert (=> start!100534 tp_is_empty!30561))

(declare-fun array_inv!28648 (array!77895) Bool)

(assert (=> start!100534 (array_inv!28648 _keys!1208)))

(assert (=> start!100534 true))

(assert (=> start!100534 tp!90560))

(declare-fun e!682356 () Bool)

(declare-fun array_inv!28649 (array!77897) Bool)

(assert (=> start!100534 (and (array_inv!28649 _values!996) e!682356)))

(declare-fun b!1201606 () Bool)

(declare-fun lt!544544 () Unit!39837)

(assert (=> b!1201606 (= e!682349 lt!544544)))

(declare-fun lt!544550 () Unit!39837)

(declare-fun addStillContains!981 (ListLongMap!17615 (_ BitVec 64) V!45875 (_ BitVec 64)) Unit!39837)

(assert (=> b!1201606 (= lt!544550 (addStillContains!981 lt!544548 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!544551 () ListLongMap!17615)

(declare-fun call!57488 () ListLongMap!17615)

(assert (=> b!1201606 (= lt!544551 call!57488)))

(declare-fun call!57491 () Bool)

(assert (=> b!1201606 call!57491))

(assert (=> b!1201606 (= lt!544544 call!57490)))

(declare-fun +!3954 (ListLongMap!17615 tuple2!19646) ListLongMap!17615)

(assert (=> b!1201606 (contains!6880 (+!3954 lt!544551 (tuple2!19647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1201607 () Bool)

(declare-fun e!682353 () Bool)

(assert (=> b!1201607 (= e!682353 tp_is_empty!30561)))

(declare-fun b!1201608 () Bool)

(assert (=> b!1201608 (= e!682352 e!682350)))

(declare-fun res!799860 () Bool)

(assert (=> b!1201608 (=> (not res!799860) (not e!682350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77895 (_ BitVec 32)) Bool)

(assert (=> b!1201608 (= res!799860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544547 mask!1564))))

(assert (=> b!1201608 (= lt!544547 (array!77896 (store (arr!37592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38128 _keys!1208)))))

(declare-fun b!1201609 () Bool)

(declare-fun mapRes!47684 () Bool)

(assert (=> b!1201609 (= e!682356 (and e!682355 mapRes!47684))))

(declare-fun condMapEmpty!47684 () Bool)

(declare-fun mapDefault!47684 () ValueCell!14571)

(assert (=> b!1201609 (= condMapEmpty!47684 (= (arr!37593 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14571)) mapDefault!47684)))))

(declare-fun mapNonEmpty!47684 () Bool)

(declare-fun tp!90561 () Bool)

(assert (=> mapNonEmpty!47684 (= mapRes!47684 (and tp!90561 e!682353))))

(declare-fun mapValue!47684 () ValueCell!14571)

(declare-fun mapRest!47684 () (Array (_ BitVec 32) ValueCell!14571))

(declare-fun mapKey!47684 () (_ BitVec 32))

(assert (=> mapNonEmpty!47684 (= (arr!37593 _values!996) (store mapRest!47684 mapKey!47684 mapValue!47684))))

(declare-fun b!1201610 () Bool)

(declare-fun res!799864 () Bool)

(assert (=> b!1201610 (=> (not res!799864) (not e!682352))))

(assert (=> b!1201610 (= res!799864 (= (select (arr!37592 _keys!1208) i!673) k0!934))))

(declare-fun b!1201611 () Bool)

(declare-fun Unit!39839 () Unit!39837)

(assert (=> b!1201611 (= e!682351 Unit!39839)))

(declare-fun b!1201612 () Bool)

(declare-fun e!682354 () Bool)

(declare-fun call!57489 () ListLongMap!17615)

(assert (=> b!1201612 (= e!682354 (= call!57489 call!57485))))

(declare-fun mapIsEmpty!47684 () Bool)

(assert (=> mapIsEmpty!47684 mapRes!47684))

(declare-fun b!1201613 () Bool)

(declare-fun lt!544545 () Unit!39837)

(assert (=> b!1201613 (= e!682351 lt!544545)))

(assert (=> b!1201613 (= lt!544545 call!57486)))

(declare-fun call!57487 () Bool)

(assert (=> b!1201613 call!57487))

(declare-fun b!1201614 () Bool)

(declare-fun res!799866 () Bool)

(assert (=> b!1201614 (=> (not res!799866) (not e!682352))))

(assert (=> b!1201614 (= res!799866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201615 () Bool)

(declare-fun -!1795 (ListLongMap!17615 (_ BitVec 64)) ListLongMap!17615)

(assert (=> b!1201615 (= e!682354 (= call!57489 (-!1795 call!57485 k0!934)))))

(declare-fun b!1201616 () Bool)

(declare-fun res!799867 () Bool)

(assert (=> b!1201616 (=> (not res!799867) (not e!682352))))

(assert (=> b!1201616 (= res!799867 (and (= (size!38129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38128 _keys!1208) (size!38129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201617 () Bool)

(assert (=> b!1201617 (= e!682345 true)))

(declare-fun lt!544539 () Unit!39837)

(assert (=> b!1201617 (= lt!544539 e!682349)))

(declare-fun c!117541 () Bool)

(assert (=> b!1201617 (= c!117541 (and (not lt!544546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201617 (= lt!544546 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!57483 () Bool)

(assert (=> bm!57483 (= call!57490 (addStillContains!981 (ite c!117541 lt!544551 lt!544548) (ite c!117541 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117539 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117541 minValue!944 (ite c!117539 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!57484 () Bool)

(assert (=> bm!57484 (= call!57488 (+!3954 lt!544548 (ite (or c!117541 c!117539) (tuple2!19647 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19647 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1201618 () Bool)

(declare-fun e!682357 () Bool)

(declare-fun e!682347 () Bool)

(assert (=> b!1201618 (= e!682357 e!682347)))

(declare-fun res!799865 () Bool)

(assert (=> b!1201618 (=> res!799865 e!682347)))

(assert (=> b!1201618 (= res!799865 (not (= from!1455 i!673)))))

(declare-fun lt!544542 () ListLongMap!17615)

(declare-fun lt!544549 () array!77897)

(assert (=> b!1201618 (= lt!544542 (getCurrentListMapNoExtraKeys!5261 lt!544547 lt!544549 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3177 (Int (_ BitVec 64)) V!45875)

(assert (=> b!1201618 (= lt!544549 (array!77898 (store (arr!37593 _values!996) i!673 (ValueCellFull!14571 (dynLambda!3177 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38129 _values!996)))))

(declare-fun lt!544541 () ListLongMap!17615)

(assert (=> b!1201618 (= lt!544541 (getCurrentListMapNoExtraKeys!5261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201619 () Bool)

(assert (=> b!1201619 (= e!682347 e!682348)))

(declare-fun res!799872 () Bool)

(assert (=> b!1201619 (=> res!799872 e!682348)))

(assert (=> b!1201619 (= res!799872 (not (= (select (arr!37592 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201619 e!682354))

(declare-fun c!117542 () Bool)

(assert (=> b!1201619 (= c!117542 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544543 () Unit!39837)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1000 (array!77895 array!77897 (_ BitVec 32) (_ BitVec 32) V!45875 V!45875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39837)

(assert (=> b!1201619 (= lt!544543 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1000 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57484 () ListLongMap!17615)

(declare-fun bm!57485 () Bool)

(assert (=> bm!57485 (= call!57491 (contains!6880 (ite c!117541 lt!544551 call!57484) k0!934))))

(declare-fun bm!57486 () Bool)

(assert (=> bm!57486 (= call!57484 call!57488)))

(declare-fun bm!57487 () Bool)

(assert (=> bm!57487 (= call!57487 call!57491)))

(declare-fun b!1201620 () Bool)

(assert (=> b!1201620 call!57487))

(declare-fun lt!544552 () Unit!39837)

(assert (=> b!1201620 (= lt!544552 call!57486)))

(assert (=> b!1201620 (= e!682344 lt!544552)))

(declare-fun b!1201621 () Bool)

(declare-fun res!799869 () Bool)

(assert (=> b!1201621 (=> (not res!799869) (not e!682352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201621 (= res!799869 (validMask!0 mask!1564))))

(declare-fun b!1201622 () Bool)

(declare-fun res!799868 () Bool)

(assert (=> b!1201622 (=> (not res!799868) (not e!682352))))

(assert (=> b!1201622 (= res!799868 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26460))))

(declare-fun bm!57488 () Bool)

(assert (=> bm!57488 (= call!57489 (getCurrentListMapNoExtraKeys!5261 lt!544547 lt!544549 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201623 () Bool)

(assert (=> b!1201623 (= e!682350 (not e!682357))))

(declare-fun res!799862 () Bool)

(assert (=> b!1201623 (=> res!799862 e!682357)))

(assert (=> b!1201623 (= res!799862 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201623 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544540 () Unit!39837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77895 (_ BitVec 64) (_ BitVec 32)) Unit!39837)

(assert (=> b!1201623 (= lt!544540 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100534 res!799859) b!1201621))

(assert (= (and b!1201621 res!799869) b!1201616))

(assert (= (and b!1201616 res!799867) b!1201614))

(assert (= (and b!1201614 res!799866) b!1201622))

(assert (= (and b!1201622 res!799868) b!1201601))

(assert (= (and b!1201601 res!799863) b!1201599))

(assert (= (and b!1201599 res!799861) b!1201610))

(assert (= (and b!1201610 res!799864) b!1201608))

(assert (= (and b!1201608 res!799860) b!1201602))

(assert (= (and b!1201602 res!799870) b!1201623))

(assert (= (and b!1201623 (not res!799862)) b!1201618))

(assert (= (and b!1201618 (not res!799865)) b!1201619))

(assert (= (and b!1201619 c!117542) b!1201615))

(assert (= (and b!1201619 (not c!117542)) b!1201612))

(assert (= (or b!1201615 b!1201612) bm!57488))

(assert (= (or b!1201615 b!1201612) bm!57482))

(assert (= (and b!1201619 (not res!799872)) b!1201600))

(assert (= (and b!1201600 (not res!799871)) b!1201617))

(assert (= (and b!1201617 c!117541) b!1201606))

(assert (= (and b!1201617 (not c!117541)) b!1201604))

(assert (= (and b!1201604 c!117539) b!1201620))

(assert (= (and b!1201604 (not c!117539)) b!1201605))

(assert (= (and b!1201605 c!117540) b!1201613))

(assert (= (and b!1201605 (not c!117540)) b!1201611))

(assert (= (or b!1201620 b!1201613) bm!57481))

(assert (= (or b!1201620 b!1201613) bm!57486))

(assert (= (or b!1201620 b!1201613) bm!57487))

(assert (= (or b!1201606 bm!57487) bm!57485))

(assert (= (or b!1201606 bm!57481) bm!57483))

(assert (= (or b!1201606 bm!57486) bm!57484))

(assert (= (and b!1201609 condMapEmpty!47684) mapIsEmpty!47684))

(assert (= (and b!1201609 (not condMapEmpty!47684)) mapNonEmpty!47684))

(get-info :version)

(assert (= (and mapNonEmpty!47684 ((_ is ValueCellFull!14571) mapValue!47684)) b!1201607))

(assert (= (and b!1201609 ((_ is ValueCellFull!14571) mapDefault!47684)) b!1201603))

(assert (= start!100534 b!1201609))

(declare-fun b_lambda!21053 () Bool)

(assert (=> (not b_lambda!21053) (not b!1201618)))

(declare-fun t!39298 () Bool)

(declare-fun tb!10657 () Bool)

(assert (=> (and start!100534 (= defaultEntry!1004 defaultEntry!1004) t!39298) tb!10657))

(declare-fun result!21891 () Bool)

(assert (=> tb!10657 (= result!21891 tp_is_empty!30561)))

(assert (=> b!1201618 t!39298))

(declare-fun b_and!42603 () Bool)

(assert (= b_and!42601 (and (=> t!39298 result!21891) b_and!42603)))

(declare-fun m!1107665 () Bool)

(assert (=> b!1201615 m!1107665))

(declare-fun m!1107667 () Bool)

(assert (=> b!1201619 m!1107667))

(declare-fun m!1107669 () Bool)

(assert (=> b!1201619 m!1107669))

(declare-fun m!1107671 () Bool)

(assert (=> start!100534 m!1107671))

(declare-fun m!1107673 () Bool)

(assert (=> start!100534 m!1107673))

(declare-fun m!1107675 () Bool)

(assert (=> b!1201599 m!1107675))

(declare-fun m!1107677 () Bool)

(assert (=> b!1201602 m!1107677))

(declare-fun m!1107679 () Bool)

(assert (=> b!1201623 m!1107679))

(declare-fun m!1107681 () Bool)

(assert (=> b!1201623 m!1107681))

(declare-fun m!1107683 () Bool)

(assert (=> b!1201622 m!1107683))

(declare-fun m!1107685 () Bool)

(assert (=> bm!57488 m!1107685))

(declare-fun m!1107687 () Bool)

(assert (=> b!1201618 m!1107687))

(declare-fun m!1107689 () Bool)

(assert (=> b!1201618 m!1107689))

(declare-fun m!1107691 () Bool)

(assert (=> b!1201618 m!1107691))

(declare-fun m!1107693 () Bool)

(assert (=> b!1201618 m!1107693))

(declare-fun m!1107695 () Bool)

(assert (=> b!1201608 m!1107695))

(declare-fun m!1107697 () Bool)

(assert (=> b!1201608 m!1107697))

(declare-fun m!1107699 () Bool)

(assert (=> bm!57484 m!1107699))

(declare-fun m!1107701 () Bool)

(assert (=> bm!57482 m!1107701))

(declare-fun m!1107703 () Bool)

(assert (=> b!1201606 m!1107703))

(declare-fun m!1107705 () Bool)

(assert (=> b!1201606 m!1107705))

(assert (=> b!1201606 m!1107705))

(declare-fun m!1107707 () Bool)

(assert (=> b!1201606 m!1107707))

(declare-fun m!1107709 () Bool)

(assert (=> b!1201600 m!1107709))

(assert (=> b!1201600 m!1107701))

(declare-fun m!1107711 () Bool)

(assert (=> mapNonEmpty!47684 m!1107711))

(declare-fun m!1107713 () Bool)

(assert (=> b!1201614 m!1107713))

(declare-fun m!1107715 () Bool)

(assert (=> b!1201621 m!1107715))

(declare-fun m!1107717 () Bool)

(assert (=> b!1201610 m!1107717))

(declare-fun m!1107719 () Bool)

(assert (=> bm!57485 m!1107719))

(declare-fun m!1107721 () Bool)

(assert (=> bm!57483 m!1107721))

(check-sat (not b!1201622) (not bm!57482) (not bm!57484) (not b!1201614) (not mapNonEmpty!47684) (not b!1201600) (not bm!57485) tp_is_empty!30561 (not b!1201618) (not b!1201602) (not start!100534) b_and!42603 (not b!1201608) (not b!1201621) (not b!1201599) (not b!1201606) (not b_next!25857) (not bm!57483) (not b!1201619) (not b_lambda!21053) (not b!1201623) (not bm!57488) (not b!1201615))
(check-sat b_and!42603 (not b_next!25857))
