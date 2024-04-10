; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100540 () Bool)

(assert start!100540)

(declare-fun b_free!25863 () Bool)

(declare-fun b_next!25863 () Bool)

(assert (=> start!100540 (= b_free!25863 (not b_next!25863))))

(declare-fun tp!90578 () Bool)

(declare-fun b_and!42613 () Bool)

(assert (=> start!100540 (= tp!90578 b_and!42613)))

(declare-fun b!1201830 () Bool)

(declare-fun res!799990 () Bool)

(declare-fun e!682479 () Bool)

(assert (=> b!1201830 (=> (not res!799990) (not e!682479))))

(declare-datatypes ((array!77907 0))(
  ( (array!77908 (arr!37598 (Array (_ BitVec 32) (_ BitVec 64))) (size!38134 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77907)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77907 (_ BitVec 32)) Bool)

(assert (=> b!1201830 (= res!799990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201831 () Bool)

(declare-fun e!682481 () Bool)

(declare-fun e!682480 () Bool)

(assert (=> b!1201831 (= e!682481 (not e!682480))))

(declare-fun res!799997 () Bool)

(assert (=> b!1201831 (=> res!799997 e!682480)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201831 (= res!799997 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201831 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39844 0))(
  ( (Unit!39845) )
))
(declare-fun lt!544673 () Unit!39844)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77907 (_ BitVec 64) (_ BitVec 32)) Unit!39844)

(assert (=> b!1201831 (= lt!544673 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201832 () Bool)

(declare-fun e!682473 () Bool)

(declare-fun tp_is_empty!30567 () Bool)

(assert (=> b!1201832 (= e!682473 tp_is_empty!30567)))

(declare-datatypes ((V!45883 0))(
  ( (V!45884 (val!15340 Int)) )
))
(declare-fun zeroValue!944 () V!45883)

(declare-fun bm!57554 () Bool)

(declare-datatypes ((tuple2!19652 0))(
  ( (tuple2!19653 (_1!9837 (_ BitVec 64)) (_2!9837 V!45883)) )
))
(declare-datatypes ((List!26467 0))(
  ( (Nil!26464) (Cons!26463 (h!27672 tuple2!19652) (t!39310 List!26467)) )
))
(declare-datatypes ((ListLongMap!17621 0))(
  ( (ListLongMap!17622 (toList!8826 List!26467)) )
))
(declare-fun call!57559 () ListLongMap!17621)

(declare-fun lt!544672 () ListLongMap!17621)

(declare-fun c!117576 () Bool)

(declare-fun c!117577 () Bool)

(declare-fun minValue!944 () V!45883)

(declare-fun +!3956 (ListLongMap!17621 tuple2!19652) ListLongMap!17621)

(assert (=> bm!57554 (= call!57559 (+!3956 lt!544672 (ite (or c!117577 c!117576) (tuple2!19653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1201833 () Bool)

(declare-fun res!799995 () Bool)

(assert (=> b!1201833 (=> (not res!799995) (not e!682479))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14574 0))(
  ( (ValueCellFull!14574 (v!17978 V!45883)) (EmptyCell!14574) )
))
(declare-datatypes ((array!77909 0))(
  ( (array!77910 (arr!37599 (Array (_ BitVec 32) ValueCell!14574)) (size!38135 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77909)

(assert (=> b!1201833 (= res!799995 (and (= (size!38135 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38134 _keys!1208) (size!38135 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201834 () Bool)

(declare-fun res!799992 () Bool)

(assert (=> b!1201834 (=> (not res!799992) (not e!682479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201834 (= res!799992 (validKeyInArray!0 k0!934))))

(declare-fun b!1201835 () Bool)

(declare-fun e!682477 () Bool)

(declare-fun e!682478 () Bool)

(declare-fun mapRes!47693 () Bool)

(assert (=> b!1201835 (= e!682477 (and e!682478 mapRes!47693))))

(declare-fun condMapEmpty!47693 () Bool)

(declare-fun mapDefault!47693 () ValueCell!14574)

(assert (=> b!1201835 (= condMapEmpty!47693 (= (arr!37599 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14574)) mapDefault!47693)))))

(declare-fun b!1201836 () Bool)

(declare-fun res!799996 () Bool)

(assert (=> b!1201836 (=> (not res!799996) (not e!682479))))

(declare-datatypes ((List!26468 0))(
  ( (Nil!26465) (Cons!26464 (h!27673 (_ BitVec 64)) (t!39311 List!26468)) )
))
(declare-fun arrayNoDuplicates!0 (array!77907 (_ BitVec 32) List!26468) Bool)

(assert (=> b!1201836 (= res!799996 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26465))))

(declare-fun bm!57553 () Bool)

(declare-fun call!57558 () ListLongMap!17621)

(assert (=> bm!57553 (= call!57558 call!57559)))

(declare-fun res!799993 () Bool)

(assert (=> start!100540 (=> (not res!799993) (not e!682479))))

(assert (=> start!100540 (= res!799993 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38134 _keys!1208))))))

(assert (=> start!100540 e!682479))

(assert (=> start!100540 tp_is_empty!30567))

(declare-fun array_inv!28654 (array!77907) Bool)

(assert (=> start!100540 (array_inv!28654 _keys!1208)))

(assert (=> start!100540 true))

(assert (=> start!100540 tp!90578))

(declare-fun array_inv!28655 (array!77909) Bool)

(assert (=> start!100540 (and (array_inv!28655 _values!996) e!682477)))

(declare-fun b!1201837 () Bool)

(declare-fun e!682475 () Unit!39844)

(declare-fun lt!544669 () Unit!39844)

(assert (=> b!1201837 (= e!682475 lt!544669)))

(declare-fun lt!544675 () Unit!39844)

(declare-fun addStillContains!984 (ListLongMap!17621 (_ BitVec 64) V!45883 (_ BitVec 64)) Unit!39844)

(assert (=> b!1201837 (= lt!544675 (addStillContains!984 lt!544672 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!544678 () ListLongMap!17621)

(assert (=> b!1201837 (= lt!544678 call!57559)))

(declare-fun call!57557 () Bool)

(assert (=> b!1201837 call!57557))

(declare-fun call!57562 () Unit!39844)

(assert (=> b!1201837 (= lt!544669 call!57562)))

(declare-fun contains!6883 (ListLongMap!17621 (_ BitVec 64)) Bool)

(assert (=> b!1201837 (contains!6883 (+!3956 lt!544678 (tuple2!19653 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1201838 () Bool)

(declare-fun call!57556 () ListLongMap!17621)

(declare-fun e!682470 () Bool)

(declare-fun call!57561 () ListLongMap!17621)

(declare-fun -!1798 (ListLongMap!17621 (_ BitVec 64)) ListLongMap!17621)

(assert (=> b!1201838 (= e!682470 (= call!57556 (-!1798 call!57561 k0!934)))))

(declare-fun b!1201839 () Bool)

(declare-fun e!682476 () Unit!39844)

(declare-fun Unit!39846 () Unit!39844)

(assert (=> b!1201839 (= e!682476 Unit!39846)))

(declare-fun bm!57555 () Bool)

(declare-fun call!57560 () Unit!39844)

(assert (=> bm!57555 (= call!57560 call!57562)))

(declare-fun bm!57556 () Bool)

(assert (=> bm!57556 (= call!57562 (addStillContains!984 (ite c!117577 lt!544678 lt!544672) (ite c!117577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!117576 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!117577 minValue!944 (ite c!117576 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapNonEmpty!47693 () Bool)

(declare-fun tp!90579 () Bool)

(assert (=> mapNonEmpty!47693 (= mapRes!47693 (and tp!90579 e!682473))))

(declare-fun mapRest!47693 () (Array (_ BitVec 32) ValueCell!14574))

(declare-fun mapValue!47693 () ValueCell!14574)

(declare-fun mapKey!47693 () (_ BitVec 32))

(assert (=> mapNonEmpty!47693 (= (arr!37599 _values!996) (store mapRest!47693 mapKey!47693 mapValue!47693))))

(declare-fun b!1201840 () Bool)

(declare-fun res!799985 () Bool)

(assert (=> b!1201840 (=> (not res!799985) (not e!682479))))

(assert (=> b!1201840 (= res!799985 (= (select (arr!37598 _keys!1208) i!673) k0!934))))

(declare-fun b!1201841 () Bool)

(assert (=> b!1201841 (= e!682479 e!682481)))

(declare-fun res!799991 () Bool)

(assert (=> b!1201841 (=> (not res!799991) (not e!682481))))

(declare-fun lt!544665 () array!77907)

(assert (=> b!1201841 (= res!799991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544665 mask!1564))))

(assert (=> b!1201841 (= lt!544665 (array!77908 (store (arr!37598 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38134 _keys!1208)))))

(declare-fun b!1201842 () Bool)

(declare-fun e!682483 () Bool)

(declare-fun e!682472 () Bool)

(assert (=> b!1201842 (= e!682483 e!682472)))

(declare-fun res!799998 () Bool)

(assert (=> b!1201842 (=> res!799998 e!682472)))

(assert (=> b!1201842 (= res!799998 (not (contains!6883 lt!544672 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5264 (array!77907 array!77909 (_ BitVec 32) (_ BitVec 32) V!45883 V!45883 (_ BitVec 32) Int) ListLongMap!17621)

(assert (=> b!1201842 (= lt!544672 (getCurrentListMapNoExtraKeys!5264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57557 () Bool)

(declare-fun lt!544668 () array!77909)

(assert (=> bm!57557 (= call!57556 (getCurrentListMapNoExtraKeys!5264 lt!544665 lt!544668 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201843 () Bool)

(assert (=> b!1201843 (= e!682470 (= call!57556 call!57561))))

(declare-fun mapIsEmpty!47693 () Bool)

(assert (=> mapIsEmpty!47693 mapRes!47693))

(declare-fun b!1201844 () Bool)

(declare-fun e!682474 () Bool)

(assert (=> b!1201844 (= e!682480 e!682474)))

(declare-fun res!799987 () Bool)

(assert (=> b!1201844 (=> res!799987 e!682474)))

(assert (=> b!1201844 (= res!799987 (not (= from!1455 i!673)))))

(declare-fun lt!544671 () ListLongMap!17621)

(assert (=> b!1201844 (= lt!544671 (getCurrentListMapNoExtraKeys!5264 lt!544665 lt!544668 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3180 (Int (_ BitVec 64)) V!45883)

(assert (=> b!1201844 (= lt!544668 (array!77910 (store (arr!37599 _values!996) i!673 (ValueCellFull!14574 (dynLambda!3180 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38135 _values!996)))))

(declare-fun lt!544674 () ListLongMap!17621)

(assert (=> b!1201844 (= lt!544674 (getCurrentListMapNoExtraKeys!5264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201845 () Bool)

(declare-fun e!682482 () Unit!39844)

(assert (=> b!1201845 (= e!682475 e!682482)))

(declare-fun lt!544677 () Bool)

(assert (=> b!1201845 (= c!117576 (and (not lt!544677) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1201846 () Bool)

(declare-fun res!799988 () Bool)

(assert (=> b!1201846 (=> (not res!799988) (not e!682479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201846 (= res!799988 (validMask!0 mask!1564))))

(declare-fun b!1201847 () Bool)

(assert (=> b!1201847 (= e!682474 e!682483)))

(declare-fun res!799986 () Bool)

(assert (=> b!1201847 (=> res!799986 e!682483)))

(assert (=> b!1201847 (= res!799986 (not (= (select (arr!37598 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1201847 e!682470))

(declare-fun c!117578 () Bool)

(assert (=> b!1201847 (= c!117578 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544670 () Unit!39844)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1003 (array!77907 array!77909 (_ BitVec 32) (_ BitVec 32) V!45883 V!45883 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39844)

(assert (=> b!1201847 (= lt!544670 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1003 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201848 () Bool)

(assert (=> b!1201848 (= e!682472 true)))

(declare-fun lt!544666 () Unit!39844)

(assert (=> b!1201848 (= lt!544666 e!682475)))

(assert (=> b!1201848 (= c!117577 (and (not lt!544677) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1201848 (= lt!544677 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1201849 () Bool)

(declare-fun lt!544667 () Unit!39844)

(assert (=> b!1201849 (= e!682476 lt!544667)))

(assert (=> b!1201849 (= lt!544667 call!57560)))

(declare-fun call!57563 () Bool)

(assert (=> b!1201849 call!57563))

(declare-fun b!1201850 () Bool)

(declare-fun c!117575 () Bool)

(assert (=> b!1201850 (= c!117575 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544677))))

(assert (=> b!1201850 (= e!682482 e!682476)))

(declare-fun b!1201851 () Bool)

(declare-fun res!799989 () Bool)

(assert (=> b!1201851 (=> (not res!799989) (not e!682479))))

(assert (=> b!1201851 (= res!799989 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38134 _keys!1208))))))

(declare-fun b!1201852 () Bool)

(declare-fun res!799994 () Bool)

(assert (=> b!1201852 (=> (not res!799994) (not e!682481))))

(assert (=> b!1201852 (= res!799994 (arrayNoDuplicates!0 lt!544665 #b00000000000000000000000000000000 Nil!26465))))

(declare-fun b!1201853 () Bool)

(assert (=> b!1201853 call!57563))

(declare-fun lt!544676 () Unit!39844)

(assert (=> b!1201853 (= lt!544676 call!57560)))

(assert (=> b!1201853 (= e!682482 lt!544676)))

(declare-fun b!1201854 () Bool)

(assert (=> b!1201854 (= e!682478 tp_is_empty!30567)))

(declare-fun bm!57558 () Bool)

(assert (=> bm!57558 (= call!57563 call!57557)))

(declare-fun bm!57559 () Bool)

(assert (=> bm!57559 (= call!57561 (getCurrentListMapNoExtraKeys!5264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57560 () Bool)

(assert (=> bm!57560 (= call!57557 (contains!6883 (ite c!117577 lt!544678 call!57558) k0!934))))

(assert (= (and start!100540 res!799993) b!1201846))

(assert (= (and b!1201846 res!799988) b!1201833))

(assert (= (and b!1201833 res!799995) b!1201830))

(assert (= (and b!1201830 res!799990) b!1201836))

(assert (= (and b!1201836 res!799996) b!1201851))

(assert (= (and b!1201851 res!799989) b!1201834))

(assert (= (and b!1201834 res!799992) b!1201840))

(assert (= (and b!1201840 res!799985) b!1201841))

(assert (= (and b!1201841 res!799991) b!1201852))

(assert (= (and b!1201852 res!799994) b!1201831))

(assert (= (and b!1201831 (not res!799997)) b!1201844))

(assert (= (and b!1201844 (not res!799987)) b!1201847))

(assert (= (and b!1201847 c!117578) b!1201838))

(assert (= (and b!1201847 (not c!117578)) b!1201843))

(assert (= (or b!1201838 b!1201843) bm!57557))

(assert (= (or b!1201838 b!1201843) bm!57559))

(assert (= (and b!1201847 (not res!799986)) b!1201842))

(assert (= (and b!1201842 (not res!799998)) b!1201848))

(assert (= (and b!1201848 c!117577) b!1201837))

(assert (= (and b!1201848 (not c!117577)) b!1201845))

(assert (= (and b!1201845 c!117576) b!1201853))

(assert (= (and b!1201845 (not c!117576)) b!1201850))

(assert (= (and b!1201850 c!117575) b!1201849))

(assert (= (and b!1201850 (not c!117575)) b!1201839))

(assert (= (or b!1201853 b!1201849) bm!57555))

(assert (= (or b!1201853 b!1201849) bm!57553))

(assert (= (or b!1201853 b!1201849) bm!57558))

(assert (= (or b!1201837 bm!57558) bm!57560))

(assert (= (or b!1201837 bm!57555) bm!57556))

(assert (= (or b!1201837 bm!57553) bm!57554))

(assert (= (and b!1201835 condMapEmpty!47693) mapIsEmpty!47693))

(assert (= (and b!1201835 (not condMapEmpty!47693)) mapNonEmpty!47693))

(get-info :version)

(assert (= (and mapNonEmpty!47693 ((_ is ValueCellFull!14574) mapValue!47693)) b!1201832))

(assert (= (and b!1201835 ((_ is ValueCellFull!14574) mapDefault!47693)) b!1201854))

(assert (= start!100540 b!1201835))

(declare-fun b_lambda!21059 () Bool)

(assert (=> (not b_lambda!21059) (not b!1201844)))

(declare-fun t!39309 () Bool)

(declare-fun tb!10663 () Bool)

(assert (=> (and start!100540 (= defaultEntry!1004 defaultEntry!1004) t!39309) tb!10663))

(declare-fun result!21903 () Bool)

(assert (=> tb!10663 (= result!21903 tp_is_empty!30567)))

(assert (=> b!1201844 t!39309))

(declare-fun b_and!42615 () Bool)

(assert (= b_and!42613 (and (=> t!39309 result!21903) b_and!42615)))

(declare-fun m!1107839 () Bool)

(assert (=> b!1201844 m!1107839))

(declare-fun m!1107841 () Bool)

(assert (=> b!1201844 m!1107841))

(declare-fun m!1107843 () Bool)

(assert (=> b!1201844 m!1107843))

(declare-fun m!1107845 () Bool)

(assert (=> b!1201844 m!1107845))

(declare-fun m!1107847 () Bool)

(assert (=> mapNonEmpty!47693 m!1107847))

(declare-fun m!1107849 () Bool)

(assert (=> b!1201831 m!1107849))

(declare-fun m!1107851 () Bool)

(assert (=> b!1201831 m!1107851))

(declare-fun m!1107853 () Bool)

(assert (=> bm!57554 m!1107853))

(declare-fun m!1107855 () Bool)

(assert (=> start!100540 m!1107855))

(declare-fun m!1107857 () Bool)

(assert (=> start!100540 m!1107857))

(declare-fun m!1107859 () Bool)

(assert (=> b!1201847 m!1107859))

(declare-fun m!1107861 () Bool)

(assert (=> b!1201847 m!1107861))

(declare-fun m!1107863 () Bool)

(assert (=> bm!57560 m!1107863))

(declare-fun m!1107865 () Bool)

(assert (=> b!1201837 m!1107865))

(declare-fun m!1107867 () Bool)

(assert (=> b!1201837 m!1107867))

(assert (=> b!1201837 m!1107867))

(declare-fun m!1107869 () Bool)

(assert (=> b!1201837 m!1107869))

(declare-fun m!1107871 () Bool)

(assert (=> b!1201834 m!1107871))

(declare-fun m!1107873 () Bool)

(assert (=> bm!57557 m!1107873))

(declare-fun m!1107875 () Bool)

(assert (=> b!1201842 m!1107875))

(declare-fun m!1107877 () Bool)

(assert (=> b!1201842 m!1107877))

(assert (=> bm!57559 m!1107877))

(declare-fun m!1107879 () Bool)

(assert (=> b!1201836 m!1107879))

(declare-fun m!1107881 () Bool)

(assert (=> b!1201846 m!1107881))

(declare-fun m!1107883 () Bool)

(assert (=> b!1201852 m!1107883))

(declare-fun m!1107885 () Bool)

(assert (=> b!1201841 m!1107885))

(declare-fun m!1107887 () Bool)

(assert (=> b!1201841 m!1107887))

(declare-fun m!1107889 () Bool)

(assert (=> bm!57556 m!1107889))

(declare-fun m!1107891 () Bool)

(assert (=> b!1201840 m!1107891))

(declare-fun m!1107893 () Bool)

(assert (=> b!1201830 m!1107893))

(declare-fun m!1107895 () Bool)

(assert (=> b!1201838 m!1107895))

(check-sat (not mapNonEmpty!47693) (not start!100540) (not b!1201834) (not b!1201847) (not bm!57556) (not b!1201837) (not b!1201846) (not b!1201838) (not b!1201852) b_and!42615 (not b!1201844) tp_is_empty!30567 (not b!1201836) (not b!1201831) (not b!1201841) (not bm!57554) (not b_lambda!21059) (not bm!57559) (not bm!57560) (not b!1201842) (not b!1201830) (not b_next!25863) (not bm!57557))
(check-sat b_and!42615 (not b_next!25863))
