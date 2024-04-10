; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89480 () Bool)

(assert start!89480)

(declare-fun b!1026169 () Bool)

(declare-fun b_free!20479 () Bool)

(declare-fun b_next!20479 () Bool)

(assert (=> b!1026169 (= b_free!20479 (not b_next!20479))))

(declare-fun tp!72482 () Bool)

(declare-fun b_and!32725 () Bool)

(assert (=> b!1026169 (= tp!72482 b_and!32725)))

(declare-fun mapIsEmpty!37727 () Bool)

(declare-fun mapRes!37727 () Bool)

(assert (=> mapIsEmpty!37727 mapRes!37727))

(declare-fun b!1026163 () Bool)

(declare-fun e!578800 () Bool)

(declare-fun tp_is_empty!24199 () Bool)

(assert (=> b!1026163 (= e!578800 tp_is_empty!24199)))

(declare-fun b!1026164 () Bool)

(declare-fun e!578799 () Bool)

(declare-fun e!578802 () Bool)

(assert (=> b!1026164 (= e!578799 (not e!578802))))

(declare-fun res!686952 () Bool)

(assert (=> b!1026164 (=> res!686952 e!578802)))

(declare-datatypes ((SeekEntryResult!9640 0))(
  ( (MissingZero!9640 (index!40931 (_ BitVec 32))) (Found!9640 (index!40932 (_ BitVec 32))) (Intermediate!9640 (undefined!10452 Bool) (index!40933 (_ BitVec 32)) (x!91278 (_ BitVec 32))) (Undefined!9640) (MissingVacant!9640 (index!40934 (_ BitVec 32))) )
))
(declare-fun lt!451360 () SeekEntryResult!9640)

(declare-datatypes ((V!37139 0))(
  ( (V!37140 (val!12150 Int)) )
))
(declare-datatypes ((ValueCell!11396 0))(
  ( (ValueCellFull!11396 (v!14719 V!37139)) (EmptyCell!11396) )
))
(declare-datatypes ((array!64448 0))(
  ( (array!64449 (arr!31033 (Array (_ BitVec 32) (_ BitVec 64))) (size!31546 (_ BitVec 32))) )
))
(declare-datatypes ((array!64450 0))(
  ( (array!64451 (arr!31034 (Array (_ BitVec 32) ValueCell!11396)) (size!31547 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5386 0))(
  ( (LongMapFixedSize!5387 (defaultEntry!6045 Int) (mask!29733 (_ BitVec 32)) (extraKeys!5777 (_ BitVec 32)) (zeroValue!5881 V!37139) (minValue!5881 V!37139) (_size!2748 (_ BitVec 32)) (_keys!11192 array!64448) (_values!6068 array!64450) (_vacant!2748 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5386)

(assert (=> b!1026164 (= res!686952 (or (bvslt (index!40932 lt!451360) #b00000000000000000000000000000000) (bvsge (index!40932 lt!451360) (size!31546 (_keys!11192 thiss!1427))) (bvsge (size!31546 (_keys!11192 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451358 () array!64448)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64448 (_ BitVec 32)) Bool)

(assert (=> b!1026164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451358 (mask!29733 thiss!1427))))

(declare-datatypes ((Unit!33425 0))(
  ( (Unit!33426) )
))
(declare-fun lt!451357 () Unit!33425)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64448 (_ BitVec 32) (_ BitVec 32)) Unit!33425)

(assert (=> b!1026164 (= lt!451357 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11192 thiss!1427) (index!40932 lt!451360) (mask!29733 thiss!1427)))))

(declare-datatypes ((List!21772 0))(
  ( (Nil!21769) (Cons!21768 (h!22966 (_ BitVec 64)) (t!30834 List!21772)) )
))
(declare-fun arrayNoDuplicates!0 (array!64448 (_ BitVec 32) List!21772) Bool)

(assert (=> b!1026164 (arrayNoDuplicates!0 lt!451358 #b00000000000000000000000000000000 Nil!21769)))

(declare-fun lt!451359 () Unit!33425)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21772) Unit!33425)

(assert (=> b!1026164 (= lt!451359 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11192 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40932 lt!451360) #b00000000000000000000000000000000 Nil!21769))))

(declare-fun arrayCountValidKeys!0 (array!64448 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026164 (= (arrayCountValidKeys!0 lt!451358 #b00000000000000000000000000000000 (size!31546 (_keys!11192 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11192 thiss!1427) #b00000000000000000000000000000000 (size!31546 (_keys!11192 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026164 (= lt!451358 (array!64449 (store (arr!31033 (_keys!11192 thiss!1427)) (index!40932 lt!451360) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31546 (_keys!11192 thiss!1427))))))

(declare-fun lt!451362 () Unit!33425)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64448 (_ BitVec 32) (_ BitVec 64)) Unit!33425)

(assert (=> b!1026164 (= lt!451362 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11192 thiss!1427) (index!40932 lt!451360) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686954 () Bool)

(declare-fun e!578806 () Bool)

(assert (=> start!89480 (=> (not res!686954) (not e!578806))))

(declare-fun valid!2046 (LongMapFixedSize!5386) Bool)

(assert (=> start!89480 (= res!686954 (valid!2046 thiss!1427))))

(assert (=> start!89480 e!578806))

(declare-fun e!578805 () Bool)

(assert (=> start!89480 e!578805))

(assert (=> start!89480 true))

(declare-fun b!1026165 () Bool)

(assert (=> b!1026165 (= e!578802 true)))

(declare-fun lt!451361 () Bool)

(assert (=> b!1026165 (= lt!451361 (arrayNoDuplicates!0 (_keys!11192 thiss!1427) #b00000000000000000000000000000000 Nil!21769))))

(declare-fun b!1026166 () Bool)

(declare-fun e!578803 () Bool)

(assert (=> b!1026166 (= e!578803 (and e!578800 mapRes!37727))))

(declare-fun condMapEmpty!37727 () Bool)

(declare-fun mapDefault!37727 () ValueCell!11396)

