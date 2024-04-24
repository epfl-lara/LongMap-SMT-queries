; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16198 () Bool)

(assert start!16198)

(declare-fun b!161582 () Bool)

(declare-fun b_free!3655 () Bool)

(declare-fun b_next!3655 () Bool)

(assert (=> b!161582 (= b_free!3655 (not b_next!3655))))

(declare-fun tp!13534 () Bool)

(declare-fun b_and!10083 () Bool)

(assert (=> b!161582 (= tp!13534 b_and!10083)))

(declare-fun b!161579 () Bool)

(declare-fun e!105608 () Bool)

(declare-fun tp_is_empty!3457 () Bool)

(assert (=> b!161579 (= e!105608 tp_is_empty!3457)))

(declare-fun mapNonEmpty!5873 () Bool)

(declare-fun mapRes!5873 () Bool)

(declare-fun tp!13535 () Bool)

(declare-fun e!105609 () Bool)

(assert (=> mapNonEmpty!5873 (= mapRes!5873 (and tp!13535 e!105609))))

(declare-datatypes ((V!4257 0))(
  ( (V!4258 (val!1773 Int)) )
))
(declare-datatypes ((ValueCell!1385 0))(
  ( (ValueCellFull!1385 (v!3639 V!4257)) (EmptyCell!1385) )
))
(declare-fun mapRest!5873 () (Array (_ BitVec 32) ValueCell!1385))

(declare-fun mapKey!5873 () (_ BitVec 32))

