; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95912 () Bool)

(assert start!95912)

(declare-fun b_free!22565 () Bool)

(declare-fun b_next!22565 () Bool)

(assert (=> start!95912 (= b_free!22565 (not b_next!22565))))

(declare-fun tp!79544 () Bool)

(declare-fun b_and!35805 () Bool)

(assert (=> start!95912 (= tp!79544 b_and!35805)))

(declare-fun res!724241 () Bool)

(declare-fun e!620473 () Bool)

(assert (=> start!95912 (=> (not res!724241) (not e!620473))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95912 (= res!724241 (validMask!0 mask!1414))))

(assert (=> start!95912 e!620473))

(assert (=> start!95912 tp!79544))

(assert (=> start!95912 true))

(declare-fun tp_is_empty!26567 () Bool)

(assert (=> start!95912 tp_is_empty!26567))

(declare-datatypes ((array!70069 0))(
  ( (array!70070 (arr!33708 (Array (_ BitVec 32) (_ BitVec 64))) (size!34244 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70069)

(declare-fun array_inv!26010 (array!70069) Bool)

(assert (=> start!95912 (array_inv!26010 _keys!1070)))

(declare-datatypes ((V!40549 0))(
  ( (V!40550 (val!13340 Int)) )
))
(declare-datatypes ((ValueCell!12574 0))(
  ( (ValueCellFull!12574 (v!15961 V!40549)) (EmptyCell!12574) )
))
(declare-datatypes ((array!70071 0))(
  ( (array!70072 (arr!33709 (Array (_ BitVec 32) ValueCell!12574)) (size!34245 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70071)

(declare-fun e!620474 () Bool)

(declare-fun array_inv!26011 (array!70071) Bool)

(assert (=> start!95912 (and (array_inv!26011 _values!874) e!620474)))

(declare-fun mapIsEmpty!41605 () Bool)

(declare-fun mapRes!41605 () Bool)

(assert (=> mapIsEmpty!41605 mapRes!41605))

(declare-fun b!1086161 () Bool)

(declare-fun res!724240 () Bool)

(declare-fun e!620467 () Bool)

(assert (=> b!1086161 (=> (not res!724240) (not e!620467))))

(declare-fun lt!482520 () array!70069)

(declare-datatypes ((List!23509 0))(
  ( (Nil!23506) (Cons!23505 (h!24714 (_ BitVec 64)) (t!33132 List!23509)) )
))
(declare-fun arrayNoDuplicates!0 (array!70069 (_ BitVec 32) List!23509) Bool)

(assert (=> b!1086161 (= res!724240 (arrayNoDuplicates!0 lt!482520 #b00000000000000000000000000000000 Nil!23506))))

(declare-fun b!1086162 () Bool)

(declare-fun e!620472 () Bool)

(assert (=> b!1086162 (= e!620474 (and e!620472 mapRes!41605))))

(declare-fun condMapEmpty!41605 () Bool)

(declare-fun mapDefault!41605 () ValueCell!12574)

