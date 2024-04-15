; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97448 () Bool)

(assert start!97448)

(declare-fun b_free!23425 () Bool)

(declare-fun b_next!23425 () Bool)

(assert (=> start!97448 (= b_free!23425 (not b_next!23425))))

(declare-fun tp!82574 () Bool)

(declare-fun b_and!37665 () Bool)

(assert (=> start!97448 (= tp!82574 b_and!37665)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!42041 0))(
  ( (V!42042 (val!13899 Int)) )
))
(declare-datatypes ((tuple2!17658 0))(
  ( (tuple2!17659 (_1!8840 (_ BitVec 64)) (_2!8840 V!42041)) )
))
(declare-datatypes ((List!24310 0))(
  ( (Nil!24307) (Cons!24306 (h!25515 tuple2!17658) (t!34772 List!24310)) )
))
(declare-datatypes ((ListLongMap!15627 0))(
  ( (ListLongMap!15628 (toList!7829 List!24310)) )
))
(declare-fun call!46949 () ListLongMap!15627)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13133 0))(
  ( (ValueCellFull!13133 (v!16531 V!42041)) (EmptyCell!13133) )
))
(declare-datatypes ((array!72180 0))(
  ( (array!72181 (arr!34743 (Array (_ BitVec 32) ValueCell!13133)) (size!35281 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72180)

(declare-datatypes ((array!72182 0))(
  ( (array!72183 (arr!34744 (Array (_ BitVec 32) (_ BitVec 64))) (size!35282 (_ BitVec 32))) )
))
(declare-fun lt!496250 () array!72182)

(declare-fun minValue!944 () V!42041)

(declare-fun zeroValue!944 () V!42041)

(declare-fun bm!46945 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4339 (array!72182 array!72180 (_ BitVec 32) (_ BitVec 32) V!42041 V!42041 (_ BitVec 32) Int) ListLongMap!15627)

(declare-fun dynLambda!2402 (Int (_ BitVec 64)) V!42041)

(assert (=> bm!46945 (= call!46949 (getCurrentListMapNoExtraKeys!4339 lt!496250 (array!72181 (store (arr!34743 _values!996) i!673 (ValueCellFull!13133 (dynLambda!2402 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35281 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111902 () Bool)

(declare-fun e!633974 () Bool)

(declare-fun tp_is_empty!27685 () Bool)

(assert (=> b!1111902 (= e!633974 tp_is_empty!27685)))

(declare-fun b!1111903 () Bool)

(declare-fun e!633972 () Bool)

(declare-fun call!46948 () ListLongMap!15627)

(assert (=> b!1111903 (= e!633972 (= call!46949 call!46948))))

(declare-fun _keys!1208 () array!72182)

(declare-fun bm!46946 () Bool)

(assert (=> bm!46946 (= call!46948 (getCurrentListMapNoExtraKeys!4339 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111904 () Bool)

(declare-fun res!742017 () Bool)

(declare-fun e!633976 () Bool)

(assert (=> b!1111904 (=> (not res!742017) (not e!633976))))

(declare-datatypes ((List!24311 0))(
  ( (Nil!24308) (Cons!24307 (h!25516 (_ BitVec 64)) (t!34773 List!24311)) )
))
(declare-fun arrayNoDuplicates!0 (array!72182 (_ BitVec 32) List!24311) Bool)

(assert (=> b!1111904 (= res!742017 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24308))))

(declare-fun mapIsEmpty!43345 () Bool)

(declare-fun mapRes!43345 () Bool)

(assert (=> mapIsEmpty!43345 mapRes!43345))

(declare-fun b!1111905 () Bool)

(declare-fun res!742012 () Bool)

(assert (=> b!1111905 (=> (not res!742012) (not e!633976))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1111905 (= res!742012 (= (select (arr!34744 _keys!1208) i!673) k0!934))))

(declare-fun b!1111906 () Bool)

(declare-fun res!742009 () Bool)

(declare-fun e!633973 () Bool)

(assert (=> b!1111906 (=> (not res!742009) (not e!633973))))

(assert (=> b!1111906 (= res!742009 (arrayNoDuplicates!0 lt!496250 #b00000000000000000000000000000000 Nil!24308))))

(declare-fun res!742018 () Bool)

(assert (=> start!97448 (=> (not res!742018) (not e!633976))))

(assert (=> start!97448 (= res!742018 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35282 _keys!1208))))))

(assert (=> start!97448 e!633976))

(assert (=> start!97448 tp_is_empty!27685))

(declare-fun array_inv!26784 (array!72182) Bool)

(assert (=> start!97448 (array_inv!26784 _keys!1208)))

(assert (=> start!97448 true))

(assert (=> start!97448 tp!82574))

(declare-fun e!633977 () Bool)

(declare-fun array_inv!26785 (array!72180) Bool)

(assert (=> start!97448 (and (array_inv!26785 _values!996) e!633977)))

(declare-fun b!1111907 () Bool)

(declare-fun res!742010 () Bool)

(assert (=> b!1111907 (=> (not res!742010) (not e!633976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72182 (_ BitVec 32)) Bool)

(assert (=> b!1111907 (= res!742010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111908 () Bool)

(assert (=> b!1111908 (= e!633976 e!633973)))

(declare-fun res!742014 () Bool)

(assert (=> b!1111908 (=> (not res!742014) (not e!633973))))

(assert (=> b!1111908 (= res!742014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496250 mask!1564))))

(assert (=> b!1111908 (= lt!496250 (array!72183 (store (arr!34744 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35282 _keys!1208)))))

(declare-fun b!1111909 () Bool)

(declare-fun res!742016 () Bool)

(assert (=> b!1111909 (=> (not res!742016) (not e!633976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111909 (= res!742016 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43345 () Bool)

(declare-fun tp!82573 () Bool)

(assert (=> mapNonEmpty!43345 (= mapRes!43345 (and tp!82573 e!633974))))

(declare-fun mapRest!43345 () (Array (_ BitVec 32) ValueCell!13133))

(declare-fun mapKey!43345 () (_ BitVec 32))

(declare-fun mapValue!43345 () ValueCell!13133)

(assert (=> mapNonEmpty!43345 (= (arr!34743 _values!996) (store mapRest!43345 mapKey!43345 mapValue!43345))))

(declare-fun b!1111910 () Bool)

(declare-fun res!742011 () Bool)

(assert (=> b!1111910 (=> (not res!742011) (not e!633976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111910 (= res!742011 (validKeyInArray!0 k0!934))))

(declare-fun b!1111911 () Bool)

(declare-fun res!742013 () Bool)

(assert (=> b!1111911 (=> (not res!742013) (not e!633976))))

(assert (=> b!1111911 (= res!742013 (and (= (size!35281 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35282 _keys!1208) (size!35281 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111912 () Bool)

(declare-fun e!633978 () Bool)

(assert (=> b!1111912 (= e!633973 (not e!633978))))

(declare-fun res!742008 () Bool)

(assert (=> b!1111912 (=> res!742008 e!633978)))

(assert (=> b!1111912 (= res!742008 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35282 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111912 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36305 0))(
  ( (Unit!36306) )
))
(declare-fun lt!496251 () Unit!36305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72182 (_ BitVec 64) (_ BitVec 32)) Unit!36305)

(assert (=> b!1111912 (= lt!496251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111913 () Bool)

(assert (=> b!1111913 (= e!633978 true)))

(assert (=> b!1111913 e!633972))

(declare-fun c!109308 () Bool)

(assert (=> b!1111913 (= c!109308 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496249 () Unit!36305)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!311 (array!72182 array!72180 (_ BitVec 32) (_ BitVec 32) V!42041 V!42041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36305)

(assert (=> b!1111913 (= lt!496249 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!311 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111914 () Bool)

(declare-fun res!742015 () Bool)

(assert (=> b!1111914 (=> (not res!742015) (not e!633976))))

(assert (=> b!1111914 (= res!742015 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35282 _keys!1208))))))

(declare-fun b!1111915 () Bool)

(declare-fun e!633971 () Bool)

(assert (=> b!1111915 (= e!633971 tp_is_empty!27685)))

(declare-fun b!1111916 () Bool)

(assert (=> b!1111916 (= e!633977 (and e!633971 mapRes!43345))))

(declare-fun condMapEmpty!43345 () Bool)

(declare-fun mapDefault!43345 () ValueCell!13133)

(assert (=> b!1111916 (= condMapEmpty!43345 (= (arr!34743 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13133)) mapDefault!43345)))))

(declare-fun b!1111917 () Bool)

(declare-fun -!1038 (ListLongMap!15627 (_ BitVec 64)) ListLongMap!15627)

(assert (=> b!1111917 (= e!633972 (= call!46949 (-!1038 call!46948 k0!934)))))

(assert (= (and start!97448 res!742018) b!1111909))

(assert (= (and b!1111909 res!742016) b!1111911))

(assert (= (and b!1111911 res!742013) b!1111907))

(assert (= (and b!1111907 res!742010) b!1111904))

(assert (= (and b!1111904 res!742017) b!1111914))

(assert (= (and b!1111914 res!742015) b!1111910))

(assert (= (and b!1111910 res!742011) b!1111905))

(assert (= (and b!1111905 res!742012) b!1111908))

(assert (= (and b!1111908 res!742014) b!1111906))

(assert (= (and b!1111906 res!742009) b!1111912))

(assert (= (and b!1111912 (not res!742008)) b!1111913))

(assert (= (and b!1111913 c!109308) b!1111917))

(assert (= (and b!1111913 (not c!109308)) b!1111903))

(assert (= (or b!1111917 b!1111903) bm!46946))

(assert (= (or b!1111917 b!1111903) bm!46945))

(assert (= (and b!1111916 condMapEmpty!43345) mapIsEmpty!43345))

(assert (= (and b!1111916 (not condMapEmpty!43345)) mapNonEmpty!43345))

(get-info :version)

(assert (= (and mapNonEmpty!43345 ((_ is ValueCellFull!13133) mapValue!43345)) b!1111902))

(assert (= (and b!1111916 ((_ is ValueCellFull!13133) mapDefault!43345)) b!1111915))

(assert (= start!97448 b!1111916))

(declare-fun b_lambda!18431 () Bool)

(assert (=> (not b_lambda!18431) (not bm!46945)))

(declare-fun t!34771 () Bool)

(declare-fun tb!8283 () Bool)

(assert (=> (and start!97448 (= defaultEntry!1004 defaultEntry!1004) t!34771) tb!8283))

(declare-fun result!17135 () Bool)

(assert (=> tb!8283 (= result!17135 tp_is_empty!27685)))

(assert (=> bm!46945 t!34771))

(declare-fun b_and!37667 () Bool)

(assert (= b_and!37665 (and (=> t!34771 result!17135) b_and!37667)))

(declare-fun m!1029051 () Bool)

(assert (=> start!97448 m!1029051))

(declare-fun m!1029053 () Bool)

(assert (=> start!97448 m!1029053))

(declare-fun m!1029055 () Bool)

(assert (=> b!1111907 m!1029055))

(declare-fun m!1029057 () Bool)

(assert (=> b!1111906 m!1029057))

(declare-fun m!1029059 () Bool)

(assert (=> bm!46945 m!1029059))

(declare-fun m!1029061 () Bool)

(assert (=> bm!46945 m!1029061))

(declare-fun m!1029063 () Bool)

(assert (=> bm!46945 m!1029063))

(declare-fun m!1029065 () Bool)

(assert (=> b!1111912 m!1029065))

(declare-fun m!1029067 () Bool)

(assert (=> b!1111912 m!1029067))

(declare-fun m!1029069 () Bool)

(assert (=> b!1111905 m!1029069))

(declare-fun m!1029071 () Bool)

(assert (=> b!1111904 m!1029071))

(declare-fun m!1029073 () Bool)

(assert (=> b!1111910 m!1029073))

(declare-fun m!1029075 () Bool)

(assert (=> b!1111909 m!1029075))

(declare-fun m!1029077 () Bool)

(assert (=> b!1111917 m!1029077))

(declare-fun m!1029079 () Bool)

(assert (=> mapNonEmpty!43345 m!1029079))

(declare-fun m!1029081 () Bool)

(assert (=> b!1111908 m!1029081))

(declare-fun m!1029083 () Bool)

(assert (=> b!1111908 m!1029083))

(declare-fun m!1029085 () Bool)

(assert (=> b!1111913 m!1029085))

(declare-fun m!1029087 () Bool)

(assert (=> bm!46946 m!1029087))

(check-sat (not b!1111907) (not b!1111917) (not b!1111909) (not b_next!23425) b_and!37667 (not b!1111906) (not b_lambda!18431) (not b!1111912) (not b!1111910) (not bm!46946) (not start!97448) (not mapNonEmpty!43345) (not b!1111908) tp_is_empty!27685 (not bm!46945) (not b!1111913) (not b!1111904))
(check-sat b_and!37667 (not b_next!23425))
