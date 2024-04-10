; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16220 () Bool)

(assert start!16220)

(declare-fun b!161789 () Bool)

(declare-fun b_free!3681 () Bool)

(declare-fun b_next!3681 () Bool)

(assert (=> b!161789 (= b_free!3681 (not b_next!3681))))

(declare-fun tp!13612 () Bool)

(declare-fun b_and!10095 () Bool)

(assert (=> b!161789 (= tp!13612 b_and!10095)))

(declare-fun res!76642 () Bool)

(declare-fun e!105823 () Bool)

(assert (=> start!16220 (=> (not res!76642) (not e!105823))))

(declare-datatypes ((V!4291 0))(
  ( (V!4292 (val!1786 Int)) )
))
(declare-datatypes ((ValueCell!1398 0))(
  ( (ValueCellFull!1398 (v!3651 V!4291)) (EmptyCell!1398) )
))
(declare-datatypes ((array!6045 0))(
  ( (array!6046 (arr!2867 (Array (_ BitVec 32) (_ BitVec 64))) (size!3151 (_ BitVec 32))) )
))
(declare-datatypes ((array!6047 0))(
  ( (array!6048 (arr!2868 (Array (_ BitVec 32) ValueCell!1398)) (size!3152 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1704 0))(
  ( (LongMapFixedSize!1705 (defaultEntry!3294 Int) (mask!7896 (_ BitVec 32)) (extraKeys!3035 (_ BitVec 32)) (zeroValue!3137 V!4291) (minValue!3137 V!4291) (_size!901 (_ BitVec 32)) (_keys!5095 array!6045) (_values!3277 array!6047) (_vacant!901 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1704)

(declare-fun valid!777 (LongMapFixedSize!1704) Bool)

(assert (=> start!16220 (= res!76642 (valid!777 thiss!1248))))

(assert (=> start!16220 e!105823))

(declare-fun e!105824 () Bool)

(assert (=> start!16220 e!105824))

(assert (=> start!16220 true))

(declare-fun b!161786 () Bool)

(declare-datatypes ((SeekEntryResult!362 0))(
  ( (MissingZero!362 (index!3616 (_ BitVec 32))) (Found!362 (index!3617 (_ BitVec 32))) (Intermediate!362 (undefined!1174 Bool) (index!3618 (_ BitVec 32)) (x!17866 (_ BitVec 32))) (Undefined!362) (MissingVacant!362 (index!3619 (_ BitVec 32))) )
))
(declare-fun lt!82279 () SeekEntryResult!362)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!161786 (= e!105823 (and (not ((_ is Undefined!362) lt!82279)) ((_ is MissingVacant!362) lt!82279) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!82279 (MissingZero!362 (index!3619 lt!82279)))) (not (= lt!82279 (MissingVacant!362 (index!3619 lt!82279))))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6045 (_ BitVec 32)) SeekEntryResult!362)

(assert (=> b!161786 (= lt!82279 (seekEntryOrOpen!0 key!828 (_keys!5095 thiss!1248) (mask!7896 thiss!1248)))))

(declare-fun b!161787 () Bool)

(declare-fun e!105822 () Bool)

(declare-fun tp_is_empty!3483 () Bool)

(assert (=> b!161787 (= e!105822 tp_is_empty!3483)))

(declare-fun b!161788 () Bool)

(declare-fun e!105825 () Bool)

(assert (=> b!161788 (= e!105825 tp_is_empty!3483)))

(declare-fun e!105820 () Bool)

(declare-fun array_inv!1833 (array!6045) Bool)

(declare-fun array_inv!1834 (array!6047) Bool)

(assert (=> b!161789 (= e!105824 (and tp!13612 tp_is_empty!3483 (array_inv!1833 (_keys!5095 thiss!1248)) (array_inv!1834 (_values!3277 thiss!1248)) e!105820))))

(declare-fun b!161790 () Bool)

(declare-fun mapRes!5912 () Bool)

(assert (=> b!161790 (= e!105820 (and e!105822 mapRes!5912))))

(declare-fun condMapEmpty!5912 () Bool)

(declare-fun mapDefault!5912 () ValueCell!1398)

(assert (=> b!161790 (= condMapEmpty!5912 (= (arr!2868 (_values!3277 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1398)) mapDefault!5912)))))

(declare-fun mapIsEmpty!5912 () Bool)

(assert (=> mapIsEmpty!5912 mapRes!5912))

(declare-fun b!161791 () Bool)

(declare-fun res!76643 () Bool)

(assert (=> b!161791 (=> (not res!76643) (not e!105823))))

(assert (=> b!161791 (= res!76643 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5912 () Bool)

(declare-fun tp!13613 () Bool)

(assert (=> mapNonEmpty!5912 (= mapRes!5912 (and tp!13613 e!105825))))

(declare-fun mapValue!5912 () ValueCell!1398)

(declare-fun mapRest!5912 () (Array (_ BitVec 32) ValueCell!1398))

(declare-fun mapKey!5912 () (_ BitVec 32))

(assert (=> mapNonEmpty!5912 (= (arr!2868 (_values!3277 thiss!1248)) (store mapRest!5912 mapKey!5912 mapValue!5912))))

(assert (= (and start!16220 res!76642) b!161791))

(assert (= (and b!161791 res!76643) b!161786))

(assert (= (and b!161790 condMapEmpty!5912) mapIsEmpty!5912))

(assert (= (and b!161790 (not condMapEmpty!5912)) mapNonEmpty!5912))

(assert (= (and mapNonEmpty!5912 ((_ is ValueCellFull!1398) mapValue!5912)) b!161788))

(assert (= (and b!161790 ((_ is ValueCellFull!1398) mapDefault!5912)) b!161787))

(assert (= b!161789 b!161790))

(assert (= start!16220 b!161789))

(declare-fun m!193147 () Bool)

(assert (=> start!16220 m!193147))

(declare-fun m!193149 () Bool)

(assert (=> b!161786 m!193149))

(declare-fun m!193151 () Bool)

(assert (=> b!161789 m!193151))

(declare-fun m!193153 () Bool)

(assert (=> b!161789 m!193153))

(declare-fun m!193155 () Bool)

(assert (=> mapNonEmpty!5912 m!193155))

(check-sat (not b!161786) tp_is_empty!3483 (not mapNonEmpty!5912) (not b!161789) (not b_next!3681) b_and!10095 (not start!16220))
(check-sat b_and!10095 (not b_next!3681))
