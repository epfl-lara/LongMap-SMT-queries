; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89110 () Bool)

(assert start!89110)

(declare-fun b!1021584 () Bool)

(declare-fun b_free!20151 () Bool)

(declare-fun b_next!20151 () Bool)

(assert (=> b!1021584 (= b_free!20151 (not b_next!20151))))

(declare-fun tp!71487 () Bool)

(declare-fun b_and!32349 () Bool)

(assert (=> b!1021584 (= tp!71487 b_and!32349)))

(declare-fun b!1021577 () Bool)

(declare-fun res!684460 () Bool)

(declare-fun e!575395 () Bool)

(assert (=> b!1021577 (=> (not res!684460) (not e!575395))))

(declare-datatypes ((V!36701 0))(
  ( (V!36702 (val!11986 Int)) )
))
(declare-datatypes ((ValueCell!11232 0))(
  ( (ValueCellFull!11232 (v!14555 V!36701)) (EmptyCell!11232) )
))
(declare-datatypes ((array!63786 0))(
  ( (array!63787 (arr!30705 (Array (_ BitVec 32) (_ BitVec 64))) (size!31216 (_ BitVec 32))) )
))
(declare-datatypes ((array!63788 0))(
  ( (array!63789 (arr!30706 (Array (_ BitVec 32) ValueCell!11232)) (size!31217 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5058 0))(
  ( (LongMapFixedSize!5059 (defaultEntry!5881 Int) (mask!29454 (_ BitVec 32)) (extraKeys!5613 (_ BitVec 32)) (zeroValue!5717 V!36701) (minValue!5717 V!36701) (_size!2584 (_ BitVec 32)) (_keys!11026 array!63786) (_values!5904 array!63788) (_vacant!2584 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5058)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021577 (= res!684460 (validMask!0 (mask!29454 thiss!1427)))))

(declare-fun mapNonEmpty!37224 () Bool)

(declare-fun mapRes!37224 () Bool)

(declare-fun tp!71488 () Bool)

(declare-fun e!575394 () Bool)

(assert (=> mapNonEmpty!37224 (= mapRes!37224 (and tp!71488 e!575394))))

(declare-fun mapRest!37224 () (Array (_ BitVec 32) ValueCell!11232))

(declare-fun mapKey!37224 () (_ BitVec 32))

(declare-fun mapValue!37224 () ValueCell!11232)

(assert (=> mapNonEmpty!37224 (= (arr!30706 (_values!5904 thiss!1427)) (store mapRest!37224 mapKey!37224 mapValue!37224))))

(declare-fun b!1021578 () Bool)

(declare-fun tp_is_empty!23871 () Bool)

(assert (=> b!1021578 (= e!575394 tp_is_empty!23871)))

(declare-fun res!684459 () Bool)

(assert (=> start!89110 (=> (not res!684459) (not e!575395))))

(declare-fun valid!1929 (LongMapFixedSize!5058) Bool)

(assert (=> start!89110 (= res!684459 (valid!1929 thiss!1427))))

(assert (=> start!89110 e!575395))

(declare-fun e!575396 () Bool)

(assert (=> start!89110 e!575396))

(assert (=> start!89110 true))

(declare-fun mapIsEmpty!37224 () Bool)

(assert (=> mapIsEmpty!37224 mapRes!37224))

(declare-fun b!1021579 () Bool)

(declare-fun res!684457 () Bool)

(assert (=> b!1021579 (=> (not res!684457) (not e!575395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63786 (_ BitVec 32)) Bool)

(assert (=> b!1021579 (= res!684457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11026 thiss!1427) (mask!29454 thiss!1427)))))

(declare-fun b!1021580 () Bool)

(assert (=> b!1021580 (= e!575395 false)))

(declare-fun lt!450120 () Bool)

(declare-datatypes ((List!21658 0))(
  ( (Nil!21655) (Cons!21654 (h!22852 (_ BitVec 64)) (t!30672 List!21658)) )
))
(declare-fun arrayNoDuplicates!0 (array!63786 (_ BitVec 32) List!21658) Bool)

(assert (=> b!1021580 (= lt!450120 (arrayNoDuplicates!0 (_keys!11026 thiss!1427) #b00000000000000000000000000000000 Nil!21655))))

(declare-fun b!1021581 () Bool)

(declare-fun res!684461 () Bool)

(assert (=> b!1021581 (=> (not res!684461) (not e!575395))))

(assert (=> b!1021581 (= res!684461 (and (= (size!31217 (_values!5904 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29454 thiss!1427))) (= (size!31216 (_keys!11026 thiss!1427)) (size!31217 (_values!5904 thiss!1427))) (bvsge (mask!29454 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5613 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5613 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5613 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5613 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5613 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5613 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5613 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021582 () Bool)

(declare-fun e!575392 () Bool)

(assert (=> b!1021582 (= e!575392 tp_is_empty!23871)))

(declare-fun b!1021583 () Bool)

(declare-fun e!575397 () Bool)

(assert (=> b!1021583 (= e!575397 (and e!575392 mapRes!37224))))

(declare-fun condMapEmpty!37224 () Bool)

(declare-fun mapDefault!37224 () ValueCell!11232)

(assert (=> b!1021583 (= condMapEmpty!37224 (= (arr!30706 (_values!5904 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11232)) mapDefault!37224)))))

(declare-fun array_inv!23811 (array!63786) Bool)

(declare-fun array_inv!23812 (array!63788) Bool)

(assert (=> b!1021584 (= e!575396 (and tp!71487 tp_is_empty!23871 (array_inv!23811 (_keys!11026 thiss!1427)) (array_inv!23812 (_values!5904 thiss!1427)) e!575397))))

(declare-fun b!1021585 () Bool)

(declare-fun res!684458 () Bool)

(assert (=> b!1021585 (=> (not res!684458) (not e!575395))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021585 (= res!684458 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!89110 res!684459) b!1021585))

(assert (= (and b!1021585 res!684458) b!1021577))

(assert (= (and b!1021577 res!684460) b!1021581))

(assert (= (and b!1021581 res!684461) b!1021579))

(assert (= (and b!1021579 res!684457) b!1021580))

(assert (= (and b!1021583 condMapEmpty!37224) mapIsEmpty!37224))

(assert (= (and b!1021583 (not condMapEmpty!37224)) mapNonEmpty!37224))

(get-info :version)

(assert (= (and mapNonEmpty!37224 ((_ is ValueCellFull!11232) mapValue!37224)) b!1021578))

(assert (= (and b!1021583 ((_ is ValueCellFull!11232) mapDefault!37224)) b!1021582))

(assert (= b!1021584 b!1021583))

(assert (= start!89110 b!1021584))

(declare-fun m!941041 () Bool)

(assert (=> b!1021580 m!941041))

(declare-fun m!941043 () Bool)

(assert (=> b!1021584 m!941043))

(declare-fun m!941045 () Bool)

(assert (=> b!1021584 m!941045))

(declare-fun m!941047 () Bool)

(assert (=> mapNonEmpty!37224 m!941047))

(declare-fun m!941049 () Bool)

(assert (=> b!1021579 m!941049))

(declare-fun m!941051 () Bool)

(assert (=> start!89110 m!941051))

(declare-fun m!941053 () Bool)

(assert (=> b!1021577 m!941053))

(check-sat b_and!32349 tp_is_empty!23871 (not b!1021579) (not mapNonEmpty!37224) (not b_next!20151) (not b!1021577) (not start!89110) (not b!1021580) (not b!1021584))
(check-sat b_and!32349 (not b_next!20151))
