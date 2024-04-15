; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16780 () Bool)

(assert start!16780)

(declare-fun b!168702 () Bool)

(declare-fun b_free!4081 () Bool)

(declare-fun b_next!4081 () Bool)

(assert (=> b!168702 (= b_free!4081 (not b_next!4081))))

(declare-fun tp!14844 () Bool)

(declare-fun b_and!10469 () Bool)

(assert (=> b!168702 (= tp!14844 b_and!10469)))

(declare-fun b!168696 () Bool)

(declare-fun e!110970 () Bool)

(declare-fun e!110972 () Bool)

(assert (=> b!168696 (= e!110970 e!110972)))

(declare-fun res!80280 () Bool)

(assert (=> b!168696 (=> (not res!80280) (not e!110972))))

(declare-datatypes ((SeekEntryResult!524 0))(
  ( (MissingZero!524 (index!4264 (_ BitVec 32))) (Found!524 (index!4265 (_ BitVec 32))) (Intermediate!524 (undefined!1336 Bool) (index!4266 (_ BitVec 32)) (x!18671 (_ BitVec 32))) (Undefined!524) (MissingVacant!524 (index!4267 (_ BitVec 32))) )
))
(declare-fun lt!84387 () SeekEntryResult!524)

(get-info :version)

(assert (=> b!168696 (= res!80280 (and (not ((_ is Undefined!524) lt!84387)) (not ((_ is MissingVacant!524) lt!84387)) (not ((_ is MissingZero!524) lt!84387)) ((_ is Found!524) lt!84387)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4825 0))(
  ( (V!4826 (val!1986 Int)) )
))
(declare-datatypes ((ValueCell!1598 0))(
  ( (ValueCellFull!1598 (v!3845 V!4825)) (EmptyCell!1598) )
))
(declare-datatypes ((array!6843 0))(
  ( (array!6844 (arr!3256 (Array (_ BitVec 32) (_ BitVec 64))) (size!3545 (_ BitVec 32))) )
))
(declare-datatypes ((array!6845 0))(
  ( (array!6846 (arr!3257 (Array (_ BitVec 32) ValueCell!1598)) (size!3546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2104 0))(
  ( (LongMapFixedSize!2105 (defaultEntry!3494 Int) (mask!8266 (_ BitVec 32)) (extraKeys!3235 (_ BitVec 32)) (zeroValue!3337 V!4825) (minValue!3337 V!4825) (_size!1101 (_ BitVec 32)) (_keys!5318 array!6843) (_values!3477 array!6845) (_vacant!1101 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2104)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6843 (_ BitVec 32)) SeekEntryResult!524)

(assert (=> b!168696 (= lt!84387 (seekEntryOrOpen!0 key!828 (_keys!5318 thiss!1248) (mask!8266 thiss!1248)))))

(declare-fun b!168697 () Bool)

(declare-fun res!80277 () Bool)

(assert (=> b!168697 (=> (not res!80277) (not e!110970))))

(assert (=> b!168697 (= res!80277 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168698 () Bool)

(declare-fun e!110979 () Bool)

(assert (=> b!168698 (= e!110979 (= (select (arr!3256 (_keys!5318 thiss!1248)) (index!4265 lt!84387)) key!828))))

(declare-fun b!168699 () Bool)

(declare-fun e!110976 () Bool)

(assert (=> b!168699 (= e!110976 true)))

(declare-fun lt!84383 () Bool)

(declare-fun lt!84379 () LongMapFixedSize!2104)

(declare-datatypes ((tuple2!3188 0))(
  ( (tuple2!3189 (_1!1605 (_ BitVec 64)) (_2!1605 V!4825)) )
))
(declare-datatypes ((List!2184 0))(
  ( (Nil!2181) (Cons!2180 (h!2797 tuple2!3188) (t!6977 List!2184)) )
))
(declare-datatypes ((ListLongMap!2131 0))(
  ( (ListLongMap!2132 (toList!1081 List!2184)) )
))
(declare-fun contains!1126 (ListLongMap!2131 (_ BitVec 64)) Bool)

(declare-fun map!1789 (LongMapFixedSize!2104) ListLongMap!2131)

(assert (=> b!168699 (= lt!84383 (contains!1126 (map!1789 lt!84379) key!828))))

(declare-fun b!168700 () Bool)

(declare-fun e!110978 () Bool)

(declare-fun e!110973 () Bool)

(declare-fun mapRes!6543 () Bool)

(assert (=> b!168700 (= e!110978 (and e!110973 mapRes!6543))))

(declare-fun condMapEmpty!6543 () Bool)

(declare-fun mapDefault!6543 () ValueCell!1598)

(assert (=> b!168700 (= condMapEmpty!6543 (= (arr!3257 (_values!3477 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1598)) mapDefault!6543)))))

(declare-fun b!168701 () Bool)

(assert (=> b!168701 (= e!110972 (not e!110976))))

(declare-fun res!80278 () Bool)

(assert (=> b!168701 (=> res!80278 e!110976)))

(declare-fun valid!925 (LongMapFixedSize!2104) Bool)

(assert (=> b!168701 (= res!80278 (not (valid!925 lt!84379)))))

(declare-fun lt!84390 () ListLongMap!2131)

(assert (=> b!168701 (contains!1126 lt!84390 (select (arr!3256 (_keys!5318 thiss!1248)) (index!4265 lt!84387)))))

(declare-fun lt!84384 () array!6845)

(declare-datatypes ((Unit!5194 0))(
  ( (Unit!5195) )
))
(declare-fun lt!84386 () Unit!5194)

(declare-fun lemmaValidKeyInArrayIsInListMap!135 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) Int) Unit!5194)

(assert (=> b!168701 (= lt!84386 (lemmaValidKeyInArrayIsInListMap!135 (_keys!5318 thiss!1248) lt!84384 (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (index!4265 lt!84387) (defaultEntry!3494 thiss!1248)))))

(assert (=> b!168701 (= lt!84379 (LongMapFixedSize!2105 (defaultEntry!3494 thiss!1248) (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (_size!1101 thiss!1248) (_keys!5318 thiss!1248) lt!84384 (_vacant!1101 thiss!1248)))))

(declare-fun lt!84380 () ListLongMap!2131)

(assert (=> b!168701 (= lt!84380 lt!84390)))

(declare-fun getCurrentListMap!723 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) Int) ListLongMap!2131)

(assert (=> b!168701 (= lt!84390 (getCurrentListMap!723 (_keys!5318 thiss!1248) lt!84384 (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3494 thiss!1248)))))

(declare-fun lt!84381 () ListLongMap!2131)

(declare-fun v!309 () V!4825)

(declare-fun +!232 (ListLongMap!2131 tuple2!3188) ListLongMap!2131)

(assert (=> b!168701 (= lt!84380 (+!232 lt!84381 (tuple2!3189 key!828 v!309)))))

(assert (=> b!168701 (= lt!84384 (array!6846 (store (arr!3257 (_values!3477 thiss!1248)) (index!4265 lt!84387) (ValueCellFull!1598 v!309)) (size!3546 (_values!3477 thiss!1248))))))

(declare-fun lt!84388 () Unit!5194)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 32) (_ BitVec 64) V!4825 Int) Unit!5194)

(assert (=> b!168701 (= lt!84388 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!104 (_keys!5318 thiss!1248) (_values!3477 thiss!1248) (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) (index!4265 lt!84387) key!828 v!309 (defaultEntry!3494 thiss!1248)))))

