; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108086 () Bool)

(assert start!108086)

(declare-fun b_free!27799 () Bool)

(declare-fun b_next!27799 () Bool)

(assert (=> start!108086 (= b_free!27799 (not b_next!27799))))

(declare-fun tp!98351 () Bool)

(declare-fun b_and!45855 () Bool)

(assert (=> start!108086 (= tp!98351 b_and!45855)))

(declare-fun b!1276460 () Bool)

(declare-fun e!728897 () Bool)

(declare-fun tp_is_empty!33349 () Bool)

(assert (=> b!1276460 (= e!728897 tp_is_empty!33349)))

(declare-fun b!1276461 () Bool)

(declare-fun e!728898 () Bool)

(assert (=> b!1276461 (= e!728898 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun lt!575491 () Bool)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49569 0))(
  ( (V!49570 (val!16749 Int)) )
))
(declare-fun minValue!1129 () V!49569)

(declare-fun k!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15776 0))(
  ( (ValueCellFull!15776 (v!19346 V!49569)) (EmptyCell!15776) )
))
(declare-datatypes ((array!83792 0))(
  ( (array!83793 (arr!40407 (Array (_ BitVec 32) ValueCell!15776)) (size!40957 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83792)

(declare-fun zeroValue!1129 () V!49569)

(declare-datatypes ((array!83794 0))(
  ( (array!83795 (arr!40408 (Array (_ BitVec 32) (_ BitVec 64))) (size!40958 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83794)

(declare-datatypes ((tuple2!21482 0))(
  ( (tuple2!21483 (_1!10752 (_ BitVec 64)) (_2!10752 V!49569)) )
))
(declare-datatypes ((List!28656 0))(
  ( (Nil!28653) (Cons!28652 (h!29861 tuple2!21482) (t!42192 List!28656)) )
))
(declare-datatypes ((ListLongMap!19139 0))(
  ( (ListLongMap!19140 (toList!9585 List!28656)) )
))
(declare-fun contains!7694 (ListLongMap!19139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4669 (array!83794 array!83792 (_ BitVec 32) (_ BitVec 32) V!49569 V!49569 (_ BitVec 32) Int) ListLongMap!19139)

(assert (=> b!1276461 (= lt!575491 (contains!7694 (getCurrentListMap!4669 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276462 () Bool)

(declare-fun res!848295 () Bool)

(assert (=> b!1276462 (=> (not res!848295) (not e!728898))))

(declare-datatypes ((List!28657 0))(
  ( (Nil!28654) (Cons!28653 (h!29862 (_ BitVec 64)) (t!42193 List!28657)) )
))
(declare-fun arrayNoDuplicates!0 (array!83794 (_ BitVec 32) List!28657) Bool)

(assert (=> b!1276462 (= res!848295 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28654))))

(declare-fun res!848296 () Bool)

(assert (=> start!108086 (=> (not res!848296) (not e!728898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108086 (= res!848296 (validMask!0 mask!1805))))

(assert (=> start!108086 e!728898))

(assert (=> start!108086 true))

(assert (=> start!108086 tp!98351))

(assert (=> start!108086 tp_is_empty!33349))

(declare-fun e!728900 () Bool)

(declare-fun array_inv!30709 (array!83792) Bool)

(assert (=> start!108086 (and (array_inv!30709 _values!1187) e!728900)))

(declare-fun array_inv!30710 (array!83794) Bool)

(assert (=> start!108086 (array_inv!30710 _keys!1427)))

(declare-fun mapNonEmpty!51554 () Bool)

(declare-fun mapRes!51554 () Bool)

(declare-fun tp!98350 () Bool)

(declare-fun e!728899 () Bool)

(assert (=> mapNonEmpty!51554 (= mapRes!51554 (and tp!98350 e!728899))))

(declare-fun mapValue!51554 () ValueCell!15776)

(declare-fun mapRest!51554 () (Array (_ BitVec 32) ValueCell!15776))

(declare-fun mapKey!51554 () (_ BitVec 32))

(assert (=> mapNonEmpty!51554 (= (arr!40407 _values!1187) (store mapRest!51554 mapKey!51554 mapValue!51554))))

(declare-fun b!1276463 () Bool)

(assert (=> b!1276463 (= e!728899 tp_is_empty!33349)))

(declare-fun b!1276464 () Bool)

(declare-fun res!848297 () Bool)

(assert (=> b!1276464 (=> (not res!848297) (not e!728898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83794 (_ BitVec 32)) Bool)

(assert (=> b!1276464 (= res!848297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276465 () Bool)

(declare-fun res!848298 () Bool)

(assert (=> b!1276465 (=> (not res!848298) (not e!728898))))

(assert (=> b!1276465 (= res!848298 (and (= (size!40957 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40958 _keys!1427) (size!40957 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51554 () Bool)

(assert (=> mapIsEmpty!51554 mapRes!51554))

(declare-fun b!1276466 () Bool)

(assert (=> b!1276466 (= e!728900 (and e!728897 mapRes!51554))))

(declare-fun condMapEmpty!51554 () Bool)

(declare-fun mapDefault!51554 () ValueCell!15776)

