; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100550 () Bool)

(assert start!100550)

(declare-fun b_free!25879 () Bool)

(declare-fun b_next!25879 () Bool)

(assert (=> start!100550 (= b_free!25879 (not b_next!25879))))

(declare-fun tp!90626 () Bool)

(declare-fun b_and!42623 () Bool)

(assert (=> start!100550 (= tp!90626 b_and!42623)))

(declare-fun b!1202322 () Bool)

(declare-datatypes ((Unit!39711 0))(
  ( (Unit!39712) )
))
(declare-fun e!682731 () Unit!39711)

(declare-fun Unit!39713 () Unit!39711)

(assert (=> b!1202322 (= e!682731 Unit!39713)))

(declare-fun bm!57722 () Bool)

(declare-datatypes ((V!45905 0))(
  ( (V!45906 (val!15348 Int)) )
))
(declare-datatypes ((tuple2!19744 0))(
  ( (tuple2!19745 (_1!9883 (_ BitVec 64)) (_2!9883 V!45905)) )
))
(declare-datatypes ((List!26531 0))(
  ( (Nil!26528) (Cons!26527 (h!27736 tuple2!19744) (t!39381 List!26531)) )
))
(declare-datatypes ((ListLongMap!17713 0))(
  ( (ListLongMap!17714 (toList!8872 List!26531)) )
))
(declare-fun call!57729 () ListLongMap!17713)

(declare-fun call!57728 () ListLongMap!17713)

(assert (=> bm!57722 (= call!57729 call!57728)))

(declare-fun bm!57723 () Bool)

(declare-fun call!57727 () Unit!39711)

(declare-fun call!57725 () Unit!39711)

(assert (=> bm!57723 (= call!57727 call!57725)))

(declare-fun b!1202324 () Bool)

(declare-fun e!682733 () Unit!39711)

(declare-fun lt!544809 () Unit!39711)

(assert (=> b!1202324 (= e!682733 lt!544809)))

(declare-fun lt!544810 () Unit!39711)

(assert (=> b!1202324 (= lt!544810 call!57725)))

(declare-fun lt!544819 () ListLongMap!17713)

(declare-fun lt!544813 () ListLongMap!17713)

(declare-fun zeroValue!944 () V!45905)

(declare-fun +!4007 (ListLongMap!17713 tuple2!19744) ListLongMap!17713)

