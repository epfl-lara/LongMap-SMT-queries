; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91340 () Bool)

(assert start!91340)

(declare-fun b!1041452 () Bool)

(declare-fun b_free!21037 () Bool)

(declare-fun b_next!21037 () Bool)

(assert (=> b!1041452 (= b_free!21037 (not b_next!21037))))

(declare-fun tp!74322 () Bool)

(declare-fun b_and!33569 () Bool)

(assert (=> b!1041452 (= tp!74322 b_and!33569)))

(declare-fun mapNonEmpty!38730 () Bool)

(declare-fun mapRes!38730 () Bool)

(declare-fun tp!74323 () Bool)

(declare-fun e!589786 () Bool)

(assert (=> mapNonEmpty!38730 (= mapRes!38730 (and tp!74323 e!589786))))

(declare-fun mapKey!38730 () (_ BitVec 32))

(declare-datatypes ((V!37883 0))(
  ( (V!37884 (val!12429 Int)) )
))
(declare-datatypes ((ValueCell!11675 0))(
  ( (ValueCellFull!11675 (v!15018 V!37883)) (EmptyCell!11675) )
))
(declare-fun mapValue!38730 () ValueCell!11675)

(declare-datatypes ((array!65660 0))(
  ( (array!65661 (arr!31591 (Array (_ BitVec 32) (_ BitVec 64))) (size!32124 (_ BitVec 32))) )
))
(declare-datatypes ((array!65662 0))(
  ( (array!65663 (arr!31592 (Array (_ BitVec 32) ValueCell!11675)) (size!32125 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5944 0))(
  ( (LongMapFixedSize!5945 (defaultEntry!6354 Int) (mask!30383 (_ BitVec 32)) (extraKeys!6082 (_ BitVec 32)) (zeroValue!6188 V!37883) (minValue!6188 V!37883) (_size!3027 (_ BitVec 32)) (_keys!11590 array!65660) (_values!6377 array!65662) (_vacant!3027 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5944)

(declare-fun mapRest!38730 () (Array (_ BitVec 32) ValueCell!11675))

(assert (=> mapNonEmpty!38730 (= (arr!31592 (_values!6377 thiss!1427)) (store mapRest!38730 mapKey!38730 mapValue!38730))))

(declare-fun e!589781 () Bool)

(declare-fun e!589787 () Bool)

(declare-fun tp_is_empty!24757 () Bool)

(declare-fun array_inv!24407 (array!65660) Bool)

(declare-fun array_inv!24408 (array!65662) Bool)

(assert (=> b!1041452 (= e!589781 (and tp!74322 tp_is_empty!24757 (array_inv!24407 (_keys!11590 thiss!1427)) (array_inv!24408 (_values!6377 thiss!1427)) e!589787))))

(declare-fun b!1041453 () Bool)

(declare-fun res!694131 () Bool)

(declare-fun e!589784 () Bool)

(assert (=> b!1041453 (=> (not res!694131) (not e!589784))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1041453 (= res!694131 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041455 () Bool)

(declare-fun e!589783 () Bool)

(assert (=> b!1041455 (= e!589787 (and e!589783 mapRes!38730))))

(declare-fun condMapEmpty!38730 () Bool)

(declare-fun mapDefault!38730 () ValueCell!11675)

