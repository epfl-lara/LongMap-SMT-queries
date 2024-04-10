; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96518 () Bool)

(assert start!96518)

(declare-fun b_free!23071 () Bool)

(declare-fun b_next!23071 () Bool)

(assert (=> start!96518 (= b_free!23071 (not b_next!23071))))

(declare-fun tp!81142 () Bool)

(declare-fun b_and!36819 () Bool)

(assert (=> start!96518 (= tp!81142 b_and!36819)))

(declare-fun res!732578 () Bool)

(declare-fun e!626474 () Bool)

(assert (=> start!96518 (=> (not res!732578) (not e!626474))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96518 (= res!732578 (validMask!0 mask!1414))))

(assert (=> start!96518 e!626474))

(assert (=> start!96518 tp!81142))

(assert (=> start!96518 true))

(declare-fun tp_is_empty!27121 () Bool)

(assert (=> start!96518 tp_is_empty!27121))

(declare-datatypes ((array!71153 0))(
  ( (array!71154 (arr!34247 (Array (_ BitVec 32) (_ BitVec 64))) (size!34783 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71153)

(declare-fun array_inv!26384 (array!71153) Bool)

(assert (=> start!96518 (array_inv!26384 _keys!1070)))

(declare-datatypes ((V!41289 0))(
  ( (V!41290 (val!13617 Int)) )
))
(declare-datatypes ((ValueCell!12851 0))(
  ( (ValueCellFull!12851 (v!16239 V!41289)) (EmptyCell!12851) )
))
(declare-datatypes ((array!71155 0))(
  ( (array!71156 (arr!34248 (Array (_ BitVec 32) ValueCell!12851)) (size!34784 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71155)

(declare-fun e!626476 () Bool)

(declare-fun array_inv!26385 (array!71155) Bool)

(assert (=> start!96518 (and (array_inv!26385 _values!874) e!626476)))

(declare-fun b!1097644 () Bool)

(declare-fun res!732582 () Bool)

(assert (=> b!1097644 (=> (not res!732582) (not e!626474))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097644 (= res!732582 (= (select (arr!34247 _keys!1070) i!650) k!904))))

(declare-fun b!1097645 () Bool)

(declare-fun res!732577 () Bool)

(assert (=> b!1097645 (=> (not res!732577) (not e!626474))))

(assert (=> b!1097645 (= res!732577 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34783 _keys!1070))))))

(declare-fun b!1097646 () Bool)

(declare-fun e!626473 () Bool)

(declare-fun mapRes!42445 () Bool)

(assert (=> b!1097646 (= e!626476 (and e!626473 mapRes!42445))))

(declare-fun condMapEmpty!42445 () Bool)

(declare-fun mapDefault!42445 () ValueCell!12851)

