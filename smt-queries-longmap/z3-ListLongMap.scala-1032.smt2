; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21878 () Bool)

(assert start!21878)

(declare-fun b!221112 () Bool)

(declare-fun b_free!5941 () Bool)

(declare-fun b_next!5941 () Bool)

(assert (=> b!221112 (= b_free!5941 (not b_next!5941))))

(declare-fun tp!20964 () Bool)

(declare-fun b_and!12853 () Bool)

(assert (=> b!221112 (= tp!20964 b_and!12853)))

(declare-fun b!221097 () Bool)

(declare-fun res!108445 () Bool)

(declare-fun e!143713 () Bool)

(assert (=> b!221097 (=> (not res!108445) (not e!143713))))

(declare-datatypes ((V!7385 0))(
  ( (V!7386 (val!2946 Int)) )
))
(declare-datatypes ((ValueCell!2558 0))(
  ( (ValueCellFull!2558 (v!4967 V!7385)) (EmptyCell!2558) )
))
(declare-datatypes ((array!10847 0))(
  ( (array!10848 (arr!5143 (Array (_ BitVec 32) ValueCell!2558)) (size!5476 (_ BitVec 32))) )
))
(declare-datatypes ((array!10849 0))(
  ( (array!10850 (arr!5144 (Array (_ BitVec 32) (_ BitVec 64))) (size!5477 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3016 0))(
  ( (LongMapFixedSize!3017 (defaultEntry!4167 Int) (mask!9975 (_ BitVec 32)) (extraKeys!3904 (_ BitVec 32)) (zeroValue!4008 V!7385) (minValue!4008 V!7385) (_size!1557 (_ BitVec 32)) (_keys!6221 array!10849) (_values!4150 array!10847) (_vacant!1557 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3016)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221097 (= res!108445 (arrayContainsKey!0 (_keys!6221 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221098 () Bool)

(declare-fun e!143722 () Bool)

(declare-datatypes ((SeekEntryResult!795 0))(
  ( (MissingZero!795 (index!5350 (_ BitVec 32))) (Found!795 (index!5351 (_ BitVec 32))) (Intermediate!795 (undefined!1607 Bool) (index!5352 (_ BitVec 32)) (x!22967 (_ BitVec 32))) (Undefined!795) (MissingVacant!795 (index!5353 (_ BitVec 32))) )
))
(declare-fun lt!112378 () SeekEntryResult!795)

(get-info :version)

(assert (=> b!221098 (= e!143722 ((_ is Undefined!795) lt!112378))))

(declare-fun mapNonEmpty!9874 () Bool)

(declare-fun mapRes!9874 () Bool)

(declare-fun tp!20965 () Bool)

(declare-fun e!143721 () Bool)

(assert (=> mapNonEmpty!9874 (= mapRes!9874 (and tp!20965 e!143721))))

(declare-fun mapValue!9874 () ValueCell!2558)

(declare-fun mapRest!9874 () (Array (_ BitVec 32) ValueCell!2558))

(declare-fun mapKey!9874 () (_ BitVec 32))

(assert (=> mapNonEmpty!9874 (= (arr!5143 (_values!4150 thiss!1504)) (store mapRest!9874 mapKey!9874 mapValue!9874))))

(declare-fun b!221099 () Bool)

(declare-fun e!143716 () Bool)

(assert (=> b!221099 (= e!143722 e!143716)))

(declare-fun res!108451 () Bool)

(declare-fun call!20645 () Bool)

(assert (=> b!221099 (= res!108451 call!20645)))

(assert (=> b!221099 (=> (not res!108451) (not e!143716))))

(declare-fun b!221100 () Bool)

(declare-fun res!108450 () Bool)

(assert (=> b!221100 (=> (not res!108450) (not e!143713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10849 (_ BitVec 32)) Bool)

(assert (=> b!221100 (= res!108450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6221 thiss!1504) (mask!9975 thiss!1504)))))

(declare-fun b!221101 () Bool)

(declare-fun c!36779 () Bool)

(assert (=> b!221101 (= c!36779 ((_ is MissingVacant!795) lt!112378))))

(declare-fun e!143720 () Bool)

(assert (=> b!221101 (= e!143720 e!143722)))

(declare-fun b!221102 () Bool)

(declare-fun res!108449 () Bool)

(assert (=> b!221102 (=> (not res!108449) (not e!143713))))

(assert (=> b!221102 (= res!108449 (and (= (size!5476 (_values!4150 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9975 thiss!1504))) (= (size!5477 (_keys!6221 thiss!1504)) (size!5476 (_values!4150 thiss!1504))) (bvsge (mask!9975 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3904 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3904 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!20642 () Bool)

(declare-fun call!20646 () Bool)

(assert (=> bm!20642 (= call!20646 (arrayContainsKey!0 (_keys!6221 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221103 () Bool)

(assert (=> b!221103 (= e!143716 (not call!20646))))

(declare-fun b!221104 () Bool)

(declare-fun res!108446 () Bool)

(declare-fun e!143711 () Bool)

(assert (=> b!221104 (=> (not res!108446) (not e!143711))))

(assert (=> b!221104 (= res!108446 call!20645)))

(assert (=> b!221104 (= e!143720 e!143711)))

(declare-fun b!221105 () Bool)

(declare-fun res!108443 () Bool)

(assert (=> b!221105 (=> (not res!108443) (not e!143711))))

(assert (=> b!221105 (= res!108443 (= (select (arr!5144 (_keys!6221 thiss!1504)) (index!5350 lt!112378)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221106 () Bool)

(declare-fun res!108444 () Bool)

(declare-fun e!143712 () Bool)

(assert (=> b!221106 (=> (not res!108444) (not e!143712))))

(assert (=> b!221106 (= res!108444 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221107 () Bool)

(assert (=> b!221107 (= e!143711 (not call!20646))))

(declare-fun b!221108 () Bool)

(declare-fun e!143718 () Bool)

(declare-fun tp_is_empty!5803 () Bool)

(assert (=> b!221108 (= e!143718 tp_is_empty!5803)))

(declare-fun b!221109 () Bool)

(declare-fun res!108447 () Bool)

(assert (=> b!221109 (= res!108447 (= (select (arr!5144 (_keys!6221 thiss!1504)) (index!5353 lt!112378)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221109 (=> (not res!108447) (not e!143716))))

(declare-fun b!221110 () Bool)

(declare-fun e!143717 () Bool)

(assert (=> b!221110 (= e!143717 e!143713)))

(declare-fun res!108452 () Bool)

(assert (=> b!221110 (=> (not res!108452) (not e!143713))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221110 (= res!108452 (inRange!0 index!297 (mask!9975 thiss!1504)))))

(declare-datatypes ((Unit!6572 0))(
  ( (Unit!6573) )
))
(declare-fun lt!112379 () Unit!6572)

(declare-fun e!143714 () Unit!6572)

(assert (=> b!221110 (= lt!112379 e!143714)))

(declare-fun c!36781 () Bool)

(declare-datatypes ((tuple2!4288 0))(
  ( (tuple2!4289 (_1!2155 (_ BitVec 64)) (_2!2155 V!7385)) )
))
(declare-datatypes ((List!3183 0))(
  ( (Nil!3180) (Cons!3179 (h!3827 tuple2!4288) (t!8134 List!3183)) )
))
(declare-datatypes ((ListLongMap!3203 0))(
  ( (ListLongMap!3204 (toList!1617 List!3183)) )
))
(declare-fun contains!1474 (ListLongMap!3203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1149 (array!10849 array!10847 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 32) Int) ListLongMap!3203)

(assert (=> b!221110 (= c!36781 (contains!1474 (getCurrentListMap!1149 (_keys!6221 thiss!1504) (_values!4150 thiss!1504) (mask!9975 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4167 thiss!1504)) key!932))))

(declare-fun b!221111 () Bool)

(assert (=> b!221111 (= e!143712 e!143717)))

(declare-fun res!108453 () Bool)

(assert (=> b!221111 (=> (not res!108453) (not e!143717))))

(assert (=> b!221111 (= res!108453 (or (= lt!112378 (MissingZero!795 index!297)) (= lt!112378 (MissingVacant!795 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10849 (_ BitVec 32)) SeekEntryResult!795)

(assert (=> b!221111 (= lt!112378 (seekEntryOrOpen!0 key!932 (_keys!6221 thiss!1504) (mask!9975 thiss!1504)))))

(declare-fun bm!20643 () Bool)

(declare-fun c!36780 () Bool)

(assert (=> bm!20643 (= call!20645 (inRange!0 (ite c!36780 (index!5350 lt!112378) (index!5353 lt!112378)) (mask!9975 thiss!1504)))))

(declare-fun e!143723 () Bool)

(declare-fun e!143719 () Bool)

(declare-fun array_inv!3375 (array!10849) Bool)

(declare-fun array_inv!3376 (array!10847) Bool)

(assert (=> b!221112 (= e!143723 (and tp!20964 tp_is_empty!5803 (array_inv!3375 (_keys!6221 thiss!1504)) (array_inv!3376 (_values!4150 thiss!1504)) e!143719))))

(declare-fun mapIsEmpty!9874 () Bool)

(assert (=> mapIsEmpty!9874 mapRes!9874))

(declare-fun res!108448 () Bool)

(assert (=> start!21878 (=> (not res!108448) (not e!143712))))

(declare-fun valid!1226 (LongMapFixedSize!3016) Bool)

(assert (=> start!21878 (= res!108448 (valid!1226 thiss!1504))))

(assert (=> start!21878 e!143712))

(assert (=> start!21878 e!143723))

(assert (=> start!21878 true))

(declare-fun b!221113 () Bool)

(assert (=> b!221113 (= e!143721 tp_is_empty!5803)))

(declare-fun b!221114 () Bool)

(declare-fun lt!112377 () Unit!6572)

(assert (=> b!221114 (= e!143714 lt!112377)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (array!10849 array!10847 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 64) Int) Unit!6572)

(assert (=> b!221114 (= lt!112377 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (_keys!6221 thiss!1504) (_values!4150 thiss!1504) (mask!9975 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) key!932 (defaultEntry!4167 thiss!1504)))))

(assert (=> b!221114 (= c!36780 ((_ is MissingZero!795) lt!112378))))

(assert (=> b!221114 e!143720))

(declare-fun b!221115 () Bool)

(declare-fun Unit!6574 () Unit!6572)

(assert (=> b!221115 (= e!143714 Unit!6574)))

(declare-fun lt!112381 () Unit!6572)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!206 (array!10849 array!10847 (_ BitVec 32) (_ BitVec 32) V!7385 V!7385 (_ BitVec 64) Int) Unit!6572)

(assert (=> b!221115 (= lt!112381 (lemmaInListMapThenSeekEntryOrOpenFindsIt!206 (_keys!6221 thiss!1504) (_values!4150 thiss!1504) (mask!9975 thiss!1504) (extraKeys!3904 thiss!1504) (zeroValue!4008 thiss!1504) (minValue!4008 thiss!1504) key!932 (defaultEntry!4167 thiss!1504)))))

(assert (=> b!221115 false))

(declare-fun b!221116 () Bool)

(assert (=> b!221116 (= e!143713 false)))

(declare-fun lt!112380 () Bool)

(declare-datatypes ((List!3184 0))(
  ( (Nil!3181) (Cons!3180 (h!3828 (_ BitVec 64)) (t!8135 List!3184)) )
))
(declare-fun arrayNoDuplicates!0 (array!10849 (_ BitVec 32) List!3184) Bool)

(assert (=> b!221116 (= lt!112380 (arrayNoDuplicates!0 (_keys!6221 thiss!1504) #b00000000000000000000000000000000 Nil!3181))))

(declare-fun b!221117 () Bool)

(declare-fun res!108454 () Bool)

(assert (=> b!221117 (=> (not res!108454) (not e!143713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221117 (= res!108454 (validMask!0 (mask!9975 thiss!1504)))))

(declare-fun b!221118 () Bool)

(assert (=> b!221118 (= e!143719 (and e!143718 mapRes!9874))))

(declare-fun condMapEmpty!9874 () Bool)

(declare-fun mapDefault!9874 () ValueCell!2558)

(assert (=> b!221118 (= condMapEmpty!9874 (= (arr!5143 (_values!4150 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2558)) mapDefault!9874)))))

(assert (= (and start!21878 res!108448) b!221106))

(assert (= (and b!221106 res!108444) b!221111))

(assert (= (and b!221111 res!108453) b!221110))

(assert (= (and b!221110 c!36781) b!221115))

(assert (= (and b!221110 (not c!36781)) b!221114))

(assert (= (and b!221114 c!36780) b!221104))

(assert (= (and b!221114 (not c!36780)) b!221101))

(assert (= (and b!221104 res!108446) b!221105))

(assert (= (and b!221105 res!108443) b!221107))

(assert (= (and b!221101 c!36779) b!221099))

(assert (= (and b!221101 (not c!36779)) b!221098))

(assert (= (and b!221099 res!108451) b!221109))

(assert (= (and b!221109 res!108447) b!221103))

(assert (= (or b!221104 b!221099) bm!20643))

(assert (= (or b!221107 b!221103) bm!20642))

(assert (= (and b!221110 res!108452) b!221097))

(assert (= (and b!221097 res!108445) b!221117))

(assert (= (and b!221117 res!108454) b!221102))

(assert (= (and b!221102 res!108449) b!221100))

(assert (= (and b!221100 res!108450) b!221116))

(assert (= (and b!221118 condMapEmpty!9874) mapIsEmpty!9874))

(assert (= (and b!221118 (not condMapEmpty!9874)) mapNonEmpty!9874))

(assert (= (and mapNonEmpty!9874 ((_ is ValueCellFull!2558) mapValue!9874)) b!221113))

(assert (= (and b!221118 ((_ is ValueCellFull!2558) mapDefault!9874)) b!221108))

(assert (= b!221112 b!221118))

(assert (= start!21878 b!221112))

(declare-fun m!246061 () Bool)

(assert (=> b!221112 m!246061))

(declare-fun m!246063 () Bool)

(assert (=> b!221112 m!246063))

(declare-fun m!246065 () Bool)

(assert (=> b!221114 m!246065))

(declare-fun m!246067 () Bool)

(assert (=> bm!20642 m!246067))

(declare-fun m!246069 () Bool)

(assert (=> start!21878 m!246069))

(declare-fun m!246071 () Bool)

(assert (=> b!221105 m!246071))

(declare-fun m!246073 () Bool)

(assert (=> b!221115 m!246073))

(declare-fun m!246075 () Bool)

(assert (=> b!221109 m!246075))

(declare-fun m!246077 () Bool)

(assert (=> bm!20643 m!246077))

(declare-fun m!246079 () Bool)

(assert (=> b!221111 m!246079))

(declare-fun m!246081 () Bool)

(assert (=> mapNonEmpty!9874 m!246081))

(declare-fun m!246083 () Bool)

(assert (=> b!221116 m!246083))

(assert (=> b!221097 m!246067))

(declare-fun m!246085 () Bool)

(assert (=> b!221117 m!246085))

(declare-fun m!246087 () Bool)

(assert (=> b!221110 m!246087))

(declare-fun m!246089 () Bool)

(assert (=> b!221110 m!246089))

(assert (=> b!221110 m!246089))

(declare-fun m!246091 () Bool)

(assert (=> b!221110 m!246091))

(declare-fun m!246093 () Bool)

(assert (=> b!221100 m!246093))

(check-sat (not b!221100) (not start!21878) (not b!221117) (not b!221115) (not b!221110) (not bm!20643) (not b!221112) (not mapNonEmpty!9874) (not b!221116) tp_is_empty!5803 (not bm!20642) (not b!221114) (not b!221097) (not b_next!5941) b_and!12853 (not b!221111))
(check-sat b_and!12853 (not b_next!5941))
