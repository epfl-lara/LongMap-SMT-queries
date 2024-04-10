; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95852 () Bool)

(assert start!95852)

(declare-fun b_free!22505 () Bool)

(declare-fun b_next!22505 () Bool)

(assert (=> start!95852 (= b_free!22505 (not b_next!22505))))

(declare-fun tp!79363 () Bool)

(declare-fun b_and!35685 () Bool)

(assert (=> start!95852 (= tp!79363 b_and!35685)))

(declare-fun b!1084842 () Bool)

(declare-fun res!723249 () Bool)

(declare-fun e!619751 () Bool)

(assert (=> b!1084842 (=> (not res!723249) (not e!619751))))

(declare-datatypes ((array!69951 0))(
  ( (array!69952 (arr!33649 (Array (_ BitVec 32) (_ BitVec 64))) (size!34185 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69951)

(declare-datatypes ((List!23461 0))(
  ( (Nil!23458) (Cons!23457 (h!24666 (_ BitVec 64)) (t!33024 List!23461)) )
))
(declare-fun arrayNoDuplicates!0 (array!69951 (_ BitVec 32) List!23461) Bool)

(assert (=> b!1084842 (= res!723249 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23458))))

(declare-fun b!1084843 () Bool)

(declare-fun res!723254 () Bool)

(declare-fun e!619752 () Bool)

(assert (=> b!1084843 (=> (not res!723254) (not e!619752))))

(declare-fun lt!481005 () array!69951)

(assert (=> b!1084843 (= res!723254 (arrayNoDuplicates!0 lt!481005 #b00000000000000000000000000000000 Nil!23458))))

(declare-fun b!1084844 () Bool)

(declare-fun e!619749 () Bool)

(assert (=> b!1084844 (= e!619749 true)))

(declare-datatypes ((V!40469 0))(
  ( (V!40470 (val!13310 Int)) )
))
(declare-datatypes ((tuple2!16872 0))(
  ( (tuple2!16873 (_1!8447 (_ BitVec 64)) (_2!8447 V!40469)) )
))
(declare-datatypes ((List!23462 0))(
  ( (Nil!23459) (Cons!23458 (h!24667 tuple2!16872) (t!33025 List!23462)) )
))
(declare-datatypes ((ListLongMap!14841 0))(
  ( (ListLongMap!14842 (toList!7436 List!23462)) )
))
(declare-fun lt!481001 () ListLongMap!14841)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!481003 () ListLongMap!14841)

(declare-fun -!762 (ListLongMap!14841 (_ BitVec 64)) ListLongMap!14841)

(assert (=> b!1084844 (= (-!762 lt!481001 k!904) lt!481003)))

(declare-fun lt!481002 () ListLongMap!14841)

(declare-fun zeroValue!831 () V!40469)

(declare-datatypes ((Unit!35690 0))(
  ( (Unit!35691) )
))
(declare-fun lt!481004 () Unit!35690)

(declare-fun addRemoveCommutativeForDiffKeys!2 (ListLongMap!14841 (_ BitVec 64) V!40469 (_ BitVec 64)) Unit!35690)

(assert (=> b!1084844 (= lt!481004 (addRemoveCommutativeForDiffKeys!2 lt!481002 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!480999 () ListLongMap!14841)

(declare-fun lt!481006 () tuple2!16872)

(declare-fun +!3246 (ListLongMap!14841 tuple2!16872) ListLongMap!14841)

(assert (=> b!1084844 (= lt!480999 (+!3246 lt!481003 lt!481006))))

(declare-fun lt!480993 () ListLongMap!14841)

(declare-fun lt!480994 () tuple2!16872)

(assert (=> b!1084844 (= lt!481003 (+!3246 lt!480993 lt!480994))))

(declare-fun lt!480995 () ListLongMap!14841)

(assert (=> b!1084844 (= lt!480995 (+!3246 lt!481001 lt!481006))))

(assert (=> b!1084844 (= lt!481001 (+!3246 lt!481002 lt!480994))))

(declare-fun lt!480997 () ListLongMap!14841)

(assert (=> b!1084844 (= lt!480999 (+!3246 (+!3246 lt!480997 lt!480994) lt!481006))))

(declare-fun minValue!831 () V!40469)

(assert (=> b!1084844 (= lt!481006 (tuple2!16873 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1084844 (= lt!480994 (tuple2!16873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1084845 () Bool)

(declare-fun res!723258 () Bool)

(assert (=> b!1084845 (=> (not res!723258) (not e!619751))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084845 (= res!723258 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34185 _keys!1070))))))

(declare-fun b!1084846 () Bool)

(declare-fun res!723252 () Bool)

(assert (=> b!1084846 (=> (not res!723252) (not e!619751))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12544 0))(
  ( (ValueCellFull!12544 (v!15931 V!40469)) (EmptyCell!12544) )
))
(declare-datatypes ((array!69953 0))(
  ( (array!69954 (arr!33650 (Array (_ BitVec 32) ValueCell!12544)) (size!34186 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69953)

(assert (=> b!1084846 (= res!723252 (and (= (size!34186 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34185 _keys!1070) (size!34186 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084847 () Bool)

(assert (=> b!1084847 (= e!619752 (not e!619749))))

(declare-fun res!723250 () Bool)

(assert (=> b!1084847 (=> res!723250 e!619749)))

(assert (=> b!1084847 (= res!723250 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4223 (array!69951 array!69953 (_ BitVec 32) (_ BitVec 32) V!40469 V!40469 (_ BitVec 32) Int) ListLongMap!14841)

(assert (=> b!1084847 (= lt!480995 (getCurrentListMap!4223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480996 () array!69953)

(assert (=> b!1084847 (= lt!480999 (getCurrentListMap!4223 lt!481005 lt!480996 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084847 (and (= lt!480997 lt!480993) (= lt!480993 lt!480997))))

(assert (=> b!1084847 (= lt!480993 (-!762 lt!481002 k!904))))

(declare-fun lt!480998 () Unit!35690)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!42 (array!69951 array!69953 (_ BitVec 32) (_ BitVec 32) V!40469 V!40469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35690)

(assert (=> b!1084847 (= lt!480998 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!42 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3983 (array!69951 array!69953 (_ BitVec 32) (_ BitVec 32) V!40469 V!40469 (_ BitVec 32) Int) ListLongMap!14841)

(assert (=> b!1084847 (= lt!480997 (getCurrentListMapNoExtraKeys!3983 lt!481005 lt!480996 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2120 (Int (_ BitVec 64)) V!40469)

(assert (=> b!1084847 (= lt!480996 (array!69954 (store (arr!33650 _values!874) i!650 (ValueCellFull!12544 (dynLambda!2120 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34186 _values!874)))))

(assert (=> b!1084847 (= lt!481002 (getCurrentListMapNoExtraKeys!3983 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084847 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481000 () Unit!35690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69951 (_ BitVec 64) (_ BitVec 32)) Unit!35690)

(assert (=> b!1084847 (= lt!481000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1084848 () Bool)

(declare-fun res!723257 () Bool)

(assert (=> b!1084848 (=> (not res!723257) (not e!619751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084848 (= res!723257 (validKeyInArray!0 k!904))))

(declare-fun b!1084849 () Bool)

(declare-fun e!619754 () Bool)

(declare-fun tp_is_empty!26507 () Bool)

(assert (=> b!1084849 (= e!619754 tp_is_empty!26507)))

(declare-fun b!1084850 () Bool)

(declare-fun res!723251 () Bool)

(assert (=> b!1084850 (=> (not res!723251) (not e!619751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69951 (_ BitVec 32)) Bool)

(assert (=> b!1084850 (= res!723251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41515 () Bool)

(declare-fun mapRes!41515 () Bool)

(declare-fun tp!79364 () Bool)

(declare-fun e!619753 () Bool)

(assert (=> mapNonEmpty!41515 (= mapRes!41515 (and tp!79364 e!619753))))

(declare-fun mapRest!41515 () (Array (_ BitVec 32) ValueCell!12544))

(declare-fun mapKey!41515 () (_ BitVec 32))

(declare-fun mapValue!41515 () ValueCell!12544)

(assert (=> mapNonEmpty!41515 (= (arr!33650 _values!874) (store mapRest!41515 mapKey!41515 mapValue!41515))))

(declare-fun b!1084851 () Bool)

(assert (=> b!1084851 (= e!619753 tp_is_empty!26507)))

(declare-fun b!1084852 () Bool)

(assert (=> b!1084852 (= e!619751 e!619752)))

(declare-fun res!723253 () Bool)

(assert (=> b!1084852 (=> (not res!723253) (not e!619752))))

(assert (=> b!1084852 (= res!723253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481005 mask!1414))))

(assert (=> b!1084852 (= lt!481005 (array!69952 (store (arr!33649 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34185 _keys!1070)))))

(declare-fun b!1084853 () Bool)

(declare-fun res!723255 () Bool)

(assert (=> b!1084853 (=> (not res!723255) (not e!619751))))

(assert (=> b!1084853 (= res!723255 (= (select (arr!33649 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41515 () Bool)

(assert (=> mapIsEmpty!41515 mapRes!41515))

(declare-fun res!723256 () Bool)

(assert (=> start!95852 (=> (not res!723256) (not e!619751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95852 (= res!723256 (validMask!0 mask!1414))))

(assert (=> start!95852 e!619751))

(assert (=> start!95852 tp!79363))

(assert (=> start!95852 true))

(assert (=> start!95852 tp_is_empty!26507))

(declare-fun array_inv!25968 (array!69951) Bool)

(assert (=> start!95852 (array_inv!25968 _keys!1070)))

(declare-fun e!619750 () Bool)

(declare-fun array_inv!25969 (array!69953) Bool)

(assert (=> start!95852 (and (array_inv!25969 _values!874) e!619750)))

(declare-fun b!1084854 () Bool)

(assert (=> b!1084854 (= e!619750 (and e!619754 mapRes!41515))))

(declare-fun condMapEmpty!41515 () Bool)

(declare-fun mapDefault!41515 () ValueCell!12544)

