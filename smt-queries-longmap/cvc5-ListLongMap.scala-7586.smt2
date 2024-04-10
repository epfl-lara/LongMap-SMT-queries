; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95836 () Bool)

(assert start!95836)

(declare-fun b_free!22489 () Bool)

(declare-fun b_next!22489 () Bool)

(assert (=> start!95836 (= b_free!22489 (not b_next!22489))))

(declare-fun tp!79315 () Bool)

(declare-fun b_and!35653 () Bool)

(assert (=> start!95836 (= tp!79315 b_and!35653)))

(declare-fun b!1084503 () Bool)

(declare-fun e!619583 () Bool)

(declare-fun e!619582 () Bool)

(assert (=> b!1084503 (= e!619583 e!619582)))

(declare-fun res!722999 () Bool)

(assert (=> b!1084503 (=> (not res!722999) (not e!619582))))

(declare-datatypes ((array!69919 0))(
  ( (array!69920 (arr!33633 (Array (_ BitVec 32) (_ BitVec 64))) (size!34169 (_ BitVec 32))) )
))
(declare-fun lt!480733 () array!69919)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69919 (_ BitVec 32)) Bool)

(assert (=> b!1084503 (= res!722999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480733 mask!1414))))

(declare-fun _keys!1070 () array!69919)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084503 (= lt!480733 (array!69920 (store (arr!33633 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34169 _keys!1070)))))

(declare-fun mapNonEmpty!41491 () Bool)

(declare-fun mapRes!41491 () Bool)

(declare-fun tp!79316 () Bool)

(declare-fun e!619579 () Bool)

(assert (=> mapNonEmpty!41491 (= mapRes!41491 (and tp!79316 e!619579))))

(declare-datatypes ((V!40449 0))(
  ( (V!40450 (val!13302 Int)) )
))
(declare-datatypes ((ValueCell!12536 0))(
  ( (ValueCellFull!12536 (v!15923 V!40449)) (EmptyCell!12536) )
))
(declare-datatypes ((array!69921 0))(
  ( (array!69922 (arr!33634 (Array (_ BitVec 32) ValueCell!12536)) (size!34170 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69921)

(declare-fun mapValue!41491 () ValueCell!12536)

(declare-fun mapKey!41491 () (_ BitVec 32))

(declare-fun mapRest!41491 () (Array (_ BitVec 32) ValueCell!12536))

(assert (=> mapNonEmpty!41491 (= (arr!33634 _values!874) (store mapRest!41491 mapKey!41491 mapValue!41491))))

(declare-fun b!1084504 () Bool)

(declare-fun res!723001 () Bool)

(assert (=> b!1084504 (=> (not res!723001) (not e!619583))))

(assert (=> b!1084504 (= res!723001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084505 () Bool)

(declare-fun res!723003 () Bool)

(assert (=> b!1084505 (=> (not res!723003) (not e!619583))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084505 (= res!723003 (and (= (size!34170 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34169 _keys!1070) (size!34170 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084506 () Bool)

(declare-fun res!723002 () Bool)

(assert (=> b!1084506 (=> (not res!723002) (not e!619583))))

(assert (=> b!1084506 (= res!723002 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34169 _keys!1070))))))

(declare-fun res!723004 () Bool)

(assert (=> start!95836 (=> (not res!723004) (not e!619583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95836 (= res!723004 (validMask!0 mask!1414))))

(assert (=> start!95836 e!619583))

(assert (=> start!95836 tp!79315))

(assert (=> start!95836 true))

(declare-fun tp_is_empty!26491 () Bool)

(assert (=> start!95836 tp_is_empty!26491))

(declare-fun array_inv!25956 (array!69919) Bool)

(assert (=> start!95836 (array_inv!25956 _keys!1070)))

(declare-fun e!619578 () Bool)

(declare-fun array_inv!25957 (array!69921) Bool)

(assert (=> start!95836 (and (array_inv!25957 _values!874) e!619578)))

(declare-fun mapIsEmpty!41491 () Bool)

(assert (=> mapIsEmpty!41491 mapRes!41491))

(declare-fun b!1084507 () Bool)

(declare-fun res!723006 () Bool)

(assert (=> b!1084507 (=> (not res!723006) (not e!619583))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1084507 (= res!723006 (= (select (arr!33633 _keys!1070) i!650) k!904))))

(declare-fun b!1084508 () Bool)

(assert (=> b!1084508 (= e!619579 tp_is_empty!26491)))

(declare-fun b!1084509 () Bool)

(declare-fun res!722998 () Bool)

(assert (=> b!1084509 (=> (not res!722998) (not e!619583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084509 (= res!722998 (validKeyInArray!0 k!904))))

(declare-fun b!1084510 () Bool)

(assert (=> b!1084510 (= e!619582 (not (bvsle #b00000000000000000000000000000000 (size!34169 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40449)

(declare-fun lt!480726 () array!69921)

(declare-fun zeroValue!831 () V!40449)

(declare-datatypes ((tuple2!16860 0))(
  ( (tuple2!16861 (_1!8441 (_ BitVec 64)) (_2!8441 V!40449)) )
))
(declare-datatypes ((List!23449 0))(
  ( (Nil!23446) (Cons!23445 (h!24654 tuple2!16860) (t!32996 List!23449)) )
))
(declare-datatypes ((ListLongMap!14829 0))(
  ( (ListLongMap!14830 (toList!7430 List!23449)) )
))
(declare-fun lt!480728 () ListLongMap!14829)

(declare-fun getCurrentListMap!4218 (array!69919 array!69921 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) Int) ListLongMap!14829)

(assert (=> b!1084510 (= lt!480728 (getCurrentListMap!4218 lt!480733 lt!480726 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480727 () ListLongMap!14829)

(declare-fun lt!480730 () ListLongMap!14829)

(assert (=> b!1084510 (and (= lt!480727 lt!480730) (= lt!480730 lt!480727))))

(declare-fun lt!480731 () ListLongMap!14829)

(declare-fun -!757 (ListLongMap!14829 (_ BitVec 64)) ListLongMap!14829)

(assert (=> b!1084510 (= lt!480730 (-!757 lt!480731 k!904))))

(declare-datatypes ((Unit!35680 0))(
  ( (Unit!35681) )
))
(declare-fun lt!480729 () Unit!35680)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!37 (array!69919 array!69921 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35680)

(assert (=> b!1084510 (= lt!480729 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!37 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3978 (array!69919 array!69921 (_ BitVec 32) (_ BitVec 32) V!40449 V!40449 (_ BitVec 32) Int) ListLongMap!14829)

(assert (=> b!1084510 (= lt!480727 (getCurrentListMapNoExtraKeys!3978 lt!480733 lt!480726 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2115 (Int (_ BitVec 64)) V!40449)

(assert (=> b!1084510 (= lt!480726 (array!69922 (store (arr!33634 _values!874) i!650 (ValueCellFull!12536 (dynLambda!2115 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34170 _values!874)))))

(assert (=> b!1084510 (= lt!480731 (getCurrentListMapNoExtraKeys!3978 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084510 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480732 () Unit!35680)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69919 (_ BitVec 64) (_ BitVec 32)) Unit!35680)

(assert (=> b!1084510 (= lt!480732 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1084511 () Bool)

(declare-fun e!619581 () Bool)

(assert (=> b!1084511 (= e!619578 (and e!619581 mapRes!41491))))

(declare-fun condMapEmpty!41491 () Bool)

(declare-fun mapDefault!41491 () ValueCell!12536)

