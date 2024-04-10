; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96176 () Bool)

(assert start!96176)

(declare-fun b_free!22829 () Bool)

(declare-fun b_next!22829 () Bool)

(assert (=> start!96176 (= b_free!22829 (not b_next!22829))))

(declare-fun tp!80335 () Bool)

(declare-fun b_and!36333 () Bool)

(assert (=> start!96176 (= tp!80335 b_and!36333)))

(declare-fun b!1091987 () Bool)

(declare-fun e!623641 () Bool)

(declare-fun e!623638 () Bool)

(assert (=> b!1091987 (= e!623641 e!623638)))

(declare-fun res!728617 () Bool)

(assert (=> b!1091987 (=> res!728617 e!623638)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1091987 (= res!728617 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40901 0))(
  ( (V!40902 (val!13472 Int)) )
))
(declare-datatypes ((tuple2!17140 0))(
  ( (tuple2!17141 (_1!8581 (_ BitVec 64)) (_2!8581 V!40901)) )
))
(declare-datatypes ((List!23724 0))(
  ( (Nil!23721) (Cons!23720 (h!24929 tuple2!17140) (t!33611 List!23724)) )
))
(declare-datatypes ((ListLongMap!15109 0))(
  ( (ListLongMap!15110 (toList!7570 List!23724)) )
))
(declare-fun lt!487917 () ListLongMap!15109)

(declare-fun lt!487912 () ListLongMap!15109)

(assert (=> b!1091987 (= lt!487917 lt!487912)))

(declare-fun lt!487915 () ListLongMap!15109)

(declare-fun lt!487916 () tuple2!17140)

(declare-fun +!3351 (ListLongMap!15109 tuple2!17140) ListLongMap!15109)

(assert (=> b!1091987 (= lt!487912 (+!3351 lt!487915 lt!487916))))

(declare-fun lt!487908 () ListLongMap!15109)

(declare-fun lt!487913 () ListLongMap!15109)

(assert (=> b!1091987 (= lt!487908 lt!487913)))

(declare-fun lt!487918 () ListLongMap!15109)

(assert (=> b!1091987 (= lt!487913 (+!3351 lt!487918 lt!487916))))

(declare-fun lt!487906 () ListLongMap!15109)

(assert (=> b!1091987 (= lt!487908 (+!3351 lt!487906 lt!487916))))

(declare-fun minValue!831 () V!40901)

