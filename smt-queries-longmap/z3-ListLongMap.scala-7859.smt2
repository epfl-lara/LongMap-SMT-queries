; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97892 () Bool)

(assert start!97892)

(declare-fun b_free!23599 () Bool)

(declare-fun b_next!23599 () Bool)

(assert (=> start!97892 (= b_free!23599 (not b_next!23599))))

(declare-fun tp!83500 () Bool)

(declare-fun b_and!37959 () Bool)

(assert (=> start!97892 (= tp!83500 b_and!37959)))

(declare-fun b!1121087 () Bool)

(declare-fun res!748974 () Bool)

(declare-fun e!638322 () Bool)

(assert (=> b!1121087 (=> (not res!748974) (not e!638322))))

(declare-datatypes ((array!73052 0))(
  ( (array!73053 (arr!35179 (Array (_ BitVec 32) (_ BitVec 64))) (size!35717 (_ BitVec 32))) )
))
(declare-fun lt!498082 () array!73052)

(declare-datatypes ((List!24563 0))(
  ( (Nil!24560) (Cons!24559 (h!25768 (_ BitVec 64)) (t!35145 List!24563)) )
))
(declare-fun arrayNoDuplicates!0 (array!73052 (_ BitVec 32) List!24563) Bool)

(assert (=> b!1121087 (= res!748974 (arrayNoDuplicates!0 lt!498082 #b00000000000000000000000000000000 Nil!24560))))

(declare-fun b!1121088 () Bool)

(declare-fun res!748970 () Bool)

(declare-fun e!638321 () Bool)

(assert (=> b!1121088 (=> (not res!748970) (not e!638321))))

(declare-fun _keys!1208 () array!73052)

(assert (=> b!1121088 (= res!748970 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24560))))

(declare-fun mapIsEmpty!44011 () Bool)

(declare-fun mapRes!44011 () Bool)

(assert (=> mapIsEmpty!44011 mapRes!44011))

(declare-fun b!1121089 () Bool)

(declare-fun res!748977 () Bool)

(assert (=> b!1121089 (=> (not res!748977) (not e!638321))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121089 (= res!748977 (= (select (arr!35179 _keys!1208) i!673) k0!934))))

(declare-fun b!1121090 () Bool)

(declare-fun e!638320 () Bool)

(declare-fun tp_is_empty!28129 () Bool)

(assert (=> b!1121090 (= e!638320 tp_is_empty!28129)))

(declare-fun b!1121091 () Bool)

(declare-fun res!748971 () Bool)

(assert (=> b!1121091 (=> (not res!748971) (not e!638321))))

(assert (=> b!1121091 (= res!748971 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35717 _keys!1208))))))

(declare-fun b!1121092 () Bool)

(declare-fun e!638324 () Bool)

(declare-fun e!638323 () Bool)

(assert (=> b!1121092 (= e!638324 (and e!638323 mapRes!44011))))

(declare-fun condMapEmpty!44011 () Bool)

(declare-datatypes ((V!42633 0))(
  ( (V!42634 (val!14121 Int)) )
))
(declare-datatypes ((ValueCell!13355 0))(
  ( (ValueCellFull!13355 (v!16753 V!42633)) (EmptyCell!13355) )
))
(declare-datatypes ((array!73054 0))(
  ( (array!73055 (arr!35180 (Array (_ BitVec 32) ValueCell!13355)) (size!35718 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73054)

(declare-fun mapDefault!44011 () ValueCell!13355)

(assert (=> b!1121092 (= condMapEmpty!44011 (= (arr!35180 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13355)) mapDefault!44011)))))

(declare-fun e!638328 () Bool)

(declare-datatypes ((tuple2!17790 0))(
  ( (tuple2!17791 (_1!8906 (_ BitVec 64)) (_2!8906 V!42633)) )
))
(declare-datatypes ((List!24564 0))(
  ( (Nil!24561) (Cons!24560 (h!25769 tuple2!17790) (t!35146 List!24564)) )
))
(declare-datatypes ((ListLongMap!15759 0))(
  ( (ListLongMap!15760 (toList!7895 List!24564)) )
))
(declare-fun call!47057 () ListLongMap!15759)

(declare-fun call!47056 () ListLongMap!15759)

(declare-fun b!1121093 () Bool)

(declare-fun -!1049 (ListLongMap!15759 (_ BitVec 64)) ListLongMap!15759)

(assert (=> b!1121093 (= e!638328 (= call!47057 (-!1049 call!47056 k0!934)))))

(declare-fun mapNonEmpty!44011 () Bool)

(declare-fun tp!83501 () Bool)

(assert (=> mapNonEmpty!44011 (= mapRes!44011 (and tp!83501 e!638320))))

(declare-fun mapValue!44011 () ValueCell!13355)

(declare-fun mapKey!44011 () (_ BitVec 32))

(declare-fun mapRest!44011 () (Array (_ BitVec 32) ValueCell!13355))

(assert (=> mapNonEmpty!44011 (= (arr!35180 _values!996) (store mapRest!44011 mapKey!44011 mapValue!44011))))

(declare-fun zeroValue!944 () V!42633)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42633)

(declare-fun lt!498087 () array!73054)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!47053 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4403 (array!73052 array!73054 (_ BitVec 32) (_ BitVec 32) V!42633 V!42633 (_ BitVec 32) Int) ListLongMap!15759)

