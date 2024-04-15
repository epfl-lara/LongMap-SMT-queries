; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21762 () Bool)

(assert start!21762)

(declare-fun b!218788 () Bool)

(declare-fun b_free!5887 () Bool)

(declare-fun b_next!5887 () Bool)

(assert (=> b!218788 (= b_free!5887 (not b_next!5887))))

(declare-fun tp!20798 () Bool)

(declare-fun b_and!12753 () Bool)

(assert (=> b!218788 (= tp!20798 b_and!12753)))

(declare-fun b!218776 () Bool)

(declare-fun res!107218 () Bool)

(declare-fun e!142316 () Bool)

(assert (=> b!218776 (=> (not res!107218) (not e!142316))))

(declare-datatypes ((V!7313 0))(
  ( (V!7314 (val!2919 Int)) )
))
(declare-datatypes ((ValueCell!2531 0))(
  ( (ValueCellFull!2531 (v!4932 V!7313)) (EmptyCell!2531) )
))
(declare-datatypes ((array!10731 0))(
  ( (array!10732 (arr!5085 (Array (_ BitVec 32) ValueCell!2531)) (size!5418 (_ BitVec 32))) )
))
(declare-datatypes ((array!10733 0))(
  ( (array!10734 (arr!5086 (Array (_ BitVec 32) (_ BitVec 64))) (size!5419 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2962 0))(
  ( (LongMapFixedSize!2963 (defaultEntry!4134 Int) (mask!9916 (_ BitVec 32)) (extraKeys!3871 (_ BitVec 32)) (zeroValue!3975 V!7313) (minValue!3975 V!7313) (_size!1530 (_ BitVec 32)) (_keys!6183 array!10733) (_values!4117 array!10731) (_vacant!1530 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2962)

(declare-datatypes ((SeekEntryResult!789 0))(
  ( (MissingZero!789 (index!5326 (_ BitVec 32))) (Found!789 (index!5327 (_ BitVec 32))) (Intermediate!789 (undefined!1601 Bool) (index!5328 (_ BitVec 32)) (x!22870 (_ BitVec 32))) (Undefined!789) (MissingVacant!789 (index!5329 (_ BitVec 32))) )
))
(declare-fun lt!111525 () SeekEntryResult!789)

(assert (=> b!218776 (= res!107218 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5326 lt!111525)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218777 () Bool)

(declare-fun e!142317 () Bool)

(declare-fun call!20427 () Bool)

(assert (=> b!218777 (= e!142317 (not call!20427))))

(declare-fun b!218778 () Bool)

(declare-fun e!142327 () Bool)

(declare-fun e!142328 () Bool)

(assert (=> b!218778 (= e!142327 e!142328)))

(declare-fun res!107217 () Bool)

(assert (=> b!218778 (=> (not res!107217) (not e!142328))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218778 (= res!107217 (or (= lt!111525 (MissingZero!789 index!297)) (= lt!111525 (MissingVacant!789 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10733 (_ BitVec 32)) SeekEntryResult!789)

(assert (=> b!218778 (= lt!111525 (seekEntryOrOpen!0 key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun b!218779 () Bool)

(declare-fun c!36402 () Bool)

(get-info :version)

(assert (=> b!218779 (= c!36402 ((_ is MissingVacant!789) lt!111525))))

(declare-fun e!142319 () Bool)

(declare-fun e!142321 () Bool)

(assert (=> b!218779 (= e!142319 e!142321)))

(declare-fun res!107221 () Bool)

(assert (=> start!21762 (=> (not res!107221) (not e!142327))))

(declare-fun valid!1214 (LongMapFixedSize!2962) Bool)

(assert (=> start!21762 (= res!107221 (valid!1214 thiss!1504))))

(assert (=> start!21762 e!142327))

(declare-fun e!142318 () Bool)

(assert (=> start!21762 e!142318))

(assert (=> start!21762 true))

(declare-fun mapIsEmpty!9789 () Bool)

(declare-fun mapRes!9789 () Bool)

(assert (=> mapIsEmpty!9789 mapRes!9789))

(declare-fun bm!20423 () Bool)

(declare-fun arrayContainsKey!0 (array!10733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20423 (= call!20427 (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218780 () Bool)

(declare-fun res!107224 () Bool)

(assert (=> b!218780 (=> (not res!107224) (not e!142327))))

(assert (=> b!218780 (= res!107224 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218781 () Bool)

(assert (=> b!218781 (= e!142321 ((_ is Undefined!789) lt!111525))))

(declare-fun b!218782 () Bool)

(declare-fun e!142326 () Bool)

(declare-fun tp_is_empty!5749 () Bool)

(assert (=> b!218782 (= e!142326 tp_is_empty!5749)))

(declare-fun b!218783 () Bool)

(declare-fun res!107219 () Bool)

(assert (=> b!218783 (=> (not res!107219) (not e!142316))))

(declare-fun call!20426 () Bool)

(assert (=> b!218783 (= res!107219 call!20426)))

(assert (=> b!218783 (= e!142319 e!142316)))

(declare-fun b!218784 () Bool)

(declare-fun res!107222 () Bool)

(assert (=> b!218784 (= res!107222 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5329 lt!111525)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218784 (=> (not res!107222) (not e!142317))))

(declare-fun b!218785 () Bool)

(declare-datatypes ((Unit!6486 0))(
  ( (Unit!6487) )
))
(declare-fun e!142323 () Unit!6486)

(declare-fun lt!111526 () Unit!6486)

(assert (=> b!218785 (= e!142323 lt!111526)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!189 (array!10733 array!10731 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6486)

(assert (=> b!218785 (= lt!111526 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!189 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(declare-fun c!36401 () Bool)

(assert (=> b!218785 (= c!36401 ((_ is MissingZero!789) lt!111525))))

(assert (=> b!218785 e!142319))

(declare-fun b!218786 () Bool)

(declare-fun e!142320 () Bool)

(assert (=> b!218786 (= e!142320 (and e!142326 mapRes!9789))))

(declare-fun condMapEmpty!9789 () Bool)

(declare-fun mapDefault!9789 () ValueCell!2531)

(assert (=> b!218786 (= condMapEmpty!9789 (= (arr!5085 (_values!4117 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2531)) mapDefault!9789)))))

(declare-fun mapNonEmpty!9789 () Bool)

(declare-fun tp!20799 () Bool)

(declare-fun e!142322 () Bool)

(assert (=> mapNonEmpty!9789 (= mapRes!9789 (and tp!20799 e!142322))))

(declare-fun mapRest!9789 () (Array (_ BitVec 32) ValueCell!2531))

(declare-fun mapValue!9789 () ValueCell!2531)

(declare-fun mapKey!9789 () (_ BitVec 32))

(assert (=> mapNonEmpty!9789 (= (arr!5085 (_values!4117 thiss!1504)) (store mapRest!9789 mapKey!9789 mapValue!9789))))

(declare-fun b!218787 () Bool)

(assert (=> b!218787 (= e!142316 (not call!20427))))

(declare-fun array_inv!3351 (array!10733) Bool)

(declare-fun array_inv!3352 (array!10731) Bool)

(assert (=> b!218788 (= e!142318 (and tp!20798 tp_is_empty!5749 (array_inv!3351 (_keys!6183 thiss!1504)) (array_inv!3352 (_values!4117 thiss!1504)) e!142320))))

(declare-fun bm!20424 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20424 (= call!20426 (inRange!0 (ite c!36401 (index!5326 lt!111525) (index!5329 lt!111525)) (mask!9916 thiss!1504)))))

(declare-fun b!218789 () Bool)

(declare-fun e!142324 () Bool)

(assert (=> b!218789 (= e!142324 (and (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))) (bvsge (size!5419 (_keys!6183 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-fun b!218790 () Bool)

(declare-fun Unit!6488 () Unit!6486)

(assert (=> b!218790 (= e!142323 Unit!6488)))

(declare-fun lt!111524 () Unit!6486)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!190 (array!10733 array!10731 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6486)

(assert (=> b!218790 (= lt!111524 (lemmaInListMapThenSeekEntryOrOpenFindsIt!190 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> b!218790 false))

(declare-fun b!218791 () Bool)

(assert (=> b!218791 (= e!142321 e!142317)))

(declare-fun res!107220 () Bool)

(assert (=> b!218791 (= res!107220 call!20426)))

(assert (=> b!218791 (=> (not res!107220) (not e!142317))))

(declare-fun b!218792 () Bool)

(assert (=> b!218792 (= e!142322 tp_is_empty!5749)))

(declare-fun b!218793 () Bool)

(assert (=> b!218793 (= e!142328 e!142324)))

(declare-fun res!107223 () Bool)

(assert (=> b!218793 (=> (not res!107223) (not e!142324))))

(assert (=> b!218793 (= res!107223 (inRange!0 index!297 (mask!9916 thiss!1504)))))

(declare-fun lt!111527 () Unit!6486)

(assert (=> b!218793 (= lt!111527 e!142323)))

(declare-fun c!36400 () Bool)

(declare-datatypes ((tuple2!4298 0))(
  ( (tuple2!4299 (_1!2160 (_ BitVec 64)) (_2!2160 V!7313)) )
))
(declare-datatypes ((List!3218 0))(
  ( (Nil!3215) (Cons!3214 (h!3861 tuple2!4298) (t!8166 List!3218)) )
))
(declare-datatypes ((ListLongMap!3201 0))(
  ( (ListLongMap!3202 (toList!1616 List!3218)) )
))
(declare-fun contains!1457 (ListLongMap!3201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1125 (array!10733 array!10731 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 32) Int) ListLongMap!3201)

(assert (=> b!218793 (= c!36400 (contains!1457 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) key!932))))

(assert (= (and start!21762 res!107221) b!218780))

(assert (= (and b!218780 res!107224) b!218778))

(assert (= (and b!218778 res!107217) b!218793))

(assert (= (and b!218793 c!36400) b!218790))

(assert (= (and b!218793 (not c!36400)) b!218785))

(assert (= (and b!218785 c!36401) b!218783))

(assert (= (and b!218785 (not c!36401)) b!218779))

(assert (= (and b!218783 res!107219) b!218776))

(assert (= (and b!218776 res!107218) b!218787))

(assert (= (and b!218779 c!36402) b!218791))

(assert (= (and b!218779 (not c!36402)) b!218781))

(assert (= (and b!218791 res!107220) b!218784))

(assert (= (and b!218784 res!107222) b!218777))

(assert (= (or b!218783 b!218791) bm!20424))

(assert (= (or b!218787 b!218777) bm!20423))

(assert (= (and b!218793 res!107223) b!218789))

(assert (= (and b!218786 condMapEmpty!9789) mapIsEmpty!9789))

(assert (= (and b!218786 (not condMapEmpty!9789)) mapNonEmpty!9789))

(assert (= (and mapNonEmpty!9789 ((_ is ValueCellFull!2531) mapValue!9789)) b!218792))

(assert (= (and b!218786 ((_ is ValueCellFull!2531) mapDefault!9789)) b!218782))

(assert (= b!218788 b!218786))

(assert (= start!21762 b!218788))

(declare-fun m!244023 () Bool)

(assert (=> bm!20423 m!244023))

(declare-fun m!244025 () Bool)

(assert (=> b!218785 m!244025))

(declare-fun m!244027 () Bool)

(assert (=> b!218776 m!244027))

(declare-fun m!244029 () Bool)

(assert (=> b!218790 m!244029))

(declare-fun m!244031 () Bool)

(assert (=> bm!20424 m!244031))

(declare-fun m!244033 () Bool)

(assert (=> b!218793 m!244033))

(declare-fun m!244035 () Bool)

(assert (=> b!218793 m!244035))

(assert (=> b!218793 m!244035))

(declare-fun m!244037 () Bool)

(assert (=> b!218793 m!244037))

(declare-fun m!244039 () Bool)

(assert (=> mapNonEmpty!9789 m!244039))

(declare-fun m!244041 () Bool)

(assert (=> b!218778 m!244041))

(declare-fun m!244043 () Bool)

(assert (=> b!218788 m!244043))

(declare-fun m!244045 () Bool)

(assert (=> b!218788 m!244045))

(declare-fun m!244047 () Bool)

(assert (=> start!21762 m!244047))

(declare-fun m!244049 () Bool)

(assert (=> b!218784 m!244049))

(check-sat (not b!218788) (not b!218790) (not b_next!5887) b_and!12753 (not bm!20424) (not mapNonEmpty!9789) tp_is_empty!5749 (not b!218778) (not start!21762) (not b!218793) (not b!218785) (not bm!20423))
(check-sat b_and!12753 (not b_next!5887))
(get-model)

(declare-fun d!58475 () Bool)

(declare-fun e!142409 () Bool)

(assert (=> d!58475 e!142409))

(declare-fun res!107278 () Bool)

(assert (=> d!58475 (=> (not res!107278) (not e!142409))))

(declare-fun lt!111557 () SeekEntryResult!789)

(assert (=> d!58475 (= res!107278 ((_ is Found!789) lt!111557))))

(assert (=> d!58475 (= lt!111557 (seekEntryOrOpen!0 key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun lt!111556 () Unit!6486)

(declare-fun choose!1094 (array!10733 array!10731 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6486)

(assert (=> d!58475 (= lt!111556 (choose!1094 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!58475 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58475 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!190 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) lt!111556)))

(declare-fun b!218906 () Bool)

(declare-fun res!107277 () Bool)

(assert (=> b!218906 (=> (not res!107277) (not e!142409))))

(assert (=> b!218906 (= res!107277 (inRange!0 (index!5327 lt!111557) (mask!9916 thiss!1504)))))

(declare-fun b!218907 () Bool)

(assert (=> b!218907 (= e!142409 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5327 lt!111557)) key!932))))

(assert (=> b!218907 (and (bvsge (index!5327 lt!111557) #b00000000000000000000000000000000) (bvslt (index!5327 lt!111557) (size!5419 (_keys!6183 thiss!1504))))))

(assert (= (and d!58475 res!107278) b!218906))

(assert (= (and b!218906 res!107277) b!218907))

(assert (=> d!58475 m!244041))

(declare-fun m!244107 () Bool)

(assert (=> d!58475 m!244107))

(declare-fun m!244109 () Bool)

(assert (=> d!58475 m!244109))

(declare-fun m!244111 () Bool)

(assert (=> b!218906 m!244111))

(declare-fun m!244113 () Bool)

(assert (=> b!218907 m!244113))

(assert (=> b!218790 d!58475))

(declare-fun d!58477 () Bool)

(declare-fun lt!111566 () SeekEntryResult!789)

(assert (=> d!58477 (and (or ((_ is Undefined!789) lt!111566) (not ((_ is Found!789) lt!111566)) (and (bvsge (index!5327 lt!111566) #b00000000000000000000000000000000) (bvslt (index!5327 lt!111566) (size!5419 (_keys!6183 thiss!1504))))) (or ((_ is Undefined!789) lt!111566) ((_ is Found!789) lt!111566) (not ((_ is MissingZero!789) lt!111566)) (and (bvsge (index!5326 lt!111566) #b00000000000000000000000000000000) (bvslt (index!5326 lt!111566) (size!5419 (_keys!6183 thiss!1504))))) (or ((_ is Undefined!789) lt!111566) ((_ is Found!789) lt!111566) ((_ is MissingZero!789) lt!111566) (not ((_ is MissingVacant!789) lt!111566)) (and (bvsge (index!5329 lt!111566) #b00000000000000000000000000000000) (bvslt (index!5329 lt!111566) (size!5419 (_keys!6183 thiss!1504))))) (or ((_ is Undefined!789) lt!111566) (ite ((_ is Found!789) lt!111566) (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5327 lt!111566)) key!932) (ite ((_ is MissingZero!789) lt!111566) (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5326 lt!111566)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!789) lt!111566) (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5329 lt!111566)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!142416 () SeekEntryResult!789)

(assert (=> d!58477 (= lt!111566 e!142416)))

(declare-fun c!36428 () Bool)

(declare-fun lt!111565 () SeekEntryResult!789)

(assert (=> d!58477 (= c!36428 (and ((_ is Intermediate!789) lt!111565) (undefined!1601 lt!111565)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10733 (_ BitVec 32)) SeekEntryResult!789)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58477 (= lt!111565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9916 thiss!1504)) key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(assert (=> d!58477 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58477 (= (seekEntryOrOpen!0 key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)) lt!111566)))

(declare-fun b!218920 () Bool)

(declare-fun e!142417 () SeekEntryResult!789)

(assert (=> b!218920 (= e!142416 e!142417)))

(declare-fun lt!111564 () (_ BitVec 64))

(assert (=> b!218920 (= lt!111564 (select (arr!5086 (_keys!6183 thiss!1504)) (index!5328 lt!111565)))))

(declare-fun c!36429 () Bool)

(assert (=> b!218920 (= c!36429 (= lt!111564 key!932))))

(declare-fun b!218921 () Bool)

(declare-fun c!36427 () Bool)

(assert (=> b!218921 (= c!36427 (= lt!111564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142418 () SeekEntryResult!789)

(assert (=> b!218921 (= e!142417 e!142418)))

(declare-fun b!218922 () Bool)

(assert (=> b!218922 (= e!142418 (MissingZero!789 (index!5328 lt!111565)))))

(declare-fun b!218923 () Bool)

(assert (=> b!218923 (= e!142417 (Found!789 (index!5328 lt!111565)))))

(declare-fun b!218924 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10733 (_ BitVec 32)) SeekEntryResult!789)

(assert (=> b!218924 (= e!142418 (seekKeyOrZeroReturnVacant!0 (x!22870 lt!111565) (index!5328 lt!111565) (index!5328 lt!111565) key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun b!218925 () Bool)

(assert (=> b!218925 (= e!142416 Undefined!789)))

(assert (= (and d!58477 c!36428) b!218925))

(assert (= (and d!58477 (not c!36428)) b!218920))

(assert (= (and b!218920 c!36429) b!218923))

(assert (= (and b!218920 (not c!36429)) b!218921))

(assert (= (and b!218921 c!36427) b!218922))

(assert (= (and b!218921 (not c!36427)) b!218924))

(declare-fun m!244115 () Bool)

(assert (=> d!58477 m!244115))

(assert (=> d!58477 m!244109))

(declare-fun m!244117 () Bool)

(assert (=> d!58477 m!244117))

(declare-fun m!244119 () Bool)

(assert (=> d!58477 m!244119))

(declare-fun m!244121 () Bool)

(assert (=> d!58477 m!244121))

(declare-fun m!244123 () Bool)

(assert (=> d!58477 m!244123))

(assert (=> d!58477 m!244119))

(declare-fun m!244125 () Bool)

(assert (=> b!218920 m!244125))

(declare-fun m!244127 () Bool)

(assert (=> b!218924 m!244127))

(assert (=> b!218778 d!58477))

(declare-fun d!58479 () Bool)

(assert (=> d!58479 (= (inRange!0 (ite c!36401 (index!5326 lt!111525) (index!5329 lt!111525)) (mask!9916 thiss!1504)) (and (bvsge (ite c!36401 (index!5326 lt!111525) (index!5329 lt!111525)) #b00000000000000000000000000000000) (bvslt (ite c!36401 (index!5326 lt!111525) (index!5329 lt!111525)) (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20424 d!58479))

(declare-fun b!218942 () Bool)

(declare-fun res!107289 () Bool)

(declare-fun e!142429 () Bool)

(assert (=> b!218942 (=> (not res!107289) (not e!142429))))

(declare-fun lt!111572 () SeekEntryResult!789)

(assert (=> b!218942 (= res!107289 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5329 lt!111572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218942 (and (bvsge (index!5329 lt!111572) #b00000000000000000000000000000000) (bvslt (index!5329 lt!111572) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun b!218944 () Bool)

(declare-fun call!20445 () Bool)

(assert (=> b!218944 (= e!142429 (not call!20445))))

(declare-fun b!218945 () Bool)

(declare-fun e!142428 () Bool)

(declare-fun e!142427 () Bool)

(assert (=> b!218945 (= e!142428 e!142427)))

(declare-fun res!107288 () Bool)

(declare-fun call!20444 () Bool)

(assert (=> b!218945 (= res!107288 call!20444)))

(assert (=> b!218945 (=> (not res!107288) (not e!142427))))

(declare-fun bm!20441 () Bool)

(assert (=> bm!20441 (= call!20445 (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218946 () Bool)

(declare-fun e!142430 () Bool)

(assert (=> b!218946 (= e!142430 ((_ is Undefined!789) lt!111572))))

(declare-fun b!218947 () Bool)

(declare-fun res!107290 () Bool)

(assert (=> b!218947 (=> (not res!107290) (not e!142429))))

(assert (=> b!218947 (= res!107290 call!20444)))

(assert (=> b!218947 (= e!142430 e!142429)))

(declare-fun b!218948 () Bool)

(assert (=> b!218948 (and (bvsge (index!5326 lt!111572) #b00000000000000000000000000000000) (bvslt (index!5326 lt!111572) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun res!107287 () Bool)

(assert (=> b!218948 (= res!107287 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5326 lt!111572)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218948 (=> (not res!107287) (not e!142427))))

(declare-fun c!36435 () Bool)

(declare-fun bm!20442 () Bool)

(assert (=> bm!20442 (= call!20444 (inRange!0 (ite c!36435 (index!5326 lt!111572) (index!5329 lt!111572)) (mask!9916 thiss!1504)))))

(declare-fun b!218949 () Bool)

(assert (=> b!218949 (= e!142427 (not call!20445))))

(declare-fun b!218943 () Bool)

(assert (=> b!218943 (= e!142428 e!142430)))

(declare-fun c!36434 () Bool)

(assert (=> b!218943 (= c!36434 ((_ is MissingVacant!789) lt!111572))))

(declare-fun d!58481 () Bool)

(assert (=> d!58481 e!142428))

(assert (=> d!58481 (= c!36435 ((_ is MissingZero!789) lt!111572))))

(assert (=> d!58481 (= lt!111572 (seekEntryOrOpen!0 key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun lt!111571 () Unit!6486)

(declare-fun choose!1095 (array!10733 array!10731 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 64) Int) Unit!6486)

(assert (=> d!58481 (= lt!111571 (choose!1095 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)))))

(assert (=> d!58481 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58481 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!189 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) lt!111571)))

(assert (= (and d!58481 c!36435) b!218945))

(assert (= (and d!58481 (not c!36435)) b!218943))

(assert (= (and b!218945 res!107288) b!218948))

(assert (= (and b!218948 res!107287) b!218949))

(assert (= (and b!218943 c!36434) b!218947))

(assert (= (and b!218943 (not c!36434)) b!218946))

(assert (= (and b!218947 res!107290) b!218942))

(assert (= (and b!218942 res!107289) b!218944))

(assert (= (or b!218945 b!218947) bm!20442))

(assert (= (or b!218949 b!218944) bm!20441))

(declare-fun m!244129 () Bool)

(assert (=> b!218948 m!244129))

(declare-fun m!244131 () Bool)

(assert (=> bm!20442 m!244131))

(assert (=> bm!20441 m!244023))

(declare-fun m!244133 () Bool)

(assert (=> b!218942 m!244133))

(assert (=> d!58481 m!244041))

(declare-fun m!244135 () Bool)

(assert (=> d!58481 m!244135))

(assert (=> d!58481 m!244109))

(assert (=> b!218785 d!58481))

(declare-fun d!58483 () Bool)

(assert (=> d!58483 (= (inRange!0 index!297 (mask!9916 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218793 d!58483))

(declare-fun d!58485 () Bool)

(declare-fun e!142436 () Bool)

(assert (=> d!58485 e!142436))

(declare-fun res!107293 () Bool)

(assert (=> d!58485 (=> res!107293 e!142436)))

(declare-fun lt!111581 () Bool)

(assert (=> d!58485 (= res!107293 (not lt!111581))))

(declare-fun lt!111583 () Bool)

(assert (=> d!58485 (= lt!111581 lt!111583)))

(declare-fun lt!111584 () Unit!6486)

(declare-fun e!142435 () Unit!6486)

(assert (=> d!58485 (= lt!111584 e!142435)))

(declare-fun c!36438 () Bool)

(assert (=> d!58485 (= c!36438 lt!111583)))

(declare-fun containsKey!250 (List!3218 (_ BitVec 64)) Bool)

(assert (=> d!58485 (= lt!111583 (containsKey!250 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(assert (=> d!58485 (= (contains!1457 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) key!932) lt!111581)))

(declare-fun b!218956 () Bool)

(declare-fun lt!111582 () Unit!6486)

(assert (=> b!218956 (= e!142435 lt!111582)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!199 (List!3218 (_ BitVec 64)) Unit!6486)

(assert (=> b!218956 (= lt!111582 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-datatypes ((Option!264 0))(
  ( (Some!263 (v!4935 V!7313)) (None!262) )
))
(declare-fun isDefined!200 (Option!264) Bool)

(declare-fun getValueByKey!258 (List!3218 (_ BitVec 64)) Option!264)

(assert (=> b!218956 (isDefined!200 (getValueByKey!258 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-fun b!218957 () Bool)

(declare-fun Unit!6489 () Unit!6486)

(assert (=> b!218957 (= e!142435 Unit!6489)))

(declare-fun b!218958 () Bool)

(assert (=> b!218958 (= e!142436 (isDefined!200 (getValueByKey!258 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932)))))

(assert (= (and d!58485 c!36438) b!218956))

(assert (= (and d!58485 (not c!36438)) b!218957))

(assert (= (and d!58485 (not res!107293)) b!218958))

(declare-fun m!244137 () Bool)

(assert (=> d!58485 m!244137))

(declare-fun m!244139 () Bool)

(assert (=> b!218956 m!244139))

(declare-fun m!244141 () Bool)

(assert (=> b!218956 m!244141))

(assert (=> b!218956 m!244141))

(declare-fun m!244143 () Bool)

(assert (=> b!218956 m!244143))

(assert (=> b!218958 m!244141))

(assert (=> b!218958 m!244141))

(assert (=> b!218958 m!244143))

(assert (=> b!218793 d!58485))

(declare-fun b!219001 () Bool)

(declare-fun e!142463 () Bool)

(declare-fun e!142469 () Bool)

(assert (=> b!219001 (= e!142463 e!142469)))

(declare-fun res!107314 () Bool)

(assert (=> b!219001 (=> (not res!107314) (not e!142469))))

(declare-fun lt!111638 () ListLongMap!3201)

(assert (=> b!219001 (= res!107314 (contains!1457 lt!111638 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun bm!20457 () Bool)

(declare-fun call!20463 () Bool)

(assert (=> bm!20457 (= call!20463 (contains!1457 lt!111638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219002 () Bool)

(declare-fun e!142467 () ListLongMap!3201)

(declare-fun call!20464 () ListLongMap!3201)

(assert (=> b!219002 (= e!142467 call!20464)))

(declare-fun b!219003 () Bool)

(declare-fun e!142470 () Bool)

(assert (=> b!219003 (= e!142470 (not call!20463))))

(declare-fun bm!20458 () Bool)

(declare-fun call!20460 () ListLongMap!3201)

(declare-fun call!20461 () ListLongMap!3201)

(assert (=> bm!20458 (= call!20460 call!20461)))

(declare-fun b!219004 () Bool)

(declare-fun e!142475 () Bool)

(declare-fun e!142474 () Bool)

(assert (=> b!219004 (= e!142475 e!142474)))

(declare-fun res!107320 () Bool)

(declare-fun call!20462 () Bool)

(assert (=> b!219004 (= res!107320 call!20462)))

(assert (=> b!219004 (=> (not res!107320) (not e!142474))))

(declare-fun b!219005 () Bool)

(declare-fun e!142466 () Unit!6486)

(declare-fun Unit!6490 () Unit!6486)

(assert (=> b!219005 (= e!142466 Unit!6490)))

(declare-fun b!219006 () Bool)

(declare-fun e!142471 () ListLongMap!3201)

(declare-fun e!142472 () ListLongMap!3201)

(assert (=> b!219006 (= e!142471 e!142472)))

(declare-fun c!36455 () Bool)

(assert (=> b!219006 (= c!36455 (and (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!20459 () Bool)

(assert (=> bm!20459 (= call!20462 (contains!1457 lt!111638 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219007 () Bool)

(declare-fun res!107317 () Bool)

(declare-fun e!142464 () Bool)

(assert (=> b!219007 (=> (not res!107317) (not e!142464))))

(assert (=> b!219007 (= res!107317 e!142470)))

(declare-fun c!36452 () Bool)

(assert (=> b!219007 (= c!36452 (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20460 () Bool)

(declare-fun call!20465 () ListLongMap!3201)

(declare-fun getCurrentListMapNoExtraKeys!518 (array!10733 array!10731 (_ BitVec 32) (_ BitVec 32) V!7313 V!7313 (_ BitVec 32) Int) ListLongMap!3201)

(assert (=> bm!20460 (= call!20465 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun b!219008 () Bool)

(declare-fun lt!111639 () Unit!6486)

(assert (=> b!219008 (= e!142466 lt!111639)))

(declare-fun lt!111650 () ListLongMap!3201)

(assert (=> b!219008 (= lt!111650 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111630 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111630 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111635 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111635 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111636 () Unit!6486)

(declare-fun addStillContains!178 (ListLongMap!3201 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6486)

(assert (=> b!219008 (= lt!111636 (addStillContains!178 lt!111650 lt!111630 (zeroValue!3975 thiss!1504) lt!111635))))

(declare-fun +!596 (ListLongMap!3201 tuple2!4298) ListLongMap!3201)

(assert (=> b!219008 (contains!1457 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))) lt!111635)))

(declare-fun lt!111640 () Unit!6486)

(assert (=> b!219008 (= lt!111640 lt!111636)))

(declare-fun lt!111645 () ListLongMap!3201)

(assert (=> b!219008 (= lt!111645 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111641 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111641 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111632 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111632 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111649 () Unit!6486)

(declare-fun addApplyDifferent!178 (ListLongMap!3201 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6486)

(assert (=> b!219008 (= lt!111649 (addApplyDifferent!178 lt!111645 lt!111641 (minValue!3975 thiss!1504) lt!111632))))

(declare-fun apply!202 (ListLongMap!3201 (_ BitVec 64)) V!7313)

(assert (=> b!219008 (= (apply!202 (+!596 lt!111645 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))) lt!111632) (apply!202 lt!111645 lt!111632))))

(declare-fun lt!111642 () Unit!6486)

(assert (=> b!219008 (= lt!111642 lt!111649)))

(declare-fun lt!111633 () ListLongMap!3201)

(assert (=> b!219008 (= lt!111633 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111648 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111637 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111637 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111629 () Unit!6486)

(assert (=> b!219008 (= lt!111629 (addApplyDifferent!178 lt!111633 lt!111648 (zeroValue!3975 thiss!1504) lt!111637))))

(assert (=> b!219008 (= (apply!202 (+!596 lt!111633 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))) lt!111637) (apply!202 lt!111633 lt!111637))))

(declare-fun lt!111644 () Unit!6486)

(assert (=> b!219008 (= lt!111644 lt!111629)))

(declare-fun lt!111634 () ListLongMap!3201)

(assert (=> b!219008 (= lt!111634 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))

(declare-fun lt!111647 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111647 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!111646 () (_ BitVec 64))

(assert (=> b!219008 (= lt!111646 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!219008 (= lt!111639 (addApplyDifferent!178 lt!111634 lt!111647 (minValue!3975 thiss!1504) lt!111646))))

(assert (=> b!219008 (= (apply!202 (+!596 lt!111634 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))) lt!111646) (apply!202 lt!111634 lt!111646))))

(declare-fun b!219009 () Bool)

(declare-fun e!142465 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!219009 (= e!142465 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20461 () Bool)

(declare-fun call!20466 () ListLongMap!3201)

(assert (=> bm!20461 (= call!20464 call!20466)))

(declare-fun b!219011 () Bool)

(assert (=> b!219011 (= e!142475 (not call!20462))))

(declare-fun b!219012 () Bool)

(declare-fun e!142473 () Bool)

(assert (=> b!219012 (= e!142473 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219013 () Bool)

(declare-fun c!36454 () Bool)

(assert (=> b!219013 (= c!36454 (and (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!219013 (= e!142472 e!142467)))

(declare-fun b!219014 () Bool)

(assert (=> b!219014 (= e!142474 (= (apply!202 lt!111638 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3975 thiss!1504)))))

(declare-fun b!219015 () Bool)

(assert (=> b!219015 (= e!142464 e!142475)))

(declare-fun c!36456 () Bool)

(assert (=> b!219015 (= c!36456 (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!219016 () Bool)

(assert (=> b!219016 (= e!142467 call!20460)))

(declare-fun bm!20462 () Bool)

(declare-fun c!36453 () Bool)

(assert (=> bm!20462 (= call!20466 (+!596 (ite c!36453 call!20465 (ite c!36455 call!20461 call!20460)) (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(declare-fun b!219017 () Bool)

(declare-fun get!2668 (ValueCell!2531 V!7313) V!7313)

(declare-fun dynLambda!536 (Int (_ BitVec 64)) V!7313)

(assert (=> b!219017 (= e!142469 (= (apply!202 lt!111638 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)) (get!2668 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!219017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5418 (_values!4117 thiss!1504))))))

(assert (=> b!219017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun b!219010 () Bool)

(declare-fun e!142468 () Bool)

(assert (=> b!219010 (= e!142468 (= (apply!202 lt!111638 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3975 thiss!1504)))))

(declare-fun d!58487 () Bool)

(assert (=> d!58487 e!142464))

(declare-fun res!107312 () Bool)

(assert (=> d!58487 (=> (not res!107312) (not e!142464))))

(assert (=> d!58487 (= res!107312 (or (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))))

(declare-fun lt!111631 () ListLongMap!3201)

(assert (=> d!58487 (= lt!111638 lt!111631)))

(declare-fun lt!111643 () Unit!6486)

(assert (=> d!58487 (= lt!111643 e!142466)))

(declare-fun c!36451 () Bool)

(assert (=> d!58487 (= c!36451 e!142473)))

(declare-fun res!107316 () Bool)

(assert (=> d!58487 (=> (not res!107316) (not e!142473))))

(assert (=> d!58487 (= res!107316 (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> d!58487 (= lt!111631 e!142471)))

(assert (=> d!58487 (= c!36453 (and (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3871 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58487 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58487 (= (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) lt!111638)))

(declare-fun b!219018 () Bool)

(assert (=> b!219018 (= e!142471 (+!596 call!20466 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))

(declare-fun bm!20463 () Bool)

(assert (=> bm!20463 (= call!20461 call!20465)))

(declare-fun b!219019 () Bool)

(declare-fun res!107315 () Bool)

(assert (=> b!219019 (=> (not res!107315) (not e!142464))))

(assert (=> b!219019 (= res!107315 e!142463)))

(declare-fun res!107318 () Bool)

(assert (=> b!219019 (=> res!107318 e!142463)))

(assert (=> b!219019 (= res!107318 (not e!142465))))

(declare-fun res!107319 () Bool)

(assert (=> b!219019 (=> (not res!107319) (not e!142465))))

(assert (=> b!219019 (= res!107319 (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun b!219020 () Bool)

(assert (=> b!219020 (= e!142470 e!142468)))

(declare-fun res!107313 () Bool)

(assert (=> b!219020 (= res!107313 call!20463)))

(assert (=> b!219020 (=> (not res!107313) (not e!142468))))

(declare-fun b!219021 () Bool)

(assert (=> b!219021 (= e!142472 call!20464)))

(assert (= (and d!58487 c!36453) b!219018))

(assert (= (and d!58487 (not c!36453)) b!219006))

(assert (= (and b!219006 c!36455) b!219021))

(assert (= (and b!219006 (not c!36455)) b!219013))

(assert (= (and b!219013 c!36454) b!219002))

(assert (= (and b!219013 (not c!36454)) b!219016))

(assert (= (or b!219002 b!219016) bm!20458))

(assert (= (or b!219021 bm!20458) bm!20463))

(assert (= (or b!219021 b!219002) bm!20461))

(assert (= (or b!219018 bm!20463) bm!20460))

(assert (= (or b!219018 bm!20461) bm!20462))

(assert (= (and d!58487 res!107316) b!219012))

(assert (= (and d!58487 c!36451) b!219008))

(assert (= (and d!58487 (not c!36451)) b!219005))

(assert (= (and d!58487 res!107312) b!219019))

(assert (= (and b!219019 res!107319) b!219009))

(assert (= (and b!219019 (not res!107318)) b!219001))

(assert (= (and b!219001 res!107314) b!219017))

(assert (= (and b!219019 res!107315) b!219007))

(assert (= (and b!219007 c!36452) b!219020))

(assert (= (and b!219007 (not c!36452)) b!219003))

(assert (= (and b!219020 res!107313) b!219010))

(assert (= (or b!219020 b!219003) bm!20457))

(assert (= (and b!219007 res!107317) b!219015))

(assert (= (and b!219015 c!36456) b!219004))

(assert (= (and b!219015 (not c!36456)) b!219011))

(assert (= (and b!219004 res!107320) b!219014))

(assert (= (or b!219004 b!219011) bm!20459))

(declare-fun b_lambda!7813 () Bool)

(assert (=> (not b_lambda!7813) (not b!219017)))

(declare-fun t!8168 () Bool)

(declare-fun tb!2909 () Bool)

(assert (=> (and b!218788 (= (defaultEntry!4134 thiss!1504) (defaultEntry!4134 thiss!1504)) t!8168) tb!2909))

(declare-fun result!5065 () Bool)

(assert (=> tb!2909 (= result!5065 tp_is_empty!5749)))

(assert (=> b!219017 t!8168))

(declare-fun b_and!12759 () Bool)

(assert (= b_and!12753 (and (=> t!8168 result!5065) b_and!12759)))

(declare-fun m!244145 () Bool)

(assert (=> b!219009 m!244145))

(assert (=> b!219009 m!244145))

(declare-fun m!244147 () Bool)

(assert (=> b!219009 m!244147))

(declare-fun m!244149 () Bool)

(assert (=> bm!20460 m!244149))

(declare-fun m!244151 () Bool)

(assert (=> b!219018 m!244151))

(assert (=> b!219012 m!244145))

(assert (=> b!219012 m!244145))

(assert (=> b!219012 m!244147))

(declare-fun m!244153 () Bool)

(assert (=> bm!20459 m!244153))

(declare-fun m!244155 () Bool)

(assert (=> b!219010 m!244155))

(declare-fun m!244157 () Bool)

(assert (=> b!219014 m!244157))

(declare-fun m!244159 () Bool)

(assert (=> bm!20462 m!244159))

(declare-fun m!244161 () Bool)

(assert (=> bm!20457 m!244161))

(assert (=> b!219001 m!244145))

(assert (=> b!219001 m!244145))

(declare-fun m!244163 () Bool)

(assert (=> b!219001 m!244163))

(declare-fun m!244165 () Bool)

(assert (=> b!219017 m!244165))

(declare-fun m!244167 () Bool)

(assert (=> b!219017 m!244167))

(assert (=> b!219017 m!244145))

(assert (=> b!219017 m!244145))

(declare-fun m!244169 () Bool)

(assert (=> b!219017 m!244169))

(assert (=> b!219017 m!244167))

(assert (=> b!219017 m!244165))

(declare-fun m!244171 () Bool)

(assert (=> b!219017 m!244171))

(declare-fun m!244173 () Bool)

(assert (=> b!219008 m!244173))

(declare-fun m!244175 () Bool)

(assert (=> b!219008 m!244175))

(declare-fun m!244177 () Bool)

(assert (=> b!219008 m!244177))

(declare-fun m!244179 () Bool)

(assert (=> b!219008 m!244179))

(declare-fun m!244181 () Bool)

(assert (=> b!219008 m!244181))

(declare-fun m!244183 () Bool)

(assert (=> b!219008 m!244183))

(declare-fun m!244185 () Bool)

(assert (=> b!219008 m!244185))

(declare-fun m!244187 () Bool)

(assert (=> b!219008 m!244187))

(declare-fun m!244189 () Bool)

(assert (=> b!219008 m!244189))

(assert (=> b!219008 m!244145))

(declare-fun m!244191 () Bool)

(assert (=> b!219008 m!244191))

(assert (=> b!219008 m!244149))

(assert (=> b!219008 m!244191))

(declare-fun m!244193 () Bool)

(assert (=> b!219008 m!244193))

(declare-fun m!244195 () Bool)

(assert (=> b!219008 m!244195))

(assert (=> b!219008 m!244177))

(declare-fun m!244197 () Bool)

(assert (=> b!219008 m!244197))

(assert (=> b!219008 m!244173))

(declare-fun m!244199 () Bool)

(assert (=> b!219008 m!244199))

(assert (=> b!219008 m!244181))

(declare-fun m!244201 () Bool)

(assert (=> b!219008 m!244201))

(assert (=> d!58487 m!244109))

(assert (=> b!218793 d!58487))

(declare-fun d!58489 () Bool)

(declare-fun res!107325 () Bool)

(declare-fun e!142480 () Bool)

(assert (=> d!58489 (=> res!107325 e!142480)))

(assert (=> d!58489 (= res!107325 (= (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!58489 (= (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 #b00000000000000000000000000000000) e!142480)))

(declare-fun b!219028 () Bool)

(declare-fun e!142481 () Bool)

(assert (=> b!219028 (= e!142480 e!142481)))

(declare-fun res!107326 () Bool)

(assert (=> b!219028 (=> (not res!107326) (not e!142481))))

(assert (=> b!219028 (= res!107326 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun b!219029 () Bool)

(assert (=> b!219029 (= e!142481 (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!58489 (not res!107325)) b!219028))

(assert (= (and b!219028 res!107326) b!219029))

(assert (=> d!58489 m!244145))

(declare-fun m!244203 () Bool)

(assert (=> b!219029 m!244203))

(assert (=> bm!20423 d!58489))

(declare-fun d!58491 () Bool)

(assert (=> d!58491 (= (array_inv!3351 (_keys!6183 thiss!1504)) (bvsge (size!5419 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218788 d!58491))

(declare-fun d!58493 () Bool)

(assert (=> d!58493 (= (array_inv!3352 (_values!4117 thiss!1504)) (bvsge (size!5418 (_values!4117 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!218788 d!58493))

(declare-fun d!58495 () Bool)

(declare-fun res!107333 () Bool)

(declare-fun e!142484 () Bool)

(assert (=> d!58495 (=> (not res!107333) (not e!142484))))

(declare-fun simpleValid!225 (LongMapFixedSize!2962) Bool)

(assert (=> d!58495 (= res!107333 (simpleValid!225 thiss!1504))))

(assert (=> d!58495 (= (valid!1214 thiss!1504) e!142484)))

(declare-fun b!219036 () Bool)

(declare-fun res!107334 () Bool)

(assert (=> b!219036 (=> (not res!107334) (not e!142484))))

(declare-fun arrayCountValidKeys!0 (array!10733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!219036 (= res!107334 (= (arrayCountValidKeys!0 (_keys!6183 thiss!1504) #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))) (_size!1530 thiss!1504)))))

(declare-fun b!219037 () Bool)

(declare-fun res!107335 () Bool)

(assert (=> b!219037 (=> (not res!107335) (not e!142484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10733 (_ BitVec 32)) Bool)

(assert (=> b!219037 (= res!107335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun b!219038 () Bool)

(declare-datatypes ((List!3219 0))(
  ( (Nil!3216) (Cons!3215 (h!3862 (_ BitVec 64)) (t!8169 List!3219)) )
))
(declare-fun arrayNoDuplicates!0 (array!10733 (_ BitVec 32) List!3219) Bool)

(assert (=> b!219038 (= e!142484 (arrayNoDuplicates!0 (_keys!6183 thiss!1504) #b00000000000000000000000000000000 Nil!3216))))

(assert (= (and d!58495 res!107333) b!219036))

(assert (= (and b!219036 res!107334) b!219037))

(assert (= (and b!219037 res!107335) b!219038))

(declare-fun m!244205 () Bool)

(assert (=> d!58495 m!244205))

(declare-fun m!244207 () Bool)

(assert (=> b!219036 m!244207))

(declare-fun m!244209 () Bool)

(assert (=> b!219037 m!244209))

(declare-fun m!244211 () Bool)

(assert (=> b!219038 m!244211))

(assert (=> start!21762 d!58495))

(declare-fun mapIsEmpty!9798 () Bool)

(declare-fun mapRes!9798 () Bool)

(assert (=> mapIsEmpty!9798 mapRes!9798))

(declare-fun mapNonEmpty!9798 () Bool)

(declare-fun tp!20814 () Bool)

(declare-fun e!142489 () Bool)

(assert (=> mapNonEmpty!9798 (= mapRes!9798 (and tp!20814 e!142489))))

(declare-fun mapRest!9798 () (Array (_ BitVec 32) ValueCell!2531))

(declare-fun mapValue!9798 () ValueCell!2531)

(declare-fun mapKey!9798 () (_ BitVec 32))

(assert (=> mapNonEmpty!9798 (= mapRest!9789 (store mapRest!9798 mapKey!9798 mapValue!9798))))

(declare-fun b!219045 () Bool)

(assert (=> b!219045 (= e!142489 tp_is_empty!5749)))

(declare-fun condMapEmpty!9798 () Bool)

(declare-fun mapDefault!9798 () ValueCell!2531)

(assert (=> mapNonEmpty!9789 (= condMapEmpty!9798 (= mapRest!9789 ((as const (Array (_ BitVec 32) ValueCell!2531)) mapDefault!9798)))))

(declare-fun e!142490 () Bool)

(assert (=> mapNonEmpty!9789 (= tp!20799 (and e!142490 mapRes!9798))))

(declare-fun b!219046 () Bool)

(assert (=> b!219046 (= e!142490 tp_is_empty!5749)))

(assert (= (and mapNonEmpty!9789 condMapEmpty!9798) mapIsEmpty!9798))

(assert (= (and mapNonEmpty!9789 (not condMapEmpty!9798)) mapNonEmpty!9798))

(assert (= (and mapNonEmpty!9798 ((_ is ValueCellFull!2531) mapValue!9798)) b!219045))

(assert (= (and mapNonEmpty!9789 ((_ is ValueCellFull!2531) mapDefault!9798)) b!219046))

(declare-fun m!244213 () Bool)

(assert (=> mapNonEmpty!9798 m!244213))

(declare-fun b_lambda!7815 () Bool)

(assert (= b_lambda!7813 (or (and b!218788 b_free!5887) b_lambda!7815)))

(check-sat (not b!219014) (not b!219018) (not b!218924) (not b!219001) (not bm!20462) (not b!219012) (not d!58495) (not d!58487) (not b!218958) (not bm!20441) (not d!58477) (not b!219029) (not b!218906) (not b!219008) (not b!219038) (not d!58475) (not d!58481) (not b_next!5887) (not b!219009) (not mapNonEmpty!9798) (not b_lambda!7815) (not bm!20442) b_and!12759 (not bm!20459) (not b!219010) (not b!219037) (not d!58485) tp_is_empty!5749 (not bm!20457) (not b!219017) (not b!218956) (not b!219036) (not bm!20460))
(check-sat b_and!12759 (not b_next!5887))
(get-model)

(declare-fun b!219055 () Bool)

(declare-fun e!142495 () (_ BitVec 32))

(declare-fun call!20469 () (_ BitVec 32))

(assert (=> b!219055 (= e!142495 call!20469)))

(declare-fun b!219056 () Bool)

(declare-fun e!142496 () (_ BitVec 32))

(assert (=> b!219056 (= e!142496 e!142495)))

(declare-fun c!36462 () Bool)

(assert (=> b!219056 (= c!36462 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20466 () Bool)

(assert (=> bm!20466 (= call!20469 (arrayCountValidKeys!0 (_keys!6183 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun d!58497 () Bool)

(declare-fun lt!111653 () (_ BitVec 32))

(assert (=> d!58497 (and (bvsge lt!111653 #b00000000000000000000000000000000) (bvsle lt!111653 (bvsub (size!5419 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58497 (= lt!111653 e!142496)))

(declare-fun c!36461 () Bool)

(assert (=> d!58497 (= c!36461 (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> d!58497 (and (bvsle #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5419 (_keys!6183 thiss!1504)) (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> d!58497 (= (arrayCountValidKeys!0 (_keys!6183 thiss!1504) #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))) lt!111653)))

(declare-fun b!219057 () Bool)

(assert (=> b!219057 (= e!142496 #b00000000000000000000000000000000)))

(declare-fun b!219058 () Bool)

(assert (=> b!219058 (= e!142495 (bvadd #b00000000000000000000000000000001 call!20469))))

(assert (= (and d!58497 c!36461) b!219057))

(assert (= (and d!58497 (not c!36461)) b!219056))

(assert (= (and b!219056 c!36462) b!219058))

(assert (= (and b!219056 (not c!36462)) b!219055))

(assert (= (or b!219058 b!219055) bm!20466))

(assert (=> b!219056 m!244145))

(assert (=> b!219056 m!244145))

(assert (=> b!219056 m!244147))

(declare-fun m!244215 () Bool)

(assert (=> bm!20466 m!244215))

(assert (=> b!219036 d!58497))

(declare-fun d!58499 () Bool)

(declare-fun get!2669 (Option!264) V!7313)

(assert (=> d!58499 (= (apply!202 (+!596 lt!111634 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))) lt!111646) (get!2669 (getValueByKey!258 (toList!1616 (+!596 lt!111634 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))) lt!111646)))))

(declare-fun bs!8413 () Bool)

(assert (= bs!8413 d!58499))

(declare-fun m!244217 () Bool)

(assert (=> bs!8413 m!244217))

(assert (=> bs!8413 m!244217))

(declare-fun m!244219 () Bool)

(assert (=> bs!8413 m!244219))

(assert (=> b!219008 d!58499))

(declare-fun d!58501 () Bool)

(assert (=> d!58501 (= (apply!202 (+!596 lt!111645 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))) lt!111632) (get!2669 (getValueByKey!258 (toList!1616 (+!596 lt!111645 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))) lt!111632)))))

(declare-fun bs!8414 () Bool)

(assert (= bs!8414 d!58501))

(declare-fun m!244221 () Bool)

(assert (=> bs!8414 m!244221))

(assert (=> bs!8414 m!244221))

(declare-fun m!244223 () Bool)

(assert (=> bs!8414 m!244223))

(assert (=> b!219008 d!58501))

(declare-fun d!58503 () Bool)

(assert (=> d!58503 (= (apply!202 (+!596 lt!111645 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))) lt!111632) (apply!202 lt!111645 lt!111632))))

(declare-fun lt!111656 () Unit!6486)

(declare-fun choose!1096 (ListLongMap!3201 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6486)

(assert (=> d!58503 (= lt!111656 (choose!1096 lt!111645 lt!111641 (minValue!3975 thiss!1504) lt!111632))))

(declare-fun e!142499 () Bool)

(assert (=> d!58503 e!142499))

(declare-fun res!107338 () Bool)

(assert (=> d!58503 (=> (not res!107338) (not e!142499))))

(assert (=> d!58503 (= res!107338 (contains!1457 lt!111645 lt!111632))))

(assert (=> d!58503 (= (addApplyDifferent!178 lt!111645 lt!111641 (minValue!3975 thiss!1504) lt!111632) lt!111656)))

(declare-fun b!219062 () Bool)

(assert (=> b!219062 (= e!142499 (not (= lt!111632 lt!111641)))))

(assert (= (and d!58503 res!107338) b!219062))

(assert (=> d!58503 m!244177))

(assert (=> d!58503 m!244177))

(assert (=> d!58503 m!244197))

(assert (=> d!58503 m!244179))

(declare-fun m!244225 () Bool)

(assert (=> d!58503 m!244225))

(declare-fun m!244227 () Bool)

(assert (=> d!58503 m!244227))

(assert (=> b!219008 d!58503))

(declare-fun d!58505 () Bool)

(assert (=> d!58505 (= (apply!202 lt!111634 lt!111646) (get!2669 (getValueByKey!258 (toList!1616 lt!111634) lt!111646)))))

(declare-fun bs!8415 () Bool)

(assert (= bs!8415 d!58505))

(declare-fun m!244229 () Bool)

(assert (=> bs!8415 m!244229))

(assert (=> bs!8415 m!244229))

(declare-fun m!244231 () Bool)

(assert (=> bs!8415 m!244231))

(assert (=> b!219008 d!58505))

(declare-fun d!58507 () Bool)

(assert (=> d!58507 (= (apply!202 lt!111633 lt!111637) (get!2669 (getValueByKey!258 (toList!1616 lt!111633) lt!111637)))))

(declare-fun bs!8416 () Bool)

(assert (= bs!8416 d!58507))

(declare-fun m!244233 () Bool)

(assert (=> bs!8416 m!244233))

(assert (=> bs!8416 m!244233))

(declare-fun m!244235 () Bool)

(assert (=> bs!8416 m!244235))

(assert (=> b!219008 d!58507))

(declare-fun d!58509 () Bool)

(declare-fun e!142502 () Bool)

(assert (=> d!58509 e!142502))

(declare-fun res!107343 () Bool)

(assert (=> d!58509 (=> (not res!107343) (not e!142502))))

(declare-fun lt!111667 () ListLongMap!3201)

(assert (=> d!58509 (= res!107343 (contains!1457 lt!111667 (_1!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))))))

(declare-fun lt!111666 () List!3218)

(assert (=> d!58509 (= lt!111667 (ListLongMap!3202 lt!111666))))

(declare-fun lt!111665 () Unit!6486)

(declare-fun lt!111668 () Unit!6486)

(assert (=> d!58509 (= lt!111665 lt!111668)))

(assert (=> d!58509 (= (getValueByKey!258 lt!111666 (_1!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!147 (List!3218 (_ BitVec 64) V!7313) Unit!6486)

(assert (=> d!58509 (= lt!111668 (lemmaContainsTupThenGetReturnValue!147 lt!111666 (_1!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))))))

(declare-fun insertStrictlySorted!150 (List!3218 (_ BitVec 64) V!7313) List!3218)

(assert (=> d!58509 (= lt!111666 (insertStrictlySorted!150 (toList!1616 lt!111633) (_1!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58509 (= (+!596 lt!111633 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))) lt!111667)))

(declare-fun b!219067 () Bool)

(declare-fun res!107344 () Bool)

(assert (=> b!219067 (=> (not res!107344) (not e!142502))))

(assert (=> b!219067 (= res!107344 (= (getValueByKey!258 (toList!1616 lt!111667) (_1!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))))))))

(declare-fun b!219068 () Bool)

(declare-fun contains!1458 (List!3218 tuple2!4298) Bool)

(assert (=> b!219068 (= e!142502 (contains!1458 (toList!1616 lt!111667) (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))))))

(assert (= (and d!58509 res!107343) b!219067))

(assert (= (and b!219067 res!107344) b!219068))

(declare-fun m!244237 () Bool)

(assert (=> d!58509 m!244237))

(declare-fun m!244239 () Bool)

(assert (=> d!58509 m!244239))

(declare-fun m!244241 () Bool)

(assert (=> d!58509 m!244241))

(declare-fun m!244243 () Bool)

(assert (=> d!58509 m!244243))

(declare-fun m!244245 () Bool)

(assert (=> b!219067 m!244245))

(declare-fun m!244247 () Bool)

(assert (=> b!219068 m!244247))

(assert (=> b!219008 d!58509))

(declare-fun d!58511 () Bool)

(declare-fun e!142503 () Bool)

(assert (=> d!58511 e!142503))

(declare-fun res!107345 () Bool)

(assert (=> d!58511 (=> (not res!107345) (not e!142503))))

(declare-fun lt!111671 () ListLongMap!3201)

(assert (=> d!58511 (= res!107345 (contains!1457 lt!111671 (_1!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))))))

(declare-fun lt!111670 () List!3218)

(assert (=> d!58511 (= lt!111671 (ListLongMap!3202 lt!111670))))

(declare-fun lt!111669 () Unit!6486)

(declare-fun lt!111672 () Unit!6486)

(assert (=> d!58511 (= lt!111669 lt!111672)))

(assert (=> d!58511 (= (getValueByKey!258 lt!111670 (_1!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))))))

(assert (=> d!58511 (= lt!111672 (lemmaContainsTupThenGetReturnValue!147 lt!111670 (_1!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))))))

(assert (=> d!58511 (= lt!111670 (insertStrictlySorted!150 (toList!1616 lt!111645) (_1!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))))))

(assert (=> d!58511 (= (+!596 lt!111645 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))) lt!111671)))

(declare-fun b!219069 () Bool)

(declare-fun res!107346 () Bool)

(assert (=> b!219069 (=> (not res!107346) (not e!142503))))

(assert (=> b!219069 (= res!107346 (= (getValueByKey!258 (toList!1616 lt!111671) (_1!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))))))))

(declare-fun b!219070 () Bool)

(assert (=> b!219070 (= e!142503 (contains!1458 (toList!1616 lt!111671) (tuple2!4299 lt!111641 (minValue!3975 thiss!1504))))))

(assert (= (and d!58511 res!107345) b!219069))

(assert (= (and b!219069 res!107346) b!219070))

(declare-fun m!244249 () Bool)

(assert (=> d!58511 m!244249))

(declare-fun m!244251 () Bool)

(assert (=> d!58511 m!244251))

(declare-fun m!244253 () Bool)

(assert (=> d!58511 m!244253))

(declare-fun m!244255 () Bool)

(assert (=> d!58511 m!244255))

(declare-fun m!244257 () Bool)

(assert (=> b!219069 m!244257))

(declare-fun m!244259 () Bool)

(assert (=> b!219070 m!244259))

(assert (=> b!219008 d!58511))

(declare-fun d!58513 () Bool)

(declare-fun e!142504 () Bool)

(assert (=> d!58513 e!142504))

(declare-fun res!107347 () Bool)

(assert (=> d!58513 (=> (not res!107347) (not e!142504))))

(declare-fun lt!111675 () ListLongMap!3201)

(assert (=> d!58513 (= res!107347 (contains!1457 lt!111675 (_1!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))))))

(declare-fun lt!111674 () List!3218)

(assert (=> d!58513 (= lt!111675 (ListLongMap!3202 lt!111674))))

(declare-fun lt!111673 () Unit!6486)

(declare-fun lt!111676 () Unit!6486)

(assert (=> d!58513 (= lt!111673 lt!111676)))

(assert (=> d!58513 (= (getValueByKey!258 lt!111674 (_1!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58513 (= lt!111676 (lemmaContainsTupThenGetReturnValue!147 lt!111674 (_1!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58513 (= lt!111674 (insertStrictlySorted!150 (toList!1616 lt!111650) (_1!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))))))

(assert (=> d!58513 (= (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))) lt!111675)))

(declare-fun b!219071 () Bool)

(declare-fun res!107348 () Bool)

(assert (=> b!219071 (=> (not res!107348) (not e!142504))))

(assert (=> b!219071 (= res!107348 (= (getValueByKey!258 (toList!1616 lt!111675) (_1!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))))))))

(declare-fun b!219072 () Bool)

(assert (=> b!219072 (= e!142504 (contains!1458 (toList!1616 lt!111675) (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))))))

(assert (= (and d!58513 res!107347) b!219071))

(assert (= (and b!219071 res!107348) b!219072))

(declare-fun m!244261 () Bool)

(assert (=> d!58513 m!244261))

(declare-fun m!244263 () Bool)

(assert (=> d!58513 m!244263))

(declare-fun m!244265 () Bool)

(assert (=> d!58513 m!244265))

(declare-fun m!244267 () Bool)

(assert (=> d!58513 m!244267))

(declare-fun m!244269 () Bool)

(assert (=> b!219071 m!244269))

(declare-fun m!244271 () Bool)

(assert (=> b!219072 m!244271))

(assert (=> b!219008 d!58513))

(declare-fun d!58515 () Bool)

(assert (=> d!58515 (= (apply!202 (+!596 lt!111633 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))) lt!111637) (apply!202 lt!111633 lt!111637))))

(declare-fun lt!111677 () Unit!6486)

(assert (=> d!58515 (= lt!111677 (choose!1096 lt!111633 lt!111648 (zeroValue!3975 thiss!1504) lt!111637))))

(declare-fun e!142505 () Bool)

(assert (=> d!58515 e!142505))

(declare-fun res!107349 () Bool)

(assert (=> d!58515 (=> (not res!107349) (not e!142505))))

(assert (=> d!58515 (= res!107349 (contains!1457 lt!111633 lt!111637))))

(assert (=> d!58515 (= (addApplyDifferent!178 lt!111633 lt!111648 (zeroValue!3975 thiss!1504) lt!111637) lt!111677)))

(declare-fun b!219073 () Bool)

(assert (=> b!219073 (= e!142505 (not (= lt!111637 lt!111648)))))

(assert (= (and d!58515 res!107349) b!219073))

(assert (=> d!58515 m!244181))

(assert (=> d!58515 m!244181))

(assert (=> d!58515 m!244183))

(assert (=> d!58515 m!244175))

(declare-fun m!244273 () Bool)

(assert (=> d!58515 m!244273))

(declare-fun m!244275 () Bool)

(assert (=> d!58515 m!244275))

(assert (=> b!219008 d!58515))

(declare-fun d!58517 () Bool)

(assert (=> d!58517 (= (apply!202 (+!596 lt!111633 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504))) lt!111637) (get!2669 (getValueByKey!258 (toList!1616 (+!596 lt!111633 (tuple2!4299 lt!111648 (zeroValue!3975 thiss!1504)))) lt!111637)))))

(declare-fun bs!8417 () Bool)

(assert (= bs!8417 d!58517))

(declare-fun m!244277 () Bool)

(assert (=> bs!8417 m!244277))

(assert (=> bs!8417 m!244277))

(declare-fun m!244279 () Bool)

(assert (=> bs!8417 m!244279))

(assert (=> b!219008 d!58517))

(declare-fun d!58519 () Bool)

(assert (=> d!58519 (= (apply!202 lt!111645 lt!111632) (get!2669 (getValueByKey!258 (toList!1616 lt!111645) lt!111632)))))

(declare-fun bs!8418 () Bool)

(assert (= bs!8418 d!58519))

(declare-fun m!244281 () Bool)

(assert (=> bs!8418 m!244281))

(assert (=> bs!8418 m!244281))

(declare-fun m!244283 () Bool)

(assert (=> bs!8418 m!244283))

(assert (=> b!219008 d!58519))

(declare-fun b!219098 () Bool)

(declare-fun lt!111698 () Unit!6486)

(declare-fun lt!111697 () Unit!6486)

(assert (=> b!219098 (= lt!111698 lt!111697)))

(declare-fun lt!111696 () V!7313)

(declare-fun lt!111694 () (_ BitVec 64))

(declare-fun lt!111695 () (_ BitVec 64))

(declare-fun lt!111692 () ListLongMap!3201)

(assert (=> b!219098 (not (contains!1457 (+!596 lt!111692 (tuple2!4299 lt!111694 lt!111696)) lt!111695))))

(declare-fun addStillNotContains!111 (ListLongMap!3201 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6486)

(assert (=> b!219098 (= lt!111697 (addStillNotContains!111 lt!111692 lt!111694 lt!111696 lt!111695))))

(assert (=> b!219098 (= lt!111695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!219098 (= lt!111696 (get!2668 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219098 (= lt!111694 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!20472 () ListLongMap!3201)

(assert (=> b!219098 (= lt!111692 call!20472)))

(declare-fun e!142525 () ListLongMap!3201)

(assert (=> b!219098 (= e!142525 (+!596 call!20472 (tuple2!4299 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000) (get!2668 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!219099 () Bool)

(declare-fun e!142521 () Bool)

(declare-fun lt!111693 () ListLongMap!3201)

(declare-fun isEmpty!506 (ListLongMap!3201) Bool)

(assert (=> b!219099 (= e!142521 (isEmpty!506 lt!111693))))

(declare-fun b!219100 () Bool)

(assert (=> b!219100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> b!219100 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5418 (_values!4117 thiss!1504))))))

(declare-fun e!142520 () Bool)

(assert (=> b!219100 (= e!142520 (= (apply!202 lt!111693 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)) (get!2668 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219101 () Bool)

(declare-fun e!142522 () ListLongMap!3201)

(assert (=> b!219101 (= e!142522 e!142525)))

(declare-fun c!36471 () Bool)

(assert (=> b!219101 (= c!36471 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20469 () Bool)

(assert (=> bm!20469 (= call!20472 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4134 thiss!1504)))))

(declare-fun b!219102 () Bool)

(assert (=> b!219102 (= e!142522 (ListLongMap!3202 Nil!3215))))

(declare-fun b!219103 () Bool)

(declare-fun res!107358 () Bool)

(declare-fun e!142526 () Bool)

(assert (=> b!219103 (=> (not res!107358) (not e!142526))))

(assert (=> b!219103 (= res!107358 (not (contains!1457 lt!111693 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219104 () Bool)

(assert (=> b!219104 (= e!142525 call!20472)))

(declare-fun b!219105 () Bool)

(assert (=> b!219105 (= e!142521 (= lt!111693 (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4134 thiss!1504))))))

(declare-fun b!219106 () Bool)

(declare-fun e!142524 () Bool)

(assert (=> b!219106 (= e!142526 e!142524)))

(declare-fun c!36474 () Bool)

(declare-fun e!142523 () Bool)

(assert (=> b!219106 (= c!36474 e!142523)))

(declare-fun res!107360 () Bool)

(assert (=> b!219106 (=> (not res!107360) (not e!142523))))

(assert (=> b!219106 (= res!107360 (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun b!219107 () Bool)

(assert (=> b!219107 (= e!142524 e!142520)))

(assert (=> b!219107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun res!107361 () Bool)

(assert (=> b!219107 (= res!107361 (contains!1457 lt!111693 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219107 (=> (not res!107361) (not e!142520))))

(declare-fun d!58521 () Bool)

(assert (=> d!58521 e!142526))

(declare-fun res!107359 () Bool)

(assert (=> d!58521 (=> (not res!107359) (not e!142526))))

(assert (=> d!58521 (= res!107359 (not (contains!1457 lt!111693 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58521 (= lt!111693 e!142522)))

(declare-fun c!36472 () Bool)

(assert (=> d!58521 (= c!36472 (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> d!58521 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58521 (= (getCurrentListMapNoExtraKeys!518 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)) lt!111693)))

(declare-fun b!219108 () Bool)

(assert (=> b!219108 (= e!142523 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219108 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!219109 () Bool)

(assert (=> b!219109 (= e!142524 e!142521)))

(declare-fun c!36473 () Bool)

(assert (=> b!219109 (= c!36473 (bvslt #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (= (and d!58521 c!36472) b!219102))

(assert (= (and d!58521 (not c!36472)) b!219101))

(assert (= (and b!219101 c!36471) b!219098))

(assert (= (and b!219101 (not c!36471)) b!219104))

(assert (= (or b!219098 b!219104) bm!20469))

(assert (= (and d!58521 res!107359) b!219103))

(assert (= (and b!219103 res!107358) b!219106))

(assert (= (and b!219106 res!107360) b!219108))

(assert (= (and b!219106 c!36474) b!219107))

(assert (= (and b!219106 (not c!36474)) b!219109))

(assert (= (and b!219107 res!107361) b!219100))

(assert (= (and b!219109 c!36473) b!219105))

(assert (= (and b!219109 (not c!36473)) b!219099))

(declare-fun b_lambda!7817 () Bool)

(assert (=> (not b_lambda!7817) (not b!219098)))

(assert (=> b!219098 t!8168))

(declare-fun b_and!12761 () Bool)

(assert (= b_and!12759 (and (=> t!8168 result!5065) b_and!12761)))

(declare-fun b_lambda!7819 () Bool)

(assert (=> (not b_lambda!7819) (not b!219100)))

(assert (=> b!219100 t!8168))

(declare-fun b_and!12763 () Bool)

(assert (= b_and!12761 (and (=> t!8168 result!5065) b_and!12763)))

(declare-fun m!244285 () Bool)

(assert (=> b!219105 m!244285))

(declare-fun m!244287 () Bool)

(assert (=> d!58521 m!244287))

(assert (=> d!58521 m!244109))

(assert (=> b!219100 m!244167))

(assert (=> b!219100 m!244167))

(assert (=> b!219100 m!244165))

(assert (=> b!219100 m!244171))

(assert (=> b!219100 m!244145))

(declare-fun m!244289 () Bool)

(assert (=> b!219100 m!244289))

(assert (=> b!219100 m!244145))

(assert (=> b!219100 m!244165))

(declare-fun m!244291 () Bool)

(assert (=> b!219103 m!244291))

(assert (=> b!219101 m!244145))

(assert (=> b!219101 m!244145))

(assert (=> b!219101 m!244147))

(assert (=> b!219108 m!244145))

(assert (=> b!219108 m!244145))

(assert (=> b!219108 m!244147))

(assert (=> b!219098 m!244167))

(declare-fun m!244293 () Bool)

(assert (=> b!219098 m!244293))

(assert (=> b!219098 m!244167))

(assert (=> b!219098 m!244165))

(assert (=> b!219098 m!244171))

(assert (=> b!219098 m!244145))

(declare-fun m!244295 () Bool)

(assert (=> b!219098 m!244295))

(assert (=> b!219098 m!244165))

(assert (=> b!219098 m!244293))

(declare-fun m!244297 () Bool)

(assert (=> b!219098 m!244297))

(declare-fun m!244299 () Bool)

(assert (=> b!219098 m!244299))

(assert (=> b!219107 m!244145))

(assert (=> b!219107 m!244145))

(declare-fun m!244301 () Bool)

(assert (=> b!219107 m!244301))

(assert (=> bm!20469 m!244285))

(declare-fun m!244303 () Bool)

(assert (=> b!219099 m!244303))

(assert (=> b!219008 d!58521))

(declare-fun d!58523 () Bool)

(declare-fun e!142527 () Bool)

(assert (=> d!58523 e!142527))

(declare-fun res!107362 () Bool)

(assert (=> d!58523 (=> (not res!107362) (not e!142527))))

(declare-fun lt!111701 () ListLongMap!3201)

(assert (=> d!58523 (= res!107362 (contains!1457 lt!111701 (_1!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))))))

(declare-fun lt!111700 () List!3218)

(assert (=> d!58523 (= lt!111701 (ListLongMap!3202 lt!111700))))

(declare-fun lt!111699 () Unit!6486)

(declare-fun lt!111702 () Unit!6486)

(assert (=> d!58523 (= lt!111699 lt!111702)))

(assert (=> d!58523 (= (getValueByKey!258 lt!111700 (_1!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))))))

(assert (=> d!58523 (= lt!111702 (lemmaContainsTupThenGetReturnValue!147 lt!111700 (_1!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))))))

(assert (=> d!58523 (= lt!111700 (insertStrictlySorted!150 (toList!1616 lt!111634) (_1!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))))))

(assert (=> d!58523 (= (+!596 lt!111634 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))) lt!111701)))

(declare-fun b!219110 () Bool)

(declare-fun res!107363 () Bool)

(assert (=> b!219110 (=> (not res!107363) (not e!142527))))

(assert (=> b!219110 (= res!107363 (= (getValueByKey!258 (toList!1616 lt!111701) (_1!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))))))))

(declare-fun b!219111 () Bool)

(assert (=> b!219111 (= e!142527 (contains!1458 (toList!1616 lt!111701) (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))))))

(assert (= (and d!58523 res!107362) b!219110))

(assert (= (and b!219110 res!107363) b!219111))

(declare-fun m!244305 () Bool)

(assert (=> d!58523 m!244305))

(declare-fun m!244307 () Bool)

(assert (=> d!58523 m!244307))

(declare-fun m!244309 () Bool)

(assert (=> d!58523 m!244309))

(declare-fun m!244311 () Bool)

(assert (=> d!58523 m!244311))

(declare-fun m!244313 () Bool)

(assert (=> b!219110 m!244313))

(declare-fun m!244315 () Bool)

(assert (=> b!219111 m!244315))

(assert (=> b!219008 d!58523))

(declare-fun d!58525 () Bool)

(assert (=> d!58525 (contains!1457 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))) lt!111635)))

(declare-fun lt!111705 () Unit!6486)

(declare-fun choose!1097 (ListLongMap!3201 (_ BitVec 64) V!7313 (_ BitVec 64)) Unit!6486)

(assert (=> d!58525 (= lt!111705 (choose!1097 lt!111650 lt!111630 (zeroValue!3975 thiss!1504) lt!111635))))

(assert (=> d!58525 (contains!1457 lt!111650 lt!111635)))

(assert (=> d!58525 (= (addStillContains!178 lt!111650 lt!111630 (zeroValue!3975 thiss!1504) lt!111635) lt!111705)))

(declare-fun bs!8419 () Bool)

(assert (= bs!8419 d!58525))

(assert (=> bs!8419 m!244173))

(assert (=> bs!8419 m!244173))

(assert (=> bs!8419 m!244199))

(declare-fun m!244317 () Bool)

(assert (=> bs!8419 m!244317))

(declare-fun m!244319 () Bool)

(assert (=> bs!8419 m!244319))

(assert (=> b!219008 d!58525))

(declare-fun d!58527 () Bool)

(assert (=> d!58527 (= (apply!202 (+!596 lt!111634 (tuple2!4299 lt!111647 (minValue!3975 thiss!1504))) lt!111646) (apply!202 lt!111634 lt!111646))))

(declare-fun lt!111706 () Unit!6486)

(assert (=> d!58527 (= lt!111706 (choose!1096 lt!111634 lt!111647 (minValue!3975 thiss!1504) lt!111646))))

(declare-fun e!142528 () Bool)

(assert (=> d!58527 e!142528))

(declare-fun res!107364 () Bool)

(assert (=> d!58527 (=> (not res!107364) (not e!142528))))

(assert (=> d!58527 (= res!107364 (contains!1457 lt!111634 lt!111646))))

(assert (=> d!58527 (= (addApplyDifferent!178 lt!111634 lt!111647 (minValue!3975 thiss!1504) lt!111646) lt!111706)))

(declare-fun b!219113 () Bool)

(assert (=> b!219113 (= e!142528 (not (= lt!111646 lt!111647)))))

(assert (= (and d!58527 res!107364) b!219113))

(assert (=> d!58527 m!244191))

(assert (=> d!58527 m!244191))

(assert (=> d!58527 m!244193))

(assert (=> d!58527 m!244195))

(declare-fun m!244321 () Bool)

(assert (=> d!58527 m!244321))

(declare-fun m!244323 () Bool)

(assert (=> d!58527 m!244323))

(assert (=> b!219008 d!58527))

(declare-fun d!58529 () Bool)

(declare-fun e!142530 () Bool)

(assert (=> d!58529 e!142530))

(declare-fun res!107365 () Bool)

(assert (=> d!58529 (=> res!107365 e!142530)))

(declare-fun lt!111707 () Bool)

(assert (=> d!58529 (= res!107365 (not lt!111707))))

(declare-fun lt!111709 () Bool)

(assert (=> d!58529 (= lt!111707 lt!111709)))

(declare-fun lt!111710 () Unit!6486)

(declare-fun e!142529 () Unit!6486)

(assert (=> d!58529 (= lt!111710 e!142529)))

(declare-fun c!36475 () Bool)

(assert (=> d!58529 (= c!36475 lt!111709)))

(assert (=> d!58529 (= lt!111709 (containsKey!250 (toList!1616 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))) lt!111635))))

(assert (=> d!58529 (= (contains!1457 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504))) lt!111635) lt!111707)))

(declare-fun b!219114 () Bool)

(declare-fun lt!111708 () Unit!6486)

(assert (=> b!219114 (= e!142529 lt!111708)))

(assert (=> b!219114 (= lt!111708 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1616 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))) lt!111635))))

(assert (=> b!219114 (isDefined!200 (getValueByKey!258 (toList!1616 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))) lt!111635))))

(declare-fun b!219115 () Bool)

(declare-fun Unit!6491 () Unit!6486)

(assert (=> b!219115 (= e!142529 Unit!6491)))

(declare-fun b!219116 () Bool)

(assert (=> b!219116 (= e!142530 (isDefined!200 (getValueByKey!258 (toList!1616 (+!596 lt!111650 (tuple2!4299 lt!111630 (zeroValue!3975 thiss!1504)))) lt!111635)))))

(assert (= (and d!58529 c!36475) b!219114))

(assert (= (and d!58529 (not c!36475)) b!219115))

(assert (= (and d!58529 (not res!107365)) b!219116))

(declare-fun m!244325 () Bool)

(assert (=> d!58529 m!244325))

(declare-fun m!244327 () Bool)

(assert (=> b!219114 m!244327))

(declare-fun m!244329 () Bool)

(assert (=> b!219114 m!244329))

(assert (=> b!219114 m!244329))

(declare-fun m!244331 () Bool)

(assert (=> b!219114 m!244331))

(assert (=> b!219116 m!244329))

(assert (=> b!219116 m!244329))

(assert (=> b!219116 m!244331))

(assert (=> b!219008 d!58529))

(declare-fun b!219125 () Bool)

(declare-fun res!107375 () Bool)

(declare-fun e!142533 () Bool)

(assert (=> b!219125 (=> (not res!107375) (not e!142533))))

(assert (=> b!219125 (= res!107375 (and (= (size!5418 (_values!4117 thiss!1504)) (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001)) (= (size!5419 (_keys!6183 thiss!1504)) (size!5418 (_values!4117 thiss!1504))) (bvsge (_size!1530 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1530 thiss!1504) (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!219126 () Bool)

(declare-fun res!107377 () Bool)

(assert (=> b!219126 (=> (not res!107377) (not e!142533))))

(declare-fun size!5424 (LongMapFixedSize!2962) (_ BitVec 32))

(assert (=> b!219126 (= res!107377 (bvsge (size!5424 thiss!1504) (_size!1530 thiss!1504)))))

(declare-fun b!219127 () Bool)

(declare-fun res!107376 () Bool)

(assert (=> b!219127 (=> (not res!107376) (not e!142533))))

(assert (=> b!219127 (= res!107376 (= (size!5424 thiss!1504) (bvadd (_size!1530 thiss!1504) (bvsdiv (bvadd (extraKeys!3871 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!219128 () Bool)

(assert (=> b!219128 (= e!142533 (and (bvsge (extraKeys!3871 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3871 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1530 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!58531 () Bool)

(declare-fun res!107374 () Bool)

(assert (=> d!58531 (=> (not res!107374) (not e!142533))))

(assert (=> d!58531 (= res!107374 (validMask!0 (mask!9916 thiss!1504)))))

(assert (=> d!58531 (= (simpleValid!225 thiss!1504) e!142533)))

(assert (= (and d!58531 res!107374) b!219125))

(assert (= (and b!219125 res!107375) b!219126))

(assert (= (and b!219126 res!107377) b!219127))

(assert (= (and b!219127 res!107376) b!219128))

(declare-fun m!244333 () Bool)

(assert (=> b!219126 m!244333))

(assert (=> b!219127 m!244333))

(assert (=> d!58531 m!244109))

(assert (=> d!58495 d!58531))

(declare-fun d!58533 () Bool)

(assert (=> d!58533 (= (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!219009 d!58533))

(assert (=> bm!20460 d!58521))

(declare-fun d!58535 () Bool)

(declare-fun e!142535 () Bool)

(assert (=> d!58535 e!142535))

(declare-fun res!107378 () Bool)

(assert (=> d!58535 (=> res!107378 e!142535)))

(declare-fun lt!111711 () Bool)

(assert (=> d!58535 (= res!107378 (not lt!111711))))

(declare-fun lt!111713 () Bool)

(assert (=> d!58535 (= lt!111711 lt!111713)))

(declare-fun lt!111714 () Unit!6486)

(declare-fun e!142534 () Unit!6486)

(assert (=> d!58535 (= lt!111714 e!142534)))

(declare-fun c!36476 () Bool)

(assert (=> d!58535 (= c!36476 lt!111713)))

(assert (=> d!58535 (= lt!111713 (containsKey!250 (toList!1616 lt!111638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58535 (= (contains!1457 lt!111638 #b1000000000000000000000000000000000000000000000000000000000000000) lt!111711)))

(declare-fun b!219129 () Bool)

(declare-fun lt!111712 () Unit!6486)

(assert (=> b!219129 (= e!142534 lt!111712)))

(assert (=> b!219129 (= lt!111712 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1616 lt!111638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219129 (isDefined!200 (getValueByKey!258 (toList!1616 lt!111638) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219130 () Bool)

(declare-fun Unit!6492 () Unit!6486)

(assert (=> b!219130 (= e!142534 Unit!6492)))

(declare-fun b!219131 () Bool)

(assert (=> b!219131 (= e!142535 (isDefined!200 (getValueByKey!258 (toList!1616 lt!111638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58535 c!36476) b!219129))

(assert (= (and d!58535 (not c!36476)) b!219130))

(assert (= (and d!58535 (not res!107378)) b!219131))

(declare-fun m!244335 () Bool)

(assert (=> d!58535 m!244335))

(declare-fun m!244337 () Bool)

(assert (=> b!219129 m!244337))

(declare-fun m!244339 () Bool)

(assert (=> b!219129 m!244339))

(assert (=> b!219129 m!244339))

(declare-fun m!244341 () Bool)

(assert (=> b!219129 m!244341))

(assert (=> b!219131 m!244339))

(assert (=> b!219131 m!244339))

(assert (=> b!219131 m!244341))

(assert (=> bm!20459 d!58535))

(declare-fun d!58537 () Bool)

(declare-fun isEmpty!507 (Option!264) Bool)

(assert (=> d!58537 (= (isDefined!200 (getValueByKey!258 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932)) (not (isEmpty!507 (getValueByKey!258 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))))

(declare-fun bs!8420 () Bool)

(assert (= bs!8420 d!58537))

(assert (=> bs!8420 m!244141))

(declare-fun m!244343 () Bool)

(assert (=> bs!8420 m!244343))

(assert (=> b!218958 d!58537))

(declare-fun b!219140 () Bool)

(declare-fun e!142540 () Option!264)

(assert (=> b!219140 (= e!142540 (Some!263 (_2!2160 (h!3861 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))))))

(declare-fun b!219142 () Bool)

(declare-fun e!142541 () Option!264)

(assert (=> b!219142 (= e!142541 (getValueByKey!258 (t!8166 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) key!932))))

(declare-fun d!58539 () Bool)

(declare-fun c!36481 () Bool)

(assert (=> d!58539 (= c!36481 (and ((_ is Cons!3214) (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (= (_1!2160 (h!3861 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)))))

(assert (=> d!58539 (= (getValueByKey!258 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932) e!142540)))

(declare-fun b!219143 () Bool)

(assert (=> b!219143 (= e!142541 None!262)))

(declare-fun b!219141 () Bool)

(assert (=> b!219141 (= e!142540 e!142541)))

(declare-fun c!36482 () Bool)

(assert (=> b!219141 (= c!36482 (and ((_ is Cons!3214) (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (not (= (_1!2160 (h!3861 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932))))))

(assert (= (and d!58539 c!36481) b!219140))

(assert (= (and d!58539 (not c!36481)) b!219141))

(assert (= (and b!219141 c!36482) b!219142))

(assert (= (and b!219141 (not c!36482)) b!219143))

(declare-fun m!244345 () Bool)

(assert (=> b!219142 m!244345))

(assert (=> b!218958 d!58539))

(declare-fun d!58541 () Bool)

(assert (=> d!58541 (isDefined!200 (getValueByKey!258 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-fun lt!111717 () Unit!6486)

(declare-fun choose!1098 (List!3218 (_ BitVec 64)) Unit!6486)

(assert (=> d!58541 (= lt!111717 (choose!1098 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(declare-fun e!142544 () Bool)

(assert (=> d!58541 e!142544))

(declare-fun res!107381 () Bool)

(assert (=> d!58541 (=> (not res!107381) (not e!142544))))

(declare-fun isStrictlySorted!353 (List!3218) Bool)

(assert (=> d!58541 (= res!107381 (isStrictlySorted!353 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))))))

(assert (=> d!58541 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932) lt!111717)))

(declare-fun b!219146 () Bool)

(assert (=> b!219146 (= e!142544 (containsKey!250 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932))))

(assert (= (and d!58541 res!107381) b!219146))

(assert (=> d!58541 m!244141))

(assert (=> d!58541 m!244141))

(assert (=> d!58541 m!244143))

(declare-fun m!244347 () Bool)

(assert (=> d!58541 m!244347))

(declare-fun m!244349 () Bool)

(assert (=> d!58541 m!244349))

(assert (=> b!219146 m!244137))

(assert (=> b!218956 d!58541))

(assert (=> b!218956 d!58537))

(assert (=> b!218956 d!58539))

(declare-fun d!58543 () Bool)

(assert (=> d!58543 (= (inRange!0 (index!5327 lt!111557) (mask!9916 thiss!1504)) (and (bvsge (index!5327 lt!111557) #b00000000000000000000000000000000) (bvslt (index!5327 lt!111557) (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!218906 d!58543))

(assert (=> d!58481 d!58477))

(declare-fun b!219163 () Bool)

(declare-fun e!142556 () Bool)

(declare-fun lt!111720 () SeekEntryResult!789)

(assert (=> b!219163 (= e!142556 ((_ is Undefined!789) lt!111720))))

(declare-fun b!219164 () Bool)

(declare-fun e!142553 () Bool)

(assert (=> b!219164 (= e!142553 e!142556)))

(declare-fun c!36487 () Bool)

(assert (=> b!219164 (= c!36487 ((_ is MissingVacant!789) lt!111720))))

(declare-fun b!219165 () Bool)

(declare-fun e!142555 () Bool)

(declare-fun call!20478 () Bool)

(assert (=> b!219165 (= e!142555 (not call!20478))))

(declare-fun call!20477 () Bool)

(declare-fun c!36488 () Bool)

(declare-fun bm!20474 () Bool)

(assert (=> bm!20474 (= call!20477 (inRange!0 (ite c!36488 (index!5326 lt!111720) (index!5329 lt!111720)) (mask!9916 thiss!1504)))))

(declare-fun b!219166 () Bool)

(declare-fun e!142554 () Bool)

(assert (=> b!219166 (= e!142554 (not call!20478))))

(declare-fun d!58545 () Bool)

(assert (=> d!58545 e!142553))

(assert (=> d!58545 (= c!36488 ((_ is MissingZero!789) lt!111720))))

(assert (=> d!58545 (= lt!111720 (seekEntryOrOpen!0 key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(assert (=> d!58545 true))

(declare-fun _$34!1098 () Unit!6486)

(assert (=> d!58545 (= (choose!1095 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) _$34!1098)))

(declare-fun b!219167 () Bool)

(declare-fun res!107392 () Bool)

(assert (=> b!219167 (=> (not res!107392) (not e!142554))))

(assert (=> b!219167 (= res!107392 call!20477)))

(assert (=> b!219167 (= e!142556 e!142554)))

(declare-fun b!219168 () Bool)

(declare-fun res!107390 () Bool)

(assert (=> b!219168 (=> (not res!107390) (not e!142554))))

(assert (=> b!219168 (= res!107390 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5329 lt!111720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20475 () Bool)

(assert (=> bm!20475 (= call!20478 (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219169 () Bool)

(assert (=> b!219169 (= e!142553 e!142555)))

(declare-fun res!107393 () Bool)

(assert (=> b!219169 (= res!107393 call!20477)))

(assert (=> b!219169 (=> (not res!107393) (not e!142555))))

(declare-fun b!219170 () Bool)

(declare-fun res!107391 () Bool)

(assert (=> b!219170 (= res!107391 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5326 lt!111720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219170 (=> (not res!107391) (not e!142555))))

(assert (= (and d!58545 c!36488) b!219169))

(assert (= (and d!58545 (not c!36488)) b!219164))

(assert (= (and b!219169 res!107393) b!219170))

(assert (= (and b!219170 res!107391) b!219165))

(assert (= (and b!219164 c!36487) b!219167))

(assert (= (and b!219164 (not c!36487)) b!219163))

(assert (= (and b!219167 res!107392) b!219168))

(assert (= (and b!219168 res!107390) b!219166))

(assert (= (or b!219169 b!219167) bm!20474))

(assert (= (or b!219165 b!219166) bm!20475))

(declare-fun m!244351 () Bool)

(assert (=> bm!20474 m!244351))

(declare-fun m!244353 () Bool)

(assert (=> b!219170 m!244353))

(assert (=> bm!20475 m!244023))

(declare-fun m!244355 () Bool)

(assert (=> b!219168 m!244355))

(assert (=> d!58545 m!244041))

(assert (=> d!58481 d!58545))

(declare-fun d!58547 () Bool)

(assert (=> d!58547 (= (validMask!0 (mask!9916 thiss!1504)) (and (or (= (mask!9916 thiss!1504) #b00000000000000000000000000000111) (= (mask!9916 thiss!1504) #b00000000000000000000000000001111) (= (mask!9916 thiss!1504) #b00000000000000000000000000011111) (= (mask!9916 thiss!1504) #b00000000000000000000000000111111) (= (mask!9916 thiss!1504) #b00000000000000000000000001111111) (= (mask!9916 thiss!1504) #b00000000000000000000000011111111) (= (mask!9916 thiss!1504) #b00000000000000000000000111111111) (= (mask!9916 thiss!1504) #b00000000000000000000001111111111) (= (mask!9916 thiss!1504) #b00000000000000000000011111111111) (= (mask!9916 thiss!1504) #b00000000000000000000111111111111) (= (mask!9916 thiss!1504) #b00000000000000000001111111111111) (= (mask!9916 thiss!1504) #b00000000000000000011111111111111) (= (mask!9916 thiss!1504) #b00000000000000000111111111111111) (= (mask!9916 thiss!1504) #b00000000000000001111111111111111) (= (mask!9916 thiss!1504) #b00000000000000011111111111111111) (= (mask!9916 thiss!1504) #b00000000000000111111111111111111) (= (mask!9916 thiss!1504) #b00000000000001111111111111111111) (= (mask!9916 thiss!1504) #b00000000000011111111111111111111) (= (mask!9916 thiss!1504) #b00000000000111111111111111111111) (= (mask!9916 thiss!1504) #b00000000001111111111111111111111) (= (mask!9916 thiss!1504) #b00000000011111111111111111111111) (= (mask!9916 thiss!1504) #b00000000111111111111111111111111) (= (mask!9916 thiss!1504) #b00000001111111111111111111111111) (= (mask!9916 thiss!1504) #b00000011111111111111111111111111) (= (mask!9916 thiss!1504) #b00000111111111111111111111111111) (= (mask!9916 thiss!1504) #b00001111111111111111111111111111) (= (mask!9916 thiss!1504) #b00011111111111111111111111111111) (= (mask!9916 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9916 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!58481 d!58547))

(declare-fun b!219183 () Bool)

(declare-fun e!142565 () SeekEntryResult!789)

(assert (=> b!219183 (= e!142565 (MissingVacant!789 (index!5328 lt!111565)))))

(declare-fun b!219184 () Bool)

(declare-fun c!36496 () Bool)

(declare-fun lt!111726 () (_ BitVec 64))

(assert (=> b!219184 (= c!36496 (= lt!111726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142563 () SeekEntryResult!789)

(assert (=> b!219184 (= e!142563 e!142565)))

(declare-fun b!219185 () Bool)

(declare-fun e!142564 () SeekEntryResult!789)

(assert (=> b!219185 (= e!142564 Undefined!789)))

(declare-fun b!219186 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!219186 (= e!142565 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22870 lt!111565) #b00000000000000000000000000000001) (nextIndex!0 (index!5328 lt!111565) (x!22870 lt!111565) (mask!9916 thiss!1504)) (index!5328 lt!111565) key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun b!219187 () Bool)

(assert (=> b!219187 (= e!142563 (Found!789 (index!5328 lt!111565)))))

(declare-fun d!58549 () Bool)

(declare-fun lt!111725 () SeekEntryResult!789)

(assert (=> d!58549 (and (or ((_ is Undefined!789) lt!111725) (not ((_ is Found!789) lt!111725)) (and (bvsge (index!5327 lt!111725) #b00000000000000000000000000000000) (bvslt (index!5327 lt!111725) (size!5419 (_keys!6183 thiss!1504))))) (or ((_ is Undefined!789) lt!111725) ((_ is Found!789) lt!111725) (not ((_ is MissingVacant!789) lt!111725)) (not (= (index!5329 lt!111725) (index!5328 lt!111565))) (and (bvsge (index!5329 lt!111725) #b00000000000000000000000000000000) (bvslt (index!5329 lt!111725) (size!5419 (_keys!6183 thiss!1504))))) (or ((_ is Undefined!789) lt!111725) (ite ((_ is Found!789) lt!111725) (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5327 lt!111725)) key!932) (and ((_ is MissingVacant!789) lt!111725) (= (index!5329 lt!111725) (index!5328 lt!111565)) (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5329 lt!111725)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58549 (= lt!111725 e!142564)))

(declare-fun c!36495 () Bool)

(assert (=> d!58549 (= c!36495 (bvsge (x!22870 lt!111565) #b01111111111111111111111111111110))))

(assert (=> d!58549 (= lt!111726 (select (arr!5086 (_keys!6183 thiss!1504)) (index!5328 lt!111565)))))

(assert (=> d!58549 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58549 (= (seekKeyOrZeroReturnVacant!0 (x!22870 lt!111565) (index!5328 lt!111565) (index!5328 lt!111565) key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)) lt!111725)))

(declare-fun b!219188 () Bool)

(assert (=> b!219188 (= e!142564 e!142563)))

(declare-fun c!36497 () Bool)

(assert (=> b!219188 (= c!36497 (= lt!111726 key!932))))

(assert (= (and d!58549 c!36495) b!219185))

(assert (= (and d!58549 (not c!36495)) b!219188))

(assert (= (and b!219188 c!36497) b!219187))

(assert (= (and b!219188 (not c!36497)) b!219184))

(assert (= (and b!219184 c!36496) b!219183))

(assert (= (and b!219184 (not c!36496)) b!219186))

(declare-fun m!244357 () Bool)

(assert (=> b!219186 m!244357))

(assert (=> b!219186 m!244357))

(declare-fun m!244359 () Bool)

(assert (=> b!219186 m!244359))

(declare-fun m!244361 () Bool)

(assert (=> d!58549 m!244361))

(declare-fun m!244363 () Bool)

(assert (=> d!58549 m!244363))

(assert (=> d!58549 m!244125))

(assert (=> d!58549 m!244109))

(assert (=> b!218924 d!58549))

(declare-fun d!58551 () Bool)

(declare-fun e!142566 () Bool)

(assert (=> d!58551 e!142566))

(declare-fun res!107394 () Bool)

(assert (=> d!58551 (=> (not res!107394) (not e!142566))))

(declare-fun lt!111729 () ListLongMap!3201)

(assert (=> d!58551 (= res!107394 (contains!1457 lt!111729 (_1!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(declare-fun lt!111728 () List!3218)

(assert (=> d!58551 (= lt!111729 (ListLongMap!3202 lt!111728))))

(declare-fun lt!111727 () Unit!6486)

(declare-fun lt!111730 () Unit!6486)

(assert (=> d!58551 (= lt!111727 lt!111730)))

(assert (=> d!58551 (= (getValueByKey!258 lt!111728 (_1!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (=> d!58551 (= lt!111730 (lemmaContainsTupThenGetReturnValue!147 lt!111728 (_1!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (=> d!58551 (= lt!111728 (insertStrictlySorted!150 (toList!1616 call!20466) (_1!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))) (_2!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (=> d!58551 (= (+!596 call!20466 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))) lt!111729)))

(declare-fun b!219189 () Bool)

(declare-fun res!107395 () Bool)

(assert (=> b!219189 (=> (not res!107395) (not e!142566))))

(assert (=> b!219189 (= res!107395 (= (getValueByKey!258 (toList!1616 lt!111729) (_1!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (Some!263 (_2!2160 (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(declare-fun b!219190 () Bool)

(assert (=> b!219190 (= e!142566 (contains!1458 (toList!1616 lt!111729) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))

(assert (= (and d!58551 res!107394) b!219189))

(assert (= (and b!219189 res!107395) b!219190))

(declare-fun m!244365 () Bool)

(assert (=> d!58551 m!244365))

(declare-fun m!244367 () Bool)

(assert (=> d!58551 m!244367))

(declare-fun m!244369 () Bool)

(assert (=> d!58551 m!244369))

(declare-fun m!244371 () Bool)

(assert (=> d!58551 m!244371))

(declare-fun m!244373 () Bool)

(assert (=> b!219189 m!244373))

(declare-fun m!244375 () Bool)

(assert (=> b!219190 m!244375))

(assert (=> b!219018 d!58551))

(declare-fun d!58553 () Bool)

(assert (=> d!58553 (= (apply!202 lt!111638 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)) (get!2669 (getValueByKey!258 (toList!1616 lt!111638) (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8421 () Bool)

(assert (= bs!8421 d!58553))

(assert (=> bs!8421 m!244145))

(declare-fun m!244377 () Bool)

(assert (=> bs!8421 m!244377))

(assert (=> bs!8421 m!244377))

(declare-fun m!244379 () Bool)

(assert (=> bs!8421 m!244379))

(assert (=> b!219017 d!58553))

(declare-fun d!58555 () Bool)

(declare-fun c!36500 () Bool)

(assert (=> d!58555 (= c!36500 ((_ is ValueCellFull!2531) (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!142569 () V!7313)

(assert (=> d!58555 (= (get!2668 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!142569)))

(declare-fun b!219195 () Bool)

(declare-fun get!2670 (ValueCell!2531 V!7313) V!7313)

(assert (=> b!219195 (= e!142569 (get!2670 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219196 () Bool)

(declare-fun get!2671 (ValueCell!2531 V!7313) V!7313)

(assert (=> b!219196 (= e!142569 (get!2671 (select (arr!5085 (_values!4117 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!536 (defaultEntry!4134 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58555 c!36500) b!219195))

(assert (= (and d!58555 (not c!36500)) b!219196))

(assert (=> b!219195 m!244167))

(assert (=> b!219195 m!244165))

(declare-fun m!244381 () Bool)

(assert (=> b!219195 m!244381))

(assert (=> b!219196 m!244167))

(assert (=> b!219196 m!244165))

(declare-fun m!244383 () Bool)

(assert (=> b!219196 m!244383))

(assert (=> b!219017 d!58555))

(declare-fun d!58557 () Bool)

(assert (=> d!58557 (= (inRange!0 (ite c!36435 (index!5326 lt!111572) (index!5329 lt!111572)) (mask!9916 thiss!1504)) (and (bvsge (ite c!36435 (index!5326 lt!111572) (index!5329 lt!111572)) #b00000000000000000000000000000000) (bvslt (ite c!36435 (index!5326 lt!111572) (index!5329 lt!111572)) (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!20442 d!58557))

(declare-fun d!58559 () Bool)

(declare-fun e!142571 () Bool)

(assert (=> d!58559 e!142571))

(declare-fun res!107396 () Bool)

(assert (=> d!58559 (=> res!107396 e!142571)))

(declare-fun lt!111731 () Bool)

(assert (=> d!58559 (= res!107396 (not lt!111731))))

(declare-fun lt!111733 () Bool)

(assert (=> d!58559 (= lt!111731 lt!111733)))

(declare-fun lt!111734 () Unit!6486)

(declare-fun e!142570 () Unit!6486)

(assert (=> d!58559 (= lt!111734 e!142570)))

(declare-fun c!36501 () Bool)

(assert (=> d!58559 (= c!36501 lt!111733)))

(assert (=> d!58559 (= lt!111733 (containsKey!250 (toList!1616 lt!111638) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58559 (= (contains!1457 lt!111638 #b0000000000000000000000000000000000000000000000000000000000000000) lt!111731)))

(declare-fun b!219197 () Bool)

(declare-fun lt!111732 () Unit!6486)

(assert (=> b!219197 (= e!142570 lt!111732)))

(assert (=> b!219197 (= lt!111732 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1616 lt!111638) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219197 (isDefined!200 (getValueByKey!258 (toList!1616 lt!111638) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219198 () Bool)

(declare-fun Unit!6493 () Unit!6486)

(assert (=> b!219198 (= e!142570 Unit!6493)))

(declare-fun b!219199 () Bool)

(assert (=> b!219199 (= e!142571 (isDefined!200 (getValueByKey!258 (toList!1616 lt!111638) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58559 c!36501) b!219197))

(assert (= (and d!58559 (not c!36501)) b!219198))

(assert (= (and d!58559 (not res!107396)) b!219199))

(declare-fun m!244385 () Bool)

(assert (=> d!58559 m!244385))

(declare-fun m!244387 () Bool)

(assert (=> b!219197 m!244387))

(declare-fun m!244389 () Bool)

(assert (=> b!219197 m!244389))

(assert (=> b!219197 m!244389))

(declare-fun m!244391 () Bool)

(assert (=> b!219197 m!244391))

(assert (=> b!219199 m!244389))

(assert (=> b!219199 m!244389))

(assert (=> b!219199 m!244391))

(assert (=> bm!20457 d!58559))

(declare-fun d!58561 () Bool)

(declare-fun e!142573 () Bool)

(assert (=> d!58561 e!142573))

(declare-fun res!107397 () Bool)

(assert (=> d!58561 (=> res!107397 e!142573)))

(declare-fun lt!111735 () Bool)

(assert (=> d!58561 (= res!107397 (not lt!111735))))

(declare-fun lt!111737 () Bool)

(assert (=> d!58561 (= lt!111735 lt!111737)))

(declare-fun lt!111738 () Unit!6486)

(declare-fun e!142572 () Unit!6486)

(assert (=> d!58561 (= lt!111738 e!142572)))

(declare-fun c!36502 () Bool)

(assert (=> d!58561 (= c!36502 lt!111737)))

(assert (=> d!58561 (= lt!111737 (containsKey!250 (toList!1616 lt!111638) (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58561 (= (contains!1457 lt!111638 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)) lt!111735)))

(declare-fun b!219200 () Bool)

(declare-fun lt!111736 () Unit!6486)

(assert (=> b!219200 (= e!142572 lt!111736)))

(assert (=> b!219200 (= lt!111736 (lemmaContainsKeyImpliesGetValueByKeyDefined!199 (toList!1616 lt!111638) (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!219200 (isDefined!200 (getValueByKey!258 (toList!1616 lt!111638) (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219201 () Bool)

(declare-fun Unit!6494 () Unit!6486)

(assert (=> b!219201 (= e!142572 Unit!6494)))

(declare-fun b!219202 () Bool)

(assert (=> b!219202 (= e!142573 (isDefined!200 (getValueByKey!258 (toList!1616 lt!111638) (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58561 c!36502) b!219200))

(assert (= (and d!58561 (not c!36502)) b!219201))

(assert (= (and d!58561 (not res!107397)) b!219202))

(assert (=> d!58561 m!244145))

(declare-fun m!244393 () Bool)

(assert (=> d!58561 m!244393))

(assert (=> b!219200 m!244145))

(declare-fun m!244395 () Bool)

(assert (=> b!219200 m!244395))

(assert (=> b!219200 m!244145))

(assert (=> b!219200 m!244377))

(assert (=> b!219200 m!244377))

(declare-fun m!244397 () Bool)

(assert (=> b!219200 m!244397))

(assert (=> b!219202 m!244145))

(assert (=> b!219202 m!244377))

(assert (=> b!219202 m!244377))

(assert (=> b!219202 m!244397))

(assert (=> b!219001 d!58561))

(declare-fun d!58563 () Bool)

(declare-fun e!142574 () Bool)

(assert (=> d!58563 e!142574))

(declare-fun res!107398 () Bool)

(assert (=> d!58563 (=> (not res!107398) (not e!142574))))

(declare-fun lt!111741 () ListLongMap!3201)

(assert (=> d!58563 (= res!107398 (contains!1457 lt!111741 (_1!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(declare-fun lt!111740 () List!3218)

(assert (=> d!58563 (= lt!111741 (ListLongMap!3202 lt!111740))))

(declare-fun lt!111739 () Unit!6486)

(declare-fun lt!111742 () Unit!6486)

(assert (=> d!58563 (= lt!111739 lt!111742)))

(assert (=> d!58563 (= (getValueByKey!258 lt!111740 (_1!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))) (Some!263 (_2!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(assert (=> d!58563 (= lt!111742 (lemmaContainsTupThenGetReturnValue!147 lt!111740 (_1!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (_2!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(assert (=> d!58563 (= lt!111740 (insertStrictlySorted!150 (toList!1616 (ite c!36453 call!20465 (ite c!36455 call!20461 call!20460))) (_1!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) (_2!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))))))

(assert (=> d!58563 (= (+!596 (ite c!36453 call!20465 (ite c!36455 call!20461 call!20460)) (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))) lt!111741)))

(declare-fun b!219203 () Bool)

(declare-fun res!107399 () Bool)

(assert (=> b!219203 (=> (not res!107399) (not e!142574))))

(assert (=> b!219203 (= res!107399 (= (getValueByKey!258 (toList!1616 lt!111741) (_1!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504))))) (Some!263 (_2!2160 (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))))

(declare-fun b!219204 () Bool)

(assert (=> b!219204 (= e!142574 (contains!1458 (toList!1616 lt!111741) (ite (or c!36453 c!36455) (tuple2!4299 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3975 thiss!1504)) (tuple2!4299 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3975 thiss!1504)))))))

(assert (= (and d!58563 res!107398) b!219203))

(assert (= (and b!219203 res!107399) b!219204))

(declare-fun m!244399 () Bool)

(assert (=> d!58563 m!244399))

(declare-fun m!244401 () Bool)

(assert (=> d!58563 m!244401))

(declare-fun m!244403 () Bool)

(assert (=> d!58563 m!244403))

(declare-fun m!244405 () Bool)

(assert (=> d!58563 m!244405))

(declare-fun m!244407 () Bool)

(assert (=> b!219203 m!244407))

(declare-fun m!244409 () Bool)

(assert (=> b!219204 m!244409))

(assert (=> bm!20462 d!58563))

(declare-fun d!58565 () Bool)

(declare-fun res!107400 () Bool)

(declare-fun e!142575 () Bool)

(assert (=> d!58565 (=> res!107400 e!142575)))

(assert (=> d!58565 (= res!107400 (= (select (arr!5086 (_keys!6183 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!58565 (= (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!142575)))

(declare-fun b!219205 () Bool)

(declare-fun e!142576 () Bool)

(assert (=> b!219205 (= e!142575 e!142576)))

(declare-fun res!107401 () Bool)

(assert (=> b!219205 (=> (not res!107401) (not e!142576))))

(assert (=> b!219205 (= res!107401 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun b!219206 () Bool)

(assert (=> b!219206 (= e!142576 (arrayContainsKey!0 (_keys!6183 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!58565 (not res!107400)) b!219205))

(assert (= (and b!219205 res!107401) b!219206))

(declare-fun m!244411 () Bool)

(assert (=> d!58565 m!244411))

(declare-fun m!244413 () Bool)

(assert (=> b!219206 m!244413))

(assert (=> b!219029 d!58565))

(declare-fun d!58567 () Bool)

(assert (=> d!58567 (= (apply!202 lt!111638 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2669 (getValueByKey!258 (toList!1616 lt!111638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8422 () Bool)

(assert (= bs!8422 d!58567))

(assert (=> bs!8422 m!244339))

(assert (=> bs!8422 m!244339))

(declare-fun m!244415 () Bool)

(assert (=> bs!8422 m!244415))

(assert (=> b!219014 d!58567))

(assert (=> d!58487 d!58547))

(assert (=> bm!20441 d!58489))

(assert (=> d!58475 d!58477))

(declare-fun d!58569 () Bool)

(declare-fun e!142579 () Bool)

(assert (=> d!58569 e!142579))

(declare-fun res!107407 () Bool)

(assert (=> d!58569 (=> (not res!107407) (not e!142579))))

(declare-fun lt!111745 () SeekEntryResult!789)

(assert (=> d!58569 (= res!107407 ((_ is Found!789) lt!111745))))

(assert (=> d!58569 (= lt!111745 (seekEntryOrOpen!0 key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(assert (=> d!58569 true))

(declare-fun _$33!153 () Unit!6486)

(assert (=> d!58569 (= (choose!1094 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) key!932 (defaultEntry!4134 thiss!1504)) _$33!153)))

(declare-fun b!219211 () Bool)

(declare-fun res!107406 () Bool)

(assert (=> b!219211 (=> (not res!107406) (not e!142579))))

(assert (=> b!219211 (= res!107406 (inRange!0 (index!5327 lt!111745) (mask!9916 thiss!1504)))))

(declare-fun b!219212 () Bool)

(assert (=> b!219212 (= e!142579 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5327 lt!111745)) key!932))))

(assert (= (and d!58569 res!107407) b!219211))

(assert (= (and b!219211 res!107406) b!219212))

(assert (=> d!58569 m!244041))

(declare-fun m!244417 () Bool)

(assert (=> b!219211 m!244417))

(declare-fun m!244419 () Bool)

(assert (=> b!219212 m!244419))

(assert (=> d!58475 d!58569))

(assert (=> d!58475 d!58547))

(declare-fun b!219232 () Bool)

(declare-fun lt!111751 () SeekEntryResult!789)

(assert (=> b!219232 (and (bvsge (index!5328 lt!111751) #b00000000000000000000000000000000) (bvslt (index!5328 lt!111751) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun e!142590 () Bool)

(assert (=> b!219232 (= e!142590 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5328 lt!111751)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219233 () Bool)

(declare-fun e!142591 () SeekEntryResult!789)

(declare-fun e!142593 () SeekEntryResult!789)

(assert (=> b!219233 (= e!142591 e!142593)))

(declare-fun c!36510 () Bool)

(declare-fun lt!111750 () (_ BitVec 64))

(assert (=> b!219233 (= c!36510 (or (= lt!111750 key!932) (= (bvadd lt!111750 lt!111750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!219234 () Bool)

(assert (=> b!219234 (= e!142593 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9916 thiss!1504)) #b00000000000000000000000000000000 (mask!9916 thiss!1504)) key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun b!219235 () Bool)

(assert (=> b!219235 (and (bvsge (index!5328 lt!111751) #b00000000000000000000000000000000) (bvslt (index!5328 lt!111751) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun res!107414 () Bool)

(assert (=> b!219235 (= res!107414 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5328 lt!111751)) key!932))))

(assert (=> b!219235 (=> res!107414 e!142590)))

(declare-fun e!142594 () Bool)

(assert (=> b!219235 (= e!142594 e!142590)))

(declare-fun b!219236 () Bool)

(declare-fun e!142592 () Bool)

(assert (=> b!219236 (= e!142592 (bvsge (x!22870 lt!111751) #b01111111111111111111111111111110))))

(declare-fun b!219237 () Bool)

(assert (=> b!219237 (and (bvsge (index!5328 lt!111751) #b00000000000000000000000000000000) (bvslt (index!5328 lt!111751) (size!5419 (_keys!6183 thiss!1504))))))

(declare-fun res!107415 () Bool)

(assert (=> b!219237 (= res!107415 (= (select (arr!5086 (_keys!6183 thiss!1504)) (index!5328 lt!111751)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219237 (=> res!107415 e!142590)))

(declare-fun d!58571 () Bool)

(assert (=> d!58571 e!142592))

(declare-fun c!36509 () Bool)

(assert (=> d!58571 (= c!36509 (and ((_ is Intermediate!789) lt!111751) (undefined!1601 lt!111751)))))

(assert (=> d!58571 (= lt!111751 e!142591)))

(declare-fun c!36511 () Bool)

(assert (=> d!58571 (= c!36511 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58571 (= lt!111750 (select (arr!5086 (_keys!6183 thiss!1504)) (toIndex!0 key!932 (mask!9916 thiss!1504))))))

(assert (=> d!58571 (validMask!0 (mask!9916 thiss!1504))))

(assert (=> d!58571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9916 thiss!1504)) key!932 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)) lt!111751)))

(declare-fun b!219231 () Bool)

(assert (=> b!219231 (= e!142591 (Intermediate!789 true (toIndex!0 key!932 (mask!9916 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!219238 () Bool)

(assert (=> b!219238 (= e!142593 (Intermediate!789 false (toIndex!0 key!932 (mask!9916 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!219239 () Bool)

(assert (=> b!219239 (= e!142592 e!142594)))

(declare-fun res!107416 () Bool)

(assert (=> b!219239 (= res!107416 (and ((_ is Intermediate!789) lt!111751) (not (undefined!1601 lt!111751)) (bvslt (x!22870 lt!111751) #b01111111111111111111111111111110) (bvsge (x!22870 lt!111751) #b00000000000000000000000000000000) (bvsge (x!22870 lt!111751) #b00000000000000000000000000000000)))))

(assert (=> b!219239 (=> (not res!107416) (not e!142594))))

(assert (= (and d!58571 c!36511) b!219231))

(assert (= (and d!58571 (not c!36511)) b!219233))

(assert (= (and b!219233 c!36510) b!219238))

(assert (= (and b!219233 (not c!36510)) b!219234))

(assert (= (and d!58571 c!36509) b!219236))

(assert (= (and d!58571 (not c!36509)) b!219239))

(assert (= (and b!219239 res!107416) b!219235))

(assert (= (and b!219235 (not res!107414)) b!219237))

(assert (= (and b!219237 (not res!107415)) b!219232))

(assert (=> b!219234 m!244119))

(declare-fun m!244421 () Bool)

(assert (=> b!219234 m!244421))

(assert (=> b!219234 m!244421))

(declare-fun m!244423 () Bool)

(assert (=> b!219234 m!244423))

(assert (=> d!58571 m!244119))

(declare-fun m!244425 () Bool)

(assert (=> d!58571 m!244425))

(assert (=> d!58571 m!244109))

(declare-fun m!244427 () Bool)

(assert (=> b!219237 m!244427))

(assert (=> b!219235 m!244427))

(assert (=> b!219232 m!244427))

(assert (=> d!58477 d!58571))

(declare-fun d!58573 () Bool)

(declare-fun lt!111757 () (_ BitVec 32))

(declare-fun lt!111756 () (_ BitVec 32))

(assert (=> d!58573 (= lt!111757 (bvmul (bvxor lt!111756 (bvlshr lt!111756 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58573 (= lt!111756 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58573 (and (bvsge (mask!9916 thiss!1504) #b00000000000000000000000000000000) (let ((res!107417 (let ((h!3863 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22890 (bvmul (bvxor h!3863 (bvlshr h!3863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22890 (bvlshr x!22890 #b00000000000000000000000000001101)) (mask!9916 thiss!1504)))))) (and (bvslt res!107417 (bvadd (mask!9916 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!107417 #b00000000000000000000000000000000))))))

(assert (=> d!58573 (= (toIndex!0 key!932 (mask!9916 thiss!1504)) (bvand (bvxor lt!111757 (bvlshr lt!111757 #b00000000000000000000000000001101)) (mask!9916 thiss!1504)))))

(assert (=> d!58477 d!58573))

(assert (=> d!58477 d!58547))

(assert (=> b!219012 d!58533))

(declare-fun d!58575 () Bool)

(assert (=> d!58575 (= (apply!202 lt!111638 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2669 (getValueByKey!258 (toList!1616 lt!111638) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8423 () Bool)

(assert (= bs!8423 d!58575))

(assert (=> bs!8423 m!244389))

(assert (=> bs!8423 m!244389))

(declare-fun m!244429 () Bool)

(assert (=> bs!8423 m!244429))

(assert (=> b!219010 d!58575))

(declare-fun b!219248 () Bool)

(declare-fun e!142602 () Bool)

(declare-fun call!20481 () Bool)

(assert (=> b!219248 (= e!142602 call!20481)))

(declare-fun bm!20478 () Bool)

(assert (=> bm!20478 (= call!20481 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6183 thiss!1504) (mask!9916 thiss!1504)))))

(declare-fun b!219249 () Bool)

(declare-fun e!142603 () Bool)

(assert (=> b!219249 (= e!142602 e!142603)))

(declare-fun lt!111764 () (_ BitVec 64))

(assert (=> b!219249 (= lt!111764 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!111766 () Unit!6486)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10733 (_ BitVec 64) (_ BitVec 32)) Unit!6486)

(assert (=> b!219249 (= lt!111766 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6183 thiss!1504) lt!111764 #b00000000000000000000000000000000))))

(assert (=> b!219249 (arrayContainsKey!0 (_keys!6183 thiss!1504) lt!111764 #b00000000000000000000000000000000)))

(declare-fun lt!111765 () Unit!6486)

(assert (=> b!219249 (= lt!111765 lt!111766)))

(declare-fun res!107423 () Bool)

(assert (=> b!219249 (= res!107423 (= (seekEntryOrOpen!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000) (_keys!6183 thiss!1504) (mask!9916 thiss!1504)) (Found!789 #b00000000000000000000000000000000)))))

(assert (=> b!219249 (=> (not res!107423) (not e!142603))))

(declare-fun b!219250 () Bool)

(assert (=> b!219250 (= e!142603 call!20481)))

(declare-fun b!219251 () Bool)

(declare-fun e!142601 () Bool)

(assert (=> b!219251 (= e!142601 e!142602)))

(declare-fun c!36514 () Bool)

(assert (=> b!219251 (= c!36514 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58577 () Bool)

(declare-fun res!107422 () Bool)

(assert (=> d!58577 (=> res!107422 e!142601)))

(assert (=> d!58577 (= res!107422 (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> d!58577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6183 thiss!1504) (mask!9916 thiss!1504)) e!142601)))

(assert (= (and d!58577 (not res!107422)) b!219251))

(assert (= (and b!219251 c!36514) b!219249))

(assert (= (and b!219251 (not c!36514)) b!219248))

(assert (= (and b!219249 res!107423) b!219250))

(assert (= (or b!219250 b!219248) bm!20478))

(declare-fun m!244431 () Bool)

(assert (=> bm!20478 m!244431))

(assert (=> b!219249 m!244145))

(declare-fun m!244433 () Bool)

(assert (=> b!219249 m!244433))

(declare-fun m!244435 () Bool)

(assert (=> b!219249 m!244435))

(assert (=> b!219249 m!244145))

(declare-fun m!244437 () Bool)

(assert (=> b!219249 m!244437))

(assert (=> b!219251 m!244145))

(assert (=> b!219251 m!244145))

(assert (=> b!219251 m!244147))

(assert (=> b!219037 d!58577))

(declare-fun d!58579 () Bool)

(declare-fun res!107428 () Bool)

(declare-fun e!142608 () Bool)

(assert (=> d!58579 (=> res!107428 e!142608)))

(assert (=> d!58579 (= res!107428 (and ((_ is Cons!3214) (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (= (_1!2160 (h!3861 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)))))

(assert (=> d!58579 (= (containsKey!250 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))) key!932) e!142608)))

(declare-fun b!219256 () Bool)

(declare-fun e!142609 () Bool)

(assert (=> b!219256 (= e!142608 e!142609)))

(declare-fun res!107429 () Bool)

(assert (=> b!219256 (=> (not res!107429) (not e!142609))))

(assert (=> b!219256 (= res!107429 (and (or (not ((_ is Cons!3214) (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) (bvsle (_1!2160 (h!3861 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)) ((_ is Cons!3214) (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) (bvslt (_1!2160 (h!3861 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504))))) key!932)))))

(declare-fun b!219257 () Bool)

(assert (=> b!219257 (= e!142609 (containsKey!250 (t!8166 (toList!1616 (getCurrentListMap!1125 (_keys!6183 thiss!1504) (_values!4117 thiss!1504) (mask!9916 thiss!1504) (extraKeys!3871 thiss!1504) (zeroValue!3975 thiss!1504) (minValue!3975 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4134 thiss!1504)))) key!932))))

(assert (= (and d!58579 (not res!107428)) b!219256))

(assert (= (and b!219256 res!107429) b!219257))

(declare-fun m!244439 () Bool)

(assert (=> b!219257 m!244439))

(assert (=> d!58485 d!58579))

(declare-fun bm!20481 () Bool)

(declare-fun call!20484 () Bool)

(declare-fun c!36517 () Bool)

(assert (=> bm!20481 (= call!20484 (arrayNoDuplicates!0 (_keys!6183 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36517 (Cons!3215 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000) Nil!3216) Nil!3216)))))

(declare-fun b!219269 () Bool)

(declare-fun e!142620 () Bool)

(declare-fun contains!1459 (List!3219 (_ BitVec 64)) Bool)

(assert (=> b!219269 (= e!142620 (contains!1459 Nil!3216 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219270 () Bool)

(declare-fun e!142618 () Bool)

(declare-fun e!142619 () Bool)

(assert (=> b!219270 (= e!142618 e!142619)))

(assert (=> b!219270 (= c!36517 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219271 () Bool)

(declare-fun e!142621 () Bool)

(assert (=> b!219271 (= e!142621 e!142618)))

(declare-fun res!107436 () Bool)

(assert (=> b!219271 (=> (not res!107436) (not e!142618))))

(assert (=> b!219271 (= res!107436 (not e!142620))))

(declare-fun res!107437 () Bool)

(assert (=> b!219271 (=> (not res!107437) (not e!142620))))

(assert (=> b!219271 (= res!107437 (validKeyInArray!0 (select (arr!5086 (_keys!6183 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!219272 () Bool)

(assert (=> b!219272 (= e!142619 call!20484)))

(declare-fun d!58581 () Bool)

(declare-fun res!107438 () Bool)

(assert (=> d!58581 (=> res!107438 e!142621)))

(assert (=> d!58581 (= res!107438 (bvsge #b00000000000000000000000000000000 (size!5419 (_keys!6183 thiss!1504))))))

(assert (=> d!58581 (= (arrayNoDuplicates!0 (_keys!6183 thiss!1504) #b00000000000000000000000000000000 Nil!3216) e!142621)))

(declare-fun b!219268 () Bool)

(assert (=> b!219268 (= e!142619 call!20484)))

(assert (= (and d!58581 (not res!107438)) b!219271))

(assert (= (and b!219271 res!107437) b!219269))

(assert (= (and b!219271 res!107436) b!219270))

(assert (= (and b!219270 c!36517) b!219268))

(assert (= (and b!219270 (not c!36517)) b!219272))

(assert (= (or b!219268 b!219272) bm!20481))

(assert (=> bm!20481 m!244145))

(declare-fun m!244441 () Bool)

(assert (=> bm!20481 m!244441))

(assert (=> b!219269 m!244145))

(assert (=> b!219269 m!244145))

(declare-fun m!244443 () Bool)

(assert (=> b!219269 m!244443))

(assert (=> b!219270 m!244145))

(assert (=> b!219270 m!244145))

(assert (=> b!219270 m!244147))

(assert (=> b!219271 m!244145))

(assert (=> b!219271 m!244145))

(assert (=> b!219271 m!244147))

(assert (=> b!219038 d!58581))

(declare-fun mapIsEmpty!9799 () Bool)

(declare-fun mapRes!9799 () Bool)

(assert (=> mapIsEmpty!9799 mapRes!9799))

(declare-fun mapNonEmpty!9799 () Bool)

(declare-fun tp!20815 () Bool)

(declare-fun e!142622 () Bool)

(assert (=> mapNonEmpty!9799 (= mapRes!9799 (and tp!20815 e!142622))))

(declare-fun mapValue!9799 () ValueCell!2531)

(declare-fun mapRest!9799 () (Array (_ BitVec 32) ValueCell!2531))

(declare-fun mapKey!9799 () (_ BitVec 32))

(assert (=> mapNonEmpty!9799 (= mapRest!9798 (store mapRest!9799 mapKey!9799 mapValue!9799))))

(declare-fun b!219273 () Bool)

(assert (=> b!219273 (= e!142622 tp_is_empty!5749)))

(declare-fun condMapEmpty!9799 () Bool)

(declare-fun mapDefault!9799 () ValueCell!2531)

(assert (=> mapNonEmpty!9798 (= condMapEmpty!9799 (= mapRest!9798 ((as const (Array (_ BitVec 32) ValueCell!2531)) mapDefault!9799)))))

(declare-fun e!142623 () Bool)

(assert (=> mapNonEmpty!9798 (= tp!20814 (and e!142623 mapRes!9799))))

(declare-fun b!219274 () Bool)

(assert (=> b!219274 (= e!142623 tp_is_empty!5749)))

(assert (= (and mapNonEmpty!9798 condMapEmpty!9799) mapIsEmpty!9799))

(assert (= (and mapNonEmpty!9798 (not condMapEmpty!9799)) mapNonEmpty!9799))

(assert (= (and mapNonEmpty!9799 ((_ is ValueCellFull!2531) mapValue!9799)) b!219273))

(assert (= (and mapNonEmpty!9798 ((_ is ValueCellFull!2531) mapDefault!9799)) b!219274))

(declare-fun m!244445 () Bool)

(assert (=> mapNonEmpty!9799 m!244445))

(declare-fun b_lambda!7821 () Bool)

(assert (= b_lambda!7817 (or (and b!218788 b_free!5887) b_lambda!7821)))

(declare-fun b_lambda!7823 () Bool)

(assert (= b_lambda!7819 (or (and b!218788 b_free!5887) b_lambda!7823)))

(check-sat (not b_lambda!7821) (not b!219069) (not b!219110) (not b!219131) (not bm!20478) (not b!219067) (not d!58509) (not b!219203) (not b!219114) (not d!58561) (not d!58549) (not bm!20469) (not d!58575) (not b!219204) (not b!219108) (not b!219186) (not b!219195) (not d!58559) (not b!219098) (not b!219126) (not b_next!5887) (not b!219202) (not d!58511) (not b!219142) (not d!58569) (not b!219197) (not b!219200) (not d!58521) (not b!219249) (not b_lambda!7815) (not bm!20474) (not d!58515) (not d!58531) (not bm!20466) (not b!219107) (not b!219234) (not d!58519) (not d!58513) (not d!58523) (not d!58517) (not b!219257) (not b!219196) (not d!58535) tp_is_empty!5749 (not b!219271) (not bm!20475) (not d!58551) (not b!219211) (not d!58503) (not d!58529) (not b!219100) (not mapNonEmpty!9799) (not d!58553) (not b!219101) (not b!219129) (not b!219269) (not d!58563) (not b!219071) (not b!219199) (not b!219127) (not b!219068) (not d!58525) (not bm!20481) (not b!219099) (not b!219111) (not b!219146) (not b_lambda!7823) (not d!58571) (not d!58505) (not b!219206) (not d!58527) (not b!219116) (not d!58501) (not b!219105) (not b!219270) (not d!58507) (not d!58567) (not b!219070) (not b!219251) (not d!58537) (not b!219072) (not b!219190) (not b!219056) (not d!58541) b_and!12763 (not d!58499) (not d!58545) (not b!219103) (not b!219189))
(check-sat b_and!12763 (not b_next!5887))
