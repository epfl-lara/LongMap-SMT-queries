; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35088 () Bool)

(assert start!35088)

(declare-fun b_free!7747 () Bool)

(declare-fun b_next!7747 () Bool)

(assert (=> start!35088 (= b_free!7747 (not b_next!7747))))

(declare-fun tp!26826 () Bool)

(declare-fun b_and!14995 () Bool)

(assert (=> start!35088 (= tp!26826 b_and!14995)))

(declare-fun b!351807 () Bool)

(declare-fun e!215440 () Bool)

(declare-fun lt!165007 () Bool)

(assert (=> b!351807 (= e!215440 lt!165007)))

(declare-datatypes ((Unit!10842 0))(
  ( (Unit!10843) )
))
(declare-fun lt!165010 () Unit!10842)

(declare-fun e!215439 () Unit!10842)

(assert (=> b!351807 (= lt!165010 e!215439)))

(declare-fun c!53474 () Bool)

(assert (=> b!351807 (= c!53474 lt!165007)))

(declare-datatypes ((array!18976 0))(
  ( (array!18977 (arr!8991 (Array (_ BitVec 32) (_ BitVec 64))) (size!9343 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18976)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351807 (= lt!165007 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351808 () Bool)

(declare-fun res!195125 () Bool)

(declare-fun e!215436 () Bool)

(assert (=> b!351808 (=> (not res!195125) (not e!215436))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18976 (_ BitVec 32)) Bool)

(assert (=> b!351808 (= res!195125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351809 () Bool)

(declare-fun e!215435 () Bool)

(declare-fun tp_is_empty!7699 () Bool)

(assert (=> b!351809 (= e!215435 tp_is_empty!7699)))

(declare-fun b!351810 () Bool)

(declare-fun e!215441 () Bool)

(declare-fun e!215437 () Bool)

(declare-fun mapRes!13026 () Bool)

(assert (=> b!351810 (= e!215441 (and e!215437 mapRes!13026))))

(declare-fun condMapEmpty!13026 () Bool)

(declare-datatypes ((V!11243 0))(
  ( (V!11244 (val!3894 Int)) )
))
(declare-datatypes ((ValueCell!3506 0))(
  ( (ValueCellFull!3506 (v!6084 V!11243)) (EmptyCell!3506) )
))
(declare-datatypes ((array!18978 0))(
  ( (array!18979 (arr!8992 (Array (_ BitVec 32) ValueCell!3506)) (size!9344 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18978)

(declare-fun mapDefault!13026 () ValueCell!3506)

(assert (=> b!351810 (= condMapEmpty!13026 (= (arr!8992 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3506)) mapDefault!13026)))))

(declare-fun mapIsEmpty!13026 () Bool)

(assert (=> mapIsEmpty!13026 mapRes!13026))

(declare-fun res!195126 () Bool)

(assert (=> start!35088 (=> (not res!195126) (not e!215436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35088 (= res!195126 (validMask!0 mask!2385))))

(assert (=> start!35088 e!215436))

(assert (=> start!35088 true))

(assert (=> start!35088 tp_is_empty!7699))

(assert (=> start!35088 tp!26826))

(declare-fun array_inv!6642 (array!18978) Bool)

(assert (=> start!35088 (and (array_inv!6642 _values!1525) e!215441)))

(declare-fun array_inv!6643 (array!18976) Bool)

(assert (=> start!35088 (array_inv!6643 _keys!1895)))

(declare-fun b!351811 () Bool)

(declare-fun res!195129 () Bool)

(assert (=> b!351811 (=> (not res!195129) (not e!215436))))

(declare-fun zeroValue!1467 () V!11243)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11243)

(declare-datatypes ((tuple2!5536 0))(
  ( (tuple2!5537 (_1!2779 (_ BitVec 64)) (_2!2779 V!11243)) )
))
(declare-datatypes ((List!5138 0))(
  ( (Nil!5135) (Cons!5134 (h!5990 tuple2!5536) (t!10272 List!5138)) )
))
(declare-datatypes ((ListLongMap!4451 0))(
  ( (ListLongMap!4452 (toList!2241 List!5138)) )
))
(declare-fun contains!2331 (ListLongMap!4451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1769 (array!18976 array!18978 (_ BitVec 32) (_ BitVec 32) V!11243 V!11243 (_ BitVec 32) Int) ListLongMap!4451)

(assert (=> b!351811 (= res!195129 (not (contains!2331 (getCurrentListMap!1769 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351812 () Bool)

(declare-fun res!195128 () Bool)

(assert (=> b!351812 (=> (not res!195128) (not e!215436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351812 (= res!195128 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!13026 () Bool)

(declare-fun tp!26825 () Bool)

(assert (=> mapNonEmpty!13026 (= mapRes!13026 (and tp!26825 e!215435))))

(declare-fun mapKey!13026 () (_ BitVec 32))

(declare-fun mapValue!13026 () ValueCell!3506)

(declare-fun mapRest!13026 () (Array (_ BitVec 32) ValueCell!3506))

(assert (=> mapNonEmpty!13026 (= (arr!8992 _values!1525) (store mapRest!13026 mapKey!13026 mapValue!13026))))

(declare-fun b!351813 () Bool)

(declare-fun Unit!10844 () Unit!10842)

(assert (=> b!351813 (= e!215439 Unit!10844)))

(declare-fun b!351814 () Bool)

(declare-fun res!195127 () Bool)

(assert (=> b!351814 (=> (not res!195127) (not e!215436))))

(assert (=> b!351814 (= res!195127 (and (= (size!9344 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9343 _keys!1895) (size!9344 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351815 () Bool)

(declare-fun res!195130 () Bool)

(assert (=> b!351815 (=> (not res!195130) (not e!215436))))

(declare-datatypes ((List!5139 0))(
  ( (Nil!5136) (Cons!5135 (h!5991 (_ BitVec 64)) (t!10273 List!5139)) )
))
(declare-fun arrayNoDuplicates!0 (array!18976 (_ BitVec 32) List!5139) Bool)

(assert (=> b!351815 (= res!195130 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5136))))

(declare-fun b!351816 () Bool)

(declare-fun Unit!10845 () Unit!10842)

(assert (=> b!351816 (= e!215439 Unit!10845)))

(declare-fun lt!165008 () Unit!10842)

(declare-fun lemmaArrayContainsKeyThenInListMap!336 (array!18976 array!18978 (_ BitVec 32) (_ BitVec 32) V!11243 V!11243 (_ BitVec 64) (_ BitVec 32) Int) Unit!10842)

(declare-fun arrayScanForKey!0 (array!18976 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351816 (= lt!165008 (lemmaArrayContainsKeyThenInListMap!336 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351816 false))

(declare-fun b!351817 () Bool)

(assert (=> b!351817 (= e!215436 e!215440)))

(declare-fun res!195131 () Bool)

(assert (=> b!351817 (=> (not res!195131) (not e!215440))))

(declare-datatypes ((SeekEntryResult!3413 0))(
  ( (MissingZero!3413 (index!15831 (_ BitVec 32))) (Found!3413 (index!15832 (_ BitVec 32))) (Intermediate!3413 (undefined!4225 Bool) (index!15833 (_ BitVec 32)) (x!34966 (_ BitVec 32))) (Undefined!3413) (MissingVacant!3413 (index!15834 (_ BitVec 32))) )
))
(declare-fun lt!165009 () SeekEntryResult!3413)

(get-info :version)

(assert (=> b!351817 (= res!195131 (and (not ((_ is Found!3413) lt!165009)) (not ((_ is MissingZero!3413) lt!165009)) ((_ is MissingVacant!3413) lt!165009)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18976 (_ BitVec 32)) SeekEntryResult!3413)

(assert (=> b!351817 (= lt!165009 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351818 () Bool)

(assert (=> b!351818 (= e!215437 tp_is_empty!7699)))

(assert (= (and start!35088 res!195126) b!351814))

(assert (= (and b!351814 res!195127) b!351808))

(assert (= (and b!351808 res!195125) b!351815))

(assert (= (and b!351815 res!195130) b!351812))

(assert (= (and b!351812 res!195128) b!351811))

(assert (= (and b!351811 res!195129) b!351817))

(assert (= (and b!351817 res!195131) b!351807))

(assert (= (and b!351807 c!53474) b!351816))

(assert (= (and b!351807 (not c!53474)) b!351813))

(assert (= (and b!351810 condMapEmpty!13026) mapIsEmpty!13026))

(assert (= (and b!351810 (not condMapEmpty!13026)) mapNonEmpty!13026))

(assert (= (and mapNonEmpty!13026 ((_ is ValueCellFull!3506) mapValue!13026)) b!351809))

(assert (= (and b!351810 ((_ is ValueCellFull!3506) mapDefault!13026)) b!351818))

(assert (= start!35088 b!351810))

(declare-fun m!351897 () Bool)

(assert (=> b!351811 m!351897))

(assert (=> b!351811 m!351897))

(declare-fun m!351899 () Bool)

(assert (=> b!351811 m!351899))

(declare-fun m!351901 () Bool)

(assert (=> b!351816 m!351901))

(assert (=> b!351816 m!351901))

(declare-fun m!351903 () Bool)

(assert (=> b!351816 m!351903))

(declare-fun m!351905 () Bool)

(assert (=> b!351807 m!351905))

(declare-fun m!351907 () Bool)

(assert (=> start!35088 m!351907))

(declare-fun m!351909 () Bool)

(assert (=> start!35088 m!351909))

(declare-fun m!351911 () Bool)

(assert (=> start!35088 m!351911))

(declare-fun m!351913 () Bool)

(assert (=> b!351817 m!351913))

(declare-fun m!351915 () Bool)

(assert (=> b!351815 m!351915))

(declare-fun m!351917 () Bool)

(assert (=> b!351812 m!351917))

(declare-fun m!351919 () Bool)

(assert (=> mapNonEmpty!13026 m!351919))

(declare-fun m!351921 () Bool)

(assert (=> b!351808 m!351921))

(check-sat (not b!351816) tp_is_empty!7699 (not b!351815) b_and!14995 (not b!351817) (not b!351812) (not b_next!7747) (not b!351807) (not start!35088) (not b!351808) (not b!351811) (not mapNonEmpty!13026))
(check-sat b_and!14995 (not b_next!7747))
