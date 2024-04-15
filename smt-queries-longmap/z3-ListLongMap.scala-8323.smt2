; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101280 () Bool)

(assert start!101280)

(declare-fun b_free!26209 () Bool)

(declare-fun b_next!26209 () Bool)

(assert (=> start!101280 (= b_free!26209 (not b_next!26209))))

(declare-fun tp!91648 () Bool)

(declare-fun b_and!43517 () Bool)

(assert (=> start!101280 (= tp!91648 b_and!43517)))

(declare-fun b!1216821 () Bool)

(declare-fun res!808078 () Bool)

(declare-fun e!690820 () Bool)

(assert (=> b!1216821 (=> (not res!808078) (not e!690820))))

(declare-datatypes ((array!78518 0))(
  ( (array!78519 (arr!37894 (Array (_ BitVec 32) (_ BitVec 64))) (size!38432 (_ BitVec 32))) )
))
(declare-fun lt!552900 () array!78518)

(declare-datatypes ((List!26813 0))(
  ( (Nil!26810) (Cons!26809 (h!28018 (_ BitVec 64)) (t!39993 List!26813)) )
))
(declare-fun arrayNoDuplicates!0 (array!78518 (_ BitVec 32) List!26813) Bool)

(assert (=> b!1216821 (= res!808078 (arrayNoDuplicates!0 lt!552900 #b00000000000000000000000000000000 Nil!26810))))

(declare-fun b!1216822 () Bool)

(declare-fun res!808081 () Bool)

(declare-fun e!690818 () Bool)

(assert (=> b!1216822 (=> (not res!808081) (not e!690818))))

(declare-fun _keys!1208 () array!78518)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46345 0))(
  ( (V!46346 (val!15513 Int)) )
))
(declare-datatypes ((ValueCell!14747 0))(
  ( (ValueCellFull!14747 (v!18165 V!46345)) (EmptyCell!14747) )
))
(declare-datatypes ((array!78520 0))(
  ( (array!78521 (arr!37895 (Array (_ BitVec 32) ValueCell!14747)) (size!38433 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78520)

(assert (=> b!1216822 (= res!808081 (and (= (size!38433 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38432 _keys!1208) (size!38433 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216823 () Bool)

(declare-fun e!690822 () Bool)

(declare-fun tp_is_empty!30913 () Bool)

(assert (=> b!1216823 (= e!690822 tp_is_empty!30913)))

(declare-fun b!1216824 () Bool)

(declare-fun res!808083 () Bool)

(assert (=> b!1216824 (=> (not res!808083) (not e!690818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78518 (_ BitVec 32)) Bool)

(assert (=> b!1216824 (= res!808083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216825 () Bool)

(declare-fun e!690819 () Bool)

(assert (=> b!1216825 (= e!690820 (not e!690819))))

(declare-fun res!808077 () Bool)

(assert (=> b!1216825 (=> res!808077 e!690819)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216825 (= res!808077 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78518 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216825 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40205 0))(
  ( (Unit!40206) )
))
(declare-fun lt!552904 () Unit!40205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78518 (_ BitVec 64) (_ BitVec 32)) Unit!40205)

(assert (=> b!1216825 (= lt!552904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216826 () Bool)

(declare-fun e!690816 () Bool)

(assert (=> b!1216826 (= e!690819 e!690816)))

(declare-fun res!808076 () Bool)

(assert (=> b!1216826 (=> res!808076 e!690816)))

(assert (=> b!1216826 (= res!808076 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46345)

(declare-datatypes ((tuple2!20036 0))(
  ( (tuple2!20037 (_1!10029 (_ BitVec 64)) (_2!10029 V!46345)) )
))
(declare-datatypes ((List!26814 0))(
  ( (Nil!26811) (Cons!26810 (h!28019 tuple2!20036) (t!39994 List!26814)) )
))
(declare-datatypes ((ListLongMap!18005 0))(
  ( (ListLongMap!18006 (toList!9018 List!26814)) )
))
(declare-fun lt!552903 () ListLongMap!18005)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!552901 () array!78520)

(declare-fun minValue!944 () V!46345)

(declare-fun getCurrentListMapNoExtraKeys!5457 (array!78518 array!78520 (_ BitVec 32) (_ BitVec 32) V!46345 V!46345 (_ BitVec 32) Int) ListLongMap!18005)

(assert (=> b!1216826 (= lt!552903 (getCurrentListMapNoExtraKeys!5457 lt!552900 lt!552901 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3308 (Int (_ BitVec 64)) V!46345)

(assert (=> b!1216826 (= lt!552901 (array!78521 (store (arr!37895 _values!996) i!673 (ValueCellFull!14747 (dynLambda!3308 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38433 _values!996)))))

(declare-fun lt!552902 () ListLongMap!18005)

(assert (=> b!1216826 (= lt!552902 (getCurrentListMapNoExtraKeys!5457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216827 () Bool)

(assert (=> b!1216827 (= e!690818 e!690820)))

(declare-fun res!808079 () Bool)

(assert (=> b!1216827 (=> (not res!808079) (not e!690820))))

(assert (=> b!1216827 (= res!808079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552900 mask!1564))))

(assert (=> b!1216827 (= lt!552900 (array!78519 (store (arr!37894 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38432 _keys!1208)))))

(declare-fun b!1216828 () Bool)

(declare-fun e!690823 () Bool)

(declare-fun mapRes!48244 () Bool)

(assert (=> b!1216828 (= e!690823 (and e!690822 mapRes!48244))))

(declare-fun condMapEmpty!48244 () Bool)

(declare-fun mapDefault!48244 () ValueCell!14747)

(assert (=> b!1216828 (= condMapEmpty!48244 (= (arr!37895 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14747)) mapDefault!48244)))))

(declare-fun b!1216829 () Bool)

(declare-fun res!808087 () Bool)

(assert (=> b!1216829 (=> (not res!808087) (not e!690818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216829 (= res!808087 (validMask!0 mask!1564))))

(declare-fun b!1216830 () Bool)

(declare-fun res!808075 () Bool)

(assert (=> b!1216830 (=> (not res!808075) (not e!690818))))

(assert (=> b!1216830 (= res!808075 (= (select (arr!37894 _keys!1208) i!673) k0!934))))

(declare-fun b!1216831 () Bool)

(declare-fun e!690817 () Bool)

(assert (=> b!1216831 (= e!690817 tp_is_empty!30913)))

(declare-fun res!808082 () Bool)

(assert (=> start!101280 (=> (not res!808082) (not e!690818))))

(assert (=> start!101280 (= res!808082 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38432 _keys!1208))))))

(assert (=> start!101280 e!690818))

(assert (=> start!101280 tp_is_empty!30913))

(declare-fun array_inv!28968 (array!78518) Bool)

(assert (=> start!101280 (array_inv!28968 _keys!1208)))

(assert (=> start!101280 true))

(assert (=> start!101280 tp!91648))

(declare-fun array_inv!28969 (array!78520) Bool)

(assert (=> start!101280 (and (array_inv!28969 _values!996) e!690823)))

(declare-fun mapIsEmpty!48244 () Bool)

(assert (=> mapIsEmpty!48244 mapRes!48244))

(declare-fun b!1216832 () Bool)

(declare-fun res!808080 () Bool)

(assert (=> b!1216832 (=> (not res!808080) (not e!690818))))

(assert (=> b!1216832 (= res!808080 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26810))))

(declare-fun b!1216833 () Bool)

(declare-fun e!690821 () Bool)

(assert (=> b!1216833 (= e!690816 e!690821)))

(declare-fun res!808086 () Bool)

(assert (=> b!1216833 (=> res!808086 e!690821)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216833 (= res!808086 (not (validKeyInArray!0 (select (arr!37894 _keys!1208) from!1455))))))

(declare-fun -!1856 (ListLongMap!18005 (_ BitVec 64)) ListLongMap!18005)

(assert (=> b!1216833 (= (getCurrentListMapNoExtraKeys!5457 lt!552900 lt!552901 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1856 (getCurrentListMapNoExtraKeys!5457 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!552905 () Unit!40205)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1091 (array!78518 array!78520 (_ BitVec 32) (_ BitVec 32) V!46345 V!46345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40205)

(assert (=> b!1216833 (= lt!552905 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1091 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1216834 () Bool)

(declare-fun res!808084 () Bool)

(assert (=> b!1216834 (=> (not res!808084) (not e!690818))))

(assert (=> b!1216834 (= res!808084 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38432 _keys!1208))))))

(declare-fun mapNonEmpty!48244 () Bool)

(declare-fun tp!91649 () Bool)

(assert (=> mapNonEmpty!48244 (= mapRes!48244 (and tp!91649 e!690817))))

(declare-fun mapKey!48244 () (_ BitVec 32))

(declare-fun mapRest!48244 () (Array (_ BitVec 32) ValueCell!14747))

(declare-fun mapValue!48244 () ValueCell!14747)

(assert (=> mapNonEmpty!48244 (= (arr!37895 _values!996) (store mapRest!48244 mapKey!48244 mapValue!48244))))

(declare-fun b!1216835 () Bool)

(declare-fun res!808085 () Bool)

(assert (=> b!1216835 (=> (not res!808085) (not e!690818))))

(assert (=> b!1216835 (= res!808085 (validKeyInArray!0 k0!934))))

(declare-fun b!1216836 () Bool)

(assert (=> b!1216836 (= e!690821 (bvslt from!1455 (size!38433 _values!996)))))

(assert (= (and start!101280 res!808082) b!1216829))

(assert (= (and b!1216829 res!808087) b!1216822))

(assert (= (and b!1216822 res!808081) b!1216824))

(assert (= (and b!1216824 res!808083) b!1216832))

(assert (= (and b!1216832 res!808080) b!1216834))

(assert (= (and b!1216834 res!808084) b!1216835))

(assert (= (and b!1216835 res!808085) b!1216830))

(assert (= (and b!1216830 res!808075) b!1216827))

(assert (= (and b!1216827 res!808079) b!1216821))

(assert (= (and b!1216821 res!808078) b!1216825))

(assert (= (and b!1216825 (not res!808077)) b!1216826))

(assert (= (and b!1216826 (not res!808076)) b!1216833))

(assert (= (and b!1216833 (not res!808086)) b!1216836))

(assert (= (and b!1216828 condMapEmpty!48244) mapIsEmpty!48244))

(assert (= (and b!1216828 (not condMapEmpty!48244)) mapNonEmpty!48244))

(get-info :version)

(assert (= (and mapNonEmpty!48244 ((_ is ValueCellFull!14747) mapValue!48244)) b!1216831))

(assert (= (and b!1216828 ((_ is ValueCellFull!14747) mapDefault!48244)) b!1216823))

(assert (= start!101280 b!1216828))

(declare-fun b_lambda!21875 () Bool)

(assert (=> (not b_lambda!21875) (not b!1216826)))

(declare-fun t!39992 () Bool)

(declare-fun tb!11001 () Bool)

(assert (=> (and start!101280 (= defaultEntry!1004 defaultEntry!1004) t!39992) tb!11001))

(declare-fun result!22607 () Bool)

(assert (=> tb!11001 (= result!22607 tp_is_empty!30913)))

(assert (=> b!1216826 t!39992))

(declare-fun b_and!43519 () Bool)

(assert (= b_and!43517 (and (=> t!39992 result!22607) b_and!43519)))

(declare-fun m!1121073 () Bool)

(assert (=> b!1216824 m!1121073))

(declare-fun m!1121075 () Bool)

(assert (=> b!1216832 m!1121075))

(declare-fun m!1121077 () Bool)

(assert (=> b!1216833 m!1121077))

(declare-fun m!1121079 () Bool)

(assert (=> b!1216833 m!1121079))

(declare-fun m!1121081 () Bool)

(assert (=> b!1216833 m!1121081))

(assert (=> b!1216833 m!1121077))

(declare-fun m!1121083 () Bool)

(assert (=> b!1216833 m!1121083))

(declare-fun m!1121085 () Bool)

(assert (=> b!1216833 m!1121085))

(declare-fun m!1121087 () Bool)

(assert (=> b!1216833 m!1121087))

(assert (=> b!1216833 m!1121085))

(declare-fun m!1121089 () Bool)

(assert (=> b!1216821 m!1121089))

(declare-fun m!1121091 () Bool)

(assert (=> b!1216835 m!1121091))

(declare-fun m!1121093 () Bool)

(assert (=> start!101280 m!1121093))

(declare-fun m!1121095 () Bool)

(assert (=> start!101280 m!1121095))

(declare-fun m!1121097 () Bool)

(assert (=> b!1216830 m!1121097))

(declare-fun m!1121099 () Bool)

(assert (=> b!1216829 m!1121099))

(declare-fun m!1121101 () Bool)

(assert (=> b!1216827 m!1121101))

(declare-fun m!1121103 () Bool)

(assert (=> b!1216827 m!1121103))

(declare-fun m!1121105 () Bool)

(assert (=> b!1216826 m!1121105))

(declare-fun m!1121107 () Bool)

(assert (=> b!1216826 m!1121107))

(declare-fun m!1121109 () Bool)

(assert (=> b!1216826 m!1121109))

(declare-fun m!1121111 () Bool)

(assert (=> b!1216826 m!1121111))

(declare-fun m!1121113 () Bool)

(assert (=> b!1216825 m!1121113))

(declare-fun m!1121115 () Bool)

(assert (=> b!1216825 m!1121115))

(declare-fun m!1121117 () Bool)

(assert (=> mapNonEmpty!48244 m!1121117))

(check-sat b_and!43519 (not b!1216827) (not b!1216832) (not start!101280) (not b!1216826) (not b!1216835) tp_is_empty!30913 (not b!1216824) (not b!1216825) (not b_lambda!21875) (not b_next!26209) (not b!1216821) (not b!1216833) (not b!1216829) (not mapNonEmpty!48244))
(check-sat b_and!43519 (not b_next!26209))
