; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95650 () Bool)

(assert start!95650)

(declare-fun b_free!22303 () Bool)

(declare-fun b_next!22303 () Bool)

(assert (=> start!95650 (= b_free!22303 (not b_next!22303))))

(declare-fun tp!78758 () Bool)

(declare-fun b_and!35281 () Bool)

(assert (=> start!95650 (= tp!78758 b_and!35281)))

(declare-fun b!1080969 () Bool)

(declare-fun e!617908 () Bool)

(declare-fun tp_is_empty!26305 () Bool)

(assert (=> b!1080969 (= e!617908 tp_is_empty!26305)))

(declare-fun b!1080970 () Bool)

(declare-fun e!617905 () Bool)

(assert (=> b!1080970 (= e!617905 (not true))))

(declare-datatypes ((array!69559 0))(
  ( (array!69560 (arr!33453 (Array (_ BitVec 32) (_ BitVec 64))) (size!33989 (_ BitVec 32))) )
))
(declare-fun lt!479154 () array!69559)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40201 0))(
  ( (V!40202 (val!13209 Int)) )
))
(declare-datatypes ((ValueCell!12443 0))(
  ( (ValueCellFull!12443 (v!15830 V!40201)) (EmptyCell!12443) )
))
(declare-datatypes ((array!69561 0))(
  ( (array!69562 (arr!33454 (Array (_ BitVec 32) ValueCell!12443)) (size!33990 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69561)

(declare-fun minValue!831 () V!40201)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40201)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!16730 0))(
  ( (tuple2!16731 (_1!8376 (_ BitVec 64)) (_2!8376 V!40201)) )
))
(declare-datatypes ((List!23311 0))(
  ( (Nil!23308) (Cons!23307 (h!24516 tuple2!16730) (t!32672 List!23311)) )
))
(declare-datatypes ((ListLongMap!14699 0))(
  ( (ListLongMap!14700 (toList!7365 List!23311)) )
))
(declare-fun lt!479155 () ListLongMap!14699)

(declare-fun getCurrentListMapNoExtraKeys!3913 (array!69559 array!69561 (_ BitVec 32) (_ BitVec 32) V!40201 V!40201 (_ BitVec 32) Int) ListLongMap!14699)

(declare-fun dynLambda!2050 (Int (_ BitVec 64)) V!40201)

(assert (=> b!1080970 (= lt!479155 (getCurrentListMapNoExtraKeys!3913 lt!479154 (array!69562 (store (arr!33454 _values!874) i!650 (ValueCellFull!12443 (dynLambda!2050 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!33990 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479152 () ListLongMap!14699)

(declare-fun _keys!1070 () array!69559)

(assert (=> b!1080970 (= lt!479152 (getCurrentListMapNoExtraKeys!3913 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080970 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35550 0))(
  ( (Unit!35551) )
))
(declare-fun lt!479153 () Unit!35550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69559 (_ BitVec 64) (_ BitVec 32)) Unit!35550)

(assert (=> b!1080970 (= lt!479153 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080971 () Bool)

(declare-fun e!617906 () Bool)

(assert (=> b!1080971 (= e!617906 tp_is_empty!26305)))

(declare-fun res!720493 () Bool)

(declare-fun e!617907 () Bool)

(assert (=> start!95650 (=> (not res!720493) (not e!617907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95650 (= res!720493 (validMask!0 mask!1414))))

(assert (=> start!95650 e!617907))

(assert (=> start!95650 tp!78758))

(assert (=> start!95650 true))

(assert (=> start!95650 tp_is_empty!26305))

(declare-fun array_inv!25828 (array!69559) Bool)

(assert (=> start!95650 (array_inv!25828 _keys!1070)))

(declare-fun e!617909 () Bool)

(declare-fun array_inv!25829 (array!69561) Bool)

(assert (=> start!95650 (and (array_inv!25829 _values!874) e!617909)))

(declare-fun b!1080972 () Bool)

(declare-fun res!720494 () Bool)

(assert (=> b!1080972 (=> (not res!720494) (not e!617905))))

(declare-datatypes ((List!23312 0))(
  ( (Nil!23309) (Cons!23308 (h!24517 (_ BitVec 64)) (t!32673 List!23312)) )
))
(declare-fun arrayNoDuplicates!0 (array!69559 (_ BitVec 32) List!23312) Bool)

(assert (=> b!1080972 (= res!720494 (arrayNoDuplicates!0 lt!479154 #b00000000000000000000000000000000 Nil!23309))))

(declare-fun b!1080973 () Bool)

(declare-fun res!720489 () Bool)

(assert (=> b!1080973 (=> (not res!720489) (not e!617907))))

(assert (=> b!1080973 (= res!720489 (and (= (size!33990 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33989 _keys!1070) (size!33990 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080974 () Bool)

(declare-fun res!720495 () Bool)

(assert (=> b!1080974 (=> (not res!720495) (not e!617907))))

(assert (=> b!1080974 (= res!720495 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23309))))

(declare-fun b!1080975 () Bool)

(declare-fun res!720487 () Bool)

(assert (=> b!1080975 (=> (not res!720487) (not e!617907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69559 (_ BitVec 32)) Bool)

(assert (=> b!1080975 (= res!720487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080976 () Bool)

(declare-fun mapRes!41212 () Bool)

(assert (=> b!1080976 (= e!617909 (and e!617906 mapRes!41212))))

(declare-fun condMapEmpty!41212 () Bool)

(declare-fun mapDefault!41212 () ValueCell!12443)

