; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91228 () Bool)

(assert start!91228)

(declare-fun b!1040848 () Bool)

(declare-fun b_free!21025 () Bool)

(declare-fun b_next!21025 () Bool)

(assert (=> b!1040848 (= b_free!21025 (not b_next!21025))))

(declare-fun tp!74279 () Bool)

(declare-fun b_and!33557 () Bool)

(assert (=> b!1040848 (= tp!74279 b_and!33557)))

(declare-fun b!1040842 () Bool)

(declare-fun e!589353 () Bool)

(declare-fun tp_is_empty!24745 () Bool)

(assert (=> b!1040842 (= e!589353 tp_is_empty!24745)))

(declare-fun mapNonEmpty!38704 () Bool)

(declare-fun mapRes!38704 () Bool)

(declare-fun tp!74278 () Bool)

(assert (=> mapNonEmpty!38704 (= mapRes!38704 (and tp!74278 e!589353))))

(declare-datatypes ((V!37867 0))(
  ( (V!37868 (val!12423 Int)) )
))
(declare-datatypes ((ValueCell!11669 0))(
  ( (ValueCellFull!11669 (v!15010 V!37867)) (EmptyCell!11669) )
))
(declare-fun mapRest!38704 () (Array (_ BitVec 32) ValueCell!11669))

(declare-datatypes ((array!65632 0))(
  ( (array!65633 (arr!31579 (Array (_ BitVec 32) (_ BitVec 64))) (size!32110 (_ BitVec 32))) )
))
(declare-datatypes ((array!65634 0))(
  ( (array!65635 (arr!31580 (Array (_ BitVec 32) ValueCell!11669)) (size!32111 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5932 0))(
  ( (LongMapFixedSize!5933 (defaultEntry!6348 Int) (mask!30355 (_ BitVec 32)) (extraKeys!6076 (_ BitVec 32)) (zeroValue!6182 V!37867) (minValue!6182 V!37867) (_size!3021 (_ BitVec 32)) (_keys!11574 array!65632) (_values!6371 array!65634) (_vacant!3021 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5932)

(declare-fun mapValue!38704 () ValueCell!11669)

(declare-fun mapKey!38704 () (_ BitVec 32))

(assert (=> mapNonEmpty!38704 (= (arr!31580 (_values!6371 thiss!1427)) (store mapRest!38704 mapKey!38704 mapValue!38704))))

(declare-fun res!693858 () Bool)

(declare-fun e!589348 () Bool)

(assert (=> start!91228 (=> (not res!693858) (not e!589348))))

(declare-fun valid!2227 (LongMapFixedSize!5932) Bool)

(assert (=> start!91228 (= res!693858 (valid!2227 thiss!1427))))

(assert (=> start!91228 e!589348))

(declare-fun e!589350 () Bool)

(assert (=> start!91228 e!589350))

(assert (=> start!91228 true))

(declare-fun b!1040843 () Bool)

(declare-fun e!589351 () Bool)

(assert (=> b!1040843 (= e!589351 tp_is_empty!24745)))

(declare-fun mapIsEmpty!38704 () Bool)

(assert (=> mapIsEmpty!38704 mapRes!38704))

(declare-fun b!1040844 () Bool)

(declare-fun e!589354 () Bool)

(assert (=> b!1040844 (= e!589354 (and e!589351 mapRes!38704))))

(declare-fun condMapEmpty!38704 () Bool)

(declare-fun mapDefault!38704 () ValueCell!11669)

