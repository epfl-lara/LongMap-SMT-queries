; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75854 () Bool)

(assert start!75854)

(declare-fun b!892632 () Bool)

(declare-fun b_free!15825 () Bool)

(declare-fun b_next!15825 () Bool)

(assert (=> b!892632 (= b_free!15825 (not b_next!15825))))

(declare-fun tp!55443 () Bool)

(declare-fun b_and!26073 () Bool)

(assert (=> b!892632 (= tp!55443 b_and!26073)))

(declare-fun b!892627 () Bool)

(declare-fun e!498342 () Bool)

(declare-fun e!498341 () Bool)

(assert (=> b!892627 (= e!498342 (not e!498341))))

(declare-fun res!604707 () Bool)

(assert (=> b!892627 (=> res!604707 e!498341)))

(declare-datatypes ((SeekEntryResult!8852 0))(
  ( (MissingZero!8852 (index!37779 (_ BitVec 32))) (Found!8852 (index!37780 (_ BitVec 32))) (Intermediate!8852 (undefined!9664 Bool) (index!37781 (_ BitVec 32)) (x!75870 (_ BitVec 32))) (Undefined!8852) (MissingVacant!8852 (index!37782 (_ BitVec 32))) )
))
(declare-fun lt!403271 () SeekEntryResult!8852)

(get-info :version)

(assert (=> b!892627 (= res!604707 (not ((_ is Found!8852) lt!403271)))))

(declare-fun e!498347 () Bool)

(assert (=> b!892627 e!498347))

(declare-fun res!604705 () Bool)

(assert (=> b!892627 (=> res!604705 e!498347)))

(assert (=> b!892627 (= res!604705 (not ((_ is Found!8852) lt!403271)))))

(declare-datatypes ((Unit!30398 0))(
  ( (Unit!30399) )
))
(declare-fun lt!403276 () Unit!30398)

