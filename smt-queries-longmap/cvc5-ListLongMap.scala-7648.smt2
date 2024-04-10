; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96208 () Bool)

(assert start!96208)

(declare-fun b_free!22861 () Bool)

(declare-fun b_next!22861 () Bool)

(assert (=> start!96208 (= b_free!22861 (not b_next!22861))))

(declare-fun tp!80432 () Bool)

(declare-fun b_and!36397 () Bool)

(assert (=> start!96208 (= tp!80432 b_and!36397)))

(declare-fun b!1092633 () Bool)

(declare-fun e!623963 () Bool)

(declare-fun tp_is_empty!26863 () Bool)

(assert (=> b!1092633 (= e!623963 tp_is_empty!26863)))

(declare-fun b!1092634 () Bool)

(declare-fun e!623964 () Bool)

(declare-fun e!623961 () Bool)

(assert (=> b!1092634 (= e!623964 e!623961)))

(declare-fun res!729089 () Bool)

(assert (=> b!1092634 (=> (not res!729089) (not e!623961))))

(declare-datatypes ((array!70645 0))(
  ( (array!70646 (arr!33996 (Array (_ BitVec 32) (_ BitVec 64))) (size!34532 (_ BitVec 32))) )
))
(declare-fun lt!488422 () array!70645)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70645 (_ BitVec 32)) Bool)

(assert (=> b!1092634 (= res!729089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488422 mask!1414))))

(declare-fun _keys!1070 () array!70645)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092634 (= lt!488422 (array!70646 (store (arr!33996 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34532 _keys!1070)))))

(declare-fun mapNonEmpty!42049 () Bool)

(declare-fun mapRes!42049 () Bool)

(declare-fun tp!80431 () Bool)

(declare-fun e!623965 () Bool)

(assert (=> mapNonEmpty!42049 (= mapRes!42049 (and tp!80431 e!623965))))

(declare-datatypes ((V!40945 0))(
  ( (V!40946 (val!13488 Int)) )
))
(declare-datatypes ((ValueCell!12722 0))(
  ( (ValueCellFull!12722 (v!16109 V!40945)) (EmptyCell!12722) )
))
(declare-datatypes ((array!70647 0))(
  ( (array!70648 (arr!33997 (Array (_ BitVec 32) ValueCell!12722)) (size!34533 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70647)

(declare-fun mapKey!42049 () (_ BitVec 32))

(declare-fun mapValue!42049 () ValueCell!12722)

(declare-fun mapRest!42049 () (Array (_ BitVec 32) ValueCell!12722))

(assert (=> mapNonEmpty!42049 (= (arr!33997 _values!874) (store mapRest!42049 mapKey!42049 mapValue!42049))))

(declare-fun b!1092635 () Bool)

(declare-fun res!729082 () Bool)

(assert (=> b!1092635 (=> (not res!729082) (not e!623964))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092635 (= res!729082 (validKeyInArray!0 k!904))))

(declare-fun b!1092636 () Bool)

(declare-fun res!729085 () Bool)

(assert (=> b!1092636 (=> (not res!729085) (not e!623964))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092636 (= res!729085 (and (= (size!34533 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34532 _keys!1070) (size!34533 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092637 () Bool)

(declare-fun res!729087 () Bool)

(assert (=> b!1092637 (=> (not res!729087) (not e!623964))))

(assert (=> b!1092637 (= res!729087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092638 () Bool)

(assert (=> b!1092638 (= e!623961 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40945)

(declare-datatypes ((tuple2!17164 0))(
  ( (tuple2!17165 (_1!8593 (_ BitVec 64)) (_2!8593 V!40945)) )
))
(declare-datatypes ((List!23749 0))(
  ( (Nil!23746) (Cons!23745 (h!24954 tuple2!17164) (t!33668 List!23749)) )
))
(declare-datatypes ((ListLongMap!15133 0))(
  ( (ListLongMap!15134 (toList!7582 List!23749)) )
))
(declare-fun lt!488420 () ListLongMap!15133)

(declare-fun zeroValue!831 () V!40945)

(declare-fun getCurrentListMap!4338 (array!70645 array!70647 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) Int) ListLongMap!15133)

(assert (=> b!1092638 (= lt!488420 (getCurrentListMap!4338 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488416 () ListLongMap!15133)

(declare-fun lt!488415 () array!70647)

(assert (=> b!1092638 (= lt!488416 (getCurrentListMap!4338 lt!488422 lt!488415 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488418 () ListLongMap!15133)

(declare-fun lt!488419 () ListLongMap!15133)

(assert (=> b!1092638 (and (= lt!488418 lt!488419) (= lt!488419 lt!488418))))

(declare-fun lt!488414 () ListLongMap!15133)

(declare-fun -!901 (ListLongMap!15133 (_ BitVec 64)) ListLongMap!15133)

(assert (=> b!1092638 (= lt!488419 (-!901 lt!488414 k!904))))

(declare-datatypes ((Unit!35968 0))(
  ( (Unit!35969) )
))
(declare-fun lt!488417 () Unit!35968)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!157 (array!70645 array!70647 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35968)

(assert (=> b!1092638 (= lt!488417 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!157 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4098 (array!70645 array!70647 (_ BitVec 32) (_ BitVec 32) V!40945 V!40945 (_ BitVec 32) Int) ListLongMap!15133)

(assert (=> b!1092638 (= lt!488418 (getCurrentListMapNoExtraKeys!4098 lt!488422 lt!488415 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2235 (Int (_ BitVec 64)) V!40945)

(assert (=> b!1092638 (= lt!488415 (array!70648 (store (arr!33997 _values!874) i!650 (ValueCellFull!12722 (dynLambda!2235 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34533 _values!874)))))

(assert (=> b!1092638 (= lt!488414 (getCurrentListMapNoExtraKeys!4098 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092638 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488421 () Unit!35968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70645 (_ BitVec 64) (_ BitVec 32)) Unit!35968)

(assert (=> b!1092638 (= lt!488421 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1092639 () Bool)

(declare-fun res!729090 () Bool)

(assert (=> b!1092639 (=> (not res!729090) (not e!623964))))

(declare-datatypes ((List!23750 0))(
  ( (Nil!23747) (Cons!23746 (h!24955 (_ BitVec 64)) (t!33669 List!23750)) )
))
(declare-fun arrayNoDuplicates!0 (array!70645 (_ BitVec 32) List!23750) Bool)

(assert (=> b!1092639 (= res!729090 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23747))))

(declare-fun b!1092641 () Bool)

(declare-fun res!729083 () Bool)

(assert (=> b!1092641 (=> (not res!729083) (not e!623964))))

(assert (=> b!1092641 (= res!729083 (= (select (arr!33996 _keys!1070) i!650) k!904))))

(declare-fun b!1092642 () Bool)

(declare-fun e!623962 () Bool)

(assert (=> b!1092642 (= e!623962 (and e!623963 mapRes!42049))))

(declare-fun condMapEmpty!42049 () Bool)

(declare-fun mapDefault!42049 () ValueCell!12722)

