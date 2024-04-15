; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80406 () Bool)

(assert start!80406)

(declare-fun b!944514 () Bool)

(declare-fun b_free!18067 () Bool)

(declare-fun b_next!18067 () Bool)

(assert (=> b!944514 (= b_free!18067 (not b_next!18067))))

(declare-fun tp!62712 () Bool)

(declare-fun b_and!29459 () Bool)

(assert (=> b!944514 (= tp!62712 b_and!29459)))

(declare-fun b!944504 () Bool)

(declare-fun e!531138 () Bool)

(declare-fun e!531135 () Bool)

(declare-fun mapRes!32688 () Bool)

(assert (=> b!944504 (= e!531138 (and e!531135 mapRes!32688))))

(declare-fun condMapEmpty!32688 () Bool)

(declare-datatypes ((V!32399 0))(
  ( (V!32400 (val!10338 Int)) )
))
(declare-datatypes ((ValueCell!9806 0))(
  ( (ValueCellFull!9806 (v!12869 V!32399)) (EmptyCell!9806) )
))
(declare-datatypes ((array!57083 0))(
  ( (array!57084 (arr!27467 (Array (_ BitVec 32) ValueCell!9806)) (size!27935 (_ BitVec 32))) )
))
(declare-datatypes ((array!57085 0))(
  ( (array!57086 (arr!27468 (Array (_ BitVec 32) (_ BitVec 64))) (size!27936 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4762 0))(
  ( (LongMapFixedSize!4763 (defaultEntry!5676 Int) (mask!27325 (_ BitVec 32)) (extraKeys!5408 (_ BitVec 32)) (zeroValue!5512 V!32399) (minValue!5512 V!32399) (_size!2436 (_ BitVec 32)) (_keys!10549 array!57085) (_values!5699 array!57083) (_vacant!2436 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4762)

(declare-fun mapDefault!32688 () ValueCell!9806)

(assert (=> b!944504 (= condMapEmpty!32688 (= (arr!27467 (_values!5699 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9806)) mapDefault!32688)))))

(declare-fun b!944505 () Bool)

(declare-fun res!634542 () Bool)

(declare-fun e!531134 () Bool)

(assert (=> b!944505 (=> res!634542 e!531134)))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944505 (= res!634542 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944506 () Bool)

(declare-fun e!531133 () Bool)

(assert (=> b!944506 (= e!531133 (not e!531134))))

(declare-fun res!634548 () Bool)

(assert (=> b!944506 (=> res!634548 e!531134)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944506 (= res!634548 (not (validMask!0 (mask!27325 thiss!1141))))))

(declare-fun lt!425496 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57085 (_ BitVec 32)) Bool)

(assert (=> b!944506 (arrayForallSeekEntryOrOpenFound!0 lt!425496 (_keys!10549 thiss!1141) (mask!27325 thiss!1141))))

(declare-datatypes ((Unit!31739 0))(
  ( (Unit!31740) )
))
(declare-fun lt!425497 () Unit!31739)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31739)

(assert (=> b!944506 (= lt!425497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10549 thiss!1141) (mask!27325 thiss!1141) #b00000000000000000000000000000000 lt!425496))))

(declare-fun arrayScanForKey!0 (array!57085 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944506 (= lt!425496 (arrayScanForKey!0 (_keys!10549 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944506 (arrayContainsKey!0 (_keys!10549 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425494 () Unit!31739)

(declare-fun lemmaKeyInListMapIsInArray!298 (array!57085 array!57083 (_ BitVec 32) (_ BitVec 32) V!32399 V!32399 (_ BitVec 64) Int) Unit!31739)

(assert (=> b!944506 (= lt!425494 (lemmaKeyInListMapIsInArray!298 (_keys!10549 thiss!1141) (_values!5699 thiss!1141) (mask!27325 thiss!1141) (extraKeys!5408 thiss!1141) (zeroValue!5512 thiss!1141) (minValue!5512 thiss!1141) key!756 (defaultEntry!5676 thiss!1141)))))

(declare-fun b!944507 () Bool)

(declare-fun res!634549 () Bool)

(assert (=> b!944507 (=> (not res!634549) (not e!531133))))

(assert (=> b!944507 (= res!634549 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944508 () Bool)

(declare-fun res!634546 () Bool)

(assert (=> b!944508 (=> (not res!634546) (not e!531133))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9072 0))(
  ( (MissingZero!9072 (index!38659 (_ BitVec 32))) (Found!9072 (index!38660 (_ BitVec 32))) (Intermediate!9072 (undefined!9884 Bool) (index!38661 (_ BitVec 32)) (x!81142 (_ BitVec 32))) (Undefined!9072) (MissingVacant!9072 (index!38662 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57085 (_ BitVec 32)) SeekEntryResult!9072)

(assert (=> b!944508 (= res!634546 (not ((_ is Found!9072) (seekEntry!0 key!756 (_keys!10549 thiss!1141) (mask!27325 thiss!1141)))))))

(declare-fun b!944509 () Bool)

(assert (=> b!944509 (= e!531134 true)))

(declare-fun lt!425495 () SeekEntryResult!9072)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57085 (_ BitVec 32)) SeekEntryResult!9072)

(assert (=> b!944509 (= lt!425495 (seekEntryOrOpen!0 key!756 (_keys!10549 thiss!1141) (mask!27325 thiss!1141)))))

(declare-fun mapNonEmpty!32688 () Bool)

(declare-fun tp!62711 () Bool)

(declare-fun e!531137 () Bool)

(assert (=> mapNonEmpty!32688 (= mapRes!32688 (and tp!62711 e!531137))))

(declare-fun mapRest!32688 () (Array (_ BitVec 32) ValueCell!9806))

(declare-fun mapValue!32688 () ValueCell!9806)

(declare-fun mapKey!32688 () (_ BitVec 32))

(assert (=> mapNonEmpty!32688 (= (arr!27467 (_values!5699 thiss!1141)) (store mapRest!32688 mapKey!32688 mapValue!32688))))

(declare-fun mapIsEmpty!32688 () Bool)

(assert (=> mapIsEmpty!32688 mapRes!32688))

(declare-fun b!944511 () Bool)

(declare-fun res!634545 () Bool)

(assert (=> b!944511 (=> res!634545 e!531134)))

(assert (=> b!944511 (= res!634545 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10549 thiss!1141) (mask!27325 thiss!1141))))))

(declare-fun b!944512 () Bool)

(declare-fun res!634544 () Bool)

(assert (=> b!944512 (=> res!634544 e!531134)))

(assert (=> b!944512 (= res!634544 (not (= (size!27936 (_keys!10549 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27325 thiss!1141)))))))

(declare-fun b!944513 () Bool)

(declare-fun tp_is_empty!20575 () Bool)

(assert (=> b!944513 (= e!531135 tp_is_empty!20575)))

(declare-fun e!531132 () Bool)

(declare-fun array_inv!21394 (array!57085) Bool)

(declare-fun array_inv!21395 (array!57083) Bool)

(assert (=> b!944514 (= e!531132 (and tp!62712 tp_is_empty!20575 (array_inv!21394 (_keys!10549 thiss!1141)) (array_inv!21395 (_values!5699 thiss!1141)) e!531138))))

(declare-fun b!944515 () Bool)

(declare-fun res!634543 () Bool)

(assert (=> b!944515 (=> (not res!634543) (not e!531133))))

(declare-datatypes ((tuple2!13540 0))(
  ( (tuple2!13541 (_1!6781 (_ BitVec 64)) (_2!6781 V!32399)) )
))
(declare-datatypes ((List!19285 0))(
  ( (Nil!19282) (Cons!19281 (h!20432 tuple2!13540) (t!27593 List!19285)) )
))
(declare-datatypes ((ListLongMap!12227 0))(
  ( (ListLongMap!12228 (toList!6129 List!19285)) )
))
(declare-fun contains!5144 (ListLongMap!12227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3292 (array!57085 array!57083 (_ BitVec 32) (_ BitVec 32) V!32399 V!32399 (_ BitVec 32) Int) ListLongMap!12227)

(assert (=> b!944515 (= res!634543 (contains!5144 (getCurrentListMap!3292 (_keys!10549 thiss!1141) (_values!5699 thiss!1141) (mask!27325 thiss!1141) (extraKeys!5408 thiss!1141) (zeroValue!5512 thiss!1141) (minValue!5512 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5676 thiss!1141)) key!756))))

(declare-fun res!634547 () Bool)

(assert (=> start!80406 (=> (not res!634547) (not e!531133))))

(declare-fun valid!1821 (LongMapFixedSize!4762) Bool)

(assert (=> start!80406 (= res!634547 (valid!1821 thiss!1141))))

(assert (=> start!80406 e!531133))

(assert (=> start!80406 e!531132))

(assert (=> start!80406 true))

(declare-fun b!944510 () Bool)

(assert (=> b!944510 (= e!531137 tp_is_empty!20575)))

(assert (= (and start!80406 res!634547) b!944507))

(assert (= (and b!944507 res!634549) b!944508))

(assert (= (and b!944508 res!634546) b!944515))

(assert (= (and b!944515 res!634543) b!944506))

(assert (= (and b!944506 (not res!634548)) b!944512))

(assert (= (and b!944512 (not res!634544)) b!944511))

(assert (= (and b!944511 (not res!634545)) b!944505))

(assert (= (and b!944505 (not res!634542)) b!944509))

(assert (= (and b!944504 condMapEmpty!32688) mapIsEmpty!32688))

(assert (= (and b!944504 (not condMapEmpty!32688)) mapNonEmpty!32688))

(assert (= (and mapNonEmpty!32688 ((_ is ValueCellFull!9806) mapValue!32688)) b!944510))

(assert (= (and b!944504 ((_ is ValueCellFull!9806) mapDefault!32688)) b!944513))

(assert (= b!944514 b!944504))

(assert (= start!80406 b!944514))

(declare-fun m!877951 () Bool)

(assert (=> b!944511 m!877951))

(declare-fun m!877953 () Bool)

(assert (=> start!80406 m!877953))

(declare-fun m!877955 () Bool)

(assert (=> b!944509 m!877955))

(declare-fun m!877957 () Bool)

(assert (=> b!944514 m!877957))

(declare-fun m!877959 () Bool)

(assert (=> b!944514 m!877959))

(declare-fun m!877961 () Bool)

(assert (=> b!944505 m!877961))

(declare-fun m!877963 () Bool)

(assert (=> b!944508 m!877963))

(declare-fun m!877965 () Bool)

(assert (=> b!944515 m!877965))

(assert (=> b!944515 m!877965))

(declare-fun m!877967 () Bool)

(assert (=> b!944515 m!877967))

(declare-fun m!877969 () Bool)

(assert (=> mapNonEmpty!32688 m!877969))

(declare-fun m!877971 () Bool)

(assert (=> b!944506 m!877971))

(declare-fun m!877973 () Bool)

(assert (=> b!944506 m!877973))

(declare-fun m!877975 () Bool)

(assert (=> b!944506 m!877975))

(declare-fun m!877977 () Bool)

(assert (=> b!944506 m!877977))

(declare-fun m!877979 () Bool)

(assert (=> b!944506 m!877979))

(declare-fun m!877981 () Bool)

(assert (=> b!944506 m!877981))

(check-sat (not b!944509) (not b!944506) (not start!80406) (not mapNonEmpty!32688) (not b_next!18067) (not b!944514) b_and!29459 tp_is_empty!20575 (not b!944511) (not b!944515) (not b!944505) (not b!944508))
(check-sat b_and!29459 (not b_next!18067))
