; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96880 () Bool)

(assert start!96880)

(declare-fun b_free!23197 () Bool)

(declare-fun b_next!23197 () Bool)

(assert (=> start!96880 (= b_free!23197 (not b_next!23197))))

(declare-fun tp!81547 () Bool)

(declare-fun b_and!37197 () Bool)

(assert (=> start!96880 (= tp!81547 b_and!37197)))

(declare-fun b!1102200 () Bool)

(declare-fun e!629109 () Bool)

(declare-fun tp_is_empty!27247 () Bool)

(assert (=> b!1102200 (= e!629109 tp_is_empty!27247)))

(declare-fun b!1102201 () Bool)

(declare-fun e!629111 () Bool)

(declare-fun e!629108 () Bool)

(assert (=> b!1102201 (= e!629111 e!629108)))

(declare-fun res!735455 () Bool)

(assert (=> b!1102201 (=> (not res!735455) (not e!629108))))

(declare-datatypes ((array!71415 0))(
  ( (array!71416 (arr!34369 (Array (_ BitVec 32) (_ BitVec 64))) (size!34905 (_ BitVec 32))) )
))
(declare-fun lt!494443 () array!71415)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71415 (_ BitVec 32)) Bool)

(assert (=> b!1102201 (= res!735455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494443 mask!1414))))

(declare-fun _keys!1070 () array!71415)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102201 (= lt!494443 (array!71416 (store (arr!34369 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34905 _keys!1070)))))

(declare-fun b!1102202 () Bool)

(declare-fun e!629112 () Bool)

(declare-fun e!629113 () Bool)

(declare-fun mapRes!42661 () Bool)

(assert (=> b!1102202 (= e!629112 (and e!629113 mapRes!42661))))

(declare-fun condMapEmpty!42661 () Bool)

(declare-datatypes ((V!41457 0))(
  ( (V!41458 (val!13680 Int)) )
))
(declare-datatypes ((ValueCell!12914 0))(
  ( (ValueCellFull!12914 (v!16311 V!41457)) (EmptyCell!12914) )
))
(declare-datatypes ((array!71417 0))(
  ( (array!71418 (arr!34370 (Array (_ BitVec 32) ValueCell!12914)) (size!34906 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71417)

(declare-fun mapDefault!42661 () ValueCell!12914)

