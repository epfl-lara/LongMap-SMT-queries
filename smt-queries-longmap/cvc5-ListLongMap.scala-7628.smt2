; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96088 () Bool)

(assert start!96088)

(declare-fun b_free!22741 () Bool)

(declare-fun b_next!22741 () Bool)

(assert (=> start!96088 (= b_free!22741 (not b_next!22741))))

(declare-fun tp!80071 () Bool)

(declare-fun b_and!36157 () Bool)

(assert (=> start!96088 (= tp!80071 b_and!36157)))

(declare-fun b!1090051 () Bool)

(declare-fun e!622586 () Bool)

(declare-fun e!622579 () Bool)

(assert (=> b!1090051 (= e!622586 e!622579)))

(declare-fun res!727169 () Bool)

(assert (=> b!1090051 (=> (not res!727169) (not e!622579))))

(declare-datatypes ((array!70409 0))(
  ( (array!70410 (arr!33878 (Array (_ BitVec 32) (_ BitVec 64))) (size!34414 (_ BitVec 32))) )
))
(declare-fun lt!486195 () array!70409)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70409 (_ BitVec 32)) Bool)

(assert (=> b!1090051 (= res!727169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486195 mask!1414))))

(declare-fun _keys!1070 () array!70409)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090051 (= lt!486195 (array!70410 (store (arr!33878 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34414 _keys!1070)))))

(declare-fun b!1090052 () Bool)

(declare-fun e!622580 () Bool)

(declare-fun tp_is_empty!26743 () Bool)

(assert (=> b!1090052 (= e!622580 tp_is_empty!26743)))

(declare-fun b!1090053 () Bool)

(declare-fun res!727167 () Bool)

(assert (=> b!1090053 (=> (not res!727167) (not e!622586))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090053 (= res!727167 (validKeyInArray!0 k!904))))

(declare-fun b!1090054 () Bool)

(declare-fun e!622584 () Bool)

(assert (=> b!1090054 (= e!622579 (not e!622584))))

(declare-fun res!727162 () Bool)

(assert (=> b!1090054 (=> res!727162 e!622584)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090054 (= res!727162 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40785 0))(
  ( (V!40786 (val!13428 Int)) )
))
(declare-fun minValue!831 () V!40785)

(declare-fun zeroValue!831 () V!40785)

