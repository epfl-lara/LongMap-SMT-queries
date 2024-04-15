; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16696 () Bool)

(assert start!16696)

(declare-fun b!167114 () Bool)

(declare-fun b_free!3997 () Bool)

(declare-fun b_next!3997 () Bool)

(assert (=> b!167114 (= b_free!3997 (not b_next!3997))))

(declare-fun tp!14592 () Bool)

(declare-fun b_and!10385 () Bool)

(assert (=> b!167114 (= tp!14592 b_and!10385)))

(declare-fun b!167106 () Bool)

(declare-fun res!79448 () Bool)

(declare-fun e!109720 () Bool)

(assert (=> b!167106 (=> (not res!79448) (not e!109720))))

(declare-datatypes ((V!4713 0))(
  ( (V!4714 (val!1944 Int)) )
))
(declare-datatypes ((ValueCell!1556 0))(
  ( (ValueCellFull!1556 (v!3803 V!4713)) (EmptyCell!1556) )
))
(declare-datatypes ((array!6675 0))(
  ( (array!6676 (arr!3172 (Array (_ BitVec 32) (_ BitVec 64))) (size!3461 (_ BitVec 32))) )
))
(declare-datatypes ((array!6677 0))(
  ( (array!6678 (arr!3173 (Array (_ BitVec 32) ValueCell!1556)) (size!3462 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2020 0))(
  ( (LongMapFixedSize!2021 (defaultEntry!3452 Int) (mask!8196 (_ BitVec 32)) (extraKeys!3193 (_ BitVec 32)) (zeroValue!3295 V!4713) (minValue!3295 V!4713) (_size!1059 (_ BitVec 32)) (_keys!5276 array!6675) (_values!3435 array!6677) (_vacant!1059 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2020)

(assert (=> b!167106 (= res!79448 (and (= (size!3462 (_values!3435 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8196 thiss!1248))) (= (size!3461 (_keys!5276 thiss!1248)) (size!3462 (_values!3435 thiss!1248))) (bvsge (mask!8196 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3193 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3193 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167107 () Bool)

(declare-fun e!109719 () Bool)

(declare-fun tp_is_empty!3799 () Bool)

(assert (=> b!167107 (= e!109719 tp_is_empty!3799)))

(declare-fun b!167108 () Bool)

(declare-fun res!79447 () Bool)

(declare-fun e!109724 () Bool)

(assert (=> b!167108 (=> (not res!79447) (not e!109724))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!167108 (= res!79447 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167109 () Bool)

(declare-fun e!109721 () Bool)

(declare-fun mapRes!6417 () Bool)

(assert (=> b!167109 (= e!109721 (and e!109719 mapRes!6417))))

(declare-fun condMapEmpty!6417 () Bool)

(declare-fun mapDefault!6417 () ValueCell!1556)

(assert (=> b!167109 (= condMapEmpty!6417 (= (arr!3173 (_values!3435 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1556)) mapDefault!6417)))))

(declare-fun mapIsEmpty!6417 () Bool)

(assert (=> mapIsEmpty!6417 mapRes!6417))

(declare-fun b!167110 () Bool)

(declare-fun res!79445 () Bool)

(assert (=> b!167110 (=> (not res!79445) (not e!109720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6675 (_ BitVec 32)) Bool)

(assert (=> b!167110 (= res!79445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5276 thiss!1248) (mask!8196 thiss!1248)))))

(declare-datatypes ((SeekEntryResult!483 0))(
  ( (MissingZero!483 (index!4100 (_ BitVec 32))) (Found!483 (index!4101 (_ BitVec 32))) (Intermediate!483 (undefined!1295 Bool) (index!4102 (_ BitVec 32)) (x!18518 (_ BitVec 32))) (Undefined!483) (MissingVacant!483 (index!4103 (_ BitVec 32))) )
))
(declare-fun lt!83441 () SeekEntryResult!483)

(declare-fun e!109728 () Bool)

(declare-fun b!167111 () Bool)

(assert (=> b!167111 (= e!109728 (= (select (arr!3172 (_keys!5276 thiss!1248)) (index!4101 lt!83441)) key!828))))

(declare-fun b!167112 () Bool)

(declare-fun e!109726 () Bool)

(assert (=> b!167112 (= e!109726 tp_is_empty!3799)))

(declare-fun b!167113 () Bool)

(declare-fun e!109727 () Bool)

(assert (=> b!167113 (= e!109724 e!109727)))

(declare-fun res!79450 () Bool)

(assert (=> b!167113 (=> (not res!79450) (not e!109727))))

(get-info :version)

(assert (=> b!167113 (= res!79450 (and (not ((_ is Undefined!483) lt!83441)) (not ((_ is MissingVacant!483) lt!83441)) (not ((_ is MissingZero!483) lt!83441)) ((_ is Found!483) lt!83441)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6675 (_ BitVec 32)) SeekEntryResult!483)

(assert (=> b!167113 (= lt!83441 (seekEntryOrOpen!0 key!828 (_keys!5276 thiss!1248) (mask!8196 thiss!1248)))))

(declare-fun e!109722 () Bool)

(declare-fun array_inv!2045 (array!6675) Bool)

(declare-fun array_inv!2046 (array!6677) Bool)

(assert (=> b!167114 (= e!109722 (and tp!14592 tp_is_empty!3799 (array_inv!2045 (_keys!5276 thiss!1248)) (array_inv!2046 (_values!3435 thiss!1248)) e!109721))))

(declare-fun mapNonEmpty!6417 () Bool)

(declare-fun tp!14591 () Bool)

(assert (=> mapNonEmpty!6417 (= mapRes!6417 (and tp!14591 e!109726))))

(declare-fun mapValue!6417 () ValueCell!1556)

(declare-fun mapRest!6417 () (Array (_ BitVec 32) ValueCell!1556))

(declare-fun mapKey!6417 () (_ BitVec 32))

(assert (=> mapNonEmpty!6417 (= (arr!3173 (_values!3435 thiss!1248)) (store mapRest!6417 mapKey!6417 mapValue!6417))))

(declare-fun res!79446 () Bool)

(assert (=> start!16696 (=> (not res!79446) (not e!109724))))

(declare-fun valid!891 (LongMapFixedSize!2020) Bool)

(assert (=> start!16696 (= res!79446 (valid!891 thiss!1248))))

(assert (=> start!16696 e!109724))

(assert (=> start!16696 e!109722))

(assert (=> start!16696 true))

(declare-fun b!167115 () Bool)

(assert (=> b!167115 (= e!109720 false)))

(declare-fun lt!83440 () Bool)

(declare-datatypes ((List!2124 0))(
  ( (Nil!2121) (Cons!2120 (h!2737 (_ BitVec 64)) (t!6917 List!2124)) )
))
(declare-fun arrayNoDuplicates!0 (array!6675 (_ BitVec 32) List!2124) Bool)

(assert (=> b!167115 (= lt!83440 (arrayNoDuplicates!0 (_keys!5276 thiss!1248) #b00000000000000000000000000000000 Nil!2121))))

(declare-fun b!167116 () Bool)

(declare-datatypes ((Unit!5083 0))(
  ( (Unit!5084) )
))
(declare-fun e!109725 () Unit!5083)

(declare-fun lt!83438 () Unit!5083)

(assert (=> b!167116 (= e!109725 lt!83438)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!98 (array!6675 array!6677 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 64) Int) Unit!5083)

(assert (=> b!167116 (= lt!83438 (lemmaInListMapThenSeekEntryOrOpenFindsIt!98 (_keys!5276 thiss!1248) (_values!3435 thiss!1248) (mask!8196 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) key!828 (defaultEntry!3452 thiss!1248)))))

(declare-fun res!79449 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167116 (= res!79449 (inRange!0 (index!4101 lt!83441) (mask!8196 thiss!1248)))))

(assert (=> b!167116 (=> (not res!79449) (not e!109728))))

(assert (=> b!167116 e!109728))

(declare-fun b!167117 () Bool)

(declare-fun Unit!5085 () Unit!5083)

(assert (=> b!167117 (= e!109725 Unit!5085)))

(declare-fun lt!83442 () Unit!5083)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!97 (array!6675 array!6677 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 64) Int) Unit!5083)

(assert (=> b!167117 (= lt!83442 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!97 (_keys!5276 thiss!1248) (_values!3435 thiss!1248) (mask!8196 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) key!828 (defaultEntry!3452 thiss!1248)))))

(assert (=> b!167117 false))

(declare-fun b!167118 () Bool)

(assert (=> b!167118 (= e!109727 e!109720)))

(declare-fun res!79444 () Bool)

(assert (=> b!167118 (=> (not res!79444) (not e!109720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167118 (= res!79444 (validMask!0 (mask!8196 thiss!1248)))))

(declare-fun lt!83439 () Unit!5083)

(assert (=> b!167118 (= lt!83439 e!109725)))

(declare-fun c!30251 () Bool)

(declare-datatypes ((tuple2!3118 0))(
  ( (tuple2!3119 (_1!1570 (_ BitVec 64)) (_2!1570 V!4713)) )
))
(declare-datatypes ((List!2125 0))(
  ( (Nil!2122) (Cons!2121 (h!2738 tuple2!3118) (t!6918 List!2125)) )
))
(declare-datatypes ((ListLongMap!2061 0))(
  ( (ListLongMap!2062 (toList!1046 List!2125)) )
))
(declare-fun contains!1091 (ListLongMap!2061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!688 (array!6675 array!6677 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 32) Int) ListLongMap!2061)

(assert (=> b!167118 (= c!30251 (contains!1091 (getCurrentListMap!688 (_keys!5276 thiss!1248) (_values!3435 thiss!1248) (mask!8196 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3452 thiss!1248)) key!828))))

(assert (= (and start!16696 res!79446) b!167108))

(assert (= (and b!167108 res!79447) b!167113))

(assert (= (and b!167113 res!79450) b!167118))

(assert (= (and b!167118 c!30251) b!167116))

(assert (= (and b!167118 (not c!30251)) b!167117))

(assert (= (and b!167116 res!79449) b!167111))

(assert (= (and b!167118 res!79444) b!167106))

(assert (= (and b!167106 res!79448) b!167110))

(assert (= (and b!167110 res!79445) b!167115))

(assert (= (and b!167109 condMapEmpty!6417) mapIsEmpty!6417))

(assert (= (and b!167109 (not condMapEmpty!6417)) mapNonEmpty!6417))

(assert (= (and mapNonEmpty!6417 ((_ is ValueCellFull!1556) mapValue!6417)) b!167112))

(assert (= (and b!167109 ((_ is ValueCellFull!1556) mapDefault!6417)) b!167107))

(assert (= b!167114 b!167109))

(assert (= start!16696 b!167114))

(declare-fun m!195847 () Bool)

(assert (=> b!167115 m!195847))

(declare-fun m!195849 () Bool)

(assert (=> b!167114 m!195849))

(declare-fun m!195851 () Bool)

(assert (=> b!167114 m!195851))

(declare-fun m!195853 () Bool)

(assert (=> b!167111 m!195853))

(declare-fun m!195855 () Bool)

(assert (=> b!167113 m!195855))

(declare-fun m!195857 () Bool)

(assert (=> b!167118 m!195857))

(declare-fun m!195859 () Bool)

(assert (=> b!167118 m!195859))

(assert (=> b!167118 m!195859))

(declare-fun m!195861 () Bool)

(assert (=> b!167118 m!195861))

(declare-fun m!195863 () Bool)

(assert (=> b!167117 m!195863))

(declare-fun m!195865 () Bool)

(assert (=> b!167110 m!195865))

(declare-fun m!195867 () Bool)

(assert (=> mapNonEmpty!6417 m!195867))

(declare-fun m!195869 () Bool)

(assert (=> start!16696 m!195869))

(declare-fun m!195871 () Bool)

(assert (=> b!167116 m!195871))

(declare-fun m!195873 () Bool)

(assert (=> b!167116 m!195873))

(check-sat (not b!167116) b_and!10385 (not start!16696) (not b!167113) (not b!167115) (not b_next!3997) (not b!167110) tp_is_empty!3799 (not mapNonEmpty!6417) (not b!167114) (not b!167118) (not b!167117))
(check-sat b_and!10385 (not b_next!3997))
