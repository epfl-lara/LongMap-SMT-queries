; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80414 () Bool)

(assert start!80414)

(declare-fun b!944566 () Bool)

(declare-fun b_free!18057 () Bool)

(declare-fun b_next!18057 () Bool)

(assert (=> b!944566 (= b_free!18057 (not b_next!18057))))

(declare-fun tp!62681 () Bool)

(declare-fun b_and!29475 () Bool)

(assert (=> b!944566 (= tp!62681 b_and!29475)))

(declare-fun mapIsEmpty!32673 () Bool)

(declare-fun mapRes!32673 () Bool)

(assert (=> mapIsEmpty!32673 mapRes!32673))

(declare-fun b!944563 () Bool)

(declare-fun e!531180 () Bool)

(declare-fun tp_is_empty!20565 () Bool)

(assert (=> b!944563 (= e!531180 tp_is_empty!20565)))

(declare-fun mapNonEmpty!32673 () Bool)

(declare-fun tp!62680 () Bool)

(declare-fun e!531179 () Bool)

(assert (=> mapNonEmpty!32673 (= mapRes!32673 (and tp!62680 e!531179))))

(declare-fun mapKey!32673 () (_ BitVec 32))

(declare-datatypes ((V!32385 0))(
  ( (V!32386 (val!10333 Int)) )
))
(declare-datatypes ((ValueCell!9801 0))(
  ( (ValueCellFull!9801 (v!12865 V!32385)) (EmptyCell!9801) )
))
(declare-fun mapRest!32673 () (Array (_ BitVec 32) ValueCell!9801))

(declare-datatypes ((array!57098 0))(
  ( (array!57099 (arr!27474 (Array (_ BitVec 32) ValueCell!9801)) (size!27940 (_ BitVec 32))) )
))
(declare-datatypes ((array!57100 0))(
  ( (array!57101 (arr!27475 (Array (_ BitVec 32) (_ BitVec 64))) (size!27941 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4752 0))(
  ( (LongMapFixedSize!4753 (defaultEntry!5671 Int) (mask!27323 (_ BitVec 32)) (extraKeys!5403 (_ BitVec 32)) (zeroValue!5507 V!32385) (minValue!5507 V!32385) (_size!2431 (_ BitVec 32)) (_keys!10549 array!57100) (_values!5694 array!57098) (_vacant!2431 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4752)

(declare-fun mapValue!32673 () ValueCell!9801)

(assert (=> mapNonEmpty!32673 (= (arr!27474 (_values!5694 thiss!1141)) (store mapRest!32673 mapKey!32673 mapValue!32673))))

(declare-fun b!944565 () Bool)

(declare-fun res!634532 () Bool)

(declare-fun e!531178 () Bool)

(assert (=> b!944565 (=> res!634532 e!531178)))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944565 (= res!634532 (not (validKeyInArray!0 key!756)))))

(declare-fun e!531181 () Bool)

(declare-fun e!531175 () Bool)

(declare-fun array_inv!21346 (array!57100) Bool)

(declare-fun array_inv!21347 (array!57098) Bool)

(assert (=> b!944566 (= e!531181 (and tp!62681 tp_is_empty!20565 (array_inv!21346 (_keys!10549 thiss!1141)) (array_inv!21347 (_values!5694 thiss!1141)) e!531175))))

(declare-fun res!634534 () Bool)

(declare-fun e!531177 () Bool)

(assert (=> start!80414 (=> (not res!634534) (not e!531177))))

(declare-fun valid!1817 (LongMapFixedSize!4752) Bool)

(assert (=> start!80414 (= res!634534 (valid!1817 thiss!1141))))

(assert (=> start!80414 e!531177))

(assert (=> start!80414 e!531181))

(assert (=> start!80414 true))

(declare-fun b!944564 () Bool)

(assert (=> b!944564 (= e!531175 (and e!531180 mapRes!32673))))

(declare-fun condMapEmpty!32673 () Bool)

(declare-fun mapDefault!32673 () ValueCell!9801)

(assert (=> b!944564 (= condMapEmpty!32673 (= (arr!27474 (_values!5694 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9801)) mapDefault!32673)))))

(declare-fun b!944567 () Bool)

(declare-fun res!634539 () Bool)

(assert (=> b!944567 (=> res!634539 e!531178)))

(assert (=> b!944567 (= res!634539 (not (= (size!27941 (_keys!10549 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27323 thiss!1141)))))))

(declare-fun b!944568 () Bool)

(assert (=> b!944568 (= e!531179 tp_is_empty!20565)))

(declare-fun b!944569 () Bool)

(assert (=> b!944569 (= e!531178 true)))

(declare-datatypes ((SeekEntryResult!9070 0))(
  ( (MissingZero!9070 (index!38651 (_ BitVec 32))) (Found!9070 (index!38652 (_ BitVec 32))) (Intermediate!9070 (undefined!9882 Bool) (index!38653 (_ BitVec 32)) (x!81129 (_ BitVec 32))) (Undefined!9070) (MissingVacant!9070 (index!38654 (_ BitVec 32))) )
))
(declare-fun lt!425670 () SeekEntryResult!9070)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57100 (_ BitVec 32)) SeekEntryResult!9070)

(assert (=> b!944569 (= lt!425670 (seekEntryOrOpen!0 key!756 (_keys!10549 thiss!1141) (mask!27323 thiss!1141)))))

(declare-fun b!944570 () Bool)

(declare-fun res!634535 () Bool)

(assert (=> b!944570 (=> (not res!634535) (not e!531177))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57100 (_ BitVec 32)) SeekEntryResult!9070)

(assert (=> b!944570 (= res!634535 (not ((_ is Found!9070) (seekEntry!0 key!756 (_keys!10549 thiss!1141) (mask!27323 thiss!1141)))))))

(declare-fun b!944571 () Bool)

(declare-fun res!634536 () Bool)

(assert (=> b!944571 (=> res!634536 e!531178)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57100 (_ BitVec 32)) Bool)

(assert (=> b!944571 (= res!634536 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10549 thiss!1141) (mask!27323 thiss!1141))))))

