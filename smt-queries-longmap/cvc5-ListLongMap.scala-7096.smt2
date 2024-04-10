; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90022 () Bool)

(assert start!90022)

(declare-fun b!1030853 () Bool)

(declare-fun b_free!20629 () Bool)

(declare-fun b_next!20629 () Bool)

(assert (=> b!1030853 (= b_free!20629 (not b_next!20629))))

(declare-fun tp!72958 () Bool)

(declare-fun b_and!33025 () Bool)

(assert (=> b!1030853 (= tp!72958 b_and!33025)))

(declare-fun b!1030852 () Bool)

(declare-fun e!582161 () Bool)

(declare-fun tp_is_empty!24349 () Bool)

(assert (=> b!1030852 (= e!582161 tp_is_empty!24349)))

(declare-fun e!582163 () Bool)

(declare-datatypes ((V!37339 0))(
  ( (V!37340 (val!12225 Int)) )
))
(declare-datatypes ((ValueCell!11471 0))(
  ( (ValueCellFull!11471 (v!14802 V!37339)) (EmptyCell!11471) )
))
(declare-datatypes ((array!64762 0))(
  ( (array!64763 (arr!31183 (Array (_ BitVec 32) (_ BitVec 64))) (size!31700 (_ BitVec 32))) )
))
(declare-datatypes ((array!64764 0))(
  ( (array!64765 (arr!31184 (Array (_ BitVec 32) ValueCell!11471)) (size!31701 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5536 0))(
  ( (LongMapFixedSize!5537 (defaultEntry!6142 Int) (mask!29928 (_ BitVec 32)) (extraKeys!5874 (_ BitVec 32)) (zeroValue!5978 V!37339) (minValue!5978 V!37339) (_size!2823 (_ BitVec 32)) (_keys!11315 array!64762) (_values!6165 array!64764) (_vacant!2823 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5536)

(declare-fun e!582158 () Bool)

(declare-fun array_inv!24139 (array!64762) Bool)

(declare-fun array_inv!24140 (array!64764) Bool)

(assert (=> b!1030853 (= e!582163 (and tp!72958 tp_is_empty!24349 (array_inv!24139 (_keys!11315 thiss!1427)) (array_inv!24140 (_values!6165 thiss!1427)) e!582158))))

(declare-fun b!1030854 () Bool)

(declare-fun e!582165 () Bool)

(declare-fun e!582160 () Bool)

(assert (=> b!1030854 (= e!582165 e!582160)))

(declare-fun res!689300 () Bool)

(assert (=> b!1030854 (=> (not res!689300) (not e!582160))))

(declare-datatypes ((SeekEntryResult!9695 0))(
  ( (MissingZero!9695 (index!41151 (_ BitVec 32))) (Found!9695 (index!41152 (_ BitVec 32))) (Intermediate!9695 (undefined!10507 Bool) (index!41153 (_ BitVec 32)) (x!91761 (_ BitVec 32))) (Undefined!9695) (MissingVacant!9695 (index!41154 (_ BitVec 32))) )
))
(declare-fun lt!454870 () SeekEntryResult!9695)

(assert (=> b!1030854 (= res!689300 (is-Found!9695 lt!454870))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64762 (_ BitVec 32)) SeekEntryResult!9695)

(assert (=> b!1030854 (= lt!454870 (seekEntry!0 key!909 (_keys!11315 thiss!1427) (mask!29928 thiss!1427)))))

(declare-fun res!689299 () Bool)

(assert (=> start!90022 (=> (not res!689299) (not e!582165))))

(declare-fun valid!2096 (LongMapFixedSize!5536) Bool)

(assert (=> start!90022 (= res!689299 (valid!2096 thiss!1427))))

(assert (=> start!90022 e!582165))

(assert (=> start!90022 e!582163))

(assert (=> start!90022 true))

(declare-fun b!1030855 () Bool)

(declare-fun e!582164 () Bool)

(assert (=> b!1030855 (= e!582164 true)))

(declare-fun lt!454866 () Bool)

(declare-datatypes ((Unit!33679 0))(
  ( (Unit!33680) )
))
(declare-datatypes ((tuple2!15606 0))(
  ( (tuple2!15607 (_1!7814 Unit!33679) (_2!7814 LongMapFixedSize!5536)) )
))
(declare-fun lt!454863 () tuple2!15606)

(declare-datatypes ((List!21845 0))(
  ( (Nil!21842) (Cons!21841 (h!23043 (_ BitVec 64)) (t!30969 List!21845)) )
))
(declare-fun arrayNoDuplicates!0 (array!64762 (_ BitVec 32) List!21845) Bool)

(assert (=> b!1030855 (= lt!454866 (arrayNoDuplicates!0 (_keys!11315 (_2!7814 lt!454863)) #b00000000000000000000000000000000 Nil!21842))))

(declare-fun b!1030856 () Bool)

(declare-fun res!689295 () Bool)

(assert (=> b!1030856 (=> res!689295 e!582164)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64762 (_ BitVec 32)) Bool)

(assert (=> b!1030856 (= res!689295 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11315 (_2!7814 lt!454863)) (mask!29928 (_2!7814 lt!454863)))))))

(declare-fun b!1030857 () Bool)

(declare-fun res!689296 () Bool)

(assert (=> b!1030857 (=> res!689296 e!582164)))

(assert (=> b!1030857 (= res!689296 (or (not (= (size!31701 (_values!6165 (_2!7814 lt!454863))) (bvadd #b00000000000000000000000000000001 (mask!29928 (_2!7814 lt!454863))))) (not (= (size!31700 (_keys!11315 (_2!7814 lt!454863))) (size!31701 (_values!6165 (_2!7814 lt!454863))))) (bvslt (mask!29928 (_2!7814 lt!454863)) #b00000000000000000000000000000000) (bvslt (extraKeys!5874 (_2!7814 lt!454863)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5874 (_2!7814 lt!454863)) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37977 () Bool)

(declare-fun mapRes!37977 () Bool)

(declare-fun tp!72957 () Bool)

(assert (=> mapNonEmpty!37977 (= mapRes!37977 (and tp!72957 e!582161))))

(declare-fun mapRest!37977 () (Array (_ BitVec 32) ValueCell!11471))

(declare-fun mapValue!37977 () ValueCell!11471)

(declare-fun mapKey!37977 () (_ BitVec 32))

(assert (=> mapNonEmpty!37977 (= (arr!31184 (_values!6165 thiss!1427)) (store mapRest!37977 mapKey!37977 mapValue!37977))))

(declare-fun mapIsEmpty!37977 () Bool)

(assert (=> mapIsEmpty!37977 mapRes!37977))

(declare-fun b!1030858 () Bool)

(declare-fun e!582162 () Bool)

(assert (=> b!1030858 (= e!582158 (and e!582162 mapRes!37977))))

(declare-fun condMapEmpty!37977 () Bool)

(declare-fun mapDefault!37977 () ValueCell!11471)

