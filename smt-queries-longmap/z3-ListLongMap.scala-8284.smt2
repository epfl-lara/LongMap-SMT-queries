; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100900 () Bool)

(assert start!100900)

(declare-fun b_free!25975 () Bool)

(declare-fun b_next!25975 () Bool)

(assert (=> start!100900 (= b_free!25975 (not b_next!25975))))

(declare-fun tp!90934 () Bool)

(declare-fun b_and!42969 () Bool)

(assert (=> start!100900 (= tp!90934 b_and!42969)))

(declare-fun b!1208078 () Bool)

(declare-fun e!686092 () Bool)

(declare-datatypes ((List!26615 0))(
  ( (Nil!26612) (Cons!26611 (h!27820 (_ BitVec 64)) (t!39561 List!26615)) )
))
(declare-fun noDuplicate!1637 (List!26615) Bool)

(assert (=> b!1208078 (= e!686092 (noDuplicate!1637 Nil!26612))))

(declare-fun b!1208079 () Bool)

(declare-datatypes ((Unit!39890 0))(
  ( (Unit!39891) )
))
(declare-fun e!686079 () Unit!39890)

(declare-fun lt!548111 () Unit!39890)

(assert (=> b!1208079 (= e!686079 lt!548111)))

(declare-fun call!59076 () Unit!39890)

(assert (=> b!1208079 (= lt!548111 call!59076)))

(declare-fun call!59082 () Bool)

(assert (=> b!1208079 call!59082))

(declare-fun b!1208080 () Bool)

(declare-fun e!686081 () Bool)

(declare-fun e!686088 () Bool)

(assert (=> b!1208080 (= e!686081 e!686088)))

(declare-fun res!803097 () Bool)

(assert (=> b!1208080 (=> res!803097 e!686088)))

(declare-datatypes ((V!46033 0))(
  ( (V!46034 (val!15396 Int)) )
))
(declare-datatypes ((tuple2!19834 0))(
  ( (tuple2!19835 (_1!9928 (_ BitVec 64)) (_2!9928 V!46033)) )
))
(declare-datatypes ((List!26616 0))(
  ( (Nil!26613) (Cons!26612 (h!27821 tuple2!19834) (t!39562 List!26616)) )
))
(declare-datatypes ((ListLongMap!17803 0))(
  ( (ListLongMap!17804 (toList!8917 List!26616)) )
))
(declare-fun lt!548117 () ListLongMap!17803)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6917 (ListLongMap!17803 (_ BitVec 64)) Bool)

(assert (=> b!1208080 (= res!803097 (not (contains!6917 lt!548117 k0!934)))))

(declare-fun zeroValue!944 () V!46033)

