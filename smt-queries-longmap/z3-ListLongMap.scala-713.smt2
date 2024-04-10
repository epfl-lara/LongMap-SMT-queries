; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16784 () Bool)

(assert start!16784)

(declare-fun b!168973 () Bool)

(declare-fun b_free!4089 () Bool)

(declare-fun b_next!4089 () Bool)

(assert (=> b!168973 (= b_free!4089 (not b_next!4089))))

(declare-fun tp!14868 () Bool)

(declare-fun b_and!10503 () Bool)

(assert (=> b!168973 (= tp!14868 b_and!10503)))

(declare-fun b!168969 () Bool)

(declare-fun res!80428 () Bool)

(declare-fun e!111194 () Bool)

(assert (=> b!168969 (=> (not res!80428) (not e!111194))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168969 (= res!80428 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168970 () Bool)

(declare-fun e!111187 () Bool)

(assert (=> b!168970 (= e!111187 (not true))))

(declare-fun lt!84699 () Bool)

(declare-datatypes ((V!4835 0))(
  ( (V!4836 (val!1990 Int)) )
))
(declare-datatypes ((ValueCell!1602 0))(
  ( (ValueCellFull!1602 (v!3855 V!4835)) (EmptyCell!1602) )
))
(declare-datatypes ((array!6879 0))(
  ( (array!6880 (arr!3275 (Array (_ BitVec 32) (_ BitVec 64))) (size!3563 (_ BitVec 32))) )
))
(declare-datatypes ((array!6881 0))(
  ( (array!6882 (arr!3276 (Array (_ BitVec 32) ValueCell!1602)) (size!3564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2112 0))(
  ( (LongMapFixedSize!2113 (defaultEntry!3498 Int) (mask!8273 (_ BitVec 32)) (extraKeys!3239 (_ BitVec 32)) (zeroValue!3341 V!4835) (minValue!3341 V!4835) (_size!1105 (_ BitVec 32)) (_keys!5323 array!6879) (_values!3481 array!6881) (_vacant!1105 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2112)

(declare-fun lt!84704 () array!6881)

(declare-fun valid!915 (LongMapFixedSize!2112) Bool)

(assert (=> b!168970 (= lt!84699 (valid!915 (LongMapFixedSize!2113 (defaultEntry!3498 thiss!1248) (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) (_size!1105 thiss!1248) (_keys!5323 thiss!1248) lt!84704 (_vacant!1105 thiss!1248))))))

(declare-datatypes ((tuple2!3190 0))(
  ( (tuple2!3191 (_1!1606 (_ BitVec 64)) (_2!1606 V!4835)) )
))
(declare-datatypes ((List!2176 0))(
  ( (Nil!2173) (Cons!2172 (h!2789 tuple2!3190) (t!6978 List!2176)) )
))
(declare-datatypes ((ListLongMap!2145 0))(
  ( (ListLongMap!2146 (toList!1088 List!2176)) )
))
(declare-fun lt!84700 () ListLongMap!2145)

(declare-datatypes ((SeekEntryResult!515 0))(
  ( (MissingZero!515 (index!4228 (_ BitVec 32))) (Found!515 (index!4229 (_ BitVec 32))) (Intermediate!515 (undefined!1327 Bool) (index!4230 (_ BitVec 32)) (x!18671 (_ BitVec 32))) (Undefined!515) (MissingVacant!515 (index!4231 (_ BitVec 32))) )
))
(declare-fun lt!84701 () SeekEntryResult!515)

(declare-fun contains!1130 (ListLongMap!2145 (_ BitVec 64)) Bool)

(assert (=> b!168970 (contains!1130 lt!84700 (select (arr!3275 (_keys!5323 thiss!1248)) (index!4229 lt!84701)))))

(declare-datatypes ((Unit!5224 0))(
  ( (Unit!5225) )
))
(declare-fun lt!84707 () Unit!5224)

(declare-fun lemmaValidKeyInArrayIsInListMap!141 (array!6879 array!6881 (_ BitVec 32) (_ BitVec 32) V!4835 V!4835 (_ BitVec 32) Int) Unit!5224)

(assert (=> b!168970 (= lt!84707 (lemmaValidKeyInArrayIsInListMap!141 (_keys!5323 thiss!1248) lt!84704 (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) (index!4229 lt!84701) (defaultEntry!3498 thiss!1248)))))

(declare-fun lt!84705 () ListLongMap!2145)

(assert (=> b!168970 (= lt!84705 lt!84700)))

(declare-fun getCurrentListMap!746 (array!6879 array!6881 (_ BitVec 32) (_ BitVec 32) V!4835 V!4835 (_ BitVec 32) Int) ListLongMap!2145)

(assert (=> b!168970 (= lt!84700 (getCurrentListMap!746 (_keys!5323 thiss!1248) lt!84704 (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3498 thiss!1248)))))

(declare-fun lt!84703 () ListLongMap!2145)

(declare-fun v!309 () V!4835)

(declare-fun +!240 (ListLongMap!2145 tuple2!3190) ListLongMap!2145)

(assert (=> b!168970 (= lt!84705 (+!240 lt!84703 (tuple2!3191 key!828 v!309)))))

(assert (=> b!168970 (= lt!84704 (array!6882 (store (arr!3276 (_values!3481 thiss!1248)) (index!4229 lt!84701) (ValueCellFull!1602 v!309)) (size!3564 (_values!3481 thiss!1248))))))

(declare-fun lt!84708 () Unit!5224)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!95 (array!6879 array!6881 (_ BitVec 32) (_ BitVec 32) V!4835 V!4835 (_ BitVec 32) (_ BitVec 64) V!4835 Int) Unit!5224)

(assert (=> b!168970 (= lt!84708 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!95 (_keys!5323 thiss!1248) (_values!3481 thiss!1248) (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) (index!4229 lt!84701) key!828 v!309 (defaultEntry!3498 thiss!1248)))))

(declare-fun lt!84706 () Unit!5224)

(declare-fun e!111193 () Unit!5224)

(assert (=> b!168970 (= lt!84706 e!111193)))

(declare-fun c!30415 () Bool)

(assert (=> b!168970 (= c!30415 (contains!1130 lt!84703 key!828))))

(assert (=> b!168970 (= lt!84703 (getCurrentListMap!746 (_keys!5323 thiss!1248) (_values!3481 thiss!1248) (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3498 thiss!1248)))))

(declare-fun b!168971 () Bool)

(declare-fun e!111191 () Bool)

(declare-fun tp_is_empty!3891 () Bool)

(assert (=> b!168971 (= e!111191 tp_is_empty!3891)))

(declare-fun b!168972 () Bool)

(declare-fun Unit!5226 () Unit!5224)

(assert (=> b!168972 (= e!111193 Unit!5226)))

(declare-fun lt!84709 () Unit!5224)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!135 (array!6879 array!6881 (_ BitVec 32) (_ BitVec 32) V!4835 V!4835 (_ BitVec 64) Int) Unit!5224)

(assert (=> b!168972 (= lt!84709 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!135 (_keys!5323 thiss!1248) (_values!3481 thiss!1248) (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) key!828 (defaultEntry!3498 thiss!1248)))))

(assert (=> b!168972 false))

(declare-fun e!111188 () Bool)

(declare-fun e!111186 () Bool)

(declare-fun array_inv!2107 (array!6879) Bool)

(declare-fun array_inv!2108 (array!6881) Bool)

(assert (=> b!168973 (= e!111186 (and tp!14868 tp_is_empty!3891 (array_inv!2107 (_keys!5323 thiss!1248)) (array_inv!2108 (_values!3481 thiss!1248)) e!111188))))

(declare-fun b!168974 () Bool)

(declare-fun e!111192 () Bool)

(assert (=> b!168974 (= e!111192 tp_is_empty!3891)))

(declare-fun b!168976 () Bool)

(declare-fun mapRes!6555 () Bool)

(assert (=> b!168976 (= e!111188 (and e!111191 mapRes!6555))))

(declare-fun condMapEmpty!6555 () Bool)

(declare-fun mapDefault!6555 () ValueCell!1602)

(assert (=> b!168976 (= condMapEmpty!6555 (= (arr!3276 (_values!3481 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1602)) mapDefault!6555)))))

(declare-fun b!168977 () Bool)

(declare-fun e!111189 () Bool)

(assert (=> b!168977 (= e!111189 (= (select (arr!3275 (_keys!5323 thiss!1248)) (index!4229 lt!84701)) key!828))))

(declare-fun b!168978 () Bool)

(assert (=> b!168978 (= e!111194 e!111187)))

(declare-fun res!80427 () Bool)

(assert (=> b!168978 (=> (not res!80427) (not e!111187))))

(get-info :version)

(assert (=> b!168978 (= res!80427 (and (not ((_ is Undefined!515) lt!84701)) (not ((_ is MissingVacant!515) lt!84701)) (not ((_ is MissingZero!515) lt!84701)) ((_ is Found!515) lt!84701)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6879 (_ BitVec 32)) SeekEntryResult!515)

(assert (=> b!168978 (= lt!84701 (seekEntryOrOpen!0 key!828 (_keys!5323 thiss!1248) (mask!8273 thiss!1248)))))

(declare-fun res!80430 () Bool)

(assert (=> start!16784 (=> (not res!80430) (not e!111194))))

(assert (=> start!16784 (= res!80430 (valid!915 thiss!1248))))

(assert (=> start!16784 e!111194))

(assert (=> start!16784 e!111186))

(assert (=> start!16784 true))

(assert (=> start!16784 tp_is_empty!3891))

(declare-fun b!168975 () Bool)

(declare-fun lt!84702 () Unit!5224)

(assert (=> b!168975 (= e!111193 lt!84702)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!133 (array!6879 array!6881 (_ BitVec 32) (_ BitVec 32) V!4835 V!4835 (_ BitVec 64) Int) Unit!5224)

(assert (=> b!168975 (= lt!84702 (lemmaInListMapThenSeekEntryOrOpenFindsIt!133 (_keys!5323 thiss!1248) (_values!3481 thiss!1248) (mask!8273 thiss!1248) (extraKeys!3239 thiss!1248) (zeroValue!3341 thiss!1248) (minValue!3341 thiss!1248) key!828 (defaultEntry!3498 thiss!1248)))))

(declare-fun res!80429 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168975 (= res!80429 (inRange!0 (index!4229 lt!84701) (mask!8273 thiss!1248)))))

(assert (=> b!168975 (=> (not res!80429) (not e!111189))))

(assert (=> b!168975 e!111189))

(declare-fun mapIsEmpty!6555 () Bool)

(assert (=> mapIsEmpty!6555 mapRes!6555))

(declare-fun mapNonEmpty!6555 () Bool)

(declare-fun tp!14867 () Bool)

(assert (=> mapNonEmpty!6555 (= mapRes!6555 (and tp!14867 e!111192))))

(declare-fun mapKey!6555 () (_ BitVec 32))

(declare-fun mapValue!6555 () ValueCell!1602)

(declare-fun mapRest!6555 () (Array (_ BitVec 32) ValueCell!1602))

(assert (=> mapNonEmpty!6555 (= (arr!3276 (_values!3481 thiss!1248)) (store mapRest!6555 mapKey!6555 mapValue!6555))))

(assert (= (and start!16784 res!80430) b!168969))

(assert (= (and b!168969 res!80428) b!168978))

(assert (= (and b!168978 res!80427) b!168970))

(assert (= (and b!168970 c!30415) b!168975))

(assert (= (and b!168970 (not c!30415)) b!168972))

(assert (= (and b!168975 res!80429) b!168977))

(assert (= (and b!168976 condMapEmpty!6555) mapIsEmpty!6555))

(assert (= (and b!168976 (not condMapEmpty!6555)) mapNonEmpty!6555))

(assert (= (and mapNonEmpty!6555 ((_ is ValueCellFull!1602) mapValue!6555)) b!168974))

(assert (= (and b!168976 ((_ is ValueCellFull!1602) mapDefault!6555)) b!168971))

(assert (= b!168973 b!168976))

(assert (= start!16784 b!168973))

(declare-fun m!198099 () Bool)

(assert (=> b!168970 m!198099))

(declare-fun m!198101 () Bool)

(assert (=> b!168970 m!198101))

(declare-fun m!198103 () Bool)

(assert (=> b!168970 m!198103))

(declare-fun m!198105 () Bool)

(assert (=> b!168970 m!198105))

(declare-fun m!198107 () Bool)

(assert (=> b!168970 m!198107))

(declare-fun m!198109 () Bool)

(assert (=> b!168970 m!198109))

(assert (=> b!168970 m!198105))

(declare-fun m!198111 () Bool)

(assert (=> b!168970 m!198111))

(declare-fun m!198113 () Bool)

(assert (=> b!168970 m!198113))

(declare-fun m!198115 () Bool)

(assert (=> b!168970 m!198115))

(declare-fun m!198117 () Bool)

(assert (=> b!168970 m!198117))

(declare-fun m!198119 () Bool)

(assert (=> b!168975 m!198119))

(declare-fun m!198121 () Bool)

(assert (=> b!168975 m!198121))

(declare-fun m!198123 () Bool)

(assert (=> b!168972 m!198123))

(declare-fun m!198125 () Bool)

(assert (=> start!16784 m!198125))

(declare-fun m!198127 () Bool)

(assert (=> b!168973 m!198127))

(declare-fun m!198129 () Bool)

(assert (=> b!168973 m!198129))

(declare-fun m!198131 () Bool)

(assert (=> b!168978 m!198131))

(assert (=> b!168977 m!198105))

(declare-fun m!198133 () Bool)

(assert (=> mapNonEmpty!6555 m!198133))

(check-sat (not b!168973) (not b_next!4089) (not start!16784) (not mapNonEmpty!6555) (not b!168975) (not b!168978) (not b!168972) b_and!10503 tp_is_empty!3891 (not b!168970))
(check-sat b_and!10503 (not b_next!4089))
