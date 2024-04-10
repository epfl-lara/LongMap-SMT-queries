; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100546 () Bool)

(assert start!100546)

(declare-fun b_free!25869 () Bool)

(declare-fun b_next!25869 () Bool)

(assert (=> start!100546 (= b_free!25869 (not b_next!25869))))

(declare-fun tp!90597 () Bool)

(declare-fun b_and!42625 () Bool)

(assert (=> start!100546 (= tp!90597 b_and!42625)))

(declare-datatypes ((V!45891 0))(
  ( (V!45892 (val!15343 Int)) )
))
(declare-fun zeroValue!944 () V!45891)

(declare-fun c!117613 () Bool)

(declare-datatypes ((tuple2!19658 0))(
  ( (tuple2!19659 (_1!9840 (_ BitVec 64)) (_2!9840 V!45891)) )
))
(declare-datatypes ((List!26472 0))(
  ( (Nil!26469) (Cons!26468 (h!27677 tuple2!19658) (t!39321 List!26472)) )
))
(declare-datatypes ((ListLongMap!17627 0))(
  ( (ListLongMap!17628 (toList!8829 List!26472)) )
))
(declare-fun lt!544792 () ListLongMap!17627)

(declare-fun c!117614 () Bool)

(declare-fun call!57630 () ListLongMap!17627)

(declare-fun minValue!944 () V!45891)

(declare-fun bm!57625 () Bool)

(declare-fun +!3958 (ListLongMap!17627 tuple2!19658) ListLongMap!17627)

