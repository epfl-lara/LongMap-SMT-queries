; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90056 () Bool)

(assert start!90056)

(declare-fun b!1031448 () Bool)

(declare-fun b_free!20663 () Bool)

(declare-fun b_next!20663 () Bool)

(assert (=> b!1031448 (= b_free!20663 (not b_next!20663))))

(declare-fun tp!73060 () Bool)

(declare-fun b_and!33093 () Bool)

(assert (=> b!1031448 (= tp!73060 b_and!33093)))

(declare-fun b!1031447 () Bool)

(declare-fun e!582566 () Bool)

(declare-fun tp_is_empty!24383 () Bool)

(assert (=> b!1031447 (= e!582566 tp_is_empty!24383)))

(declare-fun e!582572 () Bool)

(declare-datatypes ((V!37383 0))(
  ( (V!37384 (val!12242 Int)) )
))
(declare-datatypes ((ValueCell!11488 0))(
  ( (ValueCellFull!11488 (v!14819 V!37383)) (EmptyCell!11488) )
))
(declare-datatypes ((array!64830 0))(
  ( (array!64831 (arr!31217 (Array (_ BitVec 32) (_ BitVec 64))) (size!31734 (_ BitVec 32))) )
))
(declare-datatypes ((array!64832 0))(
  ( (array!64833 (arr!31218 (Array (_ BitVec 32) ValueCell!11488)) (size!31735 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5570 0))(
  ( (LongMapFixedSize!5571 (defaultEntry!6159 Int) (mask!29955 (_ BitVec 32)) (extraKeys!5891 (_ BitVec 32)) (zeroValue!5995 V!37383) (minValue!5995 V!37383) (_size!2840 (_ BitVec 32)) (_keys!11332 array!64830) (_values!6182 array!64832) (_vacant!2840 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5570)

(declare-fun e!582570 () Bool)

(declare-fun array_inv!24163 (array!64830) Bool)

(declare-fun array_inv!24164 (array!64832) Bool)

(assert (=> b!1031448 (= e!582570 (and tp!73060 tp_is_empty!24383 (array_inv!24163 (_keys!11332 thiss!1427)) (array_inv!24164 (_values!6182 thiss!1427)) e!582572))))

(declare-fun mapIsEmpty!38028 () Bool)

(declare-fun mapRes!38028 () Bool)

(assert (=> mapIsEmpty!38028 mapRes!38028))

(declare-fun mapNonEmpty!38028 () Bool)

(declare-fun tp!73059 () Bool)

(assert (=> mapNonEmpty!38028 (= mapRes!38028 (and tp!73059 e!582566))))

(declare-fun mapRest!38028 () (Array (_ BitVec 32) ValueCell!11488))

(declare-fun mapValue!38028 () ValueCell!11488)

(declare-fun mapKey!38028 () (_ BitVec 32))

(assert (=> mapNonEmpty!38028 (= (arr!31218 (_values!6182 thiss!1427)) (store mapRest!38028 mapKey!38028 mapValue!38028))))

(declare-fun b!1031449 () Bool)

(declare-fun res!689653 () Bool)

(declare-fun e!582573 () Bool)

(assert (=> b!1031449 (=> res!689653 e!582573)))

(declare-datatypes ((Unit!33731 0))(
  ( (Unit!33732) )
))
(declare-datatypes ((tuple2!15658 0))(
  ( (tuple2!15659 (_1!7840 Unit!33731) (_2!7840 LongMapFixedSize!5570)) )
))
(declare-fun lt!455374 () tuple2!15658)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64830 (_ BitVec 32)) Bool)

(assert (=> b!1031449 (= res!689653 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11332 (_2!7840 lt!455374)) (mask!29955 (_2!7840 lt!455374)))))))

(declare-fun b!1031450 () Bool)

(declare-fun e!582571 () Bool)

(assert (=> b!1031450 (= e!582572 (and e!582571 mapRes!38028))))

(declare-fun condMapEmpty!38028 () Bool)

(declare-fun mapDefault!38028 () ValueCell!11488)

