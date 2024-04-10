; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89970 () Bool)

(assert start!89970)

(declare-fun b!1030312 () Bool)

(declare-fun b_free!20609 () Bool)

(declare-fun b_next!20609 () Bool)

(assert (=> b!1030312 (= b_free!20609 (not b_next!20609))))

(declare-fun tp!72894 () Bool)

(declare-fun b_and!32979 () Bool)

(assert (=> b!1030312 (= tp!72894 b_and!32979)))

(declare-fun b!1030313 () Bool)

(declare-fun e!581790 () Bool)

(declare-fun tp_is_empty!24329 () Bool)

(assert (=> b!1030313 (= e!581790 tp_is_empty!24329)))

(declare-fun b!1030314 () Bool)

(declare-fun e!581788 () Bool)

(declare-fun e!581794 () Bool)

(assert (=> b!1030314 (= e!581788 e!581794)))

(declare-fun res!689003 () Bool)

(assert (=> b!1030314 (=> (not res!689003) (not e!581794))))

(declare-datatypes ((SeekEntryResult!9688 0))(
  ( (MissingZero!9688 (index!41123 (_ BitVec 32))) (Found!9688 (index!41124 (_ BitVec 32))) (Intermediate!9688 (undefined!10500 Bool) (index!41125 (_ BitVec 32)) (x!91684 (_ BitVec 32))) (Undefined!9688) (MissingVacant!9688 (index!41126 (_ BitVec 32))) )
))
(declare-fun lt!454451 () SeekEntryResult!9688)

