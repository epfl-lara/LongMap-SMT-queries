; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89354 () Bool)

(assert start!89354)

(declare-fun b!1024234 () Bool)

(declare-fun b_free!20353 () Bool)

(declare-fun b_next!20353 () Bool)

(assert (=> b!1024234 (= b_free!20353 (not b_next!20353))))

(declare-fun tp!72105 () Bool)

(declare-fun b_and!32599 () Bool)

(assert (=> b!1024234 (= tp!72105 b_and!32599)))

(declare-fun b!1024233 () Bool)

(declare-fun e!577302 () Bool)

(assert (=> b!1024233 (= e!577302 false)))

(declare-datatypes ((SeekEntryResult!9590 0))(
  ( (MissingZero!9590 (index!40731 (_ BitVec 32))) (Found!9590 (index!40732 (_ BitVec 32))) (Intermediate!9590 (undefined!10402 Bool) (index!40733 (_ BitVec 32)) (x!91060 (_ BitVec 32))) (Undefined!9590) (MissingVacant!9590 (index!40734 (_ BitVec 32))) )
))
(declare-fun lt!450564 () SeekEntryResult!9590)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!36971 0))(
  ( (V!36972 (val!12087 Int)) )
))
(declare-datatypes ((ValueCell!11333 0))(
  ( (ValueCellFull!11333 (v!14656 V!36971)) (EmptyCell!11333) )
))
(declare-datatypes ((array!64196 0))(
  ( (array!64197 (arr!30907 (Array (_ BitVec 32) (_ BitVec 64))) (size!31420 (_ BitVec 32))) )
))
(declare-datatypes ((array!64198 0))(
  ( (array!64199 (arr!30908 (Array (_ BitVec 32) ValueCell!11333)) (size!31421 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5260 0))(
  ( (LongMapFixedSize!5261 (defaultEntry!5982 Int) (mask!29628 (_ BitVec 32)) (extraKeys!5714 (_ BitVec 32)) (zeroValue!5818 V!36971) (minValue!5818 V!36971) (_size!2685 (_ BitVec 32)) (_keys!11129 array!64196) (_values!6005 array!64198) (_vacant!2685 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5260)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64196 (_ BitVec 32)) SeekEntryResult!9590)

(assert (=> b!1024233 (= lt!450564 (seekEntry!0 key!909 (_keys!11129 thiss!1427) (mask!29628 thiss!1427)))))

(declare-fun tp_is_empty!24073 () Bool)

(declare-fun e!577301 () Bool)

(declare-fun e!577306 () Bool)

(declare-fun array_inv!23945 (array!64196) Bool)

(declare-fun array_inv!23946 (array!64198) Bool)

(assert (=> b!1024234 (= e!577306 (and tp!72105 tp_is_empty!24073 (array_inv!23945 (_keys!11129 thiss!1427)) (array_inv!23946 (_values!6005 thiss!1427)) e!577301))))

(declare-fun mapIsEmpty!37538 () Bool)

(declare-fun mapRes!37538 () Bool)

(assert (=> mapIsEmpty!37538 mapRes!37538))

(declare-fun res!685777 () Bool)

(assert (=> start!89354 (=> (not res!685777) (not e!577302))))

(declare-fun valid!2003 (LongMapFixedSize!5260) Bool)

(assert (=> start!89354 (= res!685777 (valid!2003 thiss!1427))))

(assert (=> start!89354 e!577302))

(assert (=> start!89354 e!577306))

(assert (=> start!89354 true))

(declare-fun b!1024235 () Bool)

(declare-fun e!577305 () Bool)

(assert (=> b!1024235 (= e!577305 tp_is_empty!24073)))

(declare-fun mapNonEmpty!37538 () Bool)

(declare-fun tp!72104 () Bool)

(assert (=> mapNonEmpty!37538 (= mapRes!37538 (and tp!72104 e!577305))))

(declare-fun mapRest!37538 () (Array (_ BitVec 32) ValueCell!11333))

(declare-fun mapValue!37538 () ValueCell!11333)

(declare-fun mapKey!37538 () (_ BitVec 32))

(assert (=> mapNonEmpty!37538 (= (arr!30908 (_values!6005 thiss!1427)) (store mapRest!37538 mapKey!37538 mapValue!37538))))

(declare-fun b!1024236 () Bool)

(declare-fun e!577303 () Bool)

(assert (=> b!1024236 (= e!577303 tp_is_empty!24073)))

(declare-fun b!1024237 () Bool)

(declare-fun res!685778 () Bool)

(assert (=> b!1024237 (=> (not res!685778) (not e!577302))))

(assert (=> b!1024237 (= res!685778 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024238 () Bool)

(assert (=> b!1024238 (= e!577301 (and e!577303 mapRes!37538))))

(declare-fun condMapEmpty!37538 () Bool)

(declare-fun mapDefault!37538 () ValueCell!11333)