(declare-fun lt!84385 () Unit!5194)

(declare-fun e!110974 () Unit!5194)

(assert (=> b!168701 (= lt!84385 e!110974)))

(declare-fun c!30377 () Bool)

(assert (=> b!168701 (= c!30377 (contains!1126 lt!84381 key!828))))

(assert (=> b!168701 (= lt!84381 (getCurrentListMap!723 (_keys!5318 thiss!1248) (_values!3477 thiss!1248) (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3494 thiss!1248)))))

(declare-fun mapIsEmpty!6543 () Bool)

(assert (=> mapIsEmpty!6543 mapRes!6543))

(declare-fun mapNonEmpty!6543 () Bool)

(declare-fun tp!14843 () Bool)

(declare-fun e!110971 () Bool)

(assert (=> mapNonEmpty!6543 (= mapRes!6543 (and tp!14843 e!110971))))

(declare-fun mapValue!6543 () ValueCell!1598)

(declare-fun mapRest!6543 () (Array (_ BitVec 32) ValueCell!1598))

(declare-fun mapKey!6543 () (_ BitVec 32))

(assert (=> mapNonEmpty!6543 (= (arr!3257 (_values!3477 thiss!1248)) (store mapRest!6543 mapKey!6543 mapValue!6543))))

(declare-fun b!168695 () Bool)

(declare-fun lt!84389 () Unit!5194)

(assert (=> b!168695 (= e!110974 lt!84389)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!130 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 64) Int) Unit!5194)

(assert (=> b!168695 (= lt!84389 (lemmaInListMapThenSeekEntryOrOpenFindsIt!130 (_keys!5318 thiss!1248) (_values!3477 thiss!1248) (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) key!828 (defaultEntry!3494 thiss!1248)))))

(declare-fun res!80279 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168695 (= res!80279 (inRange!0 (index!4265 lt!84387) (mask!8266 thiss!1248)))))

(assert (=> b!168695 (=> (not res!80279) (not e!110979))))

(assert (=> b!168695 e!110979))

(declare-fun res!80281 () Bool)

(assert (=> start!16780 (=> (not res!80281) (not e!110970))))

