; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95314 () Bool)

(assert start!95314)

(declare-fun b!1076968 () Bool)

(declare-fun e!615669 () Bool)

(declare-fun tp_is_empty!26071 () Bool)

(assert (=> b!1076968 (= e!615669 tp_is_empty!26071)))

(declare-fun res!717693 () Bool)

(declare-fun e!615671 () Bool)

(assert (=> start!95314 (=> (not res!717693) (not e!615671))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95314 (= res!717693 (validMask!0 mask!1414))))

(assert (=> start!95314 e!615671))

(assert (=> start!95314 true))

(declare-datatypes ((V!39889 0))(
  ( (V!39890 (val!13092 Int)) )
))
(declare-datatypes ((ValueCell!12326 0))(
  ( (ValueCellFull!12326 (v!15711 V!39889)) (EmptyCell!12326) )
))
(declare-datatypes ((array!69089 0))(
  ( (array!69090 (arr!33227 (Array (_ BitVec 32) ValueCell!12326)) (size!33763 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69089)

(declare-fun e!615672 () Bool)

(declare-fun array_inv!25672 (array!69089) Bool)

(assert (=> start!95314 (and (array_inv!25672 _values!874) e!615672)))

(declare-datatypes ((array!69091 0))(
  ( (array!69092 (arr!33228 (Array (_ BitVec 32) (_ BitVec 64))) (size!33764 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69091)

(declare-fun array_inv!25673 (array!69091) Bool)

(assert (=> start!95314 (array_inv!25673 _keys!1070)))

(declare-fun mapNonEmpty!40834 () Bool)

(declare-fun mapRes!40834 () Bool)

(declare-fun tp!78296 () Bool)

(declare-fun e!615668 () Bool)

(assert (=> mapNonEmpty!40834 (= mapRes!40834 (and tp!78296 e!615668))))

(declare-fun mapRest!40834 () (Array (_ BitVec 32) ValueCell!12326))

(declare-fun mapKey!40834 () (_ BitVec 32))

(declare-fun mapValue!40834 () ValueCell!12326)

(assert (=> mapNonEmpty!40834 (= (arr!33227 _values!874) (store mapRest!40834 mapKey!40834 mapValue!40834))))

(declare-fun b!1076969 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1076969 (= e!615671 (and (= (size!33763 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33764 _keys!1070) (size!33763 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (not (= (size!33764 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)))))))

(declare-fun mapIsEmpty!40834 () Bool)

(assert (=> mapIsEmpty!40834 mapRes!40834))

(declare-fun b!1076970 () Bool)

(assert (=> b!1076970 (= e!615668 tp_is_empty!26071)))

(declare-fun b!1076971 () Bool)

(assert (=> b!1076971 (= e!615672 (and e!615669 mapRes!40834))))

(declare-fun condMapEmpty!40834 () Bool)

(declare-fun mapDefault!40834 () ValueCell!12326)

