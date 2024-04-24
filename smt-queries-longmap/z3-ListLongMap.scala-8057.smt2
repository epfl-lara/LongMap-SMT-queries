; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99418 () Bool)

(assert start!99418)

(declare-fun b_free!24787 () Bool)

(declare-fun b_next!24787 () Bool)

(assert (=> start!99418 (= b_free!24787 (not b_next!24787))))

(declare-fun tp!87071 () Bool)

(declare-fun b_and!40425 () Bool)

(assert (=> start!99418 (= tp!87071 b_and!40425)))

(declare-fun b!1168837 () Bool)

(declare-fun res!775055 () Bool)

(declare-fun e!664441 () Bool)

(assert (=> b!1168837 (=> (not res!775055) (not e!664441))))

(declare-datatypes ((array!75509 0))(
  ( (array!75510 (arr!36399 (Array (_ BitVec 32) (_ BitVec 64))) (size!36936 (_ BitVec 32))) )
))
(declare-fun lt!526164 () array!75509)

(declare-datatypes ((List!25548 0))(
  ( (Nil!25545) (Cons!25544 (h!26762 (_ BitVec 64)) (t!37319 List!25548)) )
))
(declare-fun arrayNoDuplicates!0 (array!75509 (_ BitVec 32) List!25548) Bool)

