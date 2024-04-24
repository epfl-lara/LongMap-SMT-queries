; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34934 () Bool)

(assert start!34934)

(declare-fun b_free!7663 () Bool)

(declare-fun b_next!7663 () Bool)

(assert (=> start!34934 (= b_free!7663 (not b_next!7663))))

(declare-fun tp!26565 () Bool)

(declare-fun b_and!14905 () Bool)

(assert (=> start!34934 (= tp!26565 b_and!14905)))

(declare-fun b!349912 () Bool)

(declare-fun e!214339 () Bool)

(assert (=> b!349912 (= e!214339 false)))

(declare-datatypes ((Unit!10810 0))(
  ( (Unit!10811) )
))
(declare-fun lt!164427 () Unit!10810)

(declare-fun e!214341 () Unit!10810)

(assert (=> b!349912 (= lt!164427 e!214341)))

(declare-fun c!53321 () Bool)

(declare-datatypes ((array!18806 0))(
  ( (array!18807 (arr!8909 (Array (_ BitVec 32) (_ BitVec 64))) (size!9261 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18806)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349912 (= c!53321 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349913 () Bool)

(declare-fun Unit!10812 () Unit!10810)

(assert (=> b!349913 (= e!214341 Unit!10812)))

(declare-fun b!349914 () Bool)

(declare-fun res!193947 () Bool)

(declare-fun e!214337 () Bool)

(assert (=> b!349914 (=> (not res!193947) (not e!214337))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11131 0))(
  ( (V!11132 (val!3852 Int)) )
))
(declare-fun zeroValue!1467 () V!11131)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3464 0))(
  ( (ValueCellFull!3464 (v!6039 V!11131)) (EmptyCell!3464) )
))
(declare-datatypes ((array!18808 0))(
  ( (array!18809 (arr!8910 (Array (_ BitVec 32) ValueCell!3464)) (size!9262 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18808)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11131)

(declare-datatypes ((tuple2!5478 0))(
  ( (tuple2!5479 (_1!2750 (_ BitVec 64)) (_2!2750 V!11131)) )
))
(declare-datatypes ((List!5085 0))(
  ( (Nil!5082) (Cons!5081 (h!5937 tuple2!5478) (t!10213 List!5085)) )
))
(declare-datatypes ((ListLongMap!4393 0))(
  ( (ListLongMap!4394 (toList!2212 List!5085)) )
))
(declare-fun contains!2299 (ListLongMap!4393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1740 (array!18806 array!18808 (_ BitVec 32) (_ BitVec 32) V!11131 V!11131 (_ BitVec 32) Int) ListLongMap!4393)

(assert (=> b!349914 (= res!193947 (not (contains!2299 (getCurrentListMap!1740 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349915 () Bool)

(declare-fun res!193949 () Bool)

(assert (=> b!349915 (=> (not res!193949) (not e!214337))))

(declare-datatypes ((List!5086 0))(
  ( (Nil!5083) (Cons!5082 (h!5938 (_ BitVec 64)) (t!10214 List!5086)) )
))
(declare-fun arrayNoDuplicates!0 (array!18806 (_ BitVec 32) List!5086) Bool)

(assert (=> b!349915 (= res!193949 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5083))))

(declare-fun b!349916 () Bool)

(declare-fun e!214338 () Bool)

(declare-fun tp_is_empty!7615 () Bool)

(assert (=> b!349916 (= e!214338 tp_is_empty!7615)))

(declare-fun res!193948 () Bool)

(assert (=> start!34934 (=> (not res!193948) (not e!214337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34934 (= res!193948 (validMask!0 mask!2385))))

(assert (=> start!34934 e!214337))

(assert (=> start!34934 true))

(assert (=> start!34934 tp_is_empty!7615))

(assert (=> start!34934 tp!26565))

(declare-fun e!214335 () Bool)

(declare-fun array_inv!6586 (array!18808) Bool)

(assert (=> start!34934 (and (array_inv!6586 _values!1525) e!214335)))

(declare-fun array_inv!6587 (array!18806) Bool)

(assert (=> start!34934 (array_inv!6587 _keys!1895)))

(declare-fun mapNonEmpty!12891 () Bool)

(declare-fun mapRes!12891 () Bool)

(declare-fun tp!26564 () Bool)

(assert (=> mapNonEmpty!12891 (= mapRes!12891 (and tp!26564 e!214338))))

(declare-fun mapKey!12891 () (_ BitVec 32))

(declare-fun mapValue!12891 () ValueCell!3464)

(declare-fun mapRest!12891 () (Array (_ BitVec 32) ValueCell!3464))

(assert (=> mapNonEmpty!12891 (= (arr!8910 _values!1525) (store mapRest!12891 mapKey!12891 mapValue!12891))))

(declare-fun b!349917 () Bool)

(declare-fun e!214340 () Bool)

(assert (=> b!349917 (= e!214340 tp_is_empty!7615)))

(declare-fun b!349918 () Bool)

(declare-fun res!193945 () Bool)

(assert (=> b!349918 (=> (not res!193945) (not e!214337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18806 (_ BitVec 32)) Bool)

(assert (=> b!349918 (= res!193945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349919 () Bool)

(declare-fun Unit!10813 () Unit!10810)

(assert (=> b!349919 (= e!214341 Unit!10813)))

(declare-fun lt!164426 () Unit!10810)

(declare-fun lemmaArrayContainsKeyThenInListMap!330 (array!18806 array!18808 (_ BitVec 32) (_ BitVec 32) V!11131 V!11131 (_ BitVec 64) (_ BitVec 32) Int) Unit!10810)

(declare-fun arrayScanForKey!0 (array!18806 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349919 (= lt!164426 (lemmaArrayContainsKeyThenInListMap!330 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349919 false))

(declare-fun b!349920 () Bool)

(assert (=> b!349920 (= e!214337 e!214339)))

(declare-fun res!193950 () Bool)

(assert (=> b!349920 (=> (not res!193950) (not e!214339))))

(declare-datatypes ((SeekEntryResult!3387 0))(
  ( (MissingZero!3387 (index!15727 (_ BitVec 32))) (Found!3387 (index!15728 (_ BitVec 32))) (Intermediate!3387 (undefined!4199 Bool) (index!15729 (_ BitVec 32)) (x!34798 (_ BitVec 32))) (Undefined!3387) (MissingVacant!3387 (index!15730 (_ BitVec 32))) )
))
(declare-fun lt!164428 () SeekEntryResult!3387)

(get-info :version)

(assert (=> b!349920 (= res!193950 (and (not ((_ is Found!3387) lt!164428)) ((_ is MissingZero!3387) lt!164428)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18806 (_ BitVec 32)) SeekEntryResult!3387)

(assert (=> b!349920 (= lt!164428 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349921 () Bool)

(assert (=> b!349921 (= e!214335 (and e!214340 mapRes!12891))))

(declare-fun condMapEmpty!12891 () Bool)

(declare-fun mapDefault!12891 () ValueCell!3464)

(assert (=> b!349921 (= condMapEmpty!12891 (= (arr!8910 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3464)) mapDefault!12891)))))

(declare-fun mapIsEmpty!12891 () Bool)

(assert (=> mapIsEmpty!12891 mapRes!12891))

(declare-fun b!349922 () Bool)

(declare-fun res!193944 () Bool)

(assert (=> b!349922 (=> (not res!193944) (not e!214337))))

(assert (=> b!349922 (= res!193944 (and (= (size!9262 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9261 _keys!1895) (size!9262 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349923 () Bool)

(declare-fun res!193946 () Bool)

(assert (=> b!349923 (=> (not res!193946) (not e!214337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349923 (= res!193946 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34934 res!193948) b!349922))

(assert (= (and b!349922 res!193944) b!349918))

(assert (= (and b!349918 res!193945) b!349915))

(assert (= (and b!349915 res!193949) b!349923))

(assert (= (and b!349923 res!193946) b!349914))

(assert (= (and b!349914 res!193947) b!349920))

(assert (= (and b!349920 res!193950) b!349912))

(assert (= (and b!349912 c!53321) b!349919))

(assert (= (and b!349912 (not c!53321)) b!349913))

(assert (= (and b!349921 condMapEmpty!12891) mapIsEmpty!12891))

(assert (= (and b!349921 (not condMapEmpty!12891)) mapNonEmpty!12891))

(assert (= (and mapNonEmpty!12891 ((_ is ValueCellFull!3464) mapValue!12891)) b!349916))

(assert (= (and b!349921 ((_ is ValueCellFull!3464) mapDefault!12891)) b!349917))

(assert (= start!34934 b!349921))

(declare-fun m!350541 () Bool)

(assert (=> b!349914 m!350541))

(assert (=> b!349914 m!350541))

(declare-fun m!350543 () Bool)

(assert (=> b!349914 m!350543))

(declare-fun m!350545 () Bool)

(assert (=> b!349915 m!350545))

(declare-fun m!350547 () Bool)

(assert (=> b!349912 m!350547))

(declare-fun m!350549 () Bool)

(assert (=> b!349918 m!350549))

(declare-fun m!350551 () Bool)

(assert (=> start!34934 m!350551))

(declare-fun m!350553 () Bool)

(assert (=> start!34934 m!350553))

(declare-fun m!350555 () Bool)

(assert (=> start!34934 m!350555))

(declare-fun m!350557 () Bool)

(assert (=> b!349920 m!350557))

(declare-fun m!350559 () Bool)

(assert (=> mapNonEmpty!12891 m!350559))

(declare-fun m!350561 () Bool)

(assert (=> b!349923 m!350561))

(declare-fun m!350563 () Bool)

(assert (=> b!349919 m!350563))

(assert (=> b!349919 m!350563))

(declare-fun m!350565 () Bool)

(assert (=> b!349919 m!350565))

(check-sat b_and!14905 (not b_next!7663) (not start!34934) tp_is_empty!7615 (not b!349918) (not b!349923) (not b!349920) (not b!349915) (not mapNonEmpty!12891) (not b!349914) (not b!349912) (not b!349919))
(check-sat b_and!14905 (not b_next!7663))
