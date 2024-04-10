; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16172 () Bool)

(assert start!16172)

(declare-fun b!161242 () Bool)

(declare-fun b_free!3633 () Bool)

(declare-fun b_next!3633 () Bool)

(assert (=> b!161242 (= b_free!3633 (not b_next!3633))))

(declare-fun tp!13468 () Bool)

(declare-fun b_and!10047 () Bool)

(assert (=> b!161242 (= tp!13468 b_and!10047)))

(declare-fun b!161234 () Bool)

(declare-fun e!105350 () Bool)

(declare-fun tp_is_empty!3435 () Bool)

(assert (=> b!161234 (= e!105350 tp_is_empty!3435)))

(declare-fun mapNonEmpty!5840 () Bool)

(declare-fun mapRes!5840 () Bool)

(declare-fun tp!13469 () Bool)

(assert (=> mapNonEmpty!5840 (= mapRes!5840 (and tp!13469 e!105350))))

(declare-datatypes ((V!4227 0))(
  ( (V!4228 (val!1762 Int)) )
))
(declare-datatypes ((ValueCell!1374 0))(
  ( (ValueCellFull!1374 (v!3627 V!4227)) (EmptyCell!1374) )
))
(declare-datatypes ((array!5949 0))(
  ( (array!5950 (arr!2819 (Array (_ BitVec 32) (_ BitVec 64))) (size!3103 (_ BitVec 32))) )
))
(declare-datatypes ((array!5951 0))(
  ( (array!5952 (arr!2820 (Array (_ BitVec 32) ValueCell!1374)) (size!3104 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1656 0))(
  ( (LongMapFixedSize!1657 (defaultEntry!3270 Int) (mask!7856 (_ BitVec 32)) (extraKeys!3011 (_ BitVec 32)) (zeroValue!3113 V!4227) (minValue!3113 V!4227) (_size!877 (_ BitVec 32)) (_keys!5071 array!5949) (_values!3253 array!5951) (_vacant!877 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1656)

(declare-fun mapKey!5840 () (_ BitVec 32))

(declare-fun mapValue!5840 () ValueCell!1374)

(declare-fun mapRest!5840 () (Array (_ BitVec 32) ValueCell!1374))

(assert (=> mapNonEmpty!5840 (= (arr!2820 (_values!3253 thiss!1248)) (store mapRest!5840 mapKey!5840 mapValue!5840))))

(declare-fun b!161236 () Bool)

(declare-datatypes ((Unit!4998 0))(
  ( (Unit!4999) )
))
(declare-fun e!105349 () Unit!4998)

(declare-fun Unit!5000 () Unit!4998)

(assert (=> b!161236 (= e!105349 Unit!5000)))

(declare-fun lt!82167 () Unit!4998)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!72 (array!5949 array!5951 (_ BitVec 32) (_ BitVec 32) V!4227 V!4227 (_ BitVec 64) Int) Unit!4998)

(assert (=> b!161236 (= lt!82167 (lemmaInListMapThenSeekEntryOrOpenFindsIt!72 (_keys!5071 thiss!1248) (_values!3253 thiss!1248) (mask!7856 thiss!1248) (extraKeys!3011 thiss!1248) (zeroValue!3113 thiss!1248) (minValue!3113 thiss!1248) key!828 (defaultEntry!3270 thiss!1248)))))

(assert (=> b!161236 false))

(declare-fun b!161237 () Bool)

(declare-fun res!76458 () Bool)

(declare-fun e!105352 () Bool)

(assert (=> b!161237 (=> (not res!76458) (not e!105352))))

(assert (=> b!161237 (= res!76458 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161238 () Bool)

(declare-fun e!105354 () Bool)

(assert (=> b!161238 (= e!105354 tp_is_empty!3435)))

(declare-fun b!161239 () Bool)

(declare-fun e!105351 () Bool)

(assert (=> b!161239 (= e!105351 (and e!105354 mapRes!5840))))

(declare-fun condMapEmpty!5840 () Bool)

(declare-fun mapDefault!5840 () ValueCell!1374)

(assert (=> b!161239 (= condMapEmpty!5840 (= (arr!2820 (_values!3253 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1374)) mapDefault!5840)))))

(declare-fun b!161240 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!73 (array!5949 array!5951 (_ BitVec 32) (_ BitVec 32) V!4227 V!4227 (_ BitVec 64) Int) Unit!4998)

(assert (=> b!161240 (= e!105349 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!73 (_keys!5071 thiss!1248) (_values!3253 thiss!1248) (mask!7856 thiss!1248) (extraKeys!3011 thiss!1248) (zeroValue!3113 thiss!1248) (minValue!3113 thiss!1248) key!828 (defaultEntry!3270 thiss!1248)))))

(declare-fun mapIsEmpty!5840 () Bool)

(assert (=> mapIsEmpty!5840 mapRes!5840))

(declare-fun b!161241 () Bool)

(declare-fun res!76459 () Bool)

(assert (=> b!161241 (=> (not res!76459) (not e!105352))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!349 0))(
  ( (MissingZero!349 (index!3564 (_ BitVec 32))) (Found!349 (index!3565 (_ BitVec 32))) (Intermediate!349 (undefined!1161 Bool) (index!3566 (_ BitVec 32)) (x!17789 (_ BitVec 32))) (Undefined!349) (MissingVacant!349 (index!3567 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5949 (_ BitVec 32)) SeekEntryResult!349)

(assert (=> b!161241 (= res!76459 ((_ is Undefined!349) (seekEntryOrOpen!0 key!828 (_keys!5071 thiss!1248) (mask!7856 thiss!1248))))))

(declare-fun e!105353 () Bool)

(declare-fun array_inv!1801 (array!5949) Bool)

(declare-fun array_inv!1802 (array!5951) Bool)

(assert (=> b!161242 (= e!105353 (and tp!13468 tp_is_empty!3435 (array_inv!1801 (_keys!5071 thiss!1248)) (array_inv!1802 (_values!3253 thiss!1248)) e!105351))))

(declare-fun b!161235 () Bool)

(assert (=> b!161235 (= e!105352 false)))

(declare-fun lt!82168 () Unit!4998)

(assert (=> b!161235 (= lt!82168 e!105349)))

(declare-fun c!29938 () Bool)

(declare-datatypes ((tuple2!2952 0))(
  ( (tuple2!2953 (_1!1487 (_ BitVec 64)) (_2!1487 V!4227)) )
))
(declare-datatypes ((List!1972 0))(
  ( (Nil!1969) (Cons!1968 (h!2581 tuple2!2952) (t!6774 List!1972)) )
))
(declare-datatypes ((ListLongMap!1939 0))(
  ( (ListLongMap!1940 (toList!985 List!1972)) )
))
(declare-fun contains!1021 (ListLongMap!1939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!649 (array!5949 array!5951 (_ BitVec 32) (_ BitVec 32) V!4227 V!4227 (_ BitVec 32) Int) ListLongMap!1939)

(assert (=> b!161235 (= c!29938 (contains!1021 (getCurrentListMap!649 (_keys!5071 thiss!1248) (_values!3253 thiss!1248) (mask!7856 thiss!1248) (extraKeys!3011 thiss!1248) (zeroValue!3113 thiss!1248) (minValue!3113 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3270 thiss!1248)) key!828))))

(declare-fun res!76460 () Bool)

(assert (=> start!16172 (=> (not res!76460) (not e!105352))))

(declare-fun valid!760 (LongMapFixedSize!1656) Bool)

(assert (=> start!16172 (= res!76460 (valid!760 thiss!1248))))

(assert (=> start!16172 e!105352))

(assert (=> start!16172 e!105353))

(assert (=> start!16172 true))

(assert (= (and start!16172 res!76460) b!161237))

(assert (= (and b!161237 res!76458) b!161241))

(assert (= (and b!161241 res!76459) b!161235))

(assert (= (and b!161235 c!29938) b!161236))

(assert (= (and b!161235 (not c!29938)) b!161240))

(assert (= (and b!161239 condMapEmpty!5840) mapIsEmpty!5840))

(assert (= (and b!161239 (not condMapEmpty!5840)) mapNonEmpty!5840))

(assert (= (and mapNonEmpty!5840 ((_ is ValueCellFull!1374) mapValue!5840)) b!161234))

(assert (= (and b!161239 ((_ is ValueCellFull!1374) mapDefault!5840)) b!161238))

(assert (= b!161242 b!161239))

(assert (= start!16172 b!161242))

(declare-fun m!192795 () Bool)

(assert (=> b!161236 m!192795))

(declare-fun m!192797 () Bool)

(assert (=> b!161240 m!192797))

(declare-fun m!192799 () Bool)

(assert (=> b!161242 m!192799))

(declare-fun m!192801 () Bool)

(assert (=> b!161242 m!192801))

(declare-fun m!192803 () Bool)

(assert (=> mapNonEmpty!5840 m!192803))

(declare-fun m!192805 () Bool)

(assert (=> b!161235 m!192805))

(assert (=> b!161235 m!192805))

(declare-fun m!192807 () Bool)

(assert (=> b!161235 m!192807))

(declare-fun m!192809 () Bool)

(assert (=> start!16172 m!192809))

(declare-fun m!192811 () Bool)

(assert (=> b!161241 m!192811))

(check-sat tp_is_empty!3435 (not b!161240) (not b_next!3633) (not mapNonEmpty!5840) (not b!161236) (not b!161235) b_and!10047 (not b!161242) (not start!16172) (not b!161241))
(check-sat b_and!10047 (not b_next!3633))
