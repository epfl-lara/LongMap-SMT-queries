; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96422 () Bool)

(assert start!96422)

(declare-fun b_free!23001 () Bool)

(declare-fun b_next!23001 () Bool)

(assert (=> start!96422 (= b_free!23001 (not b_next!23001))))

(declare-fun tp!80930 () Bool)

(declare-fun b_and!36665 () Bool)

(assert (=> start!96422 (= tp!80930 b_and!36665)))

(declare-fun b!1096104 () Bool)

(declare-fun e!625702 () Bool)

(declare-fun e!625700 () Bool)

(declare-fun mapRes!42337 () Bool)

(assert (=> b!1096104 (= e!625702 (and e!625700 mapRes!42337))))

(declare-fun condMapEmpty!42337 () Bool)

(declare-datatypes ((V!41195 0))(
  ( (V!41196 (val!13582 Int)) )
))
(declare-datatypes ((ValueCell!12816 0))(
  ( (ValueCellFull!12816 (v!16203 V!41195)) (EmptyCell!12816) )
))
(declare-datatypes ((array!71015 0))(
  ( (array!71016 (arr!34179 (Array (_ BitVec 32) ValueCell!12816)) (size!34715 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71015)

(declare-fun mapDefault!42337 () ValueCell!12816)

(assert (=> b!1096104 (= condMapEmpty!42337 (= (arr!34179 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12816)) mapDefault!42337)))))

(declare-fun mapNonEmpty!42337 () Bool)

(declare-fun tp!80929 () Bool)

(declare-fun e!625705 () Bool)

(assert (=> mapNonEmpty!42337 (= mapRes!42337 (and tp!80929 e!625705))))

(declare-fun mapValue!42337 () ValueCell!12816)

(declare-fun mapKey!42337 () (_ BitVec 32))

(declare-fun mapRest!42337 () (Array (_ BitVec 32) ValueCell!12816))

(assert (=> mapNonEmpty!42337 (= (arr!34179 _values!874) (store mapRest!42337 mapKey!42337 mapValue!42337))))

(declare-fun b!1096105 () Bool)

(declare-fun res!731534 () Bool)

(declare-fun e!625704 () Bool)

(assert (=> b!1096105 (=> (not res!731534) (not e!625704))))

(declare-datatypes ((array!71017 0))(
  ( (array!71018 (arr!34180 (Array (_ BitVec 32) (_ BitVec 64))) (size!34716 (_ BitVec 32))) )
))
(declare-fun lt!490045 () array!71017)

(declare-datatypes ((List!23868 0))(
  ( (Nil!23865) (Cons!23864 (h!25073 (_ BitVec 64)) (t!33915 List!23868)) )
))
(declare-fun arrayNoDuplicates!0 (array!71017 (_ BitVec 32) List!23868) Bool)

(assert (=> b!1096105 (= res!731534 (arrayNoDuplicates!0 lt!490045 #b00000000000000000000000000000000 Nil!23865))))

(declare-fun b!1096106 () Bool)

(declare-fun e!625701 () Bool)

(assert (=> b!1096106 (= e!625701 e!625704)))

(declare-fun res!731538 () Bool)

(assert (=> b!1096106 (=> (not res!731538) (not e!625704))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71017 (_ BitVec 32)) Bool)

(assert (=> b!1096106 (= res!731538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490045 mask!1414))))

(declare-fun _keys!1070 () array!71017)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096106 (= lt!490045 (array!71018 (store (arr!34180 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34716 _keys!1070)))))

(declare-fun mapIsEmpty!42337 () Bool)

(assert (=> mapIsEmpty!42337 mapRes!42337))

(declare-fun b!1096107 () Bool)

(declare-fun res!731531 () Bool)

(assert (=> b!1096107 (=> (not res!731531) (not e!625701))))

(assert (=> b!1096107 (= res!731531 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23865))))

(declare-fun b!1096108 () Bool)

(declare-fun tp_is_empty!27051 () Bool)

(assert (=> b!1096108 (= e!625705 tp_is_empty!27051)))

(declare-fun b!1096109 () Bool)

(declare-fun res!731536 () Bool)

(assert (=> b!1096109 (=> (not res!731536) (not e!625701))))

(assert (=> b!1096109 (= res!731536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096110 () Bool)

(declare-fun res!731537 () Bool)

(assert (=> b!1096110 (=> (not res!731537) (not e!625701))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096110 (= res!731537 (and (= (size!34715 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34716 _keys!1070) (size!34715 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096111 () Bool)

(declare-fun res!731533 () Bool)

(assert (=> b!1096111 (=> (not res!731533) (not e!625701))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1096111 (= res!731533 (= (select (arr!34180 _keys!1070) i!650) k0!904))))

(declare-fun b!1096113 () Bool)

(declare-fun res!731539 () Bool)

(assert (=> b!1096113 (=> (not res!731539) (not e!625701))))

(assert (=> b!1096113 (= res!731539 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34716 _keys!1070))))))

(declare-fun b!1096114 () Bool)

(assert (=> b!1096114 (= e!625704 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41195)

(declare-fun zeroValue!831 () V!41195)

(declare-datatypes ((tuple2!17248 0))(
  ( (tuple2!17249 (_1!8635 (_ BitVec 64)) (_2!8635 V!41195)) )
))
(declare-datatypes ((List!23869 0))(
  ( (Nil!23866) (Cons!23865 (h!25074 tuple2!17248) (t!33916 List!23869)) )
))
(declare-datatypes ((ListLongMap!15217 0))(
  ( (ListLongMap!15218 (toList!7624 List!23869)) )
))
(declare-fun lt!490043 () ListLongMap!15217)

(declare-fun getCurrentListMapNoExtraKeys!4140 (array!71017 array!71015 (_ BitVec 32) (_ BitVec 32) V!41195 V!41195 (_ BitVec 32) Int) ListLongMap!15217)

(declare-fun dynLambda!2275 (Int (_ BitVec 64)) V!41195)

(assert (=> b!1096114 (= lt!490043 (getCurrentListMapNoExtraKeys!4140 lt!490045 (array!71016 (store (arr!34179 _values!874) i!650 (ValueCellFull!12816 (dynLambda!2275 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34715 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490044 () ListLongMap!15217)

(assert (=> b!1096114 (= lt!490044 (getCurrentListMapNoExtraKeys!4140 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096114 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36060 0))(
  ( (Unit!36061) )
))
(declare-fun lt!490042 () Unit!36060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71017 (_ BitVec 64) (_ BitVec 32)) Unit!36060)

(assert (=> b!1096114 (= lt!490042 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096115 () Bool)

(assert (=> b!1096115 (= e!625700 tp_is_empty!27051)))

(declare-fun res!731532 () Bool)

(assert (=> start!96422 (=> (not res!731532) (not e!625701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96422 (= res!731532 (validMask!0 mask!1414))))

(assert (=> start!96422 e!625701))

(assert (=> start!96422 tp!80930))

(assert (=> start!96422 true))

(assert (=> start!96422 tp_is_empty!27051))

(declare-fun array_inv!26336 (array!71017) Bool)

(assert (=> start!96422 (array_inv!26336 _keys!1070)))

(declare-fun array_inv!26337 (array!71015) Bool)

(assert (=> start!96422 (and (array_inv!26337 _values!874) e!625702)))

(declare-fun b!1096112 () Bool)

(declare-fun res!731535 () Bool)

(assert (=> b!1096112 (=> (not res!731535) (not e!625701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096112 (= res!731535 (validKeyInArray!0 k0!904))))

(assert (= (and start!96422 res!731532) b!1096110))

(assert (= (and b!1096110 res!731537) b!1096109))

(assert (= (and b!1096109 res!731536) b!1096107))

(assert (= (and b!1096107 res!731531) b!1096113))

(assert (= (and b!1096113 res!731539) b!1096112))

(assert (= (and b!1096112 res!731535) b!1096111))

(assert (= (and b!1096111 res!731533) b!1096106))

(assert (= (and b!1096106 res!731538) b!1096105))

(assert (= (and b!1096105 res!731534) b!1096114))

(assert (= (and b!1096104 condMapEmpty!42337) mapIsEmpty!42337))

(assert (= (and b!1096104 (not condMapEmpty!42337)) mapNonEmpty!42337))

(get-info :version)

(assert (= (and mapNonEmpty!42337 ((_ is ValueCellFull!12816) mapValue!42337)) b!1096108))

(assert (= (and b!1096104 ((_ is ValueCellFull!12816) mapDefault!42337)) b!1096115))

(assert (= start!96422 b!1096104))

(declare-fun b_lambda!17659 () Bool)

(assert (=> (not b_lambda!17659) (not b!1096114)))

(declare-fun t!33914 () Bool)

(declare-fun tb!7867 () Bool)

(assert (=> (and start!96422 (= defaultEntry!882 defaultEntry!882) t!33914) tb!7867))

(declare-fun result!16257 () Bool)

(assert (=> tb!7867 (= result!16257 tp_is_empty!27051)))

(assert (=> b!1096114 t!33914))

(declare-fun b_and!36667 () Bool)

(assert (= b_and!36665 (and (=> t!33914 result!16257) b_and!36667)))

(declare-fun m!1015671 () Bool)

(assert (=> mapNonEmpty!42337 m!1015671))

(declare-fun m!1015673 () Bool)

(assert (=> b!1096112 m!1015673))

(declare-fun m!1015675 () Bool)

(assert (=> b!1096105 m!1015675))

(declare-fun m!1015677 () Bool)

(assert (=> b!1096106 m!1015677))

(declare-fun m!1015679 () Bool)

(assert (=> b!1096106 m!1015679))

(declare-fun m!1015681 () Bool)

(assert (=> b!1096114 m!1015681))

(declare-fun m!1015683 () Bool)

(assert (=> b!1096114 m!1015683))

(declare-fun m!1015685 () Bool)

(assert (=> b!1096114 m!1015685))

(declare-fun m!1015687 () Bool)

(assert (=> b!1096114 m!1015687))

(declare-fun m!1015689 () Bool)

(assert (=> b!1096114 m!1015689))

(declare-fun m!1015691 () Bool)

(assert (=> b!1096114 m!1015691))

(declare-fun m!1015693 () Bool)

(assert (=> b!1096111 m!1015693))

(declare-fun m!1015695 () Bool)

(assert (=> b!1096109 m!1015695))

(declare-fun m!1015697 () Bool)

(assert (=> start!96422 m!1015697))

(declare-fun m!1015699 () Bool)

(assert (=> start!96422 m!1015699))

(declare-fun m!1015701 () Bool)

(assert (=> start!96422 m!1015701))

(declare-fun m!1015703 () Bool)

(assert (=> b!1096107 m!1015703))

(check-sat tp_is_empty!27051 (not b!1096114) (not start!96422) (not mapNonEmpty!42337) (not b!1096112) b_and!36667 (not b_lambda!17659) (not b!1096107) (not b!1096105) (not b_next!23001) (not b!1096109) (not b!1096106))
(check-sat b_and!36667 (not b_next!23001))
