; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89412 () Bool)

(assert start!89412)

(declare-fun b!1025037 () Bool)

(declare-fun b_free!20413 () Bool)

(declare-fun b_next!20413 () Bool)

(assert (=> b!1025037 (= b_free!20413 (not b_next!20413))))

(declare-fun tp!72284 () Bool)

(declare-fun b_and!32633 () Bool)

(assert (=> b!1025037 (= tp!72284 b_and!32633)))

(declare-fun e!577919 () Bool)

(declare-datatypes ((V!37051 0))(
  ( (V!37052 (val!12117 Int)) )
))
(declare-datatypes ((ValueCell!11363 0))(
  ( (ValueCellFull!11363 (v!14685 V!37051)) (EmptyCell!11363) )
))
(declare-datatypes ((array!64255 0))(
  ( (array!64256 (arr!30936 (Array (_ BitVec 32) (_ BitVec 64))) (size!31451 (_ BitVec 32))) )
))
(declare-datatypes ((array!64257 0))(
  ( (array!64258 (arr!30937 (Array (_ BitVec 32) ValueCell!11363)) (size!31452 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5320 0))(
  ( (LongMapFixedSize!5321 (defaultEntry!6012 Int) (mask!29673 (_ BitVec 32)) (extraKeys!5744 (_ BitVec 32)) (zeroValue!5848 V!37051) (minValue!5848 V!37051) (_size!2715 (_ BitVec 32)) (_keys!11155 array!64255) (_values!6035 array!64257) (_vacant!2715 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5320)

(declare-fun tp_is_empty!24133 () Bool)

(declare-fun e!577918 () Bool)

(declare-fun array_inv!23975 (array!64255) Bool)

(declare-fun array_inv!23976 (array!64257) Bool)

(assert (=> b!1025037 (= e!577919 (and tp!72284 tp_is_empty!24133 (array_inv!23975 (_keys!11155 thiss!1427)) (array_inv!23976 (_values!6035 thiss!1427)) e!577918))))

(declare-fun b!1025038 () Bool)

(declare-fun res!686310 () Bool)

(declare-fun e!577920 () Bool)

(assert (=> b!1025038 (=> res!686310 e!577920)))

(declare-datatypes ((List!21781 0))(
  ( (Nil!21778) (Cons!21777 (h!22975 (_ BitVec 64)) (t!30834 List!21781)) )
))
(declare-fun arrayNoDuplicates!0 (array!64255 (_ BitVec 32) List!21781) Bool)

(assert (=> b!1025038 (= res!686310 (not (arrayNoDuplicates!0 (_keys!11155 thiss!1427) #b00000000000000000000000000000000 Nil!21778)))))

(declare-fun b!1025039 () Bool)

(assert (=> b!1025039 (= e!577920 true)))

(declare-fun lt!450625 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64255 (_ BitVec 32)) Bool)

(assert (=> b!1025039 (= lt!450625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11155 thiss!1427) (mask!29673 thiss!1427)))))

(declare-fun b!1025040 () Bool)

(declare-fun res!686307 () Bool)

(assert (=> b!1025040 (=> res!686307 e!577920)))

(declare-datatypes ((SeekEntryResult!9606 0))(
  ( (MissingZero!9606 (index!40795 (_ BitVec 32))) (Found!9606 (index!40796 (_ BitVec 32))) (Intermediate!9606 (undefined!10418 Bool) (index!40797 (_ BitVec 32)) (x!91153 (_ BitVec 32))) (Undefined!9606) (MissingVacant!9606 (index!40798 (_ BitVec 32))) )
))
(declare-fun lt!450627 () SeekEntryResult!9606)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025040 (= res!686307 (not (validKeyInArray!0 (select (arr!30936 (_keys!11155 thiss!1427)) (index!40796 lt!450627)))))))

(declare-fun b!1025041 () Bool)

(declare-fun e!577922 () Bool)

(declare-fun e!577923 () Bool)

(assert (=> b!1025041 (= e!577922 e!577923)))

(declare-fun res!686305 () Bool)

(assert (=> b!1025041 (=> (not res!686305) (not e!577923))))

(get-info :version)

(assert (=> b!1025041 (= res!686305 ((_ is Found!9606) lt!450627))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64255 (_ BitVec 32)) SeekEntryResult!9606)

(assert (=> b!1025041 (= lt!450627 (seekEntry!0 key!909 (_keys!11155 thiss!1427) (mask!29673 thiss!1427)))))

(declare-fun mapIsEmpty!37628 () Bool)

(declare-fun mapRes!37628 () Bool)

(assert (=> mapIsEmpty!37628 mapRes!37628))

(declare-fun b!1025042 () Bool)

(declare-fun res!686309 () Bool)

(assert (=> b!1025042 (=> res!686309 e!577920)))

(assert (=> b!1025042 (= res!686309 (or (not (= (size!31451 (_keys!11155 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29673 thiss!1427)))) (bvslt (index!40796 lt!450627) #b00000000000000000000000000000000) (bvsge (index!40796 lt!450627) (size!31451 (_keys!11155 thiss!1427)))))))

(declare-fun b!1025043 () Bool)

(declare-fun e!577921 () Bool)

(assert (=> b!1025043 (= e!577918 (and e!577921 mapRes!37628))))

(declare-fun condMapEmpty!37628 () Bool)

(declare-fun mapDefault!37628 () ValueCell!11363)

(assert (=> b!1025043 (= condMapEmpty!37628 (= (arr!30937 (_values!6035 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11363)) mapDefault!37628)))))

(declare-fun mapNonEmpty!37628 () Bool)

(declare-fun tp!72285 () Bool)

(declare-fun e!577917 () Bool)

(assert (=> mapNonEmpty!37628 (= mapRes!37628 (and tp!72285 e!577917))))

(declare-fun mapKey!37628 () (_ BitVec 32))

(declare-fun mapRest!37628 () (Array (_ BitVec 32) ValueCell!11363))

(declare-fun mapValue!37628 () ValueCell!11363)

(assert (=> mapNonEmpty!37628 (= (arr!30937 (_values!6035 thiss!1427)) (store mapRest!37628 mapKey!37628 mapValue!37628))))

(declare-fun b!1025045 () Bool)

(assert (=> b!1025045 (= e!577923 (not e!577920))))

(declare-fun res!686308 () Bool)

(assert (=> b!1025045 (=> res!686308 e!577920)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025045 (= res!686308 (not (validMask!0 (mask!29673 thiss!1427))))))

(declare-fun lt!450626 () array!64255)

(assert (=> b!1025045 (arrayNoDuplicates!0 lt!450626 #b00000000000000000000000000000000 Nil!21778)))

(declare-datatypes ((Unit!33283 0))(
  ( (Unit!33284) )
))
(declare-fun lt!450624 () Unit!33283)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64255 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21781) Unit!33283)

(assert (=> b!1025045 (= lt!450624 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11155 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40796 lt!450627) #b00000000000000000000000000000000 Nil!21778))))

(declare-fun arrayCountValidKeys!0 (array!64255 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025045 (= (arrayCountValidKeys!0 lt!450626 #b00000000000000000000000000000000 (size!31451 (_keys!11155 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11155 thiss!1427) #b00000000000000000000000000000000 (size!31451 (_keys!11155 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025045 (= lt!450626 (array!64256 (store (arr!30936 (_keys!11155 thiss!1427)) (index!40796 lt!450627) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31451 (_keys!11155 thiss!1427))))))

(declare-fun lt!450628 () Unit!33283)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64255 (_ BitVec 32) (_ BitVec 64)) Unit!33283)

(assert (=> b!1025045 (= lt!450628 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11155 thiss!1427) (index!40796 lt!450627) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025046 () Bool)

(assert (=> b!1025046 (= e!577917 tp_is_empty!24133)))

(declare-fun b!1025047 () Bool)

(assert (=> b!1025047 (= e!577921 tp_is_empty!24133)))

(declare-fun res!686311 () Bool)

(assert (=> start!89412 (=> (not res!686311) (not e!577922))))

(declare-fun valid!2017 (LongMapFixedSize!5320) Bool)

(assert (=> start!89412 (= res!686311 (valid!2017 thiss!1427))))

(assert (=> start!89412 e!577922))

(assert (=> start!89412 e!577919))

(assert (=> start!89412 true))

(declare-fun b!1025044 () Bool)

(declare-fun res!686306 () Bool)

(assert (=> b!1025044 (=> (not res!686306) (not e!577922))))

(assert (=> b!1025044 (= res!686306 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89412 res!686311) b!1025044))

(assert (= (and b!1025044 res!686306) b!1025041))

(assert (= (and b!1025041 res!686305) b!1025045))

(assert (= (and b!1025045 (not res!686308)) b!1025042))

(assert (= (and b!1025042 (not res!686309)) b!1025040))

(assert (= (and b!1025040 (not res!686307)) b!1025038))

(assert (= (and b!1025038 (not res!686310)) b!1025039))

(assert (= (and b!1025043 condMapEmpty!37628) mapIsEmpty!37628))

(assert (= (and b!1025043 (not condMapEmpty!37628)) mapNonEmpty!37628))

(assert (= (and mapNonEmpty!37628 ((_ is ValueCellFull!11363) mapValue!37628)) b!1025046))

(assert (= (and b!1025043 ((_ is ValueCellFull!11363) mapDefault!37628)) b!1025047))

(assert (= b!1025037 b!1025043))

(assert (= start!89412 b!1025037))

(declare-fun m!942755 () Bool)

(assert (=> mapNonEmpty!37628 m!942755))

(declare-fun m!942757 () Bool)

(assert (=> b!1025037 m!942757))

(declare-fun m!942759 () Bool)

(assert (=> b!1025037 m!942759))

(declare-fun m!942761 () Bool)

(assert (=> start!89412 m!942761))

(declare-fun m!942763 () Bool)

(assert (=> b!1025039 m!942763))

(declare-fun m!942765 () Bool)

(assert (=> b!1025038 m!942765))

(declare-fun m!942767 () Bool)

(assert (=> b!1025041 m!942767))

(declare-fun m!942769 () Bool)

(assert (=> b!1025040 m!942769))

(assert (=> b!1025040 m!942769))

(declare-fun m!942771 () Bool)

(assert (=> b!1025040 m!942771))

(declare-fun m!942773 () Bool)

(assert (=> b!1025045 m!942773))

(declare-fun m!942775 () Bool)

(assert (=> b!1025045 m!942775))

(declare-fun m!942777 () Bool)

(assert (=> b!1025045 m!942777))

(declare-fun m!942779 () Bool)

(assert (=> b!1025045 m!942779))

(declare-fun m!942781 () Bool)

(assert (=> b!1025045 m!942781))

(declare-fun m!942783 () Bool)

(assert (=> b!1025045 m!942783))

(declare-fun m!942785 () Bool)

(assert (=> b!1025045 m!942785))

(check-sat (not b!1025040) (not start!89412) tp_is_empty!24133 (not b!1025039) (not mapNonEmpty!37628) b_and!32633 (not b!1025037) (not b!1025038) (not b!1025045) (not b!1025041) (not b_next!20413))
(check-sat b_and!32633 (not b_next!20413))
