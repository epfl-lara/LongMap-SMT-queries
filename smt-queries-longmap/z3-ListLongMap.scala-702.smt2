; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16720 () Bool)

(assert start!16720)

(declare-fun b!167586 () Bool)

(declare-fun b_free!4021 () Bool)

(declare-fun b_next!4021 () Bool)

(assert (=> b!167586 (= b_free!4021 (not b_next!4021))))

(declare-fun tp!14664 () Bool)

(declare-fun b_and!10409 () Bool)

(assert (=> b!167586 (= tp!14664 b_and!10409)))

(declare-fun b!167574 () Bool)

(declare-fun e!110083 () Bool)

(declare-fun e!110080 () Bool)

(assert (=> b!167574 (= e!110083 e!110080)))

(declare-fun res!79696 () Bool)

(assert (=> b!167574 (=> (not res!79696) (not e!110080))))

(declare-datatypes ((SeekEntryResult!494 0))(
  ( (MissingZero!494 (index!4144 (_ BitVec 32))) (Found!494 (index!4145 (_ BitVec 32))) (Intermediate!494 (undefined!1306 Bool) (index!4146 (_ BitVec 32)) (x!18561 (_ BitVec 32))) (Undefined!494) (MissingVacant!494 (index!4147 (_ BitVec 32))) )
))
(declare-fun lt!83661 () SeekEntryResult!494)

(get-info :version)

(assert (=> b!167574 (= res!79696 (and (not ((_ is Undefined!494) lt!83661)) (not ((_ is MissingVacant!494) lt!83661)) (not ((_ is MissingZero!494) lt!83661)) ((_ is Found!494) lt!83661)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4745 0))(
  ( (V!4746 (val!1956 Int)) )
))
(declare-datatypes ((ValueCell!1568 0))(
  ( (ValueCellFull!1568 (v!3815 V!4745)) (EmptyCell!1568) )
))
(declare-datatypes ((array!6723 0))(
  ( (array!6724 (arr!3196 (Array (_ BitVec 32) (_ BitVec 64))) (size!3485 (_ BitVec 32))) )
))
(declare-datatypes ((array!6725 0))(
  ( (array!6726 (arr!3197 (Array (_ BitVec 32) ValueCell!1568)) (size!3486 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2044 0))(
  ( (LongMapFixedSize!2045 (defaultEntry!3464 Int) (mask!8216 (_ BitVec 32)) (extraKeys!3205 (_ BitVec 32)) (zeroValue!3307 V!4745) (minValue!3307 V!4745) (_size!1071 (_ BitVec 32)) (_keys!5288 array!6723) (_values!3447 array!6725) (_vacant!1071 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2044)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6723 (_ BitVec 32)) SeekEntryResult!494)

(assert (=> b!167574 (= lt!83661 (seekEntryOrOpen!0 key!828 (_keys!5288 thiss!1248) (mask!8216 thiss!1248)))))

(declare-fun res!79701 () Bool)

(assert (=> start!16720 (=> (not res!79701) (not e!110083))))

(declare-fun valid!901 (LongMapFixedSize!2044) Bool)

(assert (=> start!16720 (= res!79701 (valid!901 thiss!1248))))

(assert (=> start!16720 e!110083))

(declare-fun e!110081 () Bool)

(assert (=> start!16720 e!110081))

(assert (=> start!16720 true))

(declare-fun tp_is_empty!3823 () Bool)

(assert (=> start!16720 tp_is_empty!3823))

(declare-fun e!110088 () Bool)

(declare-fun b!167575 () Bool)

(assert (=> b!167575 (= e!110088 (= (select (arr!3196 (_keys!5288 thiss!1248)) (index!4145 lt!83661)) key!828))))

(declare-fun b!167576 () Bool)

(declare-fun res!79702 () Bool)

(declare-fun e!110086 () Bool)

(assert (=> b!167576 (=> res!79702 e!110086)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6723 (_ BitVec 32)) Bool)

(assert (=> b!167576 (= res!79702 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5288 thiss!1248) (mask!8216 thiss!1248))))))

(declare-fun b!167577 () Bool)

(declare-fun res!79699 () Bool)

(assert (=> b!167577 (=> (not res!79699) (not e!110083))))

(assert (=> b!167577 (= res!79699 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167578 () Bool)

(declare-datatypes ((Unit!5113 0))(
  ( (Unit!5114) )
))
(declare-fun e!110082 () Unit!5113)

(declare-fun Unit!5115 () Unit!5113)

(assert (=> b!167578 (= e!110082 Unit!5115)))

(declare-fun lt!83662 () Unit!5113)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!107 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 64) Int) Unit!5113)

(assert (=> b!167578 (= lt!83662 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!107 (_keys!5288 thiss!1248) (_values!3447 thiss!1248) (mask!8216 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) key!828 (defaultEntry!3464 thiss!1248)))))

