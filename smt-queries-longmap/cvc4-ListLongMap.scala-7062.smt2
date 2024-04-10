; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89430 () Bool)

(assert start!89430)

(declare-fun b!1025457 () Bool)

(declare-fun b_free!20429 () Bool)

(declare-fun b_next!20429 () Bool)

(assert (=> b!1025457 (= b_free!20429 (not b_next!20429))))

(declare-fun tp!72333 () Bool)

(declare-fun b_and!32675 () Bool)

(assert (=> b!1025457 (= tp!72333 b_and!32675)))

(declare-fun mapNonEmpty!37652 () Bool)

(declare-fun mapRes!37652 () Bool)

(declare-fun tp!72332 () Bool)

(declare-fun e!578206 () Bool)

(assert (=> mapNonEmpty!37652 (= mapRes!37652 (and tp!72332 e!578206))))

(declare-fun mapKey!37652 () (_ BitVec 32))

(declare-datatypes ((V!37071 0))(
  ( (V!37072 (val!12125 Int)) )
))
(declare-datatypes ((ValueCell!11371 0))(
  ( (ValueCellFull!11371 (v!14694 V!37071)) (EmptyCell!11371) )
))
(declare-fun mapRest!37652 () (Array (_ BitVec 32) ValueCell!11371))

(declare-fun mapValue!37652 () ValueCell!11371)

(declare-datatypes ((array!64348 0))(
  ( (array!64349 (arr!30983 (Array (_ BitVec 32) (_ BitVec 64))) (size!31496 (_ BitVec 32))) )
))
(declare-datatypes ((array!64350 0))(
  ( (array!64351 (arr!30984 (Array (_ BitVec 32) ValueCell!11371)) (size!31497 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5336 0))(
  ( (LongMapFixedSize!5337 (defaultEntry!6020 Int) (mask!29690 (_ BitVec 32)) (extraKeys!5752 (_ BitVec 32)) (zeroValue!5856 V!37071) (minValue!5856 V!37071) (_size!2723 (_ BitVec 32)) (_keys!11167 array!64348) (_values!6043 array!64350) (_vacant!2723 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5336)

(assert (=> mapNonEmpty!37652 (= (arr!30984 (_values!6043 thiss!1427)) (store mapRest!37652 mapKey!37652 mapValue!37652))))

(declare-fun res!686545 () Bool)

(declare-fun e!578199 () Bool)

(assert (=> start!89430 (=> (not res!686545) (not e!578199))))

(declare-fun valid!2028 (LongMapFixedSize!5336) Bool)

(assert (=> start!89430 (= res!686545 (valid!2028 thiss!1427))))

(assert (=> start!89430 e!578199))

(declare-fun e!578203 () Bool)

(assert (=> start!89430 e!578203))

(assert (=> start!89430 true))

(declare-fun b!1025452 () Bool)

(declare-fun e!578200 () Bool)

(assert (=> b!1025452 (= e!578200 true)))

(declare-fun lt!450944 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64348 (_ BitVec 32)) Bool)

(assert (=> b!1025452 (= lt!450944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11167 thiss!1427) (mask!29690 thiss!1427)))))

(declare-fun b!1025453 () Bool)

(declare-fun e!578205 () Bool)

(declare-fun tp_is_empty!24149 () Bool)

(assert (=> b!1025453 (= e!578205 tp_is_empty!24149)))

(declare-fun b!1025454 () Bool)

(assert (=> b!1025454 (= e!578206 tp_is_empty!24149)))

(declare-fun b!1025455 () Bool)

(declare-fun res!686546 () Bool)

(assert (=> b!1025455 (=> res!686546 e!578200)))

(declare-datatypes ((SeekEntryResult!9619 0))(
  ( (MissingZero!9619 (index!40847 (_ BitVec 32))) (Found!9619 (index!40848 (_ BitVec 32))) (Intermediate!9619 (undefined!10431 Bool) (index!40849 (_ BitVec 32)) (x!91185 (_ BitVec 32))) (Undefined!9619) (MissingVacant!9619 (index!40850 (_ BitVec 32))) )
))
(declare-fun lt!450947 () SeekEntryResult!9619)

(assert (=> b!1025455 (= res!686546 (or (not (= (size!31496 (_keys!11167 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29690 thiss!1427)))) (bvslt (index!40848 lt!450947) #b00000000000000000000000000000000) (bvsge (index!40848 lt!450947) (size!31496 (_keys!11167 thiss!1427)))))))

(declare-fun b!1025456 () Bool)

(declare-fun e!578202 () Bool)

(assert (=> b!1025456 (= e!578202 (not e!578200))))

(declare-fun res!686544 () Bool)

(assert (=> b!1025456 (=> res!686544 e!578200)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025456 (= res!686544 (not (validMask!0 (mask!29690 thiss!1427))))))

(declare-fun lt!450946 () array!64348)

(declare-datatypes ((List!21753 0))(
  ( (Nil!21750) (Cons!21749 (h!22947 (_ BitVec 64)) (t!30815 List!21753)) )
))
(declare-fun arrayNoDuplicates!0 (array!64348 (_ BitVec 32) List!21753) Bool)

(assert (=> b!1025456 (arrayNoDuplicates!0 lt!450946 #b00000000000000000000000000000000 Nil!21750)))

(declare-datatypes ((Unit!33391 0))(
  ( (Unit!33392) )
))
(declare-fun lt!450945 () Unit!33391)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21753) Unit!33391)

(assert (=> b!1025456 (= lt!450945 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11167 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40848 lt!450947) #b00000000000000000000000000000000 Nil!21750))))

(declare-fun arrayCountValidKeys!0 (array!64348 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025456 (= (arrayCountValidKeys!0 lt!450946 #b00000000000000000000000000000000 (size!31496 (_keys!11167 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11167 thiss!1427) #b00000000000000000000000000000000 (size!31496 (_keys!11167 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025456 (= lt!450946 (array!64349 (store (arr!30983 (_keys!11167 thiss!1427)) (index!40848 lt!450947) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31496 (_keys!11167 thiss!1427))))))

(declare-fun lt!450948 () Unit!33391)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64348 (_ BitVec 32) (_ BitVec 64)) Unit!33391)

(assert (=> b!1025456 (= lt!450948 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11167 thiss!1427) (index!40848 lt!450947) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37652 () Bool)

(assert (=> mapIsEmpty!37652 mapRes!37652))

(declare-fun e!578204 () Bool)

(declare-fun array_inv!23997 (array!64348) Bool)

(declare-fun array_inv!23998 (array!64350) Bool)

(assert (=> b!1025457 (= e!578203 (and tp!72333 tp_is_empty!24149 (array_inv!23997 (_keys!11167 thiss!1427)) (array_inv!23998 (_values!6043 thiss!1427)) e!578204))))

(declare-fun b!1025458 () Bool)

(declare-fun res!686543 () Bool)

(assert (=> b!1025458 (=> res!686543 e!578200)))

(assert (=> b!1025458 (= res!686543 (not (arrayNoDuplicates!0 (_keys!11167 thiss!1427) #b00000000000000000000000000000000 Nil!21750)))))

(declare-fun b!1025459 () Bool)

(assert (=> b!1025459 (= e!578204 (and e!578205 mapRes!37652))))

(declare-fun condMapEmpty!37652 () Bool)

(declare-fun mapDefault!37652 () ValueCell!11371)

