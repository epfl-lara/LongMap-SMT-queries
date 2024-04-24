; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16132 () Bool)

(assert start!16132)

(declare-fun b!160572 () Bool)

(declare-fun b_free!3589 () Bool)

(declare-fun b_next!3589 () Bool)

(assert (=> b!160572 (= b_free!3589 (not b_next!3589))))

(declare-fun tp!13336 () Bool)

(declare-fun b_and!10017 () Bool)

(assert (=> b!160572 (= tp!13336 b_and!10017)))

(declare-fun b!160565 () Bool)

(declare-fun res!76043 () Bool)

(declare-fun e!104974 () Bool)

(assert (=> b!160565 (=> (not res!76043) (not e!104974))))

(declare-datatypes ((V!4169 0))(
  ( (V!4170 (val!1740 Int)) )
))
(declare-datatypes ((ValueCell!1352 0))(
  ( (ValueCellFull!1352 (v!3606 V!4169)) (EmptyCell!1352) )
))
(declare-datatypes ((array!5847 0))(
  ( (array!5848 (arr!2768 (Array (_ BitVec 32) (_ BitVec 64))) (size!3052 (_ BitVec 32))) )
))
(declare-datatypes ((array!5849 0))(
  ( (array!5850 (arr!2769 (Array (_ BitVec 32) ValueCell!1352)) (size!3053 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1612 0))(
  ( (LongMapFixedSize!1613 (defaultEntry!3248 Int) (mask!7820 (_ BitVec 32)) (extraKeys!2989 (_ BitVec 32)) (zeroValue!3091 V!4169) (minValue!3091 V!4169) (_size!855 (_ BitVec 32)) (_keys!5049 array!5847) (_values!3231 array!5849) (_vacant!855 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1612)

(assert (=> b!160565 (= res!76043 (and (= (size!3053 (_values!3231 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7820 thiss!1248))) (= (size!3052 (_keys!5049 thiss!1248)) (size!3053 (_values!3231 thiss!1248))) (bvsge (mask!7820 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2989 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2989 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160566 () Bool)

(declare-fun res!76040 () Bool)

(assert (=> b!160566 (=> (not res!76040) (not e!104974))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160566 (= res!76040 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160567 () Bool)

(declare-fun res!76039 () Bool)

(assert (=> b!160567 (=> (not res!76039) (not e!104974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160567 (= res!76039 (validMask!0 (mask!7820 thiss!1248)))))

(declare-fun b!160568 () Bool)

(assert (=> b!160568 (= e!104974 false)))

(declare-fun lt!82155 () Bool)

(declare-datatypes ((List!1936 0))(
  ( (Nil!1933) (Cons!1932 (h!2545 (_ BitVec 64)) (t!6730 List!1936)) )
))
(declare-fun arrayNoDuplicates!0 (array!5847 (_ BitVec 32) List!1936) Bool)

(assert (=> b!160568 (= lt!82155 (arrayNoDuplicates!0 (_keys!5049 thiss!1248) #b00000000000000000000000000000000 Nil!1933))))

(declare-fun b!160569 () Bool)

(declare-fun res!76042 () Bool)

(assert (=> b!160569 (=> (not res!76042) (not e!104974))))

(declare-datatypes ((tuple2!2872 0))(
  ( (tuple2!2873 (_1!1447 (_ BitVec 64)) (_2!1447 V!4169)) )
))
(declare-datatypes ((List!1937 0))(
  ( (Nil!1934) (Cons!1933 (h!2546 tuple2!2872) (t!6731 List!1937)) )
))
(declare-datatypes ((ListLongMap!1871 0))(
  ( (ListLongMap!1872 (toList!951 List!1937)) )
))
(declare-fun contains!997 (ListLongMap!1871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!618 (array!5847 array!5849 (_ BitVec 32) (_ BitVec 32) V!4169 V!4169 (_ BitVec 32) Int) ListLongMap!1871)

(assert (=> b!160569 (= res!76042 (not (contains!997 (getCurrentListMap!618 (_keys!5049 thiss!1248) (_values!3231 thiss!1248) (mask!7820 thiss!1248) (extraKeys!2989 thiss!1248) (zeroValue!3091 thiss!1248) (minValue!3091 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3248 thiss!1248)) key!828)))))

(declare-fun b!160570 () Bool)

(declare-fun res!76041 () Bool)

(assert (=> b!160570 (=> (not res!76041) (not e!104974))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!327 0))(
  ( (MissingZero!327 (index!3476 (_ BitVec 32))) (Found!327 (index!3477 (_ BitVec 32))) (Intermediate!327 (undefined!1139 Bool) (index!3478 (_ BitVec 32)) (x!17711 (_ BitVec 32))) (Undefined!327) (MissingVacant!327 (index!3479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5847 (_ BitVec 32)) SeekEntryResult!327)

(assert (=> b!160570 (= res!76041 ((_ is Undefined!327) (seekEntryOrOpen!0 key!828 (_keys!5049 thiss!1248) (mask!7820 thiss!1248))))))

(declare-fun mapNonEmpty!5774 () Bool)

(declare-fun mapRes!5774 () Bool)

(declare-fun tp!13337 () Bool)

(declare-fun e!104973 () Bool)

(assert (=> mapNonEmpty!5774 (= mapRes!5774 (and tp!13337 e!104973))))

(declare-fun mapValue!5774 () ValueCell!1352)

(declare-fun mapKey!5774 () (_ BitVec 32))

(declare-fun mapRest!5774 () (Array (_ BitVec 32) ValueCell!1352))

(assert (=> mapNonEmpty!5774 (= (arr!2769 (_values!3231 thiss!1248)) (store mapRest!5774 mapKey!5774 mapValue!5774))))

(declare-fun res!76037 () Bool)

(assert (=> start!16132 (=> (not res!76037) (not e!104974))))

(declare-fun valid!766 (LongMapFixedSize!1612) Bool)

(assert (=> start!16132 (= res!76037 (valid!766 thiss!1248))))

(assert (=> start!16132 e!104974))

(declare-fun e!104975 () Bool)

(assert (=> start!16132 e!104975))

(assert (=> start!16132 true))

(declare-fun b!160571 () Bool)

(declare-fun e!104972 () Bool)

(declare-fun e!104976 () Bool)

(assert (=> b!160571 (= e!104972 (and e!104976 mapRes!5774))))

(declare-fun condMapEmpty!5774 () Bool)

(declare-fun mapDefault!5774 () ValueCell!1352)

(assert (=> b!160571 (= condMapEmpty!5774 (= (arr!2769 (_values!3231 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1352)) mapDefault!5774)))))

(declare-fun tp_is_empty!3391 () Bool)

(declare-fun array_inv!1769 (array!5847) Bool)

(declare-fun array_inv!1770 (array!5849) Bool)

(assert (=> b!160572 (= e!104975 (and tp!13336 tp_is_empty!3391 (array_inv!1769 (_keys!5049 thiss!1248)) (array_inv!1770 (_values!3231 thiss!1248)) e!104972))))

(declare-fun b!160573 () Bool)

(declare-fun res!76038 () Bool)

(assert (=> b!160573 (=> (not res!76038) (not e!104974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5847 (_ BitVec 32)) Bool)

(assert (=> b!160573 (= res!76038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5049 thiss!1248) (mask!7820 thiss!1248)))))

(declare-fun mapIsEmpty!5774 () Bool)

(assert (=> mapIsEmpty!5774 mapRes!5774))

(declare-fun b!160574 () Bool)

(assert (=> b!160574 (= e!104976 tp_is_empty!3391)))

(declare-fun b!160575 () Bool)

(assert (=> b!160575 (= e!104973 tp_is_empty!3391)))

(assert (= (and start!16132 res!76037) b!160566))

(assert (= (and b!160566 res!76040) b!160570))

(assert (= (and b!160570 res!76041) b!160569))

(assert (= (and b!160569 res!76042) b!160567))

(assert (= (and b!160567 res!76039) b!160565))

(assert (= (and b!160565 res!76043) b!160573))

(assert (= (and b!160573 res!76038) b!160568))

(assert (= (and b!160571 condMapEmpty!5774) mapIsEmpty!5774))

(assert (= (and b!160571 (not condMapEmpty!5774)) mapNonEmpty!5774))

(assert (= (and mapNonEmpty!5774 ((_ is ValueCellFull!1352) mapValue!5774)) b!160575))

(assert (= (and b!160571 ((_ is ValueCellFull!1352) mapDefault!5774)) b!160574))

(assert (= b!160572 b!160571))

(assert (= start!16132 b!160572))

(declare-fun m!192539 () Bool)

(assert (=> b!160572 m!192539))

(declare-fun m!192541 () Bool)

(assert (=> b!160572 m!192541))

(declare-fun m!192543 () Bool)

(assert (=> b!160569 m!192543))

(assert (=> b!160569 m!192543))

(declare-fun m!192545 () Bool)

(assert (=> b!160569 m!192545))

(declare-fun m!192547 () Bool)

(assert (=> mapNonEmpty!5774 m!192547))

(declare-fun m!192549 () Bool)

(assert (=> start!16132 m!192549))

(declare-fun m!192551 () Bool)

(assert (=> b!160567 m!192551))

(declare-fun m!192553 () Bool)

(assert (=> b!160570 m!192553))

(declare-fun m!192555 () Bool)

(assert (=> b!160568 m!192555))

(declare-fun m!192557 () Bool)

(assert (=> b!160573 m!192557))

(check-sat (not b_next!3589) tp_is_empty!3391 (not b!160569) b_and!10017 (not b!160567) (not b!160570) (not b!160573) (not b!160572) (not b!160568) (not start!16132) (not mapNonEmpty!5774))
(check-sat b_and!10017 (not b_next!3589))
