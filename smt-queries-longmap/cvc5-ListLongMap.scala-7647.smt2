; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96202 () Bool)

(assert start!96202)

(declare-fun b_free!22855 () Bool)

(declare-fun b_next!22855 () Bool)

(assert (=> start!96202 (= b_free!22855 (not b_next!22855))))

(declare-fun tp!80413 () Bool)

(declare-fun b_and!36385 () Bool)

(assert (=> start!96202 (= tp!80413 b_and!36385)))

(declare-fun mapIsEmpty!42040 () Bool)

(declare-fun mapRes!42040 () Bool)

(assert (=> mapIsEmpty!42040 mapRes!42040))

(declare-fun b!1092519 () Bool)

(declare-fun res!729003 () Bool)

(declare-fun e!623908 () Bool)

(assert (=> b!1092519 (=> (not res!729003) (not e!623908))))

(declare-datatypes ((array!70633 0))(
  ( (array!70634 (arr!33990 (Array (_ BitVec 32) (_ BitVec 64))) (size!34526 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70633)

(declare-datatypes ((List!23743 0))(
  ( (Nil!23740) (Cons!23739 (h!24948 (_ BitVec 64)) (t!33656 List!23743)) )
))
(declare-fun arrayNoDuplicates!0 (array!70633 (_ BitVec 32) List!23743) Bool)

(assert (=> b!1092519 (= res!729003 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23740))))

(declare-fun b!1092520 () Bool)

(declare-fun e!623912 () Bool)

(declare-fun tp_is_empty!26857 () Bool)

(assert (=> b!1092520 (= e!623912 tp_is_empty!26857)))

(declare-fun b!1092521 () Bool)

(declare-fun res!729002 () Bool)

(assert (=> b!1092521 (=> (not res!729002) (not e!623908))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092521 (= res!729002 (validKeyInArray!0 k!904))))

(declare-fun b!1092522 () Bool)

(declare-fun res!729007 () Bool)

(assert (=> b!1092522 (=> (not res!729007) (not e!623908))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092522 (= res!729007 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34526 _keys!1070))))))

(declare-fun b!1092523 () Bool)

(declare-fun e!623911 () Bool)

(assert (=> b!1092523 (= e!623911 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40937 0))(
  ( (V!40938 (val!13485 Int)) )
))
(declare-fun minValue!831 () V!40937)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17158 0))(
  ( (tuple2!17159 (_1!8590 (_ BitVec 64)) (_2!8590 V!40937)) )
))
(declare-datatypes ((List!23744 0))(
  ( (Nil!23741) (Cons!23740 (h!24949 tuple2!17158) (t!33657 List!23744)) )
))
(declare-datatypes ((ListLongMap!15127 0))(
  ( (ListLongMap!15128 (toList!7579 List!23744)) )
))
(declare-fun lt!488337 () ListLongMap!15127)

(declare-fun zeroValue!831 () V!40937)

(declare-datatypes ((ValueCell!12719 0))(
  ( (ValueCellFull!12719 (v!16106 V!40937)) (EmptyCell!12719) )
))
(declare-datatypes ((array!70635 0))(
  ( (array!70636 (arr!33991 (Array (_ BitVec 32) ValueCell!12719)) (size!34527 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70635)

(declare-fun getCurrentListMap!4335 (array!70633 array!70635 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) Int) ListLongMap!15127)

(assert (=> b!1092523 (= lt!488337 (getCurrentListMap!4335 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488334 () ListLongMap!15127)

(declare-fun lt!488339 () array!70633)

(declare-fun lt!488341 () array!70635)

(assert (=> b!1092523 (= lt!488334 (getCurrentListMap!4335 lt!488339 lt!488341 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488336 () ListLongMap!15127)

(declare-fun lt!488340 () ListLongMap!15127)

(assert (=> b!1092523 (and (= lt!488336 lt!488340) (= lt!488340 lt!488336))))

(declare-fun lt!488333 () ListLongMap!15127)

(declare-fun -!898 (ListLongMap!15127 (_ BitVec 64)) ListLongMap!15127)

(assert (=> b!1092523 (= lt!488340 (-!898 lt!488333 k!904))))

(declare-datatypes ((Unit!35962 0))(
  ( (Unit!35963) )
))
(declare-fun lt!488338 () Unit!35962)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!154 (array!70633 array!70635 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35962)

(assert (=> b!1092523 (= lt!488338 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!154 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4095 (array!70633 array!70635 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) Int) ListLongMap!15127)

(assert (=> b!1092523 (= lt!488336 (getCurrentListMapNoExtraKeys!4095 lt!488339 lt!488341 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2232 (Int (_ BitVec 64)) V!40937)

(assert (=> b!1092523 (= lt!488341 (array!70636 (store (arr!33991 _values!874) i!650 (ValueCellFull!12719 (dynLambda!2232 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34527 _values!874)))))

(assert (=> b!1092523 (= lt!488333 (getCurrentListMapNoExtraKeys!4095 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092523 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488335 () Unit!35962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70633 (_ BitVec 64) (_ BitVec 32)) Unit!35962)

(assert (=> b!1092523 (= lt!488335 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1092524 () Bool)

(declare-fun e!623907 () Bool)

(assert (=> b!1092524 (= e!623907 tp_is_empty!26857)))

(declare-fun res!729008 () Bool)

(assert (=> start!96202 (=> (not res!729008) (not e!623908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96202 (= res!729008 (validMask!0 mask!1414))))

(assert (=> start!96202 e!623908))

(assert (=> start!96202 tp!80413))

(assert (=> start!96202 true))

(assert (=> start!96202 tp_is_empty!26857))

(declare-fun array_inv!26204 (array!70633) Bool)

(assert (=> start!96202 (array_inv!26204 _keys!1070)))

(declare-fun e!623909 () Bool)

(declare-fun array_inv!26205 (array!70635) Bool)

(assert (=> start!96202 (and (array_inv!26205 _values!874) e!623909)))

(declare-fun b!1092525 () Bool)

(assert (=> b!1092525 (= e!623909 (and e!623907 mapRes!42040))))

(declare-fun condMapEmpty!42040 () Bool)

(declare-fun mapDefault!42040 () ValueCell!12719)