(assert (=> b!167578 false))

(declare-fun b!167579 () Bool)

(declare-fun e!110085 () Bool)

(assert (=> b!167579 (= e!110085 tp_is_empty!3823)))

(declare-fun b!167580 () Bool)

(declare-fun lt!83660 () Unit!5113)

(assert (=> b!167580 (= e!110082 lt!83660)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!107 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 64) Int) Unit!5113)

(assert (=> b!167580 (= lt!83660 (lemmaInListMapThenSeekEntryOrOpenFindsIt!107 (_keys!5288 thiss!1248) (_values!3447 thiss!1248) (mask!8216 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) key!828 (defaultEntry!3464 thiss!1248)))))

(declare-fun res!79700 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167580 (= res!79700 (inRange!0 (index!4145 lt!83661) (mask!8216 thiss!1248)))))

(assert (=> b!167580 (=> (not res!79700) (not e!110088))))

(assert (=> b!167580 e!110088))

(declare-fun b!167581 () Bool)

(declare-fun e!110087 () Bool)

(declare-fun e!110084 () Bool)

(declare-fun mapRes!6453 () Bool)

(assert (=> b!167581 (= e!110087 (and e!110084 mapRes!6453))))

(declare-fun condMapEmpty!6453 () Bool)

(declare-fun mapDefault!6453 () ValueCell!1568)

(assert (=> b!167581 (= condMapEmpty!6453 (= (arr!3197 (_values!3447 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1568)) mapDefault!6453)))))

(declare-fun mapIsEmpty!6453 () Bool)

(assert (=> mapIsEmpty!6453 mapRes!6453))

(declare-fun mapNonEmpty!6453 () Bool)

(declare-fun tp!14663 () Bool)

(assert (=> mapNonEmpty!6453 (= mapRes!6453 (and tp!14663 e!110085))))

(declare-fun mapKey!6453 () (_ BitVec 32))

(declare-fun mapValue!6453 () ValueCell!1568)

(declare-fun mapRest!6453 () (Array (_ BitVec 32) ValueCell!1568))

(assert (=> mapNonEmpty!6453 (= (arr!3197 (_values!3447 thiss!1248)) (store mapRest!6453 mapKey!6453 mapValue!6453))))

(declare-fun b!167582 () Bool)

(assert (=> b!167582 (= e!110086 true)))

(declare-fun lt!83663 () Bool)

(declare-datatypes ((List!2140 0))(
  ( (Nil!2137) (Cons!2136 (h!2753 (_ BitVec 64)) (t!6933 List!2140)) )
))
(declare-fun arrayNoDuplicates!0 (array!6723 (_ BitVec 32) List!2140) Bool)

