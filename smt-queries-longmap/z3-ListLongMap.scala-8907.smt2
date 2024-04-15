; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108092 () Bool)

(assert start!108092)

(declare-fun b_free!27805 () Bool)

(declare-fun b_next!27805 () Bool)

(assert (=> start!108092 (= b_free!27805 (not b_next!27805))))

(declare-fun tp!98369 () Bool)

(declare-fun b_and!45843 () Bool)

(assert (=> start!108092 (= tp!98369 b_and!45843)))

(declare-fun b!1276459 () Bool)

(declare-fun res!848304 () Bool)

(declare-fun e!728913 () Bool)

(assert (=> b!1276459 (=> (not res!848304) (not e!728913))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83705 0))(
  ( (array!83706 (arr!40364 (Array (_ BitVec 32) (_ BitVec 64))) (size!40916 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83705)

(declare-datatypes ((V!49577 0))(
  ( (V!49578 (val!16752 Int)) )
))
(declare-datatypes ((ValueCell!15779 0))(
  ( (ValueCellFull!15779 (v!19348 V!49577)) (EmptyCell!15779) )
))
(declare-datatypes ((array!83707 0))(
  ( (array!83708 (arr!40365 (Array (_ BitVec 32) ValueCell!15779)) (size!40917 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83707)

(assert (=> b!1276459 (= res!848304 (and (= (size!40917 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40916 _keys!1427) (size!40917 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848306 () Bool)

(assert (=> start!108092 (=> (not res!848306) (not e!728913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108092 (= res!848306 (validMask!0 mask!1805))))

(assert (=> start!108092 e!728913))

(assert (=> start!108092 true))

(assert (=> start!108092 tp!98369))

(declare-fun tp_is_empty!33355 () Bool)

(assert (=> start!108092 tp_is_empty!33355))

(declare-fun e!728916 () Bool)

(declare-fun array_inv!30831 (array!83707) Bool)

(assert (=> start!108092 (and (array_inv!30831 _values!1187) e!728916)))

(declare-fun array_inv!30832 (array!83705) Bool)

(assert (=> start!108092 (array_inv!30832 _keys!1427)))

(declare-fun b!1276460 () Bool)

(assert (=> b!1276460 (= e!728913 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49577)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49577)

(declare-fun lt!575322 () Bool)

(declare-datatypes ((tuple2!21564 0))(
  ( (tuple2!21565 (_1!10793 (_ BitVec 64)) (_2!10793 V!49577)) )
))
(declare-datatypes ((List!28733 0))(
  ( (Nil!28730) (Cons!28729 (h!29938 tuple2!21564) (t!42261 List!28733)) )
))
(declare-datatypes ((ListLongMap!19221 0))(
  ( (ListLongMap!19222 (toList!9626 List!28733)) )
))
(declare-fun contains!7666 (ListLongMap!19221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4600 (array!83705 array!83707 (_ BitVec 32) (_ BitVec 32) V!49577 V!49577 (_ BitVec 32) Int) ListLongMap!19221)

(assert (=> b!1276460 (= lt!575322 (contains!7666 (getCurrentListMap!4600 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51563 () Bool)

(declare-fun mapRes!51563 () Bool)

(assert (=> mapIsEmpty!51563 mapRes!51563))

(declare-fun mapNonEmpty!51563 () Bool)

(declare-fun tp!98370 () Bool)

(declare-fun e!728914 () Bool)

(assert (=> mapNonEmpty!51563 (= mapRes!51563 (and tp!98370 e!728914))))

(declare-fun mapValue!51563 () ValueCell!15779)

(declare-fun mapKey!51563 () (_ BitVec 32))

(declare-fun mapRest!51563 () (Array (_ BitVec 32) ValueCell!15779))

(assert (=> mapNonEmpty!51563 (= (arr!40365 _values!1187) (store mapRest!51563 mapKey!51563 mapValue!51563))))

(declare-fun b!1276461 () Bool)

(assert (=> b!1276461 (= e!728914 tp_is_empty!33355)))

(declare-fun b!1276462 () Bool)

(declare-fun res!848305 () Bool)

(assert (=> b!1276462 (=> (not res!848305) (not e!728913))))

(declare-datatypes ((List!28734 0))(
  ( (Nil!28731) (Cons!28730 (h!29939 (_ BitVec 64)) (t!42262 List!28734)) )
))
(declare-fun arrayNoDuplicates!0 (array!83705 (_ BitVec 32) List!28734) Bool)

(assert (=> b!1276462 (= res!848305 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28731))))

(declare-fun b!1276463 () Bool)

(declare-fun res!848307 () Bool)

(assert (=> b!1276463 (=> (not res!848307) (not e!728913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83705 (_ BitVec 32)) Bool)

(assert (=> b!1276463 (= res!848307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276464 () Bool)

(declare-fun e!728917 () Bool)

(assert (=> b!1276464 (= e!728917 tp_is_empty!33355)))

(declare-fun b!1276465 () Bool)

(assert (=> b!1276465 (= e!728916 (and e!728917 mapRes!51563))))

(declare-fun condMapEmpty!51563 () Bool)

(declare-fun mapDefault!51563 () ValueCell!15779)

(assert (=> b!1276465 (= condMapEmpty!51563 (= (arr!40365 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15779)) mapDefault!51563)))))

(assert (= (and start!108092 res!848306) b!1276459))

(assert (= (and b!1276459 res!848304) b!1276463))

(assert (= (and b!1276463 res!848307) b!1276462))

(assert (= (and b!1276462 res!848305) b!1276460))

(assert (= (and b!1276465 condMapEmpty!51563) mapIsEmpty!51563))

(assert (= (and b!1276465 (not condMapEmpty!51563)) mapNonEmpty!51563))

(get-info :version)

(assert (= (and mapNonEmpty!51563 ((_ is ValueCellFull!15779) mapValue!51563)) b!1276461))

(assert (= (and b!1276465 ((_ is ValueCellFull!15779) mapDefault!51563)) b!1276464))

(assert (= start!108092 b!1276465))

(declare-fun m!1171917 () Bool)

(assert (=> b!1276460 m!1171917))

(assert (=> b!1276460 m!1171917))

(declare-fun m!1171919 () Bool)

(assert (=> b!1276460 m!1171919))

(declare-fun m!1171921 () Bool)

(assert (=> b!1276462 m!1171921))

(declare-fun m!1171923 () Bool)

(assert (=> b!1276463 m!1171923))

(declare-fun m!1171925 () Bool)

(assert (=> mapNonEmpty!51563 m!1171925))

(declare-fun m!1171927 () Bool)

(assert (=> start!108092 m!1171927))

(declare-fun m!1171929 () Bool)

(assert (=> start!108092 m!1171929))

(declare-fun m!1171931 () Bool)

(assert (=> start!108092 m!1171931))

(check-sat tp_is_empty!33355 b_and!45843 (not b!1276460) (not b!1276463) (not mapNonEmpty!51563) (not b!1276462) (not b_next!27805) (not start!108092))
(check-sat b_and!45843 (not b_next!27805))
