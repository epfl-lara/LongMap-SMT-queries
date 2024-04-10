; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90068 () Bool)

(assert start!90068)

(declare-fun b!1031657 () Bool)

(declare-fun b_free!20675 () Bool)

(declare-fun b_next!20675 () Bool)

(assert (=> b!1031657 (= b_free!20675 (not b_next!20675))))

(declare-fun tp!73096 () Bool)

(declare-fun b_and!33117 () Bool)

(assert (=> b!1031657 (= tp!73096 b_and!33117)))

(declare-fun tp_is_empty!24395 () Bool)

(declare-fun e!582711 () Bool)

(declare-datatypes ((V!37399 0))(
  ( (V!37400 (val!12248 Int)) )
))
(declare-datatypes ((ValueCell!11494 0))(
  ( (ValueCellFull!11494 (v!14825 V!37399)) (EmptyCell!11494) )
))
(declare-datatypes ((array!64854 0))(
  ( (array!64855 (arr!31229 (Array (_ BitVec 32) (_ BitVec 64))) (size!31746 (_ BitVec 32))) )
))
(declare-datatypes ((array!64856 0))(
  ( (array!64857 (arr!31230 (Array (_ BitVec 32) ValueCell!11494)) (size!31747 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5582 0))(
  ( (LongMapFixedSize!5583 (defaultEntry!6165 Int) (mask!29965 (_ BitVec 32)) (extraKeys!5897 (_ BitVec 32)) (zeroValue!6001 V!37399) (minValue!6001 V!37399) (_size!2846 (_ BitVec 32)) (_keys!11338 array!64854) (_values!6188 array!64856) (_vacant!2846 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5582)

(declare-fun e!582717 () Bool)

(declare-fun array_inv!24173 (array!64854) Bool)

(declare-fun array_inv!24174 (array!64856) Bool)

(assert (=> b!1031657 (= e!582717 (and tp!73096 tp_is_empty!24395 (array_inv!24173 (_keys!11338 thiss!1427)) (array_inv!24174 (_values!6188 thiss!1427)) e!582711))))

(declare-fun b!1031658 () Bool)

(declare-fun res!689781 () Bool)

(declare-fun e!582716 () Bool)

(assert (=> b!1031658 (=> res!689781 e!582716)))

(declare-datatypes ((Unit!33753 0))(
  ( (Unit!33754) )
))
(declare-datatypes ((tuple2!15680 0))(
  ( (tuple2!15681 (_1!7851 Unit!33753) (_2!7851 LongMapFixedSize!5582)) )
))
(declare-fun lt!455556 () tuple2!15680)

(assert (=> b!1031658 (= res!689781 (or (not (= (size!31747 (_values!6188 (_2!7851 lt!455556))) (bvadd #b00000000000000000000000000000001 (mask!29965 (_2!7851 lt!455556))))) (not (= (size!31746 (_keys!11338 (_2!7851 lt!455556))) (size!31747 (_values!6188 (_2!7851 lt!455556))))) (bvslt (mask!29965 (_2!7851 lt!455556)) #b00000000000000000000000000000000) (bvslt (extraKeys!5897 (_2!7851 lt!455556)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5897 (_2!7851 lt!455556)) #b00000000000000000000000000000011)))))

(declare-fun b!1031659 () Bool)

(declare-fun e!582712 () Bool)

(assert (=> b!1031659 (= e!582712 tp_is_empty!24395)))

(declare-fun b!1031660 () Bool)

(declare-fun res!689779 () Bool)

(declare-fun e!582715 () Bool)

(assert (=> b!1031660 (=> (not res!689779) (not e!582715))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031660 (= res!689779 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031661 () Bool)

(declare-fun res!689783 () Bool)

(assert (=> b!1031661 (=> res!689783 e!582716)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031661 (= res!689783 (not (validMask!0 (mask!29965 (_2!7851 lt!455556)))))))

(declare-fun b!1031662 () Bool)

(declare-fun e!582713 () Bool)

(assert (=> b!1031662 (= e!582713 tp_is_empty!24395)))

(declare-fun b!1031663 () Bool)

(declare-fun mapRes!38046 () Bool)

(assert (=> b!1031663 (= e!582711 (and e!582713 mapRes!38046))))

(declare-fun condMapEmpty!38046 () Bool)

(declare-fun mapDefault!38046 () ValueCell!11494)

