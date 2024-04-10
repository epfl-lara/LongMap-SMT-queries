; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4000 () Bool)

(assert start!4000)

(declare-fun b_free!905 () Bool)

(declare-fun b_next!905 () Bool)

(assert (=> start!4000 (= b_free!905 (not b_next!905))))

(declare-fun tp!4135 () Bool)

(declare-fun b_and!1715 () Bool)

(assert (=> start!4000 (= tp!4135 b_and!1715)))

(declare-fun b!29001 () Bool)

(declare-fun e!18742 () Bool)

(declare-fun e!18745 () Bool)

(declare-fun mapRes!1417 () Bool)

(assert (=> b!29001 (= e!18742 (and e!18745 mapRes!1417))))

(declare-fun condMapEmpty!1417 () Bool)

(declare-datatypes ((V!1503 0))(
  ( (V!1504 (val!656 Int)) )
))
(declare-datatypes ((ValueCell!430 0))(
  ( (ValueCellFull!430 (v!1745 V!1503)) (EmptyCell!430) )
))
(declare-datatypes ((array!1753 0))(
  ( (array!1754 (arr!830 (Array (_ BitVec 32) ValueCell!430)) (size!931 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1753)

(declare-fun mapDefault!1417 () ValueCell!430)

