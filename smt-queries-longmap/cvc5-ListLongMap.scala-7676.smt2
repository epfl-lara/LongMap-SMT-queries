; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96402 () Bool)

(assert start!96402)

(declare-fun b_free!22981 () Bool)

(declare-fun b_next!22981 () Bool)

(assert (=> start!96402 (= b_free!22981 (not b_next!22981))))

(declare-fun tp!80870 () Bool)

(declare-fun b_and!36625 () Bool)

(assert (=> start!96402 (= tp!80870 b_and!36625)))

(declare-fun mapIsEmpty!42307 () Bool)

(declare-fun mapRes!42307 () Bool)

(assert (=> mapIsEmpty!42307 mapRes!42307))

(declare-fun mapNonEmpty!42307 () Bool)

(declare-fun tp!80869 () Bool)

(declare-fun e!625520 () Bool)

(assert (=> mapNonEmpty!42307 (= mapRes!42307 (and tp!80869 e!625520))))

(declare-datatypes ((V!41169 0))(
  ( (V!41170 (val!13572 Int)) )
))
(declare-datatypes ((ValueCell!12806 0))(
  ( (ValueCellFull!12806 (v!16193 V!41169)) (EmptyCell!12806) )
))
(declare-datatypes ((array!70975 0))(
  ( (array!70976 (arr!34159 (Array (_ BitVec 32) ValueCell!12806)) (size!34695 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70975)

(declare-fun mapKey!42307 () (_ BitVec 32))

(declare-fun mapRest!42307 () (Array (_ BitVec 32) ValueCell!12806))

(declare-fun mapValue!42307 () ValueCell!12806)

(assert (=> mapNonEmpty!42307 (= (arr!34159 _values!874) (store mapRest!42307 mapKey!42307 mapValue!42307))))

(declare-fun b!1095724 () Bool)

(declare-fun res!731266 () Bool)

(declare-fun e!625521 () Bool)

(assert (=> b!1095724 (=> (not res!731266) (not e!625521))))

(declare-datatypes ((array!70977 0))(
  ( (array!70978 (arr!34160 (Array (_ BitVec 32) (_ BitVec 64))) (size!34696 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70977)

(declare-datatypes ((List!23852 0))(
  ( (Nil!23849) (Cons!23848 (h!25057 (_ BitVec 64)) (t!33879 List!23852)) )
))
(declare-fun arrayNoDuplicates!0 (array!70977 (_ BitVec 32) List!23852) Bool)

(assert (=> b!1095724 (= res!731266 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23849))))

(declare-fun b!1095725 () Bool)

(declare-fun res!731261 () Bool)

(assert (=> b!1095725 (=> (not res!731261) (not e!625521))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095725 (= res!731261 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34696 _keys!1070))))))

(declare-fun res!731264 () Bool)

(assert (=> start!96402 (=> (not res!731264) (not e!625521))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96402 (= res!731264 (validMask!0 mask!1414))))

(assert (=> start!96402 e!625521))

(assert (=> start!96402 tp!80870))

(assert (=> start!96402 true))

(declare-fun tp_is_empty!27031 () Bool)

(assert (=> start!96402 tp_is_empty!27031))

(declare-fun array_inv!26322 (array!70977) Bool)

(assert (=> start!96402 (array_inv!26322 _keys!1070)))

(declare-fun e!625523 () Bool)

(declare-fun array_inv!26323 (array!70975) Bool)

(assert (=> start!96402 (and (array_inv!26323 _values!874) e!625523)))

(declare-fun b!1095726 () Bool)

(declare-fun e!625522 () Bool)

(assert (=> b!1095726 (= e!625521 e!625522)))

(declare-fun res!731268 () Bool)

(assert (=> b!1095726 (=> (not res!731268) (not e!625522))))

(declare-fun lt!489922 () array!70977)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70977 (_ BitVec 32)) Bool)

(assert (=> b!1095726 (= res!731268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489922 mask!1414))))

(assert (=> b!1095726 (= lt!489922 (array!70978 (store (arr!34160 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34696 _keys!1070)))))

(declare-fun b!1095727 () Bool)

(declare-fun e!625524 () Bool)

(assert (=> b!1095727 (= e!625524 tp_is_empty!27031)))

(declare-fun b!1095728 () Bool)

(assert (=> b!1095728 (= e!625522 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41169)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17232 0))(
  ( (tuple2!17233 (_1!8627 (_ BitVec 64)) (_2!8627 V!41169)) )
))
(declare-datatypes ((List!23853 0))(
  ( (Nil!23850) (Cons!23849 (h!25058 tuple2!17232) (t!33880 List!23853)) )
))
(declare-datatypes ((ListLongMap!15201 0))(
  ( (ListLongMap!15202 (toList!7616 List!23853)) )
))
(declare-fun lt!489923 () ListLongMap!15201)

(declare-fun zeroValue!831 () V!41169)

(declare-fun getCurrentListMapNoExtraKeys!4132 (array!70977 array!70975 (_ BitVec 32) (_ BitVec 32) V!41169 V!41169 (_ BitVec 32) Int) ListLongMap!15201)

(declare-fun dynLambda!2267 (Int (_ BitVec 64)) V!41169)

(assert (=> b!1095728 (= lt!489923 (getCurrentListMapNoExtraKeys!4132 lt!489922 (array!70976 (store (arr!34159 _values!874) i!650 (ValueCellFull!12806 (dynLambda!2267 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34695 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489925 () ListLongMap!15201)

(assert (=> b!1095728 (= lt!489925 (getCurrentListMapNoExtraKeys!4132 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095728 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36044 0))(
  ( (Unit!36045) )
))
(declare-fun lt!489924 () Unit!36044)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70977 (_ BitVec 64) (_ BitVec 32)) Unit!36044)

(assert (=> b!1095728 (= lt!489924 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1095729 () Bool)

(declare-fun res!731269 () Bool)

(assert (=> b!1095729 (=> (not res!731269) (not e!625521))))

(assert (=> b!1095729 (= res!731269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095730 () Bool)

(declare-fun res!731265 () Bool)

(assert (=> b!1095730 (=> (not res!731265) (not e!625522))))

(assert (=> b!1095730 (= res!731265 (arrayNoDuplicates!0 lt!489922 #b00000000000000000000000000000000 Nil!23849))))

(declare-fun b!1095731 () Bool)

(declare-fun res!731267 () Bool)

(assert (=> b!1095731 (=> (not res!731267) (not e!625521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095731 (= res!731267 (validKeyInArray!0 k!904))))

(declare-fun b!1095732 () Bool)

(assert (=> b!1095732 (= e!625520 tp_is_empty!27031)))

(declare-fun b!1095733 () Bool)

(declare-fun res!731262 () Bool)

(assert (=> b!1095733 (=> (not res!731262) (not e!625521))))

(assert (=> b!1095733 (= res!731262 (= (select (arr!34160 _keys!1070) i!650) k!904))))

(declare-fun b!1095734 () Bool)

(declare-fun res!731263 () Bool)

(assert (=> b!1095734 (=> (not res!731263) (not e!625521))))

(assert (=> b!1095734 (= res!731263 (and (= (size!34695 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34696 _keys!1070) (size!34695 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095735 () Bool)

(assert (=> b!1095735 (= e!625523 (and e!625524 mapRes!42307))))

(declare-fun condMapEmpty!42307 () Bool)

(declare-fun mapDefault!42307 () ValueCell!12806)

