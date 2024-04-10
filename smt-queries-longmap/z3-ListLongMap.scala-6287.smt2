; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80402 () Bool)

(assert start!80402)

(declare-fun b!944359 () Bool)

(declare-fun b_free!18045 () Bool)

(declare-fun b_next!18045 () Bool)

(assert (=> b!944359 (= b_free!18045 (not b_next!18045))))

(declare-fun tp!62644 () Bool)

(declare-fun b_and!29463 () Bool)

(assert (=> b!944359 (= tp!62644 b_and!29463)))

(declare-fun b!944355 () Bool)

(declare-fun e!531052 () Bool)

(declare-fun e!531053 () Bool)

(declare-fun mapRes!32655 () Bool)

(assert (=> b!944355 (= e!531052 (and e!531053 mapRes!32655))))

(declare-fun condMapEmpty!32655 () Bool)

(declare-datatypes ((V!32369 0))(
  ( (V!32370 (val!10327 Int)) )
))
(declare-datatypes ((ValueCell!9795 0))(
  ( (ValueCellFull!9795 (v!12859 V!32369)) (EmptyCell!9795) )
))
(declare-datatypes ((array!57074 0))(
  ( (array!57075 (arr!27462 (Array (_ BitVec 32) ValueCell!9795)) (size!27928 (_ BitVec 32))) )
))
(declare-datatypes ((array!57076 0))(
  ( (array!57077 (arr!27463 (Array (_ BitVec 32) (_ BitVec 64))) (size!27929 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4740 0))(
  ( (LongMapFixedSize!4741 (defaultEntry!5665 Int) (mask!27313 (_ BitVec 32)) (extraKeys!5397 (_ BitVec 32)) (zeroValue!5501 V!32369) (minValue!5501 V!32369) (_size!2425 (_ BitVec 32)) (_keys!10543 array!57076) (_values!5688 array!57074) (_vacant!2425 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4740)

(declare-fun mapDefault!32655 () ValueCell!9795)

(assert (=> b!944355 (= condMapEmpty!32655 (= (arr!27462 (_values!5688 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9795)) mapDefault!32655)))))

(declare-fun b!944356 () Bool)

(declare-fun e!531055 () Bool)

(assert (=> b!944356 (= e!531055 true)))

(declare-fun lt!425603 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57076 (_ BitVec 32)) Bool)

(assert (=> b!944356 (= lt!425603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10543 thiss!1141) (mask!27313 thiss!1141)))))

(declare-fun b!944357 () Bool)

(declare-fun res!634400 () Bool)

(assert (=> b!944357 (=> res!634400 e!531055)))

(declare-fun lt!425604 () (_ BitVec 32))

(assert (=> b!944357 (= res!634400 (or (not (= (size!27929 (_keys!10543 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27313 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27929 (_keys!10543 thiss!1141))) (bvslt lt!425604 #b00000000000000000000000000000000) (bvsgt lt!425604 (size!27929 (_keys!10543 thiss!1141)))))))

(declare-fun mapNonEmpty!32655 () Bool)

(declare-fun tp!62645 () Bool)

(declare-fun e!531051 () Bool)

(assert (=> mapNonEmpty!32655 (= mapRes!32655 (and tp!62645 e!531051))))

(declare-fun mapValue!32655 () ValueCell!9795)

(declare-fun mapRest!32655 () (Array (_ BitVec 32) ValueCell!9795))

(declare-fun mapKey!32655 () (_ BitVec 32))

(assert (=> mapNonEmpty!32655 (= (arr!27462 (_values!5688 thiss!1141)) (store mapRest!32655 mapKey!32655 mapValue!32655))))

(declare-fun b!944358 () Bool)

(declare-fun e!531049 () Bool)

(assert (=> b!944358 (= e!531049 (not e!531055))))

(declare-fun res!634399 () Bool)

(assert (=> b!944358 (=> res!634399 e!531055)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944358 (= res!634399 (not (validMask!0 (mask!27313 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57076 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944358 (= lt!425604 (arrayScanForKey!0 (_keys!10543 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944358 (arrayContainsKey!0 (_keys!10543 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31846 0))(
  ( (Unit!31847) )
))
(declare-fun lt!425602 () Unit!31846)

(declare-fun lemmaKeyInListMapIsInArray!303 (array!57076 array!57074 (_ BitVec 32) (_ BitVec 32) V!32369 V!32369 (_ BitVec 64) Int) Unit!31846)

(assert (=> b!944358 (= lt!425602 (lemmaKeyInListMapIsInArray!303 (_keys!10543 thiss!1141) (_values!5688 thiss!1141) (mask!27313 thiss!1141) (extraKeys!5397 thiss!1141) (zeroValue!5501 thiss!1141) (minValue!5501 thiss!1141) key!756 (defaultEntry!5665 thiss!1141)))))

(declare-fun tp_is_empty!20553 () Bool)

(declare-fun e!531054 () Bool)

(declare-fun array_inv!21336 (array!57076) Bool)

(declare-fun array_inv!21337 (array!57074) Bool)

(assert (=> b!944359 (= e!531054 (and tp!62644 tp_is_empty!20553 (array_inv!21336 (_keys!10543 thiss!1141)) (array_inv!21337 (_values!5688 thiss!1141)) e!531052))))

(declare-fun b!944360 () Bool)

(declare-fun res!634401 () Bool)

(assert (=> b!944360 (=> (not res!634401) (not e!531049))))

(declare-datatypes ((tuple2!13474 0))(
  ( (tuple2!13475 (_1!6748 (_ BitVec 64)) (_2!6748 V!32369)) )
))
(declare-datatypes ((List!19271 0))(
  ( (Nil!19268) (Cons!19267 (h!20418 tuple2!13474) (t!27588 List!19271)) )
))
(declare-datatypes ((ListLongMap!12171 0))(
  ( (ListLongMap!12172 (toList!6101 List!19271)) )
))
(declare-fun contains!5173 (ListLongMap!12171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3335 (array!57076 array!57074 (_ BitVec 32) (_ BitVec 32) V!32369 V!32369 (_ BitVec 32) Int) ListLongMap!12171)

(assert (=> b!944360 (= res!634401 (contains!5173 (getCurrentListMap!3335 (_keys!10543 thiss!1141) (_values!5688 thiss!1141) (mask!27313 thiss!1141) (extraKeys!5397 thiss!1141) (zeroValue!5501 thiss!1141) (minValue!5501 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5665 thiss!1141)) key!756))))

(declare-fun b!944361 () Bool)

(assert (=> b!944361 (= e!531053 tp_is_empty!20553)))

(declare-fun mapIsEmpty!32655 () Bool)

(assert (=> mapIsEmpty!32655 mapRes!32655))

(declare-fun b!944362 () Bool)

(declare-fun res!634397 () Bool)

(assert (=> b!944362 (=> (not res!634397) (not e!531049))))

(assert (=> b!944362 (= res!634397 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944363 () Bool)

(assert (=> b!944363 (= e!531051 tp_is_empty!20553)))

(declare-fun b!944364 () Bool)

(declare-fun res!634396 () Bool)

(assert (=> b!944364 (=> (not res!634396) (not e!531049))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9065 0))(
  ( (MissingZero!9065 (index!38631 (_ BitVec 32))) (Found!9065 (index!38632 (_ BitVec 32))) (Intermediate!9065 (undefined!9877 Bool) (index!38633 (_ BitVec 32)) (x!81108 (_ BitVec 32))) (Undefined!9065) (MissingVacant!9065 (index!38634 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57076 (_ BitVec 32)) SeekEntryResult!9065)

(assert (=> b!944364 (= res!634396 (not ((_ is Found!9065) (seekEntry!0 key!756 (_keys!10543 thiss!1141) (mask!27313 thiss!1141)))))))

(declare-fun res!634398 () Bool)

(assert (=> start!80402 (=> (not res!634398) (not e!531049))))

(declare-fun valid!1813 (LongMapFixedSize!4740) Bool)

(assert (=> start!80402 (= res!634398 (valid!1813 thiss!1141))))

(assert (=> start!80402 e!531049))

(assert (=> start!80402 e!531054))

(assert (=> start!80402 true))

(assert (= (and start!80402 res!634398) b!944362))

(assert (= (and b!944362 res!634397) b!944364))

(assert (= (and b!944364 res!634396) b!944360))

(assert (= (and b!944360 res!634401) b!944358))

(assert (= (and b!944358 (not res!634399)) b!944357))

(assert (= (and b!944357 (not res!634400)) b!944356))

(assert (= (and b!944355 condMapEmpty!32655) mapIsEmpty!32655))

(assert (= (and b!944355 (not condMapEmpty!32655)) mapNonEmpty!32655))

(assert (= (and mapNonEmpty!32655 ((_ is ValueCellFull!9795) mapValue!32655)) b!944363))

(assert (= (and b!944355 ((_ is ValueCellFull!9795) mapDefault!32655)) b!944361))

(assert (= b!944359 b!944355))

(assert (= start!80402 b!944359))

(declare-fun m!878373 () Bool)

(assert (=> b!944358 m!878373))

(declare-fun m!878375 () Bool)

(assert (=> b!944358 m!878375))

(declare-fun m!878377 () Bool)

(assert (=> b!944358 m!878377))

(declare-fun m!878379 () Bool)

(assert (=> b!944358 m!878379))

(declare-fun m!878381 () Bool)

(assert (=> b!944360 m!878381))

(assert (=> b!944360 m!878381))

(declare-fun m!878383 () Bool)

(assert (=> b!944360 m!878383))

(declare-fun m!878385 () Bool)

(assert (=> start!80402 m!878385))

(declare-fun m!878387 () Bool)

(assert (=> b!944356 m!878387))

(declare-fun m!878389 () Bool)

(assert (=> mapNonEmpty!32655 m!878389))

(declare-fun m!878391 () Bool)

(assert (=> b!944359 m!878391))

(declare-fun m!878393 () Bool)

(assert (=> b!944359 m!878393))

(declare-fun m!878395 () Bool)

(assert (=> b!944364 m!878395))

(check-sat (not start!80402) (not mapNonEmpty!32655) (not b!944358) (not b!944360) (not b!944356) (not b!944364) tp_is_empty!20553 (not b_next!18045) (not b!944359) b_and!29463)
(check-sat b_and!29463 (not b_next!18045))
