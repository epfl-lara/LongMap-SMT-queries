; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96094 () Bool)

(assert start!96094)

(declare-fun b_free!22747 () Bool)

(declare-fun b_next!22747 () Bool)

(assert (=> start!96094 (= b_free!22747 (not b_next!22747))))

(declare-fun tp!80089 () Bool)

(declare-fun b_and!36169 () Bool)

(assert (=> start!96094 (= tp!80089 b_and!36169)))

(declare-fun b!1090183 () Bool)

(declare-fun res!727262 () Bool)

(declare-fun e!622654 () Bool)

(assert (=> b!1090183 (=> (not res!727262) (not e!622654))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090183 (= res!727262 (validKeyInArray!0 k!904))))

(declare-fun b!1090184 () Bool)

(declare-fun e!622657 () Bool)

(assert (=> b!1090184 (= e!622657 true)))

(declare-datatypes ((V!40793 0))(
  ( (V!40794 (val!13431 Int)) )
))
(declare-datatypes ((tuple2!17068 0))(
  ( (tuple2!17069 (_1!8545 (_ BitVec 64)) (_2!8545 V!40793)) )
))
(declare-datatypes ((List!23657 0))(
  ( (Nil!23654) (Cons!23653 (h!24862 tuple2!17068) (t!33462 List!23657)) )
))
(declare-datatypes ((ListLongMap!15037 0))(
  ( (ListLongMap!15038 (toList!7534 List!23657)) )
))
(declare-fun lt!486309 () ListLongMap!15037)

(declare-fun lt!486311 () ListLongMap!15037)

(declare-fun -!859 (ListLongMap!15037 (_ BitVec 64)) ListLongMap!15037)

(assert (=> b!1090184 (= (-!859 lt!486309 k!904) lt!486311)))

(declare-fun minValue!831 () V!40793)

(declare-datatypes ((Unit!35884 0))(
  ( (Unit!35885) )
))
(declare-fun lt!486317 () Unit!35884)

(declare-fun lt!486318 () ListLongMap!15037)

(declare-fun addRemoveCommutativeForDiffKeys!83 (ListLongMap!15037 (_ BitVec 64) V!40793 (_ BitVec 64)) Unit!35884)

(assert (=> b!1090184 (= lt!486317 (addRemoveCommutativeForDiffKeys!83 lt!486318 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun mapNonEmpty!41878 () Bool)

(declare-fun mapRes!41878 () Bool)

(declare-fun tp!80090 () Bool)

(declare-fun e!622658 () Bool)

(assert (=> mapNonEmpty!41878 (= mapRes!41878 (and tp!80090 e!622658))))

(declare-datatypes ((ValueCell!12665 0))(
  ( (ValueCellFull!12665 (v!16052 V!40793)) (EmptyCell!12665) )
))
(declare-fun mapRest!41878 () (Array (_ BitVec 32) ValueCell!12665))

(declare-datatypes ((array!70421 0))(
  ( (array!70422 (arr!33884 (Array (_ BitVec 32) ValueCell!12665)) (size!34420 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70421)

(declare-fun mapValue!41878 () ValueCell!12665)

(declare-fun mapKey!41878 () (_ BitVec 32))

(assert (=> mapNonEmpty!41878 (= (arr!33884 _values!874) (store mapRest!41878 mapKey!41878 mapValue!41878))))

(declare-fun b!1090185 () Bool)

(declare-fun e!622656 () Bool)

(declare-fun tp_is_empty!26749 () Bool)

(assert (=> b!1090185 (= e!622656 tp_is_empty!26749)))

(declare-fun b!1090186 () Bool)

(declare-fun res!727263 () Bool)

(assert (=> b!1090186 (=> (not res!727263) (not e!622654))))

(declare-datatypes ((array!70423 0))(
  ( (array!70424 (arr!33885 (Array (_ BitVec 32) (_ BitVec 64))) (size!34421 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70423)

(declare-datatypes ((List!23658 0))(
  ( (Nil!23655) (Cons!23654 (h!24863 (_ BitVec 64)) (t!33463 List!23658)) )
))
(declare-fun arrayNoDuplicates!0 (array!70423 (_ BitVec 32) List!23658) Bool)

(assert (=> b!1090186 (= res!727263 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23655))))

(declare-fun res!727265 () Bool)

(assert (=> start!96094 (=> (not res!727265) (not e!622654))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96094 (= res!727265 (validMask!0 mask!1414))))

(assert (=> start!96094 e!622654))

(assert (=> start!96094 tp!80089))

(assert (=> start!96094 true))

(assert (=> start!96094 tp_is_empty!26749))

(declare-fun array_inv!26130 (array!70423) Bool)

(assert (=> start!96094 (array_inv!26130 _keys!1070)))

(declare-fun e!622652 () Bool)

(declare-fun array_inv!26131 (array!70421) Bool)

(assert (=> start!96094 (and (array_inv!26131 _values!874) e!622652)))

(declare-fun b!1090187 () Bool)

(declare-fun res!727269 () Bool)

(assert (=> b!1090187 (=> (not res!727269) (not e!622654))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090187 (= res!727269 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34421 _keys!1070))))))

(declare-fun mapIsEmpty!41878 () Bool)

(assert (=> mapIsEmpty!41878 mapRes!41878))

(declare-fun b!1090188 () Bool)

(declare-fun res!727261 () Bool)

(assert (=> b!1090188 (=> (not res!727261) (not e!622654))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090188 (= res!727261 (and (= (size!34420 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34421 _keys!1070) (size!34420 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090189 () Bool)

(assert (=> b!1090189 (= e!622652 (and e!622656 mapRes!41878))))

(declare-fun condMapEmpty!41878 () Bool)

(declare-fun mapDefault!41878 () ValueCell!12665)

