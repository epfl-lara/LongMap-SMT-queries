; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100544 () Bool)

(assert start!100544)

(declare-fun b_free!25873 () Bool)

(declare-fun b_next!25873 () Bool)

(assert (=> start!100544 (= b_free!25873 (not b_next!25873))))

(declare-fun tp!90608 () Bool)

(declare-fun b_and!42611 () Bool)

(assert (=> start!100544 (= tp!90608 b_and!42611)))

(declare-fun b!1202091 () Bool)

(declare-fun e!682606 () Bool)

(declare-fun tp_is_empty!30577 () Bool)

(assert (=> b!1202091 (= e!682606 tp_is_empty!30577)))

(declare-fun b!1202092 () Bool)

(declare-fun e!682611 () Bool)

(declare-datatypes ((V!45897 0))(
  ( (V!45898 (val!15345 Int)) )
))
(declare-datatypes ((tuple2!19740 0))(
  ( (tuple2!19741 (_1!9881 (_ BitVec 64)) (_2!9881 V!45897)) )
))
(declare-datatypes ((List!26527 0))(
  ( (Nil!26524) (Cons!26523 (h!27732 tuple2!19740) (t!39371 List!26527)) )
))
(declare-datatypes ((ListLongMap!17709 0))(
  ( (ListLongMap!17710 (toList!8870 List!26527)) )
))
(declare-fun call!57654 () ListLongMap!17709)

(declare-fun call!57660 () ListLongMap!17709)

(assert (=> b!1202092 (= e!682611 (= call!57654 call!57660))))

(declare-fun b!1202093 () Bool)

(declare-fun e!682605 () Bool)

(declare-fun e!682613 () Bool)

(assert (=> b!1202093 (= e!682605 e!682613)))

(declare-fun res!800129 () Bool)

(assert (=> b!1202093 (=> res!800129 e!682613)))