(declare-fun b!944572 () Bool)

(declare-fun res!634537 () Bool)

(assert (=> b!944572 (=> (not res!634537) (not e!531177))))

(assert (=> b!944572 (= res!634537 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944573 () Bool)

(declare-fun res!634538 () Bool)

(assert (=> b!944573 (=> (not res!634538) (not e!531177))))

(declare-datatypes ((tuple2!13484 0))(
  ( (tuple2!13485 (_1!6753 (_ BitVec 64)) (_2!6753 V!32385)) )
))
(declare-datatypes ((List!19276 0))(
  ( (Nil!19273) (Cons!19272 (h!20423 tuple2!13484) (t!27593 List!19276)) )
))
(declare-datatypes ((ListLongMap!12181 0))(
  ( (ListLongMap!12182 (toList!6106 List!19276)) )
))
(declare-fun contains!5178 (ListLongMap!12181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3340 (array!57100 array!57098 (_ BitVec 32) (_ BitVec 32) V!32385 V!32385 (_ BitVec 32) Int) ListLongMap!12181)

(assert (=> b!944573 (= res!634538 (contains!5178 (getCurrentListMap!3340 (_keys!10549 thiss!1141) (_values!5694 thiss!1141) (mask!27323 thiss!1141) (extraKeys!5403 thiss!1141) (zeroValue!5507 thiss!1141) (minValue!5507 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5671 thiss!1141)) key!756))))

(declare-fun b!944574 () Bool)

(assert (=> b!944574 (= e!531177 (not e!531178))))

(declare-fun res!634533 () Bool)

(assert (=> b!944574 (=> res!634533 e!531178)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944574 (= res!634533 (not (validMask!0 (mask!27323 thiss!1141))))))

(declare-fun lt!425671 () (_ BitVec 32))

(assert (=> b!944574 (arrayForallSeekEntryOrOpenFound!0 lt!425671 (_keys!10549 thiss!1141) (mask!27323 thiss!1141))))

(declare-datatypes ((Unit!31856 0))(
  ( (Unit!31857) )
))
(declare-fun lt!425672 () Unit!31856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57100 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31856)

(assert (=> b!944574 (= lt!425672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10549 thiss!1141) (mask!27323 thiss!1141) #b00000000000000000000000000000000 lt!425671))))

(declare-fun arrayScanForKey!0 (array!57100 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944574 (= lt!425671 (arrayScanForKey!0 (_keys!10549 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944574 (arrayContainsKey!0 (_keys!10549 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425673 () Unit!31856)

(declare-fun lemmaKeyInListMapIsInArray!308 (array!57100 array!57098 (_ BitVec 32) (_ BitVec 32) V!32385 V!32385 (_ BitVec 64) Int) Unit!31856)

(assert (=> b!944574 (= lt!425673 (lemmaKeyInListMapIsInArray!308 (_keys!10549 thiss!1141) (_values!5694 thiss!1141) (mask!27323 thiss!1141) (extraKeys!5403 thiss!1141) (zeroValue!5507 thiss!1141) (minValue!5507 thiss!1141) key!756 (defaultEntry!5671 thiss!1141)))))

(assert (= (and start!80414 res!634534) b!944572))

(assert (= (and b!944572 res!634537) b!944570))

(assert (= (and b!944570 res!634535) b!944573))

(assert (= (and b!944573 res!634538) b!944574))

(assert (= (and b!944574 (not res!634533)) b!944567))

(assert (= (and b!944567 (not res!634539)) b!944571))

(assert (= (and b!944571 (not res!634536)) b!944565))

(assert (= (and b!944565 (not res!634532)) b!944569))

(assert (= (and b!944564 condMapEmpty!32673) mapIsEmpty!32673))

(assert (= (and b!944564 (not condMapEmpty!32673)) mapNonEmpty!32673))

(assert (= (and mapNonEmpty!32673 ((_ is ValueCellFull!9801) mapValue!32673)) b!944568))

(assert (= (and b!944564 ((_ is ValueCellFull!9801) mapDefault!32673)) b!944563))

(assert (= b!944566 b!944564))

(assert (= start!80414 b!944566))

(declare-fun m!878549 () Bool)

(assert (=> b!944569 m!878549))

(declare-fun m!878551 () Bool)

(assert (=> b!944574 m!878551))

(declare-fun m!878553 () Bool)

(assert (=> b!944574 m!878553))

(declare-fun m!878555 () Bool)

(assert (=> b!944574 m!878555))

(declare-fun m!878557 () Bool)

(assert (=> b!944574 m!878557))

(declare-fun m!878559 () Bool)

(assert (=> b!944574 m!878559))

(declare-fun m!878561 () Bool)

(assert (=> b!944574 m!878561))

(declare-fun m!878563 () Bool)

(assert (=> b!944570 m!878563))

(declare-fun m!878565 () Bool)

(assert (=> start!80414 m!878565))

(declare-fun m!878567 () Bool)

(assert (=> mapNonEmpty!32673 m!878567))

(declare-fun m!878569 () Bool)

(assert (=> b!944566 m!878569))

(declare-fun m!878571 () Bool)

(assert (=> b!944566 m!878571))

(declare-fun m!878573 () Bool)

(assert (=> b!944565 m!878573))

(declare-fun m!878575 () Bool)

(assert (=> b!944573 m!878575))

(assert (=> b!944573 m!878575))

(declare-fun m!878577 () Bool)

(assert (=> b!944573 m!878577))

(declare-fun m!878579 () Bool)

(assert (=> b!944571 m!878579))

(check-sat (not b!944566) (not mapNonEmpty!32673) (not b!944573) (not start!80414) (not b!944574) (not b!944569) (not b_next!18057) tp_is_empty!20565 (not b!944565) (not b!944571) (not b!944570) b_and!29475)
(check-sat b_and!29475 (not b_next!18057))
