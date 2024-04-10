; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91118 () Bool)

(assert start!91118)

(declare-fun b!1040182 () Bool)

(declare-fun b_free!21005 () Bool)

(declare-fun b_next!21005 () Bool)

(assert (=> b!1040182 (= b_free!21005 (not b_next!21005))))

(declare-fun tp!74207 () Bool)

(declare-fun b_and!33537 () Bool)

(assert (=> b!1040182 (= tp!74207 b_and!33537)))

(declare-fun b!1040176 () Bool)

(declare-fun res!693535 () Bool)

(declare-fun e!588865 () Bool)

(assert (=> b!1040176 (=> (not res!693535) (not e!588865))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040176 (= res!693535 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040177 () Bool)

(declare-fun e!588863 () Bool)

(assert (=> b!1040177 (= e!588865 e!588863)))

(declare-fun res!693534 () Bool)

(assert (=> b!1040177 (=> (not res!693534) (not e!588863))))

(declare-datatypes ((SeekEntryResult!9794 0))(
  ( (MissingZero!9794 (index!41547 (_ BitVec 32))) (Found!9794 (index!41548 (_ BitVec 32))) (Intermediate!9794 (undefined!10606 Bool) (index!41549 (_ BitVec 32)) (x!92850 (_ BitVec 32))) (Undefined!9794) (MissingVacant!9794 (index!41550 (_ BitVec 32))) )
))
(declare-fun lt!458440 () SeekEntryResult!9794)

(assert (=> b!1040177 (= res!693534 (is-Found!9794 lt!458440))))

(declare-datatypes ((V!37839 0))(
  ( (V!37840 (val!12413 Int)) )
))
(declare-datatypes ((ValueCell!11659 0))(
  ( (ValueCellFull!11659 (v!15000 V!37839)) (EmptyCell!11659) )
))
(declare-datatypes ((array!65584 0))(
  ( (array!65585 (arr!31559 (Array (_ BitVec 32) (_ BitVec 64))) (size!32090 (_ BitVec 32))) )
))
(declare-datatypes ((array!65586 0))(
  ( (array!65587 (arr!31560 (Array (_ BitVec 32) ValueCell!11659)) (size!32091 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5912 0))(
  ( (LongMapFixedSize!5913 (defaultEntry!6338 Int) (mask!30324 (_ BitVec 32)) (extraKeys!6066 (_ BitVec 32)) (zeroValue!6172 V!37839) (minValue!6172 V!37839) (_size!3011 (_ BitVec 32)) (_keys!11556 array!65584) (_values!6361 array!65586) (_vacant!3011 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5912)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65584 (_ BitVec 32)) SeekEntryResult!9794)

(assert (=> b!1040177 (= lt!458440 (seekEntry!0 key!909 (_keys!11556 thiss!1427) (mask!30324 thiss!1427)))))

(declare-fun b!1040178 () Bool)

(declare-fun e!588866 () Bool)

(declare-fun tp_is_empty!24725 () Bool)

(assert (=> b!1040178 (= e!588866 tp_is_empty!24725)))

(declare-fun b!1040179 () Bool)

(declare-fun e!588861 () Bool)

(declare-fun e!588860 () Bool)

(declare-fun mapRes!38662 () Bool)

(assert (=> b!1040179 (= e!588861 (and e!588860 mapRes!38662))))

(declare-fun condMapEmpty!38662 () Bool)

(declare-fun mapDefault!38662 () ValueCell!11659)

