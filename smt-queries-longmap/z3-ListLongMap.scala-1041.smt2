; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21930 () Bool)

(assert start!21930)

(declare-fun b!223338 () Bool)

(declare-fun b_free!5997 () Bool)

(declare-fun b_next!5997 () Bool)

(assert (=> b!223338 (= b_free!5997 (not b_next!5997))))

(declare-fun tp!21132 () Bool)

(declare-fun b_and!12895 () Bool)

(assert (=> b!223338 (= tp!21132 b_and!12895)))

(declare-fun b!223317 () Bool)

(declare-fun e!145088 () Bool)

(declare-fun tp_is_empty!5859 () Bool)

(assert (=> b!223317 (= e!145088 tp_is_empty!5859)))

(declare-fun b!223319 () Bool)

(declare-fun e!145089 () Bool)

(declare-fun e!145086 () Bool)

(assert (=> b!223319 (= e!145089 e!145086)))

(declare-fun res!109739 () Bool)

(declare-fun call!20825 () Bool)

(assert (=> b!223319 (= res!109739 call!20825)))

(assert (=> b!223319 (=> (not res!109739) (not e!145086))))

(declare-fun b!223320 () Bool)

(declare-fun res!109745 () Bool)

(declare-fun e!145083 () Bool)

(assert (=> b!223320 (=> (not res!109745) (not e!145083))))

(declare-datatypes ((List!3318 0))(
  ( (Nil!3315) (Cons!3314 (h!3962 (_ BitVec 64)) (t!8277 List!3318)) )
))
(declare-fun noDuplicate!76 (List!3318) Bool)

(assert (=> b!223320 (= res!109745 (noDuplicate!76 Nil!3315))))

(declare-fun bm!20822 () Bool)

(declare-fun c!37079 () Bool)

