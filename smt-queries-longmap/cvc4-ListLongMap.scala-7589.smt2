; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95858 () Bool)

(assert start!95858)

(declare-fun b_free!22511 () Bool)

(declare-fun b_next!22511 () Bool)

(assert (=> start!95858 (= b_free!22511 (not b_next!22511))))

(declare-fun tp!79381 () Bool)

(declare-fun b_and!35697 () Bool)

(assert (=> start!95858 (= tp!79381 b_and!35697)))

(declare-fun b!1084973 () Bool)

(declare-fun e!619826 () Bool)

(assert (=> b!1084973 (= e!619826 true)))

(declare-datatypes ((V!40477 0))(
  ( (V!40478 (val!13313 Int)) )
))
(declare-datatypes ((tuple2!16878 0))(
  ( (tuple2!16879 (_1!8450 (_ BitVec 64)) (_2!8450 V!40477)) )
))
(declare-datatypes ((List!23467 0))(
  ( (Nil!23464) (Cons!23463 (h!24672 tuple2!16878) (t!33036 List!23467)) )
))
(declare-datatypes ((ListLongMap!14847 0))(
  ( (ListLongMap!14848 (toList!7439 List!23467)) )
))
(declare-fun lt!481147 () ListLongMap!14847)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!481154 () ListLongMap!14847)

(declare-fun lt!481153 () tuple2!16878)

(declare-fun -!765 (ListLongMap!14847 (_ BitVec 64)) ListLongMap!14847)

(declare-fun +!3248 (ListLongMap!14847 tuple2!16878) ListLongMap!14847)

(assert (=> b!1084973 (= (-!765 lt!481147 k!904) (+!3248 lt!481154 lt!481153))))

(declare-datatypes ((Unit!35696 0))(
  ( (Unit!35697) )
))
(declare-fun lt!481148 () Unit!35696)

(declare-fun minValue!831 () V!40477)

(declare-fun lt!481149 () ListLongMap!14847)

(declare-fun addRemoveCommutativeForDiffKeys!4 (ListLongMap!14847 (_ BitVec 64) V!40477 (_ BitVec 64)) Unit!35696)

