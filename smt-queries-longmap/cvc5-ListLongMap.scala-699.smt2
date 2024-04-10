; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16698 () Bool)

(assert start!16698)

(declare-fun b!167375 () Bool)

(declare-fun b_free!4003 () Bool)

(declare-fun b_next!4003 () Bool)

(assert (=> b!167375 (= b_free!4003 (not b_next!4003))))

(declare-fun tp!14609 () Bool)

(declare-fun b_and!10417 () Bool)

(assert (=> b!167375 (= tp!14609 b_and!10417)))

(declare-fun mapNonEmpty!6426 () Bool)

(declare-fun mapRes!6426 () Bool)

(declare-fun tp!14610 () Bool)

(declare-fun e!109912 () Bool)

(assert (=> mapNonEmpty!6426 (= mapRes!6426 (and tp!14610 e!109912))))

(declare-datatypes ((V!4721 0))(
  ( (V!4722 (val!1947 Int)) )
))
(declare-datatypes ((ValueCell!1559 0))(
  ( (ValueCellFull!1559 (v!3812 V!4721)) (EmptyCell!1559) )
))
(declare-fun mapValue!6426 () ValueCell!1559)

(declare-fun mapRest!6426 () (Array (_ BitVec 32) ValueCell!1559))

(declare-fun mapKey!6426 () (_ BitVec 32))

