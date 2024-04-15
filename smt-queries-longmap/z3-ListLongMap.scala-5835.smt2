; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75294 () Bool)

(assert start!75294)

(declare-fun b!886966 () Bool)

(declare-fun b_free!15511 () Bool)

(declare-fun b_next!15511 () Bool)

(assert (=> b!886966 (= b_free!15511 (not b_next!15511))))

(declare-fun tp!54467 () Bool)

(declare-fun b_and!25691 () Bool)

(assert (=> b!886966 (= tp!54467 b_and!25691)))

(declare-fun res!601967 () Bool)

(declare-fun e!493891 () Bool)

(assert (=> start!75294 (=> (not res!601967) (not e!493891))))

(declare-datatypes ((V!28751 0))(
  ( (V!28752 (val!8970 Int)) )
))
(declare-datatypes ((ValueCell!8438 0))(
  ( (ValueCellFull!8438 (v!11414 V!28751)) (EmptyCell!8438) )
))
(declare-datatypes ((array!51621 0))(
  ( (array!51622 (arr!24827 (Array (_ BitVec 32) ValueCell!8438)) (size!25269 (_ BitVec 32))) )
))
(declare-datatypes ((array!51623 0))(
  ( (array!51624 (arr!24828 (Array (_ BitVec 32) (_ BitVec 64))) (size!25270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3892 0))(
  ( (LongMapFixedSize!3893 (defaultEntry!5134 Int) (mask!25522 (_ BitVec 32)) (extraKeys!4827 (_ BitVec 32)) (zeroValue!4931 V!28751) (minValue!4931 V!28751) (_size!2001 (_ BitVec 32)) (_keys!9804 array!51623) (_values!5118 array!51621) (_vacant!2001 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1044 0))(
  ( (Cell!1045 (v!11415 LongMapFixedSize!3892)) )
))
(declare-datatypes ((LongMap!1044 0))(
  ( (LongMap!1045 (underlying!533 Cell!1044)) )
))
(declare-fun thiss!833 () LongMap!1044)

(declare-fun valid!1523 (LongMap!1044) Bool)

(assert (=> start!75294 (= res!601967 (valid!1523 thiss!833))))

(assert (=> start!75294 e!493891))

(declare-fun e!493889 () Bool)

(assert (=> start!75294 e!493889))

(assert (=> start!75294 true))

(declare-fun mapIsEmpty!28278 () Bool)

(declare-fun mapRes!28278 () Bool)

(assert (=> mapIsEmpty!28278 mapRes!28278))

(declare-fun b!886962 () Bool)

(declare-fun e!493893 () Bool)

(declare-fun tp_is_empty!17839 () Bool)

(assert (=> b!886962 (= e!493893 tp_is_empty!17839)))

(declare-fun b!886963 () Bool)

(declare-fun e!493888 () Bool)

(declare-fun key!673 () (_ BitVec 64))

(declare-datatypes ((Option!436 0))(
  ( (Some!435 (v!11416 V!28751)) (None!434) )
))
(declare-fun isDefined!313 (Option!436) Bool)

(declare-datatypes ((tuple2!11936 0))(
  ( (tuple2!11937 (_1!5979 (_ BitVec 64)) (_2!5979 V!28751)) )
))
(declare-datatypes ((List!17686 0))(
  ( (Nil!17683) (Cons!17682 (h!18813 tuple2!11936) (t!24960 List!17686)) )
))
(declare-fun getValueByKey!430 (List!17686 (_ BitVec 64)) Option!436)

(declare-datatypes ((ListLongMap!10623 0))(
  ( (ListLongMap!10624 (toList!5327 List!17686)) )
))
(declare-fun map!12062 (LongMap!1044) ListLongMap!10623)

(assert (=> b!886963 (= e!493888 (not (isDefined!313 (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673))))))

(declare-fun b!886964 () Bool)

(declare-fun e!493892 () Bool)

(declare-fun e!493894 () Bool)

(assert (=> b!886964 (= e!493892 e!493894)))

(declare-fun b!886965 () Bool)

(declare-fun e!493887 () Bool)

(assert (=> b!886965 (= e!493887 tp_is_empty!17839)))

(declare-fun e!493890 () Bool)

(declare-fun array_inv!19592 (array!51623) Bool)

(declare-fun array_inv!19593 (array!51621) Bool)

(assert (=> b!886966 (= e!493894 (and tp!54467 tp_is_empty!17839 (array_inv!19592 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (array_inv!19593 (_values!5118 (v!11415 (underlying!533 thiss!833)))) e!493890))))

(declare-fun b!886967 () Bool)

(assert (=> b!886967 (= e!493889 e!493892)))

(declare-fun mapNonEmpty!28278 () Bool)

(declare-fun tp!54468 () Bool)

(assert (=> mapNonEmpty!28278 (= mapRes!28278 (and tp!54468 e!493887))))

(declare-fun mapValue!28278 () ValueCell!8438)

(declare-fun mapKey!28278 () (_ BitVec 32))

(declare-fun mapRest!28278 () (Array (_ BitVec 32) ValueCell!8438))

(assert (=> mapNonEmpty!28278 (= (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (store mapRest!28278 mapKey!28278 mapValue!28278))))

(declare-fun b!886968 () Bool)

(assert (=> b!886968 (= e!493890 (and e!493893 mapRes!28278))))

(declare-fun condMapEmpty!28278 () Bool)

(declare-fun mapDefault!28278 () ValueCell!8438)

(assert (=> b!886968 (= condMapEmpty!28278 (= (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8438)) mapDefault!28278)))))

(declare-fun b!886969 () Bool)

(assert (=> b!886969 (= e!493891 e!493888)))

(declare-fun res!601966 () Bool)

(assert (=> b!886969 (=> (not res!601966) (not e!493888))))

(declare-fun contains!4278 (LongMap!1044 (_ BitVec 64)) Bool)

(assert (=> b!886969 (= res!601966 (contains!4278 thiss!833 key!673))))

(declare-fun lt!400976 () V!28751)

(declare-fun apply!391 (LongMapFixedSize!3892 (_ BitVec 64)) V!28751)

(assert (=> b!886969 (= lt!400976 (apply!391 (v!11415 (underlying!533 thiss!833)) key!673))))

(assert (= (and start!75294 res!601967) b!886969))

(assert (= (and b!886969 res!601966) b!886963))

(assert (= (and b!886968 condMapEmpty!28278) mapIsEmpty!28278))

(assert (= (and b!886968 (not condMapEmpty!28278)) mapNonEmpty!28278))

(get-info :version)

(assert (= (and mapNonEmpty!28278 ((_ is ValueCellFull!8438) mapValue!28278)) b!886965))

(assert (= (and b!886968 ((_ is ValueCellFull!8438) mapDefault!28278)) b!886962))

(assert (= b!886966 b!886968))

(assert (= b!886964 b!886966))

(assert (= b!886967 b!886964))

(assert (= start!75294 b!886967))

(declare-fun m!826149 () Bool)

(assert (=> b!886969 m!826149))

(declare-fun m!826151 () Bool)

(assert (=> b!886969 m!826151))

(declare-fun m!826153 () Bool)

(assert (=> b!886963 m!826153))

(declare-fun m!826155 () Bool)

(assert (=> b!886963 m!826155))

(assert (=> b!886963 m!826155))

(declare-fun m!826157 () Bool)

(assert (=> b!886963 m!826157))

(declare-fun m!826159 () Bool)

(assert (=> mapNonEmpty!28278 m!826159))

(declare-fun m!826161 () Bool)

(assert (=> start!75294 m!826161))

(declare-fun m!826163 () Bool)

(assert (=> b!886966 m!826163))

(declare-fun m!826165 () Bool)

(assert (=> b!886966 m!826165))

(check-sat tp_is_empty!17839 (not b!886969) b_and!25691 (not b!886966) (not start!75294) (not b_next!15511) (not mapNonEmpty!28278) (not b!886963))
(check-sat b_and!25691 (not b_next!15511))
(get-model)

(declare-fun d!109689 () Bool)

(assert (=> d!109689 (= (array_inv!19592 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (bvsge (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!886966 d!109689))

(declare-fun d!109691 () Bool)

(assert (=> d!109691 (= (array_inv!19593 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (bvsge (size!25269 (_values!5118 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!886966 d!109691))

(declare-fun d!109693 () Bool)

(declare-fun lt!400985 () Bool)

(declare-fun contains!4280 (ListLongMap!10623 (_ BitVec 64)) Bool)

(assert (=> d!109693 (= lt!400985 (contains!4280 (map!12062 thiss!833) key!673))))

(declare-fun contains!4281 (LongMapFixedSize!3892 (_ BitVec 64)) Bool)

(assert (=> d!109693 (= lt!400985 (contains!4281 (v!11415 (underlying!533 thiss!833)) key!673))))

(assert (=> d!109693 (valid!1523 thiss!833)))

(assert (=> d!109693 (= (contains!4278 thiss!833 key!673) lt!400985)))

(declare-fun bs!24838 () Bool)

(assert (= bs!24838 d!109693))

(assert (=> bs!24838 m!826153))

(assert (=> bs!24838 m!826153))

(declare-fun m!826203 () Bool)

(assert (=> bs!24838 m!826203))

(declare-fun m!826205 () Bool)

(assert (=> bs!24838 m!826205))

(assert (=> bs!24838 m!826161))

(assert (=> b!886969 d!109693))

(declare-fun b!887055 () Bool)

(declare-fun e!493980 () Bool)

(declare-fun e!493973 () Bool)

(assert (=> b!887055 (= e!493980 e!493973)))

(declare-fun c!93566 () Bool)

(assert (=> b!887055 (= c!93566 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887056 () Bool)

(declare-fun res!601991 () Bool)

(declare-fun e!493976 () Bool)

(assert (=> b!887056 (=> (not res!601991) (not e!493976))))

(assert (=> b!887056 (= res!601991 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!887056 (= e!493973 e!493976)))

(declare-fun b!887057 () Bool)

(declare-fun c!93564 () Bool)

(assert (=> b!887057 (= c!93564 (and (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!493978 () V!28751)

(declare-fun e!493974 () V!28751)

(assert (=> b!887057 (= e!493978 e!493974)))

(declare-fun b!887058 () Bool)

(declare-fun e!493977 () Bool)

(declare-fun call!39312 () V!28751)

(assert (=> b!887058 (= e!493977 (= call!39312 (zeroValue!4931 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun bm!39308 () Bool)

(declare-fun call!39311 () ListLongMap!10623)

(declare-fun getCurrentListMap!2563 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) ListLongMap!10623)

(assert (=> bm!39308 (= call!39311 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun call!39313 () V!28751)

(declare-fun e!493982 () Bool)

(declare-datatypes ((SeekEntryResult!8759 0))(
  ( (MissingZero!8759 (index!37407 (_ BitVec 32))) (Found!8759 (index!37408 (_ BitVec 32))) (Intermediate!8759 (undefined!9571 Bool) (index!37409 (_ BitVec 32)) (x!75234 (_ BitVec 32))) (Undefined!8759) (MissingVacant!8759 (index!37410 (_ BitVec 32))) )
))
(declare-fun lt!401015 () SeekEntryResult!8759)

(declare-fun b!887059 () Bool)

(declare-fun get!13123 (ValueCell!8438 V!28751) V!28751)

(declare-fun dynLambda!1285 (Int (_ BitVec 64)) V!28751)

(assert (=> b!887059 (= e!493982 (= call!39313 (get!13123 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!887060 () Bool)

(declare-datatypes ((Unit!30188 0))(
  ( (Unit!30189) )
))
(declare-fun lt!401008 () Unit!30188)

(declare-fun lt!401011 () Unit!30188)

(assert (=> b!887060 (= lt!401008 lt!401011)))

(assert (=> b!887060 e!493980))

(declare-fun c!93570 () Bool)

(assert (=> b!887060 (= c!93570 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lemmaKeyInListMapThenSameValueInArray!1 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64) (_ BitVec 32) Int) Unit!30188)

(assert (=> b!887060 (= lt!401011 (lemmaKeyInListMapThenSameValueInArray!1 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401015) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401017 () Unit!30188)

(declare-fun lt!401013 () Unit!30188)

(assert (=> b!887060 (= lt!401017 lt!401013)))

(assert (=> b!887060 (contains!4280 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!199 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) Unit!30188)

(assert (=> b!887060 (= lt!401013 (lemmaValidKeyInArrayIsInListMap!199 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) (index!37408 lt!401015) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401012 () Unit!30188)

(declare-fun lt!401016 () Unit!30188)

(assert (=> b!887060 (= lt!401012 lt!401016)))

(declare-fun arrayContainsKey!0 (array!51623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!887060 (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51623 (_ BitVec 64) (_ BitVec 32)) Unit!30188)

(assert (=> b!887060 (= lt!401016 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401015)))))

(declare-fun e!493981 () V!28751)

(assert (=> b!887060 (= e!493981 (get!13123 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39309 () Bool)

(declare-fun call!39314 () ListLongMap!10623)

(assert (=> bm!39309 (= call!39314 call!39311)))

(declare-fun bm!39310 () Bool)

(assert (=> bm!39310 (= call!39313 call!39312)))

(declare-fun b!887061 () Bool)

(assert (=> b!887061 (= e!493981 (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) key!673))))

(declare-fun e!493972 () Bool)

(declare-fun b!887062 () Bool)

(declare-fun lt!401014 () V!28751)

(assert (=> b!887062 (= e!493972 (= lt!401014 (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) key!673)))))

(declare-fun b!887063 () Bool)

(assert (=> b!887063 (= e!493978 (zeroValue!4931 (v!11415 (underlying!533 thiss!833))))))

(declare-fun b!887064 () Bool)

(declare-fun e!493975 () V!28751)

(assert (=> b!887064 (= e!493975 e!493981)))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51623 (_ BitVec 32)) SeekEntryResult!8759)

(assert (=> b!887064 (= lt!401015 (seekEntry!0 key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401010 () Unit!30188)

(declare-fun lemmaSeekEntryGivesInRangeIndex!1 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64)) Unit!30188)

(assert (=> b!887064 (= lt!401010 (lemmaSeekEntryGivesInRangeIndex!1 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673))))

(declare-fun lt!401009 () SeekEntryResult!8759)

(assert (=> b!887064 (= lt!401009 (seekEntry!0 key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun res!601989 () Bool)

(assert (=> b!887064 (= res!601989 (not ((_ is Found!8759) lt!401009)))))

(declare-fun e!493979 () Bool)

(assert (=> b!887064 (=> res!601989 e!493979)))

(assert (=> b!887064 e!493979))

(declare-fun lt!401018 () Unit!30188)

(assert (=> b!887064 (= lt!401018 lt!401010)))

(declare-fun c!93565 () Bool)

(assert (=> b!887064 (= c!93565 ((_ is Found!8759) lt!401015))))

(declare-fun b!887065 () Bool)

(declare-fun get!13124 (Option!436) V!28751)

(declare-fun map!12064 (LongMapFixedSize!3892) ListLongMap!10623)

(assert (=> b!887065 (= e!493972 (= lt!401014 (get!13124 (getValueByKey!430 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833)))) key!673))))))

(declare-fun b!887066 () Bool)

(declare-fun res!601990 () Bool)

(assert (=> b!887066 (=> (not res!601990) (not e!493982))))

(assert (=> b!887066 (= res!601990 (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (=> b!887066 (= e!493973 e!493982)))

(declare-fun d!109695 () Bool)

(assert (=> d!109695 e!493972))

(declare-fun c!93567 () Bool)

(assert (=> d!109695 (= c!93567 (contains!4281 (v!11415 (underlying!533 thiss!833)) key!673))))

(assert (=> d!109695 (= lt!401014 e!493975)))

(declare-fun c!93569 () Bool)

(assert (=> d!109695 (= c!93569 (= key!673 (bvneg key!673)))))

(declare-fun valid!1525 (LongMapFixedSize!3892) Bool)

(assert (=> d!109695 (valid!1525 (v!11415 (underlying!533 thiss!833)))))

(assert (=> d!109695 (= (apply!391 (v!11415 (underlying!533 thiss!833)) key!673) lt!401014)))

(declare-fun b!887054 () Bool)

(assert (=> b!887054 (= e!493980 e!493977)))

(declare-fun res!601988 () Bool)

(assert (=> b!887054 (= res!601988 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887054 (=> (not res!601988) (not e!493977))))

(declare-fun b!887067 () Bool)

(assert (=> b!887067 (= e!493975 e!493978)))

(declare-fun c!93568 () Bool)

(assert (=> b!887067 (= c!93568 (and (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!887068 () Bool)

(assert (=> b!887068 (= e!493974 (minValue!4931 (v!11415 (underlying!533 thiss!833))))))

(declare-fun bm!39311 () Bool)

(declare-fun apply!393 (ListLongMap!10623 (_ BitVec 64)) V!28751)

(assert (=> bm!39311 (= call!39312 (apply!393 (ite c!93570 call!39311 call!39314) key!673))))

(declare-fun b!887069 () Bool)

(assert (=> b!887069 (= e!493976 (= call!39313 (minValue!4931 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887070 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!887070 (= e!493979 (inRange!0 (index!37408 lt!401009) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887071 () Bool)

(assert (=> b!887071 (= e!493974 (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) key!673))))

(assert (= (and d!109695 c!93569) b!887067))

(assert (= (and d!109695 (not c!93569)) b!887064))

(assert (= (and b!887067 c!93568) b!887063))

(assert (= (and b!887067 (not c!93568)) b!887057))

(assert (= (and b!887057 c!93564) b!887068))

(assert (= (and b!887057 (not c!93564)) b!887071))

(assert (= (and b!887064 (not res!601989)) b!887070))

(assert (= (and b!887064 c!93565) b!887060))

(assert (= (and b!887064 (not c!93565)) b!887061))

(assert (= (and b!887060 c!93570) b!887054))

(assert (= (and b!887060 (not c!93570)) b!887055))

(assert (= (and b!887054 res!601988) b!887058))

(assert (= (and b!887055 c!93566) b!887056))

(assert (= (and b!887055 (not c!93566)) b!887066))

(assert (= (and b!887056 res!601991) b!887069))

(assert (= (and b!887066 res!601990) b!887059))

(assert (= (or b!887069 b!887059) bm!39309))

(assert (= (or b!887069 b!887059) bm!39310))

(assert (= (or b!887058 bm!39309) bm!39308))

(assert (= (or b!887058 bm!39310) bm!39311))

(assert (= (and d!109695 c!93567) b!887065))

(assert (= (and d!109695 (not c!93567)) b!887062))

(declare-fun b_lambda!12801 () Bool)

(assert (=> (not b_lambda!12801) (not b!887062)))

(declare-fun t!24963 () Bool)

(declare-fun tb!5127 () Bool)

(assert (=> (and b!886966 (= (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) t!24963) tb!5127))

(declare-fun result!9957 () Bool)

(assert (=> tb!5127 (= result!9957 tp_is_empty!17839)))

(assert (=> b!887062 t!24963))

(declare-fun b_and!25697 () Bool)

(assert (= b_and!25691 (and (=> t!24963 result!9957) b_and!25697)))

(declare-fun b_lambda!12803 () Bool)

(assert (=> (not b_lambda!12803) (not b!887071)))

(assert (=> b!887071 t!24963))

(declare-fun b_and!25699 () Bool)

(assert (= b_and!25697 (and (=> t!24963 result!9957) b_and!25699)))

(declare-fun b_lambda!12805 () Bool)

(assert (=> (not b_lambda!12805) (not b!887059)))

(declare-fun t!24965 () Bool)

(declare-fun tb!5129 () Bool)

(assert (=> (and b!886966 (= (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) t!24965) tb!5129))

(declare-fun result!9961 () Bool)

(assert (=> tb!5129 (= result!9961 tp_is_empty!17839)))

(assert (=> b!887059 t!24965))

(declare-fun b_and!25701 () Bool)

(assert (= b_and!25699 (and (=> t!24965 result!9961) b_and!25701)))

(declare-fun b_lambda!12807 () Bool)

(assert (=> (not b_lambda!12807) (not b!887061)))

(assert (=> b!887061 t!24963))

(declare-fun b_and!25703 () Bool)

(assert (= b_and!25701 (and (=> t!24963 result!9957) b_and!25703)))

(declare-fun b_lambda!12809 () Bool)

(assert (=> (not b_lambda!12809) (not b!887060)))

(assert (=> b!887060 t!24965))

(declare-fun b_and!25705 () Bool)

(assert (= b_and!25703 (and (=> t!24965 result!9961) b_and!25705)))

(declare-fun m!826207 () Bool)

(assert (=> b!887070 m!826207))

(declare-fun m!826209 () Bool)

(assert (=> b!887061 m!826209))

(assert (=> b!887062 m!826209))

(declare-fun m!826211 () Bool)

(assert (=> b!887065 m!826211))

(declare-fun m!826213 () Bool)

(assert (=> b!887065 m!826213))

(assert (=> b!887065 m!826213))

(declare-fun m!826215 () Bool)

(assert (=> b!887065 m!826215))

(assert (=> b!887071 m!826209))

(declare-fun m!826217 () Bool)

(assert (=> b!887060 m!826217))

(declare-fun m!826219 () Bool)

(assert (=> b!887060 m!826219))

(declare-fun m!826221 () Bool)

(assert (=> b!887060 m!826221))

(declare-fun m!826223 () Bool)

(assert (=> b!887060 m!826223))

(declare-fun m!826225 () Bool)

(assert (=> b!887060 m!826225))

(declare-fun m!826227 () Bool)

(assert (=> b!887060 m!826227))

(assert (=> b!887060 m!826219))

(declare-fun m!826229 () Bool)

(assert (=> b!887060 m!826229))

(declare-fun m!826231 () Bool)

(assert (=> b!887060 m!826231))

(declare-fun m!826233 () Bool)

(assert (=> b!887060 m!826233))

(declare-fun m!826235 () Bool)

(assert (=> b!887060 m!826235))

(assert (=> b!887060 m!826217))

(assert (=> b!887060 m!826231))

(assert (=> b!887060 m!826233))

(declare-fun m!826237 () Bool)

(assert (=> b!887064 m!826237))

(declare-fun m!826239 () Bool)

(assert (=> b!887064 m!826239))

(assert (=> b!887059 m!826217))

(assert (=> b!887059 m!826219))

(assert (=> b!887059 m!826217))

(assert (=> b!887059 m!826219))

(assert (=> b!887059 m!826221))

(assert (=> bm!39308 m!826231))

(declare-fun m!826241 () Bool)

(assert (=> bm!39311 m!826241))

(assert (=> d!109695 m!826205))

(declare-fun m!826243 () Bool)

(assert (=> d!109695 m!826243))

(assert (=> b!887066 m!826225))

(assert (=> b!886969 d!109695))

(declare-fun d!109697 () Bool)

(assert (=> d!109697 (= (valid!1523 thiss!833) (valid!1525 (v!11415 (underlying!533 thiss!833))))))

(declare-fun bs!24839 () Bool)

(assert (= bs!24839 d!109697))

(assert (=> bs!24839 m!826243))

(assert (=> start!75294 d!109697))

(declare-fun d!109699 () Bool)

(declare-fun isEmpty!679 (Option!436) Bool)

(assert (=> d!109699 (= (isDefined!313 (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673)) (not (isEmpty!679 (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673))))))

(declare-fun bs!24840 () Bool)

(assert (= bs!24840 d!109699))

(assert (=> bs!24840 m!826155))

(declare-fun m!826245 () Bool)

(assert (=> bs!24840 m!826245))

(assert (=> b!886963 d!109699))

(declare-fun b!887082 () Bool)

(declare-fun e!493987 () Option!436)

(assert (=> b!887082 (= e!493987 (Some!435 (_2!5979 (h!18813 (toList!5327 (map!12062 thiss!833))))))))

(declare-fun b!887083 () Bool)

(declare-fun e!493988 () Option!436)

(assert (=> b!887083 (= e!493987 e!493988)))

(declare-fun c!93576 () Bool)

(assert (=> b!887083 (= c!93576 (and ((_ is Cons!17682) (toList!5327 (map!12062 thiss!833))) (not (= (_1!5979 (h!18813 (toList!5327 (map!12062 thiss!833)))) key!673))))))

(declare-fun b!887084 () Bool)

(assert (=> b!887084 (= e!493988 (getValueByKey!430 (t!24960 (toList!5327 (map!12062 thiss!833))) key!673))))

(declare-fun b!887085 () Bool)

(assert (=> b!887085 (= e!493988 None!434)))

(declare-fun d!109701 () Bool)

(declare-fun c!93575 () Bool)

(assert (=> d!109701 (= c!93575 (and ((_ is Cons!17682) (toList!5327 (map!12062 thiss!833))) (= (_1!5979 (h!18813 (toList!5327 (map!12062 thiss!833)))) key!673)))))

(assert (=> d!109701 (= (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673) e!493987)))

(assert (= (and d!109701 c!93575) b!887082))

(assert (= (and d!109701 (not c!93575)) b!887083))

(assert (= (and b!887083 c!93576) b!887084))

(assert (= (and b!887083 (not c!93576)) b!887085))

(declare-fun m!826247 () Bool)

(assert (=> b!887084 m!826247))

(assert (=> b!886963 d!109701))

(declare-fun d!109703 () Bool)

(assert (=> d!109703 (= (map!12062 thiss!833) (map!12064 (v!11415 (underlying!533 thiss!833))))))

(declare-fun bs!24841 () Bool)

(assert (= bs!24841 d!109703))

(assert (=> bs!24841 m!826211))

(assert (=> b!886963 d!109703))

(declare-fun b!887093 () Bool)

(declare-fun e!493994 () Bool)

(assert (=> b!887093 (= e!493994 tp_is_empty!17839)))

(declare-fun mapNonEmpty!28287 () Bool)

(declare-fun mapRes!28287 () Bool)

(declare-fun tp!54483 () Bool)

(declare-fun e!493993 () Bool)

(assert (=> mapNonEmpty!28287 (= mapRes!28287 (and tp!54483 e!493993))))

(declare-fun mapRest!28287 () (Array (_ BitVec 32) ValueCell!8438))

(declare-fun mapValue!28287 () ValueCell!8438)

(declare-fun mapKey!28287 () (_ BitVec 32))

(assert (=> mapNonEmpty!28287 (= mapRest!28278 (store mapRest!28287 mapKey!28287 mapValue!28287))))

(declare-fun b!887092 () Bool)

(assert (=> b!887092 (= e!493993 tp_is_empty!17839)))

(declare-fun condMapEmpty!28287 () Bool)

(declare-fun mapDefault!28287 () ValueCell!8438)

(assert (=> mapNonEmpty!28278 (= condMapEmpty!28287 (= mapRest!28278 ((as const (Array (_ BitVec 32) ValueCell!8438)) mapDefault!28287)))))

(assert (=> mapNonEmpty!28278 (= tp!54468 (and e!493994 mapRes!28287))))

(declare-fun mapIsEmpty!28287 () Bool)

(assert (=> mapIsEmpty!28287 mapRes!28287))

(assert (= (and mapNonEmpty!28278 condMapEmpty!28287) mapIsEmpty!28287))

(assert (= (and mapNonEmpty!28278 (not condMapEmpty!28287)) mapNonEmpty!28287))

(assert (= (and mapNonEmpty!28287 ((_ is ValueCellFull!8438) mapValue!28287)) b!887092))

(assert (= (and mapNonEmpty!28278 ((_ is ValueCellFull!8438) mapDefault!28287)) b!887093))

(declare-fun m!826249 () Bool)

(assert (=> mapNonEmpty!28287 m!826249))

(declare-fun b_lambda!12811 () Bool)

(assert (= b_lambda!12803 (or (and b!886966 b_free!15511) b_lambda!12811)))

(declare-fun b_lambda!12813 () Bool)

(assert (= b_lambda!12809 (or (and b!886966 b_free!15511) b_lambda!12813)))

(declare-fun b_lambda!12815 () Bool)

(assert (= b_lambda!12801 (or (and b!886966 b_free!15511) b_lambda!12815)))

(declare-fun b_lambda!12817 () Bool)

(assert (= b_lambda!12807 (or (and b!886966 b_free!15511) b_lambda!12817)))

(declare-fun b_lambda!12819 () Bool)

(assert (= b_lambda!12805 (or (and b!886966 b_free!15511) b_lambda!12819)))

(check-sat tp_is_empty!17839 (not bm!39308) b_and!25705 (not b!887065) (not d!109703) (not b_lambda!12815) (not b!887059) (not d!109695) (not b!887084) (not b!887070) (not d!109699) (not d!109697) (not d!109693) (not b_lambda!12813) (not b!887066) (not mapNonEmpty!28287) (not b!887060) (not bm!39311) (not b_next!15511) (not b!887064) (not b_lambda!12819) (not b_lambda!12811) (not b_lambda!12817))
(check-sat b_and!25705 (not b_next!15511))
(get-model)

(declare-fun c!93589 () Bool)

(declare-fun call!39322 () Bool)

(declare-fun lt!401057 () SeekEntryResult!8759)

(declare-fun call!39321 () ListLongMap!10623)

(declare-fun bm!39318 () Bool)

(assert (=> bm!39318 (= call!39322 (contains!4280 call!39321 (ite c!93589 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401057)) key!673)))))

(declare-fun b!887114 () Bool)

(declare-fun e!494005 () Bool)

(assert (=> b!887114 (= e!494005 true)))

(declare-fun lt!401063 () Unit!30188)

(assert (=> b!887114 (= lt!401063 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401057)))))

(declare-fun call!39323 () Bool)

(assert (=> b!887114 call!39323))

(declare-fun lt!401059 () Unit!30188)

(assert (=> b!887114 (= lt!401059 lt!401063)))

(declare-fun lt!401054 () Unit!30188)

(assert (=> b!887114 (= lt!401054 (lemmaValidKeyInArrayIsInListMap!199 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) (index!37408 lt!401057) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(assert (=> b!887114 call!39322))

(declare-fun lt!401055 () Unit!30188)

(assert (=> b!887114 (= lt!401055 lt!401054)))

(declare-fun b!887115 () Bool)

(assert (=> b!887115 false))

(declare-fun lt!401052 () Unit!30188)

(declare-fun lt!401060 () Unit!30188)

(assert (=> b!887115 (= lt!401052 lt!401060)))

(declare-fun lt!401050 () SeekEntryResult!8759)

(declare-fun lt!401053 () (_ BitVec 32))

(assert (=> b!887115 (and ((_ is Found!8759) lt!401050) (= (index!37408 lt!401050) lt!401053))))

(assert (=> b!887115 (= lt!401050 (seekEntry!0 key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51623 (_ BitVec 32)) Unit!30188)

(assert (=> b!887115 (= lt!401060 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!673 lt!401053 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401062 () Unit!30188)

(declare-fun lt!401058 () Unit!30188)

(assert (=> b!887115 (= lt!401062 lt!401058)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51623 (_ BitVec 32)) Bool)

(assert (=> b!887115 (arrayForallSeekEntryOrOpenFound!0 lt!401053 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30188)

(assert (=> b!887115 (= lt!401058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 lt!401053))))

(declare-fun arrayScanForKey!0 (array!51623 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887115 (= lt!401053 (arrayScanForKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun lt!401051 () Unit!30188)

(declare-fun lt!401056 () Unit!30188)

(assert (=> b!887115 (= lt!401051 lt!401056)))

(declare-fun e!494007 () Bool)

(assert (=> b!887115 e!494007))

(declare-fun c!93587 () Bool)

(assert (=> b!887115 (= c!93587 (and (not (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!162 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64) Int) Unit!30188)

(assert (=> b!887115 (= lt!401056 (lemmaKeyInListMapIsInArray!162 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun e!494009 () Unit!30188)

(declare-fun Unit!30190 () Unit!30188)

(assert (=> b!887115 (= e!494009 Unit!30190)))

(declare-fun d!109705 () Bool)

(declare-fun lt!401061 () Bool)

(assert (=> d!109705 (= lt!401061 (contains!4280 (map!12064 (v!11415 (underlying!533 thiss!833))) key!673))))

(declare-fun e!494006 () Bool)

(assert (=> d!109705 (= lt!401061 e!494006)))

(declare-fun c!93590 () Bool)

(assert (=> d!109705 (= c!93590 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109705 (valid!1525 (v!11415 (underlying!533 thiss!833)))))

(assert (=> d!109705 (= (contains!4281 (v!11415 (underlying!533 thiss!833)) key!673) lt!401061)))

(declare-fun bm!39319 () Bool)

(assert (=> bm!39319 (= call!39321 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887116 () Bool)

(assert (=> b!887116 (= e!494007 (ite (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!887117 () Bool)

(declare-fun e!494008 () Bool)

(assert (=> b!887117 (= e!494006 e!494008)))

(declare-fun c!93588 () Bool)

(assert (=> b!887117 (= c!93588 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887118 () Bool)

(assert (=> b!887118 (= c!93589 ((_ is Found!8759) lt!401057))))

(assert (=> b!887118 (= lt!401057 (seekEntry!0 key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(assert (=> b!887118 (= e!494008 e!494005)))

(declare-fun b!887119 () Bool)

(assert (=> b!887119 (= e!494008 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39320 () Bool)

(assert (=> bm!39320 (= call!39323 (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun b!887120 () Bool)

(declare-fun Unit!30191 () Unit!30188)

(assert (=> b!887120 (= e!494009 Unit!30191)))

(declare-fun b!887121 () Bool)

(assert (=> b!887121 (= e!494006 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!887122 () Bool)

(assert (=> b!887122 (= e!494005 false)))

(declare-fun c!93591 () Bool)

(assert (=> b!887122 (= c!93591 call!39322)))

(declare-fun lt!401049 () Unit!30188)

(assert (=> b!887122 (= lt!401049 e!494009)))

(declare-fun b!887123 () Bool)

(assert (=> b!887123 (= e!494007 call!39323)))

(assert (= (and d!109705 c!93590) b!887121))

(assert (= (and d!109705 (not c!93590)) b!887117))

(assert (= (and b!887117 c!93588) b!887119))

(assert (= (and b!887117 (not c!93588)) b!887118))

(assert (= (and b!887118 c!93589) b!887114))

(assert (= (and b!887118 (not c!93589)) b!887122))

(assert (= (and b!887122 c!93591) b!887115))

(assert (= (and b!887122 (not c!93591)) b!887120))

(assert (= (and b!887115 c!93587) b!887123))

(assert (= (and b!887115 (not c!93587)) b!887116))

(assert (= (or b!887114 b!887123) bm!39320))

(assert (= (or b!887114 b!887122) bm!39319))

(assert (= (or b!887114 b!887122) bm!39318))

(declare-fun m!826251 () Bool)

(assert (=> b!887115 m!826251))

(declare-fun m!826253 () Bool)

(assert (=> b!887115 m!826253))

(declare-fun m!826255 () Bool)

(assert (=> b!887115 m!826255))

(declare-fun m!826257 () Bool)

(assert (=> b!887115 m!826257))

(declare-fun m!826259 () Bool)

(assert (=> b!887115 m!826259))

(assert (=> b!887115 m!826237))

(declare-fun m!826261 () Bool)

(assert (=> bm!39318 m!826261))

(declare-fun m!826263 () Bool)

(assert (=> bm!39318 m!826263))

(assert (=> b!887118 m!826237))

(declare-fun m!826265 () Bool)

(assert (=> b!887114 m!826265))

(declare-fun m!826267 () Bool)

(assert (=> b!887114 m!826267))

(assert (=> bm!39319 m!826231))

(assert (=> d!109705 m!826211))

(assert (=> d!109705 m!826211))

(declare-fun m!826269 () Bool)

(assert (=> d!109705 m!826269))

(assert (=> d!109705 m!826243))

(assert (=> bm!39320 m!826225))

(assert (=> d!109695 d!109705))

(declare-fun d!109707 () Bool)

(declare-fun res!601998 () Bool)

(declare-fun e!494012 () Bool)

(assert (=> d!109707 (=> (not res!601998) (not e!494012))))

(declare-fun simpleValid!287 (LongMapFixedSize!3892) Bool)

(assert (=> d!109707 (= res!601998 (simpleValid!287 (v!11415 (underlying!533 thiss!833))))))

(assert (=> d!109707 (= (valid!1525 (v!11415 (underlying!533 thiss!833))) e!494012)))

(declare-fun b!887130 () Bool)

(declare-fun res!601999 () Bool)

(assert (=> b!887130 (=> (not res!601999) (not e!494012))))

(declare-fun arrayCountValidKeys!0 (array!51623 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887130 (= res!601999 (= (arrayCountValidKeys!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))) (_size!2001 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887131 () Bool)

(declare-fun res!602000 () Bool)

(assert (=> b!887131 (=> (not res!602000) (not e!494012))))

(assert (=> b!887131 (= res!602000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887132 () Bool)

(declare-datatypes ((List!17688 0))(
  ( (Nil!17685) (Cons!17684 (h!18815 (_ BitVec 64)) (t!24966 List!17688)) )
))
(declare-fun arrayNoDuplicates!0 (array!51623 (_ BitVec 32) List!17688) Bool)

(assert (=> b!887132 (= e!494012 (arrayNoDuplicates!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 Nil!17685))))

(assert (= (and d!109707 res!601998) b!887130))

(assert (= (and b!887130 res!601999) b!887131))

(assert (= (and b!887131 res!602000) b!887132))

(declare-fun m!826271 () Bool)

(assert (=> d!109707 m!826271))

(declare-fun m!826273 () Bool)

(assert (=> b!887130 m!826273))

(declare-fun m!826275 () Bool)

(assert (=> b!887131 m!826275))

(declare-fun m!826277 () Bool)

(assert (=> b!887132 m!826277))

(assert (=> d!109695 d!109707))

(declare-fun d!109709 () Bool)

(assert (=> d!109709 (= (isEmpty!679 (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673)) (not ((_ is Some!435) (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673))))))

(assert (=> d!109699 d!109709))

(declare-fun d!109711 () Bool)

(assert (=> d!109711 (= (inRange!0 (index!37408 lt!401009) (mask!25522 (v!11415 (underlying!533 thiss!833)))) (and (bvsge (index!37408 lt!401009) #b00000000000000000000000000000000) (bvslt (index!37408 lt!401009) (bvadd (mask!25522 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001))))))

(assert (=> b!887070 d!109711))

(declare-fun d!109713 () Bool)

(assert (=> d!109713 (= (map!12064 (v!11415 (underlying!533 thiss!833))) (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun bs!24842 () Bool)

(assert (= bs!24842 d!109713))

(assert (=> bs!24842 m!826231))

(assert (=> d!109703 d!109713))

(declare-fun d!109715 () Bool)

(declare-fun e!494017 () Bool)

(assert (=> d!109715 e!494017))

(declare-fun res!602003 () Bool)

(assert (=> d!109715 (=> res!602003 e!494017)))

(declare-fun lt!401075 () Bool)

(assert (=> d!109715 (= res!602003 (not lt!401075))))

(declare-fun lt!401072 () Bool)

(assert (=> d!109715 (= lt!401075 lt!401072)))

(declare-fun lt!401074 () Unit!30188)

(declare-fun e!494018 () Unit!30188)

(assert (=> d!109715 (= lt!401074 e!494018)))

(declare-fun c!93594 () Bool)

(assert (=> d!109715 (= c!93594 lt!401072)))

(declare-fun containsKey!417 (List!17686 (_ BitVec 64)) Bool)

(assert (=> d!109715 (= lt!401072 (containsKey!417 (toList!5327 (map!12062 thiss!833)) key!673))))

(assert (=> d!109715 (= (contains!4280 (map!12062 thiss!833) key!673) lt!401075)))

(declare-fun b!887139 () Bool)

(declare-fun lt!401073 () Unit!30188)

(assert (=> b!887139 (= e!494018 lt!401073)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!312 (List!17686 (_ BitVec 64)) Unit!30188)

(assert (=> b!887139 (= lt!401073 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5327 (map!12062 thiss!833)) key!673))))

(assert (=> b!887139 (isDefined!313 (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673))))

(declare-fun b!887140 () Bool)

(declare-fun Unit!30192 () Unit!30188)

(assert (=> b!887140 (= e!494018 Unit!30192)))

(declare-fun b!887141 () Bool)

(assert (=> b!887141 (= e!494017 (isDefined!313 (getValueByKey!430 (toList!5327 (map!12062 thiss!833)) key!673)))))

(assert (= (and d!109715 c!93594) b!887139))

(assert (= (and d!109715 (not c!93594)) b!887140))

(assert (= (and d!109715 (not res!602003)) b!887141))

(declare-fun m!826279 () Bool)

(assert (=> d!109715 m!826279))

(declare-fun m!826281 () Bool)

(assert (=> b!887139 m!826281))

(assert (=> b!887139 m!826155))

(assert (=> b!887139 m!826155))

(assert (=> b!887139 m!826157))

(assert (=> b!887141 m!826155))

(assert (=> b!887141 m!826155))

(assert (=> b!887141 m!826157))

(assert (=> d!109693 d!109715))

(assert (=> d!109693 d!109703))

(assert (=> d!109693 d!109705))

(assert (=> d!109693 d!109697))

(declare-fun d!109717 () Bool)

(declare-fun e!494029 () Bool)

(assert (=> d!109717 e!494029))

(declare-fun c!93599 () Bool)

(assert (=> d!109717 (= c!93599 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!401078 () Unit!30188)

(declare-fun choose!1462 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64) (_ BitVec 32) Int) Unit!30188)

(assert (=> d!109717 (= lt!401078 (choose!1462 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401015) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!109717 (validMask!0 (mask!25522 (v!11415 (underlying!533 thiss!833))))))

(assert (=> d!109717 (= (lemmaKeyInListMapThenSameValueInArray!1 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401015) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) lt!401078)))

(declare-fun call!39332 () V!28751)

(declare-fun bm!39329 () Bool)

(declare-fun call!39335 () ListLongMap!10623)

(declare-fun call!39333 () ListLongMap!10623)

(assert (=> bm!39329 (= call!39332 (apply!393 (ite c!93599 call!39335 call!39333) key!673))))

(declare-fun bm!39330 () Bool)

(assert (=> bm!39330 (= call!39335 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun bm!39331 () Bool)

(declare-fun call!39334 () V!28751)

(assert (=> bm!39331 (= call!39334 call!39332)))

(declare-fun bm!39332 () Bool)

(assert (=> bm!39332 (= call!39333 call!39335)))

(declare-fun b!887156 () Bool)

(declare-fun res!602011 () Bool)

(declare-fun e!494031 () Bool)

(assert (=> b!887156 (=> (not res!602011) (not e!494031))))

(assert (=> b!887156 (= res!602011 (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun e!494030 () Bool)

(assert (=> b!887156 (= e!494030 e!494031)))

(declare-fun b!887157 () Bool)

(assert (=> b!887157 (= e!494031 (= call!39334 (get!13123 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!887157 (and (bvsge (index!37408 lt!401015) #b00000000000000000000000000000000) (bvslt (index!37408 lt!401015) (size!25269 (_values!5118 (v!11415 (underlying!533 thiss!833))))))))

(declare-fun b!887158 () Bool)

(assert (=> b!887158 (= e!494029 e!494030)))

(declare-fun c!93600 () Bool)

(assert (=> b!887158 (= c!93600 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887159 () Bool)

(declare-fun res!602012 () Bool)

(declare-fun e!494032 () Bool)

(assert (=> b!887159 (=> (not res!602012) (not e!494032))))

(assert (=> b!887159 (= res!602012 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!887159 (= e!494030 e!494032)))

(declare-fun b!887160 () Bool)

(assert (=> b!887160 (= e!494032 (= call!39334 (minValue!4931 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887161 () Bool)

(declare-fun e!494033 () Bool)

(assert (=> b!887161 (= e!494029 e!494033)))

(declare-fun res!602010 () Bool)

(assert (=> b!887161 (= res!602010 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887161 (=> (not res!602010) (not e!494033))))

(declare-fun b!887162 () Bool)

(assert (=> b!887162 (= e!494033 (= call!39332 (zeroValue!4931 (v!11415 (underlying!533 thiss!833)))))))

(assert (= (and d!109717 c!93599) b!887161))

(assert (= (and d!109717 (not c!93599)) b!887158))

(assert (= (and b!887161 res!602010) b!887162))

(assert (= (and b!887158 c!93600) b!887159))

(assert (= (and b!887158 (not c!93600)) b!887156))

(assert (= (and b!887159 res!602012) b!887160))

(assert (= (and b!887156 res!602011) b!887157))

(assert (= (or b!887160 b!887157) bm!39332))

(assert (= (or b!887160 b!887157) bm!39331))

(assert (= (or b!887162 bm!39332) bm!39330))

(assert (= (or b!887162 bm!39331) bm!39329))

(declare-fun b_lambda!12821 () Bool)

(assert (=> (not b_lambda!12821) (not b!887157)))

(assert (=> b!887157 t!24965))

(declare-fun b_and!25707 () Bool)

(assert (= b_and!25705 (and (=> t!24965 result!9961) b_and!25707)))

(declare-fun m!826283 () Bool)

(assert (=> bm!39329 m!826283))

(assert (=> bm!39330 m!826231))

(assert (=> b!887157 m!826217))

(assert (=> b!887157 m!826219))

(assert (=> b!887157 m!826217))

(assert (=> b!887157 m!826219))

(assert (=> b!887157 m!826221))

(declare-fun m!826285 () Bool)

(assert (=> d!109717 m!826285))

(declare-fun m!826287 () Bool)

(assert (=> d!109717 m!826287))

(assert (=> b!887156 m!826225))

(assert (=> b!887060 d!109717))

(declare-fun b!887205 () Bool)

(declare-fun e!494061 () Bool)

(declare-fun e!494069 () Bool)

(assert (=> b!887205 (= e!494061 e!494069)))

(declare-fun res!602039 () Bool)

(declare-fun call!39355 () Bool)

(assert (=> b!887205 (= res!602039 call!39355)))

(assert (=> b!887205 (=> (not res!602039) (not e!494069))))

(declare-fun b!887206 () Bool)

(declare-fun e!494066 () ListLongMap!10623)

(declare-fun call!39354 () ListLongMap!10623)

(assert (=> b!887206 (= e!494066 call!39354)))

(declare-fun b!887208 () Bool)

(declare-fun e!494072 () Bool)

(declare-fun call!39351 () Bool)

(assert (=> b!887208 (= e!494072 (not call!39351))))

(declare-fun b!887209 () Bool)

(declare-fun lt!401131 () ListLongMap!10623)

(assert (=> b!887209 (= e!494069 (= (apply!393 lt!401131 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4931 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887210 () Bool)

(declare-fun e!494062 () Bool)

(assert (=> b!887210 (= e!494062 (= (apply!393 lt!401131 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4931 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887211 () Bool)

(declare-fun e!494067 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!887211 (= e!494067 (validKeyInArray!0 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000)))))

(declare-fun bm!39347 () Bool)

(assert (=> bm!39347 (= call!39355 (contains!4280 lt!401131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887212 () Bool)

(declare-fun e!494071 () ListLongMap!10623)

(declare-fun call!39356 () ListLongMap!10623)

(declare-fun +!2610 (ListLongMap!10623 tuple2!11936) ListLongMap!10623)

(assert (=> b!887212 (= e!494071 (+!2610 call!39356 (tuple2!11937 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4931 (v!11415 (underlying!533 thiss!833))))))))

(declare-fun b!887213 () Bool)

(declare-fun res!602031 () Bool)

(declare-fun e!494063 () Bool)

(assert (=> b!887213 (=> (not res!602031) (not e!494063))))

(declare-fun e!494070 () Bool)

(assert (=> b!887213 (= res!602031 e!494070)))

(declare-fun res!602036 () Bool)

(assert (=> b!887213 (=> res!602036 e!494070)))

(assert (=> b!887213 (= res!602036 (not e!494067))))

(declare-fun res!602038 () Bool)

(assert (=> b!887213 (=> (not res!602038) (not e!494067))))

(assert (=> b!887213 (= res!602038 (bvslt #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))))

(declare-fun bm!39348 () Bool)

(assert (=> bm!39348 (= call!39351 (contains!4280 lt!401131 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887214 () Bool)

(assert (=> b!887214 (= e!494063 e!494072)))

(declare-fun c!93615 () Bool)

(assert (=> b!887214 (= c!93615 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!887215 () Bool)

(declare-fun e!494060 () ListLongMap!10623)

(assert (=> b!887215 (= e!494060 call!39354)))

(declare-fun bm!39349 () Bool)

(declare-fun call!39352 () ListLongMap!10623)

(declare-fun call!39353 () ListLongMap!10623)

(assert (=> bm!39349 (= call!39352 call!39353)))

(declare-fun b!887216 () Bool)

(declare-fun e!494068 () Bool)

(assert (=> b!887216 (= e!494068 (= (apply!393 lt!401131 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000)) (get!13123 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!887216 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25269 (_values!5118 (v!11415 (underlying!533 thiss!833))))))))

(assert (=> b!887216 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))))

(declare-fun b!887217 () Bool)

(declare-fun e!494064 () Unit!30188)

(declare-fun lt!401126 () Unit!30188)

(assert (=> b!887217 (= e!494064 lt!401126)))

(declare-fun lt!401124 () ListLongMap!10623)

(declare-fun getCurrentListMapNoExtraKeys!3307 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) ListLongMap!10623)

(assert (=> b!887217 (= lt!401124 (getCurrentListMapNoExtraKeys!3307 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401127 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401136 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401136 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401144 () Unit!30188)

(declare-fun addStillContains!325 (ListLongMap!10623 (_ BitVec 64) V!28751 (_ BitVec 64)) Unit!30188)

(assert (=> b!887217 (= lt!401144 (addStillContains!325 lt!401124 lt!401127 (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) lt!401136))))

(assert (=> b!887217 (contains!4280 (+!2610 lt!401124 (tuple2!11937 lt!401127 (zeroValue!4931 (v!11415 (underlying!533 thiss!833))))) lt!401136)))

(declare-fun lt!401139 () Unit!30188)

(assert (=> b!887217 (= lt!401139 lt!401144)))

(declare-fun lt!401143 () ListLongMap!10623)

(assert (=> b!887217 (= lt!401143 (getCurrentListMapNoExtraKeys!3307 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401137 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401137 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401132 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401132 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401134 () Unit!30188)

(declare-fun addApplyDifferent!325 (ListLongMap!10623 (_ BitVec 64) V!28751 (_ BitVec 64)) Unit!30188)

(assert (=> b!887217 (= lt!401134 (addApplyDifferent!325 lt!401143 lt!401137 (minValue!4931 (v!11415 (underlying!533 thiss!833))) lt!401132))))

(assert (=> b!887217 (= (apply!393 (+!2610 lt!401143 (tuple2!11937 lt!401137 (minValue!4931 (v!11415 (underlying!533 thiss!833))))) lt!401132) (apply!393 lt!401143 lt!401132))))

(declare-fun lt!401135 () Unit!30188)

(assert (=> b!887217 (= lt!401135 lt!401134)))

(declare-fun lt!401125 () ListLongMap!10623)

(assert (=> b!887217 (= lt!401125 (getCurrentListMapNoExtraKeys!3307 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401140 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401138 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401138 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401129 () Unit!30188)

(assert (=> b!887217 (= lt!401129 (addApplyDifferent!325 lt!401125 lt!401140 (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) lt!401138))))

(assert (=> b!887217 (= (apply!393 (+!2610 lt!401125 (tuple2!11937 lt!401140 (zeroValue!4931 (v!11415 (underlying!533 thiss!833))))) lt!401138) (apply!393 lt!401125 lt!401138))))

(declare-fun lt!401123 () Unit!30188)

(assert (=> b!887217 (= lt!401123 lt!401129)))

(declare-fun lt!401141 () ListLongMap!10623)

(assert (=> b!887217 (= lt!401141 (getCurrentListMapNoExtraKeys!3307 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401133 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401133 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401130 () (_ BitVec 64))

(assert (=> b!887217 (= lt!401130 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887217 (= lt!401126 (addApplyDifferent!325 lt!401141 lt!401133 (minValue!4931 (v!11415 (underlying!533 thiss!833))) lt!401130))))

(assert (=> b!887217 (= (apply!393 (+!2610 lt!401141 (tuple2!11937 lt!401133 (minValue!4931 (v!11415 (underlying!533 thiss!833))))) lt!401130) (apply!393 lt!401141 lt!401130))))

(declare-fun b!887207 () Bool)

(declare-fun Unit!30193 () Unit!30188)

(assert (=> b!887207 (= e!494064 Unit!30193)))

(declare-fun d!109719 () Bool)

(assert (=> d!109719 e!494063))

(declare-fun res!602035 () Bool)

(assert (=> d!109719 (=> (not res!602035) (not e!494063))))

(assert (=> d!109719 (= res!602035 (or (bvsge #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))))))

(declare-fun lt!401142 () ListLongMap!10623)

(assert (=> d!109719 (= lt!401131 lt!401142)))

(declare-fun lt!401128 () Unit!30188)

(assert (=> d!109719 (= lt!401128 e!494064)))

(declare-fun c!93613 () Bool)

(declare-fun e!494065 () Bool)

(assert (=> d!109719 (= c!93613 e!494065)))

(declare-fun res!602034 () Bool)

(assert (=> d!109719 (=> (not res!602034) (not e!494065))))

(assert (=> d!109719 (= res!602034 (bvslt #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))))

(assert (=> d!109719 (= lt!401142 e!494071)))

(declare-fun c!93616 () Bool)

(assert (=> d!109719 (= c!93616 (and (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!109719 (validMask!0 (mask!25522 (v!11415 (underlying!533 thiss!833))))))

(assert (=> d!109719 (= (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) lt!401131)))

(declare-fun b!887218 () Bool)

(assert (=> b!887218 (= e!494070 e!494068)))

(declare-fun res!602033 () Bool)

(assert (=> b!887218 (=> (not res!602033) (not e!494068))))

(assert (=> b!887218 (= res!602033 (contains!4280 lt!401131 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000)))))

(assert (=> b!887218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))))

(declare-fun bm!39350 () Bool)

(declare-fun call!39350 () ListLongMap!10623)

(assert (=> bm!39350 (= call!39353 call!39350)))

(declare-fun b!887219 () Bool)

(declare-fun res!602037 () Bool)

(assert (=> b!887219 (=> (not res!602037) (not e!494063))))

(assert (=> b!887219 (= res!602037 e!494061)))

(declare-fun c!93614 () Bool)

(assert (=> b!887219 (= c!93614 (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!887220 () Bool)

(assert (=> b!887220 (= e!494066 call!39352)))

(declare-fun b!887221 () Bool)

(assert (=> b!887221 (= e!494071 e!494060)))

(declare-fun c!93618 () Bool)

(assert (=> b!887221 (= c!93618 (and (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39351 () Bool)

(assert (=> bm!39351 (= call!39356 (+!2610 (ite c!93616 call!39350 (ite c!93618 call!39353 call!39352)) (ite (or c!93616 c!93618) (tuple2!11937 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4931 (v!11415 (underlying!533 thiss!833)))) (tuple2!11937 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4931 (v!11415 (underlying!533 thiss!833)))))))))

(declare-fun b!887222 () Bool)

(assert (=> b!887222 (= e!494065 (validKeyInArray!0 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000)))))

(declare-fun bm!39352 () Bool)

(assert (=> bm!39352 (= call!39350 (getCurrentListMapNoExtraKeys!3307 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun b!887223 () Bool)

(assert (=> b!887223 (= e!494061 (not call!39355))))

(declare-fun b!887224 () Bool)

(assert (=> b!887224 (= e!494072 e!494062)))

(declare-fun res!602032 () Bool)

(assert (=> b!887224 (= res!602032 call!39351)))

(assert (=> b!887224 (=> (not res!602032) (not e!494062))))

(declare-fun b!887225 () Bool)

(declare-fun c!93617 () Bool)

(assert (=> b!887225 (= c!93617 (and (not (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887225 (= e!494060 e!494066)))

(declare-fun bm!39353 () Bool)

(assert (=> bm!39353 (= call!39354 call!39356)))

(assert (= (and d!109719 c!93616) b!887212))

(assert (= (and d!109719 (not c!93616)) b!887221))

(assert (= (and b!887221 c!93618) b!887215))

(assert (= (and b!887221 (not c!93618)) b!887225))

(assert (= (and b!887225 c!93617) b!887206))

(assert (= (and b!887225 (not c!93617)) b!887220))

(assert (= (or b!887206 b!887220) bm!39349))

(assert (= (or b!887215 bm!39349) bm!39350))

(assert (= (or b!887215 b!887206) bm!39353))

(assert (= (or b!887212 bm!39350) bm!39352))

(assert (= (or b!887212 bm!39353) bm!39351))

(assert (= (and d!109719 res!602034) b!887222))

(assert (= (and d!109719 c!93613) b!887217))

(assert (= (and d!109719 (not c!93613)) b!887207))

(assert (= (and d!109719 res!602035) b!887213))

(assert (= (and b!887213 res!602038) b!887211))

(assert (= (and b!887213 (not res!602036)) b!887218))

(assert (= (and b!887218 res!602033) b!887216))

(assert (= (and b!887213 res!602031) b!887219))

(assert (= (and b!887219 c!93614) b!887205))

(assert (= (and b!887219 (not c!93614)) b!887223))

(assert (= (and b!887205 res!602039) b!887209))

(assert (= (or b!887205 b!887223) bm!39347))

(assert (= (and b!887219 res!602037) b!887214))

(assert (= (and b!887214 c!93615) b!887224))

(assert (= (and b!887214 (not c!93615)) b!887208))

(assert (= (and b!887224 res!602032) b!887210))

(assert (= (or b!887224 b!887208) bm!39348))

(declare-fun b_lambda!12823 () Bool)

(assert (=> (not b_lambda!12823) (not b!887216)))

(assert (=> b!887216 t!24965))

(declare-fun b_and!25709 () Bool)

(assert (= b_and!25707 (and (=> t!24965 result!9961) b_and!25709)))

(declare-fun m!826289 () Bool)

(assert (=> b!887218 m!826289))

(assert (=> b!887218 m!826289))

(declare-fun m!826291 () Bool)

(assert (=> b!887218 m!826291))

(declare-fun m!826293 () Bool)

(assert (=> b!887217 m!826293))

(declare-fun m!826295 () Bool)

(assert (=> b!887217 m!826295))

(declare-fun m!826297 () Bool)

(assert (=> b!887217 m!826297))

(declare-fun m!826299 () Bool)

(assert (=> b!887217 m!826299))

(declare-fun m!826301 () Bool)

(assert (=> b!887217 m!826301))

(declare-fun m!826303 () Bool)

(assert (=> b!887217 m!826303))

(declare-fun m!826305 () Bool)

(assert (=> b!887217 m!826305))

(declare-fun m!826307 () Bool)

(assert (=> b!887217 m!826307))

(declare-fun m!826309 () Bool)

(assert (=> b!887217 m!826309))

(declare-fun m!826311 () Bool)

(assert (=> b!887217 m!826311))

(declare-fun m!826313 () Bool)

(assert (=> b!887217 m!826313))

(assert (=> b!887217 m!826303))

(declare-fun m!826315 () Bool)

(assert (=> b!887217 m!826315))

(assert (=> b!887217 m!826295))

(declare-fun m!826317 () Bool)

(assert (=> b!887217 m!826317))

(declare-fun m!826319 () Bool)

(assert (=> b!887217 m!826319))

(assert (=> b!887217 m!826299))

(declare-fun m!826321 () Bool)

(assert (=> b!887217 m!826321))

(declare-fun m!826323 () Bool)

(assert (=> b!887217 m!826323))

(assert (=> b!887217 m!826311))

(assert (=> b!887217 m!826289))

(assert (=> bm!39352 m!826317))

(declare-fun m!826325 () Bool)

(assert (=> b!887216 m!826325))

(assert (=> b!887216 m!826289))

(declare-fun m!826327 () Bool)

(assert (=> b!887216 m!826327))

(assert (=> b!887216 m!826289))

(assert (=> b!887216 m!826219))

(assert (=> b!887216 m!826325))

(assert (=> b!887216 m!826219))

(declare-fun m!826329 () Bool)

(assert (=> b!887216 m!826329))

(declare-fun m!826331 () Bool)

(assert (=> bm!39347 m!826331))

(assert (=> b!887211 m!826289))

(assert (=> b!887211 m!826289))

(declare-fun m!826333 () Bool)

(assert (=> b!887211 m!826333))

(declare-fun m!826335 () Bool)

(assert (=> b!887210 m!826335))

(declare-fun m!826337 () Bool)

(assert (=> bm!39348 m!826337))

(declare-fun m!826339 () Bool)

(assert (=> b!887209 m!826339))

(declare-fun m!826341 () Bool)

(assert (=> b!887212 m!826341))

(assert (=> b!887222 m!826289))

(assert (=> b!887222 m!826289))

(assert (=> b!887222 m!826333))

(assert (=> d!109719 m!826287))

(declare-fun m!826343 () Bool)

(assert (=> bm!39351 m!826343))

(assert (=> b!887060 d!109719))

(declare-fun d!109721 () Bool)

(declare-fun res!602044 () Bool)

(declare-fun e!494077 () Bool)

(assert (=> d!109721 (=> res!602044 e!494077)))

(assert (=> d!109721 (= res!602044 (= (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) #b00000000000000000000000000000000) key!673))))

(assert (=> d!109721 (= (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000) e!494077)))

(declare-fun b!887230 () Bool)

(declare-fun e!494078 () Bool)

(assert (=> b!887230 (= e!494077 e!494078)))

(declare-fun res!602045 () Bool)

(assert (=> b!887230 (=> (not res!602045) (not e!494078))))

(assert (=> b!887230 (= res!602045 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))))

(declare-fun b!887231 () Bool)

(assert (=> b!887231 (= e!494078 (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109721 (not res!602044)) b!887230))

(assert (= (and b!887230 res!602045) b!887231))

(assert (=> d!109721 m!826289))

(declare-fun m!826345 () Bool)

(assert (=> b!887231 m!826345))

(assert (=> b!887060 d!109721))

(declare-fun d!109723 () Bool)

(declare-fun e!494079 () Bool)

(assert (=> d!109723 e!494079))

(declare-fun res!602046 () Bool)

(assert (=> d!109723 (=> res!602046 e!494079)))

(declare-fun lt!401148 () Bool)

(assert (=> d!109723 (= res!602046 (not lt!401148))))

(declare-fun lt!401145 () Bool)

(assert (=> d!109723 (= lt!401148 lt!401145)))

(declare-fun lt!401147 () Unit!30188)

(declare-fun e!494080 () Unit!30188)

(assert (=> d!109723 (= lt!401147 e!494080)))

(declare-fun c!93619 () Bool)

(assert (=> d!109723 (= c!93619 lt!401145)))

(assert (=> d!109723 (= lt!401145 (containsKey!417 (toList!5327 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015))))))

(assert (=> d!109723 (= (contains!4280 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015))) lt!401148)))

(declare-fun b!887232 () Bool)

(declare-fun lt!401146 () Unit!30188)

(assert (=> b!887232 (= e!494080 lt!401146)))

(assert (=> b!887232 (= lt!401146 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5327 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015))))))

(assert (=> b!887232 (isDefined!313 (getValueByKey!430 (toList!5327 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015))))))

(declare-fun b!887233 () Bool)

(declare-fun Unit!30194 () Unit!30188)

(assert (=> b!887233 (= e!494080 Unit!30194)))

(declare-fun b!887234 () Bool)

(assert (=> b!887234 (= e!494079 (isDefined!313 (getValueByKey!430 (toList!5327 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)))))))

(assert (= (and d!109723 c!93619) b!887232))

(assert (= (and d!109723 (not c!93619)) b!887233))

(assert (= (and d!109723 (not res!602046)) b!887234))

(assert (=> d!109723 m!826233))

(declare-fun m!826347 () Bool)

(assert (=> d!109723 m!826347))

(assert (=> b!887232 m!826233))

(declare-fun m!826349 () Bool)

(assert (=> b!887232 m!826349))

(assert (=> b!887232 m!826233))

(declare-fun m!826351 () Bool)

(assert (=> b!887232 m!826351))

(assert (=> b!887232 m!826351))

(declare-fun m!826353 () Bool)

(assert (=> b!887232 m!826353))

(assert (=> b!887234 m!826233))

(assert (=> b!887234 m!826351))

(assert (=> b!887234 m!826351))

(assert (=> b!887234 m!826353))

(assert (=> b!887060 d!109723))

(declare-fun d!109725 () Bool)

(declare-fun e!494083 () Bool)

(assert (=> d!109725 e!494083))

(declare-fun res!602049 () Bool)

(assert (=> d!109725 (=> (not res!602049) (not e!494083))))

(assert (=> d!109725 (= res!602049 (and (bvsge (index!37408 lt!401015) #b00000000000000000000000000000000) (bvslt (index!37408 lt!401015) (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833)))))))))

(declare-fun lt!401151 () Unit!30188)

(declare-fun choose!1463 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 32) Int) Unit!30188)

(assert (=> d!109725 (= lt!401151 (choose!1463 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) (index!37408 lt!401015) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))))))

(assert (=> d!109725 (validMask!0 (mask!25522 (v!11415 (underlying!533 thiss!833))))))

(assert (=> d!109725 (= (lemmaValidKeyInArrayIsInListMap!199 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) (index!37408 lt!401015) (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) lt!401151)))

(declare-fun b!887237 () Bool)

(assert (=> b!887237 (= e!494083 (contains!4280 (getCurrentListMap!2563 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833)))) (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015))))))

(assert (= (and d!109725 res!602049) b!887237))

(declare-fun m!826355 () Bool)

(assert (=> d!109725 m!826355))

(assert (=> d!109725 m!826287))

(assert (=> b!887237 m!826231))

(assert (=> b!887237 m!826233))

(assert (=> b!887237 m!826231))

(assert (=> b!887237 m!826233))

(assert (=> b!887237 m!826235))

(assert (=> b!887060 d!109725))

(declare-fun d!109727 () Bool)

(assert (=> d!109727 (arrayContainsKey!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lt!401154 () Unit!30188)

(declare-fun choose!13 (array!51623 (_ BitVec 64) (_ BitVec 32)) Unit!30188)

(assert (=> d!109727 (= lt!401154 (choose!13 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401015)))))

(assert (=> d!109727 (bvsge (index!37408 lt!401015) #b00000000000000000000000000000000)))

(assert (=> d!109727 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9804 (v!11415 (underlying!533 thiss!833))) key!673 (index!37408 lt!401015)) lt!401154)))

(declare-fun bs!24843 () Bool)

(assert (= bs!24843 d!109727))

(assert (=> bs!24843 m!826225))

(declare-fun m!826357 () Bool)

(assert (=> bs!24843 m!826357))

(assert (=> b!887060 d!109727))

(declare-fun d!109729 () Bool)

(declare-fun c!93622 () Bool)

(assert (=> d!109729 (= c!93622 ((_ is ValueCellFull!8438) (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015))))))

(declare-fun e!494086 () V!28751)

(assert (=> d!109729 (= (get!13123 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!494086)))

(declare-fun b!887242 () Bool)

(declare-fun get!13125 (ValueCell!8438 V!28751) V!28751)

(assert (=> b!887242 (= e!494086 (get!13125 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!887243 () Bool)

(declare-fun get!13126 (ValueCell!8438 V!28751) V!28751)

(assert (=> b!887243 (= e!494086 (get!13126 (select (arr!24827 (_values!5118 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401015)) (dynLambda!1285 (defaultEntry!5134 (v!11415 (underlying!533 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109729 c!93622) b!887242))

(assert (= (and d!109729 (not c!93622)) b!887243))

(assert (=> b!887242 m!826217))

(assert (=> b!887242 m!826219))

(declare-fun m!826359 () Bool)

(assert (=> b!887242 m!826359))

(assert (=> b!887243 m!826217))

(assert (=> b!887243 m!826219))

(declare-fun m!826361 () Bool)

(assert (=> b!887243 m!826361))

(assert (=> b!887060 d!109729))

(declare-fun d!109731 () Bool)

(assert (=> d!109731 (= (apply!393 (ite c!93570 call!39311 call!39314) key!673) (get!13124 (getValueByKey!430 (toList!5327 (ite c!93570 call!39311 call!39314)) key!673)))))

(declare-fun bs!24844 () Bool)

(assert (= bs!24844 d!109731))

(declare-fun m!826363 () Bool)

(assert (=> bs!24844 m!826363))

(assert (=> bs!24844 m!826363))

(declare-fun m!826365 () Bool)

(assert (=> bs!24844 m!826365))

(assert (=> bm!39311 d!109731))

(assert (=> bm!39308 d!109719))

(assert (=> b!887059 d!109729))

(assert (=> b!887066 d!109721))

(declare-fun b!887256 () Bool)

(declare-fun c!93630 () Bool)

(declare-fun lt!401166 () (_ BitVec 64))

(assert (=> b!887256 (= c!93630 (= lt!401166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!494095 () SeekEntryResult!8759)

(declare-fun e!494094 () SeekEntryResult!8759)

(assert (=> b!887256 (= e!494095 e!494094)))

(declare-fun b!887257 () Bool)

(declare-fun lt!401165 () SeekEntryResult!8759)

(assert (=> b!887257 (= e!494094 (MissingZero!8759 (index!37409 lt!401165)))))

(declare-fun b!887258 () Bool)

(declare-fun e!494093 () SeekEntryResult!8759)

(assert (=> b!887258 (= e!494093 Undefined!8759)))

(declare-fun b!887259 () Bool)

(assert (=> b!887259 (= e!494093 e!494095)))

(assert (=> b!887259 (= lt!401166 (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37409 lt!401165)))))

(declare-fun c!93629 () Bool)

(assert (=> b!887259 (= c!93629 (= lt!401166 key!673))))

(declare-fun d!109733 () Bool)

(declare-fun lt!401163 () SeekEntryResult!8759)

(assert (=> d!109733 (and (or ((_ is MissingVacant!8759) lt!401163) (not ((_ is Found!8759) lt!401163)) (and (bvsge (index!37408 lt!401163) #b00000000000000000000000000000000) (bvslt (index!37408 lt!401163) (size!25270 (_keys!9804 (v!11415 (underlying!533 thiss!833))))))) (not ((_ is MissingVacant!8759) lt!401163)) (or (not ((_ is Found!8759) lt!401163)) (= (select (arr!24828 (_keys!9804 (v!11415 (underlying!533 thiss!833)))) (index!37408 lt!401163)) key!673)))))

(assert (=> d!109733 (= lt!401163 e!494093)))

(declare-fun c!93631 () Bool)

(assert (=> d!109733 (= c!93631 (and ((_ is Intermediate!8759) lt!401165) (undefined!9571 lt!401165)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51623 (_ BitVec 32)) SeekEntryResult!8759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!109733 (= lt!401165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!673 (mask!25522 (v!11415 (underlying!533 thiss!833)))) key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(assert (=> d!109733 (validMask!0 (mask!25522 (v!11415 (underlying!533 thiss!833))))))

(assert (=> d!109733 (= (seekEntry!0 key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))) lt!401163)))

(declare-fun b!887260 () Bool)

(assert (=> b!887260 (= e!494095 (Found!8759 (index!37409 lt!401165)))))

(declare-fun b!887261 () Bool)

(declare-fun lt!401164 () SeekEntryResult!8759)

(assert (=> b!887261 (= e!494094 (ite ((_ is MissingVacant!8759) lt!401164) (MissingZero!8759 (index!37410 lt!401164)) lt!401164))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51623 (_ BitVec 32)) SeekEntryResult!8759)

(assert (=> b!887261 (= lt!401164 (seekKeyOrZeroReturnVacant!0 (x!75234 lt!401165) (index!37409 lt!401165) (index!37409 lt!401165) key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(assert (= (and d!109733 c!93631) b!887258))

(assert (= (and d!109733 (not c!93631)) b!887259))

(assert (= (and b!887259 c!93629) b!887260))

(assert (= (and b!887259 (not c!93629)) b!887256))

(assert (= (and b!887256 c!93630) b!887257))

(assert (= (and b!887256 (not c!93630)) b!887261))

(declare-fun m!826367 () Bool)

(assert (=> b!887259 m!826367))

(declare-fun m!826369 () Bool)

(assert (=> d!109733 m!826369))

(declare-fun m!826371 () Bool)

(assert (=> d!109733 m!826371))

(assert (=> d!109733 m!826371))

(declare-fun m!826373 () Bool)

(assert (=> d!109733 m!826373))

(assert (=> d!109733 m!826287))

(declare-fun m!826375 () Bool)

(assert (=> b!887261 m!826375))

(assert (=> b!887064 d!109733))

(declare-fun d!109735 () Bool)

(declare-fun e!494098 () Bool)

(assert (=> d!109735 e!494098))

(declare-fun res!602052 () Bool)

(assert (=> d!109735 (=> res!602052 e!494098)))

(declare-fun lt!401172 () SeekEntryResult!8759)

(assert (=> d!109735 (= res!602052 (not ((_ is Found!8759) lt!401172)))))

(assert (=> d!109735 (= lt!401172 (seekEntry!0 key!673 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(declare-fun lt!401171 () Unit!30188)

(declare-fun choose!1464 (array!51623 array!51621 (_ BitVec 32) (_ BitVec 32) V!28751 V!28751 (_ BitVec 64)) Unit!30188)

(assert (=> d!109735 (= lt!401171 (choose!1464 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673))))

(assert (=> d!109735 (validMask!0 (mask!25522 (v!11415 (underlying!533 thiss!833))))))

(assert (=> d!109735 (= (lemmaSeekEntryGivesInRangeIndex!1 (_keys!9804 (v!11415 (underlying!533 thiss!833))) (_values!5118 (v!11415 (underlying!533 thiss!833))) (mask!25522 (v!11415 (underlying!533 thiss!833))) (extraKeys!4827 (v!11415 (underlying!533 thiss!833))) (zeroValue!4931 (v!11415 (underlying!533 thiss!833))) (minValue!4931 (v!11415 (underlying!533 thiss!833))) key!673) lt!401171)))

(declare-fun b!887264 () Bool)

(assert (=> b!887264 (= e!494098 (inRange!0 (index!37408 lt!401172) (mask!25522 (v!11415 (underlying!533 thiss!833)))))))

(assert (= (and d!109735 (not res!602052)) b!887264))

(assert (=> d!109735 m!826237))

(declare-fun m!826377 () Bool)

(assert (=> d!109735 m!826377))

(assert (=> d!109735 m!826287))

(declare-fun m!826379 () Bool)

(assert (=> b!887264 m!826379))

(assert (=> b!887064 d!109735))

(assert (=> d!109697 d!109707))

(declare-fun d!109737 () Bool)

(assert (=> d!109737 (= (get!13124 (getValueByKey!430 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833)))) key!673)) (v!11416 (getValueByKey!430 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833)))) key!673)))))

(assert (=> b!887065 d!109737))

(declare-fun b!887265 () Bool)

(declare-fun e!494099 () Option!436)

(assert (=> b!887265 (= e!494099 (Some!435 (_2!5979 (h!18813 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833))))))))))

(declare-fun b!887266 () Bool)

(declare-fun e!494100 () Option!436)

(assert (=> b!887266 (= e!494099 e!494100)))

(declare-fun c!93633 () Bool)

(assert (=> b!887266 (= c!93633 (and ((_ is Cons!17682) (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833))))) (not (= (_1!5979 (h!18813 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833)))))) key!673))))))

(declare-fun b!887267 () Bool)

(assert (=> b!887267 (= e!494100 (getValueByKey!430 (t!24960 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833))))) key!673))))

(declare-fun b!887268 () Bool)

(assert (=> b!887268 (= e!494100 None!434)))

(declare-fun d!109739 () Bool)

(declare-fun c!93632 () Bool)

(assert (=> d!109739 (= c!93632 (and ((_ is Cons!17682) (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833))))) (= (_1!5979 (h!18813 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833)))))) key!673)))))

(assert (=> d!109739 (= (getValueByKey!430 (toList!5327 (map!12064 (v!11415 (underlying!533 thiss!833)))) key!673) e!494099)))

(assert (= (and d!109739 c!93632) b!887265))

(assert (= (and d!109739 (not c!93632)) b!887266))

(assert (= (and b!887266 c!93633) b!887267))

(assert (= (and b!887266 (not c!93633)) b!887268))

(declare-fun m!826381 () Bool)

(assert (=> b!887267 m!826381))

(assert (=> b!887065 d!109739))

(assert (=> b!887065 d!109713))

(declare-fun b!887269 () Bool)

(declare-fun e!494101 () Option!436)

(assert (=> b!887269 (= e!494101 (Some!435 (_2!5979 (h!18813 (t!24960 (toList!5327 (map!12062 thiss!833)))))))))

(declare-fun b!887270 () Bool)

(declare-fun e!494102 () Option!436)

(assert (=> b!887270 (= e!494101 e!494102)))

(declare-fun c!93635 () Bool)

(assert (=> b!887270 (= c!93635 (and ((_ is Cons!17682) (t!24960 (toList!5327 (map!12062 thiss!833)))) (not (= (_1!5979 (h!18813 (t!24960 (toList!5327 (map!12062 thiss!833))))) key!673))))))

(declare-fun b!887271 () Bool)

(assert (=> b!887271 (= e!494102 (getValueByKey!430 (t!24960 (t!24960 (toList!5327 (map!12062 thiss!833)))) key!673))))

(declare-fun b!887272 () Bool)

(assert (=> b!887272 (= e!494102 None!434)))

(declare-fun d!109741 () Bool)

(declare-fun c!93634 () Bool)

(assert (=> d!109741 (= c!93634 (and ((_ is Cons!17682) (t!24960 (toList!5327 (map!12062 thiss!833)))) (= (_1!5979 (h!18813 (t!24960 (toList!5327 (map!12062 thiss!833))))) key!673)))))

(assert (=> d!109741 (= (getValueByKey!430 (t!24960 (toList!5327 (map!12062 thiss!833))) key!673) e!494101)))

(assert (= (and d!109741 c!93634) b!887269))

(assert (= (and d!109741 (not c!93634)) b!887270))

(assert (= (and b!887270 c!93635) b!887271))

(assert (= (and b!887270 (not c!93635)) b!887272))

(declare-fun m!826383 () Bool)

(assert (=> b!887271 m!826383))

(assert (=> b!887084 d!109741))

(declare-fun b!887274 () Bool)

(declare-fun e!494104 () Bool)

(assert (=> b!887274 (= e!494104 tp_is_empty!17839)))

(declare-fun mapNonEmpty!28288 () Bool)

(declare-fun mapRes!28288 () Bool)

(declare-fun tp!54484 () Bool)

(declare-fun e!494103 () Bool)

(assert (=> mapNonEmpty!28288 (= mapRes!28288 (and tp!54484 e!494103))))

(declare-fun mapKey!28288 () (_ BitVec 32))

(declare-fun mapRest!28288 () (Array (_ BitVec 32) ValueCell!8438))

(declare-fun mapValue!28288 () ValueCell!8438)

(assert (=> mapNonEmpty!28288 (= mapRest!28287 (store mapRest!28288 mapKey!28288 mapValue!28288))))

(declare-fun b!887273 () Bool)

(assert (=> b!887273 (= e!494103 tp_is_empty!17839)))

(declare-fun condMapEmpty!28288 () Bool)

(declare-fun mapDefault!28288 () ValueCell!8438)

(assert (=> mapNonEmpty!28287 (= condMapEmpty!28288 (= mapRest!28287 ((as const (Array (_ BitVec 32) ValueCell!8438)) mapDefault!28288)))))

(assert (=> mapNonEmpty!28287 (= tp!54483 (and e!494104 mapRes!28288))))

(declare-fun mapIsEmpty!28288 () Bool)

(assert (=> mapIsEmpty!28288 mapRes!28288))

(assert (= (and mapNonEmpty!28287 condMapEmpty!28288) mapIsEmpty!28288))

(assert (= (and mapNonEmpty!28287 (not condMapEmpty!28288)) mapNonEmpty!28288))

(assert (= (and mapNonEmpty!28288 ((_ is ValueCellFull!8438) mapValue!28288)) b!887273))

(assert (= (and mapNonEmpty!28287 ((_ is ValueCellFull!8438) mapDefault!28288)) b!887274))

(declare-fun m!826385 () Bool)

(assert (=> mapNonEmpty!28288 m!826385))

(declare-fun b_lambda!12825 () Bool)

(assert (= b_lambda!12823 (or (and b!886966 b_free!15511) b_lambda!12825)))

(declare-fun b_lambda!12827 () Bool)

(assert (= b_lambda!12821 (or (and b!886966 b_free!15511) b_lambda!12827)))

(check-sat (not bm!39347) (not b!887271) (not d!109715) (not b!887242) (not d!109723) (not b_lambda!12819) (not b!887157) (not d!109733) (not mapNonEmpty!28288) tp_is_empty!17839 (not b_lambda!12813) (not b!887115) (not bm!39330) (not bm!39348) (not bm!39329) (not b!887237) (not d!109731) (not bm!39351) (not b!887232) (not b!887131) (not b!887261) (not b!887222) (not b!887264) (not bm!39352) (not b!887209) (not b_lambda!12827) (not bm!39318) (not b!887217) (not b!887216) (not d!109719) (not d!109725) (not b!887211) (not b!887212) (not b!887114) (not b_lambda!12815) (not d!109705) (not b!887234) (not b!887130) (not b!887267) (not d!109717) (not bm!39320) (not bm!39319) (not b!887139) (not b!887118) (not d!109727) (not b!887132) (not b!887243) (not d!109713) (not b!887231) (not b!887210) (not d!109735) b_and!25709 (not b_next!15511) (not b!887156) (not b!887218) (not b_lambda!12817) (not b_lambda!12825) (not b_lambda!12811) (not d!109707) (not b!887141))
(check-sat b_and!25709 (not b_next!15511))
