; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89780 () Bool)

(assert start!89780)

(declare-fun b!1028438 () Bool)

(declare-fun b_free!20545 () Bool)

(declare-fun b_next!20545 () Bool)

(assert (=> b!1028438 (= b_free!20545 (not b_next!20545))))

(declare-fun tp!72680 () Bool)

(declare-fun b_and!32801 () Bool)

(assert (=> b!1028438 (= tp!72680 b_and!32801)))

(declare-fun b!1028436 () Bool)

(declare-fun e!580439 () Bool)

(declare-fun tp_is_empty!24265 () Bool)

(assert (=> b!1028436 (= e!580439 tp_is_empty!24265)))

(declare-fun b!1028437 () Bool)

(declare-fun e!580435 () Bool)

(declare-fun e!580437 () Bool)

(declare-fun mapRes!37826 () Bool)

(assert (=> b!1028437 (= e!580435 (and e!580437 mapRes!37826))))

(declare-fun condMapEmpty!37826 () Bool)

(declare-datatypes ((V!37227 0))(
  ( (V!37228 (val!12183 Int)) )
))
(declare-datatypes ((ValueCell!11429 0))(
  ( (ValueCellFull!11429 (v!14748 V!37227)) (EmptyCell!11429) )
))
(declare-datatypes ((array!64629 0))(
  ( (array!64630 (arr!31117 (Array (_ BitVec 32) (_ BitVec 64))) (size!31631 (_ BitVec 32))) )
))
(declare-datatypes ((array!64631 0))(
  ( (array!64632 (arr!31118 (Array (_ BitVec 32) ValueCell!11429)) (size!31632 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5452 0))(
  ( (LongMapFixedSize!5453 (defaultEntry!6078 Int) (mask!29848 (_ BitVec 32)) (extraKeys!5810 (_ BitVec 32)) (zeroValue!5914 V!37227) (minValue!5914 V!37227) (_size!2781 (_ BitVec 32)) (_keys!11263 array!64629) (_values!6101 array!64631) (_vacant!2781 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5452)

(declare-fun mapDefault!37826 () ValueCell!11429)

(assert (=> b!1028437 (= condMapEmpty!37826 (= (arr!31118 (_values!6101 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11429)) mapDefault!37826)))))

(declare-fun e!580441 () Bool)

(declare-fun array_inv!24103 (array!64629) Bool)

(declare-fun array_inv!24104 (array!64631) Bool)

(assert (=> b!1028438 (= e!580441 (and tp!72680 tp_is_empty!24265 (array_inv!24103 (_keys!11263 thiss!1427)) (array_inv!24104 (_values!6101 thiss!1427)) e!580435))))

(declare-fun b!1028439 () Bool)

(declare-fun res!688024 () Bool)

(declare-fun e!580438 () Bool)

(assert (=> b!1028439 (=> (not res!688024) (not e!580438))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1028439 (= res!688024 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37826 () Bool)

(assert (=> mapIsEmpty!37826 mapRes!37826))

(declare-fun b!1028440 () Bool)

(declare-fun e!580440 () Bool)

(assert (=> b!1028440 (= e!580440 true)))

(declare-fun lt!452554 () Bool)

(declare-datatypes ((List!21784 0))(
  ( (Nil!21781) (Cons!21780 (h!22987 (_ BitVec 64)) (t!30838 List!21784)) )
))
(declare-fun arrayNoDuplicates!0 (array!64629 (_ BitVec 32) List!21784) Bool)

(assert (=> b!1028440 (= lt!452554 (arrayNoDuplicates!0 (_keys!11263 thiss!1427) #b00000000000000000000000000000000 Nil!21781))))

(declare-fun b!1028441 () Bool)

(assert (=> b!1028441 (= e!580437 tp_is_empty!24265)))

(declare-fun b!1028442 () Bool)

(declare-fun e!580434 () Bool)

(assert (=> b!1028442 (= e!580434 (not e!580440))))

(declare-fun res!688025 () Bool)

(assert (=> b!1028442 (=> res!688025 e!580440)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028442 (= res!688025 (not (validMask!0 (mask!29848 thiss!1427))))))

(declare-fun lt!452552 () array!64629)

(declare-fun arrayContainsKey!0 (array!64629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028442 (not (arrayContainsKey!0 lt!452552 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33478 0))(
  ( (Unit!33479) )
))
(declare-fun lt!452550 () Unit!33478)

(declare-datatypes ((SeekEntryResult!9618 0))(
  ( (MissingZero!9618 (index!40843 (_ BitVec 32))) (Found!9618 (index!40844 (_ BitVec 32))) (Intermediate!9618 (undefined!10430 Bool) (index!40845 (_ BitVec 32)) (x!91366 (_ BitVec 32))) (Undefined!9618) (MissingVacant!9618 (index!40846 (_ BitVec 32))) )
))
(declare-fun lt!452549 () SeekEntryResult!9618)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64629 (_ BitVec 32) (_ BitVec 64)) Unit!33478)

(assert (=> b!1028442 (= lt!452550 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11263 thiss!1427) (index!40844 lt!452549) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64629 (_ BitVec 32)) Bool)

(assert (=> b!1028442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452552 (mask!29848 thiss!1427))))

(declare-fun lt!452555 () Unit!33478)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64629 (_ BitVec 32) (_ BitVec 32)) Unit!33478)

(assert (=> b!1028442 (= lt!452555 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11263 thiss!1427) (index!40844 lt!452549) (mask!29848 thiss!1427)))))

(assert (=> b!1028442 (arrayNoDuplicates!0 lt!452552 #b00000000000000000000000000000000 Nil!21781)))

(declare-fun lt!452551 () Unit!33478)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21784) Unit!33478)

(assert (=> b!1028442 (= lt!452551 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11263 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40844 lt!452549) #b00000000000000000000000000000000 Nil!21781))))

(declare-fun arrayCountValidKeys!0 (array!64629 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028442 (= (arrayCountValidKeys!0 lt!452552 #b00000000000000000000000000000000 (size!31631 (_keys!11263 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11263 thiss!1427) #b00000000000000000000000000000000 (size!31631 (_keys!11263 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028442 (= lt!452552 (array!64630 (store (arr!31117 (_keys!11263 thiss!1427)) (index!40844 lt!452549) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31631 (_keys!11263 thiss!1427))))))

(declare-fun lt!452553 () Unit!33478)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64629 (_ BitVec 32) (_ BitVec 64)) Unit!33478)

(assert (=> b!1028442 (= lt!452553 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11263 thiss!1427) (index!40844 lt!452549) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028443 () Bool)

(declare-fun res!688027 () Bool)

(assert (=> b!1028443 (=> res!688027 e!580440)))

(assert (=> b!1028443 (= res!688027 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11263 thiss!1427) (mask!29848 thiss!1427))))))

(declare-fun b!1028444 () Bool)

(assert (=> b!1028444 (= e!580438 e!580434)))

(declare-fun res!688026 () Bool)

(assert (=> b!1028444 (=> (not res!688026) (not e!580434))))

(get-info :version)

(assert (=> b!1028444 (= res!688026 ((_ is Found!9618) lt!452549))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64629 (_ BitVec 32)) SeekEntryResult!9618)

(assert (=> b!1028444 (= lt!452549 (seekEntry!0 key!909 (_keys!11263 thiss!1427) (mask!29848 thiss!1427)))))

(declare-fun b!1028445 () Bool)

(declare-fun res!688028 () Bool)

(assert (=> b!1028445 (=> res!688028 e!580440)))

(assert (=> b!1028445 (= res!688028 (or (not (= (size!31632 (_values!6101 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29848 thiss!1427)))) (not (= (size!31631 (_keys!11263 thiss!1427)) (size!31632 (_values!6101 thiss!1427)))) (bvslt (mask!29848 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5810 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5810 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37826 () Bool)

(declare-fun tp!72681 () Bool)

(assert (=> mapNonEmpty!37826 (= mapRes!37826 (and tp!72681 e!580439))))

(declare-fun mapRest!37826 () (Array (_ BitVec 32) ValueCell!11429))

(declare-fun mapKey!37826 () (_ BitVec 32))

(declare-fun mapValue!37826 () ValueCell!11429)

(assert (=> mapNonEmpty!37826 (= (arr!31118 (_values!6101 thiss!1427)) (store mapRest!37826 mapKey!37826 mapValue!37826))))

(declare-fun res!688023 () Bool)

(assert (=> start!89780 (=> (not res!688023) (not e!580438))))

(declare-fun valid!2074 (LongMapFixedSize!5452) Bool)

(assert (=> start!89780 (= res!688023 (valid!2074 thiss!1427))))

(assert (=> start!89780 e!580438))

(assert (=> start!89780 e!580441))

(assert (=> start!89780 true))

(assert (= (and start!89780 res!688023) b!1028439))

(assert (= (and b!1028439 res!688024) b!1028444))

(assert (= (and b!1028444 res!688026) b!1028442))

(assert (= (and b!1028442 (not res!688025)) b!1028445))

(assert (= (and b!1028445 (not res!688028)) b!1028443))

(assert (= (and b!1028443 (not res!688027)) b!1028440))

(assert (= (and b!1028437 condMapEmpty!37826) mapIsEmpty!37826))

(assert (= (and b!1028437 (not condMapEmpty!37826)) mapNonEmpty!37826))

(assert (= (and mapNonEmpty!37826 ((_ is ValueCellFull!11429) mapValue!37826)) b!1028436))

(assert (= (and b!1028437 ((_ is ValueCellFull!11429) mapDefault!37826)) b!1028441))

(assert (= b!1028438 b!1028437))

(assert (= start!89780 b!1028438))

(declare-fun m!947187 () Bool)

(assert (=> start!89780 m!947187))

(declare-fun m!947189 () Bool)

(assert (=> b!1028444 m!947189))

(declare-fun m!947191 () Bool)

(assert (=> b!1028443 m!947191))

(declare-fun m!947193 () Bool)

(assert (=> b!1028438 m!947193))

(declare-fun m!947195 () Bool)

(assert (=> b!1028438 m!947195))

(declare-fun m!947197 () Bool)

(assert (=> mapNonEmpty!37826 m!947197))

(declare-fun m!947199 () Bool)

(assert (=> b!1028442 m!947199))

(declare-fun m!947201 () Bool)

(assert (=> b!1028442 m!947201))

(declare-fun m!947203 () Bool)

(assert (=> b!1028442 m!947203))

(declare-fun m!947205 () Bool)

(assert (=> b!1028442 m!947205))

(declare-fun m!947207 () Bool)

(assert (=> b!1028442 m!947207))

(declare-fun m!947209 () Bool)

(assert (=> b!1028442 m!947209))

(declare-fun m!947211 () Bool)

(assert (=> b!1028442 m!947211))

(declare-fun m!947213 () Bool)

(assert (=> b!1028442 m!947213))

(declare-fun m!947215 () Bool)

(assert (=> b!1028442 m!947215))

(declare-fun m!947217 () Bool)

(assert (=> b!1028442 m!947217))

(declare-fun m!947219 () Bool)

(assert (=> b!1028442 m!947219))

(declare-fun m!947221 () Bool)

(assert (=> b!1028440 m!947221))

(check-sat (not mapNonEmpty!37826) (not start!89780) (not b!1028438) (not b!1028444) b_and!32801 (not b!1028443) tp_is_empty!24265 (not b!1028442) (not b_next!20545) (not b!1028440))
(check-sat b_and!32801 (not b_next!20545))
