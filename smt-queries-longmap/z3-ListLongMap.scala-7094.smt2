; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89980 () Bool)

(assert start!89980)

(declare-fun b!1030479 () Bool)

(declare-fun b_free!20619 () Bool)

(declare-fun b_next!20619 () Bool)

(assert (=> b!1030479 (= b_free!20619 (not b_next!20619))))

(declare-fun tp!72925 () Bool)

(declare-fun b_and!32999 () Bool)

(assert (=> b!1030479 (= tp!72925 b_and!32999)))

(declare-fun b!1030476 () Bool)

(declare-fun e!581911 () Bool)

(declare-datatypes ((V!37325 0))(
  ( (V!37326 (val!12220 Int)) )
))
(declare-datatypes ((ValueCell!11466 0))(
  ( (ValueCellFull!11466 (v!14797 V!37325)) (EmptyCell!11466) )
))
(declare-datatypes ((Unit!33663 0))(
  ( (Unit!33664) )
))
(declare-datatypes ((array!64740 0))(
  ( (array!64741 (arr!31173 (Array (_ BitVec 32) (_ BitVec 64))) (size!31690 (_ BitVec 32))) )
))
(declare-datatypes ((array!64742 0))(
  ( (array!64743 (arr!31174 (Array (_ BitVec 32) ValueCell!11466)) (size!31691 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5526 0))(
  ( (LongMapFixedSize!5527 (defaultEntry!6135 Int) (mask!29913 (_ BitVec 32)) (extraKeys!5867 (_ BitVec 32)) (zeroValue!5971 V!37325) (minValue!5971 V!37325) (_size!2818 (_ BitVec 32)) (_keys!11306 array!64740) (_values!6158 array!64742) (_vacant!2818 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15592 0))(
  ( (tuple2!15593 (_1!7807 Unit!33663) (_2!7807 LongMapFixedSize!5526)) )
))
(declare-fun lt!454589 () tuple2!15592)

(assert (=> b!1030476 (= e!581911 (bvsle #b00000000000000000000000000000000 (size!31690 (_keys!11306 (_2!7807 lt!454589)))))))

(declare-fun b!1030477 () Bool)

(declare-fun res!689096 () Bool)

(assert (=> b!1030477 (=> res!689096 e!581911)))

(declare-datatypes ((List!21839 0))(
  ( (Nil!21836) (Cons!21835 (h!23037 (_ BitVec 64)) (t!30953 List!21839)) )
))
(declare-fun arrayNoDuplicates!0 (array!64740 (_ BitVec 32) List!21839) Bool)

(assert (=> b!1030477 (= res!689096 (not (arrayNoDuplicates!0 (_keys!11306 (_2!7807 lt!454589)) #b00000000000000000000000000000000 Nil!21836)))))

(declare-fun b!1030478 () Bool)

(declare-fun e!581915 () Bool)

(declare-fun tp_is_empty!24339 () Bool)

(assert (=> b!1030478 (= e!581915 tp_is_empty!24339)))

(declare-fun e!581909 () Bool)

(declare-fun e!581912 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5526)

(declare-fun array_inv!24131 (array!64740) Bool)

(declare-fun array_inv!24132 (array!64742) Bool)

(assert (=> b!1030479 (= e!581909 (and tp!72925 tp_is_empty!24339 (array_inv!24131 (_keys!11306 thiss!1427)) (array_inv!24132 (_values!6158 thiss!1427)) e!581912))))

(declare-fun mapIsEmpty!37959 () Bool)

(declare-fun mapRes!37959 () Bool)

(assert (=> mapIsEmpty!37959 mapRes!37959))

(declare-fun b!1030480 () Bool)

(declare-fun e!581910 () Bool)

(assert (=> b!1030480 (= e!581912 (and e!581910 mapRes!37959))))

(declare-fun condMapEmpty!37959 () Bool)

(declare-fun mapDefault!37959 () ValueCell!11466)

(assert (=> b!1030480 (= condMapEmpty!37959 (= (arr!31174 (_values!6158 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11466)) mapDefault!37959)))))

(declare-fun b!1030481 () Bool)

(declare-fun res!689094 () Bool)

(assert (=> b!1030481 (=> res!689094 e!581911)))

(assert (=> b!1030481 (= res!689094 (or (not (= (size!31691 (_values!6158 (_2!7807 lt!454589))) (bvadd #b00000000000000000000000000000001 (mask!29913 (_2!7807 lt!454589))))) (not (= (size!31690 (_keys!11306 (_2!7807 lt!454589))) (size!31691 (_values!6158 (_2!7807 lt!454589))))) (bvslt (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000000000000) (bvslt (extraKeys!5867 (_2!7807 lt!454589)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5867 (_2!7807 lt!454589)) #b00000000000000000000000000000011)))))

(declare-fun b!1030482 () Bool)

(assert (=> b!1030482 (= e!581910 tp_is_empty!24339)))

(declare-fun b!1030483 () Bool)

(declare-fun e!581914 () Bool)

(declare-fun e!581908 () Bool)

(assert (=> b!1030483 (= e!581914 e!581908)))

(declare-fun res!689100 () Bool)

(assert (=> b!1030483 (=> (not res!689100) (not e!581908))))

(declare-datatypes ((SeekEntryResult!9691 0))(
  ( (MissingZero!9691 (index!41135 (_ BitVec 32))) (Found!9691 (index!41136 (_ BitVec 32))) (Intermediate!9691 (undefined!10503 Bool) (index!41137 (_ BitVec 32)) (x!91713 (_ BitVec 32))) (Undefined!9691) (MissingVacant!9691 (index!41138 (_ BitVec 32))) )
))
(declare-fun lt!454584 () SeekEntryResult!9691)

(get-info :version)

(assert (=> b!1030483 (= res!689100 ((_ is Found!9691) lt!454584))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64740 (_ BitVec 32)) SeekEntryResult!9691)

(assert (=> b!1030483 (= lt!454584 (seekEntry!0 key!909 (_keys!11306 thiss!1427) (mask!29913 thiss!1427)))))

(declare-fun b!1030484 () Bool)

(assert (=> b!1030484 (= e!581908 (not e!581911))))

(declare-fun res!689099 () Bool)

(assert (=> b!1030484 (=> res!689099 e!581911)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030484 (= res!689099 (not (validMask!0 (mask!29913 (_2!7807 lt!454589)))))))

(declare-fun lt!454585 () array!64740)

(declare-fun lt!454587 () array!64742)

(declare-fun Unit!33665 () Unit!33663)

(declare-fun Unit!33666 () Unit!33663)

(assert (=> b!1030484 (= lt!454589 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2818 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15593 Unit!33665 (LongMapFixedSize!5527 (defaultEntry!6135 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) (bvsub (_size!2818 thiss!1427) #b00000000000000000000000000000001) lt!454585 lt!454587 (bvadd #b00000000000000000000000000000001 (_vacant!2818 thiss!1427)))) (tuple2!15593 Unit!33666 (LongMapFixedSize!5527 (defaultEntry!6135 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) (bvsub (_size!2818 thiss!1427) #b00000000000000000000000000000001) lt!454585 lt!454587 (_vacant!2818 thiss!1427)))))))

(declare-datatypes ((tuple2!15594 0))(
  ( (tuple2!15595 (_1!7808 (_ BitVec 64)) (_2!7808 V!37325)) )
))
(declare-datatypes ((List!21840 0))(
  ( (Nil!21837) (Cons!21836 (h!23038 tuple2!15594) (t!30954 List!21840)) )
))
(declare-datatypes ((ListLongMap!13699 0))(
  ( (ListLongMap!13700 (toList!6865 List!21840)) )
))
(declare-fun -!492 (ListLongMap!13699 (_ BitVec 64)) ListLongMap!13699)

(declare-fun getCurrentListMap!3913 (array!64740 array!64742 (_ BitVec 32) (_ BitVec 32) V!37325 V!37325 (_ BitVec 32) Int) ListLongMap!13699)

(assert (=> b!1030484 (= (-!492 (getCurrentListMap!3913 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)) key!909) (getCurrentListMap!3913 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun dynLambda!1962 (Int (_ BitVec 64)) V!37325)

(assert (=> b!1030484 (= lt!454587 (array!64743 (store (arr!31174 (_values!6158 thiss!1427)) (index!41136 lt!454584) (ValueCellFull!11466 (dynLambda!1962 (defaultEntry!6135 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31691 (_values!6158 thiss!1427))))))

(declare-fun lt!454588 () Unit!33663)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (array!64740 array!64742 (_ BitVec 32) (_ BitVec 32) V!37325 V!37325 (_ BitVec 32) (_ BitVec 64) Int) Unit!33663)

(assert (=> b!1030484 (= lt!454588 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) (index!41136 lt!454584) key!909 (defaultEntry!6135 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030484 (not (arrayContainsKey!0 lt!454585 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454586 () Unit!33663)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64740 (_ BitVec 32) (_ BitVec 64)) Unit!33663)

(assert (=> b!1030484 (= lt!454586 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11306 thiss!1427) (index!41136 lt!454584) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64740 (_ BitVec 32)) Bool)

(assert (=> b!1030484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454585 (mask!29913 thiss!1427))))

(declare-fun lt!454583 () Unit!33663)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64740 (_ BitVec 32) (_ BitVec 32)) Unit!33663)

(assert (=> b!1030484 (= lt!454583 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11306 thiss!1427) (index!41136 lt!454584) (mask!29913 thiss!1427)))))

(assert (=> b!1030484 (arrayNoDuplicates!0 lt!454585 #b00000000000000000000000000000000 Nil!21836)))

(declare-fun lt!454590 () Unit!33663)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64740 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21839) Unit!33663)

(assert (=> b!1030484 (= lt!454590 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11306 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41136 lt!454584) #b00000000000000000000000000000000 Nil!21836))))

(declare-fun arrayCountValidKeys!0 (array!64740 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030484 (= (arrayCountValidKeys!0 lt!454585 #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030484 (= lt!454585 (array!64741 (store (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31690 (_keys!11306 thiss!1427))))))

(declare-fun lt!454582 () Unit!33663)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64740 (_ BitVec 32) (_ BitVec 64)) Unit!33663)

(assert (=> b!1030484 (= lt!454582 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11306 thiss!1427) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030485 () Bool)

(declare-fun res!689095 () Bool)

(assert (=> b!1030485 (=> res!689095 e!581911)))

(assert (=> b!1030485 (= res!689095 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11306 (_2!7807 lt!454589)) (mask!29913 (_2!7807 lt!454589)))))))

(declare-fun res!689097 () Bool)

(assert (=> start!89980 (=> (not res!689097) (not e!581914))))

(declare-fun valid!2092 (LongMapFixedSize!5526) Bool)

(assert (=> start!89980 (= res!689097 (valid!2092 thiss!1427))))

(assert (=> start!89980 e!581914))

(assert (=> start!89980 e!581909))

(assert (=> start!89980 true))

(declare-fun mapNonEmpty!37959 () Bool)

(declare-fun tp!72924 () Bool)

(assert (=> mapNonEmpty!37959 (= mapRes!37959 (and tp!72924 e!581915))))

(declare-fun mapKey!37959 () (_ BitVec 32))

(declare-fun mapRest!37959 () (Array (_ BitVec 32) ValueCell!11466))

(declare-fun mapValue!37959 () ValueCell!11466)

(assert (=> mapNonEmpty!37959 (= (arr!31174 (_values!6158 thiss!1427)) (store mapRest!37959 mapKey!37959 mapValue!37959))))

(declare-fun b!1030486 () Bool)

(declare-fun res!689098 () Bool)

(assert (=> b!1030486 (=> (not res!689098) (not e!581914))))

(assert (=> b!1030486 (= res!689098 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89980 res!689097) b!1030486))

(assert (= (and b!1030486 res!689098) b!1030483))

(assert (= (and b!1030483 res!689100) b!1030484))

(assert (= (and b!1030484 (not res!689099)) b!1030481))

(assert (= (and b!1030481 (not res!689094)) b!1030485))

(assert (= (and b!1030485 (not res!689095)) b!1030477))

(assert (= (and b!1030477 (not res!689096)) b!1030476))

(assert (= (and b!1030480 condMapEmpty!37959) mapIsEmpty!37959))

(assert (= (and b!1030480 (not condMapEmpty!37959)) mapNonEmpty!37959))

(assert (= (and mapNonEmpty!37959 ((_ is ValueCellFull!11466) mapValue!37959)) b!1030478))

(assert (= (and b!1030480 ((_ is ValueCellFull!11466) mapDefault!37959)) b!1030482))

(assert (= b!1030479 b!1030480))

(assert (= start!89980 b!1030479))

(declare-fun b_lambda!15949 () Bool)

(assert (=> (not b_lambda!15949) (not b!1030484)))

(declare-fun t!30952 () Bool)

(declare-fun tb!6937 () Bool)

(assert (=> (and b!1030479 (= (defaultEntry!6135 thiss!1427) (defaultEntry!6135 thiss!1427)) t!30952) tb!6937))

(declare-fun result!14201 () Bool)

(assert (=> tb!6937 (= result!14201 tp_is_empty!24339)))

(assert (=> b!1030484 t!30952))

(declare-fun b_and!33001 () Bool)

(assert (= b_and!32999 (and (=> t!30952 result!14201) b_and!33001)))

(declare-fun m!950237 () Bool)

(assert (=> mapNonEmpty!37959 m!950237))

(declare-fun m!950239 () Bool)

(assert (=> start!89980 m!950239))

(declare-fun m!950241 () Bool)

(assert (=> b!1030479 m!950241))

(declare-fun m!950243 () Bool)

(assert (=> b!1030479 m!950243))

(declare-fun m!950245 () Bool)

(assert (=> b!1030484 m!950245))

(declare-fun m!950247 () Bool)

(assert (=> b!1030484 m!950247))

(declare-fun m!950249 () Bool)

(assert (=> b!1030484 m!950249))

(declare-fun m!950251 () Bool)

(assert (=> b!1030484 m!950251))

(declare-fun m!950253 () Bool)

(assert (=> b!1030484 m!950253))

(declare-fun m!950255 () Bool)

(assert (=> b!1030484 m!950255))

(declare-fun m!950257 () Bool)

(assert (=> b!1030484 m!950257))

(declare-fun m!950259 () Bool)

(assert (=> b!1030484 m!950259))

(declare-fun m!950261 () Bool)

(assert (=> b!1030484 m!950261))

(declare-fun m!950263 () Bool)

(assert (=> b!1030484 m!950263))

(declare-fun m!950265 () Bool)

(assert (=> b!1030484 m!950265))

(assert (=> b!1030484 m!950263))

(declare-fun m!950267 () Bool)

(assert (=> b!1030484 m!950267))

(declare-fun m!950269 () Bool)

(assert (=> b!1030484 m!950269))

(declare-fun m!950271 () Bool)

(assert (=> b!1030484 m!950271))

(declare-fun m!950273 () Bool)

(assert (=> b!1030484 m!950273))

(declare-fun m!950275 () Bool)

(assert (=> b!1030484 m!950275))

(declare-fun m!950277 () Bool)

(assert (=> b!1030484 m!950277))

(declare-fun m!950279 () Bool)

(assert (=> b!1030477 m!950279))

(declare-fun m!950281 () Bool)

(assert (=> b!1030485 m!950281))

(declare-fun m!950283 () Bool)

(assert (=> b!1030483 m!950283))

(check-sat b_and!33001 (not mapNonEmpty!37959) (not b!1030485) (not b_lambda!15949) (not b_next!20619) (not b!1030477) (not b!1030483) (not start!89980) (not b!1030484) tp_is_empty!24339 (not b!1030479))
(check-sat b_and!33001 (not b_next!20619))
(get-model)

(declare-fun b_lambda!15953 () Bool)

(assert (= b_lambda!15949 (or (and b!1030479 b_free!20619) b_lambda!15953)))

(check-sat (not b_lambda!15953) b_and!33001 (not mapNonEmpty!37959) (not b!1030485) (not b_next!20619) (not b!1030477) (not b!1030483) (not start!89980) (not b!1030484) tp_is_empty!24339 (not b!1030479))
(check-sat b_and!33001 (not b_next!20619))
(get-model)

(declare-fun b!1030566 () Bool)

(declare-fun e!581977 () ListLongMap!13699)

(declare-fun call!43566 () ListLongMap!13699)

(assert (=> b!1030566 (= e!581977 call!43566)))

(declare-fun bm!43562 () Bool)

(declare-fun call!43567 () Bool)

(declare-fun lt!454679 () ListLongMap!13699)

(declare-fun contains!5978 (ListLongMap!13699 (_ BitVec 64)) Bool)

(assert (=> bm!43562 (= call!43567 (contains!5978 lt!454679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030567 () Bool)

(declare-fun e!581966 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1030567 (= e!581966 (validKeyInArray!0 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030568 () Bool)

(declare-fun e!581969 () ListLongMap!13699)

(declare-fun call!43570 () ListLongMap!13699)

(declare-fun +!3103 (ListLongMap!13699 tuple2!15594) ListLongMap!13699)

(assert (=> b!1030568 (= e!581969 (+!3103 call!43570 (tuple2!15595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5971 thiss!1427))))))

(declare-fun b!1030569 () Bool)

(declare-fun res!689142 () Bool)

(declare-fun e!581973 () Bool)

(assert (=> b!1030569 (=> (not res!689142) (not e!581973))))

(declare-fun e!581971 () Bool)

(assert (=> b!1030569 (= res!689142 e!581971)))

(declare-fun c!104194 () Bool)

(assert (=> b!1030569 (= c!104194 (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1030570 () Bool)

(declare-fun e!581976 () Bool)

(assert (=> b!1030570 (= e!581976 (validKeyInArray!0 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030571 () Bool)

(declare-fun e!581968 () Bool)

(declare-fun e!581974 () Bool)

(assert (=> b!1030571 (= e!581968 e!581974)))

(declare-fun res!689145 () Bool)

(assert (=> b!1030571 (= res!689145 call!43567)))

(assert (=> b!1030571 (=> (not res!689145) (not e!581974))))

(declare-fun b!1030572 () Bool)

(declare-fun e!581975 () ListLongMap!13699)

(declare-fun call!43571 () ListLongMap!13699)

(assert (=> b!1030572 (= e!581975 call!43571)))

(declare-fun b!1030573 () Bool)

(declare-fun call!43565 () Bool)

(assert (=> b!1030573 (= e!581971 (not call!43565))))

(declare-fun b!1030574 () Bool)

(declare-fun res!689140 () Bool)

(assert (=> b!1030574 (=> (not res!689140) (not e!581973))))

(declare-fun e!581970 () Bool)

(assert (=> b!1030574 (= res!689140 e!581970)))

(declare-fun res!689148 () Bool)

(assert (=> b!1030574 (=> res!689148 e!581970)))

(assert (=> b!1030574 (= res!689148 (not e!581966))))

(declare-fun res!689147 () Bool)

(assert (=> b!1030574 (=> (not res!689147) (not e!581966))))

(assert (=> b!1030574 (= res!689147 (bvslt #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))

(declare-fun bm!43564 () Bool)

(declare-fun call!43568 () ListLongMap!13699)

(assert (=> bm!43564 (= call!43571 call!43568)))

(declare-fun b!1030575 () Bool)

(assert (=> b!1030575 (= e!581973 e!581968)))

(declare-fun c!104198 () Bool)

(assert (=> b!1030575 (= c!104198 (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030576 () Bool)

(declare-fun e!581967 () Unit!33663)

(declare-fun lt!454666 () Unit!33663)

(assert (=> b!1030576 (= e!581967 lt!454666)))

(declare-fun lt!454674 () ListLongMap!13699)

(declare-fun getCurrentListMapNoExtraKeys!3519 (array!64740 array!64742 (_ BitVec 32) (_ BitVec 32) V!37325 V!37325 (_ BitVec 32) Int) ListLongMap!13699)

(assert (=> b!1030576 (= lt!454674 (getCurrentListMapNoExtraKeys!3519 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454671 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454681 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454681 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454662 () Unit!33663)

(declare-fun addStillContains!624 (ListLongMap!13699 (_ BitVec 64) V!37325 (_ BitVec 64)) Unit!33663)

(assert (=> b!1030576 (= lt!454662 (addStillContains!624 lt!454674 lt!454671 (zeroValue!5971 thiss!1427) lt!454681))))

(assert (=> b!1030576 (contains!5978 (+!3103 lt!454674 (tuple2!15595 lt!454671 (zeroValue!5971 thiss!1427))) lt!454681)))

(declare-fun lt!454675 () Unit!33663)

(assert (=> b!1030576 (= lt!454675 lt!454662)))

(declare-fun lt!454677 () ListLongMap!13699)

(assert (=> b!1030576 (= lt!454677 (getCurrentListMapNoExtraKeys!3519 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454670 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454670 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454665 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454665 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454669 () Unit!33663)

(declare-fun addApplyDifferent!484 (ListLongMap!13699 (_ BitVec 64) V!37325 (_ BitVec 64)) Unit!33663)

(assert (=> b!1030576 (= lt!454669 (addApplyDifferent!484 lt!454677 lt!454670 (minValue!5971 thiss!1427) lt!454665))))

(declare-fun apply!905 (ListLongMap!13699 (_ BitVec 64)) V!37325)

(assert (=> b!1030576 (= (apply!905 (+!3103 lt!454677 (tuple2!15595 lt!454670 (minValue!5971 thiss!1427))) lt!454665) (apply!905 lt!454677 lt!454665))))

(declare-fun lt!454667 () Unit!33663)

(assert (=> b!1030576 (= lt!454667 lt!454669)))

(declare-fun lt!454668 () ListLongMap!13699)

(assert (=> b!1030576 (= lt!454668 (getCurrentListMapNoExtraKeys!3519 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454664 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454664 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454680 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454680 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454663 () Unit!33663)

(assert (=> b!1030576 (= lt!454663 (addApplyDifferent!484 lt!454668 lt!454664 (zeroValue!5971 thiss!1427) lt!454680))))

(assert (=> b!1030576 (= (apply!905 (+!3103 lt!454668 (tuple2!15595 lt!454664 (zeroValue!5971 thiss!1427))) lt!454680) (apply!905 lt!454668 lt!454680))))

(declare-fun lt!454678 () Unit!33663)

(assert (=> b!1030576 (= lt!454678 lt!454663)))

(declare-fun lt!454683 () ListLongMap!13699)

(assert (=> b!1030576 (= lt!454683 (getCurrentListMapNoExtraKeys!3519 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454673 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454682 () (_ BitVec 64))

(assert (=> b!1030576 (= lt!454682 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030576 (= lt!454666 (addApplyDifferent!484 lt!454683 lt!454673 (minValue!5971 thiss!1427) lt!454682))))

(assert (=> b!1030576 (= (apply!905 (+!3103 lt!454683 (tuple2!15595 lt!454673 (minValue!5971 thiss!1427))) lt!454682) (apply!905 lt!454683 lt!454682))))

(declare-fun bm!43565 () Bool)

(declare-fun call!43569 () ListLongMap!13699)

(assert (=> bm!43565 (= call!43569 (getCurrentListMapNoExtraKeys!3519 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun b!1030577 () Bool)

(assert (=> b!1030577 (= e!581975 call!43566)))

(declare-fun d!123595 () Bool)

(assert (=> d!123595 e!581973))

(declare-fun res!689144 () Bool)

(assert (=> d!123595 (=> (not res!689144) (not e!581973))))

(assert (=> d!123595 (= res!689144 (or (bvsge #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))))

(declare-fun lt!454672 () ListLongMap!13699)

(assert (=> d!123595 (= lt!454679 lt!454672)))

(declare-fun lt!454676 () Unit!33663)

(assert (=> d!123595 (= lt!454676 e!581967)))

(declare-fun c!104196 () Bool)

(assert (=> d!123595 (= c!104196 e!581976)))

(declare-fun res!689141 () Bool)

(assert (=> d!123595 (=> (not res!689141) (not e!581976))))

(assert (=> d!123595 (= res!689141 (bvslt #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))

(assert (=> d!123595 (= lt!454672 e!581969)))

(declare-fun c!104197 () Bool)

(assert (=> d!123595 (= c!104197 (and (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123595 (validMask!0 (mask!29913 thiss!1427))))

(assert (=> d!123595 (= (getCurrentListMap!3913 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)) lt!454679)))

(declare-fun bm!43563 () Bool)

(assert (=> bm!43563 (= call!43566 call!43570)))

(declare-fun bm!43566 () Bool)

(assert (=> bm!43566 (= call!43568 call!43569)))

(declare-fun b!1030578 () Bool)

(declare-fun e!581972 () Bool)

(assert (=> b!1030578 (= e!581972 (= (apply!905 lt!454679 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5971 thiss!1427)))))

(declare-fun bm!43567 () Bool)

(assert (=> bm!43567 (= call!43565 (contains!5978 lt!454679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030579 () Bool)

(declare-fun e!581978 () Bool)

(declare-fun get!16372 (ValueCell!11466 V!37325) V!37325)

(assert (=> b!1030579 (= e!581978 (= (apply!905 lt!454679 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)) (get!16372 (select (arr!31174 (_values!6158 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1962 (defaultEntry!6135 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31691 (_values!6158 thiss!1427))))))

(assert (=> b!1030579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))

(declare-fun b!1030580 () Bool)

(declare-fun c!104193 () Bool)

(assert (=> b!1030580 (= c!104193 (and (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1030580 (= e!581977 e!581975)))

(declare-fun b!1030581 () Bool)

(assert (=> b!1030581 (= e!581968 (not call!43567))))

(declare-fun c!104195 () Bool)

(declare-fun bm!43568 () Bool)

(assert (=> bm!43568 (= call!43570 (+!3103 (ite c!104197 call!43569 (ite c!104195 call!43568 call!43571)) (ite (or c!104197 c!104195) (tuple2!15595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5971 thiss!1427)) (tuple2!15595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5971 thiss!1427)))))))

(declare-fun b!1030582 () Bool)

(declare-fun Unit!33667 () Unit!33663)

(assert (=> b!1030582 (= e!581967 Unit!33667)))

(declare-fun b!1030583 () Bool)

(assert (=> b!1030583 (= e!581974 (= (apply!905 lt!454679 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5971 thiss!1427)))))

(declare-fun b!1030584 () Bool)

(assert (=> b!1030584 (= e!581969 e!581977)))

(assert (=> b!1030584 (= c!104195 (and (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030585 () Bool)

(assert (=> b!1030585 (= e!581971 e!581972)))

(declare-fun res!689143 () Bool)

(assert (=> b!1030585 (= res!689143 call!43565)))

(assert (=> b!1030585 (=> (not res!689143) (not e!581972))))

(declare-fun b!1030586 () Bool)

(assert (=> b!1030586 (= e!581970 e!581978)))

(declare-fun res!689146 () Bool)

(assert (=> b!1030586 (=> (not res!689146) (not e!581978))))

(assert (=> b!1030586 (= res!689146 (contains!5978 lt!454679 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030586 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))

(assert (= (and d!123595 c!104197) b!1030568))

(assert (= (and d!123595 (not c!104197)) b!1030584))

(assert (= (and b!1030584 c!104195) b!1030566))

(assert (= (and b!1030584 (not c!104195)) b!1030580))

(assert (= (and b!1030580 c!104193) b!1030577))

(assert (= (and b!1030580 (not c!104193)) b!1030572))

(assert (= (or b!1030577 b!1030572) bm!43564))

(assert (= (or b!1030566 bm!43564) bm!43566))

(assert (= (or b!1030566 b!1030577) bm!43563))

(assert (= (or b!1030568 bm!43566) bm!43565))

(assert (= (or b!1030568 bm!43563) bm!43568))

(assert (= (and d!123595 res!689141) b!1030570))

(assert (= (and d!123595 c!104196) b!1030576))

(assert (= (and d!123595 (not c!104196)) b!1030582))

(assert (= (and d!123595 res!689144) b!1030574))

(assert (= (and b!1030574 res!689147) b!1030567))

(assert (= (and b!1030574 (not res!689148)) b!1030586))

(assert (= (and b!1030586 res!689146) b!1030579))

(assert (= (and b!1030574 res!689140) b!1030569))

(assert (= (and b!1030569 c!104194) b!1030585))

(assert (= (and b!1030569 (not c!104194)) b!1030573))

(assert (= (and b!1030585 res!689143) b!1030578))

(assert (= (or b!1030585 b!1030573) bm!43567))

(assert (= (and b!1030569 res!689142) b!1030575))

(assert (= (and b!1030575 c!104198) b!1030571))

(assert (= (and b!1030575 (not c!104198)) b!1030581))

(assert (= (and b!1030571 res!689145) b!1030583))

(assert (= (or b!1030571 b!1030581) bm!43562))

(declare-fun b_lambda!15955 () Bool)

(assert (=> (not b_lambda!15955) (not b!1030579)))

(assert (=> b!1030579 t!30952))

(declare-fun b_and!33007 () Bool)

(assert (= b_and!33001 (and (=> t!30952 result!14201) b_and!33007)))

(declare-fun m!950333 () Bool)

(assert (=> b!1030570 m!950333))

(assert (=> b!1030570 m!950333))

(declare-fun m!950335 () Bool)

(assert (=> b!1030570 m!950335))

(assert (=> b!1030586 m!950333))

(assert (=> b!1030586 m!950333))

(declare-fun m!950337 () Bool)

(assert (=> b!1030586 m!950337))

(declare-fun m!950339 () Bool)

(assert (=> b!1030576 m!950339))

(declare-fun m!950341 () Bool)

(assert (=> b!1030576 m!950341))

(declare-fun m!950343 () Bool)

(assert (=> b!1030576 m!950343))

(declare-fun m!950345 () Bool)

(assert (=> b!1030576 m!950345))

(declare-fun m!950347 () Bool)

(assert (=> b!1030576 m!950347))

(declare-fun m!950349 () Bool)

(assert (=> b!1030576 m!950349))

(declare-fun m!950351 () Bool)

(assert (=> b!1030576 m!950351))

(assert (=> b!1030576 m!950351))

(declare-fun m!950353 () Bool)

(assert (=> b!1030576 m!950353))

(declare-fun m!950355 () Bool)

(assert (=> b!1030576 m!950355))

(declare-fun m!950357 () Bool)

(assert (=> b!1030576 m!950357))

(declare-fun m!950359 () Bool)

(assert (=> b!1030576 m!950359))

(declare-fun m!950361 () Bool)

(assert (=> b!1030576 m!950361))

(assert (=> b!1030576 m!950339))

(declare-fun m!950363 () Bool)

(assert (=> b!1030576 m!950363))

(assert (=> b!1030576 m!950345))

(declare-fun m!950365 () Bool)

(assert (=> b!1030576 m!950365))

(assert (=> b!1030576 m!950333))

(assert (=> b!1030576 m!950357))

(declare-fun m!950367 () Bool)

(assert (=> b!1030576 m!950367))

(declare-fun m!950369 () Bool)

(assert (=> b!1030576 m!950369))

(declare-fun m!950371 () Bool)

(assert (=> b!1030579 m!950371))

(assert (=> b!1030579 m!950277))

(declare-fun m!950373 () Bool)

(assert (=> b!1030579 m!950373))

(assert (=> b!1030579 m!950277))

(assert (=> b!1030579 m!950371))

(assert (=> b!1030579 m!950333))

(assert (=> b!1030579 m!950333))

(declare-fun m!950375 () Bool)

(assert (=> b!1030579 m!950375))

(declare-fun m!950377 () Bool)

(assert (=> bm!43562 m!950377))

(declare-fun m!950379 () Bool)

(assert (=> bm!43567 m!950379))

(declare-fun m!950381 () Bool)

(assert (=> bm!43568 m!950381))

(declare-fun m!950383 () Bool)

(assert (=> b!1030578 m!950383))

(assert (=> b!1030567 m!950333))

(assert (=> b!1030567 m!950333))

(assert (=> b!1030567 m!950335))

(declare-fun m!950385 () Bool)

(assert (=> b!1030583 m!950385))

(declare-fun m!950387 () Bool)

(assert (=> b!1030568 m!950387))

(assert (=> bm!43565 m!950363))

(declare-fun m!950389 () Bool)

(assert (=> d!123595 m!950389))

(assert (=> b!1030484 d!123595))

(declare-fun b!1030596 () Bool)

(declare-fun res!689159 () Bool)

(declare-fun e!581983 () Bool)

(assert (=> b!1030596 (=> (not res!689159) (not e!581983))))

(assert (=> b!1030596 (= res!689159 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030597 () Bool)

(assert (=> b!1030597 (= e!581983 (bvslt (size!31690 (_keys!11306 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!123597 () Bool)

(declare-fun e!581984 () Bool)

(assert (=> d!123597 e!581984))

(declare-fun res!689157 () Bool)

(assert (=> d!123597 (=> (not res!689157) (not e!581984))))

(assert (=> d!123597 (= res!689157 (and (bvsge (index!41136 lt!454584) #b00000000000000000000000000000000) (bvslt (index!41136 lt!454584) (size!31690 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454686 () Unit!33663)

(declare-fun choose!82 (array!64740 (_ BitVec 32) (_ BitVec 64)) Unit!33663)

(assert (=> d!123597 (= lt!454686 (choose!82 (_keys!11306 thiss!1427) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123597 e!581983))

(declare-fun res!689160 () Bool)

(assert (=> d!123597 (=> (not res!689160) (not e!581983))))

(assert (=> d!123597 (= res!689160 (and (bvsge (index!41136 lt!454584) #b00000000000000000000000000000000) (bvslt (index!41136 lt!454584) (size!31690 (_keys!11306 thiss!1427)))))))

(assert (=> d!123597 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11306 thiss!1427) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) lt!454686)))

(declare-fun b!1030595 () Bool)

(declare-fun res!689158 () Bool)

(assert (=> b!1030595 (=> (not res!689158) (not e!581983))))

(assert (=> b!1030595 (= res!689158 (validKeyInArray!0 (select (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584))))))

(declare-fun b!1030598 () Bool)

(assert (=> b!1030598 (= e!581984 (= (arrayCountValidKeys!0 (array!64741 (store (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31690 (_keys!11306 thiss!1427))) #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) #b00000000000000000000000000000001)))))

(assert (= (and d!123597 res!689160) b!1030595))

(assert (= (and b!1030595 res!689158) b!1030596))

(assert (= (and b!1030596 res!689159) b!1030597))

(assert (= (and d!123597 res!689157) b!1030598))

(declare-fun m!950391 () Bool)

(assert (=> b!1030596 m!950391))

(declare-fun m!950393 () Bool)

(assert (=> d!123597 m!950393))

(declare-fun m!950395 () Bool)

(assert (=> b!1030595 m!950395))

(assert (=> b!1030595 m!950395))

(declare-fun m!950397 () Bool)

(assert (=> b!1030595 m!950397))

(assert (=> b!1030598 m!950275))

(declare-fun m!950399 () Bool)

(assert (=> b!1030598 m!950399))

(assert (=> b!1030598 m!950257))

(assert (=> b!1030484 d!123597))

(declare-fun b!1030609 () Bool)

(declare-fun e!581995 () Bool)

(declare-fun e!581994 () Bool)

(assert (=> b!1030609 (= e!581995 e!581994)))

(declare-fun res!689168 () Bool)

(assert (=> b!1030609 (=> (not res!689168) (not e!581994))))

(declare-fun e!581996 () Bool)

(assert (=> b!1030609 (= res!689168 (not e!581996))))

(declare-fun res!689167 () Bool)

(assert (=> b!1030609 (=> (not res!689167) (not e!581996))))

(assert (=> b!1030609 (= res!689167 (validKeyInArray!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(declare-fun d!123599 () Bool)

(declare-fun res!689169 () Bool)

(assert (=> d!123599 (=> res!689169 e!581995)))

(assert (=> d!123599 (= res!689169 (bvsge #b00000000000000000000000000000000 (size!31690 lt!454585)))))

(assert (=> d!123599 (= (arrayNoDuplicates!0 lt!454585 #b00000000000000000000000000000000 Nil!21836) e!581995)))

(declare-fun b!1030610 () Bool)

(declare-fun contains!5979 (List!21839 (_ BitVec 64)) Bool)

(assert (=> b!1030610 (= e!581996 (contains!5979 Nil!21836 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(declare-fun b!1030611 () Bool)

(declare-fun e!581993 () Bool)

(declare-fun call!43574 () Bool)

(assert (=> b!1030611 (= e!581993 call!43574)))

(declare-fun b!1030612 () Bool)

(assert (=> b!1030612 (= e!581993 call!43574)))

(declare-fun b!1030613 () Bool)

(assert (=> b!1030613 (= e!581994 e!581993)))

(declare-fun c!104201 () Bool)

(assert (=> b!1030613 (= c!104201 (validKeyInArray!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(declare-fun bm!43571 () Bool)

(assert (=> bm!43571 (= call!43574 (arrayNoDuplicates!0 lt!454585 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104201 (Cons!21835 (select (arr!31173 lt!454585) #b00000000000000000000000000000000) Nil!21836) Nil!21836)))))

(assert (= (and d!123599 (not res!689169)) b!1030609))

(assert (= (and b!1030609 res!689167) b!1030610))

(assert (= (and b!1030609 res!689168) b!1030613))

(assert (= (and b!1030613 c!104201) b!1030612))

(assert (= (and b!1030613 (not c!104201)) b!1030611))

(assert (= (or b!1030612 b!1030611) bm!43571))

(declare-fun m!950401 () Bool)

(assert (=> b!1030609 m!950401))

(assert (=> b!1030609 m!950401))

(declare-fun m!950403 () Bool)

(assert (=> b!1030609 m!950403))

(assert (=> b!1030610 m!950401))

(assert (=> b!1030610 m!950401))

(declare-fun m!950405 () Bool)

(assert (=> b!1030610 m!950405))

(assert (=> b!1030613 m!950401))

(assert (=> b!1030613 m!950401))

(assert (=> b!1030613 m!950403))

(assert (=> bm!43571 m!950401))

(declare-fun m!950407 () Bool)

(assert (=> bm!43571 m!950407))

(assert (=> b!1030484 d!123599))

(declare-fun b!1030622 () Bool)

(declare-fun e!582001 () (_ BitVec 32))

(declare-fun call!43577 () (_ BitVec 32))

(assert (=> b!1030622 (= e!582001 (bvadd #b00000000000000000000000000000001 call!43577))))

(declare-fun b!1030623 () Bool)

(declare-fun e!582002 () (_ BitVec 32))

(assert (=> b!1030623 (= e!582002 #b00000000000000000000000000000000)))

(declare-fun bm!43574 () Bool)

(assert (=> bm!43574 (= call!43577 (arrayCountValidKeys!0 lt!454585 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31690 (_keys!11306 thiss!1427))))))

(declare-fun b!1030624 () Bool)

(assert (=> b!1030624 (= e!582001 call!43577)))

(declare-fun d!123601 () Bool)

(declare-fun lt!454689 () (_ BitVec 32))

(assert (=> d!123601 (and (bvsge lt!454689 #b00000000000000000000000000000000) (bvsle lt!454689 (bvsub (size!31690 lt!454585) #b00000000000000000000000000000000)))))

(assert (=> d!123601 (= lt!454689 e!582002)))

(declare-fun c!104207 () Bool)

(assert (=> d!123601 (= c!104207 (bvsge #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))

(assert (=> d!123601 (and (bvsle #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31690 (_keys!11306 thiss!1427)) (size!31690 lt!454585)))))

(assert (=> d!123601 (= (arrayCountValidKeys!0 lt!454585 #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) lt!454689)))

(declare-fun b!1030625 () Bool)

(assert (=> b!1030625 (= e!582002 e!582001)))

(declare-fun c!104206 () Bool)

(assert (=> b!1030625 (= c!104206 (validKeyInArray!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(assert (= (and d!123601 c!104207) b!1030623))

(assert (= (and d!123601 (not c!104207)) b!1030625))

(assert (= (and b!1030625 c!104206) b!1030622))

(assert (= (and b!1030625 (not c!104206)) b!1030624))

(assert (= (or b!1030622 b!1030624) bm!43574))

(declare-fun m!950409 () Bool)

(assert (=> bm!43574 m!950409))

(assert (=> b!1030625 m!950401))

(assert (=> b!1030625 m!950401))

(assert (=> b!1030625 m!950403))

(assert (=> b!1030484 d!123601))

(declare-fun d!123603 () Bool)

(declare-fun e!582005 () Bool)

(assert (=> d!123603 e!582005))

(declare-fun res!689172 () Bool)

(assert (=> d!123603 (=> (not res!689172) (not e!582005))))

(assert (=> d!123603 (= res!689172 (and (bvsge (index!41136 lt!454584) #b00000000000000000000000000000000) (bvslt (index!41136 lt!454584) (size!31690 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454692 () Unit!33663)

(declare-fun choose!1695 (array!64740 array!64742 (_ BitVec 32) (_ BitVec 32) V!37325 V!37325 (_ BitVec 32) (_ BitVec 64) Int) Unit!33663)

(assert (=> d!123603 (= lt!454692 (choose!1695 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) (index!41136 lt!454584) key!909 (defaultEntry!6135 thiss!1427)))))

(assert (=> d!123603 (validMask!0 (mask!29913 thiss!1427))))

(assert (=> d!123603 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) (index!41136 lt!454584) key!909 (defaultEntry!6135 thiss!1427)) lt!454692)))

(declare-fun b!1030628 () Bool)

(assert (=> b!1030628 (= e!582005 (= (-!492 (getCurrentListMap!3913 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)) key!909) (getCurrentListMap!3913 (array!64741 (store (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31690 (_keys!11306 thiss!1427))) (array!64743 (store (arr!31174 (_values!6158 thiss!1427)) (index!41136 lt!454584) (ValueCellFull!11466 (dynLambda!1962 (defaultEntry!6135 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31691 (_values!6158 thiss!1427))) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427))))))

(assert (=> b!1030628 (bvslt (index!41136 lt!454584) (size!31691 (_values!6158 thiss!1427)))))

(assert (= (and d!123603 res!689172) b!1030628))

(declare-fun b_lambda!15957 () Bool)

(assert (=> (not b_lambda!15957) (not b!1030628)))

(assert (=> b!1030628 t!30952))

(declare-fun b_and!33009 () Bool)

(assert (= b_and!33007 (and (=> t!30952 result!14201) b_and!33009)))

(declare-fun m!950411 () Bool)

(assert (=> d!123603 m!950411))

(assert (=> d!123603 m!950389))

(assert (=> b!1030628 m!950275))

(assert (=> b!1030628 m!950263))

(assert (=> b!1030628 m!950265))

(assert (=> b!1030628 m!950277))

(declare-fun m!950413 () Bool)

(assert (=> b!1030628 m!950413))

(assert (=> b!1030628 m!950263))

(assert (=> b!1030628 m!950267))

(assert (=> b!1030484 d!123603))

(declare-fun d!123605 () Bool)

(declare-fun e!582008 () Bool)

(assert (=> d!123605 e!582008))

(declare-fun res!689175 () Bool)

(assert (=> d!123605 (=> (not res!689175) (not e!582008))))

(assert (=> d!123605 (= res!689175 (bvslt (index!41136 lt!454584) (size!31690 (_keys!11306 thiss!1427))))))

(declare-fun lt!454695 () Unit!33663)

(declare-fun choose!121 (array!64740 (_ BitVec 32) (_ BitVec 64)) Unit!33663)

(assert (=> d!123605 (= lt!454695 (choose!121 (_keys!11306 thiss!1427) (index!41136 lt!454584) key!909))))

(assert (=> d!123605 (bvsge (index!41136 lt!454584) #b00000000000000000000000000000000)))

(assert (=> d!123605 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11306 thiss!1427) (index!41136 lt!454584) key!909) lt!454695)))

(declare-fun b!1030631 () Bool)

(assert (=> b!1030631 (= e!582008 (not (arrayContainsKey!0 (array!64741 (store (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31690 (_keys!11306 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123605 res!689175) b!1030631))

(declare-fun m!950415 () Bool)

(assert (=> d!123605 m!950415))

(assert (=> b!1030631 m!950275))

(declare-fun m!950417 () Bool)

(assert (=> b!1030631 m!950417))

(assert (=> b!1030484 d!123605))

(declare-fun b!1030632 () Bool)

(declare-fun e!582009 () (_ BitVec 32))

(declare-fun call!43578 () (_ BitVec 32))

(assert (=> b!1030632 (= e!582009 (bvadd #b00000000000000000000000000000001 call!43578))))

(declare-fun b!1030633 () Bool)

(declare-fun e!582010 () (_ BitVec 32))

(assert (=> b!1030633 (= e!582010 #b00000000000000000000000000000000)))

(declare-fun bm!43575 () Bool)

(assert (=> bm!43575 (= call!43578 (arrayCountValidKeys!0 (_keys!11306 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31690 (_keys!11306 thiss!1427))))))

(declare-fun b!1030634 () Bool)

(assert (=> b!1030634 (= e!582009 call!43578)))

(declare-fun d!123607 () Bool)

(declare-fun lt!454696 () (_ BitVec 32))

(assert (=> d!123607 (and (bvsge lt!454696 #b00000000000000000000000000000000) (bvsle lt!454696 (bvsub (size!31690 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123607 (= lt!454696 e!582010)))

(declare-fun c!104209 () Bool)

(assert (=> d!123607 (= c!104209 (bvsge #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))))))

(assert (=> d!123607 (and (bvsle #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31690 (_keys!11306 thiss!1427)) (size!31690 (_keys!11306 thiss!1427))))))

(assert (=> d!123607 (= (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) lt!454696)))

(declare-fun b!1030635 () Bool)

(assert (=> b!1030635 (= e!582010 e!582009)))

(declare-fun c!104208 () Bool)

(assert (=> b!1030635 (= c!104208 (validKeyInArray!0 (select (arr!31173 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123607 c!104209) b!1030633))

(assert (= (and d!123607 (not c!104209)) b!1030635))

(assert (= (and b!1030635 c!104208) b!1030632))

(assert (= (and b!1030635 (not c!104208)) b!1030634))

(assert (= (or b!1030632 b!1030634) bm!43575))

(declare-fun m!950419 () Bool)

(assert (=> bm!43575 m!950419))

(assert (=> b!1030635 m!950333))

(assert (=> b!1030635 m!950333))

(assert (=> b!1030635 m!950335))

(assert (=> b!1030484 d!123607))

(declare-fun b!1030636 () Bool)

(declare-fun e!582022 () ListLongMap!13699)

(declare-fun call!43580 () ListLongMap!13699)

(assert (=> b!1030636 (= e!582022 call!43580)))

(declare-fun bm!43576 () Bool)

(declare-fun call!43581 () Bool)

(declare-fun lt!454714 () ListLongMap!13699)

(assert (=> bm!43576 (= call!43581 (contains!5978 lt!454714 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030637 () Bool)

(declare-fun e!582011 () Bool)

(assert (=> b!1030637 (= e!582011 (validKeyInArray!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(declare-fun b!1030638 () Bool)

(declare-fun e!582014 () ListLongMap!13699)

(declare-fun call!43584 () ListLongMap!13699)

(assert (=> b!1030638 (= e!582014 (+!3103 call!43584 (tuple2!15595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5971 thiss!1427))))))

(declare-fun b!1030639 () Bool)

(declare-fun res!689178 () Bool)

(declare-fun e!582018 () Bool)

(assert (=> b!1030639 (=> (not res!689178) (not e!582018))))

(declare-fun e!582016 () Bool)

(assert (=> b!1030639 (= res!689178 e!582016)))

(declare-fun c!104211 () Bool)

(assert (=> b!1030639 (= c!104211 (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1030640 () Bool)

(declare-fun e!582021 () Bool)

(assert (=> b!1030640 (= e!582021 (validKeyInArray!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(declare-fun b!1030641 () Bool)

(declare-fun e!582013 () Bool)

(declare-fun e!582019 () Bool)

(assert (=> b!1030641 (= e!582013 e!582019)))

(declare-fun res!689181 () Bool)

(assert (=> b!1030641 (= res!689181 call!43581)))

(assert (=> b!1030641 (=> (not res!689181) (not e!582019))))

(declare-fun b!1030642 () Bool)

(declare-fun e!582020 () ListLongMap!13699)

(declare-fun call!43585 () ListLongMap!13699)

(assert (=> b!1030642 (= e!582020 call!43585)))

(declare-fun b!1030643 () Bool)

(declare-fun call!43579 () Bool)

(assert (=> b!1030643 (= e!582016 (not call!43579))))

(declare-fun b!1030644 () Bool)

(declare-fun res!689176 () Bool)

(assert (=> b!1030644 (=> (not res!689176) (not e!582018))))

(declare-fun e!582015 () Bool)

(assert (=> b!1030644 (= res!689176 e!582015)))

(declare-fun res!689184 () Bool)

(assert (=> b!1030644 (=> res!689184 e!582015)))

(assert (=> b!1030644 (= res!689184 (not e!582011))))

(declare-fun res!689183 () Bool)

(assert (=> b!1030644 (=> (not res!689183) (not e!582011))))

(assert (=> b!1030644 (= res!689183 (bvslt #b00000000000000000000000000000000 (size!31690 lt!454585)))))

(declare-fun bm!43578 () Bool)

(declare-fun call!43582 () ListLongMap!13699)

(assert (=> bm!43578 (= call!43585 call!43582)))

(declare-fun b!1030645 () Bool)

(assert (=> b!1030645 (= e!582018 e!582013)))

(declare-fun c!104215 () Bool)

(assert (=> b!1030645 (= c!104215 (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030646 () Bool)

(declare-fun e!582012 () Unit!33663)

(declare-fun lt!454701 () Unit!33663)

(assert (=> b!1030646 (= e!582012 lt!454701)))

(declare-fun lt!454709 () ListLongMap!13699)

(assert (=> b!1030646 (= lt!454709 (getCurrentListMapNoExtraKeys!3519 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454706 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454706 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454716 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454716 (select (arr!31173 lt!454585) #b00000000000000000000000000000000))))

(declare-fun lt!454697 () Unit!33663)

(assert (=> b!1030646 (= lt!454697 (addStillContains!624 lt!454709 lt!454706 (zeroValue!5971 thiss!1427) lt!454716))))

(assert (=> b!1030646 (contains!5978 (+!3103 lt!454709 (tuple2!15595 lt!454706 (zeroValue!5971 thiss!1427))) lt!454716)))

(declare-fun lt!454710 () Unit!33663)

(assert (=> b!1030646 (= lt!454710 lt!454697)))

(declare-fun lt!454712 () ListLongMap!13699)

(assert (=> b!1030646 (= lt!454712 (getCurrentListMapNoExtraKeys!3519 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454705 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454705 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454700 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454700 (select (arr!31173 lt!454585) #b00000000000000000000000000000000))))

(declare-fun lt!454704 () Unit!33663)

(assert (=> b!1030646 (= lt!454704 (addApplyDifferent!484 lt!454712 lt!454705 (minValue!5971 thiss!1427) lt!454700))))

(assert (=> b!1030646 (= (apply!905 (+!3103 lt!454712 (tuple2!15595 lt!454705 (minValue!5971 thiss!1427))) lt!454700) (apply!905 lt!454712 lt!454700))))

(declare-fun lt!454702 () Unit!33663)

(assert (=> b!1030646 (= lt!454702 lt!454704)))

(declare-fun lt!454703 () ListLongMap!13699)

(assert (=> b!1030646 (= lt!454703 (getCurrentListMapNoExtraKeys!3519 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454699 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454715 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454715 (select (arr!31173 lt!454585) #b00000000000000000000000000000000))))

(declare-fun lt!454698 () Unit!33663)

(assert (=> b!1030646 (= lt!454698 (addApplyDifferent!484 lt!454703 lt!454699 (zeroValue!5971 thiss!1427) lt!454715))))

(assert (=> b!1030646 (= (apply!905 (+!3103 lt!454703 (tuple2!15595 lt!454699 (zeroValue!5971 thiss!1427))) lt!454715) (apply!905 lt!454703 lt!454715))))

(declare-fun lt!454713 () Unit!33663)

(assert (=> b!1030646 (= lt!454713 lt!454698)))

(declare-fun lt!454718 () ListLongMap!13699)

(assert (=> b!1030646 (= lt!454718 (getCurrentListMapNoExtraKeys!3519 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun lt!454708 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454708 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454717 () (_ BitVec 64))

(assert (=> b!1030646 (= lt!454717 (select (arr!31173 lt!454585) #b00000000000000000000000000000000))))

(assert (=> b!1030646 (= lt!454701 (addApplyDifferent!484 lt!454718 lt!454708 (minValue!5971 thiss!1427) lt!454717))))

(assert (=> b!1030646 (= (apply!905 (+!3103 lt!454718 (tuple2!15595 lt!454708 (minValue!5971 thiss!1427))) lt!454717) (apply!905 lt!454718 lt!454717))))

(declare-fun bm!43579 () Bool)

(declare-fun call!43583 () ListLongMap!13699)

(assert (=> bm!43579 (= call!43583 (getCurrentListMapNoExtraKeys!3519 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)))))

(declare-fun b!1030647 () Bool)

(assert (=> b!1030647 (= e!582020 call!43580)))

(declare-fun d!123609 () Bool)

(assert (=> d!123609 e!582018))

(declare-fun res!689180 () Bool)

(assert (=> d!123609 (=> (not res!689180) (not e!582018))))

(assert (=> d!123609 (= res!689180 (or (bvsge #b00000000000000000000000000000000 (size!31690 lt!454585)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31690 lt!454585)))))))

(declare-fun lt!454707 () ListLongMap!13699)

(assert (=> d!123609 (= lt!454714 lt!454707)))

(declare-fun lt!454711 () Unit!33663)

(assert (=> d!123609 (= lt!454711 e!582012)))

(declare-fun c!104213 () Bool)

(assert (=> d!123609 (= c!104213 e!582021)))

(declare-fun res!689177 () Bool)

(assert (=> d!123609 (=> (not res!689177) (not e!582021))))

(assert (=> d!123609 (= res!689177 (bvslt #b00000000000000000000000000000000 (size!31690 lt!454585)))))

(assert (=> d!123609 (= lt!454707 e!582014)))

(declare-fun c!104214 () Bool)

(assert (=> d!123609 (= c!104214 (and (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123609 (validMask!0 (mask!29913 thiss!1427))))

(assert (=> d!123609 (= (getCurrentListMap!3913 lt!454585 lt!454587 (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)) lt!454714)))

(declare-fun bm!43577 () Bool)

(assert (=> bm!43577 (= call!43580 call!43584)))

(declare-fun bm!43580 () Bool)

(assert (=> bm!43580 (= call!43582 call!43583)))

(declare-fun b!1030648 () Bool)

(declare-fun e!582017 () Bool)

(assert (=> b!1030648 (= e!582017 (= (apply!905 lt!454714 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5971 thiss!1427)))))

(declare-fun bm!43581 () Bool)

(assert (=> bm!43581 (= call!43579 (contains!5978 lt!454714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582023 () Bool)

(declare-fun b!1030649 () Bool)

(assert (=> b!1030649 (= e!582023 (= (apply!905 lt!454714 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)) (get!16372 (select (arr!31174 lt!454587) #b00000000000000000000000000000000) (dynLambda!1962 (defaultEntry!6135 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31691 lt!454587)))))

(assert (=> b!1030649 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31690 lt!454585)))))

(declare-fun b!1030650 () Bool)

(declare-fun c!104210 () Bool)

(assert (=> b!1030650 (= c!104210 (and (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1030650 (= e!582022 e!582020)))

(declare-fun b!1030651 () Bool)

(assert (=> b!1030651 (= e!582013 (not call!43581))))

(declare-fun bm!43582 () Bool)

(declare-fun c!104212 () Bool)

(assert (=> bm!43582 (= call!43584 (+!3103 (ite c!104214 call!43583 (ite c!104212 call!43582 call!43585)) (ite (or c!104214 c!104212) (tuple2!15595 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5971 thiss!1427)) (tuple2!15595 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5971 thiss!1427)))))))

(declare-fun b!1030652 () Bool)

(declare-fun Unit!33668 () Unit!33663)

(assert (=> b!1030652 (= e!582012 Unit!33668)))

(declare-fun b!1030653 () Bool)

(assert (=> b!1030653 (= e!582019 (= (apply!905 lt!454714 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5971 thiss!1427)))))

(declare-fun b!1030654 () Bool)

(assert (=> b!1030654 (= e!582014 e!582022)))

(assert (=> b!1030654 (= c!104212 (and (not (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5867 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030655 () Bool)

(assert (=> b!1030655 (= e!582016 e!582017)))

(declare-fun res!689179 () Bool)

(assert (=> b!1030655 (= res!689179 call!43579)))

(assert (=> b!1030655 (=> (not res!689179) (not e!582017))))

(declare-fun b!1030656 () Bool)

(assert (=> b!1030656 (= e!582015 e!582023)))

(declare-fun res!689182 () Bool)

(assert (=> b!1030656 (=> (not res!689182) (not e!582023))))

(assert (=> b!1030656 (= res!689182 (contains!5978 lt!454714 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(assert (=> b!1030656 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31690 lt!454585)))))

(assert (= (and d!123609 c!104214) b!1030638))

(assert (= (and d!123609 (not c!104214)) b!1030654))

(assert (= (and b!1030654 c!104212) b!1030636))

(assert (= (and b!1030654 (not c!104212)) b!1030650))

(assert (= (and b!1030650 c!104210) b!1030647))

(assert (= (and b!1030650 (not c!104210)) b!1030642))

(assert (= (or b!1030647 b!1030642) bm!43578))

(assert (= (or b!1030636 bm!43578) bm!43580))

(assert (= (or b!1030636 b!1030647) bm!43577))

(assert (= (or b!1030638 bm!43580) bm!43579))

(assert (= (or b!1030638 bm!43577) bm!43582))

(assert (= (and d!123609 res!689177) b!1030640))

(assert (= (and d!123609 c!104213) b!1030646))

(assert (= (and d!123609 (not c!104213)) b!1030652))

(assert (= (and d!123609 res!689180) b!1030644))

(assert (= (and b!1030644 res!689183) b!1030637))

(assert (= (and b!1030644 (not res!689184)) b!1030656))

(assert (= (and b!1030656 res!689182) b!1030649))

(assert (= (and b!1030644 res!689176) b!1030639))

(assert (= (and b!1030639 c!104211) b!1030655))

(assert (= (and b!1030639 (not c!104211)) b!1030643))

(assert (= (and b!1030655 res!689179) b!1030648))

(assert (= (or b!1030655 b!1030643) bm!43581))

(assert (= (and b!1030639 res!689178) b!1030645))

(assert (= (and b!1030645 c!104215) b!1030641))

(assert (= (and b!1030645 (not c!104215)) b!1030651))

(assert (= (and b!1030641 res!689181) b!1030653))

(assert (= (or b!1030641 b!1030651) bm!43576))

(declare-fun b_lambda!15959 () Bool)

(assert (=> (not b_lambda!15959) (not b!1030649)))

(assert (=> b!1030649 t!30952))

(declare-fun b_and!33011 () Bool)

(assert (= b_and!33009 (and (=> t!30952 result!14201) b_and!33011)))

(assert (=> b!1030640 m!950401))

(assert (=> b!1030640 m!950401))

(assert (=> b!1030640 m!950403))

(assert (=> b!1030656 m!950401))

(assert (=> b!1030656 m!950401))

(declare-fun m!950421 () Bool)

(assert (=> b!1030656 m!950421))

(declare-fun m!950423 () Bool)

(assert (=> b!1030646 m!950423))

(declare-fun m!950425 () Bool)

(assert (=> b!1030646 m!950425))

(declare-fun m!950427 () Bool)

(assert (=> b!1030646 m!950427))

(declare-fun m!950429 () Bool)

(assert (=> b!1030646 m!950429))

(declare-fun m!950431 () Bool)

(assert (=> b!1030646 m!950431))

(declare-fun m!950433 () Bool)

(assert (=> b!1030646 m!950433))

(declare-fun m!950435 () Bool)

(assert (=> b!1030646 m!950435))

(assert (=> b!1030646 m!950435))

(declare-fun m!950437 () Bool)

(assert (=> b!1030646 m!950437))

(declare-fun m!950439 () Bool)

(assert (=> b!1030646 m!950439))

(declare-fun m!950441 () Bool)

(assert (=> b!1030646 m!950441))

(declare-fun m!950443 () Bool)

(assert (=> b!1030646 m!950443))

(declare-fun m!950445 () Bool)

(assert (=> b!1030646 m!950445))

(assert (=> b!1030646 m!950423))

(declare-fun m!950447 () Bool)

(assert (=> b!1030646 m!950447))

(assert (=> b!1030646 m!950429))

(declare-fun m!950449 () Bool)

(assert (=> b!1030646 m!950449))

(assert (=> b!1030646 m!950401))

(assert (=> b!1030646 m!950441))

(declare-fun m!950451 () Bool)

(assert (=> b!1030646 m!950451))

(declare-fun m!950453 () Bool)

(assert (=> b!1030646 m!950453))

(declare-fun m!950455 () Bool)

(assert (=> b!1030649 m!950455))

(assert (=> b!1030649 m!950277))

(declare-fun m!950457 () Bool)

(assert (=> b!1030649 m!950457))

(assert (=> b!1030649 m!950277))

(assert (=> b!1030649 m!950455))

(assert (=> b!1030649 m!950401))

(assert (=> b!1030649 m!950401))

(declare-fun m!950459 () Bool)

(assert (=> b!1030649 m!950459))

(declare-fun m!950461 () Bool)

(assert (=> bm!43576 m!950461))

(declare-fun m!950463 () Bool)

(assert (=> bm!43581 m!950463))

(declare-fun m!950465 () Bool)

(assert (=> bm!43582 m!950465))

(declare-fun m!950467 () Bool)

(assert (=> b!1030648 m!950467))

(assert (=> b!1030637 m!950401))

(assert (=> b!1030637 m!950401))

(assert (=> b!1030637 m!950403))

(declare-fun m!950469 () Bool)

(assert (=> b!1030653 m!950469))

(declare-fun m!950471 () Bool)

(assert (=> b!1030638 m!950471))

(assert (=> bm!43579 m!950447))

(assert (=> d!123609 m!950389))

(assert (=> b!1030484 d!123609))

(declare-fun d!123611 () Bool)

(assert (=> d!123611 (= (validMask!0 (mask!29913 (_2!7807 lt!454589))) (and (or (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000000000111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000000001111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000000011111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000000111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000001111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000011111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000000111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000001111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000011111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000000111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000001111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000011111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000000111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000001111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000011111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000000111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000001111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000011111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000000111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000001111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000011111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000000111111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000001111111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000011111111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00000111111111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00001111111111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00011111111111111111111111111111) (= (mask!29913 (_2!7807 lt!454589)) #b00111111111111111111111111111111)) (bvsle (mask!29913 (_2!7807 lt!454589)) #b00111111111111111111111111111111)))))

(assert (=> b!1030484 d!123611))

(declare-fun d!123613 () Bool)

(declare-fun lt!454721 () ListLongMap!13699)

(assert (=> d!123613 (not (contains!5978 lt!454721 key!909))))

(declare-fun removeStrictlySorted!55 (List!21840 (_ BitVec 64)) List!21840)

(assert (=> d!123613 (= lt!454721 (ListLongMap!13700 (removeStrictlySorted!55 (toList!6865 (getCurrentListMap!3913 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427))) key!909)))))

(assert (=> d!123613 (= (-!492 (getCurrentListMap!3913 (_keys!11306 thiss!1427) (_values!6158 thiss!1427) (mask!29913 thiss!1427) (extraKeys!5867 thiss!1427) (zeroValue!5971 thiss!1427) (minValue!5971 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6135 thiss!1427)) key!909) lt!454721)))

(declare-fun bs!30120 () Bool)

(assert (= bs!30120 d!123613))

(declare-fun m!950473 () Bool)

(assert (=> bs!30120 m!950473))

(declare-fun m!950475 () Bool)

(assert (=> bs!30120 m!950475))

(assert (=> b!1030484 d!123613))

(declare-fun d!123615 () Bool)

(declare-fun res!689189 () Bool)

(declare-fun e!582028 () Bool)

(assert (=> d!123615 (=> res!689189 e!582028)))

(assert (=> d!123615 (= res!689189 (= (select (arr!31173 lt!454585) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123615 (= (arrayContainsKey!0 lt!454585 key!909 #b00000000000000000000000000000000) e!582028)))

(declare-fun b!1030661 () Bool)

(declare-fun e!582029 () Bool)

(assert (=> b!1030661 (= e!582028 e!582029)))

(declare-fun res!689190 () Bool)

(assert (=> b!1030661 (=> (not res!689190) (not e!582029))))

(assert (=> b!1030661 (= res!689190 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31690 lt!454585)))))

(declare-fun b!1030662 () Bool)

(assert (=> b!1030662 (= e!582029 (arrayContainsKey!0 lt!454585 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123615 (not res!689189)) b!1030661))

(assert (= (and b!1030661 res!689190) b!1030662))

(assert (=> d!123615 m!950401))

(declare-fun m!950477 () Bool)

(assert (=> b!1030662 m!950477))

(assert (=> b!1030484 d!123615))

(declare-fun d!123617 () Bool)

(declare-fun res!689195 () Bool)

(declare-fun e!582037 () Bool)

(assert (=> d!123617 (=> res!689195 e!582037)))

(assert (=> d!123617 (= res!689195 (bvsge #b00000000000000000000000000000000 (size!31690 lt!454585)))))

(assert (=> d!123617 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454585 (mask!29913 thiss!1427)) e!582037)))

(declare-fun b!1030671 () Bool)

(declare-fun e!582038 () Bool)

(declare-fun call!43588 () Bool)

(assert (=> b!1030671 (= e!582038 call!43588)))

(declare-fun b!1030672 () Bool)

(assert (=> b!1030672 (= e!582037 e!582038)))

(declare-fun c!104218 () Bool)

(assert (=> b!1030672 (= c!104218 (validKeyInArray!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000)))))

(declare-fun b!1030673 () Bool)

(declare-fun e!582036 () Bool)

(assert (=> b!1030673 (= e!582036 call!43588)))

(declare-fun bm!43585 () Bool)

(assert (=> bm!43585 (= call!43588 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!454585 (mask!29913 thiss!1427)))))

(declare-fun b!1030674 () Bool)

(assert (=> b!1030674 (= e!582038 e!582036)))

(declare-fun lt!454728 () (_ BitVec 64))

(assert (=> b!1030674 (= lt!454728 (select (arr!31173 lt!454585) #b00000000000000000000000000000000))))

(declare-fun lt!454729 () Unit!33663)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64740 (_ BitVec 64) (_ BitVec 32)) Unit!33663)

(assert (=> b!1030674 (= lt!454729 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454585 lt!454728 #b00000000000000000000000000000000))))

(assert (=> b!1030674 (arrayContainsKey!0 lt!454585 lt!454728 #b00000000000000000000000000000000)))

(declare-fun lt!454730 () Unit!33663)

(assert (=> b!1030674 (= lt!454730 lt!454729)))

(declare-fun res!689196 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64740 (_ BitVec 32)) SeekEntryResult!9691)

(assert (=> b!1030674 (= res!689196 (= (seekEntryOrOpen!0 (select (arr!31173 lt!454585) #b00000000000000000000000000000000) lt!454585 (mask!29913 thiss!1427)) (Found!9691 #b00000000000000000000000000000000)))))

(assert (=> b!1030674 (=> (not res!689196) (not e!582036))))

(assert (= (and d!123617 (not res!689195)) b!1030672))

(assert (= (and b!1030672 c!104218) b!1030674))

(assert (= (and b!1030672 (not c!104218)) b!1030671))

(assert (= (and b!1030674 res!689196) b!1030673))

(assert (= (or b!1030673 b!1030671) bm!43585))

(assert (=> b!1030672 m!950401))

(assert (=> b!1030672 m!950401))

(assert (=> b!1030672 m!950403))

(declare-fun m!950479 () Bool)

(assert (=> bm!43585 m!950479))

(assert (=> b!1030674 m!950401))

(declare-fun m!950481 () Bool)

(assert (=> b!1030674 m!950481))

(declare-fun m!950483 () Bool)

(assert (=> b!1030674 m!950483))

(assert (=> b!1030674 m!950401))

(declare-fun m!950485 () Bool)

(assert (=> b!1030674 m!950485))

(assert (=> b!1030484 d!123617))

(declare-fun d!123619 () Bool)

(declare-fun e!582041 () Bool)

(assert (=> d!123619 e!582041))

(declare-fun res!689199 () Bool)

(assert (=> d!123619 (=> (not res!689199) (not e!582041))))

(assert (=> d!123619 (= res!689199 (and (bvsge (index!41136 lt!454584) #b00000000000000000000000000000000) (bvslt (index!41136 lt!454584) (size!31690 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454733 () Unit!33663)

(declare-fun choose!25 (array!64740 (_ BitVec 32) (_ BitVec 32)) Unit!33663)

(assert (=> d!123619 (= lt!454733 (choose!25 (_keys!11306 thiss!1427) (index!41136 lt!454584) (mask!29913 thiss!1427)))))

(assert (=> d!123619 (validMask!0 (mask!29913 thiss!1427))))

(assert (=> d!123619 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11306 thiss!1427) (index!41136 lt!454584) (mask!29913 thiss!1427)) lt!454733)))

(declare-fun b!1030677 () Bool)

(assert (=> b!1030677 (= e!582041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64741 (store (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31690 (_keys!11306 thiss!1427))) (mask!29913 thiss!1427)))))

(assert (= (and d!123619 res!689199) b!1030677))

(declare-fun m!950487 () Bool)

(assert (=> d!123619 m!950487))

(assert (=> d!123619 m!950389))

(assert (=> b!1030677 m!950275))

(declare-fun m!950489 () Bool)

(assert (=> b!1030677 m!950489))

(assert (=> b!1030484 d!123619))

(declare-fun d!123621 () Bool)

(declare-fun e!582044 () Bool)

(assert (=> d!123621 e!582044))

(declare-fun res!689202 () Bool)

(assert (=> d!123621 (=> (not res!689202) (not e!582044))))

(assert (=> d!123621 (= res!689202 (and (bvsge (index!41136 lt!454584) #b00000000000000000000000000000000) (bvslt (index!41136 lt!454584) (size!31690 (_keys!11306 thiss!1427)))))))

(declare-fun lt!454736 () Unit!33663)

(declare-fun choose!53 (array!64740 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21839) Unit!33663)

(assert (=> d!123621 (= lt!454736 (choose!53 (_keys!11306 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41136 lt!454584) #b00000000000000000000000000000000 Nil!21836))))

(assert (=> d!123621 (bvslt (size!31690 (_keys!11306 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123621 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11306 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41136 lt!454584) #b00000000000000000000000000000000 Nil!21836) lt!454736)))

(declare-fun b!1030680 () Bool)

(assert (=> b!1030680 (= e!582044 (arrayNoDuplicates!0 (array!64741 (store (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31690 (_keys!11306 thiss!1427))) #b00000000000000000000000000000000 Nil!21836))))

(assert (= (and d!123621 res!689202) b!1030680))

(declare-fun m!950491 () Bool)

(assert (=> d!123621 m!950491))

(assert (=> b!1030680 m!950275))

(declare-fun m!950493 () Bool)

(assert (=> b!1030680 m!950493))

(assert (=> b!1030484 d!123621))

(declare-fun d!123623 () Bool)

(declare-fun res!689203 () Bool)

(declare-fun e!582046 () Bool)

(assert (=> d!123623 (=> res!689203 e!582046)))

(assert (=> d!123623 (= res!689203 (bvsge #b00000000000000000000000000000000 (size!31690 (_keys!11306 (_2!7807 lt!454589)))))))

(assert (=> d!123623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11306 (_2!7807 lt!454589)) (mask!29913 (_2!7807 lt!454589))) e!582046)))

(declare-fun b!1030681 () Bool)

(declare-fun e!582047 () Bool)

(declare-fun call!43589 () Bool)

(assert (=> b!1030681 (= e!582047 call!43589)))

(declare-fun b!1030682 () Bool)

(assert (=> b!1030682 (= e!582046 e!582047)))

(declare-fun c!104219 () Bool)

(assert (=> b!1030682 (= c!104219 (validKeyInArray!0 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000)))))

(declare-fun b!1030683 () Bool)

(declare-fun e!582045 () Bool)

(assert (=> b!1030683 (= e!582045 call!43589)))

(declare-fun bm!43586 () Bool)

(assert (=> bm!43586 (= call!43589 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11306 (_2!7807 lt!454589)) (mask!29913 (_2!7807 lt!454589))))))

(declare-fun b!1030684 () Bool)

(assert (=> b!1030684 (= e!582047 e!582045)))

(declare-fun lt!454737 () (_ BitVec 64))

(assert (=> b!1030684 (= lt!454737 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000))))

(declare-fun lt!454738 () Unit!33663)

(assert (=> b!1030684 (= lt!454738 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11306 (_2!7807 lt!454589)) lt!454737 #b00000000000000000000000000000000))))

(assert (=> b!1030684 (arrayContainsKey!0 (_keys!11306 (_2!7807 lt!454589)) lt!454737 #b00000000000000000000000000000000)))

(declare-fun lt!454739 () Unit!33663)

(assert (=> b!1030684 (= lt!454739 lt!454738)))

(declare-fun res!689204 () Bool)

(assert (=> b!1030684 (= res!689204 (= (seekEntryOrOpen!0 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000) (_keys!11306 (_2!7807 lt!454589)) (mask!29913 (_2!7807 lt!454589))) (Found!9691 #b00000000000000000000000000000000)))))

(assert (=> b!1030684 (=> (not res!689204) (not e!582045))))

(assert (= (and d!123623 (not res!689203)) b!1030682))

(assert (= (and b!1030682 c!104219) b!1030684))

(assert (= (and b!1030682 (not c!104219)) b!1030681))

(assert (= (and b!1030684 res!689204) b!1030683))

(assert (= (or b!1030683 b!1030681) bm!43586))

(declare-fun m!950495 () Bool)

(assert (=> b!1030682 m!950495))

(assert (=> b!1030682 m!950495))

(declare-fun m!950497 () Bool)

(assert (=> b!1030682 m!950497))

(declare-fun m!950499 () Bool)

(assert (=> bm!43586 m!950499))

(assert (=> b!1030684 m!950495))

(declare-fun m!950501 () Bool)

(assert (=> b!1030684 m!950501))

(declare-fun m!950503 () Bool)

(assert (=> b!1030684 m!950503))

(assert (=> b!1030684 m!950495))

(declare-fun m!950505 () Bool)

(assert (=> b!1030684 m!950505))

(assert (=> b!1030485 d!123623))

(declare-fun b!1030697 () Bool)

(declare-fun e!582054 () SeekEntryResult!9691)

(assert (=> b!1030697 (= e!582054 Undefined!9691)))

(declare-fun b!1030698 () Bool)

(declare-fun c!104226 () Bool)

(declare-fun lt!454750 () (_ BitVec 64))

(assert (=> b!1030698 (= c!104226 (= lt!454750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582056 () SeekEntryResult!9691)

(declare-fun e!582055 () SeekEntryResult!9691)

(assert (=> b!1030698 (= e!582056 e!582055)))

(declare-fun b!1030699 () Bool)

(declare-fun lt!454748 () SeekEntryResult!9691)

(assert (=> b!1030699 (= e!582055 (MissingZero!9691 (index!41137 lt!454748)))))

(declare-fun b!1030700 () Bool)

(declare-fun lt!454749 () SeekEntryResult!9691)

(assert (=> b!1030700 (= e!582055 (ite ((_ is MissingVacant!9691) lt!454749) (MissingZero!9691 (index!41138 lt!454749)) lt!454749))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64740 (_ BitVec 32)) SeekEntryResult!9691)

(assert (=> b!1030700 (= lt!454749 (seekKeyOrZeroReturnVacant!0 (x!91713 lt!454748) (index!41137 lt!454748) (index!41137 lt!454748) key!909 (_keys!11306 thiss!1427) (mask!29913 thiss!1427)))))

(declare-fun d!123625 () Bool)

(declare-fun lt!454751 () SeekEntryResult!9691)

(assert (=> d!123625 (and (or ((_ is MissingVacant!9691) lt!454751) (not ((_ is Found!9691) lt!454751)) (and (bvsge (index!41136 lt!454751) #b00000000000000000000000000000000) (bvslt (index!41136 lt!454751) (size!31690 (_keys!11306 thiss!1427))))) (not ((_ is MissingVacant!9691) lt!454751)) (or (not ((_ is Found!9691) lt!454751)) (= (select (arr!31173 (_keys!11306 thiss!1427)) (index!41136 lt!454751)) key!909)))))

(assert (=> d!123625 (= lt!454751 e!582054)))

(declare-fun c!104227 () Bool)

(assert (=> d!123625 (= c!104227 (and ((_ is Intermediate!9691) lt!454748) (undefined!10503 lt!454748)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64740 (_ BitVec 32)) SeekEntryResult!9691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123625 (= lt!454748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29913 thiss!1427)) key!909 (_keys!11306 thiss!1427) (mask!29913 thiss!1427)))))

(assert (=> d!123625 (validMask!0 (mask!29913 thiss!1427))))

(assert (=> d!123625 (= (seekEntry!0 key!909 (_keys!11306 thiss!1427) (mask!29913 thiss!1427)) lt!454751)))

(declare-fun b!1030701 () Bool)

(assert (=> b!1030701 (= e!582056 (Found!9691 (index!41137 lt!454748)))))

(declare-fun b!1030702 () Bool)

(assert (=> b!1030702 (= e!582054 e!582056)))

(assert (=> b!1030702 (= lt!454750 (select (arr!31173 (_keys!11306 thiss!1427)) (index!41137 lt!454748)))))

(declare-fun c!104228 () Bool)

(assert (=> b!1030702 (= c!104228 (= lt!454750 key!909))))

(assert (= (and d!123625 c!104227) b!1030697))

(assert (= (and d!123625 (not c!104227)) b!1030702))

(assert (= (and b!1030702 c!104228) b!1030701))

(assert (= (and b!1030702 (not c!104228)) b!1030698))

(assert (= (and b!1030698 c!104226) b!1030699))

(assert (= (and b!1030698 (not c!104226)) b!1030700))

(declare-fun m!950507 () Bool)

(assert (=> b!1030700 m!950507))

(declare-fun m!950509 () Bool)

(assert (=> d!123625 m!950509))

(declare-fun m!950511 () Bool)

(assert (=> d!123625 m!950511))

(assert (=> d!123625 m!950511))

(declare-fun m!950513 () Bool)

(assert (=> d!123625 m!950513))

(assert (=> d!123625 m!950389))

(declare-fun m!950515 () Bool)

(assert (=> b!1030702 m!950515))

(assert (=> b!1030483 d!123625))

(declare-fun d!123627 () Bool)

(assert (=> d!123627 (= (array_inv!24131 (_keys!11306 thiss!1427)) (bvsge (size!31690 (_keys!11306 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030479 d!123627))

(declare-fun d!123629 () Bool)

(assert (=> d!123629 (= (array_inv!24132 (_values!6158 thiss!1427)) (bvsge (size!31691 (_values!6158 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030479 d!123629))

(declare-fun d!123631 () Bool)

(declare-fun res!689211 () Bool)

(declare-fun e!582059 () Bool)

(assert (=> d!123631 (=> (not res!689211) (not e!582059))))

(declare-fun simpleValid!396 (LongMapFixedSize!5526) Bool)

(assert (=> d!123631 (= res!689211 (simpleValid!396 thiss!1427))))

(assert (=> d!123631 (= (valid!2092 thiss!1427) e!582059)))

(declare-fun b!1030709 () Bool)

(declare-fun res!689212 () Bool)

(assert (=> b!1030709 (=> (not res!689212) (not e!582059))))

(assert (=> b!1030709 (= res!689212 (= (arrayCountValidKeys!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 (size!31690 (_keys!11306 thiss!1427))) (_size!2818 thiss!1427)))))

(declare-fun b!1030710 () Bool)

(declare-fun res!689213 () Bool)

(assert (=> b!1030710 (=> (not res!689213) (not e!582059))))

(assert (=> b!1030710 (= res!689213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11306 thiss!1427) (mask!29913 thiss!1427)))))

(declare-fun b!1030711 () Bool)

(assert (=> b!1030711 (= e!582059 (arrayNoDuplicates!0 (_keys!11306 thiss!1427) #b00000000000000000000000000000000 Nil!21836))))

(assert (= (and d!123631 res!689211) b!1030709))

(assert (= (and b!1030709 res!689212) b!1030710))

(assert (= (and b!1030710 res!689213) b!1030711))

(declare-fun m!950517 () Bool)

(assert (=> d!123631 m!950517))

(assert (=> b!1030709 m!950257))

(declare-fun m!950519 () Bool)

(assert (=> b!1030710 m!950519))

(declare-fun m!950521 () Bool)

(assert (=> b!1030711 m!950521))

(assert (=> start!89980 d!123631))

(declare-fun b!1030712 () Bool)

(declare-fun e!582062 () Bool)

(declare-fun e!582061 () Bool)

(assert (=> b!1030712 (= e!582062 e!582061)))

(declare-fun res!689215 () Bool)

(assert (=> b!1030712 (=> (not res!689215) (not e!582061))))

(declare-fun e!582063 () Bool)

(assert (=> b!1030712 (= res!689215 (not e!582063))))

(declare-fun res!689214 () Bool)

(assert (=> b!1030712 (=> (not res!689214) (not e!582063))))

(assert (=> b!1030712 (= res!689214 (validKeyInArray!0 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000)))))

(declare-fun d!123633 () Bool)

(declare-fun res!689216 () Bool)

(assert (=> d!123633 (=> res!689216 e!582062)))

(assert (=> d!123633 (= res!689216 (bvsge #b00000000000000000000000000000000 (size!31690 (_keys!11306 (_2!7807 lt!454589)))))))

(assert (=> d!123633 (= (arrayNoDuplicates!0 (_keys!11306 (_2!7807 lt!454589)) #b00000000000000000000000000000000 Nil!21836) e!582062)))

(declare-fun b!1030713 () Bool)

(assert (=> b!1030713 (= e!582063 (contains!5979 Nil!21836 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000)))))

(declare-fun b!1030714 () Bool)

(declare-fun e!582060 () Bool)

(declare-fun call!43590 () Bool)

(assert (=> b!1030714 (= e!582060 call!43590)))

(declare-fun b!1030715 () Bool)

(assert (=> b!1030715 (= e!582060 call!43590)))

(declare-fun b!1030716 () Bool)

(assert (=> b!1030716 (= e!582061 e!582060)))

(declare-fun c!104229 () Bool)

(assert (=> b!1030716 (= c!104229 (validKeyInArray!0 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000)))))

(declare-fun bm!43587 () Bool)

(assert (=> bm!43587 (= call!43590 (arrayNoDuplicates!0 (_keys!11306 (_2!7807 lt!454589)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104229 (Cons!21835 (select (arr!31173 (_keys!11306 (_2!7807 lt!454589))) #b00000000000000000000000000000000) Nil!21836) Nil!21836)))))

(assert (= (and d!123633 (not res!689216)) b!1030712))

(assert (= (and b!1030712 res!689214) b!1030713))

(assert (= (and b!1030712 res!689215) b!1030716))

(assert (= (and b!1030716 c!104229) b!1030715))

(assert (= (and b!1030716 (not c!104229)) b!1030714))

(assert (= (or b!1030715 b!1030714) bm!43587))

(assert (=> b!1030712 m!950495))

(assert (=> b!1030712 m!950495))

(assert (=> b!1030712 m!950497))

(assert (=> b!1030713 m!950495))

(assert (=> b!1030713 m!950495))

(declare-fun m!950523 () Bool)

(assert (=> b!1030713 m!950523))

(assert (=> b!1030716 m!950495))

(assert (=> b!1030716 m!950495))

(assert (=> b!1030716 m!950497))

(assert (=> bm!43587 m!950495))

(declare-fun m!950525 () Bool)

(assert (=> bm!43587 m!950525))

(assert (=> b!1030477 d!123633))

(declare-fun condMapEmpty!37965 () Bool)

(declare-fun mapDefault!37965 () ValueCell!11466)

(assert (=> mapNonEmpty!37959 (= condMapEmpty!37965 (= mapRest!37959 ((as const (Array (_ BitVec 32) ValueCell!11466)) mapDefault!37965)))))

(declare-fun e!582069 () Bool)

(declare-fun mapRes!37965 () Bool)

(assert (=> mapNonEmpty!37959 (= tp!72924 (and e!582069 mapRes!37965))))

(declare-fun b!1030724 () Bool)

(assert (=> b!1030724 (= e!582069 tp_is_empty!24339)))

(declare-fun mapIsEmpty!37965 () Bool)

(assert (=> mapIsEmpty!37965 mapRes!37965))

(declare-fun b!1030723 () Bool)

(declare-fun e!582068 () Bool)

(assert (=> b!1030723 (= e!582068 tp_is_empty!24339)))

(declare-fun mapNonEmpty!37965 () Bool)

(declare-fun tp!72934 () Bool)

(assert (=> mapNonEmpty!37965 (= mapRes!37965 (and tp!72934 e!582068))))

(declare-fun mapValue!37965 () ValueCell!11466)

(declare-fun mapRest!37965 () (Array (_ BitVec 32) ValueCell!11466))

(declare-fun mapKey!37965 () (_ BitVec 32))

(assert (=> mapNonEmpty!37965 (= mapRest!37959 (store mapRest!37965 mapKey!37965 mapValue!37965))))

(assert (= (and mapNonEmpty!37959 condMapEmpty!37965) mapIsEmpty!37965))

(assert (= (and mapNonEmpty!37959 (not condMapEmpty!37965)) mapNonEmpty!37965))

(assert (= (and mapNonEmpty!37965 ((_ is ValueCellFull!11466) mapValue!37965)) b!1030723))

(assert (= (and mapNonEmpty!37959 ((_ is ValueCellFull!11466) mapDefault!37965)) b!1030724))

(declare-fun m!950527 () Bool)

(assert (=> mapNonEmpty!37965 m!950527))

(declare-fun b_lambda!15961 () Bool)

(assert (= b_lambda!15957 (or (and b!1030479 b_free!20619) b_lambda!15961)))

(declare-fun b_lambda!15963 () Bool)

(assert (= b_lambda!15955 (or (and b!1030479 b_free!20619) b_lambda!15963)))

(declare-fun b_lambda!15965 () Bool)

(assert (= b_lambda!15959 (or (and b!1030479 b_free!20619) b_lambda!15965)))

(check-sat (not bm!43562) (not b!1030596) (not bm!43567) (not d!123605) (not b!1030680) (not b!1030649) (not b!1030576) (not b!1030713) (not bm!43576) (not b_lambda!15953) (not b!1030586) (not b!1030595) (not b!1030579) (not b!1030567) (not d!123595) (not b!1030656) (not b!1030613) (not d!123597) (not b!1030637) (not d!123631) (not bm!43581) (not b!1030677) (not b!1030716) (not b!1030662) (not b!1030648) (not bm!43579) (not bm!43582) (not b!1030625) (not b!1030631) (not bm!43574) (not b!1030638) (not b!1030583) (not bm!43565) (not bm!43575) (not mapNonEmpty!37965) (not d!123625) (not b_next!20619) (not d!123619) (not bm!43587) b_and!33011 (not bm!43585) (not bm!43568) (not b!1030635) (not b_lambda!15965) (not b!1030610) (not d!123603) (not d!123621) (not b!1030711) (not b!1030609) (not b!1030684) (not d!123609) (not b_lambda!15963) (not b!1030710) (not b!1030674) (not d!123613) tp_is_empty!24339 (not b!1030682) (not b!1030598) (not b!1030640) (not b!1030709) (not b!1030628) (not bm!43586) (not b!1030646) (not b!1030578) (not b!1030653) (not bm!43571) (not b_lambda!15961) (not b!1030568) (not b!1030672) (not b!1030712) (not b!1030700) (not b!1030570))
(check-sat b_and!33011 (not b_next!20619))
