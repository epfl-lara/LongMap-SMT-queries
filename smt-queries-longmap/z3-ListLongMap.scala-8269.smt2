; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100556 () Bool)

(assert start!100556)

(declare-fun b_free!25885 () Bool)

(declare-fun b_next!25885 () Bool)

(assert (=> start!100556 (= b_free!25885 (not b_next!25885))))

(declare-fun tp!90645 () Bool)

(declare-fun b_and!42635 () Bool)

(assert (=> start!100556 (= tp!90645 b_and!42635)))

(declare-fun bm!57794 () Bool)

(declare-datatypes ((V!45913 0))(
  ( (V!45914 (val!15351 Int)) )
))
(declare-datatypes ((tuple2!19750 0))(
  ( (tuple2!19751 (_1!9886 (_ BitVec 64)) (_2!9886 V!45913)) )
))
(declare-datatypes ((List!26537 0))(
  ( (Nil!26534) (Cons!26533 (h!27742 tuple2!19750) (t!39393 List!26537)) )
))
(declare-datatypes ((ListLongMap!17719 0))(
  ( (ListLongMap!17720 (toList!8875 List!26537)) )
))
(declare-fun call!57803 () ListLongMap!17719)

(declare-fun call!57798 () ListLongMap!17719)

(assert (=> bm!57794 (= call!57803 call!57798)))

(declare-fun b!1202553 () Bool)

(declare-fun res!800383 () Bool)

(declare-fun e!682857 () Bool)

(assert (=> b!1202553 (=> (not res!800383) (not e!682857))))

(declare-datatypes ((array!77868 0))(
  ( (array!77869 (arr!37579 (Array (_ BitVec 32) (_ BitVec 64))) (size!38117 (_ BitVec 32))) )
))
(declare-fun lt!544943 () array!77868)

(declare-datatypes ((List!26538 0))(
  ( (Nil!26535) (Cons!26534 (h!27743 (_ BitVec 64)) (t!39394 List!26538)) )
))
(declare-fun arrayNoDuplicates!0 (array!77868 (_ BitVec 32) List!26538) Bool)

