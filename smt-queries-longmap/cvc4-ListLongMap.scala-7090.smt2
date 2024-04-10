; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89810 () Bool)

(assert start!89810)

(declare-fun b!1029189 () Bool)

(declare-fun b_free!20597 () Bool)

(declare-fun b_next!20597 () Bool)

(assert (=> b!1029189 (= b_free!20597 (not b_next!20597))))

(declare-fun tp!72851 () Bool)

(declare-fun b_and!32919 () Bool)

(assert (=> b!1029189 (= tp!72851 b_and!32919)))

(declare-fun b!1029182 () Bool)

(declare-fun e!581053 () Bool)

(declare-fun e!581052 () Bool)

(assert (=> b!1029182 (= e!581053 (not e!581052))))

(declare-fun res!688494 () Bool)

(assert (=> b!1029182 (=> res!688494 e!581052)))

(declare-datatypes ((V!37295 0))(
  ( (V!37296 (val!12209 Int)) )
))
(declare-datatypes ((ValueCell!11455 0))(
  ( (ValueCellFull!11455 (v!14782 V!37295)) (EmptyCell!11455) )
))
(declare-datatypes ((Unit!33609 0))(
  ( (Unit!33610) )
))
(declare-datatypes ((array!64692 0))(
  ( (array!64693 (arr!31151 (Array (_ BitVec 32) (_ BitVec 64))) (size!31666 (_ BitVec 32))) )
))
(declare-datatypes ((array!64694 0))(
  ( (array!64695 (arr!31152 (Array (_ BitVec 32) ValueCell!11455)) (size!31667 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5504 0))(
  ( (LongMapFixedSize!5505 (defaultEntry!6116 Int) (mask!29868 (_ BitVec 32)) (extraKeys!5848 (_ BitVec 32)) (zeroValue!5952 V!37295) (minValue!5952 V!37295) (_size!2807 (_ BitVec 32)) (_keys!11277 array!64692) (_values!6139 array!64694) (_vacant!2807 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15562 0))(
  ( (tuple2!15563 (_1!7792 Unit!33609) (_2!7792 LongMapFixedSize!5504)) )
))
(declare-fun lt!453609 () tuple2!15562)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029182 (= res!688494 (not (validMask!0 (mask!29868 (_2!7792 lt!453609)))))))

(declare-fun lt!453608 () array!64692)

(declare-fun thiss!1427 () LongMapFixedSize!5504)

(declare-fun lt!453604 () array!64694)

(declare-fun Unit!33611 () Unit!33609)

(declare-fun Unit!33612 () Unit!33609)

(assert (=> b!1029182 (= lt!453609 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2807 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15563 Unit!33611 (LongMapFixedSize!5505 (defaultEntry!6116 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5848 thiss!1427) (zeroValue!5952 thiss!1427) (minValue!5952 thiss!1427) (bvsub (_size!2807 thiss!1427) #b00000000000000000000000000000001) lt!453608 lt!453604 (bvadd #b00000000000000000000000000000001 (_vacant!2807 thiss!1427)))) (tuple2!15563 Unit!33612 (LongMapFixedSize!5505 (defaultEntry!6116 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5848 thiss!1427) (zeroValue!5952 thiss!1427) (minValue!5952 thiss!1427) (bvsub (_size!2807 thiss!1427) #b00000000000000000000000000000001) lt!453608 lt!453604 (_vacant!2807 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15564 0))(
  ( (tuple2!15565 (_1!7793 (_ BitVec 64)) (_2!7793 V!37295)) )
))
(declare-datatypes ((List!21825 0))(
  ( (Nil!21822) (Cons!21821 (h!23021 tuple2!15564) (t!30917 List!21825)) )
))
(declare-datatypes ((ListLongMap!13685 0))(
  ( (ListLongMap!13686 (toList!6858 List!21825)) )
))
(declare-fun -!485 (ListLongMap!13685 (_ BitVec 64)) ListLongMap!13685)

(declare-fun getCurrentListMap!3906 (array!64692 array!64694 (_ BitVec 32) (_ BitVec 32) V!37295 V!37295 (_ BitVec 32) Int) ListLongMap!13685)

(assert (=> b!1029182 (= (-!485 (getCurrentListMap!3906 (_keys!11277 thiss!1427) (_values!6139 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5848 thiss!1427) (zeroValue!5952 thiss!1427) (minValue!5952 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6116 thiss!1427)) key!909) (getCurrentListMap!3906 lt!453608 lt!453604 (mask!29868 thiss!1427) (extraKeys!5848 thiss!1427) (zeroValue!5952 thiss!1427) (minValue!5952 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6116 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9684 0))(
  ( (MissingZero!9684 (index!41107 (_ BitVec 32))) (Found!9684 (index!41108 (_ BitVec 32))) (Intermediate!9684 (undefined!10496 Bool) (index!41109 (_ BitVec 32)) (x!91592 (_ BitVec 32))) (Undefined!9684) (MissingVacant!9684 (index!41110 (_ BitVec 32))) )
))
(declare-fun lt!453605 () SeekEntryResult!9684)

(declare-fun dynLambda!1955 (Int (_ BitVec 64)) V!37295)

(assert (=> b!1029182 (= lt!453604 (array!64695 (store (arr!31152 (_values!6139 thiss!1427)) (index!41108 lt!453605) (ValueCellFull!11455 (dynLambda!1955 (defaultEntry!6116 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31667 (_values!6139 thiss!1427))))))

(declare-fun lt!453606 () Unit!33609)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!11 (array!64692 array!64694 (_ BitVec 32) (_ BitVec 32) V!37295 V!37295 (_ BitVec 32) (_ BitVec 64) Int) Unit!33609)

(assert (=> b!1029182 (= lt!453606 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!11 (_keys!11277 thiss!1427) (_values!6139 thiss!1427) (mask!29868 thiss!1427) (extraKeys!5848 thiss!1427) (zeroValue!5952 thiss!1427) (minValue!5952 thiss!1427) (index!41108 lt!453605) key!909 (defaultEntry!6116 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029182 (not (arrayContainsKey!0 lt!453608 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453607 () Unit!33609)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64692 (_ BitVec 32) (_ BitVec 64)) Unit!33609)

(assert (=> b!1029182 (= lt!453607 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11277 thiss!1427) (index!41108 lt!453605) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64692 (_ BitVec 32)) Bool)

(assert (=> b!1029182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453608 (mask!29868 thiss!1427))))

(declare-fun lt!453611 () Unit!33609)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64692 (_ BitVec 32) (_ BitVec 32)) Unit!33609)

(assert (=> b!1029182 (= lt!453611 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11277 thiss!1427) (index!41108 lt!453605) (mask!29868 thiss!1427)))))

(declare-datatypes ((List!21826 0))(
  ( (Nil!21823) (Cons!21822 (h!23022 (_ BitVec 64)) (t!30918 List!21826)) )
))
(declare-fun arrayNoDuplicates!0 (array!64692 (_ BitVec 32) List!21826) Bool)

(assert (=> b!1029182 (arrayNoDuplicates!0 lt!453608 #b00000000000000000000000000000000 Nil!21823)))

(declare-fun lt!453610 () Unit!33609)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21826) Unit!33609)

(assert (=> b!1029182 (= lt!453610 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11277 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41108 lt!453605) #b00000000000000000000000000000000 Nil!21823))))

(declare-fun arrayCountValidKeys!0 (array!64692 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029182 (= (arrayCountValidKeys!0 lt!453608 #b00000000000000000000000000000000 (size!31666 (_keys!11277 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11277 thiss!1427) #b00000000000000000000000000000000 (size!31666 (_keys!11277 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029182 (= lt!453608 (array!64693 (store (arr!31151 (_keys!11277 thiss!1427)) (index!41108 lt!453605) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31666 (_keys!11277 thiss!1427))))))

(declare-fun lt!453603 () Unit!33609)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64692 (_ BitVec 32) (_ BitVec 64)) Unit!33609)

(assert (=> b!1029182 (= lt!453603 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11277 thiss!1427) (index!41108 lt!453605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029183 () Bool)

(assert (=> b!1029183 (= e!581052 (or (not (= (size!31667 (_values!6139 (_2!7792 lt!453609))) (bvadd #b00000000000000000000000000000001 (mask!29868 (_2!7792 lt!453609))))) (not (= (size!31666 (_keys!11277 (_2!7792 lt!453609))) (size!31667 (_values!6139 (_2!7792 lt!453609))))) (bvslt (mask!29868 (_2!7792 lt!453609)) #b00000000000000000000000000000000) (bvsge (extraKeys!5848 (_2!7792 lt!453609)) #b00000000000000000000000000000000)))))

(declare-fun b!1029184 () Bool)

(declare-fun e!581048 () Bool)

(declare-fun tp_is_empty!24317 () Bool)

(assert (=> b!1029184 (= e!581048 tp_is_empty!24317)))

(declare-fun b!1029185 () Bool)

(declare-fun e!581051 () Bool)

(assert (=> b!1029185 (= e!581051 tp_is_empty!24317)))

(declare-fun res!688493 () Bool)

(declare-fun e!581050 () Bool)

(assert (=> start!89810 (=> (not res!688493) (not e!581050))))

(declare-fun valid!2084 (LongMapFixedSize!5504) Bool)

(assert (=> start!89810 (= res!688493 (valid!2084 thiss!1427))))

(assert (=> start!89810 e!581050))

(declare-fun e!581049 () Bool)

(assert (=> start!89810 e!581049))

(assert (=> start!89810 true))

(declare-fun b!1029186 () Bool)

(declare-fun res!688492 () Bool)

(assert (=> b!1029186 (=> (not res!688492) (not e!581050))))

(assert (=> b!1029186 (= res!688492 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1029187 () Bool)

(assert (=> b!1029187 (= e!581050 e!581053)))

(declare-fun res!688495 () Bool)

(assert (=> b!1029187 (=> (not res!688495) (not e!581053))))

(assert (=> b!1029187 (= res!688495 (is-Found!9684 lt!453605))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64692 (_ BitVec 32)) SeekEntryResult!9684)

(assert (=> b!1029187 (= lt!453605 (seekEntry!0 key!909 (_keys!11277 thiss!1427) (mask!29868 thiss!1427)))))

(declare-fun b!1029188 () Bool)

(declare-fun e!581054 () Bool)

(declare-fun mapRes!37918 () Bool)

(assert (=> b!1029188 (= e!581054 (and e!581048 mapRes!37918))))

(declare-fun condMapEmpty!37918 () Bool)

(declare-fun mapDefault!37918 () ValueCell!11455)

