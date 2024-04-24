; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96668 () Bool)

(assert start!96668)

(declare-fun b_free!23011 () Bool)

(declare-fun b_next!23011 () Bool)

(assert (=> start!96668 (= b_free!23011 (not b_next!23011))))

(declare-fun tp!80960 () Bool)

(declare-fun b_and!36695 () Bool)

(assert (=> start!96668 (= tp!80960 b_and!36695)))

(declare-fun b!1097621 () Bool)

(declare-fun res!732194 () Bool)

(declare-fun e!626646 () Bool)

(assert (=> b!1097621 (=> (not res!732194) (not e!626646))))

(declare-datatypes ((array!71063 0))(
  ( (array!71064 (arr!34197 (Array (_ BitVec 32) (_ BitVec 64))) (size!34734 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71063)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71063 (_ BitVec 32)) Bool)

(assert (=> b!1097621 (= res!732194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097622 () Bool)

(declare-fun e!626647 () Bool)

(declare-fun tp_is_empty!27061 () Bool)

(assert (=> b!1097622 (= e!626647 tp_is_empty!27061)))

(declare-fun b!1097623 () Bool)

(declare-fun e!626649 () Bool)

(assert (=> b!1097623 (= e!626646 e!626649)))

(declare-fun res!732195 () Bool)

(assert (=> b!1097623 (=> (not res!732195) (not e!626649))))

(declare-fun lt!490617 () array!71063)

(assert (=> b!1097623 (= res!732195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490617 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097623 (= lt!490617 (array!71064 (store (arr!34197 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34734 _keys!1070)))))

(declare-fun b!1097624 () Bool)

(declare-fun res!732190 () Bool)

(assert (=> b!1097624 (=> (not res!732190) (not e!626649))))

(declare-datatypes ((List!23885 0))(
  ( (Nil!23882) (Cons!23881 (h!25099 (_ BitVec 64)) (t!33934 List!23885)) )
))
(declare-fun arrayNoDuplicates!0 (array!71063 (_ BitVec 32) List!23885) Bool)

(assert (=> b!1097624 (= res!732190 (arrayNoDuplicates!0 lt!490617 #b00000000000000000000000000000000 Nil!23882))))

(declare-fun b!1097625 () Bool)

(declare-fun res!732193 () Bool)

(assert (=> b!1097625 (=> (not res!732193) (not e!626646))))

(assert (=> b!1097625 (= res!732193 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34734 _keys!1070))))))

(declare-fun b!1097626 () Bool)

(assert (=> b!1097626 (= e!626649 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41209 0))(
  ( (V!41210 (val!13587 Int)) )
))
(declare-datatypes ((ValueCell!12821 0))(
  ( (ValueCellFull!12821 (v!16204 V!41209)) (EmptyCell!12821) )
))
(declare-datatypes ((array!71065 0))(
  ( (array!71066 (arr!34198 (Array (_ BitVec 32) ValueCell!12821)) (size!34735 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71065)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17262 0))(
  ( (tuple2!17263 (_1!8642 (_ BitVec 64)) (_2!8642 V!41209)) )
))
(declare-datatypes ((List!23886 0))(
  ( (Nil!23883) (Cons!23882 (h!25100 tuple2!17262) (t!33935 List!23886)) )
))
(declare-datatypes ((ListLongMap!15239 0))(
  ( (ListLongMap!15240 (toList!7635 List!23886)) )
))
(declare-fun lt!490620 () ListLongMap!15239)

(declare-fun zeroValue!831 () V!41209)

(declare-fun minValue!831 () V!41209)

(declare-fun getCurrentListMapNoExtraKeys!4188 (array!71063 array!71065 (_ BitVec 32) (_ BitVec 32) V!41209 V!41209 (_ BitVec 32) Int) ListLongMap!15239)

(declare-fun dynLambda!2306 (Int (_ BitVec 64)) V!41209)

(assert (=> b!1097626 (= lt!490620 (getCurrentListMapNoExtraKeys!4188 lt!490617 (array!71066 (store (arr!34198 _values!874) i!650 (ValueCellFull!12821 (dynLambda!2306 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34735 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490619 () ListLongMap!15239)

(assert (=> b!1097626 (= lt!490619 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097626 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36057 0))(
  ( (Unit!36058) )
))
(declare-fun lt!490618 () Unit!36057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71063 (_ BitVec 64) (_ BitVec 32)) Unit!36057)

(assert (=> b!1097626 (= lt!490618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097627 () Bool)

(declare-fun res!732191 () Bool)

(assert (=> b!1097627 (=> (not res!732191) (not e!626646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097627 (= res!732191 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42352 () Bool)

(declare-fun mapRes!42352 () Bool)

(assert (=> mapIsEmpty!42352 mapRes!42352))

(declare-fun res!732196 () Bool)

(assert (=> start!96668 (=> (not res!732196) (not e!626646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96668 (= res!732196 (validMask!0 mask!1414))))

(assert (=> start!96668 e!626646))

(assert (=> start!96668 tp!80960))

(assert (=> start!96668 true))

(assert (=> start!96668 tp_is_empty!27061))

(declare-fun array_inv!26382 (array!71063) Bool)

(assert (=> start!96668 (array_inv!26382 _keys!1070)))

(declare-fun e!626645 () Bool)

(declare-fun array_inv!26383 (array!71065) Bool)

(assert (=> start!96668 (and (array_inv!26383 _values!874) e!626645)))

(declare-fun b!1097628 () Bool)

(declare-fun e!626650 () Bool)

(assert (=> b!1097628 (= e!626645 (and e!626650 mapRes!42352))))

(declare-fun condMapEmpty!42352 () Bool)

(declare-fun mapDefault!42352 () ValueCell!12821)

(assert (=> b!1097628 (= condMapEmpty!42352 (= (arr!34198 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12821)) mapDefault!42352)))))

(declare-fun b!1097629 () Bool)

(declare-fun res!732192 () Bool)

(assert (=> b!1097629 (=> (not res!732192) (not e!626646))))

(assert (=> b!1097629 (= res!732192 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23882))))

(declare-fun b!1097630 () Bool)

(declare-fun res!732188 () Bool)

(assert (=> b!1097630 (=> (not res!732188) (not e!626646))))

(assert (=> b!1097630 (= res!732188 (and (= (size!34735 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34734 _keys!1070) (size!34735 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42352 () Bool)

(declare-fun tp!80959 () Bool)

(assert (=> mapNonEmpty!42352 (= mapRes!42352 (and tp!80959 e!626647))))

(declare-fun mapRest!42352 () (Array (_ BitVec 32) ValueCell!12821))

(declare-fun mapKey!42352 () (_ BitVec 32))

(declare-fun mapValue!42352 () ValueCell!12821)

(assert (=> mapNonEmpty!42352 (= (arr!34198 _values!874) (store mapRest!42352 mapKey!42352 mapValue!42352))))

(declare-fun b!1097631 () Bool)

(assert (=> b!1097631 (= e!626650 tp_is_empty!27061)))

(declare-fun b!1097632 () Bool)

(declare-fun res!732189 () Bool)

(assert (=> b!1097632 (=> (not res!732189) (not e!626646))))

(assert (=> b!1097632 (= res!732189 (= (select (arr!34197 _keys!1070) i!650) k0!904))))

(assert (= (and start!96668 res!732196) b!1097630))

(assert (= (and b!1097630 res!732188) b!1097621))

(assert (= (and b!1097621 res!732194) b!1097629))

(assert (= (and b!1097629 res!732192) b!1097625))

(assert (= (and b!1097625 res!732193) b!1097627))

(assert (= (and b!1097627 res!732191) b!1097632))

(assert (= (and b!1097632 res!732189) b!1097623))

(assert (= (and b!1097623 res!732195) b!1097624))

(assert (= (and b!1097624 res!732190) b!1097626))

(assert (= (and b!1097628 condMapEmpty!42352) mapIsEmpty!42352))

(assert (= (and b!1097628 (not condMapEmpty!42352)) mapNonEmpty!42352))

(get-info :version)

(assert (= (and mapNonEmpty!42352 ((_ is ValueCellFull!12821) mapValue!42352)) b!1097622))

(assert (= (and b!1097628 ((_ is ValueCellFull!12821) mapDefault!42352)) b!1097631))

(assert (= start!96668 b!1097628))

(declare-fun b_lambda!17679 () Bool)

(assert (=> (not b_lambda!17679) (not b!1097626)))

(declare-fun t!33933 () Bool)

(declare-fun tb!7869 () Bool)

(assert (=> (and start!96668 (= defaultEntry!882 defaultEntry!882) t!33933) tb!7869))

(declare-fun result!16269 () Bool)

(assert (=> tb!7869 (= result!16269 tp_is_empty!27061)))

(assert (=> b!1097626 t!33933))

(declare-fun b_and!36697 () Bool)

(assert (= b_and!36695 (and (=> t!33933 result!16269) b_and!36697)))

(declare-fun m!1017513 () Bool)

(assert (=> b!1097632 m!1017513))

(declare-fun m!1017515 () Bool)

(assert (=> b!1097627 m!1017515))

(declare-fun m!1017517 () Bool)

(assert (=> b!1097626 m!1017517))

(declare-fun m!1017519 () Bool)

(assert (=> b!1097626 m!1017519))

(declare-fun m!1017521 () Bool)

(assert (=> b!1097626 m!1017521))

(declare-fun m!1017523 () Bool)

(assert (=> b!1097626 m!1017523))

(declare-fun m!1017525 () Bool)

(assert (=> b!1097626 m!1017525))

(declare-fun m!1017527 () Bool)

(assert (=> b!1097626 m!1017527))

(declare-fun m!1017529 () Bool)

(assert (=> b!1097629 m!1017529))

(declare-fun m!1017531 () Bool)

(assert (=> mapNonEmpty!42352 m!1017531))

(declare-fun m!1017533 () Bool)

(assert (=> b!1097623 m!1017533))

(declare-fun m!1017535 () Bool)

(assert (=> b!1097623 m!1017535))

(declare-fun m!1017537 () Bool)

(assert (=> start!96668 m!1017537))

(declare-fun m!1017539 () Bool)

(assert (=> start!96668 m!1017539))

(declare-fun m!1017541 () Bool)

(assert (=> start!96668 m!1017541))

(declare-fun m!1017543 () Bool)

(assert (=> b!1097624 m!1017543))

(declare-fun m!1017545 () Bool)

(assert (=> b!1097621 m!1017545))

(check-sat (not b!1097621) (not b!1097624) b_and!36697 (not b!1097623) (not b!1097626) (not start!96668) (not b_lambda!17679) tp_is_empty!27061 (not b!1097629) (not b_next!23011) (not mapNonEmpty!42352) (not b!1097627))
(check-sat b_and!36697 (not b_next!23011))
