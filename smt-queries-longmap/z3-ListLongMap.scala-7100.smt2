; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90280 () Bool)

(assert start!90280)

(declare-fun b!1032593 () Bool)

(declare-fun b_free!20653 () Bool)

(declare-fun b_next!20653 () Bool)

(assert (=> b!1032593 (= b_free!20653 (not b_next!20653))))

(declare-fun tp!73029 () Bool)

(declare-fun b_and!33083 () Bool)

(assert (=> b!1032593 (= tp!73029 b_and!33083)))

(declare-fun b!1032587 () Bool)

(declare-fun res!690059 () Bool)

(declare-fun e!583291 () Bool)

(assert (=> b!1032587 (=> res!690059 e!583291)))

(declare-datatypes ((V!37371 0))(
  ( (V!37372 (val!12237 Int)) )
))
(declare-datatypes ((ValueCell!11483 0))(
  ( (ValueCellFull!11483 (v!14810 V!37371)) (EmptyCell!11483) )
))
(declare-datatypes ((Unit!33724 0))(
  ( (Unit!33725) )
))
(declare-datatypes ((array!64859 0))(
  ( (array!64860 (arr!31225 (Array (_ BitVec 32) (_ BitVec 64))) (size!31743 (_ BitVec 32))) )
))
(declare-datatypes ((array!64861 0))(
  ( (array!64862 (arr!31226 (Array (_ BitVec 32) ValueCell!11483)) (size!31744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5560 0))(
  ( (LongMapFixedSize!5561 (defaultEntry!6154 Int) (mask!30008 (_ BitVec 32)) (extraKeys!5886 (_ BitVec 32)) (zeroValue!5990 V!37371) (minValue!5990 V!37371) (_size!2835 (_ BitVec 32)) (_keys!11365 array!64859) (_values!6177 array!64861) (_vacant!2835 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15648 0))(
  ( (tuple2!15649 (_1!7835 Unit!33724) (_2!7835 LongMapFixedSize!5560)) )
))
(declare-fun lt!455745 () tuple2!15648)

(assert (=> b!1032587 (= res!690059 (or (not (= (size!31744 (_values!6177 (_2!7835 lt!455745))) (bvadd #b00000000000000000000000000000001 (mask!30008 (_2!7835 lt!455745))))) (not (= (size!31743 (_keys!11365 (_2!7835 lt!455745))) (size!31744 (_values!6177 (_2!7835 lt!455745))))) (bvslt (mask!30008 (_2!7835 lt!455745)) #b00000000000000000000000000000000) (bvslt (extraKeys!5886 (_2!7835 lt!455745)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5886 (_2!7835 lt!455745)) #b00000000000000000000000000000011)))))

(declare-fun b!1032588 () Bool)

(assert (=> b!1032588 (= e!583291 true)))

(declare-fun lt!455739 () Bool)

(declare-datatypes ((List!21848 0))(
  ( (Nil!21845) (Cons!21844 (h!23055 (_ BitVec 64)) (t!30988 List!21848)) )
))
(declare-fun arrayNoDuplicates!0 (array!64859 (_ BitVec 32) List!21848) Bool)

(assert (=> b!1032588 (= lt!455739 (arrayNoDuplicates!0 (_keys!11365 (_2!7835 lt!455745)) #b00000000000000000000000000000000 Nil!21845))))

(declare-fun b!1032589 () Bool)

(declare-fun res!690057 () Bool)

(declare-fun e!583289 () Bool)

(assert (=> b!1032589 (=> (not res!690057) (not e!583289))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032589 (= res!690057 (not (= key!909 (bvneg key!909))))))

(declare-fun res!690058 () Bool)

(assert (=> start!90280 (=> (not res!690058) (not e!583289))))

(declare-fun thiss!1427 () LongMapFixedSize!5560)

(declare-fun valid!2109 (LongMapFixedSize!5560) Bool)

(assert (=> start!90280 (= res!690058 (valid!2109 thiss!1427))))

(assert (=> start!90280 e!583289))

(declare-fun e!583292 () Bool)

(assert (=> start!90280 e!583292))

(assert (=> start!90280 true))

(declare-fun b!1032590 () Bool)

(declare-fun e!583296 () Bool)

(assert (=> b!1032590 (= e!583289 e!583296)))

(declare-fun res!690062 () Bool)

(assert (=> b!1032590 (=> (not res!690062) (not e!583296))))

(declare-datatypes ((SeekEntryResult!9658 0))(
  ( (MissingZero!9658 (index!41003 (_ BitVec 32))) (Found!9658 (index!41004 (_ BitVec 32))) (Intermediate!9658 (undefined!10470 Bool) (index!41005 (_ BitVec 32)) (x!91802 (_ BitVec 32))) (Undefined!9658) (MissingVacant!9658 (index!41006 (_ BitVec 32))) )
))
(declare-fun lt!455741 () SeekEntryResult!9658)

(get-info :version)

(assert (=> b!1032590 (= res!690062 ((_ is Found!9658) lt!455741))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64859 (_ BitVec 32)) SeekEntryResult!9658)

(assert (=> b!1032590 (= lt!455741 (seekEntry!0 key!909 (_keys!11365 thiss!1427) (mask!30008 thiss!1427)))))

(declare-fun b!1032591 () Bool)

(assert (=> b!1032591 (= e!583296 (not e!583291))))

(declare-fun res!690056 () Bool)

(assert (=> b!1032591 (=> res!690056 e!583291)))

(declare-datatypes ((tuple2!15650 0))(
  ( (tuple2!15651 (_1!7836 (_ BitVec 64)) (_2!7836 V!37371)) )
))
(declare-datatypes ((List!21849 0))(
  ( (Nil!21846) (Cons!21845 (h!23056 tuple2!15650) (t!30989 List!21849)) )
))
(declare-datatypes ((ListLongMap!13729 0))(
  ( (ListLongMap!13730 (toList!6880 List!21849)) )
))
(declare-fun contains!6015 (ListLongMap!13729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3926 (array!64859 array!64861 (_ BitVec 32) (_ BitVec 32) V!37371 V!37371 (_ BitVec 32) Int) ListLongMap!13729)

(assert (=> b!1032591 (= res!690056 (not (contains!6015 (getCurrentListMap!3926 (_keys!11365 (_2!7835 lt!455745)) (_values!6177 (_2!7835 lt!455745)) (mask!30008 (_2!7835 lt!455745)) (extraKeys!5886 (_2!7835 lt!455745)) (zeroValue!5990 (_2!7835 lt!455745)) (minValue!5990 (_2!7835 lt!455745)) #b00000000000000000000000000000000 (defaultEntry!6154 (_2!7835 lt!455745))) key!909)))))

(declare-fun lt!455743 () array!64859)

(declare-fun lt!455744 () array!64861)

(declare-fun Unit!33726 () Unit!33724)

(declare-fun Unit!33727 () Unit!33724)

(assert (=> b!1032591 (= lt!455745 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2835 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15649 Unit!33726 (LongMapFixedSize!5561 (defaultEntry!6154 thiss!1427) (mask!30008 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (bvsub (_size!2835 thiss!1427) #b00000000000000000000000000000001) lt!455743 lt!455744 (bvadd #b00000000000000000000000000000001 (_vacant!2835 thiss!1427)))) (tuple2!15649 Unit!33727 (LongMapFixedSize!5561 (defaultEntry!6154 thiss!1427) (mask!30008 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (bvsub (_size!2835 thiss!1427) #b00000000000000000000000000000001) lt!455743 lt!455744 (_vacant!2835 thiss!1427)))))))

(declare-fun -!503 (ListLongMap!13729 (_ BitVec 64)) ListLongMap!13729)

(assert (=> b!1032591 (= (-!503 (getCurrentListMap!3926 (_keys!11365 thiss!1427) (_values!6177 thiss!1427) (mask!30008 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6154 thiss!1427)) key!909) (getCurrentListMap!3926 lt!455743 lt!455744 (mask!30008 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6154 thiss!1427)))))

(declare-fun dynLambda!1997 (Int (_ BitVec 64)) V!37371)

(assert (=> b!1032591 (= lt!455744 (array!64862 (store (arr!31226 (_values!6177 thiss!1427)) (index!41004 lt!455741) (ValueCellFull!11483 (dynLambda!1997 (defaultEntry!6154 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31744 (_values!6177 thiss!1427))))))

(declare-fun lt!455746 () Unit!33724)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!29 (array!64859 array!64861 (_ BitVec 32) (_ BitVec 32) V!37371 V!37371 (_ BitVec 32) (_ BitVec 64) Int) Unit!33724)

(assert (=> b!1032591 (= lt!455746 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!29 (_keys!11365 thiss!1427) (_values!6177 thiss!1427) (mask!30008 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (index!41004 lt!455741) key!909 (defaultEntry!6154 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032591 (not (arrayContainsKey!0 lt!455743 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455737 () Unit!33724)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64859 (_ BitVec 32) (_ BitVec 64)) Unit!33724)

(assert (=> b!1032591 (= lt!455737 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11365 thiss!1427) (index!41004 lt!455741) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64859 (_ BitVec 32)) Bool)

(assert (=> b!1032591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455743 (mask!30008 thiss!1427))))

(declare-fun lt!455740 () Unit!33724)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64859 (_ BitVec 32) (_ BitVec 32)) Unit!33724)

(assert (=> b!1032591 (= lt!455740 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11365 thiss!1427) (index!41004 lt!455741) (mask!30008 thiss!1427)))))

(assert (=> b!1032591 (arrayNoDuplicates!0 lt!455743 #b00000000000000000000000000000000 Nil!21845)))

(declare-fun lt!455742 () Unit!33724)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64859 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21848) Unit!33724)

(assert (=> b!1032591 (= lt!455742 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11365 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41004 lt!455741) #b00000000000000000000000000000000 Nil!21845))))

(declare-fun arrayCountValidKeys!0 (array!64859 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032591 (= (arrayCountValidKeys!0 lt!455743 #b00000000000000000000000000000000 (size!31743 (_keys!11365 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11365 thiss!1427) #b00000000000000000000000000000000 (size!31743 (_keys!11365 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032591 (= lt!455743 (array!64860 (store (arr!31225 (_keys!11365 thiss!1427)) (index!41004 lt!455741) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31743 (_keys!11365 thiss!1427))))))

(declare-fun lt!455738 () Unit!33724)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64859 (_ BitVec 32) (_ BitVec 64)) Unit!33724)

(assert (=> b!1032591 (= lt!455738 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11365 thiss!1427) (index!41004 lt!455741) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38013 () Bool)

(declare-fun mapRes!38013 () Bool)

(assert (=> mapIsEmpty!38013 mapRes!38013))

(declare-fun b!1032592 () Bool)

(declare-fun res!690061 () Bool)

(assert (=> b!1032592 (=> res!690061 e!583291)))

(assert (=> b!1032592 (= res!690061 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11365 (_2!7835 lt!455745)) (mask!30008 (_2!7835 lt!455745)))))))

(declare-fun mapNonEmpty!38013 () Bool)

(declare-fun tp!73030 () Bool)

(declare-fun e!583290 () Bool)

(assert (=> mapNonEmpty!38013 (= mapRes!38013 (and tp!73030 e!583290))))

(declare-fun mapRest!38013 () (Array (_ BitVec 32) ValueCell!11483))

(declare-fun mapValue!38013 () ValueCell!11483)

(declare-fun mapKey!38013 () (_ BitVec 32))

(assert (=> mapNonEmpty!38013 (= (arr!31226 (_values!6177 thiss!1427)) (store mapRest!38013 mapKey!38013 mapValue!38013))))

(declare-fun e!583295 () Bool)

(declare-fun tp_is_empty!24373 () Bool)

(declare-fun array_inv!24175 (array!64859) Bool)

(declare-fun array_inv!24176 (array!64861) Bool)

(assert (=> b!1032593 (= e!583292 (and tp!73029 tp_is_empty!24373 (array_inv!24175 (_keys!11365 thiss!1427)) (array_inv!24176 (_values!6177 thiss!1427)) e!583295))))

(declare-fun b!1032594 () Bool)

(declare-fun e!583293 () Bool)

(assert (=> b!1032594 (= e!583295 (and e!583293 mapRes!38013))))

(declare-fun condMapEmpty!38013 () Bool)

(declare-fun mapDefault!38013 () ValueCell!11483)

(assert (=> b!1032594 (= condMapEmpty!38013 (= (arr!31226 (_values!6177 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11483)) mapDefault!38013)))))

(declare-fun b!1032595 () Bool)

(assert (=> b!1032595 (= e!583293 tp_is_empty!24373)))

(declare-fun b!1032596 () Bool)

(assert (=> b!1032596 (= e!583290 tp_is_empty!24373)))

(declare-fun b!1032597 () Bool)

(declare-fun res!690060 () Bool)

(assert (=> b!1032597 (=> res!690060 e!583291)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032597 (= res!690060 (not (validMask!0 (mask!30008 (_2!7835 lt!455745)))))))

(assert (= (and start!90280 res!690058) b!1032589))

(assert (= (and b!1032589 res!690057) b!1032590))

(assert (= (and b!1032590 res!690062) b!1032591))

(assert (= (and b!1032591 (not res!690056)) b!1032597))

(assert (= (and b!1032597 (not res!690060)) b!1032587))

(assert (= (and b!1032587 (not res!690059)) b!1032592))

(assert (= (and b!1032592 (not res!690061)) b!1032588))

(assert (= (and b!1032594 condMapEmpty!38013) mapIsEmpty!38013))

(assert (= (and b!1032594 (not condMapEmpty!38013)) mapNonEmpty!38013))

(assert (= (and mapNonEmpty!38013 ((_ is ValueCellFull!11483) mapValue!38013)) b!1032596))

(assert (= (and b!1032594 ((_ is ValueCellFull!11483) mapDefault!38013)) b!1032595))

(assert (= b!1032593 b!1032594))

(assert (= start!90280 b!1032593))

(declare-fun b_lambda!16007 () Bool)

(assert (=> (not b_lambda!16007) (not b!1032591)))

(declare-fun t!30987 () Bool)

(declare-fun tb!6963 () Bool)

(assert (=> (and b!1032593 (= (defaultEntry!6154 thiss!1427) (defaultEntry!6154 thiss!1427)) t!30987) tb!6963))

(declare-fun result!14263 () Bool)

(assert (=> tb!6963 (= result!14263 tp_is_empty!24373)))

(assert (=> b!1032591 t!30987))

(declare-fun b_and!33085 () Bool)

(assert (= b_and!33083 (and (=> t!30987 result!14263) b_and!33085)))

(declare-fun m!952973 () Bool)

(assert (=> b!1032593 m!952973))

(declare-fun m!952975 () Bool)

(assert (=> b!1032593 m!952975))

(declare-fun m!952977 () Bool)

(assert (=> b!1032591 m!952977))

(declare-fun m!952979 () Bool)

(assert (=> b!1032591 m!952979))

(declare-fun m!952981 () Bool)

(assert (=> b!1032591 m!952981))

(declare-fun m!952983 () Bool)

(assert (=> b!1032591 m!952983))

(declare-fun m!952985 () Bool)

(assert (=> b!1032591 m!952985))

(declare-fun m!952987 () Bool)

(assert (=> b!1032591 m!952987))

(declare-fun m!952989 () Bool)

(assert (=> b!1032591 m!952989))

(declare-fun m!952991 () Bool)

(assert (=> b!1032591 m!952991))

(declare-fun m!952993 () Bool)

(assert (=> b!1032591 m!952993))

(declare-fun m!952995 () Bool)

(assert (=> b!1032591 m!952995))

(declare-fun m!952997 () Bool)

(assert (=> b!1032591 m!952997))

(declare-fun m!952999 () Bool)

(assert (=> b!1032591 m!952999))

(assert (=> b!1032591 m!952985))

(declare-fun m!953001 () Bool)

(assert (=> b!1032591 m!953001))

(declare-fun m!953003 () Bool)

(assert (=> b!1032591 m!953003))

(declare-fun m!953005 () Bool)

(assert (=> b!1032591 m!953005))

(declare-fun m!953007 () Bool)

(assert (=> b!1032591 m!953007))

(declare-fun m!953009 () Bool)

(assert (=> b!1032591 m!953009))

(assert (=> b!1032591 m!952995))

(declare-fun m!953011 () Bool)

(assert (=> b!1032591 m!953011))

(declare-fun m!953013 () Bool)

(assert (=> mapNonEmpty!38013 m!953013))

(declare-fun m!953015 () Bool)

(assert (=> b!1032592 m!953015))

(declare-fun m!953017 () Bool)

(assert (=> b!1032597 m!953017))

(declare-fun m!953019 () Bool)

(assert (=> start!90280 m!953019))

(declare-fun m!953021 () Bool)

(assert (=> b!1032590 m!953021))

(declare-fun m!953023 () Bool)

(assert (=> b!1032588 m!953023))

(check-sat (not b!1032597) b_and!33085 (not mapNonEmpty!38013) (not b!1032593) (not b!1032591) (not b_next!20653) (not b_lambda!16007) (not b!1032592) (not b!1032590) (not start!90280) tp_is_empty!24373 (not b!1032588))
(check-sat b_and!33085 (not b_next!20653))
