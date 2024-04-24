; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100792 () Bool)

(assert start!100792)

(declare-fun b_free!25879 () Bool)

(declare-fun b_next!25879 () Bool)

(assert (=> start!100792 (= b_free!25879 (not b_next!25879))))

(declare-fun tp!90627 () Bool)

(declare-fun b_and!42647 () Bool)

(assert (=> start!100792 (= tp!90627 b_and!42647)))

(declare-fun b!1203735 () Bool)

(declare-fun e!683643 () Bool)

(declare-datatypes ((V!45905 0))(
  ( (V!45906 (val!15348 Int)) )
))
(declare-datatypes ((tuple2!19684 0))(
  ( (tuple2!19685 (_1!9853 (_ BitVec 64)) (_2!9853 V!45905)) )
))
(declare-datatypes ((List!26497 0))(
  ( (Nil!26494) (Cons!26493 (h!27711 tuple2!19684) (t!39348 List!26497)) )
))
(declare-datatypes ((ListLongMap!17661 0))(
  ( (ListLongMap!17662 (toList!8846 List!26497)) )
))
(declare-fun call!57817 () ListLongMap!17661)

(declare-fun call!57815 () ListLongMap!17661)

(assert (=> b!1203735 (= e!683643 (= call!57817 call!57815))))

(declare-fun b!1203736 () Bool)

(declare-fun e!683649 () Bool)

(assert (=> b!1203736 (= e!683649 true)))

(declare-datatypes ((Unit!39825 0))(
  ( (Unit!39826) )
))
(declare-fun lt!545494 () Unit!39825)

(declare-fun e!683648 () Unit!39825)

(assert (=> b!1203736 (= lt!545494 e!683648)))

(declare-fun c!118069 () Bool)

