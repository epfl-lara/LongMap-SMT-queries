; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18124 () Bool)

(assert start!18124)

(declare-fun b!180279 () Bool)

(declare-fun b_free!4459 () Bool)

(declare-fun b_next!4459 () Bool)

(assert (=> b!180279 (= b_free!4459 (not b_next!4459))))

(declare-fun tp!16114 () Bool)

(declare-fun b_and!10967 () Bool)

(assert (=> b!180279 (= tp!16114 b_and!10967)))

(declare-fun b!180276 () Bool)

(declare-fun e!118748 () Bool)

(declare-fun e!118751 () Bool)

(assert (=> b!180276 (= e!118748 e!118751)))

(declare-fun res!85365 () Bool)

(assert (=> b!180276 (=> (not res!85365) (not e!118751))))

(declare-datatypes ((SeekEntryResult!602 0))(
  ( (MissingZero!602 (index!4578 (_ BitVec 32))) (Found!602 (index!4579 (_ BitVec 32))) (Intermediate!602 (undefined!1414 Bool) (index!4580 (_ BitVec 32)) (x!19735 (_ BitVec 32))) (Undefined!602) (MissingVacant!602 (index!4581 (_ BitVec 32))) )
))
(declare-fun lt!88993 () SeekEntryResult!602)

(get-info :version)

