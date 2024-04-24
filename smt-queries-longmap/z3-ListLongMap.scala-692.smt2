; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16660 () Bool)

(assert start!16660)

(declare-fun b!166606 () Bool)

(declare-fun b_free!3961 () Bool)

(declare-fun b_next!3961 () Bool)

(assert (=> b!166606 (= b_free!3961 (not b_next!3961))))

(declare-fun tp!14483 () Bool)

(declare-fun b_and!10389 () Bool)

(assert (=> b!166606 (= tp!14483 b_and!10389)))

(declare-fun mapIsEmpty!6363 () Bool)

(declare-fun mapRes!6363 () Bool)

(assert (=> mapIsEmpty!6363 mapRes!6363))

(declare-fun b!166598 () Bool)

(declare-fun res!79184 () Bool)

(declare-fun e!109312 () Bool)

(assert (=> b!166598 (=> (not res!79184) (not e!109312))))

(declare-datatypes ((V!4665 0))(
  ( (V!4666 (val!1926 Int)) )
))
(declare-datatypes ((ValueCell!1538 0))(
  ( (ValueCellFull!1538 (v!3792 V!4665)) (EmptyCell!1538) )
))
(declare-datatypes ((array!6609 0))(
  ( (array!6610 (arr!3140 (Array (_ BitVec 32) (_ BitVec 64))) (size!3428 (_ BitVec 32))) )
))
(declare-datatypes ((array!6611 0))(
  ( (array!6612 (arr!3141 (Array (_ BitVec 32) ValueCell!1538)) (size!3429 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1984 0))(
  ( (LongMapFixedSize!1985 (defaultEntry!3434 Int) (mask!8167 (_ BitVec 32)) (extraKeys!3175 (_ BitVec 32)) (zeroValue!3277 V!4665) (minValue!3277 V!4665) (_size!1041 (_ BitVec 32)) (_keys!5259 array!6609) (_values!3417 array!6611) (_vacant!1041 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1984)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6609 (_ BitVec 32)) Bool)

(assert (=> b!166598 (= res!79184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5259 thiss!1248) (mask!8167 thiss!1248)))))

(declare-fun b!166599 () Bool)

(declare-fun e!109308 () Bool)

(declare-fun e!109304 () Bool)

(assert (=> b!166599 (= e!109308 (and e!109304 mapRes!6363))))

(declare-fun condMapEmpty!6363 () Bool)

(declare-fun mapDefault!6363 () ValueCell!1538)

(assert (=> b!166599 (= condMapEmpty!6363 (= (arr!3141 (_values!3417 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1538)) mapDefault!6363)))))

(declare-fun b!166600 () Bool)

(declare-fun tp_is_empty!3763 () Bool)

(assert (=> b!166600 (= e!109304 tp_is_empty!3763)))

(declare-fun mapNonEmpty!6363 () Bool)

(declare-fun tp!14484 () Bool)

(declare-fun e!109305 () Bool)

(assert (=> mapNonEmpty!6363 (= mapRes!6363 (and tp!14484 e!109305))))

(declare-fun mapRest!6363 () (Array (_ BitVec 32) ValueCell!1538))

(declare-fun mapValue!6363 () ValueCell!1538)

(declare-fun mapKey!6363 () (_ BitVec 32))

(assert (=> mapNonEmpty!6363 (= (arr!3141 (_values!3417 thiss!1248)) (store mapRest!6363 mapKey!6363 mapValue!6363))))

(declare-fun b!166601 () Bool)

(declare-fun e!109310 () Bool)

(assert (=> b!166601 (= e!109310 e!109312)))

(declare-fun res!79186 () Bool)

(assert (=> b!166601 (=> (not res!79186) (not e!109312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166601 (= res!79186 (validMask!0 (mask!8167 thiss!1248)))))

(declare-datatypes ((Unit!5082 0))(
  ( (Unit!5083) )
))
(declare-fun lt!83411 () Unit!5082)

(declare-fun e!109309 () Unit!5082)

(assert (=> b!166601 (= lt!83411 e!109309)))

(declare-fun c!30236 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3062 0))(
  ( (tuple2!3063 (_1!1542 (_ BitVec 64)) (_2!1542 V!4665)) )
))
(declare-datatypes ((List!2081 0))(
  ( (Nil!2078) (Cons!2077 (h!2694 tuple2!3062) (t!6875 List!2081)) )
))
(declare-datatypes ((ListLongMap!2023 0))(
  ( (ListLongMap!2024 (toList!1027 List!2081)) )
))
(declare-fun contains!1079 (ListLongMap!2023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!689 (array!6609 array!6611 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 32) Int) ListLongMap!2023)

(assert (=> b!166601 (= c!30236 (contains!1079 (getCurrentListMap!689 (_keys!5259 thiss!1248) (_values!3417 thiss!1248) (mask!8167 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3434 thiss!1248)) key!828))))

(declare-fun b!166602 () Bool)

(assert (=> b!166602 (= e!109305 tp_is_empty!3763)))

(declare-fun b!166604 () Bool)

(assert (=> b!166604 (= e!109312 false)))

(declare-fun lt!83412 () Bool)

(declare-datatypes ((List!2082 0))(
  ( (Nil!2079) (Cons!2078 (h!2695 (_ BitVec 64)) (t!6876 List!2082)) )
))
(declare-fun arrayNoDuplicates!0 (array!6609 (_ BitVec 32) List!2082) Bool)

(assert (=> b!166604 (= lt!83412 (arrayNoDuplicates!0 (_keys!5259 thiss!1248) #b00000000000000000000000000000000 Nil!2079))))

(declare-fun b!166605 () Bool)

(declare-fun e!109307 () Bool)

(assert (=> b!166605 (= e!109307 e!109310)))

(declare-fun res!79188 () Bool)

(assert (=> b!166605 (=> (not res!79188) (not e!109310))))

(declare-datatypes ((SeekEntryResult!454 0))(
  ( (MissingZero!454 (index!3984 (_ BitVec 32))) (Found!454 (index!3985 (_ BitVec 32))) (Intermediate!454 (undefined!1266 Bool) (index!3986 (_ BitVec 32)) (x!18442 (_ BitVec 32))) (Undefined!454) (MissingVacant!454 (index!3987 (_ BitVec 32))) )
))
(declare-fun lt!83408 () SeekEntryResult!454)

(get-info :version)

(assert (=> b!166605 (= res!79188 (and (not ((_ is Undefined!454) lt!83408)) (not ((_ is MissingVacant!454) lt!83408)) (not ((_ is MissingZero!454) lt!83408)) ((_ is Found!454) lt!83408)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6609 (_ BitVec 32)) SeekEntryResult!454)

(assert (=> b!166605 (= lt!83408 (seekEntryOrOpen!0 key!828 (_keys!5259 thiss!1248) (mask!8167 thiss!1248)))))

(declare-fun e!109313 () Bool)

(declare-fun array_inv!2009 (array!6609) Bool)

(declare-fun array_inv!2010 (array!6611) Bool)

(assert (=> b!166606 (= e!109313 (and tp!14483 tp_is_empty!3763 (array_inv!2009 (_keys!5259 thiss!1248)) (array_inv!2010 (_values!3417 thiss!1248)) e!109308))))

(declare-fun b!166607 () Bool)

(declare-fun res!79183 () Bool)

(assert (=> b!166607 (=> (not res!79183) (not e!109307))))

(assert (=> b!166607 (= res!79183 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166608 () Bool)

(declare-fun lt!83409 () Unit!5082)

(assert (=> b!166608 (= e!109309 lt!83409)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!93 (array!6609 array!6611 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 64) Int) Unit!5082)

(assert (=> b!166608 (= lt!83409 (lemmaInListMapThenSeekEntryOrOpenFindsIt!93 (_keys!5259 thiss!1248) (_values!3417 thiss!1248) (mask!8167 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) key!828 (defaultEntry!3434 thiss!1248)))))

(declare-fun res!79185 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166608 (= res!79185 (inRange!0 (index!3985 lt!83408) (mask!8167 thiss!1248)))))

(declare-fun e!109311 () Bool)

(assert (=> b!166608 (=> (not res!79185) (not e!109311))))

(assert (=> b!166608 e!109311))

(declare-fun res!79187 () Bool)

(assert (=> start!16660 (=> (not res!79187) (not e!109307))))

(declare-fun valid!884 (LongMapFixedSize!1984) Bool)

(assert (=> start!16660 (= res!79187 (valid!884 thiss!1248))))

(assert (=> start!16660 e!109307))

(assert (=> start!16660 e!109313))

(assert (=> start!16660 true))

(declare-fun b!166603 () Bool)

(declare-fun res!79182 () Bool)

(assert (=> b!166603 (=> (not res!79182) (not e!109312))))

(assert (=> b!166603 (= res!79182 (and (= (size!3429 (_values!3417 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8167 thiss!1248))) (= (size!3428 (_keys!5259 thiss!1248)) (size!3429 (_values!3417 thiss!1248))) (bvsge (mask!8167 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3175 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3175 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166609 () Bool)

(assert (=> b!166609 (= e!109311 (= (select (arr!3140 (_keys!5259 thiss!1248)) (index!3985 lt!83408)) key!828))))

(declare-fun b!166610 () Bool)

(declare-fun Unit!5084 () Unit!5082)

(assert (=> b!166610 (= e!109309 Unit!5084)))

(declare-fun lt!83410 () Unit!5082)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!90 (array!6609 array!6611 (_ BitVec 32) (_ BitVec 32) V!4665 V!4665 (_ BitVec 64) Int) Unit!5082)

(assert (=> b!166610 (= lt!83410 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!90 (_keys!5259 thiss!1248) (_values!3417 thiss!1248) (mask!8167 thiss!1248) (extraKeys!3175 thiss!1248) (zeroValue!3277 thiss!1248) (minValue!3277 thiss!1248) key!828 (defaultEntry!3434 thiss!1248)))))

(assert (=> b!166610 false))

(assert (= (and start!16660 res!79187) b!166607))

(assert (= (and b!166607 res!79183) b!166605))

(assert (= (and b!166605 res!79188) b!166601))

(assert (= (and b!166601 c!30236) b!166608))

(assert (= (and b!166601 (not c!30236)) b!166610))

(assert (= (and b!166608 res!79185) b!166609))

(assert (= (and b!166601 res!79186) b!166603))

(assert (= (and b!166603 res!79182) b!166598))

(assert (= (and b!166598 res!79184) b!166604))

(assert (= (and b!166599 condMapEmpty!6363) mapIsEmpty!6363))

(assert (= (and b!166599 (not condMapEmpty!6363)) mapNonEmpty!6363))

(assert (= (and mapNonEmpty!6363 ((_ is ValueCellFull!1538) mapValue!6363)) b!166602))

(assert (= (and b!166599 ((_ is ValueCellFull!1538) mapDefault!6363)) b!166600))

(assert (= b!166606 b!166599))

(assert (= start!16660 b!166606))

(declare-fun m!196145 () Bool)

(assert (=> b!166606 m!196145))

(declare-fun m!196147 () Bool)

(assert (=> b!166606 m!196147))

(declare-fun m!196149 () Bool)

(assert (=> b!166610 m!196149))

(declare-fun m!196151 () Bool)

(assert (=> b!166609 m!196151))

(declare-fun m!196153 () Bool)

(assert (=> b!166598 m!196153))

(declare-fun m!196155 () Bool)

(assert (=> b!166605 m!196155))

(declare-fun m!196157 () Bool)

(assert (=> b!166604 m!196157))

(declare-fun m!196159 () Bool)

(assert (=> mapNonEmpty!6363 m!196159))

(declare-fun m!196161 () Bool)

(assert (=> b!166601 m!196161))

(declare-fun m!196163 () Bool)

(assert (=> b!166601 m!196163))

(assert (=> b!166601 m!196163))

(declare-fun m!196165 () Bool)

(assert (=> b!166601 m!196165))

(declare-fun m!196167 () Bool)

(assert (=> b!166608 m!196167))

(declare-fun m!196169 () Bool)

(assert (=> b!166608 m!196169))

(declare-fun m!196171 () Bool)

(assert (=> start!16660 m!196171))

(check-sat (not b!166610) (not start!16660) (not b!166604) (not mapNonEmpty!6363) b_and!10389 (not b!166598) (not b!166608) (not b_next!3961) (not b!166601) tp_is_empty!3763 (not b!166606) (not b!166605))
(check-sat b_and!10389 (not b_next!3961))
