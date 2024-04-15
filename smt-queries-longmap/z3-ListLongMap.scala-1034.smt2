; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21890 () Bool)

(assert start!21890)

(declare-fun b!221320 () Bool)

(declare-fun b_free!5953 () Bool)

(declare-fun b_next!5953 () Bool)

(assert (=> b!221320 (= b_free!5953 (not b_next!5953))))

(declare-fun tp!21000 () Bool)

(declare-fun b_and!12825 () Bool)

(assert (=> b!221320 (= tp!21000 b_and!12825)))

(declare-fun b!221299 () Bool)

(declare-fun res!108552 () Bool)

(declare-fun e!143820 () Bool)

(assert (=> b!221299 (=> (not res!108552) (not e!143820))))

(declare-datatypes ((V!7401 0))(
  ( (V!7402 (val!2952 Int)) )
))
(declare-datatypes ((ValueCell!2564 0))(
  ( (ValueCellFull!2564 (v!4966 V!7401)) (EmptyCell!2564) )
))
(declare-datatypes ((array!10865 0))(
  ( (array!10866 (arr!5151 (Array (_ BitVec 32) ValueCell!2564)) (size!5485 (_ BitVec 32))) )
))
(declare-datatypes ((array!10867 0))(
  ( (array!10868 (arr!5152 (Array (_ BitVec 32) (_ BitVec 64))) (size!5486 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3028 0))(
  ( (LongMapFixedSize!3029 (defaultEntry!4173 Int) (mask!9984 (_ BitVec 32)) (extraKeys!3910 (_ BitVec 32)) (zeroValue!4014 V!7401) (minValue!4014 V!7401) (_size!1563 (_ BitVec 32)) (_keys!6226 array!10867) (_values!4156 array!10865) (_vacant!1563 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3028)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221299 (= res!108552 (validMask!0 (mask!9984 thiss!1504)))))

(declare-fun bm!20666 () Bool)

(declare-datatypes ((SeekEntryResult!820 0))(
  ( (MissingZero!820 (index!5450 (_ BitVec 32))) (Found!820 (index!5451 (_ BitVec 32))) (Intermediate!820 (undefined!1632 Bool) (index!5452 (_ BitVec 32)) (x!23007 (_ BitVec 32))) (Undefined!820) (MissingVacant!820 (index!5453 (_ BitVec 32))) )
))
(declare-fun lt!112231 () SeekEntryResult!820)

(declare-fun call!20669 () Bool)

(declare-fun c!36796 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20666 (= call!20669 (inRange!0 (ite c!36796 (index!5450 lt!112231) (index!5453 lt!112231)) (mask!9984 thiss!1504)))))

(declare-fun b!221300 () Bool)

(declare-fun e!143832 () Bool)

(declare-fun call!20670 () Bool)

(assert (=> b!221300 (= e!143832 (not call!20670))))

(declare-fun b!221301 () Bool)

(declare-fun res!108548 () Bool)

(assert (=> b!221301 (=> (not res!108548) (not e!143820))))

(assert (=> b!221301 (= res!108548 (and (= (size!5485 (_values!4156 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9984 thiss!1504))) (= (size!5486 (_keys!6226 thiss!1504)) (size!5485 (_values!4156 thiss!1504))) (bvsge (mask!9984 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3910 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3910 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221302 () Bool)

(assert (=> b!221302 (= e!143820 false)))

(declare-fun lt!112229 () Bool)

(declare-datatypes ((List!3263 0))(
  ( (Nil!3260) (Cons!3259 (h!3907 (_ BitVec 64)) (t!8213 List!3263)) )
))
(declare-fun arrayNoDuplicates!0 (array!10867 (_ BitVec 32) List!3263) Bool)

(assert (=> b!221302 (= lt!112229 (arrayNoDuplicates!0 (_keys!6226 thiss!1504) #b00000000000000000000000000000000 Nil!3260))))

(declare-fun bm!20667 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20667 (= call!20670 (arrayContainsKey!0 (_keys!6226 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221303 () Bool)

(declare-fun e!143822 () Bool)

(declare-fun e!143823 () Bool)

(assert (=> b!221303 (= e!143822 e!143823)))

(declare-fun res!108546 () Bool)

(assert (=> b!221303 (=> (not res!108546) (not e!143823))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221303 (= res!108546 (or (= lt!112231 (MissingZero!820 index!297)) (= lt!112231 (MissingVacant!820 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10867 (_ BitVec 32)) SeekEntryResult!820)

(assert (=> b!221303 (= lt!112231 (seekEntryOrOpen!0 key!932 (_keys!6226 thiss!1504) (mask!9984 thiss!1504)))))

(declare-fun b!221304 () Bool)

(declare-fun e!143826 () Bool)

(assert (=> b!221304 (= e!143826 (not call!20670))))

(declare-fun b!221306 () Bool)

(assert (=> b!221306 (= e!143823 e!143820)))

(declare-fun res!108550 () Bool)

(assert (=> b!221306 (=> (not res!108550) (not e!143820))))

(assert (=> b!221306 (= res!108550 (inRange!0 index!297 (mask!9984 thiss!1504)))))

(declare-datatypes ((Unit!6563 0))(
  ( (Unit!6564) )
))
(declare-fun lt!112230 () Unit!6563)

(declare-fun e!143829 () Unit!6563)

(assert (=> b!221306 (= lt!112230 e!143829)))

(declare-fun c!36794 () Bool)

(declare-datatypes ((tuple2!4342 0))(
  ( (tuple2!4343 (_1!2182 (_ BitVec 64)) (_2!2182 V!7401)) )
))
(declare-datatypes ((List!3264 0))(
  ( (Nil!3261) (Cons!3260 (h!3908 tuple2!4342) (t!8214 List!3264)) )
))
(declare-datatypes ((ListLongMap!3245 0))(
  ( (ListLongMap!3246 (toList!1638 List!3264)) )
))
(declare-fun contains!1481 (ListLongMap!3245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1147 (array!10867 array!10865 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 32) Int) ListLongMap!3245)

(assert (=> b!221306 (= c!36794 (contains!1481 (getCurrentListMap!1147 (_keys!6226 thiss!1504) (_values!4156 thiss!1504) (mask!9984 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4173 thiss!1504)) key!932))))

(declare-fun b!221307 () Bool)

(declare-fun e!143831 () Bool)

(declare-fun tp_is_empty!5815 () Bool)

(assert (=> b!221307 (= e!143831 tp_is_empty!5815)))

(declare-fun b!221308 () Bool)

(declare-fun c!36795 () Bool)

(get-info :version)

(assert (=> b!221308 (= c!36795 ((_ is MissingVacant!820) lt!112231))))

(declare-fun e!143830 () Bool)

(declare-fun e!143825 () Bool)

(assert (=> b!221308 (= e!143830 e!143825)))

(declare-fun b!221309 () Bool)

(declare-fun lt!112228 () Unit!6563)

(assert (=> b!221309 (= e!143829 lt!112228)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!209 (array!10867 array!10865 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 64) Int) Unit!6563)

(assert (=> b!221309 (= lt!112228 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!209 (_keys!6226 thiss!1504) (_values!4156 thiss!1504) (mask!9984 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) key!932 (defaultEntry!4173 thiss!1504)))))

(assert (=> b!221309 (= c!36796 ((_ is MissingZero!820) lt!112231))))

(assert (=> b!221309 e!143830))

(declare-fun b!221310 () Bool)

(declare-fun e!143827 () Bool)

(assert (=> b!221310 (= e!143827 tp_is_empty!5815)))

(declare-fun b!221311 () Bool)

(declare-fun res!108551 () Bool)

(assert (=> b!221311 (= res!108551 (= (select (arr!5152 (_keys!6226 thiss!1504)) (index!5453 lt!112231)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221311 (=> (not res!108551) (not e!143826))))

(declare-fun b!221312 () Bool)

(declare-fun res!108549 () Bool)

(assert (=> b!221312 (=> (not res!108549) (not e!143822))))

(assert (=> b!221312 (= res!108549 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221313 () Bool)

(assert (=> b!221313 (= e!143825 e!143826)))

(declare-fun res!108554 () Bool)

(assert (=> b!221313 (= res!108554 call!20669)))

(assert (=> b!221313 (=> (not res!108554) (not e!143826))))

(declare-fun b!221314 () Bool)

(declare-fun e!143824 () Bool)

(declare-fun mapRes!9892 () Bool)

(assert (=> b!221314 (= e!143824 (and e!143827 mapRes!9892))))

(declare-fun condMapEmpty!9892 () Bool)

(declare-fun mapDefault!9892 () ValueCell!2564)

(assert (=> b!221314 (= condMapEmpty!9892 (= (arr!5151 (_values!4156 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2564)) mapDefault!9892)))))

(declare-fun mapIsEmpty!9892 () Bool)

(assert (=> mapIsEmpty!9892 mapRes!9892))

(declare-fun b!221315 () Bool)

(declare-fun res!108553 () Bool)

(assert (=> b!221315 (=> (not res!108553) (not e!143832))))

(assert (=> b!221315 (= res!108553 (= (select (arr!5152 (_keys!6226 thiss!1504)) (index!5450 lt!112231)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221316 () Bool)

(declare-fun res!108543 () Bool)

(assert (=> b!221316 (=> (not res!108543) (not e!143820))))

(assert (=> b!221316 (= res!108543 (arrayContainsKey!0 (_keys!6226 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9892 () Bool)

(declare-fun tp!21001 () Bool)

(assert (=> mapNonEmpty!9892 (= mapRes!9892 (and tp!21001 e!143831))))

(declare-fun mapRest!9892 () (Array (_ BitVec 32) ValueCell!2564))

(declare-fun mapValue!9892 () ValueCell!2564)

(declare-fun mapKey!9892 () (_ BitVec 32))

(assert (=> mapNonEmpty!9892 (= (arr!5151 (_values!4156 thiss!1504)) (store mapRest!9892 mapKey!9892 mapValue!9892))))

(declare-fun b!221317 () Bool)

(declare-fun Unit!6565 () Unit!6563)

(assert (=> b!221317 (= e!143829 Unit!6565)))

(declare-fun lt!112227 () Unit!6563)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!209 (array!10867 array!10865 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 64) Int) Unit!6563)

(assert (=> b!221317 (= lt!112227 (lemmaInListMapThenSeekEntryOrOpenFindsIt!209 (_keys!6226 thiss!1504) (_values!4156 thiss!1504) (mask!9984 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) key!932 (defaultEntry!4173 thiss!1504)))))

(assert (=> b!221317 false))

(declare-fun b!221318 () Bool)

(declare-fun res!108547 () Bool)

(assert (=> b!221318 (=> (not res!108547) (not e!143820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10867 (_ BitVec 32)) Bool)

(assert (=> b!221318 (= res!108547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6226 thiss!1504) (mask!9984 thiss!1504)))))

(declare-fun b!221319 () Bool)

(assert (=> b!221319 (= e!143825 ((_ is Undefined!820) lt!112231))))

(declare-fun e!143828 () Bool)

(declare-fun array_inv!3395 (array!10867) Bool)

(declare-fun array_inv!3396 (array!10865) Bool)

(assert (=> b!221320 (= e!143828 (and tp!21000 tp_is_empty!5815 (array_inv!3395 (_keys!6226 thiss!1504)) (array_inv!3396 (_values!4156 thiss!1504)) e!143824))))

(declare-fun b!221305 () Bool)

(declare-fun res!108544 () Bool)

(assert (=> b!221305 (=> (not res!108544) (not e!143832))))

(assert (=> b!221305 (= res!108544 call!20669)))

(assert (=> b!221305 (= e!143830 e!143832)))

(declare-fun res!108545 () Bool)

(assert (=> start!21890 (=> (not res!108545) (not e!143822))))

(declare-fun valid!1235 (LongMapFixedSize!3028) Bool)

(assert (=> start!21890 (= res!108545 (valid!1235 thiss!1504))))

(assert (=> start!21890 e!143822))

(assert (=> start!21890 e!143828))

(assert (=> start!21890 true))

(assert (= (and start!21890 res!108545) b!221312))

(assert (= (and b!221312 res!108549) b!221303))

(assert (= (and b!221303 res!108546) b!221306))

(assert (= (and b!221306 c!36794) b!221317))

(assert (= (and b!221306 (not c!36794)) b!221309))

(assert (= (and b!221309 c!36796) b!221305))

(assert (= (and b!221309 (not c!36796)) b!221308))

(assert (= (and b!221305 res!108544) b!221315))

(assert (= (and b!221315 res!108553) b!221300))

(assert (= (and b!221308 c!36795) b!221313))

(assert (= (and b!221308 (not c!36795)) b!221319))

(assert (= (and b!221313 res!108554) b!221311))

(assert (= (and b!221311 res!108551) b!221304))

(assert (= (or b!221305 b!221313) bm!20666))

(assert (= (or b!221300 b!221304) bm!20667))

(assert (= (and b!221306 res!108550) b!221316))

(assert (= (and b!221316 res!108543) b!221299))

(assert (= (and b!221299 res!108552) b!221301))

(assert (= (and b!221301 res!108548) b!221318))

(assert (= (and b!221318 res!108547) b!221302))

(assert (= (and b!221314 condMapEmpty!9892) mapIsEmpty!9892))

(assert (= (and b!221314 (not condMapEmpty!9892)) mapNonEmpty!9892))

(assert (= (and mapNonEmpty!9892 ((_ is ValueCellFull!2564) mapValue!9892)) b!221307))

(assert (= (and b!221314 ((_ is ValueCellFull!2564) mapDefault!9892)) b!221310))

(assert (= b!221320 b!221314))

(assert (= start!21890 b!221320))

(declare-fun m!245467 () Bool)

(assert (=> b!221318 m!245467))

(declare-fun m!245469 () Bool)

(assert (=> bm!20667 m!245469))

(declare-fun m!245471 () Bool)

(assert (=> b!221309 m!245471))

(declare-fun m!245473 () Bool)

(assert (=> b!221317 m!245473))

(declare-fun m!245475 () Bool)

(assert (=> b!221299 m!245475))

(declare-fun m!245477 () Bool)

(assert (=> b!221315 m!245477))

(declare-fun m!245479 () Bool)

(assert (=> b!221311 m!245479))

(declare-fun m!245481 () Bool)

(assert (=> mapNonEmpty!9892 m!245481))

(declare-fun m!245483 () Bool)

(assert (=> b!221303 m!245483))

(declare-fun m!245485 () Bool)

(assert (=> start!21890 m!245485))

(assert (=> b!221316 m!245469))

(declare-fun m!245487 () Bool)

(assert (=> b!221320 m!245487))

(declare-fun m!245489 () Bool)

(assert (=> b!221320 m!245489))

(declare-fun m!245491 () Bool)

(assert (=> b!221306 m!245491))

(declare-fun m!245493 () Bool)

(assert (=> b!221306 m!245493))

(assert (=> b!221306 m!245493))

(declare-fun m!245495 () Bool)

(assert (=> b!221306 m!245495))

(declare-fun m!245497 () Bool)

(assert (=> bm!20666 m!245497))

(declare-fun m!245499 () Bool)

(assert (=> b!221302 m!245499))

(check-sat (not bm!20667) (not b!221306) tp_is_empty!5815 (not b!221316) (not start!21890) (not bm!20666) (not b!221320) b_and!12825 (not b!221299) (not b!221318) (not b!221309) (not b!221303) (not b_next!5953) (not b!221302) (not b!221317) (not mapNonEmpty!9892))
(check-sat b_and!12825 (not b_next!5953))
