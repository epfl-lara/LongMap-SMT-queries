; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108028 () Bool)

(assert start!108028)

(declare-fun b!1275882 () Bool)

(declare-fun res!847992 () Bool)

(declare-fun e!728483 () Bool)

(assert (=> b!1275882 (=> (not res!847992) (not e!728483))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83603 0))(
  ( (array!83604 (arr!40314 (Array (_ BitVec 32) (_ BitVec 64))) (size!40866 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83603)

(declare-datatypes ((V!49505 0))(
  ( (V!49506 (val!16725 Int)) )
))
(declare-datatypes ((ValueCell!15752 0))(
  ( (ValueCellFull!15752 (v!19321 V!49505)) (EmptyCell!15752) )
))
(declare-datatypes ((array!83605 0))(
  ( (array!83606 (arr!40315 (Array (_ BitVec 32) ValueCell!15752)) (size!40867 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83605)

(assert (=> b!1275882 (= res!847992 (and (= (size!40867 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40866 _keys!1427) (size!40867 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!847991 () Bool)

(assert (=> start!108028 (=> (not res!847991) (not e!728483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108028 (= res!847991 (validMask!0 mask!1805))))

(assert (=> start!108028 e!728483))

(assert (=> start!108028 true))

(declare-fun e!728481 () Bool)

(declare-fun array_inv!30791 (array!83605) Bool)

(assert (=> start!108028 (and (array_inv!30791 _values!1187) e!728481)))

(declare-fun array_inv!30792 (array!83603) Bool)

(assert (=> start!108028 (array_inv!30792 _keys!1427)))

(declare-fun b!1275883 () Bool)

(declare-fun e!728484 () Bool)

(declare-fun mapRes!51479 () Bool)

(assert (=> b!1275883 (= e!728481 (and e!728484 mapRes!51479))))

(declare-fun condMapEmpty!51479 () Bool)

(declare-fun mapDefault!51479 () ValueCell!15752)

(assert (=> b!1275883 (= condMapEmpty!51479 (= (arr!40315 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15752)) mapDefault!51479)))))

(declare-fun b!1275884 () Bool)

(declare-fun e!728485 () Bool)

(declare-fun tp_is_empty!33301 () Bool)

(assert (=> b!1275884 (= e!728485 tp_is_empty!33301)))

(declare-fun b!1275885 () Bool)

(assert (=> b!1275885 (= e!728483 false)))

(declare-fun lt!575241 () Bool)

(declare-datatypes ((List!28705 0))(
  ( (Nil!28702) (Cons!28701 (h!29910 (_ BitVec 64)) (t!42233 List!28705)) )
))
(declare-fun arrayNoDuplicates!0 (array!83603 (_ BitVec 32) List!28705) Bool)

(assert (=> b!1275885 (= lt!575241 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28702))))

(declare-fun b!1275886 () Bool)

(assert (=> b!1275886 (= e!728484 tp_is_empty!33301)))

(declare-fun mapNonEmpty!51479 () Bool)

(declare-fun tp!98238 () Bool)

(assert (=> mapNonEmpty!51479 (= mapRes!51479 (and tp!98238 e!728485))))

(declare-fun mapKey!51479 () (_ BitVec 32))

(declare-fun mapValue!51479 () ValueCell!15752)

(declare-fun mapRest!51479 () (Array (_ BitVec 32) ValueCell!15752))

(assert (=> mapNonEmpty!51479 (= (arr!40315 _values!1187) (store mapRest!51479 mapKey!51479 mapValue!51479))))

(declare-fun mapIsEmpty!51479 () Bool)

(assert (=> mapIsEmpty!51479 mapRes!51479))

(declare-fun b!1275887 () Bool)

(declare-fun res!847990 () Bool)

(assert (=> b!1275887 (=> (not res!847990) (not e!728483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83603 (_ BitVec 32)) Bool)

(assert (=> b!1275887 (= res!847990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108028 res!847991) b!1275882))

(assert (= (and b!1275882 res!847992) b!1275887))

(assert (= (and b!1275887 res!847990) b!1275885))

(assert (= (and b!1275883 condMapEmpty!51479) mapIsEmpty!51479))

(assert (= (and b!1275883 (not condMapEmpty!51479)) mapNonEmpty!51479))

(get-info :version)

(assert (= (and mapNonEmpty!51479 ((_ is ValueCellFull!15752) mapValue!51479)) b!1275884))

(assert (= (and b!1275883 ((_ is ValueCellFull!15752) mapDefault!51479)) b!1275886))

(assert (= start!108028 b!1275883))

(declare-fun m!1171515 () Bool)

(assert (=> start!108028 m!1171515))

(declare-fun m!1171517 () Bool)

(assert (=> start!108028 m!1171517))

(declare-fun m!1171519 () Bool)

(assert (=> start!108028 m!1171519))

(declare-fun m!1171521 () Bool)

(assert (=> b!1275885 m!1171521))

(declare-fun m!1171523 () Bool)

(assert (=> mapNonEmpty!51479 m!1171523))

(declare-fun m!1171525 () Bool)

(assert (=> b!1275887 m!1171525))

(check-sat tp_is_empty!33301 (not b!1275887) (not start!108028) (not b!1275885) (not mapNonEmpty!51479))
(check-sat)