(declare-datatypes ((array!52286 0))(
  ( (array!52287 (arr!25149 (Array (_ BitVec 32) (_ BitVec 64))) (size!25593 (_ BitVec 32))) )
))
(declare-datatypes ((V!29169 0))(
  ( (V!29170 (val!9127 Int)) )
))
(declare-datatypes ((ValueCell!8595 0))(
  ( (ValueCellFull!8595 (v!11605 V!29169)) (EmptyCell!8595) )
))
(declare-datatypes ((array!52288 0))(
  ( (array!52289 (arr!25150 (Array (_ BitVec 32) ValueCell!8595)) (size!25594 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4206 0))(
  ( (LongMapFixedSize!4207 (defaultEntry!5300 Int) (mask!25815 (_ BitVec 32)) (extraKeys!4994 (_ BitVec 32)) (zeroValue!5098 V!29169) (minValue!5098 V!29169) (_size!2158 (_ BitVec 32)) (_keys!9983 array!52286) (_values!5285 array!52288) (_vacant!2158 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4206)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!51 (array!52286 array!52288 (_ BitVec 32) (_ BitVec 32) V!29169 V!29169 (_ BitVec 64)) Unit!30398)

(assert (=> b!892627 (= lt!403276 (lemmaSeekEntryGivesInRangeIndex!51 (_keys!9983 thiss!1181) (_values!5285 thiss!1181) (mask!25815 thiss!1181) (extraKeys!4994 thiss!1181) (zeroValue!5098 thiss!1181) (minValue!5098 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52286 (_ BitVec 32)) SeekEntryResult!8852)

(assert (=> b!892627 (= lt!403271 (seekEntry!0 key!785 (_keys!9983 thiss!1181) (mask!25815 thiss!1181)))))

(declare-fun b!892628 () Bool)

(declare-fun e!498337 () Bool)

(declare-fun tp_is_empty!18153 () Bool)

(assert (=> b!892628 (= e!498337 tp_is_empty!18153)))

(declare-fun mapIsEmpty!28784 () Bool)

(declare-fun mapRes!28784 () Bool)

(assert (=> mapIsEmpty!28784 mapRes!28784))

(declare-fun b!892630 () Bool)

(declare-fun e!498340 () Bool)

(declare-fun call!39540 () V!29169)

(assert (=> b!892630 (= e!498340 (= call!39540 (minValue!5098 thiss!1181)))))

(declare-fun mapNonEmpty!28784 () Bool)

(declare-fun tp!55444 () Bool)

(declare-fun e!498343 () Bool)

(assert (=> mapNonEmpty!28784 (= mapRes!28784 (and tp!55444 e!498343))))

(declare-fun mapRest!28784 () (Array (_ BitVec 32) ValueCell!8595))

(declare-fun mapKey!28784 () (_ BitVec 32))

(declare-fun mapValue!28784 () ValueCell!8595)

(assert (=> mapNonEmpty!28784 (= (arr!25150 (_values!5285 thiss!1181)) (store mapRest!28784 mapKey!28784 mapValue!28784))))

(declare-fun b!892631 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892631 (= e!498347 (inRange!0 (index!37780 lt!403271) (mask!25815 thiss!1181)))))

(declare-fun bm!39536 () Bool)

(declare-fun call!39539 () V!29169)

(declare-datatypes ((tuple2!12004 0))(
  ( (tuple2!12005 (_1!6013 (_ BitVec 64)) (_2!6013 V!29169)) )
))
(declare-datatypes ((List!17789 0))(
  ( (Nil!17786) (Cons!17785 (h!18916 tuple2!12004) (t!25098 List!17789)) )
))
(declare-datatypes ((ListLongMap!10701 0))(
  ( (ListLongMap!10702 (toList!5366 List!17789)) )
))
(declare-fun lt!403275 () ListLongMap!10701)

(declare-fun apply!404 (ListLongMap!10701 (_ BitVec 64)) V!29169)

(assert (=> bm!39536 (= call!39539 (apply!404 lt!403275 key!785))))

(declare-fun e!498338 () Bool)

(declare-fun e!498339 () Bool)

(declare-fun array_inv!19752 (array!52286) Bool)

(declare-fun array_inv!19753 (array!52288) Bool)

(assert (=> b!892632 (= e!498339 (and tp!55443 tp_is_empty!18153 (array_inv!19752 (_keys!9983 thiss!1181)) (array_inv!19753 (_values!5285 thiss!1181)) e!498338))))

(declare-fun b!892633 () Bool)

(declare-fun e!498345 () Bool)

(assert (=> b!892633 (= e!498345 (= call!39539 (zeroValue!5098 thiss!1181)))))

(declare-fun b!892634 () Bool)

(declare-fun res!604709 () Bool)

(assert (=> b!892634 (=> (not res!604709) (not e!498342))))

(assert (=> b!892634 (= res!604709 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892635 () Bool)

(assert (=> b!892635 (= e!498338 (and e!498337 mapRes!28784))))

(declare-fun condMapEmpty!28784 () Bool)

(declare-fun mapDefault!28784 () ValueCell!8595)

(assert (=> b!892635 (= condMapEmpty!28784 (= (arr!25150 (_values!5285 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8595)) mapDefault!28784)))))

(declare-fun b!892636 () Bool)

(assert (=> b!892636 (= e!498343 tp_is_empty!18153)))

(declare-fun b!892637 () Bool)

(declare-fun e!498348 () Bool)

(declare-fun get!13238 (ValueCell!8595 V!29169) V!29169)

(declare-fun dynLambda!1294 (Int (_ BitVec 64)) V!29169)

(assert (=> b!892637 (= e!498348 (= call!39540 (get!13238 (select (arr!25150 (_values!5285 thiss!1181)) (index!37780 lt!403271)) (dynLambda!1294 (defaultEntry!5300 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!892638 () Bool)

(declare-fun res!604708 () Bool)

(assert (=> b!892638 (=> (not res!604708) (not e!498340))))

(assert (=> b!892638 (= res!604708 (not (= (bvand (extraKeys!4994 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892638 (= e!498348 e!498340)))

(declare-fun b!892629 () Bool)

(declare-fun e!498346 () Bool)

(assert (=> b!892629 (= e!498346 e!498345)))

(declare-fun res!604704 () Bool)

(assert (=> b!892629 (= res!604704 (not (= (bvand (extraKeys!4994 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892629 (=> (not res!604704) (not e!498345))))

(declare-fun res!604706 () Bool)

(assert (=> start!75854 (=> (not res!604706) (not e!498342))))

(declare-fun valid!1627 (LongMapFixedSize!4206) Bool)

(assert (=> start!75854 (= res!604706 (valid!1627 thiss!1181))))

(assert (=> start!75854 e!498342))

(assert (=> start!75854 e!498339))

(assert (=> start!75854 true))

(declare-fun b!892639 () Bool)

(assert (=> b!892639 (= e!498341 true)))

(declare-fun lt!403273 () Bool)

(declare-fun contains!4369 (LongMapFixedSize!4206 (_ BitVec 64)) Bool)

(assert (=> b!892639 (= lt!403273 (contains!4369 thiss!1181 key!785))))

(assert (=> b!892639 e!498346))

(declare-fun c!93975 () Bool)

(assert (=> b!892639 (= c!93975 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403272 () Unit!30398)

(declare-fun lemmaKeyInListMapThenSameValueInArray!7 (array!52286 array!52288 (_ BitVec 32) (_ BitVec 32) V!29169 V!29169 (_ BitVec 64) (_ BitVec 32) Int) Unit!30398)

(assert (=> b!892639 (= lt!403272 (lemmaKeyInListMapThenSameValueInArray!7 (_keys!9983 thiss!1181) (_values!5285 thiss!1181) (mask!25815 thiss!1181) (extraKeys!4994 thiss!1181) (zeroValue!5098 thiss!1181) (minValue!5098 thiss!1181) key!785 (index!37780 lt!403271) (defaultEntry!5300 thiss!1181)))))

(declare-fun contains!4370 (ListLongMap!10701 (_ BitVec 64)) Bool)

(assert (=> b!892639 (contains!4370 lt!403275 (select (arr!25149 (_keys!9983 thiss!1181)) (index!37780 lt!403271)))))

(declare-fun getCurrentListMap!2646 (array!52286 array!52288 (_ BitVec 32) (_ BitVec 32) V!29169 V!29169 (_ BitVec 32) Int) ListLongMap!10701)

(assert (=> b!892639 (= lt!403275 (getCurrentListMap!2646 (_keys!9983 thiss!1181) (_values!5285 thiss!1181) (mask!25815 thiss!1181) (extraKeys!4994 thiss!1181) (zeroValue!5098 thiss!1181) (minValue!5098 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5300 thiss!1181)))))

(declare-fun lt!403270 () Unit!30398)

(declare-fun lemmaValidKeyInArrayIsInListMap!235 (array!52286 array!52288 (_ BitVec 32) (_ BitVec 32) V!29169 V!29169 (_ BitVec 32) Int) Unit!30398)

(assert (=> b!892639 (= lt!403270 (lemmaValidKeyInArrayIsInListMap!235 (_keys!9983 thiss!1181) (_values!5285 thiss!1181) (mask!25815 thiss!1181) (extraKeys!4994 thiss!1181) (zeroValue!5098 thiss!1181) (minValue!5098 thiss!1181) (index!37780 lt!403271) (defaultEntry!5300 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892639 (arrayContainsKey!0 (_keys!9983 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403274 () Unit!30398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52286 (_ BitVec 64) (_ BitVec 32)) Unit!30398)

(assert (=> b!892639 (= lt!403274 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9983 thiss!1181) key!785 (index!37780 lt!403271)))))

(declare-fun bm!39537 () Bool)

(assert (=> bm!39537 (= call!39540 call!39539)))

(declare-fun b!892640 () Bool)

(assert (=> b!892640 (= e!498346 e!498348)))

(declare-fun c!93974 () Bool)

(assert (=> b!892640 (= c!93974 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!75854 res!604706) b!892634))

(assert (= (and b!892634 res!604709) b!892627))

(assert (= (and b!892627 (not res!604705)) b!892631))

(assert (= (and b!892627 (not res!604707)) b!892639))

(assert (= (and b!892639 c!93975) b!892629))

(assert (= (and b!892639 (not c!93975)) b!892640))

(assert (= (and b!892629 res!604704) b!892633))

(assert (= (and b!892640 c!93974) b!892638))

(assert (= (and b!892640 (not c!93974)) b!892637))

(assert (= (and b!892638 res!604708) b!892630))

(assert (= (or b!892630 b!892637) bm!39537))

(assert (= (or b!892633 bm!39537) bm!39536))

(assert (= (and b!892635 condMapEmpty!28784) mapIsEmpty!28784))

(assert (= (and b!892635 (not condMapEmpty!28784)) mapNonEmpty!28784))

(assert (= (and mapNonEmpty!28784 ((_ is ValueCellFull!8595) mapValue!28784)) b!892636))

(assert (= (and b!892635 ((_ is ValueCellFull!8595) mapDefault!28784)) b!892628))

(assert (= b!892632 b!892635))

(assert (= start!75854 b!892632))

(declare-fun b_lambda!12891 () Bool)

(assert (=> (not b_lambda!12891) (not b!892637)))

(declare-fun t!25097 () Bool)

(declare-fun tb!5159 () Bool)

(assert (=> (and b!892632 (= (defaultEntry!5300 thiss!1181) (defaultEntry!5300 thiss!1181)) t!25097) tb!5159))

(declare-fun result!10029 () Bool)

(assert (=> tb!5159 (= result!10029 tp_is_empty!18153)))

(assert (=> b!892637 t!25097))

(declare-fun b_and!26075 () Bool)

(assert (= b_and!26073 (and (=> t!25097 result!10029) b_and!26075)))

(declare-fun m!830849 () Bool)

(assert (=> b!892637 m!830849))

(declare-fun m!830851 () Bool)

(assert (=> b!892637 m!830851))

(assert (=> b!892637 m!830849))

(assert (=> b!892637 m!830851))

(declare-fun m!830853 () Bool)

(assert (=> b!892637 m!830853))

(declare-fun m!830855 () Bool)

(assert (=> b!892631 m!830855))

(declare-fun m!830857 () Bool)

(assert (=> b!892632 m!830857))

(declare-fun m!830859 () Bool)

(assert (=> b!892632 m!830859))

(declare-fun m!830861 () Bool)

(assert (=> mapNonEmpty!28784 m!830861))

(declare-fun m!830863 () Bool)

(assert (=> b!892639 m!830863))

(declare-fun m!830865 () Bool)

(assert (=> b!892639 m!830865))

(declare-fun m!830867 () Bool)

(assert (=> b!892639 m!830867))

(declare-fun m!830869 () Bool)

(assert (=> b!892639 m!830869))

(declare-fun m!830871 () Bool)

(assert (=> b!892639 m!830871))

(assert (=> b!892639 m!830869))

(declare-fun m!830873 () Bool)

(assert (=> b!892639 m!830873))

(declare-fun m!830875 () Bool)

(assert (=> b!892639 m!830875))

(declare-fun m!830877 () Bool)

(assert (=> b!892639 m!830877))

(declare-fun m!830879 () Bool)

(assert (=> bm!39536 m!830879))

(declare-fun m!830881 () Bool)

(assert (=> b!892627 m!830881))

(declare-fun m!830883 () Bool)

(assert (=> b!892627 m!830883))

(declare-fun m!830885 () Bool)

(assert (=> start!75854 m!830885))

(check-sat (not b_next!15825) (not b!892632) (not mapNonEmpty!28784) (not b!892631) (not b_lambda!12891) tp_is_empty!18153 b_and!26075 (not b!892639) (not b!892637) (not start!75854) (not b!892627) (not bm!39536))
(check-sat b_and!26075 (not b_next!15825))
