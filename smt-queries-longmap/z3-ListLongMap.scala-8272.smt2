; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100644 () Bool)

(assert start!100644)

(declare-fun b_free!25905 () Bool)

(declare-fun b_next!25905 () Bool)

(assert (=> start!100644 (= b_free!25905 (not b_next!25905))))

(declare-fun tp!90709 () Bool)

(declare-fun b_and!42737 () Bool)

(assert (=> start!100644 (= tp!90709 b_and!42737)))

(declare-fun b!1203959 () Bool)

(declare-fun call!58109 () Bool)

(assert (=> b!1203959 call!58109))

(declare-datatypes ((Unit!39922 0))(
  ( (Unit!39923) )
))
(declare-fun lt!545876 () Unit!39922)

(declare-fun call!58110 () Unit!39922)

(assert (=> b!1203959 (= lt!545876 call!58110)))

(declare-fun e!683687 () Unit!39922)

(assert (=> b!1203959 (= e!683687 lt!545876)))

(declare-datatypes ((V!45939 0))(
  ( (V!45940 (val!15361 Int)) )
))
(declare-fun zeroValue!944 () V!45939)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!58104 () Bool)

(declare-fun c!117975 () Bool)

(declare-datatypes ((tuple2!19694 0))(
  ( (tuple2!19695 (_1!9858 (_ BitVec 64)) (_2!9858 V!45939)) )
))
(declare-datatypes ((List!26504 0))(
  ( (Nil!26501) (Cons!26500 (h!27709 tuple2!19694) (t!39389 List!26504)) )
))
(declare-datatypes ((ListLongMap!17663 0))(
  ( (ListLongMap!17664 (toList!8847 List!26504)) )
))
(declare-fun lt!545868 () ListLongMap!17663)

(declare-fun c!117974 () Bool)

(declare-fun call!58108 () Unit!39922)

(declare-fun minValue!944 () V!45939)

(declare-fun addStillContains!1002 (ListLongMap!17663 (_ BitVec 64) V!45939 (_ BitVec 64)) Unit!39922)

