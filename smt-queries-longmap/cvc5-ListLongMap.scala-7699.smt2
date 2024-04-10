; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96672 () Bool)

(assert start!96672)

(declare-fun b_free!23119 () Bool)

(declare-fun b_next!23119 () Bool)

(assert (=> start!96672 (= b_free!23119 (not b_next!23119))))

(declare-fun tp!81298 () Bool)

(declare-fun b_and!36971 () Bool)

(assert (=> start!96672 (= tp!81298 b_and!36971)))

(declare-fun mapNonEmpty!42529 () Bool)

(declare-fun mapRes!42529 () Bool)

(declare-fun tp!81299 () Bool)

(declare-fun e!627554 () Bool)

(assert (=> mapNonEmpty!42529 (= mapRes!42529 (and tp!81299 e!627554))))

(declare-datatypes ((V!41353 0))(
  ( (V!41354 (val!13641 Int)) )
))
(declare-datatypes ((ValueCell!12875 0))(
  ( (ValueCellFull!12875 (v!16267 V!41353)) (EmptyCell!12875) )
))
(declare-datatypes ((array!71253 0))(
  ( (array!71254 (arr!34293 (Array (_ BitVec 32) ValueCell!12875)) (size!34829 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71253)

(declare-fun mapKey!42529 () (_ BitVec 32))

(declare-fun mapValue!42529 () ValueCell!12875)

(declare-fun mapRest!42529 () (Array (_ BitVec 32) ValueCell!12875))

(assert (=> mapNonEmpty!42529 (= (arr!34293 _values!874) (store mapRest!42529 mapKey!42529 mapValue!42529))))

(declare-fun b!1099496 () Bool)

(declare-fun res!733724 () Bool)

(declare-fun e!627552 () Bool)

(assert (=> b!1099496 (=> (not res!733724) (not e!627552))))

(declare-datatypes ((array!71255 0))(
  ( (array!71256 (arr!34294 (Array (_ BitVec 32) (_ BitVec 64))) (size!34830 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71255)

(declare-datatypes ((List!23952 0))(
  ( (Nil!23949) (Cons!23948 (h!25157 (_ BitVec 64)) (t!34117 List!23952)) )
))
(declare-fun arrayNoDuplicates!0 (array!71255 (_ BitVec 32) List!23952) Bool)

(assert (=> b!1099496 (= res!733724 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23949))))

(declare-fun b!1099497 () Bool)

(declare-fun e!627553 () Bool)

(declare-fun tp_is_empty!27169 () Bool)

(assert (=> b!1099497 (= e!627553 tp_is_empty!27169)))

(declare-fun b!1099498 () Bool)

(declare-fun e!627555 () Bool)

(assert (=> b!1099498 (= e!627552 e!627555)))

(declare-fun res!733731 () Bool)

(assert (=> b!1099498 (=> (not res!733731) (not e!627555))))

(declare-fun lt!492348 () array!71255)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71255 (_ BitVec 32)) Bool)

(assert (=> b!1099498 (= res!733731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492348 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099498 (= lt!492348 (array!71256 (store (arr!34294 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34830 _keys!1070)))))

(declare-fun b!1099499 () Bool)

(declare-fun res!733728 () Bool)

(assert (=> b!1099499 (=> (not res!733728) (not e!627552))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099499 (= res!733728 (and (= (size!34829 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34830 _keys!1070) (size!34829 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099500 () Bool)

(declare-fun res!733732 () Bool)

(assert (=> b!1099500 (=> (not res!733732) (not e!627552))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099500 (= res!733732 (validKeyInArray!0 k!904))))

(declare-fun b!1099501 () Bool)

(declare-fun e!627549 () Bool)

(assert (=> b!1099501 (= e!627555 (not e!627549))))

(declare-fun res!733733 () Bool)

(assert (=> b!1099501 (=> res!733733 e!627549)))

(assert (=> b!1099501 (= res!733733 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41353)

(declare-datatypes ((tuple2!17334 0))(
  ( (tuple2!17335 (_1!8678 (_ BitVec 64)) (_2!8678 V!41353)) )
))
(declare-datatypes ((List!23953 0))(
  ( (Nil!23950) (Cons!23949 (h!25158 tuple2!17334) (t!34118 List!23953)) )
))
(declare-datatypes ((ListLongMap!15303 0))(
  ( (ListLongMap!15304 (toList!7667 List!23953)) )
))
(declare-fun lt!492345 () ListLongMap!15303)

(declare-fun zeroValue!831 () V!41353)

(declare-fun getCurrentListMap!4381 (array!71255 array!71253 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) Int) ListLongMap!15303)

(assert (=> b!1099501 (= lt!492345 (getCurrentListMap!4381 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492343 () array!71253)

(declare-fun lt!492344 () ListLongMap!15303)

(assert (=> b!1099501 (= lt!492344 (getCurrentListMap!4381 lt!492348 lt!492343 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492350 () ListLongMap!15303)

(declare-fun lt!492346 () ListLongMap!15303)

(assert (=> b!1099501 (and (= lt!492350 lt!492346) (= lt!492346 lt!492350))))

(declare-fun lt!492349 () ListLongMap!15303)

(declare-fun -!956 (ListLongMap!15303 (_ BitVec 64)) ListLongMap!15303)

(assert (=> b!1099501 (= lt!492346 (-!956 lt!492349 k!904))))

(declare-datatypes ((Unit!36154 0))(
  ( (Unit!36155) )
))
(declare-fun lt!492347 () Unit!36154)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!207 (array!71255 array!71253 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36154)

(assert (=> b!1099501 (= lt!492347 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!207 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4177 (array!71255 array!71253 (_ BitVec 32) (_ BitVec 32) V!41353 V!41353 (_ BitVec 32) Int) ListLongMap!15303)

(assert (=> b!1099501 (= lt!492350 (getCurrentListMapNoExtraKeys!4177 lt!492348 lt!492343 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2312 (Int (_ BitVec 64)) V!41353)

(assert (=> b!1099501 (= lt!492343 (array!71254 (store (arr!34293 _values!874) i!650 (ValueCellFull!12875 (dynLambda!2312 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34829 _values!874)))))

(assert (=> b!1099501 (= lt!492349 (getCurrentListMapNoExtraKeys!4177 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099501 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!492342 () Unit!36154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71255 (_ BitVec 64) (_ BitVec 32)) Unit!36154)

(assert (=> b!1099501 (= lt!492342 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1099502 () Bool)

(assert (=> b!1099502 (= e!627554 tp_is_empty!27169)))

(declare-fun res!733730 () Bool)

(assert (=> start!96672 (=> (not res!733730) (not e!627552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96672 (= res!733730 (validMask!0 mask!1414))))

(assert (=> start!96672 e!627552))

(assert (=> start!96672 tp!81298))

(assert (=> start!96672 true))

(assert (=> start!96672 tp_is_empty!27169))

(declare-fun array_inv!26416 (array!71255) Bool)

(assert (=> start!96672 (array_inv!26416 _keys!1070)))

(declare-fun e!627550 () Bool)

(declare-fun array_inv!26417 (array!71253) Bool)

(assert (=> start!96672 (and (array_inv!26417 _values!874) e!627550)))

(declare-fun lt!492341 () tuple2!17334)

(declare-fun b!1099503 () Bool)

(declare-fun +!3375 (ListLongMap!15303 tuple2!17334) ListLongMap!15303)

(assert (=> b!1099503 (= e!627549 (= lt!492345 (+!3375 lt!492349 lt!492341)))))

(assert (=> b!1099503 (= lt!492344 (+!3375 lt!492350 lt!492341))))

(assert (=> b!1099503 (= lt!492341 (tuple2!17335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099504 () Bool)

(assert (=> b!1099504 (= e!627550 (and e!627553 mapRes!42529))))

(declare-fun condMapEmpty!42529 () Bool)

(declare-fun mapDefault!42529 () ValueCell!12875)

