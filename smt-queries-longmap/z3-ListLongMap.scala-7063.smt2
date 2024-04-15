; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89430 () Bool)

(assert start!89430)

(declare-fun b!1025335 () Bool)

(declare-fun b_free!20431 () Bool)

(declare-fun b_next!20431 () Bool)

(assert (=> b!1025335 (= b_free!20431 (not b_next!20431))))

(declare-fun tp!72338 () Bool)

(declare-fun b_and!32651 () Bool)

(assert (=> b!1025335 (= tp!72338 b_and!32651)))

(declare-fun b!1025334 () Bool)

(declare-fun res!686500 () Bool)

(declare-fun e!578132 () Bool)

(assert (=> b!1025334 (=> res!686500 e!578132)))

(declare-datatypes ((V!37075 0))(
  ( (V!37076 (val!12126 Int)) )
))
(declare-datatypes ((ValueCell!11372 0))(
  ( (ValueCellFull!11372 (v!14694 V!37075)) (EmptyCell!11372) )
))
(declare-datatypes ((array!64291 0))(
  ( (array!64292 (arr!30954 (Array (_ BitVec 32) (_ BitVec 64))) (size!31469 (_ BitVec 32))) )
))
(declare-datatypes ((array!64293 0))(
  ( (array!64294 (arr!30955 (Array (_ BitVec 32) ValueCell!11372)) (size!31470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5338 0))(
  ( (LongMapFixedSize!5339 (defaultEntry!6021 Int) (mask!29688 (_ BitVec 32)) (extraKeys!5753 (_ BitVec 32)) (zeroValue!5857 V!37075) (minValue!5857 V!37075) (_size!2724 (_ BitVec 32)) (_keys!11164 array!64291) (_values!6044 array!64293) (_vacant!2724 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5338)

(declare-datatypes ((List!21789 0))(
  ( (Nil!21786) (Cons!21785 (h!22983 (_ BitVec 64)) (t!30842 List!21789)) )
))
(declare-fun arrayNoDuplicates!0 (array!64291 (_ BitVec 32) List!21789) Bool)

(assert (=> b!1025334 (= res!686500 (not (arrayNoDuplicates!0 (_keys!11164 thiss!1427) #b00000000000000000000000000000000 Nil!21786)))))

(declare-fun tp_is_empty!24151 () Bool)

(declare-fun e!578137 () Bool)

(declare-fun e!578136 () Bool)

(declare-fun array_inv!23987 (array!64291) Bool)

(declare-fun array_inv!23988 (array!64293) Bool)

(assert (=> b!1025335 (= e!578137 (and tp!72338 tp_is_empty!24151 (array_inv!23987 (_keys!11164 thiss!1427)) (array_inv!23988 (_values!6044 thiss!1427)) e!578136))))

(declare-fun b!1025336 () Bool)

(assert (=> b!1025336 (= e!578132 true)))

(declare-fun lt!450762 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64291 (_ BitVec 32)) Bool)

(assert (=> b!1025336 (= lt!450762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11164 thiss!1427) (mask!29688 thiss!1427)))))

(declare-fun b!1025337 () Bool)

(declare-fun e!578138 () Bool)

(assert (=> b!1025337 (= e!578138 (not e!578132))))

(declare-fun res!686498 () Bool)

(assert (=> b!1025337 (=> res!686498 e!578132)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025337 (= res!686498 (not (validMask!0 (mask!29688 thiss!1427))))))

(declare-fun lt!450761 () array!64291)

(assert (=> b!1025337 (arrayNoDuplicates!0 lt!450761 #b00000000000000000000000000000000 Nil!21786)))

(declare-datatypes ((Unit!33293 0))(
  ( (Unit!33294) )
))
(declare-fun lt!450760 () Unit!33293)

(declare-datatypes ((SeekEntryResult!9614 0))(
  ( (MissingZero!9614 (index!40827 (_ BitVec 32))) (Found!9614 (index!40828 (_ BitVec 32))) (Intermediate!9614 (undefined!10426 Bool) (index!40829 (_ BitVec 32)) (x!91185 (_ BitVec 32))) (Undefined!9614) (MissingVacant!9614 (index!40830 (_ BitVec 32))) )
))
(declare-fun lt!450763 () SeekEntryResult!9614)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64291 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21789) Unit!33293)

(assert (=> b!1025337 (= lt!450760 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11164 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40828 lt!450763) #b00000000000000000000000000000000 Nil!21786))))

(declare-fun arrayCountValidKeys!0 (array!64291 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025337 (= (arrayCountValidKeys!0 lt!450761 #b00000000000000000000000000000000 (size!31469 (_keys!11164 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11164 thiss!1427) #b00000000000000000000000000000000 (size!31469 (_keys!11164 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025337 (= lt!450761 (array!64292 (store (arr!30954 (_keys!11164 thiss!1427)) (index!40828 lt!450763) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31469 (_keys!11164 thiss!1427))))))

(declare-fun lt!450759 () Unit!33293)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64291 (_ BitVec 32) (_ BitVec 64)) Unit!33293)

(assert (=> b!1025337 (= lt!450759 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11164 thiss!1427) (index!40828 lt!450763) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025339 () Bool)

(declare-fun res!686494 () Bool)

(declare-fun e!578133 () Bool)

(assert (=> b!1025339 (=> (not res!686494) (not e!578133))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025339 (= res!686494 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025340 () Bool)

(declare-fun res!686496 () Bool)

(assert (=> b!1025340 (=> res!686496 e!578132)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025340 (= res!686496 (not (validKeyInArray!0 (select (arr!30954 (_keys!11164 thiss!1427)) (index!40828 lt!450763)))))))

(declare-fun mapIsEmpty!37655 () Bool)

(declare-fun mapRes!37655 () Bool)

(assert (=> mapIsEmpty!37655 mapRes!37655))

(declare-fun mapNonEmpty!37655 () Bool)

(declare-fun tp!72339 () Bool)

(declare-fun e!578139 () Bool)

(assert (=> mapNonEmpty!37655 (= mapRes!37655 (and tp!72339 e!578139))))

(declare-fun mapKey!37655 () (_ BitVec 32))

(declare-fun mapValue!37655 () ValueCell!11372)

(declare-fun mapRest!37655 () (Array (_ BitVec 32) ValueCell!11372))

(assert (=> mapNonEmpty!37655 (= (arr!30955 (_values!6044 thiss!1427)) (store mapRest!37655 mapKey!37655 mapValue!37655))))

(declare-fun b!1025341 () Bool)

(declare-fun e!578135 () Bool)

(assert (=> b!1025341 (= e!578135 tp_is_empty!24151)))

(declare-fun b!1025342 () Bool)

(assert (=> b!1025342 (= e!578136 (and e!578135 mapRes!37655))))

(declare-fun condMapEmpty!37655 () Bool)

(declare-fun mapDefault!37655 () ValueCell!11372)

(assert (=> b!1025342 (= condMapEmpty!37655 (= (arr!30955 (_values!6044 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11372)) mapDefault!37655)))))

(declare-fun b!1025343 () Bool)

(declare-fun res!686495 () Bool)

(assert (=> b!1025343 (=> res!686495 e!578132)))

(assert (=> b!1025343 (= res!686495 (or (not (= (size!31469 (_keys!11164 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29688 thiss!1427)))) (bvslt (index!40828 lt!450763) #b00000000000000000000000000000000) (bvsge (index!40828 lt!450763) (size!31469 (_keys!11164 thiss!1427)))))))

(declare-fun b!1025344 () Bool)

(assert (=> b!1025344 (= e!578133 e!578138)))

(declare-fun res!686497 () Bool)

(assert (=> b!1025344 (=> (not res!686497) (not e!578138))))

(get-info :version)

(assert (=> b!1025344 (= res!686497 ((_ is Found!9614) lt!450763))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64291 (_ BitVec 32)) SeekEntryResult!9614)

(assert (=> b!1025344 (= lt!450763 (seekEntry!0 key!909 (_keys!11164 thiss!1427) (mask!29688 thiss!1427)))))

(declare-fun res!686499 () Bool)

(assert (=> start!89430 (=> (not res!686499) (not e!578133))))

(declare-fun valid!2025 (LongMapFixedSize!5338) Bool)

(assert (=> start!89430 (= res!686499 (valid!2025 thiss!1427))))

(assert (=> start!89430 e!578133))

(assert (=> start!89430 e!578137))

(assert (=> start!89430 true))

(declare-fun b!1025338 () Bool)

(assert (=> b!1025338 (= e!578139 tp_is_empty!24151)))

(assert (= (and start!89430 res!686499) b!1025339))

(assert (= (and b!1025339 res!686494) b!1025344))

(assert (= (and b!1025344 res!686497) b!1025337))

(assert (= (and b!1025337 (not res!686498)) b!1025343))

(assert (= (and b!1025343 (not res!686495)) b!1025340))

(assert (= (and b!1025340 (not res!686496)) b!1025334))

(assert (= (and b!1025334 (not res!686500)) b!1025336))

(assert (= (and b!1025342 condMapEmpty!37655) mapIsEmpty!37655))

(assert (= (and b!1025342 (not condMapEmpty!37655)) mapNonEmpty!37655))

(assert (= (and mapNonEmpty!37655 ((_ is ValueCellFull!11372) mapValue!37655)) b!1025338))

(assert (= (and b!1025342 ((_ is ValueCellFull!11372) mapDefault!37655)) b!1025341))

(assert (= b!1025335 b!1025342))

(assert (= start!89430 b!1025335))

(declare-fun m!943043 () Bool)

(assert (=> b!1025344 m!943043))

(declare-fun m!943045 () Bool)

(assert (=> b!1025336 m!943045))

(declare-fun m!943047 () Bool)

(assert (=> mapNonEmpty!37655 m!943047))

(declare-fun m!943049 () Bool)

(assert (=> b!1025337 m!943049))

(declare-fun m!943051 () Bool)

(assert (=> b!1025337 m!943051))

(declare-fun m!943053 () Bool)

(assert (=> b!1025337 m!943053))

(declare-fun m!943055 () Bool)

(assert (=> b!1025337 m!943055))

(declare-fun m!943057 () Bool)

(assert (=> b!1025337 m!943057))

(declare-fun m!943059 () Bool)

(assert (=> b!1025337 m!943059))

(declare-fun m!943061 () Bool)

(assert (=> b!1025337 m!943061))

(declare-fun m!943063 () Bool)

(assert (=> b!1025335 m!943063))

(declare-fun m!943065 () Bool)

(assert (=> b!1025335 m!943065))

(declare-fun m!943067 () Bool)

(assert (=> b!1025334 m!943067))

(declare-fun m!943069 () Bool)

(assert (=> b!1025340 m!943069))

(assert (=> b!1025340 m!943069))

(declare-fun m!943071 () Bool)

(assert (=> b!1025340 m!943071))

(declare-fun m!943073 () Bool)

(assert (=> start!89430 m!943073))

(check-sat tp_is_empty!24151 (not b!1025340) (not b!1025337) (not b!1025344) (not b!1025335) b_and!32651 (not mapNonEmpty!37655) (not b_next!20431) (not b!1025336) (not start!89430) (not b!1025334))
(check-sat b_and!32651 (not b_next!20431))
