; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99382 () Bool)

(assert start!99382)

(declare-fun b_free!24751 () Bool)

(declare-fun b_next!24751 () Bool)

(assert (=> start!99382 (= b_free!24751 (not b_next!24751))))

(declare-fun tp!86963 () Bool)

(declare-fun b_and!40353 () Bool)

(assert (=> start!99382 (= tp!86963 b_and!40353)))

(declare-fun b!1167991 () Bool)

(declare-fun e!664008 () Bool)

(declare-fun e!664004 () Bool)

(assert (=> b!1167991 (= e!664008 e!664004)))

(declare-fun res!774408 () Bool)

(assert (=> b!1167991 (=> res!774408 e!664004)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167991 (= res!774408 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44169 0))(
  ( (V!44170 (val!14697 Int)) )
))
(declare-fun zeroValue!944 () V!44169)

(declare-datatypes ((tuple2!18782 0))(
  ( (tuple2!18783 (_1!9402 (_ BitVec 64)) (_2!9402 V!44169)) )
))
(declare-datatypes ((List!25522 0))(
  ( (Nil!25519) (Cons!25518 (h!26736 tuple2!18782) (t!37257 List!25522)) )
))
(declare-datatypes ((ListLongMap!16759 0))(
  ( (ListLongMap!16760 (toList!8395 List!25522)) )
))
(declare-fun lt!525841 () ListLongMap!16759)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!75441 0))(
  ( (array!75442 (arr!36365 (Array (_ BitVec 32) (_ BitVec 64))) (size!36902 (_ BitVec 32))) )
))
(declare-fun lt!525840 () array!75441)

(declare-datatypes ((ValueCell!13931 0))(
  ( (ValueCellFull!13931 (v!17330 V!44169)) (EmptyCell!13931) )
))
(declare-datatypes ((array!75443 0))(
  ( (array!75444 (arr!36366 (Array (_ BitVec 32) ValueCell!13931)) (size!36903 (_ BitVec 32))) )
))
(declare-fun lt!525839 () array!75443)

(declare-fun minValue!944 () V!44169)

(declare-fun getCurrentListMapNoExtraKeys!4886 (array!75441 array!75443 (_ BitVec 32) (_ BitVec 32) V!44169 V!44169 (_ BitVec 32) Int) ListLongMap!16759)