(declare-datatypes ((array!77846 0))(
  ( (array!77847 (arr!37568 (Array (_ BitVec 32) (_ BitVec 64))) (size!38106 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77846)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1202093 (= res!800129 (not (= (select (arr!37568 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202093 e!682611))

(declare-fun c!117610 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202093 (= c!117610 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!45897)

(declare-datatypes ((Unit!39703 0))(
  ( (Unit!39704) )
))
(declare-fun lt!544685 () Unit!39703)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14579 0))(
  ( (ValueCellFull!14579 (v!17982 V!45897)) (EmptyCell!14579) )
))
(declare-datatypes ((array!77848 0))(
  ( (array!77849 (arr!37569 (Array (_ BitVec 32) ValueCell!14579)) (size!38107 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77848)

(declare-fun minValue!944 () V!45897)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1015 (array!77846 array!77848 (_ BitVec 32) (_ BitVec 32) V!45897 V!45897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39703)

(assert (=> b!1202093 (= lt!544685 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1015 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!117611 () Bool)

(declare-fun call!57657 () ListLongMap!17709)

(declare-fun lt!544684 () ListLongMap!17709)

(declare-fun call!57655 () Bool)

(declare-fun bm!57650 () Bool)

(declare-fun contains!6864 (ListLongMap!17709 (_ BitVec 64)) Bool)

(assert (=> bm!57650 (= call!57655 (contains!6864 (ite c!117611 lt!544684 call!57657) k0!934))))

(declare-fun lt!544683 () ListLongMap!17709)

(declare-fun call!57659 () ListLongMap!17709)

(declare-fun c!117612 () Bool)

(declare-fun bm!57651 () Bool)

(declare-fun +!4006 (ListLongMap!17709 tuple2!19740) ListLongMap!17709)

(assert (=> bm!57651 (= call!57659 (+!4006 (ite c!117611 lt!544684 lt!544683) (ite c!117611 (tuple2!19741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117612 (tuple2!19741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202094 () Bool)

(declare-fun e!682607 () Bool)

(assert (=> b!1202094 (= e!682613 e!682607)))

(declare-fun res!800132 () Bool)

(assert (=> b!1202094 (=> res!800132 e!682607)))

(assert (=> b!1202094 (= res!800132 (not (contains!6864 lt!544683 k0!934)))))

(declare-fun getCurrentListMapNoExtraKeys!5317 (array!77846 array!77848 (_ BitVec 32) (_ BitVec 32) V!45897 V!45897 (_ BitVec 32) Int) ListLongMap!17709)

(assert (=> b!1202094 (= lt!544683 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202095 () Bool)

(declare-fun e!682609 () Unit!39703)

(declare-fun Unit!39705 () Unit!39703)

(assert (=> b!1202095 (= e!682609 Unit!39705)))

(declare-fun b!1202096 () Bool)

(declare-fun res!800141 () Bool)

(declare-fun e!682603 () Bool)

(assert (=> b!1202096 (=> (not res!800141) (not e!682603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202096 (= res!800141 (validKeyInArray!0 k0!934))))

(declare-fun b!1202097 () Bool)

(declare-fun res!800142 () Bool)

(declare-fun e!682612 () Bool)

(assert (=> b!1202097 (=> (not res!800142) (not e!682612))))

(declare-fun lt!544687 () array!77846)

(declare-datatypes ((List!26528 0))(
  ( (Nil!26525) (Cons!26524 (h!27733 (_ BitVec 64)) (t!39372 List!26528)) )
))
(declare-fun arrayNoDuplicates!0 (array!77846 (_ BitVec 32) List!26528) Bool)

(assert (=> b!1202097 (= res!800142 (arrayNoDuplicates!0 lt!544687 #b00000000000000000000000000000000 Nil!26525))))

(declare-fun b!1202098 () Bool)

(declare-fun e!682615 () Bool)

(assert (=> b!1202098 (= e!682615 tp_is_empty!30577)))

(declare-fun b!1202099 () Bool)

(declare-fun lt!544688 () Unit!39703)

(assert (=> b!1202099 (= e!682609 lt!544688)))

(declare-fun call!57658 () Unit!39703)

(assert (=> b!1202099 (= lt!544688 call!57658)))

(declare-fun call!57653 () Bool)

(assert (=> b!1202099 call!57653))

(declare-fun bm!57652 () Bool)

(declare-fun call!57656 () Unit!39703)

(assert (=> bm!57652 (= call!57658 call!57656)))

(declare-fun res!800136 () Bool)

(assert (=> start!100544 (=> (not res!800136) (not e!682603))))

(assert (=> start!100544 (= res!800136 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38106 _keys!1208))))))

(assert (=> start!100544 e!682603))

(assert (=> start!100544 tp_is_empty!30577))

(declare-fun array_inv!28736 (array!77846) Bool)

(assert (=> start!100544 (array_inv!28736 _keys!1208)))

(assert (=> start!100544 true))

(assert (=> start!100544 tp!90608))

(declare-fun e!682602 () Bool)

(declare-fun array_inv!28737 (array!77848) Bool)

(assert (=> start!100544 (and (array_inv!28737 _values!996) e!682602)))

(declare-fun mapIsEmpty!47708 () Bool)

(declare-fun mapRes!47708 () Bool)

(assert (=> mapIsEmpty!47708 mapRes!47708))

(declare-fun b!1202100 () Bool)

(assert (=> b!1202100 (= e!682602 (and e!682615 mapRes!47708))))

(declare-fun condMapEmpty!47708 () Bool)

(declare-fun mapDefault!47708 () ValueCell!14579)

(assert (=> b!1202100 (= condMapEmpty!47708 (= (arr!37569 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14579)) mapDefault!47708)))))

(declare-fun b!1202101 () Bool)

(assert (=> b!1202101 (= e!682607 true)))

(declare-fun lt!544694 () Unit!39703)

(declare-fun e!682610 () Unit!39703)

(assert (=> b!1202101 (= lt!544694 e!682610)))

(declare-fun lt!544690 () Bool)

(assert (=> b!1202101 (= c!117611 (and (not lt!544690) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202101 (= lt!544690 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202102 () Bool)

(declare-fun res!800134 () Bool)

(assert (=> b!1202102 (=> (not res!800134) (not e!682603))))

(assert (=> b!1202102 (= res!800134 (and (= (size!38107 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38106 _keys!1208) (size!38107 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47708 () Bool)

(declare-fun tp!90609 () Bool)

(assert (=> mapNonEmpty!47708 (= mapRes!47708 (and tp!90609 e!682606))))

(declare-fun mapKey!47708 () (_ BitVec 32))

(declare-fun mapValue!47708 () ValueCell!14579)

(declare-fun mapRest!47708 () (Array (_ BitVec 32) ValueCell!14579))

(assert (=> mapNonEmpty!47708 (= (arr!37569 _values!996) (store mapRest!47708 mapKey!47708 mapValue!47708))))

(declare-fun b!1202103 () Bool)

(declare-fun e!682604 () Bool)

(assert (=> b!1202103 (= e!682612 (not e!682604))))

(declare-fun res!800130 () Bool)

(assert (=> b!1202103 (=> res!800130 e!682604)))

(assert (=> b!1202103 (= res!800130 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202103 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544696 () Unit!39703)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77846 (_ BitVec 64) (_ BitVec 32)) Unit!39703)

(assert (=> b!1202103 (= lt!544696 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!57653 () Bool)

(declare-fun addStillContains!990 (ListLongMap!17709 (_ BitVec 64) V!45897 (_ BitVec 64)) Unit!39703)

(assert (=> bm!57653 (= call!57656 (addStillContains!990 lt!544683 (ite (or c!117611 c!117612) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117611 c!117612) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1202104 () Bool)

(declare-fun res!800131 () Bool)

(assert (=> b!1202104 (=> (not res!800131) (not e!682603))))

(assert (=> b!1202104 (= res!800131 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26525))))

(declare-fun b!1202105 () Bool)

(declare-fun res!800137 () Bool)

(assert (=> b!1202105 (=> (not res!800137) (not e!682603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202105 (= res!800137 (validMask!0 mask!1564))))

(declare-fun b!1202106 () Bool)

(declare-fun -!1766 (ListLongMap!17709 (_ BitVec 64)) ListLongMap!17709)

(assert (=> b!1202106 (= e!682611 (= call!57654 (-!1766 call!57660 k0!934)))))

(declare-fun b!1202107 () Bool)

(assert (=> b!1202107 (= e!682603 e!682612)))

(declare-fun res!800138 () Bool)

(assert (=> b!1202107 (=> (not res!800138) (not e!682612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77846 (_ BitVec 32)) Bool)

(assert (=> b!1202107 (= res!800138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544687 mask!1564))))

(assert (=> b!1202107 (= lt!544687 (array!77847 (store (arr!37568 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38106 _keys!1208)))))

(declare-fun bm!57654 () Bool)

(assert (=> bm!57654 (= call!57657 call!57659)))

(declare-fun b!1202108 () Bool)

(declare-fun lt!544691 () Unit!39703)

(assert (=> b!1202108 (= e!682610 lt!544691)))

(declare-fun lt!544692 () Unit!39703)

(assert (=> b!1202108 (= lt!544692 call!57656)))

(assert (=> b!1202108 (= lt!544684 (+!4006 lt!544683 (tuple2!19741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1202108 call!57655))

(assert (=> b!1202108 (= lt!544691 (addStillContains!990 lt!544684 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1202108 (contains!6864 call!57659 k0!934)))

(declare-fun b!1202109 () Bool)

(declare-fun res!800135 () Bool)

(assert (=> b!1202109 (=> (not res!800135) (not e!682603))))

(assert (=> b!1202109 (= res!800135 (= (select (arr!37568 _keys!1208) i!673) k0!934))))

(declare-fun b!1202110 () Bool)

(assert (=> b!1202110 call!57653))

(declare-fun lt!544686 () Unit!39703)

(assert (=> b!1202110 (= lt!544686 call!57658)))

(declare-fun e!682614 () Unit!39703)

(assert (=> b!1202110 (= e!682614 lt!544686)))

(declare-fun bm!57655 () Bool)

(assert (=> bm!57655 (= call!57660 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202111 () Bool)

(declare-fun c!117609 () Bool)

(assert (=> b!1202111 (= c!117609 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544690))))

(assert (=> b!1202111 (= e!682614 e!682609)))

(declare-fun b!1202112 () Bool)

(assert (=> b!1202112 (= e!682604 e!682605)))

(declare-fun res!800139 () Bool)

(assert (=> b!1202112 (=> res!800139 e!682605)))

(assert (=> b!1202112 (= res!800139 (not (= from!1455 i!673)))))

(declare-fun lt!544695 () array!77848)

(declare-fun lt!544693 () ListLongMap!17709)

(assert (=> b!1202112 (= lt!544693 (getCurrentListMapNoExtraKeys!5317 lt!544687 lt!544695 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3192 (Int (_ BitVec 64)) V!45897)

(assert (=> b!1202112 (= lt!544695 (array!77849 (store (arr!37569 _values!996) i!673 (ValueCellFull!14579 (dynLambda!3192 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38107 _values!996)))))

(declare-fun lt!544689 () ListLongMap!17709)

(assert (=> b!1202112 (= lt!544689 (getCurrentListMapNoExtraKeys!5317 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202113 () Bool)

(declare-fun res!800140 () Bool)

(assert (=> b!1202113 (=> (not res!800140) (not e!682603))))

(assert (=> b!1202113 (= res!800140 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38106 _keys!1208))))))

(declare-fun bm!57656 () Bool)

(assert (=> bm!57656 (= call!57654 (getCurrentListMapNoExtraKeys!5317 lt!544687 lt!544695 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57657 () Bool)

(assert (=> bm!57657 (= call!57653 call!57655)))

(declare-fun b!1202114 () Bool)

(declare-fun res!800133 () Bool)

(assert (=> b!1202114 (=> (not res!800133) (not e!682603))))

(assert (=> b!1202114 (= res!800133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202115 () Bool)

(assert (=> b!1202115 (= e!682610 e!682614)))

(assert (=> b!1202115 (= c!117612 (and (not lt!544690) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!100544 res!800136) b!1202105))

(assert (= (and b!1202105 res!800137) b!1202102))

(assert (= (and b!1202102 res!800134) b!1202114))

(assert (= (and b!1202114 res!800133) b!1202104))

(assert (= (and b!1202104 res!800131) b!1202113))

(assert (= (and b!1202113 res!800140) b!1202096))

(assert (= (and b!1202096 res!800141) b!1202109))

(assert (= (and b!1202109 res!800135) b!1202107))

(assert (= (and b!1202107 res!800138) b!1202097))

(assert (= (and b!1202097 res!800142) b!1202103))

(assert (= (and b!1202103 (not res!800130)) b!1202112))

(assert (= (and b!1202112 (not res!800139)) b!1202093))

(assert (= (and b!1202093 c!117610) b!1202106))

(assert (= (and b!1202093 (not c!117610)) b!1202092))

(assert (= (or b!1202106 b!1202092) bm!57656))

(assert (= (or b!1202106 b!1202092) bm!57655))

(assert (= (and b!1202093 (not res!800129)) b!1202094))

(assert (= (and b!1202094 (not res!800132)) b!1202101))

(assert (= (and b!1202101 c!117611) b!1202108))

(assert (= (and b!1202101 (not c!117611)) b!1202115))

(assert (= (and b!1202115 c!117612) b!1202110))

(assert (= (and b!1202115 (not c!117612)) b!1202111))

(assert (= (and b!1202111 c!117609) b!1202099))

(assert (= (and b!1202111 (not c!117609)) b!1202095))

(assert (= (or b!1202110 b!1202099) bm!57652))

(assert (= (or b!1202110 b!1202099) bm!57654))

(assert (= (or b!1202110 b!1202099) bm!57657))

(assert (= (or b!1202108 bm!57657) bm!57650))

(assert (= (or b!1202108 bm!57652) bm!57653))

(assert (= (or b!1202108 bm!57654) bm!57651))

(assert (= (and b!1202100 condMapEmpty!47708) mapIsEmpty!47708))

(assert (= (and b!1202100 (not condMapEmpty!47708)) mapNonEmpty!47708))

(get-info :version)

(assert (= (and mapNonEmpty!47708 ((_ is ValueCellFull!14579) mapValue!47708)) b!1202091))

(assert (= (and b!1202100 ((_ is ValueCellFull!14579) mapDefault!47708)) b!1202098))

(assert (= start!100544 b!1202100))

(declare-fun b_lambda!21051 () Bool)

(assert (=> (not b_lambda!21051) (not b!1202112)))

(declare-fun t!39370 () Bool)

(declare-fun tb!10665 () Bool)

(assert (=> (and start!100544 (= defaultEntry!1004 defaultEntry!1004) t!39370) tb!10665))

(declare-fun result!21915 () Bool)

(assert (=> tb!10665 (= result!21915 tp_is_empty!30577)))

(assert (=> b!1202112 t!39370))

(declare-fun b_and!42613 () Bool)

(assert (= b_and!42611 (and (=> t!39370 result!21915) b_and!42613)))

(declare-fun m!1107519 () Bool)

(assert (=> bm!57655 m!1107519))

(declare-fun m!1107521 () Bool)

(assert (=> b!1202105 m!1107521))

(declare-fun m!1107523 () Bool)

(assert (=> b!1202097 m!1107523))

(declare-fun m!1107525 () Bool)

(assert (=> mapNonEmpty!47708 m!1107525))

(declare-fun m!1107527 () Bool)

(assert (=> bm!57650 m!1107527))

(declare-fun m!1107529 () Bool)

(assert (=> b!1202107 m!1107529))

(declare-fun m!1107531 () Bool)

(assert (=> b!1202107 m!1107531))

(declare-fun m!1107533 () Bool)

(assert (=> b!1202096 m!1107533))

(declare-fun m!1107535 () Bool)

(assert (=> b!1202093 m!1107535))

(declare-fun m!1107537 () Bool)

(assert (=> b!1202093 m!1107537))

(declare-fun m!1107539 () Bool)

(assert (=> b!1202114 m!1107539))

(declare-fun m!1107541 () Bool)

(assert (=> b!1202108 m!1107541))

(declare-fun m!1107543 () Bool)

(assert (=> b!1202108 m!1107543))

(declare-fun m!1107545 () Bool)

(assert (=> b!1202108 m!1107545))

(declare-fun m!1107547 () Bool)

(assert (=> b!1202112 m!1107547))

(declare-fun m!1107549 () Bool)

(assert (=> b!1202112 m!1107549))

(declare-fun m!1107551 () Bool)

(assert (=> b!1202112 m!1107551))

(declare-fun m!1107553 () Bool)

(assert (=> b!1202112 m!1107553))

(declare-fun m!1107555 () Bool)

(assert (=> b!1202106 m!1107555))

(declare-fun m!1107557 () Bool)

(assert (=> start!100544 m!1107557))

(declare-fun m!1107559 () Bool)

(assert (=> start!100544 m!1107559))

(declare-fun m!1107561 () Bool)

(assert (=> b!1202109 m!1107561))

(declare-fun m!1107563 () Bool)

(assert (=> bm!57651 m!1107563))

(declare-fun m!1107565 () Bool)

(assert (=> b!1202103 m!1107565))

(declare-fun m!1107567 () Bool)

(assert (=> b!1202103 m!1107567))

(declare-fun m!1107569 () Bool)

(assert (=> b!1202104 m!1107569))

(declare-fun m!1107571 () Bool)

(assert (=> bm!57656 m!1107571))

(declare-fun m!1107573 () Bool)

(assert (=> b!1202094 m!1107573))

(assert (=> b!1202094 m!1107519))

(declare-fun m!1107575 () Bool)

(assert (=> bm!57653 m!1107575))

(check-sat (not b_lambda!21051) (not b!1202105) (not start!100544) (not b_next!25873) (not b!1202108) (not bm!57651) (not bm!57655) (not b!1202107) (not b!1202093) b_and!42613 (not b!1202104) (not b!1202112) (not b!1202096) (not b!1202114) (not bm!57650) (not bm!57653) tp_is_empty!30577 (not b!1202094) (not mapNonEmpty!47708) (not b!1202103) (not b!1202097) (not bm!57656) (not b!1202106))
(check-sat b_and!42613 (not b_next!25873))
