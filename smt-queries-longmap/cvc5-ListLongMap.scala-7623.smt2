; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96058 () Bool)

(assert start!96058)

(declare-fun b_free!22711 () Bool)

(declare-fun b_next!22711 () Bool)

(assert (=> start!96058 (= b_free!22711 (not b_next!22711))))

(declare-fun tp!79981 () Bool)

(declare-fun b_and!36097 () Bool)

(assert (=> start!96058 (= tp!79981 b_and!36097)))

(declare-fun b!1089382 () Bool)

(declare-fun e!622225 () Bool)

(declare-fun tp_is_empty!26713 () Bool)

(assert (=> b!1089382 (= e!622225 tp_is_empty!26713)))

(declare-fun b!1089383 () Bool)

(declare-fun e!622224 () Bool)

(declare-fun e!622223 () Bool)

(assert (=> b!1089383 (= e!622224 e!622223)))

(declare-fun res!726664 () Bool)

(assert (=> b!1089383 (=> (not res!726664) (not e!622223))))

(declare-datatypes ((array!70349 0))(
  ( (array!70350 (arr!33848 (Array (_ BitVec 32) (_ BitVec 64))) (size!34384 (_ BitVec 32))) )
))
(declare-fun lt!485639 () array!70349)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70349 (_ BitVec 32)) Bool)

(assert (=> b!1089383 (= res!726664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485639 mask!1414))))

(declare-fun _keys!1070 () array!70349)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089383 (= lt!485639 (array!70350 (store (arr!33848 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34384 _keys!1070)))))

(declare-fun b!1089384 () Bool)

(declare-fun res!726666 () Bool)

(assert (=> b!1089384 (=> (not res!726666) (not e!622223))))

(declare-datatypes ((List!23628 0))(
  ( (Nil!23625) (Cons!23624 (h!24833 (_ BitVec 64)) (t!33397 List!23628)) )
))
(declare-fun arrayNoDuplicates!0 (array!70349 (_ BitVec 32) List!23628) Bool)

(assert (=> b!1089384 (= res!726666 (arrayNoDuplicates!0 lt!485639 #b00000000000000000000000000000000 Nil!23625))))

(declare-fun b!1089385 () Bool)

(declare-fun e!622220 () Bool)

(declare-fun e!622222 () Bool)

(declare-fun mapRes!41824 () Bool)

(assert (=> b!1089385 (= e!622220 (and e!622222 mapRes!41824))))

(declare-fun condMapEmpty!41824 () Bool)

(declare-datatypes ((V!40745 0))(
  ( (V!40746 (val!13413 Int)) )
))
(declare-datatypes ((ValueCell!12647 0))(
  ( (ValueCellFull!12647 (v!16034 V!40745)) (EmptyCell!12647) )
))
(declare-datatypes ((array!70351 0))(
  ( (array!70352 (arr!33849 (Array (_ BitVec 32) ValueCell!12647)) (size!34385 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70351)

(declare-fun mapDefault!41824 () ValueCell!12647)

