; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80412 () Bool)

(assert start!80412)

(declare-fun b!944528 () Bool)

(declare-fun b_free!18055 () Bool)

(declare-fun b_next!18055 () Bool)

(assert (=> b!944528 (= b_free!18055 (not b_next!18055))))

(declare-fun tp!62674 () Bool)

(declare-fun b_and!29473 () Bool)

(assert (=> b!944528 (= tp!62674 b_and!29473)))

(declare-fun b!944527 () Bool)

(declare-fun res!634511 () Bool)

(declare-fun e!531158 () Bool)

(assert (=> b!944527 (=> res!634511 e!531158)))

(declare-datatypes ((V!32383 0))(
  ( (V!32384 (val!10332 Int)) )
))
(declare-datatypes ((ValueCell!9800 0))(
  ( (ValueCellFull!9800 (v!12864 V!32383)) (EmptyCell!9800) )
))
(declare-datatypes ((array!57094 0))(
  ( (array!57095 (arr!27472 (Array (_ BitVec 32) ValueCell!9800)) (size!27938 (_ BitVec 32))) )
))
(declare-datatypes ((array!57096 0))(
  ( (array!57097 (arr!27473 (Array (_ BitVec 32) (_ BitVec 64))) (size!27939 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4750 0))(
  ( (LongMapFixedSize!4751 (defaultEntry!5670 Int) (mask!27322 (_ BitVec 32)) (extraKeys!5402 (_ BitVec 32)) (zeroValue!5506 V!32383) (minValue!5506 V!32383) (_size!2430 (_ BitVec 32)) (_keys!10548 array!57096) (_values!5693 array!57094) (_vacant!2430 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4750)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57096 (_ BitVec 32)) Bool)

(assert (=> b!944527 (= res!634511 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10548 thiss!1141) (mask!27322 thiss!1141))))))

(declare-fun e!531154 () Bool)

(declare-fun e!531160 () Bool)

(declare-fun tp_is_empty!20563 () Bool)

(declare-fun array_inv!21344 (array!57096) Bool)

(declare-fun array_inv!21345 (array!57094) Bool)

(assert (=> b!944528 (= e!531154 (and tp!62674 tp_is_empty!20563 (array_inv!21344 (_keys!10548 thiss!1141)) (array_inv!21345 (_values!5693 thiss!1141)) e!531160))))

(declare-fun b!944529 () Bool)

(declare-fun res!634509 () Bool)

(assert (=> b!944529 (=> res!634509 e!531158)))

(assert (=> b!944529 (= res!634509 (not (= (size!27939 (_keys!10548 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27322 thiss!1141)))))))

(declare-fun b!944530 () Bool)

(declare-fun res!634512 () Bool)

(declare-fun e!531155 () Bool)

(assert (=> b!944530 (=> (not res!634512) (not e!531155))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944530 (= res!634512 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944531 () Bool)

(declare-fun e!531159 () Bool)

(assert (=> b!944531 (= e!531159 tp_is_empty!20563)))

(declare-fun res!634510 () Bool)

(assert (=> start!80412 (=> (not res!634510) (not e!531155))))

(declare-fun valid!1816 (LongMapFixedSize!4750) Bool)

(assert (=> start!80412 (= res!634510 (valid!1816 thiss!1141))))

(assert (=> start!80412 e!531155))

(assert (=> start!80412 e!531154))

(assert (=> start!80412 true))

(declare-fun b!944532 () Bool)

(declare-fun e!531157 () Bool)

(assert (=> b!944532 (= e!531157 tp_is_empty!20563)))

(declare-fun b!944533 () Bool)

(declare-fun res!634514 () Bool)

(assert (=> b!944533 (=> (not res!634514) (not e!531155))))

(declare-datatypes ((SeekEntryResult!9069 0))(
  ( (MissingZero!9069 (index!38647 (_ BitVec 32))) (Found!9069 (index!38648 (_ BitVec 32))) (Intermediate!9069 (undefined!9881 Bool) (index!38649 (_ BitVec 32)) (x!81128 (_ BitVec 32))) (Undefined!9069) (MissingVacant!9069 (index!38650 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57096 (_ BitVec 32)) SeekEntryResult!9069)

(assert (=> b!944533 (= res!634514 (not (is-Found!9069 (seekEntry!0 key!756 (_keys!10548 thiss!1141) (mask!27322 thiss!1141)))))))

(declare-fun b!944534 () Bool)

(assert (=> b!944534 (= e!531155 (not e!531158))))

(declare-fun res!634508 () Bool)

(assert (=> b!944534 (=> res!634508 e!531158)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944534 (= res!634508 (not (validMask!0 (mask!27322 thiss!1141))))))

(declare-fun lt!425660 () (_ BitVec 32))

(assert (=> b!944534 (arrayForallSeekEntryOrOpenFound!0 lt!425660 (_keys!10548 thiss!1141) (mask!27322 thiss!1141))))

(declare-datatypes ((Unit!31854 0))(
  ( (Unit!31855) )
))
(declare-fun lt!425658 () Unit!31854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31854)

(assert (=> b!944534 (= lt!425658 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10548 thiss!1141) (mask!27322 thiss!1141) #b00000000000000000000000000000000 lt!425660))))

(declare-fun arrayScanForKey!0 (array!57096 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944534 (= lt!425660 (arrayScanForKey!0 (_keys!10548 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944534 (arrayContainsKey!0 (_keys!10548 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425661 () Unit!31854)

(declare-fun lemmaKeyInListMapIsInArray!307 (array!57096 array!57094 (_ BitVec 32) (_ BitVec 32) V!32383 V!32383 (_ BitVec 64) Int) Unit!31854)

(assert (=> b!944534 (= lt!425661 (lemmaKeyInListMapIsInArray!307 (_keys!10548 thiss!1141) (_values!5693 thiss!1141) (mask!27322 thiss!1141) (extraKeys!5402 thiss!1141) (zeroValue!5506 thiss!1141) (minValue!5506 thiss!1141) key!756 (defaultEntry!5670 thiss!1141)))))

(declare-fun b!944535 () Bool)

(assert (=> b!944535 (= e!531158 true)))

(declare-fun lt!425659 () SeekEntryResult!9069)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57096 (_ BitVec 32)) SeekEntryResult!9069)

(assert (=> b!944535 (= lt!425659 (seekEntryOrOpen!0 key!756 (_keys!10548 thiss!1141) (mask!27322 thiss!1141)))))

(declare-fun mapNonEmpty!32670 () Bool)

(declare-fun mapRes!32670 () Bool)

(declare-fun tp!62675 () Bool)

(assert (=> mapNonEmpty!32670 (= mapRes!32670 (and tp!62675 e!531157))))

(declare-fun mapKey!32670 () (_ BitVec 32))

(declare-fun mapValue!32670 () ValueCell!9800)

(declare-fun mapRest!32670 () (Array (_ BitVec 32) ValueCell!9800))

(assert (=> mapNonEmpty!32670 (= (arr!27472 (_values!5693 thiss!1141)) (store mapRest!32670 mapKey!32670 mapValue!32670))))

(declare-fun b!944536 () Bool)

(declare-fun res!634513 () Bool)

(assert (=> b!944536 (=> res!634513 e!531158)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944536 (= res!634513 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944537 () Bool)

(declare-fun res!634515 () Bool)

(assert (=> b!944537 (=> (not res!634515) (not e!531155))))

(declare-datatypes ((tuple2!13482 0))(
  ( (tuple2!13483 (_1!6752 (_ BitVec 64)) (_2!6752 V!32383)) )
))
(declare-datatypes ((List!19275 0))(
  ( (Nil!19272) (Cons!19271 (h!20422 tuple2!13482) (t!27592 List!19275)) )
))
(declare-datatypes ((ListLongMap!12179 0))(
  ( (ListLongMap!12180 (toList!6105 List!19275)) )
))
(declare-fun contains!5177 (ListLongMap!12179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3339 (array!57096 array!57094 (_ BitVec 32) (_ BitVec 32) V!32383 V!32383 (_ BitVec 32) Int) ListLongMap!12179)

(assert (=> b!944537 (= res!634515 (contains!5177 (getCurrentListMap!3339 (_keys!10548 thiss!1141) (_values!5693 thiss!1141) (mask!27322 thiss!1141) (extraKeys!5402 thiss!1141) (zeroValue!5506 thiss!1141) (minValue!5506 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5670 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32670 () Bool)

(assert (=> mapIsEmpty!32670 mapRes!32670))

(declare-fun b!944538 () Bool)

(assert (=> b!944538 (= e!531160 (and e!531159 mapRes!32670))))

(declare-fun condMapEmpty!32670 () Bool)

(declare-fun mapDefault!32670 () ValueCell!9800)

