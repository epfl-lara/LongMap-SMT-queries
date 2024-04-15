; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101080 () Bool)

(assert start!101080)

(declare-fun b_free!26047 () Bool)

(declare-fun b_next!26047 () Bool)

(assert (=> start!101080 (= b_free!26047 (not b_next!26047))))

(declare-fun tp!91159 () Bool)

(declare-fun b_and!43167 () Bool)

(assert (=> start!101080 (= tp!91159 b_and!43167)))

(declare-fun b!1211879 () Bool)

(declare-datatypes ((Unit!40023 0))(
  ( (Unit!40024) )
))
(declare-fun e!688241 () Unit!40023)

(declare-fun Unit!40025 () Unit!40023)

(assert (=> b!1211879 (= e!688241 Unit!40025)))

(declare-fun lt!550473 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211879 (= lt!550473 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!119556 () Bool)

(assert (=> b!1211879 (= c!119556 (and (not lt!550473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550477 () Unit!40023)

(declare-fun e!688237 () Unit!40023)

(assert (=> b!1211879 (= lt!550477 e!688237)))

(declare-datatypes ((V!46129 0))(
  ( (V!46130 (val!15432 Int)) )
))
(declare-fun zeroValue!944 () V!46129)

(declare-datatypes ((array!78202 0))(
  ( (array!78203 (arr!37737 (Array (_ BitVec 32) (_ BitVec 64))) (size!38275 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78202)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!550463 () Unit!40023)

(declare-fun minValue!944 () V!46129)

(declare-datatypes ((ValueCell!14666 0))(
  ( (ValueCellFull!14666 (v!18083 V!46129)) (EmptyCell!14666) )
))
(declare-datatypes ((array!78204 0))(
  ( (array!78205 (arr!37738 (Array (_ BitVec 32) ValueCell!14666)) (size!38276 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78204)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!598 (array!78202 array!78204 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 64) (_ BitVec 32) Int) Unit!40023)

(assert (=> b!1211879 (= lt!550463 (lemmaListMapContainsThenArrayContainsFrom!598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119555 () Bool)

(assert (=> b!1211879 (= c!119555 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804985 () Bool)

(declare-fun e!688239 () Bool)

(assert (=> b!1211879 (= res!804985 e!688239)))

(declare-fun e!688231 () Bool)

(assert (=> b!1211879 (=> (not res!804985) (not e!688231))))

(assert (=> b!1211879 e!688231))

(declare-fun lt!550458 () Unit!40023)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78202 (_ BitVec 32) (_ BitVec 32)) Unit!40023)

(assert (=> b!1211879 (= lt!550458 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26681 0))(
  ( (Nil!26678) (Cons!26677 (h!27886 (_ BitVec 64)) (t!39699 List!26681)) )
))
(declare-fun arrayNoDuplicates!0 (array!78202 (_ BitVec 32) List!26681) Bool)

(assert (=> b!1211879 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26678)))

(declare-fun lt!550460 () Unit!40023)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78202 (_ BitVec 64) (_ BitVec 32) List!26681) Unit!40023)

(assert (=> b!1211879 (= lt!550460 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26678))))

(assert (=> b!1211879 false))

(declare-fun b!1211880 () Bool)

(declare-fun res!804990 () Bool)

(declare-fun e!688228 () Bool)

(assert (=> b!1211880 (=> (not res!804990) (not e!688228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211880 (= res!804990 (validMask!0 mask!1564))))

(declare-fun bm!59999 () Bool)

(declare-datatypes ((tuple2!19902 0))(
  ( (tuple2!19903 (_1!9962 (_ BitVec 64)) (_2!9962 V!46129)) )
))
(declare-datatypes ((List!26682 0))(
  ( (Nil!26679) (Cons!26678 (h!27887 tuple2!19902) (t!39700 List!26682)) )
))
(declare-datatypes ((ListLongMap!17871 0))(
  ( (ListLongMap!17872 (toList!8951 List!26682)) )
))
(declare-fun call!60006 () ListLongMap!17871)

(declare-fun call!60009 () ListLongMap!17871)

(assert (=> bm!59999 (= call!60006 call!60009)))

(declare-fun b!1211881 () Bool)

(declare-fun e!688230 () Unit!40023)

(declare-fun e!688227 () Unit!40023)

(assert (=> b!1211881 (= e!688230 e!688227)))

(declare-fun c!119553 () Bool)

(assert (=> b!1211881 (= c!119553 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550473))))

(declare-fun b!1211882 () Bool)

(declare-fun arrayContainsKey!0 (array!78202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211882 (= e!688239 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60005 () ListLongMap!17871)

(declare-fun bm!60000 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5393 (array!78202 array!78204 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 32) Int) ListLongMap!17871)

(assert (=> bm!60000 (= call!60005 (getCurrentListMapNoExtraKeys!5393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211883 () Bool)

(declare-fun res!804994 () Bool)

(declare-fun e!688232 () Bool)

(assert (=> b!1211883 (=> (not res!804994) (not e!688232))))

(declare-fun lt!550475 () array!78202)

(assert (=> b!1211883 (= res!804994 (arrayNoDuplicates!0 lt!550475 #b00000000000000000000000000000000 Nil!26678))))

(declare-fun mapIsEmpty!47998 () Bool)

(declare-fun mapRes!47998 () Bool)

(assert (=> mapIsEmpty!47998 mapRes!47998))

(declare-fun bm!60001 () Bool)

(declare-fun call!60003 () ListLongMap!17871)

(declare-fun lt!550471 () array!78204)

(assert (=> bm!60001 (= call!60003 (getCurrentListMapNoExtraKeys!5393 lt!550475 lt!550471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211884 () Bool)

(declare-fun res!804991 () Bool)

(assert (=> b!1211884 (=> (not res!804991) (not e!688228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211884 (= res!804991 (validKeyInArray!0 k0!934))))

(declare-fun b!1211885 () Bool)

(declare-fun res!804989 () Bool)

(assert (=> b!1211885 (=> (not res!804989) (not e!688228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78202 (_ BitVec 32)) Bool)

(assert (=> b!1211885 (= res!804989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211886 () Bool)

(declare-fun call!60004 () Bool)

(assert (=> b!1211886 call!60004))

(declare-fun lt!550467 () Unit!40023)

(declare-fun call!60002 () Unit!40023)

(assert (=> b!1211886 (= lt!550467 call!60002)))

(assert (=> b!1211886 (= e!688227 lt!550467)))

(declare-fun b!1211887 () Bool)

(declare-fun lt!550474 () ListLongMap!17871)

(declare-fun contains!6958 (ListLongMap!17871 (_ BitVec 64)) Bool)

(declare-fun +!4072 (ListLongMap!17871 tuple2!19902) ListLongMap!17871)

(assert (=> b!1211887 (contains!6958 (+!4072 lt!550474 (tuple2!19903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550459 () Unit!40023)

(declare-fun addStillContains!1057 (ListLongMap!17871 (_ BitVec 64) V!46129 (_ BitVec 64)) Unit!40023)

(assert (=> b!1211887 (= lt!550459 (addStillContains!1057 lt!550474 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!60008 () Bool)

(assert (=> b!1211887 call!60008))

(assert (=> b!1211887 (= lt!550474 call!60009)))

(declare-fun lt!550462 () Unit!40023)

(declare-fun call!60007 () Unit!40023)

(assert (=> b!1211887 (= lt!550462 call!60007)))

(assert (=> b!1211887 (= e!688237 lt!550459)))

(declare-fun b!1211888 () Bool)

(declare-fun e!688234 () Bool)

(declare-fun e!688229 () Bool)

(assert (=> b!1211888 (= e!688234 e!688229)))

(declare-fun res!804995 () Bool)

(assert (=> b!1211888 (=> res!804995 e!688229)))

(assert (=> b!1211888 (= res!804995 (not (= (select (arr!37737 _keys!1208) from!1455) k0!934)))))

(declare-fun e!688236 () Bool)

(assert (=> b!1211888 e!688236))

(declare-fun c!119558 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211888 (= c!119558 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550476 () Unit!40023)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1068 (array!78202 array!78204 (_ BitVec 32) (_ BitVec 32) V!46129 V!46129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40023)

(assert (=> b!1211888 (= lt!550476 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1068 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211889 () Bool)

(declare-fun res!804993 () Bool)

(assert (=> b!1211889 (=> (not res!804993) (not e!688228))))

(assert (=> b!1211889 (= res!804993 (= (select (arr!37737 _keys!1208) i!673) k0!934))))

(declare-fun b!1211890 () Bool)

(assert (=> b!1211890 (= e!688228 e!688232)))

(declare-fun res!804987 () Bool)

(assert (=> b!1211890 (=> (not res!804987) (not e!688232))))

(assert (=> b!1211890 (= res!804987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550475 mask!1564))))

(assert (=> b!1211890 (= lt!550475 (array!78203 (store (arr!37737 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38275 _keys!1208)))))

(declare-fun b!1211891 () Bool)

(declare-fun c!119557 () Bool)

(assert (=> b!1211891 (= c!119557 (and (not lt!550473) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1211891 (= e!688237 e!688230)))

(declare-fun b!1211892 () Bool)

(declare-fun res!804986 () Bool)

(assert (=> b!1211892 (=> (not res!804986) (not e!688228))))

(assert (=> b!1211892 (= res!804986 (and (= (size!38276 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38275 _keys!1208) (size!38276 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47998 () Bool)

(declare-fun tp!91160 () Bool)

(declare-fun e!688242 () Bool)

(assert (=> mapNonEmpty!47998 (= mapRes!47998 (and tp!91160 e!688242))))

(declare-fun mapKey!47998 () (_ BitVec 32))

(declare-fun mapValue!47998 () ValueCell!14666)

(declare-fun mapRest!47998 () (Array (_ BitVec 32) ValueCell!14666))

(assert (=> mapNonEmpty!47998 (= (arr!37738 _values!996) (store mapRest!47998 mapKey!47998 mapValue!47998))))

(declare-fun b!1211893 () Bool)

(declare-fun res!804992 () Bool)

(assert (=> b!1211893 (=> (not res!804992) (not e!688228))))

(assert (=> b!1211893 (= res!804992 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38275 _keys!1208))))))

(declare-fun b!1211894 () Bool)

(assert (=> b!1211894 (= e!688236 (= call!60003 call!60005))))

(declare-fun bm!60002 () Bool)

(assert (=> bm!60002 (= call!60004 call!60008)))

(declare-fun b!1211895 () Bool)

(assert (=> b!1211895 (= e!688231 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!60003 () Bool)

(assert (=> bm!60003 (= call!60008 (contains!6958 (ite c!119556 lt!550474 call!60006) k0!934))))

(declare-fun bm!60004 () Bool)

(declare-fun lt!550465 () ListLongMap!17871)

(assert (=> bm!60004 (= call!60007 (addStillContains!1057 lt!550465 (ite (or c!119556 c!119557) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119556 c!119557) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1211896 () Bool)

(declare-fun -!1829 (ListLongMap!17871 (_ BitVec 64)) ListLongMap!17871)

(assert (=> b!1211896 (= e!688236 (= call!60003 (-!1829 call!60005 k0!934)))))

(declare-fun b!1211897 () Bool)

(declare-fun tp_is_empty!30751 () Bool)

(assert (=> b!1211897 (= e!688242 tp_is_empty!30751)))

(declare-fun b!1211898 () Bool)

(declare-fun Unit!40026 () Unit!40023)

(assert (=> b!1211898 (= e!688227 Unit!40026)))

(declare-fun res!804996 () Bool)

(assert (=> start!101080 (=> (not res!804996) (not e!688228))))

(assert (=> start!101080 (= res!804996 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38275 _keys!1208))))))

(assert (=> start!101080 e!688228))

(assert (=> start!101080 tp_is_empty!30751))

(declare-fun array_inv!28850 (array!78202) Bool)

(assert (=> start!101080 (array_inv!28850 _keys!1208)))

(assert (=> start!101080 true))

(assert (=> start!101080 tp!91159))

(declare-fun e!688235 () Bool)

(declare-fun array_inv!28851 (array!78204) Bool)

(assert (=> start!101080 (and (array_inv!28851 _values!996) e!688235)))

(declare-fun b!1211899 () Bool)

(declare-fun e!688243 () Bool)

(assert (=> b!1211899 (= e!688232 (not e!688243))))

(declare-fun res!804997 () Bool)

(assert (=> b!1211899 (=> res!804997 e!688243)))

(assert (=> b!1211899 (= res!804997 (bvsgt from!1455 i!673))))

(assert (=> b!1211899 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550464 () Unit!40023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78202 (_ BitVec 64) (_ BitVec 32)) Unit!40023)

(assert (=> b!1211899 (= lt!550464 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!60005 () Bool)

(assert (=> bm!60005 (= call!60009 (+!4072 lt!550465 (ite (or c!119556 c!119557) (tuple2!19903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1211900 () Bool)

(declare-fun e!688238 () Bool)

(declare-fun lt!550461 () ListLongMap!17871)

(assert (=> b!1211900 (= e!688238 (= lt!550461 (getCurrentListMapNoExtraKeys!5393 lt!550475 lt!550471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1211901 () Bool)

(declare-fun lt!550470 () Unit!40023)

(assert (=> b!1211901 (= e!688230 lt!550470)))

(assert (=> b!1211901 (= lt!550470 call!60002)))

(assert (=> b!1211901 call!60004))

(declare-fun b!1211902 () Bool)

(assert (=> b!1211902 (= e!688229 true)))

(assert (=> b!1211902 e!688238))

(declare-fun res!804988 () Bool)

(assert (=> b!1211902 (=> (not res!804988) (not e!688238))))

(assert (=> b!1211902 (= res!804988 (= lt!550461 lt!550465))))

(declare-fun lt!550457 () ListLongMap!17871)

(assert (=> b!1211902 (= lt!550461 (-!1829 lt!550457 k0!934))))

(declare-fun lt!550469 () V!46129)

(assert (=> b!1211902 (= (-!1829 (+!4072 lt!550465 (tuple2!19903 (select (arr!37737 _keys!1208) from!1455) lt!550469)) (select (arr!37737 _keys!1208) from!1455)) lt!550465)))

(declare-fun lt!550466 () Unit!40023)

(declare-fun addThenRemoveForNewKeyIsSame!265 (ListLongMap!17871 (_ BitVec 64) V!46129) Unit!40023)

(assert (=> b!1211902 (= lt!550466 (addThenRemoveForNewKeyIsSame!265 lt!550465 (select (arr!37737 _keys!1208) from!1455) lt!550469))))

(declare-fun lt!550472 () V!46129)

(declare-fun get!19250 (ValueCell!14666 V!46129) V!46129)

(assert (=> b!1211902 (= lt!550469 (get!19250 (select (arr!37738 _values!996) from!1455) lt!550472))))

(declare-fun lt!550478 () Unit!40023)

(assert (=> b!1211902 (= lt!550478 e!688241)))

(declare-fun c!119554 () Bool)

(assert (=> b!1211902 (= c!119554 (contains!6958 lt!550465 k0!934))))

(assert (=> b!1211902 (= lt!550465 (getCurrentListMapNoExtraKeys!5393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211903 () Bool)

(assert (=> b!1211903 (= e!688243 e!688234)))

(declare-fun res!804984 () Bool)

(assert (=> b!1211903 (=> res!804984 e!688234)))

(assert (=> b!1211903 (= res!804984 (not (= from!1455 i!673)))))

(declare-fun lt!550468 () ListLongMap!17871)

(assert (=> b!1211903 (= lt!550468 (getCurrentListMapNoExtraKeys!5393 lt!550475 lt!550471 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1211903 (= lt!550471 (array!78205 (store (arr!37738 _values!996) i!673 (ValueCellFull!14666 lt!550472)) (size!38276 _values!996)))))

(declare-fun dynLambda!3250 (Int (_ BitVec 64)) V!46129)

(assert (=> b!1211903 (= lt!550472 (dynLambda!3250 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1211903 (= lt!550457 (getCurrentListMapNoExtraKeys!5393 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1211904 () Bool)

(declare-fun Unit!40027 () Unit!40023)

(assert (=> b!1211904 (= e!688241 Unit!40027)))

(declare-fun b!1211905 () Bool)

(declare-fun res!804983 () Bool)

(assert (=> b!1211905 (=> (not res!804983) (not e!688228))))

(assert (=> b!1211905 (= res!804983 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26678))))

(declare-fun b!1211906 () Bool)

(declare-fun e!688233 () Bool)

(assert (=> b!1211906 (= e!688235 (and e!688233 mapRes!47998))))

(declare-fun condMapEmpty!47998 () Bool)

(declare-fun mapDefault!47998 () ValueCell!14666)

(assert (=> b!1211906 (= condMapEmpty!47998 (= (arr!37738 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14666)) mapDefault!47998)))))

(declare-fun b!1211907 () Bool)

(assert (=> b!1211907 (= e!688233 tp_is_empty!30751)))

(declare-fun b!1211908 () Bool)

(assert (=> b!1211908 (= e!688239 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550473) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!60006 () Bool)

(assert (=> bm!60006 (= call!60002 call!60007)))

(assert (= (and start!101080 res!804996) b!1211880))

(assert (= (and b!1211880 res!804990) b!1211892))

(assert (= (and b!1211892 res!804986) b!1211885))

(assert (= (and b!1211885 res!804989) b!1211905))

(assert (= (and b!1211905 res!804983) b!1211893))

(assert (= (and b!1211893 res!804992) b!1211884))

(assert (= (and b!1211884 res!804991) b!1211889))

(assert (= (and b!1211889 res!804993) b!1211890))

(assert (= (and b!1211890 res!804987) b!1211883))

(assert (= (and b!1211883 res!804994) b!1211899))

(assert (= (and b!1211899 (not res!804997)) b!1211903))

(assert (= (and b!1211903 (not res!804984)) b!1211888))

(assert (= (and b!1211888 c!119558) b!1211896))

(assert (= (and b!1211888 (not c!119558)) b!1211894))

(assert (= (or b!1211896 b!1211894) bm!60001))

(assert (= (or b!1211896 b!1211894) bm!60000))

(assert (= (and b!1211888 (not res!804995)) b!1211902))

(assert (= (and b!1211902 c!119554) b!1211879))

(assert (= (and b!1211902 (not c!119554)) b!1211904))

(assert (= (and b!1211879 c!119556) b!1211887))

(assert (= (and b!1211879 (not c!119556)) b!1211891))

(assert (= (and b!1211891 c!119557) b!1211901))

(assert (= (and b!1211891 (not c!119557)) b!1211881))

(assert (= (and b!1211881 c!119553) b!1211886))

(assert (= (and b!1211881 (not c!119553)) b!1211898))

(assert (= (or b!1211901 b!1211886) bm!60006))

(assert (= (or b!1211901 b!1211886) bm!59999))

(assert (= (or b!1211901 b!1211886) bm!60002))

(assert (= (or b!1211887 bm!60002) bm!60003))

(assert (= (or b!1211887 bm!60006) bm!60004))

(assert (= (or b!1211887 bm!59999) bm!60005))

(assert (= (and b!1211879 c!119555) b!1211882))

(assert (= (and b!1211879 (not c!119555)) b!1211908))

(assert (= (and b!1211879 res!804985) b!1211895))

(assert (= (and b!1211902 res!804988) b!1211900))

(assert (= (and b!1211906 condMapEmpty!47998) mapIsEmpty!47998))

(assert (= (and b!1211906 (not condMapEmpty!47998)) mapNonEmpty!47998))

(get-info :version)

(assert (= (and mapNonEmpty!47998 ((_ is ValueCellFull!14666) mapValue!47998)) b!1211897))

(assert (= (and b!1211906 ((_ is ValueCellFull!14666) mapDefault!47998)) b!1211907))

(assert (= start!101080 b!1211906))

(declare-fun b_lambda!21659 () Bool)

(assert (=> (not b_lambda!21659) (not b!1211903)))

(declare-fun t!39698 () Bool)

(declare-fun tb!10839 () Bool)

(assert (=> (and start!101080 (= defaultEntry!1004 defaultEntry!1004) t!39698) tb!10839))

(declare-fun result!22281 () Bool)

(assert (=> tb!10839 (= result!22281 tp_is_empty!30751)))

(assert (=> b!1211903 t!39698))

(declare-fun b_and!43169 () Bool)

(assert (= b_and!43167 (and (=> t!39698 result!22281) b_and!43169)))

(declare-fun m!1116775 () Bool)

(assert (=> bm!60001 m!1116775))

(declare-fun m!1116777 () Bool)

(assert (=> b!1211885 m!1116777))

(declare-fun m!1116779 () Bool)

(assert (=> b!1211879 m!1116779))

(declare-fun m!1116781 () Bool)

(assert (=> b!1211879 m!1116781))

(declare-fun m!1116783 () Bool)

(assert (=> b!1211879 m!1116783))

(declare-fun m!1116785 () Bool)

(assert (=> b!1211879 m!1116785))

(declare-fun m!1116787 () Bool)

(assert (=> b!1211899 m!1116787))

(declare-fun m!1116789 () Bool)

(assert (=> b!1211899 m!1116789))

(declare-fun m!1116791 () Bool)

(assert (=> mapNonEmpty!47998 m!1116791))

(declare-fun m!1116793 () Bool)

(assert (=> b!1211883 m!1116793))

(declare-fun m!1116795 () Bool)

(assert (=> b!1211895 m!1116795))

(declare-fun m!1116797 () Bool)

(assert (=> b!1211902 m!1116797))

(declare-fun m!1116799 () Bool)

(assert (=> b!1211902 m!1116799))

(declare-fun m!1116801 () Bool)

(assert (=> b!1211902 m!1116801))

(declare-fun m!1116803 () Bool)

(assert (=> b!1211902 m!1116803))

(declare-fun m!1116805 () Bool)

(assert (=> b!1211902 m!1116805))

(assert (=> b!1211902 m!1116805))

(assert (=> b!1211902 m!1116801))

(declare-fun m!1116807 () Bool)

(assert (=> b!1211902 m!1116807))

(declare-fun m!1116809 () Bool)

(assert (=> b!1211902 m!1116809))

(assert (=> b!1211902 m!1116801))

(declare-fun m!1116811 () Bool)

(assert (=> b!1211902 m!1116811))

(assert (=> b!1211902 m!1116811))

(declare-fun m!1116813 () Bool)

(assert (=> b!1211902 m!1116813))

(declare-fun m!1116815 () Bool)

(assert (=> b!1211880 m!1116815))

(declare-fun m!1116817 () Bool)

(assert (=> b!1211905 m!1116817))

(declare-fun m!1116819 () Bool)

(assert (=> bm!60003 m!1116819))

(assert (=> bm!60000 m!1116797))

(declare-fun m!1116821 () Bool)

(assert (=> b!1211896 m!1116821))

(declare-fun m!1116823 () Bool)

(assert (=> b!1211887 m!1116823))

(assert (=> b!1211887 m!1116823))

(declare-fun m!1116825 () Bool)

(assert (=> b!1211887 m!1116825))

(declare-fun m!1116827 () Bool)

(assert (=> b!1211887 m!1116827))

(assert (=> b!1211882 m!1116795))

(declare-fun m!1116829 () Bool)

(assert (=> b!1211884 m!1116829))

(declare-fun m!1116831 () Bool)

(assert (=> b!1211890 m!1116831))

(declare-fun m!1116833 () Bool)

(assert (=> b!1211890 m!1116833))

(declare-fun m!1116835 () Bool)

(assert (=> bm!60005 m!1116835))

(assert (=> b!1211900 m!1116775))

(declare-fun m!1116837 () Bool)

(assert (=> b!1211889 m!1116837))

(declare-fun m!1116839 () Bool)

(assert (=> b!1211903 m!1116839))

(declare-fun m!1116841 () Bool)

(assert (=> b!1211903 m!1116841))

(declare-fun m!1116843 () Bool)

(assert (=> b!1211903 m!1116843))

(declare-fun m!1116845 () Bool)

(assert (=> b!1211903 m!1116845))

(declare-fun m!1116847 () Bool)

(assert (=> start!101080 m!1116847))

(declare-fun m!1116849 () Bool)

(assert (=> start!101080 m!1116849))

(declare-fun m!1116851 () Bool)

(assert (=> bm!60004 m!1116851))

(assert (=> b!1211888 m!1116801))

(declare-fun m!1116853 () Bool)

(assert (=> b!1211888 m!1116853))

(check-sat (not b_lambda!21659) (not b!1211883) (not b!1211905) (not b!1211887) b_and!43169 (not b!1211890) (not b!1211879) (not bm!60001) (not b!1211902) (not bm!60003) (not b!1211896) (not b!1211885) (not b!1211880) (not mapNonEmpty!47998) tp_is_empty!30751 (not b!1211903) (not start!101080) (not b!1211900) (not b_next!26047) (not bm!60005) (not b!1211895) (not b!1211884) (not b!1211888) (not b!1211899) (not bm!60004) (not b!1211882) (not bm!60000))
(check-sat b_and!43169 (not b_next!26047))