(assert (=> bm!57625 (= call!57630 (+!3958 lt!544792 (ite (or c!117614 c!117613) (tuple2!19659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1202061 () Bool)

(declare-fun res!800111 () Bool)

(declare-fun e!682608 () Bool)

(assert (=> b!1202061 (=> (not res!800111) (not e!682608))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77919 0))(
  ( (array!77920 (arr!37604 (Array (_ BitVec 32) (_ BitVec 64))) (size!38140 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77919)

(assert (=> b!1202061 (= res!800111 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38140 _keys!1208))))))

(declare-fun b!1202062 () Bool)

(declare-fun res!800121 () Bool)

(assert (=> b!1202062 (=> (not res!800121) (not e!682608))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202062 (= res!800121 (validMask!0 mask!1564))))

(declare-fun b!1202063 () Bool)

(declare-fun e!682598 () Bool)

(assert (=> b!1202063 (= e!682598 true)))

(declare-datatypes ((Unit!39852 0))(
  ( (Unit!39853) )
))
(declare-fun lt!544796 () Unit!39852)

(declare-fun e!682603 () Unit!39852)

(assert (=> b!1202063 (= lt!544796 e!682603)))

(declare-fun lt!544795 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1202063 (= c!117614 (and (not lt!544795) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202063 (= lt!544795 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202064 () Bool)

(declare-fun e!682605 () Bool)

(declare-fun call!57633 () ListLongMap!17627)

(declare-fun call!57635 () ListLongMap!17627)

(assert (=> b!1202064 (= e!682605 (= call!57633 call!57635))))

(declare-fun b!1202065 () Bool)

(declare-fun res!800122 () Bool)

(assert (=> b!1202065 (=> (not res!800122) (not e!682608))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202065 (= res!800122 (validKeyInArray!0 k0!934))))

(declare-fun bm!57626 () Bool)

(declare-fun call!57629 () Bool)

(declare-fun call!57634 () Bool)

(assert (=> bm!57626 (= call!57629 call!57634)))

(declare-fun b!1202066 () Bool)

(declare-fun res!800124 () Bool)

(assert (=> b!1202066 (=> (not res!800124) (not e!682608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77919 (_ BitVec 32)) Bool)

(assert (=> b!1202066 (= res!800124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57627 () Bool)

(declare-datatypes ((ValueCell!14577 0))(
  ( (ValueCellFull!14577 (v!17981 V!45891)) (EmptyCell!14577) )
))
(declare-datatypes ((array!77921 0))(
  ( (array!77922 (arr!37605 (Array (_ BitVec 32) ValueCell!14577)) (size!38141 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77921)

(declare-fun getCurrentListMapNoExtraKeys!5267 (array!77919 array!77921 (_ BitVec 32) (_ BitVec 32) V!45891 V!45891 (_ BitVec 32) Int) ListLongMap!17627)

(assert (=> bm!57627 (= call!57635 (getCurrentListMapNoExtraKeys!5267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57628 () Bool)

(declare-fun call!57632 () ListLongMap!17627)

(assert (=> bm!57628 (= call!57632 call!57630)))

(declare-fun b!1202067 () Bool)

(declare-fun e!682609 () Bool)

(declare-fun e!682597 () Bool)

(assert (=> b!1202067 (= e!682609 (not e!682597))))

(declare-fun res!800113 () Bool)

(assert (=> b!1202067 (=> res!800113 e!682597)))

(assert (=> b!1202067 (= res!800113 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202067 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544800 () Unit!39852)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77919 (_ BitVec 64) (_ BitVec 32)) Unit!39852)

(assert (=> b!1202067 (= lt!544800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202068 () Bool)

(declare-fun c!117612 () Bool)

(assert (=> b!1202068 (= c!117612 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544795))))

(declare-fun e!682599 () Unit!39852)

(declare-fun e!682600 () Unit!39852)

(assert (=> b!1202068 (= e!682599 e!682600)))

(declare-fun b!1202069 () Bool)

(declare-fun lt!544799 () Unit!39852)

(assert (=> b!1202069 (= e!682600 lt!544799)))

(declare-fun call!57631 () Unit!39852)

(assert (=> b!1202069 (= lt!544799 call!57631)))

(assert (=> b!1202069 call!57629))

(declare-fun lt!544803 () array!77921)

(declare-fun bm!57630 () Bool)

(declare-fun lt!544798 () array!77919)

(assert (=> bm!57630 (= call!57633 (getCurrentListMapNoExtraKeys!5267 lt!544798 lt!544803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202070 () Bool)

(declare-fun e!682596 () Bool)

(assert (=> b!1202070 (= e!682596 e!682598)))

(declare-fun res!800123 () Bool)

(assert (=> b!1202070 (=> res!800123 e!682598)))

(declare-fun contains!6885 (ListLongMap!17627 (_ BitVec 64)) Bool)

(assert (=> b!1202070 (= res!800123 (not (contains!6885 lt!544792 k0!934)))))

(assert (=> b!1202070 (= lt!544792 (getCurrentListMapNoExtraKeys!5267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202071 () Bool)

(declare-fun e!682602 () Bool)

(declare-fun tp_is_empty!30573 () Bool)

(assert (=> b!1202071 (= e!682602 tp_is_empty!30573)))

(declare-fun mapIsEmpty!47702 () Bool)

(declare-fun mapRes!47702 () Bool)

(assert (=> mapIsEmpty!47702 mapRes!47702))

(declare-fun b!1202072 () Bool)

(declare-fun lt!544794 () Unit!39852)

(assert (=> b!1202072 (= e!682603 lt!544794)))

(declare-fun lt!544804 () Unit!39852)

(declare-fun call!57628 () Unit!39852)

(assert (=> b!1202072 (= lt!544804 call!57628)))

(declare-fun lt!544802 () ListLongMap!17627)

(assert (=> b!1202072 (= lt!544802 call!57630)))

(assert (=> b!1202072 call!57634))

(declare-fun addStillContains!986 (ListLongMap!17627 (_ BitVec 64) V!45891 (_ BitVec 64)) Unit!39852)

(assert (=> b!1202072 (= lt!544794 (addStillContains!986 lt!544802 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1202072 (contains!6885 (+!3958 lt!544802 (tuple2!19659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1202073 () Bool)

(declare-fun e!682604 () Bool)

(declare-fun e!682601 () Bool)

(assert (=> b!1202073 (= e!682604 (and e!682601 mapRes!47702))))

(declare-fun condMapEmpty!47702 () Bool)

(declare-fun mapDefault!47702 () ValueCell!14577)

(assert (=> b!1202073 (= condMapEmpty!47702 (= (arr!37605 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14577)) mapDefault!47702)))))

(declare-fun b!1202074 () Bool)

(declare-fun res!800118 () Bool)

(assert (=> b!1202074 (=> (not res!800118) (not e!682608))))

(assert (=> b!1202074 (= res!800118 (= (select (arr!37604 _keys!1208) i!673) k0!934))))

(declare-fun b!1202075 () Bool)

(declare-fun e!682607 () Bool)

(assert (=> b!1202075 (= e!682607 e!682596)))

(declare-fun res!800117 () Bool)

(assert (=> b!1202075 (=> res!800117 e!682596)))

(assert (=> b!1202075 (= res!800117 (not (= (select (arr!37604 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1202075 e!682605))

(declare-fun c!117611 () Bool)

(assert (=> b!1202075 (= c!117611 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544801 () Unit!39852)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1005 (array!77919 array!77921 (_ BitVec 32) (_ BitVec 32) V!45891 V!45891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39852)

(assert (=> b!1202075 (= lt!544801 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202076 () Bool)

(declare-fun res!800120 () Bool)

(assert (=> b!1202076 (=> (not res!800120) (not e!682608))))

(assert (=> b!1202076 (= res!800120 (and (= (size!38141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38140 _keys!1208) (size!38141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!57631 () Bool)

(assert (=> bm!57631 (= call!57628 (addStillContains!986 lt!544792 (ite (or c!117614 c!117613) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117614 c!117613) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1202077 () Bool)

(declare-fun res!800112 () Bool)

(assert (=> b!1202077 (=> (not res!800112) (not e!682609))))

(declare-datatypes ((List!26473 0))(
  ( (Nil!26470) (Cons!26469 (h!27678 (_ BitVec 64)) (t!39322 List!26473)) )
))
(declare-fun arrayNoDuplicates!0 (array!77919 (_ BitVec 32) List!26473) Bool)

(assert (=> b!1202077 (= res!800112 (arrayNoDuplicates!0 lt!544798 #b00000000000000000000000000000000 Nil!26470))))

(declare-fun b!1202078 () Bool)

(assert (=> b!1202078 (= e!682601 tp_is_empty!30573)))

(declare-fun b!1202079 () Bool)

(assert (=> b!1202079 (= e!682597 e!682607)))

(declare-fun res!800119 () Bool)

(assert (=> b!1202079 (=> res!800119 e!682607)))

(assert (=> b!1202079 (= res!800119 (not (= from!1455 i!673)))))

(declare-fun lt!544793 () ListLongMap!17627)

(assert (=> b!1202079 (= lt!544793 (getCurrentListMapNoExtraKeys!5267 lt!544798 lt!544803 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3182 (Int (_ BitVec 64)) V!45891)

(assert (=> b!1202079 (= lt!544803 (array!77922 (store (arr!37605 _values!996) i!673 (ValueCellFull!14577 (dynLambda!3182 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38141 _values!996)))))

(declare-fun lt!544797 () ListLongMap!17627)

(assert (=> b!1202079 (= lt!544797 (getCurrentListMapNoExtraKeys!5267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1202080 () Bool)

(assert (=> b!1202080 (= e!682608 e!682609)))

(declare-fun res!800116 () Bool)

(assert (=> b!1202080 (=> (not res!800116) (not e!682609))))

(assert (=> b!1202080 (= res!800116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544798 mask!1564))))

(assert (=> b!1202080 (= lt!544798 (array!77920 (store (arr!37604 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38140 _keys!1208)))))

(declare-fun b!1202081 () Bool)

(assert (=> b!1202081 (= e!682603 e!682599)))

(assert (=> b!1202081 (= c!117613 (and (not lt!544795) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202082 () Bool)

(declare-fun res!800115 () Bool)

(assert (=> b!1202082 (=> (not res!800115) (not e!682608))))

(assert (=> b!1202082 (= res!800115 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26470))))

(declare-fun b!1202083 () Bool)

(declare-fun -!1799 (ListLongMap!17627 (_ BitVec 64)) ListLongMap!17627)

(assert (=> b!1202083 (= e!682605 (= call!57633 (-!1799 call!57635 k0!934)))))

(declare-fun bm!57632 () Bool)

(assert (=> bm!57632 (= call!57631 call!57628)))

(declare-fun b!1202084 () Bool)

(assert (=> b!1202084 call!57629))

(declare-fun lt!544791 () Unit!39852)

(assert (=> b!1202084 (= lt!544791 call!57631)))

(assert (=> b!1202084 (= e!682599 lt!544791)))

(declare-fun mapNonEmpty!47702 () Bool)

(declare-fun tp!90596 () Bool)

(assert (=> mapNonEmpty!47702 (= mapRes!47702 (and tp!90596 e!682602))))

(declare-fun mapKey!47702 () (_ BitVec 32))

(declare-fun mapRest!47702 () (Array (_ BitVec 32) ValueCell!14577))

(declare-fun mapValue!47702 () ValueCell!14577)

(assert (=> mapNonEmpty!47702 (= (arr!37605 _values!996) (store mapRest!47702 mapKey!47702 mapValue!47702))))

(declare-fun b!1202085 () Bool)

(declare-fun Unit!39854 () Unit!39852)

(assert (=> b!1202085 (= e!682600 Unit!39854)))

(declare-fun res!800114 () Bool)

(assert (=> start!100546 (=> (not res!800114) (not e!682608))))

(assert (=> start!100546 (= res!800114 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38140 _keys!1208))))))

(assert (=> start!100546 e!682608))

(assert (=> start!100546 tp_is_empty!30573))

(declare-fun array_inv!28656 (array!77919) Bool)

(assert (=> start!100546 (array_inv!28656 _keys!1208)))

(assert (=> start!100546 true))

(assert (=> start!100546 tp!90597))

(declare-fun array_inv!28657 (array!77921) Bool)

(assert (=> start!100546 (and (array_inv!28657 _values!996) e!682604)))

(declare-fun bm!57629 () Bool)

(assert (=> bm!57629 (= call!57634 (contains!6885 (ite c!117614 lt!544802 call!57632) k0!934))))

(assert (= (and start!100546 res!800114) b!1202062))

(assert (= (and b!1202062 res!800121) b!1202076))

(assert (= (and b!1202076 res!800120) b!1202066))

(assert (= (and b!1202066 res!800124) b!1202082))

(assert (= (and b!1202082 res!800115) b!1202061))

(assert (= (and b!1202061 res!800111) b!1202065))

(assert (= (and b!1202065 res!800122) b!1202074))

(assert (= (and b!1202074 res!800118) b!1202080))

(assert (= (and b!1202080 res!800116) b!1202077))

(assert (= (and b!1202077 res!800112) b!1202067))

(assert (= (and b!1202067 (not res!800113)) b!1202079))

(assert (= (and b!1202079 (not res!800119)) b!1202075))

(assert (= (and b!1202075 c!117611) b!1202083))

(assert (= (and b!1202075 (not c!117611)) b!1202064))

(assert (= (or b!1202083 b!1202064) bm!57630))

(assert (= (or b!1202083 b!1202064) bm!57627))

(assert (= (and b!1202075 (not res!800117)) b!1202070))

(assert (= (and b!1202070 (not res!800123)) b!1202063))

(assert (= (and b!1202063 c!117614) b!1202072))

(assert (= (and b!1202063 (not c!117614)) b!1202081))

(assert (= (and b!1202081 c!117613) b!1202084))

(assert (= (and b!1202081 (not c!117613)) b!1202068))

(assert (= (and b!1202068 c!117612) b!1202069))

(assert (= (and b!1202068 (not c!117612)) b!1202085))

(assert (= (or b!1202084 b!1202069) bm!57632))

(assert (= (or b!1202084 b!1202069) bm!57628))

(assert (= (or b!1202084 b!1202069) bm!57626))

(assert (= (or b!1202072 bm!57626) bm!57629))

(assert (= (or b!1202072 bm!57632) bm!57631))

(assert (= (or b!1202072 bm!57628) bm!57625))

(assert (= (and b!1202073 condMapEmpty!47702) mapIsEmpty!47702))

(assert (= (and b!1202073 (not condMapEmpty!47702)) mapNonEmpty!47702))

(get-info :version)

(assert (= (and mapNonEmpty!47702 ((_ is ValueCellFull!14577) mapValue!47702)) b!1202071))

(assert (= (and b!1202073 ((_ is ValueCellFull!14577) mapDefault!47702)) b!1202078))

(assert (= start!100546 b!1202073))

(declare-fun b_lambda!21065 () Bool)

(assert (=> (not b_lambda!21065) (not b!1202079)))

(declare-fun t!39320 () Bool)

(declare-fun tb!10669 () Bool)

(assert (=> (and start!100546 (= defaultEntry!1004 defaultEntry!1004) t!39320) tb!10669))

(declare-fun result!21915 () Bool)

(assert (=> tb!10669 (= result!21915 tp_is_empty!30573)))

(assert (=> b!1202079 t!39320))

(declare-fun b_and!42627 () Bool)

(assert (= b_and!42625 (and (=> t!39320 result!21915) b_and!42627)))

(declare-fun m!1108013 () Bool)

(assert (=> mapNonEmpty!47702 m!1108013))

(declare-fun m!1108015 () Bool)

(assert (=> b!1202066 m!1108015))

(declare-fun m!1108017 () Bool)

(assert (=> bm!57630 m!1108017))

(declare-fun m!1108019 () Bool)

(assert (=> b!1202079 m!1108019))

(declare-fun m!1108021 () Bool)

(assert (=> b!1202079 m!1108021))

(declare-fun m!1108023 () Bool)

(assert (=> b!1202079 m!1108023))

(declare-fun m!1108025 () Bool)

(assert (=> b!1202079 m!1108025))

(declare-fun m!1108027 () Bool)

(assert (=> bm!57627 m!1108027))

(declare-fun m!1108029 () Bool)

(assert (=> b!1202074 m!1108029))

(declare-fun m!1108031 () Bool)

(assert (=> b!1202065 m!1108031))

(declare-fun m!1108033 () Bool)

(assert (=> b!1202077 m!1108033))

(declare-fun m!1108035 () Bool)

(assert (=> bm!57625 m!1108035))

(declare-fun m!1108037 () Bool)

(assert (=> b!1202072 m!1108037))

(declare-fun m!1108039 () Bool)

(assert (=> b!1202072 m!1108039))

(assert (=> b!1202072 m!1108039))

(declare-fun m!1108041 () Bool)

(assert (=> b!1202072 m!1108041))

(declare-fun m!1108043 () Bool)

(assert (=> b!1202067 m!1108043))

(declare-fun m!1108045 () Bool)

(assert (=> b!1202067 m!1108045))

(declare-fun m!1108047 () Bool)

(assert (=> b!1202083 m!1108047))

(declare-fun m!1108049 () Bool)

(assert (=> b!1202080 m!1108049))

(declare-fun m!1108051 () Bool)

(assert (=> b!1202080 m!1108051))

(declare-fun m!1108053 () Bool)

(assert (=> bm!57629 m!1108053))

(declare-fun m!1108055 () Bool)

(assert (=> start!100546 m!1108055))

(declare-fun m!1108057 () Bool)

(assert (=> start!100546 m!1108057))

(declare-fun m!1108059 () Bool)

(assert (=> bm!57631 m!1108059))

(declare-fun m!1108061 () Bool)

(assert (=> b!1202075 m!1108061))

(declare-fun m!1108063 () Bool)

(assert (=> b!1202075 m!1108063))

(declare-fun m!1108065 () Bool)

(assert (=> b!1202070 m!1108065))

(assert (=> b!1202070 m!1108027))

(declare-fun m!1108067 () Bool)

(assert (=> b!1202062 m!1108067))

(declare-fun m!1108069 () Bool)

(assert (=> b!1202082 m!1108069))

(check-sat (not bm!57630) (not b!1202077) (not b!1202080) (not b!1202072) (not b!1202082) (not bm!57629) tp_is_empty!30573 (not b!1202067) (not b!1202066) (not mapNonEmpty!47702) b_and!42627 (not b!1202075) (not b!1202065) (not b_lambda!21065) (not start!100546) (not bm!57627) (not b_next!25869) (not b!1202070) (not b!1202079) (not b!1202062) (not bm!57631) (not b!1202083) (not bm!57625))
(check-sat b_and!42627 (not b_next!25869))
