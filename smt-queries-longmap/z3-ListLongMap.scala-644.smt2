; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16216 () Bool)

(assert start!16216)

(declare-fun b!161764 () Bool)

(declare-fun b_free!3673 () Bool)

(declare-fun b_next!3673 () Bool)

(assert (=> b!161764 (= b_free!3673 (not b_next!3673))))

(declare-fun tp!13589 () Bool)

(declare-fun b_and!10101 () Bool)

(assert (=> b!161764 (= tp!13589 b_and!10101)))

(declare-fun b!161761 () Bool)

(declare-fun e!105777 () Bool)

(declare-datatypes ((SeekEntryResult!356 0))(
  ( (MissingZero!356 (index!3592 (_ BitVec 32))) (Found!356 (index!3593 (_ BitVec 32))) (Intermediate!356 (undefined!1168 Bool) (index!3594 (_ BitVec 32)) (x!17852 (_ BitVec 32))) (Undefined!356) (MissingVacant!356 (index!3595 (_ BitVec 32))) )
))
(declare-fun lt!82326 () SeekEntryResult!356)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!161761 (= e!105777 (and (not ((_ is Undefined!356) lt!82326)) ((_ is MissingVacant!356) lt!82326) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((V!4281 0))(
  ( (V!4282 (val!1782 Int)) )
))
(declare-datatypes ((ValueCell!1394 0))(
  ( (ValueCellFull!1394 (v!3648 V!4281)) (EmptyCell!1394) )
))
(declare-datatypes ((array!6015 0))(
  ( (array!6016 (arr!2852 (Array (_ BitVec 32) (_ BitVec 64))) (size!3136 (_ BitVec 32))) )
))
(declare-datatypes ((array!6017 0))(
  ( (array!6018 (arr!2853 (Array (_ BitVec 32) ValueCell!1394)) (size!3137 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1696 0))(
  ( (LongMapFixedSize!1697 (defaultEntry!3290 Int) (mask!7890 (_ BitVec 32)) (extraKeys!3031 (_ BitVec 32)) (zeroValue!3133 V!4281) (minValue!3133 V!4281) (_size!897 (_ BitVec 32)) (_keys!5091 array!6015) (_values!3273 array!6017) (_vacant!897 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1696)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6015 (_ BitVec 32)) SeekEntryResult!356)

(assert (=> b!161761 (= lt!82326 (seekEntryOrOpen!0 key!828 (_keys!5091 thiss!1248) (mask!7890 thiss!1248)))))

(declare-fun b!161762 () Bool)

(declare-fun e!105774 () Bool)

(declare-fun e!105776 () Bool)

(declare-fun mapRes!5900 () Bool)

(assert (=> b!161762 (= e!105774 (and e!105776 mapRes!5900))))

(declare-fun condMapEmpty!5900 () Bool)

(declare-fun mapDefault!5900 () ValueCell!1394)

(assert (=> b!161762 (= condMapEmpty!5900 (= (arr!2853 (_values!3273 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1394)) mapDefault!5900)))))

(declare-fun mapIsEmpty!5900 () Bool)

(assert (=> mapIsEmpty!5900 mapRes!5900))

(declare-fun b!161763 () Bool)

(declare-fun res!76640 () Bool)

(assert (=> b!161763 (=> (not res!76640) (not e!105777))))

(assert (=> b!161763 (= res!76640 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76639 () Bool)

(assert (=> start!16216 (=> (not res!76639) (not e!105777))))

(declare-fun valid!793 (LongMapFixedSize!1696) Bool)

(assert (=> start!16216 (= res!76639 (valid!793 thiss!1248))))

(assert (=> start!16216 e!105777))

(declare-fun e!105775 () Bool)

(assert (=> start!16216 e!105775))

(assert (=> start!16216 true))

(declare-fun mapNonEmpty!5900 () Bool)

(declare-fun tp!13588 () Bool)

(declare-fun e!105773 () Bool)

(assert (=> mapNonEmpty!5900 (= mapRes!5900 (and tp!13588 e!105773))))

(declare-fun mapKey!5900 () (_ BitVec 32))

(declare-fun mapRest!5900 () (Array (_ BitVec 32) ValueCell!1394))

(declare-fun mapValue!5900 () ValueCell!1394)

(assert (=> mapNonEmpty!5900 (= (arr!2853 (_values!3273 thiss!1248)) (store mapRest!5900 mapKey!5900 mapValue!5900))))

(declare-fun tp_is_empty!3475 () Bool)

(declare-fun array_inv!1829 (array!6015) Bool)

(declare-fun array_inv!1830 (array!6017) Bool)

(assert (=> b!161764 (= e!105775 (and tp!13589 tp_is_empty!3475 (array_inv!1829 (_keys!5091 thiss!1248)) (array_inv!1830 (_values!3273 thiss!1248)) e!105774))))

(declare-fun b!161765 () Bool)

(assert (=> b!161765 (= e!105776 tp_is_empty!3475)))

(declare-fun b!161766 () Bool)

(assert (=> b!161766 (= e!105773 tp_is_empty!3475)))

(assert (= (and start!16216 res!76639) b!161763))

(assert (= (and b!161763 res!76640) b!161761))

(assert (= (and b!161762 condMapEmpty!5900) mapIsEmpty!5900))

(assert (= (and b!161762 (not condMapEmpty!5900)) mapNonEmpty!5900))

(assert (= (and mapNonEmpty!5900 ((_ is ValueCellFull!1394) mapValue!5900)) b!161766))

(assert (= (and b!161762 ((_ is ValueCellFull!1394) mapDefault!5900)) b!161765))

(assert (= b!161764 b!161762))

(assert (= start!16216 b!161764))

(declare-fun m!193289 () Bool)

(assert (=> b!161761 m!193289))

(declare-fun m!193291 () Bool)

(assert (=> start!16216 m!193291))

(declare-fun m!193293 () Bool)

(assert (=> mapNonEmpty!5900 m!193293))

(declare-fun m!193295 () Bool)

(assert (=> b!161764 m!193295))

(declare-fun m!193297 () Bool)

(assert (=> b!161764 m!193297))

(check-sat (not start!16216) (not b_next!3673) tp_is_empty!3475 b_and!10101 (not mapNonEmpty!5900) (not b!161761) (not b!161764))
(check-sat b_and!10101 (not b_next!3673))
