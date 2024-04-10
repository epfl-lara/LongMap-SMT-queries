; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95698 () Bool)

(assert start!95698)

(declare-fun b_free!22351 () Bool)

(declare-fun b_next!22351 () Bool)

(assert (=> start!95698 (= b_free!22351 (not b_next!22351))))

(declare-fun tp!78901 () Bool)

(declare-fun b_and!35377 () Bool)

(assert (=> start!95698 (= tp!78901 b_and!35377)))

(declare-fun res!721143 () Bool)

(declare-fun e!618341 () Bool)

(assert (=> start!95698 (=> (not res!721143) (not e!618341))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95698 (= res!721143 (validMask!0 mask!1414))))

(assert (=> start!95698 e!618341))

(assert (=> start!95698 tp!78901))

(assert (=> start!95698 true))

(declare-fun tp_is_empty!26353 () Bool)

(assert (=> start!95698 tp_is_empty!26353))

(declare-datatypes ((array!69653 0))(
  ( (array!69654 (arr!33500 (Array (_ BitVec 32) (_ BitVec 64))) (size!34036 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69653)

(declare-fun array_inv!25862 (array!69653) Bool)

(assert (=> start!95698 (array_inv!25862 _keys!1070)))

(declare-datatypes ((V!40265 0))(
  ( (V!40266 (val!13233 Int)) )
))
(declare-datatypes ((ValueCell!12467 0))(
  ( (ValueCellFull!12467 (v!15854 V!40265)) (EmptyCell!12467) )
))
(declare-datatypes ((array!69655 0))(
  ( (array!69656 (arr!33501 (Array (_ BitVec 32) ValueCell!12467)) (size!34037 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69655)

(declare-fun e!618339 () Bool)

(declare-fun array_inv!25863 (array!69655) Bool)

(assert (=> start!95698 (and (array_inv!25863 _values!874) e!618339)))

(declare-fun mapIsEmpty!41284 () Bool)

(declare-fun mapRes!41284 () Bool)

(assert (=> mapIsEmpty!41284 mapRes!41284))

(declare-fun b!1081881 () Bool)

(declare-fun res!721137 () Bool)

(assert (=> b!1081881 (=> (not res!721137) (not e!618341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69653 (_ BitVec 32)) Bool)

(assert (=> b!1081881 (= res!721137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081882 () Bool)

(declare-fun res!721136 () Bool)

(assert (=> b!1081882 (=> (not res!721136) (not e!618341))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1081882 (= res!721136 (= (select (arr!33500 _keys!1070) i!650) k!904))))

(declare-fun b!1081883 () Bool)

(declare-fun res!721142 () Bool)

(assert (=> b!1081883 (=> (not res!721142) (not e!618341))))

(declare-datatypes ((List!23348 0))(
  ( (Nil!23345) (Cons!23344 (h!24553 (_ BitVec 64)) (t!32757 List!23348)) )
))
(declare-fun arrayNoDuplicates!0 (array!69653 (_ BitVec 32) List!23348) Bool)

(assert (=> b!1081883 (= res!721142 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23345))))

(declare-fun b!1081884 () Bool)

(declare-fun res!721141 () Bool)

(assert (=> b!1081884 (=> (not res!721141) (not e!618341))))

(assert (=> b!1081884 (= res!721141 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34036 _keys!1070))))))

(declare-fun b!1081885 () Bool)

(declare-fun e!618338 () Bool)

(assert (=> b!1081885 (= e!618338 tp_is_empty!26353)))

(declare-fun b!1081886 () Bool)

(declare-fun e!618337 () Bool)

(assert (=> b!1081886 (= e!618337 (not true))))

(declare-fun lt!479441 () array!69653)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40265)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16768 0))(
  ( (tuple2!16769 (_1!8395 (_ BitVec 64)) (_2!8395 V!40265)) )
))
(declare-datatypes ((List!23349 0))(
  ( (Nil!23346) (Cons!23345 (h!24554 tuple2!16768) (t!32758 List!23349)) )
))
(declare-datatypes ((ListLongMap!14737 0))(
  ( (ListLongMap!14738 (toList!7384 List!23349)) )
))
(declare-fun lt!479443 () ListLongMap!14737)

(declare-fun zeroValue!831 () V!40265)

(declare-fun getCurrentListMapNoExtraKeys!3932 (array!69653 array!69655 (_ BitVec 32) (_ BitVec 32) V!40265 V!40265 (_ BitVec 32) Int) ListLongMap!14737)

(declare-fun dynLambda!2069 (Int (_ BitVec 64)) V!40265)

(assert (=> b!1081886 (= lt!479443 (getCurrentListMapNoExtraKeys!3932 lt!479441 (array!69656 (store (arr!33501 _values!874) i!650 (ValueCellFull!12467 (dynLambda!2069 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34037 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479440 () ListLongMap!14737)

(assert (=> b!1081886 (= lt!479440 (getCurrentListMapNoExtraKeys!3932 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081886 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35588 0))(
  ( (Unit!35589) )
))
(declare-fun lt!479442 () Unit!35588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69653 (_ BitVec 64) (_ BitVec 32)) Unit!35588)

(assert (=> b!1081886 (= lt!479442 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081887 () Bool)

(assert (=> b!1081887 (= e!618339 (and e!618338 mapRes!41284))))

(declare-fun condMapEmpty!41284 () Bool)

(declare-fun mapDefault!41284 () ValueCell!12467)

