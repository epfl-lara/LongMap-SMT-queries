; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95644 () Bool)

(assert start!95644)

(declare-fun b_free!22297 () Bool)

(declare-fun b_next!22297 () Bool)

(assert (=> start!95644 (= b_free!22297 (not b_next!22297))))

(declare-fun tp!78739 () Bool)

(declare-fun b_and!35275 () Bool)

(assert (=> start!95644 (= tp!78739 b_and!35275)))

(declare-fun b!1080861 () Bool)

(declare-fun res!720409 () Bool)

(declare-fun e!617851 () Bool)

(assert (=> b!1080861 (=> (not res!720409) (not e!617851))))

(declare-datatypes ((array!69549 0))(
  ( (array!69550 (arr!33448 (Array (_ BitVec 32) (_ BitVec 64))) (size!33984 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69549)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69549 (_ BitVec 32)) Bool)

(assert (=> b!1080861 (= res!720409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720407 () Bool)

(assert (=> start!95644 (=> (not res!720407) (not e!617851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95644 (= res!720407 (validMask!0 mask!1414))))

(assert (=> start!95644 e!617851))

(assert (=> start!95644 tp!78739))

(assert (=> start!95644 true))

(declare-fun tp_is_empty!26299 () Bool)

(assert (=> start!95644 tp_is_empty!26299))

(declare-fun array_inv!25824 (array!69549) Bool)

(assert (=> start!95644 (array_inv!25824 _keys!1070)))

(declare-datatypes ((V!40193 0))(
  ( (V!40194 (val!13206 Int)) )
))
(declare-datatypes ((ValueCell!12440 0))(
  ( (ValueCellFull!12440 (v!15827 V!40193)) (EmptyCell!12440) )
))
(declare-datatypes ((array!69551 0))(
  ( (array!69552 (arr!33449 (Array (_ BitVec 32) ValueCell!12440)) (size!33985 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69551)

(declare-fun e!617855 () Bool)

(declare-fun array_inv!25825 (array!69551) Bool)

(assert (=> start!95644 (and (array_inv!25825 _values!874) e!617855)))

(declare-fun b!1080862 () Bool)

(declare-fun e!617854 () Bool)

(assert (=> b!1080862 (= e!617854 tp_is_empty!26299)))

(declare-fun mapNonEmpty!41203 () Bool)

(declare-fun mapRes!41203 () Bool)

(declare-fun tp!78740 () Bool)

(assert (=> mapNonEmpty!41203 (= mapRes!41203 (and tp!78740 e!617854))))

(declare-fun mapKey!41203 () (_ BitVec 32))

(declare-fun mapRest!41203 () (Array (_ BitVec 32) ValueCell!12440))

(declare-fun mapValue!41203 () ValueCell!12440)

(assert (=> mapNonEmpty!41203 (= (arr!33449 _values!874) (store mapRest!41203 mapKey!41203 mapValue!41203))))

(declare-fun b!1080863 () Bool)

(declare-fun e!617850 () Bool)

(assert (=> b!1080863 (= e!617850 (not (bvsle #b00000000000000000000000000000000 (size!33984 _keys!1070))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40193)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16726 0))(
  ( (tuple2!16727 (_1!8374 (_ BitVec 64)) (_2!8374 V!40193)) )
))
(declare-datatypes ((List!23308 0))(
  ( (Nil!23305) (Cons!23304 (h!24513 tuple2!16726) (t!32667 List!23308)) )
))
(declare-datatypes ((ListLongMap!14695 0))(
  ( (ListLongMap!14696 (toList!7363 List!23308)) )
))
(declare-fun lt!479124 () ListLongMap!14695)

(declare-fun zeroValue!831 () V!40193)

(declare-fun getCurrentListMapNoExtraKeys!3911 (array!69549 array!69551 (_ BitVec 32) (_ BitVec 32) V!40193 V!40193 (_ BitVec 32) Int) ListLongMap!14695)

(assert (=> b!1080863 (= lt!479124 (getCurrentListMapNoExtraKeys!3911 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080863 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35546 0))(
  ( (Unit!35547) )
))
(declare-fun lt!479125 () Unit!35546)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69549 (_ BitVec 64) (_ BitVec 32)) Unit!35546)

(assert (=> b!1080863 (= lt!479125 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080864 () Bool)

(declare-fun e!617852 () Bool)

(assert (=> b!1080864 (= e!617855 (and e!617852 mapRes!41203))))

(declare-fun condMapEmpty!41203 () Bool)

(declare-fun mapDefault!41203 () ValueCell!12440)