(declare-datatypes ((V!7459 0))(
  ( (V!7460 (val!2974 Int)) )
))
(declare-datatypes ((ValueCell!2586 0))(
  ( (ValueCellFull!2586 (v!4994 V!7459)) (EmptyCell!2586) )
))
(declare-datatypes ((array!10961 0))(
  ( (array!10962 (arr!5200 (Array (_ BitVec 32) ValueCell!2586)) (size!5533 (_ BitVec 32))) )
))
(declare-datatypes ((array!10963 0))(
  ( (array!10964 (arr!5201 (Array (_ BitVec 32) (_ BitVec 64))) (size!5534 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3072 0))(
  ( (LongMapFixedSize!3073 (defaultEntry!4195 Int) (mask!10021 (_ BitVec 32)) (extraKeys!3932 (_ BitVec 32)) (zeroValue!4036 V!7459) (minValue!4036 V!7459) (_size!1585 (_ BitVec 32)) (_keys!6249 array!10963) (_values!4178 array!10961) (_vacant!1585 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3072)

(declare-datatypes ((SeekEntryResult!847 0))(
  ( (MissingZero!847 (index!5558 (_ BitVec 32))) (Found!847 (index!5559 (_ BitVec 32))) (Intermediate!847 (undefined!1659 Bool) (index!5560 (_ BitVec 32)) (x!23091 (_ BitVec 32))) (Undefined!847) (MissingVacant!847 (index!5561 (_ BitVec 32))) )
))
(declare-fun lt!112877 () SeekEntryResult!847)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20822 (= call!20825 (inRange!0 (ite c!37079 (index!5558 lt!112877) (index!5561 lt!112877)) (mask!10021 thiss!1504)))))

(declare-fun b!223321 () Bool)

(declare-fun e!145082 () Bool)

(assert (=> b!223321 (= e!145082 tp_is_empty!5859)))

(declare-fun b!223322 () Bool)

(declare-fun res!109748 () Bool)

(assert (=> b!223322 (=> (not res!109748) (not e!145083))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223322 (= res!109748 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5534 (_keys!6249 thiss!1504)))))))

(declare-fun b!223323 () Bool)

(declare-fun c!37078 () Bool)

(get-info :version)

(assert (=> b!223323 (= c!37078 ((_ is MissingVacant!847) lt!112877))))

(declare-fun e!145087 () Bool)

(assert (=> b!223323 (= e!145087 e!145089)))

(declare-fun b!223324 () Bool)

(declare-fun res!109738 () Bool)

(assert (=> b!223324 (=> (not res!109738) (not e!145083))))

(declare-fun contains!1538 (List!3318 (_ BitVec 64)) Bool)

(assert (=> b!223324 (= res!109738 (not (contains!1538 Nil!3315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223325 () Bool)

(declare-fun res!109743 () Bool)

(declare-fun e!145084 () Bool)

(assert (=> b!223325 (=> (not res!109743) (not e!145084))))

(assert (=> b!223325 (= res!109743 call!20825)))

(assert (=> b!223325 (= e!145087 e!145084)))

(declare-fun b!223326 () Bool)

(declare-fun e!145076 () Bool)

(declare-fun e!145090 () Bool)

(assert (=> b!223326 (= e!145076 e!145090)))

(declare-fun res!109731 () Bool)

(assert (=> b!223326 (=> (not res!109731) (not e!145090))))

(assert (=> b!223326 (= res!109731 (inRange!0 index!297 (mask!10021 thiss!1504)))))

(declare-datatypes ((Unit!6708 0))(
  ( (Unit!6709) )
))
(declare-fun lt!112873 () Unit!6708)

(declare-fun e!145078 () Unit!6708)

(assert (=> b!223326 (= lt!112873 e!145078)))

(declare-fun c!37077 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4410 0))(
  ( (tuple2!4411 (_1!2216 (_ BitVec 64)) (_2!2216 V!7459)) )
))
(declare-datatypes ((List!3319 0))(
  ( (Nil!3316) (Cons!3315 (h!3963 tuple2!4410) (t!8278 List!3319)) )
))
(declare-datatypes ((ListLongMap!3323 0))(
  ( (ListLongMap!3324 (toList!1677 List!3319)) )
))
(declare-fun contains!1539 (ListLongMap!3323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1205 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7459 V!7459 (_ BitVec 32) Int) ListLongMap!3323)

(assert (=> b!223326 (= c!37077 (contains!1539 (getCurrentListMap!1205 (_keys!6249 thiss!1504) (_values!4178 thiss!1504) (mask!10021 thiss!1504) (extraKeys!3932 thiss!1504) (zeroValue!4036 thiss!1504) (minValue!4036 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4195 thiss!1504)) key!932))))

(declare-fun b!223327 () Bool)

(declare-fun res!109746 () Bool)

(assert (=> b!223327 (=> (not res!109746) (not e!145083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223327 (= res!109746 (validKeyInArray!0 key!932))))

(declare-fun b!223328 () Bool)

(declare-fun e!145079 () Bool)

(declare-fun mapRes!9958 () Bool)

(assert (=> b!223328 (= e!145079 (and e!145088 mapRes!9958))))

(declare-fun condMapEmpty!9958 () Bool)

(declare-fun mapDefault!9958 () ValueCell!2586)

(assert (=> b!223328 (= condMapEmpty!9958 (= (arr!5200 (_values!4178 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2586)) mapDefault!9958)))))

(declare-fun b!223329 () Bool)

(declare-fun res!109742 () Bool)

(assert (=> b!223329 (=> (not res!109742) (not e!145083))))

(declare-fun arrayNoDuplicates!0 (array!10963 (_ BitVec 32) List!3318) Bool)

(assert (=> b!223329 (= res!109742 (arrayNoDuplicates!0 (_keys!6249 thiss!1504) #b00000000000000000000000000000000 Nil!3315))))

(declare-fun b!223330 () Bool)

(declare-fun res!109741 () Bool)

(declare-fun e!145074 () Bool)

(assert (=> b!223330 (=> (not res!109741) (not e!145074))))

(assert (=> b!223330 (= res!109741 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223331 () Bool)

(assert (=> b!223331 (= e!145083 false)))

(declare-fun lt!112876 () Bool)

(assert (=> b!223331 (= lt!112876 (contains!1538 Nil!3315 key!932))))

(declare-fun b!223332 () Bool)

(declare-fun e!145085 () Bool)

(declare-fun e!145080 () Bool)

(assert (=> b!223332 (= e!145085 e!145080)))

(declare-fun res!109749 () Bool)

(assert (=> b!223332 (=> (not res!109749) (not e!145080))))

(assert (=> b!223332 (= res!109749 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223333 () Bool)

(declare-fun res!109744 () Bool)

(assert (=> b!223333 (=> (not res!109744) (not e!145084))))

(assert (=> b!223333 (= res!109744 (= (select (arr!5201 (_keys!6249 thiss!1504)) (index!5558 lt!112877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223334 () Bool)

(declare-fun call!20826 () Bool)

(assert (=> b!223334 (= e!145084 (not call!20826))))

(declare-fun b!223335 () Bool)

(declare-fun res!109740 () Bool)

(assert (=> b!223335 (=> (not res!109740) (not e!145083))))

(declare-fun lt!112875 () Bool)

(assert (=> b!223335 (= res!109740 (not lt!112875))))

(declare-fun b!223336 () Bool)

(declare-fun e!145091 () Bool)

(assert (=> b!223336 (= e!145091 (contains!1538 Nil!3315 key!932))))

(declare-fun b!223337 () Bool)

(declare-fun res!109733 () Bool)

(assert (=> b!223337 (=> (not res!109733) (not e!145083))))

(assert (=> b!223337 (= res!109733 e!145085)))

(declare-fun res!109747 () Bool)

(assert (=> b!223337 (=> res!109747 e!145085)))

(assert (=> b!223337 (= res!109747 e!145091)))

(declare-fun res!109734 () Bool)

(assert (=> b!223337 (=> (not res!109734) (not e!145091))))

(assert (=> b!223337 (= res!109734 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun e!145081 () Bool)

(declare-fun array_inv!3441 (array!10963) Bool)

(declare-fun array_inv!3442 (array!10961) Bool)

(assert (=> b!223338 (= e!145081 (and tp!21132 tp_is_empty!5859 (array_inv!3441 (_keys!6249 thiss!1504)) (array_inv!3442 (_values!4178 thiss!1504)) e!145079))))

(declare-fun b!223339 () Bool)

(declare-fun Unit!6710 () Unit!6708)

(assert (=> b!223339 (= e!145078 Unit!6710)))

(declare-fun lt!112872 () Unit!6708)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!231 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7459 V!7459 (_ BitVec 64) Int) Unit!6708)

(assert (=> b!223339 (= lt!112872 (lemmaInListMapThenSeekEntryOrOpenFindsIt!231 (_keys!6249 thiss!1504) (_values!4178 thiss!1504) (mask!10021 thiss!1504) (extraKeys!3932 thiss!1504) (zeroValue!4036 thiss!1504) (minValue!4036 thiss!1504) key!932 (defaultEntry!4195 thiss!1504)))))

(assert (=> b!223339 false))

(declare-fun b!223340 () Bool)

(declare-fun e!145077 () Unit!6708)

(declare-fun Unit!6711 () Unit!6708)

(assert (=> b!223340 (= e!145077 Unit!6711)))

(declare-fun lt!112871 () Unit!6708)

(declare-fun lemmaArrayContainsKeyThenInListMap!70 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7459 V!7459 (_ BitVec 64) (_ BitVec 32) Int) Unit!6708)

(assert (=> b!223340 (= lt!112871 (lemmaArrayContainsKeyThenInListMap!70 (_keys!6249 thiss!1504) (_values!4178 thiss!1504) (mask!10021 thiss!1504) (extraKeys!3932 thiss!1504) (zeroValue!4036 thiss!1504) (minValue!4036 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4195 thiss!1504)))))

(assert (=> b!223340 false))

(declare-fun b!223341 () Bool)

(declare-fun lt!112870 () Unit!6708)

(assert (=> b!223341 (= e!145078 lt!112870)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!242 (array!10963 array!10961 (_ BitVec 32) (_ BitVec 32) V!7459 V!7459 (_ BitVec 64) Int) Unit!6708)

(assert (=> b!223341 (= lt!112870 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!242 (_keys!6249 thiss!1504) (_values!4178 thiss!1504) (mask!10021 thiss!1504) (extraKeys!3932 thiss!1504) (zeroValue!4036 thiss!1504) (minValue!4036 thiss!1504) key!932 (defaultEntry!4195 thiss!1504)))))

(assert (=> b!223341 (= c!37079 ((_ is MissingZero!847) lt!112877))))

(assert (=> b!223341 e!145087))

(declare-fun res!109736 () Bool)

(assert (=> start!21930 (=> (not res!109736) (not e!145074))))

(declare-fun valid!1237 (LongMapFixedSize!3072) Bool)

(assert (=> start!21930 (= res!109736 (valid!1237 thiss!1504))))

(assert (=> start!21930 e!145074))

(assert (=> start!21930 e!145081))

(assert (=> start!21930 true))

(declare-fun b!223318 () Bool)

(assert (=> b!223318 (= e!145089 ((_ is Undefined!847) lt!112877))))

(declare-fun b!223342 () Bool)

(assert (=> b!223342 (= e!145080 (not (contains!1538 Nil!3315 key!932)))))

(declare-fun b!223343 () Bool)

(declare-fun Unit!6712 () Unit!6708)

(assert (=> b!223343 (= e!145077 Unit!6712)))

(declare-fun mapIsEmpty!9958 () Bool)

(assert (=> mapIsEmpty!9958 mapRes!9958))

(declare-fun b!223344 () Bool)

(declare-fun res!109735 () Bool)

(assert (=> b!223344 (= res!109735 (= (select (arr!5201 (_keys!6249 thiss!1504)) (index!5561 lt!112877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223344 (=> (not res!109735) (not e!145086))))

(declare-fun b!223345 () Bool)

(assert (=> b!223345 (= e!145090 e!145083)))

(declare-fun res!109750 () Bool)

(assert (=> b!223345 (=> (not res!109750) (not e!145083))))

(assert (=> b!223345 (= res!109750 (and (bvslt (size!5534 (_keys!6249 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5534 (_keys!6249 thiss!1504)))))))

(declare-fun lt!112874 () Unit!6708)

(assert (=> b!223345 (= lt!112874 e!145077)))

(declare-fun c!37080 () Bool)

(assert (=> b!223345 (= c!37080 lt!112875)))

(declare-fun arrayContainsKey!0 (array!10963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223345 (= lt!112875 (arrayContainsKey!0 (_keys!6249 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20823 () Bool)

(assert (=> bm!20823 (= call!20826 (arrayContainsKey!0 (_keys!6249 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223346 () Bool)

(declare-fun res!109732 () Bool)

(assert (=> b!223346 (=> (not res!109732) (not e!145083))))

(assert (=> b!223346 (= res!109732 (not (contains!1538 Nil!3315 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!9958 () Bool)

(declare-fun tp!21133 () Bool)

(assert (=> mapNonEmpty!9958 (= mapRes!9958 (and tp!21133 e!145082))))

(declare-fun mapRest!9958 () (Array (_ BitVec 32) ValueCell!2586))

(declare-fun mapKey!9958 () (_ BitVec 32))

(declare-fun mapValue!9958 () ValueCell!2586)

(assert (=> mapNonEmpty!9958 (= (arr!5200 (_values!4178 thiss!1504)) (store mapRest!9958 mapKey!9958 mapValue!9958))))

(declare-fun b!223347 () Bool)

(assert (=> b!223347 (= e!145074 e!145076)))

(declare-fun res!109737 () Bool)

(assert (=> b!223347 (=> (not res!109737) (not e!145076))))

(assert (=> b!223347 (= res!109737 (or (= lt!112877 (MissingZero!847 index!297)) (= lt!112877 (MissingVacant!847 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10963 (_ BitVec 32)) SeekEntryResult!847)

(assert (=> b!223347 (= lt!112877 (seekEntryOrOpen!0 key!932 (_keys!6249 thiss!1504) (mask!10021 thiss!1504)))))

(declare-fun b!223348 () Bool)

(assert (=> b!223348 (= e!145086 (not call!20826))))

(assert (= (and start!21930 res!109736) b!223330))

(assert (= (and b!223330 res!109741) b!223347))

(assert (= (and b!223347 res!109737) b!223326))

(assert (= (and b!223326 c!37077) b!223339))

(assert (= (and b!223326 (not c!37077)) b!223341))

(assert (= (and b!223341 c!37079) b!223325))

(assert (= (and b!223341 (not c!37079)) b!223323))

(assert (= (and b!223325 res!109743) b!223333))

(assert (= (and b!223333 res!109744) b!223334))

(assert (= (and b!223323 c!37078) b!223319))

(assert (= (and b!223323 (not c!37078)) b!223318))

(assert (= (and b!223319 res!109739) b!223344))

(assert (= (and b!223344 res!109735) b!223348))

(assert (= (or b!223325 b!223319) bm!20822))

(assert (= (or b!223334 b!223348) bm!20823))

(assert (= (and b!223326 res!109731) b!223345))

(assert (= (and b!223345 c!37080) b!223340))

(assert (= (and b!223345 (not c!37080)) b!223343))

(assert (= (and b!223345 res!109750) b!223320))

(assert (= (and b!223320 res!109745) b!223324))

(assert (= (and b!223324 res!109738) b!223346))

(assert (= (and b!223346 res!109732) b!223337))

(assert (= (and b!223337 res!109734) b!223336))

(assert (= (and b!223337 (not res!109747)) b!223332))

(assert (= (and b!223332 res!109749) b!223342))

(assert (= (and b!223337 res!109733) b!223329))

(assert (= (and b!223329 res!109742) b!223322))

(assert (= (and b!223322 res!109748) b!223327))

(assert (= (and b!223327 res!109746) b!223335))

(assert (= (and b!223335 res!109740) b!223331))

(assert (= (and b!223328 condMapEmpty!9958) mapIsEmpty!9958))

(assert (= (and b!223328 (not condMapEmpty!9958)) mapNonEmpty!9958))

(assert (= (and mapNonEmpty!9958 ((_ is ValueCellFull!2586) mapValue!9958)) b!223321))

(assert (= (and b!223328 ((_ is ValueCellFull!2586) mapDefault!9958)) b!223317))

(assert (= b!223338 b!223328))

(assert (= start!21930 b!223338))

(declare-fun m!246953 () Bool)

(assert (=> bm!20823 m!246953))

(declare-fun m!246955 () Bool)

(assert (=> b!223326 m!246955))

(declare-fun m!246957 () Bool)

(assert (=> b!223326 m!246957))

(assert (=> b!223326 m!246957))

(declare-fun m!246959 () Bool)

(assert (=> b!223326 m!246959))

(declare-fun m!246961 () Bool)

(assert (=> b!223346 m!246961))

(declare-fun m!246963 () Bool)

(assert (=> b!223344 m!246963))

(declare-fun m!246965 () Bool)

(assert (=> b!223324 m!246965))

(declare-fun m!246967 () Bool)

(assert (=> b!223338 m!246967))

(declare-fun m!246969 () Bool)

(assert (=> b!223338 m!246969))

(declare-fun m!246971 () Bool)

(assert (=> b!223347 m!246971))

(declare-fun m!246973 () Bool)

(assert (=> start!21930 m!246973))

(declare-fun m!246975 () Bool)

(assert (=> b!223342 m!246975))

(declare-fun m!246977 () Bool)

(assert (=> b!223341 m!246977))

(declare-fun m!246979 () Bool)

(assert (=> b!223320 m!246979))

(declare-fun m!246981 () Bool)

(assert (=> b!223329 m!246981))

(declare-fun m!246983 () Bool)

(assert (=> b!223339 m!246983))

(assert (=> b!223345 m!246953))

(declare-fun m!246985 () Bool)

(assert (=> b!223340 m!246985))

(declare-fun m!246987 () Bool)

(assert (=> b!223327 m!246987))

(declare-fun m!246989 () Bool)

(assert (=> bm!20822 m!246989))

(assert (=> b!223336 m!246975))

(assert (=> b!223331 m!246975))

(declare-fun m!246991 () Bool)

(assert (=> mapNonEmpty!9958 m!246991))

(declare-fun m!246993 () Bool)

(assert (=> b!223333 m!246993))

(check-sat tp_is_empty!5859 (not b!223331) (not b!223345) (not start!21930) (not b!223346) (not b!223347) (not bm!20823) (not bm!20822) (not b!223342) (not b_next!5997) (not b!223320) (not b!223341) (not b!223329) (not mapNonEmpty!9958) (not b!223336) (not b!223340) (not b!223327) (not b!223326) (not b!223339) (not b!223338) (not b!223324) b_and!12895)
(check-sat b_and!12895 (not b_next!5997))
