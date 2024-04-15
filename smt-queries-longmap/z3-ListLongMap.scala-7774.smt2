; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97382 () Bool)

(assert start!97382)

(declare-fun b_free!23359 () Bool)

(declare-fun b_next!23359 () Bool)

(assert (=> start!97382 (= b_free!23359 (not b_next!23359))))

(declare-fun tp!82376 () Bool)

(declare-fun b_and!37533 () Bool)

(assert (=> start!97382 (= tp!82376 b_and!37533)))

(declare-datatypes ((V!41953 0))(
  ( (V!41954 (val!13866 Int)) )
))
(declare-datatypes ((tuple2!17596 0))(
  ( (tuple2!17597 (_1!8809 (_ BitVec 64)) (_2!8809 V!41953)) )
))
(declare-datatypes ((List!24251 0))(
  ( (Nil!24248) (Cons!24247 (h!25456 tuple2!17596) (t!34647 List!24251)) )
))
(declare-datatypes ((ListLongMap!15565 0))(
  ( (ListLongMap!15566 (toList!7798 List!24251)) )
))
(declare-fun call!46751 () ListLongMap!15565)

(declare-fun call!46750 () ListLongMap!15565)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!633185 () Bool)

(declare-fun b!1110252 () Bool)

(declare-fun -!1013 (ListLongMap!15565 (_ BitVec 64)) ListLongMap!15565)

(assert (=> b!1110252 (= e!633185 (= call!46750 (-!1013 call!46751 k0!934)))))

(declare-fun b!1110253 () Bool)

(declare-fun res!740925 () Bool)

(declare-fun e!633181 () Bool)

(assert (=> b!1110253 (=> (not res!740925) (not e!633181))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72048 0))(
  ( (array!72049 (arr!34677 (Array (_ BitVec 32) (_ BitVec 64))) (size!35215 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72048)

(assert (=> b!1110253 (= res!740925 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35215 _keys!1208))))))

(declare-fun b!1110254 () Bool)

(declare-fun res!740923 () Bool)

(declare-fun e!633184 () Bool)

(assert (=> b!1110254 (=> (not res!740923) (not e!633184))))

(declare-fun lt!495952 () array!72048)

(declare-datatypes ((List!24252 0))(
  ( (Nil!24249) (Cons!24248 (h!25457 (_ BitVec 64)) (t!34648 List!24252)) )
))
(declare-fun arrayNoDuplicates!0 (array!72048 (_ BitVec 32) List!24252) Bool)

