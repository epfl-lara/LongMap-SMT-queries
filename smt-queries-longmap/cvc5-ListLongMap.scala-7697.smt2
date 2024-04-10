; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96634 () Bool)

(assert start!96634)

(declare-fun b_free!23107 () Bool)

(declare-fun b_next!23107 () Bool)

(assert (=> start!96634 (= b_free!23107 (not b_next!23107))))

(declare-fun tp!81259 () Bool)

(declare-fun b_and!36933 () Bool)

(assert (=> start!96634 (= tp!81259 b_and!36933)))

(declare-fun res!733458 () Bool)

(declare-fun e!627292 () Bool)

(assert (=> start!96634 (=> (not res!733458) (not e!627292))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96634 (= res!733458 (validMask!0 mask!1414))))

(assert (=> start!96634 e!627292))

(assert (=> start!96634 tp!81259))

(assert (=> start!96634 true))

(declare-fun tp_is_empty!27157 () Bool)

(assert (=> start!96634 tp_is_empty!27157))

(declare-datatypes ((array!71229 0))(
  ( (array!71230 (arr!34282 (Array (_ BitVec 32) (_ BitVec 64))) (size!34818 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71229)

(declare-fun array_inv!26408 (array!71229) Bool)

(assert (=> start!96634 (array_inv!26408 _keys!1070)))

(declare-datatypes ((V!41337 0))(
  ( (V!41338 (val!13635 Int)) )
))
(declare-datatypes ((ValueCell!12869 0))(
  ( (ValueCellFull!12869 (v!16260 V!41337)) (EmptyCell!12869) )
))
(declare-datatypes ((array!71231 0))(
  ( (array!71232 (arr!34283 (Array (_ BitVec 32) ValueCell!12869)) (size!34819 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71231)

(declare-fun e!627288 () Bool)

(declare-fun array_inv!26409 (array!71231) Bool)

(assert (=> start!96634 (and (array_inv!26409 _values!874) e!627288)))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun b!1099046 () Bool)

(declare-datatypes ((tuple2!17322 0))(
  ( (tuple2!17323 (_1!8672 (_ BitVec 64)) (_2!8672 V!41337)) )
))
(declare-datatypes ((List!23942 0))(
  ( (Nil!23939) (Cons!23938 (h!25147 tuple2!17322) (t!34095 List!23942)) )
))
(declare-datatypes ((ListLongMap!15291 0))(
  ( (ListLongMap!15292 (toList!7661 List!23942)) )
))
(declare-fun lt!491987 () ListLongMap!15291)

(declare-fun e!627287 () Bool)

(declare-fun lt!491981 () ListLongMap!15291)

(declare-fun -!950 (ListLongMap!15291 (_ BitVec 64)) ListLongMap!15291)

(assert (=> b!1099046 (= e!627287 (= (-!950 lt!491987 k!904) lt!491981))))

(declare-fun lt!491988 () tuple2!17322)

(declare-fun lt!491972 () ListLongMap!15291)

(declare-fun lt!491984 () ListLongMap!15291)

(declare-fun +!3370 (ListLongMap!15291 tuple2!17322) ListLongMap!15291)

(assert (=> b!1099046 (= (-!950 lt!491972 k!904) (+!3370 lt!491984 lt!491988))))

(declare-datatypes ((Unit!36140 0))(
  ( (Unit!36141) )
))
(declare-fun lt!491977 () Unit!36140)

(declare-fun minValue!831 () V!41337)

(declare-fun lt!491985 () ListLongMap!15291)

(declare-fun addRemoveCommutativeForDiffKeys!122 (ListLongMap!15291 (_ BitVec 64) V!41337 (_ BitVec 64)) Unit!36140)

(assert (=> b!1099046 (= lt!491977 (addRemoveCommutativeForDiffKeys!122 lt!491985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1099047 () Bool)

(declare-fun e!627291 () Bool)

(declare-fun mapRes!42508 () Bool)

(assert (=> b!1099047 (= e!627288 (and e!627291 mapRes!42508))))

(declare-fun condMapEmpty!42508 () Bool)

(declare-fun mapDefault!42508 () ValueCell!12869)

