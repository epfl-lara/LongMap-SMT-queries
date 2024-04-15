; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90714 () Bool)

(assert start!90714)

(declare-fun b!1037163 () Bool)

(declare-fun b_free!20893 () Bool)

(declare-fun b_next!20893 () Bool)

(assert (=> b!1037163 (= b_free!20893 (not b_next!20893))))

(declare-fun tp!73824 () Bool)

(declare-fun b_and!33399 () Bool)

(assert (=> b!1037163 (= tp!73824 b_and!33399)))

(declare-fun mapIsEmpty!38448 () Bool)

(declare-fun mapRes!38448 () Bool)

(assert (=> mapIsEmpty!38448 mapRes!38448))

(declare-fun b!1037161 () Bool)

(declare-fun e!586650 () Bool)

(declare-fun e!586652 () Bool)

(assert (=> b!1037161 (= e!586650 (and e!586652 mapRes!38448))))

(declare-fun condMapEmpty!38448 () Bool)

(declare-datatypes ((V!37691 0))(
  ( (V!37692 (val!12357 Int)) )
))
(declare-datatypes ((ValueCell!11603 0))(
  ( (ValueCellFull!11603 (v!14939 V!37691)) (EmptyCell!11603) )
))
(declare-datatypes ((array!65269 0))(
  ( (array!65270 (arr!31416 (Array (_ BitVec 32) (_ BitVec 64))) (size!31948 (_ BitVec 32))) )
))
(declare-datatypes ((array!65271 0))(
  ( (array!65272 (arr!31417 (Array (_ BitVec 32) ValueCell!11603)) (size!31949 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5800 0))(
  ( (LongMapFixedSize!5801 (defaultEntry!6282 Int) (mask!30194 (_ BitVec 32)) (extraKeys!6010 (_ BitVec 32)) (zeroValue!6116 V!37691) (minValue!6116 V!37691) (_size!2955 (_ BitVec 32)) (_keys!11474 array!65269) (_values!6305 array!65271) (_vacant!2955 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5800)

(declare-fun mapDefault!38448 () ValueCell!11603)

(assert (=> b!1037161 (= condMapEmpty!38448 (= (arr!31417 (_values!6305 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11603)) mapDefault!38448)))))

(declare-fun b!1037162 () Bool)

(declare-fun e!586651 () Bool)

(assert (=> b!1037162 (= e!586651 (not true))))

(declare-datatypes ((SeekEntryResult!9744 0))(
  ( (MissingZero!9744 (index!41347 (_ BitVec 32))) (Found!9744 (index!41348 (_ BitVec 32))) (Intermediate!9744 (undefined!10556 Bool) (index!41349 (_ BitVec 32)) (x!92524 (_ BitVec 32))) (Undefined!9744) (MissingVacant!9744 (index!41350 (_ BitVec 32))) )
))
(declare-fun lt!457257 () SeekEntryResult!9744)

(declare-fun arrayCountValidKeys!0 (array!65269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037162 (= (arrayCountValidKeys!0 (array!65270 (store (arr!31416 (_keys!11474 thiss!1427)) (index!41348 lt!457257) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31948 (_keys!11474 thiss!1427))) #b00000000000000000000000000000000 (size!31948 (_keys!11474 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11474 thiss!1427) #b00000000000000000000000000000000 (size!31948 (_keys!11474 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33827 0))(
  ( (Unit!33828) )
))
(declare-fun lt!457256 () Unit!33827)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65269 (_ BitVec 32) (_ BitVec 64)) Unit!33827)

(assert (=> b!1037162 (= lt!457256 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11474 thiss!1427) (index!41348 lt!457257) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!586654 () Bool)

(declare-fun tp_is_empty!24613 () Bool)

(declare-fun array_inv!24295 (array!65269) Bool)

(declare-fun array_inv!24296 (array!65271) Bool)

(assert (=> b!1037163 (= e!586654 (and tp!73824 tp_is_empty!24613 (array_inv!24295 (_keys!11474 thiss!1427)) (array_inv!24296 (_values!6305 thiss!1427)) e!586650))))

(declare-fun b!1037164 () Bool)

(declare-fun res!692066 () Bool)

(declare-fun e!586655 () Bool)

(assert (=> b!1037164 (=> (not res!692066) (not e!586655))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037164 (= res!692066 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38448 () Bool)

(declare-fun tp!73825 () Bool)

(declare-fun e!586653 () Bool)

(assert (=> mapNonEmpty!38448 (= mapRes!38448 (and tp!73825 e!586653))))

(declare-fun mapRest!38448 () (Array (_ BitVec 32) ValueCell!11603))

(declare-fun mapKey!38448 () (_ BitVec 32))

(declare-fun mapValue!38448 () ValueCell!11603)

(assert (=> mapNonEmpty!38448 (= (arr!31417 (_values!6305 thiss!1427)) (store mapRest!38448 mapKey!38448 mapValue!38448))))

(declare-fun b!1037165 () Bool)

(assert (=> b!1037165 (= e!586653 tp_is_empty!24613)))

(declare-fun res!692065 () Bool)

(assert (=> start!90714 (=> (not res!692065) (not e!586655))))

(declare-fun valid!2177 (LongMapFixedSize!5800) Bool)

(assert (=> start!90714 (= res!692065 (valid!2177 thiss!1427))))

(assert (=> start!90714 e!586655))

(assert (=> start!90714 e!586654))

(assert (=> start!90714 true))

(declare-fun b!1037166 () Bool)

(assert (=> b!1037166 (= e!586652 tp_is_empty!24613)))

(declare-fun b!1037167 () Bool)

(assert (=> b!1037167 (= e!586655 e!586651)))

(declare-fun res!692064 () Bool)

(assert (=> b!1037167 (=> (not res!692064) (not e!586651))))

(get-info :version)

(assert (=> b!1037167 (= res!692064 ((_ is Found!9744) lt!457257))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65269 (_ BitVec 32)) SeekEntryResult!9744)

(assert (=> b!1037167 (= lt!457257 (seekEntry!0 key!909 (_keys!11474 thiss!1427) (mask!30194 thiss!1427)))))

(assert (= (and start!90714 res!692065) b!1037164))

(assert (= (and b!1037164 res!692066) b!1037167))

(assert (= (and b!1037167 res!692064) b!1037162))

(assert (= (and b!1037161 condMapEmpty!38448) mapIsEmpty!38448))

(assert (= (and b!1037161 (not condMapEmpty!38448)) mapNonEmpty!38448))

(assert (= (and mapNonEmpty!38448 ((_ is ValueCellFull!11603) mapValue!38448)) b!1037165))

(assert (= (and b!1037161 ((_ is ValueCellFull!11603) mapDefault!38448)) b!1037166))

(assert (= b!1037163 b!1037161))

(assert (= start!90714 b!1037163))

(declare-fun m!956927 () Bool)

(assert (=> mapNonEmpty!38448 m!956927))

(declare-fun m!956929 () Bool)

(assert (=> b!1037162 m!956929))

(declare-fun m!956931 () Bool)

(assert (=> b!1037162 m!956931))

(declare-fun m!956933 () Bool)

(assert (=> b!1037162 m!956933))

(declare-fun m!956935 () Bool)

(assert (=> b!1037162 m!956935))

(declare-fun m!956937 () Bool)

(assert (=> b!1037167 m!956937))

(declare-fun m!956939 () Bool)

(assert (=> b!1037163 m!956939))

(declare-fun m!956941 () Bool)

(assert (=> b!1037163 m!956941))

(declare-fun m!956943 () Bool)

(assert (=> start!90714 m!956943))

(check-sat (not mapNonEmpty!38448) (not b!1037162) (not b_next!20893) (not b!1037163) b_and!33399 (not b!1037167) (not start!90714) tp_is_empty!24613)
(check-sat b_and!33399 (not b_next!20893))
