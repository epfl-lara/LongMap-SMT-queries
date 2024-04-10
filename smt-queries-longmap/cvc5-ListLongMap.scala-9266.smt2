; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110944 () Bool)

(assert start!110944)

(declare-fun b_free!29779 () Bool)

(declare-fun b_next!29779 () Bool)

(assert (=> start!110944 (= b_free!29779 (not b_next!29779))))

(declare-fun tp!104658 () Bool)

(declare-fun b_and!47987 () Bool)

(assert (=> start!110944 (= tp!104658 b_and!47987)))

(declare-fun b!1313486 () Bool)

(declare-fun e!749207 () Bool)

(declare-fun tp_is_empty!35509 () Bool)

(assert (=> b!1313486 (= e!749207 tp_is_empty!35509)))

(declare-fun b!1313487 () Bool)

(declare-fun res!872028 () Bool)

(declare-fun e!749203 () Bool)

(assert (=> b!1313487 (=> (not res!872028) (not e!749203))))

(declare-datatypes ((array!87996 0))(
  ( (array!87997 (arr!42478 (Array (_ BitVec 32) (_ BitVec 64))) (size!43028 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87996)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313487 (= res!872028 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43028 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313488 () Bool)

(declare-fun e!749204 () Bool)

(declare-fun mapRes!54892 () Bool)

(assert (=> b!1313488 (= e!749204 (and e!749207 mapRes!54892))))

(declare-fun condMapEmpty!54892 () Bool)

(declare-datatypes ((V!52449 0))(
  ( (V!52450 (val!17829 Int)) )
))
(declare-datatypes ((ValueCell!16856 0))(
  ( (ValueCellFull!16856 (v!20456 V!52449)) (EmptyCell!16856) )
))
(declare-datatypes ((array!87998 0))(
  ( (array!87999 (arr!42479 (Array (_ BitVec 32) ValueCell!16856)) (size!43029 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87998)

(declare-fun mapDefault!54892 () ValueCell!16856)

