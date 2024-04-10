; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95942 () Bool)

(assert start!95942)

(declare-fun b_free!22595 () Bool)

(declare-fun b_next!22595 () Bool)

(assert (=> start!95942 (= b_free!22595 (not b_next!22595))))

(declare-fun tp!79634 () Bool)

(declare-fun b_and!35865 () Bool)

(assert (=> start!95942 (= tp!79634 b_and!35865)))

(declare-fun mapIsEmpty!41650 () Bool)

(declare-fun mapRes!41650 () Bool)

(assert (=> mapIsEmpty!41650 mapRes!41650))

(declare-fun b!1086821 () Bool)

(declare-fun res!724739 () Bool)

(declare-fun e!620830 () Bool)

(assert (=> b!1086821 (=> (not res!724739) (not e!620830))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086821 (= res!724739 (validKeyInArray!0 k!904))))

(declare-fun b!1086822 () Bool)

(declare-fun res!724741 () Bool)

(declare-fun e!620827 () Bool)

(assert (=> b!1086822 (=> (not res!724741) (not e!620827))))

(declare-datatypes ((array!70125 0))(
  ( (array!70126 (arr!33736 (Array (_ BitVec 32) (_ BitVec 64))) (size!34272 (_ BitVec 32))) )
))
(declare-fun lt!483285 () array!70125)

(declare-datatypes ((List!23533 0))(
  ( (Nil!23530) (Cons!23529 (h!24738 (_ BitVec 64)) (t!33186 List!23533)) )
))
(declare-fun arrayNoDuplicates!0 (array!70125 (_ BitVec 32) List!23533) Bool)

(assert (=> b!1086822 (= res!724741 (arrayNoDuplicates!0 lt!483285 #b00000000000000000000000000000000 Nil!23530))))

(declare-fun b!1086823 () Bool)

(declare-fun res!724737 () Bool)

(assert (=> b!1086823 (=> (not res!724737) (not e!620830))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70125)

(assert (=> b!1086823 (= res!724737 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34272 _keys!1070))))))

(declare-fun b!1086824 () Bool)

(declare-fun res!724738 () Bool)

(assert (=> b!1086824 (=> (not res!724738) (not e!620830))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70125 (_ BitVec 32)) Bool)

(assert (=> b!1086824 (= res!724738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086825 () Bool)

(declare-fun e!620833 () Bool)

(assert (=> b!1086825 (= e!620827 (not e!620833))))

(declare-fun res!724735 () Bool)

(assert (=> b!1086825 (=> res!724735 e!620833)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086825 (= res!724735 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40589 0))(
  ( (V!40590 (val!13355 Int)) )
))
(declare-fun minValue!831 () V!40589)

(declare-datatypes ((tuple2!16944 0))(
  ( (tuple2!16945 (_1!8483 (_ BitVec 64)) (_2!8483 V!40589)) )
))
(declare-datatypes ((List!23534 0))(
  ( (Nil!23531) (Cons!23530 (h!24739 tuple2!16944) (t!33187 List!23534)) )
))
(declare-datatypes ((ListLongMap!14913 0))(
  ( (ListLongMap!14914 (toList!7472 List!23534)) )
))
(declare-fun lt!483294 () ListLongMap!14913)

(declare-fun zeroValue!831 () V!40589)

(declare-datatypes ((ValueCell!12589 0))(
  ( (ValueCellFull!12589 (v!15976 V!40589)) (EmptyCell!12589) )
))
(declare-datatypes ((array!70127 0))(
  ( (array!70128 (arr!33737 (Array (_ BitVec 32) ValueCell!12589)) (size!34273 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70127)

(declare-fun getCurrentListMap!4250 (array!70125 array!70127 (_ BitVec 32) (_ BitVec 32) V!40589 V!40589 (_ BitVec 32) Int) ListLongMap!14913)

(assert (=> b!1086825 (= lt!483294 (getCurrentListMap!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483286 () array!70127)

(declare-fun lt!483292 () ListLongMap!14913)

(assert (=> b!1086825 (= lt!483292 (getCurrentListMap!4250 lt!483285 lt!483286 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483295 () ListLongMap!14913)

(declare-fun lt!483296 () ListLongMap!14913)

(assert (=> b!1086825 (and (= lt!483295 lt!483296) (= lt!483296 lt!483295))))

(declare-fun lt!483300 () ListLongMap!14913)

(declare-fun -!798 (ListLongMap!14913 (_ BitVec 64)) ListLongMap!14913)

(assert (=> b!1086825 (= lt!483296 (-!798 lt!483300 k!904))))

(declare-datatypes ((Unit!35762 0))(
  ( (Unit!35763) )
))
(declare-fun lt!483298 () Unit!35762)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!69 (array!70125 array!70127 (_ BitVec 32) (_ BitVec 32) V!40589 V!40589 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35762)

(assert (=> b!1086825 (= lt!483298 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!69 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4010 (array!70125 array!70127 (_ BitVec 32) (_ BitVec 32) V!40589 V!40589 (_ BitVec 32) Int) ListLongMap!14913)

(assert (=> b!1086825 (= lt!483295 (getCurrentListMapNoExtraKeys!4010 lt!483285 lt!483286 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2147 (Int (_ BitVec 64)) V!40589)

(assert (=> b!1086825 (= lt!483286 (array!70128 (store (arr!33737 _values!874) i!650 (ValueCellFull!12589 (dynLambda!2147 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34273 _values!874)))))

(assert (=> b!1086825 (= lt!483300 (getCurrentListMapNoExtraKeys!4010 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086825 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!483299 () Unit!35762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70125 (_ BitVec 64) (_ BitVec 32)) Unit!35762)

(assert (=> b!1086825 (= lt!483299 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1086826 () Bool)

(declare-fun e!620828 () Bool)

(declare-fun tp_is_empty!26597 () Bool)

(assert (=> b!1086826 (= e!620828 tp_is_empty!26597)))

(declare-fun b!1086827 () Bool)

(declare-fun e!620831 () Bool)

(assert (=> b!1086827 (= e!620831 (and e!620828 mapRes!41650))))

(declare-fun condMapEmpty!41650 () Bool)

(declare-fun mapDefault!41650 () ValueCell!12589)

