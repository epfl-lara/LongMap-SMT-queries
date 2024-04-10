; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96056 () Bool)

(assert start!96056)

(declare-fun b_free!22709 () Bool)

(declare-fun b_next!22709 () Bool)

(assert (=> start!96056 (= b_free!22709 (not b_next!22709))))

(declare-fun tp!79975 () Bool)

(declare-fun b_and!36093 () Bool)

(assert (=> start!96056 (= tp!79975 b_and!36093)))

(declare-fun b!1089338 () Bool)

(declare-fun res!726633 () Bool)

(declare-fun e!622199 () Bool)

(assert (=> b!1089338 (=> (not res!726633) (not e!622199))))

(declare-datatypes ((array!70345 0))(
  ( (array!70346 (arr!33846 (Array (_ BitVec 32) (_ BitVec 64))) (size!34382 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70345)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089338 (= res!726633 (= (select (arr!33846 _keys!1070) i!650) k!904))))

(declare-fun b!1089339 () Bool)

(declare-fun res!726626 () Bool)

(declare-fun e!622202 () Bool)

(assert (=> b!1089339 (=> (not res!726626) (not e!622202))))

(declare-fun lt!485601 () array!70345)

(declare-datatypes ((List!23626 0))(
  ( (Nil!23623) (Cons!23622 (h!24831 (_ BitVec 64)) (t!33393 List!23626)) )
))
(declare-fun arrayNoDuplicates!0 (array!70345 (_ BitVec 32) List!23626) Bool)

(assert (=> b!1089339 (= res!726626 (arrayNoDuplicates!0 lt!485601 #b00000000000000000000000000000000 Nil!23623))))

(declare-fun mapIsEmpty!41821 () Bool)

(declare-fun mapRes!41821 () Bool)

(assert (=> mapIsEmpty!41821 mapRes!41821))

(declare-fun b!1089340 () Bool)

(declare-fun e!622200 () Bool)

(declare-fun tp_is_empty!26711 () Bool)

(assert (=> b!1089340 (= e!622200 tp_is_empty!26711)))

(declare-fun b!1089341 () Bool)

(declare-fun e!622197 () Bool)

(assert (=> b!1089341 (= e!622197 tp_is_empty!26711)))

(declare-fun b!1089342 () Bool)

(declare-fun res!726627 () Bool)

(assert (=> b!1089342 (=> (not res!726627) (not e!622199))))

(assert (=> b!1089342 (= res!726627 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34382 _keys!1070))))))

(declare-fun mapNonEmpty!41821 () Bool)

(declare-fun tp!79976 () Bool)

(assert (=> mapNonEmpty!41821 (= mapRes!41821 (and tp!79976 e!622197))))

(declare-fun mapKey!41821 () (_ BitVec 32))

(declare-datatypes ((V!40741 0))(
  ( (V!40742 (val!13412 Int)) )
))
(declare-datatypes ((ValueCell!12646 0))(
  ( (ValueCellFull!12646 (v!16033 V!40741)) (EmptyCell!12646) )
))
(declare-datatypes ((array!70347 0))(
  ( (array!70348 (arr!33847 (Array (_ BitVec 32) ValueCell!12646)) (size!34383 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70347)

(declare-fun mapRest!41821 () (Array (_ BitVec 32) ValueCell!12646))

(declare-fun mapValue!41821 () ValueCell!12646)

(assert (=> mapNonEmpty!41821 (= (arr!33847 _values!874) (store mapRest!41821 mapKey!41821 mapValue!41821))))

(declare-fun res!726632 () Bool)

(assert (=> start!96056 (=> (not res!726632) (not e!622199))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96056 (= res!726632 (validMask!0 mask!1414))))

(assert (=> start!96056 e!622199))

(assert (=> start!96056 tp!79975))

(assert (=> start!96056 true))

(assert (=> start!96056 tp_is_empty!26711))

(declare-fun array_inv!26106 (array!70345) Bool)

(assert (=> start!96056 (array_inv!26106 _keys!1070)))

(declare-fun e!622198 () Bool)

(declare-fun array_inv!26107 (array!70347) Bool)

(assert (=> start!96056 (and (array_inv!26107 _values!874) e!622198)))

(declare-fun b!1089343 () Bool)

(declare-fun e!622201 () Bool)

(assert (=> b!1089343 (= e!622201 true)))

(declare-datatypes ((tuple2!17038 0))(
  ( (tuple2!17039 (_1!8530 (_ BitVec 64)) (_2!8530 V!40741)) )
))
(declare-datatypes ((List!23627 0))(
  ( (Nil!23624) (Cons!23623 (h!24832 tuple2!17038) (t!33394 List!23627)) )
))
(declare-datatypes ((ListLongMap!15007 0))(
  ( (ListLongMap!15008 (toList!7519 List!23627)) )
))
(declare-fun lt!485605 () ListLongMap!15007)

(declare-fun lt!485603 () ListLongMap!15007)

(declare-fun -!844 (ListLongMap!15007 (_ BitVec 64)) ListLongMap!15007)

(assert (=> b!1089343 (= (-!844 lt!485605 k!904) lt!485603)))

(declare-datatypes ((Unit!35854 0))(
  ( (Unit!35855) )
))
(declare-fun lt!485597 () Unit!35854)

(declare-fun lt!485600 () ListLongMap!15007)

(declare-fun zeroValue!831 () V!40741)

(declare-fun addRemoveCommutativeForDiffKeys!72 (ListLongMap!15007 (_ BitVec 64) V!40741 (_ BitVec 64)) Unit!35854)

(assert (=> b!1089343 (= lt!485597 (addRemoveCommutativeForDiffKeys!72 lt!485600 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1089344 () Bool)

(assert (=> b!1089344 (= e!622198 (and e!622200 mapRes!41821))))

(declare-fun condMapEmpty!41821 () Bool)

(declare-fun mapDefault!41821 () ValueCell!12646)