(assert (=> b!1168837 (= res!775055 (arrayNoDuplicates!0 lt!526164 #b00000000000000000000000000000000 Nil!25545))))

(declare-fun b!1168838 () Bool)

(declare-fun e!664437 () Bool)

(declare-fun tp_is_empty!29317 () Bool)

(assert (=> b!1168838 (= e!664437 tp_is_empty!29317)))

(declare-fun b!1168839 () Bool)

(declare-fun res!775059 () Bool)

(declare-fun e!664435 () Bool)

(assert (=> b!1168839 (=> (not res!775059) (not e!664435))))

(declare-fun _keys!1208 () array!75509)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1168839 (= res!775059 (= (select (arr!36399 _keys!1208) i!673) k0!934))))

(declare-fun b!1168840 () Bool)

(declare-fun e!664440 () Bool)

(declare-fun e!664434 () Bool)

(assert (=> b!1168840 (= e!664440 e!664434)))

(declare-fun res!775054 () Bool)

(assert (=> b!1168840 (=> res!775054 e!664434)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168840 (= res!775054 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!44217 0))(
  ( (V!44218 (val!14715 Int)) )
))
(declare-fun zeroValue!944 () V!44217)

(declare-datatypes ((tuple2!18808 0))(
  ( (tuple2!18809 (_1!9415 (_ BitVec 64)) (_2!9415 V!44217)) )
))
(declare-datatypes ((List!25549 0))(
  ( (Nil!25546) (Cons!25545 (h!26763 tuple2!18808) (t!37320 List!25549)) )
))
(declare-datatypes ((ListLongMap!16785 0))(
  ( (ListLongMap!16786 (toList!8408 List!25549)) )
))
(declare-fun lt!526162 () ListLongMap!16785)

(declare-datatypes ((ValueCell!13949 0))(
  ( (ValueCellFull!13949 (v!17348 V!44217)) (EmptyCell!13949) )
))
(declare-datatypes ((array!75511 0))(
  ( (array!75512 (arr!36400 (Array (_ BitVec 32) ValueCell!13949)) (size!36937 (_ BitVec 32))) )
))
(declare-fun lt!526161 () array!75511)

(declare-fun minValue!944 () V!44217)

(declare-fun getCurrentListMapNoExtraKeys!4899 (array!75509 array!75511 (_ BitVec 32) (_ BitVec 32) V!44217 V!44217 (_ BitVec 32) Int) ListLongMap!16785)

(assert (=> b!1168840 (= lt!526162 (getCurrentListMapNoExtraKeys!4899 lt!526164 lt!526161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75511)

(declare-fun dynLambda!2887 (Int (_ BitVec 64)) V!44217)

(assert (=> b!1168840 (= lt!526161 (array!75512 (store (arr!36400 _values!996) i!673 (ValueCellFull!13949 (dynLambda!2887 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36937 _values!996)))))

(declare-fun lt!526165 () ListLongMap!16785)

(assert (=> b!1168840 (= lt!526165 (getCurrentListMapNoExtraKeys!4899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168841 () Bool)

(declare-fun res!775051 () Bool)

(assert (=> b!1168841 (=> (not res!775051) (not e!664435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75509 (_ BitVec 32)) Bool)

(assert (=> b!1168841 (= res!775051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168842 () Bool)

(declare-fun res!775058 () Bool)

(assert (=> b!1168842 (=> (not res!775058) (not e!664435))))

(assert (=> b!1168842 (= res!775058 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36936 _keys!1208))))))

(declare-fun mapNonEmpty!45800 () Bool)

(declare-fun mapRes!45800 () Bool)

(declare-fun tp!87072 () Bool)

(declare-fun e!664439 () Bool)

(assert (=> mapNonEmpty!45800 (= mapRes!45800 (and tp!87072 e!664439))))

(declare-fun mapKey!45800 () (_ BitVec 32))

(declare-fun mapRest!45800 () (Array (_ BitVec 32) ValueCell!13949))

(declare-fun mapValue!45800 () ValueCell!13949)

(assert (=> mapNonEmpty!45800 (= (arr!36400 _values!996) (store mapRest!45800 mapKey!45800 mapValue!45800))))

(declare-fun b!1168843 () Bool)

(declare-fun res!775052 () Bool)

(assert (=> b!1168843 (=> (not res!775052) (not e!664435))))

(assert (=> b!1168843 (= res!775052 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25545))))

(declare-fun b!1168844 () Bool)

(declare-fun res!775050 () Bool)

(assert (=> b!1168844 (=> (not res!775050) (not e!664435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168844 (= res!775050 (validMask!0 mask!1564))))

(declare-fun b!1168845 () Bool)

(assert (=> b!1168845 (= e!664435 e!664441)))

(declare-fun res!775057 () Bool)

(assert (=> b!1168845 (=> (not res!775057) (not e!664441))))

(assert (=> b!1168845 (= res!775057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526164 mask!1564))))

(assert (=> b!1168845 (= lt!526164 (array!75510 (store (arr!36399 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36936 _keys!1208)))))

(declare-fun mapIsEmpty!45800 () Bool)

(assert (=> mapIsEmpty!45800 mapRes!45800))

(declare-fun b!1168846 () Bool)

(declare-fun res!775048 () Bool)

(assert (=> b!1168846 (=> (not res!775048) (not e!664435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168846 (= res!775048 (validKeyInArray!0 k0!934))))

(declare-fun res!775056 () Bool)

(assert (=> start!99418 (=> (not res!775056) (not e!664435))))

(assert (=> start!99418 (= res!775056 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36936 _keys!1208))))))

(assert (=> start!99418 e!664435))

(assert (=> start!99418 tp_is_empty!29317))

(declare-fun array_inv!27904 (array!75509) Bool)

(assert (=> start!99418 (array_inv!27904 _keys!1208)))

(assert (=> start!99418 true))

(assert (=> start!99418 tp!87071))

(declare-fun e!664438 () Bool)

(declare-fun array_inv!27905 (array!75511) Bool)

(assert (=> start!99418 (and (array_inv!27905 _values!996) e!664438)))

(declare-fun b!1168847 () Bool)

(assert (=> b!1168847 (= e!664434 true)))

(declare-fun -!1470 (ListLongMap!16785 (_ BitVec 64)) ListLongMap!16785)

(assert (=> b!1168847 (= (getCurrentListMapNoExtraKeys!4899 lt!526164 lt!526161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1470 (getCurrentListMapNoExtraKeys!4899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38511 0))(
  ( (Unit!38512) )
))
(declare-fun lt!526160 () Unit!38511)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!695 (array!75509 array!75511 (_ BitVec 32) (_ BitVec 32) V!44217 V!44217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38511)

(assert (=> b!1168847 (= lt!526160 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!695 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168848 () Bool)

(declare-fun res!775049 () Bool)

(assert (=> b!1168848 (=> (not res!775049) (not e!664435))))

(assert (=> b!1168848 (= res!775049 (and (= (size!36937 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36936 _keys!1208) (size!36937 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168849 () Bool)

(assert (=> b!1168849 (= e!664439 tp_is_empty!29317)))

(declare-fun b!1168850 () Bool)

(assert (=> b!1168850 (= e!664438 (and e!664437 mapRes!45800))))

(declare-fun condMapEmpty!45800 () Bool)

(declare-fun mapDefault!45800 () ValueCell!13949)

(assert (=> b!1168850 (= condMapEmpty!45800 (= (arr!36400 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13949)) mapDefault!45800)))))

(declare-fun b!1168851 () Bool)

(assert (=> b!1168851 (= e!664441 (not e!664440))))

(declare-fun res!775053 () Bool)

(assert (=> b!1168851 (=> res!775053 e!664440)))

(assert (=> b!1168851 (= res!775053 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168851 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526163 () Unit!38511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75509 (_ BitVec 64) (_ BitVec 32)) Unit!38511)

(assert (=> b!1168851 (= lt!526163 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99418 res!775056) b!1168844))

(assert (= (and b!1168844 res!775050) b!1168848))

(assert (= (and b!1168848 res!775049) b!1168841))

(assert (= (and b!1168841 res!775051) b!1168843))

(assert (= (and b!1168843 res!775052) b!1168842))

(assert (= (and b!1168842 res!775058) b!1168846))

(assert (= (and b!1168846 res!775048) b!1168839))

(assert (= (and b!1168839 res!775059) b!1168845))

(assert (= (and b!1168845 res!775057) b!1168837))

(assert (= (and b!1168837 res!775055) b!1168851))

(assert (= (and b!1168851 (not res!775053)) b!1168840))

(assert (= (and b!1168840 (not res!775054)) b!1168847))

(assert (= (and b!1168850 condMapEmpty!45800) mapIsEmpty!45800))

(assert (= (and b!1168850 (not condMapEmpty!45800)) mapNonEmpty!45800))

(get-info :version)

(assert (= (and mapNonEmpty!45800 ((_ is ValueCellFull!13949) mapValue!45800)) b!1168849))

(assert (= (and b!1168850 ((_ is ValueCellFull!13949) mapDefault!45800)) b!1168838))

(assert (= start!99418 b!1168850))

(declare-fun b_lambda!19887 () Bool)

(assert (=> (not b_lambda!19887) (not b!1168840)))

(declare-fun t!37318 () Bool)

(declare-fun tb!9591 () Bool)

(assert (=> (and start!99418 (= defaultEntry!1004 defaultEntry!1004) t!37318) tb!9591))

(declare-fun result!19755 () Bool)

(assert (=> tb!9591 (= result!19755 tp_is_empty!29317)))

(assert (=> b!1168840 t!37318))

(declare-fun b_and!40427 () Bool)

(assert (= b_and!40425 (and (=> t!37318 result!19755) b_and!40427)))

(declare-fun m!1077041 () Bool)

(assert (=> start!99418 m!1077041))

(declare-fun m!1077043 () Bool)

(assert (=> start!99418 m!1077043))

(declare-fun m!1077045 () Bool)

(assert (=> b!1168847 m!1077045))

(declare-fun m!1077047 () Bool)

(assert (=> b!1168847 m!1077047))

(assert (=> b!1168847 m!1077047))

(declare-fun m!1077049 () Bool)

(assert (=> b!1168847 m!1077049))

(declare-fun m!1077051 () Bool)

(assert (=> b!1168847 m!1077051))

(declare-fun m!1077053 () Bool)

(assert (=> b!1168837 m!1077053))

(declare-fun m!1077055 () Bool)

(assert (=> b!1168844 m!1077055))

(declare-fun m!1077057 () Bool)

(assert (=> b!1168839 m!1077057))

(declare-fun m!1077059 () Bool)

(assert (=> mapNonEmpty!45800 m!1077059))

(declare-fun m!1077061 () Bool)

(assert (=> b!1168851 m!1077061))

(declare-fun m!1077063 () Bool)

(assert (=> b!1168851 m!1077063))

(declare-fun m!1077065 () Bool)

(assert (=> b!1168846 m!1077065))

(declare-fun m!1077067 () Bool)

(assert (=> b!1168843 m!1077067))

(declare-fun m!1077069 () Bool)

(assert (=> b!1168845 m!1077069))

(declare-fun m!1077071 () Bool)

(assert (=> b!1168845 m!1077071))

(declare-fun m!1077073 () Bool)

(assert (=> b!1168840 m!1077073))

(declare-fun m!1077075 () Bool)

(assert (=> b!1168840 m!1077075))

(declare-fun m!1077077 () Bool)

(assert (=> b!1168840 m!1077077))

(declare-fun m!1077079 () Bool)

(assert (=> b!1168840 m!1077079))

(declare-fun m!1077081 () Bool)

(assert (=> b!1168841 m!1077081))

(check-sat (not b!1168845) (not b!1168847) (not b!1168851) (not b_next!24787) (not start!99418) (not b!1168846) (not b_lambda!19887) (not b!1168844) (not b!1168837) (not b!1168841) (not b!1168843) tp_is_empty!29317 (not b!1168840) b_and!40427 (not mapNonEmpty!45800))
(check-sat b_and!40427 (not b_next!24787))
