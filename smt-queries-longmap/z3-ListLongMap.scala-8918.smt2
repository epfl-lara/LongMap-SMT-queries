; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108400 () Bool)

(assert start!108400)

(declare-fun b_free!27871 () Bool)

(declare-fun b_next!27871 () Bool)

(assert (=> start!108400 (= b_free!27871 (not b_next!27871))))

(declare-fun tp!98569 () Bool)

(declare-fun b_and!45931 () Bool)

(assert (=> start!108400 (= tp!98569 b_and!45931)))

(declare-fun mapIsEmpty!51665 () Bool)

(declare-fun mapRes!51665 () Bool)

(assert (=> mapIsEmpty!51665 mapRes!51665))

(declare-fun mapNonEmpty!51665 () Bool)

(declare-fun tp!98570 () Bool)

(declare-fun e!730394 () Bool)

(assert (=> mapNonEmpty!51665 (= mapRes!51665 (and tp!98570 e!730394))))

(declare-datatypes ((V!49665 0))(
  ( (V!49666 (val!16785 Int)) )
))
(declare-datatypes ((ValueCell!15812 0))(
  ( (ValueCellFull!15812 (v!19378 V!49665)) (EmptyCell!15812) )
))
(declare-fun mapRest!51665 () (Array (_ BitVec 32) ValueCell!15812))

(declare-fun mapKey!51665 () (_ BitVec 32))

(declare-fun mapValue!51665 () ValueCell!15812)

(declare-datatypes ((array!83965 0))(
  ( (array!83966 (arr!40488 (Array (_ BitVec 32) ValueCell!15812)) (size!41039 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83965)

(assert (=> mapNonEmpty!51665 (= (arr!40488 _values!1187) (store mapRest!51665 mapKey!51665 mapValue!51665))))

(declare-fun b!1278750 () Bool)

(declare-fun e!730392 () Bool)

(assert (=> b!1278750 (= e!730392 false)))

(declare-fun lt!576182 () Bool)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49665)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49665)

(declare-datatypes ((array!83967 0))(
  ( (array!83968 (arr!40489 (Array (_ BitVec 32) (_ BitVec 64))) (size!41040 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83967)

(declare-datatypes ((tuple2!21546 0))(
  ( (tuple2!21547 (_1!10784 (_ BitVec 64)) (_2!10784 V!49665)) )
))
(declare-datatypes ((List!28736 0))(
  ( (Nil!28733) (Cons!28732 (h!29950 tuple2!21546) (t!42266 List!28736)) )
))
(declare-datatypes ((ListLongMap!19211 0))(
  ( (ListLongMap!19212 (toList!9621 List!28736)) )
))
(declare-fun contains!7746 (ListLongMap!19211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4690 (array!83967 array!83965 (_ BitVec 32) (_ BitVec 32) V!49665 V!49665 (_ BitVec 32) Int) ListLongMap!19211)

(assert (=> b!1278750 (= lt!576182 (contains!7746 (getCurrentListMap!4690 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278751 () Bool)

(declare-fun res!849353 () Bool)

(assert (=> b!1278751 (=> (not res!849353) (not e!730392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83967 (_ BitVec 32)) Bool)

(assert (=> b!1278751 (= res!849353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278752 () Bool)

(declare-fun tp_is_empty!33421 () Bool)

(assert (=> b!1278752 (= e!730394 tp_is_empty!33421)))

(declare-fun b!1278753 () Bool)

(declare-fun res!849352 () Bool)

(assert (=> b!1278753 (=> (not res!849352) (not e!730392))))

(declare-datatypes ((List!28737 0))(
  ( (Nil!28734) (Cons!28733 (h!29951 (_ BitVec 64)) (t!42267 List!28737)) )
))
(declare-fun arrayNoDuplicates!0 (array!83967 (_ BitVec 32) List!28737) Bool)

(assert (=> b!1278753 (= res!849352 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28734))))

(declare-fun b!1278754 () Bool)

(declare-fun res!849355 () Bool)

(assert (=> b!1278754 (=> (not res!849355) (not e!730392))))

(assert (=> b!1278754 (= res!849355 (and (= (size!41039 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41040 _keys!1427) (size!41039 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!849354 () Bool)

(assert (=> start!108400 (=> (not res!849354) (not e!730392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108400 (= res!849354 (validMask!0 mask!1805))))

(assert (=> start!108400 e!730392))

(assert (=> start!108400 true))

(assert (=> start!108400 tp!98569))

(assert (=> start!108400 tp_is_empty!33421))

(declare-fun e!730395 () Bool)

(declare-fun array_inv!30947 (array!83965) Bool)

(assert (=> start!108400 (and (array_inv!30947 _values!1187) e!730395)))

(declare-fun array_inv!30948 (array!83967) Bool)

(assert (=> start!108400 (array_inv!30948 _keys!1427)))

(declare-fun b!1278755 () Bool)

(declare-fun e!730393 () Bool)

(assert (=> b!1278755 (= e!730395 (and e!730393 mapRes!51665))))

(declare-fun condMapEmpty!51665 () Bool)

(declare-fun mapDefault!51665 () ValueCell!15812)

(assert (=> b!1278755 (= condMapEmpty!51665 (= (arr!40488 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15812)) mapDefault!51665)))))

(declare-fun b!1278756 () Bool)

(assert (=> b!1278756 (= e!730393 tp_is_empty!33421)))

(assert (= (and start!108400 res!849354) b!1278754))

(assert (= (and b!1278754 res!849355) b!1278751))

(assert (= (and b!1278751 res!849353) b!1278753))

(assert (= (and b!1278753 res!849352) b!1278750))

(assert (= (and b!1278755 condMapEmpty!51665) mapIsEmpty!51665))

(assert (= (and b!1278755 (not condMapEmpty!51665)) mapNonEmpty!51665))

(get-info :version)

(assert (= (and mapNonEmpty!51665 ((_ is ValueCellFull!15812) mapValue!51665)) b!1278752))

(assert (= (and b!1278755 ((_ is ValueCellFull!15812) mapDefault!51665)) b!1278756))

(assert (= start!108400 b!1278755))

(declare-fun m!1174677 () Bool)

(assert (=> mapNonEmpty!51665 m!1174677))

(declare-fun m!1174679 () Bool)

(assert (=> start!108400 m!1174679))

(declare-fun m!1174681 () Bool)

(assert (=> start!108400 m!1174681))

(declare-fun m!1174683 () Bool)

(assert (=> start!108400 m!1174683))

(declare-fun m!1174685 () Bool)

(assert (=> b!1278751 m!1174685))

(declare-fun m!1174687 () Bool)

(assert (=> b!1278753 m!1174687))

(declare-fun m!1174689 () Bool)

(assert (=> b!1278750 m!1174689))

(assert (=> b!1278750 m!1174689))

(declare-fun m!1174691 () Bool)

(assert (=> b!1278750 m!1174691))

(check-sat (not b!1278750) (not mapNonEmpty!51665) (not start!108400) (not b_next!27871) (not b!1278753) (not b!1278751) b_and!45931 tp_is_empty!33421)
(check-sat b_and!45931 (not b_next!27871))
