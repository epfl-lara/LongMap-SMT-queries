; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90310 () Bool)

(assert start!90310)

(declare-fun b!1033123 () Bool)

(declare-fun b_free!20683 () Bool)

(declare-fun b_next!20683 () Bool)

(assert (=> b!1033123 (= b_free!20683 (not b_next!20683))))

(declare-fun tp!73120 () Bool)

(declare-fun b_and!33143 () Bool)

(assert (=> b!1033123 (= tp!73120 b_and!33143)))

(declare-fun tp_is_empty!24403 () Bool)

(declare-datatypes ((V!37411 0))(
  ( (V!37412 (val!12252 Int)) )
))
(declare-datatypes ((ValueCell!11498 0))(
  ( (ValueCellFull!11498 (v!14825 V!37411)) (EmptyCell!11498) )
))
(declare-datatypes ((array!64919 0))(
  ( (array!64920 (arr!31255 (Array (_ BitVec 32) (_ BitVec 64))) (size!31773 (_ BitVec 32))) )
))
(declare-datatypes ((array!64921 0))(
  ( (array!64922 (arr!31256 (Array (_ BitVec 32) ValueCell!11498)) (size!31774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5590 0))(
  ( (LongMapFixedSize!5591 (defaultEntry!6169 Int) (mask!30033 (_ BitVec 32)) (extraKeys!5901 (_ BitVec 32)) (zeroValue!6005 V!37411) (minValue!6005 V!37411) (_size!2850 (_ BitVec 32)) (_keys!11380 array!64919) (_values!6192 array!64921) (_vacant!2850 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5590)

(declare-fun e!583674 () Bool)

(declare-fun e!583676 () Bool)

(declare-fun array_inv!24199 (array!64919) Bool)

(declare-fun array_inv!24200 (array!64921) Bool)

(assert (=> b!1033123 (= e!583674 (and tp!73120 tp_is_empty!24403 (array_inv!24199 (_keys!11380 thiss!1427)) (array_inv!24200 (_values!6192 thiss!1427)) e!583676))))

(declare-fun b!1033124 () Bool)

(declare-fun res!690338 () Bool)

(declare-fun e!583671 () Bool)

(assert (=> b!1033124 (=> (not res!690338) (not e!583671))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033124 (= res!690338 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1033125 () Bool)

(declare-fun e!583680 () Bool)

(assert (=> b!1033125 (= e!583680 false)))

(declare-fun res!690339 () Bool)

(assert (=> start!90310 (=> (not res!690339) (not e!583671))))

(declare-fun valid!2119 (LongMapFixedSize!5590) Bool)

(assert (=> start!90310 (= res!690339 (valid!2119 thiss!1427))))

(assert (=> start!90310 e!583671))

(assert (=> start!90310 e!583674))

(assert (=> start!90310 true))

(declare-fun b!1033126 () Bool)

(declare-fun e!583675 () Bool)

(assert (=> b!1033126 (= e!583675 tp_is_empty!24403)))

(declare-fun b!1033127 () Bool)

(declare-fun e!583679 () Bool)

(declare-datatypes ((Unit!33777 0))(
  ( (Unit!33778) )
))
(declare-datatypes ((tuple2!15696 0))(
  ( (tuple2!15697 (_1!7859 Unit!33777) (_2!7859 LongMapFixedSize!5590)) )
))
(declare-fun lt!456219 () tuple2!15696)

(assert (=> b!1033127 (= e!583679 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5901 (_2!7859 lt!456219)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5901 (_2!7859 lt!456219)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1033128 () Bool)

(declare-fun e!583677 () Unit!33777)

(declare-fun Unit!33779 () Unit!33777)

(assert (=> b!1033128 (= e!583677 Unit!33779)))

(declare-fun lt!456214 () Unit!33777)

(declare-fun lemmaKeyInListMapIsInArray!343 (array!64919 array!64921 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 64) Int) Unit!33777)

(assert (=> b!1033128 (= lt!456214 (lemmaKeyInListMapIsInArray!343 (_keys!11380 (_2!7859 lt!456219)) (_values!6192 (_2!7859 lt!456219)) (mask!30033 (_2!7859 lt!456219)) (extraKeys!5901 (_2!7859 lt!456219)) (zeroValue!6005 (_2!7859 lt!456219)) (minValue!6005 (_2!7859 lt!456219)) key!909 (defaultEntry!6169 (_2!7859 lt!456219))))))

(declare-fun c!104662 () Bool)

(assert (=> b!1033128 (= c!104662 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!690340 () Bool)

(assert (=> b!1033128 (= res!690340 e!583679)))

(assert (=> b!1033128 (=> (not res!690340) (not e!583680))))

(assert (=> b!1033128 e!583680))

(declare-fun b!1033129 () Bool)

(declare-fun e!583672 () Bool)

(assert (=> b!1033129 (= e!583672 tp_is_empty!24403)))

(declare-fun b!1033130 () Bool)

(declare-fun e!583673 () Bool)

(assert (=> b!1033130 (= e!583671 e!583673)))

(declare-fun res!690341 () Bool)

(assert (=> b!1033130 (=> (not res!690341) (not e!583673))))

(declare-datatypes ((SeekEntryResult!9670 0))(
  ( (MissingZero!9670 (index!41051 (_ BitVec 32))) (Found!9670 (index!41052 (_ BitVec 32))) (Intermediate!9670 (undefined!10482 Bool) (index!41053 (_ BitVec 32)) (x!91884 (_ BitVec 32))) (Undefined!9670) (MissingVacant!9670 (index!41054 (_ BitVec 32))) )
))
(declare-fun lt!456209 () SeekEntryResult!9670)

(get-info :version)

(assert (=> b!1033130 (= res!690341 ((_ is Found!9670) lt!456209))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64919 (_ BitVec 32)) SeekEntryResult!9670)

(assert (=> b!1033130 (= lt!456209 (seekEntry!0 key!909 (_keys!11380 thiss!1427) (mask!30033 thiss!1427)))))

(declare-fun mapIsEmpty!38058 () Bool)

(declare-fun mapRes!38058 () Bool)

(assert (=> mapIsEmpty!38058 mapRes!38058))

(declare-fun mapNonEmpty!38058 () Bool)

(declare-fun tp!73119 () Bool)

(assert (=> mapNonEmpty!38058 (= mapRes!38058 (and tp!73119 e!583675))))

(declare-fun mapRest!38058 () (Array (_ BitVec 32) ValueCell!11498))

(declare-fun mapKey!38058 () (_ BitVec 32))

(declare-fun mapValue!38058 () ValueCell!11498)

(assert (=> mapNonEmpty!38058 (= (arr!31256 (_values!6192 thiss!1427)) (store mapRest!38058 mapKey!38058 mapValue!38058))))

(declare-fun b!1033131 () Bool)

(assert (=> b!1033131 (= e!583676 (and e!583672 mapRes!38058))))

(declare-fun condMapEmpty!38058 () Bool)

(declare-fun mapDefault!38058 () ValueCell!11498)

(assert (=> b!1033131 (= condMapEmpty!38058 (= (arr!31256 (_values!6192 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11498)) mapDefault!38058)))))

(declare-fun b!1033132 () Bool)

(assert (=> b!1033132 (= e!583673 (not true))))

(declare-fun lt!456210 () Bool)

(assert (=> b!1033132 (= lt!456210 (valid!2119 (_2!7859 lt!456219)))))

(declare-fun lt!456220 () Unit!33777)

(assert (=> b!1033132 (= lt!456220 e!583677)))

(declare-fun c!104663 () Bool)

(declare-datatypes ((tuple2!15698 0))(
  ( (tuple2!15699 (_1!7860 (_ BitVec 64)) (_2!7860 V!37411)) )
))
(declare-datatypes ((List!21870 0))(
  ( (Nil!21867) (Cons!21866 (h!23077 tuple2!15698) (t!31040 List!21870)) )
))
(declare-datatypes ((ListLongMap!13749 0))(
  ( (ListLongMap!13750 (toList!6890 List!21870)) )
))
(declare-fun contains!6025 (ListLongMap!13749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3936 (array!64919 array!64921 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 32) Int) ListLongMap!13749)

(assert (=> b!1033132 (= c!104663 (contains!6025 (getCurrentListMap!3936 (_keys!11380 (_2!7859 lt!456219)) (_values!6192 (_2!7859 lt!456219)) (mask!30033 (_2!7859 lt!456219)) (extraKeys!5901 (_2!7859 lt!456219)) (zeroValue!6005 (_2!7859 lt!456219)) (minValue!6005 (_2!7859 lt!456219)) #b00000000000000000000000000000000 (defaultEntry!6169 (_2!7859 lt!456219))) key!909))))

(declare-fun lt!456212 () array!64919)

(declare-fun lt!456218 () array!64921)

(declare-fun Unit!33780 () Unit!33777)

(declare-fun Unit!33781 () Unit!33777)

(assert (=> b!1033132 (= lt!456219 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2850 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15697 Unit!33780 (LongMapFixedSize!5591 (defaultEntry!6169 thiss!1427) (mask!30033 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (bvsub (_size!2850 thiss!1427) #b00000000000000000000000000000001) lt!456212 lt!456218 (bvadd #b00000000000000000000000000000001 (_vacant!2850 thiss!1427)))) (tuple2!15697 Unit!33781 (LongMapFixedSize!5591 (defaultEntry!6169 thiss!1427) (mask!30033 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (bvsub (_size!2850 thiss!1427) #b00000000000000000000000000000001) lt!456212 lt!456218 (_vacant!2850 thiss!1427)))))))

(declare-fun -!513 (ListLongMap!13749 (_ BitVec 64)) ListLongMap!13749)

(assert (=> b!1033132 (= (-!513 (getCurrentListMap!3936 (_keys!11380 thiss!1427) (_values!6192 thiss!1427) (mask!30033 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6169 thiss!1427)) key!909) (getCurrentListMap!3936 lt!456212 lt!456218 (mask!30033 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6169 thiss!1427)))))

(declare-fun dynLambda!2007 (Int (_ BitVec 64)) V!37411)

(assert (=> b!1033132 (= lt!456218 (array!64922 (store (arr!31256 (_values!6192 thiss!1427)) (index!41052 lt!456209) (ValueCellFull!11498 (dynLambda!2007 (defaultEntry!6169 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31774 (_values!6192 thiss!1427))))))

(declare-fun lt!456216 () Unit!33777)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!39 (array!64919 array!64921 (_ BitVec 32) (_ BitVec 32) V!37411 V!37411 (_ BitVec 32) (_ BitVec 64) Int) Unit!33777)

(assert (=> b!1033132 (= lt!456216 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!39 (_keys!11380 thiss!1427) (_values!6192 thiss!1427) (mask!30033 thiss!1427) (extraKeys!5901 thiss!1427) (zeroValue!6005 thiss!1427) (minValue!6005 thiss!1427) (index!41052 lt!456209) key!909 (defaultEntry!6169 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033132 (not (arrayContainsKey!0 lt!456212 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!456217 () Unit!33777)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64919 (_ BitVec 32) (_ BitVec 64)) Unit!33777)

(assert (=> b!1033132 (= lt!456217 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11380 thiss!1427) (index!41052 lt!456209) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64919 (_ BitVec 32)) Bool)

(assert (=> b!1033132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!456212 (mask!30033 thiss!1427))))

(declare-fun lt!456211 () Unit!33777)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64919 (_ BitVec 32) (_ BitVec 32)) Unit!33777)

(assert (=> b!1033132 (= lt!456211 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11380 thiss!1427) (index!41052 lt!456209) (mask!30033 thiss!1427)))))

(declare-datatypes ((List!21871 0))(
  ( (Nil!21868) (Cons!21867 (h!23078 (_ BitVec 64)) (t!31041 List!21871)) )
))
(declare-fun arrayNoDuplicates!0 (array!64919 (_ BitVec 32) List!21871) Bool)

(assert (=> b!1033132 (arrayNoDuplicates!0 lt!456212 #b00000000000000000000000000000000 Nil!21868)))

(declare-fun lt!456215 () Unit!33777)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64919 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21871) Unit!33777)

(assert (=> b!1033132 (= lt!456215 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11380 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41052 lt!456209) #b00000000000000000000000000000000 Nil!21868))))

(declare-fun arrayCountValidKeys!0 (array!64919 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033132 (= (arrayCountValidKeys!0 lt!456212 #b00000000000000000000000000000000 (size!31773 (_keys!11380 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11380 thiss!1427) #b00000000000000000000000000000000 (size!31773 (_keys!11380 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1033132 (= lt!456212 (array!64920 (store (arr!31255 (_keys!11380 thiss!1427)) (index!41052 lt!456209) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31773 (_keys!11380 thiss!1427))))))

(declare-fun lt!456213 () Unit!33777)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64919 (_ BitVec 32) (_ BitVec 64)) Unit!33777)

(assert (=> b!1033132 (= lt!456213 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11380 thiss!1427) (index!41052 lt!456209) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033133 () Bool)

(assert (=> b!1033133 (= e!583679 (arrayContainsKey!0 (_keys!11380 (_2!7859 lt!456219)) key!909 #b00000000000000000000000000000000))))

(declare-fun b!1033134 () Bool)

(declare-fun Unit!33782 () Unit!33777)

(assert (=> b!1033134 (= e!583677 Unit!33782)))

(assert (= (and start!90310 res!690339) b!1033124))

(assert (= (and b!1033124 res!690338) b!1033130))

(assert (= (and b!1033130 res!690341) b!1033132))

(assert (= (and b!1033132 c!104663) b!1033128))

(assert (= (and b!1033132 (not c!104663)) b!1033134))

(assert (= (and b!1033128 c!104662) b!1033133))

(assert (= (and b!1033128 (not c!104662)) b!1033127))

(assert (= (and b!1033128 res!690340) b!1033125))

(assert (= (and b!1033131 condMapEmpty!38058) mapIsEmpty!38058))

(assert (= (and b!1033131 (not condMapEmpty!38058)) mapNonEmpty!38058))

(assert (= (and mapNonEmpty!38058 ((_ is ValueCellFull!11498) mapValue!38058)) b!1033126))

(assert (= (and b!1033131 ((_ is ValueCellFull!11498) mapDefault!38058)) b!1033129))

(assert (= b!1033123 b!1033131))

(assert (= start!90310 b!1033123))

(declare-fun b_lambda!16037 () Bool)

(assert (=> (not b_lambda!16037) (not b!1033132)))

(declare-fun t!31039 () Bool)

(declare-fun tb!6993 () Bool)

(assert (=> (and b!1033123 (= (defaultEntry!6169 thiss!1427) (defaultEntry!6169 thiss!1427)) t!31039) tb!6993))

(declare-fun result!14323 () Bool)

(assert (=> tb!6993 (= result!14323 tp_is_empty!24403)))

(assert (=> b!1033132 t!31039))

(declare-fun b_and!33145 () Bool)

(assert (= b_and!33143 (and (=> t!31039 result!14323) b_and!33145)))

(declare-fun m!953753 () Bool)

(assert (=> b!1033128 m!953753))

(declare-fun m!953755 () Bool)

(assert (=> mapNonEmpty!38058 m!953755))

(declare-fun m!953757 () Bool)

(assert (=> b!1033132 m!953757))

(declare-fun m!953759 () Bool)

(assert (=> b!1033132 m!953759))

(declare-fun m!953761 () Bool)

(assert (=> b!1033132 m!953761))

(declare-fun m!953763 () Bool)

(assert (=> b!1033132 m!953763))

(declare-fun m!953765 () Bool)

(assert (=> b!1033132 m!953765))

(declare-fun m!953767 () Bool)

(assert (=> b!1033132 m!953767))

(declare-fun m!953769 () Bool)

(assert (=> b!1033132 m!953769))

(assert (=> b!1033132 m!953767))

(declare-fun m!953771 () Bool)

(assert (=> b!1033132 m!953771))

(declare-fun m!953773 () Bool)

(assert (=> b!1033132 m!953773))

(declare-fun m!953775 () Bool)

(assert (=> b!1033132 m!953775))

(declare-fun m!953777 () Bool)

(assert (=> b!1033132 m!953777))

(declare-fun m!953779 () Bool)

(assert (=> b!1033132 m!953779))

(declare-fun m!953781 () Bool)

(assert (=> b!1033132 m!953781))

(declare-fun m!953783 () Bool)

(assert (=> b!1033132 m!953783))

(declare-fun m!953785 () Bool)

(assert (=> b!1033132 m!953785))

(declare-fun m!953787 () Bool)

(assert (=> b!1033132 m!953787))

(declare-fun m!953789 () Bool)

(assert (=> b!1033132 m!953789))

(assert (=> b!1033132 m!953775))

(declare-fun m!953791 () Bool)

(assert (=> b!1033132 m!953791))

(declare-fun m!953793 () Bool)

(assert (=> b!1033132 m!953793))

(declare-fun m!953795 () Bool)

(assert (=> b!1033130 m!953795))

(declare-fun m!953797 () Bool)

(assert (=> start!90310 m!953797))

(declare-fun m!953799 () Bool)

(assert (=> b!1033123 m!953799))

(declare-fun m!953801 () Bool)

(assert (=> b!1033123 m!953801))

(declare-fun m!953803 () Bool)

(assert (=> b!1033133 m!953803))

(check-sat (not b!1033133) (not b_lambda!16037) (not b!1033128) b_and!33145 tp_is_empty!24403 (not b_next!20683) (not mapNonEmpty!38058) (not b!1033132) (not b!1033130) (not b!1033123) (not start!90310))
(check-sat b_and!33145 (not b_next!20683))
