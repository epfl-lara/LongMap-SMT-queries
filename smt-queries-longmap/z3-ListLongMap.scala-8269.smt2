; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100798 () Bool)

(assert start!100798)

(declare-fun b_free!25885 () Bool)

(declare-fun b_next!25885 () Bool)

(assert (=> start!100798 (= b_free!25885 (not b_next!25885))))

(declare-fun tp!90645 () Bool)

(declare-fun b_and!42659 () Bool)

(assert (=> start!100798 (= tp!90645 b_and!42659)))

(declare-fun e!683775 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1203966 () Bool)

(declare-datatypes ((V!45913 0))(
  ( (V!45914 (val!15351 Int)) )
))
(declare-datatypes ((tuple2!19690 0))(
  ( (tuple2!19691 (_1!9856 (_ BitVec 64)) (_2!9856 V!45913)) )
))
(declare-datatypes ((List!26502 0))(
  ( (Nil!26499) (Cons!26498 (h!27716 tuple2!19690) (t!39359 List!26502)) )
))
(declare-datatypes ((ListLongMap!17667 0))(
  ( (ListLongMap!17668 (toList!8849 List!26502)) )
))
(declare-fun call!57888 () ListLongMap!17667)

(declare-fun call!57892 () ListLongMap!17667)

(declare-fun -!1797 (ListLongMap!17667 (_ BitVec 64)) ListLongMap!17667)

(assert (=> b!1203966 (= e!683775 (= call!57888 (-!1797 call!57892 k0!934)))))

(declare-fun b!1203967 () Bool)

(declare-fun e!683767 () Bool)

(declare-fun e!683771 () Bool)

(declare-fun mapRes!47726 () Bool)

(assert (=> b!1203967 (= e!683767 (and e!683771 mapRes!47726))))

(declare-fun condMapEmpty!47726 () Bool)

