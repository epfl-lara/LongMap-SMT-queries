; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16708 () Bool)

(assert start!16708)

(declare-fun b!167348 () Bool)

(declare-fun b_free!4009 () Bool)

(declare-fun b_next!4009 () Bool)

(assert (=> b!167348 (= b_free!4009 (not b_next!4009))))

(declare-fun tp!14627 () Bool)

(declare-fun b_and!10397 () Bool)

(assert (=> b!167348 (= tp!14627 b_and!10397)))

(declare-fun b!167340 () Bool)

(declare-datatypes ((Unit!5095 0))(
  ( (Unit!5096) )
))
(declare-fun e!109900 () Unit!5095)

(declare-fun Unit!5097 () Unit!5095)

(assert (=> b!167340 (= e!109900 Unit!5097)))

(declare-fun lt!83532 () Unit!5095)

(declare-datatypes ((V!4729 0))(
  ( (V!4730 (val!1950 Int)) )
))
(declare-datatypes ((ValueCell!1562 0))(
  ( (ValueCellFull!1562 (v!3809 V!4729)) (EmptyCell!1562) )
))
(declare-datatypes ((array!6699 0))(
  ( (array!6700 (arr!3184 (Array (_ BitVec 32) (_ BitVec 64))) (size!3473 (_ BitVec 32))) )
))
(declare-datatypes ((array!6701 0))(
  ( (array!6702 (arr!3185 (Array (_ BitVec 32) ValueCell!1562)) (size!3474 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2032 0))(
  ( (LongMapFixedSize!2033 (defaultEntry!3458 Int) (mask!8206 (_ BitVec 32)) (extraKeys!3199 (_ BitVec 32)) (zeroValue!3301 V!4729) (minValue!3301 V!4729) (_size!1065 (_ BitVec 32)) (_keys!5282 array!6699) (_values!3441 array!6701) (_vacant!1065 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2032)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!101 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 64) Int) Unit!5095)

(assert (=> b!167340 (= lt!83532 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!101 (_keys!5282 thiss!1248) (_values!3441 thiss!1248) (mask!8206 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) key!828 (defaultEntry!3458 thiss!1248)))))

(assert (=> b!167340 false))

(declare-fun mapNonEmpty!6435 () Bool)

(declare-fun mapRes!6435 () Bool)

(declare-fun tp!14628 () Bool)

(declare-fun e!109902 () Bool)

(assert (=> mapNonEmpty!6435 (= mapRes!6435 (and tp!14628 e!109902))))

(declare-fun mapValue!6435 () ValueCell!1562)

(declare-fun mapKey!6435 () (_ BitVec 32))

(declare-fun mapRest!6435 () (Array (_ BitVec 32) ValueCell!1562))

(assert (=> mapNonEmpty!6435 (= (arr!3185 (_values!3441 thiss!1248)) (store mapRest!6435 mapKey!6435 mapValue!6435))))

(declare-fun b!167341 () Bool)

(declare-fun e!109907 () Bool)

(declare-fun e!109906 () Bool)

(assert (=> b!167341 (= e!109907 (and e!109906 mapRes!6435))))

(declare-fun condMapEmpty!6435 () Bool)

(declare-fun mapDefault!6435 () ValueCell!1562)

(assert (=> b!167341 (= condMapEmpty!6435 (= (arr!3185 (_values!3441 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1562)) mapDefault!6435)))))

(declare-fun b!167342 () Bool)

(declare-fun tp_is_empty!3811 () Bool)

(assert (=> b!167342 (= e!109906 tp_is_empty!3811)))

(declare-fun b!167343 () Bool)

(declare-fun e!109905 () Bool)

(declare-fun e!109903 () Bool)

(assert (=> b!167343 (= e!109905 (not e!109903))))

(declare-fun res!79574 () Bool)

(assert (=> b!167343 (=> res!79574 e!109903)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167343 (= res!79574 (not (validMask!0 (mask!8206 thiss!1248))))))

(declare-datatypes ((tuple2!3124 0))(
  ( (tuple2!3125 (_1!1573 (_ BitVec 64)) (_2!1573 V!4729)) )
))
(declare-datatypes ((List!2130 0))(
  ( (Nil!2127) (Cons!2126 (h!2743 tuple2!3124) (t!6923 List!2130)) )
))
(declare-datatypes ((ListLongMap!2067 0))(
  ( (ListLongMap!2068 (toList!1049 List!2130)) )
))
(declare-fun lt!83535 () ListLongMap!2067)

(declare-fun v!309 () V!4729)

(declare-datatypes ((SeekEntryResult!488 0))(
  ( (MissingZero!488 (index!4120 (_ BitVec 32))) (Found!488 (index!4121 (_ BitVec 32))) (Intermediate!488 (undefined!1300 Bool) (index!4122 (_ BitVec 32)) (x!18539 (_ BitVec 32))) (Undefined!488) (MissingVacant!488 (index!4123 (_ BitVec 32))) )
))
(declare-fun lt!83537 () SeekEntryResult!488)

(declare-fun +!200 (ListLongMap!2067 tuple2!3124) ListLongMap!2067)

(declare-fun getCurrentListMap!691 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 32) Int) ListLongMap!2067)

