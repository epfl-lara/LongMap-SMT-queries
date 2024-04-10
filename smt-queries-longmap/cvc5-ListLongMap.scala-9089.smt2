; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109318 () Bool)

(assert start!109318)

(declare-fun b_free!28807 () Bool)

(declare-fun b_next!28807 () Bool)

(assert (=> start!109318 (= b_free!28807 (not b_next!28807))))

(declare-fun tp!101540 () Bool)

(declare-fun b_and!46897 () Bool)

(assert (=> start!109318 (= tp!101540 b_and!46897)))

(declare-fun b!1293728 () Bool)

(declare-fun e!738321 () Bool)

(declare-fun tp_is_empty!34447 () Bool)

(assert (=> b!1293728 (= e!738321 tp_is_empty!34447)))

(declare-fun b!1293729 () Bool)

(declare-fun e!738319 () Bool)

(declare-fun mapRes!53231 () Bool)

(assert (=> b!1293729 (= e!738319 (and e!738321 mapRes!53231))))

(declare-fun condMapEmpty!53231 () Bool)

(declare-datatypes ((V!51033 0))(
  ( (V!51034 (val!17298 Int)) )
))
(declare-datatypes ((ValueCell!16325 0))(
  ( (ValueCellFull!16325 (v!19901 V!51033)) (EmptyCell!16325) )
))
(declare-datatypes ((array!85922 0))(
  ( (array!85923 (arr!41462 (Array (_ BitVec 32) ValueCell!16325)) (size!42012 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85922)

(declare-fun mapDefault!53231 () ValueCell!16325)

