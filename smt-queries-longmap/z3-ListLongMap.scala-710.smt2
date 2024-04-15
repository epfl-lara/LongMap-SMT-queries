; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16768 () Bool)

(assert start!16768)

(declare-fun b!168504 () Bool)

(declare-fun b_free!4069 () Bool)

(declare-fun b_next!4069 () Bool)

(assert (=> b!168504 (= b_free!4069 (not b_next!4069))))

(declare-fun tp!14807 () Bool)

(declare-fun b_and!10457 () Bool)

(assert (=> b!168504 (= tp!14807 b_and!10457)))

(declare-fun e!110798 () Bool)

(declare-fun tp_is_empty!3871 () Bool)

(declare-datatypes ((V!4809 0))(
  ( (V!4810 (val!1980 Int)) )
))
(declare-datatypes ((ValueCell!1592 0))(
  ( (ValueCellFull!1592 (v!3839 V!4809)) (EmptyCell!1592) )
))
(declare-datatypes ((array!6819 0))(
  ( (array!6820 (arr!3244 (Array (_ BitVec 32) (_ BitVec 64))) (size!3533 (_ BitVec 32))) )
))
(declare-datatypes ((array!6821 0))(
  ( (array!6822 (arr!3245 (Array (_ BitVec 32) ValueCell!1592)) (size!3534 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2092 0))(
  ( (LongMapFixedSize!2093 (defaultEntry!3488 Int) (mask!8256 (_ BitVec 32)) (extraKeys!3229 (_ BitVec 32)) (zeroValue!3331 V!4809) (minValue!3331 V!4809) (_size!1095 (_ BitVec 32)) (_keys!5312 array!6819) (_values!3471 array!6821) (_vacant!1095 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2092)

(declare-fun e!110800 () Bool)

(declare-fun array_inv!2085 (array!6819) Bool)

(declare-fun array_inv!2086 (array!6821) Bool)

(assert (=> b!168504 (= e!110798 (and tp!14807 tp_is_empty!3871 (array_inv!2085 (_keys!5312 thiss!1248)) (array_inv!2086 (_values!3471 thiss!1248)) e!110800))))

(declare-datatypes ((SeekEntryResult!518 0))(
  ( (MissingZero!518 (index!4240 (_ BitVec 32))) (Found!518 (index!4241 (_ BitVec 32))) (Intermediate!518 (undefined!1330 Bool) (index!4242 (_ BitVec 32)) (x!18649 (_ BitVec 32))) (Undefined!518) (MissingVacant!518 (index!4243 (_ BitVec 32))) )
))
(declare-fun lt!84180 () SeekEntryResult!518)

(declare-fun b!168505 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!110804 () Bool)

(assert (=> b!168505 (= e!110804 (= (select (arr!3244 (_keys!5312 thiss!1248)) (index!4241 lt!84180)) key!828))))

(declare-fun b!168506 () Bool)

(declare-fun e!110805 () Bool)

(assert (=> b!168506 (= e!110805 tp_is_empty!3871)))

(declare-fun b!168507 () Bool)

(declare-fun e!110797 () Bool)

(assert (=> b!168507 (= e!110797 tp_is_empty!3871)))

(declare-fun b!168508 () Bool)

(declare-fun res!80195 () Bool)

(declare-fun e!110802 () Bool)

(assert (=> b!168508 (=> (not res!80195) (not e!110802))))

(assert (=> b!168508 (= res!80195 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168509 () Bool)

(declare-fun e!110801 () Bool)

(assert (=> b!168509 (= e!110802 e!110801)))

(declare-fun res!80196 () Bool)

(assert (=> b!168509 (=> (not res!80196) (not e!110801))))

(get-info :version)

(assert (=> b!168509 (= res!80196 (and (not ((_ is Undefined!518) lt!84180)) (not ((_ is MissingVacant!518) lt!84180)) (not ((_ is MissingZero!518) lt!84180)) ((_ is Found!518) lt!84180)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6819 (_ BitVec 32)) SeekEntryResult!518)

(assert (=> b!168509 (= lt!84180 (seekEntryOrOpen!0 key!828 (_keys!5312 thiss!1248) (mask!8256 thiss!1248)))))

(declare-fun b!168511 () Bool)

(assert (=> b!168511 (= e!110801 (not true))))

(declare-fun lt!84179 () Bool)

(declare-fun lt!84176 () array!6821)

(declare-fun valid!920 (LongMapFixedSize!2092) Bool)

(assert (=> b!168511 (= lt!84179 (valid!920 (LongMapFixedSize!2093 (defaultEntry!3488 thiss!1248) (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) (_size!1095 thiss!1248) (_keys!5312 thiss!1248) lt!84176 (_vacant!1095 thiss!1248))))))

(declare-datatypes ((tuple2!3180 0))(
  ( (tuple2!3181 (_1!1601 (_ BitVec 64)) (_2!1601 V!4809)) )
))
(declare-datatypes ((List!2180 0))(
  ( (Nil!2177) (Cons!2176 (h!2793 tuple2!3180) (t!6973 List!2180)) )
))
(declare-datatypes ((ListLongMap!2123 0))(
  ( (ListLongMap!2124 (toList!1077 List!2180)) )
))
(declare-fun lt!84171 () ListLongMap!2123)

(declare-fun contains!1122 (ListLongMap!2123 (_ BitVec 64)) Bool)

(assert (=> b!168511 (contains!1122 lt!84171 (select (arr!3244 (_keys!5312 thiss!1248)) (index!4241 lt!84180)))))

(declare-datatypes ((Unit!5176 0))(
  ( (Unit!5177) )
))
(declare-fun lt!84175 () Unit!5176)

(declare-fun lemmaValidKeyInArrayIsInListMap!131 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 32) Int) Unit!5176)

(assert (=> b!168511 (= lt!84175 (lemmaValidKeyInArrayIsInListMap!131 (_keys!5312 thiss!1248) lt!84176 (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) (index!4241 lt!84180) (defaultEntry!3488 thiss!1248)))))

(declare-fun lt!84178 () ListLongMap!2123)

(assert (=> b!168511 (= lt!84178 lt!84171)))

(declare-fun getCurrentListMap!719 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 32) Int) ListLongMap!2123)

(assert (=> b!168511 (= lt!84171 (getCurrentListMap!719 (_keys!5312 thiss!1248) lt!84176 (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3488 thiss!1248)))))

(declare-fun lt!84172 () ListLongMap!2123)

(declare-fun v!309 () V!4809)

(declare-fun +!228 (ListLongMap!2123 tuple2!3180) ListLongMap!2123)

(assert (=> b!168511 (= lt!84178 (+!228 lt!84172 (tuple2!3181 key!828 v!309)))))

(assert (=> b!168511 (= lt!84176 (array!6822 (store (arr!3245 (_values!3471 thiss!1248)) (index!4241 lt!84180) (ValueCellFull!1592 v!309)) (size!3534 (_values!3471 thiss!1248))))))

(declare-fun lt!84177 () Unit!5176)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!100 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 32) (_ BitVec 64) V!4809 Int) Unit!5176)

(assert (=> b!168511 (= lt!84177 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!100 (_keys!5312 thiss!1248) (_values!3471 thiss!1248) (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) (index!4241 lt!84180) key!828 v!309 (defaultEntry!3488 thiss!1248)))))

(declare-fun lt!84174 () Unit!5176)

(declare-fun e!110799 () Unit!5176)

(assert (=> b!168511 (= lt!84174 e!110799)))

(declare-fun c!30359 () Bool)

(assert (=> b!168511 (= c!30359 (contains!1122 lt!84172 key!828))))

(assert (=> b!168511 (= lt!84172 (getCurrentListMap!719 (_keys!5312 thiss!1248) (_values!3471 thiss!1248) (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3488 thiss!1248)))))

(declare-fun mapIsEmpty!6525 () Bool)

(declare-fun mapRes!6525 () Bool)

(assert (=> mapIsEmpty!6525 mapRes!6525))

(declare-fun b!168512 () Bool)

(declare-fun lt!84170 () Unit!5176)

(assert (=> b!168512 (= e!110799 lt!84170)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!126 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 64) Int) Unit!5176)

(assert (=> b!168512 (= lt!84170 (lemmaInListMapThenSeekEntryOrOpenFindsIt!126 (_keys!5312 thiss!1248) (_values!3471 thiss!1248) (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) key!828 (defaultEntry!3488 thiss!1248)))))

(declare-fun res!80194 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168512 (= res!80194 (inRange!0 (index!4241 lt!84180) (mask!8256 thiss!1248)))))

