; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89394 () Bool)

(assert start!89394)

(declare-fun b!1024745 () Bool)

(declare-fun b_free!20395 () Bool)

(declare-fun b_next!20395 () Bool)

(assert (=> b!1024745 (= b_free!20395 (not b_next!20395))))

(declare-fun tp!72230 () Bool)

(declare-fun b_and!32615 () Bool)

(assert (=> b!1024745 (= tp!72230 b_and!32615)))

(declare-fun b!1024740 () Bool)

(declare-fun e!577705 () Bool)

(assert (=> b!1024740 (= e!577705 true)))

(declare-fun lt!450540 () Bool)

(declare-datatypes ((V!37027 0))(
  ( (V!37028 (val!12108 Int)) )
))
(declare-datatypes ((ValueCell!11354 0))(
  ( (ValueCellFull!11354 (v!14676 V!37027)) (EmptyCell!11354) )
))
(declare-datatypes ((array!64219 0))(
  ( (array!64220 (arr!30918 (Array (_ BitVec 32) (_ BitVec 64))) (size!31433 (_ BitVec 32))) )
))
(declare-datatypes ((array!64221 0))(
  ( (array!64222 (arr!30919 (Array (_ BitVec 32) ValueCell!11354)) (size!31434 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5302 0))(
  ( (LongMapFixedSize!5303 (defaultEntry!6003 Int) (mask!29658 (_ BitVec 32)) (extraKeys!5735 (_ BitVec 32)) (zeroValue!5839 V!37027) (minValue!5839 V!37027) (_size!2706 (_ BitVec 32)) (_keys!11146 array!64219) (_values!6026 array!64221) (_vacant!2706 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5302)

(declare-datatypes ((List!21774 0))(
  ( (Nil!21771) (Cons!21770 (h!22968 (_ BitVec 64)) (t!30827 List!21774)) )
))
(declare-fun arrayNoDuplicates!0 (array!64219 (_ BitVec 32) List!21774) Bool)

(assert (=> b!1024740 (= lt!450540 (arrayNoDuplicates!0 (_keys!11146 thiss!1427) #b00000000000000000000000000000000 Nil!21771))))

(declare-fun b!1024741 () Bool)

(declare-fun e!577704 () Bool)

(declare-fun e!577700 () Bool)

(assert (=> b!1024741 (= e!577704 e!577700)))

(declare-fun res!686122 () Bool)

(assert (=> b!1024741 (=> (not res!686122) (not e!577700))))

(declare-datatypes ((SeekEntryResult!9599 0))(
  ( (MissingZero!9599 (index!40767 (_ BitVec 32))) (Found!9599 (index!40768 (_ BitVec 32))) (Intermediate!9599 (undefined!10411 Bool) (index!40769 (_ BitVec 32)) (x!91122 (_ BitVec 32))) (Undefined!9599) (MissingVacant!9599 (index!40770 (_ BitVec 32))) )
))
(declare-fun lt!450539 () SeekEntryResult!9599)

(get-info :version)

(assert (=> b!1024741 (= res!686122 ((_ is Found!9599) lt!450539))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64219 (_ BitVec 32)) SeekEntryResult!9599)

(assert (=> b!1024741 (= lt!450539 (seekEntry!0 key!909 (_keys!11146 thiss!1427) (mask!29658 thiss!1427)))))

(declare-fun mapIsEmpty!37601 () Bool)

(declare-fun mapRes!37601 () Bool)

(assert (=> mapIsEmpty!37601 mapRes!37601))

(declare-fun b!1024742 () Bool)

(declare-fun res!686116 () Bool)

(assert (=> b!1024742 (=> res!686116 e!577705)))

(declare-fun contains!5934 (List!21774 (_ BitVec 64)) Bool)

(assert (=> b!1024742 (= res!686116 (contains!5934 Nil!21771 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024743 () Bool)

(declare-fun e!577701 () Bool)

(declare-fun e!577703 () Bool)

(assert (=> b!1024743 (= e!577701 (and e!577703 mapRes!37601))))

(declare-fun condMapEmpty!37601 () Bool)

(declare-fun mapDefault!37601 () ValueCell!11354)

(assert (=> b!1024743 (= condMapEmpty!37601 (= (arr!30919 (_values!6026 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11354)) mapDefault!37601)))))

(declare-fun b!1024744 () Bool)

(declare-fun res!686118 () Bool)

(assert (=> b!1024744 (=> res!686118 e!577705)))

(declare-fun noDuplicate!1479 (List!21774) Bool)

(assert (=> b!1024744 (= res!686118 (not (noDuplicate!1479 Nil!21771)))))

(declare-fun b!1024746 () Bool)

(assert (=> b!1024746 (= e!577700 (not e!577705))))

(declare-fun res!686120 () Bool)

(assert (=> b!1024746 (=> res!686120 e!577705)))

(assert (=> b!1024746 (= res!686120 (or (bvsge (size!31433 (_keys!11146 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31433 (_keys!11146 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64219 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024746 (= (arrayCountValidKeys!0 (array!64220 (store (arr!30918 (_keys!11146 thiss!1427)) (index!40768 lt!450539) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31433 (_keys!11146 thiss!1427))) #b00000000000000000000000000000000 (size!31433 (_keys!11146 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11146 thiss!1427) #b00000000000000000000000000000000 (size!31433 (_keys!11146 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33269 0))(
  ( (Unit!33270) )
))
(declare-fun lt!450541 () Unit!33269)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64219 (_ BitVec 32) (_ BitVec 64)) Unit!33269)

(assert (=> b!1024746 (= lt!450541 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11146 thiss!1427) (index!40768 lt!450539) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1024747 () Bool)

(declare-fun e!577706 () Bool)

(declare-fun tp_is_empty!24115 () Bool)

(assert (=> b!1024747 (= e!577706 tp_is_empty!24115)))

(declare-fun b!1024748 () Bool)

(declare-fun res!686119 () Bool)

(assert (=> b!1024748 (=> res!686119 e!577705)))

(assert (=> b!1024748 (= res!686119 (contains!5934 Nil!21771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37601 () Bool)

(declare-fun tp!72231 () Bool)

(assert (=> mapNonEmpty!37601 (= mapRes!37601 (and tp!72231 e!577706))))

(declare-fun mapKey!37601 () (_ BitVec 32))

(declare-fun mapValue!37601 () ValueCell!11354)

(declare-fun mapRest!37601 () (Array (_ BitVec 32) ValueCell!11354))

(assert (=> mapNonEmpty!37601 (= (arr!30919 (_values!6026 thiss!1427)) (store mapRest!37601 mapKey!37601 mapValue!37601))))

(declare-fun res!686117 () Bool)

(assert (=> start!89394 (=> (not res!686117) (not e!577704))))

(declare-fun valid!2010 (LongMapFixedSize!5302) Bool)

(assert (=> start!89394 (= res!686117 (valid!2010 thiss!1427))))

(assert (=> start!89394 e!577704))

(declare-fun e!577702 () Bool)

(assert (=> start!89394 e!577702))

(assert (=> start!89394 true))

(declare-fun array_inv!23961 (array!64219) Bool)

(declare-fun array_inv!23962 (array!64221) Bool)

(assert (=> b!1024745 (= e!577702 (and tp!72230 tp_is_empty!24115 (array_inv!23961 (_keys!11146 thiss!1427)) (array_inv!23962 (_values!6026 thiss!1427)) e!577701))))

(declare-fun b!1024749 () Bool)

(assert (=> b!1024749 (= e!577703 tp_is_empty!24115)))

(declare-fun b!1024750 () Bool)

(declare-fun res!686121 () Bool)

(assert (=> b!1024750 (=> (not res!686121) (not e!577704))))

(assert (=> b!1024750 (= res!686121 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89394 res!686117) b!1024750))

(assert (= (and b!1024750 res!686121) b!1024741))

(assert (= (and b!1024741 res!686122) b!1024746))

(assert (= (and b!1024746 (not res!686120)) b!1024744))

(assert (= (and b!1024744 (not res!686118)) b!1024748))

(assert (= (and b!1024748 (not res!686119)) b!1024742))

(assert (= (and b!1024742 (not res!686116)) b!1024740))

(assert (= (and b!1024743 condMapEmpty!37601) mapIsEmpty!37601))

(assert (= (and b!1024743 (not condMapEmpty!37601)) mapNonEmpty!37601))

(assert (= (and mapNonEmpty!37601 ((_ is ValueCellFull!11354) mapValue!37601)) b!1024747))

(assert (= (and b!1024743 ((_ is ValueCellFull!11354) mapDefault!37601)) b!1024749))

(assert (= b!1024745 b!1024743))

(assert (= start!89394 b!1024745))

(declare-fun m!942521 () Bool)

(assert (=> b!1024746 m!942521))

(declare-fun m!942523 () Bool)

(assert (=> b!1024746 m!942523))

(declare-fun m!942525 () Bool)

(assert (=> b!1024746 m!942525))

(declare-fun m!942527 () Bool)

(assert (=> b!1024746 m!942527))

(declare-fun m!942529 () Bool)

(assert (=> b!1024744 m!942529))

(declare-fun m!942531 () Bool)

(assert (=> b!1024742 m!942531))

(declare-fun m!942533 () Bool)

(assert (=> b!1024748 m!942533))

(declare-fun m!942535 () Bool)

(assert (=> b!1024745 m!942535))

(declare-fun m!942537 () Bool)

(assert (=> b!1024745 m!942537))

(declare-fun m!942539 () Bool)

(assert (=> start!89394 m!942539))

(declare-fun m!942541 () Bool)

(assert (=> mapNonEmpty!37601 m!942541))

(declare-fun m!942543 () Bool)

(assert (=> b!1024741 m!942543))

(declare-fun m!942545 () Bool)

(assert (=> b!1024740 m!942545))

(check-sat (not mapNonEmpty!37601) (not b!1024742) b_and!32615 (not b_next!20395) tp_is_empty!24115 (not b!1024741) (not b!1024744) (not start!89394) (not b!1024746) (not b!1024745) (not b!1024748) (not b!1024740))
(check-sat b_and!32615 (not b_next!20395))
