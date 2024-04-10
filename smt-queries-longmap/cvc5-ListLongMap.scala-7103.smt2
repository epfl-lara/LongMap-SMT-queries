; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90064 () Bool)

(assert start!90064)

(declare-fun b!1031596 () Bool)

(declare-fun b_free!20671 () Bool)

(declare-fun b_next!20671 () Bool)

(assert (=> b!1031596 (= b_free!20671 (not b_next!20671))))

(declare-fun tp!73083 () Bool)

(declare-fun b_and!33109 () Bool)

(assert (=> b!1031596 (= tp!73083 b_and!33109)))

(declare-fun b!1031587 () Bool)

(declare-fun res!689739 () Bool)

(declare-fun e!582668 () Bool)

(assert (=> b!1031587 (=> res!689739 e!582668)))

(declare-datatypes ((V!37395 0))(
  ( (V!37396 (val!12246 Int)) )
))
(declare-datatypes ((ValueCell!11492 0))(
  ( (ValueCellFull!11492 (v!14823 V!37395)) (EmptyCell!11492) )
))
(declare-datatypes ((Unit!33745 0))(
  ( (Unit!33746) )
))
(declare-datatypes ((array!64846 0))(
  ( (array!64847 (arr!31225 (Array (_ BitVec 32) (_ BitVec 64))) (size!31742 (_ BitVec 32))) )
))
(declare-datatypes ((array!64848 0))(
  ( (array!64849 (arr!31226 (Array (_ BitVec 32) ValueCell!11492)) (size!31743 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5578 0))(
  ( (LongMapFixedSize!5579 (defaultEntry!6163 Int) (mask!29963 (_ BitVec 32)) (extraKeys!5895 (_ BitVec 32)) (zeroValue!5999 V!37395) (minValue!5999 V!37395) (_size!2844 (_ BitVec 32)) (_keys!11336 array!64846) (_values!6186 array!64848) (_vacant!2844 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15672 0))(
  ( (tuple2!15673 (_1!7847 Unit!33745) (_2!7847 LongMapFixedSize!5578)) )
))
(declare-fun lt!455492 () tuple2!15672)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031587 (= res!689739 (not (validMask!0 (mask!29963 (_2!7847 lt!455492)))))))

(declare-fun b!1031588 () Bool)

(assert (=> b!1031588 (= e!582668 true)))

(declare-fun lt!455493 () Bool)

(declare-datatypes ((List!21873 0))(
  ( (Nil!21870) (Cons!21869 (h!23071 (_ BitVec 64)) (t!31039 List!21873)) )
))
(declare-fun arrayNoDuplicates!0 (array!64846 (_ BitVec 32) List!21873) Bool)

(assert (=> b!1031588 (= lt!455493 (arrayNoDuplicates!0 (_keys!11336 (_2!7847 lt!455492)) #b00000000000000000000000000000000 Nil!21870))))

(declare-fun b!1031589 () Bool)

(declare-fun e!582667 () Bool)

(assert (=> b!1031589 (= e!582667 (not e!582668))))

(declare-fun res!689740 () Bool)

(assert (=> b!1031589 (=> res!689740 e!582668)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15674 0))(
  ( (tuple2!15675 (_1!7848 (_ BitVec 64)) (_2!7848 V!37395)) )
))
(declare-datatypes ((List!21874 0))(
  ( (Nil!21871) (Cons!21870 (h!23072 tuple2!15674) (t!31040 List!21874)) )
))
(declare-datatypes ((ListLongMap!13731 0))(
  ( (ListLongMap!13732 (toList!6881 List!21874)) )
))
(declare-fun contains!5995 (ListLongMap!13731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3929 (array!64846 array!64848 (_ BitVec 32) (_ BitVec 32) V!37395 V!37395 (_ BitVec 32) Int) ListLongMap!13731)

(assert (=> b!1031589 (= res!689740 (not (contains!5995 (getCurrentListMap!3929 (_keys!11336 (_2!7847 lt!455492)) (_values!6186 (_2!7847 lt!455492)) (mask!29963 (_2!7847 lt!455492)) (extraKeys!5895 (_2!7847 lt!455492)) (zeroValue!5999 (_2!7847 lt!455492)) (minValue!5999 (_2!7847 lt!455492)) #b00000000000000000000000000000000 (defaultEntry!6163 (_2!7847 lt!455492))) key!909)))))

(declare-fun lt!455497 () array!64848)

(declare-fun lt!455499 () array!64846)

(declare-fun thiss!1427 () LongMapFixedSize!5578)

(declare-fun Unit!33747 () Unit!33745)

(declare-fun Unit!33748 () Unit!33745)

(assert (=> b!1031589 (= lt!455492 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2844 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15673 Unit!33747 (LongMapFixedSize!5579 (defaultEntry!6163 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (bvsub (_size!2844 thiss!1427) #b00000000000000000000000000000001) lt!455499 lt!455497 (bvadd #b00000000000000000000000000000001 (_vacant!2844 thiss!1427)))) (tuple2!15673 Unit!33748 (LongMapFixedSize!5579 (defaultEntry!6163 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (bvsub (_size!2844 thiss!1427) #b00000000000000000000000000000001) lt!455499 lt!455497 (_vacant!2844 thiss!1427)))))))

(declare-fun -!508 (ListLongMap!13731 (_ BitVec 64)) ListLongMap!13731)

(assert (=> b!1031589 (= (-!508 (getCurrentListMap!3929 (_keys!11336 thiss!1427) (_values!6186 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6163 thiss!1427)) key!909) (getCurrentListMap!3929 lt!455499 lt!455497 (mask!29963 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6163 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9711 0))(
  ( (MissingZero!9711 (index!41215 (_ BitVec 32))) (Found!9711 (index!41216 (_ BitVec 32))) (Intermediate!9711 (undefined!10523 Bool) (index!41217 (_ BitVec 32)) (x!91875 (_ BitVec 32))) (Undefined!9711) (MissingVacant!9711 (index!41218 (_ BitVec 32))) )
))
(declare-fun lt!455494 () SeekEntryResult!9711)

(declare-fun dynLambda!1978 (Int (_ BitVec 64)) V!37395)

(assert (=> b!1031589 (= lt!455497 (array!64849 (store (arr!31226 (_values!6186 thiss!1427)) (index!41216 lt!455494) (ValueCellFull!11492 (dynLambda!1978 (defaultEntry!6163 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31743 (_values!6186 thiss!1427))))))

(declare-fun lt!455498 () Unit!33745)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!34 (array!64846 array!64848 (_ BitVec 32) (_ BitVec 32) V!37395 V!37395 (_ BitVec 32) (_ BitVec 64) Int) Unit!33745)

(assert (=> b!1031589 (= lt!455498 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!34 (_keys!11336 thiss!1427) (_values!6186 thiss!1427) (mask!29963 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (index!41216 lt!455494) key!909 (defaultEntry!6163 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031589 (not (arrayContainsKey!0 lt!455499 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455495 () Unit!33745)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64846 (_ BitVec 32) (_ BitVec 64)) Unit!33745)

(assert (=> b!1031589 (= lt!455495 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11336 thiss!1427) (index!41216 lt!455494) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64846 (_ BitVec 32)) Bool)

(assert (=> b!1031589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455499 (mask!29963 thiss!1427))))

(declare-fun lt!455500 () Unit!33745)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64846 (_ BitVec 32) (_ BitVec 32)) Unit!33745)

(assert (=> b!1031589 (= lt!455500 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11336 thiss!1427) (index!41216 lt!455494) (mask!29963 thiss!1427)))))

(assert (=> b!1031589 (arrayNoDuplicates!0 lt!455499 #b00000000000000000000000000000000 Nil!21870)))

(declare-fun lt!455501 () Unit!33745)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64846 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21873) Unit!33745)

(assert (=> b!1031589 (= lt!455501 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11336 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41216 lt!455494) #b00000000000000000000000000000000 Nil!21870))))

(declare-fun arrayCountValidKeys!0 (array!64846 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031589 (= (arrayCountValidKeys!0 lt!455499 #b00000000000000000000000000000000 (size!31742 (_keys!11336 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11336 thiss!1427) #b00000000000000000000000000000000 (size!31742 (_keys!11336 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031589 (= lt!455499 (array!64847 (store (arr!31225 (_keys!11336 thiss!1427)) (index!41216 lt!455494) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31742 (_keys!11336 thiss!1427))))))

(declare-fun lt!455496 () Unit!33745)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64846 (_ BitVec 32) (_ BitVec 64)) Unit!33745)

(assert (=> b!1031589 (= lt!455496 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11336 thiss!1427) (index!41216 lt!455494) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!689735 () Bool)

(declare-fun e!582669 () Bool)

(assert (=> start!90064 (=> (not res!689735) (not e!582669))))

(declare-fun valid!2112 (LongMapFixedSize!5578) Bool)

(assert (=> start!90064 (= res!689735 (valid!2112 thiss!1427))))

(assert (=> start!90064 e!582669))

(declare-fun e!582666 () Bool)

(assert (=> start!90064 e!582666))

(assert (=> start!90064 true))

(declare-fun mapNonEmpty!38040 () Bool)

(declare-fun mapRes!38040 () Bool)

(declare-fun tp!73084 () Bool)

(declare-fun e!582665 () Bool)

(assert (=> mapNonEmpty!38040 (= mapRes!38040 (and tp!73084 e!582665))))

(declare-fun mapKey!38040 () (_ BitVec 32))

(declare-fun mapValue!38040 () ValueCell!11492)

(declare-fun mapRest!38040 () (Array (_ BitVec 32) ValueCell!11492))

(assert (=> mapNonEmpty!38040 (= (arr!31226 (_values!6186 thiss!1427)) (store mapRest!38040 mapKey!38040 mapValue!38040))))

(declare-fun b!1031590 () Bool)

(declare-fun res!689736 () Bool)

(assert (=> b!1031590 (=> res!689736 e!582668)))

(assert (=> b!1031590 (= res!689736 (or (not (= (size!31743 (_values!6186 (_2!7847 lt!455492))) (bvadd #b00000000000000000000000000000001 (mask!29963 (_2!7847 lt!455492))))) (not (= (size!31742 (_keys!11336 (_2!7847 lt!455492))) (size!31743 (_values!6186 (_2!7847 lt!455492))))) (bvslt (mask!29963 (_2!7847 lt!455492)) #b00000000000000000000000000000000) (bvslt (extraKeys!5895 (_2!7847 lt!455492)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5895 (_2!7847 lt!455492)) #b00000000000000000000000000000011)))))

(declare-fun b!1031591 () Bool)

(declare-fun res!689741 () Bool)

(assert (=> b!1031591 (=> (not res!689741) (not e!582669))))

(assert (=> b!1031591 (= res!689741 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031592 () Bool)

(assert (=> b!1031592 (= e!582669 e!582667)))

(declare-fun res!689738 () Bool)

(assert (=> b!1031592 (=> (not res!689738) (not e!582667))))

(assert (=> b!1031592 (= res!689738 (is-Found!9711 lt!455494))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64846 (_ BitVec 32)) SeekEntryResult!9711)

(assert (=> b!1031592 (= lt!455494 (seekEntry!0 key!909 (_keys!11336 thiss!1427) (mask!29963 thiss!1427)))))

(declare-fun b!1031593 () Bool)

(declare-fun res!689737 () Bool)

(assert (=> b!1031593 (=> res!689737 e!582668)))

(assert (=> b!1031593 (= res!689737 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11336 (_2!7847 lt!455492)) (mask!29963 (_2!7847 lt!455492)))))))

(declare-fun b!1031594 () Bool)

(declare-fun e!582664 () Bool)

(declare-fun e!582663 () Bool)

(assert (=> b!1031594 (= e!582664 (and e!582663 mapRes!38040))))

(declare-fun condMapEmpty!38040 () Bool)

(declare-fun mapDefault!38040 () ValueCell!11492)

