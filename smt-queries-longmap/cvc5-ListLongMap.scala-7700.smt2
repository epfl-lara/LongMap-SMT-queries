; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96704 () Bool)

(assert start!96704)

(declare-fun b_free!23125 () Bool)

(declare-fun b_next!23125 () Bool)

(assert (=> start!96704 (= b_free!23125 (not b_next!23125))))

(declare-fun tp!81320 () Bool)

(declare-fun b_and!36997 () Bool)

(assert (=> start!96704 (= tp!81320 b_and!36997)))

(declare-fun b!1099820 () Bool)

(declare-fun res!733915 () Bool)

(declare-fun e!627746 () Bool)

(assert (=> b!1099820 (=> (not res!733915) (not e!627746))))

(declare-datatypes ((array!71267 0))(
  ( (array!71268 (arr!34299 (Array (_ BitVec 32) (_ BitVec 64))) (size!34835 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71267)

(declare-datatypes ((List!23958 0))(
  ( (Nil!23955) (Cons!23954 (h!25163 (_ BitVec 64)) (t!34129 List!23958)) )
))
(declare-fun arrayNoDuplicates!0 (array!71267 (_ BitVec 32) List!23958) Bool)

(assert (=> b!1099820 (= res!733915 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23955))))

(declare-fun b!1099821 () Bool)

(declare-fun e!627749 () Bool)

(declare-fun e!627745 () Bool)

(assert (=> b!1099821 (= e!627749 (not e!627745))))

(declare-fun res!733910 () Bool)

(assert (=> b!1099821 (=> res!733910 e!627745)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1099821 (= res!733910 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41361 0))(
  ( (V!41362 (val!13644 Int)) )
))
(declare-fun minValue!831 () V!41361)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17340 0))(
  ( (tuple2!17341 (_1!8681 (_ BitVec 64)) (_2!8681 V!41361)) )
))
(declare-datatypes ((List!23959 0))(
  ( (Nil!23956) (Cons!23955 (h!25164 tuple2!17340) (t!34130 List!23959)) )
))
(declare-datatypes ((ListLongMap!15309 0))(
  ( (ListLongMap!15310 (toList!7670 List!23959)) )
))
(declare-fun lt!492589 () ListLongMap!15309)

(declare-fun zeroValue!831 () V!41361)

(declare-datatypes ((ValueCell!12878 0))(
  ( (ValueCellFull!12878 (v!16271 V!41361)) (EmptyCell!12878) )
))
(declare-datatypes ((array!71269 0))(
  ( (array!71270 (arr!34300 (Array (_ BitVec 32) ValueCell!12878)) (size!34836 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71269)

(declare-fun getCurrentListMap!4383 (array!71267 array!71269 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) Int) ListLongMap!15309)

(assert (=> b!1099821 (= lt!492589 (getCurrentListMap!4383 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492590 () ListLongMap!15309)

(declare-fun lt!492588 () array!71267)

(declare-fun lt!492592 () array!71269)

(assert (=> b!1099821 (= lt!492590 (getCurrentListMap!4383 lt!492588 lt!492592 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492591 () ListLongMap!15309)

(declare-fun lt!492584 () ListLongMap!15309)

(assert (=> b!1099821 (and (= lt!492591 lt!492584) (= lt!492584 lt!492591))))

(declare-fun lt!492586 () ListLongMap!15309)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!958 (ListLongMap!15309 (_ BitVec 64)) ListLongMap!15309)

(assert (=> b!1099821 (= lt!492584 (-!958 lt!492586 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36160 0))(
  ( (Unit!36161) )
))
(declare-fun lt!492593 () Unit!36160)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 (array!71267 array!71269 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36160)

(assert (=> b!1099821 (= lt!492593 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!209 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4179 (array!71267 array!71269 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) Int) ListLongMap!15309)

(assert (=> b!1099821 (= lt!492591 (getCurrentListMapNoExtraKeys!4179 lt!492588 lt!492592 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2314 (Int (_ BitVec 64)) V!41361)

(assert (=> b!1099821 (= lt!492592 (array!71270 (store (arr!34300 _values!874) i!650 (ValueCellFull!12878 (dynLambda!2314 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34836 _values!874)))))

(assert (=> b!1099821 (= lt!492586 (getCurrentListMapNoExtraKeys!4179 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099821 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!492585 () Unit!36160)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71267 (_ BitVec 64) (_ BitVec 32)) Unit!36160)

(assert (=> b!1099821 (= lt!492585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1099822 () Bool)

(declare-fun res!733911 () Bool)

(assert (=> b!1099822 (=> (not res!733911) (not e!627746))))

(assert (=> b!1099822 (= res!733911 (and (= (size!34836 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34835 _keys!1070) (size!34836 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099823 () Bool)

(declare-fun e!627748 () Bool)

(declare-fun e!627744 () Bool)

(declare-fun mapRes!42541 () Bool)

(assert (=> b!1099823 (= e!627748 (and e!627744 mapRes!42541))))

(declare-fun condMapEmpty!42541 () Bool)

(declare-fun mapDefault!42541 () ValueCell!12878)

