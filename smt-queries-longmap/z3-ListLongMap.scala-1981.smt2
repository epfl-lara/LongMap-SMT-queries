; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34772 () Bool)

(assert start!34772)

(declare-fun b_free!7557 () Bool)

(declare-fun b_next!7557 () Bool)

(assert (=> start!34772 (= b_free!7557 (not b_next!7557))))

(declare-fun tp!26237 () Bool)

(declare-fun b_and!14779 () Bool)

(assert (=> start!34772 (= tp!26237 b_and!14779)))

(declare-fun b!347750 () Bool)

(declare-fun res!192516 () Bool)

(declare-fun e!213076 () Bool)

(assert (=> b!347750 (=> (not res!192516) (not e!213076))))

(declare-datatypes ((SeekEntryResult!3400 0))(
  ( (MissingZero!3400 (index!15779 (_ BitVec 32))) (Found!3400 (index!15780 (_ BitVec 32))) (Intermediate!3400 (undefined!4212 Bool) (index!15781 (_ BitVec 32)) (x!34640 (_ BitVec 32))) (Undefined!3400) (MissingVacant!3400 (index!15782 (_ BitVec 32))) )
))
(declare-fun lt!163690 () SeekEntryResult!3400)

(declare-datatypes ((array!18607 0))(
  ( (array!18608 (arr!8813 (Array (_ BitVec 32) (_ BitVec 64))) (size!9165 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18607)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347750 (= res!192516 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15780 lt!163690)))))

(declare-fun b!347751 () Bool)

(declare-fun res!192517 () Bool)

(declare-fun e!213075 () Bool)

