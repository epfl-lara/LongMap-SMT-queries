; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75314 () Bool)

(assert start!75314)

(declare-fun b!887228 () Bool)

(declare-fun b_free!15513 () Bool)

(declare-fun b_next!15513 () Bool)

(assert (=> b!887228 (= b_free!15513 (not b_next!15513))))

(declare-fun tp!54473 () Bool)

(declare-fun b_and!25719 () Bool)

(assert (=> b!887228 (= tp!54473 b_and!25719)))

(declare-fun b!887225 () Bool)

(declare-fun e!494063 () Bool)

(declare-fun e!494069 () Bool)

(assert (=> b!887225 (= e!494063 e!494069)))

(declare-fun res!602082 () Bool)

(assert (=> b!887225 (=> (not res!602082) (not e!494069))))

(declare-datatypes ((V!28753 0))(
  ( (V!28754 (val!8971 Int)) )
))
(declare-datatypes ((ValueCell!8439 0))(
  ( (ValueCellFull!8439 (v!11423 V!28753)) (EmptyCell!8439) )
))
(declare-datatypes ((array!51642 0))(
  ( (array!51643 (arr!24837 (Array (_ BitVec 32) ValueCell!8439)) (size!25277 (_ BitVec 32))) )
))
(declare-datatypes ((array!51644 0))(
  ( (array!51645 (arr!24838 (Array (_ BitVec 32) (_ BitVec 64))) (size!25278 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3894 0))(
  ( (LongMapFixedSize!3895 (defaultEntry!5135 Int) (mask!25530 (_ BitVec 32)) (extraKeys!4828 (_ BitVec 32)) (zeroValue!4932 V!28753) (minValue!4932 V!28753) (_size!2002 (_ BitVec 32)) (_keys!9810 array!51644) (_values!5119 array!51642) (_vacant!2002 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1054 0))(
  ( (Cell!1055 (v!11424 LongMapFixedSize!3894)) )
))
(declare-datatypes ((LongMap!1054 0))(
  ( (LongMap!1055 (underlying!538 Cell!1054)) )
))
(declare-fun thiss!833 () LongMap!1054)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun contains!4303 (LongMap!1054 (_ BitVec 64)) Bool)

(assert (=> b!887225 (= res!602082 (contains!4303 thiss!833 key!673))))

(declare-fun lt!401215 () V!28753)

(declare-fun apply!391 (LongMapFixedSize!3894 (_ BitVec 64)) V!28753)

(assert (=> b!887225 (= lt!401215 (apply!391 (v!11424 (underlying!538 thiss!833)) key!673))))

(declare-fun b!887226 () Bool)

(declare-fun e!494070 () Bool)

(declare-fun e!494067 () Bool)

(assert (=> b!887226 (= e!494070 e!494067)))

(declare-fun mapNonEmpty!28281 () Bool)

(declare-fun mapRes!28281 () Bool)

(declare-fun tp!54472 () Bool)

(declare-fun e!494068 () Bool)

(assert (=> mapNonEmpty!28281 (= mapRes!28281 (and tp!54472 e!494068))))

(declare-fun mapRest!28281 () (Array (_ BitVec 32) ValueCell!8439))

(declare-fun mapKey!28281 () (_ BitVec 32))

(declare-fun mapValue!28281 () ValueCell!8439)

(assert (=> mapNonEmpty!28281 (= (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (store mapRest!28281 mapKey!28281 mapValue!28281))))

(declare-fun b!887227 () Bool)

(declare-fun tp_is_empty!17841 () Bool)

(assert (=> b!887227 (= e!494068 tp_is_empty!17841)))

(declare-fun e!494065 () Bool)

(declare-fun array_inv!19550 (array!51644) Bool)

(declare-fun array_inv!19551 (array!51642) Bool)

(assert (=> b!887228 (= e!494067 (and tp!54473 tp_is_empty!17841 (array_inv!19550 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (array_inv!19551 (_values!5119 (v!11424 (underlying!538 thiss!833)))) e!494065))))

(declare-fun b!887229 () Bool)

(declare-fun e!494064 () Bool)

(assert (=> b!887229 (= e!494064 tp_is_empty!17841)))

(declare-fun b!887230 () Bool)

(assert (=> b!887230 (= e!494065 (and e!494064 mapRes!28281))))

(declare-fun condMapEmpty!28281 () Bool)

(declare-fun mapDefault!28281 () ValueCell!8439)

(assert (=> b!887230 (= condMapEmpty!28281 (= (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) ((as const (Array (_ BitVec 32) ValueCell!8439)) mapDefault!28281)))))

(declare-fun res!602083 () Bool)

(assert (=> start!75314 (=> (not res!602083) (not e!494063))))

(declare-fun valid!1516 (LongMap!1054) Bool)

(assert (=> start!75314 (= res!602083 (valid!1516 thiss!833))))

(assert (=> start!75314 e!494063))

(declare-fun e!494062 () Bool)

(assert (=> start!75314 e!494062))

(assert (=> start!75314 true))

(declare-fun b!887231 () Bool)

(declare-datatypes ((Option!439 0))(
  ( (Some!438 (v!11425 V!28753)) (None!437) )
))
(declare-fun isDefined!315 (Option!439) Bool)

(declare-datatypes ((tuple2!11918 0))(
  ( (tuple2!11919 (_1!5970 (_ BitVec 64)) (_2!5970 V!28753)) )
))
(declare-datatypes ((List!17679 0))(
  ( (Nil!17676) (Cons!17675 (h!18806 tuple2!11918) (t!24962 List!17679)) )
))
(declare-fun getValueByKey!433 (List!17679 (_ BitVec 64)) Option!439)

(declare-datatypes ((ListLongMap!10615 0))(
  ( (ListLongMap!10616 (toList!5323 List!17679)) )
))
(declare-fun map!12083 (LongMap!1054) ListLongMap!10615)

(assert (=> b!887231 (= e!494069 (not (isDefined!315 (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673))))))

(declare-fun b!887232 () Bool)

(assert (=> b!887232 (= e!494062 e!494070)))

(declare-fun mapIsEmpty!28281 () Bool)

(assert (=> mapIsEmpty!28281 mapRes!28281))

(assert (= (and start!75314 res!602083) b!887225))

(assert (= (and b!887225 res!602082) b!887231))

(assert (= (and b!887230 condMapEmpty!28281) mapIsEmpty!28281))

(assert (= (and b!887230 (not condMapEmpty!28281)) mapNonEmpty!28281))

(get-info :version)

(assert (= (and mapNonEmpty!28281 ((_ is ValueCellFull!8439) mapValue!28281)) b!887227))

(assert (= (and b!887230 ((_ is ValueCellFull!8439) mapDefault!28281)) b!887229))

(assert (= b!887228 b!887230))

(assert (= b!887226 b!887228))

(assert (= b!887232 b!887226))

(assert (= start!75314 b!887232))

(declare-fun m!826925 () Bool)

(assert (=> b!887228 m!826925))

(declare-fun m!826927 () Bool)

(assert (=> b!887228 m!826927))

(declare-fun m!826929 () Bool)

(assert (=> b!887225 m!826929))

(declare-fun m!826931 () Bool)

(assert (=> b!887225 m!826931))

(declare-fun m!826933 () Bool)

(assert (=> b!887231 m!826933))

(declare-fun m!826935 () Bool)

(assert (=> b!887231 m!826935))

(assert (=> b!887231 m!826935))

(declare-fun m!826937 () Bool)

(assert (=> b!887231 m!826937))

(declare-fun m!826939 () Bool)

(assert (=> start!75314 m!826939))

(declare-fun m!826941 () Bool)

(assert (=> mapNonEmpty!28281 m!826941))

(check-sat b_and!25719 (not b!887225) tp_is_empty!17841 (not b_next!15513) (not b!887231) (not b!887228) (not start!75314) (not mapNonEmpty!28281))
(check-sat b_and!25719 (not b_next!15513))
(get-model)

(declare-fun d!109887 () Bool)

(declare-fun lt!401221 () Bool)

(declare-fun contains!4305 (ListLongMap!10615 (_ BitVec 64)) Bool)

(assert (=> d!109887 (= lt!401221 (contains!4305 (map!12083 thiss!833) key!673))))

(declare-fun contains!4306 (LongMapFixedSize!3894 (_ BitVec 64)) Bool)

(assert (=> d!109887 (= lt!401221 (contains!4306 (v!11424 (underlying!538 thiss!833)) key!673))))

(assert (=> d!109887 (valid!1516 thiss!833)))

(assert (=> d!109887 (= (contains!4303 thiss!833 key!673) lt!401221)))

(declare-fun bs!24871 () Bool)

(assert (= bs!24871 d!109887))

(assert (=> bs!24871 m!826933))

(assert (=> bs!24871 m!826933))

(declare-fun m!826961 () Bool)

(assert (=> bs!24871 m!826961))

(declare-fun m!826963 () Bool)

(assert (=> bs!24871 m!826963))

(assert (=> bs!24871 m!826939))

(assert (=> b!887225 d!109887))

(declare-fun b!887293 () Bool)

(declare-fun e!494128 () Bool)

(declare-fun e!494126 () Bool)

(assert (=> b!887293 (= e!494128 e!494126)))

(declare-fun res!602098 () Bool)

(assert (=> b!887293 (= res!602098 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887293 (=> (not res!602098) (not e!494126))))

(declare-fun e!494122 () Bool)

(declare-fun b!887294 () Bool)

(declare-fun lt!401245 () V!28753)

(declare-fun get!13121 (Option!439) V!28753)

(declare-fun map!12085 (LongMapFixedSize!3894) ListLongMap!10615)

(assert (=> b!887294 (= e!494122 (= lt!401245 (get!13121 (getValueByKey!433 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833)))) key!673))))))

(declare-fun b!887295 () Bool)

(declare-fun e!494124 () Bool)

(assert (=> b!887295 (= e!494128 e!494124)))

(declare-fun c!93632 () Bool)

(assert (=> b!887295 (= c!93632 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887296 () Bool)

(declare-fun res!602100 () Bool)

(declare-fun e!494121 () Bool)

(assert (=> b!887296 (=> (not res!602100) (not e!494121))))

(assert (=> b!887296 (= res!602100 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!887296 (= e!494124 e!494121)))

(declare-fun call!39337 () ListLongMap!10615)

(declare-fun c!93634 () Bool)

(declare-fun call!39340 () ListLongMap!10615)

(declare-fun call!39338 () V!28753)

(declare-fun bm!39334 () Bool)

(declare-fun apply!393 (ListLongMap!10615 (_ BitVec 64)) V!28753)

(assert (=> bm!39334 (= call!39338 (apply!393 (ite c!93634 call!39340 call!39337) key!673))))

(declare-fun bm!39335 () Bool)

(assert (=> bm!39335 (= call!39337 call!39340)))

(declare-fun b!887297 () Bool)

(declare-fun e!494120 () V!28753)

(declare-fun e!494125 () V!28753)

(assert (=> b!887297 (= e!494120 e!494125)))

(declare-fun c!93631 () Bool)

(assert (=> b!887297 (= c!93631 (and (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!887298 () Bool)

(declare-fun e!494127 () V!28753)

(declare-fun dynLambda!1286 (Int (_ BitVec 64)) V!28753)

(assert (=> b!887298 (= e!494127 (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) key!673))))

(declare-fun b!887299 () Bool)

(declare-fun c!93630 () Bool)

(assert (=> b!887299 (= c!93630 (and (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun e!494123 () V!28753)

(assert (=> b!887299 (= e!494125 e!494123)))

(declare-fun b!887300 () Bool)

(assert (=> b!887300 (= e!494122 (= lt!401245 (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) key!673)))))

(declare-fun b!887301 () Bool)

(assert (=> b!887301 (= e!494123 (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) key!673))))

(declare-fun b!887302 () Bool)

(declare-fun call!39339 () V!28753)

(assert (=> b!887302 (= e!494121 (= call!39339 (minValue!4932 (v!11424 (underlying!538 thiss!833)))))))

(declare-datatypes ((SeekEntryResult!8763 0))(
  ( (MissingZero!8763 (index!37423 (_ BitVec 32))) (Found!8763 (index!37424 (_ BitVec 32))) (Intermediate!8763 (undefined!9575 Bool) (index!37425 (_ BitVec 32)) (x!75243 (_ BitVec 32))) (Undefined!8763) (MissingVacant!8763 (index!37426 (_ BitVec 32))) )
))
(declare-fun lt!401252 () SeekEntryResult!8763)

(declare-fun b!887303 () Bool)

(declare-fun e!494129 () Bool)

(declare-fun get!13122 (ValueCell!8439 V!28753) V!28753)

(assert (=> b!887303 (= e!494129 (= call!39339 (get!13122 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!887304 () Bool)

(declare-datatypes ((Unit!30246 0))(
  ( (Unit!30247) )
))
(declare-fun lt!401253 () Unit!30246)

(declare-fun lt!401251 () Unit!30246)

(assert (=> b!887304 (= lt!401253 lt!401251)))

(assert (=> b!887304 e!494128))

(assert (=> b!887304 (= c!93634 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lemmaKeyInListMapThenSameValueInArray!1 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 64) (_ BitVec 32) Int) Unit!30246)

(assert (=> b!887304 (= lt!401251 (lemmaKeyInListMapThenSameValueInArray!1 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401252) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401248 () Unit!30246)

(declare-fun lt!401254 () Unit!30246)

(assert (=> b!887304 (= lt!401248 lt!401254)))

(declare-fun getCurrentListMap!2612 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 32) Int) ListLongMap!10615)

(assert (=> b!887304 (contains!4305 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!201 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 32) Int) Unit!30246)

(assert (=> b!887304 (= lt!401254 (lemmaValidKeyInArrayIsInListMap!201 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) (index!37424 lt!401252) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401246 () Unit!30246)

(declare-fun lt!401247 () Unit!30246)

(assert (=> b!887304 (= lt!401246 lt!401247)))

(declare-fun arrayContainsKey!0 (array!51644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!887304 (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51644 (_ BitVec 64) (_ BitVec 32)) Unit!30246)

(assert (=> b!887304 (= lt!401247 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401252)))))

(assert (=> b!887304 (= e!494127 (get!13122 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39336 () Bool)

(assert (=> bm!39336 (= call!39339 call!39338)))

(declare-fun b!887305 () Bool)

(assert (=> b!887305 (= e!494125 (zeroValue!4932 (v!11424 (underlying!538 thiss!833))))))

(declare-fun b!887306 () Bool)

(declare-fun e!494130 () Bool)

(declare-fun lt!401244 () SeekEntryResult!8763)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!887306 (= e!494130 (inRange!0 (index!37424 lt!401244) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887307 () Bool)

(declare-fun res!602101 () Bool)

(assert (=> b!887307 (=> (not res!602101) (not e!494129))))

(assert (=> b!887307 (= res!602101 (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (=> b!887307 (= e!494124 e!494129)))

(declare-fun b!887308 () Bool)

(assert (=> b!887308 (= e!494126 (= call!39338 (zeroValue!4932 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887309 () Bool)

(assert (=> b!887309 (= e!494120 e!494127)))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51644 (_ BitVec 32)) SeekEntryResult!8763)

(assert (=> b!887309 (= lt!401252 (seekEntry!0 key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401250 () Unit!30246)

(declare-fun lemmaSeekEntryGivesInRangeIndex!1 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 64)) Unit!30246)

(assert (=> b!887309 (= lt!401250 (lemmaSeekEntryGivesInRangeIndex!1 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673))))

(assert (=> b!887309 (= lt!401244 (seekEntry!0 key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun res!602099 () Bool)

(assert (=> b!887309 (= res!602099 (not ((_ is Found!8763) lt!401244)))))

(assert (=> b!887309 (=> res!602099 e!494130)))

(assert (=> b!887309 e!494130))

(declare-fun lt!401249 () Unit!30246)

(assert (=> b!887309 (= lt!401249 lt!401250)))

(declare-fun c!93633 () Bool)

(assert (=> b!887309 (= c!93633 ((_ is Found!8763) lt!401252))))

(declare-fun d!109889 () Bool)

(assert (=> d!109889 e!494122))

(declare-fun c!93629 () Bool)

(assert (=> d!109889 (= c!93629 (contains!4306 (v!11424 (underlying!538 thiss!833)) key!673))))

(assert (=> d!109889 (= lt!401245 e!494120)))

(declare-fun c!93635 () Bool)

(assert (=> d!109889 (= c!93635 (= key!673 (bvneg key!673)))))

(declare-fun valid!1518 (LongMapFixedSize!3894) Bool)

(assert (=> d!109889 (valid!1518 (v!11424 (underlying!538 thiss!833)))))

(assert (=> d!109889 (= (apply!391 (v!11424 (underlying!538 thiss!833)) key!673) lt!401245)))

(declare-fun b!887310 () Bool)

(assert (=> b!887310 (= e!494123 (minValue!4932 (v!11424 (underlying!538 thiss!833))))))

(declare-fun bm!39337 () Bool)

(assert (=> bm!39337 (= call!39340 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(assert (= (and d!109889 c!93635) b!887297))

(assert (= (and d!109889 (not c!93635)) b!887309))

(assert (= (and b!887297 c!93631) b!887305))

(assert (= (and b!887297 (not c!93631)) b!887299))

(assert (= (and b!887299 c!93630) b!887310))

(assert (= (and b!887299 (not c!93630)) b!887301))

(assert (= (and b!887309 (not res!602099)) b!887306))

(assert (= (and b!887309 c!93633) b!887304))

(assert (= (and b!887309 (not c!93633)) b!887298))

(assert (= (and b!887304 c!93634) b!887293))

(assert (= (and b!887304 (not c!93634)) b!887295))

(assert (= (and b!887293 res!602098) b!887308))

(assert (= (and b!887295 c!93632) b!887296))

(assert (= (and b!887295 (not c!93632)) b!887307))

(assert (= (and b!887296 res!602100) b!887302))

(assert (= (and b!887307 res!602101) b!887303))

(assert (= (or b!887302 b!887303) bm!39335))

(assert (= (or b!887302 b!887303) bm!39336))

(assert (= (or b!887308 bm!39335) bm!39337))

(assert (= (or b!887308 bm!39336) bm!39334))

(assert (= (and d!109889 c!93629) b!887294))

(assert (= (and d!109889 (not c!93629)) b!887300))

(declare-fun b_lambda!12819 () Bool)

(assert (=> (not b_lambda!12819) (not b!887298)))

(declare-fun t!24965 () Bool)

(declare-fun tb!5135 () Bool)

(assert (=> (and b!887228 (= (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) t!24965) tb!5135))

(declare-fun result!9965 () Bool)

(assert (=> tb!5135 (= result!9965 tp_is_empty!17841)))

(assert (=> b!887298 t!24965))

(declare-fun b_and!25723 () Bool)

(assert (= b_and!25719 (and (=> t!24965 result!9965) b_and!25723)))

(declare-fun b_lambda!12821 () Bool)

(assert (=> (not b_lambda!12821) (not b!887303)))

(declare-fun t!24967 () Bool)

(declare-fun tb!5137 () Bool)

(assert (=> (and b!887228 (= (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) t!24967) tb!5137))

(declare-fun result!9969 () Bool)

(assert (=> tb!5137 (= result!9969 tp_is_empty!17841)))

(assert (=> b!887303 t!24967))

(declare-fun b_and!25725 () Bool)

(assert (= b_and!25723 (and (=> t!24967 result!9969) b_and!25725)))

(declare-fun b_lambda!12823 () Bool)

(assert (=> (not b_lambda!12823) (not b!887304)))

(assert (=> b!887304 t!24967))

(declare-fun b_and!25727 () Bool)

(assert (= b_and!25725 (and (=> t!24967 result!9969) b_and!25727)))

(declare-fun b_lambda!12825 () Bool)

(assert (=> (not b_lambda!12825) (not b!887301)))

(assert (=> b!887301 t!24965))

(declare-fun b_and!25729 () Bool)

(assert (= b_and!25727 (and (=> t!24965 result!9965) b_and!25729)))

(declare-fun b_lambda!12827 () Bool)

(assert (=> (not b_lambda!12827) (not b!887300)))

(assert (=> b!887300 t!24965))

(declare-fun b_and!25731 () Bool)

(assert (= b_and!25729 (and (=> t!24965 result!9965) b_and!25731)))

(declare-fun m!826965 () Bool)

(assert (=> b!887309 m!826965))

(declare-fun m!826967 () Bool)

(assert (=> b!887309 m!826967))

(declare-fun m!826969 () Bool)

(assert (=> bm!39337 m!826969))

(assert (=> d!109889 m!826963))

(declare-fun m!826971 () Bool)

(assert (=> d!109889 m!826971))

(declare-fun m!826973 () Bool)

(assert (=> b!887306 m!826973))

(declare-fun m!826975 () Bool)

(assert (=> b!887294 m!826975))

(declare-fun m!826977 () Bool)

(assert (=> b!887294 m!826977))

(assert (=> b!887294 m!826977))

(declare-fun m!826979 () Bool)

(assert (=> b!887294 m!826979))

(declare-fun m!826981 () Bool)

(assert (=> b!887304 m!826981))

(declare-fun m!826983 () Bool)

(assert (=> b!887304 m!826983))

(declare-fun m!826985 () Bool)

(assert (=> b!887304 m!826985))

(declare-fun m!826987 () Bool)

(assert (=> b!887304 m!826987))

(declare-fun m!826989 () Bool)

(assert (=> b!887304 m!826989))

(assert (=> b!887304 m!826969))

(assert (=> b!887304 m!826987))

(declare-fun m!826991 () Bool)

(assert (=> b!887304 m!826991))

(declare-fun m!826993 () Bool)

(assert (=> b!887304 m!826993))

(declare-fun m!826995 () Bool)

(assert (=> b!887304 m!826995))

(assert (=> b!887304 m!826969))

(assert (=> b!887304 m!826985))

(assert (=> b!887304 m!826983))

(declare-fun m!826997 () Bool)

(assert (=> b!887304 m!826997))

(declare-fun m!826999 () Bool)

(assert (=> b!887300 m!826999))

(assert (=> b!887298 m!826999))

(declare-fun m!827001 () Bool)

(assert (=> bm!39334 m!827001))

(assert (=> b!887303 m!826985))

(assert (=> b!887303 m!826983))

(assert (=> b!887303 m!826985))

(assert (=> b!887303 m!826983))

(assert (=> b!887303 m!826997))

(assert (=> b!887301 m!826999))

(assert (=> b!887307 m!826981))

(assert (=> b!887225 d!109889))

(declare-fun d!109891 () Bool)

(declare-fun isEmpty!674 (Option!439) Bool)

(assert (=> d!109891 (= (isDefined!315 (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673)) (not (isEmpty!674 (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673))))))

(declare-fun bs!24872 () Bool)

(assert (= bs!24872 d!109891))

(assert (=> bs!24872 m!826935))

(declare-fun m!827003 () Bool)

(assert (=> bs!24872 m!827003))

(assert (=> b!887231 d!109891))

(declare-fun b!887321 () Bool)

(declare-fun e!494135 () Option!439)

(assert (=> b!887321 (= e!494135 (Some!438 (_2!5970 (h!18806 (toList!5323 (map!12083 thiss!833))))))))

(declare-fun b!887323 () Bool)

(declare-fun e!494136 () Option!439)

(assert (=> b!887323 (= e!494136 (getValueByKey!433 (t!24962 (toList!5323 (map!12083 thiss!833))) key!673))))

(declare-fun b!887322 () Bool)

(assert (=> b!887322 (= e!494135 e!494136)))

(declare-fun c!93641 () Bool)

(assert (=> b!887322 (= c!93641 (and ((_ is Cons!17675) (toList!5323 (map!12083 thiss!833))) (not (= (_1!5970 (h!18806 (toList!5323 (map!12083 thiss!833)))) key!673))))))

(declare-fun d!109893 () Bool)

(declare-fun c!93640 () Bool)

(assert (=> d!109893 (= c!93640 (and ((_ is Cons!17675) (toList!5323 (map!12083 thiss!833))) (= (_1!5970 (h!18806 (toList!5323 (map!12083 thiss!833)))) key!673)))))

(assert (=> d!109893 (= (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673) e!494135)))

(declare-fun b!887324 () Bool)

(assert (=> b!887324 (= e!494136 None!437)))

(assert (= (and d!109893 c!93640) b!887321))

(assert (= (and d!109893 (not c!93640)) b!887322))

(assert (= (and b!887322 c!93641) b!887323))

(assert (= (and b!887322 (not c!93641)) b!887324))

(declare-fun m!827005 () Bool)

(assert (=> b!887323 m!827005))

(assert (=> b!887231 d!109893))

(declare-fun d!109895 () Bool)

(assert (=> d!109895 (= (map!12083 thiss!833) (map!12085 (v!11424 (underlying!538 thiss!833))))))

(declare-fun bs!24873 () Bool)

(assert (= bs!24873 d!109895))

(assert (=> bs!24873 m!826975))

(assert (=> b!887231 d!109895))

(declare-fun d!109897 () Bool)

(assert (=> d!109897 (= (valid!1516 thiss!833) (valid!1518 (v!11424 (underlying!538 thiss!833))))))

(declare-fun bs!24874 () Bool)

(assert (= bs!24874 d!109897))

(assert (=> bs!24874 m!826971))

(assert (=> start!75314 d!109897))

(declare-fun d!109899 () Bool)

(assert (=> d!109899 (= (array_inv!19550 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (bvsge (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887228 d!109899))

(declare-fun d!109901 () Bool)

(assert (=> d!109901 (= (array_inv!19551 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (bvsge (size!25277 (_values!5119 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887228 d!109901))

(declare-fun condMapEmpty!28287 () Bool)

(declare-fun mapDefault!28287 () ValueCell!8439)

(assert (=> mapNonEmpty!28281 (= condMapEmpty!28287 (= mapRest!28281 ((as const (Array (_ BitVec 32) ValueCell!8439)) mapDefault!28287)))))

(declare-fun e!494141 () Bool)

(declare-fun mapRes!28287 () Bool)

(assert (=> mapNonEmpty!28281 (= tp!54472 (and e!494141 mapRes!28287))))

(declare-fun mapIsEmpty!28287 () Bool)

(assert (=> mapIsEmpty!28287 mapRes!28287))

(declare-fun b!887331 () Bool)

(declare-fun e!494142 () Bool)

(assert (=> b!887331 (= e!494142 tp_is_empty!17841)))

(declare-fun mapNonEmpty!28287 () Bool)

(declare-fun tp!54482 () Bool)

(assert (=> mapNonEmpty!28287 (= mapRes!28287 (and tp!54482 e!494142))))

(declare-fun mapValue!28287 () ValueCell!8439)

(declare-fun mapRest!28287 () (Array (_ BitVec 32) ValueCell!8439))

(declare-fun mapKey!28287 () (_ BitVec 32))

(assert (=> mapNonEmpty!28287 (= mapRest!28281 (store mapRest!28287 mapKey!28287 mapValue!28287))))

(declare-fun b!887332 () Bool)

(assert (=> b!887332 (= e!494141 tp_is_empty!17841)))

(assert (= (and mapNonEmpty!28281 condMapEmpty!28287) mapIsEmpty!28287))

(assert (= (and mapNonEmpty!28281 (not condMapEmpty!28287)) mapNonEmpty!28287))

(assert (= (and mapNonEmpty!28287 ((_ is ValueCellFull!8439) mapValue!28287)) b!887331))

(assert (= (and mapNonEmpty!28281 ((_ is ValueCellFull!8439) mapDefault!28287)) b!887332))

(declare-fun m!827007 () Bool)

(assert (=> mapNonEmpty!28287 m!827007))

(declare-fun b_lambda!12829 () Bool)

(assert (= b_lambda!12827 (or (and b!887228 b_free!15513) b_lambda!12829)))

(declare-fun b_lambda!12831 () Bool)

(assert (= b_lambda!12819 (or (and b!887228 b_free!15513) b_lambda!12831)))

(declare-fun b_lambda!12833 () Bool)

(assert (= b_lambda!12821 (or (and b!887228 b_free!15513) b_lambda!12833)))

(declare-fun b_lambda!12835 () Bool)

(assert (= b_lambda!12825 (or (and b!887228 b_free!15513) b_lambda!12835)))

(declare-fun b_lambda!12837 () Bool)

(assert (= b_lambda!12823 (or (and b!887228 b_free!15513) b_lambda!12837)))

(check-sat b_and!25731 (not b_lambda!12835) (not b_next!15513) (not d!109889) (not b!887306) tp_is_empty!17841 (not bm!39334) (not mapNonEmpty!28287) (not b!887323) (not b!887307) (not b_lambda!12837) (not b!887304) (not b!887309) (not d!109887) (not d!109895) (not b!887303) (not d!109891) (not d!109897) (not b_lambda!12829) (not b!887294) (not bm!39337) (not b_lambda!12833) (not b_lambda!12831))
(check-sat b_and!25731 (not b_next!15513))
(get-model)

(declare-fun b!887345 () Bool)

(declare-fun e!494149 () SeekEntryResult!8763)

(declare-fun e!494151 () SeekEntryResult!8763)

(assert (=> b!887345 (= e!494149 e!494151)))

(declare-fun lt!401266 () (_ BitVec 64))

(declare-fun lt!401265 () SeekEntryResult!8763)

(assert (=> b!887345 (= lt!401266 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37425 lt!401265)))))

(declare-fun c!93648 () Bool)

(assert (=> b!887345 (= c!93648 (= lt!401266 key!673))))

(declare-fun d!109903 () Bool)

(declare-fun lt!401264 () SeekEntryResult!8763)

(assert (=> d!109903 (and (or ((_ is MissingVacant!8763) lt!401264) (not ((_ is Found!8763) lt!401264)) (and (bvsge (index!37424 lt!401264) #b00000000000000000000000000000000) (bvslt (index!37424 lt!401264) (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))) (not ((_ is MissingVacant!8763) lt!401264)) (or (not ((_ is Found!8763) lt!401264)) (= (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401264)) key!673)))))

(assert (=> d!109903 (= lt!401264 e!494149)))

(declare-fun c!93650 () Bool)

(assert (=> d!109903 (= c!93650 (and ((_ is Intermediate!8763) lt!401265) (undefined!9575 lt!401265)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51644 (_ BitVec 32)) SeekEntryResult!8763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!109903 (= lt!401265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!673 (mask!25530 (v!11424 (underlying!538 thiss!833)))) key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!109903 (validMask!0 (mask!25530 (v!11424 (underlying!538 thiss!833))))))

(assert (=> d!109903 (= (seekEntry!0 key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))) lt!401264)))

(declare-fun b!887346 () Bool)

(assert (=> b!887346 (= e!494149 Undefined!8763)))

(declare-fun b!887347 () Bool)

(assert (=> b!887347 (= e!494151 (Found!8763 (index!37425 lt!401265)))))

(declare-fun b!887348 () Bool)

(declare-fun c!93649 () Bool)

(assert (=> b!887348 (= c!93649 (= lt!401266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!494150 () SeekEntryResult!8763)

(assert (=> b!887348 (= e!494151 e!494150)))

(declare-fun b!887349 () Bool)

(declare-fun lt!401263 () SeekEntryResult!8763)

(assert (=> b!887349 (= e!494150 (ite ((_ is MissingVacant!8763) lt!401263) (MissingZero!8763 (index!37426 lt!401263)) lt!401263))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51644 (_ BitVec 32)) SeekEntryResult!8763)

(assert (=> b!887349 (= lt!401263 (seekKeyOrZeroReturnVacant!0 (x!75243 lt!401265) (index!37425 lt!401265) (index!37425 lt!401265) key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887350 () Bool)

(assert (=> b!887350 (= e!494150 (MissingZero!8763 (index!37425 lt!401265)))))

(assert (= (and d!109903 c!93650) b!887346))

(assert (= (and d!109903 (not c!93650)) b!887345))

(assert (= (and b!887345 c!93648) b!887347))

(assert (= (and b!887345 (not c!93648)) b!887348))

(assert (= (and b!887348 c!93649) b!887350))

(assert (= (and b!887348 (not c!93649)) b!887349))

(declare-fun m!827009 () Bool)

(assert (=> b!887345 m!827009))

(declare-fun m!827011 () Bool)

(assert (=> d!109903 m!827011))

(declare-fun m!827013 () Bool)

(assert (=> d!109903 m!827013))

(assert (=> d!109903 m!827013))

(declare-fun m!827015 () Bool)

(assert (=> d!109903 m!827015))

(declare-fun m!827017 () Bool)

(assert (=> d!109903 m!827017))

(declare-fun m!827019 () Bool)

(assert (=> b!887349 m!827019))

(assert (=> b!887309 d!109903))

(declare-fun d!109905 () Bool)

(declare-fun e!494154 () Bool)

(assert (=> d!109905 e!494154))

(declare-fun res!602104 () Bool)

(assert (=> d!109905 (=> res!602104 e!494154)))

(declare-fun lt!401272 () SeekEntryResult!8763)

(assert (=> d!109905 (= res!602104 (not ((_ is Found!8763) lt!401272)))))

(assert (=> d!109905 (= lt!401272 (seekEntry!0 key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401271 () Unit!30246)

(declare-fun choose!1453 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 64)) Unit!30246)

(assert (=> d!109905 (= lt!401271 (choose!1453 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673))))

(assert (=> d!109905 (validMask!0 (mask!25530 (v!11424 (underlying!538 thiss!833))))))

(assert (=> d!109905 (= (lemmaSeekEntryGivesInRangeIndex!1 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673) lt!401271)))

(declare-fun b!887353 () Bool)

(assert (=> b!887353 (= e!494154 (inRange!0 (index!37424 lt!401272) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(assert (= (and d!109905 (not res!602104)) b!887353))

(assert (=> d!109905 m!826965))

(declare-fun m!827021 () Bool)

(assert (=> d!109905 m!827021))

(assert (=> d!109905 m!827017))

(declare-fun m!827023 () Bool)

(assert (=> b!887353 m!827023))

(assert (=> b!887309 d!109905))

(declare-fun b!887354 () Bool)

(declare-fun e!494155 () Option!439)

(assert (=> b!887354 (= e!494155 (Some!438 (_2!5970 (h!18806 (t!24962 (toList!5323 (map!12083 thiss!833)))))))))

(declare-fun b!887356 () Bool)

(declare-fun e!494156 () Option!439)

(assert (=> b!887356 (= e!494156 (getValueByKey!433 (t!24962 (t!24962 (toList!5323 (map!12083 thiss!833)))) key!673))))

(declare-fun b!887355 () Bool)

(assert (=> b!887355 (= e!494155 e!494156)))

(declare-fun c!93652 () Bool)

(assert (=> b!887355 (= c!93652 (and ((_ is Cons!17675) (t!24962 (toList!5323 (map!12083 thiss!833)))) (not (= (_1!5970 (h!18806 (t!24962 (toList!5323 (map!12083 thiss!833))))) key!673))))))

(declare-fun d!109907 () Bool)

(declare-fun c!93651 () Bool)

(assert (=> d!109907 (= c!93651 (and ((_ is Cons!17675) (t!24962 (toList!5323 (map!12083 thiss!833)))) (= (_1!5970 (h!18806 (t!24962 (toList!5323 (map!12083 thiss!833))))) key!673)))))

(assert (=> d!109907 (= (getValueByKey!433 (t!24962 (toList!5323 (map!12083 thiss!833))) key!673) e!494155)))

(declare-fun b!887357 () Bool)

(assert (=> b!887357 (= e!494156 None!437)))

(assert (= (and d!109907 c!93651) b!887354))

(assert (= (and d!109907 (not c!93651)) b!887355))

(assert (= (and b!887355 c!93652) b!887356))

(assert (= (and b!887355 (not c!93652)) b!887357))

(declare-fun m!827025 () Bool)

(assert (=> b!887356 m!827025))

(assert (=> b!887323 d!109907))

(declare-fun d!109909 () Bool)

(assert (=> d!109909 (= (inRange!0 (index!37424 lt!401244) (mask!25530 (v!11424 (underlying!538 thiss!833)))) (and (bvsge (index!37424 lt!401244) #b00000000000000000000000000000000) (bvslt (index!37424 lt!401244) (bvadd (mask!25530 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001))))))

(assert (=> b!887306 d!109909))

(declare-fun d!109911 () Bool)

(declare-fun e!494161 () Bool)

(assert (=> d!109911 e!494161))

(declare-fun res!602107 () Bool)

(assert (=> d!109911 (=> res!602107 e!494161)))

(declare-fun lt!401283 () Bool)

(assert (=> d!109911 (= res!602107 (not lt!401283))))

(declare-fun lt!401281 () Bool)

(assert (=> d!109911 (= lt!401283 lt!401281)))

(declare-fun lt!401282 () Unit!30246)

(declare-fun e!494162 () Unit!30246)

(assert (=> d!109911 (= lt!401282 e!494162)))

(declare-fun c!93655 () Bool)

(assert (=> d!109911 (= c!93655 lt!401281)))

(declare-fun containsKey!417 (List!17679 (_ BitVec 64)) Bool)

(assert (=> d!109911 (= lt!401281 (containsKey!417 (toList!5323 (map!12083 thiss!833)) key!673))))

(assert (=> d!109911 (= (contains!4305 (map!12083 thiss!833) key!673) lt!401283)))

(declare-fun b!887364 () Bool)

(declare-fun lt!401284 () Unit!30246)

(assert (=> b!887364 (= e!494162 lt!401284)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!313 (List!17679 (_ BitVec 64)) Unit!30246)

(assert (=> b!887364 (= lt!401284 (lemmaContainsKeyImpliesGetValueByKeyDefined!313 (toList!5323 (map!12083 thiss!833)) key!673))))

(assert (=> b!887364 (isDefined!315 (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673))))

(declare-fun b!887365 () Bool)

(declare-fun Unit!30248 () Unit!30246)

(assert (=> b!887365 (= e!494162 Unit!30248)))

(declare-fun b!887366 () Bool)

(assert (=> b!887366 (= e!494161 (isDefined!315 (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673)))))

(assert (= (and d!109911 c!93655) b!887364))

(assert (= (and d!109911 (not c!93655)) b!887365))

(assert (= (and d!109911 (not res!602107)) b!887366))

(declare-fun m!827027 () Bool)

(assert (=> d!109911 m!827027))

(declare-fun m!827029 () Bool)

(assert (=> b!887364 m!827029))

(assert (=> b!887364 m!826935))

(assert (=> b!887364 m!826935))

(assert (=> b!887364 m!826937))

(assert (=> b!887366 m!826935))

(assert (=> b!887366 m!826935))

(assert (=> b!887366 m!826937))

(assert (=> d!109887 d!109911))

(assert (=> d!109887 d!109895))

(declare-fun b!887387 () Bool)

(declare-fun e!494175 () Bool)

(assert (=> b!887387 (= e!494175 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!109913 () Bool)

(declare-fun lt!401319 () Bool)

(assert (=> d!109913 (= lt!401319 (contains!4305 (map!12085 (v!11424 (underlying!538 thiss!833))) key!673))))

(assert (=> d!109913 (= lt!401319 e!494175)))

(declare-fun c!93667 () Bool)

(assert (=> d!109913 (= c!93667 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109913 (valid!1518 (v!11424 (underlying!538 thiss!833)))))

(assert (=> d!109913 (= (contains!4306 (v!11424 (underlying!538 thiss!833)) key!673) lt!401319)))

(declare-fun b!887388 () Bool)

(declare-fun e!494174 () Bool)

(assert (=> b!887388 (= e!494174 (ite (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!887389 () Bool)

(declare-fun e!494177 () Bool)

(assert (=> b!887389 (= e!494177 true)))

(declare-fun lt!401322 () SeekEntryResult!8763)

(declare-fun lt!401324 () Unit!30246)

(assert (=> b!887389 (= lt!401324 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401322)))))

(declare-fun call!39348 () Bool)

(assert (=> b!887389 call!39348))

(declare-fun lt!401315 () Unit!30246)

(assert (=> b!887389 (= lt!401315 lt!401324)))

(declare-fun lt!401317 () Unit!30246)

(assert (=> b!887389 (= lt!401317 (lemmaValidKeyInArrayIsInListMap!201 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) (index!37424 lt!401322) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun call!39347 () Bool)

(assert (=> b!887389 call!39347))

(declare-fun lt!401328 () Unit!30246)

(assert (=> b!887389 (= lt!401328 lt!401317)))

(declare-fun b!887390 () Bool)

(assert (=> b!887390 (= e!494174 call!39348)))

(declare-fun b!887391 () Bool)

(declare-fun e!494173 () Unit!30246)

(declare-fun Unit!30249 () Unit!30246)

(assert (=> b!887391 (= e!494173 Unit!30249)))

(declare-fun b!887392 () Bool)

(declare-fun c!93670 () Bool)

(assert (=> b!887392 (= c!93670 ((_ is Found!8763) lt!401322))))

(assert (=> b!887392 (= lt!401322 (seekEntry!0 key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun e!494176 () Bool)

(assert (=> b!887392 (= e!494176 e!494177)))

(declare-fun b!887393 () Bool)

(assert (=> b!887393 (= e!494175 e!494176)))

(declare-fun c!93669 () Bool)

(assert (=> b!887393 (= c!93669 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887394 () Bool)

(assert (=> b!887394 false))

(declare-fun lt!401327 () Unit!30246)

(declare-fun lt!401323 () Unit!30246)

(assert (=> b!887394 (= lt!401327 lt!401323)))

(declare-fun lt!401316 () SeekEntryResult!8763)

(declare-fun lt!401325 () (_ BitVec 32))

(assert (=> b!887394 (and ((_ is Found!8763) lt!401316) (= (index!37424 lt!401316) lt!401325))))

(assert (=> b!887394 (= lt!401316 (seekEntry!0 key!673 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51644 (_ BitVec 32)) Unit!30246)

(assert (=> b!887394 (= lt!401323 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!673 lt!401325 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401318 () Unit!30246)

(declare-fun lt!401321 () Unit!30246)

(assert (=> b!887394 (= lt!401318 lt!401321)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51644 (_ BitVec 32)) Bool)

(assert (=> b!887394 (arrayForallSeekEntryOrOpenFound!0 lt!401325 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30246)

(assert (=> b!887394 (= lt!401321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 lt!401325))))

(declare-fun arrayScanForKey!0 (array!51644 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887394 (= lt!401325 (arrayScanForKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000))))

(declare-fun lt!401329 () Unit!30246)

(declare-fun lt!401326 () Unit!30246)

(assert (=> b!887394 (= lt!401329 lt!401326)))

(assert (=> b!887394 e!494174))

(declare-fun c!93666 () Bool)

(assert (=> b!887394 (= c!93666 (and (not (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!155 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 64) Int) Unit!30246)

(assert (=> b!887394 (= lt!401326 (lemmaKeyInListMapIsInArray!155 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun Unit!30250 () Unit!30246)

(assert (=> b!887394 (= e!494173 Unit!30250)))

(declare-fun b!887395 () Bool)

(assert (=> b!887395 (= e!494176 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39344 () Bool)

(declare-fun call!39349 () ListLongMap!10615)

(assert (=> bm!39344 (= call!39349 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun bm!39345 () Bool)

(assert (=> bm!39345 (= call!39347 (contains!4305 call!39349 (ite c!93670 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401322)) key!673)))))

(declare-fun b!887396 () Bool)

(assert (=> b!887396 (= e!494177 false)))

(declare-fun c!93668 () Bool)

(assert (=> b!887396 (= c!93668 call!39347)))

(declare-fun lt!401320 () Unit!30246)

(assert (=> b!887396 (= lt!401320 e!494173)))

(declare-fun bm!39346 () Bool)

(assert (=> bm!39346 (= call!39348 (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (= (and d!109913 c!93667) b!887387))

(assert (= (and d!109913 (not c!93667)) b!887393))

(assert (= (and b!887393 c!93669) b!887395))

(assert (= (and b!887393 (not c!93669)) b!887392))

(assert (= (and b!887392 c!93670) b!887389))

(assert (= (and b!887392 (not c!93670)) b!887396))

(assert (= (and b!887396 c!93668) b!887394))

(assert (= (and b!887396 (not c!93668)) b!887391))

(assert (= (and b!887394 c!93666) b!887390))

(assert (= (and b!887394 (not c!93666)) b!887388))

(assert (= (or b!887389 b!887390) bm!39346))

(assert (= (or b!887389 b!887396) bm!39344))

(assert (= (or b!887389 b!887396) bm!39345))

(declare-fun m!827031 () Bool)

(assert (=> bm!39345 m!827031))

(declare-fun m!827033 () Bool)

(assert (=> bm!39345 m!827033))

(assert (=> bm!39344 m!826969))

(declare-fun m!827035 () Bool)

(assert (=> b!887389 m!827035))

(declare-fun m!827037 () Bool)

(assert (=> b!887389 m!827037))

(assert (=> d!109913 m!826975))

(assert (=> d!109913 m!826975))

(declare-fun m!827039 () Bool)

(assert (=> d!109913 m!827039))

(assert (=> d!109913 m!826971))

(assert (=> b!887392 m!826965))

(assert (=> bm!39346 m!826981))

(declare-fun m!827041 () Bool)

(assert (=> b!887394 m!827041))

(declare-fun m!827043 () Bool)

(assert (=> b!887394 m!827043))

(declare-fun m!827045 () Bool)

(assert (=> b!887394 m!827045))

(declare-fun m!827047 () Bool)

(assert (=> b!887394 m!827047))

(assert (=> b!887394 m!826965))

(declare-fun m!827049 () Bool)

(assert (=> b!887394 m!827049))

(assert (=> d!109887 d!109913))

(assert (=> d!109887 d!109897))

(declare-fun d!109915 () Bool)

(declare-fun res!602114 () Bool)

(declare-fun e!494180 () Bool)

(assert (=> d!109915 (=> (not res!602114) (not e!494180))))

(declare-fun simpleValid!287 (LongMapFixedSize!3894) Bool)

(assert (=> d!109915 (= res!602114 (simpleValid!287 (v!11424 (underlying!538 thiss!833))))))

(assert (=> d!109915 (= (valid!1518 (v!11424 (underlying!538 thiss!833))) e!494180)))

(declare-fun b!887403 () Bool)

(declare-fun res!602115 () Bool)

(assert (=> b!887403 (=> (not res!602115) (not e!494180))))

(declare-fun arrayCountValidKeys!0 (array!51644 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887403 (= res!602115 (= (arrayCountValidKeys!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))) (_size!2002 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887404 () Bool)

(declare-fun res!602116 () Bool)

(assert (=> b!887404 (=> (not res!602116) (not e!494180))))

(assert (=> b!887404 (= res!602116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887405 () Bool)

(declare-datatypes ((List!17681 0))(
  ( (Nil!17678) (Cons!17677 (h!18808 (_ BitVec 64)) (t!24968 List!17681)) )
))
(declare-fun arrayNoDuplicates!0 (array!51644 (_ BitVec 32) List!17681) Bool)

(assert (=> b!887405 (= e!494180 (arrayNoDuplicates!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 Nil!17678))))

(assert (= (and d!109915 res!602114) b!887403))

(assert (= (and b!887403 res!602115) b!887404))

(assert (= (and b!887404 res!602116) b!887405))

(declare-fun m!827051 () Bool)

(assert (=> d!109915 m!827051))

(declare-fun m!827053 () Bool)

(assert (=> b!887403 m!827053))

(declare-fun m!827055 () Bool)

(assert (=> b!887404 m!827055))

(declare-fun m!827057 () Bool)

(assert (=> b!887405 m!827057))

(assert (=> d!109897 d!109915))

(declare-fun d!109917 () Bool)

(declare-fun res!602121 () Bool)

(declare-fun e!494185 () Bool)

(assert (=> d!109917 (=> res!602121 e!494185)))

(assert (=> d!109917 (= res!602121 (= (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000) key!673))))

(assert (=> d!109917 (= (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000) e!494185)))

(declare-fun b!887410 () Bool)

(declare-fun e!494186 () Bool)

(assert (=> b!887410 (= e!494185 e!494186)))

(declare-fun res!602122 () Bool)

(assert (=> b!887410 (=> (not res!602122) (not e!494186))))

(assert (=> b!887410 (= res!602122 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun b!887411 () Bool)

(assert (=> b!887411 (= e!494186 (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109917 (not res!602121)) b!887410))

(assert (= (and b!887410 res!602122) b!887411))

(declare-fun m!827059 () Bool)

(assert (=> d!109917 m!827059))

(declare-fun m!827061 () Bool)

(assert (=> b!887411 m!827061))

(assert (=> b!887307 d!109917))

(declare-fun d!109919 () Bool)

(assert (=> d!109919 (= (isEmpty!674 (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673)) (not ((_ is Some!438) (getValueByKey!433 (toList!5323 (map!12083 thiss!833)) key!673))))))

(assert (=> d!109891 d!109919))

(declare-fun d!109921 () Bool)

(declare-fun e!494189 () Bool)

(assert (=> d!109921 e!494189))

(declare-fun res!602125 () Bool)

(assert (=> d!109921 (=> (not res!602125) (not e!494189))))

(assert (=> d!109921 (= res!602125 (and (bvsge (index!37424 lt!401252) #b00000000000000000000000000000000) (bvslt (index!37424 lt!401252) (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833)))))))))

(declare-fun lt!401332 () Unit!30246)

(declare-fun choose!1454 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 32) Int) Unit!30246)

(assert (=> d!109921 (= lt!401332 (choose!1454 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) (index!37424 lt!401252) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(assert (=> d!109921 (validMask!0 (mask!25530 (v!11424 (underlying!538 thiss!833))))))

(assert (=> d!109921 (= (lemmaValidKeyInArrayIsInListMap!201 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) (index!37424 lt!401252) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) lt!401332)))

(declare-fun b!887414 () Bool)

(assert (=> b!887414 (= e!494189 (contains!4305 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252))))))

(assert (= (and d!109921 res!602125) b!887414))

(declare-fun m!827063 () Bool)

(assert (=> d!109921 m!827063))

(assert (=> d!109921 m!827017))

(assert (=> b!887414 m!826969))

(assert (=> b!887414 m!826987))

(assert (=> b!887414 m!826969))

(assert (=> b!887414 m!826987))

(assert (=> b!887414 m!826991))

(assert (=> b!887304 d!109921))

(declare-fun d!109923 () Bool)

(declare-fun e!494190 () Bool)

(assert (=> d!109923 e!494190))

(declare-fun res!602126 () Bool)

(assert (=> d!109923 (=> res!602126 e!494190)))

(declare-fun lt!401335 () Bool)

(assert (=> d!109923 (= res!602126 (not lt!401335))))

(declare-fun lt!401333 () Bool)

(assert (=> d!109923 (= lt!401335 lt!401333)))

(declare-fun lt!401334 () Unit!30246)

(declare-fun e!494191 () Unit!30246)

(assert (=> d!109923 (= lt!401334 e!494191)))

(declare-fun c!93671 () Bool)

(assert (=> d!109923 (= c!93671 lt!401333)))

(assert (=> d!109923 (= lt!401333 (containsKey!417 (toList!5323 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252))))))

(assert (=> d!109923 (= (contains!4305 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252))) lt!401335)))

(declare-fun b!887415 () Bool)

(declare-fun lt!401336 () Unit!30246)

(assert (=> b!887415 (= e!494191 lt!401336)))

(assert (=> b!887415 (= lt!401336 (lemmaContainsKeyImpliesGetValueByKeyDefined!313 (toList!5323 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252))))))

(assert (=> b!887415 (isDefined!315 (getValueByKey!433 (toList!5323 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252))))))

(declare-fun b!887416 () Bool)

(declare-fun Unit!30251 () Unit!30246)

(assert (=> b!887416 (= e!494191 Unit!30251)))

(declare-fun b!887417 () Bool)

(assert (=> b!887417 (= e!494190 (isDefined!315 (getValueByKey!433 (toList!5323 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))))) (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)))))))

(assert (= (and d!109923 c!93671) b!887415))

(assert (= (and d!109923 (not c!93671)) b!887416))

(assert (= (and d!109923 (not res!602126)) b!887417))

(assert (=> d!109923 m!826987))

(declare-fun m!827065 () Bool)

(assert (=> d!109923 m!827065))

(assert (=> b!887415 m!826987))

(declare-fun m!827067 () Bool)

(assert (=> b!887415 m!827067))

(assert (=> b!887415 m!826987))

(declare-fun m!827069 () Bool)

(assert (=> b!887415 m!827069))

(assert (=> b!887415 m!827069))

(declare-fun m!827071 () Bool)

(assert (=> b!887415 m!827071))

(assert (=> b!887417 m!826987))

(assert (=> b!887417 m!827069))

(assert (=> b!887417 m!827069))

(assert (=> b!887417 m!827071))

(assert (=> b!887304 d!109923))

(declare-fun d!109925 () Bool)

(assert (=> d!109925 (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000)))

(declare-fun lt!401339 () Unit!30246)

(declare-fun choose!13 (array!51644 (_ BitVec 64) (_ BitVec 32)) Unit!30246)

(assert (=> d!109925 (= lt!401339 (choose!13 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401252)))))

(assert (=> d!109925 (bvsge (index!37424 lt!401252) #b00000000000000000000000000000000)))

(assert (=> d!109925 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401252)) lt!401339)))

(declare-fun bs!24875 () Bool)

(assert (= bs!24875 d!109925))

(assert (=> bs!24875 m!826981))

(declare-fun m!827073 () Bool)

(assert (=> bs!24875 m!827073))

(assert (=> b!887304 d!109925))

(declare-fun b!887460 () Bool)

(declare-fun e!494225 () Unit!30246)

(declare-fun Unit!30252 () Unit!30246)

(assert (=> b!887460 (= e!494225 Unit!30252)))

(declare-fun b!887461 () Bool)

(declare-fun lt!401390 () Unit!30246)

(assert (=> b!887461 (= e!494225 lt!401390)))

(declare-fun lt!401386 () ListLongMap!10615)

(declare-fun getCurrentListMapNoExtraKeys!3271 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 32) Int) ListLongMap!10615)

(assert (=> b!887461 (= lt!401386 (getCurrentListMapNoExtraKeys!3271 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401401 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401384 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401384 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401392 () Unit!30246)

(declare-fun addStillContains!325 (ListLongMap!10615 (_ BitVec 64) V!28753 (_ BitVec 64)) Unit!30246)

(assert (=> b!887461 (= lt!401392 (addStillContains!325 lt!401386 lt!401401 (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) lt!401384))))

(declare-fun +!2584 (ListLongMap!10615 tuple2!11918) ListLongMap!10615)

(assert (=> b!887461 (contains!4305 (+!2584 lt!401386 (tuple2!11919 lt!401401 (zeroValue!4932 (v!11424 (underlying!538 thiss!833))))) lt!401384)))

(declare-fun lt!401405 () Unit!30246)

(assert (=> b!887461 (= lt!401405 lt!401392)))

(declare-fun lt!401389 () ListLongMap!10615)

(assert (=> b!887461 (= lt!401389 (getCurrentListMapNoExtraKeys!3271 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401403 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401403 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401400 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401400 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401399 () Unit!30246)

(declare-fun addApplyDifferent!325 (ListLongMap!10615 (_ BitVec 64) V!28753 (_ BitVec 64)) Unit!30246)

(assert (=> b!887461 (= lt!401399 (addApplyDifferent!325 lt!401389 lt!401403 (minValue!4932 (v!11424 (underlying!538 thiss!833))) lt!401400))))

(assert (=> b!887461 (= (apply!393 (+!2584 lt!401389 (tuple2!11919 lt!401403 (minValue!4932 (v!11424 (underlying!538 thiss!833))))) lt!401400) (apply!393 lt!401389 lt!401400))))

(declare-fun lt!401391 () Unit!30246)

(assert (=> b!887461 (= lt!401391 lt!401399)))

(declare-fun lt!401388 () ListLongMap!10615)

(assert (=> b!887461 (= lt!401388 (getCurrentListMapNoExtraKeys!3271 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401402 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401402 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401398 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401398 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000))))

(declare-fun lt!401395 () Unit!30246)

(assert (=> b!887461 (= lt!401395 (addApplyDifferent!325 lt!401388 lt!401402 (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) lt!401398))))

(assert (=> b!887461 (= (apply!393 (+!2584 lt!401388 (tuple2!11919 lt!401402 (zeroValue!4932 (v!11424 (underlying!538 thiss!833))))) lt!401398) (apply!393 lt!401388 lt!401398))))

(declare-fun lt!401387 () Unit!30246)

(assert (=> b!887461 (= lt!401387 lt!401395)))

(declare-fun lt!401404 () ListLongMap!10615)

(assert (=> b!887461 (= lt!401404 (getCurrentListMapNoExtraKeys!3271 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun lt!401385 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401393 () (_ BitVec 64))

(assert (=> b!887461 (= lt!401393 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000))))

(assert (=> b!887461 (= lt!401390 (addApplyDifferent!325 lt!401404 lt!401385 (minValue!4932 (v!11424 (underlying!538 thiss!833))) lt!401393))))

(assert (=> b!887461 (= (apply!393 (+!2584 lt!401404 (tuple2!11919 lt!401385 (minValue!4932 (v!11424 (underlying!538 thiss!833))))) lt!401393) (apply!393 lt!401404 lt!401393))))

(declare-fun b!887462 () Bool)

(declare-fun res!602152 () Bool)

(declare-fun e!494222 () Bool)

(assert (=> b!887462 (=> (not res!602152) (not e!494222))))

(declare-fun e!494229 () Bool)

(assert (=> b!887462 (= res!602152 e!494229)))

(declare-fun c!93688 () Bool)

(assert (=> b!887462 (= c!93688 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!109927 () Bool)

(assert (=> d!109927 e!494222))

(declare-fun res!602146 () Bool)

(assert (=> d!109927 (=> (not res!602146) (not e!494222))))

(assert (=> d!109927 (= res!602146 (or (bvsge #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))))))

(declare-fun lt!401397 () ListLongMap!10615)

(declare-fun lt!401394 () ListLongMap!10615)

(assert (=> d!109927 (= lt!401397 lt!401394)))

(declare-fun lt!401396 () Unit!30246)

(assert (=> d!109927 (= lt!401396 e!494225)))

(declare-fun c!93686 () Bool)

(declare-fun e!494224 () Bool)

(assert (=> d!109927 (= c!93686 e!494224)))

(declare-fun res!602149 () Bool)

(assert (=> d!109927 (=> (not res!602149) (not e!494224))))

(assert (=> d!109927 (= res!602149 (bvslt #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun e!494220 () ListLongMap!10615)

(assert (=> d!109927 (= lt!401394 e!494220)))

(declare-fun c!93684 () Bool)

(assert (=> d!109927 (= c!93684 (and (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!109927 (validMask!0 (mask!25530 (v!11424 (underlying!538 thiss!833))))))

(assert (=> d!109927 (= (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) lt!401397)))

(declare-fun b!887463 () Bool)

(declare-fun e!494227 () Bool)

(declare-fun call!39368 () Bool)

(assert (=> b!887463 (= e!494227 (not call!39368))))

(declare-fun bm!39361 () Bool)

(declare-fun call!39366 () ListLongMap!10615)

(declare-fun call!39367 () ListLongMap!10615)

(assert (=> bm!39361 (= call!39366 call!39367)))

(declare-fun b!887464 () Bool)

(declare-fun e!494230 () Bool)

(assert (=> b!887464 (= e!494230 (= (apply!393 lt!401397 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4932 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887465 () Bool)

(declare-fun res!602150 () Bool)

(assert (=> b!887465 (=> (not res!602150) (not e!494222))))

(declare-fun e!494219 () Bool)

(assert (=> b!887465 (= res!602150 e!494219)))

(declare-fun res!602151 () Bool)

(assert (=> b!887465 (=> res!602151 e!494219)))

(declare-fun e!494228 () Bool)

(assert (=> b!887465 (= res!602151 (not e!494228))))

(declare-fun res!602148 () Bool)

(assert (=> b!887465 (=> (not res!602148) (not e!494228))))

(assert (=> b!887465 (= res!602148 (bvslt #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun bm!39362 () Bool)

(assert (=> bm!39362 (= call!39368 (contains!4305 lt!401397 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887466 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!887466 (= e!494224 (validKeyInArray!0 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000)))))

(declare-fun b!887467 () Bool)

(declare-fun e!494218 () ListLongMap!10615)

(declare-fun call!39369 () ListLongMap!10615)

(assert (=> b!887467 (= e!494218 call!39369)))

(declare-fun bm!39363 () Bool)

(declare-fun call!39364 () ListLongMap!10615)

(assert (=> bm!39363 (= call!39364 (getCurrentListMapNoExtraKeys!3271 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887468 () Bool)

(declare-fun e!494226 () Bool)

(assert (=> b!887468 (= e!494226 (= (apply!393 lt!401397 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000)) (get!13122 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!887468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25277 (_values!5119 (v!11424 (underlying!538 thiss!833))))))))

(assert (=> b!887468 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun b!887469 () Bool)

(declare-fun e!494223 () Bool)

(assert (=> b!887469 (= e!494223 (= (apply!393 lt!401397 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4932 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun bm!39364 () Bool)

(assert (=> bm!39364 (= call!39367 call!39364)))

(declare-fun b!887470 () Bool)

(assert (=> b!887470 (= e!494229 e!494223)))

(declare-fun res!602147 () Bool)

(declare-fun call!39370 () Bool)

(assert (=> b!887470 (= res!602147 call!39370)))

(assert (=> b!887470 (=> (not res!602147) (not e!494223))))

(declare-fun b!887471 () Bool)

(declare-fun e!494221 () ListLongMap!10615)

(assert (=> b!887471 (= e!494220 e!494221)))

(declare-fun c!93687 () Bool)

(assert (=> b!887471 (= c!93687 (and (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!887472 () Bool)

(assert (=> b!887472 (= e!494219 e!494226)))

(declare-fun res!602153 () Bool)

(assert (=> b!887472 (=> (not res!602153) (not e!494226))))

(assert (=> b!887472 (= res!602153 (contains!4305 lt!401397 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000)))))

(assert (=> b!887472 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25278 (_keys!9810 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun bm!39365 () Bool)

(assert (=> bm!39365 (= call!39370 (contains!4305 lt!401397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887473 () Bool)

(assert (=> b!887473 (= e!494222 e!494227)))

(declare-fun c!93689 () Bool)

(assert (=> b!887473 (= c!93689 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!887474 () Bool)

(assert (=> b!887474 (= e!494221 call!39369)))

(declare-fun b!887475 () Bool)

(assert (=> b!887475 (= e!494228 (validKeyInArray!0 (select (arr!24838 (_keys!9810 (v!11424 (underlying!538 thiss!833)))) #b00000000000000000000000000000000)))))

(declare-fun b!887476 () Bool)

(assert (=> b!887476 (= e!494227 e!494230)))

(declare-fun res!602145 () Bool)

(assert (=> b!887476 (= res!602145 call!39368)))

(assert (=> b!887476 (=> (not res!602145) (not e!494230))))

(declare-fun bm!39366 () Bool)

(declare-fun call!39365 () ListLongMap!10615)

(assert (=> bm!39366 (= call!39369 call!39365)))

(declare-fun b!887477 () Bool)

(declare-fun c!93685 () Bool)

(assert (=> b!887477 (= c!93685 (and (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887477 (= e!494221 e!494218)))

(declare-fun b!887478 () Bool)

(assert (=> b!887478 (= e!494220 (+!2584 call!39365 (tuple2!11919 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4932 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun b!887479 () Bool)

(assert (=> b!887479 (= e!494218 call!39366)))

(declare-fun b!887480 () Bool)

(assert (=> b!887480 (= e!494229 (not call!39370))))

(declare-fun bm!39367 () Bool)

(assert (=> bm!39367 (= call!39365 (+!2584 (ite c!93684 call!39364 (ite c!93687 call!39367 call!39366)) (ite (or c!93684 c!93687) (tuple2!11919 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4932 (v!11424 (underlying!538 thiss!833)))) (tuple2!11919 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4932 (v!11424 (underlying!538 thiss!833)))))))))

(assert (= (and d!109927 c!93684) b!887478))

(assert (= (and d!109927 (not c!93684)) b!887471))

(assert (= (and b!887471 c!93687) b!887474))

(assert (= (and b!887471 (not c!93687)) b!887477))

(assert (= (and b!887477 c!93685) b!887467))

(assert (= (and b!887477 (not c!93685)) b!887479))

(assert (= (or b!887467 b!887479) bm!39361))

(assert (= (or b!887474 bm!39361) bm!39364))

(assert (= (or b!887474 b!887467) bm!39366))

(assert (= (or b!887478 bm!39364) bm!39363))

(assert (= (or b!887478 bm!39366) bm!39367))

(assert (= (and d!109927 res!602149) b!887466))

(assert (= (and d!109927 c!93686) b!887461))

(assert (= (and d!109927 (not c!93686)) b!887460))

(assert (= (and d!109927 res!602146) b!887465))

(assert (= (and b!887465 res!602148) b!887475))

(assert (= (and b!887465 (not res!602151)) b!887472))

(assert (= (and b!887472 res!602153) b!887468))

(assert (= (and b!887465 res!602150) b!887462))

(assert (= (and b!887462 c!93688) b!887470))

(assert (= (and b!887462 (not c!93688)) b!887480))

(assert (= (and b!887470 res!602147) b!887469))

(assert (= (or b!887470 b!887480) bm!39365))

(assert (= (and b!887462 res!602152) b!887473))

(assert (= (and b!887473 c!93689) b!887476))

(assert (= (and b!887473 (not c!93689)) b!887463))

(assert (= (and b!887476 res!602145) b!887464))

(assert (= (or b!887476 b!887463) bm!39362))

(declare-fun b_lambda!12839 () Bool)

(assert (=> (not b_lambda!12839) (not b!887468)))

(assert (=> b!887468 t!24967))

(declare-fun b_and!25733 () Bool)

(assert (= b_and!25731 (and (=> t!24967 result!9969) b_and!25733)))

(declare-fun m!827075 () Bool)

(assert (=> bm!39363 m!827075))

(assert (=> d!109927 m!827017))

(assert (=> b!887475 m!827059))

(assert (=> b!887475 m!827059))

(declare-fun m!827077 () Bool)

(assert (=> b!887475 m!827077))

(assert (=> b!887472 m!827059))

(assert (=> b!887472 m!827059))

(declare-fun m!827079 () Bool)

(assert (=> b!887472 m!827079))

(declare-fun m!827081 () Bool)

(assert (=> bm!39367 m!827081))

(assert (=> b!887466 m!827059))

(assert (=> b!887466 m!827059))

(assert (=> b!887466 m!827077))

(declare-fun m!827083 () Bool)

(assert (=> bm!39365 m!827083))

(declare-fun m!827085 () Bool)

(assert (=> bm!39362 m!827085))

(declare-fun m!827087 () Bool)

(assert (=> b!887464 m!827087))

(declare-fun m!827089 () Bool)

(assert (=> b!887478 m!827089))

(declare-fun m!827091 () Bool)

(assert (=> b!887461 m!827091))

(declare-fun m!827093 () Bool)

(assert (=> b!887461 m!827093))

(assert (=> b!887461 m!827059))

(declare-fun m!827095 () Bool)

(assert (=> b!887461 m!827095))

(declare-fun m!827097 () Bool)

(assert (=> b!887461 m!827097))

(declare-fun m!827099 () Bool)

(assert (=> b!887461 m!827099))

(declare-fun m!827101 () Bool)

(assert (=> b!887461 m!827101))

(declare-fun m!827103 () Bool)

(assert (=> b!887461 m!827103))

(assert (=> b!887461 m!827099))

(declare-fun m!827105 () Bool)

(assert (=> b!887461 m!827105))

(assert (=> b!887461 m!827097))

(declare-fun m!827107 () Bool)

(assert (=> b!887461 m!827107))

(declare-fun m!827109 () Bool)

(assert (=> b!887461 m!827109))

(declare-fun m!827111 () Bool)

(assert (=> b!887461 m!827111))

(assert (=> b!887461 m!827103))

(declare-fun m!827113 () Bool)

(assert (=> b!887461 m!827113))

(declare-fun m!827115 () Bool)

(assert (=> b!887461 m!827115))

(declare-fun m!827117 () Bool)

(assert (=> b!887461 m!827117))

(assert (=> b!887461 m!827111))

(declare-fun m!827119 () Bool)

(assert (=> b!887461 m!827119))

(assert (=> b!887461 m!827075))

(declare-fun m!827121 () Bool)

(assert (=> b!887469 m!827121))

(assert (=> b!887468 m!827059))

(declare-fun m!827123 () Bool)

(assert (=> b!887468 m!827123))

(assert (=> b!887468 m!827059))

(declare-fun m!827125 () Bool)

(assert (=> b!887468 m!827125))

(assert (=> b!887468 m!826983))

(declare-fun m!827127 () Bool)

(assert (=> b!887468 m!827127))

(assert (=> b!887468 m!827125))

(assert (=> b!887468 m!826983))

(assert (=> b!887304 d!109927))

(assert (=> b!887304 d!109917))

(declare-fun d!109929 () Bool)

(declare-fun c!93692 () Bool)

(assert (=> d!109929 (= c!93692 ((_ is ValueCellFull!8439) (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252))))))

(declare-fun e!494233 () V!28753)

(assert (=> d!109929 (= (get!13122 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!494233)))

(declare-fun b!887485 () Bool)

(declare-fun get!13123 (ValueCell!8439 V!28753) V!28753)

(assert (=> b!887485 (= e!494233 (get!13123 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!887486 () Bool)

(declare-fun get!13124 (ValueCell!8439 V!28753) V!28753)

(assert (=> b!887486 (= e!494233 (get!13124 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109929 c!93692) b!887485))

(assert (= (and d!109929 (not c!93692)) b!887486))

(assert (=> b!887485 m!826985))

(assert (=> b!887485 m!826983))

(declare-fun m!827129 () Bool)

(assert (=> b!887485 m!827129))

(assert (=> b!887486 m!826985))

(assert (=> b!887486 m!826983))

(declare-fun m!827131 () Bool)

(assert (=> b!887486 m!827131))

(assert (=> b!887304 d!109929))

(declare-fun bm!39376 () Bool)

(declare-fun call!39382 () ListLongMap!10615)

(declare-fun call!39379 () ListLongMap!10615)

(assert (=> bm!39376 (= call!39382 call!39379)))

(declare-fun bm!39377 () Bool)

(declare-fun call!39381 () V!28753)

(declare-fun call!39380 () V!28753)

(assert (=> bm!39377 (= call!39381 call!39380)))

(declare-fun b!887501 () Bool)

(declare-fun res!602160 () Bool)

(declare-fun e!494247 () Bool)

(assert (=> b!887501 (=> (not res!602160) (not e!494247))))

(assert (=> b!887501 (= res!602160 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!494246 () Bool)

(assert (=> b!887501 (= e!494246 e!494247)))

(declare-fun d!109931 () Bool)

(declare-fun e!494245 () Bool)

(assert (=> d!109931 e!494245))

(declare-fun c!93698 () Bool)

(assert (=> d!109931 (= c!93698 (= key!673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!401408 () Unit!30246)

(declare-fun choose!1455 (array!51644 array!51642 (_ BitVec 32) (_ BitVec 32) V!28753 V!28753 (_ BitVec 64) (_ BitVec 32) Int) Unit!30246)

(assert (=> d!109931 (= lt!401408 (choose!1455 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401252) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(assert (=> d!109931 (validMask!0 (mask!25530 (v!11424 (underlying!538 thiss!833))))))

(assert (=> d!109931 (= (lemmaKeyInListMapThenSameValueInArray!1 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) key!673 (index!37424 lt!401252) (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))) lt!401408)))

(declare-fun b!887502 () Bool)

(declare-fun e!494244 () Bool)

(assert (=> b!887502 (= e!494244 (= call!39380 (zeroValue!4932 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun bm!39378 () Bool)

(assert (=> bm!39378 (= call!39380 (apply!393 (ite c!93698 call!39379 call!39382) key!673))))

(declare-fun b!887503 () Bool)

(assert (=> b!887503 (= e!494247 (= call!39381 (minValue!4932 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun b!887504 () Bool)

(declare-fun res!602161 () Bool)

(declare-fun e!494248 () Bool)

(assert (=> b!887504 (=> (not res!602161) (not e!494248))))

(assert (=> b!887504 (= res!602161 (arrayContainsKey!0 (_keys!9810 (v!11424 (underlying!538 thiss!833))) key!673 #b00000000000000000000000000000000))))

(assert (=> b!887504 (= e!494246 e!494248)))

(declare-fun b!887505 () Bool)

(assert (=> b!887505 (= e!494245 e!494246)))

(declare-fun c!93697 () Bool)

(assert (=> b!887505 (= c!93697 (= key!673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!887506 () Bool)

(assert (=> b!887506 (= e!494248 (= call!39381 (get!13122 (select (arr!24837 (_values!5119 (v!11424 (underlying!538 thiss!833)))) (index!37424 lt!401252)) (dynLambda!1286 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!887506 (and (bvsge (index!37424 lt!401252) #b00000000000000000000000000000000) (bvslt (index!37424 lt!401252) (size!25277 (_values!5119 (v!11424 (underlying!538 thiss!833))))))))

(declare-fun b!887507 () Bool)

(assert (=> b!887507 (= e!494245 e!494244)))

(declare-fun res!602162 () Bool)

(assert (=> b!887507 (= res!602162 (not (= (bvand (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!887507 (=> (not res!602162) (not e!494244))))

(declare-fun bm!39379 () Bool)

(assert (=> bm!39379 (= call!39379 (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(assert (= (and d!109931 c!93698) b!887507))

(assert (= (and d!109931 (not c!93698)) b!887505))

(assert (= (and b!887507 res!602162) b!887502))

(assert (= (and b!887505 c!93697) b!887501))

(assert (= (and b!887505 (not c!93697)) b!887504))

(assert (= (and b!887501 res!602160) b!887503))

(assert (= (and b!887504 res!602161) b!887506))

(assert (= (or b!887503 b!887506) bm!39376))

(assert (= (or b!887503 b!887506) bm!39377))

(assert (= (or b!887502 bm!39376) bm!39379))

(assert (= (or b!887502 bm!39377) bm!39378))

(declare-fun b_lambda!12841 () Bool)

(assert (=> (not b_lambda!12841) (not b!887506)))

(assert (=> b!887506 t!24967))

(declare-fun b_and!25735 () Bool)

(assert (= b_and!25733 (and (=> t!24967 result!9969) b_and!25735)))

(assert (=> bm!39379 m!826969))

(assert (=> b!887504 m!826981))

(declare-fun m!827133 () Bool)

(assert (=> d!109931 m!827133))

(assert (=> d!109931 m!827017))

(declare-fun m!827135 () Bool)

(assert (=> bm!39378 m!827135))

(assert (=> b!887506 m!826985))

(assert (=> b!887506 m!826983))

(assert (=> b!887506 m!826985))

(assert (=> b!887506 m!826983))

(assert (=> b!887506 m!826997))

(assert (=> b!887304 d!109931))

(declare-fun d!109933 () Bool)

(assert (=> d!109933 (= (apply!393 (ite c!93634 call!39340 call!39337) key!673) (get!13121 (getValueByKey!433 (toList!5323 (ite c!93634 call!39340 call!39337)) key!673)))))

(declare-fun bs!24876 () Bool)

(assert (= bs!24876 d!109933))

(declare-fun m!827137 () Bool)

(assert (=> bs!24876 m!827137))

(assert (=> bs!24876 m!827137))

(declare-fun m!827139 () Bool)

(assert (=> bs!24876 m!827139))

(assert (=> bm!39334 d!109933))

(declare-fun d!109935 () Bool)

(assert (=> d!109935 (= (map!12085 (v!11424 (underlying!538 thiss!833))) (getCurrentListMap!2612 (_keys!9810 (v!11424 (underlying!538 thiss!833))) (_values!5119 (v!11424 (underlying!538 thiss!833))) (mask!25530 (v!11424 (underlying!538 thiss!833))) (extraKeys!4828 (v!11424 (underlying!538 thiss!833))) (zeroValue!4932 (v!11424 (underlying!538 thiss!833))) (minValue!4932 (v!11424 (underlying!538 thiss!833))) #b00000000000000000000000000000000 (defaultEntry!5135 (v!11424 (underlying!538 thiss!833)))))))

(declare-fun bs!24877 () Bool)

(assert (= bs!24877 d!109935))

(assert (=> bs!24877 m!826969))

(assert (=> d!109895 d!109935))

(assert (=> d!109889 d!109913))

(assert (=> d!109889 d!109915))

(assert (=> bm!39337 d!109927))

(assert (=> b!887303 d!109929))

(declare-fun d!109937 () Bool)

(assert (=> d!109937 (= (get!13121 (getValueByKey!433 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833)))) key!673)) (v!11425 (getValueByKey!433 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833)))) key!673)))))

(assert (=> b!887294 d!109937))

(declare-fun b!887508 () Bool)

(declare-fun e!494249 () Option!439)

(assert (=> b!887508 (= e!494249 (Some!438 (_2!5970 (h!18806 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833))))))))))

(declare-fun b!887510 () Bool)

(declare-fun e!494250 () Option!439)

(assert (=> b!887510 (= e!494250 (getValueByKey!433 (t!24962 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833))))) key!673))))

(declare-fun b!887509 () Bool)

(assert (=> b!887509 (= e!494249 e!494250)))

(declare-fun c!93700 () Bool)

(assert (=> b!887509 (= c!93700 (and ((_ is Cons!17675) (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833))))) (not (= (_1!5970 (h!18806 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833)))))) key!673))))))

(declare-fun d!109939 () Bool)

(declare-fun c!93699 () Bool)

(assert (=> d!109939 (= c!93699 (and ((_ is Cons!17675) (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833))))) (= (_1!5970 (h!18806 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833)))))) key!673)))))

(assert (=> d!109939 (= (getValueByKey!433 (toList!5323 (map!12085 (v!11424 (underlying!538 thiss!833)))) key!673) e!494249)))

(declare-fun b!887511 () Bool)

(assert (=> b!887511 (= e!494250 None!437)))

(assert (= (and d!109939 c!93699) b!887508))

(assert (= (and d!109939 (not c!93699)) b!887509))

(assert (= (and b!887509 c!93700) b!887510))

(assert (= (and b!887509 (not c!93700)) b!887511))

(declare-fun m!827141 () Bool)

(assert (=> b!887510 m!827141))

(assert (=> b!887294 d!109939))

(assert (=> b!887294 d!109935))

(declare-fun condMapEmpty!28288 () Bool)

(declare-fun mapDefault!28288 () ValueCell!8439)

(assert (=> mapNonEmpty!28287 (= condMapEmpty!28288 (= mapRest!28287 ((as const (Array (_ BitVec 32) ValueCell!8439)) mapDefault!28288)))))

(declare-fun e!494251 () Bool)

(declare-fun mapRes!28288 () Bool)

(assert (=> mapNonEmpty!28287 (= tp!54482 (and e!494251 mapRes!28288))))

(declare-fun mapIsEmpty!28288 () Bool)

(assert (=> mapIsEmpty!28288 mapRes!28288))

(declare-fun b!887512 () Bool)

(declare-fun e!494252 () Bool)

(assert (=> b!887512 (= e!494252 tp_is_empty!17841)))

(declare-fun mapNonEmpty!28288 () Bool)

(declare-fun tp!54483 () Bool)

(assert (=> mapNonEmpty!28288 (= mapRes!28288 (and tp!54483 e!494252))))

(declare-fun mapValue!28288 () ValueCell!8439)

(declare-fun mapKey!28288 () (_ BitVec 32))

(declare-fun mapRest!28288 () (Array (_ BitVec 32) ValueCell!8439))

(assert (=> mapNonEmpty!28288 (= mapRest!28287 (store mapRest!28288 mapKey!28288 mapValue!28288))))

(declare-fun b!887513 () Bool)

(assert (=> b!887513 (= e!494251 tp_is_empty!17841)))

(assert (= (and mapNonEmpty!28287 condMapEmpty!28288) mapIsEmpty!28288))

(assert (= (and mapNonEmpty!28287 (not condMapEmpty!28288)) mapNonEmpty!28288))

(assert (= (and mapNonEmpty!28288 ((_ is ValueCellFull!8439) mapValue!28288)) b!887512))

(assert (= (and mapNonEmpty!28287 ((_ is ValueCellFull!8439) mapDefault!28288)) b!887513))

(declare-fun m!827143 () Bool)

(assert (=> mapNonEmpty!28288 m!827143))

(declare-fun b_lambda!12843 () Bool)

(assert (= b_lambda!12841 (or (and b!887228 b_free!15513) b_lambda!12843)))

(declare-fun b_lambda!12845 () Bool)

(assert (= b_lambda!12839 (or (and b!887228 b_free!15513) b_lambda!12845)))

(check-sat (not d!109911) (not b!887510) (not b!887389) (not b!887364) (not b!887469) (not d!109935) (not bm!39362) (not b!887461) (not bm!39345) (not b!887356) (not d!109915) (not d!109931) (not b_lambda!12843) (not b_lambda!12835) (not b!887366) (not d!109921) (not b_lambda!12845) (not b_lambda!12837) (not b!887405) (not b!887415) (not bm!39365) (not b_next!15513) (not bm!39346) (not bm!39344) (not b!887466) (not b!887504) (not b!887414) (not b!887464) (not d!109903) (not mapNonEmpty!28288) (not bm!39379) (not bm!39363) (not d!109923) (not b!887353) (not bm!39367) b_and!25735 (not b!887404) (not bm!39378) (not b!887468) tp_is_empty!17841 (not b!887475) (not b!887392) (not b!887485) (not b!887403) (not d!109927) (not b!887486) (not d!109933) (not d!109925) (not b!887417) (not b!887411) (not b!887506) (not b_lambda!12829) (not d!109913) (not b!887349) (not d!109905) (not b!887478) (not b!887472) (not b_lambda!12833) (not b_lambda!12831) (not b!887394))
(check-sat b_and!25735 (not b_next!15513))
