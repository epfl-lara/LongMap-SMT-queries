; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89444 () Bool)

(assert start!89444)

(declare-fun b!1025688 () Bool)

(declare-fun b_free!20443 () Bool)

(declare-fun b_next!20443 () Bool)

(assert (=> b!1025688 (= b_free!20443 (not b_next!20443))))

(declare-fun tp!72375 () Bool)

(declare-fun b_and!32689 () Bool)

(assert (=> b!1025688 (= tp!72375 b_and!32689)))

(declare-fun b!1025683 () Bool)

(declare-fun e!578370 () Bool)

(declare-fun tp_is_empty!24163 () Bool)

(assert (=> b!1025683 (= e!578370 tp_is_empty!24163)))

(declare-fun res!686689 () Bool)

(declare-fun e!578373 () Bool)

(assert (=> start!89444 (=> (not res!686689) (not e!578373))))

(declare-datatypes ((V!37091 0))(
  ( (V!37092 (val!12132 Int)) )
))
(declare-datatypes ((ValueCell!11378 0))(
  ( (ValueCellFull!11378 (v!14701 V!37091)) (EmptyCell!11378) )
))
(declare-datatypes ((array!64376 0))(
  ( (array!64377 (arr!30997 (Array (_ BitVec 32) (_ BitVec 64))) (size!31510 (_ BitVec 32))) )
))
(declare-datatypes ((array!64378 0))(
  ( (array!64379 (arr!30998 (Array (_ BitVec 32) ValueCell!11378)) (size!31511 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5350 0))(
  ( (LongMapFixedSize!5351 (defaultEntry!6027 Int) (mask!29703 (_ BitVec 32)) (extraKeys!5759 (_ BitVec 32)) (zeroValue!5863 V!37091) (minValue!5863 V!37091) (_size!2730 (_ BitVec 32)) (_keys!11174 array!64376) (_values!6050 array!64378) (_vacant!2730 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5350)

(declare-fun valid!2033 (LongMapFixedSize!5350) Bool)

(assert (=> start!89444 (= res!686689 (valid!2033 thiss!1427))))

(assert (=> start!89444 e!578373))

(declare-fun e!578367 () Bool)

(assert (=> start!89444 e!578367))

(assert (=> start!89444 true))

(declare-fun b!1025684 () Bool)

(declare-fun res!686691 () Bool)

(declare-fun e!578368 () Bool)

(assert (=> b!1025684 (=> res!686691 e!578368)))

(declare-datatypes ((SeekEntryResult!9626 0))(
  ( (MissingZero!9626 (index!40875 (_ BitVec 32))) (Found!9626 (index!40876 (_ BitVec 32))) (Intermediate!9626 (undefined!10438 Bool) (index!40877 (_ BitVec 32)) (x!91216 (_ BitVec 32))) (Undefined!9626) (MissingVacant!9626 (index!40878 (_ BitVec 32))) )
))
(declare-fun lt!451051 () SeekEntryResult!9626)

(assert (=> b!1025684 (= res!686691 (or (not (= (size!31510 (_keys!11174 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29703 thiss!1427)))) (bvslt (index!40876 lt!451051) #b00000000000000000000000000000000) (bvsge (index!40876 lt!451051) (size!31510 (_keys!11174 thiss!1427)))))))

(declare-fun b!1025685 () Bool)

(declare-fun e!578371 () Bool)

(assert (=> b!1025685 (= e!578371 tp_is_empty!24163)))

(declare-fun b!1025686 () Bool)

(declare-fun res!686693 () Bool)

(assert (=> b!1025686 (=> res!686693 e!578368)))

(declare-datatypes ((List!21758 0))(
  ( (Nil!21755) (Cons!21754 (h!22952 (_ BitVec 64)) (t!30820 List!21758)) )
))
(declare-fun arrayNoDuplicates!0 (array!64376 (_ BitVec 32) List!21758) Bool)

(assert (=> b!1025686 (= res!686693 (not (arrayNoDuplicates!0 (_keys!11174 thiss!1427) #b00000000000000000000000000000000 Nil!21755)))))

(declare-fun b!1025687 () Bool)

(declare-fun e!578369 () Bool)

(assert (=> b!1025687 (= e!578369 (not e!578368))))

(declare-fun res!686692 () Bool)

(assert (=> b!1025687 (=> res!686692 e!578368)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025687 (= res!686692 (not (validMask!0 (mask!29703 thiss!1427))))))

(declare-fun lt!451050 () array!64376)

(assert (=> b!1025687 (arrayNoDuplicates!0 lt!451050 #b00000000000000000000000000000000 Nil!21755)))

(declare-datatypes ((Unit!33401 0))(
  ( (Unit!33402) )
))
(declare-fun lt!451052 () Unit!33401)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21758) Unit!33401)

(assert (=> b!1025687 (= lt!451052 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11174 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40876 lt!451051) #b00000000000000000000000000000000 Nil!21755))))

(declare-fun arrayCountValidKeys!0 (array!64376 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025687 (= (arrayCountValidKeys!0 lt!451050 #b00000000000000000000000000000000 (size!31510 (_keys!11174 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11174 thiss!1427) #b00000000000000000000000000000000 (size!31510 (_keys!11174 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025687 (= lt!451050 (array!64377 (store (arr!30997 (_keys!11174 thiss!1427)) (index!40876 lt!451051) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31510 (_keys!11174 thiss!1427))))))

(declare-fun lt!451049 () Unit!33401)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64376 (_ BitVec 32) (_ BitVec 64)) Unit!33401)

(assert (=> b!1025687 (= lt!451049 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11174 thiss!1427) (index!40876 lt!451051) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578374 () Bool)

(declare-fun array_inv!24007 (array!64376) Bool)

(declare-fun array_inv!24008 (array!64378) Bool)

(assert (=> b!1025688 (= e!578367 (and tp!72375 tp_is_empty!24163 (array_inv!24007 (_keys!11174 thiss!1427)) (array_inv!24008 (_values!6050 thiss!1427)) e!578374))))

(declare-fun mapIsEmpty!37673 () Bool)

(declare-fun mapRes!37673 () Bool)

(assert (=> mapIsEmpty!37673 mapRes!37673))

(declare-fun b!1025689 () Bool)

(declare-fun res!686688 () Bool)

(assert (=> b!1025689 (=> (not res!686688) (not e!578373))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025689 (= res!686688 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025690 () Bool)

(assert (=> b!1025690 (= e!578368 true)))

(declare-fun lt!451053 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64376 (_ BitVec 32)) Bool)

(assert (=> b!1025690 (= lt!451053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11174 thiss!1427) (mask!29703 thiss!1427)))))

(declare-fun b!1025691 () Bool)

(declare-fun res!686690 () Bool)

(assert (=> b!1025691 (=> res!686690 e!578368)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025691 (= res!686690 (not (validKeyInArray!0 (select (arr!30997 (_keys!11174 thiss!1427)) (index!40876 lt!451051)))))))

(declare-fun b!1025692 () Bool)

(assert (=> b!1025692 (= e!578373 e!578369)))

(declare-fun res!686687 () Bool)

(assert (=> b!1025692 (=> (not res!686687) (not e!578369))))

(assert (=> b!1025692 (= res!686687 (is-Found!9626 lt!451051))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64376 (_ BitVec 32)) SeekEntryResult!9626)

(assert (=> b!1025692 (= lt!451051 (seekEntry!0 key!909 (_keys!11174 thiss!1427) (mask!29703 thiss!1427)))))

(declare-fun b!1025693 () Bool)

(assert (=> b!1025693 (= e!578374 (and e!578370 mapRes!37673))))

(declare-fun condMapEmpty!37673 () Bool)

(declare-fun mapDefault!37673 () ValueCell!11378)

