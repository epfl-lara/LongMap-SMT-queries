; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90224 () Bool)

(assert start!90224)

(declare-fun b!1033005 () Bool)

(declare-fun b_free!20759 () Bool)

(declare-fun b_next!20759 () Bool)

(assert (=> b!1033005 (= b_free!20759 (not b_next!20759))))

(declare-fun tp!73366 () Bool)

(declare-fun b_and!33227 () Bool)

(assert (=> b!1033005 (= tp!73366 b_and!33227)))

(declare-fun b!1033001 () Bool)

(declare-fun res!690304 () Bool)

(declare-fun e!583787 () Bool)

(assert (=> b!1033001 (=> (not res!690304) (not e!583787))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033001 (= res!690304 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38191 () Bool)

(declare-fun mapRes!38191 () Bool)

(declare-fun tp!73367 () Bool)

(declare-fun e!583785 () Bool)

(assert (=> mapNonEmpty!38191 (= mapRes!38191 (and tp!73367 e!583785))))

(declare-datatypes ((V!37511 0))(
  ( (V!37512 (val!12290 Int)) )
))
(declare-datatypes ((ValueCell!11536 0))(
  ( (ValueCellFull!11536 (v!14867 V!37511)) (EmptyCell!11536) )
))
(declare-datatypes ((array!65032 0))(
  ( (array!65033 (arr!31313 (Array (_ BitVec 32) (_ BitVec 64))) (size!31834 (_ BitVec 32))) )
))
(declare-datatypes ((array!65034 0))(
  ( (array!65035 (arr!31314 (Array (_ BitVec 32) ValueCell!11536)) (size!31835 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5666 0))(
  ( (LongMapFixedSize!5667 (defaultEntry!6207 Int) (mask!30044 (_ BitVec 32)) (extraKeys!5939 (_ BitVec 32)) (zeroValue!6043 V!37511) (minValue!6043 V!37511) (_size!2888 (_ BitVec 32)) (_keys!11384 array!65032) (_values!6230 array!65034) (_vacant!2888 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5666)

(declare-fun mapValue!38191 () ValueCell!11536)

(declare-fun mapRest!38191 () (Array (_ BitVec 32) ValueCell!11536))

(declare-fun mapKey!38191 () (_ BitVec 32))

(assert (=> mapNonEmpty!38191 (= (arr!31314 (_values!6230 thiss!1427)) (store mapRest!38191 mapKey!38191 mapValue!38191))))

(declare-fun b!1033002 () Bool)

(declare-fun e!583789 () Bool)

(declare-fun tp_is_empty!24479 () Bool)

(assert (=> b!1033002 (= e!583789 tp_is_empty!24479)))

(declare-fun b!1033003 () Bool)

(declare-fun res!690305 () Bool)

(assert (=> b!1033003 (=> (not res!690305) (not e!583787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033003 (= res!690305 (validMask!0 (mask!30044 thiss!1427)))))

(declare-fun mapIsEmpty!38191 () Bool)

(assert (=> mapIsEmpty!38191 mapRes!38191))

(declare-fun b!1033004 () Bool)

(assert (=> b!1033004 (= e!583787 (and (= (size!31835 (_values!6230 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30044 thiss!1427))) (= (size!31834 (_keys!11384 thiss!1427)) (size!31835 (_values!6230 thiss!1427))) (bvsge (mask!30044 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5939 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5939 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun e!583788 () Bool)

(declare-fun e!583790 () Bool)

(declare-fun array_inv!24233 (array!65032) Bool)

(declare-fun array_inv!24234 (array!65034) Bool)

(assert (=> b!1033005 (= e!583790 (and tp!73366 tp_is_empty!24479 (array_inv!24233 (_keys!11384 thiss!1427)) (array_inv!24234 (_values!6230 thiss!1427)) e!583788))))

(declare-fun b!1033006 () Bool)

(assert (=> b!1033006 (= e!583788 (and e!583789 mapRes!38191))))

(declare-fun condMapEmpty!38191 () Bool)

(declare-fun mapDefault!38191 () ValueCell!11536)

