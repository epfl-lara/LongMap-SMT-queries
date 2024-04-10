; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91974 () Bool)

(assert start!91974)

(declare-fun b!1045887 () Bool)

(declare-fun b_free!21147 () Bool)

(declare-fun b_next!21147 () Bool)

(assert (=> b!1045887 (= b_free!21147 (not b_next!21147))))

(declare-fun tp!74703 () Bool)

(declare-fun b_and!33789 () Bool)

(assert (=> b!1045887 (= tp!74703 b_and!33789)))

(declare-fun b!1045882 () Bool)

(declare-fun e!592913 () Bool)

(declare-fun e!592910 () Bool)

(assert (=> b!1045882 (= e!592913 e!592910)))

(declare-fun res!696317 () Bool)

(assert (=> b!1045882 (=> (not res!696317) (not e!592910))))

(declare-datatypes ((SeekEntryResult!9850 0))(
  ( (MissingZero!9850 (index!41771 (_ BitVec 32))) (Found!9850 (index!41772 (_ BitVec 32))) (Intermediate!9850 (undefined!10662 Bool) (index!41773 (_ BitVec 32)) (x!93426 (_ BitVec 32))) (Undefined!9850) (MissingVacant!9850 (index!41774 (_ BitVec 32))) )
))
(declare-fun lt!461870 () SeekEntryResult!9850)

(get-info :version)

(assert (=> b!1045882 (= res!696317 ((_ is Found!9850) lt!461870))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!38029 0))(
  ( (V!38030 (val!12484 Int)) )
))
(declare-datatypes ((ValueCell!11730 0))(
  ( (ValueCellFull!11730 (v!15081 V!38029)) (EmptyCell!11730) )
))
(declare-datatypes ((array!65912 0))(
  ( (array!65913 (arr!31701 (Array (_ BitVec 32) (_ BitVec 64))) (size!32236 (_ BitVec 32))) )
))
(declare-datatypes ((array!65914 0))(
  ( (array!65915 (arr!31702 (Array (_ BitVec 32) ValueCell!11730)) (size!32237 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6054 0))(
  ( (LongMapFixedSize!6055 (defaultEntry!6425 Int) (mask!30562 (_ BitVec 32)) (extraKeys!6153 (_ BitVec 32)) (zeroValue!6259 V!38029) (minValue!6259 V!38029) (_size!3082 (_ BitVec 32)) (_keys!11699 array!65912) (_values!6448 array!65914) (_vacant!3082 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6054)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65912 (_ BitVec 32)) SeekEntryResult!9850)

(assert (=> b!1045882 (= lt!461870 (seekEntry!0 key!909 (_keys!11699 thiss!1427) (mask!30562 thiss!1427)))))

(declare-fun b!1045883 () Bool)

(declare-fun e!592911 () Bool)

(declare-datatypes ((Unit!34163 0))(
  ( (Unit!34164) )
))
(declare-datatypes ((tuple2!15800 0))(
  ( (tuple2!15801 (_1!7911 Unit!34163) (_2!7911 LongMapFixedSize!6054)) )
))
(declare-fun lt!461867 () tuple2!15800)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65912 (_ BitVec 32)) Bool)

(assert (=> b!1045883 (= e!592911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11699 (_2!7911 lt!461867)) (mask!30562 (_2!7911 lt!461867))))))

(declare-fun b!1045884 () Bool)

(declare-fun e!592917 () Bool)

(declare-fun e!592916 () Bool)

(declare-fun mapRes!38945 () Bool)

(assert (=> b!1045884 (= e!592917 (and e!592916 mapRes!38945))))

(declare-fun condMapEmpty!38945 () Bool)

(declare-fun mapDefault!38945 () ValueCell!11730)

(assert (=> b!1045884 (= condMapEmpty!38945 (= (arr!31702 (_values!6448 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11730)) mapDefault!38945)))))

(declare-fun mapIsEmpty!38945 () Bool)

(assert (=> mapIsEmpty!38945 mapRes!38945))

(declare-fun b!1045885 () Bool)

(declare-fun res!696321 () Bool)

(assert (=> b!1045885 (=> res!696321 e!592911)))

