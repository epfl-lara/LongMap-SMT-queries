; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101334 () Bool)

(assert start!101334)

(declare-fun b_free!26059 () Bool)

(declare-fun b_next!26059 () Bool)

(assert (=> start!101334 (= b_free!26059 (not b_next!26059))))

(declare-fun tp!91195 () Bool)

(declare-fun b_and!43219 () Bool)

(assert (=> start!101334 (= tp!91195 b_and!43219)))

(declare-datatypes ((V!46145 0))(
  ( (V!46146 (val!15438 Int)) )
))
(declare-datatypes ((tuple2!19850 0))(
  ( (tuple2!19851 (_1!9936 (_ BitVec 64)) (_2!9936 V!46145)) )
))
(declare-datatypes ((List!26652 0))(
  ( (Nil!26649) (Cons!26648 (h!27866 tuple2!19850) (t!39683 List!26652)) )
))
(declare-datatypes ((ListLongMap!17827 0))(
  ( (ListLongMap!17828 (toList!8929 List!26652)) )
))
(declare-fun lt!551537 () ListLongMap!17827)

(declare-fun call!60239 () ListLongMap!17827)

(declare-fun c!120091 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!60236 () Bool)

(declare-fun bm!60232 () Bool)

(declare-fun contains!7023 (ListLongMap!17827 (_ BitVec 64)) Bool)

(assert (=> bm!60232 (= call!60236 (contains!7023 (ite c!120091 lt!551537 call!60239) k0!934))))

(declare-fun zeroValue!944 () V!46145)

