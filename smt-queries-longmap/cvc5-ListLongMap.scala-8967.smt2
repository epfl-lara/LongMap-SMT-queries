; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108528 () Bool)

(assert start!108528)

(declare-fun b_free!28075 () Bool)

(declare-fun b_next!28075 () Bool)

(assert (=> start!108528 (= b_free!28075 (not b_next!28075))))

(declare-fun tp!99335 () Bool)

(declare-fun b_and!46135 () Bool)

(assert (=> start!108528 (= tp!99335 b_and!46135)))

(declare-fun b!1281025 () Bool)

(declare-fun e!731929 () Bool)

(declare-fun tp_is_empty!33715 () Bool)

(assert (=> b!1281025 (= e!731929 tp_is_empty!33715)))

(declare-fun b!1281026 () Bool)

(declare-fun e!731927 () Bool)

(declare-fun e!731930 () Bool)

(declare-fun mapRes!52124 () Bool)

(assert (=> b!1281026 (= e!731927 (and e!731930 mapRes!52124))))

(declare-fun condMapEmpty!52124 () Bool)

(declare-datatypes ((V!50057 0))(
  ( (V!50058 (val!16932 Int)) )
))
(declare-datatypes ((ValueCell!15959 0))(
  ( (ValueCellFull!15959 (v!19532 V!50057)) (EmptyCell!15959) )
))
(declare-datatypes ((array!84504 0))(
  ( (array!84505 (arr!40756 (Array (_ BitVec 32) ValueCell!15959)) (size!41306 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84504)

(declare-fun mapDefault!52124 () ValueCell!15959)

