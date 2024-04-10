; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16292 () Bool)

(assert start!16292)

(declare-fun b!162569 () Bool)

(declare-fun b_free!3753 () Bool)

(declare-fun b_next!3753 () Bool)

(assert (=> b!162569 (= b_free!3753 (not b_next!3753))))

(declare-fun tp!13828 () Bool)

(declare-fun b_and!10167 () Bool)

(assert (=> b!162569 (= tp!13828 b_and!10167)))

(declare-fun b!162566 () Bool)

(declare-fun res!76990 () Bool)

(declare-fun e!106575 () Bool)

(assert (=> b!162566 (=> (not res!76990) (not e!106575))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162566 (= res!76990 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162567 () Bool)

(declare-fun e!106574 () Bool)

(assert (=> b!162567 (= e!106575 e!106574)))

(declare-fun res!76992 () Bool)

(assert (=> b!162567 (=> (not res!76992) (not e!106574))))

(declare-datatypes ((SeekEntryResult!385 0))(
  ( (MissingZero!385 (index!3708 (_ BitVec 32))) (Found!385 (index!3709 (_ BitVec 32))) (Intermediate!385 (undefined!1197 Bool) (index!3710 (_ BitVec 32)) (x!17985 (_ BitVec 32))) (Undefined!385) (MissingVacant!385 (index!3711 (_ BitVec 32))) )
))
(declare-fun lt!82488 () SeekEntryResult!385)

(get-info :version)

(assert (=> b!162567 (= res!76992 (and (not ((_ is Undefined!385) lt!82488)) (not ((_ is MissingVacant!385) lt!82488)) ((_ is MissingZero!385) lt!82488)))))

(declare-datatypes ((V!4387 0))(
  ( (V!4388 (val!1822 Int)) )
))
(declare-datatypes ((ValueCell!1434 0))(
  ( (ValueCellFull!1434 (v!3687 V!4387)) (EmptyCell!1434) )
))
(declare-datatypes ((array!6189 0))(
  ( (array!6190 (arr!2939 (Array (_ BitVec 32) (_ BitVec 64))) (size!3223 (_ BitVec 32))) )
))
(declare-datatypes ((array!6191 0))(
  ( (array!6192 (arr!2940 (Array (_ BitVec 32) ValueCell!1434)) (size!3224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1776 0))(
  ( (LongMapFixedSize!1777 (defaultEntry!3330 Int) (mask!7956 (_ BitVec 32)) (extraKeys!3071 (_ BitVec 32)) (zeroValue!3173 V!4387) (minValue!3173 V!4387) (_size!937 (_ BitVec 32)) (_keys!5131 array!6189) (_values!3313 array!6191) (_vacant!937 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1776)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6189 (_ BitVec 32)) SeekEntryResult!385)

(assert (=> b!162567 (= lt!82488 (seekEntryOrOpen!0 key!828 (_keys!5131 thiss!1248) (mask!7956 thiss!1248)))))

(declare-fun b!162568 () Bool)

(declare-fun e!106573 () Bool)

(declare-fun tp_is_empty!3555 () Bool)

(assert (=> b!162568 (= e!106573 tp_is_empty!3555)))

(declare-fun e!106569 () Bool)

(declare-fun e!106568 () Bool)

(declare-fun array_inv!1879 (array!6189) Bool)

(declare-fun array_inv!1880 (array!6191) Bool)

(assert (=> b!162569 (= e!106568 (and tp!13828 tp_is_empty!3555 (array_inv!1879 (_keys!5131 thiss!1248)) (array_inv!1880 (_values!3313 thiss!1248)) e!106569))))

(declare-fun b!162570 () Bool)

(declare-fun res!76994 () Bool)

(declare-fun e!106571 () Bool)

(assert (=> b!162570 (=> (not res!76994) (not e!106571))))

(declare-datatypes ((tuple2!3002 0))(
  ( (tuple2!3003 (_1!1512 Bool) (_2!1512 LongMapFixedSize!1776)) )
))
(declare-fun lt!82487 () tuple2!3002)

(assert (=> b!162570 (= res!76994 (_1!1512 lt!82487))))

(declare-fun mapNonEmpty!6020 () Bool)

(declare-fun mapRes!6020 () Bool)

(declare-fun tp!13829 () Bool)

(assert (=> mapNonEmpty!6020 (= mapRes!6020 (and tp!13829 e!106573))))

(declare-fun mapKey!6020 () (_ BitVec 32))

(declare-fun mapRest!6020 () (Array (_ BitVec 32) ValueCell!1434))

(declare-fun mapValue!6020 () ValueCell!1434)

(assert (=> mapNonEmpty!6020 (= (arr!2940 (_values!3313 thiss!1248)) (store mapRest!6020 mapKey!6020 mapValue!6020))))

(declare-fun b!162571 () Bool)

(assert (=> b!162571 (= e!106571 false)))

(declare-fun lt!82489 () Bool)

(declare-datatypes ((tuple2!3004 0))(
  ( (tuple2!3005 (_1!1513 (_ BitVec 64)) (_2!1513 V!4387)) )
))
(declare-datatypes ((List!1986 0))(
  ( (Nil!1983) (Cons!1982 (h!2595 tuple2!3004) (t!6788 List!1986)) )
))
(declare-datatypes ((ListLongMap!1967 0))(
  ( (ListLongMap!1968 (toList!999 List!1986)) )
))
(declare-fun contains!1035 (ListLongMap!1967 (_ BitVec 64)) Bool)

(declare-fun map!1691 (LongMapFixedSize!1776) ListLongMap!1967)

(assert (=> b!162571 (= lt!82489 (contains!1035 (map!1691 (_2!1512 lt!82487)) key!828))))

(declare-fun res!76991 () Bool)

(assert (=> start!16292 (=> (not res!76991) (not e!106575))))

(declare-fun valid!802 (LongMapFixedSize!1776) Bool)

(assert (=> start!16292 (= res!76991 (valid!802 thiss!1248))))

(assert (=> start!16292 e!106575))

(assert (=> start!16292 e!106568))

(assert (=> start!16292 true))

(assert (=> start!16292 tp_is_empty!3555))

(declare-fun b!162572 () Bool)

(declare-fun e!106570 () Bool)

(assert (=> b!162572 (= e!106570 tp_is_empty!3555)))

(declare-fun mapIsEmpty!6020 () Bool)

(assert (=> mapIsEmpty!6020 mapRes!6020))

(declare-fun b!162573 () Bool)

(assert (=> b!162573 (= e!106569 (and e!106570 mapRes!6020))))

(declare-fun condMapEmpty!6020 () Bool)

(declare-fun mapDefault!6020 () ValueCell!1434)

(assert (=> b!162573 (= condMapEmpty!6020 (= (arr!2940 (_values!3313 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1434)) mapDefault!6020)))))

(declare-fun b!162574 () Bool)

(assert (=> b!162574 (= e!106574 e!106571)))

(declare-fun res!76993 () Bool)

(assert (=> b!162574 (=> (not res!76993) (not e!106571))))

(assert (=> b!162574 (= res!76993 (valid!802 (_2!1512 lt!82487)))))

(declare-fun v!309 () V!4387)

(declare-fun updateHelperNewKey!82 (LongMapFixedSize!1776 (_ BitVec 64) V!4387 (_ BitVec 32)) tuple2!3002)

(assert (=> b!162574 (= lt!82487 (updateHelperNewKey!82 thiss!1248 key!828 v!309 (index!3708 lt!82488)))))

(assert (= (and start!16292 res!76991) b!162566))

(assert (= (and b!162566 res!76990) b!162567))

(assert (= (and b!162567 res!76992) b!162574))

(assert (= (and b!162574 res!76993) b!162570))

(assert (= (and b!162570 res!76994) b!162571))

(assert (= (and b!162573 condMapEmpty!6020) mapIsEmpty!6020))

(assert (= (and b!162573 (not condMapEmpty!6020)) mapNonEmpty!6020))

(assert (= (and mapNonEmpty!6020 ((_ is ValueCellFull!1434) mapValue!6020)) b!162568))

(assert (= (and b!162573 ((_ is ValueCellFull!1434) mapDefault!6020)) b!162572))

(assert (= b!162569 b!162573))

(assert (= start!16292 b!162569))

(declare-fun m!193635 () Bool)

(assert (=> b!162567 m!193635))

(declare-fun m!193637 () Bool)

(assert (=> b!162569 m!193637))

(declare-fun m!193639 () Bool)

(assert (=> b!162569 m!193639))

(declare-fun m!193641 () Bool)

(assert (=> mapNonEmpty!6020 m!193641))

(declare-fun m!193643 () Bool)

(assert (=> b!162574 m!193643))

(declare-fun m!193645 () Bool)

(assert (=> b!162574 m!193645))

(declare-fun m!193647 () Bool)

(assert (=> start!16292 m!193647))

(declare-fun m!193649 () Bool)

(assert (=> b!162571 m!193649))

(assert (=> b!162571 m!193649))

(declare-fun m!193651 () Bool)

(assert (=> b!162571 m!193651))

(check-sat (not b!162567) (not b_next!3753) (not b!162569) (not start!16292) (not mapNonEmpty!6020) b_and!10167 (not b!162574) tp_is_empty!3555 (not b!162571))
(check-sat b_and!10167 (not b_next!3753))
