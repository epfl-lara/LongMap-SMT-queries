; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89262 () Bool)

(assert start!89262)

(declare-fun b!1023421 () Bool)

(declare-fun b_free!20305 () Bool)

(declare-fun b_next!20305 () Bool)

(assert (=> b!1023421 (= b_free!20305 (not b_next!20305))))

(declare-fun tp!71949 () Bool)

(declare-fun b_and!32501 () Bool)

(assert (=> b!1023421 (= tp!71949 b_and!32501)))

(declare-fun mapIsEmpty!37455 () Bool)

(declare-fun mapRes!37455 () Bool)

(assert (=> mapIsEmpty!37455 mapRes!37455))

(declare-fun mapNonEmpty!37455 () Bool)

(declare-fun tp!71950 () Bool)

(declare-fun e!576692 () Bool)

(assert (=> mapNonEmpty!37455 (= mapRes!37455 (and tp!71950 e!576692))))

(declare-fun mapKey!37455 () (_ BitVec 32))

(declare-datatypes ((V!36907 0))(
  ( (V!36908 (val!12063 Int)) )
))
(declare-datatypes ((ValueCell!11309 0))(
  ( (ValueCellFull!11309 (v!14631 V!36907)) (EmptyCell!11309) )
))
(declare-datatypes ((array!64033 0))(
  ( (array!64034 (arr!30828 (Array (_ BitVec 32) (_ BitVec 64))) (size!31341 (_ BitVec 32))) )
))
(declare-datatypes ((array!64035 0))(
  ( (array!64036 (arr!30829 (Array (_ BitVec 32) ValueCell!11309)) (size!31342 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5212 0))(
  ( (LongMapFixedSize!5213 (defaultEntry!5958 Int) (mask!29578 (_ BitVec 32)) (extraKeys!5690 (_ BitVec 32)) (zeroValue!5794 V!36907) (minValue!5794 V!36907) (_size!2661 (_ BitVec 32)) (_keys!11099 array!64033) (_values!5981 array!64035) (_vacant!2661 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5212)

(declare-fun mapRest!37455 () (Array (_ BitVec 32) ValueCell!11309))

(declare-fun mapValue!37455 () ValueCell!11309)

(assert (=> mapNonEmpty!37455 (= (arr!30829 (_values!5981 thiss!1427)) (store mapRest!37455 mapKey!37455 mapValue!37455))))

(declare-fun res!685440 () Bool)

(declare-fun e!576687 () Bool)

(assert (=> start!89262 (=> (not res!685440) (not e!576687))))

(declare-fun valid!1982 (LongMapFixedSize!5212) Bool)

(assert (=> start!89262 (= res!685440 (valid!1982 thiss!1427))))

(assert (=> start!89262 e!576687))

(declare-fun e!576689 () Bool)

(assert (=> start!89262 e!576689))

(assert (=> start!89262 true))

(declare-fun tp_is_empty!24025 () Bool)

(declare-fun e!576690 () Bool)

(declare-fun array_inv!23901 (array!64033) Bool)

(declare-fun array_inv!23902 (array!64035) Bool)

(assert (=> b!1023421 (= e!576689 (and tp!71949 tp_is_empty!24025 (array_inv!23901 (_keys!11099 thiss!1427)) (array_inv!23902 (_values!5981 thiss!1427)) e!576690))))

(declare-fun b!1023422 () Bool)

(declare-fun res!685439 () Bool)

(assert (=> b!1023422 (=> (not res!685439) (not e!576687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64033 (_ BitVec 32)) Bool)

(assert (=> b!1023422 (= res!685439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11099 thiss!1427) (mask!29578 thiss!1427)))))

(declare-fun b!1023423 () Bool)

(assert (=> b!1023423 (= e!576692 tp_is_empty!24025)))

(declare-fun b!1023424 () Bool)

(declare-fun e!576688 () Bool)

(assert (=> b!1023424 (= e!576688 tp_is_empty!24025)))

(declare-fun b!1023425 () Bool)

(declare-fun res!685441 () Bool)

(assert (=> b!1023425 (=> (not res!685441) (not e!576687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023425 (= res!685441 (validMask!0 (mask!29578 thiss!1427)))))

(declare-fun b!1023426 () Bool)

(assert (=> b!1023426 (= e!576687 false)))

(declare-fun lt!450223 () Bool)

(declare-datatypes ((List!21745 0))(
  ( (Nil!21742) (Cons!21741 (h!22939 (_ BitVec 64)) (t!30774 List!21745)) )
))
(declare-fun arrayNoDuplicates!0 (array!64033 (_ BitVec 32) List!21745) Bool)

(assert (=> b!1023426 (= lt!450223 (arrayNoDuplicates!0 (_keys!11099 thiss!1427) #b00000000000000000000000000000000 Nil!21742))))

(declare-fun b!1023427 () Bool)

(assert (=> b!1023427 (= e!576690 (and e!576688 mapRes!37455))))

(declare-fun condMapEmpty!37455 () Bool)

(declare-fun mapDefault!37455 () ValueCell!11309)

(assert (=> b!1023427 (= condMapEmpty!37455 (= (arr!30829 (_values!5981 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11309)) mapDefault!37455)))))

(declare-fun b!1023428 () Bool)

(declare-fun res!685438 () Bool)

(assert (=> b!1023428 (=> (not res!685438) (not e!576687))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023428 (= res!685438 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023429 () Bool)

(declare-fun res!685437 () Bool)

(assert (=> b!1023429 (=> (not res!685437) (not e!576687))))

(assert (=> b!1023429 (= res!685437 (and (= (size!31342 (_values!5981 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29578 thiss!1427))) (= (size!31341 (_keys!11099 thiss!1427)) (size!31342 (_values!5981 thiss!1427))) (bvsge (mask!29578 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5690 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5690 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5690 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!89262 res!685440) b!1023428))

(assert (= (and b!1023428 res!685438) b!1023425))

(assert (= (and b!1023425 res!685441) b!1023429))

(assert (= (and b!1023429 res!685437) b!1023422))

(assert (= (and b!1023422 res!685439) b!1023426))

(assert (= (and b!1023427 condMapEmpty!37455) mapIsEmpty!37455))

(assert (= (and b!1023427 (not condMapEmpty!37455)) mapNonEmpty!37455))

(get-info :version)

(assert (= (and mapNonEmpty!37455 ((_ is ValueCellFull!11309) mapValue!37455)) b!1023423))

(assert (= (and b!1023427 ((_ is ValueCellFull!11309) mapDefault!37455)) b!1023424))

(assert (= b!1023421 b!1023427))

(assert (= start!89262 b!1023421))

(declare-fun m!941571 () Bool)

(assert (=> mapNonEmpty!37455 m!941571))

(declare-fun m!941573 () Bool)

(assert (=> b!1023425 m!941573))

(declare-fun m!941575 () Bool)

(assert (=> start!89262 m!941575))

(declare-fun m!941577 () Bool)

(assert (=> b!1023421 m!941577))

(declare-fun m!941579 () Bool)

(assert (=> b!1023421 m!941579))

(declare-fun m!941581 () Bool)

(assert (=> b!1023422 m!941581))

(declare-fun m!941583 () Bool)

(assert (=> b!1023426 m!941583))

(check-sat (not start!89262) (not b!1023422) b_and!32501 (not b!1023421) (not b_next!20305) (not b!1023425) (not mapNonEmpty!37455) tp_is_empty!24025 (not b!1023426))
(check-sat b_and!32501 (not b_next!20305))
