; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22928 () Bool)

(assert start!22928)

(declare-fun b!239044 () Bool)

(declare-fun b_free!6427 () Bool)

(declare-fun b_next!6427 () Bool)

(assert (=> b!239044 (= b_free!6427 (not b_next!6427))))

(declare-fun tp!22485 () Bool)

(declare-fun b_and!13367 () Bool)

(assert (=> b!239044 (= tp!22485 b_and!13367)))

(declare-fun b!239033 () Bool)

(declare-fun e!155201 () Bool)

(declare-fun e!155192 () Bool)

(assert (=> b!239033 (= e!155201 e!155192)))

(declare-fun res!117124 () Bool)

(assert (=> b!239033 (=> (not res!117124) (not e!155192))))

(declare-datatypes ((SeekEntryResult!1025 0))(
  ( (MissingZero!1025 (index!6270 (_ BitVec 32))) (Found!1025 (index!6271 (_ BitVec 32))) (Intermediate!1025 (undefined!1837 Bool) (index!6272 (_ BitVec 32)) (x!24088 (_ BitVec 32))) (Undefined!1025) (MissingVacant!1025 (index!6273 (_ BitVec 32))) )
))
(declare-fun lt!120559 () SeekEntryResult!1025)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239033 (= res!117124 (or (= lt!120559 (MissingZero!1025 index!297)) (= lt!120559 (MissingVacant!1025 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8033 0))(
  ( (V!8034 (val!3189 Int)) )
))
(declare-datatypes ((ValueCell!2801 0))(
  ( (ValueCellFull!2801 (v!5221 V!8033)) (EmptyCell!2801) )
))
(declare-datatypes ((array!11849 0))(
  ( (array!11850 (arr!5625 (Array (_ BitVec 32) ValueCell!2801)) (size!5967 (_ BitVec 32))) )
))
(declare-datatypes ((array!11851 0))(
  ( (array!11852 (arr!5626 (Array (_ BitVec 32) (_ BitVec 64))) (size!5968 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3502 0))(
  ( (LongMapFixedSize!3503 (defaultEntry!4436 Int) (mask!10479 (_ BitVec 32)) (extraKeys!4173 (_ BitVec 32)) (zeroValue!4277 V!8033) (minValue!4277 V!8033) (_size!1800 (_ BitVec 32)) (_keys!6537 array!11851) (_values!4419 array!11849) (_vacant!1800 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3502)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11851 (_ BitVec 32)) SeekEntryResult!1025)

(assert (=> b!239033 (= lt!120559 (seekEntryOrOpen!0 key!932 (_keys!6537 thiss!1504) (mask!10479 thiss!1504)))))

(declare-fun b!239034 () Bool)

(declare-fun e!155196 () Bool)

(declare-fun call!22217 () Bool)

(assert (=> b!239034 (= e!155196 (not call!22217))))

(declare-fun b!239035 () Bool)

(declare-fun res!117132 () Bool)

(assert (=> b!239035 (=> (not res!117132) (not e!155196))))

(declare-fun call!22218 () Bool)

(assert (=> b!239035 (= res!117132 call!22218)))

(declare-fun e!155193 () Bool)

(assert (=> b!239035 (= e!155193 e!155196)))

(declare-fun b!239036 () Bool)

(declare-datatypes ((Unit!7334 0))(
  ( (Unit!7335) )
))
(declare-fun e!155194 () Unit!7334)

(declare-fun Unit!7336 () Unit!7334)

(assert (=> b!239036 (= e!155194 Unit!7336)))

(declare-fun lt!120558 () Unit!7334)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!332 (array!11851 array!11849 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 64) Int) Unit!7334)

(assert (=> b!239036 (= lt!120558 (lemmaInListMapThenSeekEntryOrOpenFindsIt!332 (_keys!6537 thiss!1504) (_values!4419 thiss!1504) (mask!10479 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) key!932 (defaultEntry!4436 thiss!1504)))))

(assert (=> b!239036 false))

(declare-fun b!239038 () Bool)

(declare-fun e!155199 () Bool)

(declare-fun tp_is_empty!6289 () Bool)

(assert (=> b!239038 (= e!155199 tp_is_empty!6289)))

(declare-fun b!239039 () Bool)

(declare-fun e!155191 () Bool)

(assert (=> b!239039 (= e!155191 (and (= (size!5967 (_values!4419 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10479 thiss!1504))) (= (size!5968 (_keys!6537 thiss!1504)) (size!5967 (_values!4419 thiss!1504))) (bvslt (mask!10479 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!239040 () Bool)

(declare-fun e!155195 () Bool)

(assert (=> b!239040 (= e!155195 tp_is_empty!6289)))

(declare-fun b!239041 () Bool)

(declare-fun e!155197 () Bool)

(declare-fun e!155200 () Bool)

(assert (=> b!239041 (= e!155197 e!155200)))

(declare-fun res!117130 () Bool)

(assert (=> b!239041 (= res!117130 call!22218)))

(assert (=> b!239041 (=> (not res!117130) (not e!155200))))

(declare-fun b!239042 () Bool)

(get-info :version)

(assert (=> b!239042 (= e!155197 ((_ is Undefined!1025) lt!120559))))

(declare-fun b!239043 () Bool)

(declare-fun lt!120557 () Unit!7334)

(assert (=> b!239043 (= e!155194 lt!120557)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!328 (array!11851 array!11849 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 64) Int) Unit!7334)

(assert (=> b!239043 (= lt!120557 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!328 (_keys!6537 thiss!1504) (_values!4419 thiss!1504) (mask!10479 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) key!932 (defaultEntry!4436 thiss!1504)))))

(declare-fun c!39849 () Bool)

(assert (=> b!239043 (= c!39849 ((_ is MissingZero!1025) lt!120559))))

(assert (=> b!239043 e!155193))

(declare-fun e!155198 () Bool)

(declare-fun e!155202 () Bool)

(declare-fun array_inv!3711 (array!11851) Bool)

(declare-fun array_inv!3712 (array!11849) Bool)

(assert (=> b!239044 (= e!155198 (and tp!22485 tp_is_empty!6289 (array_inv!3711 (_keys!6537 thiss!1504)) (array_inv!3712 (_values!4419 thiss!1504)) e!155202))))

(declare-fun b!239045 () Bool)

(declare-fun res!117126 () Bool)

(assert (=> b!239045 (=> (not res!117126) (not e!155196))))

(assert (=> b!239045 (= res!117126 (= (select (arr!5626 (_keys!6537 thiss!1504)) (index!6270 lt!120559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239046 () Bool)

(declare-fun res!117127 () Bool)

(assert (=> b!239046 (=> (not res!117127) (not e!155191))))

(declare-fun arrayContainsKey!0 (array!11851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239046 (= res!117127 (arrayContainsKey!0 (_keys!6537 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10665 () Bool)

(declare-fun mapRes!10665 () Bool)

(assert (=> mapIsEmpty!10665 mapRes!10665))

(declare-fun b!239047 () Bool)

(assert (=> b!239047 (= e!155192 e!155191)))

(declare-fun res!117128 () Bool)

(assert (=> b!239047 (=> (not res!117128) (not e!155191))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239047 (= res!117128 (inRange!0 index!297 (mask!10479 thiss!1504)))))

(declare-fun lt!120560 () Unit!7334)

(assert (=> b!239047 (= lt!120560 e!155194)))

(declare-fun c!39848 () Bool)

(declare-datatypes ((tuple2!4674 0))(
  ( (tuple2!4675 (_1!2348 (_ BitVec 64)) (_2!2348 V!8033)) )
))
(declare-datatypes ((List!3580 0))(
  ( (Nil!3577) (Cons!3576 (h!4232 tuple2!4674) (t!8566 List!3580)) )
))
(declare-datatypes ((ListLongMap!3577 0))(
  ( (ListLongMap!3578 (toList!1804 List!3580)) )
))
(declare-fun contains!1695 (ListLongMap!3577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1313 (array!11851 array!11849 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 32) Int) ListLongMap!3577)

(assert (=> b!239047 (= c!39848 (contains!1695 (getCurrentListMap!1313 (_keys!6537 thiss!1504) (_values!4419 thiss!1504) (mask!10479 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4436 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10665 () Bool)

(declare-fun tp!22484 () Bool)

(assert (=> mapNonEmpty!10665 (= mapRes!10665 (and tp!22484 e!155195))))

(declare-fun mapRest!10665 () (Array (_ BitVec 32) ValueCell!2801))

(declare-fun mapKey!10665 () (_ BitVec 32))

(declare-fun mapValue!10665 () ValueCell!2801)

(assert (=> mapNonEmpty!10665 (= (arr!5625 (_values!4419 thiss!1504)) (store mapRest!10665 mapKey!10665 mapValue!10665))))

(declare-fun bm!22214 () Bool)

(assert (=> bm!22214 (= call!22218 (inRange!0 (ite c!39849 (index!6270 lt!120559) (index!6273 lt!120559)) (mask!10479 thiss!1504)))))

(declare-fun b!239048 () Bool)

(assert (=> b!239048 (= e!155202 (and e!155199 mapRes!10665))))

(declare-fun condMapEmpty!10665 () Bool)

(declare-fun mapDefault!10665 () ValueCell!2801)

(assert (=> b!239048 (= condMapEmpty!10665 (= (arr!5625 (_values!4419 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2801)) mapDefault!10665)))))

(declare-fun b!239049 () Bool)

(assert (=> b!239049 (= e!155200 (not call!22217))))

(declare-fun b!239037 () Bool)

(declare-fun res!117131 () Bool)

(assert (=> b!239037 (=> (not res!117131) (not e!155201))))

(assert (=> b!239037 (= res!117131 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!117129 () Bool)

(assert (=> start!22928 (=> (not res!117129) (not e!155201))))

(declare-fun valid!1388 (LongMapFixedSize!3502) Bool)

(assert (=> start!22928 (= res!117129 (valid!1388 thiss!1504))))

(assert (=> start!22928 e!155201))

(assert (=> start!22928 e!155198))

(assert (=> start!22928 true))

(declare-fun bm!22215 () Bool)

(assert (=> bm!22215 (= call!22217 (arrayContainsKey!0 (_keys!6537 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239050 () Bool)

(declare-fun c!39847 () Bool)

(assert (=> b!239050 (= c!39847 ((_ is MissingVacant!1025) lt!120559))))

(assert (=> b!239050 (= e!155193 e!155197)))

(declare-fun b!239051 () Bool)

(declare-fun res!117125 () Bool)

(assert (=> b!239051 (= res!117125 (= (select (arr!5626 (_keys!6537 thiss!1504)) (index!6273 lt!120559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239051 (=> (not res!117125) (not e!155200))))

(declare-fun b!239052 () Bool)

(declare-fun res!117123 () Bool)

(assert (=> b!239052 (=> (not res!117123) (not e!155191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239052 (= res!117123 (validMask!0 (mask!10479 thiss!1504)))))

(assert (= (and start!22928 res!117129) b!239037))

(assert (= (and b!239037 res!117131) b!239033))

(assert (= (and b!239033 res!117124) b!239047))

(assert (= (and b!239047 c!39848) b!239036))

(assert (= (and b!239047 (not c!39848)) b!239043))

(assert (= (and b!239043 c!39849) b!239035))

(assert (= (and b!239043 (not c!39849)) b!239050))

(assert (= (and b!239035 res!117132) b!239045))

(assert (= (and b!239045 res!117126) b!239034))

(assert (= (and b!239050 c!39847) b!239041))

(assert (= (and b!239050 (not c!39847)) b!239042))

(assert (= (and b!239041 res!117130) b!239051))

(assert (= (and b!239051 res!117125) b!239049))

(assert (= (or b!239035 b!239041) bm!22214))

(assert (= (or b!239034 b!239049) bm!22215))

(assert (= (and b!239047 res!117128) b!239046))

(assert (= (and b!239046 res!117127) b!239052))

(assert (= (and b!239052 res!117123) b!239039))

(assert (= (and b!239048 condMapEmpty!10665) mapIsEmpty!10665))

(assert (= (and b!239048 (not condMapEmpty!10665)) mapNonEmpty!10665))

(assert (= (and mapNonEmpty!10665 ((_ is ValueCellFull!2801) mapValue!10665)) b!239040))

(assert (= (and b!239048 ((_ is ValueCellFull!2801) mapDefault!10665)) b!239038))

(assert (= b!239044 b!239048))

(assert (= start!22928 b!239044))

(declare-fun m!258763 () Bool)

(assert (=> b!239052 m!258763))

(declare-fun m!258765 () Bool)

(assert (=> bm!22215 m!258765))

(assert (=> b!239046 m!258765))

(declare-fun m!258767 () Bool)

(assert (=> b!239044 m!258767))

(declare-fun m!258769 () Bool)

(assert (=> b!239044 m!258769))

(declare-fun m!258771 () Bool)

(assert (=> b!239045 m!258771))

(declare-fun m!258773 () Bool)

(assert (=> mapNonEmpty!10665 m!258773))

(declare-fun m!258775 () Bool)

(assert (=> b!239051 m!258775))

(declare-fun m!258777 () Bool)

(assert (=> bm!22214 m!258777))

(declare-fun m!258779 () Bool)

(assert (=> b!239033 m!258779))

(declare-fun m!258781 () Bool)

(assert (=> b!239036 m!258781))

(declare-fun m!258783 () Bool)

(assert (=> start!22928 m!258783))

(declare-fun m!258785 () Bool)

(assert (=> b!239047 m!258785))

(declare-fun m!258787 () Bool)

(assert (=> b!239047 m!258787))

(assert (=> b!239047 m!258787))

(declare-fun m!258789 () Bool)

(assert (=> b!239047 m!258789))

(declare-fun m!258791 () Bool)

(assert (=> b!239043 m!258791))

(check-sat (not b!239033) (not b!239043) b_and!13367 (not b!239047) (not b!239044) (not b!239036) (not b_next!6427) (not b!239052) tp_is_empty!6289 (not mapNonEmpty!10665) (not bm!22214) (not bm!22215) (not b!239046) (not start!22928))
(check-sat b_and!13367 (not b_next!6427))
