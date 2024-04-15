; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90804 () Bool)

(assert start!90804)

(declare-fun b!1037862 () Bool)

(declare-fun b_free!20923 () Bool)

(declare-fun b_next!20923 () Bool)

(assert (=> b!1037862 (= b_free!20923 (not b_next!20923))))

(declare-fun tp!73926 () Bool)

(declare-fun b_and!33429 () Bool)

(assert (=> b!1037862 (= tp!73926 b_and!33429)))

(declare-fun b!1037857 () Bool)

(declare-fun res!692411 () Bool)

(declare-fun e!587182 () Bool)

(assert (=> b!1037857 (=> res!692411 e!587182)))

(declare-datatypes ((List!21963 0))(
  ( (Nil!21960) (Cons!21959 (h!23162 (_ BitVec 64)) (t!31168 List!21963)) )
))
(declare-fun noDuplicate!1491 (List!21963) Bool)

(assert (=> b!1037857 (= res!692411 (not (noDuplicate!1491 Nil!21960)))))

(declare-fun b!1037858 () Bool)

(declare-fun res!692408 () Bool)

(assert (=> b!1037858 (=> res!692408 e!587182)))

(declare-fun contains!6010 (List!21963 (_ BitVec 64)) Bool)

(assert (=> b!1037858 (= res!692408 (contains!6010 Nil!21960 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037859 () Bool)

(declare-fun e!587177 () Bool)

(declare-fun tp_is_empty!24643 () Bool)

(assert (=> b!1037859 (= e!587177 tp_is_empty!24643)))

(declare-fun b!1037860 () Bool)

(declare-fun e!587180 () Bool)

(declare-fun e!587179 () Bool)

(assert (=> b!1037860 (= e!587180 e!587179)))

(declare-fun res!692407 () Bool)

(assert (=> b!1037860 (=> (not res!692407) (not e!587179))))

(declare-datatypes ((SeekEntryResult!9755 0))(
  ( (MissingZero!9755 (index!41391 (_ BitVec 32))) (Found!9755 (index!41392 (_ BitVec 32))) (Intermediate!9755 (undefined!10567 Bool) (index!41393 (_ BitVec 32)) (x!92607 (_ BitVec 32))) (Undefined!9755) (MissingVacant!9755 (index!41394 (_ BitVec 32))) )
))
(declare-fun lt!457434 () SeekEntryResult!9755)

(get-info :version)

(assert (=> b!1037860 (= res!692407 ((_ is Found!9755) lt!457434))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37731 0))(
  ( (V!37732 (val!12372 Int)) )
))
(declare-datatypes ((ValueCell!11618 0))(
  ( (ValueCellFull!11618 (v!14956 V!37731)) (EmptyCell!11618) )
))
(declare-datatypes ((array!65337 0))(
  ( (array!65338 (arr!31446 (Array (_ BitVec 32) (_ BitVec 64))) (size!31978 (_ BitVec 32))) )
))
(declare-datatypes ((array!65339 0))(
  ( (array!65340 (arr!31447 (Array (_ BitVec 32) ValueCell!11618)) (size!31979 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5830 0))(
  ( (LongMapFixedSize!5831 (defaultEntry!6297 Int) (mask!30223 (_ BitVec 32)) (extraKeys!6025 (_ BitVec 32)) (zeroValue!6131 V!37731) (minValue!6131 V!37731) (_size!2970 (_ BitVec 32)) (_keys!11493 array!65337) (_values!6320 array!65339) (_vacant!2970 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5830)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65337 (_ BitVec 32)) SeekEntryResult!9755)

(assert (=> b!1037860 (= lt!457434 (seekEntry!0 key!909 (_keys!11493 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun b!1037861 () Bool)

(assert (=> b!1037861 (= e!587182 true)))

(declare-fun lt!457432 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65337 (_ BitVec 32) List!21963) Bool)

(assert (=> b!1037861 (= lt!457432 (arrayNoDuplicates!0 (_keys!11493 thiss!1427) #b00000000000000000000000000000000 Nil!21960))))

(declare-fun e!587181 () Bool)

(declare-fun e!587184 () Bool)

(declare-fun array_inv!24317 (array!65337) Bool)

(declare-fun array_inv!24318 (array!65339) Bool)

(assert (=> b!1037862 (= e!587184 (and tp!73926 tp_is_empty!24643 (array_inv!24317 (_keys!11493 thiss!1427)) (array_inv!24318 (_values!6320 thiss!1427)) e!587181))))

(declare-fun res!692412 () Bool)

(assert (=> start!90804 (=> (not res!692412) (not e!587180))))

(declare-fun valid!2188 (LongMapFixedSize!5830) Bool)

(assert (=> start!90804 (= res!692412 (valid!2188 thiss!1427))))

(assert (=> start!90804 e!587180))

(assert (=> start!90804 e!587184))

(assert (=> start!90804 true))

(declare-fun b!1037863 () Bool)

(declare-fun res!692406 () Bool)

(assert (=> b!1037863 (=> (not res!692406) (not e!587180))))

(assert (=> b!1037863 (= res!692406 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38505 () Bool)

(declare-fun mapRes!38505 () Bool)

(declare-fun tp!73927 () Bool)

(declare-fun e!587183 () Bool)

(assert (=> mapNonEmpty!38505 (= mapRes!38505 (and tp!73927 e!587183))))

(declare-fun mapKey!38505 () (_ BitVec 32))

(declare-fun mapValue!38505 () ValueCell!11618)

(declare-fun mapRest!38505 () (Array (_ BitVec 32) ValueCell!11618))

(assert (=> mapNonEmpty!38505 (= (arr!31447 (_values!6320 thiss!1427)) (store mapRest!38505 mapKey!38505 mapValue!38505))))

(declare-fun b!1037864 () Bool)

(assert (=> b!1037864 (= e!587181 (and e!587177 mapRes!38505))))

(declare-fun condMapEmpty!38505 () Bool)

(declare-fun mapDefault!38505 () ValueCell!11618)

(assert (=> b!1037864 (= condMapEmpty!38505 (= (arr!31447 (_values!6320 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11618)) mapDefault!38505)))))

(declare-fun b!1037865 () Bool)

(declare-fun res!692409 () Bool)

(assert (=> b!1037865 (=> res!692409 e!587182)))

(assert (=> b!1037865 (= res!692409 (contains!6010 Nil!21960 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38505 () Bool)

(assert (=> mapIsEmpty!38505 mapRes!38505))

(declare-fun b!1037866 () Bool)

(assert (=> b!1037866 (= e!587183 tp_is_empty!24643)))

(declare-fun b!1037867 () Bool)

(assert (=> b!1037867 (= e!587179 (not e!587182))))

(declare-fun res!692410 () Bool)

(assert (=> b!1037867 (=> res!692410 e!587182)))

(assert (=> b!1037867 (= res!692410 (or (bvsge (size!31978 (_keys!11493 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31978 (_keys!11493 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65337 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037867 (= (arrayCountValidKeys!0 (array!65338 (store (arr!31446 (_keys!11493 thiss!1427)) (index!41392 lt!457434) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31978 (_keys!11493 thiss!1427))) #b00000000000000000000000000000000 (size!31978 (_keys!11493 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11493 thiss!1427) #b00000000000000000000000000000000 (size!31978 (_keys!11493 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33845 0))(
  ( (Unit!33846) )
))
(declare-fun lt!457433 () Unit!33845)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65337 (_ BitVec 32) (_ BitVec 64)) Unit!33845)

(assert (=> b!1037867 (= lt!457433 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11493 thiss!1427) (index!41392 lt!457434) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90804 res!692412) b!1037863))

(assert (= (and b!1037863 res!692406) b!1037860))

(assert (= (and b!1037860 res!692407) b!1037867))

(assert (= (and b!1037867 (not res!692410)) b!1037857))

(assert (= (and b!1037857 (not res!692411)) b!1037858))

(assert (= (and b!1037858 (not res!692408)) b!1037865))

(assert (= (and b!1037865 (not res!692409)) b!1037861))

(assert (= (and b!1037864 condMapEmpty!38505) mapIsEmpty!38505))

(assert (= (and b!1037864 (not condMapEmpty!38505)) mapNonEmpty!38505))

(assert (= (and mapNonEmpty!38505 ((_ is ValueCellFull!11618) mapValue!38505)) b!1037866))

(assert (= (and b!1037864 ((_ is ValueCellFull!11618) mapDefault!38505)) b!1037859))

(assert (= b!1037862 b!1037864))

(assert (= start!90804 b!1037862))

(declare-fun m!957439 () Bool)

(assert (=> b!1037862 m!957439))

(declare-fun m!957441 () Bool)

(assert (=> b!1037862 m!957441))

(declare-fun m!957443 () Bool)

(assert (=> b!1037857 m!957443))

(declare-fun m!957445 () Bool)

(assert (=> b!1037867 m!957445))

(declare-fun m!957447 () Bool)

(assert (=> b!1037867 m!957447))

(declare-fun m!957449 () Bool)

(assert (=> b!1037867 m!957449))

(declare-fun m!957451 () Bool)

(assert (=> b!1037867 m!957451))

(declare-fun m!957453 () Bool)

(assert (=> mapNonEmpty!38505 m!957453))

(declare-fun m!957455 () Bool)

(assert (=> b!1037858 m!957455))

(declare-fun m!957457 () Bool)

(assert (=> b!1037860 m!957457))

(declare-fun m!957459 () Bool)

(assert (=> b!1037861 m!957459))

(declare-fun m!957461 () Bool)

(assert (=> start!90804 m!957461))

(declare-fun m!957463 () Bool)

(assert (=> b!1037865 m!957463))

(check-sat (not b!1037860) (not b!1037858) (not b_next!20923) tp_is_empty!24643 (not b!1037865) (not b!1037857) (not b!1037867) (not start!90804) (not b!1037861) (not mapNonEmpty!38505) (not b!1037862) b_and!33429)
(check-sat b_and!33429 (not b_next!20923))
