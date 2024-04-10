; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96044 () Bool)

(assert start!96044)

(declare-fun b_free!22697 () Bool)

(declare-fun b_next!22697 () Bool)

(assert (=> start!96044 (= b_free!22697 (not b_next!22697))))

(declare-fun tp!79940 () Bool)

(declare-fun b_and!36069 () Bool)

(assert (=> start!96044 (= tp!79940 b_and!36069)))

(declare-fun b!1089074 () Bool)

(declare-fun res!726427 () Bool)

(declare-fun e!622057 () Bool)

(assert (=> b!1089074 (=> (not res!726427) (not e!622057))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089074 (= res!726427 (validKeyInArray!0 k!904))))

(declare-fun b!1089075 () Bool)

(declare-fun e!622056 () Bool)

(declare-fun e!622055 () Bool)

(assert (=> b!1089075 (= e!622056 e!622055)))

(declare-fun res!726425 () Bool)

(assert (=> b!1089075 (=> res!726425 e!622055)))

(assert (=> b!1089075 (= res!726425 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40725 0))(
  ( (V!40726 (val!13406 Int)) )
))
(declare-datatypes ((tuple2!17028 0))(
  ( (tuple2!17029 (_1!8525 (_ BitVec 64)) (_2!8525 V!40725)) )
))
(declare-datatypes ((List!23616 0))(
  ( (Nil!23613) (Cons!23612 (h!24821 tuple2!17028) (t!33371 List!23616)) )
))
(declare-datatypes ((ListLongMap!14997 0))(
  ( (ListLongMap!14998 (toList!7514 List!23616)) )
))
(declare-fun lt!485370 () ListLongMap!14997)

(declare-fun lt!485362 () ListLongMap!14997)

(assert (=> b!1089075 (= lt!485370 lt!485362)))

(declare-fun lt!485360 () ListLongMap!14997)

(declare-fun lt!485359 () tuple2!17028)

(declare-fun +!3311 (ListLongMap!14997 tuple2!17028) ListLongMap!14997)

(assert (=> b!1089075 (= lt!485362 (+!3311 lt!485360 lt!485359))))

(declare-fun lt!485361 () ListLongMap!14997)

(declare-fun lt!485369 () ListLongMap!14997)

(assert (=> b!1089075 (= lt!485361 lt!485369)))

(declare-fun lt!485365 () ListLongMap!14997)

(assert (=> b!1089075 (= lt!485369 (+!3311 lt!485365 lt!485359))))

(declare-fun lt!485368 () ListLongMap!14997)

(assert (=> b!1089075 (= lt!485370 (+!3311 lt!485368 lt!485359))))

(declare-fun zeroValue!831 () V!40725)

