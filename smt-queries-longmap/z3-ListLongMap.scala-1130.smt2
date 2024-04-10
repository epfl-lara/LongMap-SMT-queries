; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23220 () Bool)

(assert start!23220)

(declare-fun b!243862 () Bool)

(declare-fun b_free!6531 () Bool)

(declare-fun b_next!6531 () Bool)

(assert (=> b!243862 (= b_free!6531 (not b_next!6531))))

(declare-fun tp!22815 () Bool)

(declare-fun b_and!13513 () Bool)

(assert (=> b!243862 (= tp!22815 b_and!13513)))

(declare-fun res!119559 () Bool)

(declare-fun e!158257 () Bool)

(assert (=> start!23220 (=> (not res!119559) (not e!158257))))

(declare-datatypes ((V!8171 0))(
  ( (V!8172 (val!3241 Int)) )
))
(declare-datatypes ((ValueCell!2853 0))(
  ( (ValueCellFull!2853 (v!5288 V!8171)) (EmptyCell!2853) )
))
(declare-datatypes ((array!12077 0))(
  ( (array!12078 (arr!5734 (Array (_ BitVec 32) ValueCell!2853)) (size!6076 (_ BitVec 32))) )
))
(declare-datatypes ((array!12079 0))(
  ( (array!12080 (arr!5735 (Array (_ BitVec 32) (_ BitVec 64))) (size!6077 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3606 0))(
  ( (LongMapFixedSize!3607 (defaultEntry!4516 Int) (mask!10611 (_ BitVec 32)) (extraKeys!4253 (_ BitVec 32)) (zeroValue!4357 V!8171) (minValue!4357 V!8171) (_size!1852 (_ BitVec 32)) (_keys!6627 array!12079) (_values!4499 array!12077) (_vacant!1852 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3606)

(declare-fun valid!1412 (LongMapFixedSize!3606) Bool)

(assert (=> start!23220 (= res!119559 (valid!1412 thiss!1504))))

(assert (=> start!23220 e!158257))

(declare-fun e!158245 () Bool)

(assert (=> start!23220 e!158245))

(assert (=> start!23220 true))

(declare-fun b!243852 () Bool)

(declare-fun e!158246 () Bool)

(declare-fun call!22736 () Bool)

(assert (=> b!243852 (= e!158246 (not call!22736))))

(declare-fun b!243853 () Bool)

(declare-fun e!158247 () Bool)

(declare-fun tp_is_empty!6393 () Bool)

(assert (=> b!243853 (= e!158247 tp_is_empty!6393)))

(declare-fun b!243854 () Bool)

(declare-datatypes ((Unit!7524 0))(
  ( (Unit!7525) )
))
(declare-fun e!158254 () Unit!7524)

(declare-fun Unit!7526 () Unit!7524)

(assert (=> b!243854 (= e!158254 Unit!7526)))

(declare-fun lt!122299 () Unit!7524)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!167 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 64) (_ BitVec 32) Int) Unit!7524)

(assert (=> b!243854 (= lt!122299 (lemmaArrayContainsKeyThenInListMap!167 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(assert (=> b!243854 false))

(declare-fun b!243855 () Bool)

(declare-fun res!119567 () Bool)

(assert (=> b!243855 (=> (not res!119567) (not e!158246))))

(declare-datatypes ((SeekEntryResult!1076 0))(
  ( (MissingZero!1076 (index!6474 (_ BitVec 32))) (Found!1076 (index!6475 (_ BitVec 32))) (Intermediate!1076 (undefined!1888 Bool) (index!6476 (_ BitVec 32)) (x!24344 (_ BitVec 32))) (Undefined!1076) (MissingVacant!1076 (index!6477 (_ BitVec 32))) )
))
(declare-fun lt!122297 () SeekEntryResult!1076)

(assert (=> b!243855 (= res!119567 (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6474 lt!122297)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243856 () Bool)

(declare-fun res!119569 () Bool)

(assert (=> b!243856 (= res!119569 (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6477 lt!122297)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158251 () Bool)

(assert (=> b!243856 (=> (not res!119569) (not e!158251))))

(declare-fun b!243857 () Bool)

(declare-fun e!158250 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243857 (= e!158250 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6077 (_keys!6627 thiss!1504)))))))

(declare-fun b!243858 () Bool)

(declare-fun Unit!7527 () Unit!7524)

(assert (=> b!243858 (= e!158254 Unit!7527)))

(declare-fun b!243859 () Bool)

(declare-fun e!158249 () Bool)

(assert (=> b!243859 (= e!158249 e!158250)))

(declare-fun res!119568 () Bool)

(assert (=> b!243859 (=> (not res!119568) (not e!158250))))

(assert (=> b!243859 (= res!119568 (and (bvslt (size!6077 (_keys!6627 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504)))))))

(declare-fun lt!122296 () Unit!7524)

(assert (=> b!243859 (= lt!122296 e!158254)))

(declare-fun c!40701 () Bool)

(declare-fun arrayContainsKey!0 (array!12079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!243859 (= c!40701 (arrayContainsKey!0 (_keys!6627 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243860 () Bool)

(declare-fun e!158248 () Bool)

(declare-fun e!158253 () Bool)

(assert (=> b!243860 (= e!158248 e!158253)))

(declare-fun res!119554 () Bool)

(assert (=> b!243860 (=> (not res!119554) (not e!158253))))

(assert (=> b!243860 (= res!119554 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!243861 () Bool)

(declare-fun e!158255 () Bool)

(assert (=> b!243861 (= e!158257 e!158255)))

(declare-fun res!119553 () Bool)

(assert (=> b!243861 (=> (not res!119553) (not e!158255))))

(assert (=> b!243861 (= res!119553 (or (= lt!122297 (MissingZero!1076 index!297)) (= lt!122297 (MissingVacant!1076 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12079 (_ BitVec 32)) SeekEntryResult!1076)

(assert (=> b!243861 (= lt!122297 (seekEntryOrOpen!0 key!932 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)))))

(declare-fun e!158259 () Bool)

(declare-fun array_inv!3791 (array!12079) Bool)

(declare-fun array_inv!3792 (array!12077) Bool)

(assert (=> b!243862 (= e!158245 (and tp!22815 tp_is_empty!6393 (array_inv!3791 (_keys!6627 thiss!1504)) (array_inv!3792 (_values!4499 thiss!1504)) e!158259))))

(declare-fun b!243863 () Bool)

(declare-fun c!40699 () Bool)

(get-info :version)

(assert (=> b!243863 (= c!40699 ((_ is MissingVacant!1076) lt!122297))))

(declare-fun e!158252 () Bool)

(declare-fun e!158244 () Bool)

(assert (=> b!243863 (= e!158252 e!158244)))

(declare-fun b!243864 () Bool)

(declare-fun res!119565 () Bool)

(assert (=> b!243864 (=> (not res!119565) (not e!158250))))

(assert (=> b!243864 (= res!119565 e!158248)))

(declare-fun res!119555 () Bool)

(assert (=> b!243864 (=> res!119555 e!158248)))

(declare-fun e!158261 () Bool)

(assert (=> b!243864 (= res!119555 e!158261)))

(declare-fun res!119563 () Bool)

(assert (=> b!243864 (=> (not res!119563) (not e!158261))))

(assert (=> b!243864 (= res!119563 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!243865 () Bool)

(assert (=> b!243865 (= e!158244 e!158251)))

(declare-fun res!119564 () Bool)

(declare-fun call!22737 () Bool)

(assert (=> b!243865 (= res!119564 call!22737)))

(assert (=> b!243865 (=> (not res!119564) (not e!158251))))

(declare-fun c!40698 () Bool)

(declare-fun bm!22733 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22733 (= call!22737 (inRange!0 (ite c!40698 (index!6474 lt!122297) (index!6477 lt!122297)) (mask!10611 thiss!1504)))))

(declare-fun b!243866 () Bool)

(declare-fun res!119556 () Bool)

(assert (=> b!243866 (=> (not res!119556) (not e!158250))))

(declare-datatypes ((List!3650 0))(
  ( (Nil!3647) (Cons!3646 (h!4303 (_ BitVec 64)) (t!8657 List!3650)) )
))
(declare-fun noDuplicate!99 (List!3650) Bool)

(assert (=> b!243866 (= res!119556 (noDuplicate!99 Nil!3647))))

(declare-fun b!243867 () Bool)

(assert (=> b!243867 (= e!158255 e!158249)))

(declare-fun res!119558 () Bool)

(assert (=> b!243867 (=> (not res!119558) (not e!158249))))

(assert (=> b!243867 (= res!119558 (inRange!0 index!297 (mask!10611 thiss!1504)))))

(declare-fun lt!122295 () Unit!7524)

(declare-fun e!158258 () Unit!7524)

(assert (=> b!243867 (= lt!122295 e!158258)))

(declare-fun c!40700 () Bool)

(declare-datatypes ((tuple2!4768 0))(
  ( (tuple2!4769 (_1!2395 (_ BitVec 64)) (_2!2395 V!8171)) )
))
(declare-datatypes ((List!3651 0))(
  ( (Nil!3648) (Cons!3647 (h!4304 tuple2!4768) (t!8658 List!3651)) )
))
(declare-datatypes ((ListLongMap!3681 0))(
  ( (ListLongMap!3682 (toList!1856 List!3651)) )
))
(declare-fun contains!1756 (ListLongMap!3681 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1384 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 32) Int) ListLongMap!3681)

(assert (=> b!243867 (= c!40700 (contains!1756 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)) key!932))))

(declare-fun b!243868 () Bool)

(declare-fun contains!1757 (List!3650 (_ BitVec 64)) Bool)

(assert (=> b!243868 (= e!158261 (contains!1757 Nil!3647 key!932))))

(declare-fun b!243869 () Bool)

(declare-fun res!119562 () Bool)

(assert (=> b!243869 (=> (not res!119562) (not e!158250))))

(declare-fun arrayNoDuplicates!0 (array!12079 (_ BitVec 32) List!3650) Bool)

(assert (=> b!243869 (= res!119562 (arrayNoDuplicates!0 (_keys!6627 thiss!1504) #b00000000000000000000000000000000 Nil!3647))))

(declare-fun mapIsEmpty!10840 () Bool)

(declare-fun mapRes!10840 () Bool)

(assert (=> mapIsEmpty!10840 mapRes!10840))

(declare-fun b!243870 () Bool)

(declare-fun Unit!7528 () Unit!7524)

(assert (=> b!243870 (= e!158258 Unit!7528)))

(declare-fun lt!122294 () Unit!7524)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!363 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 64) Int) Unit!7524)

(assert (=> b!243870 (= lt!122294 (lemmaInListMapThenSeekEntryOrOpenFindsIt!363 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 (defaultEntry!4516 thiss!1504)))))

(assert (=> b!243870 false))

(declare-fun b!243871 () Bool)

(assert (=> b!243871 (= e!158244 ((_ is Undefined!1076) lt!122297))))

(declare-fun b!243872 () Bool)

(declare-fun res!119557 () Bool)

(assert (=> b!243872 (=> (not res!119557) (not e!158257))))

(assert (=> b!243872 (= res!119557 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10840 () Bool)

(declare-fun tp!22816 () Bool)

(assert (=> mapNonEmpty!10840 (= mapRes!10840 (and tp!22816 e!158247))))

(declare-fun mapValue!10840 () ValueCell!2853)

(declare-fun mapRest!10840 () (Array (_ BitVec 32) ValueCell!2853))

(declare-fun mapKey!10840 () (_ BitVec 32))

(assert (=> mapNonEmpty!10840 (= (arr!5734 (_values!4499 thiss!1504)) (store mapRest!10840 mapKey!10840 mapValue!10840))))

(declare-fun bm!22734 () Bool)

(assert (=> bm!22734 (= call!22736 (arrayContainsKey!0 (_keys!6627 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243873 () Bool)

(declare-fun res!119566 () Bool)

(assert (=> b!243873 (=> (not res!119566) (not e!158250))))

(assert (=> b!243873 (= res!119566 (not (contains!1757 Nil!3647 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243874 () Bool)

(assert (=> b!243874 (= e!158253 (not (contains!1757 Nil!3647 key!932)))))

(declare-fun b!243875 () Bool)

(declare-fun lt!122298 () Unit!7524)

(assert (=> b!243875 (= e!158258 lt!122298)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!370 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 64) Int) Unit!7524)

(assert (=> b!243875 (= lt!122298 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!370 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 (defaultEntry!4516 thiss!1504)))))

(assert (=> b!243875 (= c!40698 ((_ is MissingZero!1076) lt!122297))))

(assert (=> b!243875 e!158252))

(declare-fun b!243876 () Bool)

(declare-fun res!119560 () Bool)

(assert (=> b!243876 (=> (not res!119560) (not e!158246))))

(assert (=> b!243876 (= res!119560 call!22737)))

(assert (=> b!243876 (= e!158252 e!158246)))

(declare-fun b!243877 () Bool)

(declare-fun e!158256 () Bool)

(assert (=> b!243877 (= e!158259 (and e!158256 mapRes!10840))))

(declare-fun condMapEmpty!10840 () Bool)

(declare-fun mapDefault!10840 () ValueCell!2853)

(assert (=> b!243877 (= condMapEmpty!10840 (= (arr!5734 (_values!4499 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2853)) mapDefault!10840)))))

(declare-fun b!243878 () Bool)

(declare-fun res!119561 () Bool)

(assert (=> b!243878 (=> (not res!119561) (not e!158250))))

(assert (=> b!243878 (= res!119561 (not (contains!1757 Nil!3647 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243879 () Bool)

(assert (=> b!243879 (= e!158256 tp_is_empty!6393)))

(declare-fun b!243880 () Bool)

(assert (=> b!243880 (= e!158251 (not call!22736))))

(assert (= (and start!23220 res!119559) b!243872))

(assert (= (and b!243872 res!119557) b!243861))

(assert (= (and b!243861 res!119553) b!243867))

(assert (= (and b!243867 c!40700) b!243870))

(assert (= (and b!243867 (not c!40700)) b!243875))

(assert (= (and b!243875 c!40698) b!243876))

(assert (= (and b!243875 (not c!40698)) b!243863))

(assert (= (and b!243876 res!119560) b!243855))

(assert (= (and b!243855 res!119567) b!243852))

(assert (= (and b!243863 c!40699) b!243865))

(assert (= (and b!243863 (not c!40699)) b!243871))

(assert (= (and b!243865 res!119564) b!243856))

(assert (= (and b!243856 res!119569) b!243880))

(assert (= (or b!243876 b!243865) bm!22733))

(assert (= (or b!243852 b!243880) bm!22734))

(assert (= (and b!243867 res!119558) b!243859))

(assert (= (and b!243859 c!40701) b!243854))

(assert (= (and b!243859 (not c!40701)) b!243858))

(assert (= (and b!243859 res!119568) b!243866))

(assert (= (and b!243866 res!119556) b!243878))

(assert (= (and b!243878 res!119561) b!243873))

(assert (= (and b!243873 res!119566) b!243864))

(assert (= (and b!243864 res!119563) b!243868))

(assert (= (and b!243864 (not res!119555)) b!243860))

(assert (= (and b!243860 res!119554) b!243874))

(assert (= (and b!243864 res!119565) b!243869))

(assert (= (and b!243869 res!119562) b!243857))

(assert (= (and b!243877 condMapEmpty!10840) mapIsEmpty!10840))

(assert (= (and b!243877 (not condMapEmpty!10840)) mapNonEmpty!10840))

(assert (= (and mapNonEmpty!10840 ((_ is ValueCellFull!2853) mapValue!10840)) b!243853))

(assert (= (and b!243877 ((_ is ValueCellFull!2853) mapDefault!10840)) b!243879))

(assert (= b!243862 b!243877))

(assert (= start!23220 b!243862))

(declare-fun m!262071 () Bool)

(assert (=> bm!22733 m!262071))

(declare-fun m!262073 () Bool)

(assert (=> b!243855 m!262073))

(declare-fun m!262075 () Bool)

(assert (=> b!243856 m!262075))

(declare-fun m!262077 () Bool)

(assert (=> b!243859 m!262077))

(declare-fun m!262079 () Bool)

(assert (=> b!243874 m!262079))

(declare-fun m!262081 () Bool)

(assert (=> b!243873 m!262081))

(declare-fun m!262083 () Bool)

(assert (=> b!243862 m!262083))

(declare-fun m!262085 () Bool)

(assert (=> b!243862 m!262085))

(declare-fun m!262087 () Bool)

(assert (=> b!243854 m!262087))

(declare-fun m!262089 () Bool)

(assert (=> b!243875 m!262089))

(assert (=> b!243868 m!262079))

(declare-fun m!262091 () Bool)

(assert (=> b!243861 m!262091))

(declare-fun m!262093 () Bool)

(assert (=> mapNonEmpty!10840 m!262093))

(assert (=> bm!22734 m!262077))

(declare-fun m!262095 () Bool)

(assert (=> b!243867 m!262095))

(declare-fun m!262097 () Bool)

(assert (=> b!243867 m!262097))

(assert (=> b!243867 m!262097))

(declare-fun m!262099 () Bool)

(assert (=> b!243867 m!262099))

(declare-fun m!262101 () Bool)

(assert (=> b!243866 m!262101))

(declare-fun m!262103 () Bool)

(assert (=> b!243869 m!262103))

(declare-fun m!262105 () Bool)

(assert (=> start!23220 m!262105))

(declare-fun m!262107 () Bool)

(assert (=> b!243878 m!262107))

(declare-fun m!262109 () Bool)

(assert (=> b!243870 m!262109))

(check-sat (not mapNonEmpty!10840) b_and!13513 tp_is_empty!6393 (not bm!22734) (not b!243875) (not b!243867) (not b!243866) (not b!243854) (not b!243878) (not b!243862) (not bm!22733) (not b!243868) (not b!243861) (not b_next!6531) (not b!243870) (not b!243859) (not b!243873) (not b!243869) (not b!243874) (not start!23220))
(check-sat b_and!13513 (not b_next!6531))
(get-model)

(declare-fun d!60071 () Bool)

(declare-fun lt!122320 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!161 (List!3650) (InoxSet (_ BitVec 64)))

(assert (=> d!60071 (= lt!122320 (select (content!161 Nil!3647) key!932))))

(declare-fun e!158321 () Bool)

(assert (=> d!60071 (= lt!122320 e!158321)))

(declare-fun res!119626 () Bool)

(assert (=> d!60071 (=> (not res!119626) (not e!158321))))

(assert (=> d!60071 (= res!119626 ((_ is Cons!3646) Nil!3647))))

(assert (=> d!60071 (= (contains!1757 Nil!3647 key!932) lt!122320)))

(declare-fun b!243972 () Bool)

(declare-fun e!158320 () Bool)

(assert (=> b!243972 (= e!158321 e!158320)))

(declare-fun res!119625 () Bool)

(assert (=> b!243972 (=> res!119625 e!158320)))

(assert (=> b!243972 (= res!119625 (= (h!4303 Nil!3647) key!932))))

(declare-fun b!243973 () Bool)

(assert (=> b!243973 (= e!158320 (contains!1757 (t!8657 Nil!3647) key!932))))

(assert (= (and d!60071 res!119626) b!243972))

(assert (= (and b!243972 (not res!119625)) b!243973))

(declare-fun m!262151 () Bool)

(assert (=> d!60071 m!262151))

(declare-fun m!262153 () Bool)

(assert (=> d!60071 m!262153))

(declare-fun m!262155 () Bool)

(assert (=> b!243973 m!262155))

(assert (=> b!243874 d!60071))

(declare-fun d!60073 () Bool)

(declare-fun res!119631 () Bool)

(declare-fun e!158326 () Bool)

(assert (=> d!60073 (=> res!119631 e!158326)))

(assert (=> d!60073 (= res!119631 ((_ is Nil!3647) Nil!3647))))

(assert (=> d!60073 (= (noDuplicate!99 Nil!3647) e!158326)))

(declare-fun b!243978 () Bool)

(declare-fun e!158327 () Bool)

(assert (=> b!243978 (= e!158326 e!158327)))

(declare-fun res!119632 () Bool)

(assert (=> b!243978 (=> (not res!119632) (not e!158327))))

(assert (=> b!243978 (= res!119632 (not (contains!1757 (t!8657 Nil!3647) (h!4303 Nil!3647))))))

(declare-fun b!243979 () Bool)

(assert (=> b!243979 (= e!158327 (noDuplicate!99 (t!8657 Nil!3647)))))

(assert (= (and d!60073 (not res!119631)) b!243978))

(assert (= (and b!243978 res!119632) b!243979))

(declare-fun m!262157 () Bool)

(assert (=> b!243978 m!262157))

(declare-fun m!262159 () Bool)

(assert (=> b!243979 m!262159))

(assert (=> b!243866 d!60073))

(declare-fun d!60075 () Bool)

(declare-fun lt!122321 () Bool)

(assert (=> d!60075 (= lt!122321 (select (content!161 Nil!3647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158329 () Bool)

(assert (=> d!60075 (= lt!122321 e!158329)))

(declare-fun res!119634 () Bool)

(assert (=> d!60075 (=> (not res!119634) (not e!158329))))

(assert (=> d!60075 (= res!119634 ((_ is Cons!3646) Nil!3647))))

(assert (=> d!60075 (= (contains!1757 Nil!3647 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122321)))

(declare-fun b!243980 () Bool)

(declare-fun e!158328 () Bool)

(assert (=> b!243980 (= e!158329 e!158328)))

(declare-fun res!119633 () Bool)

(assert (=> b!243980 (=> res!119633 e!158328)))

(assert (=> b!243980 (= res!119633 (= (h!4303 Nil!3647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243981 () Bool)

(assert (=> b!243981 (= e!158328 (contains!1757 (t!8657 Nil!3647) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60075 res!119634) b!243980))

(assert (= (and b!243980 (not res!119633)) b!243981))

(assert (=> d!60075 m!262151))

(declare-fun m!262161 () Bool)

(assert (=> d!60075 m!262161))

(declare-fun m!262163 () Bool)

(assert (=> b!243981 m!262163))

(assert (=> b!243873 d!60075))

(declare-fun d!60077 () Bool)

(assert (=> d!60077 (= (inRange!0 (ite c!40698 (index!6474 lt!122297) (index!6477 lt!122297)) (mask!10611 thiss!1504)) (and (bvsge (ite c!40698 (index!6474 lt!122297) (index!6477 lt!122297)) #b00000000000000000000000000000000) (bvslt (ite c!40698 (index!6474 lt!122297) (index!6477 lt!122297)) (bvadd (mask!10611 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22733 d!60077))

(declare-fun d!60079 () Bool)

(declare-fun res!119639 () Bool)

(declare-fun e!158334 () Bool)

(assert (=> d!60079 (=> res!119639 e!158334)))

(assert (=> d!60079 (= res!119639 (= (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60079 (= (arrayContainsKey!0 (_keys!6627 thiss!1504) key!932 #b00000000000000000000000000000000) e!158334)))

(declare-fun b!243986 () Bool)

(declare-fun e!158335 () Bool)

(assert (=> b!243986 (= e!158334 e!158335)))

(declare-fun res!119640 () Bool)

(assert (=> b!243986 (=> (not res!119640) (not e!158335))))

(assert (=> b!243986 (= res!119640 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6077 (_keys!6627 thiss!1504))))))

(declare-fun b!243987 () Bool)

(assert (=> b!243987 (= e!158335 (arrayContainsKey!0 (_keys!6627 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60079 (not res!119639)) b!243986))

(assert (= (and b!243986 res!119640) b!243987))

(declare-fun m!262165 () Bool)

(assert (=> d!60079 m!262165))

(declare-fun m!262167 () Bool)

(assert (=> b!243987 m!262167))

(assert (=> bm!22734 d!60079))

(declare-fun b!243998 () Bool)

(declare-fun e!158344 () Bool)

(declare-fun e!158346 () Bool)

(assert (=> b!243998 (= e!158344 e!158346)))

(declare-fun c!40716 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!243998 (= c!40716 (validKeyInArray!0 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60081 () Bool)

(declare-fun res!119649 () Bool)

(declare-fun e!158347 () Bool)

(assert (=> d!60081 (=> res!119649 e!158347)))

(assert (=> d!60081 (= res!119649 (bvsge #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))))))

(assert (=> d!60081 (= (arrayNoDuplicates!0 (_keys!6627 thiss!1504) #b00000000000000000000000000000000 Nil!3647) e!158347)))

(declare-fun b!243999 () Bool)

(declare-fun call!22746 () Bool)

(assert (=> b!243999 (= e!158346 call!22746)))

(declare-fun b!244000 () Bool)

(declare-fun e!158345 () Bool)

(assert (=> b!244000 (= e!158345 (contains!1757 Nil!3647 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22743 () Bool)

(assert (=> bm!22743 (= call!22746 (arrayNoDuplicates!0 (_keys!6627 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40716 (Cons!3646 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000) Nil!3647) Nil!3647)))))

(declare-fun b!244001 () Bool)

(assert (=> b!244001 (= e!158346 call!22746)))

(declare-fun b!244002 () Bool)

(assert (=> b!244002 (= e!158347 e!158344)))

(declare-fun res!119647 () Bool)

(assert (=> b!244002 (=> (not res!119647) (not e!158344))))

(assert (=> b!244002 (= res!119647 (not e!158345))))

(declare-fun res!119648 () Bool)

(assert (=> b!244002 (=> (not res!119648) (not e!158345))))

(assert (=> b!244002 (= res!119648 (validKeyInArray!0 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60081 (not res!119649)) b!244002))

(assert (= (and b!244002 res!119648) b!244000))

(assert (= (and b!244002 res!119647) b!243998))

(assert (= (and b!243998 c!40716) b!244001))

(assert (= (and b!243998 (not c!40716)) b!243999))

(assert (= (or b!244001 b!243999) bm!22743))

(assert (=> b!243998 m!262165))

(assert (=> b!243998 m!262165))

(declare-fun m!262169 () Bool)

(assert (=> b!243998 m!262169))

(assert (=> b!244000 m!262165))

(assert (=> b!244000 m!262165))

(declare-fun m!262171 () Bool)

(assert (=> b!244000 m!262171))

(assert (=> bm!22743 m!262165))

(declare-fun m!262173 () Bool)

(assert (=> bm!22743 m!262173))

(assert (=> b!244002 m!262165))

(assert (=> b!244002 m!262165))

(assert (=> b!244002 m!262169))

(assert (=> b!243869 d!60081))

(assert (=> b!243859 d!60079))

(assert (=> b!243868 d!60071))

(declare-fun bm!22748 () Bool)

(declare-fun call!22751 () Bool)

(assert (=> bm!22748 (= call!22751 (arrayContainsKey!0 (_keys!6627 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244019 () Bool)

(declare-fun e!158356 () Bool)

(assert (=> b!244019 (= e!158356 (not call!22751))))

(declare-fun bm!22749 () Bool)

(declare-fun lt!122326 () SeekEntryResult!1076)

(declare-fun c!40721 () Bool)

(declare-fun call!22752 () Bool)

(assert (=> bm!22749 (= call!22752 (inRange!0 (ite c!40721 (index!6474 lt!122326) (index!6477 lt!122326)) (mask!10611 thiss!1504)))))

(declare-fun b!244020 () Bool)

(declare-fun e!158357 () Bool)

(declare-fun e!158358 () Bool)

(assert (=> b!244020 (= e!158357 e!158358)))

(declare-fun c!40722 () Bool)

(assert (=> b!244020 (= c!40722 ((_ is MissingVacant!1076) lt!122326))))

(declare-fun b!244021 () Bool)

(declare-fun res!119661 () Bool)

(assert (=> b!244021 (=> (not res!119661) (not e!158356))))

(assert (=> b!244021 (= res!119661 call!22752)))

(assert (=> b!244021 (= e!158358 e!158356)))

(declare-fun b!244022 () Bool)

(declare-fun e!158359 () Bool)

(assert (=> b!244022 (= e!158357 e!158359)))

(declare-fun res!119658 () Bool)

(assert (=> b!244022 (= res!119658 call!22752)))

(assert (=> b!244022 (=> (not res!119658) (not e!158359))))

(declare-fun b!244023 () Bool)

(assert (=> b!244023 (and (bvsge (index!6474 lt!122326) #b00000000000000000000000000000000) (bvslt (index!6474 lt!122326) (size!6077 (_keys!6627 thiss!1504))))))

(declare-fun res!119660 () Bool)

(assert (=> b!244023 (= res!119660 (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6474 lt!122326)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244023 (=> (not res!119660) (not e!158359))))

(declare-fun b!244024 () Bool)

(assert (=> b!244024 (= e!158358 ((_ is Undefined!1076) lt!122326))))

(declare-fun d!60083 () Bool)

(assert (=> d!60083 e!158357))

(assert (=> d!60083 (= c!40721 ((_ is MissingZero!1076) lt!122326))))

(assert (=> d!60083 (= lt!122326 (seekEntryOrOpen!0 key!932 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)))))

(declare-fun lt!122327 () Unit!7524)

(declare-fun choose!1137 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 64) Int) Unit!7524)

(assert (=> d!60083 (= lt!122327 (choose!1137 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 (defaultEntry!4516 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60083 (validMask!0 (mask!10611 thiss!1504))))

(assert (=> d!60083 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!370 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 (defaultEntry!4516 thiss!1504)) lt!122327)))

(declare-fun b!244025 () Bool)

(assert (=> b!244025 (= e!158359 (not call!22751))))

(declare-fun b!244026 () Bool)

(declare-fun res!119659 () Bool)

(assert (=> b!244026 (=> (not res!119659) (not e!158356))))

(assert (=> b!244026 (= res!119659 (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6477 lt!122326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244026 (and (bvsge (index!6477 lt!122326) #b00000000000000000000000000000000) (bvslt (index!6477 lt!122326) (size!6077 (_keys!6627 thiss!1504))))))

(assert (= (and d!60083 c!40721) b!244022))

(assert (= (and d!60083 (not c!40721)) b!244020))

(assert (= (and b!244022 res!119658) b!244023))

(assert (= (and b!244023 res!119660) b!244025))

(assert (= (and b!244020 c!40722) b!244021))

(assert (= (and b!244020 (not c!40722)) b!244024))

(assert (= (and b!244021 res!119661) b!244026))

(assert (= (and b!244026 res!119659) b!244019))

(assert (= (or b!244022 b!244021) bm!22749))

(assert (= (or b!244025 b!244019) bm!22748))

(assert (=> bm!22748 m!262077))

(declare-fun m!262175 () Bool)

(assert (=> bm!22749 m!262175))

(assert (=> d!60083 m!262091))

(declare-fun m!262177 () Bool)

(assert (=> d!60083 m!262177))

(declare-fun m!262179 () Bool)

(assert (=> d!60083 m!262179))

(declare-fun m!262181 () Bool)

(assert (=> b!244023 m!262181))

(declare-fun m!262183 () Bool)

(assert (=> b!244026 m!262183))

(assert (=> b!243875 d!60083))

(declare-fun d!60085 () Bool)

(assert (=> d!60085 (= (inRange!0 index!297 (mask!10611 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10611 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!243867 d!60085))

(declare-fun d!60087 () Bool)

(declare-fun e!158364 () Bool)

(assert (=> d!60087 e!158364))

(declare-fun res!119664 () Bool)

(assert (=> d!60087 (=> res!119664 e!158364)))

(declare-fun lt!122338 () Bool)

(assert (=> d!60087 (= res!119664 (not lt!122338))))

(declare-fun lt!122337 () Bool)

(assert (=> d!60087 (= lt!122338 lt!122337)))

(declare-fun lt!122336 () Unit!7524)

(declare-fun e!158365 () Unit!7524)

(assert (=> d!60087 (= lt!122336 e!158365)))

(declare-fun c!40725 () Bool)

(assert (=> d!60087 (= c!40725 lt!122337)))

(declare-fun containsKey!277 (List!3651 (_ BitVec 64)) Bool)

(assert (=> d!60087 (= lt!122337 (containsKey!277 (toList!1856 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504))) key!932))))

(assert (=> d!60087 (= (contains!1756 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)) key!932) lt!122338)))

(declare-fun b!244033 () Bool)

(declare-fun lt!122339 () Unit!7524)

(assert (=> b!244033 (= e!158365 lt!122339)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!225 (List!3651 (_ BitVec 64)) Unit!7524)

(assert (=> b!244033 (= lt!122339 (lemmaContainsKeyImpliesGetValueByKeyDefined!225 (toList!1856 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504))) key!932))))

(declare-datatypes ((Option!291 0))(
  ( (Some!290 (v!5291 V!8171)) (None!289) )
))
(declare-fun isDefined!226 (Option!291) Bool)

(declare-fun getValueByKey!285 (List!3651 (_ BitVec 64)) Option!291)

(assert (=> b!244033 (isDefined!226 (getValueByKey!285 (toList!1856 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504))) key!932))))

(declare-fun b!244034 () Bool)

(declare-fun Unit!7533 () Unit!7524)

(assert (=> b!244034 (= e!158365 Unit!7533)))

(declare-fun b!244035 () Bool)

(assert (=> b!244035 (= e!158364 (isDefined!226 (getValueByKey!285 (toList!1856 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504))) key!932)))))

(assert (= (and d!60087 c!40725) b!244033))

(assert (= (and d!60087 (not c!40725)) b!244034))

(assert (= (and d!60087 (not res!119664)) b!244035))

(declare-fun m!262185 () Bool)

(assert (=> d!60087 m!262185))

(declare-fun m!262187 () Bool)

(assert (=> b!244033 m!262187))

(declare-fun m!262189 () Bool)

(assert (=> b!244033 m!262189))

(assert (=> b!244033 m!262189))

(declare-fun m!262191 () Bool)

(assert (=> b!244033 m!262191))

(assert (=> b!244035 m!262189))

(assert (=> b!244035 m!262189))

(assert (=> b!244035 m!262191))

(assert (=> b!243867 d!60087))

(declare-fun bm!22764 () Bool)

(declare-fun call!22770 () ListLongMap!3681)

(declare-fun call!22771 () ListLongMap!3681)

(assert (=> bm!22764 (= call!22770 call!22771)))

(declare-fun b!244078 () Bool)

(declare-fun e!158400 () Bool)

(declare-fun e!158398 () Bool)

(assert (=> b!244078 (= e!158400 e!158398)))

(declare-fun res!119688 () Bool)

(declare-fun call!22768 () Bool)

(assert (=> b!244078 (= res!119688 call!22768)))

(assert (=> b!244078 (=> (not res!119688) (not e!158398))))

(declare-fun bm!22765 () Bool)

(declare-fun lt!122398 () ListLongMap!3681)

(assert (=> bm!22765 (= call!22768 (contains!1756 lt!122398 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22766 () Bool)

(declare-fun call!22767 () ListLongMap!3681)

(declare-fun call!22773 () ListLongMap!3681)

(assert (=> bm!22766 (= call!22767 call!22773)))

(declare-fun b!244079 () Bool)

(declare-fun e!158393 () ListLongMap!3681)

(assert (=> b!244079 (= e!158393 call!22767)))

(declare-fun b!244080 () Bool)

(declare-fun e!158403 () Unit!7524)

(declare-fun lt!122394 () Unit!7524)

(assert (=> b!244080 (= e!158403 lt!122394)))

(declare-fun lt!122389 () ListLongMap!3681)

(declare-fun getCurrentListMapNoExtraKeys!549 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 32) Int) ListLongMap!3681)

(assert (=> b!244080 (= lt!122389 (getCurrentListMapNoExtraKeys!549 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(declare-fun lt!122396 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122393 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122393 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122399 () Unit!7524)

(declare-fun addStillContains!203 (ListLongMap!3681 (_ BitVec 64) V!8171 (_ BitVec 64)) Unit!7524)

(assert (=> b!244080 (= lt!122399 (addStillContains!203 lt!122389 lt!122396 (zeroValue!4357 thiss!1504) lt!122393))))

(declare-fun +!654 (ListLongMap!3681 tuple2!4768) ListLongMap!3681)

(assert (=> b!244080 (contains!1756 (+!654 lt!122389 (tuple2!4769 lt!122396 (zeroValue!4357 thiss!1504))) lt!122393)))

(declare-fun lt!122391 () Unit!7524)

(assert (=> b!244080 (= lt!122391 lt!122399)))

(declare-fun lt!122395 () ListLongMap!3681)

(assert (=> b!244080 (= lt!122395 (getCurrentListMapNoExtraKeys!549 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(declare-fun lt!122388 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122388 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122392 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122392 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122387 () Unit!7524)

(declare-fun addApplyDifferent!203 (ListLongMap!3681 (_ BitVec 64) V!8171 (_ BitVec 64)) Unit!7524)

(assert (=> b!244080 (= lt!122387 (addApplyDifferent!203 lt!122395 lt!122388 (minValue!4357 thiss!1504) lt!122392))))

(declare-fun apply!227 (ListLongMap!3681 (_ BitVec 64)) V!8171)

(assert (=> b!244080 (= (apply!227 (+!654 lt!122395 (tuple2!4769 lt!122388 (minValue!4357 thiss!1504))) lt!122392) (apply!227 lt!122395 lt!122392))))

(declare-fun lt!122403 () Unit!7524)

(assert (=> b!244080 (= lt!122403 lt!122387)))

(declare-fun lt!122400 () ListLongMap!3681)

(assert (=> b!244080 (= lt!122400 (getCurrentListMapNoExtraKeys!549 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(declare-fun lt!122386 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122397 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122397 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122385 () Unit!7524)

(assert (=> b!244080 (= lt!122385 (addApplyDifferent!203 lt!122400 lt!122386 (zeroValue!4357 thiss!1504) lt!122397))))

(assert (=> b!244080 (= (apply!227 (+!654 lt!122400 (tuple2!4769 lt!122386 (zeroValue!4357 thiss!1504))) lt!122397) (apply!227 lt!122400 lt!122397))))

(declare-fun lt!122384 () Unit!7524)

(assert (=> b!244080 (= lt!122384 lt!122385)))

(declare-fun lt!122390 () ListLongMap!3681)

(assert (=> b!244080 (= lt!122390 (getCurrentListMapNoExtraKeys!549 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(declare-fun lt!122405 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122405 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122404 () (_ BitVec 64))

(assert (=> b!244080 (= lt!122404 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244080 (= lt!122394 (addApplyDifferent!203 lt!122390 lt!122405 (minValue!4357 thiss!1504) lt!122404))))

(assert (=> b!244080 (= (apply!227 (+!654 lt!122390 (tuple2!4769 lt!122405 (minValue!4357 thiss!1504))) lt!122404) (apply!227 lt!122390 lt!122404))))

(declare-fun b!244081 () Bool)

(declare-fun e!158394 () Bool)

(declare-fun e!158395 () Bool)

(assert (=> b!244081 (= e!158394 e!158395)))

(declare-fun res!119686 () Bool)

(declare-fun call!22769 () Bool)

(assert (=> b!244081 (= res!119686 call!22769)))

(assert (=> b!244081 (=> (not res!119686) (not e!158395))))

(declare-fun b!244082 () Bool)

(declare-fun c!40742 () Bool)

(assert (=> b!244082 (= c!40742 (and (not (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!158402 () ListLongMap!3681)

(assert (=> b!244082 (= e!158393 e!158402)))

(declare-fun b!244083 () Bool)

(assert (=> b!244083 (= e!158398 (= (apply!227 lt!122398 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4357 thiss!1504)))))

(declare-fun b!244084 () Bool)

(declare-fun Unit!7534 () Unit!7524)

(assert (=> b!244084 (= e!158403 Unit!7534)))

(declare-fun b!244085 () Bool)

(declare-fun e!158404 () ListLongMap!3681)

(assert (=> b!244085 (= e!158404 e!158393)))

(declare-fun c!40743 () Bool)

(assert (=> b!244085 (= c!40743 (and (not (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22767 () Bool)

(assert (=> bm!22767 (= call!22771 (getCurrentListMapNoExtraKeys!549 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(declare-fun b!244086 () Bool)

(declare-fun e!158396 () Bool)

(assert (=> b!244086 (= e!158396 (validKeyInArray!0 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244087 () Bool)

(assert (=> b!244087 (= e!158404 (+!654 call!22773 (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4357 thiss!1504))))))

(declare-fun b!244088 () Bool)

(declare-fun e!158399 () Bool)

(declare-fun get!2943 (ValueCell!2853 V!8171) V!8171)

(declare-fun dynLambda!570 (Int (_ BitVec 64)) V!8171)

(assert (=> b!244088 (= e!158399 (= (apply!227 lt!122398 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)) (get!2943 (select (arr!5734 (_values!4499 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!570 (defaultEntry!4516 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6076 (_values!4499 thiss!1504))))))

(assert (=> b!244088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))))))

(declare-fun b!244089 () Bool)

(declare-fun res!119685 () Bool)

(declare-fun e!158397 () Bool)

(assert (=> b!244089 (=> (not res!119685) (not e!158397))))

(declare-fun e!158392 () Bool)

(assert (=> b!244089 (= res!119685 e!158392)))

(declare-fun res!119691 () Bool)

(assert (=> b!244089 (=> res!119691 e!158392)))

(assert (=> b!244089 (= res!119691 (not e!158396))))

(declare-fun res!119689 () Bool)

(assert (=> b!244089 (=> (not res!119689) (not e!158396))))

(assert (=> b!244089 (= res!119689 (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))))))

(declare-fun b!244090 () Bool)

(declare-fun e!158401 () Bool)

(assert (=> b!244090 (= e!158401 (validKeyInArray!0 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244091 () Bool)

(assert (=> b!244091 (= e!158392 e!158399)))

(declare-fun res!119687 () Bool)

(assert (=> b!244091 (=> (not res!119687) (not e!158399))))

(assert (=> b!244091 (= res!119687 (contains!1756 lt!122398 (select (arr!5735 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!244091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))))))

(declare-fun b!244092 () Bool)

(assert (=> b!244092 (= e!158395 (= (apply!227 lt!122398 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4357 thiss!1504)))))

(declare-fun b!244093 () Bool)

(declare-fun res!119684 () Bool)

(assert (=> b!244093 (=> (not res!119684) (not e!158397))))

(assert (=> b!244093 (= res!119684 e!158394)))

(declare-fun c!40741 () Bool)

(assert (=> b!244093 (= c!40741 (not (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!60089 () Bool)

(assert (=> d!60089 e!158397))

(declare-fun res!119690 () Bool)

(assert (=> d!60089 (=> (not res!119690) (not e!158397))))

(assert (=> d!60089 (= res!119690 (or (bvsge #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))))))))

(declare-fun lt!122401 () ListLongMap!3681)

(assert (=> d!60089 (= lt!122398 lt!122401)))

(declare-fun lt!122402 () Unit!7524)

(assert (=> d!60089 (= lt!122402 e!158403)))

(declare-fun c!40738 () Bool)

(assert (=> d!60089 (= c!40738 e!158401)))

(declare-fun res!119683 () Bool)

(assert (=> d!60089 (=> (not res!119683) (not e!158401))))

(assert (=> d!60089 (= res!119683 (bvslt #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))))))

(assert (=> d!60089 (= lt!122401 e!158404)))

(declare-fun c!40739 () Bool)

(assert (=> d!60089 (= c!40739 (and (not (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60089 (validMask!0 (mask!10611 thiss!1504))))

(assert (=> d!60089 (= (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)) lt!122398)))

(declare-fun b!244094 () Bool)

(assert (=> b!244094 (= e!158400 (not call!22768))))

(declare-fun b!244095 () Bool)

(declare-fun call!22772 () ListLongMap!3681)

(assert (=> b!244095 (= e!158402 call!22772)))

(declare-fun b!244096 () Bool)

(assert (=> b!244096 (= e!158394 (not call!22769))))

(declare-fun bm!22768 () Bool)

(assert (=> bm!22768 (= call!22769 (contains!1756 lt!122398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22769 () Bool)

(assert (=> bm!22769 (= call!22773 (+!654 (ite c!40739 call!22771 (ite c!40743 call!22770 call!22772)) (ite (or c!40739 c!40743) (tuple2!4769 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4357 thiss!1504)) (tuple2!4769 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4357 thiss!1504)))))))

(declare-fun b!244097 () Bool)

(assert (=> b!244097 (= e!158397 e!158400)))

(declare-fun c!40740 () Bool)

(assert (=> b!244097 (= c!40740 (not (= (bvand (extraKeys!4253 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244098 () Bool)

(assert (=> b!244098 (= e!158402 call!22767)))

(declare-fun bm!22770 () Bool)

(assert (=> bm!22770 (= call!22772 call!22770)))

(assert (= (and d!60089 c!40739) b!244087))

(assert (= (and d!60089 (not c!40739)) b!244085))

(assert (= (and b!244085 c!40743) b!244079))

(assert (= (and b!244085 (not c!40743)) b!244082))

(assert (= (and b!244082 c!40742) b!244098))

(assert (= (and b!244082 (not c!40742)) b!244095))

(assert (= (or b!244098 b!244095) bm!22770))

(assert (= (or b!244079 bm!22770) bm!22764))

(assert (= (or b!244079 b!244098) bm!22766))

(assert (= (or b!244087 bm!22764) bm!22767))

(assert (= (or b!244087 bm!22766) bm!22769))

(assert (= (and d!60089 res!119683) b!244090))

(assert (= (and d!60089 c!40738) b!244080))

(assert (= (and d!60089 (not c!40738)) b!244084))

(assert (= (and d!60089 res!119690) b!244089))

(assert (= (and b!244089 res!119689) b!244086))

(assert (= (and b!244089 (not res!119691)) b!244091))

(assert (= (and b!244091 res!119687) b!244088))

(assert (= (and b!244089 res!119685) b!244093))

(assert (= (and b!244093 c!40741) b!244081))

(assert (= (and b!244093 (not c!40741)) b!244096))

(assert (= (and b!244081 res!119686) b!244092))

(assert (= (or b!244081 b!244096) bm!22768))

(assert (= (and b!244093 res!119684) b!244097))

(assert (= (and b!244097 c!40740) b!244078))

(assert (= (and b!244097 (not c!40740)) b!244094))

(assert (= (and b!244078 res!119688) b!244083))

(assert (= (or b!244078 b!244094) bm!22765))

(declare-fun b_lambda!8011 () Bool)

(assert (=> (not b_lambda!8011) (not b!244088)))

(declare-fun t!8662 () Bool)

(declare-fun tb!2967 () Bool)

(assert (=> (and b!243862 (= (defaultEntry!4516 thiss!1504) (defaultEntry!4516 thiss!1504)) t!8662) tb!2967))

(declare-fun result!5223 () Bool)

(assert (=> tb!2967 (= result!5223 tp_is_empty!6393)))

(assert (=> b!244088 t!8662))

(declare-fun b_and!13517 () Bool)

(assert (= b_and!13513 (and (=> t!8662 result!5223) b_and!13517)))

(declare-fun m!262193 () Bool)

(assert (=> bm!22768 m!262193))

(assert (=> b!244086 m!262165))

(assert (=> b!244086 m!262165))

(assert (=> b!244086 m!262169))

(declare-fun m!262195 () Bool)

(assert (=> b!244080 m!262195))

(declare-fun m!262197 () Bool)

(assert (=> b!244080 m!262197))

(declare-fun m!262199 () Bool)

(assert (=> b!244080 m!262199))

(declare-fun m!262201 () Bool)

(assert (=> b!244080 m!262201))

(declare-fun m!262203 () Bool)

(assert (=> b!244080 m!262203))

(declare-fun m!262205 () Bool)

(assert (=> b!244080 m!262205))

(assert (=> b!244080 m!262195))

(declare-fun m!262207 () Bool)

(assert (=> b!244080 m!262207))

(declare-fun m!262209 () Bool)

(assert (=> b!244080 m!262209))

(declare-fun m!262211 () Bool)

(assert (=> b!244080 m!262211))

(declare-fun m!262213 () Bool)

(assert (=> b!244080 m!262213))

(declare-fun m!262215 () Bool)

(assert (=> b!244080 m!262215))

(declare-fun m!262217 () Bool)

(assert (=> b!244080 m!262217))

(assert (=> b!244080 m!262165))

(declare-fun m!262219 () Bool)

(assert (=> b!244080 m!262219))

(declare-fun m!262221 () Bool)

(assert (=> b!244080 m!262221))

(assert (=> b!244080 m!262207))

(declare-fun m!262223 () Bool)

(assert (=> b!244080 m!262223))

(assert (=> b!244080 m!262211))

(assert (=> b!244080 m!262201))

(declare-fun m!262225 () Bool)

(assert (=> b!244080 m!262225))

(assert (=> d!60089 m!262179))

(assert (=> bm!22767 m!262209))

(assert (=> b!244091 m!262165))

(assert (=> b!244091 m!262165))

(declare-fun m!262227 () Bool)

(assert (=> b!244091 m!262227))

(declare-fun m!262229 () Bool)

(assert (=> b!244087 m!262229))

(declare-fun m!262231 () Bool)

(assert (=> b!244092 m!262231))

(assert (=> b!244090 m!262165))

(assert (=> b!244090 m!262165))

(assert (=> b!244090 m!262169))

(declare-fun m!262233 () Bool)

(assert (=> b!244083 m!262233))

(declare-fun m!262235 () Bool)

(assert (=> bm!22769 m!262235))

(declare-fun m!262237 () Bool)

(assert (=> bm!22765 m!262237))

(declare-fun m!262239 () Bool)

(assert (=> b!244088 m!262239))

(assert (=> b!244088 m!262165))

(assert (=> b!244088 m!262165))

(declare-fun m!262241 () Bool)

(assert (=> b!244088 m!262241))

(declare-fun m!262243 () Bool)

(assert (=> b!244088 m!262243))

(assert (=> b!244088 m!262239))

(assert (=> b!244088 m!262243))

(declare-fun m!262245 () Bool)

(assert (=> b!244088 m!262245))

(assert (=> b!243867 d!60089))

(declare-fun d!60091 () Bool)

(assert (=> d!60091 (= (array_inv!3791 (_keys!6627 thiss!1504)) (bvsge (size!6077 (_keys!6627 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243862 d!60091))

(declare-fun d!60093 () Bool)

(assert (=> d!60093 (= (array_inv!3792 (_values!4499 thiss!1504)) (bvsge (size!6076 (_values!4499 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243862 d!60093))

(declare-fun d!60095 () Bool)

(declare-fun e!158407 () Bool)

(assert (=> d!60095 e!158407))

(declare-fun res!119696 () Bool)

(assert (=> d!60095 (=> (not res!119696) (not e!158407))))

(declare-fun lt!122411 () SeekEntryResult!1076)

(assert (=> d!60095 (= res!119696 ((_ is Found!1076) lt!122411))))

(assert (=> d!60095 (= lt!122411 (seekEntryOrOpen!0 key!932 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)))))

(declare-fun lt!122410 () Unit!7524)

(declare-fun choose!1138 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 64) Int) Unit!7524)

(assert (=> d!60095 (= lt!122410 (choose!1138 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 (defaultEntry!4516 thiss!1504)))))

(assert (=> d!60095 (validMask!0 (mask!10611 thiss!1504))))

(assert (=> d!60095 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!363 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 (defaultEntry!4516 thiss!1504)) lt!122410)))

(declare-fun b!244105 () Bool)

(declare-fun res!119697 () Bool)

(assert (=> b!244105 (=> (not res!119697) (not e!158407))))

(assert (=> b!244105 (= res!119697 (inRange!0 (index!6475 lt!122411) (mask!10611 thiss!1504)))))

(declare-fun b!244106 () Bool)

(assert (=> b!244106 (= e!158407 (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6475 lt!122411)) key!932))))

(assert (=> b!244106 (and (bvsge (index!6475 lt!122411) #b00000000000000000000000000000000) (bvslt (index!6475 lt!122411) (size!6077 (_keys!6627 thiss!1504))))))

(assert (= (and d!60095 res!119696) b!244105))

(assert (= (and b!244105 res!119697) b!244106))

(assert (=> d!60095 m!262091))

(declare-fun m!262247 () Bool)

(assert (=> d!60095 m!262247))

(assert (=> d!60095 m!262179))

(declare-fun m!262249 () Bool)

(assert (=> b!244105 m!262249))

(declare-fun m!262251 () Bool)

(assert (=> b!244106 m!262251))

(assert (=> b!243870 d!60095))

(declare-fun b!244119 () Bool)

(declare-fun e!158416 () SeekEntryResult!1076)

(declare-fun e!158415 () SeekEntryResult!1076)

(assert (=> b!244119 (= e!158416 e!158415)))

(declare-fun lt!122419 () (_ BitVec 64))

(declare-fun lt!122420 () SeekEntryResult!1076)

(assert (=> b!244119 (= lt!122419 (select (arr!5735 (_keys!6627 thiss!1504)) (index!6476 lt!122420)))))

(declare-fun c!40751 () Bool)

(assert (=> b!244119 (= c!40751 (= lt!122419 key!932))))

(declare-fun e!158414 () SeekEntryResult!1076)

(declare-fun b!244120 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12079 (_ BitVec 32)) SeekEntryResult!1076)

(assert (=> b!244120 (= e!158414 (seekKeyOrZeroReturnVacant!0 (x!24344 lt!122420) (index!6476 lt!122420) (index!6476 lt!122420) key!932 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)))))

(declare-fun b!244121 () Bool)

(assert (=> b!244121 (= e!158416 Undefined!1076)))

(declare-fun b!244122 () Bool)

(assert (=> b!244122 (= e!158415 (Found!1076 (index!6476 lt!122420)))))

(declare-fun b!244123 () Bool)

(assert (=> b!244123 (= e!158414 (MissingZero!1076 (index!6476 lt!122420)))))

(declare-fun d!60097 () Bool)

(declare-fun lt!122418 () SeekEntryResult!1076)

(assert (=> d!60097 (and (or ((_ is Undefined!1076) lt!122418) (not ((_ is Found!1076) lt!122418)) (and (bvsge (index!6475 lt!122418) #b00000000000000000000000000000000) (bvslt (index!6475 lt!122418) (size!6077 (_keys!6627 thiss!1504))))) (or ((_ is Undefined!1076) lt!122418) ((_ is Found!1076) lt!122418) (not ((_ is MissingZero!1076) lt!122418)) (and (bvsge (index!6474 lt!122418) #b00000000000000000000000000000000) (bvslt (index!6474 lt!122418) (size!6077 (_keys!6627 thiss!1504))))) (or ((_ is Undefined!1076) lt!122418) ((_ is Found!1076) lt!122418) ((_ is MissingZero!1076) lt!122418) (not ((_ is MissingVacant!1076) lt!122418)) (and (bvsge (index!6477 lt!122418) #b00000000000000000000000000000000) (bvslt (index!6477 lt!122418) (size!6077 (_keys!6627 thiss!1504))))) (or ((_ is Undefined!1076) lt!122418) (ite ((_ is Found!1076) lt!122418) (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6475 lt!122418)) key!932) (ite ((_ is MissingZero!1076) lt!122418) (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6474 lt!122418)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1076) lt!122418) (= (select (arr!5735 (_keys!6627 thiss!1504)) (index!6477 lt!122418)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60097 (= lt!122418 e!158416)))

(declare-fun c!40752 () Bool)

(assert (=> d!60097 (= c!40752 (and ((_ is Intermediate!1076) lt!122420) (undefined!1888 lt!122420)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12079 (_ BitVec 32)) SeekEntryResult!1076)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60097 (= lt!122420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10611 thiss!1504)) key!932 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)))))

(assert (=> d!60097 (validMask!0 (mask!10611 thiss!1504))))

(assert (=> d!60097 (= (seekEntryOrOpen!0 key!932 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)) lt!122418)))

(declare-fun b!244124 () Bool)

(declare-fun c!40750 () Bool)

(assert (=> b!244124 (= c!40750 (= lt!122419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244124 (= e!158415 e!158414)))

(assert (= (and d!60097 c!40752) b!244121))

(assert (= (and d!60097 (not c!40752)) b!244119))

(assert (= (and b!244119 c!40751) b!244122))

(assert (= (and b!244119 (not c!40751)) b!244124))

(assert (= (and b!244124 c!40750) b!244123))

(assert (= (and b!244124 (not c!40750)) b!244120))

(declare-fun m!262253 () Bool)

(assert (=> b!244119 m!262253))

(declare-fun m!262255 () Bool)

(assert (=> b!244120 m!262255))

(declare-fun m!262257 () Bool)

(assert (=> d!60097 m!262257))

(declare-fun m!262259 () Bool)

(assert (=> d!60097 m!262259))

(declare-fun m!262261 () Bool)

(assert (=> d!60097 m!262261))

(declare-fun m!262263 () Bool)

(assert (=> d!60097 m!262263))

(assert (=> d!60097 m!262259))

(assert (=> d!60097 m!262179))

(declare-fun m!262265 () Bool)

(assert (=> d!60097 m!262265))

(assert (=> b!243861 d!60097))

(declare-fun d!60099 () Bool)

(declare-fun lt!122421 () Bool)

(assert (=> d!60099 (= lt!122421 (select (content!161 Nil!3647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158418 () Bool)

(assert (=> d!60099 (= lt!122421 e!158418)))

(declare-fun res!119699 () Bool)

(assert (=> d!60099 (=> (not res!119699) (not e!158418))))

(assert (=> d!60099 (= res!119699 ((_ is Cons!3646) Nil!3647))))

(assert (=> d!60099 (= (contains!1757 Nil!3647 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122421)))

(declare-fun b!244125 () Bool)

(declare-fun e!158417 () Bool)

(assert (=> b!244125 (= e!158418 e!158417)))

(declare-fun res!119698 () Bool)

(assert (=> b!244125 (=> res!119698 e!158417)))

(assert (=> b!244125 (= res!119698 (= (h!4303 Nil!3647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244126 () Bool)

(assert (=> b!244126 (= e!158417 (contains!1757 (t!8657 Nil!3647) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60099 res!119699) b!244125))

(assert (= (and b!244125 (not res!119698)) b!244126))

(assert (=> d!60099 m!262151))

(declare-fun m!262267 () Bool)

(assert (=> d!60099 m!262267))

(declare-fun m!262269 () Bool)

(assert (=> b!244126 m!262269))

(assert (=> b!243878 d!60099))

(declare-fun d!60101 () Bool)

(assert (=> d!60101 (contains!1756 (getCurrentListMap!1384 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)) key!932)))

(declare-fun lt!122424 () Unit!7524)

(declare-fun choose!1139 (array!12079 array!12077 (_ BitVec 32) (_ BitVec 32) V!8171 V!8171 (_ BitVec 64) (_ BitVec 32) Int) Unit!7524)

(assert (=> d!60101 (= lt!122424 (choose!1139 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)))))

(assert (=> d!60101 (validMask!0 (mask!10611 thiss!1504))))

(assert (=> d!60101 (= (lemmaArrayContainsKeyThenInListMap!167 (_keys!6627 thiss!1504) (_values!4499 thiss!1504) (mask!10611 thiss!1504) (extraKeys!4253 thiss!1504) (zeroValue!4357 thiss!1504) (minValue!4357 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4516 thiss!1504)) lt!122424)))

(declare-fun bs!8876 () Bool)

(assert (= bs!8876 d!60101))

(assert (=> bs!8876 m!262097))

(assert (=> bs!8876 m!262097))

(assert (=> bs!8876 m!262099))

(declare-fun m!262271 () Bool)

(assert (=> bs!8876 m!262271))

(assert (=> bs!8876 m!262179))

(assert (=> b!243854 d!60101))

(declare-fun d!60103 () Bool)

(declare-fun res!119706 () Bool)

(declare-fun e!158421 () Bool)

(assert (=> d!60103 (=> (not res!119706) (not e!158421))))

(declare-fun simpleValid!250 (LongMapFixedSize!3606) Bool)

(assert (=> d!60103 (= res!119706 (simpleValid!250 thiss!1504))))

(assert (=> d!60103 (= (valid!1412 thiss!1504) e!158421)))

(declare-fun b!244133 () Bool)

(declare-fun res!119707 () Bool)

(assert (=> b!244133 (=> (not res!119707) (not e!158421))))

(declare-fun arrayCountValidKeys!0 (array!12079 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!244133 (= res!119707 (= (arrayCountValidKeys!0 (_keys!6627 thiss!1504) #b00000000000000000000000000000000 (size!6077 (_keys!6627 thiss!1504))) (_size!1852 thiss!1504)))))

(declare-fun b!244134 () Bool)

(declare-fun res!119708 () Bool)

(assert (=> b!244134 (=> (not res!119708) (not e!158421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12079 (_ BitVec 32)) Bool)

(assert (=> b!244134 (= res!119708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6627 thiss!1504) (mask!10611 thiss!1504)))))

(declare-fun b!244135 () Bool)

(assert (=> b!244135 (= e!158421 (arrayNoDuplicates!0 (_keys!6627 thiss!1504) #b00000000000000000000000000000000 Nil!3647))))

(assert (= (and d!60103 res!119706) b!244133))

(assert (= (and b!244133 res!119707) b!244134))

(assert (= (and b!244134 res!119708) b!244135))

(declare-fun m!262273 () Bool)

(assert (=> d!60103 m!262273))

(declare-fun m!262275 () Bool)

(assert (=> b!244133 m!262275))

(declare-fun m!262277 () Bool)

(assert (=> b!244134 m!262277))

(assert (=> b!244135 m!262103))

(assert (=> start!23220 d!60103))

(declare-fun b!244143 () Bool)

(declare-fun e!158427 () Bool)

(assert (=> b!244143 (= e!158427 tp_is_empty!6393)))

(declare-fun condMapEmpty!10846 () Bool)

(declare-fun mapDefault!10846 () ValueCell!2853)

(assert (=> mapNonEmpty!10840 (= condMapEmpty!10846 (= mapRest!10840 ((as const (Array (_ BitVec 32) ValueCell!2853)) mapDefault!10846)))))

(declare-fun mapRes!10846 () Bool)

(assert (=> mapNonEmpty!10840 (= tp!22816 (and e!158427 mapRes!10846))))

(declare-fun b!244142 () Bool)

(declare-fun e!158426 () Bool)

(assert (=> b!244142 (= e!158426 tp_is_empty!6393)))

(declare-fun mapIsEmpty!10846 () Bool)

(assert (=> mapIsEmpty!10846 mapRes!10846))

(declare-fun mapNonEmpty!10846 () Bool)

(declare-fun tp!22825 () Bool)

(assert (=> mapNonEmpty!10846 (= mapRes!10846 (and tp!22825 e!158426))))

(declare-fun mapRest!10846 () (Array (_ BitVec 32) ValueCell!2853))

(declare-fun mapValue!10846 () ValueCell!2853)

(declare-fun mapKey!10846 () (_ BitVec 32))

(assert (=> mapNonEmpty!10846 (= mapRest!10840 (store mapRest!10846 mapKey!10846 mapValue!10846))))

(assert (= (and mapNonEmpty!10840 condMapEmpty!10846) mapIsEmpty!10846))

(assert (= (and mapNonEmpty!10840 (not condMapEmpty!10846)) mapNonEmpty!10846))

(assert (= (and mapNonEmpty!10846 ((_ is ValueCellFull!2853) mapValue!10846)) b!244142))

(assert (= (and mapNonEmpty!10840 ((_ is ValueCellFull!2853) mapDefault!10846)) b!244143))

(declare-fun m!262279 () Bool)

(assert (=> mapNonEmpty!10846 m!262279))

(declare-fun b_lambda!8013 () Bool)

(assert (= b_lambda!8011 (or (and b!243862 b_free!6531) b_lambda!8013)))

(check-sat (not bm!22748) (not bm!22767) (not mapNonEmpty!10846) (not d!60103) (not b!244035) (not b!244000) (not b!244091) (not b!243973) (not b!244088) (not b!243998) (not d!60087) (not d!60075) (not b!244083) (not b!243979) b_and!13517 (not bm!22768) (not b!243981) (not d!60099) (not d!60083) (not b!244134) tp_is_empty!6393 (not b!244080) (not b!244092) (not b!244126) (not bm!22749) (not bm!22769) (not b!244090) (not b!244135) (not d!60095) (not b!243978) (not b_next!6531) (not b!244120) (not d!60097) (not b!244105) (not bm!22765) (not b!244087) (not b!244033) (not b!244002) (not b!244133) (not b!243987) (not bm!22743) (not b_lambda!8013) (not d!60071) (not d!60101) (not b!244086) (not d!60089))
(check-sat b_and!13517 (not b_next!6531))