(declare-datatypes ((array!78054 0))(
  ( (array!78055 (arr!37666 (Array (_ BitVec 32) (_ BitVec 64))) (size!38204 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78054)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14630 0))(
  ( (ValueCellFull!14630 (v!18043 V!46033)) (EmptyCell!14630) )
))
(declare-datatypes ((array!78056 0))(
  ( (array!78057 (arr!37667 (Array (_ BitVec 32) ValueCell!14630)) (size!38205 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78056)

(declare-fun minValue!944 () V!46033)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5360 (array!78054 array!78056 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) Int) ListLongMap!17803)

(assert (=> b!1208080 (= lt!548117 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208081 () Bool)

(declare-fun res!803095 () Bool)

(declare-fun e!686080 () Bool)

(assert (=> b!1208081 (=> (not res!803095) (not e!686080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78054 (_ BitVec 32)) Bool)

(assert (=> b!1208081 (= res!803095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1208082 () Bool)

(declare-fun e!686082 () Bool)

(declare-fun e!686091 () Bool)

(declare-fun mapRes!47881 () Bool)

(assert (=> b!1208082 (= e!686082 (and e!686091 mapRes!47881))))

(declare-fun condMapEmpty!47881 () Bool)

(declare-fun mapDefault!47881 () ValueCell!14630)

(assert (=> b!1208082 (= condMapEmpty!47881 (= (arr!37667 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14630)) mapDefault!47881)))))

(declare-fun call!59080 () ListLongMap!17803)

(declare-fun lt!548114 () array!78054)

(declare-fun bm!59072 () Bool)

(declare-fun lt!548118 () array!78056)

(assert (=> bm!59072 (= call!59080 (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47881 () Bool)

(assert (=> mapIsEmpty!47881 mapRes!47881))

(declare-fun bm!59073 () Bool)

(declare-fun call!59075 () ListLongMap!17803)

(declare-fun call!59081 () ListLongMap!17803)

(assert (=> bm!59073 (= call!59075 call!59081)))

(declare-fun b!1208084 () Bool)

(declare-fun res!803089 () Bool)

(assert (=> b!1208084 (=> (not res!803089) (not e!686080))))

(declare-fun arrayNoDuplicates!0 (array!78054 (_ BitVec 32) List!26615) Bool)

(assert (=> b!1208084 (= res!803089 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26612))))

(declare-fun b!1208085 () Bool)

(declare-fun e!686089 () Unit!39890)

(declare-fun e!686093 () Unit!39890)

(assert (=> b!1208085 (= e!686089 e!686093)))

(declare-fun c!118817 () Bool)

(declare-fun lt!548108 () Bool)

(assert (=> b!1208085 (= c!118817 (and (not lt!548108) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1208086 () Bool)

(declare-fun call!59077 () ListLongMap!17803)

(declare-fun e!686087 () Bool)

(declare-fun -!1802 (ListLongMap!17803 (_ BitVec 64)) ListLongMap!17803)

(assert (=> b!1208086 (= e!686087 (= call!59080 (-!1802 call!59077 k0!934)))))

(declare-fun b!1208087 () Bool)

(declare-fun res!803088 () Bool)

(assert (=> b!1208087 (=> (not res!803088) (not e!686080))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208087 (= res!803088 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38204 _keys!1208))))))

(declare-fun bm!59074 () Bool)

(assert (=> bm!59074 (= call!59077 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208088 () Bool)

(declare-fun e!686090 () Bool)

(declare-fun tp_is_empty!30679 () Bool)

(assert (=> b!1208088 (= e!686090 tp_is_empty!30679)))

(declare-fun b!1208089 () Bool)

(assert (=> b!1208089 call!59082))

(declare-fun lt!548115 () Unit!39890)

(assert (=> b!1208089 (= lt!548115 call!59076)))

(assert (=> b!1208089 (= e!686093 lt!548115)))

(declare-fun bm!59075 () Bool)

(declare-fun call!59078 () Unit!39890)

(declare-fun c!118814 () Bool)

(declare-fun addStillContains!1028 (ListLongMap!17803 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!39890)

(assert (=> bm!59075 (= call!59078 (addStillContains!1028 lt!548117 (ite (or c!118814 c!118817) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118814 c!118817) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1208090 () Bool)

(declare-fun e!686084 () Bool)

(assert (=> b!1208090 (= e!686080 e!686084)))

(declare-fun res!803100 () Bool)

(assert (=> b!1208090 (=> (not res!803100) (not e!686084))))

(assert (=> b!1208090 (= res!803100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548114 mask!1564))))

(assert (=> b!1208090 (= lt!548114 (array!78055 (store (arr!37666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38204 _keys!1208)))))

(declare-fun mapNonEmpty!47881 () Bool)

(declare-fun tp!90935 () Bool)

(assert (=> mapNonEmpty!47881 (= mapRes!47881 (and tp!90935 e!686090))))

(declare-fun mapKey!47881 () (_ BitVec 32))

(declare-fun mapValue!47881 () ValueCell!14630)

(declare-fun mapRest!47881 () (Array (_ BitVec 32) ValueCell!14630))

(assert (=> mapNonEmpty!47881 (= (arr!37667 _values!996) (store mapRest!47881 mapKey!47881 mapValue!47881))))

(declare-fun bm!59076 () Bool)

(assert (=> bm!59076 (= call!59076 call!59078)))

(declare-fun e!686086 () Bool)

(declare-fun b!1208091 () Bool)

(assert (=> b!1208091 (= e!686086 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548108) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!548110 () ListLongMap!17803)

(declare-fun bm!59077 () Bool)

(declare-fun +!4044 (ListLongMap!17803 tuple2!19834) ListLongMap!17803)

(assert (=> bm!59077 (= call!59081 (+!4044 (ite c!118814 lt!548110 lt!548117) (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1208092 () Bool)

(assert (=> b!1208092 (= e!686088 e!686092)))

(declare-fun res!803091 () Bool)

(assert (=> b!1208092 (=> res!803091 e!686092)))

(assert (=> b!1208092 (= res!803091 (or (bvsge (size!38204 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)) (bvsge from!1455 (size!38204 _keys!1208))))))

(assert (=> b!1208092 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26612)))

(declare-fun lt!548106 () Unit!39890)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78054 (_ BitVec 32) (_ BitVec 32)) Unit!39890)

(assert (=> b!1208092 (= lt!548106 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!686083 () Bool)

(assert (=> b!1208092 e!686083))

(declare-fun res!803090 () Bool)

(assert (=> b!1208092 (=> (not res!803090) (not e!686083))))

(assert (=> b!1208092 (= res!803090 e!686086)))

(declare-fun c!118816 () Bool)

(assert (=> b!1208092 (= c!118816 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548109 () Unit!39890)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!574 (array!78054 array!78056 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 64) (_ BitVec 32) Int) Unit!39890)

(assert (=> b!1208092 (= lt!548109 (lemmaListMapContainsThenArrayContainsFrom!574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548105 () Unit!39890)

(assert (=> b!1208092 (= lt!548105 e!686089)))

(assert (=> b!1208092 (= c!118814 (and (not lt!548108) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1208092 (= lt!548108 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!59078 () Bool)

(declare-fun call!59079 () Bool)

(assert (=> bm!59078 (= call!59082 call!59079)))

(declare-fun b!1208093 () Bool)

(declare-fun res!803087 () Bool)

(assert (=> b!1208093 (=> (not res!803087) (not e!686080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1208093 (= res!803087 (validMask!0 mask!1564))))

(declare-fun res!803092 () Bool)

(assert (=> start!100900 (=> (not res!803092) (not e!686080))))

(assert (=> start!100900 (= res!803092 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38204 _keys!1208))))))

(assert (=> start!100900 e!686080))

(assert (=> start!100900 tp_is_empty!30679))

(declare-fun array_inv!28802 (array!78054) Bool)

(assert (=> start!100900 (array_inv!28802 _keys!1208)))

(assert (=> start!100900 true))

(assert (=> start!100900 tp!90934))

(declare-fun array_inv!28803 (array!78056) Bool)

(assert (=> start!100900 (and (array_inv!28803 _values!996) e!686082)))

(declare-fun b!1208083 () Bool)

(assert (=> b!1208083 (= e!686087 (= call!59080 call!59077))))

(declare-fun b!1208094 () Bool)

(declare-fun Unit!39892 () Unit!39890)

(assert (=> b!1208094 (= e!686079 Unit!39892)))

(declare-fun bm!59079 () Bool)

(assert (=> bm!59079 (= call!59079 (contains!6917 (ite c!118814 lt!548110 call!59075) k0!934))))

(declare-fun b!1208095 () Bool)

(declare-fun e!686085 () Bool)

(assert (=> b!1208095 (= e!686085 e!686081)))

(declare-fun res!803086 () Bool)

(assert (=> b!1208095 (=> res!803086 e!686081)))

(assert (=> b!1208095 (= res!803086 (not (= (select (arr!37666 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1208095 e!686087))

(declare-fun c!118815 () Bool)

(assert (=> b!1208095 (= c!118815 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!548119 () Unit!39890)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 (array!78054 array!78056 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39890)

(assert (=> b!1208095 (= lt!548119 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208096 () Bool)

(declare-fun res!803099 () Bool)

(assert (=> b!1208096 (=> (not res!803099) (not e!686080))))

(assert (=> b!1208096 (= res!803099 (and (= (size!38205 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38204 _keys!1208) (size!38205 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208097 () Bool)

(declare-fun c!118813 () Bool)

(assert (=> b!1208097 (= c!118813 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548108))))

(assert (=> b!1208097 (= e!686093 e!686079)))

(declare-fun b!1208098 () Bool)

(declare-fun arrayContainsKey!0 (array!78054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208098 (= e!686086 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208099 () Bool)

(declare-fun lt!548107 () Unit!39890)

(assert (=> b!1208099 (= e!686089 lt!548107)))

(declare-fun lt!548116 () Unit!39890)

(assert (=> b!1208099 (= lt!548116 call!59078)))

(assert (=> b!1208099 (= lt!548110 (+!4044 lt!548117 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1208099 call!59079))

(assert (=> b!1208099 (= lt!548107 (addStillContains!1028 lt!548110 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1208099 (contains!6917 call!59081 k0!934)))

(declare-fun b!1208100 () Bool)

(declare-fun res!803096 () Bool)

(assert (=> b!1208100 (=> (not res!803096) (not e!686084))))

(assert (=> b!1208100 (= res!803096 (arrayNoDuplicates!0 lt!548114 #b00000000000000000000000000000000 Nil!26612))))

(declare-fun b!1208101 () Bool)

(declare-fun e!686094 () Bool)

(assert (=> b!1208101 (= e!686084 (not e!686094))))

(declare-fun res!803085 () Bool)

(assert (=> b!1208101 (=> res!803085 e!686094)))

(assert (=> b!1208101 (= res!803085 (bvsgt from!1455 i!673))))

(assert (=> b!1208101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548113 () Unit!39890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78054 (_ BitVec 64) (_ BitVec 32)) Unit!39890)

(assert (=> b!1208101 (= lt!548113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1208102 () Bool)

(declare-fun res!803094 () Bool)

(assert (=> b!1208102 (=> (not res!803094) (not e!686080))))

(assert (=> b!1208102 (= res!803094 (= (select (arr!37666 _keys!1208) i!673) k0!934))))

(declare-fun b!1208103 () Bool)

(declare-fun res!803093 () Bool)

(assert (=> b!1208103 (=> (not res!803093) (not e!686080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1208103 (= res!803093 (validKeyInArray!0 k0!934))))

(declare-fun b!1208104 () Bool)

(assert (=> b!1208104 (= e!686094 e!686085)))

(declare-fun res!803098 () Bool)

(assert (=> b!1208104 (=> res!803098 e!686085)))

(assert (=> b!1208104 (= res!803098 (not (= from!1455 i!673)))))

(declare-fun lt!548104 () ListLongMap!17803)

(assert (=> b!1208104 (= lt!548104 (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3225 (Int (_ BitVec 64)) V!46033)

(assert (=> b!1208104 (= lt!548118 (array!78057 (store (arr!37667 _values!996) i!673 (ValueCellFull!14630 (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38205 _values!996)))))

(declare-fun lt!548112 () ListLongMap!17803)

(assert (=> b!1208104 (= lt!548112 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1208105 () Bool)

(assert (=> b!1208105 (= e!686083 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208106 () Bool)

(assert (=> b!1208106 (= e!686091 tp_is_empty!30679)))

(assert (= (and start!100900 res!803092) b!1208093))

(assert (= (and b!1208093 res!803087) b!1208096))

(assert (= (and b!1208096 res!803099) b!1208081))

(assert (= (and b!1208081 res!803095) b!1208084))

(assert (= (and b!1208084 res!803089) b!1208087))

(assert (= (and b!1208087 res!803088) b!1208103))

(assert (= (and b!1208103 res!803093) b!1208102))

(assert (= (and b!1208102 res!803094) b!1208090))

(assert (= (and b!1208090 res!803100) b!1208100))

(assert (= (and b!1208100 res!803096) b!1208101))

(assert (= (and b!1208101 (not res!803085)) b!1208104))

(assert (= (and b!1208104 (not res!803098)) b!1208095))

(assert (= (and b!1208095 c!118815) b!1208086))

(assert (= (and b!1208095 (not c!118815)) b!1208083))

(assert (= (or b!1208086 b!1208083) bm!59072))

(assert (= (or b!1208086 b!1208083) bm!59074))

(assert (= (and b!1208095 (not res!803086)) b!1208080))

(assert (= (and b!1208080 (not res!803097)) b!1208092))

(assert (= (and b!1208092 c!118814) b!1208099))

(assert (= (and b!1208092 (not c!118814)) b!1208085))

(assert (= (and b!1208085 c!118817) b!1208089))

(assert (= (and b!1208085 (not c!118817)) b!1208097))

(assert (= (and b!1208097 c!118813) b!1208079))

(assert (= (and b!1208097 (not c!118813)) b!1208094))

(assert (= (or b!1208089 b!1208079) bm!59076))

(assert (= (or b!1208089 b!1208079) bm!59073))

(assert (= (or b!1208089 b!1208079) bm!59078))

(assert (= (or b!1208099 bm!59078) bm!59079))

(assert (= (or b!1208099 bm!59076) bm!59075))

(assert (= (or b!1208099 bm!59073) bm!59077))

(assert (= (and b!1208092 c!118816) b!1208098))

(assert (= (and b!1208092 (not c!118816)) b!1208091))

(assert (= (and b!1208092 res!803090) b!1208105))

(assert (= (and b!1208092 (not res!803091)) b!1208078))

(assert (= (and b!1208082 condMapEmpty!47881) mapIsEmpty!47881))

(assert (= (and b!1208082 (not condMapEmpty!47881)) mapNonEmpty!47881))

(get-info :version)

(assert (= (and mapNonEmpty!47881 ((_ is ValueCellFull!14630) mapValue!47881)) b!1208088))

(assert (= (and b!1208082 ((_ is ValueCellFull!14630) mapDefault!47881)) b!1208106))

(assert (= start!100900 b!1208082))

(declare-fun b_lambda!21473 () Bool)

(assert (=> (not b_lambda!21473) (not b!1208104)))

(declare-fun t!39560 () Bool)

(declare-fun tb!10767 () Bool)

(assert (=> (and start!100900 (= defaultEntry!1004 defaultEntry!1004) t!39560) tb!10767))

(declare-fun result!22131 () Bool)

(assert (=> tb!10767 (= result!22131 tp_is_empty!30679)))

(assert (=> b!1208104 t!39560))

(declare-fun b_and!42971 () Bool)

(assert (= b_and!42969 (and (=> t!39560 result!22131) b_and!42971)))

(declare-fun m!1113399 () Bool)

(assert (=> b!1208090 m!1113399))

(declare-fun m!1113401 () Bool)

(assert (=> b!1208090 m!1113401))

(declare-fun m!1113403 () Bool)

(assert (=> mapNonEmpty!47881 m!1113403))

(declare-fun m!1113405 () Bool)

(assert (=> start!100900 m!1113405))

(declare-fun m!1113407 () Bool)

(assert (=> start!100900 m!1113407))

(declare-fun m!1113409 () Bool)

(assert (=> b!1208078 m!1113409))

(declare-fun m!1113411 () Bool)

(assert (=> bm!59075 m!1113411))

(declare-fun m!1113413 () Bool)

(assert (=> b!1208100 m!1113413))

(declare-fun m!1113415 () Bool)

(assert (=> b!1208103 m!1113415))

(declare-fun m!1113417 () Bool)

(assert (=> b!1208102 m!1113417))

(declare-fun m!1113419 () Bool)

(assert (=> bm!59077 m!1113419))

(declare-fun m!1113421 () Bool)

(assert (=> b!1208099 m!1113421))

(declare-fun m!1113423 () Bool)

(assert (=> b!1208099 m!1113423))

(declare-fun m!1113425 () Bool)

(assert (=> b!1208099 m!1113425))

(declare-fun m!1113427 () Bool)

(assert (=> b!1208098 m!1113427))

(declare-fun m!1113429 () Bool)

(assert (=> b!1208084 m!1113429))

(declare-fun m!1113431 () Bool)

(assert (=> b!1208081 m!1113431))

(declare-fun m!1113433 () Bool)

(assert (=> b!1208095 m!1113433))

(declare-fun m!1113435 () Bool)

(assert (=> b!1208095 m!1113435))

(declare-fun m!1113437 () Bool)

(assert (=> bm!59079 m!1113437))

(declare-fun m!1113439 () Bool)

(assert (=> b!1208092 m!1113439))

(declare-fun m!1113441 () Bool)

(assert (=> b!1208092 m!1113441))

(declare-fun m!1113443 () Bool)

(assert (=> b!1208092 m!1113443))

(declare-fun m!1113445 () Bool)

(assert (=> b!1208093 m!1113445))

(assert (=> b!1208105 m!1113427))

(declare-fun m!1113447 () Bool)

(assert (=> b!1208101 m!1113447))

(declare-fun m!1113449 () Bool)

(assert (=> b!1208101 m!1113449))

(declare-fun m!1113451 () Bool)

(assert (=> b!1208086 m!1113451))

(declare-fun m!1113453 () Bool)

(assert (=> bm!59074 m!1113453))

(declare-fun m!1113455 () Bool)

(assert (=> b!1208104 m!1113455))

(declare-fun m!1113457 () Bool)

(assert (=> b!1208104 m!1113457))

(declare-fun m!1113459 () Bool)

(assert (=> b!1208104 m!1113459))

(declare-fun m!1113461 () Bool)

(assert (=> b!1208104 m!1113461))

(declare-fun m!1113463 () Bool)

(assert (=> b!1208080 m!1113463))

(assert (=> b!1208080 m!1113453))

(declare-fun m!1113465 () Bool)

(assert (=> bm!59072 m!1113465))

(check-sat (not b!1208090) (not b!1208095) (not b_lambda!21473) (not b!1208098) (not b!1208099) (not mapNonEmpty!47881) (not b!1208086) (not start!100900) (not b!1208078) (not b!1208104) (not b!1208081) (not bm!59077) (not b!1208105) b_and!42971 (not bm!59072) (not bm!59074) (not b!1208100) tp_is_empty!30679 (not b!1208101) (not b!1208092) (not bm!59075) (not bm!59079) (not b!1208084) (not b!1208080) (not b!1208103) (not b!1208093) (not b_next!25975))
(check-sat b_and!42971 (not b_next!25975))
(get-model)

(declare-fun b_lambda!21479 () Bool)

(assert (= b_lambda!21473 (or (and start!100900 b_free!25975) b_lambda!21479)))

(check-sat (not b!1208090) (not b!1208095) (not b!1208098) (not b!1208099) (not mapNonEmpty!47881) (not b!1208086) (not b!1208078) (not b!1208104) (not b!1208081) (not bm!59077) (not b!1208105) b_and!42971 (not bm!59072) (not bm!59074) (not b!1208100) tp_is_empty!30679 (not b!1208101) (not b!1208092) (not bm!59075) (not bm!59079) (not b!1208084) (not start!100900) (not b_lambda!21479) (not b!1208080) (not b!1208103) (not b!1208093) (not b_next!25975))
(check-sat b_and!42971 (not b_next!25975))
(get-model)

(declare-fun b!1208297 () Bool)

(declare-fun e!686206 () Bool)

(declare-fun e!686207 () Bool)

(assert (=> b!1208297 (= e!686206 e!686207)))

(declare-fun c!118850 () Bool)

(assert (=> b!1208297 (= c!118850 (validKeyInArray!0 (select (arr!37666 _keys!1208) from!1455)))))

(declare-fun b!1208298 () Bool)

(declare-fun call!59133 () Bool)

(assert (=> b!1208298 (= e!686207 call!59133)))

(declare-fun bm!59130 () Bool)

(assert (=> bm!59130 (= call!59133 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!118850 (Cons!26611 (select (arr!37666 _keys!1208) from!1455) Nil!26612) Nil!26612)))))

(declare-fun b!1208299 () Bool)

(declare-fun e!686209 () Bool)

(assert (=> b!1208299 (= e!686209 e!686206)))

(declare-fun res!803204 () Bool)

(assert (=> b!1208299 (=> (not res!803204) (not e!686206))))

(declare-fun e!686208 () Bool)

(assert (=> b!1208299 (= res!803204 (not e!686208))))

(declare-fun res!803203 () Bool)

(assert (=> b!1208299 (=> (not res!803203) (not e!686208))))

(assert (=> b!1208299 (= res!803203 (validKeyInArray!0 (select (arr!37666 _keys!1208) from!1455)))))

(declare-fun b!1208300 () Bool)

(assert (=> b!1208300 (= e!686207 call!59133)))

(declare-fun b!1208301 () Bool)

(declare-fun contains!6920 (List!26615 (_ BitVec 64)) Bool)

(assert (=> b!1208301 (= e!686208 (contains!6920 Nil!26612 (select (arr!37666 _keys!1208) from!1455)))))

(declare-fun d!133069 () Bool)

(declare-fun res!803205 () Bool)

(assert (=> d!133069 (=> res!803205 e!686209)))

(assert (=> d!133069 (= res!803205 (bvsge from!1455 (size!38204 _keys!1208)))))

(assert (=> d!133069 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26612) e!686209)))

(assert (= (and d!133069 (not res!803205)) b!1208299))

(assert (= (and b!1208299 res!803203) b!1208301))

(assert (= (and b!1208299 res!803204) b!1208297))

(assert (= (and b!1208297 c!118850) b!1208300))

(assert (= (and b!1208297 (not c!118850)) b!1208298))

(assert (= (or b!1208300 b!1208298) bm!59130))

(assert (=> b!1208297 m!1113433))

(assert (=> b!1208297 m!1113433))

(declare-fun m!1113603 () Bool)

(assert (=> b!1208297 m!1113603))

(assert (=> bm!59130 m!1113433))

(declare-fun m!1113605 () Bool)

(assert (=> bm!59130 m!1113605))

(assert (=> b!1208299 m!1113433))

(assert (=> b!1208299 m!1113433))

(assert (=> b!1208299 m!1113603))

(assert (=> b!1208301 m!1113433))

(assert (=> b!1208301 m!1113433))

(declare-fun m!1113607 () Bool)

(assert (=> b!1208301 m!1113607))

(assert (=> b!1208092 d!133069))

(declare-fun d!133071 () Bool)

(assert (=> d!133071 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26612)))

(declare-fun lt!548218 () Unit!39890)

(declare-fun choose!39 (array!78054 (_ BitVec 32) (_ BitVec 32)) Unit!39890)

(assert (=> d!133071 (= lt!548218 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133071 (bvslt (size!38204 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133071 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!548218)))

(declare-fun bs!34129 () Bool)

(assert (= bs!34129 d!133071))

(assert (=> bs!34129 m!1113439))

(declare-fun m!1113609 () Bool)

(assert (=> bs!34129 m!1113609))

(assert (=> b!1208092 d!133071))

(declare-fun d!133073 () Bool)

(declare-fun e!686212 () Bool)

(assert (=> d!133073 e!686212))

(declare-fun c!118853 () Bool)

(assert (=> d!133073 (= c!118853 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548221 () Unit!39890)

(declare-fun choose!1815 (array!78054 array!78056 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 64) (_ BitVec 32) Int) Unit!39890)

(assert (=> d!133073 (= lt!548221 (choose!1815 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133073 (validMask!0 mask!1564)))

(assert (=> d!133073 (= (lemmaListMapContainsThenArrayContainsFrom!574 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548221)))

(declare-fun b!1208306 () Bool)

(assert (=> b!1208306 (= e!686212 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1208307 () Bool)

(assert (=> b!1208307 (= e!686212 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133073 c!118853) b!1208306))

(assert (= (and d!133073 (not c!118853)) b!1208307))

(declare-fun m!1113611 () Bool)

(assert (=> d!133073 m!1113611))

(assert (=> d!133073 m!1113445))

(assert (=> b!1208306 m!1113427))

(assert (=> b!1208092 d!133073))

(declare-fun d!133075 () Bool)

(declare-fun lt!548224 () ListLongMap!17803)

(assert (=> d!133075 (not (contains!6917 lt!548224 k0!934))))

(declare-fun removeStrictlySorted!99 (List!26616 (_ BitVec 64)) List!26616)

(assert (=> d!133075 (= lt!548224 (ListLongMap!17804 (removeStrictlySorted!99 (toList!8917 call!59077) k0!934)))))

(assert (=> d!133075 (= (-!1802 call!59077 k0!934) lt!548224)))

(declare-fun bs!34130 () Bool)

(assert (= bs!34130 d!133075))

(declare-fun m!1113613 () Bool)

(assert (=> bs!34130 m!1113613))

(declare-fun m!1113615 () Bool)

(assert (=> bs!34130 m!1113615))

(assert (=> b!1208086 d!133075))

(declare-fun d!133077 () Bool)

(declare-fun res!803210 () Bool)

(declare-fun e!686217 () Bool)

(assert (=> d!133077 (=> res!803210 e!686217)))

(assert (=> d!133077 (= res!803210 ((_ is Nil!26612) Nil!26612))))

(assert (=> d!133077 (= (noDuplicate!1637 Nil!26612) e!686217)))

(declare-fun b!1208312 () Bool)

(declare-fun e!686218 () Bool)

(assert (=> b!1208312 (= e!686217 e!686218)))

(declare-fun res!803211 () Bool)

(assert (=> b!1208312 (=> (not res!803211) (not e!686218))))

(assert (=> b!1208312 (= res!803211 (not (contains!6920 (t!39561 Nil!26612) (h!27820 Nil!26612))))))

(declare-fun b!1208313 () Bool)

(assert (=> b!1208313 (= e!686218 (noDuplicate!1637 (t!39561 Nil!26612)))))

(assert (= (and d!133077 (not res!803210)) b!1208312))

(assert (= (and b!1208312 res!803211) b!1208313))

(declare-fun m!1113617 () Bool)

(assert (=> b!1208312 m!1113617))

(declare-fun m!1113619 () Bool)

(assert (=> b!1208313 m!1113619))

(assert (=> b!1208078 d!133077))

(declare-fun b!1208314 () Bool)

(declare-fun e!686219 () Bool)

(declare-fun e!686220 () Bool)

(assert (=> b!1208314 (= e!686219 e!686220)))

(declare-fun c!118854 () Bool)

(assert (=> b!1208314 (= c!118854 (validKeyInArray!0 (select (arr!37666 lt!548114) #b00000000000000000000000000000000)))))

(declare-fun b!1208315 () Bool)

(declare-fun call!59134 () Bool)

(assert (=> b!1208315 (= e!686220 call!59134)))

(declare-fun bm!59131 () Bool)

(assert (=> bm!59131 (= call!59134 (arrayNoDuplicates!0 lt!548114 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118854 (Cons!26611 (select (arr!37666 lt!548114) #b00000000000000000000000000000000) Nil!26612) Nil!26612)))))

(declare-fun b!1208316 () Bool)

(declare-fun e!686222 () Bool)

(assert (=> b!1208316 (= e!686222 e!686219)))

(declare-fun res!803213 () Bool)

(assert (=> b!1208316 (=> (not res!803213) (not e!686219))))

(declare-fun e!686221 () Bool)

(assert (=> b!1208316 (= res!803213 (not e!686221))))

(declare-fun res!803212 () Bool)

(assert (=> b!1208316 (=> (not res!803212) (not e!686221))))

(assert (=> b!1208316 (= res!803212 (validKeyInArray!0 (select (arr!37666 lt!548114) #b00000000000000000000000000000000)))))

(declare-fun b!1208317 () Bool)

(assert (=> b!1208317 (= e!686220 call!59134)))

(declare-fun b!1208318 () Bool)

(assert (=> b!1208318 (= e!686221 (contains!6920 Nil!26612 (select (arr!37666 lt!548114) #b00000000000000000000000000000000)))))

(declare-fun d!133079 () Bool)

(declare-fun res!803214 () Bool)

(assert (=> d!133079 (=> res!803214 e!686222)))

(assert (=> d!133079 (= res!803214 (bvsge #b00000000000000000000000000000000 (size!38204 lt!548114)))))

(assert (=> d!133079 (= (arrayNoDuplicates!0 lt!548114 #b00000000000000000000000000000000 Nil!26612) e!686222)))

(assert (= (and d!133079 (not res!803214)) b!1208316))

(assert (= (and b!1208316 res!803212) b!1208318))

(assert (= (and b!1208316 res!803213) b!1208314))

(assert (= (and b!1208314 c!118854) b!1208317))

(assert (= (and b!1208314 (not c!118854)) b!1208315))

(assert (= (or b!1208317 b!1208315) bm!59131))

(declare-fun m!1113621 () Bool)

(assert (=> b!1208314 m!1113621))

(assert (=> b!1208314 m!1113621))

(declare-fun m!1113623 () Bool)

(assert (=> b!1208314 m!1113623))

(assert (=> bm!59131 m!1113621))

(declare-fun m!1113625 () Bool)

(assert (=> bm!59131 m!1113625))

(assert (=> b!1208316 m!1113621))

(assert (=> b!1208316 m!1113621))

(assert (=> b!1208316 m!1113623))

(assert (=> b!1208318 m!1113621))

(assert (=> b!1208318 m!1113621))

(declare-fun m!1113627 () Bool)

(assert (=> b!1208318 m!1113627))

(assert (=> b!1208100 d!133079))

(declare-fun d!133081 () Bool)

(declare-fun e!686225 () Bool)

(assert (=> d!133081 e!686225))

(declare-fun res!803220 () Bool)

(assert (=> d!133081 (=> (not res!803220) (not e!686225))))

(declare-fun lt!548236 () ListLongMap!17803)

(assert (=> d!133081 (= res!803220 (contains!6917 lt!548236 (_1!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!548233 () List!26616)

(assert (=> d!133081 (= lt!548236 (ListLongMap!17804 lt!548233))))

(declare-fun lt!548235 () Unit!39890)

(declare-fun lt!548234 () Unit!39890)

(assert (=> d!133081 (= lt!548235 lt!548234)))

(declare-datatypes ((Option!690 0))(
  ( (Some!689 (v!18046 V!46033)) (None!688) )
))
(declare-fun getValueByKey!639 (List!26616 (_ BitVec 64)) Option!690)

(assert (=> d!133081 (= (getValueByKey!639 lt!548233 (_1!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!689 (_2!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!315 (List!26616 (_ BitVec 64) V!46033) Unit!39890)

(assert (=> d!133081 (= lt!548234 (lemmaContainsTupThenGetReturnValue!315 lt!548233 (_1!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun insertStrictlySorted!408 (List!26616 (_ BitVec 64) V!46033) List!26616)

(assert (=> d!133081 (= lt!548233 (insertStrictlySorted!408 (toList!8917 (ite c!118814 lt!548110 lt!548117)) (_1!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133081 (= (+!4044 (ite c!118814 lt!548110 lt!548117) (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!548236)))

(declare-fun b!1208323 () Bool)

(declare-fun res!803219 () Bool)

(assert (=> b!1208323 (=> (not res!803219) (not e!686225))))

(assert (=> b!1208323 (= res!803219 (= (getValueByKey!639 (toList!8917 lt!548236) (_1!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!689 (_2!9928 (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1208324 () Bool)

(declare-fun contains!6921 (List!26616 tuple2!19834) Bool)

(assert (=> b!1208324 (= e!686225 (contains!6921 (toList!8917 lt!548236) (ite c!118814 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118817 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133081 res!803220) b!1208323))

(assert (= (and b!1208323 res!803219) b!1208324))

(declare-fun m!1113629 () Bool)

(assert (=> d!133081 m!1113629))

(declare-fun m!1113631 () Bool)

(assert (=> d!133081 m!1113631))

(declare-fun m!1113633 () Bool)

(assert (=> d!133081 m!1113633))

(declare-fun m!1113635 () Bool)

(assert (=> d!133081 m!1113635))

(declare-fun m!1113637 () Bool)

(assert (=> b!1208323 m!1113637))

(declare-fun m!1113639 () Bool)

(assert (=> b!1208324 m!1113639))

(assert (=> bm!59077 d!133081))

(declare-fun d!133083 () Bool)

(declare-fun e!686231 () Bool)

(assert (=> d!133083 e!686231))

(declare-fun res!803223 () Bool)

(assert (=> d!133083 (=> res!803223 e!686231)))

(declare-fun lt!548245 () Bool)

(assert (=> d!133083 (= res!803223 (not lt!548245))))

(declare-fun lt!548246 () Bool)

(assert (=> d!133083 (= lt!548245 lt!548246)))

(declare-fun lt!548247 () Unit!39890)

(declare-fun e!686230 () Unit!39890)

(assert (=> d!133083 (= lt!548247 e!686230)))

(declare-fun c!118857 () Bool)

(assert (=> d!133083 (= c!118857 lt!548246)))

(declare-fun containsKey!593 (List!26616 (_ BitVec 64)) Bool)

(assert (=> d!133083 (= lt!548246 (containsKey!593 (toList!8917 lt!548117) k0!934))))

(assert (=> d!133083 (= (contains!6917 lt!548117 k0!934) lt!548245)))

(declare-fun b!1208331 () Bool)

(declare-fun lt!548248 () Unit!39890)

(assert (=> b!1208331 (= e!686230 lt!548248)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!422 (List!26616 (_ BitVec 64)) Unit!39890)

(assert (=> b!1208331 (= lt!548248 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8917 lt!548117) k0!934))))

(declare-fun isDefined!465 (Option!690) Bool)

(assert (=> b!1208331 (isDefined!465 (getValueByKey!639 (toList!8917 lt!548117) k0!934))))

(declare-fun b!1208332 () Bool)

(declare-fun Unit!39899 () Unit!39890)

(assert (=> b!1208332 (= e!686230 Unit!39899)))

(declare-fun b!1208333 () Bool)

(assert (=> b!1208333 (= e!686231 (isDefined!465 (getValueByKey!639 (toList!8917 lt!548117) k0!934)))))

(assert (= (and d!133083 c!118857) b!1208331))

(assert (= (and d!133083 (not c!118857)) b!1208332))

(assert (= (and d!133083 (not res!803223)) b!1208333))

(declare-fun m!1113641 () Bool)

(assert (=> d!133083 m!1113641))

(declare-fun m!1113643 () Bool)

(assert (=> b!1208331 m!1113643))

(declare-fun m!1113645 () Bool)

(assert (=> b!1208331 m!1113645))

(assert (=> b!1208331 m!1113645))

(declare-fun m!1113647 () Bool)

(assert (=> b!1208331 m!1113647))

(assert (=> b!1208333 m!1113645))

(assert (=> b!1208333 m!1113645))

(assert (=> b!1208333 m!1113647))

(assert (=> b!1208080 d!133083))

(declare-fun b!1208358 () Bool)

(declare-fun e!686251 () Bool)

(declare-fun lt!548263 () ListLongMap!17803)

(declare-fun isEmpty!995 (ListLongMap!17803) Bool)

(assert (=> b!1208358 (= e!686251 (isEmpty!995 lt!548263))))

(declare-fun b!1208359 () Bool)

(declare-fun e!686249 () Bool)

(declare-fun e!686247 () Bool)

(assert (=> b!1208359 (= e!686249 e!686247)))

(declare-fun c!118867 () Bool)

(declare-fun e!686250 () Bool)

(assert (=> b!1208359 (= c!118867 e!686250)))

(declare-fun res!803235 () Bool)

(assert (=> b!1208359 (=> (not res!803235) (not e!686250))))

(assert (=> b!1208359 (= res!803235 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)))))

(declare-fun b!1208360 () Bool)

(assert (=> b!1208360 (= e!686250 (validKeyInArray!0 (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208360 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208361 () Bool)

(declare-fun e!686252 () ListLongMap!17803)

(declare-fun call!59137 () ListLongMap!17803)

(assert (=> b!1208361 (= e!686252 call!59137)))

(declare-fun b!1208362 () Bool)

(assert (=> b!1208362 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)))))

(assert (=> b!1208362 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38205 _values!996)))))

(declare-fun e!686248 () Bool)

(declare-fun apply!959 (ListLongMap!17803 (_ BitVec 64)) V!46033)

(declare-fun get!19215 (ValueCell!14630 V!46033) V!46033)

(assert (=> b!1208362 (= e!686248 (= (apply!959 lt!548263 (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19215 (select (arr!37667 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208363 () Bool)

(declare-fun res!803232 () Bool)

(assert (=> b!1208363 (=> (not res!803232) (not e!686249))))

(assert (=> b!1208363 (= res!803232 (not (contains!6917 lt!548263 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133085 () Bool)

(assert (=> d!133085 e!686249))

(declare-fun res!803233 () Bool)

(assert (=> d!133085 (=> (not res!803233) (not e!686249))))

(assert (=> d!133085 (= res!803233 (not (contains!6917 lt!548263 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686246 () ListLongMap!17803)

(assert (=> d!133085 (= lt!548263 e!686246)))

(declare-fun c!118868 () Bool)

(assert (=> d!133085 (= c!118868 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)))))

(assert (=> d!133085 (validMask!0 mask!1564)))

(assert (=> d!133085 (= (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548263)))

(declare-fun bm!59134 () Bool)

(assert (=> bm!59134 (= call!59137 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208364 () Bool)

(assert (=> b!1208364 (= e!686246 (ListLongMap!17804 Nil!26613))))

(declare-fun b!1208365 () Bool)

(assert (=> b!1208365 (= e!686246 e!686252)))

(declare-fun c!118869 () Bool)

(assert (=> b!1208365 (= c!118869 (validKeyInArray!0 (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208366 () Bool)

(assert (=> b!1208366 (= e!686247 e!686251)))

(declare-fun c!118866 () Bool)

(assert (=> b!1208366 (= c!118866 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)))))

(declare-fun b!1208367 () Bool)

(declare-fun lt!548265 () Unit!39890)

(declare-fun lt!548264 () Unit!39890)

(assert (=> b!1208367 (= lt!548265 lt!548264)))

(declare-fun lt!548267 () (_ BitVec 64))

(declare-fun lt!548268 () (_ BitVec 64))

(declare-fun lt!548266 () ListLongMap!17803)

(declare-fun lt!548269 () V!46033)

(assert (=> b!1208367 (not (contains!6917 (+!4044 lt!548266 (tuple2!19835 lt!548268 lt!548269)) lt!548267))))

(declare-fun addStillNotContains!295 (ListLongMap!17803 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!39890)

(assert (=> b!1208367 (= lt!548264 (addStillNotContains!295 lt!548266 lt!548268 lt!548269 lt!548267))))

(assert (=> b!1208367 (= lt!548267 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208367 (= lt!548269 (get!19215 (select (arr!37667 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208367 (= lt!548268 (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208367 (= lt!548266 call!59137)))

(assert (=> b!1208367 (= e!686252 (+!4044 call!59137 (tuple2!19835 (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19215 (select (arr!37667 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208368 () Bool)

(assert (=> b!1208368 (= e!686247 e!686248)))

(assert (=> b!1208368 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)))))

(declare-fun res!803234 () Bool)

(assert (=> b!1208368 (= res!803234 (contains!6917 lt!548263 (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208368 (=> (not res!803234) (not e!686248))))

(declare-fun b!1208369 () Bool)

(assert (=> b!1208369 (= e!686251 (= lt!548263 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133085 c!118868) b!1208364))

(assert (= (and d!133085 (not c!118868)) b!1208365))

(assert (= (and b!1208365 c!118869) b!1208367))

(assert (= (and b!1208365 (not c!118869)) b!1208361))

(assert (= (or b!1208367 b!1208361) bm!59134))

(assert (= (and d!133085 res!803233) b!1208363))

(assert (= (and b!1208363 res!803232) b!1208359))

(assert (= (and b!1208359 res!803235) b!1208360))

(assert (= (and b!1208359 c!118867) b!1208368))

(assert (= (and b!1208359 (not c!118867)) b!1208366))

(assert (= (and b!1208368 res!803234) b!1208362))

(assert (= (and b!1208366 c!118866) b!1208369))

(assert (= (and b!1208366 (not c!118866)) b!1208358))

(declare-fun b_lambda!21481 () Bool)

(assert (=> (not b_lambda!21481) (not b!1208362)))

(assert (=> b!1208362 t!39560))

(declare-fun b_and!42981 () Bool)

(assert (= b_and!42971 (and (=> t!39560 result!22131) b_and!42981)))

(declare-fun b_lambda!21483 () Bool)

(assert (=> (not b_lambda!21483) (not b!1208367)))

(assert (=> b!1208367 t!39560))

(declare-fun b_and!42983 () Bool)

(assert (= b_and!42981 (and (=> t!39560 result!22131) b_and!42983)))

(declare-fun m!1113649 () Bool)

(assert (=> b!1208363 m!1113649))

(declare-fun m!1113651 () Bool)

(assert (=> b!1208365 m!1113651))

(assert (=> b!1208365 m!1113651))

(declare-fun m!1113653 () Bool)

(assert (=> b!1208365 m!1113653))

(declare-fun m!1113655 () Bool)

(assert (=> b!1208358 m!1113655))

(declare-fun m!1113657 () Bool)

(assert (=> d!133085 m!1113657))

(assert (=> d!133085 m!1113445))

(declare-fun m!1113659 () Bool)

(assert (=> bm!59134 m!1113659))

(declare-fun m!1113661 () Bool)

(assert (=> b!1208367 m!1113661))

(declare-fun m!1113663 () Bool)

(assert (=> b!1208367 m!1113663))

(declare-fun m!1113665 () Bool)

(assert (=> b!1208367 m!1113665))

(assert (=> b!1208367 m!1113457))

(declare-fun m!1113667 () Bool)

(assert (=> b!1208367 m!1113667))

(assert (=> b!1208367 m!1113457))

(assert (=> b!1208367 m!1113661))

(assert (=> b!1208367 m!1113665))

(declare-fun m!1113669 () Bool)

(assert (=> b!1208367 m!1113669))

(assert (=> b!1208367 m!1113651))

(declare-fun m!1113671 () Bool)

(assert (=> b!1208367 m!1113671))

(assert (=> b!1208368 m!1113651))

(assert (=> b!1208368 m!1113651))

(declare-fun m!1113673 () Bool)

(assert (=> b!1208368 m!1113673))

(assert (=> b!1208369 m!1113659))

(assert (=> b!1208360 m!1113651))

(assert (=> b!1208360 m!1113651))

(assert (=> b!1208360 m!1113653))

(assert (=> b!1208362 m!1113665))

(assert (=> b!1208362 m!1113457))

(assert (=> b!1208362 m!1113667))

(assert (=> b!1208362 m!1113457))

(assert (=> b!1208362 m!1113651))

(declare-fun m!1113675 () Bool)

(assert (=> b!1208362 m!1113675))

(assert (=> b!1208362 m!1113651))

(assert (=> b!1208362 m!1113665))

(assert (=> b!1208080 d!133085))

(declare-fun d!133087 () Bool)

(declare-fun res!803240 () Bool)

(declare-fun e!686257 () Bool)

(assert (=> d!133087 (=> res!803240 e!686257)))

(assert (=> d!133087 (= res!803240 (= (select (arr!37666 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133087 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!686257)))

(declare-fun b!1208374 () Bool)

(declare-fun e!686258 () Bool)

(assert (=> b!1208374 (= e!686257 e!686258)))

(declare-fun res!803241 () Bool)

(assert (=> b!1208374 (=> (not res!803241) (not e!686258))))

(assert (=> b!1208374 (= res!803241 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38204 _keys!1208)))))

(declare-fun b!1208375 () Bool)

(assert (=> b!1208375 (= e!686258 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133087 (not res!803240)) b!1208374))

(assert (= (and b!1208374 res!803241) b!1208375))

(declare-fun m!1113677 () Bool)

(assert (=> d!133087 m!1113677))

(declare-fun m!1113679 () Bool)

(assert (=> b!1208375 m!1113679))

(assert (=> b!1208101 d!133087))

(declare-fun d!133089 () Bool)

(assert (=> d!133089 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548272 () Unit!39890)

(declare-fun choose!13 (array!78054 (_ BitVec 64) (_ BitVec 32)) Unit!39890)

(assert (=> d!133089 (= lt!548272 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133089 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133089 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!548272)))

(declare-fun bs!34131 () Bool)

(assert (= bs!34131 d!133089))

(assert (=> bs!34131 m!1113447))

(declare-fun m!1113681 () Bool)

(assert (=> bs!34131 m!1113681))

(assert (=> b!1208101 d!133089))

(declare-fun d!133091 () Bool)

(declare-fun res!803242 () Bool)

(declare-fun e!686259 () Bool)

(assert (=> d!133091 (=> res!803242 e!686259)))

(assert (=> d!133091 (= res!803242 (= (select (arr!37666 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133091 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!686259)))

(declare-fun b!1208376 () Bool)

(declare-fun e!686260 () Bool)

(assert (=> b!1208376 (= e!686259 e!686260)))

(declare-fun res!803243 () Bool)

(assert (=> b!1208376 (=> (not res!803243) (not e!686260))))

(assert (=> b!1208376 (= res!803243 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38204 _keys!1208)))))

(declare-fun b!1208377 () Bool)

(assert (=> b!1208377 (= e!686260 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133091 (not res!803242)) b!1208376))

(assert (= (and b!1208376 res!803243) b!1208377))

(assert (=> d!133091 m!1113651))

(declare-fun m!1113683 () Bool)

(assert (=> b!1208377 m!1113683))

(assert (=> b!1208098 d!133091))

(declare-fun d!133093 () Bool)

(assert (=> d!133093 (= (array_inv!28802 _keys!1208) (bvsge (size!38204 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100900 d!133093))

(declare-fun d!133095 () Bool)

(assert (=> d!133095 (= (array_inv!28803 _values!996) (bvsge (size!38205 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100900 d!133095))

(declare-fun d!133097 () Bool)

(declare-fun e!686261 () Bool)

(assert (=> d!133097 e!686261))

(declare-fun res!803245 () Bool)

(assert (=> d!133097 (=> (not res!803245) (not e!686261))))

(declare-fun lt!548276 () ListLongMap!17803)

(assert (=> d!133097 (= res!803245 (contains!6917 lt!548276 (_1!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!548273 () List!26616)

(assert (=> d!133097 (= lt!548276 (ListLongMap!17804 lt!548273))))

(declare-fun lt!548275 () Unit!39890)

(declare-fun lt!548274 () Unit!39890)

(assert (=> d!133097 (= lt!548275 lt!548274)))

(assert (=> d!133097 (= (getValueByKey!639 lt!548273 (_1!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!689 (_2!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133097 (= lt!548274 (lemmaContainsTupThenGetReturnValue!315 lt!548273 (_1!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133097 (= lt!548273 (insertStrictlySorted!408 (toList!8917 lt!548117) (_1!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133097 (= (+!4044 lt!548117 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!548276)))

(declare-fun b!1208378 () Bool)

(declare-fun res!803244 () Bool)

(assert (=> b!1208378 (=> (not res!803244) (not e!686261))))

(assert (=> b!1208378 (= res!803244 (= (getValueByKey!639 (toList!8917 lt!548276) (_1!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!689 (_2!9928 (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1208379 () Bool)

(assert (=> b!1208379 (= e!686261 (contains!6921 (toList!8917 lt!548276) (tuple2!19835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133097 res!803245) b!1208378))

(assert (= (and b!1208378 res!803244) b!1208379))

(declare-fun m!1113685 () Bool)

(assert (=> d!133097 m!1113685))

(declare-fun m!1113687 () Bool)

(assert (=> d!133097 m!1113687))

(declare-fun m!1113689 () Bool)

(assert (=> d!133097 m!1113689))

(declare-fun m!1113691 () Bool)

(assert (=> d!133097 m!1113691))

(declare-fun m!1113693 () Bool)

(assert (=> b!1208378 m!1113693))

(declare-fun m!1113695 () Bool)

(assert (=> b!1208379 m!1113695))

(assert (=> b!1208099 d!133097))

(declare-fun d!133099 () Bool)

(assert (=> d!133099 (contains!6917 (+!4044 lt!548110 (tuple2!19835 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!548279 () Unit!39890)

(declare-fun choose!1816 (ListLongMap!17803 (_ BitVec 64) V!46033 (_ BitVec 64)) Unit!39890)

(assert (=> d!133099 (= lt!548279 (choose!1816 lt!548110 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> d!133099 (contains!6917 lt!548110 k0!934)))

(assert (=> d!133099 (= (addStillContains!1028 lt!548110 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934) lt!548279)))

(declare-fun bs!34132 () Bool)

(assert (= bs!34132 d!133099))

(declare-fun m!1113697 () Bool)

(assert (=> bs!34132 m!1113697))

(assert (=> bs!34132 m!1113697))

(declare-fun m!1113699 () Bool)

(assert (=> bs!34132 m!1113699))

(declare-fun m!1113701 () Bool)

(assert (=> bs!34132 m!1113701))

(declare-fun m!1113703 () Bool)

(assert (=> bs!34132 m!1113703))

(assert (=> b!1208099 d!133099))

(declare-fun d!133101 () Bool)

(declare-fun e!686263 () Bool)

(assert (=> d!133101 e!686263))

(declare-fun res!803246 () Bool)

(assert (=> d!133101 (=> res!803246 e!686263)))

(declare-fun lt!548280 () Bool)

(assert (=> d!133101 (= res!803246 (not lt!548280))))

(declare-fun lt!548281 () Bool)

(assert (=> d!133101 (= lt!548280 lt!548281)))

(declare-fun lt!548282 () Unit!39890)

(declare-fun e!686262 () Unit!39890)

(assert (=> d!133101 (= lt!548282 e!686262)))

(declare-fun c!118870 () Bool)

(assert (=> d!133101 (= c!118870 lt!548281)))

(assert (=> d!133101 (= lt!548281 (containsKey!593 (toList!8917 call!59081) k0!934))))

(assert (=> d!133101 (= (contains!6917 call!59081 k0!934) lt!548280)))

(declare-fun b!1208381 () Bool)

(declare-fun lt!548283 () Unit!39890)

(assert (=> b!1208381 (= e!686262 lt!548283)))

(assert (=> b!1208381 (= lt!548283 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8917 call!59081) k0!934))))

(assert (=> b!1208381 (isDefined!465 (getValueByKey!639 (toList!8917 call!59081) k0!934))))

(declare-fun b!1208382 () Bool)

(declare-fun Unit!39900 () Unit!39890)

(assert (=> b!1208382 (= e!686262 Unit!39900)))

(declare-fun b!1208383 () Bool)

(assert (=> b!1208383 (= e!686263 (isDefined!465 (getValueByKey!639 (toList!8917 call!59081) k0!934)))))

(assert (= (and d!133101 c!118870) b!1208381))

(assert (= (and d!133101 (not c!118870)) b!1208382))

(assert (= (and d!133101 (not res!803246)) b!1208383))

(declare-fun m!1113705 () Bool)

(assert (=> d!133101 m!1113705))

(declare-fun m!1113707 () Bool)

(assert (=> b!1208381 m!1113707))

(declare-fun m!1113709 () Bool)

(assert (=> b!1208381 m!1113709))

(assert (=> b!1208381 m!1113709))

(declare-fun m!1113711 () Bool)

(assert (=> b!1208381 m!1113711))

(assert (=> b!1208383 m!1113709))

(assert (=> b!1208383 m!1113709))

(assert (=> b!1208383 m!1113711))

(assert (=> b!1208099 d!133101))

(declare-fun b!1208384 () Bool)

(declare-fun e!686264 () Bool)

(declare-fun e!686265 () Bool)

(assert (=> b!1208384 (= e!686264 e!686265)))

(declare-fun c!118871 () Bool)

(assert (=> b!1208384 (= c!118871 (validKeyInArray!0 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208385 () Bool)

(declare-fun call!59138 () Bool)

(assert (=> b!1208385 (= e!686265 call!59138)))

(declare-fun bm!59135 () Bool)

(assert (=> bm!59135 (= call!59138 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!118871 (Cons!26611 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000) Nil!26612) Nil!26612)))))

(declare-fun b!1208386 () Bool)

(declare-fun e!686267 () Bool)

(assert (=> b!1208386 (= e!686267 e!686264)))

(declare-fun res!803248 () Bool)

(assert (=> b!1208386 (=> (not res!803248) (not e!686264))))

(declare-fun e!686266 () Bool)

(assert (=> b!1208386 (= res!803248 (not e!686266))))

(declare-fun res!803247 () Bool)

(assert (=> b!1208386 (=> (not res!803247) (not e!686266))))

(assert (=> b!1208386 (= res!803247 (validKeyInArray!0 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1208387 () Bool)

(assert (=> b!1208387 (= e!686265 call!59138)))

(declare-fun b!1208388 () Bool)

(assert (=> b!1208388 (= e!686266 (contains!6920 Nil!26612 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133103 () Bool)

(declare-fun res!803249 () Bool)

(assert (=> d!133103 (=> res!803249 e!686267)))

(assert (=> d!133103 (= res!803249 (bvsge #b00000000000000000000000000000000 (size!38204 _keys!1208)))))

(assert (=> d!133103 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26612) e!686267)))

(assert (= (and d!133103 (not res!803249)) b!1208386))

(assert (= (and b!1208386 res!803247) b!1208388))

(assert (= (and b!1208386 res!803248) b!1208384))

(assert (= (and b!1208384 c!118871) b!1208387))

(assert (= (and b!1208384 (not c!118871)) b!1208385))

(assert (= (or b!1208387 b!1208385) bm!59135))

(assert (=> b!1208384 m!1113677))

(assert (=> b!1208384 m!1113677))

(declare-fun m!1113713 () Bool)

(assert (=> b!1208384 m!1113713))

(assert (=> bm!59135 m!1113677))

(declare-fun m!1113715 () Bool)

(assert (=> bm!59135 m!1113715))

(assert (=> b!1208386 m!1113677))

(assert (=> b!1208386 m!1113677))

(assert (=> b!1208386 m!1113713))

(assert (=> b!1208388 m!1113677))

(assert (=> b!1208388 m!1113677))

(declare-fun m!1113717 () Bool)

(assert (=> b!1208388 m!1113717))

(assert (=> b!1208084 d!133103))

(declare-fun b!1208389 () Bool)

(declare-fun e!686273 () Bool)

(declare-fun lt!548284 () ListLongMap!17803)

(assert (=> b!1208389 (= e!686273 (isEmpty!995 lt!548284))))

(declare-fun b!1208390 () Bool)

(declare-fun e!686271 () Bool)

(declare-fun e!686269 () Bool)

(assert (=> b!1208390 (= e!686271 e!686269)))

(declare-fun c!118873 () Bool)

(declare-fun e!686272 () Bool)

(assert (=> b!1208390 (= c!118873 e!686272)))

(declare-fun res!803253 () Bool)

(assert (=> b!1208390 (=> (not res!803253) (not e!686272))))

(assert (=> b!1208390 (= res!803253 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 lt!548114)))))

(declare-fun b!1208391 () Bool)

(assert (=> b!1208391 (= e!686272 (validKeyInArray!0 (select (arr!37666 lt!548114) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208391 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1208392 () Bool)

(declare-fun e!686274 () ListLongMap!17803)

(declare-fun call!59139 () ListLongMap!17803)

(assert (=> b!1208392 (= e!686274 call!59139)))

(declare-fun b!1208393 () Bool)

(assert (=> b!1208393 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 lt!548114)))))

(assert (=> b!1208393 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38205 lt!548118)))))

(declare-fun e!686270 () Bool)

(assert (=> b!1208393 (= e!686270 (= (apply!959 lt!548284 (select (arr!37666 lt!548114) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19215 (select (arr!37667 lt!548118) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208394 () Bool)

(declare-fun res!803250 () Bool)

(assert (=> b!1208394 (=> (not res!803250) (not e!686271))))

(assert (=> b!1208394 (= res!803250 (not (contains!6917 lt!548284 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133105 () Bool)

(assert (=> d!133105 e!686271))

(declare-fun res!803251 () Bool)

(assert (=> d!133105 (=> (not res!803251) (not e!686271))))

(assert (=> d!133105 (= res!803251 (not (contains!6917 lt!548284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686268 () ListLongMap!17803)

(assert (=> d!133105 (= lt!548284 e!686268)))

(declare-fun c!118874 () Bool)

(assert (=> d!133105 (= c!118874 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 lt!548114)))))

(assert (=> d!133105 (validMask!0 mask!1564)))

(assert (=> d!133105 (= (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548284)))

(declare-fun bm!59136 () Bool)

(assert (=> bm!59136 (= call!59139 (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208395 () Bool)

(assert (=> b!1208395 (= e!686268 (ListLongMap!17804 Nil!26613))))

(declare-fun b!1208396 () Bool)

(assert (=> b!1208396 (= e!686268 e!686274)))

(declare-fun c!118875 () Bool)

(assert (=> b!1208396 (= c!118875 (validKeyInArray!0 (select (arr!37666 lt!548114) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1208397 () Bool)

(assert (=> b!1208397 (= e!686269 e!686273)))

(declare-fun c!118872 () Bool)

(assert (=> b!1208397 (= c!118872 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 lt!548114)))))

(declare-fun b!1208398 () Bool)

(declare-fun lt!548286 () Unit!39890)

(declare-fun lt!548285 () Unit!39890)

(assert (=> b!1208398 (= lt!548286 lt!548285)))

(declare-fun lt!548287 () ListLongMap!17803)

(declare-fun lt!548288 () (_ BitVec 64))

(declare-fun lt!548289 () (_ BitVec 64))

(declare-fun lt!548290 () V!46033)

(assert (=> b!1208398 (not (contains!6917 (+!4044 lt!548287 (tuple2!19835 lt!548289 lt!548290)) lt!548288))))

(assert (=> b!1208398 (= lt!548285 (addStillNotContains!295 lt!548287 lt!548289 lt!548290 lt!548288))))

(assert (=> b!1208398 (= lt!548288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208398 (= lt!548290 (get!19215 (select (arr!37667 lt!548118) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208398 (= lt!548289 (select (arr!37666 lt!548114) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1208398 (= lt!548287 call!59139)))

(assert (=> b!1208398 (= e!686274 (+!4044 call!59139 (tuple2!19835 (select (arr!37666 lt!548114) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19215 (select (arr!37667 lt!548118) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208399 () Bool)

(assert (=> b!1208399 (= e!686269 e!686270)))

(assert (=> b!1208399 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 lt!548114)))))

(declare-fun res!803252 () Bool)

(assert (=> b!1208399 (= res!803252 (contains!6917 lt!548284 (select (arr!37666 lt!548114) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1208399 (=> (not res!803252) (not e!686270))))

(declare-fun b!1208400 () Bool)

(assert (=> b!1208400 (= e!686273 (= lt!548284 (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133105 c!118874) b!1208395))

(assert (= (and d!133105 (not c!118874)) b!1208396))

(assert (= (and b!1208396 c!118875) b!1208398))

(assert (= (and b!1208396 (not c!118875)) b!1208392))

(assert (= (or b!1208398 b!1208392) bm!59136))

(assert (= (and d!133105 res!803251) b!1208394))

(assert (= (and b!1208394 res!803250) b!1208390))

(assert (= (and b!1208390 res!803253) b!1208391))

(assert (= (and b!1208390 c!118873) b!1208399))

(assert (= (and b!1208390 (not c!118873)) b!1208397))

(assert (= (and b!1208399 res!803252) b!1208393))

(assert (= (and b!1208397 c!118872) b!1208400))

(assert (= (and b!1208397 (not c!118872)) b!1208389))

(declare-fun b_lambda!21485 () Bool)

(assert (=> (not b_lambda!21485) (not b!1208393)))

(assert (=> b!1208393 t!39560))

(declare-fun b_and!42985 () Bool)

(assert (= b_and!42983 (and (=> t!39560 result!22131) b_and!42985)))

(declare-fun b_lambda!21487 () Bool)

(assert (=> (not b_lambda!21487) (not b!1208398)))

(assert (=> b!1208398 t!39560))

(declare-fun b_and!42987 () Bool)

(assert (= b_and!42985 (and (=> t!39560 result!22131) b_and!42987)))

(declare-fun m!1113719 () Bool)

(assert (=> b!1208394 m!1113719))

(declare-fun m!1113721 () Bool)

(assert (=> b!1208396 m!1113721))

(assert (=> b!1208396 m!1113721))

(declare-fun m!1113723 () Bool)

(assert (=> b!1208396 m!1113723))

(declare-fun m!1113725 () Bool)

(assert (=> b!1208389 m!1113725))

(declare-fun m!1113727 () Bool)

(assert (=> d!133105 m!1113727))

(assert (=> d!133105 m!1113445))

(declare-fun m!1113729 () Bool)

(assert (=> bm!59136 m!1113729))

(declare-fun m!1113731 () Bool)

(assert (=> b!1208398 m!1113731))

(declare-fun m!1113733 () Bool)

(assert (=> b!1208398 m!1113733))

(declare-fun m!1113735 () Bool)

(assert (=> b!1208398 m!1113735))

(assert (=> b!1208398 m!1113457))

(declare-fun m!1113737 () Bool)

(assert (=> b!1208398 m!1113737))

(assert (=> b!1208398 m!1113457))

(assert (=> b!1208398 m!1113731))

(assert (=> b!1208398 m!1113735))

(declare-fun m!1113739 () Bool)

(assert (=> b!1208398 m!1113739))

(assert (=> b!1208398 m!1113721))

(declare-fun m!1113741 () Bool)

(assert (=> b!1208398 m!1113741))

(assert (=> b!1208399 m!1113721))

(assert (=> b!1208399 m!1113721))

(declare-fun m!1113743 () Bool)

(assert (=> b!1208399 m!1113743))

(assert (=> b!1208400 m!1113729))

(assert (=> b!1208391 m!1113721))

(assert (=> b!1208391 m!1113721))

(assert (=> b!1208391 m!1113723))

(assert (=> b!1208393 m!1113735))

(assert (=> b!1208393 m!1113457))

(assert (=> b!1208393 m!1113737))

(assert (=> b!1208393 m!1113457))

(assert (=> b!1208393 m!1113721))

(declare-fun m!1113745 () Bool)

(assert (=> b!1208393 m!1113745))

(assert (=> b!1208393 m!1113721))

(assert (=> b!1208393 m!1113735))

(assert (=> bm!59072 d!133105))

(declare-fun bm!59141 () Bool)

(declare-fun call!59145 () ListLongMap!17803)

(assert (=> bm!59141 (= call!59145 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59142 () Bool)

(declare-fun call!59144 () ListLongMap!17803)

(assert (=> bm!59142 (= call!59144 (getCurrentListMapNoExtraKeys!5360 (array!78055 (store (arr!37666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38204 _keys!1208)) (array!78057 (store (arr!37667 _values!996) i!673 (ValueCellFull!14630 (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38205 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208407 () Bool)

(declare-fun e!686279 () Bool)

(declare-fun e!686280 () Bool)

(assert (=> b!1208407 (= e!686279 e!686280)))

(declare-fun c!118878 () Bool)

(assert (=> b!1208407 (= c!118878 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1208408 () Bool)

(assert (=> b!1208408 (= e!686280 (= call!59144 call!59145))))

(assert (=> b!1208408 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38205 _values!996)))))

(declare-fun d!133107 () Bool)

(assert (=> d!133107 e!686279))

(declare-fun res!803256 () Bool)

(assert (=> d!133107 (=> (not res!803256) (not e!686279))))

(assert (=> d!133107 (= res!803256 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38204 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38204 _keys!1208))))))))

(declare-fun lt!548293 () Unit!39890)

(declare-fun choose!1817 (array!78054 array!78056 (_ BitVec 32) (_ BitVec 32) V!46033 V!46033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39890)

(assert (=> d!133107 (= lt!548293 (choose!1817 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133107 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38204 _keys!1208)))))

(assert (=> d!133107 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1044 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!548293)))

(declare-fun b!1208409 () Bool)

(assert (=> b!1208409 (= e!686280 (= call!59144 (-!1802 call!59145 k0!934)))))

(assert (=> b!1208409 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38205 _values!996)))))

(assert (= (and d!133107 res!803256) b!1208407))

(assert (= (and b!1208407 c!118878) b!1208409))

(assert (= (and b!1208407 (not c!118878)) b!1208408))

(assert (= (or b!1208409 b!1208408) bm!59141))

(assert (= (or b!1208409 b!1208408) bm!59142))

(declare-fun b_lambda!21489 () Bool)

(assert (=> (not b_lambda!21489) (not bm!59142)))

(assert (=> bm!59142 t!39560))

(declare-fun b_and!42989 () Bool)

(assert (= b_and!42987 (and (=> t!39560 result!22131) b_and!42989)))

(assert (=> bm!59141 m!1113453))

(assert (=> bm!59142 m!1113401))

(assert (=> bm!59142 m!1113457))

(assert (=> bm!59142 m!1113459))

(declare-fun m!1113747 () Bool)

(assert (=> bm!59142 m!1113747))

(declare-fun m!1113749 () Bool)

(assert (=> d!133107 m!1113749))

(declare-fun m!1113751 () Bool)

(assert (=> b!1208409 m!1113751))

(assert (=> b!1208095 d!133107))

(declare-fun d!133109 () Bool)

(assert (=> d!133109 (contains!6917 (+!4044 lt!548117 (tuple2!19835 (ite (or c!118814 c!118817) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118814 c!118817) zeroValue!944 minValue!944))) k0!934)))

(declare-fun lt!548294 () Unit!39890)

(assert (=> d!133109 (= lt!548294 (choose!1816 lt!548117 (ite (or c!118814 c!118817) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118814 c!118817) zeroValue!944 minValue!944) k0!934))))

(assert (=> d!133109 (contains!6917 lt!548117 k0!934)))

(assert (=> d!133109 (= (addStillContains!1028 lt!548117 (ite (or c!118814 c!118817) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118814 c!118817) zeroValue!944 minValue!944) k0!934) lt!548294)))

(declare-fun bs!34133 () Bool)

(assert (= bs!34133 d!133109))

(declare-fun m!1113753 () Bool)

(assert (=> bs!34133 m!1113753))

(assert (=> bs!34133 m!1113753))

(declare-fun m!1113755 () Bool)

(assert (=> bs!34133 m!1113755))

(declare-fun m!1113757 () Bool)

(assert (=> bs!34133 m!1113757))

(assert (=> bs!34133 m!1113463))

(assert (=> bm!59075 d!133109))

(assert (=> b!1208105 d!133091))

(declare-fun d!133111 () Bool)

(declare-fun res!803261 () Bool)

(declare-fun e!686288 () Bool)

(assert (=> d!133111 (=> res!803261 e!686288)))

(assert (=> d!133111 (= res!803261 (bvsge #b00000000000000000000000000000000 (size!38204 lt!548114)))))

(assert (=> d!133111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548114 mask!1564) e!686288)))

(declare-fun b!1208418 () Bool)

(declare-fun e!686289 () Bool)

(assert (=> b!1208418 (= e!686288 e!686289)))

(declare-fun c!118881 () Bool)

(assert (=> b!1208418 (= c!118881 (validKeyInArray!0 (select (arr!37666 lt!548114) #b00000000000000000000000000000000)))))

(declare-fun bm!59145 () Bool)

(declare-fun call!59148 () Bool)

(assert (=> bm!59145 (= call!59148 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!548114 mask!1564))))

(declare-fun b!1208419 () Bool)

(declare-fun e!686287 () Bool)

(assert (=> b!1208419 (= e!686287 call!59148)))

(declare-fun b!1208420 () Bool)

(assert (=> b!1208420 (= e!686289 call!59148)))

(declare-fun b!1208421 () Bool)

(assert (=> b!1208421 (= e!686289 e!686287)))

(declare-fun lt!548303 () (_ BitVec 64))

(assert (=> b!1208421 (= lt!548303 (select (arr!37666 lt!548114) #b00000000000000000000000000000000))))

(declare-fun lt!548302 () Unit!39890)

(assert (=> b!1208421 (= lt!548302 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!548114 lt!548303 #b00000000000000000000000000000000))))

(assert (=> b!1208421 (arrayContainsKey!0 lt!548114 lt!548303 #b00000000000000000000000000000000)))

(declare-fun lt!548301 () Unit!39890)

(assert (=> b!1208421 (= lt!548301 lt!548302)))

(declare-fun res!803262 () Bool)

(declare-datatypes ((SeekEntryResult!9938 0))(
  ( (MissingZero!9938 (index!42123 (_ BitVec 32))) (Found!9938 (index!42124 (_ BitVec 32))) (Intermediate!9938 (undefined!10750 Bool) (index!42125 (_ BitVec 32)) (x!106620 (_ BitVec 32))) (Undefined!9938) (MissingVacant!9938 (index!42126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78054 (_ BitVec 32)) SeekEntryResult!9938)

(assert (=> b!1208421 (= res!803262 (= (seekEntryOrOpen!0 (select (arr!37666 lt!548114) #b00000000000000000000000000000000) lt!548114 mask!1564) (Found!9938 #b00000000000000000000000000000000)))))

(assert (=> b!1208421 (=> (not res!803262) (not e!686287))))

(assert (= (and d!133111 (not res!803261)) b!1208418))

(assert (= (and b!1208418 c!118881) b!1208421))

(assert (= (and b!1208418 (not c!118881)) b!1208420))

(assert (= (and b!1208421 res!803262) b!1208419))

(assert (= (or b!1208419 b!1208420) bm!59145))

(assert (=> b!1208418 m!1113621))

(assert (=> b!1208418 m!1113621))

(assert (=> b!1208418 m!1113623))

(declare-fun m!1113759 () Bool)

(assert (=> bm!59145 m!1113759))

(assert (=> b!1208421 m!1113621))

(declare-fun m!1113761 () Bool)

(assert (=> b!1208421 m!1113761))

(declare-fun m!1113763 () Bool)

(assert (=> b!1208421 m!1113763))

(assert (=> b!1208421 m!1113621))

(declare-fun m!1113765 () Bool)

(assert (=> b!1208421 m!1113765))

(assert (=> b!1208090 d!133111))

(declare-fun d!133113 () Bool)

(declare-fun res!803263 () Bool)

(declare-fun e!686291 () Bool)

(assert (=> d!133113 (=> res!803263 e!686291)))

(assert (=> d!133113 (= res!803263 (bvsge #b00000000000000000000000000000000 (size!38204 _keys!1208)))))

(assert (=> d!133113 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!686291)))

(declare-fun b!1208422 () Bool)

(declare-fun e!686292 () Bool)

(assert (=> b!1208422 (= e!686291 e!686292)))

(declare-fun c!118882 () Bool)

(assert (=> b!1208422 (= c!118882 (validKeyInArray!0 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!59146 () Bool)

(declare-fun call!59149 () Bool)

(assert (=> bm!59146 (= call!59149 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1208423 () Bool)

(declare-fun e!686290 () Bool)

(assert (=> b!1208423 (= e!686290 call!59149)))

(declare-fun b!1208424 () Bool)

(assert (=> b!1208424 (= e!686292 call!59149)))

(declare-fun b!1208425 () Bool)

(assert (=> b!1208425 (= e!686292 e!686290)))

(declare-fun lt!548306 () (_ BitVec 64))

(assert (=> b!1208425 (= lt!548306 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!548305 () Unit!39890)

(assert (=> b!1208425 (= lt!548305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!548306 #b00000000000000000000000000000000))))

(assert (=> b!1208425 (arrayContainsKey!0 _keys!1208 lt!548306 #b00000000000000000000000000000000)))

(declare-fun lt!548304 () Unit!39890)

(assert (=> b!1208425 (= lt!548304 lt!548305)))

(declare-fun res!803264 () Bool)

(assert (=> b!1208425 (= res!803264 (= (seekEntryOrOpen!0 (select (arr!37666 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9938 #b00000000000000000000000000000000)))))

(assert (=> b!1208425 (=> (not res!803264) (not e!686290))))

(assert (= (and d!133113 (not res!803263)) b!1208422))

(assert (= (and b!1208422 c!118882) b!1208425))

(assert (= (and b!1208422 (not c!118882)) b!1208424))

(assert (= (and b!1208425 res!803264) b!1208423))

(assert (= (or b!1208423 b!1208424) bm!59146))

(assert (=> b!1208422 m!1113677))

(assert (=> b!1208422 m!1113677))

(assert (=> b!1208422 m!1113713))

(declare-fun m!1113767 () Bool)

(assert (=> bm!59146 m!1113767))

(assert (=> b!1208425 m!1113677))

(declare-fun m!1113769 () Bool)

(assert (=> b!1208425 m!1113769))

(declare-fun m!1113771 () Bool)

(assert (=> b!1208425 m!1113771))

(assert (=> b!1208425 m!1113677))

(declare-fun m!1113773 () Bool)

(assert (=> b!1208425 m!1113773))

(assert (=> b!1208081 d!133113))

(declare-fun d!133115 () Bool)

(assert (=> d!133115 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1208103 d!133115))

(declare-fun d!133117 () Bool)

(assert (=> d!133117 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1208093 d!133117))

(assert (=> bm!59074 d!133085))

(declare-fun d!133119 () Bool)

(declare-fun e!686294 () Bool)

(assert (=> d!133119 e!686294))

(declare-fun res!803265 () Bool)

(assert (=> d!133119 (=> res!803265 e!686294)))

(declare-fun lt!548307 () Bool)

(assert (=> d!133119 (= res!803265 (not lt!548307))))

(declare-fun lt!548308 () Bool)

(assert (=> d!133119 (= lt!548307 lt!548308)))

(declare-fun lt!548309 () Unit!39890)

(declare-fun e!686293 () Unit!39890)

(assert (=> d!133119 (= lt!548309 e!686293)))

(declare-fun c!118883 () Bool)

(assert (=> d!133119 (= c!118883 lt!548308)))

(assert (=> d!133119 (= lt!548308 (containsKey!593 (toList!8917 (ite c!118814 lt!548110 call!59075)) k0!934))))

(assert (=> d!133119 (= (contains!6917 (ite c!118814 lt!548110 call!59075) k0!934) lt!548307)))

(declare-fun b!1208426 () Bool)

(declare-fun lt!548310 () Unit!39890)

(assert (=> b!1208426 (= e!686293 lt!548310)))

(assert (=> b!1208426 (= lt!548310 (lemmaContainsKeyImpliesGetValueByKeyDefined!422 (toList!8917 (ite c!118814 lt!548110 call!59075)) k0!934))))

(assert (=> b!1208426 (isDefined!465 (getValueByKey!639 (toList!8917 (ite c!118814 lt!548110 call!59075)) k0!934))))

(declare-fun b!1208427 () Bool)

(declare-fun Unit!39901 () Unit!39890)

(assert (=> b!1208427 (= e!686293 Unit!39901)))

(declare-fun b!1208428 () Bool)

(assert (=> b!1208428 (= e!686294 (isDefined!465 (getValueByKey!639 (toList!8917 (ite c!118814 lt!548110 call!59075)) k0!934)))))

(assert (= (and d!133119 c!118883) b!1208426))

(assert (= (and d!133119 (not c!118883)) b!1208427))

(assert (= (and d!133119 (not res!803265)) b!1208428))

(declare-fun m!1113775 () Bool)

(assert (=> d!133119 m!1113775))

(declare-fun m!1113777 () Bool)

(assert (=> b!1208426 m!1113777))

(declare-fun m!1113779 () Bool)

(assert (=> b!1208426 m!1113779))

(assert (=> b!1208426 m!1113779))

(declare-fun m!1113781 () Bool)

(assert (=> b!1208426 m!1113781))

(assert (=> b!1208428 m!1113779))

(assert (=> b!1208428 m!1113779))

(assert (=> b!1208428 m!1113781))

(assert (=> bm!59079 d!133119))

(declare-fun b!1208429 () Bool)

(declare-fun e!686300 () Bool)

(declare-fun lt!548311 () ListLongMap!17803)

(assert (=> b!1208429 (= e!686300 (isEmpty!995 lt!548311))))

(declare-fun b!1208430 () Bool)

(declare-fun e!686298 () Bool)

(declare-fun e!686296 () Bool)

(assert (=> b!1208430 (= e!686298 e!686296)))

(declare-fun c!118885 () Bool)

(declare-fun e!686299 () Bool)

(assert (=> b!1208430 (= c!118885 e!686299)))

(declare-fun res!803269 () Bool)

(assert (=> b!1208430 (=> (not res!803269) (not e!686299))))

(assert (=> b!1208430 (= res!803269 (bvslt from!1455 (size!38204 lt!548114)))))

(declare-fun b!1208431 () Bool)

(assert (=> b!1208431 (= e!686299 (validKeyInArray!0 (select (arr!37666 lt!548114) from!1455)))))

(assert (=> b!1208431 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208432 () Bool)

(declare-fun e!686301 () ListLongMap!17803)

(declare-fun call!59150 () ListLongMap!17803)

(assert (=> b!1208432 (= e!686301 call!59150)))

(declare-fun b!1208433 () Bool)

(assert (=> b!1208433 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38204 lt!548114)))))

(assert (=> b!1208433 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38205 lt!548118)))))

(declare-fun e!686297 () Bool)

(assert (=> b!1208433 (= e!686297 (= (apply!959 lt!548311 (select (arr!37666 lt!548114) from!1455)) (get!19215 (select (arr!37667 lt!548118) from!1455) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208434 () Bool)

(declare-fun res!803266 () Bool)

(assert (=> b!1208434 (=> (not res!803266) (not e!686298))))

(assert (=> b!1208434 (= res!803266 (not (contains!6917 lt!548311 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133121 () Bool)

(assert (=> d!133121 e!686298))

(declare-fun res!803267 () Bool)

(assert (=> d!133121 (=> (not res!803267) (not e!686298))))

(assert (=> d!133121 (= res!803267 (not (contains!6917 lt!548311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686295 () ListLongMap!17803)

(assert (=> d!133121 (= lt!548311 e!686295)))

(declare-fun c!118886 () Bool)

(assert (=> d!133121 (= c!118886 (bvsge from!1455 (size!38204 lt!548114)))))

(assert (=> d!133121 (validMask!0 mask!1564)))

(assert (=> d!133121 (= (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548311)))

(declare-fun bm!59147 () Bool)

(assert (=> bm!59147 (= call!59150 (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208435 () Bool)

(assert (=> b!1208435 (= e!686295 (ListLongMap!17804 Nil!26613))))

(declare-fun b!1208436 () Bool)

(assert (=> b!1208436 (= e!686295 e!686301)))

(declare-fun c!118887 () Bool)

(assert (=> b!1208436 (= c!118887 (validKeyInArray!0 (select (arr!37666 lt!548114) from!1455)))))

(declare-fun b!1208437 () Bool)

(assert (=> b!1208437 (= e!686296 e!686300)))

(declare-fun c!118884 () Bool)

(assert (=> b!1208437 (= c!118884 (bvslt from!1455 (size!38204 lt!548114)))))

(declare-fun b!1208438 () Bool)

(declare-fun lt!548313 () Unit!39890)

(declare-fun lt!548312 () Unit!39890)

(assert (=> b!1208438 (= lt!548313 lt!548312)))

(declare-fun lt!548314 () ListLongMap!17803)

(declare-fun lt!548316 () (_ BitVec 64))

(declare-fun lt!548315 () (_ BitVec 64))

(declare-fun lt!548317 () V!46033)

(assert (=> b!1208438 (not (contains!6917 (+!4044 lt!548314 (tuple2!19835 lt!548316 lt!548317)) lt!548315))))

(assert (=> b!1208438 (= lt!548312 (addStillNotContains!295 lt!548314 lt!548316 lt!548317 lt!548315))))

(assert (=> b!1208438 (= lt!548315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208438 (= lt!548317 (get!19215 (select (arr!37667 lt!548118) from!1455) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208438 (= lt!548316 (select (arr!37666 lt!548114) from!1455))))

(assert (=> b!1208438 (= lt!548314 call!59150)))

(assert (=> b!1208438 (= e!686301 (+!4044 call!59150 (tuple2!19835 (select (arr!37666 lt!548114) from!1455) (get!19215 (select (arr!37667 lt!548118) from!1455) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208439 () Bool)

(assert (=> b!1208439 (= e!686296 e!686297)))

(assert (=> b!1208439 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38204 lt!548114)))))

(declare-fun res!803268 () Bool)

(assert (=> b!1208439 (= res!803268 (contains!6917 lt!548311 (select (arr!37666 lt!548114) from!1455)))))

(assert (=> b!1208439 (=> (not res!803268) (not e!686297))))

(declare-fun b!1208440 () Bool)

(assert (=> b!1208440 (= e!686300 (= lt!548311 (getCurrentListMapNoExtraKeys!5360 lt!548114 lt!548118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133121 c!118886) b!1208435))

(assert (= (and d!133121 (not c!118886)) b!1208436))

(assert (= (and b!1208436 c!118887) b!1208438))

(assert (= (and b!1208436 (not c!118887)) b!1208432))

(assert (= (or b!1208438 b!1208432) bm!59147))

(assert (= (and d!133121 res!803267) b!1208434))

(assert (= (and b!1208434 res!803266) b!1208430))

(assert (= (and b!1208430 res!803269) b!1208431))

(assert (= (and b!1208430 c!118885) b!1208439))

(assert (= (and b!1208430 (not c!118885)) b!1208437))

(assert (= (and b!1208439 res!803268) b!1208433))

(assert (= (and b!1208437 c!118884) b!1208440))

(assert (= (and b!1208437 (not c!118884)) b!1208429))

(declare-fun b_lambda!21491 () Bool)

(assert (=> (not b_lambda!21491) (not b!1208433)))

(assert (=> b!1208433 t!39560))

(declare-fun b_and!42991 () Bool)

(assert (= b_and!42989 (and (=> t!39560 result!22131) b_and!42991)))

(declare-fun b_lambda!21493 () Bool)

(assert (=> (not b_lambda!21493) (not b!1208438)))

(assert (=> b!1208438 t!39560))

(declare-fun b_and!42993 () Bool)

(assert (= b_and!42991 (and (=> t!39560 result!22131) b_and!42993)))

(declare-fun m!1113783 () Bool)

(assert (=> b!1208434 m!1113783))

(declare-fun m!1113785 () Bool)

(assert (=> b!1208436 m!1113785))

(assert (=> b!1208436 m!1113785))

(declare-fun m!1113787 () Bool)

(assert (=> b!1208436 m!1113787))

(declare-fun m!1113789 () Bool)

(assert (=> b!1208429 m!1113789))

(declare-fun m!1113791 () Bool)

(assert (=> d!133121 m!1113791))

(assert (=> d!133121 m!1113445))

(declare-fun m!1113793 () Bool)

(assert (=> bm!59147 m!1113793))

(declare-fun m!1113795 () Bool)

(assert (=> b!1208438 m!1113795))

(declare-fun m!1113797 () Bool)

(assert (=> b!1208438 m!1113797))

(declare-fun m!1113799 () Bool)

(assert (=> b!1208438 m!1113799))

(assert (=> b!1208438 m!1113457))

(declare-fun m!1113801 () Bool)

(assert (=> b!1208438 m!1113801))

(assert (=> b!1208438 m!1113457))

(assert (=> b!1208438 m!1113795))

(assert (=> b!1208438 m!1113799))

(declare-fun m!1113803 () Bool)

(assert (=> b!1208438 m!1113803))

(assert (=> b!1208438 m!1113785))

(declare-fun m!1113805 () Bool)

(assert (=> b!1208438 m!1113805))

(assert (=> b!1208439 m!1113785))

(assert (=> b!1208439 m!1113785))

(declare-fun m!1113807 () Bool)

(assert (=> b!1208439 m!1113807))

(assert (=> b!1208440 m!1113793))

(assert (=> b!1208431 m!1113785))

(assert (=> b!1208431 m!1113785))

(assert (=> b!1208431 m!1113787))

(assert (=> b!1208433 m!1113799))

(assert (=> b!1208433 m!1113457))

(assert (=> b!1208433 m!1113801))

(assert (=> b!1208433 m!1113457))

(assert (=> b!1208433 m!1113785))

(declare-fun m!1113809 () Bool)

(assert (=> b!1208433 m!1113809))

(assert (=> b!1208433 m!1113785))

(assert (=> b!1208433 m!1113799))

(assert (=> b!1208104 d!133121))

(declare-fun b!1208441 () Bool)

(declare-fun e!686307 () Bool)

(declare-fun lt!548318 () ListLongMap!17803)

(assert (=> b!1208441 (= e!686307 (isEmpty!995 lt!548318))))

(declare-fun b!1208442 () Bool)

(declare-fun e!686305 () Bool)

(declare-fun e!686303 () Bool)

(assert (=> b!1208442 (= e!686305 e!686303)))

(declare-fun c!118889 () Bool)

(declare-fun e!686306 () Bool)

(assert (=> b!1208442 (= c!118889 e!686306)))

(declare-fun res!803273 () Bool)

(assert (=> b!1208442 (=> (not res!803273) (not e!686306))))

(assert (=> b!1208442 (= res!803273 (bvslt from!1455 (size!38204 _keys!1208)))))

(declare-fun b!1208443 () Bool)

(assert (=> b!1208443 (= e!686306 (validKeyInArray!0 (select (arr!37666 _keys!1208) from!1455)))))

(assert (=> b!1208443 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1208444 () Bool)

(declare-fun e!686308 () ListLongMap!17803)

(declare-fun call!59151 () ListLongMap!17803)

(assert (=> b!1208444 (= e!686308 call!59151)))

(declare-fun b!1208445 () Bool)

(assert (=> b!1208445 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38204 _keys!1208)))))

(assert (=> b!1208445 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38205 _values!996)))))

(declare-fun e!686304 () Bool)

(assert (=> b!1208445 (= e!686304 (= (apply!959 lt!548318 (select (arr!37666 _keys!1208) from!1455)) (get!19215 (select (arr!37667 _values!996) from!1455) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1208446 () Bool)

(declare-fun res!803270 () Bool)

(assert (=> b!1208446 (=> (not res!803270) (not e!686305))))

(assert (=> b!1208446 (= res!803270 (not (contains!6917 lt!548318 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!133123 () Bool)

(assert (=> d!133123 e!686305))

(declare-fun res!803271 () Bool)

(assert (=> d!133123 (=> (not res!803271) (not e!686305))))

(assert (=> d!133123 (= res!803271 (not (contains!6917 lt!548318 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!686302 () ListLongMap!17803)

(assert (=> d!133123 (= lt!548318 e!686302)))

(declare-fun c!118890 () Bool)

(assert (=> d!133123 (= c!118890 (bvsge from!1455 (size!38204 _keys!1208)))))

(assert (=> d!133123 (validMask!0 mask!1564)))

(assert (=> d!133123 (= (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!548318)))

(declare-fun bm!59148 () Bool)

(assert (=> bm!59148 (= call!59151 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1208447 () Bool)

(assert (=> b!1208447 (= e!686302 (ListLongMap!17804 Nil!26613))))

(declare-fun b!1208448 () Bool)

(assert (=> b!1208448 (= e!686302 e!686308)))

(declare-fun c!118891 () Bool)

(assert (=> b!1208448 (= c!118891 (validKeyInArray!0 (select (arr!37666 _keys!1208) from!1455)))))

(declare-fun b!1208449 () Bool)

(assert (=> b!1208449 (= e!686303 e!686307)))

(declare-fun c!118888 () Bool)

(assert (=> b!1208449 (= c!118888 (bvslt from!1455 (size!38204 _keys!1208)))))

(declare-fun b!1208450 () Bool)

(declare-fun lt!548320 () Unit!39890)

(declare-fun lt!548319 () Unit!39890)

(assert (=> b!1208450 (= lt!548320 lt!548319)))

(declare-fun lt!548324 () V!46033)

(declare-fun lt!548323 () (_ BitVec 64))

(declare-fun lt!548321 () ListLongMap!17803)

(declare-fun lt!548322 () (_ BitVec 64))

(assert (=> b!1208450 (not (contains!6917 (+!4044 lt!548321 (tuple2!19835 lt!548323 lt!548324)) lt!548322))))

(assert (=> b!1208450 (= lt!548319 (addStillNotContains!295 lt!548321 lt!548323 lt!548324 lt!548322))))

(assert (=> b!1208450 (= lt!548322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1208450 (= lt!548324 (get!19215 (select (arr!37667 _values!996) from!1455) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1208450 (= lt!548323 (select (arr!37666 _keys!1208) from!1455))))

(assert (=> b!1208450 (= lt!548321 call!59151)))

(assert (=> b!1208450 (= e!686308 (+!4044 call!59151 (tuple2!19835 (select (arr!37666 _keys!1208) from!1455) (get!19215 (select (arr!37667 _values!996) from!1455) (dynLambda!3225 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1208451 () Bool)

(assert (=> b!1208451 (= e!686303 e!686304)))

(assert (=> b!1208451 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38204 _keys!1208)))))

(declare-fun res!803272 () Bool)

(assert (=> b!1208451 (= res!803272 (contains!6917 lt!548318 (select (arr!37666 _keys!1208) from!1455)))))

(assert (=> b!1208451 (=> (not res!803272) (not e!686304))))

(declare-fun b!1208452 () Bool)

(assert (=> b!1208452 (= e!686307 (= lt!548318 (getCurrentListMapNoExtraKeys!5360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(assert (= (and d!133123 c!118890) b!1208447))

(assert (= (and d!133123 (not c!118890)) b!1208448))

(assert (= (and b!1208448 c!118891) b!1208450))

(assert (= (and b!1208448 (not c!118891)) b!1208444))

(assert (= (or b!1208450 b!1208444) bm!59148))

(assert (= (and d!133123 res!803271) b!1208446))

(assert (= (and b!1208446 res!803270) b!1208442))

(assert (= (and b!1208442 res!803273) b!1208443))

(assert (= (and b!1208442 c!118889) b!1208451))

(assert (= (and b!1208442 (not c!118889)) b!1208449))

(assert (= (and b!1208451 res!803272) b!1208445))

(assert (= (and b!1208449 c!118888) b!1208452))

(assert (= (and b!1208449 (not c!118888)) b!1208441))

(declare-fun b_lambda!21495 () Bool)

(assert (=> (not b_lambda!21495) (not b!1208445)))

(assert (=> b!1208445 t!39560))

(declare-fun b_and!42995 () Bool)

(assert (= b_and!42993 (and (=> t!39560 result!22131) b_and!42995)))

(declare-fun b_lambda!21497 () Bool)

(assert (=> (not b_lambda!21497) (not b!1208450)))

(assert (=> b!1208450 t!39560))

(declare-fun b_and!42997 () Bool)

(assert (= b_and!42995 (and (=> t!39560 result!22131) b_and!42997)))

(declare-fun m!1113811 () Bool)

(assert (=> b!1208446 m!1113811))

(assert (=> b!1208448 m!1113433))

(assert (=> b!1208448 m!1113433))

(assert (=> b!1208448 m!1113603))

(declare-fun m!1113813 () Bool)

(assert (=> b!1208441 m!1113813))

(declare-fun m!1113815 () Bool)

(assert (=> d!133123 m!1113815))

(assert (=> d!133123 m!1113445))

(declare-fun m!1113817 () Bool)

(assert (=> bm!59148 m!1113817))

(declare-fun m!1113819 () Bool)

(assert (=> b!1208450 m!1113819))

(declare-fun m!1113821 () Bool)

(assert (=> b!1208450 m!1113821))

(declare-fun m!1113823 () Bool)

(assert (=> b!1208450 m!1113823))

(assert (=> b!1208450 m!1113457))

(declare-fun m!1113825 () Bool)

(assert (=> b!1208450 m!1113825))

(assert (=> b!1208450 m!1113457))

(assert (=> b!1208450 m!1113819))

(assert (=> b!1208450 m!1113823))

(declare-fun m!1113827 () Bool)

(assert (=> b!1208450 m!1113827))

(assert (=> b!1208450 m!1113433))

(declare-fun m!1113829 () Bool)

(assert (=> b!1208450 m!1113829))

(assert (=> b!1208451 m!1113433))

(assert (=> b!1208451 m!1113433))

(declare-fun m!1113831 () Bool)

(assert (=> b!1208451 m!1113831))

(assert (=> b!1208452 m!1113817))

(assert (=> b!1208443 m!1113433))

(assert (=> b!1208443 m!1113433))

(assert (=> b!1208443 m!1113603))

(assert (=> b!1208445 m!1113823))

(assert (=> b!1208445 m!1113457))

(assert (=> b!1208445 m!1113825))

(assert (=> b!1208445 m!1113457))

(assert (=> b!1208445 m!1113433))

(declare-fun m!1113833 () Bool)

(assert (=> b!1208445 m!1113833))

(assert (=> b!1208445 m!1113433))

(assert (=> b!1208445 m!1113823))

(assert (=> b!1208104 d!133123))

(declare-fun mapIsEmpty!47890 () Bool)

(declare-fun mapRes!47890 () Bool)

(assert (=> mapIsEmpty!47890 mapRes!47890))

(declare-fun b!1208459 () Bool)

(declare-fun e!686313 () Bool)

(assert (=> b!1208459 (= e!686313 tp_is_empty!30679)))

(declare-fun b!1208460 () Bool)

(declare-fun e!686314 () Bool)

(assert (=> b!1208460 (= e!686314 tp_is_empty!30679)))

(declare-fun mapNonEmpty!47890 () Bool)

(declare-fun tp!90950 () Bool)

(assert (=> mapNonEmpty!47890 (= mapRes!47890 (and tp!90950 e!686313))))

(declare-fun mapKey!47890 () (_ BitVec 32))

(declare-fun mapRest!47890 () (Array (_ BitVec 32) ValueCell!14630))

(declare-fun mapValue!47890 () ValueCell!14630)

(assert (=> mapNonEmpty!47890 (= mapRest!47881 (store mapRest!47890 mapKey!47890 mapValue!47890))))

(declare-fun condMapEmpty!47890 () Bool)

(declare-fun mapDefault!47890 () ValueCell!14630)

(assert (=> mapNonEmpty!47881 (= condMapEmpty!47890 (= mapRest!47881 ((as const (Array (_ BitVec 32) ValueCell!14630)) mapDefault!47890)))))

(assert (=> mapNonEmpty!47881 (= tp!90935 (and e!686314 mapRes!47890))))

(assert (= (and mapNonEmpty!47881 condMapEmpty!47890) mapIsEmpty!47890))

(assert (= (and mapNonEmpty!47881 (not condMapEmpty!47890)) mapNonEmpty!47890))

(assert (= (and mapNonEmpty!47890 ((_ is ValueCellFull!14630) mapValue!47890)) b!1208459))

(assert (= (and mapNonEmpty!47881 ((_ is ValueCellFull!14630) mapDefault!47890)) b!1208460))

(declare-fun m!1113835 () Bool)

(assert (=> mapNonEmpty!47890 m!1113835))

(declare-fun b_lambda!21499 () Bool)

(assert (= b_lambda!21487 (or (and start!100900 b_free!25975) b_lambda!21499)))

(declare-fun b_lambda!21501 () Bool)

(assert (= b_lambda!21491 (or (and start!100900 b_free!25975) b_lambda!21501)))

(declare-fun b_lambda!21503 () Bool)

(assert (= b_lambda!21493 (or (and start!100900 b_free!25975) b_lambda!21503)))

(declare-fun b_lambda!21505 () Bool)

(assert (= b_lambda!21481 (or (and start!100900 b_free!25975) b_lambda!21505)))

(declare-fun b_lambda!21507 () Bool)

(assert (= b_lambda!21497 (or (and start!100900 b_free!25975) b_lambda!21507)))

(declare-fun b_lambda!21509 () Bool)

(assert (= b_lambda!21495 (or (and start!100900 b_free!25975) b_lambda!21509)))

(declare-fun b_lambda!21511 () Bool)

(assert (= b_lambda!21483 (or (and start!100900 b_free!25975) b_lambda!21511)))

(declare-fun b_lambda!21513 () Bool)

(assert (= b_lambda!21489 (or (and start!100900 b_free!25975) b_lambda!21513)))

(declare-fun b_lambda!21515 () Bool)

(assert (= b_lambda!21485 (or (and start!100900 b_free!25975) b_lambda!21515)))

(check-sat (not bm!59134) b_and!42997 (not b!1208426) (not b!1208446) (not b!1208431) (not d!133107) (not b!1208331) (not b!1208306) (not b!1208450) (not d!133105) (not b!1208443) (not b!1208388) (not bm!59148) (not b!1208409) (not b_lambda!21503) (not bm!59135) (not d!133097) (not b_lambda!21511) (not b!1208333) (not d!133101) (not d!133109) (not b!1208368) (not d!133099) (not b_lambda!21501) (not b!1208433) (not b!1208418) (not b!1208386) (not bm!59147) (not b!1208369) (not bm!59145) (not b!1208398) (not d!133089) (not b!1208363) (not d!133119) (not b!1208425) (not b!1208391) (not b!1208381) (not d!133081) (not b!1208378) (not b!1208421) tp_is_empty!30679 (not bm!59136) (not b!1208428) (not b!1208438) (not b!1208399) (not bm!59141) (not b!1208324) (not b!1208375) (not b!1208451) (not b!1208316) (not b!1208384) (not b!1208362) (not b!1208436) (not b!1208314) (not d!133085) (not b!1208377) (not b!1208429) (not b_lambda!21499) (not d!133123) (not bm!59130) (not b_lambda!21509) (not b!1208365) (not b!1208394) (not b!1208383) (not b!1208389) (not bm!59142) (not b!1208313) (not b!1208452) (not d!133121) (not b!1208445) (not b!1208379) (not bm!59131) (not b!1208440) (not d!133073) (not b!1208441) (not b_lambda!21515) (not b!1208299) (not b!1208301) (not b_lambda!21513) (not b!1208318) (not d!133075) (not b_lambda!21479) (not mapNonEmpty!47890) (not b_lambda!21505) (not b!1208439) (not b!1208367) (not b!1208448) (not b!1208297) (not b_next!25975) (not b!1208393) (not b!1208396) (not b!1208323) (not d!133071) (not b!1208400) (not b!1208360) (not b!1208434) (not b!1208358) (not d!133083) (not b!1208422) (not bm!59146) (not b_lambda!21507) (not b!1208312))
(check-sat b_and!42997 (not b_next!25975))