(assert (=> b!1091987 (= lt!487916 (tuple2!17141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091988 () Bool)

(declare-fun res!728616 () Bool)

(declare-fun e!623642 () Bool)

(assert (=> b!1091988 (=> (not res!728616) (not e!623642))))

(declare-datatypes ((array!70581 0))(
  ( (array!70582 (arr!33964 (Array (_ BitVec 32) (_ BitVec 64))) (size!34500 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70581)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091988 (= res!728616 (= (select (arr!33964 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!42001 () Bool)

(declare-fun mapRes!42001 () Bool)

(declare-fun tp!80336 () Bool)

(declare-fun e!623640 () Bool)

(assert (=> mapNonEmpty!42001 (= mapRes!42001 (and tp!80336 e!623640))))

(declare-datatypes ((ValueCell!12706 0))(
  ( (ValueCellFull!12706 (v!16093 V!40901)) (EmptyCell!12706) )
))
(declare-datatypes ((array!70583 0))(
  ( (array!70584 (arr!33965 (Array (_ BitVec 32) ValueCell!12706)) (size!34501 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70583)

(declare-fun mapRest!42001 () (Array (_ BitVec 32) ValueCell!12706))

(declare-fun mapKey!42001 () (_ BitVec 32))

(declare-fun mapValue!42001 () ValueCell!12706)

(assert (=> mapNonEmpty!42001 (= (arr!33965 _values!874) (store mapRest!42001 mapKey!42001 mapValue!42001))))

(declare-fun b!1091989 () Bool)

(declare-fun e!623637 () Bool)

(declare-fun tp_is_empty!26831 () Bool)

(assert (=> b!1091989 (= e!623637 tp_is_empty!26831)))

(declare-fun b!1091990 () Bool)

(declare-fun res!728621 () Bool)

(assert (=> b!1091990 (=> (not res!728621) (not e!623642))))

(declare-datatypes ((List!23725 0))(
  ( (Nil!23722) (Cons!23721 (h!24930 (_ BitVec 64)) (t!33612 List!23725)) )
))
(declare-fun arrayNoDuplicates!0 (array!70581 (_ BitVec 32) List!23725) Bool)

(assert (=> b!1091990 (= res!728621 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23722))))

(declare-fun res!728612 () Bool)

(assert (=> start!96176 (=> (not res!728612) (not e!623642))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96176 (= res!728612 (validMask!0 mask!1414))))

(assert (=> start!96176 e!623642))

(assert (=> start!96176 tp!80335))

(assert (=> start!96176 true))

(assert (=> start!96176 tp_is_empty!26831))

(declare-fun array_inv!26184 (array!70581) Bool)

(assert (=> start!96176 (array_inv!26184 _keys!1070)))

(declare-fun e!623639 () Bool)

(declare-fun array_inv!26185 (array!70583) Bool)

(assert (=> start!96176 (and (array_inv!26185 _values!874) e!623639)))

(declare-fun b!1091991 () Bool)

(assert (=> b!1091991 (= e!623640 tp_is_empty!26831)))

(declare-fun b!1091992 () Bool)

(declare-fun res!728619 () Bool)

(assert (=> b!1091992 (=> (not res!728619) (not e!623642))))

(assert (=> b!1091992 (= res!728619 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34500 _keys!1070))))))

(declare-fun mapIsEmpty!42001 () Bool)

(assert (=> mapIsEmpty!42001 mapRes!42001))

(declare-fun b!1091993 () Bool)

(declare-fun e!623636 () Bool)

(assert (=> b!1091993 (= e!623642 e!623636)))

(declare-fun res!728614 () Bool)

(assert (=> b!1091993 (=> (not res!728614) (not e!623636))))

(declare-fun lt!487909 () array!70581)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70581 (_ BitVec 32)) Bool)

(assert (=> b!1091993 (= res!728614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487909 mask!1414))))

(assert (=> b!1091993 (= lt!487909 (array!70582 (store (arr!33964 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34500 _keys!1070)))))

(declare-fun b!1091994 () Bool)

(assert (=> b!1091994 (= e!623638 true)))

(declare-fun -!890 (ListLongMap!15109 (_ BitVec 64)) ListLongMap!15109)

(assert (=> b!1091994 (= (-!890 lt!487912 k!904) lt!487913)))

(declare-datatypes ((Unit!35946 0))(
  ( (Unit!35947) )
))
(declare-fun lt!487910 () Unit!35946)

(declare-fun addRemoveCommutativeForDiffKeys!111 (ListLongMap!15109 (_ BitVec 64) V!40901 (_ BitVec 64)) Unit!35946)

(assert (=> b!1091994 (= lt!487910 (addRemoveCommutativeForDiffKeys!111 lt!487915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1091995 () Bool)

(assert (=> b!1091995 (= e!623636 (not e!623641))))

(declare-fun res!728620 () Bool)

(assert (=> b!1091995 (=> res!728620 e!623641)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091995 (= res!728620 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40901)

(declare-fun getCurrentListMap!4327 (array!70581 array!70583 (_ BitVec 32) (_ BitVec 32) V!40901 V!40901 (_ BitVec 32) Int) ListLongMap!15109)

(assert (=> b!1091995 (= lt!487917 (getCurrentListMap!4327 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487914 () array!70583)

(assert (=> b!1091995 (= lt!487908 (getCurrentListMap!4327 lt!487909 lt!487914 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1091995 (and (= lt!487906 lt!487918) (= lt!487918 lt!487906))))

(assert (=> b!1091995 (= lt!487918 (-!890 lt!487915 k!904))))

(declare-fun lt!487911 () Unit!35946)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!146 (array!70581 array!70583 (_ BitVec 32) (_ BitVec 32) V!40901 V!40901 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35946)

(assert (=> b!1091995 (= lt!487911 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!146 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4087 (array!70581 array!70583 (_ BitVec 32) (_ BitVec 32) V!40901 V!40901 (_ BitVec 32) Int) ListLongMap!15109)

(assert (=> b!1091995 (= lt!487906 (getCurrentListMapNoExtraKeys!4087 lt!487909 lt!487914 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2224 (Int (_ BitVec 64)) V!40901)

(assert (=> b!1091995 (= lt!487914 (array!70584 (store (arr!33965 _values!874) i!650 (ValueCellFull!12706 (dynLambda!2224 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34501 _values!874)))))

(assert (=> b!1091995 (= lt!487915 (getCurrentListMapNoExtraKeys!4087 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091995 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!487907 () Unit!35946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70581 (_ BitVec 64) (_ BitVec 32)) Unit!35946)

(assert (=> b!1091995 (= lt!487907 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1091996 () Bool)

(declare-fun res!728618 () Bool)

(assert (=> b!1091996 (=> (not res!728618) (not e!623636))))

(assert (=> b!1091996 (= res!728618 (arrayNoDuplicates!0 lt!487909 #b00000000000000000000000000000000 Nil!23722))))

(declare-fun b!1091997 () Bool)

(declare-fun res!728622 () Bool)

(assert (=> b!1091997 (=> (not res!728622) (not e!623642))))

(assert (=> b!1091997 (= res!728622 (and (= (size!34501 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34500 _keys!1070) (size!34501 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091998 () Bool)

(assert (=> b!1091998 (= e!623639 (and e!623637 mapRes!42001))))

(declare-fun condMapEmpty!42001 () Bool)

(declare-fun mapDefault!42001 () ValueCell!12706)

