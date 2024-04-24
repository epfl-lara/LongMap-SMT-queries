; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89672 () Bool)

(assert start!89672)

(declare-fun b!1026900 () Bool)

(declare-fun b_free!20437 () Bool)

(declare-fun b_next!20437 () Bool)

(assert (=> b!1026900 (= b_free!20437 (not b_next!20437))))

(declare-fun tp!72357 () Bool)

(declare-fun b_and!32693 () Bool)

(assert (=> b!1026900 (= tp!72357 b_and!32693)))

(declare-fun b!1026899 () Bool)

(declare-fun res!687138 () Bool)

(declare-fun e!579143 () Bool)

(assert (=> b!1026899 (=> res!687138 e!579143)))

(declare-datatypes ((V!37083 0))(
  ( (V!37084 (val!12129 Int)) )
))
(declare-datatypes ((ValueCell!11375 0))(
  ( (ValueCellFull!11375 (v!14694 V!37083)) (EmptyCell!11375) )
))
(declare-datatypes ((array!64413 0))(
  ( (array!64414 (arr!31009 (Array (_ BitVec 32) (_ BitVec 64))) (size!31523 (_ BitVec 32))) )
))
(declare-datatypes ((array!64415 0))(
  ( (array!64416 (arr!31010 (Array (_ BitVec 32) ValueCell!11375)) (size!31524 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5344 0))(
  ( (LongMapFixedSize!5345 (defaultEntry!6024 Int) (mask!29758 (_ BitVec 32)) (extraKeys!5756 (_ BitVec 32)) (zeroValue!5860 V!37083) (minValue!5860 V!37083) (_size!2727 (_ BitVec 32)) (_keys!11209 array!64413) (_values!6047 array!64415) (_vacant!2727 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5344)

(declare-datatypes ((SeekEntryResult!9578 0))(
  ( (MissingZero!9578 (index!40683 (_ BitVec 32))) (Found!9578 (index!40684 (_ BitVec 32))) (Intermediate!9578 (undefined!10390 Bool) (index!40685 (_ BitVec 32)) (x!91182 (_ BitVec 32))) (Undefined!9578) (MissingVacant!9578 (index!40686 (_ BitVec 32))) )
))
(declare-fun lt!451519 () SeekEntryResult!9578)

(assert (=> b!1026899 (= res!687138 (or (not (= (size!31523 (_keys!11209 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29758 thiss!1427)))) (bvslt (index!40684 lt!451519) #b00000000000000000000000000000000) (bvsge (index!40684 lt!451519) (size!31523 (_keys!11209 thiss!1427)))))))

(declare-fun mapNonEmpty!37664 () Bool)

(declare-fun mapRes!37664 () Bool)

(declare-fun tp!72356 () Bool)

(declare-fun e!579142 () Bool)

(assert (=> mapNonEmpty!37664 (= mapRes!37664 (and tp!72356 e!579142))))

(declare-fun mapKey!37664 () (_ BitVec 32))

(declare-fun mapRest!37664 () (Array (_ BitVec 32) ValueCell!11375))

(declare-fun mapValue!37664 () ValueCell!11375)

(assert (=> mapNonEmpty!37664 (= (arr!31010 (_values!6047 thiss!1427)) (store mapRest!37664 mapKey!37664 mapValue!37664))))

(declare-fun e!579145 () Bool)

(declare-fun e!579138 () Bool)

(declare-fun tp_is_empty!24157 () Bool)

(declare-fun array_inv!24035 (array!64413) Bool)

(declare-fun array_inv!24036 (array!64415) Bool)

(assert (=> b!1026900 (= e!579145 (and tp!72357 tp_is_empty!24157 (array_inv!24035 (_keys!11209 thiss!1427)) (array_inv!24036 (_values!6047 thiss!1427)) e!579138))))

(declare-fun b!1026901 () Bool)

(assert (=> b!1026901 (= e!579142 tp_is_empty!24157)))

(declare-fun b!1026903 () Bool)

(assert (=> b!1026903 (= e!579143 true)))

(declare-fun lt!451521 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64413 (_ BitVec 32)) Bool)

(assert (=> b!1026903 (= lt!451521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11209 thiss!1427) (mask!29758 thiss!1427)))))

(declare-fun b!1026904 () Bool)

(declare-fun res!687134 () Bool)

(assert (=> b!1026904 (=> res!687134 e!579143)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1026904 (= res!687134 (not (validKeyInArray!0 (select (arr!31009 (_keys!11209 thiss!1427)) (index!40684 lt!451519)))))))

(declare-fun b!1026905 () Bool)

(declare-fun e!579140 () Bool)

(declare-fun e!579144 () Bool)

(assert (=> b!1026905 (= e!579140 e!579144)))

(declare-fun res!687135 () Bool)

(assert (=> b!1026905 (=> (not res!687135) (not e!579144))))

(get-info :version)

(assert (=> b!1026905 (= res!687135 ((_ is Found!9578) lt!451519))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64413 (_ BitVec 32)) SeekEntryResult!9578)

(assert (=> b!1026905 (= lt!451519 (seekEntry!0 key!909 (_keys!11209 thiss!1427) (mask!29758 thiss!1427)))))

(declare-fun b!1026906 () Bool)

(assert (=> b!1026906 (= e!579144 (not e!579143))))

(declare-fun res!687140 () Bool)

(assert (=> b!1026906 (=> res!687140 e!579143)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026906 (= res!687140 (not (validMask!0 (mask!29758 thiss!1427))))))

(declare-fun lt!451523 () array!64413)

(declare-datatypes ((List!21743 0))(
  ( (Nil!21740) (Cons!21739 (h!22946 (_ BitVec 64)) (t!30797 List!21743)) )
))
(declare-fun arrayNoDuplicates!0 (array!64413 (_ BitVec 32) List!21743) Bool)

(assert (=> b!1026906 (arrayNoDuplicates!0 lt!451523 #b00000000000000000000000000000000 Nil!21740)))

(declare-datatypes ((Unit!33406 0))(
  ( (Unit!33407) )
))
(declare-fun lt!451522 () Unit!33406)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21743) Unit!33406)

(assert (=> b!1026906 (= lt!451522 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11209 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40684 lt!451519) #b00000000000000000000000000000000 Nil!21740))))

(declare-fun arrayCountValidKeys!0 (array!64413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026906 (= (arrayCountValidKeys!0 lt!451523 #b00000000000000000000000000000000 (size!31523 (_keys!11209 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11209 thiss!1427) #b00000000000000000000000000000000 (size!31523 (_keys!11209 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026906 (= lt!451523 (array!64414 (store (arr!31009 (_keys!11209 thiss!1427)) (index!40684 lt!451519) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31523 (_keys!11209 thiss!1427))))))

(declare-fun lt!451520 () Unit!33406)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64413 (_ BitVec 32) (_ BitVec 64)) Unit!33406)

(assert (=> b!1026906 (= lt!451520 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11209 thiss!1427) (index!40684 lt!451519) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026907 () Bool)

(declare-fun res!687137 () Bool)

(assert (=> b!1026907 (=> (not res!687137) (not e!579140))))

(assert (=> b!1026907 (= res!687137 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37664 () Bool)

(assert (=> mapIsEmpty!37664 mapRes!37664))

(declare-fun b!1026908 () Bool)

(declare-fun e!579141 () Bool)

(assert (=> b!1026908 (= e!579138 (and e!579141 mapRes!37664))))

(declare-fun condMapEmpty!37664 () Bool)

(declare-fun mapDefault!37664 () ValueCell!11375)

(assert (=> b!1026908 (= condMapEmpty!37664 (= (arr!31010 (_values!6047 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11375)) mapDefault!37664)))))

(declare-fun b!1026909 () Bool)

(declare-fun res!687139 () Bool)

(assert (=> b!1026909 (=> res!687139 e!579143)))

(assert (=> b!1026909 (= res!687139 (not (arrayNoDuplicates!0 (_keys!11209 thiss!1427) #b00000000000000000000000000000000 Nil!21740)))))

(declare-fun b!1026902 () Bool)

(assert (=> b!1026902 (= e!579141 tp_is_empty!24157)))

(declare-fun res!687136 () Bool)

(assert (=> start!89672 (=> (not res!687136) (not e!579140))))

(declare-fun valid!2037 (LongMapFixedSize!5344) Bool)

(assert (=> start!89672 (= res!687136 (valid!2037 thiss!1427))))

(assert (=> start!89672 e!579140))

(assert (=> start!89672 e!579145))

(assert (=> start!89672 true))

(assert (= (and start!89672 res!687136) b!1026907))

(assert (= (and b!1026907 res!687137) b!1026905))

(assert (= (and b!1026905 res!687135) b!1026906))

(assert (= (and b!1026906 (not res!687140)) b!1026899))

(assert (= (and b!1026899 (not res!687138)) b!1026904))

(assert (= (and b!1026904 (not res!687134)) b!1026909))

(assert (= (and b!1026909 (not res!687139)) b!1026903))

(assert (= (and b!1026908 condMapEmpty!37664) mapIsEmpty!37664))

(assert (= (and b!1026908 (not condMapEmpty!37664)) mapNonEmpty!37664))

(assert (= (and mapNonEmpty!37664 ((_ is ValueCellFull!11375) mapValue!37664)) b!1026901))

(assert (= (and b!1026908 ((_ is ValueCellFull!11375) mapDefault!37664)) b!1026902))

(assert (= b!1026900 b!1026908))

(assert (= start!89672 b!1026900))

(declare-fun m!945423 () Bool)

(assert (=> b!1026903 m!945423))

(declare-fun m!945425 () Bool)

(assert (=> mapNonEmpty!37664 m!945425))

(declare-fun m!945427 () Bool)

(assert (=> start!89672 m!945427))

(declare-fun m!945429 () Bool)

(assert (=> b!1026909 m!945429))

(declare-fun m!945431 () Bool)

(assert (=> b!1026906 m!945431))

(declare-fun m!945433 () Bool)

(assert (=> b!1026906 m!945433))

(declare-fun m!945435 () Bool)

(assert (=> b!1026906 m!945435))

(declare-fun m!945437 () Bool)

(assert (=> b!1026906 m!945437))

(declare-fun m!945439 () Bool)

(assert (=> b!1026906 m!945439))

(declare-fun m!945441 () Bool)

(assert (=> b!1026906 m!945441))

(declare-fun m!945443 () Bool)

(assert (=> b!1026906 m!945443))

(declare-fun m!945445 () Bool)

(assert (=> b!1026900 m!945445))

(declare-fun m!945447 () Bool)

(assert (=> b!1026900 m!945447))

(declare-fun m!945449 () Bool)

(assert (=> b!1026905 m!945449))

(declare-fun m!945451 () Bool)

(assert (=> b!1026904 m!945451))

(assert (=> b!1026904 m!945451))

(declare-fun m!945453 () Bool)

(assert (=> b!1026904 m!945453))

(check-sat (not mapNonEmpty!37664) (not b_next!20437) (not b!1026904) (not b!1026903) (not start!89672) b_and!32693 tp_is_empty!24157 (not b!1026905) (not b!1026909) (not b!1026900) (not b!1026906))
(check-sat b_and!32693 (not b_next!20437))