(declare-datatypes ((array!6707 0))(
  ( (array!6708 (arr!3189 (Array (_ BitVec 32) (_ BitVec 64))) (size!3477 (_ BitVec 32))) )
))
(declare-datatypes ((array!6709 0))(
  ( (array!6710 (arr!3190 (Array (_ BitVec 32) ValueCell!1559)) (size!3478 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2026 0))(
  ( (LongMapFixedSize!2027 (defaultEntry!3455 Int) (mask!8202 (_ BitVec 32)) (extraKeys!3196 (_ BitVec 32)) (zeroValue!3298 V!4721) (minValue!3298 V!4721) (_size!1062 (_ BitVec 32)) (_keys!5280 array!6707) (_values!3438 array!6709) (_vacant!1062 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2026)

(assert (=> mapNonEmpty!6426 (= (arr!3190 (_values!3438 thiss!1248)) (store mapRest!6426 mapKey!6426 mapValue!6426))))

(declare-fun b!167370 () Bool)

(declare-fun e!109910 () Bool)

(declare-fun tp_is_empty!3805 () Bool)

(assert (=> b!167370 (= e!109910 tp_is_empty!3805)))

(declare-fun b!167371 () Bool)

(declare-fun e!109919 () Bool)

(declare-fun e!109916 () Bool)

(assert (=> b!167371 (= e!109919 e!109916)))

(declare-fun res!79603 () Bool)

(assert (=> b!167371 (=> (not res!79603) (not e!109916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167371 (= res!79603 (validMask!0 (mask!8202 thiss!1248)))))

(declare-datatypes ((Unit!5123 0))(
  ( (Unit!5124) )
))
(declare-fun lt!83668 () Unit!5123)

(declare-fun e!109913 () Unit!5123)

(assert (=> b!167371 (= lt!83668 e!109913)))

(declare-fun c!30286 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3140 0))(
  ( (tuple2!3141 (_1!1581 (_ BitVec 64)) (_2!1581 V!4721)) )
))
(declare-datatypes ((List!2127 0))(
  ( (Nil!2124) (Cons!2123 (h!2740 tuple2!3140) (t!6929 List!2127)) )
))
(declare-datatypes ((ListLongMap!2095 0))(
  ( (ListLongMap!2096 (toList!1063 List!2127)) )
))
(declare-fun contains!1105 (ListLongMap!2095 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!721 (array!6707 array!6709 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 32) Int) ListLongMap!2095)

(assert (=> b!167371 (= c!30286 (contains!1105 (getCurrentListMap!721 (_keys!5280 thiss!1248) (_values!3438 thiss!1248) (mask!8202 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3455 thiss!1248)) key!828))))

(declare-fun b!167372 () Bool)

(assert (=> b!167372 (= e!109912 tp_is_empty!3805)))

(declare-fun res!79607 () Bool)

(declare-fun e!109911 () Bool)

(assert (=> start!16698 (=> (not res!79607) (not e!109911))))

(declare-fun valid!885 (LongMapFixedSize!2026) Bool)

(assert (=> start!16698 (= res!79607 (valid!885 thiss!1248))))

(assert (=> start!16698 e!109911))

(declare-fun e!109915 () Bool)

(assert (=> start!16698 e!109915))

(assert (=> start!16698 true))

(declare-fun mapIsEmpty!6426 () Bool)

(assert (=> mapIsEmpty!6426 mapRes!6426))

(declare-fun b!167373 () Bool)

(declare-fun res!79606 () Bool)

(assert (=> b!167373 (=> (not res!79606) (not e!109911))))

(assert (=> b!167373 (= res!79606 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167374 () Bool)

(assert (=> b!167374 (= e!109916 false)))

(declare-fun lt!83665 () Bool)

(declare-datatypes ((List!2128 0))(
  ( (Nil!2125) (Cons!2124 (h!2741 (_ BitVec 64)) (t!6930 List!2128)) )
))
(declare-fun arrayNoDuplicates!0 (array!6707 (_ BitVec 32) List!2128) Bool)

(assert (=> b!167374 (= lt!83665 (arrayNoDuplicates!0 (_keys!5280 thiss!1248) #b00000000000000000000000000000000 Nil!2125))))

(declare-fun e!109917 () Bool)

(declare-fun array_inv!2055 (array!6707) Bool)

(declare-fun array_inv!2056 (array!6709) Bool)

(assert (=> b!167375 (= e!109915 (and tp!14609 tp_is_empty!3805 (array_inv!2055 (_keys!5280 thiss!1248)) (array_inv!2056 (_values!3438 thiss!1248)) e!109917))))

(declare-fun b!167376 () Bool)

(declare-fun res!79602 () Bool)

(assert (=> b!167376 (=> (not res!79602) (not e!109916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6707 (_ BitVec 32)) Bool)

(assert (=> b!167376 (= res!79602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5280 thiss!1248) (mask!8202 thiss!1248)))))

(declare-fun b!167377 () Bool)

(declare-fun Unit!5125 () Unit!5123)

(assert (=> b!167377 (= e!109913 Unit!5125)))

(declare-fun lt!83667 () Unit!5123)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!106 (array!6707 array!6709 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 64) Int) Unit!5123)

(assert (=> b!167377 (= lt!83667 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!106 (_keys!5280 thiss!1248) (_values!3438 thiss!1248) (mask!8202 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) key!828 (defaultEntry!3455 thiss!1248)))))

(assert (=> b!167377 false))

(declare-fun b!167378 () Bool)

(assert (=> b!167378 (= e!109911 e!109919)))

(declare-fun res!79608 () Bool)

(assert (=> b!167378 (=> (not res!79608) (not e!109919))))

(declare-datatypes ((SeekEntryResult!478 0))(
  ( (MissingZero!478 (index!4080 (_ BitVec 32))) (Found!478 (index!4081 (_ BitVec 32))) (Intermediate!478 (undefined!1290 Bool) (index!4082 (_ BitVec 32)) (x!18522 (_ BitVec 32))) (Undefined!478) (MissingVacant!478 (index!4083 (_ BitVec 32))) )
))
(declare-fun lt!83666 () SeekEntryResult!478)

(assert (=> b!167378 (= res!79608 (and (not (is-Undefined!478 lt!83666)) (not (is-MissingVacant!478 lt!83666)) (not (is-MissingZero!478 lt!83666)) (is-Found!478 lt!83666)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6707 (_ BitVec 32)) SeekEntryResult!478)

(assert (=> b!167378 (= lt!83666 (seekEntryOrOpen!0 key!828 (_keys!5280 thiss!1248) (mask!8202 thiss!1248)))))

(declare-fun e!109918 () Bool)

(declare-fun b!167379 () Bool)

(assert (=> b!167379 (= e!109918 (= (select (arr!3189 (_keys!5280 thiss!1248)) (index!4081 lt!83666)) key!828))))

(declare-fun b!167380 () Bool)

(declare-fun lt!83664 () Unit!5123)

(assert (=> b!167380 (= e!109913 lt!83664)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!105 (array!6707 array!6709 (_ BitVec 32) (_ BitVec 32) V!4721 V!4721 (_ BitVec 64) Int) Unit!5123)

(assert (=> b!167380 (= lt!83664 (lemmaInListMapThenSeekEntryOrOpenFindsIt!105 (_keys!5280 thiss!1248) (_values!3438 thiss!1248) (mask!8202 thiss!1248) (extraKeys!3196 thiss!1248) (zeroValue!3298 thiss!1248) (minValue!3298 thiss!1248) key!828 (defaultEntry!3455 thiss!1248)))))

(declare-fun res!79605 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167380 (= res!79605 (inRange!0 (index!4081 lt!83666) (mask!8202 thiss!1248)))))

(assert (=> b!167380 (=> (not res!79605) (not e!109918))))

(assert (=> b!167380 e!109918))

(declare-fun b!167381 () Bool)

(assert (=> b!167381 (= e!109917 (and e!109910 mapRes!6426))))

(declare-fun condMapEmpty!6426 () Bool)

(declare-fun mapDefault!6426 () ValueCell!1559)

