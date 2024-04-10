; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90184 () Bool)

(assert start!90184)

(declare-fun b!1032750 () Bool)

(declare-fun b_free!20743 () Bool)

(declare-fun b_next!20743 () Bool)

(assert (=> b!1032750 (= b_free!20743 (not b_next!20743))))

(declare-fun tp!73311 () Bool)

(declare-fun b_and!33211 () Bool)

(assert (=> b!1032750 (= tp!73311 b_and!33211)))

(declare-fun mapNonEmpty!38160 () Bool)

(declare-fun mapRes!38160 () Bool)

(declare-fun tp!73312 () Bool)

(declare-fun e!583596 () Bool)

(assert (=> mapNonEmpty!38160 (= mapRes!38160 (and tp!73312 e!583596))))

(declare-datatypes ((V!37491 0))(
  ( (V!37492 (val!12282 Int)) )
))
(declare-datatypes ((ValueCell!11528 0))(
  ( (ValueCellFull!11528 (v!14859 V!37491)) (EmptyCell!11528) )
))
(declare-fun mapRest!38160 () (Array (_ BitVec 32) ValueCell!11528))

(declare-fun mapKey!38160 () (_ BitVec 32))

(declare-fun mapValue!38160 () ValueCell!11528)

(declare-datatypes ((array!64996 0))(
  ( (array!64997 (arr!31297 (Array (_ BitVec 32) (_ BitVec 64))) (size!31817 (_ BitVec 32))) )
))
(declare-datatypes ((array!64998 0))(
  ( (array!64999 (arr!31298 (Array (_ BitVec 32) ValueCell!11528)) (size!31818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5650 0))(
  ( (LongMapFixedSize!5651 (defaultEntry!6199 Int) (mask!30029 (_ BitVec 32)) (extraKeys!5931 (_ BitVec 32)) (zeroValue!6035 V!37491) (minValue!6035 V!37491) (_size!2880 (_ BitVec 32)) (_keys!11375 array!64996) (_values!6222 array!64998) (_vacant!2880 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5650)

(assert (=> mapNonEmpty!38160 (= (arr!31298 (_values!6222 thiss!1427)) (store mapRest!38160 mapKey!38160 mapValue!38160))))

(declare-fun b!1032746 () Bool)

(declare-fun e!583594 () Bool)

(declare-fun tp_is_empty!24463 () Bool)

(assert (=> b!1032746 (= e!583594 tp_is_empty!24463)))

(declare-fun b!1032748 () Bool)

(declare-fun e!583592 () Bool)

(assert (=> b!1032748 (= e!583592 (and (= (size!31818 (_values!6222 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30029 thiss!1427))) (= (size!31817 (_keys!11375 thiss!1427)) (size!31818 (_values!6222 thiss!1427))) (bvslt (mask!30029 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032749 () Bool)

(declare-fun e!583595 () Bool)

(assert (=> b!1032749 (= e!583595 (and e!583594 mapRes!38160))))

(declare-fun condMapEmpty!38160 () Bool)

(declare-fun mapDefault!38160 () ValueCell!11528)

