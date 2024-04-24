; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96698 () Bool)

(assert start!96698)

(declare-fun b_free!23041 () Bool)

(declare-fun b_next!23041 () Bool)

(assert (=> start!96698 (= b_free!23041 (not b_next!23041))))

(declare-fun tp!81050 () Bool)

(declare-fun b_and!36755 () Bool)

(assert (=> start!96698 (= tp!81050 b_and!36755)))

(declare-fun b!1098191 () Bool)

(declare-fun e!626920 () Bool)

(declare-fun e!626917 () Bool)

(declare-fun mapRes!42397 () Bool)

(assert (=> b!1098191 (= e!626920 (and e!626917 mapRes!42397))))

(declare-fun condMapEmpty!42397 () Bool)

(declare-datatypes ((V!41249 0))(
  ( (V!41250 (val!13602 Int)) )
))
(declare-datatypes ((ValueCell!12836 0))(
  ( (ValueCellFull!12836 (v!16219 V!41249)) (EmptyCell!12836) )
))
(declare-datatypes ((array!71123 0))(
  ( (array!71124 (arr!34227 (Array (_ BitVec 32) ValueCell!12836)) (size!34764 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71123)

(declare-fun mapDefault!42397 () ValueCell!12836)

(assert (=> b!1098191 (= condMapEmpty!42397 (= (arr!34227 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12836)) mapDefault!42397)))))

(declare-fun b!1098192 () Bool)

(declare-fun res!732596 () Bool)

(declare-fun e!626916 () Bool)

(assert (=> b!1098192 (=> (not res!732596) (not e!626916))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71125 0))(
  ( (array!71126 (arr!34228 (Array (_ BitVec 32) (_ BitVec 64))) (size!34765 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71125)

(assert (=> b!1098192 (= res!732596 (and (= (size!34764 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34765 _keys!1070) (size!34764 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098193 () Bool)

(declare-fun e!626919 () Bool)

(declare-fun tp_is_empty!27091 () Bool)

(assert (=> b!1098193 (= e!626919 tp_is_empty!27091)))

(declare-fun b!1098194 () Bool)

(declare-fun e!626918 () Bool)

(assert (=> b!1098194 (= e!626918 (not true))))

(declare-fun minValue!831 () V!41249)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!17284 0))(
  ( (tuple2!17285 (_1!8653 (_ BitVec 64)) (_2!8653 V!41249)) )
))
(declare-datatypes ((List!23908 0))(
  ( (Nil!23905) (Cons!23904 (h!25122 tuple2!17284) (t!33987 List!23908)) )
))
(declare-datatypes ((ListLongMap!15261 0))(
  ( (ListLongMap!15262 (toList!7646 List!23908)) )
))
(declare-fun lt!490800 () ListLongMap!15261)

(declare-fun zeroValue!831 () V!41249)

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!490798 () array!71125)

(declare-fun getCurrentListMapNoExtraKeys!4199 (array!71125 array!71123 (_ BitVec 32) (_ BitVec 32) V!41249 V!41249 (_ BitVec 32) Int) ListLongMap!15261)

(declare-fun dynLambda!2317 (Int (_ BitVec 64)) V!41249)

(assert (=> b!1098194 (= lt!490800 (getCurrentListMapNoExtraKeys!4199 lt!490798 (array!71124 (store (arr!34227 _values!874) i!650 (ValueCellFull!12836 (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34764 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490799 () ListLongMap!15261)

(assert (=> b!1098194 (= lt!490799 (getCurrentListMapNoExtraKeys!4199 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098194 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36079 0))(
  ( (Unit!36080) )
))
(declare-fun lt!490797 () Unit!36079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71125 (_ BitVec 64) (_ BitVec 32)) Unit!36079)

(assert (=> b!1098194 (= lt!490797 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42397 () Bool)

(assert (=> mapIsEmpty!42397 mapRes!42397))

(declare-fun b!1098195 () Bool)

(declare-fun res!732601 () Bool)

(assert (=> b!1098195 (=> (not res!732601) (not e!626916))))

(declare-datatypes ((List!23909 0))(
  ( (Nil!23906) (Cons!23905 (h!25123 (_ BitVec 64)) (t!33988 List!23909)) )
))
(declare-fun arrayNoDuplicates!0 (array!71125 (_ BitVec 32) List!23909) Bool)

(assert (=> b!1098195 (= res!732601 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23906))))

(declare-fun b!1098196 () Bool)

(declare-fun res!732594 () Bool)

(assert (=> b!1098196 (=> (not res!732594) (not e!626918))))

(assert (=> b!1098196 (= res!732594 (arrayNoDuplicates!0 lt!490798 #b00000000000000000000000000000000 Nil!23906))))

(declare-fun b!1098197 () Bool)

(declare-fun res!732600 () Bool)

(assert (=> b!1098197 (=> (not res!732600) (not e!626916))))

(assert (=> b!1098197 (= res!732600 (= (select (arr!34228 _keys!1070) i!650) k0!904))))

(declare-fun b!1098198 () Bool)

(declare-fun res!732597 () Bool)

(assert (=> b!1098198 (=> (not res!732597) (not e!626916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098198 (= res!732597 (validKeyInArray!0 k0!904))))

(declare-fun b!1098199 () Bool)

(assert (=> b!1098199 (= e!626916 e!626918)))

(declare-fun res!732599 () Bool)

(assert (=> b!1098199 (=> (not res!732599) (not e!626918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71125 (_ BitVec 32)) Bool)

(assert (=> b!1098199 (= res!732599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490798 mask!1414))))

(assert (=> b!1098199 (= lt!490798 (array!71126 (store (arr!34228 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34765 _keys!1070)))))

(declare-fun res!732598 () Bool)

(assert (=> start!96698 (=> (not res!732598) (not e!626916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96698 (= res!732598 (validMask!0 mask!1414))))

(assert (=> start!96698 e!626916))

(assert (=> start!96698 tp!81050))

(assert (=> start!96698 true))

(assert (=> start!96698 tp_is_empty!27091))

(declare-fun array_inv!26398 (array!71125) Bool)

(assert (=> start!96698 (array_inv!26398 _keys!1070)))

(declare-fun array_inv!26399 (array!71123) Bool)

(assert (=> start!96698 (and (array_inv!26399 _values!874) e!626920)))

(declare-fun b!1098200 () Bool)

(assert (=> b!1098200 (= e!626917 tp_is_empty!27091)))

(declare-fun b!1098201 () Bool)

(declare-fun res!732595 () Bool)

(assert (=> b!1098201 (=> (not res!732595) (not e!626916))))

(assert (=> b!1098201 (= res!732595 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34765 _keys!1070))))))

(declare-fun b!1098202 () Bool)

(declare-fun res!732593 () Bool)

(assert (=> b!1098202 (=> (not res!732593) (not e!626916))))

(assert (=> b!1098202 (= res!732593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42397 () Bool)

(declare-fun tp!81049 () Bool)

(assert (=> mapNonEmpty!42397 (= mapRes!42397 (and tp!81049 e!626919))))

(declare-fun mapKey!42397 () (_ BitVec 32))

(declare-fun mapRest!42397 () (Array (_ BitVec 32) ValueCell!12836))

(declare-fun mapValue!42397 () ValueCell!12836)

(assert (=> mapNonEmpty!42397 (= (arr!34227 _values!874) (store mapRest!42397 mapKey!42397 mapValue!42397))))

(assert (= (and start!96698 res!732598) b!1098192))

(assert (= (and b!1098192 res!732596) b!1098202))

(assert (= (and b!1098202 res!732593) b!1098195))

(assert (= (and b!1098195 res!732601) b!1098201))

(assert (= (and b!1098201 res!732595) b!1098198))

(assert (= (and b!1098198 res!732597) b!1098197))

(assert (= (and b!1098197 res!732600) b!1098199))

(assert (= (and b!1098199 res!732599) b!1098196))

(assert (= (and b!1098196 res!732594) b!1098194))

(assert (= (and b!1098191 condMapEmpty!42397) mapIsEmpty!42397))

(assert (= (and b!1098191 (not condMapEmpty!42397)) mapNonEmpty!42397))

(get-info :version)

(assert (= (and mapNonEmpty!42397 ((_ is ValueCellFull!12836) mapValue!42397)) b!1098193))

(assert (= (and b!1098191 ((_ is ValueCellFull!12836) mapDefault!42397)) b!1098200))

(assert (= start!96698 b!1098191))

(declare-fun b_lambda!17709 () Bool)

(assert (=> (not b_lambda!17709) (not b!1098194)))

(declare-fun t!33986 () Bool)

(declare-fun tb!7899 () Bool)

(assert (=> (and start!96698 (= defaultEntry!882 defaultEntry!882) t!33986) tb!7899))

(declare-fun result!16329 () Bool)

(assert (=> tb!7899 (= result!16329 tp_is_empty!27091)))

(assert (=> b!1098194 t!33986))

(declare-fun b_and!36757 () Bool)

(assert (= b_and!36755 (and (=> t!33986 result!16329) b_and!36757)))

(declare-fun m!1018023 () Bool)

(assert (=> start!96698 m!1018023))

(declare-fun m!1018025 () Bool)

(assert (=> start!96698 m!1018025))

(declare-fun m!1018027 () Bool)

(assert (=> start!96698 m!1018027))

(declare-fun m!1018029 () Bool)

(assert (=> b!1098199 m!1018029))

(declare-fun m!1018031 () Bool)

(assert (=> b!1098199 m!1018031))

(declare-fun m!1018033 () Bool)

(assert (=> b!1098194 m!1018033))

(declare-fun m!1018035 () Bool)

(assert (=> b!1098194 m!1018035))

(declare-fun m!1018037 () Bool)

(assert (=> b!1098194 m!1018037))

(declare-fun m!1018039 () Bool)

(assert (=> b!1098194 m!1018039))

(declare-fun m!1018041 () Bool)

(assert (=> b!1098194 m!1018041))

(declare-fun m!1018043 () Bool)

(assert (=> b!1098194 m!1018043))

(declare-fun m!1018045 () Bool)

(assert (=> mapNonEmpty!42397 m!1018045))

(declare-fun m!1018047 () Bool)

(assert (=> b!1098202 m!1018047))

(declare-fun m!1018049 () Bool)

(assert (=> b!1098196 m!1018049))

(declare-fun m!1018051 () Bool)

(assert (=> b!1098197 m!1018051))

(declare-fun m!1018053 () Bool)

(assert (=> b!1098195 m!1018053))

(declare-fun m!1018055 () Bool)

(assert (=> b!1098198 m!1018055))

(check-sat (not start!96698) (not b_next!23041) (not b!1098198) b_and!36757 (not mapNonEmpty!42397) (not b!1098196) (not b!1098199) tp_is_empty!27091 (not b!1098202) (not b!1098194) (not b!1098195) (not b_lambda!17709))
(check-sat b_and!36757 (not b_next!23041))