(assert (=> b!1045885 (= res!696321 (or (not (= (size!32237 (_values!6448 (_2!7911 lt!461867))) (bvadd #b00000000000000000000000000000001 (mask!30562 (_2!7911 lt!461867))))) (not (= (size!32236 (_keys!11699 (_2!7911 lt!461867))) (size!32237 (_values!6448 (_2!7911 lt!461867))))) (bvslt (mask!30562 (_2!7911 lt!461867)) #b00000000000000000000000000000000) (bvslt (extraKeys!6153 (_2!7911 lt!461867)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6153 (_2!7911 lt!461867)) #b00000000000000000000000000000011)))))

(declare-fun b!1045886 () Bool)

(assert (=> b!1045886 (= e!592910 (not e!592911))))

(declare-fun res!696320 () Bool)

(assert (=> b!1045886 (=> res!696320 e!592911)))

(declare-datatypes ((tuple2!15802 0))(
  ( (tuple2!15803 (_1!7912 (_ BitVec 64)) (_2!7912 V!38029)) )
))
(declare-datatypes ((List!22022 0))(
  ( (Nil!22019) (Cons!22018 (h!23226 tuple2!15802) (t!31300 List!22022)) )
))
(declare-datatypes ((ListLongMap!13797 0))(
  ( (ListLongMap!13798 (toList!6914 List!22022)) )
))
(declare-fun contains!6084 (ListLongMap!13797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3962 (array!65912 array!65914 (_ BitVec 32) (_ BitVec 32) V!38029 V!38029 (_ BitVec 32) Int) ListLongMap!13797)

(assert (=> b!1045886 (= res!696320 (not (contains!6084 (getCurrentListMap!3962 (_keys!11699 (_2!7911 lt!461867)) (_values!6448 (_2!7911 lt!461867)) (mask!30562 (_2!7911 lt!461867)) (extraKeys!6153 (_2!7911 lt!461867)) (zeroValue!6259 (_2!7911 lt!461867)) (minValue!6259 (_2!7911 lt!461867)) #b00000000000000000000000000000000 (defaultEntry!6425 (_2!7911 lt!461867))) key!909)))))

(declare-fun lt!461868 () array!65914)

(declare-fun lt!461869 () array!65912)

(declare-fun Unit!34165 () Unit!34163)

(declare-fun Unit!34166 () Unit!34163)

(assert (=> b!1045886 (= lt!461867 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3082 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15801 Unit!34165 (LongMapFixedSize!6055 (defaultEntry!6425 thiss!1427) (mask!30562 thiss!1427) (extraKeys!6153 thiss!1427) (zeroValue!6259 thiss!1427) (minValue!6259 thiss!1427) (bvsub (_size!3082 thiss!1427) #b00000000000000000000000000000001) lt!461869 lt!461868 (bvadd #b00000000000000000000000000000001 (_vacant!3082 thiss!1427)))) (tuple2!15801 Unit!34166 (LongMapFixedSize!6055 (defaultEntry!6425 thiss!1427) (mask!30562 thiss!1427) (extraKeys!6153 thiss!1427) (zeroValue!6259 thiss!1427) (minValue!6259 thiss!1427) (bvsub (_size!3082 thiss!1427) #b00000000000000000000000000000001) lt!461869 lt!461868 (_vacant!3082 thiss!1427)))))))

(declare-fun -!541 (ListLongMap!13797 (_ BitVec 64)) ListLongMap!13797)

(assert (=> b!1045886 (= (-!541 (getCurrentListMap!3962 (_keys!11699 thiss!1427) (_values!6448 thiss!1427) (mask!30562 thiss!1427) (extraKeys!6153 thiss!1427) (zeroValue!6259 thiss!1427) (minValue!6259 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6425 thiss!1427)) key!909) (getCurrentListMap!3962 lt!461869 lt!461868 (mask!30562 thiss!1427) (extraKeys!6153 thiss!1427) (zeroValue!6259 thiss!1427) (minValue!6259 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6425 thiss!1427)))))

(declare-fun dynLambda!2011 (Int (_ BitVec 64)) V!38029)

(assert (=> b!1045886 (= lt!461868 (array!65915 (store (arr!31702 (_values!6448 thiss!1427)) (index!41772 lt!461870) (ValueCellFull!11730 (dynLambda!2011 (defaultEntry!6425 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32237 (_values!6448 thiss!1427))))))

(declare-fun lt!461872 () Unit!34163)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!62 (array!65912 array!65914 (_ BitVec 32) (_ BitVec 32) V!38029 V!38029 (_ BitVec 32) (_ BitVec 64) Int) Unit!34163)

(assert (=> b!1045886 (= lt!461872 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!62 (_keys!11699 thiss!1427) (_values!6448 thiss!1427) (mask!30562 thiss!1427) (extraKeys!6153 thiss!1427) (zeroValue!6259 thiss!1427) (minValue!6259 thiss!1427) (index!41772 lt!461870) key!909 (defaultEntry!6425 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045886 (not (arrayContainsKey!0 lt!461869 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461871 () Unit!34163)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65912 (_ BitVec 32) (_ BitVec 64)) Unit!34163)

(assert (=> b!1045886 (= lt!461871 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11699 thiss!1427) (index!41772 lt!461870) key!909))))

(assert (=> b!1045886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461869 (mask!30562 thiss!1427))))

(declare-fun lt!461865 () Unit!34163)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65912 (_ BitVec 32) (_ BitVec 32)) Unit!34163)

(assert (=> b!1045886 (= lt!461865 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11699 thiss!1427) (index!41772 lt!461870) (mask!30562 thiss!1427)))))

(declare-datatypes ((List!22023 0))(
  ( (Nil!22020) (Cons!22019 (h!23227 (_ BitVec 64)) (t!31301 List!22023)) )
))
(declare-fun arrayNoDuplicates!0 (array!65912 (_ BitVec 32) List!22023) Bool)

(assert (=> b!1045886 (arrayNoDuplicates!0 lt!461869 #b00000000000000000000000000000000 Nil!22020)))

(declare-fun lt!461873 () Unit!34163)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65912 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22023) Unit!34163)

(assert (=> b!1045886 (= lt!461873 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11699 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41772 lt!461870) #b00000000000000000000000000000000 Nil!22020))))

(declare-fun arrayCountValidKeys!0 (array!65912 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045886 (= (arrayCountValidKeys!0 lt!461869 #b00000000000000000000000000000000 (size!32236 (_keys!11699 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11699 thiss!1427) #b00000000000000000000000000000000 (size!32236 (_keys!11699 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045886 (= lt!461869 (array!65913 (store (arr!31701 (_keys!11699 thiss!1427)) (index!41772 lt!461870) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32236 (_keys!11699 thiss!1427))))))

(declare-fun lt!461866 () Unit!34163)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65912 (_ BitVec 32) (_ BitVec 64)) Unit!34163)

(assert (=> b!1045886 (= lt!461866 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11699 thiss!1427) (index!41772 lt!461870) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!696316 () Bool)

(assert (=> start!91974 (=> (not res!696316) (not e!592913))))

(declare-fun valid!2271 (LongMapFixedSize!6054) Bool)

(assert (=> start!91974 (= res!696316 (valid!2271 thiss!1427))))

(assert (=> start!91974 e!592913))

(declare-fun e!592914 () Bool)

(assert (=> start!91974 e!592914))

(assert (=> start!91974 true))

(declare-fun tp_is_empty!24867 () Bool)

(declare-fun array_inv!24485 (array!65912) Bool)

(declare-fun array_inv!24486 (array!65914) Bool)

(assert (=> b!1045887 (= e!592914 (and tp!74703 tp_is_empty!24867 (array_inv!24485 (_keys!11699 thiss!1427)) (array_inv!24486 (_values!6448 thiss!1427)) e!592917))))

(declare-fun b!1045888 () Bool)

(declare-fun res!696319 () Bool)

(assert (=> b!1045888 (=> (not res!696319) (not e!592913))))

(assert (=> b!1045888 (= res!696319 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045889 () Bool)

(declare-fun res!696318 () Bool)

(assert (=> b!1045889 (=> res!696318 e!592911)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045889 (= res!696318 (not (validMask!0 (mask!30562 (_2!7911 lt!461867)))))))

(declare-fun b!1045890 () Bool)

(assert (=> b!1045890 (= e!592916 tp_is_empty!24867)))

(declare-fun mapNonEmpty!38945 () Bool)

(declare-fun tp!74702 () Bool)

(declare-fun e!592915 () Bool)

(assert (=> mapNonEmpty!38945 (= mapRes!38945 (and tp!74702 e!592915))))

(declare-fun mapValue!38945 () ValueCell!11730)

(declare-fun mapKey!38945 () (_ BitVec 32))

(declare-fun mapRest!38945 () (Array (_ BitVec 32) ValueCell!11730))

(assert (=> mapNonEmpty!38945 (= (arr!31702 (_values!6448 thiss!1427)) (store mapRest!38945 mapKey!38945 mapValue!38945))))

(declare-fun b!1045891 () Bool)

(assert (=> b!1045891 (= e!592915 tp_is_empty!24867)))

(assert (= (and start!91974 res!696316) b!1045888))

(assert (= (and b!1045888 res!696319) b!1045882))

(assert (= (and b!1045882 res!696317) b!1045886))

(assert (= (and b!1045886 (not res!696320)) b!1045889))

(assert (= (and b!1045889 (not res!696318)) b!1045885))

(assert (= (and b!1045885 (not res!696321)) b!1045883))

(assert (= (and b!1045884 condMapEmpty!38945) mapIsEmpty!38945))

(assert (= (and b!1045884 (not condMapEmpty!38945)) mapNonEmpty!38945))

(assert (= (and mapNonEmpty!38945 ((_ is ValueCellFull!11730) mapValue!38945)) b!1045891))

(assert (= (and b!1045884 ((_ is ValueCellFull!11730) mapDefault!38945)) b!1045890))

(assert (= b!1045887 b!1045884))

(assert (= start!91974 b!1045887))

(declare-fun b_lambda!16331 () Bool)

(assert (=> (not b_lambda!16331) (not b!1045886)))

(declare-fun t!31299 () Bool)

(declare-fun tb!7099 () Bool)

(assert (=> (and b!1045887 (= (defaultEntry!6425 thiss!1427) (defaultEntry!6425 thiss!1427)) t!31299) tb!7099))

(declare-fun result!14623 () Bool)

(assert (=> tb!7099 (= result!14623 tp_is_empty!24867)))

(assert (=> b!1045886 t!31299))

(declare-fun b_and!33791 () Bool)

(assert (= b_and!33789 (and (=> t!31299 result!14623) b_and!33791)))

(declare-fun m!965701 () Bool)

(assert (=> b!1045889 m!965701))

(declare-fun m!965703 () Bool)

(assert (=> b!1045886 m!965703))

(declare-fun m!965705 () Bool)

(assert (=> b!1045886 m!965705))

(declare-fun m!965707 () Bool)

(assert (=> b!1045886 m!965707))

(declare-fun m!965709 () Bool)

(assert (=> b!1045886 m!965709))

(declare-fun m!965711 () Bool)

(assert (=> b!1045886 m!965711))

(declare-fun m!965713 () Bool)

(assert (=> b!1045886 m!965713))

(declare-fun m!965715 () Bool)

(assert (=> b!1045886 m!965715))

(assert (=> b!1045886 m!965713))

(declare-fun m!965717 () Bool)

(assert (=> b!1045886 m!965717))

(declare-fun m!965719 () Bool)

(assert (=> b!1045886 m!965719))

(declare-fun m!965721 () Bool)

(assert (=> b!1045886 m!965721))

(declare-fun m!965723 () Bool)

(assert (=> b!1045886 m!965723))

(declare-fun m!965725 () Bool)

(assert (=> b!1045886 m!965725))

(declare-fun m!965727 () Bool)

(assert (=> b!1045886 m!965727))

(declare-fun m!965729 () Bool)

(assert (=> b!1045886 m!965729))

(declare-fun m!965731 () Bool)

(assert (=> b!1045886 m!965731))

(declare-fun m!965733 () Bool)

(assert (=> b!1045886 m!965733))

(assert (=> b!1045886 m!965729))

(declare-fun m!965735 () Bool)

(assert (=> b!1045886 m!965735))

(declare-fun m!965737 () Bool)

(assert (=> b!1045886 m!965737))

(declare-fun m!965739 () Bool)

(assert (=> b!1045883 m!965739))

(declare-fun m!965741 () Bool)

(assert (=> b!1045882 m!965741))

(declare-fun m!965743 () Bool)

(assert (=> b!1045887 m!965743))

(declare-fun m!965745 () Bool)

(assert (=> b!1045887 m!965745))

(declare-fun m!965747 () Bool)

(assert (=> mapNonEmpty!38945 m!965747))

(declare-fun m!965749 () Bool)

(assert (=> start!91974 m!965749))

(check-sat (not b_next!21147) (not start!91974) (not mapNonEmpty!38945) b_and!33791 (not b!1045887) tp_is_empty!24867 (not b_lambda!16331) (not b!1045889) (not b!1045883) (not b!1045886) (not b!1045882))
(check-sat b_and!33791 (not b_next!21147))
