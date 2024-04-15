; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96390 () Bool)

(assert start!96390)

(declare-fun b_free!22975 () Bool)

(declare-fun b_next!22975 () Bool)

(assert (=> start!96390 (= b_free!22975 (not b_next!22975))))

(declare-fun tp!80851 () Bool)

(declare-fun b_and!36587 () Bool)

(assert (=> start!96390 (= tp!80851 b_and!36587)))

(declare-fun b!1095457 () Bool)

(declare-fun res!731117 () Bool)

(declare-fun e!625373 () Bool)

(assert (=> b!1095457 (=> (not res!731117) (not e!625373))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095457 (= res!731117 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42298 () Bool)

(declare-fun mapRes!42298 () Bool)

(assert (=> mapIsEmpty!42298 mapRes!42298))

(declare-fun b!1095458 () Bool)

(declare-fun res!731113 () Bool)

(assert (=> b!1095458 (=> (not res!731113) (not e!625373))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70876 0))(
  ( (array!70877 (arr!34110 (Array (_ BitVec 32) (_ BitVec 64))) (size!34648 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70876)

(assert (=> b!1095458 (= res!731113 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34648 _keys!1070))))))

(declare-fun b!1095459 () Bool)

(declare-fun e!625374 () Bool)

(assert (=> b!1095459 (= e!625373 e!625374)))

(declare-fun res!731111 () Bool)

(assert (=> b!1095459 (=> (not res!731111) (not e!625374))))

(declare-fun lt!489686 () array!70876)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70876 (_ BitVec 32)) Bool)

(assert (=> b!1095459 (= res!731111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489686 mask!1414))))