(assert (=> b!1030314 (= res!689003 (is-Found!9688 lt!454451))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37311 0))(
  ( (V!37312 (val!12215 Int)) )
))
(declare-datatypes ((ValueCell!11461 0))(
  ( (ValueCellFull!11461 (v!14792 V!37311)) (EmptyCell!11461) )
))
(declare-datatypes ((array!64720 0))(
  ( (array!64721 (arr!31163 (Array (_ BitVec 32) (_ BitVec 64))) (size!31680 (_ BitVec 32))) )
))
(declare-datatypes ((array!64722 0))(
  ( (array!64723 (arr!31164 (Array (_ BitVec 32) ValueCell!11461)) (size!31681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5516 0))(
  ( (LongMapFixedSize!5517 (defaultEntry!6130 Int) (mask!29904 (_ BitVec 32)) (extraKeys!5862 (_ BitVec 32)) (zeroValue!5966 V!37311) (minValue!5966 V!37311) (_size!2813 (_ BitVec 32)) (_keys!11301 array!64720) (_values!6153 array!64722) (_vacant!2813 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5516)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64720 (_ BitVec 32)) SeekEntryResult!9688)

(assert (=> b!1030314 (= lt!454451 (seekEntry!0 key!909 (_keys!11301 thiss!1427) (mask!29904 thiss!1427)))))

(declare-fun b!1030315 () Bool)

(declare-fun res!689000 () Bool)

(assert (=> b!1030315 (=> (not res!689000) (not e!581788))))

(assert (=> b!1030315 (= res!689000 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030316 () Bool)

(declare-fun e!581793 () Bool)

(assert (=> b!1030316 (= e!581794 (not e!581793))))

(declare-fun res!689002 () Bool)

(assert (=> b!1030316 (=> res!689002 e!581793)))

(declare-datatypes ((Unit!33649 0))(
  ( (Unit!33650) )
))
(declare-datatypes ((tuple2!15578 0))(
  ( (tuple2!15579 (_1!7800 Unit!33649) (_2!7800 LongMapFixedSize!5516)) )
))
(declare-fun lt!454447 () tuple2!15578)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030316 (= res!689002 (not (validMask!0 (mask!29904 (_2!7800 lt!454447)))))))

(declare-fun lt!454449 () array!64722)

(declare-fun lt!454452 () array!64720)

(declare-fun Unit!33651 () Unit!33649)

(declare-fun Unit!33652 () Unit!33649)

(assert (=> b!1030316 (= lt!454447 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2813 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15579 Unit!33651 (LongMapFixedSize!5517 (defaultEntry!6130 thiss!1427) (mask!29904 thiss!1427) (extraKeys!5862 thiss!1427) (zeroValue!5966 thiss!1427) (minValue!5966 thiss!1427) (bvsub (_size!2813 thiss!1427) #b00000000000000000000000000000001) lt!454452 lt!454449 (bvadd #b00000000000000000000000000000001 (_vacant!2813 thiss!1427)))) (tuple2!15579 Unit!33652 (LongMapFixedSize!5517 (defaultEntry!6130 thiss!1427) (mask!29904 thiss!1427) (extraKeys!5862 thiss!1427) (zeroValue!5966 thiss!1427) (minValue!5966 thiss!1427) (bvsub (_size!2813 thiss!1427) #b00000000000000000000000000000001) lt!454452 lt!454449 (_vacant!2813 thiss!1427)))))))

(declare-datatypes ((tuple2!15580 0))(
  ( (tuple2!15581 (_1!7801 (_ BitVec 64)) (_2!7801 V!37311)) )
))
(declare-datatypes ((List!21833 0))(
  ( (Nil!21830) (Cons!21829 (h!23031 tuple2!15580) (t!30937 List!21833)) )
))
(declare-datatypes ((ListLongMap!13693 0))(
  ( (ListLongMap!13694 (toList!6862 List!21833)) )
))
(declare-fun -!489 (ListLongMap!13693 (_ BitVec 64)) ListLongMap!13693)

(declare-fun getCurrentListMap!3910 (array!64720 array!64722 (_ BitVec 32) (_ BitVec 32) V!37311 V!37311 (_ BitVec 32) Int) ListLongMap!13693)

(assert (=> b!1030316 (= (-!489 (getCurrentListMap!3910 (_keys!11301 thiss!1427) (_values!6153 thiss!1427) (mask!29904 thiss!1427) (extraKeys!5862 thiss!1427) (zeroValue!5966 thiss!1427) (minValue!5966 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6130 thiss!1427)) key!909) (getCurrentListMap!3910 lt!454452 lt!454449 (mask!29904 thiss!1427) (extraKeys!5862 thiss!1427) (zeroValue!5966 thiss!1427) (minValue!5966 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6130 thiss!1427)))))

(declare-fun dynLambda!1959 (Int (_ BitVec 64)) V!37311)

(assert (=> b!1030316 (= lt!454449 (array!64723 (store (arr!31164 (_values!6153 thiss!1427)) (index!41124 lt!454451) (ValueCellFull!11461 (dynLambda!1959 (defaultEntry!6130 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31681 (_values!6153 thiss!1427))))))

(declare-fun lt!454450 () Unit!33649)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!15 (array!64720 array!64722 (_ BitVec 32) (_ BitVec 32) V!37311 V!37311 (_ BitVec 32) (_ BitVec 64) Int) Unit!33649)

(assert (=> b!1030316 (= lt!454450 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!15 (_keys!11301 thiss!1427) (_values!6153 thiss!1427) (mask!29904 thiss!1427) (extraKeys!5862 thiss!1427) (zeroValue!5966 thiss!1427) (minValue!5966 thiss!1427) (index!41124 lt!454451) key!909 (defaultEntry!6130 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030316 (not (arrayContainsKey!0 lt!454452 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454455 () Unit!33649)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64720 (_ BitVec 32) (_ BitVec 64)) Unit!33649)

(assert (=> b!1030316 (= lt!454455 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11301 thiss!1427) (index!41124 lt!454451) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64720 (_ BitVec 32)) Bool)

(assert (=> b!1030316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454452 (mask!29904 thiss!1427))))

(declare-fun lt!454453 () Unit!33649)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64720 (_ BitVec 32) (_ BitVec 32)) Unit!33649)

(assert (=> b!1030316 (= lt!454453 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11301 thiss!1427) (index!41124 lt!454451) (mask!29904 thiss!1427)))))

(declare-datatypes ((List!21834 0))(
  ( (Nil!21831) (Cons!21830 (h!23032 (_ BitVec 64)) (t!30938 List!21834)) )
))
(declare-fun arrayNoDuplicates!0 (array!64720 (_ BitVec 32) List!21834) Bool)

(assert (=> b!1030316 (arrayNoDuplicates!0 lt!454452 #b00000000000000000000000000000000 Nil!21831)))

(declare-fun lt!454454 () Unit!33649)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21834) Unit!33649)

(assert (=> b!1030316 (= lt!454454 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11301 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41124 lt!454451) #b00000000000000000000000000000000 Nil!21831))))

(declare-fun arrayCountValidKeys!0 (array!64720 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030316 (= (arrayCountValidKeys!0 lt!454452 #b00000000000000000000000000000000 (size!31680 (_keys!11301 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11301 thiss!1427) #b00000000000000000000000000000000 (size!31680 (_keys!11301 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030316 (= lt!454452 (array!64721 (store (arr!31163 (_keys!11301 thiss!1427)) (index!41124 lt!454451) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31680 (_keys!11301 thiss!1427))))))

(declare-fun lt!454448 () Unit!33649)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64720 (_ BitVec 32) (_ BitVec 64)) Unit!33649)

(assert (=> b!1030316 (= lt!454448 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11301 thiss!1427) (index!41124 lt!454451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!689001 () Bool)

(assert (=> start!89970 (=> (not res!689001) (not e!581788))))

(declare-fun valid!2088 (LongMapFixedSize!5516) Bool)

(assert (=> start!89970 (= res!689001 (valid!2088 thiss!1427))))

(assert (=> start!89970 e!581788))

(declare-fun e!581795 () Bool)

(assert (=> start!89970 e!581795))

(assert (=> start!89970 true))

(declare-fun e!581791 () Bool)

(declare-fun array_inv!24125 (array!64720) Bool)

(declare-fun array_inv!24126 (array!64722) Bool)

(assert (=> b!1030312 (= e!581795 (and tp!72894 tp_is_empty!24329 (array_inv!24125 (_keys!11301 thiss!1427)) (array_inv!24126 (_values!6153 thiss!1427)) e!581791))))

(declare-fun mapNonEmpty!37944 () Bool)

(declare-fun mapRes!37944 () Bool)

(declare-fun tp!72895 () Bool)

(declare-fun e!581789 () Bool)

(assert (=> mapNonEmpty!37944 (= mapRes!37944 (and tp!72895 e!581789))))

(declare-fun mapRest!37944 () (Array (_ BitVec 32) ValueCell!11461))

(declare-fun mapValue!37944 () ValueCell!11461)

(declare-fun mapKey!37944 () (_ BitVec 32))

(assert (=> mapNonEmpty!37944 (= (arr!31164 (_values!6153 thiss!1427)) (store mapRest!37944 mapKey!37944 mapValue!37944))))

(declare-fun b!1030317 () Bool)

(declare-fun res!689004 () Bool)

(assert (=> b!1030317 (=> res!689004 e!581793)))

(assert (=> b!1030317 (= res!689004 (or (not (= (size!31681 (_values!6153 (_2!7800 lt!454447))) (bvadd #b00000000000000000000000000000001 (mask!29904 (_2!7800 lt!454447))))) (not (= (size!31680 (_keys!11301 (_2!7800 lt!454447))) (size!31681 (_values!6153 (_2!7800 lt!454447))))) (bvslt (mask!29904 (_2!7800 lt!454447)) #b00000000000000000000000000000000) (bvslt (extraKeys!5862 (_2!7800 lt!454447)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5862 (_2!7800 lt!454447)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37944 () Bool)

(assert (=> mapIsEmpty!37944 mapRes!37944))

(declare-fun b!1030318 () Bool)

(assert (=> b!1030318 (= e!581793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11301 (_2!7800 lt!454447)) (mask!29904 (_2!7800 lt!454447))))))

(declare-fun b!1030319 () Bool)

(assert (=> b!1030319 (= e!581789 tp_is_empty!24329)))

(declare-fun b!1030320 () Bool)

(assert (=> b!1030320 (= e!581791 (and e!581790 mapRes!37944))))

(declare-fun condMapEmpty!37944 () Bool)

(declare-fun mapDefault!37944 () ValueCell!11461)

