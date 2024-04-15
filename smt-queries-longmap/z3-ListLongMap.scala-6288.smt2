; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80388 () Bool)

(assert start!80388)

(declare-fun b!944182 () Bool)

(declare-fun b_free!18049 () Bool)

(declare-fun b_next!18049 () Bool)

(assert (=> b!944182 (= b_free!18049 (not b_next!18049))))

(declare-fun tp!62658 () Bool)

(declare-fun b_and!29441 () Bool)

(assert (=> b!944182 (= tp!62658 b_and!29441)))

(declare-fun mapNonEmpty!32661 () Bool)

(declare-fun mapRes!32661 () Bool)

(declare-fun tp!62657 () Bool)

(declare-fun e!530947 () Bool)

(assert (=> mapNonEmpty!32661 (= mapRes!32661 (and tp!62657 e!530947))))

(declare-datatypes ((V!32375 0))(
  ( (V!32376 (val!10329 Int)) )
))
(declare-datatypes ((ValueCell!9797 0))(
  ( (ValueCellFull!9797 (v!12860 V!32375)) (EmptyCell!9797) )
))
(declare-fun mapRest!32661 () (Array (_ BitVec 32) ValueCell!9797))

(declare-datatypes ((array!57047 0))(
  ( (array!57048 (arr!27449 (Array (_ BitVec 32) ValueCell!9797)) (size!27917 (_ BitVec 32))) )
))
(declare-datatypes ((array!57049 0))(
  ( (array!57050 (arr!27450 (Array (_ BitVec 32) (_ BitVec 64))) (size!27918 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4744 0))(
  ( (LongMapFixedSize!4745 (defaultEntry!5667 Int) (mask!27310 (_ BitVec 32)) (extraKeys!5399 (_ BitVec 32)) (zeroValue!5503 V!32375) (minValue!5503 V!32375) (_size!2427 (_ BitVec 32)) (_keys!10540 array!57049) (_values!5690 array!57047) (_vacant!2427 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4744)

(declare-fun mapValue!32661 () ValueCell!9797)

(declare-fun mapKey!32661 () (_ BitVec 32))

(assert (=> mapNonEmpty!32661 (= (arr!27449 (_values!5690 thiss!1141)) (store mapRest!32661 mapKey!32661 mapValue!32661))))

(declare-fun b!944180 () Bool)

(declare-fun res!634333 () Bool)

(declare-fun e!530944 () Bool)

(assert (=> b!944180 (=> (not res!634333) (not e!530944))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13526 0))(
  ( (tuple2!13527 (_1!6774 (_ BitVec 64)) (_2!6774 V!32375)) )
))
(declare-datatypes ((List!19278 0))(
  ( (Nil!19275) (Cons!19274 (h!20425 tuple2!13526) (t!27586 List!19278)) )
))
(declare-datatypes ((ListLongMap!12213 0))(
  ( (ListLongMap!12214 (toList!6122 List!19278)) )
))
(declare-fun contains!5137 (ListLongMap!12213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3285 (array!57049 array!57047 (_ BitVec 32) (_ BitVec 32) V!32375 V!32375 (_ BitVec 32) Int) ListLongMap!12213)

(assert (=> b!944180 (= res!634333 (contains!5137 (getCurrentListMap!3285 (_keys!10540 thiss!1141) (_values!5690 thiss!1141) (mask!27310 thiss!1141) (extraKeys!5399 thiss!1141) (zeroValue!5503 thiss!1141) (minValue!5503 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5667 thiss!1141)) key!756))))

(declare-fun b!944181 () Bool)

(declare-fun res!634328 () Bool)

(declare-fun e!530943 () Bool)

(assert (=> b!944181 (=> res!634328 e!530943)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57049 (_ BitVec 32)) Bool)

(assert (=> b!944181 (= res!634328 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10540 thiss!1141) (mask!27310 thiss!1141))))))

(declare-fun e!530949 () Bool)

(declare-fun e!530945 () Bool)

(declare-fun tp_is_empty!20557 () Bool)

(declare-fun array_inv!21378 (array!57049) Bool)

(declare-fun array_inv!21379 (array!57047) Bool)

(assert (=> b!944182 (= e!530945 (and tp!62658 tp_is_empty!20557 (array_inv!21378 (_keys!10540 thiss!1141)) (array_inv!21379 (_values!5690 thiss!1141)) e!530949))))

(declare-fun b!944183 () Bool)

(assert (=> b!944183 (= e!530943 true)))

(declare-datatypes ((SeekEntryResult!9066 0))(
  ( (MissingZero!9066 (index!38635 (_ BitVec 32))) (Found!9066 (index!38636 (_ BitVec 32))) (Intermediate!9066 (undefined!9878 Bool) (index!38637 (_ BitVec 32)) (x!81112 (_ BitVec 32))) (Undefined!9066) (MissingVacant!9066 (index!38638 (_ BitVec 32))) )
))
(declare-fun lt!425388 () SeekEntryResult!9066)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57049 (_ BitVec 32)) SeekEntryResult!9066)

(assert (=> b!944183 (= lt!425388 (seekEntryOrOpen!0 key!756 (_keys!10540 thiss!1141) (mask!27310 thiss!1141)))))

(declare-fun b!944184 () Bool)

(assert (=> b!944184 (= e!530947 tp_is_empty!20557)))

(declare-fun b!944185 () Bool)

(declare-fun res!634329 () Bool)

(assert (=> b!944185 (=> (not res!634329) (not e!530944))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57049 (_ BitVec 32)) SeekEntryResult!9066)

(assert (=> b!944185 (= res!634329 (not ((_ is Found!9066) (seekEntry!0 key!756 (_keys!10540 thiss!1141) (mask!27310 thiss!1141)))))))

(declare-fun b!944186 () Bool)

(assert (=> b!944186 (= e!530944 (not e!530943))))

(declare-fun res!634330 () Bool)

(assert (=> b!944186 (=> res!634330 e!530943)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944186 (= res!634330 (not (validMask!0 (mask!27310 thiss!1141))))))

(declare-fun lt!425389 () (_ BitVec 32))

(assert (=> b!944186 (arrayForallSeekEntryOrOpenFound!0 lt!425389 (_keys!10540 thiss!1141) (mask!27310 thiss!1141))))

(declare-datatypes ((Unit!31731 0))(
  ( (Unit!31732) )
))
(declare-fun lt!425386 () Unit!31731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31731)

(assert (=> b!944186 (= lt!425386 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10540 thiss!1141) (mask!27310 thiss!1141) #b00000000000000000000000000000000 lt!425389))))

(declare-fun arrayScanForKey!0 (array!57049 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944186 (= lt!425389 (arrayScanForKey!0 (_keys!10540 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944186 (arrayContainsKey!0 (_keys!10540 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425387 () Unit!31731)

(declare-fun lemmaKeyInListMapIsInArray!294 (array!57049 array!57047 (_ BitVec 32) (_ BitVec 32) V!32375 V!32375 (_ BitVec 64) Int) Unit!31731)

(assert (=> b!944186 (= lt!425387 (lemmaKeyInListMapIsInArray!294 (_keys!10540 thiss!1141) (_values!5690 thiss!1141) (mask!27310 thiss!1141) (extraKeys!5399 thiss!1141) (zeroValue!5503 thiss!1141) (minValue!5503 thiss!1141) key!756 (defaultEntry!5667 thiss!1141)))))

(declare-fun b!944187 () Bool)

(declare-fun res!634327 () Bool)

(assert (=> b!944187 (=> (not res!634327) (not e!530944))))

(assert (=> b!944187 (= res!634327 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944188 () Bool)

(declare-fun e!530946 () Bool)

(assert (=> b!944188 (= e!530946 tp_is_empty!20557)))

(declare-fun res!634332 () Bool)

(assert (=> start!80388 (=> (not res!634332) (not e!530944))))

(declare-fun valid!1814 (LongMapFixedSize!4744) Bool)

(assert (=> start!80388 (= res!634332 (valid!1814 thiss!1141))))

(assert (=> start!80388 e!530944))

(assert (=> start!80388 e!530945))

(assert (=> start!80388 true))

(declare-fun b!944189 () Bool)

(declare-fun res!634326 () Bool)

(assert (=> b!944189 (=> res!634326 e!530943)))

(assert (=> b!944189 (= res!634326 (not (= (size!27918 (_keys!10540 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27310 thiss!1141)))))))

(declare-fun b!944190 () Bool)

(assert (=> b!944190 (= e!530949 (and e!530946 mapRes!32661))))

(declare-fun condMapEmpty!32661 () Bool)

(declare-fun mapDefault!32661 () ValueCell!9797)

(assert (=> b!944190 (= condMapEmpty!32661 (= (arr!27449 (_values!5690 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9797)) mapDefault!32661)))))

(declare-fun mapIsEmpty!32661 () Bool)

(assert (=> mapIsEmpty!32661 mapRes!32661))

(declare-fun b!944191 () Bool)

(declare-fun res!634331 () Bool)

(assert (=> b!944191 (=> res!634331 e!530943)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944191 (= res!634331 (not (validKeyInArray!0 key!756)))))

(assert (= (and start!80388 res!634332) b!944187))

(assert (= (and b!944187 res!634327) b!944185))

(assert (= (and b!944185 res!634329) b!944180))

(assert (= (and b!944180 res!634333) b!944186))

(assert (= (and b!944186 (not res!634330)) b!944189))

(assert (= (and b!944189 (not res!634326)) b!944181))

(assert (= (and b!944181 (not res!634328)) b!944191))

(assert (= (and b!944191 (not res!634331)) b!944183))

(assert (= (and b!944190 condMapEmpty!32661) mapIsEmpty!32661))

(assert (= (and b!944190 (not condMapEmpty!32661)) mapNonEmpty!32661))

(assert (= (and mapNonEmpty!32661 ((_ is ValueCellFull!9797) mapValue!32661)) b!944184))

(assert (= (and b!944190 ((_ is ValueCellFull!9797) mapDefault!32661)) b!944188))

(assert (= b!944182 b!944190))

(assert (= start!80388 b!944182))

(declare-fun m!877663 () Bool)

(assert (=> b!944182 m!877663))

(declare-fun m!877665 () Bool)

(assert (=> b!944182 m!877665))

(declare-fun m!877667 () Bool)

(assert (=> b!944191 m!877667))

(declare-fun m!877669 () Bool)

(assert (=> mapNonEmpty!32661 m!877669))

(declare-fun m!877671 () Bool)

(assert (=> b!944185 m!877671))

(declare-fun m!877673 () Bool)

(assert (=> b!944181 m!877673))

(declare-fun m!877675 () Bool)

(assert (=> b!944186 m!877675))

(declare-fun m!877677 () Bool)

(assert (=> b!944186 m!877677))

(declare-fun m!877679 () Bool)

(assert (=> b!944186 m!877679))

(declare-fun m!877681 () Bool)

(assert (=> b!944186 m!877681))

(declare-fun m!877683 () Bool)

(assert (=> b!944186 m!877683))

(declare-fun m!877685 () Bool)

(assert (=> b!944186 m!877685))

(declare-fun m!877687 () Bool)

(assert (=> start!80388 m!877687))

(declare-fun m!877689 () Bool)

(assert (=> b!944183 m!877689))

(declare-fun m!877691 () Bool)

(assert (=> b!944180 m!877691))

(assert (=> b!944180 m!877691))

(declare-fun m!877693 () Bool)

(assert (=> b!944180 m!877693))

(check-sat (not b!944191) (not mapNonEmpty!32661) (not b!944185) (not b!944180) (not b!944181) (not b!944182) (not b!944183) (not b!944186) tp_is_empty!20557 (not start!80388) b_and!29441 (not b_next!18049))
(check-sat b_and!29441 (not b_next!18049))
