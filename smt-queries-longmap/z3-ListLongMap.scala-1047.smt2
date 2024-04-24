; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21968 () Bool)

(assert start!21968)

(declare-fun b!224881 () Bool)

(declare-fun b_free!6031 () Bool)

(declare-fun b_next!6031 () Bool)

(assert (=> b!224881 (= b_free!6031 (not b_next!6031))))

(declare-fun tp!21235 () Bool)

(declare-fun b_and!12943 () Bool)

(assert (=> b!224881 (= tp!21235 b_and!12943)))

(declare-fun res!110650 () Bool)

(declare-fun e!145985 () Bool)

(assert (=> start!21968 (=> (not res!110650) (not e!145985))))

(declare-datatypes ((V!7505 0))(
  ( (V!7506 (val!2991 Int)) )
))
(declare-datatypes ((ValueCell!2603 0))(
  ( (ValueCellFull!2603 (v!5012 V!7505)) (EmptyCell!2603) )
))
(declare-datatypes ((array!11027 0))(
  ( (array!11028 (arr!5233 (Array (_ BitVec 32) ValueCell!2603)) (size!5566 (_ BitVec 32))) )
))
(declare-datatypes ((array!11029 0))(
  ( (array!11030 (arr!5234 (Array (_ BitVec 32) (_ BitVec 64))) (size!5567 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3106 0))(
  ( (LongMapFixedSize!3107 (defaultEntry!4212 Int) (mask!10050 (_ BitVec 32)) (extraKeys!3949 (_ BitVec 32)) (zeroValue!4053 V!7505) (minValue!4053 V!7505) (_size!1602 (_ BitVec 32)) (_keys!6266 array!11029) (_values!4195 array!11027) (_vacant!1602 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3106)

(declare-fun valid!1258 (LongMapFixedSize!3106) Bool)

(assert (=> start!21968 (= res!110650 (valid!1258 thiss!1504))))

(assert (=> start!21968 e!145985))

(declare-fun e!145988 () Bool)

(assert (=> start!21968 e!145988))

(assert (=> start!21968 true))

(declare-fun b!224874 () Bool)

(declare-fun e!145982 () Bool)

(declare-fun tp_is_empty!5893 () Bool)

(assert (=> b!224874 (= e!145982 tp_is_empty!5893)))

(declare-fun b!224875 () Bool)

(declare-fun e!145986 () Bool)

(declare-fun call!20915 () Bool)

(assert (=> b!224875 (= e!145986 (not call!20915))))

(declare-fun b!224876 () Bool)

(declare-fun e!145987 () Bool)

(assert (=> b!224876 (= e!145985 e!145987)))

(declare-fun res!110661 () Bool)

(assert (=> b!224876 (=> (not res!110661) (not e!145987))))

(declare-datatypes ((SeekEntryResult!835 0))(
  ( (MissingZero!835 (index!5510 (_ BitVec 32))) (Found!835 (index!5511 (_ BitVec 32))) (Intermediate!835 (undefined!1647 Bool) (index!5512 (_ BitVec 32)) (x!23127 (_ BitVec 32))) (Undefined!835) (MissingVacant!835 (index!5513 (_ BitVec 32))) )
))
(declare-fun lt!113337 () SeekEntryResult!835)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224876 (= res!110661 (or (= lt!113337 (MissingZero!835 index!297)) (= lt!113337 (MissingVacant!835 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11029 (_ BitVec 32)) SeekEntryResult!835)

(assert (=> b!224876 (= lt!113337 (seekEntryOrOpen!0 key!932 (_keys!6266 thiss!1504) (mask!10050 thiss!1504)))))

(declare-fun mapIsEmpty!10009 () Bool)

(declare-fun mapRes!10009 () Bool)

(assert (=> mapIsEmpty!10009 mapRes!10009))

(declare-fun b!224877 () Bool)

(declare-fun res!110655 () Bool)

(declare-fun e!145977 () Bool)

(assert (=> b!224877 (=> res!110655 e!145977)))

(assert (=> b!224877 (= res!110655 (or (not (= (size!5567 (_keys!6266 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10050 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5567 (_keys!6266 thiss!1504)))))))

(declare-fun bm!20912 () Bool)

(declare-fun arrayContainsKey!0 (array!11029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20912 (= call!20915 (arrayContainsKey!0 (_keys!6266 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224878 () Bool)

(declare-fun e!145981 () Bool)

(get-info :version)

(assert (=> b!224878 (= e!145981 ((_ is Undefined!835) lt!113337))))

(declare-fun b!224879 () Bool)

(declare-fun res!110651 () Bool)

(assert (=> b!224879 (=> (not res!110651) (not e!145985))))

(assert (=> b!224879 (= res!110651 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224880 () Bool)

(declare-datatypes ((Unit!6741 0))(
  ( (Unit!6742) )
))
(declare-fun e!145979 () Unit!6741)

(declare-fun Unit!6743 () Unit!6741)

(assert (=> b!224880 (= e!145979 Unit!6743)))

(declare-fun e!145975 () Bool)

(declare-fun array_inv!3439 (array!11029) Bool)

(declare-fun array_inv!3440 (array!11027) Bool)

(assert (=> b!224881 (= e!145988 (and tp!21235 tp_is_empty!5893 (array_inv!3439 (_keys!6266 thiss!1504)) (array_inv!3440 (_values!4195 thiss!1504)) e!145975))))

(declare-fun b!224882 () Bool)

(declare-fun e!145980 () Unit!6741)

(declare-fun lt!113338 () Unit!6741)

(assert (=> b!224882 (= e!145980 lt!113338)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!232 (array!11029 array!11027 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) Int) Unit!6741)

(assert (=> b!224882 (= lt!113338 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!232 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 (defaultEntry!4212 thiss!1504)))))

(declare-fun c!37295 () Bool)

(assert (=> b!224882 (= c!37295 ((_ is MissingZero!835) lt!113337))))

(declare-fun e!145983 () Bool)

(assert (=> b!224882 e!145983))

(declare-fun b!224883 () Bool)

(declare-fun e!145978 () Bool)

(assert (=> b!224883 (= e!145975 (and e!145978 mapRes!10009))))

(declare-fun condMapEmpty!10009 () Bool)

(declare-fun mapDefault!10009 () ValueCell!2603)

(assert (=> b!224883 (= condMapEmpty!10009 (= (arr!5233 (_values!4195 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2603)) mapDefault!10009)))))

(declare-fun b!224884 () Bool)

(declare-fun res!110657 () Bool)

(declare-fun e!145976 () Bool)

(assert (=> b!224884 (=> (not res!110657) (not e!145976))))

(assert (=> b!224884 (= res!110657 (= (select (arr!5234 (_keys!6266 thiss!1504)) (index!5510 lt!113337)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224885 () Bool)

(assert (=> b!224885 (= e!145977 true)))

(declare-fun lt!113343 () Bool)

(declare-datatypes ((List!3253 0))(
  ( (Nil!3250) (Cons!3249 (h!3897 (_ BitVec 64)) (t!8204 List!3253)) )
))
(declare-fun arrayNoDuplicates!0 (array!11029 (_ BitVec 32) List!3253) Bool)

(assert (=> b!224885 (= lt!113343 (arrayNoDuplicates!0 (_keys!6266 thiss!1504) #b00000000000000000000000000000000 Nil!3250))))

(declare-fun b!224886 () Bool)

(declare-fun c!37294 () Bool)

(assert (=> b!224886 (= c!37294 ((_ is MissingVacant!835) lt!113337))))

(assert (=> b!224886 (= e!145983 e!145981)))

(declare-fun b!224887 () Bool)

(declare-fun res!110654 () Bool)

(assert (=> b!224887 (=> res!110654 e!145977)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224887 (= res!110654 (not (validKeyInArray!0 key!932)))))

(declare-fun b!224888 () Bool)

(declare-fun res!110653 () Bool)

(assert (=> b!224888 (=> res!110653 e!145977)))

(declare-fun lt!113342 () Bool)

(assert (=> b!224888 (= res!110653 lt!113342)))

(declare-fun b!224889 () Bool)

(declare-fun res!110656 () Bool)

(assert (=> b!224889 (= res!110656 (= (select (arr!5234 (_keys!6266 thiss!1504)) (index!5513 lt!113337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224889 (=> (not res!110656) (not e!145986))))

(declare-fun b!224890 () Bool)

(declare-fun Unit!6744 () Unit!6741)

(assert (=> b!224890 (= e!145980 Unit!6744)))

(declare-fun lt!113336 () Unit!6741)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!242 (array!11029 array!11027 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) Int) Unit!6741)

(assert (=> b!224890 (= lt!113336 (lemmaInListMapThenSeekEntryOrOpenFindsIt!242 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 (defaultEntry!4212 thiss!1504)))))

(assert (=> b!224890 false))

(declare-fun b!224891 () Bool)

(declare-fun res!110662 () Bool)

(assert (=> b!224891 (=> res!110662 e!145977)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11029 (_ BitVec 32)) Bool)

(assert (=> b!224891 (= res!110662 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6266 thiss!1504) (mask!10050 thiss!1504))))))

(declare-fun mapNonEmpty!10009 () Bool)

(declare-fun tp!21234 () Bool)

(assert (=> mapNonEmpty!10009 (= mapRes!10009 (and tp!21234 e!145982))))

(declare-fun mapRest!10009 () (Array (_ BitVec 32) ValueCell!2603))

(declare-fun mapValue!10009 () ValueCell!2603)

(declare-fun mapKey!10009 () (_ BitVec 32))

(assert (=> mapNonEmpty!10009 (= (arr!5233 (_values!4195 thiss!1504)) (store mapRest!10009 mapKey!10009 mapValue!10009))))

(declare-fun b!224892 () Bool)

(declare-fun Unit!6745 () Unit!6741)

(assert (=> b!224892 (= e!145979 Unit!6745)))

(declare-fun lt!113340 () Unit!6741)

(declare-fun lemmaArrayContainsKeyThenInListMap!79 (array!11029 array!11027 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) (_ BitVec 32) Int) Unit!6741)

(assert (=> b!224892 (= lt!113340 (lemmaArrayContainsKeyThenInListMap!79 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4212 thiss!1504)))))

(assert (=> b!224892 false))

(declare-fun b!224893 () Bool)

(declare-fun e!145974 () Bool)

(assert (=> b!224893 (= e!145987 e!145974)))

(declare-fun res!110660 () Bool)

(assert (=> b!224893 (=> (not res!110660) (not e!145974))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224893 (= res!110660 (inRange!0 index!297 (mask!10050 thiss!1504)))))

(declare-fun lt!113341 () Unit!6741)

(assert (=> b!224893 (= lt!113341 e!145980)))

(declare-fun c!37297 () Bool)

(declare-datatypes ((tuple2!4348 0))(
  ( (tuple2!4349 (_1!2185 (_ BitVec 64)) (_2!2185 V!7505)) )
))
(declare-datatypes ((List!3254 0))(
  ( (Nil!3251) (Cons!3250 (h!3898 tuple2!4348) (t!8205 List!3254)) )
))
(declare-datatypes ((ListLongMap!3263 0))(
  ( (ListLongMap!3264 (toList!1647 List!3254)) )
))
(declare-fun contains!1536 (ListLongMap!3263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1179 (array!11029 array!11027 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 32) Int) ListLongMap!3263)

(assert (=> b!224893 (= c!37297 (contains!1536 (getCurrentListMap!1179 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4212 thiss!1504)) key!932))))

(declare-fun b!224894 () Bool)

(assert (=> b!224894 (= e!145976 (not call!20915))))

(declare-fun b!224895 () Bool)

(assert (=> b!224895 (= e!145978 tp_is_empty!5893)))

(declare-fun b!224896 () Bool)

(declare-fun res!110652 () Bool)

(assert (=> b!224896 (=> (not res!110652) (not e!145976))))

(declare-fun call!20916 () Bool)

(assert (=> b!224896 (= res!110652 call!20916)))

(assert (=> b!224896 (= e!145983 e!145976)))

(declare-fun b!224897 () Bool)

(assert (=> b!224897 (= e!145974 (not e!145977))))

(declare-fun res!110659 () Bool)

(assert (=> b!224897 (=> res!110659 e!145977)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!224897 (= res!110659 (not (validMask!0 (mask!10050 thiss!1504))))))

(declare-fun lt!113344 () array!11029)

(declare-fun arrayCountValidKeys!0 (array!11029 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!224897 (= (arrayCountValidKeys!0 lt!113344 #b00000000000000000000000000000000 (size!5567 (_keys!6266 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6266 thiss!1504) #b00000000000000000000000000000000 (size!5567 (_keys!6266 thiss!1504)))))))

(declare-fun lt!113339 () Unit!6741)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11029 (_ BitVec 32) (_ BitVec 64)) Unit!6741)

(assert (=> b!224897 (= lt!113339 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6266 thiss!1504) index!297 key!932))))

(assert (=> b!224897 (arrayNoDuplicates!0 lt!113344 #b00000000000000000000000000000000 Nil!3250)))

(assert (=> b!224897 (= lt!113344 (array!11030 (store (arr!5234 (_keys!6266 thiss!1504)) index!297 key!932) (size!5567 (_keys!6266 thiss!1504))))))

(declare-fun lt!113335 () Unit!6741)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11029 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3253) Unit!6741)

(assert (=> b!224897 (= lt!113335 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6266 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3250))))

(declare-fun lt!113334 () Unit!6741)

(assert (=> b!224897 (= lt!113334 e!145979)))

(declare-fun c!37296 () Bool)

(assert (=> b!224897 (= c!37296 lt!113342)))

(assert (=> b!224897 (= lt!113342 (arrayContainsKey!0 (_keys!6266 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20913 () Bool)

(assert (=> bm!20913 (= call!20916 (inRange!0 (ite c!37295 (index!5510 lt!113337) (index!5513 lt!113337)) (mask!10050 thiss!1504)))))

(declare-fun b!224898 () Bool)

(assert (=> b!224898 (= e!145981 e!145986)))

(declare-fun res!110658 () Bool)

(assert (=> b!224898 (= res!110658 call!20916)))

(assert (=> b!224898 (=> (not res!110658) (not e!145986))))

(assert (= (and start!21968 res!110650) b!224879))

(assert (= (and b!224879 res!110651) b!224876))

(assert (= (and b!224876 res!110661) b!224893))

(assert (= (and b!224893 c!37297) b!224890))

(assert (= (and b!224893 (not c!37297)) b!224882))

(assert (= (and b!224882 c!37295) b!224896))

(assert (= (and b!224882 (not c!37295)) b!224886))

(assert (= (and b!224896 res!110652) b!224884))

(assert (= (and b!224884 res!110657) b!224894))

(assert (= (and b!224886 c!37294) b!224898))

(assert (= (and b!224886 (not c!37294)) b!224878))

(assert (= (and b!224898 res!110658) b!224889))

(assert (= (and b!224889 res!110656) b!224875))

(assert (= (or b!224896 b!224898) bm!20913))

(assert (= (or b!224894 b!224875) bm!20912))

(assert (= (and b!224893 res!110660) b!224897))

(assert (= (and b!224897 c!37296) b!224892))

(assert (= (and b!224897 (not c!37296)) b!224880))

(assert (= (and b!224897 (not res!110659)) b!224877))

(assert (= (and b!224877 (not res!110655)) b!224887))

(assert (= (and b!224887 (not res!110654)) b!224888))

(assert (= (and b!224888 (not res!110653)) b!224891))

(assert (= (and b!224891 (not res!110662)) b!224885))

(assert (= (and b!224883 condMapEmpty!10009) mapIsEmpty!10009))

(assert (= (and b!224883 (not condMapEmpty!10009)) mapNonEmpty!10009))

(assert (= (and mapNonEmpty!10009 ((_ is ValueCellFull!2603) mapValue!10009)) b!224874))

(assert (= (and b!224883 ((_ is ValueCellFull!2603) mapDefault!10009)) b!224895))

(assert (= b!224881 b!224883))

(assert (= start!21968 b!224881))

(declare-fun m!247831 () Bool)

(assert (=> bm!20912 m!247831))

(declare-fun m!247833 () Bool)

(assert (=> b!224885 m!247833))

(declare-fun m!247835 () Bool)

(assert (=> b!224889 m!247835))

(declare-fun m!247837 () Bool)

(assert (=> b!224876 m!247837))

(declare-fun m!247839 () Bool)

(assert (=> mapNonEmpty!10009 m!247839))

(declare-fun m!247841 () Bool)

(assert (=> b!224887 m!247841))

(declare-fun m!247843 () Bool)

(assert (=> b!224884 m!247843))

(declare-fun m!247845 () Bool)

(assert (=> b!224893 m!247845))

(declare-fun m!247847 () Bool)

(assert (=> b!224893 m!247847))

(assert (=> b!224893 m!247847))

(declare-fun m!247849 () Bool)

(assert (=> b!224893 m!247849))

(declare-fun m!247851 () Bool)

(assert (=> b!224890 m!247851))

(declare-fun m!247853 () Bool)

(assert (=> b!224897 m!247853))

(assert (=> b!224897 m!247831))

(declare-fun m!247855 () Bool)

(assert (=> b!224897 m!247855))

(declare-fun m!247857 () Bool)

(assert (=> b!224897 m!247857))

(declare-fun m!247859 () Bool)

(assert (=> b!224897 m!247859))

(declare-fun m!247861 () Bool)

(assert (=> b!224897 m!247861))

(declare-fun m!247863 () Bool)

(assert (=> b!224897 m!247863))

(declare-fun m!247865 () Bool)

(assert (=> b!224897 m!247865))

(declare-fun m!247867 () Bool)

(assert (=> b!224891 m!247867))

(declare-fun m!247869 () Bool)

(assert (=> b!224892 m!247869))

(declare-fun m!247871 () Bool)

(assert (=> bm!20913 m!247871))

(declare-fun m!247873 () Bool)

(assert (=> start!21968 m!247873))

(declare-fun m!247875 () Bool)

(assert (=> b!224881 m!247875))

(declare-fun m!247877 () Bool)

(assert (=> b!224881 m!247877))

(declare-fun m!247879 () Bool)

(assert (=> b!224882 m!247879))

(check-sat b_and!12943 (not b!224893) (not b!224882) (not start!21968) (not b!224881) (not b!224892) (not b!224890) tp_is_empty!5893 (not b_next!6031) (not b!224887) (not b!224897) (not b!224891) (not b!224885) (not bm!20912) (not bm!20913) (not mapNonEmpty!10009) (not b!224876))
(check-sat b_and!12943 (not b_next!6031))
