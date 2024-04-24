; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23216 () Bool)

(assert start!23216)

(declare-fun b!243563 () Bool)

(declare-fun b_free!6523 () Bool)

(declare-fun b_next!6523 () Bool)

(assert (=> b!243563 (= b_free!6523 (not b_next!6523))))

(declare-fun tp!22792 () Bool)

(declare-fun b_and!13519 () Bool)

(assert (=> b!243563 (= tp!22792 b_and!13519)))

(declare-fun b!243558 () Bool)

(declare-fun c!40664 () Bool)

(declare-datatypes ((SeekEntryResult!1040 0))(
  ( (MissingZero!1040 (index!6330 (_ BitVec 32))) (Found!1040 (index!6331 (_ BitVec 32))) (Intermediate!1040 (undefined!1852 Bool) (index!6332 (_ BitVec 32)) (x!24300 (_ BitVec 32))) (Undefined!1040) (MissingVacant!1040 (index!6333 (_ BitVec 32))) )
))
(declare-fun lt!122276 () SeekEntryResult!1040)

(get-info :version)

(assert (=> b!243558 (= c!40664 ((_ is MissingVacant!1040) lt!122276))))

(declare-fun e!158063 () Bool)

(declare-fun e!158054 () Bool)

(assert (=> b!243558 (= e!158063 e!158054)))

(declare-fun c!40666 () Bool)

