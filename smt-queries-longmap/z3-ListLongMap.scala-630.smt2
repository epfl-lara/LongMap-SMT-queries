; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16130 () Bool)

(assert start!16130)

(declare-fun b!160553 () Bool)

(declare-fun b_free!3591 () Bool)

(declare-fun b_next!3591 () Bool)

(assert (=> b!160553 (= b_free!3591 (not b_next!3591))))

(declare-fun tp!13342 () Bool)

(declare-fun b_and!10005 () Bool)

(assert (=> b!160553 (= tp!13342 b_and!10005)))

(declare-fun b!160551 () Bool)

(declare-fun res!76037 () Bool)

(declare-fun e!104966 () Bool)

(assert (=> b!160551 (=> (not res!76037) (not e!104966))))

(declare-datatypes ((V!4171 0))(
  ( (V!4172 (val!1741 Int)) )
))
(declare-datatypes ((ValueCell!1353 0))(
  ( (ValueCellFull!1353 (v!3606 V!4171)) (EmptyCell!1353) )
))
(declare-datatypes ((array!5865 0))(
  ( (array!5866 (arr!2777 (Array (_ BitVec 32) (_ BitVec 64))) (size!3061 (_ BitVec 32))) )
))
(declare-datatypes ((array!5867 0))(
  ( (array!5868 (arr!2778 (Array (_ BitVec 32) ValueCell!1353)) (size!3062 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1614 0))(
  ( (LongMapFixedSize!1615 (defaultEntry!3249 Int) (mask!7821 (_ BitVec 32)) (extraKeys!2990 (_ BitVec 32)) (zeroValue!3092 V!4171) (minValue!3092 V!4171) (_size!856 (_ BitVec 32)) (_keys!5050 array!5865) (_values!3232 array!5867) (_vacant!856 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1614)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160551 (= res!76037 (validMask!0 (mask!7821 thiss!1248)))))

(declare-fun b!160552 () Bool)

(declare-fun res!76040 () Bool)

(assert (=> b!160552 (=> (not res!76040) (not e!104966))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2926 0))(
  ( (tuple2!2927 (_1!1474 (_ BitVec 64)) (_2!1474 V!4171)) )
))
(declare-datatypes ((List!1948 0))(
  ( (Nil!1945) (Cons!1944 (h!2557 tuple2!2926) (t!6750 List!1948)) )
))
(declare-datatypes ((ListLongMap!1913 0))(
  ( (ListLongMap!1914 (toList!972 List!1948)) )
))
(declare-fun contains!1008 (ListLongMap!1913 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!636 (array!5865 array!5867 (_ BitVec 32) (_ BitVec 32) V!4171 V!4171 (_ BitVec 32) Int) ListLongMap!1913)

(assert (=> b!160552 (= res!76040 (not (contains!1008 (getCurrentListMap!636 (_keys!5050 thiss!1248) (_values!3232 thiss!1248) (mask!7821 thiss!1248) (extraKeys!2990 thiss!1248) (zeroValue!3092 thiss!1248) (minValue!3092 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3249 thiss!1248)) key!828)))))

(declare-fun e!104965 () Bool)

(declare-fun tp_is_empty!3393 () Bool)

(declare-fun e!104967 () Bool)

(declare-fun array_inv!1773 (array!5865) Bool)

(declare-fun array_inv!1774 (array!5867) Bool)

(assert (=> b!160553 (= e!104967 (and tp!13342 tp_is_empty!3393 (array_inv!1773 (_keys!5050 thiss!1248)) (array_inv!1774 (_values!3232 thiss!1248)) e!104965))))

(declare-fun mapIsEmpty!5777 () Bool)

(declare-fun mapRes!5777 () Bool)

(assert (=> mapIsEmpty!5777 mapRes!5777))

(declare-fun b!160555 () Bool)

(assert (=> b!160555 (= e!104966 false)))

(declare-fun lt!82099 () Bool)

(declare-datatypes ((List!1949 0))(
  ( (Nil!1946) (Cons!1945 (h!2558 (_ BitVec 64)) (t!6751 List!1949)) )
))
(declare-fun arrayNoDuplicates!0 (array!5865 (_ BitVec 32) List!1949) Bool)

(assert (=> b!160555 (= lt!82099 (arrayNoDuplicates!0 (_keys!5050 thiss!1248) #b00000000000000000000000000000000 Nil!1946))))

(declare-fun b!160556 () Bool)

(declare-fun e!104969 () Bool)

(assert (=> b!160556 (= e!104969 tp_is_empty!3393)))

(declare-fun b!160557 () Bool)

(declare-fun res!76041 () Bool)

(assert (=> b!160557 (=> (not res!76041) (not e!104966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5865 (_ BitVec 32)) Bool)

(assert (=> b!160557 (= res!76041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5050 thiss!1248) (mask!7821 thiss!1248)))))

(declare-fun b!160558 () Bool)

(declare-fun res!76043 () Bool)

(assert (=> b!160558 (=> (not res!76043) (not e!104966))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!335 0))(
  ( (MissingZero!335 (index!3508 (_ BitVec 32))) (Found!335 (index!3509 (_ BitVec 32))) (Intermediate!335 (undefined!1147 Bool) (index!3510 (_ BitVec 32)) (x!17719 (_ BitVec 32))) (Undefined!335) (MissingVacant!335 (index!3511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5865 (_ BitVec 32)) SeekEntryResult!335)

(assert (=> b!160558 (= res!76043 ((_ is Undefined!335) (seekEntryOrOpen!0 key!828 (_keys!5050 thiss!1248) (mask!7821 thiss!1248))))))

(declare-fun mapNonEmpty!5777 () Bool)

(declare-fun tp!13343 () Bool)

(declare-fun e!104970 () Bool)

(assert (=> mapNonEmpty!5777 (= mapRes!5777 (and tp!13343 e!104970))))

(declare-fun mapRest!5777 () (Array (_ BitVec 32) ValueCell!1353))

(declare-fun mapKey!5777 () (_ BitVec 32))

(declare-fun mapValue!5777 () ValueCell!1353)

(assert (=> mapNonEmpty!5777 (= (arr!2778 (_values!3232 thiss!1248)) (store mapRest!5777 mapKey!5777 mapValue!5777))))

(declare-fun b!160559 () Bool)

(declare-fun res!76039 () Bool)

(assert (=> b!160559 (=> (not res!76039) (not e!104966))))

(assert (=> b!160559 (= res!76039 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160560 () Bool)

(declare-fun res!76038 () Bool)

(assert (=> b!160560 (=> (not res!76038) (not e!104966))))

(assert (=> b!160560 (= res!76038 (and (= (size!3062 (_values!3232 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7821 thiss!1248))) (= (size!3061 (_keys!5050 thiss!1248)) (size!3062 (_values!3232 thiss!1248))) (bvsge (mask!7821 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2990 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2990 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160561 () Bool)

(assert (=> b!160561 (= e!104970 tp_is_empty!3393)))

(declare-fun b!160554 () Bool)

(assert (=> b!160554 (= e!104965 (and e!104969 mapRes!5777))))

(declare-fun condMapEmpty!5777 () Bool)

(declare-fun mapDefault!5777 () ValueCell!1353)

(assert (=> b!160554 (= condMapEmpty!5777 (= (arr!2778 (_values!3232 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1353)) mapDefault!5777)))))

(declare-fun res!76042 () Bool)

(assert (=> start!16130 (=> (not res!76042) (not e!104966))))

(declare-fun valid!748 (LongMapFixedSize!1614) Bool)

(assert (=> start!16130 (= res!76042 (valid!748 thiss!1248))))

(assert (=> start!16130 e!104966))

(assert (=> start!16130 e!104967))

(assert (=> start!16130 true))

(assert (= (and start!16130 res!76042) b!160559))

(assert (= (and b!160559 res!76039) b!160558))

(assert (= (and b!160558 res!76043) b!160552))

(assert (= (and b!160552 res!76040) b!160551))

(assert (= (and b!160551 res!76037) b!160560))

(assert (= (and b!160560 res!76038) b!160557))

(assert (= (and b!160557 res!76041) b!160555))

(assert (= (and b!160554 condMapEmpty!5777) mapIsEmpty!5777))

(assert (= (and b!160554 (not condMapEmpty!5777)) mapNonEmpty!5777))

(assert (= (and mapNonEmpty!5777 ((_ is ValueCellFull!1353) mapValue!5777)) b!160561))

(assert (= (and b!160554 ((_ is ValueCellFull!1353) mapDefault!5777)) b!160556))

(assert (= b!160553 b!160554))

(assert (= start!16130 b!160553))

(declare-fun m!192377 () Bool)

(assert (=> b!160555 m!192377))

(declare-fun m!192379 () Bool)

(assert (=> start!16130 m!192379))

(declare-fun m!192381 () Bool)

(assert (=> b!160552 m!192381))

(assert (=> b!160552 m!192381))

(declare-fun m!192383 () Bool)

(assert (=> b!160552 m!192383))

(declare-fun m!192385 () Bool)

(assert (=> b!160553 m!192385))

(declare-fun m!192387 () Bool)

(assert (=> b!160553 m!192387))

(declare-fun m!192389 () Bool)

(assert (=> b!160558 m!192389))

(declare-fun m!192391 () Bool)

(assert (=> b!160557 m!192391))

(declare-fun m!192393 () Bool)

(assert (=> b!160551 m!192393))

(declare-fun m!192395 () Bool)

(assert (=> mapNonEmpty!5777 m!192395))

(check-sat (not b_next!3591) (not mapNonEmpty!5777) (not b!160551) (not start!16130) (not b!160558) (not b!160557) (not b!160552) tp_is_empty!3393 (not b!160553) b_and!10005 (not b!160555))
(check-sat b_and!10005 (not b_next!3591))
