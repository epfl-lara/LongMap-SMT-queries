; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91852 () Bool)

(assert start!91852)

(declare-fun b!1044922 () Bool)

(declare-fun b_free!21127 () Bool)

(declare-fun b_next!21127 () Bool)

(assert (=> b!1044922 (= b_free!21127 (not b_next!21127))))

(declare-fun tp!74633 () Bool)

(declare-fun b_and!33725 () Bool)

(assert (=> b!1044922 (= tp!74633 b_and!33725)))

(declare-fun b!1044921 () Bool)

(declare-fun res!695857 () Bool)

(declare-fun e!592248 () Bool)

(assert (=> b!1044921 (=> res!695857 e!592248)))

(declare-datatypes ((V!38003 0))(
  ( (V!38004 (val!12474 Int)) )
))
(declare-datatypes ((ValueCell!11720 0))(
  ( (ValueCellFull!11720 (v!15068 V!38003)) (EmptyCell!11720) )
))
(declare-datatypes ((Unit!34123 0))(
  ( (Unit!34124) )
))
(declare-datatypes ((array!65866 0))(
  ( (array!65867 (arr!31681 (Array (_ BitVec 32) (_ BitVec 64))) (size!32216 (_ BitVec 32))) )
))
(declare-datatypes ((array!65868 0))(
  ( (array!65869 (arr!31682 (Array (_ BitVec 32) ValueCell!11720)) (size!32217 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6034 0))(
  ( (LongMapFixedSize!6035 (defaultEntry!6409 Int) (mask!30528 (_ BitVec 32)) (extraKeys!6137 (_ BitVec 32)) (zeroValue!6243 V!38003) (minValue!6243 V!38003) (_size!3072 (_ BitVec 32)) (_keys!11677 array!65866) (_values!6432 array!65868) (_vacant!3072 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15772 0))(
  ( (tuple2!15773 (_1!7897 Unit!34123) (_2!7897 LongMapFixedSize!6034)) )
))
(declare-fun lt!461106 () tuple2!15772)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044921 (= res!695857 (not (validMask!0 (mask!30528 (_2!7897 lt!461106)))))))

(declare-fun e!592244 () Bool)

(declare-fun e!592251 () Bool)

(declare-fun tp_is_empty!24847 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!6034)

(declare-fun array_inv!24471 (array!65866) Bool)

(declare-fun array_inv!24472 (array!65868) Bool)

(assert (=> b!1044922 (= e!592244 (and tp!74633 tp_is_empty!24847 (array_inv!24471 (_keys!11677 thiss!1427)) (array_inv!24472 (_values!6432 thiss!1427)) e!592251))))

(declare-fun mapNonEmpty!38906 () Bool)

(declare-fun mapRes!38906 () Bool)

(declare-fun tp!74634 () Bool)

(declare-fun e!592249 () Bool)

(assert (=> mapNonEmpty!38906 (= mapRes!38906 (and tp!74634 e!592249))))

(declare-fun mapKey!38906 () (_ BitVec 32))

(declare-fun mapRest!38906 () (Array (_ BitVec 32) ValueCell!11720))

(declare-fun mapValue!38906 () ValueCell!11720)

(assert (=> mapNonEmpty!38906 (= (arr!31682 (_values!6432 thiss!1427)) (store mapRest!38906 mapKey!38906 mapValue!38906))))

(declare-fun b!1044923 () Bool)

(assert (=> b!1044923 (= e!592249 tp_is_empty!24847)))

(declare-fun res!695859 () Bool)

(declare-fun e!592245 () Bool)

(assert (=> start!91852 (=> (not res!695859) (not e!592245))))

(declare-fun valid!2264 (LongMapFixedSize!6034) Bool)

(assert (=> start!91852 (= res!695859 (valid!2264 thiss!1427))))

(assert (=> start!91852 e!592245))

(assert (=> start!91852 e!592244))

(assert (=> start!91852 true))

(declare-fun b!1044924 () Bool)

(declare-fun e!592246 () Bool)

(assert (=> b!1044924 (= e!592251 (and e!592246 mapRes!38906))))

(declare-fun condMapEmpty!38906 () Bool)

(declare-fun mapDefault!38906 () ValueCell!11720)

