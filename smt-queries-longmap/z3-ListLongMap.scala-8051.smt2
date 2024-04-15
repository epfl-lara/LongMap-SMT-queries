; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99140 () Bool)

(assert start!99140)

(declare-fun b_free!24751 () Bool)

(declare-fun b_next!24751 () Bool)

(assert (=> start!99140 (= b_free!24751 (not b_next!24751))))

(declare-fun tp!86963 () Bool)

(declare-fun b_and!40329 () Bool)

(assert (=> start!99140 (= tp!86963 b_and!40329)))

(declare-fun b!1166578 () Bool)

(declare-fun res!773835 () Bool)

(declare-fun e!663095 () Bool)

(assert (=> b!1166578 (=> (not res!773835) (not e!663095))))

(declare-datatypes ((array!75314 0))(
  ( (array!75315 (arr!36308 (Array (_ BitVec 32) (_ BitVec 64))) (size!36846 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75314)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44169 0))(
  ( (V!44170 (val!14697 Int)) )
))
(declare-datatypes ((ValueCell!13931 0))(
  ( (ValueCellFull!13931 (v!17333 V!44169)) (EmptyCell!13931) )
))
(declare-datatypes ((array!75316 0))(
  ( (array!75317 (arr!36309 (Array (_ BitVec 32) ValueCell!13931)) (size!36847 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75316)

(assert (=> b!1166578 (= res!773835 (and (= (size!36847 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36846 _keys!1208) (size!36847 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166579 () Bool)

(declare-fun res!773830 () Bool)

(assert (=> b!1166579 (=> (not res!773830) (not e!663095))))

(declare-datatypes ((List!25553 0))(
  ( (Nil!25550) (Cons!25549 (h!26758 (_ BitVec 64)) (t!37287 List!25553)) )
))
(declare-fun arrayNoDuplicates!0 (array!75314 (_ BitVec 32) List!25553) Bool)

(assert (=> b!1166579 (= res!773830 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25550))))

(declare-fun b!1166580 () Bool)

(declare-fun e!663098 () Bool)

(declare-fun e!663096 () Bool)

(declare-fun mapRes!45746 () Bool)

(assert (=> b!1166580 (= e!663098 (and e!663096 mapRes!45746))))

(declare-fun condMapEmpty!45746 () Bool)

(declare-fun mapDefault!45746 () ValueCell!13931)

(assert (=> b!1166580 (= condMapEmpty!45746 (= (arr!36309 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13931)) mapDefault!45746)))))

(declare-fun b!1166581 () Bool)

(declare-fun res!773831 () Bool)

(assert (=> b!1166581 (=> (not res!773831) (not e!663095))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166581 (= res!773831 (= (select (arr!36308 _keys!1208) i!673) k0!934))))

(declare-fun b!1166583 () Bool)

(declare-fun e!663093 () Bool)

(assert (=> b!1166583 (= e!663093 true)))

(declare-fun zeroValue!944 () V!44169)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!525161 () array!75316)

(declare-fun lt!525164 () array!75314)

(declare-fun minValue!944 () V!44169)

(declare-datatypes ((tuple2!18836 0))(
  ( (tuple2!18837 (_1!9429 (_ BitVec 64)) (_2!9429 V!44169)) )
))
(declare-datatypes ((List!25554 0))(
  ( (Nil!25551) (Cons!25550 (h!26759 tuple2!18836) (t!37288 List!25554)) )
))
(declare-datatypes ((ListLongMap!16805 0))(
  ( (ListLongMap!16806 (toList!8418 List!25554)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4894 (array!75314 array!75316 (_ BitVec 32) (_ BitVec 32) V!44169 V!44169 (_ BitVec 32) Int) ListLongMap!16805)

(declare-fun -!1430 (ListLongMap!16805 (_ BitVec 64)) ListLongMap!16805)

(assert (=> b!1166583 (= (getCurrentListMapNoExtraKeys!4894 lt!525164 lt!525161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1430 (getCurrentListMapNoExtraKeys!4894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38325 0))(
  ( (Unit!38326) )
))
(declare-fun lt!525163 () Unit!38325)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!694 (array!75314 array!75316 (_ BitVec 32) (_ BitVec 32) V!44169 V!44169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38325)

(assert (=> b!1166583 (= lt!525163 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!694 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166584 () Bool)

(declare-fun tp_is_empty!29281 () Bool)

(assert (=> b!1166584 (= e!663096 tp_is_empty!29281)))

(declare-fun b!1166585 () Bool)

(declare-fun res!773827 () Bool)

(assert (=> b!1166585 (=> (not res!773827) (not e!663095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166585 (= res!773827 (validMask!0 mask!1564))))

(declare-fun b!1166586 () Bool)

(declare-fun res!773834 () Bool)

(assert (=> b!1166586 (=> (not res!773834) (not e!663095))))

(assert (=> b!1166586 (= res!773834 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36846 _keys!1208))))))

(declare-fun mapNonEmpty!45746 () Bool)

(declare-fun tp!86964 () Bool)

(declare-fun e!663097 () Bool)

(assert (=> mapNonEmpty!45746 (= mapRes!45746 (and tp!86964 e!663097))))

(declare-fun mapValue!45746 () ValueCell!13931)

(declare-fun mapKey!45746 () (_ BitVec 32))

(declare-fun mapRest!45746 () (Array (_ BitVec 32) ValueCell!13931))

(assert (=> mapNonEmpty!45746 (= (arr!36309 _values!996) (store mapRest!45746 mapKey!45746 mapValue!45746))))

(declare-fun b!1166587 () Bool)

(assert (=> b!1166587 (= e!663097 tp_is_empty!29281)))

(declare-fun b!1166588 () Bool)

(declare-fun res!773828 () Bool)

(assert (=> b!1166588 (=> (not res!773828) (not e!663095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166588 (= res!773828 (validKeyInArray!0 k0!934))))

(declare-fun b!1166589 () Bool)

(declare-fun e!663092 () Bool)

(assert (=> b!1166589 (= e!663092 e!663093)))

(declare-fun res!773832 () Bool)

(assert (=> b!1166589 (=> res!773832 e!663093)))

(assert (=> b!1166589 (= res!773832 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525160 () ListLongMap!16805)

(assert (=> b!1166589 (= lt!525160 (getCurrentListMapNoExtraKeys!4894 lt!525164 lt!525161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2827 (Int (_ BitVec 64)) V!44169)

(assert (=> b!1166589 (= lt!525161 (array!75317 (store (arr!36309 _values!996) i!673 (ValueCellFull!13931 (dynLambda!2827 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36847 _values!996)))))

(declare-fun lt!525162 () ListLongMap!16805)

(assert (=> b!1166589 (= lt!525162 (getCurrentListMapNoExtraKeys!4894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166590 () Bool)

(declare-fun e!663099 () Bool)

(assert (=> b!1166590 (= e!663099 (not e!663092))))

(declare-fun res!773837 () Bool)

(assert (=> b!1166590 (=> res!773837 e!663092)))

(assert (=> b!1166590 (= res!773837 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166590 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!525165 () Unit!38325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75314 (_ BitVec 64) (_ BitVec 32)) Unit!38325)

(assert (=> b!1166590 (= lt!525165 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166591 () Bool)

(declare-fun res!773836 () Bool)

(assert (=> b!1166591 (=> (not res!773836) (not e!663099))))

(assert (=> b!1166591 (= res!773836 (arrayNoDuplicates!0 lt!525164 #b00000000000000000000000000000000 Nil!25550))))

(declare-fun res!773833 () Bool)

(assert (=> start!99140 (=> (not res!773833) (not e!663095))))

(assert (=> start!99140 (= res!773833 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36846 _keys!1208))))))

(assert (=> start!99140 e!663095))

(assert (=> start!99140 tp_is_empty!29281))

(declare-fun array_inv!27864 (array!75314) Bool)

(assert (=> start!99140 (array_inv!27864 _keys!1208)))

(assert (=> start!99140 true))

(assert (=> start!99140 tp!86963))

(declare-fun array_inv!27865 (array!75316) Bool)

(assert (=> start!99140 (and (array_inv!27865 _values!996) e!663098)))

(declare-fun b!1166582 () Bool)

(assert (=> b!1166582 (= e!663095 e!663099)))

(declare-fun res!773829 () Bool)

(assert (=> b!1166582 (=> (not res!773829) (not e!663099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75314 (_ BitVec 32)) Bool)

(assert (=> b!1166582 (= res!773829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525164 mask!1564))))

(assert (=> b!1166582 (= lt!525164 (array!75315 (store (arr!36308 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36846 _keys!1208)))))

(declare-fun mapIsEmpty!45746 () Bool)

(assert (=> mapIsEmpty!45746 mapRes!45746))

(declare-fun b!1166592 () Bool)

(declare-fun res!773826 () Bool)

(assert (=> b!1166592 (=> (not res!773826) (not e!663095))))

(assert (=> b!1166592 (= res!773826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99140 res!773833) b!1166585))

(assert (= (and b!1166585 res!773827) b!1166578))

(assert (= (and b!1166578 res!773835) b!1166592))

(assert (= (and b!1166592 res!773826) b!1166579))

(assert (= (and b!1166579 res!773830) b!1166586))

(assert (= (and b!1166586 res!773834) b!1166588))

(assert (= (and b!1166588 res!773828) b!1166581))

(assert (= (and b!1166581 res!773831) b!1166582))

(assert (= (and b!1166582 res!773829) b!1166591))

(assert (= (and b!1166591 res!773836) b!1166590))

(assert (= (and b!1166590 (not res!773837)) b!1166589))

(assert (= (and b!1166589 (not res!773832)) b!1166583))

(assert (= (and b!1166580 condMapEmpty!45746) mapIsEmpty!45746))

(assert (= (and b!1166580 (not condMapEmpty!45746)) mapNonEmpty!45746))

(get-info :version)

(assert (= (and mapNonEmpty!45746 ((_ is ValueCellFull!13931) mapValue!45746)) b!1166587))

(assert (= (and b!1166580 ((_ is ValueCellFull!13931) mapDefault!45746)) b!1166584))

(assert (= start!99140 b!1166580))

(declare-fun b_lambda!19839 () Bool)

(assert (=> (not b_lambda!19839) (not b!1166589)))

(declare-fun t!37286 () Bool)

(declare-fun tb!9555 () Bool)

(assert (=> (and start!99140 (= defaultEntry!1004 defaultEntry!1004) t!37286) tb!9555))

(declare-fun result!19683 () Bool)

(assert (=> tb!9555 (= result!19683 tp_is_empty!29281)))

(assert (=> b!1166589 t!37286))

(declare-fun b_and!40331 () Bool)

(assert (= b_and!40329 (and (=> t!37286 result!19683) b_and!40331)))

(declare-fun m!1074103 () Bool)

(assert (=> b!1166590 m!1074103))

(declare-fun m!1074105 () Bool)

(assert (=> b!1166590 m!1074105))

(declare-fun m!1074107 () Bool)

(assert (=> b!1166589 m!1074107))

(declare-fun m!1074109 () Bool)

(assert (=> b!1166589 m!1074109))

(declare-fun m!1074111 () Bool)

(assert (=> b!1166589 m!1074111))

(declare-fun m!1074113 () Bool)

(assert (=> b!1166589 m!1074113))

(declare-fun m!1074115 () Bool)

(assert (=> b!1166582 m!1074115))

(declare-fun m!1074117 () Bool)

(assert (=> b!1166582 m!1074117))

(declare-fun m!1074119 () Bool)

(assert (=> b!1166579 m!1074119))

(declare-fun m!1074121 () Bool)

(assert (=> b!1166581 m!1074121))

(declare-fun m!1074123 () Bool)

(assert (=> b!1166585 m!1074123))

(declare-fun m!1074125 () Bool)

(assert (=> b!1166592 m!1074125))

(declare-fun m!1074127 () Bool)

(assert (=> b!1166591 m!1074127))

(declare-fun m!1074129 () Bool)

(assert (=> b!1166583 m!1074129))

(declare-fun m!1074131 () Bool)

(assert (=> b!1166583 m!1074131))

(assert (=> b!1166583 m!1074131))

(declare-fun m!1074133 () Bool)

(assert (=> b!1166583 m!1074133))

(declare-fun m!1074135 () Bool)

(assert (=> b!1166583 m!1074135))

(declare-fun m!1074137 () Bool)

(assert (=> mapNonEmpty!45746 m!1074137))

(declare-fun m!1074139 () Bool)

(assert (=> b!1166588 m!1074139))

(declare-fun m!1074141 () Bool)

(assert (=> start!99140 m!1074141))

(declare-fun m!1074143 () Bool)

(assert (=> start!99140 m!1074143))

(check-sat (not start!99140) (not b!1166583) (not b!1166579) (not b!1166585) (not b!1166582) (not b!1166591) (not b_next!24751) tp_is_empty!29281 (not b!1166590) (not b!1166592) (not b!1166589) (not mapNonEmpty!45746) (not b_lambda!19839) b_and!40331 (not b!1166588))
(check-sat b_and!40331 (not b_next!24751))
