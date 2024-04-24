; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16750 () Bool)

(assert start!16750)

(declare-fun b!168364 () Bool)

(declare-fun b_free!4051 () Bool)

(declare-fun b_next!4051 () Bool)

(assert (=> b!168364 (= b_free!4051 (not b_next!4051))))

(declare-fun tp!14753 () Bool)

(declare-fun b_and!10479 () Bool)

(assert (=> b!168364 (= tp!14753 b_and!10479)))

(declare-fun b!168353 () Bool)

(declare-fun res!80132 () Bool)

(declare-fun e!110660 () Bool)

(assert (=> b!168353 (=> res!80132 e!110660)))

(declare-datatypes ((V!4785 0))(
  ( (V!4786 (val!1971 Int)) )
))
(declare-datatypes ((ValueCell!1583 0))(
  ( (ValueCellFull!1583 (v!3837 V!4785)) (EmptyCell!1583) )
))
(declare-datatypes ((array!6789 0))(
  ( (array!6790 (arr!3230 (Array (_ BitVec 32) (_ BitVec 64))) (size!3518 (_ BitVec 32))) )
))
(declare-datatypes ((array!6791 0))(
  ( (array!6792 (arr!3231 (Array (_ BitVec 32) ValueCell!1583)) (size!3519 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2074 0))(
  ( (LongMapFixedSize!2075 (defaultEntry!3479 Int) (mask!8242 (_ BitVec 32)) (extraKeys!3220 (_ BitVec 32)) (zeroValue!3322 V!4785) (minValue!3322 V!4785) (_size!1086 (_ BitVec 32)) (_keys!5304 array!6789) (_values!3462 array!6791) (_vacant!1086 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2074)

(assert (=> b!168353 (= res!80132 (or (not (= (size!3519 (_values!3462 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8242 thiss!1248)))) (not (= (size!3518 (_keys!5304 thiss!1248)) (size!3519 (_values!3462 thiss!1248)))) (bvslt (mask!8242 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3220 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3220 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168354 () Bool)

(declare-fun e!110661 () Bool)

(declare-fun e!110655 () Bool)

(assert (=> b!168354 (= e!110661 e!110655)))

(declare-fun res!80129 () Bool)

(assert (=> b!168354 (=> (not res!80129) (not e!110655))))

(declare-datatypes ((SeekEntryResult!491 0))(
  ( (MissingZero!491 (index!4132 (_ BitVec 32))) (Found!491 (index!4133 (_ BitVec 32))) (Intermediate!491 (undefined!1303 Bool) (index!4134 (_ BitVec 32)) (x!18599 (_ BitVec 32))) (Undefined!491) (MissingVacant!491 (index!4135 (_ BitVec 32))) )
))
(declare-fun lt!84216 () SeekEntryResult!491)

(get-info :version)

(assert (=> b!168354 (= res!80129 (and (not ((_ is Undefined!491) lt!84216)) (not ((_ is MissingVacant!491) lt!84216)) (not ((_ is MissingZero!491) lt!84216)) ((_ is Found!491) lt!84216)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6789 (_ BitVec 32)) SeekEntryResult!491)

(assert (=> b!168354 (= lt!84216 (seekEntryOrOpen!0 key!828 (_keys!5304 thiss!1248) (mask!8242 thiss!1248)))))

(declare-fun b!168355 () Bool)

(declare-datatypes ((Unit!5181 0))(
  ( (Unit!5182) )
))
(declare-fun e!110659 () Unit!5181)

(declare-fun Unit!5183 () Unit!5181)

(assert (=> b!168355 (= e!110659 Unit!5183)))

(declare-fun lt!84214 () Unit!5181)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!113 (array!6789 array!6791 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 64) Int) Unit!5181)

(assert (=> b!168355 (= lt!84214 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!113 (_keys!5304 thiss!1248) (_values!3462 thiss!1248) (mask!8242 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) key!828 (defaultEntry!3479 thiss!1248)))))

(assert (=> b!168355 false))

(declare-fun b!168357 () Bool)

(declare-fun res!80128 () Bool)

(assert (=> b!168357 (=> res!80128 e!110660)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6789 (_ BitVec 32)) Bool)

(assert (=> b!168357 (= res!80128 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5304 thiss!1248) (mask!8242 thiss!1248))))))

(declare-fun b!168358 () Bool)

(assert (=> b!168358 (= e!110655 (not e!110660))))

(declare-fun res!80130 () Bool)

(assert (=> b!168358 (=> res!80130 e!110660)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168358 (= res!80130 (not (validMask!0 (mask!8242 thiss!1248))))))

(declare-datatypes ((tuple2!3126 0))(
  ( (tuple2!3127 (_1!1574 (_ BitVec 64)) (_2!1574 V!4785)) )
))
(declare-datatypes ((List!2140 0))(
  ( (Nil!2137) (Cons!2136 (h!2753 tuple2!3126) (t!6934 List!2140)) )
))
(declare-datatypes ((ListLongMap!2087 0))(
  ( (ListLongMap!2088 (toList!1059 List!2140)) )
))
(declare-fun lt!84219 () ListLongMap!2087)

(declare-fun v!309 () V!4785)

(declare-fun +!227 (ListLongMap!2087 tuple2!3126) ListLongMap!2087)

(declare-fun getCurrentListMap!721 (array!6789 array!6791 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 32) Int) ListLongMap!2087)

(assert (=> b!168358 (= (+!227 lt!84219 (tuple2!3127 key!828 v!309)) (getCurrentListMap!721 (_keys!5304 thiss!1248) (array!6792 (store (arr!3231 (_values!3462 thiss!1248)) (index!4133 lt!84216) (ValueCellFull!1583 v!309)) (size!3519 (_values!3462 thiss!1248))) (mask!8242 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3479 thiss!1248)))))

(declare-fun lt!84215 () Unit!5181)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!85 (array!6789 array!6791 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 32) (_ BitVec 64) V!4785 Int) Unit!5181)

(assert (=> b!168358 (= lt!84215 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!85 (_keys!5304 thiss!1248) (_values!3462 thiss!1248) (mask!8242 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) (index!4133 lt!84216) key!828 v!309 (defaultEntry!3479 thiss!1248)))))

(declare-fun lt!84217 () Unit!5181)

(assert (=> b!168358 (= lt!84217 e!110659)))

(declare-fun c!30371 () Bool)

(declare-fun contains!1111 (ListLongMap!2087 (_ BitVec 64)) Bool)

(assert (=> b!168358 (= c!30371 (contains!1111 lt!84219 key!828))))

(assert (=> b!168358 (= lt!84219 (getCurrentListMap!721 (_keys!5304 thiss!1248) (_values!3462 thiss!1248) (mask!8242 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3479 thiss!1248)))))

(declare-fun b!168359 () Bool)

(declare-fun res!80131 () Bool)

(assert (=> b!168359 (=> (not res!80131) (not e!110661))))

(assert (=> b!168359 (= res!80131 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168360 () Bool)

(assert (=> b!168360 (= e!110660 true)))

(declare-fun lt!84213 () Bool)

(declare-datatypes ((List!2141 0))(
  ( (Nil!2138) (Cons!2137 (h!2754 (_ BitVec 64)) (t!6935 List!2141)) )
))
(declare-fun arrayNoDuplicates!0 (array!6789 (_ BitVec 32) List!2141) Bool)

(assert (=> b!168360 (= lt!84213 (arrayNoDuplicates!0 (_keys!5304 thiss!1248) #b00000000000000000000000000000000 Nil!2138))))

(declare-fun b!168361 () Bool)

(declare-fun lt!84218 () Unit!5181)

(assert (=> b!168361 (= e!110659 lt!84218)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!121 (array!6789 array!6791 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 64) Int) Unit!5181)

(assert (=> b!168361 (= lt!84218 (lemmaInListMapThenSeekEntryOrOpenFindsIt!121 (_keys!5304 thiss!1248) (_values!3462 thiss!1248) (mask!8242 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) key!828 (defaultEntry!3479 thiss!1248)))))

(declare-fun res!80133 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168361 (= res!80133 (inRange!0 (index!4133 lt!84216) (mask!8242 thiss!1248)))))

(declare-fun e!110662 () Bool)

(assert (=> b!168361 (=> (not res!80133) (not e!110662))))

(assert (=> b!168361 e!110662))

(declare-fun b!168356 () Bool)

(declare-fun e!110657 () Bool)

(declare-fun tp_is_empty!3853 () Bool)

(assert (=> b!168356 (= e!110657 tp_is_empty!3853)))

(declare-fun res!80127 () Bool)

(assert (=> start!16750 (=> (not res!80127) (not e!110661))))

(declare-fun valid!911 (LongMapFixedSize!2074) Bool)

(assert (=> start!16750 (= res!80127 (valid!911 thiss!1248))))

(assert (=> start!16750 e!110661))

(declare-fun e!110656 () Bool)

(assert (=> start!16750 e!110656))

(assert (=> start!16750 true))

(assert (=> start!16750 tp_is_empty!3853))

(declare-fun b!168362 () Bool)

(declare-fun e!110658 () Bool)

(assert (=> b!168362 (= e!110658 tp_is_empty!3853)))

(declare-fun b!168363 () Bool)

(declare-fun e!110654 () Bool)

(declare-fun mapRes!6498 () Bool)

(assert (=> b!168363 (= e!110654 (and e!110658 mapRes!6498))))

(declare-fun condMapEmpty!6498 () Bool)

(declare-fun mapDefault!6498 () ValueCell!1583)

(assert (=> b!168363 (= condMapEmpty!6498 (= (arr!3231 (_values!3462 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1583)) mapDefault!6498)))))

(declare-fun array_inv!2069 (array!6789) Bool)

(declare-fun array_inv!2070 (array!6791) Bool)

(assert (=> b!168364 (= e!110656 (and tp!14753 tp_is_empty!3853 (array_inv!2069 (_keys!5304 thiss!1248)) (array_inv!2070 (_values!3462 thiss!1248)) e!110654))))

(declare-fun mapNonEmpty!6498 () Bool)

(declare-fun tp!14754 () Bool)

(assert (=> mapNonEmpty!6498 (= mapRes!6498 (and tp!14754 e!110657))))

(declare-fun mapValue!6498 () ValueCell!1583)

(declare-fun mapRest!6498 () (Array (_ BitVec 32) ValueCell!1583))

(declare-fun mapKey!6498 () (_ BitVec 32))

(assert (=> mapNonEmpty!6498 (= (arr!3231 (_values!3462 thiss!1248)) (store mapRest!6498 mapKey!6498 mapValue!6498))))

(declare-fun b!168365 () Bool)

(assert (=> b!168365 (= e!110662 (= (select (arr!3230 (_keys!5304 thiss!1248)) (index!4133 lt!84216)) key!828))))

(declare-fun mapIsEmpty!6498 () Bool)

(assert (=> mapIsEmpty!6498 mapRes!6498))

(assert (= (and start!16750 res!80127) b!168359))

(assert (= (and b!168359 res!80131) b!168354))

(assert (= (and b!168354 res!80129) b!168358))

(assert (= (and b!168358 c!30371) b!168361))

(assert (= (and b!168358 (not c!30371)) b!168355))

(assert (= (and b!168361 res!80133) b!168365))

(assert (= (and b!168358 (not res!80130)) b!168353))

(assert (= (and b!168353 (not res!80132)) b!168357))

(assert (= (and b!168357 (not res!80128)) b!168360))

(assert (= (and b!168363 condMapEmpty!6498) mapIsEmpty!6498))

(assert (= (and b!168363 (not condMapEmpty!6498)) mapNonEmpty!6498))

(assert (= (and mapNonEmpty!6498 ((_ is ValueCellFull!1583) mapValue!6498)) b!168356))

(assert (= (and b!168363 ((_ is ValueCellFull!1583) mapDefault!6498)) b!168362))

(assert (= b!168364 b!168363))

(assert (= start!16750 b!168364))

(declare-fun m!197573 () Bool)

(assert (=> b!168354 m!197573))

(declare-fun m!197575 () Bool)

(assert (=> b!168355 m!197575))

(declare-fun m!197577 () Bool)

(assert (=> b!168360 m!197577))

(declare-fun m!197579 () Bool)

(assert (=> b!168357 m!197579))

(declare-fun m!197581 () Bool)

(assert (=> b!168364 m!197581))

(declare-fun m!197583 () Bool)

(assert (=> b!168364 m!197583))

(declare-fun m!197585 () Bool)

(assert (=> b!168365 m!197585))

(declare-fun m!197587 () Bool)

(assert (=> b!168361 m!197587))

(declare-fun m!197589 () Bool)

(assert (=> b!168361 m!197589))

(declare-fun m!197591 () Bool)

(assert (=> mapNonEmpty!6498 m!197591))

(declare-fun m!197593 () Bool)

(assert (=> start!16750 m!197593))

(declare-fun m!197595 () Bool)

(assert (=> b!168358 m!197595))

(declare-fun m!197597 () Bool)

(assert (=> b!168358 m!197597))

(declare-fun m!197599 () Bool)

(assert (=> b!168358 m!197599))

(declare-fun m!197601 () Bool)

(assert (=> b!168358 m!197601))

(declare-fun m!197603 () Bool)

(assert (=> b!168358 m!197603))

(declare-fun m!197605 () Bool)

(assert (=> b!168358 m!197605))

(declare-fun m!197607 () Bool)

(assert (=> b!168358 m!197607))

(check-sat (not b_next!4051) (not b!168357) (not b!168360) (not mapNonEmpty!6498) (not b!168358) (not b!168355) (not start!16750) (not b!168361) b_and!10479 (not b!168364) tp_is_empty!3853 (not b!168354))
(check-sat b_and!10479 (not b_next!4051))