(assert (=> b!167582 (= lt!83663 (arrayNoDuplicates!0 (_keys!5288 thiss!1248) #b00000000000000000000000000000000 Nil!2137))))

(declare-fun b!167583 () Bool)

(declare-fun res!79697 () Bool)

(assert (=> b!167583 (=> res!79697 e!110086)))

(assert (=> b!167583 (= res!79697 (or (not (= (size!3486 (_values!3447 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8216 thiss!1248)))) (not (= (size!3485 (_keys!5288 thiss!1248)) (size!3486 (_values!3447 thiss!1248)))) (bvslt (mask!8216 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3205 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3205 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167584 () Bool)

(assert (=> b!167584 (= e!110084 tp_is_empty!3823)))

(declare-fun b!167585 () Bool)

(assert (=> b!167585 (= e!110080 (not e!110086))))

(declare-fun res!79698 () Bool)

(assert (=> b!167585 (=> res!79698 e!110086)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167585 (= res!79698 (not (validMask!0 (mask!8216 thiss!1248))))))

(declare-fun v!309 () V!4745)

(declare-datatypes ((tuple2!3136 0))(
  ( (tuple2!3137 (_1!1579 (_ BitVec 64)) (_2!1579 V!4745)) )
))
(declare-datatypes ((List!2141 0))(
  ( (Nil!2138) (Cons!2137 (h!2754 tuple2!3136) (t!6934 List!2141)) )
))
(declare-datatypes ((ListLongMap!2079 0))(
  ( (ListLongMap!2080 (toList!1055 List!2141)) )
))
(declare-fun lt!83659 () ListLongMap!2079)

(declare-fun +!206 (ListLongMap!2079 tuple2!3136) ListLongMap!2079)

(declare-fun getCurrentListMap!697 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 32) Int) ListLongMap!2079)

(assert (=> b!167585 (= (+!206 lt!83659 (tuple2!3137 key!828 v!309)) (getCurrentListMap!697 (_keys!5288 thiss!1248) (array!6726 (store (arr!3197 (_values!3447 thiss!1248)) (index!4145 lt!83661) (ValueCellFull!1568 v!309)) (size!3486 (_values!3447 thiss!1248))) (mask!8216 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3464 thiss!1248)))))

(declare-fun lt!83664 () Unit!5113)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!78 (array!6723 array!6725 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 32) (_ BitVec 64) V!4745 Int) Unit!5113)

(assert (=> b!167585 (= lt!83664 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!78 (_keys!5288 thiss!1248) (_values!3447 thiss!1248) (mask!8216 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) (index!4145 lt!83661) key!828 v!309 (defaultEntry!3464 thiss!1248)))))

(declare-fun lt!83658 () Unit!5113)

(assert (=> b!167585 (= lt!83658 e!110082)))

(declare-fun c!30287 () Bool)

(declare-fun contains!1100 (ListLongMap!2079 (_ BitVec 64)) Bool)

(assert (=> b!167585 (= c!30287 (contains!1100 lt!83659 key!828))))

(assert (=> b!167585 (= lt!83659 (getCurrentListMap!697 (_keys!5288 thiss!1248) (_values!3447 thiss!1248) (mask!8216 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3464 thiss!1248)))))

(declare-fun array_inv!2059 (array!6723) Bool)

(declare-fun array_inv!2060 (array!6725) Bool)

(assert (=> b!167586 (= e!110081 (and tp!14664 tp_is_empty!3823 (array_inv!2059 (_keys!5288 thiss!1248)) (array_inv!2060 (_values!3447 thiss!1248)) e!110087))))

(assert (= (and start!16720 res!79701) b!167577))

(assert (= (and b!167577 res!79699) b!167574))

(assert (= (and b!167574 res!79696) b!167585))

(assert (= (and b!167585 c!30287) b!167580))

(assert (= (and b!167585 (not c!30287)) b!167578))

(assert (= (and b!167580 res!79700) b!167575))

(assert (= (and b!167585 (not res!79698)) b!167583))

(assert (= (and b!167583 (not res!79697)) b!167576))

(assert (= (and b!167576 (not res!79702)) b!167582))

(assert (= (and b!167581 condMapEmpty!6453) mapIsEmpty!6453))

(assert (= (and b!167581 (not condMapEmpty!6453)) mapNonEmpty!6453))

(assert (= (and mapNonEmpty!6453 ((_ is ValueCellFull!1568) mapValue!6453)) b!167579))

(assert (= (and b!167581 ((_ is ValueCellFull!1568) mapDefault!6453)) b!167584))

(assert (= b!167586 b!167581))

(assert (= start!16720 b!167586))

(declare-fun m!196231 () Bool)

(assert (=> b!167576 m!196231))

(declare-fun m!196233 () Bool)

(assert (=> b!167582 m!196233))

(declare-fun m!196235 () Bool)

(assert (=> b!167578 m!196235))

(declare-fun m!196237 () Bool)

(assert (=> b!167580 m!196237))

(declare-fun m!196239 () Bool)

(assert (=> b!167580 m!196239))

(declare-fun m!196241 () Bool)

(assert (=> b!167585 m!196241))

(declare-fun m!196243 () Bool)

(assert (=> b!167585 m!196243))

(declare-fun m!196245 () Bool)

(assert (=> b!167585 m!196245))

(declare-fun m!196247 () Bool)

(assert (=> b!167585 m!196247))

(declare-fun m!196249 () Bool)

(assert (=> b!167585 m!196249))

(declare-fun m!196251 () Bool)

(assert (=> b!167585 m!196251))

(declare-fun m!196253 () Bool)

(assert (=> b!167585 m!196253))

(declare-fun m!196255 () Bool)

(assert (=> start!16720 m!196255))

(declare-fun m!196257 () Bool)

(assert (=> mapNonEmpty!6453 m!196257))

(declare-fun m!196259 () Bool)

(assert (=> b!167575 m!196259))

(declare-fun m!196261 () Bool)

(assert (=> b!167586 m!196261))

(declare-fun m!196263 () Bool)

(assert (=> b!167586 m!196263))

(declare-fun m!196265 () Bool)

(assert (=> b!167574 m!196265))

(check-sat (not b!167585) (not b!167578) (not b!167586) (not b!167574) (not start!16720) tp_is_empty!3823 (not b!167580) (not b!167582) (not b!167576) b_and!10409 (not mapNonEmpty!6453) (not b_next!4021))
(check-sat b_and!10409 (not b_next!4021))