(declare-datatypes ((array!78345 0))(
  ( (array!78346 (arr!37802 (Array (_ BitVec 32) (_ BitVec 64))) (size!38339 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!60233 () Bool)

(declare-datatypes ((ValueCell!14672 0))(
  ( (ValueCellFull!14672 (v!18086 V!46145)) (EmptyCell!14672) )
))
(declare-datatypes ((array!78347 0))(
  ( (array!78348 (arr!37803 (Array (_ BitVec 32) ValueCell!14672)) (size!38340 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78347)

(declare-fun minValue!944 () V!46145)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun call!60237 () ListLongMap!17827)

(declare-fun getCurrentListMapNoExtraKeys!5388 (array!78345 array!78347 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 32) Int) ListLongMap!17827)

(assert (=> bm!60233 (= call!60237 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213851 () Bool)

(declare-fun e!689457 () Bool)

(declare-fun tp_is_empty!30763 () Bool)

(assert (=> b!1213851 (= e!689457 tp_is_empty!30763)))

(declare-fun b!1213852 () Bool)

(declare-fun res!805838 () Bool)

(declare-fun e!689452 () Bool)

(assert (=> b!1213852 (=> (not res!805838) (not e!689452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1213852 (= res!805838 (validKeyInArray!0 k0!934))))

(declare-fun b!1213853 () Bool)

(declare-fun e!689462 () Bool)

(declare-fun arrayContainsKey!0 (array!78345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1213853 (= e!689462 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213854 () Bool)

(declare-fun res!805841 () Bool)

(assert (=> b!1213854 (=> (not res!805841) (not e!689452))))

(assert (=> b!1213854 (= res!805841 (and (= (size!38340 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38339 _keys!1208) (size!38340 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1213855 () Bool)

(declare-fun res!805830 () Bool)

(assert (=> b!1213855 (=> (not res!805830) (not e!689452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1213855 (= res!805830 (validMask!0 mask!1564))))

(declare-fun res!805836 () Bool)

(assert (=> start!101334 (=> (not res!805836) (not e!689452))))

(assert (=> start!101334 (= res!805836 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38339 _keys!1208))))))

(assert (=> start!101334 e!689452))

(assert (=> start!101334 tp_is_empty!30763))

(declare-fun array_inv!28852 (array!78345) Bool)

(assert (=> start!101334 (array_inv!28852 _keys!1208)))

(assert (=> start!101334 true))

(assert (=> start!101334 tp!91195))

(declare-fun e!689455 () Bool)

(declare-fun array_inv!28853 (array!78347) Bool)

(assert (=> start!101334 (and (array_inv!28853 _values!996) e!689455)))

(declare-fun b!1213856 () Bool)

(declare-fun call!60242 () ListLongMap!17827)

(assert (=> b!1213856 (contains!7023 call!60242 k0!934)))

(declare-datatypes ((Unit!40169 0))(
  ( (Unit!40170) )
))
(declare-fun lt!551532 () Unit!40169)

(declare-fun call!60240 () Unit!40169)

(assert (=> b!1213856 (= lt!551532 call!60240)))

(assert (=> b!1213856 call!60236))

(declare-fun lt!551529 () ListLongMap!17827)

(declare-fun +!4086 (ListLongMap!17827 tuple2!19850) ListLongMap!17827)

(assert (=> b!1213856 (= lt!551537 (+!4086 lt!551529 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!551541 () Unit!40169)

(declare-fun addStillContains!1070 (ListLongMap!17827 (_ BitVec 64) V!46145 (_ BitVec 64)) Unit!40169)

(assert (=> b!1213856 (= lt!551541 (addStillContains!1070 lt!551529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!689461 () Unit!40169)

(assert (=> b!1213856 (= e!689461 lt!551532)))

(declare-fun b!1213857 () Bool)

(declare-fun e!689447 () Bool)

(declare-fun mapRes!48016 () Bool)

(assert (=> b!1213857 (= e!689455 (and e!689447 mapRes!48016))))

(declare-fun condMapEmpty!48016 () Bool)

(declare-fun mapDefault!48016 () ValueCell!14672)

(assert (=> b!1213857 (= condMapEmpty!48016 (= (arr!37803 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14672)) mapDefault!48016)))))

(declare-fun b!1213858 () Bool)

(declare-fun res!805835 () Bool)

(declare-fun e!689448 () Bool)

(assert (=> b!1213858 (=> (not res!805835) (not e!689448))))

(declare-fun lt!551530 () array!78345)

(declare-datatypes ((List!26653 0))(
  ( (Nil!26650) (Cons!26649 (h!27867 (_ BitVec 64)) (t!39684 List!26653)) )
))
(declare-fun arrayNoDuplicates!0 (array!78345 (_ BitVec 32) List!26653) Bool)

(assert (=> b!1213858 (= res!805835 (arrayNoDuplicates!0 lt!551530 #b00000000000000000000000000000000 Nil!26650))))

(declare-fun b!1213859 () Bool)

(assert (=> b!1213859 (= e!689452 e!689448)))

(declare-fun res!805828 () Bool)

(assert (=> b!1213859 (=> (not res!805828) (not e!689448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78345 (_ BitVec 32)) Bool)

(assert (=> b!1213859 (= res!805828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551530 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1213859 (= lt!551530 (array!78346 (store (arr!37802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38339 _keys!1208)))))

(declare-fun b!1213860 () Bool)

(assert (=> b!1213860 (= e!689447 tp_is_empty!30763)))

(declare-fun b!1213861 () Bool)

(declare-fun e!689449 () Bool)

(declare-fun call!60235 () ListLongMap!17827)

(assert (=> b!1213861 (= e!689449 (= call!60235 call!60237))))

(declare-fun lt!551539 () array!78347)

(declare-fun bm!60234 () Bool)

(assert (=> bm!60234 (= call!60235 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1213862 () Bool)

(declare-fun res!805842 () Bool)

(assert (=> b!1213862 (=> (not res!805842) (not e!689452))))

(assert (=> b!1213862 (= res!805842 (= (select (arr!37802 _keys!1208) i!673) k0!934))))

(declare-fun b!1213863 () Bool)

(declare-fun c!120089 () Bool)

(declare-fun lt!551546 () Bool)

(assert (=> b!1213863 (= c!120089 (and (not lt!551546) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!689456 () Unit!40169)

(assert (=> b!1213863 (= e!689461 e!689456)))

(declare-fun bm!60235 () Bool)

(assert (=> bm!60235 (= call!60242 (+!4086 (ite c!120091 lt!551537 lt!551529) (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1213864 () Bool)

(declare-fun call!60238 () Bool)

(assert (=> b!1213864 call!60238))

(declare-fun lt!551535 () Unit!40169)

(declare-fun call!60241 () Unit!40169)

(assert (=> b!1213864 (= lt!551535 call!60241)))

(declare-fun e!689450 () Unit!40169)

(assert (=> b!1213864 (= e!689450 lt!551535)))

(declare-fun b!1213865 () Bool)

(declare-fun res!805829 () Bool)

(assert (=> b!1213865 (=> (not res!805829) (not e!689452))))

(assert (=> b!1213865 (= res!805829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1213866 () Bool)

(declare-fun Unit!40171 () Unit!40169)

(assert (=> b!1213866 (= e!689450 Unit!40171)))

(declare-fun b!1213867 () Bool)

(declare-fun res!805839 () Bool)

(assert (=> b!1213867 (=> (not res!805839) (not e!689452))))

(assert (=> b!1213867 (= res!805839 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26650))))

(declare-fun b!1213868 () Bool)

(declare-fun e!689463 () Bool)

(assert (=> b!1213868 (= e!689448 (not e!689463))))

(declare-fun res!805831 () Bool)

(assert (=> b!1213868 (=> res!805831 e!689463)))

(assert (=> b!1213868 (= res!805831 (bvsgt from!1455 i!673))))

(assert (=> b!1213868 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551543 () Unit!40169)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78345 (_ BitVec 64) (_ BitVec 32)) Unit!40169)

(assert (=> b!1213868 (= lt!551543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!60236 () Bool)

(assert (=> bm!60236 (= call!60238 call!60236)))

(declare-fun mapIsEmpty!48016 () Bool)

(assert (=> mapIsEmpty!48016 mapRes!48016))

(declare-fun b!1213869 () Bool)

(declare-fun -!1855 (ListLongMap!17827 (_ BitVec 64)) ListLongMap!17827)

(assert (=> b!1213869 (= e!689449 (= call!60235 (-!1855 call!60237 k0!934)))))

(declare-fun b!1213870 () Bool)

(assert (=> b!1213870 (= e!689462 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!551546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1213871 () Bool)

(assert (=> b!1213871 (= e!689456 e!689450)))

(declare-fun c!120093 () Bool)

(assert (=> b!1213871 (= c!120093 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!551546))))

(declare-fun b!1213872 () Bool)

(declare-fun e!689453 () Bool)

(assert (=> b!1213872 (= e!689463 e!689453)))

(declare-fun res!805840 () Bool)

(assert (=> b!1213872 (=> res!805840 e!689453)))

(assert (=> b!1213872 (= res!805840 (not (= from!1455 i!673)))))

(declare-fun lt!551528 () ListLongMap!17827)

(assert (=> b!1213872 (= lt!551528 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!551531 () V!46145)

(assert (=> b!1213872 (= lt!551539 (array!78348 (store (arr!37803 _values!996) i!673 (ValueCellFull!14672 lt!551531)) (size!38340 _values!996)))))

(declare-fun dynLambda!3302 (Int (_ BitVec 64)) V!46145)

(assert (=> b!1213872 (= lt!551531 (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!551544 () ListLongMap!17827)

(assert (=> b!1213872 (= lt!551544 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1213873 () Bool)

(declare-fun e!689460 () Bool)

(assert (=> b!1213873 (= e!689453 e!689460)))

(declare-fun res!805834 () Bool)

(assert (=> b!1213873 (=> res!805834 e!689460)))

(assert (=> b!1213873 (= res!805834 (not (= (select (arr!37802 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1213873 e!689449))

(declare-fun c!120088 () Bool)

(assert (=> b!1213873 (= c!120088 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!551533 () Unit!40169)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 (array!78345 array!78347 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40169)

(assert (=> b!1213873 (= lt!551533 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!689451 () Bool)

(declare-fun b!1213874 () Bool)

(assert (=> b!1213874 (= e!689451 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1213875 () Bool)

(declare-fun e!689454 () Unit!40169)

(declare-fun Unit!40172 () Unit!40169)

(assert (=> b!1213875 (= e!689454 Unit!40172)))

(declare-fun bm!60237 () Bool)

(assert (=> bm!60237 (= call!60240 (addStillContains!1070 (ite c!120091 lt!551537 lt!551529) (ite c!120091 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120089 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120091 minValue!944 (ite c!120089 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!60238 () Bool)

(assert (=> bm!60238 (= call!60241 call!60240)))

(declare-fun bm!60239 () Bool)

(assert (=> bm!60239 (= call!60239 call!60242)))

(declare-fun b!1213876 () Bool)

(declare-fun res!805837 () Bool)

(assert (=> b!1213876 (=> (not res!805837) (not e!689452))))

(assert (=> b!1213876 (= res!805837 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38339 _keys!1208))))))

(declare-fun lt!551538 () ListLongMap!17827)

(declare-fun b!1213877 () Bool)

(declare-fun e!689459 () Bool)

(assert (=> b!1213877 (= e!689459 (= lt!551538 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1213878 () Bool)

(assert (=> b!1213878 (= e!689460 (= lt!551538 lt!551528))))

(assert (=> b!1213878 e!689459))

(declare-fun res!805832 () Bool)

(assert (=> b!1213878 (=> (not res!805832) (not e!689459))))

(assert (=> b!1213878 (= res!805832 (= lt!551538 lt!551529))))

(assert (=> b!1213878 (= lt!551538 (-!1855 lt!551544 k0!934))))

(declare-fun lt!551542 () V!46145)

(assert (=> b!1213878 (= (-!1855 (+!4086 lt!551529 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)) (select (arr!37802 _keys!1208) from!1455)) lt!551529)))

(declare-fun lt!551536 () Unit!40169)

(declare-fun addThenRemoveForNewKeyIsSame!282 (ListLongMap!17827 (_ BitVec 64) V!46145) Unit!40169)

(assert (=> b!1213878 (= lt!551536 (addThenRemoveForNewKeyIsSame!282 lt!551529 (select (arr!37802 _keys!1208) from!1455) lt!551542))))

(declare-fun get!19313 (ValueCell!14672 V!46145) V!46145)

(assert (=> b!1213878 (= lt!551542 (get!19313 (select (arr!37803 _values!996) from!1455) lt!551531))))

(declare-fun lt!551540 () Unit!40169)

(assert (=> b!1213878 (= lt!551540 e!689454)))

(declare-fun c!120090 () Bool)

(assert (=> b!1213878 (= c!120090 (contains!7023 lt!551529 k0!934))))

(assert (=> b!1213878 (= lt!551529 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!48016 () Bool)

(declare-fun tp!91196 () Bool)

(assert (=> mapNonEmpty!48016 (= mapRes!48016 (and tp!91196 e!689457))))

(declare-fun mapValue!48016 () ValueCell!14672)

(declare-fun mapKey!48016 () (_ BitVec 32))

(declare-fun mapRest!48016 () (Array (_ BitVec 32) ValueCell!14672))

(assert (=> mapNonEmpty!48016 (= (arr!37803 _values!996) (store mapRest!48016 mapKey!48016 mapValue!48016))))

(declare-fun b!1213879 () Bool)

(declare-fun lt!551545 () Unit!40169)

(assert (=> b!1213879 (= e!689456 lt!551545)))

(assert (=> b!1213879 (= lt!551545 call!60241)))

(assert (=> b!1213879 call!60238))

(declare-fun b!1213880 () Bool)

(declare-fun Unit!40173 () Unit!40169)

(assert (=> b!1213880 (= e!689454 Unit!40173)))

(assert (=> b!1213880 (= lt!551546 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1213880 (= c!120091 (and (not lt!551546) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!551548 () Unit!40169)

(assert (=> b!1213880 (= lt!551548 e!689461)))

(declare-fun lt!551549 () Unit!40169)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!618 (array!78345 array!78347 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 64) (_ BitVec 32) Int) Unit!40169)

(assert (=> b!1213880 (= lt!551549 (lemmaListMapContainsThenArrayContainsFrom!618 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!120092 () Bool)

(assert (=> b!1213880 (= c!120092 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!805833 () Bool)

(assert (=> b!1213880 (= res!805833 e!689462)))

(assert (=> b!1213880 (=> (not res!805833) (not e!689451))))

(assert (=> b!1213880 e!689451))

(declare-fun lt!551534 () Unit!40169)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78345 (_ BitVec 32) (_ BitVec 32)) Unit!40169)

(assert (=> b!1213880 (= lt!551534 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1213880 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26650)))

(declare-fun lt!551547 () Unit!40169)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78345 (_ BitVec 64) (_ BitVec 32) List!26653) Unit!40169)

(assert (=> b!1213880 (= lt!551547 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26650))))

(assert (=> b!1213880 false))

(assert (= (and start!101334 res!805836) b!1213855))

(assert (= (and b!1213855 res!805830) b!1213854))

(assert (= (and b!1213854 res!805841) b!1213865))

(assert (= (and b!1213865 res!805829) b!1213867))

(assert (= (and b!1213867 res!805839) b!1213876))

(assert (= (and b!1213876 res!805837) b!1213852))

(assert (= (and b!1213852 res!805838) b!1213862))

(assert (= (and b!1213862 res!805842) b!1213859))

(assert (= (and b!1213859 res!805828) b!1213858))

(assert (= (and b!1213858 res!805835) b!1213868))

(assert (= (and b!1213868 (not res!805831)) b!1213872))

(assert (= (and b!1213872 (not res!805840)) b!1213873))

(assert (= (and b!1213873 c!120088) b!1213869))

(assert (= (and b!1213873 (not c!120088)) b!1213861))

(assert (= (or b!1213869 b!1213861) bm!60234))

(assert (= (or b!1213869 b!1213861) bm!60233))

(assert (= (and b!1213873 (not res!805834)) b!1213878))

(assert (= (and b!1213878 c!120090) b!1213880))

(assert (= (and b!1213878 (not c!120090)) b!1213875))

(assert (= (and b!1213880 c!120091) b!1213856))

(assert (= (and b!1213880 (not c!120091)) b!1213863))

(assert (= (and b!1213863 c!120089) b!1213879))

(assert (= (and b!1213863 (not c!120089)) b!1213871))

(assert (= (and b!1213871 c!120093) b!1213864))

(assert (= (and b!1213871 (not c!120093)) b!1213866))

(assert (= (or b!1213879 b!1213864) bm!60238))

(assert (= (or b!1213879 b!1213864) bm!60239))

(assert (= (or b!1213879 b!1213864) bm!60236))

(assert (= (or b!1213856 bm!60236) bm!60232))

(assert (= (or b!1213856 bm!60238) bm!60237))

(assert (= (or b!1213856 bm!60239) bm!60235))

(assert (= (and b!1213880 c!120092) b!1213853))

(assert (= (and b!1213880 (not c!120092)) b!1213870))

(assert (= (and b!1213880 res!805833) b!1213874))

(assert (= (and b!1213878 res!805832) b!1213877))

(assert (= (and b!1213857 condMapEmpty!48016) mapIsEmpty!48016))

(assert (= (and b!1213857 (not condMapEmpty!48016)) mapNonEmpty!48016))

(get-info :version)

(assert (= (and mapNonEmpty!48016 ((_ is ValueCellFull!14672) mapValue!48016)) b!1213851))

(assert (= (and b!1213857 ((_ is ValueCellFull!14672) mapDefault!48016)) b!1213860))

(assert (= start!101334 b!1213857))

(declare-fun b_lambda!21691 () Bool)

(assert (=> (not b_lambda!21691) (not b!1213872)))

(declare-fun t!39682 () Bool)

(declare-fun tb!10851 () Bool)

(assert (=> (and start!101334 (= defaultEntry!1004 defaultEntry!1004) t!39682) tb!10851))

(declare-fun result!22305 () Bool)

(assert (=> tb!10851 (= result!22305 tp_is_empty!30763)))

(assert (=> b!1213872 t!39682))

(declare-fun b_and!43221 () Bool)

(assert (= b_and!43219 (and (=> t!39682 result!22305) b_and!43221)))

(declare-fun m!1119459 () Bool)

(assert (=> b!1213867 m!1119459))

(declare-fun m!1119461 () Bool)

(assert (=> b!1213852 m!1119461))

(declare-fun m!1119463 () Bool)

(assert (=> bm!60232 m!1119463))

(declare-fun m!1119465 () Bool)

(assert (=> mapNonEmpty!48016 m!1119465))

(declare-fun m!1119467 () Bool)

(assert (=> b!1213865 m!1119467))

(declare-fun m!1119469 () Bool)

(assert (=> b!1213869 m!1119469))

(declare-fun m!1119471 () Bool)

(assert (=> b!1213862 m!1119471))

(declare-fun m!1119473 () Bool)

(assert (=> b!1213873 m!1119473))

(declare-fun m!1119475 () Bool)

(assert (=> b!1213873 m!1119475))

(declare-fun m!1119477 () Bool)

(assert (=> bm!60234 m!1119477))

(declare-fun m!1119479 () Bool)

(assert (=> start!101334 m!1119479))

(declare-fun m!1119481 () Bool)

(assert (=> start!101334 m!1119481))

(declare-fun m!1119483 () Bool)

(assert (=> b!1213874 m!1119483))

(declare-fun m!1119485 () Bool)

(assert (=> b!1213868 m!1119485))

(declare-fun m!1119487 () Bool)

(assert (=> b!1213868 m!1119487))

(assert (=> b!1213853 m!1119483))

(declare-fun m!1119489 () Bool)

(assert (=> b!1213880 m!1119489))

(declare-fun m!1119491 () Bool)

(assert (=> b!1213880 m!1119491))

(declare-fun m!1119493 () Bool)

(assert (=> b!1213880 m!1119493))

(declare-fun m!1119495 () Bool)

(assert (=> b!1213880 m!1119495))

(declare-fun m!1119497 () Bool)

(assert (=> bm!60235 m!1119497))

(declare-fun m!1119499 () Bool)

(assert (=> bm!60237 m!1119499))

(declare-fun m!1119501 () Bool)

(assert (=> b!1213858 m!1119501))

(declare-fun m!1119503 () Bool)

(assert (=> bm!60233 m!1119503))

(assert (=> b!1213877 m!1119477))

(declare-fun m!1119505 () Bool)

(assert (=> b!1213872 m!1119505))

(declare-fun m!1119507 () Bool)

(assert (=> b!1213872 m!1119507))

(declare-fun m!1119509 () Bool)

(assert (=> b!1213872 m!1119509))

(declare-fun m!1119511 () Bool)

(assert (=> b!1213872 m!1119511))

(declare-fun m!1119513 () Bool)

(assert (=> b!1213856 m!1119513))

(declare-fun m!1119515 () Bool)

(assert (=> b!1213856 m!1119515))

(declare-fun m!1119517 () Bool)

(assert (=> b!1213856 m!1119517))

(declare-fun m!1119519 () Bool)

(assert (=> b!1213855 m!1119519))

(assert (=> b!1213878 m!1119503))

(declare-fun m!1119521 () Bool)

(assert (=> b!1213878 m!1119521))

(assert (=> b!1213878 m!1119473))

(declare-fun m!1119523 () Bool)

(assert (=> b!1213878 m!1119523))

(assert (=> b!1213878 m!1119473))

(declare-fun m!1119525 () Bool)

(assert (=> b!1213878 m!1119525))

(declare-fun m!1119527 () Bool)

(assert (=> b!1213878 m!1119527))

(declare-fun m!1119529 () Bool)

(assert (=> b!1213878 m!1119529))

(declare-fun m!1119531 () Bool)

(assert (=> b!1213878 m!1119531))

(declare-fun m!1119533 () Bool)

(assert (=> b!1213878 m!1119533))

(assert (=> b!1213878 m!1119473))

(assert (=> b!1213878 m!1119527))

(assert (=> b!1213878 m!1119521))

(declare-fun m!1119535 () Bool)

(assert (=> b!1213859 m!1119535))

(declare-fun m!1119537 () Bool)

(assert (=> b!1213859 m!1119537))

(check-sat (not b!1213856) b_and!43221 (not bm!60233) (not b!1213867) (not mapNonEmpty!48016) (not bm!60237) (not start!101334) (not b_lambda!21691) (not b!1213852) (not bm!60234) tp_is_empty!30763 (not b!1213869) (not b!1213873) (not b!1213859) (not bm!60232) (not b!1213858) (not b!1213868) (not b!1213853) (not b!1213855) (not bm!60235) (not b!1213877) (not b!1213880) (not b!1213878) (not b!1213874) (not b!1213872) (not b!1213865) (not b_next!26059))
(check-sat b_and!43221 (not b_next!26059))
(get-model)

(declare-fun b_lambda!21697 () Bool)

(assert (= b_lambda!21691 (or (and start!101334 b_free!26059) b_lambda!21697)))

(check-sat (not b!1213856) b_and!43221 (not bm!60233) (not b!1213867) (not mapNonEmpty!48016) (not start!101334) (not b!1213852) (not bm!60234) tp_is_empty!30763 (not b!1213869) (not b!1213873) (not b!1213859) (not bm!60232) (not b!1213858) (not b!1213868) (not b!1213853) (not b!1213855) (not bm!60235) (not b!1213877) (not b!1213880) (not b!1213878) (not b!1213874) (not b!1213872) (not bm!60237) (not b_lambda!21697) (not b!1213865) (not b_next!26059))
(check-sat b_and!43221 (not b_next!26059))
(get-model)

(declare-fun b!1214091 () Bool)

(declare-fun lt!551701 () Unit!40169)

(declare-fun lt!551696 () Unit!40169)

(assert (=> b!1214091 (= lt!551701 lt!551696)))

(declare-fun lt!551697 () ListLongMap!17827)

(declare-fun lt!551699 () (_ BitVec 64))

(declare-fun lt!551702 () V!46145)

(declare-fun lt!551698 () (_ BitVec 64))

(assert (=> b!1214091 (not (contains!7023 (+!4086 lt!551697 (tuple2!19851 lt!551698 lt!551702)) lt!551699))))

(declare-fun addStillNotContains!299 (ListLongMap!17827 (_ BitVec 64) V!46145 (_ BitVec 64)) Unit!40169)

(assert (=> b!1214091 (= lt!551696 (addStillNotContains!299 lt!551697 lt!551698 lt!551702 lt!551699))))

(assert (=> b!1214091 (= lt!551699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1214091 (= lt!551702 (get!19313 (select (arr!37803 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1214091 (= lt!551698 (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60293 () ListLongMap!17827)

(assert (=> b!1214091 (= lt!551697 call!60293)))

(declare-fun e!689583 () ListLongMap!17827)

(assert (=> b!1214091 (= e!689583 (+!4086 call!60293 (tuple2!19851 (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19313 (select (arr!37803 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1214092 () Bool)

(declare-fun e!689581 () Bool)

(declare-fun e!689580 () Bool)

(assert (=> b!1214092 (= e!689581 e!689580)))

(declare-fun c!120139 () Bool)

(declare-fun e!689584 () Bool)

(assert (=> b!1214092 (= c!120139 e!689584)))

(declare-fun res!805941 () Bool)

(assert (=> b!1214092 (=> (not res!805941) (not e!689584))))

(assert (=> b!1214092 (= res!805941 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 _keys!1208)))))

(declare-fun b!1214093 () Bool)

(declare-fun e!689585 () Bool)

(declare-fun lt!551700 () ListLongMap!17827)

(declare-fun isEmpty!997 (ListLongMap!17827) Bool)

(assert (=> b!1214093 (= e!689585 (isEmpty!997 lt!551700))))

(declare-fun b!1214094 () Bool)

(declare-fun e!689582 () ListLongMap!17827)

(assert (=> b!1214094 (= e!689582 e!689583)))

(declare-fun c!120138 () Bool)

(assert (=> b!1214094 (= c!120138 (validKeyInArray!0 (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1214095 () Bool)

(assert (=> b!1214095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 _keys!1208)))))

(assert (=> b!1214095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38340 _values!996)))))

(declare-fun e!689586 () Bool)

(declare-fun apply!978 (ListLongMap!17827 (_ BitVec 64)) V!46145)

(assert (=> b!1214095 (= e!689586 (= (apply!978 lt!551700 (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19313 (select (arr!37803 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1214096 () Bool)

(assert (=> b!1214096 (= e!689585 (= lt!551700 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1214097 () Bool)

(assert (=> b!1214097 (= e!689580 e!689585)))

(declare-fun c!120141 () Bool)

(assert (=> b!1214097 (= c!120141 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 _keys!1208)))))

(declare-fun b!1214098 () Bool)

(assert (=> b!1214098 (= e!689582 (ListLongMap!17828 Nil!26649))))

(declare-fun b!1214099 () Bool)

(assert (=> b!1214099 (= e!689580 e!689586)))

(assert (=> b!1214099 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 _keys!1208)))))

(declare-fun res!805942 () Bool)

(assert (=> b!1214099 (= res!805942 (contains!7023 lt!551700 (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1214099 (=> (not res!805942) (not e!689586))))

(declare-fun b!1214100 () Bool)

(declare-fun res!805944 () Bool)

(assert (=> b!1214100 (=> (not res!805944) (not e!689581))))

(assert (=> b!1214100 (= res!805944 (not (contains!7023 lt!551700 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1214101 () Bool)

(assert (=> b!1214101 (= e!689583 call!60293)))

(declare-fun d!133871 () Bool)

(assert (=> d!133871 e!689581))

(declare-fun res!805943 () Bool)

(assert (=> d!133871 (=> (not res!805943) (not e!689581))))

(assert (=> d!133871 (= res!805943 (not (contains!7023 lt!551700 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133871 (= lt!551700 e!689582)))

(declare-fun c!120140 () Bool)

(assert (=> d!133871 (= c!120140 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 _keys!1208)))))

(assert (=> d!133871 (validMask!0 mask!1564)))

(assert (=> d!133871 (= (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551700)))

(declare-fun bm!60290 () Bool)

(assert (=> bm!60290 (= call!60293 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1214102 () Bool)

(assert (=> b!1214102 (= e!689584 (validKeyInArray!0 (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1214102 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!133871 c!120140) b!1214098))

(assert (= (and d!133871 (not c!120140)) b!1214094))

(assert (= (and b!1214094 c!120138) b!1214091))

(assert (= (and b!1214094 (not c!120138)) b!1214101))

(assert (= (or b!1214091 b!1214101) bm!60290))

(assert (= (and d!133871 res!805943) b!1214100))

(assert (= (and b!1214100 res!805944) b!1214092))

(assert (= (and b!1214092 res!805941) b!1214102))

(assert (= (and b!1214092 c!120139) b!1214099))

(assert (= (and b!1214092 (not c!120139)) b!1214097))

(assert (= (and b!1214099 res!805942) b!1214095))

(assert (= (and b!1214097 c!120141) b!1214096))

(assert (= (and b!1214097 (not c!120141)) b!1214093))

(declare-fun b_lambda!21699 () Bool)

(assert (=> (not b_lambda!21699) (not b!1214091)))

(assert (=> b!1214091 t!39682))

(declare-fun b_and!43231 () Bool)

(assert (= b_and!43221 (and (=> t!39682 result!22305) b_and!43231)))

(declare-fun b_lambda!21701 () Bool)

(assert (=> (not b_lambda!21701) (not b!1214095)))

(assert (=> b!1214095 t!39682))

(declare-fun b_and!43233 () Bool)

(assert (= b_and!43231 (and (=> t!39682 result!22305) b_and!43233)))

(declare-fun m!1119699 () Bool)

(assert (=> b!1214102 m!1119699))

(assert (=> b!1214102 m!1119699))

(declare-fun m!1119701 () Bool)

(assert (=> b!1214102 m!1119701))

(declare-fun m!1119703 () Bool)

(assert (=> b!1214096 m!1119703))

(assert (=> b!1214091 m!1119699))

(declare-fun m!1119705 () Bool)

(assert (=> b!1214091 m!1119705))

(declare-fun m!1119707 () Bool)

(assert (=> b!1214091 m!1119707))

(declare-fun m!1119709 () Bool)

(assert (=> b!1214091 m!1119709))

(assert (=> b!1214091 m!1119709))

(declare-fun m!1119711 () Bool)

(assert (=> b!1214091 m!1119711))

(assert (=> b!1214091 m!1119509))

(declare-fun m!1119713 () Bool)

(assert (=> b!1214091 m!1119713))

(assert (=> b!1214091 m!1119705))

(assert (=> b!1214091 m!1119509))

(declare-fun m!1119715 () Bool)

(assert (=> b!1214091 m!1119715))

(assert (=> b!1214095 m!1119699))

(assert (=> b!1214095 m!1119705))

(assert (=> b!1214095 m!1119699))

(declare-fun m!1119717 () Bool)

(assert (=> b!1214095 m!1119717))

(assert (=> b!1214095 m!1119509))

(assert (=> b!1214095 m!1119705))

(assert (=> b!1214095 m!1119509))

(assert (=> b!1214095 m!1119715))

(assert (=> b!1214099 m!1119699))

(assert (=> b!1214099 m!1119699))

(declare-fun m!1119719 () Bool)

(assert (=> b!1214099 m!1119719))

(assert (=> bm!60290 m!1119703))

(declare-fun m!1119721 () Bool)

(assert (=> b!1214100 m!1119721))

(declare-fun m!1119723 () Bool)

(assert (=> d!133871 m!1119723))

(assert (=> d!133871 m!1119519))

(assert (=> b!1214094 m!1119699))

(assert (=> b!1214094 m!1119699))

(assert (=> b!1214094 m!1119701))

(declare-fun m!1119725 () Bool)

(assert (=> b!1214093 m!1119725))

(assert (=> bm!60233 d!133871))

(declare-fun d!133873 () Bool)

(assert (=> d!133873 (contains!7023 (+!4086 (ite c!120091 lt!551537 lt!551529) (tuple2!19851 (ite c!120091 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120089 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120091 minValue!944 (ite c!120089 zeroValue!944 minValue!944)))) k0!934)))

(declare-fun lt!551705 () Unit!40169)

(declare-fun choose!1822 (ListLongMap!17827 (_ BitVec 64) V!46145 (_ BitVec 64)) Unit!40169)

(assert (=> d!133873 (= lt!551705 (choose!1822 (ite c!120091 lt!551537 lt!551529) (ite c!120091 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120089 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120091 minValue!944 (ite c!120089 zeroValue!944 minValue!944)) k0!934))))

(assert (=> d!133873 (contains!7023 (ite c!120091 lt!551537 lt!551529) k0!934)))

(assert (=> d!133873 (= (addStillContains!1070 (ite c!120091 lt!551537 lt!551529) (ite c!120091 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!120089 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!120091 minValue!944 (ite c!120089 zeroValue!944 minValue!944)) k0!934) lt!551705)))

(declare-fun bs!34237 () Bool)

(assert (= bs!34237 d!133873))

(declare-fun m!1119727 () Bool)

(assert (=> bs!34237 m!1119727))

(assert (=> bs!34237 m!1119727))

(declare-fun m!1119729 () Bool)

(assert (=> bs!34237 m!1119729))

(declare-fun m!1119731 () Bool)

(assert (=> bs!34237 m!1119731))

(declare-fun m!1119733 () Bool)

(assert (=> bs!34237 m!1119733))

(assert (=> bm!60237 d!133873))

(declare-fun b!1214112 () Bool)

(declare-fun e!689594 () Bool)

(declare-fun call!60296 () Bool)

(assert (=> b!1214112 (= e!689594 call!60296)))

(declare-fun d!133875 () Bool)

(declare-fun res!805949 () Bool)

(declare-fun e!689593 () Bool)

(assert (=> d!133875 (=> res!805949 e!689593)))

(assert (=> d!133875 (= res!805949 (bvsge #b00000000000000000000000000000000 (size!38339 lt!551530)))))

(assert (=> d!133875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!551530 mask!1564) e!689593)))

(declare-fun b!1214113 () Bool)

(assert (=> b!1214113 (= e!689593 e!689594)))

(declare-fun c!120144 () Bool)

(assert (=> b!1214113 (= c!120144 (validKeyInArray!0 (select (arr!37802 lt!551530) #b00000000000000000000000000000000)))))

(declare-fun bm!60293 () Bool)

(assert (=> bm!60293 (= call!60296 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!551530 mask!1564))))

(declare-fun b!1214114 () Bool)

(declare-fun e!689595 () Bool)

(assert (=> b!1214114 (= e!689594 e!689595)))

(declare-fun lt!551714 () (_ BitVec 64))

(assert (=> b!1214114 (= lt!551714 (select (arr!37802 lt!551530) #b00000000000000000000000000000000))))

(declare-fun lt!551712 () Unit!40169)

(assert (=> b!1214114 (= lt!551712 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!551530 lt!551714 #b00000000000000000000000000000000))))

(assert (=> b!1214114 (arrayContainsKey!0 lt!551530 lt!551714 #b00000000000000000000000000000000)))

(declare-fun lt!551713 () Unit!40169)

(assert (=> b!1214114 (= lt!551713 lt!551712)))

(declare-fun res!805950 () Bool)

(declare-datatypes ((SeekEntryResult!9898 0))(
  ( (MissingZero!9898 (index!41963 (_ BitVec 32))) (Found!9898 (index!41964 (_ BitVec 32))) (Intermediate!9898 (undefined!10710 Bool) (index!41965 (_ BitVec 32)) (x!106834 (_ BitVec 32))) (Undefined!9898) (MissingVacant!9898 (index!41966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78345 (_ BitVec 32)) SeekEntryResult!9898)

(assert (=> b!1214114 (= res!805950 (= (seekEntryOrOpen!0 (select (arr!37802 lt!551530) #b00000000000000000000000000000000) lt!551530 mask!1564) (Found!9898 #b00000000000000000000000000000000)))))

(assert (=> b!1214114 (=> (not res!805950) (not e!689595))))

(declare-fun b!1214115 () Bool)

(assert (=> b!1214115 (= e!689595 call!60296)))

(assert (= (and d!133875 (not res!805949)) b!1214113))

(assert (= (and b!1214113 c!120144) b!1214114))

(assert (= (and b!1214113 (not c!120144)) b!1214112))

(assert (= (and b!1214114 res!805950) b!1214115))

(assert (= (or b!1214115 b!1214112) bm!60293))

(declare-fun m!1119735 () Bool)

(assert (=> b!1214113 m!1119735))

(assert (=> b!1214113 m!1119735))

(declare-fun m!1119737 () Bool)

(assert (=> b!1214113 m!1119737))

(declare-fun m!1119739 () Bool)

(assert (=> bm!60293 m!1119739))

(assert (=> b!1214114 m!1119735))

(declare-fun m!1119741 () Bool)

(assert (=> b!1214114 m!1119741))

(declare-fun m!1119743 () Bool)

(assert (=> b!1214114 m!1119743))

(assert (=> b!1214114 m!1119735))

(declare-fun m!1119745 () Bool)

(assert (=> b!1214114 m!1119745))

(assert (=> b!1213859 d!133875))

(declare-fun d!133877 () Bool)

(declare-fun res!805955 () Bool)

(declare-fun e!689600 () Bool)

(assert (=> d!133877 (=> res!805955 e!689600)))

(assert (=> d!133877 (= res!805955 (= (select (arr!37802 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133877 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!689600)))

(declare-fun b!1214120 () Bool)

(declare-fun e!689601 () Bool)

(assert (=> b!1214120 (= e!689600 e!689601)))

(declare-fun res!805956 () Bool)

(assert (=> b!1214120 (=> (not res!805956) (not e!689601))))

(assert (=> b!1214120 (= res!805956 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38339 _keys!1208)))))

(declare-fun b!1214121 () Bool)

(assert (=> b!1214121 (= e!689601 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133877 (not res!805955)) b!1214120))

(assert (= (and b!1214120 res!805956) b!1214121))

(declare-fun m!1119747 () Bool)

(assert (=> d!133877 m!1119747))

(declare-fun m!1119749 () Bool)

(assert (=> b!1214121 m!1119749))

(assert (=> b!1213868 d!133877))

(declare-fun d!133879 () Bool)

(assert (=> d!133879 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!551717 () Unit!40169)

(declare-fun choose!13 (array!78345 (_ BitVec 64) (_ BitVec 32)) Unit!40169)

(assert (=> d!133879 (= lt!551717 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133879 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133879 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!551717)))

(declare-fun bs!34238 () Bool)

(assert (= bs!34238 d!133879))

(assert (=> bs!34238 m!1119485))

(declare-fun m!1119751 () Bool)

(assert (=> bs!34238 m!1119751))

(assert (=> b!1213868 d!133879))

(declare-fun d!133881 () Bool)

(declare-fun e!689606 () Bool)

(assert (=> d!133881 e!689606))

(declare-fun res!805959 () Bool)

(assert (=> d!133881 (=> res!805959 e!689606)))

(declare-fun lt!551729 () Bool)

(assert (=> d!133881 (= res!805959 (not lt!551729))))

(declare-fun lt!551728 () Bool)

(assert (=> d!133881 (= lt!551729 lt!551728)))

(declare-fun lt!551727 () Unit!40169)

(declare-fun e!689607 () Unit!40169)

(assert (=> d!133881 (= lt!551727 e!689607)))

(declare-fun c!120147 () Bool)

(assert (=> d!133881 (= c!120147 lt!551728)))

(declare-fun containsKey!598 (List!26652 (_ BitVec 64)) Bool)

(assert (=> d!133881 (= lt!551728 (containsKey!598 (toList!8929 (ite c!120091 lt!551537 call!60239)) k0!934))))

(assert (=> d!133881 (= (contains!7023 (ite c!120091 lt!551537 call!60239) k0!934) lt!551729)))

(declare-fun b!1214128 () Bool)

(declare-fun lt!551726 () Unit!40169)

(assert (=> b!1214128 (= e!689607 lt!551726)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!426 (List!26652 (_ BitVec 64)) Unit!40169)

(assert (=> b!1214128 (= lt!551726 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!8929 (ite c!120091 lt!551537 call!60239)) k0!934))))

(declare-datatypes ((Option!687 0))(
  ( (Some!686 (v!18089 V!46145)) (None!685) )
))
(declare-fun isDefined!464 (Option!687) Bool)

(declare-fun getValueByKey!636 (List!26652 (_ BitVec 64)) Option!687)

(assert (=> b!1214128 (isDefined!464 (getValueByKey!636 (toList!8929 (ite c!120091 lt!551537 call!60239)) k0!934))))

(declare-fun b!1214129 () Bool)

(declare-fun Unit!40181 () Unit!40169)

(assert (=> b!1214129 (= e!689607 Unit!40181)))

(declare-fun b!1214130 () Bool)

(assert (=> b!1214130 (= e!689606 (isDefined!464 (getValueByKey!636 (toList!8929 (ite c!120091 lt!551537 call!60239)) k0!934)))))

(assert (= (and d!133881 c!120147) b!1214128))

(assert (= (and d!133881 (not c!120147)) b!1214129))

(assert (= (and d!133881 (not res!805959)) b!1214130))

(declare-fun m!1119753 () Bool)

(assert (=> d!133881 m!1119753))

(declare-fun m!1119755 () Bool)

(assert (=> b!1214128 m!1119755))

(declare-fun m!1119757 () Bool)

(assert (=> b!1214128 m!1119757))

(assert (=> b!1214128 m!1119757))

(declare-fun m!1119759 () Bool)

(assert (=> b!1214128 m!1119759))

(assert (=> b!1214130 m!1119757))

(assert (=> b!1214130 m!1119757))

(assert (=> b!1214130 m!1119759))

(assert (=> bm!60232 d!133881))

(declare-fun b!1214141 () Bool)

(declare-fun e!689618 () Bool)

(declare-fun e!689619 () Bool)

(assert (=> b!1214141 (= e!689618 e!689619)))

(declare-fun res!805968 () Bool)

(assert (=> b!1214141 (=> (not res!805968) (not e!689619))))

(declare-fun e!689616 () Bool)

(assert (=> b!1214141 (= res!805968 (not e!689616))))

(declare-fun res!805966 () Bool)

(assert (=> b!1214141 (=> (not res!805966) (not e!689616))))

(assert (=> b!1214141 (= res!805966 (validKeyInArray!0 (select (arr!37802 lt!551530) #b00000000000000000000000000000000)))))

(declare-fun b!1214142 () Bool)

(declare-fun contains!7026 (List!26653 (_ BitVec 64)) Bool)

(assert (=> b!1214142 (= e!689616 (contains!7026 Nil!26650 (select (arr!37802 lt!551530) #b00000000000000000000000000000000)))))

(declare-fun b!1214143 () Bool)

(declare-fun e!689617 () Bool)

(declare-fun call!60299 () Bool)

(assert (=> b!1214143 (= e!689617 call!60299)))

(declare-fun b!1214144 () Bool)

(assert (=> b!1214144 (= e!689619 e!689617)))

(declare-fun c!120150 () Bool)

(assert (=> b!1214144 (= c!120150 (validKeyInArray!0 (select (arr!37802 lt!551530) #b00000000000000000000000000000000)))))

(declare-fun b!1214145 () Bool)

(assert (=> b!1214145 (= e!689617 call!60299)))

(declare-fun d!133883 () Bool)

(declare-fun res!805967 () Bool)

(assert (=> d!133883 (=> res!805967 e!689618)))

(assert (=> d!133883 (= res!805967 (bvsge #b00000000000000000000000000000000 (size!38339 lt!551530)))))

(assert (=> d!133883 (= (arrayNoDuplicates!0 lt!551530 #b00000000000000000000000000000000 Nil!26650) e!689618)))

(declare-fun bm!60296 () Bool)

(assert (=> bm!60296 (= call!60299 (arrayNoDuplicates!0 lt!551530 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120150 (Cons!26649 (select (arr!37802 lt!551530) #b00000000000000000000000000000000) Nil!26650) Nil!26650)))))

(assert (= (and d!133883 (not res!805967)) b!1214141))

(assert (= (and b!1214141 res!805966) b!1214142))

(assert (= (and b!1214141 res!805968) b!1214144))

(assert (= (and b!1214144 c!120150) b!1214145))

(assert (= (and b!1214144 (not c!120150)) b!1214143))

(assert (= (or b!1214145 b!1214143) bm!60296))

(assert (=> b!1214141 m!1119735))

(assert (=> b!1214141 m!1119735))

(assert (=> b!1214141 m!1119737))

(assert (=> b!1214142 m!1119735))

(assert (=> b!1214142 m!1119735))

(declare-fun m!1119761 () Bool)

(assert (=> b!1214142 m!1119761))

(assert (=> b!1214144 m!1119735))

(assert (=> b!1214144 m!1119735))

(assert (=> b!1214144 m!1119737))

(assert (=> bm!60296 m!1119735))

(declare-fun m!1119763 () Bool)

(assert (=> bm!60296 m!1119763))

(assert (=> b!1213858 d!133883))

(declare-fun d!133885 () Bool)

(assert (=> d!133885 (= (array_inv!28852 _keys!1208) (bvsge (size!38339 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101334 d!133885))

(declare-fun d!133887 () Bool)

(assert (=> d!133887 (= (array_inv!28853 _values!996) (bvsge (size!38340 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101334 d!133887))

(declare-fun b!1214146 () Bool)

(declare-fun e!689622 () Bool)

(declare-fun e!689623 () Bool)

(assert (=> b!1214146 (= e!689622 e!689623)))

(declare-fun res!805971 () Bool)

(assert (=> b!1214146 (=> (not res!805971) (not e!689623))))

(declare-fun e!689620 () Bool)

(assert (=> b!1214146 (= res!805971 (not e!689620))))

(declare-fun res!805969 () Bool)

(assert (=> b!1214146 (=> (not res!805969) (not e!689620))))

(assert (=> b!1214146 (= res!805969 (validKeyInArray!0 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1214147 () Bool)

(assert (=> b!1214147 (= e!689620 (contains!7026 Nil!26650 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1214148 () Bool)

(declare-fun e!689621 () Bool)

(declare-fun call!60300 () Bool)

(assert (=> b!1214148 (= e!689621 call!60300)))

(declare-fun b!1214149 () Bool)

(assert (=> b!1214149 (= e!689623 e!689621)))

(declare-fun c!120151 () Bool)

(assert (=> b!1214149 (= c!120151 (validKeyInArray!0 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1214150 () Bool)

(assert (=> b!1214150 (= e!689621 call!60300)))

(declare-fun d!133889 () Bool)

(declare-fun res!805970 () Bool)

(assert (=> d!133889 (=> res!805970 e!689622)))

(assert (=> d!133889 (= res!805970 (bvsge #b00000000000000000000000000000000 (size!38339 _keys!1208)))))

(assert (=> d!133889 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26650) e!689622)))

(declare-fun bm!60297 () Bool)

(assert (=> bm!60297 (= call!60300 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120151 (Cons!26649 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000) Nil!26650) Nil!26650)))))

(assert (= (and d!133889 (not res!805970)) b!1214146))

(assert (= (and b!1214146 res!805969) b!1214147))

(assert (= (and b!1214146 res!805971) b!1214149))

(assert (= (and b!1214149 c!120151) b!1214150))

(assert (= (and b!1214149 (not c!120151)) b!1214148))

(assert (= (or b!1214150 b!1214148) bm!60297))

(assert (=> b!1214146 m!1119747))

(assert (=> b!1214146 m!1119747))

(declare-fun m!1119765 () Bool)

(assert (=> b!1214146 m!1119765))

(assert (=> b!1214147 m!1119747))

(assert (=> b!1214147 m!1119747))

(declare-fun m!1119767 () Bool)

(assert (=> b!1214147 m!1119767))

(assert (=> b!1214149 m!1119747))

(assert (=> b!1214149 m!1119747))

(assert (=> b!1214149 m!1119765))

(assert (=> bm!60297 m!1119747))

(declare-fun m!1119769 () Bool)

(assert (=> bm!60297 m!1119769))

(assert (=> b!1213867 d!133889))

(declare-fun d!133891 () Bool)

(declare-fun e!689624 () Bool)

(assert (=> d!133891 e!689624))

(declare-fun res!805972 () Bool)

(assert (=> d!133891 (=> res!805972 e!689624)))

(declare-fun lt!551733 () Bool)

(assert (=> d!133891 (= res!805972 (not lt!551733))))

(declare-fun lt!551732 () Bool)

(assert (=> d!133891 (= lt!551733 lt!551732)))

(declare-fun lt!551731 () Unit!40169)

(declare-fun e!689625 () Unit!40169)

(assert (=> d!133891 (= lt!551731 e!689625)))

(declare-fun c!120152 () Bool)

(assert (=> d!133891 (= c!120152 lt!551732)))

(assert (=> d!133891 (= lt!551732 (containsKey!598 (toList!8929 call!60242) k0!934))))

(assert (=> d!133891 (= (contains!7023 call!60242 k0!934) lt!551733)))

(declare-fun b!1214151 () Bool)

(declare-fun lt!551730 () Unit!40169)

(assert (=> b!1214151 (= e!689625 lt!551730)))

(assert (=> b!1214151 (= lt!551730 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!8929 call!60242) k0!934))))

(assert (=> b!1214151 (isDefined!464 (getValueByKey!636 (toList!8929 call!60242) k0!934))))

(declare-fun b!1214152 () Bool)

(declare-fun Unit!40182 () Unit!40169)

(assert (=> b!1214152 (= e!689625 Unit!40182)))

(declare-fun b!1214153 () Bool)

(assert (=> b!1214153 (= e!689624 (isDefined!464 (getValueByKey!636 (toList!8929 call!60242) k0!934)))))

(assert (= (and d!133891 c!120152) b!1214151))

(assert (= (and d!133891 (not c!120152)) b!1214152))

(assert (= (and d!133891 (not res!805972)) b!1214153))

(declare-fun m!1119771 () Bool)

(assert (=> d!133891 m!1119771))

(declare-fun m!1119773 () Bool)

(assert (=> b!1214151 m!1119773))

(declare-fun m!1119775 () Bool)

(assert (=> b!1214151 m!1119775))

(assert (=> b!1214151 m!1119775))

(declare-fun m!1119777 () Bool)

(assert (=> b!1214151 m!1119777))

(assert (=> b!1214153 m!1119775))

(assert (=> b!1214153 m!1119775))

(assert (=> b!1214153 m!1119777))

(assert (=> b!1213856 d!133891))

(declare-fun d!133893 () Bool)

(declare-fun e!689628 () Bool)

(assert (=> d!133893 e!689628))

(declare-fun res!805977 () Bool)

(assert (=> d!133893 (=> (not res!805977) (not e!689628))))

(declare-fun lt!551743 () ListLongMap!17827)

(assert (=> d!133893 (= res!805977 (contains!7023 lt!551743 (_1!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lt!551744 () List!26652)

(assert (=> d!133893 (= lt!551743 (ListLongMap!17828 lt!551744))))

(declare-fun lt!551742 () Unit!40169)

(declare-fun lt!551745 () Unit!40169)

(assert (=> d!133893 (= lt!551742 lt!551745)))

(assert (=> d!133893 (= (getValueByKey!636 lt!551744 (_1!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!686 (_2!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun lemmaContainsTupThenGetReturnValue!318 (List!26652 (_ BitVec 64) V!46145) Unit!40169)

(assert (=> d!133893 (= lt!551745 (lemmaContainsTupThenGetReturnValue!318 lt!551744 (_1!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(declare-fun insertStrictlySorted!411 (List!26652 (_ BitVec 64) V!46145) List!26652)

(assert (=> d!133893 (= lt!551744 (insertStrictlySorted!411 (toList!8929 lt!551529) (_1!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) (_2!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))))))

(assert (=> d!133893 (= (+!4086 lt!551529 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) lt!551743)))

(declare-fun b!1214158 () Bool)

(declare-fun res!805978 () Bool)

(assert (=> b!1214158 (=> (not res!805978) (not e!689628))))

(assert (=> b!1214158 (= res!805978 (= (getValueByKey!636 (toList!8929 lt!551743) (_1!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944))) (Some!686 (_2!9936 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))))

(declare-fun b!1214159 () Bool)

(declare-fun contains!7027 (List!26652 tuple2!19850) Bool)

(assert (=> b!1214159 (= e!689628 (contains!7027 (toList!8929 lt!551743) (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (= (and d!133893 res!805977) b!1214158))

(assert (= (and b!1214158 res!805978) b!1214159))

(declare-fun m!1119779 () Bool)

(assert (=> d!133893 m!1119779))

(declare-fun m!1119781 () Bool)

(assert (=> d!133893 m!1119781))

(declare-fun m!1119783 () Bool)

(assert (=> d!133893 m!1119783))

(declare-fun m!1119785 () Bool)

(assert (=> d!133893 m!1119785))

(declare-fun m!1119787 () Bool)

(assert (=> b!1214158 m!1119787))

(declare-fun m!1119789 () Bool)

(assert (=> b!1214159 m!1119789))

(assert (=> b!1213856 d!133893))

(declare-fun d!133895 () Bool)

(assert (=> d!133895 (contains!7023 (+!4086 lt!551529 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!551746 () Unit!40169)

(assert (=> d!133895 (= lt!551746 (choose!1822 lt!551529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> d!133895 (contains!7023 lt!551529 k0!934)))

(assert (=> d!133895 (= (addStillContains!1070 lt!551529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934) lt!551746)))

(declare-fun bs!34239 () Bool)

(assert (= bs!34239 d!133895))

(assert (=> bs!34239 m!1119515))

(assert (=> bs!34239 m!1119515))

(declare-fun m!1119791 () Bool)

(assert (=> bs!34239 m!1119791))

(declare-fun m!1119793 () Bool)

(assert (=> bs!34239 m!1119793))

(assert (=> bs!34239 m!1119533))

(assert (=> b!1213856 d!133895))

(declare-fun d!133897 () Bool)

(declare-fun e!689631 () Bool)

(assert (=> d!133897 e!689631))

(declare-fun c!120155 () Bool)

(assert (=> d!133897 (= c!120155 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!551749 () Unit!40169)

(declare-fun choose!1823 (array!78345 array!78347 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 64) (_ BitVec 32) Int) Unit!40169)

(assert (=> d!133897 (= lt!551749 (choose!1823 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133897 (validMask!0 mask!1564)))

(assert (=> d!133897 (= (lemmaListMapContainsThenArrayContainsFrom!618 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551749)))

(declare-fun b!1214164 () Bool)

(assert (=> b!1214164 (= e!689631 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1214165 () Bool)

(assert (=> b!1214165 (= e!689631 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!133897 c!120155) b!1214164))

(assert (= (and d!133897 (not c!120155)) b!1214165))

(declare-fun m!1119795 () Bool)

(assert (=> d!133897 m!1119795))

(assert (=> d!133897 m!1119519))

(assert (=> b!1214164 m!1119483))

(assert (=> b!1213880 d!133897))

(declare-fun d!133899 () Bool)

(assert (=> d!133899 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26650)))

(declare-fun lt!551752 () Unit!40169)

(declare-fun choose!39 (array!78345 (_ BitVec 32) (_ BitVec 32)) Unit!40169)

(assert (=> d!133899 (= lt!551752 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133899 (bvslt (size!38339 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133899 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!551752)))

(declare-fun bs!34240 () Bool)

(assert (= bs!34240 d!133899))

(assert (=> bs!34240 m!1119493))

(declare-fun m!1119797 () Bool)

(assert (=> bs!34240 m!1119797))

(assert (=> b!1213880 d!133899))

(declare-fun b!1214166 () Bool)

(declare-fun e!689634 () Bool)

(declare-fun e!689635 () Bool)

(assert (=> b!1214166 (= e!689634 e!689635)))

(declare-fun res!805981 () Bool)

(assert (=> b!1214166 (=> (not res!805981) (not e!689635))))

(declare-fun e!689632 () Bool)

(assert (=> b!1214166 (= res!805981 (not e!689632))))

(declare-fun res!805979 () Bool)

(assert (=> b!1214166 (=> (not res!805979) (not e!689632))))

(assert (=> b!1214166 (= res!805979 (validKeyInArray!0 (select (arr!37802 _keys!1208) from!1455)))))

(declare-fun b!1214167 () Bool)

(assert (=> b!1214167 (= e!689632 (contains!7026 Nil!26650 (select (arr!37802 _keys!1208) from!1455)))))

(declare-fun b!1214168 () Bool)

(declare-fun e!689633 () Bool)

(declare-fun call!60301 () Bool)

(assert (=> b!1214168 (= e!689633 call!60301)))

(declare-fun b!1214169 () Bool)

(assert (=> b!1214169 (= e!689635 e!689633)))

(declare-fun c!120156 () Bool)

(assert (=> b!1214169 (= c!120156 (validKeyInArray!0 (select (arr!37802 _keys!1208) from!1455)))))

(declare-fun b!1214170 () Bool)

(assert (=> b!1214170 (= e!689633 call!60301)))

(declare-fun d!133901 () Bool)

(declare-fun res!805980 () Bool)

(assert (=> d!133901 (=> res!805980 e!689634)))

(assert (=> d!133901 (= res!805980 (bvsge from!1455 (size!38339 _keys!1208)))))

(assert (=> d!133901 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26650) e!689634)))

(declare-fun bm!60298 () Bool)

(assert (=> bm!60298 (= call!60301 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120156 (Cons!26649 (select (arr!37802 _keys!1208) from!1455) Nil!26650) Nil!26650)))))

(assert (= (and d!133901 (not res!805980)) b!1214166))

(assert (= (and b!1214166 res!805979) b!1214167))

(assert (= (and b!1214166 res!805981) b!1214169))

(assert (= (and b!1214169 c!120156) b!1214170))

(assert (= (and b!1214169 (not c!120156)) b!1214168))

(assert (= (or b!1214170 b!1214168) bm!60298))

(assert (=> b!1214166 m!1119473))

(assert (=> b!1214166 m!1119473))

(declare-fun m!1119799 () Bool)

(assert (=> b!1214166 m!1119799))

(assert (=> b!1214167 m!1119473))

(assert (=> b!1214167 m!1119473))

(declare-fun m!1119801 () Bool)

(assert (=> b!1214167 m!1119801))

(assert (=> b!1214169 m!1119473))

(assert (=> b!1214169 m!1119473))

(assert (=> b!1214169 m!1119799))

(assert (=> bm!60298 m!1119473))

(declare-fun m!1119803 () Bool)

(assert (=> bm!60298 m!1119803))

(assert (=> b!1213880 d!133901))

(declare-fun d!133903 () Bool)

(assert (=> d!133903 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38339 _keys!1208)) (not (= (select (arr!37802 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!551755 () Unit!40169)

(declare-fun choose!21 (array!78345 (_ BitVec 64) (_ BitVec 32) List!26653) Unit!40169)

(assert (=> d!133903 (= lt!551755 (choose!21 _keys!1208 k0!934 from!1455 Nil!26650))))

(assert (=> d!133903 (bvslt (size!38339 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133903 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26650) lt!551755)))

(declare-fun bs!34241 () Bool)

(assert (= bs!34241 d!133903))

(assert (=> bs!34241 m!1119473))

(declare-fun m!1119805 () Bool)

(assert (=> bs!34241 m!1119805))

(assert (=> b!1213880 d!133903))

(declare-fun b!1214171 () Bool)

(declare-fun e!689637 () Bool)

(declare-fun call!60302 () Bool)

(assert (=> b!1214171 (= e!689637 call!60302)))

(declare-fun d!133905 () Bool)

(declare-fun res!805982 () Bool)

(declare-fun e!689636 () Bool)

(assert (=> d!133905 (=> res!805982 e!689636)))

(assert (=> d!133905 (= res!805982 (bvsge #b00000000000000000000000000000000 (size!38339 _keys!1208)))))

(assert (=> d!133905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!689636)))

(declare-fun b!1214172 () Bool)

(assert (=> b!1214172 (= e!689636 e!689637)))

(declare-fun c!120157 () Bool)

(assert (=> b!1214172 (= c!120157 (validKeyInArray!0 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60299 () Bool)

(assert (=> bm!60299 (= call!60302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1214173 () Bool)

(declare-fun e!689638 () Bool)

(assert (=> b!1214173 (= e!689637 e!689638)))

(declare-fun lt!551758 () (_ BitVec 64))

(assert (=> b!1214173 (= lt!551758 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!551756 () Unit!40169)

(assert (=> b!1214173 (= lt!551756 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!551758 #b00000000000000000000000000000000))))

(assert (=> b!1214173 (arrayContainsKey!0 _keys!1208 lt!551758 #b00000000000000000000000000000000)))

(declare-fun lt!551757 () Unit!40169)

(assert (=> b!1214173 (= lt!551757 lt!551756)))

(declare-fun res!805983 () Bool)

(assert (=> b!1214173 (= res!805983 (= (seekEntryOrOpen!0 (select (arr!37802 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9898 #b00000000000000000000000000000000)))))

(assert (=> b!1214173 (=> (not res!805983) (not e!689638))))

(declare-fun b!1214174 () Bool)

(assert (=> b!1214174 (= e!689638 call!60302)))

(assert (= (and d!133905 (not res!805982)) b!1214172))

(assert (= (and b!1214172 c!120157) b!1214173))

(assert (= (and b!1214172 (not c!120157)) b!1214171))

(assert (= (and b!1214173 res!805983) b!1214174))

(assert (= (or b!1214174 b!1214171) bm!60299))

(assert (=> b!1214172 m!1119747))

(assert (=> b!1214172 m!1119747))

(assert (=> b!1214172 m!1119765))

(declare-fun m!1119807 () Bool)

(assert (=> bm!60299 m!1119807))

(assert (=> b!1214173 m!1119747))

(declare-fun m!1119809 () Bool)

(assert (=> b!1214173 m!1119809))

(declare-fun m!1119811 () Bool)

(assert (=> b!1214173 m!1119811))

(assert (=> b!1214173 m!1119747))

(declare-fun m!1119813 () Bool)

(assert (=> b!1214173 m!1119813))

(assert (=> b!1213865 d!133905))

(declare-fun d!133907 () Bool)

(declare-fun res!805984 () Bool)

(declare-fun e!689639 () Bool)

(assert (=> d!133907 (=> res!805984 e!689639)))

(assert (=> d!133907 (= res!805984 (= (select (arr!37802 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133907 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!689639)))

(declare-fun b!1214175 () Bool)

(declare-fun e!689640 () Bool)

(assert (=> b!1214175 (= e!689639 e!689640)))

(declare-fun res!805985 () Bool)

(assert (=> b!1214175 (=> (not res!805985) (not e!689640))))

(assert (=> b!1214175 (= res!805985 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38339 _keys!1208)))))

(declare-fun b!1214176 () Bool)

(assert (=> b!1214176 (= e!689640 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133907 (not res!805984)) b!1214175))

(assert (= (and b!1214175 res!805985) b!1214176))

(assert (=> d!133907 m!1119699))

(declare-fun m!1119815 () Bool)

(assert (=> b!1214176 m!1119815))

(assert (=> b!1213874 d!133907))

(declare-fun b!1214177 () Bool)

(declare-fun lt!551764 () Unit!40169)

(declare-fun lt!551759 () Unit!40169)

(assert (=> b!1214177 (= lt!551764 lt!551759)))

(declare-fun lt!551762 () (_ BitVec 64))

(declare-fun lt!551760 () ListLongMap!17827)

(declare-fun lt!551761 () (_ BitVec 64))

(declare-fun lt!551765 () V!46145)

(assert (=> b!1214177 (not (contains!7023 (+!4086 lt!551760 (tuple2!19851 lt!551761 lt!551765)) lt!551762))))

(assert (=> b!1214177 (= lt!551759 (addStillNotContains!299 lt!551760 lt!551761 lt!551765 lt!551762))))

(assert (=> b!1214177 (= lt!551762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1214177 (= lt!551765 (get!19313 (select (arr!37803 lt!551539) from!1455) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1214177 (= lt!551761 (select (arr!37802 lt!551530) from!1455))))

(declare-fun call!60303 () ListLongMap!17827)

(assert (=> b!1214177 (= lt!551760 call!60303)))

(declare-fun e!689644 () ListLongMap!17827)

(assert (=> b!1214177 (= e!689644 (+!4086 call!60303 (tuple2!19851 (select (arr!37802 lt!551530) from!1455) (get!19313 (select (arr!37803 lt!551539) from!1455) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1214178 () Bool)

(declare-fun e!689642 () Bool)

(declare-fun e!689641 () Bool)

(assert (=> b!1214178 (= e!689642 e!689641)))

(declare-fun c!120159 () Bool)

(declare-fun e!689645 () Bool)

(assert (=> b!1214178 (= c!120159 e!689645)))

(declare-fun res!805986 () Bool)

(assert (=> b!1214178 (=> (not res!805986) (not e!689645))))

(assert (=> b!1214178 (= res!805986 (bvslt from!1455 (size!38339 lt!551530)))))

(declare-fun b!1214179 () Bool)

(declare-fun e!689646 () Bool)

(declare-fun lt!551763 () ListLongMap!17827)

(assert (=> b!1214179 (= e!689646 (isEmpty!997 lt!551763))))

(declare-fun b!1214180 () Bool)

(declare-fun e!689643 () ListLongMap!17827)

(assert (=> b!1214180 (= e!689643 e!689644)))

(declare-fun c!120158 () Bool)

(assert (=> b!1214180 (= c!120158 (validKeyInArray!0 (select (arr!37802 lt!551530) from!1455)))))

(declare-fun b!1214181 () Bool)

(assert (=> b!1214181 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38339 lt!551530)))))

(assert (=> b!1214181 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38340 lt!551539)))))

(declare-fun e!689647 () Bool)

(assert (=> b!1214181 (= e!689647 (= (apply!978 lt!551763 (select (arr!37802 lt!551530) from!1455)) (get!19313 (select (arr!37803 lt!551539) from!1455) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1214182 () Bool)

(assert (=> b!1214182 (= e!689646 (= lt!551763 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1214183 () Bool)

(assert (=> b!1214183 (= e!689641 e!689646)))

(declare-fun c!120161 () Bool)

(assert (=> b!1214183 (= c!120161 (bvslt from!1455 (size!38339 lt!551530)))))

(declare-fun b!1214184 () Bool)

(assert (=> b!1214184 (= e!689643 (ListLongMap!17828 Nil!26649))))

(declare-fun b!1214185 () Bool)

(assert (=> b!1214185 (= e!689641 e!689647)))

(assert (=> b!1214185 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38339 lt!551530)))))

(declare-fun res!805987 () Bool)

(assert (=> b!1214185 (= res!805987 (contains!7023 lt!551763 (select (arr!37802 lt!551530) from!1455)))))

(assert (=> b!1214185 (=> (not res!805987) (not e!689647))))

(declare-fun b!1214186 () Bool)

(declare-fun res!805989 () Bool)

(assert (=> b!1214186 (=> (not res!805989) (not e!689642))))

(assert (=> b!1214186 (= res!805989 (not (contains!7023 lt!551763 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1214187 () Bool)

(assert (=> b!1214187 (= e!689644 call!60303)))

(declare-fun d!133909 () Bool)

(assert (=> d!133909 e!689642))

(declare-fun res!805988 () Bool)

(assert (=> d!133909 (=> (not res!805988) (not e!689642))))

(assert (=> d!133909 (= res!805988 (not (contains!7023 lt!551763 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133909 (= lt!551763 e!689643)))

(declare-fun c!120160 () Bool)

(assert (=> d!133909 (= c!120160 (bvsge from!1455 (size!38339 lt!551530)))))

(assert (=> d!133909 (validMask!0 mask!1564)))

(assert (=> d!133909 (= (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!551763)))

(declare-fun bm!60300 () Bool)

(assert (=> bm!60300 (= call!60303 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1214188 () Bool)

(assert (=> b!1214188 (= e!689645 (validKeyInArray!0 (select (arr!37802 lt!551530) from!1455)))))

(assert (=> b!1214188 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!133909 c!120160) b!1214184))

(assert (= (and d!133909 (not c!120160)) b!1214180))

(assert (= (and b!1214180 c!120158) b!1214177))

(assert (= (and b!1214180 (not c!120158)) b!1214187))

(assert (= (or b!1214177 b!1214187) bm!60300))

(assert (= (and d!133909 res!805988) b!1214186))

(assert (= (and b!1214186 res!805989) b!1214178))

(assert (= (and b!1214178 res!805986) b!1214188))

(assert (= (and b!1214178 c!120159) b!1214185))

(assert (= (and b!1214178 (not c!120159)) b!1214183))

(assert (= (and b!1214185 res!805987) b!1214181))

(assert (= (and b!1214183 c!120161) b!1214182))

(assert (= (and b!1214183 (not c!120161)) b!1214179))

(declare-fun b_lambda!21703 () Bool)

(assert (=> (not b_lambda!21703) (not b!1214177)))

(assert (=> b!1214177 t!39682))

(declare-fun b_and!43235 () Bool)

(assert (= b_and!43233 (and (=> t!39682 result!22305) b_and!43235)))

(declare-fun b_lambda!21705 () Bool)

(assert (=> (not b_lambda!21705) (not b!1214181)))

(assert (=> b!1214181 t!39682))

(declare-fun b_and!43237 () Bool)

(assert (= b_and!43235 (and (=> t!39682 result!22305) b_and!43237)))

(declare-fun m!1119817 () Bool)

(assert (=> b!1214188 m!1119817))

(assert (=> b!1214188 m!1119817))

(declare-fun m!1119819 () Bool)

(assert (=> b!1214188 m!1119819))

(declare-fun m!1119821 () Bool)

(assert (=> b!1214182 m!1119821))

(assert (=> b!1214177 m!1119817))

(declare-fun m!1119823 () Bool)

(assert (=> b!1214177 m!1119823))

(declare-fun m!1119825 () Bool)

(assert (=> b!1214177 m!1119825))

(declare-fun m!1119827 () Bool)

(assert (=> b!1214177 m!1119827))

(assert (=> b!1214177 m!1119827))

(declare-fun m!1119829 () Bool)

(assert (=> b!1214177 m!1119829))

(assert (=> b!1214177 m!1119509))

(declare-fun m!1119831 () Bool)

(assert (=> b!1214177 m!1119831))

(assert (=> b!1214177 m!1119823))

(assert (=> b!1214177 m!1119509))

(declare-fun m!1119833 () Bool)

(assert (=> b!1214177 m!1119833))

(assert (=> b!1214181 m!1119817))

(assert (=> b!1214181 m!1119823))

(assert (=> b!1214181 m!1119817))

(declare-fun m!1119835 () Bool)

(assert (=> b!1214181 m!1119835))

(assert (=> b!1214181 m!1119509))

(assert (=> b!1214181 m!1119823))

(assert (=> b!1214181 m!1119509))

(assert (=> b!1214181 m!1119833))

(assert (=> b!1214185 m!1119817))

(assert (=> b!1214185 m!1119817))

(declare-fun m!1119837 () Bool)

(assert (=> b!1214185 m!1119837))

(assert (=> bm!60300 m!1119821))

(declare-fun m!1119839 () Bool)

(assert (=> b!1214186 m!1119839))

(declare-fun m!1119841 () Bool)

(assert (=> d!133909 m!1119841))

(assert (=> d!133909 m!1119519))

(assert (=> b!1214180 m!1119817))

(assert (=> b!1214180 m!1119817))

(assert (=> b!1214180 m!1119819))

(declare-fun m!1119843 () Bool)

(assert (=> b!1214179 m!1119843))

(assert (=> b!1213872 d!133909))

(declare-fun b!1214189 () Bool)

(declare-fun lt!551771 () Unit!40169)

(declare-fun lt!551766 () Unit!40169)

(assert (=> b!1214189 (= lt!551771 lt!551766)))

(declare-fun lt!551767 () ListLongMap!17827)

(declare-fun lt!551772 () V!46145)

(declare-fun lt!551769 () (_ BitVec 64))

(declare-fun lt!551768 () (_ BitVec 64))

(assert (=> b!1214189 (not (contains!7023 (+!4086 lt!551767 (tuple2!19851 lt!551768 lt!551772)) lt!551769))))

(assert (=> b!1214189 (= lt!551766 (addStillNotContains!299 lt!551767 lt!551768 lt!551772 lt!551769))))

(assert (=> b!1214189 (= lt!551769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1214189 (= lt!551772 (get!19313 (select (arr!37803 _values!996) from!1455) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1214189 (= lt!551768 (select (arr!37802 _keys!1208) from!1455))))

(declare-fun call!60304 () ListLongMap!17827)

(assert (=> b!1214189 (= lt!551767 call!60304)))

(declare-fun e!689651 () ListLongMap!17827)

(assert (=> b!1214189 (= e!689651 (+!4086 call!60304 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) (get!19313 (select (arr!37803 _values!996) from!1455) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1214190 () Bool)

(declare-fun e!689649 () Bool)

(declare-fun e!689648 () Bool)

(assert (=> b!1214190 (= e!689649 e!689648)))

(declare-fun c!120163 () Bool)

(declare-fun e!689652 () Bool)

(assert (=> b!1214190 (= c!120163 e!689652)))

(declare-fun res!805990 () Bool)

(assert (=> b!1214190 (=> (not res!805990) (not e!689652))))

(assert (=> b!1214190 (= res!805990 (bvslt from!1455 (size!38339 _keys!1208)))))

(declare-fun b!1214191 () Bool)

(declare-fun e!689653 () Bool)

(declare-fun lt!551770 () ListLongMap!17827)

(assert (=> b!1214191 (= e!689653 (isEmpty!997 lt!551770))))

(declare-fun b!1214192 () Bool)

(declare-fun e!689650 () ListLongMap!17827)

(assert (=> b!1214192 (= e!689650 e!689651)))

(declare-fun c!120162 () Bool)

(assert (=> b!1214192 (= c!120162 (validKeyInArray!0 (select (arr!37802 _keys!1208) from!1455)))))

(declare-fun b!1214193 () Bool)

(assert (=> b!1214193 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38339 _keys!1208)))))

(assert (=> b!1214193 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38340 _values!996)))))

(declare-fun e!689654 () Bool)

(assert (=> b!1214193 (= e!689654 (= (apply!978 lt!551770 (select (arr!37802 _keys!1208) from!1455)) (get!19313 (select (arr!37803 _values!996) from!1455) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1214194 () Bool)

(assert (=> b!1214194 (= e!689653 (= lt!551770 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1214195 () Bool)

(assert (=> b!1214195 (= e!689648 e!689653)))

(declare-fun c!120165 () Bool)

(assert (=> b!1214195 (= c!120165 (bvslt from!1455 (size!38339 _keys!1208)))))

(declare-fun b!1214196 () Bool)

(assert (=> b!1214196 (= e!689650 (ListLongMap!17828 Nil!26649))))

(declare-fun b!1214197 () Bool)

(assert (=> b!1214197 (= e!689648 e!689654)))

(assert (=> b!1214197 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38339 _keys!1208)))))

(declare-fun res!805991 () Bool)

(assert (=> b!1214197 (= res!805991 (contains!7023 lt!551770 (select (arr!37802 _keys!1208) from!1455)))))

(assert (=> b!1214197 (=> (not res!805991) (not e!689654))))

(declare-fun b!1214198 () Bool)

(declare-fun res!805993 () Bool)

(assert (=> b!1214198 (=> (not res!805993) (not e!689649))))

(assert (=> b!1214198 (= res!805993 (not (contains!7023 lt!551770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1214199 () Bool)

(assert (=> b!1214199 (= e!689651 call!60304)))

(declare-fun d!133911 () Bool)

(assert (=> d!133911 e!689649))

(declare-fun res!805992 () Bool)

(assert (=> d!133911 (=> (not res!805992) (not e!689649))))

(assert (=> d!133911 (= res!805992 (not (contains!7023 lt!551770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133911 (= lt!551770 e!689650)))

(declare-fun c!120164 () Bool)

(assert (=> d!133911 (= c!120164 (bvsge from!1455 (size!38339 _keys!1208)))))

(assert (=> d!133911 (validMask!0 mask!1564)))

(assert (=> d!133911 (= (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!551770)))

(declare-fun bm!60301 () Bool)

(assert (=> bm!60301 (= call!60304 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1214200 () Bool)

(assert (=> b!1214200 (= e!689652 (validKeyInArray!0 (select (arr!37802 _keys!1208) from!1455)))))

(assert (=> b!1214200 (bvsge from!1455 #b00000000000000000000000000000000)))

(assert (= (and d!133911 c!120164) b!1214196))

(assert (= (and d!133911 (not c!120164)) b!1214192))

(assert (= (and b!1214192 c!120162) b!1214189))

(assert (= (and b!1214192 (not c!120162)) b!1214199))

(assert (= (or b!1214189 b!1214199) bm!60301))

(assert (= (and d!133911 res!805992) b!1214198))

(assert (= (and b!1214198 res!805993) b!1214190))

(assert (= (and b!1214190 res!805990) b!1214200))

(assert (= (and b!1214190 c!120163) b!1214197))

(assert (= (and b!1214190 (not c!120163)) b!1214195))

(assert (= (and b!1214197 res!805991) b!1214193))

(assert (= (and b!1214195 c!120165) b!1214194))

(assert (= (and b!1214195 (not c!120165)) b!1214191))

(declare-fun b_lambda!21707 () Bool)

(assert (=> (not b_lambda!21707) (not b!1214189)))

(assert (=> b!1214189 t!39682))

(declare-fun b_and!43239 () Bool)

(assert (= b_and!43237 (and (=> t!39682 result!22305) b_and!43239)))

(declare-fun b_lambda!21709 () Bool)

(assert (=> (not b_lambda!21709) (not b!1214193)))

(assert (=> b!1214193 t!39682))

(declare-fun b_and!43241 () Bool)

(assert (= b_and!43239 (and (=> t!39682 result!22305) b_and!43241)))

(assert (=> b!1214200 m!1119473))

(assert (=> b!1214200 m!1119473))

(assert (=> b!1214200 m!1119799))

(declare-fun m!1119845 () Bool)

(assert (=> b!1214194 m!1119845))

(assert (=> b!1214189 m!1119473))

(assert (=> b!1214189 m!1119527))

(declare-fun m!1119847 () Bool)

(assert (=> b!1214189 m!1119847))

(declare-fun m!1119849 () Bool)

(assert (=> b!1214189 m!1119849))

(assert (=> b!1214189 m!1119849))

(declare-fun m!1119851 () Bool)

(assert (=> b!1214189 m!1119851))

(assert (=> b!1214189 m!1119509))

(declare-fun m!1119853 () Bool)

(assert (=> b!1214189 m!1119853))

(assert (=> b!1214189 m!1119527))

(assert (=> b!1214189 m!1119509))

(declare-fun m!1119855 () Bool)

(assert (=> b!1214189 m!1119855))

(assert (=> b!1214193 m!1119473))

(assert (=> b!1214193 m!1119527))

(assert (=> b!1214193 m!1119473))

(declare-fun m!1119857 () Bool)

(assert (=> b!1214193 m!1119857))

(assert (=> b!1214193 m!1119509))

(assert (=> b!1214193 m!1119527))

(assert (=> b!1214193 m!1119509))

(assert (=> b!1214193 m!1119855))

(assert (=> b!1214197 m!1119473))

(assert (=> b!1214197 m!1119473))

(declare-fun m!1119859 () Bool)

(assert (=> b!1214197 m!1119859))

(assert (=> bm!60301 m!1119845))

(declare-fun m!1119861 () Bool)

(assert (=> b!1214198 m!1119861))

(declare-fun m!1119863 () Bool)

(assert (=> d!133911 m!1119863))

(assert (=> d!133911 m!1119519))

(assert (=> b!1214192 m!1119473))

(assert (=> b!1214192 m!1119473))

(assert (=> b!1214192 m!1119799))

(declare-fun m!1119865 () Bool)

(assert (=> b!1214191 m!1119865))

(assert (=> b!1213872 d!133911))

(declare-fun d!133913 () Bool)

(assert (=> d!133913 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1213855 d!133913))

(declare-fun bm!60306 () Bool)

(declare-fun call!60310 () ListLongMap!17827)

(assert (=> bm!60306 (= call!60310 (getCurrentListMapNoExtraKeys!5388 (array!78346 (store (arr!37802 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38339 _keys!1208)) (array!78348 (store (arr!37803 _values!996) i!673 (ValueCellFull!14672 (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38340 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1214207 () Bool)

(declare-fun e!689660 () Bool)

(declare-fun e!689659 () Bool)

(assert (=> b!1214207 (= e!689660 e!689659)))

(declare-fun c!120168 () Bool)

(assert (=> b!1214207 (= c!120168 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1214208 () Bool)

(declare-fun call!60309 () ListLongMap!17827)

(assert (=> b!1214208 (= e!689659 (= call!60310 (-!1855 call!60309 k0!934)))))

(assert (=> b!1214208 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38340 _values!996)))))

(declare-fun bm!60307 () Bool)

(assert (=> bm!60307 (= call!60309 (getCurrentListMapNoExtraKeys!5388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!133915 () Bool)

(assert (=> d!133915 e!689660))

(declare-fun res!805996 () Bool)

(assert (=> d!133915 (=> (not res!805996) (not e!689660))))

(assert (=> d!133915 (= res!805996 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38339 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38339 _keys!1208))))))))

(declare-fun lt!551775 () Unit!40169)

(declare-fun choose!1824 (array!78345 array!78347 (_ BitVec 32) (_ BitVec 32) V!46145 V!46145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40169)

(assert (=> d!133915 (= lt!551775 (choose!1824 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133915 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 _keys!1208)))))

(assert (=> d!133915 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1070 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551775)))

(declare-fun b!1214209 () Bool)

(assert (=> b!1214209 (= e!689659 (= call!60310 call!60309))))

(assert (=> b!1214209 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38340 _values!996)))))

(assert (= (and d!133915 res!805996) b!1214207))

(assert (= (and b!1214207 c!120168) b!1214208))

(assert (= (and b!1214207 (not c!120168)) b!1214209))

(assert (= (or b!1214208 b!1214209) bm!60307))

(assert (= (or b!1214208 b!1214209) bm!60306))

(declare-fun b_lambda!21711 () Bool)

(assert (=> (not b_lambda!21711) (not bm!60306)))

(assert (=> bm!60306 t!39682))

(declare-fun b_and!43243 () Bool)

(assert (= b_and!43241 (and (=> t!39682 result!22305) b_and!43243)))

(assert (=> bm!60306 m!1119537))

(assert (=> bm!60306 m!1119509))

(declare-fun m!1119867 () Bool)

(assert (=> bm!60306 m!1119867))

(declare-fun m!1119869 () Bool)

(assert (=> bm!60306 m!1119869))

(declare-fun m!1119871 () Bool)

(assert (=> b!1214208 m!1119871))

(assert (=> bm!60307 m!1119503))

(declare-fun m!1119873 () Bool)

(assert (=> d!133915 m!1119873))

(assert (=> b!1213873 d!133915))

(declare-fun d!133917 () Bool)

(declare-fun e!689661 () Bool)

(assert (=> d!133917 e!689661))

(declare-fun res!805997 () Bool)

(assert (=> d!133917 (=> (not res!805997) (not e!689661))))

(declare-fun lt!551777 () ListLongMap!17827)

(assert (=> d!133917 (= res!805997 (contains!7023 lt!551777 (_1!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(declare-fun lt!551778 () List!26652)

(assert (=> d!133917 (= lt!551777 (ListLongMap!17828 lt!551778))))

(declare-fun lt!551776 () Unit!40169)

(declare-fun lt!551779 () Unit!40169)

(assert (=> d!133917 (= lt!551776 lt!551779)))

(assert (=> d!133917 (= (getValueByKey!636 lt!551778 (_1!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!686 (_2!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133917 (= lt!551779 (lemmaContainsTupThenGetReturnValue!318 lt!551778 (_1!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133917 (= lt!551778 (insertStrictlySorted!411 (toList!8929 (ite c!120091 lt!551537 lt!551529)) (_1!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) (_2!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))))

(assert (=> d!133917 (= (+!4086 (ite c!120091 lt!551537 lt!551529) (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))) lt!551777)))

(declare-fun b!1214210 () Bool)

(declare-fun res!805998 () Bool)

(assert (=> b!1214210 (=> (not res!805998) (not e!689661))))

(assert (=> b!1214210 (= res!805998 (= (getValueByKey!636 (toList!8929 lt!551777) (_1!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))) (Some!686 (_2!9936 (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))))

(declare-fun b!1214211 () Bool)

(assert (=> b!1214211 (= e!689661 (contains!7027 (toList!8929 lt!551777) (ite c!120091 (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!120089 (tuple2!19851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and d!133917 res!805997) b!1214210))

(assert (= (and b!1214210 res!805998) b!1214211))

(declare-fun m!1119875 () Bool)

(assert (=> d!133917 m!1119875))

(declare-fun m!1119877 () Bool)

(assert (=> d!133917 m!1119877))

(declare-fun m!1119879 () Bool)

(assert (=> d!133917 m!1119879))

(declare-fun m!1119881 () Bool)

(assert (=> d!133917 m!1119881))

(declare-fun m!1119883 () Bool)

(assert (=> b!1214210 m!1119883))

(declare-fun m!1119885 () Bool)

(assert (=> b!1214211 m!1119885))

(assert (=> bm!60235 d!133917))

(declare-fun d!133919 () Bool)

(assert (=> d!133919 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1213852 d!133919))

(declare-fun b!1214212 () Bool)

(declare-fun lt!551785 () Unit!40169)

(declare-fun lt!551780 () Unit!40169)

(assert (=> b!1214212 (= lt!551785 lt!551780)))

(declare-fun lt!551782 () (_ BitVec 64))

(declare-fun lt!551783 () (_ BitVec 64))

(declare-fun lt!551786 () V!46145)

(declare-fun lt!551781 () ListLongMap!17827)

(assert (=> b!1214212 (not (contains!7023 (+!4086 lt!551781 (tuple2!19851 lt!551782 lt!551786)) lt!551783))))

(assert (=> b!1214212 (= lt!551780 (addStillNotContains!299 lt!551781 lt!551782 lt!551786 lt!551783))))

(assert (=> b!1214212 (= lt!551783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1214212 (= lt!551786 (get!19313 (select (arr!37803 lt!551539) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1214212 (= lt!551782 (select (arr!37802 lt!551530) (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun call!60311 () ListLongMap!17827)

(assert (=> b!1214212 (= lt!551781 call!60311)))

(declare-fun e!689665 () ListLongMap!17827)

(assert (=> b!1214212 (= e!689665 (+!4086 call!60311 (tuple2!19851 (select (arr!37802 lt!551530) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19313 (select (arr!37803 lt!551539) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1214213 () Bool)

(declare-fun e!689663 () Bool)

(declare-fun e!689662 () Bool)

(assert (=> b!1214213 (= e!689663 e!689662)))

(declare-fun c!120170 () Bool)

(declare-fun e!689666 () Bool)

(assert (=> b!1214213 (= c!120170 e!689666)))

(declare-fun res!805999 () Bool)

(assert (=> b!1214213 (=> (not res!805999) (not e!689666))))

(assert (=> b!1214213 (= res!805999 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 lt!551530)))))

(declare-fun b!1214214 () Bool)

(declare-fun e!689667 () Bool)

(declare-fun lt!551784 () ListLongMap!17827)

(assert (=> b!1214214 (= e!689667 (isEmpty!997 lt!551784))))

(declare-fun b!1214215 () Bool)

(declare-fun e!689664 () ListLongMap!17827)

(assert (=> b!1214215 (= e!689664 e!689665)))

(declare-fun c!120169 () Bool)

(assert (=> b!1214215 (= c!120169 (validKeyInArray!0 (select (arr!37802 lt!551530) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1214216 () Bool)

(assert (=> b!1214216 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 lt!551530)))))

(assert (=> b!1214216 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38340 lt!551539)))))

(declare-fun e!689668 () Bool)

(assert (=> b!1214216 (= e!689668 (= (apply!978 lt!551784 (select (arr!37802 lt!551530) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19313 (select (arr!37803 lt!551539) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3302 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1214217 () Bool)

(assert (=> b!1214217 (= e!689667 (= lt!551784 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1214218 () Bool)

(assert (=> b!1214218 (= e!689662 e!689667)))

(declare-fun c!120172 () Bool)

(assert (=> b!1214218 (= c!120172 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 lt!551530)))))

(declare-fun b!1214219 () Bool)

(assert (=> b!1214219 (= e!689664 (ListLongMap!17828 Nil!26649))))

(declare-fun b!1214220 () Bool)

(assert (=> b!1214220 (= e!689662 e!689668)))

(assert (=> b!1214220 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 lt!551530)))))

(declare-fun res!806000 () Bool)

(assert (=> b!1214220 (= res!806000 (contains!7023 lt!551784 (select (arr!37802 lt!551530) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1214220 (=> (not res!806000) (not e!689668))))

(declare-fun b!1214221 () Bool)

(declare-fun res!806002 () Bool)

(assert (=> b!1214221 (=> (not res!806002) (not e!689663))))

(assert (=> b!1214221 (= res!806002 (not (contains!7023 lt!551784 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1214222 () Bool)

(assert (=> b!1214222 (= e!689665 call!60311)))

(declare-fun d!133921 () Bool)

(assert (=> d!133921 e!689663))

(declare-fun res!806001 () Bool)

(assert (=> d!133921 (=> (not res!806001) (not e!689663))))

(assert (=> d!133921 (= res!806001 (not (contains!7023 lt!551784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133921 (= lt!551784 e!689664)))

(declare-fun c!120171 () Bool)

(assert (=> d!133921 (= c!120171 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38339 lt!551530)))))

(assert (=> d!133921 (validMask!0 mask!1564)))

(assert (=> d!133921 (= (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!551784)))

(declare-fun bm!60308 () Bool)

(assert (=> bm!60308 (= call!60311 (getCurrentListMapNoExtraKeys!5388 lt!551530 lt!551539 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1214223 () Bool)

(assert (=> b!1214223 (= e!689666 (validKeyInArray!0 (select (arr!37802 lt!551530) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1214223 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(assert (= (and d!133921 c!120171) b!1214219))

(assert (= (and d!133921 (not c!120171)) b!1214215))

(assert (= (and b!1214215 c!120169) b!1214212))

(assert (= (and b!1214215 (not c!120169)) b!1214222))

(assert (= (or b!1214212 b!1214222) bm!60308))

(assert (= (and d!133921 res!806001) b!1214221))

(assert (= (and b!1214221 res!806002) b!1214213))

(assert (= (and b!1214213 res!805999) b!1214223))

(assert (= (and b!1214213 c!120170) b!1214220))

(assert (= (and b!1214213 (not c!120170)) b!1214218))

(assert (= (and b!1214220 res!806000) b!1214216))

(assert (= (and b!1214218 c!120172) b!1214217))

(assert (= (and b!1214218 (not c!120172)) b!1214214))

(declare-fun b_lambda!21713 () Bool)

(assert (=> (not b_lambda!21713) (not b!1214212)))

(assert (=> b!1214212 t!39682))

(declare-fun b_and!43245 () Bool)

(assert (= b_and!43243 (and (=> t!39682 result!22305) b_and!43245)))

(declare-fun b_lambda!21715 () Bool)

(assert (=> (not b_lambda!21715) (not b!1214216)))

(assert (=> b!1214216 t!39682))

(declare-fun b_and!43247 () Bool)

(assert (= b_and!43245 (and (=> t!39682 result!22305) b_and!43247)))

(declare-fun m!1119887 () Bool)

(assert (=> b!1214223 m!1119887))

(assert (=> b!1214223 m!1119887))

(declare-fun m!1119889 () Bool)

(assert (=> b!1214223 m!1119889))

(declare-fun m!1119891 () Bool)

(assert (=> b!1214217 m!1119891))

(assert (=> b!1214212 m!1119887))

(declare-fun m!1119893 () Bool)

(assert (=> b!1214212 m!1119893))

(declare-fun m!1119895 () Bool)

(assert (=> b!1214212 m!1119895))

(declare-fun m!1119897 () Bool)

(assert (=> b!1214212 m!1119897))

(assert (=> b!1214212 m!1119897))

(declare-fun m!1119899 () Bool)

(assert (=> b!1214212 m!1119899))

(assert (=> b!1214212 m!1119509))

(declare-fun m!1119901 () Bool)

(assert (=> b!1214212 m!1119901))

(assert (=> b!1214212 m!1119893))

(assert (=> b!1214212 m!1119509))

(declare-fun m!1119903 () Bool)

(assert (=> b!1214212 m!1119903))

(assert (=> b!1214216 m!1119887))

(assert (=> b!1214216 m!1119893))

(assert (=> b!1214216 m!1119887))

(declare-fun m!1119905 () Bool)

(assert (=> b!1214216 m!1119905))

(assert (=> b!1214216 m!1119509))

(assert (=> b!1214216 m!1119893))

(assert (=> b!1214216 m!1119509))

(assert (=> b!1214216 m!1119903))

(assert (=> b!1214220 m!1119887))

(assert (=> b!1214220 m!1119887))

(declare-fun m!1119907 () Bool)

(assert (=> b!1214220 m!1119907))

(assert (=> bm!60308 m!1119891))

(declare-fun m!1119909 () Bool)

(assert (=> b!1214221 m!1119909))

(declare-fun m!1119911 () Bool)

(assert (=> d!133921 m!1119911))

(assert (=> d!133921 m!1119519))

(assert (=> b!1214215 m!1119887))

(assert (=> b!1214215 m!1119887))

(assert (=> b!1214215 m!1119889))

(declare-fun m!1119913 () Bool)

(assert (=> b!1214214 m!1119913))

(assert (=> b!1213877 d!133921))

(assert (=> b!1213853 d!133907))

(declare-fun d!133923 () Bool)

(declare-fun lt!551789 () ListLongMap!17827)

(assert (=> d!133923 (not (contains!7023 lt!551789 (select (arr!37802 _keys!1208) from!1455)))))

(declare-fun removeStrictlySorted!101 (List!26652 (_ BitVec 64)) List!26652)

(assert (=> d!133923 (= lt!551789 (ListLongMap!17828 (removeStrictlySorted!101 (toList!8929 (+!4086 lt!551529 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))) (select (arr!37802 _keys!1208) from!1455))))))

(assert (=> d!133923 (= (-!1855 (+!4086 lt!551529 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)) (select (arr!37802 _keys!1208) from!1455)) lt!551789)))

(declare-fun bs!34242 () Bool)

(assert (= bs!34242 d!133923))

(assert (=> bs!34242 m!1119473))

(declare-fun m!1119915 () Bool)

(assert (=> bs!34242 m!1119915))

(assert (=> bs!34242 m!1119473))

(declare-fun m!1119917 () Bool)

(assert (=> bs!34242 m!1119917))

(assert (=> b!1213878 d!133923))

(declare-fun d!133925 () Bool)

(declare-fun e!689669 () Bool)

(assert (=> d!133925 e!689669))

(declare-fun res!806003 () Bool)

(assert (=> d!133925 (=> res!806003 e!689669)))

(declare-fun lt!551793 () Bool)

(assert (=> d!133925 (= res!806003 (not lt!551793))))

(declare-fun lt!551792 () Bool)

(assert (=> d!133925 (= lt!551793 lt!551792)))

(declare-fun lt!551791 () Unit!40169)

(declare-fun e!689670 () Unit!40169)

(assert (=> d!133925 (= lt!551791 e!689670)))

(declare-fun c!120173 () Bool)

(assert (=> d!133925 (= c!120173 lt!551792)))

(assert (=> d!133925 (= lt!551792 (containsKey!598 (toList!8929 lt!551529) k0!934))))

(assert (=> d!133925 (= (contains!7023 lt!551529 k0!934) lt!551793)))

(declare-fun b!1214224 () Bool)

(declare-fun lt!551790 () Unit!40169)

(assert (=> b!1214224 (= e!689670 lt!551790)))

(assert (=> b!1214224 (= lt!551790 (lemmaContainsKeyImpliesGetValueByKeyDefined!426 (toList!8929 lt!551529) k0!934))))

(assert (=> b!1214224 (isDefined!464 (getValueByKey!636 (toList!8929 lt!551529) k0!934))))

(declare-fun b!1214225 () Bool)

(declare-fun Unit!40183 () Unit!40169)

(assert (=> b!1214225 (= e!689670 Unit!40183)))

(declare-fun b!1214226 () Bool)

(assert (=> b!1214226 (= e!689669 (isDefined!464 (getValueByKey!636 (toList!8929 lt!551529) k0!934)))))

(assert (= (and d!133925 c!120173) b!1214224))

(assert (= (and d!133925 (not c!120173)) b!1214225))

(assert (= (and d!133925 (not res!806003)) b!1214226))

(declare-fun m!1119919 () Bool)

(assert (=> d!133925 m!1119919))

(declare-fun m!1119921 () Bool)

(assert (=> b!1214224 m!1119921))

(declare-fun m!1119923 () Bool)

(assert (=> b!1214224 m!1119923))

(assert (=> b!1214224 m!1119923))

(declare-fun m!1119925 () Bool)

(assert (=> b!1214224 m!1119925))

(assert (=> b!1214226 m!1119923))

(assert (=> b!1214226 m!1119923))

(assert (=> b!1214226 m!1119925))

(assert (=> b!1213878 d!133925))

(declare-fun d!133927 () Bool)

(declare-fun lt!551794 () ListLongMap!17827)

(assert (=> d!133927 (not (contains!7023 lt!551794 k0!934))))

(assert (=> d!133927 (= lt!551794 (ListLongMap!17828 (removeStrictlySorted!101 (toList!8929 lt!551544) k0!934)))))

(assert (=> d!133927 (= (-!1855 lt!551544 k0!934) lt!551794)))

(declare-fun bs!34243 () Bool)

(assert (= bs!34243 d!133927))

(declare-fun m!1119927 () Bool)

(assert (=> bs!34243 m!1119927))

(declare-fun m!1119929 () Bool)

(assert (=> bs!34243 m!1119929))

(assert (=> b!1213878 d!133927))

(declare-fun d!133929 () Bool)

(declare-fun e!689671 () Bool)

(assert (=> d!133929 e!689671))

(declare-fun res!806004 () Bool)

(assert (=> d!133929 (=> (not res!806004) (not e!689671))))

(declare-fun lt!551796 () ListLongMap!17827)

(assert (=> d!133929 (= res!806004 (contains!7023 lt!551796 (_1!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))))))

(declare-fun lt!551797 () List!26652)

(assert (=> d!133929 (= lt!551796 (ListLongMap!17828 lt!551797))))

(declare-fun lt!551795 () Unit!40169)

(declare-fun lt!551798 () Unit!40169)

(assert (=> d!133929 (= lt!551795 lt!551798)))

(assert (=> d!133929 (= (getValueByKey!636 lt!551797 (_1!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))) (Some!686 (_2!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))))))

(assert (=> d!133929 (= lt!551798 (lemmaContainsTupThenGetReturnValue!318 lt!551797 (_1!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)) (_2!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))))))

(assert (=> d!133929 (= lt!551797 (insertStrictlySorted!411 (toList!8929 lt!551529) (_1!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)) (_2!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))))))

(assert (=> d!133929 (= (+!4086 lt!551529 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)) lt!551796)))

(declare-fun b!1214227 () Bool)

(declare-fun res!806005 () Bool)

(assert (=> b!1214227 (=> (not res!806005) (not e!689671))))

(assert (=> b!1214227 (= res!806005 (= (getValueByKey!636 (toList!8929 lt!551796) (_1!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542))) (Some!686 (_2!9936 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)))))))

(declare-fun b!1214228 () Bool)

(assert (=> b!1214228 (= e!689671 (contains!7027 (toList!8929 lt!551796) (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)))))

(assert (= (and d!133929 res!806004) b!1214227))

(assert (= (and b!1214227 res!806005) b!1214228))

(declare-fun m!1119931 () Bool)

(assert (=> d!133929 m!1119931))

(declare-fun m!1119933 () Bool)

(assert (=> d!133929 m!1119933))

(declare-fun m!1119935 () Bool)

(assert (=> d!133929 m!1119935))

(declare-fun m!1119937 () Bool)

(assert (=> d!133929 m!1119937))

(declare-fun m!1119939 () Bool)

(assert (=> b!1214227 m!1119939))

(declare-fun m!1119941 () Bool)

(assert (=> b!1214228 m!1119941))

(assert (=> b!1213878 d!133929))

(declare-fun d!133931 () Bool)

(assert (=> d!133931 (= (-!1855 (+!4086 lt!551529 (tuple2!19851 (select (arr!37802 _keys!1208) from!1455) lt!551542)) (select (arr!37802 _keys!1208) from!1455)) lt!551529)))

(declare-fun lt!551801 () Unit!40169)

(declare-fun choose!1825 (ListLongMap!17827 (_ BitVec 64) V!46145) Unit!40169)

(assert (=> d!133931 (= lt!551801 (choose!1825 lt!551529 (select (arr!37802 _keys!1208) from!1455) lt!551542))))

(assert (=> d!133931 (not (contains!7023 lt!551529 (select (arr!37802 _keys!1208) from!1455)))))

(assert (=> d!133931 (= (addThenRemoveForNewKeyIsSame!282 lt!551529 (select (arr!37802 _keys!1208) from!1455) lt!551542) lt!551801)))

(declare-fun bs!34244 () Bool)

(assert (= bs!34244 d!133931))

(assert (=> bs!34244 m!1119521))

(assert (=> bs!34244 m!1119521))

(assert (=> bs!34244 m!1119473))

(assert (=> bs!34244 m!1119523))

(assert (=> bs!34244 m!1119473))

(declare-fun m!1119943 () Bool)

(assert (=> bs!34244 m!1119943))

(assert (=> bs!34244 m!1119473))

(declare-fun m!1119945 () Bool)

(assert (=> bs!34244 m!1119945))

(assert (=> b!1213878 d!133931))

(assert (=> b!1213878 d!133871))

(declare-fun d!133933 () Bool)

(declare-fun c!120176 () Bool)

(assert (=> d!133933 (= c!120176 ((_ is ValueCellFull!14672) (select (arr!37803 _values!996) from!1455)))))

(declare-fun e!689674 () V!46145)

(assert (=> d!133933 (= (get!19313 (select (arr!37803 _values!996) from!1455) lt!551531) e!689674)))

(declare-fun b!1214233 () Bool)

(declare-fun get!19315 (ValueCell!14672 V!46145) V!46145)

(assert (=> b!1214233 (= e!689674 (get!19315 (select (arr!37803 _values!996) from!1455) lt!551531))))

(declare-fun b!1214234 () Bool)

(declare-fun get!19316 (ValueCell!14672 V!46145) V!46145)

(assert (=> b!1214234 (= e!689674 (get!19316 (select (arr!37803 _values!996) from!1455) lt!551531))))

(assert (= (and d!133933 c!120176) b!1214233))

(assert (= (and d!133933 (not c!120176)) b!1214234))

(assert (=> b!1214233 m!1119527))

(declare-fun m!1119947 () Bool)

(assert (=> b!1214233 m!1119947))

(assert (=> b!1214234 m!1119527))

(declare-fun m!1119949 () Bool)

(assert (=> b!1214234 m!1119949))

(assert (=> b!1213878 d!133933))

(assert (=> bm!60234 d!133921))

(declare-fun d!133935 () Bool)

(declare-fun lt!551802 () ListLongMap!17827)

(assert (=> d!133935 (not (contains!7023 lt!551802 k0!934))))

(assert (=> d!133935 (= lt!551802 (ListLongMap!17828 (removeStrictlySorted!101 (toList!8929 call!60237) k0!934)))))

(assert (=> d!133935 (= (-!1855 call!60237 k0!934) lt!551802)))

(declare-fun bs!34245 () Bool)

(assert (= bs!34245 d!133935))

(declare-fun m!1119951 () Bool)

(assert (=> bs!34245 m!1119951))

(declare-fun m!1119953 () Bool)

(assert (=> bs!34245 m!1119953))

(assert (=> b!1213869 d!133935))

(declare-fun mapNonEmpty!48025 () Bool)

(declare-fun mapRes!48025 () Bool)

(declare-fun tp!91211 () Bool)

(declare-fun e!689679 () Bool)

(assert (=> mapNonEmpty!48025 (= mapRes!48025 (and tp!91211 e!689679))))

(declare-fun mapValue!48025 () ValueCell!14672)

(declare-fun mapRest!48025 () (Array (_ BitVec 32) ValueCell!14672))

(declare-fun mapKey!48025 () (_ BitVec 32))

(assert (=> mapNonEmpty!48025 (= mapRest!48016 (store mapRest!48025 mapKey!48025 mapValue!48025))))

(declare-fun mapIsEmpty!48025 () Bool)

(assert (=> mapIsEmpty!48025 mapRes!48025))

(declare-fun b!1214241 () Bool)

(assert (=> b!1214241 (= e!689679 tp_is_empty!30763)))

(declare-fun condMapEmpty!48025 () Bool)

(declare-fun mapDefault!48025 () ValueCell!14672)

(assert (=> mapNonEmpty!48016 (= condMapEmpty!48025 (= mapRest!48016 ((as const (Array (_ BitVec 32) ValueCell!14672)) mapDefault!48025)))))

(declare-fun e!689680 () Bool)

(assert (=> mapNonEmpty!48016 (= tp!91196 (and e!689680 mapRes!48025))))

(declare-fun b!1214242 () Bool)

(assert (=> b!1214242 (= e!689680 tp_is_empty!30763)))

(assert (= (and mapNonEmpty!48016 condMapEmpty!48025) mapIsEmpty!48025))

(assert (= (and mapNonEmpty!48016 (not condMapEmpty!48025)) mapNonEmpty!48025))

(assert (= (and mapNonEmpty!48025 ((_ is ValueCellFull!14672) mapValue!48025)) b!1214241))

(assert (= (and mapNonEmpty!48016 ((_ is ValueCellFull!14672) mapDefault!48025)) b!1214242))

(declare-fun m!1119955 () Bool)

(assert (=> mapNonEmpty!48025 m!1119955))

(declare-fun b_lambda!21717 () Bool)

(assert (= b_lambda!21713 (or (and start!101334 b_free!26059) b_lambda!21717)))

(declare-fun b_lambda!21719 () Bool)

(assert (= b_lambda!21703 (or (and start!101334 b_free!26059) b_lambda!21719)))

(declare-fun b_lambda!21721 () Bool)

(assert (= b_lambda!21709 (or (and start!101334 b_free!26059) b_lambda!21721)))

(declare-fun b_lambda!21723 () Bool)

(assert (= b_lambda!21705 (or (and start!101334 b_free!26059) b_lambda!21723)))

(declare-fun b_lambda!21725 () Bool)

(assert (= b_lambda!21699 (or (and start!101334 b_free!26059) b_lambda!21725)))

(declare-fun b_lambda!21727 () Bool)

(assert (= b_lambda!21715 (or (and start!101334 b_free!26059) b_lambda!21727)))

(declare-fun b_lambda!21729 () Bool)

(assert (= b_lambda!21711 (or (and start!101334 b_free!26059) b_lambda!21729)))

(declare-fun b_lambda!21731 () Bool)

(assert (= b_lambda!21707 (or (and start!101334 b_free!26059) b_lambda!21731)))

(declare-fun b_lambda!21733 () Bool)

(assert (= b_lambda!21701 (or (and start!101334 b_free!26059) b_lambda!21733)))

(check-sat (not b!1214164) (not b!1214113) (not b!1214149) (not b_lambda!21729) (not b!1214227) (not b!1214173) (not b!1214166) (not bm!60299) (not b!1214159) (not b!1214146) (not b!1214220) (not b!1214114) (not b!1214096) (not b!1214200) (not d!133895) (not bm!60301) (not d!133873) (not b_lambda!21727) (not b!1214091) (not b!1214147) (not b!1214221) (not b_lambda!21723) (not b_lambda!21719) (not b!1214100) (not d!133871) (not b!1214185) (not b!1214181) (not b!1214128) (not d!133935) (not mapNonEmpty!48025) (not bm!60300) (not b_lambda!21717) (not d!133921) (not b!1214193) (not b!1214223) (not b!1214189) (not b!1214217) (not b!1214197) (not b!1214102) (not b!1214208) (not bm!60307) (not b!1214198) (not d!133879) (not b!1214158) (not b!1214215) (not b!1214188) (not b_lambda!21731) (not b!1214214) (not b!1214192) (not d!133931) (not bm!60293) (not b!1214212) (not b!1214169) (not b!1214099) (not d!133929) (not bm!60297) b_and!43247 (not b!1214094) (not b!1214121) (not d!133881) (not b!1214179) (not b!1214233) (not b!1214176) (not b_lambda!21725) (not b!1214210) (not b!1214234) (not b!1214224) (not b!1214167) (not d!133891) (not b!1214153) (not bm!60306) (not b_lambda!21697) (not d!133911) (not d!133893) (not d!133899) (not b!1214177) (not bm!60308) (not b!1214172) (not b!1214142) (not b_lambda!21721) (not b!1214151) (not b!1214226) (not b!1214182) (not b!1214194) (not b_lambda!21733) (not b!1214095) (not b!1214093) (not d!133903) (not d!133917) (not b!1214144) (not b!1214191) (not d!133925) (not b!1214228) (not bm!60290) (not d!133915) (not bm!60296) (not b_next!26059) (not b!1214180) tp_is_empty!30763 (not b!1214186) (not b!1214130) (not d!133927) (not b!1214141) (not d!133923) (not b!1214211) (not b!1214216) (not d!133897) (not d!133909) (not bm!60298))
(check-sat b_and!43247 (not b_next!26059))
