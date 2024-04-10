; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108736 () Bool)

(assert start!108736)

(declare-fun b_free!28249 () Bool)

(declare-fun b_next!28249 () Bool)

(assert (=> start!108736 (= b_free!28249 (not b_next!28249))))

(declare-fun tp!99862 () Bool)

(declare-fun b_and!46315 () Bool)

(assert (=> start!108736 (= tp!99862 b_and!46315)))

(declare-fun b!1283920 () Bool)

(declare-fun res!852910 () Bool)

(declare-fun e!733428 () Bool)

(assert (=> b!1283920 (=> (not res!852910) (not e!733428))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283920 (= res!852910 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283921 () Bool)

(declare-fun e!733430 () Bool)

(declare-fun tp_is_empty!33889 () Bool)

(assert (=> b!1283921 (= e!733430 tp_is_empty!33889)))

(declare-fun mapIsEmpty!52391 () Bool)

(declare-fun mapRes!52391 () Bool)

(assert (=> mapIsEmpty!52391 mapRes!52391))

(declare-fun b!1283922 () Bool)

(declare-fun e!733429 () Bool)

(assert (=> b!1283922 (= e!733429 (and e!733430 mapRes!52391))))

(declare-fun condMapEmpty!52391 () Bool)

(declare-datatypes ((V!50289 0))(
  ( (V!50290 (val!17019 Int)) )
))
(declare-datatypes ((ValueCell!16046 0))(
  ( (ValueCellFull!16046 (v!19621 V!50289)) (EmptyCell!16046) )
))
(declare-datatypes ((array!84838 0))(
  ( (array!84839 (arr!40921 (Array (_ BitVec 32) ValueCell!16046)) (size!41471 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84838)

(declare-fun mapDefault!52391 () ValueCell!16046)

