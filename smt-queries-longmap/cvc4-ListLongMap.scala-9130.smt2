; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109568 () Bool)

(assert start!109568)

(declare-fun b_free!29057 () Bool)

(declare-fun b_next!29057 () Bool)

(assert (=> start!109568 (= b_free!29057 (not b_next!29057))))

(declare-fun tp!102290 () Bool)

(declare-fun b_and!47147 () Bool)

(assert (=> start!109568 (= tp!102290 b_and!47147)))

(declare-fun mapIsEmpty!53606 () Bool)

(declare-fun mapRes!53606 () Bool)

(assert (=> mapIsEmpty!53606 mapRes!53606))

(declare-fun b!1297719 () Bool)

(declare-fun e!740401 () Bool)

(declare-fun e!740399 () Bool)

(assert (=> b!1297719 (= e!740401 (and e!740399 mapRes!53606))))

(declare-fun condMapEmpty!53606 () Bool)

(declare-datatypes ((V!51365 0))(
  ( (V!51366 (val!17423 Int)) )
))
(declare-datatypes ((ValueCell!16450 0))(
  ( (ValueCellFull!16450 (v!20026 V!51365)) (EmptyCell!16450) )
))
(declare-datatypes ((array!86404 0))(
  ( (array!86405 (arr!41703 (Array (_ BitVec 32) ValueCell!16450)) (size!42253 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86404)

(declare-fun mapDefault!53606 () ValueCell!16450)

