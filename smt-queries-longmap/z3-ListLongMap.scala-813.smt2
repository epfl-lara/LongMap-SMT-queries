; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19800 () Bool)

(assert start!19800)

(declare-fun b!193809 () Bool)

(declare-fun b_free!4717 () Bool)

(declare-fun b_next!4717 () Bool)

(assert (=> b!193809 (= b_free!4717 (not b_next!4717))))

(declare-fun tp!17020 () Bool)

(declare-fun b_and!11405 () Bool)

(assert (=> b!193809 (= tp!17020 b_and!11405)))

(declare-fun b!193799 () Bool)

(declare-datatypes ((Unit!5819 0))(
  ( (Unit!5820) )
))
(declare-fun e!127503 () Unit!5819)

(declare-fun lt!96457 () Unit!5819)

(assert (=> b!193799 (= e!127503 lt!96457)))

(declare-datatypes ((V!5633 0))(
  ( (V!5634 (val!2289 Int)) )
))
(declare-datatypes ((ValueCell!1901 0))(
  ( (ValueCellFull!1901 (v!4245 V!5633)) (EmptyCell!1901) )
))
(declare-datatypes ((array!8209 0))(
  ( (array!8210 (arr!3862 (Array (_ BitVec 32) (_ BitVec 64))) (size!4187 (_ BitVec 32))) )
))
(declare-datatypes ((array!8211 0))(
  ( (array!8212 (arr!3863 (Array (_ BitVec 32) ValueCell!1901)) (size!4188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2710 0))(
  ( (LongMapFixedSize!2711 (defaultEntry!3959 Int) (mask!9221 (_ BitVec 32)) (extraKeys!3696 (_ BitVec 32)) (zeroValue!3800 V!5633) (minValue!3800 V!5633) (_size!1404 (_ BitVec 32)) (_keys!5952 array!8209) (_values!3942 array!8211) (_vacant!1404 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2710)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5819)

(assert (=> b!193799 (= lt!96457 (lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(declare-fun res!91570 () Bool)

(declare-datatypes ((SeekEntryResult!695 0))(
  ( (MissingZero!695 (index!4950 (_ BitVec 32))) (Found!695 (index!4951 (_ BitVec 32))) (Intermediate!695 (undefined!1507 Bool) (index!4952 (_ BitVec 32)) (x!20690 (_ BitVec 32))) (Undefined!695) (MissingVacant!695 (index!4953 (_ BitVec 32))) )
))
(declare-fun lt!96450 () SeekEntryResult!695)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193799 (= res!91570 (inRange!0 (index!4951 lt!96450) (mask!9221 thiss!1248)))))

(declare-fun e!127501 () Bool)

(assert (=> b!193799 (=> (not res!91570) (not e!127501))))

(assert (=> b!193799 e!127501))

(declare-fun res!91571 () Bool)

(declare-fun e!127508 () Bool)

(assert (=> start!19800 (=> (not res!91571) (not e!127508))))

(declare-fun valid!1128 (LongMapFixedSize!2710) Bool)

(assert (=> start!19800 (= res!91571 (valid!1128 thiss!1248))))

(assert (=> start!19800 e!127508))

(declare-fun e!127507 () Bool)

(assert (=> start!19800 e!127507))

(assert (=> start!19800 true))

(declare-fun tp_is_empty!4489 () Bool)

(assert (=> start!19800 tp_is_empty!4489))

(declare-fun b!193800 () Bool)

(declare-fun e!127500 () Bool)

(declare-fun e!127506 () Bool)

(assert (=> b!193800 (= e!127500 (not e!127506))))

(declare-fun res!91573 () Bool)

(assert (=> b!193800 (=> (not res!91573) (not e!127506))))

(declare-fun lt!96455 () LongMapFixedSize!2710)

(assert (=> b!193800 (= res!91573 (valid!1128 lt!96455))))

(declare-datatypes ((tuple2!3510 0))(
  ( (tuple2!3511 (_1!1766 (_ BitVec 64)) (_2!1766 V!5633)) )
))
(declare-datatypes ((List!2426 0))(
  ( (Nil!2423) (Cons!2422 (h!3063 tuple2!3510) (t!7343 List!2426)) )
))
(declare-datatypes ((ListLongMap!2419 0))(
  ( (ListLongMap!2420 (toList!1225 List!2426)) )
))
(declare-fun lt!96451 () ListLongMap!2419)

(declare-fun contains!1356 (ListLongMap!2419 (_ BitVec 64)) Bool)

(assert (=> b!193800 (contains!1356 lt!96451 (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))

(declare-fun lt!96456 () Unit!5819)

(declare-fun lt!96452 () array!8211)

(declare-fun lemmaValidKeyInArrayIsInListMap!143 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) Unit!5819)

(assert (=> b!193800 (= lt!96456 (lemmaValidKeyInArrayIsInListMap!143 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) (defaultEntry!3959 thiss!1248)))))

(assert (=> b!193800 (= lt!96455 (LongMapFixedSize!2711 (defaultEntry!3959 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (_size!1404 thiss!1248) (_keys!5952 thiss!1248) lt!96452 (_vacant!1404 thiss!1248)))))

(declare-fun lt!96459 () ListLongMap!2419)

(assert (=> b!193800 (= lt!96459 lt!96451)))

(declare-fun getCurrentListMap!858 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) ListLongMap!2419)

(assert (=> b!193800 (= lt!96451 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96453 () ListLongMap!2419)

(declare-fun lt!96460 () tuple2!3510)

(declare-fun +!317 (ListLongMap!2419 tuple2!3510) ListLongMap!2419)

(assert (=> b!193800 (= lt!96459 (+!317 lt!96453 lt!96460))))

(declare-fun v!309 () V!5633)

(assert (=> b!193800 (= lt!96452 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))))))

(assert (=> b!193800 (= lt!96460 (tuple2!3511 key!828 v!309))))

(declare-fun lt!96449 () Unit!5819)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!133 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) (_ BitVec 64) V!5633 Int) Unit!5819)

(assert (=> b!193800 (= lt!96449 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!133 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) key!828 v!309 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96458 () Unit!5819)

(assert (=> b!193800 (= lt!96458 e!127503)))

(declare-fun c!34953 () Bool)

(assert (=> b!193800 (= c!34953 (contains!1356 lt!96453 key!828))))

(assert (=> b!193800 (= lt!96453 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!193801 () Bool)

(assert (=> b!193801 (= e!127508 e!127500)))

(declare-fun res!91572 () Bool)

(assert (=> b!193801 (=> (not res!91572) (not e!127500))))

(get-info :version)

(assert (=> b!193801 (= res!91572 (and (not ((_ is Undefined!695) lt!96450)) (not ((_ is MissingVacant!695) lt!96450)) (not ((_ is MissingZero!695) lt!96450)) ((_ is Found!695) lt!96450)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8209 (_ BitVec 32)) SeekEntryResult!695)

(assert (=> b!193801 (= lt!96450 (seekEntryOrOpen!0 key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun b!193802 () Bool)

(declare-fun Unit!5821 () Unit!5819)

(assert (=> b!193802 (= e!127503 Unit!5821)))

(declare-fun lt!96461 () Unit!5819)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5819)

(assert (=> b!193802 (= lt!96461 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(assert (=> b!193802 false))

(declare-fun b!193803 () Bool)

(declare-fun e!127502 () Bool)

(assert (=> b!193803 (= e!127502 tp_is_empty!4489)))

(declare-fun mapIsEmpty!7766 () Bool)

(declare-fun mapRes!7766 () Bool)

(assert (=> mapIsEmpty!7766 mapRes!7766))

(declare-fun lt!96454 () ListLongMap!2419)

(declare-fun b!193804 () Bool)

(declare-fun e!127505 () Bool)

(declare-fun map!2007 (LongMapFixedSize!2710) ListLongMap!2419)

(assert (=> b!193804 (= e!127505 (= lt!96454 (+!317 (map!2007 thiss!1248) lt!96460)))))

(declare-fun b!193805 () Bool)

(declare-fun res!91574 () Bool)

(assert (=> b!193805 (=> (not res!91574) (not e!127508))))

(assert (=> b!193805 (= res!91574 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193806 () Bool)

(declare-fun e!127504 () Bool)

(assert (=> b!193806 (= e!127504 tp_is_empty!4489)))

(declare-fun b!193807 () Bool)

(assert (=> b!193807 (= e!127506 e!127505)))

(declare-fun res!91569 () Bool)

(assert (=> b!193807 (=> (not res!91569) (not e!127505))))

(assert (=> b!193807 (= res!91569 (contains!1356 lt!96454 key!828))))

(assert (=> b!193807 (= lt!96454 (map!2007 lt!96455))))

(declare-fun b!193808 () Bool)

(declare-fun e!127499 () Bool)

(assert (=> b!193808 (= e!127499 (and e!127504 mapRes!7766))))

(declare-fun condMapEmpty!7766 () Bool)

(declare-fun mapDefault!7766 () ValueCell!1901)

(assert (=> b!193808 (= condMapEmpty!7766 (= (arr!3863 (_values!3942 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7766)))))

(declare-fun array_inv!2505 (array!8209) Bool)

(declare-fun array_inv!2506 (array!8211) Bool)

(assert (=> b!193809 (= e!127507 (and tp!17020 tp_is_empty!4489 (array_inv!2505 (_keys!5952 thiss!1248)) (array_inv!2506 (_values!3942 thiss!1248)) e!127499))))

(declare-fun mapNonEmpty!7766 () Bool)

(declare-fun tp!17021 () Bool)

(assert (=> mapNonEmpty!7766 (= mapRes!7766 (and tp!17021 e!127502))))

(declare-fun mapKey!7766 () (_ BitVec 32))

(declare-fun mapRest!7766 () (Array (_ BitVec 32) ValueCell!1901))

(declare-fun mapValue!7766 () ValueCell!1901)

(assert (=> mapNonEmpty!7766 (= (arr!3863 (_values!3942 thiss!1248)) (store mapRest!7766 mapKey!7766 mapValue!7766))))

(declare-fun b!193810 () Bool)

(assert (=> b!193810 (= e!127501 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)) key!828))))

(assert (= (and start!19800 res!91571) b!193805))

(assert (= (and b!193805 res!91574) b!193801))

(assert (= (and b!193801 res!91572) b!193800))

(assert (= (and b!193800 c!34953) b!193799))

(assert (= (and b!193800 (not c!34953)) b!193802))

(assert (= (and b!193799 res!91570) b!193810))

(assert (= (and b!193800 res!91573) b!193807))

(assert (= (and b!193807 res!91569) b!193804))

(assert (= (and b!193808 condMapEmpty!7766) mapIsEmpty!7766))

(assert (= (and b!193808 (not condMapEmpty!7766)) mapNonEmpty!7766))

(assert (= (and mapNonEmpty!7766 ((_ is ValueCellFull!1901) mapValue!7766)) b!193803))

(assert (= (and b!193808 ((_ is ValueCellFull!1901) mapDefault!7766)) b!193806))

(assert (= b!193809 b!193808))

(assert (= start!19800 b!193809))

(declare-fun m!220069 () Bool)

(assert (=> b!193807 m!220069))

(declare-fun m!220071 () Bool)

(assert (=> b!193807 m!220071))

(declare-fun m!220073 () Bool)

(assert (=> mapNonEmpty!7766 m!220073))

(declare-fun m!220075 () Bool)

(assert (=> b!193801 m!220075))

(declare-fun m!220077 () Bool)

(assert (=> b!193804 m!220077))

(assert (=> b!193804 m!220077))

(declare-fun m!220079 () Bool)

(assert (=> b!193804 m!220079))

(declare-fun m!220081 () Bool)

(assert (=> b!193802 m!220081))

(declare-fun m!220083 () Bool)

(assert (=> start!19800 m!220083))

(declare-fun m!220085 () Bool)

(assert (=> b!193809 m!220085))

(declare-fun m!220087 () Bool)

(assert (=> b!193809 m!220087))

(declare-fun m!220089 () Bool)

(assert (=> b!193799 m!220089))

(declare-fun m!220091 () Bool)

(assert (=> b!193799 m!220091))

(declare-fun m!220093 () Bool)

(assert (=> b!193810 m!220093))

(declare-fun m!220095 () Bool)

(assert (=> b!193800 m!220095))

(declare-fun m!220097 () Bool)

(assert (=> b!193800 m!220097))

(assert (=> b!193800 m!220093))

(declare-fun m!220099 () Bool)

(assert (=> b!193800 m!220099))

(declare-fun m!220101 () Bool)

(assert (=> b!193800 m!220101))

(declare-fun m!220103 () Bool)

(assert (=> b!193800 m!220103))

(declare-fun m!220105 () Bool)

(assert (=> b!193800 m!220105))

(declare-fun m!220107 () Bool)

(assert (=> b!193800 m!220107))

(declare-fun m!220109 () Bool)

(assert (=> b!193800 m!220109))

(declare-fun m!220111 () Bool)

(assert (=> b!193800 m!220111))

(assert (=> b!193800 m!220093))

(check-sat (not b!193801) (not start!19800) b_and!11405 (not b!193809) (not mapNonEmpty!7766) (not b!193799) (not b!193804) (not b_next!4717) (not b!193800) (not b!193807) (not b!193802) tp_is_empty!4489)
(check-sat b_and!11405 (not b_next!4717))
(get-model)

(declare-fun b!193895 () Bool)

(declare-fun e!127581 () SeekEntryResult!695)

(declare-fun lt!96548 () SeekEntryResult!695)

(assert (=> b!193895 (= e!127581 (Found!695 (index!4952 lt!96548)))))

(declare-fun b!193896 () Bool)

(declare-fun c!34967 () Bool)

(declare-fun lt!96547 () (_ BitVec 64))

(assert (=> b!193896 (= c!34967 (= lt!96547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127582 () SeekEntryResult!695)

(assert (=> b!193896 (= e!127581 e!127582)))

(declare-fun d!56491 () Bool)

(declare-fun lt!96546 () SeekEntryResult!695)

(assert (=> d!56491 (and (or ((_ is Undefined!695) lt!96546) (not ((_ is Found!695) lt!96546)) (and (bvsge (index!4951 lt!96546) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96546) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!96546) ((_ is Found!695) lt!96546) (not ((_ is MissingZero!695) lt!96546)) (and (bvsge (index!4950 lt!96546) #b00000000000000000000000000000000) (bvslt (index!4950 lt!96546) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!96546) ((_ is Found!695) lt!96546) ((_ is MissingZero!695) lt!96546) (not ((_ is MissingVacant!695) lt!96546)) (and (bvsge (index!4953 lt!96546) #b00000000000000000000000000000000) (bvslt (index!4953 lt!96546) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!96546) (ite ((_ is Found!695) lt!96546) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96546)) key!828) (ite ((_ is MissingZero!695) lt!96546) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4950 lt!96546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!695) lt!96546) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4953 lt!96546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!127583 () SeekEntryResult!695)

(assert (=> d!56491 (= lt!96546 e!127583)))

(declare-fun c!34968 () Bool)

(assert (=> d!56491 (= c!34968 (and ((_ is Intermediate!695) lt!96548) (undefined!1507 lt!96548)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8209 (_ BitVec 32)) SeekEntryResult!695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56491 (= lt!96548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9221 thiss!1248)) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!56491 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56491 (= (seekEntryOrOpen!0 key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) lt!96546)))

(declare-fun b!193897 () Bool)

(assert (=> b!193897 (= e!127583 e!127581)))

(assert (=> b!193897 (= lt!96547 (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!96548)))))

(declare-fun c!34966 () Bool)

(assert (=> b!193897 (= c!34966 (= lt!96547 key!828))))

(declare-fun b!193898 () Bool)

(assert (=> b!193898 (= e!127582 (MissingZero!695 (index!4952 lt!96548)))))

(declare-fun b!193899 () Bool)

(assert (=> b!193899 (= e!127583 Undefined!695)))

(declare-fun b!193900 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8209 (_ BitVec 32)) SeekEntryResult!695)

(assert (=> b!193900 (= e!127582 (seekKeyOrZeroReturnVacant!0 (x!20690 lt!96548) (index!4952 lt!96548) (index!4952 lt!96548) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(assert (= (and d!56491 c!34968) b!193899))

(assert (= (and d!56491 (not c!34968)) b!193897))

(assert (= (and b!193897 c!34966) b!193895))

(assert (= (and b!193897 (not c!34966)) b!193896))

(assert (= (and b!193896 c!34967) b!193898))

(assert (= (and b!193896 (not c!34967)) b!193900))

(declare-fun m!220201 () Bool)

(assert (=> d!56491 m!220201))

(declare-fun m!220203 () Bool)

(assert (=> d!56491 m!220203))

(declare-fun m!220205 () Bool)

(assert (=> d!56491 m!220205))

(assert (=> d!56491 m!220203))

(declare-fun m!220207 () Bool)

(assert (=> d!56491 m!220207))

(declare-fun m!220209 () Bool)

(assert (=> d!56491 m!220209))

(declare-fun m!220211 () Bool)

(assert (=> d!56491 m!220211))

(declare-fun m!220213 () Bool)

(assert (=> b!193897 m!220213))

(declare-fun m!220215 () Bool)

(assert (=> b!193900 m!220215))

(assert (=> b!193801 d!56491))

(declare-fun d!56493 () Bool)

(declare-fun e!127589 () Bool)

(assert (=> d!56493 e!127589))

(declare-fun res!91613 () Bool)

(assert (=> d!56493 (=> res!91613 e!127589)))

(declare-fun lt!96559 () Bool)

(assert (=> d!56493 (= res!91613 (not lt!96559))))

(declare-fun lt!96560 () Bool)

(assert (=> d!56493 (= lt!96559 lt!96560)))

(declare-fun lt!96558 () Unit!5819)

(declare-fun e!127588 () Unit!5819)

(assert (=> d!56493 (= lt!96558 e!127588)))

(declare-fun c!34971 () Bool)

(assert (=> d!56493 (= c!34971 lt!96560)))

(declare-fun containsKey!247 (List!2426 (_ BitVec 64)) Bool)

(assert (=> d!56493 (= lt!96560 (containsKey!247 (toList!1225 lt!96453) key!828))))

(assert (=> d!56493 (= (contains!1356 lt!96453 key!828) lt!96559)))

(declare-fun b!193907 () Bool)

(declare-fun lt!96557 () Unit!5819)

(assert (=> b!193907 (= e!127588 lt!96557)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!196 (List!2426 (_ BitVec 64)) Unit!5819)

(assert (=> b!193907 (= lt!96557 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96453) key!828))))

(declare-datatypes ((Option!249 0))(
  ( (Some!248 (v!4250 V!5633)) (None!247) )
))
(declare-fun isDefined!197 (Option!249) Bool)

(declare-fun getValueByKey!243 (List!2426 (_ BitVec 64)) Option!249)

(assert (=> b!193907 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96453) key!828))))

(declare-fun b!193908 () Bool)

(declare-fun Unit!5828 () Unit!5819)

(assert (=> b!193908 (= e!127588 Unit!5828)))

(declare-fun b!193909 () Bool)

(assert (=> b!193909 (= e!127589 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96453) key!828)))))

(assert (= (and d!56493 c!34971) b!193907))

(assert (= (and d!56493 (not c!34971)) b!193908))

(assert (= (and d!56493 (not res!91613)) b!193909))

(declare-fun m!220217 () Bool)

(assert (=> d!56493 m!220217))

(declare-fun m!220219 () Bool)

(assert (=> b!193907 m!220219))

(declare-fun m!220221 () Bool)

(assert (=> b!193907 m!220221))

(assert (=> b!193907 m!220221))

(declare-fun m!220223 () Bool)

(assert (=> b!193907 m!220223))

(assert (=> b!193909 m!220221))

(assert (=> b!193909 m!220221))

(assert (=> b!193909 m!220223))

(assert (=> b!193800 d!56493))

(declare-fun bm!19597 () Bool)

(declare-fun call!19602 () ListLongMap!2419)

(declare-fun call!19605 () ListLongMap!2419)

(assert (=> bm!19597 (= call!19602 call!19605)))

(declare-fun b!193952 () Bool)

(declare-fun e!127620 () ListLongMap!2419)

(declare-fun e!127625 () ListLongMap!2419)

(assert (=> b!193952 (= e!127620 e!127625)))

(declare-fun c!34984 () Bool)

(assert (=> b!193952 (= c!34984 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19598 () Bool)

(declare-fun call!19603 () ListLongMap!2419)

(declare-fun call!19606 () ListLongMap!2419)

(assert (=> bm!19598 (= call!19603 call!19606)))

(declare-fun b!193953 () Bool)

(declare-fun e!127617 () Bool)

(declare-fun lt!96610 () ListLongMap!2419)

(declare-fun apply!188 (ListLongMap!2419 (_ BitVec 64)) V!5633)

(assert (=> b!193953 (= e!127617 (= (apply!188 lt!96610 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 thiss!1248)))))

(declare-fun b!193954 () Bool)

(declare-fun res!91636 () Bool)

(declare-fun e!127619 () Bool)

(assert (=> b!193954 (=> (not res!91636) (not e!127619))))

(declare-fun e!127621 () Bool)

(assert (=> b!193954 (= res!91636 e!127621)))

(declare-fun res!91640 () Bool)

(assert (=> b!193954 (=> res!91640 e!127621)))

(declare-fun e!127618 () Bool)

(assert (=> b!193954 (= res!91640 (not e!127618))))

(declare-fun res!91639 () Bool)

(assert (=> b!193954 (=> (not res!91639) (not e!127618))))

(assert (=> b!193954 (= res!91639 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!193955 () Bool)

(declare-fun e!127622 () Unit!5819)

(declare-fun lt!96622 () Unit!5819)

(assert (=> b!193955 (= e!127622 lt!96622)))

(declare-fun lt!96617 () ListLongMap!2419)

(declare-fun getCurrentListMapNoExtraKeys!209 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) ListLongMap!2419)

(assert (=> b!193955 (= lt!96617 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96615 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96607 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96607 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96625 () Unit!5819)

(declare-fun addStillContains!164 (ListLongMap!2419 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5819)

(assert (=> b!193955 (= lt!96625 (addStillContains!164 lt!96617 lt!96615 (zeroValue!3800 thiss!1248) lt!96607))))

(assert (=> b!193955 (contains!1356 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) lt!96607)))

(declare-fun lt!96616 () Unit!5819)

(assert (=> b!193955 (= lt!96616 lt!96625)))

(declare-fun lt!96606 () ListLongMap!2419)

(assert (=> b!193955 (= lt!96606 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96609 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96609 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96621 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96621 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96612 () Unit!5819)

(declare-fun addApplyDifferent!164 (ListLongMap!2419 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5819)

(assert (=> b!193955 (= lt!96612 (addApplyDifferent!164 lt!96606 lt!96609 (minValue!3800 thiss!1248) lt!96621))))

(assert (=> b!193955 (= (apply!188 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) lt!96621) (apply!188 lt!96606 lt!96621))))

(declare-fun lt!96623 () Unit!5819)

(assert (=> b!193955 (= lt!96623 lt!96612)))

(declare-fun lt!96605 () ListLongMap!2419)

(assert (=> b!193955 (= lt!96605 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96620 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96620 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96618 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96618 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96624 () Unit!5819)

(assert (=> b!193955 (= lt!96624 (addApplyDifferent!164 lt!96605 lt!96620 (zeroValue!3800 thiss!1248) lt!96618))))

(assert (=> b!193955 (= (apply!188 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) lt!96618) (apply!188 lt!96605 lt!96618))))

(declare-fun lt!96626 () Unit!5819)

(assert (=> b!193955 (= lt!96626 lt!96624)))

(declare-fun lt!96611 () ListLongMap!2419)

(assert (=> b!193955 (= lt!96611 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96619 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96619 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96608 () (_ BitVec 64))

(assert (=> b!193955 (= lt!96608 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193955 (= lt!96622 (addApplyDifferent!164 lt!96611 lt!96619 (minValue!3800 thiss!1248) lt!96608))))

(assert (=> b!193955 (= (apply!188 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) lt!96608) (apply!188 lt!96611 lt!96608))))

(declare-fun call!19600 () ListLongMap!2419)

(declare-fun c!34989 () Bool)

(declare-fun bm!19599 () Bool)

(assert (=> bm!19599 (= call!19606 (+!317 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19600 () Bool)

(declare-fun call!19601 () Bool)

(assert (=> bm!19600 (= call!19601 (contains!1356 lt!96610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193956 () Bool)

(declare-fun Unit!5829 () Unit!5819)

(assert (=> b!193956 (= e!127622 Unit!5829)))

(declare-fun b!193957 () Bool)

(declare-fun c!34985 () Bool)

(assert (=> b!193957 (= c!34985 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127624 () ListLongMap!2419)

(assert (=> b!193957 (= e!127625 e!127624)))

(declare-fun bm!19601 () Bool)

(assert (=> bm!19601 (= call!19605 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!193958 () Bool)

(declare-fun e!127616 () Bool)

(assert (=> b!193958 (= e!127619 e!127616)))

(declare-fun c!34988 () Bool)

(assert (=> b!193958 (= c!34988 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193959 () Bool)

(declare-fun e!127627 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193959 (= e!127627 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193960 () Bool)

(declare-fun res!91634 () Bool)

(assert (=> b!193960 (=> (not res!91634) (not e!127619))))

(declare-fun e!127628 () Bool)

(assert (=> b!193960 (= res!91634 e!127628)))

(declare-fun c!34987 () Bool)

(assert (=> b!193960 (= c!34987 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193962 () Bool)

(declare-fun e!127626 () Bool)

(assert (=> b!193962 (= e!127616 e!127626)))

(declare-fun res!91633 () Bool)

(declare-fun call!19604 () Bool)

(assert (=> b!193962 (= res!91633 call!19604)))

(assert (=> b!193962 (=> (not res!91633) (not e!127626))))

(declare-fun b!193963 () Bool)

(assert (=> b!193963 (= e!127616 (not call!19604))))

(declare-fun e!127623 () Bool)

(declare-fun b!193964 () Bool)

(declare-fun get!2231 (ValueCell!1901 V!5633) V!5633)

(declare-fun dynLambda!522 (Int (_ BitVec 64)) V!5633)

(assert (=> b!193964 (= e!127623 (= (apply!188 lt!96610 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 lt!96452)))))

(assert (=> b!193964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!193965 () Bool)

(assert (=> b!193965 (= e!127620 (+!317 call!19606 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!193966 () Bool)

(assert (=> b!193966 (= e!127624 call!19600)))

(declare-fun b!193967 () Bool)

(assert (=> b!193967 (= e!127625 call!19603)))

(declare-fun bm!19602 () Bool)

(assert (=> bm!19602 (= call!19604 (contains!1356 lt!96610 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193968 () Bool)

(assert (=> b!193968 (= e!127628 (not call!19601))))

(declare-fun b!193969 () Bool)

(assert (=> b!193969 (= e!127624 call!19603)))

(declare-fun b!193970 () Bool)

(assert (=> b!193970 (= e!127628 e!127617)))

(declare-fun res!91637 () Bool)

(assert (=> b!193970 (= res!91637 call!19601)))

(assert (=> b!193970 (=> (not res!91637) (not e!127617))))

(declare-fun bm!19603 () Bool)

(assert (=> bm!19603 (= call!19600 call!19602)))

(declare-fun b!193971 () Bool)

(assert (=> b!193971 (= e!127626 (= (apply!188 lt!96610 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 thiss!1248)))))

(declare-fun b!193972 () Bool)

(assert (=> b!193972 (= e!127618 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56495 () Bool)

(assert (=> d!56495 e!127619))

(declare-fun res!91632 () Bool)

(assert (=> d!56495 (=> (not res!91632) (not e!127619))))

(assert (=> d!56495 (= res!91632 (or (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))))

(declare-fun lt!96613 () ListLongMap!2419)

(assert (=> d!56495 (= lt!96610 lt!96613)))

(declare-fun lt!96614 () Unit!5819)

(assert (=> d!56495 (= lt!96614 e!127622)))

(declare-fun c!34986 () Bool)

(assert (=> d!56495 (= c!34986 e!127627)))

(declare-fun res!91638 () Bool)

(assert (=> d!56495 (=> (not res!91638) (not e!127627))))

(assert (=> d!56495 (= res!91638 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56495 (= lt!96613 e!127620)))

(assert (=> d!56495 (= c!34989 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56495 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56495 (= (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96610)))

(declare-fun b!193961 () Bool)

(assert (=> b!193961 (= e!127621 e!127623)))

(declare-fun res!91635 () Bool)

(assert (=> b!193961 (=> (not res!91635) (not e!127623))))

(assert (=> b!193961 (= res!91635 (contains!1356 lt!96610 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (= (and d!56495 c!34989) b!193965))

(assert (= (and d!56495 (not c!34989)) b!193952))

(assert (= (and b!193952 c!34984) b!193967))

(assert (= (and b!193952 (not c!34984)) b!193957))

(assert (= (and b!193957 c!34985) b!193969))

(assert (= (and b!193957 (not c!34985)) b!193966))

(assert (= (or b!193969 b!193966) bm!19603))

(assert (= (or b!193967 bm!19603) bm!19597))

(assert (= (or b!193967 b!193969) bm!19598))

(assert (= (or b!193965 bm!19597) bm!19601))

(assert (= (or b!193965 bm!19598) bm!19599))

(assert (= (and d!56495 res!91638) b!193959))

(assert (= (and d!56495 c!34986) b!193955))

(assert (= (and d!56495 (not c!34986)) b!193956))

(assert (= (and d!56495 res!91632) b!193954))

(assert (= (and b!193954 res!91639) b!193972))

(assert (= (and b!193954 (not res!91640)) b!193961))

(assert (= (and b!193961 res!91635) b!193964))

(assert (= (and b!193954 res!91636) b!193960))

(assert (= (and b!193960 c!34987) b!193970))

(assert (= (and b!193960 (not c!34987)) b!193968))

(assert (= (and b!193970 res!91637) b!193953))

(assert (= (or b!193970 b!193968) bm!19600))

(assert (= (and b!193960 res!91634) b!193958))

(assert (= (and b!193958 c!34988) b!193962))

(assert (= (and b!193958 (not c!34988)) b!193963))

(assert (= (and b!193962 res!91633) b!193971))

(assert (= (or b!193962 b!193963) bm!19602))

(declare-fun b_lambda!7461 () Bool)

(assert (=> (not b_lambda!7461) (not b!193964)))

(declare-fun t!7347 () Bool)

(declare-fun tb!2879 () Bool)

(assert (=> (and b!193809 (= (defaultEntry!3959 thiss!1248) (defaultEntry!3959 thiss!1248)) t!7347) tb!2879))

(declare-fun result!4931 () Bool)

(assert (=> tb!2879 (= result!4931 tp_is_empty!4489)))

(assert (=> b!193964 t!7347))

(declare-fun b_and!11411 () Bool)

(assert (= b_and!11405 (and (=> t!7347 result!4931) b_and!11411)))

(declare-fun m!220225 () Bool)

(assert (=> bm!19602 m!220225))

(declare-fun m!220227 () Bool)

(assert (=> b!193971 m!220227))

(declare-fun m!220229 () Bool)

(assert (=> b!193965 m!220229))

(declare-fun m!220231 () Bool)

(assert (=> b!193972 m!220231))

(assert (=> b!193972 m!220231))

(declare-fun m!220233 () Bool)

(assert (=> b!193972 m!220233))

(declare-fun m!220235 () Bool)

(assert (=> bm!19601 m!220235))

(declare-fun m!220237 () Bool)

(assert (=> bm!19599 m!220237))

(declare-fun m!220239 () Bool)

(assert (=> b!193953 m!220239))

(assert (=> d!56495 m!220205))

(assert (=> b!193959 m!220231))

(assert (=> b!193959 m!220231))

(assert (=> b!193959 m!220233))

(declare-fun m!220241 () Bool)

(assert (=> b!193964 m!220241))

(declare-fun m!220243 () Bool)

(assert (=> b!193964 m!220243))

(declare-fun m!220245 () Bool)

(assert (=> b!193964 m!220245))

(assert (=> b!193964 m!220231))

(declare-fun m!220247 () Bool)

(assert (=> b!193964 m!220247))

(assert (=> b!193964 m!220241))

(assert (=> b!193964 m!220243))

(assert (=> b!193964 m!220231))

(assert (=> b!193961 m!220231))

(assert (=> b!193961 m!220231))

(declare-fun m!220249 () Bool)

(assert (=> b!193961 m!220249))

(declare-fun m!220251 () Bool)

(assert (=> bm!19600 m!220251))

(declare-fun m!220253 () Bool)

(assert (=> b!193955 m!220253))

(declare-fun m!220255 () Bool)

(assert (=> b!193955 m!220255))

(declare-fun m!220257 () Bool)

(assert (=> b!193955 m!220257))

(declare-fun m!220259 () Bool)

(assert (=> b!193955 m!220259))

(assert (=> b!193955 m!220253))

(assert (=> b!193955 m!220235))

(declare-fun m!220261 () Bool)

(assert (=> b!193955 m!220261))

(declare-fun m!220263 () Bool)

(assert (=> b!193955 m!220263))

(declare-fun m!220265 () Bool)

(assert (=> b!193955 m!220265))

(declare-fun m!220267 () Bool)

(assert (=> b!193955 m!220267))

(declare-fun m!220269 () Bool)

(assert (=> b!193955 m!220269))

(declare-fun m!220271 () Bool)

(assert (=> b!193955 m!220271))

(assert (=> b!193955 m!220261))

(declare-fun m!220273 () Bool)

(assert (=> b!193955 m!220273))

(assert (=> b!193955 m!220265))

(declare-fun m!220275 () Bool)

(assert (=> b!193955 m!220275))

(assert (=> b!193955 m!220257))

(declare-fun m!220277 () Bool)

(assert (=> b!193955 m!220277))

(declare-fun m!220279 () Bool)

(assert (=> b!193955 m!220279))

(assert (=> b!193955 m!220231))

(declare-fun m!220281 () Bool)

(assert (=> b!193955 m!220281))

(assert (=> b!193800 d!56495))

(declare-fun bm!19604 () Bool)

(declare-fun call!19609 () ListLongMap!2419)

(declare-fun call!19612 () ListLongMap!2419)

(assert (=> bm!19604 (= call!19609 call!19612)))

(declare-fun b!193975 () Bool)

(declare-fun e!127633 () ListLongMap!2419)

(declare-fun e!127638 () ListLongMap!2419)

(assert (=> b!193975 (= e!127633 e!127638)))

(declare-fun c!34990 () Bool)

(assert (=> b!193975 (= c!34990 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19605 () Bool)

(declare-fun call!19610 () ListLongMap!2419)

(declare-fun call!19613 () ListLongMap!2419)

(assert (=> bm!19605 (= call!19610 call!19613)))

(declare-fun b!193976 () Bool)

(declare-fun e!127630 () Bool)

(declare-fun lt!96632 () ListLongMap!2419)

(assert (=> b!193976 (= e!127630 (= (apply!188 lt!96632 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 thiss!1248)))))

(declare-fun b!193977 () Bool)

(declare-fun res!91645 () Bool)

(declare-fun e!127632 () Bool)

(assert (=> b!193977 (=> (not res!91645) (not e!127632))))

(declare-fun e!127634 () Bool)

(assert (=> b!193977 (= res!91645 e!127634)))

(declare-fun res!91649 () Bool)

(assert (=> b!193977 (=> res!91649 e!127634)))

(declare-fun e!127631 () Bool)

(assert (=> b!193977 (= res!91649 (not e!127631))))

(declare-fun res!91648 () Bool)

(assert (=> b!193977 (=> (not res!91648) (not e!127631))))

(assert (=> b!193977 (= res!91648 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!193978 () Bool)

(declare-fun e!127635 () Unit!5819)

(declare-fun lt!96644 () Unit!5819)

(assert (=> b!193978 (= e!127635 lt!96644)))

(declare-fun lt!96639 () ListLongMap!2419)

(assert (=> b!193978 (= lt!96639 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96637 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96629 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96629 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96647 () Unit!5819)

(assert (=> b!193978 (= lt!96647 (addStillContains!164 lt!96639 lt!96637 (zeroValue!3800 thiss!1248) lt!96629))))

(assert (=> b!193978 (contains!1356 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) lt!96629)))

(declare-fun lt!96638 () Unit!5819)

(assert (=> b!193978 (= lt!96638 lt!96647)))

(declare-fun lt!96628 () ListLongMap!2419)

(assert (=> b!193978 (= lt!96628 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96631 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96631 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96643 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96643 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96634 () Unit!5819)

(assert (=> b!193978 (= lt!96634 (addApplyDifferent!164 lt!96628 lt!96631 (minValue!3800 thiss!1248) lt!96643))))

(assert (=> b!193978 (= (apply!188 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) lt!96643) (apply!188 lt!96628 lt!96643))))

(declare-fun lt!96645 () Unit!5819)

(assert (=> b!193978 (= lt!96645 lt!96634)))

(declare-fun lt!96627 () ListLongMap!2419)

(assert (=> b!193978 (= lt!96627 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96642 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96640 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96640 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96646 () Unit!5819)

(assert (=> b!193978 (= lt!96646 (addApplyDifferent!164 lt!96627 lt!96642 (zeroValue!3800 thiss!1248) lt!96640))))

(assert (=> b!193978 (= (apply!188 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) lt!96640) (apply!188 lt!96627 lt!96640))))

(declare-fun lt!96648 () Unit!5819)

(assert (=> b!193978 (= lt!96648 lt!96646)))

(declare-fun lt!96633 () ListLongMap!2419)

(assert (=> b!193978 (= lt!96633 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96641 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96641 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96630 () (_ BitVec 64))

(assert (=> b!193978 (= lt!96630 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193978 (= lt!96644 (addApplyDifferent!164 lt!96633 lt!96641 (minValue!3800 thiss!1248) lt!96630))))

(assert (=> b!193978 (= (apply!188 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) lt!96630) (apply!188 lt!96633 lt!96630))))

(declare-fun call!19607 () ListLongMap!2419)

(declare-fun bm!19606 () Bool)

(declare-fun c!34995 () Bool)

(assert (=> bm!19606 (= call!19613 (+!317 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19607 () Bool)

(declare-fun call!19608 () Bool)

(assert (=> bm!19607 (= call!19608 (contains!1356 lt!96632 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193979 () Bool)

(declare-fun Unit!5830 () Unit!5819)

(assert (=> b!193979 (= e!127635 Unit!5830)))

(declare-fun b!193980 () Bool)

(declare-fun c!34991 () Bool)

(assert (=> b!193980 (= c!34991 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127637 () ListLongMap!2419)

(assert (=> b!193980 (= e!127638 e!127637)))

(declare-fun bm!19608 () Bool)

(assert (=> bm!19608 (= call!19612 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!193981 () Bool)

(declare-fun e!127629 () Bool)

(assert (=> b!193981 (= e!127632 e!127629)))

(declare-fun c!34994 () Bool)

(assert (=> b!193981 (= c!34994 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193982 () Bool)

(declare-fun e!127640 () Bool)

(assert (=> b!193982 (= e!127640 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193983 () Bool)

(declare-fun res!91643 () Bool)

(assert (=> b!193983 (=> (not res!91643) (not e!127632))))

(declare-fun e!127641 () Bool)

(assert (=> b!193983 (= res!91643 e!127641)))

(declare-fun c!34993 () Bool)

(assert (=> b!193983 (= c!34993 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193985 () Bool)

(declare-fun e!127639 () Bool)

(assert (=> b!193985 (= e!127629 e!127639)))

(declare-fun res!91642 () Bool)

(declare-fun call!19611 () Bool)

(assert (=> b!193985 (= res!91642 call!19611)))

(assert (=> b!193985 (=> (not res!91642) (not e!127639))))

(declare-fun b!193986 () Bool)

(assert (=> b!193986 (= e!127629 (not call!19611))))

(declare-fun b!193987 () Bool)

(declare-fun e!127636 () Bool)

(assert (=> b!193987 (= e!127636 (= (apply!188 lt!96632 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (_values!3942 thiss!1248))))))

(assert (=> b!193987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!193988 () Bool)

(assert (=> b!193988 (= e!127633 (+!317 call!19613 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!193989 () Bool)

(assert (=> b!193989 (= e!127637 call!19607)))

(declare-fun b!193990 () Bool)

(assert (=> b!193990 (= e!127638 call!19610)))

(declare-fun bm!19609 () Bool)

(assert (=> bm!19609 (= call!19611 (contains!1356 lt!96632 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193991 () Bool)

(assert (=> b!193991 (= e!127641 (not call!19608))))

(declare-fun b!193992 () Bool)

(assert (=> b!193992 (= e!127637 call!19610)))

(declare-fun b!193993 () Bool)

(assert (=> b!193993 (= e!127641 e!127630)))

(declare-fun res!91646 () Bool)

(assert (=> b!193993 (= res!91646 call!19608)))

(assert (=> b!193993 (=> (not res!91646) (not e!127630))))

(declare-fun bm!19610 () Bool)

(assert (=> bm!19610 (= call!19607 call!19609)))

(declare-fun b!193994 () Bool)

(assert (=> b!193994 (= e!127639 (= (apply!188 lt!96632 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 thiss!1248)))))

(declare-fun b!193995 () Bool)

(assert (=> b!193995 (= e!127631 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56497 () Bool)

(assert (=> d!56497 e!127632))

(declare-fun res!91641 () Bool)

(assert (=> d!56497 (=> (not res!91641) (not e!127632))))

(assert (=> d!56497 (= res!91641 (or (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))))

(declare-fun lt!96635 () ListLongMap!2419)

(assert (=> d!56497 (= lt!96632 lt!96635)))

(declare-fun lt!96636 () Unit!5819)

(assert (=> d!56497 (= lt!96636 e!127635)))

(declare-fun c!34992 () Bool)

(assert (=> d!56497 (= c!34992 e!127640)))

(declare-fun res!91647 () Bool)

(assert (=> d!56497 (=> (not res!91647) (not e!127640))))

(assert (=> d!56497 (= res!91647 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56497 (= lt!96635 e!127633)))

(assert (=> d!56497 (= c!34995 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56497 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56497 (= (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96632)))

(declare-fun b!193984 () Bool)

(assert (=> b!193984 (= e!127634 e!127636)))

(declare-fun res!91644 () Bool)

(assert (=> b!193984 (=> (not res!91644) (not e!127636))))

(assert (=> b!193984 (= res!91644 (contains!1356 lt!96632 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (= (and d!56497 c!34995) b!193988))

(assert (= (and d!56497 (not c!34995)) b!193975))

(assert (= (and b!193975 c!34990) b!193990))

(assert (= (and b!193975 (not c!34990)) b!193980))

(assert (= (and b!193980 c!34991) b!193992))

(assert (= (and b!193980 (not c!34991)) b!193989))

(assert (= (or b!193992 b!193989) bm!19610))

(assert (= (or b!193990 bm!19610) bm!19604))

(assert (= (or b!193990 b!193992) bm!19605))

(assert (= (or b!193988 bm!19604) bm!19608))

(assert (= (or b!193988 bm!19605) bm!19606))

(assert (= (and d!56497 res!91647) b!193982))

(assert (= (and d!56497 c!34992) b!193978))

(assert (= (and d!56497 (not c!34992)) b!193979))

(assert (= (and d!56497 res!91641) b!193977))

(assert (= (and b!193977 res!91648) b!193995))

(assert (= (and b!193977 (not res!91649)) b!193984))

(assert (= (and b!193984 res!91644) b!193987))

(assert (= (and b!193977 res!91645) b!193983))

(assert (= (and b!193983 c!34993) b!193993))

(assert (= (and b!193983 (not c!34993)) b!193991))

(assert (= (and b!193993 res!91646) b!193976))

(assert (= (or b!193993 b!193991) bm!19607))

(assert (= (and b!193983 res!91643) b!193981))

(assert (= (and b!193981 c!34994) b!193985))

(assert (= (and b!193981 (not c!34994)) b!193986))

(assert (= (and b!193985 res!91642) b!193994))

(assert (= (or b!193985 b!193986) bm!19609))

(declare-fun b_lambda!7463 () Bool)

(assert (=> (not b_lambda!7463) (not b!193987)))

(assert (=> b!193987 t!7347))

(declare-fun b_and!11413 () Bool)

(assert (= b_and!11411 (and (=> t!7347 result!4931) b_and!11413)))

(declare-fun m!220283 () Bool)

(assert (=> bm!19609 m!220283))

(declare-fun m!220285 () Bool)

(assert (=> b!193994 m!220285))

(declare-fun m!220287 () Bool)

(assert (=> b!193988 m!220287))

(assert (=> b!193995 m!220231))

(assert (=> b!193995 m!220231))

(assert (=> b!193995 m!220233))

(declare-fun m!220289 () Bool)

(assert (=> bm!19608 m!220289))

(declare-fun m!220291 () Bool)

(assert (=> bm!19606 m!220291))

(declare-fun m!220293 () Bool)

(assert (=> b!193976 m!220293))

(assert (=> d!56497 m!220205))

(assert (=> b!193982 m!220231))

(assert (=> b!193982 m!220231))

(assert (=> b!193982 m!220233))

(declare-fun m!220295 () Bool)

(assert (=> b!193987 m!220295))

(assert (=> b!193987 m!220243))

(declare-fun m!220297 () Bool)

(assert (=> b!193987 m!220297))

(assert (=> b!193987 m!220231))

(declare-fun m!220299 () Bool)

(assert (=> b!193987 m!220299))

(assert (=> b!193987 m!220295))

(assert (=> b!193987 m!220243))

(assert (=> b!193987 m!220231))

(assert (=> b!193984 m!220231))

(assert (=> b!193984 m!220231))

(declare-fun m!220301 () Bool)

(assert (=> b!193984 m!220301))

(declare-fun m!220303 () Bool)

(assert (=> bm!19607 m!220303))

(declare-fun m!220305 () Bool)

(assert (=> b!193978 m!220305))

(declare-fun m!220307 () Bool)

(assert (=> b!193978 m!220307))

(declare-fun m!220309 () Bool)

(assert (=> b!193978 m!220309))

(declare-fun m!220311 () Bool)

(assert (=> b!193978 m!220311))

(assert (=> b!193978 m!220305))

(assert (=> b!193978 m!220289))

(declare-fun m!220313 () Bool)

(assert (=> b!193978 m!220313))

(declare-fun m!220315 () Bool)

(assert (=> b!193978 m!220315))

(declare-fun m!220317 () Bool)

(assert (=> b!193978 m!220317))

(declare-fun m!220319 () Bool)

(assert (=> b!193978 m!220319))

(declare-fun m!220321 () Bool)

(assert (=> b!193978 m!220321))

(declare-fun m!220323 () Bool)

(assert (=> b!193978 m!220323))

(assert (=> b!193978 m!220313))

(declare-fun m!220325 () Bool)

(assert (=> b!193978 m!220325))

(assert (=> b!193978 m!220317))

(declare-fun m!220327 () Bool)

(assert (=> b!193978 m!220327))

(assert (=> b!193978 m!220309))

(declare-fun m!220329 () Bool)

(assert (=> b!193978 m!220329))

(declare-fun m!220331 () Bool)

(assert (=> b!193978 m!220331))

(assert (=> b!193978 m!220231))

(declare-fun m!220333 () Bool)

(assert (=> b!193978 m!220333))

(assert (=> b!193800 d!56497))

(declare-fun d!56499 () Bool)

(declare-fun e!127644 () Bool)

(assert (=> d!56499 e!127644))

(declare-fun res!91652 () Bool)

(assert (=> d!56499 (=> (not res!91652) (not e!127644))))

(assert (=> d!56499 (= res!91652 (and (bvsge (index!4951 lt!96450) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96450) (size!4188 (_values!3942 thiss!1248)))))))

(declare-fun lt!96651 () Unit!5819)

(declare-fun choose!1070 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) (_ BitVec 64) V!5633 Int) Unit!5819)

(assert (=> d!56499 (= lt!96651 (choose!1070 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) key!828 v!309 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56499 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56499 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!133 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) key!828 v!309 (defaultEntry!3959 thiss!1248)) lt!96651)))

(declare-fun b!193998 () Bool)

(assert (=> b!193998 (= e!127644 (= (+!317 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (tuple2!3511 key!828 v!309)) (getCurrentListMap!858 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!56499 res!91652) b!193998))

(declare-fun m!220335 () Bool)

(assert (=> d!56499 m!220335))

(assert (=> d!56499 m!220205))

(assert (=> b!193998 m!220095))

(assert (=> b!193998 m!220095))

(declare-fun m!220337 () Bool)

(assert (=> b!193998 m!220337))

(assert (=> b!193998 m!220101))

(declare-fun m!220339 () Bool)

(assert (=> b!193998 m!220339))

(assert (=> b!193800 d!56499))

(declare-fun d!56501 () Bool)

(declare-fun res!91659 () Bool)

(declare-fun e!127647 () Bool)

(assert (=> d!56501 (=> (not res!91659) (not e!127647))))

(declare-fun simpleValid!204 (LongMapFixedSize!2710) Bool)

(assert (=> d!56501 (= res!91659 (simpleValid!204 lt!96455))))

(assert (=> d!56501 (= (valid!1128 lt!96455) e!127647)))

(declare-fun b!194005 () Bool)

(declare-fun res!91660 () Bool)

(assert (=> b!194005 (=> (not res!91660) (not e!127647))))

(declare-fun arrayCountValidKeys!0 (array!8209 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!194005 (= res!91660 (= (arrayCountValidKeys!0 (_keys!5952 lt!96455) #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))) (_size!1404 lt!96455)))))

(declare-fun b!194006 () Bool)

(declare-fun res!91661 () Bool)

(assert (=> b!194006 (=> (not res!91661) (not e!127647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8209 (_ BitVec 32)) Bool)

(assert (=> b!194006 (= res!91661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5952 lt!96455) (mask!9221 lt!96455)))))

(declare-fun b!194007 () Bool)

(declare-datatypes ((List!2429 0))(
  ( (Nil!2426) (Cons!2425 (h!3066 (_ BitVec 64)) (t!7348 List!2429)) )
))
(declare-fun arrayNoDuplicates!0 (array!8209 (_ BitVec 32) List!2429) Bool)

(assert (=> b!194007 (= e!127647 (arrayNoDuplicates!0 (_keys!5952 lt!96455) #b00000000000000000000000000000000 Nil!2426))))

(assert (= (and d!56501 res!91659) b!194005))

(assert (= (and b!194005 res!91660) b!194006))

(assert (= (and b!194006 res!91661) b!194007))

(declare-fun m!220341 () Bool)

(assert (=> d!56501 m!220341))

(declare-fun m!220343 () Bool)

(assert (=> b!194005 m!220343))

(declare-fun m!220345 () Bool)

(assert (=> b!194006 m!220345))

(declare-fun m!220347 () Bool)

(assert (=> b!194007 m!220347))

(assert (=> b!193800 d!56501))

(declare-fun d!56503 () Bool)

(declare-fun e!127650 () Bool)

(assert (=> d!56503 e!127650))

(declare-fun res!91664 () Bool)

(assert (=> d!56503 (=> (not res!91664) (not e!127650))))

(assert (=> d!56503 (= res!91664 (and (bvsge (index!4951 lt!96450) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96450) (size!4187 (_keys!5952 thiss!1248)))))))

(declare-fun lt!96654 () Unit!5819)

(declare-fun choose!1071 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) Unit!5819)

(assert (=> d!56503 (= lt!96654 (choose!1071 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56503 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56503 (= (lemmaValidKeyInArrayIsInListMap!143 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) (defaultEntry!3959 thiss!1248)) lt!96654)))

(declare-fun b!194010 () Bool)

(assert (=> b!194010 (= e!127650 (contains!1356 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (= (and d!56503 res!91664) b!194010))

(declare-fun m!220349 () Bool)

(assert (=> d!56503 m!220349))

(assert (=> d!56503 m!220205))

(assert (=> b!194010 m!220103))

(assert (=> b!194010 m!220093))

(assert (=> b!194010 m!220103))

(assert (=> b!194010 m!220093))

(declare-fun m!220351 () Bool)

(assert (=> b!194010 m!220351))

(assert (=> b!193800 d!56503))

(declare-fun d!56505 () Bool)

(declare-fun e!127653 () Bool)

(assert (=> d!56505 e!127653))

(declare-fun res!91669 () Bool)

(assert (=> d!56505 (=> (not res!91669) (not e!127653))))

(declare-fun lt!96663 () ListLongMap!2419)

(assert (=> d!56505 (= res!91669 (contains!1356 lt!96663 (_1!1766 lt!96460)))))

(declare-fun lt!96665 () List!2426)

(assert (=> d!56505 (= lt!96663 (ListLongMap!2420 lt!96665))))

(declare-fun lt!96666 () Unit!5819)

(declare-fun lt!96664 () Unit!5819)

(assert (=> d!56505 (= lt!96666 lt!96664)))

(assert (=> d!56505 (= (getValueByKey!243 lt!96665 (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460)))))

(declare-fun lemmaContainsTupThenGetReturnValue!133 (List!2426 (_ BitVec 64) V!5633) Unit!5819)

(assert (=> d!56505 (= lt!96664 (lemmaContainsTupThenGetReturnValue!133 lt!96665 (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun insertStrictlySorted!136 (List!2426 (_ BitVec 64) V!5633) List!2426)

(assert (=> d!56505 (= lt!96665 (insertStrictlySorted!136 (toList!1225 lt!96453) (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(assert (=> d!56505 (= (+!317 lt!96453 lt!96460) lt!96663)))

(declare-fun b!194015 () Bool)

(declare-fun res!91670 () Bool)

(assert (=> b!194015 (=> (not res!91670) (not e!127653))))

(assert (=> b!194015 (= res!91670 (= (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460))))))

(declare-fun b!194016 () Bool)

(declare-fun contains!1359 (List!2426 tuple2!3510) Bool)

(assert (=> b!194016 (= e!127653 (contains!1359 (toList!1225 lt!96663) lt!96460))))

(assert (= (and d!56505 res!91669) b!194015))

(assert (= (and b!194015 res!91670) b!194016))

(declare-fun m!220353 () Bool)

(assert (=> d!56505 m!220353))

(declare-fun m!220355 () Bool)

(assert (=> d!56505 m!220355))

(declare-fun m!220357 () Bool)

(assert (=> d!56505 m!220357))

(declare-fun m!220359 () Bool)

(assert (=> d!56505 m!220359))

(declare-fun m!220361 () Bool)

(assert (=> b!194015 m!220361))

(declare-fun m!220363 () Bool)

(assert (=> b!194016 m!220363))

(assert (=> b!193800 d!56505))

(declare-fun d!56507 () Bool)

(declare-fun e!127655 () Bool)

(assert (=> d!56507 e!127655))

(declare-fun res!91671 () Bool)

(assert (=> d!56507 (=> res!91671 e!127655)))

(declare-fun lt!96669 () Bool)

(assert (=> d!56507 (= res!91671 (not lt!96669))))

(declare-fun lt!96670 () Bool)

(assert (=> d!56507 (= lt!96669 lt!96670)))

(declare-fun lt!96668 () Unit!5819)

(declare-fun e!127654 () Unit!5819)

(assert (=> d!56507 (= lt!96668 e!127654)))

(declare-fun c!34996 () Bool)

(assert (=> d!56507 (= c!34996 lt!96670)))

(assert (=> d!56507 (= lt!96670 (containsKey!247 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (=> d!56507 (= (contains!1356 lt!96451 (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) lt!96669)))

(declare-fun b!194017 () Bool)

(declare-fun lt!96667 () Unit!5819)

(assert (=> b!194017 (= e!127654 lt!96667)))

(assert (=> b!194017 (= lt!96667 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (=> b!194017 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun b!194018 () Bool)

(declare-fun Unit!5831 () Unit!5819)

(assert (=> b!194018 (= e!127654 Unit!5831)))

(declare-fun b!194019 () Bool)

(assert (=> b!194019 (= e!127655 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(assert (= (and d!56507 c!34996) b!194017))

(assert (= (and d!56507 (not c!34996)) b!194018))

(assert (= (and d!56507 (not res!91671)) b!194019))

(assert (=> d!56507 m!220093))

(declare-fun m!220365 () Bool)

(assert (=> d!56507 m!220365))

(assert (=> b!194017 m!220093))

(declare-fun m!220367 () Bool)

(assert (=> b!194017 m!220367))

(assert (=> b!194017 m!220093))

(declare-fun m!220369 () Bool)

(assert (=> b!194017 m!220369))

(assert (=> b!194017 m!220369))

(declare-fun m!220371 () Bool)

(assert (=> b!194017 m!220371))

(assert (=> b!194019 m!220093))

(assert (=> b!194019 m!220369))

(assert (=> b!194019 m!220369))

(assert (=> b!194019 m!220371))

(assert (=> b!193800 d!56507))

(declare-fun d!56509 () Bool)

(declare-fun res!91672 () Bool)

(declare-fun e!127656 () Bool)

(assert (=> d!56509 (=> (not res!91672) (not e!127656))))

(assert (=> d!56509 (= res!91672 (simpleValid!204 thiss!1248))))

(assert (=> d!56509 (= (valid!1128 thiss!1248) e!127656)))

(declare-fun b!194020 () Bool)

(declare-fun res!91673 () Bool)

(assert (=> b!194020 (=> (not res!91673) (not e!127656))))

(assert (=> b!194020 (= res!91673 (= (arrayCountValidKeys!0 (_keys!5952 thiss!1248) #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))) (_size!1404 thiss!1248)))))

(declare-fun b!194021 () Bool)

(declare-fun res!91674 () Bool)

(assert (=> b!194021 (=> (not res!91674) (not e!127656))))

(assert (=> b!194021 (= res!91674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun b!194022 () Bool)

(assert (=> b!194022 (= e!127656 (arrayNoDuplicates!0 (_keys!5952 thiss!1248) #b00000000000000000000000000000000 Nil!2426))))

(assert (= (and d!56509 res!91672) b!194020))

(assert (= (and b!194020 res!91673) b!194021))

(assert (= (and b!194021 res!91674) b!194022))

(declare-fun m!220373 () Bool)

(assert (=> d!56509 m!220373))

(declare-fun m!220375 () Bool)

(assert (=> b!194020 m!220375))

(declare-fun m!220377 () Bool)

(assert (=> b!194021 m!220377))

(declare-fun m!220379 () Bool)

(assert (=> b!194022 m!220379))

(assert (=> start!19800 d!56509))

(declare-fun d!56511 () Bool)

(assert (=> d!56511 (= (array_inv!2505 (_keys!5952 thiss!1248)) (bvsge (size!4187 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193809 d!56511))

(declare-fun d!56513 () Bool)

(assert (=> d!56513 (= (array_inv!2506 (_values!3942 thiss!1248)) (bvsge (size!4188 (_values!3942 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193809 d!56513))

(declare-fun d!56515 () Bool)

(declare-fun e!127657 () Bool)

(assert (=> d!56515 e!127657))

(declare-fun res!91675 () Bool)

(assert (=> d!56515 (=> (not res!91675) (not e!127657))))

(declare-fun lt!96671 () ListLongMap!2419)

(assert (=> d!56515 (= res!91675 (contains!1356 lt!96671 (_1!1766 lt!96460)))))

(declare-fun lt!96673 () List!2426)

(assert (=> d!56515 (= lt!96671 (ListLongMap!2420 lt!96673))))

(declare-fun lt!96674 () Unit!5819)

(declare-fun lt!96672 () Unit!5819)

(assert (=> d!56515 (= lt!96674 lt!96672)))

(assert (=> d!56515 (= (getValueByKey!243 lt!96673 (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460)))))

(assert (=> d!56515 (= lt!96672 (lemmaContainsTupThenGetReturnValue!133 lt!96673 (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(assert (=> d!56515 (= lt!96673 (insertStrictlySorted!136 (toList!1225 (map!2007 thiss!1248)) (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(assert (=> d!56515 (= (+!317 (map!2007 thiss!1248) lt!96460) lt!96671)))

(declare-fun b!194023 () Bool)

(declare-fun res!91676 () Bool)

(assert (=> b!194023 (=> (not res!91676) (not e!127657))))

(assert (=> b!194023 (= res!91676 (= (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460))))))

(declare-fun b!194024 () Bool)

(assert (=> b!194024 (= e!127657 (contains!1359 (toList!1225 lt!96671) lt!96460))))

(assert (= (and d!56515 res!91675) b!194023))

(assert (= (and b!194023 res!91676) b!194024))

(declare-fun m!220381 () Bool)

(assert (=> d!56515 m!220381))

(declare-fun m!220383 () Bool)

(assert (=> d!56515 m!220383))

(declare-fun m!220385 () Bool)

(assert (=> d!56515 m!220385))

(declare-fun m!220387 () Bool)

(assert (=> d!56515 m!220387))

(declare-fun m!220389 () Bool)

(assert (=> b!194023 m!220389))

(declare-fun m!220391 () Bool)

(assert (=> b!194024 m!220391))

(assert (=> b!193804 d!56515))

(declare-fun d!56517 () Bool)

(assert (=> d!56517 (= (map!2007 thiss!1248) (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun bs!7701 () Bool)

(assert (= bs!7701 d!56517))

(assert (=> bs!7701 m!220095))

(assert (=> b!193804 d!56517))

(declare-fun d!56519 () Bool)

(declare-fun e!127660 () Bool)

(assert (=> d!56519 e!127660))

(declare-fun res!91682 () Bool)

(assert (=> d!56519 (=> (not res!91682) (not e!127660))))

(declare-fun lt!96680 () SeekEntryResult!695)

(assert (=> d!56519 (= res!91682 ((_ is Found!695) lt!96680))))

(assert (=> d!56519 (= lt!96680 (seekEntryOrOpen!0 key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun lt!96679 () Unit!5819)

(declare-fun choose!1072 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5819)

(assert (=> d!56519 (= lt!96679 (choose!1072 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56519 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56519 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) lt!96679)))

(declare-fun b!194029 () Bool)

(declare-fun res!91681 () Bool)

(assert (=> b!194029 (=> (not res!91681) (not e!127660))))

(assert (=> b!194029 (= res!91681 (inRange!0 (index!4951 lt!96680) (mask!9221 thiss!1248)))))

(declare-fun b!194030 () Bool)

(assert (=> b!194030 (= e!127660 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96680)) key!828))))

(assert (=> b!194030 (and (bvsge (index!4951 lt!96680) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96680) (size!4187 (_keys!5952 thiss!1248))))))

(assert (= (and d!56519 res!91682) b!194029))

(assert (= (and b!194029 res!91681) b!194030))

(assert (=> d!56519 m!220075))

(declare-fun m!220393 () Bool)

(assert (=> d!56519 m!220393))

(assert (=> d!56519 m!220205))

(declare-fun m!220395 () Bool)

(assert (=> b!194029 m!220395))

(declare-fun m!220397 () Bool)

(assert (=> b!194030 m!220397))

(assert (=> b!193799 d!56519))

(declare-fun d!56521 () Bool)

(assert (=> d!56521 (= (inRange!0 (index!4951 lt!96450) (mask!9221 thiss!1248)) (and (bvsge (index!4951 lt!96450) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96450) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193799 d!56521))

(declare-fun d!56523 () Bool)

(declare-fun e!127662 () Bool)

(assert (=> d!56523 e!127662))

(declare-fun res!91683 () Bool)

(assert (=> d!56523 (=> res!91683 e!127662)))

(declare-fun lt!96683 () Bool)

(assert (=> d!56523 (= res!91683 (not lt!96683))))

(declare-fun lt!96684 () Bool)

(assert (=> d!56523 (= lt!96683 lt!96684)))

(declare-fun lt!96682 () Unit!5819)

(declare-fun e!127661 () Unit!5819)

(assert (=> d!56523 (= lt!96682 e!127661)))

(declare-fun c!34997 () Bool)

(assert (=> d!56523 (= c!34997 lt!96684)))

(assert (=> d!56523 (= lt!96684 (containsKey!247 (toList!1225 lt!96454) key!828))))

(assert (=> d!56523 (= (contains!1356 lt!96454 key!828) lt!96683)))

(declare-fun b!194031 () Bool)

(declare-fun lt!96681 () Unit!5819)

(assert (=> b!194031 (= e!127661 lt!96681)))

(assert (=> b!194031 (= lt!96681 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96454) key!828))))

(assert (=> b!194031 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96454) key!828))))

(declare-fun b!194032 () Bool)

(declare-fun Unit!5832 () Unit!5819)

(assert (=> b!194032 (= e!127661 Unit!5832)))

(declare-fun b!194033 () Bool)

(assert (=> b!194033 (= e!127662 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96454) key!828)))))

(assert (= (and d!56523 c!34997) b!194031))

(assert (= (and d!56523 (not c!34997)) b!194032))

(assert (= (and d!56523 (not res!91683)) b!194033))

(declare-fun m!220399 () Bool)

(assert (=> d!56523 m!220399))

(declare-fun m!220401 () Bool)

(assert (=> b!194031 m!220401))

(declare-fun m!220403 () Bool)

(assert (=> b!194031 m!220403))

(assert (=> b!194031 m!220403))

(declare-fun m!220405 () Bool)

(assert (=> b!194031 m!220405))

(assert (=> b!194033 m!220403))

(assert (=> b!194033 m!220403))

(assert (=> b!194033 m!220405))

(assert (=> b!193807 d!56523))

(declare-fun d!56525 () Bool)

(assert (=> d!56525 (= (map!2007 lt!96455) (getCurrentListMap!858 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)))))

(declare-fun bs!7702 () Bool)

(assert (= bs!7702 d!56525))

(declare-fun m!220407 () Bool)

(assert (=> bs!7702 m!220407))

(assert (=> b!193807 d!56525))

(declare-fun lt!96689 () SeekEntryResult!695)

(declare-fun c!35003 () Bool)

(declare-fun call!19618 () Bool)

(declare-fun bm!19615 () Bool)

(assert (=> bm!19615 (= call!19618 (inRange!0 (ite c!35003 (index!4950 lt!96689) (index!4953 lt!96689)) (mask!9221 thiss!1248)))))

(declare-fun b!194050 () Bool)

(declare-fun e!127672 () Bool)

(declare-fun e!127674 () Bool)

(assert (=> b!194050 (= e!127672 e!127674)))

(declare-fun res!91695 () Bool)

(assert (=> b!194050 (= res!91695 call!19618)))

(assert (=> b!194050 (=> (not res!91695) (not e!127674))))

(declare-fun b!194051 () Bool)

(assert (=> b!194051 (and (bvsge (index!4950 lt!96689) #b00000000000000000000000000000000) (bvslt (index!4950 lt!96689) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!91693 () Bool)

(assert (=> b!194051 (= res!91693 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4950 lt!96689)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194051 (=> (not res!91693) (not e!127674))))

(declare-fun d!56527 () Bool)

(assert (=> d!56527 e!127672))

(assert (=> d!56527 (= c!35003 ((_ is MissingZero!695) lt!96689))))

(assert (=> d!56527 (= lt!96689 (seekEntryOrOpen!0 key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun lt!96690 () Unit!5819)

(declare-fun choose!1073 (array!8209 array!8211 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5819)

(assert (=> d!56527 (= lt!96690 (choose!1073 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56527 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56527 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!182 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) lt!96690)))

(declare-fun b!194052 () Bool)

(declare-fun res!91694 () Bool)

(declare-fun e!127673 () Bool)

(assert (=> b!194052 (=> (not res!91694) (not e!127673))))

(assert (=> b!194052 (= res!91694 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4953 lt!96689)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194052 (and (bvsge (index!4953 lt!96689) #b00000000000000000000000000000000) (bvslt (index!4953 lt!96689) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194053 () Bool)

(declare-fun e!127671 () Bool)

(assert (=> b!194053 (= e!127671 ((_ is Undefined!695) lt!96689))))

(declare-fun b!194054 () Bool)

(declare-fun call!19619 () Bool)

(assert (=> b!194054 (= e!127674 (not call!19619))))

(declare-fun b!194055 () Bool)

(assert (=> b!194055 (= e!127673 (not call!19619))))

(declare-fun b!194056 () Bool)

(assert (=> b!194056 (= e!127672 e!127671)))

(declare-fun c!35002 () Bool)

(assert (=> b!194056 (= c!35002 ((_ is MissingVacant!695) lt!96689))))

(declare-fun bm!19616 () Bool)

(declare-fun arrayContainsKey!0 (array!8209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19616 (= call!19619 (arrayContainsKey!0 (_keys!5952 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!194057 () Bool)

(declare-fun res!91692 () Bool)

(assert (=> b!194057 (=> (not res!91692) (not e!127673))))

(assert (=> b!194057 (= res!91692 call!19618)))

(assert (=> b!194057 (= e!127671 e!127673)))

(assert (= (and d!56527 c!35003) b!194050))

(assert (= (and d!56527 (not c!35003)) b!194056))

(assert (= (and b!194050 res!91695) b!194051))

(assert (= (and b!194051 res!91693) b!194054))

(assert (= (and b!194056 c!35002) b!194057))

(assert (= (and b!194056 (not c!35002)) b!194053))

(assert (= (and b!194057 res!91692) b!194052))

(assert (= (and b!194052 res!91694) b!194055))

(assert (= (or b!194050 b!194057) bm!19615))

(assert (= (or b!194054 b!194055) bm!19616))

(declare-fun m!220409 () Bool)

(assert (=> bm!19615 m!220409))

(declare-fun m!220411 () Bool)

(assert (=> bm!19616 m!220411))

(declare-fun m!220413 () Bool)

(assert (=> b!194051 m!220413))

(declare-fun m!220415 () Bool)

(assert (=> b!194052 m!220415))

(assert (=> d!56527 m!220075))

(declare-fun m!220417 () Bool)

(assert (=> d!56527 m!220417))

(assert (=> d!56527 m!220205))

(assert (=> b!193802 d!56527))

(declare-fun mapIsEmpty!7775 () Bool)

(declare-fun mapRes!7775 () Bool)

(assert (=> mapIsEmpty!7775 mapRes!7775))

(declare-fun condMapEmpty!7775 () Bool)

(declare-fun mapDefault!7775 () ValueCell!1901)

(assert (=> mapNonEmpty!7766 (= condMapEmpty!7775 (= mapRest!7766 ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7775)))))

(declare-fun e!127679 () Bool)

(assert (=> mapNonEmpty!7766 (= tp!17021 (and e!127679 mapRes!7775))))

(declare-fun b!194064 () Bool)

(declare-fun e!127680 () Bool)

(assert (=> b!194064 (= e!127680 tp_is_empty!4489)))

(declare-fun mapNonEmpty!7775 () Bool)

(declare-fun tp!17036 () Bool)

(assert (=> mapNonEmpty!7775 (= mapRes!7775 (and tp!17036 e!127680))))

(declare-fun mapRest!7775 () (Array (_ BitVec 32) ValueCell!1901))

(declare-fun mapValue!7775 () ValueCell!1901)

(declare-fun mapKey!7775 () (_ BitVec 32))

(assert (=> mapNonEmpty!7775 (= mapRest!7766 (store mapRest!7775 mapKey!7775 mapValue!7775))))

(declare-fun b!194065 () Bool)

(assert (=> b!194065 (= e!127679 tp_is_empty!4489)))

(assert (= (and mapNonEmpty!7766 condMapEmpty!7775) mapIsEmpty!7775))

(assert (= (and mapNonEmpty!7766 (not condMapEmpty!7775)) mapNonEmpty!7775))

(assert (= (and mapNonEmpty!7775 ((_ is ValueCellFull!1901) mapValue!7775)) b!194064))

(assert (= (and mapNonEmpty!7766 ((_ is ValueCellFull!1901) mapDefault!7775)) b!194065))

(declare-fun m!220419 () Bool)

(assert (=> mapNonEmpty!7775 m!220419))

(declare-fun b_lambda!7465 () Bool)

(assert (= b_lambda!7463 (or (and b!193809 b_free!4717) b_lambda!7465)))

(declare-fun b_lambda!7467 () Bool)

(assert (= b_lambda!7461 (or (and b!193809 b_free!4717) b_lambda!7467)))

(check-sat (not d!56517) (not b!194017) (not b!194023) (not b!194010) (not d!56519) (not b!194029) (not d!56499) (not bm!19606) (not d!56493) (not b!193998) (not bm!19615) (not d!56527) (not b!193965) (not bm!19616) (not d!56509) (not d!56491) (not b!193959) (not b_lambda!7465) (not bm!19609) (not b!194022) (not b_lambda!7467) (not bm!19607) (not d!56507) (not b!193995) (not b!194021) (not b!193907) (not d!56495) (not d!56501) (not b!193955) (not b!193982) tp_is_empty!4489 (not b!193953) (not b!193978) (not bm!19601) b_and!11413 (not bm!19600) (not mapNonEmpty!7775) (not b!194031) (not bm!19599) (not b!193987) (not b!193971) (not b!194015) (not b!194016) (not b!193972) (not b!194006) (not b!194033) (not b!194019) (not b!193984) (not b!193900) (not d!56515) (not b!193909) (not b!193976) (not d!56525) (not bm!19608) (not b!194007) (not b!193988) (not b!194005) (not b!193994) (not b!193964) (not b_next!4717) (not d!56497) (not bm!19602) (not d!56505) (not b!194024) (not b!193961) (not b!194020) (not d!56523) (not d!56503))
(check-sat b_and!11413 (not b_next!4717))
(get-model)

(assert (=> d!56519 d!56491))

(declare-fun d!56529 () Bool)

(declare-fun e!127683 () Bool)

(assert (=> d!56529 e!127683))

(declare-fun res!91701 () Bool)

(assert (=> d!56529 (=> (not res!91701) (not e!127683))))

(declare-fun lt!96693 () SeekEntryResult!695)

(assert (=> d!56529 (= res!91701 ((_ is Found!695) lt!96693))))

(assert (=> d!56529 (= lt!96693 (seekEntryOrOpen!0 key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(assert (=> d!56529 true))

(declare-fun _$33!150 () Unit!5819)

(assert (=> d!56529 (= (choose!1072 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) _$33!150)))

(declare-fun b!194070 () Bool)

(declare-fun res!91700 () Bool)

(assert (=> b!194070 (=> (not res!91700) (not e!127683))))

(assert (=> b!194070 (= res!91700 (inRange!0 (index!4951 lt!96693) (mask!9221 thiss!1248)))))

(declare-fun b!194071 () Bool)

(assert (=> b!194071 (= e!127683 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96693)) key!828))))

(assert (= (and d!56529 res!91701) b!194070))

(assert (= (and b!194070 res!91700) b!194071))

(assert (=> d!56529 m!220075))

(declare-fun m!220421 () Bool)

(assert (=> b!194070 m!220421))

(declare-fun m!220423 () Bool)

(assert (=> b!194071 m!220423))

(assert (=> d!56519 d!56529))

(declare-fun d!56531 () Bool)

(assert (=> d!56531 (= (validMask!0 (mask!9221 thiss!1248)) (and (or (= (mask!9221 thiss!1248) #b00000000000000000000000000000111) (= (mask!9221 thiss!1248) #b00000000000000000000000000001111) (= (mask!9221 thiss!1248) #b00000000000000000000000000011111) (= (mask!9221 thiss!1248) #b00000000000000000000000000111111) (= (mask!9221 thiss!1248) #b00000000000000000000000001111111) (= (mask!9221 thiss!1248) #b00000000000000000000000011111111) (= (mask!9221 thiss!1248) #b00000000000000000000000111111111) (= (mask!9221 thiss!1248) #b00000000000000000000001111111111) (= (mask!9221 thiss!1248) #b00000000000000000000011111111111) (= (mask!9221 thiss!1248) #b00000000000000000000111111111111) (= (mask!9221 thiss!1248) #b00000000000000000001111111111111) (= (mask!9221 thiss!1248) #b00000000000000000011111111111111) (= (mask!9221 thiss!1248) #b00000000000000000111111111111111) (= (mask!9221 thiss!1248) #b00000000000000001111111111111111) (= (mask!9221 thiss!1248) #b00000000000000011111111111111111) (= (mask!9221 thiss!1248) #b00000000000000111111111111111111) (= (mask!9221 thiss!1248) #b00000000000001111111111111111111) (= (mask!9221 thiss!1248) #b00000000000011111111111111111111) (= (mask!9221 thiss!1248) #b00000000000111111111111111111111) (= (mask!9221 thiss!1248) #b00000000001111111111111111111111) (= (mask!9221 thiss!1248) #b00000000011111111111111111111111) (= (mask!9221 thiss!1248) #b00000000111111111111111111111111) (= (mask!9221 thiss!1248) #b00000001111111111111111111111111) (= (mask!9221 thiss!1248) #b00000011111111111111111111111111) (= (mask!9221 thiss!1248) #b00000111111111111111111111111111) (= (mask!9221 thiss!1248) #b00001111111111111111111111111111) (= (mask!9221 thiss!1248) #b00011111111111111111111111111111) (= (mask!9221 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9221 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!56519 d!56531))

(declare-fun d!56533 () Bool)

(declare-fun e!127685 () Bool)

(assert (=> d!56533 e!127685))

(declare-fun res!91702 () Bool)

(assert (=> d!56533 (=> res!91702 e!127685)))

(declare-fun lt!96696 () Bool)

(assert (=> d!56533 (= res!91702 (not lt!96696))))

(declare-fun lt!96697 () Bool)

(assert (=> d!56533 (= lt!96696 lt!96697)))

(declare-fun lt!96695 () Unit!5819)

(declare-fun e!127684 () Unit!5819)

(assert (=> d!56533 (= lt!96695 e!127684)))

(declare-fun c!35004 () Bool)

(assert (=> d!56533 (= c!35004 lt!96697)))

(assert (=> d!56533 (= lt!96697 (containsKey!247 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (=> d!56533 (= (contains!1356 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) lt!96696)))

(declare-fun b!194072 () Bool)

(declare-fun lt!96694 () Unit!5819)

(assert (=> b!194072 (= e!127684 lt!96694)))

(assert (=> b!194072 (= lt!96694 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (=> b!194072 (isDefined!197 (getValueByKey!243 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun b!194073 () Bool)

(declare-fun Unit!5833 () Unit!5819)

(assert (=> b!194073 (= e!127684 Unit!5833)))

(declare-fun b!194074 () Bool)

(assert (=> b!194074 (= e!127685 (isDefined!197 (getValueByKey!243 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(assert (= (and d!56533 c!35004) b!194072))

(assert (= (and d!56533 (not c!35004)) b!194073))

(assert (= (and d!56533 (not res!91702)) b!194074))

(assert (=> d!56533 m!220093))

(declare-fun m!220425 () Bool)

(assert (=> d!56533 m!220425))

(assert (=> b!194072 m!220093))

(declare-fun m!220427 () Bool)

(assert (=> b!194072 m!220427))

(assert (=> b!194072 m!220093))

(declare-fun m!220429 () Bool)

(assert (=> b!194072 m!220429))

(assert (=> b!194072 m!220429))

(declare-fun m!220431 () Bool)

(assert (=> b!194072 m!220431))

(assert (=> b!194074 m!220093))

(assert (=> b!194074 m!220429))

(assert (=> b!194074 m!220429))

(assert (=> b!194074 m!220431))

(assert (=> b!194010 d!56533))

(assert (=> b!194010 d!56495))

(declare-fun b!194085 () Bool)

(declare-fun e!127691 () Option!249)

(assert (=> b!194085 (= e!127691 (getValueByKey!243 (t!7343 (toList!1225 lt!96671)) (_1!1766 lt!96460)))))

(declare-fun d!56535 () Bool)

(declare-fun c!35009 () Bool)

(assert (=> d!56535 (= c!35009 (and ((_ is Cons!2422) (toList!1225 lt!96671)) (= (_1!1766 (h!3063 (toList!1225 lt!96671))) (_1!1766 lt!96460))))))

(declare-fun e!127690 () Option!249)

(assert (=> d!56535 (= (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460)) e!127690)))

(declare-fun b!194083 () Bool)

(assert (=> b!194083 (= e!127690 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96671)))))))

(declare-fun b!194084 () Bool)

(assert (=> b!194084 (= e!127690 e!127691)))

(declare-fun c!35010 () Bool)

(assert (=> b!194084 (= c!35010 (and ((_ is Cons!2422) (toList!1225 lt!96671)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96671))) (_1!1766 lt!96460)))))))

(declare-fun b!194086 () Bool)

(assert (=> b!194086 (= e!127691 None!247)))

(assert (= (and d!56535 c!35009) b!194083))

(assert (= (and d!56535 (not c!35009)) b!194084))

(assert (= (and b!194084 c!35010) b!194085))

(assert (= (and b!194084 (not c!35010)) b!194086))

(declare-fun m!220433 () Bool)

(assert (=> b!194085 m!220433))

(assert (=> b!194023 d!56535))

(declare-fun d!56537 () Bool)

(declare-fun e!127693 () Bool)

(assert (=> d!56537 e!127693))

(declare-fun res!91703 () Bool)

(assert (=> d!56537 (=> res!91703 e!127693)))

(declare-fun lt!96700 () Bool)

(assert (=> d!56537 (= res!91703 (not lt!96700))))

(declare-fun lt!96701 () Bool)

(assert (=> d!56537 (= lt!96700 lt!96701)))

(declare-fun lt!96699 () Unit!5819)

(declare-fun e!127692 () Unit!5819)

(assert (=> d!56537 (= lt!96699 e!127692)))

(declare-fun c!35011 () Bool)

(assert (=> d!56537 (= c!35011 lt!96701)))

(assert (=> d!56537 (= lt!96701 (containsKey!247 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56537 (= (contains!1356 lt!96610 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!96700)))

(declare-fun b!194087 () Bool)

(declare-fun lt!96698 () Unit!5819)

(assert (=> b!194087 (= e!127692 lt!96698)))

(assert (=> b!194087 (= lt!96698 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194087 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194088 () Bool)

(declare-fun Unit!5834 () Unit!5819)

(assert (=> b!194088 (= e!127692 Unit!5834)))

(declare-fun b!194089 () Bool)

(assert (=> b!194089 (= e!127693 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56537 c!35011) b!194087))

(assert (= (and d!56537 (not c!35011)) b!194088))

(assert (= (and d!56537 (not res!91703)) b!194089))

(assert (=> d!56537 m!220231))

(declare-fun m!220435 () Bool)

(assert (=> d!56537 m!220435))

(assert (=> b!194087 m!220231))

(declare-fun m!220437 () Bool)

(assert (=> b!194087 m!220437))

(assert (=> b!194087 m!220231))

(declare-fun m!220439 () Bool)

(assert (=> b!194087 m!220439))

(assert (=> b!194087 m!220439))

(declare-fun m!220441 () Bool)

(assert (=> b!194087 m!220441))

(assert (=> b!194089 m!220231))

(assert (=> b!194089 m!220439))

(assert (=> b!194089 m!220439))

(assert (=> b!194089 m!220441))

(assert (=> b!193961 d!56537))

(declare-fun d!56539 () Bool)

(assert (=> d!56539 (= (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193995 d!56539))

(declare-fun b!194102 () Bool)

(declare-fun e!127702 () SeekEntryResult!695)

(declare-fun e!127700 () SeekEntryResult!695)

(assert (=> b!194102 (= e!127702 e!127700)))

(declare-fun c!35018 () Bool)

(declare-fun lt!96707 () (_ BitVec 64))

(assert (=> b!194102 (= c!35018 (= lt!96707 key!828))))

(declare-fun d!56541 () Bool)

(declare-fun lt!96706 () SeekEntryResult!695)

(assert (=> d!56541 (and (or ((_ is Undefined!695) lt!96706) (not ((_ is Found!695) lt!96706)) (and (bvsge (index!4951 lt!96706) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96706) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!96706) ((_ is Found!695) lt!96706) (not ((_ is MissingVacant!695) lt!96706)) (not (= (index!4953 lt!96706) (index!4952 lt!96548))) (and (bvsge (index!4953 lt!96706) #b00000000000000000000000000000000) (bvslt (index!4953 lt!96706) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!96706) (ite ((_ is Found!695) lt!96706) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96706)) key!828) (and ((_ is MissingVacant!695) lt!96706) (= (index!4953 lt!96706) (index!4952 lt!96548)) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4953 lt!96706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56541 (= lt!96706 e!127702)))

(declare-fun c!35019 () Bool)

(assert (=> d!56541 (= c!35019 (bvsge (x!20690 lt!96548) #b01111111111111111111111111111110))))

(assert (=> d!56541 (= lt!96707 (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!96548)))))

(assert (=> d!56541 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56541 (= (seekKeyOrZeroReturnVacant!0 (x!20690 lt!96548) (index!4952 lt!96548) (index!4952 lt!96548) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) lt!96706)))

(declare-fun b!194103 () Bool)

(declare-fun e!127701 () SeekEntryResult!695)

(assert (=> b!194103 (= e!127701 (MissingVacant!695 (index!4952 lt!96548)))))

(declare-fun b!194104 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!194104 (= e!127701 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20690 lt!96548) #b00000000000000000000000000000001) (nextIndex!0 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248)) (index!4952 lt!96548) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun b!194105 () Bool)

(assert (=> b!194105 (= e!127700 (Found!695 (index!4952 lt!96548)))))

(declare-fun b!194106 () Bool)

(assert (=> b!194106 (= e!127702 Undefined!695)))

(declare-fun b!194107 () Bool)

(declare-fun c!35020 () Bool)

(assert (=> b!194107 (= c!35020 (= lt!96707 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194107 (= e!127700 e!127701)))

(assert (= (and d!56541 c!35019) b!194106))

(assert (= (and d!56541 (not c!35019)) b!194102))

(assert (= (and b!194102 c!35018) b!194105))

(assert (= (and b!194102 (not c!35018)) b!194107))

(assert (= (and b!194107 c!35020) b!194103))

(assert (= (and b!194107 (not c!35020)) b!194104))

(declare-fun m!220443 () Bool)

(assert (=> d!56541 m!220443))

(declare-fun m!220445 () Bool)

(assert (=> d!56541 m!220445))

(assert (=> d!56541 m!220213))

(assert (=> d!56541 m!220205))

(declare-fun m!220447 () Bool)

(assert (=> b!194104 m!220447))

(assert (=> b!194104 m!220447))

(declare-fun m!220449 () Bool)

(assert (=> b!194104 m!220449))

(assert (=> b!193900 d!56541))

(declare-fun d!56543 () Bool)

(declare-fun e!127703 () Bool)

(assert (=> d!56543 e!127703))

(declare-fun res!91704 () Bool)

(assert (=> d!56543 (=> (not res!91704) (not e!127703))))

(declare-fun lt!96708 () ListLongMap!2419)

(assert (=> d!56543 (= res!91704 (contains!1356 lt!96708 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96710 () List!2426)

(assert (=> d!56543 (= lt!96708 (ListLongMap!2420 lt!96710))))

(declare-fun lt!96711 () Unit!5819)

(declare-fun lt!96709 () Unit!5819)

(assert (=> d!56543 (= lt!96711 lt!96709)))

(assert (=> d!56543 (= (getValueByKey!243 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56543 (= lt!96709 (lemmaContainsTupThenGetReturnValue!133 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56543 (= lt!96710 (insertStrictlySorted!136 (toList!1225 call!19606) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56543 (= (+!317 call!19606 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!96708)))

(declare-fun b!194108 () Bool)

(declare-fun res!91705 () Bool)

(assert (=> b!194108 (=> (not res!91705) (not e!127703))))

(assert (=> b!194108 (= res!91705 (= (getValueByKey!243 (toList!1225 lt!96708) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194109 () Bool)

(assert (=> b!194109 (= e!127703 (contains!1359 (toList!1225 lt!96708) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!56543 res!91704) b!194108))

(assert (= (and b!194108 res!91705) b!194109))

(declare-fun m!220451 () Bool)

(assert (=> d!56543 m!220451))

(declare-fun m!220453 () Bool)

(assert (=> d!56543 m!220453))

(declare-fun m!220455 () Bool)

(assert (=> d!56543 m!220455))

(declare-fun m!220457 () Bool)

(assert (=> d!56543 m!220457))

(declare-fun m!220459 () Bool)

(assert (=> b!194108 m!220459))

(declare-fun m!220461 () Bool)

(assert (=> b!194109 m!220461))

(assert (=> b!193965 d!56543))

(assert (=> d!56495 d!56531))

(declare-fun d!56545 () Bool)

(declare-fun e!127704 () Bool)

(assert (=> d!56545 e!127704))

(declare-fun res!91706 () Bool)

(assert (=> d!56545 (=> (not res!91706) (not e!127704))))

(declare-fun lt!96712 () ListLongMap!2419)

(assert (=> d!56545 (= res!91706 (contains!1356 lt!96712 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!96714 () List!2426)

(assert (=> d!56545 (= lt!96712 (ListLongMap!2420 lt!96714))))

(declare-fun lt!96715 () Unit!5819)

(declare-fun lt!96713 () Unit!5819)

(assert (=> d!56545 (= lt!96715 lt!96713)))

(assert (=> d!56545 (= (getValueByKey!243 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56545 (= lt!96713 (lemmaContainsTupThenGetReturnValue!133 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56545 (= lt!96714 (insertStrictlySorted!136 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56545 (= (+!317 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!96712)))

(declare-fun b!194110 () Bool)

(declare-fun res!91707 () Bool)

(assert (=> b!194110 (=> (not res!91707) (not e!127704))))

(assert (=> b!194110 (= res!91707 (= (getValueByKey!243 (toList!1225 lt!96712) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194111 () Bool)

(assert (=> b!194111 (= e!127704 (contains!1359 (toList!1225 lt!96712) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!56545 res!91706) b!194110))

(assert (= (and b!194110 res!91707) b!194111))

(declare-fun m!220463 () Bool)

(assert (=> d!56545 m!220463))

(declare-fun m!220465 () Bool)

(assert (=> d!56545 m!220465))

(declare-fun m!220467 () Bool)

(assert (=> d!56545 m!220467))

(declare-fun m!220469 () Bool)

(assert (=> d!56545 m!220469))

(declare-fun m!220471 () Bool)

(assert (=> b!194110 m!220471))

(declare-fun m!220473 () Bool)

(assert (=> b!194111 m!220473))

(assert (=> bm!19606 d!56545))

(declare-fun d!56547 () Bool)

(declare-fun e!127706 () Bool)

(assert (=> d!56547 e!127706))

(declare-fun res!91708 () Bool)

(assert (=> d!56547 (=> res!91708 e!127706)))

(declare-fun lt!96718 () Bool)

(assert (=> d!56547 (= res!91708 (not lt!96718))))

(declare-fun lt!96719 () Bool)

(assert (=> d!56547 (= lt!96718 lt!96719)))

(declare-fun lt!96717 () Unit!5819)

(declare-fun e!127705 () Unit!5819)

(assert (=> d!56547 (= lt!96717 e!127705)))

(declare-fun c!35021 () Bool)

(assert (=> d!56547 (= c!35021 lt!96719)))

(assert (=> d!56547 (= lt!96719 (containsKey!247 (toList!1225 lt!96663) (_1!1766 lt!96460)))))

(assert (=> d!56547 (= (contains!1356 lt!96663 (_1!1766 lt!96460)) lt!96718)))

(declare-fun b!194112 () Bool)

(declare-fun lt!96716 () Unit!5819)

(assert (=> b!194112 (= e!127705 lt!96716)))

(assert (=> b!194112 (= lt!96716 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96663) (_1!1766 lt!96460)))))

(assert (=> b!194112 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460)))))

(declare-fun b!194113 () Bool)

(declare-fun Unit!5835 () Unit!5819)

(assert (=> b!194113 (= e!127705 Unit!5835)))

(declare-fun b!194114 () Bool)

(assert (=> b!194114 (= e!127706 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460))))))

(assert (= (and d!56547 c!35021) b!194112))

(assert (= (and d!56547 (not c!35021)) b!194113))

(assert (= (and d!56547 (not res!91708)) b!194114))

(declare-fun m!220475 () Bool)

(assert (=> d!56547 m!220475))

(declare-fun m!220477 () Bool)

(assert (=> b!194112 m!220477))

(assert (=> b!194112 m!220361))

(assert (=> b!194112 m!220361))

(declare-fun m!220479 () Bool)

(assert (=> b!194112 m!220479))

(assert (=> b!194114 m!220361))

(assert (=> b!194114 m!220361))

(assert (=> b!194114 m!220479))

(assert (=> d!56505 d!56547))

(declare-fun b!194117 () Bool)

(declare-fun e!127708 () Option!249)

(assert (=> b!194117 (= e!127708 (getValueByKey!243 (t!7343 lt!96665) (_1!1766 lt!96460)))))

(declare-fun d!56549 () Bool)

(declare-fun c!35022 () Bool)

(assert (=> d!56549 (= c!35022 (and ((_ is Cons!2422) lt!96665) (= (_1!1766 (h!3063 lt!96665)) (_1!1766 lt!96460))))))

(declare-fun e!127707 () Option!249)

(assert (=> d!56549 (= (getValueByKey!243 lt!96665 (_1!1766 lt!96460)) e!127707)))

(declare-fun b!194115 () Bool)

(assert (=> b!194115 (= e!127707 (Some!248 (_2!1766 (h!3063 lt!96665))))))

(declare-fun b!194116 () Bool)

(assert (=> b!194116 (= e!127707 e!127708)))

(declare-fun c!35023 () Bool)

(assert (=> b!194116 (= c!35023 (and ((_ is Cons!2422) lt!96665) (not (= (_1!1766 (h!3063 lt!96665)) (_1!1766 lt!96460)))))))

(declare-fun b!194118 () Bool)

(assert (=> b!194118 (= e!127708 None!247)))

(assert (= (and d!56549 c!35022) b!194115))

(assert (= (and d!56549 (not c!35022)) b!194116))

(assert (= (and b!194116 c!35023) b!194117))

(assert (= (and b!194116 (not c!35023)) b!194118))

(declare-fun m!220481 () Bool)

(assert (=> b!194117 m!220481))

(assert (=> d!56505 d!56549))

(declare-fun d!56551 () Bool)

(assert (=> d!56551 (= (getValueByKey!243 lt!96665 (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460)))))

(declare-fun lt!96722 () Unit!5819)

(declare-fun choose!1074 (List!2426 (_ BitVec 64) V!5633) Unit!5819)

(assert (=> d!56551 (= lt!96722 (choose!1074 lt!96665 (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun e!127711 () Bool)

(assert (=> d!56551 e!127711))

(declare-fun res!91713 () Bool)

(assert (=> d!56551 (=> (not res!91713) (not e!127711))))

(declare-fun isStrictlySorted!352 (List!2426) Bool)

(assert (=> d!56551 (= res!91713 (isStrictlySorted!352 lt!96665))))

(assert (=> d!56551 (= (lemmaContainsTupThenGetReturnValue!133 lt!96665 (_1!1766 lt!96460) (_2!1766 lt!96460)) lt!96722)))

(declare-fun b!194123 () Bool)

(declare-fun res!91714 () Bool)

(assert (=> b!194123 (=> (not res!91714) (not e!127711))))

(assert (=> b!194123 (= res!91714 (containsKey!247 lt!96665 (_1!1766 lt!96460)))))

(declare-fun b!194124 () Bool)

(assert (=> b!194124 (= e!127711 (contains!1359 lt!96665 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(assert (= (and d!56551 res!91713) b!194123))

(assert (= (and b!194123 res!91714) b!194124))

(assert (=> d!56551 m!220355))

(declare-fun m!220483 () Bool)

(assert (=> d!56551 m!220483))

(declare-fun m!220485 () Bool)

(assert (=> d!56551 m!220485))

(declare-fun m!220487 () Bool)

(assert (=> b!194123 m!220487))

(declare-fun m!220489 () Bool)

(assert (=> b!194124 m!220489))

(assert (=> d!56505 d!56551))

(declare-fun d!56553 () Bool)

(declare-fun e!127723 () Bool)

(assert (=> d!56553 e!127723))

(declare-fun res!91720 () Bool)

(assert (=> d!56553 (=> (not res!91720) (not e!127723))))

(declare-fun lt!96725 () List!2426)

(assert (=> d!56553 (= res!91720 (isStrictlySorted!352 lt!96725))))

(declare-fun e!127724 () List!2426)

(assert (=> d!56553 (= lt!96725 e!127724)))

(declare-fun c!35032 () Bool)

(assert (=> d!56553 (= c!35032 (and ((_ is Cons!2422) (toList!1225 lt!96453)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96453))) (_1!1766 lt!96460))))))

(assert (=> d!56553 (isStrictlySorted!352 (toList!1225 lt!96453))))

(assert (=> d!56553 (= (insertStrictlySorted!136 (toList!1225 lt!96453) (_1!1766 lt!96460) (_2!1766 lt!96460)) lt!96725)))

(declare-fun bm!19623 () Bool)

(declare-fun call!19627 () List!2426)

(declare-fun call!19628 () List!2426)

(assert (=> bm!19623 (= call!19627 call!19628)))

(declare-fun b!194145 () Bool)

(declare-fun e!127725 () List!2426)

(assert (=> b!194145 (= e!127725 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96453)) (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun b!194146 () Bool)

(assert (=> b!194146 (= e!127723 (contains!1359 lt!96725 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!194147 () Bool)

(declare-fun e!127722 () List!2426)

(assert (=> b!194147 (= e!127724 e!127722)))

(declare-fun c!35034 () Bool)

(assert (=> b!194147 (= c!35034 (and ((_ is Cons!2422) (toList!1225 lt!96453)) (= (_1!1766 (h!3063 (toList!1225 lt!96453))) (_1!1766 lt!96460))))))

(declare-fun b!194148 () Bool)

(declare-fun res!91719 () Bool)

(assert (=> b!194148 (=> (not res!91719) (not e!127723))))

(assert (=> b!194148 (= res!91719 (containsKey!247 lt!96725 (_1!1766 lt!96460)))))

(declare-fun b!194149 () Bool)

(assert (=> b!194149 (= e!127724 call!19628)))

(declare-fun b!194150 () Bool)

(declare-fun e!127726 () List!2426)

(declare-fun call!19626 () List!2426)

(assert (=> b!194150 (= e!127726 call!19626)))

(declare-fun b!194151 () Bool)

(assert (=> b!194151 (= e!127726 call!19626)))

(declare-fun c!35035 () Bool)

(declare-fun b!194152 () Bool)

(assert (=> b!194152 (= e!127725 (ite c!35034 (t!7343 (toList!1225 lt!96453)) (ite c!35035 (Cons!2422 (h!3063 (toList!1225 lt!96453)) (t!7343 (toList!1225 lt!96453))) Nil!2423)))))

(declare-fun b!194153 () Bool)

(assert (=> b!194153 (= e!127722 call!19627)))

(declare-fun bm!19624 () Bool)

(declare-fun $colon$colon!102 (List!2426 tuple2!3510) List!2426)

(assert (=> bm!19624 (= call!19628 ($colon$colon!102 e!127725 (ite c!35032 (h!3063 (toList!1225 lt!96453)) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460)))))))

(declare-fun c!35033 () Bool)

(assert (=> bm!19624 (= c!35033 c!35032)))

(declare-fun b!194154 () Bool)

(assert (=> b!194154 (= c!35035 (and ((_ is Cons!2422) (toList!1225 lt!96453)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96453))) (_1!1766 lt!96460))))))

(assert (=> b!194154 (= e!127722 e!127726)))

(declare-fun bm!19625 () Bool)

(assert (=> bm!19625 (= call!19626 call!19627)))

(assert (= (and d!56553 c!35032) b!194149))

(assert (= (and d!56553 (not c!35032)) b!194147))

(assert (= (and b!194147 c!35034) b!194153))

(assert (= (and b!194147 (not c!35034)) b!194154))

(assert (= (and b!194154 c!35035) b!194150))

(assert (= (and b!194154 (not c!35035)) b!194151))

(assert (= (or b!194150 b!194151) bm!19625))

(assert (= (or b!194153 bm!19625) bm!19623))

(assert (= (or b!194149 bm!19623) bm!19624))

(assert (= (and bm!19624 c!35033) b!194145))

(assert (= (and bm!19624 (not c!35033)) b!194152))

(assert (= (and d!56553 res!91720) b!194148))

(assert (= (and b!194148 res!91719) b!194146))

(declare-fun m!220491 () Bool)

(assert (=> d!56553 m!220491))

(declare-fun m!220493 () Bool)

(assert (=> d!56553 m!220493))

(declare-fun m!220495 () Bool)

(assert (=> b!194148 m!220495))

(declare-fun m!220497 () Bool)

(assert (=> b!194145 m!220497))

(declare-fun m!220499 () Bool)

(assert (=> b!194146 m!220499))

(declare-fun m!220501 () Bool)

(assert (=> bm!19624 m!220501))

(assert (=> d!56505 d!56553))

(declare-fun d!56555 () Bool)

(declare-fun e!127746 () Bool)

(assert (=> d!56555 e!127746))

(declare-fun res!91729 () Bool)

(assert (=> d!56555 (=> (not res!91729) (not e!127746))))

(declare-fun lt!96745 () ListLongMap!2419)

(assert (=> d!56555 (= res!91729 (not (contains!1356 lt!96745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127742 () ListLongMap!2419)

(assert (=> d!56555 (= lt!96745 e!127742)))

(declare-fun c!35046 () Bool)

(assert (=> d!56555 (= c!35046 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56555 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56555 (= (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96745)))

(declare-fun b!194179 () Bool)

(declare-fun lt!96740 () Unit!5819)

(declare-fun lt!96741 () Unit!5819)

(assert (=> b!194179 (= lt!96740 lt!96741)))

(declare-fun lt!96744 () V!5633)

(declare-fun lt!96746 () ListLongMap!2419)

(declare-fun lt!96742 () (_ BitVec 64))

(declare-fun lt!96743 () (_ BitVec 64))

(assert (=> b!194179 (not (contains!1356 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744)) lt!96742))))

(declare-fun addStillNotContains!98 (ListLongMap!2419 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5819)

(assert (=> b!194179 (= lt!96741 (addStillNotContains!98 lt!96746 lt!96743 lt!96744 lt!96742))))

(assert (=> b!194179 (= lt!96742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194179 (= lt!96744 (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194179 (= lt!96743 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19631 () ListLongMap!2419)

(assert (=> b!194179 (= lt!96746 call!19631)))

(declare-fun e!127747 () ListLongMap!2419)

(assert (=> b!194179 (= e!127747 (+!317 call!19631 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194180 () Bool)

(declare-fun e!127741 () Bool)

(declare-fun e!127743 () Bool)

(assert (=> b!194180 (= e!127741 e!127743)))

(declare-fun c!35047 () Bool)

(assert (=> b!194180 (= c!35047 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194181 () Bool)

(declare-fun isEmpty!491 (ListLongMap!2419) Bool)

(assert (=> b!194181 (= e!127743 (isEmpty!491 lt!96745))))

(declare-fun b!194182 () Bool)

(declare-fun e!127745 () Bool)

(assert (=> b!194182 (= e!127745 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194182 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19628 () Bool)

(assert (=> bm!19628 (= call!19631 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194183 () Bool)

(assert (=> b!194183 (= e!127746 e!127741)))

(declare-fun c!35044 () Bool)

(assert (=> b!194183 (= c!35044 e!127745)))

(declare-fun res!91731 () Bool)

(assert (=> b!194183 (=> (not res!91731) (not e!127745))))

(assert (=> b!194183 (= res!91731 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194184 () Bool)

(assert (=> b!194184 (= e!127742 (ListLongMap!2420 Nil!2423))))

(declare-fun b!194185 () Bool)

(assert (=> b!194185 (= e!127747 call!19631)))

(declare-fun b!194186 () Bool)

(assert (=> b!194186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!194186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (_values!3942 thiss!1248))))))

(declare-fun e!127744 () Bool)

(assert (=> b!194186 (= e!127744 (= (apply!188 lt!96745 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194187 () Bool)

(assert (=> b!194187 (= e!127741 e!127744)))

(assert (=> b!194187 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!91732 () Bool)

(assert (=> b!194187 (= res!91732 (contains!1356 lt!96745 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194187 (=> (not res!91732) (not e!127744))))

(declare-fun b!194188 () Bool)

(declare-fun res!91730 () Bool)

(assert (=> b!194188 (=> (not res!91730) (not e!127746))))

(assert (=> b!194188 (= res!91730 (not (contains!1356 lt!96745 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194189 () Bool)

(assert (=> b!194189 (= e!127742 e!127747)))

(declare-fun c!35045 () Bool)

(assert (=> b!194189 (= c!35045 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194190 () Bool)

(assert (=> b!194190 (= e!127743 (= lt!96745 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!56555 c!35046) b!194184))

(assert (= (and d!56555 (not c!35046)) b!194189))

(assert (= (and b!194189 c!35045) b!194179))

(assert (= (and b!194189 (not c!35045)) b!194185))

(assert (= (or b!194179 b!194185) bm!19628))

(assert (= (and d!56555 res!91729) b!194188))

(assert (= (and b!194188 res!91730) b!194183))

(assert (= (and b!194183 res!91731) b!194182))

(assert (= (and b!194183 c!35044) b!194187))

(assert (= (and b!194183 (not c!35044)) b!194180))

(assert (= (and b!194187 res!91732) b!194186))

(assert (= (and b!194180 c!35047) b!194190))

(assert (= (and b!194180 (not c!35047)) b!194181))

(declare-fun b_lambda!7469 () Bool)

(assert (=> (not b_lambda!7469) (not b!194179)))

(assert (=> b!194179 t!7347))

(declare-fun b_and!11415 () Bool)

(assert (= b_and!11413 (and (=> t!7347 result!4931) b_and!11415)))

(declare-fun b_lambda!7471 () Bool)

(assert (=> (not b_lambda!7471) (not b!194186)))

(assert (=> b!194186 t!7347))

(declare-fun b_and!11417 () Bool)

(assert (= b_and!11415 (and (=> t!7347 result!4931) b_and!11417)))

(assert (=> b!194182 m!220231))

(assert (=> b!194182 m!220231))

(assert (=> b!194182 m!220233))

(assert (=> b!194189 m!220231))

(assert (=> b!194189 m!220231))

(assert (=> b!194189 m!220233))

(declare-fun m!220503 () Bool)

(assert (=> b!194181 m!220503))

(assert (=> b!194187 m!220231))

(assert (=> b!194187 m!220231))

(declare-fun m!220505 () Bool)

(assert (=> b!194187 m!220505))

(declare-fun m!220507 () Bool)

(assert (=> b!194188 m!220507))

(declare-fun m!220509 () Bool)

(assert (=> bm!19628 m!220509))

(assert (=> b!194190 m!220509))

(assert (=> b!194179 m!220295))

(assert (=> b!194179 m!220243))

(assert (=> b!194179 m!220297))

(assert (=> b!194179 m!220231))

(declare-fun m!220511 () Bool)

(assert (=> b!194179 m!220511))

(assert (=> b!194179 m!220243))

(assert (=> b!194179 m!220295))

(declare-fun m!220513 () Bool)

(assert (=> b!194179 m!220513))

(declare-fun m!220515 () Bool)

(assert (=> b!194179 m!220515))

(declare-fun m!220517 () Bool)

(assert (=> b!194179 m!220517))

(assert (=> b!194179 m!220513))

(assert (=> b!194186 m!220295))

(assert (=> b!194186 m!220243))

(assert (=> b!194186 m!220297))

(assert (=> b!194186 m!220231))

(assert (=> b!194186 m!220231))

(declare-fun m!220519 () Bool)

(assert (=> b!194186 m!220519))

(assert (=> b!194186 m!220243))

(assert (=> b!194186 m!220295))

(declare-fun m!220521 () Bool)

(assert (=> d!56555 m!220521))

(assert (=> d!56555 m!220205))

(assert (=> bm!19608 d!56555))

(assert (=> d!56527 d!56491))

(declare-fun b!194207 () Bool)

(declare-fun e!127758 () Bool)

(declare-fun call!19637 () Bool)

(assert (=> b!194207 (= e!127758 (not call!19637))))

(declare-fun d!56557 () Bool)

(declare-fun e!127756 () Bool)

(assert (=> d!56557 e!127756))

(declare-fun c!35052 () Bool)

(declare-fun lt!96749 () SeekEntryResult!695)

(assert (=> d!56557 (= c!35052 ((_ is MissingZero!695) lt!96749))))

(assert (=> d!56557 (= lt!96749 (seekEntryOrOpen!0 key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(assert (=> d!56557 true))

(declare-fun _$34!1087 () Unit!5819)

(assert (=> d!56557 (= (choose!1073 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)) _$34!1087)))

(declare-fun b!194208 () Bool)

(declare-fun e!127759 () Bool)

(assert (=> b!194208 (= e!127756 e!127759)))

(declare-fun res!91743 () Bool)

(declare-fun call!19636 () Bool)

(assert (=> b!194208 (= res!91743 call!19636)))

(assert (=> b!194208 (=> (not res!91743) (not e!127759))))

(declare-fun b!194209 () Bool)

(declare-fun e!127757 () Bool)

(assert (=> b!194209 (= e!127757 ((_ is Undefined!695) lt!96749))))

(declare-fun b!194210 () Bool)

(assert (=> b!194210 (= e!127756 e!127757)))

(declare-fun c!35053 () Bool)

(assert (=> b!194210 (= c!35053 ((_ is MissingVacant!695) lt!96749))))

(declare-fun b!194211 () Bool)

(assert (=> b!194211 (= e!127759 (not call!19637))))

(declare-fun bm!19633 () Bool)

(assert (=> bm!19633 (= call!19637 (arrayContainsKey!0 (_keys!5952 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!194212 () Bool)

(declare-fun res!91742 () Bool)

(assert (=> b!194212 (= res!91742 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4950 lt!96749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194212 (=> (not res!91742) (not e!127759))))

(declare-fun b!194213 () Bool)

(declare-fun res!91744 () Bool)

(assert (=> b!194213 (=> (not res!91744) (not e!127758))))

(assert (=> b!194213 (= res!91744 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4953 lt!96749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19634 () Bool)

(assert (=> bm!19634 (= call!19636 (inRange!0 (ite c!35052 (index!4950 lt!96749) (index!4953 lt!96749)) (mask!9221 thiss!1248)))))

(declare-fun b!194214 () Bool)

(declare-fun res!91741 () Bool)

(assert (=> b!194214 (=> (not res!91741) (not e!127758))))

(assert (=> b!194214 (= res!91741 call!19636)))

(assert (=> b!194214 (= e!127757 e!127758)))

(assert (= (and d!56557 c!35052) b!194208))

(assert (= (and d!56557 (not c!35052)) b!194210))

(assert (= (and b!194208 res!91743) b!194212))

(assert (= (and b!194212 res!91742) b!194211))

(assert (= (and b!194210 c!35053) b!194214))

(assert (= (and b!194210 (not c!35053)) b!194209))

(assert (= (and b!194214 res!91741) b!194213))

(assert (= (and b!194213 res!91744) b!194207))

(assert (= (or b!194208 b!194214) bm!19634))

(assert (= (or b!194211 b!194207) bm!19633))

(assert (=> d!56557 m!220075))

(declare-fun m!220523 () Bool)

(assert (=> b!194213 m!220523))

(declare-fun m!220525 () Bool)

(assert (=> bm!19634 m!220525))

(declare-fun m!220527 () Bool)

(assert (=> b!194212 m!220527))

(assert (=> bm!19633 m!220411))

(assert (=> d!56527 d!56557))

(assert (=> d!56527 d!56531))

(declare-fun d!56559 () Bool)

(assert (=> d!56559 (= (inRange!0 (index!4951 lt!96680) (mask!9221 thiss!1248)) (and (bvsge (index!4951 lt!96680) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96680) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!194029 d!56559))

(declare-fun b!194223 () Bool)

(declare-fun e!127768 () Bool)

(declare-fun e!127767 () Bool)

(assert (=> b!194223 (= e!127768 e!127767)))

(declare-fun c!35056 () Bool)

(assert (=> b!194223 (= c!35056 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!194224 () Bool)

(declare-fun e!127766 () Bool)

(declare-fun call!19640 () Bool)

(assert (=> b!194224 (= e!127766 call!19640)))

(declare-fun b!194225 () Bool)

(assert (=> b!194225 (= e!127767 e!127766)))

(declare-fun lt!96757 () (_ BitVec 64))

(assert (=> b!194225 (= lt!96757 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))

(declare-fun lt!96758 () Unit!5819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8209 (_ BitVec 64) (_ BitVec 32)) Unit!5819)

(assert (=> b!194225 (= lt!96758 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5952 lt!96455) lt!96757 #b00000000000000000000000000000000))))

(assert (=> b!194225 (arrayContainsKey!0 (_keys!5952 lt!96455) lt!96757 #b00000000000000000000000000000000)))

(declare-fun lt!96756 () Unit!5819)

(assert (=> b!194225 (= lt!96756 lt!96758)))

(declare-fun res!91750 () Bool)

(assert (=> b!194225 (= res!91750 (= (seekEntryOrOpen!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) (_keys!5952 lt!96455) (mask!9221 lt!96455)) (Found!695 #b00000000000000000000000000000000)))))

(assert (=> b!194225 (=> (not res!91750) (not e!127766))))

(declare-fun b!194226 () Bool)

(assert (=> b!194226 (= e!127767 call!19640)))

(declare-fun bm!19637 () Bool)

(assert (=> bm!19637 (= call!19640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5952 lt!96455) (mask!9221 lt!96455)))))

(declare-fun d!56561 () Bool)

(declare-fun res!91749 () Bool)

(assert (=> d!56561 (=> res!91749 e!127768)))

(assert (=> d!56561 (= res!91749 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5952 lt!96455) (mask!9221 lt!96455)) e!127768)))

(assert (= (and d!56561 (not res!91749)) b!194223))

(assert (= (and b!194223 c!35056) b!194225))

(assert (= (and b!194223 (not c!35056)) b!194226))

(assert (= (and b!194225 res!91750) b!194224))

(assert (= (or b!194224 b!194226) bm!19637))

(declare-fun m!220529 () Bool)

(assert (=> b!194223 m!220529))

(assert (=> b!194223 m!220529))

(declare-fun m!220531 () Bool)

(assert (=> b!194223 m!220531))

(assert (=> b!194225 m!220529))

(declare-fun m!220533 () Bool)

(assert (=> b!194225 m!220533))

(declare-fun m!220535 () Bool)

(assert (=> b!194225 m!220535))

(assert (=> b!194225 m!220529))

(declare-fun m!220537 () Bool)

(assert (=> b!194225 m!220537))

(declare-fun m!220539 () Bool)

(assert (=> bm!19637 m!220539))

(assert (=> b!194006 d!56561))

(declare-fun d!56563 () Bool)

(declare-fun get!2232 (Option!249) V!5633)

(assert (=> d!56563 (= (apply!188 lt!96632 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2232 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7703 () Bool)

(assert (= bs!7703 d!56563))

(assert (=> bs!7703 m!220231))

(declare-fun m!220541 () Bool)

(assert (=> bs!7703 m!220541))

(assert (=> bs!7703 m!220541))

(declare-fun m!220543 () Bool)

(assert (=> bs!7703 m!220543))

(assert (=> b!193987 d!56563))

(declare-fun d!56565 () Bool)

(declare-fun c!35059 () Bool)

(assert (=> d!56565 (= c!35059 ((_ is ValueCellFull!1901) (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!127771 () V!5633)

(assert (=> d!56565 (= (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!127771)))

(declare-fun b!194231 () Bool)

(declare-fun get!2233 (ValueCell!1901 V!5633) V!5633)

(assert (=> b!194231 (= e!127771 (get!2233 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194232 () Bool)

(declare-fun get!2234 (ValueCell!1901 V!5633) V!5633)

(assert (=> b!194232 (= e!127771 (get!2234 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56565 c!35059) b!194231))

(assert (= (and d!56565 (not c!35059)) b!194232))

(assert (=> b!194231 m!220295))

(assert (=> b!194231 m!220243))

(declare-fun m!220545 () Bool)

(assert (=> b!194231 m!220545))

(assert (=> b!194232 m!220295))

(assert (=> b!194232 m!220243))

(declare-fun m!220547 () Bool)

(assert (=> b!194232 m!220547))

(assert (=> b!193987 d!56565))

(declare-fun d!56567 () Bool)

(declare-fun e!127773 () Bool)

(assert (=> d!56567 e!127773))

(declare-fun res!91751 () Bool)

(assert (=> d!56567 (=> res!91751 e!127773)))

(declare-fun lt!96761 () Bool)

(assert (=> d!56567 (= res!91751 (not lt!96761))))

(declare-fun lt!96762 () Bool)

(assert (=> d!56567 (= lt!96761 lt!96762)))

(declare-fun lt!96760 () Unit!5819)

(declare-fun e!127772 () Unit!5819)

(assert (=> d!56567 (= lt!96760 e!127772)))

(declare-fun c!35060 () Bool)

(assert (=> d!56567 (= c!35060 lt!96762)))

(assert (=> d!56567 (= lt!96762 (containsKey!247 (toList!1225 lt!96671) (_1!1766 lt!96460)))))

(assert (=> d!56567 (= (contains!1356 lt!96671 (_1!1766 lt!96460)) lt!96761)))

(declare-fun b!194233 () Bool)

(declare-fun lt!96759 () Unit!5819)

(assert (=> b!194233 (= e!127772 lt!96759)))

(assert (=> b!194233 (= lt!96759 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96671) (_1!1766 lt!96460)))))

(assert (=> b!194233 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460)))))

(declare-fun b!194234 () Bool)

(declare-fun Unit!5836 () Unit!5819)

(assert (=> b!194234 (= e!127772 Unit!5836)))

(declare-fun b!194235 () Bool)

(assert (=> b!194235 (= e!127773 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460))))))

(assert (= (and d!56567 c!35060) b!194233))

(assert (= (and d!56567 (not c!35060)) b!194234))

(assert (= (and d!56567 (not res!91751)) b!194235))

(declare-fun m!220549 () Bool)

(assert (=> d!56567 m!220549))

(declare-fun m!220551 () Bool)

(assert (=> b!194233 m!220551))

(assert (=> b!194233 m!220389))

(assert (=> b!194233 m!220389))

(declare-fun m!220553 () Bool)

(assert (=> b!194233 m!220553))

(assert (=> b!194235 m!220389))

(assert (=> b!194235 m!220389))

(assert (=> b!194235 m!220553))

(assert (=> d!56515 d!56567))

(declare-fun b!194238 () Bool)

(declare-fun e!127775 () Option!249)

(assert (=> b!194238 (= e!127775 (getValueByKey!243 (t!7343 lt!96673) (_1!1766 lt!96460)))))

(declare-fun d!56569 () Bool)

(declare-fun c!35061 () Bool)

(assert (=> d!56569 (= c!35061 (and ((_ is Cons!2422) lt!96673) (= (_1!1766 (h!3063 lt!96673)) (_1!1766 lt!96460))))))

(declare-fun e!127774 () Option!249)

(assert (=> d!56569 (= (getValueByKey!243 lt!96673 (_1!1766 lt!96460)) e!127774)))

(declare-fun b!194236 () Bool)

(assert (=> b!194236 (= e!127774 (Some!248 (_2!1766 (h!3063 lt!96673))))))

(declare-fun b!194237 () Bool)

(assert (=> b!194237 (= e!127774 e!127775)))

(declare-fun c!35062 () Bool)

(assert (=> b!194237 (= c!35062 (and ((_ is Cons!2422) lt!96673) (not (= (_1!1766 (h!3063 lt!96673)) (_1!1766 lt!96460)))))))

(declare-fun b!194239 () Bool)

(assert (=> b!194239 (= e!127775 None!247)))

(assert (= (and d!56569 c!35061) b!194236))

(assert (= (and d!56569 (not c!35061)) b!194237))

(assert (= (and b!194237 c!35062) b!194238))

(assert (= (and b!194237 (not c!35062)) b!194239))

(declare-fun m!220555 () Bool)

(assert (=> b!194238 m!220555))

(assert (=> d!56515 d!56569))

(declare-fun d!56571 () Bool)

(assert (=> d!56571 (= (getValueByKey!243 lt!96673 (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460)))))

(declare-fun lt!96763 () Unit!5819)

(assert (=> d!56571 (= lt!96763 (choose!1074 lt!96673 (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun e!127776 () Bool)

(assert (=> d!56571 e!127776))

(declare-fun res!91752 () Bool)

(assert (=> d!56571 (=> (not res!91752) (not e!127776))))

(assert (=> d!56571 (= res!91752 (isStrictlySorted!352 lt!96673))))

(assert (=> d!56571 (= (lemmaContainsTupThenGetReturnValue!133 lt!96673 (_1!1766 lt!96460) (_2!1766 lt!96460)) lt!96763)))

(declare-fun b!194240 () Bool)

(declare-fun res!91753 () Bool)

(assert (=> b!194240 (=> (not res!91753) (not e!127776))))

(assert (=> b!194240 (= res!91753 (containsKey!247 lt!96673 (_1!1766 lt!96460)))))

(declare-fun b!194241 () Bool)

(assert (=> b!194241 (= e!127776 (contains!1359 lt!96673 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(assert (= (and d!56571 res!91752) b!194240))

(assert (= (and b!194240 res!91753) b!194241))

(assert (=> d!56571 m!220383))

(declare-fun m!220557 () Bool)

(assert (=> d!56571 m!220557))

(declare-fun m!220559 () Bool)

(assert (=> d!56571 m!220559))

(declare-fun m!220561 () Bool)

(assert (=> b!194240 m!220561))

(declare-fun m!220563 () Bool)

(assert (=> b!194241 m!220563))

(assert (=> d!56515 d!56571))

(declare-fun d!56573 () Bool)

(declare-fun e!127778 () Bool)

(assert (=> d!56573 e!127778))

(declare-fun res!91755 () Bool)

(assert (=> d!56573 (=> (not res!91755) (not e!127778))))

(declare-fun lt!96764 () List!2426)

(assert (=> d!56573 (= res!91755 (isStrictlySorted!352 lt!96764))))

(declare-fun e!127779 () List!2426)

(assert (=> d!56573 (= lt!96764 e!127779)))

(declare-fun c!35063 () Bool)

(assert (=> d!56573 (= c!35063 (and ((_ is Cons!2422) (toList!1225 (map!2007 thiss!1248))) (bvslt (_1!1766 (h!3063 (toList!1225 (map!2007 thiss!1248)))) (_1!1766 lt!96460))))))

(assert (=> d!56573 (isStrictlySorted!352 (toList!1225 (map!2007 thiss!1248)))))

(assert (=> d!56573 (= (insertStrictlySorted!136 (toList!1225 (map!2007 thiss!1248)) (_1!1766 lt!96460) (_2!1766 lt!96460)) lt!96764)))

(declare-fun bm!19638 () Bool)

(declare-fun call!19642 () List!2426)

(declare-fun call!19643 () List!2426)

(assert (=> bm!19638 (= call!19642 call!19643)))

(declare-fun b!194242 () Bool)

(declare-fun e!127780 () List!2426)

(assert (=> b!194242 (= e!127780 (insertStrictlySorted!136 (t!7343 (toList!1225 (map!2007 thiss!1248))) (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun b!194243 () Bool)

(assert (=> b!194243 (= e!127778 (contains!1359 lt!96764 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!194244 () Bool)

(declare-fun e!127777 () List!2426)

(assert (=> b!194244 (= e!127779 e!127777)))

(declare-fun c!35065 () Bool)

(assert (=> b!194244 (= c!35065 (and ((_ is Cons!2422) (toList!1225 (map!2007 thiss!1248))) (= (_1!1766 (h!3063 (toList!1225 (map!2007 thiss!1248)))) (_1!1766 lt!96460))))))

(declare-fun b!194245 () Bool)

(declare-fun res!91754 () Bool)

(assert (=> b!194245 (=> (not res!91754) (not e!127778))))

(assert (=> b!194245 (= res!91754 (containsKey!247 lt!96764 (_1!1766 lt!96460)))))

(declare-fun b!194246 () Bool)

(assert (=> b!194246 (= e!127779 call!19643)))

(declare-fun b!194247 () Bool)

(declare-fun e!127781 () List!2426)

(declare-fun call!19641 () List!2426)

(assert (=> b!194247 (= e!127781 call!19641)))

(declare-fun b!194248 () Bool)

(assert (=> b!194248 (= e!127781 call!19641)))

(declare-fun c!35066 () Bool)

(declare-fun b!194249 () Bool)

(assert (=> b!194249 (= e!127780 (ite c!35065 (t!7343 (toList!1225 (map!2007 thiss!1248))) (ite c!35066 (Cons!2422 (h!3063 (toList!1225 (map!2007 thiss!1248))) (t!7343 (toList!1225 (map!2007 thiss!1248)))) Nil!2423)))))

(declare-fun b!194250 () Bool)

(assert (=> b!194250 (= e!127777 call!19642)))

(declare-fun bm!19639 () Bool)

(assert (=> bm!19639 (= call!19643 ($colon$colon!102 e!127780 (ite c!35063 (h!3063 (toList!1225 (map!2007 thiss!1248))) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460)))))))

(declare-fun c!35064 () Bool)

(assert (=> bm!19639 (= c!35064 c!35063)))

(declare-fun b!194251 () Bool)

(assert (=> b!194251 (= c!35066 (and ((_ is Cons!2422) (toList!1225 (map!2007 thiss!1248))) (bvsgt (_1!1766 (h!3063 (toList!1225 (map!2007 thiss!1248)))) (_1!1766 lt!96460))))))

(assert (=> b!194251 (= e!127777 e!127781)))

(declare-fun bm!19640 () Bool)

(assert (=> bm!19640 (= call!19641 call!19642)))

(assert (= (and d!56573 c!35063) b!194246))

(assert (= (and d!56573 (not c!35063)) b!194244))

(assert (= (and b!194244 c!35065) b!194250))

(assert (= (and b!194244 (not c!35065)) b!194251))

(assert (= (and b!194251 c!35066) b!194247))

(assert (= (and b!194251 (not c!35066)) b!194248))

(assert (= (or b!194247 b!194248) bm!19640))

(assert (= (or b!194250 bm!19640) bm!19638))

(assert (= (or b!194246 bm!19638) bm!19639))

(assert (= (and bm!19639 c!35064) b!194242))

(assert (= (and bm!19639 (not c!35064)) b!194249))

(assert (= (and d!56573 res!91755) b!194245))

(assert (= (and b!194245 res!91754) b!194243))

(declare-fun m!220565 () Bool)

(assert (=> d!56573 m!220565))

(declare-fun m!220567 () Bool)

(assert (=> d!56573 m!220567))

(declare-fun m!220569 () Bool)

(assert (=> b!194245 m!220569))

(declare-fun m!220571 () Bool)

(assert (=> b!194242 m!220571))

(declare-fun m!220573 () Bool)

(assert (=> b!194243 m!220573))

(declare-fun m!220575 () Bool)

(assert (=> bm!19639 m!220575))

(assert (=> d!56515 d!56573))

(declare-fun d!56575 () Bool)

(declare-fun e!127782 () Bool)

(assert (=> d!56575 e!127782))

(declare-fun res!91756 () Bool)

(assert (=> d!56575 (=> (not res!91756) (not e!127782))))

(declare-fun lt!96765 () ListLongMap!2419)

(assert (=> d!56575 (= res!91756 (contains!1356 lt!96765 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!96767 () List!2426)

(assert (=> d!56575 (= lt!96765 (ListLongMap!2420 lt!96767))))

(declare-fun lt!96768 () Unit!5819)

(declare-fun lt!96766 () Unit!5819)

(assert (=> d!56575 (= lt!96768 lt!96766)))

(assert (=> d!56575 (= (getValueByKey!243 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56575 (= lt!96766 (lemmaContainsTupThenGetReturnValue!133 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56575 (= lt!96767 (insertStrictlySorted!136 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56575 (= (+!317 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!96765)))

(declare-fun b!194252 () Bool)

(declare-fun res!91757 () Bool)

(assert (=> b!194252 (=> (not res!91757) (not e!127782))))

(assert (=> b!194252 (= res!91757 (= (getValueByKey!243 (toList!1225 lt!96765) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194253 () Bool)

(assert (=> b!194253 (= e!127782 (contains!1359 (toList!1225 lt!96765) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!56575 res!91756) b!194252))

(assert (= (and b!194252 res!91757) b!194253))

(declare-fun m!220577 () Bool)

(assert (=> d!56575 m!220577))

(declare-fun m!220579 () Bool)

(assert (=> d!56575 m!220579))

(declare-fun m!220581 () Bool)

(assert (=> d!56575 m!220581))

(declare-fun m!220583 () Bool)

(assert (=> d!56575 m!220583))

(declare-fun m!220585 () Bool)

(assert (=> b!194252 m!220585))

(declare-fun m!220587 () Bool)

(assert (=> b!194253 m!220587))

(assert (=> bm!19599 d!56575))

(declare-fun d!56577 () Bool)

(assert (=> d!56577 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96453) key!828))))

(declare-fun lt!96771 () Unit!5819)

(declare-fun choose!1075 (List!2426 (_ BitVec 64)) Unit!5819)

(assert (=> d!56577 (= lt!96771 (choose!1075 (toList!1225 lt!96453) key!828))))

(declare-fun e!127785 () Bool)

(assert (=> d!56577 e!127785))

(declare-fun res!91760 () Bool)

(assert (=> d!56577 (=> (not res!91760) (not e!127785))))

(assert (=> d!56577 (= res!91760 (isStrictlySorted!352 (toList!1225 lt!96453)))))

(assert (=> d!56577 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96453) key!828) lt!96771)))

(declare-fun b!194256 () Bool)

(assert (=> b!194256 (= e!127785 (containsKey!247 (toList!1225 lt!96453) key!828))))

(assert (= (and d!56577 res!91760) b!194256))

(assert (=> d!56577 m!220221))

(assert (=> d!56577 m!220221))

(assert (=> d!56577 m!220223))

(declare-fun m!220589 () Bool)

(assert (=> d!56577 m!220589))

(assert (=> d!56577 m!220493))

(assert (=> b!194256 m!220217))

(assert (=> b!193907 d!56577))

(declare-fun d!56579 () Bool)

(declare-fun isEmpty!492 (Option!249) Bool)

(assert (=> d!56579 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96453) key!828)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96453) key!828))))))

(declare-fun bs!7704 () Bool)

(assert (= bs!7704 d!56579))

(assert (=> bs!7704 m!220221))

(declare-fun m!220591 () Bool)

(assert (=> bs!7704 m!220591))

(assert (=> b!193907 d!56579))

(declare-fun b!194259 () Bool)

(declare-fun e!127787 () Option!249)

(assert (=> b!194259 (= e!127787 (getValueByKey!243 (t!7343 (toList!1225 lt!96453)) key!828))))

(declare-fun d!56581 () Bool)

(declare-fun c!35067 () Bool)

(assert (=> d!56581 (= c!35067 (and ((_ is Cons!2422) (toList!1225 lt!96453)) (= (_1!1766 (h!3063 (toList!1225 lt!96453))) key!828)))))

(declare-fun e!127786 () Option!249)

(assert (=> d!56581 (= (getValueByKey!243 (toList!1225 lt!96453) key!828) e!127786)))

(declare-fun b!194257 () Bool)

(assert (=> b!194257 (= e!127786 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96453)))))))

(declare-fun b!194258 () Bool)

(assert (=> b!194258 (= e!127786 e!127787)))

(declare-fun c!35068 () Bool)

(assert (=> b!194258 (= c!35068 (and ((_ is Cons!2422) (toList!1225 lt!96453)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96453))) key!828))))))

(declare-fun b!194260 () Bool)

(assert (=> b!194260 (= e!127787 None!247)))

(assert (= (and d!56581 c!35067) b!194257))

(assert (= (and d!56581 (not c!35067)) b!194258))

(assert (= (and b!194258 c!35068) b!194259))

(assert (= (and b!194258 (not c!35068)) b!194260))

(declare-fun m!220593 () Bool)

(assert (=> b!194259 m!220593))

(assert (=> b!193907 d!56581))

(assert (=> b!193972 d!56539))

(assert (=> d!56517 d!56497))

(declare-fun d!56583 () Bool)

(declare-fun e!127793 () Bool)

(assert (=> d!56583 e!127793))

(declare-fun res!91761 () Bool)

(assert (=> d!56583 (=> (not res!91761) (not e!127793))))

(declare-fun lt!96777 () ListLongMap!2419)

(assert (=> d!56583 (= res!91761 (not (contains!1356 lt!96777 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127789 () ListLongMap!2419)

(assert (=> d!56583 (= lt!96777 e!127789)))

(declare-fun c!35071 () Bool)

(assert (=> d!56583 (= c!35071 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56583 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56583 (= (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96777)))

(declare-fun b!194261 () Bool)

(declare-fun lt!96772 () Unit!5819)

(declare-fun lt!96773 () Unit!5819)

(assert (=> b!194261 (= lt!96772 lt!96773)))

(declare-fun lt!96774 () (_ BitVec 64))

(declare-fun lt!96775 () (_ BitVec 64))

(declare-fun lt!96778 () ListLongMap!2419)

(declare-fun lt!96776 () V!5633)

(assert (=> b!194261 (not (contains!1356 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776)) lt!96774))))

(assert (=> b!194261 (= lt!96773 (addStillNotContains!98 lt!96778 lt!96775 lt!96776 lt!96774))))

(assert (=> b!194261 (= lt!96774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194261 (= lt!96776 (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194261 (= lt!96775 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19644 () ListLongMap!2419)

(assert (=> b!194261 (= lt!96778 call!19644)))

(declare-fun e!127794 () ListLongMap!2419)

(assert (=> b!194261 (= e!127794 (+!317 call!19644 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194262 () Bool)

(declare-fun e!127788 () Bool)

(declare-fun e!127790 () Bool)

(assert (=> b!194262 (= e!127788 e!127790)))

(declare-fun c!35072 () Bool)

(assert (=> b!194262 (= c!35072 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194263 () Bool)

(assert (=> b!194263 (= e!127790 (isEmpty!491 lt!96777))))

(declare-fun b!194264 () Bool)

(declare-fun e!127792 () Bool)

(assert (=> b!194264 (= e!127792 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194264 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19641 () Bool)

(assert (=> bm!19641 (= call!19644 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194265 () Bool)

(assert (=> b!194265 (= e!127793 e!127788)))

(declare-fun c!35069 () Bool)

(assert (=> b!194265 (= c!35069 e!127792)))

(declare-fun res!91763 () Bool)

(assert (=> b!194265 (=> (not res!91763) (not e!127792))))

(assert (=> b!194265 (= res!91763 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194266 () Bool)

(assert (=> b!194266 (= e!127789 (ListLongMap!2420 Nil!2423))))

(declare-fun b!194267 () Bool)

(assert (=> b!194267 (= e!127794 call!19644)))

(declare-fun b!194268 () Bool)

(assert (=> b!194268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!194268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 lt!96452)))))

(declare-fun e!127791 () Bool)

(assert (=> b!194268 (= e!127791 (= (apply!188 lt!96777 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194269 () Bool)

(assert (=> b!194269 (= e!127788 e!127791)))

(assert (=> b!194269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!91764 () Bool)

(assert (=> b!194269 (= res!91764 (contains!1356 lt!96777 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194269 (=> (not res!91764) (not e!127791))))

(declare-fun b!194270 () Bool)

(declare-fun res!91762 () Bool)

(assert (=> b!194270 (=> (not res!91762) (not e!127793))))

(assert (=> b!194270 (= res!91762 (not (contains!1356 lt!96777 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194271 () Bool)

(assert (=> b!194271 (= e!127789 e!127794)))

(declare-fun c!35070 () Bool)

(assert (=> b!194271 (= c!35070 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194272 () Bool)

(assert (=> b!194272 (= e!127790 (= lt!96777 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!56583 c!35071) b!194266))

(assert (= (and d!56583 (not c!35071)) b!194271))

(assert (= (and b!194271 c!35070) b!194261))

(assert (= (and b!194271 (not c!35070)) b!194267))

(assert (= (or b!194261 b!194267) bm!19641))

(assert (= (and d!56583 res!91761) b!194270))

(assert (= (and b!194270 res!91762) b!194265))

(assert (= (and b!194265 res!91763) b!194264))

(assert (= (and b!194265 c!35069) b!194269))

(assert (= (and b!194265 (not c!35069)) b!194262))

(assert (= (and b!194269 res!91764) b!194268))

(assert (= (and b!194262 c!35072) b!194272))

(assert (= (and b!194262 (not c!35072)) b!194263))

(declare-fun b_lambda!7473 () Bool)

(assert (=> (not b_lambda!7473) (not b!194261)))

(assert (=> b!194261 t!7347))

(declare-fun b_and!11419 () Bool)

(assert (= b_and!11417 (and (=> t!7347 result!4931) b_and!11419)))

(declare-fun b_lambda!7475 () Bool)

(assert (=> (not b_lambda!7475) (not b!194268)))

(assert (=> b!194268 t!7347))

(declare-fun b_and!11421 () Bool)

(assert (= b_and!11419 (and (=> t!7347 result!4931) b_and!11421)))

(assert (=> b!194264 m!220231))

(assert (=> b!194264 m!220231))

(assert (=> b!194264 m!220233))

(assert (=> b!194271 m!220231))

(assert (=> b!194271 m!220231))

(assert (=> b!194271 m!220233))

(declare-fun m!220595 () Bool)

(assert (=> b!194263 m!220595))

(assert (=> b!194269 m!220231))

(assert (=> b!194269 m!220231))

(declare-fun m!220597 () Bool)

(assert (=> b!194269 m!220597))

(declare-fun m!220599 () Bool)

(assert (=> b!194270 m!220599))

(declare-fun m!220601 () Bool)

(assert (=> bm!19641 m!220601))

(assert (=> b!194272 m!220601))

(assert (=> b!194261 m!220241))

(assert (=> b!194261 m!220243))

(assert (=> b!194261 m!220245))

(assert (=> b!194261 m!220231))

(declare-fun m!220603 () Bool)

(assert (=> b!194261 m!220603))

(assert (=> b!194261 m!220243))

(assert (=> b!194261 m!220241))

(declare-fun m!220605 () Bool)

(assert (=> b!194261 m!220605))

(declare-fun m!220607 () Bool)

(assert (=> b!194261 m!220607))

(declare-fun m!220609 () Bool)

(assert (=> b!194261 m!220609))

(assert (=> b!194261 m!220605))

(assert (=> b!194268 m!220241))

(assert (=> b!194268 m!220243))

(assert (=> b!194268 m!220245))

(assert (=> b!194268 m!220231))

(assert (=> b!194268 m!220231))

(declare-fun m!220611 () Bool)

(assert (=> b!194268 m!220611))

(assert (=> b!194268 m!220243))

(assert (=> b!194268 m!220241))

(declare-fun m!220613 () Bool)

(assert (=> d!56583 m!220613))

(assert (=> d!56583 m!220205))

(assert (=> bm!19601 d!56583))

(assert (=> b!193909 d!56579))

(assert (=> b!193909 d!56581))

(declare-fun b!194273 () Bool)

(declare-fun e!127797 () Bool)

(declare-fun e!127796 () Bool)

(assert (=> b!194273 (= e!127797 e!127796)))

(declare-fun c!35073 () Bool)

(assert (=> b!194273 (= c!35073 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194274 () Bool)

(declare-fun e!127795 () Bool)

(declare-fun call!19645 () Bool)

(assert (=> b!194274 (= e!127795 call!19645)))

(declare-fun b!194275 () Bool)

(assert (=> b!194275 (= e!127796 e!127795)))

(declare-fun lt!96780 () (_ BitVec 64))

(assert (=> b!194275 (= lt!96780 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96781 () Unit!5819)

(assert (=> b!194275 (= lt!96781 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5952 thiss!1248) lt!96780 #b00000000000000000000000000000000))))

(assert (=> b!194275 (arrayContainsKey!0 (_keys!5952 thiss!1248) lt!96780 #b00000000000000000000000000000000)))

(declare-fun lt!96779 () Unit!5819)

(assert (=> b!194275 (= lt!96779 lt!96781)))

(declare-fun res!91766 () Bool)

(assert (=> b!194275 (= res!91766 (= (seekEntryOrOpen!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) (Found!695 #b00000000000000000000000000000000)))))

(assert (=> b!194275 (=> (not res!91766) (not e!127795))))

(declare-fun b!194276 () Bool)

(assert (=> b!194276 (= e!127796 call!19645)))

(declare-fun bm!19642 () Bool)

(assert (=> bm!19642 (= call!19645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun d!56585 () Bool)

(declare-fun res!91765 () Bool)

(assert (=> d!56585 (=> res!91765 e!127797)))

(assert (=> d!56585 (= res!91765 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) e!127797)))

(assert (= (and d!56585 (not res!91765)) b!194273))

(assert (= (and b!194273 c!35073) b!194275))

(assert (= (and b!194273 (not c!35073)) b!194276))

(assert (= (and b!194275 res!91766) b!194274))

(assert (= (or b!194274 b!194276) bm!19642))

(assert (=> b!194273 m!220231))

(assert (=> b!194273 m!220231))

(assert (=> b!194273 m!220233))

(assert (=> b!194275 m!220231))

(declare-fun m!220615 () Bool)

(assert (=> b!194275 m!220615))

(declare-fun m!220617 () Bool)

(assert (=> b!194275 m!220617))

(assert (=> b!194275 m!220231))

(declare-fun m!220619 () Bool)

(assert (=> b!194275 m!220619))

(declare-fun m!220621 () Bool)

(assert (=> bm!19642 m!220621))

(assert (=> b!194021 d!56585))

(declare-fun b!194279 () Bool)

(declare-fun e!127799 () Option!249)

(assert (=> b!194279 (= e!127799 (getValueByKey!243 (t!7343 (toList!1225 lt!96663)) (_1!1766 lt!96460)))))

(declare-fun d!56587 () Bool)

(declare-fun c!35074 () Bool)

(assert (=> d!56587 (= c!35074 (and ((_ is Cons!2422) (toList!1225 lt!96663)) (= (_1!1766 (h!3063 (toList!1225 lt!96663))) (_1!1766 lt!96460))))))

(declare-fun e!127798 () Option!249)

(assert (=> d!56587 (= (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460)) e!127798)))

(declare-fun b!194277 () Bool)

(assert (=> b!194277 (= e!127798 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96663)))))))

(declare-fun b!194278 () Bool)

(assert (=> b!194278 (= e!127798 e!127799)))

(declare-fun c!35075 () Bool)

(assert (=> b!194278 (= c!35075 (and ((_ is Cons!2422) (toList!1225 lt!96663)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96663))) (_1!1766 lt!96460)))))))

(declare-fun b!194280 () Bool)

(assert (=> b!194280 (= e!127799 None!247)))

(assert (= (and d!56587 c!35074) b!194277))

(assert (= (and d!56587 (not c!35074)) b!194278))

(assert (= (and b!194278 c!35075) b!194279))

(assert (= (and b!194278 (not c!35075)) b!194280))

(declare-fun m!220623 () Bool)

(assert (=> b!194279 m!220623))

(assert (=> b!194015 d!56587))

(assert (=> b!193959 d!56539))

(declare-fun d!56589 () Bool)

(declare-fun e!127801 () Bool)

(assert (=> d!56589 e!127801))

(declare-fun res!91767 () Bool)

(assert (=> d!56589 (=> res!91767 e!127801)))

(declare-fun lt!96784 () Bool)

(assert (=> d!56589 (= res!91767 (not lt!96784))))

(declare-fun lt!96785 () Bool)

(assert (=> d!56589 (= lt!96784 lt!96785)))

(declare-fun lt!96783 () Unit!5819)

(declare-fun e!127800 () Unit!5819)

(assert (=> d!56589 (= lt!96783 e!127800)))

(declare-fun c!35076 () Bool)

(assert (=> d!56589 (= c!35076 lt!96785)))

(assert (=> d!56589 (= lt!96785 (containsKey!247 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56589 (= (contains!1356 lt!96632 #b1000000000000000000000000000000000000000000000000000000000000000) lt!96784)))

(declare-fun b!194281 () Bool)

(declare-fun lt!96782 () Unit!5819)

(assert (=> b!194281 (= e!127800 lt!96782)))

(assert (=> b!194281 (= lt!96782 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194281 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194282 () Bool)

(declare-fun Unit!5837 () Unit!5819)

(assert (=> b!194282 (= e!127800 Unit!5837)))

(declare-fun b!194283 () Bool)

(assert (=> b!194283 (= e!127801 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56589 c!35076) b!194281))

(assert (= (and d!56589 (not c!35076)) b!194282))

(assert (= (and d!56589 (not res!91767)) b!194283))

(declare-fun m!220625 () Bool)

(assert (=> d!56589 m!220625))

(declare-fun m!220627 () Bool)

(assert (=> b!194281 m!220627))

(declare-fun m!220629 () Bool)

(assert (=> b!194281 m!220629))

(assert (=> b!194281 m!220629))

(declare-fun m!220631 () Bool)

(assert (=> b!194281 m!220631))

(assert (=> b!194283 m!220629))

(assert (=> b!194283 m!220629))

(assert (=> b!194283 m!220631))

(assert (=> bm!19609 d!56589))

(declare-fun d!56591 () Bool)

(assert (=> d!56591 (= (apply!188 lt!96632 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7705 () Bool)

(assert (= bs!7705 d!56591))

(declare-fun m!220633 () Bool)

(assert (=> bs!7705 m!220633))

(assert (=> bs!7705 m!220633))

(declare-fun m!220635 () Bool)

(assert (=> bs!7705 m!220635))

(assert (=> b!193976 d!56591))

(declare-fun d!56593 () Bool)

(assert (=> d!56593 (contains!1356 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))

(assert (=> d!56593 true))

(declare-fun _$16!166 () Unit!5819)

(assert (=> d!56593 (= (choose!1071 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) (defaultEntry!3959 thiss!1248)) _$16!166)))

(declare-fun bs!7706 () Bool)

(assert (= bs!7706 d!56593))

(assert (=> bs!7706 m!220103))

(assert (=> bs!7706 m!220093))

(assert (=> bs!7706 m!220103))

(assert (=> bs!7706 m!220093))

(assert (=> bs!7706 m!220351))

(assert (=> d!56503 d!56593))

(assert (=> d!56503 d!56531))

(declare-fun d!56595 () Bool)

(declare-fun e!127802 () Bool)

(assert (=> d!56595 e!127802))

(declare-fun res!91768 () Bool)

(assert (=> d!56595 (=> (not res!91768) (not e!127802))))

(declare-fun lt!96786 () ListLongMap!2419)

(assert (=> d!56595 (= res!91768 (contains!1356 lt!96786 (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun lt!96788 () List!2426)

(assert (=> d!56595 (= lt!96786 (ListLongMap!2420 lt!96788))))

(declare-fun lt!96789 () Unit!5819)

(declare-fun lt!96787 () Unit!5819)

(assert (=> d!56595 (= lt!96789 lt!96787)))

(assert (=> d!56595 (= (getValueByKey!243 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309))) (Some!248 (_2!1766 (tuple2!3511 key!828 v!309))))))

(assert (=> d!56595 (= lt!96787 (lemmaContainsTupThenGetReturnValue!133 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))

(assert (=> d!56595 (= lt!96788 (insertStrictlySorted!136 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))

(assert (=> d!56595 (= (+!317 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (tuple2!3511 key!828 v!309)) lt!96786)))

(declare-fun b!194284 () Bool)

(declare-fun res!91769 () Bool)

(assert (=> b!194284 (=> (not res!91769) (not e!127802))))

(assert (=> b!194284 (= res!91769 (= (getValueByKey!243 (toList!1225 lt!96786) (_1!1766 (tuple2!3511 key!828 v!309))) (Some!248 (_2!1766 (tuple2!3511 key!828 v!309)))))))

(declare-fun b!194285 () Bool)

(assert (=> b!194285 (= e!127802 (contains!1359 (toList!1225 lt!96786) (tuple2!3511 key!828 v!309)))))

(assert (= (and d!56595 res!91768) b!194284))

(assert (= (and b!194284 res!91769) b!194285))

(declare-fun m!220637 () Bool)

(assert (=> d!56595 m!220637))

(declare-fun m!220639 () Bool)

(assert (=> d!56595 m!220639))

(declare-fun m!220641 () Bool)

(assert (=> d!56595 m!220641))

(declare-fun m!220643 () Bool)

(assert (=> d!56595 m!220643))

(declare-fun m!220645 () Bool)

(assert (=> b!194284 m!220645))

(declare-fun m!220647 () Bool)

(assert (=> b!194285 m!220647))

(assert (=> b!193998 d!56595))

(assert (=> b!193998 d!56497))

(declare-fun bm!19643 () Bool)

(declare-fun call!19648 () ListLongMap!2419)

(declare-fun call!19651 () ListLongMap!2419)

(assert (=> bm!19643 (= call!19648 call!19651)))

(declare-fun b!194286 () Bool)

(declare-fun e!127807 () ListLongMap!2419)

(declare-fun e!127812 () ListLongMap!2419)

(assert (=> b!194286 (= e!127807 e!127812)))

(declare-fun c!35077 () Bool)

(assert (=> b!194286 (= c!35077 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19644 () Bool)

(declare-fun call!19649 () ListLongMap!2419)

(declare-fun call!19652 () ListLongMap!2419)

(assert (=> bm!19644 (= call!19649 call!19652)))

(declare-fun b!194287 () Bool)

(declare-fun e!127804 () Bool)

(declare-fun lt!96795 () ListLongMap!2419)

(assert (=> b!194287 (= e!127804 (= (apply!188 lt!96795 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 thiss!1248)))))

(declare-fun b!194288 () Bool)

(declare-fun res!91774 () Bool)

(declare-fun e!127806 () Bool)

(assert (=> b!194288 (=> (not res!91774) (not e!127806))))

(declare-fun e!127808 () Bool)

(assert (=> b!194288 (= res!91774 e!127808)))

(declare-fun res!91778 () Bool)

(assert (=> b!194288 (=> res!91778 e!127808)))

(declare-fun e!127805 () Bool)

(assert (=> b!194288 (= res!91778 (not e!127805))))

(declare-fun res!91777 () Bool)

(assert (=> b!194288 (=> (not res!91777) (not e!127805))))

(assert (=> b!194288 (= res!91777 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194289 () Bool)

(declare-fun e!127809 () Unit!5819)

(declare-fun lt!96807 () Unit!5819)

(assert (=> b!194289 (= e!127809 lt!96807)))

(declare-fun lt!96802 () ListLongMap!2419)

(assert (=> b!194289 (= lt!96802 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96800 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96800 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96792 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96792 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96810 () Unit!5819)

(assert (=> b!194289 (= lt!96810 (addStillContains!164 lt!96802 lt!96800 (zeroValue!3800 thiss!1248) lt!96792))))

(assert (=> b!194289 (contains!1356 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))) lt!96792)))

(declare-fun lt!96801 () Unit!5819)

(assert (=> b!194289 (= lt!96801 lt!96810)))

(declare-fun lt!96791 () ListLongMap!2419)

(assert (=> b!194289 (= lt!96791 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96794 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96794 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96806 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96806 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96797 () Unit!5819)

(assert (=> b!194289 (= lt!96797 (addApplyDifferent!164 lt!96791 lt!96794 (minValue!3800 thiss!1248) lt!96806))))

(assert (=> b!194289 (= (apply!188 (+!317 lt!96791 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))) lt!96806) (apply!188 lt!96791 lt!96806))))

(declare-fun lt!96808 () Unit!5819)

(assert (=> b!194289 (= lt!96808 lt!96797)))

(declare-fun lt!96790 () ListLongMap!2419)

(assert (=> b!194289 (= lt!96790 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96805 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96803 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96803 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96809 () Unit!5819)

(assert (=> b!194289 (= lt!96809 (addApplyDifferent!164 lt!96790 lt!96805 (zeroValue!3800 thiss!1248) lt!96803))))

(assert (=> b!194289 (= (apply!188 (+!317 lt!96790 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))) lt!96803) (apply!188 lt!96790 lt!96803))))

(declare-fun lt!96811 () Unit!5819)

(assert (=> b!194289 (= lt!96811 lt!96809)))

(declare-fun lt!96796 () ListLongMap!2419)

(assert (=> b!194289 (= lt!96796 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96804 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96804 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96793 () (_ BitVec 64))

(assert (=> b!194289 (= lt!96793 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!194289 (= lt!96807 (addApplyDifferent!164 lt!96796 lt!96804 (minValue!3800 thiss!1248) lt!96793))))

(assert (=> b!194289 (= (apply!188 (+!317 lt!96796 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))) lt!96793) (apply!188 lt!96796 lt!96793))))

(declare-fun bm!19645 () Bool)

(declare-fun c!35082 () Bool)

(declare-fun call!19646 () ListLongMap!2419)

(assert (=> bm!19645 (= call!19652 (+!317 (ite c!35082 call!19651 (ite c!35077 call!19648 call!19646)) (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun bm!19646 () Bool)

(declare-fun call!19647 () Bool)

(assert (=> bm!19646 (= call!19647 (contains!1356 lt!96795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194290 () Bool)

(declare-fun Unit!5838 () Unit!5819)

(assert (=> b!194290 (= e!127809 Unit!5838)))

(declare-fun b!194291 () Bool)

(declare-fun c!35078 () Bool)

(assert (=> b!194291 (= c!35078 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127811 () ListLongMap!2419)

(assert (=> b!194291 (= e!127812 e!127811)))

(declare-fun bm!19647 () Bool)

(assert (=> bm!19647 (= call!19651 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194292 () Bool)

(declare-fun e!127803 () Bool)

(assert (=> b!194292 (= e!127806 e!127803)))

(declare-fun c!35081 () Bool)

(assert (=> b!194292 (= c!35081 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194293 () Bool)

(declare-fun e!127814 () Bool)

(assert (=> b!194293 (= e!127814 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194294 () Bool)

(declare-fun res!91772 () Bool)

(assert (=> b!194294 (=> (not res!91772) (not e!127806))))

(declare-fun e!127815 () Bool)

(assert (=> b!194294 (= res!91772 e!127815)))

(declare-fun c!35080 () Bool)

(assert (=> b!194294 (= c!35080 (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!194296 () Bool)

(declare-fun e!127813 () Bool)

(assert (=> b!194296 (= e!127803 e!127813)))

(declare-fun res!91771 () Bool)

(declare-fun call!19650 () Bool)

(assert (=> b!194296 (= res!91771 call!19650)))

(assert (=> b!194296 (=> (not res!91771) (not e!127813))))

(declare-fun b!194297 () Bool)

(assert (=> b!194297 (= e!127803 (not call!19650))))

(declare-fun e!127810 () Bool)

(declare-fun b!194298 () Bool)

(assert (=> b!194298 (= e!127810 (= (apply!188 lt!96795 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))))))))

(assert (=> b!194298 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194299 () Bool)

(assert (=> b!194299 (= e!127807 (+!317 call!19652 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!194300 () Bool)

(assert (=> b!194300 (= e!127811 call!19646)))

(declare-fun b!194301 () Bool)

(assert (=> b!194301 (= e!127812 call!19649)))

(declare-fun bm!19648 () Bool)

(assert (=> bm!19648 (= call!19650 (contains!1356 lt!96795 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194302 () Bool)

(assert (=> b!194302 (= e!127815 (not call!19647))))

(declare-fun b!194303 () Bool)

(assert (=> b!194303 (= e!127811 call!19649)))

(declare-fun b!194304 () Bool)

(assert (=> b!194304 (= e!127815 e!127804)))

(declare-fun res!91775 () Bool)

(assert (=> b!194304 (= res!91775 call!19647)))

(assert (=> b!194304 (=> (not res!91775) (not e!127804))))

(declare-fun bm!19649 () Bool)

(assert (=> bm!19649 (= call!19646 call!19648)))

(declare-fun b!194305 () Bool)

(assert (=> b!194305 (= e!127813 (= (apply!188 lt!96795 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 thiss!1248)))))

(declare-fun b!194306 () Bool)

(assert (=> b!194306 (= e!127805 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56597 () Bool)

(assert (=> d!56597 e!127806))

(declare-fun res!91770 () Bool)

(assert (=> d!56597 (=> (not res!91770) (not e!127806))))

(assert (=> d!56597 (= res!91770 (or (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))))

(declare-fun lt!96798 () ListLongMap!2419)

(assert (=> d!56597 (= lt!96795 lt!96798)))

(declare-fun lt!96799 () Unit!5819)

(assert (=> d!56597 (= lt!96799 e!127809)))

(declare-fun c!35079 () Bool)

(assert (=> d!56597 (= c!35079 e!127814)))

(declare-fun res!91776 () Bool)

(assert (=> d!56597 (=> (not res!91776) (not e!127814))))

(assert (=> d!56597 (= res!91776 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56597 (= lt!96798 e!127807)))

(assert (=> d!56597 (= c!35082 (and (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56597 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56597 (= (getCurrentListMap!858 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!96795)))

(declare-fun b!194295 () Bool)

(assert (=> b!194295 (= e!127808 e!127810)))

(declare-fun res!91773 () Bool)

(assert (=> b!194295 (=> (not res!91773) (not e!127810))))

(assert (=> b!194295 (= res!91773 (contains!1356 lt!96795 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (= (and d!56597 c!35082) b!194299))

(assert (= (and d!56597 (not c!35082)) b!194286))

(assert (= (and b!194286 c!35077) b!194301))

(assert (= (and b!194286 (not c!35077)) b!194291))

(assert (= (and b!194291 c!35078) b!194303))

(assert (= (and b!194291 (not c!35078)) b!194300))

(assert (= (or b!194303 b!194300) bm!19649))

(assert (= (or b!194301 bm!19649) bm!19643))

(assert (= (or b!194301 b!194303) bm!19644))

(assert (= (or b!194299 bm!19643) bm!19647))

(assert (= (or b!194299 bm!19644) bm!19645))

(assert (= (and d!56597 res!91776) b!194293))

(assert (= (and d!56597 c!35079) b!194289))

(assert (= (and d!56597 (not c!35079)) b!194290))

(assert (= (and d!56597 res!91770) b!194288))

(assert (= (and b!194288 res!91777) b!194306))

(assert (= (and b!194288 (not res!91778)) b!194295))

(assert (= (and b!194295 res!91773) b!194298))

(assert (= (and b!194288 res!91774) b!194294))

(assert (= (and b!194294 c!35080) b!194304))

(assert (= (and b!194294 (not c!35080)) b!194302))

(assert (= (and b!194304 res!91775) b!194287))

(assert (= (or b!194304 b!194302) bm!19646))

(assert (= (and b!194294 res!91772) b!194292))

(assert (= (and b!194292 c!35081) b!194296))

(assert (= (and b!194292 (not c!35081)) b!194297))

(assert (= (and b!194296 res!91771) b!194305))

(assert (= (or b!194296 b!194297) bm!19648))

(declare-fun b_lambda!7477 () Bool)

(assert (=> (not b_lambda!7477) (not b!194298)))

(assert (=> b!194298 t!7347))

(declare-fun b_and!11423 () Bool)

(assert (= b_and!11421 (and (=> t!7347 result!4931) b_and!11423)))

(declare-fun m!220649 () Bool)

(assert (=> bm!19648 m!220649))

(declare-fun m!220651 () Bool)

(assert (=> b!194305 m!220651))

(declare-fun m!220653 () Bool)

(assert (=> b!194299 m!220653))

(assert (=> b!194306 m!220231))

(assert (=> b!194306 m!220231))

(assert (=> b!194306 m!220233))

(declare-fun m!220655 () Bool)

(assert (=> bm!19647 m!220655))

(declare-fun m!220657 () Bool)

(assert (=> bm!19645 m!220657))

(declare-fun m!220659 () Bool)

(assert (=> b!194287 m!220659))

(assert (=> d!56597 m!220205))

(assert (=> b!194293 m!220231))

(assert (=> b!194293 m!220231))

(assert (=> b!194293 m!220233))

(declare-fun m!220661 () Bool)

(assert (=> b!194298 m!220661))

(assert (=> b!194298 m!220243))

(declare-fun m!220663 () Bool)

(assert (=> b!194298 m!220663))

(assert (=> b!194298 m!220231))

(declare-fun m!220665 () Bool)

(assert (=> b!194298 m!220665))

(assert (=> b!194298 m!220661))

(assert (=> b!194298 m!220243))

(assert (=> b!194298 m!220231))

(assert (=> b!194295 m!220231))

(assert (=> b!194295 m!220231))

(declare-fun m!220667 () Bool)

(assert (=> b!194295 m!220667))

(declare-fun m!220669 () Bool)

(assert (=> bm!19646 m!220669))

(declare-fun m!220671 () Bool)

(assert (=> b!194289 m!220671))

(declare-fun m!220673 () Bool)

(assert (=> b!194289 m!220673))

(declare-fun m!220675 () Bool)

(assert (=> b!194289 m!220675))

(declare-fun m!220677 () Bool)

(assert (=> b!194289 m!220677))

(assert (=> b!194289 m!220671))

(assert (=> b!194289 m!220655))

(declare-fun m!220679 () Bool)

(assert (=> b!194289 m!220679))

(declare-fun m!220681 () Bool)

(assert (=> b!194289 m!220681))

(declare-fun m!220683 () Bool)

(assert (=> b!194289 m!220683))

(declare-fun m!220685 () Bool)

(assert (=> b!194289 m!220685))

(declare-fun m!220687 () Bool)

(assert (=> b!194289 m!220687))

(declare-fun m!220689 () Bool)

(assert (=> b!194289 m!220689))

(assert (=> b!194289 m!220679))

(declare-fun m!220691 () Bool)

(assert (=> b!194289 m!220691))

(assert (=> b!194289 m!220683))

(declare-fun m!220693 () Bool)

(assert (=> b!194289 m!220693))

(assert (=> b!194289 m!220675))

(declare-fun m!220695 () Bool)

(assert (=> b!194289 m!220695))

(declare-fun m!220697 () Bool)

(assert (=> b!194289 m!220697))

(assert (=> b!194289 m!220231))

(declare-fun m!220699 () Bool)

(assert (=> b!194289 m!220699))

(assert (=> b!193998 d!56597))

(declare-fun d!56599 () Bool)

(assert (=> d!56599 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))))

(declare-fun bs!7707 () Bool)

(assert (= bs!7707 d!56599))

(assert (=> bs!7707 m!220369))

(declare-fun m!220701 () Bool)

(assert (=> bs!7707 m!220701))

(assert (=> b!194019 d!56599))

(declare-fun b!194309 () Bool)

(declare-fun e!127817 () Option!249)

(assert (=> b!194309 (= e!127817 (getValueByKey!243 (t!7343 (toList!1225 lt!96451)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun d!56601 () Bool)

(declare-fun c!35083 () Bool)

(assert (=> d!56601 (= c!35083 (and ((_ is Cons!2422) (toList!1225 lt!96451)) (= (_1!1766 (h!3063 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(declare-fun e!127816 () Option!249)

(assert (=> d!56601 (= (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) e!127816)))

(declare-fun b!194307 () Bool)

(assert (=> b!194307 (= e!127816 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96451)))))))

(declare-fun b!194308 () Bool)

(assert (=> b!194308 (= e!127816 e!127817)))

(declare-fun c!35084 () Bool)

(assert (=> b!194308 (= c!35084 (and ((_ is Cons!2422) (toList!1225 lt!96451)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))))

(declare-fun b!194310 () Bool)

(assert (=> b!194310 (= e!127817 None!247)))

(assert (= (and d!56601 c!35083) b!194307))

(assert (= (and d!56601 (not c!35083)) b!194308))

(assert (= (and b!194308 c!35084) b!194309))

(assert (= (and b!194308 (not c!35084)) b!194310))

(assert (=> b!194309 m!220093))

(declare-fun m!220703 () Bool)

(assert (=> b!194309 m!220703))

(assert (=> b!194019 d!56601))

(declare-fun d!56603 () Bool)

(declare-fun res!91783 () Bool)

(declare-fun e!127822 () Bool)

(assert (=> d!56603 (=> res!91783 e!127822)))

(assert (=> d!56603 (= res!91783 (and ((_ is Cons!2422) (toList!1225 lt!96453)) (= (_1!1766 (h!3063 (toList!1225 lt!96453))) key!828)))))

(assert (=> d!56603 (= (containsKey!247 (toList!1225 lt!96453) key!828) e!127822)))

(declare-fun b!194315 () Bool)

(declare-fun e!127823 () Bool)

(assert (=> b!194315 (= e!127822 e!127823)))

(declare-fun res!91784 () Bool)

(assert (=> b!194315 (=> (not res!91784) (not e!127823))))

(assert (=> b!194315 (= res!91784 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96453))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96453))) key!828)) ((_ is Cons!2422) (toList!1225 lt!96453)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96453))) key!828)))))

(declare-fun b!194316 () Bool)

(assert (=> b!194316 (= e!127823 (containsKey!247 (t!7343 (toList!1225 lt!96453)) key!828))))

(assert (= (and d!56603 (not res!91783)) b!194315))

(assert (= (and b!194315 res!91784) b!194316))

(declare-fun m!220705 () Bool)

(assert (=> b!194316 m!220705))

(assert (=> d!56493 d!56603))

(declare-fun bm!19650 () Bool)

(declare-fun call!19655 () ListLongMap!2419)

(declare-fun call!19658 () ListLongMap!2419)

(assert (=> bm!19650 (= call!19655 call!19658)))

(declare-fun b!194317 () Bool)

(declare-fun e!127828 () ListLongMap!2419)

(declare-fun e!127833 () ListLongMap!2419)

(assert (=> b!194317 (= e!127828 e!127833)))

(declare-fun c!35085 () Bool)

(assert (=> b!194317 (= c!35085 (and (not (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19651 () Bool)

(declare-fun call!19656 () ListLongMap!2419)

(declare-fun call!19659 () ListLongMap!2419)

(assert (=> bm!19651 (= call!19656 call!19659)))

(declare-fun b!194318 () Bool)

(declare-fun e!127825 () Bool)

(declare-fun lt!96817 () ListLongMap!2419)

(assert (=> b!194318 (= e!127825 (= (apply!188 lt!96817 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3800 lt!96455)))))

(declare-fun b!194319 () Bool)

(declare-fun res!91789 () Bool)

(declare-fun e!127827 () Bool)

(assert (=> b!194319 (=> (not res!91789) (not e!127827))))

(declare-fun e!127829 () Bool)

(assert (=> b!194319 (= res!91789 e!127829)))

(declare-fun res!91793 () Bool)

(assert (=> b!194319 (=> res!91793 e!127829)))

(declare-fun e!127826 () Bool)

(assert (=> b!194319 (= res!91793 (not e!127826))))

(declare-fun res!91792 () Bool)

(assert (=> b!194319 (=> (not res!91792) (not e!127826))))

(assert (=> b!194319 (= res!91792 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!194320 () Bool)

(declare-fun e!127830 () Unit!5819)

(declare-fun lt!96829 () Unit!5819)

(assert (=> b!194320 (= e!127830 lt!96829)))

(declare-fun lt!96824 () ListLongMap!2419)

(assert (=> b!194320 (= lt!96824 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)))))

(declare-fun lt!96822 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96814 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96814 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))

(declare-fun lt!96832 () Unit!5819)

(assert (=> b!194320 (= lt!96832 (addStillContains!164 lt!96824 lt!96822 (zeroValue!3800 lt!96455) lt!96814))))

(assert (=> b!194320 (contains!1356 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))) lt!96814)))

(declare-fun lt!96823 () Unit!5819)

(assert (=> b!194320 (= lt!96823 lt!96832)))

(declare-fun lt!96813 () ListLongMap!2419)

(assert (=> b!194320 (= lt!96813 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)))))

(declare-fun lt!96816 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96828 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96828 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))

(declare-fun lt!96819 () Unit!5819)

(assert (=> b!194320 (= lt!96819 (addApplyDifferent!164 lt!96813 lt!96816 (minValue!3800 lt!96455) lt!96828))))

(assert (=> b!194320 (= (apply!188 (+!317 lt!96813 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))) lt!96828) (apply!188 lt!96813 lt!96828))))

(declare-fun lt!96830 () Unit!5819)

(assert (=> b!194320 (= lt!96830 lt!96819)))

(declare-fun lt!96812 () ListLongMap!2419)

(assert (=> b!194320 (= lt!96812 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)))))

(declare-fun lt!96827 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96825 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96825 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))

(declare-fun lt!96831 () Unit!5819)

(assert (=> b!194320 (= lt!96831 (addApplyDifferent!164 lt!96812 lt!96827 (zeroValue!3800 lt!96455) lt!96825))))

(assert (=> b!194320 (= (apply!188 (+!317 lt!96812 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))) lt!96825) (apply!188 lt!96812 lt!96825))))

(declare-fun lt!96833 () Unit!5819)

(assert (=> b!194320 (= lt!96833 lt!96831)))

(declare-fun lt!96818 () ListLongMap!2419)

(assert (=> b!194320 (= lt!96818 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)))))

(declare-fun lt!96826 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96815 () (_ BitVec 64))

(assert (=> b!194320 (= lt!96815 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))

(assert (=> b!194320 (= lt!96829 (addApplyDifferent!164 lt!96818 lt!96826 (minValue!3800 lt!96455) lt!96815))))

(assert (=> b!194320 (= (apply!188 (+!317 lt!96818 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))) lt!96815) (apply!188 lt!96818 lt!96815))))

(declare-fun bm!19652 () Bool)

(declare-fun c!35090 () Bool)

(declare-fun call!19653 () ListLongMap!2419)

(assert (=> bm!19652 (= call!19659 (+!317 (ite c!35090 call!19658 (ite c!35085 call!19655 call!19653)) (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))

(declare-fun bm!19653 () Bool)

(declare-fun call!19654 () Bool)

(assert (=> bm!19653 (= call!19654 (contains!1356 lt!96817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194321 () Bool)

(declare-fun Unit!5839 () Unit!5819)

(assert (=> b!194321 (= e!127830 Unit!5839)))

(declare-fun b!194322 () Bool)

(declare-fun c!35086 () Bool)

(assert (=> b!194322 (= c!35086 (and (not (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127832 () ListLongMap!2419)

(assert (=> b!194322 (= e!127833 e!127832)))

(declare-fun bm!19654 () Bool)

(assert (=> bm!19654 (= call!19658 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)))))

(declare-fun b!194323 () Bool)

(declare-fun e!127824 () Bool)

(assert (=> b!194323 (= e!127827 e!127824)))

(declare-fun c!35089 () Bool)

(assert (=> b!194323 (= c!35089 (not (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!194324 () Bool)

(declare-fun e!127835 () Bool)

(assert (=> b!194324 (= e!127835 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!194325 () Bool)

(declare-fun res!91787 () Bool)

(assert (=> b!194325 (=> (not res!91787) (not e!127827))))

(declare-fun e!127836 () Bool)

(assert (=> b!194325 (= res!91787 e!127836)))

(declare-fun c!35088 () Bool)

(assert (=> b!194325 (= c!35088 (not (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!194327 () Bool)

(declare-fun e!127834 () Bool)

(assert (=> b!194327 (= e!127824 e!127834)))

(declare-fun res!91786 () Bool)

(declare-fun call!19657 () Bool)

(assert (=> b!194327 (= res!91786 call!19657)))

(assert (=> b!194327 (=> (not res!91786) (not e!127834))))

(declare-fun b!194328 () Bool)

(assert (=> b!194328 (= e!127824 (not call!19657))))

(declare-fun b!194329 () Bool)

(declare-fun e!127831 () Bool)

(assert (=> b!194329 (= e!127831 (= (apply!188 lt!96817 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (_values!3942 lt!96455))))))

(assert (=> b!194329 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!194330 () Bool)

(assert (=> b!194330 (= e!127828 (+!317 call!19659 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))

(declare-fun b!194331 () Bool)

(assert (=> b!194331 (= e!127832 call!19653)))

(declare-fun b!194332 () Bool)

(assert (=> b!194332 (= e!127833 call!19656)))

(declare-fun bm!19655 () Bool)

(assert (=> bm!19655 (= call!19657 (contains!1356 lt!96817 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194333 () Bool)

(assert (=> b!194333 (= e!127836 (not call!19654))))

(declare-fun b!194334 () Bool)

(assert (=> b!194334 (= e!127832 call!19656)))

(declare-fun b!194335 () Bool)

(assert (=> b!194335 (= e!127836 e!127825)))

(declare-fun res!91790 () Bool)

(assert (=> b!194335 (= res!91790 call!19654)))

(assert (=> b!194335 (=> (not res!91790) (not e!127825))))

(declare-fun bm!19656 () Bool)

(assert (=> bm!19656 (= call!19653 call!19655)))

(declare-fun b!194336 () Bool)

(assert (=> b!194336 (= e!127834 (= (apply!188 lt!96817 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3800 lt!96455)))))

(declare-fun b!194337 () Bool)

(assert (=> b!194337 (= e!127826 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun d!56605 () Bool)

(assert (=> d!56605 e!127827))

(declare-fun res!91785 () Bool)

(assert (=> d!56605 (=> (not res!91785) (not e!127827))))

(assert (=> d!56605 (= res!91785 (or (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))))

(declare-fun lt!96820 () ListLongMap!2419)

(assert (=> d!56605 (= lt!96817 lt!96820)))

(declare-fun lt!96821 () Unit!5819)

(assert (=> d!56605 (= lt!96821 e!127830)))

(declare-fun c!35087 () Bool)

(assert (=> d!56605 (= c!35087 e!127835)))

(declare-fun res!91791 () Bool)

(assert (=> d!56605 (=> (not res!91791) (not e!127835))))

(assert (=> d!56605 (= res!91791 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56605 (= lt!96820 e!127828)))

(assert (=> d!56605 (= c!35090 (and (not (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3696 lt!96455) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56605 (validMask!0 (mask!9221 lt!96455))))

(assert (=> d!56605 (= (getCurrentListMap!858 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)) lt!96817)))

(declare-fun b!194326 () Bool)

(assert (=> b!194326 (= e!127829 e!127831)))

(declare-fun res!91788 () Bool)

(assert (=> b!194326 (=> (not res!91788) (not e!127831))))

(assert (=> b!194326 (= res!91788 (contains!1356 lt!96817 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (=> b!194326 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (= (and d!56605 c!35090) b!194330))

(assert (= (and d!56605 (not c!35090)) b!194317))

(assert (= (and b!194317 c!35085) b!194332))

(assert (= (and b!194317 (not c!35085)) b!194322))

(assert (= (and b!194322 c!35086) b!194334))

(assert (= (and b!194322 (not c!35086)) b!194331))

(assert (= (or b!194334 b!194331) bm!19656))

(assert (= (or b!194332 bm!19656) bm!19650))

(assert (= (or b!194332 b!194334) bm!19651))

(assert (= (or b!194330 bm!19650) bm!19654))

(assert (= (or b!194330 bm!19651) bm!19652))

(assert (= (and d!56605 res!91791) b!194324))

(assert (= (and d!56605 c!35087) b!194320))

(assert (= (and d!56605 (not c!35087)) b!194321))

(assert (= (and d!56605 res!91785) b!194319))

(assert (= (and b!194319 res!91792) b!194337))

(assert (= (and b!194319 (not res!91793)) b!194326))

(assert (= (and b!194326 res!91788) b!194329))

(assert (= (and b!194319 res!91789) b!194325))

(assert (= (and b!194325 c!35088) b!194335))

(assert (= (and b!194325 (not c!35088)) b!194333))

(assert (= (and b!194335 res!91790) b!194318))

(assert (= (or b!194335 b!194333) bm!19653))

(assert (= (and b!194325 res!91787) b!194323))

(assert (= (and b!194323 c!35089) b!194327))

(assert (= (and b!194323 (not c!35089)) b!194328))

(assert (= (and b!194327 res!91786) b!194336))

(assert (= (or b!194327 b!194328) bm!19655))

(declare-fun b_lambda!7479 () Bool)

(assert (=> (not b_lambda!7479) (not b!194329)))

(declare-fun t!7350 () Bool)

(declare-fun tb!2881 () Bool)

(assert (=> (and b!193809 (= (defaultEntry!3959 thiss!1248) (defaultEntry!3959 lt!96455)) t!7350) tb!2881))

(declare-fun result!4937 () Bool)

(assert (=> tb!2881 (= result!4937 tp_is_empty!4489)))

(assert (=> b!194329 t!7350))

(declare-fun b_and!11425 () Bool)

(assert (= b_and!11423 (and (=> t!7350 result!4937) b_and!11425)))

(declare-fun m!220707 () Bool)

(assert (=> bm!19655 m!220707))

(declare-fun m!220709 () Bool)

(assert (=> b!194336 m!220709))

(declare-fun m!220711 () Bool)

(assert (=> b!194330 m!220711))

(assert (=> b!194337 m!220529))

(assert (=> b!194337 m!220529))

(assert (=> b!194337 m!220531))

(declare-fun m!220713 () Bool)

(assert (=> bm!19654 m!220713))

(declare-fun m!220715 () Bool)

(assert (=> bm!19652 m!220715))

(declare-fun m!220717 () Bool)

(assert (=> b!194318 m!220717))

(declare-fun m!220719 () Bool)

(assert (=> d!56605 m!220719))

(assert (=> b!194324 m!220529))

(assert (=> b!194324 m!220529))

(assert (=> b!194324 m!220531))

(declare-fun m!220721 () Bool)

(assert (=> b!194329 m!220721))

(declare-fun m!220723 () Bool)

(assert (=> b!194329 m!220723))

(declare-fun m!220725 () Bool)

(assert (=> b!194329 m!220725))

(assert (=> b!194329 m!220529))

(declare-fun m!220727 () Bool)

(assert (=> b!194329 m!220727))

(assert (=> b!194329 m!220721))

(assert (=> b!194329 m!220723))

(assert (=> b!194329 m!220529))

(assert (=> b!194326 m!220529))

(assert (=> b!194326 m!220529))

(declare-fun m!220729 () Bool)

(assert (=> b!194326 m!220729))

(declare-fun m!220731 () Bool)

(assert (=> bm!19653 m!220731))

(declare-fun m!220733 () Bool)

(assert (=> b!194320 m!220733))

(declare-fun m!220735 () Bool)

(assert (=> b!194320 m!220735))

(declare-fun m!220737 () Bool)

(assert (=> b!194320 m!220737))

(declare-fun m!220739 () Bool)

(assert (=> b!194320 m!220739))

(assert (=> b!194320 m!220733))

(assert (=> b!194320 m!220713))

(declare-fun m!220741 () Bool)

(assert (=> b!194320 m!220741))

(declare-fun m!220743 () Bool)

(assert (=> b!194320 m!220743))

(declare-fun m!220745 () Bool)

(assert (=> b!194320 m!220745))

(declare-fun m!220747 () Bool)

(assert (=> b!194320 m!220747))

(declare-fun m!220749 () Bool)

(assert (=> b!194320 m!220749))

(declare-fun m!220751 () Bool)

(assert (=> b!194320 m!220751))

(assert (=> b!194320 m!220741))

(declare-fun m!220753 () Bool)

(assert (=> b!194320 m!220753))

(assert (=> b!194320 m!220745))

(declare-fun m!220755 () Bool)

(assert (=> b!194320 m!220755))

(assert (=> b!194320 m!220737))

(declare-fun m!220757 () Bool)

(assert (=> b!194320 m!220757))

(declare-fun m!220759 () Bool)

(assert (=> b!194320 m!220759))

(assert (=> b!194320 m!220529))

(declare-fun m!220761 () Bool)

(assert (=> b!194320 m!220761))

(assert (=> d!56525 d!56605))

(declare-fun d!56607 () Bool)

(assert (=> d!56607 (= (apply!188 lt!96610 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2232 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7708 () Bool)

(assert (= bs!7708 d!56607))

(assert (=> bs!7708 m!220231))

(assert (=> bs!7708 m!220439))

(assert (=> bs!7708 m!220439))

(declare-fun m!220763 () Bool)

(assert (=> bs!7708 m!220763))

(assert (=> b!193964 d!56607))

(declare-fun d!56609 () Bool)

(declare-fun c!35091 () Bool)

(assert (=> d!56609 (= c!35091 ((_ is ValueCellFull!1901) (select (arr!3863 lt!96452) #b00000000000000000000000000000000)))))

(declare-fun e!127837 () V!5633)

(assert (=> d!56609 (= (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!127837)))

(declare-fun b!194338 () Bool)

(assert (=> b!194338 (= e!127837 (get!2233 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194339 () Bool)

(assert (=> b!194339 (= e!127837 (get!2234 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56609 c!35091) b!194338))

(assert (= (and d!56609 (not c!35091)) b!194339))

(assert (=> b!194338 m!220241))

(assert (=> b!194338 m!220243))

(declare-fun m!220765 () Bool)

(assert (=> b!194338 m!220765))

(assert (=> b!194339 m!220241))

(assert (=> b!194339 m!220243))

(declare-fun m!220767 () Bool)

(assert (=> b!194339 m!220767))

(assert (=> b!193964 d!56609))

(declare-fun d!56611 () Bool)

(declare-fun res!91794 () Bool)

(declare-fun e!127838 () Bool)

(assert (=> d!56611 (=> res!91794 e!127838)))

(assert (=> d!56611 (= res!91794 (and ((_ is Cons!2422) (toList!1225 lt!96454)) (= (_1!1766 (h!3063 (toList!1225 lt!96454))) key!828)))))

(assert (=> d!56611 (= (containsKey!247 (toList!1225 lt!96454) key!828) e!127838)))

(declare-fun b!194340 () Bool)

(declare-fun e!127839 () Bool)

(assert (=> b!194340 (= e!127838 e!127839)))

(declare-fun res!91795 () Bool)

(assert (=> b!194340 (=> (not res!91795) (not e!127839))))

(assert (=> b!194340 (= res!91795 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96454))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96454))) key!828)) ((_ is Cons!2422) (toList!1225 lt!96454)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96454))) key!828)))))

(declare-fun b!194341 () Bool)

(assert (=> b!194341 (= e!127839 (containsKey!247 (t!7343 (toList!1225 lt!96454)) key!828))))

(assert (= (and d!56611 (not res!91794)) b!194340))

(assert (= (and b!194340 res!91795) b!194341))

(declare-fun m!220769 () Bool)

(assert (=> b!194341 m!220769))

(assert (=> d!56523 d!56611))

(declare-fun d!56613 () Bool)

(declare-fun res!91800 () Bool)

(declare-fun e!127844 () Bool)

(assert (=> d!56613 (=> res!91800 e!127844)))

(assert (=> d!56613 (= res!91800 (= (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56613 (= (arrayContainsKey!0 (_keys!5952 thiss!1248) key!828 #b00000000000000000000000000000000) e!127844)))

(declare-fun b!194346 () Bool)

(declare-fun e!127845 () Bool)

(assert (=> b!194346 (= e!127844 e!127845)))

(declare-fun res!91801 () Bool)

(assert (=> b!194346 (=> (not res!91801) (not e!127845))))

(assert (=> b!194346 (= res!91801 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194347 () Bool)

(assert (=> b!194347 (= e!127845 (arrayContainsKey!0 (_keys!5952 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56613 (not res!91800)) b!194346))

(assert (= (and b!194346 res!91801) b!194347))

(assert (=> d!56613 m!220231))

(declare-fun m!220771 () Bool)

(assert (=> b!194347 m!220771))

(assert (=> bm!19616 d!56613))

(assert (=> d!56497 d!56531))

(assert (=> b!193978 d!56555))

(declare-fun d!56615 () Bool)

(assert (=> d!56615 (= (apply!188 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) lt!96643) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!96643)))))

(declare-fun bs!7709 () Bool)

(assert (= bs!7709 d!56615))

(declare-fun m!220773 () Bool)

(assert (=> bs!7709 m!220773))

(assert (=> bs!7709 m!220773))

(declare-fun m!220775 () Bool)

(assert (=> bs!7709 m!220775))

(assert (=> b!193978 d!56615))

(declare-fun d!56617 () Bool)

(assert (=> d!56617 (= (apply!188 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) lt!96640) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96640)))))

(declare-fun bs!7710 () Bool)

(assert (= bs!7710 d!56617))

(declare-fun m!220777 () Bool)

(assert (=> bs!7710 m!220777))

(assert (=> bs!7710 m!220777))

(declare-fun m!220779 () Bool)

(assert (=> bs!7710 m!220779))

(assert (=> b!193978 d!56617))

(declare-fun d!56619 () Bool)

(declare-fun e!127846 () Bool)

(assert (=> d!56619 e!127846))

(declare-fun res!91802 () Bool)

(assert (=> d!56619 (=> (not res!91802) (not e!127846))))

(declare-fun lt!96834 () ListLongMap!2419)

(assert (=> d!56619 (= res!91802 (contains!1356 lt!96834 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96836 () List!2426)

(assert (=> d!56619 (= lt!96834 (ListLongMap!2420 lt!96836))))

(declare-fun lt!96837 () Unit!5819)

(declare-fun lt!96835 () Unit!5819)

(assert (=> d!56619 (= lt!96837 lt!96835)))

(assert (=> d!56619 (= (getValueByKey!243 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(assert (=> d!56619 (= lt!96835 (lemmaContainsTupThenGetReturnValue!133 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(assert (=> d!56619 (= lt!96836 (insertStrictlySorted!136 (toList!1225 lt!96628) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(assert (=> d!56619 (= (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) lt!96834)))

(declare-fun b!194348 () Bool)

(declare-fun res!91803 () Bool)

(assert (=> b!194348 (=> (not res!91803) (not e!127846))))

(assert (=> b!194348 (= res!91803 (= (getValueByKey!243 (toList!1225 lt!96834) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(declare-fun b!194349 () Bool)

(assert (=> b!194349 (= e!127846 (contains!1359 (toList!1225 lt!96834) (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))

(assert (= (and d!56619 res!91802) b!194348))

(assert (= (and b!194348 res!91803) b!194349))

(declare-fun m!220781 () Bool)

(assert (=> d!56619 m!220781))

(declare-fun m!220783 () Bool)

(assert (=> d!56619 m!220783))

(declare-fun m!220785 () Bool)

(assert (=> d!56619 m!220785))

(declare-fun m!220787 () Bool)

(assert (=> d!56619 m!220787))

(declare-fun m!220789 () Bool)

(assert (=> b!194348 m!220789))

(declare-fun m!220791 () Bool)

(assert (=> b!194349 m!220791))

(assert (=> b!193978 d!56619))

(declare-fun d!56621 () Bool)

(assert (=> d!56621 (= (apply!188 lt!96633 lt!96630) (get!2232 (getValueByKey!243 (toList!1225 lt!96633) lt!96630)))))

(declare-fun bs!7711 () Bool)

(assert (= bs!7711 d!56621))

(declare-fun m!220793 () Bool)

(assert (=> bs!7711 m!220793))

(assert (=> bs!7711 m!220793))

(declare-fun m!220795 () Bool)

(assert (=> bs!7711 m!220795))

(assert (=> b!193978 d!56621))

(declare-fun d!56623 () Bool)

(declare-fun e!127847 () Bool)

(assert (=> d!56623 e!127847))

(declare-fun res!91804 () Bool)

(assert (=> d!56623 (=> (not res!91804) (not e!127847))))

(declare-fun lt!96838 () ListLongMap!2419)

(assert (=> d!56623 (= res!91804 (contains!1356 lt!96838 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96840 () List!2426)

(assert (=> d!56623 (= lt!96838 (ListLongMap!2420 lt!96840))))

(declare-fun lt!96841 () Unit!5819)

(declare-fun lt!96839 () Unit!5819)

(assert (=> d!56623 (= lt!96841 lt!96839)))

(assert (=> d!56623 (= (getValueByKey!243 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56623 (= lt!96839 (lemmaContainsTupThenGetReturnValue!133 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56623 (= lt!96840 (insertStrictlySorted!136 (toList!1225 lt!96627) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56623 (= (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) lt!96838)))

(declare-fun b!194350 () Bool)

(declare-fun res!91805 () Bool)

(assert (=> b!194350 (=> (not res!91805) (not e!127847))))

(assert (=> b!194350 (= res!91805 (= (getValueByKey!243 (toList!1225 lt!96838) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194351 () Bool)

(assert (=> b!194351 (= e!127847 (contains!1359 (toList!1225 lt!96838) (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56623 res!91804) b!194350))

(assert (= (and b!194350 res!91805) b!194351))

(declare-fun m!220797 () Bool)

(assert (=> d!56623 m!220797))

(declare-fun m!220799 () Bool)

(assert (=> d!56623 m!220799))

(declare-fun m!220801 () Bool)

(assert (=> d!56623 m!220801))

(declare-fun m!220803 () Bool)

(assert (=> d!56623 m!220803))

(declare-fun m!220805 () Bool)

(assert (=> b!194350 m!220805))

(declare-fun m!220807 () Bool)

(assert (=> b!194351 m!220807))

(assert (=> b!193978 d!56623))

(declare-fun d!56625 () Bool)

(assert (=> d!56625 (= (apply!188 lt!96627 lt!96640) (get!2232 (getValueByKey!243 (toList!1225 lt!96627) lt!96640)))))

(declare-fun bs!7712 () Bool)

(assert (= bs!7712 d!56625))

(declare-fun m!220809 () Bool)

(assert (=> bs!7712 m!220809))

(assert (=> bs!7712 m!220809))

(declare-fun m!220811 () Bool)

(assert (=> bs!7712 m!220811))

(assert (=> b!193978 d!56625))

(declare-fun d!56627 () Bool)

(assert (=> d!56627 (= (apply!188 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) lt!96643) (apply!188 lt!96628 lt!96643))))

(declare-fun lt!96844 () Unit!5819)

(declare-fun choose!1076 (ListLongMap!2419 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5819)

(assert (=> d!56627 (= lt!96844 (choose!1076 lt!96628 lt!96631 (minValue!3800 thiss!1248) lt!96643))))

(declare-fun e!127850 () Bool)

(assert (=> d!56627 e!127850))

(declare-fun res!91808 () Bool)

(assert (=> d!56627 (=> (not res!91808) (not e!127850))))

(assert (=> d!56627 (= res!91808 (contains!1356 lt!96628 lt!96643))))

(assert (=> d!56627 (= (addApplyDifferent!164 lt!96628 lt!96631 (minValue!3800 thiss!1248) lt!96643) lt!96844)))

(declare-fun b!194355 () Bool)

(assert (=> b!194355 (= e!127850 (not (= lt!96643 lt!96631)))))

(assert (= (and d!56627 res!91808) b!194355))

(assert (=> d!56627 m!220313))

(assert (=> d!56627 m!220325))

(assert (=> d!56627 m!220321))

(declare-fun m!220813 () Bool)

(assert (=> d!56627 m!220813))

(declare-fun m!220815 () Bool)

(assert (=> d!56627 m!220815))

(assert (=> d!56627 m!220313))

(assert (=> b!193978 d!56627))

(declare-fun d!56629 () Bool)

(assert (=> d!56629 (= (apply!188 lt!96628 lt!96643) (get!2232 (getValueByKey!243 (toList!1225 lt!96628) lt!96643)))))

(declare-fun bs!7713 () Bool)

(assert (= bs!7713 d!56629))

(declare-fun m!220817 () Bool)

(assert (=> bs!7713 m!220817))

(assert (=> bs!7713 m!220817))

(declare-fun m!220819 () Bool)

(assert (=> bs!7713 m!220819))

(assert (=> b!193978 d!56629))

(declare-fun d!56631 () Bool)

(assert (=> d!56631 (= (apply!188 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) lt!96640) (apply!188 lt!96627 lt!96640))))

(declare-fun lt!96845 () Unit!5819)

(assert (=> d!56631 (= lt!96845 (choose!1076 lt!96627 lt!96642 (zeroValue!3800 thiss!1248) lt!96640))))

(declare-fun e!127851 () Bool)

(assert (=> d!56631 e!127851))

(declare-fun res!91809 () Bool)

(assert (=> d!56631 (=> (not res!91809) (not e!127851))))

(assert (=> d!56631 (= res!91809 (contains!1356 lt!96627 lt!96640))))

(assert (=> d!56631 (= (addApplyDifferent!164 lt!96627 lt!96642 (zeroValue!3800 thiss!1248) lt!96640) lt!96845)))

(declare-fun b!194356 () Bool)

(assert (=> b!194356 (= e!127851 (not (= lt!96640 lt!96642)))))

(assert (= (and d!56631 res!91809) b!194356))

(assert (=> d!56631 m!220305))

(assert (=> d!56631 m!220307))

(assert (=> d!56631 m!220315))

(declare-fun m!220821 () Bool)

(assert (=> d!56631 m!220821))

(declare-fun m!220823 () Bool)

(assert (=> d!56631 m!220823))

(assert (=> d!56631 m!220305))

(assert (=> b!193978 d!56631))

(declare-fun d!56633 () Bool)

(declare-fun e!127853 () Bool)

(assert (=> d!56633 e!127853))

(declare-fun res!91810 () Bool)

(assert (=> d!56633 (=> res!91810 e!127853)))

(declare-fun lt!96848 () Bool)

(assert (=> d!56633 (= res!91810 (not lt!96848))))

(declare-fun lt!96849 () Bool)

(assert (=> d!56633 (= lt!96848 lt!96849)))

(declare-fun lt!96847 () Unit!5819)

(declare-fun e!127852 () Unit!5819)

(assert (=> d!56633 (= lt!96847 e!127852)))

(declare-fun c!35092 () Bool)

(assert (=> d!56633 (= c!35092 lt!96849)))

(assert (=> d!56633 (= lt!96849 (containsKey!247 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))

(assert (=> d!56633 (= (contains!1356 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) lt!96629) lt!96848)))

(declare-fun b!194357 () Bool)

(declare-fun lt!96846 () Unit!5819)

(assert (=> b!194357 (= e!127852 lt!96846)))

(assert (=> b!194357 (= lt!96846 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))

(assert (=> b!194357 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))

(declare-fun b!194358 () Bool)

(declare-fun Unit!5840 () Unit!5819)

(assert (=> b!194358 (= e!127852 Unit!5840)))

(declare-fun b!194359 () Bool)

(assert (=> b!194359 (= e!127853 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629)))))

(assert (= (and d!56633 c!35092) b!194357))

(assert (= (and d!56633 (not c!35092)) b!194358))

(assert (= (and d!56633 (not res!91810)) b!194359))

(declare-fun m!220825 () Bool)

(assert (=> d!56633 m!220825))

(declare-fun m!220827 () Bool)

(assert (=> b!194357 m!220827))

(declare-fun m!220829 () Bool)

(assert (=> b!194357 m!220829))

(assert (=> b!194357 m!220829))

(declare-fun m!220831 () Bool)

(assert (=> b!194357 m!220831))

(assert (=> b!194359 m!220829))

(assert (=> b!194359 m!220829))

(assert (=> b!194359 m!220831))

(assert (=> b!193978 d!56633))

(declare-fun d!56635 () Bool)

(assert (=> d!56635 (= (apply!188 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) lt!96630) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96630)))))

(declare-fun bs!7714 () Bool)

(assert (= bs!7714 d!56635))

(declare-fun m!220833 () Bool)

(assert (=> bs!7714 m!220833))

(assert (=> bs!7714 m!220833))

(declare-fun m!220835 () Bool)

(assert (=> bs!7714 m!220835))

(assert (=> b!193978 d!56635))

(declare-fun d!56637 () Bool)

(assert (=> d!56637 (= (apply!188 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) lt!96630) (apply!188 lt!96633 lt!96630))))

(declare-fun lt!96850 () Unit!5819)

(assert (=> d!56637 (= lt!96850 (choose!1076 lt!96633 lt!96641 (minValue!3800 thiss!1248) lt!96630))))

(declare-fun e!127854 () Bool)

(assert (=> d!56637 e!127854))

(declare-fun res!91811 () Bool)

(assert (=> d!56637 (=> (not res!91811) (not e!127854))))

(assert (=> d!56637 (= res!91811 (contains!1356 lt!96633 lt!96630))))

(assert (=> d!56637 (= (addApplyDifferent!164 lt!96633 lt!96641 (minValue!3800 thiss!1248) lt!96630) lt!96850)))

(declare-fun b!194360 () Bool)

(assert (=> b!194360 (= e!127854 (not (= lt!96630 lt!96641)))))

(assert (= (and d!56637 res!91811) b!194360))

(assert (=> d!56637 m!220317))

(assert (=> d!56637 m!220319))

(assert (=> d!56637 m!220329))

(declare-fun m!220837 () Bool)

(assert (=> d!56637 m!220837))

(declare-fun m!220839 () Bool)

(assert (=> d!56637 m!220839))

(assert (=> d!56637 m!220317))

(assert (=> b!193978 d!56637))

(declare-fun d!56639 () Bool)

(assert (=> d!56639 (contains!1356 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) lt!96629)))

(declare-fun lt!96853 () Unit!5819)

(declare-fun choose!1077 (ListLongMap!2419 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5819)

(assert (=> d!56639 (= lt!96853 (choose!1077 lt!96639 lt!96637 (zeroValue!3800 thiss!1248) lt!96629))))

(assert (=> d!56639 (contains!1356 lt!96639 lt!96629)))

(assert (=> d!56639 (= (addStillContains!164 lt!96639 lt!96637 (zeroValue!3800 thiss!1248) lt!96629) lt!96853)))

(declare-fun bs!7715 () Bool)

(assert (= bs!7715 d!56639))

(assert (=> bs!7715 m!220309))

(assert (=> bs!7715 m!220309))

(assert (=> bs!7715 m!220311))

(declare-fun m!220841 () Bool)

(assert (=> bs!7715 m!220841))

(declare-fun m!220843 () Bool)

(assert (=> bs!7715 m!220843))

(assert (=> b!193978 d!56639))

(declare-fun d!56641 () Bool)

(declare-fun e!127855 () Bool)

(assert (=> d!56641 e!127855))

(declare-fun res!91812 () Bool)

(assert (=> d!56641 (=> (not res!91812) (not e!127855))))

(declare-fun lt!96854 () ListLongMap!2419)

(assert (=> d!56641 (= res!91812 (contains!1356 lt!96854 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96856 () List!2426)

(assert (=> d!56641 (= lt!96854 (ListLongMap!2420 lt!96856))))

(declare-fun lt!96857 () Unit!5819)

(declare-fun lt!96855 () Unit!5819)

(assert (=> d!56641 (= lt!96857 lt!96855)))

(assert (=> d!56641 (= (getValueByKey!243 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(assert (=> d!56641 (= lt!96855 (lemmaContainsTupThenGetReturnValue!133 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(assert (=> d!56641 (= lt!96856 (insertStrictlySorted!136 (toList!1225 lt!96633) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(assert (=> d!56641 (= (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) lt!96854)))

(declare-fun b!194362 () Bool)

(declare-fun res!91813 () Bool)

(assert (=> b!194362 (=> (not res!91813) (not e!127855))))

(assert (=> b!194362 (= res!91813 (= (getValueByKey!243 (toList!1225 lt!96854) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(declare-fun b!194363 () Bool)

(assert (=> b!194363 (= e!127855 (contains!1359 (toList!1225 lt!96854) (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))

(assert (= (and d!56641 res!91812) b!194362))

(assert (= (and b!194362 res!91813) b!194363))

(declare-fun m!220845 () Bool)

(assert (=> d!56641 m!220845))

(declare-fun m!220847 () Bool)

(assert (=> d!56641 m!220847))

(declare-fun m!220849 () Bool)

(assert (=> d!56641 m!220849))

(declare-fun m!220851 () Bool)

(assert (=> d!56641 m!220851))

(declare-fun m!220853 () Bool)

(assert (=> b!194362 m!220853))

(declare-fun m!220855 () Bool)

(assert (=> b!194363 m!220855))

(assert (=> b!193978 d!56641))

(declare-fun d!56643 () Bool)

(declare-fun e!127856 () Bool)

(assert (=> d!56643 e!127856))

(declare-fun res!91814 () Bool)

(assert (=> d!56643 (=> (not res!91814) (not e!127856))))

(declare-fun lt!96858 () ListLongMap!2419)

(assert (=> d!56643 (= res!91814 (contains!1356 lt!96858 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96860 () List!2426)

(assert (=> d!56643 (= lt!96858 (ListLongMap!2420 lt!96860))))

(declare-fun lt!96861 () Unit!5819)

(declare-fun lt!96859 () Unit!5819)

(assert (=> d!56643 (= lt!96861 lt!96859)))

(assert (=> d!56643 (= (getValueByKey!243 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56643 (= lt!96859 (lemmaContainsTupThenGetReturnValue!133 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56643 (= lt!96860 (insertStrictlySorted!136 (toList!1225 lt!96639) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56643 (= (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) lt!96858)))

(declare-fun b!194364 () Bool)

(declare-fun res!91815 () Bool)

(assert (=> b!194364 (=> (not res!91815) (not e!127856))))

(assert (=> b!194364 (= res!91815 (= (getValueByKey!243 (toList!1225 lt!96858) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194365 () Bool)

(assert (=> b!194365 (= e!127856 (contains!1359 (toList!1225 lt!96858) (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56643 res!91814) b!194364))

(assert (= (and b!194364 res!91815) b!194365))

(declare-fun m!220857 () Bool)

(assert (=> d!56643 m!220857))

(declare-fun m!220859 () Bool)

(assert (=> d!56643 m!220859))

(declare-fun m!220861 () Bool)

(assert (=> d!56643 m!220861))

(declare-fun m!220863 () Bool)

(assert (=> d!56643 m!220863))

(declare-fun m!220865 () Bool)

(assert (=> b!194364 m!220865))

(declare-fun m!220867 () Bool)

(assert (=> b!194365 m!220867))

(assert (=> b!193978 d!56643))

(declare-fun d!56645 () Bool)

(declare-fun lt!96864 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!155 (List!2426) (InoxSet tuple2!3510))

(assert (=> d!56645 (= lt!96864 (select (content!155 (toList!1225 lt!96671)) lt!96460))))

(declare-fun e!127861 () Bool)

(assert (=> d!56645 (= lt!96864 e!127861)))

(declare-fun res!91821 () Bool)

(assert (=> d!56645 (=> (not res!91821) (not e!127861))))

(assert (=> d!56645 (= res!91821 ((_ is Cons!2422) (toList!1225 lt!96671)))))

(assert (=> d!56645 (= (contains!1359 (toList!1225 lt!96671) lt!96460) lt!96864)))

(declare-fun b!194370 () Bool)

(declare-fun e!127862 () Bool)

(assert (=> b!194370 (= e!127861 e!127862)))

(declare-fun res!91820 () Bool)

(assert (=> b!194370 (=> res!91820 e!127862)))

(assert (=> b!194370 (= res!91820 (= (h!3063 (toList!1225 lt!96671)) lt!96460))))

(declare-fun b!194371 () Bool)

(assert (=> b!194371 (= e!127862 (contains!1359 (t!7343 (toList!1225 lt!96671)) lt!96460))))

(assert (= (and d!56645 res!91821) b!194370))

(assert (= (and b!194370 (not res!91820)) b!194371))

(declare-fun m!220869 () Bool)

(assert (=> d!56645 m!220869))

(declare-fun m!220871 () Bool)

(assert (=> d!56645 m!220871))

(declare-fun m!220873 () Bool)

(assert (=> b!194371 m!220873))

(assert (=> b!194024 d!56645))

(declare-fun d!56647 () Bool)

(assert (=> d!56647 (= (apply!188 lt!96632 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7716 () Bool)

(assert (= bs!7716 d!56647))

(assert (=> bs!7716 m!220629))

(assert (=> bs!7716 m!220629))

(declare-fun m!220875 () Bool)

(assert (=> bs!7716 m!220875))

(assert (=> b!193994 d!56647))

(declare-fun d!56649 () Bool)

(declare-fun e!127864 () Bool)

(assert (=> d!56649 e!127864))

(declare-fun res!91822 () Bool)

(assert (=> d!56649 (=> res!91822 e!127864)))

(declare-fun lt!96867 () Bool)

(assert (=> d!56649 (= res!91822 (not lt!96867))))

(declare-fun lt!96868 () Bool)

(assert (=> d!56649 (= lt!96867 lt!96868)))

(declare-fun lt!96866 () Unit!5819)

(declare-fun e!127863 () Unit!5819)

(assert (=> d!56649 (= lt!96866 e!127863)))

(declare-fun c!35093 () Bool)

(assert (=> d!56649 (= c!35093 lt!96868)))

(assert (=> d!56649 (= lt!96868 (containsKey!247 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56649 (= (contains!1356 lt!96632 #b0000000000000000000000000000000000000000000000000000000000000000) lt!96867)))

(declare-fun b!194372 () Bool)

(declare-fun lt!96865 () Unit!5819)

(assert (=> b!194372 (= e!127863 lt!96865)))

(assert (=> b!194372 (= lt!96865 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194372 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194373 () Bool)

(declare-fun Unit!5841 () Unit!5819)

(assert (=> b!194373 (= e!127863 Unit!5841)))

(declare-fun b!194374 () Bool)

(assert (=> b!194374 (= e!127864 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56649 c!35093) b!194372))

(assert (= (and d!56649 (not c!35093)) b!194373))

(assert (= (and d!56649 (not res!91822)) b!194374))

(declare-fun m!220877 () Bool)

(assert (=> d!56649 m!220877))

(declare-fun m!220879 () Bool)

(assert (=> b!194372 m!220879))

(assert (=> b!194372 m!220633))

(assert (=> b!194372 m!220633))

(declare-fun m!220881 () Bool)

(assert (=> b!194372 m!220881))

(assert (=> b!194374 m!220633))

(assert (=> b!194374 m!220633))

(assert (=> b!194374 m!220881))

(assert (=> bm!19607 d!56649))

(declare-fun d!56651 () Bool)

(declare-fun res!91823 () Bool)

(declare-fun e!127865 () Bool)

(assert (=> d!56651 (=> res!91823 e!127865)))

(assert (=> d!56651 (= res!91823 (and ((_ is Cons!2422) (toList!1225 lt!96451)) (= (_1!1766 (h!3063 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(assert (=> d!56651 (= (containsKey!247 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) e!127865)))

(declare-fun b!194375 () Bool)

(declare-fun e!127866 () Bool)

(assert (=> b!194375 (= e!127865 e!127866)))

(declare-fun res!91824 () Bool)

(assert (=> b!194375 (=> (not res!91824) (not e!127866))))

(assert (=> b!194375 (= res!91824 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96451))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))) ((_ is Cons!2422) (toList!1225 lt!96451)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(declare-fun b!194376 () Bool)

(assert (=> b!194376 (= e!127866 (containsKey!247 (t!7343 (toList!1225 lt!96451)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (= (and d!56651 (not res!91823)) b!194375))

(assert (= (and b!194375 res!91824) b!194376))

(assert (=> b!194376 m!220093))

(declare-fun m!220883 () Bool)

(assert (=> b!194376 m!220883))

(assert (=> d!56507 d!56651))

(declare-fun b!194385 () Bool)

(declare-fun res!91836 () Bool)

(declare-fun e!127869 () Bool)

(assert (=> b!194385 (=> (not res!91836) (not e!127869))))

(assert (=> b!194385 (= res!91836 (and (= (size!4188 (_values!3942 thiss!1248)) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001)) (= (size!4187 (_keys!5952 thiss!1248)) (size!4188 (_values!3942 thiss!1248))) (bvsge (_size!1404 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1404 thiss!1248) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!56653 () Bool)

(declare-fun res!91835 () Bool)

(assert (=> d!56653 (=> (not res!91835) (not e!127869))))

(assert (=> d!56653 (= res!91835 (validMask!0 (mask!9221 thiss!1248)))))

(assert (=> d!56653 (= (simpleValid!204 thiss!1248) e!127869)))

(declare-fun b!194388 () Bool)

(assert (=> b!194388 (= e!127869 (and (bvsge (extraKeys!3696 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3696 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1404 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!194387 () Bool)

(declare-fun res!91833 () Bool)

(assert (=> b!194387 (=> (not res!91833) (not e!127869))))

(declare-fun size!4193 (LongMapFixedSize!2710) (_ BitVec 32))

(assert (=> b!194387 (= res!91833 (= (size!4193 thiss!1248) (bvadd (_size!1404 thiss!1248) (bvsdiv (bvadd (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!194386 () Bool)

(declare-fun res!91834 () Bool)

(assert (=> b!194386 (=> (not res!91834) (not e!127869))))

(assert (=> b!194386 (= res!91834 (bvsge (size!4193 thiss!1248) (_size!1404 thiss!1248)))))

(assert (= (and d!56653 res!91835) b!194385))

(assert (= (and b!194385 res!91836) b!194386))

(assert (= (and b!194386 res!91834) b!194387))

(assert (= (and b!194387 res!91833) b!194388))

(assert (=> d!56653 m!220205))

(declare-fun m!220885 () Bool)

(assert (=> b!194387 m!220885))

(assert (=> b!194386 m!220885))

(assert (=> d!56509 d!56653))

(declare-fun b!194389 () Bool)

(declare-fun res!91840 () Bool)

(declare-fun e!127870 () Bool)

(assert (=> b!194389 (=> (not res!91840) (not e!127870))))

(assert (=> b!194389 (= res!91840 (and (= (size!4188 (_values!3942 lt!96455)) (bvadd (mask!9221 lt!96455) #b00000000000000000000000000000001)) (= (size!4187 (_keys!5952 lt!96455)) (size!4188 (_values!3942 lt!96455))) (bvsge (_size!1404 lt!96455) #b00000000000000000000000000000000) (bvsle (_size!1404 lt!96455) (bvadd (mask!9221 lt!96455) #b00000000000000000000000000000001))))))

(declare-fun d!56655 () Bool)

(declare-fun res!91839 () Bool)

(assert (=> d!56655 (=> (not res!91839) (not e!127870))))

(assert (=> d!56655 (= res!91839 (validMask!0 (mask!9221 lt!96455)))))

(assert (=> d!56655 (= (simpleValid!204 lt!96455) e!127870)))

(declare-fun b!194392 () Bool)

(assert (=> b!194392 (= e!127870 (and (bvsge (extraKeys!3696 lt!96455) #b00000000000000000000000000000000) (bvsle (extraKeys!3696 lt!96455) #b00000000000000000000000000000011) (bvsge (_vacant!1404 lt!96455) #b00000000000000000000000000000000)))))

(declare-fun b!194391 () Bool)

(declare-fun res!91837 () Bool)

(assert (=> b!194391 (=> (not res!91837) (not e!127870))))

(assert (=> b!194391 (= res!91837 (= (size!4193 lt!96455) (bvadd (_size!1404 lt!96455) (bvsdiv (bvadd (extraKeys!3696 lt!96455) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!194390 () Bool)

(declare-fun res!91838 () Bool)

(assert (=> b!194390 (=> (not res!91838) (not e!127870))))

(assert (=> b!194390 (= res!91838 (bvsge (size!4193 lt!96455) (_size!1404 lt!96455)))))

(assert (= (and d!56655 res!91839) b!194389))

(assert (= (and b!194389 res!91840) b!194390))

(assert (= (and b!194390 res!91838) b!194391))

(assert (= (and b!194391 res!91837) b!194392))

(assert (=> d!56655 m!220719))

(declare-fun m!220887 () Bool)

(assert (=> b!194391 m!220887))

(assert (=> b!194390 m!220887))

(assert (=> d!56501 d!56655))

(declare-fun d!56657 () Bool)

(declare-fun e!127872 () Bool)

(assert (=> d!56657 e!127872))

(declare-fun res!91841 () Bool)

(assert (=> d!56657 (=> res!91841 e!127872)))

(declare-fun lt!96871 () Bool)

(assert (=> d!56657 (= res!91841 (not lt!96871))))

(declare-fun lt!96872 () Bool)

(assert (=> d!56657 (= lt!96871 lt!96872)))

(declare-fun lt!96870 () Unit!5819)

(declare-fun e!127871 () Unit!5819)

(assert (=> d!56657 (= lt!96870 e!127871)))

(declare-fun c!35094 () Bool)

(assert (=> d!56657 (= c!35094 lt!96872)))

(assert (=> d!56657 (= lt!96872 (containsKey!247 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56657 (= (contains!1356 lt!96610 #b1000000000000000000000000000000000000000000000000000000000000000) lt!96871)))

(declare-fun b!194393 () Bool)

(declare-fun lt!96869 () Unit!5819)

(assert (=> b!194393 (= e!127871 lt!96869)))

(assert (=> b!194393 (= lt!96869 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194393 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194394 () Bool)

(declare-fun Unit!5842 () Unit!5819)

(assert (=> b!194394 (= e!127871 Unit!5842)))

(declare-fun b!194395 () Bool)

(assert (=> b!194395 (= e!127872 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56657 c!35094) b!194393))

(assert (= (and d!56657 (not c!35094)) b!194394))

(assert (= (and d!56657 (not res!91841)) b!194395))

(declare-fun m!220889 () Bool)

(assert (=> d!56657 m!220889))

(declare-fun m!220891 () Bool)

(assert (=> b!194393 m!220891))

(declare-fun m!220893 () Bool)

(assert (=> b!194393 m!220893))

(assert (=> b!194393 m!220893))

(declare-fun m!220895 () Bool)

(assert (=> b!194393 m!220895))

(assert (=> b!194395 m!220893))

(assert (=> b!194395 m!220893))

(assert (=> b!194395 m!220895))

(assert (=> bm!19602 d!56657))

(declare-fun d!56659 () Bool)

(assert (=> d!56659 (= (apply!188 lt!96610 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7717 () Bool)

(assert (= bs!7717 d!56659))

(assert (=> bs!7717 m!220893))

(assert (=> bs!7717 m!220893))

(declare-fun m!220897 () Bool)

(assert (=> bs!7717 m!220897))

(assert (=> b!193971 d!56659))

(declare-fun b!194406 () Bool)

(declare-fun e!127884 () Bool)

(declare-fun contains!1360 (List!2429 (_ BitVec 64)) Bool)

(assert (=> b!194406 (= e!127884 (contains!1360 Nil!2426 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!194407 () Bool)

(declare-fun e!127881 () Bool)

(declare-fun e!127882 () Bool)

(assert (=> b!194407 (= e!127881 e!127882)))

(declare-fun c!35097 () Bool)

(assert (=> b!194407 (= c!35097 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun bm!19659 () Bool)

(declare-fun call!19662 () Bool)

(assert (=> bm!19659 (= call!19662 (arrayNoDuplicates!0 (_keys!5952 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35097 (Cons!2425 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)))))

(declare-fun b!194408 () Bool)

(assert (=> b!194408 (= e!127882 call!19662)))

(declare-fun b!194409 () Bool)

(assert (=> b!194409 (= e!127882 call!19662)))

(declare-fun b!194410 () Bool)

(declare-fun e!127883 () Bool)

(assert (=> b!194410 (= e!127883 e!127881)))

(declare-fun res!91849 () Bool)

(assert (=> b!194410 (=> (not res!91849) (not e!127881))))

(assert (=> b!194410 (= res!91849 (not e!127884))))

(declare-fun res!91848 () Bool)

(assert (=> b!194410 (=> (not res!91848) (not e!127884))))

(assert (=> b!194410 (= res!91848 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun d!56661 () Bool)

(declare-fun res!91850 () Bool)

(assert (=> d!56661 (=> res!91850 e!127883)))

(assert (=> d!56661 (= res!91850 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56661 (= (arrayNoDuplicates!0 (_keys!5952 lt!96455) #b00000000000000000000000000000000 Nil!2426) e!127883)))

(assert (= (and d!56661 (not res!91850)) b!194410))

(assert (= (and b!194410 res!91848) b!194406))

(assert (= (and b!194410 res!91849) b!194407))

(assert (= (and b!194407 c!35097) b!194409))

(assert (= (and b!194407 (not c!35097)) b!194408))

(assert (= (or b!194409 b!194408) bm!19659))

(assert (=> b!194406 m!220529))

(assert (=> b!194406 m!220529))

(declare-fun m!220899 () Bool)

(assert (=> b!194406 m!220899))

(assert (=> b!194407 m!220529))

(assert (=> b!194407 m!220529))

(assert (=> b!194407 m!220531))

(assert (=> bm!19659 m!220529))

(declare-fun m!220901 () Bool)

(assert (=> bm!19659 m!220901))

(assert (=> b!194410 m!220529))

(assert (=> b!194410 m!220529))

(assert (=> b!194410 m!220531))

(assert (=> b!194007 d!56661))

(declare-fun d!56663 () Bool)

(declare-fun e!127886 () Bool)

(assert (=> d!56663 e!127886))

(declare-fun res!91851 () Bool)

(assert (=> d!56663 (=> res!91851 e!127886)))

(declare-fun lt!96875 () Bool)

(assert (=> d!56663 (= res!91851 (not lt!96875))))

(declare-fun lt!96876 () Bool)

(assert (=> d!56663 (= lt!96875 lt!96876)))

(declare-fun lt!96874 () Unit!5819)

(declare-fun e!127885 () Unit!5819)

(assert (=> d!56663 (= lt!96874 e!127885)))

(declare-fun c!35098 () Bool)

(assert (=> d!56663 (= c!35098 lt!96876)))

(assert (=> d!56663 (= lt!96876 (containsKey!247 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56663 (= (contains!1356 lt!96632 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!96875)))

(declare-fun b!194411 () Bool)

(declare-fun lt!96873 () Unit!5819)

(assert (=> b!194411 (= e!127885 lt!96873)))

(assert (=> b!194411 (= lt!96873 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194411 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194412 () Bool)

(declare-fun Unit!5843 () Unit!5819)

(assert (=> b!194412 (= e!127885 Unit!5843)))

(declare-fun b!194413 () Bool)

(assert (=> b!194413 (= e!127886 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56663 c!35098) b!194411))

(assert (= (and d!56663 (not c!35098)) b!194412))

(assert (= (and d!56663 (not res!91851)) b!194413))

(assert (=> d!56663 m!220231))

(declare-fun m!220903 () Bool)

(assert (=> d!56663 m!220903))

(assert (=> b!194411 m!220231))

(declare-fun m!220905 () Bool)

(assert (=> b!194411 m!220905))

(assert (=> b!194411 m!220231))

(assert (=> b!194411 m!220541))

(assert (=> b!194411 m!220541))

(declare-fun m!220907 () Bool)

(assert (=> b!194411 m!220907))

(assert (=> b!194413 m!220231))

(assert (=> b!194413 m!220541))

(assert (=> b!194413 m!220541))

(assert (=> b!194413 m!220907))

(assert (=> b!193984 d!56663))

(declare-fun b!194422 () Bool)

(declare-fun e!127892 () (_ BitVec 32))

(declare-fun call!19665 () (_ BitVec 32))

(assert (=> b!194422 (= e!127892 (bvadd #b00000000000000000000000000000001 call!19665))))

(declare-fun b!194424 () Bool)

(declare-fun e!127891 () (_ BitVec 32))

(assert (=> b!194424 (= e!127891 e!127892)))

(declare-fun c!35104 () Bool)

(assert (=> b!194424 (= c!35104 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!194425 () Bool)

(assert (=> b!194425 (= e!127891 #b00000000000000000000000000000000)))

(declare-fun bm!19662 () Bool)

(assert (=> bm!19662 (= call!19665 (arrayCountValidKeys!0 (_keys!5952 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!194423 () Bool)

(assert (=> b!194423 (= e!127892 call!19665)))

(declare-fun d!56665 () Bool)

(declare-fun lt!96879 () (_ BitVec 32))

(assert (=> d!56665 (and (bvsge lt!96879 #b00000000000000000000000000000000) (bvsle lt!96879 (bvsub (size!4187 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (=> d!56665 (= lt!96879 e!127891)))

(declare-fun c!35103 () Bool)

(assert (=> d!56665 (= c!35103 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56665 (and (bvsle #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4187 (_keys!5952 lt!96455)) (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56665 (= (arrayCountValidKeys!0 (_keys!5952 lt!96455) #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))) lt!96879)))

(assert (= (and d!56665 c!35103) b!194425))

(assert (= (and d!56665 (not c!35103)) b!194424))

(assert (= (and b!194424 c!35104) b!194422))

(assert (= (and b!194424 (not c!35104)) b!194423))

(assert (= (or b!194422 b!194423) bm!19662))

(assert (=> b!194424 m!220529))

(assert (=> b!194424 m!220529))

(assert (=> b!194424 m!220531))

(declare-fun m!220909 () Bool)

(assert (=> bm!19662 m!220909))

(assert (=> b!194005 d!56665))

(assert (=> b!193982 d!56539))

(declare-fun d!56667 () Bool)

(assert (=> d!56667 (= (apply!188 lt!96610 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7718 () Bool)

(assert (= bs!7718 d!56667))

(declare-fun m!220911 () Bool)

(assert (=> bs!7718 m!220911))

(assert (=> bs!7718 m!220911))

(declare-fun m!220913 () Bool)

(assert (=> bs!7718 m!220913))

(assert (=> b!193953 d!56667))

(declare-fun b!194444 () Bool)

(declare-fun lt!96884 () SeekEntryResult!695)

(assert (=> b!194444 (and (bvsge (index!4952 lt!96884) #b00000000000000000000000000000000) (bvslt (index!4952 lt!96884) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!91858 () Bool)

(assert (=> b!194444 (= res!91858 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!96884)) key!828))))

(declare-fun e!127903 () Bool)

(assert (=> b!194444 (=> res!91858 e!127903)))

(declare-fun e!127906 () Bool)

(assert (=> b!194444 (= e!127906 e!127903)))

(declare-fun b!194445 () Bool)

(assert (=> b!194445 (and (bvsge (index!4952 lt!96884) #b00000000000000000000000000000000) (bvslt (index!4952 lt!96884) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!194445 (= e!127903 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!96884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194446 () Bool)

(declare-fun e!127905 () Bool)

(assert (=> b!194446 (= e!127905 (bvsge (x!20690 lt!96884) #b01111111111111111111111111111110))))

(declare-fun b!194447 () Bool)

(assert (=> b!194447 (= e!127905 e!127906)))

(declare-fun res!91859 () Bool)

(assert (=> b!194447 (= res!91859 (and ((_ is Intermediate!695) lt!96884) (not (undefined!1507 lt!96884)) (bvslt (x!20690 lt!96884) #b01111111111111111111111111111110) (bvsge (x!20690 lt!96884) #b00000000000000000000000000000000) (bvsge (x!20690 lt!96884) #b00000000000000000000000000000000)))))

(assert (=> b!194447 (=> (not res!91859) (not e!127906))))

(declare-fun b!194448 () Bool)

(assert (=> b!194448 (and (bvsge (index!4952 lt!96884) #b00000000000000000000000000000000) (bvslt (index!4952 lt!96884) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!91860 () Bool)

(assert (=> b!194448 (= res!91860 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!96884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194448 (=> res!91860 e!127903)))

(declare-fun b!194449 () Bool)

(declare-fun e!127904 () SeekEntryResult!695)

(declare-fun e!127907 () SeekEntryResult!695)

(assert (=> b!194449 (= e!127904 e!127907)))

(declare-fun c!35111 () Bool)

(declare-fun lt!96885 () (_ BitVec 64))

(assert (=> b!194449 (= c!35111 (or (= lt!96885 key!828) (= (bvadd lt!96885 lt!96885) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194450 () Bool)

(assert (=> b!194450 (= e!127907 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun d!56669 () Bool)

(assert (=> d!56669 e!127905))

(declare-fun c!35112 () Bool)

(assert (=> d!56669 (= c!35112 (and ((_ is Intermediate!695) lt!96884) (undefined!1507 lt!96884)))))

(assert (=> d!56669 (= lt!96884 e!127904)))

(declare-fun c!35113 () Bool)

(assert (=> d!56669 (= c!35113 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!56669 (= lt!96885 (select (arr!3862 (_keys!5952 thiss!1248)) (toIndex!0 key!828 (mask!9221 thiss!1248))))))

(assert (=> d!56669 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9221 thiss!1248)) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) lt!96884)))

(declare-fun b!194451 () Bool)

(assert (=> b!194451 (= e!127907 (Intermediate!695 false (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!194452 () Bool)

(assert (=> b!194452 (= e!127904 (Intermediate!695 true (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!56669 c!35113) b!194452))

(assert (= (and d!56669 (not c!35113)) b!194449))

(assert (= (and b!194449 c!35111) b!194451))

(assert (= (and b!194449 (not c!35111)) b!194450))

(assert (= (and d!56669 c!35112) b!194446))

(assert (= (and d!56669 (not c!35112)) b!194447))

(assert (= (and b!194447 res!91859) b!194444))

(assert (= (and b!194444 (not res!91858)) b!194448))

(assert (= (and b!194448 (not res!91860)) b!194445))

(assert (=> d!56669 m!220203))

(declare-fun m!220915 () Bool)

(assert (=> d!56669 m!220915))

(assert (=> d!56669 m!220205))

(declare-fun m!220917 () Bool)

(assert (=> b!194445 m!220917))

(assert (=> b!194448 m!220917))

(assert (=> b!194450 m!220203))

(declare-fun m!220919 () Bool)

(assert (=> b!194450 m!220919))

(assert (=> b!194450 m!220919))

(declare-fun m!220921 () Bool)

(assert (=> b!194450 m!220921))

(assert (=> b!194444 m!220917))

(assert (=> d!56491 d!56669))

(declare-fun d!56671 () Bool)

(declare-fun lt!96891 () (_ BitVec 32))

(declare-fun lt!96890 () (_ BitVec 32))

(assert (=> d!56671 (= lt!96891 (bvmul (bvxor lt!96890 (bvlshr lt!96890 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56671 (= lt!96890 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56671 (and (bvsge (mask!9221 thiss!1248) #b00000000000000000000000000000000) (let ((res!91861 (let ((h!3067 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20718 (bvmul (bvxor h!3067 (bvlshr h!3067 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20718 (bvlshr x!20718 #b00000000000000000000000000001101)) (mask!9221 thiss!1248)))))) (and (bvslt res!91861 (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!91861 #b00000000000000000000000000000000))))))

(assert (=> d!56671 (= (toIndex!0 key!828 (mask!9221 thiss!1248)) (bvand (bvxor lt!96891 (bvlshr lt!96891 #b00000000000000000000000000001101)) (mask!9221 thiss!1248)))))

(assert (=> d!56491 d!56671))

(assert (=> d!56491 d!56531))

(declare-fun b!194453 () Bool)

(declare-fun e!127909 () (_ BitVec 32))

(declare-fun call!19666 () (_ BitVec 32))

(assert (=> b!194453 (= e!127909 (bvadd #b00000000000000000000000000000001 call!19666))))

(declare-fun b!194455 () Bool)

(declare-fun e!127908 () (_ BitVec 32))

(assert (=> b!194455 (= e!127908 e!127909)))

(declare-fun c!35115 () Bool)

(assert (=> b!194455 (= c!35115 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194456 () Bool)

(assert (=> b!194456 (= e!127908 #b00000000000000000000000000000000)))

(declare-fun bm!19663 () Bool)

(assert (=> bm!19663 (= call!19666 (arrayCountValidKeys!0 (_keys!5952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194454 () Bool)

(assert (=> b!194454 (= e!127909 call!19666)))

(declare-fun d!56673 () Bool)

(declare-fun lt!96892 () (_ BitVec 32))

(assert (=> d!56673 (and (bvsge lt!96892 #b00000000000000000000000000000000) (bvsle lt!96892 (bvsub (size!4187 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56673 (= lt!96892 e!127908)))

(declare-fun c!35114 () Bool)

(assert (=> d!56673 (= c!35114 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56673 (and (bvsle #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4187 (_keys!5952 thiss!1248)) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56673 (= (arrayCountValidKeys!0 (_keys!5952 thiss!1248) #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))) lt!96892)))

(assert (= (and d!56673 c!35114) b!194456))

(assert (= (and d!56673 (not c!35114)) b!194455))

(assert (= (and b!194455 c!35115) b!194453))

(assert (= (and b!194455 (not c!35115)) b!194454))

(assert (= (or b!194453 b!194454) bm!19663))

(assert (=> b!194455 m!220231))

(assert (=> b!194455 m!220231))

(assert (=> b!194455 m!220233))

(declare-fun m!220923 () Bool)

(assert (=> bm!19663 m!220923))

(assert (=> b!194020 d!56673))

(declare-fun d!56675 () Bool)

(assert (=> d!56675 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96454) key!828)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96454) key!828))))))

(declare-fun bs!7719 () Bool)

(assert (= bs!7719 d!56675))

(assert (=> bs!7719 m!220403))

(declare-fun m!220925 () Bool)

(assert (=> bs!7719 m!220925))

(assert (=> b!194033 d!56675))

(declare-fun b!194459 () Bool)

(declare-fun e!127911 () Option!249)

(assert (=> b!194459 (= e!127911 (getValueByKey!243 (t!7343 (toList!1225 lt!96454)) key!828))))

(declare-fun d!56677 () Bool)

(declare-fun c!35116 () Bool)

(assert (=> d!56677 (= c!35116 (and ((_ is Cons!2422) (toList!1225 lt!96454)) (= (_1!1766 (h!3063 (toList!1225 lt!96454))) key!828)))))

(declare-fun e!127910 () Option!249)

(assert (=> d!56677 (= (getValueByKey!243 (toList!1225 lt!96454) key!828) e!127910)))

(declare-fun b!194457 () Bool)

(assert (=> b!194457 (= e!127910 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96454)))))))

(declare-fun b!194458 () Bool)

(assert (=> b!194458 (= e!127910 e!127911)))

(declare-fun c!35117 () Bool)

(assert (=> b!194458 (= c!35117 (and ((_ is Cons!2422) (toList!1225 lt!96454)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96454))) key!828))))))

(declare-fun b!194460 () Bool)

(assert (=> b!194460 (= e!127911 None!247)))

(assert (= (and d!56677 c!35116) b!194457))

(assert (= (and d!56677 (not c!35116)) b!194458))

(assert (= (and b!194458 c!35117) b!194459))

(assert (= (and b!194458 (not c!35117)) b!194460))

(declare-fun m!220927 () Bool)

(assert (=> b!194459 m!220927))

(assert (=> b!194033 d!56677))

(declare-fun d!56679 () Bool)

(declare-fun e!127913 () Bool)

(assert (=> d!56679 e!127913))

(declare-fun res!91862 () Bool)

(assert (=> d!56679 (=> res!91862 e!127913)))

(declare-fun lt!96895 () Bool)

(assert (=> d!56679 (= res!91862 (not lt!96895))))

(declare-fun lt!96896 () Bool)

(assert (=> d!56679 (= lt!96895 lt!96896)))

(declare-fun lt!96894 () Unit!5819)

(declare-fun e!127912 () Unit!5819)

(assert (=> d!56679 (= lt!96894 e!127912)))

(declare-fun c!35118 () Bool)

(assert (=> d!56679 (= c!35118 lt!96896)))

(assert (=> d!56679 (= lt!96896 (containsKey!247 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56679 (= (contains!1356 lt!96610 #b0000000000000000000000000000000000000000000000000000000000000000) lt!96895)))

(declare-fun b!194461 () Bool)

(declare-fun lt!96893 () Unit!5819)

(assert (=> b!194461 (= e!127912 lt!96893)))

(assert (=> b!194461 (= lt!96893 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194461 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194462 () Bool)

(declare-fun Unit!5844 () Unit!5819)

(assert (=> b!194462 (= e!127912 Unit!5844)))

(declare-fun b!194463 () Bool)

(assert (=> b!194463 (= e!127913 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56679 c!35118) b!194461))

(assert (= (and d!56679 (not c!35118)) b!194462))

(assert (= (and d!56679 (not res!91862)) b!194463))

(declare-fun m!220929 () Bool)

(assert (=> d!56679 m!220929))

(declare-fun m!220931 () Bool)

(assert (=> b!194461 m!220931))

(assert (=> b!194461 m!220911))

(assert (=> b!194461 m!220911))

(declare-fun m!220933 () Bool)

(assert (=> b!194461 m!220933))

(assert (=> b!194463 m!220911))

(assert (=> b!194463 m!220911))

(assert (=> b!194463 m!220933))

(assert (=> bm!19600 d!56679))

(declare-fun d!56681 () Bool)

(assert (=> d!56681 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96454) key!828))))

(declare-fun lt!96897 () Unit!5819)

(assert (=> d!56681 (= lt!96897 (choose!1075 (toList!1225 lt!96454) key!828))))

(declare-fun e!127914 () Bool)

(assert (=> d!56681 e!127914))

(declare-fun res!91863 () Bool)

(assert (=> d!56681 (=> (not res!91863) (not e!127914))))

(assert (=> d!56681 (= res!91863 (isStrictlySorted!352 (toList!1225 lt!96454)))))

(assert (=> d!56681 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96454) key!828) lt!96897)))

(declare-fun b!194464 () Bool)

(assert (=> b!194464 (= e!127914 (containsKey!247 (toList!1225 lt!96454) key!828))))

(assert (= (and d!56681 res!91863) b!194464))

(assert (=> d!56681 m!220403))

(assert (=> d!56681 m!220403))

(assert (=> d!56681 m!220405))

(declare-fun m!220935 () Bool)

(assert (=> d!56681 m!220935))

(declare-fun m!220937 () Bool)

(assert (=> d!56681 m!220937))

(assert (=> b!194464 m!220399))

(assert (=> b!194031 d!56681))

(assert (=> b!194031 d!56675))

(assert (=> b!194031 d!56677))

(declare-fun d!56683 () Bool)

(assert (=> d!56683 (= (apply!188 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) lt!96621) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96621)))))

(declare-fun bs!7720 () Bool)

(assert (= bs!7720 d!56683))

(declare-fun m!220939 () Bool)

(assert (=> bs!7720 m!220939))

(assert (=> bs!7720 m!220939))

(declare-fun m!220941 () Bool)

(assert (=> bs!7720 m!220941))

(assert (=> b!193955 d!56683))

(declare-fun d!56685 () Bool)

(assert (=> d!56685 (= (apply!188 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) lt!96608) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!96608)))))

(declare-fun bs!7721 () Bool)

(assert (= bs!7721 d!56685))

(declare-fun m!220943 () Bool)

(assert (=> bs!7721 m!220943))

(assert (=> bs!7721 m!220943))

(declare-fun m!220945 () Bool)

(assert (=> bs!7721 m!220945))

(assert (=> b!193955 d!56685))

(declare-fun d!56687 () Bool)

(assert (=> d!56687 (= (apply!188 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) lt!96618) (apply!188 lt!96605 lt!96618))))

(declare-fun lt!96898 () Unit!5819)

(assert (=> d!56687 (= lt!96898 (choose!1076 lt!96605 lt!96620 (zeroValue!3800 thiss!1248) lt!96618))))

(declare-fun e!127915 () Bool)

(assert (=> d!56687 e!127915))

(declare-fun res!91864 () Bool)

(assert (=> d!56687 (=> (not res!91864) (not e!127915))))

(assert (=> d!56687 (= res!91864 (contains!1356 lt!96605 lt!96618))))

(assert (=> d!56687 (= (addApplyDifferent!164 lt!96605 lt!96620 (zeroValue!3800 thiss!1248) lt!96618) lt!96898)))

(declare-fun b!194465 () Bool)

(assert (=> b!194465 (= e!127915 (not (= lt!96618 lt!96620)))))

(assert (= (and d!56687 res!91864) b!194465))

(assert (=> d!56687 m!220253))

(assert (=> d!56687 m!220255))

(assert (=> d!56687 m!220263))

(declare-fun m!220947 () Bool)

(assert (=> d!56687 m!220947))

(declare-fun m!220949 () Bool)

(assert (=> d!56687 m!220949))

(assert (=> d!56687 m!220253))

(assert (=> b!193955 d!56687))

(declare-fun d!56689 () Bool)

(declare-fun e!127917 () Bool)

(assert (=> d!56689 e!127917))

(declare-fun res!91865 () Bool)

(assert (=> d!56689 (=> res!91865 e!127917)))

(declare-fun lt!96901 () Bool)

(assert (=> d!56689 (= res!91865 (not lt!96901))))

(declare-fun lt!96902 () Bool)

(assert (=> d!56689 (= lt!96901 lt!96902)))

(declare-fun lt!96900 () Unit!5819)

(declare-fun e!127916 () Unit!5819)

(assert (=> d!56689 (= lt!96900 e!127916)))

(declare-fun c!35119 () Bool)

(assert (=> d!56689 (= c!35119 lt!96902)))

(assert (=> d!56689 (= lt!96902 (containsKey!247 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))

(assert (=> d!56689 (= (contains!1356 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) lt!96607) lt!96901)))

(declare-fun b!194466 () Bool)

(declare-fun lt!96899 () Unit!5819)

(assert (=> b!194466 (= e!127916 lt!96899)))

(assert (=> b!194466 (= lt!96899 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))

(assert (=> b!194466 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))

(declare-fun b!194467 () Bool)

(declare-fun Unit!5845 () Unit!5819)

(assert (=> b!194467 (= e!127916 Unit!5845)))

(declare-fun b!194468 () Bool)

(assert (=> b!194468 (= e!127917 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607)))))

(assert (= (and d!56689 c!35119) b!194466))

(assert (= (and d!56689 (not c!35119)) b!194467))

(assert (= (and d!56689 (not res!91865)) b!194468))

(declare-fun m!220951 () Bool)

(assert (=> d!56689 m!220951))

(declare-fun m!220953 () Bool)

(assert (=> b!194466 m!220953))

(declare-fun m!220955 () Bool)

(assert (=> b!194466 m!220955))

(assert (=> b!194466 m!220955))

(declare-fun m!220957 () Bool)

(assert (=> b!194466 m!220957))

(assert (=> b!194468 m!220955))

(assert (=> b!194468 m!220955))

(assert (=> b!194468 m!220957))

(assert (=> b!193955 d!56689))

(declare-fun d!56691 () Bool)

(assert (=> d!56691 (= (apply!188 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) lt!96618) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!96618)))))

(declare-fun bs!7722 () Bool)

(assert (= bs!7722 d!56691))

(declare-fun m!220959 () Bool)

(assert (=> bs!7722 m!220959))

(assert (=> bs!7722 m!220959))

(declare-fun m!220961 () Bool)

(assert (=> bs!7722 m!220961))

(assert (=> b!193955 d!56691))

(declare-fun d!56693 () Bool)

(assert (=> d!56693 (= (apply!188 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) lt!96621) (apply!188 lt!96606 lt!96621))))

(declare-fun lt!96903 () Unit!5819)

(assert (=> d!56693 (= lt!96903 (choose!1076 lt!96606 lt!96609 (minValue!3800 thiss!1248) lt!96621))))

(declare-fun e!127918 () Bool)

(assert (=> d!56693 e!127918))

(declare-fun res!91866 () Bool)

(assert (=> d!56693 (=> (not res!91866) (not e!127918))))

(assert (=> d!56693 (= res!91866 (contains!1356 lt!96606 lt!96621))))

(assert (=> d!56693 (= (addApplyDifferent!164 lt!96606 lt!96609 (minValue!3800 thiss!1248) lt!96621) lt!96903)))

(declare-fun b!194469 () Bool)

(assert (=> b!194469 (= e!127918 (not (= lt!96621 lt!96609)))))

(assert (= (and d!56693 res!91866) b!194469))

(assert (=> d!56693 m!220261))

(assert (=> d!56693 m!220273))

(assert (=> d!56693 m!220269))

(declare-fun m!220963 () Bool)

(assert (=> d!56693 m!220963))

(declare-fun m!220965 () Bool)

(assert (=> d!56693 m!220965))

(assert (=> d!56693 m!220261))

(assert (=> b!193955 d!56693))

(assert (=> b!193955 d!56583))

(declare-fun d!56695 () Bool)

(assert (=> d!56695 (= (apply!188 lt!96605 lt!96618) (get!2232 (getValueByKey!243 (toList!1225 lt!96605) lt!96618)))))

(declare-fun bs!7723 () Bool)

(assert (= bs!7723 d!56695))

(declare-fun m!220967 () Bool)

(assert (=> bs!7723 m!220967))

(assert (=> bs!7723 m!220967))

(declare-fun m!220969 () Bool)

(assert (=> bs!7723 m!220969))

(assert (=> b!193955 d!56695))

(declare-fun d!56697 () Bool)

(declare-fun e!127919 () Bool)

(assert (=> d!56697 e!127919))

(declare-fun res!91867 () Bool)

(assert (=> d!56697 (=> (not res!91867) (not e!127919))))

(declare-fun lt!96904 () ListLongMap!2419)

(assert (=> d!56697 (= res!91867 (contains!1356 lt!96904 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96906 () List!2426)

(assert (=> d!56697 (= lt!96904 (ListLongMap!2420 lt!96906))))

(declare-fun lt!96907 () Unit!5819)

(declare-fun lt!96905 () Unit!5819)

(assert (=> d!56697 (= lt!96907 lt!96905)))

(assert (=> d!56697 (= (getValueByKey!243 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56697 (= lt!96905 (lemmaContainsTupThenGetReturnValue!133 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56697 (= lt!96906 (insertStrictlySorted!136 (toList!1225 lt!96617) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56697 (= (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) lt!96904)))

(declare-fun b!194470 () Bool)

(declare-fun res!91868 () Bool)

(assert (=> b!194470 (=> (not res!91868) (not e!127919))))

(assert (=> b!194470 (= res!91868 (= (getValueByKey!243 (toList!1225 lt!96904) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194471 () Bool)

(assert (=> b!194471 (= e!127919 (contains!1359 (toList!1225 lt!96904) (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56697 res!91867) b!194470))

(assert (= (and b!194470 res!91868) b!194471))

(declare-fun m!220971 () Bool)

(assert (=> d!56697 m!220971))

(declare-fun m!220973 () Bool)

(assert (=> d!56697 m!220973))

(declare-fun m!220975 () Bool)

(assert (=> d!56697 m!220975))

(declare-fun m!220977 () Bool)

(assert (=> d!56697 m!220977))

(declare-fun m!220979 () Bool)

(assert (=> b!194470 m!220979))

(declare-fun m!220981 () Bool)

(assert (=> b!194471 m!220981))

(assert (=> b!193955 d!56697))

(declare-fun d!56699 () Bool)

(assert (=> d!56699 (= (apply!188 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) lt!96608) (apply!188 lt!96611 lt!96608))))

(declare-fun lt!96908 () Unit!5819)

(assert (=> d!56699 (= lt!96908 (choose!1076 lt!96611 lt!96619 (minValue!3800 thiss!1248) lt!96608))))

(declare-fun e!127920 () Bool)

(assert (=> d!56699 e!127920))

(declare-fun res!91869 () Bool)

(assert (=> d!56699 (=> (not res!91869) (not e!127920))))

(assert (=> d!56699 (= res!91869 (contains!1356 lt!96611 lt!96608))))

(assert (=> d!56699 (= (addApplyDifferent!164 lt!96611 lt!96619 (minValue!3800 thiss!1248) lt!96608) lt!96908)))

(declare-fun b!194472 () Bool)

(assert (=> b!194472 (= e!127920 (not (= lt!96608 lt!96619)))))

(assert (= (and d!56699 res!91869) b!194472))

(assert (=> d!56699 m!220265))

(assert (=> d!56699 m!220267))

(assert (=> d!56699 m!220277))

(declare-fun m!220983 () Bool)

(assert (=> d!56699 m!220983))

(declare-fun m!220985 () Bool)

(assert (=> d!56699 m!220985))

(assert (=> d!56699 m!220265))

(assert (=> b!193955 d!56699))

(declare-fun d!56701 () Bool)

(declare-fun e!127921 () Bool)

(assert (=> d!56701 e!127921))

(declare-fun res!91870 () Bool)

(assert (=> d!56701 (=> (not res!91870) (not e!127921))))

(declare-fun lt!96909 () ListLongMap!2419)

(assert (=> d!56701 (= res!91870 (contains!1356 lt!96909 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96911 () List!2426)

(assert (=> d!56701 (= lt!96909 (ListLongMap!2420 lt!96911))))

(declare-fun lt!96912 () Unit!5819)

(declare-fun lt!96910 () Unit!5819)

(assert (=> d!56701 (= lt!96912 lt!96910)))

(assert (=> d!56701 (= (getValueByKey!243 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(assert (=> d!56701 (= lt!96910 (lemmaContainsTupThenGetReturnValue!133 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(assert (=> d!56701 (= lt!96911 (insertStrictlySorted!136 (toList!1225 lt!96606) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(assert (=> d!56701 (= (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) lt!96909)))

(declare-fun b!194473 () Bool)

(declare-fun res!91871 () Bool)

(assert (=> b!194473 (=> (not res!91871) (not e!127921))))

(assert (=> b!194473 (= res!91871 (= (getValueByKey!243 (toList!1225 lt!96909) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(declare-fun b!194474 () Bool)

(assert (=> b!194474 (= e!127921 (contains!1359 (toList!1225 lt!96909) (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))

(assert (= (and d!56701 res!91870) b!194473))

(assert (= (and b!194473 res!91871) b!194474))

(declare-fun m!220987 () Bool)

(assert (=> d!56701 m!220987))

(declare-fun m!220989 () Bool)

(assert (=> d!56701 m!220989))

(declare-fun m!220991 () Bool)

(assert (=> d!56701 m!220991))

(declare-fun m!220993 () Bool)

(assert (=> d!56701 m!220993))

(declare-fun m!220995 () Bool)

(assert (=> b!194473 m!220995))

(declare-fun m!220997 () Bool)

(assert (=> b!194474 m!220997))

(assert (=> b!193955 d!56701))

(declare-fun d!56703 () Bool)

(declare-fun e!127922 () Bool)

(assert (=> d!56703 e!127922))

(declare-fun res!91872 () Bool)

(assert (=> d!56703 (=> (not res!91872) (not e!127922))))

(declare-fun lt!96913 () ListLongMap!2419)

(assert (=> d!56703 (= res!91872 (contains!1356 lt!96913 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96915 () List!2426)

(assert (=> d!56703 (= lt!96913 (ListLongMap!2420 lt!96915))))

(declare-fun lt!96916 () Unit!5819)

(declare-fun lt!96914 () Unit!5819)

(assert (=> d!56703 (= lt!96916 lt!96914)))

(assert (=> d!56703 (= (getValueByKey!243 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56703 (= lt!96914 (lemmaContainsTupThenGetReturnValue!133 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56703 (= lt!96915 (insertStrictlySorted!136 (toList!1225 lt!96605) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56703 (= (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) lt!96913)))

(declare-fun b!194475 () Bool)

(declare-fun res!91873 () Bool)

(assert (=> b!194475 (=> (not res!91873) (not e!127922))))

(assert (=> b!194475 (= res!91873 (= (getValueByKey!243 (toList!1225 lt!96913) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194476 () Bool)

(assert (=> b!194476 (= e!127922 (contains!1359 (toList!1225 lt!96913) (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56703 res!91872) b!194475))

(assert (= (and b!194475 res!91873) b!194476))

(declare-fun m!220999 () Bool)

(assert (=> d!56703 m!220999))

(declare-fun m!221001 () Bool)

(assert (=> d!56703 m!221001))

(declare-fun m!221003 () Bool)

(assert (=> d!56703 m!221003))

(declare-fun m!221005 () Bool)

(assert (=> d!56703 m!221005))

(declare-fun m!221007 () Bool)

(assert (=> b!194475 m!221007))

(declare-fun m!221009 () Bool)

(assert (=> b!194476 m!221009))

(assert (=> b!193955 d!56703))

(declare-fun d!56705 () Bool)

(assert (=> d!56705 (= (apply!188 lt!96611 lt!96608) (get!2232 (getValueByKey!243 (toList!1225 lt!96611) lt!96608)))))

(declare-fun bs!7724 () Bool)

(assert (= bs!7724 d!56705))

(declare-fun m!221011 () Bool)

(assert (=> bs!7724 m!221011))

(assert (=> bs!7724 m!221011))

(declare-fun m!221013 () Bool)

(assert (=> bs!7724 m!221013))

(assert (=> b!193955 d!56705))

(declare-fun d!56707 () Bool)

(assert (=> d!56707 (contains!1356 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) lt!96607)))

(declare-fun lt!96917 () Unit!5819)

(assert (=> d!56707 (= lt!96917 (choose!1077 lt!96617 lt!96615 (zeroValue!3800 thiss!1248) lt!96607))))

(assert (=> d!56707 (contains!1356 lt!96617 lt!96607)))

(assert (=> d!56707 (= (addStillContains!164 lt!96617 lt!96615 (zeroValue!3800 thiss!1248) lt!96607) lt!96917)))

(declare-fun bs!7725 () Bool)

(assert (= bs!7725 d!56707))

(assert (=> bs!7725 m!220257))

(assert (=> bs!7725 m!220257))

(assert (=> bs!7725 m!220259))

(declare-fun m!221015 () Bool)

(assert (=> bs!7725 m!221015))

(declare-fun m!221017 () Bool)

(assert (=> bs!7725 m!221017))

(assert (=> b!193955 d!56707))

(declare-fun d!56709 () Bool)

(declare-fun e!127923 () Bool)

(assert (=> d!56709 e!127923))

(declare-fun res!91874 () Bool)

(assert (=> d!56709 (=> (not res!91874) (not e!127923))))

(declare-fun lt!96918 () ListLongMap!2419)

(assert (=> d!56709 (= res!91874 (contains!1356 lt!96918 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96920 () List!2426)

(assert (=> d!56709 (= lt!96918 (ListLongMap!2420 lt!96920))))

(declare-fun lt!96921 () Unit!5819)

(declare-fun lt!96919 () Unit!5819)

(assert (=> d!56709 (= lt!96921 lt!96919)))

(assert (=> d!56709 (= (getValueByKey!243 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(assert (=> d!56709 (= lt!96919 (lemmaContainsTupThenGetReturnValue!133 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(assert (=> d!56709 (= lt!96920 (insertStrictlySorted!136 (toList!1225 lt!96611) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(assert (=> d!56709 (= (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) lt!96918)))

(declare-fun b!194477 () Bool)

(declare-fun res!91875 () Bool)

(assert (=> b!194477 (=> (not res!91875) (not e!127923))))

(assert (=> b!194477 (= res!91875 (= (getValueByKey!243 (toList!1225 lt!96918) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(declare-fun b!194478 () Bool)

(assert (=> b!194478 (= e!127923 (contains!1359 (toList!1225 lt!96918) (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))

(assert (= (and d!56709 res!91874) b!194477))

(assert (= (and b!194477 res!91875) b!194478))

(declare-fun m!221019 () Bool)

(assert (=> d!56709 m!221019))

(declare-fun m!221021 () Bool)

(assert (=> d!56709 m!221021))

(declare-fun m!221023 () Bool)

(assert (=> d!56709 m!221023))

(declare-fun m!221025 () Bool)

(assert (=> d!56709 m!221025))

(declare-fun m!221027 () Bool)

(assert (=> b!194477 m!221027))

(declare-fun m!221029 () Bool)

(assert (=> b!194478 m!221029))

(assert (=> b!193955 d!56709))

(declare-fun d!56711 () Bool)

(assert (=> d!56711 (= (apply!188 lt!96606 lt!96621) (get!2232 (getValueByKey!243 (toList!1225 lt!96606) lt!96621)))))

(declare-fun bs!7726 () Bool)

(assert (= bs!7726 d!56711))

(declare-fun m!221031 () Bool)

(assert (=> bs!7726 m!221031))

(assert (=> bs!7726 m!221031))

(declare-fun m!221033 () Bool)

(assert (=> bs!7726 m!221033))

(assert (=> b!193955 d!56711))

(declare-fun d!56713 () Bool)

(declare-fun lt!96922 () Bool)

(assert (=> d!56713 (= lt!96922 (select (content!155 (toList!1225 lt!96663)) lt!96460))))

(declare-fun e!127924 () Bool)

(assert (=> d!56713 (= lt!96922 e!127924)))

(declare-fun res!91877 () Bool)

(assert (=> d!56713 (=> (not res!91877) (not e!127924))))

(assert (=> d!56713 (= res!91877 ((_ is Cons!2422) (toList!1225 lt!96663)))))

(assert (=> d!56713 (= (contains!1359 (toList!1225 lt!96663) lt!96460) lt!96922)))

(declare-fun b!194479 () Bool)

(declare-fun e!127925 () Bool)

(assert (=> b!194479 (= e!127924 e!127925)))

(declare-fun res!91876 () Bool)

(assert (=> b!194479 (=> res!91876 e!127925)))

(assert (=> b!194479 (= res!91876 (= (h!3063 (toList!1225 lt!96663)) lt!96460))))

(declare-fun b!194480 () Bool)

(assert (=> b!194480 (= e!127925 (contains!1359 (t!7343 (toList!1225 lt!96663)) lt!96460))))

(assert (= (and d!56713 res!91877) b!194479))

(assert (= (and b!194479 (not res!91876)) b!194480))

(declare-fun m!221035 () Bool)

(assert (=> d!56713 m!221035))

(declare-fun m!221037 () Bool)

(assert (=> d!56713 m!221037))

(declare-fun m!221039 () Bool)

(assert (=> b!194480 m!221039))

(assert (=> b!194016 d!56713))

(declare-fun d!56715 () Bool)

(assert (=> d!56715 (= (inRange!0 (ite c!35003 (index!4950 lt!96689) (index!4953 lt!96689)) (mask!9221 thiss!1248)) (and (bvsge (ite c!35003 (index!4950 lt!96689) (index!4953 lt!96689)) #b00000000000000000000000000000000) (bvslt (ite c!35003 (index!4950 lt!96689) (index!4953 lt!96689)) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19615 d!56715))

(declare-fun d!56717 () Bool)

(declare-fun e!127926 () Bool)

(assert (=> d!56717 e!127926))

(declare-fun res!91878 () Bool)

(assert (=> d!56717 (=> (not res!91878) (not e!127926))))

(declare-fun lt!96923 () ListLongMap!2419)

(assert (=> d!56717 (= res!91878 (contains!1356 lt!96923 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96925 () List!2426)

(assert (=> d!56717 (= lt!96923 (ListLongMap!2420 lt!96925))))

(declare-fun lt!96926 () Unit!5819)

(declare-fun lt!96924 () Unit!5819)

(assert (=> d!56717 (= lt!96926 lt!96924)))

(assert (=> d!56717 (= (getValueByKey!243 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56717 (= lt!96924 (lemmaContainsTupThenGetReturnValue!133 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56717 (= lt!96925 (insertStrictlySorted!136 (toList!1225 call!19613) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56717 (= (+!317 call!19613 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!96923)))

(declare-fun b!194481 () Bool)

(declare-fun res!91879 () Bool)

(assert (=> b!194481 (=> (not res!91879) (not e!127926))))

(assert (=> b!194481 (= res!91879 (= (getValueByKey!243 (toList!1225 lt!96923) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194482 () Bool)

(assert (=> b!194482 (= e!127926 (contains!1359 (toList!1225 lt!96923) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!56717 res!91878) b!194481))

(assert (= (and b!194481 res!91879) b!194482))

(declare-fun m!221041 () Bool)

(assert (=> d!56717 m!221041))

(declare-fun m!221043 () Bool)

(assert (=> d!56717 m!221043))

(declare-fun m!221045 () Bool)

(assert (=> d!56717 m!221045))

(declare-fun m!221047 () Bool)

(assert (=> d!56717 m!221047))

(declare-fun m!221049 () Bool)

(assert (=> b!194481 m!221049))

(declare-fun m!221051 () Bool)

(assert (=> b!194482 m!221051))

(assert (=> b!193988 d!56717))

(declare-fun b!194483 () Bool)

(declare-fun e!127930 () Bool)

(assert (=> b!194483 (= e!127930 (contains!1360 Nil!2426 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194484 () Bool)

(declare-fun e!127927 () Bool)

(declare-fun e!127928 () Bool)

(assert (=> b!194484 (= e!127927 e!127928)))

(declare-fun c!35120 () Bool)

(assert (=> b!194484 (= c!35120 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19664 () Bool)

(declare-fun call!19667 () Bool)

(assert (=> bm!19664 (= call!19667 (arrayNoDuplicates!0 (_keys!5952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35120 (Cons!2425 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)))))

(declare-fun b!194485 () Bool)

(assert (=> b!194485 (= e!127928 call!19667)))

(declare-fun b!194486 () Bool)

(assert (=> b!194486 (= e!127928 call!19667)))

(declare-fun b!194487 () Bool)

(declare-fun e!127929 () Bool)

(assert (=> b!194487 (= e!127929 e!127927)))

(declare-fun res!91881 () Bool)

(assert (=> b!194487 (=> (not res!91881) (not e!127927))))

(assert (=> b!194487 (= res!91881 (not e!127930))))

(declare-fun res!91880 () Bool)

(assert (=> b!194487 (=> (not res!91880) (not e!127930))))

(assert (=> b!194487 (= res!91880 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56719 () Bool)

(declare-fun res!91882 () Bool)

(assert (=> d!56719 (=> res!91882 e!127929)))

(assert (=> d!56719 (= res!91882 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56719 (= (arrayNoDuplicates!0 (_keys!5952 thiss!1248) #b00000000000000000000000000000000 Nil!2426) e!127929)))

(assert (= (and d!56719 (not res!91882)) b!194487))

(assert (= (and b!194487 res!91880) b!194483))

(assert (= (and b!194487 res!91881) b!194484))

(assert (= (and b!194484 c!35120) b!194486))

(assert (= (and b!194484 (not c!35120)) b!194485))

(assert (= (or b!194486 b!194485) bm!19664))

(assert (=> b!194483 m!220231))

(assert (=> b!194483 m!220231))

(declare-fun m!221053 () Bool)

(assert (=> b!194483 m!221053))

(assert (=> b!194484 m!220231))

(assert (=> b!194484 m!220231))

(assert (=> b!194484 m!220233))

(assert (=> bm!19664 m!220231))

(declare-fun m!221055 () Bool)

(assert (=> bm!19664 m!221055))

(assert (=> b!194487 m!220231))

(assert (=> b!194487 m!220231))

(assert (=> b!194487 m!220233))

(assert (=> b!194022 d!56719))

(declare-fun d!56721 () Bool)

(assert (=> d!56721 (= (+!317 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) (tuple2!3511 key!828 v!309)) (getCurrentListMap!858 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(assert (=> d!56721 true))

(declare-fun _$5!158 () Unit!5819)

(assert (=> d!56721 (= (choose!1070 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4951 lt!96450) key!828 v!309 (defaultEntry!3959 thiss!1248)) _$5!158)))

(declare-fun bs!7727 () Bool)

(assert (= bs!7727 d!56721))

(assert (=> bs!7727 m!220095))

(assert (=> bs!7727 m!220095))

(assert (=> bs!7727 m!220337))

(assert (=> bs!7727 m!220101))

(assert (=> bs!7727 m!220339))

(assert (=> d!56499 d!56721))

(assert (=> d!56499 d!56531))

(declare-fun d!56723 () Bool)

(assert (=> d!56723 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun lt!96927 () Unit!5819)

(assert (=> d!56723 (= lt!96927 (choose!1075 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun e!127931 () Bool)

(assert (=> d!56723 e!127931))

(declare-fun res!91883 () Bool)

(assert (=> d!56723 (=> (not res!91883) (not e!127931))))

(assert (=> d!56723 (= res!91883 (isStrictlySorted!352 (toList!1225 lt!96451)))))

(assert (=> d!56723 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) lt!96927)))

(declare-fun b!194488 () Bool)

(assert (=> b!194488 (= e!127931 (containsKey!247 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (= (and d!56723 res!91883) b!194488))

(assert (=> d!56723 m!220093))

(assert (=> d!56723 m!220369))

(assert (=> d!56723 m!220369))

(assert (=> d!56723 m!220371))

(assert (=> d!56723 m!220093))

(declare-fun m!221057 () Bool)

(assert (=> d!56723 m!221057))

(declare-fun m!221059 () Bool)

(assert (=> d!56723 m!221059))

(assert (=> b!194488 m!220093))

(assert (=> b!194488 m!220365))

(assert (=> b!194017 d!56723))

(assert (=> b!194017 d!56599))

(assert (=> b!194017 d!56601))

(declare-fun mapIsEmpty!7776 () Bool)

(declare-fun mapRes!7776 () Bool)

(assert (=> mapIsEmpty!7776 mapRes!7776))

(declare-fun condMapEmpty!7776 () Bool)

(declare-fun mapDefault!7776 () ValueCell!1901)

(assert (=> mapNonEmpty!7775 (= condMapEmpty!7776 (= mapRest!7775 ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7776)))))

(declare-fun e!127932 () Bool)

(assert (=> mapNonEmpty!7775 (= tp!17036 (and e!127932 mapRes!7776))))

(declare-fun b!194489 () Bool)

(declare-fun e!127933 () Bool)

(assert (=> b!194489 (= e!127933 tp_is_empty!4489)))

(declare-fun mapNonEmpty!7776 () Bool)

(declare-fun tp!17037 () Bool)

(assert (=> mapNonEmpty!7776 (= mapRes!7776 (and tp!17037 e!127933))))

(declare-fun mapKey!7776 () (_ BitVec 32))

(declare-fun mapRest!7776 () (Array (_ BitVec 32) ValueCell!1901))

(declare-fun mapValue!7776 () ValueCell!1901)

(assert (=> mapNonEmpty!7776 (= mapRest!7775 (store mapRest!7776 mapKey!7776 mapValue!7776))))

(declare-fun b!194490 () Bool)

(assert (=> b!194490 (= e!127932 tp_is_empty!4489)))

(assert (= (and mapNonEmpty!7775 condMapEmpty!7776) mapIsEmpty!7776))

(assert (= (and mapNonEmpty!7775 (not condMapEmpty!7776)) mapNonEmpty!7776))

(assert (= (and mapNonEmpty!7776 ((_ is ValueCellFull!1901) mapValue!7776)) b!194489))

(assert (= (and mapNonEmpty!7775 ((_ is ValueCellFull!1901) mapDefault!7776)) b!194490))

(declare-fun m!221061 () Bool)

(assert (=> mapNonEmpty!7776 m!221061))

(declare-fun b_lambda!7481 () Bool)

(assert (= b_lambda!7475 (or (and b!193809 b_free!4717) b_lambda!7481)))

(declare-fun b_lambda!7483 () Bool)

(assert (= b_lambda!7469 (or (and b!193809 b_free!4717) b_lambda!7483)))

(declare-fun b_lambda!7485 () Bool)

(assert (= b_lambda!7471 (or (and b!193809 b_free!4717) b_lambda!7485)))

(declare-fun b_lambda!7487 () Bool)

(assert (= b_lambda!7473 (or (and b!193809 b_free!4717) b_lambda!7487)))

(declare-fun b_lambda!7489 () Bool)

(assert (= b_lambda!7477 (or (and b!193809 b_free!4717) b_lambda!7489)))

(check-sat (not d!56577) (not b!194299) (not b!194283) (not b!194240) (not d!56579) (not bm!19624) (not d!56705) (not b!194188) (not b!194114) (not bm!19639) (not b!194235) (not b!194351) (not d!56529) (not d!56641) (not d!56683) (not d!56675) (not b!194474) (not b!194190) (not b!194387) (not b!194252) (not b!194117) (not b!194306) (not b!194337) (not d!56663) (not d!56691) (not b!194359) (not d!56573) (not b!194372) (not b!194273) (not d!56599) (not d!56667) (not b!194295) (not b!194263) (not b!194477) (not d!56643) (not b!194072) (not b_lambda!7489) (not b!194320) (not b!194281) (not d!56659) (not b!194338) (not bm!19646) (not d!56607) (not b_lambda!7465) (not bm!19637) (not bm!19641) (not d!56707) (not d!56655) (not b!194476) (not d!56551) (not d!56635) (not d!56625) (not b!194481) (not b!194336) (not d!56701) (not b!194243) (not d!56639) (not b!194123) (not b!194087) (not bm!19633) (not bm!19655) (not d!56545) (not d!56533) (not b!194470) (not b!194109) (not bm!19634) (not b!194330) (not d!56699) (not b!194085) (not b_lambda!7467) (not b_lambda!7479) (not b!194225) (not bm!19642) (not d!56633) (not b!194271) (not d!56689) (not d!56591) (not d!56709) (not b!194189) (not b!194391) (not b!194089) (not d!56629) (not b_lambda!7487) (not d!56653) (not d!56685) (not d!56557) (not b_lambda!7483) (not d!56623) (not bm!19628) (not d!56605) (not b!194371) (not b!194411) (not b!194146) (not b!194365) (not d!56547) (not b!194407) (not d!56711) (not b!194275) (not d!56717) (not b!194264) (not b!194241) (not bm!19648) (not b!194293) (not b!194480) (not b!194261) (not bm!19652) tp_is_empty!4489 (not b!194341) (not d!56541) (not d!56693) (not d!56669) (not b!194362) (not mapNonEmpty!7776) (not d!56593) (not d!56537) (not d!56571) (not d!56589) (not b!194471) (not b!194231) (not b!194309) (not b!194112) (not d!56687) (not b!194450) (not b!194223) (not bm!19645) (not d!56637) (not d!56657) (not b!194473) (not d!56695) (not b!194482) (not d!56583) (not b!194329) (not b!194305) (not b!194145) (not d!56575) (not d!56617) (not bm!19647) (not b!194393) (not d!56543) (not bm!19663) (not b!194483) (not b!194318) (not b!194104) (not b!194466) (not bm!19653) (not b!194363) (not d!56713) (not b!194484) (not bm!19659) (not b!194395) (not b!194374) (not b!194357) (not b!194348) (not d!56627) (not b!194074) (not b!194253) (not d!56597) (not b!194461) (not b!194350) (not b!194475) (not b!194187) (not b!194285) (not b!194270) (not b!194455) (not d!56563) (not b!194124) (not b!194376) (not b!194289) (not d!56631) (not d!56619) (not d!56567) (not bm!19662) (not b!194413) (not d!56721) (not b!194459) (not b!194181) (not b_lambda!7481) (not b!194148) (not d!56555) (not b!194349) (not b!194272) (not b!194238) (not b!194298) (not b!194347) (not b_next!4717) (not b!194326) (not d!56723) (not b!194390) (not b!194424) (not b!194070) (not d!56679) (not b!194316) (not b_lambda!7485) (not d!56647) (not b!194182) (not b!194233) (not d!56553) (not b!194110) (not b!194268) b_and!11425 (not d!56697) (not b!194284) (not d!56703) (not b!194186) (not d!56649) (not b!194406) (not b!194242) (not b!194410) (not b!194339) (not bm!19664) (not b!194468) (not b!194256) (not d!56621) (not d!56645) (not b!194232) (not b!194463) (not b!194259) (not b!194108) (not bm!19654) (not b!194364) (not b!194179) (not b!194386) (not d!56615) (not b!194287) (not b!194478) (not b!194269) (not b!194487) (not d!56595) (not b!194488) (not b!194279) (not d!56681) (not b!194111) (not b!194245) (not b!194464) (not b!194324))
(check-sat b_and!11425 (not b_next!4717))
(get-model)

(declare-fun d!56725 () Bool)

(assert (=> d!56725 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!96928 () Unit!5819)

(assert (=> d!56725 (= lt!96928 (choose!1075 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127934 () Bool)

(assert (=> d!56725 e!127934))

(declare-fun res!91884 () Bool)

(assert (=> d!56725 (=> (not res!91884) (not e!127934))))

(assert (=> d!56725 (= res!91884 (isStrictlySorted!352 (toList!1225 lt!96610)))))

(assert (=> d!56725 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000) lt!96928)))

(declare-fun b!194491 () Bool)

(assert (=> b!194491 (= e!127934 (containsKey!247 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56725 res!91884) b!194491))

(assert (=> d!56725 m!220893))

(assert (=> d!56725 m!220893))

(assert (=> d!56725 m!220895))

(declare-fun m!221063 () Bool)

(assert (=> d!56725 m!221063))

(declare-fun m!221065 () Bool)

(assert (=> d!56725 m!221065))

(assert (=> b!194491 m!220889))

(assert (=> b!194393 d!56725))

(declare-fun d!56727 () Bool)

(assert (=> d!56727 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7728 () Bool)

(assert (= bs!7728 d!56727))

(assert (=> bs!7728 m!220893))

(declare-fun m!221067 () Bool)

(assert (=> bs!7728 m!221067))

(assert (=> b!194393 d!56727))

(declare-fun b!194494 () Bool)

(declare-fun e!127936 () Option!249)

(assert (=> b!194494 (= e!127936 (getValueByKey!243 (t!7343 (toList!1225 lt!96610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56729 () Bool)

(declare-fun c!35121 () Bool)

(assert (=> d!56729 (= c!35121 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (= (_1!1766 (h!3063 (toList!1225 lt!96610))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127935 () Option!249)

(assert (=> d!56729 (= (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000) e!127935)))

(declare-fun b!194492 () Bool)

(assert (=> b!194492 (= e!127935 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96610)))))))

(declare-fun b!194493 () Bool)

(assert (=> b!194493 (= e!127935 e!127936)))

(declare-fun c!35122 () Bool)

(assert (=> b!194493 (= c!35122 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96610))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194495 () Bool)

(assert (=> b!194495 (= e!127936 None!247)))

(assert (= (and d!56729 c!35121) b!194492))

(assert (= (and d!56729 (not c!35121)) b!194493))

(assert (= (and b!194493 c!35122) b!194494))

(assert (= (and b!194493 (not c!35122)) b!194495))

(declare-fun m!221069 () Bool)

(assert (=> b!194494 m!221069))

(assert (=> b!194393 d!56729))

(declare-fun d!56731 () Bool)

(declare-fun isEmpty!493 (List!2426) Bool)

(assert (=> d!56731 (= (isEmpty!491 lt!96777) (isEmpty!493 (toList!1225 lt!96777)))))

(declare-fun bs!7729 () Bool)

(assert (= bs!7729 d!56731))

(declare-fun m!221071 () Bool)

(assert (=> bs!7729 m!221071))

(assert (=> b!194263 d!56731))

(declare-fun d!56733 () Bool)

(assert (=> d!56733 (= (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!194410 d!56733))

(declare-fun d!56735 () Bool)

(declare-fun e!127938 () Bool)

(assert (=> d!56735 e!127938))

(declare-fun res!91885 () Bool)

(assert (=> d!56735 (=> res!91885 e!127938)))

(declare-fun lt!96931 () Bool)

(assert (=> d!56735 (= res!91885 (not lt!96931))))

(declare-fun lt!96932 () Bool)

(assert (=> d!56735 (= lt!96931 lt!96932)))

(declare-fun lt!96930 () Unit!5819)

(declare-fun e!127937 () Unit!5819)

(assert (=> d!56735 (= lt!96930 e!127937)))

(declare-fun c!35123 () Bool)

(assert (=> d!56735 (= c!35123 lt!96932)))

(assert (=> d!56735 (= lt!96932 (containsKey!247 (toList!1225 lt!96838) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56735 (= (contains!1356 lt!96838 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96931)))

(declare-fun b!194496 () Bool)

(declare-fun lt!96929 () Unit!5819)

(assert (=> b!194496 (= e!127937 lt!96929)))

(assert (=> b!194496 (= lt!96929 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96838) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!194496 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96838) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194497 () Bool)

(declare-fun Unit!5846 () Unit!5819)

(assert (=> b!194497 (= e!127937 Unit!5846)))

(declare-fun b!194498 () Bool)

(assert (=> b!194498 (= e!127938 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96838) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!56735 c!35123) b!194496))

(assert (= (and d!56735 (not c!35123)) b!194497))

(assert (= (and d!56735 (not res!91885)) b!194498))

(declare-fun m!221073 () Bool)

(assert (=> d!56735 m!221073))

(declare-fun m!221075 () Bool)

(assert (=> b!194496 m!221075))

(assert (=> b!194496 m!220805))

(assert (=> b!194496 m!220805))

(declare-fun m!221077 () Bool)

(assert (=> b!194496 m!221077))

(assert (=> b!194498 m!220805))

(assert (=> b!194498 m!220805))

(assert (=> b!194498 m!221077))

(assert (=> d!56623 d!56735))

(declare-fun e!127940 () Option!249)

(declare-fun b!194501 () Bool)

(assert (=> b!194501 (= e!127940 (getValueByKey!243 (t!7343 lt!96840) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun d!56737 () Bool)

(declare-fun c!35124 () Bool)

(assert (=> d!56737 (= c!35124 (and ((_ is Cons!2422) lt!96840) (= (_1!1766 (h!3063 lt!96840)) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!127939 () Option!249)

(assert (=> d!56737 (= (getValueByKey!243 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) e!127939)))

(declare-fun b!194499 () Bool)

(assert (=> b!194499 (= e!127939 (Some!248 (_2!1766 (h!3063 lt!96840))))))

(declare-fun b!194500 () Bool)

(assert (=> b!194500 (= e!127939 e!127940)))

(declare-fun c!35125 () Bool)

(assert (=> b!194500 (= c!35125 (and ((_ is Cons!2422) lt!96840) (not (= (_1!1766 (h!3063 lt!96840)) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194502 () Bool)

(assert (=> b!194502 (= e!127940 None!247)))

(assert (= (and d!56737 c!35124) b!194499))

(assert (= (and d!56737 (not c!35124)) b!194500))

(assert (= (and b!194500 c!35125) b!194501))

(assert (= (and b!194500 (not c!35125)) b!194502))

(declare-fun m!221079 () Bool)

(assert (=> b!194501 m!221079))

(assert (=> d!56623 d!56737))

(declare-fun d!56739 () Bool)

(assert (=> d!56739 (= (getValueByKey!243 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96933 () Unit!5819)

(assert (=> d!56739 (= lt!96933 (choose!1074 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!127941 () Bool)

(assert (=> d!56739 e!127941))

(declare-fun res!91886 () Bool)

(assert (=> d!56739 (=> (not res!91886) (not e!127941))))

(assert (=> d!56739 (= res!91886 (isStrictlySorted!352 lt!96840))))

(assert (=> d!56739 (= (lemmaContainsTupThenGetReturnValue!133 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96933)))

(declare-fun b!194503 () Bool)

(declare-fun res!91887 () Bool)

(assert (=> b!194503 (=> (not res!91887) (not e!127941))))

(assert (=> b!194503 (= res!91887 (containsKey!247 lt!96840 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194504 () Bool)

(assert (=> b!194504 (= e!127941 (contains!1359 lt!96840 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!56739 res!91886) b!194503))

(assert (= (and b!194503 res!91887) b!194504))

(assert (=> d!56739 m!220799))

(declare-fun m!221081 () Bool)

(assert (=> d!56739 m!221081))

(declare-fun m!221083 () Bool)

(assert (=> d!56739 m!221083))

(declare-fun m!221085 () Bool)

(assert (=> b!194503 m!221085))

(declare-fun m!221087 () Bool)

(assert (=> b!194504 m!221087))

(assert (=> d!56623 d!56739))

(declare-fun d!56741 () Bool)

(declare-fun e!127943 () Bool)

(assert (=> d!56741 e!127943))

(declare-fun res!91889 () Bool)

(assert (=> d!56741 (=> (not res!91889) (not e!127943))))

(declare-fun lt!96934 () List!2426)

(assert (=> d!56741 (= res!91889 (isStrictlySorted!352 lt!96934))))

(declare-fun e!127944 () List!2426)

(assert (=> d!56741 (= lt!96934 e!127944)))

(declare-fun c!35126 () Bool)

(assert (=> d!56741 (= c!35126 (and ((_ is Cons!2422) (toList!1225 lt!96627)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96627))) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!56741 (isStrictlySorted!352 (toList!1225 lt!96627))))

(assert (=> d!56741 (= (insertStrictlySorted!136 (toList!1225 lt!96627) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96934)))

(declare-fun bm!19665 () Bool)

(declare-fun call!19669 () List!2426)

(declare-fun call!19670 () List!2426)

(assert (=> bm!19665 (= call!19669 call!19670)))

(declare-fun e!127945 () List!2426)

(declare-fun b!194505 () Bool)

(assert (=> b!194505 (= e!127945 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96627)) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194506 () Bool)

(assert (=> b!194506 (= e!127943 (contains!1359 lt!96934 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194507 () Bool)

(declare-fun e!127942 () List!2426)

(assert (=> b!194507 (= e!127944 e!127942)))

(declare-fun c!35128 () Bool)

(assert (=> b!194507 (= c!35128 (and ((_ is Cons!2422) (toList!1225 lt!96627)) (= (_1!1766 (h!3063 (toList!1225 lt!96627))) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194508 () Bool)

(declare-fun res!91888 () Bool)

(assert (=> b!194508 (=> (not res!91888) (not e!127943))))

(assert (=> b!194508 (= res!91888 (containsKey!247 lt!96934 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194509 () Bool)

(assert (=> b!194509 (= e!127944 call!19670)))

(declare-fun b!194510 () Bool)

(declare-fun e!127946 () List!2426)

(declare-fun call!19668 () List!2426)

(assert (=> b!194510 (= e!127946 call!19668)))

(declare-fun b!194511 () Bool)

(assert (=> b!194511 (= e!127946 call!19668)))

(declare-fun c!35129 () Bool)

(declare-fun b!194512 () Bool)

(assert (=> b!194512 (= e!127945 (ite c!35128 (t!7343 (toList!1225 lt!96627)) (ite c!35129 (Cons!2422 (h!3063 (toList!1225 lt!96627)) (t!7343 (toList!1225 lt!96627))) Nil!2423)))))

(declare-fun b!194513 () Bool)

(assert (=> b!194513 (= e!127942 call!19669)))

(declare-fun bm!19666 () Bool)

(assert (=> bm!19666 (= call!19670 ($colon$colon!102 e!127945 (ite c!35126 (h!3063 (toList!1225 lt!96627)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35127 () Bool)

(assert (=> bm!19666 (= c!35127 c!35126)))

(declare-fun b!194514 () Bool)

(assert (=> b!194514 (= c!35129 (and ((_ is Cons!2422) (toList!1225 lt!96627)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96627))) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(assert (=> b!194514 (= e!127942 e!127946)))

(declare-fun bm!19667 () Bool)

(assert (=> bm!19667 (= call!19668 call!19669)))

(assert (= (and d!56741 c!35126) b!194509))

(assert (= (and d!56741 (not c!35126)) b!194507))

(assert (= (and b!194507 c!35128) b!194513))

(assert (= (and b!194507 (not c!35128)) b!194514))

(assert (= (and b!194514 c!35129) b!194510))

(assert (= (and b!194514 (not c!35129)) b!194511))

(assert (= (or b!194510 b!194511) bm!19667))

(assert (= (or b!194513 bm!19667) bm!19665))

(assert (= (or b!194509 bm!19665) bm!19666))

(assert (= (and bm!19666 c!35127) b!194505))

(assert (= (and bm!19666 (not c!35127)) b!194512))

(assert (= (and d!56741 res!91889) b!194508))

(assert (= (and b!194508 res!91888) b!194506))

(declare-fun m!221089 () Bool)

(assert (=> d!56741 m!221089))

(declare-fun m!221091 () Bool)

(assert (=> d!56741 m!221091))

(declare-fun m!221093 () Bool)

(assert (=> b!194508 m!221093))

(declare-fun m!221095 () Bool)

(assert (=> b!194505 m!221095))

(declare-fun m!221097 () Bool)

(assert (=> b!194506 m!221097))

(declare-fun m!221099 () Bool)

(assert (=> bm!19666 m!221099))

(assert (=> d!56623 d!56741))

(declare-fun d!56743 () Bool)

(assert (=> d!56743 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4250 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56667 d!56743))

(declare-fun b!194517 () Bool)

(declare-fun e!127948 () Option!249)

(assert (=> b!194517 (= e!127948 (getValueByKey!243 (t!7343 (toList!1225 lt!96610)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56745 () Bool)

(declare-fun c!35130 () Bool)

(assert (=> d!56745 (= c!35130 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (= (_1!1766 (h!3063 (toList!1225 lt!96610))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127947 () Option!249)

(assert (=> d!56745 (= (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000) e!127947)))

(declare-fun b!194515 () Bool)

(assert (=> b!194515 (= e!127947 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96610)))))))

(declare-fun b!194516 () Bool)

(assert (=> b!194516 (= e!127947 e!127948)))

(declare-fun c!35131 () Bool)

(assert (=> b!194516 (= c!35131 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96610))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194518 () Bool)

(assert (=> b!194518 (= e!127948 None!247)))

(assert (= (and d!56745 c!35130) b!194515))

(assert (= (and d!56745 (not c!35130)) b!194516))

(assert (= (and b!194516 c!35131) b!194517))

(assert (= (and b!194516 (not c!35131)) b!194518))

(declare-fun m!221101 () Bool)

(assert (=> b!194517 m!221101))

(assert (=> d!56667 d!56745))

(declare-fun d!56747 () Bool)

(declare-fun e!127950 () Bool)

(assert (=> d!56747 e!127950))

(declare-fun res!91890 () Bool)

(assert (=> d!56747 (=> res!91890 e!127950)))

(declare-fun lt!96937 () Bool)

(assert (=> d!56747 (= res!91890 (not lt!96937))))

(declare-fun lt!96938 () Bool)

(assert (=> d!56747 (= lt!96937 lt!96938)))

(declare-fun lt!96936 () Unit!5819)

(declare-fun e!127949 () Unit!5819)

(assert (=> d!56747 (= lt!96936 e!127949)))

(declare-fun c!35132 () Bool)

(assert (=> d!56747 (= c!35132 lt!96938)))

(assert (=> d!56747 (= lt!96938 (containsKey!247 (toList!1225 lt!96904) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!56747 (= (contains!1356 lt!96904 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96937)))

(declare-fun b!194519 () Bool)

(declare-fun lt!96935 () Unit!5819)

(assert (=> b!194519 (= e!127949 lt!96935)))

(assert (=> b!194519 (= lt!96935 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96904) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!194519 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96904) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194520 () Bool)

(declare-fun Unit!5847 () Unit!5819)

(assert (=> b!194520 (= e!127949 Unit!5847)))

(declare-fun b!194521 () Bool)

(assert (=> b!194521 (= e!127950 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96904) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!56747 c!35132) b!194519))

(assert (= (and d!56747 (not c!35132)) b!194520))

(assert (= (and d!56747 (not res!91890)) b!194521))

(declare-fun m!221103 () Bool)

(assert (=> d!56747 m!221103))

(declare-fun m!221105 () Bool)

(assert (=> b!194519 m!221105))

(assert (=> b!194519 m!220979))

(assert (=> b!194519 m!220979))

(declare-fun m!221107 () Bool)

(assert (=> b!194519 m!221107))

(assert (=> b!194521 m!220979))

(assert (=> b!194521 m!220979))

(assert (=> b!194521 m!221107))

(assert (=> d!56697 d!56747))

(declare-fun e!127952 () Option!249)

(declare-fun b!194524 () Bool)

(assert (=> b!194524 (= e!127952 (getValueByKey!243 (t!7343 lt!96906) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun c!35133 () Bool)

(declare-fun d!56749 () Bool)

(assert (=> d!56749 (= c!35133 (and ((_ is Cons!2422) lt!96906) (= (_1!1766 (h!3063 lt!96906)) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!127951 () Option!249)

(assert (=> d!56749 (= (getValueByKey!243 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) e!127951)))

(declare-fun b!194522 () Bool)

(assert (=> b!194522 (= e!127951 (Some!248 (_2!1766 (h!3063 lt!96906))))))

(declare-fun b!194523 () Bool)

(assert (=> b!194523 (= e!127951 e!127952)))

(declare-fun c!35134 () Bool)

(assert (=> b!194523 (= c!35134 (and ((_ is Cons!2422) lt!96906) (not (= (_1!1766 (h!3063 lt!96906)) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194525 () Bool)

(assert (=> b!194525 (= e!127952 None!247)))

(assert (= (and d!56749 c!35133) b!194522))

(assert (= (and d!56749 (not c!35133)) b!194523))

(assert (= (and b!194523 c!35134) b!194524))

(assert (= (and b!194523 (not c!35134)) b!194525))

(declare-fun m!221109 () Bool)

(assert (=> b!194524 m!221109))

(assert (=> d!56697 d!56749))

(declare-fun d!56751 () Bool)

(assert (=> d!56751 (= (getValueByKey!243 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!96939 () Unit!5819)

(assert (=> d!56751 (= lt!96939 (choose!1074 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!127953 () Bool)

(assert (=> d!56751 e!127953))

(declare-fun res!91891 () Bool)

(assert (=> d!56751 (=> (not res!91891) (not e!127953))))

(assert (=> d!56751 (= res!91891 (isStrictlySorted!352 lt!96906))))

(assert (=> d!56751 (= (lemmaContainsTupThenGetReturnValue!133 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96939)))

(declare-fun b!194526 () Bool)

(declare-fun res!91892 () Bool)

(assert (=> b!194526 (=> (not res!91892) (not e!127953))))

(assert (=> b!194526 (= res!91892 (containsKey!247 lt!96906 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194527 () Bool)

(assert (=> b!194527 (= e!127953 (contains!1359 lt!96906 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!56751 res!91891) b!194526))

(assert (= (and b!194526 res!91892) b!194527))

(assert (=> d!56751 m!220973))

(declare-fun m!221111 () Bool)

(assert (=> d!56751 m!221111))

(declare-fun m!221113 () Bool)

(assert (=> d!56751 m!221113))

(declare-fun m!221115 () Bool)

(assert (=> b!194526 m!221115))

(declare-fun m!221117 () Bool)

(assert (=> b!194527 m!221117))

(assert (=> d!56697 d!56751))

(declare-fun d!56753 () Bool)

(declare-fun e!127955 () Bool)

(assert (=> d!56753 e!127955))

(declare-fun res!91894 () Bool)

(assert (=> d!56753 (=> (not res!91894) (not e!127955))))

(declare-fun lt!96940 () List!2426)

(assert (=> d!56753 (= res!91894 (isStrictlySorted!352 lt!96940))))

(declare-fun e!127956 () List!2426)

(assert (=> d!56753 (= lt!96940 e!127956)))

(declare-fun c!35135 () Bool)

(assert (=> d!56753 (= c!35135 (and ((_ is Cons!2422) (toList!1225 lt!96617)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96617))) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!56753 (isStrictlySorted!352 (toList!1225 lt!96617))))

(assert (=> d!56753 (= (insertStrictlySorted!136 (toList!1225 lt!96617) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96940)))

(declare-fun bm!19668 () Bool)

(declare-fun call!19672 () List!2426)

(declare-fun call!19673 () List!2426)

(assert (=> bm!19668 (= call!19672 call!19673)))

(declare-fun b!194528 () Bool)

(declare-fun e!127957 () List!2426)

(assert (=> b!194528 (= e!127957 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96617)) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194529 () Bool)

(assert (=> b!194529 (= e!127955 (contains!1359 lt!96940 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194530 () Bool)

(declare-fun e!127954 () List!2426)

(assert (=> b!194530 (= e!127956 e!127954)))

(declare-fun c!35137 () Bool)

(assert (=> b!194530 (= c!35137 (and ((_ is Cons!2422) (toList!1225 lt!96617)) (= (_1!1766 (h!3063 (toList!1225 lt!96617))) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194531 () Bool)

(declare-fun res!91893 () Bool)

(assert (=> b!194531 (=> (not res!91893) (not e!127955))))

(assert (=> b!194531 (= res!91893 (containsKey!247 lt!96940 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194532 () Bool)

(assert (=> b!194532 (= e!127956 call!19673)))

(declare-fun b!194533 () Bool)

(declare-fun e!127958 () List!2426)

(declare-fun call!19671 () List!2426)

(assert (=> b!194533 (= e!127958 call!19671)))

(declare-fun b!194534 () Bool)

(assert (=> b!194534 (= e!127958 call!19671)))

(declare-fun b!194535 () Bool)

(declare-fun c!35138 () Bool)

(assert (=> b!194535 (= e!127957 (ite c!35137 (t!7343 (toList!1225 lt!96617)) (ite c!35138 (Cons!2422 (h!3063 (toList!1225 lt!96617)) (t!7343 (toList!1225 lt!96617))) Nil!2423)))))

(declare-fun b!194536 () Bool)

(assert (=> b!194536 (= e!127954 call!19672)))

(declare-fun bm!19669 () Bool)

(assert (=> bm!19669 (= call!19673 ($colon$colon!102 e!127957 (ite c!35135 (h!3063 (toList!1225 lt!96617)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35136 () Bool)

(assert (=> bm!19669 (= c!35136 c!35135)))

(declare-fun b!194537 () Bool)

(assert (=> b!194537 (= c!35138 (and ((_ is Cons!2422) (toList!1225 lt!96617)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96617))) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(assert (=> b!194537 (= e!127954 e!127958)))

(declare-fun bm!19670 () Bool)

(assert (=> bm!19670 (= call!19671 call!19672)))

(assert (= (and d!56753 c!35135) b!194532))

(assert (= (and d!56753 (not c!35135)) b!194530))

(assert (= (and b!194530 c!35137) b!194536))

(assert (= (and b!194530 (not c!35137)) b!194537))

(assert (= (and b!194537 c!35138) b!194533))

(assert (= (and b!194537 (not c!35138)) b!194534))

(assert (= (or b!194533 b!194534) bm!19670))

(assert (= (or b!194536 bm!19670) bm!19668))

(assert (= (or b!194532 bm!19668) bm!19669))

(assert (= (and bm!19669 c!35136) b!194528))

(assert (= (and bm!19669 (not c!35136)) b!194535))

(assert (= (and d!56753 res!91894) b!194531))

(assert (= (and b!194531 res!91893) b!194529))

(declare-fun m!221119 () Bool)

(assert (=> d!56753 m!221119))

(declare-fun m!221121 () Bool)

(assert (=> d!56753 m!221121))

(declare-fun m!221123 () Bool)

(assert (=> b!194531 m!221123))

(declare-fun m!221125 () Bool)

(assert (=> b!194528 m!221125))

(declare-fun m!221127 () Bool)

(assert (=> b!194529 m!221127))

(declare-fun m!221129 () Bool)

(assert (=> bm!19669 m!221129))

(assert (=> d!56697 d!56753))

(declare-fun lt!96941 () Bool)

(declare-fun d!56755 () Bool)

(assert (=> d!56755 (= lt!96941 (select (content!155 (toList!1225 lt!96909)) (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))

(declare-fun e!127959 () Bool)

(assert (=> d!56755 (= lt!96941 e!127959)))

(declare-fun res!91896 () Bool)

(assert (=> d!56755 (=> (not res!91896) (not e!127959))))

(assert (=> d!56755 (= res!91896 ((_ is Cons!2422) (toList!1225 lt!96909)))))

(assert (=> d!56755 (= (contains!1359 (toList!1225 lt!96909) (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) lt!96941)))

(declare-fun b!194538 () Bool)

(declare-fun e!127960 () Bool)

(assert (=> b!194538 (= e!127959 e!127960)))

(declare-fun res!91895 () Bool)

(assert (=> b!194538 (=> res!91895 e!127960)))

(assert (=> b!194538 (= res!91895 (= (h!3063 (toList!1225 lt!96909)) (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))

(declare-fun b!194539 () Bool)

(assert (=> b!194539 (= e!127960 (contains!1359 (t!7343 (toList!1225 lt!96909)) (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))

(assert (= (and d!56755 res!91896) b!194538))

(assert (= (and b!194538 (not res!91895)) b!194539))

(declare-fun m!221131 () Bool)

(assert (=> d!56755 m!221131))

(declare-fun m!221133 () Bool)

(assert (=> d!56755 m!221133))

(declare-fun m!221135 () Bool)

(assert (=> b!194539 m!221135))

(assert (=> b!194474 d!56755))

(assert (=> d!56639 d!56633))

(assert (=> d!56639 d!56643))

(declare-fun d!56757 () Bool)

(assert (=> d!56757 (contains!1356 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) lt!96629)))

(assert (=> d!56757 true))

(declare-fun _$35!416 () Unit!5819)

(assert (=> d!56757 (= (choose!1077 lt!96639 lt!96637 (zeroValue!3800 thiss!1248) lt!96629) _$35!416)))

(declare-fun bs!7730 () Bool)

(assert (= bs!7730 d!56757))

(assert (=> bs!7730 m!220309))

(assert (=> bs!7730 m!220309))

(assert (=> bs!7730 m!220311))

(assert (=> d!56639 d!56757))

(declare-fun d!56759 () Bool)

(declare-fun e!127962 () Bool)

(assert (=> d!56759 e!127962))

(declare-fun res!91897 () Bool)

(assert (=> d!56759 (=> res!91897 e!127962)))

(declare-fun lt!96944 () Bool)

(assert (=> d!56759 (= res!91897 (not lt!96944))))

(declare-fun lt!96945 () Bool)

(assert (=> d!56759 (= lt!96944 lt!96945)))

(declare-fun lt!96943 () Unit!5819)

(declare-fun e!127961 () Unit!5819)

(assert (=> d!56759 (= lt!96943 e!127961)))

(declare-fun c!35139 () Bool)

(assert (=> d!56759 (= c!35139 lt!96945)))

(assert (=> d!56759 (= lt!96945 (containsKey!247 (toList!1225 lt!96639) lt!96629))))

(assert (=> d!56759 (= (contains!1356 lt!96639 lt!96629) lt!96944)))

(declare-fun b!194541 () Bool)

(declare-fun lt!96942 () Unit!5819)

(assert (=> b!194541 (= e!127961 lt!96942)))

(assert (=> b!194541 (= lt!96942 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96639) lt!96629))))

(assert (=> b!194541 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96639) lt!96629))))

(declare-fun b!194542 () Bool)

(declare-fun Unit!5848 () Unit!5819)

(assert (=> b!194542 (= e!127961 Unit!5848)))

(declare-fun b!194543 () Bool)

(assert (=> b!194543 (= e!127962 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96639) lt!96629)))))

(assert (= (and d!56759 c!35139) b!194541))

(assert (= (and d!56759 (not c!35139)) b!194542))

(assert (= (and d!56759 (not res!91897)) b!194543))

(declare-fun m!221137 () Bool)

(assert (=> d!56759 m!221137))

(declare-fun m!221139 () Bool)

(assert (=> b!194541 m!221139))

(declare-fun m!221141 () Bool)

(assert (=> b!194541 m!221141))

(assert (=> b!194541 m!221141))

(declare-fun m!221143 () Bool)

(assert (=> b!194541 m!221143))

(assert (=> b!194543 m!221141))

(assert (=> b!194543 m!221141))

(assert (=> b!194543 m!221143))

(assert (=> d!56639 d!56759))

(declare-fun d!56761 () Bool)

(assert (=> d!56761 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7731 () Bool)

(assert (= bs!7731 d!56761))

(assert (=> bs!7731 m!220439))

(declare-fun m!221145 () Bool)

(assert (=> bs!7731 m!221145))

(assert (=> b!194089 d!56761))

(declare-fun b!194546 () Bool)

(declare-fun e!127964 () Option!249)

(assert (=> b!194546 (= e!127964 (getValueByKey!243 (t!7343 (toList!1225 lt!96610)) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56763 () Bool)

(declare-fun c!35140 () Bool)

(assert (=> d!56763 (= c!35140 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (= (_1!1766 (h!3063 (toList!1225 lt!96610))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun e!127963 () Option!249)

(assert (=> d!56763 (= (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) e!127963)))

(declare-fun b!194544 () Bool)

(assert (=> b!194544 (= e!127963 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96610)))))))

(declare-fun b!194545 () Bool)

(assert (=> b!194545 (= e!127963 e!127964)))

(declare-fun c!35141 () Bool)

(assert (=> b!194545 (= c!35141 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96610))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!194547 () Bool)

(assert (=> b!194547 (= e!127964 None!247)))

(assert (= (and d!56763 c!35140) b!194544))

(assert (= (and d!56763 (not c!35140)) b!194545))

(assert (= (and b!194545 c!35141) b!194546))

(assert (= (and b!194545 (not c!35141)) b!194547))

(assert (=> b!194546 m!220231))

(declare-fun m!221147 () Bool)

(assert (=> b!194546 m!221147))

(assert (=> b!194089 d!56763))

(declare-fun b!194548 () Bool)

(declare-fun e!127967 () Bool)

(declare-fun e!127966 () Bool)

(assert (=> b!194548 (= e!127967 e!127966)))

(declare-fun c!35142 () Bool)

(assert (=> b!194548 (= c!35142 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194549 () Bool)

(declare-fun e!127965 () Bool)

(declare-fun call!19674 () Bool)

(assert (=> b!194549 (= e!127965 call!19674)))

(declare-fun b!194550 () Bool)

(assert (=> b!194550 (= e!127966 e!127965)))

(declare-fun lt!96947 () (_ BitVec 64))

(assert (=> b!194550 (= lt!96947 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!96948 () Unit!5819)

(assert (=> b!194550 (= lt!96948 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5952 lt!96455) lt!96947 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!194550 (arrayContainsKey!0 (_keys!5952 lt!96455) lt!96947 #b00000000000000000000000000000000)))

(declare-fun lt!96946 () Unit!5819)

(assert (=> b!194550 (= lt!96946 lt!96948)))

(declare-fun res!91899 () Bool)

(assert (=> b!194550 (= res!91899 (= (seekEntryOrOpen!0 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5952 lt!96455) (mask!9221 lt!96455)) (Found!695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194550 (=> (not res!91899) (not e!127965))))

(declare-fun b!194551 () Bool)

(assert (=> b!194551 (= e!127966 call!19674)))

(declare-fun bm!19671 () Bool)

(assert (=> bm!19671 (= call!19674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5952 lt!96455) (mask!9221 lt!96455)))))

(declare-fun d!56765 () Bool)

(declare-fun res!91898 () Bool)

(assert (=> d!56765 (=> res!91898 e!127967)))

(assert (=> d!56765 (= res!91898 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56765 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5952 lt!96455) (mask!9221 lt!96455)) e!127967)))

(assert (= (and d!56765 (not res!91898)) b!194548))

(assert (= (and b!194548 c!35142) b!194550))

(assert (= (and b!194548 (not c!35142)) b!194551))

(assert (= (and b!194550 res!91899) b!194549))

(assert (= (or b!194549 b!194551) bm!19671))

(declare-fun m!221149 () Bool)

(assert (=> b!194548 m!221149))

(assert (=> b!194548 m!221149))

(declare-fun m!221151 () Bool)

(assert (=> b!194548 m!221151))

(assert (=> b!194550 m!221149))

(declare-fun m!221153 () Bool)

(assert (=> b!194550 m!221153))

(declare-fun m!221155 () Bool)

(assert (=> b!194550 m!221155))

(assert (=> b!194550 m!221149))

(declare-fun m!221157 () Bool)

(assert (=> b!194550 m!221157))

(declare-fun m!221159 () Bool)

(assert (=> bm!19671 m!221159))

(assert (=> bm!19637 d!56765))

(declare-fun d!56767 () Bool)

(assert (=> d!56767 (= (get!2233 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4245 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194231 d!56767))

(declare-fun d!56769 () Bool)

(declare-fun lt!96949 () Bool)

(assert (=> d!56769 (= lt!96949 (select (content!155 (toList!1225 lt!96712)) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!127968 () Bool)

(assert (=> d!56769 (= lt!96949 e!127968)))

(declare-fun res!91901 () Bool)

(assert (=> d!56769 (=> (not res!91901) (not e!127968))))

(assert (=> d!56769 (= res!91901 ((_ is Cons!2422) (toList!1225 lt!96712)))))

(assert (=> d!56769 (= (contains!1359 (toList!1225 lt!96712) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!96949)))

(declare-fun b!194552 () Bool)

(declare-fun e!127969 () Bool)

(assert (=> b!194552 (= e!127968 e!127969)))

(declare-fun res!91900 () Bool)

(assert (=> b!194552 (=> res!91900 e!127969)))

(assert (=> b!194552 (= res!91900 (= (h!3063 (toList!1225 lt!96712)) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194553 () Bool)

(assert (=> b!194553 (= e!127969 (contains!1359 (t!7343 (toList!1225 lt!96712)) (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!56769 res!91901) b!194552))

(assert (= (and b!194552 (not res!91900)) b!194553))

(declare-fun m!221161 () Bool)

(assert (=> d!56769 m!221161))

(declare-fun m!221163 () Bool)

(assert (=> d!56769 m!221163))

(declare-fun m!221165 () Bool)

(assert (=> b!194553 m!221165))

(assert (=> b!194111 d!56769))

(declare-fun d!56771 () Bool)

(declare-fun e!127971 () Bool)

(assert (=> d!56771 e!127971))

(declare-fun res!91902 () Bool)

(assert (=> d!56771 (=> res!91902 e!127971)))

(declare-fun lt!96952 () Bool)

(assert (=> d!56771 (= res!91902 (not lt!96952))))

(declare-fun lt!96953 () Bool)

(assert (=> d!56771 (= lt!96952 lt!96953)))

(declare-fun lt!96951 () Unit!5819)

(declare-fun e!127970 () Unit!5819)

(assert (=> d!56771 (= lt!96951 e!127970)))

(declare-fun c!35143 () Bool)

(assert (=> d!56771 (= c!35143 lt!96953)))

(assert (=> d!56771 (= lt!96953 (containsKey!247 (toList!1225 lt!96777) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56771 (= (contains!1356 lt!96777 #b1000000000000000000000000000000000000000000000000000000000000000) lt!96952)))

(declare-fun b!194554 () Bool)

(declare-fun lt!96950 () Unit!5819)

(assert (=> b!194554 (= e!127970 lt!96950)))

(assert (=> b!194554 (= lt!96950 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96777) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194554 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96777) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194555 () Bool)

(declare-fun Unit!5849 () Unit!5819)

(assert (=> b!194555 (= e!127970 Unit!5849)))

(declare-fun b!194556 () Bool)

(assert (=> b!194556 (= e!127971 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56771 c!35143) b!194554))

(assert (= (and d!56771 (not c!35143)) b!194555))

(assert (= (and d!56771 (not res!91902)) b!194556))

(declare-fun m!221167 () Bool)

(assert (=> d!56771 m!221167))

(declare-fun m!221169 () Bool)

(assert (=> b!194554 m!221169))

(declare-fun m!221171 () Bool)

(assert (=> b!194554 m!221171))

(assert (=> b!194554 m!221171))

(declare-fun m!221173 () Bool)

(assert (=> b!194554 m!221173))

(assert (=> b!194556 m!221171))

(assert (=> b!194556 m!221171))

(assert (=> b!194556 m!221173))

(assert (=> b!194270 d!56771))

(declare-fun d!56773 () Bool)

(assert (=> d!56773 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!96954 () Unit!5819)

(assert (=> d!56773 (= lt!96954 (choose!1075 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127972 () Bool)

(assert (=> d!56773 e!127972))

(declare-fun res!91903 () Bool)

(assert (=> d!56773 (=> (not res!91903) (not e!127972))))

(assert (=> d!56773 (= res!91903 (isStrictlySorted!352 (toList!1225 lt!96632)))))

(assert (=> d!56773 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000) lt!96954)))

(declare-fun b!194557 () Bool)

(assert (=> b!194557 (= e!127972 (containsKey!247 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56773 res!91903) b!194557))

(assert (=> d!56773 m!220633))

(assert (=> d!56773 m!220633))

(assert (=> d!56773 m!220881))

(declare-fun m!221175 () Bool)

(assert (=> d!56773 m!221175))

(declare-fun m!221177 () Bool)

(assert (=> d!56773 m!221177))

(assert (=> b!194557 m!220877))

(assert (=> b!194372 d!56773))

(declare-fun d!56775 () Bool)

(assert (=> d!56775 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7732 () Bool)

(assert (= bs!7732 d!56775))

(assert (=> bs!7732 m!220633))

(declare-fun m!221179 () Bool)

(assert (=> bs!7732 m!221179))

(assert (=> b!194372 d!56775))

(declare-fun b!194560 () Bool)

(declare-fun e!127974 () Option!249)

(assert (=> b!194560 (= e!127974 (getValueByKey!243 (t!7343 (toList!1225 lt!96632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!56777 () Bool)

(declare-fun c!35144 () Bool)

(assert (=> d!56777 (= c!35144 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (= (_1!1766 (h!3063 (toList!1225 lt!96632))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!127973 () Option!249)

(assert (=> d!56777 (= (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000) e!127973)))

(declare-fun b!194558 () Bool)

(assert (=> b!194558 (= e!127973 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96632)))))))

(declare-fun b!194559 () Bool)

(assert (=> b!194559 (= e!127973 e!127974)))

(declare-fun c!35145 () Bool)

(assert (=> b!194559 (= c!35145 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96632))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194561 () Bool)

(assert (=> b!194561 (= e!127974 None!247)))

(assert (= (and d!56777 c!35144) b!194558))

(assert (= (and d!56777 (not c!35144)) b!194559))

(assert (= (and b!194559 c!35145) b!194560))

(assert (= (and b!194559 (not c!35145)) b!194561))

(declare-fun m!221181 () Bool)

(assert (=> b!194560 m!221181))

(assert (=> b!194372 d!56777))

(declare-fun d!56779 () Bool)

(declare-fun lt!96955 () Bool)

(assert (=> d!56779 (= lt!96955 (select (content!155 lt!96665) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun e!127975 () Bool)

(assert (=> d!56779 (= lt!96955 e!127975)))

(declare-fun res!91905 () Bool)

(assert (=> d!56779 (=> (not res!91905) (not e!127975))))

(assert (=> d!56779 (= res!91905 ((_ is Cons!2422) lt!96665))))

(assert (=> d!56779 (= (contains!1359 lt!96665 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))) lt!96955)))

(declare-fun b!194562 () Bool)

(declare-fun e!127976 () Bool)

(assert (=> b!194562 (= e!127975 e!127976)))

(declare-fun res!91904 () Bool)

(assert (=> b!194562 (=> res!91904 e!127976)))

(assert (=> b!194562 (= res!91904 (= (h!3063 lt!96665) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!194563 () Bool)

(assert (=> b!194563 (= e!127976 (contains!1359 (t!7343 lt!96665) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(assert (= (and d!56779 res!91905) b!194562))

(assert (= (and b!194562 (not res!91904)) b!194563))

(declare-fun m!221183 () Bool)

(assert (=> d!56779 m!221183))

(declare-fun m!221185 () Bool)

(assert (=> d!56779 m!221185))

(declare-fun m!221187 () Bool)

(assert (=> b!194563 m!221187))

(assert (=> b!194124 d!56779))

(assert (=> b!194271 d!56539))

(declare-fun d!56781 () Bool)

(declare-fun e!127978 () Bool)

(assert (=> d!56781 e!127978))

(declare-fun res!91906 () Bool)

(assert (=> d!56781 (=> res!91906 e!127978)))

(declare-fun lt!96958 () Bool)

(assert (=> d!56781 (= res!91906 (not lt!96958))))

(declare-fun lt!96959 () Bool)

(assert (=> d!56781 (= lt!96958 lt!96959)))

(declare-fun lt!96957 () Unit!5819)

(declare-fun e!127977 () Unit!5819)

(assert (=> d!56781 (= lt!96957 e!127977)))

(declare-fun c!35146 () Bool)

(assert (=> d!56781 (= c!35146 lt!96959)))

(assert (=> d!56781 (= lt!96959 (containsKey!247 (toList!1225 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56781 (= (contains!1356 lt!96817 #b0000000000000000000000000000000000000000000000000000000000000000) lt!96958)))

(declare-fun b!194564 () Bool)

(declare-fun lt!96956 () Unit!5819)

(assert (=> b!194564 (= e!127977 lt!96956)))

(assert (=> b!194564 (= lt!96956 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194564 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194565 () Bool)

(declare-fun Unit!5850 () Unit!5819)

(assert (=> b!194565 (= e!127977 Unit!5850)))

(declare-fun b!194566 () Bool)

(assert (=> b!194566 (= e!127978 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56781 c!35146) b!194564))

(assert (= (and d!56781 (not c!35146)) b!194565))

(assert (= (and d!56781 (not res!91906)) b!194566))

(declare-fun m!221189 () Bool)

(assert (=> d!56781 m!221189))

(declare-fun m!221191 () Bool)

(assert (=> b!194564 m!221191))

(declare-fun m!221193 () Bool)

(assert (=> b!194564 m!221193))

(assert (=> b!194564 m!221193))

(declare-fun m!221195 () Bool)

(assert (=> b!194564 m!221195))

(assert (=> b!194566 m!221193))

(assert (=> b!194566 m!221193))

(assert (=> b!194566 m!221195))

(assert (=> bm!19653 d!56781))

(declare-fun b!194569 () Bool)

(declare-fun e!127980 () Option!249)

(assert (=> b!194569 (= e!127980 (getValueByKey!243 (t!7343 (t!7343 (toList!1225 lt!96671))) (_1!1766 lt!96460)))))

(declare-fun d!56783 () Bool)

(declare-fun c!35147 () Bool)

(assert (=> d!56783 (= c!35147 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96671))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96671)))) (_1!1766 lt!96460))))))

(declare-fun e!127979 () Option!249)

(assert (=> d!56783 (= (getValueByKey!243 (t!7343 (toList!1225 lt!96671)) (_1!1766 lt!96460)) e!127979)))

(declare-fun b!194567 () Bool)

(assert (=> b!194567 (= e!127979 (Some!248 (_2!1766 (h!3063 (t!7343 (toList!1225 lt!96671))))))))

(declare-fun b!194568 () Bool)

(assert (=> b!194568 (= e!127979 e!127980)))

(declare-fun c!35148 () Bool)

(assert (=> b!194568 (= c!35148 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96671))) (not (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96671)))) (_1!1766 lt!96460)))))))

(declare-fun b!194570 () Bool)

(assert (=> b!194570 (= e!127980 None!247)))

(assert (= (and d!56783 c!35147) b!194567))

(assert (= (and d!56783 (not c!35147)) b!194568))

(assert (= (and b!194568 c!35148) b!194569))

(assert (= (and b!194568 (not c!35148)) b!194570))

(declare-fun m!221197 () Bool)

(assert (=> b!194569 m!221197))

(assert (=> b!194085 d!56783))

(declare-fun lt!96960 () Bool)

(declare-fun d!56785 () Bool)

(assert (=> d!56785 (= lt!96960 (select (content!155 (toList!1225 lt!96838)) (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))

(declare-fun e!127981 () Bool)

(assert (=> d!56785 (= lt!96960 e!127981)))

(declare-fun res!91908 () Bool)

(assert (=> d!56785 (=> (not res!91908) (not e!127981))))

(assert (=> d!56785 (= res!91908 ((_ is Cons!2422) (toList!1225 lt!96838)))))

(assert (=> d!56785 (= (contains!1359 (toList!1225 lt!96838) (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) lt!96960)))

(declare-fun b!194571 () Bool)

(declare-fun e!127982 () Bool)

(assert (=> b!194571 (= e!127981 e!127982)))

(declare-fun res!91907 () Bool)

(assert (=> b!194571 (=> res!91907 e!127982)))

(assert (=> b!194571 (= res!91907 (= (h!3063 (toList!1225 lt!96838)) (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))

(declare-fun b!194572 () Bool)

(assert (=> b!194572 (= e!127982 (contains!1359 (t!7343 (toList!1225 lt!96838)) (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56785 res!91908) b!194571))

(assert (= (and b!194571 (not res!91907)) b!194572))

(declare-fun m!221199 () Bool)

(assert (=> d!56785 m!221199))

(declare-fun m!221201 () Bool)

(assert (=> d!56785 m!221201))

(declare-fun m!221203 () Bool)

(assert (=> b!194572 m!221203))

(assert (=> b!194351 d!56785))

(assert (=> b!194256 d!56603))

(declare-fun lt!96961 () Bool)

(declare-fun d!56787 () Bool)

(assert (=> d!56787 (= lt!96961 (select (content!155 (toList!1225 lt!96904)) (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))

(declare-fun e!127983 () Bool)

(assert (=> d!56787 (= lt!96961 e!127983)))

(declare-fun res!91910 () Bool)

(assert (=> d!56787 (=> (not res!91910) (not e!127983))))

(assert (=> d!56787 (= res!91910 ((_ is Cons!2422) (toList!1225 lt!96904)))))

(assert (=> d!56787 (= (contains!1359 (toList!1225 lt!96904) (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) lt!96961)))

(declare-fun b!194573 () Bool)

(declare-fun e!127984 () Bool)

(assert (=> b!194573 (= e!127983 e!127984)))

(declare-fun res!91909 () Bool)

(assert (=> b!194573 (=> res!91909 e!127984)))

(assert (=> b!194573 (= res!91909 (= (h!3063 (toList!1225 lt!96904)) (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))

(declare-fun b!194574 () Bool)

(assert (=> b!194574 (= e!127984 (contains!1359 (t!7343 (toList!1225 lt!96904)) (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56787 res!91910) b!194573))

(assert (= (and b!194573 (not res!91909)) b!194574))

(declare-fun m!221205 () Bool)

(assert (=> d!56787 m!221205))

(declare-fun m!221207 () Bool)

(assert (=> d!56787 m!221207))

(declare-fun m!221209 () Bool)

(assert (=> b!194574 m!221209))

(assert (=> b!194471 d!56787))

(declare-fun d!56789 () Bool)

(declare-fun res!91911 () Bool)

(declare-fun e!127985 () Bool)

(assert (=> d!56789 (=> res!91911 e!127985)))

(assert (=> d!56789 (= res!91911 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96454))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96454)))) key!828)))))

(assert (=> d!56789 (= (containsKey!247 (t!7343 (toList!1225 lt!96454)) key!828) e!127985)))

(declare-fun b!194575 () Bool)

(declare-fun e!127986 () Bool)

(assert (=> b!194575 (= e!127985 e!127986)))

(declare-fun res!91912 () Bool)

(assert (=> b!194575 (=> (not res!91912) (not e!127986))))

(assert (=> b!194575 (= res!91912 (and (or (not ((_ is Cons!2422) (t!7343 (toList!1225 lt!96454)))) (bvsle (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96454)))) key!828)) ((_ is Cons!2422) (t!7343 (toList!1225 lt!96454))) (bvslt (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96454)))) key!828)))))

(declare-fun b!194576 () Bool)

(assert (=> b!194576 (= e!127986 (containsKey!247 (t!7343 (t!7343 (toList!1225 lt!96454))) key!828))))

(assert (= (and d!56789 (not res!91911)) b!194575))

(assert (= (and b!194575 res!91912) b!194576))

(declare-fun m!221211 () Bool)

(assert (=> b!194576 m!221211))

(assert (=> b!194341 d!56789))

(assert (=> b!194464 d!56611))

(assert (=> d!56721 d!56595))

(assert (=> d!56721 d!56497))

(assert (=> d!56721 d!56597))

(declare-fun d!56791 () Bool)

(assert (=> d!56791 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7733 () Bool)

(assert (= bs!7733 d!56791))

(assert (=> bs!7733 m!220541))

(declare-fun m!221213 () Bool)

(assert (=> bs!7733 m!221213))

(assert (=> b!194413 d!56791))

(declare-fun b!194579 () Bool)

(declare-fun e!127988 () Option!249)

(assert (=> b!194579 (= e!127988 (getValueByKey!243 (t!7343 (toList!1225 lt!96632)) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56793 () Bool)

(declare-fun c!35149 () Bool)

(assert (=> d!56793 (= c!35149 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (= (_1!1766 (h!3063 (toList!1225 lt!96632))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun e!127987 () Option!249)

(assert (=> d!56793 (= (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) e!127987)))

(declare-fun b!194577 () Bool)

(assert (=> b!194577 (= e!127987 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96632)))))))

(declare-fun b!194578 () Bool)

(assert (=> b!194578 (= e!127987 e!127988)))

(declare-fun c!35150 () Bool)

(assert (=> b!194578 (= c!35150 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96632))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!194580 () Bool)

(assert (=> b!194580 (= e!127988 None!247)))

(assert (= (and d!56793 c!35149) b!194577))

(assert (= (and d!56793 (not c!35149)) b!194578))

(assert (= (and b!194578 c!35150) b!194579))

(assert (= (and b!194578 (not c!35150)) b!194580))

(assert (=> b!194579 m!220231))

(declare-fun m!221215 () Bool)

(assert (=> b!194579 m!221215))

(assert (=> b!194413 d!56793))

(declare-fun d!56795 () Bool)

(declare-fun res!91913 () Bool)

(declare-fun e!127989 () Bool)

(assert (=> d!56795 (=> res!91913 e!127989)))

(assert (=> d!56795 (= res!91913 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (= (_1!1766 (h!3063 (toList!1225 lt!96632))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56795 (= (containsKey!247 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000) e!127989)))

(declare-fun b!194581 () Bool)

(declare-fun e!127990 () Bool)

(assert (=> b!194581 (= e!127989 e!127990)))

(declare-fun res!91914 () Bool)

(assert (=> b!194581 (=> (not res!91914) (not e!127990))))

(assert (=> b!194581 (= res!91914 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96632))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96632))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2422) (toList!1225 lt!96632)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96632))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194582 () Bool)

(assert (=> b!194582 (= e!127990 (containsKey!247 (t!7343 (toList!1225 lt!96632)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56795 (not res!91913)) b!194581))

(assert (= (and b!194581 res!91914) b!194582))

(declare-fun m!221217 () Bool)

(assert (=> b!194582 m!221217))

(assert (=> d!56649 d!56795))

(declare-fun d!56797 () Bool)

(declare-fun e!127992 () Bool)

(assert (=> d!56797 e!127992))

(declare-fun res!91915 () Bool)

(assert (=> d!56797 (=> res!91915 e!127992)))

(declare-fun lt!96964 () Bool)

(assert (=> d!56797 (= res!91915 (not lt!96964))))

(declare-fun lt!96965 () Bool)

(assert (=> d!56797 (= lt!96964 lt!96965)))

(declare-fun lt!96963 () Unit!5819)

(declare-fun e!127991 () Unit!5819)

(assert (=> d!56797 (= lt!96963 e!127991)))

(declare-fun c!35151 () Bool)

(assert (=> d!56797 (= c!35151 lt!96965)))

(assert (=> d!56797 (= lt!96965 (containsKey!247 (toList!1225 lt!96854) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(assert (=> d!56797 (= (contains!1356 lt!96854 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96964)))

(declare-fun b!194583 () Bool)

(declare-fun lt!96962 () Unit!5819)

(assert (=> b!194583 (= e!127991 lt!96962)))

(assert (=> b!194583 (= lt!96962 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96854) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(assert (=> b!194583 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96854) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun b!194584 () Bool)

(declare-fun Unit!5851 () Unit!5819)

(assert (=> b!194584 (= e!127991 Unit!5851)))

(declare-fun b!194585 () Bool)

(assert (=> b!194585 (= e!127992 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96854) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(assert (= (and d!56797 c!35151) b!194583))

(assert (= (and d!56797 (not c!35151)) b!194584))

(assert (= (and d!56797 (not res!91915)) b!194585))

(declare-fun m!221219 () Bool)

(assert (=> d!56797 m!221219))

(declare-fun m!221221 () Bool)

(assert (=> b!194583 m!221221))

(assert (=> b!194583 m!220853))

(assert (=> b!194583 m!220853))

(declare-fun m!221223 () Bool)

(assert (=> b!194583 m!221223))

(assert (=> b!194585 m!220853))

(assert (=> b!194585 m!220853))

(assert (=> b!194585 m!221223))

(assert (=> d!56641 d!56797))

(declare-fun e!127994 () Option!249)

(declare-fun b!194588 () Bool)

(assert (=> b!194588 (= e!127994 (getValueByKey!243 (t!7343 lt!96856) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun c!35152 () Bool)

(declare-fun d!56799 () Bool)

(assert (=> d!56799 (= c!35152 (and ((_ is Cons!2422) lt!96856) (= (_1!1766 (h!3063 lt!96856)) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(declare-fun e!127993 () Option!249)

(assert (=> d!56799 (= (getValueByKey!243 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) e!127993)))

(declare-fun b!194586 () Bool)

(assert (=> b!194586 (= e!127993 (Some!248 (_2!1766 (h!3063 lt!96856))))))

(declare-fun b!194587 () Bool)

(assert (=> b!194587 (= e!127993 e!127994)))

(declare-fun c!35153 () Bool)

(assert (=> b!194587 (= c!35153 (and ((_ is Cons!2422) lt!96856) (not (= (_1!1766 (h!3063 lt!96856)) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194589 () Bool)

(assert (=> b!194589 (= e!127994 None!247)))

(assert (= (and d!56799 c!35152) b!194586))

(assert (= (and d!56799 (not c!35152)) b!194587))

(assert (= (and b!194587 c!35153) b!194588))

(assert (= (and b!194587 (not c!35153)) b!194589))

(declare-fun m!221225 () Bool)

(assert (=> b!194588 m!221225))

(assert (=> d!56641 d!56799))

(declare-fun d!56801 () Bool)

(assert (=> d!56801 (= (getValueByKey!243 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96966 () Unit!5819)

(assert (=> d!56801 (= lt!96966 (choose!1074 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun e!127995 () Bool)

(assert (=> d!56801 e!127995))

(declare-fun res!91916 () Bool)

(assert (=> d!56801 (=> (not res!91916) (not e!127995))))

(assert (=> d!56801 (= res!91916 (isStrictlySorted!352 lt!96856))))

(assert (=> d!56801 (= (lemmaContainsTupThenGetReturnValue!133 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96966)))

(declare-fun b!194590 () Bool)

(declare-fun res!91917 () Bool)

(assert (=> b!194590 (=> (not res!91917) (not e!127995))))

(assert (=> b!194590 (= res!91917 (containsKey!247 lt!96856 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun b!194591 () Bool)

(assert (=> b!194591 (= e!127995 (contains!1359 lt!96856 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(assert (= (and d!56801 res!91916) b!194590))

(assert (= (and b!194590 res!91917) b!194591))

(assert (=> d!56801 m!220847))

(declare-fun m!221227 () Bool)

(assert (=> d!56801 m!221227))

(declare-fun m!221229 () Bool)

(assert (=> d!56801 m!221229))

(declare-fun m!221231 () Bool)

(assert (=> b!194590 m!221231))

(declare-fun m!221233 () Bool)

(assert (=> b!194591 m!221233))

(assert (=> d!56641 d!56801))

(declare-fun d!56803 () Bool)

(declare-fun e!127997 () Bool)

(assert (=> d!56803 e!127997))

(declare-fun res!91919 () Bool)

(assert (=> d!56803 (=> (not res!91919) (not e!127997))))

(declare-fun lt!96967 () List!2426)

(assert (=> d!56803 (= res!91919 (isStrictlySorted!352 lt!96967))))

(declare-fun e!127998 () List!2426)

(assert (=> d!56803 (= lt!96967 e!127998)))

(declare-fun c!35154 () Bool)

(assert (=> d!56803 (= c!35154 (and ((_ is Cons!2422) (toList!1225 lt!96633)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96633))) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(assert (=> d!56803 (isStrictlySorted!352 (toList!1225 lt!96633))))

(assert (=> d!56803 (= (insertStrictlySorted!136 (toList!1225 lt!96633) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96967)))

(declare-fun bm!19672 () Bool)

(declare-fun call!19676 () List!2426)

(declare-fun call!19677 () List!2426)

(assert (=> bm!19672 (= call!19676 call!19677)))

(declare-fun e!127999 () List!2426)

(declare-fun b!194592 () Bool)

(assert (=> b!194592 (= e!127999 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96633)) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun b!194593 () Bool)

(assert (=> b!194593 (= e!127997 (contains!1359 lt!96967 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(declare-fun b!194594 () Bool)

(declare-fun e!127996 () List!2426)

(assert (=> b!194594 (= e!127998 e!127996)))

(declare-fun c!35156 () Bool)

(assert (=> b!194594 (= c!35156 (and ((_ is Cons!2422) (toList!1225 lt!96633)) (= (_1!1766 (h!3063 (toList!1225 lt!96633))) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(declare-fun b!194595 () Bool)

(declare-fun res!91918 () Bool)

(assert (=> b!194595 (=> (not res!91918) (not e!127997))))

(assert (=> b!194595 (= res!91918 (containsKey!247 lt!96967 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun b!194596 () Bool)

(assert (=> b!194596 (= e!127998 call!19677)))

(declare-fun b!194597 () Bool)

(declare-fun e!128000 () List!2426)

(declare-fun call!19675 () List!2426)

(assert (=> b!194597 (= e!128000 call!19675)))

(declare-fun b!194598 () Bool)

(assert (=> b!194598 (= e!128000 call!19675)))

(declare-fun b!194599 () Bool)

(declare-fun c!35157 () Bool)

(assert (=> b!194599 (= e!127999 (ite c!35156 (t!7343 (toList!1225 lt!96633)) (ite c!35157 (Cons!2422 (h!3063 (toList!1225 lt!96633)) (t!7343 (toList!1225 lt!96633))) Nil!2423)))))

(declare-fun b!194600 () Bool)

(assert (=> b!194600 (= e!127996 call!19676)))

(declare-fun bm!19673 () Bool)

(assert (=> bm!19673 (= call!19677 ($colon$colon!102 e!127999 (ite c!35154 (h!3063 (toList!1225 lt!96633)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35155 () Bool)

(assert (=> bm!19673 (= c!35155 c!35154)))

(declare-fun b!194601 () Bool)

(assert (=> b!194601 (= c!35157 (and ((_ is Cons!2422) (toList!1225 lt!96633)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96633))) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(assert (=> b!194601 (= e!127996 e!128000)))

(declare-fun bm!19674 () Bool)

(assert (=> bm!19674 (= call!19675 call!19676)))

(assert (= (and d!56803 c!35154) b!194596))

(assert (= (and d!56803 (not c!35154)) b!194594))

(assert (= (and b!194594 c!35156) b!194600))

(assert (= (and b!194594 (not c!35156)) b!194601))

(assert (= (and b!194601 c!35157) b!194597))

(assert (= (and b!194601 (not c!35157)) b!194598))

(assert (= (or b!194597 b!194598) bm!19674))

(assert (= (or b!194600 bm!19674) bm!19672))

(assert (= (or b!194596 bm!19672) bm!19673))

(assert (= (and bm!19673 c!35155) b!194592))

(assert (= (and bm!19673 (not c!35155)) b!194599))

(assert (= (and d!56803 res!91919) b!194595))

(assert (= (and b!194595 res!91918) b!194593))

(declare-fun m!221235 () Bool)

(assert (=> d!56803 m!221235))

(declare-fun m!221237 () Bool)

(assert (=> d!56803 m!221237))

(declare-fun m!221239 () Bool)

(assert (=> b!194595 m!221239))

(declare-fun m!221241 () Bool)

(assert (=> b!194592 m!221241))

(declare-fun m!221243 () Bool)

(assert (=> b!194593 m!221243))

(declare-fun m!221245 () Bool)

(assert (=> bm!19673 m!221245))

(assert (=> d!56641 d!56803))

(declare-fun d!56805 () Bool)

(assert (=> d!56805 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))) (v!4250 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56563 d!56805))

(assert (=> d!56563 d!56793))

(declare-fun e!128002 () Option!249)

(declare-fun b!194604 () Bool)

(assert (=> b!194604 (= e!128002 (getValueByKey!243 (t!7343 (toList!1225 lt!96909)) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun c!35158 () Bool)

(declare-fun d!56807 () Bool)

(assert (=> d!56807 (= c!35158 (and ((_ is Cons!2422) (toList!1225 lt!96909)) (= (_1!1766 (h!3063 (toList!1225 lt!96909))) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(declare-fun e!128001 () Option!249)

(assert (=> d!56807 (= (getValueByKey!243 (toList!1225 lt!96909) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) e!128001)))

(declare-fun b!194602 () Bool)

(assert (=> b!194602 (= e!128001 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96909)))))))

(declare-fun b!194603 () Bool)

(assert (=> b!194603 (= e!128001 e!128002)))

(declare-fun c!35159 () Bool)

(assert (=> b!194603 (= c!35159 (and ((_ is Cons!2422) (toList!1225 lt!96909)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96909))) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194605 () Bool)

(assert (=> b!194605 (= e!128002 None!247)))

(assert (= (and d!56807 c!35158) b!194602))

(assert (= (and d!56807 (not c!35158)) b!194603))

(assert (= (and b!194603 c!35159) b!194604))

(assert (= (and b!194603 (not c!35159)) b!194605))

(declare-fun m!221247 () Bool)

(assert (=> b!194604 m!221247))

(assert (=> b!194473 d!56807))

(declare-fun d!56809 () Bool)

(assert (=> d!56809 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460)))))

(declare-fun lt!96968 () Unit!5819)

(assert (=> d!56809 (= lt!96968 (choose!1075 (toList!1225 lt!96671) (_1!1766 lt!96460)))))

(declare-fun e!128003 () Bool)

(assert (=> d!56809 e!128003))

(declare-fun res!91920 () Bool)

(assert (=> d!56809 (=> (not res!91920) (not e!128003))))

(assert (=> d!56809 (= res!91920 (isStrictlySorted!352 (toList!1225 lt!96671)))))

(assert (=> d!56809 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96671) (_1!1766 lt!96460)) lt!96968)))

(declare-fun b!194606 () Bool)

(assert (=> b!194606 (= e!128003 (containsKey!247 (toList!1225 lt!96671) (_1!1766 lt!96460)))))

(assert (= (and d!56809 res!91920) b!194606))

(assert (=> d!56809 m!220389))

(assert (=> d!56809 m!220389))

(assert (=> d!56809 m!220553))

(declare-fun m!221249 () Bool)

(assert (=> d!56809 m!221249))

(declare-fun m!221251 () Bool)

(assert (=> d!56809 m!221251))

(assert (=> b!194606 m!220549))

(assert (=> b!194233 d!56809))

(declare-fun d!56811 () Bool)

(assert (=> d!56811 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460))) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96671) (_1!1766 lt!96460)))))))

(declare-fun bs!7734 () Bool)

(assert (= bs!7734 d!56811))

(assert (=> bs!7734 m!220389))

(declare-fun m!221253 () Bool)

(assert (=> bs!7734 m!221253))

(assert (=> b!194233 d!56811))

(assert (=> b!194233 d!56535))

(declare-fun d!56813 () Bool)

(declare-fun res!91921 () Bool)

(declare-fun e!128004 () Bool)

(assert (=> d!56813 (=> res!91921 e!128004)))

(assert (=> d!56813 (= res!91921 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96451))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96451)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(assert (=> d!56813 (= (containsKey!247 (t!7343 (toList!1225 lt!96451)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) e!128004)))

(declare-fun b!194607 () Bool)

(declare-fun e!128005 () Bool)

(assert (=> b!194607 (= e!128004 e!128005)))

(declare-fun res!91922 () Bool)

(assert (=> b!194607 (=> (not res!91922) (not e!128005))))

(assert (=> b!194607 (= res!91922 (and (or (not ((_ is Cons!2422) (t!7343 (toList!1225 lt!96451)))) (bvsle (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96451)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))) ((_ is Cons!2422) (t!7343 (toList!1225 lt!96451))) (bvslt (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96451)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(declare-fun b!194608 () Bool)

(assert (=> b!194608 (= e!128005 (containsKey!247 (t!7343 (t!7343 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (= (and d!56813 (not res!91921)) b!194607))

(assert (= (and b!194607 res!91922) b!194608))

(assert (=> b!194608 m!220093))

(declare-fun m!221255 () Bool)

(assert (=> b!194608 m!221255))

(assert (=> b!194376 d!56813))

(declare-fun b!194611 () Bool)

(declare-fun e!128007 () Option!249)

(assert (=> b!194611 (= e!128007 (getValueByKey!243 (t!7343 (toList!1225 lt!96712)) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun d!56815 () Bool)

(declare-fun c!35160 () Bool)

(assert (=> d!56815 (= c!35160 (and ((_ is Cons!2422) (toList!1225 lt!96712)) (= (_1!1766 (h!3063 (toList!1225 lt!96712))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun e!128006 () Option!249)

(assert (=> d!56815 (= (getValueByKey!243 (toList!1225 lt!96712) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128006)))

(declare-fun b!194609 () Bool)

(assert (=> b!194609 (= e!128006 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96712)))))))

(declare-fun b!194610 () Bool)

(assert (=> b!194610 (= e!128006 e!128007)))

(declare-fun c!35161 () Bool)

(assert (=> b!194610 (= c!35161 (and ((_ is Cons!2422) (toList!1225 lt!96712)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96712))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194612 () Bool)

(assert (=> b!194612 (= e!128007 None!247)))

(assert (= (and d!56815 c!35160) b!194609))

(assert (= (and d!56815 (not c!35160)) b!194610))

(assert (= (and b!194610 c!35161) b!194611))

(assert (= (and b!194610 (not c!35161)) b!194612))

(declare-fun m!221257 () Bool)

(assert (=> b!194611 m!221257))

(assert (=> b!194110 d!56815))

(declare-fun d!56817 () Bool)

(declare-fun res!91923 () Bool)

(declare-fun e!128008 () Bool)

(assert (=> d!56817 (=> res!91923 e!128008)))

(assert (=> d!56817 (= res!91923 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) key!828)))))

(assert (=> d!56817 (= (containsKey!247 (t!7343 (toList!1225 lt!96453)) key!828) e!128008)))

(declare-fun b!194613 () Bool)

(declare-fun e!128009 () Bool)

(assert (=> b!194613 (= e!128008 e!128009)))

(declare-fun res!91924 () Bool)

(assert (=> b!194613 (=> (not res!91924) (not e!128009))))

(assert (=> b!194613 (= res!91924 (and (or (not ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453)))) (bvsle (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) key!828)) ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (bvslt (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) key!828)))))

(declare-fun b!194614 () Bool)

(assert (=> b!194614 (= e!128009 (containsKey!247 (t!7343 (t!7343 (toList!1225 lt!96453))) key!828))))

(assert (= (and d!56817 (not res!91923)) b!194613))

(assert (= (and b!194613 res!91924) b!194614))

(declare-fun m!221259 () Bool)

(assert (=> b!194614 m!221259))

(assert (=> b!194316 d!56817))

(declare-fun d!56819 () Bool)

(declare-fun lt!96969 () Bool)

(assert (=> d!56819 (= lt!96969 (select (content!155 (toList!1225 lt!96923)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun e!128010 () Bool)

(assert (=> d!56819 (= lt!96969 e!128010)))

(declare-fun res!91926 () Bool)

(assert (=> d!56819 (=> (not res!91926) (not e!128010))))

(assert (=> d!56819 (= res!91926 ((_ is Cons!2422) (toList!1225 lt!96923)))))

(assert (=> d!56819 (= (contains!1359 (toList!1225 lt!96923) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!96969)))

(declare-fun b!194615 () Bool)

(declare-fun e!128011 () Bool)

(assert (=> b!194615 (= e!128010 e!128011)))

(declare-fun res!91925 () Bool)

(assert (=> b!194615 (=> res!91925 e!128011)))

(assert (=> b!194615 (= res!91925 (= (h!3063 (toList!1225 lt!96923)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!194616 () Bool)

(assert (=> b!194616 (= e!128011 (contains!1359 (t!7343 (toList!1225 lt!96923)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!56819 res!91926) b!194615))

(assert (= (and b!194615 (not res!91925)) b!194616))

(declare-fun m!221261 () Bool)

(assert (=> d!56819 m!221261))

(declare-fun m!221263 () Bool)

(assert (=> d!56819 m!221263))

(declare-fun m!221265 () Bool)

(assert (=> b!194616 m!221265))

(assert (=> b!194482 d!56819))

(declare-fun d!56821 () Bool)

(declare-fun e!128013 () Bool)

(assert (=> d!56821 e!128013))

(declare-fun res!91927 () Bool)

(assert (=> d!56821 (=> res!91927 e!128013)))

(declare-fun lt!96972 () Bool)

(assert (=> d!56821 (= res!91927 (not lt!96972))))

(declare-fun lt!96973 () Bool)

(assert (=> d!56821 (= lt!96972 lt!96973)))

(declare-fun lt!96971 () Unit!5819)

(declare-fun e!128012 () Unit!5819)

(assert (=> d!56821 (= lt!96971 e!128012)))

(declare-fun c!35162 () Bool)

(assert (=> d!56821 (= c!35162 lt!96973)))

(assert (=> d!56821 (= lt!96973 (containsKey!247 (toList!1225 lt!96777) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56821 (= (contains!1356 lt!96777 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!96972)))

(declare-fun b!194617 () Bool)

(declare-fun lt!96970 () Unit!5819)

(assert (=> b!194617 (= e!128012 lt!96970)))

(assert (=> b!194617 (= lt!96970 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96777) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194617 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96777) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194618 () Bool)

(declare-fun Unit!5852 () Unit!5819)

(assert (=> b!194618 (= e!128012 Unit!5852)))

(declare-fun b!194619 () Bool)

(assert (=> b!194619 (= e!128013 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96777) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56821 c!35162) b!194617))

(assert (= (and d!56821 (not c!35162)) b!194618))

(assert (= (and d!56821 (not res!91927)) b!194619))

(assert (=> d!56821 m!220231))

(declare-fun m!221267 () Bool)

(assert (=> d!56821 m!221267))

(assert (=> b!194617 m!220231))

(declare-fun m!221269 () Bool)

(assert (=> b!194617 m!221269))

(assert (=> b!194617 m!220231))

(declare-fun m!221271 () Bool)

(assert (=> b!194617 m!221271))

(assert (=> b!194617 m!221271))

(declare-fun m!221273 () Bool)

(assert (=> b!194617 m!221273))

(assert (=> b!194619 m!220231))

(assert (=> b!194619 m!221271))

(assert (=> b!194619 m!221271))

(assert (=> b!194619 m!221273))

(assert (=> b!194269 d!56821))

(declare-fun b!194622 () Bool)

(declare-fun e!128015 () Option!249)

(assert (=> b!194622 (= e!128015 (getValueByKey!243 (t!7343 (toList!1225 lt!96854)) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))

(declare-fun d!56823 () Bool)

(declare-fun c!35163 () Bool)

(assert (=> d!56823 (= c!35163 (and ((_ is Cons!2422) (toList!1225 lt!96854)) (= (_1!1766 (h!3063 (toList!1225 lt!96854))) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))

(declare-fun e!128014 () Option!249)

(assert (=> d!56823 (= (getValueByKey!243 (toList!1225 lt!96854) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) e!128014)))

(declare-fun b!194620 () Bool)

(assert (=> b!194620 (= e!128014 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96854)))))))

(declare-fun b!194621 () Bool)

(assert (=> b!194621 (= e!128014 e!128015)))

(declare-fun c!35164 () Bool)

(assert (=> b!194621 (= c!35164 (and ((_ is Cons!2422) (toList!1225 lt!96854)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96854))) (_1!1766 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194623 () Bool)

(assert (=> b!194623 (= e!128015 None!247)))

(assert (= (and d!56823 c!35163) b!194620))

(assert (= (and d!56823 (not c!35163)) b!194621))

(assert (= (and b!194621 c!35164) b!194622))

(assert (= (and b!194621 (not c!35164)) b!194623))

(declare-fun m!221275 () Bool)

(assert (=> b!194622 m!221275))

(assert (=> b!194362 d!56823))

(declare-fun d!56825 () Bool)

(declare-fun e!128016 () Bool)

(assert (=> d!56825 e!128016))

(declare-fun res!91928 () Bool)

(assert (=> d!56825 (=> (not res!91928) (not e!128016))))

(declare-fun lt!96974 () ListLongMap!2419)

(assert (=> d!56825 (= res!91928 (contains!1356 lt!96974 (_1!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))))

(declare-fun lt!96976 () List!2426)

(assert (=> d!56825 (= lt!96974 (ListLongMap!2420 lt!96976))))

(declare-fun lt!96977 () Unit!5819)

(declare-fun lt!96975 () Unit!5819)

(assert (=> d!56825 (= lt!96977 lt!96975)))

(assert (=> d!56825 (= (getValueByKey!243 lt!96976 (_1!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))) (Some!248 (_2!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))))

(assert (=> d!56825 (= lt!96975 (lemmaContainsTupThenGetReturnValue!133 lt!96976 (_1!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))) (_2!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))))

(assert (=> d!56825 (= lt!96976 (insertStrictlySorted!136 (toList!1225 (ite c!35090 call!19658 (ite c!35085 call!19655 call!19653))) (_1!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))) (_2!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))))

(assert (=> d!56825 (= (+!317 (ite c!35090 call!19658 (ite c!35085 call!19655 call!19653)) (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))) lt!96974)))

(declare-fun b!194624 () Bool)

(declare-fun res!91929 () Bool)

(assert (=> b!194624 (=> (not res!91929) (not e!128016))))

(assert (=> b!194624 (= res!91929 (= (getValueByKey!243 (toList!1225 lt!96974) (_1!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))) (Some!248 (_2!1766 (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))))

(declare-fun b!194625 () Bool)

(assert (=> b!194625 (= e!128016 (contains!1359 (toList!1225 lt!96974) (ite (or c!35090 c!35085) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 lt!96455)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))

(assert (= (and d!56825 res!91928) b!194624))

(assert (= (and b!194624 res!91929) b!194625))

(declare-fun m!221277 () Bool)

(assert (=> d!56825 m!221277))

(declare-fun m!221279 () Bool)

(assert (=> d!56825 m!221279))

(declare-fun m!221281 () Bool)

(assert (=> d!56825 m!221281))

(declare-fun m!221283 () Bool)

(assert (=> d!56825 m!221283))

(declare-fun m!221285 () Bool)

(assert (=> b!194624 m!221285))

(declare-fun m!221287 () Bool)

(assert (=> b!194625 m!221287))

(assert (=> bm!19652 d!56825))

(declare-fun d!56827 () Bool)

(assert (=> d!56827 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460))) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460)))))))

(declare-fun bs!7735 () Bool)

(assert (= bs!7735 d!56827))

(assert (=> bs!7735 m!220361))

(declare-fun m!221289 () Bool)

(assert (=> bs!7735 m!221289))

(assert (=> b!194114 d!56827))

(assert (=> b!194114 d!56587))

(declare-fun d!56829 () Bool)

(assert (=> d!56829 (= (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96630)) (v!4250 (getValueByKey!243 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96630)))))

(assert (=> d!56635 d!56829))

(declare-fun b!194628 () Bool)

(declare-fun e!128018 () Option!249)

(assert (=> b!194628 (= e!128018 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))) lt!96630))))

(declare-fun c!35165 () Bool)

(declare-fun d!56831 () Bool)

(assert (=> d!56831 (= c!35165 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))) lt!96630)))))

(declare-fun e!128017 () Option!249)

(assert (=> d!56831 (= (getValueByKey!243 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))) lt!96630) e!128017)))

(declare-fun b!194626 () Bool)

(assert (=> b!194626 (= e!128017 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194627 () Bool)

(assert (=> b!194627 (= e!128017 e!128018)))

(declare-fun c!35166 () Bool)

(assert (=> b!194627 (= c!35166 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248)))))) lt!96630))))))

(declare-fun b!194629 () Bool)

(assert (=> b!194629 (= e!128018 None!247)))

(assert (= (and d!56831 c!35165) b!194626))

(assert (= (and d!56831 (not c!35165)) b!194627))

(assert (= (and b!194627 c!35166) b!194628))

(assert (= (and b!194627 (not c!35166)) b!194629))

(declare-fun m!221291 () Bool)

(assert (=> b!194628 m!221291))

(assert (=> d!56635 d!56831))

(declare-fun b!194630 () Bool)

(declare-fun e!128022 () Bool)

(assert (=> b!194630 (= e!128022 (contains!1360 (ite c!35120 (Cons!2425 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) Nil!2426) Nil!2426) (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194631 () Bool)

(declare-fun e!128019 () Bool)

(declare-fun e!128020 () Bool)

(assert (=> b!194631 (= e!128019 e!128020)))

(declare-fun c!35167 () Bool)

(assert (=> b!194631 (= c!35167 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!19678 () Bool)

(declare-fun bm!19675 () Bool)

(assert (=> bm!19675 (= call!19678 (arrayNoDuplicates!0 (_keys!5952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!35167 (Cons!2425 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!35120 (Cons!2425 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)) (ite c!35120 (Cons!2425 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) Nil!2426) Nil!2426))))))

(declare-fun b!194632 () Bool)

(assert (=> b!194632 (= e!128020 call!19678)))

(declare-fun b!194633 () Bool)

(assert (=> b!194633 (= e!128020 call!19678)))

(declare-fun b!194634 () Bool)

(declare-fun e!128021 () Bool)

(assert (=> b!194634 (= e!128021 e!128019)))

(declare-fun res!91931 () Bool)

(assert (=> b!194634 (=> (not res!91931) (not e!128019))))

(assert (=> b!194634 (= res!91931 (not e!128022))))

(declare-fun res!91930 () Bool)

(assert (=> b!194634 (=> (not res!91930) (not e!128022))))

(assert (=> b!194634 (= res!91930 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!56833 () Bool)

(declare-fun res!91932 () Bool)

(assert (=> d!56833 (=> res!91932 e!128021)))

(assert (=> d!56833 (= res!91932 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56833 (= (arrayNoDuplicates!0 (_keys!5952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35120 (Cons!2425 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)) e!128021)))

(assert (= (and d!56833 (not res!91932)) b!194634))

(assert (= (and b!194634 res!91930) b!194630))

(assert (= (and b!194634 res!91931) b!194631))

(assert (= (and b!194631 c!35167) b!194633))

(assert (= (and b!194631 (not c!35167)) b!194632))

(assert (= (or b!194633 b!194632) bm!19675))

(declare-fun m!221293 () Bool)

(assert (=> b!194630 m!221293))

(assert (=> b!194630 m!221293))

(declare-fun m!221295 () Bool)

(assert (=> b!194630 m!221295))

(assert (=> b!194631 m!221293))

(assert (=> b!194631 m!221293))

(declare-fun m!221297 () Bool)

(assert (=> b!194631 m!221297))

(assert (=> bm!19675 m!221293))

(declare-fun m!221299 () Bool)

(assert (=> bm!19675 m!221299))

(assert (=> b!194634 m!221293))

(assert (=> b!194634 m!221293))

(assert (=> b!194634 m!221297))

(assert (=> bm!19664 d!56833))

(assert (=> d!56693 d!56683))

(declare-fun d!56835 () Bool)

(declare-fun e!128024 () Bool)

(assert (=> d!56835 e!128024))

(declare-fun res!91933 () Bool)

(assert (=> d!56835 (=> res!91933 e!128024)))

(declare-fun lt!96980 () Bool)

(assert (=> d!56835 (= res!91933 (not lt!96980))))

(declare-fun lt!96981 () Bool)

(assert (=> d!56835 (= lt!96980 lt!96981)))

(declare-fun lt!96979 () Unit!5819)

(declare-fun e!128023 () Unit!5819)

(assert (=> d!56835 (= lt!96979 e!128023)))

(declare-fun c!35168 () Bool)

(assert (=> d!56835 (= c!35168 lt!96981)))

(assert (=> d!56835 (= lt!96981 (containsKey!247 (toList!1225 lt!96606) lt!96621))))

(assert (=> d!56835 (= (contains!1356 lt!96606 lt!96621) lt!96980)))

(declare-fun b!194635 () Bool)

(declare-fun lt!96978 () Unit!5819)

(assert (=> b!194635 (= e!128023 lt!96978)))

(assert (=> b!194635 (= lt!96978 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96606) lt!96621))))

(assert (=> b!194635 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96606) lt!96621))))

(declare-fun b!194636 () Bool)

(declare-fun Unit!5853 () Unit!5819)

(assert (=> b!194636 (= e!128023 Unit!5853)))

(declare-fun b!194637 () Bool)

(assert (=> b!194637 (= e!128024 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96606) lt!96621)))))

(assert (= (and d!56835 c!35168) b!194635))

(assert (= (and d!56835 (not c!35168)) b!194636))

(assert (= (and d!56835 (not res!91933)) b!194637))

(declare-fun m!221301 () Bool)

(assert (=> d!56835 m!221301))

(declare-fun m!221303 () Bool)

(assert (=> b!194635 m!221303))

(assert (=> b!194635 m!221031))

(assert (=> b!194635 m!221031))

(declare-fun m!221305 () Bool)

(assert (=> b!194635 m!221305))

(assert (=> b!194637 m!221031))

(assert (=> b!194637 m!221031))

(assert (=> b!194637 m!221305))

(assert (=> d!56693 d!56835))

(declare-fun d!56837 () Bool)

(assert (=> d!56837 (= (apply!188 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) lt!96621) (apply!188 lt!96606 lt!96621))))

(assert (=> d!56837 true))

(declare-fun _$34!1090 () Unit!5819)

(assert (=> d!56837 (= (choose!1076 lt!96606 lt!96609 (minValue!3800 thiss!1248) lt!96621) _$34!1090)))

(declare-fun bs!7736 () Bool)

(assert (= bs!7736 d!56837))

(assert (=> bs!7736 m!220261))

(assert (=> bs!7736 m!220261))

(assert (=> bs!7736 m!220273))

(assert (=> bs!7736 m!220269))

(assert (=> d!56693 d!56837))

(assert (=> d!56693 d!56701))

(assert (=> d!56693 d!56711))

(declare-fun d!56839 () Bool)

(declare-fun lt!96982 () Bool)

(assert (=> d!56839 (= lt!96982 (select (content!155 (toList!1225 lt!96854)) (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))

(declare-fun e!128025 () Bool)

(assert (=> d!56839 (= lt!96982 e!128025)))

(declare-fun res!91935 () Bool)

(assert (=> d!56839 (=> (not res!91935) (not e!128025))))

(assert (=> d!56839 (= res!91935 ((_ is Cons!2422) (toList!1225 lt!96854)))))

(assert (=> d!56839 (= (contains!1359 (toList!1225 lt!96854) (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) lt!96982)))

(declare-fun b!194639 () Bool)

(declare-fun e!128026 () Bool)

(assert (=> b!194639 (= e!128025 e!128026)))

(declare-fun res!91934 () Bool)

(assert (=> b!194639 (=> res!91934 e!128026)))

(assert (=> b!194639 (= res!91934 (= (h!3063 (toList!1225 lt!96854)) (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))

(declare-fun b!194640 () Bool)

(assert (=> b!194640 (= e!128026 (contains!1359 (t!7343 (toList!1225 lt!96854)) (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))))))

(assert (= (and d!56839 res!91935) b!194639))

(assert (= (and b!194639 (not res!91934)) b!194640))

(declare-fun m!221307 () Bool)

(assert (=> d!56839 m!221307))

(declare-fun m!221309 () Bool)

(assert (=> d!56839 m!221309))

(declare-fun m!221311 () Bool)

(assert (=> b!194640 m!221311))

(assert (=> b!194363 d!56839))

(declare-fun e!128028 () Option!249)

(declare-fun b!194643 () Bool)

(assert (=> b!194643 (= e!128028 (getValueByKey!243 (t!7343 (toList!1225 lt!96838)) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))

(declare-fun d!56841 () Bool)

(declare-fun c!35169 () Bool)

(assert (=> d!56841 (= c!35169 (and ((_ is Cons!2422) (toList!1225 lt!96838)) (= (_1!1766 (h!3063 (toList!1225 lt!96838))) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128027 () Option!249)

(assert (=> d!56841 (= (getValueByKey!243 (toList!1225 lt!96838) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) e!128027)))

(declare-fun b!194641 () Bool)

(assert (=> b!194641 (= e!128027 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96838)))))))

(declare-fun b!194642 () Bool)

(assert (=> b!194642 (= e!128027 e!128028)))

(declare-fun c!35170 () Bool)

(assert (=> b!194642 (= c!35170 (and ((_ is Cons!2422) (toList!1225 lt!96838)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96838))) (_1!1766 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194644 () Bool)

(assert (=> b!194644 (= e!128028 None!247)))

(assert (= (and d!56841 c!35169) b!194641))

(assert (= (and d!56841 (not c!35169)) b!194642))

(assert (= (and b!194642 c!35170) b!194643))

(assert (= (and b!194642 (not c!35170)) b!194644))

(declare-fun m!221313 () Bool)

(assert (=> b!194643 m!221313))

(assert (=> b!194350 d!56841))

(declare-fun d!56843 () Bool)

(declare-fun res!91936 () Bool)

(declare-fun e!128029 () Bool)

(assert (=> d!56843 (=> res!91936 e!128029)))

(assert (=> d!56843 (= res!91936 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (= (_1!1766 (h!3063 (toList!1225 lt!96610))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56843 (= (containsKey!247 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000) e!128029)))

(declare-fun b!194645 () Bool)

(declare-fun e!128030 () Bool)

(assert (=> b!194645 (= e!128029 e!128030)))

(declare-fun res!91937 () Bool)

(assert (=> b!194645 (=> (not res!91937) (not e!128030))))

(assert (=> b!194645 (= res!91937 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96610))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96610))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2422) (toList!1225 lt!96610)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96610))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194646 () Bool)

(assert (=> b!194646 (= e!128030 (containsKey!247 (t!7343 (toList!1225 lt!96610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!56843 (not res!91936)) b!194645))

(assert (= (and b!194645 res!91937) b!194646))

(declare-fun m!221315 () Bool)

(assert (=> b!194646 m!221315))

(assert (=> d!56657 d!56843))

(declare-fun d!56845 () Bool)

(declare-fun res!91938 () Bool)

(declare-fun e!128031 () Bool)

(assert (=> d!56845 (=> res!91938 e!128031)))

(assert (=> d!56845 (= res!91938 (and ((_ is Cons!2422) lt!96665) (= (_1!1766 (h!3063 lt!96665)) (_1!1766 lt!96460))))))

(assert (=> d!56845 (= (containsKey!247 lt!96665 (_1!1766 lt!96460)) e!128031)))

(declare-fun b!194647 () Bool)

(declare-fun e!128032 () Bool)

(assert (=> b!194647 (= e!128031 e!128032)))

(declare-fun res!91939 () Bool)

(assert (=> b!194647 (=> (not res!91939) (not e!128032))))

(assert (=> b!194647 (= res!91939 (and (or (not ((_ is Cons!2422) lt!96665)) (bvsle (_1!1766 (h!3063 lt!96665)) (_1!1766 lt!96460))) ((_ is Cons!2422) lt!96665) (bvslt (_1!1766 (h!3063 lt!96665)) (_1!1766 lt!96460))))))

(declare-fun b!194648 () Bool)

(assert (=> b!194648 (= e!128032 (containsKey!247 (t!7343 lt!96665) (_1!1766 lt!96460)))))

(assert (= (and d!56845 (not res!91938)) b!194647))

(assert (= (and b!194647 res!91939) b!194648))

(declare-fun m!221317 () Bool)

(assert (=> b!194648 m!221317))

(assert (=> b!194123 d!56845))

(declare-fun e!128034 () Option!249)

(declare-fun b!194651 () Bool)

(assert (=> b!194651 (= e!128034 (getValueByKey!243 (t!7343 (toList!1225 lt!96904)) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))

(declare-fun d!56847 () Bool)

(declare-fun c!35171 () Bool)

(assert (=> d!56847 (= c!35171 (and ((_ is Cons!2422) (toList!1225 lt!96904)) (= (_1!1766 (h!3063 (toList!1225 lt!96904))) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128033 () Option!249)

(assert (=> d!56847 (= (getValueByKey!243 (toList!1225 lt!96904) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) e!128033)))

(declare-fun b!194649 () Bool)

(assert (=> b!194649 (= e!128033 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96904)))))))

(declare-fun b!194650 () Bool)

(assert (=> b!194650 (= e!128033 e!128034)))

(declare-fun c!35172 () Bool)

(assert (=> b!194650 (= c!35172 (and ((_ is Cons!2422) (toList!1225 lt!96904)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96904))) (_1!1766 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194652 () Bool)

(assert (=> b!194652 (= e!128034 None!247)))

(assert (= (and d!56847 c!35171) b!194649))

(assert (= (and d!56847 (not c!35171)) b!194650))

(assert (= (and b!194650 c!35172) b!194651))

(assert (= (and b!194650 (not c!35172)) b!194652))

(declare-fun m!221319 () Bool)

(assert (=> b!194651 m!221319))

(assert (=> b!194470 d!56847))

(declare-fun d!56849 () Bool)

(assert (=> d!56849 (= (inRange!0 (index!4951 lt!96693) (mask!9221 thiss!1248)) (and (bvsge (index!4951 lt!96693) #b00000000000000000000000000000000) (bvslt (index!4951 lt!96693) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!194070 d!56849))

(declare-fun d!56851 () Bool)

(assert (=> d!56851 (= (inRange!0 (ite c!35052 (index!4950 lt!96749) (index!4953 lt!96749)) (mask!9221 thiss!1248)) (and (bvsge (ite c!35052 (index!4950 lt!96749) (index!4953 lt!96749)) #b00000000000000000000000000000000) (bvslt (ite c!35052 (index!4950 lt!96749) (index!4953 lt!96749)) (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19634 d!56851))

(declare-fun d!56853 () Bool)

(assert (=> d!56853 (= (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))))

(declare-fun bs!7737 () Bool)

(assert (= bs!7737 d!56853))

(assert (=> bs!7737 m!220955))

(declare-fun m!221321 () Bool)

(assert (=> bs!7737 m!221321))

(assert (=> b!194468 d!56853))

(declare-fun e!128036 () Option!249)

(declare-fun b!194655 () Bool)

(assert (=> b!194655 (= e!128036 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))) lt!96607))))

(declare-fun c!35173 () Bool)

(declare-fun d!56855 () Bool)

(assert (=> d!56855 (= c!35173 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))) lt!96607)))))

(declare-fun e!128035 () Option!249)

(assert (=> d!56855 (= (getValueByKey!243 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607) e!128035)))

(declare-fun b!194653 () Bool)

(assert (=> b!194653 (= e!128035 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))))

(declare-fun b!194654 () Bool)

(assert (=> b!194654 (= e!128035 e!128036)))

(declare-fun c!35174 () Bool)

(assert (=> b!194654 (= c!35174 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))) lt!96607))))))

(declare-fun b!194656 () Bool)

(assert (=> b!194656 (= e!128036 None!247)))

(assert (= (and d!56855 c!35173) b!194653))

(assert (= (and d!56855 (not c!35173)) b!194654))

(assert (= (and b!194654 c!35174) b!194655))

(assert (= (and b!194654 (not c!35174)) b!194656))

(declare-fun m!221323 () Bool)

(assert (=> b!194655 m!221323))

(assert (=> b!194468 d!56855))

(declare-fun d!56857 () Bool)

(assert (=> d!56857 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96606) lt!96621)) (v!4250 (getValueByKey!243 (toList!1225 lt!96606) lt!96621)))))

(assert (=> d!56711 d!56857))

(declare-fun b!194659 () Bool)

(declare-fun e!128038 () Option!249)

(assert (=> b!194659 (= e!128038 (getValueByKey!243 (t!7343 (toList!1225 lt!96606)) lt!96621))))

(declare-fun d!56859 () Bool)

(declare-fun c!35175 () Bool)

(assert (=> d!56859 (= c!35175 (and ((_ is Cons!2422) (toList!1225 lt!96606)) (= (_1!1766 (h!3063 (toList!1225 lt!96606))) lt!96621)))))

(declare-fun e!128037 () Option!249)

(assert (=> d!56859 (= (getValueByKey!243 (toList!1225 lt!96606) lt!96621) e!128037)))

(declare-fun b!194657 () Bool)

(assert (=> b!194657 (= e!128037 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96606)))))))

(declare-fun b!194658 () Bool)

(assert (=> b!194658 (= e!128037 e!128038)))

(declare-fun c!35176 () Bool)

(assert (=> b!194658 (= c!35176 (and ((_ is Cons!2422) (toList!1225 lt!96606)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96606))) lt!96621))))))

(declare-fun b!194660 () Bool)

(assert (=> b!194660 (= e!128038 None!247)))

(assert (= (and d!56859 c!35175) b!194657))

(assert (= (and d!56859 (not c!35175)) b!194658))

(assert (= (and b!194658 c!35176) b!194659))

(assert (= (and b!194658 (not c!35176)) b!194660))

(declare-fun m!221325 () Bool)

(assert (=> b!194659 m!221325))

(assert (=> d!56711 d!56859))

(declare-fun d!56861 () Bool)

(declare-fun res!91940 () Bool)

(declare-fun e!128039 () Bool)

(assert (=> d!56861 (=> res!91940 e!128039)))

(assert (=> d!56861 (= res!91940 (and ((_ is Cons!2422) lt!96725) (= (_1!1766 (h!3063 lt!96725)) (_1!1766 lt!96460))))))

(assert (=> d!56861 (= (containsKey!247 lt!96725 (_1!1766 lt!96460)) e!128039)))

(declare-fun b!194661 () Bool)

(declare-fun e!128040 () Bool)

(assert (=> b!194661 (= e!128039 e!128040)))

(declare-fun res!91941 () Bool)

(assert (=> b!194661 (=> (not res!91941) (not e!128040))))

(assert (=> b!194661 (= res!91941 (and (or (not ((_ is Cons!2422) lt!96725)) (bvsle (_1!1766 (h!3063 lt!96725)) (_1!1766 lt!96460))) ((_ is Cons!2422) lt!96725) (bvslt (_1!1766 (h!3063 lt!96725)) (_1!1766 lt!96460))))))

(declare-fun b!194662 () Bool)

(assert (=> b!194662 (= e!128040 (containsKey!247 (t!7343 lt!96725) (_1!1766 lt!96460)))))

(assert (= (and d!56861 (not res!91940)) b!194661))

(assert (= (and b!194661 res!91941) b!194662))

(declare-fun m!221327 () Bool)

(assert (=> b!194662 m!221327))

(assert (=> b!194148 d!56861))

(declare-fun d!56863 () Bool)

(declare-fun e!128042 () Bool)

(assert (=> d!56863 e!128042))

(declare-fun res!91942 () Bool)

(assert (=> d!56863 (=> res!91942 e!128042)))

(declare-fun lt!96985 () Bool)

(assert (=> d!56863 (= res!91942 (not lt!96985))))

(declare-fun lt!96986 () Bool)

(assert (=> d!56863 (= lt!96985 lt!96986)))

(declare-fun lt!96984 () Unit!5819)

(declare-fun e!128041 () Unit!5819)

(assert (=> d!56863 (= lt!96984 e!128041)))

(declare-fun c!35177 () Bool)

(assert (=> d!56863 (= c!35177 lt!96986)))

(assert (=> d!56863 (= lt!96986 (containsKey!247 (toList!1225 lt!96777) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56863 (= (contains!1356 lt!96777 #b0000000000000000000000000000000000000000000000000000000000000000) lt!96985)))

(declare-fun b!194663 () Bool)

(declare-fun lt!96983 () Unit!5819)

(assert (=> b!194663 (= e!128041 lt!96983)))

(assert (=> b!194663 (= lt!96983 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96777) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194663 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96777) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194664 () Bool)

(declare-fun Unit!5854 () Unit!5819)

(assert (=> b!194664 (= e!128041 Unit!5854)))

(declare-fun b!194665 () Bool)

(assert (=> b!194665 (= e!128042 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96777) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56863 c!35177) b!194663))

(assert (= (and d!56863 (not c!35177)) b!194664))

(assert (= (and d!56863 (not res!91942)) b!194665))

(declare-fun m!221329 () Bool)

(assert (=> d!56863 m!221329))

(declare-fun m!221331 () Bool)

(assert (=> b!194663 m!221331))

(declare-fun m!221333 () Bool)

(assert (=> b!194663 m!221333))

(assert (=> b!194663 m!221333))

(declare-fun m!221335 () Bool)

(assert (=> b!194663 m!221335))

(assert (=> b!194665 m!221333))

(assert (=> b!194665 m!221333))

(assert (=> b!194665 m!221335))

(assert (=> d!56583 d!56863))

(assert (=> d!56583 d!56531))

(declare-fun d!56865 () Bool)

(declare-fun e!128044 () Bool)

(assert (=> d!56865 e!128044))

(declare-fun res!91943 () Bool)

(assert (=> d!56865 (=> res!91943 e!128044)))

(declare-fun lt!96989 () Bool)

(assert (=> d!56865 (= res!91943 (not lt!96989))))

(declare-fun lt!96990 () Bool)

(assert (=> d!56865 (= lt!96989 lt!96990)))

(declare-fun lt!96988 () Unit!5819)

(declare-fun e!128043 () Unit!5819)

(assert (=> d!56865 (= lt!96988 e!128043)))

(declare-fun c!35178 () Bool)

(assert (=> d!56865 (= c!35178 lt!96990)))

(assert (=> d!56865 (= lt!96990 (containsKey!247 (toList!1225 lt!96909) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(assert (=> d!56865 (= (contains!1356 lt!96909 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96989)))

(declare-fun b!194666 () Bool)

(declare-fun lt!96987 () Unit!5819)

(assert (=> b!194666 (= e!128043 lt!96987)))

(assert (=> b!194666 (= lt!96987 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96909) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(assert (=> b!194666 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96909) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun b!194667 () Bool)

(declare-fun Unit!5855 () Unit!5819)

(assert (=> b!194667 (= e!128043 Unit!5855)))

(declare-fun b!194668 () Bool)

(assert (=> b!194668 (= e!128044 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96909) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(assert (= (and d!56865 c!35178) b!194666))

(assert (= (and d!56865 (not c!35178)) b!194667))

(assert (= (and d!56865 (not res!91943)) b!194668))

(declare-fun m!221337 () Bool)

(assert (=> d!56865 m!221337))

(declare-fun m!221339 () Bool)

(assert (=> b!194666 m!221339))

(assert (=> b!194666 m!220995))

(assert (=> b!194666 m!220995))

(declare-fun m!221341 () Bool)

(assert (=> b!194666 m!221341))

(assert (=> b!194668 m!220995))

(assert (=> b!194668 m!220995))

(assert (=> b!194668 m!221341))

(assert (=> d!56701 d!56865))

(declare-fun b!194671 () Bool)

(declare-fun e!128046 () Option!249)

(assert (=> b!194671 (= e!128046 (getValueByKey!243 (t!7343 lt!96911) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun c!35179 () Bool)

(declare-fun d!56867 () Bool)

(assert (=> d!56867 (= c!35179 (and ((_ is Cons!2422) lt!96911) (= (_1!1766 (h!3063 lt!96911)) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(declare-fun e!128045 () Option!249)

(assert (=> d!56867 (= (getValueByKey!243 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) e!128045)))

(declare-fun b!194669 () Bool)

(assert (=> b!194669 (= e!128045 (Some!248 (_2!1766 (h!3063 lt!96911))))))

(declare-fun b!194670 () Bool)

(assert (=> b!194670 (= e!128045 e!128046)))

(declare-fun c!35180 () Bool)

(assert (=> b!194670 (= c!35180 (and ((_ is Cons!2422) lt!96911) (not (= (_1!1766 (h!3063 lt!96911)) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194672 () Bool)

(assert (=> b!194672 (= e!128046 None!247)))

(assert (= (and d!56867 c!35179) b!194669))

(assert (= (and d!56867 (not c!35179)) b!194670))

(assert (= (and b!194670 c!35180) b!194671))

(assert (= (and b!194670 (not c!35180)) b!194672))

(declare-fun m!221343 () Bool)

(assert (=> b!194671 m!221343))

(assert (=> d!56701 d!56867))

(declare-fun d!56869 () Bool)

(assert (=> d!56869 (= (getValueByKey!243 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun lt!96991 () Unit!5819)

(assert (=> d!56869 (= lt!96991 (choose!1074 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun e!128047 () Bool)

(assert (=> d!56869 e!128047))

(declare-fun res!91944 () Bool)

(assert (=> d!56869 (=> (not res!91944) (not e!128047))))

(assert (=> d!56869 (= res!91944 (isStrictlySorted!352 lt!96911))))

(assert (=> d!56869 (= (lemmaContainsTupThenGetReturnValue!133 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96991)))

(declare-fun b!194673 () Bool)

(declare-fun res!91945 () Bool)

(assert (=> b!194673 (=> (not res!91945) (not e!128047))))

(assert (=> b!194673 (= res!91945 (containsKey!247 lt!96911 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun b!194674 () Bool)

(assert (=> b!194674 (= e!128047 (contains!1359 lt!96911 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(assert (= (and d!56869 res!91944) b!194673))

(assert (= (and b!194673 res!91945) b!194674))

(assert (=> d!56869 m!220989))

(declare-fun m!221345 () Bool)

(assert (=> d!56869 m!221345))

(declare-fun m!221347 () Bool)

(assert (=> d!56869 m!221347))

(declare-fun m!221349 () Bool)

(assert (=> b!194673 m!221349))

(declare-fun m!221351 () Bool)

(assert (=> b!194674 m!221351))

(assert (=> d!56701 d!56869))

(declare-fun d!56871 () Bool)

(declare-fun e!128049 () Bool)

(assert (=> d!56871 e!128049))

(declare-fun res!91947 () Bool)

(assert (=> d!56871 (=> (not res!91947) (not e!128049))))

(declare-fun lt!96992 () List!2426)

(assert (=> d!56871 (= res!91947 (isStrictlySorted!352 lt!96992))))

(declare-fun e!128050 () List!2426)

(assert (=> d!56871 (= lt!96992 e!128050)))

(declare-fun c!35181 () Bool)

(assert (=> d!56871 (= c!35181 (and ((_ is Cons!2422) (toList!1225 lt!96606)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96606))) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(assert (=> d!56871 (isStrictlySorted!352 (toList!1225 lt!96606))))

(assert (=> d!56871 (= (insertStrictlySorted!136 (toList!1225 lt!96606) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96992)))

(declare-fun bm!19676 () Bool)

(declare-fun call!19680 () List!2426)

(declare-fun call!19681 () List!2426)

(assert (=> bm!19676 (= call!19680 call!19681)))

(declare-fun e!128051 () List!2426)

(declare-fun b!194675 () Bool)

(assert (=> b!194675 (= e!128051 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96606)) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun b!194676 () Bool)

(assert (=> b!194676 (= e!128049 (contains!1359 lt!96992 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(declare-fun b!194677 () Bool)

(declare-fun e!128048 () List!2426)

(assert (=> b!194677 (= e!128050 e!128048)))

(declare-fun c!35183 () Bool)

(assert (=> b!194677 (= c!35183 (and ((_ is Cons!2422) (toList!1225 lt!96606)) (= (_1!1766 (h!3063 (toList!1225 lt!96606))) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(declare-fun b!194678 () Bool)

(declare-fun res!91946 () Bool)

(assert (=> b!194678 (=> (not res!91946) (not e!128049))))

(assert (=> b!194678 (= res!91946 (containsKey!247 lt!96992 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))

(declare-fun b!194679 () Bool)

(assert (=> b!194679 (= e!128050 call!19681)))

(declare-fun b!194680 () Bool)

(declare-fun e!128052 () List!2426)

(declare-fun call!19679 () List!2426)

(assert (=> b!194680 (= e!128052 call!19679)))

(declare-fun b!194681 () Bool)

(assert (=> b!194681 (= e!128052 call!19679)))

(declare-fun c!35184 () Bool)

(declare-fun b!194682 () Bool)

(assert (=> b!194682 (= e!128051 (ite c!35183 (t!7343 (toList!1225 lt!96606)) (ite c!35184 (Cons!2422 (h!3063 (toList!1225 lt!96606)) (t!7343 (toList!1225 lt!96606))) Nil!2423)))))

(declare-fun b!194683 () Bool)

(assert (=> b!194683 (= e!128048 call!19680)))

(declare-fun bm!19677 () Bool)

(assert (=> bm!19677 (= call!19681 ($colon$colon!102 e!128051 (ite c!35181 (h!3063 (toList!1225 lt!96606)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35182 () Bool)

(assert (=> bm!19677 (= c!35182 c!35181)))

(declare-fun b!194684 () Bool)

(assert (=> b!194684 (= c!35184 (and ((_ is Cons!2422) (toList!1225 lt!96606)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96606))) (_1!1766 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))

(assert (=> b!194684 (= e!128048 e!128052)))

(declare-fun bm!19678 () Bool)

(assert (=> bm!19678 (= call!19679 call!19680)))

(assert (= (and d!56871 c!35181) b!194679))

(assert (= (and d!56871 (not c!35181)) b!194677))

(assert (= (and b!194677 c!35183) b!194683))

(assert (= (and b!194677 (not c!35183)) b!194684))

(assert (= (and b!194684 c!35184) b!194680))

(assert (= (and b!194684 (not c!35184)) b!194681))

(assert (= (or b!194680 b!194681) bm!19678))

(assert (= (or b!194683 bm!19678) bm!19676))

(assert (= (or b!194679 bm!19676) bm!19677))

(assert (= (and bm!19677 c!35182) b!194675))

(assert (= (and bm!19677 (not c!35182)) b!194682))

(assert (= (and d!56871 res!91947) b!194678))

(assert (= (and b!194678 res!91946) b!194676))

(declare-fun m!221353 () Bool)

(assert (=> d!56871 m!221353))

(declare-fun m!221355 () Bool)

(assert (=> d!56871 m!221355))

(declare-fun m!221357 () Bool)

(assert (=> b!194678 m!221357))

(declare-fun m!221359 () Bool)

(assert (=> b!194675 m!221359))

(declare-fun m!221361 () Bool)

(assert (=> b!194676 m!221361))

(declare-fun m!221363 () Bool)

(assert (=> bm!19677 m!221363))

(assert (=> d!56701 d!56871))

(declare-fun d!56873 () Bool)

(declare-fun e!128054 () Bool)

(assert (=> d!56873 e!128054))

(declare-fun res!91948 () Bool)

(assert (=> d!56873 (=> res!91948 e!128054)))

(declare-fun lt!96995 () Bool)

(assert (=> d!56873 (= res!91948 (not lt!96995))))

(declare-fun lt!96996 () Bool)

(assert (=> d!56873 (= lt!96995 lt!96996)))

(declare-fun lt!96994 () Unit!5819)

(declare-fun e!128053 () Unit!5819)

(assert (=> d!56873 (= lt!96994 e!128053)))

(declare-fun c!35185 () Bool)

(assert (=> d!56873 (= c!35185 lt!96996)))

(assert (=> d!56873 (= lt!96996 (containsKey!247 (toList!1225 lt!96817) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (=> d!56873 (= (contains!1356 lt!96817 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) lt!96995)))

(declare-fun b!194685 () Bool)

(declare-fun lt!96993 () Unit!5819)

(assert (=> b!194685 (= e!128053 lt!96993)))

(assert (=> b!194685 (= lt!96993 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96817) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (=> b!194685 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96817) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!194686 () Bool)

(declare-fun Unit!5856 () Unit!5819)

(assert (=> b!194686 (= e!128053 Unit!5856)))

(declare-fun b!194687 () Bool)

(assert (=> b!194687 (= e!128054 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96817) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))))

(assert (= (and d!56873 c!35185) b!194685))

(assert (= (and d!56873 (not c!35185)) b!194686))

(assert (= (and d!56873 (not res!91948)) b!194687))

(assert (=> d!56873 m!220529))

(declare-fun m!221365 () Bool)

(assert (=> d!56873 m!221365))

(assert (=> b!194685 m!220529))

(declare-fun m!221367 () Bool)

(assert (=> b!194685 m!221367))

(assert (=> b!194685 m!220529))

(declare-fun m!221369 () Bool)

(assert (=> b!194685 m!221369))

(assert (=> b!194685 m!221369))

(declare-fun m!221371 () Bool)

(assert (=> b!194685 m!221371))

(assert (=> b!194687 m!220529))

(assert (=> b!194687 m!221369))

(assert (=> b!194687 m!221369))

(assert (=> b!194687 m!221371))

(assert (=> b!194326 d!56873))

(declare-fun d!56875 () Bool)

(declare-fun e!128056 () Bool)

(assert (=> d!56875 e!128056))

(declare-fun res!91949 () Bool)

(assert (=> d!56875 (=> res!91949 e!128056)))

(declare-fun lt!96999 () Bool)

(assert (=> d!56875 (= res!91949 (not lt!96999))))

(declare-fun lt!97000 () Bool)

(assert (=> d!56875 (= lt!96999 lt!97000)))

(declare-fun lt!96998 () Unit!5819)

(declare-fun e!128055 () Unit!5819)

(assert (=> d!56875 (= lt!96998 e!128055)))

(declare-fun c!35186 () Bool)

(assert (=> d!56875 (= c!35186 lt!97000)))

(assert (=> d!56875 (= lt!97000 (containsKey!247 (toList!1225 lt!96712) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56875 (= (contains!1356 lt!96712 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!96999)))

(declare-fun b!194688 () Bool)

(declare-fun lt!96997 () Unit!5819)

(assert (=> b!194688 (= e!128055 lt!96997)))

(assert (=> b!194688 (= lt!96997 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96712) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> b!194688 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96712) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194689 () Bool)

(declare-fun Unit!5857 () Unit!5819)

(assert (=> b!194689 (= e!128055 Unit!5857)))

(declare-fun b!194690 () Bool)

(assert (=> b!194690 (= e!128056 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96712) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!56875 c!35186) b!194688))

(assert (= (and d!56875 (not c!35186)) b!194689))

(assert (= (and d!56875 (not res!91949)) b!194690))

(declare-fun m!221373 () Bool)

(assert (=> d!56875 m!221373))

(declare-fun m!221375 () Bool)

(assert (=> b!194688 m!221375))

(assert (=> b!194688 m!220471))

(assert (=> b!194688 m!220471))

(declare-fun m!221377 () Bool)

(assert (=> b!194688 m!221377))

(assert (=> b!194690 m!220471))

(assert (=> b!194690 m!220471))

(assert (=> b!194690 m!221377))

(assert (=> d!56545 d!56875))

(declare-fun b!194693 () Bool)

(declare-fun e!128058 () Option!249)

(assert (=> b!194693 (= e!128058 (getValueByKey!243 (t!7343 lt!96714) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun d!56877 () Bool)

(declare-fun c!35187 () Bool)

(assert (=> d!56877 (= c!35187 (and ((_ is Cons!2422) lt!96714) (= (_1!1766 (h!3063 lt!96714)) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun e!128057 () Option!249)

(assert (=> d!56877 (= (getValueByKey!243 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128057)))

(declare-fun b!194691 () Bool)

(assert (=> b!194691 (= e!128057 (Some!248 (_2!1766 (h!3063 lt!96714))))))

(declare-fun b!194692 () Bool)

(assert (=> b!194692 (= e!128057 e!128058)))

(declare-fun c!35188 () Bool)

(assert (=> b!194692 (= c!35188 (and ((_ is Cons!2422) lt!96714) (not (= (_1!1766 (h!3063 lt!96714)) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194694 () Bool)

(assert (=> b!194694 (= e!128058 None!247)))

(assert (= (and d!56877 c!35187) b!194691))

(assert (= (and d!56877 (not c!35187)) b!194692))

(assert (= (and b!194692 c!35188) b!194693))

(assert (= (and b!194692 (not c!35188)) b!194694))

(declare-fun m!221379 () Bool)

(assert (=> b!194693 m!221379))

(assert (=> d!56545 d!56877))

(declare-fun d!56879 () Bool)

(assert (=> d!56879 (= (getValueByKey!243 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97001 () Unit!5819)

(assert (=> d!56879 (= lt!97001 (choose!1074 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128059 () Bool)

(assert (=> d!56879 e!128059))

(declare-fun res!91950 () Bool)

(assert (=> d!56879 (=> (not res!91950) (not e!128059))))

(assert (=> d!56879 (= res!91950 (isStrictlySorted!352 lt!96714))))

(assert (=> d!56879 (= (lemmaContainsTupThenGetReturnValue!133 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97001)))

(declare-fun b!194695 () Bool)

(declare-fun res!91951 () Bool)

(assert (=> b!194695 (=> (not res!91951) (not e!128059))))

(assert (=> b!194695 (= res!91951 (containsKey!247 lt!96714 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194696 () Bool)

(assert (=> b!194696 (= e!128059 (contains!1359 lt!96714 (tuple2!3511 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!56879 res!91950) b!194695))

(assert (= (and b!194695 res!91951) b!194696))

(assert (=> d!56879 m!220465))

(declare-fun m!221381 () Bool)

(assert (=> d!56879 m!221381))

(declare-fun m!221383 () Bool)

(assert (=> d!56879 m!221383))

(declare-fun m!221385 () Bool)

(assert (=> b!194695 m!221385))

(declare-fun m!221387 () Bool)

(assert (=> b!194696 m!221387))

(assert (=> d!56545 d!56879))

(declare-fun d!56881 () Bool)

(declare-fun e!128061 () Bool)

(assert (=> d!56881 e!128061))

(declare-fun res!91953 () Bool)

(assert (=> d!56881 (=> (not res!91953) (not e!128061))))

(declare-fun lt!97002 () List!2426)

(assert (=> d!56881 (= res!91953 (isStrictlySorted!352 lt!97002))))

(declare-fun e!128062 () List!2426)

(assert (=> d!56881 (= lt!97002 e!128062)))

(declare-fun c!35189 () Bool)

(assert (=> d!56881 (= c!35189 (and ((_ is Cons!2422) (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (bvslt (_1!1766 (h!3063 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!56881 (isStrictlySorted!352 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))))))

(assert (=> d!56881 (= (insertStrictlySorted!136 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97002)))

(declare-fun bm!19679 () Bool)

(declare-fun call!19683 () List!2426)

(declare-fun call!19684 () List!2426)

(assert (=> bm!19679 (= call!19683 call!19684)))

(declare-fun b!194697 () Bool)

(declare-fun e!128063 () List!2426)

(assert (=> b!194697 (= e!128063 (insertStrictlySorted!136 (t!7343 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194698 () Bool)

(assert (=> b!194698 (= e!128061 (contains!1359 lt!97002 (tuple2!3511 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194699 () Bool)

(declare-fun e!128060 () List!2426)

(assert (=> b!194699 (= e!128062 e!128060)))

(declare-fun c!35191 () Bool)

(assert (=> b!194699 (= c!35191 (and ((_ is Cons!2422) (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (= (_1!1766 (h!3063 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194700 () Bool)

(declare-fun res!91952 () Bool)

(assert (=> b!194700 (=> (not res!91952) (not e!128061))))

(assert (=> b!194700 (= res!91952 (containsKey!247 lt!97002 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194701 () Bool)

(assert (=> b!194701 (= e!128062 call!19684)))

(declare-fun b!194702 () Bool)

(declare-fun e!128064 () List!2426)

(declare-fun call!19682 () List!2426)

(assert (=> b!194702 (= e!128064 call!19682)))

(declare-fun b!194703 () Bool)

(assert (=> b!194703 (= e!128064 call!19682)))

(declare-fun b!194704 () Bool)

(declare-fun c!35192 () Bool)

(assert (=> b!194704 (= e!128063 (ite c!35191 (t!7343 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (ite c!35192 (Cons!2422 (h!3063 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (t!7343 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))))) Nil!2423)))))

(declare-fun b!194705 () Bool)

(assert (=> b!194705 (= e!128060 call!19683)))

(declare-fun bm!19680 () Bool)

(assert (=> bm!19680 (= call!19684 ($colon$colon!102 e!128063 (ite c!35189 (h!3063 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (tuple2!3511 (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun c!35190 () Bool)

(assert (=> bm!19680 (= c!35190 c!35189)))

(declare-fun b!194706 () Bool)

(assert (=> b!194706 (= c!35192 (and ((_ is Cons!2422) (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607)))) (bvsgt (_1!1766 (h!3063 (toList!1225 (ite c!34995 call!19612 (ite c!34990 call!19609 call!19607))))) (_1!1766 (ite (or c!34995 c!34990) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> b!194706 (= e!128060 e!128064)))

(declare-fun bm!19681 () Bool)

(assert (=> bm!19681 (= call!19682 call!19683)))

(assert (= (and d!56881 c!35189) b!194701))

(assert (= (and d!56881 (not c!35189)) b!194699))

(assert (= (and b!194699 c!35191) b!194705))

(assert (= (and b!194699 (not c!35191)) b!194706))

(assert (= (and b!194706 c!35192) b!194702))

(assert (= (and b!194706 (not c!35192)) b!194703))

(assert (= (or b!194702 b!194703) bm!19681))

(assert (= (or b!194705 bm!19681) bm!19679))

(assert (= (or b!194701 bm!19679) bm!19680))

(assert (= (and bm!19680 c!35190) b!194697))

(assert (= (and bm!19680 (not c!35190)) b!194704))

(assert (= (and d!56881 res!91953) b!194700))

(assert (= (and b!194700 res!91952) b!194698))

(declare-fun m!221389 () Bool)

(assert (=> d!56881 m!221389))

(declare-fun m!221391 () Bool)

(assert (=> d!56881 m!221391))

(declare-fun m!221393 () Bool)

(assert (=> b!194700 m!221393))

(declare-fun m!221395 () Bool)

(assert (=> b!194697 m!221395))

(declare-fun m!221397 () Bool)

(assert (=> b!194698 m!221397))

(declare-fun m!221399 () Bool)

(assert (=> bm!19680 m!221399))

(assert (=> d!56545 d!56881))

(declare-fun d!56883 () Bool)

(declare-fun e!128066 () Bool)

(assert (=> d!56883 e!128066))

(declare-fun res!91954 () Bool)

(assert (=> d!56883 (=> res!91954 e!128066)))

(declare-fun lt!97005 () Bool)

(assert (=> d!56883 (= res!91954 (not lt!97005))))

(declare-fun lt!97006 () Bool)

(assert (=> d!56883 (= lt!97005 lt!97006)))

(declare-fun lt!97004 () Unit!5819)

(declare-fun e!128065 () Unit!5819)

(assert (=> d!56883 (= lt!97004 e!128065)))

(declare-fun c!35193 () Bool)

(assert (=> d!56883 (= c!35193 lt!97006)))

(assert (=> d!56883 (= lt!97006 (containsKey!247 (toList!1225 lt!96795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56883 (= (contains!1356 lt!96795 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97005)))

(declare-fun b!194707 () Bool)

(declare-fun lt!97003 () Unit!5819)

(assert (=> b!194707 (= e!128065 lt!97003)))

(assert (=> b!194707 (= lt!97003 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194707 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96795) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194708 () Bool)

(declare-fun Unit!5858 () Unit!5819)

(assert (=> b!194708 (= e!128065 Unit!5858)))

(declare-fun b!194709 () Bool)

(assert (=> b!194709 (= e!128066 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56883 c!35193) b!194707))

(assert (= (and d!56883 (not c!35193)) b!194708))

(assert (= (and d!56883 (not res!91954)) b!194709))

(declare-fun m!221401 () Bool)

(assert (=> d!56883 m!221401))

(declare-fun m!221403 () Bool)

(assert (=> b!194707 m!221403))

(declare-fun m!221405 () Bool)

(assert (=> b!194707 m!221405))

(assert (=> b!194707 m!221405))

(declare-fun m!221407 () Bool)

(assert (=> b!194707 m!221407))

(assert (=> b!194709 m!221405))

(assert (=> b!194709 m!221405))

(assert (=> b!194709 m!221407))

(assert (=> bm!19646 d!56883))

(declare-fun b!194712 () Bool)

(declare-fun e!128068 () Option!249)

(assert (=> b!194712 (= e!128068 (getValueByKey!243 (t!7343 (t!7343 lt!96673)) (_1!1766 lt!96460)))))

(declare-fun d!56885 () Bool)

(declare-fun c!35194 () Bool)

(assert (=> d!56885 (= c!35194 (and ((_ is Cons!2422) (t!7343 lt!96673)) (= (_1!1766 (h!3063 (t!7343 lt!96673))) (_1!1766 lt!96460))))))

(declare-fun e!128067 () Option!249)

(assert (=> d!56885 (= (getValueByKey!243 (t!7343 lt!96673) (_1!1766 lt!96460)) e!128067)))

(declare-fun b!194710 () Bool)

(assert (=> b!194710 (= e!128067 (Some!248 (_2!1766 (h!3063 (t!7343 lt!96673)))))))

(declare-fun b!194711 () Bool)

(assert (=> b!194711 (= e!128067 e!128068)))

(declare-fun c!35195 () Bool)

(assert (=> b!194711 (= c!35195 (and ((_ is Cons!2422) (t!7343 lt!96673)) (not (= (_1!1766 (h!3063 (t!7343 lt!96673))) (_1!1766 lt!96460)))))))

(declare-fun b!194713 () Bool)

(assert (=> b!194713 (= e!128068 None!247)))

(assert (= (and d!56885 c!35194) b!194710))

(assert (= (and d!56885 (not c!35194)) b!194711))

(assert (= (and b!194711 c!35195) b!194712))

(assert (= (and b!194711 (not c!35195)) b!194713))

(declare-fun m!221409 () Bool)

(assert (=> b!194712 m!221409))

(assert (=> b!194238 d!56885))

(declare-fun d!56887 () Bool)

(declare-fun e!128074 () Bool)

(assert (=> d!56887 e!128074))

(declare-fun res!91955 () Bool)

(assert (=> d!56887 (=> (not res!91955) (not e!128074))))

(declare-fun lt!97012 () ListLongMap!2419)

(assert (=> d!56887 (= res!91955 (not (contains!1356 lt!97012 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128070 () ListLongMap!2419)

(assert (=> d!56887 (= lt!97012 e!128070)))

(declare-fun c!35198 () Bool)

(assert (=> d!56887 (= c!35198 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56887 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!56887 (= (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)) lt!97012)))

(declare-fun b!194714 () Bool)

(declare-fun lt!97007 () Unit!5819)

(declare-fun lt!97008 () Unit!5819)

(assert (=> b!194714 (= lt!97007 lt!97008)))

(declare-fun lt!97010 () (_ BitVec 64))

(declare-fun lt!97011 () V!5633)

(declare-fun lt!97009 () (_ BitVec 64))

(declare-fun lt!97013 () ListLongMap!2419)

(assert (=> b!194714 (not (contains!1356 (+!317 lt!97013 (tuple2!3511 lt!97010 lt!97011)) lt!97009))))

(assert (=> b!194714 (= lt!97008 (addStillNotContains!98 lt!97013 lt!97010 lt!97011 lt!97009))))

(assert (=> b!194714 (= lt!97009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194714 (= lt!97011 (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194714 (= lt!97010 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!19685 () ListLongMap!2419)

(assert (=> b!194714 (= lt!97013 call!19685)))

(declare-fun e!128075 () ListLongMap!2419)

(assert (=> b!194714 (= e!128075 (+!317 call!19685 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194715 () Bool)

(declare-fun e!128069 () Bool)

(declare-fun e!128071 () Bool)

(assert (=> b!194715 (= e!128069 e!128071)))

(declare-fun c!35199 () Bool)

(assert (=> b!194715 (= c!35199 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194716 () Bool)

(assert (=> b!194716 (= e!128071 (isEmpty!491 lt!97012))))

(declare-fun b!194717 () Bool)

(declare-fun e!128073 () Bool)

(assert (=> b!194717 (= e!128073 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194717 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!19682 () Bool)

(assert (=> bm!19682 (= call!19685 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194718 () Bool)

(assert (=> b!194718 (= e!128074 e!128069)))

(declare-fun c!35196 () Bool)

(assert (=> b!194718 (= c!35196 e!128073)))

(declare-fun res!91957 () Bool)

(assert (=> b!194718 (=> (not res!91957) (not e!128073))))

(assert (=> b!194718 (= res!91957 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194719 () Bool)

(assert (=> b!194719 (= e!128070 (ListLongMap!2420 Nil!2423))))

(declare-fun b!194720 () Bool)

(assert (=> b!194720 (= e!128075 call!19685)))

(declare-fun b!194721 () Bool)

(assert (=> b!194721 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!194721 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4188 (_values!3942 thiss!1248))))))

(declare-fun e!128072 () Bool)

(assert (=> b!194721 (= e!128072 (= (apply!188 lt!97012 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194722 () Bool)

(assert (=> b!194722 (= e!128069 e!128072)))

(assert (=> b!194722 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!91958 () Bool)

(assert (=> b!194722 (= res!91958 (contains!1356 lt!97012 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!194722 (=> (not res!91958) (not e!128072))))

(declare-fun b!194723 () Bool)

(declare-fun res!91956 () Bool)

(assert (=> b!194723 (=> (not res!91956) (not e!128074))))

(assert (=> b!194723 (= res!91956 (not (contains!1356 lt!97012 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194724 () Bool)

(assert (=> b!194724 (= e!128070 e!128075)))

(declare-fun c!35197 () Bool)

(assert (=> b!194724 (= c!35197 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194725 () Bool)

(assert (=> b!194725 (= e!128071 (= lt!97012 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!56887 c!35198) b!194719))

(assert (= (and d!56887 (not c!35198)) b!194724))

(assert (= (and b!194724 c!35197) b!194714))

(assert (= (and b!194724 (not c!35197)) b!194720))

(assert (= (or b!194714 b!194720) bm!19682))

(assert (= (and d!56887 res!91955) b!194723))

(assert (= (and b!194723 res!91956) b!194718))

(assert (= (and b!194718 res!91957) b!194717))

(assert (= (and b!194718 c!35196) b!194722))

(assert (= (and b!194718 (not c!35196)) b!194715))

(assert (= (and b!194722 res!91958) b!194721))

(assert (= (and b!194715 c!35199) b!194725))

(assert (= (and b!194715 (not c!35199)) b!194716))

(declare-fun b_lambda!7491 () Bool)

(assert (=> (not b_lambda!7491) (not b!194714)))

(assert (=> b!194714 t!7347))

(declare-fun b_and!11427 () Bool)

(assert (= b_and!11425 (and (=> t!7347 result!4931) b_and!11427)))

(declare-fun b_lambda!7493 () Bool)

(assert (=> (not b_lambda!7493) (not b!194721)))

(assert (=> b!194721 t!7347))

(declare-fun b_and!11429 () Bool)

(assert (= b_and!11427 (and (=> t!7347 result!4931) b_and!11429)))

(assert (=> b!194717 m!221293))

(assert (=> b!194717 m!221293))

(assert (=> b!194717 m!221297))

(assert (=> b!194724 m!221293))

(assert (=> b!194724 m!221293))

(assert (=> b!194724 m!221297))

(declare-fun m!221411 () Bool)

(assert (=> b!194716 m!221411))

(assert (=> b!194722 m!221293))

(assert (=> b!194722 m!221293))

(declare-fun m!221413 () Bool)

(assert (=> b!194722 m!221413))

(declare-fun m!221415 () Bool)

(assert (=> b!194723 m!221415))

(declare-fun m!221417 () Bool)

(assert (=> bm!19682 m!221417))

(assert (=> b!194725 m!221417))

(declare-fun m!221419 () Bool)

(assert (=> b!194714 m!221419))

(assert (=> b!194714 m!220243))

(declare-fun m!221421 () Bool)

(assert (=> b!194714 m!221421))

(assert (=> b!194714 m!221293))

(declare-fun m!221423 () Bool)

(assert (=> b!194714 m!221423))

(assert (=> b!194714 m!220243))

(assert (=> b!194714 m!221419))

(declare-fun m!221425 () Bool)

(assert (=> b!194714 m!221425))

(declare-fun m!221427 () Bool)

(assert (=> b!194714 m!221427))

(declare-fun m!221429 () Bool)

(assert (=> b!194714 m!221429))

(assert (=> b!194714 m!221425))

(assert (=> b!194721 m!221419))

(assert (=> b!194721 m!220243))

(assert (=> b!194721 m!221421))

(assert (=> b!194721 m!221293))

(assert (=> b!194721 m!221293))

(declare-fun m!221431 () Bool)

(assert (=> b!194721 m!221431))

(assert (=> b!194721 m!220243))

(assert (=> b!194721 m!221419))

(declare-fun m!221433 () Bool)

(assert (=> d!56887 m!221433))

(assert (=> d!56887 m!220205))

(assert (=> bm!19628 d!56887))

(assert (=> d!56541 d!56531))

(declare-fun d!56889 () Bool)

(declare-fun c!35202 () Bool)

(assert (=> d!56889 (= c!35202 ((_ is Nil!2423) (toList!1225 lt!96663)))))

(declare-fun e!128078 () (InoxSet tuple2!3510))

(assert (=> d!56889 (= (content!155 (toList!1225 lt!96663)) e!128078)))

(declare-fun b!194730 () Bool)

(assert (=> b!194730 (= e!128078 ((as const (Array tuple2!3510 Bool)) false))))

(declare-fun b!194731 () Bool)

(assert (=> b!194731 (= e!128078 ((_ map or) (store ((as const (Array tuple2!3510 Bool)) false) (h!3063 (toList!1225 lt!96663)) true) (content!155 (t!7343 (toList!1225 lt!96663)))))))

(assert (= (and d!56889 c!35202) b!194730))

(assert (= (and d!56889 (not c!35202)) b!194731))

(declare-fun m!221435 () Bool)

(assert (=> b!194731 m!221435))

(declare-fun m!221437 () Bool)

(assert (=> b!194731 m!221437))

(assert (=> d!56713 d!56889))

(declare-fun d!56891 () Bool)

(assert (=> d!56891 (= (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96621)) (v!4250 (getValueByKey!243 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96621)))))

(assert (=> d!56683 d!56891))

(declare-fun b!194734 () Bool)

(declare-fun e!128080 () Option!249)

(assert (=> b!194734 (= e!128080 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))) lt!96621))))

(declare-fun d!56893 () Bool)

(declare-fun c!35203 () Bool)

(assert (=> d!56893 (= c!35203 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))) lt!96621)))))

(declare-fun e!128079 () Option!249)

(assert (=> d!56893 (= (getValueByKey!243 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))) lt!96621) e!128079)))

(declare-fun b!194732 () Bool)

(assert (=> b!194732 (= e!128079 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194733 () Bool)

(assert (=> b!194733 (= e!128079 e!128080)))

(declare-fun c!35204 () Bool)

(assert (=> b!194733 (= c!35204 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96606 (tuple2!3511 lt!96609 (minValue!3800 thiss!1248)))))) lt!96621))))))

(declare-fun b!194735 () Bool)

(assert (=> b!194735 (= e!128080 None!247)))

(assert (= (and d!56893 c!35203) b!194732))

(assert (= (and d!56893 (not c!35203)) b!194733))

(assert (= (and b!194733 c!35204) b!194734))

(assert (= (and b!194733 (not c!35204)) b!194735))

(declare-fun m!221439 () Bool)

(assert (=> b!194734 m!221439))

(assert (=> d!56683 d!56893))

(declare-fun d!56895 () Bool)

(assert (=> d!56895 (= (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))))

(declare-fun bs!7738 () Bool)

(assert (= bs!7738 d!56895))

(assert (=> bs!7738 m!220829))

(declare-fun m!221441 () Bool)

(assert (=> bs!7738 m!221441))

(assert (=> b!194359 d!56895))

(declare-fun b!194738 () Bool)

(declare-fun e!128082 () Option!249)

(assert (=> b!194738 (= e!128082 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))) lt!96629))))

(declare-fun d!56897 () Bool)

(declare-fun c!35205 () Bool)

(assert (=> d!56897 (= c!35205 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))) lt!96629)))))

(declare-fun e!128081 () Option!249)

(assert (=> d!56897 (= (getValueByKey!243 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629) e!128081)))

(declare-fun b!194736 () Bool)

(assert (=> b!194736 (= e!128081 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))))

(declare-fun b!194737 () Bool)

(assert (=> b!194737 (= e!128081 e!128082)))

(declare-fun c!35206 () Bool)

(assert (=> b!194737 (= c!35206 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))) lt!96629))))))

(declare-fun b!194739 () Bool)

(assert (=> b!194739 (= e!128082 None!247)))

(assert (= (and d!56897 c!35205) b!194736))

(assert (= (and d!56897 (not c!35205)) b!194737))

(assert (= (and b!194737 c!35206) b!194738))

(assert (= (and b!194737 (not c!35206)) b!194739))

(declare-fun m!221443 () Bool)

(assert (=> b!194738 m!221443))

(assert (=> b!194359 d!56897))

(declare-fun d!56899 () Bool)

(assert (=> d!56899 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!97014 () Unit!5819)

(assert (=> d!56899 (= lt!97014 (choose!1075 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128083 () Bool)

(assert (=> d!56899 e!128083))

(declare-fun res!91959 () Bool)

(assert (=> d!56899 (=> (not res!91959) (not e!128083))))

(assert (=> d!56899 (= res!91959 (isStrictlySorted!352 (toList!1225 lt!96610)))))

(assert (=> d!56899 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!97014)))

(declare-fun b!194740 () Bool)

(assert (=> b!194740 (= e!128083 (containsKey!247 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56899 res!91959) b!194740))

(assert (=> d!56899 m!220231))

(assert (=> d!56899 m!220439))

(assert (=> d!56899 m!220439))

(assert (=> d!56899 m!220441))

(assert (=> d!56899 m!220231))

(declare-fun m!221445 () Bool)

(assert (=> d!56899 m!221445))

(assert (=> d!56899 m!221065))

(assert (=> b!194740 m!220231))

(assert (=> b!194740 m!220435))

(assert (=> b!194087 d!56899))

(assert (=> b!194087 d!56761))

(assert (=> b!194087 d!56763))

(declare-fun d!56901 () Bool)

(assert (=> d!56901 (= (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!96643)) (v!4250 (getValueByKey!243 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!96643)))))

(assert (=> d!56615 d!56901))

(declare-fun e!128085 () Option!249)

(declare-fun b!194743 () Bool)

(assert (=> b!194743 (= e!128085 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))) lt!96643))))

(declare-fun c!35207 () Bool)

(declare-fun d!56903 () Bool)

(assert (=> d!56903 (= c!35207 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))) lt!96643)))))

(declare-fun e!128084 () Option!249)

(assert (=> d!56903 (= (getValueByKey!243 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!96643) e!128084)))

(declare-fun b!194741 () Bool)

(assert (=> b!194741 (= e!128084 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194742 () Bool)

(assert (=> b!194742 (= e!128084 e!128085)))

(declare-fun c!35208 () Bool)

(assert (=> b!194742 (= c!35208 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))) lt!96643))))))

(declare-fun b!194744 () Bool)

(assert (=> b!194744 (= e!128085 None!247)))

(assert (= (and d!56903 c!35207) b!194741))

(assert (= (and d!56903 (not c!35207)) b!194742))

(assert (= (and b!194742 c!35208) b!194743))

(assert (= (and b!194742 (not c!35208)) b!194744))

(declare-fun m!221447 () Bool)

(assert (=> b!194743 m!221447))

(assert (=> d!56615 d!56903))

(declare-fun d!56905 () Bool)

(declare-fun e!128087 () Bool)

(assert (=> d!56905 e!128087))

(declare-fun res!91960 () Bool)

(assert (=> d!56905 (=> res!91960 e!128087)))

(declare-fun lt!97017 () Bool)

(assert (=> d!56905 (= res!91960 (not lt!97017))))

(declare-fun lt!97018 () Bool)

(assert (=> d!56905 (= lt!97017 lt!97018)))

(declare-fun lt!97016 () Unit!5819)

(declare-fun e!128086 () Unit!5819)

(assert (=> d!56905 (= lt!97016 e!128086)))

(declare-fun c!35209 () Bool)

(assert (=> d!56905 (= c!35209 lt!97018)))

(assert (=> d!56905 (= lt!97018 (containsKey!247 (toList!1225 lt!96795) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56905 (= (contains!1356 lt!96795 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!97017)))

(declare-fun b!194745 () Bool)

(declare-fun lt!97015 () Unit!5819)

(assert (=> b!194745 (= e!128086 lt!97015)))

(assert (=> b!194745 (= lt!97015 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96795) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194745 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96795) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194746 () Bool)

(declare-fun Unit!5859 () Unit!5819)

(assert (=> b!194746 (= e!128086 Unit!5859)))

(declare-fun b!194747 () Bool)

(assert (=> b!194747 (= e!128087 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96795) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56905 c!35209) b!194745))

(assert (= (and d!56905 (not c!35209)) b!194746))

(assert (= (and d!56905 (not res!91960)) b!194747))

(assert (=> d!56905 m!220231))

(declare-fun m!221449 () Bool)

(assert (=> d!56905 m!221449))

(assert (=> b!194745 m!220231))

(declare-fun m!221451 () Bool)

(assert (=> b!194745 m!221451))

(assert (=> b!194745 m!220231))

(declare-fun m!221453 () Bool)

(assert (=> b!194745 m!221453))

(assert (=> b!194745 m!221453))

(declare-fun m!221455 () Bool)

(assert (=> b!194745 m!221455))

(assert (=> b!194747 m!220231))

(assert (=> b!194747 m!221453))

(assert (=> b!194747 m!221453))

(assert (=> b!194747 m!221455))

(assert (=> b!194295 d!56905))

(declare-fun d!56907 () Bool)

(assert (=> d!56907 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96627) lt!96640)) (v!4250 (getValueByKey!243 (toList!1225 lt!96627) lt!96640)))))

(assert (=> d!56625 d!56907))

(declare-fun b!194750 () Bool)

(declare-fun e!128089 () Option!249)

(assert (=> b!194750 (= e!128089 (getValueByKey!243 (t!7343 (toList!1225 lt!96627)) lt!96640))))

(declare-fun d!56909 () Bool)

(declare-fun c!35210 () Bool)

(assert (=> d!56909 (= c!35210 (and ((_ is Cons!2422) (toList!1225 lt!96627)) (= (_1!1766 (h!3063 (toList!1225 lt!96627))) lt!96640)))))

(declare-fun e!128088 () Option!249)

(assert (=> d!56909 (= (getValueByKey!243 (toList!1225 lt!96627) lt!96640) e!128088)))

(declare-fun b!194748 () Bool)

(assert (=> b!194748 (= e!128088 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96627)))))))

(declare-fun b!194749 () Bool)

(assert (=> b!194749 (= e!128088 e!128089)))

(declare-fun c!35211 () Bool)

(assert (=> b!194749 (= c!35211 (and ((_ is Cons!2422) (toList!1225 lt!96627)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96627))) lt!96640))))))

(declare-fun b!194751 () Bool)

(assert (=> b!194751 (= e!128089 None!247)))

(assert (= (and d!56909 c!35210) b!194748))

(assert (= (and d!56909 (not c!35210)) b!194749))

(assert (= (and b!194749 c!35211) b!194750))

(assert (= (and b!194749 (not c!35211)) b!194751))

(declare-fun m!221457 () Bool)

(assert (=> b!194750 m!221457))

(assert (=> d!56625 d!56909))

(declare-fun b!194754 () Bool)

(declare-fun e!128091 () Option!249)

(assert (=> b!194754 (= e!128091 (getValueByKey!243 (t!7343 (toList!1225 lt!96923)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun d!56911 () Bool)

(declare-fun c!35212 () Bool)

(assert (=> d!56911 (= c!35212 (and ((_ is Cons!2422) (toList!1225 lt!96923)) (= (_1!1766 (h!3063 (toList!1225 lt!96923))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128090 () Option!249)

(assert (=> d!56911 (= (getValueByKey!243 (toList!1225 lt!96923) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128090)))

(declare-fun b!194752 () Bool)

(assert (=> b!194752 (= e!128090 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96923)))))))

(declare-fun b!194753 () Bool)

(assert (=> b!194753 (= e!128090 e!128091)))

(declare-fun c!35213 () Bool)

(assert (=> b!194753 (= c!35213 (and ((_ is Cons!2422) (toList!1225 lt!96923)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96923))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194755 () Bool)

(assert (=> b!194755 (= e!128091 None!247)))

(assert (= (and d!56911 c!35212) b!194752))

(assert (= (and d!56911 (not c!35212)) b!194753))

(assert (= (and b!194753 c!35213) b!194754))

(assert (= (and b!194753 (not c!35213)) b!194755))

(declare-fun m!221459 () Bool)

(assert (=> b!194754 m!221459))

(assert (=> b!194481 d!56911))

(assert (=> b!194223 d!56733))

(declare-fun d!56913 () Bool)

(declare-fun e!128093 () Bool)

(assert (=> d!56913 e!128093))

(declare-fun res!91961 () Bool)

(assert (=> d!56913 (=> res!91961 e!128093)))

(declare-fun lt!97021 () Bool)

(assert (=> d!56913 (= res!91961 (not lt!97021))))

(declare-fun lt!97022 () Bool)

(assert (=> d!56913 (= lt!97021 lt!97022)))

(declare-fun lt!97020 () Unit!5819)

(declare-fun e!128092 () Unit!5819)

(assert (=> d!56913 (= lt!97020 e!128092)))

(declare-fun c!35214 () Bool)

(assert (=> d!56913 (= c!35214 lt!97022)))

(assert (=> d!56913 (= lt!97022 (containsKey!247 (toList!1225 lt!96817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56913 (= (contains!1356 lt!96817 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97021)))

(declare-fun b!194756 () Bool)

(declare-fun lt!97019 () Unit!5819)

(assert (=> b!194756 (= e!128092 lt!97019)))

(assert (=> b!194756 (= lt!97019 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194756 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96817) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194757 () Bool)

(declare-fun Unit!5860 () Unit!5819)

(assert (=> b!194757 (= e!128092 Unit!5860)))

(declare-fun b!194758 () Bool)

(assert (=> b!194758 (= e!128093 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56913 c!35214) b!194756))

(assert (= (and d!56913 (not c!35214)) b!194757))

(assert (= (and d!56913 (not res!91961)) b!194758))

(declare-fun m!221461 () Bool)

(assert (=> d!56913 m!221461))

(declare-fun m!221463 () Bool)

(assert (=> b!194756 m!221463))

(declare-fun m!221465 () Bool)

(assert (=> b!194756 m!221465))

(assert (=> b!194756 m!221465))

(declare-fun m!221467 () Bool)

(assert (=> b!194756 m!221467))

(assert (=> b!194758 m!221465))

(assert (=> b!194758 m!221465))

(assert (=> b!194758 m!221467))

(assert (=> bm!19655 d!56913))

(declare-fun d!56915 () Bool)

(assert (=> d!56915 (= (apply!188 lt!96777 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2232 (getValueByKey!243 (toList!1225 lt!96777) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7739 () Bool)

(assert (= bs!7739 d!56915))

(assert (=> bs!7739 m!220231))

(assert (=> bs!7739 m!221271))

(assert (=> bs!7739 m!221271))

(declare-fun m!221469 () Bool)

(assert (=> bs!7739 m!221469))

(assert (=> b!194268 d!56915))

(assert (=> b!194268 d!56609))

(declare-fun lt!97023 () Bool)

(declare-fun d!56917 () Bool)

(assert (=> d!56917 (= lt!97023 (select (content!155 (toList!1225 lt!96913)) (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))

(declare-fun e!128094 () Bool)

(assert (=> d!56917 (= lt!97023 e!128094)))

(declare-fun res!91963 () Bool)

(assert (=> d!56917 (=> (not res!91963) (not e!128094))))

(assert (=> d!56917 (= res!91963 ((_ is Cons!2422) (toList!1225 lt!96913)))))

(assert (=> d!56917 (= (contains!1359 (toList!1225 lt!96913) (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) lt!97023)))

(declare-fun b!194759 () Bool)

(declare-fun e!128095 () Bool)

(assert (=> b!194759 (= e!128094 e!128095)))

(declare-fun res!91962 () Bool)

(assert (=> b!194759 (=> res!91962 e!128095)))

(assert (=> b!194759 (= res!91962 (= (h!3063 (toList!1225 lt!96913)) (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))

(declare-fun b!194760 () Bool)

(assert (=> b!194760 (= e!128095 (contains!1359 (t!7343 (toList!1225 lt!96913)) (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!56917 res!91963) b!194759))

(assert (= (and b!194759 (not res!91962)) b!194760))

(declare-fun m!221471 () Bool)

(assert (=> d!56917 m!221471))

(declare-fun m!221473 () Bool)

(assert (=> d!56917 m!221473))

(declare-fun m!221475 () Bool)

(assert (=> b!194760 m!221475))

(assert (=> b!194476 d!56917))

(declare-fun b!194763 () Bool)

(declare-fun e!128097 () Option!249)

(assert (=> b!194763 (= e!128097 (getValueByKey!243 (t!7343 (t!7343 lt!96665)) (_1!1766 lt!96460)))))

(declare-fun d!56919 () Bool)

(declare-fun c!35215 () Bool)

(assert (=> d!56919 (= c!35215 (and ((_ is Cons!2422) (t!7343 lt!96665)) (= (_1!1766 (h!3063 (t!7343 lt!96665))) (_1!1766 lt!96460))))))

(declare-fun e!128096 () Option!249)

(assert (=> d!56919 (= (getValueByKey!243 (t!7343 lt!96665) (_1!1766 lt!96460)) e!128096)))

(declare-fun b!194761 () Bool)

(assert (=> b!194761 (= e!128096 (Some!248 (_2!1766 (h!3063 (t!7343 lt!96665)))))))

(declare-fun b!194762 () Bool)

(assert (=> b!194762 (= e!128096 e!128097)))

(declare-fun c!35216 () Bool)

(assert (=> b!194762 (= c!35216 (and ((_ is Cons!2422) (t!7343 lt!96665)) (not (= (_1!1766 (h!3063 (t!7343 lt!96665))) (_1!1766 lt!96460)))))))

(declare-fun b!194764 () Bool)

(assert (=> b!194764 (= e!128097 None!247)))

(assert (= (and d!56919 c!35215) b!194761))

(assert (= (and d!56919 (not c!35215)) b!194762))

(assert (= (and b!194762 c!35216) b!194763))

(assert (= (and b!194762 (not c!35216)) b!194764))

(declare-fun m!221477 () Bool)

(assert (=> b!194763 m!221477))

(assert (=> b!194117 d!56919))

(declare-fun d!56921 () Bool)

(declare-fun res!91964 () Bool)

(declare-fun e!128098 () Bool)

(assert (=> d!56921 (=> res!91964 e!128098)))

(assert (=> d!56921 (= res!91964 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (= (_1!1766 (h!3063 (toList!1225 lt!96632))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56921 (= (containsKey!247 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) e!128098)))

(declare-fun b!194765 () Bool)

(declare-fun e!128099 () Bool)

(assert (=> b!194765 (= e!128098 e!128099)))

(declare-fun res!91965 () Bool)

(assert (=> b!194765 (=> (not res!91965) (not e!128099))))

(assert (=> b!194765 (= res!91965 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96632))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96632))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2422) (toList!1225 lt!96632)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96632))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!194766 () Bool)

(assert (=> b!194766 (= e!128099 (containsKey!247 (t!7343 (toList!1225 lt!96632)) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56921 (not res!91964)) b!194765))

(assert (= (and b!194765 res!91965) b!194766))

(assert (=> b!194766 m!220231))

(declare-fun m!221479 () Bool)

(assert (=> b!194766 m!221479))

(assert (=> d!56663 d!56921))

(assert (=> b!194190 d!56887))

(assert (=> d!56699 d!56685))

(declare-fun d!56923 () Bool)

(declare-fun e!128101 () Bool)

(assert (=> d!56923 e!128101))

(declare-fun res!91966 () Bool)

(assert (=> d!56923 (=> res!91966 e!128101)))

(declare-fun lt!97026 () Bool)

(assert (=> d!56923 (= res!91966 (not lt!97026))))

(declare-fun lt!97027 () Bool)

(assert (=> d!56923 (= lt!97026 lt!97027)))

(declare-fun lt!97025 () Unit!5819)

(declare-fun e!128100 () Unit!5819)

(assert (=> d!56923 (= lt!97025 e!128100)))

(declare-fun c!35217 () Bool)

(assert (=> d!56923 (= c!35217 lt!97027)))

(assert (=> d!56923 (= lt!97027 (containsKey!247 (toList!1225 lt!96611) lt!96608))))

(assert (=> d!56923 (= (contains!1356 lt!96611 lt!96608) lt!97026)))

(declare-fun b!194767 () Bool)

(declare-fun lt!97024 () Unit!5819)

(assert (=> b!194767 (= e!128100 lt!97024)))

(assert (=> b!194767 (= lt!97024 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96611) lt!96608))))

(assert (=> b!194767 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96611) lt!96608))))

(declare-fun b!194768 () Bool)

(declare-fun Unit!5861 () Unit!5819)

(assert (=> b!194768 (= e!128100 Unit!5861)))

(declare-fun b!194769 () Bool)

(assert (=> b!194769 (= e!128101 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96611) lt!96608)))))

(assert (= (and d!56923 c!35217) b!194767))

(assert (= (and d!56923 (not c!35217)) b!194768))

(assert (= (and d!56923 (not res!91966)) b!194769))

(declare-fun m!221481 () Bool)

(assert (=> d!56923 m!221481))

(declare-fun m!221483 () Bool)

(assert (=> b!194767 m!221483))

(assert (=> b!194767 m!221011))

(assert (=> b!194767 m!221011))

(declare-fun m!221485 () Bool)

(assert (=> b!194767 m!221485))

(assert (=> b!194769 m!221011))

(assert (=> b!194769 m!221011))

(assert (=> b!194769 m!221485))

(assert (=> d!56699 d!56923))

(declare-fun d!56925 () Bool)

(assert (=> d!56925 (= (apply!188 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) lt!96608) (apply!188 lt!96611 lt!96608))))

(assert (=> d!56925 true))

(declare-fun _$34!1091 () Unit!5819)

(assert (=> d!56925 (= (choose!1076 lt!96611 lt!96619 (minValue!3800 thiss!1248) lt!96608) _$34!1091)))

(declare-fun bs!7740 () Bool)

(assert (= bs!7740 d!56925))

(assert (=> bs!7740 m!220265))

(assert (=> bs!7740 m!220265))

(assert (=> bs!7740 m!220267))

(assert (=> bs!7740 m!220277))

(assert (=> d!56699 d!56925))

(assert (=> d!56699 d!56705))

(assert (=> d!56699 d!56709))

(declare-fun d!56927 () Bool)

(assert (=> d!56927 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96663) (_1!1766 lt!96460)))))

(declare-fun lt!97028 () Unit!5819)

(assert (=> d!56927 (= lt!97028 (choose!1075 (toList!1225 lt!96663) (_1!1766 lt!96460)))))

(declare-fun e!128102 () Bool)

(assert (=> d!56927 e!128102))

(declare-fun res!91967 () Bool)

(assert (=> d!56927 (=> (not res!91967) (not e!128102))))

(assert (=> d!56927 (= res!91967 (isStrictlySorted!352 (toList!1225 lt!96663)))))

(assert (=> d!56927 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96663) (_1!1766 lt!96460)) lt!97028)))

(declare-fun b!194770 () Bool)

(assert (=> b!194770 (= e!128102 (containsKey!247 (toList!1225 lt!96663) (_1!1766 lt!96460)))))

(assert (= (and d!56927 res!91967) b!194770))

(assert (=> d!56927 m!220361))

(assert (=> d!56927 m!220361))

(assert (=> d!56927 m!220479))

(declare-fun m!221487 () Bool)

(assert (=> d!56927 m!221487))

(declare-fun m!221489 () Bool)

(assert (=> d!56927 m!221489))

(assert (=> b!194770 m!220475))

(assert (=> b!194112 d!56927))

(assert (=> b!194112 d!56827))

(assert (=> b!194112 d!56587))

(declare-fun b!194773 () Bool)

(declare-fun e!128104 () Option!249)

(assert (=> b!194773 (= e!128104 (getValueByKey!243 (t!7343 (t!7343 (toList!1225 lt!96454))) key!828))))

(declare-fun d!56929 () Bool)

(declare-fun c!35218 () Bool)

(assert (=> d!56929 (= c!35218 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96454))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96454)))) key!828)))))

(declare-fun e!128103 () Option!249)

(assert (=> d!56929 (= (getValueByKey!243 (t!7343 (toList!1225 lt!96454)) key!828) e!128103)))

(declare-fun b!194771 () Bool)

(assert (=> b!194771 (= e!128103 (Some!248 (_2!1766 (h!3063 (t!7343 (toList!1225 lt!96454))))))))

(declare-fun b!194772 () Bool)

(assert (=> b!194772 (= e!128103 e!128104)))

(declare-fun c!35219 () Bool)

(assert (=> b!194772 (= c!35219 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96454))) (not (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96454)))) key!828))))))

(declare-fun b!194774 () Bool)

(assert (=> b!194774 (= e!128104 None!247)))

(assert (= (and d!56929 c!35218) b!194771))

(assert (= (and d!56929 (not c!35218)) b!194772))

(assert (= (and b!194772 c!35219) b!194773))

(assert (= (and b!194772 (not c!35219)) b!194774))

(declare-fun m!221491 () Bool)

(assert (=> b!194773 m!221491))

(assert (=> b!194459 d!56929))

(declare-fun d!56931 () Bool)

(declare-fun lt!97031 () Bool)

(declare-fun content!156 (List!2429) (InoxSet (_ BitVec 64)))

(assert (=> d!56931 (= lt!97031 (select (content!156 Nil!2426) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128109 () Bool)

(assert (=> d!56931 (= lt!97031 e!128109)))

(declare-fun res!91972 () Bool)

(assert (=> d!56931 (=> (not res!91972) (not e!128109))))

(assert (=> d!56931 (= res!91972 ((_ is Cons!2425) Nil!2426))))

(assert (=> d!56931 (= (contains!1360 Nil!2426 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!97031)))

(declare-fun b!194779 () Bool)

(declare-fun e!128110 () Bool)

(assert (=> b!194779 (= e!128109 e!128110)))

(declare-fun res!91973 () Bool)

(assert (=> b!194779 (=> res!91973 e!128110)))

(assert (=> b!194779 (= res!91973 (= (h!3066 Nil!2426) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194780 () Bool)

(assert (=> b!194780 (= e!128110 (contains!1360 (t!7348 Nil!2426) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56931 res!91972) b!194779))

(assert (= (and b!194779 (not res!91973)) b!194780))

(declare-fun m!221493 () Bool)

(assert (=> d!56931 m!221493))

(assert (=> d!56931 m!220231))

(declare-fun m!221495 () Bool)

(assert (=> d!56931 m!221495))

(assert (=> b!194780 m!220231))

(declare-fun m!221497 () Bool)

(assert (=> b!194780 m!221497))

(assert (=> b!194483 d!56931))

(assert (=> b!194484 d!56539))

(declare-fun d!56933 () Bool)

(declare-fun e!128111 () Bool)

(assert (=> d!56933 e!128111))

(declare-fun res!91974 () Bool)

(assert (=> d!56933 (=> (not res!91974) (not e!128111))))

(declare-fun lt!97032 () ListLongMap!2419)

(assert (=> d!56933 (= res!91974 (contains!1356 lt!97032 (_1!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))))))

(declare-fun lt!97034 () List!2426)

(assert (=> d!56933 (= lt!97032 (ListLongMap!2420 lt!97034))))

(declare-fun lt!97035 () Unit!5819)

(declare-fun lt!97033 () Unit!5819)

(assert (=> d!56933 (= lt!97035 lt!97033)))

(assert (=> d!56933 (= (getValueByKey!243 lt!97034 (_1!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))))))

(assert (=> d!56933 (= lt!97033 (lemmaContainsTupThenGetReturnValue!133 lt!97034 (_1!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))))))

(assert (=> d!56933 (= lt!97034 (insertStrictlySorted!136 (toList!1225 lt!96824) (_1!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))))))

(assert (=> d!56933 (= (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))) lt!97032)))

(declare-fun b!194781 () Bool)

(declare-fun res!91975 () Bool)

(assert (=> b!194781 (=> (not res!91975) (not e!128111))))

(assert (=> b!194781 (= res!91975 (= (getValueByKey!243 (toList!1225 lt!97032) (_1!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))))))))

(declare-fun b!194782 () Bool)

(assert (=> b!194782 (= e!128111 (contains!1359 (toList!1225 lt!97032) (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))))))

(assert (= (and d!56933 res!91974) b!194781))

(assert (= (and b!194781 res!91975) b!194782))

(declare-fun m!221499 () Bool)

(assert (=> d!56933 m!221499))

(declare-fun m!221501 () Bool)

(assert (=> d!56933 m!221501))

(declare-fun m!221503 () Bool)

(assert (=> d!56933 m!221503))

(declare-fun m!221505 () Bool)

(assert (=> d!56933 m!221505))

(declare-fun m!221507 () Bool)

(assert (=> b!194781 m!221507))

(declare-fun m!221509 () Bool)

(assert (=> b!194782 m!221509))

(assert (=> b!194320 d!56933))

(declare-fun d!56935 () Bool)

(assert (=> d!56935 (= (apply!188 lt!96818 lt!96815) (get!2232 (getValueByKey!243 (toList!1225 lt!96818) lt!96815)))))

(declare-fun bs!7741 () Bool)

(assert (= bs!7741 d!56935))

(declare-fun m!221511 () Bool)

(assert (=> bs!7741 m!221511))

(assert (=> bs!7741 m!221511))

(declare-fun m!221513 () Bool)

(assert (=> bs!7741 m!221513))

(assert (=> b!194320 d!56935))

(declare-fun d!56937 () Bool)

(assert (=> d!56937 (= (apply!188 (+!317 lt!96812 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))) lt!96825) (apply!188 lt!96812 lt!96825))))

(declare-fun lt!97036 () Unit!5819)

(assert (=> d!56937 (= lt!97036 (choose!1076 lt!96812 lt!96827 (zeroValue!3800 lt!96455) lt!96825))))

(declare-fun e!128112 () Bool)

(assert (=> d!56937 e!128112))

(declare-fun res!91976 () Bool)

(assert (=> d!56937 (=> (not res!91976) (not e!128112))))

(assert (=> d!56937 (= res!91976 (contains!1356 lt!96812 lt!96825))))

(assert (=> d!56937 (= (addApplyDifferent!164 lt!96812 lt!96827 (zeroValue!3800 lt!96455) lt!96825) lt!97036)))

(declare-fun b!194783 () Bool)

(assert (=> b!194783 (= e!128112 (not (= lt!96825 lt!96827)))))

(assert (= (and d!56937 res!91976) b!194783))

(assert (=> d!56937 m!220733))

(assert (=> d!56937 m!220735))

(assert (=> d!56937 m!220743))

(declare-fun m!221515 () Bool)

(assert (=> d!56937 m!221515))

(declare-fun m!221517 () Bool)

(assert (=> d!56937 m!221517))

(assert (=> d!56937 m!220733))

(assert (=> b!194320 d!56937))

(declare-fun d!56939 () Bool)

(assert (=> d!56939 (= (apply!188 (+!317 lt!96812 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))) lt!96825) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96812 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))) lt!96825)))))

(declare-fun bs!7742 () Bool)

(assert (= bs!7742 d!56939))

(declare-fun m!221519 () Bool)

(assert (=> bs!7742 m!221519))

(assert (=> bs!7742 m!221519))

(declare-fun m!221521 () Bool)

(assert (=> bs!7742 m!221521))

(assert (=> b!194320 d!56939))

(declare-fun d!56941 () Bool)

(assert (=> d!56941 (= (apply!188 (+!317 lt!96813 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))) lt!96828) (apply!188 lt!96813 lt!96828))))

(declare-fun lt!97037 () Unit!5819)

(assert (=> d!56941 (= lt!97037 (choose!1076 lt!96813 lt!96816 (minValue!3800 lt!96455) lt!96828))))

(declare-fun e!128113 () Bool)

(assert (=> d!56941 e!128113))

(declare-fun res!91977 () Bool)

(assert (=> d!56941 (=> (not res!91977) (not e!128113))))

(assert (=> d!56941 (= res!91977 (contains!1356 lt!96813 lt!96828))))

(assert (=> d!56941 (= (addApplyDifferent!164 lt!96813 lt!96816 (minValue!3800 lt!96455) lt!96828) lt!97037)))

(declare-fun b!194784 () Bool)

(assert (=> b!194784 (= e!128113 (not (= lt!96828 lt!96816)))))

(assert (= (and d!56941 res!91977) b!194784))

(assert (=> d!56941 m!220741))

(assert (=> d!56941 m!220753))

(assert (=> d!56941 m!220749))

(declare-fun m!221523 () Bool)

(assert (=> d!56941 m!221523))

(declare-fun m!221525 () Bool)

(assert (=> d!56941 m!221525))

(assert (=> d!56941 m!220741))

(assert (=> b!194320 d!56941))

(declare-fun d!56943 () Bool)

(assert (=> d!56943 (= (apply!188 lt!96812 lt!96825) (get!2232 (getValueByKey!243 (toList!1225 lt!96812) lt!96825)))))

(declare-fun bs!7743 () Bool)

(assert (= bs!7743 d!56943))

(declare-fun m!221527 () Bool)

(assert (=> bs!7743 m!221527))

(assert (=> bs!7743 m!221527))

(declare-fun m!221529 () Bool)

(assert (=> bs!7743 m!221529))

(assert (=> b!194320 d!56943))

(declare-fun d!56945 () Bool)

(assert (=> d!56945 (= (apply!188 (+!317 lt!96818 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))) lt!96815) (apply!188 lt!96818 lt!96815))))

(declare-fun lt!97038 () Unit!5819)

(assert (=> d!56945 (= lt!97038 (choose!1076 lt!96818 lt!96826 (minValue!3800 lt!96455) lt!96815))))

(declare-fun e!128114 () Bool)

(assert (=> d!56945 e!128114))

(declare-fun res!91978 () Bool)

(assert (=> d!56945 (=> (not res!91978) (not e!128114))))

(assert (=> d!56945 (= res!91978 (contains!1356 lt!96818 lt!96815))))

(assert (=> d!56945 (= (addApplyDifferent!164 lt!96818 lt!96826 (minValue!3800 lt!96455) lt!96815) lt!97038)))

(declare-fun b!194785 () Bool)

(assert (=> b!194785 (= e!128114 (not (= lt!96815 lt!96826)))))

(assert (= (and d!56945 res!91978) b!194785))

(assert (=> d!56945 m!220745))

(assert (=> d!56945 m!220747))

(assert (=> d!56945 m!220757))

(declare-fun m!221531 () Bool)

(assert (=> d!56945 m!221531))

(declare-fun m!221533 () Bool)

(assert (=> d!56945 m!221533))

(assert (=> d!56945 m!220745))

(assert (=> b!194320 d!56945))

(declare-fun d!56947 () Bool)

(declare-fun e!128115 () Bool)

(assert (=> d!56947 e!128115))

(declare-fun res!91979 () Bool)

(assert (=> d!56947 (=> (not res!91979) (not e!128115))))

(declare-fun lt!97039 () ListLongMap!2419)

(assert (=> d!56947 (= res!91979 (contains!1356 lt!97039 (_1!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))))))

(declare-fun lt!97041 () List!2426)

(assert (=> d!56947 (= lt!97039 (ListLongMap!2420 lt!97041))))

(declare-fun lt!97042 () Unit!5819)

(declare-fun lt!97040 () Unit!5819)

(assert (=> d!56947 (= lt!97042 lt!97040)))

(assert (=> d!56947 (= (getValueByKey!243 lt!97041 (_1!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))))))

(assert (=> d!56947 (= lt!97040 (lemmaContainsTupThenGetReturnValue!133 lt!97041 (_1!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))))))

(assert (=> d!56947 (= lt!97041 (insertStrictlySorted!136 (toList!1225 lt!96812) (_1!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))))))

(assert (=> d!56947 (= (+!317 lt!96812 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))) lt!97039)))

(declare-fun b!194786 () Bool)

(declare-fun res!91980 () Bool)

(assert (=> b!194786 (=> (not res!91980) (not e!128115))))

(assert (=> b!194786 (= res!91980 (= (getValueByKey!243 (toList!1225 lt!97039) (_1!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))))))))

(declare-fun b!194787 () Bool)

(assert (=> b!194787 (= e!128115 (contains!1359 (toList!1225 lt!97039) (tuple2!3511 lt!96827 (zeroValue!3800 lt!96455))))))

(assert (= (and d!56947 res!91979) b!194786))

(assert (= (and b!194786 res!91980) b!194787))

(declare-fun m!221535 () Bool)

(assert (=> d!56947 m!221535))

(declare-fun m!221537 () Bool)

(assert (=> d!56947 m!221537))

(declare-fun m!221539 () Bool)

(assert (=> d!56947 m!221539))

(declare-fun m!221541 () Bool)

(assert (=> d!56947 m!221541))

(declare-fun m!221543 () Bool)

(assert (=> b!194786 m!221543))

(declare-fun m!221545 () Bool)

(assert (=> b!194787 m!221545))

(assert (=> b!194320 d!56947))

(declare-fun d!56949 () Bool)

(declare-fun e!128116 () Bool)

(assert (=> d!56949 e!128116))

(declare-fun res!91981 () Bool)

(assert (=> d!56949 (=> (not res!91981) (not e!128116))))

(declare-fun lt!97043 () ListLongMap!2419)

(assert (=> d!56949 (= res!91981 (contains!1356 lt!97043 (_1!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))))))

(declare-fun lt!97045 () List!2426)

(assert (=> d!56949 (= lt!97043 (ListLongMap!2420 lt!97045))))

(declare-fun lt!97046 () Unit!5819)

(declare-fun lt!97044 () Unit!5819)

(assert (=> d!56949 (= lt!97046 lt!97044)))

(assert (=> d!56949 (= (getValueByKey!243 lt!97045 (_1!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))))))

(assert (=> d!56949 (= lt!97044 (lemmaContainsTupThenGetReturnValue!133 lt!97045 (_1!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))))))

(assert (=> d!56949 (= lt!97045 (insertStrictlySorted!136 (toList!1225 lt!96813) (_1!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))))))

(assert (=> d!56949 (= (+!317 lt!96813 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))) lt!97043)))

(declare-fun b!194788 () Bool)

(declare-fun res!91982 () Bool)

(assert (=> b!194788 (=> (not res!91982) (not e!128116))))

(assert (=> b!194788 (= res!91982 (= (getValueByKey!243 (toList!1225 lt!97043) (_1!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))))))))

(declare-fun b!194789 () Bool)

(assert (=> b!194789 (= e!128116 (contains!1359 (toList!1225 lt!97043) (tuple2!3511 lt!96816 (minValue!3800 lt!96455))))))

(assert (= (and d!56949 res!91981) b!194788))

(assert (= (and b!194788 res!91982) b!194789))

(declare-fun m!221547 () Bool)

(assert (=> d!56949 m!221547))

(declare-fun m!221549 () Bool)

(assert (=> d!56949 m!221549))

(declare-fun m!221551 () Bool)

(assert (=> d!56949 m!221551))

(declare-fun m!221553 () Bool)

(assert (=> d!56949 m!221553))

(declare-fun m!221555 () Bool)

(assert (=> b!194788 m!221555))

(declare-fun m!221557 () Bool)

(assert (=> b!194789 m!221557))

(assert (=> b!194320 d!56949))

(declare-fun d!56951 () Bool)

(assert (=> d!56951 (= (apply!188 (+!317 lt!96818 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))) lt!96815) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96818 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))) lt!96815)))))

(declare-fun bs!7744 () Bool)

(assert (= bs!7744 d!56951))

(declare-fun m!221559 () Bool)

(assert (=> bs!7744 m!221559))

(assert (=> bs!7744 m!221559))

(declare-fun m!221561 () Bool)

(assert (=> bs!7744 m!221561))

(assert (=> b!194320 d!56951))

(declare-fun d!56953 () Bool)

(declare-fun e!128117 () Bool)

(assert (=> d!56953 e!128117))

(declare-fun res!91983 () Bool)

(assert (=> d!56953 (=> (not res!91983) (not e!128117))))

(declare-fun lt!97047 () ListLongMap!2419)

(assert (=> d!56953 (= res!91983 (contains!1356 lt!97047 (_1!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))))))

(declare-fun lt!97049 () List!2426)

(assert (=> d!56953 (= lt!97047 (ListLongMap!2420 lt!97049))))

(declare-fun lt!97050 () Unit!5819)

(declare-fun lt!97048 () Unit!5819)

(assert (=> d!56953 (= lt!97050 lt!97048)))

(assert (=> d!56953 (= (getValueByKey!243 lt!97049 (_1!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))))))

(assert (=> d!56953 (= lt!97048 (lemmaContainsTupThenGetReturnValue!133 lt!97049 (_1!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))))))

(assert (=> d!56953 (= lt!97049 (insertStrictlySorted!136 (toList!1225 lt!96818) (_1!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))) (_2!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))))))

(assert (=> d!56953 (= (+!317 lt!96818 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))) lt!97047)))

(declare-fun b!194790 () Bool)

(declare-fun res!91984 () Bool)

(assert (=> b!194790 (=> (not res!91984) (not e!128117))))

(assert (=> b!194790 (= res!91984 (= (getValueByKey!243 (toList!1225 lt!97047) (_1!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 lt!96826 (minValue!3800 lt!96455))))))))

(declare-fun b!194791 () Bool)

(assert (=> b!194791 (= e!128117 (contains!1359 (toList!1225 lt!97047) (tuple2!3511 lt!96826 (minValue!3800 lt!96455))))))

(assert (= (and d!56953 res!91983) b!194790))

(assert (= (and b!194790 res!91984) b!194791))

(declare-fun m!221563 () Bool)

(assert (=> d!56953 m!221563))

(declare-fun m!221565 () Bool)

(assert (=> d!56953 m!221565))

(declare-fun m!221567 () Bool)

(assert (=> d!56953 m!221567))

(declare-fun m!221569 () Bool)

(assert (=> d!56953 m!221569))

(declare-fun m!221571 () Bool)

(assert (=> b!194790 m!221571))

(declare-fun m!221573 () Bool)

(assert (=> b!194791 m!221573))

(assert (=> b!194320 d!56953))

(declare-fun d!56955 () Bool)

(assert (=> d!56955 (= (apply!188 (+!317 lt!96813 (tuple2!3511 lt!96816 (minValue!3800 lt!96455))) lt!96828) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96813 (tuple2!3511 lt!96816 (minValue!3800 lt!96455)))) lt!96828)))))

(declare-fun bs!7745 () Bool)

(assert (= bs!7745 d!56955))

(declare-fun m!221575 () Bool)

(assert (=> bs!7745 m!221575))

(assert (=> bs!7745 m!221575))

(declare-fun m!221577 () Bool)

(assert (=> bs!7745 m!221577))

(assert (=> b!194320 d!56955))

(declare-fun d!56957 () Bool)

(declare-fun e!128119 () Bool)

(assert (=> d!56957 e!128119))

(declare-fun res!91985 () Bool)

(assert (=> d!56957 (=> res!91985 e!128119)))

(declare-fun lt!97053 () Bool)

(assert (=> d!56957 (= res!91985 (not lt!97053))))

(declare-fun lt!97054 () Bool)

(assert (=> d!56957 (= lt!97053 lt!97054)))

(declare-fun lt!97052 () Unit!5819)

(declare-fun e!128118 () Unit!5819)

(assert (=> d!56957 (= lt!97052 e!128118)))

(declare-fun c!35220 () Bool)

(assert (=> d!56957 (= c!35220 lt!97054)))

(assert (=> d!56957 (= lt!97054 (containsKey!247 (toList!1225 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))) lt!96814))))

(assert (=> d!56957 (= (contains!1356 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))) lt!96814) lt!97053)))

(declare-fun b!194792 () Bool)

(declare-fun lt!97051 () Unit!5819)

(assert (=> b!194792 (= e!128118 lt!97051)))

(assert (=> b!194792 (= lt!97051 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))) lt!96814))))

(assert (=> b!194792 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))) lt!96814))))

(declare-fun b!194793 () Bool)

(declare-fun Unit!5862 () Unit!5819)

(assert (=> b!194793 (= e!128118 Unit!5862)))

(declare-fun b!194794 () Bool)

(assert (=> b!194794 (= e!128119 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455)))) lt!96814)))))

(assert (= (and d!56957 c!35220) b!194792))

(assert (= (and d!56957 (not c!35220)) b!194793))

(assert (= (and d!56957 (not res!91985)) b!194794))

(declare-fun m!221579 () Bool)

(assert (=> d!56957 m!221579))

(declare-fun m!221581 () Bool)

(assert (=> b!194792 m!221581))

(declare-fun m!221583 () Bool)

(assert (=> b!194792 m!221583))

(assert (=> b!194792 m!221583))

(declare-fun m!221585 () Bool)

(assert (=> b!194792 m!221585))

(assert (=> b!194794 m!221583))

(assert (=> b!194794 m!221583))

(assert (=> b!194794 m!221585))

(assert (=> b!194320 d!56957))

(declare-fun d!56959 () Bool)

(assert (=> d!56959 (= (apply!188 lt!96813 lt!96828) (get!2232 (getValueByKey!243 (toList!1225 lt!96813) lt!96828)))))

(declare-fun bs!7746 () Bool)

(assert (= bs!7746 d!56959))

(declare-fun m!221587 () Bool)

(assert (=> bs!7746 m!221587))

(assert (=> bs!7746 m!221587))

(declare-fun m!221589 () Bool)

(assert (=> bs!7746 m!221589))

(assert (=> b!194320 d!56959))

(declare-fun d!56961 () Bool)

(assert (=> d!56961 (contains!1356 (+!317 lt!96824 (tuple2!3511 lt!96822 (zeroValue!3800 lt!96455))) lt!96814)))

(declare-fun lt!97055 () Unit!5819)

(assert (=> d!56961 (= lt!97055 (choose!1077 lt!96824 lt!96822 (zeroValue!3800 lt!96455) lt!96814))))

(assert (=> d!56961 (contains!1356 lt!96824 lt!96814)))

(assert (=> d!56961 (= (addStillContains!164 lt!96824 lt!96822 (zeroValue!3800 lt!96455) lt!96814) lt!97055)))

(declare-fun bs!7747 () Bool)

(assert (= bs!7747 d!56961))

(assert (=> bs!7747 m!220737))

(assert (=> bs!7747 m!220737))

(assert (=> bs!7747 m!220739))

(declare-fun m!221591 () Bool)

(assert (=> bs!7747 m!221591))

(declare-fun m!221593 () Bool)

(assert (=> bs!7747 m!221593))

(assert (=> b!194320 d!56961))

(declare-fun d!56963 () Bool)

(declare-fun e!128125 () Bool)

(assert (=> d!56963 e!128125))

(declare-fun res!91986 () Bool)

(assert (=> d!56963 (=> (not res!91986) (not e!128125))))

(declare-fun lt!97061 () ListLongMap!2419)

(assert (=> d!56963 (= res!91986 (not (contains!1356 lt!97061 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128121 () ListLongMap!2419)

(assert (=> d!56963 (= lt!97061 e!128121)))

(declare-fun c!35223 () Bool)

(assert (=> d!56963 (= c!35223 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56963 (validMask!0 (mask!9221 lt!96455))))

(assert (=> d!56963 (= (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) #b00000000000000000000000000000000 (defaultEntry!3959 lt!96455)) lt!97061)))

(declare-fun b!194795 () Bool)

(declare-fun lt!97056 () Unit!5819)

(declare-fun lt!97057 () Unit!5819)

(assert (=> b!194795 (= lt!97056 lt!97057)))

(declare-fun lt!97060 () V!5633)

(declare-fun lt!97058 () (_ BitVec 64))

(declare-fun lt!97059 () (_ BitVec 64))

(declare-fun lt!97062 () ListLongMap!2419)

(assert (=> b!194795 (not (contains!1356 (+!317 lt!97062 (tuple2!3511 lt!97059 lt!97060)) lt!97058))))

(assert (=> b!194795 (= lt!97057 (addStillNotContains!98 lt!97062 lt!97059 lt!97060 lt!97058))))

(assert (=> b!194795 (= lt!97058 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194795 (= lt!97060 (get!2231 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194795 (= lt!97059 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))

(declare-fun call!19686 () ListLongMap!2419)

(assert (=> b!194795 (= lt!97062 call!19686)))

(declare-fun e!128126 () ListLongMap!2419)

(assert (=> b!194795 (= e!128126 (+!317 call!19686 (tuple2!3511 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194796 () Bool)

(declare-fun e!128120 () Bool)

(declare-fun e!128122 () Bool)

(assert (=> b!194796 (= e!128120 e!128122)))

(declare-fun c!35224 () Bool)

(assert (=> b!194796 (= c!35224 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!194797 () Bool)

(assert (=> b!194797 (= e!128122 (isEmpty!491 lt!97061))))

(declare-fun b!194798 () Bool)

(declare-fun e!128124 () Bool)

(assert (=> b!194798 (= e!128124 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (=> b!194798 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19683 () Bool)

(assert (=> bm!19683 (= call!19686 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 lt!96455)))))

(declare-fun b!194799 () Bool)

(assert (=> b!194799 (= e!128125 e!128120)))

(declare-fun c!35221 () Bool)

(assert (=> b!194799 (= c!35221 e!128124)))

(declare-fun res!91988 () Bool)

(assert (=> b!194799 (=> (not res!91988) (not e!128124))))

(assert (=> b!194799 (= res!91988 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!194800 () Bool)

(assert (=> b!194800 (= e!128121 (ListLongMap!2420 Nil!2423))))

(declare-fun b!194801 () Bool)

(assert (=> b!194801 (= e!128126 call!19686)))

(declare-fun b!194802 () Bool)

(assert (=> b!194802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(assert (=> b!194802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (_values!3942 lt!96455))))))

(declare-fun e!128123 () Bool)

(assert (=> b!194802 (= e!128123 (= (apply!188 lt!97061 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194803 () Bool)

(assert (=> b!194803 (= e!128120 e!128123)))

(assert (=> b!194803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 lt!96455))))))

(declare-fun res!91989 () Bool)

(assert (=> b!194803 (= res!91989 (contains!1356 lt!97061 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (=> b!194803 (=> (not res!91989) (not e!128123))))

(declare-fun b!194804 () Bool)

(declare-fun res!91987 () Bool)

(assert (=> b!194804 (=> (not res!91987) (not e!128125))))

(assert (=> b!194804 (= res!91987 (not (contains!1356 lt!97061 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194805 () Bool)

(assert (=> b!194805 (= e!128121 e!128126)))

(declare-fun c!35222 () Bool)

(assert (=> b!194805 (= c!35222 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!194806 () Bool)

(assert (=> b!194806 (= e!128122 (= lt!97061 (getCurrentListMapNoExtraKeys!209 (_keys!5952 lt!96455) (_values!3942 lt!96455) (mask!9221 lt!96455) (extraKeys!3696 lt!96455) (zeroValue!3800 lt!96455) (minValue!3800 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 lt!96455))))))

(assert (= (and d!56963 c!35223) b!194800))

(assert (= (and d!56963 (not c!35223)) b!194805))

(assert (= (and b!194805 c!35222) b!194795))

(assert (= (and b!194805 (not c!35222)) b!194801))

(assert (= (or b!194795 b!194801) bm!19683))

(assert (= (and d!56963 res!91986) b!194804))

(assert (= (and b!194804 res!91987) b!194799))

(assert (= (and b!194799 res!91988) b!194798))

(assert (= (and b!194799 c!35221) b!194803))

(assert (= (and b!194799 (not c!35221)) b!194796))

(assert (= (and b!194803 res!91989) b!194802))

(assert (= (and b!194796 c!35224) b!194806))

(assert (= (and b!194796 (not c!35224)) b!194797))

(declare-fun b_lambda!7495 () Bool)

(assert (=> (not b_lambda!7495) (not b!194795)))

(assert (=> b!194795 t!7350))

(declare-fun b_and!11431 () Bool)

(assert (= b_and!11429 (and (=> t!7350 result!4937) b_and!11431)))

(declare-fun b_lambda!7497 () Bool)

(assert (=> (not b_lambda!7497) (not b!194802)))

(assert (=> b!194802 t!7350))

(declare-fun b_and!11433 () Bool)

(assert (= b_and!11431 (and (=> t!7350 result!4937) b_and!11433)))

(assert (=> b!194798 m!220529))

(assert (=> b!194798 m!220529))

(assert (=> b!194798 m!220531))

(assert (=> b!194805 m!220529))

(assert (=> b!194805 m!220529))

(assert (=> b!194805 m!220531))

(declare-fun m!221595 () Bool)

(assert (=> b!194797 m!221595))

(assert (=> b!194803 m!220529))

(assert (=> b!194803 m!220529))

(declare-fun m!221597 () Bool)

(assert (=> b!194803 m!221597))

(declare-fun m!221599 () Bool)

(assert (=> b!194804 m!221599))

(declare-fun m!221601 () Bool)

(assert (=> bm!19683 m!221601))

(assert (=> b!194806 m!221601))

(assert (=> b!194795 m!220721))

(assert (=> b!194795 m!220723))

(assert (=> b!194795 m!220725))

(assert (=> b!194795 m!220529))

(declare-fun m!221603 () Bool)

(assert (=> b!194795 m!221603))

(assert (=> b!194795 m!220723))

(assert (=> b!194795 m!220721))

(declare-fun m!221605 () Bool)

(assert (=> b!194795 m!221605))

(declare-fun m!221607 () Bool)

(assert (=> b!194795 m!221607))

(declare-fun m!221609 () Bool)

(assert (=> b!194795 m!221609))

(assert (=> b!194795 m!221605))

(assert (=> b!194802 m!220721))

(assert (=> b!194802 m!220723))

(assert (=> b!194802 m!220725))

(assert (=> b!194802 m!220529))

(assert (=> b!194802 m!220529))

(declare-fun m!221611 () Bool)

(assert (=> b!194802 m!221611))

(assert (=> b!194802 m!220723))

(assert (=> b!194802 m!220721))

(declare-fun m!221613 () Bool)

(assert (=> d!56963 m!221613))

(assert (=> d!56963 m!220719))

(assert (=> b!194320 d!56963))

(assert (=> d!56669 d!56531))

(declare-fun d!56965 () Bool)

(declare-fun res!91990 () Bool)

(declare-fun e!128127 () Bool)

(assert (=> d!56965 (=> res!91990 e!128127)))

(assert (=> d!56965 (= res!91990 (and ((_ is Cons!2422) (toList!1225 lt!96671)) (= (_1!1766 (h!3063 (toList!1225 lt!96671))) (_1!1766 lt!96460))))))

(assert (=> d!56965 (= (containsKey!247 (toList!1225 lt!96671) (_1!1766 lt!96460)) e!128127)))

(declare-fun b!194807 () Bool)

(declare-fun e!128128 () Bool)

(assert (=> b!194807 (= e!128127 e!128128)))

(declare-fun res!91991 () Bool)

(assert (=> b!194807 (=> (not res!91991) (not e!128128))))

(assert (=> b!194807 (= res!91991 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96671))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96671))) (_1!1766 lt!96460))) ((_ is Cons!2422) (toList!1225 lt!96671)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96671))) (_1!1766 lt!96460))))))

(declare-fun b!194808 () Bool)

(assert (=> b!194808 (= e!128128 (containsKey!247 (t!7343 (toList!1225 lt!96671)) (_1!1766 lt!96460)))))

(assert (= (and d!56965 (not res!91990)) b!194807))

(assert (= (and b!194807 res!91991) b!194808))

(declare-fun m!221615 () Bool)

(assert (=> b!194808 m!221615))

(assert (=> d!56567 d!56965))

(declare-fun d!56967 () Bool)

(assert (=> d!56967 (= (size!4193 thiss!1248) (bvadd (_size!1404 thiss!1248) (bvsdiv (bvadd (extraKeys!3696 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!194387 d!56967))

(declare-fun b!194809 () Bool)

(declare-fun e!128130 () (_ BitVec 32))

(declare-fun call!19687 () (_ BitVec 32))

(assert (=> b!194809 (= e!128130 (bvadd #b00000000000000000000000000000001 call!19687))))

(declare-fun b!194811 () Bool)

(declare-fun e!128129 () (_ BitVec 32))

(assert (=> b!194811 (= e!128129 e!128130)))

(declare-fun c!35226 () Bool)

(assert (=> b!194811 (= c!35226 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194812 () Bool)

(assert (=> b!194812 (= e!128129 #b00000000000000000000000000000000)))

(declare-fun bm!19684 () Bool)

(assert (=> bm!19684 (= call!19687 (arrayCountValidKeys!0 (_keys!5952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194810 () Bool)

(assert (=> b!194810 (= e!128130 call!19687)))

(declare-fun d!56969 () Bool)

(declare-fun lt!97063 () (_ BitVec 32))

(assert (=> d!56969 (and (bvsge lt!97063 #b00000000000000000000000000000000) (bvsle lt!97063 (bvsub (size!4187 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!56969 (= lt!97063 e!128129)))

(declare-fun c!35225 () Bool)

(assert (=> d!56969 (= c!35225 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56969 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!4187 (_keys!5952 thiss!1248)) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!56969 (= (arrayCountValidKeys!0 (_keys!5952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))) lt!97063)))

(assert (= (and d!56969 c!35225) b!194812))

(assert (= (and d!56969 (not c!35225)) b!194811))

(assert (= (and b!194811 c!35226) b!194809))

(assert (= (and b!194811 (not c!35226)) b!194810))

(assert (= (or b!194809 b!194810) bm!19684))

(assert (=> b!194811 m!221293))

(assert (=> b!194811 m!221293))

(assert (=> b!194811 m!221297))

(declare-fun m!221617 () Bool)

(assert (=> bm!19684 m!221617))

(assert (=> bm!19663 d!56969))

(declare-fun d!56971 () Bool)

(declare-fun e!128132 () Bool)

(assert (=> d!56971 e!128132))

(declare-fun res!91992 () Bool)

(assert (=> d!56971 (=> res!91992 e!128132)))

(declare-fun lt!97066 () Bool)

(assert (=> d!56971 (= res!91992 (not lt!97066))))

(declare-fun lt!97067 () Bool)

(assert (=> d!56971 (= lt!97066 lt!97067)))

(declare-fun lt!97065 () Unit!5819)

(declare-fun e!128131 () Unit!5819)

(assert (=> d!56971 (= lt!97065 e!128131)))

(declare-fun c!35227 () Bool)

(assert (=> d!56971 (= c!35227 lt!97067)))

(assert (=> d!56971 (= lt!97067 (containsKey!247 (toList!1225 lt!96633) lt!96630))))

(assert (=> d!56971 (= (contains!1356 lt!96633 lt!96630) lt!97066)))

(declare-fun b!194813 () Bool)

(declare-fun lt!97064 () Unit!5819)

(assert (=> b!194813 (= e!128131 lt!97064)))

(assert (=> b!194813 (= lt!97064 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96633) lt!96630))))

(assert (=> b!194813 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96633) lt!96630))))

(declare-fun b!194814 () Bool)

(declare-fun Unit!5863 () Unit!5819)

(assert (=> b!194814 (= e!128131 Unit!5863)))

(declare-fun b!194815 () Bool)

(assert (=> b!194815 (= e!128132 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96633) lt!96630)))))

(assert (= (and d!56971 c!35227) b!194813))

(assert (= (and d!56971 (not c!35227)) b!194814))

(assert (= (and d!56971 (not res!91992)) b!194815))

(declare-fun m!221619 () Bool)

(assert (=> d!56971 m!221619))

(declare-fun m!221621 () Bool)

(assert (=> b!194813 m!221621))

(assert (=> b!194813 m!220793))

(assert (=> b!194813 m!220793))

(declare-fun m!221623 () Bool)

(assert (=> b!194813 m!221623))

(assert (=> b!194815 m!220793))

(assert (=> b!194815 m!220793))

(assert (=> b!194815 m!221623))

(assert (=> d!56637 d!56971))

(assert (=> d!56637 d!56621))

(assert (=> d!56637 d!56641))

(assert (=> d!56637 d!56635))

(declare-fun d!56973 () Bool)

(assert (=> d!56973 (= (apply!188 (+!317 lt!96633 (tuple2!3511 lt!96641 (minValue!3800 thiss!1248))) lt!96630) (apply!188 lt!96633 lt!96630))))

(assert (=> d!56973 true))

(declare-fun _$34!1092 () Unit!5819)

(assert (=> d!56973 (= (choose!1076 lt!96633 lt!96641 (minValue!3800 thiss!1248) lt!96630) _$34!1092)))

(declare-fun bs!7748 () Bool)

(assert (= bs!7748 d!56973))

(assert (=> bs!7748 m!220317))

(assert (=> bs!7748 m!220317))

(assert (=> bs!7748 m!220319))

(assert (=> bs!7748 m!220329))

(assert (=> d!56637 d!56973))

(declare-fun d!56975 () Bool)

(assert (=> d!56975 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!97068 () Unit!5819)

(assert (=> d!56975 (= lt!97068 (choose!1075 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!128133 () Bool)

(assert (=> d!56975 e!128133))

(declare-fun res!91993 () Bool)

(assert (=> d!56975 (=> (not res!91993) (not e!128133))))

(assert (=> d!56975 (= res!91993 (isStrictlySorted!352 (toList!1225 lt!96632)))))

(assert (=> d!56975 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!97068)))

(declare-fun b!194816 () Bool)

(assert (=> b!194816 (= e!128133 (containsKey!247 (toList!1225 lt!96632) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56975 res!91993) b!194816))

(assert (=> d!56975 m!220231))

(assert (=> d!56975 m!220541))

(assert (=> d!56975 m!220541))

(assert (=> d!56975 m!220907))

(assert (=> d!56975 m!220231))

(declare-fun m!221625 () Bool)

(assert (=> d!56975 m!221625))

(assert (=> d!56975 m!221177))

(assert (=> b!194816 m!220231))

(assert (=> b!194816 m!220903))

(assert (=> b!194411 d!56975))

(assert (=> b!194411 d!56791))

(assert (=> b!194411 d!56793))

(declare-fun d!56977 () Bool)

(declare-fun e!128134 () Bool)

(assert (=> d!56977 e!128134))

(declare-fun res!91994 () Bool)

(assert (=> d!56977 (=> (not res!91994) (not e!128134))))

(declare-fun lt!97069 () ListLongMap!2419)

(assert (=> d!56977 (= res!91994 (contains!1356 lt!97069 (_1!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97071 () List!2426)

(assert (=> d!56977 (= lt!97069 (ListLongMap!2420 lt!97071))))

(declare-fun lt!97072 () Unit!5819)

(declare-fun lt!97070 () Unit!5819)

(assert (=> d!56977 (= lt!97072 lt!97070)))

(assert (=> d!56977 (= (getValueByKey!243 lt!97071 (_1!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56977 (= lt!97070 (lemmaContainsTupThenGetReturnValue!133 lt!97071 (_1!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56977 (= lt!97071 (insertStrictlySorted!136 (toList!1225 (ite c!35082 call!19651 (ite c!35077 call!19648 call!19646))) (_1!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56977 (= (+!317 (ite c!35082 call!19651 (ite c!35077 call!19648 call!19646)) (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97069)))

(declare-fun b!194817 () Bool)

(declare-fun res!91995 () Bool)

(assert (=> b!194817 (=> (not res!91995) (not e!128134))))

(assert (=> b!194817 (= res!91995 (= (getValueByKey!243 (toList!1225 lt!97069) (_1!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194818 () Bool)

(assert (=> b!194818 (= e!128134 (contains!1359 (toList!1225 lt!97069) (ite (or c!35082 c!35077) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!56977 res!91994) b!194817))

(assert (= (and b!194817 res!91995) b!194818))

(declare-fun m!221627 () Bool)

(assert (=> d!56977 m!221627))

(declare-fun m!221629 () Bool)

(assert (=> d!56977 m!221629))

(declare-fun m!221631 () Bool)

(assert (=> d!56977 m!221631))

(declare-fun m!221633 () Bool)

(assert (=> d!56977 m!221633))

(declare-fun m!221635 () Bool)

(assert (=> b!194817 m!221635))

(declare-fun m!221637 () Bool)

(assert (=> b!194818 m!221637))

(assert (=> bm!19645 d!56977))

(declare-fun d!56979 () Bool)

(declare-fun e!128136 () Bool)

(assert (=> d!56979 e!128136))

(declare-fun res!91996 () Bool)

(assert (=> d!56979 (=> res!91996 e!128136)))

(declare-fun lt!97075 () Bool)

(assert (=> d!56979 (= res!91996 (not lt!97075))))

(declare-fun lt!97076 () Bool)

(assert (=> d!56979 (= lt!97075 lt!97076)))

(declare-fun lt!97074 () Unit!5819)

(declare-fun e!128135 () Unit!5819)

(assert (=> d!56979 (= lt!97074 e!128135)))

(declare-fun c!35228 () Bool)

(assert (=> d!56979 (= c!35228 lt!97076)))

(assert (=> d!56979 (= lt!97076 (containsKey!247 (toList!1225 lt!96923) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!56979 (= (contains!1356 lt!96923 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97075)))

(declare-fun b!194819 () Bool)

(declare-fun lt!97073 () Unit!5819)

(assert (=> b!194819 (= e!128135 lt!97073)))

(assert (=> b!194819 (= lt!97073 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96923) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> b!194819 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96923) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194820 () Bool)

(declare-fun Unit!5864 () Unit!5819)

(assert (=> b!194820 (= e!128135 Unit!5864)))

(declare-fun b!194821 () Bool)

(assert (=> b!194821 (= e!128136 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96923) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!56979 c!35228) b!194819))

(assert (= (and d!56979 (not c!35228)) b!194820))

(assert (= (and d!56979 (not res!91996)) b!194821))

(declare-fun m!221639 () Bool)

(assert (=> d!56979 m!221639))

(declare-fun m!221641 () Bool)

(assert (=> b!194819 m!221641))

(assert (=> b!194819 m!221049))

(assert (=> b!194819 m!221049))

(declare-fun m!221643 () Bool)

(assert (=> b!194819 m!221643))

(assert (=> b!194821 m!221049))

(assert (=> b!194821 m!221049))

(assert (=> b!194821 m!221643))

(assert (=> d!56717 d!56979))

(declare-fun b!194824 () Bool)

(declare-fun e!128138 () Option!249)

(assert (=> b!194824 (= e!128138 (getValueByKey!243 (t!7343 lt!96925) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun d!56981 () Bool)

(declare-fun c!35229 () Bool)

(assert (=> d!56981 (= c!35229 (and ((_ is Cons!2422) lt!96925) (= (_1!1766 (h!3063 lt!96925)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128137 () Option!249)

(assert (=> d!56981 (= (getValueByKey!243 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128137)))

(declare-fun b!194822 () Bool)

(assert (=> b!194822 (= e!128137 (Some!248 (_2!1766 (h!3063 lt!96925))))))

(declare-fun b!194823 () Bool)

(assert (=> b!194823 (= e!128137 e!128138)))

(declare-fun c!35230 () Bool)

(assert (=> b!194823 (= c!35230 (and ((_ is Cons!2422) lt!96925) (not (= (_1!1766 (h!3063 lt!96925)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!194825 () Bool)

(assert (=> b!194825 (= e!128138 None!247)))

(assert (= (and d!56981 c!35229) b!194822))

(assert (= (and d!56981 (not c!35229)) b!194823))

(assert (= (and b!194823 c!35230) b!194824))

(assert (= (and b!194823 (not c!35230)) b!194825))

(declare-fun m!221645 () Bool)

(assert (=> b!194824 m!221645))

(assert (=> d!56717 d!56981))

(declare-fun d!56983 () Bool)

(assert (=> d!56983 (= (getValueByKey!243 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97077 () Unit!5819)

(assert (=> d!56983 (= lt!97077 (choose!1074 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128139 () Bool)

(assert (=> d!56983 e!128139))

(declare-fun res!91997 () Bool)

(assert (=> d!56983 (=> (not res!91997) (not e!128139))))

(assert (=> d!56983 (= res!91997 (isStrictlySorted!352 lt!96925))))

(assert (=> d!56983 (= (lemmaContainsTupThenGetReturnValue!133 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97077)))

(declare-fun b!194826 () Bool)

(declare-fun res!91998 () Bool)

(assert (=> b!194826 (=> (not res!91998) (not e!128139))))

(assert (=> b!194826 (= res!91998 (containsKey!247 lt!96925 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194827 () Bool)

(assert (=> b!194827 (= e!128139 (contains!1359 lt!96925 (tuple2!3511 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!56983 res!91997) b!194826))

(assert (= (and b!194826 res!91998) b!194827))

(assert (=> d!56983 m!221043))

(declare-fun m!221647 () Bool)

(assert (=> d!56983 m!221647))

(declare-fun m!221649 () Bool)

(assert (=> d!56983 m!221649))

(declare-fun m!221651 () Bool)

(assert (=> b!194826 m!221651))

(declare-fun m!221653 () Bool)

(assert (=> b!194827 m!221653))

(assert (=> d!56717 d!56983))

(declare-fun d!56985 () Bool)

(declare-fun e!128141 () Bool)

(assert (=> d!56985 e!128141))

(declare-fun res!92000 () Bool)

(assert (=> d!56985 (=> (not res!92000) (not e!128141))))

(declare-fun lt!97078 () List!2426)

(assert (=> d!56985 (= res!92000 (isStrictlySorted!352 lt!97078))))

(declare-fun e!128142 () List!2426)

(assert (=> d!56985 (= lt!97078 e!128142)))

(declare-fun c!35231 () Bool)

(assert (=> d!56985 (= c!35231 (and ((_ is Cons!2422) (toList!1225 call!19613)) (bvslt (_1!1766 (h!3063 (toList!1225 call!19613))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!56985 (isStrictlySorted!352 (toList!1225 call!19613))))

(assert (=> d!56985 (= (insertStrictlySorted!136 (toList!1225 call!19613) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97078)))

(declare-fun bm!19685 () Bool)

(declare-fun call!19689 () List!2426)

(declare-fun call!19690 () List!2426)

(assert (=> bm!19685 (= call!19689 call!19690)))

(declare-fun b!194828 () Bool)

(declare-fun e!128143 () List!2426)

(assert (=> b!194828 (= e!128143 (insertStrictlySorted!136 (t!7343 (toList!1225 call!19613)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194829 () Bool)

(assert (=> b!194829 (= e!128141 (contains!1359 lt!97078 (tuple2!3511 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194830 () Bool)

(declare-fun e!128140 () List!2426)

(assert (=> b!194830 (= e!128142 e!128140)))

(declare-fun c!35233 () Bool)

(assert (=> b!194830 (= c!35233 (and ((_ is Cons!2422) (toList!1225 call!19613)) (= (_1!1766 (h!3063 (toList!1225 call!19613))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!194831 () Bool)

(declare-fun res!91999 () Bool)

(assert (=> b!194831 (=> (not res!91999) (not e!128141))))

(assert (=> b!194831 (= res!91999 (containsKey!247 lt!97078 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194832 () Bool)

(assert (=> b!194832 (= e!128142 call!19690)))

(declare-fun b!194833 () Bool)

(declare-fun e!128144 () List!2426)

(declare-fun call!19688 () List!2426)

(assert (=> b!194833 (= e!128144 call!19688)))

(declare-fun b!194834 () Bool)

(assert (=> b!194834 (= e!128144 call!19688)))

(declare-fun c!35234 () Bool)

(declare-fun b!194835 () Bool)

(assert (=> b!194835 (= e!128143 (ite c!35233 (t!7343 (toList!1225 call!19613)) (ite c!35234 (Cons!2422 (h!3063 (toList!1225 call!19613)) (t!7343 (toList!1225 call!19613))) Nil!2423)))))

(declare-fun b!194836 () Bool)

(assert (=> b!194836 (= e!128140 call!19689)))

(declare-fun bm!19686 () Bool)

(assert (=> bm!19686 (= call!19690 ($colon$colon!102 e!128143 (ite c!35231 (h!3063 (toList!1225 call!19613)) (tuple2!3511 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35232 () Bool)

(assert (=> bm!19686 (= c!35232 c!35231)))

(declare-fun b!194837 () Bool)

(assert (=> b!194837 (= c!35234 (and ((_ is Cons!2422) (toList!1225 call!19613)) (bvsgt (_1!1766 (h!3063 (toList!1225 call!19613))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> b!194837 (= e!128140 e!128144)))

(declare-fun bm!19687 () Bool)

(assert (=> bm!19687 (= call!19688 call!19689)))

(assert (= (and d!56985 c!35231) b!194832))

(assert (= (and d!56985 (not c!35231)) b!194830))

(assert (= (and b!194830 c!35233) b!194836))

(assert (= (and b!194830 (not c!35233)) b!194837))

(assert (= (and b!194837 c!35234) b!194833))

(assert (= (and b!194837 (not c!35234)) b!194834))

(assert (= (or b!194833 b!194834) bm!19687))

(assert (= (or b!194836 bm!19687) bm!19685))

(assert (= (or b!194832 bm!19685) bm!19686))

(assert (= (and bm!19686 c!35232) b!194828))

(assert (= (and bm!19686 (not c!35232)) b!194835))

(assert (= (and d!56985 res!92000) b!194831))

(assert (= (and b!194831 res!91999) b!194829))

(declare-fun m!221655 () Bool)

(assert (=> d!56985 m!221655))

(declare-fun m!221657 () Bool)

(assert (=> d!56985 m!221657))

(declare-fun m!221659 () Bool)

(assert (=> b!194831 m!221659))

(declare-fun m!221661 () Bool)

(assert (=> b!194828 m!221661))

(declare-fun m!221663 () Bool)

(assert (=> b!194829 m!221663))

(declare-fun m!221665 () Bool)

(assert (=> bm!19686 m!221665))

(assert (=> d!56717 d!56985))

(declare-fun d!56987 () Bool)

(declare-fun res!92001 () Bool)

(declare-fun e!128145 () Bool)

(assert (=> d!56987 (=> res!92001 e!128145)))

(assert (=> d!56987 (= res!92001 (and ((_ is Cons!2422) lt!96764) (= (_1!1766 (h!3063 lt!96764)) (_1!1766 lt!96460))))))

(assert (=> d!56987 (= (containsKey!247 lt!96764 (_1!1766 lt!96460)) e!128145)))

(declare-fun b!194838 () Bool)

(declare-fun e!128146 () Bool)

(assert (=> b!194838 (= e!128145 e!128146)))

(declare-fun res!92002 () Bool)

(assert (=> b!194838 (=> (not res!92002) (not e!128146))))

(assert (=> b!194838 (= res!92002 (and (or (not ((_ is Cons!2422) lt!96764)) (bvsle (_1!1766 (h!3063 lt!96764)) (_1!1766 lt!96460))) ((_ is Cons!2422) lt!96764) (bvslt (_1!1766 (h!3063 lt!96764)) (_1!1766 lt!96460))))))

(declare-fun b!194839 () Bool)

(assert (=> b!194839 (= e!128146 (containsKey!247 (t!7343 lt!96764) (_1!1766 lt!96460)))))

(assert (= (and d!56987 (not res!92001)) b!194838))

(assert (= (and b!194838 res!92002) b!194839))

(declare-fun m!221667 () Bool)

(assert (=> b!194839 m!221667))

(assert (=> b!194245 d!56987))

(declare-fun d!56989 () Bool)

(declare-fun e!128147 () Bool)

(assert (=> d!56989 e!128147))

(declare-fun res!92003 () Bool)

(assert (=> d!56989 (=> (not res!92003) (not e!128147))))

(declare-fun lt!97079 () ListLongMap!2419)

(assert (=> d!56989 (= res!92003 (contains!1356 lt!97079 (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!97081 () List!2426)

(assert (=> d!56989 (= lt!97079 (ListLongMap!2420 lt!97081))))

(declare-fun lt!97082 () Unit!5819)

(declare-fun lt!97080 () Unit!5819)

(assert (=> d!56989 (= lt!97082 lt!97080)))

(assert (=> d!56989 (= (getValueByKey!243 lt!97081 (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!248 (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56989 (= lt!97080 (lemmaContainsTupThenGetReturnValue!133 lt!97081 (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56989 (= lt!97081 (insertStrictlySorted!136 (toList!1225 call!19644) (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56989 (= (+!317 call!19644 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!97079)))

(declare-fun b!194840 () Bool)

(declare-fun res!92004 () Bool)

(assert (=> b!194840 (=> (not res!92004) (not e!128147))))

(assert (=> b!194840 (= res!92004 (= (getValueByKey!243 (toList!1225 lt!97079) (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!248 (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!194841 () Bool)

(assert (=> b!194841 (= e!128147 (contains!1359 (toList!1225 lt!97079) (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!56989 res!92003) b!194840))

(assert (= (and b!194840 res!92004) b!194841))

(declare-fun m!221669 () Bool)

(assert (=> d!56989 m!221669))

(declare-fun m!221671 () Bool)

(assert (=> d!56989 m!221671))

(declare-fun m!221673 () Bool)

(assert (=> d!56989 m!221673))

(declare-fun m!221675 () Bool)

(assert (=> d!56989 m!221675))

(declare-fun m!221677 () Bool)

(assert (=> b!194840 m!221677))

(declare-fun m!221679 () Bool)

(assert (=> b!194841 m!221679))

(assert (=> b!194261 d!56989))

(declare-fun d!56991 () Bool)

(declare-fun e!128148 () Bool)

(assert (=> d!56991 e!128148))

(declare-fun res!92005 () Bool)

(assert (=> d!56991 (=> (not res!92005) (not e!128148))))

(declare-fun lt!97083 () ListLongMap!2419)

(assert (=> d!56991 (= res!92005 (contains!1356 lt!97083 (_1!1766 (tuple2!3511 lt!96775 lt!96776))))))

(declare-fun lt!97085 () List!2426)

(assert (=> d!56991 (= lt!97083 (ListLongMap!2420 lt!97085))))

(declare-fun lt!97086 () Unit!5819)

(declare-fun lt!97084 () Unit!5819)

(assert (=> d!56991 (= lt!97086 lt!97084)))

(assert (=> d!56991 (= (getValueByKey!243 lt!97085 (_1!1766 (tuple2!3511 lt!96775 lt!96776))) (Some!248 (_2!1766 (tuple2!3511 lt!96775 lt!96776))))))

(assert (=> d!56991 (= lt!97084 (lemmaContainsTupThenGetReturnValue!133 lt!97085 (_1!1766 (tuple2!3511 lt!96775 lt!96776)) (_2!1766 (tuple2!3511 lt!96775 lt!96776))))))

(assert (=> d!56991 (= lt!97085 (insertStrictlySorted!136 (toList!1225 lt!96778) (_1!1766 (tuple2!3511 lt!96775 lt!96776)) (_2!1766 (tuple2!3511 lt!96775 lt!96776))))))

(assert (=> d!56991 (= (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776)) lt!97083)))

(declare-fun b!194842 () Bool)

(declare-fun res!92006 () Bool)

(assert (=> b!194842 (=> (not res!92006) (not e!128148))))

(assert (=> b!194842 (= res!92006 (= (getValueByKey!243 (toList!1225 lt!97083) (_1!1766 (tuple2!3511 lt!96775 lt!96776))) (Some!248 (_2!1766 (tuple2!3511 lt!96775 lt!96776)))))))

(declare-fun b!194843 () Bool)

(assert (=> b!194843 (= e!128148 (contains!1359 (toList!1225 lt!97083) (tuple2!3511 lt!96775 lt!96776)))))

(assert (= (and d!56991 res!92005) b!194842))

(assert (= (and b!194842 res!92006) b!194843))

(declare-fun m!221681 () Bool)

(assert (=> d!56991 m!221681))

(declare-fun m!221683 () Bool)

(assert (=> d!56991 m!221683))

(declare-fun m!221685 () Bool)

(assert (=> d!56991 m!221685))

(declare-fun m!221687 () Bool)

(assert (=> d!56991 m!221687))

(declare-fun m!221689 () Bool)

(assert (=> b!194842 m!221689))

(declare-fun m!221691 () Bool)

(assert (=> b!194843 m!221691))

(assert (=> b!194261 d!56991))

(assert (=> b!194261 d!56609))

(declare-fun d!56993 () Bool)

(declare-fun e!128150 () Bool)

(assert (=> d!56993 e!128150))

(declare-fun res!92007 () Bool)

(assert (=> d!56993 (=> res!92007 e!128150)))

(declare-fun lt!97089 () Bool)

(assert (=> d!56993 (= res!92007 (not lt!97089))))

(declare-fun lt!97090 () Bool)

(assert (=> d!56993 (= lt!97089 lt!97090)))

(declare-fun lt!97088 () Unit!5819)

(declare-fun e!128149 () Unit!5819)

(assert (=> d!56993 (= lt!97088 e!128149)))

(declare-fun c!35235 () Bool)

(assert (=> d!56993 (= c!35235 lt!97090)))

(assert (=> d!56993 (= lt!97090 (containsKey!247 (toList!1225 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776))) lt!96774))))

(assert (=> d!56993 (= (contains!1356 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776)) lt!96774) lt!97089)))

(declare-fun b!194844 () Bool)

(declare-fun lt!97087 () Unit!5819)

(assert (=> b!194844 (= e!128149 lt!97087)))

(assert (=> b!194844 (= lt!97087 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776))) lt!96774))))

(assert (=> b!194844 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776))) lt!96774))))

(declare-fun b!194845 () Bool)

(declare-fun Unit!5865 () Unit!5819)

(assert (=> b!194845 (= e!128149 Unit!5865)))

(declare-fun b!194846 () Bool)

(assert (=> b!194846 (= e!128150 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776))) lt!96774)))))

(assert (= (and d!56993 c!35235) b!194844))

(assert (= (and d!56993 (not c!35235)) b!194845))

(assert (= (and d!56993 (not res!92007)) b!194846))

(declare-fun m!221693 () Bool)

(assert (=> d!56993 m!221693))

(declare-fun m!221695 () Bool)

(assert (=> b!194844 m!221695))

(declare-fun m!221697 () Bool)

(assert (=> b!194844 m!221697))

(assert (=> b!194844 m!221697))

(declare-fun m!221699 () Bool)

(assert (=> b!194844 m!221699))

(assert (=> b!194846 m!221697))

(assert (=> b!194846 m!221697))

(assert (=> b!194846 m!221699))

(assert (=> b!194261 d!56993))

(declare-fun d!56995 () Bool)

(assert (=> d!56995 (not (contains!1356 (+!317 lt!96778 (tuple2!3511 lt!96775 lt!96776)) lt!96774))))

(declare-fun lt!97093 () Unit!5819)

(declare-fun choose!1078 (ListLongMap!2419 (_ BitVec 64) V!5633 (_ BitVec 64)) Unit!5819)

(assert (=> d!56995 (= lt!97093 (choose!1078 lt!96778 lt!96775 lt!96776 lt!96774))))

(declare-fun e!128153 () Bool)

(assert (=> d!56995 e!128153))

(declare-fun res!92010 () Bool)

(assert (=> d!56995 (=> (not res!92010) (not e!128153))))

(assert (=> d!56995 (= res!92010 (not (contains!1356 lt!96778 lt!96774)))))

(assert (=> d!56995 (= (addStillNotContains!98 lt!96778 lt!96775 lt!96776 lt!96774) lt!97093)))

(declare-fun b!194850 () Bool)

(assert (=> b!194850 (= e!128153 (not (= lt!96775 lt!96774)))))

(assert (= (and d!56995 res!92010) b!194850))

(assert (=> d!56995 m!220605))

(assert (=> d!56995 m!220605))

(assert (=> d!56995 m!220607))

(declare-fun m!221701 () Bool)

(assert (=> d!56995 m!221701))

(declare-fun m!221703 () Bool)

(assert (=> d!56995 m!221703))

(assert (=> b!194261 d!56995))

(declare-fun d!56997 () Bool)

(declare-fun res!92011 () Bool)

(declare-fun e!128154 () Bool)

(assert (=> d!56997 (=> res!92011 e!128154)))

(assert (=> d!56997 (= res!92011 (and ((_ is Cons!2422) (toList!1225 lt!96663)) (= (_1!1766 (h!3063 (toList!1225 lt!96663))) (_1!1766 lt!96460))))))

(assert (=> d!56997 (= (containsKey!247 (toList!1225 lt!96663) (_1!1766 lt!96460)) e!128154)))

(declare-fun b!194851 () Bool)

(declare-fun e!128155 () Bool)

(assert (=> b!194851 (= e!128154 e!128155)))

(declare-fun res!92012 () Bool)

(assert (=> b!194851 (=> (not res!92012) (not e!128155))))

(assert (=> b!194851 (= res!92012 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96663))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96663))) (_1!1766 lt!96460))) ((_ is Cons!2422) (toList!1225 lt!96663)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96663))) (_1!1766 lt!96460))))))

(declare-fun b!194852 () Bool)

(assert (=> b!194852 (= e!128155 (containsKey!247 (t!7343 (toList!1225 lt!96663)) (_1!1766 lt!96460)))))

(assert (= (and d!56997 (not res!92011)) b!194851))

(assert (= (and b!194851 res!92012) b!194852))

(declare-fun m!221705 () Bool)

(assert (=> b!194852 m!221705))

(assert (=> d!56547 d!56997))

(assert (=> b!194488 d!56651))

(declare-fun b!194853 () Bool)

(declare-fun e!128159 () Bool)

(assert (=> b!194853 (= e!128159 (contains!1360 (ite c!35097 (Cons!2425 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) Nil!2426) Nil!2426) (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194854 () Bool)

(declare-fun e!128156 () Bool)

(declare-fun e!128157 () Bool)

(assert (=> b!194854 (= e!128156 e!128157)))

(declare-fun c!35236 () Bool)

(assert (=> b!194854 (= c!35236 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!19691 () Bool)

(declare-fun bm!19688 () Bool)

(assert (=> bm!19688 (= call!19691 (arrayNoDuplicates!0 (_keys!5952 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!35236 (Cons!2425 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!35097 (Cons!2425 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)) (ite c!35097 (Cons!2425 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) Nil!2426) Nil!2426))))))

(declare-fun b!194855 () Bool)

(assert (=> b!194855 (= e!128157 call!19691)))

(declare-fun b!194856 () Bool)

(assert (=> b!194856 (= e!128157 call!19691)))

(declare-fun b!194857 () Bool)

(declare-fun e!128158 () Bool)

(assert (=> b!194857 (= e!128158 e!128156)))

(declare-fun res!92014 () Bool)

(assert (=> b!194857 (=> (not res!92014) (not e!128156))))

(assert (=> b!194857 (= res!92014 (not e!128159))))

(declare-fun res!92013 () Bool)

(assert (=> b!194857 (=> (not res!92013) (not e!128159))))

(assert (=> b!194857 (= res!92013 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!56999 () Bool)

(declare-fun res!92015 () Bool)

(assert (=> d!56999 (=> res!92015 e!128158)))

(assert (=> d!56999 (= res!92015 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!56999 (= (arrayNoDuplicates!0 (_keys!5952 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35097 (Cons!2425 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)) e!128158)))

(assert (= (and d!56999 (not res!92015)) b!194857))

(assert (= (and b!194857 res!92013) b!194853))

(assert (= (and b!194857 res!92014) b!194854))

(assert (= (and b!194854 c!35236) b!194856))

(assert (= (and b!194854 (not c!35236)) b!194855))

(assert (= (or b!194856 b!194855) bm!19688))

(assert (=> b!194853 m!221149))

(assert (=> b!194853 m!221149))

(declare-fun m!221707 () Bool)

(assert (=> b!194853 m!221707))

(assert (=> b!194854 m!221149))

(assert (=> b!194854 m!221149))

(assert (=> b!194854 m!221151))

(assert (=> bm!19688 m!221149))

(declare-fun m!221709 () Bool)

(assert (=> bm!19688 m!221709))

(assert (=> b!194857 m!221149))

(assert (=> b!194857 m!221149))

(assert (=> b!194857 m!221151))

(assert (=> bm!19659 d!56999))

(declare-fun b!194860 () Bool)

(declare-fun e!128161 () Option!249)

(assert (=> b!194860 (= e!128161 (getValueByKey!243 (t!7343 (t!7343 (toList!1225 lt!96451))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun d!57001 () Bool)

(declare-fun c!35237 () Bool)

(assert (=> d!57001 (= c!35237 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96451))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96451)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(declare-fun e!128160 () Option!249)

(assert (=> d!57001 (= (getValueByKey!243 (t!7343 (toList!1225 lt!96451)) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) e!128160)))

(declare-fun b!194858 () Bool)

(assert (=> b!194858 (= e!128160 (Some!248 (_2!1766 (h!3063 (t!7343 (toList!1225 lt!96451))))))))

(declare-fun b!194859 () Bool)

(assert (=> b!194859 (= e!128160 e!128161)))

(declare-fun c!35238 () Bool)

(assert (=> b!194859 (= c!35238 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96451))) (not (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96451)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))))

(declare-fun b!194861 () Bool)

(assert (=> b!194861 (= e!128161 None!247)))

(assert (= (and d!57001 c!35237) b!194858))

(assert (= (and d!57001 (not c!35237)) b!194859))

(assert (= (and b!194859 c!35238) b!194860))

(assert (= (and b!194859 (not c!35238)) b!194861))

(assert (=> b!194860 m!220093))

(declare-fun m!221711 () Bool)

(assert (=> b!194860 m!221711))

(assert (=> b!194309 d!57001))

(assert (=> b!194182 d!56539))

(declare-fun d!57003 () Bool)

(declare-fun e!128163 () Bool)

(assert (=> d!57003 e!128163))

(declare-fun res!92016 () Bool)

(assert (=> d!57003 (=> res!92016 e!128163)))

(declare-fun lt!97096 () Bool)

(assert (=> d!57003 (= res!92016 (not lt!97096))))

(declare-fun lt!97097 () Bool)

(assert (=> d!57003 (= lt!97096 lt!97097)))

(declare-fun lt!97095 () Unit!5819)

(declare-fun e!128162 () Unit!5819)

(assert (=> d!57003 (= lt!97095 e!128162)))

(declare-fun c!35239 () Bool)

(assert (=> d!57003 (= c!35239 lt!97097)))

(assert (=> d!57003 (= lt!97097 (containsKey!247 (toList!1225 lt!96858) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57003 (= (contains!1356 lt!96858 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!97096)))

(declare-fun b!194862 () Bool)

(declare-fun lt!97094 () Unit!5819)

(assert (=> b!194862 (= e!128162 lt!97094)))

(assert (=> b!194862 (= lt!97094 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96858) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!194862 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96858) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194863 () Bool)

(declare-fun Unit!5866 () Unit!5819)

(assert (=> b!194863 (= e!128162 Unit!5866)))

(declare-fun b!194864 () Bool)

(assert (=> b!194864 (= e!128163 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96858) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57003 c!35239) b!194862))

(assert (= (and d!57003 (not c!35239)) b!194863))

(assert (= (and d!57003 (not res!92016)) b!194864))

(declare-fun m!221713 () Bool)

(assert (=> d!57003 m!221713))

(declare-fun m!221715 () Bool)

(assert (=> b!194862 m!221715))

(assert (=> b!194862 m!220865))

(assert (=> b!194862 m!220865))

(declare-fun m!221717 () Bool)

(assert (=> b!194862 m!221717))

(assert (=> b!194864 m!220865))

(assert (=> b!194864 m!220865))

(assert (=> b!194864 m!221717))

(assert (=> d!56643 d!57003))

(declare-fun e!128165 () Option!249)

(declare-fun b!194867 () Bool)

(assert (=> b!194867 (= e!128165 (getValueByKey!243 (t!7343 lt!96860) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun d!57005 () Bool)

(declare-fun c!35240 () Bool)

(assert (=> d!57005 (= c!35240 (and ((_ is Cons!2422) lt!96860) (= (_1!1766 (h!3063 lt!96860)) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128164 () Option!249)

(assert (=> d!57005 (= (getValueByKey!243 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) e!128164)))

(declare-fun b!194865 () Bool)

(assert (=> b!194865 (= e!128164 (Some!248 (_2!1766 (h!3063 lt!96860))))))

(declare-fun b!194866 () Bool)

(assert (=> b!194866 (= e!128164 e!128165)))

(declare-fun c!35241 () Bool)

(assert (=> b!194866 (= c!35241 (and ((_ is Cons!2422) lt!96860) (not (= (_1!1766 (h!3063 lt!96860)) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194868 () Bool)

(assert (=> b!194868 (= e!128165 None!247)))

(assert (= (and d!57005 c!35240) b!194865))

(assert (= (and d!57005 (not c!35240)) b!194866))

(assert (= (and b!194866 c!35241) b!194867))

(assert (= (and b!194866 (not c!35241)) b!194868))

(declare-fun m!221719 () Bool)

(assert (=> b!194867 m!221719))

(assert (=> d!56643 d!57005))

(declare-fun d!57007 () Bool)

(assert (=> d!57007 (= (getValueByKey!243 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97098 () Unit!5819)

(assert (=> d!57007 (= lt!97098 (choose!1074 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!128166 () Bool)

(assert (=> d!57007 e!128166))

(declare-fun res!92017 () Bool)

(assert (=> d!57007 (=> (not res!92017) (not e!128166))))

(assert (=> d!57007 (= res!92017 (isStrictlySorted!352 lt!96860))))

(assert (=> d!57007 (= (lemmaContainsTupThenGetReturnValue!133 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!97098)))

(declare-fun b!194869 () Bool)

(declare-fun res!92018 () Bool)

(assert (=> b!194869 (=> (not res!92018) (not e!128166))))

(assert (=> b!194869 (= res!92018 (containsKey!247 lt!96860 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194870 () Bool)

(assert (=> b!194870 (= e!128166 (contains!1359 lt!96860 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57007 res!92017) b!194869))

(assert (= (and b!194869 res!92018) b!194870))

(assert (=> d!57007 m!220859))

(declare-fun m!221721 () Bool)

(assert (=> d!57007 m!221721))

(declare-fun m!221723 () Bool)

(assert (=> d!57007 m!221723))

(declare-fun m!221725 () Bool)

(assert (=> b!194869 m!221725))

(declare-fun m!221727 () Bool)

(assert (=> b!194870 m!221727))

(assert (=> d!56643 d!57007))

(declare-fun d!57009 () Bool)

(declare-fun e!128168 () Bool)

(assert (=> d!57009 e!128168))

(declare-fun res!92020 () Bool)

(assert (=> d!57009 (=> (not res!92020) (not e!128168))))

(declare-fun lt!97099 () List!2426)

(assert (=> d!57009 (= res!92020 (isStrictlySorted!352 lt!97099))))

(declare-fun e!128169 () List!2426)

(assert (=> d!57009 (= lt!97099 e!128169)))

(declare-fun c!35242 () Bool)

(assert (=> d!57009 (= c!35242 (and ((_ is Cons!2422) (toList!1225 lt!96639)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96639))) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57009 (isStrictlySorted!352 (toList!1225 lt!96639))))

(assert (=> d!57009 (= (insertStrictlySorted!136 (toList!1225 lt!96639) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!97099)))

(declare-fun bm!19689 () Bool)

(declare-fun call!19693 () List!2426)

(declare-fun call!19694 () List!2426)

(assert (=> bm!19689 (= call!19693 call!19694)))

(declare-fun e!128170 () List!2426)

(declare-fun b!194871 () Bool)

(assert (=> b!194871 (= e!128170 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96639)) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194872 () Bool)

(assert (=> b!194872 (= e!128168 (contains!1359 lt!97099 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194873 () Bool)

(declare-fun e!128167 () List!2426)

(assert (=> b!194873 (= e!128169 e!128167)))

(declare-fun c!35244 () Bool)

(assert (=> b!194873 (= c!35244 (and ((_ is Cons!2422) (toList!1225 lt!96639)) (= (_1!1766 (h!3063 (toList!1225 lt!96639))) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194874 () Bool)

(declare-fun res!92019 () Bool)

(assert (=> b!194874 (=> (not res!92019) (not e!128168))))

(assert (=> b!194874 (= res!92019 (containsKey!247 lt!97099 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194875 () Bool)

(assert (=> b!194875 (= e!128169 call!19694)))

(declare-fun b!194876 () Bool)

(declare-fun e!128171 () List!2426)

(declare-fun call!19692 () List!2426)

(assert (=> b!194876 (= e!128171 call!19692)))

(declare-fun b!194877 () Bool)

(assert (=> b!194877 (= e!128171 call!19692)))

(declare-fun b!194878 () Bool)

(declare-fun c!35245 () Bool)

(assert (=> b!194878 (= e!128170 (ite c!35244 (t!7343 (toList!1225 lt!96639)) (ite c!35245 (Cons!2422 (h!3063 (toList!1225 lt!96639)) (t!7343 (toList!1225 lt!96639))) Nil!2423)))))

(declare-fun b!194879 () Bool)

(assert (=> b!194879 (= e!128167 call!19693)))

(declare-fun bm!19690 () Bool)

(assert (=> bm!19690 (= call!19694 ($colon$colon!102 e!128170 (ite c!35242 (h!3063 (toList!1225 lt!96639)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35243 () Bool)

(assert (=> bm!19690 (= c!35243 c!35242)))

(declare-fun b!194880 () Bool)

(assert (=> b!194880 (= c!35245 (and ((_ is Cons!2422) (toList!1225 lt!96639)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96639))) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(assert (=> b!194880 (= e!128167 e!128171)))

(declare-fun bm!19691 () Bool)

(assert (=> bm!19691 (= call!19692 call!19693)))

(assert (= (and d!57009 c!35242) b!194875))

(assert (= (and d!57009 (not c!35242)) b!194873))

(assert (= (and b!194873 c!35244) b!194879))

(assert (= (and b!194873 (not c!35244)) b!194880))

(assert (= (and b!194880 c!35245) b!194876))

(assert (= (and b!194880 (not c!35245)) b!194877))

(assert (= (or b!194876 b!194877) bm!19691))

(assert (= (or b!194879 bm!19691) bm!19689))

(assert (= (or b!194875 bm!19689) bm!19690))

(assert (= (and bm!19690 c!35243) b!194871))

(assert (= (and bm!19690 (not c!35243)) b!194878))

(assert (= (and d!57009 res!92020) b!194874))

(assert (= (and b!194874 res!92019) b!194872))

(declare-fun m!221729 () Bool)

(assert (=> d!57009 m!221729))

(declare-fun m!221731 () Bool)

(assert (=> d!57009 m!221731))

(declare-fun m!221733 () Bool)

(assert (=> b!194874 m!221733))

(declare-fun m!221735 () Bool)

(assert (=> b!194871 m!221735))

(declare-fun m!221737 () Bool)

(assert (=> b!194872 m!221737))

(declare-fun m!221739 () Bool)

(assert (=> bm!19690 m!221739))

(assert (=> d!56643 d!57009))

(declare-fun d!57011 () Bool)

(assert (=> d!57011 (= (get!2234 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194339 d!57011))

(declare-fun d!57013 () Bool)

(assert (=> d!57013 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7749 () Bool)

(assert (= bs!7749 d!57013))

(assert (=> bs!7749 m!220911))

(declare-fun m!221741 () Bool)

(assert (=> bs!7749 m!221741))

(assert (=> b!194463 d!57013))

(assert (=> b!194463 d!56745))

(declare-fun d!57015 () Bool)

(assert (=> d!57015 (= ($colon$colon!102 e!127725 (ite c!35032 (h!3063 (toList!1225 lt!96453)) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460)))) (Cons!2422 (ite c!35032 (h!3063 (toList!1225 lt!96453)) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))) e!127725))))

(assert (=> bm!19624 d!57015))

(declare-fun d!57017 () Bool)

(declare-fun res!92021 () Bool)

(declare-fun e!128172 () Bool)

(assert (=> d!57017 (=> res!92021 e!128172)))

(assert (=> d!57017 (= res!92021 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))) lt!96607)))))

(assert (=> d!57017 (= (containsKey!247 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607) e!128172)))

(declare-fun b!194881 () Bool)

(declare-fun e!128173 () Bool)

(assert (=> b!194881 (= e!128172 e!128173)))

(declare-fun res!92022 () Bool)

(assert (=> b!194881 (=> (not res!92022) (not e!128173))))

(assert (=> b!194881 (= res!92022 (and (or (not ((_ is Cons!2422) (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))) (bvsle (_1!1766 (h!3063 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))) lt!96607)) ((_ is Cons!2422) (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))) (bvslt (_1!1766 (h!3063 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))))) lt!96607)))))

(declare-fun b!194882 () Bool)

(assert (=> b!194882 (= e!128173 (containsKey!247 (t!7343 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))) lt!96607))))

(assert (= (and d!57017 (not res!92021)) b!194881))

(assert (= (and b!194881 res!92022) b!194882))

(declare-fun m!221743 () Bool)

(assert (=> b!194882 m!221743))

(assert (=> d!56689 d!57017))

(declare-fun e!128175 () Option!249)

(declare-fun b!194885 () Bool)

(assert (=> b!194885 (= e!128175 (getValueByKey!243 (t!7343 (toList!1225 lt!96913)) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun c!35246 () Bool)

(declare-fun d!57019 () Bool)

(assert (=> d!57019 (= c!35246 (and ((_ is Cons!2422) (toList!1225 lt!96913)) (= (_1!1766 (h!3063 (toList!1225 lt!96913))) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128174 () Option!249)

(assert (=> d!57019 (= (getValueByKey!243 (toList!1225 lt!96913) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) e!128174)))

(declare-fun b!194883 () Bool)

(assert (=> b!194883 (= e!128174 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96913)))))))

(declare-fun b!194884 () Bool)

(assert (=> b!194884 (= e!128174 e!128175)))

(declare-fun c!35247 () Bool)

(assert (=> b!194884 (= c!35247 (and ((_ is Cons!2422) (toList!1225 lt!96913)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96913))) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194886 () Bool)

(assert (=> b!194886 (= e!128175 None!247)))

(assert (= (and d!57019 c!35246) b!194883))

(assert (= (and d!57019 (not c!35246)) b!194884))

(assert (= (and b!194884 c!35247) b!194885))

(assert (= (and b!194884 (not c!35247)) b!194886))

(declare-fun m!221745 () Bool)

(assert (=> b!194885 m!221745))

(assert (=> b!194475 d!57019))

(declare-fun b!194887 () Bool)

(declare-fun e!128178 () SeekEntryResult!695)

(declare-fun e!128176 () SeekEntryResult!695)

(assert (=> b!194887 (= e!128178 e!128176)))

(declare-fun c!35248 () Bool)

(declare-fun lt!97101 () (_ BitVec 64))

(assert (=> b!194887 (= c!35248 (= lt!97101 key!828))))

(declare-fun lt!97100 () SeekEntryResult!695)

(declare-fun d!57021 () Bool)

(assert (=> d!57021 (and (or ((_ is Undefined!695) lt!97100) (not ((_ is Found!695) lt!97100)) (and (bvsge (index!4951 lt!97100) #b00000000000000000000000000000000) (bvslt (index!4951 lt!97100) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!97100) ((_ is Found!695) lt!97100) (not ((_ is MissingVacant!695) lt!97100)) (not (= (index!4953 lt!97100) (index!4952 lt!96548))) (and (bvsge (index!4953 lt!97100) #b00000000000000000000000000000000) (bvslt (index!4953 lt!97100) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!97100) (ite ((_ is Found!695) lt!97100) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!97100)) key!828) (and ((_ is MissingVacant!695) lt!97100) (= (index!4953 lt!97100) (index!4952 lt!96548)) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4953 lt!97100)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!57021 (= lt!97100 e!128178)))

(declare-fun c!35249 () Bool)

(assert (=> d!57021 (= c!35249 (bvsge (bvadd (x!20690 lt!96548) #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!57021 (= lt!97101 (select (arr!3862 (_keys!5952 thiss!1248)) (nextIndex!0 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248))))))

(assert (=> d!57021 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57021 (= (seekKeyOrZeroReturnVacant!0 (bvadd (x!20690 lt!96548) #b00000000000000000000000000000001) (nextIndex!0 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248)) (index!4952 lt!96548) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) lt!97100)))

(declare-fun b!194888 () Bool)

(declare-fun e!128177 () SeekEntryResult!695)

(assert (=> b!194888 (= e!128177 (MissingVacant!695 (index!4952 lt!96548)))))

(declare-fun b!194889 () Bool)

(assert (=> b!194889 (= e!128177 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20690 lt!96548) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248)) (bvadd (x!20690 lt!96548) #b00000000000000000000000000000001) (mask!9221 thiss!1248)) (index!4952 lt!96548) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun b!194890 () Bool)

(assert (=> b!194890 (= e!128176 (Found!695 (nextIndex!0 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248))))))

(declare-fun b!194891 () Bool)

(assert (=> b!194891 (= e!128178 Undefined!695)))

(declare-fun b!194892 () Bool)

(declare-fun c!35250 () Bool)

(assert (=> b!194892 (= c!35250 (= lt!97101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194892 (= e!128176 e!128177)))

(assert (= (and d!57021 c!35249) b!194891))

(assert (= (and d!57021 (not c!35249)) b!194887))

(assert (= (and b!194887 c!35248) b!194890))

(assert (= (and b!194887 (not c!35248)) b!194892))

(assert (= (and b!194892 c!35250) b!194888))

(assert (= (and b!194892 (not c!35250)) b!194889))

(declare-fun m!221747 () Bool)

(assert (=> d!57021 m!221747))

(declare-fun m!221749 () Bool)

(assert (=> d!57021 m!221749))

(assert (=> d!57021 m!220447))

(declare-fun m!221751 () Bool)

(assert (=> d!57021 m!221751))

(assert (=> d!57021 m!220205))

(assert (=> b!194889 m!220447))

(declare-fun m!221753 () Bool)

(assert (=> b!194889 m!221753))

(assert (=> b!194889 m!221753))

(declare-fun m!221755 () Bool)

(assert (=> b!194889 m!221755))

(assert (=> b!194104 d!57021))

(declare-fun d!57023 () Bool)

(declare-fun lt!97104 () (_ BitVec 32))

(assert (=> d!57023 (and (bvsge lt!97104 #b00000000000000000000000000000000) (bvslt lt!97104 (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57023 (= lt!97104 (choose!52 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248)))))

(assert (=> d!57023 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57023 (= (nextIndex!0 (index!4952 lt!96548) (x!20690 lt!96548) (mask!9221 thiss!1248)) lt!97104)))

(declare-fun bs!7750 () Bool)

(assert (= bs!7750 d!57023))

(declare-fun m!221757 () Bool)

(assert (=> bs!7750 m!221757))

(assert (=> bs!7750 m!220205))

(assert (=> b!194104 d!57023))

(declare-fun d!57025 () Bool)

(assert (=> d!57025 (= (apply!188 lt!96817 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96817) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7751 () Bool)

(assert (= bs!7751 d!57025))

(assert (=> bs!7751 m!221193))

(assert (=> bs!7751 m!221193))

(declare-fun m!221759 () Bool)

(assert (=> bs!7751 m!221759))

(assert (=> b!194318 d!57025))

(declare-fun d!57027 () Bool)

(assert (=> d!57027 (= (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!96608)) (v!4250 (getValueByKey!243 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!96608)))))

(assert (=> d!56685 d!57027))

(declare-fun e!128180 () Option!249)

(declare-fun b!194895 () Bool)

(assert (=> b!194895 (= e!128180 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))) lt!96608))))

(declare-fun d!57029 () Bool)

(declare-fun c!35251 () Bool)

(assert (=> d!57029 (= c!35251 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))) lt!96608)))))

(declare-fun e!128179 () Option!249)

(assert (=> d!57029 (= (getValueByKey!243 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!96608) e!128179)))

(declare-fun b!194893 () Bool)

(assert (=> b!194893 (= e!128179 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))))

(declare-fun b!194894 () Bool)

(assert (=> b!194894 (= e!128179 e!128180)))

(declare-fun c!35252 () Bool)

(assert (=> b!194894 (= c!35252 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96611 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))) lt!96608))))))

(declare-fun b!194896 () Bool)

(assert (=> b!194896 (= e!128180 None!247)))

(assert (= (and d!57029 c!35251) b!194893))

(assert (= (and d!57029 (not c!35251)) b!194894))

(assert (= (and b!194894 c!35252) b!194895))

(assert (= (and b!194894 (not c!35252)) b!194896))

(declare-fun m!221761 () Bool)

(assert (=> b!194895 m!221761))

(assert (=> d!56685 d!57029))

(declare-fun d!57031 () Bool)

(assert (=> d!57031 (= (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96640)) (v!4250 (getValueByKey!243 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96640)))))

(assert (=> d!56617 d!57031))

(declare-fun e!128182 () Option!249)

(declare-fun b!194899 () Bool)

(assert (=> b!194899 (= e!128182 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))) lt!96640))))

(declare-fun d!57033 () Bool)

(declare-fun c!35253 () Bool)

(assert (=> d!57033 (= c!35253 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))) lt!96640)))))

(declare-fun e!128181 () Option!249)

(assert (=> d!57033 (= (getValueByKey!243 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))) lt!96640) e!128181)))

(declare-fun b!194897 () Bool)

(assert (=> b!194897 (= e!128181 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))))))))

(declare-fun b!194898 () Bool)

(assert (=> b!194898 (= e!128181 e!128182)))

(declare-fun c!35254 () Bool)

(assert (=> b!194898 (= c!35254 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248)))))) lt!96640))))))

(declare-fun b!194900 () Bool)

(assert (=> b!194900 (= e!128182 None!247)))

(assert (= (and d!57033 c!35253) b!194897))

(assert (= (and d!57033 (not c!35253)) b!194898))

(assert (= (and b!194898 c!35254) b!194899))

(assert (= (and b!194898 (not c!35254)) b!194900))

(declare-fun m!221763 () Bool)

(assert (=> b!194899 m!221763))

(assert (=> d!56617 d!57033))

(declare-fun b!194903 () Bool)

(declare-fun e!128184 () Option!249)

(assert (=> b!194903 (= e!128184 (getValueByKey!243 (t!7343 (t!7343 (toList!1225 lt!96663))) (_1!1766 lt!96460)))))

(declare-fun d!57035 () Bool)

(declare-fun c!35255 () Bool)

(assert (=> d!57035 (= c!35255 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96663))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96663)))) (_1!1766 lt!96460))))))

(declare-fun e!128183 () Option!249)

(assert (=> d!57035 (= (getValueByKey!243 (t!7343 (toList!1225 lt!96663)) (_1!1766 lt!96460)) e!128183)))

(declare-fun b!194901 () Bool)

(assert (=> b!194901 (= e!128183 (Some!248 (_2!1766 (h!3063 (t!7343 (toList!1225 lt!96663))))))))

(declare-fun b!194902 () Bool)

(assert (=> b!194902 (= e!128183 e!128184)))

(declare-fun c!35256 () Bool)

(assert (=> b!194902 (= c!35256 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96663))) (not (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96663)))) (_1!1766 lt!96460)))))))

(declare-fun b!194904 () Bool)

(assert (=> b!194904 (= e!128184 None!247)))

(assert (= (and d!57035 c!35255) b!194901))

(assert (= (and d!57035 (not c!35255)) b!194902))

(assert (= (and b!194902 c!35256) b!194903))

(assert (= (and b!194902 (not c!35256)) b!194904))

(declare-fun m!221765 () Bool)

(assert (=> b!194903 m!221765))

(assert (=> b!194279 d!57035))

(declare-fun d!57037 () Bool)

(declare-fun lt!97105 () Bool)

(assert (=> d!57037 (= lt!97105 (select (content!155 (t!7343 (toList!1225 lt!96663))) lt!96460))))

(declare-fun e!128185 () Bool)

(assert (=> d!57037 (= lt!97105 e!128185)))

(declare-fun res!92024 () Bool)

(assert (=> d!57037 (=> (not res!92024) (not e!128185))))

(assert (=> d!57037 (= res!92024 ((_ is Cons!2422) (t!7343 (toList!1225 lt!96663))))))

(assert (=> d!57037 (= (contains!1359 (t!7343 (toList!1225 lt!96663)) lt!96460) lt!97105)))

(declare-fun b!194905 () Bool)

(declare-fun e!128186 () Bool)

(assert (=> b!194905 (= e!128185 e!128186)))

(declare-fun res!92023 () Bool)

(assert (=> b!194905 (=> res!92023 e!128186)))

(assert (=> b!194905 (= res!92023 (= (h!3063 (t!7343 (toList!1225 lt!96663))) lt!96460))))

(declare-fun b!194906 () Bool)

(assert (=> b!194906 (= e!128186 (contains!1359 (t!7343 (t!7343 (toList!1225 lt!96663))) lt!96460))))

(assert (= (and d!57037 res!92024) b!194905))

(assert (= (and b!194905 (not res!92023)) b!194906))

(assert (=> d!57037 m!221437))

(declare-fun m!221767 () Bool)

(assert (=> d!57037 m!221767))

(declare-fun m!221769 () Bool)

(assert (=> b!194906 m!221769))

(assert (=> b!194480 d!57037))

(assert (=> b!194189 d!56539))

(declare-fun d!57039 () Bool)

(assert (=> d!57039 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))

(declare-fun lt!97106 () Unit!5819)

(assert (=> d!57039 (= lt!97106 (choose!1075 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))

(declare-fun e!128187 () Bool)

(assert (=> d!57039 e!128187))

(declare-fun res!92025 () Bool)

(assert (=> d!57039 (=> (not res!92025) (not e!128187))))

(assert (=> d!57039 (= res!92025 (isStrictlySorted!352 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57039 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607) lt!97106)))

(declare-fun b!194907 () Bool)

(assert (=> b!194907 (= e!128187 (containsKey!247 (toList!1225 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248)))) lt!96607))))

(assert (= (and d!57039 res!92025) b!194907))

(assert (=> d!57039 m!220955))

(assert (=> d!57039 m!220955))

(assert (=> d!57039 m!220957))

(declare-fun m!221771 () Bool)

(assert (=> d!57039 m!221771))

(declare-fun m!221773 () Bool)

(assert (=> d!57039 m!221773))

(assert (=> b!194907 m!220951))

(assert (=> b!194466 d!57039))

(assert (=> b!194466 d!56853))

(assert (=> b!194466 d!56855))

(declare-fun d!57041 () Bool)

(declare-fun lt!97107 () Bool)

(assert (=> d!57041 (= lt!97107 (select (content!155 (toList!1225 lt!96858)) (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))

(declare-fun e!128188 () Bool)

(assert (=> d!57041 (= lt!97107 e!128188)))

(declare-fun res!92027 () Bool)

(assert (=> d!57041 (=> (not res!92027) (not e!128188))))

(assert (=> d!57041 (= res!92027 ((_ is Cons!2422) (toList!1225 lt!96858)))))

(assert (=> d!57041 (= (contains!1359 (toList!1225 lt!96858) (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))) lt!97107)))

(declare-fun b!194908 () Bool)

(declare-fun e!128189 () Bool)

(assert (=> b!194908 (= e!128188 e!128189)))

(declare-fun res!92026 () Bool)

(assert (=> b!194908 (=> res!92026 e!128189)))

(assert (=> b!194908 (= res!92026 (= (h!3063 (toList!1225 lt!96858)) (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))

(declare-fun b!194909 () Bool)

(assert (=> b!194909 (= e!128189 (contains!1359 (t!7343 (toList!1225 lt!96858)) (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57041 res!92027) b!194908))

(assert (= (and b!194908 (not res!92026)) b!194909))

(declare-fun m!221775 () Bool)

(assert (=> d!57041 m!221775))

(declare-fun m!221777 () Bool)

(assert (=> d!57041 m!221777))

(declare-fun m!221779 () Bool)

(assert (=> b!194909 m!221779))

(assert (=> b!194365 d!57041))

(declare-fun d!57043 () Bool)

(assert (=> d!57043 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4250 (getValueByKey!243 (toList!1225 lt!96632) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56591 d!57043))

(assert (=> d!56591 d!56777))

(assert (=> b!194386 d!56967))

(declare-fun d!57045 () Bool)

(assert (=> d!57045 (= (isDefined!197 (getValueByKey!243 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))) (not (isEmpty!492 (getValueByKey!243 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))))

(declare-fun bs!7752 () Bool)

(assert (= bs!7752 d!57045))

(assert (=> bs!7752 m!220429))

(declare-fun m!221781 () Bool)

(assert (=> bs!7752 m!221781))

(assert (=> b!194074 d!57045))

(declare-fun e!128191 () Option!249)

(declare-fun b!194912 () Bool)

(assert (=> b!194912 (= e!128191 (getValueByKey!243 (t!7343 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun d!57047 () Bool)

(declare-fun c!35257 () Bool)

(assert (=> d!57047 (= c!35257 (and ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (= (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(declare-fun e!128190 () Option!249)

(assert (=> d!57047 (= (getValueByKey!243 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) e!128190)))

(declare-fun b!194910 () Bool)

(assert (=> b!194910 (= e!128190 (Some!248 (_2!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))))))

(declare-fun b!194911 () Bool)

(assert (=> b!194911 (= e!128190 e!128191)))

(declare-fun c!35258 () Bool)

(assert (=> b!194911 (= c!35258 (and ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (not (= (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))))

(declare-fun b!194913 () Bool)

(assert (=> b!194913 (= e!128191 None!247)))

(assert (= (and d!57047 c!35257) b!194910))

(assert (= (and d!57047 (not c!35257)) b!194911))

(assert (= (and b!194911 c!35258) b!194912))

(assert (= (and b!194911 (not c!35258)) b!194913))

(assert (=> b!194912 m!220093))

(declare-fun m!221783 () Bool)

(assert (=> b!194912 m!221783))

(assert (=> b!194074 d!57047))

(declare-fun d!57049 () Bool)

(declare-fun e!128192 () Bool)

(assert (=> d!57049 e!128192))

(declare-fun res!92028 () Bool)

(assert (=> d!57049 (=> (not res!92028) (not e!128192))))

(declare-fun lt!97108 () ListLongMap!2419)

(assert (=> d!57049 (= res!92028 (contains!1356 lt!97108 (_1!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97110 () List!2426)

(assert (=> d!57049 (= lt!97108 (ListLongMap!2420 lt!97110))))

(declare-fun lt!97111 () Unit!5819)

(declare-fun lt!97109 () Unit!5819)

(assert (=> d!57049 (= lt!97111 lt!97109)))

(assert (=> d!57049 (= (getValueByKey!243 lt!97110 (_1!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57049 (= lt!97109 (lemmaContainsTupThenGetReturnValue!133 lt!97110 (_1!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57049 (= lt!97110 (insertStrictlySorted!136 (toList!1225 lt!96802) (_1!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57049 (= (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))) lt!97108)))

(declare-fun b!194914 () Bool)

(declare-fun res!92029 () Bool)

(assert (=> b!194914 (=> (not res!92029) (not e!128192))))

(assert (=> b!194914 (= res!92029 (= (getValueByKey!243 (toList!1225 lt!97108) (_1!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194915 () Bool)

(assert (=> b!194915 (= e!128192 (contains!1359 (toList!1225 lt!97108) (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57049 res!92028) b!194914))

(assert (= (and b!194914 res!92029) b!194915))

(declare-fun m!221785 () Bool)

(assert (=> d!57049 m!221785))

(declare-fun m!221787 () Bool)

(assert (=> d!57049 m!221787))

(declare-fun m!221789 () Bool)

(assert (=> d!57049 m!221789))

(declare-fun m!221791 () Bool)

(assert (=> d!57049 m!221791))

(declare-fun m!221793 () Bool)

(assert (=> b!194914 m!221793))

(declare-fun m!221795 () Bool)

(assert (=> b!194915 m!221795))

(assert (=> b!194289 d!57049))

(declare-fun d!57051 () Bool)

(declare-fun e!128193 () Bool)

(assert (=> d!57051 e!128193))

(declare-fun res!92030 () Bool)

(assert (=> d!57051 (=> (not res!92030) (not e!128193))))

(declare-fun lt!97112 () ListLongMap!2419)

(assert (=> d!57051 (= res!92030 (contains!1356 lt!97112 (_1!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97114 () List!2426)

(assert (=> d!57051 (= lt!97112 (ListLongMap!2420 lt!97114))))

(declare-fun lt!97115 () Unit!5819)

(declare-fun lt!97113 () Unit!5819)

(assert (=> d!57051 (= lt!97115 lt!97113)))

(assert (=> d!57051 (= (getValueByKey!243 lt!97114 (_1!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57051 (= lt!97113 (lemmaContainsTupThenGetReturnValue!133 lt!97114 (_1!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57051 (= lt!97114 (insertStrictlySorted!136 (toList!1225 lt!96790) (_1!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57051 (= (+!317 lt!96790 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))) lt!97112)))

(declare-fun b!194916 () Bool)

(declare-fun res!92031 () Bool)

(assert (=> b!194916 (=> (not res!92031) (not e!128193))))

(assert (=> b!194916 (= res!92031 (= (getValueByKey!243 (toList!1225 lt!97112) (_1!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194917 () Bool)

(assert (=> b!194917 (= e!128193 (contains!1359 (toList!1225 lt!97112) (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))))))

(assert (= (and d!57051 res!92030) b!194916))

(assert (= (and b!194916 res!92031) b!194917))

(declare-fun m!221797 () Bool)

(assert (=> d!57051 m!221797))

(declare-fun m!221799 () Bool)

(assert (=> d!57051 m!221799))

(declare-fun m!221801 () Bool)

(assert (=> d!57051 m!221801))

(declare-fun m!221803 () Bool)

(assert (=> d!57051 m!221803))

(declare-fun m!221805 () Bool)

(assert (=> b!194916 m!221805))

(declare-fun m!221807 () Bool)

(assert (=> b!194917 m!221807))

(assert (=> b!194289 d!57051))

(declare-fun d!57053 () Bool)

(assert (=> d!57053 (= (apply!188 (+!317 lt!96790 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))) lt!96803) (apply!188 lt!96790 lt!96803))))

(declare-fun lt!97116 () Unit!5819)

(assert (=> d!57053 (= lt!97116 (choose!1076 lt!96790 lt!96805 (zeroValue!3800 thiss!1248) lt!96803))))

(declare-fun e!128194 () Bool)

(assert (=> d!57053 e!128194))

(declare-fun res!92032 () Bool)

(assert (=> d!57053 (=> (not res!92032) (not e!128194))))

(assert (=> d!57053 (= res!92032 (contains!1356 lt!96790 lt!96803))))

(assert (=> d!57053 (= (addApplyDifferent!164 lt!96790 lt!96805 (zeroValue!3800 thiss!1248) lt!96803) lt!97116)))

(declare-fun b!194918 () Bool)

(assert (=> b!194918 (= e!128194 (not (= lt!96803 lt!96805)))))

(assert (= (and d!57053 res!92032) b!194918))

(assert (=> d!57053 m!220671))

(assert (=> d!57053 m!220673))

(assert (=> d!57053 m!220681))

(declare-fun m!221809 () Bool)

(assert (=> d!57053 m!221809))

(declare-fun m!221811 () Bool)

(assert (=> d!57053 m!221811))

(assert (=> d!57053 m!220671))

(assert (=> b!194289 d!57053))

(declare-fun d!57055 () Bool)

(assert (=> d!57055 (= (apply!188 (+!317 lt!96796 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))) lt!96793) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96796 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))) lt!96793)))))

(declare-fun bs!7753 () Bool)

(assert (= bs!7753 d!57055))

(declare-fun m!221813 () Bool)

(assert (=> bs!7753 m!221813))

(assert (=> bs!7753 m!221813))

(declare-fun m!221815 () Bool)

(assert (=> bs!7753 m!221815))

(assert (=> b!194289 d!57055))

(declare-fun d!57057 () Bool)

(assert (=> d!57057 (= (apply!188 lt!96790 lt!96803) (get!2232 (getValueByKey!243 (toList!1225 lt!96790) lt!96803)))))

(declare-fun bs!7754 () Bool)

(assert (= bs!7754 d!57057))

(declare-fun m!221817 () Bool)

(assert (=> bs!7754 m!221817))

(assert (=> bs!7754 m!221817))

(declare-fun m!221819 () Bool)

(assert (=> bs!7754 m!221819))

(assert (=> b!194289 d!57057))

(declare-fun d!57059 () Bool)

(assert (=> d!57059 (= (apply!188 lt!96796 lt!96793) (get!2232 (getValueByKey!243 (toList!1225 lt!96796) lt!96793)))))

(declare-fun bs!7755 () Bool)

(assert (= bs!7755 d!57059))

(declare-fun m!221821 () Bool)

(assert (=> bs!7755 m!221821))

(assert (=> bs!7755 m!221821))

(declare-fun m!221823 () Bool)

(assert (=> bs!7755 m!221823))

(assert (=> b!194289 d!57059))

(declare-fun d!57061 () Bool)

(declare-fun e!128196 () Bool)

(assert (=> d!57061 e!128196))

(declare-fun res!92033 () Bool)

(assert (=> d!57061 (=> res!92033 e!128196)))

(declare-fun lt!97119 () Bool)

(assert (=> d!57061 (= res!92033 (not lt!97119))))

(declare-fun lt!97120 () Bool)

(assert (=> d!57061 (= lt!97119 lt!97120)))

(declare-fun lt!97118 () Unit!5819)

(declare-fun e!128195 () Unit!5819)

(assert (=> d!57061 (= lt!97118 e!128195)))

(declare-fun c!35259 () Bool)

(assert (=> d!57061 (= c!35259 lt!97120)))

(assert (=> d!57061 (= lt!97120 (containsKey!247 (toList!1225 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))) lt!96792))))

(assert (=> d!57061 (= (contains!1356 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))) lt!96792) lt!97119)))

(declare-fun b!194919 () Bool)

(declare-fun lt!97117 () Unit!5819)

(assert (=> b!194919 (= e!128195 lt!97117)))

(assert (=> b!194919 (= lt!97117 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))) lt!96792))))

(assert (=> b!194919 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))) lt!96792))))

(declare-fun b!194920 () Bool)

(declare-fun Unit!5867 () Unit!5819)

(assert (=> b!194920 (= e!128195 Unit!5867)))

(declare-fun b!194921 () Bool)

(assert (=> b!194921 (= e!128196 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248)))) lt!96792)))))

(assert (= (and d!57061 c!35259) b!194919))

(assert (= (and d!57061 (not c!35259)) b!194920))

(assert (= (and d!57061 (not res!92033)) b!194921))

(declare-fun m!221825 () Bool)

(assert (=> d!57061 m!221825))

(declare-fun m!221827 () Bool)

(assert (=> b!194919 m!221827))

(declare-fun m!221829 () Bool)

(assert (=> b!194919 m!221829))

(assert (=> b!194919 m!221829))

(declare-fun m!221831 () Bool)

(assert (=> b!194919 m!221831))

(assert (=> b!194921 m!221829))

(assert (=> b!194921 m!221829))

(assert (=> b!194921 m!221831))

(assert (=> b!194289 d!57061))

(declare-fun d!57063 () Bool)

(declare-fun e!128197 () Bool)

(assert (=> d!57063 e!128197))

(declare-fun res!92034 () Bool)

(assert (=> d!57063 (=> (not res!92034) (not e!128197))))

(declare-fun lt!97121 () ListLongMap!2419)

(assert (=> d!57063 (= res!92034 (contains!1356 lt!97121 (_1!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97123 () List!2426)

(assert (=> d!57063 (= lt!97121 (ListLongMap!2420 lt!97123))))

(declare-fun lt!97124 () Unit!5819)

(declare-fun lt!97122 () Unit!5819)

(assert (=> d!57063 (= lt!97124 lt!97122)))

(assert (=> d!57063 (= (getValueByKey!243 lt!97123 (_1!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))))))

(assert (=> d!57063 (= lt!97122 (lemmaContainsTupThenGetReturnValue!133 lt!97123 (_1!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))))))

(assert (=> d!57063 (= lt!97123 (insertStrictlySorted!136 (toList!1225 lt!96791) (_1!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))))))

(assert (=> d!57063 (= (+!317 lt!96791 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))) lt!97121)))

(declare-fun b!194922 () Bool)

(declare-fun res!92035 () Bool)

(assert (=> b!194922 (=> (not res!92035) (not e!128197))))

(assert (=> b!194922 (= res!92035 (= (getValueByKey!243 (toList!1225 lt!97121) (_1!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))))))))

(declare-fun b!194923 () Bool)

(assert (=> b!194923 (= e!128197 (contains!1359 (toList!1225 lt!97121) (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))))))

(assert (= (and d!57063 res!92034) b!194922))

(assert (= (and b!194922 res!92035) b!194923))

(declare-fun m!221833 () Bool)

(assert (=> d!57063 m!221833))

(declare-fun m!221835 () Bool)

(assert (=> d!57063 m!221835))

(declare-fun m!221837 () Bool)

(assert (=> d!57063 m!221837))

(declare-fun m!221839 () Bool)

(assert (=> d!57063 m!221839))

(declare-fun m!221841 () Bool)

(assert (=> b!194922 m!221841))

(declare-fun m!221843 () Bool)

(assert (=> b!194923 m!221843))

(assert (=> b!194289 d!57063))

(declare-fun d!57065 () Bool)

(declare-fun e!128198 () Bool)

(assert (=> d!57065 e!128198))

(declare-fun res!92036 () Bool)

(assert (=> d!57065 (=> (not res!92036) (not e!128198))))

(declare-fun lt!97125 () ListLongMap!2419)

(assert (=> d!57065 (= res!92036 (contains!1356 lt!97125 (_1!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97127 () List!2426)

(assert (=> d!57065 (= lt!97125 (ListLongMap!2420 lt!97127))))

(declare-fun lt!97128 () Unit!5819)

(declare-fun lt!97126 () Unit!5819)

(assert (=> d!57065 (= lt!97128 lt!97126)))

(assert (=> d!57065 (= (getValueByKey!243 lt!97127 (_1!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))))))

(assert (=> d!57065 (= lt!97126 (lemmaContainsTupThenGetReturnValue!133 lt!97127 (_1!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))))))

(assert (=> d!57065 (= lt!97127 (insertStrictlySorted!136 (toList!1225 lt!96796) (_1!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))))))

(assert (=> d!57065 (= (+!317 lt!96796 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))) lt!97125)))

(declare-fun b!194924 () Bool)

(declare-fun res!92037 () Bool)

(assert (=> b!194924 (=> (not res!92037) (not e!128198))))

(assert (=> b!194924 (= res!92037 (= (getValueByKey!243 (toList!1225 lt!97125) (_1!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))))))))

(declare-fun b!194925 () Bool)

(assert (=> b!194925 (= e!128198 (contains!1359 (toList!1225 lt!97125) (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))))))

(assert (= (and d!57065 res!92036) b!194924))

(assert (= (and b!194924 res!92037) b!194925))

(declare-fun m!221845 () Bool)

(assert (=> d!57065 m!221845))

(declare-fun m!221847 () Bool)

(assert (=> d!57065 m!221847))

(declare-fun m!221849 () Bool)

(assert (=> d!57065 m!221849))

(declare-fun m!221851 () Bool)

(assert (=> d!57065 m!221851))

(declare-fun m!221853 () Bool)

(assert (=> b!194924 m!221853))

(declare-fun m!221855 () Bool)

(assert (=> b!194925 m!221855))

(assert (=> b!194289 d!57065))

(declare-fun d!57067 () Bool)

(assert (=> d!57067 (= (apply!188 (+!317 lt!96791 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))) lt!96806) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96791 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248)))) lt!96806)))))

(declare-fun bs!7756 () Bool)

(assert (= bs!7756 d!57067))

(declare-fun m!221857 () Bool)

(assert (=> bs!7756 m!221857))

(assert (=> bs!7756 m!221857))

(declare-fun m!221859 () Bool)

(assert (=> bs!7756 m!221859))

(assert (=> b!194289 d!57067))

(declare-fun d!57069 () Bool)

(assert (=> d!57069 (= (apply!188 (+!317 lt!96791 (tuple2!3511 lt!96794 (minValue!3800 thiss!1248))) lt!96806) (apply!188 lt!96791 lt!96806))))

(declare-fun lt!97129 () Unit!5819)

(assert (=> d!57069 (= lt!97129 (choose!1076 lt!96791 lt!96794 (minValue!3800 thiss!1248) lt!96806))))

(declare-fun e!128199 () Bool)

(assert (=> d!57069 e!128199))

(declare-fun res!92038 () Bool)

(assert (=> d!57069 (=> (not res!92038) (not e!128199))))

(assert (=> d!57069 (= res!92038 (contains!1356 lt!96791 lt!96806))))

(assert (=> d!57069 (= (addApplyDifferent!164 lt!96791 lt!96794 (minValue!3800 thiss!1248) lt!96806) lt!97129)))

(declare-fun b!194926 () Bool)

(assert (=> b!194926 (= e!128199 (not (= lt!96806 lt!96794)))))

(assert (= (and d!57069 res!92038) b!194926))

(assert (=> d!57069 m!220679))

(assert (=> d!57069 m!220691))

(assert (=> d!57069 m!220687))

(declare-fun m!221861 () Bool)

(assert (=> d!57069 m!221861))

(declare-fun m!221863 () Bool)

(assert (=> d!57069 m!221863))

(assert (=> d!57069 m!220679))

(assert (=> b!194289 d!57069))

(declare-fun d!57071 () Bool)

(assert (=> d!57071 (contains!1356 (+!317 lt!96802 (tuple2!3511 lt!96800 (zeroValue!3800 thiss!1248))) lt!96792)))

(declare-fun lt!97130 () Unit!5819)

(assert (=> d!57071 (= lt!97130 (choose!1077 lt!96802 lt!96800 (zeroValue!3800 thiss!1248) lt!96792))))

(assert (=> d!57071 (contains!1356 lt!96802 lt!96792)))

(assert (=> d!57071 (= (addStillContains!164 lt!96802 lt!96800 (zeroValue!3800 thiss!1248) lt!96792) lt!97130)))

(declare-fun bs!7757 () Bool)

(assert (= bs!7757 d!57071))

(assert (=> bs!7757 m!220675))

(assert (=> bs!7757 m!220675))

(assert (=> bs!7757 m!220677))

(declare-fun m!221865 () Bool)

(assert (=> bs!7757 m!221865))

(declare-fun m!221867 () Bool)

(assert (=> bs!7757 m!221867))

(assert (=> b!194289 d!57071))

(declare-fun d!57073 () Bool)

(assert (=> d!57073 (= (apply!188 lt!96791 lt!96806) (get!2232 (getValueByKey!243 (toList!1225 lt!96791) lt!96806)))))

(declare-fun bs!7758 () Bool)

(assert (= bs!7758 d!57073))

(declare-fun m!221869 () Bool)

(assert (=> bs!7758 m!221869))

(assert (=> bs!7758 m!221869))

(declare-fun m!221871 () Bool)

(assert (=> bs!7758 m!221871))

(assert (=> b!194289 d!57073))

(declare-fun d!57075 () Bool)

(assert (=> d!57075 (= (apply!188 (+!317 lt!96790 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248))) lt!96803) (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96790 (tuple2!3511 lt!96805 (zeroValue!3800 thiss!1248)))) lt!96803)))))

(declare-fun bs!7759 () Bool)

(assert (= bs!7759 d!57075))

(declare-fun m!221873 () Bool)

(assert (=> bs!7759 m!221873))

(assert (=> bs!7759 m!221873))

(declare-fun m!221875 () Bool)

(assert (=> bs!7759 m!221875))

(assert (=> b!194289 d!57075))

(declare-fun d!57077 () Bool)

(declare-fun e!128205 () Bool)

(assert (=> d!57077 e!128205))

(declare-fun res!92039 () Bool)

(assert (=> d!57077 (=> (not res!92039) (not e!128205))))

(declare-fun lt!97136 () ListLongMap!2419)

(assert (=> d!57077 (= res!92039 (not (contains!1356 lt!97136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128201 () ListLongMap!2419)

(assert (=> d!57077 (= lt!97136 e!128201)))

(declare-fun c!35262 () Bool)

(assert (=> d!57077 (= c!35262 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!57077 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57077 (= (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)) lt!97136)))

(declare-fun b!194927 () Bool)

(declare-fun lt!97131 () Unit!5819)

(declare-fun lt!97132 () Unit!5819)

(assert (=> b!194927 (= lt!97131 lt!97132)))

(declare-fun lt!97137 () ListLongMap!2419)

(declare-fun lt!97135 () V!5633)

(declare-fun lt!97134 () (_ BitVec 64))

(declare-fun lt!97133 () (_ BitVec 64))

(assert (=> b!194927 (not (contains!1356 (+!317 lt!97137 (tuple2!3511 lt!97134 lt!97135)) lt!97133))))

(assert (=> b!194927 (= lt!97132 (addStillNotContains!98 lt!97137 lt!97134 lt!97135 lt!97133))))

(assert (=> b!194927 (= lt!97133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!194927 (= lt!97135 (get!2231 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!194927 (= lt!97134 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19695 () ListLongMap!2419)

(assert (=> b!194927 (= lt!97137 call!19695)))

(declare-fun e!128206 () ListLongMap!2419)

(assert (=> b!194927 (= e!128206 (+!317 call!19695 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!194928 () Bool)

(declare-fun e!128200 () Bool)

(declare-fun e!128202 () Bool)

(assert (=> b!194928 (= e!128200 e!128202)))

(declare-fun c!35263 () Bool)

(assert (=> b!194928 (= c!35263 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194929 () Bool)

(assert (=> b!194929 (= e!128202 (isEmpty!491 lt!97136))))

(declare-fun b!194930 () Bool)

(declare-fun e!128204 () Bool)

(assert (=> b!194930 (= e!128204 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194930 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!19692 () Bool)

(assert (=> bm!19692 (= call!19695 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!194931 () Bool)

(assert (=> b!194931 (= e!128205 e!128200)))

(declare-fun c!35260 () Bool)

(assert (=> b!194931 (= c!35260 e!128204)))

(declare-fun res!92041 () Bool)

(assert (=> b!194931 (=> (not res!92041) (not e!128204))))

(assert (=> b!194931 (= res!92041 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!194932 () Bool)

(assert (=> b!194932 (= e!128201 (ListLongMap!2420 Nil!2423))))

(declare-fun b!194933 () Bool)

(assert (=> b!194933 (= e!128206 call!19695)))

(declare-fun b!194934 () Bool)

(assert (=> b!194934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!194934 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))))))))

(declare-fun e!128203 () Bool)

(assert (=> b!194934 (= e!128203 (= (apply!188 lt!97136 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194935 () Bool)

(assert (=> b!194935 (= e!128200 e!128203)))

(assert (=> b!194935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!92042 () Bool)

(assert (=> b!194935 (= res!92042 (contains!1356 lt!97136 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!194935 (=> (not res!92042) (not e!128203))))

(declare-fun b!194936 () Bool)

(declare-fun res!92040 () Bool)

(assert (=> b!194936 (=> (not res!92040) (not e!128205))))

(assert (=> b!194936 (= res!92040 (not (contains!1356 lt!97136 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!194937 () Bool)

(assert (=> b!194937 (= e!128201 e!128206)))

(declare-fun c!35261 () Bool)

(assert (=> b!194937 (= c!35261 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!194938 () Bool)

(assert (=> b!194938 (= e!128202 (= lt!97136 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248))) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!57077 c!35262) b!194932))

(assert (= (and d!57077 (not c!35262)) b!194937))

(assert (= (and b!194937 c!35261) b!194927))

(assert (= (and b!194937 (not c!35261)) b!194933))

(assert (= (or b!194927 b!194933) bm!19692))

(assert (= (and d!57077 res!92039) b!194936))

(assert (= (and b!194936 res!92040) b!194931))

(assert (= (and b!194931 res!92041) b!194930))

(assert (= (and b!194931 c!35260) b!194935))

(assert (= (and b!194931 (not c!35260)) b!194928))

(assert (= (and b!194935 res!92042) b!194934))

(assert (= (and b!194928 c!35263) b!194938))

(assert (= (and b!194928 (not c!35263)) b!194929))

(declare-fun b_lambda!7499 () Bool)

(assert (=> (not b_lambda!7499) (not b!194927)))

(assert (=> b!194927 t!7347))

(declare-fun b_and!11435 () Bool)

(assert (= b_and!11433 (and (=> t!7347 result!4931) b_and!11435)))

(declare-fun b_lambda!7501 () Bool)

(assert (=> (not b_lambda!7501) (not b!194934)))

(assert (=> b!194934 t!7347))

(declare-fun b_and!11437 () Bool)

(assert (= b_and!11435 (and (=> t!7347 result!4931) b_and!11437)))

(assert (=> b!194930 m!220231))

(assert (=> b!194930 m!220231))

(assert (=> b!194930 m!220233))

(assert (=> b!194937 m!220231))

(assert (=> b!194937 m!220231))

(assert (=> b!194937 m!220233))

(declare-fun m!221877 () Bool)

(assert (=> b!194929 m!221877))

(assert (=> b!194935 m!220231))

(assert (=> b!194935 m!220231))

(declare-fun m!221879 () Bool)

(assert (=> b!194935 m!221879))

(declare-fun m!221881 () Bool)

(assert (=> b!194936 m!221881))

(declare-fun m!221883 () Bool)

(assert (=> bm!19692 m!221883))

(assert (=> b!194938 m!221883))

(assert (=> b!194927 m!220661))

(assert (=> b!194927 m!220243))

(assert (=> b!194927 m!220663))

(assert (=> b!194927 m!220231))

(declare-fun m!221885 () Bool)

(assert (=> b!194927 m!221885))

(assert (=> b!194927 m!220243))

(assert (=> b!194927 m!220661))

(declare-fun m!221887 () Bool)

(assert (=> b!194927 m!221887))

(declare-fun m!221889 () Bool)

(assert (=> b!194927 m!221889))

(declare-fun m!221891 () Bool)

(assert (=> b!194927 m!221891))

(assert (=> b!194927 m!221887))

(assert (=> b!194934 m!220661))

(assert (=> b!194934 m!220243))

(assert (=> b!194934 m!220663))

(assert (=> b!194934 m!220231))

(assert (=> b!194934 m!220231))

(declare-fun m!221893 () Bool)

(assert (=> b!194934 m!221893))

(assert (=> b!194934 m!220243))

(assert (=> b!194934 m!220661))

(declare-fun m!221895 () Bool)

(assert (=> d!57077 m!221895))

(assert (=> d!57077 m!220205))

(assert (=> b!194289 d!57077))

(declare-fun d!57079 () Bool)

(assert (=> d!57079 (= (apply!188 (+!317 lt!96796 (tuple2!3511 lt!96804 (minValue!3800 thiss!1248))) lt!96793) (apply!188 lt!96796 lt!96793))))

(declare-fun lt!97138 () Unit!5819)

(assert (=> d!57079 (= lt!97138 (choose!1076 lt!96796 lt!96804 (minValue!3800 thiss!1248) lt!96793))))

(declare-fun e!128207 () Bool)

(assert (=> d!57079 e!128207))

(declare-fun res!92043 () Bool)

(assert (=> d!57079 (=> (not res!92043) (not e!128207))))

(assert (=> d!57079 (= res!92043 (contains!1356 lt!96796 lt!96793))))

(assert (=> d!57079 (= (addApplyDifferent!164 lt!96796 lt!96804 (minValue!3800 thiss!1248) lt!96793) lt!97138)))

(declare-fun b!194939 () Bool)

(assert (=> b!194939 (= e!128207 (not (= lt!96793 lt!96804)))))

(assert (= (and d!57079 res!92043) b!194939))

(assert (=> d!57079 m!220683))

(assert (=> d!57079 m!220685))

(assert (=> d!57079 m!220695))

(declare-fun m!221897 () Bool)

(assert (=> d!57079 m!221897))

(declare-fun m!221899 () Bool)

(assert (=> d!57079 m!221899))

(assert (=> d!57079 m!220683))

(assert (=> b!194289 d!57079))

(declare-fun d!57081 () Bool)

(declare-fun lt!97139 () Bool)

(assert (=> d!57081 (= lt!97139 (select (content!155 lt!96725) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun e!128208 () Bool)

(assert (=> d!57081 (= lt!97139 e!128208)))

(declare-fun res!92045 () Bool)

(assert (=> d!57081 (=> (not res!92045) (not e!128208))))

(assert (=> d!57081 (= res!92045 ((_ is Cons!2422) lt!96725))))

(assert (=> d!57081 (= (contains!1359 lt!96725 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))) lt!97139)))

(declare-fun b!194940 () Bool)

(declare-fun e!128209 () Bool)

(assert (=> b!194940 (= e!128208 e!128209)))

(declare-fun res!92044 () Bool)

(assert (=> b!194940 (=> res!92044 e!128209)))

(assert (=> b!194940 (= res!92044 (= (h!3063 lt!96725) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!194941 () Bool)

(assert (=> b!194941 (= e!128209 (contains!1359 (t!7343 lt!96725) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(assert (= (and d!57081 res!92045) b!194940))

(assert (= (and b!194940 (not res!92044)) b!194941))

(declare-fun m!221901 () Bool)

(assert (=> d!57081 m!221901))

(declare-fun m!221903 () Bool)

(assert (=> d!57081 m!221903))

(declare-fun m!221905 () Bool)

(assert (=> b!194941 m!221905))

(assert (=> b!194146 d!57081))

(declare-fun d!57083 () Bool)

(declare-fun res!92046 () Bool)

(declare-fun e!128210 () Bool)

(assert (=> d!57083 (=> res!92046 e!128210)))

(assert (=> d!57083 (= res!92046 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (= (_1!1766 (h!3063 (toList!1225 lt!96610))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!57083 (= (containsKey!247 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) e!128210)))

(declare-fun b!194942 () Bool)

(declare-fun e!128211 () Bool)

(assert (=> b!194942 (= e!128210 e!128211)))

(declare-fun res!92047 () Bool)

(assert (=> b!194942 (=> (not res!92047) (not e!128211))))

(assert (=> b!194942 (= res!92047 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96610))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96610))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2422) (toList!1225 lt!96610)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96610))) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!194943 () Bool)

(assert (=> b!194943 (= e!128211 (containsKey!247 (t!7343 (toList!1225 lt!96610)) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!57083 (not res!92046)) b!194942))

(assert (= (and b!194942 res!92047) b!194943))

(assert (=> b!194943 m!220231))

(declare-fun m!221907 () Bool)

(assert (=> b!194943 m!221907))

(assert (=> d!56537 d!57083))

(assert (=> b!194324 d!56733))

(declare-fun d!57085 () Bool)

(declare-fun e!128213 () Bool)

(assert (=> d!57085 e!128213))

(declare-fun res!92048 () Bool)

(assert (=> d!57085 (=> res!92048 e!128213)))

(declare-fun lt!97142 () Bool)

(assert (=> d!57085 (= res!92048 (not lt!97142))))

(declare-fun lt!97143 () Bool)

(assert (=> d!57085 (= lt!97142 lt!97143)))

(declare-fun lt!97141 () Unit!5819)

(declare-fun e!128212 () Unit!5819)

(assert (=> d!57085 (= lt!97141 e!128212)))

(declare-fun c!35264 () Bool)

(assert (=> d!57085 (= c!35264 lt!97143)))

(assert (=> d!57085 (= lt!97143 (containsKey!247 (toList!1225 lt!96913) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(assert (=> d!57085 (= (contains!1356 lt!96913 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!97142)))

(declare-fun b!194944 () Bool)

(declare-fun lt!97140 () Unit!5819)

(assert (=> b!194944 (= e!128212 lt!97140)))

(assert (=> b!194944 (= lt!97140 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96913) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(assert (=> b!194944 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96913) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194945 () Bool)

(declare-fun Unit!5868 () Unit!5819)

(assert (=> b!194945 (= e!128212 Unit!5868)))

(declare-fun b!194946 () Bool)

(assert (=> b!194946 (= e!128213 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96913) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57085 c!35264) b!194944))

(assert (= (and d!57085 (not c!35264)) b!194945))

(assert (= (and d!57085 (not res!92048)) b!194946))

(declare-fun m!221909 () Bool)

(assert (=> d!57085 m!221909))

(declare-fun m!221911 () Bool)

(assert (=> b!194944 m!221911))

(assert (=> b!194944 m!221007))

(assert (=> b!194944 m!221007))

(declare-fun m!221913 () Bool)

(assert (=> b!194944 m!221913))

(assert (=> b!194946 m!221007))

(assert (=> b!194946 m!221007))

(assert (=> b!194946 m!221913))

(assert (=> d!56703 d!57085))

(declare-fun e!128215 () Option!249)

(declare-fun b!194949 () Bool)

(assert (=> b!194949 (= e!128215 (getValueByKey!243 (t!7343 lt!96915) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun c!35265 () Bool)

(declare-fun d!57087 () Bool)

(assert (=> d!57087 (= c!35265 (and ((_ is Cons!2422) lt!96915) (= (_1!1766 (h!3063 lt!96915)) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128214 () Option!249)

(assert (=> d!57087 (= (getValueByKey!243 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) e!128214)))

(declare-fun b!194947 () Bool)

(assert (=> b!194947 (= e!128214 (Some!248 (_2!1766 (h!3063 lt!96915))))))

(declare-fun b!194948 () Bool)

(assert (=> b!194948 (= e!128214 e!128215)))

(declare-fun c!35266 () Bool)

(assert (=> b!194948 (= c!35266 (and ((_ is Cons!2422) lt!96915) (not (= (_1!1766 (h!3063 lt!96915)) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194950 () Bool)

(assert (=> b!194950 (= e!128215 None!247)))

(assert (= (and d!57087 c!35265) b!194947))

(assert (= (and d!57087 (not c!35265)) b!194948))

(assert (= (and b!194948 c!35266) b!194949))

(assert (= (and b!194948 (not c!35266)) b!194950))

(declare-fun m!221915 () Bool)

(assert (=> b!194949 m!221915))

(assert (=> d!56703 d!57087))

(declare-fun d!57089 () Bool)

(assert (=> d!57089 (= (getValueByKey!243 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun lt!97144 () Unit!5819)

(assert (=> d!57089 (= lt!97144 (choose!1074 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun e!128216 () Bool)

(assert (=> d!57089 e!128216))

(declare-fun res!92049 () Bool)

(assert (=> d!57089 (=> (not res!92049) (not e!128216))))

(assert (=> d!57089 (= res!92049 (isStrictlySorted!352 lt!96915))))

(assert (=> d!57089 (= (lemmaContainsTupThenGetReturnValue!133 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!97144)))

(declare-fun b!194951 () Bool)

(declare-fun res!92050 () Bool)

(assert (=> b!194951 (=> (not res!92050) (not e!128216))))

(assert (=> b!194951 (= res!92050 (containsKey!247 lt!96915 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194952 () Bool)

(assert (=> b!194952 (= e!128216 (contains!1359 lt!96915 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(assert (= (and d!57089 res!92049) b!194951))

(assert (= (and b!194951 res!92050) b!194952))

(assert (=> d!57089 m!221001))

(declare-fun m!221917 () Bool)

(assert (=> d!57089 m!221917))

(declare-fun m!221919 () Bool)

(assert (=> d!57089 m!221919))

(declare-fun m!221921 () Bool)

(assert (=> b!194951 m!221921))

(declare-fun m!221923 () Bool)

(assert (=> b!194952 m!221923))

(assert (=> d!56703 d!57089))

(declare-fun d!57091 () Bool)

(declare-fun e!128218 () Bool)

(assert (=> d!57091 e!128218))

(declare-fun res!92052 () Bool)

(assert (=> d!57091 (=> (not res!92052) (not e!128218))))

(declare-fun lt!97145 () List!2426)

(assert (=> d!57091 (= res!92052 (isStrictlySorted!352 lt!97145))))

(declare-fun e!128219 () List!2426)

(assert (=> d!57091 (= lt!97145 e!128219)))

(declare-fun c!35267 () Bool)

(assert (=> d!57091 (= c!35267 (and ((_ is Cons!2422) (toList!1225 lt!96605)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96605))) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57091 (isStrictlySorted!352 (toList!1225 lt!96605))))

(assert (=> d!57091 (= (insertStrictlySorted!136 (toList!1225 lt!96605) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!97145)))

(declare-fun bm!19693 () Bool)

(declare-fun call!19697 () List!2426)

(declare-fun call!19698 () List!2426)

(assert (=> bm!19693 (= call!19697 call!19698)))

(declare-fun e!128220 () List!2426)

(declare-fun b!194953 () Bool)

(assert (=> b!194953 (= e!128220 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96605)) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194954 () Bool)

(assert (=> b!194954 (= e!128218 (contains!1359 lt!97145 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194955 () Bool)

(declare-fun e!128217 () List!2426)

(assert (=> b!194955 (= e!128219 e!128217)))

(declare-fun c!35269 () Bool)

(assert (=> b!194955 (= c!35269 (and ((_ is Cons!2422) (toList!1225 lt!96605)) (= (_1!1766 (h!3063 (toList!1225 lt!96605))) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(declare-fun b!194956 () Bool)

(declare-fun res!92051 () Bool)

(assert (=> b!194956 (=> (not res!92051) (not e!128218))))

(assert (=> b!194956 (= res!92051 (containsKey!247 lt!97145 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))

(declare-fun b!194957 () Bool)

(assert (=> b!194957 (= e!128219 call!19698)))

(declare-fun b!194958 () Bool)

(declare-fun e!128221 () List!2426)

(declare-fun call!19696 () List!2426)

(assert (=> b!194958 (= e!128221 call!19696)))

(declare-fun b!194959 () Bool)

(assert (=> b!194959 (= e!128221 call!19696)))

(declare-fun b!194960 () Bool)

(declare-fun c!35270 () Bool)

(assert (=> b!194960 (= e!128220 (ite c!35269 (t!7343 (toList!1225 lt!96605)) (ite c!35270 (Cons!2422 (h!3063 (toList!1225 lt!96605)) (t!7343 (toList!1225 lt!96605))) Nil!2423)))))

(declare-fun b!194961 () Bool)

(assert (=> b!194961 (= e!128217 call!19697)))

(declare-fun bm!19694 () Bool)

(assert (=> bm!19694 (= call!19698 ($colon$colon!102 e!128220 (ite c!35267 (h!3063 (toList!1225 lt!96605)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))))))

(declare-fun c!35268 () Bool)

(assert (=> bm!19694 (= c!35268 c!35267)))

(declare-fun b!194962 () Bool)

(assert (=> b!194962 (= c!35270 (and ((_ is Cons!2422) (toList!1225 lt!96605)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96605))) (_1!1766 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))

(assert (=> b!194962 (= e!128217 e!128221)))

(declare-fun bm!19695 () Bool)

(assert (=> bm!19695 (= call!19696 call!19697)))

(assert (= (and d!57091 c!35267) b!194957))

(assert (= (and d!57091 (not c!35267)) b!194955))

(assert (= (and b!194955 c!35269) b!194961))

(assert (= (and b!194955 (not c!35269)) b!194962))

(assert (= (and b!194962 c!35270) b!194958))

(assert (= (and b!194962 (not c!35270)) b!194959))

(assert (= (or b!194958 b!194959) bm!19695))

(assert (= (or b!194961 bm!19695) bm!19693))

(assert (= (or b!194957 bm!19693) bm!19694))

(assert (= (and bm!19694 c!35268) b!194953))

(assert (= (and bm!19694 (not c!35268)) b!194960))

(assert (= (and d!57091 res!92052) b!194956))

(assert (= (and b!194956 res!92051) b!194954))

(declare-fun m!221925 () Bool)

(assert (=> d!57091 m!221925))

(declare-fun m!221927 () Bool)

(assert (=> d!57091 m!221927))

(declare-fun m!221929 () Bool)

(assert (=> b!194956 m!221929))

(declare-fun m!221931 () Bool)

(assert (=> b!194953 m!221931))

(declare-fun m!221933 () Bool)

(assert (=> b!194954 m!221933))

(declare-fun m!221935 () Bool)

(assert (=> bm!19694 m!221935))

(assert (=> d!56703 d!57091))

(assert (=> d!56593 d!56533))

(assert (=> d!56593 d!56495))

(declare-fun d!57093 () Bool)

(assert (=> d!57093 (= (isEmpty!491 lt!96745) (isEmpty!493 (toList!1225 lt!96745)))))

(declare-fun bs!7760 () Bool)

(assert (= bs!7760 d!57093))

(declare-fun m!221937 () Bool)

(assert (=> bs!7760 m!221937))

(assert (=> b!194181 d!57093))

(assert (=> b!194293 d!56539))

(declare-fun b!194963 () Bool)

(declare-fun e!128223 () (_ BitVec 32))

(declare-fun call!19699 () (_ BitVec 32))

(assert (=> b!194963 (= e!128223 (bvadd #b00000000000000000000000000000001 call!19699))))

(declare-fun b!194965 () Bool)

(declare-fun e!128222 () (_ BitVec 32))

(assert (=> b!194965 (= e!128222 e!128223)))

(declare-fun c!35272 () Bool)

(assert (=> b!194965 (= c!35272 (validKeyInArray!0 (select (arr!3862 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!194966 () Bool)

(assert (=> b!194966 (= e!128222 #b00000000000000000000000000000000)))

(declare-fun bm!19696 () Bool)

(assert (=> bm!19696 (= call!19699 (arrayCountValidKeys!0 (_keys!5952 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!194964 () Bool)

(assert (=> b!194964 (= e!128223 call!19699)))

(declare-fun d!57095 () Bool)

(declare-fun lt!97146 () (_ BitVec 32))

(assert (=> d!57095 (and (bvsge lt!97146 #b00000000000000000000000000000000) (bvsle lt!97146 (bvsub (size!4187 (_keys!5952 lt!96455)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!57095 (= lt!97146 e!128222)))

(declare-fun c!35271 () Bool)

(assert (=> d!57095 (= c!35271 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!57095 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!4187 (_keys!5952 lt!96455)) (size!4187 (_keys!5952 lt!96455))))))

(assert (=> d!57095 (= (arrayCountValidKeys!0 (_keys!5952 lt!96455) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))) lt!97146)))

(assert (= (and d!57095 c!35271) b!194966))

(assert (= (and d!57095 (not c!35271)) b!194965))

(assert (= (and b!194965 c!35272) b!194963))

(assert (= (and b!194965 (not c!35272)) b!194964))

(assert (= (or b!194963 b!194964) bm!19696))

(assert (=> b!194965 m!221149))

(assert (=> b!194965 m!221149))

(assert (=> b!194965 m!221151))

(declare-fun m!221939 () Bool)

(assert (=> bm!19696 m!221939))

(assert (=> bm!19662 d!57095))

(declare-fun d!57097 () Bool)

(assert (=> d!57097 (= (get!2233 (select (arr!3863 lt!96452) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!4245 (select (arr!3863 lt!96452) #b00000000000000000000000000000000)))))

(assert (=> b!194338 d!57097))

(declare-fun d!57099 () Bool)

(declare-fun lt!97147 () Bool)

(assert (=> d!57099 (= lt!97147 (select (content!155 (toList!1225 lt!96786)) (tuple2!3511 key!828 v!309)))))

(declare-fun e!128224 () Bool)

(assert (=> d!57099 (= lt!97147 e!128224)))

(declare-fun res!92054 () Bool)

(assert (=> d!57099 (=> (not res!92054) (not e!128224))))

(assert (=> d!57099 (= res!92054 ((_ is Cons!2422) (toList!1225 lt!96786)))))

(assert (=> d!57099 (= (contains!1359 (toList!1225 lt!96786) (tuple2!3511 key!828 v!309)) lt!97147)))

(declare-fun b!194967 () Bool)

(declare-fun e!128225 () Bool)

(assert (=> b!194967 (= e!128224 e!128225)))

(declare-fun res!92053 () Bool)

(assert (=> b!194967 (=> res!92053 e!128225)))

(assert (=> b!194967 (= res!92053 (= (h!3063 (toList!1225 lt!96786)) (tuple2!3511 key!828 v!309)))))

(declare-fun b!194968 () Bool)

(assert (=> b!194968 (= e!128225 (contains!1359 (t!7343 (toList!1225 lt!96786)) (tuple2!3511 key!828 v!309)))))

(assert (= (and d!57099 res!92054) b!194967))

(assert (= (and b!194967 (not res!92053)) b!194968))

(declare-fun m!221941 () Bool)

(assert (=> d!57099 m!221941))

(declare-fun m!221943 () Bool)

(assert (=> d!57099 m!221943))

(declare-fun m!221945 () Bool)

(assert (=> b!194968 m!221945))

(assert (=> b!194285 d!57099))

(declare-fun d!57101 () Bool)

(assert (=> d!57101 (= ($colon$colon!102 e!127780 (ite c!35063 (h!3063 (toList!1225 (map!2007 thiss!1248))) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460)))) (Cons!2422 (ite c!35063 (h!3063 (toList!1225 (map!2007 thiss!1248))) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))) e!127780))))

(assert (=> bm!19639 d!57101))

(declare-fun lt!97148 () Bool)

(declare-fun d!57103 () Bool)

(assert (=> d!57103 (= lt!97148 (select (content!155 (toList!1225 lt!96834)) (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))

(declare-fun e!128226 () Bool)

(assert (=> d!57103 (= lt!97148 e!128226)))

(declare-fun res!92056 () Bool)

(assert (=> d!57103 (=> (not res!92056) (not e!128226))))

(assert (=> d!57103 (= res!92056 ((_ is Cons!2422) (toList!1225 lt!96834)))))

(assert (=> d!57103 (= (contains!1359 (toList!1225 lt!96834) (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) lt!97148)))

(declare-fun b!194969 () Bool)

(declare-fun e!128227 () Bool)

(assert (=> b!194969 (= e!128226 e!128227)))

(declare-fun res!92055 () Bool)

(assert (=> b!194969 (=> res!92055 e!128227)))

(assert (=> b!194969 (= res!92055 (= (h!3063 (toList!1225 lt!96834)) (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))

(declare-fun b!194970 () Bool)

(assert (=> b!194970 (= e!128227 (contains!1359 (t!7343 (toList!1225 lt!96834)) (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))

(assert (= (and d!57103 res!92056) b!194969))

(assert (= (and b!194969 (not res!92055)) b!194970))

(declare-fun m!221947 () Bool)

(assert (=> d!57103 m!221947))

(declare-fun m!221949 () Bool)

(assert (=> d!57103 m!221949))

(declare-fun m!221951 () Bool)

(assert (=> b!194970 m!221951))

(assert (=> b!194349 d!57103))

(declare-fun d!57105 () Bool)

(assert (=> d!57105 (= (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7761 () Bool)

(assert (= bs!7761 d!57105))

(assert (=> bs!7761 m!220629))

(declare-fun m!221953 () Bool)

(assert (=> bs!7761 m!221953))

(assert (=> b!194283 d!57105))

(declare-fun b!194973 () Bool)

(declare-fun e!128229 () Option!249)

(assert (=> b!194973 (= e!128229 (getValueByKey!243 (t!7343 (toList!1225 lt!96632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!57107 () Bool)

(declare-fun c!35273 () Bool)

(assert (=> d!57107 (= c!35273 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (= (_1!1766 (h!3063 (toList!1225 lt!96632))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128228 () Option!249)

(assert (=> d!57107 (= (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000) e!128228)))

(declare-fun b!194971 () Bool)

(assert (=> b!194971 (= e!128228 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96632)))))))

(declare-fun b!194972 () Bool)

(assert (=> b!194972 (= e!128228 e!128229)))

(declare-fun c!35274 () Bool)

(assert (=> b!194972 (= c!35274 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96632))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!194974 () Bool)

(assert (=> b!194974 (= e!128229 None!247)))

(assert (= (and d!57107 c!35273) b!194971))

(assert (= (and d!57107 (not c!35273)) b!194972))

(assert (= (and b!194972 c!35274) b!194973))

(assert (= (and b!194972 (not c!35274)) b!194974))

(declare-fun m!221955 () Bool)

(assert (=> b!194973 m!221955))

(assert (=> b!194283 d!57107))

(assert (=> d!56571 d!56569))

(declare-fun d!57109 () Bool)

(assert (=> d!57109 (= (getValueByKey!243 lt!96673 (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460)))))

(assert (=> d!57109 true))

(declare-fun _$22!539 () Unit!5819)

(assert (=> d!57109 (= (choose!1074 lt!96673 (_1!1766 lt!96460) (_2!1766 lt!96460)) _$22!539)))

(declare-fun bs!7762 () Bool)

(assert (= bs!7762 d!57109))

(assert (=> bs!7762 m!220383))

(assert (=> d!56571 d!57109))

(declare-fun d!57111 () Bool)

(declare-fun res!92061 () Bool)

(declare-fun e!128234 () Bool)

(assert (=> d!57111 (=> res!92061 e!128234)))

(assert (=> d!57111 (= res!92061 (or ((_ is Nil!2423) lt!96673) ((_ is Nil!2423) (t!7343 lt!96673))))))

(assert (=> d!57111 (= (isStrictlySorted!352 lt!96673) e!128234)))

(declare-fun b!194979 () Bool)

(declare-fun e!128235 () Bool)

(assert (=> b!194979 (= e!128234 e!128235)))

(declare-fun res!92062 () Bool)

(assert (=> b!194979 (=> (not res!92062) (not e!128235))))

(assert (=> b!194979 (= res!92062 (bvslt (_1!1766 (h!3063 lt!96673)) (_1!1766 (h!3063 (t!7343 lt!96673)))))))

(declare-fun b!194980 () Bool)

(assert (=> b!194980 (= e!128235 (isStrictlySorted!352 (t!7343 lt!96673)))))

(assert (= (and d!57111 (not res!92061)) b!194979))

(assert (= (and b!194979 res!92062) b!194980))

(declare-fun m!221957 () Bool)

(assert (=> b!194980 m!221957))

(assert (=> d!56571 d!57111))

(declare-fun d!57113 () Bool)

(declare-fun lt!97149 () Bool)

(assert (=> d!57113 (= lt!97149 (select (content!155 (toList!1225 lt!96765)) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128236 () Bool)

(assert (=> d!57113 (= lt!97149 e!128236)))

(declare-fun res!92064 () Bool)

(assert (=> d!57113 (=> (not res!92064) (not e!128236))))

(assert (=> d!57113 (= res!92064 ((_ is Cons!2422) (toList!1225 lt!96765)))))

(assert (=> d!57113 (= (contains!1359 (toList!1225 lt!96765) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97149)))

(declare-fun b!194981 () Bool)

(declare-fun e!128237 () Bool)

(assert (=> b!194981 (= e!128236 e!128237)))

(declare-fun res!92063 () Bool)

(assert (=> b!194981 (=> res!92063 e!128237)))

(assert (=> b!194981 (= res!92063 (= (h!3063 (toList!1225 lt!96765)) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!194982 () Bool)

(assert (=> b!194982 (= e!128237 (contains!1359 (t!7343 (toList!1225 lt!96765)) (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (= (and d!57113 res!92064) b!194981))

(assert (= (and b!194981 (not res!92063)) b!194982))

(declare-fun m!221959 () Bool)

(assert (=> d!57113 m!221959))

(declare-fun m!221961 () Bool)

(assert (=> d!57113 m!221961))

(declare-fun m!221963 () Bool)

(assert (=> b!194982 m!221963))

(assert (=> b!194253 d!57113))

(declare-fun d!57115 () Bool)

(declare-fun e!128239 () Bool)

(assert (=> d!57115 e!128239))

(declare-fun res!92065 () Bool)

(assert (=> d!57115 (=> res!92065 e!128239)))

(declare-fun lt!97152 () Bool)

(assert (=> d!57115 (= res!92065 (not lt!97152))))

(declare-fun lt!97153 () Bool)

(assert (=> d!57115 (= lt!97152 lt!97153)))

(declare-fun lt!97151 () Unit!5819)

(declare-fun e!128238 () Unit!5819)

(assert (=> d!57115 (= lt!97151 e!128238)))

(declare-fun c!35275 () Bool)

(assert (=> d!57115 (= c!35275 lt!97153)))

(assert (=> d!57115 (= lt!97153 (containsKey!247 (toList!1225 lt!96745) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57115 (= (contains!1356 lt!96745 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97152)))

(declare-fun b!194983 () Bool)

(declare-fun lt!97150 () Unit!5819)

(assert (=> b!194983 (= e!128238 lt!97150)))

(assert (=> b!194983 (= lt!97150 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96745) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194983 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96745) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194984 () Bool)

(declare-fun Unit!5869 () Unit!5819)

(assert (=> b!194984 (= e!128238 Unit!5869)))

(declare-fun b!194985 () Bool)

(assert (=> b!194985 (= e!128239 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57115 c!35275) b!194983))

(assert (= (and d!57115 (not c!35275)) b!194984))

(assert (= (and d!57115 (not res!92065)) b!194985))

(declare-fun m!221965 () Bool)

(assert (=> d!57115 m!221965))

(declare-fun m!221967 () Bool)

(assert (=> b!194983 m!221967))

(declare-fun m!221969 () Bool)

(assert (=> b!194983 m!221969))

(assert (=> b!194983 m!221969))

(declare-fun m!221971 () Bool)

(assert (=> b!194983 m!221971))

(assert (=> b!194985 m!221969))

(assert (=> b!194985 m!221969))

(assert (=> b!194985 m!221971))

(assert (=> b!194188 d!57115))

(declare-fun b!194988 () Bool)

(declare-fun e!128241 () Option!249)

(assert (=> b!194988 (= e!128241 (getValueByKey!243 (t!7343 (toList!1225 lt!96858)) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))

(declare-fun d!57117 () Bool)

(declare-fun c!35276 () Bool)

(assert (=> d!57117 (= c!35276 (and ((_ is Cons!2422) (toList!1225 lt!96858)) (= (_1!1766 (h!3063 (toList!1225 lt!96858))) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(declare-fun e!128240 () Option!249)

(assert (=> d!57117 (= (getValueByKey!243 (toList!1225 lt!96858) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) e!128240)))

(declare-fun b!194986 () Bool)

(assert (=> b!194986 (= e!128240 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96858)))))))

(declare-fun b!194987 () Bool)

(assert (=> b!194987 (= e!128240 e!128241)))

(declare-fun c!35277 () Bool)

(assert (=> b!194987 (= c!35277 (and ((_ is Cons!2422) (toList!1225 lt!96858)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96858))) (_1!1766 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))))))

(declare-fun b!194989 () Bool)

(assert (=> b!194989 (= e!128241 None!247)))

(assert (= (and d!57117 c!35276) b!194986))

(assert (= (and d!57117 (not c!35276)) b!194987))

(assert (= (and b!194987 c!35277) b!194988))

(assert (= (and b!194987 (not c!35277)) b!194989))

(declare-fun m!221973 () Bool)

(assert (=> b!194988 m!221973))

(assert (=> b!194364 d!57117))

(declare-fun d!57119 () Bool)

(declare-fun e!128243 () Bool)

(assert (=> d!57119 e!128243))

(declare-fun res!92066 () Bool)

(assert (=> d!57119 (=> res!92066 e!128243)))

(declare-fun lt!97156 () Bool)

(assert (=> d!57119 (= res!92066 (not lt!97156))))

(declare-fun lt!97157 () Bool)

(assert (=> d!57119 (= lt!97156 lt!97157)))

(declare-fun lt!97155 () Unit!5819)

(declare-fun e!128242 () Unit!5819)

(assert (=> d!57119 (= lt!97155 e!128242)))

(declare-fun c!35278 () Bool)

(assert (=> d!57119 (= c!35278 lt!97157)))

(assert (=> d!57119 (= lt!97157 (containsKey!247 (toList!1225 lt!96795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57119 (= (contains!1356 lt!96795 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97156)))

(declare-fun b!194990 () Bool)

(declare-fun lt!97154 () Unit!5819)

(assert (=> b!194990 (= e!128242 lt!97154)))

(assert (=> b!194990 (= lt!97154 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194990 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96795) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!194991 () Bool)

(declare-fun Unit!5870 () Unit!5819)

(assert (=> b!194991 (= e!128242 Unit!5870)))

(declare-fun b!194992 () Bool)

(assert (=> b!194992 (= e!128243 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57119 c!35278) b!194990))

(assert (= (and d!57119 (not c!35278)) b!194991))

(assert (= (and d!57119 (not res!92066)) b!194992))

(declare-fun m!221975 () Bool)

(assert (=> d!57119 m!221975))

(declare-fun m!221977 () Bool)

(assert (=> b!194990 m!221977))

(declare-fun m!221979 () Bool)

(assert (=> b!194990 m!221979))

(assert (=> b!194990 m!221979))

(declare-fun m!221981 () Bool)

(assert (=> b!194990 m!221981))

(assert (=> b!194992 m!221979))

(assert (=> b!194992 m!221979))

(assert (=> b!194992 m!221981))

(assert (=> bm!19648 d!57119))

(assert (=> d!56681 d!56675))

(assert (=> d!56681 d!56677))

(declare-fun d!57121 () Bool)

(assert (=> d!57121 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96454) key!828))))

(assert (=> d!57121 true))

(declare-fun _$12!449 () Unit!5819)

(assert (=> d!57121 (= (choose!1075 (toList!1225 lt!96454) key!828) _$12!449)))

(declare-fun bs!7763 () Bool)

(assert (= bs!7763 d!57121))

(assert (=> bs!7763 m!220403))

(assert (=> bs!7763 m!220403))

(assert (=> bs!7763 m!220405))

(assert (=> d!56681 d!57121))

(declare-fun d!57123 () Bool)

(declare-fun res!92067 () Bool)

(declare-fun e!128244 () Bool)

(assert (=> d!57123 (=> res!92067 e!128244)))

(assert (=> d!57123 (= res!92067 (or ((_ is Nil!2423) (toList!1225 lt!96454)) ((_ is Nil!2423) (t!7343 (toList!1225 lt!96454)))))))

(assert (=> d!57123 (= (isStrictlySorted!352 (toList!1225 lt!96454)) e!128244)))

(declare-fun b!194993 () Bool)

(declare-fun e!128245 () Bool)

(assert (=> b!194993 (= e!128244 e!128245)))

(declare-fun res!92068 () Bool)

(assert (=> b!194993 (=> (not res!92068) (not e!128245))))

(assert (=> b!194993 (= res!92068 (bvslt (_1!1766 (h!3063 (toList!1225 lt!96454))) (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96454))))))))

(declare-fun b!194994 () Bool)

(assert (=> b!194994 (= e!128245 (isStrictlySorted!352 (t!7343 (toList!1225 lt!96454))))))

(assert (= (and d!57123 (not res!92067)) b!194993))

(assert (= (and b!194993 res!92068) b!194994))

(declare-fun m!221983 () Bool)

(assert (=> b!194994 m!221983))

(assert (=> d!56681 d!57123))

(assert (=> bm!19633 d!56613))

(declare-fun d!57125 () Bool)

(declare-fun e!128247 () Bool)

(assert (=> d!57125 e!128247))

(declare-fun res!92070 () Bool)

(assert (=> d!57125 (=> (not res!92070) (not e!128247))))

(declare-fun lt!97158 () List!2426)

(assert (=> d!57125 (= res!92070 (isStrictlySorted!352 lt!97158))))

(declare-fun e!128248 () List!2426)

(assert (=> d!57125 (= lt!97158 e!128248)))

(declare-fun c!35279 () Bool)

(assert (=> d!57125 (= c!35279 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (bvslt (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) (_1!1766 lt!96460))))))

(assert (=> d!57125 (isStrictlySorted!352 (t!7343 (toList!1225 lt!96453)))))

(assert (=> d!57125 (= (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96453)) (_1!1766 lt!96460) (_2!1766 lt!96460)) lt!97158)))

(declare-fun bm!19697 () Bool)

(declare-fun call!19701 () List!2426)

(declare-fun call!19702 () List!2426)

(assert (=> bm!19697 (= call!19701 call!19702)))

(declare-fun b!194995 () Bool)

(declare-fun e!128249 () List!2426)

(assert (=> b!194995 (= e!128249 (insertStrictlySorted!136 (t!7343 (t!7343 (toList!1225 lt!96453))) (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun b!194996 () Bool)

(assert (=> b!194996 (= e!128247 (contains!1359 lt!97158 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!194997 () Bool)

(declare-fun e!128246 () List!2426)

(assert (=> b!194997 (= e!128248 e!128246)))

(declare-fun c!35281 () Bool)

(assert (=> b!194997 (= c!35281 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) (_1!1766 lt!96460))))))

(declare-fun b!194998 () Bool)

(declare-fun res!92069 () Bool)

(assert (=> b!194998 (=> (not res!92069) (not e!128247))))

(assert (=> b!194998 (= res!92069 (containsKey!247 lt!97158 (_1!1766 lt!96460)))))

(declare-fun b!194999 () Bool)

(assert (=> b!194999 (= e!128248 call!19702)))

(declare-fun b!195000 () Bool)

(declare-fun e!128250 () List!2426)

(declare-fun call!19700 () List!2426)

(assert (=> b!195000 (= e!128250 call!19700)))

(declare-fun b!195001 () Bool)

(assert (=> b!195001 (= e!128250 call!19700)))

(declare-fun c!35282 () Bool)

(declare-fun b!195002 () Bool)

(assert (=> b!195002 (= e!128249 (ite c!35281 (t!7343 (t!7343 (toList!1225 lt!96453))) (ite c!35282 (Cons!2422 (h!3063 (t!7343 (toList!1225 lt!96453))) (t!7343 (t!7343 (toList!1225 lt!96453)))) Nil!2423)))))

(declare-fun b!195003 () Bool)

(assert (=> b!195003 (= e!128246 call!19701)))

(declare-fun bm!19698 () Bool)

(assert (=> bm!19698 (= call!19702 ($colon$colon!102 e!128249 (ite c!35279 (h!3063 (t!7343 (toList!1225 lt!96453))) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460)))))))

(declare-fun c!35280 () Bool)

(assert (=> bm!19698 (= c!35280 c!35279)))

(declare-fun b!195004 () Bool)

(assert (=> b!195004 (= c!35282 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (bvsgt (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) (_1!1766 lt!96460))))))

(assert (=> b!195004 (= e!128246 e!128250)))

(declare-fun bm!19699 () Bool)

(assert (=> bm!19699 (= call!19700 call!19701)))

(assert (= (and d!57125 c!35279) b!194999))

(assert (= (and d!57125 (not c!35279)) b!194997))

(assert (= (and b!194997 c!35281) b!195003))

(assert (= (and b!194997 (not c!35281)) b!195004))

(assert (= (and b!195004 c!35282) b!195000))

(assert (= (and b!195004 (not c!35282)) b!195001))

(assert (= (or b!195000 b!195001) bm!19699))

(assert (= (or b!195003 bm!19699) bm!19697))

(assert (= (or b!194999 bm!19697) bm!19698))

(assert (= (and bm!19698 c!35280) b!194995))

(assert (= (and bm!19698 (not c!35280)) b!195002))

(assert (= (and d!57125 res!92070) b!194998))

(assert (= (and b!194998 res!92069) b!194996))

(declare-fun m!221985 () Bool)

(assert (=> d!57125 m!221985))

(declare-fun m!221987 () Bool)

(assert (=> d!57125 m!221987))

(declare-fun m!221989 () Bool)

(assert (=> b!194998 m!221989))

(declare-fun m!221991 () Bool)

(assert (=> b!194995 m!221991))

(declare-fun m!221993 () Bool)

(assert (=> b!194996 m!221993))

(declare-fun m!221995 () Bool)

(assert (=> bm!19698 m!221995))

(assert (=> b!194145 d!57125))

(assert (=> b!194455 d!56539))

(assert (=> d!56627 d!56629))

(assert (=> d!56627 d!56615))

(declare-fun d!57127 () Bool)

(assert (=> d!57127 (= (apply!188 (+!317 lt!96628 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) lt!96643) (apply!188 lt!96628 lt!96643))))

(assert (=> d!57127 true))

(declare-fun _$34!1093 () Unit!5819)

(assert (=> d!57127 (= (choose!1076 lt!96628 lt!96631 (minValue!3800 thiss!1248) lt!96643) _$34!1093)))

(declare-fun bs!7764 () Bool)

(assert (= bs!7764 d!57127))

(assert (=> bs!7764 m!220313))

(assert (=> bs!7764 m!220313))

(assert (=> bs!7764 m!220325))

(assert (=> bs!7764 m!220321))

(assert (=> d!56627 d!57127))

(assert (=> d!56627 d!56619))

(declare-fun d!57129 () Bool)

(declare-fun e!128252 () Bool)

(assert (=> d!57129 e!128252))

(declare-fun res!92071 () Bool)

(assert (=> d!57129 (=> res!92071 e!128252)))

(declare-fun lt!97161 () Bool)

(assert (=> d!57129 (= res!92071 (not lt!97161))))

(declare-fun lt!97162 () Bool)

(assert (=> d!57129 (= lt!97161 lt!97162)))

(declare-fun lt!97160 () Unit!5819)

(declare-fun e!128251 () Unit!5819)

(assert (=> d!57129 (= lt!97160 e!128251)))

(declare-fun c!35283 () Bool)

(assert (=> d!57129 (= c!35283 lt!97162)))

(assert (=> d!57129 (= lt!97162 (containsKey!247 (toList!1225 lt!96628) lt!96643))))

(assert (=> d!57129 (= (contains!1356 lt!96628 lt!96643) lt!97161)))

(declare-fun b!195005 () Bool)

(declare-fun lt!97159 () Unit!5819)

(assert (=> b!195005 (= e!128251 lt!97159)))

(assert (=> b!195005 (= lt!97159 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96628) lt!96643))))

(assert (=> b!195005 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96628) lt!96643))))

(declare-fun b!195006 () Bool)

(declare-fun Unit!5871 () Unit!5819)

(assert (=> b!195006 (= e!128251 Unit!5871)))

(declare-fun b!195007 () Bool)

(assert (=> b!195007 (= e!128252 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96628) lt!96643)))))

(assert (= (and d!57129 c!35283) b!195005))

(assert (= (and d!57129 (not c!35283)) b!195006))

(assert (= (and d!57129 (not res!92071)) b!195007))

(declare-fun m!221997 () Bool)

(assert (=> d!57129 m!221997))

(declare-fun m!221999 () Bool)

(assert (=> b!195005 m!221999))

(assert (=> b!195005 m!220817))

(assert (=> b!195005 m!220817))

(declare-fun m!222001 () Bool)

(assert (=> b!195005 m!222001))

(assert (=> b!195007 m!220817))

(assert (=> b!195007 m!220817))

(assert (=> b!195007 m!222001))

(assert (=> d!56627 d!57129))

(declare-fun d!57131 () Bool)

(assert (=> d!57131 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))) (v!4250 (getValueByKey!243 (toList!1225 lt!96610) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!56607 d!57131))

(assert (=> d!56607 d!56763))

(declare-fun d!57133 () Bool)

(declare-fun lt!97163 () Bool)

(assert (=> d!57133 (= lt!97163 (select (content!155 lt!96764) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun e!128253 () Bool)

(assert (=> d!57133 (= lt!97163 e!128253)))

(declare-fun res!92073 () Bool)

(assert (=> d!57133 (=> (not res!92073) (not e!128253))))

(assert (=> d!57133 (= res!92073 ((_ is Cons!2422) lt!96764))))

(assert (=> d!57133 (= (contains!1359 lt!96764 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))) lt!97163)))

(declare-fun b!195008 () Bool)

(declare-fun e!128254 () Bool)

(assert (=> b!195008 (= e!128253 e!128254)))

(declare-fun res!92072 () Bool)

(assert (=> b!195008 (=> res!92072 e!128254)))

(assert (=> b!195008 (= res!92072 (= (h!3063 lt!96764) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!195009 () Bool)

(assert (=> b!195009 (= e!128254 (contains!1359 (t!7343 lt!96764) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(assert (= (and d!57133 res!92073) b!195008))

(assert (= (and b!195008 (not res!92072)) b!195009))

(declare-fun m!222003 () Bool)

(assert (=> d!57133 m!222003))

(declare-fun m!222005 () Bool)

(assert (=> d!57133 m!222005))

(declare-fun m!222007 () Bool)

(assert (=> b!195009 m!222007))

(assert (=> b!194243 d!57133))

(declare-fun d!57135 () Bool)

(assert (=> d!57135 (= (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96453) key!828)) (not ((_ is Some!248) (getValueByKey!243 (toList!1225 lt!96453) key!828))))))

(assert (=> d!56579 d!57135))

(declare-fun d!57137 () Bool)

(declare-fun e!128256 () Bool)

(assert (=> d!57137 e!128256))

(declare-fun res!92074 () Bool)

(assert (=> d!57137 (=> res!92074 e!128256)))

(declare-fun lt!97166 () Bool)

(assert (=> d!57137 (= res!92074 (not lt!97166))))

(declare-fun lt!97167 () Bool)

(assert (=> d!57137 (= lt!97166 lt!97167)))

(declare-fun lt!97165 () Unit!5819)

(declare-fun e!128255 () Unit!5819)

(assert (=> d!57137 (= lt!97165 e!128255)))

(declare-fun c!35284 () Bool)

(assert (=> d!57137 (= c!35284 lt!97167)))

(assert (=> d!57137 (= lt!97167 (containsKey!247 (toList!1225 lt!96745) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!57137 (= (contains!1356 lt!96745 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97166)))

(declare-fun b!195010 () Bool)

(declare-fun lt!97164 () Unit!5819)

(assert (=> b!195010 (= e!128255 lt!97164)))

(assert (=> b!195010 (= lt!97164 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96745) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195010 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96745) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195011 () Bool)

(declare-fun Unit!5872 () Unit!5819)

(assert (=> b!195011 (= e!128255 Unit!5872)))

(declare-fun b!195012 () Bool)

(assert (=> b!195012 (= e!128256 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96745) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57137 c!35284) b!195010))

(assert (= (and d!57137 (not c!35284)) b!195011))

(assert (= (and d!57137 (not res!92074)) b!195012))

(declare-fun m!222009 () Bool)

(assert (=> d!57137 m!222009))

(declare-fun m!222011 () Bool)

(assert (=> b!195010 m!222011))

(declare-fun m!222013 () Bool)

(assert (=> b!195010 m!222013))

(assert (=> b!195010 m!222013))

(declare-fun m!222015 () Bool)

(assert (=> b!195010 m!222015))

(assert (=> b!195012 m!222013))

(assert (=> b!195012 m!222013))

(assert (=> b!195012 m!222015))

(assert (=> d!56555 d!57137))

(assert (=> d!56555 d!56531))

(declare-fun d!57139 () Bool)

(assert (=> d!57139 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))

(declare-fun lt!97168 () Unit!5819)

(assert (=> d!57139 (= lt!97168 (choose!1075 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))

(declare-fun e!128257 () Bool)

(assert (=> d!57139 e!128257))

(declare-fun res!92075 () Bool)

(assert (=> d!57139 (=> (not res!92075) (not e!128257))))

(assert (=> d!57139 (= res!92075 (isStrictlySorted!352 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))))))

(assert (=> d!57139 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629) lt!97168)))

(declare-fun b!195013 () Bool)

(assert (=> b!195013 (= e!128257 (containsKey!247 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629))))

(assert (= (and d!57139 res!92075) b!195013))

(assert (=> d!57139 m!220829))

(assert (=> d!57139 m!220829))

(assert (=> d!57139 m!220831))

(declare-fun m!222017 () Bool)

(assert (=> d!57139 m!222017))

(declare-fun m!222019 () Bool)

(assert (=> d!57139 m!222019))

(assert (=> b!195013 m!220825))

(assert (=> b!194357 d!57139))

(assert (=> b!194357 d!56895))

(assert (=> b!194357 d!56897))

(assert (=> b!194407 d!56733))

(declare-fun d!57141 () Bool)

(assert (=> d!57141 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96611) lt!96608)) (v!4250 (getValueByKey!243 (toList!1225 lt!96611) lt!96608)))))

(assert (=> d!56705 d!57141))

(declare-fun b!195016 () Bool)

(declare-fun e!128259 () Option!249)

(assert (=> b!195016 (= e!128259 (getValueByKey!243 (t!7343 (toList!1225 lt!96611)) lt!96608))))

(declare-fun d!57143 () Bool)

(declare-fun c!35285 () Bool)

(assert (=> d!57143 (= c!35285 (and ((_ is Cons!2422) (toList!1225 lt!96611)) (= (_1!1766 (h!3063 (toList!1225 lt!96611))) lt!96608)))))

(declare-fun e!128258 () Option!249)

(assert (=> d!57143 (= (getValueByKey!243 (toList!1225 lt!96611) lt!96608) e!128258)))

(declare-fun b!195014 () Bool)

(assert (=> b!195014 (= e!128258 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96611)))))))

(declare-fun b!195015 () Bool)

(assert (=> b!195015 (= e!128258 e!128259)))

(declare-fun c!35286 () Bool)

(assert (=> b!195015 (= c!35286 (and ((_ is Cons!2422) (toList!1225 lt!96611)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96611))) lt!96608))))))

(declare-fun b!195017 () Bool)

(assert (=> b!195017 (= e!128259 None!247)))

(assert (= (and d!57143 c!35285) b!195014))

(assert (= (and d!57143 (not c!35285)) b!195015))

(assert (= (and b!195015 c!35286) b!195016))

(assert (= (and b!195015 (not c!35286)) b!195017))

(declare-fun m!222021 () Bool)

(assert (=> b!195016 m!222021))

(assert (=> d!56705 d!57143))

(declare-fun d!57145 () Bool)

(declare-fun e!128260 () Bool)

(assert (=> d!57145 e!128260))

(declare-fun res!92076 () Bool)

(assert (=> d!57145 (=> (not res!92076) (not e!128260))))

(declare-fun lt!97169 () ListLongMap!2419)

(assert (=> d!57145 (= res!92076 (contains!1356 lt!97169 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))

(declare-fun lt!97171 () List!2426)

(assert (=> d!57145 (= lt!97169 (ListLongMap!2420 lt!97171))))

(declare-fun lt!97172 () Unit!5819)

(declare-fun lt!97170 () Unit!5819)

(assert (=> d!57145 (= lt!97172 lt!97170)))

(assert (=> d!57145 (= (getValueByKey!243 lt!97171 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))

(assert (=> d!57145 (= lt!97170 (lemmaContainsTupThenGetReturnValue!133 lt!97171 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))

(assert (=> d!57145 (= lt!97171 (insertStrictlySorted!136 (toList!1225 call!19659) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))))))

(assert (=> d!57145 (= (+!317 call!19659 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))) lt!97169)))

(declare-fun b!195018 () Bool)

(declare-fun res!92077 () Bool)

(assert (=> b!195018 (=> (not res!92077) (not e!128260))))

(assert (=> b!195018 (= res!92077 (= (getValueByKey!243 (toList!1225 lt!97169) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))))

(declare-fun b!195019 () Bool)

(assert (=> b!195019 (= e!128260 (contains!1359 (toList!1225 lt!97169) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 lt!96455))))))

(assert (= (and d!57145 res!92076) b!195018))

(assert (= (and b!195018 res!92077) b!195019))

(declare-fun m!222023 () Bool)

(assert (=> d!57145 m!222023))

(declare-fun m!222025 () Bool)

(assert (=> d!57145 m!222025))

(declare-fun m!222027 () Bool)

(assert (=> d!57145 m!222027))

(declare-fun m!222029 () Bool)

(assert (=> d!57145 m!222029))

(declare-fun m!222031 () Bool)

(assert (=> b!195018 m!222031))

(declare-fun m!222033 () Bool)

(assert (=> b!195019 m!222033))

(assert (=> b!194330 d!57145))

(declare-fun d!57147 () Bool)

(assert (=> d!57147 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97173 () Unit!5819)

(assert (=> d!57147 (= lt!97173 (choose!1075 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128261 () Bool)

(assert (=> d!57147 e!128261))

(declare-fun res!92078 () Bool)

(assert (=> d!57147 (=> (not res!92078) (not e!128261))))

(assert (=> d!57147 (= res!92078 (isStrictlySorted!352 (toList!1225 lt!96610)))))

(assert (=> d!57147 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000) lt!97173)))

(declare-fun b!195020 () Bool)

(assert (=> b!195020 (= e!128261 (containsKey!247 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57147 res!92078) b!195020))

(assert (=> d!57147 m!220911))

(assert (=> d!57147 m!220911))

(assert (=> d!57147 m!220933))

(declare-fun m!222035 () Bool)

(assert (=> d!57147 m!222035))

(assert (=> d!57147 m!221065))

(assert (=> b!195020 m!220929))

(assert (=> b!194461 d!57147))

(assert (=> b!194461 d!57013))

(assert (=> b!194461 d!56745))

(declare-fun b!195023 () Bool)

(declare-fun e!128263 () Option!249)

(assert (=> b!195023 (= e!128263 (getValueByKey!243 (t!7343 (toList!1225 lt!96786)) (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun c!35287 () Bool)

(declare-fun d!57149 () Bool)

(assert (=> d!57149 (= c!35287 (and ((_ is Cons!2422) (toList!1225 lt!96786)) (= (_1!1766 (h!3063 (toList!1225 lt!96786))) (_1!1766 (tuple2!3511 key!828 v!309)))))))

(declare-fun e!128262 () Option!249)

(assert (=> d!57149 (= (getValueByKey!243 (toList!1225 lt!96786) (_1!1766 (tuple2!3511 key!828 v!309))) e!128262)))

(declare-fun b!195021 () Bool)

(assert (=> b!195021 (= e!128262 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96786)))))))

(declare-fun b!195022 () Bool)

(assert (=> b!195022 (= e!128262 e!128263)))

(declare-fun c!35288 () Bool)

(assert (=> b!195022 (= c!35288 (and ((_ is Cons!2422) (toList!1225 lt!96786)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96786))) (_1!1766 (tuple2!3511 key!828 v!309))))))))

(declare-fun b!195024 () Bool)

(assert (=> b!195024 (= e!128263 None!247)))

(assert (= (and d!57149 c!35287) b!195021))

(assert (= (and d!57149 (not c!35287)) b!195022))

(assert (= (and b!195022 c!35288) b!195023))

(assert (= (and b!195022 (not c!35288)) b!195024))

(declare-fun m!222037 () Bool)

(assert (=> b!195023 m!222037))

(assert (=> b!194284 d!57149))

(declare-fun d!57151 () Bool)

(declare-fun c!35289 () Bool)

(assert (=> d!57151 (= c!35289 ((_ is Nil!2423) (toList!1225 lt!96671)))))

(declare-fun e!128264 () (InoxSet tuple2!3510))

(assert (=> d!57151 (= (content!155 (toList!1225 lt!96671)) e!128264)))

(declare-fun b!195025 () Bool)

(assert (=> b!195025 (= e!128264 ((as const (Array tuple2!3510 Bool)) false))))

(declare-fun b!195026 () Bool)

(assert (=> b!195026 (= e!128264 ((_ map or) (store ((as const (Array tuple2!3510 Bool)) false) (h!3063 (toList!1225 lt!96671)) true) (content!155 (t!7343 (toList!1225 lt!96671)))))))

(assert (= (and d!57151 c!35289) b!195025))

(assert (= (and d!57151 (not c!35289)) b!195026))

(declare-fun m!222039 () Bool)

(assert (=> b!195026 m!222039))

(declare-fun m!222041 () Bool)

(assert (=> b!195026 m!222041))

(assert (=> d!56645 d!57151))

(declare-fun b!195029 () Bool)

(declare-fun e!128266 () Option!249)

(assert (=> b!195029 (= e!128266 (getValueByKey!243 (t!7343 (toList!1225 lt!96834)) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun c!35290 () Bool)

(declare-fun d!57153 () Bool)

(assert (=> d!57153 (= c!35290 (and ((_ is Cons!2422) (toList!1225 lt!96834)) (= (_1!1766 (h!3063 (toList!1225 lt!96834))) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(declare-fun e!128265 () Option!249)

(assert (=> d!57153 (= (getValueByKey!243 (toList!1225 lt!96834) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) e!128265)))

(declare-fun b!195027 () Bool)

(assert (=> b!195027 (= e!128265 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96834)))))))

(declare-fun b!195028 () Bool)

(assert (=> b!195028 (= e!128265 e!128266)))

(declare-fun c!35291 () Bool)

(assert (=> b!195028 (= c!35291 (and ((_ is Cons!2422) (toList!1225 lt!96834)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96834))) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195030 () Bool)

(assert (=> b!195030 (= e!128266 None!247)))

(assert (= (and d!57153 c!35290) b!195027))

(assert (= (and d!57153 (not c!35290)) b!195028))

(assert (= (and b!195028 c!35291) b!195029))

(assert (= (and b!195028 (not c!35291)) b!195030))

(declare-fun m!222043 () Bool)

(assert (=> b!195029 m!222043))

(assert (=> b!194348 d!57153))

(declare-fun d!57155 () Bool)

(declare-fun e!128268 () Bool)

(assert (=> d!57155 e!128268))

(declare-fun res!92079 () Bool)

(assert (=> d!57155 (=> res!92079 e!128268)))

(declare-fun lt!97176 () Bool)

(assert (=> d!57155 (= res!92079 (not lt!97176))))

(declare-fun lt!97177 () Bool)

(assert (=> d!57155 (= lt!97176 lt!97177)))

(declare-fun lt!97175 () Unit!5819)

(declare-fun e!128267 () Unit!5819)

(assert (=> d!57155 (= lt!97175 e!128267)))

(declare-fun c!35292 () Bool)

(assert (=> d!57155 (= c!35292 lt!97177)))

(assert (=> d!57155 (= lt!97177 (containsKey!247 (toList!1225 lt!96745) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!57155 (= (contains!1356 lt!96745 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) lt!97176)))

(declare-fun b!195031 () Bool)

(declare-fun lt!97174 () Unit!5819)

(assert (=> b!195031 (= e!128267 lt!97174)))

(assert (=> b!195031 (= lt!97174 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96745) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!195031 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96745) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195032 () Bool)

(declare-fun Unit!5873 () Unit!5819)

(assert (=> b!195032 (= e!128267 Unit!5873)))

(declare-fun b!195033 () Bool)

(assert (=> b!195033 (= e!128268 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96745) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!57155 c!35292) b!195031))

(assert (= (and d!57155 (not c!35292)) b!195032))

(assert (= (and d!57155 (not res!92079)) b!195033))

(assert (=> d!57155 m!220231))

(declare-fun m!222045 () Bool)

(assert (=> d!57155 m!222045))

(assert (=> b!195031 m!220231))

(declare-fun m!222047 () Bool)

(assert (=> b!195031 m!222047))

(assert (=> b!195031 m!220231))

(declare-fun m!222049 () Bool)

(assert (=> b!195031 m!222049))

(assert (=> b!195031 m!222049))

(declare-fun m!222051 () Bool)

(assert (=> b!195031 m!222051))

(assert (=> b!195033 m!220231))

(assert (=> b!195033 m!222049))

(assert (=> b!195033 m!222049))

(assert (=> b!195033 m!222051))

(assert (=> b!194187 d!57155))

(assert (=> d!56529 d!56491))

(declare-fun e!128270 () Option!249)

(declare-fun b!195036 () Bool)

(assert (=> b!195036 (= e!128270 (getValueByKey!243 (t!7343 (toList!1225 lt!96765)) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun c!35293 () Bool)

(declare-fun d!57157 () Bool)

(assert (=> d!57157 (= c!35293 (and ((_ is Cons!2422) (toList!1225 lt!96765)) (= (_1!1766 (h!3063 (toList!1225 lt!96765))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun e!128269 () Option!249)

(assert (=> d!57157 (= (getValueByKey!243 (toList!1225 lt!96765) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128269)))

(declare-fun b!195034 () Bool)

(assert (=> b!195034 (= e!128269 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96765)))))))

(declare-fun b!195035 () Bool)

(assert (=> b!195035 (= e!128269 e!128270)))

(declare-fun c!35294 () Bool)

(assert (=> b!195035 (= c!35294 (and ((_ is Cons!2422) (toList!1225 lt!96765)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96765))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!195037 () Bool)

(assert (=> b!195037 (= e!128270 None!247)))

(assert (= (and d!57157 c!35293) b!195034))

(assert (= (and d!57157 (not c!35293)) b!195035))

(assert (= (and b!195035 c!35294) b!195036))

(assert (= (and b!195035 (not c!35294)) b!195037))

(declare-fun m!222053 () Bool)

(assert (=> b!195036 m!222053))

(assert (=> b!194252 d!57157))

(declare-fun d!57159 () Bool)

(assert (=> d!57159 (= (size!4193 lt!96455) (bvadd (_size!1404 lt!96455) (bvsdiv (bvadd (extraKeys!3696 lt!96455) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!194391 d!57159))

(declare-fun d!57161 () Bool)

(declare-fun res!92080 () Bool)

(declare-fun e!128271 () Bool)

(assert (=> d!57161 (=> res!92080 e!128271)))

(assert (=> d!57161 (= res!92080 (and ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (= (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(assert (=> d!57161 (= (containsKey!247 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) e!128271)))

(declare-fun b!195038 () Bool)

(declare-fun e!128272 () Bool)

(assert (=> b!195038 (= e!128271 e!128272)))

(declare-fun res!92081 () Bool)

(assert (=> b!195038 (=> (not res!92081) (not e!128272))))

(assert (=> b!195038 (= res!92081 (and (or (not ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (bvsle (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))) ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (bvslt (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))))))

(declare-fun b!195039 () Bool)

(assert (=> b!195039 (= e!128272 (containsKey!247 (t!7343 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (= (and d!57161 (not res!92080)) b!195038))

(assert (= (and b!195038 res!92081) b!195039))

(assert (=> b!195039 m!220093))

(declare-fun m!222055 () Bool)

(assert (=> b!195039 m!222055))

(assert (=> d!56533 d!57161))

(declare-fun d!57163 () Bool)

(declare-fun lt!97178 () Bool)

(assert (=> d!57163 (= lt!97178 (select (content!155 (t!7343 (toList!1225 lt!96671))) lt!96460))))

(declare-fun e!128273 () Bool)

(assert (=> d!57163 (= lt!97178 e!128273)))

(declare-fun res!92083 () Bool)

(assert (=> d!57163 (=> (not res!92083) (not e!128273))))

(assert (=> d!57163 (= res!92083 ((_ is Cons!2422) (t!7343 (toList!1225 lt!96671))))))

(assert (=> d!57163 (= (contains!1359 (t!7343 (toList!1225 lt!96671)) lt!96460) lt!97178)))

(declare-fun b!195040 () Bool)

(declare-fun e!128274 () Bool)

(assert (=> b!195040 (= e!128273 e!128274)))

(declare-fun res!92082 () Bool)

(assert (=> b!195040 (=> res!92082 e!128274)))

(assert (=> b!195040 (= res!92082 (= (h!3063 (t!7343 (toList!1225 lt!96671))) lt!96460))))

(declare-fun b!195041 () Bool)

(assert (=> b!195041 (= e!128274 (contains!1359 (t!7343 (t!7343 (toList!1225 lt!96671))) lt!96460))))

(assert (= (and d!57163 res!92083) b!195040))

(assert (= (and b!195040 (not res!92082)) b!195041))

(assert (=> d!57163 m!222041))

(declare-fun m!222057 () Bool)

(assert (=> d!57163 m!222057))

(declare-fun m!222059 () Bool)

(assert (=> b!195041 m!222059))

(assert (=> b!194371 d!57163))

(assert (=> d!56653 d!56531))

(declare-fun d!57165 () Bool)

(assert (=> d!57165 (= (apply!188 lt!96817 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7765 () Bool)

(assert (= bs!7765 d!57165))

(assert (=> bs!7765 m!221465))

(assert (=> bs!7765 m!221465))

(declare-fun m!222061 () Bool)

(assert (=> bs!7765 m!222061))

(assert (=> b!194336 d!57165))

(declare-fun d!57167 () Bool)

(declare-fun res!92084 () Bool)

(declare-fun e!128275 () Bool)

(assert (=> d!57167 (=> res!92084 e!128275)))

(assert (=> d!57167 (= res!92084 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))) lt!96629)))))

(assert (=> d!57167 (= (containsKey!247 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))) lt!96629) e!128275)))

(declare-fun b!195042 () Bool)

(declare-fun e!128276 () Bool)

(assert (=> b!195042 (= e!128275 e!128276)))

(declare-fun res!92085 () Bool)

(assert (=> b!195042 (=> (not res!92085) (not e!128276))))

(assert (=> b!195042 (= res!92085 (and (or (not ((_ is Cons!2422) (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))) (bvsle (_1!1766 (h!3063 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))) lt!96629)) ((_ is Cons!2422) (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))) (bvslt (_1!1766 (h!3063 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248)))))) lt!96629)))))

(declare-fun b!195043 () Bool)

(assert (=> b!195043 (= e!128276 (containsKey!247 (t!7343 (toList!1225 (+!317 lt!96639 (tuple2!3511 lt!96637 (zeroValue!3800 thiss!1248))))) lt!96629))))

(assert (= (and d!57167 (not res!92084)) b!195042))

(assert (= (and b!195042 res!92085) b!195043))

(declare-fun m!222063 () Bool)

(assert (=> b!195043 m!222063))

(assert (=> d!56633 d!57167))

(assert (=> b!194337 d!56733))

(declare-fun d!57169 () Bool)

(assert (=> d!57169 (arrayContainsKey!0 (_keys!5952 thiss!1248) lt!96780 #b00000000000000000000000000000000)))

(declare-fun lt!97181 () Unit!5819)

(declare-fun choose!13 (array!8209 (_ BitVec 64) (_ BitVec 32)) Unit!5819)

(assert (=> d!57169 (= lt!97181 (choose!13 (_keys!5952 thiss!1248) lt!96780 #b00000000000000000000000000000000))))

(assert (=> d!57169 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!57169 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5952 thiss!1248) lt!96780 #b00000000000000000000000000000000) lt!97181)))

(declare-fun bs!7766 () Bool)

(assert (= bs!7766 d!57169))

(assert (=> bs!7766 m!220617))

(declare-fun m!222065 () Bool)

(assert (=> bs!7766 m!222065))

(assert (=> b!194275 d!57169))

(declare-fun d!57171 () Bool)

(declare-fun res!92086 () Bool)

(declare-fun e!128277 () Bool)

(assert (=> d!57171 (=> res!92086 e!128277)))

(assert (=> d!57171 (= res!92086 (= (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) lt!96780))))

(assert (=> d!57171 (= (arrayContainsKey!0 (_keys!5952 thiss!1248) lt!96780 #b00000000000000000000000000000000) e!128277)))

(declare-fun b!195044 () Bool)

(declare-fun e!128278 () Bool)

(assert (=> b!195044 (= e!128277 e!128278)))

(declare-fun res!92087 () Bool)

(assert (=> b!195044 (=> (not res!92087) (not e!128278))))

(assert (=> b!195044 (= res!92087 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!195045 () Bool)

(assert (=> b!195045 (= e!128278 (arrayContainsKey!0 (_keys!5952 thiss!1248) lt!96780 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!57171 (not res!92086)) b!195044))

(assert (= (and b!195044 res!92087) b!195045))

(assert (=> d!57171 m!220231))

(declare-fun m!222067 () Bool)

(assert (=> b!195045 m!222067))

(assert (=> b!194275 d!57171))

(declare-fun b!195046 () Bool)

(declare-fun e!128279 () SeekEntryResult!695)

(declare-fun lt!97184 () SeekEntryResult!695)

(assert (=> b!195046 (= e!128279 (Found!695 (index!4952 lt!97184)))))

(declare-fun b!195047 () Bool)

(declare-fun c!35296 () Bool)

(declare-fun lt!97183 () (_ BitVec 64))

(assert (=> b!195047 (= c!35296 (= lt!97183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128280 () SeekEntryResult!695)

(assert (=> b!195047 (= e!128279 e!128280)))

(declare-fun d!57173 () Bool)

(declare-fun lt!97182 () SeekEntryResult!695)

(assert (=> d!57173 (and (or ((_ is Undefined!695) lt!97182) (not ((_ is Found!695) lt!97182)) (and (bvsge (index!4951 lt!97182) #b00000000000000000000000000000000) (bvslt (index!4951 lt!97182) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!97182) ((_ is Found!695) lt!97182) (not ((_ is MissingZero!695) lt!97182)) (and (bvsge (index!4950 lt!97182) #b00000000000000000000000000000000) (bvslt (index!4950 lt!97182) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!97182) ((_ is Found!695) lt!97182) ((_ is MissingZero!695) lt!97182) (not ((_ is MissingVacant!695) lt!97182)) (and (bvsge (index!4953 lt!97182) #b00000000000000000000000000000000) (bvslt (index!4953 lt!97182) (size!4187 (_keys!5952 thiss!1248))))) (or ((_ is Undefined!695) lt!97182) (ite ((_ is Found!695) lt!97182) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!97182)) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!695) lt!97182) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4950 lt!97182)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!695) lt!97182) (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4953 lt!97182)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128281 () SeekEntryResult!695)

(assert (=> d!57173 (= lt!97182 e!128281)))

(declare-fun c!35297 () Bool)

(assert (=> d!57173 (= c!35297 (and ((_ is Intermediate!695) lt!97184) (undefined!1507 lt!97184)))))

(assert (=> d!57173 (= lt!97184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (mask!9221 thiss!1248)) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(assert (=> d!57173 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57173 (= (seekEntryOrOpen!0 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) lt!97182)))

(declare-fun b!195048 () Bool)

(assert (=> b!195048 (= e!128281 e!128279)))

(assert (=> b!195048 (= lt!97183 (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!97184)))))

(declare-fun c!35295 () Bool)

(assert (=> b!195048 (= c!35295 (= lt!97183 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!195049 () Bool)

(assert (=> b!195049 (= e!128280 (MissingZero!695 (index!4952 lt!97184)))))

(declare-fun b!195050 () Bool)

(assert (=> b!195050 (= e!128281 Undefined!695)))

(declare-fun b!195051 () Bool)

(assert (=> b!195051 (= e!128280 (seekKeyOrZeroReturnVacant!0 (x!20690 lt!97184) (index!4952 lt!97184) (index!4952 lt!97184) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(assert (= (and d!57173 c!35297) b!195050))

(assert (= (and d!57173 (not c!35297)) b!195048))

(assert (= (and b!195048 c!35295) b!195046))

(assert (= (and b!195048 (not c!35295)) b!195047))

(assert (= (and b!195047 c!35296) b!195049))

(assert (= (and b!195047 (not c!35296)) b!195051))

(declare-fun m!222069 () Bool)

(assert (=> d!57173 m!222069))

(assert (=> d!57173 m!220231))

(declare-fun m!222071 () Bool)

(assert (=> d!57173 m!222071))

(assert (=> d!57173 m!220205))

(assert (=> d!57173 m!222071))

(assert (=> d!57173 m!220231))

(declare-fun m!222073 () Bool)

(assert (=> d!57173 m!222073))

(declare-fun m!222075 () Bool)

(assert (=> d!57173 m!222075))

(declare-fun m!222077 () Bool)

(assert (=> d!57173 m!222077))

(declare-fun m!222079 () Bool)

(assert (=> b!195048 m!222079))

(assert (=> b!195051 m!220231))

(declare-fun m!222081 () Bool)

(assert (=> b!195051 m!222081))

(assert (=> b!194275 d!57173))

(declare-fun d!57175 () Bool)

(assert (=> d!57175 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!4250 (getValueByKey!243 (toList!1225 lt!96610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56659 d!57175))

(assert (=> d!56659 d!56729))

(declare-fun d!57177 () Bool)

(assert (=> d!57177 (isDefined!197 (getValueByKey!243 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun lt!97185 () Unit!5819)

(assert (=> d!57177 (= lt!97185 (choose!1075 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(declare-fun e!128282 () Bool)

(assert (=> d!57177 e!128282))

(declare-fun res!92088 () Bool)

(assert (=> d!57177 (=> (not res!92088) (not e!128282))))

(assert (=> d!57177 (= res!92088 (isStrictlySorted!352 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))))

(assert (=> d!57177 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) lt!97185)))

(declare-fun b!195052 () Bool)

(assert (=> b!195052 (= e!128282 (containsKey!247 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (= (and d!57177 res!92088) b!195052))

(assert (=> d!57177 m!220093))

(assert (=> d!57177 m!220429))

(assert (=> d!57177 m!220429))

(assert (=> d!57177 m!220431))

(assert (=> d!57177 m!220093))

(declare-fun m!222083 () Bool)

(assert (=> d!57177 m!222083))

(declare-fun m!222085 () Bool)

(assert (=> d!57177 m!222085))

(assert (=> b!195052 m!220093))

(assert (=> b!195052 m!220425))

(assert (=> b!194072 d!57177))

(assert (=> b!194072 d!57045))

(assert (=> b!194072 d!57047))

(assert (=> bm!19654 d!56963))

(declare-fun d!57179 () Bool)

(declare-fun e!128284 () Bool)

(assert (=> d!57179 e!128284))

(declare-fun res!92090 () Bool)

(assert (=> d!57179 (=> (not res!92090) (not e!128284))))

(declare-fun lt!97186 () List!2426)

(assert (=> d!57179 (= res!92090 (isStrictlySorted!352 lt!97186))))

(declare-fun e!128285 () List!2426)

(assert (=> d!57179 (= lt!97186 e!128285)))

(declare-fun c!35298 () Bool)

(assert (=> d!57179 (= c!35298 (and ((_ is Cons!2422) (t!7343 (toList!1225 (map!2007 thiss!1248)))) (bvslt (_1!1766 (h!3063 (t!7343 (toList!1225 (map!2007 thiss!1248))))) (_1!1766 lt!96460))))))

(assert (=> d!57179 (isStrictlySorted!352 (t!7343 (toList!1225 (map!2007 thiss!1248))))))

(assert (=> d!57179 (= (insertStrictlySorted!136 (t!7343 (toList!1225 (map!2007 thiss!1248))) (_1!1766 lt!96460) (_2!1766 lt!96460)) lt!97186)))

(declare-fun bm!19700 () Bool)

(declare-fun call!19704 () List!2426)

(declare-fun call!19705 () List!2426)

(assert (=> bm!19700 (= call!19704 call!19705)))

(declare-fun b!195053 () Bool)

(declare-fun e!128286 () List!2426)

(assert (=> b!195053 (= e!128286 (insertStrictlySorted!136 (t!7343 (t!7343 (toList!1225 (map!2007 thiss!1248)))) (_1!1766 lt!96460) (_2!1766 lt!96460)))))

(declare-fun b!195054 () Bool)

(assert (=> b!195054 (= e!128284 (contains!1359 lt!97186 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!195055 () Bool)

(declare-fun e!128283 () List!2426)

(assert (=> b!195055 (= e!128285 e!128283)))

(declare-fun c!35300 () Bool)

(assert (=> b!195055 (= c!35300 (and ((_ is Cons!2422) (t!7343 (toList!1225 (map!2007 thiss!1248)))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 (map!2007 thiss!1248))))) (_1!1766 lt!96460))))))

(declare-fun b!195056 () Bool)

(declare-fun res!92089 () Bool)

(assert (=> b!195056 (=> (not res!92089) (not e!128284))))

(assert (=> b!195056 (= res!92089 (containsKey!247 lt!97186 (_1!1766 lt!96460)))))

(declare-fun b!195057 () Bool)

(assert (=> b!195057 (= e!128285 call!19705)))

(declare-fun b!195058 () Bool)

(declare-fun e!128287 () List!2426)

(declare-fun call!19703 () List!2426)

(assert (=> b!195058 (= e!128287 call!19703)))

(declare-fun b!195059 () Bool)

(assert (=> b!195059 (= e!128287 call!19703)))

(declare-fun b!195060 () Bool)

(declare-fun c!35301 () Bool)

(assert (=> b!195060 (= e!128286 (ite c!35300 (t!7343 (t!7343 (toList!1225 (map!2007 thiss!1248)))) (ite c!35301 (Cons!2422 (h!3063 (t!7343 (toList!1225 (map!2007 thiss!1248)))) (t!7343 (t!7343 (toList!1225 (map!2007 thiss!1248))))) Nil!2423)))))

(declare-fun b!195061 () Bool)

(assert (=> b!195061 (= e!128283 call!19704)))

(declare-fun bm!19701 () Bool)

(assert (=> bm!19701 (= call!19705 ($colon$colon!102 e!128286 (ite c!35298 (h!3063 (t!7343 (toList!1225 (map!2007 thiss!1248)))) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460)))))))

(declare-fun c!35299 () Bool)

(assert (=> bm!19701 (= c!35299 c!35298)))

(declare-fun b!195062 () Bool)

(assert (=> b!195062 (= c!35301 (and ((_ is Cons!2422) (t!7343 (toList!1225 (map!2007 thiss!1248)))) (bvsgt (_1!1766 (h!3063 (t!7343 (toList!1225 (map!2007 thiss!1248))))) (_1!1766 lt!96460))))))

(assert (=> b!195062 (= e!128283 e!128287)))

(declare-fun bm!19702 () Bool)

(assert (=> bm!19702 (= call!19703 call!19704)))

(assert (= (and d!57179 c!35298) b!195057))

(assert (= (and d!57179 (not c!35298)) b!195055))

(assert (= (and b!195055 c!35300) b!195061))

(assert (= (and b!195055 (not c!35300)) b!195062))

(assert (= (and b!195062 c!35301) b!195058))

(assert (= (and b!195062 (not c!35301)) b!195059))

(assert (= (or b!195058 b!195059) bm!19702))

(assert (= (or b!195061 bm!19702) bm!19700))

(assert (= (or b!195057 bm!19700) bm!19701))

(assert (= (and bm!19701 c!35299) b!195053))

(assert (= (and bm!19701 (not c!35299)) b!195060))

(assert (= (and d!57179 res!92090) b!195056))

(assert (= (and b!195056 res!92089) b!195054))

(declare-fun m!222087 () Bool)

(assert (=> d!57179 m!222087))

(declare-fun m!222089 () Bool)

(assert (=> d!57179 m!222089))

(declare-fun m!222091 () Bool)

(assert (=> b!195056 m!222091))

(declare-fun m!222093 () Bool)

(assert (=> b!195053 m!222093))

(declare-fun m!222095 () Bool)

(assert (=> b!195054 m!222095))

(declare-fun m!222097 () Bool)

(assert (=> bm!19701 m!222097))

(assert (=> b!194242 d!57179))

(declare-fun d!57181 () Bool)

(declare-fun e!128289 () Bool)

(assert (=> d!57181 e!128289))

(declare-fun res!92091 () Bool)

(assert (=> d!57181 (=> res!92091 e!128289)))

(declare-fun lt!97189 () Bool)

(assert (=> d!57181 (= res!92091 (not lt!97189))))

(declare-fun lt!97190 () Bool)

(assert (=> d!57181 (= lt!97189 lt!97190)))

(declare-fun lt!97188 () Unit!5819)

(declare-fun e!128288 () Unit!5819)

(assert (=> d!57181 (= lt!97188 e!128288)))

(declare-fun c!35302 () Bool)

(assert (=> d!57181 (= c!35302 lt!97190)))

(assert (=> d!57181 (= lt!97190 (containsKey!247 (toList!1225 lt!96605) lt!96618))))

(assert (=> d!57181 (= (contains!1356 lt!96605 lt!96618) lt!97189)))

(declare-fun b!195063 () Bool)

(declare-fun lt!97187 () Unit!5819)

(assert (=> b!195063 (= e!128288 lt!97187)))

(assert (=> b!195063 (= lt!97187 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96605) lt!96618))))

(assert (=> b!195063 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96605) lt!96618))))

(declare-fun b!195064 () Bool)

(declare-fun Unit!5874 () Unit!5819)

(assert (=> b!195064 (= e!128288 Unit!5874)))

(declare-fun b!195065 () Bool)

(assert (=> b!195065 (= e!128289 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96605) lt!96618)))))

(assert (= (and d!57181 c!35302) b!195063))

(assert (= (and d!57181 (not c!35302)) b!195064))

(assert (= (and d!57181 (not res!92091)) b!195065))

(declare-fun m!222099 () Bool)

(assert (=> d!57181 m!222099))

(declare-fun m!222101 () Bool)

(assert (=> b!195063 m!222101))

(assert (=> b!195063 m!220967))

(assert (=> b!195063 m!220967))

(declare-fun m!222103 () Bool)

(assert (=> b!195063 m!222103))

(assert (=> b!195065 m!220967))

(assert (=> b!195065 m!220967))

(assert (=> b!195065 m!222103))

(assert (=> d!56687 d!57181))

(assert (=> d!56687 d!56691))

(assert (=> d!56687 d!56695))

(declare-fun d!57183 () Bool)

(assert (=> d!57183 (= (apply!188 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))) lt!96618) (apply!188 lt!96605 lt!96618))))

(assert (=> d!57183 true))

(declare-fun _$34!1094 () Unit!5819)

(assert (=> d!57183 (= (choose!1076 lt!96605 lt!96620 (zeroValue!3800 thiss!1248) lt!96618) _$34!1094)))

(declare-fun bs!7767 () Bool)

(assert (= bs!7767 d!57183))

(assert (=> bs!7767 m!220253))

(assert (=> bs!7767 m!220253))

(assert (=> bs!7767 m!220255))

(assert (=> bs!7767 m!220263))

(assert (=> d!56687 d!57183))

(assert (=> d!56687 d!56703))

(declare-fun d!57185 () Bool)

(assert (=> d!57185 (= (apply!188 lt!96795 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96795) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7768 () Bool)

(assert (= bs!7768 d!57185))

(assert (=> bs!7768 m!221405))

(assert (=> bs!7768 m!221405))

(declare-fun m!222105 () Bool)

(assert (=> bs!7768 m!222105))

(assert (=> b!194287 d!57185))

(declare-fun d!57187 () Bool)

(assert (=> d!57187 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96628) lt!96643)) (v!4250 (getValueByKey!243 (toList!1225 lt!96628) lt!96643)))))

(assert (=> d!56629 d!57187))

(declare-fun b!195068 () Bool)

(declare-fun e!128291 () Option!249)

(assert (=> b!195068 (= e!128291 (getValueByKey!243 (t!7343 (toList!1225 lt!96628)) lt!96643))))

(declare-fun d!57189 () Bool)

(declare-fun c!35303 () Bool)

(assert (=> d!57189 (= c!35303 (and ((_ is Cons!2422) (toList!1225 lt!96628)) (= (_1!1766 (h!3063 (toList!1225 lt!96628))) lt!96643)))))

(declare-fun e!128290 () Option!249)

(assert (=> d!57189 (= (getValueByKey!243 (toList!1225 lt!96628) lt!96643) e!128290)))

(declare-fun b!195066 () Bool)

(assert (=> b!195066 (= e!128290 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96628)))))))

(declare-fun b!195067 () Bool)

(assert (=> b!195067 (= e!128290 e!128291)))

(declare-fun c!35304 () Bool)

(assert (=> b!195067 (= c!35304 (and ((_ is Cons!2422) (toList!1225 lt!96628)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96628))) lt!96643))))))

(declare-fun b!195069 () Bool)

(assert (=> b!195069 (= e!128291 None!247)))

(assert (= (and d!57189 c!35303) b!195066))

(assert (= (and d!57189 (not c!35303)) b!195067))

(assert (= (and b!195067 c!35304) b!195068))

(assert (= (and b!195067 (not c!35304)) b!195069))

(declare-fun m!222107 () Bool)

(assert (=> b!195068 m!222107))

(assert (=> d!56629 d!57189))

(declare-fun d!57191 () Bool)

(declare-fun e!128293 () Bool)

(assert (=> d!57191 e!128293))

(declare-fun res!92092 () Bool)

(assert (=> d!57191 (=> res!92092 e!128293)))

(declare-fun lt!97193 () Bool)

(assert (=> d!57191 (= res!92092 (not lt!97193))))

(declare-fun lt!97194 () Bool)

(assert (=> d!57191 (= lt!97193 lt!97194)))

(declare-fun lt!97192 () Unit!5819)

(declare-fun e!128292 () Unit!5819)

(assert (=> d!57191 (= lt!97192 e!128292)))

(declare-fun c!35305 () Bool)

(assert (=> d!57191 (= c!35305 lt!97194)))

(assert (=> d!57191 (= lt!97194 (containsKey!247 (toList!1225 lt!96786) (_1!1766 (tuple2!3511 key!828 v!309))))))

(assert (=> d!57191 (= (contains!1356 lt!96786 (_1!1766 (tuple2!3511 key!828 v!309))) lt!97193)))

(declare-fun b!195070 () Bool)

(declare-fun lt!97191 () Unit!5819)

(assert (=> b!195070 (= e!128292 lt!97191)))

(assert (=> b!195070 (= lt!97191 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96786) (_1!1766 (tuple2!3511 key!828 v!309))))))

(assert (=> b!195070 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96786) (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun b!195071 () Bool)

(declare-fun Unit!5875 () Unit!5819)

(assert (=> b!195071 (= e!128292 Unit!5875)))

(declare-fun b!195072 () Bool)

(assert (=> b!195072 (= e!128293 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96786) (_1!1766 (tuple2!3511 key!828 v!309)))))))

(assert (= (and d!57191 c!35305) b!195070))

(assert (= (and d!57191 (not c!35305)) b!195071))

(assert (= (and d!57191 (not res!92092)) b!195072))

(declare-fun m!222109 () Bool)

(assert (=> d!57191 m!222109))

(declare-fun m!222111 () Bool)

(assert (=> b!195070 m!222111))

(assert (=> b!195070 m!220645))

(assert (=> b!195070 m!220645))

(declare-fun m!222113 () Bool)

(assert (=> b!195070 m!222113))

(assert (=> b!195072 m!220645))

(assert (=> b!195072 m!220645))

(assert (=> b!195072 m!222113))

(assert (=> d!56595 d!57191))

(declare-fun e!128295 () Option!249)

(declare-fun b!195075 () Bool)

(assert (=> b!195075 (= e!128295 (getValueByKey!243 (t!7343 lt!96788) (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun d!57193 () Bool)

(declare-fun c!35306 () Bool)

(assert (=> d!57193 (= c!35306 (and ((_ is Cons!2422) lt!96788) (= (_1!1766 (h!3063 lt!96788)) (_1!1766 (tuple2!3511 key!828 v!309)))))))

(declare-fun e!128294 () Option!249)

(assert (=> d!57193 (= (getValueByKey!243 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309))) e!128294)))

(declare-fun b!195073 () Bool)

(assert (=> b!195073 (= e!128294 (Some!248 (_2!1766 (h!3063 lt!96788))))))

(declare-fun b!195074 () Bool)

(assert (=> b!195074 (= e!128294 e!128295)))

(declare-fun c!35307 () Bool)

(assert (=> b!195074 (= c!35307 (and ((_ is Cons!2422) lt!96788) (not (= (_1!1766 (h!3063 lt!96788)) (_1!1766 (tuple2!3511 key!828 v!309))))))))

(declare-fun b!195076 () Bool)

(assert (=> b!195076 (= e!128295 None!247)))

(assert (= (and d!57193 c!35306) b!195073))

(assert (= (and d!57193 (not c!35306)) b!195074))

(assert (= (and b!195074 c!35307) b!195075))

(assert (= (and b!195074 (not c!35307)) b!195076))

(declare-fun m!222115 () Bool)

(assert (=> b!195075 m!222115))

(assert (=> d!56595 d!57193))

(declare-fun d!57195 () Bool)

(assert (=> d!57195 (= (getValueByKey!243 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309))) (Some!248 (_2!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun lt!97195 () Unit!5819)

(assert (=> d!57195 (= lt!97195 (choose!1074 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun e!128296 () Bool)

(assert (=> d!57195 e!128296))

(declare-fun res!92093 () Bool)

(assert (=> d!57195 (=> (not res!92093) (not e!128296))))

(assert (=> d!57195 (= res!92093 (isStrictlySorted!352 lt!96788))))

(assert (=> d!57195 (= (lemmaContainsTupThenGetReturnValue!133 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))) lt!97195)))

(declare-fun b!195077 () Bool)

(declare-fun res!92094 () Bool)

(assert (=> b!195077 (=> (not res!92094) (not e!128296))))

(assert (=> b!195077 (= res!92094 (containsKey!247 lt!96788 (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun b!195078 () Bool)

(assert (=> b!195078 (= e!128296 (contains!1359 lt!96788 (tuple2!3511 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309)))))))

(assert (= (and d!57195 res!92093) b!195077))

(assert (= (and b!195077 res!92094) b!195078))

(assert (=> d!57195 m!220639))

(declare-fun m!222117 () Bool)

(assert (=> d!57195 m!222117))

(declare-fun m!222119 () Bool)

(assert (=> d!57195 m!222119))

(declare-fun m!222121 () Bool)

(assert (=> b!195077 m!222121))

(declare-fun m!222123 () Bool)

(assert (=> b!195078 m!222123))

(assert (=> d!56595 d!57195))

(declare-fun d!57197 () Bool)

(declare-fun e!128298 () Bool)

(assert (=> d!57197 e!128298))

(declare-fun res!92096 () Bool)

(assert (=> d!57197 (=> (not res!92096) (not e!128298))))

(declare-fun lt!97196 () List!2426)

(assert (=> d!57197 (= res!92096 (isStrictlySorted!352 lt!97196))))

(declare-fun e!128299 () List!2426)

(assert (=> d!57197 (= lt!97196 e!128299)))

(declare-fun c!35308 () Bool)

(assert (=> d!57197 (= c!35308 (and ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (bvslt (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (_1!1766 (tuple2!3511 key!828 v!309)))))))

(assert (=> d!57197 (isStrictlySorted!352 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))))

(assert (=> d!57197 (= (insertStrictlySorted!136 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))) (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))) lt!97196)))

(declare-fun bm!19703 () Bool)

(declare-fun call!19707 () List!2426)

(declare-fun call!19708 () List!2426)

(assert (=> bm!19703 (= call!19707 call!19708)))

(declare-fun b!195079 () Bool)

(declare-fun e!128300 () List!2426)

(assert (=> b!195079 (= e!128300 (insertStrictlySorted!136 (t!7343 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun b!195080 () Bool)

(assert (=> b!195080 (= e!128298 (contains!1359 lt!97196 (tuple2!3511 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309)))))))

(declare-fun b!195081 () Bool)

(declare-fun e!128297 () List!2426)

(assert (=> b!195081 (= e!128299 e!128297)))

(declare-fun c!35310 () Bool)

(assert (=> b!195081 (= c!35310 (and ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (= (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (_1!1766 (tuple2!3511 key!828 v!309)))))))

(declare-fun b!195082 () Bool)

(declare-fun res!92095 () Bool)

(assert (=> b!195082 (=> (not res!92095) (not e!128298))))

(assert (=> b!195082 (= res!92095 (containsKey!247 lt!97196 (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun b!195083 () Bool)

(assert (=> b!195083 (= e!128299 call!19708)))

(declare-fun b!195084 () Bool)

(declare-fun e!128301 () List!2426)

(declare-fun call!19706 () List!2426)

(assert (=> b!195084 (= e!128301 call!19706)))

(declare-fun b!195085 () Bool)

(assert (=> b!195085 (= e!128301 call!19706)))

(declare-fun c!35311 () Bool)

(declare-fun b!195086 () Bool)

(assert (=> b!195086 (= e!128300 (ite c!35310 (t!7343 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (ite c!35311 (Cons!2422 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (t!7343 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) Nil!2423)))))

(declare-fun b!195087 () Bool)

(assert (=> b!195087 (= e!128297 call!19707)))

(declare-fun bm!19704 () Bool)

(assert (=> bm!19704 (= call!19708 ($colon$colon!102 e!128300 (ite c!35308 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (tuple2!3511 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))))

(declare-fun c!35309 () Bool)

(assert (=> bm!19704 (= c!35309 c!35308)))

(declare-fun b!195088 () Bool)

(assert (=> b!195088 (= c!35311 (and ((_ is Cons!2422) (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))) (bvsgt (_1!1766 (h!3063 (toList!1225 (getCurrentListMap!858 (_keys!5952 thiss!1248) (_values!3942 thiss!1248) (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248))))) (_1!1766 (tuple2!3511 key!828 v!309)))))))

(assert (=> b!195088 (= e!128297 e!128301)))

(declare-fun bm!19705 () Bool)

(assert (=> bm!19705 (= call!19706 call!19707)))

(assert (= (and d!57197 c!35308) b!195083))

(assert (= (and d!57197 (not c!35308)) b!195081))

(assert (= (and b!195081 c!35310) b!195087))

(assert (= (and b!195081 (not c!35310)) b!195088))

(assert (= (and b!195088 c!35311) b!195084))

(assert (= (and b!195088 (not c!35311)) b!195085))

(assert (= (or b!195084 b!195085) bm!19705))

(assert (= (or b!195087 bm!19705) bm!19703))

(assert (= (or b!195083 bm!19703) bm!19704))

(assert (= (and bm!19704 c!35309) b!195079))

(assert (= (and bm!19704 (not c!35309)) b!195086))

(assert (= (and d!57197 res!92096) b!195082))

(assert (= (and b!195082 res!92095) b!195080))

(declare-fun m!222125 () Bool)

(assert (=> d!57197 m!222125))

(declare-fun m!222127 () Bool)

(assert (=> d!57197 m!222127))

(declare-fun m!222129 () Bool)

(assert (=> b!195082 m!222129))

(declare-fun m!222131 () Bool)

(assert (=> b!195079 m!222131))

(declare-fun m!222133 () Bool)

(assert (=> b!195080 m!222133))

(declare-fun m!222135 () Bool)

(assert (=> bm!19704 m!222135))

(assert (=> d!56595 d!57197))

(declare-fun d!57199 () Bool)

(declare-fun e!128303 () Bool)

(assert (=> d!57199 e!128303))

(declare-fun res!92097 () Bool)

(assert (=> d!57199 (=> res!92097 e!128303)))

(declare-fun lt!97199 () Bool)

(assert (=> d!57199 (= res!92097 (not lt!97199))))

(declare-fun lt!97200 () Bool)

(assert (=> d!57199 (= lt!97199 lt!97200)))

(declare-fun lt!97198 () Unit!5819)

(declare-fun e!128302 () Unit!5819)

(assert (=> d!57199 (= lt!97198 e!128302)))

(declare-fun c!35312 () Bool)

(assert (=> d!57199 (= c!35312 lt!97200)))

(assert (=> d!57199 (= lt!97200 (containsKey!247 (toList!1225 lt!96834) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(assert (=> d!57199 (= (contains!1356 lt!96834 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!97199)))

(declare-fun b!195089 () Bool)

(declare-fun lt!97197 () Unit!5819)

(assert (=> b!195089 (= e!128302 lt!97197)))

(assert (=> b!195089 (= lt!97197 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96834) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(assert (=> b!195089 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96834) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun b!195090 () Bool)

(declare-fun Unit!5876 () Unit!5819)

(assert (=> b!195090 (= e!128302 Unit!5876)))

(declare-fun b!195091 () Bool)

(assert (=> b!195091 (= e!128303 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96834) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57199 c!35312) b!195089))

(assert (= (and d!57199 (not c!35312)) b!195090))

(assert (= (and d!57199 (not res!92097)) b!195091))

(declare-fun m!222137 () Bool)

(assert (=> d!57199 m!222137))

(declare-fun m!222139 () Bool)

(assert (=> b!195089 m!222139))

(assert (=> b!195089 m!220789))

(assert (=> b!195089 m!220789))

(declare-fun m!222141 () Bool)

(assert (=> b!195089 m!222141))

(assert (=> b!195091 m!220789))

(assert (=> b!195091 m!220789))

(assert (=> b!195091 m!222141))

(assert (=> d!56619 d!57199))

(declare-fun b!195094 () Bool)

(declare-fun e!128305 () Option!249)

(assert (=> b!195094 (= e!128305 (getValueByKey!243 (t!7343 lt!96836) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun d!57201 () Bool)

(declare-fun c!35313 () Bool)

(assert (=> d!57201 (= c!35313 (and ((_ is Cons!2422) lt!96836) (= (_1!1766 (h!3063 lt!96836)) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(declare-fun e!128304 () Option!249)

(assert (=> d!57201 (= (getValueByKey!243 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) e!128304)))

(declare-fun b!195092 () Bool)

(assert (=> b!195092 (= e!128304 (Some!248 (_2!1766 (h!3063 lt!96836))))))

(declare-fun b!195093 () Bool)

(assert (=> b!195093 (= e!128304 e!128305)))

(declare-fun c!35314 () Bool)

(assert (=> b!195093 (= c!35314 (and ((_ is Cons!2422) lt!96836) (not (= (_1!1766 (h!3063 lt!96836)) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195095 () Bool)

(assert (=> b!195095 (= e!128305 None!247)))

(assert (= (and d!57201 c!35313) b!195092))

(assert (= (and d!57201 (not c!35313)) b!195093))

(assert (= (and b!195093 c!35314) b!195094))

(assert (= (and b!195093 (not c!35314)) b!195095))

(declare-fun m!222143 () Bool)

(assert (=> b!195094 m!222143))

(assert (=> d!56619 d!57201))

(declare-fun d!57203 () Bool)

(assert (=> d!57203 (= (getValueByKey!243 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97201 () Unit!5819)

(assert (=> d!57203 (= lt!97201 (choose!1074 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun e!128306 () Bool)

(assert (=> d!57203 e!128306))

(declare-fun res!92098 () Bool)

(assert (=> d!57203 (=> (not res!92098) (not e!128306))))

(assert (=> d!57203 (= res!92098 (isStrictlySorted!352 lt!96836))))

(assert (=> d!57203 (= (lemmaContainsTupThenGetReturnValue!133 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!97201)))

(declare-fun b!195096 () Bool)

(declare-fun res!92099 () Bool)

(assert (=> b!195096 (=> (not res!92099) (not e!128306))))

(assert (=> b!195096 (= res!92099 (containsKey!247 lt!96836 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun b!195097 () Bool)

(assert (=> b!195097 (= e!128306 (contains!1359 lt!96836 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57203 res!92098) b!195096))

(assert (= (and b!195096 res!92099) b!195097))

(assert (=> d!57203 m!220783))

(declare-fun m!222145 () Bool)

(assert (=> d!57203 m!222145))

(declare-fun m!222147 () Bool)

(assert (=> d!57203 m!222147))

(declare-fun m!222149 () Bool)

(assert (=> b!195096 m!222149))

(declare-fun m!222151 () Bool)

(assert (=> b!195097 m!222151))

(assert (=> d!56619 d!57203))

(declare-fun d!57205 () Bool)

(declare-fun e!128308 () Bool)

(assert (=> d!57205 e!128308))

(declare-fun res!92101 () Bool)

(assert (=> d!57205 (=> (not res!92101) (not e!128308))))

(declare-fun lt!97202 () List!2426)

(assert (=> d!57205 (= res!92101 (isStrictlySorted!352 lt!97202))))

(declare-fun e!128309 () List!2426)

(assert (=> d!57205 (= lt!97202 e!128309)))

(declare-fun c!35315 () Bool)

(assert (=> d!57205 (= c!35315 (and ((_ is Cons!2422) (toList!1225 lt!96628)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96628))) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(assert (=> d!57205 (isStrictlySorted!352 (toList!1225 lt!96628))))

(assert (=> d!57205 (= (insertStrictlySorted!136 (toList!1225 lt!96628) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))) lt!97202)))

(declare-fun bm!19706 () Bool)

(declare-fun call!19710 () List!2426)

(declare-fun call!19711 () List!2426)

(assert (=> bm!19706 (= call!19710 call!19711)))

(declare-fun b!195098 () Bool)

(declare-fun e!128310 () List!2426)

(assert (=> b!195098 (= e!128310 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96628)) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun b!195099 () Bool)

(assert (=> b!195099 (= e!128308 (contains!1359 lt!97202 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(declare-fun b!195100 () Bool)

(declare-fun e!128307 () List!2426)

(assert (=> b!195100 (= e!128309 e!128307)))

(declare-fun c!35317 () Bool)

(assert (=> b!195100 (= c!35317 (and ((_ is Cons!2422) (toList!1225 lt!96628)) (= (_1!1766 (h!3063 (toList!1225 lt!96628))) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(declare-fun b!195101 () Bool)

(declare-fun res!92100 () Bool)

(assert (=> b!195101 (=> (not res!92100) (not e!128308))))

(assert (=> b!195101 (= res!92100 (containsKey!247 lt!97202 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))

(declare-fun b!195102 () Bool)

(assert (=> b!195102 (= e!128309 call!19711)))

(declare-fun b!195103 () Bool)

(declare-fun e!128311 () List!2426)

(declare-fun call!19709 () List!2426)

(assert (=> b!195103 (= e!128311 call!19709)))

(declare-fun b!195104 () Bool)

(assert (=> b!195104 (= e!128311 call!19709)))

(declare-fun c!35318 () Bool)

(declare-fun b!195105 () Bool)

(assert (=> b!195105 (= e!128310 (ite c!35317 (t!7343 (toList!1225 lt!96628)) (ite c!35318 (Cons!2422 (h!3063 (toList!1225 lt!96628)) (t!7343 (toList!1225 lt!96628))) Nil!2423)))))

(declare-fun b!195106 () Bool)

(assert (=> b!195106 (= e!128307 call!19710)))

(declare-fun bm!19707 () Bool)

(assert (=> bm!19707 (= call!19711 ($colon$colon!102 e!128310 (ite c!35315 (h!3063 (toList!1225 lt!96628)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35316 () Bool)

(assert (=> bm!19707 (= c!35316 c!35315)))

(declare-fun b!195107 () Bool)

(assert (=> b!195107 (= c!35318 (and ((_ is Cons!2422) (toList!1225 lt!96628)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96628))) (_1!1766 (tuple2!3511 lt!96631 (minValue!3800 thiss!1248))))))))

(assert (=> b!195107 (= e!128307 e!128311)))

(declare-fun bm!19708 () Bool)

(assert (=> bm!19708 (= call!19709 call!19710)))

(assert (= (and d!57205 c!35315) b!195102))

(assert (= (and d!57205 (not c!35315)) b!195100))

(assert (= (and b!195100 c!35317) b!195106))

(assert (= (and b!195100 (not c!35317)) b!195107))

(assert (= (and b!195107 c!35318) b!195103))

(assert (= (and b!195107 (not c!35318)) b!195104))

(assert (= (or b!195103 b!195104) bm!19708))

(assert (= (or b!195106 bm!19708) bm!19706))

(assert (= (or b!195102 bm!19706) bm!19707))

(assert (= (and bm!19707 c!35316) b!195098))

(assert (= (and bm!19707 (not c!35316)) b!195105))

(assert (= (and d!57205 res!92101) b!195101))

(assert (= (and b!195101 res!92100) b!195099))

(declare-fun m!222153 () Bool)

(assert (=> d!57205 m!222153))

(declare-fun m!222155 () Bool)

(assert (=> d!57205 m!222155))

(declare-fun m!222157 () Bool)

(assert (=> b!195101 m!222157))

(declare-fun m!222159 () Bool)

(assert (=> b!195098 m!222159))

(declare-fun m!222161 () Bool)

(assert (=> b!195099 m!222161))

(declare-fun m!222163 () Bool)

(assert (=> bm!19707 m!222163))

(assert (=> d!56619 d!57205))

(declare-fun d!57207 () Bool)

(declare-fun lt!97203 () Bool)

(assert (=> d!57207 (= lt!97203 (select (content!156 Nil!2426) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun e!128312 () Bool)

(assert (=> d!57207 (= lt!97203 e!128312)))

(declare-fun res!92102 () Bool)

(assert (=> d!57207 (=> (not res!92102) (not e!128312))))

(assert (=> d!57207 (= res!92102 ((_ is Cons!2425) Nil!2426))))

(assert (=> d!57207 (= (contains!1360 Nil!2426 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) lt!97203)))

(declare-fun b!195108 () Bool)

(declare-fun e!128313 () Bool)

(assert (=> b!195108 (= e!128312 e!128313)))

(declare-fun res!92103 () Bool)

(assert (=> b!195108 (=> res!92103 e!128313)))

(assert (=> b!195108 (= res!92103 (= (h!3066 Nil!2426) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!195109 () Bool)

(assert (=> b!195109 (= e!128313 (contains!1360 (t!7348 Nil!2426) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(assert (= (and d!57207 res!92102) b!195108))

(assert (= (and b!195108 (not res!92103)) b!195109))

(assert (=> d!57207 m!221493))

(assert (=> d!57207 m!220529))

(declare-fun m!222165 () Bool)

(assert (=> d!57207 m!222165))

(assert (=> b!195109 m!220529))

(declare-fun m!222167 () Bool)

(assert (=> b!195109 m!222167))

(assert (=> b!194406 d!57207))

(declare-fun d!57209 () Bool)

(declare-fun e!128315 () Bool)

(assert (=> d!57209 e!128315))

(declare-fun res!92104 () Bool)

(assert (=> d!57209 (=> res!92104 e!128315)))

(declare-fun lt!97206 () Bool)

(assert (=> d!57209 (= res!92104 (not lt!97206))))

(declare-fun lt!97207 () Bool)

(assert (=> d!57209 (= lt!97206 lt!97207)))

(declare-fun lt!97205 () Unit!5819)

(declare-fun e!128314 () Unit!5819)

(assert (=> d!57209 (= lt!97205 e!128314)))

(declare-fun c!35319 () Bool)

(assert (=> d!57209 (= c!35319 lt!97207)))

(assert (=> d!57209 (= lt!97207 (containsKey!247 (toList!1225 lt!96765) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57209 (= (contains!1356 lt!96765 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97206)))

(declare-fun b!195110 () Bool)

(declare-fun lt!97204 () Unit!5819)

(assert (=> b!195110 (= e!128314 lt!97204)))

(assert (=> b!195110 (= lt!97204 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96765) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> b!195110 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96765) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195111 () Bool)

(declare-fun Unit!5877 () Unit!5819)

(assert (=> b!195111 (= e!128314 Unit!5877)))

(declare-fun b!195112 () Bool)

(assert (=> b!195112 (= e!128315 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96765) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!57209 c!35319) b!195110))

(assert (= (and d!57209 (not c!35319)) b!195111))

(assert (= (and d!57209 (not res!92104)) b!195112))

(declare-fun m!222169 () Bool)

(assert (=> d!57209 m!222169))

(declare-fun m!222171 () Bool)

(assert (=> b!195110 m!222171))

(assert (=> b!195110 m!220585))

(assert (=> b!195110 m!220585))

(declare-fun m!222173 () Bool)

(assert (=> b!195110 m!222173))

(assert (=> b!195112 m!220585))

(assert (=> b!195112 m!220585))

(assert (=> b!195112 m!222173))

(assert (=> d!56575 d!57209))

(declare-fun b!195115 () Bool)

(declare-fun e!128317 () Option!249)

(assert (=> b!195115 (= e!128317 (getValueByKey!243 (t!7343 lt!96767) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun d!57211 () Bool)

(declare-fun c!35320 () Bool)

(assert (=> d!57211 (= c!35320 (and ((_ is Cons!2422) lt!96767) (= (_1!1766 (h!3063 lt!96767)) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun e!128316 () Option!249)

(assert (=> d!57211 (= (getValueByKey!243 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) e!128316)))

(declare-fun b!195113 () Bool)

(assert (=> b!195113 (= e!128316 (Some!248 (_2!1766 (h!3063 lt!96767))))))

(declare-fun b!195114 () Bool)

(assert (=> b!195114 (= e!128316 e!128317)))

(declare-fun c!35321 () Bool)

(assert (=> b!195114 (= c!35321 (and ((_ is Cons!2422) lt!96767) (not (= (_1!1766 (h!3063 lt!96767)) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun b!195116 () Bool)

(assert (=> b!195116 (= e!128317 None!247)))

(assert (= (and d!57211 c!35320) b!195113))

(assert (= (and d!57211 (not c!35320)) b!195114))

(assert (= (and b!195114 c!35321) b!195115))

(assert (= (and b!195114 (not c!35321)) b!195116))

(declare-fun m!222175 () Bool)

(assert (=> b!195115 m!222175))

(assert (=> d!56575 d!57211))

(declare-fun d!57213 () Bool)

(assert (=> d!57213 (= (getValueByKey!243 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) (Some!248 (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun lt!97208 () Unit!5819)

(assert (=> d!57213 (= lt!97208 (choose!1074 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128318 () Bool)

(assert (=> d!57213 e!128318))

(declare-fun res!92105 () Bool)

(assert (=> d!57213 (=> (not res!92105) (not e!128318))))

(assert (=> d!57213 (= res!92105 (isStrictlySorted!352 lt!96767))))

(assert (=> d!57213 (= (lemmaContainsTupThenGetReturnValue!133 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97208)))

(declare-fun b!195117 () Bool)

(declare-fun res!92106 () Bool)

(assert (=> b!195117 (=> (not res!92106) (not e!128318))))

(assert (=> b!195117 (= res!92106 (containsKey!247 lt!96767 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195118 () Bool)

(assert (=> b!195118 (= e!128318 (contains!1359 lt!96767 (tuple2!3511 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (= (and d!57213 res!92105) b!195117))

(assert (= (and b!195117 res!92106) b!195118))

(assert (=> d!57213 m!220579))

(declare-fun m!222177 () Bool)

(assert (=> d!57213 m!222177))

(declare-fun m!222179 () Bool)

(assert (=> d!57213 m!222179))

(declare-fun m!222181 () Bool)

(assert (=> b!195117 m!222181))

(declare-fun m!222183 () Bool)

(assert (=> b!195118 m!222183))

(assert (=> d!56575 d!57213))

(declare-fun d!57215 () Bool)

(declare-fun e!128320 () Bool)

(assert (=> d!57215 e!128320))

(declare-fun res!92108 () Bool)

(assert (=> d!57215 (=> (not res!92108) (not e!128320))))

(declare-fun lt!97209 () List!2426)

(assert (=> d!57215 (= res!92108 (isStrictlySorted!352 lt!97209))))

(declare-fun e!128321 () List!2426)

(assert (=> d!57215 (= lt!97209 e!128321)))

(declare-fun c!35322 () Bool)

(assert (=> d!57215 (= c!35322 (and ((_ is Cons!2422) (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (bvslt (_1!1766 (h!3063 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> d!57215 (isStrictlySorted!352 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))))))

(assert (=> d!57215 (= (insertStrictlySorted!136 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))) lt!97209)))

(declare-fun bm!19709 () Bool)

(declare-fun call!19713 () List!2426)

(declare-fun call!19714 () List!2426)

(assert (=> bm!19709 (= call!19713 call!19714)))

(declare-fun e!128322 () List!2426)

(declare-fun b!195119 () Bool)

(assert (=> b!195119 (= e!128322 (insertStrictlySorted!136 (t!7343 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195120 () Bool)

(assert (=> b!195120 (= e!128320 (contains!1359 lt!97209 (tuple2!3511 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195121 () Bool)

(declare-fun e!128319 () List!2426)

(assert (=> b!195121 (= e!128321 e!128319)))

(declare-fun c!35324 () Bool)

(assert (=> b!195121 (= c!35324 (and ((_ is Cons!2422) (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (= (_1!1766 (h!3063 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195122 () Bool)

(declare-fun res!92107 () Bool)

(assert (=> b!195122 (=> (not res!92107) (not e!128320))))

(assert (=> b!195122 (= res!92107 (containsKey!247 lt!97209 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195123 () Bool)

(assert (=> b!195123 (= e!128321 call!19714)))

(declare-fun b!195124 () Bool)

(declare-fun e!128323 () List!2426)

(declare-fun call!19712 () List!2426)

(assert (=> b!195124 (= e!128323 call!19712)))

(declare-fun b!195125 () Bool)

(assert (=> b!195125 (= e!128323 call!19712)))

(declare-fun c!35325 () Bool)

(declare-fun b!195126 () Bool)

(assert (=> b!195126 (= e!128322 (ite c!35324 (t!7343 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (ite c!35325 (Cons!2422 (h!3063 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (t!7343 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))))) Nil!2423)))))

(declare-fun b!195127 () Bool)

(assert (=> b!195127 (= e!128319 call!19713)))

(declare-fun bm!19710 () Bool)

(assert (=> bm!19710 (= call!19714 ($colon$colon!102 e!128322 (ite c!35322 (h!3063 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (tuple2!3511 (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (_2!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))))

(declare-fun c!35323 () Bool)

(assert (=> bm!19710 (= c!35323 c!35322)))

(declare-fun b!195128 () Bool)

(assert (=> b!195128 (= c!35325 (and ((_ is Cons!2422) (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600)))) (bvsgt (_1!1766 (h!3063 (toList!1225 (ite c!34989 call!19605 (ite c!34984 call!19602 call!19600))))) (_1!1766 (ite (or c!34989 c!34984) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3800 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(assert (=> b!195128 (= e!128319 e!128323)))

(declare-fun bm!19711 () Bool)

(assert (=> bm!19711 (= call!19712 call!19713)))

(assert (= (and d!57215 c!35322) b!195123))

(assert (= (and d!57215 (not c!35322)) b!195121))

(assert (= (and b!195121 c!35324) b!195127))

(assert (= (and b!195121 (not c!35324)) b!195128))

(assert (= (and b!195128 c!35325) b!195124))

(assert (= (and b!195128 (not c!35325)) b!195125))

(assert (= (or b!195124 b!195125) bm!19711))

(assert (= (or b!195127 bm!19711) bm!19709))

(assert (= (or b!195123 bm!19709) bm!19710))

(assert (= (and bm!19710 c!35323) b!195119))

(assert (= (and bm!19710 (not c!35323)) b!195126))

(assert (= (and d!57215 res!92108) b!195122))

(assert (= (and b!195122 res!92107) b!195120))

(declare-fun m!222185 () Bool)

(assert (=> d!57215 m!222185))

(declare-fun m!222187 () Bool)

(assert (=> d!57215 m!222187))

(declare-fun m!222189 () Bool)

(assert (=> b!195122 m!222189))

(declare-fun m!222191 () Bool)

(assert (=> b!195119 m!222191))

(declare-fun m!222193 () Bool)

(assert (=> b!195120 m!222193))

(declare-fun m!222195 () Bool)

(assert (=> bm!19710 m!222195))

(assert (=> d!56575 d!57215))

(declare-fun d!57217 () Bool)

(assert (=> d!57217 (= (validMask!0 (mask!9221 lt!96455)) (and (or (= (mask!9221 lt!96455) #b00000000000000000000000000000111) (= (mask!9221 lt!96455) #b00000000000000000000000000001111) (= (mask!9221 lt!96455) #b00000000000000000000000000011111) (= (mask!9221 lt!96455) #b00000000000000000000000000111111) (= (mask!9221 lt!96455) #b00000000000000000000000001111111) (= (mask!9221 lt!96455) #b00000000000000000000000011111111) (= (mask!9221 lt!96455) #b00000000000000000000000111111111) (= (mask!9221 lt!96455) #b00000000000000000000001111111111) (= (mask!9221 lt!96455) #b00000000000000000000011111111111) (= (mask!9221 lt!96455) #b00000000000000000000111111111111) (= (mask!9221 lt!96455) #b00000000000000000001111111111111) (= (mask!9221 lt!96455) #b00000000000000000011111111111111) (= (mask!9221 lt!96455) #b00000000000000000111111111111111) (= (mask!9221 lt!96455) #b00000000000000001111111111111111) (= (mask!9221 lt!96455) #b00000000000000011111111111111111) (= (mask!9221 lt!96455) #b00000000000000111111111111111111) (= (mask!9221 lt!96455) #b00000000000001111111111111111111) (= (mask!9221 lt!96455) #b00000000000011111111111111111111) (= (mask!9221 lt!96455) #b00000000000111111111111111111111) (= (mask!9221 lt!96455) #b00000000001111111111111111111111) (= (mask!9221 lt!96455) #b00000000011111111111111111111111) (= (mask!9221 lt!96455) #b00000000111111111111111111111111) (= (mask!9221 lt!96455) #b00000001111111111111111111111111) (= (mask!9221 lt!96455) #b00000011111111111111111111111111) (= (mask!9221 lt!96455) #b00000111111111111111111111111111) (= (mask!9221 lt!96455) #b00001111111111111111111111111111) (= (mask!9221 lt!96455) #b00011111111111111111111111111111) (= (mask!9221 lt!96455) #b00111111111111111111111111111111)) (bvsle (mask!9221 lt!96455) #b00111111111111111111111111111111)))))

(assert (=> d!56655 d!57217))

(declare-fun d!57219 () Bool)

(declare-fun res!92109 () Bool)

(declare-fun e!128324 () Bool)

(assert (=> d!57219 (=> res!92109 e!128324)))

(assert (=> d!57219 (= res!92109 (or ((_ is Nil!2423) lt!96764) ((_ is Nil!2423) (t!7343 lt!96764))))))

(assert (=> d!57219 (= (isStrictlySorted!352 lt!96764) e!128324)))

(declare-fun b!195129 () Bool)

(declare-fun e!128325 () Bool)

(assert (=> b!195129 (= e!128324 e!128325)))

(declare-fun res!92110 () Bool)

(assert (=> b!195129 (=> (not res!92110) (not e!128325))))

(assert (=> b!195129 (= res!92110 (bvslt (_1!1766 (h!3063 lt!96764)) (_1!1766 (h!3063 (t!7343 lt!96764)))))))

(declare-fun b!195130 () Bool)

(assert (=> b!195130 (= e!128325 (isStrictlySorted!352 (t!7343 lt!96764)))))

(assert (= (and d!57219 (not res!92109)) b!195129))

(assert (= (and b!195129 res!92110) b!195130))

(declare-fun m!222197 () Bool)

(assert (=> b!195130 m!222197))

(assert (=> d!56573 d!57219))

(declare-fun d!57221 () Bool)

(declare-fun res!92111 () Bool)

(declare-fun e!128326 () Bool)

(assert (=> d!57221 (=> res!92111 e!128326)))

(assert (=> d!57221 (= res!92111 (or ((_ is Nil!2423) (toList!1225 (map!2007 thiss!1248))) ((_ is Nil!2423) (t!7343 (toList!1225 (map!2007 thiss!1248))))))))

(assert (=> d!57221 (= (isStrictlySorted!352 (toList!1225 (map!2007 thiss!1248))) e!128326)))

(declare-fun b!195131 () Bool)

(declare-fun e!128327 () Bool)

(assert (=> b!195131 (= e!128326 e!128327)))

(declare-fun res!92112 () Bool)

(assert (=> b!195131 (=> (not res!92112) (not e!128327))))

(assert (=> b!195131 (= res!92112 (bvslt (_1!1766 (h!3063 (toList!1225 (map!2007 thiss!1248)))) (_1!1766 (h!3063 (t!7343 (toList!1225 (map!2007 thiss!1248)))))))))

(declare-fun b!195132 () Bool)

(assert (=> b!195132 (= e!128327 (isStrictlySorted!352 (t!7343 (toList!1225 (map!2007 thiss!1248)))))))

(assert (= (and d!57221 (not res!92111)) b!195131))

(assert (= (and b!195131 res!92112) b!195132))

(assert (=> b!195132 m!222089))

(assert (=> d!56573 d!57221))

(declare-fun d!57223 () Bool)

(declare-fun res!92113 () Bool)

(declare-fun e!128328 () Bool)

(assert (=> d!57223 (=> res!92113 e!128328)))

(assert (=> d!57223 (= res!92113 (or ((_ is Nil!2423) lt!96725) ((_ is Nil!2423) (t!7343 lt!96725))))))

(assert (=> d!57223 (= (isStrictlySorted!352 lt!96725) e!128328)))

(declare-fun b!195133 () Bool)

(declare-fun e!128329 () Bool)

(assert (=> b!195133 (= e!128328 e!128329)))

(declare-fun res!92114 () Bool)

(assert (=> b!195133 (=> (not res!92114) (not e!128329))))

(assert (=> b!195133 (= res!92114 (bvslt (_1!1766 (h!3063 lt!96725)) (_1!1766 (h!3063 (t!7343 lt!96725)))))))

(declare-fun b!195134 () Bool)

(assert (=> b!195134 (= e!128329 (isStrictlySorted!352 (t!7343 lt!96725)))))

(assert (= (and d!57223 (not res!92113)) b!195133))

(assert (= (and b!195133 res!92114) b!195134))

(declare-fun m!222199 () Bool)

(assert (=> b!195134 m!222199))

(assert (=> d!56553 d!57223))

(declare-fun d!57225 () Bool)

(declare-fun res!92115 () Bool)

(declare-fun e!128330 () Bool)

(assert (=> d!57225 (=> res!92115 e!128330)))

(assert (=> d!57225 (= res!92115 (or ((_ is Nil!2423) (toList!1225 lt!96453)) ((_ is Nil!2423) (t!7343 (toList!1225 lt!96453)))))))

(assert (=> d!57225 (= (isStrictlySorted!352 (toList!1225 lt!96453)) e!128330)))

(declare-fun b!195135 () Bool)

(declare-fun e!128331 () Bool)

(assert (=> b!195135 (= e!128330 e!128331)))

(declare-fun res!92116 () Bool)

(assert (=> b!195135 (=> (not res!92116) (not e!128331))))

(assert (=> b!195135 (= res!92116 (bvslt (_1!1766 (h!3063 (toList!1225 lt!96453))) (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453))))))))

(declare-fun b!195136 () Bool)

(assert (=> b!195136 (= e!128331 (isStrictlySorted!352 (t!7343 (toList!1225 lt!96453))))))

(assert (= (and d!57225 (not res!92115)) b!195135))

(assert (= (and b!195135 res!92116) b!195136))

(assert (=> b!195136 m!221987))

(assert (=> d!56553 d!57225))

(assert (=> bm!19647 d!57077))

(assert (=> b!194424 d!56733))

(declare-fun d!57227 () Bool)

(assert (=> d!57227 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!97210 () Unit!5819)

(assert (=> d!57227 (= lt!97210 (choose!1075 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128332 () Bool)

(assert (=> d!57227 e!128332))

(declare-fun res!92117 () Bool)

(assert (=> d!57227 (=> (not res!92117) (not e!128332))))

(assert (=> d!57227 (= res!92117 (isStrictlySorted!352 (toList!1225 lt!96632)))))

(assert (=> d!57227 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000) lt!97210)))

(declare-fun b!195137 () Bool)

(assert (=> b!195137 (= e!128332 (containsKey!247 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57227 res!92117) b!195137))

(assert (=> d!57227 m!220629))

(assert (=> d!57227 m!220629))

(assert (=> d!57227 m!220631))

(declare-fun m!222201 () Bool)

(assert (=> d!57227 m!222201))

(assert (=> d!57227 m!221177))

(assert (=> b!195137 m!220625))

(assert (=> b!194281 d!57227))

(assert (=> b!194281 d!57105))

(assert (=> b!194281 d!57107))

(assert (=> b!194395 d!56727))

(assert (=> b!194395 d!56729))

(assert (=> d!56631 d!56617))

(declare-fun d!57229 () Bool)

(declare-fun e!128334 () Bool)

(assert (=> d!57229 e!128334))

(declare-fun res!92118 () Bool)

(assert (=> d!57229 (=> res!92118 e!128334)))

(declare-fun lt!97213 () Bool)

(assert (=> d!57229 (= res!92118 (not lt!97213))))

(declare-fun lt!97214 () Bool)

(assert (=> d!57229 (= lt!97213 lt!97214)))

(declare-fun lt!97212 () Unit!5819)

(declare-fun e!128333 () Unit!5819)

(assert (=> d!57229 (= lt!97212 e!128333)))

(declare-fun c!35326 () Bool)

(assert (=> d!57229 (= c!35326 lt!97214)))

(assert (=> d!57229 (= lt!97214 (containsKey!247 (toList!1225 lt!96627) lt!96640))))

(assert (=> d!57229 (= (contains!1356 lt!96627 lt!96640) lt!97213)))

(declare-fun b!195138 () Bool)

(declare-fun lt!97211 () Unit!5819)

(assert (=> b!195138 (= e!128333 lt!97211)))

(assert (=> b!195138 (= lt!97211 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96627) lt!96640))))

(assert (=> b!195138 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96627) lt!96640))))

(declare-fun b!195139 () Bool)

(declare-fun Unit!5878 () Unit!5819)

(assert (=> b!195139 (= e!128333 Unit!5878)))

(declare-fun b!195140 () Bool)

(assert (=> b!195140 (= e!128334 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96627) lt!96640)))))

(assert (= (and d!57229 c!35326) b!195138))

(assert (= (and d!57229 (not c!35326)) b!195139))

(assert (= (and d!57229 (not res!92118)) b!195140))

(declare-fun m!222203 () Bool)

(assert (=> d!57229 m!222203))

(declare-fun m!222205 () Bool)

(assert (=> b!195138 m!222205))

(assert (=> b!195138 m!220809))

(assert (=> b!195138 m!220809))

(declare-fun m!222207 () Bool)

(assert (=> b!195138 m!222207))

(assert (=> b!195140 m!220809))

(assert (=> b!195140 m!220809))

(assert (=> b!195140 m!222207))

(assert (=> d!56631 d!57229))

(declare-fun d!57231 () Bool)

(assert (=> d!57231 (= (apply!188 (+!317 lt!96627 (tuple2!3511 lt!96642 (zeroValue!3800 thiss!1248))) lt!96640) (apply!188 lt!96627 lt!96640))))

(assert (=> d!57231 true))

(declare-fun _$34!1095 () Unit!5819)

(assert (=> d!57231 (= (choose!1076 lt!96627 lt!96642 (zeroValue!3800 thiss!1248) lt!96640) _$34!1095)))

(declare-fun bs!7769 () Bool)

(assert (= bs!7769 d!57231))

(assert (=> bs!7769 m!220305))

(assert (=> bs!7769 m!220305))

(assert (=> bs!7769 m!220307))

(assert (=> bs!7769 m!220315))

(assert (=> d!56631 d!57231))

(assert (=> d!56631 d!56623))

(assert (=> d!56631 d!56625))

(declare-fun d!57233 () Bool)

(assert (=> d!57233 (= (apply!188 lt!96817 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) (get!2232 (getValueByKey!243 (toList!1225 lt!96817) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000))))))

(declare-fun bs!7770 () Bool)

(assert (= bs!7770 d!57233))

(assert (=> bs!7770 m!220529))

(assert (=> bs!7770 m!221369))

(assert (=> bs!7770 m!221369))

(declare-fun m!222209 () Bool)

(assert (=> bs!7770 m!222209))

(assert (=> b!194329 d!57233))

(declare-fun d!57235 () Bool)

(declare-fun c!35327 () Bool)

(assert (=> d!57235 (= c!35327 ((_ is ValueCellFull!1901) (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun e!128335 () V!5633)

(assert (=> d!57235 (= (get!2231 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128335)))

(declare-fun b!195141 () Bool)

(assert (=> b!195141 (= e!128335 (get!2233 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195142 () Bool)

(assert (=> b!195142 (= e!128335 (get!2234 (select (arr!3863 (_values!3942 lt!96455)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 lt!96455) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57235 c!35327) b!195141))

(assert (= (and d!57235 (not c!35327)) b!195142))

(assert (=> b!195141 m!220721))

(assert (=> b!195141 m!220723))

(declare-fun m!222211 () Bool)

(assert (=> b!195141 m!222211))

(assert (=> b!195142 m!220721))

(assert (=> b!195142 m!220723))

(declare-fun m!222213 () Bool)

(assert (=> b!195142 m!222213))

(assert (=> b!194329 d!57235))

(declare-fun d!57237 () Bool)

(declare-fun e!128341 () Bool)

(assert (=> d!57237 e!128341))

(declare-fun res!92119 () Bool)

(assert (=> d!57237 (=> (not res!92119) (not e!128341))))

(declare-fun lt!97220 () ListLongMap!2419)

(assert (=> d!57237 (= res!92119 (not (contains!1356 lt!97220 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!128337 () ListLongMap!2419)

(assert (=> d!57237 (= lt!97220 e!128337)))

(declare-fun c!35330 () Bool)

(assert (=> d!57237 (= c!35330 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!57237 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57237 (= (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)) lt!97220)))

(declare-fun b!195143 () Bool)

(declare-fun lt!97215 () Unit!5819)

(declare-fun lt!97216 () Unit!5819)

(assert (=> b!195143 (= lt!97215 lt!97216)))

(declare-fun lt!97219 () V!5633)

(declare-fun lt!97217 () (_ BitVec 64))

(declare-fun lt!97218 () (_ BitVec 64))

(declare-fun lt!97221 () ListLongMap!2419)

(assert (=> b!195143 (not (contains!1356 (+!317 lt!97221 (tuple2!3511 lt!97218 lt!97219)) lt!97217))))

(assert (=> b!195143 (= lt!97216 (addStillNotContains!98 lt!97221 lt!97218 lt!97219 lt!97217))))

(assert (=> b!195143 (= lt!97217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!195143 (= lt!97219 (get!2231 (select (arr!3863 lt!96452) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195143 (= lt!97218 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!19715 () ListLongMap!2419)

(assert (=> b!195143 (= lt!97221 call!19715)))

(declare-fun e!128342 () ListLongMap!2419)

(assert (=> b!195143 (= e!128342 (+!317 call!19715 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!2231 (select (arr!3863 lt!96452) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!195144 () Bool)

(declare-fun e!128336 () Bool)

(declare-fun e!128338 () Bool)

(assert (=> b!195144 (= e!128336 e!128338)))

(declare-fun c!35331 () Bool)

(assert (=> b!195144 (= c!35331 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!195145 () Bool)

(assert (=> b!195145 (= e!128338 (isEmpty!491 lt!97220))))

(declare-fun b!195146 () Bool)

(declare-fun e!128340 () Bool)

(assert (=> b!195146 (= e!128340 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195146 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!19712 () Bool)

(assert (=> bm!19712 (= call!19715 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248)))))

(declare-fun b!195147 () Bool)

(assert (=> b!195147 (= e!128341 e!128336)))

(declare-fun c!35328 () Bool)

(assert (=> b!195147 (= c!35328 e!128340)))

(declare-fun res!92121 () Bool)

(assert (=> b!195147 (=> (not res!92121) (not e!128340))))

(assert (=> b!195147 (= res!92121 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!195148 () Bool)

(assert (=> b!195148 (= e!128337 (ListLongMap!2420 Nil!2423))))

(declare-fun b!195149 () Bool)

(assert (=> b!195149 (= e!128342 call!19715)))

(declare-fun b!195150 () Bool)

(assert (=> b!195150 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!195150 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4188 lt!96452)))))

(declare-fun e!128339 () Bool)

(assert (=> b!195150 (= e!128339 (= (apply!188 lt!97220 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!2231 (select (arr!3863 lt!96452) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!195151 () Bool)

(assert (=> b!195151 (= e!128336 e!128339)))

(assert (=> b!195151 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!92122 () Bool)

(assert (=> b!195151 (= res!92122 (contains!1356 lt!97220 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195151 (=> (not res!92122) (not e!128339))))

(declare-fun b!195152 () Bool)

(declare-fun res!92120 () Bool)

(assert (=> b!195152 (=> (not res!92120) (not e!128341))))

(assert (=> b!195152 (= res!92120 (not (contains!1356 lt!97220 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195153 () Bool)

(assert (=> b!195153 (= e!128337 e!128342)))

(declare-fun c!35329 () Bool)

(assert (=> b!195153 (= c!35329 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195154 () Bool)

(assert (=> b!195154 (= e!128338 (= lt!97220 (getCurrentListMapNoExtraKeys!209 (_keys!5952 thiss!1248) lt!96452 (mask!9221 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3959 thiss!1248))))))

(assert (= (and d!57237 c!35330) b!195148))

(assert (= (and d!57237 (not c!35330)) b!195153))

(assert (= (and b!195153 c!35329) b!195143))

(assert (= (and b!195153 (not c!35329)) b!195149))

(assert (= (or b!195143 b!195149) bm!19712))

(assert (= (and d!57237 res!92119) b!195152))

(assert (= (and b!195152 res!92120) b!195147))

(assert (= (and b!195147 res!92121) b!195146))

(assert (= (and b!195147 c!35328) b!195151))

(assert (= (and b!195147 (not c!35328)) b!195144))

(assert (= (and b!195151 res!92122) b!195150))

(assert (= (and b!195144 c!35331) b!195154))

(assert (= (and b!195144 (not c!35331)) b!195145))

(declare-fun b_lambda!7503 () Bool)

(assert (=> (not b_lambda!7503) (not b!195143)))

(assert (=> b!195143 t!7347))

(declare-fun b_and!11439 () Bool)

(assert (= b_and!11437 (and (=> t!7347 result!4931) b_and!11439)))

(declare-fun b_lambda!7505 () Bool)

(assert (=> (not b_lambda!7505) (not b!195150)))

(assert (=> b!195150 t!7347))

(declare-fun b_and!11441 () Bool)

(assert (= b_and!11439 (and (=> t!7347 result!4931) b_and!11441)))

(assert (=> b!195146 m!221293))

(assert (=> b!195146 m!221293))

(assert (=> b!195146 m!221297))

(assert (=> b!195153 m!221293))

(assert (=> b!195153 m!221293))

(assert (=> b!195153 m!221297))

(declare-fun m!222215 () Bool)

(assert (=> b!195145 m!222215))

(assert (=> b!195151 m!221293))

(assert (=> b!195151 m!221293))

(declare-fun m!222217 () Bool)

(assert (=> b!195151 m!222217))

(declare-fun m!222219 () Bool)

(assert (=> b!195152 m!222219))

(declare-fun m!222221 () Bool)

(assert (=> bm!19712 m!222221))

(assert (=> b!195154 m!222221))

(declare-fun m!222223 () Bool)

(assert (=> b!195143 m!222223))

(assert (=> b!195143 m!220243))

(declare-fun m!222225 () Bool)

(assert (=> b!195143 m!222225))

(assert (=> b!195143 m!221293))

(declare-fun m!222227 () Bool)

(assert (=> b!195143 m!222227))

(assert (=> b!195143 m!220243))

(assert (=> b!195143 m!222223))

(declare-fun m!222229 () Bool)

(assert (=> b!195143 m!222229))

(declare-fun m!222231 () Bool)

(assert (=> b!195143 m!222231))

(declare-fun m!222233 () Bool)

(assert (=> b!195143 m!222233))

(assert (=> b!195143 m!222229))

(assert (=> b!195150 m!222223))

(assert (=> b!195150 m!220243))

(assert (=> b!195150 m!222225))

(assert (=> b!195150 m!221293))

(assert (=> b!195150 m!221293))

(declare-fun m!222235 () Bool)

(assert (=> b!195150 m!222235))

(assert (=> b!195150 m!220243))

(assert (=> b!195150 m!222223))

(declare-fun m!222237 () Bool)

(assert (=> d!57237 m!222237))

(assert (=> d!57237 m!220205))

(assert (=> bm!19641 d!57237))

(declare-fun d!57239 () Bool)

(declare-fun lt!97222 () Bool)

(assert (=> d!57239 (= lt!97222 (select (content!155 (toList!1225 lt!96918)) (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))

(declare-fun e!128343 () Bool)

(assert (=> d!57239 (= lt!97222 e!128343)))

(declare-fun res!92124 () Bool)

(assert (=> d!57239 (=> (not res!92124) (not e!128343))))

(assert (=> d!57239 (= res!92124 ((_ is Cons!2422) (toList!1225 lt!96918)))))

(assert (=> d!57239 (= (contains!1359 (toList!1225 lt!96918) (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) lt!97222)))

(declare-fun b!195155 () Bool)

(declare-fun e!128344 () Bool)

(assert (=> b!195155 (= e!128343 e!128344)))

(declare-fun res!92123 () Bool)

(assert (=> b!195155 (=> res!92123 e!128344)))

(assert (=> b!195155 (= res!92123 (= (h!3063 (toList!1225 lt!96918)) (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))

(declare-fun b!195156 () Bool)

(assert (=> b!195156 (= e!128344 (contains!1359 (t!7343 (toList!1225 lt!96918)) (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))

(assert (= (and d!57239 res!92124) b!195155))

(assert (= (and b!195155 (not res!92123)) b!195156))

(declare-fun m!222239 () Bool)

(assert (=> d!57239 m!222239))

(declare-fun m!222241 () Bool)

(assert (=> d!57239 m!222241))

(declare-fun m!222243 () Bool)

(assert (=> b!195156 m!222243))

(assert (=> b!194478 d!57239))

(assert (=> b!194390 d!57159))

(declare-fun d!57241 () Bool)

(declare-fun lt!97223 () Bool)

(assert (=> d!57241 (= lt!97223 (select (content!155 (toList!1225 lt!96708)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun e!128345 () Bool)

(assert (=> d!57241 (= lt!97223 e!128345)))

(declare-fun res!92126 () Bool)

(assert (=> d!57241 (=> (not res!92126) (not e!128345))))

(assert (=> d!57241 (= res!92126 ((_ is Cons!2422) (toList!1225 lt!96708)))))

(assert (=> d!57241 (= (contains!1359 (toList!1225 lt!96708) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97223)))

(declare-fun b!195157 () Bool)

(declare-fun e!128346 () Bool)

(assert (=> b!195157 (= e!128345 e!128346)))

(declare-fun res!92125 () Bool)

(assert (=> b!195157 (=> res!92125 e!128346)))

(assert (=> b!195157 (= res!92125 (= (h!3063 (toList!1225 lt!96708)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(declare-fun b!195158 () Bool)

(assert (=> b!195158 (= e!128346 (contains!1359 (t!7343 (toList!1225 lt!96708)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!57241 res!92126) b!195157))

(assert (= (and b!195157 (not res!92125)) b!195158))

(declare-fun m!222245 () Bool)

(assert (=> d!57241 m!222245))

(declare-fun m!222247 () Bool)

(assert (=> d!57241 m!222247))

(declare-fun m!222249 () Bool)

(assert (=> b!195158 m!222249))

(assert (=> b!194109 d!57241))

(declare-fun d!57243 () Bool)

(assert (=> d!57243 (= (apply!188 lt!96745 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2232 (getValueByKey!243 (toList!1225 lt!96745) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7771 () Bool)

(assert (= bs!7771 d!57243))

(assert (=> bs!7771 m!220231))

(assert (=> bs!7771 m!222049))

(assert (=> bs!7771 m!222049))

(declare-fun m!222251 () Bool)

(assert (=> bs!7771 m!222251))

(assert (=> b!194186 d!57243))

(assert (=> b!194186 d!56565))

(assert (=> d!56707 d!56689))

(assert (=> d!56707 d!56697))

(declare-fun d!57245 () Bool)

(assert (=> d!57245 (contains!1356 (+!317 lt!96617 (tuple2!3511 lt!96615 (zeroValue!3800 thiss!1248))) lt!96607)))

(assert (=> d!57245 true))

(declare-fun _$35!417 () Unit!5819)

(assert (=> d!57245 (= (choose!1077 lt!96617 lt!96615 (zeroValue!3800 thiss!1248) lt!96607) _$35!417)))

(declare-fun bs!7772 () Bool)

(assert (= bs!7772 d!57245))

(assert (=> bs!7772 m!220257))

(assert (=> bs!7772 m!220257))

(assert (=> bs!7772 m!220259))

(assert (=> d!56707 d!57245))

(declare-fun d!57247 () Bool)

(declare-fun e!128348 () Bool)

(assert (=> d!57247 e!128348))

(declare-fun res!92127 () Bool)

(assert (=> d!57247 (=> res!92127 e!128348)))

(declare-fun lt!97226 () Bool)

(assert (=> d!57247 (= res!92127 (not lt!97226))))

(declare-fun lt!97227 () Bool)

(assert (=> d!57247 (= lt!97226 lt!97227)))

(declare-fun lt!97225 () Unit!5819)

(declare-fun e!128347 () Unit!5819)

(assert (=> d!57247 (= lt!97225 e!128347)))

(declare-fun c!35332 () Bool)

(assert (=> d!57247 (= c!35332 lt!97227)))

(assert (=> d!57247 (= lt!97227 (containsKey!247 (toList!1225 lt!96617) lt!96607))))

(assert (=> d!57247 (= (contains!1356 lt!96617 lt!96607) lt!97226)))

(declare-fun b!195159 () Bool)

(declare-fun lt!97224 () Unit!5819)

(assert (=> b!195159 (= e!128347 lt!97224)))

(assert (=> b!195159 (= lt!97224 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96617) lt!96607))))

(assert (=> b!195159 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96617) lt!96607))))

(declare-fun b!195160 () Bool)

(declare-fun Unit!5879 () Unit!5819)

(assert (=> b!195160 (= e!128347 Unit!5879)))

(declare-fun b!195161 () Bool)

(assert (=> b!195161 (= e!128348 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96617) lt!96607)))))

(assert (= (and d!57247 c!35332) b!195159))

(assert (= (and d!57247 (not c!35332)) b!195160))

(assert (= (and d!57247 (not res!92127)) b!195161))

(declare-fun m!222253 () Bool)

(assert (=> d!57247 m!222253))

(declare-fun m!222255 () Bool)

(assert (=> b!195159 m!222255))

(declare-fun m!222257 () Bool)

(assert (=> b!195159 m!222257))

(assert (=> b!195159 m!222257))

(declare-fun m!222259 () Bool)

(assert (=> b!195159 m!222259))

(assert (=> b!195161 m!222257))

(assert (=> b!195161 m!222257))

(assert (=> b!195161 m!222259))

(assert (=> d!56707 d!57247))

(declare-fun d!57249 () Bool)

(declare-fun e!128349 () Bool)

(assert (=> d!57249 e!128349))

(declare-fun res!92128 () Bool)

(assert (=> d!57249 (=> (not res!92128) (not e!128349))))

(declare-fun lt!97228 () ListLongMap!2419)

(assert (=> d!57249 (= res!92128 (contains!1356 lt!97228 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97230 () List!2426)

(assert (=> d!57249 (= lt!97228 (ListLongMap!2420 lt!97230))))

(declare-fun lt!97231 () Unit!5819)

(declare-fun lt!97229 () Unit!5819)

(assert (=> d!57249 (= lt!97231 lt!97229)))

(assert (=> d!57249 (= (getValueByKey!243 lt!97230 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57249 (= lt!97229 (lemmaContainsTupThenGetReturnValue!133 lt!97230 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57249 (= lt!97230 (insertStrictlySorted!136 (toList!1225 call!19652) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57249 (= (+!317 call!19652 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) lt!97228)))

(declare-fun b!195162 () Bool)

(declare-fun res!92129 () Bool)

(assert (=> b!195162 (=> (not res!92129) (not e!128349))))

(assert (=> b!195162 (= res!92129 (= (getValueByKey!243 (toList!1225 lt!97228) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195163 () Bool)

(assert (=> b!195163 (= e!128349 (contains!1359 (toList!1225 lt!97228) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))

(assert (= (and d!57249 res!92128) b!195162))

(assert (= (and b!195162 res!92129) b!195163))

(declare-fun m!222261 () Bool)

(assert (=> d!57249 m!222261))

(declare-fun m!222263 () Bool)

(assert (=> d!57249 m!222263))

(declare-fun m!222265 () Bool)

(assert (=> d!57249 m!222265))

(declare-fun m!222267 () Bool)

(assert (=> d!57249 m!222267))

(declare-fun m!222269 () Bool)

(assert (=> b!195162 m!222269))

(declare-fun m!222271 () Bool)

(assert (=> b!195163 m!222271))

(assert (=> b!194299 d!57249))

(declare-fun d!57251 () Bool)

(declare-fun lt!97232 () Bool)

(assert (=> d!57251 (= lt!97232 (select (content!155 lt!96673) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun e!128350 () Bool)

(assert (=> d!57251 (= lt!97232 e!128350)))

(declare-fun res!92131 () Bool)

(assert (=> d!57251 (=> (not res!92131) (not e!128350))))

(assert (=> d!57251 (= res!92131 ((_ is Cons!2422) lt!96673))))

(assert (=> d!57251 (= (contains!1359 lt!96673 (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))) lt!97232)))

(declare-fun b!195164 () Bool)

(declare-fun e!128351 () Bool)

(assert (=> b!195164 (= e!128350 e!128351)))

(declare-fun res!92130 () Bool)

(assert (=> b!195164 (=> res!92130 e!128351)))

(assert (=> b!195164 (= res!92130 (= (h!3063 lt!96673) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(declare-fun b!195165 () Bool)

(assert (=> b!195165 (= e!128351 (contains!1359 (t!7343 lt!96673) (tuple2!3511 (_1!1766 lt!96460) (_2!1766 lt!96460))))))

(assert (= (and d!57251 res!92131) b!195164))

(assert (= (and b!195164 (not res!92130)) b!195165))

(declare-fun m!222273 () Bool)

(assert (=> d!57251 m!222273))

(declare-fun m!222275 () Bool)

(assert (=> d!57251 m!222275))

(declare-fun m!222277 () Bool)

(assert (=> b!195165 m!222277))

(assert (=> b!194241 d!57251))

(assert (=> d!56605 d!57217))

(assert (=> d!56551 d!56549))

(declare-fun d!57253 () Bool)

(assert (=> d!57253 (= (getValueByKey!243 lt!96665 (_1!1766 lt!96460)) (Some!248 (_2!1766 lt!96460)))))

(assert (=> d!57253 true))

(declare-fun _$22!540 () Unit!5819)

(assert (=> d!57253 (= (choose!1074 lt!96665 (_1!1766 lt!96460) (_2!1766 lt!96460)) _$22!540)))

(declare-fun bs!7773 () Bool)

(assert (= bs!7773 d!57253))

(assert (=> bs!7773 m!220355))

(assert (=> d!56551 d!57253))

(declare-fun d!57255 () Bool)

(declare-fun res!92132 () Bool)

(declare-fun e!128352 () Bool)

(assert (=> d!57255 (=> res!92132 e!128352)))

(assert (=> d!57255 (= res!92132 (or ((_ is Nil!2423) lt!96665) ((_ is Nil!2423) (t!7343 lt!96665))))))

(assert (=> d!57255 (= (isStrictlySorted!352 lt!96665) e!128352)))

(declare-fun b!195166 () Bool)

(declare-fun e!128353 () Bool)

(assert (=> b!195166 (= e!128352 e!128353)))

(declare-fun res!92133 () Bool)

(assert (=> b!195166 (=> (not res!92133) (not e!128353))))

(assert (=> b!195166 (= res!92133 (bvslt (_1!1766 (h!3063 lt!96665)) (_1!1766 (h!3063 (t!7343 lt!96665)))))))

(declare-fun b!195167 () Bool)

(assert (=> b!195167 (= e!128353 (isStrictlySorted!352 (t!7343 lt!96665)))))

(assert (= (and d!57255 (not res!92132)) b!195166))

(assert (= (and b!195166 res!92133) b!195167))

(declare-fun m!222279 () Bool)

(assert (=> b!195167 m!222279))

(assert (=> d!56551 d!57255))

(declare-fun b!195168 () Bool)

(declare-fun e!128356 () Bool)

(declare-fun e!128355 () Bool)

(assert (=> b!195168 (= e!128356 e!128355)))

(declare-fun c!35333 () Bool)

(assert (=> b!195168 (= c!35333 (validKeyInArray!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!195169 () Bool)

(declare-fun e!128354 () Bool)

(declare-fun call!19716 () Bool)

(assert (=> b!195169 (= e!128354 call!19716)))

(declare-fun b!195170 () Bool)

(assert (=> b!195170 (= e!128355 e!128354)))

(declare-fun lt!97234 () (_ BitVec 64))

(assert (=> b!195170 (= lt!97234 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!97235 () Unit!5819)

(assert (=> b!195170 (= lt!97235 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5952 thiss!1248) lt!97234 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!195170 (arrayContainsKey!0 (_keys!5952 thiss!1248) lt!97234 #b00000000000000000000000000000000)))

(declare-fun lt!97233 () Unit!5819)

(assert (=> b!195170 (= lt!97233 lt!97235)))

(declare-fun res!92135 () Bool)

(assert (=> b!195170 (= res!92135 (= (seekEntryOrOpen!0 (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) (Found!695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195170 (=> (not res!92135) (not e!128354))))

(declare-fun b!195171 () Bool)

(assert (=> b!195171 (= e!128355 call!19716)))

(declare-fun bm!19713 () Bool)

(assert (=> bm!19713 (= call!19716 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun d!57257 () Bool)

(declare-fun res!92134 () Bool)

(assert (=> d!57257 (=> res!92134 e!128356)))

(assert (=> d!57257 (= res!92134 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> d!57257 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) e!128356)))

(assert (= (and d!57257 (not res!92134)) b!195168))

(assert (= (and b!195168 c!35333) b!195170))

(assert (= (and b!195168 (not c!35333)) b!195171))

(assert (= (and b!195170 res!92135) b!195169))

(assert (= (or b!195169 b!195171) bm!19713))

(assert (=> b!195168 m!221293))

(assert (=> b!195168 m!221293))

(assert (=> b!195168 m!221297))

(assert (=> b!195170 m!221293))

(declare-fun m!222281 () Bool)

(assert (=> b!195170 m!222281))

(declare-fun m!222283 () Bool)

(assert (=> b!195170 m!222283))

(assert (=> b!195170 m!221293))

(declare-fun m!222285 () Bool)

(assert (=> b!195170 m!222285))

(declare-fun m!222287 () Bool)

(assert (=> bm!19713 m!222287))

(assert (=> bm!19642 d!57257))

(declare-fun b!195174 () Bool)

(declare-fun e!128358 () Option!249)

(assert (=> b!195174 (= e!128358 (getValueByKey!243 (t!7343 (t!7343 (toList!1225 lt!96453))) key!828))))

(declare-fun d!57259 () Bool)

(declare-fun c!35334 () Bool)

(assert (=> d!57259 (= c!35334 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) key!828)))))

(declare-fun e!128357 () Option!249)

(assert (=> d!57259 (= (getValueByKey!243 (t!7343 (toList!1225 lt!96453)) key!828) e!128357)))

(declare-fun b!195172 () Bool)

(assert (=> b!195172 (= e!128357 (Some!248 (_2!1766 (h!3063 (t!7343 (toList!1225 lt!96453))))))))

(declare-fun b!195173 () Bool)

(assert (=> b!195173 (= e!128357 e!128358)))

(declare-fun c!35335 () Bool)

(assert (=> b!195173 (= c!35335 (and ((_ is Cons!2422) (t!7343 (toList!1225 lt!96453))) (not (= (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96453)))) key!828))))))

(declare-fun b!195175 () Bool)

(assert (=> b!195175 (= e!128358 None!247)))

(assert (= (and d!57259 c!35334) b!195172))

(assert (= (and d!57259 (not c!35334)) b!195173))

(assert (= (and b!195173 c!35335) b!195174))

(assert (= (and b!195173 (not c!35335)) b!195175))

(declare-fun m!222289 () Bool)

(assert (=> b!195174 m!222289))

(assert (=> b!194259 d!57259))

(assert (=> b!194487 d!56539))

(declare-fun d!57261 () Bool)

(declare-fun res!92136 () Bool)

(declare-fun e!128359 () Bool)

(assert (=> d!57261 (=> res!92136 e!128359)))

(assert (=> d!57261 (= res!92136 (and ((_ is Cons!2422) (toList!1225 lt!96610)) (= (_1!1766 (h!3063 (toList!1225 lt!96610))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57261 (= (containsKey!247 (toList!1225 lt!96610) #b0000000000000000000000000000000000000000000000000000000000000000) e!128359)))

(declare-fun b!195176 () Bool)

(declare-fun e!128360 () Bool)

(assert (=> b!195176 (= e!128359 e!128360)))

(declare-fun res!92137 () Bool)

(assert (=> b!195176 (=> (not res!92137) (not e!128360))))

(assert (=> b!195176 (= res!92137 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96610))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96610))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2422) (toList!1225 lt!96610)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96610))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195177 () Bool)

(assert (=> b!195177 (= e!128360 (containsKey!247 (t!7343 (toList!1225 lt!96610)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57261 (not res!92136)) b!195176))

(assert (= (and b!195176 res!92137) b!195177))

(declare-fun m!222291 () Bool)

(assert (=> b!195177 m!222291))

(assert (=> d!56679 d!57261))

(declare-fun d!57263 () Bool)

(assert (=> d!57263 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!4250 (getValueByKey!243 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56647 d!57263))

(assert (=> d!56647 d!57107))

(assert (=> b!194306 d!56539))

(declare-fun d!57265 () Bool)

(assert (=> d!57265 (= (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96454) key!828)) (not ((_ is Some!248) (getValueByKey!243 (toList!1225 lt!96454) key!828))))))

(assert (=> d!56675 d!57265))

(assert (=> d!56557 d!56491))

(declare-fun d!57267 () Bool)

(declare-fun res!92138 () Bool)

(declare-fun e!128361 () Bool)

(assert (=> d!57267 (=> res!92138 e!128361)))

(assert (=> d!57267 (= res!92138 (= (select (arr!3862 (_keys!5952 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!828))))

(assert (=> d!57267 (= (arrayContainsKey!0 (_keys!5952 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!128361)))

(declare-fun b!195178 () Bool)

(declare-fun e!128362 () Bool)

(assert (=> b!195178 (= e!128361 e!128362)))

(declare-fun res!92139 () Bool)

(assert (=> b!195178 (=> (not res!92139) (not e!128362))))

(assert (=> b!195178 (= res!92139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun b!195179 () Bool)

(assert (=> b!195179 (= e!128362 (arrayContainsKey!0 (_keys!5952 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!57267 (not res!92138)) b!195178))

(assert (= (and b!195178 res!92139) b!195179))

(assert (=> d!57267 m!221293))

(declare-fun m!222293 () Bool)

(assert (=> b!195179 m!222293))

(assert (=> b!194347 d!57267))

(declare-fun d!57269 () Bool)

(declare-fun e!128363 () Bool)

(assert (=> d!57269 e!128363))

(declare-fun res!92140 () Bool)

(assert (=> d!57269 (=> (not res!92140) (not e!128363))))

(declare-fun lt!97236 () ListLongMap!2419)

(assert (=> d!57269 (= res!92140 (contains!1356 lt!97236 (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!97238 () List!2426)

(assert (=> d!57269 (= lt!97236 (ListLongMap!2420 lt!97238))))

(declare-fun lt!97239 () Unit!5819)

(declare-fun lt!97237 () Unit!5819)

(assert (=> d!57269 (= lt!97239 lt!97237)))

(assert (=> d!57269 (= (getValueByKey!243 lt!97238 (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!248 (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57269 (= lt!97237 (lemmaContainsTupThenGetReturnValue!133 lt!97238 (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57269 (= lt!97238 (insertStrictlySorted!136 (toList!1225 call!19631) (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57269 (= (+!317 call!19631 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!97236)))

(declare-fun b!195180 () Bool)

(declare-fun res!92141 () Bool)

(assert (=> b!195180 (=> (not res!92141) (not e!128363))))

(assert (=> b!195180 (= res!92141 (= (getValueByKey!243 (toList!1225 lt!97236) (_1!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!248 (_2!1766 (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!195181 () Bool)

(assert (=> b!195181 (= e!128363 (contains!1359 (toList!1225 lt!97236) (tuple2!3511 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000) (get!2231 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!57269 res!92140) b!195180))

(assert (= (and b!195180 res!92141) b!195181))

(declare-fun m!222295 () Bool)

(assert (=> d!57269 m!222295))

(declare-fun m!222297 () Bool)

(assert (=> d!57269 m!222297))

(declare-fun m!222299 () Bool)

(assert (=> d!57269 m!222299))

(declare-fun m!222301 () Bool)

(assert (=> d!57269 m!222301))

(declare-fun m!222303 () Bool)

(assert (=> b!195180 m!222303))

(declare-fun m!222305 () Bool)

(assert (=> b!195181 m!222305))

(assert (=> b!194179 d!57269))

(declare-fun d!57271 () Bool)

(declare-fun e!128365 () Bool)

(assert (=> d!57271 e!128365))

(declare-fun res!92142 () Bool)

(assert (=> d!57271 (=> res!92142 e!128365)))

(declare-fun lt!97242 () Bool)

(assert (=> d!57271 (= res!92142 (not lt!97242))))

(declare-fun lt!97243 () Bool)

(assert (=> d!57271 (= lt!97242 lt!97243)))

(declare-fun lt!97241 () Unit!5819)

(declare-fun e!128364 () Unit!5819)

(assert (=> d!57271 (= lt!97241 e!128364)))

(declare-fun c!35336 () Bool)

(assert (=> d!57271 (= c!35336 lt!97243)))

(assert (=> d!57271 (= lt!97243 (containsKey!247 (toList!1225 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744))) lt!96742))))

(assert (=> d!57271 (= (contains!1356 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744)) lt!96742) lt!97242)))

(declare-fun b!195182 () Bool)

(declare-fun lt!97240 () Unit!5819)

(assert (=> b!195182 (= e!128364 lt!97240)))

(assert (=> b!195182 (= lt!97240 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744))) lt!96742))))

(assert (=> b!195182 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744))) lt!96742))))

(declare-fun b!195183 () Bool)

(declare-fun Unit!5880 () Unit!5819)

(assert (=> b!195183 (= e!128364 Unit!5880)))

(declare-fun b!195184 () Bool)

(assert (=> b!195184 (= e!128365 (isDefined!197 (getValueByKey!243 (toList!1225 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744))) lt!96742)))))

(assert (= (and d!57271 c!35336) b!195182))

(assert (= (and d!57271 (not c!35336)) b!195183))

(assert (= (and d!57271 (not res!92142)) b!195184))

(declare-fun m!222307 () Bool)

(assert (=> d!57271 m!222307))

(declare-fun m!222309 () Bool)

(assert (=> b!195182 m!222309))

(declare-fun m!222311 () Bool)

(assert (=> b!195182 m!222311))

(assert (=> b!195182 m!222311))

(declare-fun m!222313 () Bool)

(assert (=> b!195182 m!222313))

(assert (=> b!195184 m!222311))

(assert (=> b!195184 m!222311))

(assert (=> b!195184 m!222313))

(assert (=> b!194179 d!57271))

(declare-fun d!57273 () Bool)

(declare-fun e!128366 () Bool)

(assert (=> d!57273 e!128366))

(declare-fun res!92143 () Bool)

(assert (=> d!57273 (=> (not res!92143) (not e!128366))))

(declare-fun lt!97244 () ListLongMap!2419)

(assert (=> d!57273 (= res!92143 (contains!1356 lt!97244 (_1!1766 (tuple2!3511 lt!96743 lt!96744))))))

(declare-fun lt!97246 () List!2426)

(assert (=> d!57273 (= lt!97244 (ListLongMap!2420 lt!97246))))

(declare-fun lt!97247 () Unit!5819)

(declare-fun lt!97245 () Unit!5819)

(assert (=> d!57273 (= lt!97247 lt!97245)))

(assert (=> d!57273 (= (getValueByKey!243 lt!97246 (_1!1766 (tuple2!3511 lt!96743 lt!96744))) (Some!248 (_2!1766 (tuple2!3511 lt!96743 lt!96744))))))

(assert (=> d!57273 (= lt!97245 (lemmaContainsTupThenGetReturnValue!133 lt!97246 (_1!1766 (tuple2!3511 lt!96743 lt!96744)) (_2!1766 (tuple2!3511 lt!96743 lt!96744))))))

(assert (=> d!57273 (= lt!97246 (insertStrictlySorted!136 (toList!1225 lt!96746) (_1!1766 (tuple2!3511 lt!96743 lt!96744)) (_2!1766 (tuple2!3511 lt!96743 lt!96744))))))

(assert (=> d!57273 (= (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744)) lt!97244)))

(declare-fun b!195185 () Bool)

(declare-fun res!92144 () Bool)

(assert (=> b!195185 (=> (not res!92144) (not e!128366))))

(assert (=> b!195185 (= res!92144 (= (getValueByKey!243 (toList!1225 lt!97244) (_1!1766 (tuple2!3511 lt!96743 lt!96744))) (Some!248 (_2!1766 (tuple2!3511 lt!96743 lt!96744)))))))

(declare-fun b!195186 () Bool)

(assert (=> b!195186 (= e!128366 (contains!1359 (toList!1225 lt!97244) (tuple2!3511 lt!96743 lt!96744)))))

(assert (= (and d!57273 res!92143) b!195185))

(assert (= (and b!195185 res!92144) b!195186))

(declare-fun m!222315 () Bool)

(assert (=> d!57273 m!222315))

(declare-fun m!222317 () Bool)

(assert (=> d!57273 m!222317))

(declare-fun m!222319 () Bool)

(assert (=> d!57273 m!222319))

(declare-fun m!222321 () Bool)

(assert (=> d!57273 m!222321))

(declare-fun m!222323 () Bool)

(assert (=> b!195185 m!222323))

(declare-fun m!222325 () Bool)

(assert (=> b!195186 m!222325))

(assert (=> b!194179 d!57273))

(declare-fun d!57275 () Bool)

(assert (=> d!57275 (not (contains!1356 (+!317 lt!96746 (tuple2!3511 lt!96743 lt!96744)) lt!96742))))

(declare-fun lt!97248 () Unit!5819)

(assert (=> d!57275 (= lt!97248 (choose!1078 lt!96746 lt!96743 lt!96744 lt!96742))))

(declare-fun e!128367 () Bool)

(assert (=> d!57275 e!128367))

(declare-fun res!92145 () Bool)

(assert (=> d!57275 (=> (not res!92145) (not e!128367))))

(assert (=> d!57275 (= res!92145 (not (contains!1356 lt!96746 lt!96742)))))

(assert (=> d!57275 (= (addStillNotContains!98 lt!96746 lt!96743 lt!96744 lt!96742) lt!97248)))

(declare-fun b!195187 () Bool)

(assert (=> b!195187 (= e!128367 (not (= lt!96743 lt!96742)))))

(assert (= (and d!57275 res!92145) b!195187))

(assert (=> d!57275 m!220513))

(assert (=> d!57275 m!220513))

(assert (=> d!57275 m!220515))

(declare-fun m!222327 () Bool)

(assert (=> d!57275 m!222327))

(declare-fun m!222329 () Bool)

(assert (=> d!57275 m!222329))

(assert (=> b!194179 d!57275))

(assert (=> b!194179 d!56565))

(declare-fun b!195188 () Bool)

(declare-fun lt!97249 () SeekEntryResult!695)

(assert (=> b!195188 (and (bvsge (index!4952 lt!97249) #b00000000000000000000000000000000) (bvslt (index!4952 lt!97249) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!92146 () Bool)

(assert (=> b!195188 (= res!92146 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!97249)) key!828))))

(declare-fun e!128368 () Bool)

(assert (=> b!195188 (=> res!92146 e!128368)))

(declare-fun e!128371 () Bool)

(assert (=> b!195188 (= e!128371 e!128368)))

(declare-fun b!195189 () Bool)

(assert (=> b!195189 (and (bvsge (index!4952 lt!97249) #b00000000000000000000000000000000) (bvslt (index!4952 lt!97249) (size!4187 (_keys!5952 thiss!1248))))))

(assert (=> b!195189 (= e!128368 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!97249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!195190 () Bool)

(declare-fun e!128370 () Bool)

(assert (=> b!195190 (= e!128370 (bvsge (x!20690 lt!97249) #b01111111111111111111111111111110))))

(declare-fun b!195191 () Bool)

(assert (=> b!195191 (= e!128370 e!128371)))

(declare-fun res!92147 () Bool)

(assert (=> b!195191 (= res!92147 (and ((_ is Intermediate!695) lt!97249) (not (undefined!1507 lt!97249)) (bvslt (x!20690 lt!97249) #b01111111111111111111111111111110) (bvsge (x!20690 lt!97249) #b00000000000000000000000000000000) (bvsge (x!20690 lt!97249) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!195191 (=> (not res!92147) (not e!128371))))

(declare-fun b!195192 () Bool)

(assert (=> b!195192 (and (bvsge (index!4952 lt!97249) #b00000000000000000000000000000000) (bvslt (index!4952 lt!97249) (size!4187 (_keys!5952 thiss!1248))))))

(declare-fun res!92148 () Bool)

(assert (=> b!195192 (= res!92148 (= (select (arr!3862 (_keys!5952 thiss!1248)) (index!4952 lt!97249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195192 (=> res!92148 e!128368)))

(declare-fun b!195193 () Bool)

(declare-fun e!128369 () SeekEntryResult!695)

(declare-fun e!128372 () SeekEntryResult!695)

(assert (=> b!195193 (= e!128369 e!128372)))

(declare-fun c!35337 () Bool)

(declare-fun lt!97250 () (_ BitVec 64))

(assert (=> b!195193 (= c!35337 (or (= lt!97250 key!828) (= (bvadd lt!97250 lt!97250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195194 () Bool)

(assert (=> b!195194 (= e!128372 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9221 thiss!1248)) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)))))

(declare-fun d!57277 () Bool)

(assert (=> d!57277 e!128370))

(declare-fun c!35338 () Bool)

(assert (=> d!57277 (= c!35338 (and ((_ is Intermediate!695) lt!97249) (undefined!1507 lt!97249)))))

(assert (=> d!57277 (= lt!97249 e!128369)))

(declare-fun c!35339 () Bool)

(assert (=> d!57277 (= c!35339 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!57277 (= lt!97250 (select (arr!3862 (_keys!5952 thiss!1248)) (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248))))))

(assert (=> d!57277 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57277 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)) key!828 (_keys!5952 thiss!1248) (mask!9221 thiss!1248)) lt!97249)))

(declare-fun b!195195 () Bool)

(assert (=> b!195195 (= e!128372 (Intermediate!695 false (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!195196 () Bool)

(assert (=> b!195196 (= e!128369 (Intermediate!695 true (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!57277 c!35339) b!195196))

(assert (= (and d!57277 (not c!35339)) b!195193))

(assert (= (and b!195193 c!35337) b!195195))

(assert (= (and b!195193 (not c!35337)) b!195194))

(assert (= (and d!57277 c!35338) b!195190))

(assert (= (and d!57277 (not c!35338)) b!195191))

(assert (= (and b!195191 res!92147) b!195188))

(assert (= (and b!195188 (not res!92146)) b!195192))

(assert (= (and b!195192 (not res!92148)) b!195189))

(assert (=> d!57277 m!220919))

(declare-fun m!222331 () Bool)

(assert (=> d!57277 m!222331))

(assert (=> d!57277 m!220205))

(declare-fun m!222333 () Bool)

(assert (=> b!195189 m!222333))

(assert (=> b!195192 m!222333))

(assert (=> b!195194 m!220919))

(declare-fun m!222335 () Bool)

(assert (=> b!195194 m!222335))

(assert (=> b!195194 m!222335))

(declare-fun m!222337 () Bool)

(assert (=> b!195194 m!222337))

(assert (=> b!195188 m!222333))

(assert (=> b!194450 d!57277))

(declare-fun d!57279 () Bool)

(declare-fun lt!97251 () (_ BitVec 32))

(assert (=> d!57279 (and (bvsge lt!97251 #b00000000000000000000000000000000) (bvslt lt!97251 (bvadd (mask!9221 thiss!1248) #b00000000000000000000000000000001)))))

(assert (=> d!57279 (= lt!97251 (choose!52 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)))))

(assert (=> d!57279 (validMask!0 (mask!9221 thiss!1248))))

(assert (=> d!57279 (= (nextIndex!0 (toIndex!0 key!828 (mask!9221 thiss!1248)) #b00000000000000000000000000000000 (mask!9221 thiss!1248)) lt!97251)))

(declare-fun bs!7774 () Bool)

(assert (= bs!7774 d!57279))

(assert (=> bs!7774 m!220203))

(declare-fun m!222339 () Bool)

(assert (=> bs!7774 m!222339))

(assert (=> bs!7774 m!220205))

(assert (=> b!194450 d!57279))

(declare-fun b!195199 () Bool)

(declare-fun e!128374 () Option!249)

(assert (=> b!195199 (= e!128374 (getValueByKey!243 (t!7343 (toList!1225 lt!96918)) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun d!57281 () Bool)

(declare-fun c!35340 () Bool)

(assert (=> d!57281 (= c!35340 (and ((_ is Cons!2422) (toList!1225 lt!96918)) (= (_1!1766 (h!3063 (toList!1225 lt!96918))) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(declare-fun e!128373 () Option!249)

(assert (=> d!57281 (= (getValueByKey!243 (toList!1225 lt!96918) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) e!128373)))

(declare-fun b!195197 () Bool)

(assert (=> b!195197 (= e!128373 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96918)))))))

(declare-fun b!195198 () Bool)

(assert (=> b!195198 (= e!128373 e!128374)))

(declare-fun c!35341 () Bool)

(assert (=> b!195198 (= c!35341 (and ((_ is Cons!2422) (toList!1225 lt!96918)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96918))) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195200 () Bool)

(assert (=> b!195200 (= e!128374 None!247)))

(assert (= (and d!57281 c!35340) b!195197))

(assert (= (and d!57281 (not c!35340)) b!195198))

(assert (= (and b!195198 c!35341) b!195199))

(assert (= (and b!195198 (not c!35341)) b!195200))

(declare-fun m!222341 () Bool)

(assert (=> b!195199 m!222341))

(assert (=> b!194477 d!57281))

(declare-fun d!57283 () Bool)

(assert (=> d!57283 (= (get!2232 (getValueByKey!243 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!96618)) (v!4250 (getValueByKey!243 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!96618)))))

(assert (=> d!56691 d!57283))

(declare-fun e!128376 () Option!249)

(declare-fun b!195203 () Bool)

(assert (=> b!195203 (= e!128376 (getValueByKey!243 (t!7343 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))) lt!96618))))

(declare-fun c!35342 () Bool)

(declare-fun d!57285 () Bool)

(assert (=> d!57285 (= c!35342 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))) (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))) lt!96618)))))

(declare-fun e!128375 () Option!249)

(assert (=> d!57285 (= (getValueByKey!243 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))) lt!96618) e!128375)))

(declare-fun b!195201 () Bool)

(assert (=> b!195201 (= e!128375 (Some!248 (_2!1766 (h!3063 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))))))))

(declare-fun b!195202 () Bool)

(assert (=> b!195202 (= e!128375 e!128376)))

(declare-fun c!35343 () Bool)

(assert (=> b!195202 (= c!35343 (and ((_ is Cons!2422) (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248))))) (not (= (_1!1766 (h!3063 (toList!1225 (+!317 lt!96605 (tuple2!3511 lt!96620 (zeroValue!3800 thiss!1248)))))) lt!96618))))))

(declare-fun b!195204 () Bool)

(assert (=> b!195204 (= e!128376 None!247)))

(assert (= (and d!57285 c!35342) b!195201))

(assert (= (and d!57285 (not c!35342)) b!195202))

(assert (= (and b!195202 c!35343) b!195203))

(assert (= (and b!195202 (not c!35343)) b!195204))

(declare-fun m!222343 () Bool)

(assert (=> b!195203 m!222343))

(assert (=> d!56691 d!57285))

(assert (=> b!194264 d!56539))

(assert (=> b!194235 d!56811))

(assert (=> b!194235 d!56535))

(declare-fun d!57287 () Bool)

(assert (=> d!57287 (= (apply!188 lt!96795 (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000)) (get!2232 (getValueByKey!243 (toList!1225 lt!96795) (select (arr!3862 (_keys!5952 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7775 () Bool)

(assert (= bs!7775 d!57287))

(assert (=> bs!7775 m!220231))

(assert (=> bs!7775 m!221453))

(assert (=> bs!7775 m!221453))

(declare-fun m!222345 () Bool)

(assert (=> bs!7775 m!222345))

(assert (=> b!194298 d!57287))

(declare-fun c!35344 () Bool)

(declare-fun d!57289 () Bool)

(assert (=> d!57289 (= c!35344 ((_ is ValueCellFull!1901) (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!128377 () V!5633)

(assert (=> d!57289 (= (get!2231 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!128377)))

(declare-fun b!195205 () Bool)

(assert (=> b!195205 (= e!128377 (get!2233 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195206 () Bool)

(assert (=> b!195206 (= e!128377 (get!2234 (select (arr!3863 (array!8212 (store (arr!3863 (_values!3942 thiss!1248)) (index!4951 lt!96450) (ValueCellFull!1901 v!309)) (size!4188 (_values!3942 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!57289 c!35344) b!195205))

(assert (= (and d!57289 (not c!35344)) b!195206))

(assert (=> b!195205 m!220661))

(assert (=> b!195205 m!220243))

(declare-fun m!222347 () Bool)

(assert (=> b!195205 m!222347))

(assert (=> b!195206 m!220661))

(assert (=> b!195206 m!220243))

(declare-fun m!222349 () Bool)

(assert (=> b!195206 m!222349))

(assert (=> b!194298 d!57289))

(declare-fun b!195209 () Bool)

(declare-fun e!128379 () Option!249)

(assert (=> b!195209 (= e!128379 (getValueByKey!243 (t!7343 (toList!1225 lt!96708)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun d!57291 () Bool)

(declare-fun c!35345 () Bool)

(assert (=> d!57291 (= c!35345 (and ((_ is Cons!2422) (toList!1225 lt!96708)) (= (_1!1766 (h!3063 (toList!1225 lt!96708))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128378 () Option!249)

(assert (=> d!57291 (= (getValueByKey!243 (toList!1225 lt!96708) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128378)))

(declare-fun b!195207 () Bool)

(assert (=> b!195207 (= e!128378 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96708)))))))

(declare-fun b!195208 () Bool)

(assert (=> b!195208 (= e!128378 e!128379)))

(declare-fun c!35346 () Bool)

(assert (=> b!195208 (= c!35346 (and ((_ is Cons!2422) (toList!1225 lt!96708)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96708))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195210 () Bool)

(assert (=> b!195210 (= e!128379 None!247)))

(assert (= (and d!57291 c!35345) b!195207))

(assert (= (and d!57291 (not c!35345)) b!195208))

(assert (= (and b!195208 c!35346) b!195209))

(assert (= (and b!195208 (not c!35346)) b!195210))

(declare-fun m!222351 () Bool)

(assert (=> b!195209 m!222351))

(assert (=> b!194108 d!57291))

(declare-fun d!57293 () Bool)

(declare-fun res!92149 () Bool)

(declare-fun e!128380 () Bool)

(assert (=> d!57293 (=> res!92149 e!128380)))

(assert (=> d!57293 (= res!92149 (and ((_ is Cons!2422) lt!96673) (= (_1!1766 (h!3063 lt!96673)) (_1!1766 lt!96460))))))

(assert (=> d!57293 (= (containsKey!247 lt!96673 (_1!1766 lt!96460)) e!128380)))

(declare-fun b!195211 () Bool)

(declare-fun e!128381 () Bool)

(assert (=> b!195211 (= e!128380 e!128381)))

(declare-fun res!92150 () Bool)

(assert (=> b!195211 (=> (not res!92150) (not e!128381))))

(assert (=> b!195211 (= res!92150 (and (or (not ((_ is Cons!2422) lt!96673)) (bvsle (_1!1766 (h!3063 lt!96673)) (_1!1766 lt!96460))) ((_ is Cons!2422) lt!96673) (bvslt (_1!1766 (h!3063 lt!96673)) (_1!1766 lt!96460))))))

(declare-fun b!195212 () Bool)

(assert (=> b!195212 (= e!128381 (containsKey!247 (t!7343 lt!96673) (_1!1766 lt!96460)))))

(assert (= (and d!57293 (not res!92149)) b!195211))

(assert (= (and b!195211 res!92150) b!195212))

(declare-fun m!222353 () Bool)

(assert (=> b!195212 m!222353))

(assert (=> b!194240 d!57293))

(declare-fun d!57295 () Bool)

(assert (=> d!57295 (= (get!2234 (select (arr!3863 (_values!3942 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!522 (defaultEntry!3959 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!194232 d!57295))

(declare-fun d!57297 () Bool)

(assert (=> d!57297 (arrayContainsKey!0 (_keys!5952 lt!96455) lt!96757 #b00000000000000000000000000000000)))

(declare-fun lt!97252 () Unit!5819)

(assert (=> d!57297 (= lt!97252 (choose!13 (_keys!5952 lt!96455) lt!96757 #b00000000000000000000000000000000))))

(assert (=> d!57297 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!57297 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5952 lt!96455) lt!96757 #b00000000000000000000000000000000) lt!97252)))

(declare-fun bs!7776 () Bool)

(assert (= bs!7776 d!57297))

(assert (=> bs!7776 m!220535))

(declare-fun m!222355 () Bool)

(assert (=> bs!7776 m!222355))

(assert (=> b!194225 d!57297))

(declare-fun d!57299 () Bool)

(declare-fun res!92151 () Bool)

(declare-fun e!128382 () Bool)

(assert (=> d!57299 (=> res!92151 e!128382)))

(assert (=> d!57299 (= res!92151 (= (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) lt!96757))))

(assert (=> d!57299 (= (arrayContainsKey!0 (_keys!5952 lt!96455) lt!96757 #b00000000000000000000000000000000) e!128382)))

(declare-fun b!195213 () Bool)

(declare-fun e!128383 () Bool)

(assert (=> b!195213 (= e!128382 e!128383)))

(declare-fun res!92152 () Bool)

(assert (=> b!195213 (=> (not res!92152) (not e!128383))))

(assert (=> b!195213 (= res!92152 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4187 (_keys!5952 lt!96455))))))

(declare-fun b!195214 () Bool)

(assert (=> b!195214 (= e!128383 (arrayContainsKey!0 (_keys!5952 lt!96455) lt!96757 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!57299 (not res!92151)) b!195213))

(assert (= (and b!195213 res!92152) b!195214))

(assert (=> d!57299 m!220529))

(declare-fun m!222357 () Bool)

(assert (=> b!195214 m!222357))

(assert (=> b!194225 d!57299))

(declare-fun b!195215 () Bool)

(declare-fun e!128384 () SeekEntryResult!695)

(declare-fun lt!97255 () SeekEntryResult!695)

(assert (=> b!195215 (= e!128384 (Found!695 (index!4952 lt!97255)))))

(declare-fun b!195216 () Bool)

(declare-fun c!35348 () Bool)

(declare-fun lt!97254 () (_ BitVec 64))

(assert (=> b!195216 (= c!35348 (= lt!97254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128385 () SeekEntryResult!695)

(assert (=> b!195216 (= e!128384 e!128385)))

(declare-fun d!57301 () Bool)

(declare-fun lt!97253 () SeekEntryResult!695)

(assert (=> d!57301 (and (or ((_ is Undefined!695) lt!97253) (not ((_ is Found!695) lt!97253)) (and (bvsge (index!4951 lt!97253) #b00000000000000000000000000000000) (bvslt (index!4951 lt!97253) (size!4187 (_keys!5952 lt!96455))))) (or ((_ is Undefined!695) lt!97253) ((_ is Found!695) lt!97253) (not ((_ is MissingZero!695) lt!97253)) (and (bvsge (index!4950 lt!97253) #b00000000000000000000000000000000) (bvslt (index!4950 lt!97253) (size!4187 (_keys!5952 lt!96455))))) (or ((_ is Undefined!695) lt!97253) ((_ is Found!695) lt!97253) ((_ is MissingZero!695) lt!97253) (not ((_ is MissingVacant!695) lt!97253)) (and (bvsge (index!4953 lt!97253) #b00000000000000000000000000000000) (bvslt (index!4953 lt!97253) (size!4187 (_keys!5952 lt!96455))))) (or ((_ is Undefined!695) lt!97253) (ite ((_ is Found!695) lt!97253) (= (select (arr!3862 (_keys!5952 lt!96455)) (index!4951 lt!97253)) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!695) lt!97253) (= (select (arr!3862 (_keys!5952 lt!96455)) (index!4950 lt!97253)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!695) lt!97253) (= (select (arr!3862 (_keys!5952 lt!96455)) (index!4953 lt!97253)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128386 () SeekEntryResult!695)

(assert (=> d!57301 (= lt!97253 e!128386)))

(declare-fun c!35349 () Bool)

(assert (=> d!57301 (= c!35349 (and ((_ is Intermediate!695) lt!97255) (undefined!1507 lt!97255)))))

(assert (=> d!57301 (= lt!97255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) (mask!9221 lt!96455)) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) (_keys!5952 lt!96455) (mask!9221 lt!96455)))))

(assert (=> d!57301 (validMask!0 (mask!9221 lt!96455))))

(assert (=> d!57301 (= (seekEntryOrOpen!0 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) (_keys!5952 lt!96455) (mask!9221 lt!96455)) lt!97253)))

(declare-fun b!195217 () Bool)

(assert (=> b!195217 (= e!128386 e!128384)))

(assert (=> b!195217 (= lt!97254 (select (arr!3862 (_keys!5952 lt!96455)) (index!4952 lt!97255)))))

(declare-fun c!35347 () Bool)

(assert (=> b!195217 (= c!35347 (= lt!97254 (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000)))))

(declare-fun b!195218 () Bool)

(assert (=> b!195218 (= e!128385 (MissingZero!695 (index!4952 lt!97255)))))

(declare-fun b!195219 () Bool)

(assert (=> b!195219 (= e!128386 Undefined!695)))

(declare-fun b!195220 () Bool)

(assert (=> b!195220 (= e!128385 (seekKeyOrZeroReturnVacant!0 (x!20690 lt!97255) (index!4952 lt!97255) (index!4952 lt!97255) (select (arr!3862 (_keys!5952 lt!96455)) #b00000000000000000000000000000000) (_keys!5952 lt!96455) (mask!9221 lt!96455)))))

(assert (= (and d!57301 c!35349) b!195219))

(assert (= (and d!57301 (not c!35349)) b!195217))

(assert (= (and b!195217 c!35347) b!195215))

(assert (= (and b!195217 (not c!35347)) b!195216))

(assert (= (and b!195216 c!35348) b!195218))

(assert (= (and b!195216 (not c!35348)) b!195220))

(declare-fun m!222359 () Bool)

(assert (=> d!57301 m!222359))

(assert (=> d!57301 m!220529))

(declare-fun m!222361 () Bool)

(assert (=> d!57301 m!222361))

(assert (=> d!57301 m!220719))

(assert (=> d!57301 m!222361))

(assert (=> d!57301 m!220529))

(declare-fun m!222363 () Bool)

(assert (=> d!57301 m!222363))

(declare-fun m!222365 () Bool)

(assert (=> d!57301 m!222365))

(declare-fun m!222367 () Bool)

(assert (=> d!57301 m!222367))

(declare-fun m!222369 () Bool)

(assert (=> b!195217 m!222369))

(assert (=> b!195220 m!220529))

(declare-fun m!222371 () Bool)

(assert (=> b!195220 m!222371))

(assert (=> b!194225 d!57301))

(assert (=> b!194273 d!56539))

(assert (=> b!194272 d!57237))

(assert (=> b!194374 d!56775))

(assert (=> b!194374 d!56777))

(declare-fun d!57303 () Bool)

(assert (=> d!57303 (= (isEmpty!492 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450)))) (not ((_ is Some!248) (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))))

(assert (=> d!56599 d!57303))

(declare-fun d!57305 () Bool)

(declare-fun res!92153 () Bool)

(declare-fun e!128387 () Bool)

(assert (=> d!57305 (=> res!92153 e!128387)))

(assert (=> d!57305 (= res!92153 (and ((_ is Cons!2422) (toList!1225 lt!96632)) (= (_1!1766 (h!3063 (toList!1225 lt!96632))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57305 (= (containsKey!247 (toList!1225 lt!96632) #b1000000000000000000000000000000000000000000000000000000000000000) e!128387)))

(declare-fun b!195221 () Bool)

(declare-fun e!128388 () Bool)

(assert (=> b!195221 (= e!128387 e!128388)))

(declare-fun res!92154 () Bool)

(assert (=> b!195221 (=> (not res!92154) (not e!128388))))

(assert (=> b!195221 (= res!92154 (and (or (not ((_ is Cons!2422) (toList!1225 lt!96632))) (bvsle (_1!1766 (h!3063 (toList!1225 lt!96632))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2422) (toList!1225 lt!96632)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96632))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195222 () Bool)

(assert (=> b!195222 (= e!128388 (containsKey!247 (t!7343 (toList!1225 lt!96632)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57305 (not res!92153)) b!195221))

(assert (= (and b!195221 res!92154) b!195222))

(declare-fun m!222373 () Bool)

(assert (=> b!195222 m!222373))

(assert (=> d!56589 d!57305))

(declare-fun d!57307 () Bool)

(declare-fun e!128390 () Bool)

(assert (=> d!57307 e!128390))

(declare-fun res!92155 () Bool)

(assert (=> d!57307 (=> res!92155 e!128390)))

(declare-fun lt!97258 () Bool)

(assert (=> d!57307 (= res!92155 (not lt!97258))))

(declare-fun lt!97259 () Bool)

(assert (=> d!57307 (= lt!97258 lt!97259)))

(declare-fun lt!97257 () Unit!5819)

(declare-fun e!128389 () Unit!5819)

(assert (=> d!57307 (= lt!97257 e!128389)))

(declare-fun c!35350 () Bool)

(assert (=> d!57307 (= c!35350 lt!97259)))

(assert (=> d!57307 (= lt!97259 (containsKey!247 (toList!1225 lt!96918) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(assert (=> d!57307 (= (contains!1356 lt!96918 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!97258)))

(declare-fun b!195223 () Bool)

(declare-fun lt!97256 () Unit!5819)

(assert (=> b!195223 (= e!128389 lt!97256)))

(assert (=> b!195223 (= lt!97256 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96918) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(assert (=> b!195223 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96918) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun b!195224 () Bool)

(declare-fun Unit!5881 () Unit!5819)

(assert (=> b!195224 (= e!128389 Unit!5881)))

(declare-fun b!195225 () Bool)

(assert (=> b!195225 (= e!128390 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96918) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57307 c!35350) b!195223))

(assert (= (and d!57307 (not c!35350)) b!195224))

(assert (= (and d!57307 (not res!92155)) b!195225))

(declare-fun m!222375 () Bool)

(assert (=> d!57307 m!222375))

(declare-fun m!222377 () Bool)

(assert (=> b!195223 m!222377))

(assert (=> b!195223 m!221027))

(assert (=> b!195223 m!221027))

(declare-fun m!222379 () Bool)

(assert (=> b!195223 m!222379))

(assert (=> b!195225 m!221027))

(assert (=> b!195225 m!221027))

(assert (=> b!195225 m!222379))

(assert (=> d!56709 d!57307))

(declare-fun e!128392 () Option!249)

(declare-fun b!195228 () Bool)

(assert (=> b!195228 (= e!128392 (getValueByKey!243 (t!7343 lt!96920) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun d!57309 () Bool)

(declare-fun c!35351 () Bool)

(assert (=> d!57309 (= c!35351 (and ((_ is Cons!2422) lt!96920) (= (_1!1766 (h!3063 lt!96920)) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(declare-fun e!128391 () Option!249)

(assert (=> d!57309 (= (getValueByKey!243 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) e!128391)))

(declare-fun b!195226 () Bool)

(assert (=> b!195226 (= e!128391 (Some!248 (_2!1766 (h!3063 lt!96920))))))

(declare-fun b!195227 () Bool)

(assert (=> b!195227 (= e!128391 e!128392)))

(declare-fun c!35352 () Bool)

(assert (=> b!195227 (= c!35352 (and ((_ is Cons!2422) lt!96920) (not (= (_1!1766 (h!3063 lt!96920)) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195229 () Bool)

(assert (=> b!195229 (= e!128392 None!247)))

(assert (= (and d!57309 c!35351) b!195226))

(assert (= (and d!57309 (not c!35351)) b!195227))

(assert (= (and b!195227 c!35352) b!195228))

(assert (= (and b!195227 (not c!35352)) b!195229))

(declare-fun m!222381 () Bool)

(assert (=> b!195228 m!222381))

(assert (=> d!56709 d!57309))

(declare-fun d!57311 () Bool)

(assert (=> d!57311 (= (getValueByKey!243 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97260 () Unit!5819)

(assert (=> d!57311 (= lt!97260 (choose!1074 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun e!128393 () Bool)

(assert (=> d!57311 e!128393))

(declare-fun res!92156 () Bool)

(assert (=> d!57311 (=> (not res!92156) (not e!128393))))

(assert (=> d!57311 (= res!92156 (isStrictlySorted!352 lt!96920))))

(assert (=> d!57311 (= (lemmaContainsTupThenGetReturnValue!133 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!97260)))

(declare-fun b!195230 () Bool)

(declare-fun res!92157 () Bool)

(assert (=> b!195230 (=> (not res!92157) (not e!128393))))

(assert (=> b!195230 (= res!92157 (containsKey!247 lt!96920 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun b!195231 () Bool)

(assert (=> b!195231 (= e!128393 (contains!1359 lt!96920 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57311 res!92156) b!195230))

(assert (= (and b!195230 res!92157) b!195231))

(assert (=> d!57311 m!221021))

(declare-fun m!222383 () Bool)

(assert (=> d!57311 m!222383))

(declare-fun m!222385 () Bool)

(assert (=> d!57311 m!222385))

(declare-fun m!222387 () Bool)

(assert (=> b!195230 m!222387))

(declare-fun m!222389 () Bool)

(assert (=> b!195231 m!222389))

(assert (=> d!56709 d!57311))

(declare-fun d!57313 () Bool)

(declare-fun e!128395 () Bool)

(assert (=> d!57313 e!128395))

(declare-fun res!92159 () Bool)

(assert (=> d!57313 (=> (not res!92159) (not e!128395))))

(declare-fun lt!97261 () List!2426)

(assert (=> d!57313 (= res!92159 (isStrictlySorted!352 lt!97261))))

(declare-fun e!128396 () List!2426)

(assert (=> d!57313 (= lt!97261 e!128396)))

(declare-fun c!35353 () Bool)

(assert (=> d!57313 (= c!35353 (and ((_ is Cons!2422) (toList!1225 lt!96611)) (bvslt (_1!1766 (h!3063 (toList!1225 lt!96611))) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(assert (=> d!57313 (isStrictlySorted!352 (toList!1225 lt!96611))))

(assert (=> d!57313 (= (insertStrictlySorted!136 (toList!1225 lt!96611) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))) lt!97261)))

(declare-fun bm!19714 () Bool)

(declare-fun call!19718 () List!2426)

(declare-fun call!19719 () List!2426)

(assert (=> bm!19714 (= call!19718 call!19719)))

(declare-fun b!195232 () Bool)

(declare-fun e!128397 () List!2426)

(assert (=> b!195232 (= e!128397 (insertStrictlySorted!136 (t!7343 (toList!1225 lt!96611)) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun b!195233 () Bool)

(assert (=> b!195233 (= e!128395 (contains!1359 lt!97261 (tuple2!3511 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(declare-fun b!195234 () Bool)

(declare-fun e!128394 () List!2426)

(assert (=> b!195234 (= e!128396 e!128394)))

(declare-fun c!35355 () Bool)

(assert (=> b!195234 (= c!35355 (and ((_ is Cons!2422) (toList!1225 lt!96611)) (= (_1!1766 (h!3063 (toList!1225 lt!96611))) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(declare-fun b!195235 () Bool)

(declare-fun res!92158 () Bool)

(assert (=> b!195235 (=> (not res!92158) (not e!128395))))

(assert (=> b!195235 (= res!92158 (containsKey!247 lt!97261 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))

(declare-fun b!195236 () Bool)

(assert (=> b!195236 (= e!128396 call!19719)))

(declare-fun b!195237 () Bool)

(declare-fun e!128398 () List!2426)

(declare-fun call!19717 () List!2426)

(assert (=> b!195237 (= e!128398 call!19717)))

(declare-fun b!195238 () Bool)

(assert (=> b!195238 (= e!128398 call!19717)))

(declare-fun b!195239 () Bool)

(declare-fun c!35356 () Bool)

(assert (=> b!195239 (= e!128397 (ite c!35355 (t!7343 (toList!1225 lt!96611)) (ite c!35356 (Cons!2422 (h!3063 (toList!1225 lt!96611)) (t!7343 (toList!1225 lt!96611))) Nil!2423)))))

(declare-fun b!195240 () Bool)

(assert (=> b!195240 (= e!128394 call!19718)))

(declare-fun bm!19715 () Bool)

(assert (=> bm!19715 (= call!19719 ($colon$colon!102 e!128397 (ite c!35353 (h!3063 (toList!1225 lt!96611)) (tuple2!3511 (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35354 () Bool)

(assert (=> bm!19715 (= c!35354 c!35353)))

(declare-fun b!195241 () Bool)

(assert (=> b!195241 (= c!35356 (and ((_ is Cons!2422) (toList!1225 lt!96611)) (bvsgt (_1!1766 (h!3063 (toList!1225 lt!96611))) (_1!1766 (tuple2!3511 lt!96619 (minValue!3800 thiss!1248))))))))

(assert (=> b!195241 (= e!128394 e!128398)))

(declare-fun bm!19716 () Bool)

(assert (=> bm!19716 (= call!19717 call!19718)))

(assert (= (and d!57313 c!35353) b!195236))

(assert (= (and d!57313 (not c!35353)) b!195234))

(assert (= (and b!195234 c!35355) b!195240))

(assert (= (and b!195234 (not c!35355)) b!195241))

(assert (= (and b!195241 c!35356) b!195237))

(assert (= (and b!195241 (not c!35356)) b!195238))

(assert (= (or b!195237 b!195238) bm!19716))

(assert (= (or b!195240 bm!19716) bm!19714))

(assert (= (or b!195236 bm!19714) bm!19715))

(assert (= (and bm!19715 c!35354) b!195232))

(assert (= (and bm!19715 (not c!35354)) b!195239))

(assert (= (and d!57313 res!92159) b!195235))

(assert (= (and b!195235 res!92158) b!195233))

(declare-fun m!222391 () Bool)

(assert (=> d!57313 m!222391))

(declare-fun m!222393 () Bool)

(assert (=> d!57313 m!222393))

(declare-fun m!222395 () Bool)

(assert (=> b!195235 m!222395))

(declare-fun m!222397 () Bool)

(assert (=> b!195232 m!222397))

(declare-fun m!222399 () Bool)

(assert (=> b!195233 m!222399))

(declare-fun m!222401 () Bool)

(assert (=> bm!19715 m!222401))

(assert (=> d!56709 d!57313))

(declare-fun d!57315 () Bool)

(assert (=> d!57315 (= (apply!188 lt!96795 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2232 (getValueByKey!243 (toList!1225 lt!96795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7777 () Bool)

(assert (= bs!7777 d!57315))

(assert (=> bs!7777 m!221979))

(assert (=> bs!7777 m!221979))

(declare-fun m!222403 () Bool)

(assert (=> bs!7777 m!222403))

(assert (=> b!194305 d!57315))

(assert (=> d!56597 d!56531))

(assert (=> d!56723 d!56599))

(assert (=> d!56723 d!56601))

(declare-fun d!57317 () Bool)

(assert (=> d!57317 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))))))

(assert (=> d!57317 true))

(declare-fun _$12!450 () Unit!5819)

(assert (=> d!57317 (= (choose!1075 (toList!1225 lt!96451) (select (arr!3862 (_keys!5952 thiss!1248)) (index!4951 lt!96450))) _$12!450)))

(declare-fun bs!7778 () Bool)

(assert (= bs!7778 d!57317))

(assert (=> bs!7778 m!220093))

(assert (=> bs!7778 m!220369))

(assert (=> bs!7778 m!220369))

(assert (=> bs!7778 m!220371))

(assert (=> d!56723 d!57317))

(declare-fun d!57319 () Bool)

(declare-fun res!92160 () Bool)

(declare-fun e!128399 () Bool)

(assert (=> d!57319 (=> res!92160 e!128399)))

(assert (=> d!57319 (= res!92160 (or ((_ is Nil!2423) (toList!1225 lt!96451)) ((_ is Nil!2423) (t!7343 (toList!1225 lt!96451)))))))

(assert (=> d!57319 (= (isStrictlySorted!352 (toList!1225 lt!96451)) e!128399)))

(declare-fun b!195242 () Bool)

(declare-fun e!128400 () Bool)

(assert (=> b!195242 (= e!128399 e!128400)))

(declare-fun res!92161 () Bool)

(assert (=> b!195242 (=> (not res!92161) (not e!128400))))

(assert (=> b!195242 (= res!92161 (bvslt (_1!1766 (h!3063 (toList!1225 lt!96451))) (_1!1766 (h!3063 (t!7343 (toList!1225 lt!96451))))))))

(declare-fun b!195243 () Bool)

(assert (=> b!195243 (= e!128400 (isStrictlySorted!352 (t!7343 (toList!1225 lt!96451))))))

(assert (= (and d!57319 (not res!92160)) b!195242))

(assert (= (and b!195242 res!92161) b!195243))

(declare-fun m!222405 () Bool)

(assert (=> b!195243 m!222405))

(assert (=> d!56723 d!57319))

(declare-fun d!57321 () Bool)

(assert (=> d!57321 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96633) lt!96630)) (v!4250 (getValueByKey!243 (toList!1225 lt!96633) lt!96630)))))

(assert (=> d!56621 d!57321))

(declare-fun b!195246 () Bool)

(declare-fun e!128402 () Option!249)

(assert (=> b!195246 (= e!128402 (getValueByKey!243 (t!7343 (toList!1225 lt!96633)) lt!96630))))

(declare-fun d!57323 () Bool)

(declare-fun c!35357 () Bool)

(assert (=> d!57323 (= c!35357 (and ((_ is Cons!2422) (toList!1225 lt!96633)) (= (_1!1766 (h!3063 (toList!1225 lt!96633))) lt!96630)))))

(declare-fun e!128401 () Option!249)

(assert (=> d!57323 (= (getValueByKey!243 (toList!1225 lt!96633) lt!96630) e!128401)))

(declare-fun b!195244 () Bool)

(assert (=> b!195244 (= e!128401 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96633)))))))

(declare-fun b!195245 () Bool)

(assert (=> b!195245 (= e!128401 e!128402)))

(declare-fun c!35358 () Bool)

(assert (=> b!195245 (= c!35358 (and ((_ is Cons!2422) (toList!1225 lt!96633)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96633))) lt!96630))))))

(declare-fun b!195247 () Bool)

(assert (=> b!195247 (= e!128402 None!247)))

(assert (= (and d!57323 c!35357) b!195244))

(assert (= (and d!57323 (not c!35357)) b!195245))

(assert (= (and b!195245 c!35358) b!195246))

(assert (= (and b!195245 (not c!35358)) b!195247))

(declare-fun m!222407 () Bool)

(assert (=> b!195246 m!222407))

(assert (=> d!56621 d!57323))

(assert (=> d!56577 d!56579))

(assert (=> d!56577 d!56581))

(declare-fun d!57325 () Bool)

(assert (=> d!57325 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96453) key!828))))

(assert (=> d!57325 true))

(declare-fun _$12!451 () Unit!5819)

(assert (=> d!57325 (= (choose!1075 (toList!1225 lt!96453) key!828) _$12!451)))

(declare-fun bs!7779 () Bool)

(assert (= bs!7779 d!57325))

(assert (=> bs!7779 m!220221))

(assert (=> bs!7779 m!220221))

(assert (=> bs!7779 m!220223))

(assert (=> d!56577 d!57325))

(assert (=> d!56577 d!57225))

(declare-fun d!57327 () Bool)

(assert (=> d!57327 (= (get!2232 (getValueByKey!243 (toList!1225 lt!96605) lt!96618)) (v!4250 (getValueByKey!243 (toList!1225 lt!96605) lt!96618)))))

(assert (=> d!56695 d!57327))

(declare-fun b!195250 () Bool)

(declare-fun e!128404 () Option!249)

(assert (=> b!195250 (= e!128404 (getValueByKey!243 (t!7343 (toList!1225 lt!96605)) lt!96618))))

(declare-fun d!57329 () Bool)

(declare-fun c!35359 () Bool)

(assert (=> d!57329 (= c!35359 (and ((_ is Cons!2422) (toList!1225 lt!96605)) (= (_1!1766 (h!3063 (toList!1225 lt!96605))) lt!96618)))))

(declare-fun e!128403 () Option!249)

(assert (=> d!57329 (= (getValueByKey!243 (toList!1225 lt!96605) lt!96618) e!128403)))

(declare-fun b!195248 () Bool)

(assert (=> b!195248 (= e!128403 (Some!248 (_2!1766 (h!3063 (toList!1225 lt!96605)))))))

(declare-fun b!195249 () Bool)

(assert (=> b!195249 (= e!128403 e!128404)))

(declare-fun c!35360 () Bool)

(assert (=> b!195249 (= c!35360 (and ((_ is Cons!2422) (toList!1225 lt!96605)) (not (= (_1!1766 (h!3063 (toList!1225 lt!96605))) lt!96618))))))

(declare-fun b!195251 () Bool)

(assert (=> b!195251 (= e!128404 None!247)))

(assert (= (and d!57329 c!35359) b!195248))

(assert (= (and d!57329 (not c!35359)) b!195249))

(assert (= (and b!195249 c!35360) b!195250))

(assert (= (and b!195249 (not c!35360)) b!195251))

(declare-fun m!222409 () Bool)

(assert (=> b!195250 m!222409))

(assert (=> d!56695 d!57329))

(declare-fun d!57331 () Bool)

(declare-fun e!128406 () Bool)

(assert (=> d!57331 e!128406))

(declare-fun res!92162 () Bool)

(assert (=> d!57331 (=> res!92162 e!128406)))

(declare-fun lt!97264 () Bool)

(assert (=> d!57331 (= res!92162 (not lt!97264))))

(declare-fun lt!97265 () Bool)

(assert (=> d!57331 (= lt!97264 lt!97265)))

(declare-fun lt!97263 () Unit!5819)

(declare-fun e!128405 () Unit!5819)

(assert (=> d!57331 (= lt!97263 e!128405)))

(declare-fun c!35361 () Bool)

(assert (=> d!57331 (= c!35361 lt!97265)))

(assert (=> d!57331 (= lt!97265 (containsKey!247 (toList!1225 lt!96708) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> d!57331 (= (contains!1356 lt!96708 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97264)))

(declare-fun b!195252 () Bool)

(declare-fun lt!97262 () Unit!5819)

(assert (=> b!195252 (= e!128405 lt!97262)))

(assert (=> b!195252 (= lt!97262 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1225 lt!96708) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(assert (=> b!195252 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96708) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195253 () Bool)

(declare-fun Unit!5882 () Unit!5819)

(assert (=> b!195253 (= e!128405 Unit!5882)))

(declare-fun b!195254 () Bool)

(assert (=> b!195254 (= e!128406 (isDefined!197 (getValueByKey!243 (toList!1225 lt!96708) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57331 c!35361) b!195252))

(assert (= (and d!57331 (not c!35361)) b!195253))

(assert (= (and d!57331 (not res!92162)) b!195254))

(declare-fun m!222411 () Bool)

(assert (=> d!57331 m!222411))

(declare-fun m!222413 () Bool)

(assert (=> b!195252 m!222413))

(assert (=> b!195252 m!220459))

(assert (=> b!195252 m!220459))

(declare-fun m!222415 () Bool)

(assert (=> b!195252 m!222415))

(assert (=> b!195254 m!220459))

(assert (=> b!195254 m!220459))

(assert (=> b!195254 m!222415))

(assert (=> d!56543 d!57331))

(declare-fun b!195257 () Bool)

(declare-fun e!128408 () Option!249)

(assert (=> b!195257 (= e!128408 (getValueByKey!243 (t!7343 lt!96710) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun d!57333 () Bool)

(declare-fun c!35362 () Bool)

(assert (=> d!57333 (= c!35362 (and ((_ is Cons!2422) lt!96710) (= (_1!1766 (h!3063 lt!96710)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun e!128407 () Option!249)

(assert (=> d!57333 (= (getValueByKey!243 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) e!128407)))

(declare-fun b!195255 () Bool)

(assert (=> b!195255 (= e!128407 (Some!248 (_2!1766 (h!3063 lt!96710))))))

(declare-fun b!195256 () Bool)

(assert (=> b!195256 (= e!128407 e!128408)))

(declare-fun c!35363 () Bool)

(assert (=> b!195256 (= c!35363 (and ((_ is Cons!2422) lt!96710) (not (= (_1!1766 (h!3063 lt!96710)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun b!195258 () Bool)

(assert (=> b!195258 (= e!128408 None!247)))

(assert (= (and d!57333 c!35362) b!195255))

(assert (= (and d!57333 (not c!35362)) b!195256))

(assert (= (and b!195256 c!35363) b!195257))

(assert (= (and b!195256 (not c!35363)) b!195258))

(declare-fun m!222417 () Bool)

(assert (=> b!195257 m!222417))

(assert (=> d!56543 d!57333))

(declare-fun d!57335 () Bool)

(assert (=> d!57335 (= (getValueByKey!243 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) (Some!248 (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun lt!97266 () Unit!5819)

(assert (=> d!57335 (= lt!97266 (choose!1074 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun e!128409 () Bool)

(assert (=> d!57335 e!128409))

(declare-fun res!92163 () Bool)

(assert (=> d!57335 (=> (not res!92163) (not e!128409))))

(assert (=> d!57335 (= res!92163 (isStrictlySorted!352 lt!96710))))

(assert (=> d!57335 (= (lemmaContainsTupThenGetReturnValue!133 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97266)))

(declare-fun b!195259 () Bool)

(declare-fun res!92164 () Bool)

(assert (=> b!195259 (=> (not res!92164) (not e!128409))))

(assert (=> b!195259 (= res!92164 (containsKey!247 lt!96710 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195260 () Bool)

(assert (=> b!195260 (= e!128409 (contains!1359 lt!96710 (tuple2!3511 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (= (and d!57335 res!92163) b!195259))

(assert (= (and b!195259 res!92164) b!195260))

(assert (=> d!57335 m!220453))

(declare-fun m!222419 () Bool)

(assert (=> d!57335 m!222419))

(declare-fun m!222421 () Bool)

(assert (=> d!57335 m!222421))

(declare-fun m!222423 () Bool)

(assert (=> b!195259 m!222423))

(declare-fun m!222425 () Bool)

(assert (=> b!195260 m!222425))

(assert (=> d!56543 d!57335))

(declare-fun d!57337 () Bool)

(declare-fun e!128411 () Bool)

(assert (=> d!57337 e!128411))

(declare-fun res!92166 () Bool)

(assert (=> d!57337 (=> (not res!92166) (not e!128411))))

(declare-fun lt!97267 () List!2426)

(assert (=> d!57337 (= res!92166 (isStrictlySorted!352 lt!97267))))

(declare-fun e!128412 () List!2426)

(assert (=> d!57337 (= lt!97267 e!128412)))

(declare-fun c!35364 () Bool)

(assert (=> d!57337 (= c!35364 (and ((_ is Cons!2422) (toList!1225 call!19606)) (bvslt (_1!1766 (h!3063 (toList!1225 call!19606))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> d!57337 (isStrictlySorted!352 (toList!1225 call!19606))))

(assert (=> d!57337 (= (insertStrictlySorted!136 (toList!1225 call!19606) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))) lt!97267)))

(declare-fun bm!19717 () Bool)

(declare-fun call!19721 () List!2426)

(declare-fun call!19722 () List!2426)

(assert (=> bm!19717 (= call!19721 call!19722)))

(declare-fun b!195261 () Bool)

(declare-fun e!128413 () List!2426)

(assert (=> b!195261 (= e!128413 (insertStrictlySorted!136 (t!7343 (toList!1225 call!19606)) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195262 () Bool)

(assert (=> b!195262 (= e!128411 (contains!1359 lt!97267 (tuple2!3511 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195263 () Bool)

(declare-fun e!128410 () List!2426)

(assert (=> b!195263 (= e!128412 e!128410)))

(declare-fun c!35366 () Bool)

(assert (=> b!195263 (= c!35366 (and ((_ is Cons!2422) (toList!1225 call!19606)) (= (_1!1766 (h!3063 (toList!1225 call!19606))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(declare-fun b!195264 () Bool)

(declare-fun res!92165 () Bool)

(assert (=> b!195264 (=> (not res!92165) (not e!128411))))

(assert (=> b!195264 (= res!92165 (containsKey!247 lt!97267 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))

(declare-fun b!195265 () Bool)

(assert (=> b!195265 (= e!128412 call!19722)))

(declare-fun b!195266 () Bool)

(declare-fun e!128414 () List!2426)

(declare-fun call!19720 () List!2426)

(assert (=> b!195266 (= e!128414 call!19720)))

(declare-fun b!195267 () Bool)

(assert (=> b!195267 (= e!128414 call!19720)))

(declare-fun c!35367 () Bool)

(declare-fun b!195268 () Bool)

(assert (=> b!195268 (= e!128413 (ite c!35366 (t!7343 (toList!1225 call!19606)) (ite c!35367 (Cons!2422 (h!3063 (toList!1225 call!19606)) (t!7343 (toList!1225 call!19606))) Nil!2423)))))

(declare-fun b!195269 () Bool)

(assert (=> b!195269 (= e!128410 call!19721)))

(declare-fun bm!19718 () Bool)

(assert (=> bm!19718 (= call!19722 ($colon$colon!102 e!128413 (ite c!35364 (h!3063 (toList!1225 call!19606)) (tuple2!3511 (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))) (_2!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248)))))))))

(declare-fun c!35365 () Bool)

(assert (=> bm!19718 (= c!35365 c!35364)))

(declare-fun b!195270 () Bool)

(assert (=> b!195270 (= c!35367 (and ((_ is Cons!2422) (toList!1225 call!19606)) (bvsgt (_1!1766 (h!3063 (toList!1225 call!19606))) (_1!1766 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3800 thiss!1248))))))))

(assert (=> b!195270 (= e!128410 e!128414)))

(declare-fun bm!19719 () Bool)

(assert (=> bm!19719 (= call!19720 call!19721)))

(assert (= (and d!57337 c!35364) b!195265))

(assert (= (and d!57337 (not c!35364)) b!195263))

(assert (= (and b!195263 c!35366) b!195269))

(assert (= (and b!195263 (not c!35366)) b!195270))

(assert (= (and b!195270 c!35367) b!195266))

(assert (= (and b!195270 (not c!35367)) b!195267))

(assert (= (or b!195266 b!195267) bm!19719))

(assert (= (or b!195269 bm!19719) bm!19717))

(assert (= (or b!195265 bm!19717) bm!19718))

(assert (= (and bm!19718 c!35365) b!195261))

(assert (= (and bm!19718 (not c!35365)) b!195268))

(assert (= (and d!57337 res!92166) b!195264))

(assert (= (and b!195264 res!92165) b!195262))

(declare-fun m!222427 () Bool)

(assert (=> d!57337 m!222427))

(declare-fun m!222429 () Bool)

(assert (=> d!57337 m!222429))

(declare-fun m!222431 () Bool)

(assert (=> b!195264 m!222431))

(declare-fun m!222433 () Bool)

(assert (=> b!195261 m!222433))

(declare-fun m!222435 () Bool)

(assert (=> b!195262 m!222435))

(declare-fun m!222437 () Bool)

(assert (=> bm!19718 m!222437))

(assert (=> d!56543 d!57337))

(declare-fun mapIsEmpty!7777 () Bool)

(declare-fun mapRes!7777 () Bool)

(assert (=> mapIsEmpty!7777 mapRes!7777))

(declare-fun condMapEmpty!7777 () Bool)

(declare-fun mapDefault!7777 () ValueCell!1901)

(assert (=> mapNonEmpty!7776 (= condMapEmpty!7777 (= mapRest!7776 ((as const (Array (_ BitVec 32) ValueCell!1901)) mapDefault!7777)))))

(declare-fun e!128415 () Bool)

(assert (=> mapNonEmpty!7776 (= tp!17037 (and e!128415 mapRes!7777))))

(declare-fun b!195271 () Bool)

(declare-fun e!128416 () Bool)

(assert (=> b!195271 (= e!128416 tp_is_empty!4489)))

(declare-fun mapNonEmpty!7777 () Bool)

(declare-fun tp!17038 () Bool)

(assert (=> mapNonEmpty!7777 (= mapRes!7777 (and tp!17038 e!128416))))

(declare-fun mapKey!7777 () (_ BitVec 32))

(declare-fun mapValue!7777 () ValueCell!1901)

(declare-fun mapRest!7777 () (Array (_ BitVec 32) ValueCell!1901))

(assert (=> mapNonEmpty!7777 (= mapRest!7776 (store mapRest!7777 mapKey!7777 mapValue!7777))))

(declare-fun b!195272 () Bool)

(assert (=> b!195272 (= e!128415 tp_is_empty!4489)))

(assert (= (and mapNonEmpty!7776 condMapEmpty!7777) mapIsEmpty!7777))

(assert (= (and mapNonEmpty!7776 (not condMapEmpty!7777)) mapNonEmpty!7777))

(assert (= (and mapNonEmpty!7777 ((_ is ValueCellFull!1901) mapValue!7777)) b!195271))

(assert (= (and mapNonEmpty!7776 ((_ is ValueCellFull!1901) mapDefault!7777)) b!195272))

(declare-fun m!222439 () Bool)

(assert (=> mapNonEmpty!7777 m!222439))

(declare-fun b_lambda!7507 () Bool)

(assert (= b_lambda!7493 (or (and b!193809 b_free!4717) b_lambda!7507)))

(declare-fun b_lambda!7509 () Bool)

(assert (= b_lambda!7479 (or (and b!193809 b_free!4717 (= (defaultEntry!3959 thiss!1248) (defaultEntry!3959 lt!96455))) b_lambda!7509)))

(declare-fun b_lambda!7511 () Bool)

(assert (= b_lambda!7503 (or (and b!193809 b_free!4717) b_lambda!7511)))

(declare-fun b_lambda!7513 () Bool)

(assert (= b_lambda!7499 (or (and b!193809 b_free!4717) b_lambda!7513)))

(declare-fun b_lambda!7515 () Bool)

(assert (= b_lambda!7505 (or (and b!193809 b_free!4717) b_lambda!7515)))

(declare-fun b_lambda!7517 () Bool)

(assert (= b_lambda!7501 (or (and b!193809 b_free!4717) b_lambda!7517)))

(declare-fun b_lambda!7519 () Bool)

(assert (= b_lambda!7491 (or (and b!193809 b_free!4717) b_lambda!7519)))

(check-sat (not d!57007) (not d!57145) (not b!194591) (not b!194619) (not b!194572) (not d!56741) (not b!194798) (not b!195165) (not b!194592) (not d!56915) (not d!56905) (not bm!19677) (not b!194697) (not b!194517) (not b!194773) (not b!194770) (not d!56871) (not b!195230) (not b!194521) (not b!194543) (not b!194817) (not b!195186) (not b!194906) (not b!194673) (not b!194885) (not b!195112) (not d!56727) (not b!194895) (not b!195140) (not d!56781) (not b!195254) (not d!57215) (not b!194640) (not b!194501) (not b!194766) (not d!56869) (not b!194930) (not b!195163) (not d!57233) (not d!56755) (not d!56769) (not b!194871) (not b!194566) (not b!194590) (not b!195142) (not b!195020) (not bm!19715) (not b!194805) (not b!195203) (not b!194557) (not d!56945) (not d!56819) (not b!194631) (not b!194788) (not b_lambda!7513) (not b!194791) (not d!56875) (not b!194494) (not d!56993) (not b!194973) (not b!195053) (not b!194712) (not bm!19688) (not b!194593) (not d!57041) (not d!56931) (not d!56785) (not b!194527) (not b!195261) (not b!195082) (not b!194724) (not b!194954) (not b!194927) (not d!56747) (not d!57245) (not b!194651) (not b!194792) (not b!195091) (not d!56863) (not d!56797) (not bm!19704) (not b!194674) (not mapNonEmpty!7777) (not b!194506) (not b!194760) (not b!194693) (not d!57169) (not d!57231) (not b!194864) (not d!57199) (not d!57203) (not b!194503) (not d!56935) (not b!194529) (not b!194949) (not b!194916) (not d!56773) (not b!195231) (not b!194628) (not b!194498) (not b_lambda!7489) (not b!195143) (not b!194671) (not d!57243) (not b!195051) (not b!194556) (not b!194595) (not b!194946) (not d!56913) (not b!194995) (not d!56779) (not b!194725) (not b!194846) (not b!194546) (not d!56771) (not b!195075) (not b!194852) (not d!57037) (not d!57335) (not b!194524) (not b!194934) (not b!194698) (not b!194588) (not b!194528) (not b!194606) (not b_lambda!7465) (not b!194909) (not d!56791) (not b!194655) (not b!195168) (not b!195005) (not d!57013) (not b!194554) (not b!195115) (not d!56927) (not b!194803) (not b!194564) (not b!194842) (not b!195033) (not b!194923) (not b_lambda!7511) (not d!56873) (not b!195152) (not d!57065) (not b!194808) (not d!57227) (not d!56775) (not b!195205) (not b!195119) (not b!194560) (not b!195185) (not d!56957) (not d!57173) (not b!194802) (not d!56989) (not b!194914) (not b!194675) (not b!194550) (not b!194585) (not d!56809) (not b!194743) (not b!194907) (not d!56759) (not b!195068) (not b!194491) (not b!194769) (not b!194936) (not b!194998) (not d!56881) (not b!194569) (not d!56803) (not b!194576) (not b!194722) (not b!195181) (not b!194826) (not b_lambda!7467) (not b!195209) (not d!57075) (not b!194970) (not d!57301) (not d!56963) (not b!194951) (not b!194707) (not b!195130) (not b!194717) (not b!194919) (not b!195026) (not b!194827) (not b!194496) (not d!57251) (not b!195136) (not bm!19666) (not d!57229) (not bm!19710) (not b_lambda!7519) (not d!56751) (not d!57077) (not d!56975) (not b!194731) (not b!194794) (not b_lambda!7487) (not b_lambda!7483) (not b_lambda!7509) (not b!194635) (not bm!19698) (not b!195199) (not b!194797) (not b!195177) (not d!56939) (not b!194956) (not bm!19713) (not d!57183) (not b!194659) (not b!195072) (not d!56725) (not b!194553) (not d!57021) (not d!56961) (not b!194821) (not d!57313) (not b!194643) (not d!57297) (not d!57275) (not d!57119) (not b!195167) (not d!57039) (not d!56827) (not bm!19694) (not b!194860) (not b!195141) (not d!56739) (not b!195036) (not d!56995) (not b!194519) (not d!56937) (not b!194666) (not bm!19680) (not bm!19684) (not b!194921) (not d!57179) (not b!194614) (not b!194935) tp_is_empty!4489 (not b!194579) (not b!194688) (not b!194781) (not b!195132) (not b!194968) (not b!195065) (not b!194944) (not b!195109) (not b!194980) (not b!194526) (not b!194929) (not b!195013) (not b!195232) (not d!57155) (not b!194922) (not b!194994) (not b!194917) (not b!194678) (not b!195019) (not d!56853) (not b!194625) (not d!57069) (not b!195179) (not b!195222) (not b!195153) (not b!194508) (not d!57023) (not b!194622) (not b!194816) (not b!195150) (not b!194813) (not b!194758) (not b!195094) (not d!57051) (not b!195120) (not b!194985) (not d!56991) (not b!195252) (not b!194899) (not d!56887) (not d!56757) (not b!194747) (not b!195056) (not b!194992) (not b!195039) (not b!194687) (not d!56821) (not b!194648) (not d!57311) (not d!57109) (not b!195077) (not b!194583) (not b!194624) (not d!57137) (not d!57099) (not b!194862) (not d!56899) (not b!194990) (not d!57079) (not d!56923) (not d!57331) (not b!194844) (not b!194604) (not b!194617) (not b!194811) (not b!195214) (not b!194853) (not d!57081) (not d!56973) (not d!57053) (not d!57279) (not b!195246) (not d!56895) (not b!194685) (not b!194789) (not d!57093) (not d!57249) (not d!56835) (not d!57177) (not b!194889) (not d!57121) (not d!56801) (not d!57147) (not b!195016) (not d!57045) (not d!56985) (not d!57213) (not b!195206) (not b!195031) (not b!194763) (not b!194745) (not d!57103) (not d!56761) (not b!195259) (not d!57085) (not b!195096) (not d!57091) (not b!194983) (not b!195098) (not d!56753) (not d!57205) (not b!194874) (not b!195235) (not b!195151) (not d!57105) (not b!195180) (not b!194608) (not d!57063) (not d!56837) (not b!194982) (not b!195078) (not d!57057) (not b!194668) (not bm!19673) (not b_lambda!7495) (not b!195170) (not b!194869) (not b!195159) (not d!57133) (not b!195156) (not d!57277) (not b!194663) (not b!195099) (not b!194806) (not b!195220) (not bm!19675) (not d!56943) (not bm!19690) (not d!57337) (not b!194828) (not b!194941) (not b!194616) (not b!194870) (not b!194505) (not d!56731) (not d!56947) (not d!56811) (not d!57197) (not b!194841) (not b!195146) (not b!194829) (not bm!19692) (not b!195194) (not d!57025) (not d!56951) (not b!194843) (not bm!19701) (not d!57127) (not b!194541) (not b!195250) (not d!57209) (not b!194734) (not d!57195) (not b!195257) (not b!195162) (not d!57113) (not b!195097) (not d!56933) (not b!194953) (not d!57307) (not d!57071) (not b!195243) (not d!56865) (not d!57271) (not b!194795) (not b!195262) (not b!195161) (not b!195260) (not d!57061) (not bm!19696) (not b!194548) (not b!194867) (not d!57325) (not b!195158) (not b!195052) (not d!57237) (not d!57181) (not d!56879) (not b!194804) (not b!194767) (not b!194839) (not b!194738) (not b!195212) (not bm!19682) (not b!194780) (not b!194709) (not b!195117) (not d!57059) (not b!194912) (not b!194787) (not b!195225) (not b!195122) (not b!194690) (not d!56825) (not d!57191) (not b!194952) (not d!57009) (not b!195134) (not b_lambda!7481) (not b!195264) (not d!57049) (not b!194924) (not b!195043) (not d!57269) (not b!194996) (not d!56839) (not b!195118) (not b!195007) (not bm!19707) (not d!56949) (not b!194630) (not d!57247) (not b_next!4717) (not b!194824) (not b!195101) (not b!194937) (not b!195233) (not d!57003) (not d!56917) (not d!57115) (not d!57163) (not b!194925) (not b!194539) (not b!194574) (not d!56735) (not b!194854) (not b!195079) (not d!57241) (not b!194665) (not b_lambda!7485) (not bm!19683) (not b!194634) (not b!195023) (not d!57185) (not b_lambda!7515) (not d!57207) (not d!57125) (not b!194903) (not b!194714) (not d!56971) (not b!195174) (not b!195154) (not b!195041) (not d!56883) (not b!194815) (not bm!19671) (not b!195137) (not b!194716) (not b!194756) (not b!195012) (not b!195223) (not b!194611) (not b!194840) (not b!195184) (not b!194582) (not b!194819) (not b!194531) (not b!194782) (not b!195063) (not d!56959) (not b!195070) (not bm!19712) (not b!195054) (not b!194915) (not b!195029) (not bm!19718) (not d!57067) (not d!56955) (not b!194965) (not bm!19686) (not b!195010) (not b!194943) (not b!194676) (not b!194872) (not b!194721) (not b!194700) (not b_lambda!7507) (not d!57287) (not d!56925) (not b!195018) (not d!56979) (not d!56983) (not b!194857) (not bm!19669) (not b!195145) (not d!57253) (not b!194662) (not d!56953) (not b!195089) (not b!194938) (not d!56977) (not d!57139) (not d!56787) b_and!11441 (not b!194696) (not b!194723) (not b!195228) (not b!195009) (not b_lambda!7497) (not d!57315) (not b!195182) (not b!194754) (not d!57165) (not d!56941) (not b!194750) (not b!195045) (not b_lambda!7517) (not b!194786) (not d!57129) (not b!195138) (not d!57073) (not b!194740) (not d!57055) (not d!57239) (not b!194988) (not d!57317) (not b!194563) (not b!195110) (not b!194695) (not b!194882) (not b!194818) (not d!57273) (not b!194504) (not b!194790) (not d!57089) (not b!194646) (not b!195080) (not b!194637) (not b!194831))
(check-sat b_and!11441 (not b_next!4717))
