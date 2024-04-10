; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89484 () Bool)

(assert start!89484)

(declare-fun b!1026212 () Bool)

(declare-fun b_free!20483 () Bool)

(declare-fun b_next!20483 () Bool)

(assert (=> b!1026212 (= b_free!20483 (not b_next!20483))))

(declare-fun tp!72495 () Bool)

(declare-fun b_and!32729 () Bool)

(assert (=> b!1026212 (= tp!72495 b_and!32729)))

(declare-fun b!1026211 () Bool)

(declare-fun res!686975 () Bool)

(declare-fun e!578847 () Bool)

(assert (=> b!1026211 (=> (not res!686975) (not e!578847))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026211 (= res!686975 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37733 () Bool)

(declare-fun mapRes!37733 () Bool)

(declare-fun tp!72494 () Bool)

(declare-fun e!578849 () Bool)

(assert (=> mapNonEmpty!37733 (= mapRes!37733 (and tp!72494 e!578849))))

(declare-datatypes ((V!37143 0))(
  ( (V!37144 (val!12152 Int)) )
))
(declare-datatypes ((ValueCell!11398 0))(
  ( (ValueCellFull!11398 (v!14721 V!37143)) (EmptyCell!11398) )
))
(declare-fun mapRest!37733 () (Array (_ BitVec 32) ValueCell!11398))

(declare-fun mapValue!37733 () ValueCell!11398)

(declare-datatypes ((array!64456 0))(
  ( (array!64457 (arr!31037 (Array (_ BitVec 32) (_ BitVec 64))) (size!31550 (_ BitVec 32))) )
))
(declare-datatypes ((array!64458 0))(
  ( (array!64459 (arr!31038 (Array (_ BitVec 32) ValueCell!11398)) (size!31551 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5390 0))(
  ( (LongMapFixedSize!5391 (defaultEntry!6047 Int) (mask!29735 (_ BitVec 32)) (extraKeys!5779 (_ BitVec 32)) (zeroValue!5883 V!37143) (minValue!5883 V!37143) (_size!2750 (_ BitVec 32)) (_keys!11194 array!64456) (_values!6070 array!64458) (_vacant!2750 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5390)

(declare-fun mapKey!37733 () (_ BitVec 32))

(assert (=> mapNonEmpty!37733 (= (arr!31038 (_values!6070 thiss!1427)) (store mapRest!37733 mapKey!37733 mapValue!37733))))

(declare-fun e!578848 () Bool)

(declare-fun e!578854 () Bool)

(declare-fun tp_is_empty!24203 () Bool)

(declare-fun array_inv!24035 (array!64456) Bool)

(declare-fun array_inv!24036 (array!64458) Bool)

(assert (=> b!1026212 (= e!578848 (and tp!72495 tp_is_empty!24203 (array_inv!24035 (_keys!11194 thiss!1427)) (array_inv!24036 (_values!6070 thiss!1427)) e!578854))))

(declare-fun b!1026214 () Bool)

(assert (=> b!1026214 (= e!578849 tp_is_empty!24203)))

(declare-fun b!1026215 () Bool)

(declare-fun e!578850 () Bool)

(declare-fun e!578853 () Bool)

(assert (=> b!1026215 (= e!578850 (not e!578853))))

(declare-fun res!686978 () Bool)

(assert (=> b!1026215 (=> res!686978 e!578853)))

(declare-datatypes ((SeekEntryResult!9642 0))(
  ( (MissingZero!9642 (index!40939 (_ BitVec 32))) (Found!9642 (index!40940 (_ BitVec 32))) (Intermediate!9642 (undefined!10454 Bool) (index!40941 (_ BitVec 32)) (x!91280 (_ BitVec 32))) (Undefined!9642) (MissingVacant!9642 (index!40942 (_ BitVec 32))) )
))
(declare-fun lt!451396 () SeekEntryResult!9642)

(assert (=> b!1026215 (= res!686978 (or (bvslt (index!40940 lt!451396) #b00000000000000000000000000000000) (bvsge (index!40940 lt!451396) (size!31550 (_keys!11194 thiss!1427))) (bvsge (size!31550 (_keys!11194 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451398 () array!64456)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64456 (_ BitVec 32)) Bool)

(assert (=> b!1026215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451398 (mask!29735 thiss!1427))))

(declare-datatypes ((Unit!33429 0))(
  ( (Unit!33430) )
))
(declare-fun lt!451394 () Unit!33429)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64456 (_ BitVec 32) (_ BitVec 32)) Unit!33429)

(assert (=> b!1026215 (= lt!451394 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11194 thiss!1427) (index!40940 lt!451396) (mask!29735 thiss!1427)))))

(declare-datatypes ((List!21774 0))(
  ( (Nil!21771) (Cons!21770 (h!22968 (_ BitVec 64)) (t!30836 List!21774)) )
))
(declare-fun arrayNoDuplicates!0 (array!64456 (_ BitVec 32) List!21774) Bool)

(assert (=> b!1026215 (arrayNoDuplicates!0 lt!451398 #b00000000000000000000000000000000 Nil!21771)))

(declare-fun lt!451393 () Unit!33429)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64456 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21774) Unit!33429)

(assert (=> b!1026215 (= lt!451393 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11194 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40940 lt!451396) #b00000000000000000000000000000000 Nil!21771))))

(declare-fun arrayCountValidKeys!0 (array!64456 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026215 (= (arrayCountValidKeys!0 lt!451398 #b00000000000000000000000000000000 (size!31550 (_keys!11194 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11194 thiss!1427) #b00000000000000000000000000000000 (size!31550 (_keys!11194 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026215 (= lt!451398 (array!64457 (store (arr!31037 (_keys!11194 thiss!1427)) (index!40940 lt!451396) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31550 (_keys!11194 thiss!1427))))))

(declare-fun lt!451397 () Unit!33429)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64456 (_ BitVec 32) (_ BitVec 64)) Unit!33429)

(assert (=> b!1026215 (= lt!451397 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11194 thiss!1427) (index!40940 lt!451396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026216 () Bool)

(assert (=> b!1026216 (= e!578847 e!578850)))

(declare-fun res!686977 () Bool)

(assert (=> b!1026216 (=> (not res!686977) (not e!578850))))

(assert (=> b!1026216 (= res!686977 (is-Found!9642 lt!451396))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64456 (_ BitVec 32)) SeekEntryResult!9642)

(assert (=> b!1026216 (= lt!451396 (seekEntry!0 key!909 (_keys!11194 thiss!1427) (mask!29735 thiss!1427)))))

(declare-fun b!1026217 () Bool)

(declare-fun e!578851 () Bool)

(assert (=> b!1026217 (= e!578854 (and e!578851 mapRes!37733))))

(declare-fun condMapEmpty!37733 () Bool)

(declare-fun mapDefault!37733 () ValueCell!11398)