(assert (=> b!347751 (=> (not res!192517) (not e!213075))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10989 0))(
  ( (V!10990 (val!3799 Int)) )
))
(declare-datatypes ((ValueCell!3411 0))(
  ( (ValueCellFull!3411 (v!5982 V!10989)) (EmptyCell!3411) )
))
(declare-datatypes ((array!18609 0))(
  ( (array!18610 (arr!8814 (Array (_ BitVec 32) ValueCell!3411)) (size!9166 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18609)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347751 (= res!192517 (and (= (size!9166 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9165 _keys!1895) (size!9166 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347752 () Bool)

(declare-fun e!213079 () Bool)

(declare-fun tp_is_empty!7509 () Bool)

(assert (=> b!347752 (= e!213079 tp_is_empty!7509)))

(declare-fun b!347753 () Bool)

(declare-fun res!192514 () Bool)

(assert (=> b!347753 (=> (not res!192514) (not e!213075))))

(declare-datatypes ((List!5117 0))(
  ( (Nil!5114) (Cons!5113 (h!5969 (_ BitVec 64)) (t!10247 List!5117)) )
))
(declare-fun arrayNoDuplicates!0 (array!18607 (_ BitVec 32) List!5117) Bool)

(assert (=> b!347753 (= res!192514 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5114))))

(declare-fun res!192519 () Bool)

(assert (=> start!34772 (=> (not res!192519) (not e!213075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34772 (= res!192519 (validMask!0 mask!2385))))

(assert (=> start!34772 e!213075))

(assert (=> start!34772 true))

(assert (=> start!34772 tp_is_empty!7509))

(assert (=> start!34772 tp!26237))

(declare-fun e!213078 () Bool)

(declare-fun array_inv!6524 (array!18609) Bool)

(assert (=> start!34772 (and (array_inv!6524 _values!1525) e!213078)))

(declare-fun array_inv!6525 (array!18607) Bool)

(assert (=> start!34772 (array_inv!6525 _keys!1895)))

(declare-fun b!347754 () Bool)

(declare-fun res!192520 () Bool)

(assert (=> b!347754 (=> (not res!192520) (not e!213075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347754 (= res!192520 (validKeyInArray!0 k0!1348))))

(declare-fun b!347755 () Bool)

(assert (=> b!347755 (= e!213076 (not false))))

(declare-datatypes ((tuple2!5494 0))(
  ( (tuple2!5495 (_1!2758 (_ BitVec 64)) (_2!2758 V!10989)) )
))
(declare-datatypes ((List!5118 0))(
  ( (Nil!5115) (Cons!5114 (h!5970 tuple2!5494) (t!10248 List!5118)) )
))
(declare-datatypes ((ListLongMap!4407 0))(
  ( (ListLongMap!4408 (toList!2219 List!5118)) )
))
(declare-fun lt!163691 () ListLongMap!4407)

(declare-fun contains!2284 (ListLongMap!4407 (_ BitVec 64)) Bool)

(assert (=> b!347755 (contains!2284 lt!163691 (select (arr!8813 _keys!1895) (index!15780 lt!163690)))))

(declare-fun zeroValue!1467 () V!10989)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10989)

(declare-datatypes ((Unit!10793 0))(
  ( (Unit!10794) )
))
(declare-fun lt!163692 () Unit!10793)

(declare-fun lemmaValidKeyInArrayIsInListMap!174 (array!18607 array!18609 (_ BitVec 32) (_ BitVec 32) V!10989 V!10989 (_ BitVec 32) Int) Unit!10793)

(assert (=> b!347755 (= lt!163692 (lemmaValidKeyInArrayIsInListMap!174 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15780 lt!163690) defaultEntry!1528))))

(assert (=> b!347755 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163693 () Unit!10793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18607 (_ BitVec 64) (_ BitVec 32)) Unit!10793)

(assert (=> b!347755 (= lt!163693 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15780 lt!163690)))))

(declare-fun b!347756 () Bool)

(declare-fun res!192513 () Bool)

(assert (=> b!347756 (=> (not res!192513) (not e!213075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18607 (_ BitVec 32)) Bool)

(assert (=> b!347756 (= res!192513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347757 () Bool)

(declare-fun mapRes!12723 () Bool)

(assert (=> b!347757 (= e!213078 (and e!213079 mapRes!12723))))

(declare-fun condMapEmpty!12723 () Bool)

(declare-fun mapDefault!12723 () ValueCell!3411)

(assert (=> b!347757 (= condMapEmpty!12723 (= (arr!8814 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3411)) mapDefault!12723)))))

(declare-fun mapIsEmpty!12723 () Bool)

(assert (=> mapIsEmpty!12723 mapRes!12723))

(declare-fun b!347758 () Bool)

(declare-fun e!213080 () Bool)

(assert (=> b!347758 (= e!213080 tp_is_empty!7509)))

(declare-fun b!347759 () Bool)

(declare-fun e!213077 () Bool)

(assert (=> b!347759 (= e!213075 e!213077)))

(declare-fun res!192518 () Bool)

(assert (=> b!347759 (=> (not res!192518) (not e!213077))))

(assert (=> b!347759 (= res!192518 (not (contains!2284 lt!163691 k0!1348)))))

(declare-fun getCurrentListMap!1740 (array!18607 array!18609 (_ BitVec 32) (_ BitVec 32) V!10989 V!10989 (_ BitVec 32) Int) ListLongMap!4407)

(assert (=> b!347759 (= lt!163691 (getCurrentListMap!1740 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!347760 () Bool)

(assert (=> b!347760 (= e!213077 e!213076)))

(declare-fun res!192515 () Bool)

(assert (=> b!347760 (=> (not res!192515) (not e!213076))))

(get-info :version)

(assert (=> b!347760 (= res!192515 (and ((_ is Found!3400) lt!163690) (= (select (arr!8813 _keys!1895) (index!15780 lt!163690)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18607 (_ BitVec 32)) SeekEntryResult!3400)

(assert (=> b!347760 (= lt!163690 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12723 () Bool)

(declare-fun tp!26238 () Bool)

(assert (=> mapNonEmpty!12723 (= mapRes!12723 (and tp!26238 e!213080))))

(declare-fun mapValue!12723 () ValueCell!3411)

(declare-fun mapKey!12723 () (_ BitVec 32))

(declare-fun mapRest!12723 () (Array (_ BitVec 32) ValueCell!3411))

(assert (=> mapNonEmpty!12723 (= (arr!8814 _values!1525) (store mapRest!12723 mapKey!12723 mapValue!12723))))

(assert (= (and start!34772 res!192519) b!347751))

(assert (= (and b!347751 res!192517) b!347756))

(assert (= (and b!347756 res!192513) b!347753))

(assert (= (and b!347753 res!192514) b!347754))

(assert (= (and b!347754 res!192520) b!347759))

(assert (= (and b!347759 res!192518) b!347760))

(assert (= (and b!347760 res!192515) b!347750))

(assert (= (and b!347750 res!192516) b!347755))

(assert (= (and b!347757 condMapEmpty!12723) mapIsEmpty!12723))

(assert (= (and b!347757 (not condMapEmpty!12723)) mapNonEmpty!12723))

(assert (= (and mapNonEmpty!12723 ((_ is ValueCellFull!3411) mapValue!12723)) b!347758))

(assert (= (and b!347757 ((_ is ValueCellFull!3411) mapDefault!12723)) b!347752))

(assert (= start!34772 b!347757))

(declare-fun m!348621 () Bool)

(assert (=> b!347759 m!348621))

(declare-fun m!348623 () Bool)

(assert (=> b!347759 m!348623))

(declare-fun m!348625 () Bool)

(assert (=> b!347755 m!348625))

(declare-fun m!348627 () Bool)

(assert (=> b!347755 m!348627))

(declare-fun m!348629 () Bool)

(assert (=> b!347755 m!348629))

(declare-fun m!348631 () Bool)

(assert (=> b!347755 m!348631))

(assert (=> b!347755 m!348631))

(declare-fun m!348633 () Bool)

(assert (=> b!347755 m!348633))

(declare-fun m!348635 () Bool)

(assert (=> mapNonEmpty!12723 m!348635))

(declare-fun m!348637 () Bool)

(assert (=> b!347750 m!348637))

(declare-fun m!348639 () Bool)

(assert (=> b!347756 m!348639))

(declare-fun m!348641 () Bool)

(assert (=> b!347753 m!348641))

(declare-fun m!348643 () Bool)

(assert (=> start!34772 m!348643))

(declare-fun m!348645 () Bool)

(assert (=> start!34772 m!348645))

(declare-fun m!348647 () Bool)

(assert (=> start!34772 m!348647))

(assert (=> b!347760 m!348631))

(declare-fun m!348649 () Bool)

(assert (=> b!347760 m!348649))

(declare-fun m!348651 () Bool)

(assert (=> b!347754 m!348651))

(check-sat (not b!347759) (not b!347754) (not b_next!7557) (not b!347760) tp_is_empty!7509 (not b!347750) (not b!347753) (not b!347755) (not b!347756) b_and!14779 (not start!34772) (not mapNonEmpty!12723))
(check-sat b_and!14779 (not b_next!7557))