(assert (=> start!16780 (= res!80281 (valid!925 thiss!1248))))

(assert (=> start!16780 e!110970))

(declare-fun e!110977 () Bool)

(assert (=> start!16780 e!110977))

(assert (=> start!16780 true))

(declare-fun tp_is_empty!3883 () Bool)

(assert (=> start!16780 tp_is_empty!3883))

(declare-fun array_inv!2091 (array!6843) Bool)

(declare-fun array_inv!2092 (array!6845) Bool)

(assert (=> b!168702 (= e!110977 (and tp!14844 tp_is_empty!3883 (array_inv!2091 (_keys!5318 thiss!1248)) (array_inv!2092 (_values!3477 thiss!1248)) e!110978))))

(declare-fun b!168703 () Bool)

(declare-fun Unit!5196 () Unit!5194)

(assert (=> b!168703 (= e!110974 Unit!5196)))

(declare-fun lt!84382 () Unit!5194)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!130 (array!6843 array!6845 (_ BitVec 32) (_ BitVec 32) V!4825 V!4825 (_ BitVec 64) Int) Unit!5194)

(assert (=> b!168703 (= lt!84382 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!130 (_keys!5318 thiss!1248) (_values!3477 thiss!1248) (mask!8266 thiss!1248) (extraKeys!3235 thiss!1248) (zeroValue!3337 thiss!1248) (minValue!3337 thiss!1248) key!828 (defaultEntry!3494 thiss!1248)))))

(assert (=> b!168703 false))

(declare-fun b!168704 () Bool)

(assert (=> b!168704 (= e!110973 tp_is_empty!3883)))

(declare-fun b!168705 () Bool)

(assert (=> b!168705 (= e!110971 tp_is_empty!3883)))

(assert (= (and start!16780 res!80281) b!168697))

(assert (= (and b!168697 res!80277) b!168696))

(assert (= (and b!168696 res!80280) b!168701))

(assert (= (and b!168701 c!30377) b!168695))

(assert (= (and b!168701 (not c!30377)) b!168703))

(assert (= (and b!168695 res!80279) b!168698))

(assert (= (and b!168701 (not res!80278)) b!168699))

(assert (= (and b!168700 condMapEmpty!6543) mapIsEmpty!6543))

(assert (= (and b!168700 (not condMapEmpty!6543)) mapNonEmpty!6543))

(assert (= (and mapNonEmpty!6543 ((_ is ValueCellFull!1598) mapValue!6543)) b!168705))

(assert (= (and b!168700 ((_ is ValueCellFull!1598) mapDefault!6543)) b!168704))

(assert (= b!168702 b!168700))

(assert (= start!16780 b!168702))

(declare-fun m!197323 () Bool)

(assert (=> start!16780 m!197323))

(declare-fun m!197325 () Bool)

(assert (=> b!168703 m!197325))

(declare-fun m!197327 () Bool)

(assert (=> mapNonEmpty!6543 m!197327))

(declare-fun m!197329 () Bool)

(assert (=> b!168699 m!197329))

(assert (=> b!168699 m!197329))

(declare-fun m!197331 () Bool)

(assert (=> b!168699 m!197331))

(declare-fun m!197333 () Bool)

(assert (=> b!168696 m!197333))

(declare-fun m!197335 () Bool)

(assert (=> b!168702 m!197335))

(declare-fun m!197337 () Bool)

(assert (=> b!168702 m!197337))

(declare-fun m!197339 () Bool)

(assert (=> b!168701 m!197339))

(declare-fun m!197341 () Bool)

(assert (=> b!168701 m!197341))

(declare-fun m!197343 () Bool)

(assert (=> b!168701 m!197343))

(declare-fun m!197345 () Bool)

(assert (=> b!168701 m!197345))

(declare-fun m!197347 () Bool)

(assert (=> b!168701 m!197347))

(declare-fun m!197349 () Bool)

(assert (=> b!168701 m!197349))

(assert (=> b!168701 m!197345))

(declare-fun m!197351 () Bool)

(assert (=> b!168701 m!197351))

(declare-fun m!197353 () Bool)

(assert (=> b!168701 m!197353))

(declare-fun m!197355 () Bool)

(assert (=> b!168701 m!197355))

(declare-fun m!197357 () Bool)

(assert (=> b!168701 m!197357))

(assert (=> b!168698 m!197345))

(declare-fun m!197359 () Bool)

(assert (=> b!168695 m!197359))

(declare-fun m!197361 () Bool)

(assert (=> b!168695 m!197361))

(check-sat tp_is_empty!3883 (not b!168696) (not b!168702) b_and!10469 (not b!168695) (not start!16780) (not b!168701) (not mapNonEmpty!6543) (not b_next!4081) (not b!168703) (not b!168699))
(check-sat b_and!10469 (not b_next!4081))
