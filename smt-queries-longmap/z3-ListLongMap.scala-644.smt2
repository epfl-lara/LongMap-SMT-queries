; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16214 () Bool)

(assert start!16214)

(declare-fun b!161737 () Bool)

(declare-fun b_free!3675 () Bool)

(declare-fun b_next!3675 () Bool)

(assert (=> b!161737 (= b_free!3675 (not b_next!3675))))

(declare-fun tp!13594 () Bool)

(declare-fun b_and!10089 () Bool)

(assert (=> b!161737 (= tp!13594 b_and!10089)))

(declare-fun b!161732 () Bool)

(declare-fun res!76624 () Bool)

(declare-fun e!105768 () Bool)

(assert (=> b!161732 (=> (not res!76624) (not e!105768))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161732 (= res!76624 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5903 () Bool)

(declare-fun mapRes!5903 () Bool)

(declare-fun tp!13595 () Bool)

(declare-fun e!105769 () Bool)

(assert (=> mapNonEmpty!5903 (= mapRes!5903 (and tp!13595 e!105769))))

(declare-fun mapKey!5903 () (_ BitVec 32))

(declare-datatypes ((V!4283 0))(
  ( (V!4284 (val!1783 Int)) )
))
(declare-datatypes ((ValueCell!1395 0))(
  ( (ValueCellFull!1395 (v!3648 V!4283)) (EmptyCell!1395) )
))
(declare-datatypes ((array!6033 0))(
  ( (array!6034 (arr!2861 (Array (_ BitVec 32) (_ BitVec 64))) (size!3145 (_ BitVec 32))) )
))
(declare-datatypes ((array!6035 0))(
  ( (array!6036 (arr!2862 (Array (_ BitVec 32) ValueCell!1395)) (size!3146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1698 0))(
  ( (LongMapFixedSize!1699 (defaultEntry!3291 Int) (mask!7891 (_ BitVec 32)) (extraKeys!3032 (_ BitVec 32)) (zeroValue!3134 V!4283) (minValue!3134 V!4283) (_size!898 (_ BitVec 32)) (_keys!5092 array!6033) (_values!3274 array!6035) (_vacant!898 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1698)

(declare-fun mapRest!5903 () (Array (_ BitVec 32) ValueCell!1395))

(declare-fun mapValue!5903 () ValueCell!1395)

(assert (=> mapNonEmpty!5903 (= (arr!2862 (_values!3274 thiss!1248)) (store mapRest!5903 mapKey!5903 mapValue!5903))))

(declare-fun res!76625 () Bool)

(assert (=> start!16214 (=> (not res!76625) (not e!105768))))

(declare-fun valid!776 (LongMapFixedSize!1698) Bool)

(assert (=> start!16214 (= res!76625 (valid!776 thiss!1248))))

(assert (=> start!16214 e!105768))

(declare-fun e!105766 () Bool)

(assert (=> start!16214 e!105766))

(assert (=> start!16214 true))

(declare-fun b!161733 () Bool)

(declare-fun tp_is_empty!3477 () Bool)

(assert (=> b!161733 (= e!105769 tp_is_empty!3477)))

(declare-fun b!161734 () Bool)

(declare-datatypes ((SeekEntryResult!361 0))(
  ( (MissingZero!361 (index!3612 (_ BitVec 32))) (Found!361 (index!3613 (_ BitVec 32))) (Intermediate!361 (undefined!1173 Bool) (index!3614 (_ BitVec 32)) (x!17857 (_ BitVec 32))) (Undefined!361) (MissingVacant!361 (index!3615 (_ BitVec 32))) )
))
(declare-fun lt!82270 () SeekEntryResult!361)

(get-info :version)

(assert (=> b!161734 (= e!105768 (and (not ((_ is Undefined!361) lt!82270)) ((_ is MissingVacant!361) lt!82270) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6033 (_ BitVec 32)) SeekEntryResult!361)

(assert (=> b!161734 (= lt!82270 (seekEntryOrOpen!0 key!828 (_keys!5092 thiss!1248) (mask!7891 thiss!1248)))))

(declare-fun b!161735 () Bool)

(declare-fun e!105771 () Bool)

(declare-fun e!105770 () Bool)

(assert (=> b!161735 (= e!105771 (and e!105770 mapRes!5903))))

(declare-fun condMapEmpty!5903 () Bool)

(declare-fun mapDefault!5903 () ValueCell!1395)

(assert (=> b!161735 (= condMapEmpty!5903 (= (arr!2862 (_values!3274 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1395)) mapDefault!5903)))))

(declare-fun mapIsEmpty!5903 () Bool)

(assert (=> mapIsEmpty!5903 mapRes!5903))

(declare-fun b!161736 () Bool)

(assert (=> b!161736 (= e!105770 tp_is_empty!3477)))

(declare-fun array_inv!1829 (array!6033) Bool)

(declare-fun array_inv!1830 (array!6035) Bool)

(assert (=> b!161737 (= e!105766 (and tp!13594 tp_is_empty!3477 (array_inv!1829 (_keys!5092 thiss!1248)) (array_inv!1830 (_values!3274 thiss!1248)) e!105771))))

(assert (= (and start!16214 res!76625) b!161732))

(assert (= (and b!161732 res!76624) b!161734))

(assert (= (and b!161735 condMapEmpty!5903) mapIsEmpty!5903))

(assert (= (and b!161735 (not condMapEmpty!5903)) mapNonEmpty!5903))

(assert (= (and mapNonEmpty!5903 ((_ is ValueCellFull!1395) mapValue!5903)) b!161733))

(assert (= (and b!161735 ((_ is ValueCellFull!1395) mapDefault!5903)) b!161736))

(assert (= b!161737 b!161735))

(assert (= start!16214 b!161737))

(declare-fun m!193117 () Bool)

(assert (=> mapNonEmpty!5903 m!193117))

(declare-fun m!193119 () Bool)

(assert (=> start!16214 m!193119))

(declare-fun m!193121 () Bool)

(assert (=> b!161734 m!193121))

(declare-fun m!193123 () Bool)

(assert (=> b!161737 m!193123))

(declare-fun m!193125 () Bool)

(assert (=> b!161737 m!193125))

(check-sat tp_is_empty!3477 (not b!161734) (not start!16214) (not b!161737) b_and!10089 (not b_next!3675) (not mapNonEmpty!5903))
(check-sat b_and!10089 (not b_next!3675))
