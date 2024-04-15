; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101694 () Bool)

(assert start!101694)

(declare-fun b_free!26389 () Bool)

(declare-fun b_next!26389 () Bool)

(assert (=> start!101694 (= b_free!26389 (not b_next!26389))))

(declare-fun tp!92212 () Bool)

(declare-fun b_and!44021 () Bool)

(assert (=> start!101694 (= tp!92212 b_and!44021)))

(declare-fun b!1223333 () Bool)

(declare-fun res!812831 () Bool)

(declare-fun e!694768 () Bool)

(assert (=> b!1223333 (=> (not res!812831) (not e!694768))))

(declare-datatypes ((array!78892 0))(
  ( (array!78893 (arr!38073 (Array (_ BitVec 32) (_ BitVec 64))) (size!38611 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78892)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78892 (_ BitVec 32)) Bool)

(assert (=> b!1223333 (= res!812831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1223334 () Bool)

(declare-fun e!694771 () Bool)

(declare-fun e!694780 () Bool)

(assert (=> b!1223334 (= e!694771 e!694780)))

(declare-fun res!812837 () Bool)

(assert (=> b!1223334 (=> res!812837 e!694780)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223334 (= res!812837 (not (validKeyInArray!0 (select (arr!38073 _keys!1208) from!1455))))))

(declare-datatypes ((V!46585 0))(
  ( (V!46586 (val!15603 Int)) )
))
(declare-datatypes ((tuple2!20182 0))(
  ( (tuple2!20183 (_1!10102 (_ BitVec 64)) (_2!10102 V!46585)) )
))
(declare-datatypes ((List!26963 0))(
  ( (Nil!26960) (Cons!26959 (h!28168 tuple2!20182) (t!40323 List!26963)) )
))
(declare-datatypes ((ListLongMap!18151 0))(
  ( (ListLongMap!18152 (toList!9091 List!26963)) )
))
(declare-fun lt!556667 () ListLongMap!18151)

(declare-fun lt!556670 () ListLongMap!18151)

(assert (=> b!1223334 (= lt!556667 lt!556670)))

(declare-fun lt!556671 () ListLongMap!18151)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1914 (ListLongMap!18151 (_ BitVec 64)) ListLongMap!18151)

(assert (=> b!1223334 (= lt!556670 (-!1914 lt!556671 k0!934))))

(declare-fun zeroValue!944 () V!46585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46585)

(declare-fun lt!556674 () array!78892)

(declare-datatypes ((ValueCell!14837 0))(
  ( (ValueCellFull!14837 (v!18264 V!46585)) (EmptyCell!14837) )
))
(declare-datatypes ((array!78894 0))(
  ( (array!78895 (arr!38074 (Array (_ BitVec 32) ValueCell!14837)) (size!38612 (_ BitVec 32))) )
))
(declare-fun lt!556673 () array!78894)

(declare-fun getCurrentListMapNoExtraKeys!5523 (array!78892 array!78894 (_ BitVec 32) (_ BitVec 32) V!46585 V!46585 (_ BitVec 32) Int) ListLongMap!18151)

(assert (=> b!1223334 (= lt!556667 (getCurrentListMapNoExtraKeys!5523 lt!556674 lt!556673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78894)

(assert (=> b!1223334 (= lt!556671 (getCurrentListMapNoExtraKeys!5523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40368 0))(
  ( (Unit!40369) )
))
(declare-fun lt!556666 () Unit!40368)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1149 (array!78892 array!78894 (_ BitVec 32) (_ BitVec 32) V!46585 V!46585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40368)

(assert (=> b!1223334 (= lt!556666 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1149 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1223335 () Bool)

(declare-fun e!694769 () Bool)

(declare-fun e!694778 () Bool)

(assert (=> b!1223335 (= e!694769 (not e!694778))))

(declare-fun res!812827 () Bool)

(assert (=> b!1223335 (=> res!812827 e!694778)))

(assert (=> b!1223335 (= res!812827 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1223335 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!556669 () Unit!40368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78892 (_ BitVec 64) (_ BitVec 32)) Unit!40368)

(assert (=> b!1223335 (= lt!556669 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223336 () Bool)

(declare-fun res!812833 () Bool)

(assert (=> b!1223336 (=> (not res!812833) (not e!694768))))

(assert (=> b!1223336 (= res!812833 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38611 _keys!1208))))))

(declare-fun b!1223337 () Bool)

(declare-fun res!812823 () Bool)

(assert (=> b!1223337 (=> (not res!812823) (not e!694768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1223337 (= res!812823 (validMask!0 mask!1564))))

(declare-fun b!1223338 () Bool)

(declare-fun res!812829 () Bool)

(assert (=> b!1223338 (=> (not res!812829) (not e!694768))))

(assert (=> b!1223338 (= res!812829 (validKeyInArray!0 k0!934))))

(declare-fun lt!556668 () ListLongMap!18151)

(declare-fun b!1223339 () Bool)

(declare-fun lt!556665 () tuple2!20182)

(declare-fun e!694770 () Bool)

(declare-fun +!4153 (ListLongMap!18151 tuple2!20182) ListLongMap!18151)

(assert (=> b!1223339 (= e!694770 (= lt!556668 (+!4153 lt!556671 lt!556665)))))

(declare-fun res!812838 () Bool)

(assert (=> start!101694 (=> (not res!812838) (not e!694768))))

(assert (=> start!101694 (= res!812838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38611 _keys!1208))))))

(assert (=> start!101694 e!694768))

(declare-fun tp_is_empty!31093 () Bool)

(assert (=> start!101694 tp_is_empty!31093))

(declare-fun array_inv!29092 (array!78892) Bool)

(assert (=> start!101694 (array_inv!29092 _keys!1208)))

(assert (=> start!101694 true))

(assert (=> start!101694 tp!92212))

(declare-fun e!694779 () Bool)

(declare-fun array_inv!29093 (array!78894) Bool)

(assert (=> start!101694 (and (array_inv!29093 _values!996) e!694779)))

(declare-fun mapNonEmpty!48538 () Bool)

(declare-fun mapRes!48538 () Bool)

(declare-fun tp!92213 () Bool)

(declare-fun e!694776 () Bool)

(assert (=> mapNonEmpty!48538 (= mapRes!48538 (and tp!92213 e!694776))))

(declare-fun mapValue!48538 () ValueCell!14837)

(declare-fun mapKey!48538 () (_ BitVec 32))

(declare-fun mapRest!48538 () (Array (_ BitVec 32) ValueCell!14837))

(assert (=> mapNonEmpty!48538 (= (arr!38074 _values!996) (store mapRest!48538 mapKey!48538 mapValue!48538))))

(declare-fun b!1223340 () Bool)

(assert (=> b!1223340 (= e!694778 e!694771)))

(declare-fun res!812824 () Bool)

(assert (=> b!1223340 (=> res!812824 e!694771)))

(assert (=> b!1223340 (= res!812824 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!556672 () ListLongMap!18151)

(assert (=> b!1223340 (= lt!556672 (getCurrentListMapNoExtraKeys!5523 lt!556674 lt!556673 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556662 () V!46585)

(assert (=> b!1223340 (= lt!556673 (array!78895 (store (arr!38074 _values!996) i!673 (ValueCellFull!14837 lt!556662)) (size!38612 _values!996)))))

(declare-fun dynLambda!3371 (Int (_ BitVec 64)) V!46585)

(assert (=> b!1223340 (= lt!556662 (dynLambda!3371 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1223340 (= lt!556668 (getCurrentListMapNoExtraKeys!5523 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223341 () Bool)

(declare-fun e!694773 () Bool)

(assert (=> b!1223341 (= e!694773 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1223342 () Bool)

(assert (=> b!1223342 (= e!694768 e!694769)))

(declare-fun res!812835 () Bool)

(assert (=> b!1223342 (=> (not res!812835) (not e!694769))))

(assert (=> b!1223342 (= res!812835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556674 mask!1564))))

(assert (=> b!1223342 (= lt!556674 (array!78893 (store (arr!38073 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38611 _keys!1208)))))

(declare-fun b!1223343 () Bool)

(assert (=> b!1223343 (= e!694776 tp_is_empty!31093)))

(declare-fun b!1223344 () Bool)

(declare-fun res!812826 () Bool)

(assert (=> b!1223344 (=> (not res!812826) (not e!694768))))

(declare-datatypes ((List!26964 0))(
  ( (Nil!26961) (Cons!26960 (h!28169 (_ BitVec 64)) (t!40324 List!26964)) )
))
(declare-fun arrayNoDuplicates!0 (array!78892 (_ BitVec 32) List!26964) Bool)

(assert (=> b!1223344 (= res!812826 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26961))))

(declare-fun b!1223345 () Bool)

(declare-fun e!694775 () Bool)

(assert (=> b!1223345 (= e!694779 (and e!694775 mapRes!48538))))

(declare-fun condMapEmpty!48538 () Bool)

(declare-fun mapDefault!48538 () ValueCell!14837)

(assert (=> b!1223345 (= condMapEmpty!48538 (= (arr!38074 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14837)) mapDefault!48538)))))

(declare-fun b!1223346 () Bool)

(assert (=> b!1223346 (= e!694775 tp_is_empty!31093)))

(declare-fun b!1223347 () Bool)

(declare-fun res!812836 () Bool)

(assert (=> b!1223347 (=> (not res!812836) (not e!694768))))

(assert (=> b!1223347 (= res!812836 (= (select (arr!38073 _keys!1208) i!673) k0!934))))

(declare-fun b!1223348 () Bool)

(declare-fun res!812832 () Bool)

(assert (=> b!1223348 (=> (not res!812832) (not e!694768))))

(assert (=> b!1223348 (= res!812832 (and (= (size!38612 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38611 _keys!1208) (size!38612 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1223349 () Bool)

(declare-fun e!694777 () Unit!40368)

(declare-fun Unit!40370 () Unit!40368)

(assert (=> b!1223349 (= e!694777 Unit!40370)))

(declare-fun b!1223350 () Bool)

(declare-fun Unit!40371 () Unit!40368)

(assert (=> b!1223350 (= e!694777 Unit!40371)))

(declare-fun lt!556675 () Unit!40368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78892 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40368)

(assert (=> b!1223350 (= lt!556675 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1223350 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556664 () Unit!40368)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78892 (_ BitVec 32) (_ BitVec 32)) Unit!40368)

(assert (=> b!1223350 (= lt!556664 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1223350 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26961)))

(declare-fun lt!556663 () Unit!40368)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78892 (_ BitVec 64) (_ BitVec 32) List!26964) Unit!40368)

(assert (=> b!1223350 (= lt!556663 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26961))))

(assert (=> b!1223350 false))

(declare-fun mapIsEmpty!48538 () Bool)

(assert (=> mapIsEmpty!48538 mapRes!48538))

(declare-fun b!1223351 () Bool)

(declare-fun e!694772 () Bool)

(assert (=> b!1223351 (= e!694772 e!694773)))

(declare-fun res!812825 () Bool)

(assert (=> b!1223351 (=> res!812825 e!694773)))

(assert (=> b!1223351 (= res!812825 (not (= (select (arr!38073 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1223352 () Bool)

(assert (=> b!1223352 (= e!694780 true)))

(assert (=> b!1223352 e!694770))

(declare-fun res!812830 () Bool)

(assert (=> b!1223352 (=> (not res!812830) (not e!694770))))

(assert (=> b!1223352 (= res!812830 (not (= (select (arr!38073 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!556661 () Unit!40368)

(assert (=> b!1223352 (= lt!556661 e!694777)))

(declare-fun c!120383 () Bool)

(assert (=> b!1223352 (= c!120383 (= (select (arr!38073 _keys!1208) from!1455) k0!934))))

(assert (=> b!1223352 e!694772))

(declare-fun res!812834 () Bool)

(assert (=> b!1223352 (=> (not res!812834) (not e!694772))))

(assert (=> b!1223352 (= res!812834 (= lt!556672 (+!4153 lt!556670 lt!556665)))))

(declare-fun get!19458 (ValueCell!14837 V!46585) V!46585)

(assert (=> b!1223352 (= lt!556665 (tuple2!20183 (select (arr!38073 _keys!1208) from!1455) (get!19458 (select (arr!38074 _values!996) from!1455) lt!556662)))))

(declare-fun b!1223353 () Bool)

(declare-fun res!812828 () Bool)

(assert (=> b!1223353 (=> (not res!812828) (not e!694769))))

(assert (=> b!1223353 (= res!812828 (arrayNoDuplicates!0 lt!556674 #b00000000000000000000000000000000 Nil!26961))))

(assert (= (and start!101694 res!812838) b!1223337))

(assert (= (and b!1223337 res!812823) b!1223348))

(assert (= (and b!1223348 res!812832) b!1223333))

(assert (= (and b!1223333 res!812831) b!1223344))

(assert (= (and b!1223344 res!812826) b!1223336))

(assert (= (and b!1223336 res!812833) b!1223338))

(assert (= (and b!1223338 res!812829) b!1223347))

(assert (= (and b!1223347 res!812836) b!1223342))

(assert (= (and b!1223342 res!812835) b!1223353))

(assert (= (and b!1223353 res!812828) b!1223335))

(assert (= (and b!1223335 (not res!812827)) b!1223340))

(assert (= (and b!1223340 (not res!812824)) b!1223334))

(assert (= (and b!1223334 (not res!812837)) b!1223352))

(assert (= (and b!1223352 res!812834) b!1223351))

(assert (= (and b!1223351 (not res!812825)) b!1223341))

(assert (= (and b!1223352 c!120383) b!1223350))

(assert (= (and b!1223352 (not c!120383)) b!1223349))

(assert (= (and b!1223352 res!812830) b!1223339))

(assert (= (and b!1223345 condMapEmpty!48538) mapIsEmpty!48538))

(assert (= (and b!1223345 (not condMapEmpty!48538)) mapNonEmpty!48538))

(get-info :version)

(assert (= (and mapNonEmpty!48538 ((_ is ValueCellFull!14837) mapValue!48538)) b!1223343))

(assert (= (and b!1223345 ((_ is ValueCellFull!14837) mapDefault!48538)) b!1223346))

(assert (= start!101694 b!1223345))

(declare-fun b_lambda!22359 () Bool)

(assert (=> (not b_lambda!22359) (not b!1223340)))

(declare-fun t!40322 () Bool)

(declare-fun tb!11181 () Bool)

(assert (=> (and start!101694 (= defaultEntry!1004 defaultEntry!1004) t!40322) tb!11181))

(declare-fun result!22983 () Bool)

(assert (=> tb!11181 (= result!22983 tp_is_empty!31093)))

(assert (=> b!1223340 t!40322))

(declare-fun b_and!44023 () Bool)

(assert (= b_and!44021 (and (=> t!40322 result!22983) b_and!44023)))

(declare-fun m!1127885 () Bool)

(assert (=> b!1223334 m!1127885))

(declare-fun m!1127887 () Bool)

(assert (=> b!1223334 m!1127887))

(declare-fun m!1127889 () Bool)

(assert (=> b!1223334 m!1127889))

(declare-fun m!1127891 () Bool)

(assert (=> b!1223334 m!1127891))

(declare-fun m!1127893 () Bool)

(assert (=> b!1223334 m!1127893))

(declare-fun m!1127895 () Bool)

(assert (=> b!1223334 m!1127895))

(assert (=> b!1223334 m!1127893))

(declare-fun m!1127897 () Bool)

(assert (=> b!1223347 m!1127897))

(declare-fun m!1127899 () Bool)

(assert (=> b!1223338 m!1127899))

(declare-fun m!1127901 () Bool)

(assert (=> b!1223333 m!1127901))

(declare-fun m!1127903 () Bool)

(assert (=> b!1223339 m!1127903))

(declare-fun m!1127905 () Bool)

(assert (=> start!101694 m!1127905))

(declare-fun m!1127907 () Bool)

(assert (=> start!101694 m!1127907))

(declare-fun m!1127909 () Bool)

(assert (=> b!1223353 m!1127909))

(declare-fun m!1127911 () Bool)

(assert (=> b!1223340 m!1127911))

(declare-fun m!1127913 () Bool)

(assert (=> b!1223340 m!1127913))

(declare-fun m!1127915 () Bool)

(assert (=> b!1223340 m!1127915))

(declare-fun m!1127917 () Bool)

(assert (=> b!1223340 m!1127917))

(declare-fun m!1127919 () Bool)

(assert (=> b!1223350 m!1127919))

(declare-fun m!1127921 () Bool)

(assert (=> b!1223350 m!1127921))

(declare-fun m!1127923 () Bool)

(assert (=> b!1223350 m!1127923))

(declare-fun m!1127925 () Bool)

(assert (=> b!1223350 m!1127925))

(declare-fun m!1127927 () Bool)

(assert (=> b!1223350 m!1127927))

(declare-fun m!1127929 () Bool)

(assert (=> b!1223341 m!1127929))

(declare-fun m!1127931 () Bool)

(assert (=> mapNonEmpty!48538 m!1127931))

(assert (=> b!1223352 m!1127893))

(declare-fun m!1127933 () Bool)

(assert (=> b!1223352 m!1127933))

(declare-fun m!1127935 () Bool)

(assert (=> b!1223352 m!1127935))

(assert (=> b!1223352 m!1127935))

(declare-fun m!1127937 () Bool)

(assert (=> b!1223352 m!1127937))

(declare-fun m!1127939 () Bool)

(assert (=> b!1223337 m!1127939))

(declare-fun m!1127941 () Bool)

(assert (=> b!1223335 m!1127941))

(declare-fun m!1127943 () Bool)

(assert (=> b!1223335 m!1127943))

(assert (=> b!1223351 m!1127893))

(declare-fun m!1127945 () Bool)

(assert (=> b!1223344 m!1127945))

(declare-fun m!1127947 () Bool)

(assert (=> b!1223342 m!1127947))

(declare-fun m!1127949 () Bool)

(assert (=> b!1223342 m!1127949))

(check-sat (not b!1223353) (not b!1223340) (not b!1223337) (not b!1223334) (not b_next!26389) (not b_lambda!22359) (not b!1223341) (not b!1223338) (not mapNonEmpty!48538) (not b!1223342) b_and!44023 tp_is_empty!31093 (not b!1223350) (not b!1223344) (not b!1223335) (not b!1223352) (not start!101694) (not b!1223333) (not b!1223339))
(check-sat b_and!44023 (not b_next!26389))
