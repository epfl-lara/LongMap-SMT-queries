; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99292 () Bool)

(assert start!99292)

(declare-fun b_free!24661 () Bool)

(declare-fun b_next!24661 () Bool)

(assert (=> start!99292 (= b_free!24661 (not b_next!24661))))

(declare-fun tp!86693 () Bool)

(declare-fun b_and!40173 () Bool)

(assert (=> start!99292 (= tp!86693 b_and!40173)))

(declare-fun b!1165955 () Bool)

(declare-fun res!772860 () Bool)

(declare-fun e!663006 () Bool)

(assert (=> b!1165955 (=> (not res!772860) (not e!663006))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165955 (= res!772860 (validMask!0 mask!1564))))

(declare-fun b!1165956 () Bool)

(declare-fun e!663005 () Bool)

(declare-fun e!663001 () Bool)

(declare-fun mapRes!45611 () Bool)

(assert (=> b!1165956 (= e!663005 (and e!663001 mapRes!45611))))

(declare-fun condMapEmpty!45611 () Bool)

(declare-datatypes ((V!44049 0))(
  ( (V!44050 (val!14652 Int)) )
))
(declare-datatypes ((ValueCell!13886 0))(
  ( (ValueCellFull!13886 (v!17285 V!44049)) (EmptyCell!13886) )
))
(declare-datatypes ((array!75267 0))(
  ( (array!75268 (arr!36278 (Array (_ BitVec 32) ValueCell!13886)) (size!36815 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75267)

(declare-fun mapDefault!45611 () ValueCell!13886)

(assert (=> b!1165956 (= condMapEmpty!45611 (= (arr!36278 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13886)) mapDefault!45611)))))

(declare-fun b!1165957 () Bool)

(declare-fun res!772866 () Bool)

(assert (=> b!1165957 (=> (not res!772866) (not e!663006))))

(declare-datatypes ((array!75269 0))(
  ( (array!75270 (arr!36279 (Array (_ BitVec 32) (_ BitVec 64))) (size!36816 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75269)

(declare-datatypes ((List!25454 0))(
  ( (Nil!25451) (Cons!25450 (h!26668 (_ BitVec 64)) (t!37099 List!25454)) )
))
(declare-fun arrayNoDuplicates!0 (array!75269 (_ BitVec 32) List!25454) Bool)

(assert (=> b!1165957 (= res!772866 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25451))))

(declare-fun b!1165958 () Bool)

(declare-fun res!772862 () Bool)

(assert (=> b!1165958 (=> (not res!772862) (not e!663006))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1165958 (= res!772862 (= (select (arr!36279 _keys!1208) i!673) k0!934))))

(declare-fun b!1165959 () Bool)

(declare-fun e!663002 () Bool)

(declare-fun tp_is_empty!29191 () Bool)

(assert (=> b!1165959 (= e!663002 tp_is_empty!29191)))

(declare-fun mapNonEmpty!45611 () Bool)

(declare-fun tp!86694 () Bool)

(assert (=> mapNonEmpty!45611 (= mapRes!45611 (and tp!86694 e!663002))))

(declare-fun mapRest!45611 () (Array (_ BitVec 32) ValueCell!13886))

(declare-fun mapValue!45611 () ValueCell!13886)

(declare-fun mapKey!45611 () (_ BitVec 32))

(assert (=> mapNonEmpty!45611 (= (arr!36278 _values!996) (store mapRest!45611 mapKey!45611 mapValue!45611))))

(declare-fun b!1165960 () Bool)

(declare-fun e!663007 () Bool)

(assert (=> b!1165960 (= e!663007 true)))

(declare-fun zeroValue!944 () V!44049)

(declare-fun lt!525186 () array!75269)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18716 0))(
  ( (tuple2!18717 (_1!9369 (_ BitVec 64)) (_2!9369 V!44049)) )
))
(declare-datatypes ((List!25455 0))(
  ( (Nil!25452) (Cons!25451 (h!26669 tuple2!18716) (t!37100 List!25455)) )
))
(declare-datatypes ((ListLongMap!16693 0))(
  ( (ListLongMap!16694 (toList!8362 List!25455)) )
))
(declare-fun lt!525185 () ListLongMap!16693)

(declare-fun minValue!944 () V!44049)

(declare-fun getCurrentListMapNoExtraKeys!4853 (array!75269 array!75267 (_ BitVec 32) (_ BitVec 32) V!44049 V!44049 (_ BitVec 32) Int) ListLongMap!16693)

(declare-fun dynLambda!2842 (Int (_ BitVec 64)) V!44049)

(assert (=> b!1165960 (= lt!525185 (getCurrentListMapNoExtraKeys!4853 lt!525186 (array!75268 (store (arr!36278 _values!996) i!673 (ValueCellFull!13886 (dynLambda!2842 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36815 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525184 () ListLongMap!16693)

(assert (=> b!1165960 (= lt!525184 (getCurrentListMapNoExtraKeys!4853 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165961 () Bool)

(declare-fun res!772869 () Bool)

(declare-fun e!663004 () Bool)

(assert (=> b!1165961 (=> (not res!772869) (not e!663004))))

(assert (=> b!1165961 (= res!772869 (arrayNoDuplicates!0 lt!525186 #b00000000000000000000000000000000 Nil!25451))))

(declare-fun b!1165962 () Bool)

(assert (=> b!1165962 (= e!663006 e!663004)))

(declare-fun res!772867 () Bool)

(assert (=> b!1165962 (=> (not res!772867) (not e!663004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75269 (_ BitVec 32)) Bool)

(assert (=> b!1165962 (= res!772867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525186 mask!1564))))

(assert (=> b!1165962 (= lt!525186 (array!75270 (store (arr!36279 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36816 _keys!1208)))))

(declare-fun b!1165963 () Bool)

(declare-fun res!772864 () Bool)

(assert (=> b!1165963 (=> (not res!772864) (not e!663006))))

(assert (=> b!1165963 (= res!772864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165964 () Bool)

(declare-fun res!772859 () Bool)

(assert (=> b!1165964 (=> (not res!772859) (not e!663006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165964 (= res!772859 (validKeyInArray!0 k0!934))))

(declare-fun b!1165965 () Bool)

(declare-fun res!772863 () Bool)

(assert (=> b!1165965 (=> (not res!772863) (not e!663006))))

(assert (=> b!1165965 (= res!772863 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36816 _keys!1208))))))

(declare-fun res!772861 () Bool)

(assert (=> start!99292 (=> (not res!772861) (not e!663006))))

(assert (=> start!99292 (= res!772861 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36816 _keys!1208))))))

(assert (=> start!99292 e!663006))

(assert (=> start!99292 tp_is_empty!29191))

(declare-fun array_inv!27822 (array!75269) Bool)

(assert (=> start!99292 (array_inv!27822 _keys!1208)))

(assert (=> start!99292 true))

(assert (=> start!99292 tp!86693))

(declare-fun array_inv!27823 (array!75267) Bool)

(assert (=> start!99292 (and (array_inv!27823 _values!996) e!663005)))

(declare-fun b!1165966 () Bool)

(assert (=> b!1165966 (= e!663001 tp_is_empty!29191)))

(declare-fun mapIsEmpty!45611 () Bool)

(assert (=> mapIsEmpty!45611 mapRes!45611))

(declare-fun b!1165967 () Bool)

(assert (=> b!1165967 (= e!663004 (not e!663007))))

(declare-fun res!772865 () Bool)

(assert (=> b!1165967 (=> res!772865 e!663007)))

(assert (=> b!1165967 (= res!772865 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165967 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38427 0))(
  ( (Unit!38428) )
))
(declare-fun lt!525187 () Unit!38427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75269 (_ BitVec 64) (_ BitVec 32)) Unit!38427)

(assert (=> b!1165967 (= lt!525187 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165968 () Bool)

(declare-fun res!772868 () Bool)

(assert (=> b!1165968 (=> (not res!772868) (not e!663006))))

(assert (=> b!1165968 (= res!772868 (and (= (size!36815 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36816 _keys!1208) (size!36815 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99292 res!772861) b!1165955))

(assert (= (and b!1165955 res!772860) b!1165968))

(assert (= (and b!1165968 res!772868) b!1165963))

(assert (= (and b!1165963 res!772864) b!1165957))

(assert (= (and b!1165957 res!772866) b!1165965))

(assert (= (and b!1165965 res!772863) b!1165964))

(assert (= (and b!1165964 res!772859) b!1165958))

(assert (= (and b!1165958 res!772862) b!1165962))

(assert (= (and b!1165962 res!772867) b!1165961))

(assert (= (and b!1165961 res!772869) b!1165967))

(assert (= (and b!1165967 (not res!772865)) b!1165960))

(assert (= (and b!1165956 condMapEmpty!45611) mapIsEmpty!45611))

(assert (= (and b!1165956 (not condMapEmpty!45611)) mapNonEmpty!45611))

(get-info :version)

(assert (= (and mapNonEmpty!45611 ((_ is ValueCellFull!13886) mapValue!45611)) b!1165959))

(assert (= (and b!1165956 ((_ is ValueCellFull!13886) mapDefault!45611)) b!1165966))

(assert (= start!99292 b!1165956))

(declare-fun b_lambda!19761 () Bool)

(assert (=> (not b_lambda!19761) (not b!1165960)))

(declare-fun t!37098 () Bool)

(declare-fun tb!9465 () Bool)

(assert (=> (and start!99292 (= defaultEntry!1004 defaultEntry!1004) t!37098) tb!9465))

(declare-fun result!19503 () Bool)

(assert (=> tb!9465 (= result!19503 tp_is_empty!29191)))

(assert (=> b!1165960 t!37098))

(declare-fun b_and!40175 () Bool)

(assert (= b_and!40173 (and (=> t!37098 result!19503) b_and!40175)))

(declare-fun m!1074611 () Bool)

(assert (=> b!1165963 m!1074611))

(declare-fun m!1074613 () Bool)

(assert (=> b!1165964 m!1074613))

(declare-fun m!1074615 () Bool)

(assert (=> b!1165962 m!1074615))

(declare-fun m!1074617 () Bool)

(assert (=> b!1165962 m!1074617))

(declare-fun m!1074619 () Bool)

(assert (=> b!1165957 m!1074619))

(declare-fun m!1074621 () Bool)

(assert (=> start!99292 m!1074621))

(declare-fun m!1074623 () Bool)

(assert (=> start!99292 m!1074623))

(declare-fun m!1074625 () Bool)

(assert (=> b!1165961 m!1074625))

(declare-fun m!1074627 () Bool)

(assert (=> b!1165955 m!1074627))

(declare-fun m!1074629 () Bool)

(assert (=> b!1165967 m!1074629))

(declare-fun m!1074631 () Bool)

(assert (=> b!1165967 m!1074631))

(declare-fun m!1074633 () Bool)

(assert (=> mapNonEmpty!45611 m!1074633))

(declare-fun m!1074635 () Bool)

(assert (=> b!1165960 m!1074635))

(declare-fun m!1074637 () Bool)

(assert (=> b!1165960 m!1074637))

(declare-fun m!1074639 () Bool)

(assert (=> b!1165960 m!1074639))

(declare-fun m!1074641 () Bool)

(assert (=> b!1165960 m!1074641))

(declare-fun m!1074643 () Bool)

(assert (=> b!1165958 m!1074643))

(check-sat (not b!1165960) (not b_lambda!19761) tp_is_empty!29191 (not b!1165964) (not b_next!24661) (not b!1165961) (not b!1165962) (not b!1165967) (not b!1165955) b_and!40175 (not start!99292) (not mapNonEmpty!45611) (not b!1165957) (not b!1165963))
(check-sat b_and!40175 (not b_next!24661))
