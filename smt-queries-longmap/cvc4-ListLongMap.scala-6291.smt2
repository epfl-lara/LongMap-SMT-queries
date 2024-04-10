; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80428 () Bool)

(assert start!80428)

(declare-fun b!944819 () Bool)

(declare-fun b_free!18071 () Bool)

(declare-fun b_next!18071 () Bool)

(assert (=> b!944819 (= b_free!18071 (not b_next!18071))))

(declare-fun tp!62722 () Bool)

(declare-fun b_and!29489 () Bool)

(assert (=> b!944819 (= tp!62722 b_and!29489)))

(declare-fun b!944815 () Bool)

(declare-fun e!531325 () Bool)

(declare-fun e!531324 () Bool)

(assert (=> b!944815 (= e!531325 (not e!531324))))

(declare-fun res!634702 () Bool)

(assert (=> b!944815 (=> res!634702 e!531324)))

(declare-datatypes ((V!32403 0))(
  ( (V!32404 (val!10340 Int)) )
))
(declare-datatypes ((ValueCell!9808 0))(
  ( (ValueCellFull!9808 (v!12872 V!32403)) (EmptyCell!9808) )
))
(declare-datatypes ((array!57126 0))(
  ( (array!57127 (arr!27488 (Array (_ BitVec 32) ValueCell!9808)) (size!27954 (_ BitVec 32))) )
))
(declare-datatypes ((array!57128 0))(
  ( (array!57129 (arr!27489 (Array (_ BitVec 32) (_ BitVec 64))) (size!27955 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4766 0))(
  ( (LongMapFixedSize!4767 (defaultEntry!5678 Int) (mask!27334 (_ BitVec 32)) (extraKeys!5410 (_ BitVec 32)) (zeroValue!5514 V!32403) (minValue!5514 V!32403) (_size!2438 (_ BitVec 32)) (_keys!10556 array!57128) (_values!5701 array!57126) (_vacant!2438 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4766)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944815 (= res!634702 (not (validMask!0 (mask!27334 thiss!1141))))))

(declare-fun lt!425754 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57128 (_ BitVec 32)) Bool)

(assert (=> b!944815 (arrayForallSeekEntryOrOpenFound!0 lt!425754 (_keys!10556 thiss!1141) (mask!27334 thiss!1141))))

(declare-datatypes ((Unit!31868 0))(
  ( (Unit!31869) )
))
(declare-fun lt!425756 () Unit!31868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31868)

(assert (=> b!944815 (= lt!425756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10556 thiss!1141) (mask!27334 thiss!1141) #b00000000000000000000000000000000 lt!425754))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57128 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944815 (= lt!425754 (arrayScanForKey!0 (_keys!10556 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944815 (arrayContainsKey!0 (_keys!10556 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425757 () Unit!31868)

(declare-fun lemmaKeyInListMapIsInArray!314 (array!57128 array!57126 (_ BitVec 32) (_ BitVec 32) V!32403 V!32403 (_ BitVec 64) Int) Unit!31868)

(assert (=> b!944815 (= lt!425757 (lemmaKeyInListMapIsInArray!314 (_keys!10556 thiss!1141) (_values!5701 thiss!1141) (mask!27334 thiss!1141) (extraKeys!5410 thiss!1141) (zeroValue!5514 thiss!1141) (minValue!5514 thiss!1141) key!756 (defaultEntry!5678 thiss!1141)))))

(declare-fun b!944816 () Bool)

(declare-fun res!634703 () Bool)

(assert (=> b!944816 (=> res!634703 e!531324)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944816 (= res!634703 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944817 () Bool)

(declare-fun res!634704 () Bool)

(assert (=> b!944817 (=> (not res!634704) (not e!531325))))

(assert (=> b!944817 (= res!634704 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944818 () Bool)

(declare-fun e!531328 () Bool)

(declare-fun tp_is_empty!20579 () Bool)

(assert (=> b!944818 (= e!531328 tp_is_empty!20579)))

(declare-fun e!531322 () Bool)

(declare-fun e!531323 () Bool)

(declare-fun array_inv!21358 (array!57128) Bool)

(declare-fun array_inv!21359 (array!57126) Bool)

(assert (=> b!944819 (= e!531323 (and tp!62722 tp_is_empty!20579 (array_inv!21358 (_keys!10556 thiss!1141)) (array_inv!21359 (_values!5701 thiss!1141)) e!531322))))

(declare-fun b!944820 () Bool)

(declare-fun res!634701 () Bool)

(assert (=> b!944820 (=> res!634701 e!531324)))

(assert (=> b!944820 (= res!634701 (not (= (size!27955 (_keys!10556 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27334 thiss!1141)))))))

(declare-fun b!944821 () Bool)

(assert (=> b!944821 (= e!531324 true)))

(declare-datatypes ((SeekEntryResult!9077 0))(
  ( (MissingZero!9077 (index!38679 (_ BitVec 32))) (Found!9077 (index!38680 (_ BitVec 32))) (Intermediate!9077 (undefined!9889 Bool) (index!38681 (_ BitVec 32)) (x!81152 (_ BitVec 32))) (Undefined!9077) (MissingVacant!9077 (index!38682 (_ BitVec 32))) )
))
(declare-fun lt!425755 () SeekEntryResult!9077)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57128 (_ BitVec 32)) SeekEntryResult!9077)

(assert (=> b!944821 (= lt!425755 (seekEntryOrOpen!0 key!756 (_keys!10556 thiss!1141) (mask!27334 thiss!1141)))))

(declare-fun mapNonEmpty!32694 () Bool)

(declare-fun mapRes!32694 () Bool)

(declare-fun tp!62723 () Bool)

(assert (=> mapNonEmpty!32694 (= mapRes!32694 (and tp!62723 e!531328))))

(declare-fun mapValue!32694 () ValueCell!9808)

(declare-fun mapKey!32694 () (_ BitVec 32))

(declare-fun mapRest!32694 () (Array (_ BitVec 32) ValueCell!9808))

(assert (=> mapNonEmpty!32694 (= (arr!27488 (_values!5701 thiss!1141)) (store mapRest!32694 mapKey!32694 mapValue!32694))))

(declare-fun b!944822 () Bool)

(declare-fun e!531327 () Bool)

(assert (=> b!944822 (= e!531322 (and e!531327 mapRes!32694))))

(declare-fun condMapEmpty!32694 () Bool)

(declare-fun mapDefault!32694 () ValueCell!9808)

