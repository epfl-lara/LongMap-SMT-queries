; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16258 () Bool)

(assert start!16258)

(declare-fun b!162225 () Bool)

(declare-fun b_free!3715 () Bool)

(declare-fun b_next!3715 () Bool)

(assert (=> b!162225 (= b_free!3715 (not b_next!3715))))

(declare-fun tp!13714 () Bool)

(declare-fun b_and!10143 () Bool)

(assert (=> b!162225 (= tp!13714 b_and!10143)))

(declare-fun b!162220 () Bool)

(declare-fun e!106214 () Bool)

(declare-fun e!106216 () Bool)

(declare-fun mapRes!5963 () Bool)

(assert (=> b!162220 (= e!106214 (and e!106216 mapRes!5963))))

(declare-fun condMapEmpty!5963 () Bool)

(declare-datatypes ((V!4337 0))(
  ( (V!4338 (val!1803 Int)) )
))
(declare-datatypes ((ValueCell!1415 0))(
  ( (ValueCellFull!1415 (v!3669 V!4337)) (EmptyCell!1415) )
))
(declare-datatypes ((array!6099 0))(
  ( (array!6100 (arr!2894 (Array (_ BitVec 32) (_ BitVec 64))) (size!3178 (_ BitVec 32))) )
))
(declare-datatypes ((array!6101 0))(
  ( (array!6102 (arr!2895 (Array (_ BitVec 32) ValueCell!1415)) (size!3179 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1738 0))(
  ( (LongMapFixedSize!1739 (defaultEntry!3311 Int) (mask!7925 (_ BitVec 32)) (extraKeys!3052 (_ BitVec 32)) (zeroValue!3154 V!4337) (minValue!3154 V!4337) (_size!918 (_ BitVec 32)) (_keys!5112 array!6099) (_values!3294 array!6101) (_vacant!918 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1738)

(declare-fun mapDefault!5963 () ValueCell!1415)

(assert (=> b!162220 (= condMapEmpty!5963 (= (arr!2895 (_values!3294 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1415)) mapDefault!5963)))))

(declare-fun mapIsEmpty!5963 () Bool)

(assert (=> mapIsEmpty!5963 mapRes!5963))

(declare-fun mapNonEmpty!5963 () Bool)

(declare-fun tp!13715 () Bool)

(declare-fun e!106215 () Bool)

(assert (=> mapNonEmpty!5963 (= mapRes!5963 (and tp!13715 e!106215))))

(declare-fun mapValue!5963 () ValueCell!1415)

(declare-fun mapKey!5963 () (_ BitVec 32))

(declare-fun mapRest!5963 () (Array (_ BitVec 32) ValueCell!1415))

(assert (=> mapNonEmpty!5963 (= (arr!2895 (_values!3294 thiss!1248)) (store mapRest!5963 mapKey!5963 mapValue!5963))))

(declare-fun b!162222 () Bool)

(declare-fun tp_is_empty!3517 () Bool)

(assert (=> b!162222 (= e!106215 tp_is_empty!3517)))

(declare-fun b!162223 () Bool)

(assert (=> b!162223 (= e!106216 tp_is_empty!3517)))

(declare-fun res!76847 () Bool)

(declare-fun e!106217 () Bool)

(assert (=> start!16258 (=> (not res!76847) (not e!106217))))

(declare-fun valid!808 (LongMapFixedSize!1738) Bool)

(assert (=> start!16258 (= res!76847 (valid!808 thiss!1248))))

(assert (=> start!16258 e!106217))

(declare-fun e!106213 () Bool)

(assert (=> start!16258 e!106213))

(assert (=> start!16258 true))

(declare-fun b!162221 () Bool)

(assert (=> b!162221 (= e!106217 false)))

(declare-datatypes ((SeekEntryResult!369 0))(
  ( (MissingZero!369 (index!3644 (_ BitVec 32))) (Found!369 (index!3645 (_ BitVec 32))) (Intermediate!369 (undefined!1181 Bool) (index!3646 (_ BitVec 32)) (x!17921 (_ BitVec 32))) (Undefined!369) (MissingVacant!369 (index!3647 (_ BitVec 32))) )
))
(declare-fun lt!82452 () SeekEntryResult!369)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6099 (_ BitVec 32)) SeekEntryResult!369)

(assert (=> b!162221 (= lt!82452 (seekEntryOrOpen!0 key!828 (_keys!5112 thiss!1248) (mask!7925 thiss!1248)))))

(declare-fun b!162224 () Bool)

(declare-fun res!76846 () Bool)

(assert (=> b!162224 (=> (not res!76846) (not e!106217))))

(assert (=> b!162224 (= res!76846 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!1855 (array!6099) Bool)

(declare-fun array_inv!1856 (array!6101) Bool)

(assert (=> b!162225 (= e!106213 (and tp!13714 tp_is_empty!3517 (array_inv!1855 (_keys!5112 thiss!1248)) (array_inv!1856 (_values!3294 thiss!1248)) e!106214))))

(assert (= (and start!16258 res!76847) b!162224))

(assert (= (and b!162224 res!76846) b!162221))

(assert (= (and b!162220 condMapEmpty!5963) mapIsEmpty!5963))

(assert (= (and b!162220 (not condMapEmpty!5963)) mapNonEmpty!5963))

(get-info :version)

(assert (= (and mapNonEmpty!5963 ((_ is ValueCellFull!1415) mapValue!5963)) b!162222))

(assert (= (and b!162220 ((_ is ValueCellFull!1415) mapDefault!5963)) b!162223))

(assert (= b!162225 b!162220))

(assert (= start!16258 b!162225))

(declare-fun m!193583 () Bool)

(assert (=> mapNonEmpty!5963 m!193583))

(declare-fun m!193585 () Bool)

(assert (=> start!16258 m!193585))

(declare-fun m!193587 () Bool)

(assert (=> b!162221 m!193587))

(declare-fun m!193589 () Bool)

(assert (=> b!162225 m!193589))

(declare-fun m!193591 () Bool)

(assert (=> b!162225 m!193591))

(check-sat tp_is_empty!3517 (not b!162221) b_and!10143 (not b!162225) (not start!16258) (not mapNonEmpty!5963) (not b_next!3715))
(check-sat b_and!10143 (not b_next!3715))
