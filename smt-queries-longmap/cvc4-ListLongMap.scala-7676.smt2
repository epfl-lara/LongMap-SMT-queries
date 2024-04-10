; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96406 () Bool)

(assert start!96406)

(declare-fun b_free!22985 () Bool)

(declare-fun b_next!22985 () Bool)

(assert (=> start!96406 (= b_free!22985 (not b_next!22985))))

(declare-fun tp!80882 () Bool)

(declare-fun b_and!36633 () Bool)

(assert (=> start!96406 (= tp!80882 b_and!36633)))

(declare-fun b!1095800 () Bool)

(declare-fun res!731315 () Bool)

(declare-fun e!625561 () Bool)

(assert (=> b!1095800 (=> (not res!731315) (not e!625561))))

(declare-datatypes ((array!70983 0))(
  ( (array!70984 (arr!34163 (Array (_ BitVec 32) (_ BitVec 64))) (size!34699 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70983)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095800 (= res!731315 (= (select (arr!34163 _keys!1070) i!650) k!904))))

(declare-fun b!1095801 () Bool)

(declare-fun res!731319 () Bool)

(assert (=> b!1095801 (=> (not res!731319) (not e!625561))))

(assert (=> b!1095801 (= res!731319 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34699 _keys!1070))))))

(declare-fun b!1095802 () Bool)

(declare-fun e!625557 () Bool)

(declare-fun tp_is_empty!27035 () Bool)

(assert (=> b!1095802 (= e!625557 tp_is_empty!27035)))

(declare-fun b!1095803 () Bool)

(declare-fun res!731323 () Bool)

(assert (=> b!1095803 (=> (not res!731323) (not e!625561))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70983 (_ BitVec 32)) Bool)

(assert (=> b!1095803 (= res!731323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095804 () Bool)

(declare-fun e!625558 () Bool)

(assert (=> b!1095804 (= e!625558 (not true))))

(declare-datatypes ((V!41173 0))(
  ( (V!41174 (val!13574 Int)) )
))
(declare-datatypes ((tuple2!17236 0))(
  ( (tuple2!17237 (_1!8629 (_ BitVec 64)) (_2!8629 V!41173)) )
))
(declare-datatypes ((List!23856 0))(
  ( (Nil!23853) (Cons!23852 (h!25061 tuple2!17236) (t!33887 List!23856)) )
))
(declare-datatypes ((ListLongMap!15205 0))(
  ( (ListLongMap!15206 (toList!7618 List!23856)) )
))
(declare-fun lt!489947 () ListLongMap!15205)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12808 0))(
  ( (ValueCellFull!12808 (v!16195 V!41173)) (EmptyCell!12808) )
))
(declare-datatypes ((array!70985 0))(
  ( (array!70986 (arr!34164 (Array (_ BitVec 32) ValueCell!12808)) (size!34700 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70985)

(declare-fun minValue!831 () V!41173)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!489948 () array!70983)

(declare-fun zeroValue!831 () V!41173)

(declare-fun getCurrentListMapNoExtraKeys!4134 (array!70983 array!70985 (_ BitVec 32) (_ BitVec 32) V!41173 V!41173 (_ BitVec 32) Int) ListLongMap!15205)

(declare-fun dynLambda!2269 (Int (_ BitVec 64)) V!41173)

(assert (=> b!1095804 (= lt!489947 (getCurrentListMapNoExtraKeys!4134 lt!489948 (array!70986 (store (arr!34164 _values!874) i!650 (ValueCellFull!12808 (dynLambda!2269 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34700 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489949 () ListLongMap!15205)

(assert (=> b!1095804 (= lt!489949 (getCurrentListMapNoExtraKeys!4134 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095804 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36048 0))(
  ( (Unit!36049) )
))
(declare-fun lt!489946 () Unit!36048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70983 (_ BitVec 64) (_ BitVec 32)) Unit!36048)

(assert (=> b!1095804 (= lt!489946 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1095805 () Bool)

(declare-fun res!731317 () Bool)

(assert (=> b!1095805 (=> (not res!731317) (not e!625561))))

(assert (=> b!1095805 (= res!731317 (and (= (size!34700 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34699 _keys!1070) (size!34700 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095806 () Bool)

(declare-fun e!625559 () Bool)

(assert (=> b!1095806 (= e!625559 tp_is_empty!27035)))

(declare-fun b!1095807 () Bool)

(declare-fun e!625560 () Bool)

(declare-fun mapRes!42313 () Bool)

(assert (=> b!1095807 (= e!625560 (and e!625559 mapRes!42313))))

(declare-fun condMapEmpty!42313 () Bool)

(declare-fun mapDefault!42313 () ValueCell!12808)

