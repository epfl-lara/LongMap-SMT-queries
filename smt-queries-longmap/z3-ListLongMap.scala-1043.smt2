; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21942 () Bool)

(assert start!21942)

(declare-fun b!223910 () Bool)

(declare-fun b_free!6009 () Bool)

(declare-fun b_next!6009 () Bool)

(assert (=> b!223910 (= b_free!6009 (not b_next!6009))))

(declare-fun tp!21169 () Bool)

(declare-fun b_and!12907 () Bool)

(assert (=> b!223910 (= tp!21169 b_and!12907)))

(declare-fun b!223893 () Bool)

(declare-fun e!145411 () Bool)

(declare-fun e!145410 () Bool)

(declare-fun mapRes!9976 () Bool)

(assert (=> b!223893 (= e!145411 (and e!145410 mapRes!9976))))

(declare-fun condMapEmpty!9976 () Bool)

(declare-datatypes ((V!7475 0))(
  ( (V!7476 (val!2980 Int)) )
))
(declare-datatypes ((ValueCell!2592 0))(
  ( (ValueCellFull!2592 (v!5000 V!7475)) (EmptyCell!2592) )
))
(declare-datatypes ((array!10985 0))(
  ( (array!10986 (arr!5212 (Array (_ BitVec 32) ValueCell!2592)) (size!5545 (_ BitVec 32))) )
))
(declare-datatypes ((array!10987 0))(
  ( (array!10988 (arr!5213 (Array (_ BitVec 32) (_ BitVec 64))) (size!5546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3084 0))(
  ( (LongMapFixedSize!3085 (defaultEntry!4201 Int) (mask!10031 (_ BitVec 32)) (extraKeys!3938 (_ BitVec 32)) (zeroValue!4042 V!7475) (minValue!4042 V!7475) (_size!1591 (_ BitVec 32)) (_keys!6255 array!10987) (_values!4184 array!10985) (_vacant!1591 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3084)

(declare-fun mapDefault!9976 () ValueCell!2592)

(assert (=> b!223893 (= condMapEmpty!9976 (= (arr!5212 (_values!4184 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2592)) mapDefault!9976)))))

(declare-fun b!223894 () Bool)

(declare-datatypes ((Unit!6730 0))(
  ( (Unit!6731) )
))
(declare-fun e!145414 () Unit!6730)

(declare-fun Unit!6732 () Unit!6730)

(assert (=> b!223894 (= e!145414 Unit!6732)))

(declare-fun lt!113019 () Unit!6730)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!235 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7475 V!7475 (_ BitVec 64) Int) Unit!6730)

(assert (=> b!223894 (= lt!113019 (lemmaInListMapThenSeekEntryOrOpenFindsIt!235 (_keys!6255 thiss!1504) (_values!4184 thiss!1504) (mask!10031 thiss!1504) (extraKeys!3938 thiss!1504) (zeroValue!4042 thiss!1504) (minValue!4042 thiss!1504) key!932 (defaultEntry!4201 thiss!1504)))))

(assert (=> b!223894 false))

(declare-fun b!223895 () Bool)

(declare-fun res!110101 () Bool)

(declare-fun e!145401 () Bool)

(assert (=> b!223895 (=> (not res!110101) (not e!145401))))

(declare-datatypes ((SeekEntryResult!853 0))(
  ( (MissingZero!853 (index!5582 (_ BitVec 32))) (Found!853 (index!5583 (_ BitVec 32))) (Intermediate!853 (undefined!1665 Bool) (index!5584 (_ BitVec 32)) (x!23113 (_ BitVec 32))) (Undefined!853) (MissingVacant!853 (index!5585 (_ BitVec 32))) )
))
(declare-fun lt!113017 () SeekEntryResult!853)

(assert (=> b!223895 (= res!110101 (= (select (arr!5213 (_keys!6255 thiss!1504)) (index!5582 lt!113017)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20858 () Bool)

(declare-fun call!20862 () Bool)

(declare-fun arrayContainsKey!0 (array!10987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20858 (= call!20862 (arrayContainsKey!0 (_keys!6255 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223896 () Bool)

(declare-fun e!145412 () Bool)

(assert (=> b!223896 (= e!145412 (not call!20862))))

(declare-fun b!223897 () Bool)

(declare-fun e!145406 () Bool)

(get-info :version)

(assert (=> b!223897 (= e!145406 ((_ is Undefined!853) lt!113017))))

(declare-fun b!223898 () Bool)

(assert (=> b!223898 (= e!145406 e!145412)))

(declare-fun res!110094 () Bool)

(declare-fun call!20861 () Bool)

(assert (=> b!223898 (= res!110094 call!20861)))

(assert (=> b!223898 (=> (not res!110094) (not e!145412))))

(declare-fun b!223899 () Bool)

(declare-fun lt!113014 () Unit!6730)

(assert (=> b!223899 (= e!145414 lt!113014)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!246 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7475 V!7475 (_ BitVec 64) Int) Unit!6730)

(assert (=> b!223899 (= lt!113014 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!246 (_keys!6255 thiss!1504) (_values!4184 thiss!1504) (mask!10031 thiss!1504) (extraKeys!3938 thiss!1504) (zeroValue!4042 thiss!1504) (minValue!4042 thiss!1504) key!932 (defaultEntry!4201 thiss!1504)))))

(declare-fun c!37151 () Bool)

(assert (=> b!223899 (= c!37151 ((_ is MissingZero!853) lt!113017))))

(declare-fun e!145400 () Bool)

(assert (=> b!223899 e!145400))

(declare-fun b!223900 () Bool)

(declare-fun res!110106 () Bool)

(assert (=> b!223900 (= res!110106 (= (select (arr!5213 (_keys!6255 thiss!1504)) (index!5585 lt!113017)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223900 (=> (not res!110106) (not e!145412))))

(declare-fun b!223901 () Bool)

(declare-fun res!110093 () Bool)

(declare-fun e!145415 () Bool)

(assert (=> b!223901 (=> (not res!110093) (not e!145415))))

(declare-datatypes ((List!3327 0))(
  ( (Nil!3324) (Cons!3323 (h!3971 (_ BitVec 64)) (t!8286 List!3327)) )
))
(declare-fun contains!1547 (List!3327 (_ BitVec 64)) Bool)

(assert (=> b!223901 (= res!110093 (not (contains!1547 Nil!3324 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223902 () Bool)

(declare-fun e!145407 () Bool)

(declare-fun e!145398 () Bool)

(assert (=> b!223902 (= e!145407 e!145398)))

(declare-fun res!110105 () Bool)

(assert (=> b!223902 (=> (not res!110105) (not e!145398))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223902 (= res!110105 (inRange!0 index!297 (mask!10031 thiss!1504)))))

(declare-fun lt!113020 () Unit!6730)

(assert (=> b!223902 (= lt!113020 e!145414)))

(declare-fun c!37150 () Bool)

(declare-datatypes ((tuple2!4416 0))(
  ( (tuple2!4417 (_1!2219 (_ BitVec 64)) (_2!2219 V!7475)) )
))
(declare-datatypes ((List!3328 0))(
  ( (Nil!3325) (Cons!3324 (h!3972 tuple2!4416) (t!8287 List!3328)) )
))
(declare-datatypes ((ListLongMap!3329 0))(
  ( (ListLongMap!3330 (toList!1680 List!3328)) )
))
(declare-fun contains!1548 (ListLongMap!3329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1208 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7475 V!7475 (_ BitVec 32) Int) ListLongMap!3329)

(assert (=> b!223902 (= c!37150 (contains!1548 (getCurrentListMap!1208 (_keys!6255 thiss!1504) (_values!4184 thiss!1504) (mask!10031 thiss!1504) (extraKeys!3938 thiss!1504) (zeroValue!4042 thiss!1504) (minValue!4042 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4201 thiss!1504)) key!932))))

(declare-fun res!110109 () Bool)

(declare-fun e!145405 () Bool)

(assert (=> start!21942 (=> (not res!110109) (not e!145405))))

(declare-fun valid!1243 (LongMapFixedSize!3084) Bool)

(assert (=> start!21942 (= res!110109 (valid!1243 thiss!1504))))

(assert (=> start!21942 e!145405))

(declare-fun e!145399 () Bool)

(assert (=> start!21942 e!145399))

(assert (=> start!21942 true))

(declare-fun b!223903 () Bool)

(declare-fun res!110107 () Bool)

(assert (=> b!223903 (=> (not res!110107) (not e!145415))))

(declare-fun lt!113016 () Bool)

(assert (=> b!223903 (= res!110107 (not lt!113016))))

(declare-fun b!223904 () Bool)

(assert (=> b!223904 (= e!145398 e!145415)))

(declare-fun res!110095 () Bool)

(assert (=> b!223904 (=> (not res!110095) (not e!145415))))

(assert (=> b!223904 (= res!110095 (and (bvslt (size!5546 (_keys!6255 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5546 (_keys!6255 thiss!1504)))))))

(declare-fun lt!113021 () Unit!6730)

(declare-fun e!145413 () Unit!6730)

(assert (=> b!223904 (= lt!113021 e!145413)))

(declare-fun c!37149 () Bool)

(assert (=> b!223904 (= c!37149 lt!113016)))

(assert (=> b!223904 (= lt!113016 (arrayContainsKey!0 (_keys!6255 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223905 () Bool)

(declare-fun res!110096 () Bool)

(assert (=> b!223905 (=> (not res!110096) (not e!145415))))

(assert (=> b!223905 (= res!110096 (not (contains!1547 Nil!3324 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223906 () Bool)

(declare-fun e!145409 () Bool)

(declare-fun e!145403 () Bool)

(assert (=> b!223906 (= e!145409 e!145403)))

(declare-fun res!110099 () Bool)

(assert (=> b!223906 (=> (not res!110099) (not e!145403))))

(assert (=> b!223906 (= res!110099 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223907 () Bool)

(declare-fun e!145408 () Bool)

(declare-fun tp_is_empty!5871 () Bool)

(assert (=> b!223907 (= e!145408 tp_is_empty!5871)))

(declare-fun b!223908 () Bool)

(assert (=> b!223908 (= e!145401 (not call!20862))))

(declare-fun b!223909 () Bool)

(declare-fun e!145402 () Bool)

(assert (=> b!223909 (= e!145402 (contains!1547 Nil!3324 key!932))))

(declare-fun array_inv!3449 (array!10987) Bool)

(declare-fun array_inv!3450 (array!10985) Bool)

(assert (=> b!223910 (= e!145399 (and tp!21169 tp_is_empty!5871 (array_inv!3449 (_keys!6255 thiss!1504)) (array_inv!3450 (_values!4184 thiss!1504)) e!145411))))

(declare-fun b!223911 () Bool)

(declare-fun Unit!6733 () Unit!6730)

(assert (=> b!223911 (= e!145413 Unit!6733)))

(declare-fun lt!113015 () Unit!6730)

(declare-fun lemmaArrayContainsKeyThenInListMap!75 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7475 V!7475 (_ BitVec 64) (_ BitVec 32) Int) Unit!6730)

(assert (=> b!223911 (= lt!113015 (lemmaArrayContainsKeyThenInListMap!75 (_keys!6255 thiss!1504) (_values!4184 thiss!1504) (mask!10031 thiss!1504) (extraKeys!3938 thiss!1504) (zeroValue!4042 thiss!1504) (minValue!4042 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4201 thiss!1504)))))

(assert (=> b!223911 false))

(declare-fun b!223912 () Bool)

(declare-fun res!110100 () Bool)

(assert (=> b!223912 (=> (not res!110100) (not e!145415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223912 (= res!110100 (validKeyInArray!0 key!932))))

(declare-fun b!223913 () Bool)

(assert (=> b!223913 (= e!145415 false)))

(declare-fun lt!113018 () Bool)

(assert (=> b!223913 (= lt!113018 (contains!1547 Nil!3324 key!932))))

(declare-fun mapIsEmpty!9976 () Bool)

(assert (=> mapIsEmpty!9976 mapRes!9976))

(declare-fun b!223914 () Bool)

(declare-fun res!110103 () Bool)

(assert (=> b!223914 (=> (not res!110103) (not e!145415))))

(declare-fun noDuplicate!81 (List!3327) Bool)

(assert (=> b!223914 (= res!110103 (noDuplicate!81 Nil!3324))))

(declare-fun b!223915 () Bool)

(assert (=> b!223915 (= e!145410 tp_is_empty!5871)))

(declare-fun mapNonEmpty!9976 () Bool)

(declare-fun tp!21168 () Bool)

(assert (=> mapNonEmpty!9976 (= mapRes!9976 (and tp!21168 e!145408))))

(declare-fun mapKey!9976 () (_ BitVec 32))

(declare-fun mapRest!9976 () (Array (_ BitVec 32) ValueCell!2592))

(declare-fun mapValue!9976 () ValueCell!2592)

(assert (=> mapNonEmpty!9976 (= (arr!5212 (_values!4184 thiss!1504)) (store mapRest!9976 mapKey!9976 mapValue!9976))))

(declare-fun b!223916 () Bool)

(declare-fun res!110091 () Bool)

(assert (=> b!223916 (=> (not res!110091) (not e!145415))))

(assert (=> b!223916 (= res!110091 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5546 (_keys!6255 thiss!1504)))))))

(declare-fun b!223917 () Bool)

(assert (=> b!223917 (= e!145405 e!145407)))

(declare-fun res!110092 () Bool)

(assert (=> b!223917 (=> (not res!110092) (not e!145407))))

(assert (=> b!223917 (= res!110092 (or (= lt!113017 (MissingZero!853 index!297)) (= lt!113017 (MissingVacant!853 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10987 (_ BitVec 32)) SeekEntryResult!853)

(assert (=> b!223917 (= lt!113017 (seekEntryOrOpen!0 key!932 (_keys!6255 thiss!1504) (mask!10031 thiss!1504)))))

(declare-fun b!223918 () Bool)

(declare-fun res!110097 () Bool)

(assert (=> b!223918 (=> (not res!110097) (not e!145415))))

(assert (=> b!223918 (= res!110097 e!145409)))

(declare-fun res!110104 () Bool)

(assert (=> b!223918 (=> res!110104 e!145409)))

(assert (=> b!223918 (= res!110104 e!145402)))

(declare-fun res!110098 () Bool)

(assert (=> b!223918 (=> (not res!110098) (not e!145402))))

(assert (=> b!223918 (= res!110098 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223919 () Bool)

(declare-fun res!110108 () Bool)

(assert (=> b!223919 (=> (not res!110108) (not e!145405))))

(assert (=> b!223919 (= res!110108 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20859 () Bool)

(assert (=> bm!20859 (= call!20861 (inRange!0 (ite c!37151 (index!5582 lt!113017) (index!5585 lt!113017)) (mask!10031 thiss!1504)))))

(declare-fun b!223920 () Bool)

(assert (=> b!223920 (= e!145403 (not (contains!1547 Nil!3324 key!932)))))

(declare-fun b!223921 () Bool)

(declare-fun res!110110 () Bool)

(assert (=> b!223921 (=> (not res!110110) (not e!145401))))

(assert (=> b!223921 (= res!110110 call!20861)))

(assert (=> b!223921 (= e!145400 e!145401)))

(declare-fun b!223922 () Bool)

(declare-fun c!37152 () Bool)

(assert (=> b!223922 (= c!37152 ((_ is MissingVacant!853) lt!113017))))

(assert (=> b!223922 (= e!145400 e!145406)))

(declare-fun b!223923 () Bool)

(declare-fun Unit!6734 () Unit!6730)

(assert (=> b!223923 (= e!145413 Unit!6734)))

(declare-fun b!223924 () Bool)

(declare-fun res!110102 () Bool)

(assert (=> b!223924 (=> (not res!110102) (not e!145415))))

(declare-fun arrayNoDuplicates!0 (array!10987 (_ BitVec 32) List!3327) Bool)

(assert (=> b!223924 (= res!110102 (arrayNoDuplicates!0 (_keys!6255 thiss!1504) #b00000000000000000000000000000000 Nil!3324))))

(assert (= (and start!21942 res!110109) b!223919))

(assert (= (and b!223919 res!110108) b!223917))

(assert (= (and b!223917 res!110092) b!223902))

(assert (= (and b!223902 c!37150) b!223894))

(assert (= (and b!223902 (not c!37150)) b!223899))

(assert (= (and b!223899 c!37151) b!223921))

(assert (= (and b!223899 (not c!37151)) b!223922))

(assert (= (and b!223921 res!110110) b!223895))

(assert (= (and b!223895 res!110101) b!223908))

(assert (= (and b!223922 c!37152) b!223898))

(assert (= (and b!223922 (not c!37152)) b!223897))

(assert (= (and b!223898 res!110094) b!223900))

(assert (= (and b!223900 res!110106) b!223896))

(assert (= (or b!223921 b!223898) bm!20859))

(assert (= (or b!223908 b!223896) bm!20858))

(assert (= (and b!223902 res!110105) b!223904))

(assert (= (and b!223904 c!37149) b!223911))

(assert (= (and b!223904 (not c!37149)) b!223923))

(assert (= (and b!223904 res!110095) b!223914))

(assert (= (and b!223914 res!110103) b!223901))

(assert (= (and b!223901 res!110093) b!223905))

(assert (= (and b!223905 res!110096) b!223918))

(assert (= (and b!223918 res!110098) b!223909))

(assert (= (and b!223918 (not res!110104)) b!223906))

(assert (= (and b!223906 res!110099) b!223920))

(assert (= (and b!223918 res!110097) b!223924))

(assert (= (and b!223924 res!110102) b!223916))

(assert (= (and b!223916 res!110091) b!223912))

(assert (= (and b!223912 res!110100) b!223903))

(assert (= (and b!223903 res!110107) b!223913))

(assert (= (and b!223893 condMapEmpty!9976) mapIsEmpty!9976))

(assert (= (and b!223893 (not condMapEmpty!9976)) mapNonEmpty!9976))

(assert (= (and mapNonEmpty!9976 ((_ is ValueCellFull!2592) mapValue!9976)) b!223907))

(assert (= (and b!223893 ((_ is ValueCellFull!2592) mapDefault!9976)) b!223915))

(assert (= b!223910 b!223893))

(assert (= start!21942 b!223910))

(declare-fun m!247205 () Bool)

(assert (=> b!223905 m!247205))

(declare-fun m!247207 () Bool)

(assert (=> bm!20858 m!247207))

(declare-fun m!247209 () Bool)

(assert (=> mapNonEmpty!9976 m!247209))

(declare-fun m!247211 () Bool)

(assert (=> start!21942 m!247211))

(declare-fun m!247213 () Bool)

(assert (=> b!223900 m!247213))

(assert (=> b!223904 m!247207))

(declare-fun m!247215 () Bool)

(assert (=> bm!20859 m!247215))

(declare-fun m!247217 () Bool)

(assert (=> b!223895 m!247217))

(declare-fun m!247219 () Bool)

(assert (=> b!223914 m!247219))

(declare-fun m!247221 () Bool)

(assert (=> b!223912 m!247221))

(declare-fun m!247223 () Bool)

(assert (=> b!223901 m!247223))

(declare-fun m!247225 () Bool)

(assert (=> b!223917 m!247225))

(declare-fun m!247227 () Bool)

(assert (=> b!223920 m!247227))

(declare-fun m!247229 () Bool)

(assert (=> b!223899 m!247229))

(declare-fun m!247231 () Bool)

(assert (=> b!223911 m!247231))

(declare-fun m!247233 () Bool)

(assert (=> b!223894 m!247233))

(assert (=> b!223913 m!247227))

(declare-fun m!247235 () Bool)

(assert (=> b!223902 m!247235))

(declare-fun m!247237 () Bool)

(assert (=> b!223902 m!247237))

(assert (=> b!223902 m!247237))

(declare-fun m!247239 () Bool)

(assert (=> b!223902 m!247239))

(declare-fun m!247241 () Bool)

(assert (=> b!223924 m!247241))

(assert (=> b!223909 m!247227))

(declare-fun m!247243 () Bool)

(assert (=> b!223910 m!247243))

(declare-fun m!247245 () Bool)

(assert (=> b!223910 m!247245))

(check-sat (not bm!20858) (not bm!20859) (not b!223924) (not b!223902) (not b!223913) (not b!223901) b_and!12907 (not b!223917) (not b!223909) (not b!223911) (not b!223904) (not start!21942) tp_is_empty!5871 (not b!223912) (not b!223914) (not b!223910) (not b!223899) (not mapNonEmpty!9976) (not b!223905) (not b!223920) (not b_next!6009) (not b!223894))
(check-sat b_and!12907 (not b_next!6009))
