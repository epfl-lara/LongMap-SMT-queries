; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89806 () Bool)

(assert start!89806)

(declare-fun b!1029132 () Bool)

(declare-fun b_free!20593 () Bool)

(declare-fun b_next!20593 () Bool)

(assert (=> b!1029132 (= b_free!20593 (not b_next!20593))))

(declare-fun tp!72839 () Bool)

(declare-fun b_and!32911 () Bool)

(assert (=> b!1029132 (= tp!72839 b_and!32911)))

(declare-fun mapNonEmpty!37912 () Bool)

(declare-fun mapRes!37912 () Bool)

(declare-fun tp!72838 () Bool)

(declare-fun e!581001 () Bool)

(assert (=> mapNonEmpty!37912 (= mapRes!37912 (and tp!72838 e!581001))))

(declare-datatypes ((V!37291 0))(
  ( (V!37292 (val!12207 Int)) )
))
(declare-datatypes ((ValueCell!11453 0))(
  ( (ValueCellFull!11453 (v!14780 V!37291)) (EmptyCell!11453) )
))
(declare-fun mapValue!37912 () ValueCell!11453)

(declare-fun mapRest!37912 () (Array (_ BitVec 32) ValueCell!11453))

(declare-fun mapKey!37912 () (_ BitVec 32))

