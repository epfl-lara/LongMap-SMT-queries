; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19478 () Bool)

(assert start!19478)

(declare-fun b!191311 () Bool)

(declare-fun b_free!4679 () Bool)

(declare-fun b_next!4679 () Bool)

(assert (=> b!191311 (= b_free!4679 (not b_next!4679))))

(declare-fun tp!16884 () Bool)

(declare-fun b_and!11349 () Bool)

(assert (=> b!191311 (= tp!16884 b_and!11349)))

(declare-fun res!90420 () Bool)

(declare-fun e!125901 () Bool)

(assert (=> start!19478 (=> (not res!90420) (not e!125901))))

(declare-datatypes ((V!5581 0))(
  ( (V!5582 (val!2270 Int)) )
))
(declare-datatypes ((ValueCell!1882 0))(
  ( (ValueCellFull!1882 (v!4207 V!5581)) (EmptyCell!1882) )
))
(declare-datatypes ((array!8139 0))(
  ( (array!8140 (arr!3835 (Array (_ BitVec 32) (_ BitVec 64))) (size!4157 (_ BitVec 32))) )
))
(declare-datatypes ((array!8141 0))(
  ( (array!8142 (arr!3836 (Array (_ BitVec 32) ValueCell!1882)) (size!4158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2672 0))(
  ( (LongMapFixedSize!2673 (defaultEntry!3904 Int) (mask!9120 (_ BitVec 32)) (extraKeys!3641 (_ BitVec 32)) (zeroValue!3745 V!5581) (minValue!3745 V!5581) (_size!1385 (_ BitVec 32)) (_keys!5881 array!8139) (_values!3887 array!8141) (_vacant!1385 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2672)

(declare-fun valid!1097 (LongMapFixedSize!2672) Bool)

(assert (=> start!19478 (= res!90420 (valid!1097 thiss!1248))))

(assert (=> start!19478 e!125901))

(declare-fun e!125898 () Bool)

(assert (=> start!19478 e!125898))

(assert (=> start!19478 true))

(declare-fun tp_is_empty!4451 () Bool)

(assert (=> start!19478 tp_is_empty!4451))

(declare-fun b!191303 () Bool)

(declare-fun res!90418 () Bool)

(assert (=> b!191303 (=> (not res!90418) (not e!125901))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!191303 (= res!90418 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191304 () Bool)

(declare-fun e!125897 () Bool)

(declare-fun e!125899 () Bool)

(declare-fun mapRes!7686 () Bool)

(assert (=> b!191304 (= e!125897 (and e!125899 mapRes!7686))))

(declare-fun condMapEmpty!7686 () Bool)

(declare-fun mapDefault!7686 () ValueCell!1882)