(assert (=> b!1167991 (= lt!525841 (getCurrentListMapNoExtraKeys!4886 lt!525840 lt!525839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75443)

(declare-fun dynLambda!2875 (Int (_ BitVec 64)) V!44169)

(assert (=> b!1167991 (= lt!525839 (array!75444 (store (arr!36366 _values!996) i!673 (ValueCellFull!13931 (dynLambda!2875 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36903 _values!996)))))

(declare-fun lt!525836 () ListLongMap!16759)

(declare-fun _keys!1208 () array!75441)

(assert (=> b!1167991 (= lt!525836 (getCurrentListMapNoExtraKeys!4886 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167992 () Bool)

(declare-fun res!774401 () Bool)

(declare-fun e!664005 () Bool)

(assert (=> b!1167992 (=> (not res!774401) (not e!664005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167992 (= res!774401 (validMask!0 mask!1564))))

(declare-fun b!1167993 () Bool)

(declare-fun e!664007 () Bool)

(assert (=> b!1167993 (= e!664005 e!664007)))

(declare-fun res!774400 () Bool)

(assert (=> b!1167993 (=> (not res!774400) (not e!664007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75441 (_ BitVec 32)) Bool)

(assert (=> b!1167993 (= res!774400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525840 mask!1564))))

(assert (=> b!1167993 (= lt!525840 (array!75442 (store (arr!36365 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36902 _keys!1208)))))

(declare-fun b!1167994 () Bool)

(declare-fun res!774406 () Bool)

(assert (=> b!1167994 (=> (not res!774406) (not e!664005))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167994 (= res!774406 (validKeyInArray!0 k0!934))))

(declare-fun b!1167995 () Bool)

(declare-fun res!774405 () Bool)

(assert (=> b!1167995 (=> (not res!774405) (not e!664007))))

(declare-datatypes ((List!25523 0))(
  ( (Nil!25520) (Cons!25519 (h!26737 (_ BitVec 64)) (t!37258 List!25523)) )
))
(declare-fun arrayNoDuplicates!0 (array!75441 (_ BitVec 32) List!25523) Bool)

(assert (=> b!1167995 (= res!774405 (arrayNoDuplicates!0 lt!525840 #b00000000000000000000000000000000 Nil!25520))))

(declare-fun mapNonEmpty!45746 () Bool)

(declare-fun mapRes!45746 () Bool)

(declare-fun tp!86964 () Bool)

(declare-fun e!664009 () Bool)

(assert (=> mapNonEmpty!45746 (= mapRes!45746 (and tp!86964 e!664009))))

(declare-fun mapRest!45746 () (Array (_ BitVec 32) ValueCell!13931))

(declare-fun mapKey!45746 () (_ BitVec 32))

(declare-fun mapValue!45746 () ValueCell!13931)

(assert (=> mapNonEmpty!45746 (= (arr!36366 _values!996) (store mapRest!45746 mapKey!45746 mapValue!45746))))

(declare-fun b!1167996 () Bool)

(declare-fun res!774402 () Bool)

(assert (=> b!1167996 (=> (not res!774402) (not e!664005))))

(assert (=> b!1167996 (= res!774402 (= (select (arr!36365 _keys!1208) i!673) k0!934))))

(declare-fun b!1167998 () Bool)

(declare-fun res!774403 () Bool)

(assert (=> b!1167998 (=> (not res!774403) (not e!664005))))

(assert (=> b!1167998 (= res!774403 (and (= (size!36903 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36902 _keys!1208) (size!36903 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167999 () Bool)

(declare-fun e!664002 () Bool)

(declare-fun e!664006 () Bool)

(assert (=> b!1167999 (= e!664002 (and e!664006 mapRes!45746))))

(declare-fun condMapEmpty!45746 () Bool)

(declare-fun mapDefault!45746 () ValueCell!13931)

(assert (=> b!1167999 (= condMapEmpty!45746 (= (arr!36366 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13931)) mapDefault!45746)))))

(declare-fun b!1168000 () Bool)

(declare-fun tp_is_empty!29281 () Bool)

(assert (=> b!1168000 (= e!664009 tp_is_empty!29281)))

(declare-fun b!1168001 () Bool)

(declare-fun res!774410 () Bool)

(assert (=> b!1168001 (=> (not res!774410) (not e!664005))))

(assert (=> b!1168001 (= res!774410 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25520))))

(declare-fun b!1168002 () Bool)

(assert (=> b!1168002 (= e!664004 true)))

(declare-fun -!1458 (ListLongMap!16759 (_ BitVec 64)) ListLongMap!16759)

(assert (=> b!1168002 (= (getCurrentListMapNoExtraKeys!4886 lt!525840 lt!525839 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1458 (getCurrentListMapNoExtraKeys!4886 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38487 0))(
  ( (Unit!38488) )
))
(declare-fun lt!525838 () Unit!38487)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!683 (array!75441 array!75443 (_ BitVec 32) (_ BitVec 32) V!44169 V!44169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38487)

(assert (=> b!1168002 (= lt!525838 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!683 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168003 () Bool)

(declare-fun res!774407 () Bool)

(assert (=> b!1168003 (=> (not res!774407) (not e!664005))))

(assert (=> b!1168003 (= res!774407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45746 () Bool)

(assert (=> mapIsEmpty!45746 mapRes!45746))

(declare-fun b!1167997 () Bool)

(declare-fun res!774409 () Bool)

(assert (=> b!1167997 (=> (not res!774409) (not e!664005))))

(assert (=> b!1167997 (= res!774409 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36902 _keys!1208))))))

(declare-fun res!774411 () Bool)

(assert (=> start!99382 (=> (not res!774411) (not e!664005))))

(assert (=> start!99382 (= res!774411 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36902 _keys!1208))))))

(assert (=> start!99382 e!664005))

(assert (=> start!99382 tp_is_empty!29281))

(declare-fun array_inv!27880 (array!75441) Bool)

(assert (=> start!99382 (array_inv!27880 _keys!1208)))

(assert (=> start!99382 true))

(assert (=> start!99382 tp!86963))

(declare-fun array_inv!27881 (array!75443) Bool)

(assert (=> start!99382 (and (array_inv!27881 _values!996) e!664002)))

(declare-fun b!1168004 () Bool)

(assert (=> b!1168004 (= e!664006 tp_is_empty!29281)))

(declare-fun b!1168005 () Bool)

(assert (=> b!1168005 (= e!664007 (not e!664008))))

(declare-fun res!774404 () Bool)

(assert (=> b!1168005 (=> res!774404 e!664008)))

(assert (=> b!1168005 (= res!774404 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168005 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525837 () Unit!38487)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75441 (_ BitVec 64) (_ BitVec 32)) Unit!38487)

(assert (=> b!1168005 (= lt!525837 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99382 res!774411) b!1167992))

(assert (= (and b!1167992 res!774401) b!1167998))

(assert (= (and b!1167998 res!774403) b!1168003))

(assert (= (and b!1168003 res!774407) b!1168001))

(assert (= (and b!1168001 res!774410) b!1167997))

(assert (= (and b!1167997 res!774409) b!1167994))

(assert (= (and b!1167994 res!774406) b!1167996))

(assert (= (and b!1167996 res!774402) b!1167993))

(assert (= (and b!1167993 res!774400) b!1167995))

(assert (= (and b!1167995 res!774405) b!1168005))

(assert (= (and b!1168005 (not res!774404)) b!1167991))

(assert (= (and b!1167991 (not res!774408)) b!1168002))

(assert (= (and b!1167999 condMapEmpty!45746) mapIsEmpty!45746))

(assert (= (and b!1167999 (not condMapEmpty!45746)) mapNonEmpty!45746))

(get-info :version)

(assert (= (and mapNonEmpty!45746 ((_ is ValueCellFull!13931) mapValue!45746)) b!1168000))

(assert (= (and b!1167999 ((_ is ValueCellFull!13931) mapDefault!45746)) b!1168004))

(assert (= start!99382 b!1167999))

(declare-fun b_lambda!19851 () Bool)

(assert (=> (not b_lambda!19851) (not b!1167991)))

(declare-fun t!37256 () Bool)

(declare-fun tb!9555 () Bool)

(assert (=> (and start!99382 (= defaultEntry!1004 defaultEntry!1004) t!37256) tb!9555))

(declare-fun result!19683 () Bool)

(assert (=> tb!9555 (= result!19683 tp_is_empty!29281)))

(assert (=> b!1167991 t!37256))

(declare-fun b_and!40355 () Bool)

(assert (= b_and!40353 (and (=> t!37256 result!19683) b_and!40355)))

(declare-fun m!1076285 () Bool)

(assert (=> b!1167991 m!1076285))

(declare-fun m!1076287 () Bool)

(assert (=> b!1167991 m!1076287))

(declare-fun m!1076289 () Bool)

(assert (=> b!1167991 m!1076289))

(declare-fun m!1076291 () Bool)

(assert (=> b!1167991 m!1076291))

(declare-fun m!1076293 () Bool)

(assert (=> b!1167995 m!1076293))

(declare-fun m!1076295 () Bool)

(assert (=> b!1168001 m!1076295))

(declare-fun m!1076297 () Bool)

(assert (=> b!1167992 m!1076297))

(declare-fun m!1076299 () Bool)

(assert (=> mapNonEmpty!45746 m!1076299))

(declare-fun m!1076301 () Bool)

(assert (=> b!1167994 m!1076301))

(declare-fun m!1076303 () Bool)

(assert (=> b!1167993 m!1076303))

(declare-fun m!1076305 () Bool)

(assert (=> b!1167993 m!1076305))

(declare-fun m!1076307 () Bool)

(assert (=> start!99382 m!1076307))

(declare-fun m!1076309 () Bool)

(assert (=> start!99382 m!1076309))

(declare-fun m!1076311 () Bool)

(assert (=> b!1168002 m!1076311))

(declare-fun m!1076313 () Bool)

(assert (=> b!1168002 m!1076313))

(assert (=> b!1168002 m!1076313))

(declare-fun m!1076315 () Bool)

(assert (=> b!1168002 m!1076315))

(declare-fun m!1076317 () Bool)

(assert (=> b!1168002 m!1076317))

(declare-fun m!1076319 () Bool)

(assert (=> b!1168003 m!1076319))

(declare-fun m!1076321 () Bool)

(assert (=> b!1167996 m!1076321))

(declare-fun m!1076323 () Bool)

(assert (=> b!1168005 m!1076323))

(declare-fun m!1076325 () Bool)

(assert (=> b!1168005 m!1076325))

(check-sat tp_is_empty!29281 (not b!1167995) (not b_lambda!19851) (not b!1168001) (not b!1168002) (not b!1167993) (not b_next!24751) (not b!1167991) (not b!1168003) (not mapNonEmpty!45746) (not start!99382) (not b!1167994) (not b!1168005) b_and!40355 (not b!1167992))
(check-sat b_and!40355 (not b_next!24751))
