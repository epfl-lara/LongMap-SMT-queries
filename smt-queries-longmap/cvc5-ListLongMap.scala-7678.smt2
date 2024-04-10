; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96414 () Bool)

(assert start!96414)

(declare-fun b_free!22993 () Bool)

(declare-fun b_next!22993 () Bool)

(assert (=> start!96414 (= b_free!22993 (not b_next!22993))))

(declare-fun tp!80906 () Bool)

(declare-fun b_and!36649 () Bool)

(assert (=> start!96414 (= tp!80906 b_and!36649)))

(declare-fun b!1095953 () Bool)

(declare-fun e!625628 () Bool)

(declare-fun e!625631 () Bool)

(assert (=> b!1095953 (= e!625628 e!625631)))

(declare-fun res!731429 () Bool)

(assert (=> b!1095953 (=> (not res!731429) (not e!625631))))

(declare-datatypes ((array!70999 0))(
  ( (array!71000 (arr!34171 (Array (_ BitVec 32) (_ BitVec 64))) (size!34707 (_ BitVec 32))) )
))
(declare-fun lt!489995 () array!70999)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70999 (_ BitVec 32)) Bool)

(assert (=> b!1095953 (= res!731429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489995 mask!1414))))

(declare-fun _keys!1070 () array!70999)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095953 (= lt!489995 (array!71000 (store (arr!34171 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34707 _keys!1070)))))

(declare-fun b!1095954 () Bool)

(declare-fun res!731428 () Bool)

(assert (=> b!1095954 (=> (not res!731428) (not e!625628))))

(declare-datatypes ((List!23860 0))(
  ( (Nil!23857) (Cons!23856 (h!25065 (_ BitVec 64)) (t!33899 List!23860)) )
))
(declare-fun arrayNoDuplicates!0 (array!70999 (_ BitVec 32) List!23860) Bool)

(assert (=> b!1095954 (= res!731428 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23857))))

(declare-fun mapNonEmpty!42325 () Bool)

(declare-fun mapRes!42325 () Bool)

(declare-fun tp!80905 () Bool)

(declare-fun e!625632 () Bool)

(assert (=> mapNonEmpty!42325 (= mapRes!42325 (and tp!80905 e!625632))))

(declare-datatypes ((V!41185 0))(
  ( (V!41186 (val!13578 Int)) )
))
(declare-datatypes ((ValueCell!12812 0))(
  ( (ValueCellFull!12812 (v!16199 V!41185)) (EmptyCell!12812) )
))
(declare-datatypes ((array!71001 0))(
  ( (array!71002 (arr!34172 (Array (_ BitVec 32) ValueCell!12812)) (size!34708 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71001)

(declare-fun mapKey!42325 () (_ BitVec 32))

(declare-fun mapValue!42325 () ValueCell!12812)

(declare-fun mapRest!42325 () (Array (_ BitVec 32) ValueCell!12812))

(assert (=> mapNonEmpty!42325 (= (arr!34172 _values!874) (store mapRest!42325 mapKey!42325 mapValue!42325))))

(declare-fun b!1095955 () Bool)

(assert (=> b!1095955 (= e!625631 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41185)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17240 0))(
  ( (tuple2!17241 (_1!8631 (_ BitVec 64)) (_2!8631 V!41185)) )
))
(declare-datatypes ((List!23861 0))(
  ( (Nil!23858) (Cons!23857 (h!25066 tuple2!17240) (t!33900 List!23861)) )
))
(declare-datatypes ((ListLongMap!15209 0))(
  ( (ListLongMap!15210 (toList!7620 List!23861)) )
))
(declare-fun lt!489994 () ListLongMap!15209)

(declare-fun zeroValue!831 () V!41185)

(declare-fun getCurrentListMapNoExtraKeys!4136 (array!70999 array!71001 (_ BitVec 32) (_ BitVec 32) V!41185 V!41185 (_ BitVec 32) Int) ListLongMap!15209)

(declare-fun dynLambda!2271 (Int (_ BitVec 64)) V!41185)

(assert (=> b!1095955 (= lt!489994 (getCurrentListMapNoExtraKeys!4136 lt!489995 (array!71002 (store (arr!34172 _values!874) i!650 (ValueCellFull!12812 (dynLambda!2271 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34708 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489996 () ListLongMap!15209)

(assert (=> b!1095955 (= lt!489996 (getCurrentListMapNoExtraKeys!4136 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095955 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36052 0))(
  ( (Unit!36053) )
))
(declare-fun lt!489997 () Unit!36052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70999 (_ BitVec 64) (_ BitVec 32)) Unit!36052)

(assert (=> b!1095955 (= lt!489997 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1095956 () Bool)

(declare-fun res!731425 () Bool)

(assert (=> b!1095956 (=> (not res!731425) (not e!625631))))

(assert (=> b!1095956 (= res!731425 (arrayNoDuplicates!0 lt!489995 #b00000000000000000000000000000000 Nil!23857))))

(declare-fun b!1095957 () Bool)

(declare-fun res!731424 () Bool)

(assert (=> b!1095957 (=> (not res!731424) (not e!625628))))

(assert (=> b!1095957 (= res!731424 (and (= (size!34708 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34707 _keys!1070) (size!34708 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095958 () Bool)

(declare-fun res!731427 () Bool)

(assert (=> b!1095958 (=> (not res!731427) (not e!625628))))

(assert (=> b!1095958 (= res!731427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095959 () Bool)

(declare-fun res!731423 () Bool)

(assert (=> b!1095959 (=> (not res!731423) (not e!625628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095959 (= res!731423 (validKeyInArray!0 k!904))))

(declare-fun b!1095960 () Bool)

(declare-fun e!625630 () Bool)

(declare-fun tp_is_empty!27043 () Bool)

(assert (=> b!1095960 (= e!625630 tp_is_empty!27043)))

(declare-fun b!1095961 () Bool)

(assert (=> b!1095961 (= e!625632 tp_is_empty!27043)))

(declare-fun mapIsEmpty!42325 () Bool)

(assert (=> mapIsEmpty!42325 mapRes!42325))

(declare-fun b!1095962 () Bool)

(declare-fun res!731426 () Bool)

(assert (=> b!1095962 (=> (not res!731426) (not e!625628))))

(assert (=> b!1095962 (= res!731426 (= (select (arr!34171 _keys!1070) i!650) k!904))))

(declare-fun b!1095963 () Bool)

(declare-fun e!625633 () Bool)

(assert (=> b!1095963 (= e!625633 (and e!625630 mapRes!42325))))

(declare-fun condMapEmpty!42325 () Bool)

(declare-fun mapDefault!42325 () ValueCell!12812)