(assert (=> b!180276 (= res!85365 (and (not ((_ is Undefined!602) lt!88993)) (not ((_ is MissingVacant!602) lt!88993)) (not ((_ is MissingZero!602) lt!88993)) ((_ is Found!602) lt!88993)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5289 0))(
  ( (V!5290 (val!2160 Int)) )
))
(declare-datatypes ((ValueCell!1772 0))(
  ( (ValueCellFull!1772 (v!4047 V!5289)) (EmptyCell!1772) )
))
(declare-datatypes ((array!7615 0))(
  ( (array!7616 (arr!3604 (Array (_ BitVec 32) (_ BitVec 64))) (size!3913 (_ BitVec 32))) )
))
(declare-datatypes ((array!7617 0))(
  ( (array!7618 (arr!3605 (Array (_ BitVec 32) ValueCell!1772)) (size!3914 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2452 0))(
  ( (LongMapFixedSize!2453 (defaultEntry!3702 Int) (mask!8702 (_ BitVec 32)) (extraKeys!3439 (_ BitVec 32)) (zeroValue!3543 V!5289) (minValue!3543 V!5289) (_size!1275 (_ BitVec 32)) (_keys!5594 array!7615) (_values!3685 array!7617) (_vacant!1275 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2452)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7615 (_ BitVec 32)) SeekEntryResult!602)

(assert (=> b!180276 (= lt!88993 (seekEntryOrOpen!0 key!828 (_keys!5594 thiss!1248) (mask!8702 thiss!1248)))))

(declare-fun b!180277 () Bool)

(declare-fun e!118753 () Bool)

(declare-fun e!118752 () Bool)

(declare-fun mapRes!7246 () Bool)

(assert (=> b!180277 (= e!118753 (and e!118752 mapRes!7246))))

(declare-fun condMapEmpty!7246 () Bool)

(declare-fun mapDefault!7246 () ValueCell!1772)

(assert (=> b!180277 (= condMapEmpty!7246 (= (arr!3605 (_values!3685 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1772)) mapDefault!7246)))))

(declare-fun mapNonEmpty!7246 () Bool)

(declare-fun tp!16113 () Bool)

(declare-fun e!118747 () Bool)

(assert (=> mapNonEmpty!7246 (= mapRes!7246 (and tp!16113 e!118747))))

(declare-fun mapKey!7246 () (_ BitVec 32))

(declare-fun mapValue!7246 () ValueCell!1772)

(declare-fun mapRest!7246 () (Array (_ BitVec 32) ValueCell!1772))

(assert (=> mapNonEmpty!7246 (= (arr!3605 (_values!3685 thiss!1248)) (store mapRest!7246 mapKey!7246 mapValue!7246))))

(declare-fun e!118750 () Bool)

(declare-fun tp_is_empty!4231 () Bool)

(declare-fun array_inv!2331 (array!7615) Bool)

(declare-fun array_inv!2332 (array!7617) Bool)

(assert (=> b!180279 (= e!118750 (and tp!16114 tp_is_empty!4231 (array_inv!2331 (_keys!5594 thiss!1248)) (array_inv!2332 (_values!3685 thiss!1248)) e!118753))))

(declare-fun b!180280 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180280 (= e!118751 (not (validMask!0 (mask!8702 thiss!1248))))))

(declare-fun b!180281 () Bool)

(assert (=> b!180281 (= e!118752 tp_is_empty!4231)))

(declare-fun b!180282 () Bool)

(declare-fun res!85367 () Bool)

(assert (=> b!180282 (=> (not res!85367) (not e!118748))))

(assert (=> b!180282 (= res!85367 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7246 () Bool)

(assert (=> mapIsEmpty!7246 mapRes!7246))

(declare-fun b!180283 () Bool)

(assert (=> b!180283 (= e!118747 tp_is_empty!4231)))

(declare-fun res!85364 () Bool)

(assert (=> start!18124 (=> (not res!85364) (not e!118748))))

(declare-fun valid!1038 (LongMapFixedSize!2452) Bool)

(assert (=> start!18124 (= res!85364 (valid!1038 thiss!1248))))

(assert (=> start!18124 e!118748))

(assert (=> start!18124 e!118750))

(assert (=> start!18124 true))

(declare-fun b!180278 () Bool)

(declare-fun res!85366 () Bool)

(assert (=> b!180278 (=> (not res!85366) (not e!118751))))

(declare-datatypes ((tuple2!3346 0))(
  ( (tuple2!3347 (_1!1684 (_ BitVec 64)) (_2!1684 V!5289)) )
))
(declare-datatypes ((List!2294 0))(
  ( (Nil!2291) (Cons!2290 (h!2915 tuple2!3346) (t!7133 List!2294)) )
))
(declare-datatypes ((ListLongMap!2255 0))(
  ( (ListLongMap!2256 (toList!1143 List!2294)) )
))
(declare-fun contains!1225 (ListLongMap!2255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!776 (array!7615 array!7617 (_ BitVec 32) (_ BitVec 32) V!5289 V!5289 (_ BitVec 32) Int) ListLongMap!2255)

(assert (=> b!180278 (= res!85366 (contains!1225 (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)) key!828))))

(assert (= (and start!18124 res!85364) b!180282))

(assert (= (and b!180282 res!85367) b!180276))

(assert (= (and b!180276 res!85365) b!180278))

(assert (= (and b!180278 res!85366) b!180280))

(assert (= (and b!180277 condMapEmpty!7246) mapIsEmpty!7246))

(assert (= (and b!180277 (not condMapEmpty!7246)) mapNonEmpty!7246))

(assert (= (and mapNonEmpty!7246 ((_ is ValueCellFull!1772) mapValue!7246)) b!180283))

(assert (= (and b!180277 ((_ is ValueCellFull!1772) mapDefault!7246)) b!180281))

(assert (= b!180279 b!180277))

(assert (= start!18124 b!180279))

(declare-fun m!207845 () Bool)

(assert (=> b!180276 m!207845))

(declare-fun m!207847 () Bool)

(assert (=> b!180280 m!207847))

(declare-fun m!207849 () Bool)

(assert (=> start!18124 m!207849))

(declare-fun m!207851 () Bool)

(assert (=> b!180278 m!207851))

(assert (=> b!180278 m!207851))

(declare-fun m!207853 () Bool)

(assert (=> b!180278 m!207853))

(declare-fun m!207855 () Bool)

(assert (=> b!180279 m!207855))

(declare-fun m!207857 () Bool)

(assert (=> b!180279 m!207857))

(declare-fun m!207859 () Bool)

(assert (=> mapNonEmpty!7246 m!207859))

(check-sat (not mapNonEmpty!7246) tp_is_empty!4231 (not start!18124) (not b!180278) (not b!180280) (not b_next!4459) (not b!180279) (not b!180276) b_and!10967)
(check-sat b_and!10967 (not b_next!4459))
(get-model)

(declare-fun d!54085 () Bool)

(declare-fun e!118800 () Bool)

(assert (=> d!54085 e!118800))

(declare-fun res!85394 () Bool)

(assert (=> d!54085 (=> res!85394 e!118800)))

(declare-fun lt!89008 () Bool)

(assert (=> d!54085 (= res!85394 (not lt!89008))))

(declare-fun lt!89011 () Bool)

(assert (=> d!54085 (= lt!89008 lt!89011)))

(declare-datatypes ((Unit!5463 0))(
  ( (Unit!5464) )
))
(declare-fun lt!89010 () Unit!5463)

(declare-fun e!118801 () Unit!5463)

(assert (=> d!54085 (= lt!89010 e!118801)))

(declare-fun c!32289 () Bool)

(assert (=> d!54085 (= c!32289 lt!89011)))

(declare-fun containsKey!208 (List!2294 (_ BitVec 64)) Bool)

(assert (=> d!54085 (= lt!89011 (containsKey!208 (toList!1143 (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828))))

(assert (=> d!54085 (= (contains!1225 (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)) key!828) lt!89008)))

(declare-fun b!180338 () Bool)

(declare-fun lt!89009 () Unit!5463)

(assert (=> b!180338 (= e!118801 lt!89009)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!157 (List!2294 (_ BitVec 64)) Unit!5463)

(assert (=> b!180338 (= lt!89009 (lemmaContainsKeyImpliesGetValueByKeyDefined!157 (toList!1143 (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828))))

(declare-datatypes ((Option!210 0))(
  ( (Some!209 (v!4050 V!5289)) (None!208) )
))
(declare-fun isDefined!158 (Option!210) Bool)

(declare-fun getValueByKey!204 (List!2294 (_ BitVec 64)) Option!210)

(assert (=> b!180338 (isDefined!158 (getValueByKey!204 (toList!1143 (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828))))

(declare-fun b!180339 () Bool)

(declare-fun Unit!5465 () Unit!5463)

(assert (=> b!180339 (= e!118801 Unit!5465)))

(declare-fun b!180340 () Bool)

(assert (=> b!180340 (= e!118800 (isDefined!158 (getValueByKey!204 (toList!1143 (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248))) key!828)))))

(assert (= (and d!54085 c!32289) b!180338))

(assert (= (and d!54085 (not c!32289)) b!180339))

(assert (= (and d!54085 (not res!85394)) b!180340))

(declare-fun m!207893 () Bool)

(assert (=> d!54085 m!207893))

(declare-fun m!207895 () Bool)

(assert (=> b!180338 m!207895))

(declare-fun m!207897 () Bool)

(assert (=> b!180338 m!207897))

(assert (=> b!180338 m!207897))

(declare-fun m!207899 () Bool)

(assert (=> b!180338 m!207899))

(assert (=> b!180340 m!207897))

(assert (=> b!180340 m!207897))

(assert (=> b!180340 m!207899))

(assert (=> b!180278 d!54085))

(declare-fun b!180383 () Bool)

(declare-fun res!85420 () Bool)

(declare-fun e!118832 () Bool)

(assert (=> b!180383 (=> (not res!85420) (not e!118832))))

(declare-fun e!118837 () Bool)

(assert (=> b!180383 (= res!85420 e!118837)))

(declare-fun res!85414 () Bool)

(assert (=> b!180383 (=> res!85414 e!118837)))

(declare-fun e!118840 () Bool)

(assert (=> b!180383 (= res!85414 (not e!118840))))

(declare-fun res!85416 () Bool)

(assert (=> b!180383 (=> (not res!85416) (not e!118840))))

(assert (=> b!180383 (= res!85416 (bvslt #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))))))

(declare-fun b!180384 () Bool)

(declare-fun e!118838 () Unit!5463)

(declare-fun lt!89061 () Unit!5463)

(assert (=> b!180384 (= e!118838 lt!89061)))

(declare-fun lt!89064 () ListLongMap!2255)

(declare-fun getCurrentListMapNoExtraKeys!170 (array!7615 array!7617 (_ BitVec 32) (_ BitVec 32) V!5289 V!5289 (_ BitVec 32) Int) ListLongMap!2255)

(assert (=> b!180384 (= lt!89064 (getCurrentListMapNoExtraKeys!170 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89057 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89066 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89066 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89070 () Unit!5463)

(declare-fun addStillContains!125 (ListLongMap!2255 (_ BitVec 64) V!5289 (_ BitVec 64)) Unit!5463)

(assert (=> b!180384 (= lt!89070 (addStillContains!125 lt!89064 lt!89057 (zeroValue!3543 thiss!1248) lt!89066))))

(declare-fun +!266 (ListLongMap!2255 tuple2!3346) ListLongMap!2255)

(assert (=> b!180384 (contains!1225 (+!266 lt!89064 (tuple2!3347 lt!89057 (zeroValue!3543 thiss!1248))) lt!89066)))

(declare-fun lt!89067 () Unit!5463)

(assert (=> b!180384 (= lt!89067 lt!89070)))

(declare-fun lt!89076 () ListLongMap!2255)

(assert (=> b!180384 (= lt!89076 (getCurrentListMapNoExtraKeys!170 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89077 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89077 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89058 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89058 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89069 () Unit!5463)

(declare-fun addApplyDifferent!125 (ListLongMap!2255 (_ BitVec 64) V!5289 (_ BitVec 64)) Unit!5463)

(assert (=> b!180384 (= lt!89069 (addApplyDifferent!125 lt!89076 lt!89077 (minValue!3543 thiss!1248) lt!89058))))

(declare-fun apply!149 (ListLongMap!2255 (_ BitVec 64)) V!5289)

(assert (=> b!180384 (= (apply!149 (+!266 lt!89076 (tuple2!3347 lt!89077 (minValue!3543 thiss!1248))) lt!89058) (apply!149 lt!89076 lt!89058))))

(declare-fun lt!89072 () Unit!5463)

(assert (=> b!180384 (= lt!89072 lt!89069)))

(declare-fun lt!89056 () ListLongMap!2255)

(assert (=> b!180384 (= lt!89056 (getCurrentListMapNoExtraKeys!170 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89074 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89074 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89062 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89062 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89065 () Unit!5463)

(assert (=> b!180384 (= lt!89065 (addApplyDifferent!125 lt!89056 lt!89074 (zeroValue!3543 thiss!1248) lt!89062))))

(assert (=> b!180384 (= (apply!149 (+!266 lt!89056 (tuple2!3347 lt!89074 (zeroValue!3543 thiss!1248))) lt!89062) (apply!149 lt!89056 lt!89062))))

(declare-fun lt!89060 () Unit!5463)

(assert (=> b!180384 (= lt!89060 lt!89065)))

(declare-fun lt!89075 () ListLongMap!2255)

(assert (=> b!180384 (= lt!89075 (getCurrentListMapNoExtraKeys!170 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun lt!89071 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89071 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89063 () (_ BitVec 64))

(assert (=> b!180384 (= lt!89063 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180384 (= lt!89061 (addApplyDifferent!125 lt!89075 lt!89071 (minValue!3543 thiss!1248) lt!89063))))

(assert (=> b!180384 (= (apply!149 (+!266 lt!89075 (tuple2!3347 lt!89071 (minValue!3543 thiss!1248))) lt!89063) (apply!149 lt!89075 lt!89063))))

(declare-fun b!180385 () Bool)

(declare-fun res!85419 () Bool)

(assert (=> b!180385 (=> (not res!85419) (not e!118832))))

(declare-fun e!118839 () Bool)

(assert (=> b!180385 (= res!85419 e!118839)))

(declare-fun c!32302 () Bool)

(assert (=> b!180385 (= c!32302 (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!180386 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180386 (= e!118840 (validKeyInArray!0 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18223 () Bool)

(declare-fun call!18230 () ListLongMap!2255)

(declare-fun call!18231 () ListLongMap!2255)

(assert (=> bm!18223 (= call!18230 call!18231)))

(declare-fun b!180387 () Bool)

(declare-fun e!118835 () ListLongMap!2255)

(declare-fun call!18228 () ListLongMap!2255)

(assert (=> b!180387 (= e!118835 call!18228)))

(declare-fun call!18226 () ListLongMap!2255)

(declare-fun bm!18224 () Bool)

(declare-fun c!32303 () Bool)

(declare-fun call!18227 () ListLongMap!2255)

(declare-fun c!32304 () Bool)

(assert (=> bm!18224 (= call!18227 (+!266 (ite c!32304 call!18226 (ite c!32303 call!18231 call!18230)) (ite (or c!32304 c!32303) (tuple2!3347 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3543 thiss!1248)) (tuple2!3347 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3543 thiss!1248)))))))

(declare-fun b!180389 () Bool)

(declare-fun e!118834 () Bool)

(assert (=> b!180389 (= e!118839 e!118834)))

(declare-fun res!85421 () Bool)

(declare-fun call!18229 () Bool)

(assert (=> b!180389 (= res!85421 call!18229)))

(assert (=> b!180389 (=> (not res!85421) (not e!118834))))

(declare-fun b!180390 () Bool)

(declare-fun e!118829 () Bool)

(assert (=> b!180390 (= e!118837 e!118829)))

(declare-fun res!85418 () Bool)

(assert (=> b!180390 (=> (not res!85418) (not e!118829))))

(declare-fun lt!89073 () ListLongMap!2255)

(assert (=> b!180390 (= res!85418 (contains!1225 lt!89073 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))))))

(declare-fun b!180391 () Bool)

(declare-fun get!2058 (ValueCell!1772 V!5289) V!5289)

(declare-fun dynLambda!483 (Int (_ BitVec 64)) V!5289)

(assert (=> b!180391 (= e!118829 (= (apply!149 lt!89073 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000)) (get!2058 (select (arr!3605 (_values!3685 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!483 (defaultEntry!3702 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3914 (_values!3685 thiss!1248))))))

(assert (=> b!180391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))))))

(declare-fun b!180392 () Bool)

(declare-fun e!118833 () ListLongMap!2255)

(assert (=> b!180392 (= e!118833 call!18230)))

(declare-fun b!180393 () Bool)

(declare-fun Unit!5466 () Unit!5463)

(assert (=> b!180393 (= e!118838 Unit!5466)))

(declare-fun bm!18225 () Bool)

(declare-fun call!18232 () Bool)

(assert (=> bm!18225 (= call!18232 (contains!1225 lt!89073 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180394 () Bool)

(assert (=> b!180394 (= e!118834 (= (apply!149 lt!89073 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3543 thiss!1248)))))

(declare-fun b!180395 () Bool)

(declare-fun e!118828 () Bool)

(assert (=> b!180395 (= e!118828 (= (apply!149 lt!89073 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3543 thiss!1248)))))

(declare-fun b!180396 () Bool)

(declare-fun e!118836 () ListLongMap!2255)

(assert (=> b!180396 (= e!118836 e!118835)))

(assert (=> b!180396 (= c!32303 (and (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18226 () Bool)

(assert (=> bm!18226 (= call!18229 (contains!1225 lt!89073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18227 () Bool)

(assert (=> bm!18227 (= call!18228 call!18227)))

(declare-fun b!180397 () Bool)

(declare-fun e!118830 () Bool)

(assert (=> b!180397 (= e!118832 e!118830)))

(declare-fun c!32306 () Bool)

(assert (=> b!180397 (= c!32306 (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180398 () Bool)

(assert (=> b!180398 (= e!118830 e!118828)))

(declare-fun res!85415 () Bool)

(assert (=> b!180398 (= res!85415 call!18232)))

(assert (=> b!180398 (=> (not res!85415) (not e!118828))))

(declare-fun b!180388 () Bool)

(assert (=> b!180388 (= e!118833 call!18228)))

(declare-fun d!54087 () Bool)

(assert (=> d!54087 e!118832))

(declare-fun res!85417 () Bool)

(assert (=> d!54087 (=> (not res!85417) (not e!118832))))

(assert (=> d!54087 (= res!85417 (or (bvsge #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))))))))

(declare-fun lt!89068 () ListLongMap!2255)

(assert (=> d!54087 (= lt!89073 lt!89068)))

(declare-fun lt!89059 () Unit!5463)

(assert (=> d!54087 (= lt!89059 e!118838)))

(declare-fun c!32305 () Bool)

(declare-fun e!118831 () Bool)

(assert (=> d!54087 (= c!32305 e!118831)))

(declare-fun res!85413 () Bool)

(assert (=> d!54087 (=> (not res!85413) (not e!118831))))

(assert (=> d!54087 (= res!85413 (bvslt #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))))))

(assert (=> d!54087 (= lt!89068 e!118836)))

(assert (=> d!54087 (= c!32304 (and (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54087 (validMask!0 (mask!8702 thiss!1248))))

(assert (=> d!54087 (= (getCurrentListMap!776 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)) lt!89073)))

(declare-fun bm!18228 () Bool)

(assert (=> bm!18228 (= call!18226 (getCurrentListMapNoExtraKeys!170 (_keys!5594 thiss!1248) (_values!3685 thiss!1248) (mask!8702 thiss!1248) (extraKeys!3439 thiss!1248) (zeroValue!3543 thiss!1248) (minValue!3543 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3702 thiss!1248)))))

(declare-fun bm!18229 () Bool)

(assert (=> bm!18229 (= call!18231 call!18226)))

(declare-fun b!180399 () Bool)

(assert (=> b!180399 (= e!118831 (validKeyInArray!0 (select (arr!3604 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180400 () Bool)

(assert (=> b!180400 (= e!118839 (not call!18229))))

(declare-fun b!180401 () Bool)

(assert (=> b!180401 (= e!118830 (not call!18232))))

(declare-fun b!180402 () Bool)

(assert (=> b!180402 (= e!118836 (+!266 call!18227 (tuple2!3347 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3543 thiss!1248))))))

(declare-fun b!180403 () Bool)

(declare-fun c!32307 () Bool)

(assert (=> b!180403 (= c!32307 (and (not (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3439 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!180403 (= e!118835 e!118833)))

(assert (= (and d!54087 c!32304) b!180402))

(assert (= (and d!54087 (not c!32304)) b!180396))

(assert (= (and b!180396 c!32303) b!180387))

(assert (= (and b!180396 (not c!32303)) b!180403))

(assert (= (and b!180403 c!32307) b!180388))

(assert (= (and b!180403 (not c!32307)) b!180392))

(assert (= (or b!180388 b!180392) bm!18223))

(assert (= (or b!180387 bm!18223) bm!18229))

(assert (= (or b!180387 b!180388) bm!18227))

(assert (= (or b!180402 bm!18229) bm!18228))

(assert (= (or b!180402 bm!18227) bm!18224))

(assert (= (and d!54087 res!85413) b!180399))

(assert (= (and d!54087 c!32305) b!180384))

(assert (= (and d!54087 (not c!32305)) b!180393))

(assert (= (and d!54087 res!85417) b!180383))

(assert (= (and b!180383 res!85416) b!180386))

(assert (= (and b!180383 (not res!85414)) b!180390))

(assert (= (and b!180390 res!85418) b!180391))

(assert (= (and b!180383 res!85420) b!180385))

(assert (= (and b!180385 c!32302) b!180389))

(assert (= (and b!180385 (not c!32302)) b!180400))

(assert (= (and b!180389 res!85421) b!180394))

(assert (= (or b!180389 b!180400) bm!18226))

(assert (= (and b!180385 res!85419) b!180397))

(assert (= (and b!180397 c!32306) b!180398))

(assert (= (and b!180397 (not c!32306)) b!180401))

(assert (= (and b!180398 res!85415) b!180395))

(assert (= (or b!180398 b!180401) bm!18225))

(declare-fun b_lambda!7101 () Bool)

(assert (=> (not b_lambda!7101) (not b!180391)))

(declare-fun t!7135 () Bool)

(declare-fun tb!2801 () Bool)

(assert (=> (and b!180279 (= (defaultEntry!3702 thiss!1248) (defaultEntry!3702 thiss!1248)) t!7135) tb!2801))

(declare-fun result!4697 () Bool)

(assert (=> tb!2801 (= result!4697 tp_is_empty!4231)))

(assert (=> b!180391 t!7135))

(declare-fun b_and!10973 () Bool)

(assert (= b_and!10967 (and (=> t!7135 result!4697) b_and!10973)))

(declare-fun m!207901 () Bool)

(assert (=> bm!18228 m!207901))

(assert (=> d!54087 m!207847))

(declare-fun m!207903 () Bool)

(assert (=> b!180394 m!207903))

(declare-fun m!207905 () Bool)

(assert (=> bm!18226 m!207905))

(declare-fun m!207907 () Bool)

(assert (=> b!180399 m!207907))

(assert (=> b!180399 m!207907))

(declare-fun m!207909 () Bool)

(assert (=> b!180399 m!207909))

(declare-fun m!207911 () Bool)

(assert (=> bm!18224 m!207911))

(declare-fun m!207913 () Bool)

(assert (=> bm!18225 m!207913))

(declare-fun m!207915 () Bool)

(assert (=> b!180391 m!207915))

(declare-fun m!207917 () Bool)

(assert (=> b!180391 m!207917))

(declare-fun m!207919 () Bool)

(assert (=> b!180391 m!207919))

(assert (=> b!180391 m!207907))

(declare-fun m!207921 () Bool)

(assert (=> b!180391 m!207921))

(assert (=> b!180391 m!207907))

(assert (=> b!180391 m!207917))

(assert (=> b!180391 m!207915))

(declare-fun m!207923 () Bool)

(assert (=> b!180395 m!207923))

(assert (=> b!180386 m!207907))

(assert (=> b!180386 m!207907))

(assert (=> b!180386 m!207909))

(declare-fun m!207925 () Bool)

(assert (=> b!180384 m!207925))

(declare-fun m!207927 () Bool)

(assert (=> b!180384 m!207927))

(declare-fun m!207929 () Bool)

(assert (=> b!180384 m!207929))

(declare-fun m!207931 () Bool)

(assert (=> b!180384 m!207931))

(assert (=> b!180384 m!207901))

(assert (=> b!180384 m!207925))

(declare-fun m!207933 () Bool)

(assert (=> b!180384 m!207933))

(declare-fun m!207935 () Bool)

(assert (=> b!180384 m!207935))

(declare-fun m!207937 () Bool)

(assert (=> b!180384 m!207937))

(declare-fun m!207939 () Bool)

(assert (=> b!180384 m!207939))

(declare-fun m!207941 () Bool)

(assert (=> b!180384 m!207941))

(declare-fun m!207943 () Bool)

(assert (=> b!180384 m!207943))

(declare-fun m!207945 () Bool)

(assert (=> b!180384 m!207945))

(assert (=> b!180384 m!207939))

(declare-fun m!207947 () Bool)

(assert (=> b!180384 m!207947))

(declare-fun m!207949 () Bool)

(assert (=> b!180384 m!207949))

(assert (=> b!180384 m!207931))

(declare-fun m!207951 () Bool)

(assert (=> b!180384 m!207951))

(assert (=> b!180384 m!207941))

(assert (=> b!180384 m!207907))

(declare-fun m!207953 () Bool)

(assert (=> b!180384 m!207953))

(assert (=> b!180390 m!207907))

(assert (=> b!180390 m!207907))

(declare-fun m!207955 () Bool)

(assert (=> b!180390 m!207955))

(declare-fun m!207957 () Bool)

(assert (=> b!180402 m!207957))

(assert (=> b!180278 d!54087))

(declare-fun d!54089 () Bool)

(declare-fun res!85428 () Bool)

(declare-fun e!118843 () Bool)

(assert (=> d!54089 (=> (not res!85428) (not e!118843))))

(declare-fun simpleValid!165 (LongMapFixedSize!2452) Bool)

(assert (=> d!54089 (= res!85428 (simpleValid!165 thiss!1248))))

(assert (=> d!54089 (= (valid!1038 thiss!1248) e!118843)))

(declare-fun b!180412 () Bool)

(declare-fun res!85429 () Bool)

(assert (=> b!180412 (=> (not res!85429) (not e!118843))))

(declare-fun arrayCountValidKeys!0 (array!7615 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180412 (= res!85429 (= (arrayCountValidKeys!0 (_keys!5594 thiss!1248) #b00000000000000000000000000000000 (size!3913 (_keys!5594 thiss!1248))) (_size!1275 thiss!1248)))))

(declare-fun b!180413 () Bool)

(declare-fun res!85430 () Bool)

(assert (=> b!180413 (=> (not res!85430) (not e!118843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7615 (_ BitVec 32)) Bool)

(assert (=> b!180413 (= res!85430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5594 thiss!1248) (mask!8702 thiss!1248)))))

(declare-fun b!180414 () Bool)

(declare-datatypes ((List!2295 0))(
  ( (Nil!2292) (Cons!2291 (h!2916 (_ BitVec 64)) (t!7136 List!2295)) )
))
(declare-fun arrayNoDuplicates!0 (array!7615 (_ BitVec 32) List!2295) Bool)

(assert (=> b!180414 (= e!118843 (arrayNoDuplicates!0 (_keys!5594 thiss!1248) #b00000000000000000000000000000000 Nil!2292))))

(assert (= (and d!54089 res!85428) b!180412))

(assert (= (and b!180412 res!85429) b!180413))

(assert (= (and b!180413 res!85430) b!180414))

(declare-fun m!207959 () Bool)

(assert (=> d!54089 m!207959))

(declare-fun m!207961 () Bool)

(assert (=> b!180412 m!207961))

(declare-fun m!207963 () Bool)

(assert (=> b!180413 m!207963))

(declare-fun m!207965 () Bool)

(assert (=> b!180414 m!207965))

(assert (=> start!18124 d!54089))

(declare-fun d!54091 () Bool)

(assert (=> d!54091 (= (array_inv!2331 (_keys!5594 thiss!1248)) (bvsge (size!3913 (_keys!5594 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180279 d!54091))

(declare-fun d!54093 () Bool)

(assert (=> d!54093 (= (array_inv!2332 (_values!3685 thiss!1248)) (bvsge (size!3914 (_values!3685 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180279 d!54093))

(declare-fun b!180427 () Bool)

(declare-fun e!118852 () SeekEntryResult!602)

(declare-fun lt!89085 () SeekEntryResult!602)

(assert (=> b!180427 (= e!118852 (Found!602 (index!4580 lt!89085)))))

(declare-fun b!180428 () Bool)

(declare-fun e!118851 () SeekEntryResult!602)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7615 (_ BitVec 32)) SeekEntryResult!602)

(assert (=> b!180428 (= e!118851 (seekKeyOrZeroReturnVacant!0 (x!19735 lt!89085) (index!4580 lt!89085) (index!4580 lt!89085) key!828 (_keys!5594 thiss!1248) (mask!8702 thiss!1248)))))

(declare-fun d!54095 () Bool)

(declare-fun lt!89084 () SeekEntryResult!602)

(assert (=> d!54095 (and (or ((_ is Undefined!602) lt!89084) (not ((_ is Found!602) lt!89084)) (and (bvsge (index!4579 lt!89084) #b00000000000000000000000000000000) (bvslt (index!4579 lt!89084) (size!3913 (_keys!5594 thiss!1248))))) (or ((_ is Undefined!602) lt!89084) ((_ is Found!602) lt!89084) (not ((_ is MissingZero!602) lt!89084)) (and (bvsge (index!4578 lt!89084) #b00000000000000000000000000000000) (bvslt (index!4578 lt!89084) (size!3913 (_keys!5594 thiss!1248))))) (or ((_ is Undefined!602) lt!89084) ((_ is Found!602) lt!89084) ((_ is MissingZero!602) lt!89084) (not ((_ is MissingVacant!602) lt!89084)) (and (bvsge (index!4581 lt!89084) #b00000000000000000000000000000000) (bvslt (index!4581 lt!89084) (size!3913 (_keys!5594 thiss!1248))))) (or ((_ is Undefined!602) lt!89084) (ite ((_ is Found!602) lt!89084) (= (select (arr!3604 (_keys!5594 thiss!1248)) (index!4579 lt!89084)) key!828) (ite ((_ is MissingZero!602) lt!89084) (= (select (arr!3604 (_keys!5594 thiss!1248)) (index!4578 lt!89084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!602) lt!89084) (= (select (arr!3604 (_keys!5594 thiss!1248)) (index!4581 lt!89084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118850 () SeekEntryResult!602)

(assert (=> d!54095 (= lt!89084 e!118850)))

(declare-fun c!32314 () Bool)

(assert (=> d!54095 (= c!32314 (and ((_ is Intermediate!602) lt!89085) (undefined!1414 lt!89085)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7615 (_ BitVec 32)) SeekEntryResult!602)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54095 (= lt!89085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8702 thiss!1248)) key!828 (_keys!5594 thiss!1248) (mask!8702 thiss!1248)))))

(assert (=> d!54095 (validMask!0 (mask!8702 thiss!1248))))

(assert (=> d!54095 (= (seekEntryOrOpen!0 key!828 (_keys!5594 thiss!1248) (mask!8702 thiss!1248)) lt!89084)))

(declare-fun b!180429 () Bool)

(declare-fun c!32316 () Bool)

(declare-fun lt!89086 () (_ BitVec 64))

(assert (=> b!180429 (= c!32316 (= lt!89086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180429 (= e!118852 e!118851)))

(declare-fun b!180430 () Bool)

(assert (=> b!180430 (= e!118850 Undefined!602)))

(declare-fun b!180431 () Bool)

(assert (=> b!180431 (= e!118850 e!118852)))

(assert (=> b!180431 (= lt!89086 (select (arr!3604 (_keys!5594 thiss!1248)) (index!4580 lt!89085)))))

(declare-fun c!32315 () Bool)

(assert (=> b!180431 (= c!32315 (= lt!89086 key!828))))

(declare-fun b!180432 () Bool)

(assert (=> b!180432 (= e!118851 (MissingZero!602 (index!4580 lt!89085)))))

(assert (= (and d!54095 c!32314) b!180430))

(assert (= (and d!54095 (not c!32314)) b!180431))

(assert (= (and b!180431 c!32315) b!180427))

(assert (= (and b!180431 (not c!32315)) b!180429))

(assert (= (and b!180429 c!32316) b!180432))

(assert (= (and b!180429 (not c!32316)) b!180428))

(declare-fun m!207967 () Bool)

(assert (=> b!180428 m!207967))

(declare-fun m!207969 () Bool)

(assert (=> d!54095 m!207969))

(assert (=> d!54095 m!207847))

(declare-fun m!207971 () Bool)

(assert (=> d!54095 m!207971))

(assert (=> d!54095 m!207969))

(declare-fun m!207973 () Bool)

(assert (=> d!54095 m!207973))

(declare-fun m!207975 () Bool)

(assert (=> d!54095 m!207975))

(declare-fun m!207977 () Bool)

(assert (=> d!54095 m!207977))

(declare-fun m!207979 () Bool)

(assert (=> b!180431 m!207979))

(assert (=> b!180276 d!54095))

(declare-fun d!54097 () Bool)

(assert (=> d!54097 (= (validMask!0 (mask!8702 thiss!1248)) (and (or (= (mask!8702 thiss!1248) #b00000000000000000000000000000111) (= (mask!8702 thiss!1248) #b00000000000000000000000000001111) (= (mask!8702 thiss!1248) #b00000000000000000000000000011111) (= (mask!8702 thiss!1248) #b00000000000000000000000000111111) (= (mask!8702 thiss!1248) #b00000000000000000000000001111111) (= (mask!8702 thiss!1248) #b00000000000000000000000011111111) (= (mask!8702 thiss!1248) #b00000000000000000000000111111111) (= (mask!8702 thiss!1248) #b00000000000000000000001111111111) (= (mask!8702 thiss!1248) #b00000000000000000000011111111111) (= (mask!8702 thiss!1248) #b00000000000000000000111111111111) (= (mask!8702 thiss!1248) #b00000000000000000001111111111111) (= (mask!8702 thiss!1248) #b00000000000000000011111111111111) (= (mask!8702 thiss!1248) #b00000000000000000111111111111111) (= (mask!8702 thiss!1248) #b00000000000000001111111111111111) (= (mask!8702 thiss!1248) #b00000000000000011111111111111111) (= (mask!8702 thiss!1248) #b00000000000000111111111111111111) (= (mask!8702 thiss!1248) #b00000000000001111111111111111111) (= (mask!8702 thiss!1248) #b00000000000011111111111111111111) (= (mask!8702 thiss!1248) #b00000000000111111111111111111111) (= (mask!8702 thiss!1248) #b00000000001111111111111111111111) (= (mask!8702 thiss!1248) #b00000000011111111111111111111111) (= (mask!8702 thiss!1248) #b00000000111111111111111111111111) (= (mask!8702 thiss!1248) #b00000001111111111111111111111111) (= (mask!8702 thiss!1248) #b00000011111111111111111111111111) (= (mask!8702 thiss!1248) #b00000111111111111111111111111111) (= (mask!8702 thiss!1248) #b00001111111111111111111111111111) (= (mask!8702 thiss!1248) #b00011111111111111111111111111111) (= (mask!8702 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8702 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180280 d!54097))

(declare-fun b!180439 () Bool)

(declare-fun e!118858 () Bool)

(assert (=> b!180439 (= e!118858 tp_is_empty!4231)))

(declare-fun mapNonEmpty!7255 () Bool)

(declare-fun mapRes!7255 () Bool)

(declare-fun tp!16129 () Bool)

(assert (=> mapNonEmpty!7255 (= mapRes!7255 (and tp!16129 e!118858))))

(declare-fun mapKey!7255 () (_ BitVec 32))

(declare-fun mapRest!7255 () (Array (_ BitVec 32) ValueCell!1772))

(declare-fun mapValue!7255 () ValueCell!1772)

(assert (=> mapNonEmpty!7255 (= mapRest!7246 (store mapRest!7255 mapKey!7255 mapValue!7255))))

(declare-fun mapIsEmpty!7255 () Bool)

(assert (=> mapIsEmpty!7255 mapRes!7255))

(declare-fun condMapEmpty!7255 () Bool)

(declare-fun mapDefault!7255 () ValueCell!1772)

(assert (=> mapNonEmpty!7246 (= condMapEmpty!7255 (= mapRest!7246 ((as const (Array (_ BitVec 32) ValueCell!1772)) mapDefault!7255)))))

(declare-fun e!118857 () Bool)

(assert (=> mapNonEmpty!7246 (= tp!16113 (and e!118857 mapRes!7255))))

(declare-fun b!180440 () Bool)

(assert (=> b!180440 (= e!118857 tp_is_empty!4231)))

(assert (= (and mapNonEmpty!7246 condMapEmpty!7255) mapIsEmpty!7255))

(assert (= (and mapNonEmpty!7246 (not condMapEmpty!7255)) mapNonEmpty!7255))

(assert (= (and mapNonEmpty!7255 ((_ is ValueCellFull!1772) mapValue!7255)) b!180439))

(assert (= (and mapNonEmpty!7246 ((_ is ValueCellFull!1772) mapDefault!7255)) b!180440))

(declare-fun m!207981 () Bool)

(assert (=> mapNonEmpty!7255 m!207981))

(declare-fun b_lambda!7103 () Bool)

(assert (= b_lambda!7101 (or (and b!180279 b_free!4459) b_lambda!7103)))

(check-sat (not bm!18225) (not b_lambda!7103) (not b!180386) (not b!180394) (not d!54087) tp_is_empty!4231 (not b!180402) (not b!180414) (not b!180413) (not d!54095) (not b_next!4459) b_and!10973 (not b!180399) (not b!180338) (not d!54085) (not b!180412) (not b!180340) (not b!180391) (not bm!18228) (not b!180390) (not d!54089) (not b!180428) (not bm!18226) (not b!180395) (not mapNonEmpty!7255) (not bm!18224) (not b!180384))
(check-sat b_and!10973 (not b_next!4459))
