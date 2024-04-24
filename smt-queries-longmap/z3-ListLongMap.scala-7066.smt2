; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89684 () Bool)

(assert start!89684)

(declare-fun b!1027103 () Bool)

(declare-fun b_free!20449 () Bool)

(declare-fun b_next!20449 () Bool)

(assert (=> b!1027103 (= b_free!20449 (not b_next!20449))))

(declare-fun tp!72392 () Bool)

(declare-fun b_and!32705 () Bool)

(assert (=> b!1027103 (= tp!72392 b_and!32705)))

(declare-fun mapNonEmpty!37682 () Bool)

(declare-fun mapRes!37682 () Bool)

(declare-fun tp!72393 () Bool)

(declare-fun e!579287 () Bool)

(assert (=> mapNonEmpty!37682 (= mapRes!37682 (and tp!72393 e!579287))))

(declare-datatypes ((V!37099 0))(
  ( (V!37100 (val!12135 Int)) )
))
(declare-datatypes ((ValueCell!11381 0))(
  ( (ValueCellFull!11381 (v!14700 V!37099)) (EmptyCell!11381) )
))
(declare-fun mapValue!37682 () ValueCell!11381)

(declare-datatypes ((array!64437 0))(
  ( (array!64438 (arr!31021 (Array (_ BitVec 32) (_ BitVec 64))) (size!31535 (_ BitVec 32))) )
))
(declare-datatypes ((array!64439 0))(
  ( (array!64440 (arr!31022 (Array (_ BitVec 32) ValueCell!11381)) (size!31536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5356 0))(
  ( (LongMapFixedSize!5357 (defaultEntry!6030 Int) (mask!29768 (_ BitVec 32)) (extraKeys!5762 (_ BitVec 32)) (zeroValue!5866 V!37099) (minValue!5866 V!37099) (_size!2733 (_ BitVec 32)) (_keys!11215 array!64437) (_values!6053 array!64439) (_vacant!2733 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5356)

(declare-fun mapRest!37682 () (Array (_ BitVec 32) ValueCell!11381))

(declare-fun mapKey!37682 () (_ BitVec 32))

(assert (=> mapNonEmpty!37682 (= (arr!31022 (_values!6053 thiss!1427)) (store mapRest!37682 mapKey!37682 mapValue!37682))))

(declare-fun b!1027097 () Bool)

(declare-fun e!579284 () Bool)

(assert (=> b!1027097 (= e!579284 true)))

(declare-fun lt!451613 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64437 (_ BitVec 32)) Bool)

(assert (=> b!1027097 (= lt!451613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11215 thiss!1427) (mask!29768 thiss!1427)))))

(declare-fun b!1027098 () Bool)

(declare-fun res!687266 () Bool)

(assert (=> b!1027098 (=> res!687266 e!579284)))

(declare-datatypes ((SeekEntryResult!9583 0))(
  ( (MissingZero!9583 (index!40703 (_ BitVec 32))) (Found!9583 (index!40704 (_ BitVec 32))) (Intermediate!9583 (undefined!10395 Bool) (index!40705 (_ BitVec 32)) (x!91203 (_ BitVec 32))) (Undefined!9583) (MissingVacant!9583 (index!40706 (_ BitVec 32))) )
))
(declare-fun lt!451610 () SeekEntryResult!9583)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1027098 (= res!687266 (not (validKeyInArray!0 (select (arr!31021 (_keys!11215 thiss!1427)) (index!40704 lt!451610)))))))

(declare-fun b!1027099 () Bool)

(declare-fun res!687261 () Bool)

(assert (=> b!1027099 (=> res!687261 e!579284)))

(assert (=> b!1027099 (= res!687261 (or (not (= (size!31535 (_keys!11215 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29768 thiss!1427)))) (bvslt (index!40704 lt!451610) #b00000000000000000000000000000000) (bvsge (index!40704 lt!451610) (size!31535 (_keys!11215 thiss!1427)))))))

(declare-fun b!1027100 () Bool)

(declare-fun e!579288 () Bool)

(assert (=> b!1027100 (= e!579288 (not e!579284))))

(declare-fun res!687260 () Bool)

(assert (=> b!1027100 (=> res!687260 e!579284)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027100 (= res!687260 (not (validMask!0 (mask!29768 thiss!1427))))))

(declare-fun lt!451611 () array!64437)

(declare-datatypes ((List!21748 0))(
  ( (Nil!21745) (Cons!21744 (h!22951 (_ BitVec 64)) (t!30802 List!21748)) )
))
(declare-fun arrayNoDuplicates!0 (array!64437 (_ BitVec 32) List!21748) Bool)

(assert (=> b!1027100 (arrayNoDuplicates!0 lt!451611 #b00000000000000000000000000000000 Nil!21745)))

(declare-datatypes ((Unit!33416 0))(
  ( (Unit!33417) )
))
(declare-fun lt!451609 () Unit!33416)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21748) Unit!33416)

(assert (=> b!1027100 (= lt!451609 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11215 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40704 lt!451610) #b00000000000000000000000000000000 Nil!21745))))

(declare-fun arrayCountValidKeys!0 (array!64437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027100 (= (arrayCountValidKeys!0 lt!451611 #b00000000000000000000000000000000 (size!31535 (_keys!11215 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11215 thiss!1427) #b00000000000000000000000000000000 (size!31535 (_keys!11215 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027100 (= lt!451611 (array!64438 (store (arr!31021 (_keys!11215 thiss!1427)) (index!40704 lt!451610) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31535 (_keys!11215 thiss!1427))))))

(declare-fun lt!451612 () Unit!33416)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64437 (_ BitVec 32) (_ BitVec 64)) Unit!33416)

(assert (=> b!1027100 (= lt!451612 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11215 thiss!1427) (index!40704 lt!451610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027101 () Bool)

(declare-fun e!579285 () Bool)

(declare-fun e!579286 () Bool)

(assert (=> b!1027101 (= e!579285 (and e!579286 mapRes!37682))))

(declare-fun condMapEmpty!37682 () Bool)

(declare-fun mapDefault!37682 () ValueCell!11381)

(assert (=> b!1027101 (= condMapEmpty!37682 (= (arr!31022 (_values!6053 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11381)) mapDefault!37682)))))

(declare-fun b!1027102 () Bool)

(declare-fun res!687264 () Bool)

(declare-fun e!579283 () Bool)

(assert (=> b!1027102 (=> (not res!687264) (not e!579283))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027102 (= res!687264 (not (= key!909 (bvneg key!909))))))

(declare-fun res!687265 () Bool)

(assert (=> start!89684 (=> (not res!687265) (not e!579283))))

(declare-fun valid!2042 (LongMapFixedSize!5356) Bool)

(assert (=> start!89684 (= res!687265 (valid!2042 thiss!1427))))

(assert (=> start!89684 e!579283))

(declare-fun e!579289 () Bool)

(assert (=> start!89684 e!579289))

(assert (=> start!89684 true))

(declare-fun tp_is_empty!24169 () Bool)

(declare-fun array_inv!24043 (array!64437) Bool)

(declare-fun array_inv!24044 (array!64439) Bool)

(assert (=> b!1027103 (= e!579289 (and tp!72392 tp_is_empty!24169 (array_inv!24043 (_keys!11215 thiss!1427)) (array_inv!24044 (_values!6053 thiss!1427)) e!579285))))

(declare-fun b!1027104 () Bool)

(assert (=> b!1027104 (= e!579287 tp_is_empty!24169)))

(declare-fun mapIsEmpty!37682 () Bool)

(assert (=> mapIsEmpty!37682 mapRes!37682))

(declare-fun b!1027105 () Bool)

(declare-fun res!687263 () Bool)

(assert (=> b!1027105 (=> res!687263 e!579284)))

(assert (=> b!1027105 (= res!687263 (not (arrayNoDuplicates!0 (_keys!11215 thiss!1427) #b00000000000000000000000000000000 Nil!21745)))))

(declare-fun b!1027106 () Bool)

(assert (=> b!1027106 (= e!579286 tp_is_empty!24169)))

(declare-fun b!1027107 () Bool)

(assert (=> b!1027107 (= e!579283 e!579288)))

(declare-fun res!687262 () Bool)

(assert (=> b!1027107 (=> (not res!687262) (not e!579288))))

(get-info :version)

(assert (=> b!1027107 (= res!687262 ((_ is Found!9583) lt!451610))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64437 (_ BitVec 32)) SeekEntryResult!9583)

(assert (=> b!1027107 (= lt!451610 (seekEntry!0 key!909 (_keys!11215 thiss!1427) (mask!29768 thiss!1427)))))

(assert (= (and start!89684 res!687265) b!1027102))

(assert (= (and b!1027102 res!687264) b!1027107))

(assert (= (and b!1027107 res!687262) b!1027100))

(assert (= (and b!1027100 (not res!687260)) b!1027099))

(assert (= (and b!1027099 (not res!687261)) b!1027098))

(assert (= (and b!1027098 (not res!687266)) b!1027105))

(assert (= (and b!1027105 (not res!687263)) b!1027097))

(assert (= (and b!1027101 condMapEmpty!37682) mapIsEmpty!37682))

(assert (= (and b!1027101 (not condMapEmpty!37682)) mapNonEmpty!37682))

(assert (= (and mapNonEmpty!37682 ((_ is ValueCellFull!11381) mapValue!37682)) b!1027104))

(assert (= (and b!1027101 ((_ is ValueCellFull!11381) mapDefault!37682)) b!1027106))

(assert (= b!1027103 b!1027101))

(assert (= start!89684 b!1027103))

(declare-fun m!945615 () Bool)

(assert (=> mapNonEmpty!37682 m!945615))

(declare-fun m!945617 () Bool)

(assert (=> b!1027107 m!945617))

(declare-fun m!945619 () Bool)

(assert (=> b!1027105 m!945619))

(declare-fun m!945621 () Bool)

(assert (=> b!1027097 m!945621))

(declare-fun m!945623 () Bool)

(assert (=> b!1027103 m!945623))

(declare-fun m!945625 () Bool)

(assert (=> b!1027103 m!945625))

(declare-fun m!945627 () Bool)

(assert (=> b!1027100 m!945627))

(declare-fun m!945629 () Bool)

(assert (=> b!1027100 m!945629))

(declare-fun m!945631 () Bool)

(assert (=> b!1027100 m!945631))

(declare-fun m!945633 () Bool)

(assert (=> b!1027100 m!945633))

(declare-fun m!945635 () Bool)

(assert (=> b!1027100 m!945635))

(declare-fun m!945637 () Bool)

(assert (=> b!1027100 m!945637))

(declare-fun m!945639 () Bool)

(assert (=> b!1027100 m!945639))

(declare-fun m!945641 () Bool)

(assert (=> start!89684 m!945641))

(declare-fun m!945643 () Bool)

(assert (=> b!1027098 m!945643))

(assert (=> b!1027098 m!945643))

(declare-fun m!945645 () Bool)

(assert (=> b!1027098 m!945645))

(check-sat (not b_next!20449) b_and!32705 (not b!1027097) tp_is_empty!24169 (not b!1027107) (not b!1027100) (not b!1027105) (not mapNonEmpty!37682) (not b!1027098) (not start!89684) (not b!1027103))
(check-sat b_and!32705 (not b_next!20449))
