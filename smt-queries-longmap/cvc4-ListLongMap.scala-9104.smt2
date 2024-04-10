; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109412 () Bool)

(assert start!109412)

(declare-fun b_free!28901 () Bool)

(declare-fun b_next!28901 () Bool)

(assert (=> start!109412 (= b_free!28901 (not b_next!28901))))

(declare-fun tp!101822 () Bool)

(declare-fun b_and!46991 () Bool)

(assert (=> start!109412 (= tp!101822 b_and!46991)))

(declare-fun b!1295339 () Bool)

(declare-fun res!860908 () Bool)

(declare-fun e!739083 () Bool)

(assert (=> b!1295339 (=> (not res!860908) (not e!739083))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86102 0))(
  ( (array!86103 (arr!41552 (Array (_ BitVec 32) (_ BitVec 64))) (size!42102 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86102)

(assert (=> b!1295339 (= res!860908 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42102 _keys!1741))))))

(declare-fun b!1295340 () Bool)

(declare-fun e!739086 () Bool)

(declare-fun tp_is_empty!34541 () Bool)

(assert (=> b!1295340 (= e!739086 tp_is_empty!34541)))

(declare-fun b!1295341 () Bool)

(declare-fun e!739084 () Bool)

(declare-fun mapRes!53372 () Bool)

(assert (=> b!1295341 (= e!739084 (and e!739086 mapRes!53372))))

(declare-fun condMapEmpty!53372 () Bool)

(declare-datatypes ((V!51157 0))(
  ( (V!51158 (val!17345 Int)) )
))
(declare-datatypes ((ValueCell!16372 0))(
  ( (ValueCellFull!16372 (v!19948 V!51157)) (EmptyCell!16372) )
))
(declare-datatypes ((array!86104 0))(
  ( (array!86105 (arr!41553 (Array (_ BitVec 32) ValueCell!16372)) (size!42103 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86104)

(declare-fun mapDefault!53372 () ValueCell!16372)

