; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34696 () Bool)

(assert start!34696)

(declare-fun b_free!7503 () Bool)

(declare-fun b_next!7503 () Bool)

(assert (=> start!34696 (= b_free!7503 (not b_next!7503))))

(declare-fun tp!26073 () Bool)

(declare-fun b_and!14723 () Bool)

(assert (=> start!34696 (= tp!26073 b_and!14723)))

(declare-fun mapNonEmpty!12639 () Bool)

(declare-fun mapRes!12639 () Bool)

(declare-fun tp!26072 () Bool)

(declare-fun e!212490 () Bool)

(assert (=> mapNonEmpty!12639 (= mapRes!12639 (and tp!26072 e!212490))))

(declare-datatypes ((V!10917 0))(
  ( (V!10918 (val!3772 Int)) )
))
(declare-datatypes ((ValueCell!3384 0))(
  ( (ValueCellFull!3384 (v!5954 V!10917)) (EmptyCell!3384) )
))
(declare-fun mapRest!12639 () (Array (_ BitVec 32) ValueCell!3384))

(declare-fun mapValue!12639 () ValueCell!3384)

(declare-datatypes ((array!18503 0))(
  ( (array!18504 (arr!8762 (Array (_ BitVec 32) ValueCell!3384)) (size!9114 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18503)

(declare-fun mapKey!12639 () (_ BitVec 32))

(assert (=> mapNonEmpty!12639 (= (arr!8762 _values!1525) (store mapRest!12639 mapKey!12639 mapValue!12639))))

(declare-fun res!191809 () Bool)

(declare-fun e!212489 () Bool)

(assert (=> start!34696 (=> (not res!191809) (not e!212489))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34696 (= res!191809 (validMask!0 mask!2385))))

(assert (=> start!34696 e!212489))

(assert (=> start!34696 true))

(declare-fun tp_is_empty!7455 () Bool)

(assert (=> start!34696 tp_is_empty!7455))

(assert (=> start!34696 tp!26073))

(declare-fun e!212488 () Bool)

(declare-fun array_inv!6490 (array!18503) Bool)

(assert (=> start!34696 (and (array_inv!6490 _values!1525) e!212488)))

(declare-datatypes ((array!18505 0))(
  ( (array!18506 (arr!8763 (Array (_ BitVec 32) (_ BitVec 64))) (size!9115 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18505)

(declare-fun array_inv!6491 (array!18505) Bool)

(assert (=> start!34696 (array_inv!6491 _keys!1895)))

(declare-fun b!346715 () Bool)

(declare-fun res!191803 () Bool)

(assert (=> b!346715 (=> (not res!191803) (not e!212489))))

(declare-datatypes ((List!5080 0))(
  ( (Nil!5077) (Cons!5076 (h!5932 (_ BitVec 64)) (t!10208 List!5080)) )
))
(declare-fun arrayNoDuplicates!0 (array!18505 (_ BitVec 32) List!5080) Bool)

(assert (=> b!346715 (= res!191803 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5077))))

(declare-fun b!346716 () Bool)

(declare-fun res!191810 () Bool)

(assert (=> b!346716 (=> (not res!191810) (not e!212489))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346716 (= res!191810 (validKeyInArray!0 k0!1348))))

(declare-fun b!346717 () Bool)

(declare-fun res!191806 () Bool)

(assert (=> b!346717 (=> (not res!191806) (not e!212489))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346717 (= res!191806 (and (= (size!9114 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9115 _keys!1895) (size!9114 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12639 () Bool)

(assert (=> mapIsEmpty!12639 mapRes!12639))

(declare-fun b!346718 () Bool)

(declare-fun res!191807 () Bool)

(assert (=> b!346718 (=> (not res!191807) (not e!212489))))

(declare-fun zeroValue!1467 () V!10917)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10917)

(declare-datatypes ((tuple2!5458 0))(
  ( (tuple2!5459 (_1!2740 (_ BitVec 64)) (_2!2740 V!10917)) )
))
(declare-datatypes ((List!5081 0))(
  ( (Nil!5078) (Cons!5077 (h!5933 tuple2!5458) (t!10209 List!5081)) )
))
(declare-datatypes ((ListLongMap!4371 0))(
  ( (ListLongMap!4372 (toList!2201 List!5081)) )
))
(declare-fun contains!2265 (ListLongMap!4371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1722 (array!18505 array!18503 (_ BitVec 32) (_ BitVec 32) V!10917 V!10917 (_ BitVec 32) Int) ListLongMap!4371)

(assert (=> b!346718 (= res!191807 (not (contains!2265 (getCurrentListMap!1722 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346719 () Bool)

(declare-fun res!191805 () Bool)

(declare-fun e!212486 () Bool)

(assert (=> b!346719 (=> (not res!191805) (not e!212486))))

(declare-datatypes ((SeekEntryResult!3380 0))(
  ( (MissingZero!3380 (index!15699 (_ BitVec 32))) (Found!3380 (index!15700 (_ BitVec 32))) (Intermediate!3380 (undefined!4192 Bool) (index!15701 (_ BitVec 32)) (x!34538 (_ BitVec 32))) (Undefined!3380) (MissingVacant!3380 (index!15702 (_ BitVec 32))) )
))
(declare-fun lt!163420 () SeekEntryResult!3380)

(declare-fun arrayContainsKey!0 (array!18505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346719 (= res!191805 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15700 lt!163420)))))

(declare-fun b!346720 () Bool)

(assert (=> b!346720 (= e!212489 e!212486)))

(declare-fun res!191808 () Bool)

(assert (=> b!346720 (=> (not res!191808) (not e!212486))))

(get-info :version)

(assert (=> b!346720 (= res!191808 (and ((_ is Found!3380) lt!163420) (= (select (arr!8763 _keys!1895) (index!15700 lt!163420)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18505 (_ BitVec 32)) SeekEntryResult!3380)

(assert (=> b!346720 (= lt!163420 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346721 () Bool)

(assert (=> b!346721 (= e!212490 tp_is_empty!7455)))

(declare-fun b!346722 () Bool)

(declare-fun e!212485 () Bool)

(assert (=> b!346722 (= e!212485 tp_is_empty!7455)))

(declare-fun b!346723 () Bool)

(assert (=> b!346723 (= e!212488 (and e!212485 mapRes!12639))))

(declare-fun condMapEmpty!12639 () Bool)

(declare-fun mapDefault!12639 () ValueCell!3384)

(assert (=> b!346723 (= condMapEmpty!12639 (= (arr!8762 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3384)) mapDefault!12639)))))

(declare-fun b!346724 () Bool)

(declare-fun res!191804 () Bool)

(assert (=> b!346724 (=> (not res!191804) (not e!212489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18505 (_ BitVec 32)) Bool)

(assert (=> b!346724 (= res!191804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346725 () Bool)

(assert (=> b!346725 (= e!212486 (not true))))

(assert (=> b!346725 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10761 0))(
  ( (Unit!10762) )
))
(declare-fun lt!163419 () Unit!10761)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18505 (_ BitVec 64) (_ BitVec 32)) Unit!10761)

(assert (=> b!346725 (= lt!163419 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15700 lt!163420)))))

(assert (= (and start!34696 res!191809) b!346717))

(assert (= (and b!346717 res!191806) b!346724))

(assert (= (and b!346724 res!191804) b!346715))

(assert (= (and b!346715 res!191803) b!346716))

(assert (= (and b!346716 res!191810) b!346718))

(assert (= (and b!346718 res!191807) b!346720))

(assert (= (and b!346720 res!191808) b!346719))

(assert (= (and b!346719 res!191805) b!346725))

(assert (= (and b!346723 condMapEmpty!12639) mapIsEmpty!12639))

(assert (= (and b!346723 (not condMapEmpty!12639)) mapNonEmpty!12639))

(assert (= (and mapNonEmpty!12639 ((_ is ValueCellFull!3384) mapValue!12639)) b!346721))

(assert (= (and b!346723 ((_ is ValueCellFull!3384) mapDefault!12639)) b!346722))

(assert (= start!34696 b!346723))

(declare-fun m!347755 () Bool)

(assert (=> b!346716 m!347755))

(declare-fun m!347757 () Bool)

(assert (=> start!34696 m!347757))

(declare-fun m!347759 () Bool)

(assert (=> start!34696 m!347759))

(declare-fun m!347761 () Bool)

(assert (=> start!34696 m!347761))

(declare-fun m!347763 () Bool)

(assert (=> b!346715 m!347763))

(declare-fun m!347765 () Bool)

(assert (=> mapNonEmpty!12639 m!347765))

(declare-fun m!347767 () Bool)

(assert (=> b!346719 m!347767))

(declare-fun m!347769 () Bool)

(assert (=> b!346725 m!347769))

(declare-fun m!347771 () Bool)

(assert (=> b!346725 m!347771))

(declare-fun m!347773 () Bool)

(assert (=> b!346720 m!347773))

(declare-fun m!347775 () Bool)

(assert (=> b!346720 m!347775))

(declare-fun m!347777 () Bool)

(assert (=> b!346724 m!347777))

(declare-fun m!347779 () Bool)

(assert (=> b!346718 m!347779))

(assert (=> b!346718 m!347779))

(declare-fun m!347781 () Bool)

(assert (=> b!346718 m!347781))

(check-sat (not b!346724) (not b!346720) (not b!346716) (not mapNonEmpty!12639) b_and!14723 (not b!346725) (not start!34696) (not b!346715) (not b!346718) (not b!346719) (not b_next!7503) tp_is_empty!7455)
(check-sat b_and!14723 (not b_next!7503))
