; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79896 () Bool)

(assert start!79896)

(declare-fun b!939625 () Bool)

(declare-fun b_free!17793 () Bool)

(declare-fun b_next!17793 () Bool)

(assert (=> b!939625 (= b_free!17793 (not b_next!17793))))

(declare-fun tp!61843 () Bool)

(declare-fun b_and!29205 () Bool)

(assert (=> b!939625 (= tp!61843 b_and!29205)))

(declare-fun mapIsEmpty!32231 () Bool)

(declare-fun mapRes!32231 () Bool)

(assert (=> mapIsEmpty!32231 mapRes!32231))

(declare-fun b!939624 () Bool)

(declare-fun e!527834 () Bool)

(declare-datatypes ((V!32033 0))(
  ( (V!32034 (val!10201 Int)) )
))
(declare-datatypes ((ValueCell!9669 0))(
  ( (ValueCellFull!9669 (v!12732 V!32033)) (EmptyCell!9669) )
))
(declare-datatypes ((array!56544 0))(
  ( (array!56545 (arr!27210 (Array (_ BitVec 32) ValueCell!9669)) (size!27669 (_ BitVec 32))) )
))
(declare-datatypes ((array!56546 0))(
  ( (array!56547 (arr!27211 (Array (_ BitVec 32) (_ BitVec 64))) (size!27670 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4488 0))(
  ( (LongMapFixedSize!4489 (defaultEntry!5535 Int) (mask!27051 (_ BitVec 32)) (extraKeys!5267 (_ BitVec 32)) (zeroValue!5371 V!32033) (minValue!5371 V!32033) (_size!2299 (_ BitVec 32)) (_keys!10383 array!56546) (_values!5558 array!56544) (_vacant!2299 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4488)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939624 (= e!527834 (not (validMask!0 (mask!27051 thiss!1141))))))

(declare-fun mapNonEmpty!32231 () Bool)

(declare-fun tp!61842 () Bool)

(declare-fun e!527833 () Bool)

(assert (=> mapNonEmpty!32231 (= mapRes!32231 (and tp!61842 e!527833))))

(declare-fun mapKey!32231 () (_ BitVec 32))

(declare-fun mapRest!32231 () (Array (_ BitVec 32) ValueCell!9669))

(declare-fun mapValue!32231 () ValueCell!9669)

(assert (=> mapNonEmpty!32231 (= (arr!27210 (_values!5558 thiss!1141)) (store mapRest!32231 mapKey!32231 mapValue!32231))))

(declare-fun tp_is_empty!20301 () Bool)

(declare-fun e!527831 () Bool)

(declare-fun e!527830 () Bool)

(declare-fun array_inv!21162 (array!56546) Bool)

(declare-fun array_inv!21163 (array!56544) Bool)

(assert (=> b!939625 (= e!527831 (and tp!61843 tp_is_empty!20301 (array_inv!21162 (_keys!10383 thiss!1141)) (array_inv!21163 (_values!5558 thiss!1141)) e!527830))))

(declare-fun b!939627 () Bool)

(declare-fun e!527835 () Bool)

(assert (=> b!939627 (= e!527835 tp_is_empty!20301)))

(declare-fun b!939628 () Bool)

(assert (=> b!939628 (= e!527833 tp_is_empty!20301)))

(declare-fun b!939629 () Bool)

(declare-fun res!631956 () Bool)

(assert (=> b!939629 (=> (not res!631956) (not e!527834))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!939629 (= res!631956 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!631957 () Bool)

(assert (=> start!79896 (=> (not res!631957) (not e!527834))))

(declare-fun valid!1725 (LongMapFixedSize!4488) Bool)

(assert (=> start!79896 (= res!631957 (valid!1725 thiss!1141))))

(assert (=> start!79896 e!527834))

(assert (=> start!79896 e!527831))

(assert (=> start!79896 true))

(declare-fun b!939626 () Bool)

(assert (=> b!939626 (= e!527830 (and e!527835 mapRes!32231))))

(declare-fun condMapEmpty!32231 () Bool)

(declare-fun mapDefault!32231 () ValueCell!9669)

(assert (=> b!939626 (= condMapEmpty!32231 (= (arr!27210 (_values!5558 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9669)) mapDefault!32231)))))

(assert (= (and start!79896 res!631957) b!939629))

(assert (= (and b!939629 res!631956) b!939624))

(assert (= (and b!939626 condMapEmpty!32231) mapIsEmpty!32231))

(assert (= (and b!939626 (not condMapEmpty!32231)) mapNonEmpty!32231))

(get-info :version)

(assert (= (and mapNonEmpty!32231 ((_ is ValueCellFull!9669) mapValue!32231)) b!939628))

(assert (= (and b!939626 ((_ is ValueCellFull!9669) mapDefault!32231)) b!939627))

(assert (= b!939625 b!939626))

(assert (= start!79896 b!939625))

(declare-fun m!875433 () Bool)

(assert (=> b!939624 m!875433))

(declare-fun m!875435 () Bool)

(assert (=> mapNonEmpty!32231 m!875435))

(declare-fun m!875437 () Bool)

(assert (=> b!939625 m!875437))

(declare-fun m!875439 () Bool)

(assert (=> b!939625 m!875439))

(declare-fun m!875441 () Bool)

(assert (=> start!79896 m!875441))

(check-sat b_and!29205 (not b!939624) (not start!79896) (not b_next!17793) (not mapNonEmpty!32231) tp_is_empty!20301 (not b!939625))
(check-sat b_and!29205 (not b_next!17793))
(get-model)

(declare-fun d!113953 () Bool)

(declare-fun res!631970 () Bool)

(declare-fun e!527856 () Bool)

(assert (=> d!113953 (=> (not res!631970) (not e!527856))))

(declare-fun simpleValid!336 (LongMapFixedSize!4488) Bool)

(assert (=> d!113953 (= res!631970 (simpleValid!336 thiss!1141))))

(assert (=> d!113953 (= (valid!1725 thiss!1141) e!527856)))

(declare-fun b!939654 () Bool)

(declare-fun res!631971 () Bool)

(assert (=> b!939654 (=> (not res!631971) (not e!527856))))

(declare-fun arrayCountValidKeys!0 (array!56546 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!939654 (= res!631971 (= (arrayCountValidKeys!0 (_keys!10383 thiss!1141) #b00000000000000000000000000000000 (size!27670 (_keys!10383 thiss!1141))) (_size!2299 thiss!1141)))))

(declare-fun b!939655 () Bool)

(declare-fun res!631972 () Bool)

(assert (=> b!939655 (=> (not res!631972) (not e!527856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56546 (_ BitVec 32)) Bool)

(assert (=> b!939655 (= res!631972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10383 thiss!1141) (mask!27051 thiss!1141)))))

(declare-fun b!939656 () Bool)

(declare-datatypes ((List!19179 0))(
  ( (Nil!19176) (Cons!19175 (h!20321 (_ BitVec 64)) (t!27494 List!19179)) )
))
(declare-fun arrayNoDuplicates!0 (array!56546 (_ BitVec 32) List!19179) Bool)

(assert (=> b!939656 (= e!527856 (arrayNoDuplicates!0 (_keys!10383 thiss!1141) #b00000000000000000000000000000000 Nil!19176))))

(assert (= (and d!113953 res!631970) b!939654))

(assert (= (and b!939654 res!631971) b!939655))

(assert (= (and b!939655 res!631972) b!939656))

(declare-fun m!875453 () Bool)

(assert (=> d!113953 m!875453))

(declare-fun m!875455 () Bool)

(assert (=> b!939654 m!875455))

(declare-fun m!875457 () Bool)

(assert (=> b!939655 m!875457))

(declare-fun m!875459 () Bool)

(assert (=> b!939656 m!875459))

(assert (=> start!79896 d!113953))

(declare-fun d!113955 () Bool)

(assert (=> d!113955 (= (array_inv!21162 (_keys!10383 thiss!1141)) (bvsge (size!27670 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939625 d!113955))

(declare-fun d!113957 () Bool)

(assert (=> d!113957 (= (array_inv!21163 (_values!5558 thiss!1141)) (bvsge (size!27669 (_values!5558 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939625 d!113957))

(declare-fun d!113959 () Bool)

(assert (=> d!113959 (= (validMask!0 (mask!27051 thiss!1141)) (and (or (= (mask!27051 thiss!1141) #b00000000000000000000000000000111) (= (mask!27051 thiss!1141) #b00000000000000000000000000001111) (= (mask!27051 thiss!1141) #b00000000000000000000000000011111) (= (mask!27051 thiss!1141) #b00000000000000000000000000111111) (= (mask!27051 thiss!1141) #b00000000000000000000000001111111) (= (mask!27051 thiss!1141) #b00000000000000000000000011111111) (= (mask!27051 thiss!1141) #b00000000000000000000000111111111) (= (mask!27051 thiss!1141) #b00000000000000000000001111111111) (= (mask!27051 thiss!1141) #b00000000000000000000011111111111) (= (mask!27051 thiss!1141) #b00000000000000000000111111111111) (= (mask!27051 thiss!1141) #b00000000000000000001111111111111) (= (mask!27051 thiss!1141) #b00000000000000000011111111111111) (= (mask!27051 thiss!1141) #b00000000000000000111111111111111) (= (mask!27051 thiss!1141) #b00000000000000001111111111111111) (= (mask!27051 thiss!1141) #b00000000000000011111111111111111) (= (mask!27051 thiss!1141) #b00000000000000111111111111111111) (= (mask!27051 thiss!1141) #b00000000000001111111111111111111) (= (mask!27051 thiss!1141) #b00000000000011111111111111111111) (= (mask!27051 thiss!1141) #b00000000000111111111111111111111) (= (mask!27051 thiss!1141) #b00000000001111111111111111111111) (= (mask!27051 thiss!1141) #b00000000011111111111111111111111) (= (mask!27051 thiss!1141) #b00000000111111111111111111111111) (= (mask!27051 thiss!1141) #b00000001111111111111111111111111) (= (mask!27051 thiss!1141) #b00000011111111111111111111111111) (= (mask!27051 thiss!1141) #b00000111111111111111111111111111) (= (mask!27051 thiss!1141) #b00001111111111111111111111111111) (= (mask!27051 thiss!1141) #b00011111111111111111111111111111) (= (mask!27051 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27051 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!939624 d!113959))

(declare-fun mapIsEmpty!32237 () Bool)

(declare-fun mapRes!32237 () Bool)

(assert (=> mapIsEmpty!32237 mapRes!32237))

(declare-fun condMapEmpty!32237 () Bool)

(declare-fun mapDefault!32237 () ValueCell!9669)

(assert (=> mapNonEmpty!32231 (= condMapEmpty!32237 (= mapRest!32231 ((as const (Array (_ BitVec 32) ValueCell!9669)) mapDefault!32237)))))

(declare-fun e!527861 () Bool)

(assert (=> mapNonEmpty!32231 (= tp!61842 (and e!527861 mapRes!32237))))

(declare-fun mapNonEmpty!32237 () Bool)

(declare-fun tp!61852 () Bool)

(declare-fun e!527862 () Bool)

(assert (=> mapNonEmpty!32237 (= mapRes!32237 (and tp!61852 e!527862))))

(declare-fun mapValue!32237 () ValueCell!9669)

(declare-fun mapRest!32237 () (Array (_ BitVec 32) ValueCell!9669))

(declare-fun mapKey!32237 () (_ BitVec 32))

(assert (=> mapNonEmpty!32237 (= mapRest!32231 (store mapRest!32237 mapKey!32237 mapValue!32237))))

(declare-fun b!939663 () Bool)

(assert (=> b!939663 (= e!527862 tp_is_empty!20301)))

(declare-fun b!939664 () Bool)

(assert (=> b!939664 (= e!527861 tp_is_empty!20301)))

(assert (= (and mapNonEmpty!32231 condMapEmpty!32237) mapIsEmpty!32237))

(assert (= (and mapNonEmpty!32231 (not condMapEmpty!32237)) mapNonEmpty!32237))

(assert (= (and mapNonEmpty!32237 ((_ is ValueCellFull!9669) mapValue!32237)) b!939663))

(assert (= (and mapNonEmpty!32231 ((_ is ValueCellFull!9669) mapDefault!32237)) b!939664))

(declare-fun m!875461 () Bool)

(assert (=> mapNonEmpty!32237 m!875461))

(check-sat b_and!29205 (not mapNonEmpty!32237) tp_is_empty!20301 (not b!939655) (not b!939654) (not b!939656) (not d!113953) (not b_next!17793))
(check-sat b_and!29205 (not b_next!17793))
(get-model)

(declare-fun d!113961 () Bool)

(declare-fun res!631978 () Bool)

(declare-fun e!527869 () Bool)

(assert (=> d!113961 (=> res!631978 e!527869)))

(assert (=> d!113961 (= res!631978 (bvsge #b00000000000000000000000000000000 (size!27670 (_keys!10383 thiss!1141))))))

(assert (=> d!113961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10383 thiss!1141) (mask!27051 thiss!1141)) e!527869)))

(declare-fun bm!40896 () Bool)

(declare-fun call!40899 () Bool)

(assert (=> bm!40896 (= call!40899 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10383 thiss!1141) (mask!27051 thiss!1141)))))

(declare-fun b!939673 () Bool)

(declare-fun e!527870 () Bool)

(assert (=> b!939673 (= e!527869 e!527870)))

(declare-fun c!98005 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939673 (= c!98005 (validKeyInArray!0 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939674 () Bool)

(assert (=> b!939674 (= e!527870 call!40899)))

(declare-fun b!939675 () Bool)

(declare-fun e!527871 () Bool)

(assert (=> b!939675 (= e!527871 call!40899)))

(declare-fun b!939676 () Bool)

(assert (=> b!939676 (= e!527870 e!527871)))

(declare-fun lt!424571 () (_ BitVec 64))

(assert (=> b!939676 (= lt!424571 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31752 0))(
  ( (Unit!31753) )
))
(declare-fun lt!424572 () Unit!31752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56546 (_ BitVec 64) (_ BitVec 32)) Unit!31752)

(assert (=> b!939676 (= lt!424572 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10383 thiss!1141) lt!424571 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939676 (arrayContainsKey!0 (_keys!10383 thiss!1141) lt!424571 #b00000000000000000000000000000000)))

(declare-fun lt!424573 () Unit!31752)

(assert (=> b!939676 (= lt!424573 lt!424572)))

(declare-fun res!631977 () Bool)

(declare-datatypes ((SeekEntryResult!8983 0))(
  ( (MissingZero!8983 (index!38303 (_ BitVec 32))) (Found!8983 (index!38304 (_ BitVec 32))) (Intermediate!8983 (undefined!9795 Bool) (index!38305 (_ BitVec 32)) (x!80542 (_ BitVec 32))) (Undefined!8983) (MissingVacant!8983 (index!38306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56546 (_ BitVec 32)) SeekEntryResult!8983)

(assert (=> b!939676 (= res!631977 (= (seekEntryOrOpen!0 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000) (_keys!10383 thiss!1141) (mask!27051 thiss!1141)) (Found!8983 #b00000000000000000000000000000000)))))

(assert (=> b!939676 (=> (not res!631977) (not e!527871))))

(assert (= (and d!113961 (not res!631978)) b!939673))

(assert (= (and b!939673 c!98005) b!939676))

(assert (= (and b!939673 (not c!98005)) b!939674))

(assert (= (and b!939676 res!631977) b!939675))

(assert (= (or b!939675 b!939674) bm!40896))

(declare-fun m!875463 () Bool)

(assert (=> bm!40896 m!875463))

(declare-fun m!875465 () Bool)

(assert (=> b!939673 m!875465))

(assert (=> b!939673 m!875465))

(declare-fun m!875467 () Bool)

(assert (=> b!939673 m!875467))

(assert (=> b!939676 m!875465))

(declare-fun m!875469 () Bool)

(assert (=> b!939676 m!875469))

(declare-fun m!875471 () Bool)

(assert (=> b!939676 m!875471))

(assert (=> b!939676 m!875465))

(declare-fun m!875473 () Bool)

(assert (=> b!939676 m!875473))

(assert (=> b!939655 d!113961))

(declare-fun b!939687 () Bool)

(declare-fun e!527883 () Bool)

(declare-fun e!527880 () Bool)

(assert (=> b!939687 (= e!527883 e!527880)))

(declare-fun c!98008 () Bool)

(assert (=> b!939687 (= c!98008 (validKeyInArray!0 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939688 () Bool)

(declare-fun e!527881 () Bool)

(assert (=> b!939688 (= e!527881 e!527883)))

(declare-fun res!631986 () Bool)

(assert (=> b!939688 (=> (not res!631986) (not e!527883))))

(declare-fun e!527882 () Bool)

(assert (=> b!939688 (= res!631986 (not e!527882))))

(declare-fun res!631987 () Bool)

(assert (=> b!939688 (=> (not res!631987) (not e!527882))))

(assert (=> b!939688 (= res!631987 (validKeyInArray!0 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!113963 () Bool)

(declare-fun res!631985 () Bool)

(assert (=> d!113963 (=> res!631985 e!527881)))

(assert (=> d!113963 (= res!631985 (bvsge #b00000000000000000000000000000000 (size!27670 (_keys!10383 thiss!1141))))))

(assert (=> d!113963 (= (arrayNoDuplicates!0 (_keys!10383 thiss!1141) #b00000000000000000000000000000000 Nil!19176) e!527881)))

(declare-fun b!939689 () Bool)

(declare-fun call!40902 () Bool)

(assert (=> b!939689 (= e!527880 call!40902)))

(declare-fun b!939690 () Bool)

(declare-fun contains!5127 (List!19179 (_ BitVec 64)) Bool)

(assert (=> b!939690 (= e!527882 (contains!5127 Nil!19176 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40899 () Bool)

(assert (=> bm!40899 (= call!40902 (arrayNoDuplicates!0 (_keys!10383 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98008 (Cons!19175 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000) Nil!19176) Nil!19176)))))

(declare-fun b!939691 () Bool)

(assert (=> b!939691 (= e!527880 call!40902)))

(assert (= (and d!113963 (not res!631985)) b!939688))

(assert (= (and b!939688 res!631987) b!939690))

(assert (= (and b!939688 res!631986) b!939687))

(assert (= (and b!939687 c!98008) b!939689))

(assert (= (and b!939687 (not c!98008)) b!939691))

(assert (= (or b!939689 b!939691) bm!40899))

(assert (=> b!939687 m!875465))

(assert (=> b!939687 m!875465))

(assert (=> b!939687 m!875467))

(assert (=> b!939688 m!875465))

(assert (=> b!939688 m!875465))

(assert (=> b!939688 m!875467))

(assert (=> b!939690 m!875465))

(assert (=> b!939690 m!875465))

(declare-fun m!875475 () Bool)

(assert (=> b!939690 m!875475))

(assert (=> bm!40899 m!875465))

(declare-fun m!875477 () Bool)

(assert (=> bm!40899 m!875477))

(assert (=> b!939656 d!113963))

(declare-fun b!939700 () Bool)

(declare-fun e!527888 () (_ BitVec 32))

(declare-fun call!40905 () (_ BitVec 32))

(assert (=> b!939700 (= e!527888 call!40905)))

(declare-fun b!939701 () Bool)

(declare-fun e!527889 () (_ BitVec 32))

(assert (=> b!939701 (= e!527889 e!527888)))

(declare-fun c!98013 () Bool)

(assert (=> b!939701 (= c!98013 (validKeyInArray!0 (select (arr!27211 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!939702 () Bool)

(assert (=> b!939702 (= e!527888 (bvadd #b00000000000000000000000000000001 call!40905))))

(declare-fun b!939703 () Bool)

(assert (=> b!939703 (= e!527889 #b00000000000000000000000000000000)))

(declare-fun d!113965 () Bool)

(declare-fun lt!424576 () (_ BitVec 32))

(assert (=> d!113965 (and (bvsge lt!424576 #b00000000000000000000000000000000) (bvsle lt!424576 (bvsub (size!27670 (_keys!10383 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!113965 (= lt!424576 e!527889)))

(declare-fun c!98014 () Bool)

(assert (=> d!113965 (= c!98014 (bvsge #b00000000000000000000000000000000 (size!27670 (_keys!10383 thiss!1141))))))

(assert (=> d!113965 (and (bvsle #b00000000000000000000000000000000 (size!27670 (_keys!10383 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27670 (_keys!10383 thiss!1141)) (size!27670 (_keys!10383 thiss!1141))))))

(assert (=> d!113965 (= (arrayCountValidKeys!0 (_keys!10383 thiss!1141) #b00000000000000000000000000000000 (size!27670 (_keys!10383 thiss!1141))) lt!424576)))

(declare-fun bm!40902 () Bool)

(assert (=> bm!40902 (= call!40905 (arrayCountValidKeys!0 (_keys!10383 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27670 (_keys!10383 thiss!1141))))))

(assert (= (and d!113965 c!98014) b!939703))

(assert (= (and d!113965 (not c!98014)) b!939701))

(assert (= (and b!939701 c!98013) b!939702))

(assert (= (and b!939701 (not c!98013)) b!939700))

(assert (= (or b!939702 b!939700) bm!40902))

(assert (=> b!939701 m!875465))

(assert (=> b!939701 m!875465))

(assert (=> b!939701 m!875467))

(declare-fun m!875479 () Bool)

(assert (=> bm!40902 m!875479))

(assert (=> b!939654 d!113965))

(declare-fun b!939712 () Bool)

(declare-fun res!631998 () Bool)

(declare-fun e!527892 () Bool)

(assert (=> b!939712 (=> (not res!631998) (not e!527892))))

(assert (=> b!939712 (= res!631998 (and (= (size!27669 (_values!5558 thiss!1141)) (bvadd (mask!27051 thiss!1141) #b00000000000000000000000000000001)) (= (size!27670 (_keys!10383 thiss!1141)) (size!27669 (_values!5558 thiss!1141))) (bvsge (_size!2299 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2299 thiss!1141) (bvadd (mask!27051 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!939715 () Bool)

(assert (=> b!939715 (= e!527892 (and (bvsge (extraKeys!5267 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5267 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2299 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!113967 () Bool)

(declare-fun res!631996 () Bool)

(assert (=> d!113967 (=> (not res!631996) (not e!527892))))

(assert (=> d!113967 (= res!631996 (validMask!0 (mask!27051 thiss!1141)))))

(assert (=> d!113967 (= (simpleValid!336 thiss!1141) e!527892)))

(declare-fun b!939714 () Bool)

(declare-fun res!631999 () Bool)

(assert (=> b!939714 (=> (not res!631999) (not e!527892))))

(declare-fun size!27673 (LongMapFixedSize!4488) (_ BitVec 32))

(assert (=> b!939714 (= res!631999 (= (size!27673 thiss!1141) (bvadd (_size!2299 thiss!1141) (bvsdiv (bvadd (extraKeys!5267 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!939713 () Bool)

(declare-fun res!631997 () Bool)

(assert (=> b!939713 (=> (not res!631997) (not e!527892))))

(assert (=> b!939713 (= res!631997 (bvsge (size!27673 thiss!1141) (_size!2299 thiss!1141)))))

(assert (= (and d!113967 res!631996) b!939712))

(assert (= (and b!939712 res!631998) b!939713))

(assert (= (and b!939713 res!631997) b!939714))

(assert (= (and b!939714 res!631999) b!939715))

(assert (=> d!113967 m!875433))

(declare-fun m!875481 () Bool)

(assert (=> b!939714 m!875481))

(assert (=> b!939713 m!875481))

(assert (=> d!113953 d!113967))

(declare-fun mapIsEmpty!32238 () Bool)

(declare-fun mapRes!32238 () Bool)

(assert (=> mapIsEmpty!32238 mapRes!32238))

(declare-fun condMapEmpty!32238 () Bool)

(declare-fun mapDefault!32238 () ValueCell!9669)

(assert (=> mapNonEmpty!32237 (= condMapEmpty!32238 (= mapRest!32237 ((as const (Array (_ BitVec 32) ValueCell!9669)) mapDefault!32238)))))

(declare-fun e!527893 () Bool)

(assert (=> mapNonEmpty!32237 (= tp!61852 (and e!527893 mapRes!32238))))

(declare-fun mapNonEmpty!32238 () Bool)

(declare-fun tp!61853 () Bool)

(declare-fun e!527894 () Bool)

(assert (=> mapNonEmpty!32238 (= mapRes!32238 (and tp!61853 e!527894))))

(declare-fun mapValue!32238 () ValueCell!9669)

(declare-fun mapKey!32238 () (_ BitVec 32))

(declare-fun mapRest!32238 () (Array (_ BitVec 32) ValueCell!9669))

(assert (=> mapNonEmpty!32238 (= mapRest!32237 (store mapRest!32238 mapKey!32238 mapValue!32238))))

(declare-fun b!939716 () Bool)

(assert (=> b!939716 (= e!527894 tp_is_empty!20301)))

(declare-fun b!939717 () Bool)

(assert (=> b!939717 (= e!527893 tp_is_empty!20301)))

(assert (= (and mapNonEmpty!32237 condMapEmpty!32238) mapIsEmpty!32238))

(assert (= (and mapNonEmpty!32237 (not condMapEmpty!32238)) mapNonEmpty!32238))

(assert (= (and mapNonEmpty!32238 ((_ is ValueCellFull!9669) mapValue!32238)) b!939716))

(assert (= (and mapNonEmpty!32237 ((_ is ValueCellFull!9669) mapDefault!32238)) b!939717))

(declare-fun m!875483 () Bool)

(assert (=> mapNonEmpty!32238 m!875483))

(check-sat (not b!939701) tp_is_empty!20301 (not b!939676) (not d!113967) (not bm!40896) (not b!939714) (not bm!40902) b_and!29205 (not b!939713) (not b!939687) (not b!939688) (not b!939690) (not b!939673) (not mapNonEmpty!32238) (not bm!40899) (not b_next!17793))
(check-sat b_and!29205 (not b_next!17793))
