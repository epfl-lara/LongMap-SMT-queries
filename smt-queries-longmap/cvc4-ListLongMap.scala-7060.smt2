; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89418 () Bool)

(assert start!89418)

(declare-fun b!1025258 () Bool)

(declare-fun b_free!20417 () Bool)

(declare-fun b_next!20417 () Bool)

(assert (=> b!1025258 (= b_free!20417 (not b_next!20417))))

(declare-fun tp!72296 () Bool)

(declare-fun b_and!32663 () Bool)

(assert (=> b!1025258 (= tp!72296 b_and!32663)))

(declare-fun b!1025254 () Bool)

(declare-fun e!578061 () Bool)

(declare-fun tp_is_empty!24137 () Bool)

(assert (=> b!1025254 (= e!578061 tp_is_empty!24137)))

(declare-fun mapNonEmpty!37634 () Bool)

(declare-fun mapRes!37634 () Bool)

(declare-fun tp!72297 () Bool)

(assert (=> mapNonEmpty!37634 (= mapRes!37634 (and tp!72297 e!578061))))

(declare-datatypes ((V!37055 0))(
  ( (V!37056 (val!12119 Int)) )
))
(declare-datatypes ((ValueCell!11365 0))(
  ( (ValueCellFull!11365 (v!14688 V!37055)) (EmptyCell!11365) )
))
(declare-fun mapValue!37634 () ValueCell!11365)

(declare-fun mapRest!37634 () (Array (_ BitVec 32) ValueCell!11365))

(declare-datatypes ((array!64324 0))(
  ( (array!64325 (arr!30971 (Array (_ BitVec 32) (_ BitVec 64))) (size!31484 (_ BitVec 32))) )
))
(declare-datatypes ((array!64326 0))(
  ( (array!64327 (arr!30972 (Array (_ BitVec 32) ValueCell!11365)) (size!31485 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5324 0))(
  ( (LongMapFixedSize!5325 (defaultEntry!6014 Int) (mask!29680 (_ BitVec 32)) (extraKeys!5746 (_ BitVec 32)) (zeroValue!5850 V!37055) (minValue!5850 V!37055) (_size!2717 (_ BitVec 32)) (_keys!11161 array!64324) (_values!6037 array!64326) (_vacant!2717 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5324)

(declare-fun mapKey!37634 () (_ BitVec 32))

(assert (=> mapNonEmpty!37634 (= (arr!30972 (_values!6037 thiss!1427)) (store mapRest!37634 mapKey!37634 mapValue!37634))))

(declare-fun b!1025255 () Bool)

(declare-fun e!578057 () Bool)

(declare-fun e!578060 () Bool)

(assert (=> b!1025255 (= e!578057 e!578060)))

(declare-fun res!686420 () Bool)

(assert (=> b!1025255 (=> (not res!686420) (not e!578060))))

(declare-datatypes ((SeekEntryResult!9613 0))(
  ( (MissingZero!9613 (index!40823 (_ BitVec 32))) (Found!9613 (index!40824 (_ BitVec 32))) (Intermediate!9613 (undefined!10425 Bool) (index!40825 (_ BitVec 32)) (x!91163 (_ BitVec 32))) (Undefined!9613) (MissingVacant!9613 (index!40826 (_ BitVec 32))) )
))
(declare-fun lt!450856 () SeekEntryResult!9613)

(assert (=> b!1025255 (= res!686420 (is-Found!9613 lt!450856))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64324 (_ BitVec 32)) SeekEntryResult!9613)

(assert (=> b!1025255 (= lt!450856 (seekEntry!0 key!909 (_keys!11161 thiss!1427) (mask!29680 thiss!1427)))))

(declare-fun b!1025256 () Bool)

(declare-fun e!578059 () Bool)

(assert (=> b!1025256 (= e!578060 (not e!578059))))

(declare-fun res!686414 () Bool)

(assert (=> b!1025256 (=> res!686414 e!578059)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025256 (= res!686414 (not (validMask!0 (mask!29680 thiss!1427))))))

(declare-fun lt!450855 () array!64324)

(declare-datatypes ((List!21748 0))(
  ( (Nil!21745) (Cons!21744 (h!22942 (_ BitVec 64)) (t!30810 List!21748)) )
))
(declare-fun arrayNoDuplicates!0 (array!64324 (_ BitVec 32) List!21748) Bool)

(assert (=> b!1025256 (arrayNoDuplicates!0 lt!450855 #b00000000000000000000000000000000 Nil!21745)))

(declare-datatypes ((Unit!33381 0))(
  ( (Unit!33382) )
))
(declare-fun lt!450858 () Unit!33381)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64324 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21748) Unit!33381)

(assert (=> b!1025256 (= lt!450858 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11161 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40824 lt!450856) #b00000000000000000000000000000000 Nil!21745))))

(declare-fun arrayCountValidKeys!0 (array!64324 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025256 (= (arrayCountValidKeys!0 lt!450855 #b00000000000000000000000000000000 (size!31484 (_keys!11161 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11161 thiss!1427) #b00000000000000000000000000000000 (size!31484 (_keys!11161 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025256 (= lt!450855 (array!64325 (store (arr!30971 (_keys!11161 thiss!1427)) (index!40824 lt!450856) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31484 (_keys!11161 thiss!1427))))))

(declare-fun lt!450854 () Unit!33381)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64324 (_ BitVec 32) (_ BitVec 64)) Unit!33381)

(assert (=> b!1025256 (= lt!450854 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11161 thiss!1427) (index!40824 lt!450856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025257 () Bool)

(declare-fun res!686416 () Bool)

(assert (=> b!1025257 (=> res!686416 e!578059)))

(assert (=> b!1025257 (= res!686416 (or (not (= (size!31484 (_keys!11161 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29680 thiss!1427)))) (bvslt (index!40824 lt!450856) #b00000000000000000000000000000000) (bvsge (index!40824 lt!450856) (size!31484 (_keys!11161 thiss!1427)))))))

(declare-fun b!1025259 () Bool)

(assert (=> b!1025259 (= e!578059 true)))

(declare-fun lt!450857 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64324 (_ BitVec 32)) Bool)

(assert (=> b!1025259 (= lt!450857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11161 thiss!1427) (mask!29680 thiss!1427)))))

(declare-fun b!1025260 () Bool)

(declare-fun e!578058 () Bool)

(assert (=> b!1025260 (= e!578058 tp_is_empty!24137)))

(declare-fun b!1025261 () Bool)

(declare-fun e!578055 () Bool)

(assert (=> b!1025261 (= e!578055 (and e!578058 mapRes!37634))))

(declare-fun condMapEmpty!37634 () Bool)

(declare-fun mapDefault!37634 () ValueCell!11365)

