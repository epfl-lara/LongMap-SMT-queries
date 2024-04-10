; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96522 () Bool)

(assert start!96522)

(declare-fun b_free!23075 () Bool)

(declare-fun b_next!23075 () Bool)

(assert (=> start!96522 (= b_free!23075 (not b_next!23075))))

(declare-fun tp!81154 () Bool)

(declare-fun b_and!36827 () Bool)

(assert (=> start!96522 (= tp!81154 b_and!36827)))

(declare-fun b!1097726 () Bool)

(declare-fun res!732641 () Bool)

(declare-fun e!626514 () Bool)

(assert (=> b!1097726 (=> (not res!732641) (not e!626514))))

(declare-datatypes ((array!71161 0))(
  ( (array!71162 (arr!34251 (Array (_ BitVec 32) (_ BitVec 64))) (size!34787 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71161)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097726 (= res!732641 (= (select (arr!34251 _keys!1070) i!650) k!904))))

(declare-fun b!1097727 () Bool)

(declare-fun e!626519 () Bool)

(declare-fun tp_is_empty!27125 () Bool)

(assert (=> b!1097727 (= e!626519 tp_is_empty!27125)))

(declare-fun b!1097728 () Bool)

(declare-fun e!626516 () Bool)

(declare-fun e!626513 () Bool)

(assert (=> b!1097728 (= e!626516 (not e!626513))))

(declare-fun res!732644 () Bool)

(assert (=> b!1097728 (=> res!732644 e!626513)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097728 (= res!732644 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41293 0))(
  ( (V!41294 (val!13619 Int)) )
))
(declare-fun minValue!831 () V!41293)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17296 0))(
  ( (tuple2!17297 (_1!8659 (_ BitVec 64)) (_2!8659 V!41293)) )
))
(declare-datatypes ((List!23918 0))(
  ( (Nil!23915) (Cons!23914 (h!25123 tuple2!17296) (t!34039 List!23918)) )
))
(declare-datatypes ((ListLongMap!15265 0))(
  ( (ListLongMap!15266 (toList!7648 List!23918)) )
))
(declare-fun lt!490801 () ListLongMap!15265)

(declare-fun zeroValue!831 () V!41293)

(declare-datatypes ((ValueCell!12853 0))(
  ( (ValueCellFull!12853 (v!16241 V!41293)) (EmptyCell!12853) )
))
(declare-datatypes ((array!71163 0))(
  ( (array!71164 (arr!34252 (Array (_ BitVec 32) ValueCell!12853)) (size!34788 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71163)

(declare-fun getCurrentListMap!4368 (array!71161 array!71163 (_ BitVec 32) (_ BitVec 32) V!41293 V!41293 (_ BitVec 32) Int) ListLongMap!15265)

(assert (=> b!1097728 (= lt!490801 (getCurrentListMap!4368 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490800 () array!71163)

(declare-fun lt!490797 () ListLongMap!15265)

(declare-fun lt!490795 () array!71161)

(assert (=> b!1097728 (= lt!490797 (getCurrentListMap!4368 lt!490795 lt!490800 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490796 () ListLongMap!15265)

(declare-fun lt!490802 () ListLongMap!15265)

(assert (=> b!1097728 (and (= lt!490796 lt!490802) (= lt!490802 lt!490796))))

(declare-fun lt!490794 () ListLongMap!15265)

(declare-fun -!938 (ListLongMap!15265 (_ BitVec 64)) ListLongMap!15265)

(assert (=> b!1097728 (= lt!490802 (-!938 lt!490794 k!904))))

(declare-datatypes ((Unit!36110 0))(
  ( (Unit!36111) )
))
(declare-fun lt!490804 () Unit!36110)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!194 (array!71161 array!71163 (_ BitVec 32) (_ BitVec 32) V!41293 V!41293 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36110)

(assert (=> b!1097728 (= lt!490804 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!194 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4164 (array!71161 array!71163 (_ BitVec 32) (_ BitVec 32) V!41293 V!41293 (_ BitVec 32) Int) ListLongMap!15265)

(assert (=> b!1097728 (= lt!490796 (getCurrentListMapNoExtraKeys!4164 lt!490795 lt!490800 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2299 (Int (_ BitVec 64)) V!41293)

(assert (=> b!1097728 (= lt!490800 (array!71164 (store (arr!34252 _values!874) i!650 (ValueCellFull!12853 (dynLambda!2299 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34788 _values!874)))))

(assert (=> b!1097728 (= lt!490794 (getCurrentListMapNoExtraKeys!4164 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097728 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!490799 () Unit!36110)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71161 (_ BitVec 64) (_ BitVec 32)) Unit!36110)

(assert (=> b!1097728 (= lt!490799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1097729 () Bool)

(declare-fun res!732642 () Bool)

(assert (=> b!1097729 (=> (not res!732642) (not e!626514))))

(assert (=> b!1097729 (= res!732642 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34787 _keys!1070))))))

(declare-fun b!1097730 () Bool)

(declare-fun e!626517 () Bool)

(declare-fun e!626515 () Bool)

(declare-fun mapRes!42451 () Bool)

(assert (=> b!1097730 (= e!626517 (and e!626515 mapRes!42451))))

(declare-fun condMapEmpty!42451 () Bool)

(declare-fun mapDefault!42451 () ValueCell!12853)

