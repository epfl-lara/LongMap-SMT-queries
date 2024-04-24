; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21762 () Bool)

(assert start!21762)

(declare-fun b!218970 () Bool)

(declare-fun b_free!5887 () Bool)

(declare-fun b_next!5887 () Bool)

(assert (=> b!218970 (= b_free!5887 (not b_next!5887))))

(declare-fun tp!20799 () Bool)

(declare-fun b_and!12793 () Bool)

(assert (=> b!218970 (= tp!20799 b_and!12793)))

(declare-fun tp_is_empty!5749 () Bool)

(declare-datatypes ((V!7313 0))(
  ( (V!7314 (val!2919 Int)) )
))
(declare-datatypes ((ValueCell!2531 0))(
  ( (ValueCellFull!2531 (v!4939 V!7313)) (EmptyCell!2531) )
))
(declare-datatypes ((array!10737 0))(
  ( (array!10738 (arr!5089 (Array (_ BitVec 32) ValueCell!2531)) (size!5421 (_ BitVec 32))) )
))
(declare-datatypes ((array!10739 0))(
  ( (array!10740 (arr!5090 (Array (_ BitVec 32) (_ BitVec 64))) (size!5422 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2962 0))(
  ( (LongMapFixedSize!2963 (defaultEntry!4134 Int) (mask!9917 (_ BitVec 32)) (extraKeys!3871 (_ BitVec 32)) (zeroValue!3975 V!7313) (minValue!3975 V!7313) (_size!1530 (_ BitVec 32)) (_keys!6184 array!10739) (_values!4117 array!10737) (_vacant!1530 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2962)

(declare-fun e!142449 () Bool)

(declare-fun e!142450 () Bool)

(declare-fun array_inv!3347 (array!10739) Bool)

(declare-fun array_inv!3348 (array!10737) Bool)

(assert (=> b!218970 (= e!142449 (and tp!20799 tp_is_empty!5749 (array_inv!3347 (_keys!6184 thiss!1504)) (array_inv!3348 (_values!4117 thiss!1504)) e!142450))))

(declare-fun b!218971 () Bool)

(declare-fun res!107334 () Bool)

(declare-fun e!142443 () Bool)

(assert (=> b!218971 (=> (not res!107334) (not e!142443))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218971 (= res!107334 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218972 () Bool)

(declare-fun res!107333 () Bool)

(declare-datatypes ((SeekEntryResult!771 0))(
  ( (MissingZero!771 (index!5254 (_ BitVec 32))) (Found!771 (index!5255 (_ BitVec 32))) (Intermediate!771 (undefined!1583 Bool) (index!5256 (_ BitVec 32)) (x!22853 (_ BitVec 32))) (Undefined!771) (MissingVacant!771 (index!5257 (_ BitVec 32))) )
))
(declare-fun lt!111764 () SeekEntryResult!771)

(assert (=> b!218972 (= res!107333 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5257 lt!111764)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142445 () Bool)

(assert (=> b!218972 (=> (not res!107333) (not e!142445))))

(declare-fun b!218973 () Bool)

(declare-fun res!107335 () Bool)

(declare-fun e!142448 () Bool)

(assert (=> b!218973 (=> (not res!107335) (not e!142448))))

(assert (=> b!218973 (= res!107335 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5254 lt!111764)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20435 () Bool)

(declare-fun call!20439 () Bool)

(declare-fun arrayContainsKey!0 (array!10739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20435 (= call!20439 (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218974 () Bool)

(declare-fun e!142453 () Bool)

(assert (=> b!218974 (= e!142453 (and (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))) (bvsge (size!5422 (_keys!6184 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-fun b!218975 () Bool)

(declare-fun res!107336 () Bool)

(assert (=> b!218975 (=> (not res!107336) (not e!142448))))

(declare-fun call!20438 () Bool)

(assert (=> b!218975 (= res!107336 call!20438)))

(declare-fun e!142451 () Bool)

(assert (=> b!218975 (= e!142451 e!142448)))

(declare-fun b!218977 () Bool)

(declare-fun e!142447 () Bool)

(assert (=> b!218977 (= e!142443 e!142447)))

(declare-fun res!107338 () Bool)

(assert (=> b!218977 (=> (not res!107338) (not e!142447))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218977 (= res!107338 (or (= lt!111764 (MissingZero!771 index!297)) (= lt!111764 (MissingVacant!771 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10739 (_ BitVec 32)) SeekEntryResult!771)

(assert (=> b!218977 (= lt!111764 (seekEntryOrOpen!0 key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun c!36439 () Bool)

(declare-fun bm!20436 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20436 (= call!20438 (inRange!0 (ite c!36439 (index!5254 lt!111764) (index!5257 lt!111764)) (mask!9917 thiss!1504)))))

(declare-fun b!218978 () Bool)

(declare-fun e!142444 () Bool)

(get-info :version)

(assert (=> b!218978 (= e!142444 ((_ is Undefined!771) lt!111764))))

(declare-fun b!218979 () Bool)

(declare-fun e!142442 () Bool)

(assert (=> b!218979 (= e!142442 tp_is_empty!5749)))

(declare-fun mapIsEmpty!9789 () Bool)

(declare-fun mapRes!9789 () Bool)

(assert (=> mapIsEmpty!9789 mapRes!9789))

(declare-fun b!218980 () Bool)

(declare-datatypes ((Unit!6511 0))(
  ( (Unit!6512) )
))
(declare-fun e!142452 () Unit!6511)

(declare-fun Unit!6513 () Unit!6511)

(assert (=> b!218980 (= e!142452 Unit!6513)))

(declare-fun lt!111766 () Unit!6511)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!189 (array!10739 array!10737 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6511)

(assert (=> b!218980 (= lt!111766 (lemmaInListMapThenSeekEntryOrOpenFindsIt!189 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> b!218980 false))

(declare-fun b!218981 () Bool)

(declare-fun e!142446 () Bool)

(assert (=> b!218981 (= e!142446 tp_is_empty!5749)))

(declare-fun b!218982 () Bool)

(declare-fun c!36441 () Bool)

(assert (=> b!218982 (= c!36441 ((_ is MissingVacant!771) lt!111764))))

(assert (=> b!218982 (= e!142451 e!142444)))

(declare-fun b!218983 () Bool)

(declare-fun lt!111765 () Unit!6511)

(assert (=> b!218983 (= e!142452 lt!111765)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!187 (array!10739 array!10737 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6511)

(assert (=> b!218983 (= lt!111765 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!187 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> b!218983 (= c!36439 ((_ is MissingZero!771) lt!111764))))

(assert (=> b!218983 e!142451))

(declare-fun mapNonEmpty!9789 () Bool)

(declare-fun tp!20798 () Bool)

(assert (=> mapNonEmpty!9789 (= mapRes!9789 (and tp!20798 e!142442))))

(declare-fun mapRest!9789 () (Array (_ BitVec 32) ValueCell!2531))

(declare-fun mapValue!9789 () ValueCell!2531)

(declare-fun mapKey!9789 () (_ BitVec 32))

(assert (=> mapNonEmpty!9789 (= (arr!5089 (_values!4117 thiss!1504)) (store mapRest!9789 mapKey!9789 mapValue!9789))))

(declare-fun b!218984 () Bool)

(assert (=> b!218984 (= e!142448 (not call!20439))))

(declare-fun b!218985 () Bool)

(assert (=> b!218985 (= e!142447 e!142453)))

(declare-fun res!107339 () Bool)

(assert (=> b!218985 (=> (not res!107339) (not e!142453))))

(assert (=> b!218985 (= res!107339 (inRange!0 index!297 (mask!9917 thiss!1504)))))

(declare-fun lt!111767 () Unit!6511)

(assert (=> b!218985 (= lt!111767 e!142452)))

(declare-fun c!36440 () Bool)

(declare-datatypes ((tuple2!4258 0))(
  ( (tuple2!4259 (_1!2140 (_ BitVec 64)) (_2!2140 V!7313)) )
))
(declare-datatypes ((List!3154 0))(
  ( (Nil!3151) (Cons!3150 (h!3797 tuple2!4258) (t!8103 List!3154)) )
))
(declare-datatypes ((ListLongMap!3173 0))(
  ( (ListLongMap!3174 (toList!1602 List!3154)) )
))
(declare-fun contains!1457 (ListLongMap!3173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1134 (array!10739 array!10737 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 32) Int) ListLongMap!3173)

(assert (=> b!218985 (= c!36440 (contains!1457 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) key!932))))

(declare-fun b!218986 () Bool)

(assert (=> b!218986 (= e!142450 (and e!142446 mapRes!9789))))

(declare-fun condMapEmpty!9789 () Bool)

(declare-fun mapDefault!9789 () ValueCell!2531)

(assert (=> b!218986 (= condMapEmpty!9789 (= (arr!5089 (_values!4117 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2531)) mapDefault!9789)))))

(declare-fun b!218987 () Bool)

(assert (=> b!218987 (= e!142444 e!142445)))

(declare-fun res!107340 () Bool)

(assert (=> b!218987 (= res!107340 call!20438)))

(assert (=> b!218987 (=> (not res!107340) (not e!142445))))

(declare-fun b!218976 () Bool)

(assert (=> b!218976 (= e!142445 (not call!20439))))

(declare-fun res!107337 () Bool)

(assert (=> start!21762 (=> (not res!107337) (not e!142443))))

(declare-fun valid!1211 (LongMapFixedSize!2962) Bool)

(assert (=> start!21762 (= res!107337 (valid!1211 thiss!1504))))

(assert (=> start!21762 e!142443))

(assert (=> start!21762 e!142449))

(assert (=> start!21762 true))

(assert (= (and start!21762 res!107337) b!218971))

(assert (= (and b!218971 res!107334) b!218977))

(assert (= (and b!218977 res!107338) b!218985))

(assert (= (and b!218985 c!36440) b!218980))

(assert (= (and b!218985 (not c!36440)) b!218983))

(assert (= (and b!218983 c!36439) b!218975))

(assert (= (and b!218983 (not c!36439)) b!218982))

(assert (= (and b!218975 res!107336) b!218973))

(assert (= (and b!218973 res!107335) b!218984))

(assert (= (and b!218982 c!36441) b!218987))

(assert (= (and b!218982 (not c!36441)) b!218978))

(assert (= (and b!218987 res!107340) b!218972))

(assert (= (and b!218972 res!107333) b!218976))

(assert (= (or b!218975 b!218987) bm!20436))

(assert (= (or b!218984 b!218976) bm!20435))

(assert (= (and b!218985 res!107339) b!218974))

(assert (= (and b!218986 condMapEmpty!9789) mapIsEmpty!9789))

(assert (= (and b!218986 (not condMapEmpty!9789)) mapNonEmpty!9789))

(assert (= (and mapNonEmpty!9789 ((_ is ValueCellFull!2531) mapValue!9789)) b!218979))

(assert (= (and b!218986 ((_ is ValueCellFull!2531) mapDefault!9789)) b!218981))

(assert (= b!218970 b!218986))

(assert (= start!21762 b!218970))

(declare-fun m!244821 () Bool)

(assert (=> b!218983 m!244821))

(declare-fun m!244823 () Bool)

(assert (=> b!218980 m!244823))

(declare-fun m!244825 () Bool)

(assert (=> bm!20435 m!244825))

(declare-fun m!244827 () Bool)

(assert (=> b!218970 m!244827))

(declare-fun m!244829 () Bool)

(assert (=> b!218970 m!244829))

(declare-fun m!244831 () Bool)

(assert (=> b!218985 m!244831))

(declare-fun m!244833 () Bool)

(assert (=> b!218985 m!244833))

(assert (=> b!218985 m!244833))

(declare-fun m!244835 () Bool)

(assert (=> b!218985 m!244835))

(declare-fun m!244837 () Bool)

(assert (=> bm!20436 m!244837))

(declare-fun m!244839 () Bool)

(assert (=> mapNonEmpty!9789 m!244839))

(declare-fun m!244841 () Bool)

(assert (=> b!218972 m!244841))

(declare-fun m!244843 () Bool)

(assert (=> b!218973 m!244843))

(declare-fun m!244845 () Bool)

(assert (=> b!218977 m!244845))

(declare-fun m!244847 () Bool)

(assert (=> start!21762 m!244847))

(check-sat b_and!12793 (not mapNonEmpty!9789) (not b!218980) (not start!21762) (not bm!20436) (not b_next!5887) (not bm!20435) (not b!218977) (not b!218985) tp_is_empty!5749 (not b!218970) (not b!218983))
(check-sat b_and!12793 (not b_next!5887))
(get-model)

(declare-fun b!219108 () Bool)

(declare-fun e!142538 () SeekEntryResult!771)

(declare-fun e!142540 () SeekEntryResult!771)

(assert (=> b!219108 (= e!142538 e!142540)))

(declare-fun lt!111800 () (_ BitVec 64))

(declare-fun lt!111799 () SeekEntryResult!771)

(assert (=> b!219108 (= lt!111800 (select (arr!5090 (_keys!6184 thiss!1504)) (index!5256 lt!111799)))))

(declare-fun c!36466 () Bool)

(assert (=> b!219108 (= c!36466 (= lt!111800 key!932))))

(declare-fun d!58697 () Bool)

(declare-fun lt!111798 () SeekEntryResult!771)

(assert (=> d!58697 (and (or ((_ is Undefined!771) lt!111798) (not ((_ is Found!771) lt!111798)) (and (bvsge (index!5255 lt!111798) #b00000000000000000000000000000000) (bvslt (index!5255 lt!111798) (size!5422 (_keys!6184 thiss!1504))))) (or ((_ is Undefined!771) lt!111798) ((_ is Found!771) lt!111798) (not ((_ is MissingZero!771) lt!111798)) (and (bvsge (index!5254 lt!111798) #b00000000000000000000000000000000) (bvslt (index!5254 lt!111798) (size!5422 (_keys!6184 thiss!1504))))) (or ((_ is Undefined!771) lt!111798) ((_ is Found!771) lt!111798) ((_ is MissingZero!771) lt!111798) (not ((_ is MissingVacant!771) lt!111798)) (and (bvsge (index!5257 lt!111798) #b00000000000000000000000000000000) (bvslt (index!5257 lt!111798) (size!5422 (_keys!6184 thiss!1504))))) (or ((_ is Undefined!771) lt!111798) (ite ((_ is Found!771) lt!111798) (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5255 lt!111798)) key!932) (ite ((_ is MissingZero!771) lt!111798) (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5254 lt!111798)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!771) lt!111798) (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5257 lt!111798)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58697 (= lt!111798 e!142538)))

(declare-fun c!36468 () Bool)

(assert (=> d!58697 (= c!36468 (and ((_ is Intermediate!771) lt!111799) (undefined!1583 lt!111799)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10739 (_ BitVec 32)) SeekEntryResult!771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58697 (= lt!111799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9917 thiss!1504)) key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!58697 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58697 (= (seekEntryOrOpen!0 key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)) lt!111798)))

(declare-fun b!219109 () Bool)

(assert (=> b!219109 (= e!142540 (Found!771 (index!5256 lt!111799)))))

(declare-fun b!219110 () Bool)

(declare-fun e!142539 () SeekEntryResult!771)

(assert (=> b!219110 (= e!142539 (MissingZero!771 (index!5256 lt!111799)))))

(declare-fun b!219111 () Bool)

(assert (=> b!219111 (= e!142538 Undefined!771)))

(declare-fun b!219112 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10739 (_ BitVec 32)) SeekEntryResult!771)

(assert (=> b!219112 (= e!142539 (seekKeyOrZeroReturnVacant!0 (x!22853 lt!111799) (index!5256 lt!111799) (index!5256 lt!111799) key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun b!219113 () Bool)

(declare-fun c!36467 () Bool)

(assert (=> b!219113 (= c!36467 (= lt!111800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219113 (= e!142540 e!142539)))

(assert (= (and d!58697 c!36468) b!219111))

(assert (= (and d!58697 (not c!36468)) b!219108))

(assert (= (and b!219108 c!36466) b!219109))

(assert (= (and b!219108 (not c!36466)) b!219113))

(assert (= (and b!219113 c!36467) b!219110))

(assert (= (and b!219113 (not c!36467)) b!219112))

(declare-fun m!244905 () Bool)

(assert (=> b!219108 m!244905))

(declare-fun m!244907 () Bool)

(assert (=> d!58697 m!244907))

(declare-fun m!244909 () Bool)

(assert (=> d!58697 m!244909))

(declare-fun m!244911 () Bool)

(assert (=> d!58697 m!244911))

(declare-fun m!244913 () Bool)

(assert (=> d!58697 m!244913))

(declare-fun m!244915 () Bool)

(assert (=> d!58697 m!244915))

(assert (=> d!58697 m!244907))

(declare-fun m!244917 () Bool)

(assert (=> d!58697 m!244917))

(declare-fun m!244919 () Bool)

(assert (=> b!219112 m!244919))

(assert (=> b!218977 d!58697))

(declare-fun d!58699 () Bool)

(declare-fun e!142543 () Bool)

(assert (=> d!58699 e!142543))

(declare-fun res!107394 () Bool)

(assert (=> d!58699 (=> (not res!107394) (not e!142543))))

(declare-fun lt!111805 () SeekEntryResult!771)

(assert (=> d!58699 (= res!107394 ((_ is Found!771) lt!111805))))

(assert (=> d!58699 (= lt!111805 (seekEntryOrOpen!0 key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun lt!111806 () Unit!6511)

(declare-fun choose!1094 (array!10739 array!10737 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6511)

(assert (=> d!58699 (= lt!111806 (choose!1094 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> d!58699 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58699 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!189 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) lt!111806)))

(declare-fun b!219118 () Bool)

(declare-fun res!107393 () Bool)

(assert (=> b!219118 (=> (not res!107393) (not e!142543))))

(assert (=> b!219118 (= res!107393 (inRange!0 (index!5255 lt!111805) (mask!9917 thiss!1504)))))

(declare-fun b!219119 () Bool)

(assert (=> b!219119 (= e!142543 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5255 lt!111805)) key!932))))

(assert (=> b!219119 (and (bvsge (index!5255 lt!111805) #b00000000000000000000000000000000) (bvslt (index!5255 lt!111805) (size!5422 (_keys!6184 thiss!1504))))))

(assert (= (and d!58699 res!107394) b!219118))

(assert (= (and b!219118 res!107393) b!219119))

(assert (=> d!58699 m!244845))

(declare-fun m!244921 () Bool)

(assert (=> d!58699 m!244921))

(assert (=> d!58699 m!244913))

(declare-fun m!244923 () Bool)

(assert (=> b!219118 m!244923))

(declare-fun m!244925 () Bool)

(assert (=> b!219119 m!244925))

(assert (=> b!218980 d!58699))

(declare-fun d!58701 () Bool)

(assert (=> d!58701 (= (inRange!0 index!297 (mask!9917 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218985 d!58701))

(declare-fun d!58703 () Bool)

(declare-fun e!142549 () Bool)

(assert (=> d!58703 e!142549))

(declare-fun res!107397 () Bool)

(assert (=> d!58703 (=> res!107397 e!142549)))

(declare-fun lt!111817 () Bool)

(assert (=> d!58703 (= res!107397 (not lt!111817))))

(declare-fun lt!111815 () Bool)

(assert (=> d!58703 (= lt!111817 lt!111815)))

(declare-fun lt!111818 () Unit!6511)

(declare-fun e!142548 () Unit!6511)

(assert (=> d!58703 (= lt!111818 e!142548)))

(declare-fun c!36471 () Bool)

(assert (=> d!58703 (= c!36471 lt!111815)))

(declare-fun containsKey!252 (List!3154 (_ BitVec 64)) Bool)

(assert (=> d!58703 (= lt!111815 (containsKey!252 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(assert (=> d!58703 (= (contains!1457 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) key!932) lt!111817)))

(declare-fun b!219126 () Bool)

(declare-fun lt!111816 () Unit!6511)

(assert (=> b!219126 (= e!142548 lt!111816)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!200 (List!3154 (_ BitVec 64)) Unit!6511)

(assert (=> b!219126 (= lt!111816 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-datatypes ((Option!267 0))(
  ( (Some!266 (v!4942 V!7313)) (None!265) )
))
(declare-fun isDefined!201 (Option!267) Bool)

(declare-fun getValueByKey!261 (List!3154 (_ BitVec 64)) Option!267)

(assert (=> b!219126 (isDefined!201 (getValueByKey!261 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-fun b!219127 () Bool)

(declare-fun Unit!6519 () Unit!6511)

(assert (=> b!219127 (= e!142548 Unit!6519)))

(declare-fun b!219128 () Bool)

(assert (=> b!219128 (= e!142549 (isDefined!201 (getValueByKey!261 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932)))))

(assert (= (and d!58703 c!36471) b!219126))

(assert (= (and d!58703 (not c!36471)) b!219127))

(assert (= (and d!58703 (not res!107397)) b!219128))

(declare-fun m!244927 () Bool)

(assert (=> d!58703 m!244927))

(declare-fun m!244929 () Bool)

(assert (=> b!219126 m!244929))

(declare-fun m!244931 () Bool)

(assert (=> b!219126 m!244931))

(assert (=> b!219126 m!244931))

(declare-fun m!244933 () Bool)

(assert (=> b!219126 m!244933))

(assert (=> b!219128 m!244931))

(assert (=> b!219128 m!244931))

(assert (=> b!219128 m!244933))

(assert (=> b!218985 d!58703))

(declare-fun bm!20463 () Bool)

(declare-fun call!20472 () ListLongMap!3173)

(declare-fun getCurrentListMapNoExtraKeys!518 (array!10739 array!10737 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 32) Int) ListLongMap!3173)

(assert (=> bm!20463 (= call!20472 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun c!36485 () Bool)

(declare-fun call!20467 () ListLongMap!3173)

(declare-fun call!20469 () ListLongMap!3173)

(declare-fun c!36486 () Bool)

(declare-fun call!20466 () ListLongMap!3173)

(declare-fun bm!20464 () Bool)

(declare-fun +!592 (ListLongMap!3173 tuple2!4258) ListLongMap!3173)

(assert (=> bm!20464 (= call!20469 (+!592 (ite c!36485 call!20472 (ite c!36486 call!20467 call!20466)) (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(declare-fun b!219172 () Bool)

(declare-fun e!142582 () Bool)

(declare-fun e!142581 () Bool)

(assert (=> b!219172 (= e!142582 e!142581)))

(declare-fun res!107416 () Bool)

(assert (=> b!219172 (=> (not res!107416) (not e!142581))))

(declare-fun lt!111882 () ListLongMap!3173)

(assert (=> b!219172 (= res!107416 (contains!1457 lt!111882 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219172 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219173 () Bool)

(declare-fun c!36489 () Bool)

(assert (=> b!219173 (= c!36489 (and (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!142580 () ListLongMap!3173)

(declare-fun e!142583 () ListLongMap!3173)

(assert (=> b!219173 (= e!142580 e!142583)))

(declare-fun b!219174 () Bool)

(declare-fun e!142585 () Bool)

(declare-fun apply!202 (ListLongMap!3173 (_ BitVec 64)) V!7313)

(assert (=> b!219174 (= e!142585 (= (apply!202 lt!111882 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3975 thiss!1504)))))

(declare-fun bm!20465 () Bool)

(assert (=> bm!20465 (= call!20467 call!20472)))

(declare-fun bm!20466 () Bool)

(declare-fun call!20471 () ListLongMap!3173)

(assert (=> bm!20466 (= call!20471 call!20469)))

(declare-fun b!219175 () Bool)

(declare-fun res!107422 () Bool)

(declare-fun e!142588 () Bool)

(assert (=> b!219175 (=> (not res!107422) (not e!142588))))

(declare-fun e!142587 () Bool)

(assert (=> b!219175 (= res!107422 e!142587)))

(declare-fun c!36487 () Bool)

(assert (=> b!219175 (= c!36487 (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!219176 () Bool)

(declare-fun get!2680 (ValueCell!2531 V!7313) V!7313)

(declare-fun dynLambda!545 (Int (_ BitVec 64)) V!7313)

(assert (=> b!219176 (= e!142581 (= (apply!202 lt!111882 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)) (get!2680 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!219176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5421 (_values!4117 thiss!1504))))))

(assert (=> b!219176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219177 () Bool)

(declare-fun e!142577 () ListLongMap!3173)

(assert (=> b!219177 (= e!142577 e!142580)))

(assert (=> b!219177 (= c!36486 (and (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!219178 () Bool)

(declare-fun e!142578 () Bool)

(assert (=> b!219178 (= e!142578 (= (apply!202 lt!111882 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3975 thiss!1504)))))

(declare-fun b!219179 () Bool)

(declare-fun e!142586 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!219179 (= e!142586 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219171 () Bool)

(declare-fun e!142576 () Bool)

(assert (=> b!219171 (= e!142588 e!142576)))

(declare-fun c!36488 () Bool)

(assert (=> b!219171 (= c!36488 (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!58705 () Bool)

(assert (=> d!58705 e!142588))

(declare-fun res!107424 () Bool)

(assert (=> d!58705 (=> (not res!107424) (not e!142588))))

(assert (=> d!58705 (= res!107424 (or (bvsge #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))))

(declare-fun lt!111865 () ListLongMap!3173)

(assert (=> d!58705 (= lt!111882 lt!111865)))

(declare-fun lt!111884 () Unit!6511)

(declare-fun e!142579 () Unit!6511)

(assert (=> d!58705 (= lt!111884 e!142579)))

(declare-fun c!36484 () Bool)

(declare-fun e!142584 () Bool)

(assert (=> d!58705 (= c!36484 e!142584)))

(declare-fun res!107420 () Bool)

(assert (=> d!58705 (=> (not res!107420) (not e!142584))))

(assert (=> d!58705 (= res!107420 (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> d!58705 (= lt!111865 e!142577)))

(assert (=> d!58705 (= c!36485 (and (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58705 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58705 (= (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) lt!111882)))

(declare-fun b!219180 () Bool)

(declare-fun Unit!6520 () Unit!6511)

(assert (=> b!219180 (= e!142579 Unit!6520)))

(declare-fun b!219181 () Bool)

(assert (=> b!219181 (= e!142587 e!142585)))

(declare-fun res!107421 () Bool)

(declare-fun call!20470 () Bool)

(assert (=> b!219181 (= res!107421 call!20470)))

(assert (=> b!219181 (=> (not res!107421) (not e!142585))))

(declare-fun b!219182 () Bool)

(assert (=> b!219182 (= e!142580 call!20471)))

(declare-fun b!219183 () Bool)

(assert (=> b!219183 (= e!142583 call!20471)))

(declare-fun b!219184 () Bool)

(declare-fun call!20468 () Bool)

(assert (=> b!219184 (= e!142576 (not call!20468))))

(declare-fun b!219185 () Bool)

(assert (=> b!219185 (= e!142577 (+!592 call!20469 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))

(declare-fun bm!20467 () Bool)

(assert (=> bm!20467 (= call!20470 (contains!1457 lt!111882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20468 () Bool)

(assert (=> bm!20468 (= call!20468 (contains!1457 lt!111882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219186 () Bool)

(declare-fun res!107417 () Bool)

(assert (=> b!219186 (=> (not res!107417) (not e!142588))))

(assert (=> b!219186 (= res!107417 e!142582)))

(declare-fun res!107418 () Bool)

(assert (=> b!219186 (=> res!107418 e!142582)))

(assert (=> b!219186 (= res!107418 (not e!142586))))

(declare-fun res!107419 () Bool)

(assert (=> b!219186 (=> (not res!107419) (not e!142586))))

(assert (=> b!219186 (= res!107419 (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219187 () Bool)

(declare-fun lt!111881 () Unit!6511)

(assert (=> b!219187 (= e!142579 lt!111881)))

(declare-fun lt!111883 () ListLongMap!3173)

(assert (=> b!219187 (= lt!111883 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111878 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111880 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111880 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111864 () Unit!6511)

(declare-fun addStillContains!178 (ListLongMap!3173 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6511)

(assert (=> b!219187 (= lt!111864 (addStillContains!178 lt!111883 lt!111878 (zeroValue!3975 thiss!1504) lt!111880))))

(assert (=> b!219187 (contains!1457 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))) lt!111880)))

(declare-fun lt!111876 () Unit!6511)

(assert (=> b!219187 (= lt!111876 lt!111864)))

(declare-fun lt!111868 () ListLongMap!3173)

(assert (=> b!219187 (= lt!111868 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111872 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111867 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111867 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111877 () Unit!6511)

(declare-fun addApplyDifferent!178 (ListLongMap!3173 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6511)

(assert (=> b!219187 (= lt!111877 (addApplyDifferent!178 lt!111868 lt!111872 (minValue!3975 thiss!1504) lt!111867))))

(assert (=> b!219187 (= (apply!202 (+!592 lt!111868 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))) lt!111867) (apply!202 lt!111868 lt!111867))))

(declare-fun lt!111863 () Unit!6511)

(assert (=> b!219187 (= lt!111863 lt!111877)))

(declare-fun lt!111874 () ListLongMap!3173)

(assert (=> b!219187 (= lt!111874 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111869 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111875 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111875 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111873 () Unit!6511)

(assert (=> b!219187 (= lt!111873 (addApplyDifferent!178 lt!111874 lt!111869 (zeroValue!3975 thiss!1504) lt!111875))))

(assert (=> b!219187 (= (apply!202 (+!592 lt!111874 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))) lt!111875) (apply!202 lt!111874 lt!111875))))

(declare-fun lt!111866 () Unit!6511)

(assert (=> b!219187 (= lt!111866 lt!111873)))

(declare-fun lt!111871 () ListLongMap!3173)

(assert (=> b!219187 (= lt!111871 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111879 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111879 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111870 () (_ BitVec 64))

(assert (=> b!219187 (= lt!111870 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!219187 (= lt!111881 (addApplyDifferent!178 lt!111871 lt!111879 (minValue!3975 thiss!1504) lt!111870))))

(assert (=> b!219187 (= (apply!202 (+!592 lt!111871 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))) lt!111870) (apply!202 lt!111871 lt!111870))))

(declare-fun b!219188 () Bool)

(assert (=> b!219188 (= e!142587 (not call!20470))))

(declare-fun b!219189 () Bool)

(assert (=> b!219189 (= e!142584 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219190 () Bool)

(assert (=> b!219190 (= e!142576 e!142578)))

(declare-fun res!107423 () Bool)

(assert (=> b!219190 (= res!107423 call!20468)))

(assert (=> b!219190 (=> (not res!107423) (not e!142578))))

(declare-fun b!219191 () Bool)

(assert (=> b!219191 (= e!142583 call!20466)))

(declare-fun bm!20469 () Bool)

(assert (=> bm!20469 (= call!20466 call!20467)))

(assert (= (and d!58705 c!36485) b!219185))

(assert (= (and d!58705 (not c!36485)) b!219177))

(assert (= (and b!219177 c!36486) b!219182))

(assert (= (and b!219177 (not c!36486)) b!219173))

(assert (= (and b!219173 c!36489) b!219183))

(assert (= (and b!219173 (not c!36489)) b!219191))

(assert (= (or b!219183 b!219191) bm!20469))

(assert (= (or b!219182 bm!20469) bm!20465))

(assert (= (or b!219182 b!219183) bm!20466))

(assert (= (or b!219185 bm!20465) bm!20463))

(assert (= (or b!219185 bm!20466) bm!20464))

(assert (= (and d!58705 res!107420) b!219189))

(assert (= (and d!58705 c!36484) b!219187))

(assert (= (and d!58705 (not c!36484)) b!219180))

(assert (= (and d!58705 res!107424) b!219186))

(assert (= (and b!219186 res!107419) b!219179))

(assert (= (and b!219186 (not res!107418)) b!219172))

(assert (= (and b!219172 res!107416) b!219176))

(assert (= (and b!219186 res!107417) b!219175))

(assert (= (and b!219175 c!36487) b!219181))

(assert (= (and b!219175 (not c!36487)) b!219188))

(assert (= (and b!219181 res!107421) b!219174))

(assert (= (or b!219181 b!219188) bm!20467))

(assert (= (and b!219175 res!107422) b!219171))

(assert (= (and b!219171 c!36488) b!219190))

(assert (= (and b!219171 (not c!36488)) b!219184))

(assert (= (and b!219190 res!107423) b!219178))

(assert (= (or b!219190 b!219184) bm!20468))

(declare-fun b_lambda!7853 () Bool)

(assert (=> (not b_lambda!7853) (not b!219176)))

(declare-fun t!8106 () Bool)

(declare-fun tb!2909 () Bool)

(assert (=> (and b!218970 (= (defaultEntry!4134 thiss!1504) (defaultEntry!4134 thiss!1504)) t!8106) tb!2909))

(declare-fun result!5065 () Bool)

(assert (=> tb!2909 (= result!5065 tp_is_empty!5749)))

(assert (=> b!219176 t!8106))

(declare-fun b_and!12799 () Bool)

(assert (= b_and!12793 (and (=> t!8106 result!5065) b_and!12799)))

(declare-fun m!244935 () Bool)

(assert (=> b!219185 m!244935))

(assert (=> d!58705 m!244913))

(declare-fun m!244937 () Bool)

(assert (=> b!219172 m!244937))

(assert (=> b!219172 m!244937))

(declare-fun m!244939 () Bool)

(assert (=> b!219172 m!244939))

(declare-fun m!244941 () Bool)

(assert (=> bm!20468 m!244941))

(assert (=> b!219179 m!244937))

(assert (=> b!219179 m!244937))

(declare-fun m!244943 () Bool)

(assert (=> b!219179 m!244943))

(declare-fun m!244945 () Bool)

(assert (=> bm!20464 m!244945))

(declare-fun m!244947 () Bool)

(assert (=> b!219174 m!244947))

(declare-fun m!244949 () Bool)

(assert (=> b!219178 m!244949))

(declare-fun m!244951 () Bool)

(assert (=> b!219176 m!244951))

(declare-fun m!244953 () Bool)

(assert (=> b!219176 m!244953))

(assert (=> b!219176 m!244937))

(declare-fun m!244955 () Bool)

(assert (=> b!219176 m!244955))

(assert (=> b!219176 m!244937))

(assert (=> b!219176 m!244953))

(assert (=> b!219176 m!244951))

(declare-fun m!244957 () Bool)

(assert (=> b!219176 m!244957))

(declare-fun m!244959 () Bool)

(assert (=> b!219187 m!244959))

(declare-fun m!244961 () Bool)

(assert (=> b!219187 m!244961))

(declare-fun m!244963 () Bool)

(assert (=> b!219187 m!244963))

(declare-fun m!244965 () Bool)

(assert (=> b!219187 m!244965))

(declare-fun m!244967 () Bool)

(assert (=> b!219187 m!244967))

(declare-fun m!244969 () Bool)

(assert (=> b!219187 m!244969))

(assert (=> b!219187 m!244937))

(declare-fun m!244971 () Bool)

(assert (=> b!219187 m!244971))

(declare-fun m!244973 () Bool)

(assert (=> b!219187 m!244973))

(declare-fun m!244975 () Bool)

(assert (=> b!219187 m!244975))

(assert (=> b!219187 m!244975))

(declare-fun m!244977 () Bool)

(assert (=> b!219187 m!244977))

(assert (=> b!219187 m!244971))

(declare-fun m!244979 () Bool)

(assert (=> b!219187 m!244979))

(declare-fun m!244981 () Bool)

(assert (=> b!219187 m!244981))

(assert (=> b!219187 m!244979))

(declare-fun m!244983 () Bool)

(assert (=> b!219187 m!244983))

(declare-fun m!244985 () Bool)

(assert (=> b!219187 m!244985))

(declare-fun m!244987 () Bool)

(assert (=> b!219187 m!244987))

(assert (=> b!219187 m!244969))

(declare-fun m!244989 () Bool)

(assert (=> b!219187 m!244989))

(assert (=> bm!20463 m!244959))

(declare-fun m!244991 () Bool)

(assert (=> bm!20467 m!244991))

(assert (=> b!219189 m!244937))

(assert (=> b!219189 m!244937))

(assert (=> b!219189 m!244943))

(assert (=> b!218985 d!58705))

(declare-fun c!36494 () Bool)

(declare-fun call!20477 () Bool)

(declare-fun lt!111889 () SeekEntryResult!771)

(declare-fun bm!20474 () Bool)

(assert (=> bm!20474 (= call!20477 (inRange!0 (ite c!36494 (index!5254 lt!111889) (index!5257 lt!111889)) (mask!9917 thiss!1504)))))

(declare-fun b!219210 () Bool)

(declare-fun e!142600 () Bool)

(assert (=> b!219210 (= e!142600 ((_ is Undefined!771) lt!111889))))

(declare-fun b!219211 () Bool)

(declare-fun e!142599 () Bool)

(declare-fun e!142597 () Bool)

(assert (=> b!219211 (= e!142599 e!142597)))

(declare-fun res!107433 () Bool)

(assert (=> b!219211 (= res!107433 call!20477)))

(assert (=> b!219211 (=> (not res!107433) (not e!142597))))

(declare-fun b!219212 () Bool)

(declare-fun call!20478 () Bool)

(assert (=> b!219212 (= e!142597 (not call!20478))))

(declare-fun b!219213 () Bool)

(declare-fun res!107435 () Bool)

(declare-fun e!142598 () Bool)

(assert (=> b!219213 (=> (not res!107435) (not e!142598))))

(assert (=> b!219213 (= res!107435 call!20477)))

(assert (=> b!219213 (= e!142600 e!142598)))

(declare-fun d!58707 () Bool)

(assert (=> d!58707 e!142599))

(assert (=> d!58707 (= c!36494 ((_ is MissingZero!771) lt!111889))))

(assert (=> d!58707 (= lt!111889 (seekEntryOrOpen!0 key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun lt!111890 () Unit!6511)

(declare-fun choose!1095 (array!10739 array!10737 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6511)

(assert (=> d!58707 (= lt!111890 (choose!1095 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> d!58707 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58707 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!187 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) lt!111890)))

(declare-fun b!219214 () Bool)

(declare-fun res!107436 () Bool)

(assert (=> b!219214 (=> (not res!107436) (not e!142598))))

(assert (=> b!219214 (= res!107436 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5257 lt!111889)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219214 (and (bvsge (index!5257 lt!111889) #b00000000000000000000000000000000) (bvslt (index!5257 lt!111889) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219215 () Bool)

(assert (=> b!219215 (= e!142599 e!142600)))

(declare-fun c!36495 () Bool)

(assert (=> b!219215 (= c!36495 ((_ is MissingVacant!771) lt!111889))))

(declare-fun bm!20475 () Bool)

(assert (=> bm!20475 (= call!20478 (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219216 () Bool)

(assert (=> b!219216 (= e!142598 (not call!20478))))

(declare-fun b!219217 () Bool)

(assert (=> b!219217 (and (bvsge (index!5254 lt!111889) #b00000000000000000000000000000000) (bvslt (index!5254 lt!111889) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun res!107434 () Bool)

(assert (=> b!219217 (= res!107434 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5254 lt!111889)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219217 (=> (not res!107434) (not e!142597))))

(assert (= (and d!58707 c!36494) b!219211))

(assert (= (and d!58707 (not c!36494)) b!219215))

(assert (= (and b!219211 res!107433) b!219217))

(assert (= (and b!219217 res!107434) b!219212))

(assert (= (and b!219215 c!36495) b!219213))

(assert (= (and b!219215 (not c!36495)) b!219210))

(assert (= (and b!219213 res!107435) b!219214))

(assert (= (and b!219214 res!107436) b!219216))

(assert (= (or b!219211 b!219213) bm!20474))

(assert (= (or b!219212 b!219216) bm!20475))

(assert (=> d!58707 m!244845))

(declare-fun m!244993 () Bool)

(assert (=> d!58707 m!244993))

(assert (=> d!58707 m!244913))

(declare-fun m!244995 () Bool)

(assert (=> b!219214 m!244995))

(declare-fun m!244997 () Bool)

(assert (=> b!219217 m!244997))

(assert (=> bm!20475 m!244825))

(declare-fun m!244999 () Bool)

(assert (=> bm!20474 m!244999))

(assert (=> b!218983 d!58707))

(declare-fun d!58709 () Bool)

(assert (=> d!58709 (= (array_inv!3347 (_keys!6184 thiss!1504)) (bvsge (size!5422 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218970 d!58709))

(declare-fun d!58711 () Bool)

(assert (=> d!58711 (= (array_inv!3348 (_values!4117 thiss!1504)) (bvsge (size!5421 (_values!4117 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218970 d!58711))

(declare-fun d!58713 () Bool)

(declare-fun res!107441 () Bool)

(declare-fun e!142605 () Bool)

(assert (=> d!58713 (=> res!107441 e!142605)))

(assert (=> d!58713 (= res!107441 (= (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!58713 (= (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 #b00000000000000000000000000000000) e!142605)))

(declare-fun b!219222 () Bool)

(declare-fun e!142606 () Bool)

(assert (=> b!219222 (= e!142605 e!142606)))

(declare-fun res!107442 () Bool)

(assert (=> b!219222 (=> (not res!107442) (not e!142606))))

(assert (=> b!219222 (= res!107442 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219223 () Bool)

(assert (=> b!219223 (= e!142606 (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!58713 (not res!107441)) b!219222))

(assert (= (and b!219222 res!107442) b!219223))

(assert (=> d!58713 m!244937))

(declare-fun m!245001 () Bool)

(assert (=> b!219223 m!245001))

(assert (=> bm!20435 d!58713))

(declare-fun d!58715 () Bool)

(assert (=> d!58715 (= (inRange!0 (ite c!36439 (index!5254 lt!111764) (index!5257 lt!111764)) (mask!9917 thiss!1504)) (and (bvsge (ite c!36439 (index!5254 lt!111764) (index!5257 lt!111764)) #b00000000000000000000000000000000) (bvslt (ite c!36439 (index!5254 lt!111764) (index!5257 lt!111764)) (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20436 d!58715))

(declare-fun d!58717 () Bool)

(declare-fun res!107449 () Bool)

(declare-fun e!142609 () Bool)

(assert (=> d!58717 (=> (not res!107449) (not e!142609))))

(declare-fun simpleValid!225 (LongMapFixedSize!2962) Bool)

(assert (=> d!58717 (= res!107449 (simpleValid!225 thiss!1504))))

(assert (=> d!58717 (= (valid!1211 thiss!1504) e!142609)))

(declare-fun b!219230 () Bool)

(declare-fun res!107450 () Bool)

(assert (=> b!219230 (=> (not res!107450) (not e!142609))))

(declare-fun arrayCountValidKeys!0 (array!10739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!219230 (= res!107450 (= (arrayCountValidKeys!0 (_keys!6184 thiss!1504) #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))) (_size!1530 thiss!1504)))))

(declare-fun b!219231 () Bool)

(declare-fun res!107451 () Bool)

(assert (=> b!219231 (=> (not res!107451) (not e!142609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10739 (_ BitVec 32)) Bool)

(assert (=> b!219231 (= res!107451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun b!219232 () Bool)

(declare-datatypes ((List!3156 0))(
  ( (Nil!3153) (Cons!3152 (h!3799 (_ BitVec 64)) (t!8107 List!3156)) )
))
(declare-fun arrayNoDuplicates!0 (array!10739 (_ BitVec 32) List!3156) Bool)

(assert (=> b!219232 (= e!142609 (arrayNoDuplicates!0 (_keys!6184 thiss!1504) #b00000000000000000000000000000000 Nil!3153))))

(assert (= (and d!58717 res!107449) b!219230))

(assert (= (and b!219230 res!107450) b!219231))

(assert (= (and b!219231 res!107451) b!219232))

(declare-fun m!245003 () Bool)

(assert (=> d!58717 m!245003))

(declare-fun m!245005 () Bool)

(assert (=> b!219230 m!245005))

(declare-fun m!245007 () Bool)

(assert (=> b!219231 m!245007))

(declare-fun m!245009 () Bool)

(assert (=> b!219232 m!245009))

(assert (=> start!21762 d!58717))

(declare-fun mapIsEmpty!9798 () Bool)

(declare-fun mapRes!9798 () Bool)

(assert (=> mapIsEmpty!9798 mapRes!9798))

(declare-fun condMapEmpty!9798 () Bool)

(declare-fun mapDefault!9798 () ValueCell!2531)

(assert (=> mapNonEmpty!9789 (= condMapEmpty!9798 (= mapRest!9789 ((as const (Array (_ BitVec 32) ValueCell!2531)) mapDefault!9798)))))

(declare-fun e!142614 () Bool)

(assert (=> mapNonEmpty!9789 (= tp!20798 (and e!142614 mapRes!9798))))

(declare-fun mapNonEmpty!9798 () Bool)

(declare-fun tp!20814 () Bool)

(declare-fun e!142615 () Bool)

(assert (=> mapNonEmpty!9798 (= mapRes!9798 (and tp!20814 e!142615))))

(declare-fun mapValue!9798 () ValueCell!2531)

(declare-fun mapRest!9798 () (Array (_ BitVec 32) ValueCell!2531))

(declare-fun mapKey!9798 () (_ BitVec 32))

(assert (=> mapNonEmpty!9798 (= mapRest!9789 (store mapRest!9798 mapKey!9798 mapValue!9798))))

(declare-fun b!219240 () Bool)

(assert (=> b!219240 (= e!142614 tp_is_empty!5749)))

(declare-fun b!219239 () Bool)

(assert (=> b!219239 (= e!142615 tp_is_empty!5749)))

(assert (= (and mapNonEmpty!9789 condMapEmpty!9798) mapIsEmpty!9798))

(assert (= (and mapNonEmpty!9789 (not condMapEmpty!9798)) mapNonEmpty!9798))

(assert (= (and mapNonEmpty!9798 ((_ is ValueCellFull!2531) mapValue!9798)) b!219239))

(assert (= (and mapNonEmpty!9789 ((_ is ValueCellFull!2531) mapDefault!9798)) b!219240))

(declare-fun m!245011 () Bool)

(assert (=> mapNonEmpty!9798 m!245011))

(declare-fun b_lambda!7855 () Bool)

(assert (= b_lambda!7853 (or (and b!218970 b_free!5887) b_lambda!7855)))

(check-sat (not d!58705) (not b!219112) (not bm!20474) (not b!219231) (not b!219128) (not mapNonEmpty!9798) (not b!219223) (not b!219176) (not d!58697) (not bm!20463) (not bm!20468) (not b_lambda!7855) (not b!219126) tp_is_empty!5749 (not d!58717) (not b!219230) (not bm!20467) (not d!58707) (not b!219185) (not b!219172) (not d!58699) (not bm!20464) (not b!219187) (not b!219232) b_and!12799 (not b!219179) (not b!219189) (not b!219174) (not bm!20475) (not b!219178) (not d!58703) (not b!219118) (not b_next!5887))
(check-sat b_and!12799 (not b_next!5887))
(get-model)

(declare-fun b!219251 () Bool)

(declare-fun e!142626 () Bool)

(declare-fun e!142625 () Bool)

(assert (=> b!219251 (= e!142626 e!142625)))

(declare-fun res!107459 () Bool)

(assert (=> b!219251 (=> (not res!107459) (not e!142625))))

(declare-fun e!142624 () Bool)

(assert (=> b!219251 (= res!107459 (not e!142624))))

(declare-fun res!107460 () Bool)

(assert (=> b!219251 (=> (not res!107460) (not e!142624))))

(assert (=> b!219251 (= res!107460 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219252 () Bool)

(declare-fun e!142627 () Bool)

(declare-fun call!20481 () Bool)

(assert (=> b!219252 (= e!142627 call!20481)))

(declare-fun d!58719 () Bool)

(declare-fun res!107458 () Bool)

(assert (=> d!58719 (=> res!107458 e!142626)))

(assert (=> d!58719 (= res!107458 (bvsge #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> d!58719 (= (arrayNoDuplicates!0 (_keys!6184 thiss!1504) #b00000000000000000000000000000000 Nil!3153) e!142626)))

(declare-fun b!219253 () Bool)

(assert (=> b!219253 (= e!142627 call!20481)))

(declare-fun bm!20478 () Bool)

(declare-fun c!36498 () Bool)

(assert (=> bm!20478 (= call!20481 (arrayNoDuplicates!0 (_keys!6184 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36498 (Cons!3152 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000) Nil!3153) Nil!3153)))))

(declare-fun b!219254 () Bool)

(assert (=> b!219254 (= e!142625 e!142627)))

(assert (=> b!219254 (= c!36498 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219255 () Bool)

(declare-fun contains!1459 (List!3156 (_ BitVec 64)) Bool)

(assert (=> b!219255 (= e!142624 (contains!1459 Nil!3153 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58719 (not res!107458)) b!219251))

(assert (= (and b!219251 res!107460) b!219255))

(assert (= (and b!219251 res!107459) b!219254))

(assert (= (and b!219254 c!36498) b!219252))

(assert (= (and b!219254 (not c!36498)) b!219253))

(assert (= (or b!219252 b!219253) bm!20478))

(assert (=> b!219251 m!244937))

(assert (=> b!219251 m!244937))

(assert (=> b!219251 m!244943))

(assert (=> bm!20478 m!244937))

(declare-fun m!245013 () Bool)

(assert (=> bm!20478 m!245013))

(assert (=> b!219254 m!244937))

(assert (=> b!219254 m!244937))

(assert (=> b!219254 m!244943))

(assert (=> b!219255 m!244937))

(assert (=> b!219255 m!244937))

(declare-fun m!245015 () Bool)

(assert (=> b!219255 m!245015))

(assert (=> b!219232 d!58719))

(declare-fun d!58721 () Bool)

(declare-fun e!142630 () Bool)

(assert (=> d!58721 e!142630))

(declare-fun res!107465 () Bool)

(assert (=> d!58721 (=> (not res!107465) (not e!142630))))

(declare-fun lt!111902 () ListLongMap!3173)

(assert (=> d!58721 (= res!107465 (contains!1457 lt!111902 (_1!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(declare-fun lt!111900 () List!3154)

(assert (=> d!58721 (= lt!111902 (ListLongMap!3174 lt!111900))))

(declare-fun lt!111901 () Unit!6511)

(declare-fun lt!111899 () Unit!6511)

(assert (=> d!58721 (= lt!111901 lt!111899)))

(assert (=> d!58721 (= (getValueByKey!261 lt!111900 (_1!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))) (Some!266 (_2!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!147 (List!3154 (_ BitVec 64) V!7313) Unit!6511)

(assert (=> d!58721 (= lt!111899 (lemmaContainsTupThenGetReturnValue!147 lt!111900 (_1!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (_2!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(declare-fun insertStrictlySorted!150 (List!3154 (_ BitVec 64) V!7313) List!3154)

(assert (=> d!58721 (= lt!111900 (insertStrictlySorted!150 (toList!1602 (ite c!36485 call!20472 (ite c!36486 call!20467 call!20466))) (_1!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (_2!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(assert (=> d!58721 (= (+!592 (ite c!36485 call!20472 (ite c!36486 call!20467 call!20466)) (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) lt!111902)))

(declare-fun b!219260 () Bool)

(declare-fun res!107466 () Bool)

(assert (=> b!219260 (=> (not res!107466) (not e!142630))))

(assert (=> b!219260 (= res!107466 (= (getValueByKey!261 (toList!1602 lt!111902) (_1!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))) (Some!266 (_2!2140 (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))))

(declare-fun b!219261 () Bool)

(declare-fun contains!1460 (List!3154 tuple2!4258) Bool)

(assert (=> b!219261 (= e!142630 (contains!1460 (toList!1602 lt!111902) (ite (or c!36485 c!36486) (tuple2!4259 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (= (and d!58721 res!107465) b!219260))

(assert (= (and b!219260 res!107466) b!219261))

(declare-fun m!245017 () Bool)

(assert (=> d!58721 m!245017))

(declare-fun m!245019 () Bool)

(assert (=> d!58721 m!245019))

(declare-fun m!245021 () Bool)

(assert (=> d!58721 m!245021))

(declare-fun m!245023 () Bool)

(assert (=> d!58721 m!245023))

(declare-fun m!245025 () Bool)

(assert (=> b!219260 m!245025))

(declare-fun m!245027 () Bool)

(assert (=> b!219261 m!245027))

(assert (=> bm!20464 d!58721))

(declare-fun d!58723 () Bool)

(assert (=> d!58723 (= (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!219189 d!58723))

(declare-fun d!58725 () Bool)

(declare-fun e!142632 () Bool)

(assert (=> d!58725 e!142632))

(declare-fun res!107467 () Bool)

(assert (=> d!58725 (=> res!107467 e!142632)))

(declare-fun lt!111905 () Bool)

(assert (=> d!58725 (= res!107467 (not lt!111905))))

(declare-fun lt!111903 () Bool)

(assert (=> d!58725 (= lt!111905 lt!111903)))

(declare-fun lt!111906 () Unit!6511)

(declare-fun e!142631 () Unit!6511)

(assert (=> d!58725 (= lt!111906 e!142631)))

(declare-fun c!36499 () Bool)

(assert (=> d!58725 (= c!36499 lt!111903)))

(assert (=> d!58725 (= lt!111903 (containsKey!252 (toList!1602 lt!111882) (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58725 (= (contains!1457 lt!111882 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)) lt!111905)))

(declare-fun b!219262 () Bool)

(declare-fun lt!111904 () Unit!6511)

(assert (=> b!219262 (= e!142631 lt!111904)))

(assert (=> b!219262 (= lt!111904 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1602 lt!111882) (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219262 (isDefined!201 (getValueByKey!261 (toList!1602 lt!111882) (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219263 () Bool)

(declare-fun Unit!6521 () Unit!6511)

(assert (=> b!219263 (= e!142631 Unit!6521)))

(declare-fun b!219264 () Bool)

(assert (=> b!219264 (= e!142632 (isDefined!201 (getValueByKey!261 (toList!1602 lt!111882) (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58725 c!36499) b!219262))

(assert (= (and d!58725 (not c!36499)) b!219263))

(assert (= (and d!58725 (not res!107467)) b!219264))

(assert (=> d!58725 m!244937))

(declare-fun m!245029 () Bool)

(assert (=> d!58725 m!245029))

(assert (=> b!219262 m!244937))

(declare-fun m!245031 () Bool)

(assert (=> b!219262 m!245031))

(assert (=> b!219262 m!244937))

(declare-fun m!245033 () Bool)

(assert (=> b!219262 m!245033))

(assert (=> b!219262 m!245033))

(declare-fun m!245035 () Bool)

(assert (=> b!219262 m!245035))

(assert (=> b!219264 m!244937))

(assert (=> b!219264 m!245033))

(assert (=> b!219264 m!245033))

(assert (=> b!219264 m!245035))

(assert (=> b!219172 d!58725))

(declare-fun d!58727 () Bool)

(declare-fun get!2681 (Option!267) V!7313)

(assert (=> d!58727 (= (apply!202 lt!111868 lt!111867) (get!2681 (getValueByKey!261 (toList!1602 lt!111868) lt!111867)))))

(declare-fun bs!8457 () Bool)

(assert (= bs!8457 d!58727))

(declare-fun m!245037 () Bool)

(assert (=> bs!8457 m!245037))

(assert (=> bs!8457 m!245037))

(declare-fun m!245039 () Bool)

(assert (=> bs!8457 m!245039))

(assert (=> b!219187 d!58727))

(declare-fun d!58729 () Bool)

(assert (=> d!58729 (= (apply!202 lt!111871 lt!111870) (get!2681 (getValueByKey!261 (toList!1602 lt!111871) lt!111870)))))

(declare-fun bs!8458 () Bool)

(assert (= bs!8458 d!58729))

(declare-fun m!245041 () Bool)

(assert (=> bs!8458 m!245041))

(assert (=> bs!8458 m!245041))

(declare-fun m!245043 () Bool)

(assert (=> bs!8458 m!245043))

(assert (=> b!219187 d!58729))

(declare-fun d!58731 () Bool)

(assert (=> d!58731 (= (apply!202 lt!111874 lt!111875) (get!2681 (getValueByKey!261 (toList!1602 lt!111874) lt!111875)))))

(declare-fun bs!8459 () Bool)

(assert (= bs!8459 d!58731))

(declare-fun m!245045 () Bool)

(assert (=> bs!8459 m!245045))

(assert (=> bs!8459 m!245045))

(declare-fun m!245047 () Bool)

(assert (=> bs!8459 m!245047))

(assert (=> b!219187 d!58731))

(declare-fun d!58733 () Bool)

(declare-fun e!142634 () Bool)

(assert (=> d!58733 e!142634))

(declare-fun res!107468 () Bool)

(assert (=> d!58733 (=> res!107468 e!142634)))

(declare-fun lt!111909 () Bool)

(assert (=> d!58733 (= res!107468 (not lt!111909))))

(declare-fun lt!111907 () Bool)

(assert (=> d!58733 (= lt!111909 lt!111907)))

(declare-fun lt!111910 () Unit!6511)

(declare-fun e!142633 () Unit!6511)

(assert (=> d!58733 (= lt!111910 e!142633)))

(declare-fun c!36500 () Bool)

(assert (=> d!58733 (= c!36500 lt!111907)))

(assert (=> d!58733 (= lt!111907 (containsKey!252 (toList!1602 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))) lt!111880))))

(assert (=> d!58733 (= (contains!1457 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))) lt!111880) lt!111909)))

(declare-fun b!219265 () Bool)

(declare-fun lt!111908 () Unit!6511)

(assert (=> b!219265 (= e!142633 lt!111908)))

(assert (=> b!219265 (= lt!111908 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1602 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))) lt!111880))))

(assert (=> b!219265 (isDefined!201 (getValueByKey!261 (toList!1602 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))) lt!111880))))

(declare-fun b!219266 () Bool)

(declare-fun Unit!6522 () Unit!6511)

(assert (=> b!219266 (= e!142633 Unit!6522)))

(declare-fun b!219267 () Bool)

(assert (=> b!219267 (= e!142634 (isDefined!201 (getValueByKey!261 (toList!1602 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))) lt!111880)))))

(assert (= (and d!58733 c!36500) b!219265))

(assert (= (and d!58733 (not c!36500)) b!219266))

(assert (= (and d!58733 (not res!107468)) b!219267))

(declare-fun m!245049 () Bool)

(assert (=> d!58733 m!245049))

(declare-fun m!245051 () Bool)

(assert (=> b!219265 m!245051))

(declare-fun m!245053 () Bool)

(assert (=> b!219265 m!245053))

(assert (=> b!219265 m!245053))

(declare-fun m!245055 () Bool)

(assert (=> b!219265 m!245055))

(assert (=> b!219267 m!245053))

(assert (=> b!219267 m!245053))

(assert (=> b!219267 m!245055))

(assert (=> b!219187 d!58733))

(declare-fun d!58735 () Bool)

(assert (=> d!58735 (= (apply!202 (+!592 lt!111874 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))) lt!111875) (get!2681 (getValueByKey!261 (toList!1602 (+!592 lt!111874 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))) lt!111875)))))

(declare-fun bs!8460 () Bool)

(assert (= bs!8460 d!58735))

(declare-fun m!245057 () Bool)

(assert (=> bs!8460 m!245057))

(assert (=> bs!8460 m!245057))

(declare-fun m!245059 () Bool)

(assert (=> bs!8460 m!245059))

(assert (=> b!219187 d!58735))

(declare-fun d!58737 () Bool)

(declare-fun e!142635 () Bool)

(assert (=> d!58737 e!142635))

(declare-fun res!107469 () Bool)

(assert (=> d!58737 (=> (not res!107469) (not e!142635))))

(declare-fun lt!111914 () ListLongMap!3173)

(assert (=> d!58737 (= res!107469 (contains!1457 lt!111914 (_1!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))))))

(declare-fun lt!111912 () List!3154)

(assert (=> d!58737 (= lt!111914 (ListLongMap!3174 lt!111912))))

(declare-fun lt!111913 () Unit!6511)

(declare-fun lt!111911 () Unit!6511)

(assert (=> d!58737 (= lt!111913 lt!111911)))

(assert (=> d!58737 (= (getValueByKey!261 lt!111912 (_1!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))))))

(assert (=> d!58737 (= lt!111911 (lemmaContainsTupThenGetReturnValue!147 lt!111912 (_1!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))))))

(assert (=> d!58737 (= lt!111912 (insertStrictlySorted!150 (toList!1602 lt!111871) (_1!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))))))

(assert (=> d!58737 (= (+!592 lt!111871 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))) lt!111914)))

(declare-fun b!219268 () Bool)

(declare-fun res!107470 () Bool)

(assert (=> b!219268 (=> (not res!107470) (not e!142635))))

(assert (=> b!219268 (= res!107470 (= (getValueByKey!261 (toList!1602 lt!111914) (_1!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))))))))

(declare-fun b!219269 () Bool)

(assert (=> b!219269 (= e!142635 (contains!1460 (toList!1602 lt!111914) (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))))))

(assert (= (and d!58737 res!107469) b!219268))

(assert (= (and b!219268 res!107470) b!219269))

(declare-fun m!245061 () Bool)

(assert (=> d!58737 m!245061))

(declare-fun m!245063 () Bool)

(assert (=> d!58737 m!245063))

(declare-fun m!245065 () Bool)

(assert (=> d!58737 m!245065))

(declare-fun m!245067 () Bool)

(assert (=> d!58737 m!245067))

(declare-fun m!245069 () Bool)

(assert (=> b!219268 m!245069))

(declare-fun m!245071 () Bool)

(assert (=> b!219269 m!245071))

(assert (=> b!219187 d!58737))

(declare-fun d!58739 () Bool)

(assert (=> d!58739 (contains!1457 (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))) lt!111880)))

(declare-fun lt!111917 () Unit!6511)

(declare-fun choose!1096 (ListLongMap!3173 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6511)

(assert (=> d!58739 (= lt!111917 (choose!1096 lt!111883 lt!111878 (zeroValue!3975 thiss!1504) lt!111880))))

(assert (=> d!58739 (contains!1457 lt!111883 lt!111880)))

(assert (=> d!58739 (= (addStillContains!178 lt!111883 lt!111878 (zeroValue!3975 thiss!1504) lt!111880) lt!111917)))

(declare-fun bs!8461 () Bool)

(assert (= bs!8461 d!58739))

(assert (=> bs!8461 m!244969))

(assert (=> bs!8461 m!244969))

(assert (=> bs!8461 m!244989))

(declare-fun m!245073 () Bool)

(assert (=> bs!8461 m!245073))

(declare-fun m!245075 () Bool)

(assert (=> bs!8461 m!245075))

(assert (=> b!219187 d!58739))

(declare-fun d!58741 () Bool)

(declare-fun e!142636 () Bool)

(assert (=> d!58741 e!142636))

(declare-fun res!107471 () Bool)

(assert (=> d!58741 (=> (not res!107471) (not e!142636))))

(declare-fun lt!111921 () ListLongMap!3173)

(assert (=> d!58741 (= res!107471 (contains!1457 lt!111921 (_1!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))))))

(declare-fun lt!111919 () List!3154)

(assert (=> d!58741 (= lt!111921 (ListLongMap!3174 lt!111919))))

(declare-fun lt!111920 () Unit!6511)

(declare-fun lt!111918 () Unit!6511)

(assert (=> d!58741 (= lt!111920 lt!111918)))

(assert (=> d!58741 (= (getValueByKey!261 lt!111919 (_1!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))))))

(assert (=> d!58741 (= lt!111918 (lemmaContainsTupThenGetReturnValue!147 lt!111919 (_1!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))))))

(assert (=> d!58741 (= lt!111919 (insertStrictlySorted!150 (toList!1602 lt!111868) (_1!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))))))

(assert (=> d!58741 (= (+!592 lt!111868 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))) lt!111921)))

(declare-fun b!219271 () Bool)

(declare-fun res!107472 () Bool)

(assert (=> b!219271 (=> (not res!107472) (not e!142636))))

(assert (=> b!219271 (= res!107472 (= (getValueByKey!261 (toList!1602 lt!111921) (_1!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))))))))

(declare-fun b!219272 () Bool)

(assert (=> b!219272 (= e!142636 (contains!1460 (toList!1602 lt!111921) (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))))))

(assert (= (and d!58741 res!107471) b!219271))

(assert (= (and b!219271 res!107472) b!219272))

(declare-fun m!245077 () Bool)

(assert (=> d!58741 m!245077))

(declare-fun m!245079 () Bool)

(assert (=> d!58741 m!245079))

(declare-fun m!245081 () Bool)

(assert (=> d!58741 m!245081))

(declare-fun m!245083 () Bool)

(assert (=> d!58741 m!245083))

(declare-fun m!245085 () Bool)

(assert (=> b!219271 m!245085))

(declare-fun m!245087 () Bool)

(assert (=> b!219272 m!245087))

(assert (=> b!219187 d!58741))

(declare-fun d!58743 () Bool)

(assert (=> d!58743 (= (apply!202 (+!592 lt!111868 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))) lt!111867) (apply!202 lt!111868 lt!111867))))

(declare-fun lt!111924 () Unit!6511)

(declare-fun choose!1097 (ListLongMap!3173 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6511)

(assert (=> d!58743 (= lt!111924 (choose!1097 lt!111868 lt!111872 (minValue!3975 thiss!1504) lt!111867))))

(declare-fun e!142639 () Bool)

(assert (=> d!58743 e!142639))

(declare-fun res!107475 () Bool)

(assert (=> d!58743 (=> (not res!107475) (not e!142639))))

(assert (=> d!58743 (= res!107475 (contains!1457 lt!111868 lt!111867))))

(assert (=> d!58743 (= (addApplyDifferent!178 lt!111868 lt!111872 (minValue!3975 thiss!1504) lt!111867) lt!111924)))

(declare-fun b!219276 () Bool)

(assert (=> b!219276 (= e!142639 (not (= lt!111867 lt!111872)))))

(assert (= (and d!58743 res!107475) b!219276))

(declare-fun m!245089 () Bool)

(assert (=> d!58743 m!245089))

(assert (=> d!58743 m!244961))

(assert (=> d!58743 m!244971))

(assert (=> d!58743 m!244973))

(declare-fun m!245091 () Bool)

(assert (=> d!58743 m!245091))

(assert (=> d!58743 m!244971))

(assert (=> b!219187 d!58743))

(declare-fun d!58745 () Bool)

(assert (=> d!58745 (= (apply!202 (+!592 lt!111874 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))) lt!111875) (apply!202 lt!111874 lt!111875))))

(declare-fun lt!111925 () Unit!6511)

(assert (=> d!58745 (= lt!111925 (choose!1097 lt!111874 lt!111869 (zeroValue!3975 thiss!1504) lt!111875))))

(declare-fun e!142640 () Bool)

(assert (=> d!58745 e!142640))

(declare-fun res!107476 () Bool)

(assert (=> d!58745 (=> (not res!107476) (not e!142640))))

(assert (=> d!58745 (= res!107476 (contains!1457 lt!111874 lt!111875))))

(assert (=> d!58745 (= (addApplyDifferent!178 lt!111874 lt!111869 (zeroValue!3975 thiss!1504) lt!111875) lt!111925)))

(declare-fun b!219277 () Bool)

(assert (=> b!219277 (= e!142640 (not (= lt!111875 lt!111869)))))

(assert (= (and d!58745 res!107476) b!219277))

(declare-fun m!245093 () Bool)

(assert (=> d!58745 m!245093))

(assert (=> d!58745 m!244965))

(assert (=> d!58745 m!244979))

(assert (=> d!58745 m!244981))

(declare-fun m!245095 () Bool)

(assert (=> d!58745 m!245095))

(assert (=> d!58745 m!244979))

(assert (=> b!219187 d!58745))

(declare-fun d!58747 () Bool)

(assert (=> d!58747 (= (apply!202 (+!592 lt!111871 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))) lt!111870) (get!2681 (getValueByKey!261 (toList!1602 (+!592 lt!111871 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504)))) lt!111870)))))

(declare-fun bs!8462 () Bool)

(assert (= bs!8462 d!58747))

(declare-fun m!245097 () Bool)

(assert (=> bs!8462 m!245097))

(assert (=> bs!8462 m!245097))

(declare-fun m!245099 () Bool)

(assert (=> bs!8462 m!245099))

(assert (=> b!219187 d!58747))

(declare-fun d!58749 () Bool)

(assert (=> d!58749 (= (apply!202 (+!592 lt!111868 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504))) lt!111867) (get!2681 (getValueByKey!261 (toList!1602 (+!592 lt!111868 (tuple2!4259 lt!111872 (minValue!3975 thiss!1504)))) lt!111867)))))

(declare-fun bs!8463 () Bool)

(assert (= bs!8463 d!58749))

(declare-fun m!245101 () Bool)

(assert (=> bs!8463 m!245101))

(assert (=> bs!8463 m!245101))

(declare-fun m!245103 () Bool)

(assert (=> bs!8463 m!245103))

(assert (=> b!219187 d!58749))

(declare-fun d!58751 () Bool)

(assert (=> d!58751 (= (apply!202 (+!592 lt!111871 (tuple2!4259 lt!111879 (minValue!3975 thiss!1504))) lt!111870) (apply!202 lt!111871 lt!111870))))

(declare-fun lt!111926 () Unit!6511)

(assert (=> d!58751 (= lt!111926 (choose!1097 lt!111871 lt!111879 (minValue!3975 thiss!1504) lt!111870))))

(declare-fun e!142641 () Bool)

(assert (=> d!58751 e!142641))

(declare-fun res!107477 () Bool)

(assert (=> d!58751 (=> (not res!107477) (not e!142641))))

(assert (=> d!58751 (= res!107477 (contains!1457 lt!111871 lt!111870))))

(assert (=> d!58751 (= (addApplyDifferent!178 lt!111871 lt!111879 (minValue!3975 thiss!1504) lt!111870) lt!111926)))

(declare-fun b!219278 () Bool)

(assert (=> b!219278 (= e!142641 (not (= lt!111870 lt!111879)))))

(assert (= (and d!58751 res!107477) b!219278))

(declare-fun m!245105 () Bool)

(assert (=> d!58751 m!245105))

(assert (=> d!58751 m!244963))

(assert (=> d!58751 m!244975))

(assert (=> d!58751 m!244977))

(declare-fun m!245107 () Bool)

(assert (=> d!58751 m!245107))

(assert (=> d!58751 m!244975))

(assert (=> b!219187 d!58751))

(declare-fun b!219303 () Bool)

(declare-fun lt!111945 () Unit!6511)

(declare-fun lt!111947 () Unit!6511)

(assert (=> b!219303 (= lt!111945 lt!111947)))

(declare-fun lt!111942 () (_ BitVec 64))

(declare-fun lt!111944 () (_ BitVec 64))

(declare-fun lt!111946 () V!7313)

(declare-fun lt!111943 () ListLongMap!3173)

(assert (=> b!219303 (not (contains!1457 (+!592 lt!111943 (tuple2!4259 lt!111942 lt!111946)) lt!111944))))

(declare-fun addStillNotContains!112 (ListLongMap!3173 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6511)

(assert (=> b!219303 (= lt!111947 (addStillNotContains!112 lt!111943 lt!111942 lt!111946 lt!111944))))

(assert (=> b!219303 (= lt!111944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!219303 (= lt!111946 (get!2680 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219303 (= lt!111942 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!20484 () ListLongMap!3173)

(assert (=> b!219303 (= lt!111943 call!20484)))

(declare-fun e!142658 () ListLongMap!3173)

(assert (=> b!219303 (= e!142658 (+!592 call!20484 (tuple2!4259 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000) (get!2680 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!219304 () Bool)

(declare-fun e!142661 () Bool)

(declare-fun e!142660 () Bool)

(assert (=> b!219304 (= e!142661 e!142660)))

(declare-fun c!36510 () Bool)

(declare-fun e!142662 () Bool)

(assert (=> b!219304 (= c!36510 e!142662)))

(declare-fun res!107486 () Bool)

(assert (=> b!219304 (=> (not res!107486) (not e!142662))))

(assert (=> b!219304 (= res!107486 (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219305 () Bool)

(declare-fun e!142659 () Bool)

(assert (=> b!219305 (= e!142660 e!142659)))

(declare-fun c!36512 () Bool)

(assert (=> b!219305 (= c!36512 (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219306 () Bool)

(declare-fun e!142656 () ListLongMap!3173)

(assert (=> b!219306 (= e!142656 (ListLongMap!3174 Nil!3151))))

(declare-fun b!219307 () Bool)

(assert (=> b!219307 (= e!142658 call!20484)))

(declare-fun b!219308 () Bool)

(declare-fun res!107487 () Bool)

(assert (=> b!219308 (=> (not res!107487) (not e!142661))))

(declare-fun lt!111941 () ListLongMap!3173)

(assert (=> b!219308 (= res!107487 (not (contains!1457 lt!111941 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219309 () Bool)

(assert (=> b!219309 (= e!142656 e!142658)))

(declare-fun c!36511 () Bool)

(assert (=> b!219309 (= c!36511 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219310 () Bool)

(assert (=> b!219310 (= e!142659 (= lt!111941 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4134 thiss!1504))))))

(declare-fun b!219311 () Bool)

(assert (=> b!219311 (= e!142662 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219311 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!219312 () Bool)

(assert (=> b!219312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> b!219312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5421 (_values!4117 thiss!1504))))))

(declare-fun e!142657 () Bool)

(assert (=> b!219312 (= e!142657 (= (apply!202 lt!111941 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)) (get!2680 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20481 () Bool)

(assert (=> bm!20481 (= call!20484 (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4134 thiss!1504)))))

(declare-fun d!58753 () Bool)

(assert (=> d!58753 e!142661))

(declare-fun res!107489 () Bool)

(assert (=> d!58753 (=> (not res!107489) (not e!142661))))

(assert (=> d!58753 (= res!107489 (not (contains!1457 lt!111941 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58753 (= lt!111941 e!142656)))

(declare-fun c!36509 () Bool)

(assert (=> d!58753 (= c!36509 (bvsge #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> d!58753 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58753 (= (getCurrentListMapNoExtraKeys!518 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) lt!111941)))

(declare-fun b!219313 () Bool)

(assert (=> b!219313 (= e!142660 e!142657)))

(assert (=> b!219313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun res!107488 () Bool)

(assert (=> b!219313 (= res!107488 (contains!1457 lt!111941 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219313 (=> (not res!107488) (not e!142657))))

(declare-fun b!219314 () Bool)

(declare-fun isEmpty!508 (ListLongMap!3173) Bool)

(assert (=> b!219314 (= e!142659 (isEmpty!508 lt!111941))))

(assert (= (and d!58753 c!36509) b!219306))

(assert (= (and d!58753 (not c!36509)) b!219309))

(assert (= (and b!219309 c!36511) b!219303))

(assert (= (and b!219309 (not c!36511)) b!219307))

(assert (= (or b!219303 b!219307) bm!20481))

(assert (= (and d!58753 res!107489) b!219308))

(assert (= (and b!219308 res!107487) b!219304))

(assert (= (and b!219304 res!107486) b!219311))

(assert (= (and b!219304 c!36510) b!219313))

(assert (= (and b!219304 (not c!36510)) b!219305))

(assert (= (and b!219313 res!107488) b!219312))

(assert (= (and b!219305 c!36512) b!219310))

(assert (= (and b!219305 (not c!36512)) b!219314))

(declare-fun b_lambda!7857 () Bool)

(assert (=> (not b_lambda!7857) (not b!219303)))

(assert (=> b!219303 t!8106))

(declare-fun b_and!12801 () Bool)

(assert (= b_and!12799 (and (=> t!8106 result!5065) b_and!12801)))

(declare-fun b_lambda!7859 () Bool)

(assert (=> (not b_lambda!7859) (not b!219312)))

(assert (=> b!219312 t!8106))

(declare-fun b_and!12803 () Bool)

(assert (= b_and!12801 (and (=> t!8106 result!5065) b_and!12803)))

(declare-fun m!245109 () Bool)

(assert (=> bm!20481 m!245109))

(assert (=> b!219311 m!244937))

(assert (=> b!219311 m!244937))

(assert (=> b!219311 m!244943))

(declare-fun m!245111 () Bool)

(assert (=> b!219308 m!245111))

(assert (=> b!219313 m!244937))

(assert (=> b!219313 m!244937))

(declare-fun m!245113 () Bool)

(assert (=> b!219313 m!245113))

(declare-fun m!245115 () Bool)

(assert (=> d!58753 m!245115))

(assert (=> d!58753 m!244913))

(assert (=> b!219309 m!244937))

(assert (=> b!219309 m!244937))

(assert (=> b!219309 m!244943))

(assert (=> b!219310 m!245109))

(assert (=> b!219303 m!244951))

(assert (=> b!219303 m!244953))

(declare-fun m!245117 () Bool)

(assert (=> b!219303 m!245117))

(declare-fun m!245119 () Bool)

(assert (=> b!219303 m!245119))

(declare-fun m!245121 () Bool)

(assert (=> b!219303 m!245121))

(assert (=> b!219303 m!244953))

(assert (=> b!219303 m!244951))

(assert (=> b!219303 m!244957))

(declare-fun m!245123 () Bool)

(assert (=> b!219303 m!245123))

(assert (=> b!219303 m!244937))

(assert (=> b!219303 m!245119))

(declare-fun m!245125 () Bool)

(assert (=> b!219314 m!245125))

(assert (=> b!219312 m!244937))

(declare-fun m!245127 () Bool)

(assert (=> b!219312 m!245127))

(assert (=> b!219312 m!244951))

(assert (=> b!219312 m!244953))

(assert (=> b!219312 m!244953))

(assert (=> b!219312 m!244951))

(assert (=> b!219312 m!244957))

(assert (=> b!219312 m!244937))

(assert (=> b!219187 d!58753))

(declare-fun d!58755 () Bool)

(declare-fun e!142663 () Bool)

(assert (=> d!58755 e!142663))

(declare-fun res!107490 () Bool)

(assert (=> d!58755 (=> (not res!107490) (not e!142663))))

(declare-fun lt!111951 () ListLongMap!3173)

(assert (=> d!58755 (= res!107490 (contains!1457 lt!111951 (_1!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))))))

(declare-fun lt!111949 () List!3154)

(assert (=> d!58755 (= lt!111951 (ListLongMap!3174 lt!111949))))

(declare-fun lt!111950 () Unit!6511)

(declare-fun lt!111948 () Unit!6511)

(assert (=> d!58755 (= lt!111950 lt!111948)))

(assert (=> d!58755 (= (getValueByKey!261 lt!111949 (_1!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58755 (= lt!111948 (lemmaContainsTupThenGetReturnValue!147 lt!111949 (_1!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58755 (= lt!111949 (insertStrictlySorted!150 (toList!1602 lt!111883) (_1!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58755 (= (+!592 lt!111883 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))) lt!111951)))

(declare-fun b!219315 () Bool)

(declare-fun res!107491 () Bool)

(assert (=> b!219315 (=> (not res!107491) (not e!142663))))

(assert (=> b!219315 (= res!107491 (= (getValueByKey!261 (toList!1602 lt!111951) (_1!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))))))))

(declare-fun b!219316 () Bool)

(assert (=> b!219316 (= e!142663 (contains!1460 (toList!1602 lt!111951) (tuple2!4259 lt!111878 (zeroValue!3975 thiss!1504))))))

(assert (= (and d!58755 res!107490) b!219315))

(assert (= (and b!219315 res!107491) b!219316))

(declare-fun m!245129 () Bool)

(assert (=> d!58755 m!245129))

(declare-fun m!245131 () Bool)

(assert (=> d!58755 m!245131))

(declare-fun m!245133 () Bool)

(assert (=> d!58755 m!245133))

(declare-fun m!245135 () Bool)

(assert (=> d!58755 m!245135))

(declare-fun m!245137 () Bool)

(assert (=> b!219315 m!245137))

(declare-fun m!245139 () Bool)

(assert (=> b!219316 m!245139))

(assert (=> b!219187 d!58755))

(declare-fun d!58757 () Bool)

(declare-fun e!142664 () Bool)

(assert (=> d!58757 e!142664))

(declare-fun res!107492 () Bool)

(assert (=> d!58757 (=> (not res!107492) (not e!142664))))

(declare-fun lt!111955 () ListLongMap!3173)

(assert (=> d!58757 (= res!107492 (contains!1457 lt!111955 (_1!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))))))

(declare-fun lt!111953 () List!3154)

(assert (=> d!58757 (= lt!111955 (ListLongMap!3174 lt!111953))))

(declare-fun lt!111954 () Unit!6511)

(declare-fun lt!111952 () Unit!6511)

(assert (=> d!58757 (= lt!111954 lt!111952)))

(assert (=> d!58757 (= (getValueByKey!261 lt!111953 (_1!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58757 (= lt!111952 (lemmaContainsTupThenGetReturnValue!147 lt!111953 (_1!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58757 (= lt!111953 (insertStrictlySorted!150 (toList!1602 lt!111874) (_1!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58757 (= (+!592 lt!111874 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))) lt!111955)))

(declare-fun b!219317 () Bool)

(declare-fun res!107493 () Bool)

(assert (=> b!219317 (=> (not res!107493) (not e!142664))))

(assert (=> b!219317 (= res!107493 (= (getValueByKey!261 (toList!1602 lt!111955) (_1!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))))))))

(declare-fun b!219318 () Bool)

(assert (=> b!219318 (= e!142664 (contains!1460 (toList!1602 lt!111955) (tuple2!4259 lt!111869 (zeroValue!3975 thiss!1504))))))

(assert (= (and d!58757 res!107492) b!219317))

(assert (= (and b!219317 res!107493) b!219318))

(declare-fun m!245141 () Bool)

(assert (=> d!58757 m!245141))

(declare-fun m!245143 () Bool)

(assert (=> d!58757 m!245143))

(declare-fun m!245145 () Bool)

(assert (=> d!58757 m!245145))

(declare-fun m!245147 () Bool)

(assert (=> d!58757 m!245147))

(declare-fun m!245149 () Bool)

(assert (=> b!219317 m!245149))

(declare-fun m!245151 () Bool)

(assert (=> b!219318 m!245151))

(assert (=> b!219187 d!58757))

(declare-fun b!219327 () Bool)

(declare-fun e!142673 () Bool)

(declare-fun e!142672 () Bool)

(assert (=> b!219327 (= e!142673 e!142672)))

(declare-fun c!36515 () Bool)

(assert (=> b!219327 (= c!36515 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219328 () Bool)

(declare-fun e!142671 () Bool)

(declare-fun call!20487 () Bool)

(assert (=> b!219328 (= e!142671 call!20487)))

(declare-fun b!219329 () Bool)

(assert (=> b!219329 (= e!142672 e!142671)))

(declare-fun lt!111963 () (_ BitVec 64))

(assert (=> b!219329 (= lt!111963 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111964 () Unit!6511)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10739 (_ BitVec 64) (_ BitVec 32)) Unit!6511)

(assert (=> b!219329 (= lt!111964 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6184 thiss!1504) lt!111963 #b00000000000000000000000000000000))))

(assert (=> b!219329 (arrayContainsKey!0 (_keys!6184 thiss!1504) lt!111963 #b00000000000000000000000000000000)))

(declare-fun lt!111962 () Unit!6511)

(assert (=> b!219329 (= lt!111962 lt!111964)))

(declare-fun res!107499 () Bool)

(assert (=> b!219329 (= res!107499 (= (seekEntryOrOpen!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000) (_keys!6184 thiss!1504) (mask!9917 thiss!1504)) (Found!771 #b00000000000000000000000000000000)))))

(assert (=> b!219329 (=> (not res!107499) (not e!142671))))

(declare-fun bm!20484 () Bool)

(assert (=> bm!20484 (= call!20487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun d!58759 () Bool)

(declare-fun res!107498 () Bool)

(assert (=> d!58759 (=> res!107498 e!142673)))

(assert (=> d!58759 (= res!107498 (bvsge #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> d!58759 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)) e!142673)))

(declare-fun b!219330 () Bool)

(assert (=> b!219330 (= e!142672 call!20487)))

(assert (= (and d!58759 (not res!107498)) b!219327))

(assert (= (and b!219327 c!36515) b!219329))

(assert (= (and b!219327 (not c!36515)) b!219330))

(assert (= (and b!219329 res!107499) b!219328))

(assert (= (or b!219328 b!219330) bm!20484))

(assert (=> b!219327 m!244937))

(assert (=> b!219327 m!244937))

(assert (=> b!219327 m!244943))

(assert (=> b!219329 m!244937))

(declare-fun m!245153 () Bool)

(assert (=> b!219329 m!245153))

(declare-fun m!245155 () Bool)

(assert (=> b!219329 m!245155))

(assert (=> b!219329 m!244937))

(declare-fun m!245157 () Bool)

(assert (=> b!219329 m!245157))

(declare-fun m!245159 () Bool)

(assert (=> bm!20484 m!245159))

(assert (=> b!219231 d!58759))

(assert (=> bm!20463 d!58753))

(declare-fun d!58761 () Bool)

(declare-fun res!107509 () Bool)

(declare-fun e!142676 () Bool)

(assert (=> d!58761 (=> (not res!107509) (not e!142676))))

(assert (=> d!58761 (= res!107509 (validMask!0 (mask!9917 thiss!1504)))))

(assert (=> d!58761 (= (simpleValid!225 thiss!1504) e!142676)))

(declare-fun b!219339 () Bool)

(declare-fun res!107510 () Bool)

(assert (=> b!219339 (=> (not res!107510) (not e!142676))))

(assert (=> b!219339 (= res!107510 (and (= (size!5421 (_values!4117 thiss!1504)) (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001)) (= (size!5422 (_keys!6184 thiss!1504)) (size!5421 (_values!4117 thiss!1504))) (bvsge (_size!1530 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1530 thiss!1504) (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!219342 () Bool)

(assert (=> b!219342 (= e!142676 (and (bvsge (extraKeys!3871 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3871 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1530 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!219340 () Bool)

(declare-fun res!107508 () Bool)

(assert (=> b!219340 (=> (not res!107508) (not e!142676))))

(declare-fun size!5427 (LongMapFixedSize!2962) (_ BitVec 32))

(assert (=> b!219340 (= res!107508 (bvsge (size!5427 thiss!1504) (_size!1530 thiss!1504)))))

(declare-fun b!219341 () Bool)

(declare-fun res!107511 () Bool)

(assert (=> b!219341 (=> (not res!107511) (not e!142676))))

(assert (=> b!219341 (= res!107511 (= (size!5427 thiss!1504) (bvadd (_size!1530 thiss!1504) (bvsdiv (bvadd (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58761 res!107509) b!219339))

(assert (= (and b!219339 res!107510) b!219340))

(assert (= (and b!219340 res!107508) b!219341))

(assert (= (and b!219341 res!107511) b!219342))

(assert (=> d!58761 m!244913))

(declare-fun m!245161 () Bool)

(assert (=> b!219340 m!245161))

(assert (=> b!219341 m!245161))

(assert (=> d!58717 d!58761))

(declare-fun b!219351 () Bool)

(declare-fun e!142682 () (_ BitVec 32))

(declare-fun e!142681 () (_ BitVec 32))

(assert (=> b!219351 (= e!142682 e!142681)))

(declare-fun c!36521 () Bool)

(assert (=> b!219351 (= c!36521 (validKeyInArray!0 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58763 () Bool)

(declare-fun lt!111967 () (_ BitVec 32))

(assert (=> d!58763 (and (bvsge lt!111967 #b00000000000000000000000000000000) (bvsle lt!111967 (bvsub (size!5422 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58763 (= lt!111967 e!142682)))

(declare-fun c!36520 () Bool)

(assert (=> d!58763 (= c!36520 (bvsge #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> d!58763 (and (bvsle #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5422 (_keys!6184 thiss!1504)) (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> d!58763 (= (arrayCountValidKeys!0 (_keys!6184 thiss!1504) #b00000000000000000000000000000000 (size!5422 (_keys!6184 thiss!1504))) lt!111967)))

(declare-fun b!219352 () Bool)

(declare-fun call!20490 () (_ BitVec 32))

(assert (=> b!219352 (= e!142681 (bvadd #b00000000000000000000000000000001 call!20490))))

(declare-fun b!219353 () Bool)

(assert (=> b!219353 (= e!142682 #b00000000000000000000000000000000)))

(declare-fun bm!20487 () Bool)

(assert (=> bm!20487 (= call!20490 (arrayCountValidKeys!0 (_keys!6184 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219354 () Bool)

(assert (=> b!219354 (= e!142681 call!20490)))

(assert (= (and d!58763 c!36520) b!219353))

(assert (= (and d!58763 (not c!36520)) b!219351))

(assert (= (and b!219351 c!36521) b!219352))

(assert (= (and b!219351 (not c!36521)) b!219354))

(assert (= (or b!219352 b!219354) bm!20487))

(assert (=> b!219351 m!244937))

(assert (=> b!219351 m!244937))

(assert (=> b!219351 m!244943))

(declare-fun m!245163 () Bool)

(assert (=> bm!20487 m!245163))

(assert (=> b!219230 d!58763))

(declare-fun d!58765 () Bool)

(declare-fun e!142684 () Bool)

(assert (=> d!58765 e!142684))

(declare-fun res!107512 () Bool)

(assert (=> d!58765 (=> res!107512 e!142684)))

(declare-fun lt!111970 () Bool)

(assert (=> d!58765 (= res!107512 (not lt!111970))))

(declare-fun lt!111968 () Bool)

(assert (=> d!58765 (= lt!111970 lt!111968)))

(declare-fun lt!111971 () Unit!6511)

(declare-fun e!142683 () Unit!6511)

(assert (=> d!58765 (= lt!111971 e!142683)))

(declare-fun c!36522 () Bool)

(assert (=> d!58765 (= c!36522 lt!111968)))

(assert (=> d!58765 (= lt!111968 (containsKey!252 (toList!1602 lt!111882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58765 (= (contains!1457 lt!111882 #b1000000000000000000000000000000000000000000000000000000000000000) lt!111970)))

(declare-fun b!219355 () Bool)

(declare-fun lt!111969 () Unit!6511)

(assert (=> b!219355 (= e!142683 lt!111969)))

(assert (=> b!219355 (= lt!111969 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1602 lt!111882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219355 (isDefined!201 (getValueByKey!261 (toList!1602 lt!111882) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219356 () Bool)

(declare-fun Unit!6523 () Unit!6511)

(assert (=> b!219356 (= e!142683 Unit!6523)))

(declare-fun b!219357 () Bool)

(assert (=> b!219357 (= e!142684 (isDefined!201 (getValueByKey!261 (toList!1602 lt!111882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58765 c!36522) b!219355))

(assert (= (and d!58765 (not c!36522)) b!219356))

(assert (= (and d!58765 (not res!107512)) b!219357))

(declare-fun m!245165 () Bool)

(assert (=> d!58765 m!245165))

(declare-fun m!245167 () Bool)

(assert (=> b!219355 m!245167))

(declare-fun m!245169 () Bool)

(assert (=> b!219355 m!245169))

(assert (=> b!219355 m!245169))

(declare-fun m!245171 () Bool)

(assert (=> b!219355 m!245171))

(assert (=> b!219357 m!245169))

(assert (=> b!219357 m!245169))

(assert (=> b!219357 m!245171))

(assert (=> bm!20468 d!58765))

(declare-fun d!58767 () Bool)

(assert (=> d!58767 (= (inRange!0 (index!5255 lt!111805) (mask!9917 thiss!1504)) (and (bvsge (index!5255 lt!111805) #b00000000000000000000000000000000) (bvslt (index!5255 lt!111805) (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!219118 d!58767))

(declare-fun d!58769 () Bool)

(declare-fun e!142685 () Bool)

(assert (=> d!58769 e!142685))

(declare-fun res!107513 () Bool)

(assert (=> d!58769 (=> (not res!107513) (not e!142685))))

(declare-fun lt!111975 () ListLongMap!3173)

(assert (=> d!58769 (= res!107513 (contains!1457 lt!111975 (_1!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(declare-fun lt!111973 () List!3154)

(assert (=> d!58769 (= lt!111975 (ListLongMap!3174 lt!111973))))

(declare-fun lt!111974 () Unit!6511)

(declare-fun lt!111972 () Unit!6511)

(assert (=> d!58769 (= lt!111974 lt!111972)))

(assert (=> d!58769 (= (getValueByKey!261 lt!111973 (_1!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (=> d!58769 (= lt!111972 (lemmaContainsTupThenGetReturnValue!147 lt!111973 (_1!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (=> d!58769 (= lt!111973 (insertStrictlySorted!150 (toList!1602 call!20469) (_1!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))) (_2!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (=> d!58769 (= (+!592 call!20469 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))) lt!111975)))

(declare-fun b!219358 () Bool)

(declare-fun res!107514 () Bool)

(assert (=> b!219358 (=> (not res!107514) (not e!142685))))

(assert (=> b!219358 (= res!107514 (= (getValueByKey!261 (toList!1602 lt!111975) (_1!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (Some!266 (_2!2140 (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(declare-fun b!219359 () Bool)

(assert (=> b!219359 (= e!142685 (contains!1460 (toList!1602 lt!111975) (tuple2!4259 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))

(assert (= (and d!58769 res!107513) b!219358))

(assert (= (and b!219358 res!107514) b!219359))

(declare-fun m!245173 () Bool)

(assert (=> d!58769 m!245173))

(declare-fun m!245175 () Bool)

(assert (=> d!58769 m!245175))

(declare-fun m!245177 () Bool)

(assert (=> d!58769 m!245177))

(declare-fun m!245179 () Bool)

(assert (=> d!58769 m!245179))

(declare-fun m!245181 () Bool)

(assert (=> b!219358 m!245181))

(declare-fun m!245183 () Bool)

(assert (=> b!219359 m!245183))

(assert (=> b!219185 d!58769))

(declare-fun d!58771 () Bool)

(assert (=> d!58771 (= (validMask!0 (mask!9917 thiss!1504)) (and (or (= (mask!9917 thiss!1504) #b00000000000000000000000000000111) (= (mask!9917 thiss!1504) #b00000000000000000000000000001111) (= (mask!9917 thiss!1504) #b00000000000000000000000000011111) (= (mask!9917 thiss!1504) #b00000000000000000000000000111111) (= (mask!9917 thiss!1504) #b00000000000000000000000001111111) (= (mask!9917 thiss!1504) #b00000000000000000000000011111111) (= (mask!9917 thiss!1504) #b00000000000000000000000111111111) (= (mask!9917 thiss!1504) #b00000000000000000000001111111111) (= (mask!9917 thiss!1504) #b00000000000000000000011111111111) (= (mask!9917 thiss!1504) #b00000000000000000000111111111111) (= (mask!9917 thiss!1504) #b00000000000000000001111111111111) (= (mask!9917 thiss!1504) #b00000000000000000011111111111111) (= (mask!9917 thiss!1504) #b00000000000000000111111111111111) (= (mask!9917 thiss!1504) #b00000000000000001111111111111111) (= (mask!9917 thiss!1504) #b00000000000000011111111111111111) (= (mask!9917 thiss!1504) #b00000000000000111111111111111111) (= (mask!9917 thiss!1504) #b00000000000001111111111111111111) (= (mask!9917 thiss!1504) #b00000000000011111111111111111111) (= (mask!9917 thiss!1504) #b00000000000111111111111111111111) (= (mask!9917 thiss!1504) #b00000000001111111111111111111111) (= (mask!9917 thiss!1504) #b00000000011111111111111111111111) (= (mask!9917 thiss!1504) #b00000000111111111111111111111111) (= (mask!9917 thiss!1504) #b00000001111111111111111111111111) (= (mask!9917 thiss!1504) #b00000011111111111111111111111111) (= (mask!9917 thiss!1504) #b00000111111111111111111111111111) (= (mask!9917 thiss!1504) #b00001111111111111111111111111111) (= (mask!9917 thiss!1504) #b00011111111111111111111111111111) (= (mask!9917 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9917 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!58705 d!58771))

(declare-fun d!58773 () Bool)

(declare-fun e!142687 () Bool)

(assert (=> d!58773 e!142687))

(declare-fun res!107515 () Bool)

(assert (=> d!58773 (=> res!107515 e!142687)))

(declare-fun lt!111978 () Bool)

(assert (=> d!58773 (= res!107515 (not lt!111978))))

(declare-fun lt!111976 () Bool)

(assert (=> d!58773 (= lt!111978 lt!111976)))

(declare-fun lt!111979 () Unit!6511)

(declare-fun e!142686 () Unit!6511)

(assert (=> d!58773 (= lt!111979 e!142686)))

(declare-fun c!36523 () Bool)

(assert (=> d!58773 (= c!36523 lt!111976)))

(assert (=> d!58773 (= lt!111976 (containsKey!252 (toList!1602 lt!111882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58773 (= (contains!1457 lt!111882 #b0000000000000000000000000000000000000000000000000000000000000000) lt!111978)))

(declare-fun b!219360 () Bool)

(declare-fun lt!111977 () Unit!6511)

(assert (=> b!219360 (= e!142686 lt!111977)))

(assert (=> b!219360 (= lt!111977 (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1602 lt!111882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219360 (isDefined!201 (getValueByKey!261 (toList!1602 lt!111882) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219361 () Bool)

(declare-fun Unit!6524 () Unit!6511)

(assert (=> b!219361 (= e!142686 Unit!6524)))

(declare-fun b!219362 () Bool)

(assert (=> b!219362 (= e!142687 (isDefined!201 (getValueByKey!261 (toList!1602 lt!111882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58773 c!36523) b!219360))

(assert (= (and d!58773 (not c!36523)) b!219361))

(assert (= (and d!58773 (not res!107515)) b!219362))

(declare-fun m!245185 () Bool)

(assert (=> d!58773 m!245185))

(declare-fun m!245187 () Bool)

(assert (=> b!219360 m!245187))

(declare-fun m!245189 () Bool)

(assert (=> b!219360 m!245189))

(assert (=> b!219360 m!245189))

(declare-fun m!245191 () Bool)

(assert (=> b!219360 m!245191))

(assert (=> b!219362 m!245189))

(assert (=> b!219362 m!245189))

(assert (=> b!219362 m!245191))

(assert (=> bm!20467 d!58773))

(assert (=> d!58707 d!58697))

(declare-fun bm!20492 () Bool)

(declare-fun call!20496 () Bool)

(assert (=> bm!20492 (= call!20496 (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219379 () Bool)

(declare-fun e!142696 () Bool)

(declare-fun e!142698 () Bool)

(assert (=> b!219379 (= e!142696 e!142698)))

(declare-fun c!36528 () Bool)

(declare-fun lt!111982 () SeekEntryResult!771)

(assert (=> b!219379 (= c!36528 ((_ is MissingVacant!771) lt!111982))))

(declare-fun b!219380 () Bool)

(declare-fun e!142697 () Bool)

(assert (=> b!219380 (= e!142696 e!142697)))

(declare-fun res!107527 () Bool)

(declare-fun call!20495 () Bool)

(assert (=> b!219380 (= res!107527 call!20495)))

(assert (=> b!219380 (=> (not res!107527) (not e!142697))))

(declare-fun b!219381 () Bool)

(declare-fun res!107525 () Bool)

(declare-fun e!142699 () Bool)

(assert (=> b!219381 (=> (not res!107525) (not e!142699))))

(assert (=> b!219381 (= res!107525 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5257 lt!111982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20493 () Bool)

(declare-fun c!36529 () Bool)

(assert (=> bm!20493 (= call!20495 (inRange!0 (ite c!36529 (index!5254 lt!111982) (index!5257 lt!111982)) (mask!9917 thiss!1504)))))

(declare-fun b!219382 () Bool)

(assert (=> b!219382 (= e!142699 (not call!20496))))

(declare-fun d!58775 () Bool)

(assert (=> d!58775 e!142696))

(assert (=> d!58775 (= c!36529 ((_ is MissingZero!771) lt!111982))))

(assert (=> d!58775 (= lt!111982 (seekEntryOrOpen!0 key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(assert (=> d!58775 true))

(declare-fun _$34!1098 () Unit!6511)

(assert (=> d!58775 (= (choose!1095 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) _$34!1098)))

(declare-fun b!219383 () Bool)

(declare-fun res!107526 () Bool)

(assert (=> b!219383 (=> (not res!107526) (not e!142699))))

(assert (=> b!219383 (= res!107526 call!20495)))

(assert (=> b!219383 (= e!142698 e!142699)))

(declare-fun b!219384 () Bool)

(declare-fun res!107524 () Bool)

(assert (=> b!219384 (= res!107524 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5254 lt!111982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219384 (=> (not res!107524) (not e!142697))))

(declare-fun b!219385 () Bool)

(assert (=> b!219385 (= e!142698 ((_ is Undefined!771) lt!111982))))

(declare-fun b!219386 () Bool)

(assert (=> b!219386 (= e!142697 (not call!20496))))

(assert (= (and d!58775 c!36529) b!219380))

(assert (= (and d!58775 (not c!36529)) b!219379))

(assert (= (and b!219380 res!107527) b!219384))

(assert (= (and b!219384 res!107524) b!219386))

(assert (= (and b!219379 c!36528) b!219383))

(assert (= (and b!219379 (not c!36528)) b!219385))

(assert (= (and b!219383 res!107526) b!219381))

(assert (= (and b!219381 res!107525) b!219382))

(assert (= (or b!219380 b!219383) bm!20493))

(assert (= (or b!219386 b!219382) bm!20492))

(declare-fun m!245193 () Bool)

(assert (=> b!219384 m!245193))

(declare-fun m!245195 () Bool)

(assert (=> b!219381 m!245195))

(declare-fun m!245197 () Bool)

(assert (=> bm!20493 m!245197))

(assert (=> bm!20492 m!244825))

(assert (=> d!58775 m!244845))

(assert (=> d!58707 d!58775))

(assert (=> d!58707 d!58771))

(declare-fun d!58777 () Bool)

(declare-fun res!107528 () Bool)

(declare-fun e!142700 () Bool)

(assert (=> d!58777 (=> res!107528 e!142700)))

(assert (=> d!58777 (= res!107528 (= (select (arr!5090 (_keys!6184 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!58777 (= (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!142700)))

(declare-fun b!219387 () Bool)

(declare-fun e!142701 () Bool)

(assert (=> b!219387 (= e!142700 e!142701)))

(declare-fun res!107529 () Bool)

(assert (=> b!219387 (=> (not res!107529) (not e!142701))))

(assert (=> b!219387 (= res!107529 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun b!219388 () Bool)

(assert (=> b!219388 (= e!142701 (arrayContainsKey!0 (_keys!6184 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!58777 (not res!107528)) b!219387))

(assert (= (and b!219387 res!107529) b!219388))

(declare-fun m!245199 () Bool)

(assert (=> d!58777 m!245199))

(declare-fun m!245201 () Bool)

(assert (=> b!219388 m!245201))

(assert (=> b!219223 d!58777))

(declare-fun e!142709 () SeekEntryResult!771)

(declare-fun b!219401 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!219401 (= e!142709 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22853 lt!111799) #b00000000000000000000000000000001) (nextIndex!0 (index!5256 lt!111799) (bvadd (x!22853 lt!111799) #b00000000000000000000000000000001) (mask!9917 thiss!1504)) (index!5256 lt!111799) key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun b!219402 () Bool)

(declare-fun c!36538 () Bool)

(declare-fun lt!111987 () (_ BitVec 64))

(assert (=> b!219402 (= c!36538 (= lt!111987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142710 () SeekEntryResult!771)

(assert (=> b!219402 (= e!142710 e!142709)))

(declare-fun d!58779 () Bool)

(declare-fun lt!111988 () SeekEntryResult!771)

(assert (=> d!58779 (and (or ((_ is Undefined!771) lt!111988) (not ((_ is Found!771) lt!111988)) (and (bvsge (index!5255 lt!111988) #b00000000000000000000000000000000) (bvslt (index!5255 lt!111988) (size!5422 (_keys!6184 thiss!1504))))) (or ((_ is Undefined!771) lt!111988) ((_ is Found!771) lt!111988) (not ((_ is MissingVacant!771) lt!111988)) (not (= (index!5257 lt!111988) (index!5256 lt!111799))) (and (bvsge (index!5257 lt!111988) #b00000000000000000000000000000000) (bvslt (index!5257 lt!111988) (size!5422 (_keys!6184 thiss!1504))))) (or ((_ is Undefined!771) lt!111988) (ite ((_ is Found!771) lt!111988) (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5255 lt!111988)) key!932) (and ((_ is MissingVacant!771) lt!111988) (= (index!5257 lt!111988) (index!5256 lt!111799)) (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5257 lt!111988)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!142708 () SeekEntryResult!771)

(assert (=> d!58779 (= lt!111988 e!142708)))

(declare-fun c!36536 () Bool)

(assert (=> d!58779 (= c!36536 (bvsge (x!22853 lt!111799) #b01111111111111111111111111111110))))

(assert (=> d!58779 (= lt!111987 (select (arr!5090 (_keys!6184 thiss!1504)) (index!5256 lt!111799)))))

(assert (=> d!58779 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58779 (= (seekKeyOrZeroReturnVacant!0 (x!22853 lt!111799) (index!5256 lt!111799) (index!5256 lt!111799) key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)) lt!111988)))

(declare-fun b!219403 () Bool)

(assert (=> b!219403 (= e!142708 e!142710)))

(declare-fun c!36537 () Bool)

(assert (=> b!219403 (= c!36537 (= lt!111987 key!932))))

(declare-fun b!219404 () Bool)

(assert (=> b!219404 (= e!142710 (Found!771 (index!5256 lt!111799)))))

(declare-fun b!219405 () Bool)

(assert (=> b!219405 (= e!142708 Undefined!771)))

(declare-fun b!219406 () Bool)

(assert (=> b!219406 (= e!142709 (MissingVacant!771 (index!5256 lt!111799)))))

(assert (= (and d!58779 c!36536) b!219405))

(assert (= (and d!58779 (not c!36536)) b!219403))

(assert (= (and b!219403 c!36537) b!219404))

(assert (= (and b!219403 (not c!36537)) b!219402))

(assert (= (and b!219402 c!36538) b!219406))

(assert (= (and b!219402 (not c!36538)) b!219401))

(declare-fun m!245203 () Bool)

(assert (=> b!219401 m!245203))

(assert (=> b!219401 m!245203))

(declare-fun m!245205 () Bool)

(assert (=> b!219401 m!245205))

(declare-fun m!245207 () Bool)

(assert (=> d!58779 m!245207))

(declare-fun m!245209 () Bool)

(assert (=> d!58779 m!245209))

(assert (=> d!58779 m!244905))

(assert (=> d!58779 m!244913))

(assert (=> b!219112 d!58779))

(declare-fun d!58781 () Bool)

(declare-fun res!107534 () Bool)

(declare-fun e!142715 () Bool)

(assert (=> d!58781 (=> res!107534 e!142715)))

(assert (=> d!58781 (= res!107534 (and ((_ is Cons!3150) (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (= (_1!2140 (h!3797 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)))))

(assert (=> d!58781 (= (containsKey!252 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932) e!142715)))

(declare-fun b!219411 () Bool)

(declare-fun e!142716 () Bool)

(assert (=> b!219411 (= e!142715 e!142716)))

(declare-fun res!107535 () Bool)

(assert (=> b!219411 (=> (not res!107535) (not e!142716))))

(assert (=> b!219411 (= res!107535 (and (or (not ((_ is Cons!3150) (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) (bvsle (_1!2140 (h!3797 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)) ((_ is Cons!3150) (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (bvslt (_1!2140 (h!3797 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)))))

(declare-fun b!219412 () Bool)

(assert (=> b!219412 (= e!142716 (containsKey!252 (t!8103 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) key!932))))

(assert (= (and d!58781 (not res!107534)) b!219411))

(assert (= (and b!219411 res!107535) b!219412))

(declare-fun m!245211 () Bool)

(assert (=> b!219412 m!245211))

(assert (=> d!58703 d!58781))

(assert (=> d!58699 d!58697))

(declare-fun d!58783 () Bool)

(declare-fun e!142719 () Bool)

(assert (=> d!58783 e!142719))

(declare-fun res!107541 () Bool)

(assert (=> d!58783 (=> (not res!107541) (not e!142719))))

(declare-fun lt!111991 () SeekEntryResult!771)

(assert (=> d!58783 (= res!107541 ((_ is Found!771) lt!111991))))

(assert (=> d!58783 (= lt!111991 (seekEntryOrOpen!0 key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(assert (=> d!58783 true))

(declare-fun _$33!153 () Unit!6511)

(assert (=> d!58783 (= (choose!1094 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) _$33!153)))

(declare-fun b!219417 () Bool)

(declare-fun res!107540 () Bool)

(assert (=> b!219417 (=> (not res!107540) (not e!142719))))

(assert (=> b!219417 (= res!107540 (inRange!0 (index!5255 lt!111991) (mask!9917 thiss!1504)))))

(declare-fun b!219418 () Bool)

(assert (=> b!219418 (= e!142719 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5255 lt!111991)) key!932))))

(assert (= (and d!58783 res!107541) b!219417))

(assert (= (and b!219417 res!107540) b!219418))

(assert (=> d!58783 m!244845))

(declare-fun m!245213 () Bool)

(assert (=> b!219417 m!245213))

(declare-fun m!245215 () Bool)

(assert (=> b!219418 m!245215))

(assert (=> d!58699 d!58783))

(assert (=> d!58699 d!58771))

(assert (=> b!219179 d!58723))

(assert (=> bm!20475 d!58713))

(declare-fun d!58785 () Bool)

(assert (=> d!58785 (= (apply!202 lt!111882 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2681 (getValueByKey!261 (toList!1602 lt!111882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8464 () Bool)

(assert (= bs!8464 d!58785))

(assert (=> bs!8464 m!245169))

(assert (=> bs!8464 m!245169))

(declare-fun m!245217 () Bool)

(assert (=> bs!8464 m!245217))

(assert (=> b!219178 d!58785))

(declare-fun d!58787 () Bool)

(assert (=> d!58787 (= (apply!202 lt!111882 (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000)) (get!2681 (getValueByKey!261 (toList!1602 lt!111882) (select (arr!5090 (_keys!6184 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8465 () Bool)

(assert (= bs!8465 d!58787))

(assert (=> bs!8465 m!244937))

(assert (=> bs!8465 m!245033))

(assert (=> bs!8465 m!245033))

(declare-fun m!245219 () Bool)

(assert (=> bs!8465 m!245219))

(assert (=> b!219176 d!58787))

(declare-fun d!58789 () Bool)

(declare-fun c!36541 () Bool)

(assert (=> d!58789 (= c!36541 ((_ is ValueCellFull!2531) (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!142722 () V!7313)

(assert (=> d!58789 (= (get!2680 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!142722)))

(declare-fun b!219423 () Bool)

(declare-fun get!2682 (ValueCell!2531 V!7313) V!7313)

(assert (=> b!219423 (= e!142722 (get!2682 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219424 () Bool)

(declare-fun get!2683 (ValueCell!2531 V!7313) V!7313)

(assert (=> b!219424 (= e!142722 (get!2683 (select (arr!5089 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58789 c!36541) b!219423))

(assert (= (and d!58789 (not c!36541)) b!219424))

(assert (=> b!219423 m!244953))

(assert (=> b!219423 m!244951))

(declare-fun m!245221 () Bool)

(assert (=> b!219423 m!245221))

(assert (=> b!219424 m!244953))

(assert (=> b!219424 m!244951))

(declare-fun m!245223 () Bool)

(assert (=> b!219424 m!245223))

(assert (=> b!219176 d!58789))

(declare-fun d!58791 () Bool)

(declare-fun isEmpty!509 (Option!267) Bool)

(assert (=> d!58791 (= (isDefined!201 (getValueByKey!261 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932)) (not (isEmpty!509 (getValueByKey!261 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))))

(declare-fun bs!8466 () Bool)

(assert (= bs!8466 d!58791))

(assert (=> bs!8466 m!244931))

(declare-fun m!245225 () Bool)

(assert (=> bs!8466 m!245225))

(assert (=> b!219128 d!58791))

(declare-fun d!58793 () Bool)

(declare-fun c!36546 () Bool)

(assert (=> d!58793 (= c!36546 (and ((_ is Cons!3150) (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (= (_1!2140 (h!3797 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)))))

(declare-fun e!142727 () Option!267)

(assert (=> d!58793 (= (getValueByKey!261 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932) e!142727)))

(declare-fun b!219435 () Bool)

(declare-fun e!142728 () Option!267)

(assert (=> b!219435 (= e!142728 (getValueByKey!261 (t!8103 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) key!932))))

(declare-fun b!219434 () Bool)

(assert (=> b!219434 (= e!142727 e!142728)))

(declare-fun c!36547 () Bool)

(assert (=> b!219434 (= c!36547 (and ((_ is Cons!3150) (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (not (= (_1!2140 (h!3797 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932))))))

(declare-fun b!219436 () Bool)

(assert (=> b!219436 (= e!142728 None!265)))

(declare-fun b!219433 () Bool)

(assert (=> b!219433 (= e!142727 (Some!266 (_2!2140 (h!3797 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))))))

(assert (= (and d!58793 c!36546) b!219433))

(assert (= (and d!58793 (not c!36546)) b!219434))

(assert (= (and b!219434 c!36547) b!219435))

(assert (= (and b!219434 (not c!36547)) b!219436))

(declare-fun m!245227 () Bool)

(assert (=> b!219435 m!245227))

(assert (=> b!219128 d!58793))

(declare-fun d!58795 () Bool)

(assert (=> d!58795 (isDefined!201 (getValueByKey!261 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-fun lt!111994 () Unit!6511)

(declare-fun choose!1098 (List!3154 (_ BitVec 64)) Unit!6511)

(assert (=> d!58795 (= lt!111994 (choose!1098 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-fun e!142731 () Bool)

(assert (=> d!58795 e!142731))

(declare-fun res!107544 () Bool)

(assert (=> d!58795 (=> (not res!107544) (not e!142731))))

(declare-fun isStrictlySorted!345 (List!3154) Bool)

(assert (=> d!58795 (= res!107544 (isStrictlySorted!345 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))))

(assert (=> d!58795 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!200 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932) lt!111994)))

(declare-fun b!219439 () Bool)

(assert (=> b!219439 (= e!142731 (containsKey!252 (toList!1602 (getCurrentListMap!1134 (_keys!6184 thiss!1504) (_values!4117 thiss!1504) (mask!9917 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(assert (= (and d!58795 res!107544) b!219439))

(assert (=> d!58795 m!244931))

(assert (=> d!58795 m!244931))

(assert (=> d!58795 m!244933))

(declare-fun m!245229 () Bool)

(assert (=> d!58795 m!245229))

(declare-fun m!245231 () Bool)

(assert (=> d!58795 m!245231))

(assert (=> b!219439 m!244927))

(assert (=> b!219126 d!58795))

(assert (=> b!219126 d!58791))

(assert (=> b!219126 d!58793))

(declare-fun d!58797 () Bool)

(assert (=> d!58797 (= (apply!202 lt!111882 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2681 (getValueByKey!261 (toList!1602 lt!111882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8467 () Bool)

(assert (= bs!8467 d!58797))

(assert (=> bs!8467 m!245189))

(assert (=> bs!8467 m!245189))

(declare-fun m!245233 () Bool)

(assert (=> bs!8467 m!245233))

(assert (=> b!219174 d!58797))

(declare-fun d!58799 () Bool)

(assert (=> d!58799 (= (inRange!0 (ite c!36494 (index!5254 lt!111889) (index!5257 lt!111889)) (mask!9917 thiss!1504)) (and (bvsge (ite c!36494 (index!5254 lt!111889) (index!5257 lt!111889)) #b00000000000000000000000000000000) (bvslt (ite c!36494 (index!5254 lt!111889) (index!5257 lt!111889)) (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20474 d!58799))

(declare-fun b!219458 () Bool)

(declare-fun e!142745 () SeekEntryResult!771)

(assert (=> b!219458 (= e!142745 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9917 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9917 thiss!1504)) key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)))))

(declare-fun b!219459 () Bool)

(declare-fun e!142743 () Bool)

(declare-fun lt!111999 () SeekEntryResult!771)

(assert (=> b!219459 (= e!142743 (bvsge (x!22853 lt!111999) #b01111111111111111111111111111110))))

(declare-fun b!219460 () Bool)

(declare-fun e!142744 () SeekEntryResult!771)

(assert (=> b!219460 (= e!142744 (Intermediate!771 true (toIndex!0 key!932 (mask!9917 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!219461 () Bool)

(declare-fun e!142746 () Bool)

(assert (=> b!219461 (= e!142743 e!142746)))

(declare-fun res!107553 () Bool)

(assert (=> b!219461 (= res!107553 (and ((_ is Intermediate!771) lt!111999) (not (undefined!1583 lt!111999)) (bvslt (x!22853 lt!111999) #b01111111111111111111111111111110) (bvsge (x!22853 lt!111999) #b00000000000000000000000000000000) (bvsge (x!22853 lt!111999) #b00000000000000000000000000000000)))))

(assert (=> b!219461 (=> (not res!107553) (not e!142746))))

(declare-fun d!58801 () Bool)

(assert (=> d!58801 e!142743))

(declare-fun c!36555 () Bool)

(assert (=> d!58801 (= c!36555 (and ((_ is Intermediate!771) lt!111999) (undefined!1583 lt!111999)))))

(assert (=> d!58801 (= lt!111999 e!142744)))

(declare-fun c!36556 () Bool)

(assert (=> d!58801 (= c!36556 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!112000 () (_ BitVec 64))

(assert (=> d!58801 (= lt!112000 (select (arr!5090 (_keys!6184 thiss!1504)) (toIndex!0 key!932 (mask!9917 thiss!1504))))))

(assert (=> d!58801 (validMask!0 (mask!9917 thiss!1504))))

(assert (=> d!58801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9917 thiss!1504)) key!932 (_keys!6184 thiss!1504) (mask!9917 thiss!1504)) lt!111999)))

(declare-fun b!219462 () Bool)

(assert (=> b!219462 (and (bvsge (index!5256 lt!111999) #b00000000000000000000000000000000) (bvslt (index!5256 lt!111999) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun res!107552 () Bool)

(assert (=> b!219462 (= res!107552 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5256 lt!111999)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142742 () Bool)

(assert (=> b!219462 (=> res!107552 e!142742)))

(declare-fun b!219463 () Bool)

(assert (=> b!219463 (and (bvsge (index!5256 lt!111999) #b00000000000000000000000000000000) (bvslt (index!5256 lt!111999) (size!5422 (_keys!6184 thiss!1504))))))

(assert (=> b!219463 (= e!142742 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5256 lt!111999)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219464 () Bool)

(assert (=> b!219464 (= e!142744 e!142745)))

(declare-fun c!36554 () Bool)

(assert (=> b!219464 (= c!36554 (or (= lt!112000 key!932) (= (bvadd lt!112000 lt!112000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219465 () Bool)

(assert (=> b!219465 (= e!142745 (Intermediate!771 false (toIndex!0 key!932 (mask!9917 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!219466 () Bool)

(assert (=> b!219466 (and (bvsge (index!5256 lt!111999) #b00000000000000000000000000000000) (bvslt (index!5256 lt!111999) (size!5422 (_keys!6184 thiss!1504))))))

(declare-fun res!107551 () Bool)

(assert (=> b!219466 (= res!107551 (= (select (arr!5090 (_keys!6184 thiss!1504)) (index!5256 lt!111999)) key!932))))

(assert (=> b!219466 (=> res!107551 e!142742)))

(assert (=> b!219466 (= e!142746 e!142742)))

(assert (= (and d!58801 c!36556) b!219460))

(assert (= (and d!58801 (not c!36556)) b!219464))

(assert (= (and b!219464 c!36554) b!219465))

(assert (= (and b!219464 (not c!36554)) b!219458))

(assert (= (and d!58801 c!36555) b!219459))

(assert (= (and d!58801 (not c!36555)) b!219461))

(assert (= (and b!219461 res!107553) b!219466))

(assert (= (and b!219466 (not res!107551)) b!219462))

(assert (= (and b!219462 (not res!107552)) b!219463))

(declare-fun m!245235 () Bool)

(assert (=> b!219466 m!245235))

(assert (=> b!219462 m!245235))

(assert (=> d!58801 m!244907))

(declare-fun m!245237 () Bool)

(assert (=> d!58801 m!245237))

(assert (=> d!58801 m!244913))

(assert (=> b!219458 m!244907))

(declare-fun m!245239 () Bool)

(assert (=> b!219458 m!245239))

(assert (=> b!219458 m!245239))

(declare-fun m!245241 () Bool)

(assert (=> b!219458 m!245241))

(assert (=> b!219463 m!245235))

(assert (=> d!58697 d!58801))

(declare-fun d!58803 () Bool)

(declare-fun lt!112006 () (_ BitVec 32))

(declare-fun lt!112005 () (_ BitVec 32))

(assert (=> d!58803 (= lt!112006 (bvmul (bvxor lt!112005 (bvlshr lt!112005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58803 (= lt!112005 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58803 (and (bvsge (mask!9917 thiss!1504) #b00000000000000000000000000000000) (let ((res!107554 (let ((h!3800 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22872 (bvmul (bvxor h!3800 (bvlshr h!3800 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22872 (bvlshr x!22872 #b00000000000000000000000000001101)) (mask!9917 thiss!1504)))))) (and (bvslt res!107554 (bvadd (mask!9917 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!107554 #b00000000000000000000000000000000))))))

(assert (=> d!58803 (= (toIndex!0 key!932 (mask!9917 thiss!1504)) (bvand (bvxor lt!112006 (bvlshr lt!112006 #b00000000000000000000000000001101)) (mask!9917 thiss!1504)))))

(assert (=> d!58697 d!58803))

(assert (=> d!58697 d!58771))

(declare-fun mapIsEmpty!9799 () Bool)

(declare-fun mapRes!9799 () Bool)

(assert (=> mapIsEmpty!9799 mapRes!9799))

(declare-fun condMapEmpty!9799 () Bool)

(declare-fun mapDefault!9799 () ValueCell!2531)

(assert (=> mapNonEmpty!9798 (= condMapEmpty!9799 (= mapRest!9798 ((as const (Array (_ BitVec 32) ValueCell!2531)) mapDefault!9799)))))

(declare-fun e!142747 () Bool)

(assert (=> mapNonEmpty!9798 (= tp!20814 (and e!142747 mapRes!9799))))

(declare-fun mapNonEmpty!9799 () Bool)

(declare-fun tp!20815 () Bool)

(declare-fun e!142748 () Bool)

(assert (=> mapNonEmpty!9799 (= mapRes!9799 (and tp!20815 e!142748))))

(declare-fun mapValue!9799 () ValueCell!2531)

(declare-fun mapRest!9799 () (Array (_ BitVec 32) ValueCell!2531))

(declare-fun mapKey!9799 () (_ BitVec 32))

(assert (=> mapNonEmpty!9799 (= mapRest!9798 (store mapRest!9799 mapKey!9799 mapValue!9799))))

(declare-fun b!219468 () Bool)

(assert (=> b!219468 (= e!142747 tp_is_empty!5749)))

(declare-fun b!219467 () Bool)

(assert (=> b!219467 (= e!142748 tp_is_empty!5749)))

(assert (= (and mapNonEmpty!9798 condMapEmpty!9799) mapIsEmpty!9799))

(assert (= (and mapNonEmpty!9798 (not condMapEmpty!9799)) mapNonEmpty!9799))

(assert (= (and mapNonEmpty!9799 ((_ is ValueCellFull!2531) mapValue!9799)) b!219467))

(assert (= (and mapNonEmpty!9798 ((_ is ValueCellFull!2531) mapDefault!9799)) b!219468))

(declare-fun m!245243 () Bool)

(assert (=> mapNonEmpty!9799 m!245243))

(declare-fun b_lambda!7861 () Bool)

(assert (= b_lambda!7857 (or (and b!218970 b_free!5887) b_lambda!7861)))

(declare-fun b_lambda!7863 () Bool)

(assert (= b_lambda!7859 (or (and b!218970 b_free!5887) b_lambda!7863)))

(check-sat (not bm!20493) (not b!219316) (not b!219272) (not b!219388) (not d!58731) (not b!219254) (not b!219308) (not d!58795) (not b!219268) (not b_lambda!7855) (not d!58737) (not d!58721) (not b!219360) tp_is_empty!5749 (not b_lambda!7861) (not b!219303) (not b!219341) (not d!58797) (not b!219439) (not b!219318) (not d!58785) (not b!219317) (not b!219435) (not b!219313) (not b!219312) (not d!58757) (not b!219251) (not b!219417) (not d!58779) (not b!219262) (not d!58769) (not b!219260) (not mapNonEmpty!9799) (not b!219265) (not b!219423) (not b!219311) (not b!219267) (not d!58783) (not b!219310) (not bm!20478) b_and!12803 (not b!219351) (not bm!20481) (not b!219362) (not d!58741) (not bm!20492) (not d!58753) (not b!219315) (not b!219327) (not b_lambda!7863) (not bm!20484) (not b!219458) (not b!219357) (not d!58743) (not b!219358) (not d!58761) (not b!219355) (not d!58733) (not d!58745) (not b!219314) (not d!58801) (not d!58727) (not b!219329) (not b!219261) (not d!58725) (not bm!20487) (not b!219264) (not d!58739) (not b!219269) (not d!58749) (not b!219271) (not b!219412) (not d!58775) (not b!219255) (not b!219359) (not b!219340) (not d!58747) (not b_next!5887) (not d!58751) (not b!219424) (not d!58787) (not d!58729) (not b!219309) (not d!58765) (not d!58755) (not d!58773) (not b!219401) (not d!58791) (not d!58735))
(check-sat b_and!12803 (not b_next!5887))
