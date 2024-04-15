; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21932 () Bool)

(assert start!21932)

(declare-fun b!223095 () Bool)

(declare-fun b_free!5995 () Bool)

(declare-fun b_next!5995 () Bool)

(assert (=> b!223095 (= b_free!5995 (not b_next!5995))))

(declare-fun tp!21127 () Bool)

(declare-fun b_and!12867 () Bool)

(assert (=> b!223095 (= tp!21127 b_and!12867)))

(declare-fun mapNonEmpty!9955 () Bool)

(declare-fun mapRes!9955 () Bool)

(declare-fun tp!21126 () Bool)

(declare-fun e!144936 () Bool)

(assert (=> mapNonEmpty!9955 (= mapRes!9955 (and tp!21126 e!144936))))

(declare-datatypes ((V!7457 0))(
  ( (V!7458 (val!2973 Int)) )
))
(declare-datatypes ((ValueCell!2585 0))(
  ( (ValueCellFull!2585 (v!4987 V!7457)) (EmptyCell!2585) )
))
(declare-fun mapValue!9955 () ValueCell!2585)

(declare-fun mapKey!9955 () (_ BitVec 32))

(declare-datatypes ((array!10949 0))(
  ( (array!10950 (arr!5193 (Array (_ BitVec 32) ValueCell!2585)) (size!5527 (_ BitVec 32))) )
))
(declare-datatypes ((array!10951 0))(
  ( (array!10952 (arr!5194 (Array (_ BitVec 32) (_ BitVec 64))) (size!5528 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3070 0))(
  ( (LongMapFixedSize!3071 (defaultEntry!4194 Int) (mask!10019 (_ BitVec 32)) (extraKeys!3931 (_ BitVec 32)) (zeroValue!4035 V!7457) (minValue!4035 V!7457) (_size!1584 (_ BitVec 32)) (_keys!6247 array!10951) (_values!4177 array!10949) (_vacant!1584 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3070)

(declare-fun mapRest!9955 () (Array (_ BitVec 32) ValueCell!2585))

(assert (=> mapNonEmpty!9955 (= (arr!5193 (_values!4177 thiss!1504)) (store mapRest!9955 mapKey!9955 mapValue!9955))))

(declare-fun b!223074 () Bool)

(declare-fun e!144934 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3299 0))(
  ( (Nil!3296) (Cons!3295 (h!3943 (_ BitVec 64)) (t!8249 List!3299)) )
))
(declare-fun contains!1515 (List!3299 (_ BitVec 64)) Bool)

(assert (=> b!223074 (= e!144934 (not (contains!1515 Nil!3296 key!932)))))

(declare-fun b!223075 () Bool)

(declare-datatypes ((Unit!6645 0))(
  ( (Unit!6646) )
))
(declare-fun e!144929 () Unit!6645)

(declare-fun lt!112671 () Unit!6645)

(assert (=> b!223075 (= e!144929 lt!112671)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!224 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) Int) Unit!6645)

(assert (=> b!223075 (= lt!112671 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!224 (_keys!6247 thiss!1504) (_values!4177 thiss!1504) (mask!10019 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 (defaultEntry!4194 thiss!1504)))))

(declare-fun c!37041 () Bool)

(declare-datatypes ((SeekEntryResult!841 0))(
  ( (MissingZero!841 (index!5534 (_ BitVec 32))) (Found!841 (index!5535 (_ BitVec 32))) (Intermediate!841 (undefined!1653 Bool) (index!5536 (_ BitVec 32)) (x!23084 (_ BitVec 32))) (Undefined!841) (MissingVacant!841 (index!5537 (_ BitVec 32))) )
))
(declare-fun lt!112669 () SeekEntryResult!841)

(get-info :version)

(assert (=> b!223075 (= c!37041 ((_ is MissingZero!841) lt!112669))))

(declare-fun e!144922 () Bool)

(assert (=> b!223075 e!144922))

(declare-fun b!223077 () Bool)

(declare-fun tp_is_empty!5857 () Bool)

(assert (=> b!223077 (= e!144936 tp_is_empty!5857)))

(declare-fun b!223078 () Bool)

(declare-fun e!144932 () Bool)

(declare-fun call!20796 () Bool)

(assert (=> b!223078 (= e!144932 (not call!20796))))

(declare-fun b!223079 () Bool)

(declare-fun e!144924 () Bool)

(declare-fun e!144930 () Bool)

(assert (=> b!223079 (= e!144924 e!144930)))

(declare-fun res!109594 () Bool)

(assert (=> b!223079 (=> (not res!109594) (not e!144930))))

(assert (=> b!223079 (= res!109594 (and (bvslt (size!5528 (_keys!6247 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5528 (_keys!6247 thiss!1504)))))))

(declare-fun lt!112666 () Unit!6645)

(declare-fun e!144921 () Unit!6645)

(assert (=> b!223079 (= lt!112666 e!144921)))

(declare-fun c!37039 () Bool)

(declare-fun lt!112665 () Bool)

(assert (=> b!223079 (= c!37039 lt!112665)))

(declare-fun arrayContainsKey!0 (array!10951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223079 (= lt!112665 (arrayContainsKey!0 (_keys!6247 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223080 () Bool)

(declare-fun res!109587 () Bool)

(assert (=> b!223080 (=> (not res!109587) (not e!144930))))

(declare-fun arrayNoDuplicates!0 (array!10951 (_ BitVec 32) List!3299) Bool)

(assert (=> b!223080 (= res!109587 (arrayNoDuplicates!0 (_keys!6247 thiss!1504) #b00000000000000000000000000000000 Nil!3296))))

(declare-fun b!223081 () Bool)

(declare-fun e!144919 () Bool)

(declare-fun e!144925 () Bool)

(assert (=> b!223081 (= e!144919 e!144925)))

(declare-fun res!109588 () Bool)

(assert (=> b!223081 (=> (not res!109588) (not e!144925))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223081 (= res!109588 (or (= lt!112669 (MissingZero!841 index!297)) (= lt!112669 (MissingVacant!841 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10951 (_ BitVec 32)) SeekEntryResult!841)

(assert (=> b!223081 (= lt!112669 (seekEntryOrOpen!0 key!932 (_keys!6247 thiss!1504) (mask!10019 thiss!1504)))))

(declare-fun b!223082 () Bool)

(declare-fun res!109591 () Bool)

(assert (=> b!223082 (=> (not res!109591) (not e!144930))))

(declare-fun e!144927 () Bool)

(assert (=> b!223082 (= res!109591 e!144927)))

(declare-fun res!109592 () Bool)

(assert (=> b!223082 (=> res!109592 e!144927)))

(declare-fun e!144923 () Bool)

(assert (=> b!223082 (= res!109592 e!144923)))

(declare-fun res!109584 () Bool)

(assert (=> b!223082 (=> (not res!109584) (not e!144923))))

(assert (=> b!223082 (= res!109584 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223083 () Bool)

(declare-fun res!109586 () Bool)

(assert (=> b!223083 (=> (not res!109586) (not e!144930))))

(assert (=> b!223083 (= res!109586 (not lt!112665))))

(declare-fun b!223084 () Bool)

(declare-fun e!144928 () Bool)

(declare-fun e!144926 () Bool)

(assert (=> b!223084 (= e!144928 (and e!144926 mapRes!9955))))

(declare-fun condMapEmpty!9955 () Bool)

(declare-fun mapDefault!9955 () ValueCell!2585)

(assert (=> b!223084 (= condMapEmpty!9955 (= (arr!5193 (_values!4177 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2585)) mapDefault!9955)))))

(declare-fun b!223085 () Bool)

(declare-fun res!109583 () Bool)

(assert (=> b!223085 (=> (not res!109583) (not e!144930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223085 (= res!109583 (validKeyInArray!0 key!932))))

(declare-fun b!223086 () Bool)

(declare-fun res!109576 () Bool)

(assert (=> b!223086 (=> (not res!109576) (not e!144919))))

(assert (=> b!223086 (= res!109576 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223087 () Bool)

(declare-fun e!144933 () Bool)

(assert (=> b!223087 (= e!144933 ((_ is Undefined!841) lt!112669))))

(declare-fun b!223088 () Bool)

(declare-fun res!109590 () Bool)

(declare-fun e!144935 () Bool)

(assert (=> b!223088 (=> (not res!109590) (not e!144935))))

(assert (=> b!223088 (= res!109590 (= (select (arr!5194 (_keys!6247 thiss!1504)) (index!5534 lt!112669)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223089 () Bool)

(assert (=> b!223089 (= e!144925 e!144924)))

(declare-fun res!109579 () Bool)

(assert (=> b!223089 (=> (not res!109579) (not e!144924))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223089 (= res!109579 (inRange!0 index!297 (mask!10019 thiss!1504)))))

(declare-fun lt!112667 () Unit!6645)

(assert (=> b!223089 (= lt!112667 e!144929)))

(declare-fun c!37040 () Bool)

(declare-datatypes ((tuple2!4374 0))(
  ( (tuple2!4375 (_1!2198 (_ BitVec 64)) (_2!2198 V!7457)) )
))
(declare-datatypes ((List!3300 0))(
  ( (Nil!3297) (Cons!3296 (h!3944 tuple2!4374) (t!8250 List!3300)) )
))
(declare-datatypes ((ListLongMap!3277 0))(
  ( (ListLongMap!3278 (toList!1654 List!3300)) )
))
(declare-fun contains!1516 (ListLongMap!3277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1163 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 32) Int) ListLongMap!3277)

(assert (=> b!223089 (= c!37040 (contains!1516 (getCurrentListMap!1163 (_keys!6247 thiss!1504) (_values!4177 thiss!1504) (mask!10019 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4194 thiss!1504)) key!932))))

(declare-fun b!223090 () Bool)

(declare-fun res!109593 () Bool)

(assert (=> b!223090 (=> (not res!109593) (not e!144930))))

(assert (=> b!223090 (= res!109593 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5528 (_keys!6247 thiss!1504)))))))

(declare-fun b!223091 () Bool)

(declare-fun res!109581 () Bool)

(assert (=> b!223091 (=> (not res!109581) (not e!144935))))

(declare-fun call!20795 () Bool)

(assert (=> b!223091 (= res!109581 call!20795)))

(assert (=> b!223091 (= e!144922 e!144935)))

(declare-fun bm!20792 () Bool)

(assert (=> bm!20792 (= call!20796 (arrayContainsKey!0 (_keys!6247 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223092 () Bool)

(declare-fun res!109582 () Bool)

(assert (=> b!223092 (=> (not res!109582) (not e!144930))))

(assert (=> b!223092 (= res!109582 (not (contains!1515 Nil!3296 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223093 () Bool)

(assert (=> b!223093 (= e!144930 false)))

(declare-fun lt!112668 () Bool)

(assert (=> b!223093 (= lt!112668 (contains!1515 Nil!3296 key!932))))

(declare-fun b!223094 () Bool)

(assert (=> b!223094 (= e!144933 e!144932)))

(declare-fun res!109589 () Bool)

(assert (=> b!223094 (= res!109589 call!20795)))

(assert (=> b!223094 (=> (not res!109589) (not e!144932))))

(declare-fun e!144931 () Bool)

(declare-fun array_inv!3423 (array!10951) Bool)

(declare-fun array_inv!3424 (array!10949) Bool)

(assert (=> b!223095 (= e!144931 (and tp!21127 tp_is_empty!5857 (array_inv!3423 (_keys!6247 thiss!1504)) (array_inv!3424 (_values!4177 thiss!1504)) e!144928))))

(declare-fun b!223096 () Bool)

(declare-fun res!109580 () Bool)

(assert (=> b!223096 (= res!109580 (= (select (arr!5194 (_keys!6247 thiss!1504)) (index!5537 lt!112669)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223096 (=> (not res!109580) (not e!144932))))

(declare-fun mapIsEmpty!9955 () Bool)

(assert (=> mapIsEmpty!9955 mapRes!9955))

(declare-fun b!223097 () Bool)

(declare-fun Unit!6647 () Unit!6645)

(assert (=> b!223097 (= e!144921 Unit!6647)))

(declare-fun lt!112670 () Unit!6645)

(declare-fun lemmaArrayContainsKeyThenInListMap!67 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) (_ BitVec 32) Int) Unit!6645)

(assert (=> b!223097 (= lt!112670 (lemmaArrayContainsKeyThenInListMap!67 (_keys!6247 thiss!1504) (_values!4177 thiss!1504) (mask!10019 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4194 thiss!1504)))))

(assert (=> b!223097 false))

(declare-fun b!223098 () Bool)

(assert (=> b!223098 (= e!144923 (contains!1515 Nil!3296 key!932))))

(declare-fun res!109585 () Bool)

(assert (=> start!21932 (=> (not res!109585) (not e!144919))))

(declare-fun valid!1252 (LongMapFixedSize!3070) Bool)

(assert (=> start!21932 (= res!109585 (valid!1252 thiss!1504))))

(assert (=> start!21932 e!144919))

(assert (=> start!21932 e!144931))

(assert (=> start!21932 true))

(declare-fun b!223076 () Bool)

(assert (=> b!223076 (= e!144926 tp_is_empty!5857)))

(declare-fun b!223099 () Bool)

(declare-fun c!37042 () Bool)

(assert (=> b!223099 (= c!37042 ((_ is MissingVacant!841) lt!112669))))

(assert (=> b!223099 (= e!144922 e!144933)))

(declare-fun b!223100 () Bool)

(declare-fun res!109577 () Bool)

(assert (=> b!223100 (=> (not res!109577) (not e!144930))))

(assert (=> b!223100 (= res!109577 (not (contains!1515 Nil!3296 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223101 () Bool)

(assert (=> b!223101 (= e!144927 e!144934)))

(declare-fun res!109578 () Bool)

(assert (=> b!223101 (=> (not res!109578) (not e!144934))))

(assert (=> b!223101 (= res!109578 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223102 () Bool)

(declare-fun Unit!6648 () Unit!6645)

(assert (=> b!223102 (= e!144929 Unit!6648)))

(declare-fun lt!112672 () Unit!6645)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!223 (array!10951 array!10949 (_ BitVec 32) (_ BitVec 32) V!7457 V!7457 (_ BitVec 64) Int) Unit!6645)

(assert (=> b!223102 (= lt!112672 (lemmaInListMapThenSeekEntryOrOpenFindsIt!223 (_keys!6247 thiss!1504) (_values!4177 thiss!1504) (mask!10019 thiss!1504) (extraKeys!3931 thiss!1504) (zeroValue!4035 thiss!1504) (minValue!4035 thiss!1504) key!932 (defaultEntry!4194 thiss!1504)))))

(assert (=> b!223102 false))

(declare-fun b!223103 () Bool)

(declare-fun Unit!6649 () Unit!6645)

(assert (=> b!223103 (= e!144921 Unit!6649)))

(declare-fun bm!20793 () Bool)

(assert (=> bm!20793 (= call!20795 (inRange!0 (ite c!37041 (index!5534 lt!112669) (index!5537 lt!112669)) (mask!10019 thiss!1504)))))

(declare-fun b!223104 () Bool)

(assert (=> b!223104 (= e!144935 (not call!20796))))

(declare-fun b!223105 () Bool)

(declare-fun res!109595 () Bool)

(assert (=> b!223105 (=> (not res!109595) (not e!144930))))

(declare-fun noDuplicate!76 (List!3299) Bool)

(assert (=> b!223105 (= res!109595 (noDuplicate!76 Nil!3296))))

(assert (= (and start!21932 res!109585) b!223086))

(assert (= (and b!223086 res!109576) b!223081))

(assert (= (and b!223081 res!109588) b!223089))

(assert (= (and b!223089 c!37040) b!223102))

(assert (= (and b!223089 (not c!37040)) b!223075))

(assert (= (and b!223075 c!37041) b!223091))

(assert (= (and b!223075 (not c!37041)) b!223099))

(assert (= (and b!223091 res!109581) b!223088))

(assert (= (and b!223088 res!109590) b!223104))

(assert (= (and b!223099 c!37042) b!223094))

(assert (= (and b!223099 (not c!37042)) b!223087))

(assert (= (and b!223094 res!109589) b!223096))

(assert (= (and b!223096 res!109580) b!223078))

(assert (= (or b!223091 b!223094) bm!20793))

(assert (= (or b!223104 b!223078) bm!20792))

(assert (= (and b!223089 res!109579) b!223079))

(assert (= (and b!223079 c!37039) b!223097))

(assert (= (and b!223079 (not c!37039)) b!223103))

(assert (= (and b!223079 res!109594) b!223105))

(assert (= (and b!223105 res!109595) b!223092))

(assert (= (and b!223092 res!109582) b!223100))

(assert (= (and b!223100 res!109577) b!223082))

(assert (= (and b!223082 res!109584) b!223098))

(assert (= (and b!223082 (not res!109592)) b!223101))

(assert (= (and b!223101 res!109578) b!223074))

(assert (= (and b!223082 res!109591) b!223080))

(assert (= (and b!223080 res!109587) b!223090))

(assert (= (and b!223090 res!109593) b!223085))

(assert (= (and b!223085 res!109583) b!223083))

(assert (= (and b!223083 res!109586) b!223093))

(assert (= (and b!223084 condMapEmpty!9955) mapIsEmpty!9955))

(assert (= (and b!223084 (not condMapEmpty!9955)) mapNonEmpty!9955))

(assert (= (and mapNonEmpty!9955 ((_ is ValueCellFull!2585) mapValue!9955)) b!223077))

(assert (= (and b!223084 ((_ is ValueCellFull!2585) mapDefault!9955)) b!223076))

(assert (= b!223095 b!223084))

(assert (= start!21932 b!223095))

(declare-fun m!246295 () Bool)

(assert (=> bm!20793 m!246295))

(declare-fun m!246297 () Bool)

(assert (=> start!21932 m!246297))

(declare-fun m!246299 () Bool)

(assert (=> b!223102 m!246299))

(declare-fun m!246301 () Bool)

(assert (=> b!223096 m!246301))

(declare-fun m!246303 () Bool)

(assert (=> b!223081 m!246303))

(declare-fun m!246305 () Bool)

(assert (=> mapNonEmpty!9955 m!246305))

(declare-fun m!246307 () Bool)

(assert (=> b!223079 m!246307))

(declare-fun m!246309 () Bool)

(assert (=> b!223074 m!246309))

(assert (=> b!223098 m!246309))

(declare-fun m!246311 () Bool)

(assert (=> b!223100 m!246311))

(declare-fun m!246313 () Bool)

(assert (=> b!223105 m!246313))

(declare-fun m!246315 () Bool)

(assert (=> b!223095 m!246315))

(declare-fun m!246317 () Bool)

(assert (=> b!223095 m!246317))

(assert (=> b!223093 m!246309))

(declare-fun m!246319 () Bool)

(assert (=> b!223092 m!246319))

(declare-fun m!246321 () Bool)

(assert (=> b!223088 m!246321))

(declare-fun m!246323 () Bool)

(assert (=> b!223075 m!246323))

(declare-fun m!246325 () Bool)

(assert (=> b!223085 m!246325))

(declare-fun m!246327 () Bool)

(assert (=> b!223080 m!246327))

(declare-fun m!246329 () Bool)

(assert (=> b!223097 m!246329))

(assert (=> bm!20792 m!246307))

(declare-fun m!246331 () Bool)

(assert (=> b!223089 m!246331))

(declare-fun m!246333 () Bool)

(assert (=> b!223089 m!246333))

(assert (=> b!223089 m!246333))

(declare-fun m!246335 () Bool)

(assert (=> b!223089 m!246335))

(check-sat (not b!223080) (not bm!20793) (not b!223092) (not b!223093) (not mapNonEmpty!9955) (not b!223089) (not b!223097) b_and!12867 (not b!223079) (not b!223085) (not b!223098) (not b!223100) (not start!21932) (not b!223102) (not b!223081) (not b!223095) (not b!223075) (not b_next!5995) (not bm!20792) tp_is_empty!5857 (not b!223105) (not b!223074))
(check-sat b_and!12867 (not b_next!5995))
