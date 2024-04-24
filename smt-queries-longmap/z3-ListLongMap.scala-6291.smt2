; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80592 () Bool)

(assert start!80592)

(declare-fun b!945650 () Bool)

(declare-fun b_free!18067 () Bool)

(declare-fun b_next!18067 () Bool)

(assert (=> b!945650 (= b_free!18067 (not b_next!18067))))

(declare-fun tp!62712 () Bool)

(declare-fun b_and!29495 () Bool)

(assert (=> b!945650 (= tp!62712 b_and!29495)))

(declare-fun b!945646 () Bool)

(declare-fun res!635003 () Bool)

(declare-fun e!531868 () Bool)

(assert (=> b!945646 (=> res!635003 e!531868)))

(declare-datatypes ((V!32399 0))(
  ( (V!32400 (val!10338 Int)) )
))
(declare-datatypes ((ValueCell!9806 0))(
  ( (ValueCellFull!9806 (v!12867 V!32399)) (EmptyCell!9806) )
))
(declare-datatypes ((array!57169 0))(
  ( (array!57170 (arr!27505 (Array (_ BitVec 32) ValueCell!9806)) (size!27972 (_ BitVec 32))) )
))
(declare-datatypes ((array!57171 0))(
  ( (array!57172 (arr!27506 (Array (_ BitVec 32) (_ BitVec 64))) (size!27973 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4762 0))(
  ( (LongMapFixedSize!4763 (defaultEntry!5676 Int) (mask!27375 (_ BitVec 32)) (extraKeys!5408 (_ BitVec 32)) (zeroValue!5512 V!32399) (minValue!5512 V!32399) (_size!2436 (_ BitVec 32)) (_keys!10582 array!57171) (_values!5699 array!57169) (_vacant!2436 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4762)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57171 (_ BitVec 32)) Bool)

(assert (=> b!945646 (= res!635003 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10582 thiss!1141) (mask!27375 thiss!1141))))))

(declare-fun b!945647 () Bool)

(declare-fun res!634997 () Bool)

(declare-fun e!531866 () Bool)

(assert (=> b!945647 (=> (not res!634997) (not e!531866))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945647 (= res!634997 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945648 () Bool)

(declare-fun res!634998 () Bool)

(assert (=> b!945648 (=> (not res!634998) (not e!531866))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9035 0))(
  ( (MissingZero!9035 (index!38511 (_ BitVec 32))) (Found!9035 (index!38512 (_ BitVec 32))) (Intermediate!9035 (undefined!9847 Bool) (index!38513 (_ BitVec 32)) (x!81124 (_ BitVec 32))) (Undefined!9035) (MissingVacant!9035 (index!38514 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57171 (_ BitVec 32)) SeekEntryResult!9035)

(assert (=> b!945648 (= res!634998 (not ((_ is Found!9035) (seekEntry!0 key!756 (_keys!10582 thiss!1141) (mask!27375 thiss!1141)))))))

(declare-fun b!945649 () Bool)

(declare-fun e!531862 () Bool)

(declare-fun tp_is_empty!20575 () Bool)

(assert (=> b!945649 (= e!531862 tp_is_empty!20575)))

(declare-fun e!531865 () Bool)

(declare-fun e!531863 () Bool)

(declare-fun array_inv!21454 (array!57171) Bool)

(declare-fun array_inv!21455 (array!57169) Bool)

(assert (=> b!945650 (= e!531863 (and tp!62712 tp_is_empty!20575 (array_inv!21454 (_keys!10582 thiss!1141)) (array_inv!21455 (_values!5699 thiss!1141)) e!531865))))

(declare-fun res!635002 () Bool)

(assert (=> start!80592 (=> (not res!635002) (not e!531866))))

(declare-fun valid!1828 (LongMapFixedSize!4762) Bool)

(assert (=> start!80592 (= res!635002 (valid!1828 thiss!1141))))

(assert (=> start!80592 e!531866))

(assert (=> start!80592 e!531863))

(assert (=> start!80592 true))

(declare-fun b!945651 () Bool)

(assert (=> b!945651 (= e!531866 (not e!531868))))

(declare-fun res!634999 () Bool)

(assert (=> b!945651 (=> res!634999 e!531868)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945651 (= res!634999 (not (validMask!0 (mask!27375 thiss!1141))))))

(declare-fun lt!426094 () (_ BitVec 32))

(assert (=> b!945651 (arrayForallSeekEntryOrOpenFound!0 lt!426094 (_keys!10582 thiss!1141) (mask!27375 thiss!1141))))

(declare-datatypes ((Unit!31844 0))(
  ( (Unit!31845) )
))
(declare-fun lt!426092 () Unit!31844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31844)

(assert (=> b!945651 (= lt!426092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10582 thiss!1141) (mask!27375 thiss!1141) #b00000000000000000000000000000000 lt!426094))))

(declare-fun arrayScanForKey!0 (array!57171 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945651 (= lt!426094 (arrayScanForKey!0 (_keys!10582 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945651 (arrayContainsKey!0 (_keys!10582 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426091 () Unit!31844)

(declare-fun lemmaKeyInListMapIsInArray!313 (array!57171 array!57169 (_ BitVec 32) (_ BitVec 32) V!32399 V!32399 (_ BitVec 64) Int) Unit!31844)

(assert (=> b!945651 (= lt!426091 (lemmaKeyInListMapIsInArray!313 (_keys!10582 thiss!1141) (_values!5699 thiss!1141) (mask!27375 thiss!1141) (extraKeys!5408 thiss!1141) (zeroValue!5512 thiss!1141) (minValue!5512 thiss!1141) key!756 (defaultEntry!5676 thiss!1141)))))

(declare-fun mapNonEmpty!32688 () Bool)

(declare-fun mapRes!32688 () Bool)

(declare-fun tp!62711 () Bool)

(assert (=> mapNonEmpty!32688 (= mapRes!32688 (and tp!62711 e!531862))))

(declare-fun mapKey!32688 () (_ BitVec 32))

(declare-fun mapRest!32688 () (Array (_ BitVec 32) ValueCell!9806))

(declare-fun mapValue!32688 () ValueCell!9806)

(assert (=> mapNonEmpty!32688 (= (arr!27505 (_values!5699 thiss!1141)) (store mapRest!32688 mapKey!32688 mapValue!32688))))

(declare-fun b!945652 () Bool)

(declare-fun res!635000 () Bool)

(assert (=> b!945652 (=> (not res!635000) (not e!531866))))

(declare-datatypes ((tuple2!13472 0))(
  ( (tuple2!13473 (_1!6747 (_ BitVec 64)) (_2!6747 V!32399)) )
))
(declare-datatypes ((List!19265 0))(
  ( (Nil!19262) (Cons!19261 (h!20418 tuple2!13472) (t!27574 List!19265)) )
))
(declare-datatypes ((ListLongMap!12171 0))(
  ( (ListLongMap!12172 (toList!6101 List!19265)) )
))
(declare-fun contains!5184 (ListLongMap!12171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3335 (array!57171 array!57169 (_ BitVec 32) (_ BitVec 32) V!32399 V!32399 (_ BitVec 32) Int) ListLongMap!12171)

(assert (=> b!945652 (= res!635000 (contains!5184 (getCurrentListMap!3335 (_keys!10582 thiss!1141) (_values!5699 thiss!1141) (mask!27375 thiss!1141) (extraKeys!5408 thiss!1141) (zeroValue!5512 thiss!1141) (minValue!5512 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5676 thiss!1141)) key!756))))

(declare-fun b!945653 () Bool)

(declare-fun res!635001 () Bool)

(assert (=> b!945653 (=> res!635001 e!531868)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945653 (= res!635001 (not (validKeyInArray!0 key!756)))))

(declare-fun b!945654 () Bool)

(assert (=> b!945654 (= e!531868 true)))

(declare-fun lt!426093 () SeekEntryResult!9035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57171 (_ BitVec 32)) SeekEntryResult!9035)

(assert (=> b!945654 (= lt!426093 (seekEntryOrOpen!0 key!756 (_keys!10582 thiss!1141) (mask!27375 thiss!1141)))))

(declare-fun b!945655 () Bool)

(declare-fun e!531867 () Bool)

(assert (=> b!945655 (= e!531865 (and e!531867 mapRes!32688))))

(declare-fun condMapEmpty!32688 () Bool)

(declare-fun mapDefault!32688 () ValueCell!9806)

(assert (=> b!945655 (= condMapEmpty!32688 (= (arr!27505 (_values!5699 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9806)) mapDefault!32688)))))

(declare-fun mapIsEmpty!32688 () Bool)

(assert (=> mapIsEmpty!32688 mapRes!32688))

(declare-fun b!945656 () Bool)

(assert (=> b!945656 (= e!531867 tp_is_empty!20575)))

(declare-fun b!945657 () Bool)

(declare-fun res!634996 () Bool)

(assert (=> b!945657 (=> res!634996 e!531868)))

(assert (=> b!945657 (= res!634996 (not (= (size!27973 (_keys!10582 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27375 thiss!1141)))))))

(assert (= (and start!80592 res!635002) b!945647))

(assert (= (and b!945647 res!634997) b!945648))

(assert (= (and b!945648 res!634998) b!945652))

(assert (= (and b!945652 res!635000) b!945651))

(assert (= (and b!945651 (not res!634999)) b!945657))

(assert (= (and b!945657 (not res!634996)) b!945646))

(assert (= (and b!945646 (not res!635003)) b!945653))

(assert (= (and b!945653 (not res!635001)) b!945654))

(assert (= (and b!945655 condMapEmpty!32688) mapIsEmpty!32688))

(assert (= (and b!945655 (not condMapEmpty!32688)) mapNonEmpty!32688))

(assert (= (and mapNonEmpty!32688 ((_ is ValueCellFull!9806) mapValue!32688)) b!945649))

(assert (= (and b!945655 ((_ is ValueCellFull!9806) mapDefault!32688)) b!945656))

(assert (= b!945650 b!945655))

(assert (= start!80592 b!945650))

(declare-fun m!880003 () Bool)

(assert (=> b!945650 m!880003))

(declare-fun m!880005 () Bool)

(assert (=> b!945650 m!880005))

(declare-fun m!880007 () Bool)

(assert (=> start!80592 m!880007))

(declare-fun m!880009 () Bool)

(assert (=> b!945652 m!880009))

(assert (=> b!945652 m!880009))

(declare-fun m!880011 () Bool)

(assert (=> b!945652 m!880011))

(declare-fun m!880013 () Bool)

(assert (=> mapNonEmpty!32688 m!880013))

(declare-fun m!880015 () Bool)

(assert (=> b!945651 m!880015))

(declare-fun m!880017 () Bool)

(assert (=> b!945651 m!880017))

(declare-fun m!880019 () Bool)

(assert (=> b!945651 m!880019))

(declare-fun m!880021 () Bool)

(assert (=> b!945651 m!880021))

(declare-fun m!880023 () Bool)

(assert (=> b!945651 m!880023))

(declare-fun m!880025 () Bool)

(assert (=> b!945651 m!880025))

(declare-fun m!880027 () Bool)

(assert (=> b!945653 m!880027))

(declare-fun m!880029 () Bool)

(assert (=> b!945648 m!880029))

(declare-fun m!880031 () Bool)

(assert (=> b!945646 m!880031))

(declare-fun m!880033 () Bool)

(assert (=> b!945654 m!880033))

(check-sat (not b!945651) b_and!29495 (not b!945653) (not mapNonEmpty!32688) tp_is_empty!20575 (not b!945650) (not b_next!18067) (not b!945654) (not start!80592) (not b!945646) (not b!945648) (not b!945652))
(check-sat b_and!29495 (not b_next!18067))
