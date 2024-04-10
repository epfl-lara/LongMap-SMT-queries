; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91660 () Bool)

(assert start!91660)

(declare-fun b!1043482 () Bool)

(declare-fun b_free!21097 () Bool)

(declare-fun b_next!21097 () Bool)

(assert (=> b!1043482 (= b_free!21097 (not b_next!21097))))

(declare-fun tp!74528 () Bool)

(declare-fun b_and!33629 () Bool)

(assert (=> b!1043482 (= tp!74528 b_and!33629)))

(declare-fun mapIsEmpty!38846 () Bool)

(declare-fun mapRes!38846 () Bool)

(assert (=> mapIsEmpty!38846 mapRes!38846))

(declare-fun b!1043477 () Bool)

(declare-fun e!591232 () Bool)

(declare-fun e!591230 () Bool)

(assert (=> b!1043477 (= e!591232 e!591230)))

(declare-fun res!695186 () Bool)

(assert (=> b!1043477 (=> (not res!695186) (not e!591230))))

(declare-datatypes ((SeekEntryResult!9831 0))(
  ( (MissingZero!9831 (index!41695 (_ BitVec 32))) (Found!9831 (index!41696 (_ BitVec 32))) (Intermediate!9831 (undefined!10643 Bool) (index!41697 (_ BitVec 32)) (x!93165 (_ BitVec 32))) (Undefined!9831) (MissingVacant!9831 (index!41698 (_ BitVec 32))) )
))
(declare-fun lt!459974 () SeekEntryResult!9831)

