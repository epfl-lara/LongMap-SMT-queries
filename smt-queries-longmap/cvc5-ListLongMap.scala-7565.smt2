; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95710 () Bool)

(assert start!95710)

(declare-fun b_free!22363 () Bool)

(declare-fun b_next!22363 () Bool)

(assert (=> start!95710 (= b_free!22363 (not b_next!22363))))

(declare-fun tp!78938 () Bool)

(declare-fun b_and!35401 () Bool)

(assert (=> start!95710 (= tp!78938 b_and!35401)))

(declare-fun b!1082109 () Bool)

(declare-fun res!721300 () Bool)

(declare-fun e!618448 () Bool)

(assert (=> b!1082109 (=> (not res!721300) (not e!618448))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69677 0))(
  ( (array!69678 (arr!33512 (Array (_ BitVec 32) (_ BitVec 64))) (size!34048 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69677)

(assert (=> b!1082109 (= res!721300 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34048 _keys!1070))))))

(declare-fun b!1082110 () Bool)

(declare-fun res!721297 () Bool)

(assert (=> b!1082110 (=> (not res!721297) (not e!618448))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69677 (_ BitVec 32)) Bool)

(assert (=> b!1082110 (= res!721297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41302 () Bool)

(declare-fun mapRes!41302 () Bool)

(declare-fun tp!78937 () Bool)

(declare-fun e!618447 () Bool)

(assert (=> mapNonEmpty!41302 (= mapRes!41302 (and tp!78937 e!618447))))

(declare-fun mapKey!41302 () (_ BitVec 32))

(declare-datatypes ((V!40281 0))(
  ( (V!40282 (val!13239 Int)) )
))
(declare-datatypes ((ValueCell!12473 0))(
  ( (ValueCellFull!12473 (v!15860 V!40281)) (EmptyCell!12473) )
))
(declare-fun mapValue!41302 () ValueCell!12473)

(declare-fun mapRest!41302 () (Array (_ BitVec 32) ValueCell!12473))

(declare-datatypes ((array!69679 0))(
  ( (array!69680 (arr!33513 (Array (_ BitVec 32) ValueCell!12473)) (size!34049 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69679)

(assert (=> mapNonEmpty!41302 (= (arr!33513 _values!874) (store mapRest!41302 mapKey!41302 mapValue!41302))))

(declare-fun b!1082111 () Bool)

(declare-fun e!618445 () Bool)

(declare-fun tp_is_empty!26365 () Bool)

(assert (=> b!1082111 (= e!618445 tp_is_empty!26365)))

(declare-fun b!1082112 () Bool)

(declare-fun res!721304 () Bool)

(assert (=> b!1082112 (=> (not res!721304) (not e!618448))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082112 (= res!721304 (and (= (size!34049 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34048 _keys!1070) (size!34049 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082113 () Bool)

(declare-fun res!721305 () Bool)

(assert (=> b!1082113 (=> (not res!721305) (not e!618448))))

(declare-datatypes ((List!23356 0))(
  ( (Nil!23353) (Cons!23352 (h!24561 (_ BitVec 64)) (t!32777 List!23356)) )
))
(declare-fun arrayNoDuplicates!0 (array!69677 (_ BitVec 32) List!23356) Bool)

(assert (=> b!1082113 (= res!721305 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23353))))

(declare-fun b!1082114 () Bool)

(declare-fun e!618444 () Bool)

(assert (=> b!1082114 (= e!618444 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40281)

(declare-fun lt!479512 () array!69677)

(declare-datatypes ((tuple2!16774 0))(
  ( (tuple2!16775 (_1!8398 (_ BitVec 64)) (_2!8398 V!40281)) )
))
(declare-datatypes ((List!23357 0))(
  ( (Nil!23354) (Cons!23353 (h!24562 tuple2!16774) (t!32778 List!23357)) )
))
(declare-datatypes ((ListLongMap!14743 0))(
  ( (ListLongMap!14744 (toList!7387 List!23357)) )
))
(declare-fun lt!479514 () ListLongMap!14743)

(declare-fun zeroValue!831 () V!40281)

(declare-fun getCurrentListMapNoExtraKeys!3935 (array!69677 array!69679 (_ BitVec 32) (_ BitVec 32) V!40281 V!40281 (_ BitVec 32) Int) ListLongMap!14743)

(declare-fun dynLambda!2072 (Int (_ BitVec 64)) V!40281)

(assert (=> b!1082114 (= lt!479514 (getCurrentListMapNoExtraKeys!3935 lt!479512 (array!69680 (store (arr!33513 _values!874) i!650 (ValueCellFull!12473 (dynLambda!2072 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34049 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479513 () ListLongMap!14743)

(assert (=> b!1082114 (= lt!479513 (getCurrentListMapNoExtraKeys!3935 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082114 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35594 0))(
  ( (Unit!35595) )
))
(declare-fun lt!479515 () Unit!35594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69677 (_ BitVec 64) (_ BitVec 32)) Unit!35594)

(assert (=> b!1082114 (= lt!479515 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1082115 () Bool)

(declare-fun res!721299 () Bool)

(assert (=> b!1082115 (=> (not res!721299) (not e!618444))))

(assert (=> b!1082115 (= res!721299 (arrayNoDuplicates!0 lt!479512 #b00000000000000000000000000000000 Nil!23353))))

(declare-fun res!721301 () Bool)

(assert (=> start!95710 (=> (not res!721301) (not e!618448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95710 (= res!721301 (validMask!0 mask!1414))))

(assert (=> start!95710 e!618448))

(assert (=> start!95710 tp!78938))

(assert (=> start!95710 true))

(assert (=> start!95710 tp_is_empty!26365))

(declare-fun array_inv!25870 (array!69677) Bool)

(assert (=> start!95710 (array_inv!25870 _keys!1070)))

(declare-fun e!618449 () Bool)

(declare-fun array_inv!25871 (array!69679) Bool)

(assert (=> start!95710 (and (array_inv!25871 _values!874) e!618449)))

(declare-fun b!1082116 () Bool)

(assert (=> b!1082116 (= e!618447 tp_is_empty!26365)))

(declare-fun b!1082117 () Bool)

(declare-fun res!721302 () Bool)

(assert (=> b!1082117 (=> (not res!721302) (not e!618448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082117 (= res!721302 (validKeyInArray!0 k!904))))

(declare-fun b!1082118 () Bool)

(assert (=> b!1082118 (= e!618449 (and e!618445 mapRes!41302))))

(declare-fun condMapEmpty!41302 () Bool)

(declare-fun mapDefault!41302 () ValueCell!12473)

