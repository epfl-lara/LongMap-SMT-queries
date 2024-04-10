; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96100 () Bool)

(assert start!96100)

(declare-fun b_free!22753 () Bool)

(declare-fun b_next!22753 () Bool)

(assert (=> start!96100 (= b_free!22753 (not b_next!22753))))

(declare-fun tp!80108 () Bool)

(declare-fun b_and!36181 () Bool)

(assert (=> start!96100 (= tp!80108 b_and!36181)))

(declare-fun b!1090315 () Bool)

(declare-fun res!727360 () Bool)

(declare-fun e!622726 () Bool)

(assert (=> b!1090315 (=> (not res!727360) (not e!622726))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090315 (= res!727360 (validKeyInArray!0 k!904))))

(declare-fun b!1090316 () Bool)

(declare-fun e!622730 () Bool)

(declare-fun tp_is_empty!26755 () Bool)

(assert (=> b!1090316 (= e!622730 tp_is_empty!26755)))

(declare-fun b!1090317 () Bool)

(declare-fun e!622725 () Bool)

(assert (=> b!1090317 (= e!622726 e!622725)))

(declare-fun res!727368 () Bool)

(assert (=> b!1090317 (=> (not res!727368) (not e!622725))))

(declare-datatypes ((array!70433 0))(
  ( (array!70434 (arr!33890 (Array (_ BitVec 32) (_ BitVec 64))) (size!34426 (_ BitVec 32))) )
))
(declare-fun lt!486427 () array!70433)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70433 (_ BitVec 32)) Bool)

(assert (=> b!1090317 (= res!727368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486427 mask!1414))))

(declare-fun _keys!1070 () array!70433)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090317 (= lt!486427 (array!70434 (store (arr!33890 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34426 _keys!1070)))))

(declare-fun mapIsEmpty!41887 () Bool)

(declare-fun mapRes!41887 () Bool)

(assert (=> mapIsEmpty!41887 mapRes!41887))

(declare-fun b!1090318 () Bool)

(declare-fun res!727366 () Bool)

(assert (=> b!1090318 (=> (not res!727366) (not e!622725))))

(declare-datatypes ((List!23663 0))(
  ( (Nil!23660) (Cons!23659 (h!24868 (_ BitVec 64)) (t!33474 List!23663)) )
))
(declare-fun arrayNoDuplicates!0 (array!70433 (_ BitVec 32) List!23663) Bool)

