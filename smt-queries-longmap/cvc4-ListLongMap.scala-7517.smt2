; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95324 () Bool)

(assert start!95324)

(declare-fun b!1077028 () Bool)

(declare-fun e!615743 () Bool)

(declare-fun tp_is_empty!26081 () Bool)

(assert (=> b!1077028 (= e!615743 tp_is_empty!26081)))

(declare-fun mapNonEmpty!40849 () Bool)

(declare-fun mapRes!40849 () Bool)

(declare-fun tp!78311 () Bool)

(declare-fun e!615747 () Bool)

(assert (=> mapNonEmpty!40849 (= mapRes!40849 (and tp!78311 e!615747))))

(declare-datatypes ((V!39901 0))(
  ( (V!39902 (val!13097 Int)) )
))
(declare-datatypes ((ValueCell!12331 0))(
  ( (ValueCellFull!12331 (v!15716 V!39901)) (EmptyCell!12331) )
))
(declare-fun mapValue!40849 () ValueCell!12331)

(declare-datatypes ((array!69109 0))(
  ( (array!69110 (arr!33237 (Array (_ BitVec 32) ValueCell!12331)) (size!33773 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69109)

(declare-fun mapKey!40849 () (_ BitVec 32))

(declare-fun mapRest!40849 () (Array (_ BitVec 32) ValueCell!12331))

(assert (=> mapNonEmpty!40849 (= (arr!33237 _values!874) (store mapRest!40849 mapKey!40849 mapValue!40849))))

(declare-fun b!1077029 () Bool)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun e!615744 () Bool)

(declare-datatypes ((array!69111 0))(
  ( (array!69112 (arr!33238 (Array (_ BitVec 32) (_ BitVec 64))) (size!33774 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69111)

(assert (=> b!1077029 (= e!615744 (and (= (size!33773 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33774 _keys!1070) (size!33773 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011) (= (size!33774 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33774 _keys!1070))))))

(declare-fun b!1077030 () Bool)

(declare-fun e!615745 () Bool)

(assert (=> b!1077030 (= e!615745 (and e!615743 mapRes!40849))))

(declare-fun condMapEmpty!40849 () Bool)

(declare-fun mapDefault!40849 () ValueCell!12331)

