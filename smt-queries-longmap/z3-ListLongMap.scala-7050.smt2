; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89588 () Bool)

(assert start!89588)

(declare-fun b!1025550 () Bool)

(declare-fun b_free!20353 () Bool)

(declare-fun b_next!20353 () Bool)

(assert (=> b!1025550 (= b_free!20353 (not b_next!20353))))

(declare-fun tp!72104 () Bool)

(declare-fun b_and!32609 () Bool)

(assert (=> b!1025550 (= tp!72104 b_and!32609)))

(declare-fun res!686287 () Bool)

(declare-fun e!578148 () Bool)

(assert (=> start!89588 (=> (not res!686287) (not e!578148))))

(declare-datatypes ((V!36971 0))(
  ( (V!36972 (val!12087 Int)) )
))
(declare-datatypes ((ValueCell!11333 0))(
  ( (ValueCellFull!11333 (v!14652 V!36971)) (EmptyCell!11333) )
))
(declare-datatypes ((array!64245 0))(
  ( (array!64246 (arr!30925 (Array (_ BitVec 32) (_ BitVec 64))) (size!31439 (_ BitVec 32))) )
))
(declare-datatypes ((array!64247 0))(
  ( (array!64248 (arr!30926 (Array (_ BitVec 32) ValueCell!11333)) (size!31440 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5260 0))(
  ( (LongMapFixedSize!5261 (defaultEntry!5982 Int) (mask!29688 (_ BitVec 32)) (extraKeys!5714 (_ BitVec 32)) (zeroValue!5818 V!36971) (minValue!5818 V!36971) (_size!2685 (_ BitVec 32)) (_keys!11167 array!64245) (_values!6005 array!64247) (_vacant!2685 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5260)

(declare-fun valid!2009 (LongMapFixedSize!5260) Bool)

(assert (=> start!89588 (= res!686287 (valid!2009 thiss!1427))))

(assert (=> start!89588 e!578148))

(declare-fun e!578147 () Bool)

(assert (=> start!89588 e!578147))

(assert (=> start!89588 true))

(declare-fun b!1025548 () Bool)

(assert (=> b!1025548 (= e!578148 false)))

(declare-datatypes ((SeekEntryResult!9544 0))(
  ( (MissingZero!9544 (index!40547 (_ BitVec 32))) (Found!9544 (index!40548 (_ BitVec 32))) (Intermediate!9544 (undefined!10356 Bool) (index!40549 (_ BitVec 32)) (x!91036 (_ BitVec 32))) (Undefined!9544) (MissingVacant!9544 (index!40550 (_ BitVec 32))) )
))
(declare-fun lt!451079 () SeekEntryResult!9544)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64245 (_ BitVec 32)) SeekEntryResult!9544)

(assert (=> b!1025548 (= lt!451079 (seekEntry!0 key!909 (_keys!11167 thiss!1427) (mask!29688 thiss!1427)))))

(declare-fun b!1025549 () Bool)

(declare-fun e!578144 () Bool)

(declare-fun e!578145 () Bool)

(declare-fun mapRes!37538 () Bool)

(assert (=> b!1025549 (= e!578144 (and e!578145 mapRes!37538))))

(declare-fun condMapEmpty!37538 () Bool)

(declare-fun mapDefault!37538 () ValueCell!11333)

(assert (=> b!1025549 (= condMapEmpty!37538 (= (arr!30926 (_values!6005 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11333)) mapDefault!37538)))))

(declare-fun mapIsEmpty!37538 () Bool)

(assert (=> mapIsEmpty!37538 mapRes!37538))

(declare-fun tp_is_empty!24073 () Bool)

(declare-fun array_inv!23973 (array!64245) Bool)

(declare-fun array_inv!23974 (array!64247) Bool)

(assert (=> b!1025550 (= e!578147 (and tp!72104 tp_is_empty!24073 (array_inv!23973 (_keys!11167 thiss!1427)) (array_inv!23974 (_values!6005 thiss!1427)) e!578144))))

(declare-fun b!1025551 () Bool)

(declare-fun e!578146 () Bool)

(assert (=> b!1025551 (= e!578146 tp_is_empty!24073)))

(declare-fun b!1025552 () Bool)

(declare-fun res!686288 () Bool)

(assert (=> b!1025552 (=> (not res!686288) (not e!578148))))

(assert (=> b!1025552 (= res!686288 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025553 () Bool)

(assert (=> b!1025553 (= e!578145 tp_is_empty!24073)))

(declare-fun mapNonEmpty!37538 () Bool)

(declare-fun tp!72105 () Bool)

(assert (=> mapNonEmpty!37538 (= mapRes!37538 (and tp!72105 e!578146))))

(declare-fun mapValue!37538 () ValueCell!11333)

(declare-fun mapKey!37538 () (_ BitVec 32))

(declare-fun mapRest!37538 () (Array (_ BitVec 32) ValueCell!11333))

(assert (=> mapNonEmpty!37538 (= (arr!30926 (_values!6005 thiss!1427)) (store mapRest!37538 mapKey!37538 mapValue!37538))))

(assert (= (and start!89588 res!686287) b!1025552))

(assert (= (and b!1025552 res!686288) b!1025548))

(assert (= (and b!1025549 condMapEmpty!37538) mapIsEmpty!37538))

(assert (= (and b!1025549 (not condMapEmpty!37538)) mapNonEmpty!37538))

(get-info :version)

(assert (= (and mapNonEmpty!37538 ((_ is ValueCellFull!11333) mapValue!37538)) b!1025551))

(assert (= (and b!1025549 ((_ is ValueCellFull!11333) mapDefault!37538)) b!1025553))

(assert (= b!1025550 b!1025549))

(assert (= start!89588 b!1025550))

(declare-fun m!944307 () Bool)

(assert (=> start!89588 m!944307))

(declare-fun m!944309 () Bool)

(assert (=> b!1025548 m!944309))

(declare-fun m!944311 () Bool)

(assert (=> b!1025550 m!944311))

(declare-fun m!944313 () Bool)

(assert (=> b!1025550 m!944313))

(declare-fun m!944315 () Bool)

(assert (=> mapNonEmpty!37538 m!944315))

(check-sat (not b_next!20353) tp_is_empty!24073 b_and!32609 (not start!89588) (not b!1025550) (not mapNonEmpty!37538) (not b!1025548))
(check-sat b_and!32609 (not b_next!20353))