(assert (=> b!167343 (= (+!200 lt!83535 (tuple2!3125 key!828 v!309)) (getCurrentListMap!691 (_keys!5282 thiss!1248) (array!6702 (store (arr!3185 (_values!3441 thiss!1248)) (index!4121 lt!83537) (ValueCellFull!1562 v!309)) (size!3474 (_values!3441 thiss!1248))) (mask!8206 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3458 thiss!1248)))))

(declare-fun lt!83536 () Unit!5095)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!72 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 32) (_ BitVec 64) V!4729 Int) Unit!5095)

(assert (=> b!167343 (= lt!83536 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!72 (_keys!5282 thiss!1248) (_values!3441 thiss!1248) (mask!8206 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) (index!4121 lt!83537) key!828 v!309 (defaultEntry!3458 thiss!1248)))))

(declare-fun lt!83533 () Unit!5095)

(assert (=> b!167343 (= lt!83533 e!109900)))

(declare-fun c!30269 () Bool)

(declare-fun contains!1094 (ListLongMap!2067 (_ BitVec 64)) Bool)

(assert (=> b!167343 (= c!30269 (contains!1094 lt!83535 key!828))))

(assert (=> b!167343 (= lt!83535 (getCurrentListMap!691 (_keys!5282 thiss!1248) (_values!3441 thiss!1248) (mask!8206 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3458 thiss!1248)))))

(declare-fun mapIsEmpty!6435 () Bool)

(assert (=> mapIsEmpty!6435 mapRes!6435))

(declare-fun e!109904 () Bool)

(declare-fun b!167344 () Bool)

(assert (=> b!167344 (= e!109904 (= (select (arr!3184 (_keys!5282 thiss!1248)) (index!4121 lt!83537)) key!828))))

(declare-fun b!167345 () Bool)

(assert (=> b!167345 (= e!109903 true)))

(declare-fun lt!83534 () Bool)

(declare-datatypes ((List!2131 0))(
  ( (Nil!2128) (Cons!2127 (h!2744 (_ BitVec 64)) (t!6924 List!2131)) )
))
(declare-fun arrayNoDuplicates!0 (array!6699 (_ BitVec 32) List!2131) Bool)

