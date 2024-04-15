; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22946 () Bool)

(assert start!22946)

(declare-fun b!239590 () Bool)

(declare-fun b_free!6445 () Bool)

(declare-fun b_next!6445 () Bool)

(assert (=> b!239590 (= b_free!6445 (not b_next!6445))))

(declare-fun tp!22539 () Bool)

(declare-fun b_and!13385 () Bool)

(assert (=> b!239590 (= tp!22539 b_and!13385)))

(declare-fun b!239575 () Bool)

(declare-datatypes ((Unit!7355 0))(
  ( (Unit!7356) )
))
(declare-fun e!155552 () Unit!7355)

(declare-fun Unit!7357 () Unit!7355)

(assert (=> b!239575 (= e!155552 Unit!7357)))

(declare-fun lt!120667 () Unit!7355)

(declare-datatypes ((V!8057 0))(
  ( (V!8058 (val!3198 Int)) )
))
(declare-datatypes ((ValueCell!2810 0))(
  ( (ValueCellFull!2810 (v!5230 V!8057)) (EmptyCell!2810) )
))
(declare-datatypes ((array!11885 0))(
  ( (array!11886 (arr!5643 (Array (_ BitVec 32) ValueCell!2810)) (size!5985 (_ BitVec 32))) )
))
(declare-datatypes ((array!11887 0))(
  ( (array!11888 (arr!5644 (Array (_ BitVec 32) (_ BitVec 64))) (size!5986 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3520 0))(
  ( (LongMapFixedSize!3521 (defaultEntry!4445 Int) (mask!10494 (_ BitVec 32)) (extraKeys!4182 (_ BitVec 32)) (zeroValue!4286 V!8057) (minValue!4286 V!8057) (_size!1809 (_ BitVec 32)) (_keys!6546 array!11887) (_values!4428 array!11885) (_vacant!1809 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3520)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!337 (array!11887 array!11885 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 64) Int) Unit!7355)

(assert (=> b!239575 (= lt!120667 (lemmaInListMapThenSeekEntryOrOpenFindsIt!337 (_keys!6546 thiss!1504) (_values!4428 thiss!1504) (mask!10494 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) key!932 (defaultEntry!4445 thiss!1504)))))

(assert (=> b!239575 false))

(declare-fun res!117401 () Bool)

(declare-fun e!155553 () Bool)

(assert (=> start!22946 (=> (not res!117401) (not e!155553))))

(declare-fun valid!1392 (LongMapFixedSize!3520) Bool)

(assert (=> start!22946 (= res!117401 (valid!1392 thiss!1504))))

(assert (=> start!22946 e!155553))

(declare-fun e!155550 () Bool)

(assert (=> start!22946 e!155550))

(assert (=> start!22946 true))

(declare-fun b!239576 () Bool)

(declare-fun c!39929 () Bool)

(declare-datatypes ((SeekEntryResult!1034 0))(
  ( (MissingZero!1034 (index!6306 (_ BitVec 32))) (Found!1034 (index!6307 (_ BitVec 32))) (Intermediate!1034 (undefined!1846 Bool) (index!6308 (_ BitVec 32)) (x!24121 (_ BitVec 32))) (Undefined!1034) (MissingVacant!1034 (index!6309 (_ BitVec 32))) )
))
(declare-fun lt!120666 () SeekEntryResult!1034)

(get-info :version)

(assert (=> b!239576 (= c!39929 ((_ is MissingVacant!1034) lt!120666))))

(declare-fun e!155542 () Bool)

(declare-fun e!155547 () Bool)

(assert (=> b!239576 (= e!155542 e!155547)))

(declare-fun b!239577 () Bool)

(declare-fun e!155554 () Bool)

(assert (=> b!239577 (= e!155547 e!155554)))

(declare-fun res!117402 () Bool)

(declare-fun call!22271 () Bool)

(assert (=> b!239577 (= res!117402 call!22271)))

(assert (=> b!239577 (=> (not res!117402) (not e!155554))))

(declare-fun b!239578 () Bool)

(declare-fun e!155543 () Bool)

(declare-fun tp_is_empty!6307 () Bool)

(assert (=> b!239578 (= e!155543 tp_is_empty!6307)))

(declare-fun b!239579 () Bool)

(declare-fun res!117400 () Bool)

(declare-fun e!155544 () Bool)

(assert (=> b!239579 (=> (not res!117400) (not e!155544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239579 (= res!117400 (validMask!0 (mask!10494 thiss!1504)))))

(declare-fun b!239580 () Bool)

(declare-fun e!155551 () Bool)

(declare-fun call!22272 () Bool)

(assert (=> b!239580 (= e!155551 (not call!22272))))

(declare-fun b!239581 () Bool)

(declare-fun e!155549 () Bool)

(assert (=> b!239581 (= e!155549 e!155544)))

(declare-fun res!117395 () Bool)

(assert (=> b!239581 (=> (not res!117395) (not e!155544))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239581 (= res!117395 (inRange!0 index!297 (mask!10494 thiss!1504)))))

(declare-fun lt!120665 () Unit!7355)

(assert (=> b!239581 (= lt!120665 e!155552)))

(declare-fun c!39928 () Bool)

(declare-datatypes ((tuple2!4684 0))(
  ( (tuple2!4685 (_1!2353 (_ BitVec 64)) (_2!2353 V!8057)) )
))
(declare-datatypes ((List!3585 0))(
  ( (Nil!3582) (Cons!3581 (h!4237 tuple2!4684) (t!8571 List!3585)) )
))
(declare-datatypes ((ListLongMap!3587 0))(
  ( (ListLongMap!3588 (toList!1809 List!3585)) )
))
(declare-fun contains!1700 (ListLongMap!3587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1318 (array!11887 array!11885 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 32) Int) ListLongMap!3587)

(assert (=> b!239581 (= c!39928 (contains!1700 (getCurrentListMap!1318 (_keys!6546 thiss!1504) (_values!4428 thiss!1504) (mask!10494 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4445 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10692 () Bool)

(declare-fun mapRes!10692 () Bool)

(declare-fun tp!22538 () Bool)

(declare-fun e!155545 () Bool)

(assert (=> mapNonEmpty!10692 (= mapRes!10692 (and tp!22538 e!155545))))

(declare-fun mapRest!10692 () (Array (_ BitVec 32) ValueCell!2810))

(declare-fun mapValue!10692 () ValueCell!2810)

(declare-fun mapKey!10692 () (_ BitVec 32))

(assert (=> mapNonEmpty!10692 (= (arr!5643 (_values!4428 thiss!1504)) (store mapRest!10692 mapKey!10692 mapValue!10692))))

(declare-fun b!239582 () Bool)

(assert (=> b!239582 (= e!155554 (not call!22272))))

(declare-fun b!239583 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11887 (_ BitVec 32)) Bool)

(assert (=> b!239583 (= e!155544 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6546 thiss!1504) (mask!10494 thiss!1504))))))

(declare-fun c!39930 () Bool)

(declare-fun bm!22268 () Bool)

(assert (=> bm!22268 (= call!22271 (inRange!0 (ite c!39930 (index!6306 lt!120666) (index!6309 lt!120666)) (mask!10494 thiss!1504)))))

(declare-fun bm!22269 () Bool)

(declare-fun arrayContainsKey!0 (array!11887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22269 (= call!22272 (arrayContainsKey!0 (_keys!6546 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239584 () Bool)

(declare-fun res!117397 () Bool)

(assert (=> b!239584 (=> (not res!117397) (not e!155551))))

(assert (=> b!239584 (= res!117397 (= (select (arr!5644 (_keys!6546 thiss!1504)) (index!6306 lt!120666)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239585 () Bool)

(declare-fun e!155548 () Bool)

(assert (=> b!239585 (= e!155548 (and e!155543 mapRes!10692))))

(declare-fun condMapEmpty!10692 () Bool)

(declare-fun mapDefault!10692 () ValueCell!2810)

(assert (=> b!239585 (= condMapEmpty!10692 (= (arr!5643 (_values!4428 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2810)) mapDefault!10692)))))

(declare-fun b!239586 () Bool)

(assert (=> b!239586 (= e!155547 ((_ is Undefined!1034) lt!120666))))

(declare-fun b!239587 () Bool)

(declare-fun res!117403 () Bool)

(assert (=> b!239587 (=> (not res!117403) (not e!155551))))

(assert (=> b!239587 (= res!117403 call!22271)))

(assert (=> b!239587 (= e!155542 e!155551)))

(declare-fun b!239588 () Bool)

(assert (=> b!239588 (= e!155553 e!155549)))

(declare-fun res!117396 () Bool)

(assert (=> b!239588 (=> (not res!117396) (not e!155549))))

(assert (=> b!239588 (= res!117396 (or (= lt!120666 (MissingZero!1034 index!297)) (= lt!120666 (MissingVacant!1034 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11887 (_ BitVec 32)) SeekEntryResult!1034)

(assert (=> b!239588 (= lt!120666 (seekEntryOrOpen!0 key!932 (_keys!6546 thiss!1504) (mask!10494 thiss!1504)))))

(declare-fun b!239589 () Bool)

(declare-fun res!117398 () Bool)

(assert (=> b!239589 (=> (not res!117398) (not e!155544))))

(assert (=> b!239589 (= res!117398 (and (= (size!5985 (_values!4428 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10494 thiss!1504))) (= (size!5986 (_keys!6546 thiss!1504)) (size!5985 (_values!4428 thiss!1504))) (bvsge (mask!10494 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4182 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4182 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun array_inv!3719 (array!11887) Bool)

(declare-fun array_inv!3720 (array!11885) Bool)

(assert (=> b!239590 (= e!155550 (and tp!22539 tp_is_empty!6307 (array_inv!3719 (_keys!6546 thiss!1504)) (array_inv!3720 (_values!4428 thiss!1504)) e!155548))))

(declare-fun mapIsEmpty!10692 () Bool)

(assert (=> mapIsEmpty!10692 mapRes!10692))

(declare-fun b!239591 () Bool)

(declare-fun res!117404 () Bool)

(assert (=> b!239591 (= res!117404 (= (select (arr!5644 (_keys!6546 thiss!1504)) (index!6309 lt!120666)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239591 (=> (not res!117404) (not e!155554))))

(declare-fun b!239592 () Bool)

(declare-fun res!117405 () Bool)

(assert (=> b!239592 (=> (not res!117405) (not e!155544))))

(assert (=> b!239592 (= res!117405 (arrayContainsKey!0 (_keys!6546 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239593 () Bool)

(declare-fun lt!120668 () Unit!7355)

(assert (=> b!239593 (= e!155552 lt!120668)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!335 (array!11887 array!11885 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 64) Int) Unit!7355)

(assert (=> b!239593 (= lt!120668 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!335 (_keys!6546 thiss!1504) (_values!4428 thiss!1504) (mask!10494 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) key!932 (defaultEntry!4445 thiss!1504)))))

(assert (=> b!239593 (= c!39930 ((_ is MissingZero!1034) lt!120666))))

(assert (=> b!239593 e!155542))

(declare-fun b!239594 () Bool)

(declare-fun res!117399 () Bool)

(assert (=> b!239594 (=> (not res!117399) (not e!155553))))

(assert (=> b!239594 (= res!117399 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239595 () Bool)

(assert (=> b!239595 (= e!155545 tp_is_empty!6307)))

(assert (= (and start!22946 res!117401) b!239594))

(assert (= (and b!239594 res!117399) b!239588))

(assert (= (and b!239588 res!117396) b!239581))

(assert (= (and b!239581 c!39928) b!239575))

(assert (= (and b!239581 (not c!39928)) b!239593))

(assert (= (and b!239593 c!39930) b!239587))

(assert (= (and b!239593 (not c!39930)) b!239576))

(assert (= (and b!239587 res!117403) b!239584))

(assert (= (and b!239584 res!117397) b!239580))

(assert (= (and b!239576 c!39929) b!239577))

(assert (= (and b!239576 (not c!39929)) b!239586))

(assert (= (and b!239577 res!117402) b!239591))

(assert (= (and b!239591 res!117404) b!239582))

(assert (= (or b!239587 b!239577) bm!22268))

(assert (= (or b!239580 b!239582) bm!22269))

(assert (= (and b!239581 res!117395) b!239592))

(assert (= (and b!239592 res!117405) b!239579))

(assert (= (and b!239579 res!117400) b!239589))

(assert (= (and b!239589 res!117398) b!239583))

(assert (= (and b!239585 condMapEmpty!10692) mapIsEmpty!10692))

(assert (= (and b!239585 (not condMapEmpty!10692)) mapNonEmpty!10692))

(assert (= (and mapNonEmpty!10692 ((_ is ValueCellFull!2810) mapValue!10692)) b!239595))

(assert (= (and b!239585 ((_ is ValueCellFull!2810) mapDefault!10692)) b!239578))

(assert (= b!239590 b!239585))

(assert (= start!22946 b!239590))

(declare-fun m!259033 () Bool)

(assert (=> b!239588 m!259033))

(declare-fun m!259035 () Bool)

(assert (=> start!22946 m!259035))

(declare-fun m!259037 () Bool)

(assert (=> b!239581 m!259037))

(declare-fun m!259039 () Bool)

(assert (=> b!239581 m!259039))

(assert (=> b!239581 m!259039))

(declare-fun m!259041 () Bool)

(assert (=> b!239581 m!259041))

(declare-fun m!259043 () Bool)

(assert (=> b!239579 m!259043))

(declare-fun m!259045 () Bool)

(assert (=> b!239590 m!259045))

(declare-fun m!259047 () Bool)

(assert (=> b!239590 m!259047))

(declare-fun m!259049 () Bool)

(assert (=> b!239583 m!259049))

(declare-fun m!259051 () Bool)

(assert (=> b!239593 m!259051))

(declare-fun m!259053 () Bool)

(assert (=> b!239575 m!259053))

(declare-fun m!259055 () Bool)

(assert (=> bm!22269 m!259055))

(declare-fun m!259057 () Bool)

(assert (=> bm!22268 m!259057))

(assert (=> b!239592 m!259055))

(declare-fun m!259059 () Bool)

(assert (=> mapNonEmpty!10692 m!259059))

(declare-fun m!259061 () Bool)

(assert (=> b!239591 m!259061))

(declare-fun m!259063 () Bool)

(assert (=> b!239584 m!259063))

(check-sat (not b!239583) (not bm!22269) (not b!239590) (not b!239579) (not bm!22268) tp_is_empty!6307 (not b_next!6445) (not start!22946) (not b!239575) (not b!239592) (not mapNonEmpty!10692) (not b!239588) (not b!239581) b_and!13385 (not b!239593))
(check-sat b_and!13385 (not b_next!6445))
