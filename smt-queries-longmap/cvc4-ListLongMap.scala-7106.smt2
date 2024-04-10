; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90086 () Bool)

(assert start!90086)

(declare-fun b!1032003 () Bool)

(declare-fun b_free!20693 () Bool)

(declare-fun b_next!20693 () Bool)

(assert (=> b!1032003 (= b_free!20693 (not b_next!20693))))

(declare-fun tp!73150 () Bool)

(declare-fun b_and!33153 () Bool)

(assert (=> b!1032003 (= tp!73150 b_and!33153)))

(declare-fun b!1031998 () Bool)

(declare-fun e!582986 () Bool)

(declare-fun tp_is_empty!24413 () Bool)

(assert (=> b!1031998 (= e!582986 tp_is_empty!24413)))

(declare-fun b!1031999 () Bool)

(declare-fun e!582978 () Bool)

(assert (=> b!1031999 (= e!582978 false)))

(declare-fun b!1032000 () Bool)

(declare-fun res!689891 () Bool)

(declare-fun e!582984 () Bool)

(assert (=> b!1032000 (=> (not res!689891) (not e!582984))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032000 (= res!689891 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032001 () Bool)

(declare-fun e!582982 () Bool)

(assert (=> b!1032001 (= e!582982 (not true))))

(declare-fun lt!455882 () Bool)

(declare-datatypes ((V!37423 0))(
  ( (V!37424 (val!12257 Int)) )
))
(declare-datatypes ((ValueCell!11503 0))(
  ( (ValueCellFull!11503 (v!14834 V!37423)) (EmptyCell!11503) )
))
(declare-datatypes ((Unit!33795 0))(
  ( (Unit!33796) )
))
(declare-datatypes ((array!64890 0))(
  ( (array!64891 (arr!31247 (Array (_ BitVec 32) (_ BitVec 64))) (size!31764 (_ BitVec 32))) )
))
(declare-datatypes ((array!64892 0))(
  ( (array!64893 (arr!31248 (Array (_ BitVec 32) ValueCell!11503)) (size!31765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5600 0))(
  ( (LongMapFixedSize!5601 (defaultEntry!6174 Int) (mask!29980 (_ BitVec 32)) (extraKeys!5906 (_ BitVec 32)) (zeroValue!6010 V!37423) (minValue!6010 V!37423) (_size!2855 (_ BitVec 32)) (_keys!11347 array!64890) (_values!6197 array!64892) (_vacant!2855 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15710 0))(
  ( (tuple2!15711 (_1!7866 Unit!33795) (_2!7866 LongMapFixedSize!5600)) )
))
(declare-fun lt!455879 () tuple2!15710)

(declare-fun valid!2120 (LongMapFixedSize!5600) Bool)

(assert (=> b!1032001 (= lt!455882 (valid!2120 (_2!7866 lt!455879)))))

(declare-fun lt!455876 () Unit!33795)

(declare-fun e!582979 () Unit!33795)

(assert (=> b!1032001 (= lt!455876 e!582979)))

(declare-fun c!104283 () Bool)

(declare-datatypes ((tuple2!15712 0))(
  ( (tuple2!15713 (_1!7867 (_ BitVec 64)) (_2!7867 V!37423)) )
))
(declare-datatypes ((List!21889 0))(
  ( (Nil!21886) (Cons!21885 (h!23087 tuple2!15712) (t!31077 List!21889)) )
))
(declare-datatypes ((ListLongMap!13747 0))(
  ( (ListLongMap!13748 (toList!6889 List!21889)) )
))
(declare-fun contains!6003 (ListLongMap!13747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3937 (array!64890 array!64892 (_ BitVec 32) (_ BitVec 32) V!37423 V!37423 (_ BitVec 32) Int) ListLongMap!13747)

(assert (=> b!1032001 (= c!104283 (contains!6003 (getCurrentListMap!3937 (_keys!11347 (_2!7866 lt!455879)) (_values!6197 (_2!7866 lt!455879)) (mask!29980 (_2!7866 lt!455879)) (extraKeys!5906 (_2!7866 lt!455879)) (zeroValue!6010 (_2!7866 lt!455879)) (minValue!6010 (_2!7866 lt!455879)) #b00000000000000000000000000000000 (defaultEntry!6174 (_2!7866 lt!455879))) key!909))))

(declare-fun thiss!1427 () LongMapFixedSize!5600)

(declare-fun lt!455881 () array!64892)

(declare-fun lt!455875 () array!64890)

(declare-fun Unit!33797 () Unit!33795)

(declare-fun Unit!33798 () Unit!33795)

(assert (=> b!1032001 (= lt!455879 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2855 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15711 Unit!33797 (LongMapFixedSize!5601 (defaultEntry!6174 thiss!1427) (mask!29980 thiss!1427) (extraKeys!5906 thiss!1427) (zeroValue!6010 thiss!1427) (minValue!6010 thiss!1427) (bvsub (_size!2855 thiss!1427) #b00000000000000000000000000000001) lt!455875 lt!455881 (bvadd #b00000000000000000000000000000001 (_vacant!2855 thiss!1427)))) (tuple2!15711 Unit!33798 (LongMapFixedSize!5601 (defaultEntry!6174 thiss!1427) (mask!29980 thiss!1427) (extraKeys!5906 thiss!1427) (zeroValue!6010 thiss!1427) (minValue!6010 thiss!1427) (bvsub (_size!2855 thiss!1427) #b00000000000000000000000000000001) lt!455875 lt!455881 (_vacant!2855 thiss!1427)))))))

(declare-fun -!516 (ListLongMap!13747 (_ BitVec 64)) ListLongMap!13747)

(assert (=> b!1032001 (= (-!516 (getCurrentListMap!3937 (_keys!11347 thiss!1427) (_values!6197 thiss!1427) (mask!29980 thiss!1427) (extraKeys!5906 thiss!1427) (zeroValue!6010 thiss!1427) (minValue!6010 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6174 thiss!1427)) key!909) (getCurrentListMap!3937 lt!455875 lt!455881 (mask!29980 thiss!1427) (extraKeys!5906 thiss!1427) (zeroValue!6010 thiss!1427) (minValue!6010 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6174 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9720 0))(
  ( (MissingZero!9720 (index!41251 (_ BitVec 32))) (Found!9720 (index!41252 (_ BitVec 32))) (Intermediate!9720 (undefined!10532 Bool) (index!41253 (_ BitVec 32)) (x!91930 (_ BitVec 32))) (Undefined!9720) (MissingVacant!9720 (index!41254 (_ BitVec 32))) )
))
(declare-fun lt!455884 () SeekEntryResult!9720)

(declare-fun dynLambda!1986 (Int (_ BitVec 64)) V!37423)

(assert (=> b!1032001 (= lt!455881 (array!64893 (store (arr!31248 (_values!6197 thiss!1427)) (index!41252 lt!455884) (ValueCellFull!11503 (dynLambda!1986 (defaultEntry!6174 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31765 (_values!6197 thiss!1427))))))

(declare-fun lt!455878 () Unit!33795)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!42 (array!64890 array!64892 (_ BitVec 32) (_ BitVec 32) V!37423 V!37423 (_ BitVec 32) (_ BitVec 64) Int) Unit!33795)

(assert (=> b!1032001 (= lt!455878 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!42 (_keys!11347 thiss!1427) (_values!6197 thiss!1427) (mask!29980 thiss!1427) (extraKeys!5906 thiss!1427) (zeroValue!6010 thiss!1427) (minValue!6010 thiss!1427) (index!41252 lt!455884) key!909 (defaultEntry!6174 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032001 (not (arrayContainsKey!0 lt!455875 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455883 () Unit!33795)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64890 (_ BitVec 32) (_ BitVec 64)) Unit!33795)

(assert (=> b!1032001 (= lt!455883 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11347 thiss!1427) (index!41252 lt!455884) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64890 (_ BitVec 32)) Bool)

(assert (=> b!1032001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455875 (mask!29980 thiss!1427))))

(declare-fun lt!455877 () Unit!33795)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64890 (_ BitVec 32) (_ BitVec 32)) Unit!33795)

(assert (=> b!1032001 (= lt!455877 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11347 thiss!1427) (index!41252 lt!455884) (mask!29980 thiss!1427)))))

(declare-datatypes ((List!21890 0))(
  ( (Nil!21887) (Cons!21886 (h!23088 (_ BitVec 64)) (t!31078 List!21890)) )
))
(declare-fun arrayNoDuplicates!0 (array!64890 (_ BitVec 32) List!21890) Bool)

(assert (=> b!1032001 (arrayNoDuplicates!0 lt!455875 #b00000000000000000000000000000000 Nil!21887)))

(declare-fun lt!455880 () Unit!33795)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64890 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21890) Unit!33795)

(assert (=> b!1032001 (= lt!455880 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11347 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41252 lt!455884) #b00000000000000000000000000000000 Nil!21887))))

(declare-fun arrayCountValidKeys!0 (array!64890 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032001 (= (arrayCountValidKeys!0 lt!455875 #b00000000000000000000000000000000 (size!31764 (_keys!11347 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11347 thiss!1427) #b00000000000000000000000000000000 (size!31764 (_keys!11347 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032001 (= lt!455875 (array!64891 (store (arr!31247 (_keys!11347 thiss!1427)) (index!41252 lt!455884) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31764 (_keys!11347 thiss!1427))))))

(declare-fun lt!455874 () Unit!33795)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64890 (_ BitVec 32) (_ BitVec 64)) Unit!33795)

(assert (=> b!1032001 (= lt!455874 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11347 thiss!1427) (index!41252 lt!455884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032002 () Bool)

(declare-fun e!582985 () Bool)

(assert (=> b!1032002 (= e!582985 (arrayContainsKey!0 (_keys!11347 (_2!7866 lt!455879)) key!909 #b00000000000000000000000000000000))))

(declare-fun e!582980 () Bool)

(declare-fun e!582981 () Bool)

(declare-fun array_inv!24189 (array!64890) Bool)

(declare-fun array_inv!24190 (array!64892) Bool)

(assert (=> b!1032003 (= e!582980 (and tp!73150 tp_is_empty!24413 (array_inv!24189 (_keys!11347 thiss!1427)) (array_inv!24190 (_values!6197 thiss!1427)) e!582981))))

(declare-fun mapIsEmpty!38073 () Bool)

(declare-fun mapRes!38073 () Bool)

(assert (=> mapIsEmpty!38073 mapRes!38073))

(declare-fun b!1032004 () Bool)

(declare-fun Unit!33799 () Unit!33795)

(assert (=> b!1032004 (= e!582979 Unit!33799)))

(declare-fun lt!455885 () Unit!33795)

(declare-fun lemmaKeyInListMapIsInArray!351 (array!64890 array!64892 (_ BitVec 32) (_ BitVec 32) V!37423 V!37423 (_ BitVec 64) Int) Unit!33795)

(assert (=> b!1032004 (= lt!455885 (lemmaKeyInListMapIsInArray!351 (_keys!11347 (_2!7866 lt!455879)) (_values!6197 (_2!7866 lt!455879)) (mask!29980 (_2!7866 lt!455879)) (extraKeys!5906 (_2!7866 lt!455879)) (zeroValue!6010 (_2!7866 lt!455879)) (minValue!6010 (_2!7866 lt!455879)) key!909 (defaultEntry!6174 (_2!7866 lt!455879))))))

(declare-fun c!104282 () Bool)

(assert (=> b!1032004 (= c!104282 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!689888 () Bool)

(assert (=> b!1032004 (= res!689888 e!582985)))

(assert (=> b!1032004 (=> (not res!689888) (not e!582978))))

(assert (=> b!1032004 e!582978))

(declare-fun b!1032005 () Bool)

(declare-fun e!582983 () Bool)

(assert (=> b!1032005 (= e!582981 (and e!582983 mapRes!38073))))

(declare-fun condMapEmpty!38073 () Bool)

(declare-fun mapDefault!38073 () ValueCell!11503)

