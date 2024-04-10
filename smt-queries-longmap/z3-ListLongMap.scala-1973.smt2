; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34702 () Bool)

(assert start!34702)

(declare-fun b_free!7509 () Bool)

(declare-fun b_next!7509 () Bool)

(assert (=> start!34702 (= b_free!7509 (not b_next!7509))))

(declare-fun tp!26091 () Bool)

(declare-fun b_and!14729 () Bool)

(assert (=> start!34702 (= tp!26091 b_and!14729)))

(declare-fun b!346814 () Bool)

(declare-fun res!191882 () Bool)

(declare-fun e!212541 () Bool)

(assert (=> b!346814 (=> (not res!191882) (not e!212541))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346814 (= res!191882 (validKeyInArray!0 k0!1348))))

(declare-fun res!191878 () Bool)

(assert (=> start!34702 (=> (not res!191878) (not e!212541))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34702 (= res!191878 (validMask!0 mask!2385))))

(assert (=> start!34702 e!212541))

(assert (=> start!34702 true))

(declare-fun tp_is_empty!7461 () Bool)

(assert (=> start!34702 tp_is_empty!7461))

(assert (=> start!34702 tp!26091))

(declare-datatypes ((V!10925 0))(
  ( (V!10926 (val!3775 Int)) )
))
(declare-datatypes ((ValueCell!3387 0))(
  ( (ValueCellFull!3387 (v!5957 V!10925)) (EmptyCell!3387) )
))
(declare-datatypes ((array!18515 0))(
  ( (array!18516 (arr!8768 (Array (_ BitVec 32) ValueCell!3387)) (size!9120 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18515)

(declare-fun e!212544 () Bool)

(declare-fun array_inv!6496 (array!18515) Bool)

(assert (=> start!34702 (and (array_inv!6496 _values!1525) e!212544)))

(declare-datatypes ((array!18517 0))(
  ( (array!18518 (arr!8769 (Array (_ BitVec 32) (_ BitVec 64))) (size!9121 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18517)

(declare-fun array_inv!6497 (array!18517) Bool)

(assert (=> start!34702 (array_inv!6497 _keys!1895)))

(declare-fun b!346815 () Bool)

(declare-fun e!212543 () Bool)

(assert (=> b!346815 (= e!212543 tp_is_empty!7461)))

(declare-fun b!346816 () Bool)

(declare-fun e!212539 () Bool)

(assert (=> b!346816 (= e!212539 tp_is_empty!7461)))

(declare-fun mapIsEmpty!12648 () Bool)

(declare-fun mapRes!12648 () Bool)

(assert (=> mapIsEmpty!12648 mapRes!12648))

(declare-fun b!346817 () Bool)

(declare-fun res!191879 () Bool)

(assert (=> b!346817 (=> (not res!191879) (not e!212541))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346817 (= res!191879 (and (= (size!9120 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9121 _keys!1895) (size!9120 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346818 () Bool)

(declare-fun res!191876 () Bool)

(declare-fun e!212542 () Bool)

(assert (=> b!346818 (=> (not res!191876) (not e!212542))))

(declare-datatypes ((SeekEntryResult!3383 0))(
  ( (MissingZero!3383 (index!15711 (_ BitVec 32))) (Found!3383 (index!15712 (_ BitVec 32))) (Intermediate!3383 (undefined!4195 Bool) (index!15713 (_ BitVec 32)) (x!34549 (_ BitVec 32))) (Undefined!3383) (MissingVacant!3383 (index!15714 (_ BitVec 32))) )
))
(declare-fun lt!163438 () SeekEntryResult!3383)

(declare-fun arrayContainsKey!0 (array!18517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346818 (= res!191876 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15712 lt!163438)))))

(declare-fun b!346819 () Bool)

(declare-fun res!191881 () Bool)

(assert (=> b!346819 (=> (not res!191881) (not e!212541))))

(declare-datatypes ((List!5086 0))(
  ( (Nil!5083) (Cons!5082 (h!5938 (_ BitVec 64)) (t!10214 List!5086)) )
))
(declare-fun arrayNoDuplicates!0 (array!18517 (_ BitVec 32) List!5086) Bool)

(assert (=> b!346819 (= res!191881 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5083))))

(declare-fun b!346820 () Bool)

(assert (=> b!346820 (= e!212541 e!212542)))

(declare-fun res!191875 () Bool)

(assert (=> b!346820 (=> (not res!191875) (not e!212542))))

(get-info :version)

(assert (=> b!346820 (= res!191875 (and ((_ is Found!3383) lt!163438) (= (select (arr!8769 _keys!1895) (index!15712 lt!163438)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18517 (_ BitVec 32)) SeekEntryResult!3383)

(assert (=> b!346820 (= lt!163438 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12648 () Bool)

(declare-fun tp!26090 () Bool)

(assert (=> mapNonEmpty!12648 (= mapRes!12648 (and tp!26090 e!212543))))

(declare-fun mapRest!12648 () (Array (_ BitVec 32) ValueCell!3387))

(declare-fun mapKey!12648 () (_ BitVec 32))

(declare-fun mapValue!12648 () ValueCell!3387)

(assert (=> mapNonEmpty!12648 (= (arr!8768 _values!1525) (store mapRest!12648 mapKey!12648 mapValue!12648))))

(declare-fun b!346821 () Bool)

(declare-fun res!191877 () Bool)

(assert (=> b!346821 (=> (not res!191877) (not e!212541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18517 (_ BitVec 32)) Bool)

(assert (=> b!346821 (= res!191877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346822 () Bool)

(assert (=> b!346822 (= e!212542 (not true))))

(assert (=> b!346822 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10767 0))(
  ( (Unit!10768) )
))
(declare-fun lt!163437 () Unit!10767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18517 (_ BitVec 64) (_ BitVec 32)) Unit!10767)

(assert (=> b!346822 (= lt!163437 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15712 lt!163438)))))

(declare-fun b!346823 () Bool)

(assert (=> b!346823 (= e!212544 (and e!212539 mapRes!12648))))

(declare-fun condMapEmpty!12648 () Bool)

(declare-fun mapDefault!12648 () ValueCell!3387)

(assert (=> b!346823 (= condMapEmpty!12648 (= (arr!8768 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3387)) mapDefault!12648)))))

(declare-fun b!346824 () Bool)

(declare-fun res!191880 () Bool)

(assert (=> b!346824 (=> (not res!191880) (not e!212541))))

(declare-fun zeroValue!1467 () V!10925)

(declare-fun minValue!1467 () V!10925)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5464 0))(
  ( (tuple2!5465 (_1!2743 (_ BitVec 64)) (_2!2743 V!10925)) )
))
(declare-datatypes ((List!5087 0))(
  ( (Nil!5084) (Cons!5083 (h!5939 tuple2!5464) (t!10215 List!5087)) )
))
(declare-datatypes ((ListLongMap!4377 0))(
  ( (ListLongMap!4378 (toList!2204 List!5087)) )
))
(declare-fun contains!2268 (ListLongMap!4377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1725 (array!18517 array!18515 (_ BitVec 32) (_ BitVec 32) V!10925 V!10925 (_ BitVec 32) Int) ListLongMap!4377)

(assert (=> b!346824 (= res!191880 (not (contains!2268 (getCurrentListMap!1725 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34702 res!191878) b!346817))

(assert (= (and b!346817 res!191879) b!346821))

(assert (= (and b!346821 res!191877) b!346819))

(assert (= (and b!346819 res!191881) b!346814))

(assert (= (and b!346814 res!191882) b!346824))

(assert (= (and b!346824 res!191880) b!346820))

(assert (= (and b!346820 res!191875) b!346818))

(assert (= (and b!346818 res!191876) b!346822))

(assert (= (and b!346823 condMapEmpty!12648) mapIsEmpty!12648))

(assert (= (and b!346823 (not condMapEmpty!12648)) mapNonEmpty!12648))

(assert (= (and mapNonEmpty!12648 ((_ is ValueCellFull!3387) mapValue!12648)) b!346815))

(assert (= (and b!346823 ((_ is ValueCellFull!3387) mapDefault!12648)) b!346816))

(assert (= start!34702 b!346823))

(declare-fun m!347839 () Bool)

(assert (=> b!346824 m!347839))

(assert (=> b!346824 m!347839))

(declare-fun m!347841 () Bool)

(assert (=> b!346824 m!347841))

(declare-fun m!347843 () Bool)

(assert (=> b!346822 m!347843))

(declare-fun m!347845 () Bool)

(assert (=> b!346822 m!347845))

(declare-fun m!347847 () Bool)

(assert (=> start!34702 m!347847))

(declare-fun m!347849 () Bool)

(assert (=> start!34702 m!347849))

(declare-fun m!347851 () Bool)

(assert (=> start!34702 m!347851))

(declare-fun m!347853 () Bool)

(assert (=> b!346820 m!347853))

(declare-fun m!347855 () Bool)

(assert (=> b!346820 m!347855))

(declare-fun m!347857 () Bool)

(assert (=> b!346814 m!347857))

(declare-fun m!347859 () Bool)

(assert (=> b!346819 m!347859))

(declare-fun m!347861 () Bool)

(assert (=> mapNonEmpty!12648 m!347861))

(declare-fun m!347863 () Bool)

(assert (=> b!346818 m!347863))

(declare-fun m!347865 () Bool)

(assert (=> b!346821 m!347865))

(check-sat b_and!14729 (not b!346819) (not b!346814) (not start!34702) (not b!346820) (not mapNonEmpty!12648) (not b!346824) (not b!346822) tp_is_empty!7461 (not b!346821) (not b!346818) (not b_next!7509))
(check-sat b_and!14729 (not b_next!7509))
