; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23180 () Bool)

(assert start!23180)

(declare-fun b!243185 () Bool)

(declare-fun b_free!6519 () Bool)

(declare-fun b_next!6519 () Bool)

(assert (=> b!243185 (= b_free!6519 (not b_next!6519))))

(declare-fun tp!22776 () Bool)

(declare-fun b_and!13499 () Bool)

(assert (=> b!243185 (= tp!22776 b_and!13499)))

(declare-fun b!243168 () Bool)

(declare-fun res!119178 () Bool)

(declare-fun e!157821 () Bool)

(assert (=> b!243168 (=> (not res!119178) (not e!157821))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!243168 (= res!119178 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243169 () Bool)

(declare-fun e!157822 () Bool)

(declare-fun e!157817 () Bool)

(assert (=> b!243169 (= e!157822 e!157817)))

(declare-fun res!119180 () Bool)

(assert (=> b!243169 (=> (not res!119180) (not e!157817))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8155 0))(
  ( (V!8156 (val!3235 Int)) )
))
(declare-datatypes ((ValueCell!2847 0))(
  ( (ValueCellFull!2847 (v!5280 V!8155)) (EmptyCell!2847) )
))
(declare-datatypes ((array!12051 0))(
  ( (array!12052 (arr!5722 (Array (_ BitVec 32) ValueCell!2847)) (size!6064 (_ BitVec 32))) )
))
(declare-datatypes ((array!12053 0))(
  ( (array!12054 (arr!5723 (Array (_ BitVec 32) (_ BitVec 64))) (size!6065 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3594 0))(
  ( (LongMapFixedSize!3595 (defaultEntry!4506 Int) (mask!10595 (_ BitVec 32)) (extraKeys!4243 (_ BitVec 32)) (zeroValue!4347 V!8155) (minValue!4347 V!8155) (_size!1846 (_ BitVec 32)) (_keys!6616 array!12053) (_values!4489 array!12051) (_vacant!1846 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3594)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243169 (= res!119180 (inRange!0 index!297 (mask!10595 thiss!1504)))))

(declare-datatypes ((Unit!7503 0))(
  ( (Unit!7504) )
))
(declare-fun lt!122074 () Unit!7503)

(declare-fun e!157809 () Unit!7503)

(assert (=> b!243169 (= lt!122074 e!157809)))

(declare-fun c!40587 () Bool)

(declare-datatypes ((tuple2!4764 0))(
  ( (tuple2!4765 (_1!2393 (_ BitVec 64)) (_2!2393 V!8155)) )
))
(declare-datatypes ((List!3643 0))(
  ( (Nil!3640) (Cons!3639 (h!4296 tuple2!4764) (t!8648 List!3643)) )
))
(declare-datatypes ((ListLongMap!3677 0))(
  ( (ListLongMap!3678 (toList!1854 List!3643)) )
))
(declare-fun contains!1751 (ListLongMap!3677 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1382 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 32) Int) ListLongMap!3677)

(assert (=> b!243169 (= c!40587 (contains!1751 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)) key!932))))

(declare-fun b!243170 () Bool)

(declare-fun e!157816 () Unit!7503)

(declare-fun Unit!7505 () Unit!7503)

(assert (=> b!243170 (= e!157816 Unit!7505)))

(declare-fun lt!122075 () Unit!7503)

(declare-fun lemmaArrayContainsKeyThenInListMap!164 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 64) (_ BitVec 32) Int) Unit!7503)