(assert (=> b!168512 (=> (not res!80194) (not e!110804))))

(assert (=> b!168512 e!110804))

(declare-fun mapNonEmpty!6525 () Bool)

(declare-fun tp!14808 () Bool)

(assert (=> mapNonEmpty!6525 (= mapRes!6525 (and tp!14808 e!110805))))

(declare-fun mapRest!6525 () (Array (_ BitVec 32) ValueCell!1592))

(declare-fun mapValue!6525 () ValueCell!1592)

(declare-fun mapKey!6525 () (_ BitVec 32))

(assert (=> mapNonEmpty!6525 (= (arr!3245 (_values!3471 thiss!1248)) (store mapRest!6525 mapKey!6525 mapValue!6525))))

(declare-fun b!168513 () Bool)

(assert (=> b!168513 (= e!110800 (and e!110797 mapRes!6525))))

(declare-fun condMapEmpty!6525 () Bool)

(declare-fun mapDefault!6525 () ValueCell!1592)

(assert (=> b!168513 (= condMapEmpty!6525 (= (arr!3245 (_values!3471 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1592)) mapDefault!6525)))))

(declare-fun res!80197 () Bool)

(assert (=> start!16768 (=> (not res!80197) (not e!110802))))

(assert (=> start!16768 (= res!80197 (valid!920 thiss!1248))))

