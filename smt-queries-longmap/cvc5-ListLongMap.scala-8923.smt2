; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108206 () Bool)

(assert start!108206)

(declare-fun b_free!27901 () Bool)

(declare-fun b_next!27901 () Bool)

(assert (=> start!108206 (= b_free!27901 (not b_next!27901))))

(declare-fun tp!98659 () Bool)

(declare-fun b_and!45959 () Bool)

(assert (=> start!108206 (= tp!98659 b_and!45959)))

(declare-fun b!1277762 () Bool)

(declare-fun e!729770 () Bool)

(declare-fun tp_is_empty!33451 () Bool)

(assert (=> b!1277762 (= e!729770 tp_is_empty!33451)))

(declare-fun b!1277763 () Bool)

(declare-fun res!849016 () Bool)

(declare-fun e!729774 () Bool)

(assert (=> b!1277763 (=> (not res!849016) (not e!729774))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83992 0))(
  ( (array!83993 (arr!40506 (Array (_ BitVec 32) (_ BitVec 64))) (size!41056 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83992)

(declare-datatypes ((V!49705 0))(
  ( (V!49706 (val!16800 Int)) )
))
(declare-datatypes ((ValueCell!15827 0))(
  ( (ValueCellFull!15827 (v!19398 V!49705)) (EmptyCell!15827) )
))
(declare-datatypes ((array!83994 0))(
  ( (array!83995 (arr!40507 (Array (_ BitVec 32) ValueCell!15827)) (size!41057 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83994)

(assert (=> b!1277763 (= res!849016 (and (= (size!41057 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41056 _keys!1427) (size!41057 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51710 () Bool)

(declare-fun mapRes!51710 () Bool)

(declare-fun tp!98660 () Bool)

(declare-fun e!729773 () Bool)

(assert (=> mapNonEmpty!51710 (= mapRes!51710 (and tp!98660 e!729773))))

(declare-fun mapRest!51710 () (Array (_ BitVec 32) ValueCell!15827))

(declare-fun mapKey!51710 () (_ BitVec 32))

(declare-fun mapValue!51710 () ValueCell!15827)

(assert (=> mapNonEmpty!51710 (= (arr!40507 _values!1187) (store mapRest!51710 mapKey!51710 mapValue!51710))))

(declare-fun b!1277764 () Bool)

(declare-fun res!849015 () Bool)

(assert (=> b!1277764 (=> (not res!849015) (not e!729774))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49705)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49705)

(declare-datatypes ((tuple2!21548 0))(
  ( (tuple2!21549 (_1!10785 (_ BitVec 64)) (_2!10785 V!49705)) )
))
(declare-datatypes ((List!28725 0))(
  ( (Nil!28722) (Cons!28721 (h!29930 tuple2!21548) (t!42263 List!28725)) )
))
(declare-datatypes ((ListLongMap!19205 0))(
  ( (ListLongMap!19206 (toList!9618 List!28725)) )
))
(declare-fun contains!7728 (ListLongMap!19205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4702 (array!83992 array!83994 (_ BitVec 32) (_ BitVec 32) V!49705 V!49705 (_ BitVec 32) Int) ListLongMap!19205)

(assert (=> b!1277764 (= res!849015 (contains!7728 (getCurrentListMap!4702 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1277765 () Bool)

(assert (=> b!1277765 (= e!729774 (bvsge #b00000000000000000000000000000000 (size!41056 _keys!1427)))))

(declare-fun b!1277766 () Bool)

(declare-fun e!729772 () Bool)

(assert (=> b!1277766 (= e!729772 (and e!729770 mapRes!51710))))

(declare-fun condMapEmpty!51710 () Bool)

(declare-fun mapDefault!51710 () ValueCell!15827)

