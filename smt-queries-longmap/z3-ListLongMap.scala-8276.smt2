; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100758 () Bool)

(assert start!100758)

(declare-fun b_free!25929 () Bool)

(declare-fun b_next!25929 () Bool)

(assert (=> start!100758 (= b_free!25929 (not b_next!25929))))

(declare-fun tp!90790 () Bool)

(declare-fun b_and!42841 () Bool)

(assert (=> start!100758 (= tp!90790 b_and!42841)))

(declare-datatypes ((V!45971 0))(
  ( (V!45972 (val!15373 Int)) )
))
(declare-fun zeroValue!944 () V!45971)

(declare-fun c!118297 () Bool)

(declare-datatypes ((tuple2!19718 0))(
  ( (tuple2!19719 (_1!9870 (_ BitVec 64)) (_2!9870 V!45971)) )
))
(declare-datatypes ((List!26524 0))(
  ( (Nil!26521) (Cons!26520 (h!27729 tuple2!19718) (t!39433 List!26524)) )
))
(declare-datatypes ((ListLongMap!17687 0))(
  ( (ListLongMap!17688 (toList!8859 List!26524)) )
))
(declare-fun call!58478 () ListLongMap!17687)

(declare-fun lt!546799 () ListLongMap!17687)

(declare-fun minValue!944 () V!45971)

(declare-fun lt!546787 () ListLongMap!17687)

(declare-fun c!118298 () Bool)

(declare-fun bm!58473 () Bool)

(declare-fun +!3983 (ListLongMap!17687 tuple2!19718) ListLongMap!17687)

