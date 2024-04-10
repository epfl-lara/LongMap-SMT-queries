; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96748 () Bool)

(assert start!96748)

(declare-fun b_free!23143 () Bool)

(declare-fun b_next!23143 () Bool)

(assert (=> start!96748 (= b_free!23143 (not b_next!23143))))

(declare-fun tp!81377 () Bool)

(declare-fun b_and!37047 () Bool)

(assert (=> start!96748 (= tp!81377 b_and!37047)))

(declare-fun b!1100426 () Bool)

(declare-fun e!628097 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((V!41385 0))(
  ( (V!41386 (val!13653 Int)) )
))
(declare-datatypes ((ValueCell!12887 0))(
  ( (ValueCellFull!12887 (v!16281 V!41385)) (EmptyCell!12887) )
))
(declare-datatypes ((array!71305 0))(
  ( (array!71306 (arr!34317 (Array (_ BitVec 32) ValueCell!12887)) (size!34853 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71305)

(assert (=> b!1100426 (= e!628097 (bvslt i!650 (size!34853 _values!874)))))

(declare-datatypes ((tuple2!17358 0))(
  ( (tuple2!17359 (_1!8690 (_ BitVec 64)) (_2!8690 V!41385)) )
))
(declare-datatypes ((List!23974 0))(
  ( (Nil!23971) (Cons!23970 (h!25179 tuple2!17358) (t!34163 List!23974)) )
))
(declare-datatypes ((ListLongMap!15327 0))(
  ( (ListLongMap!15328 (toList!7679 List!23974)) )
))
(declare-fun lt!493051 () ListLongMap!15327)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!493047 () ListLongMap!15327)

(declare-fun -!965 (ListLongMap!15327 (_ BitVec 64)) ListLongMap!15327)

(assert (=> b!1100426 (= (-!965 lt!493051 k!904) lt!493047)))

(declare-fun lt!493052 () ListLongMap!15327)

(declare-datatypes ((Unit!36176 0))(
  ( (Unit!36177) )
))
(declare-fun lt!493045 () Unit!36176)

(declare-fun zeroValue!831 () V!41385)

(declare-fun addRemoveCommutativeForDiffKeys!128 (ListLongMap!15327 (_ BitVec 64) V!41385 (_ BitVec 64)) Unit!36176)

(assert (=> b!1100426 (= lt!493045 (addRemoveCommutativeForDiffKeys!128 lt!493052 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1100427 () Bool)

(declare-fun res!734306 () Bool)

(declare-fun e!628096 () Bool)

(assert (=> b!1100427 (=> (not res!734306) (not e!628096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100427 (= res!734306 (validKeyInArray!0 k!904))))

(declare-fun b!1100428 () Bool)

(declare-fun res!734308 () Bool)

(assert (=> b!1100428 (=> (not res!734308) (not e!628096))))

(declare-datatypes ((array!71307 0))(
  ( (array!71308 (arr!34318 (Array (_ BitVec 32) (_ BitVec 64))) (size!34854 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71307)

(assert (=> b!1100428 (= res!734308 (= (select (arr!34318 _keys!1070) i!650) k!904))))

(declare-fun b!1100429 () Bool)

(declare-fun e!628094 () Bool)

(assert (=> b!1100429 (= e!628096 e!628094)))

(declare-fun res!734307 () Bool)

(assert (=> b!1100429 (=> (not res!734307) (not e!628094))))

(declare-fun lt!493048 () array!71307)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71307 (_ BitVec 32)) Bool)

(assert (=> b!1100429 (= res!734307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493048 mask!1414))))

(assert (=> b!1100429 (= lt!493048 (array!71308 (store (arr!34318 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34854 _keys!1070)))))

(declare-fun mapNonEmpty!42571 () Bool)

(declare-fun mapRes!42571 () Bool)

(declare-fun tp!81376 () Bool)

(declare-fun e!628092 () Bool)

(assert (=> mapNonEmpty!42571 (= mapRes!42571 (and tp!81376 e!628092))))

(declare-fun mapValue!42571 () ValueCell!12887)

(declare-fun mapKey!42571 () (_ BitVec 32))

(declare-fun mapRest!42571 () (Array (_ BitVec 32) ValueCell!12887))

(assert (=> mapNonEmpty!42571 (= (arr!34317 _values!874) (store mapRest!42571 mapKey!42571 mapValue!42571))))

(declare-fun b!1100431 () Bool)

(declare-fun e!628093 () Bool)

(declare-fun e!628098 () Bool)

(assert (=> b!1100431 (= e!628093 (and e!628098 mapRes!42571))))

(declare-fun condMapEmpty!42571 () Bool)

(declare-fun mapDefault!42571 () ValueCell!12887)

