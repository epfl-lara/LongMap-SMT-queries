; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90030 () Bool)

(assert start!90030)

(declare-fun b!1031001 () Bool)

(declare-fun b_free!20637 () Bool)

(declare-fun b_next!20637 () Bool)

(assert (=> b!1031001 (= b_free!20637 (not b_next!20637))))

(declare-fun tp!72981 () Bool)

(declare-fun b_and!33041 () Bool)

(assert (=> b!1031001 (= tp!72981 b_and!33041)))

(declare-fun b!1030992 () Bool)

(declare-fun res!689381 () Bool)

(declare-fun e!582255 () Bool)

(assert (=> b!1030992 (=> res!689381 e!582255)))

(declare-datatypes ((V!37349 0))(
  ( (V!37350 (val!12229 Int)) )
))
(declare-datatypes ((ValueCell!11475 0))(
  ( (ValueCellFull!11475 (v!14806 V!37349)) (EmptyCell!11475) )
))
(declare-datatypes ((Unit!33689 0))(
  ( (Unit!33690) )
))
(declare-datatypes ((array!64778 0))(
  ( (array!64779 (arr!31191 (Array (_ BitVec 32) (_ BitVec 64))) (size!31708 (_ BitVec 32))) )
))
(declare-datatypes ((array!64780 0))(
  ( (array!64781 (arr!31192 (Array (_ BitVec 32) ValueCell!11475)) (size!31709 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5544 0))(
  ( (LongMapFixedSize!5545 (defaultEntry!6146 Int) (mask!29934 (_ BitVec 32)) (extraKeys!5878 (_ BitVec 32)) (zeroValue!5982 V!37349) (minValue!5982 V!37349) (_size!2827 (_ BitVec 32)) (_keys!11319 array!64778) (_values!6169 array!64780) (_vacant!2827 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15616 0))(
  ( (tuple2!15617 (_1!7819 Unit!33689) (_2!7819 LongMapFixedSize!5544)) )
))
(declare-fun lt!454982 () tuple2!15616)

(assert (=> b!1030992 (= res!689381 (or (not (= (size!31709 (_values!6169 (_2!7819 lt!454982))) (bvadd #b00000000000000000000000000000001 (mask!29934 (_2!7819 lt!454982))))) (not (= (size!31708 (_keys!11319 (_2!7819 lt!454982))) (size!31709 (_values!6169 (_2!7819 lt!454982))))) (bvslt (mask!29934 (_2!7819 lt!454982)) #b00000000000000000000000000000000) (bvslt (extraKeys!5878 (_2!7819 lt!454982)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5878 (_2!7819 lt!454982)) #b00000000000000000000000000000011)))))

(declare-fun b!1030993 () Bool)

(declare-fun e!582258 () Bool)

(assert (=> b!1030993 (= e!582258 (not e!582255))))

(declare-fun res!689384 () Bool)

(assert (=> b!1030993 (=> res!689384 e!582255)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15618 0))(
  ( (tuple2!15619 (_1!7820 (_ BitVec 64)) (_2!7820 V!37349)) )
))
(declare-datatypes ((List!21848 0))(
  ( (Nil!21845) (Cons!21844 (h!23046 tuple2!15618) (t!30980 List!21848)) )
))
(declare-datatypes ((ListLongMap!13707 0))(
  ( (ListLongMap!13708 (toList!6869 List!21848)) )
))
(declare-fun contains!5983 (ListLongMap!13707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3917 (array!64778 array!64780 (_ BitVec 32) (_ BitVec 32) V!37349 V!37349 (_ BitVec 32) Int) ListLongMap!13707)

(assert (=> b!1030993 (= res!689384 (not (contains!5983 (getCurrentListMap!3917 (_keys!11319 (_2!7819 lt!454982)) (_values!6169 (_2!7819 lt!454982)) (mask!29934 (_2!7819 lt!454982)) (extraKeys!5878 (_2!7819 lt!454982)) (zeroValue!5982 (_2!7819 lt!454982)) (minValue!5982 (_2!7819 lt!454982)) #b00000000000000000000000000000000 (defaultEntry!6146 (_2!7819 lt!454982))) key!909)))))

(declare-fun lt!454985 () array!64780)

(declare-fun thiss!1427 () LongMapFixedSize!5544)

(declare-fun lt!454986 () array!64778)

(declare-fun Unit!33691 () Unit!33689)

(declare-fun Unit!33692 () Unit!33689)

(assert (=> b!1030993 (= lt!454982 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2827 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15617 Unit!33691 (LongMapFixedSize!5545 (defaultEntry!6146 thiss!1427) (mask!29934 thiss!1427) (extraKeys!5878 thiss!1427) (zeroValue!5982 thiss!1427) (minValue!5982 thiss!1427) (bvsub (_size!2827 thiss!1427) #b00000000000000000000000000000001) lt!454986 lt!454985 (bvadd #b00000000000000000000000000000001 (_vacant!2827 thiss!1427)))) (tuple2!15617 Unit!33692 (LongMapFixedSize!5545 (defaultEntry!6146 thiss!1427) (mask!29934 thiss!1427) (extraKeys!5878 thiss!1427) (zeroValue!5982 thiss!1427) (minValue!5982 thiss!1427) (bvsub (_size!2827 thiss!1427) #b00000000000000000000000000000001) lt!454986 lt!454985 (_vacant!2827 thiss!1427)))))))

(declare-fun -!496 (ListLongMap!13707 (_ BitVec 64)) ListLongMap!13707)

(assert (=> b!1030993 (= (-!496 (getCurrentListMap!3917 (_keys!11319 thiss!1427) (_values!6169 thiss!1427) (mask!29934 thiss!1427) (extraKeys!5878 thiss!1427) (zeroValue!5982 thiss!1427) (minValue!5982 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6146 thiss!1427)) key!909) (getCurrentListMap!3917 lt!454986 lt!454985 (mask!29934 thiss!1427) (extraKeys!5878 thiss!1427) (zeroValue!5982 thiss!1427) (minValue!5982 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6146 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9697 0))(
  ( (MissingZero!9697 (index!41159 (_ BitVec 32))) (Found!9697 (index!41160 (_ BitVec 32))) (Intermediate!9697 (undefined!10509 Bool) (index!41161 (_ BitVec 32)) (x!91779 (_ BitVec 32))) (Undefined!9697) (MissingVacant!9697 (index!41162 (_ BitVec 32))) )
))
(declare-fun lt!454988 () SeekEntryResult!9697)

(declare-fun dynLambda!1966 (Int (_ BitVec 64)) V!37349)

(assert (=> b!1030993 (= lt!454985 (array!64781 (store (arr!31192 (_values!6169 thiss!1427)) (index!41160 lt!454988) (ValueCellFull!11475 (dynLambda!1966 (defaultEntry!6146 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31709 (_values!6169 thiss!1427))))))

(declare-fun lt!454987 () Unit!33689)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!22 (array!64778 array!64780 (_ BitVec 32) (_ BitVec 32) V!37349 V!37349 (_ BitVec 32) (_ BitVec 64) Int) Unit!33689)

(assert (=> b!1030993 (= lt!454987 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!22 (_keys!11319 thiss!1427) (_values!6169 thiss!1427) (mask!29934 thiss!1427) (extraKeys!5878 thiss!1427) (zeroValue!5982 thiss!1427) (minValue!5982 thiss!1427) (index!41160 lt!454988) key!909 (defaultEntry!6146 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030993 (not (arrayContainsKey!0 lt!454986 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454983 () Unit!33689)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64778 (_ BitVec 32) (_ BitVec 64)) Unit!33689)

(assert (=> b!1030993 (= lt!454983 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11319 thiss!1427) (index!41160 lt!454988) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64778 (_ BitVec 32)) Bool)

(assert (=> b!1030993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454986 (mask!29934 thiss!1427))))

(declare-fun lt!454990 () Unit!33689)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64778 (_ BitVec 32) (_ BitVec 32)) Unit!33689)

(assert (=> b!1030993 (= lt!454990 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11319 thiss!1427) (index!41160 lt!454988) (mask!29934 thiss!1427)))))

(declare-datatypes ((List!21849 0))(
  ( (Nil!21846) (Cons!21845 (h!23047 (_ BitVec 64)) (t!30981 List!21849)) )
))
(declare-fun arrayNoDuplicates!0 (array!64778 (_ BitVec 32) List!21849) Bool)

(assert (=> b!1030993 (arrayNoDuplicates!0 lt!454986 #b00000000000000000000000000000000 Nil!21846)))

(declare-fun lt!454991 () Unit!33689)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64778 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21849) Unit!33689)

(assert (=> b!1030993 (= lt!454991 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11319 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41160 lt!454988) #b00000000000000000000000000000000 Nil!21846))))

(declare-fun arrayCountValidKeys!0 (array!64778 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030993 (= (arrayCountValidKeys!0 lt!454986 #b00000000000000000000000000000000 (size!31708 (_keys!11319 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11319 thiss!1427) #b00000000000000000000000000000000 (size!31708 (_keys!11319 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030993 (= lt!454986 (array!64779 (store (arr!31191 (_keys!11319 thiss!1427)) (index!41160 lt!454988) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31708 (_keys!11319 thiss!1427))))))

(declare-fun lt!454984 () Unit!33689)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64778 (_ BitVec 32) (_ BitVec 64)) Unit!33689)

(assert (=> b!1030993 (= lt!454984 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11319 thiss!1427) (index!41160 lt!454988) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030995 () Bool)

(declare-fun e!582259 () Bool)

(declare-fun tp_is_empty!24357 () Bool)

(assert (=> b!1030995 (= e!582259 tp_is_empty!24357)))

(declare-fun b!1030996 () Bool)

(declare-fun res!689380 () Bool)

(declare-fun e!582254 () Bool)

(assert (=> b!1030996 (=> (not res!689380) (not e!582254))))

(assert (=> b!1030996 (= res!689380 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030997 () Bool)

(assert (=> b!1030997 (= e!582255 true)))

(declare-fun lt!454989 () Bool)

(assert (=> b!1030997 (= lt!454989 (arrayNoDuplicates!0 (_keys!11319 (_2!7819 lt!454982)) #b00000000000000000000000000000000 Nil!21846))))

(declare-fun b!1030998 () Bool)

(declare-fun e!582257 () Bool)

(assert (=> b!1030998 (= e!582257 tp_is_empty!24357)))

(declare-fun mapNonEmpty!37989 () Bool)

(declare-fun mapRes!37989 () Bool)

(declare-fun tp!72982 () Bool)

(assert (=> mapNonEmpty!37989 (= mapRes!37989 (and tp!72982 e!582259))))

(declare-fun mapValue!37989 () ValueCell!11475)

(declare-fun mapKey!37989 () (_ BitVec 32))

(declare-fun mapRest!37989 () (Array (_ BitVec 32) ValueCell!11475))

(assert (=> mapNonEmpty!37989 (= (arr!31192 (_values!6169 thiss!1427)) (store mapRest!37989 mapKey!37989 mapValue!37989))))

(declare-fun mapIsEmpty!37989 () Bool)

(assert (=> mapIsEmpty!37989 mapRes!37989))

(declare-fun b!1030999 () Bool)

(declare-fun e!582261 () Bool)

(assert (=> b!1030999 (= e!582261 (and e!582257 mapRes!37989))))

(declare-fun condMapEmpty!37989 () Bool)

(declare-fun mapDefault!37989 () ValueCell!11475)

(assert (=> b!1030999 (= condMapEmpty!37989 (= (arr!31192 (_values!6169 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11475)) mapDefault!37989)))))

(declare-fun b!1031000 () Bool)

(declare-fun res!689383 () Bool)

(assert (=> b!1031000 (=> res!689383 e!582255)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031000 (= res!689383 (not (validMask!0 (mask!29934 (_2!7819 lt!454982)))))))

(declare-fun e!582256 () Bool)

(declare-fun array_inv!24143 (array!64778) Bool)

(declare-fun array_inv!24144 (array!64780) Bool)

(assert (=> b!1031001 (= e!582256 (and tp!72981 tp_is_empty!24357 (array_inv!24143 (_keys!11319 thiss!1427)) (array_inv!24144 (_values!6169 thiss!1427)) e!582261))))

(declare-fun b!1031002 () Bool)

(declare-fun res!689378 () Bool)

(assert (=> b!1031002 (=> res!689378 e!582255)))

(assert (=> b!1031002 (= res!689378 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11319 (_2!7819 lt!454982)) (mask!29934 (_2!7819 lt!454982)))))))

(declare-fun b!1030994 () Bool)

(assert (=> b!1030994 (= e!582254 e!582258)))

(declare-fun res!689382 () Bool)

(assert (=> b!1030994 (=> (not res!689382) (not e!582258))))

(get-info :version)

(assert (=> b!1030994 (= res!689382 ((_ is Found!9697) lt!454988))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64778 (_ BitVec 32)) SeekEntryResult!9697)

(assert (=> b!1030994 (= lt!454988 (seekEntry!0 key!909 (_keys!11319 thiss!1427) (mask!29934 thiss!1427)))))

(declare-fun res!689379 () Bool)

(assert (=> start!90030 (=> (not res!689379) (not e!582254))))

(declare-fun valid!2099 (LongMapFixedSize!5544) Bool)

(assert (=> start!90030 (= res!689379 (valid!2099 thiss!1427))))

(assert (=> start!90030 e!582254))

(assert (=> start!90030 e!582256))

(assert (=> start!90030 true))

(assert (= (and start!90030 res!689379) b!1030996))

(assert (= (and b!1030996 res!689380) b!1030994))

(assert (= (and b!1030994 res!689382) b!1030993))

(assert (= (and b!1030993 (not res!689384)) b!1031000))

(assert (= (and b!1031000 (not res!689383)) b!1030992))

(assert (= (and b!1030992 (not res!689381)) b!1031002))

(assert (= (and b!1031002 (not res!689378)) b!1030997))

(assert (= (and b!1030999 condMapEmpty!37989) mapIsEmpty!37989))

(assert (= (and b!1030999 (not condMapEmpty!37989)) mapNonEmpty!37989))

(assert (= (and mapNonEmpty!37989 ((_ is ValueCellFull!11475) mapValue!37989)) b!1030995))

(assert (= (and b!1030999 ((_ is ValueCellFull!11475) mapDefault!37989)) b!1030998))

(assert (= b!1031001 b!1030999))

(assert (= start!90030 b!1031001))

(declare-fun b_lambda!15981 () Bool)

(assert (=> (not b_lambda!15981) (not b!1030993)))

(declare-fun t!30979 () Bool)

(declare-fun tb!6955 () Bool)

(assert (=> (and b!1031001 (= (defaultEntry!6146 thiss!1427) (defaultEntry!6146 thiss!1427)) t!30979) tb!6955))

(declare-fun result!14239 () Bool)

(assert (=> tb!6955 (= result!14239 tp_is_empty!24357)))

(assert (=> b!1030993 t!30979))

(declare-fun b_and!33043 () Bool)

(assert (= b_and!33041 (and (=> t!30979 result!14239) b_and!33043)))

(declare-fun m!950893 () Bool)

(assert (=> b!1031002 m!950893))

(declare-fun m!950895 () Bool)

(assert (=> b!1031000 m!950895))

(declare-fun m!950897 () Bool)

(assert (=> b!1030994 m!950897))

(declare-fun m!950899 () Bool)

(assert (=> start!90030 m!950899))

(declare-fun m!950901 () Bool)

(assert (=> b!1031001 m!950901))

(declare-fun m!950903 () Bool)

(assert (=> b!1031001 m!950903))

(declare-fun m!950905 () Bool)

(assert (=> b!1030997 m!950905))

(declare-fun m!950907 () Bool)

(assert (=> mapNonEmpty!37989 m!950907))

(declare-fun m!950909 () Bool)

(assert (=> b!1030993 m!950909))

(declare-fun m!950911 () Bool)

(assert (=> b!1030993 m!950911))

(declare-fun m!950913 () Bool)

(assert (=> b!1030993 m!950913))

(declare-fun m!950915 () Bool)

(assert (=> b!1030993 m!950915))

(declare-fun m!950917 () Bool)

(assert (=> b!1030993 m!950917))

(declare-fun m!950919 () Bool)

(assert (=> b!1030993 m!950919))

(declare-fun m!950921 () Bool)

(assert (=> b!1030993 m!950921))

(declare-fun m!950923 () Bool)

(assert (=> b!1030993 m!950923))

(declare-fun m!950925 () Bool)

(assert (=> b!1030993 m!950925))

(declare-fun m!950927 () Bool)

(assert (=> b!1030993 m!950927))

(declare-fun m!950929 () Bool)

(assert (=> b!1030993 m!950929))

(declare-fun m!950931 () Bool)

(assert (=> b!1030993 m!950931))

(declare-fun m!950933 () Bool)

(assert (=> b!1030993 m!950933))

(declare-fun m!950935 () Bool)

(assert (=> b!1030993 m!950935))

(assert (=> b!1030993 m!950911))

(declare-fun m!950937 () Bool)

(assert (=> b!1030993 m!950937))

(assert (=> b!1030993 m!950925))

(declare-fun m!950939 () Bool)

(assert (=> b!1030993 m!950939))

(declare-fun m!950941 () Bool)

(assert (=> b!1030993 m!950941))

(declare-fun m!950943 () Bool)

(assert (=> b!1030993 m!950943))

(check-sat (not b!1031002) (not b!1031000) (not start!90030) tp_is_empty!24357 (not mapNonEmpty!37989) (not b_next!20637) b_and!33043 (not b!1030994) (not b_lambda!15981) (not b!1030997) (not b!1030993) (not b!1031001))
(check-sat b_and!33043 (not b_next!20637))
