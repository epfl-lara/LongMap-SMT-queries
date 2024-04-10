; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89464 () Bool)

(assert start!89464)

(declare-fun b!1025975 () Bool)

(declare-fun b_free!20463 () Bool)

(declare-fun b_next!20463 () Bool)

(assert (=> b!1025975 (= b_free!20463 (not b_next!20463))))

(declare-fun tp!72434 () Bool)

(declare-fun b_and!32709 () Bool)

(assert (=> b!1025975 (= tp!72434 b_and!32709)))

(declare-fun mapIsEmpty!37703 () Bool)

(declare-fun mapRes!37703 () Bool)

(assert (=> mapIsEmpty!37703 mapRes!37703))

(declare-fun b!1025971 () Bool)

(declare-fun res!686857 () Bool)

(declare-fun e!578609 () Bool)

(assert (=> b!1025971 (=> (not res!686857) (not e!578609))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025971 (= res!686857 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025972 () Bool)

(declare-fun e!578607 () Bool)

(assert (=> b!1025972 (= e!578609 e!578607)))

(declare-fun res!686858 () Bool)

(assert (=> b!1025972 (=> (not res!686858) (not e!578607))))

(declare-datatypes ((SeekEntryResult!9635 0))(
  ( (MissingZero!9635 (index!40911 (_ BitVec 32))) (Found!9635 (index!40912 (_ BitVec 32))) (Intermediate!9635 (undefined!10447 Bool) (index!40913 (_ BitVec 32)) (x!91249 (_ BitVec 32))) (Undefined!9635) (MissingVacant!9635 (index!40914 (_ BitVec 32))) )
))
(declare-fun lt!451218 () SeekEntryResult!9635)

(get-info :version)

(assert (=> b!1025972 (= res!686858 ((_ is Found!9635) lt!451218))))

(declare-datatypes ((V!37117 0))(
  ( (V!37118 (val!12142 Int)) )
))
(declare-datatypes ((ValueCell!11388 0))(
  ( (ValueCellFull!11388 (v!14711 V!37117)) (EmptyCell!11388) )
))
(declare-datatypes ((array!64416 0))(
  ( (array!64417 (arr!31017 (Array (_ BitVec 32) (_ BitVec 64))) (size!31530 (_ BitVec 32))) )
))
(declare-datatypes ((array!64418 0))(
  ( (array!64419 (arr!31018 (Array (_ BitVec 32) ValueCell!11388)) (size!31531 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5370 0))(
  ( (LongMapFixedSize!5371 (defaultEntry!6037 Int) (mask!29719 (_ BitVec 32)) (extraKeys!5769 (_ BitVec 32)) (zeroValue!5873 V!37117) (minValue!5873 V!37117) (_size!2740 (_ BitVec 32)) (_keys!11184 array!64416) (_values!6060 array!64418) (_vacant!2740 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5370)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64416 (_ BitVec 32)) SeekEntryResult!9635)

(assert (=> b!1025972 (= lt!451218 (seekEntry!0 key!909 (_keys!11184 thiss!1427) (mask!29719 thiss!1427)))))

(declare-fun b!1025973 () Bool)

(declare-fun e!578610 () Bool)

(declare-fun e!578608 () Bool)

(assert (=> b!1025973 (= e!578610 (and e!578608 mapRes!37703))))

(declare-fun condMapEmpty!37703 () Bool)

(declare-fun mapDefault!37703 () ValueCell!11388)

(assert (=> b!1025973 (= condMapEmpty!37703 (= (arr!31018 (_values!6060 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11388)) mapDefault!37703)))))

(declare-fun b!1025974 () Bool)

(declare-fun tp_is_empty!24183 () Bool)

(assert (=> b!1025974 (= e!578608 tp_is_empty!24183)))

(declare-fun e!578614 () Bool)

(declare-fun array_inv!24023 (array!64416) Bool)

(declare-fun array_inv!24024 (array!64418) Bool)

(assert (=> b!1025975 (= e!578614 (and tp!72434 tp_is_empty!24183 (array_inv!24023 (_keys!11184 thiss!1427)) (array_inv!24024 (_values!6060 thiss!1427)) e!578610))))

(declare-fun res!686855 () Bool)

(assert (=> start!89464 (=> (not res!686855) (not e!578609))))

(declare-fun valid!2043 (LongMapFixedSize!5370) Bool)

(assert (=> start!89464 (= res!686855 (valid!2043 thiss!1427))))

(assert (=> start!89464 e!578609))

(assert (=> start!89464 e!578614))

(assert (=> start!89464 true))

(declare-fun mapNonEmpty!37703 () Bool)

(declare-fun tp!72435 () Bool)

(declare-fun e!578613 () Bool)

(assert (=> mapNonEmpty!37703 (= mapRes!37703 (and tp!72435 e!578613))))

(declare-fun mapKey!37703 () (_ BitVec 32))

(declare-fun mapRest!37703 () (Array (_ BitVec 32) ValueCell!11388))

(declare-fun mapValue!37703 () ValueCell!11388)

(assert (=> mapNonEmpty!37703 (= (arr!31018 (_values!6060 thiss!1427)) (store mapRest!37703 mapKey!37703 mapValue!37703))))

(declare-fun b!1025976 () Bool)

(assert (=> b!1025976 (= e!578613 tp_is_empty!24183)))

(declare-fun b!1025977 () Bool)

(declare-fun e!578612 () Bool)

(assert (=> b!1025977 (= e!578607 (not e!578612))))

(declare-fun res!686856 () Bool)

(assert (=> b!1025977 (=> res!686856 e!578612)))

(assert (=> b!1025977 (= res!686856 (or (bvslt (index!40912 lt!451218) #b00000000000000000000000000000000) (bvsge (index!40912 lt!451218) (size!31530 (_keys!11184 thiss!1427))) (bvsge (size!31530 (_keys!11184 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451217 () array!64416)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64416 (_ BitVec 32)) Bool)

(assert (=> b!1025977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451217 (mask!29719 thiss!1427))))

(declare-datatypes ((Unit!33417 0))(
  ( (Unit!33418) )
))
(declare-fun lt!451216 () Unit!33417)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64416 (_ BitVec 32) (_ BitVec 32)) Unit!33417)

(assert (=> b!1025977 (= lt!451216 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11184 thiss!1427) (index!40912 lt!451218) (mask!29719 thiss!1427)))))

(declare-datatypes ((List!21766 0))(
  ( (Nil!21763) (Cons!21762 (h!22960 (_ BitVec 64)) (t!30828 List!21766)) )
))
(declare-fun arrayNoDuplicates!0 (array!64416 (_ BitVec 32) List!21766) Bool)

(assert (=> b!1025977 (arrayNoDuplicates!0 lt!451217 #b00000000000000000000000000000000 Nil!21763)))

(declare-fun lt!451214 () Unit!33417)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64416 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21766) Unit!33417)

(assert (=> b!1025977 (= lt!451214 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11184 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40912 lt!451218) #b00000000000000000000000000000000 Nil!21763))))

(declare-fun arrayCountValidKeys!0 (array!64416 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025977 (= (arrayCountValidKeys!0 lt!451217 #b00000000000000000000000000000000 (size!31530 (_keys!11184 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11184 thiss!1427) #b00000000000000000000000000000000 (size!31530 (_keys!11184 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025977 (= lt!451217 (array!64417 (store (arr!31017 (_keys!11184 thiss!1427)) (index!40912 lt!451218) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31530 (_keys!11184 thiss!1427))))))

(declare-fun lt!451213 () Unit!33417)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64416 (_ BitVec 32) (_ BitVec 64)) Unit!33417)

(assert (=> b!1025977 (= lt!451213 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11184 thiss!1427) (index!40912 lt!451218) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025978 () Bool)

(assert (=> b!1025978 (= e!578612 true)))

(declare-fun lt!451215 () Bool)

(assert (=> b!1025978 (= lt!451215 (arrayNoDuplicates!0 (_keys!11184 thiss!1427) #b00000000000000000000000000000000 Nil!21763))))

(assert (= (and start!89464 res!686855) b!1025971))

(assert (= (and b!1025971 res!686857) b!1025972))

(assert (= (and b!1025972 res!686858) b!1025977))

(assert (= (and b!1025977 (not res!686856)) b!1025978))

(assert (= (and b!1025973 condMapEmpty!37703) mapIsEmpty!37703))

(assert (= (and b!1025973 (not condMapEmpty!37703)) mapNonEmpty!37703))

(assert (= (and mapNonEmpty!37703 ((_ is ValueCellFull!11388) mapValue!37703)) b!1025976))

(assert (= (and b!1025973 ((_ is ValueCellFull!11388) mapDefault!37703)) b!1025974))

(assert (= b!1025975 b!1025973))

(assert (= start!89464 b!1025975))

(declare-fun m!944159 () Bool)

(assert (=> b!1025975 m!944159))

(declare-fun m!944161 () Bool)

(assert (=> b!1025975 m!944161))

(declare-fun m!944163 () Bool)

(assert (=> b!1025977 m!944163))

(declare-fun m!944165 () Bool)

(assert (=> b!1025977 m!944165))

(declare-fun m!944167 () Bool)

(assert (=> b!1025977 m!944167))

(declare-fun m!944169 () Bool)

(assert (=> b!1025977 m!944169))

(declare-fun m!944171 () Bool)

(assert (=> b!1025977 m!944171))

(declare-fun m!944173 () Bool)

(assert (=> b!1025977 m!944173))

(declare-fun m!944175 () Bool)

(assert (=> b!1025977 m!944175))

(declare-fun m!944177 () Bool)

(assert (=> b!1025977 m!944177))

(declare-fun m!944179 () Bool)

(assert (=> start!89464 m!944179))

(declare-fun m!944181 () Bool)

(assert (=> b!1025978 m!944181))

(declare-fun m!944183 () Bool)

(assert (=> b!1025972 m!944183))

(declare-fun m!944185 () Bool)

(assert (=> mapNonEmpty!37703 m!944185))

(check-sat (not mapNonEmpty!37703) (not b!1025978) (not start!89464) (not b!1025972) b_and!32709 (not b!1025977) (not b!1025975) tp_is_empty!24183 (not b_next!20463))
(check-sat b_and!32709 (not b_next!20463))
