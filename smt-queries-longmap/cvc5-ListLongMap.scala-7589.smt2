; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95854 () Bool)

(assert start!95854)

(declare-fun b_free!22507 () Bool)

(declare-fun b_next!22507 () Bool)

(assert (=> start!95854 (= b_free!22507 (not b_next!22507))))

(declare-fun tp!79369 () Bool)

(declare-fun b_and!35689 () Bool)

(assert (=> start!95854 (= tp!79369 b_and!35689)))

(declare-fun b!1084885 () Bool)

(declare-fun res!723284 () Bool)

(declare-fun e!619777 () Bool)

(assert (=> b!1084885 (=> (not res!723284) (not e!619777))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69955 0))(
  ( (array!69956 (arr!33651 (Array (_ BitVec 32) (_ BitVec 64))) (size!34187 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69955)

(assert (=> b!1084885 (= res!723284 (= (select (arr!33651 _keys!1070) i!650) k!904))))

(declare-fun b!1084886 () Bool)

(declare-fun e!619774 () Bool)

(declare-fun e!619776 () Bool)

(assert (=> b!1084886 (= e!619774 (not e!619776))))

(declare-fun res!723287 () Bool)

(assert (=> b!1084886 (=> res!723287 e!619776)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084886 (= res!723287 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40473 0))(
  ( (V!40474 (val!13311 Int)) )
))
(declare-fun minValue!831 () V!40473)

(declare-fun zeroValue!831 () V!40473)

(declare-datatypes ((ValueCell!12545 0))(
  ( (ValueCellFull!12545 (v!15932 V!40473)) (EmptyCell!12545) )
))
(declare-datatypes ((array!69957 0))(
  ( (array!69958 (arr!33652 (Array (_ BitVec 32) ValueCell!12545)) (size!34188 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69957)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16874 0))(
  ( (tuple2!16875 (_1!8448 (_ BitVec 64)) (_2!8448 V!40473)) )
))
(declare-datatypes ((List!23463 0))(
  ( (Nil!23460) (Cons!23459 (h!24668 tuple2!16874) (t!33028 List!23463)) )
))
(declare-datatypes ((ListLongMap!14843 0))(
  ( (ListLongMap!14844 (toList!7437 List!23463)) )
))
(declare-fun lt!481053 () ListLongMap!14843)

(declare-fun getCurrentListMap!4224 (array!69955 array!69957 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) Int) ListLongMap!14843)

(assert (=> b!1084886 (= lt!481053 (getCurrentListMap!4224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481042 () array!69957)

(declare-fun lt!481046 () ListLongMap!14843)

(declare-fun lt!481055 () array!69955)

(assert (=> b!1084886 (= lt!481046 (getCurrentListMap!4224 lt!481055 lt!481042 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481045 () ListLongMap!14843)

(declare-fun lt!481041 () ListLongMap!14843)

(assert (=> b!1084886 (and (= lt!481045 lt!481041) (= lt!481041 lt!481045))))

(declare-fun lt!481054 () ListLongMap!14843)

(declare-fun -!763 (ListLongMap!14843 (_ BitVec 64)) ListLongMap!14843)

(assert (=> b!1084886 (= lt!481041 (-!763 lt!481054 k!904))))

(declare-datatypes ((Unit!35692 0))(
  ( (Unit!35693) )
))
(declare-fun lt!481052 () Unit!35692)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!43 (array!69955 array!69957 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35692)

(assert (=> b!1084886 (= lt!481052 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!43 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3984 (array!69955 array!69957 (_ BitVec 32) (_ BitVec 32) V!40473 V!40473 (_ BitVec 32) Int) ListLongMap!14843)

(assert (=> b!1084886 (= lt!481045 (getCurrentListMapNoExtraKeys!3984 lt!481055 lt!481042 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2121 (Int (_ BitVec 64)) V!40473)

(assert (=> b!1084886 (= lt!481042 (array!69958 (store (arr!33652 _values!874) i!650 (ValueCellFull!12545 (dynLambda!2121 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34188 _values!874)))))

(assert (=> b!1084886 (= lt!481054 (getCurrentListMapNoExtraKeys!3984 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084886 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481050 () Unit!35692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69955 (_ BitVec 64) (_ BitVec 32)) Unit!35692)

(assert (=> b!1084886 (= lt!481050 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1084887 () Bool)

(declare-fun e!619778 () Bool)

(declare-fun tp_is_empty!26509 () Bool)

(assert (=> b!1084887 (= e!619778 tp_is_empty!26509)))

(declare-fun b!1084888 () Bool)

(declare-fun res!723283 () Bool)

(assert (=> b!1084888 (=> (not res!723283) (not e!619777))))

(assert (=> b!1084888 (= res!723283 (and (= (size!34188 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34187 _keys!1070) (size!34188 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084889 () Bool)

(declare-fun res!723281 () Bool)

(assert (=> b!1084889 (=> (not res!723281) (not e!619777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69955 (_ BitVec 32)) Bool)

(assert (=> b!1084889 (= res!723281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41518 () Bool)

(declare-fun mapRes!41518 () Bool)

(declare-fun tp!79370 () Bool)

(assert (=> mapNonEmpty!41518 (= mapRes!41518 (and tp!79370 e!619778))))

(declare-fun mapKey!41518 () (_ BitVec 32))

(declare-fun mapRest!41518 () (Array (_ BitVec 32) ValueCell!12545))

(declare-fun mapValue!41518 () ValueCell!12545)

(assert (=> mapNonEmpty!41518 (= (arr!33652 _values!874) (store mapRest!41518 mapKey!41518 mapValue!41518))))

(declare-fun b!1084890 () Bool)

(declare-fun res!723289 () Bool)

(assert (=> b!1084890 (=> (not res!723289) (not e!619774))))

(declare-datatypes ((List!23464 0))(
  ( (Nil!23461) (Cons!23460 (h!24669 (_ BitVec 64)) (t!33029 List!23464)) )
))
(declare-fun arrayNoDuplicates!0 (array!69955 (_ BitVec 32) List!23464) Bool)

(assert (=> b!1084890 (= res!723289 (arrayNoDuplicates!0 lt!481055 #b00000000000000000000000000000000 Nil!23461))))

(declare-fun b!1084891 () Bool)

(assert (=> b!1084891 (= e!619777 e!619774)))

(declare-fun res!723290 () Bool)

(assert (=> b!1084891 (=> (not res!723290) (not e!619774))))

(assert (=> b!1084891 (= res!723290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481055 mask!1414))))

(assert (=> b!1084891 (= lt!481055 (array!69956 (store (arr!33651 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34187 _keys!1070)))))

(declare-fun b!1084892 () Bool)

(declare-fun res!723285 () Bool)

(assert (=> b!1084892 (=> (not res!723285) (not e!619777))))

(assert (=> b!1084892 (= res!723285 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34187 _keys!1070))))))

(declare-fun b!1084893 () Bool)

(declare-fun e!619771 () Bool)

(assert (=> b!1084893 (= e!619771 tp_is_empty!26509)))

(declare-fun b!1084894 () Bool)

(declare-fun e!619772 () Bool)

(assert (=> b!1084894 (= e!619772 (and e!619771 mapRes!41518))))

(declare-fun condMapEmpty!41518 () Bool)

(declare-fun mapDefault!41518 () ValueCell!12545)

