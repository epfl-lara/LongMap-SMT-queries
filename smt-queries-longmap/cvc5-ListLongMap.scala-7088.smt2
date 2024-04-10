; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89688 () Bool)

(assert start!89688)

(declare-fun b!1028304 () Bool)

(declare-fun b_free!20581 () Bool)

(declare-fun b_next!20581 () Bool)

(assert (=> b!1028304 (= b_free!20581 (not b_next!20581))))

(declare-fun tp!72796 () Bool)

(declare-fun b_and!32863 () Bool)

(assert (=> b!1028304 (= tp!72796 b_and!32863)))

(declare-fun b!1028299 () Bool)

(declare-fun res!688093 () Bool)

(declare-fun e!580438 () Bool)

(assert (=> b!1028299 (=> (not res!688093) (not e!580438))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1028299 (= res!688093 (not (= key!909 (bvneg key!909))))))

(declare-fun res!688094 () Bool)

(assert (=> start!89688 (=> (not res!688094) (not e!580438))))

(declare-datatypes ((V!37275 0))(
  ( (V!37276 (val!12201 Int)) )
))
(declare-datatypes ((ValueCell!11447 0))(
  ( (ValueCellFull!11447 (v!14772 V!37275)) (EmptyCell!11447) )
))
(declare-datatypes ((array!64656 0))(
  ( (array!64657 (arr!31135 (Array (_ BitVec 32) (_ BitVec 64))) (size!31649 (_ BitVec 32))) )
))
(declare-datatypes ((array!64658 0))(
  ( (array!64659 (arr!31136 (Array (_ BitVec 32) ValueCell!11447)) (size!31650 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5488 0))(
  ( (LongMapFixedSize!5489 (defaultEntry!6102 Int) (mask!29837 (_ BitVec 32)) (extraKeys!5834 (_ BitVec 32)) (zeroValue!5938 V!37275) (minValue!5938 V!37275) (_size!2799 (_ BitVec 32)) (_keys!11256 array!64656) (_values!6125 array!64658) (_vacant!2799 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5488)

(declare-fun valid!2078 (LongMapFixedSize!5488) Bool)

(assert (=> start!89688 (= res!688094 (valid!2078 thiss!1427))))

(assert (=> start!89688 e!580438))

(declare-fun e!580436 () Bool)

(assert (=> start!89688 e!580436))

(assert (=> start!89688 true))

(declare-fun b!1028300 () Bool)

(declare-fun e!580441 () Bool)

(declare-fun tp_is_empty!24301 () Bool)

(assert (=> b!1028300 (= e!580441 tp_is_empty!24301)))

(declare-fun mapIsEmpty!37887 () Bool)

(declare-fun mapRes!37887 () Bool)

(assert (=> mapIsEmpty!37887 mapRes!37887))

(declare-fun mapNonEmpty!37887 () Bool)

(declare-fun tp!72795 () Bool)

(assert (=> mapNonEmpty!37887 (= mapRes!37887 (and tp!72795 e!580441))))

(declare-fun mapKey!37887 () (_ BitVec 32))

(declare-fun mapRest!37887 () (Array (_ BitVec 32) ValueCell!11447))

(declare-fun mapValue!37887 () ValueCell!11447)

(assert (=> mapNonEmpty!37887 (= (arr!31136 (_values!6125 thiss!1427)) (store mapRest!37887 mapKey!37887 mapValue!37887))))

(declare-fun b!1028301 () Bool)

(declare-fun e!580439 () Bool)

(declare-fun e!580442 () Bool)

(assert (=> b!1028301 (= e!580439 (and e!580442 mapRes!37887))))

(declare-fun condMapEmpty!37887 () Bool)

(declare-fun mapDefault!37887 () ValueCell!11447)