(declare-datatypes ((array!64684 0))(
  ( (array!64685 (arr!31147 (Array (_ BitVec 32) (_ BitVec 64))) (size!31662 (_ BitVec 32))) )
))
(declare-datatypes ((array!64686 0))(
  ( (array!64687 (arr!31148 (Array (_ BitVec 32) ValueCell!11453)) (size!31663 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5500 0))(
  ( (LongMapFixedSize!5501 (defaultEntry!6114 Int) (mask!29866 (_ BitVec 32)) (extraKeys!5846 (_ BitVec 32)) (zeroValue!5950 V!37291) (minValue!5950 V!37291) (_size!2805 (_ BitVec 32)) (_keys!11275 array!64684) (_values!6137 array!64686) (_vacant!2805 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5500)

(assert (=> mapNonEmpty!37912 (= (arr!31148 (_values!6137 thiss!1427)) (store mapRest!37912 mapKey!37912 mapValue!37912))))

(declare-fun b!1029130 () Bool)

(declare-fun e!581007 () Bool)

(declare-fun e!581006 () Bool)

(assert (=> b!1029130 (= e!581007 (not e!581006))))

(declare-fun res!688470 () Bool)

(assert (=> b!1029130 (=> res!688470 e!581006)))

(declare-datatypes ((Unit!33601 0))(
  ( (Unit!33602) )
))
(declare-datatypes ((tuple2!15554 0))(
  ( (tuple2!15555 (_1!7788 Unit!33601) (_2!7788 LongMapFixedSize!5500)) )
))
(declare-fun lt!453556 () tuple2!15554)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1029130 (= res!688470 (not (validMask!0 (mask!29866 (_2!7788 lt!453556)))))))

(declare-fun lt!453549 () array!64686)

(declare-fun lt!453557 () array!64684)

(declare-fun Unit!33603 () Unit!33601)

(declare-fun Unit!33604 () Unit!33601)

(assert (=> b!1029130 (= lt!453556 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2805 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15555 Unit!33603 (LongMapFixedSize!5501 (defaultEntry!6114 thiss!1427) (mask!29866 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvsub (_size!2805 thiss!1427) #b00000000000000000000000000000001) lt!453557 lt!453549 (bvadd #b00000000000000000000000000000001 (_vacant!2805 thiss!1427)))) (tuple2!15555 Unit!33604 (LongMapFixedSize!5501 (defaultEntry!6114 thiss!1427) (mask!29866 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (bvsub (_size!2805 thiss!1427) #b00000000000000000000000000000001) lt!453557 lt!453549 (_vacant!2805 thiss!1427)))))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15556 0))(
  ( (tuple2!15557 (_1!7789 (_ BitVec 64)) (_2!7789 V!37291)) )
))
(declare-datatypes ((List!21821 0))(
  ( (Nil!21818) (Cons!21817 (h!23017 tuple2!15556) (t!30909 List!21821)) )
))
(declare-datatypes ((ListLongMap!13681 0))(
  ( (ListLongMap!13682 (toList!6856 List!21821)) )
))
(declare-fun -!483 (ListLongMap!13681 (_ BitVec 64)) ListLongMap!13681)

(declare-fun getCurrentListMap!3904 (array!64684 array!64686 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) Int) ListLongMap!13681)

(assert (=> b!1029130 (= (-!483 (getCurrentListMap!3904 (_keys!11275 thiss!1427) (_values!6137 thiss!1427) (mask!29866 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)) key!909) (getCurrentListMap!3904 lt!453557 lt!453549 (mask!29866 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6114 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9682 0))(
  ( (MissingZero!9682 (index!41099 (_ BitVec 32))) (Found!9682 (index!41100 (_ BitVec 32))) (Intermediate!9682 (undefined!10494 Bool) (index!41101 (_ BitVec 32)) (x!91586 (_ BitVec 32))) (Undefined!9682) (MissingVacant!9682 (index!41102 (_ BitVec 32))) )
))
(declare-fun lt!453551 () SeekEntryResult!9682)

(declare-fun dynLambda!1953 (Int (_ BitVec 64)) V!37291)

(assert (=> b!1029130 (= lt!453549 (array!64687 (store (arr!31148 (_values!6137 thiss!1427)) (index!41100 lt!453551) (ValueCellFull!11453 (dynLambda!1953 (defaultEntry!6114 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31663 (_values!6137 thiss!1427))))))

(declare-fun lt!453553 () Unit!33601)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (array!64684 array!64686 (_ BitVec 32) (_ BitVec 32) V!37291 V!37291 (_ BitVec 32) (_ BitVec 64) Int) Unit!33601)

(assert (=> b!1029130 (= lt!453553 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (_keys!11275 thiss!1427) (_values!6137 thiss!1427) (mask!29866 thiss!1427) (extraKeys!5846 thiss!1427) (zeroValue!5950 thiss!1427) (minValue!5950 thiss!1427) (index!41100 lt!453551) key!909 (defaultEntry!6114 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1029130 (not (arrayContainsKey!0 lt!453557 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453550 () Unit!33601)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64684 (_ BitVec 32) (_ BitVec 64)) Unit!33601)

(assert (=> b!1029130 (= lt!453550 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11275 thiss!1427) (index!41100 lt!453551) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64684 (_ BitVec 32)) Bool)

(assert (=> b!1029130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453557 (mask!29866 thiss!1427))))

(declare-fun lt!453555 () Unit!33601)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64684 (_ BitVec 32) (_ BitVec 32)) Unit!33601)

(assert (=> b!1029130 (= lt!453555 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11275 thiss!1427) (index!41100 lt!453551) (mask!29866 thiss!1427)))))

(declare-datatypes ((List!21822 0))(
  ( (Nil!21819) (Cons!21818 (h!23018 (_ BitVec 64)) (t!30910 List!21822)) )
))
(declare-fun arrayNoDuplicates!0 (array!64684 (_ BitVec 32) List!21822) Bool)

(assert (=> b!1029130 (arrayNoDuplicates!0 lt!453557 #b00000000000000000000000000000000 Nil!21819)))

(declare-fun lt!453552 () Unit!33601)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21822) Unit!33601)

(assert (=> b!1029130 (= lt!453552 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11275 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41100 lt!453551) #b00000000000000000000000000000000 Nil!21819))))

(declare-fun arrayCountValidKeys!0 (array!64684 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1029130 (= (arrayCountValidKeys!0 lt!453557 #b00000000000000000000000000000000 (size!31662 (_keys!11275 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11275 thiss!1427) #b00000000000000000000000000000000 (size!31662 (_keys!11275 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1029130 (= lt!453557 (array!64685 (store (arr!31147 (_keys!11275 thiss!1427)) (index!41100 lt!453551) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31662 (_keys!11275 thiss!1427))))))

(declare-fun lt!453554 () Unit!33601)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64684 (_ BitVec 32) (_ BitVec 64)) Unit!33601)

(assert (=> b!1029130 (= lt!453554 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11275 thiss!1427) (index!41100 lt!453551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1029131 () Bool)

(declare-fun e!581005 () Bool)

(assert (=> b!1029131 (= e!581005 e!581007)))

(declare-fun res!688469 () Bool)

(assert (=> b!1029131 (=> (not res!688469) (not e!581007))))

(assert (=> b!1029131 (= res!688469 (is-Found!9682 lt!453551))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64684 (_ BitVec 32)) SeekEntryResult!9682)

(assert (=> b!1029131 (= lt!453551 (seekEntry!0 key!909 (_keys!11275 thiss!1427) (mask!29866 thiss!1427)))))

(declare-fun e!581004 () Bool)

(declare-fun e!581000 () Bool)

(declare-fun tp_is_empty!24313 () Bool)

(declare-fun array_inv!24111 (array!64684) Bool)

(declare-fun array_inv!24112 (array!64686) Bool)

(assert (=> b!1029132 (= e!581000 (and tp!72839 tp_is_empty!24313 (array_inv!24111 (_keys!11275 thiss!1427)) (array_inv!24112 (_values!6137 thiss!1427)) e!581004))))

(declare-fun b!1029133 () Bool)

(declare-fun res!688468 () Bool)

(assert (=> b!1029133 (=> (not res!688468) (not e!581005))))

(assert (=> b!1029133 (= res!688468 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1029134 () Bool)

(assert (=> b!1029134 (= e!581006 (or (not (= (size!31663 (_values!6137 (_2!7788 lt!453556))) (bvadd #b00000000000000000000000000000001 (mask!29866 (_2!7788 lt!453556))))) (not (= (size!31662 (_keys!11275 (_2!7788 lt!453556))) (size!31663 (_values!6137 (_2!7788 lt!453556))))) (bvslt (mask!29866 (_2!7788 lt!453556)) #b00000000000000000000000000000000) (bvsge (extraKeys!5846 (_2!7788 lt!453556)) #b00000000000000000000000000000000)))))

(declare-fun b!1029135 () Bool)

(declare-fun e!581002 () Bool)

(assert (=> b!1029135 (= e!581002 tp_is_empty!24313)))

(declare-fun res!688471 () Bool)

(assert (=> start!89806 (=> (not res!688471) (not e!581005))))

(declare-fun valid!2082 (LongMapFixedSize!5500) Bool)

(assert (=> start!89806 (= res!688471 (valid!2082 thiss!1427))))

(assert (=> start!89806 e!581005))

(assert (=> start!89806 e!581000))

(assert (=> start!89806 true))

(declare-fun b!1029136 () Bool)

(assert (=> b!1029136 (= e!581004 (and e!581002 mapRes!37912))))

(declare-fun condMapEmpty!37912 () Bool)

(declare-fun mapDefault!37912 () ValueCell!11453)