(assert (=> start!16768 e!110802))

(assert (=> start!16768 e!110798))

(assert (=> start!16768 true))

(assert (=> start!16768 tp_is_empty!3871))

(declare-fun b!168510 () Bool)

(declare-fun Unit!5178 () Unit!5176)

(assert (=> b!168510 (= e!110799 Unit!5178)))

(declare-fun lt!84173 () Unit!5176)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!124 (array!6819 array!6821 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 64) Int) Unit!5176)

(assert (=> b!168510 (= lt!84173 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!124 (_keys!5312 thiss!1248) (_values!3471 thiss!1248) (mask!8256 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) key!828 (defaultEntry!3488 thiss!1248)))))

(assert (=> b!168510 false))

(assert (= (and start!16768 res!80197) b!168508))

(assert (= (and b!168508 res!80195) b!168509))

(assert (= (and b!168509 res!80196) b!168511))

(assert (= (and b!168511 c!30359) b!168512))

(assert (= (and b!168511 (not c!30359)) b!168510))

(assert (= (and b!168512 res!80194) b!168505))

(assert (= (and b!168513 condMapEmpty!6525) mapIsEmpty!6525))

(assert (= (and b!168513 (not condMapEmpty!6525)) mapNonEmpty!6525))

(assert (= (and mapNonEmpty!6525 ((_ is ValueCellFull!1592) mapValue!6525)) b!168506))

(assert (= (and b!168513 ((_ is ValueCellFull!1592) mapDefault!6525)) b!168507))

(assert (= b!168504 b!168513))

(assert (= start!16768 b!168504))

(declare-fun m!197095 () Bool)

(assert (=> b!168512 m!197095))

(declare-fun m!197097 () Bool)

(assert (=> b!168512 m!197097))

(declare-fun m!197099 () Bool)

(assert (=> b!168511 m!197099))

(declare-fun m!197101 () Bool)

(assert (=> b!168511 m!197101))

(declare-fun m!197103 () Bool)

(assert (=> b!168511 m!197103))

(declare-fun m!197105 () Bool)

(assert (=> b!168511 m!197105))

(declare-fun m!197107 () Bool)

(assert (=> b!168511 m!197107))

(declare-fun m!197109 () Bool)

(assert (=> b!168511 m!197109))

(assert (=> b!168511 m!197099))

(declare-fun m!197111 () Bool)

(assert (=> b!168511 m!197111))

(declare-fun m!197113 () Bool)

(assert (=> b!168511 m!197113))

(declare-fun m!197115 () Bool)

(assert (=> b!168511 m!197115))

(declare-fun m!197117 () Bool)

(assert (=> b!168511 m!197117))

(declare-fun m!197119 () Bool)

(assert (=> b!168510 m!197119))

(declare-fun m!197121 () Bool)

(assert (=> mapNonEmpty!6525 m!197121))

(assert (=> b!168505 m!197099))

(declare-fun m!197123 () Bool)

(assert (=> b!168504 m!197123))

(declare-fun m!197125 () Bool)

(assert (=> b!168504 m!197125))

(declare-fun m!197127 () Bool)

(assert (=> b!168509 m!197127))

(declare-fun m!197129 () Bool)

(assert (=> start!16768 m!197129))

(check-sat b_and!10457 (not b!168511) (not mapNonEmpty!6525) (not start!16768) (not b!168504) (not b!168509) (not b!168510) (not b_next!4069) (not b!168512) tp_is_empty!3871)
(check-sat b_and!10457 (not b_next!4069))
