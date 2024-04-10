; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96082 () Bool)

(assert start!96082)

(declare-fun b_free!22735 () Bool)

(declare-fun b_next!22735 () Bool)

(assert (=> start!96082 (= b_free!22735 (not b_next!22735))))

(declare-fun tp!80054 () Bool)

(declare-fun b_and!36145 () Bool)

(assert (=> start!96082 (= tp!80054 b_and!36145)))

(declare-fun b!1089919 () Bool)

(declare-fun e!622514 () Bool)

(declare-fun tp_is_empty!26737 () Bool)

(assert (=> b!1089919 (= e!622514 tp_is_empty!26737)))

(declare-fun b!1089920 () Bool)

(declare-fun res!727070 () Bool)

(declare-fun e!622509 () Bool)

(assert (=> b!1089920 (=> (not res!727070) (not e!622509))))

(declare-datatypes ((array!70397 0))(
  ( (array!70398 (arr!33872 (Array (_ BitVec 32) (_ BitVec 64))) (size!34408 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70397)

(declare-datatypes ((List!23647 0))(
  ( (Nil!23644) (Cons!23643 (h!24852 (_ BitVec 64)) (t!33440 List!23647)) )
))
(declare-fun arrayNoDuplicates!0 (array!70397 (_ BitVec 32) List!23647) Bool)

(assert (=> b!1089920 (= res!727070 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23644))))

(declare-fun b!1089921 () Bool)

(declare-fun e!622511 () Bool)

(declare-fun e!622507 () Bool)

(assert (=> b!1089921 (= e!622511 (not e!622507))))

(declare-fun res!727064 () Bool)

(assert (=> b!1089921 (=> res!727064 e!622507)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089921 (= res!727064 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40777 0))(
  ( (V!40778 (val!13425 Int)) )
))
(declare-fun minValue!831 () V!40777)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17058 0))(
  ( (tuple2!17059 (_1!8540 (_ BitVec 64)) (_2!8540 V!40777)) )
))
(declare-datatypes ((List!23648 0))(
  ( (Nil!23645) (Cons!23644 (h!24853 tuple2!17058) (t!33441 List!23648)) )
))
(declare-datatypes ((ListLongMap!15027 0))(
  ( (ListLongMap!15028 (toList!7529 List!23648)) )
))
(declare-fun lt!486084 () ListLongMap!15027)

(declare-fun zeroValue!831 () V!40777)

