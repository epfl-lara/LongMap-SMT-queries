; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100894 () Bool)

(assert start!100894)

(declare-fun b_free!25969 () Bool)

(declare-fun b_next!25969 () Bool)

(assert (=> start!100894 (= b_free!25969 (not b_next!25969))))

(declare-fun tp!90916 () Bool)

(declare-fun b_and!42957 () Bool)

(assert (=> start!100894 (= tp!90916 b_and!42957)))

(declare-fun res!802948 () Bool)

(declare-fun e!685934 () Bool)

(assert (=> start!100894 (=> (not res!802948) (not e!685934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78042 0))(
  ( (array!78043 (arr!37660 (Array (_ BitVec 32) (_ BitVec 64))) (size!38198 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78042)

(assert (=> start!100894 (= res!802948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38198 _keys!1208))))))

(assert (=> start!100894 e!685934))

(declare-fun tp_is_empty!30673 () Bool)

(assert (=> start!100894 tp_is_empty!30673))

(declare-fun array_inv!28800 (array!78042) Bool)

(assert (=> start!100894 (array_inv!28800 _keys!1208)))

(assert (=> start!100894 true))

(assert (=> start!100894 tp!90916))

(declare-datatypes ((V!46025 0))(
  ( (V!46026 (val!15393 Int)) )
))
(declare-datatypes ((ValueCell!14627 0))(
  ( (ValueCellFull!14627 (v!18040 V!46025)) (EmptyCell!14627) )
))
(declare-datatypes ((array!78044 0))(
  ( (array!78045 (arr!37661 (Array (_ BitVec 32) ValueCell!14627)) (size!38199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78044)

(declare-fun e!685938 () Bool)

(declare-fun array_inv!28801 (array!78044) Bool)

(assert (=> start!100894 (and (array_inv!28801 _values!996) e!685938)))

(declare-fun zeroValue!944 () V!46025)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!59000 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19828 0))(
  ( (tuple2!19829 (_1!9925 (_ BitVec 64)) (_2!9925 V!46025)) )
))
(declare-datatypes ((List!26609 0))(
  ( (Nil!26606) (Cons!26605 (h!27814 tuple2!19828) (t!39549 List!26609)) )
))
(declare-datatypes ((ListLongMap!17797 0))(
  ( (ListLongMap!17798 (toList!8914 List!26609)) )
))
(declare-fun call!59006 () ListLongMap!17797)

(declare-fun minValue!944 () V!46025)

(declare-fun getCurrentListMapNoExtraKeys!5357 (array!78042 array!78044 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 32) Int) ListLongMap!17797)

(assert (=> bm!59000 (= call!59006 (getCurrentListMapNoExtraKeys!5357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207818 () Bool)

(declare-fun call!59009 () Bool)

(assert (=> b!1207818 call!59009))

(declare-datatypes ((Unit!39882 0))(
  ( (Unit!39883) )
))
(declare-fun lt!547974 () Unit!39882)

(declare-fun call!59004 () Unit!39882)

(assert (=> b!1207818 (= lt!547974 call!59004)))

(declare-fun e!685940 () Unit!39882)

(assert (=> b!1207818 (= e!685940 lt!547974)))

(declare-fun b!1207819 () Bool)

(declare-fun e!685937 () Bool)

(declare-fun e!685941 () Bool)

(assert (=> b!1207819 (= e!685937 e!685941)))

(declare-fun res!802949 () Bool)

(assert (=> b!1207819 (=> res!802949 e!685941)))

(declare-fun lt!547960 () ListLongMap!17797)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6915 (ListLongMap!17797 (_ BitVec 64)) Bool)

(assert (=> b!1207819 (= res!802949 (not (contains!6915 lt!547960 k0!934)))))

(assert (=> b!1207819 (= lt!547960 (getCurrentListMapNoExtraKeys!5357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207820 () Bool)

(declare-fun e!685946 () Bool)

(assert (=> b!1207820 (= e!685934 e!685946)))

(declare-fun res!802956 () Bool)

(assert (=> b!1207820 (=> (not res!802956) (not e!685946))))

(declare-fun lt!547961 () array!78042)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78042 (_ BitVec 32)) Bool)

(assert (=> b!1207820 (= res!802956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547961 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207820 (= lt!547961 (array!78043 (store (arr!37660 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38198 _keys!1208)))))

(declare-fun b!1207821 () Bool)

(declare-fun e!685945 () Unit!39882)

(assert (=> b!1207821 (= e!685945 e!685940)))

(declare-fun c!118769 () Bool)

(declare-fun lt!547967 () Bool)

(assert (=> b!1207821 (= c!118769 (and (not lt!547967) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!59001 () Bool)

(declare-fun call!59005 () ListLongMap!17797)

(declare-fun c!118771 () Bool)

(declare-fun +!4041 (ListLongMap!17797 tuple2!19828) ListLongMap!17797)

(assert (=> bm!59001 (= call!59005 (+!4041 lt!547960 (ite (or c!118771 c!118769) (tuple2!19829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207822 () Bool)

(declare-fun e!685947 () Bool)

(assert (=> b!1207822 (= e!685947 tp_is_empty!30673)))

(declare-fun mapNonEmpty!47872 () Bool)

(declare-fun mapRes!47872 () Bool)

(declare-fun tp!90917 () Bool)

(assert (=> mapNonEmpty!47872 (= mapRes!47872 (and tp!90917 e!685947))))

(declare-fun mapKey!47872 () (_ BitVec 32))

(declare-fun mapRest!47872 () (Array (_ BitVec 32) ValueCell!14627))

(declare-fun mapValue!47872 () ValueCell!14627)

(assert (=> mapNonEmpty!47872 (= (arr!37661 _values!996) (store mapRest!47872 mapKey!47872 mapValue!47872))))

(declare-fun b!1207823 () Bool)

(declare-fun e!685935 () Unit!39882)

(declare-fun lt!547962 () Unit!39882)

(assert (=> b!1207823 (= e!685935 lt!547962)))

(assert (=> b!1207823 (= lt!547962 call!59004)))

(assert (=> b!1207823 call!59009))

(declare-fun call!59010 () Bool)

(declare-fun lt!547970 () ListLongMap!17797)

(declare-fun call!59008 () ListLongMap!17797)

(declare-fun bm!59002 () Bool)

(assert (=> bm!59002 (= call!59010 (contains!6915 (ite c!118771 lt!547970 call!59008) k0!934))))

(declare-fun b!1207824 () Bool)

(declare-fun res!802950 () Bool)

(assert (=> b!1207824 (=> (not res!802950) (not e!685934))))

(declare-datatypes ((List!26610 0))(
  ( (Nil!26607) (Cons!26606 (h!27815 (_ BitVec 64)) (t!39550 List!26610)) )
))
(declare-fun arrayNoDuplicates!0 (array!78042 (_ BitVec 32) List!26610) Bool)

(assert (=> b!1207824 (= res!802950 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26607))))

(declare-fun b!1207825 () Bool)

(declare-fun res!802954 () Bool)

(assert (=> b!1207825 (=> (not res!802954) (not e!685934))))

(assert (=> b!1207825 (= res!802954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59003 () Bool)

(declare-fun call!59003 () Unit!39882)

(assert (=> bm!59003 (= call!59004 call!59003)))

(declare-fun b!1207826 () Bool)

(declare-fun res!802962 () Bool)

(assert (=> b!1207826 (=> (not res!802962) (not e!685934))))

(assert (=> b!1207826 (= res!802962 (and (= (size!38199 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38198 _keys!1208) (size!38199 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1207827 () Bool)

(declare-fun e!685933 () Bool)

(assert (=> b!1207827 (= e!685933 tp_is_empty!30673)))

(declare-fun mapIsEmpty!47872 () Bool)

(assert (=> mapIsEmpty!47872 mapRes!47872))

(declare-fun b!1207828 () Bool)

(declare-fun e!685948 () Bool)

(assert (=> b!1207828 (= e!685946 (not e!685948))))

(declare-fun res!802955 () Bool)

(assert (=> b!1207828 (=> res!802955 e!685948)))

(assert (=> b!1207828 (= res!802955 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207828 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547971 () Unit!39882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78042 (_ BitVec 64) (_ BitVec 32)) Unit!39882)

(assert (=> b!1207828 (= lt!547971 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1207829 () Bool)

(declare-fun res!802953 () Bool)

(assert (=> b!1207829 (=> (not res!802953) (not e!685934))))

(assert (=> b!1207829 (= res!802953 (= (select (arr!37660 _keys!1208) i!673) k0!934))))

(declare-fun bm!59004 () Bool)

(assert (=> bm!59004 (= call!59009 call!59010)))

(declare-fun bm!59005 () Bool)

(assert (=> bm!59005 (= call!59008 call!59005)))

(declare-fun b!1207830 () Bool)

(declare-fun res!802957 () Bool)

(assert (=> b!1207830 (=> (not res!802957) (not e!685934))))

(assert (=> b!1207830 (= res!802957 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38198 _keys!1208))))))

(declare-fun b!1207831 () Bool)

(declare-fun e!685942 () Bool)

(assert (=> b!1207831 (= e!685948 e!685942)))

(declare-fun res!802952 () Bool)

(assert (=> b!1207831 (=> res!802952 e!685942)))

(assert (=> b!1207831 (= res!802952 (not (= from!1455 i!673)))))

(declare-fun lt!547968 () ListLongMap!17797)

(declare-fun lt!547972 () array!78044)

(assert (=> b!1207831 (= lt!547968 (getCurrentListMapNoExtraKeys!5357 lt!547961 lt!547972 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3222 (Int (_ BitVec 64)) V!46025)

(assert (=> b!1207831 (= lt!547972 (array!78045 (store (arr!37661 _values!996) i!673 (ValueCellFull!14627 (dynLambda!3222 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38199 _values!996)))))

(declare-fun lt!547964 () ListLongMap!17797)

(assert (=> b!1207831 (= lt!547964 (getCurrentListMapNoExtraKeys!5357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207832 () Bool)

(assert (=> b!1207832 (= e!685942 e!685937)))

(declare-fun res!802959 () Bool)

(assert (=> b!1207832 (=> res!802959 e!685937)))

(assert (=> b!1207832 (= res!802959 (not (= (select (arr!37660 _keys!1208) from!1455) k0!934)))))

(declare-fun e!685936 () Bool)

(assert (=> b!1207832 e!685936))

(declare-fun c!118772 () Bool)

(assert (=> b!1207832 (= c!118772 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547973 () Unit!39882)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 (array!78042 array!78044 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39882)

(assert (=> b!1207832 (= lt!547973 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1043 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207833 () Bool)

(declare-fun call!59007 () ListLongMap!17797)

(assert (=> b!1207833 (= e!685936 (= call!59007 call!59006))))

(declare-fun b!1207834 () Bool)

(declare-fun e!685944 () Bool)

(assert (=> b!1207834 (= e!685944 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547967) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1207835 () Bool)

(declare-fun res!802951 () Bool)

(assert (=> b!1207835 (=> (not res!802951) (not e!685934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207835 (= res!802951 (validKeyInArray!0 k0!934))))

(declare-fun b!1207836 () Bool)

(declare-fun lt!547975 () Unit!39882)

(assert (=> b!1207836 (= e!685945 lt!547975)))

(declare-fun lt!547966 () Unit!39882)

(assert (=> b!1207836 (= lt!547966 call!59003)))

(assert (=> b!1207836 (= lt!547970 call!59005)))

(assert (=> b!1207836 call!59010))

(declare-fun addStillContains!1025 (ListLongMap!17797 (_ BitVec 64) V!46025 (_ BitVec 64)) Unit!39882)

(assert (=> b!1207836 (= lt!547975 (addStillContains!1025 lt!547970 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1207836 (contains!6915 (+!4041 lt!547970 (tuple2!19829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1207837 () Bool)

(declare-fun -!1799 (ListLongMap!17797 (_ BitVec 64)) ListLongMap!17797)

(assert (=> b!1207837 (= e!685936 (= call!59007 (-!1799 call!59006 k0!934)))))

(declare-fun bm!59006 () Bool)

(assert (=> bm!59006 (= call!59003 (addStillContains!1025 lt!547960 (ite (or c!118771 c!118769) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118771 c!118769) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1207838 () Bool)

(assert (=> b!1207838 (= e!685944 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207839 () Bool)

(declare-fun res!802960 () Bool)

(assert (=> b!1207839 (=> (not res!802960) (not e!685946))))

(assert (=> b!1207839 (= res!802960 (arrayNoDuplicates!0 lt!547961 #b00000000000000000000000000000000 Nil!26607))))

(declare-fun b!1207840 () Bool)

(declare-fun Unit!39884 () Unit!39882)

(assert (=> b!1207840 (= e!685935 Unit!39884)))

(declare-fun b!1207841 () Bool)

(assert (=> b!1207841 (= e!685941 (or (bvsge (size!38198 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38198 _keys!1208)) (bvslt from!1455 (size!38198 _keys!1208))))))

(assert (=> b!1207841 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26607)))

(declare-fun lt!547969 () Unit!39882)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78042 (_ BitVec 32) (_ BitVec 32)) Unit!39882)

(assert (=> b!1207841 (= lt!547969 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!685943 () Bool)

(assert (=> b!1207841 e!685943))

(declare-fun res!802961 () Bool)

(assert (=> b!1207841 (=> (not res!802961) (not e!685943))))

(assert (=> b!1207841 (= res!802961 e!685944)))

(declare-fun c!118770 () Bool)

(assert (=> b!1207841 (= c!118770 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547965 () Unit!39882)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!572 (array!78042 array!78044 (_ BitVec 32) (_ BitVec 32) V!46025 V!46025 (_ BitVec 64) (_ BitVec 32) Int) Unit!39882)

(assert (=> b!1207841 (= lt!547965 (lemmaListMapContainsThenArrayContainsFrom!572 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547963 () Unit!39882)

(assert (=> b!1207841 (= lt!547963 e!685945)))

(assert (=> b!1207841 (= c!118771 (and (not lt!547967) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207841 (= lt!547967 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1207842 () Bool)

(declare-fun res!802958 () Bool)

(assert (=> b!1207842 (=> (not res!802958) (not e!685934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207842 (= res!802958 (validMask!0 mask!1564))))

(declare-fun b!1207843 () Bool)

(declare-fun c!118768 () Bool)

(assert (=> b!1207843 (= c!118768 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547967))))

(assert (=> b!1207843 (= e!685940 e!685935)))

(declare-fun b!1207844 () Bool)

(assert (=> b!1207844 (= e!685943 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207845 () Bool)

(assert (=> b!1207845 (= e!685938 (and e!685933 mapRes!47872))))

(declare-fun condMapEmpty!47872 () Bool)

(declare-fun mapDefault!47872 () ValueCell!14627)

(assert (=> b!1207845 (= condMapEmpty!47872 (= (arr!37661 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14627)) mapDefault!47872)))))

(declare-fun bm!59007 () Bool)

(assert (=> bm!59007 (= call!59007 (getCurrentListMapNoExtraKeys!5357 lt!547961 lt!547972 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100894 res!802948) b!1207842))

(assert (= (and b!1207842 res!802958) b!1207826))

(assert (= (and b!1207826 res!802962) b!1207825))

(assert (= (and b!1207825 res!802954) b!1207824))

(assert (= (and b!1207824 res!802950) b!1207830))

(assert (= (and b!1207830 res!802957) b!1207835))

(assert (= (and b!1207835 res!802951) b!1207829))

(assert (= (and b!1207829 res!802953) b!1207820))

(assert (= (and b!1207820 res!802956) b!1207839))

(assert (= (and b!1207839 res!802960) b!1207828))

(assert (= (and b!1207828 (not res!802955)) b!1207831))

(assert (= (and b!1207831 (not res!802952)) b!1207832))

(assert (= (and b!1207832 c!118772) b!1207837))

(assert (= (and b!1207832 (not c!118772)) b!1207833))

(assert (= (or b!1207837 b!1207833) bm!59007))

(assert (= (or b!1207837 b!1207833) bm!59000))

(assert (= (and b!1207832 (not res!802959)) b!1207819))

(assert (= (and b!1207819 (not res!802949)) b!1207841))

(assert (= (and b!1207841 c!118771) b!1207836))

(assert (= (and b!1207841 (not c!118771)) b!1207821))

(assert (= (and b!1207821 c!118769) b!1207818))

(assert (= (and b!1207821 (not c!118769)) b!1207843))

(assert (= (and b!1207843 c!118768) b!1207823))

(assert (= (and b!1207843 (not c!118768)) b!1207840))

(assert (= (or b!1207818 b!1207823) bm!59003))

(assert (= (or b!1207818 b!1207823) bm!59005))

(assert (= (or b!1207818 b!1207823) bm!59004))

(assert (= (or b!1207836 bm!59004) bm!59002))

(assert (= (or b!1207836 bm!59003) bm!59006))

(assert (= (or b!1207836 bm!59005) bm!59001))

(assert (= (and b!1207841 c!118770) b!1207838))

(assert (= (and b!1207841 (not c!118770)) b!1207834))

(assert (= (and b!1207841 res!802961) b!1207844))

(assert (= (and b!1207845 condMapEmpty!47872) mapIsEmpty!47872))

(assert (= (and b!1207845 (not condMapEmpty!47872)) mapNonEmpty!47872))

(get-info :version)

(assert (= (and mapNonEmpty!47872 ((_ is ValueCellFull!14627) mapValue!47872)) b!1207822))

(assert (= (and b!1207845 ((_ is ValueCellFull!14627) mapDefault!47872)) b!1207827))

(assert (= start!100894 b!1207845))

(declare-fun b_lambda!21467 () Bool)

(assert (=> (not b_lambda!21467) (not b!1207831)))

(declare-fun t!39548 () Bool)

(declare-fun tb!10761 () Bool)

(assert (=> (and start!100894 (= defaultEntry!1004 defaultEntry!1004) t!39548) tb!10761))

(declare-fun result!22119 () Bool)

(assert (=> tb!10761 (= result!22119 tp_is_empty!30673)))

(assert (=> b!1207831 t!39548))

(declare-fun b_and!42959 () Bool)

(assert (= b_and!42957 (and (=> t!39548 result!22119) b_and!42959)))

(declare-fun m!1113199 () Bool)

(assert (=> b!1207831 m!1113199))

(declare-fun m!1113201 () Bool)

(assert (=> b!1207831 m!1113201))

(declare-fun m!1113203 () Bool)

(assert (=> b!1207831 m!1113203))

(declare-fun m!1113205 () Bool)

(assert (=> b!1207831 m!1113205))

(declare-fun m!1113207 () Bool)

(assert (=> b!1207828 m!1113207))

(declare-fun m!1113209 () Bool)

(assert (=> b!1207828 m!1113209))

(declare-fun m!1113211 () Bool)

(assert (=> bm!59000 m!1113211))

(declare-fun m!1113213 () Bool)

(assert (=> b!1207835 m!1113213))

(declare-fun m!1113215 () Bool)

(assert (=> bm!59001 m!1113215))

(declare-fun m!1113217 () Bool)

(assert (=> b!1207844 m!1113217))

(declare-fun m!1113219 () Bool)

(assert (=> bm!59006 m!1113219))

(declare-fun m!1113221 () Bool)

(assert (=> b!1207837 m!1113221))

(declare-fun m!1113223 () Bool)

(assert (=> mapNonEmpty!47872 m!1113223))

(declare-fun m!1113225 () Bool)

(assert (=> b!1207824 m!1113225))

(declare-fun m!1113227 () Bool)

(assert (=> bm!59007 m!1113227))

(declare-fun m!1113229 () Bool)

(assert (=> start!100894 m!1113229))

(declare-fun m!1113231 () Bool)

(assert (=> start!100894 m!1113231))

(declare-fun m!1113233 () Bool)

(assert (=> b!1207836 m!1113233))

(declare-fun m!1113235 () Bool)

(assert (=> b!1207836 m!1113235))

(assert (=> b!1207836 m!1113235))

(declare-fun m!1113237 () Bool)

(assert (=> b!1207836 m!1113237))

(declare-fun m!1113239 () Bool)

(assert (=> bm!59002 m!1113239))

(declare-fun m!1113241 () Bool)

(assert (=> b!1207842 m!1113241))

(declare-fun m!1113243 () Bool)

(assert (=> b!1207819 m!1113243))

(assert (=> b!1207819 m!1113211))

(assert (=> b!1207838 m!1113217))

(declare-fun m!1113245 () Bool)

(assert (=> b!1207839 m!1113245))

(declare-fun m!1113247 () Bool)

(assert (=> b!1207841 m!1113247))

(declare-fun m!1113249 () Bool)

(assert (=> b!1207841 m!1113249))

(declare-fun m!1113251 () Bool)

(assert (=> b!1207841 m!1113251))

(declare-fun m!1113253 () Bool)

(assert (=> b!1207832 m!1113253))

(declare-fun m!1113255 () Bool)

(assert (=> b!1207832 m!1113255))

(declare-fun m!1113257 () Bool)

(assert (=> b!1207825 m!1113257))

(declare-fun m!1113259 () Bool)

(assert (=> b!1207829 m!1113259))

(declare-fun m!1113261 () Bool)

(assert (=> b!1207820 m!1113261))

(declare-fun m!1113263 () Bool)

(assert (=> b!1207820 m!1113263))

(check-sat (not b!1207835) (not bm!59002) (not b!1207825) (not b!1207836) (not start!100894) (not bm!59007) (not b!1207824) (not bm!59001) (not b!1207831) (not b!1207820) (not b!1207839) (not b!1207838) (not b!1207819) (not mapNonEmpty!47872) (not b!1207837) b_and!42959 (not b_next!25969) (not b!1207841) (not b_lambda!21467) tp_is_empty!30673 (not bm!59006) (not bm!59000) (not b!1207832) (not b!1207828) (not b!1207842) (not b!1207844))
(check-sat b_and!42959 (not b_next!25969))
