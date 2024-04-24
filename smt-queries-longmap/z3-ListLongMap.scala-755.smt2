; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17700 () Bool)

(assert start!17700)

(declare-fun b!176972 () Bool)

(declare-fun b_free!4369 () Bool)

(declare-fun b_next!4369 () Bool)

(assert (=> b!176972 (= b_free!4369 (not b_next!4369))))

(declare-fun tp!15804 () Bool)

(declare-fun b_and!10881 () Bool)

(assert (=> b!176972 (= tp!15804 b_and!10881)))

(declare-fun b!176971 () Bool)

(declare-fun res!83881 () Bool)

(declare-fun e!116712 () Bool)

(assert (=> b!176971 (=> (not res!83881) (not e!116712))))

(declare-datatypes ((V!5169 0))(
  ( (V!5170 (val!2115 Int)) )
))
(declare-datatypes ((ValueCell!1727 0))(
  ( (ValueCellFull!1727 (v!3995 V!5169)) (EmptyCell!1727) )
))
(declare-datatypes ((array!7417 0))(
  ( (array!7418 (arr!3518 (Array (_ BitVec 32) (_ BitVec 64))) (size!3822 (_ BitVec 32))) )
))
(declare-datatypes ((array!7419 0))(
  ( (array!7420 (arr!3519 (Array (_ BitVec 32) ValueCell!1727)) (size!3823 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2362 0))(
  ( (LongMapFixedSize!2363 (defaultEntry!3643 Int) (mask!8572 (_ BitVec 32)) (extraKeys!3380 (_ BitVec 32)) (zeroValue!3484 V!5169) (minValue!3484 V!5169) (_size!1230 (_ BitVec 32)) (_keys!5508 array!7417) (_values!3626 array!7419) (_vacant!1230 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2362)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3244 0))(
  ( (tuple2!3245 (_1!1633 (_ BitVec 64)) (_2!1633 V!5169)) )
))
(declare-datatypes ((List!2220 0))(
  ( (Nil!2217) (Cons!2216 (h!2837 tuple2!3244) (t!7040 List!2220)) )
))
(declare-datatypes ((ListLongMap!2177 0))(
  ( (ListLongMap!2178 (toList!1104 List!2220)) )
))
(declare-fun contains!1180 (ListLongMap!2177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!759 (array!7417 array!7419 (_ BitVec 32) (_ BitVec 32) V!5169 V!5169 (_ BitVec 32) Int) ListLongMap!2177)

(assert (=> b!176971 (= res!83881 (contains!1180 (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)) key!828))))

(declare-fun e!116709 () Bool)

(declare-fun e!116710 () Bool)

(declare-fun tp_is_empty!4141 () Bool)

(declare-fun array_inv!2271 (array!7417) Bool)

(declare-fun array_inv!2272 (array!7419) Bool)

(assert (=> b!176972 (= e!116709 (and tp!15804 tp_is_empty!4141 (array_inv!2271 (_keys!5508 thiss!1248)) (array_inv!2272 (_values!3626 thiss!1248)) e!116710))))

(declare-fun mapIsEmpty!7071 () Bool)

(declare-fun mapRes!7071 () Bool)

(assert (=> mapIsEmpty!7071 mapRes!7071))

(declare-fun b!176973 () Bool)

(declare-fun e!116711 () Bool)

(assert (=> b!176973 (= e!116710 (and e!116711 mapRes!7071))))

(declare-fun condMapEmpty!7071 () Bool)

(declare-fun mapDefault!7071 () ValueCell!1727)

(assert (=> b!176973 (= condMapEmpty!7071 (= (arr!3519 (_values!3626 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1727)) mapDefault!7071)))))

(declare-fun mapNonEmpty!7071 () Bool)

(declare-fun tp!15803 () Bool)

(declare-fun e!116714 () Bool)

(assert (=> mapNonEmpty!7071 (= mapRes!7071 (and tp!15803 e!116714))))

(declare-fun mapKey!7071 () (_ BitVec 32))

(declare-fun mapValue!7071 () ValueCell!1727)

(declare-fun mapRest!7071 () (Array (_ BitVec 32) ValueCell!1727))

(assert (=> mapNonEmpty!7071 (= (arr!3519 (_values!3626 thiss!1248)) (store mapRest!7071 mapKey!7071 mapValue!7071))))

(declare-fun b!176974 () Bool)

(declare-fun res!83887 () Bool)

(assert (=> b!176974 (=> (not res!83887) (not e!116712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7417 (_ BitVec 32)) Bool)

(assert (=> b!176974 (= res!83887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5508 thiss!1248) (mask!8572 thiss!1248)))))

(declare-fun res!83884 () Bool)

(assert (=> start!17700 (=> (not res!83884) (not e!116712))))

(declare-fun valid!1011 (LongMapFixedSize!2362) Bool)

(assert (=> start!17700 (= res!83884 (valid!1011 thiss!1248))))

(assert (=> start!17700 e!116712))

(assert (=> start!17700 e!116709))

(assert (=> start!17700 true))

(declare-fun b!176975 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176975 (= e!116712 (not (validKeyInArray!0 key!828)))))

(declare-fun b!176976 () Bool)

(declare-fun res!83888 () Bool)

(assert (=> b!176976 (=> (not res!83888) (not e!116712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176976 (= res!83888 (validMask!0 (mask!8572 thiss!1248)))))

(declare-fun b!176977 () Bool)

(declare-fun res!83882 () Bool)

(assert (=> b!176977 (=> (not res!83882) (not e!116712))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!557 0))(
  ( (MissingZero!557 (index!4396 (_ BitVec 32))) (Found!557 (index!4397 (_ BitVec 32))) (Intermediate!557 (undefined!1369 Bool) (index!4398 (_ BitVec 32)) (x!19411 (_ BitVec 32))) (Undefined!557) (MissingVacant!557 (index!4399 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7417 (_ BitVec 32)) SeekEntryResult!557)

(assert (=> b!176977 (= res!83882 ((_ is Undefined!557) (seekEntryOrOpen!0 key!828 (_keys!5508 thiss!1248) (mask!8572 thiss!1248))))))

(declare-fun b!176978 () Bool)

(assert (=> b!176978 (= e!116711 tp_is_empty!4141)))

(declare-fun b!176979 () Bool)

(declare-fun res!83886 () Bool)

(assert (=> b!176979 (=> (not res!83886) (not e!116712))))

(declare-datatypes ((List!2221 0))(
  ( (Nil!2218) (Cons!2217 (h!2838 (_ BitVec 64)) (t!7041 List!2221)) )
))
(declare-fun arrayNoDuplicates!0 (array!7417 (_ BitVec 32) List!2221) Bool)

(assert (=> b!176979 (= res!83886 (arrayNoDuplicates!0 (_keys!5508 thiss!1248) #b00000000000000000000000000000000 Nil!2218))))

(declare-fun b!176980 () Bool)

(declare-fun res!83885 () Bool)

(assert (=> b!176980 (=> (not res!83885) (not e!116712))))

(assert (=> b!176980 (= res!83885 (and (= (size!3823 (_values!3626 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8572 thiss!1248))) (= (size!3822 (_keys!5508 thiss!1248)) (size!3823 (_values!3626 thiss!1248))) (bvsge (mask!8572 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3380 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3380 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!176981 () Bool)

(declare-fun res!83883 () Bool)

(assert (=> b!176981 (=> (not res!83883) (not e!116712))))

(assert (=> b!176981 (= res!83883 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176982 () Bool)

(assert (=> b!176982 (= e!116714 tp_is_empty!4141)))

(assert (= (and start!17700 res!83884) b!176981))

(assert (= (and b!176981 res!83883) b!176977))

(assert (= (and b!176977 res!83882) b!176971))

(assert (= (and b!176971 res!83881) b!176976))

(assert (= (and b!176976 res!83888) b!176980))

(assert (= (and b!176980 res!83885) b!176974))

(assert (= (and b!176974 res!83887) b!176979))

(assert (= (and b!176979 res!83886) b!176975))

(assert (= (and b!176973 condMapEmpty!7071) mapIsEmpty!7071))

(assert (= (and b!176973 (not condMapEmpty!7071)) mapNonEmpty!7071))

(assert (= (and mapNonEmpty!7071 ((_ is ValueCellFull!1727) mapValue!7071)) b!176982))

(assert (= (and b!176973 ((_ is ValueCellFull!1727) mapDefault!7071)) b!176978))

(assert (= b!176972 b!176973))

(assert (= start!17700 b!176972))

(declare-fun m!205763 () Bool)

(assert (=> start!17700 m!205763))

(declare-fun m!205765 () Bool)

(assert (=> b!176975 m!205765))

(declare-fun m!205767 () Bool)

(assert (=> b!176972 m!205767))

(declare-fun m!205769 () Bool)

(assert (=> b!176972 m!205769))

(declare-fun m!205771 () Bool)

(assert (=> mapNonEmpty!7071 m!205771))

(declare-fun m!205773 () Bool)

(assert (=> b!176979 m!205773))

(declare-fun m!205775 () Bool)

(assert (=> b!176976 m!205775))

(declare-fun m!205777 () Bool)

(assert (=> b!176974 m!205777))

(declare-fun m!205779 () Bool)

(assert (=> b!176971 m!205779))

(assert (=> b!176971 m!205779))

(declare-fun m!205781 () Bool)

(assert (=> b!176971 m!205781))

(declare-fun m!205783 () Bool)

(assert (=> b!176977 m!205783))

(check-sat (not b!176974) (not b!176979) (not b!176975) (not start!17700) tp_is_empty!4141 (not b_next!4369) (not b!176972) (not b!176976) b_and!10881 (not mapNonEmpty!7071) (not b!176971) (not b!176977))
(check-sat b_and!10881 (not b_next!4369))
(get-model)

(declare-fun b!177067 () Bool)

(declare-fun e!116759 () SeekEntryResult!557)

(assert (=> b!177067 (= e!116759 Undefined!557)))

(declare-fun d!53783 () Bool)

(declare-fun lt!87548 () SeekEntryResult!557)

(assert (=> d!53783 (and (or ((_ is Undefined!557) lt!87548) (not ((_ is Found!557) lt!87548)) (and (bvsge (index!4397 lt!87548) #b00000000000000000000000000000000) (bvslt (index!4397 lt!87548) (size!3822 (_keys!5508 thiss!1248))))) (or ((_ is Undefined!557) lt!87548) ((_ is Found!557) lt!87548) (not ((_ is MissingZero!557) lt!87548)) (and (bvsge (index!4396 lt!87548) #b00000000000000000000000000000000) (bvslt (index!4396 lt!87548) (size!3822 (_keys!5508 thiss!1248))))) (or ((_ is Undefined!557) lt!87548) ((_ is Found!557) lt!87548) ((_ is MissingZero!557) lt!87548) (not ((_ is MissingVacant!557) lt!87548)) (and (bvsge (index!4399 lt!87548) #b00000000000000000000000000000000) (bvslt (index!4399 lt!87548) (size!3822 (_keys!5508 thiss!1248))))) (or ((_ is Undefined!557) lt!87548) (ite ((_ is Found!557) lt!87548) (= (select (arr!3518 (_keys!5508 thiss!1248)) (index!4397 lt!87548)) key!828) (ite ((_ is MissingZero!557) lt!87548) (= (select (arr!3518 (_keys!5508 thiss!1248)) (index!4396 lt!87548)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!557) lt!87548) (= (select (arr!3518 (_keys!5508 thiss!1248)) (index!4399 lt!87548)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53783 (= lt!87548 e!116759)))

(declare-fun c!31717 () Bool)

(declare-fun lt!87546 () SeekEntryResult!557)

(assert (=> d!53783 (= c!31717 (and ((_ is Intermediate!557) lt!87546) (undefined!1369 lt!87546)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7417 (_ BitVec 32)) SeekEntryResult!557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53783 (= lt!87546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8572 thiss!1248)) key!828 (_keys!5508 thiss!1248) (mask!8572 thiss!1248)))))

(assert (=> d!53783 (validMask!0 (mask!8572 thiss!1248))))

(assert (=> d!53783 (= (seekEntryOrOpen!0 key!828 (_keys!5508 thiss!1248) (mask!8572 thiss!1248)) lt!87548)))

(declare-fun b!177068 () Bool)

(declare-fun c!31716 () Bool)

(declare-fun lt!87547 () (_ BitVec 64))

(assert (=> b!177068 (= c!31716 (= lt!87547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!116758 () SeekEntryResult!557)

(declare-fun e!116757 () SeekEntryResult!557)

(assert (=> b!177068 (= e!116758 e!116757)))

(declare-fun b!177069 () Bool)

(assert (=> b!177069 (= e!116757 (MissingZero!557 (index!4398 lt!87546)))))

(declare-fun b!177070 () Bool)

(assert (=> b!177070 (= e!116759 e!116758)))

(assert (=> b!177070 (= lt!87547 (select (arr!3518 (_keys!5508 thiss!1248)) (index!4398 lt!87546)))))

(declare-fun c!31718 () Bool)

(assert (=> b!177070 (= c!31718 (= lt!87547 key!828))))

(declare-fun b!177071 () Bool)

(assert (=> b!177071 (= e!116758 (Found!557 (index!4398 lt!87546)))))

(declare-fun b!177072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7417 (_ BitVec 32)) SeekEntryResult!557)

(assert (=> b!177072 (= e!116757 (seekKeyOrZeroReturnVacant!0 (x!19411 lt!87546) (index!4398 lt!87546) (index!4398 lt!87546) key!828 (_keys!5508 thiss!1248) (mask!8572 thiss!1248)))))

(assert (= (and d!53783 c!31717) b!177067))

(assert (= (and d!53783 (not c!31717)) b!177070))

(assert (= (and b!177070 c!31718) b!177071))

(assert (= (and b!177070 (not c!31718)) b!177068))

(assert (= (and b!177068 c!31716) b!177069))

(assert (= (and b!177068 (not c!31716)) b!177072))

(declare-fun m!205829 () Bool)

(assert (=> d!53783 m!205829))

(declare-fun m!205831 () Bool)

(assert (=> d!53783 m!205831))

(declare-fun m!205833 () Bool)

(assert (=> d!53783 m!205833))

(assert (=> d!53783 m!205829))

(declare-fun m!205835 () Bool)

(assert (=> d!53783 m!205835))

(assert (=> d!53783 m!205775))

(declare-fun m!205837 () Bool)

(assert (=> d!53783 m!205837))

(declare-fun m!205839 () Bool)

(assert (=> b!177070 m!205839))

(declare-fun m!205841 () Bool)

(assert (=> b!177072 m!205841))

(assert (=> b!176977 d!53783))

(declare-fun d!53785 () Bool)

(assert (=> d!53785 (= (validMask!0 (mask!8572 thiss!1248)) (and (or (= (mask!8572 thiss!1248) #b00000000000000000000000000000111) (= (mask!8572 thiss!1248) #b00000000000000000000000000001111) (= (mask!8572 thiss!1248) #b00000000000000000000000000011111) (= (mask!8572 thiss!1248) #b00000000000000000000000000111111) (= (mask!8572 thiss!1248) #b00000000000000000000000001111111) (= (mask!8572 thiss!1248) #b00000000000000000000000011111111) (= (mask!8572 thiss!1248) #b00000000000000000000000111111111) (= (mask!8572 thiss!1248) #b00000000000000000000001111111111) (= (mask!8572 thiss!1248) #b00000000000000000000011111111111) (= (mask!8572 thiss!1248) #b00000000000000000000111111111111) (= (mask!8572 thiss!1248) #b00000000000000000001111111111111) (= (mask!8572 thiss!1248) #b00000000000000000011111111111111) (= (mask!8572 thiss!1248) #b00000000000000000111111111111111) (= (mask!8572 thiss!1248) #b00000000000000001111111111111111) (= (mask!8572 thiss!1248) #b00000000000000011111111111111111) (= (mask!8572 thiss!1248) #b00000000000000111111111111111111) (= (mask!8572 thiss!1248) #b00000000000001111111111111111111) (= (mask!8572 thiss!1248) #b00000000000011111111111111111111) (= (mask!8572 thiss!1248) #b00000000000111111111111111111111) (= (mask!8572 thiss!1248) #b00000000001111111111111111111111) (= (mask!8572 thiss!1248) #b00000000011111111111111111111111) (= (mask!8572 thiss!1248) #b00000000111111111111111111111111) (= (mask!8572 thiss!1248) #b00000001111111111111111111111111) (= (mask!8572 thiss!1248) #b00000011111111111111111111111111) (= (mask!8572 thiss!1248) #b00000111111111111111111111111111) (= (mask!8572 thiss!1248) #b00001111111111111111111111111111) (= (mask!8572 thiss!1248) #b00011111111111111111111111111111) (= (mask!8572 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8572 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176976 d!53785))

(declare-fun d!53787 () Bool)

(declare-fun e!116764 () Bool)

(assert (=> d!53787 e!116764))

(declare-fun res!83939 () Bool)

(assert (=> d!53787 (=> res!83939 e!116764)))

(declare-fun lt!87560 () Bool)

(assert (=> d!53787 (= res!83939 (not lt!87560))))

(declare-fun lt!87559 () Bool)

(assert (=> d!53787 (= lt!87560 lt!87559)))

(declare-datatypes ((Unit!5413 0))(
  ( (Unit!5414) )
))
(declare-fun lt!87557 () Unit!5413)

(declare-fun e!116765 () Unit!5413)

(assert (=> d!53787 (= lt!87557 e!116765)))

(declare-fun c!31721 () Bool)

(assert (=> d!53787 (= c!31721 lt!87559)))

(declare-fun containsKey!198 (List!2220 (_ BitVec 64)) Bool)

(assert (=> d!53787 (= lt!87559 (containsKey!198 (toList!1104 (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828))))

(assert (=> d!53787 (= (contains!1180 (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)) key!828) lt!87560)))

(declare-fun b!177079 () Bool)

(declare-fun lt!87558 () Unit!5413)

(assert (=> b!177079 (= e!116765 lt!87558)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!146 (List!2220 (_ BitVec 64)) Unit!5413)

(assert (=> b!177079 (= lt!87558 (lemmaContainsKeyImpliesGetValueByKeyDefined!146 (toList!1104 (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828))))

(declare-datatypes ((Option!201 0))(
  ( (Some!200 (v!3998 V!5169)) (None!199) )
))
(declare-fun isDefined!147 (Option!201) Bool)

(declare-fun getValueByKey!195 (List!2220 (_ BitVec 64)) Option!201)

(assert (=> b!177079 (isDefined!147 (getValueByKey!195 (toList!1104 (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828))))

(declare-fun b!177080 () Bool)

(declare-fun Unit!5415 () Unit!5413)

(assert (=> b!177080 (= e!116765 Unit!5415)))

(declare-fun b!177081 () Bool)

(assert (=> b!177081 (= e!116764 (isDefined!147 (getValueByKey!195 (toList!1104 (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248))) key!828)))))

(assert (= (and d!53787 c!31721) b!177079))

(assert (= (and d!53787 (not c!31721)) b!177080))

(assert (= (and d!53787 (not res!83939)) b!177081))

(declare-fun m!205843 () Bool)

(assert (=> d!53787 m!205843))

(declare-fun m!205845 () Bool)

(assert (=> b!177079 m!205845))

(declare-fun m!205847 () Bool)

(assert (=> b!177079 m!205847))

(assert (=> b!177079 m!205847))

(declare-fun m!205849 () Bool)

(assert (=> b!177079 m!205849))

(assert (=> b!177081 m!205847))

(assert (=> b!177081 m!205847))

(assert (=> b!177081 m!205849))

(assert (=> b!176971 d!53787))

(declare-fun b!177124 () Bool)

(declare-fun res!83963 () Bool)

(declare-fun e!116793 () Bool)

(assert (=> b!177124 (=> (not res!83963) (not e!116793))))

(declare-fun e!116803 () Bool)

(assert (=> b!177124 (= res!83963 e!116803)))

(declare-fun res!83964 () Bool)

(assert (=> b!177124 (=> res!83964 e!116803)))

(declare-fun e!116796 () Bool)

(assert (=> b!177124 (= res!83964 (not e!116796))))

(declare-fun res!83966 () Bool)

(assert (=> b!177124 (=> (not res!83966) (not e!116796))))

(assert (=> b!177124 (= res!83966 (bvslt #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))

(declare-fun bm!17896 () Bool)

(declare-fun call!17902 () ListLongMap!2177)

(declare-fun call!17899 () ListLongMap!2177)

(assert (=> bm!17896 (= call!17902 call!17899)))

(declare-fun bm!17897 () Bool)

(declare-fun call!17904 () Bool)

(declare-fun lt!87615 () ListLongMap!2177)

(assert (=> bm!17897 (= call!17904 (contains!1180 lt!87615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53789 () Bool)

(assert (=> d!53789 e!116793))

(declare-fun res!83962 () Bool)

(assert (=> d!53789 (=> (not res!83962) (not e!116793))))

(assert (=> d!53789 (= res!83962 (or (bvsge #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))))

(declare-fun lt!87618 () ListLongMap!2177)

(assert (=> d!53789 (= lt!87615 lt!87618)))

(declare-fun lt!87623 () Unit!5413)

(declare-fun e!116792 () Unit!5413)

(assert (=> d!53789 (= lt!87623 e!116792)))

(declare-fun c!31736 () Bool)

(declare-fun e!116795 () Bool)

(assert (=> d!53789 (= c!31736 e!116795)))

(declare-fun res!83959 () Bool)

(assert (=> d!53789 (=> (not res!83959) (not e!116795))))

(assert (=> d!53789 (= res!83959 (bvslt #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))

(declare-fun e!116804 () ListLongMap!2177)

(assert (=> d!53789 (= lt!87618 e!116804)))

(declare-fun c!31739 () Bool)

(assert (=> d!53789 (= c!31739 (and (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53789 (validMask!0 (mask!8572 thiss!1248))))

(assert (=> d!53789 (= (getCurrentListMap!759 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)) lt!87615)))

(declare-fun b!177125 () Bool)

(declare-fun e!116800 () Bool)

(declare-fun e!116799 () Bool)

(assert (=> b!177125 (= e!116800 e!116799)))

(declare-fun res!83958 () Bool)

(assert (=> b!177125 (= res!83958 call!17904)))

(assert (=> b!177125 (=> (not res!83958) (not e!116799))))

(declare-fun b!177126 () Bool)

(declare-fun Unit!5416 () Unit!5413)

(assert (=> b!177126 (= e!116792 Unit!5416)))

(declare-fun b!177127 () Bool)

(declare-fun e!116801 () Bool)

(assert (=> b!177127 (= e!116803 e!116801)))

(declare-fun res!83965 () Bool)

(assert (=> b!177127 (=> (not res!83965) (not e!116801))))

(assert (=> b!177127 (= res!83965 (contains!1180 lt!87615 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))

(declare-fun bm!17898 () Bool)

(declare-fun call!17901 () Bool)

(assert (=> bm!17898 (= call!17901 (contains!1180 lt!87615 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177128 () Bool)

(declare-fun e!116797 () Bool)

(declare-fun apply!139 (ListLongMap!2177 (_ BitVec 64)) V!5169)

(assert (=> b!177128 (= e!116797 (= (apply!139 lt!87615 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3484 thiss!1248)))))

(declare-fun b!177129 () Bool)

(declare-fun e!116802 () Bool)

(assert (=> b!177129 (= e!116802 (not call!17901))))

(declare-fun b!177130 () Bool)

(assert (=> b!177130 (= e!116793 e!116802)))

(declare-fun c!31734 () Bool)

(assert (=> b!177130 (= c!31734 (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177131 () Bool)

(declare-fun get!2018 (ValueCell!1727 V!5169) V!5169)

(declare-fun dynLambda!482 (Int (_ BitVec 64)) V!5169)

(assert (=> b!177131 (= e!116801 (= (apply!139 lt!87615 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)) (get!2018 (select (arr!3519 (_values!3626 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!482 (defaultEntry!3643 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3823 (_values!3626 thiss!1248))))))

(assert (=> b!177131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))

(declare-fun bm!17899 () Bool)

(declare-fun call!17903 () ListLongMap!2177)

(declare-fun call!17905 () ListLongMap!2177)

(assert (=> bm!17899 (= call!17903 call!17905)))

(declare-fun b!177132 () Bool)

(declare-fun e!116798 () ListLongMap!2177)

(assert (=> b!177132 (= e!116798 call!17902)))

(declare-fun b!177133 () Bool)

(assert (=> b!177133 (= e!116799 (= (apply!139 lt!87615 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3484 thiss!1248)))))

(declare-fun b!177134 () Bool)

(declare-fun res!83960 () Bool)

(assert (=> b!177134 (=> (not res!83960) (not e!116793))))

(assert (=> b!177134 (= res!83960 e!116800)))

(declare-fun c!31735 () Bool)

(assert (=> b!177134 (= c!31735 (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17900 () Bool)

(declare-fun call!17900 () ListLongMap!2177)

(declare-fun getCurrentListMapNoExtraKeys!170 (array!7417 array!7419 (_ BitVec 32) (_ BitVec 32) V!5169 V!5169 (_ BitVec 32) Int) ListLongMap!2177)

(assert (=> bm!17900 (= call!17900 (getCurrentListMapNoExtraKeys!170 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun c!31738 () Bool)

(declare-fun bm!17901 () Bool)

(declare-fun +!256 (ListLongMap!2177 tuple2!3244) ListLongMap!2177)

(assert (=> bm!17901 (= call!17899 (+!256 (ite c!31739 call!17900 (ite c!31738 call!17905 call!17903)) (ite (or c!31739 c!31738) (tuple2!3245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3484 thiss!1248)) (tuple2!3245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3484 thiss!1248)))))))

(declare-fun b!177135 () Bool)

(declare-fun lt!87625 () Unit!5413)

(assert (=> b!177135 (= e!116792 lt!87625)))

(declare-fun lt!87622 () ListLongMap!2177)

(assert (=> b!177135 (= lt!87622 (getCurrentListMapNoExtraKeys!170 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87605 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87612 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87612 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87611 () Unit!5413)

(declare-fun addStillContains!115 (ListLongMap!2177 (_ BitVec 64) V!5169 (_ BitVec 64)) Unit!5413)

(assert (=> b!177135 (= lt!87611 (addStillContains!115 lt!87622 lt!87605 (zeroValue!3484 thiss!1248) lt!87612))))

(assert (=> b!177135 (contains!1180 (+!256 lt!87622 (tuple2!3245 lt!87605 (zeroValue!3484 thiss!1248))) lt!87612)))

(declare-fun lt!87616 () Unit!5413)

(assert (=> b!177135 (= lt!87616 lt!87611)))

(declare-fun lt!87606 () ListLongMap!2177)

(assert (=> b!177135 (= lt!87606 (getCurrentListMapNoExtraKeys!170 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87609 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87609 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87607 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87607 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87624 () Unit!5413)

(declare-fun addApplyDifferent!115 (ListLongMap!2177 (_ BitVec 64) V!5169 (_ BitVec 64)) Unit!5413)

(assert (=> b!177135 (= lt!87624 (addApplyDifferent!115 lt!87606 lt!87609 (minValue!3484 thiss!1248) lt!87607))))

(assert (=> b!177135 (= (apply!139 (+!256 lt!87606 (tuple2!3245 lt!87609 (minValue!3484 thiss!1248))) lt!87607) (apply!139 lt!87606 lt!87607))))

(declare-fun lt!87613 () Unit!5413)

(assert (=> b!177135 (= lt!87613 lt!87624)))

(declare-fun lt!87610 () ListLongMap!2177)

(assert (=> b!177135 (= lt!87610 (getCurrentListMapNoExtraKeys!170 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87614 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87621 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87621 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87619 () Unit!5413)

(assert (=> b!177135 (= lt!87619 (addApplyDifferent!115 lt!87610 lt!87614 (zeroValue!3484 thiss!1248) lt!87621))))

(assert (=> b!177135 (= (apply!139 (+!256 lt!87610 (tuple2!3245 lt!87614 (zeroValue!3484 thiss!1248))) lt!87621) (apply!139 lt!87610 lt!87621))))

(declare-fun lt!87608 () Unit!5413)

(assert (=> b!177135 (= lt!87608 lt!87619)))

(declare-fun lt!87626 () ListLongMap!2177)

(assert (=> b!177135 (= lt!87626 (getCurrentListMapNoExtraKeys!170 (_keys!5508 thiss!1248) (_values!3626 thiss!1248) (mask!8572 thiss!1248) (extraKeys!3380 thiss!1248) (zeroValue!3484 thiss!1248) (minValue!3484 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3643 thiss!1248)))))

(declare-fun lt!87617 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87617 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87620 () (_ BitVec 64))

(assert (=> b!177135 (= lt!87620 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177135 (= lt!87625 (addApplyDifferent!115 lt!87626 lt!87617 (minValue!3484 thiss!1248) lt!87620))))

(assert (=> b!177135 (= (apply!139 (+!256 lt!87626 (tuple2!3245 lt!87617 (minValue!3484 thiss!1248))) lt!87620) (apply!139 lt!87626 lt!87620))))

(declare-fun b!177136 () Bool)

(declare-fun e!116794 () ListLongMap!2177)

(assert (=> b!177136 (= e!116794 call!17902)))

(declare-fun b!177137 () Bool)

(assert (=> b!177137 (= e!116804 e!116798)))

(assert (=> b!177137 (= c!31738 (and (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177138 () Bool)

(assert (=> b!177138 (= e!116804 (+!256 call!17899 (tuple2!3245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3484 thiss!1248))))))

(declare-fun bm!17902 () Bool)

(assert (=> bm!17902 (= call!17905 call!17900)))

(declare-fun b!177139 () Bool)

(assert (=> b!177139 (= e!116796 (validKeyInArray!0 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177140 () Bool)

(declare-fun c!31737 () Bool)

(assert (=> b!177140 (= c!31737 (and (not (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3380 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!177140 (= e!116798 e!116794)))

(declare-fun b!177141 () Bool)

(assert (=> b!177141 (= e!116802 e!116797)))

(declare-fun res!83961 () Bool)

(assert (=> b!177141 (= res!83961 call!17901)))

(assert (=> b!177141 (=> (not res!83961) (not e!116797))))

(declare-fun b!177142 () Bool)

(assert (=> b!177142 (= e!116795 (validKeyInArray!0 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177143 () Bool)

(assert (=> b!177143 (= e!116800 (not call!17904))))

(declare-fun b!177144 () Bool)

(assert (=> b!177144 (= e!116794 call!17903)))

(assert (= (and d!53789 c!31739) b!177138))

(assert (= (and d!53789 (not c!31739)) b!177137))

(assert (= (and b!177137 c!31738) b!177132))

(assert (= (and b!177137 (not c!31738)) b!177140))

(assert (= (and b!177140 c!31737) b!177136))

(assert (= (and b!177140 (not c!31737)) b!177144))

(assert (= (or b!177136 b!177144) bm!17899))

(assert (= (or b!177132 bm!17899) bm!17902))

(assert (= (or b!177132 b!177136) bm!17896))

(assert (= (or b!177138 bm!17902) bm!17900))

(assert (= (or b!177138 bm!17896) bm!17901))

(assert (= (and d!53789 res!83959) b!177142))

(assert (= (and d!53789 c!31736) b!177135))

(assert (= (and d!53789 (not c!31736)) b!177126))

(assert (= (and d!53789 res!83962) b!177124))

(assert (= (and b!177124 res!83966) b!177139))

(assert (= (and b!177124 (not res!83964)) b!177127))

(assert (= (and b!177127 res!83965) b!177131))

(assert (= (and b!177124 res!83963) b!177134))

(assert (= (and b!177134 c!31735) b!177125))

(assert (= (and b!177134 (not c!31735)) b!177143))

(assert (= (and b!177125 res!83958) b!177133))

(assert (= (or b!177125 b!177143) bm!17897))

(assert (= (and b!177134 res!83960) b!177130))

(assert (= (and b!177130 c!31734) b!177141))

(assert (= (and b!177130 (not c!31734)) b!177129))

(assert (= (and b!177141 res!83961) b!177128))

(assert (= (or b!177141 b!177129) bm!17898))

(declare-fun b_lambda!7069 () Bool)

(assert (=> (not b_lambda!7069) (not b!177131)))

(declare-fun t!7044 () Bool)

(declare-fun tb!2781 () Bool)

(assert (=> (and b!176972 (= (defaultEntry!3643 thiss!1248) (defaultEntry!3643 thiss!1248)) t!7044) tb!2781))

(declare-fun result!4633 () Bool)

(assert (=> tb!2781 (= result!4633 tp_is_empty!4141)))

(assert (=> b!177131 t!7044))

(declare-fun b_and!10887 () Bool)

(assert (= b_and!10881 (and (=> t!7044 result!4633) b_and!10887)))

(declare-fun m!205851 () Bool)

(assert (=> b!177138 m!205851))

(declare-fun m!205853 () Bool)

(assert (=> bm!17900 m!205853))

(declare-fun m!205855 () Bool)

(assert (=> b!177142 m!205855))

(assert (=> b!177142 m!205855))

(declare-fun m!205857 () Bool)

(assert (=> b!177142 m!205857))

(declare-fun m!205859 () Bool)

(assert (=> bm!17901 m!205859))

(declare-fun m!205861 () Bool)

(assert (=> bm!17897 m!205861))

(declare-fun m!205863 () Bool)

(assert (=> bm!17898 m!205863))

(assert (=> b!177131 m!205855))

(declare-fun m!205865 () Bool)

(assert (=> b!177131 m!205865))

(assert (=> b!177131 m!205855))

(declare-fun m!205867 () Bool)

(assert (=> b!177131 m!205867))

(assert (=> b!177131 m!205867))

(declare-fun m!205869 () Bool)

(assert (=> b!177131 m!205869))

(declare-fun m!205871 () Bool)

(assert (=> b!177131 m!205871))

(assert (=> b!177131 m!205869))

(declare-fun m!205873 () Bool)

(assert (=> b!177128 m!205873))

(assert (=> d!53789 m!205775))

(assert (=> b!177127 m!205855))

(assert (=> b!177127 m!205855))

(declare-fun m!205875 () Bool)

(assert (=> b!177127 m!205875))

(assert (=> b!177139 m!205855))

(assert (=> b!177139 m!205855))

(assert (=> b!177139 m!205857))

(declare-fun m!205877 () Bool)

(assert (=> b!177135 m!205877))

(declare-fun m!205879 () Bool)

(assert (=> b!177135 m!205879))

(declare-fun m!205881 () Bool)

(assert (=> b!177135 m!205881))

(assert (=> b!177135 m!205877))

(declare-fun m!205883 () Bool)

(assert (=> b!177135 m!205883))

(assert (=> b!177135 m!205881))

(declare-fun m!205885 () Bool)

(assert (=> b!177135 m!205885))

(declare-fun m!205887 () Bool)

(assert (=> b!177135 m!205887))

(declare-fun m!205889 () Bool)

(assert (=> b!177135 m!205889))

(declare-fun m!205891 () Bool)

(assert (=> b!177135 m!205891))

(assert (=> b!177135 m!205853))

(declare-fun m!205893 () Bool)

(assert (=> b!177135 m!205893))

(declare-fun m!205895 () Bool)

(assert (=> b!177135 m!205895))

(declare-fun m!205897 () Bool)

(assert (=> b!177135 m!205897))

(declare-fun m!205899 () Bool)

(assert (=> b!177135 m!205899))

(assert (=> b!177135 m!205887))

(declare-fun m!205901 () Bool)

(assert (=> b!177135 m!205901))

(assert (=> b!177135 m!205855))

(declare-fun m!205903 () Bool)

(assert (=> b!177135 m!205903))

(assert (=> b!177135 m!205879))

(declare-fun m!205905 () Bool)

(assert (=> b!177135 m!205905))

(declare-fun m!205907 () Bool)

(assert (=> b!177133 m!205907))

(assert (=> b!176971 d!53789))

(declare-fun d!53791 () Bool)

(assert (=> d!53791 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176975 d!53791))

(declare-fun d!53793 () Bool)

(assert (=> d!53793 (= (array_inv!2271 (_keys!5508 thiss!1248)) (bvsge (size!3822 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176972 d!53793))

(declare-fun d!53795 () Bool)

(assert (=> d!53795 (= (array_inv!2272 (_values!3626 thiss!1248)) (bvsge (size!3823 (_values!3626 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176972 d!53795))

(declare-fun d!53797 () Bool)

(declare-fun res!83973 () Bool)

(declare-fun e!116807 () Bool)

(assert (=> d!53797 (=> (not res!83973) (not e!116807))))

(declare-fun simpleValid!153 (LongMapFixedSize!2362) Bool)

(assert (=> d!53797 (= res!83973 (simpleValid!153 thiss!1248))))

(assert (=> d!53797 (= (valid!1011 thiss!1248) e!116807)))

(declare-fun b!177153 () Bool)

(declare-fun res!83974 () Bool)

(assert (=> b!177153 (=> (not res!83974) (not e!116807))))

(declare-fun arrayCountValidKeys!0 (array!7417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177153 (= res!83974 (= (arrayCountValidKeys!0 (_keys!5508 thiss!1248) #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))) (_size!1230 thiss!1248)))))

(declare-fun b!177154 () Bool)

(declare-fun res!83975 () Bool)

(assert (=> b!177154 (=> (not res!83975) (not e!116807))))

(assert (=> b!177154 (= res!83975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5508 thiss!1248) (mask!8572 thiss!1248)))))

(declare-fun b!177155 () Bool)

(assert (=> b!177155 (= e!116807 (arrayNoDuplicates!0 (_keys!5508 thiss!1248) #b00000000000000000000000000000000 Nil!2218))))

(assert (= (and d!53797 res!83973) b!177153))

(assert (= (and b!177153 res!83974) b!177154))

(assert (= (and b!177154 res!83975) b!177155))

(declare-fun m!205909 () Bool)

(assert (=> d!53797 m!205909))

(declare-fun m!205911 () Bool)

(assert (=> b!177153 m!205911))

(assert (=> b!177154 m!205777))

(assert (=> b!177155 m!205773))

(assert (=> start!17700 d!53797))

(declare-fun b!177166 () Bool)

(declare-fun e!116819 () Bool)

(declare-fun e!116816 () Bool)

(assert (=> b!177166 (= e!116819 e!116816)))

(declare-fun c!31742 () Bool)

(assert (=> b!177166 (= c!31742 (validKeyInArray!0 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177167 () Bool)

(declare-fun e!116818 () Bool)

(assert (=> b!177167 (= e!116818 e!116819)))

(declare-fun res!83984 () Bool)

(assert (=> b!177167 (=> (not res!83984) (not e!116819))))

(declare-fun e!116817 () Bool)

(assert (=> b!177167 (= res!83984 (not e!116817))))

(declare-fun res!83982 () Bool)

(assert (=> b!177167 (=> (not res!83982) (not e!116817))))

(assert (=> b!177167 (= res!83982 (validKeyInArray!0 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177168 () Bool)

(declare-fun call!17908 () Bool)

(assert (=> b!177168 (= e!116816 call!17908)))

(declare-fun b!177169 () Bool)

(assert (=> b!177169 (= e!116816 call!17908)))

(declare-fun bm!17905 () Bool)

(assert (=> bm!17905 (= call!17908 (arrayNoDuplicates!0 (_keys!5508 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31742 (Cons!2217 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000) Nil!2218) Nil!2218)))))

(declare-fun d!53799 () Bool)

(declare-fun res!83983 () Bool)

(assert (=> d!53799 (=> res!83983 e!116818)))

(assert (=> d!53799 (= res!83983 (bvsge #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))

(assert (=> d!53799 (= (arrayNoDuplicates!0 (_keys!5508 thiss!1248) #b00000000000000000000000000000000 Nil!2218) e!116818)))

(declare-fun b!177170 () Bool)

(declare-fun contains!1182 (List!2221 (_ BitVec 64)) Bool)

(assert (=> b!177170 (= e!116817 (contains!1182 Nil!2218 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53799 (not res!83983)) b!177167))

(assert (= (and b!177167 res!83982) b!177170))

(assert (= (and b!177167 res!83984) b!177166))

(assert (= (and b!177166 c!31742) b!177168))

(assert (= (and b!177166 (not c!31742)) b!177169))

(assert (= (or b!177168 b!177169) bm!17905))

(assert (=> b!177166 m!205855))

(assert (=> b!177166 m!205855))

(assert (=> b!177166 m!205857))

(assert (=> b!177167 m!205855))

(assert (=> b!177167 m!205855))

(assert (=> b!177167 m!205857))

(assert (=> bm!17905 m!205855))

(declare-fun m!205913 () Bool)

(assert (=> bm!17905 m!205913))

(assert (=> b!177170 m!205855))

(assert (=> b!177170 m!205855))

(declare-fun m!205915 () Bool)

(assert (=> b!177170 m!205915))

(assert (=> b!176979 d!53799))

(declare-fun b!177179 () Bool)

(declare-fun e!116827 () Bool)

(declare-fun call!17911 () Bool)

(assert (=> b!177179 (= e!116827 call!17911)))

(declare-fun b!177180 () Bool)

(declare-fun e!116828 () Bool)

(assert (=> b!177180 (= e!116828 call!17911)))

(declare-fun bm!17908 () Bool)

(assert (=> bm!17908 (= call!17911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5508 thiss!1248) (mask!8572 thiss!1248)))))

(declare-fun d!53801 () Bool)

(declare-fun res!83990 () Bool)

(declare-fun e!116826 () Bool)

(assert (=> d!53801 (=> res!83990 e!116826)))

(assert (=> d!53801 (= res!83990 (bvsge #b00000000000000000000000000000000 (size!3822 (_keys!5508 thiss!1248))))))

(assert (=> d!53801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5508 thiss!1248) (mask!8572 thiss!1248)) e!116826)))

(declare-fun b!177181 () Bool)

(assert (=> b!177181 (= e!116828 e!116827)))

(declare-fun lt!87634 () (_ BitVec 64))

(assert (=> b!177181 (= lt!87634 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87633 () Unit!5413)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7417 (_ BitVec 64) (_ BitVec 32)) Unit!5413)

(assert (=> b!177181 (= lt!87633 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5508 thiss!1248) lt!87634 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177181 (arrayContainsKey!0 (_keys!5508 thiss!1248) lt!87634 #b00000000000000000000000000000000)))

(declare-fun lt!87635 () Unit!5413)

(assert (=> b!177181 (= lt!87635 lt!87633)))

(declare-fun res!83989 () Bool)

(assert (=> b!177181 (= res!83989 (= (seekEntryOrOpen!0 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000) (_keys!5508 thiss!1248) (mask!8572 thiss!1248)) (Found!557 #b00000000000000000000000000000000)))))

(assert (=> b!177181 (=> (not res!83989) (not e!116827))))

(declare-fun b!177182 () Bool)

(assert (=> b!177182 (= e!116826 e!116828)))

(declare-fun c!31745 () Bool)

(assert (=> b!177182 (= c!31745 (validKeyInArray!0 (select (arr!3518 (_keys!5508 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53801 (not res!83990)) b!177182))

(assert (= (and b!177182 c!31745) b!177181))

(assert (= (and b!177182 (not c!31745)) b!177180))

(assert (= (and b!177181 res!83989) b!177179))

(assert (= (or b!177179 b!177180) bm!17908))

(declare-fun m!205917 () Bool)

(assert (=> bm!17908 m!205917))

(assert (=> b!177181 m!205855))

(declare-fun m!205919 () Bool)

(assert (=> b!177181 m!205919))

(declare-fun m!205921 () Bool)

(assert (=> b!177181 m!205921))

(assert (=> b!177181 m!205855))

(declare-fun m!205923 () Bool)

(assert (=> b!177181 m!205923))

(assert (=> b!177182 m!205855))

(assert (=> b!177182 m!205855))

(assert (=> b!177182 m!205857))

(assert (=> b!176974 d!53801))

(declare-fun mapNonEmpty!7080 () Bool)

(declare-fun mapRes!7080 () Bool)

(declare-fun tp!15819 () Bool)

(declare-fun e!116834 () Bool)

(assert (=> mapNonEmpty!7080 (= mapRes!7080 (and tp!15819 e!116834))))

(declare-fun mapRest!7080 () (Array (_ BitVec 32) ValueCell!1727))

(declare-fun mapValue!7080 () ValueCell!1727)

(declare-fun mapKey!7080 () (_ BitVec 32))

(assert (=> mapNonEmpty!7080 (= mapRest!7071 (store mapRest!7080 mapKey!7080 mapValue!7080))))

(declare-fun mapIsEmpty!7080 () Bool)

(assert (=> mapIsEmpty!7080 mapRes!7080))

(declare-fun condMapEmpty!7080 () Bool)

(declare-fun mapDefault!7080 () ValueCell!1727)

(assert (=> mapNonEmpty!7071 (= condMapEmpty!7080 (= mapRest!7071 ((as const (Array (_ BitVec 32) ValueCell!1727)) mapDefault!7080)))))

(declare-fun e!116833 () Bool)

(assert (=> mapNonEmpty!7071 (= tp!15803 (and e!116833 mapRes!7080))))

(declare-fun b!177189 () Bool)

(assert (=> b!177189 (= e!116834 tp_is_empty!4141)))

(declare-fun b!177190 () Bool)

(assert (=> b!177190 (= e!116833 tp_is_empty!4141)))

(assert (= (and mapNonEmpty!7071 condMapEmpty!7080) mapIsEmpty!7080))

(assert (= (and mapNonEmpty!7071 (not condMapEmpty!7080)) mapNonEmpty!7080))

(assert (= (and mapNonEmpty!7080 ((_ is ValueCellFull!1727) mapValue!7080)) b!177189))

(assert (= (and mapNonEmpty!7071 ((_ is ValueCellFull!1727) mapDefault!7080)) b!177190))

(declare-fun m!205925 () Bool)

(assert (=> mapNonEmpty!7080 m!205925))

(declare-fun b_lambda!7071 () Bool)

(assert (= b_lambda!7069 (or (and b!176972 b_free!4369) b_lambda!7071)))

(check-sat (not b!177135) (not b!177128) (not bm!17901) (not b!177153) (not bm!17900) (not d!53797) (not bm!17905) (not bm!17908) (not b!177081) (not b!177166) (not b!177079) tp_is_empty!4141 (not bm!17897) (not b_lambda!7071) b_and!10887 (not b!177131) (not d!53787) (not b!177138) (not b!177139) (not b!177133) (not b!177167) (not d!53783) (not mapNonEmpty!7080) (not d!53789) (not b!177142) (not b!177127) (not b!177182) (not bm!17898) (not b!177170) (not b!177181) (not b!177154) (not b!177072) (not b!177155) (not b_next!4369))
(check-sat b_and!10887 (not b_next!4369))
