; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21890 () Bool)

(assert start!21890)

(declare-fun b!221496 () Bool)

(declare-fun b_free!5953 () Bool)

(declare-fun b_next!5953 () Bool)

(assert (=> b!221496 (= b_free!5953 (not b_next!5953))))

(declare-fun tp!21000 () Bool)

(declare-fun b_and!12865 () Bool)

(assert (=> b!221496 (= tp!21000 b_and!12865)))

(declare-fun b!221493 () Bool)

(declare-fun res!108670 () Bool)

(declare-fun e!143947 () Bool)

(assert (=> b!221493 (=> (not res!108670) (not e!143947))))

(declare-datatypes ((V!7401 0))(
  ( (V!7402 (val!2952 Int)) )
))
(declare-datatypes ((ValueCell!2564 0))(
  ( (ValueCellFull!2564 (v!4973 V!7401)) (EmptyCell!2564) )
))
(declare-datatypes ((array!10871 0))(
  ( (array!10872 (arr!5155 (Array (_ BitVec 32) ValueCell!2564)) (size!5488 (_ BitVec 32))) )
))
(declare-datatypes ((array!10873 0))(
  ( (array!10874 (arr!5156 (Array (_ BitVec 32) (_ BitVec 64))) (size!5489 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3028 0))(
  ( (LongMapFixedSize!3029 (defaultEntry!4173 Int) (mask!9985 (_ BitVec 32)) (extraKeys!3910 (_ BitVec 32)) (zeroValue!4014 V!7401) (minValue!4014 V!7401) (_size!1563 (_ BitVec 32)) (_keys!6227 array!10873) (_values!4156 array!10871) (_vacant!1563 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3028)

(assert (=> b!221493 (= res!108670 (and (= (size!5488 (_values!4156 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9985 thiss!1504))) (= (size!5489 (_keys!6227 thiss!1504)) (size!5488 (_values!4156 thiss!1504))) (bvsge (mask!9985 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3910 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3910 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221494 () Bool)

(declare-fun e!143955 () Bool)

(declare-fun e!143949 () Bool)

(assert (=> b!221494 (= e!143955 e!143949)))

(declare-fun res!108668 () Bool)

(declare-fun call!20681 () Bool)

(assert (=> b!221494 (= res!108668 call!20681)))

(assert (=> b!221494 (=> (not res!108668) (not e!143949))))

(declare-fun bm!20678 () Bool)

(declare-fun call!20682 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20678 (= call!20682 (arrayContainsKey!0 (_keys!6227 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221495 () Bool)

(declare-fun res!108660 () Bool)

(declare-datatypes ((SeekEntryResult!799 0))(
  ( (MissingZero!799 (index!5366 (_ BitVec 32))) (Found!799 (index!5367 (_ BitVec 32))) (Intermediate!799 (undefined!1611 Bool) (index!5368 (_ BitVec 32)) (x!22987 (_ BitVec 32))) (Undefined!799) (MissingVacant!799 (index!5369 (_ BitVec 32))) )
))
(declare-fun lt!112471 () SeekEntryResult!799)

(assert (=> b!221495 (= res!108660 (= (select (arr!5156 (_keys!6227 thiss!1504)) (index!5369 lt!112471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!221495 (=> (not res!108660) (not e!143949))))

(declare-fun tp_is_empty!5815 () Bool)

(declare-fun e!143956 () Bool)

(declare-fun e!143953 () Bool)

(declare-fun array_inv!3383 (array!10873) Bool)

(declare-fun array_inv!3384 (array!10871) Bool)

(assert (=> b!221496 (= e!143953 (and tp!21000 tp_is_empty!5815 (array_inv!3383 (_keys!6227 thiss!1504)) (array_inv!3384 (_values!4156 thiss!1504)) e!143956))))

(declare-fun b!221498 () Bool)

(declare-datatypes ((Unit!6584 0))(
  ( (Unit!6585) )
))
(declare-fun e!143957 () Unit!6584)

(declare-fun lt!112470 () Unit!6584)

(assert (=> b!221498 (= e!143957 lt!112470)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!205 (array!10873 array!10871 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 64) Int) Unit!6584)

(assert (=> b!221498 (= lt!112470 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!205 (_keys!6227 thiss!1504) (_values!4156 thiss!1504) (mask!9985 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) key!932 (defaultEntry!4173 thiss!1504)))))

(declare-fun c!36834 () Bool)

(get-info :version)

(assert (=> b!221498 (= c!36834 ((_ is MissingZero!799) lt!112471))))

(declare-fun e!143950 () Bool)

(assert (=> b!221498 e!143950))

(declare-fun b!221499 () Bool)

(assert (=> b!221499 (= e!143955 ((_ is Undefined!799) lt!112471))))

(declare-fun mapIsEmpty!9892 () Bool)

(declare-fun mapRes!9892 () Bool)

(assert (=> mapIsEmpty!9892 mapRes!9892))

(declare-fun b!221500 () Bool)

(declare-fun e!143951 () Bool)

(assert (=> b!221500 (= e!143951 tp_is_empty!5815)))

(declare-fun b!221501 () Bool)

(declare-fun e!143954 () Bool)

(declare-fun e!143948 () Bool)

(assert (=> b!221501 (= e!143954 e!143948)))

(declare-fun res!108662 () Bool)

(assert (=> b!221501 (=> (not res!108662) (not e!143948))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221501 (= res!108662 (or (= lt!112471 (MissingZero!799 index!297)) (= lt!112471 (MissingVacant!799 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10873 (_ BitVec 32)) SeekEntryResult!799)

(assert (=> b!221501 (= lt!112471 (seekEntryOrOpen!0 key!932 (_keys!6227 thiss!1504) (mask!9985 thiss!1504)))))

(declare-fun b!221502 () Bool)

(declare-fun res!108661 () Bool)

(assert (=> b!221502 (=> (not res!108661) (not e!143947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221502 (= res!108661 (validMask!0 (mask!9985 thiss!1504)))))

(declare-fun b!221503 () Bool)

(declare-fun res!108659 () Bool)

(assert (=> b!221503 (=> (not res!108659) (not e!143947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10873 (_ BitVec 32)) Bool)

(assert (=> b!221503 (= res!108659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6227 thiss!1504) (mask!9985 thiss!1504)))))

(declare-fun b!221504 () Bool)

(declare-fun c!36833 () Bool)

(assert (=> b!221504 (= c!36833 ((_ is MissingVacant!799) lt!112471))))

(assert (=> b!221504 (= e!143950 e!143955)))

(declare-fun b!221505 () Bool)

(declare-fun res!108669 () Bool)

(declare-fun e!143945 () Bool)

(assert (=> b!221505 (=> (not res!108669) (not e!143945))))

(assert (=> b!221505 (= res!108669 call!20681)))

(assert (=> b!221505 (= e!143950 e!143945)))

(declare-fun b!221506 () Bool)

(declare-fun Unit!6586 () Unit!6584)

(assert (=> b!221506 (= e!143957 Unit!6586)))

(declare-fun lt!112468 () Unit!6584)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!210 (array!10873 array!10871 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 64) Int) Unit!6584)

(assert (=> b!221506 (= lt!112468 (lemmaInListMapThenSeekEntryOrOpenFindsIt!210 (_keys!6227 thiss!1504) (_values!4156 thiss!1504) (mask!9985 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) key!932 (defaultEntry!4173 thiss!1504)))))

(assert (=> b!221506 false))

(declare-fun b!221507 () Bool)

(declare-fun e!143946 () Bool)

(assert (=> b!221507 (= e!143946 tp_is_empty!5815)))

(declare-fun bm!20679 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20679 (= call!20681 (inRange!0 (ite c!36834 (index!5366 lt!112471) (index!5369 lt!112471)) (mask!9985 thiss!1504)))))

(declare-fun b!221497 () Bool)

(assert (=> b!221497 (= e!143949 (not call!20682))))

(declare-fun res!108665 () Bool)

(assert (=> start!21890 (=> (not res!108665) (not e!143954))))

(declare-fun valid!1230 (LongMapFixedSize!3028) Bool)

(assert (=> start!21890 (= res!108665 (valid!1230 thiss!1504))))

(assert (=> start!21890 e!143954))

(assert (=> start!21890 e!143953))

(assert (=> start!21890 true))

(declare-fun b!221508 () Bool)

(assert (=> b!221508 (= e!143948 e!143947)))

(declare-fun res!108663 () Bool)

(assert (=> b!221508 (=> (not res!108663) (not e!143947))))

(assert (=> b!221508 (= res!108663 (inRange!0 index!297 (mask!9985 thiss!1504)))))

(declare-fun lt!112469 () Unit!6584)

(assert (=> b!221508 (= lt!112469 e!143957)))

(declare-fun c!36835 () Bool)

(declare-datatypes ((tuple2!4296 0))(
  ( (tuple2!4297 (_1!2159 (_ BitVec 64)) (_2!2159 V!7401)) )
))
(declare-datatypes ((List!3190 0))(
  ( (Nil!3187) (Cons!3186 (h!3834 tuple2!4296) (t!8141 List!3190)) )
))
(declare-datatypes ((ListLongMap!3211 0))(
  ( (ListLongMap!3212 (toList!1621 List!3190)) )
))
(declare-fun contains!1478 (ListLongMap!3211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1153 (array!10873 array!10871 (_ BitVec 32) (_ BitVec 32) V!7401 V!7401 (_ BitVec 32) Int) ListLongMap!3211)

(assert (=> b!221508 (= c!36835 (contains!1478 (getCurrentListMap!1153 (_keys!6227 thiss!1504) (_values!4156 thiss!1504) (mask!9985 thiss!1504) (extraKeys!3910 thiss!1504) (zeroValue!4014 thiss!1504) (minValue!4014 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4173 thiss!1504)) key!932))))

(declare-fun b!221509 () Bool)

(assert (=> b!221509 (= e!143956 (and e!143951 mapRes!9892))))

(declare-fun condMapEmpty!9892 () Bool)

(declare-fun mapDefault!9892 () ValueCell!2564)

(assert (=> b!221509 (= condMapEmpty!9892 (= (arr!5155 (_values!4156 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2564)) mapDefault!9892)))))

(declare-fun b!221510 () Bool)

(declare-fun res!108666 () Bool)

(assert (=> b!221510 (=> (not res!108666) (not e!143945))))

(assert (=> b!221510 (= res!108666 (= (select (arr!5156 (_keys!6227 thiss!1504)) (index!5366 lt!112471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9892 () Bool)

(declare-fun tp!21001 () Bool)

(assert (=> mapNonEmpty!9892 (= mapRes!9892 (and tp!21001 e!143946))))

(declare-fun mapRest!9892 () (Array (_ BitVec 32) ValueCell!2564))

(declare-fun mapKey!9892 () (_ BitVec 32))

(declare-fun mapValue!9892 () ValueCell!2564)

(assert (=> mapNonEmpty!9892 (= (arr!5155 (_values!4156 thiss!1504)) (store mapRest!9892 mapKey!9892 mapValue!9892))))

(declare-fun b!221511 () Bool)

(assert (=> b!221511 (= e!143945 (not call!20682))))

(declare-fun b!221512 () Bool)

(declare-fun res!108664 () Bool)

(assert (=> b!221512 (=> (not res!108664) (not e!143947))))

(assert (=> b!221512 (= res!108664 (arrayContainsKey!0 (_keys!6227 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221513 () Bool)

(declare-fun res!108667 () Bool)

(assert (=> b!221513 (=> (not res!108667) (not e!143954))))

(assert (=> b!221513 (= res!108667 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221514 () Bool)

(assert (=> b!221514 (= e!143947 false)))

(declare-fun lt!112467 () Bool)

(declare-datatypes ((List!3191 0))(
  ( (Nil!3188) (Cons!3187 (h!3835 (_ BitVec 64)) (t!8142 List!3191)) )
))
(declare-fun arrayNoDuplicates!0 (array!10873 (_ BitVec 32) List!3191) Bool)

(assert (=> b!221514 (= lt!112467 (arrayNoDuplicates!0 (_keys!6227 thiss!1504) #b00000000000000000000000000000000 Nil!3188))))

(assert (= (and start!21890 res!108665) b!221513))

(assert (= (and b!221513 res!108667) b!221501))

(assert (= (and b!221501 res!108662) b!221508))

(assert (= (and b!221508 c!36835) b!221506))

(assert (= (and b!221508 (not c!36835)) b!221498))

(assert (= (and b!221498 c!36834) b!221505))

(assert (= (and b!221498 (not c!36834)) b!221504))

(assert (= (and b!221505 res!108669) b!221510))

(assert (= (and b!221510 res!108666) b!221511))

(assert (= (and b!221504 c!36833) b!221494))

(assert (= (and b!221504 (not c!36833)) b!221499))

(assert (= (and b!221494 res!108668) b!221495))

(assert (= (and b!221495 res!108660) b!221497))

(assert (= (or b!221505 b!221494) bm!20679))

(assert (= (or b!221511 b!221497) bm!20678))

(assert (= (and b!221508 res!108663) b!221512))

(assert (= (and b!221512 res!108664) b!221502))

(assert (= (and b!221502 res!108661) b!221493))

(assert (= (and b!221493 res!108670) b!221503))

(assert (= (and b!221503 res!108659) b!221514))

(assert (= (and b!221509 condMapEmpty!9892) mapIsEmpty!9892))

(assert (= (and b!221509 (not condMapEmpty!9892)) mapNonEmpty!9892))

(assert (= (and mapNonEmpty!9892 ((_ is ValueCellFull!2564) mapValue!9892)) b!221507))

(assert (= (and b!221509 ((_ is ValueCellFull!2564) mapDefault!9892)) b!221500))

(assert (= b!221496 b!221509))

(assert (= start!21890 b!221496))

(declare-fun m!246265 () Bool)

(assert (=> b!221506 m!246265))

(declare-fun m!246267 () Bool)

(assert (=> b!221496 m!246267))

(declare-fun m!246269 () Bool)

(assert (=> b!221496 m!246269))

(declare-fun m!246271 () Bool)

(assert (=> b!221495 m!246271))

(declare-fun m!246273 () Bool)

(assert (=> b!221501 m!246273))

(declare-fun m!246275 () Bool)

(assert (=> b!221510 m!246275))

(declare-fun m!246277 () Bool)

(assert (=> b!221512 m!246277))

(declare-fun m!246279 () Bool)

(assert (=> bm!20679 m!246279))

(declare-fun m!246281 () Bool)

(assert (=> b!221514 m!246281))

(declare-fun m!246283 () Bool)

(assert (=> mapNonEmpty!9892 m!246283))

(assert (=> bm!20678 m!246277))

(declare-fun m!246285 () Bool)

(assert (=> b!221498 m!246285))

(declare-fun m!246287 () Bool)

(assert (=> start!21890 m!246287))

(declare-fun m!246289 () Bool)

(assert (=> b!221502 m!246289))

(declare-fun m!246291 () Bool)

(assert (=> b!221503 m!246291))

(declare-fun m!246293 () Bool)

(assert (=> b!221508 m!246293))

(declare-fun m!246295 () Bool)

(assert (=> b!221508 m!246295))

(assert (=> b!221508 m!246295))

(declare-fun m!246297 () Bool)

(assert (=> b!221508 m!246297))

(check-sat (not b!221514) (not b!221496) (not b!221502) (not mapNonEmpty!9892) (not b!221498) b_and!12865 (not b!221501) (not b!221506) tp_is_empty!5815 (not b!221508) (not bm!20679) (not b!221503) (not bm!20678) (not b!221512) (not start!21890) (not b_next!5953))
(check-sat b_and!12865 (not b_next!5953))
