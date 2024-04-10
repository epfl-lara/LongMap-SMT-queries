; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91520 () Bool)

(assert start!91520)

(declare-fun b!1042493 () Bool)

(declare-fun b_free!21065 () Bool)

(declare-fun b_next!21065 () Bool)

(assert (=> b!1042493 (= b_free!21065 (not b_next!21065))))

(declare-fun tp!74420 () Bool)

(declare-fun b_and!33597 () Bool)

(assert (=> b!1042493 (= tp!74420 b_and!33597)))

(declare-fun tp_is_empty!24785 () Bool)

(declare-fun e!590547 () Bool)

(declare-datatypes ((V!37919 0))(
  ( (V!37920 (val!12443 Int)) )
))
(declare-datatypes ((ValueCell!11689 0))(
  ( (ValueCellFull!11689 (v!15034 V!37919)) (EmptyCell!11689) )
))
(declare-datatypes ((array!65724 0))(
  ( (array!65725 (arr!31619 (Array (_ BitVec 32) (_ BitVec 64))) (size!32154 (_ BitVec 32))) )
))
(declare-datatypes ((array!65726 0))(
  ( (array!65727 (arr!31620 (Array (_ BitVec 32) ValueCell!11689)) (size!32155 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5972 0))(
  ( (LongMapFixedSize!5973 (defaultEntry!6368 Int) (mask!30431 (_ BitVec 32)) (extraKeys!6096 (_ BitVec 32)) (zeroValue!6202 V!37919) (minValue!6202 V!37919) (_size!3041 (_ BitVec 32)) (_keys!11618 array!65724) (_values!6391 array!65726) (_vacant!3041 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5972)

(declare-fun e!590553 () Bool)

(declare-fun array_inv!24431 (array!65724) Bool)

(declare-fun array_inv!24432 (array!65726) Bool)

(assert (=> b!1042493 (= e!590553 (and tp!74420 tp_is_empty!24785 (array_inv!24431 (_keys!11618 thiss!1427)) (array_inv!24432 (_values!6391 thiss!1427)) e!590547))))

(declare-fun b!1042494 () Bool)

(declare-fun e!590551 () Bool)

(declare-fun mapRes!38786 () Bool)

(assert (=> b!1042494 (= e!590547 (and e!590551 mapRes!38786))))

(declare-fun condMapEmpty!38786 () Bool)

(declare-fun mapDefault!38786 () ValueCell!11689)