(assert (=> bm!47053 (= call!47057 (getCurrentListMapNoExtraKeys!4403 lt!498082 lt!498087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!748969 () Bool)

(assert (=> start!97892 (=> (not res!748969) (not e!638321))))

(assert (=> start!97892 (= res!748969 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35717 _keys!1208))))))

(assert (=> start!97892 e!638321))

(assert (=> start!97892 tp_is_empty!28129))

(declare-fun array_inv!27092 (array!73052) Bool)

(assert (=> start!97892 (array_inv!27092 _keys!1208)))

(assert (=> start!97892 true))

(assert (=> start!97892 tp!83500))

(declare-fun array_inv!27093 (array!73054) Bool)

(assert (=> start!97892 (and (array_inv!27093 _values!996) e!638324)))

(declare-fun b!1121094 () Bool)

(declare-fun res!748972 () Bool)

(assert (=> b!1121094 (=> (not res!748972) (not e!638321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121094 (= res!748972 (validKeyInArray!0 k0!934))))

(declare-fun b!1121095 () Bool)

(declare-fun e!638327 () Bool)

(assert (=> b!1121095 (= e!638327 true)))

(assert (=> b!1121095 e!638328))

(declare-fun c!109362 () Bool)

(assert (=> b!1121095 (= c!109362 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36615 0))(
  ( (Unit!36616) )
))
(declare-fun lt!498084 () Unit!36615)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!325 (array!73052 array!73054 (_ BitVec 32) (_ BitVec 32) V!42633 V!42633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36615)

(assert (=> b!1121095 (= lt!498084 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121096 () Bool)

(declare-fun res!748975 () Bool)

(assert (=> b!1121096 (=> (not res!748975) (not e!638321))))

(assert (=> b!1121096 (= res!748975 (and (= (size!35718 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35717 _keys!1208) (size!35718 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121097 () Bool)

(assert (=> b!1121097 (= e!638323 tp_is_empty!28129)))

(declare-fun b!1121098 () Bool)

(declare-fun res!748968 () Bool)

(assert (=> b!1121098 (=> (not res!748968) (not e!638321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121098 (= res!748968 (validMask!0 mask!1564))))

(declare-fun bm!47054 () Bool)

(assert (=> bm!47054 (= call!47056 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121099 () Bool)

(assert (=> b!1121099 (= e!638328 (= call!47057 call!47056))))

(declare-fun b!1121100 () Bool)

(assert (=> b!1121100 (= e!638321 e!638322)))

(declare-fun res!748978 () Bool)

(assert (=> b!1121100 (=> (not res!748978) (not e!638322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73052 (_ BitVec 32)) Bool)

(assert (=> b!1121100 (= res!748978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498082 mask!1564))))

(assert (=> b!1121100 (= lt!498082 (array!73053 (store (arr!35179 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35717 _keys!1208)))))

(declare-fun b!1121101 () Bool)

(declare-fun e!638325 () Bool)

(assert (=> b!1121101 (= e!638322 (not e!638325))))

(declare-fun res!748967 () Bool)

(assert (=> b!1121101 (=> res!748967 e!638325)))

(assert (=> b!1121101 (= res!748967 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121101 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498085 () Unit!36615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73052 (_ BitVec 64) (_ BitVec 32)) Unit!36615)

(assert (=> b!1121101 (= lt!498085 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121102 () Bool)

(assert (=> b!1121102 (= e!638325 e!638327)))

(declare-fun res!748976 () Bool)

(assert (=> b!1121102 (=> res!748976 e!638327)))

(assert (=> b!1121102 (= res!748976 (not (= from!1455 i!673)))))

(declare-fun lt!498083 () ListLongMap!15759)

(assert (=> b!1121102 (= lt!498083 (getCurrentListMapNoExtraKeys!4403 lt!498082 lt!498087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2443 (Int (_ BitVec 64)) V!42633)

(assert (=> b!1121102 (= lt!498087 (array!73055 (store (arr!35180 _values!996) i!673 (ValueCellFull!13355 (dynLambda!2443 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35718 _values!996)))))

(declare-fun lt!498086 () ListLongMap!15759)

(assert (=> b!1121102 (= lt!498086 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121103 () Bool)

(declare-fun res!748973 () Bool)

(assert (=> b!1121103 (=> (not res!748973) (not e!638321))))

(assert (=> b!1121103 (= res!748973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97892 res!748969) b!1121098))

(assert (= (and b!1121098 res!748968) b!1121096))

(assert (= (and b!1121096 res!748975) b!1121103))

(assert (= (and b!1121103 res!748973) b!1121088))

(assert (= (and b!1121088 res!748970) b!1121091))

(assert (= (and b!1121091 res!748971) b!1121094))

(assert (= (and b!1121094 res!748972) b!1121089))

(assert (= (and b!1121089 res!748977) b!1121100))

(assert (= (and b!1121100 res!748978) b!1121087))

(assert (= (and b!1121087 res!748974) b!1121101))

(assert (= (and b!1121101 (not res!748967)) b!1121102))

(assert (= (and b!1121102 (not res!748976)) b!1121095))

(assert (= (and b!1121095 c!109362) b!1121093))

(assert (= (and b!1121095 (not c!109362)) b!1121099))

(assert (= (or b!1121093 b!1121099) bm!47053))

(assert (= (or b!1121093 b!1121099) bm!47054))

(assert (= (and b!1121092 condMapEmpty!44011) mapIsEmpty!44011))

(assert (= (and b!1121092 (not condMapEmpty!44011)) mapNonEmpty!44011))

(get-info :version)

(assert (= (and mapNonEmpty!44011 ((_ is ValueCellFull!13355) mapValue!44011)) b!1121090))

(assert (= (and b!1121092 ((_ is ValueCellFull!13355) mapDefault!44011)) b!1121097))

(assert (= start!97892 b!1121092))

(declare-fun b_lambda!18551 () Bool)

(assert (=> (not b_lambda!18551) (not b!1121102)))

(declare-fun t!35144 () Bool)

(declare-fun tb!8403 () Bool)

(assert (=> (and start!97892 (= defaultEntry!1004 defaultEntry!1004) t!35144) tb!8403))

(declare-fun result!17375 () Bool)

(assert (=> tb!8403 (= result!17375 tp_is_empty!28129)))

(assert (=> b!1121102 t!35144))

(declare-fun b_and!37961 () Bool)

(assert (= b_and!37959 (and (=> t!35144 result!17375) b_and!37961)))

(declare-fun m!1035477 () Bool)

(assert (=> b!1121093 m!1035477))

(declare-fun m!1035479 () Bool)

(assert (=> bm!47054 m!1035479))

(declare-fun m!1035481 () Bool)

(assert (=> b!1121102 m!1035481))

(declare-fun m!1035483 () Bool)

(assert (=> b!1121102 m!1035483))

(declare-fun m!1035485 () Bool)

(assert (=> b!1121102 m!1035485))

(declare-fun m!1035487 () Bool)

(assert (=> b!1121102 m!1035487))

(declare-fun m!1035489 () Bool)

(assert (=> b!1121103 m!1035489))

(declare-fun m!1035491 () Bool)

(assert (=> start!97892 m!1035491))

(declare-fun m!1035493 () Bool)

(assert (=> start!97892 m!1035493))

(declare-fun m!1035495 () Bool)

(assert (=> b!1121094 m!1035495))

(declare-fun m!1035497 () Bool)

(assert (=> b!1121100 m!1035497))

(declare-fun m!1035499 () Bool)

(assert (=> b!1121100 m!1035499))

(declare-fun m!1035501 () Bool)

(assert (=> b!1121088 m!1035501))

(declare-fun m!1035503 () Bool)

(assert (=> b!1121095 m!1035503))

(declare-fun m!1035505 () Bool)

(assert (=> bm!47053 m!1035505))

(declare-fun m!1035507 () Bool)

(assert (=> mapNonEmpty!44011 m!1035507))

(declare-fun m!1035509 () Bool)

(assert (=> b!1121101 m!1035509))

(declare-fun m!1035511 () Bool)

(assert (=> b!1121101 m!1035511))

(declare-fun m!1035513 () Bool)

(assert (=> b!1121098 m!1035513))

(declare-fun m!1035515 () Bool)

(assert (=> b!1121089 m!1035515))

(declare-fun m!1035517 () Bool)

(assert (=> b!1121087 m!1035517))

(check-sat (not b!1121103) (not bm!47053) (not b_lambda!18551) (not b!1121094) b_and!37961 (not mapNonEmpty!44011) (not b!1121088) (not start!97892) (not b!1121087) (not b!1121093) (not b_next!23599) (not b!1121095) (not b!1121101) (not b!1121098) (not b!1121100) (not b!1121102) (not bm!47054) tp_is_empty!28129)
(check-sat b_and!37961 (not b_next!23599))
