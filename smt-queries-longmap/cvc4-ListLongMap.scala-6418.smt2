; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82308 () Bool)

(assert start!82308)

(declare-fun b_free!18581 () Bool)

(declare-fun b_next!18581 () Bool)

(assert (=> start!82308 (= b_free!18581 (not b_next!18581))))

(declare-fun tp!64704 () Bool)

(declare-fun b_and!30069 () Bool)

(assert (=> start!82308 (= tp!64704 b_and!30069)))

(declare-fun b!959602 () Bool)

(declare-fun e!540930 () Bool)

(declare-fun e!540926 () Bool)

(declare-fun mapRes!33910 () Bool)

(assert (=> b!959602 (= e!540930 (and e!540926 mapRes!33910))))

(declare-fun condMapEmpty!33910 () Bool)

(declare-datatypes ((V!33365 0))(
  ( (V!33366 (val!10694 Int)) )
))
(declare-datatypes ((ValueCell!10162 0))(
  ( (ValueCellFull!10162 (v!13251 V!33365)) (EmptyCell!10162) )
))
(declare-datatypes ((array!58667 0))(
  ( (array!58668 (arr!28207 (Array (_ BitVec 32) ValueCell!10162)) (size!28686 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58667)

(declare-fun mapDefault!33910 () ValueCell!10162)

