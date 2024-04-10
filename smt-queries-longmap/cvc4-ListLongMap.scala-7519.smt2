; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95350 () Bool)

(assert start!95350)

(declare-fun b!1077162 () Bool)

(declare-fun e!615856 () Bool)

(declare-fun tp_is_empty!26093 () Bool)

(assert (=> b!1077162 (= e!615856 tp_is_empty!26093)))

(declare-fun mapNonEmpty!40873 () Bool)

(declare-fun mapRes!40873 () Bool)

(declare-fun tp!78335 () Bool)

(assert (=> mapNonEmpty!40873 (= mapRes!40873 (and tp!78335 e!615856))))

(declare-datatypes ((V!39917 0))(
  ( (V!39918 (val!13103 Int)) )
))
(declare-datatypes ((ValueCell!12337 0))(
  ( (ValueCellFull!12337 (v!15722 V!39917)) (EmptyCell!12337) )
))
(declare-fun mapRest!40873 () (Array (_ BitVec 32) ValueCell!12337))

(declare-datatypes ((array!69133 0))(
  ( (array!69134 (arr!33247 (Array (_ BitVec 32) ValueCell!12337)) (size!33783 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69133)

(declare-fun mapKey!40873 () (_ BitVec 32))

(declare-fun mapValue!40873 () ValueCell!12337)

(assert (=> mapNonEmpty!40873 (= (arr!33247 _values!874) (store mapRest!40873 mapKey!40873 mapValue!40873))))

(declare-fun b!1077163 () Bool)

(declare-fun e!615858 () Bool)

(assert (=> b!1077163 (= e!615858 tp_is_empty!26093)))

(declare-fun mapIsEmpty!40873 () Bool)

(assert (=> mapIsEmpty!40873 mapRes!40873))

(declare-fun b!1077164 () Bool)

(declare-fun e!615857 () Bool)

(declare-datatypes ((array!69135 0))(
  ( (array!69136 (arr!33248 (Array (_ BitVec 32) (_ BitVec 64))) (size!33784 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69135)

(assert (=> b!1077164 (= e!615857 (and (bvsle #b00000000000000000000000000000000 (size!33784 _keys!1070)) (bvsge (size!33784 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077165 () Bool)

(declare-fun res!717766 () Bool)

(assert (=> b!1077165 (=> (not res!717766) (not e!615857))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077165 (= res!717766 (and (= (size!33783 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33784 _keys!1070) (size!33783 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077166 () Bool)

(declare-fun res!717767 () Bool)

(assert (=> b!1077166 (=> (not res!717767) (not e!615857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69135 (_ BitVec 32)) Bool)

(assert (=> b!1077166 (= res!717767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077167 () Bool)

(declare-fun e!615854 () Bool)

(assert (=> b!1077167 (= e!615854 (and e!615858 mapRes!40873))))

(declare-fun condMapEmpty!40873 () Bool)

(declare-fun mapDefault!40873 () ValueCell!12337)

