; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108170 () Bool)

(assert start!108170)

(declare-fun b_free!27865 () Bool)

(declare-fun b_next!27865 () Bool)

(assert (=> start!108170 (= b_free!27865 (not b_next!27865))))

(declare-fun tp!98553 () Bool)

(declare-fun b_and!45905 () Bool)

(assert (=> start!108170 (= tp!98553 b_and!45905)))

(declare-fun b!1277318 () Bool)

(declare-fun e!729474 () Bool)

(declare-fun e!729473 () Bool)

(declare-fun mapRes!51656 () Bool)

(assert (=> b!1277318 (= e!729474 (and e!729473 mapRes!51656))))

(declare-fun condMapEmpty!51656 () Bool)

(declare-datatypes ((V!49657 0))(
  ( (V!49658 (val!16782 Int)) )
))
(declare-datatypes ((ValueCell!15809 0))(
  ( (ValueCellFull!15809 (v!19379 V!49657)) (EmptyCell!15809) )
))
(declare-datatypes ((array!83821 0))(
  ( (array!83822 (arr!40421 (Array (_ BitVec 32) ValueCell!15809)) (size!40973 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83821)

(declare-fun mapDefault!51656 () ValueCell!15809)

(assert (=> b!1277318 (= condMapEmpty!51656 (= (arr!40421 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15809)) mapDefault!51656)))))

(declare-fun mapNonEmpty!51656 () Bool)

(declare-fun tp!98552 () Bool)

(declare-fun e!729475 () Bool)

(assert (=> mapNonEmpty!51656 (= mapRes!51656 (and tp!98552 e!729475))))

(declare-fun mapKey!51656 () (_ BitVec 32))

(declare-fun mapValue!51656 () ValueCell!15809)

(declare-fun mapRest!51656 () (Array (_ BitVec 32) ValueCell!15809))

(assert (=> mapNonEmpty!51656 (= (arr!40421 _values!1187) (store mapRest!51656 mapKey!51656 mapValue!51656))))

(declare-fun b!1277319 () Bool)

(declare-fun res!848771 () Bool)

(declare-fun e!729472 () Bool)

(assert (=> b!1277319 (=> (not res!848771) (not e!729472))))

(declare-datatypes ((array!83823 0))(
  ( (array!83824 (arr!40422 (Array (_ BitVec 32) (_ BitVec 64))) (size!40974 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83823)

(declare-datatypes ((List!28775 0))(
  ( (Nil!28772) (Cons!28771 (h!29980 (_ BitVec 64)) (t!42305 List!28775)) )
))
(declare-fun arrayNoDuplicates!0 (array!83823 (_ BitVec 32) List!28775) Bool)

(assert (=> b!1277319 (= res!848771 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28772))))

(declare-fun b!1277320 () Bool)

(assert (=> b!1277320 (= e!729472 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49657)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575511 () Bool)

(declare-fun zeroValue!1129 () V!49657)

(declare-datatypes ((tuple2!21606 0))(
  ( (tuple2!21607 (_1!10814 (_ BitVec 64)) (_2!10814 V!49657)) )
))
(declare-datatypes ((List!28776 0))(
  ( (Nil!28773) (Cons!28772 (h!29981 tuple2!21606) (t!42306 List!28776)) )
))
(declare-datatypes ((ListLongMap!19263 0))(
  ( (ListLongMap!19264 (toList!9647 List!28776)) )
))
(declare-fun contains!7688 (ListLongMap!19263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4621 (array!83823 array!83821 (_ BitVec 32) (_ BitVec 32) V!49657 V!49657 (_ BitVec 32) Int) ListLongMap!19263)

(assert (=> b!1277320 (= lt!575511 (contains!7688 (getCurrentListMap!4621 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!848772 () Bool)

(assert (=> start!108170 (=> (not res!848772) (not e!729472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108170 (= res!848772 (validMask!0 mask!1805))))

(assert (=> start!108170 e!729472))

(assert (=> start!108170 true))

(assert (=> start!108170 tp!98553))

(declare-fun tp_is_empty!33415 () Bool)

(assert (=> start!108170 tp_is_empty!33415))

(declare-fun array_inv!30869 (array!83821) Bool)

(assert (=> start!108170 (and (array_inv!30869 _values!1187) e!729474)))

(declare-fun array_inv!30870 (array!83823) Bool)

(assert (=> start!108170 (array_inv!30870 _keys!1427)))

(declare-fun b!1277321 () Bool)

(assert (=> b!1277321 (= e!729473 tp_is_empty!33415)))

(declare-fun b!1277322 () Bool)

(declare-fun res!848770 () Bool)

(assert (=> b!1277322 (=> (not res!848770) (not e!729472))))

(assert (=> b!1277322 (= res!848770 (and (= (size!40973 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40974 _keys!1427) (size!40973 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51656 () Bool)

(assert (=> mapIsEmpty!51656 mapRes!51656))

(declare-fun b!1277323 () Bool)

(assert (=> b!1277323 (= e!729475 tp_is_empty!33415)))

(declare-fun b!1277324 () Bool)

(declare-fun res!848769 () Bool)

(assert (=> b!1277324 (=> (not res!848769) (not e!729472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83823 (_ BitVec 32)) Bool)

(assert (=> b!1277324 (= res!848769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108170 res!848772) b!1277322))

(assert (= (and b!1277322 res!848770) b!1277324))

(assert (= (and b!1277324 res!848769) b!1277319))

(assert (= (and b!1277319 res!848771) b!1277320))

(assert (= (and b!1277318 condMapEmpty!51656) mapIsEmpty!51656))

(assert (= (and b!1277318 (not condMapEmpty!51656)) mapNonEmpty!51656))

(get-info :version)

(assert (= (and mapNonEmpty!51656 ((_ is ValueCellFull!15809) mapValue!51656)) b!1277323))

(assert (= (and b!1277318 ((_ is ValueCellFull!15809) mapDefault!51656)) b!1277321))

(assert (= start!108170 b!1277318))

(declare-fun m!1172517 () Bool)

(assert (=> b!1277319 m!1172517))

(declare-fun m!1172519 () Bool)

(assert (=> b!1277320 m!1172519))

(assert (=> b!1277320 m!1172519))

(declare-fun m!1172521 () Bool)

(assert (=> b!1277320 m!1172521))

(declare-fun m!1172523 () Bool)

(assert (=> start!108170 m!1172523))

(declare-fun m!1172525 () Bool)

(assert (=> start!108170 m!1172525))

(declare-fun m!1172527 () Bool)

(assert (=> start!108170 m!1172527))

(declare-fun m!1172529 () Bool)

(assert (=> b!1277324 m!1172529))

(declare-fun m!1172531 () Bool)

(assert (=> mapNonEmpty!51656 m!1172531))

(check-sat (not mapNonEmpty!51656) b_and!45905 (not b!1277319) (not b_next!27865) (not start!108170) (not b!1277324) tp_is_empty!33415 (not b!1277320))
(check-sat b_and!45905 (not b_next!27865))
