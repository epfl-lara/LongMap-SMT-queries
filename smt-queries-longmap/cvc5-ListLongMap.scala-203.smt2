; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3900 () Bool)

(assert start!3900)

(declare-fun b_free!805 () Bool)

(declare-fun b_next!805 () Bool)

(assert (=> start!3900 (= b_free!805 (not b_next!805))))

(declare-fun tp!3834 () Bool)

(declare-fun b_and!1615 () Bool)

(assert (=> start!3900 (= tp!3834 b_and!1615)))

(declare-fun b!27456 () Bool)

(declare-fun e!17884 () Bool)

(declare-fun tp_is_empty!1159 () Bool)

(assert (=> b!27456 (= e!17884 tp_is_empty!1159)))

(declare-fun b!27457 () Bool)

(declare-fun res!16255 () Bool)

(declare-fun e!17886 () Bool)

(assert (=> b!27457 (=> (not res!16255) (not e!17886))))

(declare-datatypes ((array!1561 0))(
  ( (array!1562 (arr!734 (Array (_ BitVec 32) (_ BitVec 64))) (size!835 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1561)

(declare-datatypes ((List!620 0))(
  ( (Nil!617) (Cons!616 (h!1183 (_ BitVec 64)) (t!3313 List!620)) )
))
(declare-fun arrayNoDuplicates!0 (array!1561 (_ BitVec 32) List!620) Bool)

(assert (=> b!27457 (= res!16255 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!617))))

(declare-fun mapNonEmpty!1267 () Bool)

(declare-fun mapRes!1267 () Bool)

(declare-fun tp!3835 () Bool)

(declare-fun e!17888 () Bool)

(assert (=> mapNonEmpty!1267 (= mapRes!1267 (and tp!3835 e!17888))))

(declare-datatypes ((V!1371 0))(
  ( (V!1372 (val!606 Int)) )
))
(declare-datatypes ((ValueCell!380 0))(
  ( (ValueCellFull!380 (v!1695 V!1371)) (EmptyCell!380) )
))
(declare-datatypes ((array!1563 0))(
  ( (array!1564 (arr!735 (Array (_ BitVec 32) ValueCell!380)) (size!836 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1563)

(declare-fun mapValue!1267 () ValueCell!380)

(declare-fun mapRest!1267 () (Array (_ BitVec 32) ValueCell!380))

(declare-fun mapKey!1267 () (_ BitVec 32))

(assert (=> mapNonEmpty!1267 (= (arr!735 _values!1501) (store mapRest!1267 mapKey!1267 mapValue!1267))))

(declare-fun b!27458 () Bool)

(declare-fun res!16256 () Bool)

(assert (=> b!27458 (=> (not res!16256) (not e!17886))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1371)

(declare-fun minValue!1443 () V!1371)

(declare-datatypes ((tuple2!1020 0))(
  ( (tuple2!1021 (_1!521 (_ BitVec 64)) (_2!521 V!1371)) )
))
(declare-datatypes ((List!621 0))(
  ( (Nil!618) (Cons!617 (h!1184 tuple2!1020) (t!3314 List!621)) )
))
(declare-datatypes ((ListLongMap!597 0))(
  ( (ListLongMap!598 (toList!314 List!621)) )
))
(declare-fun contains!254 (ListLongMap!597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!144 (array!1561 array!1563 (_ BitVec 32) (_ BitVec 32) V!1371 V!1371 (_ BitVec 32) Int) ListLongMap!597)

(assert (=> b!27458 (= res!16256 (not (contains!254 (getCurrentListMap!144 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27459 () Bool)

(declare-fun e!17885 () Bool)

(assert (=> b!27459 (= e!17885 (and e!17884 mapRes!1267))))

(declare-fun condMapEmpty!1267 () Bool)

(declare-fun mapDefault!1267 () ValueCell!380)