(declare-datatypes ((array!5979 0))(
  ( (array!5980 (arr!2834 (Array (_ BitVec 32) (_ BitVec 64))) (size!3118 (_ BitVec 32))) )
))
(declare-datatypes ((array!5981 0))(
  ( (array!5982 (arr!2835 (Array (_ BitVec 32) ValueCell!1385)) (size!3119 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1678 0))(
  ( (LongMapFixedSize!1679 (defaultEntry!3281 Int) (mask!7875 (_ BitVec 32)) (extraKeys!3022 (_ BitVec 32)) (zeroValue!3124 V!4257) (minValue!3124 V!4257) (_size!888 (_ BitVec 32)) (_keys!5082 array!5979) (_values!3264 array!5981) (_vacant!888 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1678)

(declare-fun mapValue!5873 () ValueCell!1385)

(assert (=> mapNonEmpty!5873 (= (arr!2835 (_values!3264 thiss!1248)) (store mapRest!5873 mapKey!5873 mapValue!5873))))

(declare-fun b!161580 () Bool)

(declare-datatypes ((Unit!5036 0))(
  ( (Unit!5037) )
))
(declare-fun e!105605 () Unit!5036)

(declare-fun Unit!5038 () Unit!5036)

(assert (=> b!161580 (= e!105605 Unit!5038)))

(declare-fun lt!82292 () Unit!5036)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!83 (array!5979 array!5981 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 64) Int) Unit!5036)

(assert (=> b!161580 (= lt!82292 (lemmaInListMapThenSeekEntryOrOpenFindsIt!83 (_keys!5082 thiss!1248) (_values!3264 thiss!1248) (mask!7875 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) key!828 (defaultEntry!3281 thiss!1248)))))

(assert (=> b!161580 false))

(declare-fun b!161581 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!80 (array!5979 array!5981 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 64) Int) Unit!5036)

(assert (=> b!161581 (= e!105605 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!80 (_keys!5082 thiss!1248) (_values!3264 thiss!1248) (mask!7875 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) key!828 (defaultEntry!3281 thiss!1248)))))

(declare-fun e!105607 () Bool)

(declare-fun e!105606 () Bool)

(declare-fun array_inv!1817 (array!5979) Bool)

(declare-fun array_inv!1818 (array!5981) Bool)

(assert (=> b!161582 (= e!105607 (and tp!13534 tp_is_empty!3457 (array_inv!1817 (_keys!5082 thiss!1248)) (array_inv!1818 (_values!3264 thiss!1248)) e!105606))))

(declare-fun b!161583 () Bool)

(declare-fun e!105603 () Bool)

(assert (=> b!161583 (= e!105603 false)))

(declare-fun lt!82293 () Unit!5036)

(assert (=> b!161583 (= lt!82293 e!105605)))

(declare-fun c!29984 () Bool)

(declare-datatypes ((tuple2!2922 0))(
  ( (tuple2!2923 (_1!1472 (_ BitVec 64)) (_2!1472 V!4257)) )
))
(declare-datatypes ((List!1977 0))(
  ( (Nil!1974) (Cons!1973 (h!2586 tuple2!2922) (t!6771 List!1977)) )
))
(declare-datatypes ((ListLongMap!1921 0))(
  ( (ListLongMap!1922 (toList!976 List!1977)) )
))
(declare-fun contains!1022 (ListLongMap!1921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!643 (array!5979 array!5981 (_ BitVec 32) (_ BitVec 32) V!4257 V!4257 (_ BitVec 32) Int) ListLongMap!1921)

(assert (=> b!161583 (= c!29984 (contains!1022 (getCurrentListMap!643 (_keys!5082 thiss!1248) (_values!3264 thiss!1248) (mask!7875 thiss!1248) (extraKeys!3022 thiss!1248) (zeroValue!3124 thiss!1248) (minValue!3124 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3281 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!5873 () Bool)

(assert (=> mapIsEmpty!5873 mapRes!5873))

(declare-fun b!161584 () Bool)

(assert (=> b!161584 (= e!105609 tp_is_empty!3457)))

(declare-fun b!161578 () Bool)

(assert (=> b!161578 (= e!105606 (and e!105608 mapRes!5873))))

(declare-fun condMapEmpty!5873 () Bool)

(declare-fun mapDefault!5873 () ValueCell!1385)

(assert (=> b!161578 (= condMapEmpty!5873 (= (arr!2835 (_values!3264 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1385)) mapDefault!5873)))))

(declare-fun res!76579 () Bool)

(assert (=> start!16198 (=> (not res!76579) (not e!105603))))

(declare-fun valid!788 (LongMapFixedSize!1678) Bool)

(assert (=> start!16198 (= res!76579 (valid!788 thiss!1248))))

(assert (=> start!16198 e!105603))

(assert (=> start!16198 e!105607))

(assert (=> start!16198 true))

(declare-fun b!161585 () Bool)

(declare-fun res!76580 () Bool)

(assert (=> b!161585 (=> (not res!76580) (not e!105603))))

(assert (=> b!161585 (= res!76580 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161586 () Bool)

(declare-fun res!76578 () Bool)

(assert (=> b!161586 (=> (not res!76578) (not e!105603))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!351 0))(
  ( (MissingZero!351 (index!3572 (_ BitVec 32))) (Found!351 (index!3573 (_ BitVec 32))) (Intermediate!351 (undefined!1163 Bool) (index!3574 (_ BitVec 32)) (x!17823 (_ BitVec 32))) (Undefined!351) (MissingVacant!351 (index!3575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5979 (_ BitVec 32)) SeekEntryResult!351)

(assert (=> b!161586 (= res!76578 ((_ is Undefined!351) (seekEntryOrOpen!0 key!828 (_keys!5082 thiss!1248) (mask!7875 thiss!1248))))))

(assert (= (and start!16198 res!76579) b!161585))

(assert (= (and b!161585 res!76580) b!161586))

(assert (= (and b!161586 res!76578) b!161583))

(assert (= (and b!161583 c!29984) b!161580))

(assert (= (and b!161583 (not c!29984)) b!161581))

(assert (= (and b!161578 condMapEmpty!5873) mapIsEmpty!5873))

(assert (= (and b!161578 (not condMapEmpty!5873)) mapNonEmpty!5873))

(assert (= (and mapNonEmpty!5873 ((_ is ValueCellFull!1385) mapValue!5873)) b!161584))

(assert (= (and b!161578 ((_ is ValueCellFull!1385) mapDefault!5873)) b!161579))

(assert (= b!161582 b!161578))

(assert (= start!16198 b!161582))

(declare-fun m!193175 () Bool)

(assert (=> start!16198 m!193175))

(declare-fun m!193177 () Bool)

(assert (=> b!161586 m!193177))

(declare-fun m!193179 () Bool)

(assert (=> b!161583 m!193179))

(assert (=> b!161583 m!193179))

(declare-fun m!193181 () Bool)

(assert (=> b!161583 m!193181))

(declare-fun m!193183 () Bool)

(assert (=> mapNonEmpty!5873 m!193183))

(declare-fun m!193185 () Bool)

(assert (=> b!161582 m!193185))

(declare-fun m!193187 () Bool)

(assert (=> b!161582 m!193187))

(declare-fun m!193189 () Bool)

(assert (=> b!161580 m!193189))

(declare-fun m!193191 () Bool)

(assert (=> b!161581 m!193191))

(check-sat (not b!161582) (not mapNonEmpty!5873) b_and!10083 tp_is_empty!3457 (not start!16198) (not b!161586) (not b!161580) (not b!161583) (not b_next!3655) (not b!161581))
(check-sat b_and!10083 (not b_next!3655))
