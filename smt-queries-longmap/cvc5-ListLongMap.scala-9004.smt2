; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108784 () Bool)

(assert start!108784)

(declare-fun b_free!28297 () Bool)

(declare-fun b_next!28297 () Bool)

(assert (=> start!108784 (= b_free!28297 (not b_next!28297))))

(declare-fun tp!100007 () Bool)

(declare-fun b_and!46363 () Bool)

(assert (=> start!108784 (= tp!100007 b_and!46363)))

(declare-fun b!1284596 () Bool)

(declare-fun res!853371 () Bool)

(declare-fun e!733786 () Bool)

(assert (=> b!1284596 (=> (not res!853371) (not e!733786))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50353 0))(
  ( (V!50354 (val!17043 Int)) )
))
(declare-datatypes ((ValueCell!16070 0))(
  ( (ValueCellFull!16070 (v!19645 V!50353)) (EmptyCell!16070) )
))
(declare-datatypes ((array!84932 0))(
  ( (array!84933 (arr!40968 (Array (_ BitVec 32) ValueCell!16070)) (size!41518 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84932)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84934 0))(
  ( (array!84935 (arr!40969 (Array (_ BitVec 32) (_ BitVec 64))) (size!41519 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84934)

(assert (=> b!1284596 (= res!853371 (and (= (size!41518 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41519 _keys!1741) (size!41518 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284597 () Bool)

(declare-fun e!733789 () Bool)

(declare-fun e!733788 () Bool)

(declare-fun mapRes!52463 () Bool)

(assert (=> b!1284597 (= e!733789 (and e!733788 mapRes!52463))))

(declare-fun condMapEmpty!52463 () Bool)

(declare-fun mapDefault!52463 () ValueCell!16070)

