; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21732 () Bool)

(assert start!21732)

(declare-fun b!218624 () Bool)

(declare-fun b_free!5881 () Bool)

(declare-fun b_next!5881 () Bool)

(assert (=> b!218624 (= b_free!5881 (not b_next!5881))))

(declare-fun tp!20778 () Bool)

(declare-fun b_and!12771 () Bool)

(assert (=> b!218624 (= tp!20778 b_and!12771)))

(declare-fun b!218616 () Bool)

(declare-fun e!142222 () Bool)

(declare-fun tp_is_empty!5743 () Bool)

(assert (=> b!218616 (= e!142222 tp_is_empty!5743)))

(declare-fun b!218617 () Bool)

(declare-fun res!107177 () Bool)

(declare-fun e!142219 () Bool)

(assert (=> b!218617 (=> (not res!107177) (not e!142219))))

(declare-fun call!20405 () Bool)

(assert (=> b!218617 (= res!107177 call!20405)))

(declare-fun e!142226 () Bool)

(assert (=> b!218617 (= e!142226 e!142219)))

(declare-fun b!218618 () Bool)

(declare-fun e!142223 () Bool)

(declare-fun e!142228 () Bool)

(assert (=> b!218618 (= e!142223 e!142228)))

(declare-fun res!107178 () Bool)

(assert (=> b!218618 (= res!107178 call!20405)))

(assert (=> b!218618 (=> (not res!107178) (not e!142228))))

(declare-fun b!218619 () Bool)

(declare-fun e!142220 () Bool)

(assert (=> b!218619 (= e!142220 tp_is_empty!5743)))

(declare-fun b!218620 () Bool)

(declare-fun call!20406 () Bool)

(assert (=> b!218620 (= e!142228 (not call!20406))))

(declare-fun mapIsEmpty!9777 () Bool)

(declare-fun mapRes!9777 () Bool)

(assert (=> mapIsEmpty!9777 mapRes!9777))

(declare-fun b!218621 () Bool)

(assert (=> b!218621 (= e!142219 (not call!20406))))

(declare-fun b!218622 () Bool)

(declare-fun e!142218 () Bool)

