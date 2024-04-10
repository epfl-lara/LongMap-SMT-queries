; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89414 () Bool)

(assert start!89414)

(declare-fun b!1025188 () Bool)

(declare-fun b_free!20413 () Bool)

(declare-fun b_next!20413 () Bool)

(assert (=> b!1025188 (= b_free!20413 (not b_next!20413))))

(declare-fun tp!72285 () Bool)

(declare-fun b_and!32659 () Bool)

(assert (=> b!1025188 (= tp!72285 b_and!32659)))

(declare-fun mapNonEmpty!37628 () Bool)

(declare-fun mapRes!37628 () Bool)

(declare-fun tp!72284 () Bool)

(declare-fun e!578014 () Bool)

(assert (=> mapNonEmpty!37628 (= mapRes!37628 (and tp!72284 e!578014))))

(declare-datatypes ((V!37051 0))(
  ( (V!37052 (val!12117 Int)) )
))
(declare-datatypes ((ValueCell!11363 0))(
  ( (ValueCellFull!11363 (v!14686 V!37051)) (EmptyCell!11363) )
))
(declare-fun mapRest!37628 () (Array (_ BitVec 32) ValueCell!11363))

(declare-datatypes ((array!64316 0))(
  ( (array!64317 (arr!30967 (Array (_ BitVec 32) (_ BitVec 64))) (size!31480 (_ BitVec 32))) )
))
(declare-datatypes ((array!64318 0))(
  ( (array!64319 (arr!30968 (Array (_ BitVec 32) ValueCell!11363)) (size!31481 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5320 0))(
  ( (LongMapFixedSize!5321 (defaultEntry!6012 Int) (mask!29678 (_ BitVec 32)) (extraKeys!5744 (_ BitVec 32)) (zeroValue!5848 V!37051) (minValue!5848 V!37051) (_size!2715 (_ BitVec 32)) (_keys!11159 array!64316) (_values!6035 array!64318) (_vacant!2715 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5320)

(declare-fun mapKey!37628 () (_ BitVec 32))

(declare-fun mapValue!37628 () ValueCell!11363)

(assert (=> mapNonEmpty!37628 (= (arr!30968 (_values!6035 thiss!1427)) (store mapRest!37628 mapKey!37628 mapValue!37628))))

(declare-fun tp_is_empty!24133 () Bool)

(declare-fun e!578007 () Bool)

(declare-fun e!578013 () Bool)

(declare-fun array_inv!23983 (array!64316) Bool)

(declare-fun array_inv!23984 (array!64318) Bool)

(assert (=> b!1025188 (= e!578007 (and tp!72285 tp_is_empty!24133 (array_inv!23983 (_keys!11159 thiss!1427)) (array_inv!23984 (_values!6035 thiss!1427)) e!578013))))

(declare-fun b!1025189 () Bool)

(declare-fun res!686373 () Bool)

(declare-fun e!578012 () Bool)

(assert (=> b!1025189 (=> (not res!686373) (not e!578012))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025189 (= res!686373 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025190 () Bool)

(declare-fun e!578008 () Bool)

(assert (=> b!1025190 (= e!578008 tp_is_empty!24133)))

(declare-fun res!686375 () Bool)

(assert (=> start!89414 (=> (not res!686375) (not e!578012))))

(declare-fun valid!2022 (LongMapFixedSize!5320) Bool)

(assert (=> start!89414 (= res!686375 (valid!2022 thiss!1427))))

(assert (=> start!89414 e!578012))

(assert (=> start!89414 e!578007))

(assert (=> start!89414 true))

(declare-fun b!1025191 () Bool)

(declare-fun e!578009 () Bool)

(declare-fun e!578011 () Bool)

(assert (=> b!1025191 (= e!578009 (not e!578011))))

(declare-fun res!686377 () Bool)

(assert (=> b!1025191 (=> res!686377 e!578011)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025191 (= res!686377 (not (validMask!0 (mask!29678 thiss!1427))))))

(declare-fun lt!450826 () array!64316)

(declare-datatypes ((List!21746 0))(
  ( (Nil!21743) (Cons!21742 (h!22940 (_ BitVec 64)) (t!30808 List!21746)) )
))
(declare-fun arrayNoDuplicates!0 (array!64316 (_ BitVec 32) List!21746) Bool)

(assert (=> b!1025191 (arrayNoDuplicates!0 lt!450826 #b00000000000000000000000000000000 Nil!21743)))

(declare-datatypes ((Unit!33377 0))(
  ( (Unit!33378) )
))
(declare-fun lt!450828 () Unit!33377)

(declare-datatypes ((SeekEntryResult!9611 0))(
  ( (MissingZero!9611 (index!40815 (_ BitVec 32))) (Found!9611 (index!40816 (_ BitVec 32))) (Intermediate!9611 (undefined!10423 Bool) (index!40817 (_ BitVec 32)) (x!91161 (_ BitVec 32))) (Undefined!9611) (MissingVacant!9611 (index!40818 (_ BitVec 32))) )
))
(declare-fun lt!450827 () SeekEntryResult!9611)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64316 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21746) Unit!33377)

(assert (=> b!1025191 (= lt!450828 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11159 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40816 lt!450827) #b00000000000000000000000000000000 Nil!21743))))

(declare-fun arrayCountValidKeys!0 (array!64316 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025191 (= (arrayCountValidKeys!0 lt!450826 #b00000000000000000000000000000000 (size!31480 (_keys!11159 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11159 thiss!1427) #b00000000000000000000000000000000 (size!31480 (_keys!11159 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025191 (= lt!450826 (array!64317 (store (arr!30967 (_keys!11159 thiss!1427)) (index!40816 lt!450827) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31480 (_keys!11159 thiss!1427))))))

(declare-fun lt!450824 () Unit!33377)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64316 (_ BitVec 32) (_ BitVec 64)) Unit!33377)

(assert (=> b!1025191 (= lt!450824 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11159 thiss!1427) (index!40816 lt!450827) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025192 () Bool)

(declare-fun res!686378 () Bool)

(assert (=> b!1025192 (=> res!686378 e!578011)))

(assert (=> b!1025192 (= res!686378 (or (not (= (size!31480 (_keys!11159 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29678 thiss!1427)))) (bvslt (index!40816 lt!450827) #b00000000000000000000000000000000) (bvsge (index!40816 lt!450827) (size!31480 (_keys!11159 thiss!1427)))))))

(declare-fun b!1025193 () Bool)

(assert (=> b!1025193 (= e!578011 true)))

(declare-fun lt!450825 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64316 (_ BitVec 32)) Bool)

(assert (=> b!1025193 (= lt!450825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11159 thiss!1427) (mask!29678 thiss!1427)))))

(declare-fun b!1025194 () Bool)

(assert (=> b!1025194 (= e!578014 tp_is_empty!24133)))

(declare-fun b!1025195 () Bool)

(assert (=> b!1025195 (= e!578012 e!578009)))

(declare-fun res!686374 () Bool)

(assert (=> b!1025195 (=> (not res!686374) (not e!578009))))

(assert (=> b!1025195 (= res!686374 (is-Found!9611 lt!450827))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64316 (_ BitVec 32)) SeekEntryResult!9611)

(assert (=> b!1025195 (= lt!450827 (seekEntry!0 key!909 (_keys!11159 thiss!1427) (mask!29678 thiss!1427)))))

(declare-fun b!1025196 () Bool)

(assert (=> b!1025196 (= e!578013 (and e!578008 mapRes!37628))))

(declare-fun condMapEmpty!37628 () Bool)

(declare-fun mapDefault!37628 () ValueCell!11363)