(assert (=> b!1110254 (= res!740923 (arrayNoDuplicates!0 lt!495952 #b00000000000000000000000000000000 Nil!24249))))

(declare-fun b!1110255 () Bool)

(assert (=> b!1110255 (= e!633181 e!633184)))

(declare-fun res!740920 () Bool)

(assert (=> b!1110255 (=> (not res!740920) (not e!633184))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72048 (_ BitVec 32)) Bool)

(assert (=> b!1110255 (= res!740920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495952 mask!1564))))

(assert (=> b!1110255 (= lt!495952 (array!72049 (store (arr!34677 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35215 _keys!1208)))))

(declare-fun b!1110256 () Bool)

(declare-fun res!740927 () Bool)

(assert (=> b!1110256 (=> (not res!740927) (not e!633181))))

(assert (=> b!1110256 (= res!740927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!740926 () Bool)

(assert (=> start!97382 (=> (not res!740926) (not e!633181))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97382 (= res!740926 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35215 _keys!1208))))))

(assert (=> start!97382 e!633181))

(declare-fun tp_is_empty!27619 () Bool)

(assert (=> start!97382 tp_is_empty!27619))

(declare-fun array_inv!26730 (array!72048) Bool)

(assert (=> start!97382 (array_inv!26730 _keys!1208)))

(assert (=> start!97382 true))

(assert (=> start!97382 tp!82376))

(declare-datatypes ((ValueCell!13100 0))(
  ( (ValueCellFull!13100 (v!16498 V!41953)) (EmptyCell!13100) )
))
(declare-datatypes ((array!72050 0))(
  ( (array!72051 (arr!34678 (Array (_ BitVec 32) ValueCell!13100)) (size!35216 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72050)

(declare-fun e!633180 () Bool)

(declare-fun array_inv!26731 (array!72050) Bool)

(assert (=> start!97382 (and (array_inv!26731 _values!996) e!633180)))

(declare-fun b!1110257 () Bool)

(declare-fun e!633179 () Bool)

(assert (=> b!1110257 (= e!633184 (not e!633179))))

(declare-fun res!740922 () Bool)

(assert (=> b!1110257 (=> res!740922 e!633179)))

(assert (=> b!1110257 (= res!740922 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35215 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110257 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36247 0))(
  ( (Unit!36248) )
))
(declare-fun lt!495953 () Unit!36247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72048 (_ BitVec 64) (_ BitVec 32)) Unit!36247)

(assert (=> b!1110257 (= lt!495953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110258 () Bool)

(declare-fun res!740921 () Bool)

(assert (=> b!1110258 (=> (not res!740921) (not e!633181))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1110258 (= res!740921 (and (= (size!35216 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35215 _keys!1208) (size!35216 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110259 () Bool)

(declare-fun e!633186 () Bool)

(assert (=> b!1110259 (= e!633186 tp_is_empty!27619)))

(declare-fun b!1110260 () Bool)

(declare-fun res!740924 () Bool)

(assert (=> b!1110260 (=> (not res!740924) (not e!633181))))

(assert (=> b!1110260 (= res!740924 (= (select (arr!34677 _keys!1208) i!673) k0!934))))

(declare-fun b!1110261 () Bool)

(assert (=> b!1110261 (= e!633185 (= call!46750 call!46751))))

(declare-fun b!1110262 () Bool)

(declare-fun mapRes!43246 () Bool)

(assert (=> b!1110262 (= e!633180 (and e!633186 mapRes!43246))))

(declare-fun condMapEmpty!43246 () Bool)

(declare-fun mapDefault!43246 () ValueCell!13100)

(assert (=> b!1110262 (= condMapEmpty!43246 (= (arr!34678 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13100)) mapDefault!43246)))))

(declare-fun b!1110263 () Bool)

(declare-fun res!740928 () Bool)

(assert (=> b!1110263 (=> (not res!740928) (not e!633181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110263 (= res!740928 (validMask!0 mask!1564))))

(declare-fun b!1110264 () Bool)

(declare-fun res!740929 () Bool)

(assert (=> b!1110264 (=> (not res!740929) (not e!633181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110264 (= res!740929 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43246 () Bool)

(declare-fun tp!82375 () Bool)

(declare-fun e!633183 () Bool)

(assert (=> mapNonEmpty!43246 (= mapRes!43246 (and tp!82375 e!633183))))

(declare-fun mapRest!43246 () (Array (_ BitVec 32) ValueCell!13100))

(declare-fun mapKey!43246 () (_ BitVec 32))

(declare-fun mapValue!43246 () ValueCell!13100)

(assert (=> mapNonEmpty!43246 (= (arr!34678 _values!996) (store mapRest!43246 mapKey!43246 mapValue!43246))))

(declare-fun b!1110265 () Bool)

(assert (=> b!1110265 (= e!633179 true)))

(assert (=> b!1110265 e!633185))

(declare-fun c!109209 () Bool)

(assert (=> b!1110265 (= c!109209 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41953)

(declare-fun lt!495954 () Unit!36247)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41953)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!285 (array!72048 array!72050 (_ BitVec 32) (_ BitVec 32) V!41953 V!41953 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36247)

(assert (=> b!1110265 (= lt!495954 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!285 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46747 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4313 (array!72048 array!72050 (_ BitVec 32) (_ BitVec 32) V!41953 V!41953 (_ BitVec 32) Int) ListLongMap!15565)

(declare-fun dynLambda!2378 (Int (_ BitVec 64)) V!41953)

(assert (=> bm!46747 (= call!46750 (getCurrentListMapNoExtraKeys!4313 lt!495952 (array!72051 (store (arr!34678 _values!996) i!673 (ValueCellFull!13100 (dynLambda!2378 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35216 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110266 () Bool)

(declare-fun res!740919 () Bool)

(assert (=> b!1110266 (=> (not res!740919) (not e!633181))))

(assert (=> b!1110266 (= res!740919 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24249))))

(declare-fun mapIsEmpty!43246 () Bool)

(assert (=> mapIsEmpty!43246 mapRes!43246))

(declare-fun b!1110267 () Bool)

(assert (=> b!1110267 (= e!633183 tp_is_empty!27619)))

(declare-fun bm!46748 () Bool)

(assert (=> bm!46748 (= call!46751 (getCurrentListMapNoExtraKeys!4313 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97382 res!740926) b!1110263))

(assert (= (and b!1110263 res!740928) b!1110258))

(assert (= (and b!1110258 res!740921) b!1110256))

(assert (= (and b!1110256 res!740927) b!1110266))

(assert (= (and b!1110266 res!740919) b!1110253))

(assert (= (and b!1110253 res!740925) b!1110264))

(assert (= (and b!1110264 res!740929) b!1110260))

(assert (= (and b!1110260 res!740924) b!1110255))

(assert (= (and b!1110255 res!740920) b!1110254))

(assert (= (and b!1110254 res!740923) b!1110257))

(assert (= (and b!1110257 (not res!740922)) b!1110265))

(assert (= (and b!1110265 c!109209) b!1110252))

(assert (= (and b!1110265 (not c!109209)) b!1110261))

(assert (= (or b!1110252 b!1110261) bm!46747))

(assert (= (or b!1110252 b!1110261) bm!46748))

(assert (= (and b!1110262 condMapEmpty!43246) mapIsEmpty!43246))

(assert (= (and b!1110262 (not condMapEmpty!43246)) mapNonEmpty!43246))

(get-info :version)

(assert (= (and mapNonEmpty!43246 ((_ is ValueCellFull!13100) mapValue!43246)) b!1110267))

(assert (= (and b!1110262 ((_ is ValueCellFull!13100) mapDefault!43246)) b!1110259))

(assert (= start!97382 b!1110262))

(declare-fun b_lambda!18365 () Bool)

(assert (=> (not b_lambda!18365) (not bm!46747)))

(declare-fun t!34646 () Bool)

(declare-fun tb!8217 () Bool)

(assert (=> (and start!97382 (= defaultEntry!1004 defaultEntry!1004) t!34646) tb!8217))

(declare-fun result!17003 () Bool)

(assert (=> tb!8217 (= result!17003 tp_is_empty!27619)))

(assert (=> bm!46747 t!34646))

(declare-fun b_and!37535 () Bool)

(assert (= b_and!37533 (and (=> t!34646 result!17003) b_and!37535)))

(declare-fun m!1027797 () Bool)

(assert (=> bm!46747 m!1027797))

(declare-fun m!1027799 () Bool)

(assert (=> bm!46747 m!1027799))

(declare-fun m!1027801 () Bool)

(assert (=> bm!46747 m!1027801))

(declare-fun m!1027803 () Bool)

(assert (=> b!1110255 m!1027803))

(declare-fun m!1027805 () Bool)

(assert (=> b!1110255 m!1027805))

(declare-fun m!1027807 () Bool)

(assert (=> b!1110257 m!1027807))

(declare-fun m!1027809 () Bool)

(assert (=> b!1110257 m!1027809))

(declare-fun m!1027811 () Bool)

(assert (=> b!1110256 m!1027811))

(declare-fun m!1027813 () Bool)

(assert (=> b!1110263 m!1027813))

(declare-fun m!1027815 () Bool)

(assert (=> b!1110265 m!1027815))

(declare-fun m!1027817 () Bool)

(assert (=> bm!46748 m!1027817))

(declare-fun m!1027819 () Bool)

(assert (=> b!1110252 m!1027819))

(declare-fun m!1027821 () Bool)

(assert (=> b!1110254 m!1027821))

(declare-fun m!1027823 () Bool)

(assert (=> b!1110266 m!1027823))

(declare-fun m!1027825 () Bool)

(assert (=> b!1110264 m!1027825))

(declare-fun m!1027827 () Bool)

(assert (=> mapNonEmpty!43246 m!1027827))

(declare-fun m!1027829 () Bool)

(assert (=> b!1110260 m!1027829))

(declare-fun m!1027831 () Bool)

(assert (=> start!97382 m!1027831))

(declare-fun m!1027833 () Bool)

(assert (=> start!97382 m!1027833))

(check-sat (not b!1110263) (not b_next!23359) (not b!1110254) (not bm!46748) (not b_lambda!18365) (not mapNonEmpty!43246) b_and!37535 tp_is_empty!27619 (not b!1110252) (not b!1110266) (not bm!46747) (not b!1110264) (not start!97382) (not b!1110257) (not b!1110256) (not b!1110265) (not b!1110255))
(check-sat b_and!37535 (not b_next!23359))