(assert (=> b!243170 (= lt!122075 (lemmaArrayContainsKeyThenInListMap!164 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(assert (=> b!243170 false))

(declare-fun b!243171 () Bool)

(declare-fun res!119175 () Bool)

(declare-datatypes ((SeekEntryResult!1070 0))(
  ( (MissingZero!1070 (index!6450 (_ BitVec 32))) (Found!1070 (index!6451 (_ BitVec 32))) (Intermediate!1070 (undefined!1882 Bool) (index!6452 (_ BitVec 32)) (x!24312 (_ BitVec 32))) (Undefined!1070) (MissingVacant!1070 (index!6453 (_ BitVec 32))) )
))
(declare-fun lt!122073 () SeekEntryResult!1070)

(assert (=> b!243171 (= res!119175 (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6453 lt!122073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157811 () Bool)

(assert (=> b!243171 (=> (not res!119175) (not e!157811))))

(declare-fun b!243172 () Bool)

(declare-fun e!157823 () Bool)

(assert (=> b!243172 (= e!157823 e!157811)))

(declare-fun res!119186 () Bool)

(declare-fun call!22671 () Bool)

(assert (=> b!243172 (= res!119186 call!22671)))

(assert (=> b!243172 (=> (not res!119186) (not e!157811))))

(declare-fun b!243173 () Bool)

(declare-fun e!157824 () Bool)

(declare-fun tp_is_empty!6381 () Bool)

(assert (=> b!243173 (= e!157824 tp_is_empty!6381)))

(declare-fun b!243174 () Bool)

(declare-fun res!119185 () Bool)

(declare-fun e!157810 () Bool)

(assert (=> b!243174 (=> (not res!119185) (not e!157810))))

(declare-datatypes ((List!3644 0))(
  ( (Nil!3641) (Cons!3640 (h!4297 (_ BitVec 64)) (t!8649 List!3644)) )
))
(declare-fun contains!1752 (List!3644 (_ BitVec 64)) Bool)

(assert (=> b!243174 (= res!119185 (not (contains!1752 Nil!3641 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243175 () Bool)

(declare-fun e!157820 () Bool)

(assert (=> b!243175 (= e!157820 tp_is_empty!6381)))

(declare-fun b!243176 () Bool)

(declare-fun lt!122071 () Unit!7503)

(assert (=> b!243176 (= e!157809 lt!122071)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!368 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 64) Int) Unit!7503)

(assert (=> b!243176 (= lt!122071 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!368 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 (defaultEntry!4506 thiss!1504)))))

(declare-fun c!40588 () Bool)

(get-info :version)

(assert (=> b!243176 (= c!40588 ((_ is MissingZero!1070) lt!122073))))

(declare-fun e!157814 () Bool)

(assert (=> b!243176 e!157814))

(declare-fun b!243177 () Bool)

(declare-fun Unit!7506 () Unit!7503)

(assert (=> b!243177 (= e!157816 Unit!7506)))

(declare-fun b!243178 () Bool)

(assert (=> b!243178 (= e!157817 e!157810)))

(declare-fun res!119173 () Bool)

(assert (=> b!243178 (=> (not res!119173) (not e!157810))))

(assert (=> b!243178 (= res!119173 (and (bvslt (size!6065 (_keys!6616 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504)))))))

(declare-fun lt!122072 () Unit!7503)

(assert (=> b!243178 (= lt!122072 e!157816)))

(declare-fun c!40589 () Bool)

(declare-fun arrayContainsKey!0 (array!12053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!243178 (= c!40589 (arrayContainsKey!0 (_keys!6616 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10819 () Bool)

(declare-fun mapRes!10819 () Bool)

(assert (=> mapIsEmpty!10819 mapRes!10819))

(declare-fun b!243179 () Bool)

(declare-fun call!22670 () Bool)

(assert (=> b!243179 (= e!157811 (not call!22670))))

(declare-fun b!243180 () Bool)

(declare-fun res!119182 () Bool)

(declare-fun e!157808 () Bool)

(assert (=> b!243180 (=> (not res!119182) (not e!157808))))

(assert (=> b!243180 (= res!119182 (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6450 lt!122073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243181 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12053 (_ BitVec 32) List!3644) Bool)

(assert (=> b!243181 (= e!157810 (not (arrayNoDuplicates!0 (_keys!6616 thiss!1504) #b00000000000000000000000000000000 Nil!3641)))))

(declare-fun b!243182 () Bool)

(declare-fun e!157812 () Bool)

(assert (=> b!243182 (= e!157812 (contains!1752 Nil!3641 key!932))))

(declare-fun b!243167 () Bool)

(declare-fun e!157825 () Bool)

(declare-fun e!157815 () Bool)

(assert (=> b!243167 (= e!157825 e!157815)))

(declare-fun res!119179 () Bool)

(assert (=> b!243167 (=> (not res!119179) (not e!157815))))

(assert (=> b!243167 (= res!119179 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun res!119184 () Bool)

(assert (=> start!23180 (=> (not res!119184) (not e!157821))))

(declare-fun valid!1409 (LongMapFixedSize!3594) Bool)

(assert (=> start!23180 (= res!119184 (valid!1409 thiss!1504))))

(assert (=> start!23180 e!157821))

(declare-fun e!157818 () Bool)

(assert (=> start!23180 e!157818))

(assert (=> start!23180 true))

(declare-fun b!243183 () Bool)

(declare-fun res!119187 () Bool)

(assert (=> b!243183 (=> (not res!119187) (not e!157808))))

(assert (=> b!243183 (= res!119187 call!22671)))

(assert (=> b!243183 (= e!157814 e!157808)))

(declare-fun b!243184 () Bool)

(assert (=> b!243184 (= e!157823 ((_ is Undefined!1070) lt!122073))))

(declare-fun e!157819 () Bool)

(declare-fun array_inv!3785 (array!12053) Bool)

(declare-fun array_inv!3786 (array!12051) Bool)

(assert (=> b!243185 (= e!157818 (and tp!22776 tp_is_empty!6381 (array_inv!3785 (_keys!6616 thiss!1504)) (array_inv!3786 (_values!4489 thiss!1504)) e!157819))))

(declare-fun b!243186 () Bool)

(declare-fun res!119177 () Bool)

(assert (=> b!243186 (=> (not res!119177) (not e!157810))))

(assert (=> b!243186 (= res!119177 e!157825)))

(declare-fun res!119174 () Bool)

(assert (=> b!243186 (=> res!119174 e!157825)))

(assert (=> b!243186 (= res!119174 e!157812)))

(declare-fun res!119176 () Bool)

(assert (=> b!243186 (=> (not res!119176) (not e!157812))))

(assert (=> b!243186 (= res!119176 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun bm!22667 () Bool)

(assert (=> bm!22667 (= call!22671 (inRange!0 (ite c!40588 (index!6450 lt!122073) (index!6453 lt!122073)) (mask!10595 thiss!1504)))))

(declare-fun b!243187 () Bool)

(assert (=> b!243187 (= e!157821 e!157822)))

(declare-fun res!119183 () Bool)

(assert (=> b!243187 (=> (not res!119183) (not e!157822))))

(assert (=> b!243187 (= res!119183 (or (= lt!122073 (MissingZero!1070 index!297)) (= lt!122073 (MissingVacant!1070 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12053 (_ BitVec 32)) SeekEntryResult!1070)

(assert (=> b!243187 (= lt!122073 (seekEntryOrOpen!0 key!932 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)))))

(declare-fun b!243188 () Bool)

(assert (=> b!243188 (= e!157819 (and e!157820 mapRes!10819))))

(declare-fun condMapEmpty!10819 () Bool)

(declare-fun mapDefault!10819 () ValueCell!2847)

(assert (=> b!243188 (= condMapEmpty!10819 (= (arr!5722 (_values!4489 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2847)) mapDefault!10819)))))

(declare-fun b!243189 () Bool)

(declare-fun res!119172 () Bool)

(assert (=> b!243189 (=> (not res!119172) (not e!157810))))

(assert (=> b!243189 (= res!119172 (not (contains!1752 Nil!3641 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243190 () Bool)

(assert (=> b!243190 (= e!157815 (not (contains!1752 Nil!3641 key!932)))))

(declare-fun b!243191 () Bool)

(declare-fun Unit!7507 () Unit!7503)

(assert (=> b!243191 (= e!157809 Unit!7507)))

(declare-fun lt!122070 () Unit!7503)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!359 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 64) Int) Unit!7503)

(assert (=> b!243191 (= lt!122070 (lemmaInListMapThenSeekEntryOrOpenFindsIt!359 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 (defaultEntry!4506 thiss!1504)))))

(assert (=> b!243191 false))

(declare-fun b!243192 () Bool)

(declare-fun res!119181 () Bool)

(assert (=> b!243192 (=> (not res!119181) (not e!157810))))

(declare-fun noDuplicate!94 (List!3644) Bool)

(assert (=> b!243192 (= res!119181 (noDuplicate!94 Nil!3641))))

(declare-fun bm!22668 () Bool)

(assert (=> bm!22668 (= call!22670 (arrayContainsKey!0 (_keys!6616 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243193 () Bool)

(declare-fun c!40590 () Bool)

(assert (=> b!243193 (= c!40590 ((_ is MissingVacant!1070) lt!122073))))

(assert (=> b!243193 (= e!157814 e!157823)))

(declare-fun mapNonEmpty!10819 () Bool)

(declare-fun tp!22777 () Bool)

(assert (=> mapNonEmpty!10819 (= mapRes!10819 (and tp!22777 e!157824))))

(declare-fun mapRest!10819 () (Array (_ BitVec 32) ValueCell!2847))

(declare-fun mapKey!10819 () (_ BitVec 32))

(declare-fun mapValue!10819 () ValueCell!2847)

(assert (=> mapNonEmpty!10819 (= (arr!5722 (_values!4489 thiss!1504)) (store mapRest!10819 mapKey!10819 mapValue!10819))))

(declare-fun b!243194 () Bool)

(assert (=> b!243194 (= e!157808 (not call!22670))))

(assert (= (and start!23180 res!119184) b!243168))

(assert (= (and b!243168 res!119178) b!243187))

(assert (= (and b!243187 res!119183) b!243169))

(assert (= (and b!243169 c!40587) b!243191))

(assert (= (and b!243169 (not c!40587)) b!243176))

(assert (= (and b!243176 c!40588) b!243183))

(assert (= (and b!243176 (not c!40588)) b!243193))

(assert (= (and b!243183 res!119187) b!243180))

(assert (= (and b!243180 res!119182) b!243194))

(assert (= (and b!243193 c!40590) b!243172))

(assert (= (and b!243193 (not c!40590)) b!243184))

(assert (= (and b!243172 res!119186) b!243171))

(assert (= (and b!243171 res!119175) b!243179))

(assert (= (or b!243183 b!243172) bm!22667))

(assert (= (or b!243194 b!243179) bm!22668))

(assert (= (and b!243169 res!119180) b!243178))

(assert (= (and b!243178 c!40589) b!243170))

(assert (= (and b!243178 (not c!40589)) b!243177))

(assert (= (and b!243178 res!119173) b!243192))

(assert (= (and b!243192 res!119181) b!243174))

(assert (= (and b!243174 res!119185) b!243189))

(assert (= (and b!243189 res!119172) b!243186))

(assert (= (and b!243186 res!119176) b!243182))

(assert (= (and b!243186 (not res!119174)) b!243167))

(assert (= (and b!243167 res!119179) b!243190))

(assert (= (and b!243186 res!119177) b!243181))

(assert (= (and b!243188 condMapEmpty!10819) mapIsEmpty!10819))

(assert (= (and b!243188 (not condMapEmpty!10819)) mapNonEmpty!10819))

(assert (= (and mapNonEmpty!10819 ((_ is ValueCellFull!2847) mapValue!10819)) b!243173))

(assert (= (and b!243188 ((_ is ValueCellFull!2847) mapDefault!10819)) b!243175))

(assert (= b!243185 b!243188))

(assert (= start!23180 b!243185))

(declare-fun m!261701 () Bool)

(assert (=> mapNonEmpty!10819 m!261701))

(declare-fun m!261703 () Bool)

(assert (=> bm!22667 m!261703))

(declare-fun m!261705 () Bool)

(assert (=> b!243180 m!261705))

(declare-fun m!261707 () Bool)

(assert (=> b!243170 m!261707))

(declare-fun m!261709 () Bool)

(assert (=> b!243191 m!261709))

(declare-fun m!261711 () Bool)

(assert (=> b!243176 m!261711))

(declare-fun m!261713 () Bool)

(assert (=> start!23180 m!261713))

(declare-fun m!261715 () Bool)

(assert (=> b!243181 m!261715))

(declare-fun m!261717 () Bool)

(assert (=> b!243171 m!261717))

(declare-fun m!261719 () Bool)

(assert (=> bm!22668 m!261719))

(declare-fun m!261721 () Bool)

(assert (=> b!243190 m!261721))

(declare-fun m!261723 () Bool)

(assert (=> b!243187 m!261723))

(declare-fun m!261725 () Bool)

(assert (=> b!243192 m!261725))

(declare-fun m!261727 () Bool)

(assert (=> b!243174 m!261727))

(assert (=> b!243182 m!261721))

(declare-fun m!261729 () Bool)

(assert (=> b!243169 m!261729))

(declare-fun m!261731 () Bool)

(assert (=> b!243169 m!261731))

(assert (=> b!243169 m!261731))

(declare-fun m!261733 () Bool)

(assert (=> b!243169 m!261733))

(declare-fun m!261735 () Bool)

(assert (=> b!243189 m!261735))

(declare-fun m!261737 () Bool)

(assert (=> b!243185 m!261737))

(declare-fun m!261739 () Bool)

(assert (=> b!243185 m!261739))

(assert (=> b!243178 m!261719))

(check-sat (not b!243189) (not b!243190) (not b!243181) (not b!243178) (not b!243191) (not b!243174) (not start!23180) (not mapNonEmpty!10819) (not bm!22668) (not b!243187) (not b!243185) (not b!243192) (not b_next!6519) (not bm!22667) (not b!243176) tp_is_empty!6381 (not b!243182) (not b!243170) (not b!243169) b_and!13499)
(check-sat b_and!13499 (not b_next!6519))
(get-model)

(declare-fun d!60033 () Bool)

(declare-fun lt!122096 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!160 (List!3644) (InoxSet (_ BitVec 64)))

(assert (=> d!60033 (= lt!122096 (select (content!160 Nil!3641) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157885 () Bool)

(assert (=> d!60033 (= lt!122096 e!157885)))

(declare-fun res!119241 () Bool)

(assert (=> d!60033 (=> (not res!119241) (not e!157885))))

(assert (=> d!60033 (= res!119241 ((_ is Cons!3640) Nil!3641))))

(assert (=> d!60033 (= (contains!1752 Nil!3641 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122096)))

(declare-fun b!243283 () Bool)

(declare-fun e!157884 () Bool)

(assert (=> b!243283 (= e!157885 e!157884)))

(declare-fun res!119240 () Bool)

(assert (=> b!243283 (=> res!119240 e!157884)))

(assert (=> b!243283 (= res!119240 (= (h!4297 Nil!3641) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243284 () Bool)

(assert (=> b!243284 (= e!157884 (contains!1752 (t!8649 Nil!3641) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60033 res!119241) b!243283))

(assert (= (and b!243283 (not res!119240)) b!243284))

(declare-fun m!261781 () Bool)

(assert (=> d!60033 m!261781))

(declare-fun m!261783 () Bool)

(assert (=> d!60033 m!261783))

(declare-fun m!261785 () Bool)

(assert (=> b!243284 m!261785))

(assert (=> b!243189 d!60033))

(declare-fun d!60035 () Bool)

(assert (=> d!60035 (= (inRange!0 index!297 (mask!10595 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10595 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!243169 d!60035))

(declare-fun d!60037 () Bool)

(declare-fun e!157891 () Bool)

(assert (=> d!60037 e!157891))

(declare-fun res!119244 () Bool)

(assert (=> d!60037 (=> res!119244 e!157891)))

(declare-fun lt!122107 () Bool)

(assert (=> d!60037 (= res!119244 (not lt!122107))))

(declare-fun lt!122105 () Bool)

(assert (=> d!60037 (= lt!122107 lt!122105)))

(declare-fun lt!122106 () Unit!7503)

(declare-fun e!157890 () Unit!7503)

(assert (=> d!60037 (= lt!122106 e!157890)))

(declare-fun c!40605 () Bool)

(assert (=> d!60037 (= c!40605 lt!122105)))

(declare-fun containsKey!276 (List!3643 (_ BitVec 64)) Bool)

(assert (=> d!60037 (= lt!122105 (containsKey!276 (toList!1854 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504))) key!932))))

(assert (=> d!60037 (= (contains!1751 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)) key!932) lt!122107)))

(declare-fun b!243291 () Bool)

(declare-fun lt!122108 () Unit!7503)

(assert (=> b!243291 (= e!157890 lt!122108)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!224 (List!3643 (_ BitVec 64)) Unit!7503)

(assert (=> b!243291 (= lt!122108 (lemmaContainsKeyImpliesGetValueByKeyDefined!224 (toList!1854 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504))) key!932))))

(declare-datatypes ((Option!290 0))(
  ( (Some!289 (v!5283 V!8155)) (None!288) )
))
(declare-fun isDefined!225 (Option!290) Bool)

(declare-fun getValueByKey!284 (List!3643 (_ BitVec 64)) Option!290)

(assert (=> b!243291 (isDefined!225 (getValueByKey!284 (toList!1854 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504))) key!932))))

(declare-fun b!243292 () Bool)

(declare-fun Unit!7511 () Unit!7503)

(assert (=> b!243292 (= e!157890 Unit!7511)))

(declare-fun b!243293 () Bool)

(assert (=> b!243293 (= e!157891 (isDefined!225 (getValueByKey!284 (toList!1854 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504))) key!932)))))

(assert (= (and d!60037 c!40605) b!243291))

(assert (= (and d!60037 (not c!40605)) b!243292))

(assert (= (and d!60037 (not res!119244)) b!243293))

(declare-fun m!261787 () Bool)

(assert (=> d!60037 m!261787))

(declare-fun m!261789 () Bool)

(assert (=> b!243291 m!261789))

(declare-fun m!261791 () Bool)

(assert (=> b!243291 m!261791))

(assert (=> b!243291 m!261791))

(declare-fun m!261793 () Bool)

(assert (=> b!243291 m!261793))

(assert (=> b!243293 m!261791))

(assert (=> b!243293 m!261791))

(assert (=> b!243293 m!261793))

(assert (=> b!243169 d!60037))

(declare-fun bm!22689 () Bool)

(declare-fun call!22695 () Bool)

(declare-fun lt!122167 () ListLongMap!3677)

(assert (=> bm!22689 (= call!22695 (contains!1751 lt!122167 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243336 () Bool)

(declare-fun e!157919 () Unit!7503)

(declare-fun Unit!7512 () Unit!7503)

(assert (=> b!243336 (= e!157919 Unit!7512)))

(declare-fun b!243337 () Bool)

(declare-fun e!157929 () Bool)

(declare-fun apply!226 (ListLongMap!3677 (_ BitVec 64)) V!8155)

(assert (=> b!243337 (= e!157929 (= (apply!226 lt!122167 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4347 thiss!1504)))))

(declare-fun b!243338 () Bool)

(declare-fun lt!122164 () Unit!7503)

(assert (=> b!243338 (= e!157919 lt!122164)))

(declare-fun lt!122162 () ListLongMap!3677)

(declare-fun getCurrentListMapNoExtraKeys!548 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 32) Int) ListLongMap!3677)

(assert (=> b!243338 (= lt!122162 (getCurrentListMapNoExtraKeys!548 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(declare-fun lt!122157 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122165 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122165 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122161 () Unit!7503)

(declare-fun addStillContains!202 (ListLongMap!3677 (_ BitVec 64) V!8155 (_ BitVec 64)) Unit!7503)

(assert (=> b!243338 (= lt!122161 (addStillContains!202 lt!122162 lt!122157 (zeroValue!4347 thiss!1504) lt!122165))))

(declare-fun +!653 (ListLongMap!3677 tuple2!4764) ListLongMap!3677)

(assert (=> b!243338 (contains!1751 (+!653 lt!122162 (tuple2!4765 lt!122157 (zeroValue!4347 thiss!1504))) lt!122165)))

(declare-fun lt!122153 () Unit!7503)

(assert (=> b!243338 (= lt!122153 lt!122161)))

(declare-fun lt!122169 () ListLongMap!3677)

(assert (=> b!243338 (= lt!122169 (getCurrentListMapNoExtraKeys!548 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(declare-fun lt!122168 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122156 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122156 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122154 () Unit!7503)

(declare-fun addApplyDifferent!202 (ListLongMap!3677 (_ BitVec 64) V!8155 (_ BitVec 64)) Unit!7503)

(assert (=> b!243338 (= lt!122154 (addApplyDifferent!202 lt!122169 lt!122168 (minValue!4347 thiss!1504) lt!122156))))

(assert (=> b!243338 (= (apply!226 (+!653 lt!122169 (tuple2!4765 lt!122168 (minValue!4347 thiss!1504))) lt!122156) (apply!226 lt!122169 lt!122156))))

(declare-fun lt!122166 () Unit!7503)

(assert (=> b!243338 (= lt!122166 lt!122154)))

(declare-fun lt!122173 () ListLongMap!3677)

(assert (=> b!243338 (= lt!122173 (getCurrentListMapNoExtraKeys!548 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(declare-fun lt!122170 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122172 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122172 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122160 () Unit!7503)

(assert (=> b!243338 (= lt!122160 (addApplyDifferent!202 lt!122173 lt!122170 (zeroValue!4347 thiss!1504) lt!122172))))

(assert (=> b!243338 (= (apply!226 (+!653 lt!122173 (tuple2!4765 lt!122170 (zeroValue!4347 thiss!1504))) lt!122172) (apply!226 lt!122173 lt!122172))))

(declare-fun lt!122174 () Unit!7503)

(assert (=> b!243338 (= lt!122174 lt!122160)))

(declare-fun lt!122163 () ListLongMap!3677)

(assert (=> b!243338 (= lt!122163 (getCurrentListMapNoExtraKeys!548 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(declare-fun lt!122159 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122159 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122158 () (_ BitVec 64))

(assert (=> b!243338 (= lt!122158 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243338 (= lt!122164 (addApplyDifferent!202 lt!122163 lt!122159 (minValue!4347 thiss!1504) lt!122158))))

(assert (=> b!243338 (= (apply!226 (+!653 lt!122163 (tuple2!4765 lt!122159 (minValue!4347 thiss!1504))) lt!122158) (apply!226 lt!122163 lt!122158))))

(declare-fun b!243339 () Bool)

(declare-fun res!119270 () Bool)

(declare-fun e!157923 () Bool)

(assert (=> b!243339 (=> (not res!119270) (not e!157923))))

(declare-fun e!157925 () Bool)

(assert (=> b!243339 (= res!119270 e!157925)))

(declare-fun c!40618 () Bool)

(assert (=> b!243339 (= c!40618 (not (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!22697 () ListLongMap!3677)

(declare-fun c!40622 () Bool)

(declare-fun c!40619 () Bool)

(declare-fun call!22698 () ListLongMap!3677)

(declare-fun bm!22690 () Bool)

(declare-fun call!22693 () ListLongMap!3677)

(declare-fun call!22694 () ListLongMap!3677)

(assert (=> bm!22690 (= call!22697 (+!653 (ite c!40622 call!22693 (ite c!40619 call!22698 call!22694)) (ite (or c!40622 c!40619) (tuple2!4765 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4347 thiss!1504)) (tuple2!4765 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4347 thiss!1504)))))))

(declare-fun d!60039 () Bool)

(assert (=> d!60039 e!157923))

(declare-fun res!119265 () Bool)

(assert (=> d!60039 (=> (not res!119265) (not e!157923))))

(assert (=> d!60039 (= res!119265 (or (bvsge #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))))))))

(declare-fun lt!122171 () ListLongMap!3677)

(assert (=> d!60039 (= lt!122167 lt!122171)))

(declare-fun lt!122155 () Unit!7503)

(assert (=> d!60039 (= lt!122155 e!157919)))

(declare-fun c!40621 () Bool)

(declare-fun e!157928 () Bool)

(assert (=> d!60039 (= c!40621 e!157928)))

(declare-fun res!119264 () Bool)

(assert (=> d!60039 (=> (not res!119264) (not e!157928))))

(assert (=> d!60039 (= res!119264 (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))))))

(declare-fun e!157920 () ListLongMap!3677)

(assert (=> d!60039 (= lt!122171 e!157920)))

(assert (=> d!60039 (= c!40622 (and (not (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60039 (validMask!0 (mask!10595 thiss!1504))))

(assert (=> d!60039 (= (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)) lt!122167)))

(declare-fun b!243340 () Bool)

(declare-fun e!157926 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!243340 (= e!157926 (validKeyInArray!0 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243341 () Bool)

(declare-fun e!157918 () Bool)

(assert (=> b!243341 (= e!157918 (= (apply!226 lt!122167 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4347 thiss!1504)))))

(declare-fun b!243342 () Bool)

(assert (=> b!243342 (= e!157928 (validKeyInArray!0 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243343 () Bool)

(declare-fun c!40620 () Bool)

(assert (=> b!243343 (= c!40620 (and (not (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!157922 () ListLongMap!3677)

(declare-fun e!157921 () ListLongMap!3677)

(assert (=> b!243343 (= e!157922 e!157921)))

(declare-fun b!243344 () Bool)

(declare-fun e!157924 () Bool)

(declare-fun e!157930 () Bool)

(assert (=> b!243344 (= e!157924 e!157930)))

(declare-fun res!119263 () Bool)

(assert (=> b!243344 (=> (not res!119263) (not e!157930))))

(assert (=> b!243344 (= res!119263 (contains!1751 lt!122167 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!243344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))))))

(declare-fun b!243345 () Bool)

(declare-fun e!157927 () Bool)

(assert (=> b!243345 (= e!157927 e!157918)))

(declare-fun res!119267 () Bool)

(assert (=> b!243345 (= res!119267 call!22695)))

(assert (=> b!243345 (=> (not res!119267) (not e!157918))))

(declare-fun b!243346 () Bool)

(declare-fun call!22696 () ListLongMap!3677)

(assert (=> b!243346 (= e!157922 call!22696)))

(declare-fun bm!22691 () Bool)

(assert (=> bm!22691 (= call!22696 call!22697)))

(declare-fun b!243347 () Bool)

(assert (=> b!243347 (= e!157927 (not call!22695))))

(declare-fun bm!22692 () Bool)

(assert (=> bm!22692 (= call!22693 (getCurrentListMapNoExtraKeys!548 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(declare-fun bm!22693 () Bool)

(assert (=> bm!22693 (= call!22698 call!22693)))

(declare-fun b!243348 () Bool)

(declare-fun call!22692 () Bool)

(assert (=> b!243348 (= e!157925 (not call!22692))))

(declare-fun bm!22694 () Bool)

(assert (=> bm!22694 (= call!22694 call!22698)))

(declare-fun b!243349 () Bool)

(assert (=> b!243349 (= e!157920 (+!653 call!22697 (tuple2!4765 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4347 thiss!1504))))))

(declare-fun b!243350 () Bool)

(assert (=> b!243350 (= e!157921 call!22696)))

(declare-fun b!243351 () Bool)

(assert (=> b!243351 (= e!157925 e!157929)))

(declare-fun res!119266 () Bool)

(assert (=> b!243351 (= res!119266 call!22692)))

(assert (=> b!243351 (=> (not res!119266) (not e!157929))))

(declare-fun b!243352 () Bool)

(assert (=> b!243352 (= e!157923 e!157927)))

(declare-fun c!40623 () Bool)

(assert (=> b!243352 (= c!40623 (not (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!243353 () Bool)

(assert (=> b!243353 (= e!157920 e!157922)))

(assert (=> b!243353 (= c!40619 (and (not (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4243 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!243354 () Bool)

(declare-fun res!119271 () Bool)

(assert (=> b!243354 (=> (not res!119271) (not e!157923))))

(assert (=> b!243354 (= res!119271 e!157924)))

(declare-fun res!119269 () Bool)

(assert (=> b!243354 (=> res!119269 e!157924)))

(assert (=> b!243354 (= res!119269 (not e!157926))))

(declare-fun res!119268 () Bool)

(assert (=> b!243354 (=> (not res!119268) (not e!157926))))

(assert (=> b!243354 (= res!119268 (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))))))

(declare-fun b!243355 () Bool)

(assert (=> b!243355 (= e!157921 call!22694)))

(declare-fun bm!22695 () Bool)

(assert (=> bm!22695 (= call!22692 (contains!1751 lt!122167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243356 () Bool)

(declare-fun get!2938 (ValueCell!2847 V!8155) V!8155)

(declare-fun dynLambda!569 (Int (_ BitVec 64)) V!8155)

(assert (=> b!243356 (= e!157930 (= (apply!226 lt!122167 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)) (get!2938 (select (arr!5722 (_values!4489 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!569 (defaultEntry!4506 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!243356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6064 (_values!4489 thiss!1504))))))

(assert (=> b!243356 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))))))

(assert (= (and d!60039 c!40622) b!243349))

(assert (= (and d!60039 (not c!40622)) b!243353))

(assert (= (and b!243353 c!40619) b!243346))

(assert (= (and b!243353 (not c!40619)) b!243343))

(assert (= (and b!243343 c!40620) b!243350))

(assert (= (and b!243343 (not c!40620)) b!243355))

(assert (= (or b!243350 b!243355) bm!22694))

(assert (= (or b!243346 bm!22694) bm!22693))

(assert (= (or b!243346 b!243350) bm!22691))

(assert (= (or b!243349 bm!22693) bm!22692))

(assert (= (or b!243349 bm!22691) bm!22690))

(assert (= (and d!60039 res!119264) b!243342))

(assert (= (and d!60039 c!40621) b!243338))

(assert (= (and d!60039 (not c!40621)) b!243336))

(assert (= (and d!60039 res!119265) b!243354))

(assert (= (and b!243354 res!119268) b!243340))

(assert (= (and b!243354 (not res!119269)) b!243344))

(assert (= (and b!243344 res!119263) b!243356))

(assert (= (and b!243354 res!119271) b!243339))

(assert (= (and b!243339 c!40618) b!243351))

(assert (= (and b!243339 (not c!40618)) b!243348))

(assert (= (and b!243351 res!119266) b!243337))

(assert (= (or b!243351 b!243348) bm!22695))

(assert (= (and b!243339 res!119270) b!243352))

(assert (= (and b!243352 c!40623) b!243345))

(assert (= (and b!243352 (not c!40623)) b!243347))

(assert (= (and b!243345 res!119267) b!243341))

(assert (= (or b!243345 b!243347) bm!22689))

(declare-fun b_lambda!8007 () Bool)

(assert (=> (not b_lambda!8007) (not b!243356)))

(declare-fun t!8652 () Bool)

(declare-fun tb!2965 () Bool)

(assert (=> (and b!243185 (= (defaultEntry!4506 thiss!1504) (defaultEntry!4506 thiss!1504)) t!8652) tb!2965))

(declare-fun result!5217 () Bool)

(assert (=> tb!2965 (= result!5217 tp_is_empty!6381)))

(assert (=> b!243356 t!8652))

(declare-fun b_and!13503 () Bool)

(assert (= b_and!13499 (and (=> t!8652 result!5217) b_and!13503)))

(declare-fun m!261795 () Bool)

(assert (=> bm!22695 m!261795))

(declare-fun m!261797 () Bool)

(assert (=> bm!22690 m!261797))

(declare-fun m!261799 () Bool)

(assert (=> b!243356 m!261799))

(declare-fun m!261801 () Bool)

(assert (=> b!243356 m!261801))

(declare-fun m!261803 () Bool)

(assert (=> b!243356 m!261803))

(declare-fun m!261805 () Bool)

(assert (=> b!243356 m!261805))

(declare-fun m!261807 () Bool)

(assert (=> b!243356 m!261807))

(assert (=> b!243356 m!261805))

(assert (=> b!243356 m!261803))

(assert (=> b!243356 m!261799))

(declare-fun m!261809 () Bool)

(assert (=> bm!22689 m!261809))

(declare-fun m!261811 () Bool)

(assert (=> b!243338 m!261811))

(declare-fun m!261813 () Bool)

(assert (=> b!243338 m!261813))

(declare-fun m!261815 () Bool)

(assert (=> b!243338 m!261815))

(declare-fun m!261817 () Bool)

(assert (=> b!243338 m!261817))

(declare-fun m!261819 () Bool)

(assert (=> b!243338 m!261819))

(declare-fun m!261821 () Bool)

(assert (=> b!243338 m!261821))

(declare-fun m!261823 () Bool)

(assert (=> b!243338 m!261823))

(declare-fun m!261825 () Bool)

(assert (=> b!243338 m!261825))

(assert (=> b!243338 m!261825))

(declare-fun m!261827 () Bool)

(assert (=> b!243338 m!261827))

(declare-fun m!261829 () Bool)

(assert (=> b!243338 m!261829))

(declare-fun m!261831 () Bool)

(assert (=> b!243338 m!261831))

(declare-fun m!261833 () Bool)

(assert (=> b!243338 m!261833))

(assert (=> b!243338 m!261831))

(declare-fun m!261835 () Bool)

(assert (=> b!243338 m!261835))

(declare-fun m!261837 () Bool)

(assert (=> b!243338 m!261837))

(assert (=> b!243338 m!261821))

(declare-fun m!261839 () Bool)

(assert (=> b!243338 m!261839))

(assert (=> b!243338 m!261799))

(assert (=> b!243338 m!261813))

(declare-fun m!261841 () Bool)

(assert (=> b!243338 m!261841))

(assert (=> b!243342 m!261799))

(assert (=> b!243342 m!261799))

(declare-fun m!261843 () Bool)

(assert (=> b!243342 m!261843))

(declare-fun m!261845 () Bool)

(assert (=> d!60039 m!261845))

(assert (=> b!243344 m!261799))

(assert (=> b!243344 m!261799))

(declare-fun m!261847 () Bool)

(assert (=> b!243344 m!261847))

(assert (=> b!243340 m!261799))

(assert (=> b!243340 m!261799))

(assert (=> b!243340 m!261843))

(assert (=> bm!22692 m!261837))

(declare-fun m!261849 () Bool)

(assert (=> b!243349 m!261849))

(declare-fun m!261851 () Bool)

(assert (=> b!243337 m!261851))

(declare-fun m!261853 () Bool)

(assert (=> b!243341 m!261853))

(assert (=> b!243169 d!60039))

(declare-fun d!60041 () Bool)

(declare-fun lt!122175 () Bool)

(assert (=> d!60041 (= lt!122175 (select (content!160 Nil!3641) key!932))))

(declare-fun e!157932 () Bool)

(assert (=> d!60041 (= lt!122175 e!157932)))

(declare-fun res!119273 () Bool)

(assert (=> d!60041 (=> (not res!119273) (not e!157932))))

(assert (=> d!60041 (= res!119273 ((_ is Cons!3640) Nil!3641))))

(assert (=> d!60041 (= (contains!1752 Nil!3641 key!932) lt!122175)))

(declare-fun b!243359 () Bool)

(declare-fun e!157931 () Bool)

(assert (=> b!243359 (= e!157932 e!157931)))

(declare-fun res!119272 () Bool)

(assert (=> b!243359 (=> res!119272 e!157931)))

(assert (=> b!243359 (= res!119272 (= (h!4297 Nil!3641) key!932))))

(declare-fun b!243360 () Bool)

(assert (=> b!243360 (= e!157931 (contains!1752 (t!8649 Nil!3641) key!932))))

(assert (= (and d!60041 res!119273) b!243359))

(assert (= (and b!243359 (not res!119272)) b!243360))

(assert (=> d!60041 m!261781))

(declare-fun m!261855 () Bool)

(assert (=> d!60041 m!261855))

(declare-fun m!261857 () Bool)

(assert (=> b!243360 m!261857))

(assert (=> b!243190 d!60041))

(declare-fun d!60043 () Bool)

(assert (=> d!60043 (contains!1751 (getCurrentListMap!1382 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)) key!932)))

(declare-fun lt!122178 () Unit!7503)

(declare-fun choose!1134 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 64) (_ BitVec 32) Int) Unit!7503)

(assert (=> d!60043 (= lt!122178 (choose!1134 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)))))

(assert (=> d!60043 (validMask!0 (mask!10595 thiss!1504))))

(assert (=> d!60043 (= (lemmaArrayContainsKeyThenInListMap!164 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4506 thiss!1504)) lt!122178)))

(declare-fun bs!8869 () Bool)

(assert (= bs!8869 d!60043))

(assert (=> bs!8869 m!261731))

(assert (=> bs!8869 m!261731))

(assert (=> bs!8869 m!261733))

(declare-fun m!261859 () Bool)

(assert (=> bs!8869 m!261859))

(assert (=> bs!8869 m!261845))

(assert (=> b!243170 d!60043))

(declare-fun d!60045 () Bool)

(assert (=> d!60045 (= (inRange!0 (ite c!40588 (index!6450 lt!122073) (index!6453 lt!122073)) (mask!10595 thiss!1504)) (and (bvsge (ite c!40588 (index!6450 lt!122073) (index!6453 lt!122073)) #b00000000000000000000000000000000) (bvslt (ite c!40588 (index!6450 lt!122073) (index!6453 lt!122073)) (bvadd (mask!10595 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22667 d!60045))

(declare-fun d!60047 () Bool)

(declare-fun res!119278 () Bool)

(declare-fun e!157937 () Bool)

(assert (=> d!60047 (=> res!119278 e!157937)))

(assert (=> d!60047 (= res!119278 (= (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60047 (= (arrayContainsKey!0 (_keys!6616 thiss!1504) key!932 #b00000000000000000000000000000000) e!157937)))

(declare-fun b!243365 () Bool)

(declare-fun e!157938 () Bool)

(assert (=> b!243365 (= e!157937 e!157938)))

(declare-fun res!119279 () Bool)

(assert (=> b!243365 (=> (not res!119279) (not e!157938))))

(assert (=> b!243365 (= res!119279 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6065 (_keys!6616 thiss!1504))))))

(declare-fun b!243366 () Bool)

(assert (=> b!243366 (= e!157938 (arrayContainsKey!0 (_keys!6616 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60047 (not res!119278)) b!243365))

(assert (= (and b!243365 res!119279) b!243366))

(assert (=> d!60047 m!261799))

(declare-fun m!261861 () Bool)

(assert (=> b!243366 m!261861))

(assert (=> b!243178 d!60047))

(declare-fun lt!122187 () SeekEntryResult!1070)

(declare-fun b!243379 () Bool)

(declare-fun e!157945 () SeekEntryResult!1070)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12053 (_ BitVec 32)) SeekEntryResult!1070)

(assert (=> b!243379 (= e!157945 (seekKeyOrZeroReturnVacant!0 (x!24312 lt!122187) (index!6452 lt!122187) (index!6452 lt!122187) key!932 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)))))

(declare-fun b!243380 () Bool)

(declare-fun c!40631 () Bool)

(declare-fun lt!122186 () (_ BitVec 64))

(assert (=> b!243380 (= c!40631 (= lt!122186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157946 () SeekEntryResult!1070)

(assert (=> b!243380 (= e!157946 e!157945)))

(declare-fun b!243381 () Bool)

(assert (=> b!243381 (= e!157946 (Found!1070 (index!6452 lt!122187)))))

(declare-fun b!243382 () Bool)

(declare-fun e!157947 () SeekEntryResult!1070)

(assert (=> b!243382 (= e!157947 e!157946)))

(assert (=> b!243382 (= lt!122186 (select (arr!5723 (_keys!6616 thiss!1504)) (index!6452 lt!122187)))))

(declare-fun c!40632 () Bool)

(assert (=> b!243382 (= c!40632 (= lt!122186 key!932))))

(declare-fun b!243383 () Bool)

(assert (=> b!243383 (= e!157945 (MissingZero!1070 (index!6452 lt!122187)))))

(declare-fun d!60049 () Bool)

(declare-fun lt!122185 () SeekEntryResult!1070)

(assert (=> d!60049 (and (or ((_ is Undefined!1070) lt!122185) (not ((_ is Found!1070) lt!122185)) (and (bvsge (index!6451 lt!122185) #b00000000000000000000000000000000) (bvslt (index!6451 lt!122185) (size!6065 (_keys!6616 thiss!1504))))) (or ((_ is Undefined!1070) lt!122185) ((_ is Found!1070) lt!122185) (not ((_ is MissingZero!1070) lt!122185)) (and (bvsge (index!6450 lt!122185) #b00000000000000000000000000000000) (bvslt (index!6450 lt!122185) (size!6065 (_keys!6616 thiss!1504))))) (or ((_ is Undefined!1070) lt!122185) ((_ is Found!1070) lt!122185) ((_ is MissingZero!1070) lt!122185) (not ((_ is MissingVacant!1070) lt!122185)) (and (bvsge (index!6453 lt!122185) #b00000000000000000000000000000000) (bvslt (index!6453 lt!122185) (size!6065 (_keys!6616 thiss!1504))))) (or ((_ is Undefined!1070) lt!122185) (ite ((_ is Found!1070) lt!122185) (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6451 lt!122185)) key!932) (ite ((_ is MissingZero!1070) lt!122185) (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6450 lt!122185)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1070) lt!122185) (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6453 lt!122185)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60049 (= lt!122185 e!157947)))

(declare-fun c!40630 () Bool)

(assert (=> d!60049 (= c!40630 (and ((_ is Intermediate!1070) lt!122187) (undefined!1882 lt!122187)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12053 (_ BitVec 32)) SeekEntryResult!1070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60049 (= lt!122187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10595 thiss!1504)) key!932 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)))))

(assert (=> d!60049 (validMask!0 (mask!10595 thiss!1504))))

(assert (=> d!60049 (= (seekEntryOrOpen!0 key!932 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)) lt!122185)))

(declare-fun b!243384 () Bool)

(assert (=> b!243384 (= e!157947 Undefined!1070)))

(assert (= (and d!60049 c!40630) b!243384))

(assert (= (and d!60049 (not c!40630)) b!243382))

(assert (= (and b!243382 c!40632) b!243381))

(assert (= (and b!243382 (not c!40632)) b!243380))

(assert (= (and b!243380 c!40631) b!243383))

(assert (= (and b!243380 (not c!40631)) b!243379))

(declare-fun m!261863 () Bool)

(assert (=> b!243379 m!261863))

(declare-fun m!261865 () Bool)

(assert (=> b!243382 m!261865))

(declare-fun m!261867 () Bool)

(assert (=> d!60049 m!261867))

(declare-fun m!261869 () Bool)

(assert (=> d!60049 m!261869))

(assert (=> d!60049 m!261867))

(declare-fun m!261871 () Bool)

(assert (=> d!60049 m!261871))

(assert (=> d!60049 m!261845))

(declare-fun m!261873 () Bool)

(assert (=> d!60049 m!261873))

(declare-fun m!261875 () Bool)

(assert (=> d!60049 m!261875))

(assert (=> b!243187 d!60049))

(declare-fun d!60051 () Bool)

(declare-fun lt!122188 () Bool)

(assert (=> d!60051 (= lt!122188 (select (content!160 Nil!3641) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!157949 () Bool)

(assert (=> d!60051 (= lt!122188 e!157949)))

(declare-fun res!119281 () Bool)

(assert (=> d!60051 (=> (not res!119281) (not e!157949))))

(assert (=> d!60051 (= res!119281 ((_ is Cons!3640) Nil!3641))))

(assert (=> d!60051 (= (contains!1752 Nil!3641 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122188)))

(declare-fun b!243385 () Bool)

(declare-fun e!157948 () Bool)

(assert (=> b!243385 (= e!157949 e!157948)))

(declare-fun res!119280 () Bool)

(assert (=> b!243385 (=> res!119280 e!157948)))

(assert (=> b!243385 (= res!119280 (= (h!4297 Nil!3641) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243386 () Bool)

(assert (=> b!243386 (= e!157948 (contains!1752 (t!8649 Nil!3641) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60051 res!119281) b!243385))

(assert (= (and b!243385 (not res!119280)) b!243386))

(assert (=> d!60051 m!261781))

(declare-fun m!261877 () Bool)

(assert (=> d!60051 m!261877))

(declare-fun m!261879 () Bool)

(assert (=> b!243386 m!261879))

(assert (=> b!243174 d!60051))

(declare-fun b!243403 () Bool)

(declare-fun res!119293 () Bool)

(declare-fun e!157958 () Bool)

(assert (=> b!243403 (=> (not res!119293) (not e!157958))))

(declare-fun call!22703 () Bool)

(assert (=> b!243403 (= res!119293 call!22703)))

(declare-fun e!157959 () Bool)

(assert (=> b!243403 (= e!157959 e!157958)))

(declare-fun c!40637 () Bool)

(declare-fun lt!122193 () SeekEntryResult!1070)

(declare-fun bm!22700 () Bool)

(assert (=> bm!22700 (= call!22703 (inRange!0 (ite c!40637 (index!6450 lt!122193) (index!6453 lt!122193)) (mask!10595 thiss!1504)))))

(declare-fun b!243405 () Bool)

(declare-fun call!22704 () Bool)

(assert (=> b!243405 (= e!157958 (not call!22704))))

(declare-fun b!243406 () Bool)

(declare-fun e!157960 () Bool)

(assert (=> b!243406 (= e!157960 (not call!22704))))

(declare-fun b!243407 () Bool)

(declare-fun e!157961 () Bool)

(assert (=> b!243407 (= e!157961 e!157960)))

(declare-fun res!119291 () Bool)

(assert (=> b!243407 (= res!119291 call!22703)))

(assert (=> b!243407 (=> (not res!119291) (not e!157960))))

(declare-fun b!243408 () Bool)

(declare-fun res!119290 () Bool)

(assert (=> b!243408 (=> (not res!119290) (not e!157958))))

(assert (=> b!243408 (= res!119290 (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6453 lt!122193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243408 (and (bvsge (index!6453 lt!122193) #b00000000000000000000000000000000) (bvslt (index!6453 lt!122193) (size!6065 (_keys!6616 thiss!1504))))))

(declare-fun b!243409 () Bool)

(assert (=> b!243409 (= e!157959 ((_ is Undefined!1070) lt!122193))))

(declare-fun bm!22701 () Bool)

(assert (=> bm!22701 (= call!22704 (arrayContainsKey!0 (_keys!6616 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243410 () Bool)

(assert (=> b!243410 (= e!157961 e!157959)))

(declare-fun c!40638 () Bool)

(assert (=> b!243410 (= c!40638 ((_ is MissingVacant!1070) lt!122193))))

(declare-fun b!243404 () Bool)

(assert (=> b!243404 (and (bvsge (index!6450 lt!122193) #b00000000000000000000000000000000) (bvslt (index!6450 lt!122193) (size!6065 (_keys!6616 thiss!1504))))))

(declare-fun res!119292 () Bool)

(assert (=> b!243404 (= res!119292 (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6450 lt!122193)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243404 (=> (not res!119292) (not e!157960))))

(declare-fun d!60053 () Bool)

(assert (=> d!60053 e!157961))

(assert (=> d!60053 (= c!40637 ((_ is MissingZero!1070) lt!122193))))

(assert (=> d!60053 (= lt!122193 (seekEntryOrOpen!0 key!932 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)))))

(declare-fun lt!122194 () Unit!7503)

(declare-fun choose!1135 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 64) Int) Unit!7503)

(assert (=> d!60053 (= lt!122194 (choose!1135 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 (defaultEntry!4506 thiss!1504)))))

(assert (=> d!60053 (validMask!0 (mask!10595 thiss!1504))))

(assert (=> d!60053 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!368 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 (defaultEntry!4506 thiss!1504)) lt!122194)))

(assert (= (and d!60053 c!40637) b!243407))

(assert (= (and d!60053 (not c!40637)) b!243410))

(assert (= (and b!243407 res!119291) b!243404))

(assert (= (and b!243404 res!119292) b!243406))

(assert (= (and b!243410 c!40638) b!243403))

(assert (= (and b!243410 (not c!40638)) b!243409))

(assert (= (and b!243403 res!119293) b!243408))

(assert (= (and b!243408 res!119290) b!243405))

(assert (= (or b!243407 b!243403) bm!22700))

(assert (= (or b!243406 b!243405) bm!22701))

(declare-fun m!261881 () Bool)

(assert (=> b!243404 m!261881))

(declare-fun m!261883 () Bool)

(assert (=> b!243408 m!261883))

(declare-fun m!261885 () Bool)

(assert (=> bm!22700 m!261885))

(assert (=> bm!22701 m!261719))

(assert (=> d!60053 m!261723))

(declare-fun m!261887 () Bool)

(assert (=> d!60053 m!261887))

(assert (=> d!60053 m!261845))

(assert (=> b!243176 d!60053))

(declare-fun d!60055 () Bool)

(assert (=> d!60055 (= (array_inv!3785 (_keys!6616 thiss!1504)) (bvsge (size!6065 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243185 d!60055))

(declare-fun d!60057 () Bool)

(assert (=> d!60057 (= (array_inv!3786 (_values!4489 thiss!1504)) (bvsge (size!6064 (_values!4489 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243185 d!60057))

(assert (=> b!243182 d!60041))

(declare-fun d!60059 () Bool)

(declare-fun res!119301 () Bool)

(declare-fun e!157970 () Bool)

(assert (=> d!60059 (=> res!119301 e!157970)))

(assert (=> d!60059 (= res!119301 (bvsge #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))))))

(assert (=> d!60059 (= (arrayNoDuplicates!0 (_keys!6616 thiss!1504) #b00000000000000000000000000000000 Nil!3641) e!157970)))

(declare-fun b!243421 () Bool)

(declare-fun e!157973 () Bool)

(declare-fun e!157971 () Bool)

(assert (=> b!243421 (= e!157973 e!157971)))

(declare-fun c!40641 () Bool)

(assert (=> b!243421 (= c!40641 (validKeyInArray!0 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243422 () Bool)

(declare-fun e!157972 () Bool)

(assert (=> b!243422 (= e!157972 (contains!1752 Nil!3641 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243423 () Bool)

(declare-fun call!22707 () Bool)

(assert (=> b!243423 (= e!157971 call!22707)))

(declare-fun bm!22704 () Bool)

(assert (=> bm!22704 (= call!22707 (arrayNoDuplicates!0 (_keys!6616 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40641 (Cons!3640 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000) Nil!3641) Nil!3641)))))

(declare-fun b!243424 () Bool)

(assert (=> b!243424 (= e!157970 e!157973)))

(declare-fun res!119302 () Bool)

(assert (=> b!243424 (=> (not res!119302) (not e!157973))))

(assert (=> b!243424 (= res!119302 (not e!157972))))

(declare-fun res!119300 () Bool)

(assert (=> b!243424 (=> (not res!119300) (not e!157972))))

(assert (=> b!243424 (= res!119300 (validKeyInArray!0 (select (arr!5723 (_keys!6616 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!243425 () Bool)

(assert (=> b!243425 (= e!157971 call!22707)))

(assert (= (and d!60059 (not res!119301)) b!243424))

(assert (= (and b!243424 res!119300) b!243422))

(assert (= (and b!243424 res!119302) b!243421))

(assert (= (and b!243421 c!40641) b!243425))

(assert (= (and b!243421 (not c!40641)) b!243423))

(assert (= (or b!243425 b!243423) bm!22704))

(assert (=> b!243421 m!261799))

(assert (=> b!243421 m!261799))

(assert (=> b!243421 m!261843))

(assert (=> b!243422 m!261799))

(assert (=> b!243422 m!261799))

(declare-fun m!261889 () Bool)

(assert (=> b!243422 m!261889))

(assert (=> bm!22704 m!261799))

(declare-fun m!261891 () Bool)

(assert (=> bm!22704 m!261891))

(assert (=> b!243424 m!261799))

(assert (=> b!243424 m!261799))

(assert (=> b!243424 m!261843))

(assert (=> b!243181 d!60059))

(declare-fun d!60061 () Bool)

(declare-fun e!157976 () Bool)

(assert (=> d!60061 e!157976))

(declare-fun res!119308 () Bool)

(assert (=> d!60061 (=> (not res!119308) (not e!157976))))

(declare-fun lt!122199 () SeekEntryResult!1070)

(assert (=> d!60061 (= res!119308 ((_ is Found!1070) lt!122199))))

(assert (=> d!60061 (= lt!122199 (seekEntryOrOpen!0 key!932 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)))))

(declare-fun lt!122200 () Unit!7503)

(declare-fun choose!1136 (array!12053 array!12051 (_ BitVec 32) (_ BitVec 32) V!8155 V!8155 (_ BitVec 64) Int) Unit!7503)

(assert (=> d!60061 (= lt!122200 (choose!1136 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 (defaultEntry!4506 thiss!1504)))))

(assert (=> d!60061 (validMask!0 (mask!10595 thiss!1504))))

(assert (=> d!60061 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!359 (_keys!6616 thiss!1504) (_values!4489 thiss!1504) (mask!10595 thiss!1504) (extraKeys!4243 thiss!1504) (zeroValue!4347 thiss!1504) (minValue!4347 thiss!1504) key!932 (defaultEntry!4506 thiss!1504)) lt!122200)))

(declare-fun b!243430 () Bool)

(declare-fun res!119307 () Bool)

(assert (=> b!243430 (=> (not res!119307) (not e!157976))))

(assert (=> b!243430 (= res!119307 (inRange!0 (index!6451 lt!122199) (mask!10595 thiss!1504)))))

(declare-fun b!243431 () Bool)

(assert (=> b!243431 (= e!157976 (= (select (arr!5723 (_keys!6616 thiss!1504)) (index!6451 lt!122199)) key!932))))

(assert (=> b!243431 (and (bvsge (index!6451 lt!122199) #b00000000000000000000000000000000) (bvslt (index!6451 lt!122199) (size!6065 (_keys!6616 thiss!1504))))))

(assert (= (and d!60061 res!119308) b!243430))

(assert (= (and b!243430 res!119307) b!243431))

(assert (=> d!60061 m!261723))

(declare-fun m!261893 () Bool)

(assert (=> d!60061 m!261893))

(assert (=> d!60061 m!261845))

(declare-fun m!261895 () Bool)

(assert (=> b!243430 m!261895))

(declare-fun m!261897 () Bool)

(assert (=> b!243431 m!261897))

(assert (=> b!243191 d!60061))

(assert (=> bm!22668 d!60047))

(declare-fun d!60063 () Bool)

(declare-fun res!119313 () Bool)

(declare-fun e!157981 () Bool)

(assert (=> d!60063 (=> res!119313 e!157981)))

(assert (=> d!60063 (= res!119313 ((_ is Nil!3641) Nil!3641))))

(assert (=> d!60063 (= (noDuplicate!94 Nil!3641) e!157981)))

(declare-fun b!243436 () Bool)

(declare-fun e!157982 () Bool)

(assert (=> b!243436 (= e!157981 e!157982)))

(declare-fun res!119314 () Bool)

(assert (=> b!243436 (=> (not res!119314) (not e!157982))))

(assert (=> b!243436 (= res!119314 (not (contains!1752 (t!8649 Nil!3641) (h!4297 Nil!3641))))))

(declare-fun b!243437 () Bool)

(assert (=> b!243437 (= e!157982 (noDuplicate!94 (t!8649 Nil!3641)))))

(assert (= (and d!60063 (not res!119313)) b!243436))

(assert (= (and b!243436 res!119314) b!243437))

(declare-fun m!261899 () Bool)

(assert (=> b!243436 m!261899))

(declare-fun m!261901 () Bool)

(assert (=> b!243437 m!261901))

(assert (=> b!243192 d!60063))

(declare-fun d!60065 () Bool)

(declare-fun res!119321 () Bool)

(declare-fun e!157985 () Bool)

(assert (=> d!60065 (=> (not res!119321) (not e!157985))))

(declare-fun simpleValid!249 (LongMapFixedSize!3594) Bool)

(assert (=> d!60065 (= res!119321 (simpleValid!249 thiss!1504))))

(assert (=> d!60065 (= (valid!1409 thiss!1504) e!157985)))

(declare-fun b!243444 () Bool)

(declare-fun res!119322 () Bool)

(assert (=> b!243444 (=> (not res!119322) (not e!157985))))

(declare-fun arrayCountValidKeys!0 (array!12053 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!243444 (= res!119322 (= (arrayCountValidKeys!0 (_keys!6616 thiss!1504) #b00000000000000000000000000000000 (size!6065 (_keys!6616 thiss!1504))) (_size!1846 thiss!1504)))))

(declare-fun b!243445 () Bool)

(declare-fun res!119323 () Bool)

(assert (=> b!243445 (=> (not res!119323) (not e!157985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12053 (_ BitVec 32)) Bool)

(assert (=> b!243445 (= res!119323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6616 thiss!1504) (mask!10595 thiss!1504)))))

(declare-fun b!243446 () Bool)

(assert (=> b!243446 (= e!157985 (arrayNoDuplicates!0 (_keys!6616 thiss!1504) #b00000000000000000000000000000000 Nil!3641))))

(assert (= (and d!60065 res!119321) b!243444))

(assert (= (and b!243444 res!119322) b!243445))

(assert (= (and b!243445 res!119323) b!243446))

(declare-fun m!261903 () Bool)

(assert (=> d!60065 m!261903))

(declare-fun m!261905 () Bool)

(assert (=> b!243444 m!261905))

(declare-fun m!261907 () Bool)

(assert (=> b!243445 m!261907))

(assert (=> b!243446 m!261715))

(assert (=> start!23180 d!60065))

(declare-fun mapNonEmpty!10825 () Bool)

(declare-fun mapRes!10825 () Bool)

(declare-fun tp!22786 () Bool)

(declare-fun e!157991 () Bool)

(assert (=> mapNonEmpty!10825 (= mapRes!10825 (and tp!22786 e!157991))))

(declare-fun mapRest!10825 () (Array (_ BitVec 32) ValueCell!2847))

(declare-fun mapValue!10825 () ValueCell!2847)

(declare-fun mapKey!10825 () (_ BitVec 32))

(assert (=> mapNonEmpty!10825 (= mapRest!10819 (store mapRest!10825 mapKey!10825 mapValue!10825))))

(declare-fun b!243454 () Bool)

(declare-fun e!157990 () Bool)

(assert (=> b!243454 (= e!157990 tp_is_empty!6381)))

(declare-fun condMapEmpty!10825 () Bool)

(declare-fun mapDefault!10825 () ValueCell!2847)

(assert (=> mapNonEmpty!10819 (= condMapEmpty!10825 (= mapRest!10819 ((as const (Array (_ BitVec 32) ValueCell!2847)) mapDefault!10825)))))

(assert (=> mapNonEmpty!10819 (= tp!22777 (and e!157990 mapRes!10825))))

(declare-fun b!243453 () Bool)

(assert (=> b!243453 (= e!157991 tp_is_empty!6381)))

(declare-fun mapIsEmpty!10825 () Bool)

(assert (=> mapIsEmpty!10825 mapRes!10825))

(assert (= (and mapNonEmpty!10819 condMapEmpty!10825) mapIsEmpty!10825))

(assert (= (and mapNonEmpty!10819 (not condMapEmpty!10825)) mapNonEmpty!10825))

(assert (= (and mapNonEmpty!10825 ((_ is ValueCellFull!2847) mapValue!10825)) b!243453))

(assert (= (and mapNonEmpty!10819 ((_ is ValueCellFull!2847) mapDefault!10825)) b!243454))

(declare-fun m!261909 () Bool)

(assert (=> mapNonEmpty!10825 m!261909))

(declare-fun b_lambda!8009 () Bool)

(assert (= b_lambda!8007 (or (and b!243185 b_free!6519) b_lambda!8009)))

(check-sat (not d!60061) (not bm!22704) (not b!243342) (not d!60043) (not b!243291) (not b!243422) (not b!243446) (not b!243386) (not b!243445) (not d!60065) (not bm!22695) (not bm!22689) (not b!243340) (not b!243341) (not d!60049) (not bm!22692) (not b!243424) (not b!243337) (not b!243284) (not bm!22690) (not b!243344) (not bm!22700) (not b!243436) (not b!243366) (not d!60033) (not mapNonEmpty!10825) (not b_next!6519) (not d!60037) (not b!243430) (not d!60051) (not b_lambda!8009) (not bm!22701) (not b!243379) (not b!243421) tp_is_empty!6381 (not b!243349) (not d!60041) (not b!243360) (not b!243444) (not d!60053) (not d!60039) (not b!243338) (not b!243356) b_and!13503 (not b!243293) (not b!243437))
(check-sat b_and!13503 (not b_next!6519))
