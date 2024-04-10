; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95674 () Bool)

(assert start!95674)

(declare-fun b_free!22327 () Bool)

(declare-fun b_next!22327 () Bool)

(assert (=> start!95674 (= b_free!22327 (not b_next!22327))))

(declare-fun tp!78829 () Bool)

(declare-fun b_and!35329 () Bool)

(assert (=> start!95674 (= tp!78829 b_and!35329)))

(declare-fun b!1081425 () Bool)

(declare-fun e!618123 () Bool)

(declare-fun e!618124 () Bool)

(assert (=> b!1081425 (= e!618123 e!618124)))

(declare-fun res!720815 () Bool)

(assert (=> b!1081425 (=> (not res!720815) (not e!618124))))

(declare-datatypes ((array!69605 0))(
  ( (array!69606 (arr!33476 (Array (_ BitVec 32) (_ BitVec 64))) (size!34012 (_ BitVec 32))) )
))
(declare-fun lt!479299 () array!69605)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69605 (_ BitVec 32)) Bool)

(assert (=> b!1081425 (= res!720815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479299 mask!1414))))

(declare-fun _keys!1070 () array!69605)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081425 (= lt!479299 (array!69606 (store (arr!33476 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34012 _keys!1070)))))

(declare-fun b!1081426 () Bool)

(declare-fun res!720819 () Bool)

(assert (=> b!1081426 (=> (not res!720819) (not e!618123))))

(assert (=> b!1081426 (= res!720819 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34012 _keys!1070))))))

(declare-fun b!1081427 () Bool)

(assert (=> b!1081427 (= e!618124 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40233 0))(
  ( (V!40234 (val!13221 Int)) )
))
(declare-datatypes ((ValueCell!12455 0))(
  ( (ValueCellFull!12455 (v!15842 V!40233)) (EmptyCell!12455) )
))
(declare-datatypes ((array!69607 0))(
  ( (array!69608 (arr!33477 (Array (_ BitVec 32) ValueCell!12455)) (size!34013 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69607)

(declare-fun minValue!831 () V!40233)

(declare-datatypes ((tuple2!16752 0))(
  ( (tuple2!16753 (_1!8387 (_ BitVec 64)) (_2!8387 V!40233)) )
))
(declare-datatypes ((List!23330 0))(
  ( (Nil!23327) (Cons!23326 (h!24535 tuple2!16752) (t!32715 List!23330)) )
))
(declare-datatypes ((ListLongMap!14721 0))(
  ( (ListLongMap!14722 (toList!7376 List!23330)) )
))
(declare-fun lt!479297 () ListLongMap!14721)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40233)

(declare-fun getCurrentListMapNoExtraKeys!3924 (array!69605 array!69607 (_ BitVec 32) (_ BitVec 32) V!40233 V!40233 (_ BitVec 32) Int) ListLongMap!14721)

(declare-fun dynLambda!2061 (Int (_ BitVec 64)) V!40233)

(assert (=> b!1081427 (= lt!479297 (getCurrentListMapNoExtraKeys!3924 lt!479299 (array!69608 (store (arr!33477 _values!874) i!650 (ValueCellFull!12455 (dynLambda!2061 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34013 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479298 () ListLongMap!14721)

(assert (=> b!1081427 (= lt!479298 (getCurrentListMapNoExtraKeys!3924 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081427 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35572 0))(
  ( (Unit!35573) )
))
(declare-fun lt!479296 () Unit!35572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69605 (_ BitVec 64) (_ BitVec 32)) Unit!35572)

(assert (=> b!1081427 (= lt!479296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081429 () Bool)

(declare-fun res!720813 () Bool)

(assert (=> b!1081429 (=> (not res!720813) (not e!618123))))

(assert (=> b!1081429 (= res!720813 (= (select (arr!33476 _keys!1070) i!650) k!904))))

(declare-fun b!1081430 () Bool)

(declare-fun res!720818 () Bool)

(assert (=> b!1081430 (=> (not res!720818) (not e!618123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081430 (= res!720818 (validKeyInArray!0 k!904))))

(declare-fun b!1081431 () Bool)

(declare-fun res!720812 () Bool)

(assert (=> b!1081431 (=> (not res!720812) (not e!618123))))

(declare-datatypes ((List!23331 0))(
  ( (Nil!23328) (Cons!23327 (h!24536 (_ BitVec 64)) (t!32716 List!23331)) )
))
(declare-fun arrayNoDuplicates!0 (array!69605 (_ BitVec 32) List!23331) Bool)

(assert (=> b!1081431 (= res!720812 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23328))))

(declare-fun b!1081432 () Bool)

(declare-fun e!618122 () Bool)

(declare-fun tp_is_empty!26329 () Bool)

(assert (=> b!1081432 (= e!618122 tp_is_empty!26329)))

(declare-fun b!1081433 () Bool)

(declare-fun e!618125 () Bool)

(assert (=> b!1081433 (= e!618125 tp_is_empty!26329)))

(declare-fun b!1081434 () Bool)

(declare-fun res!720817 () Bool)

(assert (=> b!1081434 (=> (not res!720817) (not e!618123))))

(assert (=> b!1081434 (= res!720817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081435 () Bool)

(declare-fun res!720811 () Bool)

(assert (=> b!1081435 (=> (not res!720811) (not e!618124))))

(assert (=> b!1081435 (= res!720811 (arrayNoDuplicates!0 lt!479299 #b00000000000000000000000000000000 Nil!23328))))

(declare-fun mapIsEmpty!41248 () Bool)

(declare-fun mapRes!41248 () Bool)

(assert (=> mapIsEmpty!41248 mapRes!41248))

(declare-fun mapNonEmpty!41248 () Bool)

(declare-fun tp!78830 () Bool)

(assert (=> mapNonEmpty!41248 (= mapRes!41248 (and tp!78830 e!618122))))

(declare-fun mapKey!41248 () (_ BitVec 32))

(declare-fun mapRest!41248 () (Array (_ BitVec 32) ValueCell!12455))

(declare-fun mapValue!41248 () ValueCell!12455)

(assert (=> mapNonEmpty!41248 (= (arr!33477 _values!874) (store mapRest!41248 mapKey!41248 mapValue!41248))))

(declare-fun b!1081436 () Bool)

(declare-fun res!720814 () Bool)

(assert (=> b!1081436 (=> (not res!720814) (not e!618123))))

(assert (=> b!1081436 (= res!720814 (and (= (size!34013 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34012 _keys!1070) (size!34013 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!720816 () Bool)

(assert (=> start!95674 (=> (not res!720816) (not e!618123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95674 (= res!720816 (validMask!0 mask!1414))))

(assert (=> start!95674 e!618123))

(assert (=> start!95674 tp!78829))

(assert (=> start!95674 true))

(assert (=> start!95674 tp_is_empty!26329))

(declare-fun array_inv!25842 (array!69605) Bool)

(assert (=> start!95674 (array_inv!25842 _keys!1070)))

(declare-fun e!618121 () Bool)

(declare-fun array_inv!25843 (array!69607) Bool)

(assert (=> start!95674 (and (array_inv!25843 _values!874) e!618121)))

(declare-fun b!1081428 () Bool)

(assert (=> b!1081428 (= e!618121 (and e!618125 mapRes!41248))))

(declare-fun condMapEmpty!41248 () Bool)

(declare-fun mapDefault!41248 () ValueCell!12455)

