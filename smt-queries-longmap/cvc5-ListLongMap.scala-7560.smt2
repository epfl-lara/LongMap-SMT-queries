; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95680 () Bool)

(assert start!95680)

(declare-fun b_free!22333 () Bool)

(declare-fun b_next!22333 () Bool)

(assert (=> start!95680 (= b_free!22333 (not b_next!22333))))

(declare-fun tp!78847 () Bool)

(declare-fun b_and!35341 () Bool)

(assert (=> start!95680 (= tp!78847 b_and!35341)))

(declare-fun b!1081539 () Bool)

(declare-fun res!720895 () Bool)

(declare-fun e!618175 () Bool)

(assert (=> b!1081539 (=> (not res!720895) (not e!618175))))

(declare-datatypes ((array!69617 0))(
  ( (array!69618 (arr!33482 (Array (_ BitVec 32) (_ BitVec 64))) (size!34018 (_ BitVec 32))) )
))
(declare-fun lt!479332 () array!69617)

(declare-datatypes ((List!23334 0))(
  ( (Nil!23331) (Cons!23330 (h!24539 (_ BitVec 64)) (t!32725 List!23334)) )
))
(declare-fun arrayNoDuplicates!0 (array!69617 (_ BitVec 32) List!23334) Bool)

(assert (=> b!1081539 (= res!720895 (arrayNoDuplicates!0 lt!479332 #b00000000000000000000000000000000 Nil!23331))))

(declare-fun b!1081540 () Bool)

(declare-fun res!720898 () Bool)

(declare-fun e!618176 () Bool)

(assert (=> b!1081540 (=> (not res!720898) (not e!618176))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!69617)

(assert (=> b!1081540 (= res!720898 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34018 _keys!1070))))))

(declare-fun b!1081541 () Bool)

(declare-fun res!720892 () Bool)

(assert (=> b!1081541 (=> (not res!720892) (not e!618176))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69617 (_ BitVec 32)) Bool)

(assert (=> b!1081541 (= res!720892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081542 () Bool)

(declare-fun res!720899 () Bool)

(assert (=> b!1081542 (=> (not res!720899) (not e!618176))))

(assert (=> b!1081542 (= res!720899 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23331))))

(declare-fun b!1081543 () Bool)

(declare-fun e!618178 () Bool)

(declare-fun tp_is_empty!26335 () Bool)

(assert (=> b!1081543 (= e!618178 tp_is_empty!26335)))

(declare-fun b!1081544 () Bool)

(assert (=> b!1081544 (= e!618176 e!618175)))

(declare-fun res!720893 () Bool)

(assert (=> b!1081544 (=> (not res!720893) (not e!618175))))

(assert (=> b!1081544 (= res!720893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479332 mask!1414))))

(assert (=> b!1081544 (= lt!479332 (array!69618 (store (arr!33482 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34018 _keys!1070)))))

(declare-fun res!720894 () Bool)

(assert (=> start!95680 (=> (not res!720894) (not e!618176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95680 (= res!720894 (validMask!0 mask!1414))))

(assert (=> start!95680 e!618176))

(assert (=> start!95680 tp!78847))

(assert (=> start!95680 true))

(assert (=> start!95680 tp_is_empty!26335))

(declare-fun array_inv!25848 (array!69617) Bool)

(assert (=> start!95680 (array_inv!25848 _keys!1070)))

(declare-datatypes ((V!40241 0))(
  ( (V!40242 (val!13224 Int)) )
))
(declare-datatypes ((ValueCell!12458 0))(
  ( (ValueCellFull!12458 (v!15845 V!40241)) (EmptyCell!12458) )
))
(declare-datatypes ((array!69619 0))(
  ( (array!69620 (arr!33483 (Array (_ BitVec 32) ValueCell!12458)) (size!34019 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69619)

(declare-fun e!618177 () Bool)

(declare-fun array_inv!25849 (array!69619) Bool)

(assert (=> start!95680 (and (array_inv!25849 _values!874) e!618177)))

(declare-fun b!1081545 () Bool)

(assert (=> b!1081545 (= e!618175 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40241)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16756 0))(
  ( (tuple2!16757 (_1!8389 (_ BitVec 64)) (_2!8389 V!40241)) )
))
(declare-datatypes ((List!23335 0))(
  ( (Nil!23332) (Cons!23331 (h!24540 tuple2!16756) (t!32726 List!23335)) )
))
(declare-datatypes ((ListLongMap!14725 0))(
  ( (ListLongMap!14726 (toList!7378 List!23335)) )
))
(declare-fun lt!479334 () ListLongMap!14725)

(declare-fun zeroValue!831 () V!40241)

(declare-fun getCurrentListMapNoExtraKeys!3926 (array!69617 array!69619 (_ BitVec 32) (_ BitVec 32) V!40241 V!40241 (_ BitVec 32) Int) ListLongMap!14725)

(declare-fun dynLambda!2063 (Int (_ BitVec 64)) V!40241)

(assert (=> b!1081545 (= lt!479334 (getCurrentListMapNoExtraKeys!3926 lt!479332 (array!69620 (store (arr!33483 _values!874) i!650 (ValueCellFull!12458 (dynLambda!2063 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34019 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479333 () ListLongMap!14725)

(assert (=> b!1081545 (= lt!479333 (getCurrentListMapNoExtraKeys!3926 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081545 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35576 0))(
  ( (Unit!35577) )
))
(declare-fun lt!479335 () Unit!35576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69617 (_ BitVec 64) (_ BitVec 32)) Unit!35576)

(assert (=> b!1081545 (= lt!479335 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081546 () Bool)

(declare-fun res!720896 () Bool)

(assert (=> b!1081546 (=> (not res!720896) (not e!618176))))

(assert (=> b!1081546 (= res!720896 (and (= (size!34019 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34018 _keys!1070) (size!34019 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081547 () Bool)

(declare-fun res!720900 () Bool)

(assert (=> b!1081547 (=> (not res!720900) (not e!618176))))

(assert (=> b!1081547 (= res!720900 (= (select (arr!33482 _keys!1070) i!650) k!904))))

(declare-fun b!1081548 () Bool)

(declare-fun e!618174 () Bool)

(assert (=> b!1081548 (= e!618174 tp_is_empty!26335)))

(declare-fun b!1081549 () Bool)

(declare-fun mapRes!41257 () Bool)

(assert (=> b!1081549 (= e!618177 (and e!618178 mapRes!41257))))

(declare-fun condMapEmpty!41257 () Bool)

(declare-fun mapDefault!41257 () ValueCell!12458)

