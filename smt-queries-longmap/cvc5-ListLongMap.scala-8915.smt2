; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108158 () Bool)

(assert start!108158)

(declare-fun b_free!27853 () Bool)

(declare-fun b_next!27853 () Bool)

(assert (=> start!108158 (= b_free!27853 (not b_next!27853))))

(declare-fun tp!98516 () Bool)

(declare-fun b_and!45911 () Bool)

(assert (=> start!108158 (= tp!98516 b_and!45911)))

(declare-fun b!1277256 () Bool)

(declare-fun e!729410 () Bool)

(declare-fun tp_is_empty!33403 () Bool)

(assert (=> b!1277256 (= e!729410 tp_is_empty!33403)))

(declare-fun b!1277257 () Bool)

(declare-fun res!848725 () Bool)

(declare-fun e!729413 () Bool)

(assert (=> b!1277257 (=> (not res!848725) (not e!729413))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83900 0))(
  ( (array!83901 (arr!40460 (Array (_ BitVec 32) (_ BitVec 64))) (size!41010 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83900)

(declare-datatypes ((V!49641 0))(
  ( (V!49642 (val!16776 Int)) )
))
(declare-datatypes ((ValueCell!15803 0))(
  ( (ValueCellFull!15803 (v!19374 V!49641)) (EmptyCell!15803) )
))
(declare-datatypes ((array!83902 0))(
  ( (array!83903 (arr!40461 (Array (_ BitVec 32) ValueCell!15803)) (size!41011 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83902)

(assert (=> b!1277257 (= res!848725 (and (= (size!41011 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41010 _keys!1427) (size!41011 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277258 () Bool)

(declare-fun e!729414 () Bool)

(assert (=> b!1277258 (= e!729414 tp_is_empty!33403)))

(declare-fun b!1277259 () Bool)

(declare-fun res!848726 () Bool)

(assert (=> b!1277259 (=> (not res!848726) (not e!729413))))

(declare-datatypes ((List!28694 0))(
  ( (Nil!28691) (Cons!28690 (h!29899 (_ BitVec 64)) (t!42232 List!28694)) )
))
(declare-fun arrayNoDuplicates!0 (array!83900 (_ BitVec 32) List!28694) Bool)

(assert (=> b!1277259 (= res!848726 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28691))))

(declare-fun b!1277260 () Bool)

(declare-fun res!848727 () Bool)

(assert (=> b!1277260 (=> (not res!848727) (not e!729413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83900 (_ BitVec 32)) Bool)

(assert (=> b!1277260 (= res!848727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!848724 () Bool)

(assert (=> start!108158 (=> (not res!848724) (not e!729413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108158 (= res!848724 (validMask!0 mask!1805))))

(assert (=> start!108158 e!729413))

(assert (=> start!108158 true))

(assert (=> start!108158 tp!98516))

(assert (=> start!108158 tp_is_empty!33403))

(declare-fun e!729411 () Bool)

(declare-fun array_inv!30741 (array!83902) Bool)

(assert (=> start!108158 (and (array_inv!30741 _values!1187) e!729411)))

(declare-fun array_inv!30742 (array!83900) Bool)

(assert (=> start!108158 (array_inv!30742 _keys!1427)))

(declare-fun mapIsEmpty!51638 () Bool)

(declare-fun mapRes!51638 () Bool)

(assert (=> mapIsEmpty!51638 mapRes!51638))

(declare-fun b!1277261 () Bool)

(assert (=> b!1277261 (= e!729413 false)))

(declare-fun lt!575671 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49641)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49641)

(declare-datatypes ((tuple2!21518 0))(
  ( (tuple2!21519 (_1!10770 (_ BitVec 64)) (_2!10770 V!49641)) )
))
(declare-datatypes ((List!28695 0))(
  ( (Nil!28692) (Cons!28691 (h!29900 tuple2!21518) (t!42233 List!28695)) )
))
(declare-datatypes ((ListLongMap!19175 0))(
  ( (ListLongMap!19176 (toList!9603 List!28695)) )
))
(declare-fun contains!7713 (ListLongMap!19175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4687 (array!83900 array!83902 (_ BitVec 32) (_ BitVec 32) V!49641 V!49641 (_ BitVec 32) Int) ListLongMap!19175)

(assert (=> b!1277261 (= lt!575671 (contains!7713 (getCurrentListMap!4687 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277262 () Bool)

(assert (=> b!1277262 (= e!729411 (and e!729414 mapRes!51638))))

(declare-fun condMapEmpty!51638 () Bool)

(declare-fun mapDefault!51638 () ValueCell!15803)

