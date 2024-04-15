; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80846 () Bool)

(assert start!80846)

(declare-fun b!947408 () Bool)

(declare-fun b_free!18181 () Bool)

(declare-fun b_next!18181 () Bool)

(assert (=> b!947408 (= b_free!18181 (not b_next!18181))))

(declare-fun tp!63109 () Bool)

(declare-fun b_and!29577 () Bool)

(assert (=> b!947408 (= tp!63109 b_and!29577)))

(declare-fun b!947402 () Bool)

(declare-fun e!533250 () Bool)

(declare-fun tp_is_empty!20689 () Bool)

(assert (=> b!947402 (= e!533250 tp_is_empty!20689)))

(declare-fun b!947403 () Bool)

(declare-fun e!533247 () Bool)

(declare-fun e!533248 () Bool)

(assert (=> b!947403 (= e!533247 e!533248)))

(declare-fun res!635848 () Bool)

(assert (=> b!947403 (=> (not res!635848) (not e!533248))))

(declare-datatypes ((SeekEntryResult!9118 0))(
  ( (MissingZero!9118 (index!38843 (_ BitVec 32))) (Found!9118 (index!38844 (_ BitVec 32))) (Intermediate!9118 (undefined!9930 Bool) (index!38845 (_ BitVec 32)) (x!81529 (_ BitVec 32))) (Undefined!9118) (MissingVacant!9118 (index!38846 (_ BitVec 32))) )
))
(declare-fun lt!426395 () SeekEntryResult!9118)

(get-info :version)

