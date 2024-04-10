; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90060 () Bool)

(assert start!90060)

(declare-fun b!1031517 () Bool)

(declare-fun b_free!20667 () Bool)

(declare-fun b_next!20667 () Bool)

(assert (=> b!1031517 (= b_free!20667 (not b_next!20667))))

(declare-fun tp!73072 () Bool)

(declare-fun b_and!33101 () Bool)

(assert (=> b!1031517 (= tp!73072 b_and!33101)))

(declare-fun tp_is_empty!24387 () Bool)

(declare-fun e!582619 () Bool)

(declare-fun e!582614 () Bool)

(declare-datatypes ((V!37389 0))(
  ( (V!37390 (val!12244 Int)) )
))
(declare-datatypes ((ValueCell!11490 0))(
  ( (ValueCellFull!11490 (v!14821 V!37389)) (EmptyCell!11490) )
))
(declare-datatypes ((array!64838 0))(
  ( (array!64839 (arr!31221 (Array (_ BitVec 32) (_ BitVec 64))) (size!31738 (_ BitVec 32))) )
))
(declare-datatypes ((array!64840 0))(
  ( (array!64841 (arr!31222 (Array (_ BitVec 32) ValueCell!11490)) (size!31739 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5574 0))(
  ( (LongMapFixedSize!5575 (defaultEntry!6161 Int) (mask!29959 (_ BitVec 32)) (extraKeys!5893 (_ BitVec 32)) (zeroValue!5997 V!37389) (minValue!5997 V!37389) (_size!2842 (_ BitVec 32)) (_keys!11334 array!64838) (_values!6184 array!64840) (_vacant!2842 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5574)

(declare-fun array_inv!24167 (array!64838) Bool)

(declare-fun array_inv!24168 (array!64840) Bool)

(assert (=> b!1031517 (= e!582619 (and tp!73072 tp_is_empty!24387 (array_inv!24167 (_keys!11334 thiss!1427)) (array_inv!24168 (_values!6184 thiss!1427)) e!582614))))

(declare-fun b!1031518 () Bool)

(declare-fun e!582617 () Bool)

(declare-fun e!582615 () Bool)

(assert (=> b!1031518 (= e!582617 (not e!582615))))

(declare-fun res!689698 () Bool)

(assert (=> b!1031518 (=> res!689698 e!582615)))

(declare-datatypes ((Unit!33737 0))(
  ( (Unit!33738) )
))
(declare-datatypes ((tuple2!15664 0))(
  ( (tuple2!15665 (_1!7843 Unit!33737) (_2!7843 LongMapFixedSize!5574)) )
))
(declare-fun lt!455440 () tuple2!15664)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15666 0))(
  ( (tuple2!15667 (_1!7844 (_ BitVec 64)) (_2!7844 V!37389)) )
))
(declare-datatypes ((List!21869 0))(
  ( (Nil!21866) (Cons!21865 (h!23067 tuple2!15666) (t!31031 List!21869)) )
))
(declare-datatypes ((ListLongMap!13727 0))(
  ( (ListLongMap!13728 (toList!6879 List!21869)) )
))
(declare-fun contains!5993 (ListLongMap!13727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3927 (array!64838 array!64840 (_ BitVec 32) (_ BitVec 32) V!37389 V!37389 (_ BitVec 32) Int) ListLongMap!13727)

(assert (=> b!1031518 (= res!689698 (not (contains!5993 (getCurrentListMap!3927 (_keys!11334 (_2!7843 lt!455440)) (_values!6184 (_2!7843 lt!455440)) (mask!29959 (_2!7843 lt!455440)) (extraKeys!5893 (_2!7843 lt!455440)) (zeroValue!5997 (_2!7843 lt!455440)) (minValue!5997 (_2!7843 lt!455440)) #b00000000000000000000000000000000 (defaultEntry!6161 (_2!7843 lt!455440))) key!909)))))

(declare-fun lt!455437 () array!64838)

(declare-fun lt!455441 () array!64840)

(declare-fun Unit!33739 () Unit!33737)

(declare-fun Unit!33740 () Unit!33737)

(assert (=> b!1031518 (= lt!455440 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2842 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15665 Unit!33739 (LongMapFixedSize!5575 (defaultEntry!6161 thiss!1427) (mask!29959 thiss!1427) (extraKeys!5893 thiss!1427) (zeroValue!5997 thiss!1427) (minValue!5997 thiss!1427) (bvsub (_size!2842 thiss!1427) #b00000000000000000000000000000001) lt!455437 lt!455441 (bvadd #b00000000000000000000000000000001 (_vacant!2842 thiss!1427)))) (tuple2!15665 Unit!33740 (LongMapFixedSize!5575 (defaultEntry!6161 thiss!1427) (mask!29959 thiss!1427) (extraKeys!5893 thiss!1427) (zeroValue!5997 thiss!1427) (minValue!5997 thiss!1427) (bvsub (_size!2842 thiss!1427) #b00000000000000000000000000000001) lt!455437 lt!455441 (_vacant!2842 thiss!1427)))))))

(declare-fun -!506 (ListLongMap!13727 (_ BitVec 64)) ListLongMap!13727)

(assert (=> b!1031518 (= (-!506 (getCurrentListMap!3927 (_keys!11334 thiss!1427) (_values!6184 thiss!1427) (mask!29959 thiss!1427) (extraKeys!5893 thiss!1427) (zeroValue!5997 thiss!1427) (minValue!5997 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6161 thiss!1427)) key!909) (getCurrentListMap!3927 lt!455437 lt!455441 (mask!29959 thiss!1427) (extraKeys!5893 thiss!1427) (zeroValue!5997 thiss!1427) (minValue!5997 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6161 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9709 0))(
  ( (MissingZero!9709 (index!41207 (_ BitVec 32))) (Found!9709 (index!41208 (_ BitVec 32))) (Intermediate!9709 (undefined!10521 Bool) (index!41209 (_ BitVec 32)) (x!91861 (_ BitVec 32))) (Undefined!9709) (MissingVacant!9709 (index!41210 (_ BitVec 32))) )
))
(declare-fun lt!455433 () SeekEntryResult!9709)

(declare-fun dynLambda!1976 (Int (_ BitVec 64)) V!37389)

(assert (=> b!1031518 (= lt!455441 (array!64841 (store (arr!31222 (_values!6184 thiss!1427)) (index!41208 lt!455433) (ValueCellFull!11490 (dynLambda!1976 (defaultEntry!6161 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31739 (_values!6184 thiss!1427))))))

(declare-fun lt!455436 () Unit!33737)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!32 (array!64838 array!64840 (_ BitVec 32) (_ BitVec 32) V!37389 V!37389 (_ BitVec 32) (_ BitVec 64) Int) Unit!33737)

(assert (=> b!1031518 (= lt!455436 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!32 (_keys!11334 thiss!1427) (_values!6184 thiss!1427) (mask!29959 thiss!1427) (extraKeys!5893 thiss!1427) (zeroValue!5997 thiss!1427) (minValue!5997 thiss!1427) (index!41208 lt!455433) key!909 (defaultEntry!6161 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031518 (not (arrayContainsKey!0 lt!455437 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455438 () Unit!33737)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64838 (_ BitVec 32) (_ BitVec 64)) Unit!33737)

(assert (=> b!1031518 (= lt!455438 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11334 thiss!1427) (index!41208 lt!455433) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64838 (_ BitVec 32)) Bool)

(assert (=> b!1031518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455437 (mask!29959 thiss!1427))))

(declare-fun lt!455434 () Unit!33737)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64838 (_ BitVec 32) (_ BitVec 32)) Unit!33737)

(assert (=> b!1031518 (= lt!455434 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11334 thiss!1427) (index!41208 lt!455433) (mask!29959 thiss!1427)))))

(declare-datatypes ((List!21870 0))(
  ( (Nil!21867) (Cons!21866 (h!23068 (_ BitVec 64)) (t!31032 List!21870)) )
))
(declare-fun arrayNoDuplicates!0 (array!64838 (_ BitVec 32) List!21870) Bool)

(assert (=> b!1031518 (arrayNoDuplicates!0 lt!455437 #b00000000000000000000000000000000 Nil!21867)))

(declare-fun lt!455435 () Unit!33737)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64838 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21870) Unit!33737)

(assert (=> b!1031518 (= lt!455435 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11334 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41208 lt!455433) #b00000000000000000000000000000000 Nil!21867))))

(declare-fun arrayCountValidKeys!0 (array!64838 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031518 (= (arrayCountValidKeys!0 lt!455437 #b00000000000000000000000000000000 (size!31738 (_keys!11334 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11334 thiss!1427) #b00000000000000000000000000000000 (size!31738 (_keys!11334 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031518 (= lt!455437 (array!64839 (store (arr!31221 (_keys!11334 thiss!1427)) (index!41208 lt!455433) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31738 (_keys!11334 thiss!1427))))))

(declare-fun lt!455439 () Unit!33737)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64838 (_ BitVec 32) (_ BitVec 64)) Unit!33737)

(assert (=> b!1031518 (= lt!455439 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11334 thiss!1427) (index!41208 lt!455433) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38034 () Bool)

(declare-fun mapRes!38034 () Bool)

(assert (=> mapIsEmpty!38034 mapRes!38034))

(declare-fun b!1031519 () Bool)

(declare-fun res!689697 () Bool)

(declare-fun e!582616 () Bool)

(assert (=> b!1031519 (=> (not res!689697) (not e!582616))))

(assert (=> b!1031519 (= res!689697 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031521 () Bool)

(declare-fun e!582620 () Bool)

(assert (=> b!1031521 (= e!582620 tp_is_empty!24387)))

(declare-fun b!1031522 () Bool)

(assert (=> b!1031522 (= e!582615 true)))

(declare-fun lt!455432 () Bool)

(assert (=> b!1031522 (= lt!455432 (arrayNoDuplicates!0 (_keys!11334 (_2!7843 lt!455440)) #b00000000000000000000000000000000 Nil!21867))))

(declare-fun b!1031523 () Bool)

(assert (=> b!1031523 (= e!582616 e!582617)))

(declare-fun res!689695 () Bool)

(assert (=> b!1031523 (=> (not res!689695) (not e!582617))))

(get-info :version)

(assert (=> b!1031523 (= res!689695 ((_ is Found!9709) lt!455433))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64838 (_ BitVec 32)) SeekEntryResult!9709)

(assert (=> b!1031523 (= lt!455433 (seekEntry!0 key!909 (_keys!11334 thiss!1427) (mask!29959 thiss!1427)))))

(declare-fun b!1031524 () Bool)

(declare-fun res!689694 () Bool)

(assert (=> b!1031524 (=> res!689694 e!582615)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031524 (= res!689694 (not (validMask!0 (mask!29959 (_2!7843 lt!455440)))))))

(declare-fun b!1031525 () Bool)

(declare-fun res!689699 () Bool)

(assert (=> b!1031525 (=> res!689699 e!582615)))

(assert (=> b!1031525 (= res!689699 (or (not (= (size!31739 (_values!6184 (_2!7843 lt!455440))) (bvadd #b00000000000000000000000000000001 (mask!29959 (_2!7843 lt!455440))))) (not (= (size!31738 (_keys!11334 (_2!7843 lt!455440))) (size!31739 (_values!6184 (_2!7843 lt!455440))))) (bvslt (mask!29959 (_2!7843 lt!455440)) #b00000000000000000000000000000000) (bvslt (extraKeys!5893 (_2!7843 lt!455440)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5893 (_2!7843 lt!455440)) #b00000000000000000000000000000011)))))

(declare-fun b!1031526 () Bool)

(declare-fun res!689696 () Bool)

(assert (=> b!1031526 (=> res!689696 e!582615)))

(assert (=> b!1031526 (= res!689696 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11334 (_2!7843 lt!455440)) (mask!29959 (_2!7843 lt!455440)))))))

(declare-fun b!1031520 () Bool)

(declare-fun e!582618 () Bool)

(assert (=> b!1031520 (= e!582618 tp_is_empty!24387)))

(declare-fun res!689693 () Bool)

(assert (=> start!90060 (=> (not res!689693) (not e!582616))))

(declare-fun valid!2110 (LongMapFixedSize!5574) Bool)

(assert (=> start!90060 (= res!689693 (valid!2110 thiss!1427))))

(assert (=> start!90060 e!582616))

(assert (=> start!90060 e!582619))

(assert (=> start!90060 true))

(declare-fun b!1031527 () Bool)

(assert (=> b!1031527 (= e!582614 (and e!582620 mapRes!38034))))

(declare-fun condMapEmpty!38034 () Bool)

(declare-fun mapDefault!38034 () ValueCell!11490)

(assert (=> b!1031527 (= condMapEmpty!38034 (= (arr!31222 (_values!6184 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11490)) mapDefault!38034)))))

(declare-fun mapNonEmpty!38034 () Bool)

(declare-fun tp!73071 () Bool)

(assert (=> mapNonEmpty!38034 (= mapRes!38034 (and tp!73071 e!582618))))

(declare-fun mapRest!38034 () (Array (_ BitVec 32) ValueCell!11490))

(declare-fun mapKey!38034 () (_ BitVec 32))

(declare-fun mapValue!38034 () ValueCell!11490)

(assert (=> mapNonEmpty!38034 (= (arr!31222 (_values!6184 thiss!1427)) (store mapRest!38034 mapKey!38034 mapValue!38034))))

(assert (= (and start!90060 res!689693) b!1031519))

(assert (= (and b!1031519 res!689697) b!1031523))

(assert (= (and b!1031523 res!689695) b!1031518))

(assert (= (and b!1031518 (not res!689698)) b!1031524))

(assert (= (and b!1031524 (not res!689694)) b!1031525))

(assert (= (and b!1031525 (not res!689699)) b!1031526))

(assert (= (and b!1031526 (not res!689696)) b!1031522))

(assert (= (and b!1031527 condMapEmpty!38034) mapIsEmpty!38034))

(assert (= (and b!1031527 (not condMapEmpty!38034)) mapNonEmpty!38034))

(assert (= (and mapNonEmpty!38034 ((_ is ValueCellFull!11490) mapValue!38034)) b!1031520))

(assert (= (and b!1031527 ((_ is ValueCellFull!11490) mapDefault!38034)) b!1031521))

(assert (= b!1031517 b!1031527))

(assert (= start!90060 b!1031517))

(declare-fun b_lambda!16011 () Bool)

(assert (=> (not b_lambda!16011) (not b!1031518)))

(declare-fun t!31030 () Bool)

(declare-fun tb!6985 () Bool)

(assert (=> (and b!1031517 (= (defaultEntry!6161 thiss!1427) (defaultEntry!6161 thiss!1427)) t!31030) tb!6985))

(declare-fun result!14299 () Bool)

(assert (=> tb!6985 (= result!14299 tp_is_empty!24387)))

(assert (=> b!1031518 t!31030))

(declare-fun b_and!33103 () Bool)

(assert (= b_and!33101 (and (=> t!31030 result!14299) b_and!33103)))

(declare-fun m!951673 () Bool)

(assert (=> b!1031526 m!951673))

(declare-fun m!951675 () Bool)

(assert (=> mapNonEmpty!38034 m!951675))

(declare-fun m!951677 () Bool)

(assert (=> b!1031522 m!951677))

(declare-fun m!951679 () Bool)

(assert (=> b!1031517 m!951679))

(declare-fun m!951681 () Bool)

(assert (=> b!1031517 m!951681))

(declare-fun m!951683 () Bool)

(assert (=> start!90060 m!951683))

(declare-fun m!951685 () Bool)

(assert (=> b!1031523 m!951685))

(declare-fun m!951687 () Bool)

(assert (=> b!1031524 m!951687))

(declare-fun m!951689 () Bool)

(assert (=> b!1031518 m!951689))

(declare-fun m!951691 () Bool)

(assert (=> b!1031518 m!951691))

(declare-fun m!951693 () Bool)

(assert (=> b!1031518 m!951693))

(declare-fun m!951695 () Bool)

(assert (=> b!1031518 m!951695))

(declare-fun m!951697 () Bool)

(assert (=> b!1031518 m!951697))

(declare-fun m!951699 () Bool)

(assert (=> b!1031518 m!951699))

(declare-fun m!951701 () Bool)

(assert (=> b!1031518 m!951701))

(declare-fun m!951703 () Bool)

(assert (=> b!1031518 m!951703))

(declare-fun m!951705 () Bool)

(assert (=> b!1031518 m!951705))

(assert (=> b!1031518 m!951701))

(declare-fun m!951707 () Bool)

(assert (=> b!1031518 m!951707))

(declare-fun m!951709 () Bool)

(assert (=> b!1031518 m!951709))

(declare-fun m!951711 () Bool)

(assert (=> b!1031518 m!951711))

(declare-fun m!951713 () Bool)

(assert (=> b!1031518 m!951713))

(declare-fun m!951715 () Bool)

(assert (=> b!1031518 m!951715))

(declare-fun m!951717 () Bool)

(assert (=> b!1031518 m!951717))

(assert (=> b!1031518 m!951689))

(declare-fun m!951719 () Bool)

(assert (=> b!1031518 m!951719))

(declare-fun m!951721 () Bool)

(assert (=> b!1031518 m!951721))

(declare-fun m!951723 () Bool)

(assert (=> b!1031518 m!951723))

(check-sat (not b!1031523) (not b!1031526) (not b!1031518) tp_is_empty!24387 (not b!1031524) (not b!1031522) (not b!1031517) (not start!90060) b_and!33103 (not mapNonEmpty!38034) (not b_next!20667) (not b_lambda!16011))
(check-sat b_and!33103 (not b_next!20667))
