; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89420 () Bool)

(assert start!89420)

(declare-fun b!1025290 () Bool)

(declare-fun b_free!20419 () Bool)

(declare-fun b_next!20419 () Bool)

(assert (=> b!1025290 (= b_free!20419 (not b_next!20419))))

(declare-fun tp!72302 () Bool)

(declare-fun b_and!32665 () Bool)

(assert (=> b!1025290 (= tp!72302 b_and!32665)))

(declare-fun b!1025287 () Bool)

(declare-fun e!578086 () Bool)

(declare-fun tp_is_empty!24139 () Bool)

(assert (=> b!1025287 (= e!578086 tp_is_empty!24139)))

(declare-fun b!1025288 () Bool)

(declare-fun e!578084 () Bool)

(declare-fun e!578083 () Bool)

(assert (=> b!1025288 (= e!578084 (not e!578083))))

(declare-fun res!686441 () Bool)

(assert (=> b!1025288 (=> res!686441 e!578083)))

(declare-datatypes ((V!37059 0))(
  ( (V!37060 (val!12120 Int)) )
))
(declare-datatypes ((ValueCell!11366 0))(
  ( (ValueCellFull!11366 (v!14689 V!37059)) (EmptyCell!11366) )
))
(declare-datatypes ((array!64328 0))(
  ( (array!64329 (arr!30973 (Array (_ BitVec 32) (_ BitVec 64))) (size!31486 (_ BitVec 32))) )
))
(declare-datatypes ((array!64330 0))(
  ( (array!64331 (arr!30974 (Array (_ BitVec 32) ValueCell!11366)) (size!31487 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5326 0))(
  ( (LongMapFixedSize!5327 (defaultEntry!6015 Int) (mask!29683 (_ BitVec 32)) (extraKeys!5747 (_ BitVec 32)) (zeroValue!5851 V!37059) (minValue!5851 V!37059) (_size!2718 (_ BitVec 32)) (_keys!11162 array!64328) (_values!6038 array!64330) (_vacant!2718 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5326)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025288 (= res!686441 (not (validMask!0 (mask!29683 thiss!1427))))))

(declare-fun lt!450873 () array!64328)

(declare-datatypes ((List!21749 0))(
  ( (Nil!21746) (Cons!21745 (h!22943 (_ BitVec 64)) (t!30811 List!21749)) )
))
(declare-fun arrayNoDuplicates!0 (array!64328 (_ BitVec 32) List!21749) Bool)

(assert (=> b!1025288 (arrayNoDuplicates!0 lt!450873 #b00000000000000000000000000000000 Nil!21746)))

(declare-datatypes ((Unit!33383 0))(
  ( (Unit!33384) )
))
(declare-fun lt!450872 () Unit!33383)

(declare-datatypes ((SeekEntryResult!9614 0))(
  ( (MissingZero!9614 (index!40827 (_ BitVec 32))) (Found!9614 (index!40828 (_ BitVec 32))) (Intermediate!9614 (undefined!10426 Bool) (index!40829 (_ BitVec 32)) (x!91172 (_ BitVec 32))) (Undefined!9614) (MissingVacant!9614 (index!40830 (_ BitVec 32))) )
))
(declare-fun lt!450869 () SeekEntryResult!9614)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21749) Unit!33383)

(assert (=> b!1025288 (= lt!450872 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11162 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40828 lt!450869) #b00000000000000000000000000000000 Nil!21746))))

(declare-fun arrayCountValidKeys!0 (array!64328 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025288 (= (arrayCountValidKeys!0 lt!450873 #b00000000000000000000000000000000 (size!31486 (_keys!11162 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11162 thiss!1427) #b00000000000000000000000000000000 (size!31486 (_keys!11162 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025288 (= lt!450873 (array!64329 (store (arr!30973 (_keys!11162 thiss!1427)) (index!40828 lt!450869) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31486 (_keys!11162 thiss!1427))))))

(declare-fun lt!450870 () Unit!33383)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64328 (_ BitVec 32) (_ BitVec 64)) Unit!33383)

(assert (=> b!1025288 (= lt!450870 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11162 thiss!1427) (index!40828 lt!450869) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!578080 () Bool)

(declare-fun e!578082 () Bool)

(declare-fun array_inv!23987 (array!64328) Bool)

(declare-fun array_inv!23988 (array!64330) Bool)

(assert (=> b!1025290 (= e!578080 (and tp!72302 tp_is_empty!24139 (array_inv!23987 (_keys!11162 thiss!1427)) (array_inv!23988 (_values!6038 thiss!1427)) e!578082))))

(declare-fun b!1025291 () Bool)

(declare-fun res!686436 () Bool)

(assert (=> b!1025291 (=> res!686436 e!578083)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025291 (= res!686436 (not (validKeyInArray!0 (select (arr!30973 (_keys!11162 thiss!1427)) (index!40828 lt!450869)))))))

(declare-fun b!1025292 () Bool)

(declare-fun e!578079 () Bool)

(assert (=> b!1025292 (= e!578079 e!578084)))

(declare-fun res!686438 () Bool)

(assert (=> b!1025292 (=> (not res!686438) (not e!578084))))

(assert (=> b!1025292 (= res!686438 (is-Found!9614 lt!450869))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64328 (_ BitVec 32)) SeekEntryResult!9614)

(assert (=> b!1025292 (= lt!450869 (seekEntry!0 key!909 (_keys!11162 thiss!1427) (mask!29683 thiss!1427)))))

(declare-fun mapIsEmpty!37637 () Bool)

(declare-fun mapRes!37637 () Bool)

(assert (=> mapIsEmpty!37637 mapRes!37637))

(declare-fun mapNonEmpty!37637 () Bool)

(declare-fun tp!72303 () Bool)

(assert (=> mapNonEmpty!37637 (= mapRes!37637 (and tp!72303 e!578086))))

(declare-fun mapValue!37637 () ValueCell!11366)

(declare-fun mapKey!37637 () (_ BitVec 32))

(declare-fun mapRest!37637 () (Array (_ BitVec 32) ValueCell!11366))

(assert (=> mapNonEmpty!37637 (= (arr!30974 (_values!6038 thiss!1427)) (store mapRest!37637 mapKey!37637 mapValue!37637))))

(declare-fun b!1025293 () Bool)

(declare-fun res!686437 () Bool)

(assert (=> b!1025293 (=> res!686437 e!578083)))

(assert (=> b!1025293 (= res!686437 (or (not (= (size!31486 (_keys!11162 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29683 thiss!1427)))) (bvslt (index!40828 lt!450869) #b00000000000000000000000000000000) (bvsge (index!40828 lt!450869) (size!31486 (_keys!11162 thiss!1427)))))))

(declare-fun b!1025294 () Bool)

(assert (=> b!1025294 (= e!578083 true)))

(declare-fun lt!450871 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64328 (_ BitVec 32)) Bool)

(assert (=> b!1025294 (= lt!450871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11162 thiss!1427) (mask!29683 thiss!1427)))))

(declare-fun b!1025295 () Bool)

(declare-fun res!686440 () Bool)

(assert (=> b!1025295 (=> (not res!686440) (not e!578079))))

(assert (=> b!1025295 (= res!686440 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025289 () Bool)

(declare-fun res!686439 () Bool)

(assert (=> b!1025289 (=> res!686439 e!578083)))

(assert (=> b!1025289 (= res!686439 (not (arrayNoDuplicates!0 (_keys!11162 thiss!1427) #b00000000000000000000000000000000 Nil!21746)))))

(declare-fun res!686435 () Bool)

(assert (=> start!89420 (=> (not res!686435) (not e!578079))))

(declare-fun valid!2024 (LongMapFixedSize!5326) Bool)

(assert (=> start!89420 (= res!686435 (valid!2024 thiss!1427))))

(assert (=> start!89420 e!578079))

(assert (=> start!89420 e!578080))

(assert (=> start!89420 true))

(declare-fun b!1025296 () Bool)

(declare-fun e!578081 () Bool)

(assert (=> b!1025296 (= e!578082 (and e!578081 mapRes!37637))))

(declare-fun condMapEmpty!37637 () Bool)

(declare-fun mapDefault!37637 () ValueCell!11366)