(assert (=> bm!58104 (= call!58108 (addStillContains!1002 lt!545868 (ite (or c!117974 c!117975) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117974 c!117975) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1203960 () Bool)

(declare-fun e!683690 () Bool)

(declare-fun e!683688 () Bool)

(assert (=> b!1203960 (= e!683690 e!683688)))

(declare-fun res!801072 () Bool)

(assert (=> b!1203960 (=> res!801072 e!683688)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203960 (= res!801072 (not (= from!1455 i!673)))))

(declare-datatypes ((ValueCell!14595 0))(
  ( (ValueCellFull!14595 (v!18002 V!45939)) (EmptyCell!14595) )
))
(declare-datatypes ((array!77993 0))(
  ( (array!77994 (arr!37640 (Array (_ BitVec 32) ValueCell!14595)) (size!38176 (_ BitVec 32))) )
))
(declare-fun lt!545869 () array!77993)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545867 () ListLongMap!17663)

(declare-datatypes ((array!77995 0))(
  ( (array!77996 (arr!37641 (Array (_ BitVec 32) (_ BitVec 64))) (size!38177 (_ BitVec 32))) )
))
(declare-fun lt!545873 () array!77995)

(declare-fun getCurrentListMapNoExtraKeys!5283 (array!77995 array!77993 (_ BitVec 32) (_ BitVec 32) V!45939 V!45939 (_ BitVec 32) Int) ListLongMap!17663)

(assert (=> b!1203960 (= lt!545867 (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77993)

(declare-fun dynLambda!3195 (Int (_ BitVec 64)) V!45939)

(assert (=> b!1203960 (= lt!545869 (array!77994 (store (arr!37640 _values!996) i!673 (ValueCellFull!14595 (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38176 _values!996)))))

(declare-fun _keys!1208 () array!77995)

(declare-fun lt!545875 () ListLongMap!17663)

(assert (=> b!1203960 (= lt!545875 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!58105 () Bool)

(declare-fun call!58111 () Bool)

(assert (=> bm!58105 (= call!58109 call!58111)))

(declare-fun e!683686 () Bool)

(declare-fun b!1203961 () Bool)

(declare-fun contains!6903 (ListLongMap!17663 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4432 (array!77995 array!77993 (_ BitVec 32) (_ BitVec 32) V!45939 V!45939 (_ BitVec 32) Int) ListLongMap!17663)

(assert (=> b!1203961 (= e!683686 (contains!6903 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1203962 () Bool)

(declare-fun e!683692 () Unit!39922)

(declare-fun Unit!39924 () Unit!39922)

(assert (=> b!1203962 (= e!683692 Unit!39924)))

(declare-fun b!1203963 () Bool)

(declare-fun res!801079 () Bool)

(declare-fun e!683679 () Bool)

(assert (=> b!1203963 (=> (not res!801079) (not e!683679))))

(declare-datatypes ((List!26505 0))(
  ( (Nil!26502) (Cons!26501 (h!27710 (_ BitVec 64)) (t!39390 List!26505)) )
))
(declare-fun arrayNoDuplicates!0 (array!77995 (_ BitVec 32) List!26505) Bool)

(assert (=> b!1203963 (= res!801079 (arrayNoDuplicates!0 lt!545873 #b00000000000000000000000000000000 Nil!26502))))

(declare-fun b!1203964 () Bool)

(declare-fun e!683683 () Unit!39922)

(declare-fun lt!545865 () Unit!39922)

(assert (=> b!1203964 (= e!683683 lt!545865)))

(declare-fun lt!545866 () Unit!39922)

(assert (=> b!1203964 (= lt!545866 call!58108)))

(declare-fun lt!545864 () ListLongMap!17663)

(declare-fun call!58113 () ListLongMap!17663)

(assert (=> b!1203964 (= lt!545864 call!58113)))

(assert (=> b!1203964 call!58111))

(assert (=> b!1203964 (= lt!545865 (addStillContains!1002 lt!545864 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3973 (ListLongMap!17663 tuple2!19694) ListLongMap!17663)

(assert (=> b!1203964 (contains!6903 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1203965 () Bool)

(declare-fun res!801075 () Bool)

(declare-fun e!683684 () Bool)

(assert (=> b!1203965 (=> (not res!801075) (not e!683684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203965 (= res!801075 (validKeyInArray!0 k0!934))))

(declare-fun b!1203966 () Bool)

(assert (=> b!1203966 (= e!683683 e!683687)))

(declare-fun lt!545877 () Bool)

(assert (=> b!1203966 (= c!117975 (and (not lt!545877) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203967 () Bool)

(declare-fun res!801086 () Bool)

(assert (=> b!1203967 (=> (not res!801086) (not e!683684))))

(assert (=> b!1203967 (= res!801086 (= (select (arr!37641 _keys!1208) i!673) k0!934))))

(declare-fun b!1203968 () Bool)

(declare-fun e!683681 () Bool)

(declare-fun tp_is_empty!30609 () Bool)

(assert (=> b!1203968 (= e!683681 tp_is_empty!30609)))

(declare-fun b!1203969 () Bool)

(declare-fun c!117977 () Bool)

(assert (=> b!1203969 (= c!117977 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545877))))

(assert (=> b!1203969 (= e!683687 e!683692)))

(declare-fun bm!58106 () Bool)

(assert (=> bm!58106 (= call!58113 (+!3973 lt!545868 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun call!58112 () ListLongMap!17663)

(declare-fun bm!58107 () Bool)

(assert (=> bm!58107 (= call!58112 (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203970 () Bool)

(declare-fun res!801074 () Bool)

(assert (=> b!1203970 (=> (not res!801074) (not e!683684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77995 (_ BitVec 32)) Bool)

(assert (=> b!1203970 (= res!801074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47760 () Bool)

(declare-fun mapRes!47760 () Bool)

(assert (=> mapIsEmpty!47760 mapRes!47760))

(declare-fun b!1203971 () Bool)

(declare-fun res!801078 () Bool)

(assert (=> b!1203971 (=> (not res!801078) (not e!683684))))

(assert (=> b!1203971 (= res!801078 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38177 _keys!1208))))))

(declare-fun b!1203972 () Bool)

(declare-fun e!683685 () Bool)

(declare-fun call!58114 () ListLongMap!17663)

(assert (=> b!1203972 (= e!683685 (= call!58112 call!58114))))

(declare-fun b!1203973 () Bool)

(declare-fun res!801083 () Bool)

(assert (=> b!1203973 (=> (not res!801083) (not e!683684))))

(assert (=> b!1203973 (= res!801083 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26502))))

(declare-fun b!1203974 () Bool)

(assert (=> b!1203974 (= e!683684 e!683679)))

(declare-fun res!801073 () Bool)

(assert (=> b!1203974 (=> (not res!801073) (not e!683679))))

(assert (=> b!1203974 (= res!801073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545873 mask!1564))))

(assert (=> b!1203974 (= lt!545873 (array!77996 (store (arr!37641 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38177 _keys!1208)))))

(declare-fun mapNonEmpty!47760 () Bool)

(declare-fun tp!90708 () Bool)

(declare-fun e!683689 () Bool)

(assert (=> mapNonEmpty!47760 (= mapRes!47760 (and tp!90708 e!683689))))

(declare-fun mapKey!47760 () (_ BitVec 32))

(declare-fun mapValue!47760 () ValueCell!14595)

(declare-fun mapRest!47760 () (Array (_ BitVec 32) ValueCell!14595))

(assert (=> mapNonEmpty!47760 (= (arr!37640 _values!996) (store mapRest!47760 mapKey!47760 mapValue!47760))))

(declare-fun bm!58108 () Bool)

(declare-fun call!58107 () ListLongMap!17663)

(assert (=> bm!58108 (= call!58111 (contains!6903 (ite c!117974 lt!545864 call!58107) k0!934))))

(declare-fun bm!58109 () Bool)

(assert (=> bm!58109 (= call!58114 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203975 () Bool)

(declare-fun e!683693 () Bool)

(assert (=> b!1203975 (= e!683688 e!683693)))

(declare-fun res!801085 () Bool)

(assert (=> b!1203975 (=> res!801085 e!683693)))

(assert (=> b!1203975 (= res!801085 (not (= (select (arr!37641 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203975 e!683685))

(declare-fun c!117976 () Bool)

(assert (=> b!1203975 (= c!117976 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545870 () Unit!39922)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1018 (array!77995 array!77993 (_ BitVec 32) (_ BitVec 32) V!45939 V!45939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39922)

(assert (=> b!1203975 (= lt!545870 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1018 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203976 () Bool)

(declare-fun res!801076 () Bool)

(assert (=> b!1203976 (=> (not res!801076) (not e!683684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203976 (= res!801076 (validMask!0 mask!1564))))

(declare-fun b!1203977 () Bool)

(declare-fun res!801080 () Bool)

(assert (=> b!1203977 (=> (not res!801080) (not e!683684))))

(assert (=> b!1203977 (= res!801080 (and (= (size!38176 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38177 _keys!1208) (size!38176 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203978 () Bool)

(declare-fun e!683682 () Bool)

(assert (=> b!1203978 (= e!683693 e!683682)))

(declare-fun res!801082 () Bool)

(assert (=> b!1203978 (=> res!801082 e!683682)))

(assert (=> b!1203978 (= res!801082 (not (contains!6903 lt!545868 k0!934)))))

(assert (=> b!1203978 (= lt!545868 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!801084 () Bool)

(assert (=> start!100644 (=> (not res!801084) (not e!683684))))

(assert (=> start!100644 (= res!801084 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38177 _keys!1208))))))

(assert (=> start!100644 e!683684))

(assert (=> start!100644 tp_is_empty!30609))

(declare-fun array_inv!28676 (array!77995) Bool)

(assert (=> start!100644 (array_inv!28676 _keys!1208)))

(assert (=> start!100644 true))

(assert (=> start!100644 tp!90709))

(declare-fun e!683680 () Bool)

(declare-fun array_inv!28677 (array!77993) Bool)

(assert (=> start!100644 (and (array_inv!28677 _values!996) e!683680)))

(declare-fun b!1203979 () Bool)

(assert (=> b!1203979 (= e!683682 e!683686)))

(declare-fun res!801081 () Bool)

(assert (=> b!1203979 (=> res!801081 e!683686)))

(assert (=> b!1203979 (= res!801081 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208))))))

(declare-fun lt!545871 () Unit!39922)

(assert (=> b!1203979 (= lt!545871 e!683683)))

(assert (=> b!1203979 (= c!117974 (and (not lt!545877) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203979 (= lt!545877 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203980 () Bool)

(assert (=> b!1203980 (= e!683680 (and e!683681 mapRes!47760))))

(declare-fun condMapEmpty!47760 () Bool)

(declare-fun mapDefault!47760 () ValueCell!14595)

(assert (=> b!1203980 (= condMapEmpty!47760 (= (arr!37640 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14595)) mapDefault!47760)))))

(declare-fun b!1203981 () Bool)

(assert (=> b!1203981 (= e!683689 tp_is_empty!30609)))

(declare-fun b!1203982 () Bool)

(declare-fun -!1813 (ListLongMap!17663 (_ BitVec 64)) ListLongMap!17663)

(assert (=> b!1203982 (= e!683685 (= call!58112 (-!1813 call!58114 k0!934)))))

(declare-fun bm!58110 () Bool)

(assert (=> bm!58110 (= call!58107 call!58113)))

(declare-fun b!1203983 () Bool)

(assert (=> b!1203983 (= e!683679 (not e!683690))))

(declare-fun res!801077 () Bool)

(assert (=> b!1203983 (=> res!801077 e!683690)))

(assert (=> b!1203983 (= res!801077 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203983 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545872 () Unit!39922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77995 (_ BitVec 64) (_ BitVec 32)) Unit!39922)

(assert (=> b!1203983 (= lt!545872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1203984 () Bool)

(declare-fun lt!545874 () Unit!39922)

(assert (=> b!1203984 (= e!683692 lt!545874)))

(assert (=> b!1203984 (= lt!545874 call!58110)))

(assert (=> b!1203984 call!58109))

(declare-fun bm!58111 () Bool)

(assert (=> bm!58111 (= call!58110 call!58108)))

(assert (= (and start!100644 res!801084) b!1203976))

(assert (= (and b!1203976 res!801076) b!1203977))

(assert (= (and b!1203977 res!801080) b!1203970))

(assert (= (and b!1203970 res!801074) b!1203973))

(assert (= (and b!1203973 res!801083) b!1203971))

(assert (= (and b!1203971 res!801078) b!1203965))

(assert (= (and b!1203965 res!801075) b!1203967))

(assert (= (and b!1203967 res!801086) b!1203974))

(assert (= (and b!1203974 res!801073) b!1203963))

(assert (= (and b!1203963 res!801079) b!1203983))

(assert (= (and b!1203983 (not res!801077)) b!1203960))

(assert (= (and b!1203960 (not res!801072)) b!1203975))

(assert (= (and b!1203975 c!117976) b!1203982))

(assert (= (and b!1203975 (not c!117976)) b!1203972))

(assert (= (or b!1203982 b!1203972) bm!58107))

(assert (= (or b!1203982 b!1203972) bm!58109))

(assert (= (and b!1203975 (not res!801085)) b!1203978))

(assert (= (and b!1203978 (not res!801082)) b!1203979))

(assert (= (and b!1203979 c!117974) b!1203964))

(assert (= (and b!1203979 (not c!117974)) b!1203966))

(assert (= (and b!1203966 c!117975) b!1203959))

(assert (= (and b!1203966 (not c!117975)) b!1203969))

(assert (= (and b!1203969 c!117977) b!1203984))

(assert (= (and b!1203969 (not c!117977)) b!1203962))

(assert (= (or b!1203959 b!1203984) bm!58111))

(assert (= (or b!1203959 b!1203984) bm!58110))

(assert (= (or b!1203959 b!1203984) bm!58105))

(assert (= (or b!1203964 bm!58105) bm!58108))

(assert (= (or b!1203964 bm!58111) bm!58104))

(assert (= (or b!1203964 bm!58110) bm!58106))

(assert (= (and b!1203979 (not res!801081)) b!1203961))

(assert (= (and b!1203980 condMapEmpty!47760) mapIsEmpty!47760))

(assert (= (and b!1203980 (not condMapEmpty!47760)) mapNonEmpty!47760))

(get-info :version)

(assert (= (and mapNonEmpty!47760 ((_ is ValueCellFull!14595) mapValue!47760)) b!1203981))

(assert (= (and b!1203980 ((_ is ValueCellFull!14595) mapDefault!47760)) b!1203968))

(assert (= start!100644 b!1203980))

(declare-fun b_lambda!21183 () Bool)

(assert (=> (not b_lambda!21183) (not b!1203960)))

(declare-fun t!39388 () Bool)

(declare-fun tb!10705 () Bool)

(assert (=> (and start!100644 (= defaultEntry!1004 defaultEntry!1004) t!39388) tb!10705))

(declare-fun result!21989 () Bool)

(assert (=> tb!10705 (= result!21989 tp_is_empty!30609)))

(assert (=> b!1203960 t!39388))

(declare-fun b_and!42739 () Bool)

(assert (= b_and!42737 (and (=> t!39388 result!21989) b_and!42739)))

(declare-fun m!1109947 () Bool)

(assert (=> b!1203970 m!1109947))

(declare-fun m!1109949 () Bool)

(assert (=> bm!58109 m!1109949))

(declare-fun m!1109951 () Bool)

(assert (=> b!1203974 m!1109951))

(declare-fun m!1109953 () Bool)

(assert (=> b!1203974 m!1109953))

(declare-fun m!1109955 () Bool)

(assert (=> b!1203967 m!1109955))

(declare-fun m!1109957 () Bool)

(assert (=> b!1203982 m!1109957))

(declare-fun m!1109959 () Bool)

(assert (=> start!100644 m!1109959))

(declare-fun m!1109961 () Bool)

(assert (=> start!100644 m!1109961))

(declare-fun m!1109963 () Bool)

(assert (=> b!1203961 m!1109963))

(assert (=> b!1203961 m!1109963))

(declare-fun m!1109965 () Bool)

(assert (=> b!1203961 m!1109965))

(declare-fun m!1109967 () Bool)

(assert (=> b!1203964 m!1109967))

(declare-fun m!1109969 () Bool)

(assert (=> b!1203964 m!1109969))

(assert (=> b!1203964 m!1109969))

(declare-fun m!1109971 () Bool)

(assert (=> b!1203964 m!1109971))

(declare-fun m!1109973 () Bool)

(assert (=> b!1203976 m!1109973))

(declare-fun m!1109975 () Bool)

(assert (=> bm!58108 m!1109975))

(declare-fun m!1109977 () Bool)

(assert (=> bm!58107 m!1109977))

(declare-fun m!1109979 () Bool)

(assert (=> b!1203965 m!1109979))

(declare-fun m!1109981 () Bool)

(assert (=> b!1203973 m!1109981))

(declare-fun m!1109983 () Bool)

(assert (=> b!1203978 m!1109983))

(assert (=> b!1203978 m!1109949))

(declare-fun m!1109985 () Bool)

(assert (=> mapNonEmpty!47760 m!1109985))

(declare-fun m!1109987 () Bool)

(assert (=> b!1203983 m!1109987))

(declare-fun m!1109989 () Bool)

(assert (=> b!1203983 m!1109989))

(declare-fun m!1109991 () Bool)

(assert (=> b!1203960 m!1109991))

(declare-fun m!1109993 () Bool)

(assert (=> b!1203960 m!1109993))

(declare-fun m!1109995 () Bool)

(assert (=> b!1203960 m!1109995))

(declare-fun m!1109997 () Bool)

(assert (=> b!1203960 m!1109997))

(declare-fun m!1109999 () Bool)

(assert (=> bm!58106 m!1109999))

(declare-fun m!1110001 () Bool)

(assert (=> bm!58104 m!1110001))

(declare-fun m!1110003 () Bool)

(assert (=> b!1203975 m!1110003))

(declare-fun m!1110005 () Bool)

(assert (=> b!1203975 m!1110005))

(declare-fun m!1110007 () Bool)

(assert (=> b!1203963 m!1110007))

(check-sat (not b!1203970) (not b!1203975) (not bm!58107) (not b!1203983) (not bm!58104) (not bm!58109) (not b_lambda!21183) (not bm!58106) (not b!1203973) (not b!1203982) (not b!1203963) (not mapNonEmpty!47760) (not b!1203965) (not start!100644) (not bm!58108) (not b!1203961) b_and!42739 (not b_next!25905) (not b!1203960) (not b!1203978) (not b!1203976) (not b!1203964) tp_is_empty!30609 (not b!1203974))
(check-sat b_and!42739 (not b_next!25905))
(get-model)

(declare-fun b_lambda!21187 () Bool)

(assert (= b_lambda!21183 (or (and start!100644 b_free!25905) b_lambda!21187)))

(check-sat (not b_lambda!21187) (not b!1203970) (not b!1203975) (not bm!58107) (not b!1203983) (not bm!58104) (not bm!58109) (not bm!58106) (not b!1203973) (not b!1203982) (not b!1203963) (not mapNonEmpty!47760) (not b!1203965) (not start!100644) (not bm!58108) (not b!1203961) b_and!42739 (not b_next!25905) (not b!1203960) (not b!1203978) (not b!1203976) (not b!1203964) tp_is_empty!30609 (not b!1203974))
(check-sat b_and!42739 (not b_next!25905))
(get-model)

(declare-fun b!1204091 () Bool)

(declare-fun e!683759 () ListLongMap!17663)

(declare-fun e!683753 () ListLongMap!17663)

(assert (=> b!1204091 (= e!683759 e!683753)))

(declare-fun c!117998 () Bool)

(assert (=> b!1204091 (= c!117998 (validKeyInArray!0 (select (arr!37641 lt!545873) from!1455)))))

(declare-fun b!1204092 () Bool)

(declare-fun e!683754 () Bool)

(declare-fun lt!545937 () ListLongMap!17663)

(declare-fun isEmpty!983 (ListLongMap!17663) Bool)

(assert (=> b!1204092 (= e!683754 (isEmpty!983 lt!545937))))

(declare-fun b!1204093 () Bool)

(declare-fun e!683755 () Bool)

(assert (=> b!1204093 (= e!683755 e!683754)))

(declare-fun c!118000 () Bool)

(assert (=> b!1204093 (= c!118000 (bvslt from!1455 (size!38177 lt!545873)))))

(declare-fun b!1204094 () Bool)

(declare-fun e!683757 () Bool)

(assert (=> b!1204094 (= e!683757 (validKeyInArray!0 (select (arr!37641 lt!545873) from!1455)))))

(assert (=> b!1204094 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204095 () Bool)

(assert (=> b!1204095 (= e!683759 (ListLongMap!17664 Nil!26501))))

(declare-fun b!1204096 () Bool)

(declare-fun res!801143 () Bool)

(declare-fun e!683758 () Bool)

(assert (=> b!1204096 (=> (not res!801143) (not e!683758))))

(assert (=> b!1204096 (= res!801143 (not (contains!6903 lt!545937 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204097 () Bool)

(assert (=> b!1204097 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38177 lt!545873)))))

(assert (=> b!1204097 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38176 lt!545869)))))

(declare-fun e!683756 () Bool)

(declare-fun apply!961 (ListLongMap!17663 (_ BitVec 64)) V!45939)

(declare-fun get!19186 (ValueCell!14595 V!45939) V!45939)

(assert (=> b!1204097 (= e!683756 (= (apply!961 lt!545937 (select (arr!37641 lt!545873) from!1455)) (get!19186 (select (arr!37640 lt!545869) from!1455) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204098 () Bool)

(declare-fun call!58141 () ListLongMap!17663)

(assert (=> b!1204098 (= e!683753 call!58141)))

(declare-fun b!1204100 () Bool)

(assert (=> b!1204100 (= e!683754 (= lt!545937 (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58138 () Bool)

(assert (=> bm!58138 (= call!58141 (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204099 () Bool)

(assert (=> b!1204099 (= e!683755 e!683756)))

(assert (=> b!1204099 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38177 lt!545873)))))

(declare-fun res!801142 () Bool)

(assert (=> b!1204099 (= res!801142 (contains!6903 lt!545937 (select (arr!37641 lt!545873) from!1455)))))

(assert (=> b!1204099 (=> (not res!801142) (not e!683756))))

(declare-fun d!132731 () Bool)

(assert (=> d!132731 e!683758))

(declare-fun res!801140 () Bool)

(assert (=> d!132731 (=> (not res!801140) (not e!683758))))

(assert (=> d!132731 (= res!801140 (not (contains!6903 lt!545937 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132731 (= lt!545937 e!683759)))

(declare-fun c!117999 () Bool)

(assert (=> d!132731 (= c!117999 (bvsge from!1455 (size!38177 lt!545873)))))

(assert (=> d!132731 (validMask!0 mask!1564)))

(assert (=> d!132731 (= (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545937)))

(declare-fun b!1204101 () Bool)

(assert (=> b!1204101 (= e!683758 e!683755)))

(declare-fun c!118001 () Bool)

(assert (=> b!1204101 (= c!118001 e!683757)))

(declare-fun res!801141 () Bool)

(assert (=> b!1204101 (=> (not res!801141) (not e!683757))))

(assert (=> b!1204101 (= res!801141 (bvslt from!1455 (size!38177 lt!545873)))))

(declare-fun b!1204102 () Bool)

(declare-fun lt!545935 () Unit!39922)

(declare-fun lt!545939 () Unit!39922)

(assert (=> b!1204102 (= lt!545935 lt!545939)))

(declare-fun lt!545936 () (_ BitVec 64))

(declare-fun lt!545940 () V!45939)

(declare-fun lt!545938 () (_ BitVec 64))

(declare-fun lt!545934 () ListLongMap!17663)

(assert (=> b!1204102 (not (contains!6903 (+!3973 lt!545934 (tuple2!19695 lt!545938 lt!545940)) lt!545936))))

(declare-fun addStillNotContains!289 (ListLongMap!17663 (_ BitVec 64) V!45939 (_ BitVec 64)) Unit!39922)

(assert (=> b!1204102 (= lt!545939 (addStillNotContains!289 lt!545934 lt!545938 lt!545940 lt!545936))))

(assert (=> b!1204102 (= lt!545936 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204102 (= lt!545940 (get!19186 (select (arr!37640 lt!545869) from!1455) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204102 (= lt!545938 (select (arr!37641 lt!545873) from!1455))))

(assert (=> b!1204102 (= lt!545934 call!58141)))

(assert (=> b!1204102 (= e!683753 (+!3973 call!58141 (tuple2!19695 (select (arr!37641 lt!545873) from!1455) (get!19186 (select (arr!37640 lt!545869) from!1455) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132731 c!117999) b!1204095))

(assert (= (and d!132731 (not c!117999)) b!1204091))

(assert (= (and b!1204091 c!117998) b!1204102))

(assert (= (and b!1204091 (not c!117998)) b!1204098))

(assert (= (or b!1204102 b!1204098) bm!58138))

(assert (= (and d!132731 res!801140) b!1204096))

(assert (= (and b!1204096 res!801143) b!1204101))

(assert (= (and b!1204101 res!801141) b!1204094))

(assert (= (and b!1204101 c!118001) b!1204099))

(assert (= (and b!1204101 (not c!118001)) b!1204093))

(assert (= (and b!1204099 res!801142) b!1204097))

(assert (= (and b!1204093 c!118000) b!1204100))

(assert (= (and b!1204093 (not c!118000)) b!1204092))

(declare-fun b_lambda!21189 () Bool)

(assert (=> (not b_lambda!21189) (not b!1204097)))

(assert (=> b!1204097 t!39388))

(declare-fun b_and!42745 () Bool)

(assert (= b_and!42739 (and (=> t!39388 result!21989) b_and!42745)))

(declare-fun b_lambda!21191 () Bool)

(assert (=> (not b_lambda!21191) (not b!1204102)))

(assert (=> b!1204102 t!39388))

(declare-fun b_and!42747 () Bool)

(assert (= b_and!42745 (and (=> t!39388 result!21989) b_and!42747)))

(declare-fun m!1110071 () Bool)

(assert (=> b!1204094 m!1110071))

(assert (=> b!1204094 m!1110071))

(declare-fun m!1110073 () Bool)

(assert (=> b!1204094 m!1110073))

(declare-fun m!1110075 () Bool)

(assert (=> b!1204092 m!1110075))

(declare-fun m!1110077 () Bool)

(assert (=> b!1204097 m!1110077))

(assert (=> b!1204097 m!1109993))

(assert (=> b!1204097 m!1110071))

(declare-fun m!1110079 () Bool)

(assert (=> b!1204097 m!1110079))

(assert (=> b!1204097 m!1110077))

(assert (=> b!1204097 m!1109993))

(declare-fun m!1110081 () Bool)

(assert (=> b!1204097 m!1110081))

(assert (=> b!1204097 m!1110071))

(declare-fun m!1110083 () Bool)

(assert (=> d!132731 m!1110083))

(assert (=> d!132731 m!1109973))

(declare-fun m!1110085 () Bool)

(assert (=> b!1204102 m!1110085))

(declare-fun m!1110087 () Bool)

(assert (=> b!1204102 m!1110087))

(assert (=> b!1204102 m!1110077))

(assert (=> b!1204102 m!1109993))

(declare-fun m!1110089 () Bool)

(assert (=> b!1204102 m!1110089))

(assert (=> b!1204102 m!1110085))

(assert (=> b!1204102 m!1110077))

(assert (=> b!1204102 m!1109993))

(assert (=> b!1204102 m!1110081))

(assert (=> b!1204102 m!1110071))

(declare-fun m!1110091 () Bool)

(assert (=> b!1204102 m!1110091))

(assert (=> b!1204099 m!1110071))

(assert (=> b!1204099 m!1110071))

(declare-fun m!1110093 () Bool)

(assert (=> b!1204099 m!1110093))

(declare-fun m!1110095 () Bool)

(assert (=> b!1204096 m!1110095))

(declare-fun m!1110097 () Bool)

(assert (=> bm!58138 m!1110097))

(assert (=> b!1204091 m!1110071))

(assert (=> b!1204091 m!1110071))

(assert (=> b!1204091 m!1110073))

(assert (=> b!1204100 m!1110097))

(assert (=> b!1203960 d!132731))

(declare-fun b!1204103 () Bool)

(declare-fun e!683766 () ListLongMap!17663)

(declare-fun e!683760 () ListLongMap!17663)

(assert (=> b!1204103 (= e!683766 e!683760)))

(declare-fun c!118002 () Bool)

(assert (=> b!1204103 (= c!118002 (validKeyInArray!0 (select (arr!37641 _keys!1208) from!1455)))))

(declare-fun b!1204104 () Bool)

(declare-fun e!683761 () Bool)

(declare-fun lt!545944 () ListLongMap!17663)

(assert (=> b!1204104 (= e!683761 (isEmpty!983 lt!545944))))

(declare-fun b!1204105 () Bool)

(declare-fun e!683762 () Bool)

(assert (=> b!1204105 (= e!683762 e!683761)))

(declare-fun c!118004 () Bool)

(assert (=> b!1204105 (= c!118004 (bvslt from!1455 (size!38177 _keys!1208)))))

(declare-fun b!1204106 () Bool)

(declare-fun e!683764 () Bool)

(assert (=> b!1204106 (= e!683764 (validKeyInArray!0 (select (arr!37641 _keys!1208) from!1455)))))

(assert (=> b!1204106 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1204107 () Bool)

(assert (=> b!1204107 (= e!683766 (ListLongMap!17664 Nil!26501))))

(declare-fun b!1204108 () Bool)

(declare-fun res!801147 () Bool)

(declare-fun e!683765 () Bool)

(assert (=> b!1204108 (=> (not res!801147) (not e!683765))))

(assert (=> b!1204108 (= res!801147 (not (contains!6903 lt!545944 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204109 () Bool)

(assert (=> b!1204109 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38177 _keys!1208)))))

(assert (=> b!1204109 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38176 _values!996)))))

(declare-fun e!683763 () Bool)

(assert (=> b!1204109 (= e!683763 (= (apply!961 lt!545944 (select (arr!37641 _keys!1208) from!1455)) (get!19186 (select (arr!37640 _values!996) from!1455) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204110 () Bool)

(declare-fun call!58142 () ListLongMap!17663)

(assert (=> b!1204110 (= e!683760 call!58142)))

(declare-fun b!1204112 () Bool)

(assert (=> b!1204112 (= e!683761 (= lt!545944 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58139 () Bool)

(assert (=> bm!58139 (= call!58142 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204111 () Bool)

(assert (=> b!1204111 (= e!683762 e!683763)))

(assert (=> b!1204111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38177 _keys!1208)))))

(declare-fun res!801146 () Bool)

(assert (=> b!1204111 (= res!801146 (contains!6903 lt!545944 (select (arr!37641 _keys!1208) from!1455)))))

(assert (=> b!1204111 (=> (not res!801146) (not e!683763))))

(declare-fun d!132733 () Bool)

(assert (=> d!132733 e!683765))

(declare-fun res!801144 () Bool)

(assert (=> d!132733 (=> (not res!801144) (not e!683765))))

(assert (=> d!132733 (= res!801144 (not (contains!6903 lt!545944 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132733 (= lt!545944 e!683766)))

(declare-fun c!118003 () Bool)

(assert (=> d!132733 (= c!118003 (bvsge from!1455 (size!38177 _keys!1208)))))

(assert (=> d!132733 (validMask!0 mask!1564)))

(assert (=> d!132733 (= (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!545944)))

(declare-fun b!1204113 () Bool)

(assert (=> b!1204113 (= e!683765 e!683762)))

(declare-fun c!118005 () Bool)

(assert (=> b!1204113 (= c!118005 e!683764)))

(declare-fun res!801145 () Bool)

(assert (=> b!1204113 (=> (not res!801145) (not e!683764))))

(assert (=> b!1204113 (= res!801145 (bvslt from!1455 (size!38177 _keys!1208)))))

(declare-fun b!1204114 () Bool)

(declare-fun lt!545942 () Unit!39922)

(declare-fun lt!545946 () Unit!39922)

(assert (=> b!1204114 (= lt!545942 lt!545946)))

(declare-fun lt!545943 () (_ BitVec 64))

(declare-fun lt!545947 () V!45939)

(declare-fun lt!545945 () (_ BitVec 64))

(declare-fun lt!545941 () ListLongMap!17663)

(assert (=> b!1204114 (not (contains!6903 (+!3973 lt!545941 (tuple2!19695 lt!545945 lt!545947)) lt!545943))))

(assert (=> b!1204114 (= lt!545946 (addStillNotContains!289 lt!545941 lt!545945 lt!545947 lt!545943))))

(assert (=> b!1204114 (= lt!545943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204114 (= lt!545947 (get!19186 (select (arr!37640 _values!996) from!1455) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204114 (= lt!545945 (select (arr!37641 _keys!1208) from!1455))))

(assert (=> b!1204114 (= lt!545941 call!58142)))

(assert (=> b!1204114 (= e!683760 (+!3973 call!58142 (tuple2!19695 (select (arr!37641 _keys!1208) from!1455) (get!19186 (select (arr!37640 _values!996) from!1455) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132733 c!118003) b!1204107))

(assert (= (and d!132733 (not c!118003)) b!1204103))

(assert (= (and b!1204103 c!118002) b!1204114))

(assert (= (and b!1204103 (not c!118002)) b!1204110))

(assert (= (or b!1204114 b!1204110) bm!58139))

(assert (= (and d!132733 res!801144) b!1204108))

(assert (= (and b!1204108 res!801147) b!1204113))

(assert (= (and b!1204113 res!801145) b!1204106))

(assert (= (and b!1204113 c!118005) b!1204111))

(assert (= (and b!1204113 (not c!118005)) b!1204105))

(assert (= (and b!1204111 res!801146) b!1204109))

(assert (= (and b!1204105 c!118004) b!1204112))

(assert (= (and b!1204105 (not c!118004)) b!1204104))

(declare-fun b_lambda!21193 () Bool)

(assert (=> (not b_lambda!21193) (not b!1204109)))

(assert (=> b!1204109 t!39388))

(declare-fun b_and!42749 () Bool)

(assert (= b_and!42747 (and (=> t!39388 result!21989) b_and!42749)))

(declare-fun b_lambda!21195 () Bool)

(assert (=> (not b_lambda!21195) (not b!1204114)))

(assert (=> b!1204114 t!39388))

(declare-fun b_and!42751 () Bool)

(assert (= b_and!42749 (and (=> t!39388 result!21989) b_and!42751)))

(assert (=> b!1204106 m!1110003))

(assert (=> b!1204106 m!1110003))

(declare-fun m!1110099 () Bool)

(assert (=> b!1204106 m!1110099))

(declare-fun m!1110101 () Bool)

(assert (=> b!1204104 m!1110101))

(declare-fun m!1110103 () Bool)

(assert (=> b!1204109 m!1110103))

(assert (=> b!1204109 m!1109993))

(assert (=> b!1204109 m!1110003))

(declare-fun m!1110105 () Bool)

(assert (=> b!1204109 m!1110105))

(assert (=> b!1204109 m!1110103))

(assert (=> b!1204109 m!1109993))

(declare-fun m!1110107 () Bool)

(assert (=> b!1204109 m!1110107))

(assert (=> b!1204109 m!1110003))

(declare-fun m!1110109 () Bool)

(assert (=> d!132733 m!1110109))

(assert (=> d!132733 m!1109973))

(declare-fun m!1110111 () Bool)

(assert (=> b!1204114 m!1110111))

(declare-fun m!1110113 () Bool)

(assert (=> b!1204114 m!1110113))

(assert (=> b!1204114 m!1110103))

(assert (=> b!1204114 m!1109993))

(declare-fun m!1110115 () Bool)

(assert (=> b!1204114 m!1110115))

(assert (=> b!1204114 m!1110111))

(assert (=> b!1204114 m!1110103))

(assert (=> b!1204114 m!1109993))

(assert (=> b!1204114 m!1110107))

(assert (=> b!1204114 m!1110003))

(declare-fun m!1110117 () Bool)

(assert (=> b!1204114 m!1110117))

(assert (=> b!1204111 m!1110003))

(assert (=> b!1204111 m!1110003))

(declare-fun m!1110119 () Bool)

(assert (=> b!1204111 m!1110119))

(declare-fun m!1110121 () Bool)

(assert (=> b!1204108 m!1110121))

(declare-fun m!1110123 () Bool)

(assert (=> bm!58139 m!1110123))

(assert (=> b!1204103 m!1110003))

(assert (=> b!1204103 m!1110003))

(assert (=> b!1204103 m!1110099))

(assert (=> b!1204112 m!1110123))

(assert (=> b!1203960 d!132733))

(declare-fun d!132735 () Bool)

(declare-fun e!683769 () Bool)

(assert (=> d!132735 e!683769))

(declare-fun res!801152 () Bool)

(assert (=> d!132735 (=> (not res!801152) (not e!683769))))

(declare-fun lt!545957 () ListLongMap!17663)

(assert (=> d!132735 (= res!801152 (contains!6903 lt!545957 (_1!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lt!545958 () List!26504)

(assert (=> d!132735 (= lt!545957 (ListLongMap!17664 lt!545958))))

(declare-fun lt!545959 () Unit!39922)

(declare-fun lt!545956 () Unit!39922)

(assert (=> d!132735 (= lt!545959 lt!545956)))

(declare-datatypes ((Option!683 0))(
  ( (Some!682 (v!18004 V!45939)) (None!681) )
))
(declare-fun getValueByKey!632 (List!26504 (_ BitVec 64)) Option!683)

(assert (=> d!132735 (= (getValueByKey!632 lt!545958 (_1!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!682 (_2!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!309 (List!26504 (_ BitVec 64) V!45939) Unit!39922)

(assert (=> d!132735 (= lt!545956 (lemmaContainsTupThenGetReturnValue!309 lt!545958 (_1!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun insertStrictlySorted!402 (List!26504 (_ BitVec 64) V!45939) List!26504)

(assert (=> d!132735 (= lt!545958 (insertStrictlySorted!402 (toList!8847 lt!545868) (_1!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (_2!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (=> d!132735 (= (+!3973 lt!545868 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) lt!545957)))

(declare-fun b!1204119 () Bool)

(declare-fun res!801153 () Bool)

(assert (=> b!1204119 (=> (not res!801153) (not e!683769))))

(assert (=> b!1204119 (= res!801153 (= (getValueByKey!632 (toList!8847 lt!545957) (_1!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (Some!682 (_2!9858 (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun b!1204120 () Bool)

(declare-fun contains!6905 (List!26504 tuple2!19694) Bool)

(assert (=> b!1204120 (= e!683769 (contains!6905 (toList!8847 lt!545957) (ite (or c!117974 c!117975) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (= (and d!132735 res!801152) b!1204119))

(assert (= (and b!1204119 res!801153) b!1204120))

(declare-fun m!1110125 () Bool)

(assert (=> d!132735 m!1110125))

(declare-fun m!1110127 () Bool)

(assert (=> d!132735 m!1110127))

(declare-fun m!1110129 () Bool)

(assert (=> d!132735 m!1110129))

(declare-fun m!1110131 () Bool)

(assert (=> d!132735 m!1110131))

(declare-fun m!1110133 () Bool)

(assert (=> b!1204119 m!1110133))

(declare-fun m!1110135 () Bool)

(assert (=> b!1204120 m!1110135))

(assert (=> bm!58106 d!132735))

(declare-fun b!1204121 () Bool)

(declare-fun e!683776 () ListLongMap!17663)

(declare-fun e!683770 () ListLongMap!17663)

(assert (=> b!1204121 (= e!683776 e!683770)))

(declare-fun c!118006 () Bool)

(assert (=> b!1204121 (= c!118006 (validKeyInArray!0 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204122 () Bool)

(declare-fun e!683771 () Bool)

(declare-fun lt!545963 () ListLongMap!17663)

(assert (=> b!1204122 (= e!683771 (isEmpty!983 lt!545963))))

(declare-fun b!1204123 () Bool)

(declare-fun e!683772 () Bool)

(assert (=> b!1204123 (= e!683772 e!683771)))

(declare-fun c!118008 () Bool)

(assert (=> b!1204123 (= c!118008 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun b!1204124 () Bool)

(declare-fun e!683774 () Bool)

(assert (=> b!1204124 (= e!683774 (validKeyInArray!0 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204124 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204125 () Bool)

(assert (=> b!1204125 (= e!683776 (ListLongMap!17664 Nil!26501))))

(declare-fun b!1204126 () Bool)

(declare-fun res!801157 () Bool)

(declare-fun e!683775 () Bool)

(assert (=> b!1204126 (=> (not res!801157) (not e!683775))))

(assert (=> b!1204126 (= res!801157 (not (contains!6903 lt!545963 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204127 () Bool)

(assert (=> b!1204127 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(assert (=> b!1204127 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _values!996)))))

(declare-fun e!683773 () Bool)

(assert (=> b!1204127 (= e!683773 (= (apply!961 lt!545963 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19186 (select (arr!37640 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204128 () Bool)

(declare-fun call!58143 () ListLongMap!17663)

(assert (=> b!1204128 (= e!683770 call!58143)))

(declare-fun b!1204130 () Bool)

(assert (=> b!1204130 (= e!683771 (= lt!545963 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58140 () Bool)

(assert (=> bm!58140 (= call!58143 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204129 () Bool)

(assert (=> b!1204129 (= e!683772 e!683773)))

(assert (=> b!1204129 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun res!801156 () Bool)

(assert (=> b!1204129 (= res!801156 (contains!6903 lt!545963 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204129 (=> (not res!801156) (not e!683773))))

(declare-fun d!132737 () Bool)

(assert (=> d!132737 e!683775))

(declare-fun res!801154 () Bool)

(assert (=> d!132737 (=> (not res!801154) (not e!683775))))

(assert (=> d!132737 (= res!801154 (not (contains!6903 lt!545963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132737 (= lt!545963 e!683776)))

(declare-fun c!118007 () Bool)

(assert (=> d!132737 (= c!118007 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(assert (=> d!132737 (validMask!0 mask!1564)))

(assert (=> d!132737 (= (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545963)))

(declare-fun b!1204131 () Bool)

(assert (=> b!1204131 (= e!683775 e!683772)))

(declare-fun c!118009 () Bool)

(assert (=> b!1204131 (= c!118009 e!683774)))

(declare-fun res!801155 () Bool)

(assert (=> b!1204131 (=> (not res!801155) (not e!683774))))

(assert (=> b!1204131 (= res!801155 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun b!1204132 () Bool)

(declare-fun lt!545961 () Unit!39922)

(declare-fun lt!545965 () Unit!39922)

(assert (=> b!1204132 (= lt!545961 lt!545965)))

(declare-fun lt!545966 () V!45939)

(declare-fun lt!545960 () ListLongMap!17663)

(declare-fun lt!545964 () (_ BitVec 64))

(declare-fun lt!545962 () (_ BitVec 64))

(assert (=> b!1204132 (not (contains!6903 (+!3973 lt!545960 (tuple2!19695 lt!545964 lt!545966)) lt!545962))))

(assert (=> b!1204132 (= lt!545965 (addStillNotContains!289 lt!545960 lt!545964 lt!545966 lt!545962))))

(assert (=> b!1204132 (= lt!545962 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204132 (= lt!545966 (get!19186 (select (arr!37640 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204132 (= lt!545964 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204132 (= lt!545960 call!58143)))

(assert (=> b!1204132 (= e!683770 (+!3973 call!58143 (tuple2!19695 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19186 (select (arr!37640 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132737 c!118007) b!1204125))

(assert (= (and d!132737 (not c!118007)) b!1204121))

(assert (= (and b!1204121 c!118006) b!1204132))

(assert (= (and b!1204121 (not c!118006)) b!1204128))

(assert (= (or b!1204132 b!1204128) bm!58140))

(assert (= (and d!132737 res!801154) b!1204126))

(assert (= (and b!1204126 res!801157) b!1204131))

(assert (= (and b!1204131 res!801155) b!1204124))

(assert (= (and b!1204131 c!118009) b!1204129))

(assert (= (and b!1204131 (not c!118009)) b!1204123))

(assert (= (and b!1204129 res!801156) b!1204127))

(assert (= (and b!1204123 c!118008) b!1204130))

(assert (= (and b!1204123 (not c!118008)) b!1204122))

(declare-fun b_lambda!21197 () Bool)

(assert (=> (not b_lambda!21197) (not b!1204127)))

(assert (=> b!1204127 t!39388))

(declare-fun b_and!42753 () Bool)

(assert (= b_and!42751 (and (=> t!39388 result!21989) b_and!42753)))

(declare-fun b_lambda!21199 () Bool)

(assert (=> (not b_lambda!21199) (not b!1204132)))

(assert (=> b!1204132 t!39388))

(declare-fun b_and!42755 () Bool)

(assert (= b_and!42753 (and (=> t!39388 result!21989) b_and!42755)))

(declare-fun m!1110137 () Bool)

(assert (=> b!1204124 m!1110137))

(assert (=> b!1204124 m!1110137))

(declare-fun m!1110139 () Bool)

(assert (=> b!1204124 m!1110139))

(declare-fun m!1110141 () Bool)

(assert (=> b!1204122 m!1110141))

(declare-fun m!1110143 () Bool)

(assert (=> b!1204127 m!1110143))

(assert (=> b!1204127 m!1109993))

(assert (=> b!1204127 m!1110137))

(declare-fun m!1110145 () Bool)

(assert (=> b!1204127 m!1110145))

(assert (=> b!1204127 m!1110143))

(assert (=> b!1204127 m!1109993))

(declare-fun m!1110147 () Bool)

(assert (=> b!1204127 m!1110147))

(assert (=> b!1204127 m!1110137))

(declare-fun m!1110149 () Bool)

(assert (=> d!132737 m!1110149))

(assert (=> d!132737 m!1109973))

(declare-fun m!1110151 () Bool)

(assert (=> b!1204132 m!1110151))

(declare-fun m!1110153 () Bool)

(assert (=> b!1204132 m!1110153))

(assert (=> b!1204132 m!1110143))

(assert (=> b!1204132 m!1109993))

(declare-fun m!1110155 () Bool)

(assert (=> b!1204132 m!1110155))

(assert (=> b!1204132 m!1110151))

(assert (=> b!1204132 m!1110143))

(assert (=> b!1204132 m!1109993))

(assert (=> b!1204132 m!1110147))

(assert (=> b!1204132 m!1110137))

(declare-fun m!1110157 () Bool)

(assert (=> b!1204132 m!1110157))

(assert (=> b!1204129 m!1110137))

(assert (=> b!1204129 m!1110137))

(declare-fun m!1110159 () Bool)

(assert (=> b!1204129 m!1110159))

(declare-fun m!1110161 () Bool)

(assert (=> b!1204126 m!1110161))

(declare-fun m!1110163 () Bool)

(assert (=> bm!58140 m!1110163))

(assert (=> b!1204121 m!1110137))

(assert (=> b!1204121 m!1110137))

(assert (=> b!1204121 m!1110139))

(assert (=> b!1204130 m!1110163))

(assert (=> bm!58109 d!132737))

(declare-fun b!1204133 () Bool)

(declare-fun e!683783 () ListLongMap!17663)

(declare-fun e!683777 () ListLongMap!17663)

(assert (=> b!1204133 (= e!683783 e!683777)))

(declare-fun c!118010 () Bool)

(assert (=> b!1204133 (= c!118010 (validKeyInArray!0 (select (arr!37641 lt!545873) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1204134 () Bool)

(declare-fun e!683778 () Bool)

(declare-fun lt!545970 () ListLongMap!17663)

(assert (=> b!1204134 (= e!683778 (isEmpty!983 lt!545970))))

(declare-fun b!1204135 () Bool)

(declare-fun e!683779 () Bool)

(assert (=> b!1204135 (= e!683779 e!683778)))

(declare-fun c!118012 () Bool)

(assert (=> b!1204135 (= c!118012 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 lt!545873)))))

(declare-fun b!1204136 () Bool)

(declare-fun e!683781 () Bool)

(assert (=> b!1204136 (= e!683781 (validKeyInArray!0 (select (arr!37641 lt!545873) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204136 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1204137 () Bool)

(assert (=> b!1204137 (= e!683783 (ListLongMap!17664 Nil!26501))))

(declare-fun b!1204138 () Bool)

(declare-fun res!801161 () Bool)

(declare-fun e!683782 () Bool)

(assert (=> b!1204138 (=> (not res!801161) (not e!683782))))

(assert (=> b!1204138 (= res!801161 (not (contains!6903 lt!545970 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1204139 () Bool)

(assert (=> b!1204139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 lt!545873)))))

(assert (=> b!1204139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 lt!545869)))))

(declare-fun e!683780 () Bool)

(assert (=> b!1204139 (= e!683780 (= (apply!961 lt!545970 (select (arr!37641 lt!545873) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19186 (select (arr!37640 lt!545869) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1204140 () Bool)

(declare-fun call!58144 () ListLongMap!17663)

(assert (=> b!1204140 (= e!683777 call!58144)))

(declare-fun b!1204142 () Bool)

(assert (=> b!1204142 (= e!683778 (= lt!545970 (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun bm!58141 () Bool)

(assert (=> bm!58141 (= call!58144 (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1204141 () Bool)

(assert (=> b!1204141 (= e!683779 e!683780)))

(assert (=> b!1204141 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 lt!545873)))))

(declare-fun res!801160 () Bool)

(assert (=> b!1204141 (= res!801160 (contains!6903 lt!545970 (select (arr!37641 lt!545873) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204141 (=> (not res!801160) (not e!683780))))

(declare-fun d!132739 () Bool)

(assert (=> d!132739 e!683782))

(declare-fun res!801158 () Bool)

(assert (=> d!132739 (=> (not res!801158) (not e!683782))))

(assert (=> d!132739 (= res!801158 (not (contains!6903 lt!545970 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!132739 (= lt!545970 e!683783)))

(declare-fun c!118011 () Bool)

(assert (=> d!132739 (= c!118011 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 lt!545873)))))

(assert (=> d!132739 (validMask!0 mask!1564)))

(assert (=> d!132739 (= (getCurrentListMapNoExtraKeys!5283 lt!545873 lt!545869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545970)))

(declare-fun b!1204143 () Bool)

(assert (=> b!1204143 (= e!683782 e!683779)))

(declare-fun c!118013 () Bool)

(assert (=> b!1204143 (= c!118013 e!683781)))

(declare-fun res!801159 () Bool)

(assert (=> b!1204143 (=> (not res!801159) (not e!683781))))

(assert (=> b!1204143 (= res!801159 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 lt!545873)))))

(declare-fun b!1204144 () Bool)

(declare-fun lt!545968 () Unit!39922)

(declare-fun lt!545972 () Unit!39922)

(assert (=> b!1204144 (= lt!545968 lt!545972)))

(declare-fun lt!545969 () (_ BitVec 64))

(declare-fun lt!545967 () ListLongMap!17663)

(declare-fun lt!545971 () (_ BitVec 64))

(declare-fun lt!545973 () V!45939)

(assert (=> b!1204144 (not (contains!6903 (+!3973 lt!545967 (tuple2!19695 lt!545971 lt!545973)) lt!545969))))

(assert (=> b!1204144 (= lt!545972 (addStillNotContains!289 lt!545967 lt!545971 lt!545973 lt!545969))))

(assert (=> b!1204144 (= lt!545969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1204144 (= lt!545973 (get!19186 (select (arr!37640 lt!545869) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1204144 (= lt!545971 (select (arr!37641 lt!545873) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204144 (= lt!545967 call!58144)))

(assert (=> b!1204144 (= e!683777 (+!3973 call!58144 (tuple2!19695 (select (arr!37641 lt!545873) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19186 (select (arr!37640 lt!545869) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!132739 c!118011) b!1204137))

(assert (= (and d!132739 (not c!118011)) b!1204133))

(assert (= (and b!1204133 c!118010) b!1204144))

(assert (= (and b!1204133 (not c!118010)) b!1204140))

(assert (= (or b!1204144 b!1204140) bm!58141))

(assert (= (and d!132739 res!801158) b!1204138))

(assert (= (and b!1204138 res!801161) b!1204143))

(assert (= (and b!1204143 res!801159) b!1204136))

(assert (= (and b!1204143 c!118013) b!1204141))

(assert (= (and b!1204143 (not c!118013)) b!1204135))

(assert (= (and b!1204141 res!801160) b!1204139))

(assert (= (and b!1204135 c!118012) b!1204142))

(assert (= (and b!1204135 (not c!118012)) b!1204134))

(declare-fun b_lambda!21201 () Bool)

(assert (=> (not b_lambda!21201) (not b!1204139)))

(assert (=> b!1204139 t!39388))

(declare-fun b_and!42757 () Bool)

(assert (= b_and!42755 (and (=> t!39388 result!21989) b_and!42757)))

(declare-fun b_lambda!21203 () Bool)

(assert (=> (not b_lambda!21203) (not b!1204144)))

(assert (=> b!1204144 t!39388))

(declare-fun b_and!42759 () Bool)

(assert (= b_and!42757 (and (=> t!39388 result!21989) b_and!42759)))

(declare-fun m!1110165 () Bool)

(assert (=> b!1204136 m!1110165))

(assert (=> b!1204136 m!1110165))

(declare-fun m!1110167 () Bool)

(assert (=> b!1204136 m!1110167))

(declare-fun m!1110169 () Bool)

(assert (=> b!1204134 m!1110169))

(declare-fun m!1110171 () Bool)

(assert (=> b!1204139 m!1110171))

(assert (=> b!1204139 m!1109993))

(assert (=> b!1204139 m!1110165))

(declare-fun m!1110173 () Bool)

(assert (=> b!1204139 m!1110173))

(assert (=> b!1204139 m!1110171))

(assert (=> b!1204139 m!1109993))

(declare-fun m!1110175 () Bool)

(assert (=> b!1204139 m!1110175))

(assert (=> b!1204139 m!1110165))

(declare-fun m!1110177 () Bool)

(assert (=> d!132739 m!1110177))

(assert (=> d!132739 m!1109973))

(declare-fun m!1110179 () Bool)

(assert (=> b!1204144 m!1110179))

(declare-fun m!1110181 () Bool)

(assert (=> b!1204144 m!1110181))

(assert (=> b!1204144 m!1110171))

(assert (=> b!1204144 m!1109993))

(declare-fun m!1110183 () Bool)

(assert (=> b!1204144 m!1110183))

(assert (=> b!1204144 m!1110179))

(assert (=> b!1204144 m!1110171))

(assert (=> b!1204144 m!1109993))

(assert (=> b!1204144 m!1110175))

(assert (=> b!1204144 m!1110165))

(declare-fun m!1110185 () Bool)

(assert (=> b!1204144 m!1110185))

(assert (=> b!1204141 m!1110165))

(assert (=> b!1204141 m!1110165))

(declare-fun m!1110187 () Bool)

(assert (=> b!1204141 m!1110187))

(declare-fun m!1110189 () Bool)

(assert (=> b!1204138 m!1110189))

(declare-fun m!1110191 () Bool)

(assert (=> bm!58141 m!1110191))

(assert (=> b!1204133 m!1110165))

(assert (=> b!1204133 m!1110165))

(assert (=> b!1204133 m!1110167))

(assert (=> b!1204142 m!1110191))

(assert (=> bm!58107 d!132739))

(declare-fun d!132741 () Bool)

(assert (=> d!132741 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1203976 d!132741))

(declare-fun call!58150 () ListLongMap!17663)

(declare-fun bm!58146 () Bool)

(assert (=> bm!58146 (= call!58150 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!132743 () Bool)

(declare-fun e!683788 () Bool)

(assert (=> d!132743 e!683788))

(declare-fun res!801164 () Bool)

(assert (=> d!132743 (=> (not res!801164) (not e!683788))))

(assert (=> d!132743 (= res!801164 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38177 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38177 _keys!1208))))))))

(declare-fun lt!545976 () Unit!39922)

(declare-fun choose!1790 (array!77995 array!77993 (_ BitVec 32) (_ BitVec 32) V!45939 V!45939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39922)

(assert (=> d!132743 (= lt!545976 (choose!1790 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132743 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(assert (=> d!132743 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1018 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!545976)))

(declare-fun b!1204151 () Bool)

(declare-fun e!683789 () Bool)

(declare-fun call!58149 () ListLongMap!17663)

(assert (=> b!1204151 (= e!683789 (= call!58149 call!58150))))

(assert (=> b!1204151 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38176 _values!996)))))

(declare-fun bm!58147 () Bool)

(assert (=> bm!58147 (= call!58149 (getCurrentListMapNoExtraKeys!5283 (array!77996 (store (arr!37641 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38177 _keys!1208)) (array!77994 (store (arr!37640 _values!996) i!673 (ValueCellFull!14595 (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38176 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204152 () Bool)

(assert (=> b!1204152 (= e!683788 e!683789)))

(declare-fun c!118016 () Bool)

(assert (=> b!1204152 (= c!118016 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1204153 () Bool)

(assert (=> b!1204153 (= e!683789 (= call!58149 (-!1813 call!58150 k0!934)))))

(assert (=> b!1204153 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38176 _values!996)))))

(assert (= (and d!132743 res!801164) b!1204152))

(assert (= (and b!1204152 c!118016) b!1204153))

(assert (= (and b!1204152 (not c!118016)) b!1204151))

(assert (= (or b!1204153 b!1204151) bm!58146))

(assert (= (or b!1204153 b!1204151) bm!58147))

(declare-fun b_lambda!21205 () Bool)

(assert (=> (not b_lambda!21205) (not bm!58147)))

(assert (=> bm!58147 t!39388))

(declare-fun b_and!42761 () Bool)

(assert (= b_and!42759 (and (=> t!39388 result!21989) b_and!42761)))

(assert (=> bm!58146 m!1109949))

(declare-fun m!1110193 () Bool)

(assert (=> d!132743 m!1110193))

(assert (=> bm!58147 m!1109953))

(assert (=> bm!58147 m!1109993))

(assert (=> bm!58147 m!1109995))

(declare-fun m!1110195 () Bool)

(assert (=> bm!58147 m!1110195))

(declare-fun m!1110197 () Bool)

(assert (=> b!1204153 m!1110197))

(assert (=> b!1203975 d!132743))

(declare-fun d!132745 () Bool)

(declare-fun e!683794 () Bool)

(assert (=> d!132745 e!683794))

(declare-fun res!801167 () Bool)

(assert (=> d!132745 (=> res!801167 e!683794)))

(declare-fun lt!545985 () Bool)

(assert (=> d!132745 (= res!801167 (not lt!545985))))

(declare-fun lt!545988 () Bool)

(assert (=> d!132745 (= lt!545985 lt!545988)))

(declare-fun lt!545987 () Unit!39922)

(declare-fun e!683795 () Unit!39922)

(assert (=> d!132745 (= lt!545987 e!683795)))

(declare-fun c!118019 () Bool)

(assert (=> d!132745 (= c!118019 lt!545988)))

(declare-fun containsKey!588 (List!26504 (_ BitVec 64)) Bool)

(assert (=> d!132745 (= lt!545988 (containsKey!588 (toList!8847 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(assert (=> d!132745 (= (contains!6903 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934) lt!545985)))

(declare-fun b!1204160 () Bool)

(declare-fun lt!545986 () Unit!39922)

(assert (=> b!1204160 (= e!683795 lt!545986)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!418 (List!26504 (_ BitVec 64)) Unit!39922)

(assert (=> b!1204160 (= lt!545986 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8847 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(declare-fun isDefined!457 (Option!683) Bool)

(assert (=> b!1204160 (isDefined!457 (getValueByKey!632 (toList!8847 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934))))

(declare-fun b!1204161 () Bool)

(declare-fun Unit!39928 () Unit!39922)

(assert (=> b!1204161 (= e!683795 Unit!39928)))

(declare-fun b!1204162 () Bool)

(assert (=> b!1204162 (= e!683794 (isDefined!457 (getValueByKey!632 (toList!8847 (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)) k0!934)))))

(assert (= (and d!132745 c!118019) b!1204160))

(assert (= (and d!132745 (not c!118019)) b!1204161))

(assert (= (and d!132745 (not res!801167)) b!1204162))

(declare-fun m!1110199 () Bool)

(assert (=> d!132745 m!1110199))

(declare-fun m!1110201 () Bool)

(assert (=> b!1204160 m!1110201))

(declare-fun m!1110203 () Bool)

(assert (=> b!1204160 m!1110203))

(assert (=> b!1204160 m!1110203))

(declare-fun m!1110205 () Bool)

(assert (=> b!1204160 m!1110205))

(assert (=> b!1204162 m!1110203))

(assert (=> b!1204162 m!1110203))

(assert (=> b!1204162 m!1110205))

(assert (=> b!1203961 d!132745))

(declare-fun bm!58162 () Bool)

(declare-fun call!58166 () ListLongMap!17663)

(declare-fun call!58168 () ListLongMap!17663)

(assert (=> bm!58162 (= call!58166 call!58168)))

(declare-fun bm!58163 () Bool)

(declare-fun call!58169 () ListLongMap!17663)

(assert (=> bm!58163 (= call!58168 call!58169)))

(declare-fun b!1204205 () Bool)

(declare-fun e!683831 () Bool)

(declare-fun call!58165 () Bool)

(assert (=> b!1204205 (= e!683831 (not call!58165))))

(declare-fun b!1204206 () Bool)

(declare-fun e!683826 () Bool)

(assert (=> b!1204206 (= e!683831 e!683826)))

(declare-fun res!801188 () Bool)

(assert (=> b!1204206 (= res!801188 call!58165)))

(assert (=> b!1204206 (=> (not res!801188) (not e!683826))))

(declare-fun b!1204207 () Bool)

(declare-fun e!683832 () Bool)

(declare-fun lt!546039 () ListLongMap!17663)

(assert (=> b!1204207 (= e!683832 (= (apply!961 lt!546039 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!944))))

(declare-fun b!1204208 () Bool)

(declare-fun e!683822 () ListLongMap!17663)

(declare-fun call!58171 () ListLongMap!17663)

(assert (=> b!1204208 (= e!683822 call!58171)))

(declare-fun b!1204209 () Bool)

(declare-fun res!801189 () Bool)

(declare-fun e!683825 () Bool)

(assert (=> b!1204209 (=> (not res!801189) (not e!683825))))

(assert (=> b!1204209 (= res!801189 e!683831)))

(declare-fun c!118033 () Bool)

(assert (=> b!1204209 (= c!118033 (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!58164 () Bool)

(declare-fun call!58170 () ListLongMap!17663)

(assert (=> bm!58164 (= call!58171 call!58170)))

(declare-fun d!132747 () Bool)

(assert (=> d!132747 e!683825))

(declare-fun res!801190 () Bool)

(assert (=> d!132747 (=> (not res!801190) (not e!683825))))

(assert (=> d!132747 (= res!801190 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))))

(declare-fun lt!546054 () ListLongMap!17663)

(assert (=> d!132747 (= lt!546039 lt!546054)))

(declare-fun lt!546050 () Unit!39922)

(declare-fun e!683834 () Unit!39922)

(assert (=> d!132747 (= lt!546050 e!683834)))

(declare-fun c!118035 () Bool)

(declare-fun e!683827 () Bool)

(assert (=> d!132747 (= c!118035 e!683827)))

(declare-fun res!801187 () Bool)

(assert (=> d!132747 (=> (not res!801187) (not e!683827))))

(assert (=> d!132747 (= res!801187 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun e!683830 () ListLongMap!17663)

(assert (=> d!132747 (= lt!546054 e!683830)))

(declare-fun c!118037 () Bool)

(assert (=> d!132747 (= c!118037 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!132747 (validMask!0 mask!1564)))

(assert (=> d!132747 (= (getCurrentListMap!4432 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!546039)))

(declare-fun b!1204210 () Bool)

(declare-fun e!683828 () ListLongMap!17663)

(assert (=> b!1204210 (= e!683828 call!58171)))

(declare-fun bm!58165 () Bool)

(declare-fun c!118036 () Bool)

(assert (=> bm!58165 (= call!58170 (+!3973 (ite c!118037 call!58169 (ite c!118036 call!58168 call!58166)) (ite (or c!118037 c!118036) (tuple2!19695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1204211 () Bool)

(declare-fun res!801191 () Bool)

(assert (=> b!1204211 (=> (not res!801191) (not e!683825))))

(declare-fun e!683824 () Bool)

(assert (=> b!1204211 (= res!801191 e!683824)))

(declare-fun res!801194 () Bool)

(assert (=> b!1204211 (=> res!801194 e!683824)))

(declare-fun e!683833 () Bool)

(assert (=> b!1204211 (= res!801194 (not e!683833))))

(declare-fun res!801186 () Bool)

(assert (=> b!1204211 (=> (not res!801186) (not e!683833))))

(assert (=> b!1204211 (= res!801186 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun b!1204212 () Bool)

(assert (=> b!1204212 (= e!683830 e!683822)))

(assert (=> b!1204212 (= c!118036 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!58166 () Bool)

(declare-fun call!58167 () Bool)

(assert (=> bm!58166 (= call!58167 (contains!6903 lt!546039 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204213 () Bool)

(declare-fun lt!546033 () Unit!39922)

(assert (=> b!1204213 (= e!683834 lt!546033)))

(declare-fun lt!546049 () ListLongMap!17663)

(assert (=> b!1204213 (= lt!546049 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546035 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546046 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546046 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!546034 () Unit!39922)

(assert (=> b!1204213 (= lt!546034 (addStillContains!1002 lt!546049 lt!546035 zeroValue!944 lt!546046))))

(assert (=> b!1204213 (contains!6903 (+!3973 lt!546049 (tuple2!19695 lt!546035 zeroValue!944)) lt!546046)))

(declare-fun lt!546036 () Unit!39922)

(assert (=> b!1204213 (= lt!546036 lt!546034)))

(declare-fun lt!546044 () ListLongMap!17663)

(assert (=> b!1204213 (= lt!546044 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546043 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546043 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546037 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546037 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!546040 () Unit!39922)

(declare-fun addApplyDifferent!528 (ListLongMap!17663 (_ BitVec 64) V!45939 (_ BitVec 64)) Unit!39922)

(assert (=> b!1204213 (= lt!546040 (addApplyDifferent!528 lt!546044 lt!546043 minValue!944 lt!546037))))

(assert (=> b!1204213 (= (apply!961 (+!3973 lt!546044 (tuple2!19695 lt!546043 minValue!944)) lt!546037) (apply!961 lt!546044 lt!546037))))

(declare-fun lt!546045 () Unit!39922)

(assert (=> b!1204213 (= lt!546045 lt!546040)))

(declare-fun lt!546048 () ListLongMap!17663)

(assert (=> b!1204213 (= lt!546048 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546051 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546041 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546041 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun lt!546052 () Unit!39922)

(assert (=> b!1204213 (= lt!546052 (addApplyDifferent!528 lt!546048 lt!546051 zeroValue!944 lt!546041))))

(assert (=> b!1204213 (= (apply!961 (+!3973 lt!546048 (tuple2!19695 lt!546051 zeroValue!944)) lt!546041) (apply!961 lt!546048 lt!546041))))

(declare-fun lt!546053 () Unit!39922)

(assert (=> b!1204213 (= lt!546053 lt!546052)))

(declare-fun lt!546042 () ListLongMap!17663)

(assert (=> b!1204213 (= lt!546042 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546038 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546038 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!546047 () (_ BitVec 64))

(assert (=> b!1204213 (= lt!546047 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1204213 (= lt!546033 (addApplyDifferent!528 lt!546042 lt!546038 minValue!944 lt!546047))))

(assert (=> b!1204213 (= (apply!961 (+!3973 lt!546042 (tuple2!19695 lt!546038 minValue!944)) lt!546047) (apply!961 lt!546042 lt!546047))))

(declare-fun b!1204214 () Bool)

(declare-fun e!683823 () Bool)

(assert (=> b!1204214 (= e!683823 (not call!58167))))

(declare-fun b!1204215 () Bool)

(declare-fun Unit!39929 () Unit!39922)

(assert (=> b!1204215 (= e!683834 Unit!39929)))

(declare-fun b!1204216 () Bool)

(assert (=> b!1204216 (= e!683828 call!58166)))

(declare-fun bm!58167 () Bool)

(assert (=> bm!58167 (= call!58169 (getCurrentListMapNoExtraKeys!5283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1204217 () Bool)

(assert (=> b!1204217 (= e!683830 (+!3973 call!58170 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(declare-fun b!1204218 () Bool)

(declare-fun e!683829 () Bool)

(assert (=> b!1204218 (= e!683824 e!683829)))

(declare-fun res!801192 () Bool)

(assert (=> b!1204218 (=> (not res!801192) (not e!683829))))

(assert (=> b!1204218 (= res!801192 (contains!6903 lt!546039 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1204218 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun b!1204219 () Bool)

(declare-fun c!118032 () Bool)

(assert (=> b!1204219 (= c!118032 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1204219 (= e!683822 e!683828)))

(declare-fun b!1204220 () Bool)

(assert (=> b!1204220 (= e!683827 (validKeyInArray!0 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!58168 () Bool)

(assert (=> bm!58168 (= call!58165 (contains!6903 lt!546039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1204221 () Bool)

(assert (=> b!1204221 (= e!683823 e!683832)))

(declare-fun res!801193 () Bool)

(assert (=> b!1204221 (= res!801193 call!58167)))

(assert (=> b!1204221 (=> (not res!801193) (not e!683832))))

(declare-fun b!1204222 () Bool)

(assert (=> b!1204222 (= e!683829 (= (apply!961 lt!546039 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19186 (select (arr!37640 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3195 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1204222 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38176 _values!996)))))

(assert (=> b!1204222 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38177 _keys!1208)))))

(declare-fun b!1204223 () Bool)

(assert (=> b!1204223 (= e!683825 e!683823)))

(declare-fun c!118034 () Bool)

(assert (=> b!1204223 (= c!118034 (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1204224 () Bool)

(assert (=> b!1204224 (= e!683826 (= (apply!961 lt!546039 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!944))))

(declare-fun b!1204225 () Bool)

(assert (=> b!1204225 (= e!683833 (validKeyInArray!0 (select (arr!37641 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!132747 c!118037) b!1204217))

(assert (= (and d!132747 (not c!118037)) b!1204212))

(assert (= (and b!1204212 c!118036) b!1204208))

(assert (= (and b!1204212 (not c!118036)) b!1204219))

(assert (= (and b!1204219 c!118032) b!1204210))

(assert (= (and b!1204219 (not c!118032)) b!1204216))

(assert (= (or b!1204210 b!1204216) bm!58162))

(assert (= (or b!1204208 bm!58162) bm!58163))

(assert (= (or b!1204208 b!1204210) bm!58164))

(assert (= (or b!1204217 bm!58163) bm!58167))

(assert (= (or b!1204217 bm!58164) bm!58165))

(assert (= (and d!132747 res!801187) b!1204220))

(assert (= (and d!132747 c!118035) b!1204213))

(assert (= (and d!132747 (not c!118035)) b!1204215))

(assert (= (and d!132747 res!801190) b!1204211))

(assert (= (and b!1204211 res!801186) b!1204225))

(assert (= (and b!1204211 (not res!801194)) b!1204218))

(assert (= (and b!1204218 res!801192) b!1204222))

(assert (= (and b!1204211 res!801191) b!1204209))

(assert (= (and b!1204209 c!118033) b!1204206))

(assert (= (and b!1204209 (not c!118033)) b!1204205))

(assert (= (and b!1204206 res!801188) b!1204224))

(assert (= (or b!1204206 b!1204205) bm!58168))

(assert (= (and b!1204209 res!801189) b!1204223))

(assert (= (and b!1204223 c!118034) b!1204221))

(assert (= (and b!1204223 (not c!118034)) b!1204214))

(assert (= (and b!1204221 res!801193) b!1204207))

(assert (= (or b!1204221 b!1204214) bm!58166))

(declare-fun b_lambda!21207 () Bool)

(assert (=> (not b_lambda!21207) (not b!1204222)))

(assert (=> b!1204222 t!39388))

(declare-fun b_and!42763 () Bool)

(assert (= b_and!42761 (and (=> t!39388 result!21989) b_and!42763)))

(declare-fun m!1110207 () Bool)

(assert (=> b!1204207 m!1110207))

(assert (=> bm!58167 m!1109949))

(declare-fun m!1110209 () Bool)

(assert (=> b!1204213 m!1110209))

(declare-fun m!1110211 () Bool)

(assert (=> b!1204213 m!1110211))

(declare-fun m!1110213 () Bool)

(assert (=> b!1204213 m!1110213))

(declare-fun m!1110215 () Bool)

(assert (=> b!1204213 m!1110215))

(declare-fun m!1110217 () Bool)

(assert (=> b!1204213 m!1110217))

(declare-fun m!1110219 () Bool)

(assert (=> b!1204213 m!1110219))

(declare-fun m!1110221 () Bool)

(assert (=> b!1204213 m!1110221))

(assert (=> b!1204213 m!1110217))

(assert (=> b!1204213 m!1109949))

(assert (=> b!1204213 m!1110215))

(declare-fun m!1110223 () Bool)

(assert (=> b!1204213 m!1110223))

(declare-fun m!1110225 () Bool)

(assert (=> b!1204213 m!1110225))

(declare-fun m!1110227 () Bool)

(assert (=> b!1204213 m!1110227))

(declare-fun m!1110229 () Bool)

(assert (=> b!1204213 m!1110229))

(declare-fun m!1110231 () Bool)

(assert (=> b!1204213 m!1110231))

(assert (=> b!1204213 m!1110137))

(declare-fun m!1110233 () Bool)

(assert (=> b!1204213 m!1110233))

(assert (=> b!1204213 m!1110227))

(declare-fun m!1110235 () Bool)

(assert (=> b!1204213 m!1110235))

(assert (=> b!1204213 m!1110213))

(declare-fun m!1110237 () Bool)

(assert (=> b!1204213 m!1110237))

(assert (=> b!1204218 m!1110137))

(assert (=> b!1204218 m!1110137))

(declare-fun m!1110239 () Bool)

(assert (=> b!1204218 m!1110239))

(declare-fun m!1110241 () Bool)

(assert (=> b!1204217 m!1110241))

(declare-fun m!1110243 () Bool)

(assert (=> bm!58168 m!1110243))

(declare-fun m!1110245 () Bool)

(assert (=> bm!58166 m!1110245))

(declare-fun m!1110247 () Bool)

(assert (=> b!1204224 m!1110247))

(assert (=> b!1204222 m!1110143))

(assert (=> b!1204222 m!1109993))

(assert (=> b!1204222 m!1110147))

(assert (=> b!1204222 m!1110137))

(assert (=> b!1204222 m!1109993))

(assert (=> b!1204222 m!1110143))

(assert (=> b!1204222 m!1110137))

(declare-fun m!1110249 () Bool)

(assert (=> b!1204222 m!1110249))

(declare-fun m!1110251 () Bool)

(assert (=> bm!58165 m!1110251))

(assert (=> b!1204220 m!1110137))

(assert (=> b!1204220 m!1110137))

(assert (=> b!1204220 m!1110139))

(assert (=> b!1204225 m!1110137))

(assert (=> b!1204225 m!1110137))

(assert (=> b!1204225 m!1110139))

(assert (=> d!132747 m!1109973))

(assert (=> b!1203961 d!132747))

(declare-fun b!1204234 () Bool)

(declare-fun e!683842 () Bool)

(declare-fun call!58174 () Bool)

(assert (=> b!1204234 (= e!683842 call!58174)))

(declare-fun bm!58171 () Bool)

(assert (=> bm!58171 (= call!58174 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1204235 () Bool)

(declare-fun e!683843 () Bool)

(assert (=> b!1204235 (= e!683842 e!683843)))

(declare-fun lt!546061 () (_ BitVec 64))

(assert (=> b!1204235 (= lt!546061 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!546062 () Unit!39922)

(assert (=> b!1204235 (= lt!546062 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!546061 #b00000000000000000000000000000000))))

(assert (=> b!1204235 (arrayContainsKey!0 _keys!1208 lt!546061 #b00000000000000000000000000000000)))

(declare-fun lt!546063 () Unit!39922)

(assert (=> b!1204235 (= lt!546063 lt!546062)))

(declare-fun res!801200 () Bool)

(declare-datatypes ((SeekEntryResult!9934 0))(
  ( (MissingZero!9934 (index!42107 (_ BitVec 32))) (Found!9934 (index!42108 (_ BitVec 32))) (Intermediate!9934 (undefined!10746 Bool) (index!42109 (_ BitVec 32)) (x!106392 (_ BitVec 32))) (Undefined!9934) (MissingVacant!9934 (index!42110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77995 (_ BitVec 32)) SeekEntryResult!9934)

(assert (=> b!1204235 (= res!801200 (= (seekEntryOrOpen!0 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9934 #b00000000000000000000000000000000)))))

(assert (=> b!1204235 (=> (not res!801200) (not e!683843))))

(declare-fun d!132749 () Bool)

(declare-fun res!801199 () Bool)

(declare-fun e!683841 () Bool)

(assert (=> d!132749 (=> res!801199 e!683841)))

(assert (=> d!132749 (= res!801199 (bvsge #b00000000000000000000000000000000 (size!38177 _keys!1208)))))

(assert (=> d!132749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!683841)))

(declare-fun b!1204236 () Bool)

(assert (=> b!1204236 (= e!683843 call!58174)))

(declare-fun b!1204237 () Bool)

(assert (=> b!1204237 (= e!683841 e!683842)))

(declare-fun c!118040 () Bool)

(assert (=> b!1204237 (= c!118040 (validKeyInArray!0 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132749 (not res!801199)) b!1204237))

(assert (= (and b!1204237 c!118040) b!1204235))

(assert (= (and b!1204237 (not c!118040)) b!1204234))

(assert (= (and b!1204235 res!801200) b!1204236))

(assert (= (or b!1204236 b!1204234) bm!58171))

(declare-fun m!1110253 () Bool)

(assert (=> bm!58171 m!1110253))

(declare-fun m!1110255 () Bool)

(assert (=> b!1204235 m!1110255))

(declare-fun m!1110257 () Bool)

(assert (=> b!1204235 m!1110257))

(declare-fun m!1110259 () Bool)

(assert (=> b!1204235 m!1110259))

(assert (=> b!1204235 m!1110255))

(declare-fun m!1110261 () Bool)

(assert (=> b!1204235 m!1110261))

(assert (=> b!1204237 m!1110255))

(assert (=> b!1204237 m!1110255))

(declare-fun m!1110263 () Bool)

(assert (=> b!1204237 m!1110263))

(assert (=> b!1203970 d!132749))

(declare-fun bm!58174 () Bool)

(declare-fun call!58177 () Bool)

(declare-fun c!118043 () Bool)

(assert (=> bm!58174 (= call!58177 (arrayNoDuplicates!0 lt!545873 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118043 (Cons!26501 (select (arr!37641 lt!545873) #b00000000000000000000000000000000) Nil!26502) Nil!26502)))))

(declare-fun b!1204248 () Bool)

(declare-fun e!683855 () Bool)

(assert (=> b!1204248 (= e!683855 call!58177)))

(declare-fun b!1204249 () Bool)

(assert (=> b!1204249 (= e!683855 call!58177)))

(declare-fun b!1204250 () Bool)

(declare-fun e!683854 () Bool)

(declare-fun e!683853 () Bool)

(assert (=> b!1204250 (= e!683854 e!683853)))

(declare-fun res!801207 () Bool)

(assert (=> b!1204250 (=> (not res!801207) (not e!683853))))

(declare-fun e!683852 () Bool)

(assert (=> b!1204250 (= res!801207 (not e!683852))))

(declare-fun res!801208 () Bool)

(assert (=> b!1204250 (=> (not res!801208) (not e!683852))))

(assert (=> b!1204250 (= res!801208 (validKeyInArray!0 (select (arr!37641 lt!545873) #b00000000000000000000000000000000)))))

(declare-fun d!132751 () Bool)

(declare-fun res!801209 () Bool)

(assert (=> d!132751 (=> res!801209 e!683854)))

(assert (=> d!132751 (= res!801209 (bvsge #b00000000000000000000000000000000 (size!38177 lt!545873)))))

(assert (=> d!132751 (= (arrayNoDuplicates!0 lt!545873 #b00000000000000000000000000000000 Nil!26502) e!683854)))

(declare-fun b!1204251 () Bool)

(assert (=> b!1204251 (= e!683853 e!683855)))

(assert (=> b!1204251 (= c!118043 (validKeyInArray!0 (select (arr!37641 lt!545873) #b00000000000000000000000000000000)))))

(declare-fun b!1204252 () Bool)

(declare-fun contains!6906 (List!26505 (_ BitVec 64)) Bool)

(assert (=> b!1204252 (= e!683852 (contains!6906 Nil!26502 (select (arr!37641 lt!545873) #b00000000000000000000000000000000)))))

(assert (= (and d!132751 (not res!801209)) b!1204250))

(assert (= (and b!1204250 res!801208) b!1204252))

(assert (= (and b!1204250 res!801207) b!1204251))

(assert (= (and b!1204251 c!118043) b!1204248))

(assert (= (and b!1204251 (not c!118043)) b!1204249))

(assert (= (or b!1204248 b!1204249) bm!58174))

(declare-fun m!1110265 () Bool)

(assert (=> bm!58174 m!1110265))

(declare-fun m!1110267 () Bool)

(assert (=> bm!58174 m!1110267))

(assert (=> b!1204250 m!1110265))

(assert (=> b!1204250 m!1110265))

(declare-fun m!1110269 () Bool)

(assert (=> b!1204250 m!1110269))

(assert (=> b!1204251 m!1110265))

(assert (=> b!1204251 m!1110265))

(assert (=> b!1204251 m!1110269))

(assert (=> b!1204252 m!1110265))

(assert (=> b!1204252 m!1110265))

(declare-fun m!1110271 () Bool)

(assert (=> b!1204252 m!1110271))

(assert (=> b!1203963 d!132751))

(declare-fun d!132753 () Bool)

(declare-fun e!683856 () Bool)

(assert (=> d!132753 e!683856))

(declare-fun res!801210 () Bool)

(assert (=> d!132753 (=> res!801210 e!683856)))

(declare-fun lt!546064 () Bool)

(assert (=> d!132753 (= res!801210 (not lt!546064))))

(declare-fun lt!546067 () Bool)

(assert (=> d!132753 (= lt!546064 lt!546067)))

(declare-fun lt!546066 () Unit!39922)

(declare-fun e!683857 () Unit!39922)

(assert (=> d!132753 (= lt!546066 e!683857)))

(declare-fun c!118044 () Bool)

(assert (=> d!132753 (= c!118044 lt!546067)))

(assert (=> d!132753 (= lt!546067 (containsKey!588 (toList!8847 lt!545868) k0!934))))

(assert (=> d!132753 (= (contains!6903 lt!545868 k0!934) lt!546064)))

(declare-fun b!1204253 () Bool)

(declare-fun lt!546065 () Unit!39922)

(assert (=> b!1204253 (= e!683857 lt!546065)))

(assert (=> b!1204253 (= lt!546065 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8847 lt!545868) k0!934))))

(assert (=> b!1204253 (isDefined!457 (getValueByKey!632 (toList!8847 lt!545868) k0!934))))

(declare-fun b!1204254 () Bool)

(declare-fun Unit!39930 () Unit!39922)

(assert (=> b!1204254 (= e!683857 Unit!39930)))

(declare-fun b!1204255 () Bool)

(assert (=> b!1204255 (= e!683856 (isDefined!457 (getValueByKey!632 (toList!8847 lt!545868) k0!934)))))

(assert (= (and d!132753 c!118044) b!1204253))

(assert (= (and d!132753 (not c!118044)) b!1204254))

(assert (= (and d!132753 (not res!801210)) b!1204255))

(declare-fun m!1110273 () Bool)

(assert (=> d!132753 m!1110273))

(declare-fun m!1110275 () Bool)

(assert (=> b!1204253 m!1110275))

(declare-fun m!1110277 () Bool)

(assert (=> b!1204253 m!1110277))

(assert (=> b!1204253 m!1110277))

(declare-fun m!1110279 () Bool)

(assert (=> b!1204253 m!1110279))

(assert (=> b!1204255 m!1110277))

(assert (=> b!1204255 m!1110277))

(assert (=> b!1204255 m!1110279))

(assert (=> b!1203978 d!132753))

(assert (=> b!1203978 d!132737))

(declare-fun d!132755 () Bool)

(assert (=> d!132755 (contains!6903 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!546070 () Unit!39922)

(declare-fun choose!1791 (ListLongMap!17663 (_ BitVec 64) V!45939 (_ BitVec 64)) Unit!39922)

(assert (=> d!132755 (= lt!546070 (choose!1791 lt!545864 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!132755 (contains!6903 lt!545864 k0!934)))

(assert (=> d!132755 (= (addStillContains!1002 lt!545864 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!546070)))

(declare-fun bs!34082 () Bool)

(assert (= bs!34082 d!132755))

(assert (=> bs!34082 m!1109969))

(assert (=> bs!34082 m!1109969))

(assert (=> bs!34082 m!1109971))

(declare-fun m!1110281 () Bool)

(assert (=> bs!34082 m!1110281))

(declare-fun m!1110283 () Bool)

(assert (=> bs!34082 m!1110283))

(assert (=> b!1203964 d!132755))

(declare-fun d!132757 () Bool)

(declare-fun e!683858 () Bool)

(assert (=> d!132757 e!683858))

(declare-fun res!801211 () Bool)

(assert (=> d!132757 (=> res!801211 e!683858)))

(declare-fun lt!546071 () Bool)

(assert (=> d!132757 (= res!801211 (not lt!546071))))

(declare-fun lt!546074 () Bool)

(assert (=> d!132757 (= lt!546071 lt!546074)))

(declare-fun lt!546073 () Unit!39922)

(declare-fun e!683859 () Unit!39922)

(assert (=> d!132757 (= lt!546073 e!683859)))

(declare-fun c!118045 () Bool)

(assert (=> d!132757 (= c!118045 lt!546074)))

(assert (=> d!132757 (= lt!546074 (containsKey!588 (toList!8847 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> d!132757 (= (contains!6903 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934) lt!546071)))

(declare-fun b!1204257 () Bool)

(declare-fun lt!546072 () Unit!39922)

(assert (=> b!1204257 (= e!683859 lt!546072)))

(assert (=> b!1204257 (= lt!546072 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8847 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(assert (=> b!1204257 (isDefined!457 (getValueByKey!632 (toList!8847 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934))))

(declare-fun b!1204258 () Bool)

(declare-fun Unit!39931 () Unit!39922)

(assert (=> b!1204258 (= e!683859 Unit!39931)))

(declare-fun b!1204259 () Bool)

(assert (=> b!1204259 (= e!683858 (isDefined!457 (getValueByKey!632 (toList!8847 (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) k0!934)))))

(assert (= (and d!132757 c!118045) b!1204257))

(assert (= (and d!132757 (not c!118045)) b!1204258))

(assert (= (and d!132757 (not res!801211)) b!1204259))

(declare-fun m!1110285 () Bool)

(assert (=> d!132757 m!1110285))

(declare-fun m!1110287 () Bool)

(assert (=> b!1204257 m!1110287))

(declare-fun m!1110289 () Bool)

(assert (=> b!1204257 m!1110289))

(assert (=> b!1204257 m!1110289))

(declare-fun m!1110291 () Bool)

(assert (=> b!1204257 m!1110291))

(assert (=> b!1204259 m!1110289))

(assert (=> b!1204259 m!1110289))

(assert (=> b!1204259 m!1110291))

(assert (=> b!1203964 d!132757))

(declare-fun d!132759 () Bool)

(declare-fun e!683860 () Bool)

(assert (=> d!132759 e!683860))

(declare-fun res!801212 () Bool)

(assert (=> d!132759 (=> (not res!801212) (not e!683860))))

(declare-fun lt!546076 () ListLongMap!17663)

(assert (=> d!132759 (= res!801212 (contains!6903 lt!546076 (_1!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun lt!546077 () List!26504)

(assert (=> d!132759 (= lt!546076 (ListLongMap!17664 lt!546077))))

(declare-fun lt!546078 () Unit!39922)

(declare-fun lt!546075 () Unit!39922)

(assert (=> d!132759 (= lt!546078 lt!546075)))

(assert (=> d!132759 (= (getValueByKey!632 lt!546077 (_1!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!682 (_2!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132759 (= lt!546075 (lemmaContainsTupThenGetReturnValue!309 lt!546077 (_1!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132759 (= lt!546077 (insertStrictlySorted!402 (toList!8847 lt!545864) (_1!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) (_2!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(assert (=> d!132759 (= (+!3973 lt!545864 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) lt!546076)))

(declare-fun b!1204260 () Bool)

(declare-fun res!801213 () Bool)

(assert (=> b!1204260 (=> (not res!801213) (not e!683860))))

(assert (=> b!1204260 (= res!801213 (= (getValueByKey!632 (toList!8847 lt!546076) (_1!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))) (Some!682 (_2!9858 (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1204261 () Bool)

(assert (=> b!1204261 (= e!683860 (contains!6905 (toList!8847 lt!546076) (tuple2!19695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))

(assert (= (and d!132759 res!801212) b!1204260))

(assert (= (and b!1204260 res!801213) b!1204261))

(declare-fun m!1110293 () Bool)

(assert (=> d!132759 m!1110293))

(declare-fun m!1110295 () Bool)

(assert (=> d!132759 m!1110295))

(declare-fun m!1110297 () Bool)

(assert (=> d!132759 m!1110297))

(declare-fun m!1110299 () Bool)

(assert (=> d!132759 m!1110299))

(declare-fun m!1110301 () Bool)

(assert (=> b!1204260 m!1110301))

(declare-fun m!1110303 () Bool)

(assert (=> b!1204261 m!1110303))

(assert (=> b!1203964 d!132759))

(declare-fun d!132761 () Bool)

(assert (=> d!132761 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1203965 d!132761))

(declare-fun bm!58175 () Bool)

(declare-fun call!58178 () Bool)

(declare-fun c!118046 () Bool)

(assert (=> bm!58175 (= call!58178 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118046 (Cons!26501 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000) Nil!26502) Nil!26502)))))

(declare-fun b!1204262 () Bool)

(declare-fun e!683864 () Bool)

(assert (=> b!1204262 (= e!683864 call!58178)))

(declare-fun b!1204263 () Bool)

(assert (=> b!1204263 (= e!683864 call!58178)))

(declare-fun b!1204264 () Bool)

(declare-fun e!683863 () Bool)

(declare-fun e!683862 () Bool)

(assert (=> b!1204264 (= e!683863 e!683862)))

(declare-fun res!801214 () Bool)

(assert (=> b!1204264 (=> (not res!801214) (not e!683862))))

(declare-fun e!683861 () Bool)

(assert (=> b!1204264 (= res!801214 (not e!683861))))

(declare-fun res!801215 () Bool)

(assert (=> b!1204264 (=> (not res!801215) (not e!683861))))

(assert (=> b!1204264 (= res!801215 (validKeyInArray!0 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!132763 () Bool)

(declare-fun res!801216 () Bool)

(assert (=> d!132763 (=> res!801216 e!683863)))

(assert (=> d!132763 (= res!801216 (bvsge #b00000000000000000000000000000000 (size!38177 _keys!1208)))))

(assert (=> d!132763 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26502) e!683863)))

(declare-fun b!1204265 () Bool)

(assert (=> b!1204265 (= e!683862 e!683864)))

(assert (=> b!1204265 (= c!118046 (validKeyInArray!0 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1204266 () Bool)

(assert (=> b!1204266 (= e!683861 (contains!6906 Nil!26502 (select (arr!37641 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132763 (not res!801216)) b!1204264))

(assert (= (and b!1204264 res!801215) b!1204266))

(assert (= (and b!1204264 res!801214) b!1204265))

(assert (= (and b!1204265 c!118046) b!1204262))

(assert (= (and b!1204265 (not c!118046)) b!1204263))

(assert (= (or b!1204262 b!1204263) bm!58175))

(assert (=> bm!58175 m!1110255))

(declare-fun m!1110305 () Bool)

(assert (=> bm!58175 m!1110305))

(assert (=> b!1204264 m!1110255))

(assert (=> b!1204264 m!1110255))

(assert (=> b!1204264 m!1110263))

(assert (=> b!1204265 m!1110255))

(assert (=> b!1204265 m!1110255))

(assert (=> b!1204265 m!1110263))

(assert (=> b!1204266 m!1110255))

(assert (=> b!1204266 m!1110255))

(declare-fun m!1110307 () Bool)

(assert (=> b!1204266 m!1110307))

(assert (=> b!1203973 d!132763))

(declare-fun d!132765 () Bool)

(assert (=> d!132765 (= (array_inv!28676 _keys!1208) (bvsge (size!38177 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100644 d!132765))

(declare-fun d!132767 () Bool)

(assert (=> d!132767 (= (array_inv!28677 _values!996) (bvsge (size!38176 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100644 d!132767))

(declare-fun b!1204267 () Bool)

(declare-fun e!683866 () Bool)

(declare-fun call!58179 () Bool)

(assert (=> b!1204267 (= e!683866 call!58179)))

(declare-fun bm!58176 () Bool)

(assert (=> bm!58176 (= call!58179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!545873 mask!1564))))

(declare-fun b!1204268 () Bool)

(declare-fun e!683867 () Bool)

(assert (=> b!1204268 (= e!683866 e!683867)))

(declare-fun lt!546079 () (_ BitVec 64))

(assert (=> b!1204268 (= lt!546079 (select (arr!37641 lt!545873) #b00000000000000000000000000000000))))

(declare-fun lt!546080 () Unit!39922)

(assert (=> b!1204268 (= lt!546080 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!545873 lt!546079 #b00000000000000000000000000000000))))

(assert (=> b!1204268 (arrayContainsKey!0 lt!545873 lt!546079 #b00000000000000000000000000000000)))

(declare-fun lt!546081 () Unit!39922)

(assert (=> b!1204268 (= lt!546081 lt!546080)))

(declare-fun res!801218 () Bool)

(assert (=> b!1204268 (= res!801218 (= (seekEntryOrOpen!0 (select (arr!37641 lt!545873) #b00000000000000000000000000000000) lt!545873 mask!1564) (Found!9934 #b00000000000000000000000000000000)))))

(assert (=> b!1204268 (=> (not res!801218) (not e!683867))))

(declare-fun d!132769 () Bool)

(declare-fun res!801217 () Bool)

(declare-fun e!683865 () Bool)

(assert (=> d!132769 (=> res!801217 e!683865)))

(assert (=> d!132769 (= res!801217 (bvsge #b00000000000000000000000000000000 (size!38177 lt!545873)))))

(assert (=> d!132769 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545873 mask!1564) e!683865)))

(declare-fun b!1204269 () Bool)

(assert (=> b!1204269 (= e!683867 call!58179)))

(declare-fun b!1204270 () Bool)

(assert (=> b!1204270 (= e!683865 e!683866)))

(declare-fun c!118047 () Bool)

(assert (=> b!1204270 (= c!118047 (validKeyInArray!0 (select (arr!37641 lt!545873) #b00000000000000000000000000000000)))))

(assert (= (and d!132769 (not res!801217)) b!1204270))

(assert (= (and b!1204270 c!118047) b!1204268))

(assert (= (and b!1204270 (not c!118047)) b!1204267))

(assert (= (and b!1204268 res!801218) b!1204269))

(assert (= (or b!1204269 b!1204267) bm!58176))

(declare-fun m!1110309 () Bool)

(assert (=> bm!58176 m!1110309))

(assert (=> b!1204268 m!1110265))

(declare-fun m!1110311 () Bool)

(assert (=> b!1204268 m!1110311))

(declare-fun m!1110313 () Bool)

(assert (=> b!1204268 m!1110313))

(assert (=> b!1204268 m!1110265))

(declare-fun m!1110315 () Bool)

(assert (=> b!1204268 m!1110315))

(assert (=> b!1204270 m!1110265))

(assert (=> b!1204270 m!1110265))

(assert (=> b!1204270 m!1110269))

(assert (=> b!1203974 d!132769))

(declare-fun d!132771 () Bool)

(declare-fun lt!546084 () ListLongMap!17663)

(assert (=> d!132771 (not (contains!6903 lt!546084 k0!934))))

(declare-fun removeStrictlySorted!94 (List!26504 (_ BitVec 64)) List!26504)

(assert (=> d!132771 (= lt!546084 (ListLongMap!17664 (removeStrictlySorted!94 (toList!8847 call!58114) k0!934)))))

(assert (=> d!132771 (= (-!1813 call!58114 k0!934) lt!546084)))

(declare-fun bs!34083 () Bool)

(assert (= bs!34083 d!132771))

(declare-fun m!1110317 () Bool)

(assert (=> bs!34083 m!1110317))

(declare-fun m!1110319 () Bool)

(assert (=> bs!34083 m!1110319))

(assert (=> b!1203982 d!132771))

(declare-fun d!132773 () Bool)

(declare-fun e!683868 () Bool)

(assert (=> d!132773 e!683868))

(declare-fun res!801219 () Bool)

(assert (=> d!132773 (=> res!801219 e!683868)))

(declare-fun lt!546085 () Bool)

(assert (=> d!132773 (= res!801219 (not lt!546085))))

(declare-fun lt!546088 () Bool)

(assert (=> d!132773 (= lt!546085 lt!546088)))

(declare-fun lt!546087 () Unit!39922)

(declare-fun e!683869 () Unit!39922)

(assert (=> d!132773 (= lt!546087 e!683869)))

(declare-fun c!118048 () Bool)

(assert (=> d!132773 (= c!118048 lt!546088)))

(assert (=> d!132773 (= lt!546088 (containsKey!588 (toList!8847 (ite c!117974 lt!545864 call!58107)) k0!934))))

(assert (=> d!132773 (= (contains!6903 (ite c!117974 lt!545864 call!58107) k0!934) lt!546085)))

(declare-fun b!1204271 () Bool)

(declare-fun lt!546086 () Unit!39922)

(assert (=> b!1204271 (= e!683869 lt!546086)))

(assert (=> b!1204271 (= lt!546086 (lemmaContainsKeyImpliesGetValueByKeyDefined!418 (toList!8847 (ite c!117974 lt!545864 call!58107)) k0!934))))

(assert (=> b!1204271 (isDefined!457 (getValueByKey!632 (toList!8847 (ite c!117974 lt!545864 call!58107)) k0!934))))

(declare-fun b!1204272 () Bool)

(declare-fun Unit!39932 () Unit!39922)

(assert (=> b!1204272 (= e!683869 Unit!39932)))

(declare-fun b!1204273 () Bool)

(assert (=> b!1204273 (= e!683868 (isDefined!457 (getValueByKey!632 (toList!8847 (ite c!117974 lt!545864 call!58107)) k0!934)))))

(assert (= (and d!132773 c!118048) b!1204271))

(assert (= (and d!132773 (not c!118048)) b!1204272))

(assert (= (and d!132773 (not res!801219)) b!1204273))

(declare-fun m!1110321 () Bool)

(assert (=> d!132773 m!1110321))

(declare-fun m!1110323 () Bool)

(assert (=> b!1204271 m!1110323))

(declare-fun m!1110325 () Bool)

(assert (=> b!1204271 m!1110325))

(assert (=> b!1204271 m!1110325))

(declare-fun m!1110327 () Bool)

(assert (=> b!1204271 m!1110327))

(assert (=> b!1204273 m!1110325))

(assert (=> b!1204273 m!1110325))

(assert (=> b!1204273 m!1110327))

(assert (=> bm!58108 d!132773))

(declare-fun d!132775 () Bool)

(assert (=> d!132775 (contains!6903 (+!3973 lt!545868 (tuple2!19695 (ite (or c!117974 c!117975) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117974 c!117975) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!546089 () Unit!39922)

(assert (=> d!132775 (= lt!546089 (choose!1791 lt!545868 (ite (or c!117974 c!117975) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117974 c!117975) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!132775 (contains!6903 lt!545868 k0!934)))

(assert (=> d!132775 (= (addStillContains!1002 lt!545868 (ite (or c!117974 c!117975) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117974 c!117975) zeroValue!944 minValue!944) k0!934) lt!546089)))

(declare-fun bs!34084 () Bool)

(assert (= bs!34084 d!132775))

(declare-fun m!1110329 () Bool)

(assert (=> bs!34084 m!1110329))

(assert (=> bs!34084 m!1110329))

(declare-fun m!1110331 () Bool)

(assert (=> bs!34084 m!1110331))

(declare-fun m!1110333 () Bool)

(assert (=> bs!34084 m!1110333))

(assert (=> bs!34084 m!1109983))

(assert (=> bm!58104 d!132775))

(declare-fun d!132777 () Bool)

(declare-fun res!801224 () Bool)

(declare-fun e!683874 () Bool)

(assert (=> d!132777 (=> res!801224 e!683874)))

(assert (=> d!132777 (= res!801224 (= (select (arr!37641 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132777 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!683874)))

(declare-fun b!1204278 () Bool)

(declare-fun e!683875 () Bool)

(assert (=> b!1204278 (= e!683874 e!683875)))

(declare-fun res!801225 () Bool)

(assert (=> b!1204278 (=> (not res!801225) (not e!683875))))

(assert (=> b!1204278 (= res!801225 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38177 _keys!1208)))))

(declare-fun b!1204279 () Bool)

(assert (=> b!1204279 (= e!683875 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132777 (not res!801224)) b!1204278))

(assert (= (and b!1204278 res!801225) b!1204279))

(assert (=> d!132777 m!1110255))

(declare-fun m!1110335 () Bool)

(assert (=> b!1204279 m!1110335))

(assert (=> b!1203983 d!132777))

(declare-fun d!132779 () Bool)

(assert (=> d!132779 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546092 () Unit!39922)

(declare-fun choose!13 (array!77995 (_ BitVec 64) (_ BitVec 32)) Unit!39922)

(assert (=> d!132779 (= lt!546092 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132779 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132779 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!546092)))

(declare-fun bs!34085 () Bool)

(assert (= bs!34085 d!132779))

(assert (=> bs!34085 m!1109987))

(declare-fun m!1110337 () Bool)

(assert (=> bs!34085 m!1110337))

(assert (=> b!1203983 d!132779))

(declare-fun condMapEmpty!47766 () Bool)

(declare-fun mapDefault!47766 () ValueCell!14595)

(assert (=> mapNonEmpty!47760 (= condMapEmpty!47766 (= mapRest!47760 ((as const (Array (_ BitVec 32) ValueCell!14595)) mapDefault!47766)))))

(declare-fun e!683880 () Bool)

(declare-fun mapRes!47766 () Bool)

(assert (=> mapNonEmpty!47760 (= tp!90708 (and e!683880 mapRes!47766))))

(declare-fun b!1204287 () Bool)

(assert (=> b!1204287 (= e!683880 tp_is_empty!30609)))

(declare-fun mapIsEmpty!47766 () Bool)

(assert (=> mapIsEmpty!47766 mapRes!47766))

(declare-fun mapNonEmpty!47766 () Bool)

(declare-fun tp!90718 () Bool)

(declare-fun e!683881 () Bool)

(assert (=> mapNonEmpty!47766 (= mapRes!47766 (and tp!90718 e!683881))))

(declare-fun mapRest!47766 () (Array (_ BitVec 32) ValueCell!14595))

(declare-fun mapKey!47766 () (_ BitVec 32))

(declare-fun mapValue!47766 () ValueCell!14595)

(assert (=> mapNonEmpty!47766 (= mapRest!47760 (store mapRest!47766 mapKey!47766 mapValue!47766))))

(declare-fun b!1204286 () Bool)

(assert (=> b!1204286 (= e!683881 tp_is_empty!30609)))

(assert (= (and mapNonEmpty!47760 condMapEmpty!47766) mapIsEmpty!47766))

(assert (= (and mapNonEmpty!47760 (not condMapEmpty!47766)) mapNonEmpty!47766))

(assert (= (and mapNonEmpty!47766 ((_ is ValueCellFull!14595) mapValue!47766)) b!1204286))

(assert (= (and mapNonEmpty!47760 ((_ is ValueCellFull!14595) mapDefault!47766)) b!1204287))

(declare-fun m!1110339 () Bool)

(assert (=> mapNonEmpty!47766 m!1110339))

(declare-fun b_lambda!21209 () Bool)

(assert (= b_lambda!21197 (or (and start!100644 b_free!25905) b_lambda!21209)))

(declare-fun b_lambda!21211 () Bool)

(assert (= b_lambda!21205 (or (and start!100644 b_free!25905) b_lambda!21211)))

(declare-fun b_lambda!21213 () Bool)

(assert (= b_lambda!21207 (or (and start!100644 b_free!25905) b_lambda!21213)))

(declare-fun b_lambda!21215 () Bool)

(assert (= b_lambda!21193 (or (and start!100644 b_free!25905) b_lambda!21215)))

(declare-fun b_lambda!21217 () Bool)

(assert (= b_lambda!21201 (or (and start!100644 b_free!25905) b_lambda!21217)))

(declare-fun b_lambda!21219 () Bool)

(assert (= b_lambda!21189 (or (and start!100644 b_free!25905) b_lambda!21219)))

(declare-fun b_lambda!21221 () Bool)

(assert (= b_lambda!21191 (or (and start!100644 b_free!25905) b_lambda!21221)))

(declare-fun b_lambda!21223 () Bool)

(assert (= b_lambda!21203 (or (and start!100644 b_free!25905) b_lambda!21223)))

(declare-fun b_lambda!21225 () Bool)

(assert (= b_lambda!21199 (or (and start!100644 b_free!25905) b_lambda!21225)))

(declare-fun b_lambda!21227 () Bool)

(assert (= b_lambda!21195 (or (and start!100644 b_free!25905) b_lambda!21227)))

(check-sat (not b!1204108) (not bm!58175) (not b_next!25905) (not b!1204136) (not b!1204268) (not b_lambda!21211) (not bm!58146) (not b!1204096) (not b!1204144) (not b_lambda!21187) (not b!1204235) (not b_lambda!21219) (not d!132745) (not mapNonEmpty!47766) (not b!1204106) (not b!1204092) (not b!1204213) (not b!1204139) (not b!1204104) (not b_lambda!21223) (not b!1204253) (not b!1204130) (not b!1204122) (not b!1204142) (not b_lambda!21213) (not b!1204260) (not bm!58174) (not d!132733) (not b!1204127) (not b!1204109) (not d!132737) (not b!1204207) (not b!1204251) (not bm!58171) (not b!1204141) (not bm!58167) (not b!1204103) (not d!132739) (not b!1204220) (not d!132773) (not b!1204224) (not b!1204250) (not b!1204097) (not bm!58140) (not b!1204126) (not b!1204273) (not bm!58139) (not b!1204252) (not b_lambda!21227) (not b_lambda!21221) (not b!1204094) (not b!1204266) (not b!1204225) (not b!1204102) (not b!1204217) (not bm!58176) b_and!42763 (not b!1204138) (not b!1204257) (not b!1204222) (not b!1204160) (not b_lambda!21209) (not d!132731) (not b!1204264) tp_is_empty!30609 (not bm!58147) (not b!1204112) (not b!1204279) (not b!1204120) (not b!1204153) (not b!1204133) (not b!1204129) (not b!1204265) (not d!132779) (not b!1204261) (not d!132771) (not d!132775) (not b_lambda!21215) (not b!1204259) (not b!1204271) (not b!1204114) (not bm!58165) (not b!1204124) (not d!132747) (not d!132743) (not bm!58138) (not b!1204121) (not b!1204237) (not bm!58141) (not b!1204091) (not d!132753) (not d!132759) (not b!1204100) (not d!132735) (not b!1204162) (not b!1204270) (not b!1204099) (not b!1204119) (not b_lambda!21225) (not b!1204255) (not b!1204132) (not b!1204111) (not b_lambda!21217) (not d!132755) (not bm!58168) (not bm!58166) (not d!132757) (not b!1204134) (not b!1204218))
(check-sat b_and!42763 (not b_next!25905))
