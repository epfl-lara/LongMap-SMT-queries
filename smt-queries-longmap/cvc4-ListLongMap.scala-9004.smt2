; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108788 () Bool)

(assert start!108788)

(declare-fun b_free!28301 () Bool)

(declare-fun b_next!28301 () Bool)

(assert (=> start!108788 (= b_free!28301 (not b_next!28301))))

(declare-fun tp!100018 () Bool)

(declare-fun b_and!46367 () Bool)

(assert (=> start!108788 (= tp!100018 b_and!46367)))

(declare-fun mapIsEmpty!52469 () Bool)

(declare-fun mapRes!52469 () Bool)

(assert (=> mapIsEmpty!52469 mapRes!52469))

(declare-fun b!1284644 () Bool)

(declare-fun res!853397 () Bool)

(declare-fun e!733819 () Bool)

(assert (=> b!1284644 (=> (not res!853397) (not e!733819))))

(declare-datatypes ((array!84940 0))(
  ( (array!84941 (arr!40972 (Array (_ BitVec 32) (_ BitVec 64))) (size!41522 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84940)

(declare-datatypes ((List!29035 0))(
  ( (Nil!29032) (Cons!29031 (h!30240 (_ BitVec 64)) (t!42579 List!29035)) )
))
(declare-fun arrayNoDuplicates!0 (array!84940 (_ BitVec 32) List!29035) Bool)

(assert (=> b!1284644 (= res!853397 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29032))))

(declare-fun b!1284645 () Bool)

(declare-fun e!733816 () Bool)

(declare-fun tp_is_empty!33941 () Bool)

(assert (=> b!1284645 (= e!733816 tp_is_empty!33941)))

(declare-fun res!853400 () Bool)

(assert (=> start!108788 (=> (not res!853400) (not e!733819))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108788 (= res!853400 (validMask!0 mask!2175))))

(assert (=> start!108788 e!733819))

(assert (=> start!108788 tp_is_empty!33941))

(assert (=> start!108788 true))

(declare-datatypes ((V!50357 0))(
  ( (V!50358 (val!17045 Int)) )
))
(declare-datatypes ((ValueCell!16072 0))(
  ( (ValueCellFull!16072 (v!19647 V!50357)) (EmptyCell!16072) )
))
(declare-datatypes ((array!84942 0))(
  ( (array!84943 (arr!40973 (Array (_ BitVec 32) ValueCell!16072)) (size!41523 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84942)

(declare-fun e!733818 () Bool)

(declare-fun array_inv!31075 (array!84942) Bool)

(assert (=> start!108788 (and (array_inv!31075 _values!1445) e!733818)))

(declare-fun array_inv!31076 (array!84940) Bool)

(assert (=> start!108788 (array_inv!31076 _keys!1741)))

(assert (=> start!108788 tp!100018))

(declare-fun b!1284646 () Bool)

(assert (=> b!1284646 (= e!733818 (and e!733816 mapRes!52469))))

(declare-fun condMapEmpty!52469 () Bool)

(declare-fun mapDefault!52469 () ValueCell!16072)

