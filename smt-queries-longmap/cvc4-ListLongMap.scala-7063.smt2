; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89436 () Bool)

(assert start!89436)

(declare-fun b!1025552 () Bool)

(declare-fun b_free!20435 () Bool)

(declare-fun b_next!20435 () Bool)

(assert (=> b!1025552 (= b_free!20435 (not b_next!20435))))

(declare-fun tp!72351 () Bool)

(declare-fun b_and!32681 () Bool)

(assert (=> b!1025552 (= tp!72351 b_and!32681)))

(declare-fun b!1025551 () Bool)

(declare-fun res!686609 () Bool)

(declare-fun e!578277 () Bool)

(assert (=> b!1025551 (=> res!686609 e!578277)))

(declare-datatypes ((V!37079 0))(
  ( (V!37080 (val!12128 Int)) )
))
(declare-datatypes ((ValueCell!11374 0))(
  ( (ValueCellFull!11374 (v!14697 V!37079)) (EmptyCell!11374) )
))
(declare-datatypes ((array!64360 0))(
  ( (array!64361 (arr!30989 (Array (_ BitVec 32) (_ BitVec 64))) (size!31502 (_ BitVec 32))) )
))
(declare-datatypes ((array!64362 0))(
  ( (array!64363 (arr!30990 (Array (_ BitVec 32) ValueCell!11374)) (size!31503 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5342 0))(
  ( (LongMapFixedSize!5343 (defaultEntry!6023 Int) (mask!29695 (_ BitVec 32)) (extraKeys!5755 (_ BitVec 32)) (zeroValue!5859 V!37079) (minValue!5859 V!37079) (_size!2726 (_ BitVec 32)) (_keys!11170 array!64360) (_values!6046 array!64362) (_vacant!2726 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5342)

(declare-datatypes ((List!21755 0))(
  ( (Nil!21752) (Cons!21751 (h!22949 (_ BitVec 64)) (t!30817 List!21755)) )
))
(declare-fun arrayNoDuplicates!0 (array!64360 (_ BitVec 32) List!21755) Bool)

(assert (=> b!1025551 (= res!686609 (not (arrayNoDuplicates!0 (_keys!11170 thiss!1427) #b00000000000000000000000000000000 Nil!21752)))))

(declare-fun e!578278 () Bool)

(declare-fun e!578272 () Bool)

(declare-fun tp_is_empty!24155 () Bool)

(declare-fun array_inv!24001 (array!64360) Bool)

(declare-fun array_inv!24002 (array!64362) Bool)

(assert (=> b!1025552 (= e!578272 (and tp!72351 tp_is_empty!24155 (array_inv!24001 (_keys!11170 thiss!1427)) (array_inv!24002 (_values!6046 thiss!1427)) e!578278))))

(declare-fun b!1025553 () Bool)

(declare-fun e!578274 () Bool)

(assert (=> b!1025553 (= e!578274 (not e!578277))))

(declare-fun res!686605 () Bool)

(assert (=> b!1025553 (=> res!686605 e!578277)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025553 (= res!686605 (not (validMask!0 (mask!29695 thiss!1427))))))

(declare-fun lt!450989 () array!64360)

(assert (=> b!1025553 (arrayNoDuplicates!0 lt!450989 #b00000000000000000000000000000000 Nil!21752)))

(declare-datatypes ((Unit!33395 0))(
  ( (Unit!33396) )
))
(declare-fun lt!450992 () Unit!33395)

(declare-datatypes ((SeekEntryResult!9622 0))(
  ( (MissingZero!9622 (index!40859 (_ BitVec 32))) (Found!9622 (index!40860 (_ BitVec 32))) (Intermediate!9622 (undefined!10434 Bool) (index!40861 (_ BitVec 32)) (x!91196 (_ BitVec 32))) (Undefined!9622) (MissingVacant!9622 (index!40862 (_ BitVec 32))) )
))
(declare-fun lt!450991 () SeekEntryResult!9622)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64360 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21755) Unit!33395)

(assert (=> b!1025553 (= lt!450992 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11170 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40860 lt!450991) #b00000000000000000000000000000000 Nil!21752))))

(declare-fun arrayCountValidKeys!0 (array!64360 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025553 (= (arrayCountValidKeys!0 lt!450989 #b00000000000000000000000000000000 (size!31502 (_keys!11170 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11170 thiss!1427) #b00000000000000000000000000000000 (size!31502 (_keys!11170 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025553 (= lt!450989 (array!64361 (store (arr!30989 (_keys!11170 thiss!1427)) (index!40860 lt!450991) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31502 (_keys!11170 thiss!1427))))))

(declare-fun lt!450990 () Unit!33395)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64360 (_ BitVec 32) (_ BitVec 64)) Unit!33395)

(assert (=> b!1025553 (= lt!450990 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11170 thiss!1427) (index!40860 lt!450991) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025554 () Bool)

(declare-fun res!686608 () Bool)

(assert (=> b!1025554 (=> res!686608 e!578277)))

(assert (=> b!1025554 (= res!686608 (or (not (= (size!31502 (_keys!11170 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29695 thiss!1427)))) (bvslt (index!40860 lt!450991) #b00000000000000000000000000000000) (bvsge (index!40860 lt!450991) (size!31502 (_keys!11170 thiss!1427)))))))

(declare-fun b!1025555 () Bool)

(declare-fun res!686607 () Bool)

(declare-fun e!578276 () Bool)

(assert (=> b!1025555 (=> (not res!686607) (not e!578276))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025555 (= res!686607 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37661 () Bool)

(declare-fun mapRes!37661 () Bool)

(declare-fun tp!72350 () Bool)

(declare-fun e!578273 () Bool)

(assert (=> mapNonEmpty!37661 (= mapRes!37661 (and tp!72350 e!578273))))

(declare-fun mapRest!37661 () (Array (_ BitVec 32) ValueCell!11374))

(declare-fun mapValue!37661 () ValueCell!11374)

(declare-fun mapKey!37661 () (_ BitVec 32))

(assert (=> mapNonEmpty!37661 (= (arr!30990 (_values!6046 thiss!1427)) (store mapRest!37661 mapKey!37661 mapValue!37661))))

(declare-fun b!1025556 () Bool)

(declare-fun e!578271 () Bool)

(assert (=> b!1025556 (= e!578271 tp_is_empty!24155)))

(declare-fun res!686606 () Bool)

(assert (=> start!89436 (=> (not res!686606) (not e!578276))))

(declare-fun valid!2030 (LongMapFixedSize!5342) Bool)

(assert (=> start!89436 (= res!686606 (valid!2030 thiss!1427))))

(assert (=> start!89436 e!578276))

(assert (=> start!89436 e!578272))

(assert (=> start!89436 true))

(declare-fun b!1025557 () Bool)

(assert (=> b!1025557 (= e!578278 (and e!578271 mapRes!37661))))

(declare-fun condMapEmpty!37661 () Bool)

(declare-fun mapDefault!37661 () ValueCell!11374)