(assert (=> b!1089075 (= lt!485359 (tuple2!17029 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!726431 () Bool)

(assert (=> start!96044 (=> (not res!726431) (not e!622057))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96044 (= res!726431 (validMask!0 mask!1414))))

(assert (=> start!96044 e!622057))

(assert (=> start!96044 tp!79940))

(assert (=> start!96044 true))

(declare-fun tp_is_empty!26699 () Bool)

(assert (=> start!96044 tp_is_empty!26699))

(declare-datatypes ((array!70323 0))(
  ( (array!70324 (arr!33835 (Array (_ BitVec 32) (_ BitVec 64))) (size!34371 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70323)

(declare-fun array_inv!26096 (array!70323) Bool)

(assert (=> start!96044 (array_inv!26096 _keys!1070)))

(declare-datatypes ((ValueCell!12640 0))(
  ( (ValueCellFull!12640 (v!16027 V!40725)) (EmptyCell!12640) )
))
(declare-datatypes ((array!70325 0))(
  ( (array!70326 (arr!33836 (Array (_ BitVec 32) ValueCell!12640)) (size!34372 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70325)

(declare-fun e!622051 () Bool)

(declare-fun array_inv!26097 (array!70325) Bool)

(assert (=> start!96044 (and (array_inv!26097 _values!874) e!622051)))

(declare-fun b!1089076 () Bool)

(declare-fun res!726432 () Bool)

(assert (=> b!1089076 (=> (not res!726432) (not e!622057))))

(declare-datatypes ((List!23617 0))(
  ( (Nil!23614) (Cons!23613 (h!24822 (_ BitVec 64)) (t!33372 List!23617)) )
))
(declare-fun arrayNoDuplicates!0 (array!70323 (_ BitVec 32) List!23617) Bool)

(assert (=> b!1089076 (= res!726432 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23614))))

(declare-fun mapNonEmpty!41803 () Bool)

(declare-fun mapRes!41803 () Bool)

(declare-fun tp!79939 () Bool)

(declare-fun e!622053 () Bool)

(assert (=> mapNonEmpty!41803 (= mapRes!41803 (and tp!79939 e!622053))))

(declare-fun mapRest!41803 () (Array (_ BitVec 32) ValueCell!12640))

(declare-fun mapKey!41803 () (_ BitVec 32))

(declare-fun mapValue!41803 () ValueCell!12640)

(assert (=> mapNonEmpty!41803 (= (arr!33836 _values!874) (store mapRest!41803 mapKey!41803 mapValue!41803))))

(declare-fun mapIsEmpty!41803 () Bool)

(assert (=> mapIsEmpty!41803 mapRes!41803))

(declare-fun b!1089077 () Bool)

(declare-fun res!726430 () Bool)

(assert (=> b!1089077 (=> (not res!726430) (not e!622057))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089077 (= res!726430 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34371 _keys!1070))))))

(declare-fun b!1089078 () Bool)

(declare-fun e!622052 () Bool)

(assert (=> b!1089078 (= e!622057 e!622052)))

(declare-fun res!726435 () Bool)

(assert (=> b!1089078 (=> (not res!726435) (not e!622052))))

(declare-fun lt!485364 () array!70323)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70323 (_ BitVec 32)) Bool)

(assert (=> b!1089078 (= res!726435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485364 mask!1414))))

(assert (=> b!1089078 (= lt!485364 (array!70324 (store (arr!33835 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34371 _keys!1070)))))

(declare-fun b!1089079 () Bool)

(declare-fun res!726429 () Bool)

(assert (=> b!1089079 (=> (not res!726429) (not e!622057))))

(assert (=> b!1089079 (= res!726429 (= (select (arr!33835 _keys!1070) i!650) k!904))))

(declare-fun b!1089080 () Bool)

(declare-fun res!726426 () Bool)

(assert (=> b!1089080 (=> (not res!726426) (not e!622057))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089080 (= res!726426 (and (= (size!34372 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34371 _keys!1070) (size!34372 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089081 () Bool)

(declare-fun e!622058 () Bool)

(assert (=> b!1089081 (= e!622058 tp_is_empty!26699)))

(declare-fun b!1089082 () Bool)

(declare-fun res!726433 () Bool)

(assert (=> b!1089082 (=> (not res!726433) (not e!622057))))

(assert (=> b!1089082 (= res!726433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089083 () Bool)

(assert (=> b!1089083 (= e!622052 (not e!622056))))

(declare-fun res!726434 () Bool)

(assert (=> b!1089083 (=> res!726434 e!622056)))

(assert (=> b!1089083 (= res!726434 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40725)

(declare-fun getCurrentListMap!4287 (array!70323 array!70325 (_ BitVec 32) (_ BitVec 32) V!40725 V!40725 (_ BitVec 32) Int) ListLongMap!14997)

(assert (=> b!1089083 (= lt!485361 (getCurrentListMap!4287 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485366 () array!70325)

(assert (=> b!1089083 (= lt!485370 (getCurrentListMap!4287 lt!485364 lt!485366 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089083 (and (= lt!485368 lt!485360) (= lt!485360 lt!485368))))

(declare-fun -!839 (ListLongMap!14997 (_ BitVec 64)) ListLongMap!14997)

(assert (=> b!1089083 (= lt!485360 (-!839 lt!485365 k!904))))

(declare-datatypes ((Unit!35844 0))(
  ( (Unit!35845) )
))
(declare-fun lt!485371 () Unit!35844)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!106 (array!70323 array!70325 (_ BitVec 32) (_ BitVec 32) V!40725 V!40725 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35844)

(assert (=> b!1089083 (= lt!485371 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!106 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4047 (array!70323 array!70325 (_ BitVec 32) (_ BitVec 32) V!40725 V!40725 (_ BitVec 32) Int) ListLongMap!14997)

(assert (=> b!1089083 (= lt!485368 (getCurrentListMapNoExtraKeys!4047 lt!485364 lt!485366 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2184 (Int (_ BitVec 64)) V!40725)

(assert (=> b!1089083 (= lt!485366 (array!70326 (store (arr!33836 _values!874) i!650 (ValueCellFull!12640 (dynLambda!2184 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34372 _values!874)))))

(assert (=> b!1089083 (= lt!485365 (getCurrentListMapNoExtraKeys!4047 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089083 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485363 () Unit!35844)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70323 (_ BitVec 64) (_ BitVec 32)) Unit!35844)

(assert (=> b!1089083 (= lt!485363 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1089084 () Bool)

(assert (=> b!1089084 (= e!622055 true)))

(assert (=> b!1089084 (= (-!839 lt!485369 k!904) lt!485362)))

(declare-fun lt!485367 () Unit!35844)

(declare-fun addRemoveCommutativeForDiffKeys!67 (ListLongMap!14997 (_ BitVec 64) V!40725 (_ BitVec 64)) Unit!35844)

(assert (=> b!1089084 (= lt!485367 (addRemoveCommutativeForDiffKeys!67 lt!485365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1089085 () Bool)

(declare-fun res!726428 () Bool)

(assert (=> b!1089085 (=> (not res!726428) (not e!622052))))

(assert (=> b!1089085 (= res!726428 (arrayNoDuplicates!0 lt!485364 #b00000000000000000000000000000000 Nil!23614))))

(declare-fun b!1089086 () Bool)

(assert (=> b!1089086 (= e!622051 (and e!622058 mapRes!41803))))

(declare-fun condMapEmpty!41803 () Bool)

(declare-fun mapDefault!41803 () ValueCell!12640)

