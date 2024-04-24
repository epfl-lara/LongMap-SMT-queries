; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21884 () Bool)

(assert start!21884)

(declare-fun b!221311 () Bool)

(declare-fun b_free!5947 () Bool)

(declare-fun b_next!5947 () Bool)

(assert (=> b!221311 (= b_free!5947 (not b_next!5947))))

(declare-fun tp!20982 () Bool)

(declare-fun b_and!12859 () Bool)

(assert (=> b!221311 (= tp!20982 b_and!12859)))

(declare-fun b!221295 () Bool)

(declare-fun e!143835 () Bool)

(declare-fun e!143833 () Bool)

(declare-fun mapRes!9883 () Bool)

(assert (=> b!221295 (= e!143835 (and e!143833 mapRes!9883))))

(declare-fun condMapEmpty!9883 () Bool)

(declare-datatypes ((V!7393 0))(
  ( (V!7394 (val!2949 Int)) )
))
(declare-datatypes ((ValueCell!2561 0))(
  ( (ValueCellFull!2561 (v!4970 V!7393)) (EmptyCell!2561) )
))
(declare-datatypes ((array!10859 0))(
  ( (array!10860 (arr!5149 (Array (_ BitVec 32) ValueCell!2561)) (size!5482 (_ BitVec 32))) )
))
(declare-datatypes ((array!10861 0))(
  ( (array!10862 (arr!5150 (Array (_ BitVec 32) (_ BitVec 64))) (size!5483 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3022 0))(
  ( (LongMapFixedSize!3023 (defaultEntry!4170 Int) (mask!9980 (_ BitVec 32)) (extraKeys!3907 (_ BitVec 32)) (zeroValue!4011 V!7393) (minValue!4011 V!7393) (_size!1560 (_ BitVec 32)) (_keys!6224 array!10861) (_values!4153 array!10859) (_vacant!1560 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3022)

(declare-fun mapDefault!9883 () ValueCell!2561)

(assert (=> b!221295 (= condMapEmpty!9883 (= (arr!5149 (_values!4153 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2561)) mapDefault!9883)))))

(declare-fun b!221296 () Bool)

(declare-fun e!143837 () Bool)

(declare-fun tp_is_empty!5809 () Bool)

(assert (=> b!221296 (= e!143837 tp_is_empty!5809)))

(declare-fun b!221297 () Bool)

(declare-fun res!108559 () Bool)

(declare-datatypes ((SeekEntryResult!796 0))(
  ( (MissingZero!796 (index!5354 (_ BitVec 32))) (Found!796 (index!5355 (_ BitVec 32))) (Intermediate!796 (undefined!1608 Bool) (index!5356 (_ BitVec 32)) (x!22976 (_ BitVec 32))) (Undefined!796) (MissingVacant!796 (index!5357 (_ BitVec 32))) )
))
(declare-fun lt!112426 () SeekEntryResult!796)

(assert (=> b!221297 (= res!108559 (= (select (arr!5150 (_keys!6224 thiss!1504)) (index!5357 lt!112426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143840 () Bool)

(assert (=> b!221297 (=> (not res!108559) (not e!143840))))

(declare-fun b!221298 () Bool)

(declare-fun c!36808 () Bool)

(get-info :version)

(assert (=> b!221298 (= c!36808 ((_ is MissingVacant!796) lt!112426))))

(declare-fun e!143839 () Bool)

(declare-fun e!143834 () Bool)

(assert (=> b!221298 (= e!143839 e!143834)))

(declare-fun b!221299 () Bool)

(declare-fun res!108560 () Bool)

(declare-fun e!143830 () Bool)

(assert (=> b!221299 (=> (not res!108560) (not e!143830))))

(assert (=> b!221299 (= res!108560 (and (= (size!5482 (_values!4153 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9980 thiss!1504))) (= (size!5483 (_keys!6224 thiss!1504)) (size!5482 (_values!4153 thiss!1504))) (bvsge (mask!9980 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3907 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3907 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221300 () Bool)

(declare-fun e!143828 () Bool)

(assert (=> b!221300 (= e!143828 e!143830)))

(declare-fun res!108555 () Bool)

(assert (=> b!221300 (=> (not res!108555) (not e!143830))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221300 (= res!108555 (inRange!0 index!297 (mask!9980 thiss!1504)))))

(declare-datatypes ((Unit!6575 0))(
  ( (Unit!6576) )
))
(declare-fun lt!112423 () Unit!6575)

(declare-fun e!143829 () Unit!6575)

(assert (=> b!221300 (= lt!112423 e!143829)))

(declare-fun c!36806 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4290 0))(
  ( (tuple2!4291 (_1!2156 (_ BitVec 64)) (_2!2156 V!7393)) )
))
(declare-datatypes ((List!3185 0))(
  ( (Nil!3182) (Cons!3181 (h!3829 tuple2!4290) (t!8136 List!3185)) )
))
(declare-datatypes ((ListLongMap!3205 0))(
  ( (ListLongMap!3206 (toList!1618 List!3185)) )
))
(declare-fun contains!1475 (ListLongMap!3205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1150 (array!10861 array!10859 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 32) Int) ListLongMap!3205)

(assert (=> b!221300 (= c!36806 (contains!1475 (getCurrentListMap!1150 (_keys!6224 thiss!1504) (_values!4153 thiss!1504) (mask!9980 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4170 thiss!1504)) key!932))))

(declare-fun b!221301 () Bool)

(declare-fun call!20663 () Bool)

(assert (=> b!221301 (= e!143840 (not call!20663))))

(declare-fun bm!20660 () Bool)

(declare-fun call!20664 () Bool)

(declare-fun c!36807 () Bool)

(assert (=> bm!20660 (= call!20664 (inRange!0 (ite c!36807 (index!5354 lt!112426) (index!5357 lt!112426)) (mask!9980 thiss!1504)))))

(declare-fun b!221303 () Bool)

(assert (=> b!221303 (= e!143834 ((_ is Undefined!796) lt!112426))))

(declare-fun bm!20661 () Bool)

(declare-fun arrayContainsKey!0 (array!10861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20661 (= call!20663 (arrayContainsKey!0 (_keys!6224 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221304 () Bool)

(declare-fun res!108552 () Bool)

(assert (=> b!221304 (=> (not res!108552) (not e!143830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10861 (_ BitVec 32)) Bool)

(assert (=> b!221304 (= res!108552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6224 thiss!1504) (mask!9980 thiss!1504)))))

(declare-fun mapNonEmpty!9883 () Bool)

(declare-fun tp!20983 () Bool)

(assert (=> mapNonEmpty!9883 (= mapRes!9883 (and tp!20983 e!143837))))

(declare-fun mapValue!9883 () ValueCell!2561)

(declare-fun mapRest!9883 () (Array (_ BitVec 32) ValueCell!2561))

(declare-fun mapKey!9883 () (_ BitVec 32))

(assert (=> mapNonEmpty!9883 (= (arr!5149 (_values!4153 thiss!1504)) (store mapRest!9883 mapKey!9883 mapValue!9883))))

(declare-fun b!221305 () Bool)

(declare-fun e!143831 () Bool)

(assert (=> b!221305 (= e!143831 e!143828)))

(declare-fun res!108557 () Bool)

(assert (=> b!221305 (=> (not res!108557) (not e!143828))))

(assert (=> b!221305 (= res!108557 (or (= lt!112426 (MissingZero!796 index!297)) (= lt!112426 (MissingVacant!796 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10861 (_ BitVec 32)) SeekEntryResult!796)

(assert (=> b!221305 (= lt!112426 (seekEntryOrOpen!0 key!932 (_keys!6224 thiss!1504) (mask!9980 thiss!1504)))))

(declare-fun mapIsEmpty!9883 () Bool)

(assert (=> mapIsEmpty!9883 mapRes!9883))

(declare-fun b!221306 () Bool)

(assert (=> b!221306 (= e!143834 e!143840)))

(declare-fun res!108554 () Bool)

(assert (=> b!221306 (= res!108554 call!20664)))

(assert (=> b!221306 (=> (not res!108554) (not e!143840))))

(declare-fun b!221307 () Bool)

(declare-fun res!108556 () Bool)

(declare-fun e!143832 () Bool)

(assert (=> b!221307 (=> (not res!108556) (not e!143832))))

(assert (=> b!221307 (= res!108556 call!20664)))

(assert (=> b!221307 (= e!143839 e!143832)))

(declare-fun b!221308 () Bool)

(declare-fun res!108558 () Bool)

(assert (=> b!221308 (=> (not res!108558) (not e!143832))))

(assert (=> b!221308 (= res!108558 (= (select (arr!5150 (_keys!6224 thiss!1504)) (index!5354 lt!112426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!108562 () Bool)

(assert (=> start!21884 (=> (not res!108562) (not e!143831))))

(declare-fun valid!1227 (LongMapFixedSize!3022) Bool)

(assert (=> start!21884 (= res!108562 (valid!1227 thiss!1504))))

(assert (=> start!21884 e!143831))

(declare-fun e!143836 () Bool)

(assert (=> start!21884 e!143836))

(assert (=> start!21884 true))

(declare-fun b!221302 () Bool)

(declare-fun lt!112425 () Unit!6575)

(assert (=> b!221302 (= e!143829 lt!112425)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (array!10861 array!10859 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 64) Int) Unit!6575)

(assert (=> b!221302 (= lt!112425 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!203 (_keys!6224 thiss!1504) (_values!4153 thiss!1504) (mask!9980 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) key!932 (defaultEntry!4170 thiss!1504)))))

(assert (=> b!221302 (= c!36807 ((_ is MissingZero!796) lt!112426))))

(assert (=> b!221302 e!143839))

(declare-fun b!221309 () Bool)

(declare-fun res!108561 () Bool)

(assert (=> b!221309 (=> (not res!108561) (not e!143830))))

(assert (=> b!221309 (= res!108561 (arrayContainsKey!0 (_keys!6224 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221310 () Bool)

(declare-fun res!108553 () Bool)

(assert (=> b!221310 (=> (not res!108553) (not e!143831))))

(assert (=> b!221310 (= res!108553 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!3377 (array!10861) Bool)

(declare-fun array_inv!3378 (array!10859) Bool)

(assert (=> b!221311 (= e!143836 (and tp!20982 tp_is_empty!5809 (array_inv!3377 (_keys!6224 thiss!1504)) (array_inv!3378 (_values!4153 thiss!1504)) e!143835))))

(declare-fun b!221312 () Bool)

(assert (=> b!221312 (= e!143832 (not call!20663))))

(declare-fun b!221313 () Bool)

(declare-fun res!108551 () Bool)

(assert (=> b!221313 (=> (not res!108551) (not e!143830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221313 (= res!108551 (validMask!0 (mask!9980 thiss!1504)))))

(declare-fun b!221314 () Bool)

(assert (=> b!221314 (= e!143833 tp_is_empty!5809)))

(declare-fun b!221315 () Bool)

(declare-fun Unit!6577 () Unit!6575)

(assert (=> b!221315 (= e!143829 Unit!6577)))

(declare-fun lt!112422 () Unit!6575)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!207 (array!10861 array!10859 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 64) Int) Unit!6575)

(assert (=> b!221315 (= lt!112422 (lemmaInListMapThenSeekEntryOrOpenFindsIt!207 (_keys!6224 thiss!1504) (_values!4153 thiss!1504) (mask!9980 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) key!932 (defaultEntry!4170 thiss!1504)))))

(assert (=> b!221315 false))

(declare-fun b!221316 () Bool)

(assert (=> b!221316 (= e!143830 false)))

(declare-fun lt!112424 () Bool)

(declare-datatypes ((List!3186 0))(
  ( (Nil!3183) (Cons!3182 (h!3830 (_ BitVec 64)) (t!8137 List!3186)) )
))
(declare-fun arrayNoDuplicates!0 (array!10861 (_ BitVec 32) List!3186) Bool)

(assert (=> b!221316 (= lt!112424 (arrayNoDuplicates!0 (_keys!6224 thiss!1504) #b00000000000000000000000000000000 Nil!3183))))

(assert (= (and start!21884 res!108562) b!221310))

(assert (= (and b!221310 res!108553) b!221305))

(assert (= (and b!221305 res!108557) b!221300))

(assert (= (and b!221300 c!36806) b!221315))

(assert (= (and b!221300 (not c!36806)) b!221302))

(assert (= (and b!221302 c!36807) b!221307))

(assert (= (and b!221302 (not c!36807)) b!221298))

(assert (= (and b!221307 res!108556) b!221308))

(assert (= (and b!221308 res!108558) b!221312))

(assert (= (and b!221298 c!36808) b!221306))

(assert (= (and b!221298 (not c!36808)) b!221303))

(assert (= (and b!221306 res!108554) b!221297))

(assert (= (and b!221297 res!108559) b!221301))

(assert (= (or b!221307 b!221306) bm!20660))

(assert (= (or b!221312 b!221301) bm!20661))

(assert (= (and b!221300 res!108555) b!221309))

(assert (= (and b!221309 res!108561) b!221313))

(assert (= (and b!221313 res!108551) b!221299))

(assert (= (and b!221299 res!108560) b!221304))

(assert (= (and b!221304 res!108552) b!221316))

(assert (= (and b!221295 condMapEmpty!9883) mapIsEmpty!9883))

(assert (= (and b!221295 (not condMapEmpty!9883)) mapNonEmpty!9883))

(assert (= (and mapNonEmpty!9883 ((_ is ValueCellFull!2561) mapValue!9883)) b!221296))

(assert (= (and b!221295 ((_ is ValueCellFull!2561) mapDefault!9883)) b!221314))

(assert (= b!221311 b!221295))

(assert (= start!21884 b!221311))

(declare-fun m!246163 () Bool)

(assert (=> mapNonEmpty!9883 m!246163))

(declare-fun m!246165 () Bool)

(assert (=> bm!20661 m!246165))

(declare-fun m!246167 () Bool)

(assert (=> b!221311 m!246167))

(declare-fun m!246169 () Bool)

(assert (=> b!221311 m!246169))

(assert (=> b!221309 m!246165))

(declare-fun m!246171 () Bool)

(assert (=> b!221300 m!246171))

(declare-fun m!246173 () Bool)

(assert (=> b!221300 m!246173))

(assert (=> b!221300 m!246173))

(declare-fun m!246175 () Bool)

(assert (=> b!221300 m!246175))

(declare-fun m!246177 () Bool)

(assert (=> b!221315 m!246177))

(declare-fun m!246179 () Bool)

(assert (=> start!21884 m!246179))

(declare-fun m!246181 () Bool)

(assert (=> b!221308 m!246181))

(declare-fun m!246183 () Bool)

(assert (=> b!221313 m!246183))

(declare-fun m!246185 () Bool)

(assert (=> bm!20660 m!246185))

(declare-fun m!246187 () Bool)

(assert (=> b!221297 m!246187))

(declare-fun m!246189 () Bool)

(assert (=> b!221316 m!246189))

(declare-fun m!246191 () Bool)

(assert (=> b!221305 m!246191))

(declare-fun m!246193 () Bool)

(assert (=> b!221304 m!246193))

(declare-fun m!246195 () Bool)

(assert (=> b!221302 m!246195))

(check-sat (not b!221300) (not b!221311) (not b!221302) (not b!221309) tp_is_empty!5809 (not b!221313) (not b!221305) (not b!221315) (not bm!20660) (not b!221316) (not b_next!5947) (not bm!20661) (not start!21884) (not mapNonEmpty!9883) (not b!221304) b_and!12859)
(check-sat b_and!12859 (not b_next!5947))
