; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21730 () Bool)

(assert start!21730)

(declare-fun b!218523 () Bool)

(declare-fun b_free!5875 () Bool)

(declare-fun b_next!5875 () Bool)

(assert (=> b!218523 (= b_free!5875 (not b_next!5875))))

(declare-fun tp!20759 () Bool)

(declare-fun b_and!12779 () Bool)

(assert (=> b!218523 (= tp!20759 b_and!12779)))

(declare-fun b!218508 () Bool)

(declare-fun e!142136 () Bool)

(declare-fun e!142132 () Bool)

(assert (=> b!218508 (= e!142136 e!142132)))

(declare-fun res!107139 () Bool)

(assert (=> b!218508 (=> (not res!107139) (not e!142132))))

(declare-datatypes ((SeekEntryResult!765 0))(
  ( (MissingZero!765 (index!5230 (_ BitVec 32))) (Found!765 (index!5231 (_ BitVec 32))) (Intermediate!765 (undefined!1577 Bool) (index!5232 (_ BitVec 32)) (x!22821 (_ BitVec 32))) (Undefined!765) (MissingVacant!765 (index!5233 (_ BitVec 32))) )
))
(declare-fun lt!111596 () SeekEntryResult!765)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218508 (= res!107139 (or (= lt!111596 (MissingZero!765 index!297)) (= lt!111596 (MissingVacant!765 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7297 0))(
  ( (V!7298 (val!2913 Int)) )
))
(declare-datatypes ((ValueCell!2525 0))(
  ( (ValueCellFull!2525 (v!4932 V!7297)) (EmptyCell!2525) )
))
(declare-datatypes ((array!10711 0))(
  ( (array!10712 (arr!5077 (Array (_ BitVec 32) ValueCell!2525)) (size!5409 (_ BitVec 32))) )
))
(declare-datatypes ((array!10713 0))(
  ( (array!10714 (arr!5078 (Array (_ BitVec 32) (_ BitVec 64))) (size!5410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2950 0))(
  ( (LongMapFixedSize!2951 (defaultEntry!4125 Int) (mask!9902 (_ BitVec 32)) (extraKeys!3862 (_ BitVec 32)) (zeroValue!3966 V!7297) (minValue!3966 V!7297) (_size!1524 (_ BitVec 32)) (_keys!6174 array!10713) (_values!4108 array!10711) (_vacant!1524 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2950)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10713 (_ BitVec 32)) SeekEntryResult!765)

(assert (=> b!218508 (= lt!111596 (seekEntryOrOpen!0 key!932 (_keys!6174 thiss!1504) (mask!9902 thiss!1504)))))

(declare-fun b!218509 () Bool)

(declare-fun e!142134 () Bool)

(declare-fun tp_is_empty!5737 () Bool)

(assert (=> b!218509 (= e!142134 tp_is_empty!5737)))

(declare-fun b!218510 () Bool)

(declare-fun e!142133 () Bool)

(assert (=> b!218510 (= e!142133 tp_is_empty!5737)))

(declare-fun c!36350 () Bool)

(declare-fun call!20376 () Bool)

(declare-fun bm!20372 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20372 (= call!20376 (inRange!0 (ite c!36350 (index!5230 lt!111596) (index!5233 lt!111596)) (mask!9902 thiss!1504)))))

(declare-fun b!218511 () Bool)

(declare-fun e!142131 () Bool)

(declare-fun mapRes!9768 () Bool)

(assert (=> b!218511 (= e!142131 (and e!142133 mapRes!9768))))

(declare-fun condMapEmpty!9768 () Bool)

(declare-fun mapDefault!9768 () ValueCell!2525)

(assert (=> b!218511 (= condMapEmpty!9768 (= (arr!5077 (_values!4108 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2525)) mapDefault!9768)))))

(declare-fun b!218512 () Bool)

(declare-fun e!142137 () Bool)

(get-info :version)

(assert (=> b!218512 (= e!142137 ((_ is Undefined!765) lt!111596))))

(declare-fun b!218513 () Bool)

(assert (=> b!218513 (= e!142132 false)))

(declare-datatypes ((Unit!6494 0))(
  ( (Unit!6495) )
))
(declare-fun lt!111593 () Unit!6494)

(declare-fun e!142139 () Unit!6494)

(assert (=> b!218513 (= lt!111593 e!142139)))

(declare-fun c!36351 () Bool)

(declare-datatypes ((tuple2!4250 0))(
  ( (tuple2!4251 (_1!2136 (_ BitVec 64)) (_2!2136 V!7297)) )
))
(declare-datatypes ((List!3149 0))(
  ( (Nil!3146) (Cons!3145 (h!3792 tuple2!4250) (t!8096 List!3149)) )
))
(declare-datatypes ((ListLongMap!3165 0))(
  ( (ListLongMap!3166 (toList!1598 List!3149)) )
))
(declare-fun contains!1453 (ListLongMap!3165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1130 (array!10713 array!10711 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 32) Int) ListLongMap!3165)

(assert (=> b!218513 (= c!36351 (contains!1453 (getCurrentListMap!1130 (_keys!6174 thiss!1504) (_values!4108 thiss!1504) (mask!9902 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4125 thiss!1504)) key!932))))

(declare-fun res!107136 () Bool)

(assert (=> start!21730 (=> (not res!107136) (not e!142136))))

(declare-fun valid!1207 (LongMapFixedSize!2950) Bool)

(assert (=> start!21730 (= res!107136 (valid!1207 thiss!1504))))

(assert (=> start!21730 e!142136))

(declare-fun e!142135 () Bool)

(assert (=> start!21730 e!142135))

(assert (=> start!21730 true))

(declare-fun mapIsEmpty!9768 () Bool)

(assert (=> mapIsEmpty!9768 mapRes!9768))

(declare-fun mapNonEmpty!9768 () Bool)

(declare-fun tp!20760 () Bool)

(assert (=> mapNonEmpty!9768 (= mapRes!9768 (and tp!20760 e!142134))))

(declare-fun mapKey!9768 () (_ BitVec 32))

(declare-fun mapValue!9768 () ValueCell!2525)

(declare-fun mapRest!9768 () (Array (_ BitVec 32) ValueCell!2525))

(assert (=> mapNonEmpty!9768 (= (arr!5077 (_values!4108 thiss!1504)) (store mapRest!9768 mapKey!9768 mapValue!9768))))

(declare-fun b!218514 () Bool)

(declare-fun res!107133 () Bool)

(assert (=> b!218514 (= res!107133 (= (select (arr!5078 (_keys!6174 thiss!1504)) (index!5233 lt!111596)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142141 () Bool)

(assert (=> b!218514 (=> (not res!107133) (not e!142141))))

(declare-fun b!218515 () Bool)

(declare-fun res!107138 () Bool)

(declare-fun e!142130 () Bool)

(assert (=> b!218515 (=> (not res!107138) (not e!142130))))

(assert (=> b!218515 (= res!107138 (= (select (arr!5078 (_keys!6174 thiss!1504)) (index!5230 lt!111596)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!218516 () Bool)

(declare-fun call!20375 () Bool)

(assert (=> b!218516 (= e!142141 (not call!20375))))

(declare-fun b!218517 () Bool)

(assert (=> b!218517 (= e!142137 e!142141)))

(declare-fun res!107137 () Bool)

(assert (=> b!218517 (= res!107137 call!20376)))

(assert (=> b!218517 (=> (not res!107137) (not e!142141))))

(declare-fun b!218518 () Bool)

(declare-fun res!107135 () Bool)

(assert (=> b!218518 (=> (not res!107135) (not e!142130))))

(assert (=> b!218518 (= res!107135 call!20376)))

(declare-fun e!142138 () Bool)

(assert (=> b!218518 (= e!142138 e!142130)))

(declare-fun b!218519 () Bool)

(declare-fun res!107134 () Bool)

(assert (=> b!218519 (=> (not res!107134) (not e!142136))))

(assert (=> b!218519 (= res!107134 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218520 () Bool)

(declare-fun c!36349 () Bool)

(assert (=> b!218520 (= c!36349 ((_ is MissingVacant!765) lt!111596))))

(assert (=> b!218520 (= e!142138 e!142137)))

(declare-fun bm!20373 () Bool)

(declare-fun arrayContainsKey!0 (array!10713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20373 (= call!20375 (arrayContainsKey!0 (_keys!6174 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218521 () Bool)

(declare-fun Unit!6496 () Unit!6494)

(assert (=> b!218521 (= e!142139 Unit!6496)))

(declare-fun lt!111595 () Unit!6494)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (array!10713 array!10711 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 64) Int) Unit!6494)

(assert (=> b!218521 (= lt!111595 (lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (_keys!6174 thiss!1504) (_values!4108 thiss!1504) (mask!9902 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) key!932 (defaultEntry!4125 thiss!1504)))))

(assert (=> b!218521 false))

(declare-fun b!218522 () Bool)

(assert (=> b!218522 (= e!142130 (not call!20375))))

(declare-fun array_inv!3337 (array!10713) Bool)

(declare-fun array_inv!3338 (array!10711) Bool)

(assert (=> b!218523 (= e!142135 (and tp!20759 tp_is_empty!5737 (array_inv!3337 (_keys!6174 thiss!1504)) (array_inv!3338 (_values!4108 thiss!1504)) e!142131))))

(declare-fun b!218524 () Bool)

(declare-fun lt!111594 () Unit!6494)

(assert (=> b!218524 (= e!142139 lt!111594)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!184 (array!10713 array!10711 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 64) Int) Unit!6494)

(assert (=> b!218524 (= lt!111594 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!184 (_keys!6174 thiss!1504) (_values!4108 thiss!1504) (mask!9902 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) key!932 (defaultEntry!4125 thiss!1504)))))

(assert (=> b!218524 (= c!36350 ((_ is MissingZero!765) lt!111596))))

(assert (=> b!218524 e!142138))

(assert (= (and start!21730 res!107136) b!218519))

(assert (= (and b!218519 res!107134) b!218508))

(assert (= (and b!218508 res!107139) b!218513))

(assert (= (and b!218513 c!36351) b!218521))

(assert (= (and b!218513 (not c!36351)) b!218524))

(assert (= (and b!218524 c!36350) b!218518))

(assert (= (and b!218524 (not c!36350)) b!218520))

(assert (= (and b!218518 res!107135) b!218515))

(assert (= (and b!218515 res!107138) b!218522))

(assert (= (and b!218520 c!36349) b!218517))

(assert (= (and b!218520 (not c!36349)) b!218512))

(assert (= (and b!218517 res!107137) b!218514))

(assert (= (and b!218514 res!107133) b!218516))

(assert (= (or b!218518 b!218517) bm!20372))

(assert (= (or b!218522 b!218516) bm!20373))

(assert (= (and b!218511 condMapEmpty!9768) mapIsEmpty!9768))

(assert (= (and b!218511 (not condMapEmpty!9768)) mapNonEmpty!9768))

(assert (= (and mapNonEmpty!9768 ((_ is ValueCellFull!2525) mapValue!9768)) b!218509))

(assert (= (and b!218511 ((_ is ValueCellFull!2525) mapDefault!9768)) b!218510))

(assert (= b!218523 b!218511))

(assert (= start!21730 b!218523))

(declare-fun m!244551 () Bool)

(assert (=> b!218514 m!244551))

(declare-fun m!244553 () Bool)

(assert (=> b!218524 m!244553))

(declare-fun m!244555 () Bool)

(assert (=> b!218513 m!244555))

(assert (=> b!218513 m!244555))

(declare-fun m!244557 () Bool)

(assert (=> b!218513 m!244557))

(declare-fun m!244559 () Bool)

(assert (=> mapNonEmpty!9768 m!244559))

(declare-fun m!244561 () Bool)

(assert (=> b!218523 m!244561))

(declare-fun m!244563 () Bool)

(assert (=> b!218523 m!244563))

(declare-fun m!244565 () Bool)

(assert (=> bm!20372 m!244565))

(declare-fun m!244567 () Bool)

(assert (=> b!218508 m!244567))

(declare-fun m!244569 () Bool)

(assert (=> start!21730 m!244569))

(declare-fun m!244571 () Bool)

(assert (=> b!218521 m!244571))

(declare-fun m!244573 () Bool)

(assert (=> b!218515 m!244573))

(declare-fun m!244575 () Bool)

(assert (=> bm!20373 m!244575))

(check-sat (not b_next!5875) (not start!21730) (not mapNonEmpty!9768) (not b!218513) (not b!218508) (not bm!20372) (not b!218523) (not b!218521) tp_is_empty!5737 b_and!12779 (not bm!20373) (not b!218524))
(check-sat b_and!12779 (not b_next!5875))
