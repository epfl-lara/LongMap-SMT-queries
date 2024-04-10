; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91012 () Bool)

(assert start!91012)

(declare-fun b!1039531 () Bool)

(declare-fun b_free!20981 () Bool)

(declare-fun b_next!20981 () Bool)

(assert (=> b!1039531 (= b_free!20981 (not b_next!20981))))

(declare-fun tp!74122 () Bool)

(declare-fun b_and!33513 () Bool)

(assert (=> b!1039531 (= tp!74122 b_and!33513)))

(declare-fun b!1039526 () Bool)

(declare-fun e!588367 () Bool)

(declare-fun e!588363 () Bool)

(assert (=> b!1039526 (= e!588367 e!588363)))

(declare-fun res!693249 () Bool)

(assert (=> b!1039526 (=> (not res!693249) (not e!588363))))

(declare-datatypes ((SeekEntryResult!9785 0))(
  ( (MissingZero!9785 (index!41511 (_ BitVec 32))) (Found!9785 (index!41512 (_ BitVec 32))) (Intermediate!9785 (undefined!10597 Bool) (index!41513 (_ BitVec 32)) (x!92777 (_ BitVec 32))) (Undefined!9785) (MissingVacant!9785 (index!41514 (_ BitVec 32))) )
))
(declare-fun lt!458128 () SeekEntryResult!9785)

(assert (=> b!1039526 (= res!693249 (is-Found!9785 lt!458128))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37807 0))(
  ( (V!37808 (val!12401 Int)) )
))
(declare-datatypes ((ValueCell!11647 0))(
  ( (ValueCellFull!11647 (v!14988 V!37807)) (EmptyCell!11647) )
))
(declare-datatypes ((array!65528 0))(
  ( (array!65529 (arr!31535 (Array (_ BitVec 32) (_ BitVec 64))) (size!32066 (_ BitVec 32))) )
))
(declare-datatypes ((array!65530 0))(
  ( (array!65531 (arr!31536 (Array (_ BitVec 32) ValueCell!11647)) (size!32067 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5888 0))(
  ( (LongMapFixedSize!5889 (defaultEntry!6326 Int) (mask!30292 (_ BitVec 32)) (extraKeys!6054 (_ BitVec 32)) (zeroValue!6160 V!37807) (minValue!6160 V!37807) (_size!2999 (_ BitVec 32)) (_keys!11536 array!65528) (_values!6349 array!65530) (_vacant!2999 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5888)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65528 (_ BitVec 32)) SeekEntryResult!9785)

(assert (=> b!1039526 (= lt!458128 (seekEntry!0 key!909 (_keys!11536 thiss!1427) (mask!30292 thiss!1427)))))

(declare-fun res!693247 () Bool)

(assert (=> start!91012 (=> (not res!693247) (not e!588367))))

(declare-fun valid!2212 (LongMapFixedSize!5888) Bool)

(assert (=> start!91012 (= res!693247 (valid!2212 thiss!1427))))

(assert (=> start!91012 e!588367))

(declare-fun e!588364 () Bool)

(assert (=> start!91012 e!588364))

(assert (=> start!91012 true))

(declare-fun b!1039527 () Bool)

(declare-fun e!588366 () Bool)

(declare-fun e!588365 () Bool)

(declare-fun mapRes!38614 () Bool)

(assert (=> b!1039527 (= e!588366 (and e!588365 mapRes!38614))))

(declare-fun condMapEmpty!38614 () Bool)

(declare-fun mapDefault!38614 () ValueCell!11647)

