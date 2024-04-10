; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96074 () Bool)

(assert start!96074)

(declare-fun b_free!22727 () Bool)

(declare-fun b_next!22727 () Bool)

(assert (=> start!96074 (= b_free!22727 (not b_next!22727))))

(declare-fun tp!80030 () Bool)

(declare-fun b_and!36129 () Bool)

(assert (=> start!96074 (= tp!80030 b_and!36129)))

(declare-fun b!1089734 () Bool)

(declare-fun res!726928 () Bool)

(declare-fun e!622414 () Bool)

(assert (=> b!1089734 (=> (not res!726928) (not e!622414))))

(declare-datatypes ((array!70381 0))(
  ( (array!70382 (arr!33864 (Array (_ BitVec 32) (_ BitVec 64))) (size!34400 (_ BitVec 32))) )
))
(declare-fun lt!485954 () array!70381)

(declare-datatypes ((List!23641 0))(
  ( (Nil!23638) (Cons!23637 (h!24846 (_ BitVec 64)) (t!33426 List!23641)) )
))
(declare-fun arrayNoDuplicates!0 (array!70381 (_ BitVec 32) List!23641) Bool)

(assert (=> b!1089734 (= res!726928 (arrayNoDuplicates!0 lt!485954 #b00000000000000000000000000000000 Nil!23638))))

(declare-fun b!1089735 () Bool)

(declare-fun e!622416 () Bool)

(assert (=> b!1089735 (= e!622414 (not e!622416))))

(declare-fun res!726925 () Bool)

(assert (=> b!1089735 (=> res!726925 e!622416)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089735 (= res!726925 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40765 0))(
  ( (V!40766 (val!13421 Int)) )
))
(declare-fun minValue!831 () V!40765)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17052 0))(
  ( (tuple2!17053 (_1!8537 (_ BitVec 64)) (_2!8537 V!40765)) )
))
(declare-datatypes ((List!23642 0))(
  ( (Nil!23639) (Cons!23638 (h!24847 tuple2!17052) (t!33427 List!23642)) )
))
(declare-datatypes ((ListLongMap!15021 0))(
  ( (ListLongMap!15022 (toList!7526 List!23642)) )
))
(declare-fun lt!485949 () ListLongMap!15021)

(declare-fun zeroValue!831 () V!40765)

(declare-fun _keys!1070 () array!70381)

(declare-datatypes ((ValueCell!12655 0))(
  ( (ValueCellFull!12655 (v!16042 V!40765)) (EmptyCell!12655) )
))
(declare-datatypes ((array!70383 0))(
  ( (array!70384 (arr!33865 (Array (_ BitVec 32) ValueCell!12655)) (size!34401 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70383)

(declare-fun getCurrentListMap!4295 (array!70381 array!70383 (_ BitVec 32) (_ BitVec 32) V!40765 V!40765 (_ BitVec 32) Int) ListLongMap!15021)

(assert (=> b!1089735 (= lt!485949 (getCurrentListMap!4295 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485946 () ListLongMap!15021)

(declare-fun lt!485947 () array!70383)

(assert (=> b!1089735 (= lt!485946 (getCurrentListMap!4295 lt!485954 lt!485947 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485948 () ListLongMap!15021)

(declare-fun lt!485951 () ListLongMap!15021)

(assert (=> b!1089735 (and (= lt!485948 lt!485951) (= lt!485951 lt!485948))))

(declare-fun lt!485950 () ListLongMap!15021)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!851 (ListLongMap!15021 (_ BitVec 64)) ListLongMap!15021)

(assert (=> b!1089735 (= lt!485951 (-!851 lt!485950 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35868 0))(
  ( (Unit!35869) )
))
(declare-fun lt!485945 () Unit!35868)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!114 (array!70381 array!70383 (_ BitVec 32) (_ BitVec 32) V!40765 V!40765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35868)

(assert (=> b!1089735 (= lt!485945 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!114 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4055 (array!70381 array!70383 (_ BitVec 32) (_ BitVec 32) V!40765 V!40765 (_ BitVec 32) Int) ListLongMap!15021)

(assert (=> b!1089735 (= lt!485948 (getCurrentListMapNoExtraKeys!4055 lt!485954 lt!485947 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2192 (Int (_ BitVec 64)) V!40765)

(assert (=> b!1089735 (= lt!485947 (array!70384 (store (arr!33865 _values!874) i!650 (ValueCellFull!12655 (dynLambda!2192 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34401 _values!874)))))

(assert (=> b!1089735 (= lt!485950 (getCurrentListMapNoExtraKeys!4055 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089735 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!485953 () Unit!35868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70381 (_ BitVec 64) (_ BitVec 32)) Unit!35868)

(assert (=> b!1089735 (= lt!485953 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1089736 () Bool)

(declare-fun res!726929 () Bool)

(declare-fun e!622417 () Bool)

(assert (=> b!1089736 (=> (not res!726929) (not e!622417))))

(assert (=> b!1089736 (= res!726929 (and (= (size!34401 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34400 _keys!1070) (size!34401 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089737 () Bool)

(declare-fun e!622412 () Bool)

(declare-fun e!622418 () Bool)

(declare-fun mapRes!41848 () Bool)

(assert (=> b!1089737 (= e!622412 (and e!622418 mapRes!41848))))

(declare-fun condMapEmpty!41848 () Bool)

(declare-fun mapDefault!41848 () ValueCell!12655)

