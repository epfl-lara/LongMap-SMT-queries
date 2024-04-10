; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97848 () Bool)

(assert start!97848)

(declare-fun b_free!23549 () Bool)

(declare-fun b_next!23549 () Bool)

(assert (=> start!97848 (= b_free!23549 (not b_next!23549))))

(declare-fun tp!83350 () Bool)

(declare-fun b_and!37881 () Bool)

(assert (=> start!97848 (= tp!83350 b_and!37881)))

(declare-fun b!1120002 () Bool)

(declare-fun e!637806 () Bool)

(declare-fun tp_is_empty!28079 () Bool)

(assert (=> b!1120002 (= e!637806 tp_is_empty!28079)))

(declare-fun b!1120003 () Bool)

(declare-fun e!637802 () Bool)

(declare-fun mapRes!43936 () Bool)

(assert (=> b!1120003 (= e!637802 (and e!637806 mapRes!43936))))

(declare-fun condMapEmpty!43936 () Bool)

(declare-datatypes ((V!42565 0))(
  ( (V!42566 (val!14096 Int)) )
))
(declare-datatypes ((ValueCell!13330 0))(
  ( (ValueCellFull!13330 (v!16729 V!42565)) (EmptyCell!13330) )
))
(declare-datatypes ((array!73041 0))(
  ( (array!73042 (arr!35173 (Array (_ BitVec 32) ValueCell!13330)) (size!35709 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73041)

(declare-fun mapDefault!43936 () ValueCell!13330)

