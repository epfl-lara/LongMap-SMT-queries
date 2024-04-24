; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90002 () Bool)

(assert start!90002)

(declare-fun b!1030176 () Bool)

(declare-fun b_free!20587 () Bool)

(declare-fun b_next!20587 () Bool)

(assert (=> b!1030176 (= b_free!20587 (not b_next!20587))))

(declare-fun tp!72818 () Bool)

(declare-fun b_and!32903 () Bool)

(assert (=> b!1030176 (= tp!72818 b_and!32903)))

(declare-fun b!1030175 () Bool)

(declare-fun e!581654 () Bool)

(declare-datatypes ((V!37283 0))(
  ( (V!37284 (val!12204 Int)) )
))
(declare-datatypes ((ValueCell!11450 0))(
  ( (ValueCellFull!11450 (v!14773 V!37283)) (EmptyCell!11450) )
))
(declare-datatypes ((Unit!33606 0))(
  ( (Unit!33607) )
))
(declare-datatypes ((array!64719 0))(
  ( (array!64720 (arr!31159 (Array (_ BitVec 32) (_ BitVec 64))) (size!31675 (_ BitVec 32))) )
))
(declare-datatypes ((array!64721 0))(
  ( (array!64722 (arr!31160 (Array (_ BitVec 32) ValueCell!11450)) (size!31676 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5494 0))(
  ( (LongMapFixedSize!5495 (defaultEntry!6109 Int) (mask!29915 (_ BitVec 32)) (extraKeys!5841 (_ BitVec 32)) (zeroValue!5945 V!37283) (minValue!5945 V!37283) (_size!2802 (_ BitVec 32)) (_keys!11306 array!64719) (_values!6132 array!64721) (_vacant!2802 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15558 0))(
  ( (tuple2!15559 (_1!7790 Unit!33606) (_2!7790 LongMapFixedSize!5494)) )
))
(declare-fun lt!453854 () tuple2!15558)

(assert (=> b!1030175 (= e!581654 (or (not (= (size!31676 (_values!6132 (_2!7790 lt!453854))) (bvadd #b00000000000000000000000000000001 (mask!29915 (_2!7790 lt!453854))))) (not (= (size!31675 (_keys!11306 (_2!7790 lt!453854))) (size!31676 (_values!6132 (_2!7790 lt!453854))))) (bvsge (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000000000000)))))

(declare-fun tp_is_empty!24307 () Bool)

(declare-fun e!581652 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5494)

(declare-fun e!581655 () Bool)

(declare-fun array_inv!24137 (array!64719) Bool)

(declare-fun array_inv!24138 (array!64721) Bool)

(assert (=> b!1030176 (= e!581655 (and tp!72818 tp_is_empty!24307 (array_inv!24137 (_keys!11306 thiss!1427)) (array_inv!24138 (_values!6132 thiss!1427)) e!581652))))

(declare-fun mapIsEmpty!37900 () Bool)

(declare-fun mapRes!37900 () Bool)

(assert (=> mapIsEmpty!37900 mapRes!37900))

(declare-fun b!1030177 () Bool)

(declare-fun e!581651 () Bool)

(assert (=> b!1030177 (= e!581652 (and e!581651 mapRes!37900))))

(declare-fun condMapEmpty!37900 () Bool)

(declare-fun mapDefault!37900 () ValueCell!11450)

(assert (=> b!1030177 (= condMapEmpty!37900 (= (arr!31160 (_values!6132 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11450)) mapDefault!37900)))))

(declare-fun b!1030178 () Bool)

(declare-fun e!581648 () Bool)

(declare-fun e!581653 () Bool)

(assert (=> b!1030178 (= e!581648 e!581653)))

(declare-fun res!688854 () Bool)

(assert (=> b!1030178 (=> (not res!688854) (not e!581653))))

(declare-datatypes ((SeekEntryResult!9635 0))(
  ( (MissingZero!9635 (index!40911 (_ BitVec 32))) (Found!9635 (index!40912 (_ BitVec 32))) (Intermediate!9635 (undefined!10447 Bool) (index!40913 (_ BitVec 32)) (x!91529 (_ BitVec 32))) (Undefined!9635) (MissingVacant!9635 (index!40914 (_ BitVec 32))) )
))
(declare-fun lt!453860 () SeekEntryResult!9635)

(get-info :version)

(assert (=> b!1030178 (= res!688854 ((_ is Found!9635) lt!453860))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64719 (_ BitVec 32)) SeekEntryResult!9635)

(assert (=> b!1030178 (= lt!453860 (seekEntry!0 key!909 (_keys!11306 thiss!1427) (mask!29915 thiss!1427)))))

(declare-fun b!1030179 () Bool)

(assert (=> b!1030179 (= e!581653 (not e!581654))))

(declare-fun res!688855 () Bool)

(assert (=> b!1030179 (=> res!688855 e!581654)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030179 (= res!688855 (not (validMask!0 (mask!29915 (_2!7790 lt!453854)))))))

(declare-fun lt!453859 () array!64719)

(declare-fun lt!453856 () array!64721)

(declare-fun Unit!33608 () Unit!33606)

(declare-fun Unit!33609 () Unit!33606)

(assert (=> b!1030179 (= lt!453854 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2802 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15559 Unit!33608 (LongMapFixedSize!5495 (defaultEntry!6109 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (bvsub (_size!2802 thiss!1427) #b00000000000000000000000000000001) lt!453859 lt!453856 (bvadd #b00000000000000000000000000000001 (_vacant!2802 thiss!1427)))) (tuple2!15559 Unit!33609 (LongMapFixedSize!5495 (defaultEntry!6109 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (bvsub (_size!2802 thiss!1427) #b00000000000000000000000000000001) lt!453859 lt!453856 (_vacant!2802 thiss!1427)))))))

(declare-datatypes ((tuple2!15560 0))(
  ( (tuple2!15561 (_1!7791 (_ BitVec 64)) (_2!7791 V!37283)) )
))
(declare-datatypes ((List!21806 0))(
  ( (Nil!21803) (Cons!21802 (h!23011 tuple2!15560) (t!30880 List!21806)) )
))
(declare-datatypes ((ListLongMap!13689 0))(
  ( (ListLongMap!13690 (toList!6860 List!21806)) )
))
(declare-fun -!483 (ListLongMap!13689 (_ BitVec 64)) ListLongMap!13689)

(declare-fun getCurrentListMap!3906 (array!64719 array!64721 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) Int) ListLongMap!13689)

(assert (=> b!1030179 (= (-!483 (getCurrentListMap!3906 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) (getCurrentListMap!3906 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun dynLambda!1977 (Int (_ BitVec 64)) V!37283)

(assert (=> b!1030179 (= lt!453856 (array!64722 (store (arr!31160 (_values!6132 thiss!1427)) (index!40912 lt!453860) (ValueCellFull!11450 (dynLambda!1977 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31676 (_values!6132 thiss!1427))))))

(declare-fun lt!453858 () Unit!33606)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (array!64719 array!64721 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) (_ BitVec 64) Int) Unit!33606)

(assert (=> b!1030179 (= lt!453858 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!40912 lt!453860) key!909 (defaultEntry!6109 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030179 (not (arrayContainsKey!0 lt!453859 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453853 () Unit!33606)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64719 (_ BitVec 32) (_ BitVec 64)) Unit!33606)

(assert (=> b!1030179 (= lt!453853 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11306 thiss!1427) (index!40912 lt!453860) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64719 (_ BitVec 32)) Bool)

(assert (=> b!1030179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453859 (mask!29915 thiss!1427))))

(declare-fun lt!453857 () Unit!33606)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64719 (_ BitVec 32) (_ BitVec 32)) Unit!33606)

(assert (=> b!1030179 (= lt!453857 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11306 thiss!1427) (index!40912 lt!453860) (mask!29915 thiss!1427)))))

(declare-datatypes ((List!21807 0))(
  ( (Nil!21804) (Cons!21803 (h!23012 (_ BitVec 64)) (t!30881 List!21807)) )
))
(declare-fun arrayNoDuplicates!0 (array!64719 (_ BitVec 32) List!21807) Bool)

(assert (=> b!1030179 (arrayNoDuplicates!0 lt!453859 #b00000000000000000000000000000000 Nil!21804)))

(declare-fun lt!453852 () Unit!33606)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64719 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21807) Unit!33606)

(assert (=> b!1030179 (= lt!453852 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11306 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40912 lt!453860) #b00000000000000000000000000000000 Nil!21804))))

(declare-fun arrayCountValidKeys!0 (array!64719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030179 (= (arrayCountValidKeys!0 lt!453859 #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030179 (= lt!453859 (array!64720 (store (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun lt!453855 () Unit!33606)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64719 (_ BitVec 32) (_ BitVec 64)) Unit!33606)

(assert (=> b!1030179 (= lt!453855 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11306 thiss!1427) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030180 () Bool)

(assert (=> b!1030180 (= e!581651 tp_is_empty!24307)))

(declare-fun b!1030181 () Bool)

(declare-fun e!581650 () Bool)

(assert (=> b!1030181 (= e!581650 tp_is_empty!24307)))

(declare-fun res!688852 () Bool)

(assert (=> start!90002 (=> (not res!688852) (not e!581648))))

(declare-fun valid!2087 (LongMapFixedSize!5494) Bool)

(assert (=> start!90002 (= res!688852 (valid!2087 thiss!1427))))

(assert (=> start!90002 e!581648))

(assert (=> start!90002 e!581655))

(assert (=> start!90002 true))

(declare-fun mapNonEmpty!37900 () Bool)

(declare-fun tp!72817 () Bool)

(assert (=> mapNonEmpty!37900 (= mapRes!37900 (and tp!72817 e!581650))))

(declare-fun mapRest!37900 () (Array (_ BitVec 32) ValueCell!11450))

(declare-fun mapKey!37900 () (_ BitVec 32))

(declare-fun mapValue!37900 () ValueCell!11450)

(assert (=> mapNonEmpty!37900 (= (arr!31160 (_values!6132 thiss!1427)) (store mapRest!37900 mapKey!37900 mapValue!37900))))

(declare-fun b!1030182 () Bool)

(declare-fun res!688853 () Bool)

(assert (=> b!1030182 (=> (not res!688853) (not e!581648))))

(assert (=> b!1030182 (= res!688853 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90002 res!688852) b!1030182))

(assert (= (and b!1030182 res!688853) b!1030178))

(assert (= (and b!1030178 res!688854) b!1030179))

(assert (= (and b!1030179 (not res!688855)) b!1030175))

(assert (= (and b!1030177 condMapEmpty!37900) mapIsEmpty!37900))

(assert (= (and b!1030177 (not condMapEmpty!37900)) mapNonEmpty!37900))

(assert (= (and mapNonEmpty!37900 ((_ is ValueCellFull!11450) mapValue!37900)) b!1030181))

(assert (= (and b!1030177 ((_ is ValueCellFull!11450) mapDefault!37900)) b!1030180))

(assert (= b!1030176 b!1030177))

(assert (= start!90002 b!1030176))

(declare-fun b_lambda!15837 () Bool)

(assert (=> (not b_lambda!15837) (not b!1030179)))

(declare-fun t!30879 () Bool)

(declare-fun tb!6897 () Bool)

(assert (=> (and b!1030176 (= (defaultEntry!6109 thiss!1427) (defaultEntry!6109 thiss!1427)) t!30879) tb!6897))

(declare-fun result!14123 () Bool)

(assert (=> tb!6897 (= result!14123 tp_is_empty!24307)))

(assert (=> b!1030179 t!30879))

(declare-fun b_and!32905 () Bool)

(assert (= b_and!32903 (and (=> t!30879 result!14123) b_and!32905)))

(declare-fun m!949595 () Bool)

(assert (=> start!90002 m!949595))

(declare-fun m!949597 () Bool)

(assert (=> b!1030179 m!949597))

(declare-fun m!949599 () Bool)

(assert (=> b!1030179 m!949599))

(declare-fun m!949601 () Bool)

(assert (=> b!1030179 m!949601))

(declare-fun m!949603 () Bool)

(assert (=> b!1030179 m!949603))

(declare-fun m!949605 () Bool)

(assert (=> b!1030179 m!949605))

(declare-fun m!949607 () Bool)

(assert (=> b!1030179 m!949607))

(declare-fun m!949609 () Bool)

(assert (=> b!1030179 m!949609))

(declare-fun m!949611 () Bool)

(assert (=> b!1030179 m!949611))

(declare-fun m!949613 () Bool)

(assert (=> b!1030179 m!949613))

(declare-fun m!949615 () Bool)

(assert (=> b!1030179 m!949615))

(declare-fun m!949617 () Bool)

(assert (=> b!1030179 m!949617))

(declare-fun m!949619 () Bool)

(assert (=> b!1030179 m!949619))

(declare-fun m!949621 () Bool)

(assert (=> b!1030179 m!949621))

(declare-fun m!949623 () Bool)

(assert (=> b!1030179 m!949623))

(assert (=> b!1030179 m!949605))

(declare-fun m!949625 () Bool)

(assert (=> b!1030179 m!949625))

(declare-fun m!949627 () Bool)

(assert (=> b!1030179 m!949627))

(declare-fun m!949629 () Bool)

(assert (=> b!1030179 m!949629))

(declare-fun m!949631 () Bool)

(assert (=> mapNonEmpty!37900 m!949631))

(declare-fun m!949633 () Bool)

(assert (=> b!1030178 m!949633))

(declare-fun m!949635 () Bool)

(assert (=> b!1030176 m!949635))

(declare-fun m!949637 () Bool)

(assert (=> b!1030176 m!949637))

(check-sat (not start!90002) (not b_next!20587) tp_is_empty!24307 (not b!1030179) (not b!1030178) (not b!1030176) (not mapNonEmpty!37900) (not b_lambda!15837) b_and!32905)
(check-sat b_and!32905 (not b_next!20587))
(get-model)

(declare-fun b_lambda!15843 () Bool)

(assert (= b_lambda!15837 (or (and b!1030176 b_free!20587) b_lambda!15843)))

(check-sat (not start!90002) (not b_next!20587) tp_is_empty!24307 (not b!1030179) (not b!1030178) (not b_lambda!15843) (not b!1030176) (not mapNonEmpty!37900) b_and!32905)
(check-sat b_and!32905 (not b_next!20587))
(get-model)

(declare-fun d!123611 () Bool)

(declare-fun res!688886 () Bool)

(declare-fun e!581706 () Bool)

(assert (=> d!123611 (=> (not res!688886) (not e!581706))))

(declare-fun simpleValid!393 (LongMapFixedSize!5494) Bool)

(assert (=> d!123611 (= res!688886 (simpleValid!393 thiss!1427))))

(assert (=> d!123611 (= (valid!2087 thiss!1427) e!581706)))

(declare-fun b!1030243 () Bool)

(declare-fun res!688887 () Bool)

(assert (=> b!1030243 (=> (not res!688887) (not e!581706))))

(assert (=> b!1030243 (= res!688887 (= (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) (_size!2802 thiss!1427)))))

(declare-fun b!1030244 () Bool)

(declare-fun res!688888 () Bool)

(assert (=> b!1030244 (=> (not res!688888) (not e!581706))))

(assert (=> b!1030244 (= res!688888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11306 thiss!1427) (mask!29915 thiss!1427)))))

(declare-fun b!1030245 () Bool)

(assert (=> b!1030245 (= e!581706 (arrayNoDuplicates!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 Nil!21804))))

(assert (= (and d!123611 res!688886) b!1030243))

(assert (= (and b!1030243 res!688887) b!1030244))

(assert (= (and b!1030244 res!688888) b!1030245))

(declare-fun m!949727 () Bool)

(assert (=> d!123611 m!949727))

(assert (=> b!1030243 m!949621))

(declare-fun m!949729 () Bool)

(assert (=> b!1030244 m!949729))

(declare-fun m!949731 () Bool)

(assert (=> b!1030245 m!949731))

(assert (=> start!90002 d!123611))

(declare-fun b!1030258 () Bool)

(declare-fun e!581715 () SeekEntryResult!9635)

(declare-fun e!581713 () SeekEntryResult!9635)

(assert (=> b!1030258 (= e!581715 e!581713)))

(declare-fun lt!453926 () (_ BitVec 64))

(declare-fun lt!453924 () SeekEntryResult!9635)

(assert (=> b!1030258 (= lt!453926 (select (arr!31159 (_keys!11306 thiss!1427)) (index!40913 lt!453924)))))

(declare-fun c!104293 () Bool)

(assert (=> b!1030258 (= c!104293 (= lt!453926 key!909))))

(declare-fun b!1030259 () Bool)

(assert (=> b!1030259 (= e!581715 Undefined!9635)))

(declare-fun d!123613 () Bool)

(declare-fun lt!453923 () SeekEntryResult!9635)

(assert (=> d!123613 (and (or ((_ is MissingVacant!9635) lt!453923) (not ((_ is Found!9635) lt!453923)) (and (bvsge (index!40912 lt!453923) #b00000000000000000000000000000000) (bvslt (index!40912 lt!453923) (size!31675 (_keys!11306 thiss!1427))))) (not ((_ is MissingVacant!9635) lt!453923)) (or (not ((_ is Found!9635) lt!453923)) (= (select (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453923)) key!909)))))

(assert (=> d!123613 (= lt!453923 e!581715)))

(declare-fun c!104294 () Bool)

(assert (=> d!123613 (= c!104294 (and ((_ is Intermediate!9635) lt!453924) (undefined!10447 lt!453924)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64719 (_ BitVec 32)) SeekEntryResult!9635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123613 (= lt!453924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29915 thiss!1427)) key!909 (_keys!11306 thiss!1427) (mask!29915 thiss!1427)))))

(assert (=> d!123613 (validMask!0 (mask!29915 thiss!1427))))

(assert (=> d!123613 (= (seekEntry!0 key!909 (_keys!11306 thiss!1427) (mask!29915 thiss!1427)) lt!453923)))

(declare-fun b!1030260 () Bool)

(declare-fun e!581714 () SeekEntryResult!9635)

(assert (=> b!1030260 (= e!581714 (MissingZero!9635 (index!40913 lt!453924)))))

(declare-fun b!1030261 () Bool)

(declare-fun c!104292 () Bool)

(assert (=> b!1030261 (= c!104292 (= lt!453926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030261 (= e!581713 e!581714)))

(declare-fun b!1030262 () Bool)

(assert (=> b!1030262 (= e!581713 (Found!9635 (index!40913 lt!453924)))))

(declare-fun b!1030263 () Bool)

(declare-fun lt!453925 () SeekEntryResult!9635)

(assert (=> b!1030263 (= e!581714 (ite ((_ is MissingVacant!9635) lt!453925) (MissingZero!9635 (index!40914 lt!453925)) lt!453925))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64719 (_ BitVec 32)) SeekEntryResult!9635)

(assert (=> b!1030263 (= lt!453925 (seekKeyOrZeroReturnVacant!0 (x!91529 lt!453924) (index!40913 lt!453924) (index!40913 lt!453924) key!909 (_keys!11306 thiss!1427) (mask!29915 thiss!1427)))))

(assert (= (and d!123613 c!104294) b!1030259))

(assert (= (and d!123613 (not c!104294)) b!1030258))

(assert (= (and b!1030258 c!104293) b!1030262))

(assert (= (and b!1030258 (not c!104293)) b!1030261))

(assert (= (and b!1030261 c!104292) b!1030260))

(assert (= (and b!1030261 (not c!104292)) b!1030263))

(declare-fun m!949733 () Bool)

(assert (=> b!1030258 m!949733))

(declare-fun m!949735 () Bool)

(assert (=> d!123613 m!949735))

(declare-fun m!949737 () Bool)

(assert (=> d!123613 m!949737))

(assert (=> d!123613 m!949737))

(declare-fun m!949739 () Bool)

(assert (=> d!123613 m!949739))

(declare-fun m!949741 () Bool)

(assert (=> d!123613 m!949741))

(declare-fun m!949743 () Bool)

(assert (=> b!1030263 m!949743))

(assert (=> b!1030178 d!123613))

(declare-fun b!1030306 () Bool)

(declare-fun e!581753 () Bool)

(declare-fun e!581744 () Bool)

(assert (=> b!1030306 (= e!581753 e!581744)))

(declare-fun res!688915 () Bool)

(declare-fun call!43484 () Bool)

(assert (=> b!1030306 (= res!688915 call!43484)))

(assert (=> b!1030306 (=> (not res!688915) (not e!581744))))

(declare-fun b!1030307 () Bool)

(declare-fun e!581750 () Bool)

(declare-fun call!43482 () Bool)

(assert (=> b!1030307 (= e!581750 (not call!43482))))

(declare-fun bm!43475 () Bool)

(declare-fun call!43479 () ListLongMap!13689)

(declare-fun call!43480 () ListLongMap!13689)

(assert (=> bm!43475 (= call!43479 call!43480)))

(declare-fun b!1030308 () Bool)

(declare-fun e!581745 () ListLongMap!13689)

(declare-fun call!43478 () ListLongMap!13689)

(declare-fun +!3122 (ListLongMap!13689 tuple2!15560) ListLongMap!13689)

(assert (=> b!1030308 (= e!581745 (+!3122 call!43478 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427))))))

(declare-fun b!1030309 () Bool)

(declare-fun res!688907 () Bool)

(declare-fun e!581743 () Bool)

(assert (=> b!1030309 (=> (not res!688907) (not e!581743))))

(assert (=> b!1030309 (= res!688907 e!581750)))

(declare-fun c!104309 () Bool)

(assert (=> b!1030309 (= c!104309 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1030310 () Bool)

(declare-fun e!581748 () Unit!33606)

(declare-fun lt!453980 () Unit!33606)

(assert (=> b!1030310 (= e!581748 lt!453980)))

(declare-fun lt!453976 () ListLongMap!13689)

(declare-fun getCurrentListMapNoExtraKeys!3562 (array!64719 array!64721 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) Int) ListLongMap!13689)

(assert (=> b!1030310 (= lt!453976 (getCurrentListMapNoExtraKeys!3562 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453984 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453984 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453985 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453985 (select (arr!31159 lt!453859) #b00000000000000000000000000000000))))

(declare-fun lt!453971 () Unit!33606)

(declare-fun addStillContains!621 (ListLongMap!13689 (_ BitVec 64) V!37283 (_ BitVec 64)) Unit!33606)

(assert (=> b!1030310 (= lt!453971 (addStillContains!621 lt!453976 lt!453984 (zeroValue!5945 thiss!1427) lt!453985))))

(declare-fun contains!5995 (ListLongMap!13689 (_ BitVec 64)) Bool)

(assert (=> b!1030310 (contains!5995 (+!3122 lt!453976 (tuple2!15561 lt!453984 (zeroValue!5945 thiss!1427))) lt!453985)))

(declare-fun lt!453992 () Unit!33606)

(assert (=> b!1030310 (= lt!453992 lt!453971)))

(declare-fun lt!453991 () ListLongMap!13689)

(assert (=> b!1030310 (= lt!453991 (getCurrentListMapNoExtraKeys!3562 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453986 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453986 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453988 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453988 (select (arr!31159 lt!453859) #b00000000000000000000000000000000))))

(declare-fun lt!453973 () Unit!33606)

(declare-fun addApplyDifferent!477 (ListLongMap!13689 (_ BitVec 64) V!37283 (_ BitVec 64)) Unit!33606)

(assert (=> b!1030310 (= lt!453973 (addApplyDifferent!477 lt!453991 lt!453986 (minValue!5945 thiss!1427) lt!453988))))

(declare-fun apply!911 (ListLongMap!13689 (_ BitVec 64)) V!37283)

(assert (=> b!1030310 (= (apply!911 (+!3122 lt!453991 (tuple2!15561 lt!453986 (minValue!5945 thiss!1427))) lt!453988) (apply!911 lt!453991 lt!453988))))

(declare-fun lt!453979 () Unit!33606)

(assert (=> b!1030310 (= lt!453979 lt!453973)))

(declare-fun lt!453975 () ListLongMap!13689)

(assert (=> b!1030310 (= lt!453975 (getCurrentListMapNoExtraKeys!3562 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453974 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453978 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453978 (select (arr!31159 lt!453859) #b00000000000000000000000000000000))))

(declare-fun lt!453982 () Unit!33606)

(assert (=> b!1030310 (= lt!453982 (addApplyDifferent!477 lt!453975 lt!453974 (zeroValue!5945 thiss!1427) lt!453978))))

(assert (=> b!1030310 (= (apply!911 (+!3122 lt!453975 (tuple2!15561 lt!453974 (zeroValue!5945 thiss!1427))) lt!453978) (apply!911 lt!453975 lt!453978))))

(declare-fun lt!453983 () Unit!33606)

(assert (=> b!1030310 (= lt!453983 lt!453982)))

(declare-fun lt!453989 () ListLongMap!13689)

(assert (=> b!1030310 (= lt!453989 (getCurrentListMapNoExtraKeys!3562 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453977 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453977 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!453981 () (_ BitVec 64))

(assert (=> b!1030310 (= lt!453981 (select (arr!31159 lt!453859) #b00000000000000000000000000000000))))

(assert (=> b!1030310 (= lt!453980 (addApplyDifferent!477 lt!453989 lt!453977 (minValue!5945 thiss!1427) lt!453981))))

(assert (=> b!1030310 (= (apply!911 (+!3122 lt!453989 (tuple2!15561 lt!453977 (minValue!5945 thiss!1427))) lt!453981) (apply!911 lt!453989 lt!453981))))

(declare-fun b!1030311 () Bool)

(declare-fun Unit!33618 () Unit!33606)

(assert (=> b!1030311 (= e!581748 Unit!33618)))

(declare-fun bm!43476 () Bool)

(declare-fun lt!453990 () ListLongMap!13689)

(assert (=> bm!43476 (= call!43482 (contains!5995 lt!453990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030312 () Bool)

(assert (=> b!1030312 (= e!581753 (not call!43484))))

(declare-fun b!1030313 () Bool)

(assert (=> b!1030313 (= e!581743 e!581753)))

(declare-fun c!104312 () Bool)

(assert (=> b!1030313 (= c!104312 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030314 () Bool)

(declare-fun e!581752 () ListLongMap!13689)

(declare-fun call!43483 () ListLongMap!13689)

(assert (=> b!1030314 (= e!581752 call!43483)))

(declare-fun bm!43477 () Bool)

(assert (=> bm!43477 (= call!43484 (contains!5995 lt!453990 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123615 () Bool)

(assert (=> d!123615 e!581743))

(declare-fun res!688910 () Bool)

(assert (=> d!123615 (=> (not res!688910) (not e!581743))))

(assert (=> d!123615 (= res!688910 (or (bvsge #b00000000000000000000000000000000 (size!31675 lt!453859)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31675 lt!453859)))))))

(declare-fun lt!453972 () ListLongMap!13689)

(assert (=> d!123615 (= lt!453990 lt!453972)))

(declare-fun lt!453987 () Unit!33606)

(assert (=> d!123615 (= lt!453987 e!581748)))

(declare-fun c!104310 () Bool)

(declare-fun e!581746 () Bool)

(assert (=> d!123615 (= c!104310 e!581746)))

(declare-fun res!688912 () Bool)

(assert (=> d!123615 (=> (not res!688912) (not e!581746))))

(assert (=> d!123615 (= res!688912 (bvslt #b00000000000000000000000000000000 (size!31675 lt!453859)))))

(assert (=> d!123615 (= lt!453972 e!581745)))

(declare-fun c!104308 () Bool)

(assert (=> d!123615 (= c!104308 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123615 (validMask!0 (mask!29915 thiss!1427))))

(assert (=> d!123615 (= (getCurrentListMap!3906 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) lt!453990)))

(declare-fun b!1030315 () Bool)

(declare-fun e!581754 () ListLongMap!13689)

(assert (=> b!1030315 (= e!581754 call!43483)))

(declare-fun b!1030316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1030316 (= e!581746 (validKeyInArray!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(declare-fun call!43481 () ListLongMap!13689)

(declare-fun bm!43478 () Bool)

(assert (=> bm!43478 (= call!43481 (getCurrentListMapNoExtraKeys!3562 lt!453859 lt!453856 (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun b!1030317 () Bool)

(declare-fun e!581749 () Bool)

(assert (=> b!1030317 (= e!581749 (= (apply!911 lt!453990 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5945 thiss!1427)))))

(declare-fun bm!43479 () Bool)

(declare-fun c!104311 () Bool)

(assert (=> bm!43479 (= call!43478 (+!3122 (ite c!104308 call!43481 (ite c!104311 call!43480 call!43479)) (ite (or c!104308 c!104311) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5945 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427)))))))

(declare-fun bm!43480 () Bool)

(assert (=> bm!43480 (= call!43480 call!43481)))

(declare-fun b!1030318 () Bool)

(assert (=> b!1030318 (= e!581745 e!581752)))

(assert (=> b!1030318 (= c!104311 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030319 () Bool)

(declare-fun e!581751 () Bool)

(assert (=> b!1030319 (= e!581751 (validKeyInArray!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(declare-fun b!1030320 () Bool)

(assert (=> b!1030320 (= e!581750 e!581749)))

(declare-fun res!688911 () Bool)

(assert (=> b!1030320 (= res!688911 call!43482)))

(assert (=> b!1030320 (=> (not res!688911) (not e!581749))))

(declare-fun b!1030321 () Bool)

(declare-fun c!104307 () Bool)

(assert (=> b!1030321 (= c!104307 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1030321 (= e!581752 e!581754)))

(declare-fun b!1030322 () Bool)

(assert (=> b!1030322 (= e!581754 call!43479)))

(declare-fun bm!43481 () Bool)

(assert (=> bm!43481 (= call!43483 call!43478)))

(declare-fun b!1030323 () Bool)

(declare-fun res!688908 () Bool)

(assert (=> b!1030323 (=> (not res!688908) (not e!581743))))

(declare-fun e!581742 () Bool)

(assert (=> b!1030323 (= res!688908 e!581742)))

(declare-fun res!688909 () Bool)

(assert (=> b!1030323 (=> res!688909 e!581742)))

(assert (=> b!1030323 (= res!688909 (not e!581751))))

(declare-fun res!688913 () Bool)

(assert (=> b!1030323 (=> (not res!688913) (not e!581751))))

(assert (=> b!1030323 (= res!688913 (bvslt #b00000000000000000000000000000000 (size!31675 lt!453859)))))

(declare-fun b!1030324 () Bool)

(declare-fun e!581747 () Bool)

(assert (=> b!1030324 (= e!581742 e!581747)))

(declare-fun res!688914 () Bool)

(assert (=> b!1030324 (=> (not res!688914) (not e!581747))))

(assert (=> b!1030324 (= res!688914 (contains!5995 lt!453990 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(assert (=> b!1030324 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31675 lt!453859)))))

(declare-fun b!1030325 () Bool)

(declare-fun get!16382 (ValueCell!11450 V!37283) V!37283)

(assert (=> b!1030325 (= e!581747 (= (apply!911 lt!453990 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)) (get!16382 (select (arr!31160 lt!453856) #b00000000000000000000000000000000) (dynLambda!1977 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31676 lt!453856)))))

(assert (=> b!1030325 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31675 lt!453859)))))

(declare-fun b!1030326 () Bool)

(assert (=> b!1030326 (= e!581744 (= (apply!911 lt!453990 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5945 thiss!1427)))))

(assert (= (and d!123615 c!104308) b!1030308))

(assert (= (and d!123615 (not c!104308)) b!1030318))

(assert (= (and b!1030318 c!104311) b!1030314))

(assert (= (and b!1030318 (not c!104311)) b!1030321))

(assert (= (and b!1030321 c!104307) b!1030315))

(assert (= (and b!1030321 (not c!104307)) b!1030322))

(assert (= (or b!1030315 b!1030322) bm!43475))

(assert (= (or b!1030314 bm!43475) bm!43480))

(assert (= (or b!1030314 b!1030315) bm!43481))

(assert (= (or b!1030308 bm!43480) bm!43478))

(assert (= (or b!1030308 bm!43481) bm!43479))

(assert (= (and d!123615 res!688912) b!1030316))

(assert (= (and d!123615 c!104310) b!1030310))

(assert (= (and d!123615 (not c!104310)) b!1030311))

(assert (= (and d!123615 res!688910) b!1030323))

(assert (= (and b!1030323 res!688913) b!1030319))

(assert (= (and b!1030323 (not res!688909)) b!1030324))

(assert (= (and b!1030324 res!688914) b!1030325))

(assert (= (and b!1030323 res!688908) b!1030309))

(assert (= (and b!1030309 c!104309) b!1030320))

(assert (= (and b!1030309 (not c!104309)) b!1030307))

(assert (= (and b!1030320 res!688911) b!1030317))

(assert (= (or b!1030320 b!1030307) bm!43476))

(assert (= (and b!1030309 res!688907) b!1030313))

(assert (= (and b!1030313 c!104312) b!1030306))

(assert (= (and b!1030313 (not c!104312)) b!1030312))

(assert (= (and b!1030306 res!688915) b!1030326))

(assert (= (or b!1030306 b!1030312) bm!43477))

(declare-fun b_lambda!15845 () Bool)

(assert (=> (not b_lambda!15845) (not b!1030325)))

(assert (=> b!1030325 t!30879))

(declare-fun b_and!32915 () Bool)

(assert (= b_and!32905 (and (=> t!30879 result!14123) b_and!32915)))

(declare-fun m!949745 () Bool)

(assert (=> b!1030310 m!949745))

(declare-fun m!949747 () Bool)

(assert (=> b!1030310 m!949747))

(declare-fun m!949749 () Bool)

(assert (=> b!1030310 m!949749))

(declare-fun m!949751 () Bool)

(assert (=> b!1030310 m!949751))

(declare-fun m!949753 () Bool)

(assert (=> b!1030310 m!949753))

(declare-fun m!949755 () Bool)

(assert (=> b!1030310 m!949755))

(declare-fun m!949757 () Bool)

(assert (=> b!1030310 m!949757))

(declare-fun m!949759 () Bool)

(assert (=> b!1030310 m!949759))

(assert (=> b!1030310 m!949753))

(declare-fun m!949761 () Bool)

(assert (=> b!1030310 m!949761))

(declare-fun m!949763 () Bool)

(assert (=> b!1030310 m!949763))

(declare-fun m!949765 () Bool)

(assert (=> b!1030310 m!949765))

(declare-fun m!949767 () Bool)

(assert (=> b!1030310 m!949767))

(declare-fun m!949769 () Bool)

(assert (=> b!1030310 m!949769))

(assert (=> b!1030310 m!949745))

(assert (=> b!1030310 m!949761))

(declare-fun m!949771 () Bool)

(assert (=> b!1030310 m!949771))

(assert (=> b!1030310 m!949763))

(declare-fun m!949773 () Bool)

(assert (=> b!1030310 m!949773))

(declare-fun m!949775 () Bool)

(assert (=> b!1030310 m!949775))

(declare-fun m!949777 () Bool)

(assert (=> b!1030310 m!949777))

(assert (=> d!123615 m!949741))

(declare-fun m!949779 () Bool)

(assert (=> b!1030317 m!949779))

(assert (=> b!1030325 m!949775))

(declare-fun m!949781 () Bool)

(assert (=> b!1030325 m!949781))

(declare-fun m!949783 () Bool)

(assert (=> b!1030325 m!949783))

(assert (=> b!1030325 m!949783))

(assert (=> b!1030325 m!949629))

(declare-fun m!949785 () Bool)

(assert (=> b!1030325 m!949785))

(assert (=> b!1030325 m!949629))

(assert (=> b!1030325 m!949775))

(assert (=> bm!43478 m!949749))

(assert (=> b!1030316 m!949775))

(assert (=> b!1030316 m!949775))

(declare-fun m!949787 () Bool)

(assert (=> b!1030316 m!949787))

(declare-fun m!949789 () Bool)

(assert (=> bm!43476 m!949789))

(declare-fun m!949791 () Bool)

(assert (=> b!1030326 m!949791))

(declare-fun m!949793 () Bool)

(assert (=> b!1030308 m!949793))

(assert (=> b!1030324 m!949775))

(assert (=> b!1030324 m!949775))

(declare-fun m!949795 () Bool)

(assert (=> b!1030324 m!949795))

(declare-fun m!949797 () Bool)

(assert (=> bm!43479 m!949797))

(assert (=> b!1030319 m!949775))

(assert (=> b!1030319 m!949775))

(assert (=> b!1030319 m!949787))

(declare-fun m!949799 () Bool)

(assert (=> bm!43477 m!949799))

(assert (=> b!1030179 d!123615))

(declare-fun d!123617 () Bool)

(declare-fun e!581757 () Bool)

(assert (=> d!123617 e!581757))

(declare-fun res!688918 () Bool)

(assert (=> d!123617 (=> (not res!688918) (not e!581757))))

(assert (=> d!123617 (= res!688918 (and (bvsge (index!40912 lt!453860) #b00000000000000000000000000000000) (bvslt (index!40912 lt!453860) (size!31675 (_keys!11306 thiss!1427)))))))

(declare-fun lt!453995 () Unit!33606)

(declare-fun choose!1692 (array!64719 array!64721 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) (_ BitVec 64) Int) Unit!33606)

(assert (=> d!123617 (= lt!453995 (choose!1692 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!40912 lt!453860) key!909 (defaultEntry!6109 thiss!1427)))))

(assert (=> d!123617 (validMask!0 (mask!29915 thiss!1427))))

(assert (=> d!123617 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!9 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!40912 lt!453860) key!909 (defaultEntry!6109 thiss!1427)) lt!453995)))

(declare-fun b!1030329 () Bool)

(assert (=> b!1030329 (= e!581757 (= (-!483 (getCurrentListMap!3906 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) (getCurrentListMap!3906 (array!64720 (store (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31675 (_keys!11306 thiss!1427))) (array!64722 (store (arr!31160 (_values!6132 thiss!1427)) (index!40912 lt!453860) (ValueCellFull!11450 (dynLambda!1977 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31676 (_values!6132 thiss!1427))) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427))))))

(assert (=> b!1030329 (bvslt (index!40912 lt!453860) (size!31676 (_values!6132 thiss!1427)))))

(assert (= (and d!123617 res!688918) b!1030329))

(declare-fun b_lambda!15847 () Bool)

(assert (=> (not b_lambda!15847) (not b!1030329)))

(assert (=> b!1030329 t!30879))

(declare-fun b_and!32917 () Bool)

(assert (= b_and!32915 (and (=> t!30879 result!14123) b_and!32917)))

(declare-fun m!949801 () Bool)

(assert (=> d!123617 m!949801))

(assert (=> d!123617 m!949741))

(assert (=> b!1030329 m!949605))

(assert (=> b!1030329 m!949615))

(declare-fun m!949803 () Bool)

(assert (=> b!1030329 m!949803))

(assert (=> b!1030329 m!949605))

(assert (=> b!1030329 m!949607))

(assert (=> b!1030329 m!949619))

(assert (=> b!1030329 m!949629))

(assert (=> b!1030179 d!123617))

(declare-fun d!123619 () Bool)

(declare-fun res!688923 () Bool)

(declare-fun e!581762 () Bool)

(assert (=> d!123619 (=> res!688923 e!581762)))

(assert (=> d!123619 (= res!688923 (= (select (arr!31159 lt!453859) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123619 (= (arrayContainsKey!0 lt!453859 key!909 #b00000000000000000000000000000000) e!581762)))

(declare-fun b!1030334 () Bool)

(declare-fun e!581763 () Bool)

(assert (=> b!1030334 (= e!581762 e!581763)))

(declare-fun res!688924 () Bool)

(assert (=> b!1030334 (=> (not res!688924) (not e!581763))))

(assert (=> b!1030334 (= res!688924 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31675 lt!453859)))))

(declare-fun b!1030335 () Bool)

(assert (=> b!1030335 (= e!581763 (arrayContainsKey!0 lt!453859 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123619 (not res!688923)) b!1030334))

(assert (= (and b!1030334 res!688924) b!1030335))

(assert (=> d!123619 m!949775))

(declare-fun m!949805 () Bool)

(assert (=> b!1030335 m!949805))

(assert (=> b!1030179 d!123619))

(declare-fun b!1030336 () Bool)

(declare-fun e!581775 () Bool)

(declare-fun e!581766 () Bool)

(assert (=> b!1030336 (= e!581775 e!581766)))

(declare-fun res!688933 () Bool)

(declare-fun call!43491 () Bool)

(assert (=> b!1030336 (= res!688933 call!43491)))

(assert (=> b!1030336 (=> (not res!688933) (not e!581766))))

(declare-fun b!1030337 () Bool)

(declare-fun e!581772 () Bool)

(declare-fun call!43489 () Bool)

(assert (=> b!1030337 (= e!581772 (not call!43489))))

(declare-fun bm!43482 () Bool)

(declare-fun call!43486 () ListLongMap!13689)

(declare-fun call!43487 () ListLongMap!13689)

(assert (=> bm!43482 (= call!43486 call!43487)))

(declare-fun b!1030338 () Bool)

(declare-fun e!581767 () ListLongMap!13689)

(declare-fun call!43485 () ListLongMap!13689)

(assert (=> b!1030338 (= e!581767 (+!3122 call!43485 (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427))))))

(declare-fun b!1030339 () Bool)

(declare-fun res!688925 () Bool)

(declare-fun e!581765 () Bool)

(assert (=> b!1030339 (=> (not res!688925) (not e!581765))))

(assert (=> b!1030339 (= res!688925 e!581772)))

(declare-fun c!104315 () Bool)

(assert (=> b!1030339 (= c!104315 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1030340 () Bool)

(declare-fun e!581770 () Unit!33606)

(declare-fun lt!454005 () Unit!33606)

(assert (=> b!1030340 (= e!581770 lt!454005)))

(declare-fun lt!454001 () ListLongMap!13689)

(assert (=> b!1030340 (= lt!454001 (getCurrentListMapNoExtraKeys!3562 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!454009 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454010 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454010 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453996 () Unit!33606)

(assert (=> b!1030340 (= lt!453996 (addStillContains!621 lt!454001 lt!454009 (zeroValue!5945 thiss!1427) lt!454010))))

(assert (=> b!1030340 (contains!5995 (+!3122 lt!454001 (tuple2!15561 lt!454009 (zeroValue!5945 thiss!1427))) lt!454010)))

(declare-fun lt!454017 () Unit!33606)

(assert (=> b!1030340 (= lt!454017 lt!453996)))

(declare-fun lt!454016 () ListLongMap!13689)

(assert (=> b!1030340 (= lt!454016 (getCurrentListMapNoExtraKeys!3562 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!454011 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454011 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454013 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454013 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!453998 () Unit!33606)

(assert (=> b!1030340 (= lt!453998 (addApplyDifferent!477 lt!454016 lt!454011 (minValue!5945 thiss!1427) lt!454013))))

(assert (=> b!1030340 (= (apply!911 (+!3122 lt!454016 (tuple2!15561 lt!454011 (minValue!5945 thiss!1427))) lt!454013) (apply!911 lt!454016 lt!454013))))

(declare-fun lt!454004 () Unit!33606)

(assert (=> b!1030340 (= lt!454004 lt!453998)))

(declare-fun lt!454000 () ListLongMap!13689)

(assert (=> b!1030340 (= lt!454000 (getCurrentListMapNoExtraKeys!3562 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!453999 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!453999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454003 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454003 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454007 () Unit!33606)

(assert (=> b!1030340 (= lt!454007 (addApplyDifferent!477 lt!454000 lt!453999 (zeroValue!5945 thiss!1427) lt!454003))))

(assert (=> b!1030340 (= (apply!911 (+!3122 lt!454000 (tuple2!15561 lt!453999 (zeroValue!5945 thiss!1427))) lt!454003) (apply!911 lt!454000 lt!454003))))

(declare-fun lt!454008 () Unit!33606)

(assert (=> b!1030340 (= lt!454008 lt!454007)))

(declare-fun lt!454014 () ListLongMap!13689)

(assert (=> b!1030340 (= lt!454014 (getCurrentListMapNoExtraKeys!3562 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun lt!454002 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454006 () (_ BitVec 64))

(assert (=> b!1030340 (= lt!454006 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030340 (= lt!454005 (addApplyDifferent!477 lt!454014 lt!454002 (minValue!5945 thiss!1427) lt!454006))))

(assert (=> b!1030340 (= (apply!911 (+!3122 lt!454014 (tuple2!15561 lt!454002 (minValue!5945 thiss!1427))) lt!454006) (apply!911 lt!454014 lt!454006))))

(declare-fun b!1030341 () Bool)

(declare-fun Unit!33619 () Unit!33606)

(assert (=> b!1030341 (= e!581770 Unit!33619)))

(declare-fun bm!43483 () Bool)

(declare-fun lt!454015 () ListLongMap!13689)

(assert (=> bm!43483 (= call!43489 (contains!5995 lt!454015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030342 () Bool)

(assert (=> b!1030342 (= e!581775 (not call!43491))))

(declare-fun b!1030343 () Bool)

(assert (=> b!1030343 (= e!581765 e!581775)))

(declare-fun c!104318 () Bool)

(assert (=> b!1030343 (= c!104318 (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030344 () Bool)

(declare-fun e!581774 () ListLongMap!13689)

(declare-fun call!43490 () ListLongMap!13689)

(assert (=> b!1030344 (= e!581774 call!43490)))

(declare-fun bm!43484 () Bool)

(assert (=> bm!43484 (= call!43491 (contains!5995 lt!454015 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123621 () Bool)

(assert (=> d!123621 e!581765))

(declare-fun res!688928 () Bool)

(assert (=> d!123621 (=> (not res!688928) (not e!581765))))

(assert (=> d!123621 (= res!688928 (or (bvsge #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))))

(declare-fun lt!453997 () ListLongMap!13689)

(assert (=> d!123621 (= lt!454015 lt!453997)))

(declare-fun lt!454012 () Unit!33606)

(assert (=> d!123621 (= lt!454012 e!581770)))

(declare-fun c!104316 () Bool)

(declare-fun e!581768 () Bool)

(assert (=> d!123621 (= c!104316 e!581768)))

(declare-fun res!688930 () Bool)

(assert (=> d!123621 (=> (not res!688930) (not e!581768))))

(assert (=> d!123621 (= res!688930 (bvslt #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))

(assert (=> d!123621 (= lt!453997 e!581767)))

(declare-fun c!104314 () Bool)

(assert (=> d!123621 (= c!104314 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123621 (validMask!0 (mask!29915 thiss!1427))))

(assert (=> d!123621 (= (getCurrentListMap!3906 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) lt!454015)))

(declare-fun b!1030345 () Bool)

(declare-fun e!581776 () ListLongMap!13689)

(assert (=> b!1030345 (= e!581776 call!43490)))

(declare-fun b!1030346 () Bool)

(assert (=> b!1030346 (= e!581768 (validKeyInArray!0 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43485 () Bool)

(declare-fun call!43488 () ListLongMap!13689)

(assert (=> bm!43485 (= call!43488 (getCurrentListMapNoExtraKeys!3562 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-fun b!1030347 () Bool)

(declare-fun e!581771 () Bool)

(assert (=> b!1030347 (= e!581771 (= (apply!911 lt!454015 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5945 thiss!1427)))))

(declare-fun bm!43486 () Bool)

(declare-fun c!104317 () Bool)

(assert (=> bm!43486 (= call!43485 (+!3122 (ite c!104314 call!43488 (ite c!104317 call!43487 call!43486)) (ite (or c!104314 c!104317) (tuple2!15561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5945 thiss!1427)) (tuple2!15561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5945 thiss!1427)))))))

(declare-fun bm!43487 () Bool)

(assert (=> bm!43487 (= call!43487 call!43488)))

(declare-fun b!1030348 () Bool)

(assert (=> b!1030348 (= e!581767 e!581774)))

(assert (=> b!1030348 (= c!104317 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030349 () Bool)

(declare-fun e!581773 () Bool)

(assert (=> b!1030349 (= e!581773 (validKeyInArray!0 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030350 () Bool)

(assert (=> b!1030350 (= e!581772 e!581771)))

(declare-fun res!688929 () Bool)

(assert (=> b!1030350 (= res!688929 call!43489)))

(assert (=> b!1030350 (=> (not res!688929) (not e!581771))))

(declare-fun b!1030351 () Bool)

(declare-fun c!104313 () Bool)

(assert (=> b!1030351 (= c!104313 (and (not (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5841 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1030351 (= e!581774 e!581776)))

(declare-fun b!1030352 () Bool)

(assert (=> b!1030352 (= e!581776 call!43486)))

(declare-fun bm!43488 () Bool)

(assert (=> bm!43488 (= call!43490 call!43485)))

(declare-fun b!1030353 () Bool)

(declare-fun res!688926 () Bool)

(assert (=> b!1030353 (=> (not res!688926) (not e!581765))))

(declare-fun e!581764 () Bool)

(assert (=> b!1030353 (= res!688926 e!581764)))

(declare-fun res!688927 () Bool)

(assert (=> b!1030353 (=> res!688927 e!581764)))

(assert (=> b!1030353 (= res!688927 (not e!581773))))

(declare-fun res!688931 () Bool)

(assert (=> b!1030353 (=> (not res!688931) (not e!581773))))

(assert (=> b!1030353 (= res!688931 (bvslt #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun b!1030354 () Bool)

(declare-fun e!581769 () Bool)

(assert (=> b!1030354 (= e!581764 e!581769)))

(declare-fun res!688932 () Bool)

(assert (=> b!1030354 (=> (not res!688932) (not e!581769))))

(assert (=> b!1030354 (= res!688932 (contains!5995 lt!454015 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030354 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun b!1030355 () Bool)

(assert (=> b!1030355 (= e!581769 (= (apply!911 lt!454015 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)) (get!16382 (select (arr!31160 (_values!6132 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1977 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31676 (_values!6132 thiss!1427))))))

(assert (=> b!1030355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun b!1030356 () Bool)

(assert (=> b!1030356 (= e!581766 (= (apply!911 lt!454015 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5945 thiss!1427)))))

(assert (= (and d!123621 c!104314) b!1030338))

(assert (= (and d!123621 (not c!104314)) b!1030348))

(assert (= (and b!1030348 c!104317) b!1030344))

(assert (= (and b!1030348 (not c!104317)) b!1030351))

(assert (= (and b!1030351 c!104313) b!1030345))

(assert (= (and b!1030351 (not c!104313)) b!1030352))

(assert (= (or b!1030345 b!1030352) bm!43482))

(assert (= (or b!1030344 bm!43482) bm!43487))

(assert (= (or b!1030344 b!1030345) bm!43488))

(assert (= (or b!1030338 bm!43487) bm!43485))

(assert (= (or b!1030338 bm!43488) bm!43486))

(assert (= (and d!123621 res!688930) b!1030346))

(assert (= (and d!123621 c!104316) b!1030340))

(assert (= (and d!123621 (not c!104316)) b!1030341))

(assert (= (and d!123621 res!688928) b!1030353))

(assert (= (and b!1030353 res!688931) b!1030349))

(assert (= (and b!1030353 (not res!688927)) b!1030354))

(assert (= (and b!1030354 res!688932) b!1030355))

(assert (= (and b!1030353 res!688926) b!1030339))

(assert (= (and b!1030339 c!104315) b!1030350))

(assert (= (and b!1030339 (not c!104315)) b!1030337))

(assert (= (and b!1030350 res!688929) b!1030347))

(assert (= (or b!1030350 b!1030337) bm!43483))

(assert (= (and b!1030339 res!688925) b!1030343))

(assert (= (and b!1030343 c!104318) b!1030336))

(assert (= (and b!1030343 (not c!104318)) b!1030342))

(assert (= (and b!1030336 res!688933) b!1030356))

(assert (= (or b!1030336 b!1030342) bm!43484))

(declare-fun b_lambda!15849 () Bool)

(assert (=> (not b_lambda!15849) (not b!1030355)))

(assert (=> b!1030355 t!30879))

(declare-fun b_and!32919 () Bool)

(assert (= b_and!32917 (and (=> t!30879 result!14123) b_and!32919)))

(declare-fun m!949807 () Bool)

(assert (=> b!1030340 m!949807))

(declare-fun m!949809 () Bool)

(assert (=> b!1030340 m!949809))

(declare-fun m!949811 () Bool)

(assert (=> b!1030340 m!949811))

(declare-fun m!949813 () Bool)

(assert (=> b!1030340 m!949813))

(declare-fun m!949815 () Bool)

(assert (=> b!1030340 m!949815))

(declare-fun m!949817 () Bool)

(assert (=> b!1030340 m!949817))

(declare-fun m!949819 () Bool)

(assert (=> b!1030340 m!949819))

(declare-fun m!949821 () Bool)

(assert (=> b!1030340 m!949821))

(assert (=> b!1030340 m!949815))

(declare-fun m!949823 () Bool)

(assert (=> b!1030340 m!949823))

(declare-fun m!949825 () Bool)

(assert (=> b!1030340 m!949825))

(declare-fun m!949827 () Bool)

(assert (=> b!1030340 m!949827))

(declare-fun m!949829 () Bool)

(assert (=> b!1030340 m!949829))

(declare-fun m!949831 () Bool)

(assert (=> b!1030340 m!949831))

(assert (=> b!1030340 m!949807))

(assert (=> b!1030340 m!949823))

(declare-fun m!949833 () Bool)

(assert (=> b!1030340 m!949833))

(assert (=> b!1030340 m!949825))

(declare-fun m!949835 () Bool)

(assert (=> b!1030340 m!949835))

(declare-fun m!949837 () Bool)

(assert (=> b!1030340 m!949837))

(declare-fun m!949839 () Bool)

(assert (=> b!1030340 m!949839))

(assert (=> d!123621 m!949741))

(declare-fun m!949841 () Bool)

(assert (=> b!1030347 m!949841))

(assert (=> b!1030355 m!949837))

(declare-fun m!949843 () Bool)

(assert (=> b!1030355 m!949843))

(declare-fun m!949845 () Bool)

(assert (=> b!1030355 m!949845))

(assert (=> b!1030355 m!949845))

(assert (=> b!1030355 m!949629))

(declare-fun m!949847 () Bool)

(assert (=> b!1030355 m!949847))

(assert (=> b!1030355 m!949629))

(assert (=> b!1030355 m!949837))

(assert (=> bm!43485 m!949811))

(assert (=> b!1030346 m!949837))

(assert (=> b!1030346 m!949837))

(declare-fun m!949849 () Bool)

(assert (=> b!1030346 m!949849))

(declare-fun m!949851 () Bool)

(assert (=> bm!43483 m!949851))

(declare-fun m!949853 () Bool)

(assert (=> b!1030356 m!949853))

(declare-fun m!949855 () Bool)

(assert (=> b!1030338 m!949855))

(assert (=> b!1030354 m!949837))

(assert (=> b!1030354 m!949837))

(declare-fun m!949857 () Bool)

(assert (=> b!1030354 m!949857))

(declare-fun m!949859 () Bool)

(assert (=> bm!43486 m!949859))

(assert (=> b!1030349 m!949837))

(assert (=> b!1030349 m!949837))

(assert (=> b!1030349 m!949849))

(declare-fun m!949861 () Bool)

(assert (=> bm!43484 m!949861))

(assert (=> b!1030179 d!123621))

(declare-fun b!1030365 () Bool)

(declare-fun e!581782 () (_ BitVec 32))

(declare-fun call!43494 () (_ BitVec 32))

(assert (=> b!1030365 (= e!581782 call!43494)))

(declare-fun b!1030366 () Bool)

(declare-fun e!581781 () (_ BitVec 32))

(assert (=> b!1030366 (= e!581781 e!581782)))

(declare-fun c!104323 () Bool)

(assert (=> b!1030366 (= c!104323 (validKeyInArray!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(declare-fun bm!43491 () Bool)

(assert (=> bm!43491 (= call!43494 (arrayCountValidKeys!0 lt!453859 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun b!1030367 () Bool)

(assert (=> b!1030367 (= e!581781 #b00000000000000000000000000000000)))

(declare-fun b!1030368 () Bool)

(assert (=> b!1030368 (= e!581782 (bvadd #b00000000000000000000000000000001 call!43494))))

(declare-fun d!123623 () Bool)

(declare-fun lt!454020 () (_ BitVec 32))

(assert (=> d!123623 (and (bvsge lt!454020 #b00000000000000000000000000000000) (bvsle lt!454020 (bvsub (size!31675 lt!453859) #b00000000000000000000000000000000)))))

(assert (=> d!123623 (= lt!454020 e!581781)))

(declare-fun c!104324 () Bool)

(assert (=> d!123623 (= c!104324 (bvsge #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))

(assert (=> d!123623 (and (bvsle #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31675 (_keys!11306 thiss!1427)) (size!31675 lt!453859)))))

(assert (=> d!123623 (= (arrayCountValidKeys!0 lt!453859 #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) lt!454020)))

(assert (= (and d!123623 c!104324) b!1030367))

(assert (= (and d!123623 (not c!104324)) b!1030366))

(assert (= (and b!1030366 c!104323) b!1030368))

(assert (= (and b!1030366 (not c!104323)) b!1030365))

(assert (= (or b!1030368 b!1030365) bm!43491))

(assert (=> b!1030366 m!949775))

(assert (=> b!1030366 m!949775))

(assert (=> b!1030366 m!949787))

(declare-fun m!949863 () Bool)

(assert (=> bm!43491 m!949863))

(assert (=> b!1030179 d!123623))

(declare-fun d!123625 () Bool)

(declare-fun e!581785 () Bool)

(assert (=> d!123625 e!581785))

(declare-fun res!688936 () Bool)

(assert (=> d!123625 (=> (not res!688936) (not e!581785))))

(assert (=> d!123625 (= res!688936 (bvslt (index!40912 lt!453860) (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun lt!454023 () Unit!33606)

(declare-fun choose!121 (array!64719 (_ BitVec 32) (_ BitVec 64)) Unit!33606)

(assert (=> d!123625 (= lt!454023 (choose!121 (_keys!11306 thiss!1427) (index!40912 lt!453860) key!909))))

(assert (=> d!123625 (bvsge (index!40912 lt!453860) #b00000000000000000000000000000000)))

(assert (=> d!123625 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11306 thiss!1427) (index!40912 lt!453860) key!909) lt!454023)))

(declare-fun b!1030371 () Bool)

(assert (=> b!1030371 (= e!581785 (not (arrayContainsKey!0 (array!64720 (store (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31675 (_keys!11306 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123625 res!688936) b!1030371))

(declare-fun m!949865 () Bool)

(assert (=> d!123625 m!949865))

(assert (=> b!1030371 m!949615))

(declare-fun m!949867 () Bool)

(assert (=> b!1030371 m!949867))

(assert (=> b!1030179 d!123625))

(declare-fun d!123627 () Bool)

(declare-fun e!581788 () Bool)

(assert (=> d!123627 e!581788))

(declare-fun res!688939 () Bool)

(assert (=> d!123627 (=> (not res!688939) (not e!581788))))

(assert (=> d!123627 (= res!688939 (and (bvsge (index!40912 lt!453860) #b00000000000000000000000000000000) (bvslt (index!40912 lt!453860) (size!31675 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454026 () Unit!33606)

(declare-fun choose!25 (array!64719 (_ BitVec 32) (_ BitVec 32)) Unit!33606)

(assert (=> d!123627 (= lt!454026 (choose!25 (_keys!11306 thiss!1427) (index!40912 lt!453860) (mask!29915 thiss!1427)))))

(assert (=> d!123627 (validMask!0 (mask!29915 thiss!1427))))

(assert (=> d!123627 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11306 thiss!1427) (index!40912 lt!453860) (mask!29915 thiss!1427)) lt!454026)))

(declare-fun b!1030374 () Bool)

(assert (=> b!1030374 (= e!581788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64720 (store (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31675 (_keys!11306 thiss!1427))) (mask!29915 thiss!1427)))))

(assert (= (and d!123627 res!688939) b!1030374))

(declare-fun m!949869 () Bool)

(assert (=> d!123627 m!949869))

(assert (=> d!123627 m!949741))

(assert (=> b!1030374 m!949615))

(declare-fun m!949871 () Bool)

(assert (=> b!1030374 m!949871))

(assert (=> b!1030179 d!123627))

(declare-fun b!1030385 () Bool)

(declare-fun e!581794 () Bool)

(assert (=> b!1030385 (= e!581794 (bvslt (size!31675 (_keys!11306 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1030384 () Bool)

(declare-fun res!688949 () Bool)

(assert (=> b!1030384 (=> (not res!688949) (not e!581794))))

(assert (=> b!1030384 (= res!688949 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030386 () Bool)

(declare-fun e!581793 () Bool)

(assert (=> b!1030386 (= e!581793 (= (arrayCountValidKeys!0 (array!64720 (store (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31675 (_keys!11306 thiss!1427))) #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1030383 () Bool)

(declare-fun res!688948 () Bool)

(assert (=> b!1030383 (=> (not res!688948) (not e!581794))))

(assert (=> b!1030383 (= res!688948 (validKeyInArray!0 (select (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860))))))

(declare-fun d!123629 () Bool)

(assert (=> d!123629 e!581793))

(declare-fun res!688950 () Bool)

(assert (=> d!123629 (=> (not res!688950) (not e!581793))))

(assert (=> d!123629 (= res!688950 (and (bvsge (index!40912 lt!453860) #b00000000000000000000000000000000) (bvslt (index!40912 lt!453860) (size!31675 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454029 () Unit!33606)

(declare-fun choose!82 (array!64719 (_ BitVec 32) (_ BitVec 64)) Unit!33606)

(assert (=> d!123629 (= lt!454029 (choose!82 (_keys!11306 thiss!1427) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123629 e!581794))

(declare-fun res!688951 () Bool)

(assert (=> d!123629 (=> (not res!688951) (not e!581794))))

(assert (=> d!123629 (= res!688951 (and (bvsge (index!40912 lt!453860) #b00000000000000000000000000000000) (bvslt (index!40912 lt!453860) (size!31675 (_keys!11306 thiss!1427)))))))

(assert (=> d!123629 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11306 thiss!1427) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) lt!454029)))

(assert (= (and d!123629 res!688951) b!1030383))

(assert (= (and b!1030383 res!688948) b!1030384))

(assert (= (and b!1030384 res!688949) b!1030385))

(assert (= (and d!123629 res!688950) b!1030386))

(declare-fun m!949873 () Bool)

(assert (=> b!1030384 m!949873))

(assert (=> b!1030386 m!949615))

(declare-fun m!949875 () Bool)

(assert (=> b!1030386 m!949875))

(assert (=> b!1030386 m!949621))

(declare-fun m!949877 () Bool)

(assert (=> b!1030383 m!949877))

(assert (=> b!1030383 m!949877))

(declare-fun m!949879 () Bool)

(assert (=> b!1030383 m!949879))

(declare-fun m!949881 () Bool)

(assert (=> d!123629 m!949881))

(assert (=> b!1030179 d!123629))

(declare-fun b!1030395 () Bool)

(declare-fun e!581801 () Bool)

(declare-fun call!43497 () Bool)

(assert (=> b!1030395 (= e!581801 call!43497)))

(declare-fun b!1030396 () Bool)

(declare-fun e!581803 () Bool)

(assert (=> b!1030396 (= e!581803 call!43497)))

(declare-fun b!1030397 () Bool)

(assert (=> b!1030397 (= e!581803 e!581801)))

(declare-fun lt!454037 () (_ BitVec 64))

(assert (=> b!1030397 (= lt!454037 (select (arr!31159 lt!453859) #b00000000000000000000000000000000))))

(declare-fun lt!454038 () Unit!33606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64719 (_ BitVec 64) (_ BitVec 32)) Unit!33606)

(assert (=> b!1030397 (= lt!454038 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!453859 lt!454037 #b00000000000000000000000000000000))))

(assert (=> b!1030397 (arrayContainsKey!0 lt!453859 lt!454037 #b00000000000000000000000000000000)))

(declare-fun lt!454036 () Unit!33606)

(assert (=> b!1030397 (= lt!454036 lt!454038)))

(declare-fun res!688956 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64719 (_ BitVec 32)) SeekEntryResult!9635)

(assert (=> b!1030397 (= res!688956 (= (seekEntryOrOpen!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000) lt!453859 (mask!29915 thiss!1427)) (Found!9635 #b00000000000000000000000000000000)))))

(assert (=> b!1030397 (=> (not res!688956) (not e!581801))))

(declare-fun bm!43494 () Bool)

(assert (=> bm!43494 (= call!43497 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!453859 (mask!29915 thiss!1427)))))

(declare-fun d!123631 () Bool)

(declare-fun res!688957 () Bool)

(declare-fun e!581802 () Bool)

(assert (=> d!123631 (=> res!688957 e!581802)))

(assert (=> d!123631 (= res!688957 (bvsge #b00000000000000000000000000000000 (size!31675 lt!453859)))))

(assert (=> d!123631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453859 (mask!29915 thiss!1427)) e!581802)))

(declare-fun b!1030398 () Bool)

(assert (=> b!1030398 (= e!581802 e!581803)))

(declare-fun c!104327 () Bool)

(assert (=> b!1030398 (= c!104327 (validKeyInArray!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(assert (= (and d!123631 (not res!688957)) b!1030398))

(assert (= (and b!1030398 c!104327) b!1030397))

(assert (= (and b!1030398 (not c!104327)) b!1030396))

(assert (= (and b!1030397 res!688956) b!1030395))

(assert (= (or b!1030395 b!1030396) bm!43494))

(assert (=> b!1030397 m!949775))

(declare-fun m!949883 () Bool)

(assert (=> b!1030397 m!949883))

(declare-fun m!949885 () Bool)

(assert (=> b!1030397 m!949885))

(assert (=> b!1030397 m!949775))

(declare-fun m!949887 () Bool)

(assert (=> b!1030397 m!949887))

(declare-fun m!949889 () Bool)

(assert (=> bm!43494 m!949889))

(assert (=> b!1030398 m!949775))

(assert (=> b!1030398 m!949775))

(assert (=> b!1030398 m!949787))

(assert (=> b!1030179 d!123631))

(declare-fun b!1030409 () Bool)

(declare-fun e!581813 () Bool)

(declare-fun call!43500 () Bool)

(assert (=> b!1030409 (= e!581813 call!43500)))

(declare-fun d!123633 () Bool)

(declare-fun res!688964 () Bool)

(declare-fun e!581814 () Bool)

(assert (=> d!123633 (=> res!688964 e!581814)))

(assert (=> d!123633 (= res!688964 (bvsge #b00000000000000000000000000000000 (size!31675 lt!453859)))))

(assert (=> d!123633 (= (arrayNoDuplicates!0 lt!453859 #b00000000000000000000000000000000 Nil!21804) e!581814)))

(declare-fun b!1030410 () Bool)

(declare-fun e!581815 () Bool)

(assert (=> b!1030410 (= e!581815 e!581813)))

(declare-fun c!104330 () Bool)

(assert (=> b!1030410 (= c!104330 (validKeyInArray!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(declare-fun b!1030411 () Bool)

(assert (=> b!1030411 (= e!581814 e!581815)))

(declare-fun res!688966 () Bool)

(assert (=> b!1030411 (=> (not res!688966) (not e!581815))))

(declare-fun e!581812 () Bool)

(assert (=> b!1030411 (= res!688966 (not e!581812))))

(declare-fun res!688965 () Bool)

(assert (=> b!1030411 (=> (not res!688965) (not e!581812))))

(assert (=> b!1030411 (= res!688965 (validKeyInArray!0 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(declare-fun bm!43497 () Bool)

(assert (=> bm!43497 (= call!43500 (arrayNoDuplicates!0 lt!453859 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104330 (Cons!21803 (select (arr!31159 lt!453859) #b00000000000000000000000000000000) Nil!21804) Nil!21804)))))

(declare-fun b!1030412 () Bool)

(assert (=> b!1030412 (= e!581813 call!43500)))

(declare-fun b!1030413 () Bool)

(declare-fun contains!5996 (List!21807 (_ BitVec 64)) Bool)

(assert (=> b!1030413 (= e!581812 (contains!5996 Nil!21804 (select (arr!31159 lt!453859) #b00000000000000000000000000000000)))))

(assert (= (and d!123633 (not res!688964)) b!1030411))

(assert (= (and b!1030411 res!688965) b!1030413))

(assert (= (and b!1030411 res!688966) b!1030410))

(assert (= (and b!1030410 c!104330) b!1030409))

(assert (= (and b!1030410 (not c!104330)) b!1030412))

(assert (= (or b!1030409 b!1030412) bm!43497))

(assert (=> b!1030410 m!949775))

(assert (=> b!1030410 m!949775))

(assert (=> b!1030410 m!949787))

(assert (=> b!1030411 m!949775))

(assert (=> b!1030411 m!949775))

(assert (=> b!1030411 m!949787))

(assert (=> bm!43497 m!949775))

(declare-fun m!949891 () Bool)

(assert (=> bm!43497 m!949891))

(assert (=> b!1030413 m!949775))

(assert (=> b!1030413 m!949775))

(declare-fun m!949893 () Bool)

(assert (=> b!1030413 m!949893))

(assert (=> b!1030179 d!123633))

(declare-fun d!123635 () Bool)

(declare-fun lt!454041 () ListLongMap!13689)

(assert (=> d!123635 (not (contains!5995 lt!454041 key!909))))

(declare-fun removeStrictlySorted!51 (List!21806 (_ BitVec 64)) List!21806)

(assert (=> d!123635 (= lt!454041 (ListLongMap!13690 (removeStrictlySorted!51 (toList!6860 (getCurrentListMap!3906 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427))) key!909)))))

(assert (=> d!123635 (= (-!483 (getCurrentListMap!3906 (_keys!11306 thiss!1427) (_values!6132 thiss!1427) (mask!29915 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) lt!454041)))

(declare-fun bs!30072 () Bool)

(assert (= bs!30072 d!123635))

(declare-fun m!949895 () Bool)

(assert (=> bs!30072 m!949895))

(declare-fun m!949897 () Bool)

(assert (=> bs!30072 m!949897))

(assert (=> b!1030179 d!123635))

(declare-fun d!123637 () Bool)

(assert (=> d!123637 (= (validMask!0 (mask!29915 (_2!7790 lt!453854))) (and (or (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000000000111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000000001111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000000011111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000000111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000001111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000011111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000000111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000001111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000011111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000000111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000001111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000011111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000000111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000001111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000011111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000000111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000001111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000011111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000000111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000001111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000011111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000000111111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000001111111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000011111111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00000111111111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00001111111111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00011111111111111111111111111111) (= (mask!29915 (_2!7790 lt!453854)) #b00111111111111111111111111111111)) (bvsle (mask!29915 (_2!7790 lt!453854)) #b00111111111111111111111111111111)))))

(assert (=> b!1030179 d!123637))

(declare-fun d!123639 () Bool)

(declare-fun e!581818 () Bool)

(assert (=> d!123639 e!581818))

(declare-fun res!688969 () Bool)

(assert (=> d!123639 (=> (not res!688969) (not e!581818))))

(assert (=> d!123639 (= res!688969 (and (bvsge (index!40912 lt!453860) #b00000000000000000000000000000000) (bvslt (index!40912 lt!453860) (size!31675 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454044 () Unit!33606)

(declare-fun choose!53 (array!64719 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21807) Unit!33606)

(assert (=> d!123639 (= lt!454044 (choose!53 (_keys!11306 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40912 lt!453860) #b00000000000000000000000000000000 Nil!21804))))

(assert (=> d!123639 (bvslt (size!31675 (_keys!11306 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123639 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11306 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40912 lt!453860) #b00000000000000000000000000000000 Nil!21804) lt!454044)))

(declare-fun b!1030416 () Bool)

(assert (=> b!1030416 (= e!581818 (arrayNoDuplicates!0 (array!64720 (store (arr!31159 (_keys!11306 thiss!1427)) (index!40912 lt!453860) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31675 (_keys!11306 thiss!1427))) #b00000000000000000000000000000000 Nil!21804))))

(assert (= (and d!123639 res!688969) b!1030416))

(declare-fun m!949899 () Bool)

(assert (=> d!123639 m!949899))

(assert (=> b!1030416 m!949615))

(declare-fun m!949901 () Bool)

(assert (=> b!1030416 m!949901))

(assert (=> b!1030179 d!123639))

(declare-fun b!1030417 () Bool)

(declare-fun e!581820 () (_ BitVec 32))

(declare-fun call!43501 () (_ BitVec 32))

(assert (=> b!1030417 (= e!581820 call!43501)))

(declare-fun b!1030418 () Bool)

(declare-fun e!581819 () (_ BitVec 32))

(assert (=> b!1030418 (= e!581819 e!581820)))

(declare-fun c!104331 () Bool)

(assert (=> b!1030418 (= c!104331 (validKeyInArray!0 (select (arr!31159 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43498 () Bool)

(assert (=> bm!43498 (= call!43501 (arrayCountValidKeys!0 (_keys!11306 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31675 (_keys!11306 thiss!1427))))))

(declare-fun b!1030419 () Bool)

(assert (=> b!1030419 (= e!581819 #b00000000000000000000000000000000)))

(declare-fun b!1030420 () Bool)

(assert (=> b!1030420 (= e!581820 (bvadd #b00000000000000000000000000000001 call!43501))))

(declare-fun d!123641 () Bool)

(declare-fun lt!454045 () (_ BitVec 32))

(assert (=> d!123641 (and (bvsge lt!454045 #b00000000000000000000000000000000) (bvsle lt!454045 (bvsub (size!31675 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123641 (= lt!454045 e!581819)))

(declare-fun c!104332 () Bool)

(assert (=> d!123641 (= c!104332 (bvsge #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))))))

(assert (=> d!123641 (and (bvsle #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31675 (_keys!11306 thiss!1427)) (size!31675 (_keys!11306 thiss!1427))))))

(assert (=> d!123641 (= (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31675 (_keys!11306 thiss!1427))) lt!454045)))

(assert (= (and d!123641 c!104332) b!1030419))

(assert (= (and d!123641 (not c!104332)) b!1030418))

(assert (= (and b!1030418 c!104331) b!1030420))

(assert (= (and b!1030418 (not c!104331)) b!1030417))

(assert (= (or b!1030420 b!1030417) bm!43498))

(assert (=> b!1030418 m!949837))

(assert (=> b!1030418 m!949837))

(assert (=> b!1030418 m!949849))

(declare-fun m!949903 () Bool)

(assert (=> bm!43498 m!949903))

(assert (=> b!1030179 d!123641))

(declare-fun d!123643 () Bool)

(assert (=> d!123643 (= (array_inv!24137 (_keys!11306 thiss!1427)) (bvsge (size!31675 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030176 d!123643))

(declare-fun d!123645 () Bool)

(assert (=> d!123645 (= (array_inv!24138 (_values!6132 thiss!1427)) (bvsge (size!31676 (_values!6132 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030176 d!123645))

(declare-fun b!1030427 () Bool)

(declare-fun e!581826 () Bool)

(assert (=> b!1030427 (= e!581826 tp_is_empty!24307)))

(declare-fun mapIsEmpty!37909 () Bool)

(declare-fun mapRes!37909 () Bool)

(assert (=> mapIsEmpty!37909 mapRes!37909))

(declare-fun mapNonEmpty!37909 () Bool)

(declare-fun tp!72833 () Bool)

(assert (=> mapNonEmpty!37909 (= mapRes!37909 (and tp!72833 e!581826))))

(declare-fun mapValue!37909 () ValueCell!11450)

(declare-fun mapRest!37909 () (Array (_ BitVec 32) ValueCell!11450))

(declare-fun mapKey!37909 () (_ BitVec 32))

(assert (=> mapNonEmpty!37909 (= mapRest!37900 (store mapRest!37909 mapKey!37909 mapValue!37909))))

(declare-fun condMapEmpty!37909 () Bool)

(declare-fun mapDefault!37909 () ValueCell!11450)

(assert (=> mapNonEmpty!37900 (= condMapEmpty!37909 (= mapRest!37900 ((as const (Array (_ BitVec 32) ValueCell!11450)) mapDefault!37909)))))

(declare-fun e!581825 () Bool)

(assert (=> mapNonEmpty!37900 (= tp!72817 (and e!581825 mapRes!37909))))

(declare-fun b!1030428 () Bool)

(assert (=> b!1030428 (= e!581825 tp_is_empty!24307)))

(assert (= (and mapNonEmpty!37900 condMapEmpty!37909) mapIsEmpty!37909))

(assert (= (and mapNonEmpty!37900 (not condMapEmpty!37909)) mapNonEmpty!37909))

(assert (= (and mapNonEmpty!37909 ((_ is ValueCellFull!11450) mapValue!37909)) b!1030427))

(assert (= (and mapNonEmpty!37900 ((_ is ValueCellFull!11450) mapDefault!37909)) b!1030428))

(declare-fun m!949905 () Bool)

(assert (=> mapNonEmpty!37909 m!949905))

(declare-fun b_lambda!15851 () Bool)

(assert (= b_lambda!15845 (or (and b!1030176 b_free!20587) b_lambda!15851)))

(declare-fun b_lambda!15853 () Bool)

(assert (= b_lambda!15847 (or (and b!1030176 b_free!20587) b_lambda!15853)))

(declare-fun b_lambda!15855 () Bool)

(assert (= b_lambda!15849 (or (and b!1030176 b_free!20587) b_lambda!15855)))

(check-sat (not b!1030418) (not d!123627) (not d!123613) (not b!1030356) (not b!1030245) (not d!123635) (not b!1030355) (not b!1030384) (not b!1030324) (not d!123621) (not d!123615) (not b_next!20587) (not b!1030338) (not bm!43486) (not d!123617) (not b!1030349) (not b!1030383) tp_is_empty!24307 (not b!1030371) (not b!1030347) b_and!32919 (not b!1030243) (not b!1030346) (not b!1030263) (not b!1030386) (not b!1030413) (not bm!43498) (not mapNonEmpty!37909) (not b!1030411) (not d!123611) (not bm!43484) (not bm!43485) (not b!1030340) (not d!123625) (not b!1030329) (not b!1030308) (not b!1030319) (not bm!43476) (not d!123629) (not b!1030317) (not b!1030354) (not b!1030310) (not b_lambda!15843) (not d!123639) (not b!1030366) (not b!1030410) (not bm!43478) (not b!1030316) (not b!1030416) (not b_lambda!15851) (not b!1030397) (not bm!43494) (not b!1030325) (not b!1030244) (not b!1030374) (not bm!43497) (not b!1030326) (not bm!43483) (not bm!43479) (not b_lambda!15855) (not bm!43491) (not b_lambda!15853) (not bm!43477) (not b!1030335) (not b!1030398))
(check-sat b_and!32919 (not b_next!20587))