(assert (=> b!167345 (= lt!83534 (arrayNoDuplicates!0 (_keys!5282 thiss!1248) #b00000000000000000000000000000000 Nil!2128))))

(declare-fun b!167346 () Bool)

(declare-fun res!79573 () Bool)

(declare-fun e!109899 () Bool)

(assert (=> b!167346 (=> (not res!79573) (not e!109899))))

(assert (=> b!167346 (= res!79573 (not (= key!828 (bvneg key!828))))))

(declare-fun e!109901 () Bool)

(declare-fun array_inv!2049 (array!6699) Bool)

(declare-fun array_inv!2050 (array!6701) Bool)

(assert (=> b!167348 (= e!109901 (and tp!14627 tp_is_empty!3811 (array_inv!2049 (_keys!5282 thiss!1248)) (array_inv!2050 (_values!3441 thiss!1248)) e!109907))))

(declare-fun b!167349 () Bool)

(assert (=> b!167349 (= e!109899 e!109905)))

(declare-fun res!79572 () Bool)

(assert (=> b!167349 (=> (not res!79572) (not e!109905))))

(get-info :version)

(assert (=> b!167349 (= res!79572 (and (not ((_ is Undefined!488) lt!83537)) (not ((_ is MissingVacant!488) lt!83537)) (not ((_ is MissingZero!488) lt!83537)) ((_ is Found!488) lt!83537)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6699 (_ BitVec 32)) SeekEntryResult!488)

(assert (=> b!167349 (= lt!83537 (seekEntryOrOpen!0 key!828 (_keys!5282 thiss!1248) (mask!8206 thiss!1248)))))

(declare-fun b!167350 () Bool)

(declare-fun lt!83538 () Unit!5095)

(assert (=> b!167350 (= e!109900 lt!83538)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!102 (array!6699 array!6701 (_ BitVec 32) (_ BitVec 32) V!4729 V!4729 (_ BitVec 64) Int) Unit!5095)

(assert (=> b!167350 (= lt!83538 (lemmaInListMapThenSeekEntryOrOpenFindsIt!102 (_keys!5282 thiss!1248) (_values!3441 thiss!1248) (mask!8206 thiss!1248) (extraKeys!3199 thiss!1248) (zeroValue!3301 thiss!1248) (minValue!3301 thiss!1248) key!828 (defaultEntry!3458 thiss!1248)))))

(declare-fun res!79570 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167350 (= res!79570 (inRange!0 (index!4121 lt!83537) (mask!8206 thiss!1248)))))

(assert (=> b!167350 (=> (not res!79570) (not e!109904))))

(assert (=> b!167350 e!109904))

(declare-fun b!167351 () Bool)

(assert (=> b!167351 (= e!109902 tp_is_empty!3811)))

(declare-fun b!167352 () Bool)

(declare-fun res!79571 () Bool)

(assert (=> b!167352 (=> res!79571 e!109903)))

(assert (=> b!167352 (= res!79571 (or (not (= (size!3474 (_values!3441 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8206 thiss!1248)))) (not (= (size!3473 (_keys!5282 thiss!1248)) (size!3474 (_values!3441 thiss!1248)))) (bvslt (mask!8206 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3199 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3199 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!79575 () Bool)

(assert (=> start!16708 (=> (not res!79575) (not e!109899))))

(declare-fun valid!895 (LongMapFixedSize!2032) Bool)

(assert (=> start!16708 (= res!79575 (valid!895 thiss!1248))))

(assert (=> start!16708 e!109899))

(assert (=> start!16708 e!109901))

(assert (=> start!16708 true))

(assert (=> start!16708 tp_is_empty!3811))

(declare-fun b!167347 () Bool)

(declare-fun res!79576 () Bool)

(assert (=> b!167347 (=> res!79576 e!109903)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6699 (_ BitVec 32)) Bool)

(assert (=> b!167347 (= res!79576 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5282 thiss!1248) (mask!8206 thiss!1248))))))

(assert (= (and start!16708 res!79575) b!167346))

(assert (= (and b!167346 res!79573) b!167349))

(assert (= (and b!167349 res!79572) b!167343))

(assert (= (and b!167343 c!30269) b!167350))

(assert (= (and b!167343 (not c!30269)) b!167340))

(assert (= (and b!167350 res!79570) b!167344))

(assert (= (and b!167343 (not res!79574)) b!167352))

(assert (= (and b!167352 (not res!79571)) b!167347))

(assert (= (and b!167347 (not res!79576)) b!167345))

(assert (= (and b!167341 condMapEmpty!6435) mapIsEmpty!6435))

(assert (= (and b!167341 (not condMapEmpty!6435)) mapNonEmpty!6435))

(assert (= (and mapNonEmpty!6435 ((_ is ValueCellFull!1562) mapValue!6435)) b!167351))

(assert (= (and b!167341 ((_ is ValueCellFull!1562) mapDefault!6435)) b!167342))

(assert (= b!167348 b!167341))

(assert (= start!16708 b!167348))

(declare-fun m!196015 () Bool)

(assert (=> b!167340 m!196015))

(declare-fun m!196017 () Bool)

(assert (=> b!167343 m!196017))

(declare-fun m!196019 () Bool)

(assert (=> b!167343 m!196019))

(declare-fun m!196021 () Bool)

(assert (=> b!167343 m!196021))

(declare-fun m!196023 () Bool)

(assert (=> b!167343 m!196023))

(declare-fun m!196025 () Bool)

(assert (=> b!167343 m!196025))

(declare-fun m!196027 () Bool)

(assert (=> b!167343 m!196027))

(declare-fun m!196029 () Bool)

(assert (=> b!167343 m!196029))

(declare-fun m!196031 () Bool)

(assert (=> b!167350 m!196031))

(declare-fun m!196033 () Bool)

(assert (=> b!167350 m!196033))

(declare-fun m!196035 () Bool)

(assert (=> b!167348 m!196035))

(declare-fun m!196037 () Bool)

(assert (=> b!167348 m!196037))

(declare-fun m!196039 () Bool)

(assert (=> mapNonEmpty!6435 m!196039))

(declare-fun m!196041 () Bool)

(assert (=> start!16708 m!196041))

(declare-fun m!196043 () Bool)

(assert (=> b!167349 m!196043))

(declare-fun m!196045 () Bool)

(assert (=> b!167347 m!196045))

(declare-fun m!196047 () Bool)

(assert (=> b!167344 m!196047))

(declare-fun m!196049 () Bool)

(assert (=> b!167345 m!196049))

(check-sat (not start!16708) b_and!10397 tp_is_empty!3811 (not b!167340) (not mapNonEmpty!6435) (not b!167349) (not b!167347) (not b!167350) (not b!167348) (not b!167343) (not b!167345) (not b_next!4009))
(check-sat b_and!10397 (not b_next!4009))