(declare-datatypes ((ValueCell!14585 0))(
  ( (ValueCellFull!14585 (v!17985 V!45913)) (EmptyCell!14585) )
))
(declare-datatypes ((array!77989 0))(
  ( (array!77990 (arr!37633 (Array (_ BitVec 32) ValueCell!14585)) (size!38170 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77989)

(declare-fun mapDefault!47726 () ValueCell!14585)

(assert (=> b!1203967 (= condMapEmpty!47726 (= (arr!37633 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14585)) mapDefault!47726)))))

(declare-fun mapIsEmpty!47726 () Bool)

(assert (=> mapIsEmpty!47726 mapRes!47726))

(declare-fun bm!57882 () Bool)

(declare-fun call!57885 () Bool)

(declare-fun call!57890 () Bool)

(assert (=> bm!57882 (= call!57885 call!57890)))

(declare-fun b!1203968 () Bool)

(declare-datatypes ((Unit!39831 0))(
  ( (Unit!39832) )
))
(declare-fun e!683776 () Unit!39831)

(declare-fun e!683764 () Unit!39831)

(assert (=> b!1203968 (= e!683776 e!683764)))

(declare-fun c!118106 () Bool)

(declare-fun lt!545613 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1203968 (= c!118106 (and (not lt!545613) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1203969 () Bool)

(declare-fun e!683773 () Bool)

(declare-fun e!683774 () Bool)

(assert (=> b!1203969 (= e!683773 e!683774)))

(declare-fun res!800957 () Bool)

(assert (=> b!1203969 (=> res!800957 e!683774)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203969 (= res!800957 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45913)

(declare-fun lt!545617 () ListLongMap!17667)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!545612 () array!77989)

(declare-fun minValue!944 () V!45913)

(declare-datatypes ((array!77991 0))(
  ( (array!77992 (arr!37634 (Array (_ BitVec 32) (_ BitVec 64))) (size!38171 (_ BitVec 32))) )
))
(declare-fun lt!545614 () array!77991)

(declare-fun getCurrentListMapNoExtraKeys!5316 (array!77991 array!77989 (_ BitVec 32) (_ BitVec 32) V!45913 V!45913 (_ BitVec 32) Int) ListLongMap!17667)

(assert (=> b!1203969 (= lt!545617 (getCurrentListMapNoExtraKeys!5316 lt!545614 lt!545612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3247 (Int (_ BitVec 64)) V!45913)

(assert (=> b!1203969 (= lt!545612 (array!77990 (store (arr!37633 _values!996) i!673 (ValueCellFull!14585 (dynLambda!3247 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38170 _values!996)))))

(declare-fun _keys!1208 () array!77991)

(declare-fun lt!545619 () ListLongMap!17667)

(assert (=> b!1203969 (= lt!545619 (getCurrentListMapNoExtraKeys!5316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203970 () Bool)

(assert (=> b!1203970 call!57885))

(declare-fun lt!545611 () Unit!39831)

(declare-fun call!57889 () Unit!39831)

(assert (=> b!1203970 (= lt!545611 call!57889)))

(assert (=> b!1203970 (= e!683764 lt!545611)))

(declare-fun res!800968 () Bool)

(declare-fun e!683772 () Bool)

(assert (=> start!100798 (=> (not res!800968) (not e!683772))))

(assert (=> start!100798 (= res!800968 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38171 _keys!1208))))))

(assert (=> start!100798 e!683772))

(declare-fun tp_is_empty!30589 () Bool)

(assert (=> start!100798 tp_is_empty!30589))

(declare-fun array_inv!28742 (array!77991) Bool)

(assert (=> start!100798 (array_inv!28742 _keys!1208)))

(assert (=> start!100798 true))

(assert (=> start!100798 tp!90645))

(declare-fun array_inv!28743 (array!77989) Bool)

(assert (=> start!100798 (and (array_inv!28743 _values!996) e!683767)))

(declare-fun b!1203971 () Bool)

(declare-fun e!683770 () Bool)

(assert (=> b!1203971 (= e!683772 e!683770)))

(declare-fun res!800955 () Bool)

(assert (=> b!1203971 (=> (not res!800955) (not e!683770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77991 (_ BitVec 32)) Bool)

(assert (=> b!1203971 (= res!800955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545614 mask!1564))))

(assert (=> b!1203971 (= lt!545614 (array!77992 (store (arr!37634 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38171 _keys!1208)))))

(declare-fun call!57887 () ListLongMap!17667)

(declare-fun bm!57883 () Bool)

(declare-fun c!118107 () Bool)

(declare-fun lt!545624 () ListLongMap!17667)

(declare-fun contains!6924 (ListLongMap!17667 (_ BitVec 64)) Bool)

(assert (=> bm!57883 (= call!57890 (contains!6924 (ite c!118107 lt!545624 call!57887) k0!934))))

(declare-fun b!1203972 () Bool)

(declare-fun e!683766 () Bool)

(declare-fun e!683769 () Bool)

(assert (=> b!1203972 (= e!683766 e!683769)))

(declare-fun res!800965 () Bool)

(assert (=> b!1203972 (=> res!800965 e!683769)))

(declare-fun lt!545618 () ListLongMap!17667)

(assert (=> b!1203972 (= res!800965 (not (contains!6924 lt!545618 k0!934)))))

(assert (=> b!1203972 (= lt!545618 (getCurrentListMapNoExtraKeys!5316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203973 () Bool)

(declare-fun res!800958 () Bool)

(assert (=> b!1203973 (=> (not res!800958) (not e!683772))))

(declare-datatypes ((List!26503 0))(
  ( (Nil!26500) (Cons!26499 (h!27717 (_ BitVec 64)) (t!39360 List!26503)) )
))
(declare-fun arrayNoDuplicates!0 (array!77991 (_ BitVec 32) List!26503) Bool)

(assert (=> b!1203973 (= res!800958 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26500))))

(declare-fun b!1203974 () Bool)

(declare-fun res!800959 () Bool)

(assert (=> b!1203974 (=> (not res!800959) (not e!683772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203974 (= res!800959 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47726 () Bool)

(declare-fun tp!90644 () Bool)

(declare-fun e!683765 () Bool)

(assert (=> mapNonEmpty!47726 (= mapRes!47726 (and tp!90644 e!683765))))

(declare-fun mapRest!47726 () (Array (_ BitVec 32) ValueCell!14585))

(declare-fun mapValue!47726 () ValueCell!14585)

(declare-fun mapKey!47726 () (_ BitVec 32))

(assert (=> mapNonEmpty!47726 (= (arr!37633 _values!996) (store mapRest!47726 mapKey!47726 mapValue!47726))))

(declare-fun b!1203975 () Bool)

(assert (=> b!1203975 (= e!683775 (= call!57888 call!57892))))

(declare-fun b!1203976 () Bool)

(declare-fun res!800956 () Bool)

(assert (=> b!1203976 (=> (not res!800956) (not e!683772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203976 (= res!800956 (validKeyInArray!0 k0!934))))

(declare-fun bm!57884 () Bool)

(assert (=> bm!57884 (= call!57888 (getCurrentListMapNoExtraKeys!5316 lt!545614 lt!545612 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203977 () Bool)

(declare-fun res!800961 () Bool)

(assert (=> b!1203977 (=> (not res!800961) (not e!683772))))

(assert (=> b!1203977 (= res!800961 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38171 _keys!1208))))))

(declare-fun b!1203978 () Bool)

(declare-fun e!683777 () Unit!39831)

(declare-fun Unit!39833 () Unit!39831)

(assert (=> b!1203978 (= e!683777 Unit!39833)))

(declare-fun b!1203979 () Bool)

(declare-fun res!800960 () Bool)

(assert (=> b!1203979 (=> (not res!800960) (not e!683772))))

(assert (=> b!1203979 (= res!800960 (and (= (size!38170 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38171 _keys!1208) (size!38170 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203980 () Bool)

(assert (=> b!1203980 (= e!683771 tp_is_empty!30589)))

(declare-fun bm!57885 () Bool)

(declare-fun call!57891 () ListLongMap!17667)

(assert (=> bm!57885 (= call!57887 call!57891)))

(declare-fun bm!57886 () Bool)

(assert (=> bm!57886 (= call!57892 (getCurrentListMapNoExtraKeys!5316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203981 () Bool)

(assert (=> b!1203981 (= e!683774 e!683766)))

(declare-fun res!800964 () Bool)

(assert (=> b!1203981 (=> res!800964 e!683766)))

(assert (=> b!1203981 (= res!800964 (not (= (select (arr!37634 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203981 e!683775))

(declare-fun c!118108 () Bool)

(assert (=> b!1203981 (= c!118108 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545621 () Unit!39831)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1018 (array!77991 array!77989 (_ BitVec 32) (_ BitVec 32) V!45913 V!45913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39831)

(assert (=> b!1203981 (= lt!545621 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1018 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203982 () Bool)

(declare-fun lt!545623 () Unit!39831)

(assert (=> b!1203982 (= e!683777 lt!545623)))

(assert (=> b!1203982 (= lt!545623 call!57889)))

(assert (=> b!1203982 call!57885))

(declare-fun b!1203983 () Bool)

(assert (=> b!1203983 (= e!683770 (not e!683773))))

(declare-fun res!800963 () Bool)

(assert (=> b!1203983 (=> res!800963 e!683773)))

(assert (=> b!1203983 (= res!800963 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203983 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545620 () Unit!39831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77991 (_ BitVec 64) (_ BitVec 32)) Unit!39831)

(assert (=> b!1203983 (= lt!545620 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1203984 () Bool)

(assert (=> b!1203984 (= e!683765 tp_is_empty!30589)))

(declare-fun call!57886 () Unit!39831)

(declare-fun bm!57887 () Bool)

(declare-fun addStillContains!1001 (ListLongMap!17667 (_ BitVec 64) V!45913 (_ BitVec 64)) Unit!39831)

(assert (=> bm!57887 (= call!57886 (addStillContains!1001 (ite c!118107 lt!545624 lt!545618) (ite c!118107 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118106 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118107 minValue!944 (ite c!118106 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!57888 () Bool)

(assert (=> bm!57888 (= call!57889 call!57886)))

(declare-fun b!1203985 () Bool)

(declare-fun c!118105 () Bool)

(assert (=> b!1203985 (= c!118105 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545613))))

(assert (=> b!1203985 (= e!683764 e!683777)))

(declare-fun b!1203986 () Bool)

(declare-fun res!800966 () Bool)

(assert (=> b!1203986 (=> (not res!800966) (not e!683770))))

(assert (=> b!1203986 (= res!800966 (arrayNoDuplicates!0 lt!545614 #b00000000000000000000000000000000 Nil!26500))))

(declare-fun b!1203987 () Bool)

(declare-fun res!800962 () Bool)

(assert (=> b!1203987 (=> (not res!800962) (not e!683772))))

(assert (=> b!1203987 (= res!800962 (= (select (arr!37634 _keys!1208) i!673) k0!934))))

(declare-fun b!1203988 () Bool)

(declare-fun res!800967 () Bool)

(assert (=> b!1203988 (=> (not res!800967) (not e!683772))))

(assert (=> b!1203988 (= res!800967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57889 () Bool)

(declare-fun +!4016 (ListLongMap!17667 tuple2!19690) ListLongMap!17667)

(assert (=> bm!57889 (= call!57891 (+!4016 (ite c!118107 lt!545624 lt!545618) (ite c!118107 (tuple2!19691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118106 (tuple2!19691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19691 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1203989 () Bool)

(declare-fun lt!545615 () Unit!39831)

(assert (=> b!1203989 (= e!683776 lt!545615)))

(declare-fun lt!545622 () Unit!39831)

(assert (=> b!1203989 (= lt!545622 (addStillContains!1001 lt!545618 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1203989 (= lt!545624 (+!4016 lt!545618 (tuple2!19691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1203989 call!57890))

(assert (=> b!1203989 (= lt!545615 call!57886)))

(assert (=> b!1203989 (contains!6924 call!57891 k0!934)))

(declare-fun b!1203990 () Bool)

(assert (=> b!1203990 (= e!683769 true)))

(declare-fun lt!545616 () Unit!39831)

(assert (=> b!1203990 (= lt!545616 e!683776)))

(assert (=> b!1203990 (= c!118107 (and (not lt!545613) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203990 (= lt!545613 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!100798 res!800968) b!1203974))

(assert (= (and b!1203974 res!800959) b!1203979))

(assert (= (and b!1203979 res!800960) b!1203988))

(assert (= (and b!1203988 res!800967) b!1203973))

(assert (= (and b!1203973 res!800958) b!1203977))

(assert (= (and b!1203977 res!800961) b!1203976))

(assert (= (and b!1203976 res!800956) b!1203987))

(assert (= (and b!1203987 res!800962) b!1203971))

(assert (= (and b!1203971 res!800955) b!1203986))

(assert (= (and b!1203986 res!800966) b!1203983))

(assert (= (and b!1203983 (not res!800963)) b!1203969))

(assert (= (and b!1203969 (not res!800957)) b!1203981))

(assert (= (and b!1203981 c!118108) b!1203966))

(assert (= (and b!1203981 (not c!118108)) b!1203975))

(assert (= (or b!1203966 b!1203975) bm!57884))

(assert (= (or b!1203966 b!1203975) bm!57886))

(assert (= (and b!1203981 (not res!800964)) b!1203972))

(assert (= (and b!1203972 (not res!800965)) b!1203990))

(assert (= (and b!1203990 c!118107) b!1203989))

(assert (= (and b!1203990 (not c!118107)) b!1203968))

(assert (= (and b!1203968 c!118106) b!1203970))

(assert (= (and b!1203968 (not c!118106)) b!1203985))

(assert (= (and b!1203985 c!118105) b!1203982))

(assert (= (and b!1203985 (not c!118105)) b!1203978))

(assert (= (or b!1203970 b!1203982) bm!57888))

(assert (= (or b!1203970 b!1203982) bm!57885))

(assert (= (or b!1203970 b!1203982) bm!57882))

(assert (= (or b!1203989 bm!57882) bm!57883))

(assert (= (or b!1203989 bm!57888) bm!57887))

(assert (= (or b!1203989 bm!57885) bm!57889))

(assert (= (and b!1203967 condMapEmpty!47726) mapIsEmpty!47726))

(assert (= (and b!1203967 (not condMapEmpty!47726)) mapNonEmpty!47726))

(get-info :version)

(assert (= (and mapNonEmpty!47726 ((_ is ValueCellFull!14585) mapValue!47726)) b!1203984))

(assert (= (and b!1203967 ((_ is ValueCellFull!14585) mapDefault!47726)) b!1203980))

(assert (= start!100798 b!1203967))

(declare-fun b_lambda!21075 () Bool)

(assert (=> (not b_lambda!21075) (not b!1203969)))

(declare-fun t!39358 () Bool)

(declare-fun tb!10677 () Bool)

(assert (=> (and start!100798 (= defaultEntry!1004 defaultEntry!1004) t!39358) tb!10677))

(declare-fun result!21939 () Bool)

(assert (=> tb!10677 (= result!21939 tp_is_empty!30589)))

(assert (=> b!1203969 t!39358))

(declare-fun b_and!42661 () Bool)

(assert (= b_and!42659 (and (=> t!39358 result!21939) b_and!42661)))

(declare-fun m!1110047 () Bool)

(assert (=> bm!57889 m!1110047))

(declare-fun m!1110049 () Bool)

(assert (=> b!1203983 m!1110049))

(declare-fun m!1110051 () Bool)

(assert (=> b!1203983 m!1110051))

(declare-fun m!1110053 () Bool)

(assert (=> b!1203988 m!1110053))

(declare-fun m!1110055 () Bool)

(assert (=> b!1203971 m!1110055))

(declare-fun m!1110057 () Bool)

(assert (=> b!1203971 m!1110057))

(declare-fun m!1110059 () Bool)

(assert (=> b!1203986 m!1110059))

(declare-fun m!1110061 () Bool)

(assert (=> b!1203981 m!1110061))

(declare-fun m!1110063 () Bool)

(assert (=> b!1203981 m!1110063))

(declare-fun m!1110065 () Bool)

(assert (=> b!1203966 m!1110065))

(declare-fun m!1110067 () Bool)

(assert (=> b!1203976 m!1110067))

(declare-fun m!1110069 () Bool)

(assert (=> bm!57886 m!1110069))

(declare-fun m!1110071 () Bool)

(assert (=> b!1203987 m!1110071))

(declare-fun m!1110073 () Bool)

(assert (=> b!1203973 m!1110073))

(declare-fun m!1110075 () Bool)

(assert (=> b!1203989 m!1110075))

(declare-fun m!1110077 () Bool)

(assert (=> b!1203989 m!1110077))

(declare-fun m!1110079 () Bool)

(assert (=> b!1203989 m!1110079))

(declare-fun m!1110081 () Bool)

(assert (=> b!1203974 m!1110081))

(declare-fun m!1110083 () Bool)

(assert (=> b!1203969 m!1110083))

(declare-fun m!1110085 () Bool)

(assert (=> b!1203969 m!1110085))

(declare-fun m!1110087 () Bool)

(assert (=> b!1203969 m!1110087))

(declare-fun m!1110089 () Bool)

(assert (=> b!1203969 m!1110089))

(declare-fun m!1110091 () Bool)

(assert (=> start!100798 m!1110091))

(declare-fun m!1110093 () Bool)

(assert (=> start!100798 m!1110093))

(declare-fun m!1110095 () Bool)

(assert (=> bm!57884 m!1110095))

(declare-fun m!1110097 () Bool)

(assert (=> mapNonEmpty!47726 m!1110097))

(declare-fun m!1110099 () Bool)

(assert (=> bm!57887 m!1110099))

(declare-fun m!1110101 () Bool)

(assert (=> bm!57883 m!1110101))

(declare-fun m!1110103 () Bool)

(assert (=> b!1203972 m!1110103))

(assert (=> b!1203972 m!1110069))

(check-sat (not b!1203983) (not b!1203974) (not b_next!25885) (not b!1203988) (not bm!57883) (not b!1203969) (not b!1203976) (not bm!57884) (not bm!57889) (not bm!57887) (not start!100798) (not b_lambda!21075) (not b!1203973) (not bm!57886) (not b!1203986) (not b!1203966) (not mapNonEmpty!47726) (not b!1203989) tp_is_empty!30589 (not b!1203972) b_and!42661 (not b!1203971) (not b!1203981))
(check-sat b_and!42661 (not b_next!25885))