(declare-datatypes ((ValueCell!12662 0))(
  ( (ValueCellFull!12662 (v!16049 V!40785)) (EmptyCell!12662) )
))
(declare-datatypes ((array!70411 0))(
  ( (array!70412 (arr!33879 (Array (_ BitVec 32) ValueCell!12662)) (size!34415 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70411)

(declare-datatypes ((tuple2!17062 0))(
  ( (tuple2!17063 (_1!8542 (_ BitVec 64)) (_2!8542 V!40785)) )
))
(declare-datatypes ((List!23651 0))(
  ( (Nil!23648) (Cons!23647 (h!24856 tuple2!17062) (t!33450 List!23651)) )
))
(declare-datatypes ((ListLongMap!15031 0))(
  ( (ListLongMap!15032 (toList!7531 List!23651)) )
))
(declare-fun lt!486190 () ListLongMap!15031)

(declare-fun getCurrentListMap!4300 (array!70409 array!70411 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) Int) ListLongMap!15031)

(assert (=> b!1090054 (= lt!486190 (getCurrentListMap!4300 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486202 () ListLongMap!15031)

(declare-fun lt!486199 () array!70411)

(assert (=> b!1090054 (= lt!486202 (getCurrentListMap!4300 lt!486195 lt!486199 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486192 () ListLongMap!15031)

(declare-fun lt!486193 () ListLongMap!15031)

(assert (=> b!1090054 (and (= lt!486192 lt!486193) (= lt!486193 lt!486192))))

(declare-fun lt!486197 () ListLongMap!15031)

(declare-fun -!856 (ListLongMap!15031 (_ BitVec 64)) ListLongMap!15031)

(assert (=> b!1090054 (= lt!486193 (-!856 lt!486197 k!904))))

(declare-datatypes ((Unit!35878 0))(
  ( (Unit!35879) )
))
(declare-fun lt!486191 () Unit!35878)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!119 (array!70409 array!70411 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35878)

(assert (=> b!1090054 (= lt!486191 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!119 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4060 (array!70409 array!70411 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) Int) ListLongMap!15031)

(assert (=> b!1090054 (= lt!486192 (getCurrentListMapNoExtraKeys!4060 lt!486195 lt!486199 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2197 (Int (_ BitVec 64)) V!40785)

(assert (=> b!1090054 (= lt!486199 (array!70412 (store (arr!33879 _values!874) i!650 (ValueCellFull!12662 (dynLambda!2197 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34415 _values!874)))))

(assert (=> b!1090054 (= lt!486197 (getCurrentListMapNoExtraKeys!4060 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090054 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486201 () Unit!35878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70409 (_ BitVec 64) (_ BitVec 32)) Unit!35878)

(assert (=> b!1090054 (= lt!486201 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090055 () Bool)

(declare-fun res!727170 () Bool)

(assert (=> b!1090055 (=> (not res!727170) (not e!622586))))

(assert (=> b!1090055 (= res!727170 (= (select (arr!33878 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!41869 () Bool)

(declare-fun mapRes!41869 () Bool)

(declare-fun tp!80072 () Bool)

(declare-fun e!622583 () Bool)

(assert (=> mapNonEmpty!41869 (= mapRes!41869 (and tp!80072 e!622583))))

(declare-fun mapRest!41869 () (Array (_ BitVec 32) ValueCell!12662))

(declare-fun mapValue!41869 () ValueCell!12662)

(declare-fun mapKey!41869 () (_ BitVec 32))

(assert (=> mapNonEmpty!41869 (= (arr!33879 _values!874) (store mapRest!41869 mapKey!41869 mapValue!41869))))

(declare-fun b!1090056 () Bool)

(declare-fun e!622582 () Bool)

(assert (=> b!1090056 (= e!622584 e!622582)))

(declare-fun res!727168 () Bool)

(assert (=> b!1090056 (=> res!727168 e!622582)))

(assert (=> b!1090056 (= res!727168 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!486194 () ListLongMap!15031)

(assert (=> b!1090056 (= lt!486190 lt!486194)))

(declare-fun lt!486200 () tuple2!17062)

(declare-fun +!3322 (ListLongMap!15031 tuple2!17062) ListLongMap!15031)

(assert (=> b!1090056 (= lt!486194 (+!3322 lt!486197 lt!486200))))

(declare-fun lt!486196 () ListLongMap!15031)

(assert (=> b!1090056 (= lt!486202 lt!486196)))

(assert (=> b!1090056 (= lt!486196 (+!3322 lt!486193 lt!486200))))

(assert (=> b!1090056 (= lt!486202 (+!3322 lt!486192 lt!486200))))

(assert (=> b!1090056 (= lt!486200 (tuple2!17063 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090057 () Bool)

(declare-fun res!727164 () Bool)

(assert (=> b!1090057 (=> (not res!727164) (not e!622586))))

(declare-datatypes ((List!23652 0))(
  ( (Nil!23649) (Cons!23648 (h!24857 (_ BitVec 64)) (t!33451 List!23652)) )
))
(declare-fun arrayNoDuplicates!0 (array!70409 (_ BitVec 32) List!23652) Bool)

(assert (=> b!1090057 (= res!727164 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23649))))

(declare-fun b!1090058 () Bool)

(assert (=> b!1090058 (= e!622582 true)))

(assert (=> b!1090058 (= (-!856 lt!486194 k!904) lt!486196)))

(declare-fun lt!486198 () Unit!35878)

(declare-fun addRemoveCommutativeForDiffKeys!80 (ListLongMap!15031 (_ BitVec 64) V!40785 (_ BitVec 64)) Unit!35878)

(assert (=> b!1090058 (= lt!486198 (addRemoveCommutativeForDiffKeys!80 lt!486197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090059 () Bool)

(assert (=> b!1090059 (= e!622583 tp_is_empty!26743)))

(declare-fun b!1090060 () Bool)

(declare-fun res!727161 () Bool)

(assert (=> b!1090060 (=> (not res!727161) (not e!622586))))

(assert (=> b!1090060 (= res!727161 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34414 _keys!1070))))))

(declare-fun b!1090061 () Bool)

(declare-fun res!727163 () Bool)

(assert (=> b!1090061 (=> (not res!727163) (not e!622579))))

(assert (=> b!1090061 (= res!727163 (arrayNoDuplicates!0 lt!486195 #b00000000000000000000000000000000 Nil!23649))))

(declare-fun b!1090062 () Bool)

(declare-fun e!622585 () Bool)

(assert (=> b!1090062 (= e!622585 (and e!622580 mapRes!41869))))

(declare-fun condMapEmpty!41869 () Bool)

(declare-fun mapDefault!41869 () ValueCell!12662)

