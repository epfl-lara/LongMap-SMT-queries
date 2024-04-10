; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101088 () Bool)

(assert start!101088)

(declare-fun b_free!26049 () Bool)

(declare-fun b_next!26049 () Bool)

(assert (=> start!101088 (= b_free!26049 (not b_next!26049))))

(declare-fun tp!91165 () Bool)

(declare-fun b_and!43197 () Bool)

(assert (=> start!101088 (= tp!91165 b_and!43197)))

(declare-fun b!1212104 () Bool)

(declare-fun res!805101 () Bool)

(declare-fun e!688377 () Bool)

(assert (=> b!1212104 (=> (not res!805101) (not e!688377))))

(declare-datatypes ((array!78293 0))(
  ( (array!78294 (arr!37782 (Array (_ BitVec 32) (_ BitVec 64))) (size!38318 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78293)

(declare-datatypes ((List!26631 0))(
  ( (Nil!26628) (Cons!26627 (h!27836 (_ BitVec 64)) (t!39660 List!26631)) )
))
(declare-fun arrayNoDuplicates!0 (array!78293 (_ BitVec 32) List!26631) Bool)

(assert (=> b!1212104 (= res!805101 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26628))))

(declare-fun bm!60047 () Bool)

(declare-datatypes ((Unit!40197 0))(
  ( (Unit!40198) )
))
(declare-fun call!60054 () Unit!40197)

(declare-fun call!60052 () Unit!40197)

(assert (=> bm!60047 (= call!60054 call!60052)))

(declare-fun b!1212105 () Bool)

(declare-fun res!805097 () Bool)

(declare-fun e!688363 () Bool)

(assert (=> b!1212105 (=> (not res!805097) (not e!688363))))

(declare-fun lt!550732 () array!78293)

(assert (=> b!1212105 (= res!805097 (arrayNoDuplicates!0 lt!550732 #b00000000000000000000000000000000 Nil!26628))))

(declare-datatypes ((V!46131 0))(
  ( (V!46132 (val!15433 Int)) )
))
(declare-fun zeroValue!944 () V!46131)

(declare-datatypes ((tuple2!19830 0))(
  ( (tuple2!19831 (_1!9926 (_ BitVec 64)) (_2!9926 V!46131)) )
))
(declare-datatypes ((List!26632 0))(
  ( (Nil!26629) (Cons!26628 (h!27837 tuple2!19830) (t!39661 List!26632)) )
))
(declare-datatypes ((ListLongMap!17799 0))(
  ( (ListLongMap!17800 (toList!8915 List!26632)) )
))
(declare-fun call!60055 () ListLongMap!17799)

(declare-fun c!119604 () Bool)

(declare-fun bm!60048 () Bool)

(declare-fun lt!550739 () ListLongMap!17799)

(declare-fun c!119602 () Bool)

(declare-fun minValue!944 () V!46131)

(declare-fun +!4033 (ListLongMap!17799 tuple2!19830) ListLongMap!17799)

(assert (=> bm!60048 (= call!60055 (+!4033 lt!550739 (ite (or c!119602 c!119604) (tuple2!19831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19831 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1212107 () Bool)

(declare-fun res!805110 () Bool)

(assert (=> b!1212107 (=> (not res!805110) (not e!688377))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1212107 (= res!805110 (validKeyInArray!0 k0!934))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14667 0))(
  ( (ValueCellFull!14667 (v!18085 V!46131)) (EmptyCell!14667) )
))
(declare-datatypes ((array!78295 0))(
  ( (array!78296 (arr!37783 (Array (_ BitVec 32) ValueCell!14667)) (size!38319 (_ BitVec 32))) )
))
(declare-fun lt!550723 () array!78295)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1212108 () Bool)

(declare-fun lt!550733 () ListLongMap!17799)

(declare-fun e!688361 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5347 (array!78293 array!78295 (_ BitVec 32) (_ BitVec 32) V!46131 V!46131 (_ BitVec 32) Int) ListLongMap!17799)

(assert (=> b!1212108 (= e!688361 (= lt!550733 (getCurrentListMapNoExtraKeys!5347 lt!550732 lt!550723 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1212109 () Bool)

(assert (=> b!1212109 (= e!688377 e!688363)))

(declare-fun res!805107 () Bool)

(assert (=> b!1212109 (=> (not res!805107) (not e!688363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78293 (_ BitVec 32)) Bool)

(assert (=> b!1212109 (= res!805107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550732 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1212109 (= lt!550732 (array!78294 (store (arr!37782 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38318 _keys!1208)))))

(declare-fun b!1212110 () Bool)

(declare-fun e!688376 () Bool)

(declare-fun e!688371 () Bool)

(assert (=> b!1212110 (= e!688376 e!688371)))

(declare-fun res!805100 () Bool)

(assert (=> b!1212110 (=> res!805100 e!688371)))

(assert (=> b!1212110 (= res!805100 (not (= (select (arr!37782 _keys!1208) from!1455) k0!934)))))

(declare-fun e!688364 () Bool)

(assert (=> b!1212110 e!688364))

(declare-fun c!119601 () Bool)

(assert (=> b!1212110 (= c!119601 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!78295)

(declare-fun lt!550724 () Unit!40197)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1073 (array!78293 array!78295 (_ BitVec 32) (_ BitVec 32) V!46131 V!46131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40197)

(assert (=> b!1212110 (= lt!550724 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1073 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212111 () Bool)

(declare-fun e!688373 () Bool)

(declare-fun arrayContainsKey!0 (array!78293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1212111 (= e!688373 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212112 () Bool)

(declare-fun res!805111 () Bool)

(assert (=> b!1212112 (=> (not res!805111) (not e!688377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1212112 (= res!805111 (validMask!0 mask!1564))))

(declare-fun bm!60049 () Bool)

(declare-fun call!60050 () ListLongMap!17799)

(assert (=> bm!60049 (= call!60050 (getCurrentListMapNoExtraKeys!5347 lt!550732 lt!550723 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212113 () Bool)

(declare-fun lt!550737 () ListLongMap!17799)

(declare-fun contains!6987 (ListLongMap!17799 (_ BitVec 64)) Bool)

(assert (=> b!1212113 (contains!6987 (+!4033 lt!550737 (tuple2!19831 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550726 () Unit!40197)

(assert (=> b!1212113 (= lt!550726 call!60052)))

(declare-fun call!60056 () Bool)

(assert (=> b!1212113 call!60056))

(assert (=> b!1212113 (= lt!550737 call!60055)))

(declare-fun lt!550727 () Unit!40197)

(declare-fun addStillContains!1060 (ListLongMap!17799 (_ BitVec 64) V!46131 (_ BitVec 64)) Unit!40197)

(assert (=> b!1212113 (= lt!550727 (addStillContains!1060 lt!550739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!688369 () Unit!40197)

(assert (=> b!1212113 (= e!688369 lt!550726)))

(declare-fun b!1212114 () Bool)

(declare-fun e!688367 () Bool)

(declare-fun e!688375 () Bool)

(declare-fun mapRes!48001 () Bool)

(assert (=> b!1212114 (= e!688367 (and e!688375 mapRes!48001))))

(declare-fun condMapEmpty!48001 () Bool)

(declare-fun mapDefault!48001 () ValueCell!14667)

(assert (=> b!1212114 (= condMapEmpty!48001 (= (arr!37783 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14667)) mapDefault!48001)))))

(declare-fun call!60057 () ListLongMap!17799)

(declare-fun bm!60050 () Bool)

(assert (=> bm!60050 (= call!60056 (contains!6987 (ite c!119602 lt!550737 call!60057) k0!934))))

(declare-fun bm!60051 () Bool)

(assert (=> bm!60051 (= call!60057 call!60055)))

(declare-fun b!1212115 () Bool)

(declare-fun call!60051 () ListLongMap!17799)

(assert (=> b!1212115 (= e!688364 (= call!60050 call!60051))))

(declare-fun b!1212116 () Bool)

(declare-fun e!688374 () Unit!40197)

(declare-fun Unit!40199 () Unit!40197)

(assert (=> b!1212116 (= e!688374 Unit!40199)))

(declare-fun b!1212117 () Bool)

(declare-fun tp_is_empty!30753 () Bool)

(assert (=> b!1212117 (= e!688375 tp_is_empty!30753)))

(declare-fun bm!60052 () Bool)

(assert (=> bm!60052 (= call!60051 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!688368 () Bool)

(declare-fun b!1212118 () Bool)

(assert (=> b!1212118 (= e!688368 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1212119 () Bool)

(assert (=> b!1212119 (= e!688371 true)))

(assert (=> b!1212119 e!688361))

(declare-fun res!805106 () Bool)

(assert (=> b!1212119 (=> (not res!805106) (not e!688361))))

(assert (=> b!1212119 (= res!805106 (= lt!550733 lt!550739))))

(declare-fun lt!550721 () ListLongMap!17799)

(declare-fun -!1863 (ListLongMap!17799 (_ BitVec 64)) ListLongMap!17799)

(assert (=> b!1212119 (= lt!550733 (-!1863 lt!550721 k0!934))))

(declare-fun lt!550722 () V!46131)

(assert (=> b!1212119 (= (-!1863 (+!4033 lt!550739 (tuple2!19831 (select (arr!37782 _keys!1208) from!1455) lt!550722)) (select (arr!37782 _keys!1208) from!1455)) lt!550739)))

(declare-fun lt!550730 () Unit!40197)

(declare-fun addThenRemoveForNewKeyIsSame!280 (ListLongMap!17799 (_ BitVec 64) V!46131) Unit!40197)

(assert (=> b!1212119 (= lt!550730 (addThenRemoveForNewKeyIsSame!280 lt!550739 (select (arr!37782 _keys!1208) from!1455) lt!550722))))

(declare-fun lt!550720 () V!46131)

(declare-fun get!19257 (ValueCell!14667 V!46131) V!46131)

(assert (=> b!1212119 (= lt!550722 (get!19257 (select (arr!37783 _values!996) from!1455) lt!550720))))

(declare-fun lt!550725 () Unit!40197)

(assert (=> b!1212119 (= lt!550725 e!688374)))

(declare-fun c!119605 () Bool)

(assert (=> b!1212119 (= c!119605 (contains!6987 lt!550739 k0!934))))

(assert (=> b!1212119 (= lt!550739 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1212120 () Bool)

(declare-fun e!688362 () Unit!40197)

(declare-fun lt!550738 () Unit!40197)

(assert (=> b!1212120 (= e!688362 lt!550738)))

(assert (=> b!1212120 (= lt!550738 call!60054)))

(declare-fun call!60053 () Bool)

(assert (=> b!1212120 call!60053))

(declare-fun bm!60053 () Bool)

(assert (=> bm!60053 (= call!60052 (addStillContains!1060 (ite c!119602 lt!550737 lt!550739) (ite c!119602 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119604 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119602 minValue!944 (ite c!119604 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1212121 () Bool)

(assert (=> b!1212121 call!60053))

(declare-fun lt!550734 () Unit!40197)

(assert (=> b!1212121 (= lt!550734 call!60054)))

(declare-fun e!688365 () Unit!40197)

(assert (=> b!1212121 (= e!688365 lt!550734)))

(declare-fun b!1212122 () Bool)

(declare-fun lt!550735 () Bool)

(assert (=> b!1212122 (= c!119604 (and (not lt!550735) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1212122 (= e!688369 e!688362)))

(declare-fun b!1212106 () Bool)

(assert (=> b!1212106 (= e!688364 (= call!60050 (-!1863 call!60051 k0!934)))))

(declare-fun res!805098 () Bool)

(assert (=> start!101088 (=> (not res!805098) (not e!688377))))

(assert (=> start!101088 (= res!805098 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38318 _keys!1208))))))

(assert (=> start!101088 e!688377))

(assert (=> start!101088 tp_is_empty!30753))

(declare-fun array_inv!28782 (array!78293) Bool)

(assert (=> start!101088 (array_inv!28782 _keys!1208)))

(assert (=> start!101088 true))

(assert (=> start!101088 tp!91165))

(declare-fun array_inv!28783 (array!78295) Bool)

(assert (=> start!101088 (and (array_inv!28783 _values!996) e!688367)))

(declare-fun b!1212123 () Bool)

(assert (=> b!1212123 (= e!688368 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550735) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1212124 () Bool)

(declare-fun Unit!40200 () Unit!40197)

(assert (=> b!1212124 (= e!688365 Unit!40200)))

(declare-fun b!1212125 () Bool)

(assert (=> b!1212125 (= e!688362 e!688365)))

(declare-fun c!119603 () Bool)

(assert (=> b!1212125 (= c!119603 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550735))))

(declare-fun b!1212126 () Bool)

(declare-fun e!688370 () Bool)

(assert (=> b!1212126 (= e!688370 tp_is_empty!30753)))

(declare-fun b!1212127 () Bool)

(declare-fun res!805108 () Bool)

(assert (=> b!1212127 (=> (not res!805108) (not e!688377))))

(assert (=> b!1212127 (= res!805108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1212128 () Bool)

(declare-fun res!805104 () Bool)

(assert (=> b!1212128 (=> (not res!805104) (not e!688377))))

(assert (=> b!1212128 (= res!805104 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38318 _keys!1208))))))

(declare-fun bm!60054 () Bool)

(assert (=> bm!60054 (= call!60053 call!60056)))

(declare-fun b!1212129 () Bool)

(declare-fun e!688372 () Bool)

(assert (=> b!1212129 (= e!688372 e!688376)))

(declare-fun res!805105 () Bool)

(assert (=> b!1212129 (=> res!805105 e!688376)))

(assert (=> b!1212129 (= res!805105 (not (= from!1455 i!673)))))

(declare-fun lt!550731 () ListLongMap!17799)

(assert (=> b!1212129 (= lt!550731 (getCurrentListMapNoExtraKeys!5347 lt!550732 lt!550723 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1212129 (= lt!550723 (array!78296 (store (arr!37783 _values!996) i!673 (ValueCellFull!14667 lt!550720)) (size!38319 _values!996)))))

(declare-fun dynLambda!3241 (Int (_ BitVec 64)) V!46131)

(assert (=> b!1212129 (= lt!550720 (dynLambda!3241 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1212129 (= lt!550721 (getCurrentListMapNoExtraKeys!5347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1212130 () Bool)

(declare-fun res!805109 () Bool)

(assert (=> b!1212130 (=> (not res!805109) (not e!688377))))

(assert (=> b!1212130 (= res!805109 (= (select (arr!37782 _keys!1208) i!673) k0!934))))

(declare-fun b!1212131 () Bool)

(assert (=> b!1212131 (= e!688363 (not e!688372))))

(declare-fun res!805102 () Bool)

(assert (=> b!1212131 (=> res!805102 e!688372)))

(assert (=> b!1212131 (= res!805102 (bvsgt from!1455 i!673))))

(assert (=> b!1212131 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550729 () Unit!40197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78293 (_ BitVec 64) (_ BitVec 32)) Unit!40197)

(assert (=> b!1212131 (= lt!550729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1212132 () Bool)

(declare-fun res!805103 () Bool)

(assert (=> b!1212132 (=> (not res!805103) (not e!688377))))

(assert (=> b!1212132 (= res!805103 (and (= (size!38319 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38318 _keys!1208) (size!38319 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!48001 () Bool)

(assert (=> mapIsEmpty!48001 mapRes!48001))

(declare-fun mapNonEmpty!48001 () Bool)

(declare-fun tp!91166 () Bool)

(assert (=> mapNonEmpty!48001 (= mapRes!48001 (and tp!91166 e!688370))))

(declare-fun mapValue!48001 () ValueCell!14667)

(declare-fun mapKey!48001 () (_ BitVec 32))

(declare-fun mapRest!48001 () (Array (_ BitVec 32) ValueCell!14667))

(assert (=> mapNonEmpty!48001 (= (arr!37783 _values!996) (store mapRest!48001 mapKey!48001 mapValue!48001))))

(declare-fun b!1212133 () Bool)

(declare-fun Unit!40201 () Unit!40197)

(assert (=> b!1212133 (= e!688374 Unit!40201)))

(assert (=> b!1212133 (= lt!550735 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1212133 (= c!119602 (and (not lt!550735) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550719 () Unit!40197)

(assert (=> b!1212133 (= lt!550719 e!688369)))

(declare-fun lt!550728 () Unit!40197)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!610 (array!78293 array!78295 (_ BitVec 32) (_ BitVec 32) V!46131 V!46131 (_ BitVec 64) (_ BitVec 32) Int) Unit!40197)

(assert (=> b!1212133 (= lt!550728 (lemmaListMapContainsThenArrayContainsFrom!610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119600 () Bool)

(assert (=> b!1212133 (= c!119600 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805099 () Bool)

(assert (=> b!1212133 (= res!805099 e!688368)))

(assert (=> b!1212133 (=> (not res!805099) (not e!688373))))

(assert (=> b!1212133 e!688373))

(declare-fun lt!550718 () Unit!40197)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78293 (_ BitVec 32) (_ BitVec 32)) Unit!40197)

(assert (=> b!1212133 (= lt!550718 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1212133 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26628)))

(declare-fun lt!550736 () Unit!40197)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78293 (_ BitVec 64) (_ BitVec 32) List!26631) Unit!40197)

(assert (=> b!1212133 (= lt!550736 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26628))))

(assert (=> b!1212133 false))

(assert (= (and start!101088 res!805098) b!1212112))

(assert (= (and b!1212112 res!805111) b!1212132))

(assert (= (and b!1212132 res!805103) b!1212127))

(assert (= (and b!1212127 res!805108) b!1212104))

(assert (= (and b!1212104 res!805101) b!1212128))

(assert (= (and b!1212128 res!805104) b!1212107))

(assert (= (and b!1212107 res!805110) b!1212130))

(assert (= (and b!1212130 res!805109) b!1212109))

(assert (= (and b!1212109 res!805107) b!1212105))

(assert (= (and b!1212105 res!805097) b!1212131))

(assert (= (and b!1212131 (not res!805102)) b!1212129))

(assert (= (and b!1212129 (not res!805105)) b!1212110))

(assert (= (and b!1212110 c!119601) b!1212106))

(assert (= (and b!1212110 (not c!119601)) b!1212115))

(assert (= (or b!1212106 b!1212115) bm!60049))

(assert (= (or b!1212106 b!1212115) bm!60052))

(assert (= (and b!1212110 (not res!805100)) b!1212119))

(assert (= (and b!1212119 c!119605) b!1212133))

(assert (= (and b!1212119 (not c!119605)) b!1212116))

(assert (= (and b!1212133 c!119602) b!1212113))

(assert (= (and b!1212133 (not c!119602)) b!1212122))

(assert (= (and b!1212122 c!119604) b!1212120))

(assert (= (and b!1212122 (not c!119604)) b!1212125))

(assert (= (and b!1212125 c!119603) b!1212121))

(assert (= (and b!1212125 (not c!119603)) b!1212124))

(assert (= (or b!1212120 b!1212121) bm!60047))

(assert (= (or b!1212120 b!1212121) bm!60051))

(assert (= (or b!1212120 b!1212121) bm!60054))

(assert (= (or b!1212113 bm!60054) bm!60050))

(assert (= (or b!1212113 bm!60047) bm!60053))

(assert (= (or b!1212113 bm!60051) bm!60048))

(assert (= (and b!1212133 c!119600) b!1212118))

(assert (= (and b!1212133 (not c!119600)) b!1212123))

(assert (= (and b!1212133 res!805099) b!1212111))

(assert (= (and b!1212119 res!805106) b!1212108))

(assert (= (and b!1212114 condMapEmpty!48001) mapIsEmpty!48001))

(assert (= (and b!1212114 (not condMapEmpty!48001)) mapNonEmpty!48001))

(get-info :version)

(assert (= (and mapNonEmpty!48001 ((_ is ValueCellFull!14667) mapValue!48001)) b!1212126))

(assert (= (and b!1212114 ((_ is ValueCellFull!14667) mapDefault!48001)) b!1212117))

(assert (= start!101088 b!1212114))

(declare-fun b_lambda!21687 () Bool)

(assert (=> (not b_lambda!21687) (not b!1212129)))

(declare-fun t!39659 () Bool)

(declare-fun tb!10849 () Bool)

(assert (=> (and start!101088 (= defaultEntry!1004 defaultEntry!1004) t!39659) tb!10849))

(declare-fun result!22293 () Bool)

(assert (=> tb!10849 (= result!22293 tp_is_empty!30753)))

(assert (=> b!1212129 t!39659))

(declare-fun b_and!43199 () Bool)

(assert (= b_and!43197 (and (=> t!39659 result!22293) b_and!43199)))

(declare-fun m!1117479 () Bool)

(assert (=> b!1212108 m!1117479))

(declare-fun m!1117481 () Bool)

(assert (=> b!1212105 m!1117481))

(declare-fun m!1117483 () Bool)

(assert (=> b!1212130 m!1117483))

(declare-fun m!1117485 () Bool)

(assert (=> b!1212113 m!1117485))

(assert (=> b!1212113 m!1117485))

(declare-fun m!1117487 () Bool)

(assert (=> b!1212113 m!1117487))

(declare-fun m!1117489 () Bool)

(assert (=> b!1212113 m!1117489))

(declare-fun m!1117491 () Bool)

(assert (=> b!1212111 m!1117491))

(declare-fun m!1117493 () Bool)

(assert (=> bm!60050 m!1117493))

(declare-fun m!1117495 () Bool)

(assert (=> bm!60052 m!1117495))

(declare-fun m!1117497 () Bool)

(assert (=> b!1212110 m!1117497))

(declare-fun m!1117499 () Bool)

(assert (=> b!1212110 m!1117499))

(declare-fun m!1117501 () Bool)

(assert (=> b!1212107 m!1117501))

(assert (=> b!1212118 m!1117491))

(declare-fun m!1117503 () Bool)

(assert (=> bm!60048 m!1117503))

(assert (=> b!1212119 m!1117495))

(declare-fun m!1117505 () Bool)

(assert (=> b!1212119 m!1117505))

(declare-fun m!1117507 () Bool)

(assert (=> b!1212119 m!1117507))

(assert (=> b!1212119 m!1117497))

(declare-fun m!1117509 () Bool)

(assert (=> b!1212119 m!1117509))

(assert (=> b!1212119 m!1117507))

(declare-fun m!1117511 () Bool)

(assert (=> b!1212119 m!1117511))

(assert (=> b!1212119 m!1117505))

(declare-fun m!1117513 () Bool)

(assert (=> b!1212119 m!1117513))

(assert (=> b!1212119 m!1117497))

(declare-fun m!1117515 () Bool)

(assert (=> b!1212119 m!1117515))

(declare-fun m!1117517 () Bool)

(assert (=> b!1212119 m!1117517))

(assert (=> b!1212119 m!1117497))

(declare-fun m!1117519 () Bool)

(assert (=> b!1212129 m!1117519))

(declare-fun m!1117521 () Bool)

(assert (=> b!1212129 m!1117521))

(declare-fun m!1117523 () Bool)

(assert (=> b!1212129 m!1117523))

(declare-fun m!1117525 () Bool)

(assert (=> b!1212129 m!1117525))

(declare-fun m!1117527 () Bool)

(assert (=> b!1212133 m!1117527))

(declare-fun m!1117529 () Bool)

(assert (=> b!1212133 m!1117529))

(declare-fun m!1117531 () Bool)

(assert (=> b!1212133 m!1117531))

(declare-fun m!1117533 () Bool)

(assert (=> b!1212133 m!1117533))

(declare-fun m!1117535 () Bool)

(assert (=> b!1212109 m!1117535))

(declare-fun m!1117537 () Bool)

(assert (=> b!1212109 m!1117537))

(declare-fun m!1117539 () Bool)

(assert (=> start!101088 m!1117539))

(declare-fun m!1117541 () Bool)

(assert (=> start!101088 m!1117541))

(declare-fun m!1117543 () Bool)

(assert (=> b!1212127 m!1117543))

(declare-fun m!1117545 () Bool)

(assert (=> b!1212104 m!1117545))

(assert (=> bm!60049 m!1117479))

(declare-fun m!1117547 () Bool)

(assert (=> b!1212106 m!1117547))

(declare-fun m!1117549 () Bool)

(assert (=> mapNonEmpty!48001 m!1117549))

(declare-fun m!1117551 () Bool)

(assert (=> b!1212112 m!1117551))

(declare-fun m!1117553 () Bool)

(assert (=> bm!60053 m!1117553))

(declare-fun m!1117555 () Bool)

(assert (=> b!1212131 m!1117555))

(declare-fun m!1117557 () Bool)

(assert (=> b!1212131 m!1117557))

(check-sat (not b!1212110) (not b!1212118) (not b!1212106) (not b!1212108) (not b_lambda!21687) (not b!1212127) (not bm!60052) (not b!1212111) (not b!1212112) (not start!101088) (not b!1212129) (not b!1212133) (not b!1212107) (not bm!60048) (not b_next!26049) (not b!1212104) (not b!1212131) tp_is_empty!30753 b_and!43199 (not bm!60049) (not bm!60053) (not bm!60050) (not b!1212109) (not mapNonEmpty!48001) (not b!1212119) (not b!1212113) (not b!1212105))
(check-sat b_and!43199 (not b_next!26049))
