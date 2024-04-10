; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96136 () Bool)

(assert start!96136)

(declare-fun b_free!22789 () Bool)

(declare-fun b_next!22789 () Bool)

(assert (=> start!96136 (= b_free!22789 (not b_next!22789))))

(declare-fun tp!80215 () Bool)

(declare-fun b_and!36253 () Bool)

(assert (=> start!96136 (= tp!80215 b_and!36253)))

(declare-fun b!1091107 () Bool)

(declare-fun res!727952 () Bool)

(declare-fun e!623161 () Bool)

(assert (=> b!1091107 (=> (not res!727952) (not e!623161))))

(declare-datatypes ((array!70501 0))(
  ( (array!70502 (arr!33924 (Array (_ BitVec 32) (_ BitVec 64))) (size!34460 (_ BitVec 32))) )
))
(declare-fun lt!487126 () array!70501)

(declare-datatypes ((List!23691 0))(
  ( (Nil!23688) (Cons!23687 (h!24896 (_ BitVec 64)) (t!33538 List!23691)) )
))
(declare-fun arrayNoDuplicates!0 (array!70501 (_ BitVec 32) List!23691) Bool)

(assert (=> b!1091107 (= res!727952 (arrayNoDuplicates!0 lt!487126 #b00000000000000000000000000000000 Nil!23688))))

(declare-fun b!1091108 () Bool)

(declare-fun res!727961 () Bool)

(declare-fun e!623156 () Bool)

(assert (=> b!1091108 (=> (not res!727961) (not e!623156))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70501)

(assert (=> b!1091108 (= res!727961 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34460 _keys!1070))))))

(declare-fun b!1091110 () Bool)

(declare-fun res!727958 () Bool)

(assert (=> b!1091110 (=> (not res!727958) (not e!623156))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40849 0))(
  ( (V!40850 (val!13452 Int)) )
))
(declare-datatypes ((ValueCell!12686 0))(
  ( (ValueCellFull!12686 (v!16073 V!40849)) (EmptyCell!12686) )
))
(declare-datatypes ((array!70503 0))(
  ( (array!70504 (arr!33925 (Array (_ BitVec 32) ValueCell!12686)) (size!34461 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70503)

(assert (=> b!1091110 (= res!727958 (and (= (size!34461 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34460 _keys!1070) (size!34461 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091111 () Bool)

(declare-fun e!623162 () Bool)

(declare-fun tp_is_empty!26791 () Bool)

(assert (=> b!1091111 (= e!623162 tp_is_empty!26791)))

(declare-fun b!1091112 () Bool)

(declare-fun e!623160 () Bool)

(declare-fun e!623157 () Bool)

(assert (=> b!1091112 (= e!623160 e!623157)))

(declare-fun res!727957 () Bool)

(assert (=> b!1091112 (=> res!727957 e!623157)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1091112 (= res!727957 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17106 0))(
  ( (tuple2!17107 (_1!8564 (_ BitVec 64)) (_2!8564 V!40849)) )
))
(declare-datatypes ((List!23692 0))(
  ( (Nil!23689) (Cons!23688 (h!24897 tuple2!17106) (t!33539 List!23692)) )
))
(declare-datatypes ((ListLongMap!15075 0))(
  ( (ListLongMap!15076 (toList!7553 List!23692)) )
))
(declare-fun lt!487130 () ListLongMap!15075)

(declare-fun lt!487137 () ListLongMap!15075)

(assert (=> b!1091112 (= lt!487130 lt!487137)))

(declare-fun lt!487127 () ListLongMap!15075)

(declare-fun lt!487129 () tuple2!17106)

(declare-fun +!3339 (ListLongMap!15075 tuple2!17106) ListLongMap!15075)

(assert (=> b!1091112 (= lt!487137 (+!3339 lt!487127 lt!487129))))

(declare-fun lt!487131 () ListLongMap!15075)

(declare-fun lt!487136 () ListLongMap!15075)

(assert (=> b!1091112 (= lt!487131 lt!487136)))

(declare-fun lt!487132 () ListLongMap!15075)

(assert (=> b!1091112 (= lt!487136 (+!3339 lt!487132 lt!487129))))

(declare-fun lt!487134 () ListLongMap!15075)

(assert (=> b!1091112 (= lt!487131 (+!3339 lt!487134 lt!487129))))

(declare-fun minValue!831 () V!40849)

(assert (=> b!1091112 (= lt!487129 (tuple2!17107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091113 () Bool)

(declare-fun res!727956 () Bool)

(assert (=> b!1091113 (=> (not res!727956) (not e!623156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70501 (_ BitVec 32)) Bool)

(assert (=> b!1091113 (= res!727956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091114 () Bool)

(declare-fun res!727954 () Bool)

(assert (=> b!1091114 (=> (not res!727954) (not e!623156))))

(assert (=> b!1091114 (= res!727954 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23688))))

(declare-fun mapNonEmpty!41941 () Bool)

(declare-fun mapRes!41941 () Bool)

(declare-fun tp!80216 () Bool)

(assert (=> mapNonEmpty!41941 (= mapRes!41941 (and tp!80216 e!623162))))

(declare-fun mapValue!41941 () ValueCell!12686)

(declare-fun mapRest!41941 () (Array (_ BitVec 32) ValueCell!12686))

(declare-fun mapKey!41941 () (_ BitVec 32))

(assert (=> mapNonEmpty!41941 (= (arr!33925 _values!874) (store mapRest!41941 mapKey!41941 mapValue!41941))))

(declare-fun b!1091115 () Bool)

(declare-fun res!727960 () Bool)

(assert (=> b!1091115 (=> (not res!727960) (not e!623156))))

(assert (=> b!1091115 (= res!727960 (= (select (arr!33924 _keys!1070) i!650) k!904))))

(declare-fun b!1091116 () Bool)

(assert (=> b!1091116 (= e!623156 e!623161)))

(declare-fun res!727955 () Bool)

(assert (=> b!1091116 (=> (not res!727955) (not e!623161))))

(assert (=> b!1091116 (= res!727955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487126 mask!1414))))

(assert (=> b!1091116 (= lt!487126 (array!70502 (store (arr!33924 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34460 _keys!1070)))))

(declare-fun mapIsEmpty!41941 () Bool)

(assert (=> mapIsEmpty!41941 mapRes!41941))

(declare-fun res!727959 () Bool)

(assert (=> start!96136 (=> (not res!727959) (not e!623156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96136 (= res!727959 (validMask!0 mask!1414))))

(assert (=> start!96136 e!623156))

(assert (=> start!96136 tp!80215))

(assert (=> start!96136 true))

(assert (=> start!96136 tp_is_empty!26791))

(declare-fun array_inv!26158 (array!70501) Bool)

(assert (=> start!96136 (array_inv!26158 _keys!1070)))

(declare-fun e!623155 () Bool)

(declare-fun array_inv!26159 (array!70503) Bool)

(assert (=> start!96136 (and (array_inv!26159 _values!874) e!623155)))

(declare-fun b!1091109 () Bool)

(declare-fun e!623158 () Bool)

(assert (=> b!1091109 (= e!623155 (and e!623158 mapRes!41941))))

(declare-fun condMapEmpty!41941 () Bool)

(declare-fun mapDefault!41941 () ValueCell!12686)