(assert (=> b!1202553 (= res!800383 (arrayNoDuplicates!0 lt!544943 #b00000000000000000000000000000000 Nil!26535))))

(declare-fun call!57797 () ListLongMap!17719)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57795 () Bool)

(declare-fun zeroValue!944 () V!45913)

(declare-datatypes ((ValueCell!14585 0))(
  ( (ValueCellFull!14585 (v!17988 V!45913)) (EmptyCell!14585) )
))
(declare-datatypes ((array!77870 0))(
  ( (array!77871 (arr!37580 (Array (_ BitVec 32) ValueCell!14585)) (size!38118 (_ BitVec 32))) )
))
(declare-fun lt!544946 () array!77870)

(declare-fun minValue!944 () V!45913)

(declare-fun getCurrentListMapNoExtraKeys!5322 (array!77868 array!77870 (_ BitVec 32) (_ BitVec 32) V!45913 V!45913 (_ BitVec 32) Int) ListLongMap!17719)

(assert (=> bm!57795 (= call!57797 (getCurrentListMapNoExtraKeys!5322 lt!544943 lt!544946 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202554 () Bool)

(declare-fun res!800393 () Bool)

(declare-fun e!682862 () Bool)

(assert (=> b!1202554 (=> (not res!800393) (not e!682862))))

(declare-fun _keys!1208 () array!77868)

(declare-fun _values!996 () array!77870)

(assert (=> b!1202554 (= res!800393 (and (= (size!38118 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38117 _keys!1208) (size!38118 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202555 () Bool)

(declare-fun res!800392 () Bool)

(assert (=> b!1202555 (=> (not res!800392) (not e!682862))))

(assert (=> b!1202555 (= res!800392 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26535))))

(declare-fun b!1202556 () Bool)

(declare-fun res!800390 () Bool)

(assert (=> b!1202556 (=> (not res!800390) (not e!682862))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202556 (= res!800390 (validKeyInArray!0 k0!934))))

(declare-datatypes ((Unit!39719 0))(
  ( (Unit!39720) )
))
(declare-fun call!57802 () Unit!39719)

(declare-fun c!117681 () Bool)

(declare-fun bm!57796 () Bool)

(declare-fun c!117683 () Bool)

(declare-fun lt!544942 () ListLongMap!17719)

(declare-fun addStillContains!994 (ListLongMap!17719 (_ BitVec 64) V!45913 (_ BitVec 64)) Unit!39719)

(assert (=> bm!57796 (= call!57802 (addStillContains!994 lt!544942 (ite (or c!117683 c!117681) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117683 c!117681) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1202557 () Bool)

(assert (=> b!1202557 (= e!682862 e!682857)))

(declare-fun res!800394 () Bool)

(assert (=> b!1202557 (=> (not res!800394) (not e!682857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77868 (_ BitVec 32)) Bool)

(assert (=> b!1202557 (= res!800394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544943 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202557 (= lt!544943 (array!77869 (store (arr!37579 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38117 _keys!1208)))))

(declare-fun b!1202558 () Bool)

(declare-fun e!682860 () Bool)

(declare-fun e!682861 () Bool)

(assert (=> b!1202558 (= e!682860 e!682861)))

(declare-fun res!800387 () Bool)

(assert (=> b!1202558 (=> res!800387 e!682861)))

(assert (=> b!1202558 (= res!800387 (not (= from!1455 i!673)))))

(declare-fun lt!544947 () ListLongMap!17719)

(assert (=> b!1202558 (= lt!544947 (getCurrentListMapNoExtraKeys!5322 lt!544943 lt!544946 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3196 (Int (_ BitVec 64)) V!45913)

(assert (=> b!1202558 (= lt!544946 (array!77871 (store (arr!37580 _values!996) i!673 (ValueCellFull!14585 (dynLambda!3196 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38118 _values!996)))))

(declare-fun lt!544940 () ListLongMap!17719)

(assert (=> b!1202558 (= lt!544940 (getCurrentListMapNoExtraKeys!5322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!57801 () ListLongMap!17719)

(declare-fun b!1202559 () Bool)

(declare-fun e!682856 () Bool)

(declare-fun -!1770 (ListLongMap!17719 (_ BitVec 64)) ListLongMap!17719)

(assert (=> b!1202559 (= e!682856 (= call!57797 (-!1770 call!57801 k0!934)))))

(declare-fun res!800389 () Bool)

(assert (=> start!100556 (=> (not res!800389) (not e!682862))))

(assert (=> start!100556 (= res!800389 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38117 _keys!1208))))))

(assert (=> start!100556 e!682862))

(declare-fun tp_is_empty!30589 () Bool)

(assert (=> start!100556 tp_is_empty!30589))

(declare-fun array_inv!28744 (array!77868) Bool)

(assert (=> start!100556 (array_inv!28744 _keys!1208)))

(assert (=> start!100556 true))

(assert (=> start!100556 tp!90645))

(declare-fun e!682863 () Bool)

(declare-fun array_inv!28745 (array!77870) Bool)

(assert (=> start!100556 (and (array_inv!28745 _values!996) e!682863)))

(declare-fun b!1202560 () Bool)

(declare-fun res!800382 () Bool)

(assert (=> b!1202560 (=> (not res!800382) (not e!682862))))

(assert (=> b!1202560 (= res!800382 (= (select (arr!37579 _keys!1208) i!673) k0!934))))

(declare-fun b!1202561 () Bool)

(declare-fun e!682866 () Bool)

(assert (=> b!1202561 (= e!682861 e!682866)))

(declare-fun res!800386 () Bool)

(assert (=> b!1202561 (=> res!800386 e!682866)))

(assert (=> b!1202561 (= res!800386 (not (= (select (arr!37579 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202561 e!682856))

(declare-fun c!117682 () Bool)

(assert (=> b!1202561 (= c!117682 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544938 () Unit!39719)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1019 (array!77868 array!77870 (_ BitVec 32) (_ BitVec 32) V!45913 V!45913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39719)

(assert (=> b!1202561 (= lt!544938 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1019 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202562 () Bool)

(declare-fun e!682858 () Bool)

(declare-fun mapRes!47726 () Bool)

(assert (=> b!1202562 (= e!682863 (and e!682858 mapRes!47726))))

(declare-fun condMapEmpty!47726 () Bool)

(declare-fun mapDefault!47726 () ValueCell!14585)

(assert (=> b!1202562 (= condMapEmpty!47726 (= (arr!37580 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14585)) mapDefault!47726)))))

(declare-fun b!1202563 () Bool)

(declare-fun e!682854 () Bool)

(assert (=> b!1202563 (= e!682854 tp_is_empty!30589)))

(declare-fun mapNonEmpty!47726 () Bool)

(declare-fun tp!90644 () Bool)

(assert (=> mapNonEmpty!47726 (= mapRes!47726 (and tp!90644 e!682854))))

(declare-fun mapRest!47726 () (Array (_ BitVec 32) ValueCell!14585))

(declare-fun mapValue!47726 () ValueCell!14585)

(declare-fun mapKey!47726 () (_ BitVec 32))

(assert (=> mapNonEmpty!47726 (= (arr!37580 _values!996) (store mapRest!47726 mapKey!47726 mapValue!47726))))

(declare-fun b!1202564 () Bool)

(declare-fun e!682864 () Bool)

(assert (=> b!1202564 (= e!682866 e!682864)))

(declare-fun res!800388 () Bool)

(assert (=> b!1202564 (=> res!800388 e!682864)))

(declare-fun contains!6869 (ListLongMap!17719 (_ BitVec 64)) Bool)

(assert (=> b!1202564 (= res!800388 (not (contains!6869 lt!544942 k0!934)))))

(assert (=> b!1202564 (= lt!544942 (getCurrentListMapNoExtraKeys!5322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57797 () Bool)

(declare-fun call!57799 () Unit!39719)

(assert (=> bm!57797 (= call!57799 call!57802)))

(declare-fun b!1202565 () Bool)

(declare-fun call!57800 () Bool)

(assert (=> b!1202565 call!57800))

(declare-fun lt!544937 () Unit!39719)

(assert (=> b!1202565 (= lt!544937 call!57799)))

(declare-fun e!682867 () Unit!39719)

(assert (=> b!1202565 (= e!682867 lt!544937)))

(declare-fun bm!57798 () Bool)

(assert (=> bm!57798 (= call!57801 (getCurrentListMapNoExtraKeys!5322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!544941 () ListLongMap!17719)

(declare-fun bm!57799 () Bool)

(declare-fun +!4009 (ListLongMap!17719 tuple2!19750) ListLongMap!17719)

(assert (=> bm!57799 (= call!57798 (+!4009 (ite c!117683 lt!544941 lt!544942) (ite c!117683 (tuple2!19751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117681 (tuple2!19751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202566 () Bool)

(assert (=> b!1202566 (= e!682857 (not e!682860))))

(declare-fun res!800381 () Bool)

(assert (=> b!1202566 (=> res!800381 e!682860)))

(assert (=> b!1202566 (= res!800381 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202566 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544935 () Unit!39719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77868 (_ BitVec 64) (_ BitVec 32)) Unit!39719)

(assert (=> b!1202566 (= lt!544935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202567 () Bool)

(declare-fun e!682859 () Unit!39719)

(declare-fun lt!544939 () Unit!39719)

(assert (=> b!1202567 (= e!682859 lt!544939)))

(declare-fun lt!544948 () Unit!39719)

(assert (=> b!1202567 (= lt!544948 call!57802)))

(assert (=> b!1202567 (= lt!544941 (+!4009 lt!544942 (tuple2!19751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57804 () Bool)

(assert (=> b!1202567 call!57804))

(assert (=> b!1202567 (= lt!544939 (addStillContains!994 lt!544941 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1202567 (contains!6869 call!57798 k0!934)))

(declare-fun mapIsEmpty!47726 () Bool)

(assert (=> mapIsEmpty!47726 mapRes!47726))

(declare-fun b!1202568 () Bool)

(declare-fun res!800384 () Bool)

(assert (=> b!1202568 (=> (not res!800384) (not e!682862))))

(assert (=> b!1202568 (= res!800384 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38117 _keys!1208))))))

(declare-fun b!1202569 () Bool)

(assert (=> b!1202569 (= e!682859 e!682867)))

(declare-fun lt!544936 () Bool)

(assert (=> b!1202569 (= c!117681 (and (not lt!544936) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202570 () Bool)

(assert (=> b!1202570 (= e!682864 true)))

(declare-fun lt!544944 () Unit!39719)

(assert (=> b!1202570 (= lt!544944 e!682859)))

(assert (=> b!1202570 (= c!117683 (and (not lt!544936) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202570 (= lt!544936 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202571 () Bool)

(assert (=> b!1202571 (= e!682858 tp_is_empty!30589)))

(declare-fun b!1202572 () Bool)

(declare-fun e!682855 () Unit!39719)

(declare-fun lt!544945 () Unit!39719)

(assert (=> b!1202572 (= e!682855 lt!544945)))

(assert (=> b!1202572 (= lt!544945 call!57799)))

(assert (=> b!1202572 call!57800))

(declare-fun bm!57800 () Bool)

(assert (=> bm!57800 (= call!57804 (contains!6869 (ite c!117683 lt!544941 call!57803) k0!934))))

(declare-fun b!1202573 () Bool)

(declare-fun Unit!39721 () Unit!39719)

(assert (=> b!1202573 (= e!682855 Unit!39721)))

(declare-fun b!1202574 () Bool)

(declare-fun res!800385 () Bool)

(assert (=> b!1202574 (=> (not res!800385) (not e!682862))))

(assert (=> b!1202574 (= res!800385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202575 () Bool)

(declare-fun c!117684 () Bool)

(assert (=> b!1202575 (= c!117684 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544936))))

(assert (=> b!1202575 (= e!682867 e!682855)))

(declare-fun bm!57801 () Bool)

(assert (=> bm!57801 (= call!57800 call!57804)))

(declare-fun b!1202576 () Bool)

(assert (=> b!1202576 (= e!682856 (= call!57797 call!57801))))

(declare-fun b!1202577 () Bool)

(declare-fun res!800391 () Bool)

(assert (=> b!1202577 (=> (not res!800391) (not e!682862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202577 (= res!800391 (validMask!0 mask!1564))))

(assert (= (and start!100556 res!800389) b!1202577))

(assert (= (and b!1202577 res!800391) b!1202554))

(assert (= (and b!1202554 res!800393) b!1202574))

(assert (= (and b!1202574 res!800385) b!1202555))

(assert (= (and b!1202555 res!800392) b!1202568))

(assert (= (and b!1202568 res!800384) b!1202556))

(assert (= (and b!1202556 res!800390) b!1202560))

(assert (= (and b!1202560 res!800382) b!1202557))

(assert (= (and b!1202557 res!800394) b!1202553))

(assert (= (and b!1202553 res!800383) b!1202566))

(assert (= (and b!1202566 (not res!800381)) b!1202558))

(assert (= (and b!1202558 (not res!800387)) b!1202561))

(assert (= (and b!1202561 c!117682) b!1202559))

(assert (= (and b!1202561 (not c!117682)) b!1202576))

(assert (= (or b!1202559 b!1202576) bm!57795))

(assert (= (or b!1202559 b!1202576) bm!57798))

(assert (= (and b!1202561 (not res!800386)) b!1202564))

(assert (= (and b!1202564 (not res!800388)) b!1202570))

(assert (= (and b!1202570 c!117683) b!1202567))

(assert (= (and b!1202570 (not c!117683)) b!1202569))

(assert (= (and b!1202569 c!117681) b!1202565))

(assert (= (and b!1202569 (not c!117681)) b!1202575))

(assert (= (and b!1202575 c!117684) b!1202572))

(assert (= (and b!1202575 (not c!117684)) b!1202573))

(assert (= (or b!1202565 b!1202572) bm!57797))

(assert (= (or b!1202565 b!1202572) bm!57794))

(assert (= (or b!1202565 b!1202572) bm!57801))

(assert (= (or b!1202567 bm!57801) bm!57800))

(assert (= (or b!1202567 bm!57797) bm!57796))

(assert (= (or b!1202567 bm!57794) bm!57799))

(assert (= (and b!1202562 condMapEmpty!47726) mapIsEmpty!47726))

(assert (= (and b!1202562 (not condMapEmpty!47726)) mapNonEmpty!47726))

(get-info :version)

(assert (= (and mapNonEmpty!47726 ((_ is ValueCellFull!14585) mapValue!47726)) b!1202563))

(assert (= (and b!1202562 ((_ is ValueCellFull!14585) mapDefault!47726)) b!1202571))

(assert (= start!100556 b!1202562))

(declare-fun b_lambda!21063 () Bool)

(assert (=> (not b_lambda!21063) (not b!1202558)))

(declare-fun t!39392 () Bool)

(declare-fun tb!10677 () Bool)

(assert (=> (and start!100556 (= defaultEntry!1004 defaultEntry!1004) t!39392) tb!10677))

(declare-fun result!21939 () Bool)

(assert (=> tb!10677 (= result!21939 tp_is_empty!30589)))

(assert (=> b!1202558 t!39392))

(declare-fun b_and!42637 () Bool)

(assert (= b_and!42635 (and (=> t!39392 result!21939) b_and!42637)))

(declare-fun m!1107867 () Bool)

(assert (=> b!1202567 m!1107867))

(declare-fun m!1107869 () Bool)

(assert (=> b!1202567 m!1107869))

(declare-fun m!1107871 () Bool)

(assert (=> b!1202567 m!1107871))

(declare-fun m!1107873 () Bool)

(assert (=> b!1202556 m!1107873))

(declare-fun m!1107875 () Bool)

(assert (=> mapNonEmpty!47726 m!1107875))

(declare-fun m!1107877 () Bool)

(assert (=> start!100556 m!1107877))

(declare-fun m!1107879 () Bool)

(assert (=> start!100556 m!1107879))

(declare-fun m!1107881 () Bool)

(assert (=> b!1202574 m!1107881))

(declare-fun m!1107883 () Bool)

(assert (=> bm!57796 m!1107883))

(declare-fun m!1107885 () Bool)

(assert (=> b!1202559 m!1107885))

(declare-fun m!1107887 () Bool)

(assert (=> b!1202566 m!1107887))

(declare-fun m!1107889 () Bool)

(assert (=> b!1202566 m!1107889))

(declare-fun m!1107891 () Bool)

(assert (=> bm!57795 m!1107891))

(declare-fun m!1107893 () Bool)

(assert (=> b!1202553 m!1107893))

(declare-fun m!1107895 () Bool)

(assert (=> b!1202560 m!1107895))

(declare-fun m!1107897 () Bool)

(assert (=> bm!57800 m!1107897))

(declare-fun m!1107899 () Bool)

(assert (=> b!1202558 m!1107899))

(declare-fun m!1107901 () Bool)

(assert (=> b!1202558 m!1107901))

(declare-fun m!1107903 () Bool)

(assert (=> b!1202558 m!1107903))

(declare-fun m!1107905 () Bool)

(assert (=> b!1202558 m!1107905))

(declare-fun m!1107907 () Bool)

(assert (=> b!1202555 m!1107907))

(declare-fun m!1107909 () Bool)

(assert (=> b!1202557 m!1107909))

(declare-fun m!1107911 () Bool)

(assert (=> b!1202557 m!1107911))

(declare-fun m!1107913 () Bool)

(assert (=> bm!57798 m!1107913))

(declare-fun m!1107915 () Bool)

(assert (=> bm!57799 m!1107915))

(declare-fun m!1107917 () Bool)

(assert (=> b!1202561 m!1107917))

(declare-fun m!1107919 () Bool)

(assert (=> b!1202561 m!1107919))

(declare-fun m!1107921 () Bool)

(assert (=> b!1202564 m!1107921))

(assert (=> b!1202564 m!1107913))

(declare-fun m!1107923 () Bool)

(assert (=> b!1202577 m!1107923))

(check-sat (not b!1202574) (not bm!57799) (not bm!57796) (not b!1202553) (not b!1202557) (not bm!57795) (not bm!57800) (not b!1202577) (not b!1202564) (not start!100556) (not b!1202556) (not b!1202567) (not b!1202566) (not b_next!25885) (not b!1202558) (not mapNonEmpty!47726) (not bm!57798) (not b!1202555) tp_is_empty!30589 b_and!42637 (not b_lambda!21063) (not b!1202561) (not b!1202559))
(check-sat b_and!42637 (not b_next!25885))
