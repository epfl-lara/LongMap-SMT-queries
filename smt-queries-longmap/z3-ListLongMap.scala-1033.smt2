; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21882 () Bool)

(assert start!21882)

(declare-fun b!221326 () Bool)

(declare-fun b_free!5949 () Bool)

(declare-fun b_next!5949 () Bool)

(assert (=> b!221326 (= b_free!5949 (not b_next!5949))))

(declare-fun tp!20988 () Bool)

(declare-fun b_and!12847 () Bool)

(assert (=> b!221326 (= tp!20988 b_and!12847)))

(declare-fun bm!20678 () Bool)

(declare-fun call!20681 () Bool)

(declare-datatypes ((V!7395 0))(
  ( (V!7396 (val!2950 Int)) )
))
(declare-datatypes ((ValueCell!2562 0))(
  ( (ValueCellFull!2562 (v!4970 V!7395)) (EmptyCell!2562) )
))
(declare-datatypes ((array!10865 0))(
  ( (array!10866 (arr!5152 (Array (_ BitVec 32) ValueCell!2562)) (size!5485 (_ BitVec 32))) )
))
(declare-datatypes ((array!10867 0))(
  ( (array!10868 (arr!5153 (Array (_ BitVec 32) (_ BitVec 64))) (size!5486 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3024 0))(
  ( (LongMapFixedSize!3025 (defaultEntry!4171 Int) (mask!9981 (_ BitVec 32)) (extraKeys!3908 (_ BitVec 32)) (zeroValue!4012 V!7395) (minValue!4012 V!7395) (_size!1561 (_ BitVec 32)) (_keys!6225 array!10867) (_values!4154 array!10865) (_vacant!1561 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3024)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20678 (= call!20681 (arrayContainsKey!0 (_keys!6225 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221314 () Bool)

(declare-fun c!36802 () Bool)

(declare-datatypes ((SeekEntryResult!823 0))(
  ( (MissingZero!823 (index!5462 (_ BitVec 32))) (Found!823 (index!5463 (_ BitVec 32))) (Intermediate!823 (undefined!1635 Bool) (index!5464 (_ BitVec 32)) (x!23003 (_ BitVec 32))) (Undefined!823) (MissingVacant!823 (index!5465 (_ BitVec 32))) )
))
(declare-fun lt!112382 () SeekEntryResult!823)

(get-info :version)

(assert (=> b!221314 (= c!36802 ((_ is MissingVacant!823) lt!112382))))

(declare-fun e!143851 () Bool)

(declare-fun e!143849 () Bool)

(assert (=> b!221314 (= e!143851 e!143849)))

(declare-fun b!221315 () Bool)

(declare-fun res!108577 () Bool)

(assert (=> b!221315 (= res!108577 (= (select (arr!5153 (_keys!6225 thiss!1504)) (index!5465 lt!112382)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143845 () Bool)

(assert (=> b!221315 (=> (not res!108577) (not e!143845))))

(declare-fun mapIsEmpty!9886 () Bool)

(declare-fun mapRes!9886 () Bool)

(assert (=> mapIsEmpty!9886 mapRes!9886))

(declare-fun b!221316 () Bool)

(declare-fun e!143843 () Bool)

(declare-fun e!143855 () Bool)

(assert (=> b!221316 (= e!143843 (and e!143855 mapRes!9886))))

(declare-fun condMapEmpty!9886 () Bool)

(declare-fun mapDefault!9886 () ValueCell!2562)

(assert (=> b!221316 (= condMapEmpty!9886 (= (arr!5152 (_values!4154 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2562)) mapDefault!9886)))))

(declare-fun b!221317 () Bool)

(declare-fun e!143853 () Bool)

(assert (=> b!221317 (= e!143853 (not call!20681))))

(declare-fun b!221318 () Bool)

(assert (=> b!221318 (= e!143849 e!143845)))

(declare-fun res!108569 () Bool)

(declare-fun call!20682 () Bool)

(assert (=> b!221318 (= res!108569 call!20682)))

(assert (=> b!221318 (=> (not res!108569) (not e!143845))))

(declare-fun b!221319 () Bool)

(declare-fun res!108570 () Bool)

(declare-fun e!143844 () Bool)

(assert (=> b!221319 (=> (not res!108570) (not e!143844))))

(assert (=> b!221319 (= res!108570 (and (= (size!5485 (_values!4154 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9981 thiss!1504))) (= (size!5486 (_keys!6225 thiss!1504)) (size!5485 (_values!4154 thiss!1504))) (bvsge (mask!9981 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3908 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3908 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221320 () Bool)

(declare-fun res!108567 () Bool)

(assert (=> b!221320 (=> (not res!108567) (not e!143844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10867 (_ BitVec 32)) Bool)

(assert (=> b!221320 (= res!108567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6225 thiss!1504) (mask!9981 thiss!1504)))))

(declare-fun b!221322 () Bool)

(declare-fun res!108568 () Bool)

(declare-fun e!143854 () Bool)

(assert (=> b!221322 (=> (not res!108568) (not e!143854))))

(assert (=> b!221322 (= res!108568 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221323 () Bool)

(declare-fun res!108573 () Bool)

(assert (=> b!221323 (=> (not res!108573) (not e!143844))))

(assert (=> b!221323 (= res!108573 (arrayContainsKey!0 (_keys!6225 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9886 () Bool)

(declare-fun tp!20989 () Bool)

(declare-fun e!143850 () Bool)

(assert (=> mapNonEmpty!9886 (= mapRes!9886 (and tp!20989 e!143850))))

(declare-fun mapRest!9886 () (Array (_ BitVec 32) ValueCell!2562))

(declare-fun mapKey!9886 () (_ BitVec 32))

(declare-fun mapValue!9886 () ValueCell!2562)

(assert (=> mapNonEmpty!9886 (= (arr!5152 (_values!4154 thiss!1504)) (store mapRest!9886 mapKey!9886 mapValue!9886))))

(declare-fun b!221324 () Bool)

(declare-fun e!143852 () Bool)

(assert (=> b!221324 (= e!143852 e!143844)))

(declare-fun res!108571 () Bool)

(assert (=> b!221324 (=> (not res!108571) (not e!143844))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221324 (= res!108571 (inRange!0 index!297 (mask!9981 thiss!1504)))))

(declare-datatypes ((Unit!6611 0))(
  ( (Unit!6612) )
))
(declare-fun lt!112379 () Unit!6611)

(declare-fun e!143846 () Unit!6611)

(assert (=> b!221324 (= lt!112379 e!143846)))

(declare-fun c!36803 () Bool)

(declare-datatypes ((tuple2!4376 0))(
  ( (tuple2!4377 (_1!2199 (_ BitVec 64)) (_2!2199 V!7395)) )
))
(declare-datatypes ((List!3278 0))(
  ( (Nil!3275) (Cons!3274 (h!3922 tuple2!4376) (t!8237 List!3278)) )
))
(declare-datatypes ((ListLongMap!3289 0))(
  ( (ListLongMap!3290 (toList!1660 List!3278)) )
))
(declare-fun contains!1503 (ListLongMap!3289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1188 (array!10867 array!10865 (_ BitVec 32) (_ BitVec 32) V!7395 V!7395 (_ BitVec 32) Int) ListLongMap!3289)

(assert (=> b!221324 (= c!36803 (contains!1503 (getCurrentListMap!1188 (_keys!6225 thiss!1504) (_values!4154 thiss!1504) (mask!9981 thiss!1504) (extraKeys!3908 thiss!1504) (zeroValue!4012 thiss!1504) (minValue!4012 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4171 thiss!1504)) key!932))))

(declare-fun b!221325 () Bool)

(declare-fun Unit!6613 () Unit!6611)

(assert (=> b!221325 (= e!143846 Unit!6613)))

(declare-fun lt!112378 () Unit!6611)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!214 (array!10867 array!10865 (_ BitVec 32) (_ BitVec 32) V!7395 V!7395 (_ BitVec 64) Int) Unit!6611)

(assert (=> b!221325 (= lt!112378 (lemmaInListMapThenSeekEntryOrOpenFindsIt!214 (_keys!6225 thiss!1504) (_values!4154 thiss!1504) (mask!9981 thiss!1504) (extraKeys!3908 thiss!1504) (zeroValue!4012 thiss!1504) (minValue!4012 thiss!1504) key!932 (defaultEntry!4171 thiss!1504)))))

(assert (=> b!221325 false))

(declare-fun e!143847 () Bool)

(declare-fun tp_is_empty!5811 () Bool)

(declare-fun array_inv!3411 (array!10867) Bool)

(declare-fun array_inv!3412 (array!10865) Bool)

(assert (=> b!221326 (= e!143847 (and tp!20988 tp_is_empty!5811 (array_inv!3411 (_keys!6225 thiss!1504)) (array_inv!3412 (_values!4154 thiss!1504)) e!143843))))

(declare-fun b!221327 () Bool)

(declare-fun lt!112381 () Unit!6611)

(assert (=> b!221327 (= e!143846 lt!112381)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!225 (array!10867 array!10865 (_ BitVec 32) (_ BitVec 32) V!7395 V!7395 (_ BitVec 64) Int) Unit!6611)

(assert (=> b!221327 (= lt!112381 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!225 (_keys!6225 thiss!1504) (_values!4154 thiss!1504) (mask!9981 thiss!1504) (extraKeys!3908 thiss!1504) (zeroValue!4012 thiss!1504) (minValue!4012 thiss!1504) key!932 (defaultEntry!4171 thiss!1504)))))

(declare-fun c!36804 () Bool)

(assert (=> b!221327 (= c!36804 ((_ is MissingZero!823) lt!112382))))

(assert (=> b!221327 e!143851))

(declare-fun b!221328 () Bool)

(assert (=> b!221328 (= e!143850 tp_is_empty!5811)))

(declare-fun b!221329 () Bool)

(assert (=> b!221329 (= e!143855 tp_is_empty!5811)))

(declare-fun b!221330 () Bool)

(assert (=> b!221330 (= e!143844 false)))

(declare-fun lt!112380 () Bool)

(declare-datatypes ((List!3279 0))(
  ( (Nil!3276) (Cons!3275 (h!3923 (_ BitVec 64)) (t!8238 List!3279)) )
))
(declare-fun arrayNoDuplicates!0 (array!10867 (_ BitVec 32) List!3279) Bool)

(assert (=> b!221330 (= lt!112380 (arrayNoDuplicates!0 (_keys!6225 thiss!1504) #b00000000000000000000000000000000 Nil!3276))))

(declare-fun b!221331 () Bool)

(assert (=> b!221331 (= e!143845 (not call!20681))))

(declare-fun b!221332 () Bool)

(declare-fun res!108572 () Bool)

(assert (=> b!221332 (=> (not res!108572) (not e!143853))))

(assert (=> b!221332 (= res!108572 (= (select (arr!5153 (_keys!6225 thiss!1504)) (index!5462 lt!112382)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20679 () Bool)

(assert (=> bm!20679 (= call!20682 (inRange!0 (ite c!36804 (index!5462 lt!112382) (index!5465 lt!112382)) (mask!9981 thiss!1504)))))

(declare-fun b!221333 () Bool)

(assert (=> b!221333 (= e!143854 e!143852)))

(declare-fun res!108566 () Bool)

(assert (=> b!221333 (=> (not res!108566) (not e!143852))))

(assert (=> b!221333 (= res!108566 (or (= lt!112382 (MissingZero!823 index!297)) (= lt!112382 (MissingVacant!823 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10867 (_ BitVec 32)) SeekEntryResult!823)

(assert (=> b!221333 (= lt!112382 (seekEntryOrOpen!0 key!932 (_keys!6225 thiss!1504) (mask!9981 thiss!1504)))))

(declare-fun b!221334 () Bool)

(assert (=> b!221334 (= e!143849 ((_ is Undefined!823) lt!112382))))

(declare-fun b!221335 () Bool)

(declare-fun res!108576 () Bool)

(assert (=> b!221335 (=> (not res!108576) (not e!143844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221335 (= res!108576 (validMask!0 (mask!9981 thiss!1504)))))

(declare-fun res!108575 () Bool)

(assert (=> start!21882 (=> (not res!108575) (not e!143854))))

(declare-fun valid!1220 (LongMapFixedSize!3024) Bool)

(assert (=> start!21882 (= res!108575 (valid!1220 thiss!1504))))

(assert (=> start!21882 e!143854))

(assert (=> start!21882 e!143847))

(assert (=> start!21882 true))

(declare-fun b!221321 () Bool)

(declare-fun res!108574 () Bool)

(assert (=> b!221321 (=> (not res!108574) (not e!143853))))

(assert (=> b!221321 (= res!108574 call!20682)))

(assert (=> b!221321 (= e!143851 e!143853)))

(assert (= (and start!21882 res!108575) b!221322))

(assert (= (and b!221322 res!108568) b!221333))

(assert (= (and b!221333 res!108566) b!221324))

(assert (= (and b!221324 c!36803) b!221325))

(assert (= (and b!221324 (not c!36803)) b!221327))

(assert (= (and b!221327 c!36804) b!221321))

(assert (= (and b!221327 (not c!36804)) b!221314))

(assert (= (and b!221321 res!108574) b!221332))

(assert (= (and b!221332 res!108572) b!221317))

(assert (= (and b!221314 c!36802) b!221318))

(assert (= (and b!221314 (not c!36802)) b!221334))

(assert (= (and b!221318 res!108569) b!221315))

(assert (= (and b!221315 res!108577) b!221331))

(assert (= (or b!221321 b!221318) bm!20679))

(assert (= (or b!221317 b!221331) bm!20678))

(assert (= (and b!221324 res!108571) b!221323))

(assert (= (and b!221323 res!108573) b!221335))

(assert (= (and b!221335 res!108576) b!221319))

(assert (= (and b!221319 res!108570) b!221320))

(assert (= (and b!221320 res!108567) b!221330))

(assert (= (and b!221316 condMapEmpty!9886) mapIsEmpty!9886))

(assert (= (and b!221316 (not condMapEmpty!9886)) mapNonEmpty!9886))

(assert (= (and mapNonEmpty!9886 ((_ is ValueCellFull!2562) mapValue!9886)) b!221328))

(assert (= (and b!221316 ((_ is ValueCellFull!2562) mapDefault!9886)) b!221329))

(assert (= b!221326 b!221316))

(assert (= start!21882 b!221326))

(declare-fun m!246015 () Bool)

(assert (=> b!221324 m!246015))

(declare-fun m!246017 () Bool)

(assert (=> b!221324 m!246017))

(assert (=> b!221324 m!246017))

(declare-fun m!246019 () Bool)

(assert (=> b!221324 m!246019))

(declare-fun m!246021 () Bool)

(assert (=> b!221327 m!246021))

(declare-fun m!246023 () Bool)

(assert (=> b!221335 m!246023))

(declare-fun m!246025 () Bool)

(assert (=> b!221320 m!246025))

(declare-fun m!246027 () Bool)

(assert (=> b!221332 m!246027))

(declare-fun m!246029 () Bool)

(assert (=> b!221326 m!246029))

(declare-fun m!246031 () Bool)

(assert (=> b!221326 m!246031))

(declare-fun m!246033 () Bool)

(assert (=> b!221325 m!246033))

(declare-fun m!246035 () Bool)

(assert (=> bm!20678 m!246035))

(declare-fun m!246037 () Bool)

(assert (=> b!221333 m!246037))

(declare-fun m!246039 () Bool)

(assert (=> start!21882 m!246039))

(declare-fun m!246041 () Bool)

(assert (=> mapNonEmpty!9886 m!246041))

(assert (=> b!221323 m!246035))

(declare-fun m!246043 () Bool)

(assert (=> bm!20679 m!246043))

(declare-fun m!246045 () Bool)

(assert (=> b!221315 m!246045))

(declare-fun m!246047 () Bool)

(assert (=> b!221330 m!246047))

(check-sat (not b!221325) (not b!221327) (not b!221320) (not start!21882) (not b_next!5949) (not mapNonEmpty!9886) (not bm!20678) b_and!12847 (not b!221335) (not b!221323) tp_is_empty!5811 (not b!221326) (not b!221324) (not b!221330) (not bm!20679) (not b!221333))
(check-sat b_and!12847 (not b_next!5949))
