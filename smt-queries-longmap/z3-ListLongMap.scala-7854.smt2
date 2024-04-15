; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97862 () Bool)

(assert start!97862)

(declare-fun b_free!23569 () Bool)

(declare-fun b_next!23569 () Bool)

(assert (=> start!97862 (= b_free!23569 (not b_next!23569))))

(declare-fun tp!83411 () Bool)

(declare-fun b_and!37899 () Bool)

(assert (=> start!97862 (= tp!83411 b_and!37899)))

(declare-fun mapIsEmpty!43966 () Bool)

(declare-fun mapRes!43966 () Bool)

(assert (=> mapIsEmpty!43966 mapRes!43966))

(declare-fun b!1120313 () Bool)

(declare-fun res!748439 () Bool)

(declare-fun e!637932 () Bool)

(assert (=> b!1120313 (=> (not res!748439) (not e!637932))))

(declare-datatypes ((array!72992 0))(
  ( (array!72993 (arr!35149 (Array (_ BitVec 32) (_ BitVec 64))) (size!35687 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72992)

(declare-datatypes ((List!24537 0))(
  ( (Nil!24534) (Cons!24533 (h!25742 (_ BitVec 64)) (t!35089 List!24537)) )
))
(declare-fun arrayNoDuplicates!0 (array!72992 (_ BitVec 32) List!24537) Bool)

(assert (=> b!1120313 (= res!748439 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24534))))

(declare-fun b!1120314 () Bool)

(declare-fun e!637929 () Bool)

(declare-fun e!637933 () Bool)

(assert (=> b!1120314 (= e!637929 (not e!637933))))

(declare-fun res!748434 () Bool)

(assert (=> b!1120314 (=> res!748434 e!637933)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120314 (= res!748434 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120314 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36589 0))(
  ( (Unit!36590) )
))
(declare-fun lt!497828 () Unit!36589)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72992 (_ BitVec 64) (_ BitVec 32)) Unit!36589)

(assert (=> b!1120314 (= lt!497828 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120315 () Bool)

(declare-fun res!748443 () Bool)

(assert (=> b!1120315 (=> (not res!748443) (not e!637932))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72992 (_ BitVec 32)) Bool)

(assert (=> b!1120315 (= res!748443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120316 () Bool)

(declare-fun e!637935 () Bool)

(declare-fun e!637931 () Bool)

(assert (=> b!1120316 (= e!637935 (and e!637931 mapRes!43966))))

(declare-fun condMapEmpty!43966 () Bool)

(declare-datatypes ((V!42593 0))(
  ( (V!42594 (val!14106 Int)) )
))
(declare-datatypes ((ValueCell!13340 0))(
  ( (ValueCellFull!13340 (v!16738 V!42593)) (EmptyCell!13340) )
))
(declare-datatypes ((array!72994 0))(
  ( (array!72995 (arr!35150 (Array (_ BitVec 32) ValueCell!13340)) (size!35688 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72994)

(declare-fun mapDefault!43966 () ValueCell!13340)

(assert (=> b!1120316 (= condMapEmpty!43966 (= (arr!35150 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13340)) mapDefault!43966)))))

(declare-fun mapNonEmpty!43966 () Bool)

(declare-fun tp!83410 () Bool)

(declare-fun e!637934 () Bool)

(assert (=> mapNonEmpty!43966 (= mapRes!43966 (and tp!83410 e!637934))))

(declare-fun mapKey!43966 () (_ BitVec 32))

(declare-fun mapValue!43966 () ValueCell!13340)

(declare-fun mapRest!43966 () (Array (_ BitVec 32) ValueCell!13340))

(assert (=> mapNonEmpty!43966 (= (arr!35150 _values!996) (store mapRest!43966 mapKey!43966 mapValue!43966))))

(declare-fun b!1120317 () Bool)

(assert (=> b!1120317 (= e!637932 e!637929)))

(declare-fun res!748438 () Bool)

(assert (=> b!1120317 (=> (not res!748438) (not e!637929))))

(declare-fun lt!497826 () array!72992)

(assert (=> b!1120317 (= res!748438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497826 mask!1564))))

(assert (=> b!1120317 (= lt!497826 (array!72993 (store (arr!35149 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35687 _keys!1208)))))

(declare-fun b!1120318 () Bool)

(declare-fun tp_is_empty!28099 () Bool)

(assert (=> b!1120318 (= e!637931 tp_is_empty!28099)))

(declare-fun res!748440 () Bool)

(assert (=> start!97862 (=> (not res!748440) (not e!637932))))

(assert (=> start!97862 (= res!748440 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35687 _keys!1208))))))

(assert (=> start!97862 e!637932))

(assert (=> start!97862 tp_is_empty!28099))

(declare-fun array_inv!27068 (array!72992) Bool)

(assert (=> start!97862 (array_inv!27068 _keys!1208)))

(assert (=> start!97862 true))

(assert (=> start!97862 tp!83411))

(declare-fun array_inv!27069 (array!72994) Bool)

(assert (=> start!97862 (and (array_inv!27069 _values!996) e!637935)))

(declare-fun b!1120319 () Bool)

(declare-fun res!748441 () Bool)

(assert (=> b!1120319 (=> (not res!748441) (not e!637932))))

(assert (=> b!1120319 (= res!748441 (= (select (arr!35149 _keys!1208) i!673) k0!934))))

(declare-fun b!1120320 () Bool)

(assert (=> b!1120320 (= e!637934 tp_is_empty!28099)))

(declare-fun b!1120321 () Bool)

(assert (=> b!1120321 (= e!637933 true)))

(declare-fun zeroValue!944 () V!42593)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!42593)

(declare-datatypes ((tuple2!17764 0))(
  ( (tuple2!17765 (_1!8893 (_ BitVec 64)) (_2!8893 V!42593)) )
))
(declare-datatypes ((List!24538 0))(
  ( (Nil!24535) (Cons!24534 (h!25743 tuple2!17764) (t!35090 List!24538)) )
))
(declare-datatypes ((ListLongMap!15733 0))(
  ( (ListLongMap!15734 (toList!7882 List!24538)) )
))
(declare-fun lt!497827 () ListLongMap!15733)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4391 (array!72992 array!72994 (_ BitVec 32) (_ BitVec 32) V!42593 V!42593 (_ BitVec 32) Int) ListLongMap!15733)

(declare-fun dynLambda!2434 (Int (_ BitVec 64)) V!42593)

(assert (=> b!1120321 (= lt!497827 (getCurrentListMapNoExtraKeys!4391 lt!497826 (array!72995 (store (arr!35150 _values!996) i!673 (ValueCellFull!13340 (dynLambda!2434 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35688 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497829 () ListLongMap!15733)

(assert (=> b!1120321 (= lt!497829 (getCurrentListMapNoExtraKeys!4391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120322 () Bool)

(declare-fun res!748436 () Bool)

(assert (=> b!1120322 (=> (not res!748436) (not e!637932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120322 (= res!748436 (validKeyInArray!0 k0!934))))

(declare-fun b!1120323 () Bool)

(declare-fun res!748435 () Bool)

(assert (=> b!1120323 (=> (not res!748435) (not e!637932))))

(assert (=> b!1120323 (= res!748435 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35687 _keys!1208))))))

(declare-fun b!1120324 () Bool)

(declare-fun res!748442 () Bool)

(assert (=> b!1120324 (=> (not res!748442) (not e!637929))))

(assert (=> b!1120324 (= res!748442 (arrayNoDuplicates!0 lt!497826 #b00000000000000000000000000000000 Nil!24534))))

(declare-fun b!1120325 () Bool)

(declare-fun res!748444 () Bool)

(assert (=> b!1120325 (=> (not res!748444) (not e!637932))))

(assert (=> b!1120325 (= res!748444 (and (= (size!35688 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35687 _keys!1208) (size!35688 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120326 () Bool)

(declare-fun res!748437 () Bool)

(assert (=> b!1120326 (=> (not res!748437) (not e!637932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120326 (= res!748437 (validMask!0 mask!1564))))

(assert (= (and start!97862 res!748440) b!1120326))

(assert (= (and b!1120326 res!748437) b!1120325))

(assert (= (and b!1120325 res!748444) b!1120315))

(assert (= (and b!1120315 res!748443) b!1120313))

(assert (= (and b!1120313 res!748439) b!1120323))

(assert (= (and b!1120323 res!748435) b!1120322))

(assert (= (and b!1120322 res!748436) b!1120319))

(assert (= (and b!1120319 res!748441) b!1120317))

(assert (= (and b!1120317 res!748438) b!1120324))

(assert (= (and b!1120324 res!748442) b!1120314))

(assert (= (and b!1120314 (not res!748434)) b!1120321))

(assert (= (and b!1120316 condMapEmpty!43966) mapIsEmpty!43966))

(assert (= (and b!1120316 (not condMapEmpty!43966)) mapNonEmpty!43966))

(get-info :version)

(assert (= (and mapNonEmpty!43966 ((_ is ValueCellFull!13340) mapValue!43966)) b!1120320))

(assert (= (and b!1120316 ((_ is ValueCellFull!13340) mapDefault!43966)) b!1120318))

(assert (= start!97862 b!1120316))

(declare-fun b_lambda!18521 () Bool)

(assert (=> (not b_lambda!18521) (not b!1120321)))

(declare-fun t!35088 () Bool)

(declare-fun tb!8373 () Bool)

(assert (=> (and start!97862 (= defaultEntry!1004 defaultEntry!1004) t!35088) tb!8373))

(declare-fun result!17315 () Bool)

(assert (=> tb!8373 (= result!17315 tp_is_empty!28099)))

(assert (=> b!1120321 t!35088))

(declare-fun b_and!37901 () Bool)

(assert (= b_and!37899 (and (=> t!35088 result!17315) b_and!37901)))

(declare-fun m!1034871 () Bool)

(assert (=> b!1120317 m!1034871))

(declare-fun m!1034873 () Bool)

(assert (=> b!1120317 m!1034873))

(declare-fun m!1034875 () Bool)

(assert (=> b!1120326 m!1034875))

(declare-fun m!1034877 () Bool)

(assert (=> b!1120313 m!1034877))

(declare-fun m!1034879 () Bool)

(assert (=> b!1120315 m!1034879))

(declare-fun m!1034881 () Bool)

(assert (=> b!1120324 m!1034881))

(declare-fun m!1034883 () Bool)

(assert (=> mapNonEmpty!43966 m!1034883))

(declare-fun m!1034885 () Bool)

(assert (=> b!1120319 m!1034885))

(declare-fun m!1034887 () Bool)

(assert (=> start!97862 m!1034887))

(declare-fun m!1034889 () Bool)

(assert (=> start!97862 m!1034889))

(declare-fun m!1034891 () Bool)

(assert (=> b!1120321 m!1034891))

(declare-fun m!1034893 () Bool)

(assert (=> b!1120321 m!1034893))

(declare-fun m!1034895 () Bool)

(assert (=> b!1120321 m!1034895))

(declare-fun m!1034897 () Bool)

(assert (=> b!1120321 m!1034897))

(declare-fun m!1034899 () Bool)

(assert (=> b!1120314 m!1034899))

(declare-fun m!1034901 () Bool)

(assert (=> b!1120314 m!1034901))

(declare-fun m!1034903 () Bool)

(assert (=> b!1120322 m!1034903))

(check-sat b_and!37901 (not b!1120322) (not b_lambda!18521) (not b!1120313) (not b!1120321) (not mapNonEmpty!43966) (not b_next!23569) (not b!1120326) tp_is_empty!28099 (not b!1120324) (not b!1120317) (not b!1120314) (not b!1120315) (not start!97862))
(check-sat b_and!37901 (not b_next!23569))
