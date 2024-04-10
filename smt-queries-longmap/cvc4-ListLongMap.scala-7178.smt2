; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91816 () Bool)

(assert start!91816)

(declare-fun b!1044670 () Bool)

(declare-fun b_free!21125 () Bool)

(declare-fun b_next!21125 () Bool)

(assert (=> b!1044670 (= b_free!21125 (not b_next!21125))))

(declare-fun tp!74624 () Bool)

(declare-fun b_and!33713 () Bool)

(assert (=> b!1044670 (= tp!74624 b_and!33713)))

(declare-fun res!695738 () Bool)

(declare-fun e!592084 () Bool)

(assert (=> start!91816 (=> (not res!695738) (not e!592084))))

(declare-datatypes ((V!37999 0))(
  ( (V!38000 (val!12473 Int)) )
))
(declare-datatypes ((ValueCell!11719 0))(
  ( (ValueCellFull!11719 (v!15066 V!37999)) (EmptyCell!11719) )
))
(declare-datatypes ((array!65860 0))(
  ( (array!65861 (arr!31679 (Array (_ BitVec 32) (_ BitVec 64))) (size!32214 (_ BitVec 32))) )
))
(declare-datatypes ((array!65862 0))(
  ( (array!65863 (arr!31680 (Array (_ BitVec 32) ValueCell!11719)) (size!32215 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6032 0))(
  ( (LongMapFixedSize!6033 (defaultEntry!6406 Int) (mask!30519 (_ BitVec 32)) (extraKeys!6134 (_ BitVec 32)) (zeroValue!6240 V!37999) (minValue!6240 V!37999) (_size!3071 (_ BitVec 32)) (_keys!11672 array!65860) (_values!6429 array!65862) (_vacant!3071 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6032)

(declare-fun valid!2263 (LongMapFixedSize!6032) Bool)

(assert (=> start!91816 (= res!695738 (valid!2263 thiss!1427))))

(assert (=> start!91816 e!592084))

(declare-fun e!592078 () Bool)

(assert (=> start!91816 e!592078))

(assert (=> start!91816 true))

(declare-fun e!592085 () Bool)

(declare-fun tp_is_empty!24845 () Bool)

(declare-fun array_inv!24469 (array!65860) Bool)

(declare-fun array_inv!24470 (array!65862) Bool)

(assert (=> b!1044670 (= e!592078 (and tp!74624 tp_is_empty!24845 (array_inv!24469 (_keys!11672 thiss!1427)) (array_inv!24470 (_values!6429 thiss!1427)) e!592085))))

(declare-fun b!1044671 () Bool)

(declare-fun e!592079 () Bool)

(assert (=> b!1044671 (= e!592079 tp_is_empty!24845)))

(declare-fun b!1044672 () Bool)

(declare-fun e!592080 () Bool)

(assert (=> b!1044672 (= e!592080 tp_is_empty!24845)))

(declare-fun b!1044673 () Bool)

(declare-fun res!695739 () Bool)

(declare-fun e!592082 () Bool)

(assert (=> b!1044673 (=> res!695739 e!592082)))

(declare-datatypes ((Unit!34115 0))(
  ( (Unit!34116) )
))
(declare-datatypes ((tuple2!15768 0))(
  ( (tuple2!15769 (_1!7895 Unit!34115) (_2!7895 LongMapFixedSize!6032)) )
))
(declare-fun lt!460914 () tuple2!15768)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044673 (= res!695739 (not (validMask!0 (mask!30519 (_2!7895 lt!460914)))))))

(declare-fun mapNonEmpty!38900 () Bool)

(declare-fun mapRes!38900 () Bool)

(declare-fun tp!74625 () Bool)

(assert (=> mapNonEmpty!38900 (= mapRes!38900 (and tp!74625 e!592079))))

(declare-fun mapValue!38900 () ValueCell!11719)

(declare-fun mapKey!38900 () (_ BitVec 32))

(declare-fun mapRest!38900 () (Array (_ BitVec 32) ValueCell!11719))

(assert (=> mapNonEmpty!38900 (= (arr!31680 (_values!6429 thiss!1427)) (store mapRest!38900 mapKey!38900 mapValue!38900))))

(declare-fun b!1044674 () Bool)

(assert (=> b!1044674 (= e!592082 (or (not (= (size!32215 (_values!6429 (_2!7895 lt!460914))) (bvadd #b00000000000000000000000000000001 (mask!30519 (_2!7895 lt!460914))))) (= (size!32214 (_keys!11672 (_2!7895 lt!460914))) (size!32215 (_values!6429 (_2!7895 lt!460914))))))))

(declare-fun b!1044675 () Bool)

(declare-fun res!695742 () Bool)

(assert (=> b!1044675 (=> (not res!695742) (not e!592084))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044675 (= res!695742 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38900 () Bool)

(assert (=> mapIsEmpty!38900 mapRes!38900))

(declare-fun b!1044676 () Bool)

(declare-fun e!592083 () Bool)

(assert (=> b!1044676 (= e!592083 (not e!592082))))

(declare-fun res!695741 () Bool)

(assert (=> b!1044676 (=> res!695741 e!592082)))

(declare-datatypes ((tuple2!15770 0))(
  ( (tuple2!15771 (_1!7896 (_ BitVec 64)) (_2!7896 V!37999)) )
))
(declare-datatypes ((List!22010 0))(
  ( (Nil!22007) (Cons!22006 (h!23214 tuple2!15770) (t!31258 List!22010)) )
))
(declare-datatypes ((ListLongMap!13785 0))(
  ( (ListLongMap!13786 (toList!6908 List!22010)) )
))
(declare-fun contains!6074 (ListLongMap!13785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3956 (array!65860 array!65862 (_ BitVec 32) (_ BitVec 32) V!37999 V!37999 (_ BitVec 32) Int) ListLongMap!13785)

(assert (=> b!1044676 (= res!695741 (not (contains!6074 (getCurrentListMap!3956 (_keys!11672 (_2!7895 lt!460914)) (_values!6429 (_2!7895 lt!460914)) (mask!30519 (_2!7895 lt!460914)) (extraKeys!6134 (_2!7895 lt!460914)) (zeroValue!6240 (_2!7895 lt!460914)) (minValue!6240 (_2!7895 lt!460914)) #b00000000000000000000000000000000 (defaultEntry!6406 (_2!7895 lt!460914))) key!909)))))

(declare-fun lt!460913 () array!65862)

(declare-fun lt!460912 () array!65860)

(declare-fun Unit!34117 () Unit!34115)

(declare-fun Unit!34118 () Unit!34115)

(assert (=> b!1044676 (= lt!460914 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3071 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15769 Unit!34117 (LongMapFixedSize!6033 (defaultEntry!6406 thiss!1427) (mask!30519 thiss!1427) (extraKeys!6134 thiss!1427) (zeroValue!6240 thiss!1427) (minValue!6240 thiss!1427) (bvsub (_size!3071 thiss!1427) #b00000000000000000000000000000001) lt!460912 lt!460913 (bvadd #b00000000000000000000000000000001 (_vacant!3071 thiss!1427)))) (tuple2!15769 Unit!34118 (LongMapFixedSize!6033 (defaultEntry!6406 thiss!1427) (mask!30519 thiss!1427) (extraKeys!6134 thiss!1427) (zeroValue!6240 thiss!1427) (minValue!6240 thiss!1427) (bvsub (_size!3071 thiss!1427) #b00000000000000000000000000000001) lt!460912 lt!460913 (_vacant!3071 thiss!1427)))))))

(declare-fun -!535 (ListLongMap!13785 (_ BitVec 64)) ListLongMap!13785)

(assert (=> b!1044676 (= (-!535 (getCurrentListMap!3956 (_keys!11672 thiss!1427) (_values!6429 thiss!1427) (mask!30519 thiss!1427) (extraKeys!6134 thiss!1427) (zeroValue!6240 thiss!1427) (minValue!6240 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6406 thiss!1427)) key!909) (getCurrentListMap!3956 lt!460912 lt!460913 (mask!30519 thiss!1427) (extraKeys!6134 thiss!1427) (zeroValue!6240 thiss!1427) (minValue!6240 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6406 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9843 0))(
  ( (MissingZero!9843 (index!41743 (_ BitVec 32))) (Found!9843 (index!41744 (_ BitVec 32))) (Intermediate!9843 (undefined!10655 Bool) (index!41745 (_ BitVec 32)) (x!93293 (_ BitVec 32))) (Undefined!9843) (MissingVacant!9843 (index!41746 (_ BitVec 32))) )
))
(declare-fun lt!460909 () SeekEntryResult!9843)

(declare-fun dynLambda!2005 (Int (_ BitVec 64)) V!37999)

(assert (=> b!1044676 (= lt!460913 (array!65863 (store (arr!31680 (_values!6429 thiss!1427)) (index!41744 lt!460909) (ValueCellFull!11719 (dynLambda!2005 (defaultEntry!6406 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32215 (_values!6429 thiss!1427))))))

(declare-fun lt!460908 () Unit!34115)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (array!65860 array!65862 (_ BitVec 32) (_ BitVec 32) V!37999 V!37999 (_ BitVec 32) (_ BitVec 64) Int) Unit!34115)

(assert (=> b!1044676 (= lt!460908 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!56 (_keys!11672 thiss!1427) (_values!6429 thiss!1427) (mask!30519 thiss!1427) (extraKeys!6134 thiss!1427) (zeroValue!6240 thiss!1427) (minValue!6240 thiss!1427) (index!41744 lt!460909) key!909 (defaultEntry!6406 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044676 (not (arrayContainsKey!0 lt!460912 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460910 () Unit!34115)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65860 (_ BitVec 32) (_ BitVec 64)) Unit!34115)

(assert (=> b!1044676 (= lt!460910 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11672 thiss!1427) (index!41744 lt!460909) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65860 (_ BitVec 32)) Bool)

(assert (=> b!1044676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460912 (mask!30519 thiss!1427))))

(declare-fun lt!460915 () Unit!34115)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65860 (_ BitVec 32) (_ BitVec 32)) Unit!34115)

(assert (=> b!1044676 (= lt!460915 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11672 thiss!1427) (index!41744 lt!460909) (mask!30519 thiss!1427)))))

(declare-datatypes ((List!22011 0))(
  ( (Nil!22008) (Cons!22007 (h!23215 (_ BitVec 64)) (t!31259 List!22011)) )
))
(declare-fun arrayNoDuplicates!0 (array!65860 (_ BitVec 32) List!22011) Bool)

(assert (=> b!1044676 (arrayNoDuplicates!0 lt!460912 #b00000000000000000000000000000000 Nil!22008)))

(declare-fun lt!460911 () Unit!34115)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65860 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22011) Unit!34115)

(assert (=> b!1044676 (= lt!460911 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11672 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41744 lt!460909) #b00000000000000000000000000000000 Nil!22008))))

(declare-fun arrayCountValidKeys!0 (array!65860 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044676 (= (arrayCountValidKeys!0 lt!460912 #b00000000000000000000000000000000 (size!32214 (_keys!11672 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11672 thiss!1427) #b00000000000000000000000000000000 (size!32214 (_keys!11672 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044676 (= lt!460912 (array!65861 (store (arr!31679 (_keys!11672 thiss!1427)) (index!41744 lt!460909) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32214 (_keys!11672 thiss!1427))))))

(declare-fun lt!460916 () Unit!34115)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65860 (_ BitVec 32) (_ BitVec 64)) Unit!34115)

(assert (=> b!1044676 (= lt!460916 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11672 thiss!1427) (index!41744 lt!460909) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044677 () Bool)

(assert (=> b!1044677 (= e!592084 e!592083)))

(declare-fun res!695740 () Bool)

(assert (=> b!1044677 (=> (not res!695740) (not e!592083))))

(assert (=> b!1044677 (= res!695740 (is-Found!9843 lt!460909))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65860 (_ BitVec 32)) SeekEntryResult!9843)

(assert (=> b!1044677 (= lt!460909 (seekEntry!0 key!909 (_keys!11672 thiss!1427) (mask!30519 thiss!1427)))))

(declare-fun b!1044678 () Bool)

(assert (=> b!1044678 (= e!592085 (and e!592080 mapRes!38900))))

(declare-fun condMapEmpty!38900 () Bool)

(declare-fun mapDefault!38900 () ValueCell!11719)

