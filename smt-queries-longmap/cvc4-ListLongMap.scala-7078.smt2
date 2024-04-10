; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89526 () Bool)

(assert start!89526)

(declare-fun b!1026829 () Bool)

(declare-fun b_free!20525 () Bool)

(declare-fun b_next!20525 () Bool)

(assert (=> b!1026829 (= b_free!20525 (not b_next!20525))))

(declare-fun tp!72621 () Bool)

(declare-fun b_and!32771 () Bool)

(assert (=> b!1026829 (= tp!72621 b_and!32771)))

(declare-fun b!1026821 () Bool)

(declare-fun res!687338 () Bool)

(declare-fun e!579357 () Bool)

(assert (=> b!1026821 (=> res!687338 e!579357)))

(declare-datatypes ((V!37199 0))(
  ( (V!37200 (val!12173 Int)) )
))
(declare-datatypes ((ValueCell!11419 0))(
  ( (ValueCellFull!11419 (v!14742 V!37199)) (EmptyCell!11419) )
))
(declare-datatypes ((array!64540 0))(
  ( (array!64541 (arr!31079 (Array (_ BitVec 32) (_ BitVec 64))) (size!31592 (_ BitVec 32))) )
))
(declare-datatypes ((array!64542 0))(
  ( (array!64543 (arr!31080 (Array (_ BitVec 32) ValueCell!11419)) (size!31593 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5432 0))(
  ( (LongMapFixedSize!5433 (defaultEntry!6068 Int) (mask!29770 (_ BitVec 32)) (extraKeys!5800 (_ BitVec 32)) (zeroValue!5904 V!37199) (minValue!5904 V!37199) (_size!2771 (_ BitVec 32)) (_keys!11215 array!64540) (_values!6091 array!64542) (_vacant!2771 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5432)

(assert (=> b!1026821 (= res!687338 (or (not (= (size!31593 (_values!6091 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29770 thiss!1427)))) (not (= (size!31592 (_keys!11215 thiss!1427)) (size!31593 (_values!6091 thiss!1427)))) (bvslt (mask!29770 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5800 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5800 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026822 () Bool)

(declare-fun e!579356 () Bool)

(declare-fun e!579358 () Bool)

(assert (=> b!1026822 (= e!579356 e!579358)))

(declare-fun res!687334 () Bool)

(assert (=> b!1026822 (=> (not res!687334) (not e!579358))))

(declare-datatypes ((SeekEntryResult!9657 0))(
  ( (MissingZero!9657 (index!40999 (_ BitVec 32))) (Found!9657 (index!41000 (_ BitVec 32))) (Intermediate!9657 (undefined!10469 Bool) (index!41001 (_ BitVec 32)) (x!91351 (_ BitVec 32))) (Undefined!9657) (MissingVacant!9657 (index!41002 (_ BitVec 32))) )
))
(declare-fun lt!451828 () SeekEntryResult!9657)

(assert (=> b!1026822 (= res!687334 (is-Found!9657 lt!451828))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64540 (_ BitVec 32)) SeekEntryResult!9657)

(assert (=> b!1026822 (= lt!451828 (seekEntry!0 key!909 (_keys!11215 thiss!1427) (mask!29770 thiss!1427)))))

(declare-fun b!1026823 () Bool)

(assert (=> b!1026823 (= e!579358 (not e!579357))))

(declare-fun res!687335 () Bool)

(assert (=> b!1026823 (=> res!687335 e!579357)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026823 (= res!687335 (not (validMask!0 (mask!29770 thiss!1427))))))

(declare-fun lt!451824 () array!64540)

(declare-fun arrayContainsKey!0 (array!64540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026823 (not (arrayContainsKey!0 lt!451824 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33457 0))(
  ( (Unit!33458) )
))
(declare-fun lt!451827 () Unit!33457)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64540 (_ BitVec 32) (_ BitVec 64)) Unit!33457)

(assert (=> b!1026823 (= lt!451827 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11215 thiss!1427) (index!41000 lt!451828) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64540 (_ BitVec 32)) Bool)

(assert (=> b!1026823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451824 (mask!29770 thiss!1427))))

(declare-fun lt!451825 () Unit!33457)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64540 (_ BitVec 32) (_ BitVec 32)) Unit!33457)

(assert (=> b!1026823 (= lt!451825 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11215 thiss!1427) (index!41000 lt!451828) (mask!29770 thiss!1427)))))

(declare-datatypes ((List!21791 0))(
  ( (Nil!21788) (Cons!21787 (h!22985 (_ BitVec 64)) (t!30853 List!21791)) )
))
(declare-fun arrayNoDuplicates!0 (array!64540 (_ BitVec 32) List!21791) Bool)

(assert (=> b!1026823 (arrayNoDuplicates!0 lt!451824 #b00000000000000000000000000000000 Nil!21788)))

(declare-fun lt!451826 () Unit!33457)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64540 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21791) Unit!33457)

(assert (=> b!1026823 (= lt!451826 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11215 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41000 lt!451828) #b00000000000000000000000000000000 Nil!21788))))

(declare-fun arrayCountValidKeys!0 (array!64540 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026823 (= (arrayCountValidKeys!0 lt!451824 #b00000000000000000000000000000000 (size!31592 (_keys!11215 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11215 thiss!1427) #b00000000000000000000000000000000 (size!31592 (_keys!11215 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026823 (= lt!451824 (array!64541 (store (arr!31079 (_keys!11215 thiss!1427)) (index!41000 lt!451828) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31592 (_keys!11215 thiss!1427))))))

(declare-fun lt!451829 () Unit!33457)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64540 (_ BitVec 32) (_ BitVec 64)) Unit!33457)

(assert (=> b!1026823 (= lt!451829 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11215 thiss!1427) (index!41000 lt!451828) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026825 () Bool)

(declare-fun e!579353 () Bool)

(declare-fun tp_is_empty!24245 () Bool)

(assert (=> b!1026825 (= e!579353 tp_is_empty!24245)))

(declare-fun mapNonEmpty!37796 () Bool)

(declare-fun mapRes!37796 () Bool)

(declare-fun tp!72620 () Bool)

(assert (=> mapNonEmpty!37796 (= mapRes!37796 (and tp!72620 e!579353))))

(declare-fun mapRest!37796 () (Array (_ BitVec 32) ValueCell!11419))

(declare-fun mapValue!37796 () ValueCell!11419)

(declare-fun mapKey!37796 () (_ BitVec 32))

(assert (=> mapNonEmpty!37796 (= (arr!31080 (_values!6091 thiss!1427)) (store mapRest!37796 mapKey!37796 mapValue!37796))))

(declare-fun b!1026826 () Bool)

(declare-fun e!579354 () Bool)

(assert (=> b!1026826 (= e!579354 tp_is_empty!24245)))

(declare-fun b!1026827 () Bool)

(declare-fun res!687337 () Bool)

(assert (=> b!1026827 (=> res!687337 e!579357)))

(assert (=> b!1026827 (= res!687337 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11215 thiss!1427) (mask!29770 thiss!1427))))))

(declare-fun mapIsEmpty!37796 () Bool)

(assert (=> mapIsEmpty!37796 mapRes!37796))

(declare-fun b!1026828 () Bool)

(declare-fun e!579355 () Bool)

(assert (=> b!1026828 (= e!579355 (and e!579354 mapRes!37796))))

(declare-fun condMapEmpty!37796 () Bool)

(declare-fun mapDefault!37796 () ValueCell!11419)

