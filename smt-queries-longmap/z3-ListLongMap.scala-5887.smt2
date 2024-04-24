; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76020 () Bool)

(assert start!76020)

(declare-fun b!893490 () Bool)

(declare-fun b_free!15823 () Bool)

(declare-fun b_next!15823 () Bool)

(assert (=> b!893490 (= b_free!15823 (not b_next!15823))))

(declare-fun tp!55439 () Bool)

(declare-fun b_and!26079 () Bool)

(assert (=> b!893490 (= tp!55439 b_and!26079)))

(declare-datatypes ((array!52321 0))(
  ( (array!52322 (arr!25162 (Array (_ BitVec 32) (_ BitVec 64))) (size!25607 (_ BitVec 32))) )
))
(declare-datatypes ((V!29167 0))(
  ( (V!29168 (val!9126 Int)) )
))
(declare-datatypes ((ValueCell!8594 0))(
  ( (ValueCellFull!8594 (v!11601 V!29167)) (EmptyCell!8594) )
))
(declare-datatypes ((array!52323 0))(
  ( (array!52324 (arr!25163 (Array (_ BitVec 32) ValueCell!8594)) (size!25608 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4204 0))(
  ( (LongMapFixedSize!4205 (defaultEntry!5299 Int) (mask!25857 (_ BitVec 32)) (extraKeys!4993 (_ BitVec 32)) (zeroValue!5097 V!29167) (minValue!5097 V!29167) (_size!2157 (_ BitVec 32)) (_keys!10010 array!52321) (_values!5284 array!52323) (_vacant!2157 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4204)

(declare-fun call!39579 () V!29167)

(declare-fun e!498888 () Bool)

(declare-datatypes ((SeekEntryResult!8808 0))(
  ( (MissingZero!8808 (index!37603 (_ BitVec 32))) (Found!8808 (index!37604 (_ BitVec 32))) (Intermediate!8808 (undefined!9620 Bool) (index!37605 (_ BitVec 32)) (x!75838 (_ BitVec 32))) (Undefined!8808) (MissingVacant!8808 (index!37606 (_ BitVec 32))) )
))
(declare-fun lt!403611 () SeekEntryResult!8808)

(declare-fun b!893486 () Bool)

(declare-fun get!13258 (ValueCell!8594 V!29167) V!29167)

(declare-fun dynLambda!1309 (Int (_ BitVec 64)) V!29167)

(assert (=> b!893486 (= e!498888 (= call!39579 (get!13258 (select (arr!25163 (_values!5284 thiss!1181)) (index!37604 lt!403611)) (dynLambda!1309 (defaultEntry!5299 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!28781 () Bool)

(declare-fun mapRes!28781 () Bool)

(assert (=> mapIsEmpty!28781 mapRes!28781))

(declare-fun b!893487 () Bool)

(declare-fun e!498892 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893487 (= e!498892 (inRange!0 (index!37604 lt!403611) (mask!25857 thiss!1181)))))

(declare-fun b!893488 () Bool)

(declare-fun e!498887 () Bool)

(assert (=> b!893488 (= e!498887 e!498888)))

(declare-fun c!94250 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!893488 (= c!94250 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893489 () Bool)

(declare-fun e!498891 () Bool)

(declare-fun e!498884 () Bool)

(assert (=> b!893489 (= e!498891 (not e!498884))))

(declare-fun res!605032 () Bool)

(assert (=> b!893489 (=> res!605032 e!498884)))

(get-info :version)

(assert (=> b!893489 (= res!605032 (not ((_ is Found!8808) lt!403611)))))

(assert (=> b!893489 e!498892))

(declare-fun res!605035 () Bool)

(assert (=> b!893489 (=> res!605035 e!498892)))

(assert (=> b!893489 (= res!605035 (not ((_ is Found!8808) lt!403611)))))

(declare-datatypes ((Unit!30384 0))(
  ( (Unit!30385) )
))
(declare-fun lt!403615 () Unit!30384)

(declare-fun lemmaSeekEntryGivesInRangeIndex!58 (array!52321 array!52323 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 64)) Unit!30384)

(assert (=> b!893489 (= lt!403615 (lemmaSeekEntryGivesInRangeIndex!58 (_keys!10010 thiss!1181) (_values!5284 thiss!1181) (mask!25857 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52321 (_ BitVec 32)) SeekEntryResult!8808)

(assert (=> b!893489 (= lt!403611 (seekEntry!0 key!785 (_keys!10010 thiss!1181) (mask!25857 thiss!1181)))))

(declare-fun res!605030 () Bool)

(assert (=> start!76020 (=> (not res!605030) (not e!498891))))

(declare-fun valid!1637 (LongMapFixedSize!4204) Bool)

(assert (=> start!76020 (= res!605030 (valid!1637 thiss!1181))))

(assert (=> start!76020 e!498891))

(declare-fun e!498883 () Bool)

(assert (=> start!76020 e!498883))

(assert (=> start!76020 true))

(declare-fun tp_is_empty!18151 () Bool)

(declare-fun e!498894 () Bool)

(declare-fun array_inv!19814 (array!52321) Bool)

(declare-fun array_inv!19815 (array!52323) Bool)

(assert (=> b!893490 (= e!498883 (and tp!55439 tp_is_empty!18151 (array_inv!19814 (_keys!10010 thiss!1181)) (array_inv!19815 (_values!5284 thiss!1181)) e!498894))))

(declare-fun b!893491 () Bool)

(declare-fun e!498885 () Bool)

(declare-fun call!39578 () V!29167)

(assert (=> b!893491 (= e!498885 (= call!39578 (zeroValue!5097 thiss!1181)))))

(declare-fun b!893492 () Bool)

(declare-fun res!605034 () Bool)

(assert (=> b!893492 (=> (not res!605034) (not e!498891))))

(assert (=> b!893492 (= res!605034 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893493 () Bool)

(declare-fun e!498893 () Bool)

(assert (=> b!893493 (= e!498894 (and e!498893 mapRes!28781))))

(declare-fun condMapEmpty!28781 () Bool)

(declare-fun mapDefault!28781 () ValueCell!8594)

(assert (=> b!893493 (= condMapEmpty!28781 (= (arr!25163 (_values!5284 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8594)) mapDefault!28781)))))

(declare-fun mapNonEmpty!28781 () Bool)

(declare-fun tp!55438 () Bool)

(declare-fun e!498889 () Bool)

(assert (=> mapNonEmpty!28781 (= mapRes!28781 (and tp!55438 e!498889))))

(declare-fun mapRest!28781 () (Array (_ BitVec 32) ValueCell!8594))

(declare-fun mapKey!28781 () (_ BitVec 32))

(declare-fun mapValue!28781 () ValueCell!8594)

(assert (=> mapNonEmpty!28781 (= (arr!25163 (_values!5284 thiss!1181)) (store mapRest!28781 mapKey!28781 mapValue!28781))))

(declare-fun bm!39575 () Bool)

(assert (=> bm!39575 (= call!39579 call!39578)))

(declare-fun b!893494 () Bool)

(assert (=> b!893494 (= e!498887 e!498885)))

(declare-fun res!605033 () Bool)

(assert (=> b!893494 (= res!605033 (not (= (bvand (extraKeys!4993 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893494 (=> (not res!605033) (not e!498885))))

(declare-fun b!893495 () Bool)

(declare-fun res!605031 () Bool)

(declare-fun e!498890 () Bool)

(assert (=> b!893495 (=> (not res!605031) (not e!498890))))

(assert (=> b!893495 (= res!605031 (not (= (bvand (extraKeys!4993 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!893495 (= e!498888 e!498890)))

(declare-fun bm!39576 () Bool)

(declare-datatypes ((tuple2!11920 0))(
  ( (tuple2!11921 (_1!5971 (_ BitVec 64)) (_2!5971 V!29167)) )
))
(declare-datatypes ((List!17741 0))(
  ( (Nil!17738) (Cons!17737 (h!18874 tuple2!11920) (t!25040 List!17741)) )
))
(declare-datatypes ((ListLongMap!10619 0))(
  ( (ListLongMap!10620 (toList!5325 List!17741)) )
))
(declare-fun lt!403616 () ListLongMap!10619)

(declare-fun apply!400 (ListLongMap!10619 (_ BitVec 64)) V!29167)

(assert (=> bm!39576 (= call!39578 (apply!400 lt!403616 key!785))))

(declare-fun b!893496 () Bool)

(assert (=> b!893496 (= e!498889 tp_is_empty!18151)))

(declare-fun b!893497 () Bool)

(assert (=> b!893497 (= e!498884 true)))

(declare-fun lt!403614 () Bool)

(declare-fun contains!4338 (LongMapFixedSize!4204 (_ BitVec 64)) Bool)

(assert (=> b!893497 (= lt!403614 (contains!4338 thiss!1181 key!785))))

(assert (=> b!893497 e!498887))

(declare-fun c!94251 () Bool)

(assert (=> b!893497 (= c!94251 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403610 () Unit!30384)

(declare-fun lemmaKeyInListMapThenSameValueInArray!6 (array!52321 array!52323 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 64) (_ BitVec 32) Int) Unit!30384)

(assert (=> b!893497 (= lt!403610 (lemmaKeyInListMapThenSameValueInArray!6 (_keys!10010 thiss!1181) (_values!5284 thiss!1181) (mask!25857 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) key!785 (index!37604 lt!403611) (defaultEntry!5299 thiss!1181)))))

(declare-fun contains!4339 (ListLongMap!10619 (_ BitVec 64)) Bool)

(assert (=> b!893497 (contains!4339 lt!403616 (select (arr!25162 (_keys!10010 thiss!1181)) (index!37604 lt!403611)))))

(declare-fun getCurrentListMap!2602 (array!52321 array!52323 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 32) Int) ListLongMap!10619)

(assert (=> b!893497 (= lt!403616 (getCurrentListMap!2602 (_keys!10010 thiss!1181) (_values!5284 thiss!1181) (mask!25857 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5299 thiss!1181)))))

(declare-fun lt!403613 () Unit!30384)

(declare-fun lemmaValidKeyInArrayIsInListMap!232 (array!52321 array!52323 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 32) Int) Unit!30384)

(assert (=> b!893497 (= lt!403613 (lemmaValidKeyInArrayIsInListMap!232 (_keys!10010 thiss!1181) (_values!5284 thiss!1181) (mask!25857 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) (index!37604 lt!403611) (defaultEntry!5299 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!893497 (arrayContainsKey!0 (_keys!10010 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403612 () Unit!30384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52321 (_ BitVec 64) (_ BitVec 32)) Unit!30384)

(assert (=> b!893497 (= lt!403612 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10010 thiss!1181) key!785 (index!37604 lt!403611)))))

(declare-fun b!893498 () Bool)

(assert (=> b!893498 (= e!498890 (= call!39579 (minValue!5097 thiss!1181)))))

(declare-fun b!893499 () Bool)

(assert (=> b!893499 (= e!498893 tp_is_empty!18151)))

(assert (= (and start!76020 res!605030) b!893492))

(assert (= (and b!893492 res!605034) b!893489))

(assert (= (and b!893489 (not res!605035)) b!893487))

(assert (= (and b!893489 (not res!605032)) b!893497))

(assert (= (and b!893497 c!94251) b!893494))

(assert (= (and b!893497 (not c!94251)) b!893488))

(assert (= (and b!893494 res!605033) b!893491))

(assert (= (and b!893488 c!94250) b!893495))

(assert (= (and b!893488 (not c!94250)) b!893486))

(assert (= (and b!893495 res!605031) b!893498))

(assert (= (or b!893498 b!893486) bm!39575))

(assert (= (or b!893491 bm!39575) bm!39576))

(assert (= (and b!893493 condMapEmpty!28781) mapIsEmpty!28781))

(assert (= (and b!893493 (not condMapEmpty!28781)) mapNonEmpty!28781))

(assert (= (and mapNonEmpty!28781 ((_ is ValueCellFull!8594) mapValue!28781)) b!893496))

(assert (= (and b!893493 ((_ is ValueCellFull!8594) mapDefault!28781)) b!893499))

(assert (= b!893490 b!893493))

(assert (= start!76020 b!893490))

(declare-fun b_lambda!12903 () Bool)

(assert (=> (not b_lambda!12903) (not b!893486)))

(declare-fun t!25039 () Bool)

(declare-fun tb!5149 () Bool)

(assert (=> (and b!893490 (= (defaultEntry!5299 thiss!1181) (defaultEntry!5299 thiss!1181)) t!25039) tb!5149))

(declare-fun result!10017 () Bool)

(assert (=> tb!5149 (= result!10017 tp_is_empty!18151)))

(assert (=> b!893486 t!25039))

(declare-fun b_and!26081 () Bool)

(assert (= b_and!26079 (and (=> t!25039 result!10017) b_and!26081)))

(declare-fun m!832105 () Bool)

(assert (=> b!893486 m!832105))

(declare-fun m!832107 () Bool)

(assert (=> b!893486 m!832107))

(assert (=> b!893486 m!832105))

(assert (=> b!893486 m!832107))

(declare-fun m!832109 () Bool)

(assert (=> b!893486 m!832109))

(declare-fun m!832111 () Bool)

(assert (=> b!893497 m!832111))

(declare-fun m!832113 () Bool)

(assert (=> b!893497 m!832113))

(declare-fun m!832115 () Bool)

(assert (=> b!893497 m!832115))

(declare-fun m!832117 () Bool)

(assert (=> b!893497 m!832117))

(declare-fun m!832119 () Bool)

(assert (=> b!893497 m!832119))

(declare-fun m!832121 () Bool)

(assert (=> b!893497 m!832121))

(assert (=> b!893497 m!832115))

(declare-fun m!832123 () Bool)

(assert (=> b!893497 m!832123))

(declare-fun m!832125 () Bool)

(assert (=> b!893497 m!832125))

(declare-fun m!832127 () Bool)

(assert (=> bm!39576 m!832127))

(declare-fun m!832129 () Bool)

(assert (=> b!893490 m!832129))

(declare-fun m!832131 () Bool)

(assert (=> b!893490 m!832131))

(declare-fun m!832133 () Bool)

(assert (=> mapNonEmpty!28781 m!832133))

(declare-fun m!832135 () Bool)

(assert (=> b!893489 m!832135))

(declare-fun m!832137 () Bool)

(assert (=> b!893489 m!832137))

(declare-fun m!832139 () Bool)

(assert (=> start!76020 m!832139))

(declare-fun m!832141 () Bool)

(assert (=> b!893487 m!832141))

(check-sat tp_is_empty!18151 (not b_lambda!12903) (not b!893486) (not b!893490) (not bm!39576) (not b!893489) (not b!893487) (not start!76020) b_and!26081 (not mapNonEmpty!28781) (not b_next!15823) (not b!893497))
(check-sat b_and!26081 (not b_next!15823))
