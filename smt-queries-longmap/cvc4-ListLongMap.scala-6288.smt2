; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80410 () Bool)

(assert start!80410)

(declare-fun b!944494 () Bool)

(declare-fun b_free!18053 () Bool)

(declare-fun b_next!18053 () Bool)

(assert (=> b!944494 (= b_free!18053 (not b_next!18053))))

(declare-fun tp!62668 () Bool)

(declare-fun b_and!29471 () Bool)

(assert (=> b!944494 (= tp!62668 b_and!29471)))

(declare-fun b!944491 () Bool)

(declare-fun e!531135 () Bool)

(declare-fun e!531133 () Bool)

(assert (=> b!944491 (= e!531135 (not e!531133))))

(declare-fun res!634487 () Bool)

(assert (=> b!944491 (=> res!634487 e!531133)))

(declare-datatypes ((V!32379 0))(
  ( (V!32380 (val!10331 Int)) )
))
(declare-datatypes ((ValueCell!9799 0))(
  ( (ValueCellFull!9799 (v!12863 V!32379)) (EmptyCell!9799) )
))
(declare-datatypes ((array!57090 0))(
  ( (array!57091 (arr!27470 (Array (_ BitVec 32) ValueCell!9799)) (size!27936 (_ BitVec 32))) )
))
(declare-datatypes ((array!57092 0))(
  ( (array!57093 (arr!27471 (Array (_ BitVec 32) (_ BitVec 64))) (size!27937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4748 0))(
  ( (LongMapFixedSize!4749 (defaultEntry!5669 Int) (mask!27319 (_ BitVec 32)) (extraKeys!5401 (_ BitVec 32)) (zeroValue!5505 V!32379) (minValue!5505 V!32379) (_size!2429 (_ BitVec 32)) (_keys!10547 array!57092) (_values!5692 array!57090) (_vacant!2429 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4748)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944491 (= res!634487 (not (validMask!0 (mask!27319 thiss!1141))))))

(declare-fun lt!425648 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57092 (_ BitVec 32)) Bool)

(assert (=> b!944491 (arrayForallSeekEntryOrOpenFound!0 lt!425648 (_keys!10547 thiss!1141) (mask!27319 thiss!1141))))

(declare-datatypes ((Unit!31852 0))(
  ( (Unit!31853) )
))
(declare-fun lt!425646 () Unit!31852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31852)

(assert (=> b!944491 (= lt!425646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10547 thiss!1141) (mask!27319 thiss!1141) #b00000000000000000000000000000000 lt!425648))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57092 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944491 (= lt!425648 (arrayScanForKey!0 (_keys!10547 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944491 (arrayContainsKey!0 (_keys!10547 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425649 () Unit!31852)

(declare-fun lemmaKeyInListMapIsInArray!306 (array!57092 array!57090 (_ BitVec 32) (_ BitVec 32) V!32379 V!32379 (_ BitVec 64) Int) Unit!31852)

(assert (=> b!944491 (= lt!425649 (lemmaKeyInListMapIsInArray!306 (_keys!10547 thiss!1141) (_values!5692 thiss!1141) (mask!27319 thiss!1141) (extraKeys!5401 thiss!1141) (zeroValue!5505 thiss!1141) (minValue!5505 thiss!1141) key!756 (defaultEntry!5669 thiss!1141)))))

(declare-fun res!634484 () Bool)

(assert (=> start!80410 (=> (not res!634484) (not e!531135))))

(declare-fun valid!1815 (LongMapFixedSize!4748) Bool)

(assert (=> start!80410 (= res!634484 (valid!1815 thiss!1141))))

(assert (=> start!80410 e!531135))

(declare-fun e!531138 () Bool)

(assert (=> start!80410 e!531138))

(assert (=> start!80410 true))

(declare-fun b!944492 () Bool)

(declare-fun res!634488 () Bool)

(assert (=> b!944492 (=> res!634488 e!531133)))

(assert (=> b!944492 (= res!634488 (not (= (size!27937 (_keys!10547 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27319 thiss!1141)))))))

(declare-fun b!944493 () Bool)

(declare-fun e!531139 () Bool)

(declare-fun tp_is_empty!20561 () Bool)

(assert (=> b!944493 (= e!531139 tp_is_empty!20561)))

(declare-fun e!531137 () Bool)

(declare-fun array_inv!21342 (array!57092) Bool)

(declare-fun array_inv!21343 (array!57090) Bool)

(assert (=> b!944494 (= e!531138 (and tp!62668 tp_is_empty!20561 (array_inv!21342 (_keys!10547 thiss!1141)) (array_inv!21343 (_values!5692 thiss!1141)) e!531137))))

(declare-fun b!944495 () Bool)

(declare-fun e!531134 () Bool)

(assert (=> b!944495 (= e!531134 tp_is_empty!20561)))

(declare-fun mapIsEmpty!32667 () Bool)

(declare-fun mapRes!32667 () Bool)

(assert (=> mapIsEmpty!32667 mapRes!32667))

(declare-fun mapNonEmpty!32667 () Bool)

(declare-fun tp!62669 () Bool)

(assert (=> mapNonEmpty!32667 (= mapRes!32667 (and tp!62669 e!531134))))

(declare-fun mapValue!32667 () ValueCell!9799)

(declare-fun mapRest!32667 () (Array (_ BitVec 32) ValueCell!9799))

(declare-fun mapKey!32667 () (_ BitVec 32))

(assert (=> mapNonEmpty!32667 (= (arr!27470 (_values!5692 thiss!1141)) (store mapRest!32667 mapKey!32667 mapValue!32667))))

(declare-fun b!944496 () Bool)

(assert (=> b!944496 (= e!531137 (and e!531139 mapRes!32667))))

(declare-fun condMapEmpty!32667 () Bool)

(declare-fun mapDefault!32667 () ValueCell!9799)

