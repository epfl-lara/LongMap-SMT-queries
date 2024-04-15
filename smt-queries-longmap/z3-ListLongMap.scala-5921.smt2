; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76930 () Bool)

(assert start!76930)

(declare-fun b!899006 () Bool)

(declare-fun b_free!16027 () Bool)

(declare-fun b_next!16027 () Bool)

(assert (=> b!899006 (= b_free!16027 (not b_next!16027))))

(declare-fun tp!56158 () Bool)

(declare-fun b_and!26307 () Bool)

(assert (=> b!899006 (= tp!56158 b_and!26307)))

(declare-fun b!898999 () Bool)

(declare-fun e!502979 () Bool)

(declare-fun tp_is_empty!18355 () Bool)

(assert (=> b!898999 (= e!502979 tp_is_empty!18355)))

(declare-fun res!607410 () Bool)

(declare-fun e!502978 () Bool)

(assert (=> start!76930 (=> (not res!607410) (not e!502978))))

(declare-datatypes ((array!52735 0))(
  ( (array!52736 (arr!25343 (Array (_ BitVec 32) (_ BitVec 64))) (size!25802 (_ BitVec 32))) )
))
(declare-datatypes ((V!29439 0))(
  ( (V!29440 (val!9228 Int)) )
))
(declare-datatypes ((ValueCell!8696 0))(
  ( (ValueCellFull!8696 (v!11718 V!29439)) (EmptyCell!8696) )
))
(declare-datatypes ((array!52737 0))(
  ( (array!52738 (arr!25344 (Array (_ BitVec 32) ValueCell!8696)) (size!25803 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4408 0))(
  ( (LongMapFixedSize!4409 (defaultEntry!5426 Int) (mask!26171 (_ BitVec 32)) (extraKeys!5146 (_ BitVec 32)) (zeroValue!5250 V!29439) (minValue!5250 V!29439) (_size!2259 (_ BitVec 32)) (_keys!10208 array!52735) (_values!5437 array!52737) (_vacant!2259 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4408)

(declare-fun valid!1703 (LongMapFixedSize!4408) Bool)

(assert (=> start!76930 (= res!607410 (valid!1703 thiss!1181))))

(assert (=> start!76930 e!502978))

(declare-fun e!502980 () Bool)

(assert (=> start!76930 e!502980))

(assert (=> start!76930 true))

(declare-fun b!899000 () Bool)

(declare-fun e!502976 () Bool)

(assert (=> b!899000 (= e!502976 (or (not (= (size!25803 (_values!5437 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26171 thiss!1181)))) (not (= (size!25802 (_keys!10208 thiss!1181)) (size!25803 (_values!5437 thiss!1181)))) (bvsge (mask!26171 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!899001 () Bool)

(declare-fun e!502977 () Bool)

(assert (=> b!899001 (= e!502977 e!502976)))

(declare-fun res!607406 () Bool)

(assert (=> b!899001 (=> res!607406 e!502976)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!899001 (= res!607406 (not (validMask!0 (mask!26171 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8932 0))(
  ( (MissingZero!8932 (index!38099 (_ BitVec 32))) (Found!8932 (index!38100 (_ BitVec 32))) (Intermediate!8932 (undefined!9744 Bool) (index!38101 (_ BitVec 32)) (x!76626 (_ BitVec 32))) (Undefined!8932) (MissingVacant!8932 (index!38102 (_ BitVec 32))) )
))
(declare-fun lt!405861 () SeekEntryResult!8932)

(declare-datatypes ((tuple2!12064 0))(
  ( (tuple2!12065 (_1!6043 (_ BitVec 64)) (_2!6043 V!29439)) )
))
(declare-datatypes ((List!17855 0))(
  ( (Nil!17852) (Cons!17851 (h!18995 tuple2!12064) (t!25191 List!17855)) )
))
(declare-datatypes ((ListLongMap!10751 0))(
  ( (ListLongMap!10752 (toList!5391 List!17855)) )
))
(declare-fun contains!4390 (ListLongMap!10751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2610 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) ListLongMap!10751)

(assert (=> b!899001 (contains!4390 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861)))))

(declare-datatypes ((Unit!30498 0))(
  ( (Unit!30499) )
))
(declare-fun lt!405860 () Unit!30498)

(declare-fun lemmaValidKeyInArrayIsInListMap!246 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) Unit!30498)

(assert (=> b!899001 (= lt!405860 (lemmaValidKeyInArrayIsInListMap!246 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!38100 lt!405861) (defaultEntry!5426 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!899001 (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405858 () Unit!30498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52735 (_ BitVec 64) (_ BitVec 32)) Unit!30498)

(assert (=> b!899001 (= lt!405858 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10208 thiss!1181) key!785 (index!38100 lt!405861)))))

(declare-fun b!899002 () Bool)

(declare-fun e!502973 () Bool)

(assert (=> b!899002 (= e!502973 tp_is_empty!18355)))

(declare-fun b!899003 () Bool)

(declare-fun res!607409 () Bool)

(assert (=> b!899003 (=> (not res!607409) (not e!502978))))

(assert (=> b!899003 (= res!607409 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29195 () Bool)

(declare-fun mapRes!29195 () Bool)

(declare-fun tp!56159 () Bool)

(assert (=> mapNonEmpty!29195 (= mapRes!29195 (and tp!56159 e!502973))))

(declare-fun mapValue!29195 () ValueCell!8696)

(declare-fun mapRest!29195 () (Array (_ BitVec 32) ValueCell!8696))

(declare-fun mapKey!29195 () (_ BitVec 32))

(assert (=> mapNonEmpty!29195 (= (arr!25344 (_values!5437 thiss!1181)) (store mapRest!29195 mapKey!29195 mapValue!29195))))

(declare-fun b!899004 () Bool)

(declare-fun e!502972 () Bool)

(assert (=> b!899004 (= e!502972 (and e!502979 mapRes!29195))))

(declare-fun condMapEmpty!29195 () Bool)

(declare-fun mapDefault!29195 () ValueCell!8696)

(assert (=> b!899004 (= condMapEmpty!29195 (= (arr!25344 (_values!5437 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8696)) mapDefault!29195)))))

(declare-fun b!899005 () Bool)

(assert (=> b!899005 (= e!502978 (not e!502977))))

(declare-fun res!607407 () Bool)

(assert (=> b!899005 (=> res!607407 e!502977)))

(get-info :version)

(assert (=> b!899005 (= res!607407 (not ((_ is Found!8932) lt!405861)))))

(declare-fun e!502974 () Bool)

(assert (=> b!899005 e!502974))

(declare-fun res!607408 () Bool)

(assert (=> b!899005 (=> res!607408 e!502974)))

(assert (=> b!899005 (= res!607408 (not ((_ is Found!8932) lt!405861)))))

(declare-fun lt!405859 () Unit!30498)

(declare-fun lemmaSeekEntryGivesInRangeIndex!98 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 64)) Unit!30498)

(assert (=> b!899005 (= lt!405859 (lemmaSeekEntryGivesInRangeIndex!98 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8932)

(assert (=> b!899005 (= lt!405861 (seekEntry!0 key!785 (_keys!10208 thiss!1181) (mask!26171 thiss!1181)))))

(declare-fun array_inv!19940 (array!52735) Bool)

(declare-fun array_inv!19941 (array!52737) Bool)

(assert (=> b!899006 (= e!502980 (and tp!56158 tp_is_empty!18355 (array_inv!19940 (_keys!10208 thiss!1181)) (array_inv!19941 (_values!5437 thiss!1181)) e!502972))))

(declare-fun mapIsEmpty!29195 () Bool)

(assert (=> mapIsEmpty!29195 mapRes!29195))

(declare-fun b!899007 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!899007 (= e!502974 (inRange!0 (index!38100 lt!405861) (mask!26171 thiss!1181)))))

(assert (= (and start!76930 res!607410) b!899003))

(assert (= (and b!899003 res!607409) b!899005))

(assert (= (and b!899005 (not res!607408)) b!899007))

(assert (= (and b!899005 (not res!607407)) b!899001))

(assert (= (and b!899001 (not res!607406)) b!899000))

(assert (= (and b!899004 condMapEmpty!29195) mapIsEmpty!29195))

(assert (= (and b!899004 (not condMapEmpty!29195)) mapNonEmpty!29195))

(assert (= (and mapNonEmpty!29195 ((_ is ValueCellFull!8696) mapValue!29195)) b!899002))

(assert (= (and b!899004 ((_ is ValueCellFull!8696) mapDefault!29195)) b!898999))

(assert (= b!899006 b!899004))

(assert (= start!76930 b!899006))

(declare-fun m!834979 () Bool)

(assert (=> b!899001 m!834979))

(declare-fun m!834981 () Bool)

(assert (=> b!899001 m!834981))

(declare-fun m!834983 () Bool)

(assert (=> b!899001 m!834983))

(declare-fun m!834985 () Bool)

(assert (=> b!899001 m!834985))

(declare-fun m!834987 () Bool)

(assert (=> b!899001 m!834987))

(declare-fun m!834989 () Bool)

(assert (=> b!899001 m!834989))

(assert (=> b!899001 m!834985))

(assert (=> b!899001 m!834987))

(declare-fun m!834991 () Bool)

(assert (=> b!899001 m!834991))

(declare-fun m!834993 () Bool)

(assert (=> b!899005 m!834993))

(declare-fun m!834995 () Bool)

(assert (=> b!899005 m!834995))

(declare-fun m!834997 () Bool)

(assert (=> mapNonEmpty!29195 m!834997))

(declare-fun m!834999 () Bool)

(assert (=> b!899006 m!834999))

(declare-fun m!835001 () Bool)

(assert (=> b!899006 m!835001))

(declare-fun m!835003 () Bool)

(assert (=> b!899007 m!835003))

(declare-fun m!835005 () Bool)

(assert (=> start!76930 m!835005))

(check-sat (not b_next!16027) tp_is_empty!18355 (not mapNonEmpty!29195) (not start!76930) (not b!899007) (not b!899006) b_and!26307 (not b!899005) (not b!899001))
(check-sat b_and!26307 (not b_next!16027))
(get-model)

(declare-fun d!111261 () Bool)

(assert (=> d!111261 (= (inRange!0 (index!38100 lt!405861) (mask!26171 thiss!1181)) (and (bvsge (index!38100 lt!405861) #b00000000000000000000000000000000) (bvslt (index!38100 lt!405861) (bvadd (mask!26171 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!899007 d!111261))

(declare-fun d!111263 () Bool)

(declare-fun res!607447 () Bool)

(declare-fun e!503037 () Bool)

(assert (=> d!111263 (=> (not res!607447) (not e!503037))))

(declare-fun simpleValid!326 (LongMapFixedSize!4408) Bool)

(assert (=> d!111263 (= res!607447 (simpleValid!326 thiss!1181))))

(assert (=> d!111263 (= (valid!1703 thiss!1181) e!503037)))

(declare-fun b!899068 () Bool)

(declare-fun res!607448 () Bool)

(assert (=> b!899068 (=> (not res!607448) (not e!503037))))

(declare-fun arrayCountValidKeys!0 (array!52735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899068 (= res!607448 (= (arrayCountValidKeys!0 (_keys!10208 thiss!1181) #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))) (_size!2259 thiss!1181)))))

(declare-fun b!899069 () Bool)

(declare-fun res!607449 () Bool)

(assert (=> b!899069 (=> (not res!607449) (not e!503037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52735 (_ BitVec 32)) Bool)

(assert (=> b!899069 (= res!607449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10208 thiss!1181) (mask!26171 thiss!1181)))))

(declare-fun b!899070 () Bool)

(declare-datatypes ((List!17856 0))(
  ( (Nil!17853) (Cons!17852 (h!18996 (_ BitVec 64)) (t!25194 List!17856)) )
))
(declare-fun arrayNoDuplicates!0 (array!52735 (_ BitVec 32) List!17856) Bool)

(assert (=> b!899070 (= e!503037 (arrayNoDuplicates!0 (_keys!10208 thiss!1181) #b00000000000000000000000000000000 Nil!17853))))

(assert (= (and d!111263 res!607447) b!899068))

(assert (= (and b!899068 res!607448) b!899069))

(assert (= (and b!899069 res!607449) b!899070))

(declare-fun m!835063 () Bool)

(assert (=> d!111263 m!835063))

(declare-fun m!835065 () Bool)

(assert (=> b!899068 m!835065))

(declare-fun m!835067 () Bool)

(assert (=> b!899069 m!835067))

(declare-fun m!835069 () Bool)

(assert (=> b!899070 m!835069))

(assert (=> start!76930 d!111263))

(declare-fun d!111265 () Bool)

(assert (=> d!111265 (= (array_inv!19940 (_keys!10208 thiss!1181)) (bvsge (size!25802 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899006 d!111265))

(declare-fun d!111267 () Bool)

(assert (=> d!111267 (= (array_inv!19941 (_values!5437 thiss!1181)) (bvsge (size!25803 (_values!5437 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899006 d!111267))

(declare-fun d!111269 () Bool)

(declare-fun e!503040 () Bool)

(assert (=> d!111269 e!503040))

(declare-fun res!607452 () Bool)

(assert (=> d!111269 (=> (not res!607452) (not e!503040))))

(assert (=> d!111269 (= res!607452 (and (bvsge (index!38100 lt!405861) #b00000000000000000000000000000000) (bvslt (index!38100 lt!405861) (size!25802 (_keys!10208 thiss!1181)))))))

(declare-fun lt!405888 () Unit!30498)

(declare-fun choose!1509 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) Unit!30498)

(assert (=> d!111269 (= lt!405888 (choose!1509 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!38100 lt!405861) (defaultEntry!5426 thiss!1181)))))

(assert (=> d!111269 (validMask!0 (mask!26171 thiss!1181))))

(assert (=> d!111269 (= (lemmaValidKeyInArrayIsInListMap!246 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) (index!38100 lt!405861) (defaultEntry!5426 thiss!1181)) lt!405888)))

(declare-fun b!899073 () Bool)

(assert (=> b!899073 (= e!503040 (contains!4390 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861))))))

(assert (= (and d!111269 res!607452) b!899073))

(declare-fun m!835071 () Bool)

(assert (=> d!111269 m!835071))

(assert (=> d!111269 m!834981))

(assert (=> b!899073 m!834985))

(assert (=> b!899073 m!834987))

(assert (=> b!899073 m!834985))

(assert (=> b!899073 m!834987))

(assert (=> b!899073 m!834991))

(assert (=> b!899001 d!111269))

(declare-fun d!111271 () Bool)

(assert (=> d!111271 (= (validMask!0 (mask!26171 thiss!1181)) (and (or (= (mask!26171 thiss!1181) #b00000000000000000000000000000111) (= (mask!26171 thiss!1181) #b00000000000000000000000000001111) (= (mask!26171 thiss!1181) #b00000000000000000000000000011111) (= (mask!26171 thiss!1181) #b00000000000000000000000000111111) (= (mask!26171 thiss!1181) #b00000000000000000000000001111111) (= (mask!26171 thiss!1181) #b00000000000000000000000011111111) (= (mask!26171 thiss!1181) #b00000000000000000000000111111111) (= (mask!26171 thiss!1181) #b00000000000000000000001111111111) (= (mask!26171 thiss!1181) #b00000000000000000000011111111111) (= (mask!26171 thiss!1181) #b00000000000000000000111111111111) (= (mask!26171 thiss!1181) #b00000000000000000001111111111111) (= (mask!26171 thiss!1181) #b00000000000000000011111111111111) (= (mask!26171 thiss!1181) #b00000000000000000111111111111111) (= (mask!26171 thiss!1181) #b00000000000000001111111111111111) (= (mask!26171 thiss!1181) #b00000000000000011111111111111111) (= (mask!26171 thiss!1181) #b00000000000000111111111111111111) (= (mask!26171 thiss!1181) #b00000000000001111111111111111111) (= (mask!26171 thiss!1181) #b00000000000011111111111111111111) (= (mask!26171 thiss!1181) #b00000000000111111111111111111111) (= (mask!26171 thiss!1181) #b00000000001111111111111111111111) (= (mask!26171 thiss!1181) #b00000000011111111111111111111111) (= (mask!26171 thiss!1181) #b00000000111111111111111111111111) (= (mask!26171 thiss!1181) #b00000001111111111111111111111111) (= (mask!26171 thiss!1181) #b00000011111111111111111111111111) (= (mask!26171 thiss!1181) #b00000111111111111111111111111111) (= (mask!26171 thiss!1181) #b00001111111111111111111111111111) (= (mask!26171 thiss!1181) #b00011111111111111111111111111111) (= (mask!26171 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26171 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!899001 d!111271))

(declare-fun d!111273 () Bool)

(declare-fun res!607457 () Bool)

(declare-fun e!503045 () Bool)

(assert (=> d!111273 (=> res!607457 e!503045)))

(assert (=> d!111273 (= res!607457 (= (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111273 (= (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 #b00000000000000000000000000000000) e!503045)))

(declare-fun b!899078 () Bool)

(declare-fun e!503046 () Bool)

(assert (=> b!899078 (= e!503045 e!503046)))

(declare-fun res!607458 () Bool)

(assert (=> b!899078 (=> (not res!607458) (not e!503046))))

(assert (=> b!899078 (= res!607458 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25802 (_keys!10208 thiss!1181))))))

(declare-fun b!899079 () Bool)

(assert (=> b!899079 (= e!503046 (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111273 (not res!607457)) b!899078))

(assert (= (and b!899078 res!607458) b!899079))

(declare-fun m!835073 () Bool)

(assert (=> d!111273 m!835073))

(declare-fun m!835075 () Bool)

(assert (=> b!899079 m!835075))

(assert (=> b!899001 d!111273))

(declare-fun d!111275 () Bool)

(assert (=> d!111275 (arrayContainsKey!0 (_keys!10208 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405891 () Unit!30498)

(declare-fun choose!13 (array!52735 (_ BitVec 64) (_ BitVec 32)) Unit!30498)

(assert (=> d!111275 (= lt!405891 (choose!13 (_keys!10208 thiss!1181) key!785 (index!38100 lt!405861)))))

(assert (=> d!111275 (bvsge (index!38100 lt!405861) #b00000000000000000000000000000000)))

(assert (=> d!111275 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10208 thiss!1181) key!785 (index!38100 lt!405861)) lt!405891)))

(declare-fun bs!25215 () Bool)

(assert (= bs!25215 d!111275))

(assert (=> bs!25215 m!834989))

(declare-fun m!835077 () Bool)

(assert (=> bs!25215 m!835077))

(assert (=> b!899001 d!111275))

(declare-fun d!111277 () Bool)

(declare-fun e!503051 () Bool)

(assert (=> d!111277 e!503051))

(declare-fun res!607461 () Bool)

(assert (=> d!111277 (=> res!607461 e!503051)))

(declare-fun lt!405903 () Bool)

(assert (=> d!111277 (= res!607461 (not lt!405903))))

(declare-fun lt!405902 () Bool)

(assert (=> d!111277 (= lt!405903 lt!405902)))

(declare-fun lt!405900 () Unit!30498)

(declare-fun e!503052 () Unit!30498)

(assert (=> d!111277 (= lt!405900 e!503052)))

(declare-fun c!95051 () Bool)

(assert (=> d!111277 (= c!95051 lt!405902)))

(declare-fun containsKey!427 (List!17855 (_ BitVec 64)) Bool)

(assert (=> d!111277 (= lt!405902 (containsKey!427 (toList!5391 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861))))))

(assert (=> d!111277 (= (contains!4390 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861))) lt!405903)))

(declare-fun b!899086 () Bool)

(declare-fun lt!405901 () Unit!30498)

(assert (=> b!899086 (= e!503052 lt!405901)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!322 (List!17855 (_ BitVec 64)) Unit!30498)

(assert (=> b!899086 (= lt!405901 (lemmaContainsKeyImpliesGetValueByKeyDefined!322 (toList!5391 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861))))))

(declare-datatypes ((Option!465 0))(
  ( (Some!464 (v!11721 V!29439)) (None!463) )
))
(declare-fun isDefined!335 (Option!465) Bool)

(declare-fun getValueByKey!459 (List!17855 (_ BitVec 64)) Option!465)

(assert (=> b!899086 (isDefined!335 (getValueByKey!459 (toList!5391 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861))))))

(declare-fun b!899087 () Bool)

(declare-fun Unit!30500 () Unit!30498)

(assert (=> b!899087 (= e!503052 Unit!30500)))

(declare-fun b!899088 () Bool)

(assert (=> b!899088 (= e!503051 (isDefined!335 (getValueByKey!459 (toList!5391 (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181))) (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405861)))))))

(assert (= (and d!111277 c!95051) b!899086))

(assert (= (and d!111277 (not c!95051)) b!899087))

(assert (= (and d!111277 (not res!607461)) b!899088))

(assert (=> d!111277 m!834987))

(declare-fun m!835079 () Bool)

(assert (=> d!111277 m!835079))

(assert (=> b!899086 m!834987))

(declare-fun m!835081 () Bool)

(assert (=> b!899086 m!835081))

(assert (=> b!899086 m!834987))

(declare-fun m!835083 () Bool)

(assert (=> b!899086 m!835083))

(assert (=> b!899086 m!835083))

(declare-fun m!835085 () Bool)

(assert (=> b!899086 m!835085))

(assert (=> b!899088 m!834987))

(assert (=> b!899088 m!835083))

(assert (=> b!899088 m!835083))

(assert (=> b!899088 m!835085))

(assert (=> b!899001 d!111277))

(declare-fun b!899131 () Bool)

(declare-fun e!503080 () Bool)

(declare-fun e!503091 () Bool)

(assert (=> b!899131 (= e!503080 e!503091)))

(declare-fun c!95069 () Bool)

(assert (=> b!899131 (= c!95069 (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!899132 () Bool)

(declare-fun e!503090 () ListLongMap!10751)

(declare-fun call!39913 () ListLongMap!10751)

(assert (=> b!899132 (= e!503090 call!39913)))

(declare-fun bm!39908 () Bool)

(declare-fun call!39911 () Bool)

(declare-fun lt!405957 () ListLongMap!10751)

(assert (=> bm!39908 (= call!39911 (contains!4390 lt!405957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899133 () Bool)

(declare-fun c!95068 () Bool)

(assert (=> b!899133 (= c!95068 (and (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503079 () ListLongMap!10751)

(assert (=> b!899133 (= e!503079 e!503090)))

(declare-fun b!899134 () Bool)

(declare-fun res!607480 () Bool)

(assert (=> b!899134 (=> (not res!607480) (not e!503080))))

(declare-fun e!503084 () Bool)

(assert (=> b!899134 (= res!607480 e!503084)))

(declare-fun c!95064 () Bool)

(assert (=> b!899134 (= c!95064 (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39909 () Bool)

(declare-fun call!39914 () ListLongMap!10751)

(declare-fun call!39917 () ListLongMap!10751)

(assert (=> bm!39909 (= call!39914 call!39917)))

(declare-fun b!899136 () Bool)

(assert (=> b!899136 (= e!503084 (not call!39911))))

(declare-fun b!899137 () Bool)

(declare-fun e!503085 () Unit!30498)

(declare-fun Unit!30501 () Unit!30498)

(assert (=> b!899137 (= e!503085 Unit!30501)))

(declare-fun b!899138 () Bool)

(declare-fun e!503087 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!899138 (= e!503087 (validKeyInArray!0 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899135 () Bool)

(declare-fun res!607487 () Bool)

(assert (=> b!899135 (=> (not res!607487) (not e!503080))))

(declare-fun e!503086 () Bool)

(assert (=> b!899135 (= res!607487 e!503086)))

(declare-fun res!607483 () Bool)

(assert (=> b!899135 (=> res!607483 e!503086)))

(assert (=> b!899135 (= res!607483 (not e!503087))))

(declare-fun res!607486 () Bool)

(assert (=> b!899135 (=> (not res!607486) (not e!503087))))

(assert (=> b!899135 (= res!607486 (bvslt #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))))))

(declare-fun d!111279 () Bool)

(assert (=> d!111279 e!503080))

(declare-fun res!607482 () Bool)

(assert (=> d!111279 (=> (not res!607482) (not e!503080))))

(assert (=> d!111279 (= res!607482 (or (bvsge #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))))))))

(declare-fun lt!405951 () ListLongMap!10751)

(assert (=> d!111279 (= lt!405957 lt!405951)))

(declare-fun lt!405953 () Unit!30498)

(assert (=> d!111279 (= lt!405953 e!503085)))

(declare-fun c!95066 () Bool)

(declare-fun e!503082 () Bool)

(assert (=> d!111279 (= c!95066 e!503082)))

(declare-fun res!607481 () Bool)

(assert (=> d!111279 (=> (not res!607481) (not e!503082))))

(assert (=> d!111279 (= res!607481 (bvslt #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))))))

(declare-fun e!503088 () ListLongMap!10751)

(assert (=> d!111279 (= lt!405951 e!503088)))

(declare-fun c!95065 () Bool)

(assert (=> d!111279 (= c!95065 (and (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111279 (validMask!0 (mask!26171 thiss!1181))))

(assert (=> d!111279 (= (getCurrentListMap!2610 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)) lt!405957)))

(declare-fun bm!39910 () Bool)

(declare-fun call!39915 () ListLongMap!10751)

(assert (=> bm!39910 (= call!39913 call!39915)))

(declare-fun bm!39911 () Bool)

(declare-fun call!39916 () ListLongMap!10751)

(assert (=> bm!39911 (= call!39916 call!39914)))

(declare-fun b!899139 () Bool)

(declare-fun e!503081 () Bool)

(assert (=> b!899139 (= e!503084 e!503081)))

(declare-fun res!607484 () Bool)

(assert (=> b!899139 (= res!607484 call!39911)))

(assert (=> b!899139 (=> (not res!607484) (not e!503081))))

(declare-fun b!899140 () Bool)

(declare-fun call!39912 () Bool)

(assert (=> b!899140 (= e!503091 (not call!39912))))

(declare-fun b!899141 () Bool)

(assert (=> b!899141 (= e!503082 (validKeyInArray!0 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899142 () Bool)

(declare-fun e!503083 () Bool)

(assert (=> b!899142 (= e!503086 e!503083)))

(declare-fun res!607488 () Bool)

(assert (=> b!899142 (=> (not res!607488) (not e!503083))))

(assert (=> b!899142 (= res!607488 (contains!4390 lt!405957 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!899142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))))))

(declare-fun b!899143 () Bool)

(declare-fun apply!408 (ListLongMap!10751 (_ BitVec 64)) V!29439)

(assert (=> b!899143 (= e!503081 (= (apply!408 lt!405957 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5250 thiss!1181)))))

(declare-fun b!899144 () Bool)

(declare-fun e!503089 () Bool)

(assert (=> b!899144 (= e!503091 e!503089)))

(declare-fun res!607485 () Bool)

(assert (=> b!899144 (= res!607485 call!39912)))

(assert (=> b!899144 (=> (not res!607485) (not e!503089))))

(declare-fun b!899145 () Bool)

(declare-fun +!2619 (ListLongMap!10751 tuple2!12064) ListLongMap!10751)

(assert (=> b!899145 (= e!503088 (+!2619 call!39915 (tuple2!12065 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5250 thiss!1181))))))

(declare-fun b!899146 () Bool)

(assert (=> b!899146 (= e!503089 (= (apply!408 lt!405957 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5250 thiss!1181)))))

(declare-fun bm!39912 () Bool)

(assert (=> bm!39912 (= call!39912 (contains!4390 lt!405957 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!899147 () Bool)

(assert (=> b!899147 (= e!503088 e!503079)))

(declare-fun c!95067 () Bool)

(assert (=> b!899147 (= c!95067 (and (not (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5146 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39913 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3316 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 32) Int) ListLongMap!10751)

(assert (=> bm!39913 (= call!39917 (getCurrentListMapNoExtraKeys!3316 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun bm!39914 () Bool)

(assert (=> bm!39914 (= call!39915 (+!2619 (ite c!95065 call!39917 (ite c!95067 call!39914 call!39916)) (ite (or c!95065 c!95067) (tuple2!12065 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5250 thiss!1181)) (tuple2!12065 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5250 thiss!1181)))))))

(declare-fun b!899148 () Bool)

(declare-fun get!13333 (ValueCell!8696 V!29439) V!29439)

(declare-fun dynLambda!1302 (Int (_ BitVec 64)) V!29439)

(assert (=> b!899148 (= e!503083 (= (apply!408 lt!405957 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000)) (get!13333 (select (arr!25344 (_values!5437 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1302 (defaultEntry!5426 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!899148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25803 (_values!5437 thiss!1181))))))

(assert (=> b!899148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25802 (_keys!10208 thiss!1181))))))

(declare-fun b!899149 () Bool)

(assert (=> b!899149 (= e!503090 call!39916)))

(declare-fun b!899150 () Bool)

(declare-fun lt!405961 () Unit!30498)

(assert (=> b!899150 (= e!503085 lt!405961)))

(declare-fun lt!405952 () ListLongMap!10751)

(assert (=> b!899150 (= lt!405952 (getCurrentListMapNoExtraKeys!3316 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!405960 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405967 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405967 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405963 () Unit!30498)

(declare-fun addStillContains!334 (ListLongMap!10751 (_ BitVec 64) V!29439 (_ BitVec 64)) Unit!30498)

(assert (=> b!899150 (= lt!405963 (addStillContains!334 lt!405952 lt!405960 (zeroValue!5250 thiss!1181) lt!405967))))

(assert (=> b!899150 (contains!4390 (+!2619 lt!405952 (tuple2!12065 lt!405960 (zeroValue!5250 thiss!1181))) lt!405967)))

(declare-fun lt!405962 () Unit!30498)

(assert (=> b!899150 (= lt!405962 lt!405963)))

(declare-fun lt!405964 () ListLongMap!10751)

(assert (=> b!899150 (= lt!405964 (getCurrentListMapNoExtraKeys!3316 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!405968 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405968 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405958 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405958 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405959 () Unit!30498)

(declare-fun addApplyDifferent!334 (ListLongMap!10751 (_ BitVec 64) V!29439 (_ BitVec 64)) Unit!30498)

(assert (=> b!899150 (= lt!405959 (addApplyDifferent!334 lt!405964 lt!405968 (minValue!5250 thiss!1181) lt!405958))))

(assert (=> b!899150 (= (apply!408 (+!2619 lt!405964 (tuple2!12065 lt!405968 (minValue!5250 thiss!1181))) lt!405958) (apply!408 lt!405964 lt!405958))))

(declare-fun lt!405954 () Unit!30498)

(assert (=> b!899150 (= lt!405954 lt!405959)))

(declare-fun lt!405966 () ListLongMap!10751)

(assert (=> b!899150 (= lt!405966 (getCurrentListMapNoExtraKeys!3316 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!405955 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405955 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405965 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405965 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405969 () Unit!30498)

(assert (=> b!899150 (= lt!405969 (addApplyDifferent!334 lt!405966 lt!405955 (zeroValue!5250 thiss!1181) lt!405965))))

(assert (=> b!899150 (= (apply!408 (+!2619 lt!405966 (tuple2!12065 lt!405955 (zeroValue!5250 thiss!1181))) lt!405965) (apply!408 lt!405966 lt!405965))))

(declare-fun lt!405949 () Unit!30498)

(assert (=> b!899150 (= lt!405949 lt!405969)))

(declare-fun lt!405948 () ListLongMap!10751)

(assert (=> b!899150 (= lt!405948 (getCurrentListMapNoExtraKeys!3316 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5426 thiss!1181)))))

(declare-fun lt!405950 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405950 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!405956 () (_ BitVec 64))

(assert (=> b!899150 (= lt!405956 (select (arr!25343 (_keys!10208 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!899150 (= lt!405961 (addApplyDifferent!334 lt!405948 lt!405950 (minValue!5250 thiss!1181) lt!405956))))

(assert (=> b!899150 (= (apply!408 (+!2619 lt!405948 (tuple2!12065 lt!405950 (minValue!5250 thiss!1181))) lt!405956) (apply!408 lt!405948 lt!405956))))

(declare-fun b!899151 () Bool)

(assert (=> b!899151 (= e!503079 call!39913)))

(assert (= (and d!111279 c!95065) b!899145))

(assert (= (and d!111279 (not c!95065)) b!899147))

(assert (= (and b!899147 c!95067) b!899151))

(assert (= (and b!899147 (not c!95067)) b!899133))

(assert (= (and b!899133 c!95068) b!899132))

(assert (= (and b!899133 (not c!95068)) b!899149))

(assert (= (or b!899132 b!899149) bm!39911))

(assert (= (or b!899151 bm!39911) bm!39909))

(assert (= (or b!899151 b!899132) bm!39910))

(assert (= (or b!899145 bm!39909) bm!39913))

(assert (= (or b!899145 bm!39910) bm!39914))

(assert (= (and d!111279 res!607481) b!899141))

(assert (= (and d!111279 c!95066) b!899150))

(assert (= (and d!111279 (not c!95066)) b!899137))

(assert (= (and d!111279 res!607482) b!899135))

(assert (= (and b!899135 res!607486) b!899138))

(assert (= (and b!899135 (not res!607483)) b!899142))

(assert (= (and b!899142 res!607488) b!899148))

(assert (= (and b!899135 res!607487) b!899134))

(assert (= (and b!899134 c!95064) b!899139))

(assert (= (and b!899134 (not c!95064)) b!899136))

(assert (= (and b!899139 res!607484) b!899143))

(assert (= (or b!899139 b!899136) bm!39908))

(assert (= (and b!899134 res!607480) b!899131))

(assert (= (and b!899131 c!95069) b!899144))

(assert (= (and b!899131 (not c!95069)) b!899140))

(assert (= (and b!899144 res!607485) b!899146))

(assert (= (or b!899144 b!899140) bm!39912))

(declare-fun b_lambda!12969 () Bool)

(assert (=> (not b_lambda!12969) (not b!899148)))

(declare-fun t!25193 () Bool)

(declare-fun tb!5189 () Bool)

(assert (=> (and b!899006 (= (defaultEntry!5426 thiss!1181) (defaultEntry!5426 thiss!1181)) t!25193) tb!5189))

(declare-fun result!10155 () Bool)

(assert (=> tb!5189 (= result!10155 tp_is_empty!18355)))

(assert (=> b!899148 t!25193))

(declare-fun b_and!26313 () Bool)

(assert (= b_and!26307 (and (=> t!25193 result!10155) b_and!26313)))

(declare-fun m!835087 () Bool)

(assert (=> b!899148 m!835087))

(assert (=> b!899148 m!835087))

(declare-fun m!835089 () Bool)

(assert (=> b!899148 m!835089))

(declare-fun m!835091 () Bool)

(assert (=> b!899148 m!835091))

(assert (=> b!899148 m!835073))

(assert (=> b!899148 m!835089))

(assert (=> b!899148 m!835073))

(declare-fun m!835093 () Bool)

(assert (=> b!899148 m!835093))

(assert (=> b!899142 m!835073))

(assert (=> b!899142 m!835073))

(declare-fun m!835095 () Bool)

(assert (=> b!899142 m!835095))

(assert (=> b!899138 m!835073))

(assert (=> b!899138 m!835073))

(declare-fun m!835097 () Bool)

(assert (=> b!899138 m!835097))

(declare-fun m!835099 () Bool)

(assert (=> bm!39913 m!835099))

(declare-fun m!835101 () Bool)

(assert (=> bm!39914 m!835101))

(declare-fun m!835103 () Bool)

(assert (=> bm!39912 m!835103))

(assert (=> b!899141 m!835073))

(assert (=> b!899141 m!835073))

(assert (=> b!899141 m!835097))

(declare-fun m!835105 () Bool)

(assert (=> b!899150 m!835105))

(declare-fun m!835107 () Bool)

(assert (=> b!899150 m!835107))

(declare-fun m!835109 () Bool)

(assert (=> b!899150 m!835109))

(declare-fun m!835111 () Bool)

(assert (=> b!899150 m!835111))

(declare-fun m!835113 () Bool)

(assert (=> b!899150 m!835113))

(declare-fun m!835115 () Bool)

(assert (=> b!899150 m!835115))

(declare-fun m!835117 () Bool)

(assert (=> b!899150 m!835117))

(declare-fun m!835119 () Bool)

(assert (=> b!899150 m!835119))

(assert (=> b!899150 m!835107))

(declare-fun m!835121 () Bool)

(assert (=> b!899150 m!835121))

(declare-fun m!835123 () Bool)

(assert (=> b!899150 m!835123))

(assert (=> b!899150 m!835105))

(declare-fun m!835125 () Bool)

(assert (=> b!899150 m!835125))

(declare-fun m!835127 () Bool)

(assert (=> b!899150 m!835127))

(assert (=> b!899150 m!835127))

(declare-fun m!835129 () Bool)

(assert (=> b!899150 m!835129))

(declare-fun m!835131 () Bool)

(assert (=> b!899150 m!835131))

(declare-fun m!835133 () Bool)

(assert (=> b!899150 m!835133))

(assert (=> b!899150 m!835073))

(assert (=> b!899150 m!835113))

(assert (=> b!899150 m!835099))

(declare-fun m!835135 () Bool)

(assert (=> b!899146 m!835135))

(assert (=> d!111279 m!834981))

(declare-fun m!835137 () Bool)

(assert (=> bm!39908 m!835137))

(declare-fun m!835139 () Bool)

(assert (=> b!899145 m!835139))

(declare-fun m!835141 () Bool)

(assert (=> b!899143 m!835141))

(assert (=> b!899001 d!111279))

(declare-fun d!111281 () Bool)

(declare-fun e!503094 () Bool)

(assert (=> d!111281 e!503094))

(declare-fun res!607491 () Bool)

(assert (=> d!111281 (=> res!607491 e!503094)))

(declare-fun lt!405975 () SeekEntryResult!8932)

(assert (=> d!111281 (= res!607491 (not ((_ is Found!8932) lt!405975)))))

(assert (=> d!111281 (= lt!405975 (seekEntry!0 key!785 (_keys!10208 thiss!1181) (mask!26171 thiss!1181)))))

(declare-fun lt!405974 () Unit!30498)

(declare-fun choose!1510 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29439 V!29439 (_ BitVec 64)) Unit!30498)

(assert (=> d!111281 (= lt!405974 (choose!1510 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) key!785))))

(assert (=> d!111281 (validMask!0 (mask!26171 thiss!1181))))

(assert (=> d!111281 (= (lemmaSeekEntryGivesInRangeIndex!98 (_keys!10208 thiss!1181) (_values!5437 thiss!1181) (mask!26171 thiss!1181) (extraKeys!5146 thiss!1181) (zeroValue!5250 thiss!1181) (minValue!5250 thiss!1181) key!785) lt!405974)))

(declare-fun b!899156 () Bool)

(assert (=> b!899156 (= e!503094 (inRange!0 (index!38100 lt!405975) (mask!26171 thiss!1181)))))

(assert (= (and d!111281 (not res!607491)) b!899156))

(assert (=> d!111281 m!834995))

(declare-fun m!835143 () Bool)

(assert (=> d!111281 m!835143))

(assert (=> d!111281 m!834981))

(declare-fun m!835145 () Bool)

(assert (=> b!899156 m!835145))

(assert (=> b!899005 d!111281))

(declare-fun b!899169 () Bool)

(declare-fun e!503101 () SeekEntryResult!8932)

(declare-fun e!503102 () SeekEntryResult!8932)

(assert (=> b!899169 (= e!503101 e!503102)))

(declare-fun lt!405984 () (_ BitVec 64))

(declare-fun lt!405987 () SeekEntryResult!8932)

(assert (=> b!899169 (= lt!405984 (select (arr!25343 (_keys!10208 thiss!1181)) (index!38101 lt!405987)))))

(declare-fun c!95076 () Bool)

(assert (=> b!899169 (= c!95076 (= lt!405984 key!785))))

(declare-fun b!899170 () Bool)

(assert (=> b!899170 (= e!503101 Undefined!8932)))

(declare-fun b!899171 () Bool)

(assert (=> b!899171 (= e!503102 (Found!8932 (index!38101 lt!405987)))))

(declare-fun b!899172 () Bool)

(declare-fun c!95078 () Bool)

(assert (=> b!899172 (= c!95078 (= lt!405984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503103 () SeekEntryResult!8932)

(assert (=> b!899172 (= e!503102 e!503103)))

(declare-fun b!899173 () Bool)

(assert (=> b!899173 (= e!503103 (MissingZero!8932 (index!38101 lt!405987)))))

(declare-fun b!899174 () Bool)

(declare-fun lt!405985 () SeekEntryResult!8932)

(assert (=> b!899174 (= e!503103 (ite ((_ is MissingVacant!8932) lt!405985) (MissingZero!8932 (index!38102 lt!405985)) lt!405985))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8932)

(assert (=> b!899174 (= lt!405985 (seekKeyOrZeroReturnVacant!0 (x!76626 lt!405987) (index!38101 lt!405987) (index!38101 lt!405987) key!785 (_keys!10208 thiss!1181) (mask!26171 thiss!1181)))))

(declare-fun d!111283 () Bool)

(declare-fun lt!405986 () SeekEntryResult!8932)

(assert (=> d!111283 (and (or ((_ is MissingVacant!8932) lt!405986) (not ((_ is Found!8932) lt!405986)) (and (bvsge (index!38100 lt!405986) #b00000000000000000000000000000000) (bvslt (index!38100 lt!405986) (size!25802 (_keys!10208 thiss!1181))))) (not ((_ is MissingVacant!8932) lt!405986)) (or (not ((_ is Found!8932) lt!405986)) (= (select (arr!25343 (_keys!10208 thiss!1181)) (index!38100 lt!405986)) key!785)))))

(assert (=> d!111283 (= lt!405986 e!503101)))

(declare-fun c!95077 () Bool)

(assert (=> d!111283 (= c!95077 (and ((_ is Intermediate!8932) lt!405987) (undefined!9744 lt!405987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8932)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111283 (= lt!405987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26171 thiss!1181)) key!785 (_keys!10208 thiss!1181) (mask!26171 thiss!1181)))))

(assert (=> d!111283 (validMask!0 (mask!26171 thiss!1181))))

(assert (=> d!111283 (= (seekEntry!0 key!785 (_keys!10208 thiss!1181) (mask!26171 thiss!1181)) lt!405986)))

(assert (= (and d!111283 c!95077) b!899170))

(assert (= (and d!111283 (not c!95077)) b!899169))

(assert (= (and b!899169 c!95076) b!899171))

(assert (= (and b!899169 (not c!95076)) b!899172))

(assert (= (and b!899172 c!95078) b!899173))

(assert (= (and b!899172 (not c!95078)) b!899174))

(declare-fun m!835147 () Bool)

(assert (=> b!899169 m!835147))

(declare-fun m!835149 () Bool)

(assert (=> b!899174 m!835149))

(declare-fun m!835151 () Bool)

(assert (=> d!111283 m!835151))

(declare-fun m!835153 () Bool)

(assert (=> d!111283 m!835153))

(assert (=> d!111283 m!835153))

(declare-fun m!835155 () Bool)

(assert (=> d!111283 m!835155))

(assert (=> d!111283 m!834981))

(assert (=> b!899005 d!111283))

(declare-fun condMapEmpty!29204 () Bool)

(declare-fun mapDefault!29204 () ValueCell!8696)

(assert (=> mapNonEmpty!29195 (= condMapEmpty!29204 (= mapRest!29195 ((as const (Array (_ BitVec 32) ValueCell!8696)) mapDefault!29204)))))

(declare-fun e!503109 () Bool)

(declare-fun mapRes!29204 () Bool)

(assert (=> mapNonEmpty!29195 (= tp!56159 (and e!503109 mapRes!29204))))

(declare-fun b!899182 () Bool)

(assert (=> b!899182 (= e!503109 tp_is_empty!18355)))

(declare-fun mapIsEmpty!29204 () Bool)

(assert (=> mapIsEmpty!29204 mapRes!29204))

(declare-fun mapNonEmpty!29204 () Bool)

(declare-fun tp!56174 () Bool)

(declare-fun e!503108 () Bool)

(assert (=> mapNonEmpty!29204 (= mapRes!29204 (and tp!56174 e!503108))))

(declare-fun mapValue!29204 () ValueCell!8696)

(declare-fun mapKey!29204 () (_ BitVec 32))

(declare-fun mapRest!29204 () (Array (_ BitVec 32) ValueCell!8696))

(assert (=> mapNonEmpty!29204 (= mapRest!29195 (store mapRest!29204 mapKey!29204 mapValue!29204))))

(declare-fun b!899181 () Bool)

(assert (=> b!899181 (= e!503108 tp_is_empty!18355)))

(assert (= (and mapNonEmpty!29195 condMapEmpty!29204) mapIsEmpty!29204))

(assert (= (and mapNonEmpty!29195 (not condMapEmpty!29204)) mapNonEmpty!29204))

(assert (= (and mapNonEmpty!29204 ((_ is ValueCellFull!8696) mapValue!29204)) b!899181))

(assert (= (and mapNonEmpty!29195 ((_ is ValueCellFull!8696) mapDefault!29204)) b!899182))

(declare-fun m!835157 () Bool)

(assert (=> mapNonEmpty!29204 m!835157))

(declare-fun b_lambda!12971 () Bool)

(assert (= b_lambda!12969 (or (and b!899006 b_free!16027) b_lambda!12971)))

(check-sat (not b_next!16027) (not b!899141) (not b!899068) (not b_lambda!12971) (not b!899143) (not d!111279) (not d!111281) (not b!899156) (not b!899138) (not b!899070) (not d!111277) (not bm!39913) (not bm!39908) (not d!111283) (not bm!39912) (not b!899148) (not d!111263) b_and!26313 tp_is_empty!18355 (not b!899079) (not b!899145) (not b!899069) (not mapNonEmpty!29204) (not b!899073) (not bm!39914) (not b!899088) (not b!899146) (not b!899150) (not b!899142) (not d!111269) (not b!899086) (not d!111275) (not b!899174))
(check-sat b_and!26313 (not b_next!16027))
