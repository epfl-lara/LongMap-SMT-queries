; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18332 () Bool)

(assert start!18332)

(declare-fun b!181814 () Bool)

(declare-fun b_free!4489 () Bool)

(declare-fun b_next!4489 () Bool)

(assert (=> b!181814 (= b_free!4489 (not b_next!4489))))

(declare-fun tp!16221 () Bool)

(declare-fun b_and!11019 () Bool)

(assert (=> b!181814 (= tp!16221 b_and!11019)))

(declare-fun b!181807 () Bool)

(declare-fun e!119730 () Bool)

(declare-fun e!119727 () Bool)

(declare-fun mapRes!7309 () Bool)

(assert (=> b!181807 (= e!119730 (and e!119727 mapRes!7309))))

(declare-fun condMapEmpty!7309 () Bool)

(declare-datatypes ((V!5329 0))(
  ( (V!5330 (val!2175 Int)) )
))
(declare-datatypes ((ValueCell!1787 0))(
  ( (ValueCellFull!1787 (v!4067 V!5329)) (EmptyCell!1787) )
))
(declare-datatypes ((array!7685 0))(
  ( (array!7686 (arr!3634 (Array (_ BitVec 32) (_ BitVec 64))) (size!3946 (_ BitVec 32))) )
))
(declare-datatypes ((array!7687 0))(
  ( (array!7688 (arr!3635 (Array (_ BitVec 32) ValueCell!1787)) (size!3947 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2482 0))(
  ( (LongMapFixedSize!2483 (defaultEntry!3725 Int) (mask!8757 (_ BitVec 32)) (extraKeys!3462 (_ BitVec 32)) (zeroValue!3566 V!5329) (minValue!3566 V!5329) (_size!1290 (_ BitVec 32)) (_keys!5631 array!7685) (_values!3708 array!7687) (_vacant!1290 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2482)

(declare-fun mapDefault!7309 () ValueCell!1787)

(assert (=> b!181807 (= condMapEmpty!7309 (= (arr!3635 (_values!3708 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1787)) mapDefault!7309)))))

(declare-fun b!181808 () Bool)

(declare-fun res!86026 () Bool)

(declare-fun e!119726 () Bool)

(assert (=> b!181808 (=> (not res!86026) (not e!119726))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3364 0))(
  ( (tuple2!3365 (_1!1693 (_ BitVec 64)) (_2!1693 V!5329)) )
))
(declare-datatypes ((List!2308 0))(
  ( (Nil!2305) (Cons!2304 (h!2932 tuple2!3364) (t!7157 List!2308)) )
))
(declare-datatypes ((ListLongMap!2273 0))(
  ( (ListLongMap!2274 (toList!1152 List!2308)) )
))
(declare-fun contains!1240 (ListLongMap!2273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!785 (array!7685 array!7687 (_ BitVec 32) (_ BitVec 32) V!5329 V!5329 (_ BitVec 32) Int) ListLongMap!2273)

(assert (=> b!181808 (= res!86026 (contains!1240 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) key!828))))

(declare-fun b!181809 () Bool)

(declare-fun res!86030 () Bool)

(assert (=> b!181809 (=> (not res!86030) (not e!119726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181809 (= res!86030 (validMask!0 (mask!8757 thiss!1248)))))

(declare-fun b!181810 () Bool)

(declare-fun tp_is_empty!4261 () Bool)

(assert (=> b!181810 (= e!119727 tp_is_empty!4261)))

(declare-fun b!181811 () Bool)

(assert (=> b!181811 (= e!119726 (and (= (size!3947 (_values!3708 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8757 thiss!1248))) (= (size!3946 (_keys!5631 thiss!1248)) (size!3947 (_values!3708 thiss!1248))) (bvsge (mask!8757 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3462 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3462 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7309 () Bool)

(assert (=> mapIsEmpty!7309 mapRes!7309))

(declare-fun b!181812 () Bool)

(declare-fun e!119725 () Bool)

(assert (=> b!181812 (= e!119725 e!119726)))

(declare-fun res!86029 () Bool)

(assert (=> b!181812 (=> (not res!86029) (not e!119726))))

(declare-datatypes ((SeekEntryResult!612 0))(
  ( (MissingZero!612 (index!4618 (_ BitVec 32))) (Found!612 (index!4619 (_ BitVec 32))) (Intermediate!612 (undefined!1424 Bool) (index!4620 (_ BitVec 32)) (x!19859 (_ BitVec 32))) (Undefined!612) (MissingVacant!612 (index!4621 (_ BitVec 32))) )
))
(declare-fun lt!89803 () SeekEntryResult!612)

(get-info :version)

(assert (=> b!181812 (= res!86029 (and (not ((_ is Undefined!612) lt!89803)) (not ((_ is MissingVacant!612) lt!89803)) (not ((_ is MissingZero!612) lt!89803)) ((_ is Found!612) lt!89803)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7685 (_ BitVec 32)) SeekEntryResult!612)

(assert (=> b!181812 (= lt!89803 (seekEntryOrOpen!0 key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(declare-fun res!86028 () Bool)

(assert (=> start!18332 (=> (not res!86028) (not e!119725))))

(declare-fun valid!1049 (LongMapFixedSize!2482) Bool)

(assert (=> start!18332 (= res!86028 (valid!1049 thiss!1248))))

(assert (=> start!18332 e!119725))

(declare-fun e!119729 () Bool)

(assert (=> start!18332 e!119729))

(assert (=> start!18332 true))

(declare-fun b!181813 () Bool)

(declare-fun e!119728 () Bool)

(assert (=> b!181813 (= e!119728 tp_is_empty!4261)))

(declare-fun array_inv!2351 (array!7685) Bool)

(declare-fun array_inv!2352 (array!7687) Bool)

(assert (=> b!181814 (= e!119729 (and tp!16221 tp_is_empty!4261 (array_inv!2351 (_keys!5631 thiss!1248)) (array_inv!2352 (_values!3708 thiss!1248)) e!119730))))

(declare-fun mapNonEmpty!7309 () Bool)

(declare-fun tp!16222 () Bool)

(assert (=> mapNonEmpty!7309 (= mapRes!7309 (and tp!16222 e!119728))))

(declare-fun mapRest!7309 () (Array (_ BitVec 32) ValueCell!1787))

(declare-fun mapKey!7309 () (_ BitVec 32))

(declare-fun mapValue!7309 () ValueCell!1787)

(assert (=> mapNonEmpty!7309 (= (arr!3635 (_values!3708 thiss!1248)) (store mapRest!7309 mapKey!7309 mapValue!7309))))

(declare-fun b!181815 () Bool)

(declare-fun res!86027 () Bool)

(assert (=> b!181815 (=> (not res!86027) (not e!119725))))

(assert (=> b!181815 (= res!86027 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!18332 res!86028) b!181815))

(assert (= (and b!181815 res!86027) b!181812))

(assert (= (and b!181812 res!86029) b!181808))

(assert (= (and b!181808 res!86026) b!181809))

(assert (= (and b!181809 res!86030) b!181811))

(assert (= (and b!181807 condMapEmpty!7309) mapIsEmpty!7309))

(assert (= (and b!181807 (not condMapEmpty!7309)) mapNonEmpty!7309))

(assert (= (and mapNonEmpty!7309 ((_ is ValueCellFull!1787) mapValue!7309)) b!181813))

(assert (= (and b!181807 ((_ is ValueCellFull!1787) mapDefault!7309)) b!181810))

(assert (= b!181814 b!181807))

(assert (= start!18332 b!181814))

(declare-fun m!209189 () Bool)

(assert (=> start!18332 m!209189))

(declare-fun m!209191 () Bool)

(assert (=> b!181812 m!209191))

(declare-fun m!209193 () Bool)

(assert (=> mapNonEmpty!7309 m!209193))

(declare-fun m!209195 () Bool)

(assert (=> b!181808 m!209195))

(assert (=> b!181808 m!209195))

(declare-fun m!209197 () Bool)

(assert (=> b!181808 m!209197))

(declare-fun m!209199 () Bool)

(assert (=> b!181809 m!209199))

(declare-fun m!209201 () Bool)

(assert (=> b!181814 m!209201))

(declare-fun m!209203 () Bool)

(assert (=> b!181814 m!209203))

(check-sat (not start!18332) (not b!181812) (not b!181809) tp_is_empty!4261 (not b_next!4489) b_and!11019 (not mapNonEmpty!7309) (not b!181808) (not b!181814))
(check-sat b_and!11019 (not b_next!4489))
(get-model)

(declare-fun d!54387 () Bool)

(assert (=> d!54387 (= (validMask!0 (mask!8757 thiss!1248)) (and (or (= (mask!8757 thiss!1248) #b00000000000000000000000000000111) (= (mask!8757 thiss!1248) #b00000000000000000000000000001111) (= (mask!8757 thiss!1248) #b00000000000000000000000000011111) (= (mask!8757 thiss!1248) #b00000000000000000000000000111111) (= (mask!8757 thiss!1248) #b00000000000000000000000001111111) (= (mask!8757 thiss!1248) #b00000000000000000000000011111111) (= (mask!8757 thiss!1248) #b00000000000000000000000111111111) (= (mask!8757 thiss!1248) #b00000000000000000000001111111111) (= (mask!8757 thiss!1248) #b00000000000000000000011111111111) (= (mask!8757 thiss!1248) #b00000000000000000000111111111111) (= (mask!8757 thiss!1248) #b00000000000000000001111111111111) (= (mask!8757 thiss!1248) #b00000000000000000011111111111111) (= (mask!8757 thiss!1248) #b00000000000000000111111111111111) (= (mask!8757 thiss!1248) #b00000000000000001111111111111111) (= (mask!8757 thiss!1248) #b00000000000000011111111111111111) (= (mask!8757 thiss!1248) #b00000000000000111111111111111111) (= (mask!8757 thiss!1248) #b00000000000001111111111111111111) (= (mask!8757 thiss!1248) #b00000000000011111111111111111111) (= (mask!8757 thiss!1248) #b00000000000111111111111111111111) (= (mask!8757 thiss!1248) #b00000000001111111111111111111111) (= (mask!8757 thiss!1248) #b00000000011111111111111111111111) (= (mask!8757 thiss!1248) #b00000000111111111111111111111111) (= (mask!8757 thiss!1248) #b00000001111111111111111111111111) (= (mask!8757 thiss!1248) #b00000011111111111111111111111111) (= (mask!8757 thiss!1248) #b00000111111111111111111111111111) (= (mask!8757 thiss!1248) #b00001111111111111111111111111111) (= (mask!8757 thiss!1248) #b00011111111111111111111111111111) (= (mask!8757 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8757 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181809 d!54387))

(declare-fun d!54389 () Bool)

(declare-fun res!86067 () Bool)

(declare-fun e!119776 () Bool)

(assert (=> d!54389 (=> (not res!86067) (not e!119776))))

(declare-fun simpleValid!170 (LongMapFixedSize!2482) Bool)

(assert (=> d!54389 (= res!86067 (simpleValid!170 thiss!1248))))

(assert (=> d!54389 (= (valid!1049 thiss!1248) e!119776)))

(declare-fun b!181876 () Bool)

(declare-fun res!86068 () Bool)

(assert (=> b!181876 (=> (not res!86068) (not e!119776))))

(declare-fun arrayCountValidKeys!0 (array!7685 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181876 (= res!86068 (= (arrayCountValidKeys!0 (_keys!5631 thiss!1248) #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))) (_size!1290 thiss!1248)))))

(declare-fun b!181877 () Bool)

(declare-fun res!86069 () Bool)

(assert (=> b!181877 (=> (not res!86069) (not e!119776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7685 (_ BitVec 32)) Bool)

(assert (=> b!181877 (= res!86069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(declare-fun b!181878 () Bool)

(declare-datatypes ((List!2310 0))(
  ( (Nil!2307) (Cons!2306 (h!2934 (_ BitVec 64)) (t!7161 List!2310)) )
))
(declare-fun arrayNoDuplicates!0 (array!7685 (_ BitVec 32) List!2310) Bool)

(assert (=> b!181878 (= e!119776 (arrayNoDuplicates!0 (_keys!5631 thiss!1248) #b00000000000000000000000000000000 Nil!2307))))

(assert (= (and d!54389 res!86067) b!181876))

(assert (= (and b!181876 res!86068) b!181877))

(assert (= (and b!181877 res!86069) b!181878))

(declare-fun m!209237 () Bool)

(assert (=> d!54389 m!209237))

(declare-fun m!209239 () Bool)

(assert (=> b!181876 m!209239))

(declare-fun m!209241 () Bool)

(assert (=> b!181877 m!209241))

(declare-fun m!209243 () Bool)

(assert (=> b!181878 m!209243))

(assert (=> start!18332 d!54389))

(declare-fun d!54391 () Bool)

(assert (=> d!54391 (= (array_inv!2351 (_keys!5631 thiss!1248)) (bvsge (size!3946 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181814 d!54391))

(declare-fun d!54393 () Bool)

(assert (=> d!54393 (= (array_inv!2352 (_values!3708 thiss!1248)) (bvsge (size!3947 (_values!3708 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181814 d!54393))

(declare-fun e!119783 () SeekEntryResult!612)

(declare-fun lt!89817 () SeekEntryResult!612)

(declare-fun b!181891 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7685 (_ BitVec 32)) SeekEntryResult!612)

(assert (=> b!181891 (= e!119783 (seekKeyOrZeroReturnVacant!0 (x!19859 lt!89817) (index!4620 lt!89817) (index!4620 lt!89817) key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(declare-fun b!181892 () Bool)

(declare-fun e!119784 () SeekEntryResult!612)

(declare-fun e!119785 () SeekEntryResult!612)

(assert (=> b!181892 (= e!119784 e!119785)))

(declare-fun lt!89818 () (_ BitVec 64))

(assert (=> b!181892 (= lt!89818 (select (arr!3634 (_keys!5631 thiss!1248)) (index!4620 lt!89817)))))

(declare-fun c!32610 () Bool)

(assert (=> b!181892 (= c!32610 (= lt!89818 key!828))))

(declare-fun b!181893 () Bool)

(assert (=> b!181893 (= e!119784 Undefined!612)))

(declare-fun d!54395 () Bool)

(declare-fun lt!89816 () SeekEntryResult!612)

(assert (=> d!54395 (and (or ((_ is Undefined!612) lt!89816) (not ((_ is Found!612) lt!89816)) (and (bvsge (index!4619 lt!89816) #b00000000000000000000000000000000) (bvslt (index!4619 lt!89816) (size!3946 (_keys!5631 thiss!1248))))) (or ((_ is Undefined!612) lt!89816) ((_ is Found!612) lt!89816) (not ((_ is MissingZero!612) lt!89816)) (and (bvsge (index!4618 lt!89816) #b00000000000000000000000000000000) (bvslt (index!4618 lt!89816) (size!3946 (_keys!5631 thiss!1248))))) (or ((_ is Undefined!612) lt!89816) ((_ is Found!612) lt!89816) ((_ is MissingZero!612) lt!89816) (not ((_ is MissingVacant!612) lt!89816)) (and (bvsge (index!4621 lt!89816) #b00000000000000000000000000000000) (bvslt (index!4621 lt!89816) (size!3946 (_keys!5631 thiss!1248))))) (or ((_ is Undefined!612) lt!89816) (ite ((_ is Found!612) lt!89816) (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4619 lt!89816)) key!828) (ite ((_ is MissingZero!612) lt!89816) (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4618 lt!89816)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!612) lt!89816) (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4621 lt!89816)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54395 (= lt!89816 e!119784)))

(declare-fun c!32608 () Bool)

(assert (=> d!54395 (= c!32608 (and ((_ is Intermediate!612) lt!89817) (undefined!1424 lt!89817)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7685 (_ BitVec 32)) SeekEntryResult!612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54395 (= lt!89817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8757 thiss!1248)) key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(assert (=> d!54395 (validMask!0 (mask!8757 thiss!1248))))

(assert (=> d!54395 (= (seekEntryOrOpen!0 key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)) lt!89816)))

(declare-fun b!181894 () Bool)

(assert (=> b!181894 (= e!119783 (MissingZero!612 (index!4620 lt!89817)))))

(declare-fun b!181895 () Bool)

(declare-fun c!32609 () Bool)

(assert (=> b!181895 (= c!32609 (= lt!89818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!181895 (= e!119785 e!119783)))

(declare-fun b!181896 () Bool)

(assert (=> b!181896 (= e!119785 (Found!612 (index!4620 lt!89817)))))

(assert (= (and d!54395 c!32608) b!181893))

(assert (= (and d!54395 (not c!32608)) b!181892))

(assert (= (and b!181892 c!32610) b!181896))

(assert (= (and b!181892 (not c!32610)) b!181895))

(assert (= (and b!181895 c!32609) b!181894))

(assert (= (and b!181895 (not c!32609)) b!181891))

(declare-fun m!209245 () Bool)

(assert (=> b!181891 m!209245))

(declare-fun m!209247 () Bool)

(assert (=> b!181892 m!209247))

(declare-fun m!209249 () Bool)

(assert (=> d!54395 m!209249))

(assert (=> d!54395 m!209199))

(declare-fun m!209251 () Bool)

(assert (=> d!54395 m!209251))

(declare-fun m!209253 () Bool)

(assert (=> d!54395 m!209253))

(assert (=> d!54395 m!209251))

(declare-fun m!209255 () Bool)

(assert (=> d!54395 m!209255))

(declare-fun m!209257 () Bool)

(assert (=> d!54395 m!209257))

(assert (=> b!181812 d!54395))

(declare-fun d!54397 () Bool)

(declare-fun e!119790 () Bool)

(assert (=> d!54397 e!119790))

(declare-fun res!86072 () Bool)

(assert (=> d!54397 (=> res!86072 e!119790)))

(declare-fun lt!89829 () Bool)

(assert (=> d!54397 (= res!86072 (not lt!89829))))

(declare-fun lt!89828 () Bool)

(assert (=> d!54397 (= lt!89829 lt!89828)))

(declare-datatypes ((Unit!5495 0))(
  ( (Unit!5496) )
))
(declare-fun lt!89830 () Unit!5495)

(declare-fun e!119791 () Unit!5495)

(assert (=> d!54397 (= lt!89830 e!119791)))

(declare-fun c!32613 () Bool)

(assert (=> d!54397 (= c!32613 lt!89828)))

(declare-fun containsKey!213 (List!2308 (_ BitVec 64)) Bool)

(assert (=> d!54397 (= lt!89828 (containsKey!213 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(assert (=> d!54397 (= (contains!1240 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) key!828) lt!89829)))

(declare-fun b!181903 () Bool)

(declare-fun lt!89827 () Unit!5495)

(assert (=> b!181903 (= e!119791 lt!89827)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!162 (List!2308 (_ BitVec 64)) Unit!5495)

(assert (=> b!181903 (= lt!89827 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-datatypes ((Option!215 0))(
  ( (Some!214 (v!4070 V!5329)) (None!213) )
))
(declare-fun isDefined!163 (Option!215) Bool)

(declare-fun getValueByKey!209 (List!2308 (_ BitVec 64)) Option!215)

(assert (=> b!181903 (isDefined!163 (getValueByKey!209 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-fun b!181904 () Bool)

(declare-fun Unit!5497 () Unit!5495)

(assert (=> b!181904 (= e!119791 Unit!5497)))

(declare-fun b!181905 () Bool)

(assert (=> b!181905 (= e!119790 (isDefined!163 (getValueByKey!209 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828)))))

(assert (= (and d!54397 c!32613) b!181903))

(assert (= (and d!54397 (not c!32613)) b!181904))

(assert (= (and d!54397 (not res!86072)) b!181905))

(declare-fun m!209259 () Bool)

(assert (=> d!54397 m!209259))

(declare-fun m!209261 () Bool)

(assert (=> b!181903 m!209261))

(declare-fun m!209263 () Bool)

(assert (=> b!181903 m!209263))

(assert (=> b!181903 m!209263))

(declare-fun m!209265 () Bool)

(assert (=> b!181903 m!209265))

(assert (=> b!181905 m!209263))

(assert (=> b!181905 m!209263))

(assert (=> b!181905 m!209265))

(assert (=> b!181808 d!54397))

(declare-fun b!181948 () Bool)

(declare-fun e!119821 () ListLongMap!2273)

(declare-fun call!18373 () ListLongMap!2273)

(assert (=> b!181948 (= e!119821 call!18373)))

(declare-fun b!181949 () Bool)

(declare-fun e!119819 () Bool)

(declare-fun e!119829 () Bool)

(assert (=> b!181949 (= e!119819 e!119829)))

(declare-fun c!32628 () Bool)

(assert (=> b!181949 (= c!32628 (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!18368 () ListLongMap!2273)

(declare-fun call!18370 () ListLongMap!2273)

(declare-fun c!32629 () Bool)

(declare-fun call!18372 () ListLongMap!2273)

(declare-fun bm!18364 () Bool)

(declare-fun c!32626 () Bool)

(declare-fun +!271 (ListLongMap!2273 tuple2!3364) ListLongMap!2273)

(assert (=> bm!18364 (= call!18368 (+!271 (ite c!32626 call!18372 (ite c!32629 call!18370 call!18373)) (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(declare-fun b!181951 () Bool)

(declare-fun e!119820 () Bool)

(declare-fun lt!89879 () ListLongMap!2273)

(declare-fun apply!154 (ListLongMap!2273 (_ BitVec 64)) V!5329)

(declare-fun get!2082 (ValueCell!1787 V!5329) V!5329)

(declare-fun dynLambda!488 (Int (_ BitVec 64)) V!5329)

(assert (=> b!181951 (= e!119820 (= (apply!154 lt!89879 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)) (get!2082 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3947 (_values!3708 thiss!1248))))))

(assert (=> b!181951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun b!181952 () Bool)

(declare-fun e!119823 () Bool)

(assert (=> b!181952 (= e!119823 (= (apply!154 lt!89879 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3566 thiss!1248)))))

(declare-fun b!181953 () Bool)

(declare-fun e!119818 () Bool)

(declare-fun call!18367 () Bool)

(assert (=> b!181953 (= e!119818 (not call!18367))))

(declare-fun b!181954 () Bool)

(declare-fun call!18369 () Bool)

(assert (=> b!181954 (= e!119829 (not call!18369))))

(declare-fun b!181955 () Bool)

(declare-fun e!119827 () Bool)

(assert (=> b!181955 (= e!119827 e!119820)))

(declare-fun res!86099 () Bool)

(assert (=> b!181955 (=> (not res!86099) (not e!119820))))

(assert (=> b!181955 (= res!86099 (contains!1240 lt!89879 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun b!181956 () Bool)

(declare-fun e!119828 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181956 (= e!119828 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181957 () Bool)

(declare-fun e!119822 () ListLongMap!2273)

(declare-fun call!18371 () ListLongMap!2273)

(assert (=> b!181957 (= e!119822 call!18371)))

(declare-fun bm!18365 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!175 (array!7685 array!7687 (_ BitVec 32) (_ BitVec 32) V!5329 V!5329 (_ BitVec 32) Int) ListLongMap!2273)

(assert (=> bm!18365 (= call!18372 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun b!181950 () Bool)

(declare-fun c!32630 () Bool)

(assert (=> b!181950 (= c!32630 (and (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!181950 (= e!119822 e!119821)))

(declare-fun d!54399 () Bool)

(assert (=> d!54399 e!119819))

(declare-fun res!86091 () Bool)

(assert (=> d!54399 (=> (not res!86091) (not e!119819))))

(assert (=> d!54399 (= res!86091 (or (bvsge #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))))

(declare-fun lt!89889 () ListLongMap!2273)

(assert (=> d!54399 (= lt!89879 lt!89889)))

(declare-fun lt!89877 () Unit!5495)

(declare-fun e!119830 () Unit!5495)

(assert (=> d!54399 (= lt!89877 e!119830)))

(declare-fun c!32627 () Bool)

(assert (=> d!54399 (= c!32627 e!119828)))

(declare-fun res!86097 () Bool)

(assert (=> d!54399 (=> (not res!86097) (not e!119828))))

(assert (=> d!54399 (= res!86097 (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun e!119826 () ListLongMap!2273)

(assert (=> d!54399 (= lt!89889 e!119826)))

(assert (=> d!54399 (= c!32626 (and (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54399 (validMask!0 (mask!8757 thiss!1248))))

(assert (=> d!54399 (= (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) lt!89879)))

(declare-fun b!181958 () Bool)

(declare-fun e!119824 () Bool)

(assert (=> b!181958 (= e!119824 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18366 () Bool)

(assert (=> bm!18366 (= call!18371 call!18368)))

(declare-fun b!181959 () Bool)

(assert (=> b!181959 (= e!119826 e!119822)))

(assert (=> b!181959 (= c!32629 (and (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181960 () Bool)

(declare-fun res!86094 () Bool)

(assert (=> b!181960 (=> (not res!86094) (not e!119819))))

(assert (=> b!181960 (= res!86094 e!119818)))

(declare-fun c!32631 () Bool)

(assert (=> b!181960 (= c!32631 (not (= (bvand (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181961 () Bool)

(declare-fun lt!89890 () Unit!5495)

(assert (=> b!181961 (= e!119830 lt!89890)))

(declare-fun lt!89891 () ListLongMap!2273)

(assert (=> b!181961 (= lt!89891 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!89895 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89885 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89885 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89876 () Unit!5495)

(declare-fun addStillContains!130 (ListLongMap!2273 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5495)

(assert (=> b!181961 (= lt!89876 (addStillContains!130 lt!89891 lt!89895 (zeroValue!3566 thiss!1248) lt!89885))))

(assert (=> b!181961 (contains!1240 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))) lt!89885)))

(declare-fun lt!89896 () Unit!5495)

(assert (=> b!181961 (= lt!89896 lt!89876)))

(declare-fun lt!89892 () ListLongMap!2273)

(assert (=> b!181961 (= lt!89892 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!89884 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89884 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89880 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89880 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89883 () Unit!5495)

(declare-fun addApplyDifferent!130 (ListLongMap!2273 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5495)

(assert (=> b!181961 (= lt!89883 (addApplyDifferent!130 lt!89892 lt!89884 (minValue!3566 thiss!1248) lt!89880))))

(assert (=> b!181961 (= (apply!154 (+!271 lt!89892 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))) lt!89880) (apply!154 lt!89892 lt!89880))))

(declare-fun lt!89875 () Unit!5495)

(assert (=> b!181961 (= lt!89875 lt!89883)))

(declare-fun lt!89882 () ListLongMap!2273)

(assert (=> b!181961 (= lt!89882 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!89888 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89893 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89893 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89881 () Unit!5495)

(assert (=> b!181961 (= lt!89881 (addApplyDifferent!130 lt!89882 lt!89888 (zeroValue!3566 thiss!1248) lt!89893))))

(assert (=> b!181961 (= (apply!154 (+!271 lt!89882 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))) lt!89893) (apply!154 lt!89882 lt!89893))))

(declare-fun lt!89878 () Unit!5495)

(assert (=> b!181961 (= lt!89878 lt!89881)))

(declare-fun lt!89887 () ListLongMap!2273)

(assert (=> b!181961 (= lt!89887 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))

(declare-fun lt!89886 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89886 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89894 () (_ BitVec 64))

(assert (=> b!181961 (= lt!89894 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181961 (= lt!89890 (addApplyDifferent!130 lt!89887 lt!89886 (minValue!3566 thiss!1248) lt!89894))))

(assert (=> b!181961 (= (apply!154 (+!271 lt!89887 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))) lt!89894) (apply!154 lt!89887 lt!89894))))

(declare-fun b!181962 () Bool)

(assert (=> b!181962 (= e!119826 (+!271 call!18368 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))

(declare-fun bm!18367 () Bool)

(assert (=> bm!18367 (= call!18370 call!18372)))

(declare-fun bm!18368 () Bool)

(assert (=> bm!18368 (= call!18369 (contains!1240 lt!89879 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181963 () Bool)

(assert (=> b!181963 (= e!119821 call!18371)))

(declare-fun b!181964 () Bool)

(declare-fun Unit!5498 () Unit!5495)

(assert (=> b!181964 (= e!119830 Unit!5498)))

(declare-fun b!181965 () Bool)

(declare-fun res!86093 () Bool)

(assert (=> b!181965 (=> (not res!86093) (not e!119819))))

(assert (=> b!181965 (= res!86093 e!119827)))

(declare-fun res!86095 () Bool)

(assert (=> b!181965 (=> res!86095 e!119827)))

(assert (=> b!181965 (= res!86095 (not e!119824))))

(declare-fun res!86098 () Bool)

(assert (=> b!181965 (=> (not res!86098) (not e!119824))))

(assert (=> b!181965 (= res!86098 (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun bm!18369 () Bool)

(assert (=> bm!18369 (= call!18367 (contains!1240 lt!89879 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181966 () Bool)

(assert (=> b!181966 (= e!119818 e!119823)))

(declare-fun res!86092 () Bool)

(assert (=> b!181966 (= res!86092 call!18367)))

(assert (=> b!181966 (=> (not res!86092) (not e!119823))))

(declare-fun b!181967 () Bool)

(declare-fun e!119825 () Bool)

(assert (=> b!181967 (= e!119825 (= (apply!154 lt!89879 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3566 thiss!1248)))))

(declare-fun b!181968 () Bool)

(assert (=> b!181968 (= e!119829 e!119825)))

(declare-fun res!86096 () Bool)

(assert (=> b!181968 (= res!86096 call!18369)))

(assert (=> b!181968 (=> (not res!86096) (not e!119825))))

(declare-fun bm!18370 () Bool)

(assert (=> bm!18370 (= call!18373 call!18370)))

(assert (= (and d!54399 c!32626) b!181962))

(assert (= (and d!54399 (not c!32626)) b!181959))

(assert (= (and b!181959 c!32629) b!181957))

(assert (= (and b!181959 (not c!32629)) b!181950))

(assert (= (and b!181950 c!32630) b!181963))

(assert (= (and b!181950 (not c!32630)) b!181948))

(assert (= (or b!181963 b!181948) bm!18370))

(assert (= (or b!181957 bm!18370) bm!18367))

(assert (= (or b!181957 b!181963) bm!18366))

(assert (= (or b!181962 bm!18367) bm!18365))

(assert (= (or b!181962 bm!18366) bm!18364))

(assert (= (and d!54399 res!86097) b!181956))

(assert (= (and d!54399 c!32627) b!181961))

(assert (= (and d!54399 (not c!32627)) b!181964))

(assert (= (and d!54399 res!86091) b!181965))

(assert (= (and b!181965 res!86098) b!181958))

(assert (= (and b!181965 (not res!86095)) b!181955))

(assert (= (and b!181955 res!86099) b!181951))

(assert (= (and b!181965 res!86093) b!181960))

(assert (= (and b!181960 c!32631) b!181966))

(assert (= (and b!181960 (not c!32631)) b!181953))

(assert (= (and b!181966 res!86092) b!181952))

(assert (= (or b!181966 b!181953) bm!18369))

(assert (= (and b!181960 res!86094) b!181949))

(assert (= (and b!181949 c!32628) b!181968))

(assert (= (and b!181949 (not c!32628)) b!181954))

(assert (= (and b!181968 res!86096) b!181967))

(assert (= (or b!181968 b!181954) bm!18368))

(declare-fun b_lambda!7145 () Bool)

(assert (=> (not b_lambda!7145) (not b!181951)))

(declare-fun t!7160 () Bool)

(declare-fun tb!2811 () Bool)

(assert (=> (and b!181814 (= (defaultEntry!3725 thiss!1248) (defaultEntry!3725 thiss!1248)) t!7160) tb!2811))

(declare-fun result!4727 () Bool)

(assert (=> tb!2811 (= result!4727 tp_is_empty!4261)))

(assert (=> b!181951 t!7160))

(declare-fun b_and!11025 () Bool)

(assert (= b_and!11019 (and (=> t!7160 result!4727) b_and!11025)))

(declare-fun m!209267 () Bool)

(assert (=> b!181962 m!209267))

(declare-fun m!209269 () Bool)

(assert (=> bm!18368 m!209269))

(declare-fun m!209271 () Bool)

(assert (=> b!181961 m!209271))

(declare-fun m!209273 () Bool)

(assert (=> b!181961 m!209273))

(declare-fun m!209275 () Bool)

(assert (=> b!181961 m!209275))

(declare-fun m!209277 () Bool)

(assert (=> b!181961 m!209277))

(declare-fun m!209279 () Bool)

(assert (=> b!181961 m!209279))

(declare-fun m!209281 () Bool)

(assert (=> b!181961 m!209281))

(declare-fun m!209283 () Bool)

(assert (=> b!181961 m!209283))

(declare-fun m!209285 () Bool)

(assert (=> b!181961 m!209285))

(declare-fun m!209287 () Bool)

(assert (=> b!181961 m!209287))

(declare-fun m!209289 () Bool)

(assert (=> b!181961 m!209289))

(declare-fun m!209291 () Bool)

(assert (=> b!181961 m!209291))

(declare-fun m!209293 () Bool)

(assert (=> b!181961 m!209293))

(declare-fun m!209295 () Bool)

(assert (=> b!181961 m!209295))

(declare-fun m!209297 () Bool)

(assert (=> b!181961 m!209297))

(assert (=> b!181961 m!209277))

(assert (=> b!181961 m!209273))

(declare-fun m!209299 () Bool)

(assert (=> b!181961 m!209299))

(declare-fun m!209301 () Bool)

(assert (=> b!181961 m!209301))

(assert (=> b!181961 m!209291))

(assert (=> b!181961 m!209299))

(declare-fun m!209303 () Bool)

(assert (=> b!181961 m!209303))

(declare-fun m!209305 () Bool)

(assert (=> b!181967 m!209305))

(assert (=> b!181955 m!209271))

(assert (=> b!181955 m!209271))

(declare-fun m!209307 () Bool)

(assert (=> b!181955 m!209307))

(declare-fun m!209309 () Bool)

(assert (=> b!181952 m!209309))

(assert (=> b!181956 m!209271))

(assert (=> b!181956 m!209271))

(declare-fun m!209311 () Bool)

(assert (=> b!181956 m!209311))

(assert (=> bm!18365 m!209285))

(assert (=> b!181951 m!209271))

(assert (=> b!181951 m!209271))

(declare-fun m!209313 () Bool)

(assert (=> b!181951 m!209313))

(declare-fun m!209315 () Bool)

(assert (=> b!181951 m!209315))

(declare-fun m!209317 () Bool)

(assert (=> b!181951 m!209317))

(assert (=> b!181951 m!209315))

(assert (=> b!181951 m!209317))

(declare-fun m!209319 () Bool)

(assert (=> b!181951 m!209319))

(assert (=> d!54399 m!209199))

(declare-fun m!209321 () Bool)

(assert (=> bm!18369 m!209321))

(declare-fun m!209323 () Bool)

(assert (=> bm!18364 m!209323))

(assert (=> b!181958 m!209271))

(assert (=> b!181958 m!209271))

(assert (=> b!181958 m!209311))

(assert (=> b!181808 d!54399))

(declare-fun mapIsEmpty!7318 () Bool)

(declare-fun mapRes!7318 () Bool)

(assert (=> mapIsEmpty!7318 mapRes!7318))

(declare-fun b!181978 () Bool)

(declare-fun e!119835 () Bool)

(assert (=> b!181978 (= e!119835 tp_is_empty!4261)))

(declare-fun mapNonEmpty!7318 () Bool)

(declare-fun tp!16237 () Bool)

(declare-fun e!119836 () Bool)

(assert (=> mapNonEmpty!7318 (= mapRes!7318 (and tp!16237 e!119836))))

(declare-fun mapValue!7318 () ValueCell!1787)

(declare-fun mapKey!7318 () (_ BitVec 32))

(declare-fun mapRest!7318 () (Array (_ BitVec 32) ValueCell!1787))

(assert (=> mapNonEmpty!7318 (= mapRest!7309 (store mapRest!7318 mapKey!7318 mapValue!7318))))

(declare-fun condMapEmpty!7318 () Bool)

(declare-fun mapDefault!7318 () ValueCell!1787)

(assert (=> mapNonEmpty!7309 (= condMapEmpty!7318 (= mapRest!7309 ((as const (Array (_ BitVec 32) ValueCell!1787)) mapDefault!7318)))))

(assert (=> mapNonEmpty!7309 (= tp!16222 (and e!119835 mapRes!7318))))

(declare-fun b!181977 () Bool)

(assert (=> b!181977 (= e!119836 tp_is_empty!4261)))

(assert (= (and mapNonEmpty!7309 condMapEmpty!7318) mapIsEmpty!7318))

(assert (= (and mapNonEmpty!7309 (not condMapEmpty!7318)) mapNonEmpty!7318))

(assert (= (and mapNonEmpty!7318 ((_ is ValueCellFull!1787) mapValue!7318)) b!181977))

(assert (= (and mapNonEmpty!7309 ((_ is ValueCellFull!1787) mapDefault!7318)) b!181978))

(declare-fun m!209325 () Bool)

(assert (=> mapNonEmpty!7318 m!209325))

(declare-fun b_lambda!7147 () Bool)

(assert (= b_lambda!7145 (or (and b!181814 b_free!4489) b_lambda!7147)))

(check-sat (not b!181891) (not b!181951) (not mapNonEmpty!7318) (not b!181962) (not b!181958) (not b_lambda!7147) (not d!54395) (not d!54389) (not d!54397) (not b!181967) (not b!181878) (not bm!18365) (not b!181903) (not b!181956) (not bm!18368) (not b!181877) tp_is_empty!4261 (not d!54399) (not b!181876) (not b!181952) (not b_next!4489) (not bm!18369) (not b!181961) b_and!11025 (not bm!18364) (not b!181955) (not b!181905))
(check-sat b_and!11025 (not b_next!4489))
(get-model)

(declare-fun bm!18373 () Bool)

(declare-fun call!18376 () Bool)

(assert (=> bm!18373 (= call!18376 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(declare-fun b!181987 () Bool)

(declare-fun e!119843 () Bool)

(assert (=> b!181987 (= e!119843 call!18376)))

(declare-fun d!54401 () Bool)

(declare-fun res!86104 () Bool)

(declare-fun e!119844 () Bool)

(assert (=> d!54401 (=> res!86104 e!119844)))

(assert (=> d!54401 (= res!86104 (bvsge #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(assert (=> d!54401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)) e!119844)))

(declare-fun b!181988 () Bool)

(declare-fun e!119845 () Bool)

(assert (=> b!181988 (= e!119845 call!18376)))

(declare-fun b!181989 () Bool)

(assert (=> b!181989 (= e!119844 e!119843)))

(declare-fun c!32634 () Bool)

(assert (=> b!181989 (= c!32634 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181990 () Bool)

(assert (=> b!181990 (= e!119843 e!119845)))

(declare-fun lt!89904 () (_ BitVec 64))

(assert (=> b!181990 (= lt!89904 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89903 () Unit!5495)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7685 (_ BitVec 64) (_ BitVec 32)) Unit!5495)

(assert (=> b!181990 (= lt!89903 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5631 thiss!1248) lt!89904 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!181990 (arrayContainsKey!0 (_keys!5631 thiss!1248) lt!89904 #b00000000000000000000000000000000)))

(declare-fun lt!89905 () Unit!5495)

(assert (=> b!181990 (= lt!89905 lt!89903)))

(declare-fun res!86105 () Bool)

(assert (=> b!181990 (= res!86105 (= (seekEntryOrOpen!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000) (_keys!5631 thiss!1248) (mask!8757 thiss!1248)) (Found!612 #b00000000000000000000000000000000)))))

(assert (=> b!181990 (=> (not res!86105) (not e!119845))))

(assert (= (and d!54401 (not res!86104)) b!181989))

(assert (= (and b!181989 c!32634) b!181990))

(assert (= (and b!181989 (not c!32634)) b!181987))

(assert (= (and b!181990 res!86105) b!181988))

(assert (= (or b!181988 b!181987) bm!18373))

(declare-fun m!209327 () Bool)

(assert (=> bm!18373 m!209327))

(assert (=> b!181989 m!209271))

(assert (=> b!181989 m!209271))

(assert (=> b!181989 m!209311))

(assert (=> b!181990 m!209271))

(declare-fun m!209329 () Bool)

(assert (=> b!181990 m!209329))

(declare-fun m!209331 () Bool)

(assert (=> b!181990 m!209331))

(assert (=> b!181990 m!209271))

(declare-fun m!209333 () Bool)

(assert (=> b!181990 m!209333))

(assert (=> b!181877 d!54401))

(declare-fun b!182009 () Bool)

(declare-fun e!119858 () Bool)

(declare-fun e!119860 () Bool)

(assert (=> b!182009 (= e!119858 e!119860)))

(declare-fun res!86113 () Bool)

(declare-fun lt!89911 () SeekEntryResult!612)

(assert (=> b!182009 (= res!86113 (and ((_ is Intermediate!612) lt!89911) (not (undefined!1424 lt!89911)) (bvslt (x!19859 lt!89911) #b01111111111111111111111111111110) (bvsge (x!19859 lt!89911) #b00000000000000000000000000000000) (bvsge (x!19859 lt!89911) #b00000000000000000000000000000000)))))

(assert (=> b!182009 (=> (not res!86113) (not e!119860))))

(declare-fun b!182010 () Bool)

(declare-fun e!119857 () SeekEntryResult!612)

(assert (=> b!182010 (= e!119857 (Intermediate!612 false (toIndex!0 key!828 (mask!8757 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!182011 () Bool)

(assert (=> b!182011 (and (bvsge (index!4620 lt!89911) #b00000000000000000000000000000000) (bvslt (index!4620 lt!89911) (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun e!119859 () Bool)

(assert (=> b!182011 (= e!119859 (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4620 lt!89911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182012 () Bool)

(declare-fun e!119856 () SeekEntryResult!612)

(assert (=> b!182012 (= e!119856 e!119857)))

(declare-fun c!32641 () Bool)

(declare-fun lt!89910 () (_ BitVec 64))

(assert (=> b!182012 (= c!32641 (or (= lt!89910 key!828) (= (bvadd lt!89910 lt!89910) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182013 () Bool)

(assert (=> b!182013 (and (bvsge (index!4620 lt!89911) #b00000000000000000000000000000000) (bvslt (index!4620 lt!89911) (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun res!86114 () Bool)

(assert (=> b!182013 (= res!86114 (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4620 lt!89911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182013 (=> res!86114 e!119859)))

(declare-fun b!182014 () Bool)

(assert (=> b!182014 (and (bvsge (index!4620 lt!89911) #b00000000000000000000000000000000) (bvslt (index!4620 lt!89911) (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun res!86112 () Bool)

(assert (=> b!182014 (= res!86112 (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4620 lt!89911)) key!828))))

(assert (=> b!182014 (=> res!86112 e!119859)))

(assert (=> b!182014 (= e!119860 e!119859)))

(declare-fun d!54403 () Bool)

(assert (=> d!54403 e!119858))

(declare-fun c!32642 () Bool)

(assert (=> d!54403 (= c!32642 (and ((_ is Intermediate!612) lt!89911) (undefined!1424 lt!89911)))))

(assert (=> d!54403 (= lt!89911 e!119856)))

(declare-fun c!32643 () Bool)

(assert (=> d!54403 (= c!32643 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!54403 (= lt!89910 (select (arr!3634 (_keys!5631 thiss!1248)) (toIndex!0 key!828 (mask!8757 thiss!1248))))))

(assert (=> d!54403 (validMask!0 (mask!8757 thiss!1248))))

(assert (=> d!54403 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8757 thiss!1248)) key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)) lt!89911)))

(declare-fun b!182015 () Bool)

(assert (=> b!182015 (= e!119856 (Intermediate!612 true (toIndex!0 key!828 (mask!8757 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!182016 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182016 (= e!119857 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8757 thiss!1248)) #b00000000000000000000000000000000 (mask!8757 thiss!1248)) key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(declare-fun b!182017 () Bool)

(assert (=> b!182017 (= e!119858 (bvsge (x!19859 lt!89911) #b01111111111111111111111111111110))))

(assert (= (and d!54403 c!32643) b!182015))

(assert (= (and d!54403 (not c!32643)) b!182012))

(assert (= (and b!182012 c!32641) b!182010))

(assert (= (and b!182012 (not c!32641)) b!182016))

(assert (= (and d!54403 c!32642) b!182017))

(assert (= (and d!54403 (not c!32642)) b!182009))

(assert (= (and b!182009 res!86113) b!182014))

(assert (= (and b!182014 (not res!86112)) b!182013))

(assert (= (and b!182013 (not res!86114)) b!182011))

(assert (=> b!182016 m!209251))

(declare-fun m!209335 () Bool)

(assert (=> b!182016 m!209335))

(assert (=> b!182016 m!209335))

(declare-fun m!209337 () Bool)

(assert (=> b!182016 m!209337))

(declare-fun m!209339 () Bool)

(assert (=> b!182011 m!209339))

(assert (=> b!182014 m!209339))

(assert (=> b!182013 m!209339))

(assert (=> d!54403 m!209251))

(declare-fun m!209341 () Bool)

(assert (=> d!54403 m!209341))

(assert (=> d!54403 m!209199))

(assert (=> d!54395 d!54403))

(declare-fun d!54405 () Bool)

(declare-fun lt!89917 () (_ BitVec 32))

(declare-fun lt!89916 () (_ BitVec 32))

(assert (=> d!54405 (= lt!89917 (bvmul (bvxor lt!89916 (bvlshr lt!89916 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54405 (= lt!89916 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54405 (and (bvsge (mask!8757 thiss!1248) #b00000000000000000000000000000000) (let ((res!86115 (let ((h!2935 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19876 (bvmul (bvxor h!2935 (bvlshr h!2935 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19876 (bvlshr x!19876 #b00000000000000000000000000001101)) (mask!8757 thiss!1248)))))) (and (bvslt res!86115 (bvadd (mask!8757 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86115 #b00000000000000000000000000000000))))))

(assert (=> d!54405 (= (toIndex!0 key!828 (mask!8757 thiss!1248)) (bvand (bvxor lt!89917 (bvlshr lt!89917 #b00000000000000000000000000001101)) (mask!8757 thiss!1248)))))

(assert (=> d!54395 d!54405))

(assert (=> d!54395 d!54387))

(declare-fun d!54407 () Bool)

(assert (=> d!54407 (= (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181956 d!54407))

(declare-fun b!182028 () Bool)

(declare-fun e!119872 () Bool)

(declare-fun contains!1242 (List!2310 (_ BitVec 64)) Bool)

(assert (=> b!182028 (= e!119872 (contains!1242 Nil!2307 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182029 () Bool)

(declare-fun e!119870 () Bool)

(declare-fun e!119871 () Bool)

(assert (=> b!182029 (= e!119870 e!119871)))

(declare-fun c!32646 () Bool)

(assert (=> b!182029 (= c!32646 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182030 () Bool)

(declare-fun e!119869 () Bool)

(assert (=> b!182030 (= e!119869 e!119870)))

(declare-fun res!86123 () Bool)

(assert (=> b!182030 (=> (not res!86123) (not e!119870))))

(assert (=> b!182030 (= res!86123 (not e!119872))))

(declare-fun res!86122 () Bool)

(assert (=> b!182030 (=> (not res!86122) (not e!119872))))

(assert (=> b!182030 (= res!86122 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18376 () Bool)

(declare-fun call!18379 () Bool)

(assert (=> bm!18376 (= call!18379 (arrayNoDuplicates!0 (_keys!5631 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32646 (Cons!2306 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000) Nil!2307) Nil!2307)))))

(declare-fun d!54409 () Bool)

(declare-fun res!86124 () Bool)

(assert (=> d!54409 (=> res!86124 e!119869)))

(assert (=> d!54409 (= res!86124 (bvsge #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(assert (=> d!54409 (= (arrayNoDuplicates!0 (_keys!5631 thiss!1248) #b00000000000000000000000000000000 Nil!2307) e!119869)))

(declare-fun b!182031 () Bool)

(assert (=> b!182031 (= e!119871 call!18379)))

(declare-fun b!182032 () Bool)

(assert (=> b!182032 (= e!119871 call!18379)))

(assert (= (and d!54409 (not res!86124)) b!182030))

(assert (= (and b!182030 res!86122) b!182028))

(assert (= (and b!182030 res!86123) b!182029))

(assert (= (and b!182029 c!32646) b!182031))

(assert (= (and b!182029 (not c!32646)) b!182032))

(assert (= (or b!182031 b!182032) bm!18376))

(assert (=> b!182028 m!209271))

(assert (=> b!182028 m!209271))

(declare-fun m!209343 () Bool)

(assert (=> b!182028 m!209343))

(assert (=> b!182029 m!209271))

(assert (=> b!182029 m!209271))

(assert (=> b!182029 m!209311))

(assert (=> b!182030 m!209271))

(assert (=> b!182030 m!209271))

(assert (=> b!182030 m!209311))

(assert (=> bm!18376 m!209271))

(declare-fun m!209345 () Bool)

(assert (=> bm!18376 m!209345))

(assert (=> b!181878 d!54409))

(declare-fun b!182057 () Bool)

(declare-fun e!119889 () Bool)

(declare-fun e!119893 () Bool)

(assert (=> b!182057 (= e!119889 e!119893)))

(declare-fun c!32656 () Bool)

(assert (=> b!182057 (= c!32656 (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun b!182058 () Bool)

(declare-fun e!119887 () ListLongMap!2273)

(declare-fun call!18382 () ListLongMap!2273)

(assert (=> b!182058 (= e!119887 call!18382)))

(declare-fun b!182059 () Bool)

(assert (=> b!182059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(assert (=> b!182059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3947 (_values!3708 thiss!1248))))))

(declare-fun e!119888 () Bool)

(declare-fun lt!89935 () ListLongMap!2273)

(assert (=> b!182059 (= e!119888 (= (apply!154 lt!89935 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)) (get!2082 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!18379 () Bool)

(assert (=> bm!18379 (= call!18382 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3725 thiss!1248)))))

(declare-fun b!182061 () Bool)

(assert (=> b!182061 (= e!119893 (= lt!89935 (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3725 thiss!1248))))))

(declare-fun b!182062 () Bool)

(declare-fun lt!89934 () Unit!5495)

(declare-fun lt!89933 () Unit!5495)

(assert (=> b!182062 (= lt!89934 lt!89933)))

(declare-fun lt!89932 () ListLongMap!2273)

(declare-fun lt!89936 () V!5329)

(declare-fun lt!89937 () (_ BitVec 64))

(declare-fun lt!89938 () (_ BitVec 64))

(assert (=> b!182062 (not (contains!1240 (+!271 lt!89932 (tuple2!3365 lt!89937 lt!89936)) lt!89938))))

(declare-fun addStillNotContains!85 (ListLongMap!2273 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5495)

(assert (=> b!182062 (= lt!89933 (addStillNotContains!85 lt!89932 lt!89937 lt!89936 lt!89938))))

(assert (=> b!182062 (= lt!89938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!182062 (= lt!89936 (get!2082 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182062 (= lt!89937 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182062 (= lt!89932 call!18382)))

(assert (=> b!182062 (= e!119887 (+!271 call!18382 (tuple2!3365 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000) (get!2082 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!182063 () Bool)

(declare-fun isEmpty!465 (ListLongMap!2273) Bool)

(assert (=> b!182063 (= e!119893 (isEmpty!465 lt!89935))))

(declare-fun b!182064 () Bool)

(declare-fun e!119892 () Bool)

(assert (=> b!182064 (= e!119892 e!119889)))

(declare-fun c!32657 () Bool)

(declare-fun e!119891 () Bool)

(assert (=> b!182064 (= c!32657 e!119891)))

(declare-fun res!86136 () Bool)

(assert (=> b!182064 (=> (not res!86136) (not e!119891))))

(assert (=> b!182064 (= res!86136 (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun b!182065 () Bool)

(assert (=> b!182065 (= e!119889 e!119888)))

(assert (=> b!182065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun res!86134 () Bool)

(assert (=> b!182065 (= res!86134 (contains!1240 lt!89935 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182065 (=> (not res!86134) (not e!119888))))

(declare-fun b!182066 () Bool)

(declare-fun e!119890 () ListLongMap!2273)

(assert (=> b!182066 (= e!119890 (ListLongMap!2274 Nil!2305))))

(declare-fun b!182067 () Bool)

(assert (=> b!182067 (= e!119890 e!119887)))

(declare-fun c!32658 () Bool)

(assert (=> b!182067 (= c!32658 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182068 () Bool)

(assert (=> b!182068 (= e!119891 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182068 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!182060 () Bool)

(declare-fun res!86135 () Bool)

(assert (=> b!182060 (=> (not res!86135) (not e!119892))))

(assert (=> b!182060 (= res!86135 (not (contains!1240 lt!89935 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!54411 () Bool)

(assert (=> d!54411 e!119892))

(declare-fun res!86133 () Bool)

(assert (=> d!54411 (=> (not res!86133) (not e!119892))))

(assert (=> d!54411 (= res!86133 (not (contains!1240 lt!89935 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54411 (= lt!89935 e!119890)))

(declare-fun c!32655 () Bool)

(assert (=> d!54411 (= c!32655 (bvsge #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(assert (=> d!54411 (validMask!0 (mask!8757 thiss!1248))))

(assert (=> d!54411 (= (getCurrentListMapNoExtraKeys!175 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)) lt!89935)))

(assert (= (and d!54411 c!32655) b!182066))

(assert (= (and d!54411 (not c!32655)) b!182067))

(assert (= (and b!182067 c!32658) b!182062))

(assert (= (and b!182067 (not c!32658)) b!182058))

(assert (= (or b!182062 b!182058) bm!18379))

(assert (= (and d!54411 res!86133) b!182060))

(assert (= (and b!182060 res!86135) b!182064))

(assert (= (and b!182064 res!86136) b!182068))

(assert (= (and b!182064 c!32657) b!182065))

(assert (= (and b!182064 (not c!32657)) b!182057))

(assert (= (and b!182065 res!86134) b!182059))

(assert (= (and b!182057 c!32656) b!182061))

(assert (= (and b!182057 (not c!32656)) b!182063))

(declare-fun b_lambda!7149 () Bool)

(assert (=> (not b_lambda!7149) (not b!182059)))

(assert (=> b!182059 t!7160))

(declare-fun b_and!11027 () Bool)

(assert (= b_and!11025 (and (=> t!7160 result!4727) b_and!11027)))

(declare-fun b_lambda!7151 () Bool)

(assert (=> (not b_lambda!7151) (not b!182062)))

(assert (=> b!182062 t!7160))

(declare-fun b_and!11029 () Bool)

(assert (= b_and!11027 (and (=> t!7160 result!4727) b_and!11029)))

(declare-fun m!209347 () Bool)

(assert (=> b!182063 m!209347))

(declare-fun m!209349 () Bool)

(assert (=> bm!18379 m!209349))

(assert (=> b!182062 m!209317))

(declare-fun m!209351 () Bool)

(assert (=> b!182062 m!209351))

(declare-fun m!209353 () Bool)

(assert (=> b!182062 m!209353))

(assert (=> b!182062 m!209315))

(declare-fun m!209355 () Bool)

(assert (=> b!182062 m!209355))

(assert (=> b!182062 m!209315))

(assert (=> b!182062 m!209317))

(assert (=> b!182062 m!209319))

(declare-fun m!209357 () Bool)

(assert (=> b!182062 m!209357))

(assert (=> b!182062 m!209351))

(assert (=> b!182062 m!209271))

(declare-fun m!209359 () Bool)

(assert (=> b!182060 m!209359))

(assert (=> b!182065 m!209271))

(assert (=> b!182065 m!209271))

(declare-fun m!209361 () Bool)

(assert (=> b!182065 m!209361))

(declare-fun m!209363 () Bool)

(assert (=> d!54411 m!209363))

(assert (=> d!54411 m!209199))

(assert (=> b!182059 m!209317))

(assert (=> b!182059 m!209271))

(declare-fun m!209365 () Bool)

(assert (=> b!182059 m!209365))

(assert (=> b!182059 m!209315))

(assert (=> b!182059 m!209315))

(assert (=> b!182059 m!209317))

(assert (=> b!182059 m!209319))

(assert (=> b!182059 m!209271))

(assert (=> b!182061 m!209349))

(assert (=> b!182067 m!209271))

(assert (=> b!182067 m!209271))

(assert (=> b!182067 m!209311))

(assert (=> b!182068 m!209271))

(assert (=> b!182068 m!209271))

(assert (=> b!182068 m!209311))

(assert (=> bm!18365 d!54411))

(declare-fun d!54413 () Bool)

(assert (=> d!54413 (isDefined!163 (getValueByKey!209 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-fun lt!89941 () Unit!5495)

(declare-fun choose!974 (List!2308 (_ BitVec 64)) Unit!5495)

(assert (=> d!54413 (= lt!89941 (choose!974 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(declare-fun e!119896 () Bool)

(assert (=> d!54413 e!119896))

(declare-fun res!86139 () Bool)

(assert (=> d!54413 (=> (not res!86139) (not e!119896))))

(declare-fun isStrictlySorted!339 (List!2308) Bool)

(assert (=> d!54413 (= res!86139 (isStrictlySorted!339 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))))

(assert (=> d!54413 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828) lt!89941)))

(declare-fun b!182071 () Bool)

(assert (=> b!182071 (= e!119896 (containsKey!213 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))

(assert (= (and d!54413 res!86139) b!182071))

(assert (=> d!54413 m!209263))

(assert (=> d!54413 m!209263))

(assert (=> d!54413 m!209265))

(declare-fun m!209367 () Bool)

(assert (=> d!54413 m!209367))

(declare-fun m!209369 () Bool)

(assert (=> d!54413 m!209369))

(assert (=> b!182071 m!209259))

(assert (=> b!181903 d!54413))

(declare-fun d!54415 () Bool)

(declare-fun isEmpty!466 (Option!215) Bool)

(assert (=> d!54415 (= (isDefined!163 (getValueByKey!209 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828)) (not (isEmpty!466 (getValueByKey!209 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828))))))

(declare-fun bs!7400 () Bool)

(assert (= bs!7400 d!54415))

(assert (=> bs!7400 m!209263))

(declare-fun m!209371 () Bool)

(assert (=> bs!7400 m!209371))

(assert (=> b!181903 d!54415))

(declare-fun b!182080 () Bool)

(declare-fun e!119901 () Option!215)

(assert (=> b!182080 (= e!119901 (Some!214 (_2!1693 (h!2932 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))))))))

(declare-fun b!182082 () Bool)

(declare-fun e!119902 () Option!215)

(assert (=> b!182082 (= e!119902 (getValueByKey!209 (t!7157 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) key!828))))

(declare-fun b!182083 () Bool)

(assert (=> b!182083 (= e!119902 None!213)))

(declare-fun d!54417 () Bool)

(declare-fun c!32663 () Bool)

(assert (=> d!54417 (= c!32663 (and ((_ is Cons!2304) (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (= (_1!1693 (h!2932 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)))))

(assert (=> d!54417 (= (getValueByKey!209 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828) e!119901)))

(declare-fun b!182081 () Bool)

(assert (=> b!182081 (= e!119901 e!119902)))

(declare-fun c!32664 () Bool)

(assert (=> b!182081 (= c!32664 (and ((_ is Cons!2304) (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (not (= (_1!1693 (h!2932 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828))))))

(assert (= (and d!54417 c!32663) b!182080))

(assert (= (and d!54417 (not c!32663)) b!182081))

(assert (= (and b!182081 c!32664) b!182082))

(assert (= (and b!182081 (not c!32664)) b!182083))

(declare-fun m!209373 () Bool)

(assert (=> b!182082 m!209373))

(assert (=> b!181903 d!54417))

(declare-fun d!54419 () Bool)

(declare-fun e!119905 () Bool)

(assert (=> d!54419 e!119905))

(declare-fun res!86145 () Bool)

(assert (=> d!54419 (=> (not res!86145) (not e!119905))))

(declare-fun lt!89953 () ListLongMap!2273)

(assert (=> d!54419 (= res!86145 (contains!1240 lt!89953 (_1!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(declare-fun lt!89952 () List!2308)

(assert (=> d!54419 (= lt!89953 (ListLongMap!2274 lt!89952))))

(declare-fun lt!89950 () Unit!5495)

(declare-fun lt!89951 () Unit!5495)

(assert (=> d!54419 (= lt!89950 lt!89951)))

(assert (=> d!54419 (= (getValueByKey!209 lt!89952 (_1!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!113 (List!2308 (_ BitVec 64) V!5329) Unit!5495)

(assert (=> d!54419 (= lt!89951 (lemmaContainsTupThenGetReturnValue!113 lt!89952 (_1!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(declare-fun insertStrictlySorted!116 (List!2308 (_ BitVec 64) V!5329) List!2308)

(assert (=> d!54419 (= lt!89952 (insertStrictlySorted!116 (toList!1152 call!18368) (_1!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(assert (=> d!54419 (= (+!271 call!18368 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))) lt!89953)))

(declare-fun b!182088 () Bool)

(declare-fun res!86144 () Bool)

(assert (=> b!182088 (=> (not res!86144) (not e!119905))))

(assert (=> b!182088 (= res!86144 (= (getValueByKey!209 (toList!1152 lt!89953) (_1!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(declare-fun b!182089 () Bool)

(declare-fun contains!1243 (List!2308 tuple2!3364) Bool)

(assert (=> b!182089 (= e!119905 (contains!1243 (toList!1152 lt!89953) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))

(assert (= (and d!54419 res!86145) b!182088))

(assert (= (and b!182088 res!86144) b!182089))

(declare-fun m!209375 () Bool)

(assert (=> d!54419 m!209375))

(declare-fun m!209377 () Bool)

(assert (=> d!54419 m!209377))

(declare-fun m!209379 () Bool)

(assert (=> d!54419 m!209379))

(declare-fun m!209381 () Bool)

(assert (=> d!54419 m!209381))

(declare-fun m!209383 () Bool)

(assert (=> b!182088 m!209383))

(declare-fun m!209385 () Bool)

(assert (=> b!182089 m!209385))

(assert (=> b!181962 d!54419))

(assert (=> d!54399 d!54387))

(declare-fun b!182100 () Bool)

(declare-fun res!86157 () Bool)

(declare-fun e!119908 () Bool)

(assert (=> b!182100 (=> (not res!86157) (not e!119908))))

(declare-fun size!3952 (LongMapFixedSize!2482) (_ BitVec 32))

(assert (=> b!182100 (= res!86157 (= (size!3952 thiss!1248) (bvadd (_size!1290 thiss!1248) (bvsdiv (bvadd (extraKeys!3462 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!182099 () Bool)

(declare-fun res!86156 () Bool)

(assert (=> b!182099 (=> (not res!86156) (not e!119908))))

(assert (=> b!182099 (= res!86156 (bvsge (size!3952 thiss!1248) (_size!1290 thiss!1248)))))

(declare-fun b!182101 () Bool)

(assert (=> b!182101 (= e!119908 (and (bvsge (extraKeys!3462 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3462 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1290 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!182098 () Bool)

(declare-fun res!86155 () Bool)

(assert (=> b!182098 (=> (not res!86155) (not e!119908))))

(assert (=> b!182098 (= res!86155 (and (= (size!3947 (_values!3708 thiss!1248)) (bvadd (mask!8757 thiss!1248) #b00000000000000000000000000000001)) (= (size!3946 (_keys!5631 thiss!1248)) (size!3947 (_values!3708 thiss!1248))) (bvsge (_size!1290 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1290 thiss!1248) (bvadd (mask!8757 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!54421 () Bool)

(declare-fun res!86154 () Bool)

(assert (=> d!54421 (=> (not res!86154) (not e!119908))))

(assert (=> d!54421 (= res!86154 (validMask!0 (mask!8757 thiss!1248)))))

(assert (=> d!54421 (= (simpleValid!170 thiss!1248) e!119908)))

(assert (= (and d!54421 res!86154) b!182098))

(assert (= (and b!182098 res!86155) b!182099))

(assert (= (and b!182099 res!86156) b!182100))

(assert (= (and b!182100 res!86157) b!182101))

(declare-fun m!209387 () Bool)

(assert (=> b!182100 m!209387))

(assert (=> b!182099 m!209387))

(assert (=> d!54421 m!209199))

(assert (=> d!54389 d!54421))

(declare-fun d!54423 () Bool)

(declare-fun e!119909 () Bool)

(assert (=> d!54423 e!119909))

(declare-fun res!86158 () Bool)

(assert (=> d!54423 (=> res!86158 e!119909)))

(declare-fun lt!89956 () Bool)

(assert (=> d!54423 (= res!86158 (not lt!89956))))

(declare-fun lt!89955 () Bool)

(assert (=> d!54423 (= lt!89956 lt!89955)))

(declare-fun lt!89957 () Unit!5495)

(declare-fun e!119910 () Unit!5495)

(assert (=> d!54423 (= lt!89957 e!119910)))

(declare-fun c!32665 () Bool)

(assert (=> d!54423 (= c!32665 lt!89955)))

(assert (=> d!54423 (= lt!89955 (containsKey!213 (toList!1152 lt!89879) (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54423 (= (contains!1240 lt!89879 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)) lt!89956)))

(declare-fun b!182102 () Bool)

(declare-fun lt!89954 () Unit!5495)

(assert (=> b!182102 (= e!119910 lt!89954)))

(assert (=> b!182102 (= lt!89954 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1152 lt!89879) (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182102 (isDefined!163 (getValueByKey!209 (toList!1152 lt!89879) (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182103 () Bool)

(declare-fun Unit!5499 () Unit!5495)

(assert (=> b!182103 (= e!119910 Unit!5499)))

(declare-fun b!182104 () Bool)

(assert (=> b!182104 (= e!119909 (isDefined!163 (getValueByKey!209 (toList!1152 lt!89879) (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54423 c!32665) b!182102))

(assert (= (and d!54423 (not c!32665)) b!182103))

(assert (= (and d!54423 (not res!86158)) b!182104))

(assert (=> d!54423 m!209271))

(declare-fun m!209389 () Bool)

(assert (=> d!54423 m!209389))

(assert (=> b!182102 m!209271))

(declare-fun m!209391 () Bool)

(assert (=> b!182102 m!209391))

(assert (=> b!182102 m!209271))

(declare-fun m!209393 () Bool)

(assert (=> b!182102 m!209393))

(assert (=> b!182102 m!209393))

(declare-fun m!209395 () Bool)

(assert (=> b!182102 m!209395))

(assert (=> b!182104 m!209271))

(assert (=> b!182104 m!209393))

(assert (=> b!182104 m!209393))

(assert (=> b!182104 m!209395))

(assert (=> b!181955 d!54423))

(assert (=> b!181905 d!54415))

(assert (=> b!181905 d!54417))

(declare-fun b!182113 () Bool)

(declare-fun e!119916 () (_ BitVec 32))

(declare-fun e!119915 () (_ BitVec 32))

(assert (=> b!182113 (= e!119916 e!119915)))

(declare-fun c!32671 () Bool)

(assert (=> b!182113 (= c!32671 (validKeyInArray!0 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182114 () Bool)

(assert (=> b!182114 (= e!119916 #b00000000000000000000000000000000)))

(declare-fun b!182115 () Bool)

(declare-fun call!18385 () (_ BitVec 32))

(assert (=> b!182115 (= e!119915 (bvadd #b00000000000000000000000000000001 call!18385))))

(declare-fun bm!18382 () Bool)

(assert (=> bm!18382 (= call!18385 (arrayCountValidKeys!0 (_keys!5631 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3946 (_keys!5631 thiss!1248))))))

(declare-fun d!54425 () Bool)

(declare-fun lt!89960 () (_ BitVec 32))

(assert (=> d!54425 (and (bvsge lt!89960 #b00000000000000000000000000000000) (bvsle lt!89960 (bvsub (size!3946 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54425 (= lt!89960 e!119916)))

(declare-fun c!32670 () Bool)

(assert (=> d!54425 (= c!32670 (bvsge #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))))))

(assert (=> d!54425 (and (bvsle #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3946 (_keys!5631 thiss!1248)) (size!3946 (_keys!5631 thiss!1248))))))

(assert (=> d!54425 (= (arrayCountValidKeys!0 (_keys!5631 thiss!1248) #b00000000000000000000000000000000 (size!3946 (_keys!5631 thiss!1248))) lt!89960)))

(declare-fun b!182116 () Bool)

(assert (=> b!182116 (= e!119915 call!18385)))

(assert (= (and d!54425 c!32670) b!182114))

(assert (= (and d!54425 (not c!32670)) b!182113))

(assert (= (and b!182113 c!32671) b!182115))

(assert (= (and b!182113 (not c!32671)) b!182116))

(assert (= (or b!182115 b!182116) bm!18382))

(assert (=> b!182113 m!209271))

(assert (=> b!182113 m!209271))

(assert (=> b!182113 m!209311))

(declare-fun m!209397 () Bool)

(assert (=> bm!18382 m!209397))

(assert (=> b!181876 d!54425))

(declare-fun d!54427 () Bool)

(declare-fun e!119917 () Bool)

(assert (=> d!54427 e!119917))

(declare-fun res!86159 () Bool)

(assert (=> d!54427 (=> res!86159 e!119917)))

(declare-fun lt!89963 () Bool)

(assert (=> d!54427 (= res!86159 (not lt!89963))))

(declare-fun lt!89962 () Bool)

(assert (=> d!54427 (= lt!89963 lt!89962)))

(declare-fun lt!89964 () Unit!5495)

(declare-fun e!119918 () Unit!5495)

(assert (=> d!54427 (= lt!89964 e!119918)))

(declare-fun c!32672 () Bool)

(assert (=> d!54427 (= c!32672 lt!89962)))

(assert (=> d!54427 (= lt!89962 (containsKey!213 (toList!1152 lt!89879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54427 (= (contains!1240 lt!89879 #b1000000000000000000000000000000000000000000000000000000000000000) lt!89963)))

(declare-fun b!182117 () Bool)

(declare-fun lt!89961 () Unit!5495)

(assert (=> b!182117 (= e!119918 lt!89961)))

(assert (=> b!182117 (= lt!89961 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1152 lt!89879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182117 (isDefined!163 (getValueByKey!209 (toList!1152 lt!89879) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182118 () Bool)

(declare-fun Unit!5500 () Unit!5495)

(assert (=> b!182118 (= e!119918 Unit!5500)))

(declare-fun b!182119 () Bool)

(assert (=> b!182119 (= e!119917 (isDefined!163 (getValueByKey!209 (toList!1152 lt!89879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54427 c!32672) b!182117))

(assert (= (and d!54427 (not c!32672)) b!182118))

(assert (= (and d!54427 (not res!86159)) b!182119))

(declare-fun m!209399 () Bool)

(assert (=> d!54427 m!209399))

(declare-fun m!209401 () Bool)

(assert (=> b!182117 m!209401))

(declare-fun m!209403 () Bool)

(assert (=> b!182117 m!209403))

(assert (=> b!182117 m!209403))

(declare-fun m!209405 () Bool)

(assert (=> b!182117 m!209405))

(assert (=> b!182119 m!209403))

(assert (=> b!182119 m!209403))

(assert (=> b!182119 m!209405))

(assert (=> bm!18368 d!54427))

(declare-fun b!182132 () Bool)

(declare-fun e!119927 () SeekEntryResult!612)

(assert (=> b!182132 (= e!119927 (MissingVacant!612 (index!4620 lt!89817)))))

(declare-fun d!54429 () Bool)

(declare-fun lt!89969 () SeekEntryResult!612)

(assert (=> d!54429 (and (or ((_ is Undefined!612) lt!89969) (not ((_ is Found!612) lt!89969)) (and (bvsge (index!4619 lt!89969) #b00000000000000000000000000000000) (bvslt (index!4619 lt!89969) (size!3946 (_keys!5631 thiss!1248))))) (or ((_ is Undefined!612) lt!89969) ((_ is Found!612) lt!89969) (not ((_ is MissingVacant!612) lt!89969)) (not (= (index!4621 lt!89969) (index!4620 lt!89817))) (and (bvsge (index!4621 lt!89969) #b00000000000000000000000000000000) (bvslt (index!4621 lt!89969) (size!3946 (_keys!5631 thiss!1248))))) (or ((_ is Undefined!612) lt!89969) (ite ((_ is Found!612) lt!89969) (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4619 lt!89969)) key!828) (and ((_ is MissingVacant!612) lt!89969) (= (index!4621 lt!89969) (index!4620 lt!89817)) (= (select (arr!3634 (_keys!5631 thiss!1248)) (index!4621 lt!89969)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!119926 () SeekEntryResult!612)

(assert (=> d!54429 (= lt!89969 e!119926)))

(declare-fun c!32679 () Bool)

(assert (=> d!54429 (= c!32679 (bvsge (x!19859 lt!89817) #b01111111111111111111111111111110))))

(declare-fun lt!89970 () (_ BitVec 64))

(assert (=> d!54429 (= lt!89970 (select (arr!3634 (_keys!5631 thiss!1248)) (index!4620 lt!89817)))))

(assert (=> d!54429 (validMask!0 (mask!8757 thiss!1248))))

(assert (=> d!54429 (= (seekKeyOrZeroReturnVacant!0 (x!19859 lt!89817) (index!4620 lt!89817) (index!4620 lt!89817) key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)) lt!89969)))

(declare-fun b!182133 () Bool)

(assert (=> b!182133 (= e!119926 Undefined!612)))

(declare-fun b!182134 () Bool)

(assert (=> b!182134 (= e!119927 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19859 lt!89817) #b00000000000000000000000000000001) (nextIndex!0 (index!4620 lt!89817) (x!19859 lt!89817) (mask!8757 thiss!1248)) (index!4620 lt!89817) key!828 (_keys!5631 thiss!1248) (mask!8757 thiss!1248)))))

(declare-fun b!182135 () Bool)

(declare-fun e!119925 () SeekEntryResult!612)

(assert (=> b!182135 (= e!119925 (Found!612 (index!4620 lt!89817)))))

(declare-fun b!182136 () Bool)

(declare-fun c!32680 () Bool)

(assert (=> b!182136 (= c!32680 (= lt!89970 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182136 (= e!119925 e!119927)))

(declare-fun b!182137 () Bool)

(assert (=> b!182137 (= e!119926 e!119925)))

(declare-fun c!32681 () Bool)

(assert (=> b!182137 (= c!32681 (= lt!89970 key!828))))

(assert (= (and d!54429 c!32679) b!182133))

(assert (= (and d!54429 (not c!32679)) b!182137))

(assert (= (and b!182137 c!32681) b!182135))

(assert (= (and b!182137 (not c!32681)) b!182136))

(assert (= (and b!182136 c!32680) b!182132))

(assert (= (and b!182136 (not c!32680)) b!182134))

(declare-fun m!209407 () Bool)

(assert (=> d!54429 m!209407))

(declare-fun m!209409 () Bool)

(assert (=> d!54429 m!209409))

(assert (=> d!54429 m!209247))

(assert (=> d!54429 m!209199))

(declare-fun m!209411 () Bool)

(assert (=> b!182134 m!209411))

(assert (=> b!182134 m!209411))

(declare-fun m!209413 () Bool)

(assert (=> b!182134 m!209413))

(assert (=> b!181891 d!54429))

(declare-fun d!54431 () Bool)

(declare-fun get!2083 (Option!215) V!5329)

(assert (=> d!54431 (= (apply!154 lt!89879 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2083 (getValueByKey!209 (toList!1152 lt!89879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7401 () Bool)

(assert (= bs!7401 d!54431))

(assert (=> bs!7401 m!209403))

(assert (=> bs!7401 m!209403))

(declare-fun m!209415 () Bool)

(assert (=> bs!7401 m!209415))

(assert (=> b!181967 d!54431))

(declare-fun d!54433 () Bool)

(assert (=> d!54433 (= (apply!154 lt!89879 (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000)) (get!2083 (getValueByKey!209 (toList!1152 lt!89879) (select (arr!3634 (_keys!5631 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7402 () Bool)

(assert (= bs!7402 d!54433))

(assert (=> bs!7402 m!209271))

(assert (=> bs!7402 m!209393))

(assert (=> bs!7402 m!209393))

(declare-fun m!209417 () Bool)

(assert (=> bs!7402 m!209417))

(assert (=> b!181951 d!54433))

(declare-fun d!54435 () Bool)

(declare-fun c!32684 () Bool)

(assert (=> d!54435 (= c!32684 ((_ is ValueCellFull!1787) (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!119930 () V!5329)

(assert (=> d!54435 (= (get!2082 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!119930)))

(declare-fun b!182142 () Bool)

(declare-fun get!2084 (ValueCell!1787 V!5329) V!5329)

(assert (=> b!182142 (= e!119930 (get!2084 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182143 () Bool)

(declare-fun get!2085 (ValueCell!1787 V!5329) V!5329)

(assert (=> b!182143 (= e!119930 (get!2085 (select (arr!3635 (_values!3708 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!488 (defaultEntry!3725 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54435 c!32684) b!182142))

(assert (= (and d!54435 (not c!32684)) b!182143))

(assert (=> b!182142 m!209315))

(assert (=> b!182142 m!209317))

(declare-fun m!209419 () Bool)

(assert (=> b!182142 m!209419))

(assert (=> b!182143 m!209315))

(assert (=> b!182143 m!209317))

(declare-fun m!209421 () Bool)

(assert (=> b!182143 m!209421))

(assert (=> b!181951 d!54435))

(declare-fun d!54437 () Bool)

(assert (=> d!54437 (= (apply!154 lt!89879 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2083 (getValueByKey!209 (toList!1152 lt!89879) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7403 () Bool)

(assert (= bs!7403 d!54437))

(declare-fun m!209423 () Bool)

(assert (=> bs!7403 m!209423))

(assert (=> bs!7403 m!209423))

(declare-fun m!209425 () Bool)

(assert (=> bs!7403 m!209425))

(assert (=> b!181952 d!54437))

(declare-fun d!54439 () Bool)

(assert (=> d!54439 (= (apply!154 (+!271 lt!89887 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))) lt!89894) (get!2083 (getValueByKey!209 (toList!1152 (+!271 lt!89887 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))) lt!89894)))))

(declare-fun bs!7404 () Bool)

(assert (= bs!7404 d!54439))

(declare-fun m!209427 () Bool)

(assert (=> bs!7404 m!209427))

(assert (=> bs!7404 m!209427))

(declare-fun m!209429 () Bool)

(assert (=> bs!7404 m!209429))

(assert (=> b!181961 d!54439))

(assert (=> b!181961 d!54411))

(declare-fun d!54441 () Bool)

(assert (=> d!54441 (= (apply!154 (+!271 lt!89892 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))) lt!89880) (apply!154 lt!89892 lt!89880))))

(declare-fun lt!89973 () Unit!5495)

(declare-fun choose!975 (ListLongMap!2273 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5495)

(assert (=> d!54441 (= lt!89973 (choose!975 lt!89892 lt!89884 (minValue!3566 thiss!1248) lt!89880))))

(declare-fun e!119933 () Bool)

(assert (=> d!54441 e!119933))

(declare-fun res!86162 () Bool)

(assert (=> d!54441 (=> (not res!86162) (not e!119933))))

(assert (=> d!54441 (= res!86162 (contains!1240 lt!89892 lt!89880))))

(assert (=> d!54441 (= (addApplyDifferent!130 lt!89892 lt!89884 (minValue!3566 thiss!1248) lt!89880) lt!89973)))

(declare-fun b!182147 () Bool)

(assert (=> b!182147 (= e!119933 (not (= lt!89880 lt!89884)))))

(assert (= (and d!54441 res!86162) b!182147))

(assert (=> d!54441 m!209283))

(assert (=> d!54441 m!209277))

(assert (=> d!54441 m!209279))

(declare-fun m!209431 () Bool)

(assert (=> d!54441 m!209431))

(assert (=> d!54441 m!209277))

(declare-fun m!209433 () Bool)

(assert (=> d!54441 m!209433))

(assert (=> b!181961 d!54441))

(declare-fun d!54443 () Bool)

(declare-fun e!119934 () Bool)

(assert (=> d!54443 e!119934))

(declare-fun res!86164 () Bool)

(assert (=> d!54443 (=> (not res!86164) (not e!119934))))

(declare-fun lt!89977 () ListLongMap!2273)

(assert (=> d!54443 (= res!86164 (contains!1240 lt!89977 (_1!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))))))

(declare-fun lt!89976 () List!2308)

(assert (=> d!54443 (= lt!89977 (ListLongMap!2274 lt!89976))))

(declare-fun lt!89974 () Unit!5495)

(declare-fun lt!89975 () Unit!5495)

(assert (=> d!54443 (= lt!89974 lt!89975)))

(assert (=> d!54443 (= (getValueByKey!209 lt!89976 (_1!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54443 (= lt!89975 (lemmaContainsTupThenGetReturnValue!113 lt!89976 (_1!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54443 (= lt!89976 (insertStrictlySorted!116 (toList!1152 lt!89891) (_1!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54443 (= (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))) lt!89977)))

(declare-fun b!182148 () Bool)

(declare-fun res!86163 () Bool)

(assert (=> b!182148 (=> (not res!86163) (not e!119934))))

(assert (=> b!182148 (= res!86163 (= (getValueByKey!209 (toList!1152 lt!89977) (_1!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))))))))

(declare-fun b!182149 () Bool)

(assert (=> b!182149 (= e!119934 (contains!1243 (toList!1152 lt!89977) (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))))))

(assert (= (and d!54443 res!86164) b!182148))

(assert (= (and b!182148 res!86163) b!182149))

(declare-fun m!209435 () Bool)

(assert (=> d!54443 m!209435))

(declare-fun m!209437 () Bool)

(assert (=> d!54443 m!209437))

(declare-fun m!209439 () Bool)

(assert (=> d!54443 m!209439))

(declare-fun m!209441 () Bool)

(assert (=> d!54443 m!209441))

(declare-fun m!209443 () Bool)

(assert (=> b!182148 m!209443))

(declare-fun m!209445 () Bool)

(assert (=> b!182149 m!209445))

(assert (=> b!181961 d!54443))

(declare-fun d!54445 () Bool)

(assert (=> d!54445 (= (apply!154 lt!89892 lt!89880) (get!2083 (getValueByKey!209 (toList!1152 lt!89892) lt!89880)))))

(declare-fun bs!7405 () Bool)

(assert (= bs!7405 d!54445))

(declare-fun m!209447 () Bool)

(assert (=> bs!7405 m!209447))

(assert (=> bs!7405 m!209447))

(declare-fun m!209449 () Bool)

(assert (=> bs!7405 m!209449))

(assert (=> b!181961 d!54445))

(declare-fun d!54447 () Bool)

(assert (=> d!54447 (contains!1240 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))) lt!89885)))

(declare-fun lt!89980 () Unit!5495)

(declare-fun choose!976 (ListLongMap!2273 (_ BitVec 64) V!5329 (_ BitVec 64)) Unit!5495)

(assert (=> d!54447 (= lt!89980 (choose!976 lt!89891 lt!89895 (zeroValue!3566 thiss!1248) lt!89885))))

(assert (=> d!54447 (contains!1240 lt!89891 lt!89885)))

(assert (=> d!54447 (= (addStillContains!130 lt!89891 lt!89895 (zeroValue!3566 thiss!1248) lt!89885) lt!89980)))

(declare-fun bs!7406 () Bool)

(assert (= bs!7406 d!54447))

(assert (=> bs!7406 m!209273))

(assert (=> bs!7406 m!209273))

(assert (=> bs!7406 m!209275))

(declare-fun m!209451 () Bool)

(assert (=> bs!7406 m!209451))

(declare-fun m!209453 () Bool)

(assert (=> bs!7406 m!209453))

(assert (=> b!181961 d!54447))

(declare-fun d!54449 () Bool)

(assert (=> d!54449 (= (apply!154 (+!271 lt!89882 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))) lt!89893) (apply!154 lt!89882 lt!89893))))

(declare-fun lt!89981 () Unit!5495)

(assert (=> d!54449 (= lt!89981 (choose!975 lt!89882 lt!89888 (zeroValue!3566 thiss!1248) lt!89893))))

(declare-fun e!119935 () Bool)

(assert (=> d!54449 e!119935))

(declare-fun res!86165 () Bool)

(assert (=> d!54449 (=> (not res!86165) (not e!119935))))

(assert (=> d!54449 (= res!86165 (contains!1240 lt!89882 lt!89893))))

(assert (=> d!54449 (= (addApplyDifferent!130 lt!89882 lt!89888 (zeroValue!3566 thiss!1248) lt!89893) lt!89981)))

(declare-fun b!182151 () Bool)

(assert (=> b!182151 (= e!119935 (not (= lt!89893 lt!89888)))))

(assert (= (and d!54449 res!86165) b!182151))

(assert (=> d!54449 m!209295))

(assert (=> d!54449 m!209299))

(assert (=> d!54449 m!209303))

(declare-fun m!209455 () Bool)

(assert (=> d!54449 m!209455))

(assert (=> d!54449 m!209299))

(declare-fun m!209457 () Bool)

(assert (=> d!54449 m!209457))

(assert (=> b!181961 d!54449))

(declare-fun d!54451 () Bool)

(declare-fun e!119936 () Bool)

(assert (=> d!54451 e!119936))

(declare-fun res!86166 () Bool)

(assert (=> d!54451 (=> res!86166 e!119936)))

(declare-fun lt!89984 () Bool)

(assert (=> d!54451 (= res!86166 (not lt!89984))))

(declare-fun lt!89983 () Bool)

(assert (=> d!54451 (= lt!89984 lt!89983)))

(declare-fun lt!89985 () Unit!5495)

(declare-fun e!119937 () Unit!5495)

(assert (=> d!54451 (= lt!89985 e!119937)))

(declare-fun c!32685 () Bool)

(assert (=> d!54451 (= c!32685 lt!89983)))

(assert (=> d!54451 (= lt!89983 (containsKey!213 (toList!1152 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))) lt!89885))))

(assert (=> d!54451 (= (contains!1240 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248))) lt!89885) lt!89984)))

(declare-fun b!182152 () Bool)

(declare-fun lt!89982 () Unit!5495)

(assert (=> b!182152 (= e!119937 lt!89982)))

(assert (=> b!182152 (= lt!89982 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1152 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))) lt!89885))))

(assert (=> b!182152 (isDefined!163 (getValueByKey!209 (toList!1152 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))) lt!89885))))

(declare-fun b!182153 () Bool)

(declare-fun Unit!5501 () Unit!5495)

(assert (=> b!182153 (= e!119937 Unit!5501)))

(declare-fun b!182154 () Bool)

(assert (=> b!182154 (= e!119936 (isDefined!163 (getValueByKey!209 (toList!1152 (+!271 lt!89891 (tuple2!3365 lt!89895 (zeroValue!3566 thiss!1248)))) lt!89885)))))

(assert (= (and d!54451 c!32685) b!182152))

(assert (= (and d!54451 (not c!32685)) b!182153))

(assert (= (and d!54451 (not res!86166)) b!182154))

(declare-fun m!209459 () Bool)

(assert (=> d!54451 m!209459))

(declare-fun m!209461 () Bool)

(assert (=> b!182152 m!209461))

(declare-fun m!209463 () Bool)

(assert (=> b!182152 m!209463))

(assert (=> b!182152 m!209463))

(declare-fun m!209465 () Bool)

(assert (=> b!182152 m!209465))

(assert (=> b!182154 m!209463))

(assert (=> b!182154 m!209463))

(assert (=> b!182154 m!209465))

(assert (=> b!181961 d!54451))

(declare-fun d!54453 () Bool)

(assert (=> d!54453 (= (apply!154 (+!271 lt!89892 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))) lt!89880) (get!2083 (getValueByKey!209 (toList!1152 (+!271 lt!89892 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))) lt!89880)))))

(declare-fun bs!7407 () Bool)

(assert (= bs!7407 d!54453))

(declare-fun m!209467 () Bool)

(assert (=> bs!7407 m!209467))

(assert (=> bs!7407 m!209467))

(declare-fun m!209469 () Bool)

(assert (=> bs!7407 m!209469))

(assert (=> b!181961 d!54453))

(declare-fun d!54455 () Bool)

(assert (=> d!54455 (= (apply!154 (+!271 lt!89882 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))) lt!89893) (get!2083 (getValueByKey!209 (toList!1152 (+!271 lt!89882 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))) lt!89893)))))

(declare-fun bs!7408 () Bool)

(assert (= bs!7408 d!54455))

(declare-fun m!209471 () Bool)

(assert (=> bs!7408 m!209471))

(assert (=> bs!7408 m!209471))

(declare-fun m!209473 () Bool)

(assert (=> bs!7408 m!209473))

(assert (=> b!181961 d!54455))

(declare-fun d!54457 () Bool)

(assert (=> d!54457 (= (apply!154 lt!89887 lt!89894) (get!2083 (getValueByKey!209 (toList!1152 lt!89887) lt!89894)))))

(declare-fun bs!7409 () Bool)

(assert (= bs!7409 d!54457))

(declare-fun m!209475 () Bool)

(assert (=> bs!7409 m!209475))

(assert (=> bs!7409 m!209475))

(declare-fun m!209477 () Bool)

(assert (=> bs!7409 m!209477))

(assert (=> b!181961 d!54457))

(declare-fun d!54459 () Bool)

(declare-fun e!119938 () Bool)

(assert (=> d!54459 e!119938))

(declare-fun res!86168 () Bool)

(assert (=> d!54459 (=> (not res!86168) (not e!119938))))

(declare-fun lt!89989 () ListLongMap!2273)

(assert (=> d!54459 (= res!86168 (contains!1240 lt!89989 (_1!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))))))

(declare-fun lt!89988 () List!2308)

(assert (=> d!54459 (= lt!89989 (ListLongMap!2274 lt!89988))))

(declare-fun lt!89986 () Unit!5495)

(declare-fun lt!89987 () Unit!5495)

(assert (=> d!54459 (= lt!89986 lt!89987)))

(assert (=> d!54459 (= (getValueByKey!209 lt!89988 (_1!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))))))

(assert (=> d!54459 (= lt!89987 (lemmaContainsTupThenGetReturnValue!113 lt!89988 (_1!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))))))

(assert (=> d!54459 (= lt!89988 (insertStrictlySorted!116 (toList!1152 lt!89887) (_1!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))))))

(assert (=> d!54459 (= (+!271 lt!89887 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))) lt!89989)))

(declare-fun b!182155 () Bool)

(declare-fun res!86167 () Bool)

(assert (=> b!182155 (=> (not res!86167) (not e!119938))))

(assert (=> b!182155 (= res!86167 (= (getValueByKey!209 (toList!1152 lt!89989) (_1!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))))))))

(declare-fun b!182156 () Bool)

(assert (=> b!182156 (= e!119938 (contains!1243 (toList!1152 lt!89989) (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))))))

(assert (= (and d!54459 res!86168) b!182155))

(assert (= (and b!182155 res!86167) b!182156))

(declare-fun m!209479 () Bool)

(assert (=> d!54459 m!209479))

(declare-fun m!209481 () Bool)

(assert (=> d!54459 m!209481))

(declare-fun m!209483 () Bool)

(assert (=> d!54459 m!209483))

(declare-fun m!209485 () Bool)

(assert (=> d!54459 m!209485))

(declare-fun m!209487 () Bool)

(assert (=> b!182155 m!209487))

(declare-fun m!209489 () Bool)

(assert (=> b!182156 m!209489))

(assert (=> b!181961 d!54459))

(declare-fun d!54461 () Bool)

(assert (=> d!54461 (= (apply!154 lt!89882 lt!89893) (get!2083 (getValueByKey!209 (toList!1152 lt!89882) lt!89893)))))

(declare-fun bs!7410 () Bool)

(assert (= bs!7410 d!54461))

(declare-fun m!209491 () Bool)

(assert (=> bs!7410 m!209491))

(assert (=> bs!7410 m!209491))

(declare-fun m!209493 () Bool)

(assert (=> bs!7410 m!209493))

(assert (=> b!181961 d!54461))

(declare-fun d!54463 () Bool)

(declare-fun e!119939 () Bool)

(assert (=> d!54463 e!119939))

(declare-fun res!86170 () Bool)

(assert (=> d!54463 (=> (not res!86170) (not e!119939))))

(declare-fun lt!89993 () ListLongMap!2273)

(assert (=> d!54463 (= res!86170 (contains!1240 lt!89993 (_1!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))))))

(declare-fun lt!89992 () List!2308)

(assert (=> d!54463 (= lt!89993 (ListLongMap!2274 lt!89992))))

(declare-fun lt!89990 () Unit!5495)

(declare-fun lt!89991 () Unit!5495)

(assert (=> d!54463 (= lt!89990 lt!89991)))

(assert (=> d!54463 (= (getValueByKey!209 lt!89992 (_1!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54463 (= lt!89991 (lemmaContainsTupThenGetReturnValue!113 lt!89992 (_1!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54463 (= lt!89992 (insertStrictlySorted!116 (toList!1152 lt!89882) (_1!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))))))

(assert (=> d!54463 (= (+!271 lt!89882 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))) lt!89993)))

(declare-fun b!182157 () Bool)

(declare-fun res!86169 () Bool)

(assert (=> b!182157 (=> (not res!86169) (not e!119939))))

(assert (=> b!182157 (= res!86169 (= (getValueByKey!209 (toList!1152 lt!89993) (_1!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))))))))

(declare-fun b!182158 () Bool)

(assert (=> b!182158 (= e!119939 (contains!1243 (toList!1152 lt!89993) (tuple2!3365 lt!89888 (zeroValue!3566 thiss!1248))))))

(assert (= (and d!54463 res!86170) b!182157))

(assert (= (and b!182157 res!86169) b!182158))

(declare-fun m!209495 () Bool)

(assert (=> d!54463 m!209495))

(declare-fun m!209497 () Bool)

(assert (=> d!54463 m!209497))

(declare-fun m!209499 () Bool)

(assert (=> d!54463 m!209499))

(declare-fun m!209501 () Bool)

(assert (=> d!54463 m!209501))

(declare-fun m!209503 () Bool)

(assert (=> b!182157 m!209503))

(declare-fun m!209505 () Bool)

(assert (=> b!182158 m!209505))

(assert (=> b!181961 d!54463))

(declare-fun d!54465 () Bool)

(assert (=> d!54465 (= (apply!154 (+!271 lt!89887 (tuple2!3365 lt!89886 (minValue!3566 thiss!1248))) lt!89894) (apply!154 lt!89887 lt!89894))))

(declare-fun lt!89994 () Unit!5495)

(assert (=> d!54465 (= lt!89994 (choose!975 lt!89887 lt!89886 (minValue!3566 thiss!1248) lt!89894))))

(declare-fun e!119940 () Bool)

(assert (=> d!54465 e!119940))

(declare-fun res!86171 () Bool)

(assert (=> d!54465 (=> (not res!86171) (not e!119940))))

(assert (=> d!54465 (= res!86171 (contains!1240 lt!89887 lt!89894))))

(assert (=> d!54465 (= (addApplyDifferent!130 lt!89887 lt!89886 (minValue!3566 thiss!1248) lt!89894) lt!89994)))

(declare-fun b!182159 () Bool)

(assert (=> b!182159 (= e!119940 (not (= lt!89894 lt!89886)))))

(assert (= (and d!54465 res!86171) b!182159))

(assert (=> d!54465 m!209281))

(assert (=> d!54465 m!209291))

(assert (=> d!54465 m!209293))

(declare-fun m!209507 () Bool)

(assert (=> d!54465 m!209507))

(assert (=> d!54465 m!209291))

(declare-fun m!209509 () Bool)

(assert (=> d!54465 m!209509))

(assert (=> b!181961 d!54465))

(declare-fun d!54467 () Bool)

(declare-fun e!119941 () Bool)

(assert (=> d!54467 e!119941))

(declare-fun res!86173 () Bool)

(assert (=> d!54467 (=> (not res!86173) (not e!119941))))

(declare-fun lt!89998 () ListLongMap!2273)

(assert (=> d!54467 (= res!86173 (contains!1240 lt!89998 (_1!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))))))

(declare-fun lt!89997 () List!2308)

(assert (=> d!54467 (= lt!89998 (ListLongMap!2274 lt!89997))))

(declare-fun lt!89995 () Unit!5495)

(declare-fun lt!89996 () Unit!5495)

(assert (=> d!54467 (= lt!89995 lt!89996)))

(assert (=> d!54467 (= (getValueByKey!209 lt!89997 (_1!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))))))

(assert (=> d!54467 (= lt!89996 (lemmaContainsTupThenGetReturnValue!113 lt!89997 (_1!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))))))

(assert (=> d!54467 (= lt!89997 (insertStrictlySorted!116 (toList!1152 lt!89892) (_1!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))) (_2!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))))))

(assert (=> d!54467 (= (+!271 lt!89892 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))) lt!89998)))

(declare-fun b!182160 () Bool)

(declare-fun res!86172 () Bool)

(assert (=> b!182160 (=> (not res!86172) (not e!119941))))

(assert (=> b!182160 (= res!86172 (= (getValueByKey!209 (toList!1152 lt!89998) (_1!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248)))) (Some!214 (_2!1693 (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))))))))

(declare-fun b!182161 () Bool)

(assert (=> b!182161 (= e!119941 (contains!1243 (toList!1152 lt!89998) (tuple2!3365 lt!89884 (minValue!3566 thiss!1248))))))

(assert (= (and d!54467 res!86173) b!182160))

(assert (= (and b!182160 res!86172) b!182161))

(declare-fun m!209511 () Bool)

(assert (=> d!54467 m!209511))

(declare-fun m!209513 () Bool)

(assert (=> d!54467 m!209513))

(declare-fun m!209515 () Bool)

(assert (=> d!54467 m!209515))

(declare-fun m!209517 () Bool)

(assert (=> d!54467 m!209517))

(declare-fun m!209519 () Bool)

(assert (=> b!182160 m!209519))

(declare-fun m!209521 () Bool)

(assert (=> b!182161 m!209521))

(assert (=> b!181961 d!54467))

(assert (=> b!181958 d!54407))

(declare-fun d!54469 () Bool)

(declare-fun e!119942 () Bool)

(assert (=> d!54469 e!119942))

(declare-fun res!86174 () Bool)

(assert (=> d!54469 (=> res!86174 e!119942)))

(declare-fun lt!90001 () Bool)

(assert (=> d!54469 (= res!86174 (not lt!90001))))

(declare-fun lt!90000 () Bool)

(assert (=> d!54469 (= lt!90001 lt!90000)))

(declare-fun lt!90002 () Unit!5495)

(declare-fun e!119943 () Unit!5495)

(assert (=> d!54469 (= lt!90002 e!119943)))

(declare-fun c!32686 () Bool)

(assert (=> d!54469 (= c!32686 lt!90000)))

(assert (=> d!54469 (= lt!90000 (containsKey!213 (toList!1152 lt!89879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54469 (= (contains!1240 lt!89879 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90001)))

(declare-fun b!182162 () Bool)

(declare-fun lt!89999 () Unit!5495)

(assert (=> b!182162 (= e!119943 lt!89999)))

(assert (=> b!182162 (= lt!89999 (lemmaContainsKeyImpliesGetValueByKeyDefined!162 (toList!1152 lt!89879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182162 (isDefined!163 (getValueByKey!209 (toList!1152 lt!89879) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182163 () Bool)

(declare-fun Unit!5502 () Unit!5495)

(assert (=> b!182163 (= e!119943 Unit!5502)))

(declare-fun b!182164 () Bool)

(assert (=> b!182164 (= e!119942 (isDefined!163 (getValueByKey!209 (toList!1152 lt!89879) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54469 c!32686) b!182162))

(assert (= (and d!54469 (not c!32686)) b!182163))

(assert (= (and d!54469 (not res!86174)) b!182164))

(declare-fun m!209523 () Bool)

(assert (=> d!54469 m!209523))

(declare-fun m!209525 () Bool)

(assert (=> b!182162 m!209525))

(assert (=> b!182162 m!209423))

(assert (=> b!182162 m!209423))

(declare-fun m!209527 () Bool)

(assert (=> b!182162 m!209527))

(assert (=> b!182164 m!209423))

(assert (=> b!182164 m!209423))

(assert (=> b!182164 m!209527))

(assert (=> bm!18369 d!54469))

(declare-fun d!54471 () Bool)

(declare-fun e!119944 () Bool)

(assert (=> d!54471 e!119944))

(declare-fun res!86176 () Bool)

(assert (=> d!54471 (=> (not res!86176) (not e!119944))))

(declare-fun lt!90006 () ListLongMap!2273)

(assert (=> d!54471 (= res!86176 (contains!1240 lt!90006 (_1!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(declare-fun lt!90005 () List!2308)

(assert (=> d!54471 (= lt!90006 (ListLongMap!2274 lt!90005))))

(declare-fun lt!90003 () Unit!5495)

(declare-fun lt!90004 () Unit!5495)

(assert (=> d!54471 (= lt!90003 lt!90004)))

(assert (=> d!54471 (= (getValueByKey!209 lt!90005 (_1!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))) (Some!214 (_2!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(assert (=> d!54471 (= lt!90004 (lemmaContainsTupThenGetReturnValue!113 lt!90005 (_1!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (_2!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(assert (=> d!54471 (= lt!90005 (insertStrictlySorted!116 (toList!1152 (ite c!32626 call!18372 (ite c!32629 call!18370 call!18373))) (_1!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) (_2!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))))))

(assert (=> d!54471 (= (+!271 (ite c!32626 call!18372 (ite c!32629 call!18370 call!18373)) (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))) lt!90006)))

(declare-fun b!182165 () Bool)

(declare-fun res!86175 () Bool)

(assert (=> b!182165 (=> (not res!86175) (not e!119944))))

(assert (=> b!182165 (= res!86175 (= (getValueByKey!209 (toList!1152 lt!90006) (_1!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248))))) (Some!214 (_2!1693 (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))))

(declare-fun b!182166 () Bool)

(assert (=> b!182166 (= e!119944 (contains!1243 (toList!1152 lt!90006) (ite (or c!32626 c!32629) (tuple2!3365 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3566 thiss!1248)) (tuple2!3365 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3566 thiss!1248)))))))

(assert (= (and d!54471 res!86176) b!182165))

(assert (= (and b!182165 res!86175) b!182166))

(declare-fun m!209529 () Bool)

(assert (=> d!54471 m!209529))

(declare-fun m!209531 () Bool)

(assert (=> d!54471 m!209531))

(declare-fun m!209533 () Bool)

(assert (=> d!54471 m!209533))

(declare-fun m!209535 () Bool)

(assert (=> d!54471 m!209535))

(declare-fun m!209537 () Bool)

(assert (=> b!182165 m!209537))

(declare-fun m!209539 () Bool)

(assert (=> b!182166 m!209539))

(assert (=> bm!18364 d!54471))

(declare-fun d!54473 () Bool)

(declare-fun res!86181 () Bool)

(declare-fun e!119949 () Bool)

(assert (=> d!54473 (=> res!86181 e!119949)))

(assert (=> d!54473 (= res!86181 (and ((_ is Cons!2304) (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (= (_1!1693 (h!2932 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)))))

(assert (=> d!54473 (= (containsKey!213 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))) key!828) e!119949)))

(declare-fun b!182171 () Bool)

(declare-fun e!119950 () Bool)

(assert (=> b!182171 (= e!119949 e!119950)))

(declare-fun res!86182 () Bool)

(assert (=> b!182171 (=> (not res!86182) (not e!119950))))

(assert (=> b!182171 (= res!86182 (and (or (not ((_ is Cons!2304) (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) (bvsle (_1!1693 (h!2932 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)) ((_ is Cons!2304) (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) (bvslt (_1!1693 (h!2932 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248))))) key!828)))))

(declare-fun b!182172 () Bool)

(assert (=> b!182172 (= e!119950 (containsKey!213 (t!7157 (toList!1152 (getCurrentListMap!785 (_keys!5631 thiss!1248) (_values!3708 thiss!1248) (mask!8757 thiss!1248) (extraKeys!3462 thiss!1248) (zeroValue!3566 thiss!1248) (minValue!3566 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3725 thiss!1248)))) key!828))))

(assert (= (and d!54473 (not res!86181)) b!182171))

(assert (= (and b!182171 res!86182) b!182172))

(declare-fun m!209541 () Bool)

(assert (=> b!182172 m!209541))

(assert (=> d!54397 d!54473))

(declare-fun mapIsEmpty!7319 () Bool)

(declare-fun mapRes!7319 () Bool)

(assert (=> mapIsEmpty!7319 mapRes!7319))

(declare-fun b!182174 () Bool)

(declare-fun e!119951 () Bool)

(assert (=> b!182174 (= e!119951 tp_is_empty!4261)))

(declare-fun mapNonEmpty!7319 () Bool)

(declare-fun tp!16238 () Bool)

(declare-fun e!119952 () Bool)

(assert (=> mapNonEmpty!7319 (= mapRes!7319 (and tp!16238 e!119952))))

(declare-fun mapKey!7319 () (_ BitVec 32))

(declare-fun mapRest!7319 () (Array (_ BitVec 32) ValueCell!1787))

(declare-fun mapValue!7319 () ValueCell!1787)

(assert (=> mapNonEmpty!7319 (= mapRest!7318 (store mapRest!7319 mapKey!7319 mapValue!7319))))

(declare-fun condMapEmpty!7319 () Bool)

(declare-fun mapDefault!7319 () ValueCell!1787)

(assert (=> mapNonEmpty!7318 (= condMapEmpty!7319 (= mapRest!7318 ((as const (Array (_ BitVec 32) ValueCell!1787)) mapDefault!7319)))))

(assert (=> mapNonEmpty!7318 (= tp!16237 (and e!119951 mapRes!7319))))

(declare-fun b!182173 () Bool)

(assert (=> b!182173 (= e!119952 tp_is_empty!4261)))

(assert (= (and mapNonEmpty!7318 condMapEmpty!7319) mapIsEmpty!7319))

(assert (= (and mapNonEmpty!7318 (not condMapEmpty!7319)) mapNonEmpty!7319))

(assert (= (and mapNonEmpty!7319 ((_ is ValueCellFull!1787) mapValue!7319)) b!182173))

(assert (= (and mapNonEmpty!7318 ((_ is ValueCellFull!1787) mapDefault!7319)) b!182174))

(declare-fun m!209543 () Bool)

(assert (=> mapNonEmpty!7319 m!209543))

(declare-fun b_lambda!7153 () Bool)

(assert (= b_lambda!7149 (or (and b!181814 b_free!4489) b_lambda!7153)))

(declare-fun b_lambda!7155 () Bool)

(assert (= b_lambda!7151 (or (and b!181814 b_free!4489) b_lambda!7155)))

(check-sat (not d!54403) (not b!182089) (not b!182162) (not b!182088) (not b!182134) (not b!182172) (not b!182165) (not d!54431) (not d!54413) (not b!182068) (not bm!18376) (not b!182065) (not b!182029) (not d!54423) (not d!54453) (not b!182067) (not b!182071) (not d!54415) (not b!182063) (not d!54471) (not b!182059) (not d!54451) (not b!181989) (not b!182113) (not d!54427) (not d!54455) (not b!182166) (not d!54439) (not b_lambda!7147) (not b!182158) (not b!182099) (not bm!18373) (not d!54457) (not b!182117) (not mapNonEmpty!7319) (not b!182156) (not b!182164) (not b!182028) (not b!182148) (not b!182160) (not b!182062) (not d!54445) (not d!54429) b_and!11029 (not d!54411) (not b!182149) (not b!182157) tp_is_empty!4261 (not b!182102) (not d!54463) (not d!54447) (not b_next!4489) (not b!182060) (not d!54449) (not d!54433) (not d!54465) (not d!54419) (not b_lambda!7153) (not b!182119) (not bm!18382) (not b!182100) (not b!182061) (not b!182104) (not b!182143) (not b!182155) (not b!182152) (not b!181990) (not d!54441) (not b!182154) (not d!54461) (not b!182030) (not d!54467) (not d!54437) (not b_lambda!7155) (not d!54421) (not d!54443) (not d!54459) (not b!182082) (not b!182016) (not d!54469) (not b!182161) (not b!182142) (not bm!18379))
(check-sat b_and!11029 (not b_next!4489))
