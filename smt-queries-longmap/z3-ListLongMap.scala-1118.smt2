; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22956 () Bool)

(assert start!22956)

(declare-fun b!240203 () Bool)

(declare-fun b_free!6459 () Bool)

(declare-fun b_next!6459 () Bool)

(assert (=> b!240203 (= b_free!6459 (not b_next!6459))))

(declare-fun tp!22581 () Bool)

(declare-fun b_and!13425 () Bool)

(assert (=> b!240203 (= tp!22581 b_and!13425)))

(declare-fun b!240182 () Bool)

(declare-fun e!155918 () Bool)

(declare-fun call!22338 () Bool)

(assert (=> b!240182 (= e!155918 (not call!22338))))

(declare-fun b!240183 () Bool)

(declare-fun e!155923 () Bool)

(declare-fun tp_is_empty!6321 () Bool)

(assert (=> b!240183 (= e!155923 tp_is_empty!6321)))

(declare-fun b!240184 () Bool)

(declare-fun res!117743 () Bool)

(assert (=> b!240184 (=> (not res!117743) (not e!155918))))

(declare-fun call!22337 () Bool)

(assert (=> b!240184 (= res!117743 call!22337)))

(declare-fun e!155921 () Bool)

(assert (=> b!240184 (= e!155921 e!155918)))

(declare-fun b!240185 () Bool)

(declare-fun res!117741 () Bool)

(assert (=> b!240185 (=> (not res!117741) (not e!155918))))

