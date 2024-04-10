; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3934 () Bool)

(assert start!3934)

(declare-fun b_free!839 () Bool)

(declare-fun b_next!839 () Bool)

(assert (=> start!3934 (= b_free!839 (not b_next!839))))

(declare-fun tp!3936 () Bool)

(declare-fun b_and!1649 () Bool)

(assert (=> start!3934 (= tp!3936 b_and!1649)))

(declare-fun mapIsEmpty!1318 () Bool)

(declare-fun mapRes!1318 () Bool)

(assert (=> mapIsEmpty!1318 mapRes!1318))

(declare-fun b!27966 () Bool)

(declare-fun e!18139 () Bool)

(declare-fun tp_is_empty!1193 () Bool)

(assert (=> b!27966 (= e!18139 tp_is_empty!1193)))

(declare-fun mapNonEmpty!1318 () Bool)

(declare-fun tp!3937 () Bool)

(declare-fun e!18140 () Bool)

(assert (=> mapNonEmpty!1318 (= mapRes!1318 (and tp!3937 e!18140))))

(declare-datatypes ((V!1415 0))(
  ( (V!1416 (val!623 Int)) )
))
(declare-datatypes ((ValueCell!397 0))(
  ( (ValueCellFull!397 (v!1712 V!1415)) (EmptyCell!397) )
))
(declare-fun mapRest!1318 () (Array (_ BitVec 32) ValueCell!397))

(declare-fun mapValue!1318 () ValueCell!397)

(declare-fun mapKey!1318 () (_ BitVec 32))

(declare-datatypes ((array!1627 0))(
  ( (array!1628 (arr!767 (Array (_ BitVec 32) ValueCell!397)) (size!868 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1627)

(assert (=> mapNonEmpty!1318 (= (arr!767 _values!1501) (store mapRest!1318 mapKey!1318 mapValue!1318))))

(declare-fun b!27967 () Bool)

(declare-fun res!16614 () Bool)

(declare-fun e!18142 () Bool)

(assert (=> b!27967 (=> (not res!16614) (not e!18142))))

(declare-datatypes ((array!1629 0))(
  ( (array!1630 (arr!768 (Array (_ BitVec 32) (_ BitVec 64))) (size!869 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1629)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1629 (_ BitVec 32)) Bool)

(assert (=> b!27967 (= res!16614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27968 () Bool)

(declare-fun res!16613 () Bool)

(assert (=> b!27968 (=> (not res!16613) (not e!18142))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27968 (= res!16613 (validKeyInArray!0 k!1304))))

(declare-fun b!27970 () Bool)

(declare-fun res!16612 () Bool)

(assert (=> b!27970 (=> (not res!16612) (not e!18142))))

(declare-fun arrayContainsKey!0 (array!1629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27970 (= res!16612 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27971 () Bool)

(assert (=> b!27971 (= e!18140 tp_is_empty!1193)))

(declare-fun b!27972 () Bool)

(declare-fun e!18143 () Bool)

(assert (=> b!27972 (= e!18143 (and e!18139 mapRes!1318))))

(declare-fun condMapEmpty!1318 () Bool)

(declare-fun mapDefault!1318 () ValueCell!397)

