; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95846 () Bool)

(assert start!95846)

(declare-fun b_free!22499 () Bool)

(declare-fun b_next!22499 () Bool)

(assert (=> start!95846 (= b_free!22499 (not b_next!22499))))

(declare-fun tp!79346 () Bool)

(declare-fun b_and!35673 () Bool)

(assert (=> start!95846 (= tp!79346 b_and!35673)))

(declare-fun b!1084717 () Bool)

(declare-fun res!723167 () Bool)

(declare-fun e!619689 () Bool)

(assert (=> b!1084717 (=> (not res!723167) (not e!619689))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69939 0))(
  ( (array!69940 (arr!33643 (Array (_ BitVec 32) (_ BitVec 64))) (size!34179 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69939)

(assert (=> b!1084717 (= res!723167 (= (select (arr!33643 _keys!1070) i!650) k!904))))

(declare-fun b!1084718 () Bool)

(declare-fun res!723163 () Bool)

(assert (=> b!1084718 (=> (not res!723163) (not e!619689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084718 (= res!723163 (validKeyInArray!0 k!904))))

(declare-fun b!1084719 () Bool)

(declare-fun e!619687 () Bool)

(assert (=> b!1084719 (= e!619689 e!619687)))

(declare-fun res!723161 () Bool)

(assert (=> b!1084719 (=> (not res!723161) (not e!619687))))

(declare-fun lt!480870 () array!69939)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69939 (_ BitVec 32)) Bool)

(assert (=> b!1084719 (= res!723161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480870 mask!1414))))

(assert (=> b!1084719 (= lt!480870 (array!69940 (store (arr!33643 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34179 _keys!1070)))))

(declare-fun b!1084720 () Bool)

(declare-fun e!619684 () Bool)

(assert (=> b!1084720 (= e!619687 (not e!619684))))

(declare-fun res!723165 () Bool)

(assert (=> b!1084720 (=> res!723165 e!619684)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1084720 (= res!723165 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40461 0))(
  ( (V!40462 (val!13307 Int)) )
))
(declare-fun minValue!831 () V!40461)

(declare-datatypes ((tuple2!16868 0))(
  ( (tuple2!16869 (_1!8445 (_ BitVec 64)) (_2!8445 V!40461)) )
))
(declare-datatypes ((List!23457 0))(
  ( (Nil!23454) (Cons!23453 (h!24662 tuple2!16868) (t!33014 List!23457)) )
))
(declare-datatypes ((ListLongMap!14837 0))(
  ( (ListLongMap!14838 (toList!7434 List!23457)) )
))
(declare-fun lt!480879 () ListLongMap!14837)

(declare-fun zeroValue!831 () V!40461)

(declare-datatypes ((ValueCell!12541 0))(
  ( (ValueCellFull!12541 (v!15928 V!40461)) (EmptyCell!12541) )
))
(declare-datatypes ((array!69941 0))(
  ( (array!69942 (arr!33644 (Array (_ BitVec 32) ValueCell!12541)) (size!34180 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69941)

(declare-fun getCurrentListMap!4221 (array!69939 array!69941 (_ BitVec 32) (_ BitVec 32) V!40461 V!40461 (_ BitVec 32) Int) ListLongMap!14837)

(assert (=> b!1084720 (= lt!480879 (getCurrentListMap!4221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480875 () ListLongMap!14837)

(declare-fun lt!480872 () array!69941)

(assert (=> b!1084720 (= lt!480875 (getCurrentListMap!4221 lt!480870 lt!480872 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480874 () ListLongMap!14837)

(declare-fun lt!480876 () ListLongMap!14837)

(assert (=> b!1084720 (and (= lt!480874 lt!480876) (= lt!480876 lt!480874))))

(declare-fun lt!480880 () ListLongMap!14837)

(declare-fun -!760 (ListLongMap!14837 (_ BitVec 64)) ListLongMap!14837)

(assert (=> b!1084720 (= lt!480876 (-!760 lt!480880 k!904))))

(declare-datatypes ((Unit!35686 0))(
  ( (Unit!35687) )
))
(declare-fun lt!480878 () Unit!35686)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!40 (array!69939 array!69941 (_ BitVec 32) (_ BitVec 32) V!40461 V!40461 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35686)

(assert (=> b!1084720 (= lt!480878 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!40 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3981 (array!69939 array!69941 (_ BitVec 32) (_ BitVec 32) V!40461 V!40461 (_ BitVec 32) Int) ListLongMap!14837)

(assert (=> b!1084720 (= lt!480874 (getCurrentListMapNoExtraKeys!3981 lt!480870 lt!480872 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2118 (Int (_ BitVec 64)) V!40461)

(assert (=> b!1084720 (= lt!480872 (array!69942 (store (arr!33644 _values!874) i!650 (ValueCellFull!12541 (dynLambda!2118 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34180 _values!874)))))

(assert (=> b!1084720 (= lt!480880 (getCurrentListMapNoExtraKeys!3981 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084720 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!480873 () Unit!35686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69939 (_ BitVec 64) (_ BitVec 32)) Unit!35686)

(assert (=> b!1084720 (= lt!480873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1084721 () Bool)

(declare-fun res!723164 () Bool)

(assert (=> b!1084721 (=> (not res!723164) (not e!619687))))

(declare-datatypes ((List!23458 0))(
  ( (Nil!23455) (Cons!23454 (h!24663 (_ BitVec 64)) (t!33015 List!23458)) )
))
(declare-fun arrayNoDuplicates!0 (array!69939 (_ BitVec 32) List!23458) Bool)

(assert (=> b!1084721 (= res!723164 (arrayNoDuplicates!0 lt!480870 #b00000000000000000000000000000000 Nil!23455))))

(declare-fun b!1084722 () Bool)

(declare-fun res!723162 () Bool)

(assert (=> b!1084722 (=> (not res!723162) (not e!619689))))

(assert (=> b!1084722 (= res!723162 (and (= (size!34180 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34179 _keys!1070) (size!34180 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084723 () Bool)

(declare-fun res!723166 () Bool)

(assert (=> b!1084723 (=> (not res!723166) (not e!619689))))

(assert (=> b!1084723 (= res!723166 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34179 _keys!1070))))))

(declare-fun e!619688 () Bool)

(declare-fun lt!480871 () tuple2!16868)

(declare-fun b!1084724 () Bool)

(declare-fun lt!480877 () tuple2!16868)

(declare-fun +!3244 (ListLongMap!14837 tuple2!16868) ListLongMap!14837)

(assert (=> b!1084724 (= e!619688 (= lt!480875 (+!3244 (+!3244 lt!480876 lt!480871) lt!480877)))))

(declare-fun b!1084725 () Bool)

(declare-fun e!619685 () Bool)

(declare-fun e!619691 () Bool)

(declare-fun mapRes!41506 () Bool)

(assert (=> b!1084725 (= e!619685 (and e!619691 mapRes!41506))))

(declare-fun condMapEmpty!41506 () Bool)

(declare-fun mapDefault!41506 () ValueCell!12541)

