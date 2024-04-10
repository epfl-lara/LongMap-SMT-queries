; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96440 () Bool)

(assert start!96440)

(declare-fun b_free!23019 () Bool)

(declare-fun b_next!23019 () Bool)

(assert (=> start!96440 (= b_free!23019 (not b_next!23019))))

(declare-fun tp!80983 () Bool)

(declare-fun b_and!36701 () Bool)

(assert (=> start!96440 (= tp!80983 b_and!36701)))

(declare-fun b!1096446 () Bool)

(declare-fun res!731775 () Bool)

(declare-fun e!625867 () Bool)

(assert (=> b!1096446 (=> (not res!731775) (not e!625867))))

(declare-datatypes ((array!71051 0))(
  ( (array!71052 (arr!34197 (Array (_ BitVec 32) (_ BitVec 64))) (size!34733 (_ BitVec 32))) )
))
(declare-fun lt!490150 () array!71051)

(declare-datatypes ((List!23882 0))(
  ( (Nil!23879) (Cons!23878 (h!25087 (_ BitVec 64)) (t!33947 List!23882)) )
))
(declare-fun arrayNoDuplicates!0 (array!71051 (_ BitVec 32) List!23882) Bool)

(assert (=> b!1096446 (= res!731775 (arrayNoDuplicates!0 lt!490150 #b00000000000000000000000000000000 Nil!23879))))

(declare-fun res!731774 () Bool)

(declare-fun e!625863 () Bool)

(assert (=> start!96440 (=> (not res!731774) (not e!625863))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96440 (= res!731774 (validMask!0 mask!1414))))

(assert (=> start!96440 e!625863))

(assert (=> start!96440 tp!80983))

(assert (=> start!96440 true))

(declare-fun tp_is_empty!27069 () Bool)

(assert (=> start!96440 tp_is_empty!27069))

(declare-fun _keys!1070 () array!71051)

(declare-fun array_inv!26350 (array!71051) Bool)

(assert (=> start!96440 (array_inv!26350 _keys!1070)))

(declare-datatypes ((V!41219 0))(
  ( (V!41220 (val!13591 Int)) )
))
(declare-datatypes ((ValueCell!12825 0))(
  ( (ValueCellFull!12825 (v!16212 V!41219)) (EmptyCell!12825) )
))
(declare-datatypes ((array!71053 0))(
  ( (array!71054 (arr!34198 (Array (_ BitVec 32) ValueCell!12825)) (size!34734 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71053)

(declare-fun e!625862 () Bool)

(declare-fun array_inv!26351 (array!71053) Bool)

(assert (=> start!96440 (and (array_inv!26351 _values!874) e!625862)))

(declare-fun b!1096447 () Bool)

(declare-fun e!625866 () Bool)

(assert (=> b!1096447 (= e!625866 tp_is_empty!27069)))

(declare-fun b!1096448 () Bool)

(declare-fun res!731779 () Bool)

(assert (=> b!1096448 (=> (not res!731779) (not e!625863))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096448 (= res!731779 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34733 _keys!1070))))))

(declare-fun b!1096449 () Bool)

(declare-fun e!625865 () Bool)

(assert (=> b!1096449 (= e!625865 tp_is_empty!27069)))

(declare-fun b!1096450 () Bool)

(declare-fun mapRes!42364 () Bool)

(assert (=> b!1096450 (= e!625862 (and e!625865 mapRes!42364))))

(declare-fun condMapEmpty!42364 () Bool)

(declare-fun mapDefault!42364 () ValueCell!12825)

(assert (=> b!1096450 (= condMapEmpty!42364 (= (arr!34198 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12825)) mapDefault!42364)))))

(declare-fun mapNonEmpty!42364 () Bool)

(declare-fun tp!80984 () Bool)

(assert (=> mapNonEmpty!42364 (= mapRes!42364 (and tp!80984 e!625866))))

(declare-fun mapValue!42364 () ValueCell!12825)

(declare-fun mapKey!42364 () (_ BitVec 32))

(declare-fun mapRest!42364 () (Array (_ BitVec 32) ValueCell!12825))

(assert (=> mapNonEmpty!42364 (= (arr!34198 _values!874) (store mapRest!42364 mapKey!42364 mapValue!42364))))

(declare-fun mapIsEmpty!42364 () Bool)

(assert (=> mapIsEmpty!42364 mapRes!42364))

(declare-fun b!1096451 () Bool)

(declare-fun res!731776 () Bool)

(assert (=> b!1096451 (=> (not res!731776) (not e!625863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71051 (_ BitVec 32)) Bool)

(assert (=> b!1096451 (= res!731776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096452 () Bool)

(declare-fun res!731781 () Bool)

(assert (=> b!1096452 (=> (not res!731781) (not e!625863))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096452 (= res!731781 (validKeyInArray!0 k0!904))))

(declare-fun b!1096453 () Bool)

(assert (=> b!1096453 (= e!625867 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41219)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17262 0))(
  ( (tuple2!17263 (_1!8642 (_ BitVec 64)) (_2!8642 V!41219)) )
))
(declare-datatypes ((List!23883 0))(
  ( (Nil!23880) (Cons!23879 (h!25088 tuple2!17262) (t!33948 List!23883)) )
))
(declare-datatypes ((ListLongMap!15231 0))(
  ( (ListLongMap!15232 (toList!7631 List!23883)) )
))
(declare-fun lt!490152 () ListLongMap!15231)

(declare-fun zeroValue!831 () V!41219)

(declare-fun getCurrentListMapNoExtraKeys!4147 (array!71051 array!71053 (_ BitVec 32) (_ BitVec 32) V!41219 V!41219 (_ BitVec 32) Int) ListLongMap!15231)

(declare-fun dynLambda!2282 (Int (_ BitVec 64)) V!41219)

(assert (=> b!1096453 (= lt!490152 (getCurrentListMapNoExtraKeys!4147 lt!490150 (array!71054 (store (arr!34198 _values!874) i!650 (ValueCellFull!12825 (dynLambda!2282 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34734 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490153 () ListLongMap!15231)

(assert (=> b!1096453 (= lt!490153 (getCurrentListMapNoExtraKeys!4147 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096453 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36074 0))(
  ( (Unit!36075) )
))
(declare-fun lt!490151 () Unit!36074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71051 (_ BitVec 64) (_ BitVec 32)) Unit!36074)

(assert (=> b!1096453 (= lt!490151 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096454 () Bool)

(declare-fun res!731780 () Bool)

(assert (=> b!1096454 (=> (not res!731780) (not e!625863))))

(assert (=> b!1096454 (= res!731780 (= (select (arr!34197 _keys!1070) i!650) k0!904))))

(declare-fun b!1096455 () Bool)

(assert (=> b!1096455 (= e!625863 e!625867)))

(declare-fun res!731777 () Bool)

(assert (=> b!1096455 (=> (not res!731777) (not e!625867))))

(assert (=> b!1096455 (= res!731777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490150 mask!1414))))

(assert (=> b!1096455 (= lt!490150 (array!71052 (store (arr!34197 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34733 _keys!1070)))))

(declare-fun b!1096456 () Bool)

(declare-fun res!731782 () Bool)

(assert (=> b!1096456 (=> (not res!731782) (not e!625863))))

(assert (=> b!1096456 (= res!731782 (and (= (size!34734 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34733 _keys!1070) (size!34734 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096457 () Bool)

(declare-fun res!731778 () Bool)

(assert (=> b!1096457 (=> (not res!731778) (not e!625863))))

(assert (=> b!1096457 (= res!731778 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23879))))

(assert (= (and start!96440 res!731774) b!1096456))

(assert (= (and b!1096456 res!731782) b!1096451))

(assert (= (and b!1096451 res!731776) b!1096457))

(assert (= (and b!1096457 res!731778) b!1096448))

(assert (= (and b!1096448 res!731779) b!1096452))

(assert (= (and b!1096452 res!731781) b!1096454))

(assert (= (and b!1096454 res!731780) b!1096455))

(assert (= (and b!1096455 res!731777) b!1096446))

(assert (= (and b!1096446 res!731775) b!1096453))

(assert (= (and b!1096450 condMapEmpty!42364) mapIsEmpty!42364))

(assert (= (and b!1096450 (not condMapEmpty!42364)) mapNonEmpty!42364))

(get-info :version)

(assert (= (and mapNonEmpty!42364 ((_ is ValueCellFull!12825) mapValue!42364)) b!1096447))

(assert (= (and b!1096450 ((_ is ValueCellFull!12825) mapDefault!42364)) b!1096449))

(assert (= start!96440 b!1096450))

(declare-fun b_lambda!17677 () Bool)

(assert (=> (not b_lambda!17677) (not b!1096453)))

(declare-fun t!33946 () Bool)

(declare-fun tb!7885 () Bool)

(assert (=> (and start!96440 (= defaultEntry!882 defaultEntry!882) t!33946) tb!7885))

(declare-fun result!16293 () Bool)

(assert (=> tb!7885 (= result!16293 tp_is_empty!27069)))

(assert (=> b!1096453 t!33946))

(declare-fun b_and!36703 () Bool)

(assert (= b_and!36701 (and (=> t!33946 result!16293) b_and!36703)))

(declare-fun m!1015977 () Bool)

(assert (=> b!1096452 m!1015977))

(declare-fun m!1015979 () Bool)

(assert (=> b!1096455 m!1015979))

(declare-fun m!1015981 () Bool)

(assert (=> b!1096455 m!1015981))

(declare-fun m!1015983 () Bool)

(assert (=> b!1096446 m!1015983))

(declare-fun m!1015985 () Bool)

(assert (=> b!1096451 m!1015985))

(declare-fun m!1015987 () Bool)

(assert (=> b!1096457 m!1015987))

(declare-fun m!1015989 () Bool)

(assert (=> b!1096454 m!1015989))

(declare-fun m!1015991 () Bool)

(assert (=> b!1096453 m!1015991))

(declare-fun m!1015993 () Bool)

(assert (=> b!1096453 m!1015993))

(declare-fun m!1015995 () Bool)

(assert (=> b!1096453 m!1015995))

(declare-fun m!1015997 () Bool)

(assert (=> b!1096453 m!1015997))

(declare-fun m!1015999 () Bool)

(assert (=> b!1096453 m!1015999))

(declare-fun m!1016001 () Bool)

(assert (=> b!1096453 m!1016001))

(declare-fun m!1016003 () Bool)

(assert (=> start!96440 m!1016003))

(declare-fun m!1016005 () Bool)

(assert (=> start!96440 m!1016005))

(declare-fun m!1016007 () Bool)

(assert (=> start!96440 m!1016007))

(declare-fun m!1016009 () Bool)

(assert (=> mapNonEmpty!42364 m!1016009))

(check-sat b_and!36703 tp_is_empty!27069 (not mapNonEmpty!42364) (not b!1096453) (not b!1096455) (not b!1096457) (not start!96440) (not b!1096451) (not b!1096446) (not b_lambda!17677) (not b!1096452) (not b_next!23019))
(check-sat b_and!36703 (not b_next!23019))
