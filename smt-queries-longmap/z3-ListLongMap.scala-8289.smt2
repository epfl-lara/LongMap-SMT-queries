; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101000 () Bool)

(assert start!101000)

(declare-fun b_free!26005 () Bool)

(declare-fun b_next!26005 () Bool)

(assert (=> start!101000 (= b_free!26005 (not b_next!26005))))

(declare-fun tp!91031 () Bool)

(declare-fun b_and!43065 () Bool)

(assert (=> start!101000 (= tp!91031 b_and!43065)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59474 () Bool)

(declare-datatypes ((array!78116 0))(
  ( (array!78117 (arr!37695 (Array (_ BitVec 32) (_ BitVec 64))) (size!38233 (_ BitVec 32))) )
))
(declare-fun lt!549092 () array!78116)

(declare-datatypes ((V!46073 0))(
  ( (V!46074 (val!15411 Int)) )
))
(declare-fun minValue!944 () V!46073)

(declare-datatypes ((ValueCell!14645 0))(
  ( (ValueCellFull!14645 (v!18061 V!46073)) (EmptyCell!14645) )
))
(declare-datatypes ((array!78118 0))(
  ( (array!78119 (arr!37696 (Array (_ BitVec 32) ValueCell!14645)) (size!38234 (_ BitVec 32))) )
))
(declare-fun lt!549089 () array!78118)

(declare-fun zeroValue!944 () V!46073)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19862 0))(
  ( (tuple2!19863 (_1!9942 (_ BitVec 64)) (_2!9942 V!46073)) )
))
(declare-datatypes ((List!26641 0))(
  ( (Nil!26638) (Cons!26637 (h!27846 tuple2!19862) (t!39617 List!26641)) )
))
(declare-datatypes ((ListLongMap!17831 0))(
  ( (ListLongMap!17832 (toList!8931 List!26641)) )
))
(declare-fun call!59478 () ListLongMap!17831)

(declare-fun getCurrentListMapNoExtraKeys!5373 (array!78116 array!78118 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 32) Int) ListLongMap!17831)

(assert (=> bm!59474 (= call!59478 (getCurrentListMapNoExtraKeys!5373 lt!549092 lt!549089 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209814 () Bool)

(declare-fun res!804009 () Bool)

(declare-fun e!687095 () Bool)

(assert (=> b!1209814 (=> (not res!804009) (not e!687095))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!78116)

(assert (=> b!1209814 (= res!804009 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38233 _keys!1208))))))

(declare-fun b!1209815 () Bool)

(declare-fun e!687094 () Bool)

(declare-fun e!687084 () Bool)

(assert (=> b!1209815 (= e!687094 (not e!687084))))

(declare-fun res!804019 () Bool)

(assert (=> b!1209815 (=> res!804019 e!687084)))

(assert (=> b!1209815 (= res!804019 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1209815 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39934 0))(
  ( (Unit!39935) )
))
(declare-fun lt!549077 () Unit!39934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78116 (_ BitVec 64) (_ BitVec 32)) Unit!39934)