(assert (=> b!947403 (= res!635848 ((_ is Found!9118) lt!426395))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32551 0))(
  ( (V!32552 (val!10395 Int)) )
))
(declare-datatypes ((ValueCell!9863 0))(
  ( (ValueCellFull!9863 (v!12928 V!32551)) (EmptyCell!9863) )
))
(declare-datatypes ((array!57343 0))(
  ( (array!57344 (arr!27581 (Array (_ BitVec 32) ValueCell!9863)) (size!28056 (_ BitVec 32))) )
))
(declare-datatypes ((array!57345 0))(
  ( (array!57346 (arr!27582 (Array (_ BitVec 32) (_ BitVec 64))) (size!28057 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4876 0))(
  ( (LongMapFixedSize!4877 (defaultEntry!5735 Int) (mask!27473 (_ BitVec 32)) (extraKeys!5467 (_ BitVec 32)) (zeroValue!5571 V!32551) (minValue!5571 V!32551) (_size!2493 (_ BitVec 32)) (_keys!10643 array!57345) (_values!5758 array!57343) (_vacant!2493 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4876)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57345 (_ BitVec 32)) SeekEntryResult!9118)

(assert (=> b!947403 (= lt!426395 (seekEntry!0 key!756 (_keys!10643 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun b!947404 () Bool)

(declare-fun e!533251 () Bool)

(assert (=> b!947404 (= e!533251 tp_is_empty!20689)))

(declare-fun b!947405 () Bool)

(declare-fun e!533249 () Bool)

(declare-fun mapRes!32914 () Bool)

(assert (=> b!947405 (= e!533249 (and e!533250 mapRes!32914))))

(declare-fun condMapEmpty!32914 () Bool)

(declare-fun mapDefault!32914 () ValueCell!9863)

(assert (=> b!947405 (= condMapEmpty!32914 (= (arr!27581 (_values!5758 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9863)) mapDefault!32914)))))

(declare-fun res!635847 () Bool)

(assert (=> start!80846 (=> (not res!635847) (not e!533247))))

(declare-fun valid!1861 (LongMapFixedSize!4876) Bool)

(assert (=> start!80846 (= res!635847 (valid!1861 thiss!1141))))

(assert (=> start!80846 e!533247))

(declare-fun e!533245 () Bool)

(assert (=> start!80846 e!533245))

(assert (=> start!80846 true))

(declare-fun mapNonEmpty!32914 () Bool)

(declare-fun tp!63108 () Bool)

(assert (=> mapNonEmpty!32914 (= mapRes!32914 (and tp!63108 e!533251))))

(declare-fun mapValue!32914 () ValueCell!9863)

(declare-fun mapKey!32914 () (_ BitVec 32))

(declare-fun mapRest!32914 () (Array (_ BitVec 32) ValueCell!9863))

(assert (=> mapNonEmpty!32914 (= (arr!27581 (_values!5758 thiss!1141)) (store mapRest!32914 mapKey!32914 mapValue!32914))))

(declare-fun mapIsEmpty!32914 () Bool)

(assert (=> mapIsEmpty!32914 mapRes!32914))

(declare-fun b!947406 () Bool)

(declare-datatypes ((tuple2!13558 0))(
  ( (tuple2!13559 (_1!6790 (_ BitVec 64)) (_2!6790 V!32551)) )
))
(declare-datatypes ((List!19312 0))(
  ( (Nil!19309) (Cons!19308 (h!20464 tuple2!13558) (t!27624 List!19312)) )
))
(declare-datatypes ((ListLongMap!12245 0))(
  ( (ListLongMap!12246 (toList!6138 List!19312)) )
))
(declare-fun contains!5163 (ListLongMap!12245 (_ BitVec 64)) Bool)

(declare-fun map!13050 (LongMapFixedSize!4876) ListLongMap!12245)

(assert (=> b!947406 (= e!533248 (not (contains!5163 (map!13050 thiss!1141) key!756)))))

(declare-fun getCurrentListMap!3300 (array!57345 array!57343 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) ListLongMap!12245)

(assert (=> b!947406 (contains!5163 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395)))))

(declare-datatypes ((Unit!31812 0))(
  ( (Unit!31813) )
))
(declare-fun lt!426397 () Unit!31812)

(declare-fun lemmaValidKeyInArrayIsInListMap!266 (array!57345 array!57343 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) Unit!31812)

(assert (=> b!947406 (= lt!426397 (lemmaValidKeyInArrayIsInListMap!266 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38844 lt!426395) (defaultEntry!5735 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947406 (arrayContainsKey!0 (_keys!10643 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426396 () Unit!31812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57345 (_ BitVec 64) (_ BitVec 32)) Unit!31812)

(assert (=> b!947406 (= lt!426396 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10643 thiss!1141) key!756 (index!38844 lt!426395)))))

(declare-fun b!947407 () Bool)

(declare-fun res!635849 () Bool)

(assert (=> b!947407 (=> (not res!635849) (not e!533247))))

(assert (=> b!947407 (= res!635849 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21468 (array!57345) Bool)

(declare-fun array_inv!21469 (array!57343) Bool)

(assert (=> b!947408 (= e!533245 (and tp!63109 tp_is_empty!20689 (array_inv!21468 (_keys!10643 thiss!1141)) (array_inv!21469 (_values!5758 thiss!1141)) e!533249))))

(assert (= (and start!80846 res!635847) b!947407))

(assert (= (and b!947407 res!635849) b!947403))

(assert (= (and b!947403 res!635848) b!947406))

(assert (= (and b!947405 condMapEmpty!32914) mapIsEmpty!32914))

(assert (= (and b!947405 (not condMapEmpty!32914)) mapNonEmpty!32914))

(assert (= (and mapNonEmpty!32914 ((_ is ValueCellFull!9863) mapValue!32914)) b!947404))

(assert (= (and b!947405 ((_ is ValueCellFull!9863) mapDefault!32914)) b!947402))

(assert (= b!947408 b!947405))

(assert (= start!80846 b!947408))

(declare-fun m!879757 () Bool)

(assert (=> mapNonEmpty!32914 m!879757))

(declare-fun m!879759 () Bool)

(assert (=> b!947406 m!879759))

(declare-fun m!879761 () Bool)

(assert (=> b!947406 m!879761))

(declare-fun m!879763 () Bool)

(assert (=> b!947406 m!879763))

(declare-fun m!879765 () Bool)

(assert (=> b!947406 m!879765))

(declare-fun m!879767 () Bool)

(assert (=> b!947406 m!879767))

(assert (=> b!947406 m!879759))

(declare-fun m!879769 () Bool)

(assert (=> b!947406 m!879769))

(declare-fun m!879771 () Bool)

(assert (=> b!947406 m!879771))

(assert (=> b!947406 m!879761))

(declare-fun m!879773 () Bool)

(assert (=> b!947406 m!879773))

(assert (=> b!947406 m!879765))

(declare-fun m!879775 () Bool)

(assert (=> b!947403 m!879775))

(declare-fun m!879777 () Bool)

(assert (=> start!80846 m!879777))

(declare-fun m!879779 () Bool)

(assert (=> b!947408 m!879779))

(declare-fun m!879781 () Bool)

(assert (=> b!947408 m!879781))

(check-sat (not b_next!18181) (not mapNonEmpty!32914) (not b!947408) tp_is_empty!20689 (not start!80846) (not b!947403) (not b!947406) b_and!29577)
(check-sat b_and!29577 (not b_next!18181))
(get-model)

(declare-fun d!114513 () Bool)

(declare-fun lt!426426 () SeekEntryResult!9118)

(assert (=> d!114513 (and (or ((_ is MissingVacant!9118) lt!426426) (not ((_ is Found!9118) lt!426426)) (and (bvsge (index!38844 lt!426426) #b00000000000000000000000000000000) (bvslt (index!38844 lt!426426) (size!28057 (_keys!10643 thiss!1141))))) (not ((_ is MissingVacant!9118) lt!426426)) (or (not ((_ is Found!9118) lt!426426)) (= (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426426)) key!756)))))

(declare-fun e!533301 () SeekEntryResult!9118)

(assert (=> d!114513 (= lt!426426 e!533301)))

(declare-fun c!98659 () Bool)

(declare-fun lt!426425 () SeekEntryResult!9118)

(assert (=> d!114513 (= c!98659 (and ((_ is Intermediate!9118) lt!426425) (undefined!9930 lt!426425)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57345 (_ BitVec 32)) SeekEntryResult!9118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114513 (= lt!426425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27473 thiss!1141)) key!756 (_keys!10643 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114513 (validMask!0 (mask!27473 thiss!1141))))

(assert (=> d!114513 (= (seekEntry!0 key!756 (_keys!10643 thiss!1141) (mask!27473 thiss!1141)) lt!426426)))

(declare-fun b!947463 () Bool)

(declare-fun e!533302 () SeekEntryResult!9118)

(assert (=> b!947463 (= e!533302 (MissingZero!9118 (index!38845 lt!426425)))))

(declare-fun b!947464 () Bool)

(assert (=> b!947464 (= e!533301 Undefined!9118)))

(declare-fun b!947465 () Bool)

(declare-fun e!533300 () SeekEntryResult!9118)

(assert (=> b!947465 (= e!533300 (Found!9118 (index!38845 lt!426425)))))

(declare-fun b!947466 () Bool)

(assert (=> b!947466 (= e!533301 e!533300)))

(declare-fun lt!426427 () (_ BitVec 64))

(assert (=> b!947466 (= lt!426427 (select (arr!27582 (_keys!10643 thiss!1141)) (index!38845 lt!426425)))))

(declare-fun c!98660 () Bool)

(assert (=> b!947466 (= c!98660 (= lt!426427 key!756))))

(declare-fun b!947467 () Bool)

(declare-fun c!98661 () Bool)

(assert (=> b!947467 (= c!98661 (= lt!426427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947467 (= e!533300 e!533302)))

(declare-fun b!947468 () Bool)

(declare-fun lt!426424 () SeekEntryResult!9118)

(assert (=> b!947468 (= e!533302 (ite ((_ is MissingVacant!9118) lt!426424) (MissingZero!9118 (index!38846 lt!426424)) lt!426424))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57345 (_ BitVec 32)) SeekEntryResult!9118)

(assert (=> b!947468 (= lt!426424 (seekKeyOrZeroReturnVacant!0 (x!81529 lt!426425) (index!38845 lt!426425) (index!38845 lt!426425) key!756 (_keys!10643 thiss!1141) (mask!27473 thiss!1141)))))

(assert (= (and d!114513 c!98659) b!947464))

(assert (= (and d!114513 (not c!98659)) b!947466))

(assert (= (and b!947466 c!98660) b!947465))

(assert (= (and b!947466 (not c!98660)) b!947467))

(assert (= (and b!947467 c!98661) b!947463))

(assert (= (and b!947467 (not c!98661)) b!947468))

(declare-fun m!879835 () Bool)

(assert (=> d!114513 m!879835))

(declare-fun m!879837 () Bool)

(assert (=> d!114513 m!879837))

(assert (=> d!114513 m!879837))

(declare-fun m!879839 () Bool)

(assert (=> d!114513 m!879839))

(declare-fun m!879841 () Bool)

(assert (=> d!114513 m!879841))

(declare-fun m!879843 () Bool)

(assert (=> b!947466 m!879843))

(declare-fun m!879845 () Bool)

(assert (=> b!947468 m!879845))

(assert (=> b!947403 d!114513))

(declare-fun d!114515 () Bool)

(declare-fun res!635874 () Bool)

(declare-fun e!533305 () Bool)

(assert (=> d!114515 (=> (not res!635874) (not e!533305))))

(declare-fun simpleValid!365 (LongMapFixedSize!4876) Bool)

(assert (=> d!114515 (= res!635874 (simpleValid!365 thiss!1141))))

(assert (=> d!114515 (= (valid!1861 thiss!1141) e!533305)))

(declare-fun b!947475 () Bool)

(declare-fun res!635875 () Bool)

(assert (=> b!947475 (=> (not res!635875) (not e!533305))))

(declare-fun arrayCountValidKeys!0 (array!57345 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947475 (= res!635875 (= (arrayCountValidKeys!0 (_keys!10643 thiss!1141) #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))) (_size!2493 thiss!1141)))))

(declare-fun b!947476 () Bool)

(declare-fun res!635876 () Bool)

(assert (=> b!947476 (=> (not res!635876) (not e!533305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57345 (_ BitVec 32)) Bool)

(assert (=> b!947476 (= res!635876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10643 thiss!1141) (mask!27473 thiss!1141)))))

(declare-fun b!947477 () Bool)

(declare-datatypes ((List!19314 0))(
  ( (Nil!19311) (Cons!19310 (h!20466 (_ BitVec 64)) (t!27628 List!19314)) )
))
(declare-fun arrayNoDuplicates!0 (array!57345 (_ BitVec 32) List!19314) Bool)

(assert (=> b!947477 (= e!533305 (arrayNoDuplicates!0 (_keys!10643 thiss!1141) #b00000000000000000000000000000000 Nil!19311))))

(assert (= (and d!114515 res!635874) b!947475))

(assert (= (and b!947475 res!635875) b!947476))

(assert (= (and b!947476 res!635876) b!947477))

(declare-fun m!879847 () Bool)

(assert (=> d!114515 m!879847))

(declare-fun m!879849 () Bool)

(assert (=> b!947475 m!879849))

(declare-fun m!879851 () Bool)

(assert (=> b!947476 m!879851))

(declare-fun m!879853 () Bool)

(assert (=> b!947477 m!879853))

(assert (=> start!80846 d!114515))

(declare-fun b!947520 () Bool)

(declare-fun e!533342 () Bool)

(declare-fun e!533336 () Bool)

(assert (=> b!947520 (= e!533342 e!533336)))

(declare-fun c!98679 () Bool)

(assert (=> b!947520 (= c!98679 (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41110 () Bool)

(declare-fun call!41118 () ListLongMap!12245)

(declare-fun call!41116 () ListLongMap!12245)

(assert (=> bm!41110 (= call!41118 call!41116)))

(declare-fun b!947521 () Bool)

(declare-fun e!533343 () ListLongMap!12245)

(declare-fun e!533344 () ListLongMap!12245)

(assert (=> b!947521 (= e!533343 e!533344)))

(declare-fun c!98676 () Bool)

(assert (=> b!947521 (= c!98676 (and (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!947522 () Bool)

(declare-fun e!533332 () Bool)

(declare-fun e!533338 () Bool)

(assert (=> b!947522 (= e!533332 e!533338)))

(declare-fun res!635902 () Bool)

(declare-fun call!41117 () Bool)

(assert (=> b!947522 (= res!635902 call!41117)))

(assert (=> b!947522 (=> (not res!635902) (not e!533338))))

(declare-fun b!947524 () Bool)

(declare-fun res!635899 () Bool)

(assert (=> b!947524 (=> (not res!635899) (not e!533342))))

(declare-fun e!533341 () Bool)

(assert (=> b!947524 (= res!635899 e!533341)))

(declare-fun res!635897 () Bool)

(assert (=> b!947524 (=> res!635897 e!533341)))

(declare-fun e!533337 () Bool)

(assert (=> b!947524 (= res!635897 (not e!533337))))

(declare-fun res!635903 () Bool)

(assert (=> b!947524 (=> (not res!635903) (not e!533337))))

(assert (=> b!947524 (= res!635903 (bvslt #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))))))

(declare-fun bm!41111 () Bool)

(declare-fun call!41115 () Bool)

(declare-fun lt!426480 () ListLongMap!12245)

(assert (=> bm!41111 (= call!41115 (contains!5163 lt!426480 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947525 () Bool)

(declare-fun call!41119 () ListLongMap!12245)

(declare-fun +!2872 (ListLongMap!12245 tuple2!13558) ListLongMap!12245)

(assert (=> b!947525 (= e!533343 (+!2872 call!41119 (tuple2!13559 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5571 thiss!1141))))))

(declare-fun b!947526 () Bool)

(declare-fun e!533335 () Bool)

(assert (=> b!947526 (= e!533341 e!533335)))

(declare-fun res!635896 () Bool)

(assert (=> b!947526 (=> (not res!635896) (not e!533335))))

(assert (=> b!947526 (= res!635896 (contains!5163 lt!426480 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!947526 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))))))

(declare-fun b!947527 () Bool)

(declare-fun call!41113 () ListLongMap!12245)

(assert (=> b!947527 (= e!533344 call!41113)))

(declare-fun b!947528 () Bool)

(declare-fun e!533333 () ListLongMap!12245)

(assert (=> b!947528 (= e!533333 call!41113)))

(declare-fun b!947529 () Bool)

(declare-fun res!635900 () Bool)

(assert (=> b!947529 (=> (not res!635900) (not e!533342))))

(assert (=> b!947529 (= res!635900 e!533332)))

(declare-fun c!98675 () Bool)

(assert (=> b!947529 (= c!98675 (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41112 () Bool)

(assert (=> bm!41112 (= call!41117 (contains!5163 lt!426480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947530 () Bool)

(declare-fun apply!862 (ListLongMap!12245 (_ BitVec 64)) V!32551)

(assert (=> b!947530 (= e!533338 (= (apply!862 lt!426480 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5571 thiss!1141)))))

(declare-fun c!98678 () Bool)

(declare-fun bm!41113 () Bool)

(declare-fun call!41114 () ListLongMap!12245)

(assert (=> bm!41113 (= call!41119 (+!2872 (ite c!98678 call!41114 (ite c!98676 call!41116 call!41118)) (ite (or c!98678 c!98676) (tuple2!13559 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5571 thiss!1141)) (tuple2!13559 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5571 thiss!1141)))))))

(declare-fun b!947531 () Bool)

(declare-fun e!533339 () Unit!31812)

(declare-fun Unit!31816 () Unit!31812)

(assert (=> b!947531 (= e!533339 Unit!31816)))

(declare-fun b!947532 () Bool)

(declare-fun e!533334 () Bool)

(assert (=> b!947532 (= e!533336 e!533334)))

(declare-fun res!635895 () Bool)

(assert (=> b!947532 (= res!635895 call!41115)))

(assert (=> b!947532 (=> (not res!635895) (not e!533334))))

(declare-fun b!947533 () Bool)

(assert (=> b!947533 (= e!533333 call!41118)))

(declare-fun b!947534 () Bool)

(declare-fun c!98674 () Bool)

(assert (=> b!947534 (= c!98674 (and (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!947534 (= e!533344 e!533333)))

(declare-fun d!114517 () Bool)

(assert (=> d!114517 e!533342))

(declare-fun res!635901 () Bool)

(assert (=> d!114517 (=> (not res!635901) (not e!533342))))

(assert (=> d!114517 (= res!635901 (or (bvsge #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))))))))

(declare-fun lt!426481 () ListLongMap!12245)

(assert (=> d!114517 (= lt!426480 lt!426481)))

(declare-fun lt!426483 () Unit!31812)

(assert (=> d!114517 (= lt!426483 e!533339)))

(declare-fun c!98677 () Bool)

(declare-fun e!533340 () Bool)

(assert (=> d!114517 (= c!98677 e!533340)))

(declare-fun res!635898 () Bool)

(assert (=> d!114517 (=> (not res!635898) (not e!533340))))

(assert (=> d!114517 (= res!635898 (bvslt #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))))))

(assert (=> d!114517 (= lt!426481 e!533343)))

(assert (=> d!114517 (= c!98678 (and (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114517 (validMask!0 (mask!27473 thiss!1141))))

(assert (=> d!114517 (= (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) lt!426480)))

(declare-fun b!947523 () Bool)

(assert (=> b!947523 (= e!533332 (not call!41117))))

(declare-fun b!947535 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947535 (= e!533340 (validKeyInArray!0 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947536 () Bool)

(declare-fun lt!426475 () Unit!31812)

(assert (=> b!947536 (= e!533339 lt!426475)))

(declare-fun lt!426474 () ListLongMap!12245)

(declare-fun getCurrentListMapNoExtraKeys!3344 (array!57345 array!57343 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) ListLongMap!12245)

(assert (=> b!947536 (= lt!426474 (getCurrentListMapNoExtraKeys!3344 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!426491 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426482 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426482 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426489 () Unit!31812)

(declare-fun addStillContains!561 (ListLongMap!12245 (_ BitVec 64) V!32551 (_ BitVec 64)) Unit!31812)

(assert (=> b!947536 (= lt!426489 (addStillContains!561 lt!426474 lt!426491 (zeroValue!5571 thiss!1141) lt!426482))))

(assert (=> b!947536 (contains!5163 (+!2872 lt!426474 (tuple2!13559 lt!426491 (zeroValue!5571 thiss!1141))) lt!426482)))

(declare-fun lt!426477 () Unit!31812)

(assert (=> b!947536 (= lt!426477 lt!426489)))

(declare-fun lt!426479 () ListLongMap!12245)

(assert (=> b!947536 (= lt!426479 (getCurrentListMapNoExtraKeys!3344 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!426490 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426490 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426486 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426486 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426487 () Unit!31812)

(declare-fun addApplyDifferent!441 (ListLongMap!12245 (_ BitVec 64) V!32551 (_ BitVec 64)) Unit!31812)

(assert (=> b!947536 (= lt!426487 (addApplyDifferent!441 lt!426479 lt!426490 (minValue!5571 thiss!1141) lt!426486))))

(assert (=> b!947536 (= (apply!862 (+!2872 lt!426479 (tuple2!13559 lt!426490 (minValue!5571 thiss!1141))) lt!426486) (apply!862 lt!426479 lt!426486))))

(declare-fun lt!426476 () Unit!31812)

(assert (=> b!947536 (= lt!426476 lt!426487)))

(declare-fun lt!426472 () ListLongMap!12245)

(assert (=> b!947536 (= lt!426472 (getCurrentListMapNoExtraKeys!3344 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!426493 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426485 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426485 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426488 () Unit!31812)

(assert (=> b!947536 (= lt!426488 (addApplyDifferent!441 lt!426472 lt!426493 (zeroValue!5571 thiss!1141) lt!426485))))

(assert (=> b!947536 (= (apply!862 (+!2872 lt!426472 (tuple2!13559 lt!426493 (zeroValue!5571 thiss!1141))) lt!426485) (apply!862 lt!426472 lt!426485))))

(declare-fun lt!426484 () Unit!31812)

(assert (=> b!947536 (= lt!426484 lt!426488)))

(declare-fun lt!426478 () ListLongMap!12245)

(assert (=> b!947536 (= lt!426478 (getCurrentListMapNoExtraKeys!3344 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!426492 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426492 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426473 () (_ BitVec 64))

(assert (=> b!947536 (= lt!426473 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947536 (= lt!426475 (addApplyDifferent!441 lt!426478 lt!426492 (minValue!5571 thiss!1141) lt!426473))))

(assert (=> b!947536 (= (apply!862 (+!2872 lt!426478 (tuple2!13559 lt!426492 (minValue!5571 thiss!1141))) lt!426473) (apply!862 lt!426478 lt!426473))))

(declare-fun bm!41114 () Bool)

(assert (=> bm!41114 (= call!41113 call!41119)))

(declare-fun bm!41115 () Bool)

(assert (=> bm!41115 (= call!41116 call!41114)))

(declare-fun bm!41116 () Bool)

(assert (=> bm!41116 (= call!41114 (getCurrentListMapNoExtraKeys!3344 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun b!947537 () Bool)

(declare-fun get!14485 (ValueCell!9863 V!32551) V!32551)

(declare-fun dynLambda!1628 (Int (_ BitVec 64)) V!32551)

(assert (=> b!947537 (= e!533335 (= (apply!862 lt!426480 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000)) (get!14485 (select (arr!27581 (_values!5758 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1628 (defaultEntry!5735 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28056 (_values!5758 thiss!1141))))))

(assert (=> b!947537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28057 (_keys!10643 thiss!1141))))))

(declare-fun b!947538 () Bool)

(assert (=> b!947538 (= e!533334 (= (apply!862 lt!426480 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5571 thiss!1141)))))

(declare-fun b!947539 () Bool)

(assert (=> b!947539 (= e!533337 (validKeyInArray!0 (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947540 () Bool)

(assert (=> b!947540 (= e!533336 (not call!41115))))

(assert (= (and d!114517 c!98678) b!947525))

(assert (= (and d!114517 (not c!98678)) b!947521))

(assert (= (and b!947521 c!98676) b!947527))

(assert (= (and b!947521 (not c!98676)) b!947534))

(assert (= (and b!947534 c!98674) b!947528))

(assert (= (and b!947534 (not c!98674)) b!947533))

(assert (= (or b!947528 b!947533) bm!41110))

(assert (= (or b!947527 bm!41110) bm!41115))

(assert (= (or b!947527 b!947528) bm!41114))

(assert (= (or b!947525 bm!41115) bm!41116))

(assert (= (or b!947525 bm!41114) bm!41113))

(assert (= (and d!114517 res!635898) b!947535))

(assert (= (and d!114517 c!98677) b!947536))

(assert (= (and d!114517 (not c!98677)) b!947531))

(assert (= (and d!114517 res!635901) b!947524))

(assert (= (and b!947524 res!635903) b!947539))

(assert (= (and b!947524 (not res!635897)) b!947526))

(assert (= (and b!947526 res!635896) b!947537))

(assert (= (and b!947524 res!635899) b!947529))

(assert (= (and b!947529 c!98675) b!947522))

(assert (= (and b!947529 (not c!98675)) b!947523))

(assert (= (and b!947522 res!635902) b!947530))

(assert (= (or b!947522 b!947523) bm!41112))

(assert (= (and b!947529 res!635900) b!947520))

(assert (= (and b!947520 c!98679) b!947532))

(assert (= (and b!947520 (not c!98679)) b!947540))

(assert (= (and b!947532 res!635895) b!947538))

(assert (= (or b!947532 b!947540) bm!41111))

(declare-fun b_lambda!14281 () Bool)

(assert (=> (not b_lambda!14281) (not b!947537)))

(declare-fun t!27627 () Bool)

(declare-fun tb!6165 () Bool)

(assert (=> (and b!947408 (= (defaultEntry!5735 thiss!1141) (defaultEntry!5735 thiss!1141)) t!27627) tb!6165))

(declare-fun result!12233 () Bool)

(assert (=> tb!6165 (= result!12233 tp_is_empty!20689)))

(assert (=> b!947537 t!27627))

(declare-fun b_and!29583 () Bool)

(assert (= b_and!29577 (and (=> t!27627 result!12233) b_and!29583)))

(declare-fun m!879855 () Bool)

(assert (=> b!947525 m!879855))

(declare-fun m!879857 () Bool)

(assert (=> bm!41116 m!879857))

(declare-fun m!879859 () Bool)

(assert (=> b!947536 m!879859))

(assert (=> b!947536 m!879857))

(declare-fun m!879861 () Bool)

(assert (=> b!947536 m!879861))

(declare-fun m!879863 () Bool)

(assert (=> b!947536 m!879863))

(declare-fun m!879865 () Bool)

(assert (=> b!947536 m!879865))

(declare-fun m!879867 () Bool)

(assert (=> b!947536 m!879867))

(assert (=> b!947536 m!879867))

(declare-fun m!879869 () Bool)

(assert (=> b!947536 m!879869))

(declare-fun m!879871 () Bool)

(assert (=> b!947536 m!879871))

(declare-fun m!879873 () Bool)

(assert (=> b!947536 m!879873))

(assert (=> b!947536 m!879861))

(declare-fun m!879875 () Bool)

(assert (=> b!947536 m!879875))

(declare-fun m!879877 () Bool)

(assert (=> b!947536 m!879877))

(assert (=> b!947536 m!879873))

(declare-fun m!879879 () Bool)

(assert (=> b!947536 m!879879))

(assert (=> b!947536 m!879863))

(declare-fun m!879881 () Bool)

(assert (=> b!947536 m!879881))

(declare-fun m!879883 () Bool)

(assert (=> b!947536 m!879883))

(declare-fun m!879885 () Bool)

(assert (=> b!947536 m!879885))

(declare-fun m!879887 () Bool)

(assert (=> b!947536 m!879887))

(declare-fun m!879889 () Bool)

(assert (=> b!947536 m!879889))

(declare-fun m!879891 () Bool)

(assert (=> bm!41113 m!879891))

(declare-fun m!879893 () Bool)

(assert (=> b!947530 m!879893))

(assert (=> b!947535 m!879887))

(assert (=> b!947535 m!879887))

(declare-fun m!879895 () Bool)

(assert (=> b!947535 m!879895))

(assert (=> b!947539 m!879887))

(assert (=> b!947539 m!879887))

(assert (=> b!947539 m!879895))

(declare-fun m!879897 () Bool)

(assert (=> b!947537 m!879897))

(declare-fun m!879899 () Bool)

(assert (=> b!947537 m!879899))

(assert (=> b!947537 m!879887))

(declare-fun m!879901 () Bool)

(assert (=> b!947537 m!879901))

(assert (=> b!947537 m!879887))

(assert (=> b!947537 m!879899))

(assert (=> b!947537 m!879897))

(declare-fun m!879903 () Bool)

(assert (=> b!947537 m!879903))

(declare-fun m!879905 () Bool)

(assert (=> bm!41111 m!879905))

(assert (=> b!947526 m!879887))

(assert (=> b!947526 m!879887))

(declare-fun m!879907 () Bool)

(assert (=> b!947526 m!879907))

(assert (=> d!114517 m!879841))

(declare-fun m!879909 () Bool)

(assert (=> bm!41112 m!879909))

(declare-fun m!879911 () Bool)

(assert (=> b!947538 m!879911))

(assert (=> b!947406 d!114517))

(declare-fun d!114519 () Bool)

(assert (=> d!114519 (= (map!13050 thiss!1141) (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun bs!26603 () Bool)

(assert (= bs!26603 d!114519))

(assert (=> bs!26603 m!879759))

(assert (=> b!947406 d!114519))

(declare-fun d!114521 () Bool)

(declare-fun res!635908 () Bool)

(declare-fun e!533349 () Bool)

(assert (=> d!114521 (=> res!635908 e!533349)))

(assert (=> d!114521 (= res!635908 (= (select (arr!27582 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114521 (= (arrayContainsKey!0 (_keys!10643 thiss!1141) key!756 #b00000000000000000000000000000000) e!533349)))

(declare-fun b!947547 () Bool)

(declare-fun e!533350 () Bool)

(assert (=> b!947547 (= e!533349 e!533350)))

(declare-fun res!635909 () Bool)

(assert (=> b!947547 (=> (not res!635909) (not e!533350))))

(assert (=> b!947547 (= res!635909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28057 (_keys!10643 thiss!1141))))))

(declare-fun b!947548 () Bool)

(assert (=> b!947548 (= e!533350 (arrayContainsKey!0 (_keys!10643 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114521 (not res!635908)) b!947547))

(assert (= (and b!947547 res!635909) b!947548))

(assert (=> d!114521 m!879887))

(declare-fun m!879913 () Bool)

(assert (=> b!947548 m!879913))

(assert (=> b!947406 d!114521))

(declare-fun d!114523 () Bool)

(assert (=> d!114523 (arrayContainsKey!0 (_keys!10643 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426496 () Unit!31812)

(declare-fun choose!13 (array!57345 (_ BitVec 64) (_ BitVec 32)) Unit!31812)

(assert (=> d!114523 (= lt!426496 (choose!13 (_keys!10643 thiss!1141) key!756 (index!38844 lt!426395)))))

(assert (=> d!114523 (bvsge (index!38844 lt!426395) #b00000000000000000000000000000000)))

(assert (=> d!114523 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10643 thiss!1141) key!756 (index!38844 lt!426395)) lt!426496)))

(declare-fun bs!26604 () Bool)

(assert (= bs!26604 d!114523))

(assert (=> bs!26604 m!879773))

(declare-fun m!879915 () Bool)

(assert (=> bs!26604 m!879915))

(assert (=> b!947406 d!114523))

(declare-fun d!114525 () Bool)

(declare-fun e!533355 () Bool)

(assert (=> d!114525 e!533355))

(declare-fun res!635912 () Bool)

(assert (=> d!114525 (=> res!635912 e!533355)))

(declare-fun lt!426505 () Bool)

(assert (=> d!114525 (= res!635912 (not lt!426505))))

(declare-fun lt!426508 () Bool)

(assert (=> d!114525 (= lt!426505 lt!426508)))

(declare-fun lt!426507 () Unit!31812)

(declare-fun e!533356 () Unit!31812)

(assert (=> d!114525 (= lt!426507 e!533356)))

(declare-fun c!98682 () Bool)

(assert (=> d!114525 (= c!98682 lt!426508)))

(declare-fun containsKey!455 (List!19312 (_ BitVec 64)) Bool)

(assert (=> d!114525 (= lt!426508 (containsKey!455 (toList!6138 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395))))))

(assert (=> d!114525 (= (contains!5163 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395))) lt!426505)))

(declare-fun b!947555 () Bool)

(declare-fun lt!426506 () Unit!31812)

(assert (=> b!947555 (= e!533356 lt!426506)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!350 (List!19312 (_ BitVec 64)) Unit!31812)

(assert (=> b!947555 (= lt!426506 (lemmaContainsKeyImpliesGetValueByKeyDefined!350 (toList!6138 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395))))))

(declare-datatypes ((Option!497 0))(
  ( (Some!496 (v!12931 V!32551)) (None!495) )
))
(declare-fun isDefined!363 (Option!497) Bool)

(declare-fun getValueByKey!491 (List!19312 (_ BitVec 64)) Option!497)

(assert (=> b!947555 (isDefined!363 (getValueByKey!491 (toList!6138 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395))))))

(declare-fun b!947556 () Bool)

(declare-fun Unit!31817 () Unit!31812)

(assert (=> b!947556 (= e!533356 Unit!31817)))

(declare-fun b!947557 () Bool)

(assert (=> b!947557 (= e!533355 (isDefined!363 (getValueByKey!491 (toList!6138 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395)))))))

(assert (= (and d!114525 c!98682) b!947555))

(assert (= (and d!114525 (not c!98682)) b!947556))

(assert (= (and d!114525 (not res!635912)) b!947557))

(assert (=> d!114525 m!879761))

(declare-fun m!879917 () Bool)

(assert (=> d!114525 m!879917))

(assert (=> b!947555 m!879761))

(declare-fun m!879919 () Bool)

(assert (=> b!947555 m!879919))

(assert (=> b!947555 m!879761))

(declare-fun m!879921 () Bool)

(assert (=> b!947555 m!879921))

(assert (=> b!947555 m!879921))

(declare-fun m!879923 () Bool)

(assert (=> b!947555 m!879923))

(assert (=> b!947557 m!879761))

(assert (=> b!947557 m!879921))

(assert (=> b!947557 m!879921))

(assert (=> b!947557 m!879923))

(assert (=> b!947406 d!114525))

(declare-fun d!114527 () Bool)

(declare-fun e!533359 () Bool)

(assert (=> d!114527 e!533359))

(declare-fun res!635915 () Bool)

(assert (=> d!114527 (=> (not res!635915) (not e!533359))))

(assert (=> d!114527 (= res!635915 (and (bvsge (index!38844 lt!426395) #b00000000000000000000000000000000) (bvslt (index!38844 lt!426395) (size!28057 (_keys!10643 thiss!1141)))))))

(declare-fun lt!426511 () Unit!31812)

(declare-fun choose!1580 (array!57345 array!57343 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) Unit!31812)

(assert (=> d!114527 (= lt!426511 (choose!1580 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38844 lt!426395) (defaultEntry!5735 thiss!1141)))))

(assert (=> d!114527 (validMask!0 (mask!27473 thiss!1141))))

(assert (=> d!114527 (= (lemmaValidKeyInArrayIsInListMap!266 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38844 lt!426395) (defaultEntry!5735 thiss!1141)) lt!426511)))

(declare-fun b!947560 () Bool)

(assert (=> b!947560 (= e!533359 (contains!5163 (getCurrentListMap!3300 (_keys!10643 thiss!1141) (_values!5758 thiss!1141) (mask!27473 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27582 (_keys!10643 thiss!1141)) (index!38844 lt!426395))))))

(assert (= (and d!114527 res!635915) b!947560))

(declare-fun m!879925 () Bool)

(assert (=> d!114527 m!879925))

(assert (=> d!114527 m!879841))

(assert (=> b!947560 m!879759))

(assert (=> b!947560 m!879761))

(assert (=> b!947560 m!879759))

(assert (=> b!947560 m!879761))

(assert (=> b!947560 m!879763))

(assert (=> b!947406 d!114527))

(declare-fun d!114529 () Bool)

(declare-fun e!533360 () Bool)

(assert (=> d!114529 e!533360))

(declare-fun res!635916 () Bool)

(assert (=> d!114529 (=> res!635916 e!533360)))

(declare-fun lt!426512 () Bool)

(assert (=> d!114529 (= res!635916 (not lt!426512))))

(declare-fun lt!426515 () Bool)

(assert (=> d!114529 (= lt!426512 lt!426515)))

(declare-fun lt!426514 () Unit!31812)

(declare-fun e!533361 () Unit!31812)

(assert (=> d!114529 (= lt!426514 e!533361)))

(declare-fun c!98683 () Bool)

(assert (=> d!114529 (= c!98683 lt!426515)))

(assert (=> d!114529 (= lt!426515 (containsKey!455 (toList!6138 (map!13050 thiss!1141)) key!756))))

(assert (=> d!114529 (= (contains!5163 (map!13050 thiss!1141) key!756) lt!426512)))

(declare-fun b!947561 () Bool)

(declare-fun lt!426513 () Unit!31812)

(assert (=> b!947561 (= e!533361 lt!426513)))

(assert (=> b!947561 (= lt!426513 (lemmaContainsKeyImpliesGetValueByKeyDefined!350 (toList!6138 (map!13050 thiss!1141)) key!756))))

(assert (=> b!947561 (isDefined!363 (getValueByKey!491 (toList!6138 (map!13050 thiss!1141)) key!756))))

(declare-fun b!947562 () Bool)

(declare-fun Unit!31818 () Unit!31812)

(assert (=> b!947562 (= e!533361 Unit!31818)))

(declare-fun b!947563 () Bool)

(assert (=> b!947563 (= e!533360 (isDefined!363 (getValueByKey!491 (toList!6138 (map!13050 thiss!1141)) key!756)))))

(assert (= (and d!114529 c!98683) b!947561))

(assert (= (and d!114529 (not c!98683)) b!947562))

(assert (= (and d!114529 (not res!635916)) b!947563))

(declare-fun m!879927 () Bool)

(assert (=> d!114529 m!879927))

(declare-fun m!879929 () Bool)

(assert (=> b!947561 m!879929))

(declare-fun m!879931 () Bool)

(assert (=> b!947561 m!879931))

(assert (=> b!947561 m!879931))

(declare-fun m!879933 () Bool)

(assert (=> b!947561 m!879933))

(assert (=> b!947563 m!879931))

(assert (=> b!947563 m!879931))

(assert (=> b!947563 m!879933))

(assert (=> b!947406 d!114529))

(declare-fun d!114531 () Bool)

(assert (=> d!114531 (= (array_inv!21468 (_keys!10643 thiss!1141)) (bvsge (size!28057 (_keys!10643 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947408 d!114531))

(declare-fun d!114533 () Bool)

(assert (=> d!114533 (= (array_inv!21469 (_values!5758 thiss!1141)) (bvsge (size!28056 (_values!5758 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947408 d!114533))

(declare-fun mapIsEmpty!32923 () Bool)

(declare-fun mapRes!32923 () Bool)

(assert (=> mapIsEmpty!32923 mapRes!32923))

(declare-fun b!947570 () Bool)

(declare-fun e!533367 () Bool)

(assert (=> b!947570 (= e!533367 tp_is_empty!20689)))

(declare-fun condMapEmpty!32923 () Bool)

(declare-fun mapDefault!32923 () ValueCell!9863)

(assert (=> mapNonEmpty!32914 (= condMapEmpty!32923 (= mapRest!32914 ((as const (Array (_ BitVec 32) ValueCell!9863)) mapDefault!32923)))))

(declare-fun e!533366 () Bool)

(assert (=> mapNonEmpty!32914 (= tp!63108 (and e!533366 mapRes!32923))))

(declare-fun mapNonEmpty!32923 () Bool)

(declare-fun tp!63124 () Bool)

(assert (=> mapNonEmpty!32923 (= mapRes!32923 (and tp!63124 e!533367))))

(declare-fun mapRest!32923 () (Array (_ BitVec 32) ValueCell!9863))

(declare-fun mapKey!32923 () (_ BitVec 32))

(declare-fun mapValue!32923 () ValueCell!9863)

(assert (=> mapNonEmpty!32923 (= mapRest!32914 (store mapRest!32923 mapKey!32923 mapValue!32923))))

(declare-fun b!947571 () Bool)

(assert (=> b!947571 (= e!533366 tp_is_empty!20689)))

(assert (= (and mapNonEmpty!32914 condMapEmpty!32923) mapIsEmpty!32923))

(assert (= (and mapNonEmpty!32914 (not condMapEmpty!32923)) mapNonEmpty!32923))

(assert (= (and mapNonEmpty!32923 ((_ is ValueCellFull!9863) mapValue!32923)) b!947570))

(assert (= (and mapNonEmpty!32914 ((_ is ValueCellFull!9863) mapDefault!32923)) b!947571))

(declare-fun m!879935 () Bool)

(assert (=> mapNonEmpty!32923 m!879935))

(declare-fun b_lambda!14283 () Bool)

(assert (= b_lambda!14281 (or (and b!947408 b_free!18181) b_lambda!14283)))

(check-sat (not b!947561) (not b!947536) (not b!947555) (not b!947560) (not b!947538) (not bm!41113) (not b!947475) (not b!947535) (not b!947525) (not b!947548) (not b!947477) (not mapNonEmpty!32923) tp_is_empty!20689 (not bm!41112) (not d!114515) (not b_next!18181) (not b!947530) (not bm!41116) (not d!114519) (not d!114517) (not b!947537) b_and!29583 (not d!114523) (not d!114525) (not b_lambda!14283) (not d!114513) (not b!947526) (not b!947563) (not d!114529) (not b!947557) (not b!947476) (not b!947539) (not b!947468) (not bm!41111) (not d!114527))
(check-sat b_and!29583 (not b_next!18181))