(declare-fun lt!545486 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203736 (= c!118069 (and (not lt!545486) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203736 (= lt!545486 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203737 () Bool)

(declare-fun e!683645 () Bool)

(assert (=> b!1203737 (= e!683645 e!683649)))

(declare-fun res!800841 () Bool)

(assert (=> b!1203737 (=> res!800841 e!683649)))

(declare-fun lt!545490 () ListLongMap!17661)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6922 (ListLongMap!17661 (_ BitVec 64)) Bool)

(assert (=> b!1203737 (= res!800841 (not (contains!6922 lt!545490 k0!934)))))

(declare-fun zeroValue!944 () V!45905)

(declare-datatypes ((array!77977 0))(
  ( (array!77978 (arr!37627 (Array (_ BitVec 32) (_ BitVec 64))) (size!38164 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77977)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14582 0))(
  ( (ValueCellFull!14582 (v!17982 V!45905)) (EmptyCell!14582) )
))
(declare-datatypes ((array!77979 0))(
  ( (array!77980 (arr!37628 (Array (_ BitVec 32) ValueCell!14582)) (size!38165 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77979)

(declare-fun minValue!944 () V!45905)

(declare-fun getCurrentListMapNoExtraKeys!5313 (array!77977 array!77979 (_ BitVec 32) (_ BitVec 32) V!45905 V!45905 (_ BitVec 32) Int) ListLongMap!17661)

(assert (=> b!1203737 (= lt!545490 (getCurrentListMapNoExtraKeys!5313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47717 () Bool)

(declare-fun mapRes!47717 () Bool)

(assert (=> mapIsEmpty!47717 mapRes!47717))

(declare-fun call!57820 () ListLongMap!17661)

(declare-fun bm!57810 () Bool)

(declare-fun lt!545492 () ListLongMap!17661)

(declare-fun c!118070 () Bool)

(declare-fun +!4014 (ListLongMap!17661 tuple2!19684) ListLongMap!17661)

(assert (=> bm!57810 (= call!57820 (+!4014 (ite c!118069 lt!545492 lt!545490) (ite c!118069 (tuple2!19685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118070 (tuple2!19685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19685 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!57811 () Bool)

(declare-fun call!57814 () Unit!39825)

(declare-fun call!57816 () Unit!39825)

(assert (=> bm!57811 (= call!57814 call!57816)))

(declare-fun b!1203738 () Bool)

(declare-fun lt!545487 () Unit!39825)

(assert (=> b!1203738 (= e!683648 lt!545487)))

(declare-fun lt!545488 () Unit!39825)

(declare-fun addStillContains!1000 (ListLongMap!17661 (_ BitVec 64) V!45905 (_ BitVec 64)) Unit!39825)

(assert (=> b!1203738 (= lt!545488 (addStillContains!1000 lt!545490 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1203738 (= lt!545492 (+!4014 lt!545490 (tuple2!19685 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57813 () Bool)

(assert (=> b!1203738 call!57813))

(assert (=> b!1203738 (= lt!545487 call!57816)))

(assert (=> b!1203738 (contains!6922 call!57820 k0!934)))

(declare-fun b!1203739 () Bool)

(declare-fun e!683641 () Bool)

(assert (=> b!1203739 (= e!683641 e!683645)))

(declare-fun res!800830 () Bool)

(assert (=> b!1203739 (=> res!800830 e!683645)))

(assert (=> b!1203739 (= res!800830 (not (= (select (arr!37627 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203739 e!683643))

(declare-fun c!118072 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203739 (= c!118072 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545495 () Unit!39825)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 (array!77977 array!77979 (_ BitVec 32) (_ BitVec 32) V!45905 V!45905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39825)

(assert (=> b!1203739 (= lt!545495 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1016 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57812 () Bool)

(declare-fun call!57818 () Bool)

(assert (=> bm!57812 (= call!57818 call!57813)))

(declare-fun b!1203740 () Bool)

(declare-fun res!800838 () Bool)

(declare-fun e!683640 () Bool)

(assert (=> b!1203740 (=> (not res!800838) (not e!683640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77977 (_ BitVec 32)) Bool)

(assert (=> b!1203740 (= res!800838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1203741 () Bool)

(declare-fun -!1795 (ListLongMap!17661 (_ BitVec 64)) ListLongMap!17661)

(assert (=> b!1203741 (= e!683643 (= call!57817 (-!1795 call!57815 k0!934)))))

(declare-fun b!1203742 () Bool)

(declare-fun res!800842 () Bool)

(assert (=> b!1203742 (=> (not res!800842) (not e!683640))))

(assert (=> b!1203742 (= res!800842 (= (select (arr!37627 _keys!1208) i!673) k0!934))))

(declare-fun bm!57813 () Bool)

(declare-fun call!57819 () ListLongMap!17661)

(assert (=> bm!57813 (= call!57819 call!57820)))

(declare-fun b!1203743 () Bool)

(declare-fun e!683644 () Unit!39825)

(declare-fun lt!545489 () Unit!39825)

(assert (=> b!1203743 (= e!683644 lt!545489)))

(assert (=> b!1203743 (= lt!545489 call!57814)))

(assert (=> b!1203743 call!57818))

(declare-fun b!1203744 () Bool)

(declare-fun res!800833 () Bool)

(assert (=> b!1203744 (=> (not res!800833) (not e!683640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203744 (= res!800833 (validKeyInArray!0 k0!934))))

(declare-fun bm!57814 () Bool)

(assert (=> bm!57814 (= call!57816 (addStillContains!1000 (ite c!118069 lt!545492 lt!545490) (ite c!118069 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118070 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118069 minValue!944 (ite c!118070 zeroValue!944 minValue!944)) k0!934))))

(declare-fun res!800831 () Bool)

(assert (=> start!100792 (=> (not res!800831) (not e!683640))))

(assert (=> start!100792 (= res!800831 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38164 _keys!1208))))))

(assert (=> start!100792 e!683640))

(declare-fun tp_is_empty!30583 () Bool)

(assert (=> start!100792 tp_is_empty!30583))

(declare-fun array_inv!28738 (array!77977) Bool)

(assert (=> start!100792 (array_inv!28738 _keys!1208)))

(assert (=> start!100792 true))

(assert (=> start!100792 tp!90627))

(declare-fun e!683651 () Bool)

(declare-fun array_inv!28739 (array!77979) Bool)

(assert (=> start!100792 (and (array_inv!28739 _values!996) e!683651)))

(declare-fun b!1203745 () Bool)

(assert (=> b!1203745 call!57818))

(declare-fun lt!545498 () Unit!39825)

(assert (=> b!1203745 (= lt!545498 call!57814)))

(declare-fun e!683642 () Unit!39825)

(assert (=> b!1203745 (= e!683642 lt!545498)))

(declare-fun mapNonEmpty!47717 () Bool)

(declare-fun tp!90626 () Bool)

(declare-fun e!683650 () Bool)

(assert (=> mapNonEmpty!47717 (= mapRes!47717 (and tp!90626 e!683650))))

(declare-fun mapKey!47717 () (_ BitVec 32))

(declare-fun mapValue!47717 () ValueCell!14582)

(declare-fun mapRest!47717 () (Array (_ BitVec 32) ValueCell!14582))

(assert (=> mapNonEmpty!47717 (= (arr!37628 _values!996) (store mapRest!47717 mapKey!47717 mapValue!47717))))

(declare-fun b!1203746 () Bool)

(declare-fun e!683638 () Bool)

(assert (=> b!1203746 (= e!683651 (and e!683638 mapRes!47717))))

(declare-fun condMapEmpty!47717 () Bool)

(declare-fun mapDefault!47717 () ValueCell!14582)

(assert (=> b!1203746 (= condMapEmpty!47717 (= (arr!37628 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14582)) mapDefault!47717)))))

(declare-fun bm!57815 () Bool)

(assert (=> bm!57815 (= call!57813 (contains!6922 (ite c!118069 lt!545492 call!57819) k0!934))))

(declare-fun b!1203747 () Bool)

(declare-fun c!118071 () Bool)

(assert (=> b!1203747 (= c!118071 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545486))))

(assert (=> b!1203747 (= e!683642 e!683644)))

(declare-fun b!1203748 () Bool)

(declare-fun Unit!39827 () Unit!39825)

(assert (=> b!1203748 (= e!683644 Unit!39827)))

(declare-fun b!1203749 () Bool)

(declare-fun e!683646 () Bool)

(assert (=> b!1203749 (= e!683640 e!683646)))

(declare-fun res!800834 () Bool)

(assert (=> b!1203749 (=> (not res!800834) (not e!683646))))

(declare-fun lt!545493 () array!77977)

(assert (=> b!1203749 (= res!800834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545493 mask!1564))))

(assert (=> b!1203749 (= lt!545493 (array!77978 (store (arr!37627 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38164 _keys!1208)))))

(declare-fun bm!57816 () Bool)

(assert (=> bm!57816 (= call!57815 (getCurrentListMapNoExtraKeys!5313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203750 () Bool)

(declare-fun e!683639 () Bool)

(assert (=> b!1203750 (= e!683646 (not e!683639))))

(declare-fun res!800836 () Bool)

(assert (=> b!1203750 (=> res!800836 e!683639)))

(assert (=> b!1203750 (= res!800836 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203750 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545496 () Unit!39825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77977 (_ BitVec 64) (_ BitVec 32)) Unit!39825)

(assert (=> b!1203750 (= lt!545496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1203751 () Bool)

(assert (=> b!1203751 (= e!683638 tp_is_empty!30583)))

(declare-fun b!1203752 () Bool)

(assert (=> b!1203752 (= e!683639 e!683641)))

(declare-fun res!800829 () Bool)

(assert (=> b!1203752 (=> res!800829 e!683641)))

(assert (=> b!1203752 (= res!800829 (not (= from!1455 i!673)))))

(declare-fun lt!545491 () array!77979)

(declare-fun lt!545485 () ListLongMap!17661)

(assert (=> b!1203752 (= lt!545485 (getCurrentListMapNoExtraKeys!5313 lt!545493 lt!545491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3246 (Int (_ BitVec 64)) V!45905)

(assert (=> b!1203752 (= lt!545491 (array!77980 (store (arr!37628 _values!996) i!673 (ValueCellFull!14582 (dynLambda!3246 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38165 _values!996)))))

(declare-fun lt!545497 () ListLongMap!17661)

(assert (=> b!1203752 (= lt!545497 (getCurrentListMapNoExtraKeys!5313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203753 () Bool)

(declare-fun res!800839 () Bool)

(assert (=> b!1203753 (=> (not res!800839) (not e!683640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203753 (= res!800839 (validMask!0 mask!1564))))

(declare-fun b!1203754 () Bool)

(declare-fun res!800832 () Bool)

(assert (=> b!1203754 (=> (not res!800832) (not e!683646))))

(declare-datatypes ((List!26498 0))(
  ( (Nil!26495) (Cons!26494 (h!27712 (_ BitVec 64)) (t!39349 List!26498)) )
))
(declare-fun arrayNoDuplicates!0 (array!77977 (_ BitVec 32) List!26498) Bool)

(assert (=> b!1203754 (= res!800832 (arrayNoDuplicates!0 lt!545493 #b00000000000000000000000000000000 Nil!26495))))

(declare-fun b!1203755 () Bool)

(assert (=> b!1203755 (= e!683648 e!683642)))

(assert (=> b!1203755 (= c!118070 (and (not lt!545486) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203756 () Bool)

(declare-fun res!800837 () Bool)

(assert (=> b!1203756 (=> (not res!800837) (not e!683640))))

(assert (=> b!1203756 (= res!800837 (and (= (size!38165 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38164 _keys!1208) (size!38165 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57817 () Bool)

(assert (=> bm!57817 (= call!57817 (getCurrentListMapNoExtraKeys!5313 lt!545493 lt!545491 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203757 () Bool)

(declare-fun res!800840 () Bool)

(assert (=> b!1203757 (=> (not res!800840) (not e!683640))))

(assert (=> b!1203757 (= res!800840 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38164 _keys!1208))))))

(declare-fun b!1203758 () Bool)

(declare-fun res!800835 () Bool)

(assert (=> b!1203758 (=> (not res!800835) (not e!683640))))

(assert (=> b!1203758 (= res!800835 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26495))))

(declare-fun b!1203759 () Bool)

(assert (=> b!1203759 (= e!683650 tp_is_empty!30583)))

(assert (= (and start!100792 res!800831) b!1203753))

(assert (= (and b!1203753 res!800839) b!1203756))

(assert (= (and b!1203756 res!800837) b!1203740))

(assert (= (and b!1203740 res!800838) b!1203758))

(assert (= (and b!1203758 res!800835) b!1203757))

(assert (= (and b!1203757 res!800840) b!1203744))

(assert (= (and b!1203744 res!800833) b!1203742))

(assert (= (and b!1203742 res!800842) b!1203749))

(assert (= (and b!1203749 res!800834) b!1203754))

(assert (= (and b!1203754 res!800832) b!1203750))

(assert (= (and b!1203750 (not res!800836)) b!1203752))

(assert (= (and b!1203752 (not res!800829)) b!1203739))

(assert (= (and b!1203739 c!118072) b!1203741))

(assert (= (and b!1203739 (not c!118072)) b!1203735))

(assert (= (or b!1203741 b!1203735) bm!57817))

(assert (= (or b!1203741 b!1203735) bm!57816))

(assert (= (and b!1203739 (not res!800830)) b!1203737))

(assert (= (and b!1203737 (not res!800841)) b!1203736))

(assert (= (and b!1203736 c!118069) b!1203738))

(assert (= (and b!1203736 (not c!118069)) b!1203755))

(assert (= (and b!1203755 c!118070) b!1203745))

(assert (= (and b!1203755 (not c!118070)) b!1203747))

(assert (= (and b!1203747 c!118071) b!1203743))

(assert (= (and b!1203747 (not c!118071)) b!1203748))

(assert (= (or b!1203745 b!1203743) bm!57811))

(assert (= (or b!1203745 b!1203743) bm!57813))

(assert (= (or b!1203745 b!1203743) bm!57812))

(assert (= (or b!1203738 bm!57812) bm!57815))

(assert (= (or b!1203738 bm!57811) bm!57814))

(assert (= (or b!1203738 bm!57813) bm!57810))

(assert (= (and b!1203746 condMapEmpty!47717) mapIsEmpty!47717))

(assert (= (and b!1203746 (not condMapEmpty!47717)) mapNonEmpty!47717))

(get-info :version)

(assert (= (and mapNonEmpty!47717 ((_ is ValueCellFull!14582) mapValue!47717)) b!1203759))

(assert (= (and b!1203746 ((_ is ValueCellFull!14582) mapDefault!47717)) b!1203751))

(assert (= start!100792 b!1203746))

(declare-fun b_lambda!21069 () Bool)

(assert (=> (not b_lambda!21069) (not b!1203752)))

(declare-fun t!39347 () Bool)

(declare-fun tb!10671 () Bool)

(assert (=> (and start!100792 (= defaultEntry!1004 defaultEntry!1004) t!39347) tb!10671))

(declare-fun result!21927 () Bool)

(assert (=> tb!10671 (= result!21927 tp_is_empty!30583)))

(assert (=> b!1203752 t!39347))

(declare-fun b_and!42649 () Bool)

(assert (= b_and!42647 (and (=> t!39347 result!21927) b_and!42649)))

(declare-fun m!1109873 () Bool)

(assert (=> b!1203744 m!1109873))

(declare-fun m!1109875 () Bool)

(assert (=> b!1203737 m!1109875))

(declare-fun m!1109877 () Bool)

(assert (=> b!1203737 m!1109877))

(declare-fun m!1109879 () Bool)

(assert (=> b!1203749 m!1109879))

(declare-fun m!1109881 () Bool)

(assert (=> b!1203749 m!1109881))

(declare-fun m!1109883 () Bool)

(assert (=> b!1203754 m!1109883))

(declare-fun m!1109885 () Bool)

(assert (=> b!1203758 m!1109885))

(declare-fun m!1109887 () Bool)

(assert (=> bm!57814 m!1109887))

(declare-fun m!1109889 () Bool)

(assert (=> b!1203742 m!1109889))

(declare-fun m!1109891 () Bool)

(assert (=> b!1203738 m!1109891))

(declare-fun m!1109893 () Bool)

(assert (=> b!1203738 m!1109893))

(declare-fun m!1109895 () Bool)

(assert (=> b!1203738 m!1109895))

(declare-fun m!1109897 () Bool)

(assert (=> b!1203741 m!1109897))

(declare-fun m!1109899 () Bool)

(assert (=> mapNonEmpty!47717 m!1109899))

(declare-fun m!1109901 () Bool)

(assert (=> b!1203739 m!1109901))

(declare-fun m!1109903 () Bool)

(assert (=> b!1203739 m!1109903))

(declare-fun m!1109905 () Bool)

(assert (=> b!1203740 m!1109905))

(declare-fun m!1109907 () Bool)

(assert (=> start!100792 m!1109907))

(declare-fun m!1109909 () Bool)

(assert (=> start!100792 m!1109909))

(declare-fun m!1109911 () Bool)

(assert (=> b!1203752 m!1109911))

(declare-fun m!1109913 () Bool)

(assert (=> b!1203752 m!1109913))

(declare-fun m!1109915 () Bool)

(assert (=> b!1203752 m!1109915))

(declare-fun m!1109917 () Bool)

(assert (=> b!1203752 m!1109917))

(declare-fun m!1109919 () Bool)

(assert (=> bm!57810 m!1109919))

(declare-fun m!1109921 () Bool)

(assert (=> b!1203753 m!1109921))

(declare-fun m!1109923 () Bool)

(assert (=> bm!57817 m!1109923))

(declare-fun m!1109925 () Bool)

(assert (=> bm!57815 m!1109925))

(declare-fun m!1109927 () Bool)

(assert (=> b!1203750 m!1109927))

(declare-fun m!1109929 () Bool)

(assert (=> b!1203750 m!1109929))

(assert (=> bm!57816 m!1109877))

(check-sat (not b!1203758) (not bm!57816) (not bm!57810) (not b!1203753) (not bm!57817) (not mapNonEmpty!47717) (not b!1203749) (not b_next!25879) (not b!1203739) (not b!1203738) (not b!1203744) (not b!1203740) b_and!42649 (not start!100792) (not bm!57814) tp_is_empty!30583 (not b!1203754) (not bm!57815) (not b!1203750) (not b!1203741) (not b!1203737) (not b_lambda!21069) (not b!1203752))
(check-sat b_and!42649 (not b_next!25879))
