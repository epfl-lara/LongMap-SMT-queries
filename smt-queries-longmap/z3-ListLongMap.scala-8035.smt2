; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99052 () Bool)

(assert start!99052)

(declare-fun b_free!24657 () Bool)

(declare-fun b_next!24657 () Bool)

(assert (=> start!99052 (= b_free!24657 (not b_next!24657))))

(declare-fun tp!86681 () Bool)

(declare-fun b_and!40163 () Bool)

(assert (=> start!99052 (= tp!86681 b_and!40163)))

(declare-fun b!1164578 () Bool)

(declare-fun res!772293 () Bool)

(declare-fun e!662128 () Bool)

(assert (=> b!1164578 (=> (not res!772293) (not e!662128))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164578 (= res!772293 (validKeyInArray!0 k0!934))))

(declare-fun b!1164579 () Bool)

(declare-fun res!772285 () Bool)

(assert (=> b!1164579 (=> (not res!772285) (not e!662128))))

(declare-datatypes ((array!75209 0))(
  ( (array!75210 (arr!36255 (Array (_ BitVec 32) (_ BitVec 64))) (size!36791 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75209)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75209 (_ BitVec 32)) Bool)

(assert (=> b!1164579 (= res!772285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164580 () Bool)

(declare-fun res!772289 () Bool)

(assert (=> b!1164580 (=> (not res!772289) (not e!662128))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44043 0))(
  ( (V!44044 (val!14650 Int)) )
))
(declare-datatypes ((ValueCell!13884 0))(
  ( (ValueCellFull!13884 (v!17287 V!44043)) (EmptyCell!13884) )
))
(declare-datatypes ((array!75211 0))(
  ( (array!75212 (arr!36256 (Array (_ BitVec 32) ValueCell!13884)) (size!36792 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75211)

(assert (=> b!1164580 (= res!772289 (and (= (size!36792 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36791 _keys!1208) (size!36792 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164581 () Bool)

(declare-fun res!772294 () Bool)

(assert (=> b!1164581 (=> (not res!772294) (not e!662128))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164581 (= res!772294 (= (select (arr!36255 _keys!1208) i!673) k0!934))))

(declare-fun b!1164582 () Bool)

(declare-fun e!662132 () Bool)

(assert (=> b!1164582 (= e!662132 true)))

(declare-fun zeroValue!944 () V!44043)

(declare-fun lt!524679 () array!75209)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18686 0))(
  ( (tuple2!18687 (_1!9354 (_ BitVec 64)) (_2!9354 V!44043)) )
))
(declare-datatypes ((List!25419 0))(
  ( (Nil!25416) (Cons!25415 (h!26624 tuple2!18686) (t!37068 List!25419)) )
))
(declare-datatypes ((ListLongMap!16655 0))(
  ( (ListLongMap!16656 (toList!8343 List!25419)) )
))
(declare-fun lt!524678 () ListLongMap!16655)

(declare-fun minValue!944 () V!44043)

(declare-fun getCurrentListMapNoExtraKeys!4807 (array!75209 array!75211 (_ BitVec 32) (_ BitVec 32) V!44043 V!44043 (_ BitVec 32) Int) ListLongMap!16655)

(declare-fun dynLambda!2797 (Int (_ BitVec 64)) V!44043)

(assert (=> b!1164582 (= lt!524678 (getCurrentListMapNoExtraKeys!4807 lt!524679 (array!75212 (store (arr!36256 _values!996) i!673 (ValueCellFull!13884 (dynLambda!2797 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36792 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524677 () ListLongMap!16655)

(assert (=> b!1164582 (= lt!524677 (getCurrentListMapNoExtraKeys!4807 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!45605 () Bool)

(declare-fun mapRes!45605 () Bool)

(declare-fun tp!86682 () Bool)

(declare-fun e!662127 () Bool)

(assert (=> mapNonEmpty!45605 (= mapRes!45605 (and tp!86682 e!662127))))

(declare-fun mapRest!45605 () (Array (_ BitVec 32) ValueCell!13884))

(declare-fun mapValue!45605 () ValueCell!13884)

(declare-fun mapKey!45605 () (_ BitVec 32))

(assert (=> mapNonEmpty!45605 (= (arr!36256 _values!996) (store mapRest!45605 mapKey!45605 mapValue!45605))))

(declare-fun b!1164583 () Bool)

(declare-fun res!772295 () Bool)

(assert (=> b!1164583 (=> (not res!772295) (not e!662128))))

(assert (=> b!1164583 (= res!772295 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36791 _keys!1208))))))

(declare-fun b!1164584 () Bool)

(declare-fun res!772290 () Bool)

(declare-fun e!662129 () Bool)

(assert (=> b!1164584 (=> (not res!772290) (not e!662129))))

(declare-datatypes ((List!25420 0))(
  ( (Nil!25417) (Cons!25416 (h!26625 (_ BitVec 64)) (t!37069 List!25420)) )
))
(declare-fun arrayNoDuplicates!0 (array!75209 (_ BitVec 32) List!25420) Bool)

(assert (=> b!1164584 (= res!772290 (arrayNoDuplicates!0 lt!524679 #b00000000000000000000000000000000 Nil!25417))))

(declare-fun b!1164585 () Bool)

(declare-fun res!772287 () Bool)

(assert (=> b!1164585 (=> (not res!772287) (not e!662128))))

(assert (=> b!1164585 (= res!772287 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25417))))

(declare-fun b!1164586 () Bool)

(assert (=> b!1164586 (= e!662128 e!662129)))

(declare-fun res!772292 () Bool)

(assert (=> b!1164586 (=> (not res!772292) (not e!662129))))

(assert (=> b!1164586 (= res!772292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524679 mask!1564))))

(assert (=> b!1164586 (= lt!524679 (array!75210 (store (arr!36255 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36791 _keys!1208)))))

(declare-fun mapIsEmpty!45605 () Bool)

(assert (=> mapIsEmpty!45605 mapRes!45605))

(declare-fun res!772291 () Bool)

(assert (=> start!99052 (=> (not res!772291) (not e!662128))))

(assert (=> start!99052 (= res!772291 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36791 _keys!1208))))))

(assert (=> start!99052 e!662128))

(declare-fun tp_is_empty!29187 () Bool)

(assert (=> start!99052 tp_is_empty!29187))

(declare-fun array_inv!27736 (array!75209) Bool)

(assert (=> start!99052 (array_inv!27736 _keys!1208)))

(assert (=> start!99052 true))

(assert (=> start!99052 tp!86681))

(declare-fun e!662131 () Bool)

(declare-fun array_inv!27737 (array!75211) Bool)

(assert (=> start!99052 (and (array_inv!27737 _values!996) e!662131)))

(declare-fun b!1164587 () Bool)

(assert (=> b!1164587 (= e!662129 (not e!662132))))

(declare-fun res!772286 () Bool)

(assert (=> b!1164587 (=> res!772286 e!662132)))

(assert (=> b!1164587 (= res!772286 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164587 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38436 0))(
  ( (Unit!38437) )
))
(declare-fun lt!524676 () Unit!38436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75209 (_ BitVec 64) (_ BitVec 32)) Unit!38436)

(assert (=> b!1164587 (= lt!524676 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164588 () Bool)

(declare-fun e!662133 () Bool)

(assert (=> b!1164588 (= e!662133 tp_is_empty!29187)))

(declare-fun b!1164589 () Bool)

(assert (=> b!1164589 (= e!662127 tp_is_empty!29187)))

(declare-fun b!1164590 () Bool)

(assert (=> b!1164590 (= e!662131 (and e!662133 mapRes!45605))))

(declare-fun condMapEmpty!45605 () Bool)

(declare-fun mapDefault!45605 () ValueCell!13884)

(assert (=> b!1164590 (= condMapEmpty!45605 (= (arr!36256 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13884)) mapDefault!45605)))))

(declare-fun b!1164591 () Bool)

(declare-fun res!772288 () Bool)

(assert (=> b!1164591 (=> (not res!772288) (not e!662128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164591 (= res!772288 (validMask!0 mask!1564))))

(assert (= (and start!99052 res!772291) b!1164591))

(assert (= (and b!1164591 res!772288) b!1164580))

(assert (= (and b!1164580 res!772289) b!1164579))

(assert (= (and b!1164579 res!772285) b!1164585))

(assert (= (and b!1164585 res!772287) b!1164583))

(assert (= (and b!1164583 res!772295) b!1164578))

(assert (= (and b!1164578 res!772293) b!1164581))

(assert (= (and b!1164581 res!772294) b!1164586))

(assert (= (and b!1164586 res!772292) b!1164584))

(assert (= (and b!1164584 res!772290) b!1164587))

(assert (= (and b!1164587 (not res!772286)) b!1164582))

(assert (= (and b!1164590 condMapEmpty!45605) mapIsEmpty!45605))

(assert (= (and b!1164590 (not condMapEmpty!45605)) mapNonEmpty!45605))

(get-info :version)

(assert (= (and mapNonEmpty!45605 ((_ is ValueCellFull!13884) mapValue!45605)) b!1164589))

(assert (= (and b!1164590 ((_ is ValueCellFull!13884) mapDefault!45605)) b!1164588))

(assert (= start!99052 b!1164590))

(declare-fun b_lambda!19763 () Bool)

(assert (=> (not b_lambda!19763) (not b!1164582)))

(declare-fun t!37067 () Bool)

(declare-fun tb!9469 () Bool)

(assert (=> (and start!99052 (= defaultEntry!1004 defaultEntry!1004) t!37067) tb!9469))

(declare-fun result!19503 () Bool)

(assert (=> tb!9469 (= result!19503 tp_is_empty!29187)))

(assert (=> b!1164582 t!37067))

(declare-fun b_and!40165 () Bool)

(assert (= b_and!40163 (and (=> t!37067 result!19503) b_and!40165)))

(declare-fun m!1072971 () Bool)

(assert (=> b!1164585 m!1072971))

(declare-fun m!1072973 () Bool)

(assert (=> b!1164579 m!1072973))

(declare-fun m!1072975 () Bool)

(assert (=> b!1164587 m!1072975))

(declare-fun m!1072977 () Bool)

(assert (=> b!1164587 m!1072977))

(declare-fun m!1072979 () Bool)

(assert (=> mapNonEmpty!45605 m!1072979))

(declare-fun m!1072981 () Bool)

(assert (=> b!1164578 m!1072981))

(declare-fun m!1072983 () Bool)

(assert (=> b!1164591 m!1072983))

(declare-fun m!1072985 () Bool)

(assert (=> start!99052 m!1072985))

(declare-fun m!1072987 () Bool)

(assert (=> start!99052 m!1072987))

(declare-fun m!1072989 () Bool)

(assert (=> b!1164581 m!1072989))

(declare-fun m!1072991 () Bool)

(assert (=> b!1164584 m!1072991))

(declare-fun m!1072993 () Bool)

(assert (=> b!1164582 m!1072993))

(declare-fun m!1072995 () Bool)

(assert (=> b!1164582 m!1072995))

(declare-fun m!1072997 () Bool)

(assert (=> b!1164582 m!1072997))

(declare-fun m!1072999 () Bool)

(assert (=> b!1164582 m!1072999))

(declare-fun m!1073001 () Bool)

(assert (=> b!1164586 m!1073001))

(declare-fun m!1073003 () Bool)

(assert (=> b!1164586 m!1073003))

(check-sat (not mapNonEmpty!45605) (not b!1164579) tp_is_empty!29187 (not b!1164578) (not b!1164582) (not b_lambda!19763) (not b!1164585) b_and!40165 (not start!99052) (not b!1164584) (not b!1164591) (not b!1164586) (not b!1164587) (not b_next!24657))
(check-sat b_and!40165 (not b_next!24657))
