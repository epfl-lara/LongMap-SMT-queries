; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16258 () Bool)

(assert start!16258)

(declare-fun b!162028 () Bool)

(declare-fun b_free!3715 () Bool)

(declare-fun b_next!3715 () Bool)

(assert (=> b!162028 (= b_free!3715 (not b_next!3715))))

(declare-fun tp!13714 () Bool)

(declare-fun b_and!10103 () Bool)

(assert (=> b!162028 (= tp!13714 b_and!10103)))

(declare-fun b!162026 () Bool)

(declare-fun e!106091 () Bool)

(declare-fun e!106088 () Bool)

(declare-fun mapRes!5963 () Bool)

(assert (=> b!162026 (= e!106091 (and e!106088 mapRes!5963))))

(declare-fun condMapEmpty!5963 () Bool)

(declare-datatypes ((V!4337 0))(
  ( (V!4338 (val!1803 Int)) )
))
(declare-datatypes ((ValueCell!1415 0))(
  ( (ValueCellFull!1415 (v!3662 V!4337)) (EmptyCell!1415) )
))
(declare-datatypes ((array!6093 0))(
  ( (array!6094 (arr!2890 (Array (_ BitVec 32) (_ BitVec 64))) (size!3175 (_ BitVec 32))) )
))
(declare-datatypes ((array!6095 0))(
  ( (array!6096 (arr!2891 (Array (_ BitVec 32) ValueCell!1415)) (size!3176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1738 0))(
  ( (LongMapFixedSize!1739 (defaultEntry!3311 Int) (mask!7924 (_ BitVec 32)) (extraKeys!3052 (_ BitVec 32)) (zeroValue!3154 V!4337) (minValue!3154 V!4337) (_size!918 (_ BitVec 32)) (_keys!5111 array!6093) (_values!3294 array!6095) (_vacant!918 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1738)

(declare-fun mapDefault!5963 () ValueCell!1415)

(assert (=> b!162026 (= condMapEmpty!5963 (= (arr!2891 (_values!3294 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1415)) mapDefault!5963)))))

(declare-fun b!162027 () Bool)

(declare-fun res!76731 () Bool)

(declare-fun e!106090 () Bool)

(assert (=> b!162027 (=> (not res!76731) (not e!106090))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162027 (= res!76731 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106092 () Bool)

(declare-fun tp_is_empty!3517 () Bool)

(declare-fun array_inv!1869 (array!6093) Bool)

(declare-fun array_inv!1870 (array!6095) Bool)

(assert (=> b!162028 (= e!106092 (and tp!13714 tp_is_empty!3517 (array_inv!1869 (_keys!5111 thiss!1248)) (array_inv!1870 (_values!3294 thiss!1248)) e!106091))))

(declare-fun res!76730 () Bool)

(assert (=> start!16258 (=> (not res!76730) (not e!106090))))

(declare-fun valid!790 (LongMapFixedSize!1738) Bool)

(assert (=> start!16258 (= res!76730 (valid!790 thiss!1248))))

(assert (=> start!16258 e!106090))

(assert (=> start!16258 e!106092))

(assert (=> start!16258 true))

(declare-fun mapIsEmpty!5963 () Bool)

(assert (=> mapIsEmpty!5963 mapRes!5963))

(declare-fun mapNonEmpty!5963 () Bool)

(declare-fun tp!13715 () Bool)

(declare-fun e!106093 () Bool)

(assert (=> mapNonEmpty!5963 (= mapRes!5963 (and tp!13715 e!106093))))

(declare-fun mapValue!5963 () ValueCell!1415)

(declare-fun mapKey!5963 () (_ BitVec 32))

(declare-fun mapRest!5963 () (Array (_ BitVec 32) ValueCell!1415))

(assert (=> mapNonEmpty!5963 (= (arr!2891 (_values!3294 thiss!1248)) (store mapRest!5963 mapKey!5963 mapValue!5963))))

(declare-fun b!162029 () Bool)

(assert (=> b!162029 (= e!106088 tp_is_empty!3517)))

(declare-fun b!162030 () Bool)

(assert (=> b!162030 (= e!106090 false)))

(declare-datatypes ((SeekEntryResult!383 0))(
  ( (MissingZero!383 (index!3700 (_ BitVec 32))) (Found!383 (index!3701 (_ BitVec 32))) (Intermediate!383 (undefined!1195 Bool) (index!3702 (_ BitVec 32)) (x!17934 (_ BitVec 32))) (Undefined!383) (MissingVacant!383 (index!3703 (_ BitVec 32))) )
))
(declare-fun lt!82212 () SeekEntryResult!383)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6093 (_ BitVec 32)) SeekEntryResult!383)

(assert (=> b!162030 (= lt!82212 (seekEntryOrOpen!0 key!828 (_keys!5111 thiss!1248) (mask!7924 thiss!1248)))))

(declare-fun b!162031 () Bool)

(assert (=> b!162031 (= e!106093 tp_is_empty!3517)))

(assert (= (and start!16258 res!76730) b!162027))

(assert (= (and b!162027 res!76731) b!162030))

(assert (= (and b!162026 condMapEmpty!5963) mapIsEmpty!5963))

(assert (= (and b!162026 (not condMapEmpty!5963)) mapNonEmpty!5963))

(get-info :version)

(assert (= (and mapNonEmpty!5963 ((_ is ValueCellFull!1415) mapValue!5963)) b!162031))

(assert (= (and b!162026 ((_ is ValueCellFull!1415) mapDefault!5963)) b!162029))

(assert (= b!162028 b!162026))

(assert (= start!16258 b!162028))

(declare-fun m!192781 () Bool)

(assert (=> b!162028 m!192781))

(declare-fun m!192783 () Bool)

(assert (=> b!162028 m!192783))

(declare-fun m!192785 () Bool)

(assert (=> start!16258 m!192785))

(declare-fun m!192787 () Bool)

(assert (=> mapNonEmpty!5963 m!192787))

(declare-fun m!192789 () Bool)

(assert (=> b!162030 m!192789))

(check-sat (not mapNonEmpty!5963) (not start!16258) tp_is_empty!3517 b_and!10103 (not b_next!3715) (not b!162028) (not b!162030))
(check-sat b_and!10103 (not b_next!3715))
