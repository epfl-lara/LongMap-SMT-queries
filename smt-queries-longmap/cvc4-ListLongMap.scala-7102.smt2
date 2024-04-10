; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90062 () Bool)

(assert start!90062)

(declare-fun b!1031556 () Bool)

(declare-fun b_free!20669 () Bool)

(declare-fun b_next!20669 () Bool)

(assert (=> b!1031556 (= b_free!20669 (not b_next!20669))))

(declare-fun tp!73078 () Bool)

(declare-fun b_and!33105 () Bool)

(assert (=> b!1031556 (= tp!73078 b_and!33105)))

(declare-fun res!689720 () Bool)

(declare-fun e!582640 () Bool)

(assert (=> start!90062 (=> (not res!689720) (not e!582640))))

(declare-datatypes ((V!37391 0))(
  ( (V!37392 (val!12245 Int)) )
))
(declare-datatypes ((ValueCell!11491 0))(
  ( (ValueCellFull!11491 (v!14822 V!37391)) (EmptyCell!11491) )
))
(declare-datatypes ((array!64842 0))(
  ( (array!64843 (arr!31223 (Array (_ BitVec 32) (_ BitVec 64))) (size!31740 (_ BitVec 32))) )
))
(declare-datatypes ((array!64844 0))(
  ( (array!64845 (arr!31224 (Array (_ BitVec 32) ValueCell!11491)) (size!31741 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5576 0))(
  ( (LongMapFixedSize!5577 (defaultEntry!6162 Int) (mask!29960 (_ BitVec 32)) (extraKeys!5894 (_ BitVec 32)) (zeroValue!5998 V!37391) (minValue!5998 V!37391) (_size!2843 (_ BitVec 32)) (_keys!11335 array!64842) (_values!6185 array!64844) (_vacant!2843 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5576)

(declare-fun valid!2111 (LongMapFixedSize!5576) Bool)

(assert (=> start!90062 (= res!689720 (valid!2111 thiss!1427))))

(assert (=> start!90062 e!582640))

(declare-fun e!582644 () Bool)

(assert (=> start!90062 e!582644))

(assert (=> start!90062 true))

(declare-fun b!1031552 () Bool)

(declare-fun res!689719 () Bool)

(declare-fun e!582641 () Bool)

(assert (=> b!1031552 (=> res!689719 e!582641)))

(declare-datatypes ((Unit!33741 0))(
  ( (Unit!33742) )
))
(declare-datatypes ((tuple2!15668 0))(
  ( (tuple2!15669 (_1!7845 Unit!33741) (_2!7845 LongMapFixedSize!5576)) )
))
(declare-fun lt!455471 () tuple2!15668)

(assert (=> b!1031552 (= res!689719 (or (not (= (size!31741 (_values!6185 (_2!7845 lt!455471))) (bvadd #b00000000000000000000000000000001 (mask!29960 (_2!7845 lt!455471))))) (not (= (size!31740 (_keys!11335 (_2!7845 lt!455471))) (size!31741 (_values!6185 (_2!7845 lt!455471))))) (bvslt (mask!29960 (_2!7845 lt!455471)) #b00000000000000000000000000000000) (bvslt (extraKeys!5894 (_2!7845 lt!455471)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5894 (_2!7845 lt!455471)) #b00000000000000000000000000000011)))))

(declare-fun b!1031553 () Bool)

(declare-fun res!689714 () Bool)

(assert (=> b!1031553 (=> res!689714 e!582641)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64842 (_ BitVec 32)) Bool)

(assert (=> b!1031553 (= res!689714 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11335 (_2!7845 lt!455471)) (mask!29960 (_2!7845 lt!455471)))))))

(declare-fun b!1031554 () Bool)

(declare-fun e!582642 () Bool)

(assert (=> b!1031554 (= e!582642 (not e!582641))))

(declare-fun res!689715 () Bool)

(assert (=> b!1031554 (=> res!689715 e!582641)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15670 0))(
  ( (tuple2!15671 (_1!7846 (_ BitVec 64)) (_2!7846 V!37391)) )
))
(declare-datatypes ((List!21871 0))(
  ( (Nil!21868) (Cons!21867 (h!23069 tuple2!15670) (t!31035 List!21871)) )
))
(declare-datatypes ((ListLongMap!13729 0))(
  ( (ListLongMap!13730 (toList!6880 List!21871)) )
))
(declare-fun contains!5994 (ListLongMap!13729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3928 (array!64842 array!64844 (_ BitVec 32) (_ BitVec 32) V!37391 V!37391 (_ BitVec 32) Int) ListLongMap!13729)

(assert (=> b!1031554 (= res!689715 (not (contains!5994 (getCurrentListMap!3928 (_keys!11335 (_2!7845 lt!455471)) (_values!6185 (_2!7845 lt!455471)) (mask!29960 (_2!7845 lt!455471)) (extraKeys!5894 (_2!7845 lt!455471)) (zeroValue!5998 (_2!7845 lt!455471)) (minValue!5998 (_2!7845 lt!455471)) #b00000000000000000000000000000000 (defaultEntry!6162 (_2!7845 lt!455471))) key!909)))))

(declare-fun lt!455464 () array!64842)

(declare-fun lt!455468 () array!64844)

(declare-fun Unit!33743 () Unit!33741)

(declare-fun Unit!33744 () Unit!33741)

(assert (=> b!1031554 (= lt!455471 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2843 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15669 Unit!33743 (LongMapFixedSize!5577 (defaultEntry!6162 thiss!1427) (mask!29960 thiss!1427) (extraKeys!5894 thiss!1427) (zeroValue!5998 thiss!1427) (minValue!5998 thiss!1427) (bvsub (_size!2843 thiss!1427) #b00000000000000000000000000000001) lt!455464 lt!455468 (bvadd #b00000000000000000000000000000001 (_vacant!2843 thiss!1427)))) (tuple2!15669 Unit!33744 (LongMapFixedSize!5577 (defaultEntry!6162 thiss!1427) (mask!29960 thiss!1427) (extraKeys!5894 thiss!1427) (zeroValue!5998 thiss!1427) (minValue!5998 thiss!1427) (bvsub (_size!2843 thiss!1427) #b00000000000000000000000000000001) lt!455464 lt!455468 (_vacant!2843 thiss!1427)))))))

(declare-fun -!507 (ListLongMap!13729 (_ BitVec 64)) ListLongMap!13729)

(assert (=> b!1031554 (= (-!507 (getCurrentListMap!3928 (_keys!11335 thiss!1427) (_values!6185 thiss!1427) (mask!29960 thiss!1427) (extraKeys!5894 thiss!1427) (zeroValue!5998 thiss!1427) (minValue!5998 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6162 thiss!1427)) key!909) (getCurrentListMap!3928 lt!455464 lt!455468 (mask!29960 thiss!1427) (extraKeys!5894 thiss!1427) (zeroValue!5998 thiss!1427) (minValue!5998 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6162 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9710 0))(
  ( (MissingZero!9710 (index!41211 (_ BitVec 32))) (Found!9710 (index!41212 (_ BitVec 32))) (Intermediate!9710 (undefined!10522 Bool) (index!41213 (_ BitVec 32)) (x!91864 (_ BitVec 32))) (Undefined!9710) (MissingVacant!9710 (index!41214 (_ BitVec 32))) )
))
(declare-fun lt!455463 () SeekEntryResult!9710)

(declare-fun dynLambda!1977 (Int (_ BitVec 64)) V!37391)

(assert (=> b!1031554 (= lt!455468 (array!64845 (store (arr!31224 (_values!6185 thiss!1427)) (index!41212 lt!455463) (ValueCellFull!11491 (dynLambda!1977 (defaultEntry!6162 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31741 (_values!6185 thiss!1427))))))

(declare-fun lt!455465 () Unit!33741)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!33 (array!64842 array!64844 (_ BitVec 32) (_ BitVec 32) V!37391 V!37391 (_ BitVec 32) (_ BitVec 64) Int) Unit!33741)

(assert (=> b!1031554 (= lt!455465 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!33 (_keys!11335 thiss!1427) (_values!6185 thiss!1427) (mask!29960 thiss!1427) (extraKeys!5894 thiss!1427) (zeroValue!5998 thiss!1427) (minValue!5998 thiss!1427) (index!41212 lt!455463) key!909 (defaultEntry!6162 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031554 (not (arrayContainsKey!0 lt!455464 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455467 () Unit!33741)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64842 (_ BitVec 32) (_ BitVec 64)) Unit!33741)

(assert (=> b!1031554 (= lt!455467 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11335 thiss!1427) (index!41212 lt!455463) key!909))))

(assert (=> b!1031554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455464 (mask!29960 thiss!1427))))

(declare-fun lt!455462 () Unit!33741)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64842 (_ BitVec 32) (_ BitVec 32)) Unit!33741)

(assert (=> b!1031554 (= lt!455462 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11335 thiss!1427) (index!41212 lt!455463) (mask!29960 thiss!1427)))))

(declare-datatypes ((List!21872 0))(
  ( (Nil!21869) (Cons!21868 (h!23070 (_ BitVec 64)) (t!31036 List!21872)) )
))
(declare-fun arrayNoDuplicates!0 (array!64842 (_ BitVec 32) List!21872) Bool)

(assert (=> b!1031554 (arrayNoDuplicates!0 lt!455464 #b00000000000000000000000000000000 Nil!21869)))

(declare-fun lt!455470 () Unit!33741)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64842 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21872) Unit!33741)

(assert (=> b!1031554 (= lt!455470 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11335 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41212 lt!455463) #b00000000000000000000000000000000 Nil!21869))))

(declare-fun arrayCountValidKeys!0 (array!64842 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031554 (= (arrayCountValidKeys!0 lt!455464 #b00000000000000000000000000000000 (size!31740 (_keys!11335 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11335 thiss!1427) #b00000000000000000000000000000000 (size!31740 (_keys!11335 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031554 (= lt!455464 (array!64843 (store (arr!31223 (_keys!11335 thiss!1427)) (index!41212 lt!455463) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31740 (_keys!11335 thiss!1427))))))

(declare-fun lt!455469 () Unit!33741)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64842 (_ BitVec 32) (_ BitVec 64)) Unit!33741)

(assert (=> b!1031554 (= lt!455469 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11335 thiss!1427) (index!41212 lt!455463) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031555 () Bool)

(declare-fun res!689718 () Bool)

(assert (=> b!1031555 (=> res!689718 e!582641)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031555 (= res!689718 (not (validMask!0 (mask!29960 (_2!7845 lt!455471)))))))

(declare-fun e!582638 () Bool)

(declare-fun tp_is_empty!24389 () Bool)

(declare-fun array_inv!24169 (array!64842) Bool)

(declare-fun array_inv!24170 (array!64844) Bool)

(assert (=> b!1031556 (= e!582644 (and tp!73078 tp_is_empty!24389 (array_inv!24169 (_keys!11335 thiss!1427)) (array_inv!24170 (_values!6185 thiss!1427)) e!582638))))

(declare-fun mapIsEmpty!38037 () Bool)

(declare-fun mapRes!38037 () Bool)

(assert (=> mapIsEmpty!38037 mapRes!38037))

(declare-fun b!1031557 () Bool)

(declare-fun e!582645 () Bool)

(assert (=> b!1031557 (= e!582645 tp_is_empty!24389)))

(declare-fun b!1031558 () Bool)

(assert (=> b!1031558 (= e!582640 e!582642)))

(declare-fun res!689717 () Bool)

(assert (=> b!1031558 (=> (not res!689717) (not e!582642))))

(assert (=> b!1031558 (= res!689717 (is-Found!9710 lt!455463))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64842 (_ BitVec 32)) SeekEntryResult!9710)

(assert (=> b!1031558 (= lt!455463 (seekEntry!0 key!909 (_keys!11335 thiss!1427) (mask!29960 thiss!1427)))))

(declare-fun mapNonEmpty!38037 () Bool)

(declare-fun tp!73077 () Bool)

(declare-fun e!582643 () Bool)

(assert (=> mapNonEmpty!38037 (= mapRes!38037 (and tp!73077 e!582643))))

(declare-fun mapValue!38037 () ValueCell!11491)

(declare-fun mapKey!38037 () (_ BitVec 32))

(declare-fun mapRest!38037 () (Array (_ BitVec 32) ValueCell!11491))

(assert (=> mapNonEmpty!38037 (= (arr!31224 (_values!6185 thiss!1427)) (store mapRest!38037 mapKey!38037 mapValue!38037))))

(declare-fun b!1031559 () Bool)

(assert (=> b!1031559 (= e!582638 (and e!582645 mapRes!38037))))

(declare-fun condMapEmpty!38037 () Bool)

(declare-fun mapDefault!38037 () ValueCell!11491)