(declare-datatypes ((V!7305 0))(
  ( (V!7306 (val!2916 Int)) )
))
(declare-datatypes ((ValueCell!2528 0))(
  ( (ValueCellFull!2528 (v!4934 V!7305)) (EmptyCell!2528) )
))
(declare-datatypes ((array!10725 0))(
  ( (array!10726 (arr!5084 (Array (_ BitVec 32) ValueCell!2528)) (size!5416 (_ BitVec 32))) )
))
(declare-datatypes ((array!10727 0))(
  ( (array!10728 (arr!5085 (Array (_ BitVec 32) (_ BitVec 64))) (size!5417 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2956 0))(
  ( (LongMapFixedSize!2957 (defaultEntry!4128 Int) (mask!9907 (_ BitVec 32)) (extraKeys!3865 (_ BitVec 32)) (zeroValue!3969 V!7305) (minValue!3969 V!7305) (_size!1527 (_ BitVec 32)) (_keys!6177 array!10727) (_values!4111 array!10725) (_vacant!1527 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2956)

(assert (=> b!218622 (= e!142218 (bvsge #b00000000000000000000000000000000 (size!5417 (_keys!6177 thiss!1504))))))

(declare-fun mapNonEmpty!9777 () Bool)

(declare-fun tp!20777 () Bool)

(assert (=> mapNonEmpty!9777 (= mapRes!9777 (and tp!20777 e!142222))))

(declare-fun mapValue!9777 () ValueCell!2528)

(declare-fun mapRest!9777 () (Array (_ BitVec 32) ValueCell!2528))

(declare-fun mapKey!9777 () (_ BitVec 32))

(assert (=> mapNonEmpty!9777 (= (arr!5084 (_values!4111 thiss!1504)) (store mapRest!9777 mapKey!9777 mapValue!9777))))

(declare-fun b!218623 () Bool)

(declare-fun e!142224 () Bool)

(declare-fun e!142221 () Bool)

(assert (=> b!218623 (= e!142224 e!142221)))

(declare-fun res!107180 () Bool)

(assert (=> b!218623 (=> (not res!107180) (not e!142221))))

(declare-datatypes ((SeekEntryResult!791 0))(
  ( (MissingZero!791 (index!5334 (_ BitVec 32))) (Found!791 (index!5335 (_ BitVec 32))) (Intermediate!791 (undefined!1603 Bool) (index!5336 (_ BitVec 32)) (x!22855 (_ BitVec 32))) (Undefined!791) (MissingVacant!791 (index!5337 (_ BitVec 32))) )
))
(declare-fun lt!111571 () SeekEntryResult!791)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218623 (= res!107180 (or (= lt!111571 (MissingZero!791 index!297)) (= lt!111571 (MissingVacant!791 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10727 (_ BitVec 32)) SeekEntryResult!791)

(assert (=> b!218623 (= lt!111571 (seekEntryOrOpen!0 key!932 (_keys!6177 thiss!1504) (mask!9907 thiss!1504)))))

(declare-fun e!142227 () Bool)

(declare-fun e!142217 () Bool)

(declare-fun array_inv!3365 (array!10727) Bool)

(declare-fun array_inv!3366 (array!10725) Bool)

(assert (=> b!218624 (= e!142227 (and tp!20778 tp_is_empty!5743 (array_inv!3365 (_keys!6177 thiss!1504)) (array_inv!3366 (_values!4111 thiss!1504)) e!142217))))

(declare-fun b!218625 () Bool)

(assert (=> b!218625 (= e!142221 e!142218)))

(declare-fun res!107181 () Bool)

(assert (=> b!218625 (=> (not res!107181) (not e!142218))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218625 (= res!107181 (inRange!0 index!297 (mask!9907 thiss!1504)))))

(declare-datatypes ((Unit!6515 0))(
  ( (Unit!6516) )
))
(declare-fun lt!111570 () Unit!6515)

(declare-fun e!142216 () Unit!6515)

(assert (=> b!218625 (= lt!111570 e!142216)))

(declare-fun c!36363 () Bool)

(declare-datatypes ((tuple2!4330 0))(
  ( (tuple2!4331 (_1!2176 (_ BitVec 64)) (_2!2176 V!7305)) )
))
(declare-datatypes ((List!3234 0))(
  ( (Nil!3231) (Cons!3230 (h!3877 tuple2!4330) (t!8189 List!3234)) )
))
(declare-datatypes ((ListLongMap!3243 0))(
  ( (ListLongMap!3244 (toList!1637 List!3234)) )
))
(declare-fun contains!1478 (ListLongMap!3243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1165 (array!10727 array!10725 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 32) Int) ListLongMap!3243)

(assert (=> b!218625 (= c!36363 (contains!1478 (getCurrentListMap!1165 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4128 thiss!1504)) key!932))))

(declare-fun b!218626 () Bool)

(declare-fun res!107184 () Bool)

(assert (=> b!218626 (=> (not res!107184) (not e!142219))))

(assert (=> b!218626 (= res!107184 (= (select (arr!5085 (_keys!6177 thiss!1504)) (index!5334 lt!111571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20403 () Bool)

(declare-fun c!36364 () Bool)

(assert (=> bm!20403 (= call!20405 (inRange!0 (ite c!36364 (index!5334 lt!111571) (index!5337 lt!111571)) (mask!9907 thiss!1504)))))

(declare-fun b!218627 () Bool)

(declare-fun lt!111572 () Unit!6515)

(assert (=> b!218627 (= e!142216 lt!111572)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!201 (array!10727 array!10725 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6515)

(assert (=> b!218627 (= lt!111572 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!201 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> b!218627 (= c!36364 (is-MissingZero!791 lt!111571))))

(assert (=> b!218627 e!142226))

(declare-fun b!218628 () Bool)

(declare-fun Unit!6517 () Unit!6515)

(assert (=> b!218628 (= e!142216 Unit!6517)))

(declare-fun lt!111573 () Unit!6515)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!188 (array!10727 array!10725 (_ BitVec 32) (_ BitVec 32) V!7305 V!7305 (_ BitVec 64) Int) Unit!6515)

(assert (=> b!218628 (= lt!111573 (lemmaInListMapThenSeekEntryOrOpenFindsIt!188 (_keys!6177 thiss!1504) (_values!4111 thiss!1504) (mask!9907 thiss!1504) (extraKeys!3865 thiss!1504) (zeroValue!3969 thiss!1504) (minValue!3969 thiss!1504) key!932 (defaultEntry!4128 thiss!1504)))))

(assert (=> b!218628 false))

(declare-fun b!218629 () Bool)

(declare-fun res!107179 () Bool)

(assert (=> b!218629 (=> (not res!107179) (not e!142224))))

(assert (=> b!218629 (= res!107179 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!107183 () Bool)

(assert (=> start!21732 (=> (not res!107183) (not e!142224))))

(declare-fun valid!1196 (LongMapFixedSize!2956) Bool)

(assert (=> start!21732 (= res!107183 (valid!1196 thiss!1504))))

(assert (=> start!21732 e!142224))

(assert (=> start!21732 e!142227))

(assert (=> start!21732 true))

(declare-fun bm!20402 () Bool)

(declare-fun arrayContainsKey!0 (array!10727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20402 (= call!20406 (arrayContainsKey!0 (_keys!6177 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218630 () Bool)

(declare-fun res!107182 () Bool)

(assert (=> b!218630 (= res!107182 (= (select (arr!5085 (_keys!6177 thiss!1504)) (index!5337 lt!111571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!218630 (=> (not res!107182) (not e!142228))))

(declare-fun b!218631 () Bool)

(assert (=> b!218631 (= e!142217 (and e!142220 mapRes!9777))))

(declare-fun condMapEmpty!9777 () Bool)

(declare-fun mapDefault!9777 () ValueCell!2528)

