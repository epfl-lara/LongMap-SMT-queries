; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16696 () Bool)

(assert start!16696)

(declare-fun b!167341 () Bool)

(declare-fun b_free!4001 () Bool)

(declare-fun b_next!4001 () Bool)

(assert (=> b!167341 (= b_free!4001 (not b_next!4001))))

(declare-fun tp!14603 () Bool)

(declare-fun b_and!10415 () Bool)

(assert (=> b!167341 (= tp!14603 b_and!10415)))

(declare-fun b!167331 () Bool)

(declare-fun res!79581 () Bool)

(declare-fun e!109889 () Bool)

(assert (=> b!167331 (=> (not res!79581) (not e!109889))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!167331 (= res!79581 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167332 () Bool)

(declare-fun res!79585 () Bool)

(declare-fun e!109888 () Bool)

(assert (=> b!167332 (=> (not res!79585) (not e!109888))))

(declare-datatypes ((V!4717 0))(
  ( (V!4718 (val!1946 Int)) )
))
(declare-datatypes ((ValueCell!1558 0))(
  ( (ValueCellFull!1558 (v!3811 V!4717)) (EmptyCell!1558) )
))
(declare-datatypes ((array!6703 0))(
  ( (array!6704 (arr!3187 (Array (_ BitVec 32) (_ BitVec 64))) (size!3475 (_ BitVec 32))) )
))
(declare-datatypes ((array!6705 0))(
  ( (array!6706 (arr!3188 (Array (_ BitVec 32) ValueCell!1558)) (size!3476 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2024 0))(
  ( (LongMapFixedSize!2025 (defaultEntry!3454 Int) (mask!8199 (_ BitVec 32)) (extraKeys!3195 (_ BitVec 32)) (zeroValue!3297 V!4717) (minValue!3297 V!4717) (_size!1061 (_ BitVec 32)) (_keys!5279 array!6703) (_values!3437 array!6705) (_vacant!1061 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2024)

(assert (=> b!167332 (= res!79585 (and (= (size!3476 (_values!3437 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8199 thiss!1248))) (= (size!3475 (_keys!5279 thiss!1248)) (size!3476 (_values!3437 thiss!1248))) (bvsge (mask!8199 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3195 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3195 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167333 () Bool)

(declare-fun e!109884 () Bool)

(declare-fun tp_is_empty!3803 () Bool)

(assert (=> b!167333 (= e!109884 tp_is_empty!3803)))

(declare-fun b!167334 () Bool)

(assert (=> b!167334 (= e!109888 false)))

(declare-fun lt!83651 () Bool)

(declare-datatypes ((List!2125 0))(
  ( (Nil!2122) (Cons!2121 (h!2738 (_ BitVec 64)) (t!6927 List!2125)) )
))
(declare-fun arrayNoDuplicates!0 (array!6703 (_ BitVec 32) List!2125) Bool)

(assert (=> b!167334 (= lt!83651 (arrayNoDuplicates!0 (_keys!5279 thiss!1248) #b00000000000000000000000000000000 Nil!2122))))

(declare-fun b!167335 () Bool)

(declare-fun res!79586 () Bool)

(assert (=> b!167335 (=> (not res!79586) (not e!109888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6703 (_ BitVec 32)) Bool)

(assert (=> b!167335 (= res!79586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5279 thiss!1248) (mask!8199 thiss!1248)))))

(declare-fun mapNonEmpty!6423 () Bool)

(declare-fun mapRes!6423 () Bool)

(declare-fun tp!14604 () Bool)

(declare-fun e!109887 () Bool)

(assert (=> mapNonEmpty!6423 (= mapRes!6423 (and tp!14604 e!109887))))

(declare-fun mapValue!6423 () ValueCell!1558)

(declare-fun mapKey!6423 () (_ BitVec 32))

(declare-fun mapRest!6423 () (Array (_ BitVec 32) ValueCell!1558))

(assert (=> mapNonEmpty!6423 (= (arr!3188 (_values!3437 thiss!1248)) (store mapRest!6423 mapKey!6423 mapValue!6423))))

(declare-fun b!167336 () Bool)

(assert (=> b!167336 (= e!109887 tp_is_empty!3803)))

(declare-datatypes ((SeekEntryResult!477 0))(
  ( (MissingZero!477 (index!4076 (_ BitVec 32))) (Found!477 (index!4077 (_ BitVec 32))) (Intermediate!477 (undefined!1289 Bool) (index!4078 (_ BitVec 32)) (x!18513 (_ BitVec 32))) (Undefined!477) (MissingVacant!477 (index!4079 (_ BitVec 32))) )
))
(declare-fun lt!83653 () SeekEntryResult!477)

(declare-fun e!109881 () Bool)

(declare-fun b!167337 () Bool)

(assert (=> b!167337 (= e!109881 (= (select (arr!3187 (_keys!5279 thiss!1248)) (index!4077 lt!83653)) key!828))))

(declare-fun b!167338 () Bool)

(declare-datatypes ((Unit!5120 0))(
  ( (Unit!5121) )
))
(declare-fun e!109883 () Unit!5120)

(declare-fun Unit!5122 () Unit!5120)

(assert (=> b!167338 (= e!109883 Unit!5122)))

(declare-fun lt!83652 () Unit!5120)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!105 (array!6703 array!6705 (_ BitVec 32) (_ BitVec 32) V!4717 V!4717 (_ BitVec 64) Int) Unit!5120)

(assert (=> b!167338 (= lt!83652 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!105 (_keys!5279 thiss!1248) (_values!3437 thiss!1248) (mask!8199 thiss!1248) (extraKeys!3195 thiss!1248) (zeroValue!3297 thiss!1248) (minValue!3297 thiss!1248) key!828 (defaultEntry!3454 thiss!1248)))))

(assert (=> b!167338 false))

(declare-fun b!167339 () Bool)

(declare-fun e!109880 () Bool)

(assert (=> b!167339 (= e!109889 e!109880)))

(declare-fun res!79582 () Bool)

(assert (=> b!167339 (=> (not res!79582) (not e!109880))))

(assert (=> b!167339 (= res!79582 (and (not (is-Undefined!477 lt!83653)) (not (is-MissingVacant!477 lt!83653)) (not (is-MissingZero!477 lt!83653)) (is-Found!477 lt!83653)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6703 (_ BitVec 32)) SeekEntryResult!477)

(assert (=> b!167339 (= lt!83653 (seekEntryOrOpen!0 key!828 (_keys!5279 thiss!1248) (mask!8199 thiss!1248)))))

(declare-fun b!167340 () Bool)

(declare-fun lt!83650 () Unit!5120)

(assert (=> b!167340 (= e!109883 lt!83650)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!104 (array!6703 array!6705 (_ BitVec 32) (_ BitVec 32) V!4717 V!4717 (_ BitVec 64) Int) Unit!5120)

(assert (=> b!167340 (= lt!83650 (lemmaInListMapThenSeekEntryOrOpenFindsIt!104 (_keys!5279 thiss!1248) (_values!3437 thiss!1248) (mask!8199 thiss!1248) (extraKeys!3195 thiss!1248) (zeroValue!3297 thiss!1248) (minValue!3297 thiss!1248) key!828 (defaultEntry!3454 thiss!1248)))))

(declare-fun res!79587 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167340 (= res!79587 (inRange!0 (index!4077 lt!83653) (mask!8199 thiss!1248)))))

(assert (=> b!167340 (=> (not res!79587) (not e!109881))))

(assert (=> b!167340 e!109881))

(declare-fun e!109885 () Bool)

(declare-fun e!109882 () Bool)

(declare-fun array_inv!2053 (array!6703) Bool)

(declare-fun array_inv!2054 (array!6705) Bool)

(assert (=> b!167341 (= e!109885 (and tp!14603 tp_is_empty!3803 (array_inv!2053 (_keys!5279 thiss!1248)) (array_inv!2054 (_values!3437 thiss!1248)) e!109882))))

(declare-fun b!167342 () Bool)

(assert (=> b!167342 (= e!109880 e!109888)))

(declare-fun res!79584 () Bool)

(assert (=> b!167342 (=> (not res!79584) (not e!109888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167342 (= res!79584 (validMask!0 (mask!8199 thiss!1248)))))

(declare-fun lt!83649 () Unit!5120)

(assert (=> b!167342 (= lt!83649 e!109883)))

(declare-fun c!30283 () Bool)

(declare-datatypes ((tuple2!3138 0))(
  ( (tuple2!3139 (_1!1580 (_ BitVec 64)) (_2!1580 V!4717)) )
))
(declare-datatypes ((List!2126 0))(
  ( (Nil!2123) (Cons!2122 (h!2739 tuple2!3138) (t!6928 List!2126)) )
))
(declare-datatypes ((ListLongMap!2093 0))(
  ( (ListLongMap!2094 (toList!1062 List!2126)) )
))
(declare-fun contains!1104 (ListLongMap!2093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!720 (array!6703 array!6705 (_ BitVec 32) (_ BitVec 32) V!4717 V!4717 (_ BitVec 32) Int) ListLongMap!2093)

(assert (=> b!167342 (= c!30283 (contains!1104 (getCurrentListMap!720 (_keys!5279 thiss!1248) (_values!3437 thiss!1248) (mask!8199 thiss!1248) (extraKeys!3195 thiss!1248) (zeroValue!3297 thiss!1248) (minValue!3297 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3454 thiss!1248)) key!828))))

(declare-fun b!167343 () Bool)

(assert (=> b!167343 (= e!109882 (and e!109884 mapRes!6423))))

(declare-fun condMapEmpty!6423 () Bool)

(declare-fun mapDefault!6423 () ValueCell!1558)

