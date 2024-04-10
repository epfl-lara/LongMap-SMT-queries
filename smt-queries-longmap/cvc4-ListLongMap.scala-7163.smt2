; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91288 () Bool)

(assert start!91288)

(declare-fun b!1041195 () Bool)

(declare-fun b_free!21035 () Bool)

(declare-fun b_next!21035 () Bool)

(assert (=> b!1041195 (= b_free!21035 (not b_next!21035))))

(declare-fun tp!74313 () Bool)

(declare-fun b_and!33567 () Bool)

(assert (=> b!1041195 (= tp!74313 b_and!33567)))

(declare-fun e!589619 () Bool)

(declare-fun tp_is_empty!24755 () Bool)

(declare-datatypes ((V!37879 0))(
  ( (V!37880 (val!12428 Int)) )
))
(declare-datatypes ((ValueCell!11674 0))(
  ( (ValueCellFull!11674 (v!15016 V!37879)) (EmptyCell!11674) )
))
(declare-datatypes ((array!65654 0))(
  ( (array!65655 (arr!31589 (Array (_ BitVec 32) (_ BitVec 64))) (size!32121 (_ BitVec 32))) )
))
(declare-datatypes ((array!65656 0))(
  ( (array!65657 (arr!31590 (Array (_ BitVec 32) ValueCell!11674)) (size!32122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5942 0))(
  ( (LongMapFixedSize!5943 (defaultEntry!6353 Int) (mask!30371 (_ BitVec 32)) (extraKeys!6081 (_ BitVec 32)) (zeroValue!6187 V!37879) (minValue!6187 V!37879) (_size!3026 (_ BitVec 32)) (_keys!11584 array!65654) (_values!6376 array!65656) (_vacant!3026 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5942)

(declare-fun e!589612 () Bool)

(declare-fun array_inv!24405 (array!65654) Bool)

(declare-fun array_inv!24406 (array!65656) Bool)

(assert (=> b!1041195 (= e!589612 (and tp!74313 tp_is_empty!24755 (array_inv!24405 (_keys!11584 thiss!1427)) (array_inv!24406 (_values!6376 thiss!1427)) e!589619))))

(declare-fun res!694018 () Bool)

(declare-fun e!589614 () Bool)

(assert (=> start!91288 (=> (not res!694018) (not e!589614))))

(declare-fun valid!2232 (LongMapFixedSize!5942) Bool)

(assert (=> start!91288 (= res!694018 (valid!2232 thiss!1427))))

(assert (=> start!91288 e!589614))

(assert (=> start!91288 e!589612))

(assert (=> start!91288 true))

(declare-fun mapIsEmpty!38723 () Bool)

(declare-fun mapRes!38723 () Bool)

(assert (=> mapIsEmpty!38723 mapRes!38723))

(declare-fun b!1041196 () Bool)

(declare-fun e!589616 () Bool)

(assert (=> b!1041196 (= e!589614 e!589616)))

(declare-fun res!694019 () Bool)

(assert (=> b!1041196 (=> (not res!694019) (not e!589616))))

(declare-datatypes ((SeekEntryResult!9806 0))(
  ( (MissingZero!9806 (index!41595 (_ BitVec 32))) (Found!9806 (index!41596 (_ BitVec 32))) (Intermediate!9806 (undefined!10618 Bool) (index!41597 (_ BitVec 32)) (x!92951 (_ BitVec 32))) (Undefined!9806) (MissingVacant!9806 (index!41598 (_ BitVec 32))) )
))
(declare-fun lt!458912 () SeekEntryResult!9806)

(assert (=> b!1041196 (= res!694019 (is-Found!9806 lt!458912))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65654 (_ BitVec 32)) SeekEntryResult!9806)

(assert (=> b!1041196 (= lt!458912 (seekEntry!0 key!909 (_keys!11584 thiss!1427) (mask!30371 thiss!1427)))))

(declare-fun b!1041197 () Bool)

(declare-fun e!589615 () Bool)

(assert (=> b!1041197 (= e!589619 (and e!589615 mapRes!38723))))

(declare-fun condMapEmpty!38723 () Bool)

(declare-fun mapDefault!38723 () ValueCell!11674)

