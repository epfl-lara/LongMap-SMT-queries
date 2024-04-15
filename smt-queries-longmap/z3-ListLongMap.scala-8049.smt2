; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99128 () Bool)

(assert start!99128)

(declare-fun b_free!24739 () Bool)

(declare-fun b_next!24739 () Bool)

(assert (=> start!99128 (= b_free!24739 (not b_next!24739))))

(declare-fun tp!86928 () Bool)

(declare-fun b_and!40305 () Bool)

(assert (=> start!99128 (= tp!86928 b_and!40305)))

(declare-fun b!1166296 () Bool)

(declare-fun e!662953 () Bool)

(declare-fun e!662951 () Bool)

(declare-fun mapRes!45728 () Bool)

(assert (=> b!1166296 (= e!662953 (and e!662951 mapRes!45728))))

(declare-fun condMapEmpty!45728 () Bool)

(declare-datatypes ((V!44153 0))(
  ( (V!44154 (val!14691 Int)) )
))
(declare-datatypes ((ValueCell!13925 0))(
  ( (ValueCellFull!13925 (v!17327 V!44153)) (EmptyCell!13925) )
))
(declare-datatypes ((array!75290 0))(
  ( (array!75291 (arr!36296 (Array (_ BitVec 32) ValueCell!13925)) (size!36834 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75290)

(declare-fun mapDefault!45728 () ValueCell!13925)

(assert (=> b!1166296 (= condMapEmpty!45728 (= (arr!36296 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13925)) mapDefault!45728)))))

(declare-fun b!1166297 () Bool)

(declare-fun res!773611 () Bool)

(declare-fun e!662950 () Bool)

(assert (=> b!1166297 (=> (not res!773611) (not e!662950))))

(declare-datatypes ((array!75292 0))(
  ( (array!75293 (arr!36297 (Array (_ BitVec 32) (_ BitVec 64))) (size!36835 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75292)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166297 (= res!773611 (= (select (arr!36297 _keys!1208) i!673) k0!934))))

(declare-fun b!1166298 () Bool)

(declare-fun e!662948 () Bool)

(declare-fun tp_is_empty!29269 () Bool)

(assert (=> b!1166298 (= e!662948 tp_is_empty!29269)))

(declare-fun mapIsEmpty!45728 () Bool)

(assert (=> mapIsEmpty!45728 mapRes!45728))

(declare-fun b!1166299 () Bool)

(declare-fun res!773615 () Bool)

(assert (=> b!1166299 (=> (not res!773615) (not e!662950))))

(declare-datatypes ((List!25543 0))(
  ( (Nil!25540) (Cons!25539 (h!26748 (_ BitVec 64)) (t!37265 List!25543)) )
))
(declare-fun arrayNoDuplicates!0 (array!75292 (_ BitVec 32) List!25543) Bool)

(assert (=> b!1166299 (= res!773615 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25540))))

(declare-fun b!1166301 () Bool)

(declare-fun res!773616 () Bool)

(assert (=> b!1166301 (=> (not res!773616) (not e!662950))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1166301 (= res!773616 (and (= (size!36834 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36835 _keys!1208) (size!36834 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166302 () Bool)

(declare-fun res!773620 () Bool)

(assert (=> b!1166302 (=> (not res!773620) (not e!662950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166302 (= res!773620 (validKeyInArray!0 k0!934))))

(declare-fun b!1166303 () Bool)

(declare-fun res!773621 () Bool)

(assert (=> b!1166303 (=> (not res!773621) (not e!662950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75292 (_ BitVec 32)) Bool)

(assert (=> b!1166303 (= res!773621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166304 () Bool)

(declare-fun res!773619 () Bool)

(declare-fun e!662952 () Bool)

(assert (=> b!1166304 (=> (not res!773619) (not e!662952))))

(declare-fun lt!525055 () array!75292)

(assert (=> b!1166304 (= res!773619 (arrayNoDuplicates!0 lt!525055 #b00000000000000000000000000000000 Nil!25540))))

(declare-fun mapNonEmpty!45728 () Bool)

(declare-fun tp!86927 () Bool)

(assert (=> mapNonEmpty!45728 (= mapRes!45728 (and tp!86927 e!662948))))

(declare-fun mapRest!45728 () (Array (_ BitVec 32) ValueCell!13925))

(declare-fun mapKey!45728 () (_ BitVec 32))

(declare-fun mapValue!45728 () ValueCell!13925)

(assert (=> mapNonEmpty!45728 (= (arr!36296 _values!996) (store mapRest!45728 mapKey!45728 mapValue!45728))))

(declare-fun b!1166305 () Bool)

(declare-fun res!773617 () Bool)

(assert (=> b!1166305 (=> (not res!773617) (not e!662950))))

(assert (=> b!1166305 (= res!773617 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36835 _keys!1208))))))

(declare-fun b!1166306 () Bool)

(declare-fun res!773614 () Bool)

(assert (=> b!1166306 (=> (not res!773614) (not e!662950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166306 (= res!773614 (validMask!0 mask!1564))))

(declare-fun b!1166307 () Bool)

(declare-fun e!662954 () Bool)

(assert (=> b!1166307 (= e!662954 true)))

(declare-fun zeroValue!944 () V!44153)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44153)

(declare-fun lt!525056 () array!75290)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18826 0))(
  ( (tuple2!18827 (_1!9424 (_ BitVec 64)) (_2!9424 V!44153)) )
))
(declare-datatypes ((List!25544 0))(
  ( (Nil!25541) (Cons!25540 (h!26749 tuple2!18826) (t!37266 List!25544)) )
))
(declare-datatypes ((ListLongMap!16795 0))(
  ( (ListLongMap!16796 (toList!8413 List!25544)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4889 (array!75292 array!75290 (_ BitVec 32) (_ BitVec 32) V!44153 V!44153 (_ BitVec 32) Int) ListLongMap!16795)

(declare-fun -!1426 (ListLongMap!16795 (_ BitVec 64)) ListLongMap!16795)

(assert (=> b!1166307 (= (getCurrentListMapNoExtraKeys!4889 lt!525055 lt!525056 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1426 (getCurrentListMapNoExtraKeys!4889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38317 0))(
  ( (Unit!38318) )
))
(declare-fun lt!525052 () Unit!38317)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!690 (array!75292 array!75290 (_ BitVec 32) (_ BitVec 32) V!44153 V!44153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38317)

(assert (=> b!1166307 (= lt!525052 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166308 () Bool)

(assert (=> b!1166308 (= e!662950 e!662952)))

(declare-fun res!773613 () Bool)

(assert (=> b!1166308 (=> (not res!773613) (not e!662952))))

(assert (=> b!1166308 (= res!773613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525055 mask!1564))))

(assert (=> b!1166308 (= lt!525055 (array!75293 (store (arr!36297 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36835 _keys!1208)))))

(declare-fun b!1166309 () Bool)

(declare-fun e!662955 () Bool)

(assert (=> b!1166309 (= e!662952 (not e!662955))))

(declare-fun res!773618 () Bool)

(assert (=> b!1166309 (=> res!773618 e!662955)))

(assert (=> b!1166309 (= res!773618 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166309 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525057 () Unit!38317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75292 (_ BitVec 64) (_ BitVec 32)) Unit!38317)

(assert (=> b!1166309 (= lt!525057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166310 () Bool)

(assert (=> b!1166310 (= e!662955 e!662954)))

(declare-fun res!773610 () Bool)

(assert (=> b!1166310 (=> res!773610 e!662954)))

(assert (=> b!1166310 (= res!773610 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525054 () ListLongMap!16795)

(assert (=> b!1166310 (= lt!525054 (getCurrentListMapNoExtraKeys!4889 lt!525055 lt!525056 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2822 (Int (_ BitVec 64)) V!44153)

(assert (=> b!1166310 (= lt!525056 (array!75291 (store (arr!36296 _values!996) i!673 (ValueCellFull!13925 (dynLambda!2822 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36834 _values!996)))))

(declare-fun lt!525053 () ListLongMap!16795)

(assert (=> b!1166310 (= lt!525053 (getCurrentListMapNoExtraKeys!4889 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!773612 () Bool)

(assert (=> start!99128 (=> (not res!773612) (not e!662950))))

(assert (=> start!99128 (= res!773612 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36835 _keys!1208))))))

(assert (=> start!99128 e!662950))

(assert (=> start!99128 tp_is_empty!29269))

(declare-fun array_inv!27854 (array!75292) Bool)

(assert (=> start!99128 (array_inv!27854 _keys!1208)))

(assert (=> start!99128 true))

(assert (=> start!99128 tp!86928))

(declare-fun array_inv!27855 (array!75290) Bool)

(assert (=> start!99128 (and (array_inv!27855 _values!996) e!662953)))

(declare-fun b!1166300 () Bool)

(assert (=> b!1166300 (= e!662951 tp_is_empty!29269)))

(assert (= (and start!99128 res!773612) b!1166306))

(assert (= (and b!1166306 res!773614) b!1166301))

(assert (= (and b!1166301 res!773616) b!1166303))

(assert (= (and b!1166303 res!773621) b!1166299))

(assert (= (and b!1166299 res!773615) b!1166305))

(assert (= (and b!1166305 res!773617) b!1166302))

(assert (= (and b!1166302 res!773620) b!1166297))

(assert (= (and b!1166297 res!773611) b!1166308))

(assert (= (and b!1166308 res!773613) b!1166304))

(assert (= (and b!1166304 res!773619) b!1166309))

(assert (= (and b!1166309 (not res!773618)) b!1166310))

(assert (= (and b!1166310 (not res!773610)) b!1166307))

(assert (= (and b!1166296 condMapEmpty!45728) mapIsEmpty!45728))

(assert (= (and b!1166296 (not condMapEmpty!45728)) mapNonEmpty!45728))

(get-info :version)

(assert (= (and mapNonEmpty!45728 ((_ is ValueCellFull!13925) mapValue!45728)) b!1166298))

(assert (= (and b!1166296 ((_ is ValueCellFull!13925) mapDefault!45728)) b!1166300))

(assert (= start!99128 b!1166296))

(declare-fun b_lambda!19827 () Bool)

(assert (=> (not b_lambda!19827) (not b!1166310)))

(declare-fun t!37264 () Bool)

(declare-fun tb!9543 () Bool)

(assert (=> (and start!99128 (= defaultEntry!1004 defaultEntry!1004) t!37264) tb!9543))

(declare-fun result!19659 () Bool)

(assert (=> tb!9543 (= result!19659 tp_is_empty!29269)))

(assert (=> b!1166310 t!37264))

(declare-fun b_and!40307 () Bool)

(assert (= b_and!40305 (and (=> t!37264 result!19659) b_and!40307)))

(declare-fun m!1073851 () Bool)

(assert (=> b!1166307 m!1073851))

(declare-fun m!1073853 () Bool)

(assert (=> b!1166307 m!1073853))

(assert (=> b!1166307 m!1073853))

(declare-fun m!1073855 () Bool)

(assert (=> b!1166307 m!1073855))

(declare-fun m!1073857 () Bool)

(assert (=> b!1166307 m!1073857))

(declare-fun m!1073859 () Bool)

(assert (=> b!1166306 m!1073859))

(declare-fun m!1073861 () Bool)

(assert (=> b!1166304 m!1073861))

(declare-fun m!1073863 () Bool)

(assert (=> b!1166308 m!1073863))

(declare-fun m!1073865 () Bool)

(assert (=> b!1166308 m!1073865))

(declare-fun m!1073867 () Bool)

(assert (=> b!1166297 m!1073867))

(declare-fun m!1073869 () Bool)

(assert (=> b!1166309 m!1073869))

(declare-fun m!1073871 () Bool)

(assert (=> b!1166309 m!1073871))

(declare-fun m!1073873 () Bool)

(assert (=> b!1166310 m!1073873))

(declare-fun m!1073875 () Bool)

(assert (=> b!1166310 m!1073875))

(declare-fun m!1073877 () Bool)

(assert (=> b!1166310 m!1073877))

(declare-fun m!1073879 () Bool)

(assert (=> b!1166310 m!1073879))

(declare-fun m!1073881 () Bool)

(assert (=> start!99128 m!1073881))

(declare-fun m!1073883 () Bool)

(assert (=> start!99128 m!1073883))

(declare-fun m!1073885 () Bool)

(assert (=> b!1166303 m!1073885))

(declare-fun m!1073887 () Bool)

(assert (=> b!1166299 m!1073887))

(declare-fun m!1073889 () Bool)

(assert (=> mapNonEmpty!45728 m!1073889))

(declare-fun m!1073891 () Bool)

(assert (=> b!1166302 m!1073891))

(check-sat (not b!1166306) (not b!1166303) (not b!1166310) (not b!1166307) (not mapNonEmpty!45728) (not b_lambda!19827) (not b!1166308) (not start!99128) b_and!40307 (not b!1166302) (not b!1166304) (not b!1166299) tp_is_empty!29269 (not b!1166309) (not b_next!24739))
(check-sat b_and!40307 (not b_next!24739))