(assert (=> b!1043477 (= res!695186 (is-Found!9831 lt!459974))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37963 0))(
  ( (V!37964 (val!12459 Int)) )
))
(declare-datatypes ((ValueCell!11705 0))(
  ( (ValueCellFull!11705 (v!15050 V!37963)) (EmptyCell!11705) )
))
(declare-datatypes ((array!65796 0))(
  ( (array!65797 (arr!31651 (Array (_ BitVec 32) (_ BitVec 64))) (size!32186 (_ BitVec 32))) )
))
(declare-datatypes ((array!65798 0))(
  ( (array!65799 (arr!31652 (Array (_ BitVec 32) ValueCell!11705)) (size!32187 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6004 0))(
  ( (LongMapFixedSize!6005 (defaultEntry!6384 Int) (mask!30475 (_ BitVec 32)) (extraKeys!6112 (_ BitVec 32)) (zeroValue!6218 V!37963) (minValue!6218 V!37963) (_size!3057 (_ BitVec 32)) (_keys!11642 array!65796) (_values!6407 array!65798) (_vacant!3057 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6004)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65796 (_ BitVec 32)) SeekEntryResult!9831)

(assert (=> b!1043477 (= lt!459974 (seekEntry!0 key!909 (_keys!11642 thiss!1427) (mask!30475 thiss!1427)))))

(declare-fun mapNonEmpty!38846 () Bool)

(declare-fun tp!74529 () Bool)

(declare-fun e!591229 () Bool)

(assert (=> mapNonEmpty!38846 (= mapRes!38846 (and tp!74529 e!591229))))

(declare-fun mapValue!38846 () ValueCell!11705)

(declare-fun mapRest!38846 () (Array (_ BitVec 32) ValueCell!11705))

(declare-fun mapKey!38846 () (_ BitVec 32))

(assert (=> mapNonEmpty!38846 (= (arr!31652 (_values!6407 thiss!1427)) (store mapRest!38846 mapKey!38846 mapValue!38846))))

(declare-fun b!1043478 () Bool)

(assert (=> b!1043478 (= e!591230 (not (and (bvsge (index!41696 lt!459974) #b00000000000000000000000000000000) (bvslt (index!41696 lt!459974) (size!32186 (_keys!11642 thiss!1427))))))))

(declare-fun lt!459970 () array!65796)

(declare-datatypes ((tuple2!15734 0))(
  ( (tuple2!15735 (_1!7878 (_ BitVec 64)) (_2!7878 V!37963)) )
))
(declare-datatypes ((List!21988 0))(
  ( (Nil!21985) (Cons!21984 (h!23192 tuple2!15734) (t!31204 List!21988)) )
))
(declare-datatypes ((ListLongMap!13763 0))(
  ( (ListLongMap!13764 (toList!6897 List!21988)) )
))
(declare-fun -!524 (ListLongMap!13763 (_ BitVec 64)) ListLongMap!13763)

(declare-fun getCurrentListMap!3945 (array!65796 array!65798 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) Int) ListLongMap!13763)

(declare-fun dynLambda!1994 (Int (_ BitVec 64)) V!37963)

(assert (=> b!1043478 (= (-!524 (getCurrentListMap!3945 (_keys!11642 thiss!1427) (_values!6407 thiss!1427) (mask!30475 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)) key!909) (getCurrentListMap!3945 lt!459970 (array!65799 (store (arr!31652 (_values!6407 thiss!1427)) (index!41696 lt!459974) (ValueCellFull!11705 (dynLambda!1994 (defaultEntry!6384 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32187 (_values!6407 thiss!1427))) (mask!30475 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6384 thiss!1427)))))

(declare-datatypes ((Unit!34069 0))(
  ( (Unit!34070) )
))
(declare-fun lt!459971 () Unit!34069)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (array!65796 array!65798 (_ BitVec 32) (_ BitVec 32) V!37963 V!37963 (_ BitVec 32) (_ BitVec 64) Int) Unit!34069)

(assert (=> b!1043478 (= lt!459971 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!45 (_keys!11642 thiss!1427) (_values!6407 thiss!1427) (mask!30475 thiss!1427) (extraKeys!6112 thiss!1427) (zeroValue!6218 thiss!1427) (minValue!6218 thiss!1427) (index!41696 lt!459974) key!909 (defaultEntry!6384 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043478 (not (arrayContainsKey!0 lt!459970 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!459972 () Unit!34069)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65796 (_ BitVec 32) (_ BitVec 64)) Unit!34069)

(assert (=> b!1043478 (= lt!459972 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11642 thiss!1427) (index!41696 lt!459974) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65796 (_ BitVec 32)) Bool)

(assert (=> b!1043478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459970 (mask!30475 thiss!1427))))

(declare-fun lt!459976 () Unit!34069)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65796 (_ BitVec 32) (_ BitVec 32)) Unit!34069)

(assert (=> b!1043478 (= lt!459976 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11642 thiss!1427) (index!41696 lt!459974) (mask!30475 thiss!1427)))))

(declare-datatypes ((List!21989 0))(
  ( (Nil!21986) (Cons!21985 (h!23193 (_ BitVec 64)) (t!31205 List!21989)) )
))
(declare-fun arrayNoDuplicates!0 (array!65796 (_ BitVec 32) List!21989) Bool)

(assert (=> b!1043478 (arrayNoDuplicates!0 lt!459970 #b00000000000000000000000000000000 Nil!21986)))

(declare-fun lt!459973 () Unit!34069)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65796 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21989) Unit!34069)

(assert (=> b!1043478 (= lt!459973 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11642 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41696 lt!459974) #b00000000000000000000000000000000 Nil!21986))))

(declare-fun arrayCountValidKeys!0 (array!65796 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043478 (= (arrayCountValidKeys!0 lt!459970 #b00000000000000000000000000000000 (size!32186 (_keys!11642 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11642 thiss!1427) #b00000000000000000000000000000000 (size!32186 (_keys!11642 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043478 (= lt!459970 (array!65797 (store (arr!31651 (_keys!11642 thiss!1427)) (index!41696 lt!459974) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32186 (_keys!11642 thiss!1427))))))

(declare-fun lt!459975 () Unit!34069)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65796 (_ BitVec 32) (_ BitVec 64)) Unit!34069)

(assert (=> b!1043478 (= lt!459975 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11642 thiss!1427) (index!41696 lt!459974) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!695187 () Bool)

(assert (=> start!91660 (=> (not res!695187) (not e!591232))))

(declare-fun valid!2253 (LongMapFixedSize!6004) Bool)

(assert (=> start!91660 (= res!695187 (valid!2253 thiss!1427))))

(assert (=> start!91660 e!591232))

(declare-fun e!591233 () Bool)

(assert (=> start!91660 e!591233))

(assert (=> start!91660 true))

(declare-fun b!1043479 () Bool)

(declare-fun e!591234 () Bool)

(declare-fun e!591231 () Bool)

(assert (=> b!1043479 (= e!591234 (and e!591231 mapRes!38846))))

(declare-fun condMapEmpty!38846 () Bool)

(declare-fun mapDefault!38846 () ValueCell!11705)

