; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96028 () Bool)

(assert start!96028)

(declare-fun b_free!22681 () Bool)

(declare-fun b_next!22681 () Bool)

(assert (=> start!96028 (= b_free!22681 (not b_next!22681))))

(declare-fun tp!79892 () Bool)

(declare-fun b_and!36037 () Bool)

(assert (=> start!96028 (= tp!79892 b_and!36037)))

(declare-fun res!726168 () Bool)

(declare-fun e!621866 () Bool)

(assert (=> start!96028 (=> (not res!726168) (not e!621866))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96028 (= res!726168 (validMask!0 mask!1414))))

(assert (=> start!96028 e!621866))

(assert (=> start!96028 tp!79892))

(assert (=> start!96028 true))

(declare-fun tp_is_empty!26683 () Bool)

(assert (=> start!96028 tp_is_empty!26683))

(declare-datatypes ((array!70291 0))(
  ( (array!70292 (arr!33819 (Array (_ BitVec 32) (_ BitVec 64))) (size!34355 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70291)

(declare-fun array_inv!26082 (array!70291) Bool)

(assert (=> start!96028 (array_inv!26082 _keys!1070)))

(declare-datatypes ((V!40705 0))(
  ( (V!40706 (val!13398 Int)) )
))
(declare-datatypes ((ValueCell!12632 0))(
  ( (ValueCellFull!12632 (v!16019 V!40705)) (EmptyCell!12632) )
))
(declare-datatypes ((array!70293 0))(
  ( (array!70294 (arr!33820 (Array (_ BitVec 32) ValueCell!12632)) (size!34356 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70293)

(declare-fun e!621862 () Bool)

(declare-fun array_inv!26083 (array!70293) Bool)

(assert (=> start!96028 (and (array_inv!26083 _values!874) e!621862)))

(declare-fun b!1088722 () Bool)

(declare-fun e!621860 () Bool)

(assert (=> b!1088722 (= e!621860 tp_is_empty!26683)))

(declare-fun b!1088723 () Bool)

(declare-fun res!726162 () Bool)

(declare-fun e!621859 () Bool)

(assert (=> b!1088723 (=> (not res!726162) (not e!621859))))

(declare-fun lt!485049 () array!70291)

(declare-datatypes ((List!23600 0))(
  ( (Nil!23597) (Cons!23596 (h!24805 (_ BitVec 64)) (t!33339 List!23600)) )
))
(declare-fun arrayNoDuplicates!0 (array!70291 (_ BitVec 32) List!23600) Bool)

(assert (=> b!1088723 (= res!726162 (arrayNoDuplicates!0 lt!485049 #b00000000000000000000000000000000 Nil!23597))))

(declare-fun b!1088724 () Bool)

(assert (=> b!1088724 (= e!621866 e!621859)))

(declare-fun res!726164 () Bool)

(assert (=> b!1088724 (=> (not res!726164) (not e!621859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70291 (_ BitVec 32)) Bool)

(assert (=> b!1088724 (= res!726164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485049 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088724 (= lt!485049 (array!70292 (store (arr!33819 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34355 _keys!1070)))))

(declare-fun b!1088725 () Bool)

(declare-fun e!621864 () Bool)

(declare-fun e!621865 () Bool)

(assert (=> b!1088725 (= e!621864 e!621865)))

(declare-fun res!726165 () Bool)

(assert (=> b!1088725 (=> res!726165 e!621865)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1088725 (= res!726165 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17012 0))(
  ( (tuple2!17013 (_1!8517 (_ BitVec 64)) (_2!8517 V!40705)) )
))
(declare-datatypes ((List!23601 0))(
  ( (Nil!23598) (Cons!23597 (h!24806 tuple2!17012) (t!33340 List!23601)) )
))
(declare-datatypes ((ListLongMap!14981 0))(
  ( (ListLongMap!14982 (toList!7506 List!23601)) )
))
(declare-fun lt!485048 () ListLongMap!14981)

(declare-fun lt!485056 () ListLongMap!14981)

(assert (=> b!1088725 (= lt!485048 lt!485056)))

(declare-fun lt!485051 () ListLongMap!14981)

(declare-fun lt!485050 () tuple2!17012)

(declare-fun +!3305 (ListLongMap!14981 tuple2!17012) ListLongMap!14981)

(assert (=> b!1088725 (= lt!485056 (+!3305 lt!485051 lt!485050))))

(declare-fun lt!485055 () ListLongMap!14981)

(declare-fun lt!485059 () ListLongMap!14981)

(assert (=> b!1088725 (= lt!485055 lt!485059)))

(declare-fun lt!485054 () ListLongMap!14981)

(assert (=> b!1088725 (= lt!485059 (+!3305 lt!485054 lt!485050))))

(declare-fun lt!485053 () ListLongMap!14981)

(assert (=> b!1088725 (= lt!485048 (+!3305 lt!485053 lt!485050))))

(declare-fun zeroValue!831 () V!40705)

(assert (=> b!1088725 (= lt!485050 (tuple2!17013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088726 () Bool)

(assert (=> b!1088726 (= e!621859 (not e!621864))))

(declare-fun res!726170 () Bool)

(assert (=> b!1088726 (=> res!726170 e!621864)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088726 (= res!726170 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!40705)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4279 (array!70291 array!70293 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) Int) ListLongMap!14981)

(assert (=> b!1088726 (= lt!485055 (getCurrentListMap!4279 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485057 () array!70293)

(assert (=> b!1088726 (= lt!485048 (getCurrentListMap!4279 lt!485049 lt!485057 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088726 (and (= lt!485053 lt!485051) (= lt!485051 lt!485053))))

(declare-fun -!831 (ListLongMap!14981 (_ BitVec 64)) ListLongMap!14981)

(assert (=> b!1088726 (= lt!485051 (-!831 lt!485054 k!904))))

(declare-datatypes ((Unit!35828 0))(
  ( (Unit!35829) )
))
(declare-fun lt!485058 () Unit!35828)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!98 (array!70291 array!70293 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35828)

(assert (=> b!1088726 (= lt!485058 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!98 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4039 (array!70291 array!70293 (_ BitVec 32) (_ BitVec 32) V!40705 V!40705 (_ BitVec 32) Int) ListLongMap!14981)

(assert (=> b!1088726 (= lt!485053 (getCurrentListMapNoExtraKeys!4039 lt!485049 lt!485057 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2176 (Int (_ BitVec 64)) V!40705)

(assert (=> b!1088726 (= lt!485057 (array!70294 (store (arr!33820 _values!874) i!650 (ValueCellFull!12632 (dynLambda!2176 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34356 _values!874)))))

(assert (=> b!1088726 (= lt!485054 (getCurrentListMapNoExtraKeys!4039 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088726 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485052 () Unit!35828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70291 (_ BitVec 64) (_ BitVec 32)) Unit!35828)

(assert (=> b!1088726 (= lt!485052 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088727 () Bool)

(declare-fun res!726161 () Bool)

(assert (=> b!1088727 (=> (not res!726161) (not e!621866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088727 (= res!726161 (validKeyInArray!0 k!904))))

(declare-fun b!1088728 () Bool)

(declare-fun e!621863 () Bool)

(assert (=> b!1088728 (= e!621863 tp_is_empty!26683)))

(declare-fun mapIsEmpty!41779 () Bool)

(declare-fun mapRes!41779 () Bool)

(assert (=> mapIsEmpty!41779 mapRes!41779))

(declare-fun mapNonEmpty!41779 () Bool)

(declare-fun tp!79891 () Bool)

(assert (=> mapNonEmpty!41779 (= mapRes!41779 (and tp!79891 e!621863))))

(declare-fun mapValue!41779 () ValueCell!12632)

(declare-fun mapRest!41779 () (Array (_ BitVec 32) ValueCell!12632))

(declare-fun mapKey!41779 () (_ BitVec 32))

(assert (=> mapNonEmpty!41779 (= (arr!33820 _values!874) (store mapRest!41779 mapKey!41779 mapValue!41779))))

(declare-fun b!1088729 () Bool)

(declare-fun res!726167 () Bool)

(assert (=> b!1088729 (=> (not res!726167) (not e!621866))))

(assert (=> b!1088729 (= res!726167 (= (select (arr!33819 _keys!1070) i!650) k!904))))

(declare-fun b!1088730 () Bool)

(assert (=> b!1088730 (= e!621862 (and e!621860 mapRes!41779))))

(declare-fun condMapEmpty!41779 () Bool)

(declare-fun mapDefault!41779 () ValueCell!12632)