(assert (=> bm!58473 (= call!58478 (+!3983 (ite c!118297 lt!546787 lt!546799) (ite c!118297 (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118298 (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1205521 () Bool)

(declare-fun e!684608 () Bool)

(declare-fun call!58477 () ListLongMap!17687)

(declare-fun call!58481 () ListLongMap!17687)

(assert (=> b!1205521 (= e!684608 (= call!58477 call!58481))))

(declare-fun mapIsEmpty!47805 () Bool)

(declare-fun mapRes!47805 () Bool)

(assert (=> mapIsEmpty!47805 mapRes!47805))

(declare-fun b!1205522 () Bool)

(declare-fun res!801834 () Bool)

(declare-fun e!684605 () Bool)

(assert (=> b!1205522 (=> (not res!801834) (not e!684605))))

(declare-datatypes ((array!78047 0))(
  ( (array!78048 (arr!37664 (Array (_ BitVec 32) (_ BitVec 64))) (size!38200 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78047)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78047 (_ BitVec 32)) Bool)

(assert (=> b!1205522 (= res!801834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205523 () Bool)

(declare-fun e!684602 () Bool)

(declare-fun e!684606 () Bool)

(assert (=> b!1205523 (= e!684602 e!684606)))

(declare-fun res!801836 () Bool)

(assert (=> b!1205523 (=> res!801836 e!684606)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1205523 (= res!801836 (not (= (select (arr!37664 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1205523 e!684608))

(declare-fun c!118299 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1205523 (= c!118299 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!39966 0))(
  ( (Unit!39967) )
))
(declare-fun lt!546794 () Unit!39966)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14607 0))(
  ( (ValueCellFull!14607 (v!18017 V!45971)) (EmptyCell!14607) )
))
(declare-datatypes ((array!78049 0))(
  ( (array!78050 (arr!37665 (Array (_ BitVec 32) ValueCell!14607)) (size!38201 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78049)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1027 (array!78047 array!78049 (_ BitVec 32) (_ BitVec 32) V!45971 V!45971 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39966)

(assert (=> b!1205523 (= lt!546794 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1027 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58474 () Bool)

(declare-fun call!58482 () Bool)

(declare-fun call!58483 () Bool)

(assert (=> bm!58474 (= call!58482 call!58483)))

(declare-fun bm!58475 () Bool)

(declare-fun call!58480 () Unit!39966)

(declare-fun call!58476 () Unit!39966)

(assert (=> bm!58475 (= call!58480 call!58476)))

(declare-fun b!1205524 () Bool)

(declare-fun c!118296 () Bool)

(declare-fun lt!546793 () Bool)

(assert (=> b!1205524 (= c!118296 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546793))))

(declare-fun e!684601 () Unit!39966)

(declare-fun e!684612 () Unit!39966)

(assert (=> b!1205524 (= e!684601 e!684612)))

(declare-fun b!1205525 () Bool)

(declare-fun res!801841 () Bool)

(assert (=> b!1205525 (=> (not res!801841) (not e!684605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205525 (= res!801841 (validMask!0 mask!1564))))

(declare-fun b!1205526 () Bool)

(assert (=> b!1205526 call!58482))

(declare-fun lt!546798 () Unit!39966)

(assert (=> b!1205526 (= lt!546798 call!58480)))

(assert (=> b!1205526 (= e!684601 lt!546798)))

(declare-fun bm!58476 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5294 (array!78047 array!78049 (_ BitVec 32) (_ BitVec 32) V!45971 V!45971 (_ BitVec 32) Int) ListLongMap!17687)

(assert (=> bm!58476 (= call!58481 (getCurrentListMapNoExtraKeys!5294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546791 () array!78049)

(declare-fun bm!58477 () Bool)

(declare-fun lt!546786 () array!78047)

(assert (=> bm!58477 (= call!58477 (getCurrentListMapNoExtraKeys!5294 lt!546786 lt!546791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205527 () Bool)

(declare-fun e!684604 () Bool)

(declare-fun e!684610 () Bool)

(assert (=> b!1205527 (= e!684604 (and e!684610 mapRes!47805))))

(declare-fun condMapEmpty!47805 () Bool)

(declare-fun mapDefault!47805 () ValueCell!14607)

(assert (=> b!1205527 (= condMapEmpty!47805 (= (arr!37665 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14607)) mapDefault!47805)))))

(declare-fun bm!58478 () Bool)

(declare-fun addStillContains!1012 (ListLongMap!17687 (_ BitVec 64) V!45971 (_ BitVec 64)) Unit!39966)

(assert (=> bm!58478 (= call!58476 (addStillContains!1012 lt!546799 (ite (or c!118297 c!118298) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118297 c!118298) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1205528 () Bool)

(declare-fun res!801835 () Bool)

(assert (=> b!1205528 (=> (not res!801835) (not e!684605))))

(assert (=> b!1205528 (= res!801835 (= (select (arr!37664 _keys!1208) i!673) k0!934))))

(declare-fun e!684614 () Bool)

(declare-fun b!1205529 () Bool)

(assert (=> b!1205529 (= e!684614 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546793) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205530 () Bool)

(declare-fun -!1822 (ListLongMap!17687 (_ BitVec 64)) ListLongMap!17687)

(assert (=> b!1205530 (= e!684608 (= call!58477 (-!1822 call!58481 k0!934)))))

(declare-fun b!1205531 () Bool)

(declare-fun res!801844 () Bool)

(assert (=> b!1205531 (=> (not res!801844) (not e!684605))))

(declare-datatypes ((List!26525 0))(
  ( (Nil!26522) (Cons!26521 (h!27730 (_ BitVec 64)) (t!39434 List!26525)) )
))
(declare-fun arrayNoDuplicates!0 (array!78047 (_ BitVec 32) List!26525) Bool)

(assert (=> b!1205531 (= res!801844 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26522))))

(declare-fun b!1205532 () Bool)

(declare-fun e!684609 () Bool)

(assert (=> b!1205532 (= e!684609 e!684602)))

(declare-fun res!801843 () Bool)

(assert (=> b!1205532 (=> res!801843 e!684602)))

(assert (=> b!1205532 (= res!801843 (not (= from!1455 i!673)))))

(declare-fun lt!546796 () ListLongMap!17687)

(assert (=> b!1205532 (= lt!546796 (getCurrentListMapNoExtraKeys!5294 lt!546786 lt!546791 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3203 (Int (_ BitVec 64)) V!45971)

(assert (=> b!1205532 (= lt!546791 (array!78050 (store (arr!37665 _values!996) i!673 (ValueCellFull!14607 (dynLambda!3203 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38201 _values!996)))))

(declare-fun lt!546790 () ListLongMap!17687)

(assert (=> b!1205532 (= lt!546790 (getCurrentListMapNoExtraKeys!5294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205533 () Bool)

(declare-fun lt!546792 () Unit!39966)

(assert (=> b!1205533 (= e!684612 lt!546792)))

(assert (=> b!1205533 (= lt!546792 call!58480)))

(assert (=> b!1205533 call!58482))

(declare-fun b!1205534 () Bool)

(declare-fun e!684611 () Bool)

(assert (=> b!1205534 (= e!684605 e!684611)))

(declare-fun res!801842 () Bool)

(assert (=> b!1205534 (=> (not res!801842) (not e!684611))))

(assert (=> b!1205534 (= res!801842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546786 mask!1564))))

(assert (=> b!1205534 (= lt!546786 (array!78048 (store (arr!37664 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38200 _keys!1208)))))

(declare-fun b!1205535 () Bool)

(declare-fun arrayContainsKey!0 (array!78047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205535 (= e!684614 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205536 () Bool)

(declare-fun tp_is_empty!30633 () Bool)

(assert (=> b!1205536 (= e!684610 tp_is_empty!30633)))

(declare-fun b!1205537 () Bool)

(declare-fun res!801838 () Bool)

(assert (=> b!1205537 (=> (not res!801838) (not e!684605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205537 (= res!801838 (validKeyInArray!0 k0!934))))

(declare-fun b!1205538 () Bool)

(declare-fun e!684603 () Bool)

(assert (=> b!1205538 (= e!684606 e!684603)))

(declare-fun res!801840 () Bool)

(assert (=> b!1205538 (=> res!801840 e!684603)))

(declare-fun contains!6919 (ListLongMap!17687 (_ BitVec 64)) Bool)

(assert (=> b!1205538 (= res!801840 (not (contains!6919 lt!546799 k0!934)))))

(assert (=> b!1205538 (= lt!546799 (getCurrentListMapNoExtraKeys!5294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205539 () Bool)

(declare-fun e!684607 () Unit!39966)

(declare-fun lt!546788 () Unit!39966)

(assert (=> b!1205539 (= e!684607 lt!546788)))

(declare-fun lt!546789 () Unit!39966)

(assert (=> b!1205539 (= lt!546789 call!58476)))

(assert (=> b!1205539 (= lt!546787 (+!3983 lt!546799 (tuple2!19719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205539 call!58483))

(assert (=> b!1205539 (= lt!546788 (addStillContains!1012 lt!546787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1205539 (contains!6919 call!58478 k0!934)))

(declare-fun res!801845 () Bool)

(assert (=> start!100758 (=> (not res!801845) (not e!684605))))

(assert (=> start!100758 (= res!801845 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38200 _keys!1208))))))

(assert (=> start!100758 e!684605))

(assert (=> start!100758 tp_is_empty!30633))

(declare-fun array_inv!28694 (array!78047) Bool)

(assert (=> start!100758 (array_inv!28694 _keys!1208)))

(assert (=> start!100758 true))

(assert (=> start!100758 tp!90790))

(declare-fun array_inv!28695 (array!78049) Bool)

(assert (=> start!100758 (and (array_inv!28695 _values!996) e!684604)))

(declare-fun call!58479 () ListLongMap!17687)

(declare-fun bm!58479 () Bool)

(assert (=> bm!58479 (= call!58483 (contains!6919 (ite c!118297 lt!546787 call!58479) k0!934))))

(declare-fun b!1205540 () Bool)

(assert (=> b!1205540 (= e!684603 (or (bvsge (size!38200 _keys!1208) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!38200 _keys!1208))))))

(declare-fun e!684599 () Bool)

(assert (=> b!1205540 e!684599))

(declare-fun res!801837 () Bool)

(assert (=> b!1205540 (=> (not res!801837) (not e!684599))))

(assert (=> b!1205540 (= res!801837 e!684614)))

(declare-fun c!118295 () Bool)

(assert (=> b!1205540 (= c!118295 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546795 () Unit!39966)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!567 (array!78047 array!78049 (_ BitVec 32) (_ BitVec 32) V!45971 V!45971 (_ BitVec 64) (_ BitVec 32) Int) Unit!39966)

(assert (=> b!1205540 (= lt!546795 (lemmaListMapContainsThenArrayContainsFrom!567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546797 () Unit!39966)

(assert (=> b!1205540 (= lt!546797 e!684607)))

(assert (=> b!1205540 (= c!118297 (and (not lt!546793) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205540 (= lt!546793 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205541 () Bool)

(declare-fun res!801833 () Bool)

(assert (=> b!1205541 (=> (not res!801833) (not e!684611))))

(assert (=> b!1205541 (= res!801833 (arrayNoDuplicates!0 lt!546786 #b00000000000000000000000000000000 Nil!26522))))

(declare-fun b!1205542 () Bool)

(assert (=> b!1205542 (= e!684599 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1205543 () Bool)

(declare-fun e!684613 () Bool)

(assert (=> b!1205543 (= e!684613 tp_is_empty!30633)))

(declare-fun b!1205544 () Bool)

(assert (=> b!1205544 (= e!684607 e!684601)))

(assert (=> b!1205544 (= c!118298 (and (not lt!546793) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205545 () Bool)

(declare-fun res!801847 () Bool)

(assert (=> b!1205545 (=> (not res!801847) (not e!684605))))

(assert (=> b!1205545 (= res!801847 (and (= (size!38201 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38200 _keys!1208) (size!38201 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205546 () Bool)

(declare-fun Unit!39968 () Unit!39966)

(assert (=> b!1205546 (= e!684612 Unit!39968)))

(declare-fun b!1205547 () Bool)

(declare-fun res!801839 () Bool)

(assert (=> b!1205547 (=> (not res!801839) (not e!684605))))

(assert (=> b!1205547 (= res!801839 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38200 _keys!1208))))))

(declare-fun bm!58480 () Bool)

(assert (=> bm!58480 (= call!58479 call!58478)))

(declare-fun mapNonEmpty!47805 () Bool)

(declare-fun tp!90789 () Bool)

(assert (=> mapNonEmpty!47805 (= mapRes!47805 (and tp!90789 e!684613))))

(declare-fun mapValue!47805 () ValueCell!14607)

(declare-fun mapRest!47805 () (Array (_ BitVec 32) ValueCell!14607))

(declare-fun mapKey!47805 () (_ BitVec 32))

(assert (=> mapNonEmpty!47805 (= (arr!37665 _values!996) (store mapRest!47805 mapKey!47805 mapValue!47805))))

(declare-fun b!1205548 () Bool)

(assert (=> b!1205548 (= e!684611 (not e!684609))))

(declare-fun res!801846 () Bool)

(assert (=> b!1205548 (=> res!801846 e!684609)))

(assert (=> b!1205548 (= res!801846 (bvsgt from!1455 i!673))))

(assert (=> b!1205548 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546785 () Unit!39966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78047 (_ BitVec 64) (_ BitVec 32)) Unit!39966)

(assert (=> b!1205548 (= lt!546785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100758 res!801845) b!1205525))

(assert (= (and b!1205525 res!801841) b!1205545))

(assert (= (and b!1205545 res!801847) b!1205522))

(assert (= (and b!1205522 res!801834) b!1205531))

(assert (= (and b!1205531 res!801844) b!1205547))

(assert (= (and b!1205547 res!801839) b!1205537))

(assert (= (and b!1205537 res!801838) b!1205528))

(assert (= (and b!1205528 res!801835) b!1205534))

(assert (= (and b!1205534 res!801842) b!1205541))

(assert (= (and b!1205541 res!801833) b!1205548))

(assert (= (and b!1205548 (not res!801846)) b!1205532))

(assert (= (and b!1205532 (not res!801843)) b!1205523))

(assert (= (and b!1205523 c!118299) b!1205530))

(assert (= (and b!1205523 (not c!118299)) b!1205521))

(assert (= (or b!1205530 b!1205521) bm!58477))

(assert (= (or b!1205530 b!1205521) bm!58476))

(assert (= (and b!1205523 (not res!801836)) b!1205538))

(assert (= (and b!1205538 (not res!801840)) b!1205540))

(assert (= (and b!1205540 c!118297) b!1205539))

(assert (= (and b!1205540 (not c!118297)) b!1205544))

(assert (= (and b!1205544 c!118298) b!1205526))

(assert (= (and b!1205544 (not c!118298)) b!1205524))

(assert (= (and b!1205524 c!118296) b!1205533))

(assert (= (and b!1205524 (not c!118296)) b!1205546))

(assert (= (or b!1205526 b!1205533) bm!58475))

(assert (= (or b!1205526 b!1205533) bm!58480))

(assert (= (or b!1205526 b!1205533) bm!58474))

(assert (= (or b!1205539 bm!58474) bm!58479))

(assert (= (or b!1205539 bm!58475) bm!58478))

(assert (= (or b!1205539 bm!58480) bm!58473))

(assert (= (and b!1205540 c!118295) b!1205535))

(assert (= (and b!1205540 (not c!118295)) b!1205529))

(assert (= (and b!1205540 res!801837) b!1205542))

(assert (= (and b!1205527 condMapEmpty!47805) mapIsEmpty!47805))

(assert (= (and b!1205527 (not condMapEmpty!47805)) mapNonEmpty!47805))

(get-info :version)

(assert (= (and mapNonEmpty!47805 ((_ is ValueCellFull!14607) mapValue!47805)) b!1205543))

(assert (= (and b!1205527 ((_ is ValueCellFull!14607) mapDefault!47805)) b!1205536))

(assert (= start!100758 b!1205527))

(declare-fun b_lambda!21325 () Bool)

(assert (=> (not b_lambda!21325) (not b!1205532)))

(declare-fun t!39432 () Bool)

(declare-fun tb!10729 () Bool)

(assert (=> (and start!100758 (= defaultEntry!1004 defaultEntry!1004) t!39432) tb!10729))

(declare-fun result!22043 () Bool)

(assert (=> tb!10729 (= result!22043 tp_is_empty!30633)))

(assert (=> b!1205532 t!39432))

(declare-fun b_and!42843 () Bool)

(assert (= b_and!42841 (and (=> t!39432 result!22043) b_and!42843)))

(declare-fun m!1111405 () Bool)

(assert (=> b!1205522 m!1111405))

(declare-fun m!1111407 () Bool)

(assert (=> b!1205541 m!1111407))

(declare-fun m!1111409 () Bool)

(assert (=> b!1205534 m!1111409))

(declare-fun m!1111411 () Bool)

(assert (=> b!1205534 m!1111411))

(declare-fun m!1111413 () Bool)

(assert (=> bm!58473 m!1111413))

(declare-fun m!1111415 () Bool)

(assert (=> b!1205528 m!1111415))

(declare-fun m!1111417 () Bool)

(assert (=> b!1205539 m!1111417))

(declare-fun m!1111419 () Bool)

(assert (=> b!1205539 m!1111419))

(declare-fun m!1111421 () Bool)

(assert (=> b!1205539 m!1111421))

(declare-fun m!1111423 () Bool)

(assert (=> b!1205532 m!1111423))

(declare-fun m!1111425 () Bool)

(assert (=> b!1205532 m!1111425))

(declare-fun m!1111427 () Bool)

(assert (=> b!1205532 m!1111427))

(declare-fun m!1111429 () Bool)

(assert (=> b!1205532 m!1111429))

(declare-fun m!1111431 () Bool)

(assert (=> b!1205540 m!1111431))

(declare-fun m!1111433 () Bool)

(assert (=> b!1205542 m!1111433))

(declare-fun m!1111435 () Bool)

(assert (=> bm!58476 m!1111435))

(declare-fun m!1111437 () Bool)

(assert (=> b!1205548 m!1111437))

(declare-fun m!1111439 () Bool)

(assert (=> b!1205548 m!1111439))

(declare-fun m!1111441 () Bool)

(assert (=> b!1205531 m!1111441))

(declare-fun m!1111443 () Bool)

(assert (=> b!1205525 m!1111443))

(declare-fun m!1111445 () Bool)

(assert (=> b!1205538 m!1111445))

(assert (=> b!1205538 m!1111435))

(declare-fun m!1111447 () Bool)

(assert (=> mapNonEmpty!47805 m!1111447))

(declare-fun m!1111449 () Bool)

(assert (=> b!1205530 m!1111449))

(declare-fun m!1111451 () Bool)

(assert (=> bm!58479 m!1111451))

(declare-fun m!1111453 () Bool)

(assert (=> bm!58478 m!1111453))

(declare-fun m!1111455 () Bool)

(assert (=> start!100758 m!1111455))

(declare-fun m!1111457 () Bool)

(assert (=> start!100758 m!1111457))

(assert (=> b!1205535 m!1111433))

(declare-fun m!1111459 () Bool)

(assert (=> b!1205537 m!1111459))

(declare-fun m!1111461 () Bool)

(assert (=> b!1205523 m!1111461))

(declare-fun m!1111463 () Bool)

(assert (=> b!1205523 m!1111463))

(declare-fun m!1111465 () Bool)

(assert (=> bm!58477 m!1111465))

(check-sat (not b!1205548) (not b!1205535) (not b!1205540) (not b_lambda!21325) (not b!1205541) (not b!1205523) (not start!100758) (not bm!58477) tp_is_empty!30633 (not bm!58479) b_and!42843 (not b_next!25929) (not bm!58476) (not b!1205534) (not b!1205538) (not b!1205530) (not b!1205532) (not bm!58478) (not mapNonEmpty!47805) (not b!1205525) (not b!1205531) (not b!1205542) (not b!1205522) (not b!1205539) (not b!1205537) (not bm!58473))
(check-sat b_and!42843 (not b_next!25929))