(assert (=> b!1090318 (= res!727366 (arrayNoDuplicates!0 lt!486427 #b00000000000000000000000000000000 Nil!23660))))

(declare-fun b!1090320 () Bool)

(declare-fun e!622728 () Bool)

(declare-fun e!622724 () Bool)

(assert (=> b!1090320 (= e!622728 e!622724)))

(declare-fun res!727367 () Bool)

(assert (=> b!1090320 (=> res!727367 e!622724)))

(assert (=> b!1090320 (= res!727367 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40801 0))(
  ( (V!40802 (val!13434 Int)) )
))
(declare-datatypes ((tuple2!17074 0))(
  ( (tuple2!17075 (_1!8548 (_ BitVec 64)) (_2!8548 V!40801)) )
))
(declare-datatypes ((List!23664 0))(
  ( (Nil!23661) (Cons!23660 (h!24869 tuple2!17074) (t!33475 List!23664)) )
))
(declare-datatypes ((ListLongMap!15043 0))(
  ( (ListLongMap!15044 (toList!7537 List!23664)) )
))
(declare-fun lt!486430 () ListLongMap!15043)

(declare-fun lt!486434 () ListLongMap!15043)

(assert (=> b!1090320 (= lt!486430 lt!486434)))

(declare-fun lt!486428 () ListLongMap!15043)

(declare-fun lt!486429 () tuple2!17074)

(declare-fun +!3326 (ListLongMap!15043 tuple2!17074) ListLongMap!15043)

(assert (=> b!1090320 (= lt!486434 (+!3326 lt!486428 lt!486429))))

(declare-fun lt!486435 () ListLongMap!15043)

(declare-fun lt!486436 () ListLongMap!15043)

(assert (=> b!1090320 (= lt!486435 lt!486436)))

(declare-fun lt!486426 () ListLongMap!15043)

(assert (=> b!1090320 (= lt!486436 (+!3326 lt!486426 lt!486429))))

(declare-fun lt!486433 () ListLongMap!15043)

(assert (=> b!1090320 (= lt!486435 (+!3326 lt!486433 lt!486429))))

(declare-fun minValue!831 () V!40801)

(assert (=> b!1090320 (= lt!486429 (tuple2!17075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090321 () Bool)

(declare-fun res!727361 () Bool)

(assert (=> b!1090321 (=> (not res!727361) (not e!622726))))

(assert (=> b!1090321 (= res!727361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090322 () Bool)

(assert (=> b!1090322 (= e!622725 (not e!622728))))

(declare-fun res!727364 () Bool)

(assert (=> b!1090322 (=> res!727364 e!622728)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090322 (= res!727364 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40801)

(declare-datatypes ((ValueCell!12668 0))(
  ( (ValueCellFull!12668 (v!16055 V!40801)) (EmptyCell!12668) )
))
(declare-datatypes ((array!70435 0))(
  ( (array!70436 (arr!33891 (Array (_ BitVec 32) ValueCell!12668)) (size!34427 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70435)

(declare-fun getCurrentListMap!4305 (array!70433 array!70435 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) Int) ListLongMap!15043)

(assert (=> b!1090322 (= lt!486430 (getCurrentListMap!4305 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486431 () array!70435)

(assert (=> b!1090322 (= lt!486435 (getCurrentListMap!4305 lt!486427 lt!486431 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090322 (and (= lt!486433 lt!486426) (= lt!486426 lt!486433))))

(declare-fun -!862 (ListLongMap!15043 (_ BitVec 64)) ListLongMap!15043)

(assert (=> b!1090322 (= lt!486426 (-!862 lt!486428 k!904))))

(declare-datatypes ((Unit!35890 0))(
  ( (Unit!35891) )
))
(declare-fun lt!486424 () Unit!35890)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!124 (array!70433 array!70435 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35890)

(assert (=> b!1090322 (= lt!486424 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!124 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4065 (array!70433 array!70435 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) Int) ListLongMap!15043)

(assert (=> b!1090322 (= lt!486433 (getCurrentListMapNoExtraKeys!4065 lt!486427 lt!486431 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2202 (Int (_ BitVec 64)) V!40801)

(assert (=> b!1090322 (= lt!486431 (array!70436 (store (arr!33891 _values!874) i!650 (ValueCellFull!12668 (dynLambda!2202 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34427 _values!874)))))

(assert (=> b!1090322 (= lt!486428 (getCurrentListMapNoExtraKeys!4065 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090322 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486425 () Unit!35890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70433 (_ BitVec 64) (_ BitVec 32)) Unit!35890)

(assert (=> b!1090322 (= lt!486425 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090323 () Bool)

(declare-fun res!727358 () Bool)

(assert (=> b!1090323 (=> (not res!727358) (not e!622726))))

(assert (=> b!1090323 (= res!727358 (and (= (size!34427 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34426 _keys!1070) (size!34427 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090324 () Bool)

(declare-fun res!727362 () Bool)

(assert (=> b!1090324 (=> (not res!727362) (not e!622726))))

(assert (=> b!1090324 (= res!727362 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34426 _keys!1070))))))

(declare-fun b!1090325 () Bool)

(assert (=> b!1090325 (= e!622724 true)))

(assert (=> b!1090325 (= (-!862 lt!486434 k!904) lt!486436)))

(declare-fun lt!486432 () Unit!35890)

(declare-fun addRemoveCommutativeForDiffKeys!86 (ListLongMap!15043 (_ BitVec 64) V!40801 (_ BitVec 64)) Unit!35890)

(assert (=> b!1090325 (= lt!486432 (addRemoveCommutativeForDiffKeys!86 lt!486428 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090326 () Bool)

(declare-fun res!727363 () Bool)

(assert (=> b!1090326 (=> (not res!727363) (not e!622726))))

(assert (=> b!1090326 (= res!727363 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23660))))

(declare-fun b!1090327 () Bool)

(declare-fun res!727359 () Bool)

(assert (=> b!1090327 (=> (not res!727359) (not e!622726))))

(assert (=> b!1090327 (= res!727359 (= (select (arr!33890 _keys!1070) i!650) k!904))))

(declare-fun res!727365 () Bool)

(assert (=> start!96100 (=> (not res!727365) (not e!622726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96100 (= res!727365 (validMask!0 mask!1414))))

(assert (=> start!96100 e!622726))

(assert (=> start!96100 tp!80108))

(assert (=> start!96100 true))

(assert (=> start!96100 tp_is_empty!26755))

(declare-fun array_inv!26136 (array!70433) Bool)

(assert (=> start!96100 (array_inv!26136 _keys!1070)))

(declare-fun e!622727 () Bool)

(declare-fun array_inv!26137 (array!70435) Bool)

(assert (=> start!96100 (and (array_inv!26137 _values!874) e!622727)))

(declare-fun b!1090319 () Bool)

(declare-fun e!622723 () Bool)

(assert (=> b!1090319 (= e!622727 (and e!622723 mapRes!41887))))

(declare-fun condMapEmpty!41887 () Bool)

(declare-fun mapDefault!41887 () ValueCell!12668)

