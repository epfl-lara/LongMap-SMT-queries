; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96872 () Bool)

(assert start!96872)

(declare-fun b_free!23189 () Bool)

(declare-fun b_next!23189 () Bool)

(assert (=> start!96872 (= b_free!23189 (not b_next!23189))))

(declare-fun tp!81524 () Bool)

(declare-fun b_and!37181 () Bool)

(assert (=> start!96872 (= tp!81524 b_and!37181)))

(declare-fun b!1102028 () Bool)

(declare-fun e!629022 () Bool)

(declare-fun tp_is_empty!27239 () Bool)

(assert (=> b!1102028 (= e!629022 tp_is_empty!27239)))

(declare-fun b!1102029 () Bool)

(declare-fun res!735325 () Bool)

(declare-fun e!629017 () Bool)

(assert (=> b!1102029 (=> (not res!735325) (not e!629017))))

(declare-datatypes ((array!71399 0))(
  ( (array!71400 (arr!34361 (Array (_ BitVec 32) (_ BitVec 64))) (size!34897 (_ BitVec 32))) )
))
(declare-fun lt!494292 () array!71399)

(declare-datatypes ((List!24009 0))(
  ( (Nil!24006) (Cons!24005 (h!25214 (_ BitVec 64)) (t!34244 List!24009)) )
))
(declare-fun arrayNoDuplicates!0 (array!71399 (_ BitVec 32) List!24009) Bool)

(assert (=> b!1102029 (= res!735325 (arrayNoDuplicates!0 lt!494292 #b00000000000000000000000000000000 Nil!24006))))

(declare-fun b!1102030 () Bool)

(declare-fun res!735331 () Bool)

(declare-fun e!629020 () Bool)

(assert (=> b!1102030 (=> (not res!735331) (not e!629020))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102030 (= res!735331 (validKeyInArray!0 k!904))))

(declare-fun res!735330 () Bool)

(assert (=> start!96872 (=> (not res!735330) (not e!629020))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96872 (= res!735330 (validMask!0 mask!1414))))

(assert (=> start!96872 e!629020))

(assert (=> start!96872 tp!81524))

(assert (=> start!96872 true))

(assert (=> start!96872 tp_is_empty!27239))

(declare-fun _keys!1070 () array!71399)

(declare-fun array_inv!26466 (array!71399) Bool)

(assert (=> start!96872 (array_inv!26466 _keys!1070)))

(declare-datatypes ((V!41445 0))(
  ( (V!41446 (val!13676 Int)) )
))
(declare-datatypes ((ValueCell!12910 0))(
  ( (ValueCellFull!12910 (v!16307 V!41445)) (EmptyCell!12910) )
))
(declare-datatypes ((array!71401 0))(
  ( (array!71402 (arr!34362 (Array (_ BitVec 32) ValueCell!12910)) (size!34898 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71401)

(declare-fun e!629021 () Bool)

(declare-fun array_inv!26467 (array!71401) Bool)

(assert (=> start!96872 (and (array_inv!26467 _values!874) e!629021)))

(declare-fun mapIsEmpty!42649 () Bool)

(declare-fun mapRes!42649 () Bool)

(assert (=> mapIsEmpty!42649 mapRes!42649))

(declare-fun b!1102031 () Bool)

(declare-fun res!735323 () Bool)

(assert (=> b!1102031 (=> (not res!735323) (not e!629020))))

(assert (=> b!1102031 (= res!735323 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24006))))

(declare-fun b!1102032 () Bool)

(declare-fun e!629023 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102032 (= e!629023 (bvslt i!650 (size!34898 _values!874)))))

(declare-datatypes ((tuple2!17394 0))(
  ( (tuple2!17395 (_1!8708 (_ BitVec 64)) (_2!8708 V!41445)) )
))
(declare-datatypes ((List!24010 0))(
  ( (Nil!24007) (Cons!24006 (h!25215 tuple2!17394) (t!34245 List!24010)) )
))
(declare-datatypes ((ListLongMap!15363 0))(
  ( (ListLongMap!15364 (toList!7697 List!24010)) )
))
(declare-fun lt!494293 () ListLongMap!15363)

(declare-fun lt!494291 () ListLongMap!15363)

(declare-fun -!980 (ListLongMap!15363 (_ BitVec 64)) ListLongMap!15363)

(assert (=> b!1102032 (= (-!980 lt!494293 k!904) lt!494291)))

(declare-fun minValue!831 () V!41445)

(declare-datatypes ((Unit!36212 0))(
  ( (Unit!36213) )
))
(declare-fun lt!494294 () Unit!36212)

(declare-fun lt!494290 () ListLongMap!15363)

(declare-fun addRemoveCommutativeForDiffKeys!137 (ListLongMap!15363 (_ BitVec 64) V!41445 (_ BitVec 64)) Unit!36212)

(assert (=> b!1102032 (= lt!494294 (addRemoveCommutativeForDiffKeys!137 lt!494290 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1102033 () Bool)

(declare-fun e!629016 () Bool)

(assert (=> b!1102033 (= e!629021 (and e!629016 mapRes!42649))))

(declare-fun condMapEmpty!42649 () Bool)

(declare-fun mapDefault!42649 () ValueCell!12910)

