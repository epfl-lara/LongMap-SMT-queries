; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108426 () Bool)

(assert start!108426)

(declare-fun b_free!27973 () Bool)

(declare-fun b_next!27973 () Bool)

(assert (=> start!108426 (= b_free!27973 (not b_next!27973))))

(declare-fun tp!99028 () Bool)

(declare-fun b_and!46033 () Bool)

(assert (=> start!108426 (= tp!99028 b_and!46033)))

(declare-fun b!1279689 () Bool)

(declare-fun e!731164 () Bool)

(declare-fun e!731162 () Bool)

(declare-fun mapRes!51971 () Bool)

(assert (=> b!1279689 (= e!731164 (and e!731162 mapRes!51971))))

(declare-fun condMapEmpty!51971 () Bool)

(declare-datatypes ((V!49921 0))(
  ( (V!49922 (val!16881 Int)) )
))
(declare-datatypes ((ValueCell!15908 0))(
  ( (ValueCellFull!15908 (v!19481 V!49921)) (EmptyCell!15908) )
))
(declare-datatypes ((array!84310 0))(
  ( (array!84311 (arr!40659 (Array (_ BitVec 32) ValueCell!15908)) (size!41209 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84310)

(declare-fun mapDefault!51971 () ValueCell!15908)

