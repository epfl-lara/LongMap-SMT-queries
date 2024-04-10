; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17698 () Bool)

(assert start!17698)

(declare-fun b!176964 () Bool)

(declare-fun b_free!4371 () Bool)

(declare-fun b_next!4371 () Bool)

(assert (=> b!176964 (= b_free!4371 (not b_next!4371))))

(declare-fun tp!15810 () Bool)

(declare-fun b_and!10869 () Bool)

(assert (=> b!176964 (= tp!15810 b_and!10869)))

(declare-fun b!176960 () Bool)

(declare-fun e!116703 () Bool)

(declare-fun tp_is_empty!4143 () Bool)

(assert (=> b!176960 (= e!116703 tp_is_empty!4143)))

(declare-fun b!176961 () Bool)

(declare-fun res!83890 () Bool)

(declare-fun e!116704 () Bool)

(assert (=> b!176961 (=> (not res!83890) (not e!116704))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176961 (= res!83890 (not (= key!828 (bvneg key!828))))))

(declare-fun b!176963 () Bool)

(declare-fun res!83889 () Bool)

(assert (=> b!176963 (=> (not res!83889) (not e!116704))))

(declare-datatypes ((V!5171 0))(
  ( (V!5172 (val!2116 Int)) )
))
(declare-datatypes ((ValueCell!1728 0))(
  ( (ValueCellFull!1728 (v!3995 V!5171)) (EmptyCell!1728) )
))
(declare-datatypes ((array!7435 0))(
  ( (array!7436 (arr!3527 (Array (_ BitVec 32) (_ BitVec 64))) (size!3831 (_ BitVec 32))) )
))
(declare-datatypes ((array!7437 0))(
  ( (array!7438 (arr!3528 (Array (_ BitVec 32) ValueCell!1728)) (size!3832 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2364 0))(
  ( (LongMapFixedSize!2365 (defaultEntry!3644 Int) (mask!8573 (_ BitVec 32)) (extraKeys!3381 (_ BitVec 32)) (zeroValue!3485 V!5171) (minValue!3485 V!5171) (_size!1231 (_ BitVec 32)) (_keys!5509 array!7435) (_values!3627 array!7437) (_vacant!1231 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2364)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7435 (_ BitVec 32)) Bool)

(assert (=> b!176963 (= res!83889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5509 thiss!1248) (mask!8573 thiss!1248)))))

(declare-fun mapNonEmpty!7074 () Bool)

(declare-fun mapRes!7074 () Bool)

(declare-fun tp!15809 () Bool)

(declare-fun e!116705 () Bool)

(assert (=> mapNonEmpty!7074 (= mapRes!7074 (and tp!15809 e!116705))))

(declare-fun mapValue!7074 () ValueCell!1728)

(declare-fun mapKey!7074 () (_ BitVec 32))

(declare-fun mapRest!7074 () (Array (_ BitVec 32) ValueCell!1728))

(assert (=> mapNonEmpty!7074 (= (arr!3528 (_values!3627 thiss!1248)) (store mapRest!7074 mapKey!7074 mapValue!7074))))

(declare-fun e!116707 () Bool)

(declare-fun e!116706 () Bool)

(declare-fun array_inv!2259 (array!7435) Bool)

(declare-fun array_inv!2260 (array!7437) Bool)

(assert (=> b!176964 (= e!116706 (and tp!15810 tp_is_empty!4143 (array_inv!2259 (_keys!5509 thiss!1248)) (array_inv!2260 (_values!3627 thiss!1248)) e!116707))))

(declare-fun b!176965 () Bool)

(assert (=> b!176965 (= e!116705 tp_is_empty!4143)))

(declare-fun b!176966 () Bool)

(declare-fun res!83885 () Bool)

(assert (=> b!176966 (=> (not res!83885) (not e!116704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!176966 (= res!83885 (validMask!0 (mask!8573 thiss!1248)))))

(declare-fun b!176967 () Bool)

(declare-fun res!83887 () Bool)

(assert (=> b!176967 (=> (not res!83887) (not e!116704))))

(declare-datatypes ((List!2246 0))(
  ( (Nil!2243) (Cons!2242 (h!2863 (_ BitVec 64)) (t!7074 List!2246)) )
))
(declare-fun arrayNoDuplicates!0 (array!7435 (_ BitVec 32) List!2246) Bool)

(assert (=> b!176967 (= res!83887 (arrayNoDuplicates!0 (_keys!5509 thiss!1248) #b00000000000000000000000000000000 Nil!2243))))

(declare-fun b!176968 () Bool)

(declare-fun res!83886 () Bool)

(assert (=> b!176968 (=> (not res!83886) (not e!116704))))

(declare-datatypes ((tuple2!3294 0))(
  ( (tuple2!3295 (_1!1658 (_ BitVec 64)) (_2!1658 V!5171)) )
))
(declare-datatypes ((List!2247 0))(
  ( (Nil!2244) (Cons!2243 (h!2864 tuple2!3294) (t!7075 List!2247)) )
))
(declare-datatypes ((ListLongMap!2221 0))(
  ( (ListLongMap!2222 (toList!1126 List!2247)) )
))
(declare-fun contains!1191 (ListLongMap!2221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!778 (array!7435 array!7437 (_ BitVec 32) (_ BitVec 32) V!5171 V!5171 (_ BitVec 32) Int) ListLongMap!2221)

(assert (=> b!176968 (= res!83886 (contains!1191 (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)) key!828))))

(declare-fun b!176969 () Bool)

(declare-fun res!83891 () Bool)

(assert (=> b!176969 (=> (not res!83891) (not e!116704))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!562 0))(
  ( (MissingZero!562 (index!4416 (_ BitVec 32))) (Found!562 (index!4417 (_ BitVec 32))) (Intermediate!562 (undefined!1374 Bool) (index!4418 (_ BitVec 32)) (x!19416 (_ BitVec 32))) (Undefined!562) (MissingVacant!562 (index!4419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7435 (_ BitVec 32)) SeekEntryResult!562)

(assert (=> b!176969 (= res!83891 ((_ is Undefined!562) (seekEntryOrOpen!0 key!828 (_keys!5509 thiss!1248) (mask!8573 thiss!1248))))))

(declare-fun mapIsEmpty!7074 () Bool)

(assert (=> mapIsEmpty!7074 mapRes!7074))

(declare-fun res!83888 () Bool)

(assert (=> start!17698 (=> (not res!83888) (not e!116704))))

(declare-fun valid!992 (LongMapFixedSize!2364) Bool)

(assert (=> start!17698 (= res!83888 (valid!992 thiss!1248))))

(assert (=> start!17698 e!116704))

(assert (=> start!17698 e!116706))

(assert (=> start!17698 true))

(declare-fun b!176962 () Bool)

(assert (=> b!176962 (= e!116707 (and e!116703 mapRes!7074))))

(declare-fun condMapEmpty!7074 () Bool)

(declare-fun mapDefault!7074 () ValueCell!1728)

(assert (=> b!176962 (= condMapEmpty!7074 (= (arr!3528 (_values!3627 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1728)) mapDefault!7074)))))

(declare-fun b!176970 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!176970 (= e!116704 (not (validKeyInArray!0 key!828)))))

(declare-fun b!176971 () Bool)

(declare-fun res!83884 () Bool)

(assert (=> b!176971 (=> (not res!83884) (not e!116704))))

(assert (=> b!176971 (= res!83884 (and (= (size!3832 (_values!3627 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8573 thiss!1248))) (= (size!3831 (_keys!5509 thiss!1248)) (size!3832 (_values!3627 thiss!1248))) (bvsge (mask!8573 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3381 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3381 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!17698 res!83888) b!176961))

(assert (= (and b!176961 res!83890) b!176969))

(assert (= (and b!176969 res!83891) b!176968))

(assert (= (and b!176968 res!83886) b!176966))

(assert (= (and b!176966 res!83885) b!176971))

(assert (= (and b!176971 res!83884) b!176963))

(assert (= (and b!176963 res!83889) b!176967))

(assert (= (and b!176967 res!83887) b!176970))

(assert (= (and b!176962 condMapEmpty!7074) mapIsEmpty!7074))

(assert (= (and b!176962 (not condMapEmpty!7074)) mapNonEmpty!7074))

(assert (= (and mapNonEmpty!7074 ((_ is ValueCellFull!1728) mapValue!7074)) b!176965))

(assert (= (and b!176962 ((_ is ValueCellFull!1728) mapDefault!7074)) b!176960))

(assert (= b!176964 b!176962))

(assert (= start!17698 b!176964))

(declare-fun m!205603 () Bool)

(assert (=> b!176970 m!205603))

(declare-fun m!205605 () Bool)

(assert (=> b!176966 m!205605))

(declare-fun m!205607 () Bool)

(assert (=> start!17698 m!205607))

(declare-fun m!205609 () Bool)

(assert (=> b!176963 m!205609))

(declare-fun m!205611 () Bool)

(assert (=> b!176964 m!205611))

(declare-fun m!205613 () Bool)

(assert (=> b!176964 m!205613))

(declare-fun m!205615 () Bool)

(assert (=> b!176969 m!205615))

(declare-fun m!205617 () Bool)

(assert (=> b!176968 m!205617))

(assert (=> b!176968 m!205617))

(declare-fun m!205619 () Bool)

(assert (=> b!176968 m!205619))

(declare-fun m!205621 () Bool)

(assert (=> b!176967 m!205621))

(declare-fun m!205623 () Bool)

(assert (=> mapNonEmpty!7074 m!205623))

(check-sat (not b!176964) (not mapNonEmpty!7074) (not b_next!4371) (not b!176970) b_and!10869 (not b!176966) (not b!176963) (not b!176967) (not b!176969) (not start!17698) (not b!176968) tp_is_empty!4143)
(check-sat b_and!10869 (not b_next!4371))
(get-model)

(declare-fun b!177018 () Bool)

(declare-fun e!116735 () Bool)

(declare-fun call!17899 () Bool)

(assert (=> b!177018 (= e!116735 call!17899)))

(declare-fun d!53709 () Bool)

(declare-fun res!83924 () Bool)

(declare-fun e!116738 () Bool)

(assert (=> d!53709 (=> res!83924 e!116738)))

(assert (=> d!53709 (= res!83924 (bvsge #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))

(assert (=> d!53709 (= (arrayNoDuplicates!0 (_keys!5509 thiss!1248) #b00000000000000000000000000000000 Nil!2243) e!116738)))

(declare-fun b!177019 () Bool)

(declare-fun e!116736 () Bool)

(assert (=> b!177019 (= e!116736 e!116735)))

(declare-fun c!31699 () Bool)

(assert (=> b!177019 (= c!31699 (validKeyInArray!0 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17896 () Bool)

(assert (=> bm!17896 (= call!17899 (arrayNoDuplicates!0 (_keys!5509 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31699 (Cons!2242 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000) Nil!2243) Nil!2243)))))

(declare-fun b!177020 () Bool)

(declare-fun e!116737 () Bool)

(declare-fun contains!1193 (List!2246 (_ BitVec 64)) Bool)

(assert (=> b!177020 (= e!116737 (contains!1193 Nil!2243 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177021 () Bool)

(assert (=> b!177021 (= e!116735 call!17899)))

(declare-fun b!177022 () Bool)

(assert (=> b!177022 (= e!116738 e!116736)))

(declare-fun res!83922 () Bool)

(assert (=> b!177022 (=> (not res!83922) (not e!116736))))

(assert (=> b!177022 (= res!83922 (not e!116737))))

(declare-fun res!83923 () Bool)

(assert (=> b!177022 (=> (not res!83923) (not e!116737))))

(assert (=> b!177022 (= res!83923 (validKeyInArray!0 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53709 (not res!83924)) b!177022))

(assert (= (and b!177022 res!83923) b!177020))

(assert (= (and b!177022 res!83922) b!177019))

(assert (= (and b!177019 c!31699) b!177018))

(assert (= (and b!177019 (not c!31699)) b!177021))

(assert (= (or b!177018 b!177021) bm!17896))

(declare-fun m!205647 () Bool)

(assert (=> b!177019 m!205647))

(assert (=> b!177019 m!205647))

(declare-fun m!205649 () Bool)

(assert (=> b!177019 m!205649))

(assert (=> bm!17896 m!205647))

(declare-fun m!205651 () Bool)

(assert (=> bm!17896 m!205651))

(assert (=> b!177020 m!205647))

(assert (=> b!177020 m!205647))

(declare-fun m!205653 () Bool)

(assert (=> b!177020 m!205653))

(assert (=> b!177022 m!205647))

(assert (=> b!177022 m!205647))

(assert (=> b!177022 m!205649))

(assert (=> b!176967 d!53709))

(declare-fun b!177031 () Bool)

(declare-fun e!116745 () Bool)

(declare-fun e!116747 () Bool)

(assert (=> b!177031 (= e!116745 e!116747)))

(declare-fun c!31702 () Bool)

(assert (=> b!177031 (= c!31702 (validKeyInArray!0 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177032 () Bool)

(declare-fun e!116746 () Bool)

(declare-fun call!17902 () Bool)

(assert (=> b!177032 (= e!116746 call!17902)))

(declare-fun b!177033 () Bool)

(assert (=> b!177033 (= e!116747 e!116746)))

(declare-fun lt!87487 () (_ BitVec 64))

(assert (=> b!177033 (= lt!87487 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5412 0))(
  ( (Unit!5413) )
))
(declare-fun lt!87488 () Unit!5412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7435 (_ BitVec 64) (_ BitVec 32)) Unit!5412)

(assert (=> b!177033 (= lt!87488 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5509 thiss!1248) lt!87487 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!177033 (arrayContainsKey!0 (_keys!5509 thiss!1248) lt!87487 #b00000000000000000000000000000000)))

(declare-fun lt!87489 () Unit!5412)

(assert (=> b!177033 (= lt!87489 lt!87488)))

(declare-fun res!83929 () Bool)

(assert (=> b!177033 (= res!83929 (= (seekEntryOrOpen!0 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000) (_keys!5509 thiss!1248) (mask!8573 thiss!1248)) (Found!562 #b00000000000000000000000000000000)))))

(assert (=> b!177033 (=> (not res!83929) (not e!116746))))

(declare-fun b!177034 () Bool)

(assert (=> b!177034 (= e!116747 call!17902)))

(declare-fun d!53711 () Bool)

(declare-fun res!83930 () Bool)

(assert (=> d!53711 (=> res!83930 e!116745)))

(assert (=> d!53711 (= res!83930 (bvsge #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))

(assert (=> d!53711 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5509 thiss!1248) (mask!8573 thiss!1248)) e!116745)))

(declare-fun bm!17899 () Bool)

(assert (=> bm!17899 (= call!17902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5509 thiss!1248) (mask!8573 thiss!1248)))))

(assert (= (and d!53711 (not res!83930)) b!177031))

(assert (= (and b!177031 c!31702) b!177033))

(assert (= (and b!177031 (not c!31702)) b!177034))

(assert (= (and b!177033 res!83929) b!177032))

(assert (= (or b!177032 b!177034) bm!17899))

(assert (=> b!177031 m!205647))

(assert (=> b!177031 m!205647))

(assert (=> b!177031 m!205649))

(assert (=> b!177033 m!205647))

(declare-fun m!205655 () Bool)

(assert (=> b!177033 m!205655))

(declare-fun m!205657 () Bool)

(assert (=> b!177033 m!205657))

(assert (=> b!177033 m!205647))

(declare-fun m!205659 () Bool)

(assert (=> b!177033 m!205659))

(declare-fun m!205661 () Bool)

(assert (=> bm!17899 m!205661))

(assert (=> b!176963 d!53711))

(declare-fun d!53713 () Bool)

(declare-fun e!116753 () Bool)

(assert (=> d!53713 e!116753))

(declare-fun res!83933 () Bool)

(assert (=> d!53713 (=> res!83933 e!116753)))

(declare-fun lt!87501 () Bool)

(assert (=> d!53713 (= res!83933 (not lt!87501))))

(declare-fun lt!87499 () Bool)

(assert (=> d!53713 (= lt!87501 lt!87499)))

(declare-fun lt!87500 () Unit!5412)

(declare-fun e!116752 () Unit!5412)

(assert (=> d!53713 (= lt!87500 e!116752)))

(declare-fun c!31705 () Bool)

(assert (=> d!53713 (= c!31705 lt!87499)))

(declare-fun containsKey!198 (List!2247 (_ BitVec 64)) Bool)

(assert (=> d!53713 (= lt!87499 (containsKey!198 (toList!1126 (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248))) key!828))))

(assert (=> d!53713 (= (contains!1191 (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)) key!828) lt!87501)))

(declare-fun b!177041 () Bool)

(declare-fun lt!87498 () Unit!5412)

(assert (=> b!177041 (= e!116752 lt!87498)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!146 (List!2247 (_ BitVec 64)) Unit!5412)

(assert (=> b!177041 (= lt!87498 (lemmaContainsKeyImpliesGetValueByKeyDefined!146 (toList!1126 (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248))) key!828))))

(declare-datatypes ((Option!200 0))(
  ( (Some!199 (v!3997 V!5171)) (None!198) )
))
(declare-fun isDefined!147 (Option!200) Bool)

(declare-fun getValueByKey!194 (List!2247 (_ BitVec 64)) Option!200)

(assert (=> b!177041 (isDefined!147 (getValueByKey!194 (toList!1126 (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248))) key!828))))

(declare-fun b!177042 () Bool)

(declare-fun Unit!5414 () Unit!5412)

(assert (=> b!177042 (= e!116752 Unit!5414)))

(declare-fun b!177043 () Bool)

(assert (=> b!177043 (= e!116753 (isDefined!147 (getValueByKey!194 (toList!1126 (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248))) key!828)))))

(assert (= (and d!53713 c!31705) b!177041))

(assert (= (and d!53713 (not c!31705)) b!177042))

(assert (= (and d!53713 (not res!83933)) b!177043))

(declare-fun m!205663 () Bool)

(assert (=> d!53713 m!205663))

(declare-fun m!205665 () Bool)

(assert (=> b!177041 m!205665))

(declare-fun m!205667 () Bool)

(assert (=> b!177041 m!205667))

(assert (=> b!177041 m!205667))

(declare-fun m!205669 () Bool)

(assert (=> b!177041 m!205669))

(assert (=> b!177043 m!205667))

(assert (=> b!177043 m!205667))

(assert (=> b!177043 m!205669))

(assert (=> b!176968 d!53713))

(declare-fun b!177086 () Bool)

(declare-fun e!116781 () Unit!5412)

(declare-fun lt!87553 () Unit!5412)

(assert (=> b!177086 (= e!116781 lt!87553)))

(declare-fun lt!87558 () ListLongMap!2221)

(declare-fun getCurrentListMapNoExtraKeys!172 (array!7435 array!7437 (_ BitVec 32) (_ BitVec 32) V!5171 V!5171 (_ BitVec 32) Int) ListLongMap!2221)

(assert (=> b!177086 (= lt!87558 (getCurrentListMapNoExtraKeys!172 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)))))

(declare-fun lt!87552 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87552 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87560 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87560 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87548 () Unit!5412)

(declare-fun addStillContains!115 (ListLongMap!2221 (_ BitVec 64) V!5171 (_ BitVec 64)) Unit!5412)

(assert (=> b!177086 (= lt!87548 (addStillContains!115 lt!87558 lt!87552 (zeroValue!3485 thiss!1248) lt!87560))))

(declare-fun +!256 (ListLongMap!2221 tuple2!3294) ListLongMap!2221)

(assert (=> b!177086 (contains!1191 (+!256 lt!87558 (tuple2!3295 lt!87552 (zeroValue!3485 thiss!1248))) lt!87560)))

(declare-fun lt!87555 () Unit!5412)

(assert (=> b!177086 (= lt!87555 lt!87548)))

(declare-fun lt!87550 () ListLongMap!2221)

(assert (=> b!177086 (= lt!87550 (getCurrentListMapNoExtraKeys!172 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)))))

(declare-fun lt!87563 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87563 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87564 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87564 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87567 () Unit!5412)

(declare-fun addApplyDifferent!115 (ListLongMap!2221 (_ BitVec 64) V!5171 (_ BitVec 64)) Unit!5412)

(assert (=> b!177086 (= lt!87567 (addApplyDifferent!115 lt!87550 lt!87563 (minValue!3485 thiss!1248) lt!87564))))

(declare-fun apply!139 (ListLongMap!2221 (_ BitVec 64)) V!5171)

(assert (=> b!177086 (= (apply!139 (+!256 lt!87550 (tuple2!3295 lt!87563 (minValue!3485 thiss!1248))) lt!87564) (apply!139 lt!87550 lt!87564))))

(declare-fun lt!87565 () Unit!5412)

(assert (=> b!177086 (= lt!87565 lt!87567)))

(declare-fun lt!87546 () ListLongMap!2221)

(assert (=> b!177086 (= lt!87546 (getCurrentListMapNoExtraKeys!172 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)))))

(declare-fun lt!87556 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87561 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87561 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87559 () Unit!5412)

(assert (=> b!177086 (= lt!87559 (addApplyDifferent!115 lt!87546 lt!87556 (zeroValue!3485 thiss!1248) lt!87561))))

(assert (=> b!177086 (= (apply!139 (+!256 lt!87546 (tuple2!3295 lt!87556 (zeroValue!3485 thiss!1248))) lt!87561) (apply!139 lt!87546 lt!87561))))

(declare-fun lt!87549 () Unit!5412)

(assert (=> b!177086 (= lt!87549 lt!87559)))

(declare-fun lt!87566 () ListLongMap!2221)

(assert (=> b!177086 (= lt!87566 (getCurrentListMapNoExtraKeys!172 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)))))

(declare-fun lt!87554 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87554 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87547 () (_ BitVec 64))

(assert (=> b!177086 (= lt!87547 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177086 (= lt!87553 (addApplyDifferent!115 lt!87566 lt!87554 (minValue!3485 thiss!1248) lt!87547))))

(assert (=> b!177086 (= (apply!139 (+!256 lt!87566 (tuple2!3295 lt!87554 (minValue!3485 thiss!1248))) lt!87547) (apply!139 lt!87566 lt!87547))))

(declare-fun b!177087 () Bool)

(declare-fun e!116789 () Bool)

(declare-fun e!116786 () Bool)

(assert (=> b!177087 (= e!116789 e!116786)))

(declare-fun c!31721 () Bool)

(assert (=> b!177087 (= c!31721 (not (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177088 () Bool)

(declare-fun e!116791 () Bool)

(declare-fun e!116787 () Bool)

(assert (=> b!177088 (= e!116791 e!116787)))

(declare-fun res!83954 () Bool)

(assert (=> b!177088 (=> (not res!83954) (not e!116787))))

(declare-fun lt!87562 () ListLongMap!2221)

(assert (=> b!177088 (= res!83954 (contains!1191 lt!87562 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))

(declare-fun b!177090 () Bool)

(declare-fun e!116792 () Bool)

(assert (=> b!177090 (= e!116792 (validKeyInArray!0 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun c!31723 () Bool)

(declare-fun call!17920 () ListLongMap!2221)

(declare-fun call!17921 () ListLongMap!2221)

(declare-fun call!17922 () ListLongMap!2221)

(declare-fun bm!17914 () Bool)

(declare-fun call!17919 () ListLongMap!2221)

(declare-fun c!31719 () Bool)

(assert (=> bm!17914 (= call!17919 (+!256 (ite c!31723 call!17922 (ite c!31719 call!17921 call!17920)) (ite (or c!31723 c!31719) (tuple2!3295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3485 thiss!1248)) (tuple2!3295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3485 thiss!1248)))))))

(declare-fun b!177091 () Bool)

(declare-fun c!31718 () Bool)

(assert (=> b!177091 (= c!31718 (and (not (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116783 () ListLongMap!2221)

(declare-fun e!116784 () ListLongMap!2221)

(assert (=> b!177091 (= e!116783 e!116784)))

(declare-fun b!177092 () Bool)

(declare-fun e!116782 () Bool)

(declare-fun call!17923 () Bool)

(assert (=> b!177092 (= e!116782 (not call!17923))))

(declare-fun b!177093 () Bool)

(declare-fun call!17917 () ListLongMap!2221)

(assert (=> b!177093 (= e!116784 call!17917)))

(declare-fun b!177094 () Bool)

(assert (=> b!177094 (= e!116783 call!17917)))

(declare-fun bm!17915 () Bool)

(assert (=> bm!17915 (= call!17920 call!17921)))

(declare-fun b!177095 () Bool)

(assert (=> b!177095 (= e!116784 call!17920)))

(declare-fun b!177089 () Bool)

(declare-fun call!17918 () Bool)

(assert (=> b!177089 (= e!116786 (not call!17918))))

(declare-fun d!53715 () Bool)

(assert (=> d!53715 e!116789))

(declare-fun res!83956 () Bool)

(assert (=> d!53715 (=> (not res!83956) (not e!116789))))

(assert (=> d!53715 (= res!83956 (or (bvsge #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))))

(declare-fun lt!87557 () ListLongMap!2221)

(assert (=> d!53715 (= lt!87562 lt!87557)))

(declare-fun lt!87551 () Unit!5412)

(assert (=> d!53715 (= lt!87551 e!116781)))

(declare-fun c!31720 () Bool)

(assert (=> d!53715 (= c!31720 e!116792)))

(declare-fun res!83957 () Bool)

(assert (=> d!53715 (=> (not res!83957) (not e!116792))))

(assert (=> d!53715 (= res!83957 (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))

(declare-fun e!116780 () ListLongMap!2221)

(assert (=> d!53715 (= lt!87557 e!116780)))

(assert (=> d!53715 (= c!31723 (and (not (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53715 (validMask!0 (mask!8573 thiss!1248))))

(assert (=> d!53715 (= (getCurrentListMap!778 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)) lt!87562)))

(declare-fun b!177096 () Bool)

(declare-fun Unit!5415 () Unit!5412)

(assert (=> b!177096 (= e!116781 Unit!5415)))

(declare-fun b!177097 () Bool)

(declare-fun e!116790 () Bool)

(assert (=> b!177097 (= e!116790 (validKeyInArray!0 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177098 () Bool)

(assert (=> b!177098 (= e!116780 (+!256 call!17919 (tuple2!3295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3485 thiss!1248))))))

(declare-fun bm!17916 () Bool)

(assert (=> bm!17916 (= call!17917 call!17919)))

(declare-fun b!177099 () Bool)

(declare-fun res!83960 () Bool)

(assert (=> b!177099 (=> (not res!83960) (not e!116789))))

(assert (=> b!177099 (= res!83960 e!116791)))

(declare-fun res!83955 () Bool)

(assert (=> b!177099 (=> res!83955 e!116791)))

(assert (=> b!177099 (= res!83955 (not e!116790))))

(declare-fun res!83959 () Bool)

(assert (=> b!177099 (=> (not res!83959) (not e!116790))))

(assert (=> b!177099 (= res!83959 (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))

(declare-fun b!177100 () Bool)

(assert (=> b!177100 (= e!116780 e!116783)))

(assert (=> b!177100 (= c!31719 (and (not (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177101 () Bool)

(declare-fun get!2012 (ValueCell!1728 V!5171) V!5171)

(declare-fun dynLambda!482 (Int (_ BitVec 64)) V!5171)

(assert (=> b!177101 (= e!116787 (= (apply!139 lt!87562 (select (arr!3527 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000)) (get!2012 (select (arr!3528 (_values!3627 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!482 (defaultEntry!3644 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3832 (_values!3627 thiss!1248))))))

(assert (=> b!177101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))))))

(declare-fun bm!17917 () Bool)

(assert (=> bm!17917 (= call!17923 (contains!1191 lt!87562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17918 () Bool)

(assert (=> bm!17918 (= call!17918 (contains!1191 lt!87562 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17919 () Bool)

(assert (=> bm!17919 (= call!17921 call!17922)))

(declare-fun b!177102 () Bool)

(declare-fun e!116788 () Bool)

(assert (=> b!177102 (= e!116788 (= (apply!139 lt!87562 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3485 thiss!1248)))))

(declare-fun b!177103 () Bool)

(declare-fun res!83952 () Bool)

(assert (=> b!177103 (=> (not res!83952) (not e!116789))))

(assert (=> b!177103 (= res!83952 e!116782)))

(declare-fun c!31722 () Bool)

(assert (=> b!177103 (= c!31722 (not (= (bvand (extraKeys!3381 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177104 () Bool)

(declare-fun e!116785 () Bool)

(assert (=> b!177104 (= e!116782 e!116785)))

(declare-fun res!83958 () Bool)

(assert (=> b!177104 (= res!83958 call!17923)))

(assert (=> b!177104 (=> (not res!83958) (not e!116785))))

(declare-fun bm!17920 () Bool)

(assert (=> bm!17920 (= call!17922 (getCurrentListMapNoExtraKeys!172 (_keys!5509 thiss!1248) (_values!3627 thiss!1248) (mask!8573 thiss!1248) (extraKeys!3381 thiss!1248) (zeroValue!3485 thiss!1248) (minValue!3485 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3644 thiss!1248)))))

(declare-fun b!177105 () Bool)

(assert (=> b!177105 (= e!116786 e!116788)))

(declare-fun res!83953 () Bool)

(assert (=> b!177105 (= res!83953 call!17918)))

(assert (=> b!177105 (=> (not res!83953) (not e!116788))))

(declare-fun b!177106 () Bool)

(assert (=> b!177106 (= e!116785 (= (apply!139 lt!87562 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3485 thiss!1248)))))

(assert (= (and d!53715 c!31723) b!177098))

(assert (= (and d!53715 (not c!31723)) b!177100))

(assert (= (and b!177100 c!31719) b!177094))

(assert (= (and b!177100 (not c!31719)) b!177091))

(assert (= (and b!177091 c!31718) b!177093))

(assert (= (and b!177091 (not c!31718)) b!177095))

(assert (= (or b!177093 b!177095) bm!17915))

(assert (= (or b!177094 bm!17915) bm!17919))

(assert (= (or b!177094 b!177093) bm!17916))

(assert (= (or b!177098 bm!17919) bm!17920))

(assert (= (or b!177098 bm!17916) bm!17914))

(assert (= (and d!53715 res!83957) b!177090))

(assert (= (and d!53715 c!31720) b!177086))

(assert (= (and d!53715 (not c!31720)) b!177096))

(assert (= (and d!53715 res!83956) b!177099))

(assert (= (and b!177099 res!83959) b!177097))

(assert (= (and b!177099 (not res!83955)) b!177088))

(assert (= (and b!177088 res!83954) b!177101))

(assert (= (and b!177099 res!83960) b!177103))

(assert (= (and b!177103 c!31722) b!177104))

(assert (= (and b!177103 (not c!31722)) b!177092))

(assert (= (and b!177104 res!83958) b!177106))

(assert (= (or b!177104 b!177092) bm!17917))

(assert (= (and b!177103 res!83952) b!177087))

(assert (= (and b!177087 c!31721) b!177105))

(assert (= (and b!177087 (not c!31721)) b!177089))

(assert (= (and b!177105 res!83953) b!177102))

(assert (= (or b!177105 b!177089) bm!17918))

(declare-fun b_lambda!7047 () Bool)

(assert (=> (not b_lambda!7047) (not b!177101)))

(declare-fun t!7079 () Bool)

(declare-fun tb!2789 () Bool)

(assert (=> (and b!176964 (= (defaultEntry!3644 thiss!1248) (defaultEntry!3644 thiss!1248)) t!7079) tb!2789))

(declare-fun result!4641 () Bool)

(assert (=> tb!2789 (= result!4641 tp_is_empty!4143)))

(assert (=> b!177101 t!7079))

(declare-fun b_and!10873 () Bool)

(assert (= b_and!10869 (and (=> t!7079 result!4641) b_and!10873)))

(declare-fun m!205671 () Bool)

(assert (=> bm!17914 m!205671))

(assert (=> d!53715 m!205605))

(declare-fun m!205673 () Bool)

(assert (=> bm!17918 m!205673))

(declare-fun m!205675 () Bool)

(assert (=> b!177102 m!205675))

(assert (=> b!177097 m!205647))

(assert (=> b!177097 m!205647))

(assert (=> b!177097 m!205649))

(declare-fun m!205677 () Bool)

(assert (=> bm!17920 m!205677))

(declare-fun m!205679 () Bool)

(assert (=> bm!17917 m!205679))

(declare-fun m!205681 () Bool)

(assert (=> b!177106 m!205681))

(declare-fun m!205683 () Bool)

(assert (=> b!177101 m!205683))

(assert (=> b!177101 m!205647))

(declare-fun m!205685 () Bool)

(assert (=> b!177101 m!205685))

(assert (=> b!177101 m!205647))

(declare-fun m!205687 () Bool)

(assert (=> b!177101 m!205687))

(assert (=> b!177101 m!205687))

(assert (=> b!177101 m!205683))

(declare-fun m!205689 () Bool)

(assert (=> b!177101 m!205689))

(assert (=> b!177090 m!205647))

(assert (=> b!177090 m!205647))

(assert (=> b!177090 m!205649))

(declare-fun m!205691 () Bool)

(assert (=> b!177086 m!205691))

(declare-fun m!205693 () Bool)

(assert (=> b!177086 m!205693))

(declare-fun m!205695 () Bool)

(assert (=> b!177086 m!205695))

(declare-fun m!205697 () Bool)

(assert (=> b!177086 m!205697))

(declare-fun m!205699 () Bool)

(assert (=> b!177086 m!205699))

(declare-fun m!205701 () Bool)

(assert (=> b!177086 m!205701))

(declare-fun m!205703 () Bool)

(assert (=> b!177086 m!205703))

(declare-fun m!205705 () Bool)

(assert (=> b!177086 m!205705))

(declare-fun m!205707 () Bool)

(assert (=> b!177086 m!205707))

(declare-fun m!205709 () Bool)

(assert (=> b!177086 m!205709))

(assert (=> b!177086 m!205647))

(assert (=> b!177086 m!205677))

(assert (=> b!177086 m!205703))

(declare-fun m!205711 () Bool)

(assert (=> b!177086 m!205711))

(declare-fun m!205713 () Bool)

(assert (=> b!177086 m!205713))

(assert (=> b!177086 m!205691))

(declare-fun m!205715 () Bool)

(assert (=> b!177086 m!205715))

(assert (=> b!177086 m!205693))

(declare-fun m!205717 () Bool)

(assert (=> b!177086 m!205717))

(assert (=> b!177086 m!205705))

(declare-fun m!205719 () Bool)

(assert (=> b!177086 m!205719))

(declare-fun m!205721 () Bool)

(assert (=> b!177098 m!205721))

(assert (=> b!177088 m!205647))

(assert (=> b!177088 m!205647))

(declare-fun m!205723 () Bool)

(assert (=> b!177088 m!205723))

(assert (=> b!176968 d!53715))

(declare-fun d!53717 () Bool)

(assert (=> d!53717 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!176970 d!53717))

(declare-fun d!53719 () Bool)

(assert (=> d!53719 (= (validMask!0 (mask!8573 thiss!1248)) (and (or (= (mask!8573 thiss!1248) #b00000000000000000000000000000111) (= (mask!8573 thiss!1248) #b00000000000000000000000000001111) (= (mask!8573 thiss!1248) #b00000000000000000000000000011111) (= (mask!8573 thiss!1248) #b00000000000000000000000000111111) (= (mask!8573 thiss!1248) #b00000000000000000000000001111111) (= (mask!8573 thiss!1248) #b00000000000000000000000011111111) (= (mask!8573 thiss!1248) #b00000000000000000000000111111111) (= (mask!8573 thiss!1248) #b00000000000000000000001111111111) (= (mask!8573 thiss!1248) #b00000000000000000000011111111111) (= (mask!8573 thiss!1248) #b00000000000000000000111111111111) (= (mask!8573 thiss!1248) #b00000000000000000001111111111111) (= (mask!8573 thiss!1248) #b00000000000000000011111111111111) (= (mask!8573 thiss!1248) #b00000000000000000111111111111111) (= (mask!8573 thiss!1248) #b00000000000000001111111111111111) (= (mask!8573 thiss!1248) #b00000000000000011111111111111111) (= (mask!8573 thiss!1248) #b00000000000000111111111111111111) (= (mask!8573 thiss!1248) #b00000000000001111111111111111111) (= (mask!8573 thiss!1248) #b00000000000011111111111111111111) (= (mask!8573 thiss!1248) #b00000000000111111111111111111111) (= (mask!8573 thiss!1248) #b00000000001111111111111111111111) (= (mask!8573 thiss!1248) #b00000000011111111111111111111111) (= (mask!8573 thiss!1248) #b00000000111111111111111111111111) (= (mask!8573 thiss!1248) #b00000001111111111111111111111111) (= (mask!8573 thiss!1248) #b00000011111111111111111111111111) (= (mask!8573 thiss!1248) #b00000111111111111111111111111111) (= (mask!8573 thiss!1248) #b00001111111111111111111111111111) (= (mask!8573 thiss!1248) #b00011111111111111111111111111111) (= (mask!8573 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8573 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!176966 d!53719))

(declare-fun d!53721 () Bool)

(declare-fun res!83967 () Bool)

(declare-fun e!116795 () Bool)

(assert (=> d!53721 (=> (not res!83967) (not e!116795))))

(declare-fun simpleValid!153 (LongMapFixedSize!2364) Bool)

(assert (=> d!53721 (= res!83967 (simpleValid!153 thiss!1248))))

(assert (=> d!53721 (= (valid!992 thiss!1248) e!116795)))

(declare-fun b!177115 () Bool)

(declare-fun res!83968 () Bool)

(assert (=> b!177115 (=> (not res!83968) (not e!116795))))

(declare-fun arrayCountValidKeys!0 (array!7435 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177115 (= res!83968 (= (arrayCountValidKeys!0 (_keys!5509 thiss!1248) #b00000000000000000000000000000000 (size!3831 (_keys!5509 thiss!1248))) (_size!1231 thiss!1248)))))

(declare-fun b!177116 () Bool)

(declare-fun res!83969 () Bool)

(assert (=> b!177116 (=> (not res!83969) (not e!116795))))

(assert (=> b!177116 (= res!83969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5509 thiss!1248) (mask!8573 thiss!1248)))))

(declare-fun b!177117 () Bool)

(assert (=> b!177117 (= e!116795 (arrayNoDuplicates!0 (_keys!5509 thiss!1248) #b00000000000000000000000000000000 Nil!2243))))

(assert (= (and d!53721 res!83967) b!177115))

(assert (= (and b!177115 res!83968) b!177116))

(assert (= (and b!177116 res!83969) b!177117))

(declare-fun m!205725 () Bool)

(assert (=> d!53721 m!205725))

(declare-fun m!205727 () Bool)

(assert (=> b!177115 m!205727))

(assert (=> b!177116 m!205609))

(assert (=> b!177117 m!205621))

(assert (=> start!17698 d!53721))

(declare-fun b!177131 () Bool)

(declare-fun e!116802 () SeekEntryResult!562)

(declare-fun lt!87576 () SeekEntryResult!562)

(assert (=> b!177131 (= e!116802 (Found!562 (index!4418 lt!87576)))))

(declare-fun b!177132 () Bool)

(declare-fun e!116803 () SeekEntryResult!562)

(assert (=> b!177132 (= e!116803 Undefined!562)))

(declare-fun b!177133 () Bool)

(declare-fun e!116804 () SeekEntryResult!562)

(assert (=> b!177133 (= e!116804 (MissingZero!562 (index!4418 lt!87576)))))

(declare-fun b!177134 () Bool)

(declare-fun c!31731 () Bool)

(declare-fun lt!87574 () (_ BitVec 64))

(assert (=> b!177134 (= c!31731 (= lt!87574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177134 (= e!116802 e!116804)))

(declare-fun b!177135 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7435 (_ BitVec 32)) SeekEntryResult!562)

(assert (=> b!177135 (= e!116804 (seekKeyOrZeroReturnVacant!0 (x!19416 lt!87576) (index!4418 lt!87576) (index!4418 lt!87576) key!828 (_keys!5509 thiss!1248) (mask!8573 thiss!1248)))))

(declare-fun b!177130 () Bool)

(assert (=> b!177130 (= e!116803 e!116802)))

(assert (=> b!177130 (= lt!87574 (select (arr!3527 (_keys!5509 thiss!1248)) (index!4418 lt!87576)))))

(declare-fun c!31730 () Bool)

(assert (=> b!177130 (= c!31730 (= lt!87574 key!828))))

(declare-fun d!53723 () Bool)

(declare-fun lt!87575 () SeekEntryResult!562)

(assert (=> d!53723 (and (or ((_ is Undefined!562) lt!87575) (not ((_ is Found!562) lt!87575)) (and (bvsge (index!4417 lt!87575) #b00000000000000000000000000000000) (bvslt (index!4417 lt!87575) (size!3831 (_keys!5509 thiss!1248))))) (or ((_ is Undefined!562) lt!87575) ((_ is Found!562) lt!87575) (not ((_ is MissingZero!562) lt!87575)) (and (bvsge (index!4416 lt!87575) #b00000000000000000000000000000000) (bvslt (index!4416 lt!87575) (size!3831 (_keys!5509 thiss!1248))))) (or ((_ is Undefined!562) lt!87575) ((_ is Found!562) lt!87575) ((_ is MissingZero!562) lt!87575) (not ((_ is MissingVacant!562) lt!87575)) (and (bvsge (index!4419 lt!87575) #b00000000000000000000000000000000) (bvslt (index!4419 lt!87575) (size!3831 (_keys!5509 thiss!1248))))) (or ((_ is Undefined!562) lt!87575) (ite ((_ is Found!562) lt!87575) (= (select (arr!3527 (_keys!5509 thiss!1248)) (index!4417 lt!87575)) key!828) (ite ((_ is MissingZero!562) lt!87575) (= (select (arr!3527 (_keys!5509 thiss!1248)) (index!4416 lt!87575)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!562) lt!87575) (= (select (arr!3527 (_keys!5509 thiss!1248)) (index!4419 lt!87575)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53723 (= lt!87575 e!116803)))

(declare-fun c!31732 () Bool)

(assert (=> d!53723 (= c!31732 (and ((_ is Intermediate!562) lt!87576) (undefined!1374 lt!87576)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7435 (_ BitVec 32)) SeekEntryResult!562)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53723 (= lt!87576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8573 thiss!1248)) key!828 (_keys!5509 thiss!1248) (mask!8573 thiss!1248)))))

(assert (=> d!53723 (validMask!0 (mask!8573 thiss!1248))))

(assert (=> d!53723 (= (seekEntryOrOpen!0 key!828 (_keys!5509 thiss!1248) (mask!8573 thiss!1248)) lt!87575)))

(assert (= (and d!53723 c!31732) b!177132))

(assert (= (and d!53723 (not c!31732)) b!177130))

(assert (= (and b!177130 c!31730) b!177131))

(assert (= (and b!177130 (not c!31730)) b!177134))

(assert (= (and b!177134 c!31731) b!177133))

(assert (= (and b!177134 (not c!31731)) b!177135))

(declare-fun m!205729 () Bool)

(assert (=> b!177135 m!205729))

(declare-fun m!205731 () Bool)

(assert (=> b!177130 m!205731))

(declare-fun m!205733 () Bool)

(assert (=> d!53723 m!205733))

(declare-fun m!205735 () Bool)

(assert (=> d!53723 m!205735))

(declare-fun m!205737 () Bool)

(assert (=> d!53723 m!205737))

(assert (=> d!53723 m!205735))

(assert (=> d!53723 m!205605))

(declare-fun m!205739 () Bool)

(assert (=> d!53723 m!205739))

(declare-fun m!205741 () Bool)

(assert (=> d!53723 m!205741))

(assert (=> b!176969 d!53723))

(declare-fun d!53725 () Bool)

(assert (=> d!53725 (= (array_inv!2259 (_keys!5509 thiss!1248)) (bvsge (size!3831 (_keys!5509 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176964 d!53725))

(declare-fun d!53727 () Bool)

(assert (=> d!53727 (= (array_inv!2260 (_values!3627 thiss!1248)) (bvsge (size!3832 (_values!3627 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!176964 d!53727))

(declare-fun b!177142 () Bool)

(declare-fun e!116809 () Bool)

(assert (=> b!177142 (= e!116809 tp_is_empty!4143)))

(declare-fun condMapEmpty!7080 () Bool)

(declare-fun mapDefault!7080 () ValueCell!1728)

(assert (=> mapNonEmpty!7074 (= condMapEmpty!7080 (= mapRest!7074 ((as const (Array (_ BitVec 32) ValueCell!1728)) mapDefault!7080)))))

(declare-fun e!116810 () Bool)

(declare-fun mapRes!7080 () Bool)

(assert (=> mapNonEmpty!7074 (= tp!15809 (and e!116810 mapRes!7080))))

(declare-fun mapNonEmpty!7080 () Bool)

(declare-fun tp!15819 () Bool)

(assert (=> mapNonEmpty!7080 (= mapRes!7080 (and tp!15819 e!116809))))

(declare-fun mapRest!7080 () (Array (_ BitVec 32) ValueCell!1728))

(declare-fun mapValue!7080 () ValueCell!1728)

(declare-fun mapKey!7080 () (_ BitVec 32))

(assert (=> mapNonEmpty!7080 (= mapRest!7074 (store mapRest!7080 mapKey!7080 mapValue!7080))))

(declare-fun mapIsEmpty!7080 () Bool)

(assert (=> mapIsEmpty!7080 mapRes!7080))

(declare-fun b!177143 () Bool)

(assert (=> b!177143 (= e!116810 tp_is_empty!4143)))

(assert (= (and mapNonEmpty!7074 condMapEmpty!7080) mapIsEmpty!7080))

(assert (= (and mapNonEmpty!7074 (not condMapEmpty!7080)) mapNonEmpty!7080))

(assert (= (and mapNonEmpty!7080 ((_ is ValueCellFull!1728) mapValue!7080)) b!177142))

(assert (= (and mapNonEmpty!7074 ((_ is ValueCellFull!1728) mapDefault!7080)) b!177143))

(declare-fun m!205743 () Bool)

(assert (=> mapNonEmpty!7080 m!205743))

(declare-fun b_lambda!7049 () Bool)

(assert (= b_lambda!7047 (or (and b!176964 b_free!4371) b_lambda!7049)))

(check-sat (not bm!17914) (not b!177041) (not b!177097) (not b!177019) (not b!177088) (not b!177022) (not b!177135) (not bm!17899) (not b!177020) tp_is_empty!4143 (not d!53721) (not d!53723) (not b!177031) (not b!177102) (not b!177115) (not bm!17896) (not bm!17920) (not b!177117) (not b_next!4371) b_and!10873 (not b!177033) (not b!177116) (not b!177098) (not b!177043) (not bm!17918) (not b!177086) (not b!177101) (not mapNonEmpty!7080) (not d!53713) (not d!53715) (not b_lambda!7049) (not b!177106) (not b!177090) (not bm!17917))
(check-sat b_and!10873 (not b_next!4371))