(assert (=> b!1209815 (= lt!549077 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun c!119129 () Bool)

(declare-fun lt!549085 () ListLongMap!17831)

(declare-fun c!119131 () Bool)

(declare-fun lt!549088 () ListLongMap!17831)

(declare-fun bm!59475 () Bool)

(declare-fun call!59482 () Unit!39934)

(declare-fun addStillContains!1039 (ListLongMap!17831 (_ BitVec 64) V!46073 (_ BitVec 64)) Unit!39934)

(assert (=> bm!59475 (= call!59482 (addStillContains!1039 (ite c!119131 lt!549088 lt!549085) (ite c!119131 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119129 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119131 minValue!944 (ite c!119129 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209816 () Bool)

(declare-fun res!804014 () Bool)

(assert (=> b!1209816 (=> (not res!804014) (not e!687095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209816 (= res!804014 (validMask!0 mask!1564))))

(declare-fun b!1209817 () Bool)

(declare-fun e!687090 () Unit!39934)

(declare-fun e!687092 () Unit!39934)

(assert (=> b!1209817 (= e!687090 e!687092)))

(declare-fun c!119133 () Bool)

(declare-fun lt!549080 () Bool)

(assert (=> b!1209817 (= c!119133 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549080))))

(declare-fun call!59483 () ListLongMap!17831)

(declare-fun bm!59476 () Bool)

(declare-fun +!4055 (ListLongMap!17831 tuple2!19862) ListLongMap!17831)

(assert (=> bm!59476 (= call!59483 (+!4055 lt!549085 (ite (or c!119131 c!119129) (tuple2!19863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1209818 () Bool)

(declare-fun e!687089 () Bool)

(declare-fun e!687087 () Bool)

(assert (=> b!1209818 (= e!687089 e!687087)))

(declare-fun res!804020 () Bool)

(assert (=> b!1209818 (=> res!804020 e!687087)))

(assert (=> b!1209818 (= res!804020 (not (= (select (arr!37695 _keys!1208) from!1455) k0!934)))))

(declare-fun e!687085 () Bool)

(assert (=> b!1209818 e!687085))

(declare-fun c!119132 () Bool)

(assert (=> b!1209818 (= c!119132 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549086 () Unit!39934)

(declare-fun _values!996 () array!78118)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1054 (array!78116 array!78118 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39934)

(assert (=> b!1209818 (= lt!549086 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1054 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209819 () Bool)

(declare-fun res!804021 () Bool)

(assert (=> b!1209819 (=> (not res!804021) (not e!687095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78116 (_ BitVec 32)) Bool)

(assert (=> b!1209819 (= res!804021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1209820 () Bool)

(declare-fun Unit!39936 () Unit!39934)

(assert (=> b!1209820 (= e!687092 Unit!39936)))

(declare-fun b!1209821 () Bool)

(assert (=> b!1209821 (= c!119129 (and (not lt!549080) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687097 () Unit!39934)

(assert (=> b!1209821 (= e!687097 e!687090)))

(declare-fun b!1209822 () Bool)

(declare-fun e!687093 () Bool)

(assert (=> b!1209822 (= e!687093 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun res!804008 () Bool)

(assert (=> start!101000 (=> (not res!804008) (not e!687095))))

(assert (=> start!101000 (= res!804008 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38233 _keys!1208))))))

(assert (=> start!101000 e!687095))

(declare-fun tp_is_empty!30709 () Bool)

(assert (=> start!101000 tp_is_empty!30709))

(declare-fun array_inv!28822 (array!78116) Bool)

(assert (=> start!101000 (array_inv!28822 _keys!1208)))

(assert (=> start!101000 true))

(assert (=> start!101000 tp!91031))

(declare-fun e!687086 () Bool)

(declare-fun array_inv!28823 (array!78118) Bool)

(assert (=> start!101000 (and (array_inv!28823 _values!996) e!687086)))

(declare-fun b!1209823 () Bool)

(declare-fun res!804018 () Bool)

(assert (=> b!1209823 (=> (not res!804018) (not e!687095))))

(assert (=> b!1209823 (= res!804018 (and (= (size!38234 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38233 _keys!1208) (size!38234 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1209824 () Bool)

(declare-fun res!804016 () Bool)

(assert (=> b!1209824 (=> (not res!804016) (not e!687095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209824 (= res!804016 (validKeyInArray!0 k0!934))))

(declare-fun b!1209825 () Bool)

(assert (=> b!1209825 (= e!687095 e!687094)))

(declare-fun res!804012 () Bool)

(assert (=> b!1209825 (=> (not res!804012) (not e!687094))))

(assert (=> b!1209825 (= res!804012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549092 mask!1564))))

(assert (=> b!1209825 (= lt!549092 (array!78117 (store (arr!37695 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38233 _keys!1208)))))

(declare-fun b!1209826 () Bool)

(declare-fun e!687091 () Bool)

(assert (=> b!1209826 (= e!687091 tp_is_empty!30709)))

(declare-fun e!687099 () Bool)

(declare-fun b!1209827 () Bool)

(assert (=> b!1209827 (= e!687099 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209828 () Bool)

(declare-fun call!59481 () Bool)

(assert (=> b!1209828 call!59481))

(declare-fun lt!549094 () Unit!39934)

(declare-fun call!59484 () Unit!39934)

(assert (=> b!1209828 (= lt!549094 call!59484)))

(assert (=> b!1209828 (= e!687092 lt!549094)))

(declare-fun b!1209829 () Bool)

(declare-fun e!687098 () Unit!39934)

(declare-fun Unit!39937 () Unit!39934)

(assert (=> b!1209829 (= e!687098 Unit!39937)))

(assert (=> b!1209829 (= lt!549080 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1209829 (= c!119131 (and (not lt!549080) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!549078 () Unit!39934)

(assert (=> b!1209829 (= lt!549078 e!687097)))

(declare-fun lt!549084 () Unit!39934)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!582 (array!78116 array!78118 (_ BitVec 32) (_ BitVec 32) V!46073 V!46073 (_ BitVec 64) (_ BitVec 32) Int) Unit!39934)

(assert (=> b!1209829 (= lt!549084 (lemmaListMapContainsThenArrayContainsFrom!582 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119130 () Bool)

(assert (=> b!1209829 (= c!119130 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804013 () Bool)

(assert (=> b!1209829 (= res!804013 e!687099)))

(assert (=> b!1209829 (=> (not res!804013) (not e!687093))))

(assert (=> b!1209829 e!687093))

(declare-fun lt!549087 () Unit!39934)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78116 (_ BitVec 32) (_ BitVec 32)) Unit!39934)

(assert (=> b!1209829 (= lt!549087 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26642 0))(
  ( (Nil!26639) (Cons!26638 (h!27847 (_ BitVec 64)) (t!39618 List!26642)) )
))
(declare-fun arrayNoDuplicates!0 (array!78116 (_ BitVec 32) List!26642) Bool)

(assert (=> b!1209829 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26639)))

(declare-fun lt!549083 () Unit!39934)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78116 (_ BitVec 64) (_ BitVec 32) List!26642) Unit!39934)

(assert (=> b!1209829 (= lt!549083 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26639))))

(assert (=> b!1209829 false))

(declare-fun b!1209830 () Bool)

(assert (=> b!1209830 (= e!687099 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549080) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1209831 () Bool)

(declare-fun res!804015 () Bool)

(assert (=> b!1209831 (=> (not res!804015) (not e!687094))))

(assert (=> b!1209831 (= res!804015 (arrayNoDuplicates!0 lt!549092 #b00000000000000000000000000000000 Nil!26639))))

(declare-fun b!1209832 () Bool)

(declare-fun res!804010 () Bool)

(assert (=> b!1209832 (=> (not res!804010) (not e!687095))))

(assert (=> b!1209832 (= res!804010 (= (select (arr!37695 _keys!1208) i!673) k0!934))))

(declare-fun b!1209833 () Bool)

(declare-fun call!59477 () ListLongMap!17831)

(assert (=> b!1209833 (= e!687085 (= call!59478 call!59477))))

(declare-fun b!1209834 () Bool)

(declare-fun lt!549090 () Unit!39934)

(assert (=> b!1209834 (= e!687090 lt!549090)))

(assert (=> b!1209834 (= lt!549090 call!59484)))

(assert (=> b!1209834 call!59481))

(declare-fun bm!59477 () Bool)

(assert (=> bm!59477 (= call!59484 call!59482)))

(declare-fun bm!59478 () Bool)

(assert (=> bm!59478 (= call!59477 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209835 () Bool)

(assert (=> b!1209835 (= e!687087 (bvslt from!1455 (size!38233 _keys!1208)))))

(declare-fun lt!549081 () Unit!39934)

(assert (=> b!1209835 (= lt!549081 e!687098)))

(declare-fun c!119128 () Bool)

(declare-fun contains!6939 (ListLongMap!17831 (_ BitVec 64)) Bool)

(assert (=> b!1209835 (= c!119128 (contains!6939 lt!549085 k0!934))))

(assert (=> b!1209835 (= lt!549085 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59479 () Bool)

(declare-fun call!59479 () Bool)

(assert (=> bm!59479 (= call!59481 call!59479)))

(declare-fun b!1209836 () Bool)

(declare-fun e!687096 () Bool)

(declare-fun mapRes!47932 () Bool)

(assert (=> b!1209836 (= e!687086 (and e!687096 mapRes!47932))))

(declare-fun condMapEmpty!47932 () Bool)

(declare-fun mapDefault!47932 () ValueCell!14645)

(assert (=> b!1209836 (= condMapEmpty!47932 (= (arr!37696 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14645)) mapDefault!47932)))))

(declare-fun b!1209837 () Bool)

(assert (=> b!1209837 (= e!687084 e!687089)))

(declare-fun res!804011 () Bool)

(assert (=> b!1209837 (=> res!804011 e!687089)))

(assert (=> b!1209837 (= res!804011 (not (= from!1455 i!673)))))

(declare-fun lt!549093 () ListLongMap!17831)

(assert (=> b!1209837 (= lt!549093 (getCurrentListMapNoExtraKeys!5373 lt!549092 lt!549089 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3235 (Int (_ BitVec 64)) V!46073)

(assert (=> b!1209837 (= lt!549089 (array!78119 (store (arr!37696 _values!996) i!673 (ValueCellFull!14645 (dynLambda!3235 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38234 _values!996)))))

(declare-fun lt!549082 () ListLongMap!17831)

(assert (=> b!1209837 (= lt!549082 (getCurrentListMapNoExtraKeys!5373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59480 () Bool)

(declare-fun call!59480 () ListLongMap!17831)

(assert (=> bm!59480 (= call!59479 (contains!6939 (ite c!119131 lt!549088 call!59480) k0!934))))

(declare-fun b!1209838 () Bool)

(assert (=> b!1209838 (= e!687096 tp_is_empty!30709)))

(declare-fun mapIsEmpty!47932 () Bool)

(assert (=> mapIsEmpty!47932 mapRes!47932))

(declare-fun b!1209839 () Bool)

(declare-fun -!1811 (ListLongMap!17831 (_ BitVec 64)) ListLongMap!17831)

(assert (=> b!1209839 (= e!687085 (= call!59478 (-!1811 call!59477 k0!934)))))

(declare-fun b!1209840 () Bool)

(declare-fun Unit!39938 () Unit!39934)

(assert (=> b!1209840 (= e!687098 Unit!39938)))

(declare-fun mapNonEmpty!47932 () Bool)

(declare-fun tp!91030 () Bool)

(assert (=> mapNonEmpty!47932 (= mapRes!47932 (and tp!91030 e!687091))))

(declare-fun mapValue!47932 () ValueCell!14645)

(declare-fun mapKey!47932 () (_ BitVec 32))

(declare-fun mapRest!47932 () (Array (_ BitVec 32) ValueCell!14645))

(assert (=> mapNonEmpty!47932 (= (arr!37696 _values!996) (store mapRest!47932 mapKey!47932 mapValue!47932))))

(declare-fun b!1209841 () Bool)

(assert (=> b!1209841 (contains!6939 (+!4055 lt!549088 (tuple2!19863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!549079 () Unit!39934)

(assert (=> b!1209841 (= lt!549079 call!59482)))

(assert (=> b!1209841 call!59479))

(assert (=> b!1209841 (= lt!549088 call!59483)))

(declare-fun lt!549091 () Unit!39934)

(assert (=> b!1209841 (= lt!549091 (addStillContains!1039 lt!549085 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1209841 (= e!687097 lt!549079)))

(declare-fun b!1209842 () Bool)

(declare-fun res!804017 () Bool)

(assert (=> b!1209842 (=> (not res!804017) (not e!687095))))

(assert (=> b!1209842 (= res!804017 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26639))))

(declare-fun bm!59481 () Bool)

(assert (=> bm!59481 (= call!59480 call!59483)))

(assert (= (and start!101000 res!804008) b!1209816))

(assert (= (and b!1209816 res!804014) b!1209823))

(assert (= (and b!1209823 res!804018) b!1209819))

(assert (= (and b!1209819 res!804021) b!1209842))

(assert (= (and b!1209842 res!804017) b!1209814))

(assert (= (and b!1209814 res!804009) b!1209824))

(assert (= (and b!1209824 res!804016) b!1209832))

(assert (= (and b!1209832 res!804010) b!1209825))

(assert (= (and b!1209825 res!804012) b!1209831))

(assert (= (and b!1209831 res!804015) b!1209815))

(assert (= (and b!1209815 (not res!804019)) b!1209837))

(assert (= (and b!1209837 (not res!804011)) b!1209818))

(assert (= (and b!1209818 c!119132) b!1209839))

(assert (= (and b!1209818 (not c!119132)) b!1209833))

(assert (= (or b!1209839 b!1209833) bm!59474))

(assert (= (or b!1209839 b!1209833) bm!59478))

(assert (= (and b!1209818 (not res!804020)) b!1209835))

(assert (= (and b!1209835 c!119128) b!1209829))

(assert (= (and b!1209835 (not c!119128)) b!1209840))

(assert (= (and b!1209829 c!119131) b!1209841))

(assert (= (and b!1209829 (not c!119131)) b!1209821))

(assert (= (and b!1209821 c!119129) b!1209834))

(assert (= (and b!1209821 (not c!119129)) b!1209817))

(assert (= (and b!1209817 c!119133) b!1209828))

(assert (= (and b!1209817 (not c!119133)) b!1209820))

(assert (= (or b!1209834 b!1209828) bm!59477))

(assert (= (or b!1209834 b!1209828) bm!59481))

(assert (= (or b!1209834 b!1209828) bm!59479))

(assert (= (or b!1209841 bm!59479) bm!59480))

(assert (= (or b!1209841 bm!59477) bm!59475))

(assert (= (or b!1209841 bm!59481) bm!59476))

(assert (= (and b!1209829 c!119130) b!1209827))

(assert (= (and b!1209829 (not c!119130)) b!1209830))

(assert (= (and b!1209829 res!804013) b!1209822))

(assert (= (and b!1209836 condMapEmpty!47932) mapIsEmpty!47932))

(assert (= (and b!1209836 (not condMapEmpty!47932)) mapNonEmpty!47932))

(get-info :version)

(assert (= (and mapNonEmpty!47932 ((_ is ValueCellFull!14645) mapValue!47932)) b!1209826))

(assert (= (and b!1209836 ((_ is ValueCellFull!14645) mapDefault!47932)) b!1209838))

(assert (= start!101000 b!1209836))

(declare-fun b_lambda!21579 () Bool)

(assert (=> (not b_lambda!21579) (not b!1209837)))

(declare-fun t!39616 () Bool)

(declare-fun tb!10797 () Bool)

(assert (=> (and start!101000 (= defaultEntry!1004 defaultEntry!1004) t!39616) tb!10797))

(declare-fun result!22195 () Bool)

(assert (=> tb!10797 (= result!22195 tp_is_empty!30709)))

(assert (=> b!1209837 t!39616))

(declare-fun b_and!43067 () Bool)

(assert (= b_and!43065 (and (=> t!39616 result!22195) b_and!43067)))

(declare-fun m!1114933 () Bool)

(assert (=> b!1209829 m!1114933))

(declare-fun m!1114935 () Bool)

(assert (=> b!1209829 m!1114935))

(declare-fun m!1114937 () Bool)

(assert (=> b!1209829 m!1114937))

(declare-fun m!1114939 () Bool)

(assert (=> b!1209829 m!1114939))

(declare-fun m!1114941 () Bool)

(assert (=> b!1209824 m!1114941))

(declare-fun m!1114943 () Bool)

(assert (=> b!1209835 m!1114943))

(declare-fun m!1114945 () Bool)

(assert (=> b!1209835 m!1114945))

(declare-fun m!1114947 () Bool)

(assert (=> b!1209816 m!1114947))

(declare-fun m!1114949 () Bool)

(assert (=> b!1209831 m!1114949))

(declare-fun m!1114951 () Bool)

(assert (=> start!101000 m!1114951))

(declare-fun m!1114953 () Bool)

(assert (=> start!101000 m!1114953))

(declare-fun m!1114955 () Bool)

(assert (=> b!1209827 m!1114955))

(declare-fun m!1114957 () Bool)

(assert (=> bm!59476 m!1114957))

(declare-fun m!1114959 () Bool)

(assert (=> b!1209832 m!1114959))

(declare-fun m!1114961 () Bool)

(assert (=> bm!59480 m!1114961))

(assert (=> b!1209822 m!1114955))

(declare-fun m!1114963 () Bool)

(assert (=> b!1209841 m!1114963))

(assert (=> b!1209841 m!1114963))

(declare-fun m!1114965 () Bool)

(assert (=> b!1209841 m!1114965))

(declare-fun m!1114967 () Bool)

(assert (=> b!1209841 m!1114967))

(declare-fun m!1114969 () Bool)

(assert (=> b!1209839 m!1114969))

(declare-fun m!1114971 () Bool)

(assert (=> b!1209842 m!1114971))

(declare-fun m!1114973 () Bool)

(assert (=> bm!59475 m!1114973))

(declare-fun m!1114975 () Bool)

(assert (=> bm!59474 m!1114975))

(declare-fun m!1114977 () Bool)

(assert (=> b!1209815 m!1114977))

(declare-fun m!1114979 () Bool)

(assert (=> b!1209815 m!1114979))

(declare-fun m!1114981 () Bool)

(assert (=> b!1209819 m!1114981))

(declare-fun m!1114983 () Bool)

(assert (=> mapNonEmpty!47932 m!1114983))

(declare-fun m!1114985 () Bool)

(assert (=> b!1209825 m!1114985))

(declare-fun m!1114987 () Bool)

(assert (=> b!1209825 m!1114987))

(declare-fun m!1114989 () Bool)

(assert (=> b!1209818 m!1114989))

(declare-fun m!1114991 () Bool)

(assert (=> b!1209818 m!1114991))

(declare-fun m!1114993 () Bool)

(assert (=> b!1209837 m!1114993))

(declare-fun m!1114995 () Bool)

(assert (=> b!1209837 m!1114995))

(declare-fun m!1114997 () Bool)

(assert (=> b!1209837 m!1114997))

(declare-fun m!1114999 () Bool)

(assert (=> b!1209837 m!1114999))

(assert (=> bm!59478 m!1114945))

(check-sat (not b!1209815) (not bm!59478) (not b!1209819) (not b!1209822) (not b!1209837) (not b_next!26005) (not b!1209824) (not start!101000) b_and!43067 (not b!1209827) (not b!1209818) (not b!1209831) (not b!1209816) (not bm!59476) (not b!1209842) (not bm!59480) (not bm!59475) (not b!1209841) (not bm!59474) (not b!1209839) (not b_lambda!21579) (not mapNonEmpty!47932) tp_is_empty!30709 (not b!1209829) (not b!1209825) (not b!1209835))
(check-sat b_and!43067 (not b_next!26005))
