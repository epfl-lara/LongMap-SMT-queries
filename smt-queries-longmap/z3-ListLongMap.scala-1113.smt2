; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22926 () Bool)

(assert start!22926)

(declare-fun b!239253 () Bool)

(declare-fun b_free!6429 () Bool)

(declare-fun b_next!6429 () Bool)

(assert (=> b!239253 (= b_free!6429 (not b_next!6429))))

(declare-fun tp!22491 () Bool)

(declare-fun b_and!13395 () Bool)

(assert (=> b!239253 (= tp!22491 b_and!13395)))

(declare-fun b!239240 () Bool)

(declare-fun e!155339 () Bool)

(declare-fun e!155341 () Bool)

(assert (=> b!239240 (= e!155339 e!155341)))

(declare-fun res!117248 () Bool)

(assert (=> b!239240 (=> (not res!117248) (not e!155341))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8035 0))(
  ( (V!8036 (val!3190 Int)) )
))
(declare-datatypes ((ValueCell!2802 0))(
  ( (ValueCellFull!2802 (v!5228 V!8035)) (EmptyCell!2802) )
))
(declare-datatypes ((array!11861 0))(
  ( (array!11862 (arr!5632 (Array (_ BitVec 32) ValueCell!2802)) (size!5973 (_ BitVec 32))) )
))
(declare-datatypes ((array!11863 0))(
  ( (array!11864 (arr!5633 (Array (_ BitVec 32) (_ BitVec 64))) (size!5974 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3504 0))(
  ( (LongMapFixedSize!3505 (defaultEntry!4437 Int) (mask!10481 (_ BitVec 32)) (extraKeys!4174 (_ BitVec 32)) (zeroValue!4278 V!8035) (minValue!4278 V!8035) (_size!1801 (_ BitVec 32)) (_keys!6539 array!11863) (_values!4420 array!11861) (_vacant!1801 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3504)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239240 (= res!117248 (inRange!0 index!297 (mask!10481 thiss!1504)))))

(declare-datatypes ((Unit!7344 0))(
  ( (Unit!7345) )
))
(declare-fun lt!120751 () Unit!7344)

(declare-fun e!155333 () Unit!7344)

(assert (=> b!239240 (= lt!120751 e!155333)))

(declare-fun c!39883 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4702 0))(
  ( (tuple2!4703 (_1!2362 (_ BitVec 64)) (_2!2362 V!8035)) )
))
(declare-datatypes ((List!3593 0))(
  ( (Nil!3590) (Cons!3589 (h!4245 tuple2!4702) (t!8588 List!3593)) )
))
(declare-datatypes ((ListLongMap!3615 0))(
  ( (ListLongMap!3616 (toList!1823 List!3593)) )
))
(declare-fun contains!1711 (ListLongMap!3615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1351 (array!11863 array!11861 (_ BitVec 32) (_ BitVec 32) V!8035 V!8035 (_ BitVec 32) Int) ListLongMap!3615)

(assert (=> b!239240 (= c!39883 (contains!1711 (getCurrentListMap!1351 (_keys!6539 thiss!1504) (_values!4420 thiss!1504) (mask!10481 thiss!1504) (extraKeys!4174 thiss!1504) (zeroValue!4278 thiss!1504) (minValue!4278 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4437 thiss!1504)) key!932))))

(declare-fun b!239241 () Bool)

(declare-fun Unit!7346 () Unit!7344)

(assert (=> b!239241 (= e!155333 Unit!7346)))

(declare-fun lt!120752 () Unit!7344)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!324 (array!11863 array!11861 (_ BitVec 32) (_ BitVec 32) V!8035 V!8035 (_ BitVec 64) Int) Unit!7344)

(assert (=> b!239241 (= lt!120752 (lemmaInListMapThenSeekEntryOrOpenFindsIt!324 (_keys!6539 thiss!1504) (_values!4420 thiss!1504) (mask!10481 thiss!1504) (extraKeys!4174 thiss!1504) (zeroValue!4278 thiss!1504) (minValue!4278 thiss!1504) key!932 (defaultEntry!4437 thiss!1504)))))

(assert (=> b!239241 false))

(declare-fun b!239242 () Bool)

(declare-fun res!117250 () Bool)

(declare-datatypes ((SeekEntryResult!1030 0))(
  ( (MissingZero!1030 (index!6290 (_ BitVec 32))) (Found!1030 (index!6291 (_ BitVec 32))) (Intermediate!1030 (undefined!1842 Bool) (index!6292 (_ BitVec 32)) (x!24094 (_ BitVec 32))) (Undefined!1030) (MissingVacant!1030 (index!6293 (_ BitVec 32))) )
))
(declare-fun lt!120753 () SeekEntryResult!1030)

(assert (=> b!239242 (= res!117250 (= (select (arr!5633 (_keys!6539 thiss!1504)) (index!6293 lt!120753)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155335 () Bool)

(assert (=> b!239242 (=> (not res!117250) (not e!155335))))

(declare-fun mapNonEmpty!10668 () Bool)

(declare-fun mapRes!10668 () Bool)

(declare-fun tp!22490 () Bool)

(declare-fun e!155342 () Bool)

(assert (=> mapNonEmpty!10668 (= mapRes!10668 (and tp!22490 e!155342))))

(declare-fun mapValue!10668 () ValueCell!2802)

(declare-fun mapKey!10668 () (_ BitVec 32))

(declare-fun mapRest!10668 () (Array (_ BitVec 32) ValueCell!2802))

(assert (=> mapNonEmpty!10668 (= (arr!5632 (_values!4420 thiss!1504)) (store mapRest!10668 mapKey!10668 mapValue!10668))))

(declare-fun b!239243 () Bool)

(declare-fun e!155338 () Bool)

(declare-fun tp_is_empty!6291 () Bool)

(assert (=> b!239243 (= e!155338 tp_is_empty!6291)))

(declare-fun b!239244 () Bool)

(assert (=> b!239244 (= e!155342 tp_is_empty!6291)))

(declare-fun b!239245 () Bool)

(declare-fun e!155332 () Bool)

(assert (=> b!239245 (= e!155332 (and e!155338 mapRes!10668))))

(declare-fun condMapEmpty!10668 () Bool)

(declare-fun mapDefault!10668 () ValueCell!2802)

(assert (=> b!239245 (= condMapEmpty!10668 (= (arr!5632 (_values!4420 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2802)) mapDefault!10668)))))

(declare-fun b!239246 () Bool)

(assert (=> b!239246 (= e!155341 (and (= (size!5973 (_values!4420 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10481 thiss!1504))) (= (size!5974 (_keys!6539 thiss!1504)) (size!5973 (_values!4420 thiss!1504))) (bvslt (mask!10481 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun c!39884 () Bool)

(declare-fun bm!22244 () Bool)

(declare-fun call!22247 () Bool)

(assert (=> bm!22244 (= call!22247 (inRange!0 (ite c!39884 (index!6290 lt!120753) (index!6293 lt!120753)) (mask!10481 thiss!1504)))))

(declare-fun b!239247 () Bool)

(declare-fun res!117254 () Bool)

(declare-fun e!155334 () Bool)

(assert (=> b!239247 (=> (not res!117254) (not e!155334))))

(assert (=> b!239247 (= res!117254 call!22247)))

(declare-fun e!155331 () Bool)

(assert (=> b!239247 (= e!155331 e!155334)))

(declare-fun b!239248 () Bool)

(declare-fun lt!120750 () Unit!7344)

(assert (=> b!239248 (= e!155333 lt!120750)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!341 (array!11863 array!11861 (_ BitVec 32) (_ BitVec 32) V!8035 V!8035 (_ BitVec 64) Int) Unit!7344)

(assert (=> b!239248 (= lt!120750 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!341 (_keys!6539 thiss!1504) (_values!4420 thiss!1504) (mask!10481 thiss!1504) (extraKeys!4174 thiss!1504) (zeroValue!4278 thiss!1504) (minValue!4278 thiss!1504) key!932 (defaultEntry!4437 thiss!1504)))))

(get-info :version)

(assert (=> b!239248 (= c!39884 ((_ is MissingZero!1030) lt!120753))))

(assert (=> b!239248 e!155331))

(declare-fun res!117255 () Bool)

(declare-fun e!155340 () Bool)

(assert (=> start!22926 (=> (not res!117255) (not e!155340))))

(declare-fun valid!1382 (LongMapFixedSize!3504) Bool)

(assert (=> start!22926 (= res!117255 (valid!1382 thiss!1504))))

(assert (=> start!22926 e!155340))

(declare-fun e!155343 () Bool)

(assert (=> start!22926 e!155343))

(assert (=> start!22926 true))

(declare-fun b!239249 () Bool)

(declare-fun c!39882 () Bool)

(assert (=> b!239249 (= c!39882 ((_ is MissingVacant!1030) lt!120753))))

(declare-fun e!155337 () Bool)

(assert (=> b!239249 (= e!155331 e!155337)))

(declare-fun bm!22245 () Bool)

(declare-fun call!22248 () Bool)

(declare-fun arrayContainsKey!0 (array!11863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22245 (= call!22248 (arrayContainsKey!0 (_keys!6539 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10668 () Bool)

(assert (=> mapIsEmpty!10668 mapRes!10668))

(declare-fun b!239250 () Bool)

(declare-fun res!117249 () Bool)

(assert (=> b!239250 (=> (not res!117249) (not e!155334))))

(assert (=> b!239250 (= res!117249 (= (select (arr!5633 (_keys!6539 thiss!1504)) (index!6290 lt!120753)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239251 () Bool)

(assert (=> b!239251 (= e!155334 (not call!22248))))

(declare-fun b!239252 () Bool)

(declare-fun res!117251 () Bool)

(assert (=> b!239252 (=> (not res!117251) (not e!155341))))

(assert (=> b!239252 (= res!117251 (arrayContainsKey!0 (_keys!6539 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3727 (array!11863) Bool)

(declare-fun array_inv!3728 (array!11861) Bool)

(assert (=> b!239253 (= e!155343 (and tp!22491 tp_is_empty!6291 (array_inv!3727 (_keys!6539 thiss!1504)) (array_inv!3728 (_values!4420 thiss!1504)) e!155332))))

(declare-fun b!239254 () Bool)

(declare-fun res!117253 () Bool)

(assert (=> b!239254 (=> (not res!117253) (not e!155340))))

(assert (=> b!239254 (= res!117253 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239255 () Bool)

(assert (=> b!239255 (= e!155337 e!155335)))

(declare-fun res!117252 () Bool)

(assert (=> b!239255 (= res!117252 call!22247)))

(assert (=> b!239255 (=> (not res!117252) (not e!155335))))

(declare-fun b!239256 () Bool)

(assert (=> b!239256 (= e!155340 e!155339)))

(declare-fun res!117257 () Bool)

(assert (=> b!239256 (=> (not res!117257) (not e!155339))))

(assert (=> b!239256 (= res!117257 (or (= lt!120753 (MissingZero!1030 index!297)) (= lt!120753 (MissingVacant!1030 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11863 (_ BitVec 32)) SeekEntryResult!1030)

(assert (=> b!239256 (= lt!120753 (seekEntryOrOpen!0 key!932 (_keys!6539 thiss!1504) (mask!10481 thiss!1504)))))

(declare-fun b!239257 () Bool)

(assert (=> b!239257 (= e!155335 (not call!22248))))

(declare-fun b!239258 () Bool)

(declare-fun res!117256 () Bool)

(assert (=> b!239258 (=> (not res!117256) (not e!155341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239258 (= res!117256 (validMask!0 (mask!10481 thiss!1504)))))

(declare-fun b!239259 () Bool)

(assert (=> b!239259 (= e!155337 ((_ is Undefined!1030) lt!120753))))

(assert (= (and start!22926 res!117255) b!239254))

(assert (= (and b!239254 res!117253) b!239256))

(assert (= (and b!239256 res!117257) b!239240))

(assert (= (and b!239240 c!39883) b!239241))

(assert (= (and b!239240 (not c!39883)) b!239248))

(assert (= (and b!239248 c!39884) b!239247))

(assert (= (and b!239248 (not c!39884)) b!239249))

(assert (= (and b!239247 res!117254) b!239250))

(assert (= (and b!239250 res!117249) b!239251))

(assert (= (and b!239249 c!39882) b!239255))

(assert (= (and b!239249 (not c!39882)) b!239259))

(assert (= (and b!239255 res!117252) b!239242))

(assert (= (and b!239242 res!117250) b!239257))

(assert (= (or b!239247 b!239255) bm!22244))

(assert (= (or b!239251 b!239257) bm!22245))

(assert (= (and b!239240 res!117248) b!239252))

(assert (= (and b!239252 res!117251) b!239258))

(assert (= (and b!239258 res!117256) b!239246))

(assert (= (and b!239245 condMapEmpty!10668) mapIsEmpty!10668))

(assert (= (and b!239245 (not condMapEmpty!10668)) mapNonEmpty!10668))

(assert (= (and mapNonEmpty!10668 ((_ is ValueCellFull!2802) mapValue!10668)) b!239244))

(assert (= (and b!239245 ((_ is ValueCellFull!2802) mapDefault!10668)) b!239243))

(assert (= b!239253 b!239245))

(assert (= start!22926 b!239253))

(declare-fun m!259409 () Bool)

(assert (=> b!239258 m!259409))

(declare-fun m!259411 () Bool)

(assert (=> b!239250 m!259411))

(declare-fun m!259413 () Bool)

(assert (=> b!239240 m!259413))

(declare-fun m!259415 () Bool)

(assert (=> b!239240 m!259415))

(assert (=> b!239240 m!259415))

(declare-fun m!259417 () Bool)

(assert (=> b!239240 m!259417))

(declare-fun m!259419 () Bool)

(assert (=> bm!22244 m!259419))

(declare-fun m!259421 () Bool)

(assert (=> mapNonEmpty!10668 m!259421))

(declare-fun m!259423 () Bool)

(assert (=> b!239241 m!259423))

(declare-fun m!259425 () Bool)

(assert (=> b!239252 m!259425))

(declare-fun m!259427 () Bool)

(assert (=> b!239248 m!259427))

(declare-fun m!259429 () Bool)

(assert (=> b!239253 m!259429))

(declare-fun m!259431 () Bool)

(assert (=> b!239253 m!259431))

(declare-fun m!259433 () Bool)

(assert (=> b!239242 m!259433))

(declare-fun m!259435 () Bool)

(assert (=> start!22926 m!259435))

(declare-fun m!259437 () Bool)

(assert (=> b!239256 m!259437))

(assert (=> bm!22245 m!259425))

(check-sat (not mapNonEmpty!10668) (not b!239252) b_and!13395 (not b!239241) (not b!239253) (not b!239248) (not start!22926) (not bm!22245) (not b_next!6429) (not bm!22244) (not b!239256) (not b!239240) tp_is_empty!6291 (not b!239258))
(check-sat b_and!13395 (not b_next!6429))
