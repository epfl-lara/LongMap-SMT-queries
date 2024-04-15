; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89130 () Bool)

(assert start!89130)

(declare-fun b!1021726 () Bool)

(declare-fun b_free!20173 () Bool)

(declare-fun b_next!20173 () Bool)

(assert (=> b!1021726 (= b_free!20173 (not b_next!20173))))

(declare-fun tp!71554 () Bool)

(declare-fun b_and!32345 () Bool)

(assert (=> b!1021726 (= tp!71554 b_and!32345)))

(declare-fun b!1021723 () Bool)

(declare-fun res!684556 () Bool)

(declare-fun e!575502 () Bool)

(assert (=> b!1021723 (=> (not res!684556) (not e!575502))))

(declare-datatypes ((V!36731 0))(
  ( (V!36732 (val!11997 Int)) )
))
(declare-datatypes ((ValueCell!11243 0))(
  ( (ValueCellFull!11243 (v!14565 V!36731)) (EmptyCell!11243) )
))
(declare-datatypes ((array!63769 0))(
  ( (array!63770 (arr!30696 (Array (_ BitVec 32) (_ BitVec 64))) (size!31209 (_ BitVec 32))) )
))
(declare-datatypes ((array!63771 0))(
  ( (array!63772 (arr!30697 (Array (_ BitVec 32) ValueCell!11243)) (size!31210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5080 0))(
  ( (LongMapFixedSize!5081 (defaultEntry!5892 Int) (mask!29468 (_ BitVec 32)) (extraKeys!5624 (_ BitVec 32)) (zeroValue!5728 V!36731) (minValue!5728 V!36731) (_size!2595 (_ BitVec 32)) (_keys!11033 array!63769) (_values!5915 array!63771) (_vacant!2595 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5080)

(assert (=> b!1021723 (= res!684556 (and (= (size!31210 (_values!5915 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29468 thiss!1427))) (= (size!31209 (_keys!11033 thiss!1427)) (size!31210 (_values!5915 thiss!1427))) (bvsge (mask!29468 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5624 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5624 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5624 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021724 () Bool)

(declare-fun e!575504 () Bool)

(declare-fun e!575503 () Bool)

(declare-fun mapRes!37257 () Bool)

(assert (=> b!1021724 (= e!575504 (and e!575503 mapRes!37257))))

(declare-fun condMapEmpty!37257 () Bool)

(declare-fun mapDefault!37257 () ValueCell!11243)

(assert (=> b!1021724 (= condMapEmpty!37257 (= (arr!30697 (_values!5915 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11243)) mapDefault!37257)))))

(declare-fun res!684558 () Bool)

(assert (=> start!89130 (=> (not res!684558) (not e!575502))))

(declare-fun valid!1938 (LongMapFixedSize!5080) Bool)

(assert (=> start!89130 (= res!684558 (valid!1938 thiss!1427))))

(assert (=> start!89130 e!575502))

(declare-fun e!575500 () Bool)

(assert (=> start!89130 e!575500))

(assert (=> start!89130 true))

(declare-fun b!1021725 () Bool)

(assert (=> b!1021725 (= e!575502 false)))

(declare-fun lt!449953 () Bool)

(declare-datatypes ((List!21698 0))(
  ( (Nil!21695) (Cons!21694 (h!22892 (_ BitVec 64)) (t!30703 List!21698)) )
))
(declare-fun arrayNoDuplicates!0 (array!63769 (_ BitVec 32) List!21698) Bool)

(assert (=> b!1021725 (= lt!449953 (arrayNoDuplicates!0 (_keys!11033 thiss!1427) #b00000000000000000000000000000000 Nil!21695))))

(declare-fun tp_is_empty!23893 () Bool)

(declare-fun array_inv!23815 (array!63769) Bool)

(declare-fun array_inv!23816 (array!63771) Bool)

(assert (=> b!1021726 (= e!575500 (and tp!71554 tp_is_empty!23893 (array_inv!23815 (_keys!11033 thiss!1427)) (array_inv!23816 (_values!5915 thiss!1427)) e!575504))))

(declare-fun b!1021727 () Bool)

(declare-fun e!575501 () Bool)

(assert (=> b!1021727 (= e!575501 tp_is_empty!23893)))

(declare-fun mapNonEmpty!37257 () Bool)

(declare-fun tp!71553 () Bool)

(assert (=> mapNonEmpty!37257 (= mapRes!37257 (and tp!71553 e!575501))))

(declare-fun mapValue!37257 () ValueCell!11243)

(declare-fun mapKey!37257 () (_ BitVec 32))

(declare-fun mapRest!37257 () (Array (_ BitVec 32) ValueCell!11243))

(assert (=> mapNonEmpty!37257 (= (arr!30697 (_values!5915 thiss!1427)) (store mapRest!37257 mapKey!37257 mapValue!37257))))

(declare-fun mapIsEmpty!37257 () Bool)

(assert (=> mapIsEmpty!37257 mapRes!37257))

(declare-fun b!1021728 () Bool)

(assert (=> b!1021728 (= e!575503 tp_is_empty!23893)))

(declare-fun b!1021729 () Bool)

(declare-fun res!684555 () Bool)

(assert (=> b!1021729 (=> (not res!684555) (not e!575502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021729 (= res!684555 (validMask!0 (mask!29468 thiss!1427)))))

(declare-fun b!1021730 () Bool)

(declare-fun res!684559 () Bool)

(assert (=> b!1021730 (=> (not res!684559) (not e!575502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63769 (_ BitVec 32)) Bool)

(assert (=> b!1021730 (= res!684559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11033 thiss!1427) (mask!29468 thiss!1427)))))

(declare-fun b!1021731 () Bool)

(declare-fun res!684557 () Bool)

(assert (=> b!1021731 (=> (not res!684557) (not e!575502))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021731 (= res!684557 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!89130 res!684558) b!1021731))

(assert (= (and b!1021731 res!684557) b!1021729))

(assert (= (and b!1021729 res!684555) b!1021723))

(assert (= (and b!1021723 res!684556) b!1021730))

(assert (= (and b!1021730 res!684559) b!1021725))

(assert (= (and b!1021724 condMapEmpty!37257) mapIsEmpty!37257))

(assert (= (and b!1021724 (not condMapEmpty!37257)) mapNonEmpty!37257))

(get-info :version)

(assert (= (and mapNonEmpty!37257 ((_ is ValueCellFull!11243) mapValue!37257)) b!1021727))

(assert (= (and b!1021724 ((_ is ValueCellFull!11243) mapDefault!37257)) b!1021728))

(assert (= b!1021726 b!1021724))

(assert (= start!89130 b!1021726))

(declare-fun m!940575 () Bool)

(assert (=> b!1021725 m!940575))

(declare-fun m!940577 () Bool)

(assert (=> b!1021730 m!940577))

(declare-fun m!940579 () Bool)

(assert (=> start!89130 m!940579))

(declare-fun m!940581 () Bool)

(assert (=> b!1021726 m!940581))

(declare-fun m!940583 () Bool)

(assert (=> b!1021726 m!940583))

(declare-fun m!940585 () Bool)

(assert (=> b!1021729 m!940585))

(declare-fun m!940587 () Bool)

(assert (=> mapNonEmpty!37257 m!940587))

(check-sat b_and!32345 (not b_next!20173) tp_is_empty!23893 (not b!1021725) (not mapNonEmpty!37257) (not start!89130) (not b!1021726) (not b!1021730) (not b!1021729))
(check-sat b_and!32345 (not b_next!20173))
