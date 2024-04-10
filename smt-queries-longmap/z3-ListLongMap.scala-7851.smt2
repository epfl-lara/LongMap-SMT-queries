; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97852 () Bool)

(assert start!97852)

(declare-fun b_free!23553 () Bool)

(declare-fun b_next!23553 () Bool)

(assert (=> start!97852 (= b_free!23553 (not b_next!23553))))

(declare-fun tp!83362 () Bool)

(declare-fun b_and!37889 () Bool)

(assert (=> start!97852 (= tp!83362 b_and!37889)))

(declare-fun b!1120090 () Bool)

(declare-fun res!748245 () Bool)

(declare-fun e!637844 () Bool)

(assert (=> b!1120090 (=> (not res!748245) (not e!637844))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120090 (= res!748245 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43942 () Bool)

(declare-fun mapRes!43942 () Bool)

(assert (=> mapIsEmpty!43942 mapRes!43942))

(declare-fun b!1120091 () Bool)

(declare-fun res!748244 () Bool)

(assert (=> b!1120091 (=> (not res!748244) (not e!637844))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120091 (= res!748244 (validMask!0 mask!1564))))

(declare-fun res!748247 () Bool)

(assert (=> start!97852 (=> (not res!748247) (not e!637844))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73047 0))(
  ( (array!73048 (arr!35176 (Array (_ BitVec 32) (_ BitVec 64))) (size!35712 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73047)

(assert (=> start!97852 (= res!748247 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35712 _keys!1208))))))

(assert (=> start!97852 e!637844))

(declare-fun tp_is_empty!28083 () Bool)

(assert (=> start!97852 tp_is_empty!28083))

(declare-fun array_inv!27020 (array!73047) Bool)

(assert (=> start!97852 (array_inv!27020 _keys!1208)))

(assert (=> start!97852 true))

(assert (=> start!97852 tp!83362))

(declare-datatypes ((V!42571 0))(
  ( (V!42572 (val!14098 Int)) )
))
(declare-datatypes ((ValueCell!13332 0))(
  ( (ValueCellFull!13332 (v!16731 V!42571)) (EmptyCell!13332) )
))
(declare-datatypes ((array!73049 0))(
  ( (array!73050 (arr!35177 (Array (_ BitVec 32) ValueCell!13332)) (size!35713 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73049)

(declare-fun e!637847 () Bool)

(declare-fun array_inv!27021 (array!73049) Bool)

(assert (=> start!97852 (and (array_inv!27021 _values!996) e!637847)))

(declare-fun mapNonEmpty!43942 () Bool)

(declare-fun tp!83363 () Bool)

(declare-fun e!637845 () Bool)

(assert (=> mapNonEmpty!43942 (= mapRes!43942 (and tp!83363 e!637845))))

(declare-fun mapKey!43942 () (_ BitVec 32))

(declare-fun mapRest!43942 () (Array (_ BitVec 32) ValueCell!13332))

(declare-fun mapValue!43942 () ValueCell!13332)

(assert (=> mapNonEmpty!43942 (= (arr!35177 _values!996) (store mapRest!43942 mapKey!43942 mapValue!43942))))

(declare-fun b!1120092 () Bool)

(declare-fun e!637843 () Bool)

(assert (=> b!1120092 (= e!637843 true)))

(declare-fun zeroValue!944 () V!42571)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17688 0))(
  ( (tuple2!17689 (_1!8855 (_ BitVec 64)) (_2!8855 V!42571)) )
))
(declare-datatypes ((List!24473 0))(
  ( (Nil!24470) (Cons!24469 (h!25678 tuple2!17688) (t!35018 List!24473)) )
))
(declare-datatypes ((ListLongMap!15657 0))(
  ( (ListLongMap!15658 (toList!7844 List!24473)) )
))
(declare-fun lt!497933 () ListLongMap!15657)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!497930 () array!73047)

(declare-fun minValue!944 () V!42571)

(declare-fun getCurrentListMapNoExtraKeys!4334 (array!73047 array!73049 (_ BitVec 32) (_ BitVec 32) V!42571 V!42571 (_ BitVec 32) Int) ListLongMap!15657)

(declare-fun dynLambda!2438 (Int (_ BitVec 64)) V!42571)

(assert (=> b!1120092 (= lt!497933 (getCurrentListMapNoExtraKeys!4334 lt!497930 (array!73050 (store (arr!35177 _values!996) i!673 (ValueCellFull!13332 (dynLambda!2438 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35713 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497932 () ListLongMap!15657)

(assert (=> b!1120092 (= lt!497932 (getCurrentListMapNoExtraKeys!4334 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120093 () Bool)

(declare-fun res!748240 () Bool)

(assert (=> b!1120093 (=> (not res!748240) (not e!637844))))

(assert (=> b!1120093 (= res!748240 (and (= (size!35713 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35712 _keys!1208) (size!35713 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120094 () Bool)

(declare-fun res!748243 () Bool)

(declare-fun e!637848 () Bool)

(assert (=> b!1120094 (=> (not res!748243) (not e!637848))))

(declare-datatypes ((List!24474 0))(
  ( (Nil!24471) (Cons!24470 (h!25679 (_ BitVec 64)) (t!35019 List!24474)) )
))
(declare-fun arrayNoDuplicates!0 (array!73047 (_ BitVec 32) List!24474) Bool)

(assert (=> b!1120094 (= res!748243 (arrayNoDuplicates!0 lt!497930 #b00000000000000000000000000000000 Nil!24471))))

(declare-fun b!1120095 () Bool)

(assert (=> b!1120095 (= e!637844 e!637848)))

(declare-fun res!748239 () Bool)

(assert (=> b!1120095 (=> (not res!748239) (not e!637848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73047 (_ BitVec 32)) Bool)

(assert (=> b!1120095 (= res!748239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497930 mask!1564))))

(assert (=> b!1120095 (= lt!497930 (array!73048 (store (arr!35176 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35712 _keys!1208)))))

(declare-fun b!1120096 () Bool)

(declare-fun res!748249 () Bool)

(assert (=> b!1120096 (=> (not res!748249) (not e!637844))))

(assert (=> b!1120096 (= res!748249 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35712 _keys!1208))))))

(declare-fun b!1120097 () Bool)

(declare-fun res!748241 () Bool)

(assert (=> b!1120097 (=> (not res!748241) (not e!637844))))

(assert (=> b!1120097 (= res!748241 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24471))))

(declare-fun b!1120098 () Bool)

(assert (=> b!1120098 (= e!637845 tp_is_empty!28083)))

(declare-fun b!1120099 () Bool)

(declare-fun res!748246 () Bool)

(assert (=> b!1120099 (=> (not res!748246) (not e!637844))))

(assert (=> b!1120099 (= res!748246 (= (select (arr!35176 _keys!1208) i!673) k0!934))))

(declare-fun b!1120100 () Bool)

(declare-fun e!637842 () Bool)

(assert (=> b!1120100 (= e!637847 (and e!637842 mapRes!43942))))

(declare-fun condMapEmpty!43942 () Bool)

(declare-fun mapDefault!43942 () ValueCell!13332)

(assert (=> b!1120100 (= condMapEmpty!43942 (= (arr!35177 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13332)) mapDefault!43942)))))

(declare-fun b!1120101 () Bool)

(assert (=> b!1120101 (= e!637848 (not e!637843))))

(declare-fun res!748242 () Bool)

(assert (=> b!1120101 (=> res!748242 e!637843)))

(assert (=> b!1120101 (= res!748242 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36756 0))(
  ( (Unit!36757) )
))
(declare-fun lt!497931 () Unit!36756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73047 (_ BitVec 64) (_ BitVec 32)) Unit!36756)

(assert (=> b!1120101 (= lt!497931 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120102 () Bool)

(assert (=> b!1120102 (= e!637842 tp_is_empty!28083)))

(declare-fun b!1120103 () Bool)

(declare-fun res!748248 () Bool)

(assert (=> b!1120103 (=> (not res!748248) (not e!637844))))

(assert (=> b!1120103 (= res!748248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97852 res!748247) b!1120091))

(assert (= (and b!1120091 res!748244) b!1120093))

(assert (= (and b!1120093 res!748240) b!1120103))

(assert (= (and b!1120103 res!748248) b!1120097))

(assert (= (and b!1120097 res!748241) b!1120096))

(assert (= (and b!1120096 res!748249) b!1120090))

(assert (= (and b!1120090 res!748245) b!1120099))

(assert (= (and b!1120099 res!748246) b!1120095))

(assert (= (and b!1120095 res!748239) b!1120094))

(assert (= (and b!1120094 res!748243) b!1120101))

(assert (= (and b!1120101 (not res!748242)) b!1120092))

(assert (= (and b!1120100 condMapEmpty!43942) mapIsEmpty!43942))

(assert (= (and b!1120100 (not condMapEmpty!43942)) mapNonEmpty!43942))

(get-info :version)

(assert (= (and mapNonEmpty!43942 ((_ is ValueCellFull!13332) mapValue!43942)) b!1120098))

(assert (= (and b!1120100 ((_ is ValueCellFull!13332) mapDefault!43942)) b!1120102))

(assert (= start!97852 b!1120100))

(declare-fun b_lambda!18523 () Bool)

(assert (=> (not b_lambda!18523) (not b!1120092)))

(declare-fun t!35017 () Bool)

(declare-fun tb!8365 () Bool)

(assert (=> (and start!97852 (= defaultEntry!1004 defaultEntry!1004) t!35017) tb!8365))

(declare-fun result!17291 () Bool)

(assert (=> tb!8365 (= result!17291 tp_is_empty!28083)))

(assert (=> b!1120092 t!35017))

(declare-fun b_and!37891 () Bool)

(assert (= b_and!37889 (and (=> t!35017 result!17291) b_and!37891)))

(declare-fun m!1035225 () Bool)

(assert (=> b!1120092 m!1035225))

(declare-fun m!1035227 () Bool)

(assert (=> b!1120092 m!1035227))

(declare-fun m!1035229 () Bool)

(assert (=> b!1120092 m!1035229))

(declare-fun m!1035231 () Bool)

(assert (=> b!1120092 m!1035231))

(declare-fun m!1035233 () Bool)

(assert (=> b!1120091 m!1035233))

(declare-fun m!1035235 () Bool)

(assert (=> b!1120097 m!1035235))

(declare-fun m!1035237 () Bool)

(assert (=> b!1120101 m!1035237))

(declare-fun m!1035239 () Bool)

(assert (=> b!1120101 m!1035239))

(declare-fun m!1035241 () Bool)

(assert (=> b!1120095 m!1035241))

(declare-fun m!1035243 () Bool)

(assert (=> b!1120095 m!1035243))

(declare-fun m!1035245 () Bool)

(assert (=> mapNonEmpty!43942 m!1035245))

(declare-fun m!1035247 () Bool)

(assert (=> b!1120094 m!1035247))

(declare-fun m!1035249 () Bool)

(assert (=> start!97852 m!1035249))

(declare-fun m!1035251 () Bool)

(assert (=> start!97852 m!1035251))

(declare-fun m!1035253 () Bool)

(assert (=> b!1120090 m!1035253))

(declare-fun m!1035255 () Bool)

(assert (=> b!1120099 m!1035255))

(declare-fun m!1035257 () Bool)

(assert (=> b!1120103 m!1035257))

(check-sat (not b!1120094) (not b!1120103) (not b_lambda!18523) (not b!1120097) (not b!1120101) (not b_next!23553) (not b!1120091) b_and!37891 (not mapNonEmpty!43942) (not b!1120090) tp_is_empty!28083 (not b!1120095) (not b!1120092) (not start!97852))
(check-sat b_and!37891 (not b_next!23553))
