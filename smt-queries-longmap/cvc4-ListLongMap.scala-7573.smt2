; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95762 () Bool)

(assert start!95762)

(declare-fun b_free!22415 () Bool)

(declare-fun b_next!22415 () Bool)

(assert (=> start!95762 (= b_free!22415 (not b_next!22415))))

(declare-fun tp!79094 () Bool)

(declare-fun b_and!35505 () Bool)

(assert (=> start!95762 (= tp!79094 b_and!35505)))

(declare-fun b!1083098 () Bool)

(declare-fun e!618913 () Bool)

(declare-fun e!618915 () Bool)

(assert (=> b!1083098 (= e!618913 e!618915)))

(declare-fun res!722003 () Bool)

(assert (=> b!1083098 (=> (not res!722003) (not e!618915))))

(declare-datatypes ((array!69777 0))(
  ( (array!69778 (arr!33562 (Array (_ BitVec 32) (_ BitVec 64))) (size!34098 (_ BitVec 32))) )
))
(declare-fun lt!479913 () array!69777)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69777 (_ BitVec 32)) Bool)

(assert (=> b!1083098 (= res!722003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479913 mask!1414))))

(declare-fun _keys!1070 () array!69777)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083098 (= lt!479913 (array!69778 (store (arr!33562 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34098 _keys!1070)))))

(declare-fun b!1083099 () Bool)

(declare-fun res!722005 () Bool)

(assert (=> b!1083099 (=> (not res!722005) (not e!618913))))

(declare-datatypes ((List!23393 0))(
  ( (Nil!23390) (Cons!23389 (h!24598 (_ BitVec 64)) (t!32866 List!23393)) )
))
(declare-fun arrayNoDuplicates!0 (array!69777 (_ BitVec 32) List!23393) Bool)

(assert (=> b!1083099 (= res!722005 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23390))))

(declare-fun mapNonEmpty!41380 () Bool)

(declare-fun mapRes!41380 () Bool)

(declare-fun tp!79093 () Bool)

(declare-fun e!618917 () Bool)

(assert (=> mapNonEmpty!41380 (= mapRes!41380 (and tp!79093 e!618917))))

(declare-fun mapKey!41380 () (_ BitVec 32))

(declare-datatypes ((V!40349 0))(
  ( (V!40350 (val!13265 Int)) )
))
(declare-datatypes ((ValueCell!12499 0))(
  ( (ValueCellFull!12499 (v!15886 V!40349)) (EmptyCell!12499) )
))
(declare-fun mapRest!41380 () (Array (_ BitVec 32) ValueCell!12499))

(declare-fun mapValue!41380 () ValueCell!12499)

(declare-datatypes ((array!69779 0))(
  ( (array!69780 (arr!33563 (Array (_ BitVec 32) ValueCell!12499)) (size!34099 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69779)

(assert (=> mapNonEmpty!41380 (= (arr!33563 _values!874) (store mapRest!41380 mapKey!41380 mapValue!41380))))

(declare-fun b!1083100 () Bool)

(assert (=> b!1083100 (= e!618915 (not true))))

(declare-datatypes ((tuple2!16806 0))(
  ( (tuple2!16807 (_1!8414 (_ BitVec 64)) (_2!8414 V!40349)) )
))
(declare-datatypes ((List!23394 0))(
  ( (Nil!23391) (Cons!23390 (h!24599 tuple2!16806) (t!32867 List!23394)) )
))
(declare-datatypes ((ListLongMap!14775 0))(
  ( (ListLongMap!14776 (toList!7403 List!23394)) )
))
(declare-fun lt!479912 () ListLongMap!14775)

(declare-fun lt!479917 () ListLongMap!14775)

(assert (=> b!1083100 (and (= lt!479912 lt!479917) (= lt!479917 lt!479912))))

(declare-fun lt!479916 () ListLongMap!14775)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!730 (ListLongMap!14775 (_ BitVec 64)) ListLongMap!14775)

(assert (=> b!1083100 (= lt!479917 (-!730 lt!479916 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40349)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40349)

(declare-datatypes ((Unit!35626 0))(
  ( (Unit!35627) )
))
(declare-fun lt!479915 () Unit!35626)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!10 (array!69777 array!69779 (_ BitVec 32) (_ BitVec 32) V!40349 V!40349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35626)

(assert (=> b!1083100 (= lt!479915 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!10 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3951 (array!69777 array!69779 (_ BitVec 32) (_ BitVec 32) V!40349 V!40349 (_ BitVec 32) Int) ListLongMap!14775)

(declare-fun dynLambda!2088 (Int (_ BitVec 64)) V!40349)

(assert (=> b!1083100 (= lt!479912 (getCurrentListMapNoExtraKeys!3951 lt!479913 (array!69780 (store (arr!33563 _values!874) i!650 (ValueCellFull!12499 (dynLambda!2088 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34099 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1083100 (= lt!479916 (getCurrentListMapNoExtraKeys!3951 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1083100 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479914 () Unit!35626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69777 (_ BitVec 64) (_ BitVec 32)) Unit!35626)

(assert (=> b!1083100 (= lt!479914 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1083101 () Bool)

(declare-fun res!722002 () Bool)

(assert (=> b!1083101 (=> (not res!722002) (not e!618913))))

(assert (=> b!1083101 (= res!722002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41380 () Bool)

(assert (=> mapIsEmpty!41380 mapRes!41380))

(declare-fun b!1083102 () Bool)

(declare-fun res!722007 () Bool)

(assert (=> b!1083102 (=> (not res!722007) (not e!618913))))

(assert (=> b!1083102 (= res!722007 (= (select (arr!33562 _keys!1070) i!650) k!904))))

(declare-fun b!1083097 () Bool)

(declare-fun res!722006 () Bool)

(assert (=> b!1083097 (=> (not res!722006) (not e!618915))))

(assert (=> b!1083097 (= res!722006 (arrayNoDuplicates!0 lt!479913 #b00000000000000000000000000000000 Nil!23390))))

(declare-fun res!722000 () Bool)

(assert (=> start!95762 (=> (not res!722000) (not e!618913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95762 (= res!722000 (validMask!0 mask!1414))))

(assert (=> start!95762 e!618913))

(assert (=> start!95762 tp!79094))

(assert (=> start!95762 true))

(declare-fun tp_is_empty!26417 () Bool)

(assert (=> start!95762 tp_is_empty!26417))

(declare-fun array_inv!25902 (array!69777) Bool)

(assert (=> start!95762 (array_inv!25902 _keys!1070)))

(declare-fun e!618914 () Bool)

(declare-fun array_inv!25903 (array!69779) Bool)

(assert (=> start!95762 (and (array_inv!25903 _values!874) e!618914)))

(declare-fun b!1083103 () Bool)

(declare-fun res!721999 () Bool)

(assert (=> b!1083103 (=> (not res!721999) (not e!618913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083103 (= res!721999 (validKeyInArray!0 k!904))))

(declare-fun b!1083104 () Bool)

(declare-fun res!722004 () Bool)

(assert (=> b!1083104 (=> (not res!722004) (not e!618913))))

(assert (=> b!1083104 (= res!722004 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34098 _keys!1070))))))

(declare-fun b!1083105 () Bool)

(assert (=> b!1083105 (= e!618917 tp_is_empty!26417)))

(declare-fun b!1083106 () Bool)

(declare-fun e!618916 () Bool)

(assert (=> b!1083106 (= e!618914 (and e!618916 mapRes!41380))))

(declare-fun condMapEmpty!41380 () Bool)

(declare-fun mapDefault!41380 () ValueCell!12499)