(assert (=> b!1084973 (= lt!481148 (addRemoveCommutativeForDiffKeys!4 lt!481149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun mapNonEmpty!41524 () Bool)

(declare-fun mapRes!41524 () Bool)

(declare-fun tp!79382 () Bool)

(declare-fun e!619821 () Bool)

(assert (=> mapNonEmpty!41524 (= mapRes!41524 (and tp!79382 e!619821))))

(declare-fun mapKey!41524 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12547 0))(
  ( (ValueCellFull!12547 (v!15934 V!40477)) (EmptyCell!12547) )
))
(declare-fun mapRest!41524 () (Array (_ BitVec 32) ValueCell!12547))

(declare-datatypes ((array!69963 0))(
  ( (array!69964 (arr!33655 (Array (_ BitVec 32) ValueCell!12547)) (size!34191 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69963)

(declare-fun mapValue!41524 () ValueCell!12547)

(assert (=> mapNonEmpty!41524 (= (arr!33655 _values!874) (store mapRest!41524 mapKey!41524 mapValue!41524))))

(declare-fun b!1084974 () Bool)

(declare-fun res!723357 () Bool)

(declare-fun e!619822 () Bool)

(assert (=> b!1084974 (=> (not res!723357) (not e!619822))))

(declare-datatypes ((array!69965 0))(
  ( (array!69966 (arr!33656 (Array (_ BitVec 32) (_ BitVec 64))) (size!34192 (_ BitVec 32))) )
))
(declare-fun lt!481158 () array!69965)

(declare-datatypes ((List!23468 0))(
  ( (Nil!23465) (Cons!23464 (h!24673 (_ BitVec 64)) (t!33037 List!23468)) )
))
(declare-fun arrayNoDuplicates!0 (array!69965 (_ BitVec 32) List!23468) Bool)

(assert (=> b!1084974 (= res!723357 (arrayNoDuplicates!0 lt!481158 #b00000000000000000000000000000000 Nil!23465))))

(declare-fun b!1084975 () Bool)

(declare-fun res!723348 () Bool)

(declare-fun e!619820 () Bool)

(assert (=> b!1084975 (=> (not res!723348) (not e!619820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084975 (= res!723348 (validKeyInArray!0 k!904))))

(declare-fun res!723349 () Bool)

(assert (=> start!95858 (=> (not res!723349) (not e!619820))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95858 (= res!723349 (validMask!0 mask!1414))))

(assert (=> start!95858 e!619820))

(assert (=> start!95858 tp!79381))

(assert (=> start!95858 true))

(declare-fun tp_is_empty!26513 () Bool)

(assert (=> start!95858 tp_is_empty!26513))

(declare-fun _keys!1070 () array!69965)

(declare-fun array_inv!25972 (array!69965) Bool)

(assert (=> start!95858 (array_inv!25972 _keys!1070)))

(declare-fun e!619825 () Bool)

(declare-fun array_inv!25973 (array!69963) Bool)

(assert (=> start!95858 (and (array_inv!25973 _values!874) e!619825)))

(declare-fun b!1084976 () Bool)

(declare-fun e!619823 () Bool)

(assert (=> b!1084976 (= e!619823 e!619826)))

(declare-fun res!723347 () Bool)

(assert (=> b!1084976 (=> res!723347 e!619826)))

(assert (=> b!1084976 (= res!723347 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!481152 () ListLongMap!14847)

(assert (=> b!1084976 (= lt!481154 lt!481152)))

(assert (=> b!1084976 (= lt!481154 (-!765 lt!481149 k!904))))

(declare-fun lt!481151 () ListLongMap!14847)

(declare-fun lt!481144 () Unit!35696)

(declare-fun zeroValue!831 () V!40477)

(assert (=> b!1084976 (= lt!481144 (addRemoveCommutativeForDiffKeys!4 lt!481151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!481155 () ListLongMap!14847)

(assert (=> b!1084976 (= lt!481155 (+!3248 lt!481152 lt!481153))))

(declare-fun lt!481157 () ListLongMap!14847)

(declare-fun lt!481159 () tuple2!16878)

(assert (=> b!1084976 (= lt!481152 (+!3248 lt!481157 lt!481159))))

(declare-fun lt!481150 () ListLongMap!14847)

(assert (=> b!1084976 (= lt!481150 lt!481147)))

(assert (=> b!1084976 (= lt!481147 (+!3248 lt!481149 lt!481153))))

(assert (=> b!1084976 (= lt!481149 (+!3248 lt!481151 lt!481159))))

(declare-fun lt!481145 () ListLongMap!14847)

(assert (=> b!1084976 (= lt!481155 (+!3248 (+!3248 lt!481145 lt!481159) lt!481153))))

(assert (=> b!1084976 (= lt!481153 (tuple2!16879 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084976 (= lt!481159 (tuple2!16879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1084977 () Bool)

(assert (=> b!1084977 (= e!619822 (not e!619823))))

(declare-fun res!723350 () Bool)

(assert (=> b!1084977 (=> res!723350 e!619823)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084977 (= res!723350 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4226 (array!69965 array!69963 (_ BitVec 32) (_ BitVec 32) V!40477 V!40477 (_ BitVec 32) Int) ListLongMap!14847)

(assert (=> b!1084977 (= lt!481150 (getCurrentListMap!4226 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481156 () array!69963)

(assert (=> b!1084977 (= lt!481155 (getCurrentListMap!4226 lt!481158 lt!481156 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084977 (and (= lt!481145 lt!481157) (= lt!481157 lt!481145))))

(assert (=> b!1084977 (= lt!481157 (-!765 lt!481151 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!481143 () Unit!35696)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!45 (array!69965 array!69963 (_ BitVec 32) (_ BitVec 32) V!40477 V!40477 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35696)

(assert (=> b!1084977 (= lt!481143 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!45 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3986 (array!69965 array!69963 (_ BitVec 32) (_ BitVec 32) V!40477 V!40477 (_ BitVec 32) Int) ListLongMap!14847)

(assert (=> b!1084977 (= lt!481145 (getCurrentListMapNoExtraKeys!3986 lt!481158 lt!481156 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2123 (Int (_ BitVec 64)) V!40477)

(assert (=> b!1084977 (= lt!481156 (array!69964 (store (arr!33655 _values!874) i!650 (ValueCellFull!12547 (dynLambda!2123 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34191 _values!874)))))

(assert (=> b!1084977 (= lt!481151 (getCurrentListMapNoExtraKeys!3986 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084977 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481146 () Unit!35696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69965 (_ BitVec 64) (_ BitVec 32)) Unit!35696)

(assert (=> b!1084977 (= lt!481146 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1084978 () Bool)

(declare-fun e!619819 () Bool)

(assert (=> b!1084978 (= e!619825 (and e!619819 mapRes!41524))))

(declare-fun condMapEmpty!41524 () Bool)

(declare-fun mapDefault!41524 () ValueCell!12547)