(declare-datatypes ((ValueCell!12659 0))(
  ( (ValueCellFull!12659 (v!16046 V!40777)) (EmptyCell!12659) )
))
(declare-datatypes ((array!70399 0))(
  ( (array!70400 (arr!33873 (Array (_ BitVec 32) ValueCell!12659)) (size!34409 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70399)

(declare-fun getCurrentListMap!4298 (array!70397 array!70399 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) Int) ListLongMap!15027)

(assert (=> b!1089921 (= lt!486084 (getCurrentListMap!4298 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486082 () array!70399)

(declare-fun lt!486083 () array!70397)

(declare-fun lt!486080 () ListLongMap!15027)

(assert (=> b!1089921 (= lt!486080 (getCurrentListMap!4298 lt!486083 lt!486082 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486085 () ListLongMap!15027)

(declare-fun lt!486076 () ListLongMap!15027)

(assert (=> b!1089921 (and (= lt!486085 lt!486076) (= lt!486076 lt!486085))))

(declare-fun lt!486075 () ListLongMap!15027)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!854 (ListLongMap!15027 (_ BitVec 64)) ListLongMap!15027)

(assert (=> b!1089921 (= lt!486076 (-!854 lt!486075 k!904))))

(declare-datatypes ((Unit!35874 0))(
  ( (Unit!35875) )
))
(declare-fun lt!486079 () Unit!35874)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!117 (array!70397 array!70399 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35874)

(assert (=> b!1089921 (= lt!486079 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!117 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4058 (array!70397 array!70399 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) Int) ListLongMap!15027)

(assert (=> b!1089921 (= lt!486085 (getCurrentListMapNoExtraKeys!4058 lt!486083 lt!486082 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2195 (Int (_ BitVec 64)) V!40777)

(assert (=> b!1089921 (= lt!486082 (array!70400 (store (arr!33873 _values!874) i!650 (ValueCellFull!12659 (dynLambda!2195 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34409 _values!874)))))

(assert (=> b!1089921 (= lt!486075 (getCurrentListMapNoExtraKeys!4058 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089921 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486074 () Unit!35874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70397 (_ BitVec 64) (_ BitVec 32)) Unit!35874)

(assert (=> b!1089921 (= lt!486074 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1089922 () Bool)

(assert (=> b!1089922 (= e!622509 e!622511)))

(declare-fun res!727063 () Bool)

(assert (=> b!1089922 (=> (not res!727063) (not e!622511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70397 (_ BitVec 32)) Bool)

(assert (=> b!1089922 (= res!727063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486083 mask!1414))))

(assert (=> b!1089922 (= lt!486083 (array!70398 (store (arr!33872 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34408 _keys!1070)))))

(declare-fun b!1089923 () Bool)

(declare-fun res!727066 () Bool)

(assert (=> b!1089923 (=> (not res!727066) (not e!622509))))

(assert (=> b!1089923 (= res!727066 (and (= (size!34409 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34408 _keys!1070) (size!34409 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089924 () Bool)

(declare-fun res!727069 () Bool)

(assert (=> b!1089924 (=> (not res!727069) (not e!622509))))

(assert (=> b!1089924 (= res!727069 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34408 _keys!1070))))))

(declare-fun b!1089925 () Bool)

(declare-fun res!727065 () Bool)

(assert (=> b!1089925 (=> (not res!727065) (not e!622509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089925 (= res!727065 (validKeyInArray!0 k!904))))

(declare-fun b!1089926 () Bool)

(declare-fun e!622512 () Bool)

(assert (=> b!1089926 (= e!622512 tp_is_empty!26737)))

(declare-fun b!1089927 () Bool)

(declare-fun e!622508 () Bool)

(assert (=> b!1089927 (= e!622507 e!622508)))

(declare-fun res!727068 () Bool)

(assert (=> b!1089927 (=> res!727068 e!622508)))

(assert (=> b!1089927 (= res!727068 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!486073 () ListLongMap!15027)

(assert (=> b!1089927 (= lt!486084 lt!486073)))

(declare-fun lt!486078 () tuple2!17058)

(declare-fun +!3320 (ListLongMap!15027 tuple2!17058) ListLongMap!15027)

(assert (=> b!1089927 (= lt!486073 (+!3320 lt!486075 lt!486078))))

(declare-fun lt!486077 () ListLongMap!15027)

(assert (=> b!1089927 (= lt!486080 lt!486077)))

(assert (=> b!1089927 (= lt!486077 (+!3320 lt!486076 lt!486078))))

(assert (=> b!1089927 (= lt!486080 (+!3320 lt!486085 lt!486078))))

(assert (=> b!1089927 (= lt!486078 (tuple2!17059 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089928 () Bool)

(assert (=> b!1089928 (= e!622508 true)))

(assert (=> b!1089928 (= (-!854 lt!486073 k!904) lt!486077)))

(declare-fun lt!486081 () Unit!35874)

(declare-fun addRemoveCommutativeForDiffKeys!78 (ListLongMap!15027 (_ BitVec 64) V!40777 (_ BitVec 64)) Unit!35874)

(assert (=> b!1089928 (= lt!486081 (addRemoveCommutativeForDiffKeys!78 lt!486075 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1089929 () Bool)

(declare-fun res!727067 () Bool)

(assert (=> b!1089929 (=> (not res!727067) (not e!622509))))

(assert (=> b!1089929 (= res!727067 (= (select (arr!33872 _keys!1070) i!650) k!904))))

(declare-fun res!727062 () Bool)

(assert (=> start!96082 (=> (not res!727062) (not e!622509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96082 (= res!727062 (validMask!0 mask!1414))))

(assert (=> start!96082 e!622509))

(assert (=> start!96082 tp!80054))

(assert (=> start!96082 true))

(assert (=> start!96082 tp_is_empty!26737))

(declare-fun array_inv!26120 (array!70397) Bool)

(assert (=> start!96082 (array_inv!26120 _keys!1070)))

(declare-fun e!622513 () Bool)

(declare-fun array_inv!26121 (array!70399) Bool)

(assert (=> start!96082 (and (array_inv!26121 _values!874) e!622513)))

(declare-fun mapIsEmpty!41860 () Bool)

(declare-fun mapRes!41860 () Bool)

(assert (=> mapIsEmpty!41860 mapRes!41860))

(declare-fun mapNonEmpty!41860 () Bool)

(declare-fun tp!80053 () Bool)

(assert (=> mapNonEmpty!41860 (= mapRes!41860 (and tp!80053 e!622514))))

(declare-fun mapKey!41860 () (_ BitVec 32))

(declare-fun mapValue!41860 () ValueCell!12659)

(declare-fun mapRest!41860 () (Array (_ BitVec 32) ValueCell!12659))

(assert (=> mapNonEmpty!41860 (= (arr!33873 _values!874) (store mapRest!41860 mapKey!41860 mapValue!41860))))

(declare-fun b!1089930 () Bool)

(assert (=> b!1089930 (= e!622513 (and e!622512 mapRes!41860))))

(declare-fun condMapEmpty!41860 () Bool)

(declare-fun mapDefault!41860 () ValueCell!12659)

