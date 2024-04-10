; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90242 () Bool)

(assert start!90242)

(declare-fun b!1033093 () Bool)

(declare-fun b_free!20761 () Bool)

(declare-fun b_next!20761 () Bool)

(assert (=> b!1033093 (= b_free!20761 (not b_next!20761))))

(declare-fun tp!73377 () Bool)

(declare-fun b_and!33229 () Bool)

(assert (=> b!1033093 (= tp!73377 b_and!33229)))

(declare-fun b!1033092 () Bool)

(declare-fun e!583845 () Bool)

(declare-datatypes ((V!37515 0))(
  ( (V!37516 (val!12291 Int)) )
))
(declare-datatypes ((ValueCell!11537 0))(
  ( (ValueCellFull!11537 (v!14868 V!37515)) (EmptyCell!11537) )
))
(declare-datatypes ((array!65038 0))(
  ( (array!65039 (arr!31315 (Array (_ BitVec 32) (_ BitVec 64))) (size!31837 (_ BitVec 32))) )
))
(declare-datatypes ((array!65040 0))(
  ( (array!65041 (arr!31316 (Array (_ BitVec 32) ValueCell!11537)) (size!31838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5668 0))(
  ( (LongMapFixedSize!5669 (defaultEntry!6208 Int) (mask!30049 (_ BitVec 32)) (extraKeys!5940 (_ BitVec 32)) (zeroValue!6044 V!37515) (minValue!6044 V!37515) (_size!2889 (_ BitVec 32)) (_keys!11386 array!65038) (_values!6231 array!65040) (_vacant!2889 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5668)

(assert (=> b!1033092 (= e!583845 (and (= (size!31838 (_values!6231 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30049 thiss!1427))) (= (size!31837 (_keys!11386 thiss!1427)) (size!31838 (_values!6231 thiss!1427))) (bvsge (mask!30049 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5940 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5940 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5940 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38198 () Bool)

(declare-fun mapRes!38198 () Bool)

(declare-fun tp!73376 () Bool)

(declare-fun e!583847 () Bool)

(assert (=> mapNonEmpty!38198 (= mapRes!38198 (and tp!73376 e!583847))))

(declare-fun mapValue!38198 () ValueCell!11537)

(declare-fun mapKey!38198 () (_ BitVec 32))

(declare-fun mapRest!38198 () (Array (_ BitVec 32) ValueCell!11537))

(assert (=> mapNonEmpty!38198 (= (arr!31316 (_values!6231 thiss!1427)) (store mapRest!38198 mapKey!38198 mapValue!38198))))

(declare-fun mapIsEmpty!38198 () Bool)

(assert (=> mapIsEmpty!38198 mapRes!38198))

(declare-fun b!1033094 () Bool)

(declare-fun res!690350 () Bool)

(assert (=> b!1033094 (=> (not res!690350) (not e!583845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033094 (= res!690350 (validMask!0 (mask!30049 thiss!1427)))))

(declare-fun b!1033095 () Bool)

(declare-fun e!583844 () Bool)

(declare-fun tp_is_empty!24481 () Bool)

(assert (=> b!1033095 (= e!583844 tp_is_empty!24481)))

(declare-fun b!1033096 () Bool)

(assert (=> b!1033096 (= e!583847 tp_is_empty!24481)))

(declare-fun b!1033097 () Bool)

(declare-fun res!690348 () Bool)

(assert (=> b!1033097 (=> (not res!690348) (not e!583845))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033097 (= res!690348 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033098 () Bool)

(declare-fun e!583846 () Bool)

(assert (=> b!1033098 (= e!583846 (and e!583844 mapRes!38198))))

(declare-fun condMapEmpty!38198 () Bool)

(declare-fun mapDefault!38198 () ValueCell!11537)