(declare-datatypes ((V!8075 0))(
  ( (V!8076 (val!3205 Int)) )
))
(declare-datatypes ((ValueCell!2817 0))(
  ( (ValueCellFull!2817 (v!5243 V!8075)) (EmptyCell!2817) )
))
(declare-datatypes ((array!11921 0))(
  ( (array!11922 (arr!5662 (Array (_ BitVec 32) ValueCell!2817)) (size!6003 (_ BitVec 32))) )
))
(declare-datatypes ((array!11923 0))(
  ( (array!11924 (arr!5663 (Array (_ BitVec 32) (_ BitVec 64))) (size!6004 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3534 0))(
  ( (LongMapFixedSize!3535 (defaultEntry!4452 Int) (mask!10506 (_ BitVec 32)) (extraKeys!4189 (_ BitVec 32)) (zeroValue!4293 V!8075) (minValue!4293 V!8075) (_size!1816 (_ BitVec 32)) (_keys!6554 array!11923) (_values!4435 array!11921) (_vacant!1816 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3534)

(declare-datatypes ((SeekEntryResult!1043 0))(
  ( (MissingZero!1043 (index!6342 (_ BitVec 32))) (Found!1043 (index!6343 (_ BitVec 32))) (Intermediate!1043 (undefined!1855 Bool) (index!6344 (_ BitVec 32)) (x!24147 (_ BitVec 32))) (Undefined!1043) (MissingVacant!1043 (index!6345 (_ BitVec 32))) )
))
(declare-fun lt!120933 () SeekEntryResult!1043)

(assert (=> b!240185 (= res!117741 (= (select (arr!5663 (_keys!6554 thiss!1504)) (index!6342 lt!120933)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240187 () Bool)

(declare-fun res!117748 () Bool)

(declare-fun e!155916 () Bool)

(assert (=> b!240187 (=> (not res!117748) (not e!155916))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!240187 (= res!117748 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240188 () Bool)

(declare-fun res!117746 () Bool)

(declare-fun e!155922 () Bool)

(assert (=> b!240188 (=> (not res!117746) (not e!155922))))

(declare-datatypes ((List!3607 0))(
  ( (Nil!3604) (Cons!3603 (h!4259 (_ BitVec 64)) (t!8602 List!3607)) )
))
(declare-fun arrayNoDuplicates!0 (array!11923 (_ BitVec 32) List!3607) Bool)

(assert (=> b!240188 (= res!117746 (arrayNoDuplicates!0 (_keys!6554 thiss!1504) #b00000000000000000000000000000000 Nil!3604))))

(declare-fun b!240189 () Bool)

(declare-fun res!117749 () Bool)

(assert (=> b!240189 (= res!117749 (= (select (arr!5663 (_keys!6554 thiss!1504)) (index!6345 lt!120933)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155926 () Bool)

(assert (=> b!240189 (=> (not res!117749) (not e!155926))))

(declare-fun b!240190 () Bool)

(declare-fun e!155927 () Bool)

(assert (=> b!240190 (= e!155927 e!155926)))

(declare-fun res!117745 () Bool)

(assert (=> b!240190 (= res!117745 call!22337)))

(assert (=> b!240190 (=> (not res!117745) (not e!155926))))

(declare-fun b!240191 () Bool)

(declare-fun e!155917 () Bool)

(assert (=> b!240191 (= e!155916 e!155917)))

(declare-fun res!117744 () Bool)

(assert (=> b!240191 (=> (not res!117744) (not e!155917))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240191 (= res!117744 (or (= lt!120933 (MissingZero!1043 index!297)) (= lt!120933 (MissingVacant!1043 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11923 (_ BitVec 32)) SeekEntryResult!1043)

(assert (=> b!240191 (= lt!120933 (seekEntryOrOpen!0 key!932 (_keys!6554 thiss!1504) (mask!10506 thiss!1504)))))

(declare-fun b!240192 () Bool)

(declare-fun res!117752 () Bool)

(assert (=> b!240192 (=> (not res!117752) (not e!155922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11923 (_ BitVec 32)) Bool)

(assert (=> b!240192 (= res!117752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6554 thiss!1504) (mask!10506 thiss!1504)))))

(declare-fun b!240193 () Bool)

(declare-fun res!117750 () Bool)

(assert (=> b!240193 (=> (not res!117750) (not e!155922))))

(declare-fun arrayContainsKey!0 (array!11923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240193 (= res!117750 (arrayContainsKey!0 (_keys!6554 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240194 () Bool)

(declare-fun res!117747 () Bool)

(assert (=> b!240194 (=> (not res!117747) (not e!155922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240194 (= res!117747 (validMask!0 (mask!10506 thiss!1504)))))

(declare-fun mapIsEmpty!10713 () Bool)

(declare-fun mapRes!10713 () Bool)

(assert (=> mapIsEmpty!10713 mapRes!10713))

(declare-fun b!240195 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240195 (= e!155922 (not (validKeyInArray!0 key!932)))))

(declare-fun b!240196 () Bool)

(declare-datatypes ((Unit!7385 0))(
  ( (Unit!7386) )
))
(declare-fun e!155924 () Unit!7385)

(declare-fun lt!120932 () Unit!7385)

(assert (=> b!240196 (= e!155924 lt!120932)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (array!11923 array!11921 (_ BitVec 32) (_ BitVec 32) V!8075 V!8075 (_ BitVec 64) Int) Unit!7385)

(assert (=> b!240196 (= lt!120932 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (_keys!6554 thiss!1504) (_values!4435 thiss!1504) (mask!10506 thiss!1504) (extraKeys!4189 thiss!1504) (zeroValue!4293 thiss!1504) (minValue!4293 thiss!1504) key!932 (defaultEntry!4452 thiss!1504)))))

(declare-fun c!40019 () Bool)

(get-info :version)

(assert (=> b!240196 (= c!40019 ((_ is MissingZero!1043) lt!120933))))

(assert (=> b!240196 e!155921))

(declare-fun b!240197 () Bool)

(assert (=> b!240197 (= e!155927 ((_ is Undefined!1043) lt!120933))))

(declare-fun b!240198 () Bool)

(declare-fun c!40018 () Bool)

(assert (=> b!240198 (= c!40018 ((_ is MissingVacant!1043) lt!120933))))

(assert (=> b!240198 (= e!155921 e!155927)))

(declare-fun bm!22334 () Bool)

(assert (=> bm!22334 (= call!22338 (arrayContainsKey!0 (_keys!6554 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240199 () Bool)

(declare-fun e!155925 () Bool)

(assert (=> b!240199 (= e!155925 (and e!155923 mapRes!10713))))

(declare-fun condMapEmpty!10713 () Bool)

(declare-fun mapDefault!10713 () ValueCell!2817)

(assert (=> b!240199 (= condMapEmpty!10713 (= (arr!5662 (_values!4435 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2817)) mapDefault!10713)))))

(declare-fun b!240200 () Bool)

(declare-fun res!117742 () Bool)

(assert (=> b!240200 (=> (not res!117742) (not e!155922))))

(assert (=> b!240200 (= res!117742 (and (= (size!6003 (_values!4435 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10506 thiss!1504))) (= (size!6004 (_keys!6554 thiss!1504)) (size!6003 (_values!4435 thiss!1504))) (bvsge (mask!10506 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4189 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4189 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!117751 () Bool)

(assert (=> start!22956 (=> (not res!117751) (not e!155916))))

(declare-fun valid!1392 (LongMapFixedSize!3534) Bool)

(assert (=> start!22956 (= res!117751 (valid!1392 thiss!1504))))

(assert (=> start!22956 e!155916))

(declare-fun e!155920 () Bool)

(assert (=> start!22956 e!155920))

(assert (=> start!22956 true))

(declare-fun b!240186 () Bool)

(assert (=> b!240186 (= e!155926 (not call!22338))))

(declare-fun b!240201 () Bool)

(assert (=> b!240201 (= e!155917 e!155922)))

(declare-fun res!117740 () Bool)

(assert (=> b!240201 (=> (not res!117740) (not e!155922))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240201 (= res!117740 (inRange!0 index!297 (mask!10506 thiss!1504)))))

(declare-fun lt!120931 () Unit!7385)

(assert (=> b!240201 (= lt!120931 e!155924)))

(declare-fun c!40017 () Bool)

(declare-datatypes ((tuple2!4724 0))(
  ( (tuple2!4725 (_1!2373 (_ BitVec 64)) (_2!2373 V!8075)) )
))
(declare-datatypes ((List!3608 0))(
  ( (Nil!3605) (Cons!3604 (h!4260 tuple2!4724) (t!8603 List!3608)) )
))
(declare-datatypes ((ListLongMap!3637 0))(
  ( (ListLongMap!3638 (toList!1834 List!3608)) )
))
(declare-fun contains!1722 (ListLongMap!3637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1362 (array!11923 array!11921 (_ BitVec 32) (_ BitVec 32) V!8075 V!8075 (_ BitVec 32) Int) ListLongMap!3637)

(assert (=> b!240201 (= c!40017 (contains!1722 (getCurrentListMap!1362 (_keys!6554 thiss!1504) (_values!4435 thiss!1504) (mask!10506 thiss!1504) (extraKeys!4189 thiss!1504) (zeroValue!4293 thiss!1504) (minValue!4293 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4452 thiss!1504)) key!932))))

(declare-fun b!240202 () Bool)

(declare-fun e!155919 () Bool)

(assert (=> b!240202 (= e!155919 tp_is_empty!6321)))

(declare-fun array_inv!3747 (array!11923) Bool)

(declare-fun array_inv!3748 (array!11921) Bool)

(assert (=> b!240203 (= e!155920 (and tp!22581 tp_is_empty!6321 (array_inv!3747 (_keys!6554 thiss!1504)) (array_inv!3748 (_values!4435 thiss!1504)) e!155925))))

(declare-fun bm!22335 () Bool)

(assert (=> bm!22335 (= call!22337 (inRange!0 (ite c!40019 (index!6342 lt!120933) (index!6345 lt!120933)) (mask!10506 thiss!1504)))))

(declare-fun b!240204 () Bool)

(declare-fun Unit!7387 () Unit!7385)

(assert (=> b!240204 (= e!155924 Unit!7387)))

(declare-fun lt!120930 () Unit!7385)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!337 (array!11923 array!11921 (_ BitVec 32) (_ BitVec 32) V!8075 V!8075 (_ BitVec 64) Int) Unit!7385)

(assert (=> b!240204 (= lt!120930 (lemmaInListMapThenSeekEntryOrOpenFindsIt!337 (_keys!6554 thiss!1504) (_values!4435 thiss!1504) (mask!10506 thiss!1504) (extraKeys!4189 thiss!1504) (zeroValue!4293 thiss!1504) (minValue!4293 thiss!1504) key!932 (defaultEntry!4452 thiss!1504)))))

(assert (=> b!240204 false))

(declare-fun mapNonEmpty!10713 () Bool)

(declare-fun tp!22580 () Bool)

(assert (=> mapNonEmpty!10713 (= mapRes!10713 (and tp!22580 e!155919))))

(declare-fun mapRest!10713 () (Array (_ BitVec 32) ValueCell!2817))

(declare-fun mapKey!10713 () (_ BitVec 32))

(declare-fun mapValue!10713 () ValueCell!2817)

(assert (=> mapNonEmpty!10713 (= (arr!5662 (_values!4435 thiss!1504)) (store mapRest!10713 mapKey!10713 mapValue!10713))))

(assert (= (and start!22956 res!117751) b!240187))

(assert (= (and b!240187 res!117748) b!240191))

(assert (= (and b!240191 res!117744) b!240201))

(assert (= (and b!240201 c!40017) b!240204))

(assert (= (and b!240201 (not c!40017)) b!240196))

(assert (= (and b!240196 c!40019) b!240184))

(assert (= (and b!240196 (not c!40019)) b!240198))

(assert (= (and b!240184 res!117743) b!240185))

(assert (= (and b!240185 res!117741) b!240182))

(assert (= (and b!240198 c!40018) b!240190))

(assert (= (and b!240198 (not c!40018)) b!240197))

(assert (= (and b!240190 res!117745) b!240189))

(assert (= (and b!240189 res!117749) b!240186))

(assert (= (or b!240184 b!240190) bm!22335))

(assert (= (or b!240182 b!240186) bm!22334))

(assert (= (and b!240201 res!117740) b!240193))

(assert (= (and b!240193 res!117750) b!240194))

(assert (= (and b!240194 res!117747) b!240200))

(assert (= (and b!240200 res!117742) b!240192))

(assert (= (and b!240192 res!117752) b!240188))

(assert (= (and b!240188 res!117746) b!240195))

(assert (= (and b!240199 condMapEmpty!10713) mapIsEmpty!10713))

(assert (= (and b!240199 (not condMapEmpty!10713)) mapNonEmpty!10713))

(assert (= (and mapNonEmpty!10713 ((_ is ValueCellFull!2817) mapValue!10713)) b!240202))

(assert (= (and b!240199 ((_ is ValueCellFull!2817) mapDefault!10713)) b!240183))

(assert (= b!240203 b!240199))

(assert (= start!22956 b!240203))

(declare-fun m!259883 () Bool)

(assert (=> b!240203 m!259883))

(declare-fun m!259885 () Bool)

(assert (=> b!240203 m!259885))

(declare-fun m!259887 () Bool)

(assert (=> mapNonEmpty!10713 m!259887))

(declare-fun m!259889 () Bool)

(assert (=> bm!22334 m!259889))

(assert (=> b!240193 m!259889))

(declare-fun m!259891 () Bool)

(assert (=> b!240196 m!259891))

(declare-fun m!259893 () Bool)

(assert (=> b!240188 m!259893))

(declare-fun m!259895 () Bool)

(assert (=> start!22956 m!259895))

(declare-fun m!259897 () Bool)

(assert (=> b!240191 m!259897))

(declare-fun m!259899 () Bool)

(assert (=> b!240194 m!259899))

(declare-fun m!259901 () Bool)

(assert (=> b!240195 m!259901))

(declare-fun m!259903 () Bool)

(assert (=> b!240189 m!259903))

(declare-fun m!259905 () Bool)

(assert (=> b!240201 m!259905))

(declare-fun m!259907 () Bool)

(assert (=> b!240201 m!259907))

(assert (=> b!240201 m!259907))

(declare-fun m!259909 () Bool)

(assert (=> b!240201 m!259909))

(declare-fun m!259911 () Bool)

(assert (=> b!240204 m!259911))

(declare-fun m!259913 () Bool)

(assert (=> bm!22335 m!259913))

(declare-fun m!259915 () Bool)

(assert (=> b!240192 m!259915))

(declare-fun m!259917 () Bool)

(assert (=> b!240185 m!259917))

(check-sat (not b!240193) (not bm!22335) tp_is_empty!6321 (not b!240195) (not b!240188) (not b_next!6459) (not b!240196) (not b!240201) (not b!240194) (not bm!22334) (not b!240203) (not b!240191) (not b!240192) b_and!13425 (not b!240204) (not mapNonEmpty!10713) (not start!22956))
(check-sat b_and!13425 (not b_next!6459))
