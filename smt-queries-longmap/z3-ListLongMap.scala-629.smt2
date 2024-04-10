; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16124 () Bool)

(assert start!16124)

(declare-fun b!160462 () Bool)

(declare-fun b_free!3585 () Bool)

(declare-fun b_next!3585 () Bool)

(assert (=> b!160462 (= b_free!3585 (not b_next!3585))))

(declare-fun tp!13324 () Bool)

(declare-fun b_and!9999 () Bool)

(assert (=> b!160462 (= tp!13324 b_and!9999)))

(declare-fun b!160452 () Bool)

(declare-fun e!104914 () Bool)

(declare-fun tp_is_empty!3387 () Bool)

(assert (=> b!160452 (= e!104914 tp_is_empty!3387)))

(declare-fun b!160453 () Bool)

(declare-fun res!75979 () Bool)

(declare-fun e!104913 () Bool)

(assert (=> b!160453 (=> (not res!75979) (not e!104913))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160453 (= res!75979 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160454 () Bool)

(declare-fun res!75974 () Bool)

(assert (=> b!160454 (=> (not res!75974) (not e!104913))))

(declare-datatypes ((V!4163 0))(
  ( (V!4164 (val!1738 Int)) )
))
(declare-datatypes ((ValueCell!1350 0))(
  ( (ValueCellFull!1350 (v!3603 V!4163)) (EmptyCell!1350) )
))
(declare-datatypes ((array!5853 0))(
  ( (array!5854 (arr!2771 (Array (_ BitVec 32) (_ BitVec 64))) (size!3055 (_ BitVec 32))) )
))
(declare-datatypes ((array!5855 0))(
  ( (array!5856 (arr!2772 (Array (_ BitVec 32) ValueCell!1350)) (size!3056 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1608 0))(
  ( (LongMapFixedSize!1609 (defaultEntry!3246 Int) (mask!7816 (_ BitVec 32)) (extraKeys!2987 (_ BitVec 32)) (zeroValue!3089 V!4163) (minValue!3089 V!4163) (_size!853 (_ BitVec 32)) (_keys!5047 array!5853) (_values!3229 array!5855) (_vacant!853 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1608)

(assert (=> b!160454 (= res!75974 (and (= (size!3056 (_values!3229 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7816 thiss!1248))) (= (size!3055 (_keys!5047 thiss!1248)) (size!3056 (_values!3229 thiss!1248))) (bvsge (mask!7816 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2987 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2987 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!5768 () Bool)

(declare-fun mapRes!5768 () Bool)

(assert (=> mapIsEmpty!5768 mapRes!5768))

(declare-fun b!160455 () Bool)

(declare-fun e!104916 () Bool)

(assert (=> b!160455 (= e!104916 tp_is_empty!3387)))

(declare-fun b!160456 () Bool)

(declare-fun res!75980 () Bool)

(assert (=> b!160456 (=> (not res!75980) (not e!104913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160456 (= res!75980 (validMask!0 (mask!7816 thiss!1248)))))

(declare-fun res!75975 () Bool)

(assert (=> start!16124 (=> (not res!75975) (not e!104913))))

(declare-fun valid!745 (LongMapFixedSize!1608) Bool)

(assert (=> start!16124 (= res!75975 (valid!745 thiss!1248))))

(assert (=> start!16124 e!104913))

(declare-fun e!104911 () Bool)

(assert (=> start!16124 e!104911))

(assert (=> start!16124 true))

(declare-fun b!160457 () Bool)

(declare-fun e!104915 () Bool)

(assert (=> b!160457 (= e!104915 (and e!104916 mapRes!5768))))

(declare-fun condMapEmpty!5768 () Bool)

(declare-fun mapDefault!5768 () ValueCell!1350)

(assert (=> b!160457 (= condMapEmpty!5768 (= (arr!2772 (_values!3229 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1350)) mapDefault!5768)))))

(declare-fun b!160458 () Bool)

(declare-fun res!75977 () Bool)

(assert (=> b!160458 (=> (not res!75977) (not e!104913))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!332 0))(
  ( (MissingZero!332 (index!3496 (_ BitVec 32))) (Found!332 (index!3497 (_ BitVec 32))) (Intermediate!332 (undefined!1144 Bool) (index!3498 (_ BitVec 32)) (x!17708 (_ BitVec 32))) (Undefined!332) (MissingVacant!332 (index!3499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5853 (_ BitVec 32)) SeekEntryResult!332)

(assert (=> b!160458 (= res!75977 ((_ is Undefined!332) (seekEntryOrOpen!0 key!828 (_keys!5047 thiss!1248) (mask!7816 thiss!1248))))))

(declare-fun b!160459 () Bool)

(assert (=> b!160459 (= e!104913 false)))

(declare-fun lt!82090 () Bool)

(declare-datatypes ((List!1942 0))(
  ( (Nil!1939) (Cons!1938 (h!2551 (_ BitVec 64)) (t!6744 List!1942)) )
))
(declare-fun arrayNoDuplicates!0 (array!5853 (_ BitVec 32) List!1942) Bool)

(assert (=> b!160459 (= lt!82090 (arrayNoDuplicates!0 (_keys!5047 thiss!1248) #b00000000000000000000000000000000 Nil!1939))))

(declare-fun mapNonEmpty!5768 () Bool)

(declare-fun tp!13325 () Bool)

(assert (=> mapNonEmpty!5768 (= mapRes!5768 (and tp!13325 e!104914))))

(declare-fun mapKey!5768 () (_ BitVec 32))

(declare-fun mapValue!5768 () ValueCell!1350)

(declare-fun mapRest!5768 () (Array (_ BitVec 32) ValueCell!1350))

(assert (=> mapNonEmpty!5768 (= (arr!2772 (_values!3229 thiss!1248)) (store mapRest!5768 mapKey!5768 mapValue!5768))))

(declare-fun b!160460 () Bool)

(declare-fun res!75978 () Bool)

(assert (=> b!160460 (=> (not res!75978) (not e!104913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5853 (_ BitVec 32)) Bool)

(assert (=> b!160460 (= res!75978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5047 thiss!1248) (mask!7816 thiss!1248)))))

(declare-fun b!160461 () Bool)

(declare-fun res!75976 () Bool)

(assert (=> b!160461 (=> (not res!75976) (not e!104913))))

(declare-datatypes ((tuple2!2920 0))(
  ( (tuple2!2921 (_1!1471 (_ BitVec 64)) (_2!1471 V!4163)) )
))
(declare-datatypes ((List!1943 0))(
  ( (Nil!1940) (Cons!1939 (h!2552 tuple2!2920) (t!6745 List!1943)) )
))
(declare-datatypes ((ListLongMap!1907 0))(
  ( (ListLongMap!1908 (toList!969 List!1943)) )
))
(declare-fun contains!1005 (ListLongMap!1907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!633 (array!5853 array!5855 (_ BitVec 32) (_ BitVec 32) V!4163 V!4163 (_ BitVec 32) Int) ListLongMap!1907)

(assert (=> b!160461 (= res!75976 (not (contains!1005 (getCurrentListMap!633 (_keys!5047 thiss!1248) (_values!3229 thiss!1248) (mask!7816 thiss!1248) (extraKeys!2987 thiss!1248) (zeroValue!3089 thiss!1248) (minValue!3089 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3246 thiss!1248)) key!828)))))

(declare-fun array_inv!1767 (array!5853) Bool)

(declare-fun array_inv!1768 (array!5855) Bool)

(assert (=> b!160462 (= e!104911 (and tp!13324 tp_is_empty!3387 (array_inv!1767 (_keys!5047 thiss!1248)) (array_inv!1768 (_values!3229 thiss!1248)) e!104915))))

(assert (= (and start!16124 res!75975) b!160453))

(assert (= (and b!160453 res!75979) b!160458))

(assert (= (and b!160458 res!75977) b!160461))

(assert (= (and b!160461 res!75976) b!160456))

(assert (= (and b!160456 res!75980) b!160454))

(assert (= (and b!160454 res!75974) b!160460))

(assert (= (and b!160460 res!75978) b!160459))

(assert (= (and b!160457 condMapEmpty!5768) mapIsEmpty!5768))

(assert (= (and b!160457 (not condMapEmpty!5768)) mapNonEmpty!5768))

(assert (= (and mapNonEmpty!5768 ((_ is ValueCellFull!1350) mapValue!5768)) b!160452))

(assert (= (and b!160457 ((_ is ValueCellFull!1350) mapDefault!5768)) b!160455))

(assert (= b!160462 b!160457))

(assert (= start!16124 b!160462))

(declare-fun m!192317 () Bool)

(assert (=> b!160462 m!192317))

(declare-fun m!192319 () Bool)

(assert (=> b!160462 m!192319))

(declare-fun m!192321 () Bool)

(assert (=> b!160459 m!192321))

(declare-fun m!192323 () Bool)

(assert (=> b!160458 m!192323))

(declare-fun m!192325 () Bool)

(assert (=> b!160461 m!192325))

(assert (=> b!160461 m!192325))

(declare-fun m!192327 () Bool)

(assert (=> b!160461 m!192327))

(declare-fun m!192329 () Bool)

(assert (=> start!16124 m!192329))

(declare-fun m!192331 () Bool)

(assert (=> mapNonEmpty!5768 m!192331))

(declare-fun m!192333 () Bool)

(assert (=> b!160460 m!192333))

(declare-fun m!192335 () Bool)

(assert (=> b!160456 m!192335))

(check-sat tp_is_empty!3387 (not b!160458) (not b!160461) (not b_next!3585) (not b!160456) (not b!160462) (not b!160460) (not mapNonEmpty!5768) (not start!16124) (not b!160459) b_and!9999)
(check-sat b_and!9999 (not b_next!3585))