(declare-datatypes ((V!8161 0))(
  ( (V!8162 (val!3237 Int)) )
))
(declare-datatypes ((ValueCell!2849 0))(
  ( (ValueCellFull!2849 (v!5285 V!8161)) (EmptyCell!2849) )
))
(declare-datatypes ((array!12059 0))(
  ( (array!12060 (arr!5725 (Array (_ BitVec 32) ValueCell!2849)) (size!6067 (_ BitVec 32))) )
))
(declare-datatypes ((array!12061 0))(
  ( (array!12062 (arr!5726 (Array (_ BitVec 32) (_ BitVec 64))) (size!6068 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3598 0))(
  ( (LongMapFixedSize!3599 (defaultEntry!4512 Int) (mask!10605 (_ BitVec 32)) (extraKeys!4249 (_ BitVec 32)) (zeroValue!4353 V!8161) (minValue!4353 V!8161) (_size!1848 (_ BitVec 32)) (_keys!6623 array!12061) (_values!4495 array!12059) (_vacant!1848 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3598)

(declare-fun bm!22697 () Bool)

(declare-fun call!22700 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22697 (= call!22700 (inRange!0 (ite c!40666 (index!6330 lt!122276) (index!6333 lt!122276)) (mask!10605 thiss!1504)))))

(declare-fun b!243559 () Bool)

(declare-fun e!158069 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3570 0))(
  ( (Nil!3567) (Cons!3566 (h!4223 (_ BitVec 64)) (t!8569 List!3570)) )
))
(declare-fun contains!1736 (List!3570 (_ BitVec 64)) Bool)

(assert (=> b!243559 (= e!158069 (not (contains!1736 Nil!3567 key!932)))))

(declare-fun b!243560 () Bool)

(declare-fun res!119377 () Bool)

(assert (=> b!243560 (= res!119377 (= (select (arr!5726 (_keys!6623 thiss!1504)) (index!6333 lt!122276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158061 () Bool)

(assert (=> b!243560 (=> (not res!119377) (not e!158061))))

(declare-fun b!243561 () Bool)

(declare-fun res!119382 () Bool)

(declare-fun e!158060 () Bool)

(assert (=> b!243561 (=> (not res!119382) (not e!158060))))

(assert (=> b!243561 (= res!119382 call!22700)))

(assert (=> b!243561 (= e!158063 e!158060)))

(declare-fun b!243562 () Bool)

(declare-fun res!119386 () Bool)

(declare-fun e!158068 () Bool)

(assert (=> b!243562 (=> (not res!119386) (not e!158068))))

(assert (=> b!243562 (= res!119386 (not (contains!1736 Nil!3567 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!158062 () Bool)

(declare-fun e!158053 () Bool)

(declare-fun tp_is_empty!6385 () Bool)

(declare-fun array_inv!3765 (array!12061) Bool)

(declare-fun array_inv!3766 (array!12059) Bool)

(assert (=> b!243563 (= e!158053 (and tp!22792 tp_is_empty!6385 (array_inv!3765 (_keys!6623 thiss!1504)) (array_inv!3766 (_values!4495 thiss!1504)) e!158062))))

(declare-fun b!243564 () Bool)

(declare-fun e!158056 () Bool)

(assert (=> b!243564 (= e!158056 tp_is_empty!6385)))

(declare-fun mapNonEmpty!10828 () Bool)

(declare-fun mapRes!10828 () Bool)

(declare-fun tp!22791 () Bool)

(assert (=> mapNonEmpty!10828 (= mapRes!10828 (and tp!22791 e!158056))))

(declare-fun mapValue!10828 () ValueCell!2849)

(declare-fun mapRest!10828 () (Array (_ BitVec 32) ValueCell!2849))

(declare-fun mapKey!10828 () (_ BitVec 32))

(assert (=> mapNonEmpty!10828 (= (arr!5725 (_values!4495 thiss!1504)) (store mapRest!10828 mapKey!10828 mapValue!10828))))

(declare-fun b!243565 () Bool)

(declare-fun res!119388 () Bool)

(declare-fun e!158052 () Bool)

(assert (=> b!243565 (=> (not res!119388) (not e!158052))))

(assert (=> b!243565 (= res!119388 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243566 () Bool)

(declare-fun e!158057 () Bool)

(assert (=> b!243566 (= e!158057 (contains!1736 Nil!3567 key!932))))

(declare-fun bm!22698 () Bool)

(declare-fun call!22701 () Bool)

(declare-fun arrayContainsKey!0 (array!12061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22698 (= call!22701 (arrayContainsKey!0 (_keys!6623 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243567 () Bool)

(assert (=> b!243567 (= e!158054 e!158061)))

(declare-fun res!119379 () Bool)

(assert (=> b!243567 (= res!119379 call!22700)))

(assert (=> b!243567 (=> (not res!119379) (not e!158061))))

(declare-fun b!243568 () Bool)

(declare-fun e!158064 () Bool)

(assert (=> b!243568 (= e!158064 e!158068)))

(declare-fun res!119389 () Bool)

(assert (=> b!243568 (=> (not res!119389) (not e!158068))))

(assert (=> b!243568 (= res!119389 (and (bvslt (size!6068 (_keys!6623 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6068 (_keys!6623 thiss!1504)))))))

(declare-datatypes ((Unit!7493 0))(
  ( (Unit!7494) )
))
(declare-fun lt!122278 () Unit!7493)

(declare-fun e!158066 () Unit!7493)

(assert (=> b!243568 (= lt!122278 e!158066)))

(declare-fun c!40663 () Bool)

(assert (=> b!243568 (= c!40663 (arrayContainsKey!0 (_keys!6623 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243569 () Bool)

(declare-fun Unit!7495 () Unit!7493)

(assert (=> b!243569 (= e!158066 Unit!7495)))

(declare-fun lt!122280 () Unit!7493)

(declare-fun lemmaArrayContainsKeyThenInListMap!177 (array!12061 array!12059 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 64) (_ BitVec 32) Int) Unit!7493)

(assert (=> b!243569 (= lt!122280 (lemmaArrayContainsKeyThenInListMap!177 (_keys!6623 thiss!1504) (_values!4495 thiss!1504) (mask!10605 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4512 thiss!1504)))))

(assert (=> b!243569 false))

(declare-fun b!243570 () Bool)

(declare-fun e!158059 () Bool)

(assert (=> b!243570 (= e!158059 tp_is_empty!6385)))

(declare-fun b!243571 () Bool)

(assert (=> b!243571 (= e!158062 (and e!158059 mapRes!10828))))

(declare-fun condMapEmpty!10828 () Bool)

(declare-fun mapDefault!10828 () ValueCell!2849)

(assert (=> b!243571 (= condMapEmpty!10828 (= (arr!5725 (_values!4495 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2849)) mapDefault!10828)))))

(declare-fun b!243572 () Bool)

(assert (=> b!243572 (= e!158060 (not call!22701))))

(declare-fun b!243573 () Bool)

(declare-fun res!119378 () Bool)

(assert (=> b!243573 (=> (not res!119378) (not e!158068))))

(assert (=> b!243573 (= res!119378 (not (contains!1736 Nil!3567 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243574 () Bool)

(declare-fun Unit!7496 () Unit!7493)

(assert (=> b!243574 (= e!158066 Unit!7496)))

(declare-fun b!243575 () Bool)

(declare-fun e!158065 () Bool)

(assert (=> b!243575 (= e!158065 e!158064)))

(declare-fun res!119387 () Bool)

(assert (=> b!243575 (=> (not res!119387) (not e!158064))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243575 (= res!119387 (inRange!0 index!297 (mask!10605 thiss!1504)))))

(declare-fun lt!122275 () Unit!7493)

(declare-fun e!158058 () Unit!7493)

(assert (=> b!243575 (= lt!122275 e!158058)))

(declare-fun c!40665 () Bool)

(declare-datatypes ((tuple2!4700 0))(
  ( (tuple2!4701 (_1!2361 (_ BitVec 64)) (_2!2361 V!8161)) )
))
(declare-datatypes ((List!3571 0))(
  ( (Nil!3568) (Cons!3567 (h!4224 tuple2!4700) (t!8570 List!3571)) )
))
(declare-datatypes ((ListLongMap!3615 0))(
  ( (ListLongMap!3616 (toList!1823 List!3571)) )
))
(declare-fun contains!1737 (ListLongMap!3615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1355 (array!12061 array!12059 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 32) Int) ListLongMap!3615)

(assert (=> b!243575 (= c!40665 (contains!1737 (getCurrentListMap!1355 (_keys!6623 thiss!1504) (_values!4495 thiss!1504) (mask!10605 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4512 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10828 () Bool)

(assert (=> mapIsEmpty!10828 mapRes!10828))

(declare-fun b!243576 () Bool)

(assert (=> b!243576 (= e!158052 e!158065)))

(declare-fun res!119381 () Bool)

(assert (=> b!243576 (=> (not res!119381) (not e!158065))))

(assert (=> b!243576 (= res!119381 (or (= lt!122276 (MissingZero!1040 index!297)) (= lt!122276 (MissingVacant!1040 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12061 (_ BitVec 32)) SeekEntryResult!1040)

(assert (=> b!243576 (= lt!122276 (seekEntryOrOpen!0 key!932 (_keys!6623 thiss!1504) (mask!10605 thiss!1504)))))

(declare-fun b!243577 () Bool)

(declare-fun e!158067 () Bool)

(assert (=> b!243577 (= e!158067 e!158069)))

(declare-fun res!119384 () Bool)

(assert (=> b!243577 (=> (not res!119384) (not e!158069))))

(assert (=> b!243577 (= res!119384 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!243578 () Bool)

(declare-fun res!119392 () Bool)

(assert (=> b!243578 (=> (not res!119392) (not e!158060))))

(assert (=> b!243578 (= res!119392 (= (select (arr!5726 (_keys!6623 thiss!1504)) (index!6330 lt!122276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243579 () Bool)

(assert (=> b!243579 (= e!158061 (not call!22701))))

(declare-fun b!243580 () Bool)

(assert (=> b!243580 (= e!158054 ((_ is Undefined!1040) lt!122276))))

(declare-fun b!243581 () Bool)

(assert (=> b!243581 (= e!158068 false)))

(declare-fun lt!122279 () Bool)

(declare-fun arrayNoDuplicates!0 (array!12061 (_ BitVec 32) List!3570) Bool)

(assert (=> b!243581 (= lt!122279 (arrayNoDuplicates!0 (_keys!6623 thiss!1504) #b00000000000000000000000000000000 Nil!3567))))

(declare-fun b!243582 () Bool)

(declare-fun res!119391 () Bool)

(assert (=> b!243582 (=> (not res!119391) (not e!158068))))

(assert (=> b!243582 (= res!119391 e!158067)))

(declare-fun res!119385 () Bool)

(assert (=> b!243582 (=> res!119385 e!158067)))

(assert (=> b!243582 (= res!119385 e!158057)))

(declare-fun res!119390 () Bool)

(assert (=> b!243582 (=> (not res!119390) (not e!158057))))

(assert (=> b!243582 (= res!119390 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun res!119380 () Bool)

(assert (=> start!23216 (=> (not res!119380) (not e!158052))))

(declare-fun valid!1424 (LongMapFixedSize!3598) Bool)

(assert (=> start!23216 (= res!119380 (valid!1424 thiss!1504))))

(assert (=> start!23216 e!158052))

(assert (=> start!23216 e!158053))

(assert (=> start!23216 true))

(declare-fun b!243583 () Bool)

(declare-fun Unit!7497 () Unit!7493)

(assert (=> b!243583 (= e!158058 Unit!7497)))

(declare-fun lt!122277 () Unit!7493)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!361 (array!12061 array!12059 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 64) Int) Unit!7493)

(assert (=> b!243583 (= lt!122277 (lemmaInListMapThenSeekEntryOrOpenFindsIt!361 (_keys!6623 thiss!1504) (_values!4495 thiss!1504) (mask!10605 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) key!932 (defaultEntry!4512 thiss!1504)))))

(assert (=> b!243583 false))

(declare-fun b!243584 () Bool)

(declare-fun lt!122274 () Unit!7493)

(assert (=> b!243584 (= e!158058 lt!122274)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!353 (array!12061 array!12059 (_ BitVec 32) (_ BitVec 32) V!8161 V!8161 (_ BitVec 64) Int) Unit!7493)

(assert (=> b!243584 (= lt!122274 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!353 (_keys!6623 thiss!1504) (_values!4495 thiss!1504) (mask!10605 thiss!1504) (extraKeys!4249 thiss!1504) (zeroValue!4353 thiss!1504) (minValue!4353 thiss!1504) key!932 (defaultEntry!4512 thiss!1504)))))

(assert (=> b!243584 (= c!40666 ((_ is MissingZero!1040) lt!122276))))

(assert (=> b!243584 e!158063))

(declare-fun b!243585 () Bool)

(declare-fun res!119383 () Bool)

(assert (=> b!243585 (=> (not res!119383) (not e!158068))))

(declare-fun noDuplicate!96 (List!3570) Bool)

(assert (=> b!243585 (= res!119383 (noDuplicate!96 Nil!3567))))

(assert (= (and start!23216 res!119380) b!243565))

(assert (= (and b!243565 res!119388) b!243576))

(assert (= (and b!243576 res!119381) b!243575))

(assert (= (and b!243575 c!40665) b!243583))

(assert (= (and b!243575 (not c!40665)) b!243584))

(assert (= (and b!243584 c!40666) b!243561))

(assert (= (and b!243584 (not c!40666)) b!243558))

(assert (= (and b!243561 res!119382) b!243578))

(assert (= (and b!243578 res!119392) b!243572))

(assert (= (and b!243558 c!40664) b!243567))

(assert (= (and b!243558 (not c!40664)) b!243580))

(assert (= (and b!243567 res!119379) b!243560))

(assert (= (and b!243560 res!119377) b!243579))

(assert (= (or b!243561 b!243567) bm!22697))

(assert (= (or b!243572 b!243579) bm!22698))

(assert (= (and b!243575 res!119387) b!243568))

(assert (= (and b!243568 c!40663) b!243569))

(assert (= (and b!243568 (not c!40663)) b!243574))

(assert (= (and b!243568 res!119389) b!243585))

(assert (= (and b!243585 res!119383) b!243573))

(assert (= (and b!243573 res!119378) b!243562))

(assert (= (and b!243562 res!119386) b!243582))

(assert (= (and b!243582 res!119390) b!243566))

(assert (= (and b!243582 (not res!119385)) b!243577))

(assert (= (and b!243577 res!119384) b!243559))

(assert (= (and b!243582 res!119391) b!243581))

(assert (= (and b!243571 condMapEmpty!10828) mapIsEmpty!10828))

(assert (= (and b!243571 (not condMapEmpty!10828)) mapNonEmpty!10828))

(assert (= (and mapNonEmpty!10828 ((_ is ValueCellFull!2849) mapValue!10828)) b!243564))

(assert (= (and b!243571 ((_ is ValueCellFull!2849) mapDefault!10828)) b!243570))

(assert (= b!243563 b!243571))

(assert (= start!23216 b!243563))

(declare-fun m!262093 () Bool)

(assert (=> b!243584 m!262093))

(declare-fun m!262095 () Bool)

(assert (=> bm!22697 m!262095))

(declare-fun m!262097 () Bool)

(assert (=> b!243559 m!262097))

(declare-fun m!262099 () Bool)

(assert (=> b!243562 m!262099))

(declare-fun m!262101 () Bool)

(assert (=> b!243573 m!262101))

(declare-fun m!262103 () Bool)

(assert (=> b!243583 m!262103))

(declare-fun m!262105 () Bool)

(assert (=> b!243585 m!262105))

(declare-fun m!262107 () Bool)

(assert (=> b!243568 m!262107))

(declare-fun m!262109 () Bool)

(assert (=> b!243575 m!262109))

(declare-fun m!262111 () Bool)

(assert (=> b!243575 m!262111))

(assert (=> b!243575 m!262111))

(declare-fun m!262113 () Bool)

(assert (=> b!243575 m!262113))

(declare-fun m!262115 () Bool)

(assert (=> b!243576 m!262115))

(declare-fun m!262117 () Bool)

(assert (=> b!243581 m!262117))

(declare-fun m!262119 () Bool)

(assert (=> mapNonEmpty!10828 m!262119))

(declare-fun m!262121 () Bool)

(assert (=> b!243560 m!262121))

(assert (=> b!243566 m!262097))

(assert (=> bm!22698 m!262107))

(declare-fun m!262123 () Bool)

(assert (=> b!243578 m!262123))

(declare-fun m!262125 () Bool)

(assert (=> start!23216 m!262125))

(declare-fun m!262127 () Bool)

(assert (=> b!243563 m!262127))

(declare-fun m!262129 () Bool)

(assert (=> b!243563 m!262129))

(declare-fun m!262131 () Bool)

(assert (=> b!243569 m!262131))

(check-sat (not b!243585) (not start!23216) (not bm!22698) (not b!243563) (not b!243575) (not b!243568) (not b!243581) (not b_next!6523) (not b!243569) (not b!243573) (not mapNonEmpty!10828) b_and!13519 (not b!243583) (not b!243566) tp_is_empty!6385 (not b!243559) (not b!243562) (not b!243576) (not bm!22697) (not b!243584))
(check-sat b_and!13519 (not b_next!6523))