(assert (=> b!1202324 (= lt!544819 (+!4007 lt!544813 (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57730 () Bool)

(assert (=> b!1202324 call!57730))

(declare-fun minValue!944 () V!45905)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!991 (ListLongMap!17713 (_ BitVec 64) V!45905 (_ BitVec 64)) Unit!39711)

(assert (=> b!1202324 (= lt!544809 (addStillContains!991 lt!544819 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6866 (ListLongMap!17713 (_ BitVec 64)) Bool)

(assert (=> b!1202324 (contains!6866 call!57728 k0!934)))

(declare-fun bm!57724 () Bool)

(declare-fun c!117645 () Bool)

(assert (=> bm!57724 (= call!57730 (contains!6866 (ite c!117645 lt!544819 call!57729) k0!934))))

(declare-datatypes ((array!77856 0))(
  ( (array!77857 (arr!37573 (Array (_ BitVec 32) (_ BitVec 64))) (size!38111 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77856)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57725 () Bool)

(declare-datatypes ((ValueCell!14582 0))(
  ( (ValueCellFull!14582 (v!17985 V!45905)) (EmptyCell!14582) )
))
(declare-datatypes ((array!77858 0))(
  ( (array!77859 (arr!37574 (Array (_ BitVec 32) ValueCell!14582)) (size!38112 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77858)

(declare-fun call!57732 () ListLongMap!17713)

(declare-fun getCurrentListMapNoExtraKeys!5319 (array!77856 array!77858 (_ BitVec 32) (_ BitVec 32) V!45905 V!45905 (_ BitVec 32) Int) ListLongMap!17713)

(assert (=> bm!57725 (= call!57732 (getCurrentListMapNoExtraKeys!5319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57726 () Bool)

(declare-fun call!57726 () Bool)

(assert (=> bm!57726 (= call!57726 call!57730)))

(declare-fun b!1202325 () Bool)

(declare-fun c!117646 () Bool)

(declare-fun lt!544812 () Bool)

(assert (=> b!1202325 (= c!117646 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544812))))

(declare-fun e!682738 () Unit!39711)

(assert (=> b!1202325 (= e!682738 e!682731)))

(declare-fun b!1202326 () Bool)

(declare-fun e!682732 () Bool)

(declare-fun e!682729 () Bool)

(assert (=> b!1202326 (= e!682732 (not e!682729))))

(declare-fun res!800262 () Bool)

(assert (=> b!1202326 (=> res!800262 e!682729)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202326 (= res!800262 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202326 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544817 () Unit!39711)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77856 (_ BitVec 64) (_ BitVec 32)) Unit!39711)

(assert (=> b!1202326 (= lt!544817 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202327 () Bool)

(declare-fun res!800263 () Bool)

(assert (=> b!1202327 (=> (not res!800263) (not e!682732))))

(declare-fun lt!544816 () array!77856)

(declare-datatypes ((List!26532 0))(
  ( (Nil!26529) (Cons!26528 (h!27737 (_ BitVec 64)) (t!39382 List!26532)) )
))
(declare-fun arrayNoDuplicates!0 (array!77856 (_ BitVec 32) List!26532) Bool)

(assert (=> b!1202327 (= res!800263 (arrayNoDuplicates!0 lt!544816 #b00000000000000000000000000000000 Nil!26529))))

(declare-fun b!1202328 () Bool)

(declare-fun res!800255 () Bool)

(declare-fun e!682737 () Bool)

(assert (=> b!1202328 (=> (not res!800255) (not e!682737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202328 (= res!800255 (validKeyInArray!0 k0!934))))

(declare-fun b!1202329 () Bool)

(declare-fun res!800268 () Bool)

(assert (=> b!1202329 (=> (not res!800268) (not e!682737))))

(assert (=> b!1202329 (= res!800268 (and (= (size!38112 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38111 _keys!1208) (size!38112 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202330 () Bool)

(declare-fun lt!544818 () Unit!39711)

(assert (=> b!1202330 (= e!682731 lt!544818)))

(assert (=> b!1202330 (= lt!544818 call!57727)))

(assert (=> b!1202330 call!57726))

(declare-fun b!1202331 () Bool)

(declare-fun e!682728 () Bool)

(declare-fun e!682740 () Bool)

(assert (=> b!1202331 (= e!682728 e!682740)))

(declare-fun res!800257 () Bool)

(assert (=> b!1202331 (=> res!800257 e!682740)))

(assert (=> b!1202331 (= res!800257 (not (= (select (arr!37573 _keys!1208) from!1455) k0!934)))))

(declare-fun e!682741 () Bool)

(assert (=> b!1202331 e!682741))

(declare-fun c!117647 () Bool)

(assert (=> b!1202331 (= c!117647 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544822 () Unit!39711)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 (array!77856 array!77858 (_ BitVec 32) (_ BitVec 32) V!45905 V!45905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39711)

(assert (=> b!1202331 (= lt!544822 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202332 () Bool)

(declare-fun e!682730 () Bool)

(declare-fun e!682735 () Bool)

(declare-fun mapRes!47717 () Bool)

(assert (=> b!1202332 (= e!682730 (and e!682735 mapRes!47717))))

(declare-fun condMapEmpty!47717 () Bool)

(declare-fun mapDefault!47717 () ValueCell!14582)

(assert (=> b!1202332 (= condMapEmpty!47717 (= (arr!37574 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14582)) mapDefault!47717)))))

(declare-fun res!800266 () Bool)

(assert (=> start!100550 (=> (not res!800266) (not e!682737))))

(assert (=> start!100550 (= res!800266 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38111 _keys!1208))))))

(assert (=> start!100550 e!682737))

(declare-fun tp_is_empty!30583 () Bool)

(assert (=> start!100550 tp_is_empty!30583))

(declare-fun array_inv!28738 (array!77856) Bool)

(assert (=> start!100550 (array_inv!28738 _keys!1208)))

(assert (=> start!100550 true))

(assert (=> start!100550 tp!90626))

(declare-fun array_inv!28739 (array!77858) Bool)

(assert (=> start!100550 (and (array_inv!28739 _values!996) e!682730)))

(declare-fun b!1202323 () Bool)

(declare-fun res!800260 () Bool)

(assert (=> b!1202323 (=> (not res!800260) (not e!682737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202323 (= res!800260 (validMask!0 mask!1564))))

(declare-fun b!1202333 () Bool)

(declare-fun e!682736 () Bool)

(assert (=> b!1202333 (= e!682740 e!682736)))

(declare-fun res!800265 () Bool)

(assert (=> b!1202333 (=> res!800265 e!682736)))

(assert (=> b!1202333 (= res!800265 (not (contains!6866 lt!544813 k0!934)))))

(assert (=> b!1202333 (= lt!544813 (getCurrentListMapNoExtraKeys!5319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202334 () Bool)

(declare-fun res!800259 () Bool)

(assert (=> b!1202334 (=> (not res!800259) (not e!682737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77856 (_ BitVec 32)) Bool)

(assert (=> b!1202334 (= res!800259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202335 () Bool)

(assert (=> b!1202335 (= e!682737 e!682732)))

(declare-fun res!800267 () Bool)

(assert (=> b!1202335 (=> (not res!800267) (not e!682732))))

(assert (=> b!1202335 (= res!800267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544816 mask!1564))))

(assert (=> b!1202335 (= lt!544816 (array!77857 (store (arr!37573 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38111 _keys!1208)))))

(declare-fun b!1202336 () Bool)

(assert (=> b!1202336 (= e!682736 true)))

(declare-fun lt!544821 () Unit!39711)

(assert (=> b!1202336 (= lt!544821 e!682733)))

(assert (=> b!1202336 (= c!117645 (and (not lt!544812) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202336 (= lt!544812 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202337 () Bool)

(assert (=> b!1202337 (= e!682733 e!682738)))

(declare-fun c!117648 () Bool)

(assert (=> b!1202337 (= c!117648 (and (not lt!544812) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!57731 () ListLongMap!17713)

(declare-fun b!1202338 () Bool)

(declare-fun -!1767 (ListLongMap!17713 (_ BitVec 64)) ListLongMap!17713)

(assert (=> b!1202338 (= e!682741 (= call!57731 (-!1767 call!57732 k0!934)))))

(declare-fun b!1202339 () Bool)

(assert (=> b!1202339 (= e!682735 tp_is_empty!30583)))

(declare-fun b!1202340 () Bool)

(declare-fun e!682734 () Bool)

(assert (=> b!1202340 (= e!682734 tp_is_empty!30583)))

(declare-fun b!1202341 () Bool)

(declare-fun res!800261 () Bool)

(assert (=> b!1202341 (=> (not res!800261) (not e!682737))))

(assert (=> b!1202341 (= res!800261 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26529))))

(declare-fun lt!544815 () array!77858)

(declare-fun bm!57727 () Bool)

(assert (=> bm!57727 (= call!57731 (getCurrentListMapNoExtraKeys!5319 lt!544816 lt!544815 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202342 () Bool)

(declare-fun res!800264 () Bool)

(assert (=> b!1202342 (=> (not res!800264) (not e!682737))))

(assert (=> b!1202342 (= res!800264 (= (select (arr!37573 _keys!1208) i!673) k0!934))))

(declare-fun bm!57728 () Bool)

(assert (=> bm!57728 (= call!57728 (+!4007 (ite c!117645 lt!544819 lt!544813) (ite c!117645 (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117648 (tuple2!19745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202343 () Bool)

(declare-fun res!800258 () Bool)

(assert (=> b!1202343 (=> (not res!800258) (not e!682737))))

(assert (=> b!1202343 (= res!800258 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38111 _keys!1208))))))

(declare-fun b!1202344 () Bool)

(assert (=> b!1202344 (= e!682741 (= call!57731 call!57732))))

(declare-fun b!1202345 () Bool)

(assert (=> b!1202345 call!57726))

(declare-fun lt!544820 () Unit!39711)

(assert (=> b!1202345 (= lt!544820 call!57727)))

(assert (=> b!1202345 (= e!682738 lt!544820)))

(declare-fun bm!57729 () Bool)

(assert (=> bm!57729 (= call!57725 (addStillContains!991 lt!544813 (ite (or c!117645 c!117648) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117645 c!117648) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!47717 () Bool)

(assert (=> mapIsEmpty!47717 mapRes!47717))

(declare-fun mapNonEmpty!47717 () Bool)

(declare-fun tp!90627 () Bool)

(assert (=> mapNonEmpty!47717 (= mapRes!47717 (and tp!90627 e!682734))))

(declare-fun mapKey!47717 () (_ BitVec 32))

(declare-fun mapValue!47717 () ValueCell!14582)

(declare-fun mapRest!47717 () (Array (_ BitVec 32) ValueCell!14582))

(assert (=> mapNonEmpty!47717 (= (arr!37574 _values!996) (store mapRest!47717 mapKey!47717 mapValue!47717))))

(declare-fun b!1202346 () Bool)

(assert (=> b!1202346 (= e!682729 e!682728)))

(declare-fun res!800256 () Bool)

(assert (=> b!1202346 (=> res!800256 e!682728)))

(assert (=> b!1202346 (= res!800256 (not (= from!1455 i!673)))))

(declare-fun lt!544814 () ListLongMap!17713)

(assert (=> b!1202346 (= lt!544814 (getCurrentListMapNoExtraKeys!5319 lt!544816 lt!544815 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3194 (Int (_ BitVec 64)) V!45905)

(assert (=> b!1202346 (= lt!544815 (array!77859 (store (arr!37574 _values!996) i!673 (ValueCellFull!14582 (dynLambda!3194 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38112 _values!996)))))

(declare-fun lt!544811 () ListLongMap!17713)

(assert (=> b!1202346 (= lt!544811 (getCurrentListMapNoExtraKeys!5319 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100550 res!800266) b!1202323))

(assert (= (and b!1202323 res!800260) b!1202329))

(assert (= (and b!1202329 res!800268) b!1202334))

(assert (= (and b!1202334 res!800259) b!1202341))

(assert (= (and b!1202341 res!800261) b!1202343))

(assert (= (and b!1202343 res!800258) b!1202328))

(assert (= (and b!1202328 res!800255) b!1202342))

(assert (= (and b!1202342 res!800264) b!1202335))

(assert (= (and b!1202335 res!800267) b!1202327))

(assert (= (and b!1202327 res!800263) b!1202326))

(assert (= (and b!1202326 (not res!800262)) b!1202346))

(assert (= (and b!1202346 (not res!800256)) b!1202331))

(assert (= (and b!1202331 c!117647) b!1202338))

(assert (= (and b!1202331 (not c!117647)) b!1202344))

(assert (= (or b!1202338 b!1202344) bm!57727))

(assert (= (or b!1202338 b!1202344) bm!57725))

(assert (= (and b!1202331 (not res!800257)) b!1202333))

(assert (= (and b!1202333 (not res!800265)) b!1202336))

(assert (= (and b!1202336 c!117645) b!1202324))

(assert (= (and b!1202336 (not c!117645)) b!1202337))

(assert (= (and b!1202337 c!117648) b!1202345))

(assert (= (and b!1202337 (not c!117648)) b!1202325))

(assert (= (and b!1202325 c!117646) b!1202330))

(assert (= (and b!1202325 (not c!117646)) b!1202322))

(assert (= (or b!1202345 b!1202330) bm!57723))

(assert (= (or b!1202345 b!1202330) bm!57722))

(assert (= (or b!1202345 b!1202330) bm!57726))

(assert (= (or b!1202324 bm!57726) bm!57724))

(assert (= (or b!1202324 bm!57723) bm!57729))

(assert (= (or b!1202324 bm!57722) bm!57728))

(assert (= (and b!1202332 condMapEmpty!47717) mapIsEmpty!47717))

(assert (= (and b!1202332 (not condMapEmpty!47717)) mapNonEmpty!47717))

(get-info :version)

(assert (= (and mapNonEmpty!47717 ((_ is ValueCellFull!14582) mapValue!47717)) b!1202340))

(assert (= (and b!1202332 ((_ is ValueCellFull!14582) mapDefault!47717)) b!1202339))

(assert (= start!100550 b!1202332))

(declare-fun b_lambda!21057 () Bool)

(assert (=> (not b_lambda!21057) (not b!1202346)))

(declare-fun t!39380 () Bool)

(declare-fun tb!10671 () Bool)

(assert (=> (and start!100550 (= defaultEntry!1004 defaultEntry!1004) t!39380) tb!10671))

(declare-fun result!21927 () Bool)

(assert (=> tb!10671 (= result!21927 tp_is_empty!30583)))

(assert (=> b!1202346 t!39380))

(declare-fun b_and!42625 () Bool)

(assert (= b_and!42623 (and (=> t!39380 result!21927) b_and!42625)))

(declare-fun m!1107693 () Bool)

(assert (=> b!1202323 m!1107693))

(declare-fun m!1107695 () Bool)

(assert (=> bm!57728 m!1107695))

(declare-fun m!1107697 () Bool)

(assert (=> b!1202335 m!1107697))

(declare-fun m!1107699 () Bool)

(assert (=> b!1202335 m!1107699))

(declare-fun m!1107701 () Bool)

(assert (=> b!1202326 m!1107701))

(declare-fun m!1107703 () Bool)

(assert (=> b!1202326 m!1107703))

(declare-fun m!1107705 () Bool)

(assert (=> b!1202328 m!1107705))

(declare-fun m!1107707 () Bool)

(assert (=> bm!57724 m!1107707))

(declare-fun m!1107709 () Bool)

(assert (=> bm!57727 m!1107709))

(declare-fun m!1107711 () Bool)

(assert (=> b!1202327 m!1107711))

(declare-fun m!1107713 () Bool)

(assert (=> bm!57729 m!1107713))

(declare-fun m!1107715 () Bool)

(assert (=> b!1202324 m!1107715))

(declare-fun m!1107717 () Bool)

(assert (=> b!1202324 m!1107717))

(declare-fun m!1107719 () Bool)

(assert (=> b!1202324 m!1107719))

(declare-fun m!1107721 () Bool)

(assert (=> mapNonEmpty!47717 m!1107721))

(declare-fun m!1107723 () Bool)

(assert (=> b!1202342 m!1107723))

(declare-fun m!1107725 () Bool)

(assert (=> bm!57725 m!1107725))

(declare-fun m!1107727 () Bool)

(assert (=> b!1202334 m!1107727))

(declare-fun m!1107729 () Bool)

(assert (=> b!1202338 m!1107729))

(declare-fun m!1107731 () Bool)

(assert (=> b!1202346 m!1107731))

(declare-fun m!1107733 () Bool)

(assert (=> b!1202346 m!1107733))

(declare-fun m!1107735 () Bool)

(assert (=> b!1202346 m!1107735))

(declare-fun m!1107737 () Bool)

(assert (=> b!1202346 m!1107737))

(declare-fun m!1107739 () Bool)

(assert (=> b!1202341 m!1107739))

(declare-fun m!1107741 () Bool)

(assert (=> start!100550 m!1107741))

(declare-fun m!1107743 () Bool)

(assert (=> start!100550 m!1107743))

(declare-fun m!1107745 () Bool)

(assert (=> b!1202333 m!1107745))

(assert (=> b!1202333 m!1107725))

(declare-fun m!1107747 () Bool)

(assert (=> b!1202331 m!1107747))

(declare-fun m!1107749 () Bool)

(assert (=> b!1202331 m!1107749))

(check-sat (not b!1202323) (not bm!57727) (not b!1202341) (not b!1202326) (not b_next!25879) tp_is_empty!30583 (not bm!57728) (not mapNonEmpty!47717) (not b!1202324) (not b!1202346) (not b_lambda!21057) (not bm!57725) (not bm!57724) (not b!1202327) (not b!1202338) (not b!1202331) (not b!1202334) (not b!1202328) (not b!1202335) (not b!1202333) (not bm!57729) b_and!42625 (not start!100550))
(check-sat b_and!42625 (not b_next!25879))
