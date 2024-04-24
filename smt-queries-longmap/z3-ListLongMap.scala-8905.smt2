; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108304 () Bool)

(assert start!108304)

(declare-fun b_free!27793 () Bool)

(declare-fun b_next!27793 () Bool)

(assert (=> start!108304 (= b_free!27793 (not b_next!27793))))

(declare-fun tp!98333 () Bool)

(declare-fun b_and!45851 () Bool)

(assert (=> start!108304 (= tp!98333 b_and!45851)))

(declare-fun b!1277703 () Bool)

(declare-fun res!848780 () Bool)

(declare-fun e!729702 () Bool)

(assert (=> b!1277703 (=> (not res!848780) (not e!729702))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83809 0))(
  ( (array!83810 (arr!40411 (Array (_ BitVec 32) (_ BitVec 64))) (size!40962 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83809)

(declare-datatypes ((V!49561 0))(
  ( (V!49562 (val!16746 Int)) )
))
(declare-datatypes ((ValueCell!15773 0))(
  ( (ValueCellFull!15773 (v!19338 V!49561)) (EmptyCell!15773) )
))
(declare-datatypes ((array!83811 0))(
  ( (array!83812 (arr!40412 (Array (_ BitVec 32) ValueCell!15773)) (size!40963 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83811)

(assert (=> b!1277703 (= res!848780 (and (= (size!40963 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40962 _keys!1427) (size!40963 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277704 () Bool)

(assert (=> b!1277704 (= e!729702 false)))

(declare-fun minValue!1129 () V!49561)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49561)

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575966 () Bool)

(declare-datatypes ((tuple2!21488 0))(
  ( (tuple2!21489 (_1!10755 (_ BitVec 64)) (_2!10755 V!49561)) )
))
(declare-datatypes ((List!28681 0))(
  ( (Nil!28678) (Cons!28677 (h!29895 tuple2!21488) (t!42209 List!28681)) )
))
(declare-datatypes ((ListLongMap!19153 0))(
  ( (ListLongMap!19154 (toList!9592 List!28681)) )
))
(declare-fun contains!7716 (ListLongMap!19153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4661 (array!83809 array!83811 (_ BitVec 32) (_ BitVec 32) V!49561 V!49561 (_ BitVec 32) Int) ListLongMap!19153)

(assert (=> b!1277704 (= lt!575966 (contains!7716 (getCurrentListMap!4661 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277705 () Bool)

(declare-fun res!848782 () Bool)

(assert (=> b!1277705 (=> (not res!848782) (not e!729702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83809 (_ BitVec 32)) Bool)

(assert (=> b!1277705 (= res!848782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277706 () Bool)

(declare-fun e!729703 () Bool)

(declare-fun e!729701 () Bool)

(declare-fun mapRes!51545 () Bool)

(assert (=> b!1277706 (= e!729703 (and e!729701 mapRes!51545))))

(declare-fun condMapEmpty!51545 () Bool)

(declare-fun mapDefault!51545 () ValueCell!15773)

(assert (=> b!1277706 (= condMapEmpty!51545 (= (arr!40412 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15773)) mapDefault!51545)))))

(declare-fun b!1277707 () Bool)

(declare-fun res!848779 () Bool)

(assert (=> b!1277707 (=> (not res!848779) (not e!729702))))

(declare-datatypes ((List!28682 0))(
  ( (Nil!28679) (Cons!28678 (h!29896 (_ BitVec 64)) (t!42210 List!28682)) )
))
(declare-fun arrayNoDuplicates!0 (array!83809 (_ BitVec 32) List!28682) Bool)

(assert (=> b!1277707 (= res!848779 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28679))))

(declare-fun mapNonEmpty!51545 () Bool)

(declare-fun tp!98332 () Bool)

(declare-fun e!729699 () Bool)

(assert (=> mapNonEmpty!51545 (= mapRes!51545 (and tp!98332 e!729699))))

(declare-fun mapKey!51545 () (_ BitVec 32))

(declare-fun mapValue!51545 () ValueCell!15773)

(declare-fun mapRest!51545 () (Array (_ BitVec 32) ValueCell!15773))

(assert (=> mapNonEmpty!51545 (= (arr!40412 _values!1187) (store mapRest!51545 mapKey!51545 mapValue!51545))))

(declare-fun mapIsEmpty!51545 () Bool)

(assert (=> mapIsEmpty!51545 mapRes!51545))

(declare-fun b!1277708 () Bool)

(declare-fun tp_is_empty!33343 () Bool)

(assert (=> b!1277708 (= e!729701 tp_is_empty!33343)))

(declare-fun b!1277702 () Bool)

(assert (=> b!1277702 (= e!729699 tp_is_empty!33343)))

(declare-fun res!848781 () Bool)

(assert (=> start!108304 (=> (not res!848781) (not e!729702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108304 (= res!848781 (validMask!0 mask!1805))))

(assert (=> start!108304 e!729702))

(assert (=> start!108304 true))

(assert (=> start!108304 tp!98333))

(assert (=> start!108304 tp_is_empty!33343))

(declare-fun array_inv!30899 (array!83811) Bool)

(assert (=> start!108304 (and (array_inv!30899 _values!1187) e!729703)))

(declare-fun array_inv!30900 (array!83809) Bool)

(assert (=> start!108304 (array_inv!30900 _keys!1427)))

(assert (= (and start!108304 res!848781) b!1277703))

(assert (= (and b!1277703 res!848780) b!1277705))

(assert (= (and b!1277705 res!848782) b!1277707))

(assert (= (and b!1277707 res!848779) b!1277704))

(assert (= (and b!1277706 condMapEmpty!51545) mapIsEmpty!51545))

(assert (= (and b!1277706 (not condMapEmpty!51545)) mapNonEmpty!51545))

(get-info :version)

(assert (= (and mapNonEmpty!51545 ((_ is ValueCellFull!15773) mapValue!51545)) b!1277702))

(assert (= (and b!1277706 ((_ is ValueCellFull!15773) mapDefault!51545)) b!1277708))

(assert (= start!108304 b!1277706))

(declare-fun m!1173933 () Bool)

(assert (=> b!1277704 m!1173933))

(assert (=> b!1277704 m!1173933))

(declare-fun m!1173935 () Bool)

(assert (=> b!1277704 m!1173935))

(declare-fun m!1173937 () Bool)

(assert (=> mapNonEmpty!51545 m!1173937))

(declare-fun m!1173939 () Bool)

(assert (=> b!1277705 m!1173939))

(declare-fun m!1173941 () Bool)

(assert (=> start!108304 m!1173941))

(declare-fun m!1173943 () Bool)

(assert (=> start!108304 m!1173943))

(declare-fun m!1173945 () Bool)

(assert (=> start!108304 m!1173945))

(declare-fun m!1173947 () Bool)

(assert (=> b!1277707 m!1173947))

(check-sat (not b!1277705) b_and!45851 (not start!108304) (not b!1277704) (not b!1277707) tp_is_empty!33343 (not mapNonEmpty!51545) (not b_next!27793))
(check-sat b_and!45851 (not b_next!27793))
