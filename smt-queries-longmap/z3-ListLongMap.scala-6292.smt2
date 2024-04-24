; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80598 () Bool)

(assert start!80598)

(declare-fun b!945754 () Bool)

(declare-fun b_free!18073 () Bool)

(declare-fun b_next!18073 () Bool)

(assert (=> b!945754 (= b_free!18073 (not b_next!18073))))

(declare-fun tp!62729 () Bool)

(declare-fun b_and!29501 () Bool)

(assert (=> b!945754 (= tp!62729 b_and!29501)))

(declare-fun e!531927 () Bool)

(declare-datatypes ((V!32407 0))(
  ( (V!32408 (val!10341 Int)) )
))
(declare-datatypes ((ValueCell!9809 0))(
  ( (ValueCellFull!9809 (v!12870 V!32407)) (EmptyCell!9809) )
))
(declare-datatypes ((array!57181 0))(
  ( (array!57182 (arr!27511 (Array (_ BitVec 32) ValueCell!9809)) (size!27978 (_ BitVec 32))) )
))
(declare-datatypes ((array!57183 0))(
  ( (array!57184 (arr!27512 (Array (_ BitVec 32) (_ BitVec 64))) (size!27979 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4768 0))(
  ( (LongMapFixedSize!4769 (defaultEntry!5679 Int) (mask!27380 (_ BitVec 32)) (extraKeys!5411 (_ BitVec 32)) (zeroValue!5515 V!32407) (minValue!5515 V!32407) (_size!2439 (_ BitVec 32)) (_keys!10585 array!57183) (_values!5702 array!57181) (_vacant!2439 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4768)

(declare-fun tp_is_empty!20581 () Bool)

(declare-fun e!531925 () Bool)

(declare-fun array_inv!21456 (array!57183) Bool)

(declare-fun array_inv!21457 (array!57181) Bool)

(assert (=> b!945754 (= e!531925 (and tp!62729 tp_is_empty!20581 (array_inv!21456 (_keys!10585 thiss!1141)) (array_inv!21457 (_values!5702 thiss!1141)) e!531927))))

(declare-fun b!945755 () Bool)

(declare-fun res!635072 () Bool)

(declare-fun e!531931 () Bool)

(assert (=> b!945755 (=> res!635072 e!531931)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57183 (_ BitVec 32)) Bool)

(assert (=> b!945755 (= res!635072 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10585 thiss!1141) (mask!27380 thiss!1141))))))

(declare-fun res!635071 () Bool)

(declare-fun e!531926 () Bool)

(assert (=> start!80598 (=> (not res!635071) (not e!531926))))

(declare-fun valid!1830 (LongMapFixedSize!4768) Bool)

(assert (=> start!80598 (= res!635071 (valid!1830 thiss!1141))))

(assert (=> start!80598 e!531926))

(assert (=> start!80598 e!531925))

(assert (=> start!80598 true))

(declare-fun b!945756 () Bool)

(declare-fun e!531929 () Bool)

(assert (=> b!945756 (= e!531929 tp_is_empty!20581)))

(declare-fun b!945757 () Bool)

(assert (=> b!945757 (= e!531926 (not e!531931))))

(declare-fun res!635075 () Bool)

(assert (=> b!945757 (=> res!635075 e!531931)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945757 (= res!635075 (not (validMask!0 (mask!27380 thiss!1141))))))

(declare-fun lt!426130 () (_ BitVec 32))

(assert (=> b!945757 (arrayForallSeekEntryOrOpenFound!0 lt!426130 (_keys!10585 thiss!1141) (mask!27380 thiss!1141))))

(declare-datatypes ((Unit!31846 0))(
  ( (Unit!31847) )
))
(declare-fun lt!426127 () Unit!31846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31846)

(assert (=> b!945757 (= lt!426127 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10585 thiss!1141) (mask!27380 thiss!1141) #b00000000000000000000000000000000 lt!426130))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57183 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945757 (= lt!426130 (arrayScanForKey!0 (_keys!10585 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945757 (arrayContainsKey!0 (_keys!10585 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426128 () Unit!31846)

(declare-fun lemmaKeyInListMapIsInArray!314 (array!57183 array!57181 (_ BitVec 32) (_ BitVec 32) V!32407 V!32407 (_ BitVec 64) Int) Unit!31846)

(assert (=> b!945757 (= lt!426128 (lemmaKeyInListMapIsInArray!314 (_keys!10585 thiss!1141) (_values!5702 thiss!1141) (mask!27380 thiss!1141) (extraKeys!5411 thiss!1141) (zeroValue!5515 thiss!1141) (minValue!5515 thiss!1141) key!756 (defaultEntry!5679 thiss!1141)))))

(declare-fun b!945758 () Bool)

(assert (=> b!945758 (= e!531931 true)))

(declare-datatypes ((SeekEntryResult!9038 0))(
  ( (MissingZero!9038 (index!38523 (_ BitVec 32))) (Found!9038 (index!38524 (_ BitVec 32))) (Intermediate!9038 (undefined!9850 Bool) (index!38525 (_ BitVec 32)) (x!81135 (_ BitVec 32))) (Undefined!9038) (MissingVacant!9038 (index!38526 (_ BitVec 32))) )
))
(declare-fun lt!426129 () SeekEntryResult!9038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57183 (_ BitVec 32)) SeekEntryResult!9038)

(assert (=> b!945758 (= lt!426129 (seekEntryOrOpen!0 key!756 (_keys!10585 thiss!1141) (mask!27380 thiss!1141)))))

(declare-fun b!945759 () Bool)

(declare-fun res!635068 () Bool)

(assert (=> b!945759 (=> (not res!635068) (not e!531926))))

(assert (=> b!945759 (= res!635068 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32697 () Bool)

(declare-fun mapRes!32697 () Bool)

(declare-fun tp!62730 () Bool)

(assert (=> mapNonEmpty!32697 (= mapRes!32697 (and tp!62730 e!531929))))

(declare-fun mapKey!32697 () (_ BitVec 32))

(declare-fun mapValue!32697 () ValueCell!9809)

(declare-fun mapRest!32697 () (Array (_ BitVec 32) ValueCell!9809))

(assert (=> mapNonEmpty!32697 (= (arr!27511 (_values!5702 thiss!1141)) (store mapRest!32697 mapKey!32697 mapValue!32697))))

(declare-fun mapIsEmpty!32697 () Bool)

(assert (=> mapIsEmpty!32697 mapRes!32697))

(declare-fun b!945760 () Bool)

(declare-fun res!635070 () Bool)

(assert (=> b!945760 (=> res!635070 e!531931)))

(assert (=> b!945760 (= res!635070 (not (= (size!27979 (_keys!10585 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27380 thiss!1141)))))))

(declare-fun b!945761 () Bool)

(declare-fun e!531930 () Bool)

(assert (=> b!945761 (= e!531927 (and e!531930 mapRes!32697))))

(declare-fun condMapEmpty!32697 () Bool)

(declare-fun mapDefault!32697 () ValueCell!9809)

(assert (=> b!945761 (= condMapEmpty!32697 (= (arr!27511 (_values!5702 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9809)) mapDefault!32697)))))

(declare-fun b!945762 () Bool)

(assert (=> b!945762 (= e!531930 tp_is_empty!20581)))

(declare-fun b!945763 () Bool)

(declare-fun res!635074 () Bool)

(assert (=> b!945763 (=> (not res!635074) (not e!531926))))

(declare-datatypes ((tuple2!13476 0))(
  ( (tuple2!13477 (_1!6749 (_ BitVec 64)) (_2!6749 V!32407)) )
))
(declare-datatypes ((List!19267 0))(
  ( (Nil!19264) (Cons!19263 (h!20420 tuple2!13476) (t!27576 List!19267)) )
))
(declare-datatypes ((ListLongMap!12175 0))(
  ( (ListLongMap!12176 (toList!6103 List!19267)) )
))
(declare-fun contains!5186 (ListLongMap!12175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3337 (array!57183 array!57181 (_ BitVec 32) (_ BitVec 32) V!32407 V!32407 (_ BitVec 32) Int) ListLongMap!12175)

(assert (=> b!945763 (= res!635074 (contains!5186 (getCurrentListMap!3337 (_keys!10585 thiss!1141) (_values!5702 thiss!1141) (mask!27380 thiss!1141) (extraKeys!5411 thiss!1141) (zeroValue!5515 thiss!1141) (minValue!5515 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5679 thiss!1141)) key!756))))

(declare-fun b!945764 () Bool)

(declare-fun res!635069 () Bool)

(assert (=> b!945764 (=> res!635069 e!531931)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945764 (= res!635069 (not (validKeyInArray!0 key!756)))))

(declare-fun b!945765 () Bool)

(declare-fun res!635073 () Bool)

(assert (=> b!945765 (=> (not res!635073) (not e!531926))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57183 (_ BitVec 32)) SeekEntryResult!9038)

(assert (=> b!945765 (= res!635073 (not ((_ is Found!9038) (seekEntry!0 key!756 (_keys!10585 thiss!1141) (mask!27380 thiss!1141)))))))

(assert (= (and start!80598 res!635071) b!945759))

(assert (= (and b!945759 res!635068) b!945765))

(assert (= (and b!945765 res!635073) b!945763))

(assert (= (and b!945763 res!635074) b!945757))

(assert (= (and b!945757 (not res!635075)) b!945760))

(assert (= (and b!945760 (not res!635070)) b!945755))

(assert (= (and b!945755 (not res!635072)) b!945764))

(assert (= (and b!945764 (not res!635069)) b!945758))

(assert (= (and b!945761 condMapEmpty!32697) mapIsEmpty!32697))

(assert (= (and b!945761 (not condMapEmpty!32697)) mapNonEmpty!32697))

(assert (= (and mapNonEmpty!32697 ((_ is ValueCellFull!9809) mapValue!32697)) b!945756))

(assert (= (and b!945761 ((_ is ValueCellFull!9809) mapDefault!32697)) b!945762))

(assert (= b!945754 b!945761))

(assert (= start!80598 b!945754))

(declare-fun m!880099 () Bool)

(assert (=> start!80598 m!880099))

(declare-fun m!880101 () Bool)

(assert (=> b!945757 m!880101))

(declare-fun m!880103 () Bool)

(assert (=> b!945757 m!880103))

(declare-fun m!880105 () Bool)

(assert (=> b!945757 m!880105))

(declare-fun m!880107 () Bool)

(assert (=> b!945757 m!880107))

(declare-fun m!880109 () Bool)

(assert (=> b!945757 m!880109))

(declare-fun m!880111 () Bool)

(assert (=> b!945757 m!880111))

(declare-fun m!880113 () Bool)

(assert (=> b!945754 m!880113))

(declare-fun m!880115 () Bool)

(assert (=> b!945754 m!880115))

(declare-fun m!880117 () Bool)

(assert (=> b!945763 m!880117))

(assert (=> b!945763 m!880117))

(declare-fun m!880119 () Bool)

(assert (=> b!945763 m!880119))

(declare-fun m!880121 () Bool)

(assert (=> b!945758 m!880121))

(declare-fun m!880123 () Bool)

(assert (=> b!945764 m!880123))

(declare-fun m!880125 () Bool)

(assert (=> b!945765 m!880125))

(declare-fun m!880127 () Bool)

(assert (=> mapNonEmpty!32697 m!880127))

(declare-fun m!880129 () Bool)

(assert (=> b!945755 m!880129))

(check-sat (not b_next!18073) (not b!945754) (not b!945758) (not start!80598) tp_is_empty!20581 (not b!945757) (not b!945763) b_and!29501 (not b!945764) (not b!945765) (not b!945755) (not mapNonEmpty!32697))
(check-sat b_and!29501 (not b_next!18073))