(assert (=> b!1095459 (= lt!489686 (array!70877 (store (arr!34110 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34648 _keys!1070)))))

(declare-fun b!1095460 () Bool)

(declare-fun e!625378 () Bool)

(declare-fun tp_is_empty!27025 () Bool)

(assert (=> b!1095460 (= e!625378 tp_is_empty!27025)))

(declare-fun b!1095461 () Bool)

(declare-fun res!731118 () Bool)

(assert (=> b!1095461 (=> (not res!731118) (not e!625374))))

(declare-datatypes ((List!23882 0))(
  ( (Nil!23879) (Cons!23878 (h!25087 (_ BitVec 64)) (t!33894 List!23882)) )
))
(declare-fun arrayNoDuplicates!0 (array!70876 (_ BitVec 32) List!23882) Bool)

(assert (=> b!1095461 (= res!731118 (arrayNoDuplicates!0 lt!489686 #b00000000000000000000000000000000 Nil!23879))))

(declare-fun b!1095462 () Bool)

(declare-fun e!625377 () Bool)

(assert (=> b!1095462 (= e!625377 tp_is_empty!27025)))

(declare-fun b!1095464 () Bool)

(declare-fun res!731119 () Bool)

(assert (=> b!1095464 (=> (not res!731119) (not e!625373))))

(assert (=> b!1095464 (= res!731119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095465 () Bool)

(declare-fun res!731112 () Bool)

(assert (=> b!1095465 (=> (not res!731112) (not e!625373))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41161 0))(
  ( (V!41162 (val!13569 Int)) )
))
(declare-datatypes ((ValueCell!12803 0))(
  ( (ValueCellFull!12803 (v!16189 V!41161)) (EmptyCell!12803) )
))
(declare-datatypes ((array!70878 0))(
  ( (array!70879 (arr!34111 (Array (_ BitVec 32) ValueCell!12803)) (size!34649 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70878)

(assert (=> b!1095465 (= res!731112 (and (= (size!34649 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34648 _keys!1070) (size!34649 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095466 () Bool)

(declare-fun e!625375 () Bool)

(assert (=> b!1095466 (= e!625375 (and e!625377 mapRes!42298))))

(declare-fun condMapEmpty!42298 () Bool)

(declare-fun mapDefault!42298 () ValueCell!12803)

(assert (=> b!1095466 (= condMapEmpty!42298 (= (arr!34111 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12803)) mapDefault!42298)))))

(declare-fun b!1095467 () Bool)

(declare-fun res!731114 () Bool)

(assert (=> b!1095467 (=> (not res!731114) (not e!625373))))

(assert (=> b!1095467 (= res!731114 (= (select (arr!34110 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42298 () Bool)

(declare-fun tp!80852 () Bool)

(assert (=> mapNonEmpty!42298 (= mapRes!42298 (and tp!80852 e!625378))))

(declare-fun mapRest!42298 () (Array (_ BitVec 32) ValueCell!12803))

(declare-fun mapKey!42298 () (_ BitVec 32))

(declare-fun mapValue!42298 () ValueCell!12803)

(assert (=> mapNonEmpty!42298 (= (arr!34111 _values!874) (store mapRest!42298 mapKey!42298 mapValue!42298))))

(declare-fun b!1095468 () Bool)

(assert (=> b!1095468 (= e!625374 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41161)

(declare-datatypes ((tuple2!17288 0))(
  ( (tuple2!17289 (_1!8655 (_ BitVec 64)) (_2!8655 V!41161)) )
))
(declare-datatypes ((List!23883 0))(
  ( (Nil!23880) (Cons!23879 (h!25088 tuple2!17288) (t!33895 List!23883)) )
))
(declare-datatypes ((ListLongMap!15257 0))(
  ( (ListLongMap!15258 (toList!7644 List!23883)) )
))
(declare-fun lt!489687 () ListLongMap!15257)

(declare-fun zeroValue!831 () V!41161)

(declare-fun getCurrentListMapNoExtraKeys!4177 (array!70876 array!70878 (_ BitVec 32) (_ BitVec 32) V!41161 V!41161 (_ BitVec 32) Int) ListLongMap!15257)

(declare-fun dynLambda!2246 (Int (_ BitVec 64)) V!41161)

(assert (=> b!1095468 (= lt!489687 (getCurrentListMapNoExtraKeys!4177 lt!489686 (array!70879 (store (arr!34111 _values!874) i!650 (ValueCellFull!12803 (dynLambda!2246 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34649 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489688 () ListLongMap!15257)

(assert (=> b!1095468 (= lt!489688 (getCurrentListMapNoExtraKeys!4177 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095468 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35875 0))(
  ( (Unit!35876) )
))
(declare-fun lt!489689 () Unit!35875)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70876 (_ BitVec 64) (_ BitVec 32)) Unit!35875)

(assert (=> b!1095468 (= lt!489689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095463 () Bool)

(declare-fun res!731116 () Bool)

(assert (=> b!1095463 (=> (not res!731116) (not e!625373))))

(assert (=> b!1095463 (= res!731116 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23879))))

(declare-fun res!731115 () Bool)

(assert (=> start!96390 (=> (not res!731115) (not e!625373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96390 (= res!731115 (validMask!0 mask!1414))))

(assert (=> start!96390 e!625373))

(assert (=> start!96390 tp!80851))

(assert (=> start!96390 true))

(assert (=> start!96390 tp_is_empty!27025))

(declare-fun array_inv!26322 (array!70876) Bool)

(assert (=> start!96390 (array_inv!26322 _keys!1070)))

(declare-fun array_inv!26323 (array!70878) Bool)

(assert (=> start!96390 (and (array_inv!26323 _values!874) e!625375)))

(assert (= (and start!96390 res!731115) b!1095465))

(assert (= (and b!1095465 res!731112) b!1095464))

(assert (= (and b!1095464 res!731119) b!1095463))

(assert (= (and b!1095463 res!731116) b!1095458))

(assert (= (and b!1095458 res!731113) b!1095457))

(assert (= (and b!1095457 res!731117) b!1095467))

(assert (= (and b!1095467 res!731114) b!1095459))

(assert (= (and b!1095459 res!731111) b!1095461))

(assert (= (and b!1095461 res!731118) b!1095468))

(assert (= (and b!1095466 condMapEmpty!42298) mapIsEmpty!42298))

(assert (= (and b!1095466 (not condMapEmpty!42298)) mapNonEmpty!42298))

(get-info :version)

(assert (= (and mapNonEmpty!42298 ((_ is ValueCellFull!12803) mapValue!42298)) b!1095460))

(assert (= (and b!1095466 ((_ is ValueCellFull!12803) mapDefault!42298)) b!1095462))

(assert (= start!96390 b!1095466))

(declare-fun b_lambda!17611 () Bool)

(assert (=> (not b_lambda!17611) (not b!1095468)))

(declare-fun t!33893 () Bool)

(declare-fun tb!7833 () Bool)

(assert (=> (and start!96390 (= defaultEntry!882 defaultEntry!882) t!33893) tb!7833))

(declare-fun result!16197 () Bool)

(assert (=> tb!7833 (= result!16197 tp_is_empty!27025)))

(assert (=> b!1095468 t!33893))

(declare-fun b_and!36589 () Bool)

(assert (= b_and!36587 (and (=> t!33893 result!16197) b_and!36589)))

(declare-fun m!1014603 () Bool)

(assert (=> b!1095464 m!1014603))

(declare-fun m!1014605 () Bool)

(assert (=> start!96390 m!1014605))

(declare-fun m!1014607 () Bool)

(assert (=> start!96390 m!1014607))

(declare-fun m!1014609 () Bool)

(assert (=> start!96390 m!1014609))

(declare-fun m!1014611 () Bool)

(assert (=> b!1095461 m!1014611))

(declare-fun m!1014613 () Bool)

(assert (=> b!1095463 m!1014613))

(declare-fun m!1014615 () Bool)

(assert (=> b!1095468 m!1014615))

(declare-fun m!1014617 () Bool)

(assert (=> b!1095468 m!1014617))

(declare-fun m!1014619 () Bool)

(assert (=> b!1095468 m!1014619))

(declare-fun m!1014621 () Bool)

(assert (=> b!1095468 m!1014621))

(declare-fun m!1014623 () Bool)

(assert (=> b!1095468 m!1014623))

(declare-fun m!1014625 () Bool)

(assert (=> b!1095468 m!1014625))

(declare-fun m!1014627 () Bool)

(assert (=> b!1095459 m!1014627))

(declare-fun m!1014629 () Bool)

(assert (=> b!1095459 m!1014629))

(declare-fun m!1014631 () Bool)

(assert (=> b!1095457 m!1014631))

(declare-fun m!1014633 () Bool)

(assert (=> mapNonEmpty!42298 m!1014633))

(declare-fun m!1014635 () Bool)

(assert (=> b!1095467 m!1014635))

(check-sat (not b!1095461) b_and!36589 (not b_lambda!17611) (not start!96390) (not b!1095457) (not b!1095463) (not mapNonEmpty!42298) (not b!1095459) (not b_next!22975) (not b!1095464) (not b!1095468) tp_is_empty!27025)
(check-sat b_and!36589 (not b_next!22975))
