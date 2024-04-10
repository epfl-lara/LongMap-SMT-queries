; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95960 () Bool)

(assert start!95960)

(declare-fun b_free!22613 () Bool)

(declare-fun b_next!22613 () Bool)

(assert (=> start!95960 (= b_free!22613 (not b_next!22613))))

(declare-fun tp!79688 () Bool)

(declare-fun b_and!35901 () Bool)

(assert (=> start!95960 (= tp!79688 b_and!35901)))

(declare-fun mapNonEmpty!41677 () Bool)

(declare-fun mapRes!41677 () Bool)

(declare-fun tp!79687 () Bool)

(declare-fun e!621050 () Bool)

(assert (=> mapNonEmpty!41677 (= mapRes!41677 (and tp!79687 e!621050))))

(declare-datatypes ((V!40613 0))(
  ( (V!40614 (val!13364 Int)) )
))
(declare-datatypes ((ValueCell!12598 0))(
  ( (ValueCellFull!12598 (v!15985 V!40613)) (EmptyCell!12598) )
))
(declare-fun mapRest!41677 () (Array (_ BitVec 32) ValueCell!12598))

(declare-datatypes ((array!70157 0))(
  ( (array!70158 (arr!33752 (Array (_ BitVec 32) ValueCell!12598)) (size!34288 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70157)

(declare-fun mapValue!41677 () ValueCell!12598)

(declare-fun mapKey!41677 () (_ BitVec 32))

(assert (=> mapNonEmpty!41677 (= (arr!33752 _values!874) (store mapRest!41677 mapKey!41677 mapValue!41677))))

(declare-fun b!1087217 () Bool)

(declare-fun e!621046 () Bool)

(declare-fun e!621044 () Bool)

(assert (=> b!1087217 (= e!621046 (not e!621044))))

(declare-fun res!725035 () Bool)

(assert (=> b!1087217 (=> res!725035 e!621044)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087217 (= res!725035 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16956 0))(
  ( (tuple2!16957 (_1!8489 (_ BitVec 64)) (_2!8489 V!40613)) )
))
(declare-datatypes ((List!23545 0))(
  ( (Nil!23542) (Cons!23541 (h!24750 tuple2!16956) (t!33216 List!23545)) )
))
(declare-datatypes ((ListLongMap!14925 0))(
  ( (ListLongMap!14926 (toList!7478 List!23545)) )
))
(declare-fun lt!483744 () ListLongMap!14925)

(declare-fun minValue!831 () V!40613)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40613)

(declare-datatypes ((array!70159 0))(
  ( (array!70160 (arr!33753 (Array (_ BitVec 32) (_ BitVec 64))) (size!34289 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70159)

(declare-fun getCurrentListMap!4254 (array!70159 array!70157 (_ BitVec 32) (_ BitVec 32) V!40613 V!40613 (_ BitVec 32) Int) ListLongMap!14925)

(assert (=> b!1087217 (= lt!483744 (getCurrentListMap!4254 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483758 () array!70157)

(declare-fun lt!483755 () ListLongMap!14925)

(declare-fun lt!483747 () array!70159)

(assert (=> b!1087217 (= lt!483755 (getCurrentListMap!4254 lt!483747 lt!483758 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483746 () ListLongMap!14925)

(declare-fun lt!483754 () ListLongMap!14925)

(assert (=> b!1087217 (and (= lt!483746 lt!483754) (= lt!483754 lt!483746))))

(declare-fun lt!483748 () ListLongMap!14925)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!804 (ListLongMap!14925 (_ BitVec 64)) ListLongMap!14925)

(assert (=> b!1087217 (= lt!483754 (-!804 lt!483748 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35774 0))(
  ( (Unit!35775) )
))
(declare-fun lt!483751 () Unit!35774)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!73 (array!70159 array!70157 (_ BitVec 32) (_ BitVec 32) V!40613 V!40613 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35774)

(assert (=> b!1087217 (= lt!483751 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!73 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4014 (array!70159 array!70157 (_ BitVec 32) (_ BitVec 32) V!40613 V!40613 (_ BitVec 32) Int) ListLongMap!14925)

(assert (=> b!1087217 (= lt!483746 (getCurrentListMapNoExtraKeys!4014 lt!483747 lt!483758 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2151 (Int (_ BitVec 64)) V!40613)

(assert (=> b!1087217 (= lt!483758 (array!70158 (store (arr!33752 _values!874) i!650 (ValueCellFull!12598 (dynLambda!2151 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34288 _values!874)))))

(assert (=> b!1087217 (= lt!483748 (getCurrentListMapNoExtraKeys!4014 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087217 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!483756 () Unit!35774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70159 (_ BitVec 64) (_ BitVec 32)) Unit!35774)

(assert (=> b!1087217 (= lt!483756 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087218 () Bool)

(declare-fun e!621045 () Bool)

(assert (=> b!1087218 (= e!621045 e!621046)))

(declare-fun res!725036 () Bool)

(assert (=> b!1087218 (=> (not res!725036) (not e!621046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70159 (_ BitVec 32)) Bool)

(assert (=> b!1087218 (= res!725036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483747 mask!1414))))

(assert (=> b!1087218 (= lt!483747 (array!70160 (store (arr!33753 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34289 _keys!1070)))))

(declare-fun res!725033 () Bool)

(assert (=> start!95960 (=> (not res!725033) (not e!621045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95960 (= res!725033 (validMask!0 mask!1414))))

(assert (=> start!95960 e!621045))

(assert (=> start!95960 tp!79688))

(assert (=> start!95960 true))

(declare-fun tp_is_empty!26615 () Bool)

(assert (=> start!95960 tp_is_empty!26615))

(declare-fun array_inv!26038 (array!70159) Bool)

(assert (=> start!95960 (array_inv!26038 _keys!1070)))

(declare-fun e!621047 () Bool)

(declare-fun array_inv!26039 (array!70157) Bool)

(assert (=> start!95960 (and (array_inv!26039 _values!874) e!621047)))

(declare-fun b!1087219 () Bool)

(declare-fun e!621048 () Bool)

(assert (=> b!1087219 (= e!621047 (and e!621048 mapRes!41677))))

(declare-fun condMapEmpty!41677 () Bool)

(declare-fun mapDefault!41677 () ValueCell!12598)

