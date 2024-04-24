; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108264 () Bool)

(assert start!108264)

(declare-fun b!1277359 () Bool)

(declare-fun e!729451 () Bool)

(declare-fun e!729447 () Bool)

(declare-fun mapRes!51497 () Bool)

(assert (=> b!1277359 (= e!729451 (and e!729447 mapRes!51497))))

(declare-fun condMapEmpty!51497 () Bool)

(declare-datatypes ((V!49521 0))(
  ( (V!49522 (val!16731 Int)) )
))
(declare-datatypes ((ValueCell!15758 0))(
  ( (ValueCellFull!15758 (v!19323 V!49521)) (EmptyCell!15758) )
))
(declare-datatypes ((array!83747 0))(
  ( (array!83748 (arr!40381 (Array (_ BitVec 32) ValueCell!15758)) (size!40932 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83747)

(declare-fun mapDefault!51497 () ValueCell!15758)

(assert (=> b!1277359 (= condMapEmpty!51497 (= (arr!40381 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15758)) mapDefault!51497)))))

(declare-fun b!1277360 () Bool)

(declare-fun tp_is_empty!33313 () Bool)

(assert (=> b!1277360 (= e!729447 tp_is_empty!33313)))

(declare-fun b!1277361 () Bool)

(declare-fun e!729449 () Bool)

(assert (=> b!1277361 (= e!729449 false)))

(declare-fun lt!575921 () Bool)

(declare-datatypes ((array!83749 0))(
  ( (array!83750 (arr!40382 (Array (_ BitVec 32) (_ BitVec 64))) (size!40933 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83749)

(declare-datatypes ((List!28663 0))(
  ( (Nil!28660) (Cons!28659 (h!29877 (_ BitVec 64)) (t!42191 List!28663)) )
))
(declare-fun arrayNoDuplicates!0 (array!83749 (_ BitVec 32) List!28663) Bool)

(assert (=> b!1277361 (= lt!575921 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28660))))

(declare-fun b!1277362 () Bool)

(declare-fun e!729450 () Bool)

(assert (=> b!1277362 (= e!729450 tp_is_empty!33313)))

(declare-fun res!848592 () Bool)

(assert (=> start!108264 (=> (not res!848592) (not e!729449))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108264 (= res!848592 (validMask!0 mask!1805))))

(assert (=> start!108264 e!729449))

(assert (=> start!108264 true))

(declare-fun array_inv!30879 (array!83747) Bool)

(assert (=> start!108264 (and (array_inv!30879 _values!1187) e!729451)))

(declare-fun array_inv!30880 (array!83749) Bool)

(assert (=> start!108264 (array_inv!30880 _keys!1427)))

(declare-fun mapIsEmpty!51497 () Bool)

(assert (=> mapIsEmpty!51497 mapRes!51497))

(declare-fun b!1277363 () Bool)

(declare-fun res!848593 () Bool)

(assert (=> b!1277363 (=> (not res!848593) (not e!729449))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277363 (= res!848593 (and (= (size!40932 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40933 _keys!1427) (size!40932 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277364 () Bool)

(declare-fun res!848591 () Bool)

(assert (=> b!1277364 (=> (not res!848591) (not e!729449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83749 (_ BitVec 32)) Bool)

(assert (=> b!1277364 (= res!848591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51497 () Bool)

(declare-fun tp!98255 () Bool)

(assert (=> mapNonEmpty!51497 (= mapRes!51497 (and tp!98255 e!729450))))

(declare-fun mapKey!51497 () (_ BitVec 32))

(declare-fun mapRest!51497 () (Array (_ BitVec 32) ValueCell!15758))

(declare-fun mapValue!51497 () ValueCell!15758)

(assert (=> mapNonEmpty!51497 (= (arr!40381 _values!1187) (store mapRest!51497 mapKey!51497 mapValue!51497))))

(assert (= (and start!108264 res!848592) b!1277363))

(assert (= (and b!1277363 res!848593) b!1277364))

(assert (= (and b!1277364 res!848591) b!1277361))

(assert (= (and b!1277359 condMapEmpty!51497) mapIsEmpty!51497))

(assert (= (and b!1277359 (not condMapEmpty!51497)) mapNonEmpty!51497))

(get-info :version)

(assert (= (and mapNonEmpty!51497 ((_ is ValueCellFull!15758) mapValue!51497)) b!1277362))

(assert (= (and b!1277359 ((_ is ValueCellFull!15758) mapDefault!51497)) b!1277360))

(assert (= start!108264 b!1277359))

(declare-fun m!1173699 () Bool)

(assert (=> b!1277361 m!1173699))

(declare-fun m!1173701 () Bool)

(assert (=> start!108264 m!1173701))

(declare-fun m!1173703 () Bool)

(assert (=> start!108264 m!1173703))

(declare-fun m!1173705 () Bool)

(assert (=> start!108264 m!1173705))

(declare-fun m!1173707 () Bool)

(assert (=> b!1277364 m!1173707))

(declare-fun m!1173709 () Bool)

(assert (=> mapNonEmpty!51497 m!1173709))

(check-sat (not b!1277361) (not start!108264) (not mapNonEmpty!51497) (not b!1277364) tp_is_empty!33313)
(check-sat)
