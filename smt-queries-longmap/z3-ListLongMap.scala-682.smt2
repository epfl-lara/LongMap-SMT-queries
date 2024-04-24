; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16600 () Bool)

(assert start!16600)

(declare-fun b!165558 () Bool)

(declare-fun b_free!3901 () Bool)

(declare-fun b_next!3901 () Bool)

(assert (=> b!165558 (= b_free!3901 (not b_next!3901))))

(declare-fun tp!14304 () Bool)

(declare-fun b_and!10329 () Bool)

(assert (=> b!165558 (= tp!14304 b_and!10329)))

(declare-fun b!165550 () Bool)

(declare-fun res!78555 () Bool)

(declare-fun e!108592 () Bool)

(assert (=> b!165550 (=> (not res!78555) (not e!108592))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165550 (= res!78555 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165551 () Bool)

(declare-fun e!108590 () Bool)

(declare-fun tp_is_empty!3703 () Bool)

(assert (=> b!165551 (= e!108590 tp_is_empty!3703)))

(declare-fun b!165552 () Bool)

(declare-fun e!108591 () Bool)

(declare-fun e!108587 () Bool)

(declare-fun mapRes!6273 () Bool)

(assert (=> b!165552 (= e!108591 (and e!108587 mapRes!6273))))

(declare-fun condMapEmpty!6273 () Bool)

(declare-datatypes ((V!4585 0))(
  ( (V!4586 (val!1896 Int)) )
))
(declare-datatypes ((ValueCell!1508 0))(
  ( (ValueCellFull!1508 (v!3762 V!4585)) (EmptyCell!1508) )
))
(declare-datatypes ((array!6489 0))(
  ( (array!6490 (arr!3080 (Array (_ BitVec 32) (_ BitVec 64))) (size!3368 (_ BitVec 32))) )
))
(declare-datatypes ((array!6491 0))(
  ( (array!6492 (arr!3081 (Array (_ BitVec 32) ValueCell!1508)) (size!3369 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1924 0))(
  ( (LongMapFixedSize!1925 (defaultEntry!3404 Int) (mask!8117 (_ BitVec 32)) (extraKeys!3145 (_ BitVec 32)) (zeroValue!3247 V!4585) (minValue!3247 V!4585) (_size!1011 (_ BitVec 32)) (_keys!5229 array!6489) (_values!3387 array!6491) (_vacant!1011 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1924)

(declare-fun mapDefault!6273 () ValueCell!1508)

(assert (=> b!165552 (= condMapEmpty!6273 (= (arr!3081 (_values!3387 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1508)) mapDefault!6273)))))

(declare-fun b!165553 () Bool)

(declare-fun res!78557 () Bool)

(declare-fun e!108589 () Bool)

(assert (=> b!165553 (=> (not res!78557) (not e!108589))))

(declare-datatypes ((tuple2!3020 0))(
  ( (tuple2!3021 (_1!1521 (_ BitVec 64)) (_2!1521 V!4585)) )
))
(declare-datatypes ((List!2042 0))(
  ( (Nil!2039) (Cons!2038 (h!2655 tuple2!3020) (t!6836 List!2042)) )
))
(declare-datatypes ((ListLongMap!1981 0))(
  ( (ListLongMap!1982 (toList!1006 List!2042)) )
))
(declare-fun contains!1058 (ListLongMap!1981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!668 (array!6489 array!6491 (_ BitVec 32) (_ BitVec 32) V!4585 V!4585 (_ BitVec 32) Int) ListLongMap!1981)

(assert (=> b!165553 (= res!78557 (not (contains!1058 (getCurrentListMap!668 (_keys!5229 thiss!1248) (_values!3387 thiss!1248) (mask!8117 thiss!1248) (extraKeys!3145 thiss!1248) (zeroValue!3247 thiss!1248) (minValue!3247 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3404 thiss!1248)) key!828)))))

(declare-fun b!165554 () Bool)

(assert (=> b!165554 (= e!108587 tp_is_empty!3703)))

(declare-fun mapNonEmpty!6273 () Bool)

(declare-fun tp!14303 () Bool)

(assert (=> mapNonEmpty!6273 (= mapRes!6273 (and tp!14303 e!108590))))

(declare-fun mapKey!6273 () (_ BitVec 32))

(declare-fun mapRest!6273 () (Array (_ BitVec 32) ValueCell!1508))

(declare-fun mapValue!6273 () ValueCell!1508)

(assert (=> mapNonEmpty!6273 (= (arr!3081 (_values!3387 thiss!1248)) (store mapRest!6273 mapKey!6273 mapValue!6273))))

(declare-fun res!78552 () Bool)

(assert (=> start!16600 (=> (not res!78552) (not e!108592))))

(declare-fun valid!866 (LongMapFixedSize!1924) Bool)

(assert (=> start!16600 (= res!78552 (valid!866 thiss!1248))))

(assert (=> start!16600 e!108592))

(declare-fun e!108593 () Bool)

(assert (=> start!16600 e!108593))

(assert (=> start!16600 true))

(declare-fun b!165555 () Bool)

(assert (=> b!165555 (= e!108592 e!108589)))

(declare-fun res!78553 () Bool)

(assert (=> b!165555 (=> (not res!78553) (not e!108589))))

(declare-datatypes ((SeekEntryResult!433 0))(
  ( (MissingZero!433 (index!3900 (_ BitVec 32))) (Found!433 (index!3901 (_ BitVec 32))) (Intermediate!433 (undefined!1245 Bool) (index!3902 (_ BitVec 32)) (x!18341 (_ BitVec 32))) (Undefined!433) (MissingVacant!433 (index!3903 (_ BitVec 32))) )
))
(declare-fun lt!83142 () SeekEntryResult!433)

(get-info :version)

(assert (=> b!165555 (= res!78553 (and (not ((_ is Undefined!433) lt!83142)) (not ((_ is MissingVacant!433) lt!83142)) (not ((_ is MissingZero!433) lt!83142)) ((_ is Found!433) lt!83142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6489 (_ BitVec 32)) SeekEntryResult!433)

(assert (=> b!165555 (= lt!83142 (seekEntryOrOpen!0 key!828 (_keys!5229 thiss!1248) (mask!8117 thiss!1248)))))

(declare-fun b!165556 () Bool)

(declare-fun res!78554 () Bool)

(assert (=> b!165556 (=> (not res!78554) (not e!108589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165556 (= res!78554 (validMask!0 (mask!8117 thiss!1248)))))

(declare-fun b!165557 () Bool)

(assert (=> b!165557 (= e!108589 false)))

(declare-fun lt!83141 () Bool)

(declare-datatypes ((List!2043 0))(
  ( (Nil!2040) (Cons!2039 (h!2656 (_ BitVec 64)) (t!6837 List!2043)) )
))
(declare-fun arrayNoDuplicates!0 (array!6489 (_ BitVec 32) List!2043) Bool)

(assert (=> b!165557 (= lt!83141 (arrayNoDuplicates!0 (_keys!5229 thiss!1248) #b00000000000000000000000000000000 Nil!2040))))

(declare-fun mapIsEmpty!6273 () Bool)

(assert (=> mapIsEmpty!6273 mapRes!6273))

(declare-fun array_inv!1977 (array!6489) Bool)

(declare-fun array_inv!1978 (array!6491) Bool)

(assert (=> b!165558 (= e!108593 (and tp!14304 tp_is_empty!3703 (array_inv!1977 (_keys!5229 thiss!1248)) (array_inv!1978 (_values!3387 thiss!1248)) e!108591))))

(declare-fun b!165559 () Bool)

(declare-fun res!78558 () Bool)

(assert (=> b!165559 (=> (not res!78558) (not e!108589))))

(assert (=> b!165559 (= res!78558 (and (= (size!3369 (_values!3387 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8117 thiss!1248))) (= (size!3368 (_keys!5229 thiss!1248)) (size!3369 (_values!3387 thiss!1248))) (bvsge (mask!8117 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3145 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3145 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165560 () Bool)

(declare-fun res!78556 () Bool)

(assert (=> b!165560 (=> (not res!78556) (not e!108589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6489 (_ BitVec 32)) Bool)

(assert (=> b!165560 (= res!78556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5229 thiss!1248) (mask!8117 thiss!1248)))))

(assert (= (and start!16600 res!78552) b!165550))

(assert (= (and b!165550 res!78555) b!165555))

(assert (= (and b!165555 res!78553) b!165553))

(assert (= (and b!165553 res!78557) b!165556))

(assert (= (and b!165556 res!78554) b!165559))

(assert (= (and b!165559 res!78558) b!165560))

(assert (= (and b!165560 res!78556) b!165557))

(assert (= (and b!165552 condMapEmpty!6273) mapIsEmpty!6273))

(assert (= (and b!165552 (not condMapEmpty!6273)) mapNonEmpty!6273))

(assert (= (and mapNonEmpty!6273 ((_ is ValueCellFull!1508) mapValue!6273)) b!165551))

(assert (= (and b!165552 ((_ is ValueCellFull!1508) mapDefault!6273)) b!165554))

(assert (= b!165558 b!165552))

(assert (= start!16600 b!165558))

(declare-fun m!195473 () Bool)

(assert (=> b!165555 m!195473))

(declare-fun m!195475 () Bool)

(assert (=> b!165553 m!195475))

(assert (=> b!165553 m!195475))

(declare-fun m!195477 () Bool)

(assert (=> b!165553 m!195477))

(declare-fun m!195479 () Bool)

(assert (=> b!165557 m!195479))

(declare-fun m!195481 () Bool)

(assert (=> mapNonEmpty!6273 m!195481))

(declare-fun m!195483 () Bool)

(assert (=> start!16600 m!195483))

(declare-fun m!195485 () Bool)

(assert (=> b!165556 m!195485))

(declare-fun m!195487 () Bool)

(assert (=> b!165560 m!195487))

(declare-fun m!195489 () Bool)

(assert (=> b!165558 m!195489))

(declare-fun m!195491 () Bool)

(assert (=> b!165558 m!195491))

(check-sat (not b!165557) (not b!165558) (not b_next!3901) b_and!10329 (not mapNonEmpty!6273) (not b!165560) (not start!16600) (not b!165553) tp_is_empty!3703 (not b!165555) (not b!165556))
(check-sat b_and!10329 (not b_next!3901))
