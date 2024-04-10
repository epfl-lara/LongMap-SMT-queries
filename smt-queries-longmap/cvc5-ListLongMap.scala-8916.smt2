; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108164 () Bool)

(assert start!108164)

(declare-fun b_free!27859 () Bool)

(declare-fun b_next!27859 () Bool)

(assert (=> start!108164 (= b_free!27859 (not b_next!27859))))

(declare-fun tp!98534 () Bool)

(declare-fun b_and!45917 () Bool)

(assert (=> start!108164 (= tp!98534 b_and!45917)))

(declare-fun mapNonEmpty!51647 () Bool)

(declare-fun mapRes!51647 () Bool)

(declare-fun tp!98533 () Bool)

(declare-fun e!729458 () Bool)

(assert (=> mapNonEmpty!51647 (= mapRes!51647 (and tp!98533 e!729458))))

(declare-datatypes ((V!49649 0))(
  ( (V!49650 (val!16779 Int)) )
))
(declare-datatypes ((ValueCell!15806 0))(
  ( (ValueCellFull!15806 (v!19377 V!49649)) (EmptyCell!15806) )
))
(declare-datatypes ((array!83912 0))(
  ( (array!83913 (arr!40466 (Array (_ BitVec 32) ValueCell!15806)) (size!41016 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83912)

(declare-fun mapRest!51647 () (Array (_ BitVec 32) ValueCell!15806))

(declare-fun mapValue!51647 () ValueCell!15806)

(declare-fun mapKey!51647 () (_ BitVec 32))

(assert (=> mapNonEmpty!51647 (= (arr!40466 _values!1187) (store mapRest!51647 mapKey!51647 mapValue!51647))))

(declare-fun b!1277319 () Bool)

(declare-fun res!848762 () Bool)

(declare-fun e!729459 () Bool)

(assert (=> b!1277319 (=> (not res!848762) (not e!729459))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83914 0))(
  ( (array!83915 (arr!40467 (Array (_ BitVec 32) (_ BitVec 64))) (size!41017 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83914)

(assert (=> b!1277319 (= res!848762 (and (= (size!41016 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41017 _keys!1427) (size!41016 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277320 () Bool)

(assert (=> b!1277320 (= e!729459 false)))

(declare-fun lt!575680 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49649)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49649)

(declare-datatypes ((tuple2!21522 0))(
  ( (tuple2!21523 (_1!10772 (_ BitVec 64)) (_2!10772 V!49649)) )
))
(declare-datatypes ((List!28698 0))(
  ( (Nil!28695) (Cons!28694 (h!29903 tuple2!21522) (t!42236 List!28698)) )
))
(declare-datatypes ((ListLongMap!19179 0))(
  ( (ListLongMap!19180 (toList!9605 List!28698)) )
))
(declare-fun contains!7715 (ListLongMap!19179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4689 (array!83914 array!83912 (_ BitVec 32) (_ BitVec 32) V!49649 V!49649 (_ BitVec 32) Int) ListLongMap!19179)

(assert (=> b!1277320 (= lt!575680 (contains!7715 (getCurrentListMap!4689 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277321 () Bool)

(declare-fun res!848760 () Bool)

(assert (=> b!1277321 (=> (not res!848760) (not e!729459))))

(declare-datatypes ((List!28699 0))(
  ( (Nil!28696) (Cons!28695 (h!29904 (_ BitVec 64)) (t!42237 List!28699)) )
))
(declare-fun arrayNoDuplicates!0 (array!83914 (_ BitVec 32) List!28699) Bool)

(assert (=> b!1277321 (= res!848760 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28696))))

(declare-fun b!1277323 () Bool)

(declare-fun tp_is_empty!33409 () Bool)

(assert (=> b!1277323 (= e!729458 tp_is_empty!33409)))

(declare-fun mapIsEmpty!51647 () Bool)

(assert (=> mapIsEmpty!51647 mapRes!51647))

(declare-fun b!1277324 () Bool)

(declare-fun e!729456 () Bool)

(declare-fun e!729455 () Bool)

(assert (=> b!1277324 (= e!729456 (and e!729455 mapRes!51647))))

(declare-fun condMapEmpty!51647 () Bool)

(declare-fun mapDefault!51647 () ValueCell!15806)

