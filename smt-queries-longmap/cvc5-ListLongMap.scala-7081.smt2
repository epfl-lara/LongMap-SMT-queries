; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89540 () Bool)

(assert start!89540)

(declare-fun b!1027034 () Bool)

(declare-fun b_free!20539 () Bool)

(declare-fun b_next!20539 () Bool)

(assert (=> b!1027034 (= b_free!20539 (not b_next!20539))))

(declare-fun tp!72662 () Bool)

(declare-fun b_and!32785 () Bool)

(assert (=> b!1027034 (= tp!72662 b_and!32785)))

(declare-fun b!1027032 () Bool)

(declare-fun res!687459 () Bool)

(declare-fun e!579522 () Bool)

(assert (=> b!1027032 (=> res!687459 e!579522)))

(declare-datatypes ((V!37219 0))(
  ( (V!37220 (val!12180 Int)) )
))
(declare-datatypes ((ValueCell!11426 0))(
  ( (ValueCellFull!11426 (v!14749 V!37219)) (EmptyCell!11426) )
))
(declare-datatypes ((array!64568 0))(
  ( (array!64569 (arr!31093 (Array (_ BitVec 32) (_ BitVec 64))) (size!31606 (_ BitVec 32))) )
))
(declare-datatypes ((array!64570 0))(
  ( (array!64571 (arr!31094 (Array (_ BitVec 32) ValueCell!11426)) (size!31607 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5446 0))(
  ( (LongMapFixedSize!5447 (defaultEntry!6075 Int) (mask!29783 (_ BitVec 32)) (extraKeys!5807 (_ BitVec 32)) (zeroValue!5911 V!37219) (minValue!5911 V!37219) (_size!2778 (_ BitVec 32)) (_keys!11222 array!64568) (_values!6098 array!64570) (_vacant!2778 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5446)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64568 (_ BitVec 32)) Bool)

(assert (=> b!1027032 (= res!687459 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11222 thiss!1427) (mask!29783 thiss!1427))))))

(declare-fun b!1027033 () Bool)

(declare-fun e!579519 () Bool)

(declare-fun e!579520 () Bool)

(assert (=> b!1027033 (= e!579519 e!579520)))

(declare-fun res!687462 () Bool)

(assert (=> b!1027033 (=> (not res!687462) (not e!579520))))

(declare-datatypes ((SeekEntryResult!9662 0))(
  ( (MissingZero!9662 (index!41019 (_ BitVec 32))) (Found!9662 (index!41020 (_ BitVec 32))) (Intermediate!9662 (undefined!10474 Bool) (index!41021 (_ BitVec 32)) (x!91380 (_ BitVec 32))) (Undefined!9662) (MissingVacant!9662 (index!41022 (_ BitVec 32))) )
))
(declare-fun lt!451975 () SeekEntryResult!9662)

(assert (=> b!1027033 (= res!687462 (is-Found!9662 lt!451975))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64568 (_ BitVec 32)) SeekEntryResult!9662)

(assert (=> b!1027033 (= lt!451975 (seekEntry!0 key!909 (_keys!11222 thiss!1427) (mask!29783 thiss!1427)))))

(declare-fun e!579524 () Bool)

(declare-fun e!579526 () Bool)

(declare-fun tp_is_empty!24259 () Bool)

(declare-fun array_inv!24075 (array!64568) Bool)

(declare-fun array_inv!24076 (array!64570) Bool)

(assert (=> b!1027034 (= e!579524 (and tp!72662 tp_is_empty!24259 (array_inv!24075 (_keys!11222 thiss!1427)) (array_inv!24076 (_values!6098 thiss!1427)) e!579526))))

(declare-fun mapIsEmpty!37817 () Bool)

(declare-fun mapRes!37817 () Bool)

(assert (=> mapIsEmpty!37817 mapRes!37817))

(declare-fun b!1027035 () Bool)

(assert (=> b!1027035 (= e!579520 (not e!579522))))

(declare-fun res!687460 () Bool)

(assert (=> b!1027035 (=> res!687460 e!579522)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027035 (= res!687460 (not (validMask!0 (mask!29783 thiss!1427))))))

(declare-fun lt!451971 () array!64568)

(declare-fun arrayContainsKey!0 (array!64568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027035 (not (arrayContainsKey!0 lt!451971 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33465 0))(
  ( (Unit!33466) )
))
(declare-fun lt!451973 () Unit!33465)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64568 (_ BitVec 32) (_ BitVec 64)) Unit!33465)

(assert (=> b!1027035 (= lt!451973 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11222 thiss!1427) (index!41020 lt!451975) key!909))))

(assert (=> b!1027035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451971 (mask!29783 thiss!1427))))

(declare-fun lt!451977 () Unit!33465)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64568 (_ BitVec 32) (_ BitVec 32)) Unit!33465)

(assert (=> b!1027035 (= lt!451977 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11222 thiss!1427) (index!41020 lt!451975) (mask!29783 thiss!1427)))))

(declare-datatypes ((List!21795 0))(
  ( (Nil!21792) (Cons!21791 (h!22989 (_ BitVec 64)) (t!30857 List!21795)) )
))
(declare-fun arrayNoDuplicates!0 (array!64568 (_ BitVec 32) List!21795) Bool)

(assert (=> b!1027035 (arrayNoDuplicates!0 lt!451971 #b00000000000000000000000000000000 Nil!21792)))

(declare-fun lt!451974 () Unit!33465)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21795) Unit!33465)

(assert (=> b!1027035 (= lt!451974 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11222 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41020 lt!451975) #b00000000000000000000000000000000 Nil!21792))))

(declare-fun arrayCountValidKeys!0 (array!64568 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027035 (= (arrayCountValidKeys!0 lt!451971 #b00000000000000000000000000000000 (size!31606 (_keys!11222 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11222 thiss!1427) #b00000000000000000000000000000000 (size!31606 (_keys!11222 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027035 (= lt!451971 (array!64569 (store (arr!31093 (_keys!11222 thiss!1427)) (index!41020 lt!451975) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31606 (_keys!11222 thiss!1427))))))

(declare-fun lt!451976 () Unit!33465)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64568 (_ BitVec 32) (_ BitVec 64)) Unit!33465)

(assert (=> b!1027035 (= lt!451976 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11222 thiss!1427) (index!41020 lt!451975) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37817 () Bool)

(declare-fun tp!72663 () Bool)

(declare-fun e!579523 () Bool)

(assert (=> mapNonEmpty!37817 (= mapRes!37817 (and tp!72663 e!579523))))

(declare-fun mapValue!37817 () ValueCell!11426)

(declare-fun mapRest!37817 () (Array (_ BitVec 32) ValueCell!11426))

(declare-fun mapKey!37817 () (_ BitVec 32))

(assert (=> mapNonEmpty!37817 (= (arr!31094 (_values!6098 thiss!1427)) (store mapRest!37817 mapKey!37817 mapValue!37817))))

(declare-fun b!1027036 () Bool)

(assert (=> b!1027036 (= e!579522 true)))

(declare-fun lt!451972 () Bool)

(assert (=> b!1027036 (= lt!451972 (arrayNoDuplicates!0 (_keys!11222 thiss!1427) #b00000000000000000000000000000000 Nil!21792))))

(declare-fun b!1027031 () Bool)

(declare-fun e!579521 () Bool)

(assert (=> b!1027031 (= e!579526 (and e!579521 mapRes!37817))))

(declare-fun condMapEmpty!37817 () Bool)

(declare-fun mapDefault!37817 () ValueCell!11426)

