; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19136 () Bool)

(assert start!19136)

(declare-fun b!188296 () Bool)

(declare-fun b_free!4623 () Bool)

(declare-fun b_next!4623 () Bool)

(assert (=> b!188296 (= b_free!4623 (not b_next!4623))))

(declare-fun tp!16689 () Bool)

(declare-fun b_and!11253 () Bool)

(assert (=> b!188296 (= tp!16689 b_and!11253)))

(declare-fun b!188294 () Bool)

(declare-fun res!89013 () Bool)

(declare-fun e!123925 () Bool)

(assert (=> b!188294 (=> (not res!89013) (not e!123925))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!188294 (= res!89013 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188295 () Bool)

(declare-datatypes ((Unit!5676 0))(
  ( (Unit!5677) )
))
(declare-fun e!123924 () Unit!5676)

(declare-fun Unit!5678 () Unit!5676)

(assert (=> b!188295 (= e!123924 Unit!5678)))

(declare-fun lt!93184 () Unit!5676)

(declare-datatypes ((V!5507 0))(
  ( (V!5508 (val!2242 Int)) )
))
(declare-datatypes ((ValueCell!1854 0))(
  ( (ValueCellFull!1854 (v!4159 V!5507)) (EmptyCell!1854) )
))
(declare-datatypes ((array!8011 0))(
  ( (array!8012 (arr!3779 (Array (_ BitVec 32) (_ BitVec 64))) (size!4099 (_ BitVec 32))) )
))
(declare-datatypes ((array!8013 0))(
  ( (array!8014 (arr!3780 (Array (_ BitVec 32) ValueCell!1854)) (size!4100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2616 0))(
  ( (LongMapFixedSize!2617 (defaultEntry!3840 Int) (mask!9003 (_ BitVec 32)) (extraKeys!3577 (_ BitVec 32)) (zeroValue!3681 V!5507) (minValue!3681 V!5507) (_size!1357 (_ BitVec 32)) (_keys!5799 array!8011) (_values!3823 array!8013) (_vacant!1357 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2616)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!159 (array!8011 array!8013 (_ BitVec 32) (_ BitVec 32) V!5507 V!5507 (_ BitVec 64) Int) Unit!5676)

(assert (=> b!188295 (= lt!93184 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!159 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) key!828 (defaultEntry!3840 thiss!1248)))))

(assert (=> b!188295 false))

(declare-fun e!123919 () Bool)

(declare-fun e!123927 () Bool)

(declare-fun tp_is_empty!4395 () Bool)

(declare-fun array_inv!2447 (array!8011) Bool)

(declare-fun array_inv!2448 (array!8013) Bool)

(assert (=> b!188296 (= e!123919 (and tp!16689 tp_is_empty!4395 (array_inv!2447 (_keys!5799 thiss!1248)) (array_inv!2448 (_values!3823 thiss!1248)) e!123927))))

(declare-fun b!188297 () Bool)

(declare-fun e!123920 () Bool)

(assert (=> b!188297 (= e!123920 tp_is_empty!4395)))

(declare-fun b!188298 () Bool)

(declare-fun res!89014 () Bool)

(declare-fun e!123922 () Bool)

(assert (=> b!188298 (=> (not res!89014) (not e!123922))))

(assert (=> b!188298 (= res!89014 (and (= (size!4100 (_values!3823 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9003 thiss!1248))) (= (size!4099 (_keys!5799 thiss!1248)) (size!4100 (_values!3823 thiss!1248))) (bvsge (mask!9003 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3577 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3577 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7576 () Bool)

(declare-fun mapRes!7576 () Bool)

(declare-fun tp!16690 () Bool)

(assert (=> mapNonEmpty!7576 (= mapRes!7576 (and tp!16690 e!123920))))

(declare-fun mapRest!7576 () (Array (_ BitVec 32) ValueCell!1854))

(declare-fun mapValue!7576 () ValueCell!1854)

(declare-fun mapKey!7576 () (_ BitVec 32))

(assert (=> mapNonEmpty!7576 (= (arr!3780 (_values!3823 thiss!1248)) (store mapRest!7576 mapKey!7576 mapValue!7576))))

(declare-fun b!188299 () Bool)

(declare-fun lt!93183 () Unit!5676)

(assert (=> b!188299 (= e!123924 lt!93183)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!155 (array!8011 array!8013 (_ BitVec 32) (_ BitVec 32) V!5507 V!5507 (_ BitVec 64) Int) Unit!5676)

(assert (=> b!188299 (= lt!93183 (lemmaInListMapThenSeekEntryOrOpenFindsIt!155 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) key!828 (defaultEntry!3840 thiss!1248)))))

(declare-fun res!89017 () Bool)

(declare-datatypes ((SeekEntryResult!653 0))(
  ( (MissingZero!653 (index!4782 (_ BitVec 32))) (Found!653 (index!4783 (_ BitVec 32))) (Intermediate!653 (undefined!1465 Bool) (index!4784 (_ BitVec 32)) (x!20339 (_ BitVec 32))) (Undefined!653) (MissingVacant!653 (index!4785 (_ BitVec 32))) )
))
(declare-fun lt!93182 () SeekEntryResult!653)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188299 (= res!89017 (inRange!0 (index!4783 lt!93182) (mask!9003 thiss!1248)))))

(declare-fun e!123918 () Bool)

(assert (=> b!188299 (=> (not res!89017) (not e!123918))))

(assert (=> b!188299 e!123918))

(declare-fun mapIsEmpty!7576 () Bool)

(assert (=> mapIsEmpty!7576 mapRes!7576))

(declare-fun res!89015 () Bool)

(assert (=> start!19136 (=> (not res!89015) (not e!123925))))

(declare-fun valid!1077 (LongMapFixedSize!2616) Bool)

(assert (=> start!19136 (= res!89015 (valid!1077 thiss!1248))))

(assert (=> start!19136 e!123925))

(assert (=> start!19136 e!123919))

(assert (=> start!19136 true))

(declare-fun b!188300 () Bool)

(declare-fun e!123921 () Bool)

(assert (=> b!188300 (= e!123925 e!123921)))

(declare-fun res!89016 () Bool)

(assert (=> b!188300 (=> (not res!89016) (not e!123921))))

(get-info :version)

(assert (=> b!188300 (= res!89016 (and (not ((_ is Undefined!653) lt!93182)) (not ((_ is MissingVacant!653) lt!93182)) (not ((_ is MissingZero!653) lt!93182)) ((_ is Found!653) lt!93182)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8011 (_ BitVec 32)) SeekEntryResult!653)

(assert (=> b!188300 (= lt!93182 (seekEntryOrOpen!0 key!828 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(declare-fun b!188301 () Bool)

(assert (=> b!188301 (= e!123918 (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4783 lt!93182)) key!828))))

(declare-fun b!188302 () Bool)

(assert (=> b!188302 (= e!123921 e!123922)))

(declare-fun res!89012 () Bool)

(assert (=> b!188302 (=> (not res!89012) (not e!123922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188302 (= res!89012 (validMask!0 (mask!9003 thiss!1248)))))

(declare-fun lt!93185 () Unit!5676)

(assert (=> b!188302 (= lt!93185 e!123924)))

(declare-fun c!33842 () Bool)

(declare-datatypes ((tuple2!3488 0))(
  ( (tuple2!3489 (_1!1755 (_ BitVec 64)) (_2!1755 V!5507)) )
))
(declare-datatypes ((List!2389 0))(
  ( (Nil!2386) (Cons!2385 (h!3022 tuple2!3488) (t!7285 List!2389)) )
))
(declare-datatypes ((ListLongMap!2405 0))(
  ( (ListLongMap!2406 (toList!1218 List!2389)) )
))
(declare-fun contains!1322 (ListLongMap!2405 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!866 (array!8011 array!8013 (_ BitVec 32) (_ BitVec 32) V!5507 V!5507 (_ BitVec 32) Int) ListLongMap!2405)

(assert (=> b!188302 (= c!33842 (contains!1322 (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)) key!828))))

(declare-fun b!188303 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8011 (_ BitVec 32)) Bool)

(assert (=> b!188303 (= e!123922 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5799 thiss!1248) (mask!9003 thiss!1248))))))

(declare-fun b!188304 () Bool)

(declare-fun e!123923 () Bool)

(assert (=> b!188304 (= e!123927 (and e!123923 mapRes!7576))))

(declare-fun condMapEmpty!7576 () Bool)

(declare-fun mapDefault!7576 () ValueCell!1854)

(assert (=> b!188304 (= condMapEmpty!7576 (= (arr!3780 (_values!3823 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1854)) mapDefault!7576)))))

(declare-fun b!188305 () Bool)

(assert (=> b!188305 (= e!123923 tp_is_empty!4395)))

(assert (= (and start!19136 res!89015) b!188294))

(assert (= (and b!188294 res!89013) b!188300))

(assert (= (and b!188300 res!89016) b!188302))

(assert (= (and b!188302 c!33842) b!188299))

(assert (= (and b!188302 (not c!33842)) b!188295))

(assert (= (and b!188299 res!89017) b!188301))

(assert (= (and b!188302 res!89012) b!188298))

(assert (= (and b!188298 res!89014) b!188303))

(assert (= (and b!188304 condMapEmpty!7576) mapIsEmpty!7576))

(assert (= (and b!188304 (not condMapEmpty!7576)) mapNonEmpty!7576))

(assert (= (and mapNonEmpty!7576 ((_ is ValueCellFull!1854) mapValue!7576)) b!188297))

(assert (= (and b!188304 ((_ is ValueCellFull!1854) mapDefault!7576)) b!188305))

(assert (= b!188296 b!188304))

(assert (= start!19136 b!188296))

(declare-fun m!214987 () Bool)

(assert (=> b!188296 m!214987))

(declare-fun m!214989 () Bool)

(assert (=> b!188296 m!214989))

(declare-fun m!214991 () Bool)

(assert (=> b!188303 m!214991))

(declare-fun m!214993 () Bool)

(assert (=> b!188299 m!214993))

(declare-fun m!214995 () Bool)

(assert (=> b!188299 m!214995))

(declare-fun m!214997 () Bool)

(assert (=> b!188295 m!214997))

(declare-fun m!214999 () Bool)

(assert (=> b!188301 m!214999))

(declare-fun m!215001 () Bool)

(assert (=> mapNonEmpty!7576 m!215001))

(declare-fun m!215003 () Bool)

(assert (=> b!188302 m!215003))

(declare-fun m!215005 () Bool)

(assert (=> b!188302 m!215005))

(assert (=> b!188302 m!215005))

(declare-fun m!215007 () Bool)

(assert (=> b!188302 m!215007))

(declare-fun m!215009 () Bool)

(assert (=> start!19136 m!215009))

(declare-fun m!215011 () Bool)

(assert (=> b!188300 m!215011))

(check-sat (not b!188295) (not b_next!4623) (not b!188303) (not b!188302) (not b!188299) (not start!19136) (not b!188300) tp_is_empty!4395 (not mapNonEmpty!7576) (not b!188296) b_and!11253)
(check-sat b_and!11253 (not b_next!4623))
(get-model)

(declare-fun b!188350 () Bool)

(declare-fun e!123964 () Bool)

(declare-fun call!18976 () Bool)

(assert (=> b!188350 (= e!123964 call!18976)))

(declare-fun b!188351 () Bool)

(declare-fun e!123965 () Bool)

(assert (=> b!188351 (= e!123965 call!18976)))

(declare-fun bm!18973 () Bool)

(assert (=> bm!18973 (= call!18976 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(declare-fun b!188352 () Bool)

(assert (=> b!188352 (= e!123964 e!123965)))

(declare-fun lt!93205 () (_ BitVec 64))

(assert (=> b!188352 (= lt!93205 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93204 () Unit!5676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8011 (_ BitVec 64) (_ BitVec 32)) Unit!5676)

(assert (=> b!188352 (= lt!93204 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5799 thiss!1248) lt!93205 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!188352 (arrayContainsKey!0 (_keys!5799 thiss!1248) lt!93205 #b00000000000000000000000000000000)))

(declare-fun lt!93206 () Unit!5676)

(assert (=> b!188352 (= lt!93206 lt!93204)))

(declare-fun res!89040 () Bool)

(assert (=> b!188352 (= res!89040 (= (seekEntryOrOpen!0 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000) (_keys!5799 thiss!1248) (mask!9003 thiss!1248)) (Found!653 #b00000000000000000000000000000000)))))

(assert (=> b!188352 (=> (not res!89040) (not e!123965))))

(declare-fun d!55611 () Bool)

(declare-fun res!89041 () Bool)

(declare-fun e!123966 () Bool)

(assert (=> d!55611 (=> res!89041 e!123966)))

(assert (=> d!55611 (= res!89041 (bvsge #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))))))

(assert (=> d!55611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)) e!123966)))

(declare-fun b!188353 () Bool)

(assert (=> b!188353 (= e!123966 e!123964)))

(declare-fun c!33848 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188353 (= c!33848 (validKeyInArray!0 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55611 (not res!89041)) b!188353))

(assert (= (and b!188353 c!33848) b!188352))

(assert (= (and b!188353 (not c!33848)) b!188350))

(assert (= (and b!188352 res!89040) b!188351))

(assert (= (or b!188351 b!188350) bm!18973))

(declare-fun m!215039 () Bool)

(assert (=> bm!18973 m!215039))

(declare-fun m!215041 () Bool)

(assert (=> b!188352 m!215041))

(declare-fun m!215043 () Bool)

(assert (=> b!188352 m!215043))

(declare-fun m!215045 () Bool)

(assert (=> b!188352 m!215045))

(assert (=> b!188352 m!215041))

(declare-fun m!215047 () Bool)

(assert (=> b!188352 m!215047))

(assert (=> b!188353 m!215041))

(assert (=> b!188353 m!215041))

(declare-fun m!215049 () Bool)

(assert (=> b!188353 m!215049))

(assert (=> b!188303 d!55611))

(declare-fun d!55613 () Bool)

(declare-fun e!123969 () Bool)

(assert (=> d!55613 e!123969))

(declare-fun res!89047 () Bool)

(assert (=> d!55613 (=> (not res!89047) (not e!123969))))

(declare-fun lt!93212 () SeekEntryResult!653)

(assert (=> d!55613 (= res!89047 ((_ is Found!653) lt!93212))))

(assert (=> d!55613 (= lt!93212 (seekEntryOrOpen!0 key!828 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(declare-fun lt!93211 () Unit!5676)

(declare-fun choose!1006 (array!8011 array!8013 (_ BitVec 32) (_ BitVec 32) V!5507 V!5507 (_ BitVec 64) Int) Unit!5676)

(assert (=> d!55613 (= lt!93211 (choose!1006 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) key!828 (defaultEntry!3840 thiss!1248)))))

(assert (=> d!55613 (validMask!0 (mask!9003 thiss!1248))))

(assert (=> d!55613 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!155 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) key!828 (defaultEntry!3840 thiss!1248)) lt!93211)))

(declare-fun b!188358 () Bool)

(declare-fun res!89046 () Bool)

(assert (=> b!188358 (=> (not res!89046) (not e!123969))))

(assert (=> b!188358 (= res!89046 (inRange!0 (index!4783 lt!93212) (mask!9003 thiss!1248)))))

(declare-fun b!188359 () Bool)

(assert (=> b!188359 (= e!123969 (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4783 lt!93212)) key!828))))

(assert (=> b!188359 (and (bvsge (index!4783 lt!93212) #b00000000000000000000000000000000) (bvslt (index!4783 lt!93212) (size!4099 (_keys!5799 thiss!1248))))))

(assert (= (and d!55613 res!89047) b!188358))

(assert (= (and b!188358 res!89046) b!188359))

(assert (=> d!55613 m!215011))

(declare-fun m!215051 () Bool)

(assert (=> d!55613 m!215051))

(assert (=> d!55613 m!215003))

(declare-fun m!215053 () Bool)

(assert (=> b!188358 m!215053))

(declare-fun m!215055 () Bool)

(assert (=> b!188359 m!215055))

(assert (=> b!188299 d!55613))

(declare-fun d!55615 () Bool)

(assert (=> d!55615 (= (inRange!0 (index!4783 lt!93182) (mask!9003 thiss!1248)) (and (bvsge (index!4783 lt!93182) #b00000000000000000000000000000000) (bvslt (index!4783 lt!93182) (bvadd (mask!9003 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188299 d!55615))

(declare-fun d!55617 () Bool)

(assert (=> d!55617 (= (validMask!0 (mask!9003 thiss!1248)) (and (or (= (mask!9003 thiss!1248) #b00000000000000000000000000000111) (= (mask!9003 thiss!1248) #b00000000000000000000000000001111) (= (mask!9003 thiss!1248) #b00000000000000000000000000011111) (= (mask!9003 thiss!1248) #b00000000000000000000000000111111) (= (mask!9003 thiss!1248) #b00000000000000000000000001111111) (= (mask!9003 thiss!1248) #b00000000000000000000000011111111) (= (mask!9003 thiss!1248) #b00000000000000000000000111111111) (= (mask!9003 thiss!1248) #b00000000000000000000001111111111) (= (mask!9003 thiss!1248) #b00000000000000000000011111111111) (= (mask!9003 thiss!1248) #b00000000000000000000111111111111) (= (mask!9003 thiss!1248) #b00000000000000000001111111111111) (= (mask!9003 thiss!1248) #b00000000000000000011111111111111) (= (mask!9003 thiss!1248) #b00000000000000000111111111111111) (= (mask!9003 thiss!1248) #b00000000000000001111111111111111) (= (mask!9003 thiss!1248) #b00000000000000011111111111111111) (= (mask!9003 thiss!1248) #b00000000000000111111111111111111) (= (mask!9003 thiss!1248) #b00000000000001111111111111111111) (= (mask!9003 thiss!1248) #b00000000000011111111111111111111) (= (mask!9003 thiss!1248) #b00000000000111111111111111111111) (= (mask!9003 thiss!1248) #b00000000001111111111111111111111) (= (mask!9003 thiss!1248) #b00000000011111111111111111111111) (= (mask!9003 thiss!1248) #b00000000111111111111111111111111) (= (mask!9003 thiss!1248) #b00000001111111111111111111111111) (= (mask!9003 thiss!1248) #b00000011111111111111111111111111) (= (mask!9003 thiss!1248) #b00000111111111111111111111111111) (= (mask!9003 thiss!1248) #b00001111111111111111111111111111) (= (mask!9003 thiss!1248) #b00011111111111111111111111111111) (= (mask!9003 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9003 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188302 d!55617))

(declare-fun d!55619 () Bool)

(declare-fun e!123974 () Bool)

(assert (=> d!55619 e!123974))

(declare-fun res!89050 () Bool)

(assert (=> d!55619 (=> res!89050 e!123974)))

(declare-fun lt!93221 () Bool)

(assert (=> d!55619 (= res!89050 (not lt!93221))))

(declare-fun lt!93223 () Bool)

(assert (=> d!55619 (= lt!93221 lt!93223)))

(declare-fun lt!93222 () Unit!5676)

(declare-fun e!123975 () Unit!5676)

(assert (=> d!55619 (= lt!93222 e!123975)))

(declare-fun c!33851 () Bool)

(assert (=> d!55619 (= c!33851 lt!93223)))

(declare-fun containsKey!234 (List!2389 (_ BitVec 64)) Bool)

(assert (=> d!55619 (= lt!93223 (containsKey!234 (toList!1218 (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248))) key!828))))

(assert (=> d!55619 (= (contains!1322 (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)) key!828) lt!93221)))

(declare-fun b!188366 () Bool)

(declare-fun lt!93224 () Unit!5676)

(assert (=> b!188366 (= e!123975 lt!93224)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!182 (List!2389 (_ BitVec 64)) Unit!5676)

(assert (=> b!188366 (= lt!93224 (lemmaContainsKeyImpliesGetValueByKeyDefined!182 (toList!1218 (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248))) key!828))))

(declare-datatypes ((Option!236 0))(
  ( (Some!235 (v!4161 V!5507)) (None!234) )
))
(declare-fun isDefined!183 (Option!236) Bool)

(declare-fun getValueByKey!230 (List!2389 (_ BitVec 64)) Option!236)

(assert (=> b!188366 (isDefined!183 (getValueByKey!230 (toList!1218 (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248))) key!828))))

(declare-fun b!188367 () Bool)

(declare-fun Unit!5682 () Unit!5676)

(assert (=> b!188367 (= e!123975 Unit!5682)))

(declare-fun b!188368 () Bool)

(assert (=> b!188368 (= e!123974 (isDefined!183 (getValueByKey!230 (toList!1218 (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248))) key!828)))))

(assert (= (and d!55619 c!33851) b!188366))

(assert (= (and d!55619 (not c!33851)) b!188367))

(assert (= (and d!55619 (not res!89050)) b!188368))

(declare-fun m!215057 () Bool)

(assert (=> d!55619 m!215057))

(declare-fun m!215059 () Bool)

(assert (=> b!188366 m!215059))

(declare-fun m!215061 () Bool)

(assert (=> b!188366 m!215061))

(assert (=> b!188366 m!215061))

(declare-fun m!215063 () Bool)

(assert (=> b!188366 m!215063))

(assert (=> b!188368 m!215061))

(assert (=> b!188368 m!215061))

(assert (=> b!188368 m!215063))

(assert (=> b!188302 d!55619))

(declare-fun b!188411 () Bool)

(declare-fun c!33864 () Bool)

(assert (=> b!188411 (= c!33864 (and (not (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124011 () ListLongMap!2405)

(declare-fun e!124014 () ListLongMap!2405)

(assert (=> b!188411 (= e!124011 e!124014)))

(declare-fun b!188412 () Bool)

(declare-fun res!89069 () Bool)

(declare-fun e!124013 () Bool)

(assert (=> b!188412 (=> (not res!89069) (not e!124013))))

(declare-fun e!124007 () Bool)

(assert (=> b!188412 (= res!89069 e!124007)))

(declare-fun c!33866 () Bool)

(assert (=> b!188412 (= c!33866 (not (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18988 () Bool)

(declare-fun call!18992 () ListLongMap!2405)

(declare-fun call!18994 () ListLongMap!2405)

(assert (=> bm!18988 (= call!18992 call!18994)))

(declare-fun b!188413 () Bool)

(declare-fun e!124006 () Bool)

(declare-fun e!124008 () Bool)

(assert (=> b!188413 (= e!124006 e!124008)))

(declare-fun res!89070 () Bool)

(declare-fun call!18991 () Bool)

(assert (=> b!188413 (= res!89070 call!18991)))

(assert (=> b!188413 (=> (not res!89070) (not e!124008))))

(declare-fun b!188414 () Bool)

(declare-fun e!124002 () ListLongMap!2405)

(declare-fun call!18993 () ListLongMap!2405)

(declare-fun +!293 (ListLongMap!2405 tuple2!3488) ListLongMap!2405)

(assert (=> b!188414 (= e!124002 (+!293 call!18993 (tuple2!3489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3681 thiss!1248))))))

(declare-fun b!188415 () Bool)

(declare-fun e!124005 () Unit!5676)

(declare-fun Unit!5683 () Unit!5676)

(assert (=> b!188415 (= e!124005 Unit!5683)))

(declare-fun b!188416 () Bool)

(declare-fun call!18997 () ListLongMap!2405)

(assert (=> b!188416 (= e!124014 call!18997)))

(declare-fun bm!18989 () Bool)

(declare-fun call!18995 () ListLongMap!2405)

(assert (=> bm!18989 (= call!18995 call!18993)))

(declare-fun b!188418 () Bool)

(declare-fun e!124004 () Bool)

(assert (=> b!188418 (= e!124004 (validKeyInArray!0 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188419 () Bool)

(assert (=> b!188419 (= e!124006 (not call!18991))))

(declare-fun bm!18990 () Bool)

(declare-fun call!18996 () Bool)

(declare-fun lt!93281 () ListLongMap!2405)

(assert (=> bm!18990 (= call!18996 (contains!1322 lt!93281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188420 () Bool)

(declare-fun e!124009 () Bool)

(declare-fun e!124003 () Bool)

(assert (=> b!188420 (= e!124009 e!124003)))

(declare-fun res!89076 () Bool)

(assert (=> b!188420 (=> (not res!89076) (not e!124003))))

(assert (=> b!188420 (= res!89076 (contains!1322 lt!93281 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))))))

(declare-fun b!188421 () Bool)

(declare-fun apply!173 (ListLongMap!2405 (_ BitVec 64)) V!5507)

(declare-fun get!2178 (ValueCell!1854 V!5507) V!5507)

(declare-fun dynLambda!516 (Int (_ BitVec 64)) V!5507)

(assert (=> b!188421 (= e!124003 (= (apply!173 lt!93281 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000)) (get!2178 (select (arr!3780 (_values!3823 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3840 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4100 (_values!3823 thiss!1248))))))

(assert (=> b!188421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))))))

(declare-fun b!188422 () Bool)

(assert (=> b!188422 (= e!124008 (= (apply!173 lt!93281 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3681 thiss!1248)))))

(declare-fun b!188423 () Bool)

(assert (=> b!188423 (= e!124013 e!124006)))

(declare-fun c!33867 () Bool)

(assert (=> b!188423 (= c!33867 (not (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18991 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!206 (array!8011 array!8013 (_ BitVec 32) (_ BitVec 32) V!5507 V!5507 (_ BitVec 32) Int) ListLongMap!2405)

(assert (=> bm!18991 (= call!18994 (getCurrentListMapNoExtraKeys!206 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)))))

(declare-fun b!188424 () Bool)

(assert (=> b!188424 (= e!124014 call!18995)))

(declare-fun c!33865 () Bool)

(declare-fun bm!18992 () Bool)

(declare-fun c!33868 () Bool)

(assert (=> bm!18992 (= call!18993 (+!293 (ite c!33865 call!18994 (ite c!33868 call!18992 call!18997)) (ite (or c!33865 c!33868) (tuple2!3489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3681 thiss!1248)) (tuple2!3489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3681 thiss!1248)))))))

(declare-fun b!188425 () Bool)

(assert (=> b!188425 (= e!124007 (not call!18996))))

(declare-fun b!188426 () Bool)

(assert (=> b!188426 (= e!124011 call!18995)))

(declare-fun d!55621 () Bool)

(assert (=> d!55621 e!124013))

(declare-fun res!89071 () Bool)

(assert (=> d!55621 (=> (not res!89071) (not e!124013))))

(assert (=> d!55621 (= res!89071 (or (bvsge #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))))))))

(declare-fun lt!93288 () ListLongMap!2405)

(assert (=> d!55621 (= lt!93281 lt!93288)))

(declare-fun lt!93280 () Unit!5676)

(assert (=> d!55621 (= lt!93280 e!124005)))

(declare-fun c!33869 () Bool)

(assert (=> d!55621 (= c!33869 e!124004)))

(declare-fun res!89075 () Bool)

(assert (=> d!55621 (=> (not res!89075) (not e!124004))))

(assert (=> d!55621 (= res!89075 (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))))))

(assert (=> d!55621 (= lt!93288 e!124002)))

(assert (=> d!55621 (= c!33865 (and (not (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55621 (validMask!0 (mask!9003 thiss!1248))))

(assert (=> d!55621 (= (getCurrentListMap!866 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)) lt!93281)))

(declare-fun b!188417 () Bool)

(declare-fun lt!93272 () Unit!5676)

(assert (=> b!188417 (= e!124005 lt!93272)))

(declare-fun lt!93275 () ListLongMap!2405)

(assert (=> b!188417 (= lt!93275 (getCurrentListMapNoExtraKeys!206 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)))))

(declare-fun lt!93283 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93283 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93276 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93276 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93284 () Unit!5676)

(declare-fun addStillContains!149 (ListLongMap!2405 (_ BitVec 64) V!5507 (_ BitVec 64)) Unit!5676)

(assert (=> b!188417 (= lt!93284 (addStillContains!149 lt!93275 lt!93283 (zeroValue!3681 thiss!1248) lt!93276))))

(assert (=> b!188417 (contains!1322 (+!293 lt!93275 (tuple2!3489 lt!93283 (zeroValue!3681 thiss!1248))) lt!93276)))

(declare-fun lt!93277 () Unit!5676)

(assert (=> b!188417 (= lt!93277 lt!93284)))

(declare-fun lt!93290 () ListLongMap!2405)

(assert (=> b!188417 (= lt!93290 (getCurrentListMapNoExtraKeys!206 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)))))

(declare-fun lt!93287 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93270 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93270 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93286 () Unit!5676)

(declare-fun addApplyDifferent!149 (ListLongMap!2405 (_ BitVec 64) V!5507 (_ BitVec 64)) Unit!5676)

(assert (=> b!188417 (= lt!93286 (addApplyDifferent!149 lt!93290 lt!93287 (minValue!3681 thiss!1248) lt!93270))))

(assert (=> b!188417 (= (apply!173 (+!293 lt!93290 (tuple2!3489 lt!93287 (minValue!3681 thiss!1248))) lt!93270) (apply!173 lt!93290 lt!93270))))

(declare-fun lt!93285 () Unit!5676)

(assert (=> b!188417 (= lt!93285 lt!93286)))

(declare-fun lt!93282 () ListLongMap!2405)

(assert (=> b!188417 (= lt!93282 (getCurrentListMapNoExtraKeys!206 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)))))

(declare-fun lt!93278 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93278 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93273 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93273 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93274 () Unit!5676)

(assert (=> b!188417 (= lt!93274 (addApplyDifferent!149 lt!93282 lt!93278 (zeroValue!3681 thiss!1248) lt!93273))))

(assert (=> b!188417 (= (apply!173 (+!293 lt!93282 (tuple2!3489 lt!93278 (zeroValue!3681 thiss!1248))) lt!93273) (apply!173 lt!93282 lt!93273))))

(declare-fun lt!93271 () Unit!5676)

(assert (=> b!188417 (= lt!93271 lt!93274)))

(declare-fun lt!93269 () ListLongMap!2405)

(assert (=> b!188417 (= lt!93269 (getCurrentListMapNoExtraKeys!206 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3840 thiss!1248)))))

(declare-fun lt!93289 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93289 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93279 () (_ BitVec 64))

(assert (=> b!188417 (= lt!93279 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188417 (= lt!93272 (addApplyDifferent!149 lt!93269 lt!93289 (minValue!3681 thiss!1248) lt!93279))))

(assert (=> b!188417 (= (apply!173 (+!293 lt!93269 (tuple2!3489 lt!93289 (minValue!3681 thiss!1248))) lt!93279) (apply!173 lt!93269 lt!93279))))

(declare-fun b!188427 () Bool)

(declare-fun res!89072 () Bool)

(assert (=> b!188427 (=> (not res!89072) (not e!124013))))

(assert (=> b!188427 (= res!89072 e!124009)))

(declare-fun res!89077 () Bool)

(assert (=> b!188427 (=> res!89077 e!124009)))

(declare-fun e!124010 () Bool)

(assert (=> b!188427 (= res!89077 (not e!124010))))

(declare-fun res!89073 () Bool)

(assert (=> b!188427 (=> (not res!89073) (not e!124010))))

(assert (=> b!188427 (= res!89073 (bvslt #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))))))

(declare-fun bm!18993 () Bool)

(assert (=> bm!18993 (= call!18997 call!18992)))

(declare-fun b!188428 () Bool)

(declare-fun e!124012 () Bool)

(assert (=> b!188428 (= e!124012 (= (apply!173 lt!93281 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3681 thiss!1248)))))

(declare-fun b!188429 () Bool)

(assert (=> b!188429 (= e!124002 e!124011)))

(assert (=> b!188429 (= c!33868 (and (not (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3577 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188430 () Bool)

(assert (=> b!188430 (= e!124010 (validKeyInArray!0 (select (arr!3779 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188431 () Bool)

(assert (=> b!188431 (= e!124007 e!124012)))

(declare-fun res!89074 () Bool)

(assert (=> b!188431 (= res!89074 call!18996)))

(assert (=> b!188431 (=> (not res!89074) (not e!124012))))

(declare-fun bm!18994 () Bool)

(assert (=> bm!18994 (= call!18991 (contains!1322 lt!93281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55621 c!33865) b!188414))

(assert (= (and d!55621 (not c!33865)) b!188429))

(assert (= (and b!188429 c!33868) b!188426))

(assert (= (and b!188429 (not c!33868)) b!188411))

(assert (= (and b!188411 c!33864) b!188424))

(assert (= (and b!188411 (not c!33864)) b!188416))

(assert (= (or b!188424 b!188416) bm!18993))

(assert (= (or b!188426 bm!18993) bm!18988))

(assert (= (or b!188426 b!188424) bm!18989))

(assert (= (or b!188414 bm!18988) bm!18991))

(assert (= (or b!188414 bm!18989) bm!18992))

(assert (= (and d!55621 res!89075) b!188418))

(assert (= (and d!55621 c!33869) b!188417))

(assert (= (and d!55621 (not c!33869)) b!188415))

(assert (= (and d!55621 res!89071) b!188427))

(assert (= (and b!188427 res!89073) b!188430))

(assert (= (and b!188427 (not res!89077)) b!188420))

(assert (= (and b!188420 res!89076) b!188421))

(assert (= (and b!188427 res!89072) b!188412))

(assert (= (and b!188412 c!33866) b!188431))

(assert (= (and b!188412 (not c!33866)) b!188425))

(assert (= (and b!188431 res!89074) b!188428))

(assert (= (or b!188431 b!188425) bm!18990))

(assert (= (and b!188412 res!89069) b!188423))

(assert (= (and b!188423 c!33867) b!188413))

(assert (= (and b!188423 (not c!33867)) b!188419))

(assert (= (and b!188413 res!89070) b!188422))

(assert (= (or b!188413 b!188419) bm!18994))

(declare-fun b_lambda!7311 () Bool)

(assert (=> (not b_lambda!7311) (not b!188421)))

(declare-fun t!7288 () Bool)

(declare-fun tb!2857 () Bool)

(assert (=> (and b!188296 (= (defaultEntry!3840 thiss!1248) (defaultEntry!3840 thiss!1248)) t!7288) tb!2857))

(declare-fun result!4849 () Bool)

(assert (=> tb!2857 (= result!4849 tp_is_empty!4395)))

(assert (=> b!188421 t!7288))

(declare-fun b_and!11257 () Bool)

(assert (= b_and!11253 (and (=> t!7288 result!4849) b_and!11257)))

(declare-fun m!215065 () Bool)

(assert (=> b!188417 m!215065))

(declare-fun m!215067 () Bool)

(assert (=> b!188417 m!215067))

(declare-fun m!215069 () Bool)

(assert (=> b!188417 m!215069))

(declare-fun m!215071 () Bool)

(assert (=> b!188417 m!215071))

(declare-fun m!215073 () Bool)

(assert (=> b!188417 m!215073))

(declare-fun m!215075 () Bool)

(assert (=> b!188417 m!215075))

(declare-fun m!215077 () Bool)

(assert (=> b!188417 m!215077))

(declare-fun m!215079 () Bool)

(assert (=> b!188417 m!215079))

(declare-fun m!215081 () Bool)

(assert (=> b!188417 m!215081))

(assert (=> b!188417 m!215041))

(declare-fun m!215083 () Bool)

(assert (=> b!188417 m!215083))

(assert (=> b!188417 m!215071))

(declare-fun m!215085 () Bool)

(assert (=> b!188417 m!215085))

(declare-fun m!215087 () Bool)

(assert (=> b!188417 m!215087))

(assert (=> b!188417 m!215077))

(declare-fun m!215089 () Bool)

(assert (=> b!188417 m!215089))

(assert (=> b!188417 m!215079))

(declare-fun m!215091 () Bool)

(assert (=> b!188417 m!215091))

(declare-fun m!215093 () Bool)

(assert (=> b!188417 m!215093))

(assert (=> b!188417 m!215081))

(declare-fun m!215095 () Bool)

(assert (=> b!188417 m!215095))

(assert (=> d!55621 m!215003))

(assert (=> bm!18991 m!215065))

(declare-fun m!215097 () Bool)

(assert (=> bm!18990 m!215097))

(assert (=> b!188418 m!215041))

(assert (=> b!188418 m!215041))

(assert (=> b!188418 m!215049))

(declare-fun m!215099 () Bool)

(assert (=> bm!18994 m!215099))

(declare-fun m!215101 () Bool)

(assert (=> b!188422 m!215101))

(declare-fun m!215103 () Bool)

(assert (=> b!188414 m!215103))

(assert (=> b!188420 m!215041))

(assert (=> b!188420 m!215041))

(declare-fun m!215105 () Bool)

(assert (=> b!188420 m!215105))

(assert (=> b!188421 m!215041))

(declare-fun m!215107 () Bool)

(assert (=> b!188421 m!215107))

(declare-fun m!215109 () Bool)

(assert (=> b!188421 m!215109))

(declare-fun m!215111 () Bool)

(assert (=> b!188421 m!215111))

(assert (=> b!188421 m!215111))

(assert (=> b!188421 m!215109))

(declare-fun m!215113 () Bool)

(assert (=> b!188421 m!215113))

(assert (=> b!188421 m!215041))

(assert (=> b!188430 m!215041))

(assert (=> b!188430 m!215041))

(assert (=> b!188430 m!215049))

(declare-fun m!215115 () Bool)

(assert (=> bm!18992 m!215115))

(declare-fun m!215117 () Bool)

(assert (=> b!188428 m!215117))

(assert (=> b!188302 d!55621))

(declare-fun d!55623 () Bool)

(declare-fun res!89084 () Bool)

(declare-fun e!124017 () Bool)

(assert (=> d!55623 (=> (not res!89084) (not e!124017))))

(declare-fun simpleValid!189 (LongMapFixedSize!2616) Bool)

(assert (=> d!55623 (= res!89084 (simpleValid!189 thiss!1248))))

(assert (=> d!55623 (= (valid!1077 thiss!1248) e!124017)))

(declare-fun b!188440 () Bool)

(declare-fun res!89085 () Bool)

(assert (=> b!188440 (=> (not res!89085) (not e!124017))))

(declare-fun arrayCountValidKeys!0 (array!8011 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188440 (= res!89085 (= (arrayCountValidKeys!0 (_keys!5799 thiss!1248) #b00000000000000000000000000000000 (size!4099 (_keys!5799 thiss!1248))) (_size!1357 thiss!1248)))))

(declare-fun b!188441 () Bool)

(declare-fun res!89086 () Bool)

(assert (=> b!188441 (=> (not res!89086) (not e!124017))))

(assert (=> b!188441 (= res!89086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(declare-fun b!188442 () Bool)

(declare-datatypes ((List!2391 0))(
  ( (Nil!2388) (Cons!2387 (h!3024 (_ BitVec 64)) (t!7289 List!2391)) )
))
(declare-fun arrayNoDuplicates!0 (array!8011 (_ BitVec 32) List!2391) Bool)

(assert (=> b!188442 (= e!124017 (arrayNoDuplicates!0 (_keys!5799 thiss!1248) #b00000000000000000000000000000000 Nil!2388))))

(assert (= (and d!55623 res!89084) b!188440))

(assert (= (and b!188440 res!89085) b!188441))

(assert (= (and b!188441 res!89086) b!188442))

(declare-fun m!215119 () Bool)

(assert (=> d!55623 m!215119))

(declare-fun m!215121 () Bool)

(assert (=> b!188440 m!215121))

(assert (=> b!188441 m!214991))

(declare-fun m!215123 () Bool)

(assert (=> b!188442 m!215123))

(assert (=> start!19136 d!55623))

(declare-fun b!188456 () Bool)

(declare-fun c!33878 () Bool)

(declare-fun lt!93299 () (_ BitVec 64))

(assert (=> b!188456 (= c!33878 (= lt!93299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124026 () SeekEntryResult!653)

(declare-fun e!124024 () SeekEntryResult!653)

(assert (=> b!188456 (= e!124026 e!124024)))

(declare-fun b!188457 () Bool)

(declare-fun lt!93297 () SeekEntryResult!653)

(assert (=> b!188457 (= e!124026 (Found!653 (index!4784 lt!93297)))))

(declare-fun b!188458 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8011 (_ BitVec 32)) SeekEntryResult!653)

(assert (=> b!188458 (= e!124024 (seekKeyOrZeroReturnVacant!0 (x!20339 lt!93297) (index!4784 lt!93297) (index!4784 lt!93297) key!828 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(declare-fun b!188459 () Bool)

(declare-fun e!124025 () SeekEntryResult!653)

(assert (=> b!188459 (= e!124025 e!124026)))

(assert (=> b!188459 (= lt!93299 (select (arr!3779 (_keys!5799 thiss!1248)) (index!4784 lt!93297)))))

(declare-fun c!33876 () Bool)

(assert (=> b!188459 (= c!33876 (= lt!93299 key!828))))

(declare-fun b!188460 () Bool)

(assert (=> b!188460 (= e!124025 Undefined!653)))

(declare-fun d!55625 () Bool)

(declare-fun lt!93298 () SeekEntryResult!653)

(assert (=> d!55625 (and (or ((_ is Undefined!653) lt!93298) (not ((_ is Found!653) lt!93298)) (and (bvsge (index!4783 lt!93298) #b00000000000000000000000000000000) (bvslt (index!4783 lt!93298) (size!4099 (_keys!5799 thiss!1248))))) (or ((_ is Undefined!653) lt!93298) ((_ is Found!653) lt!93298) (not ((_ is MissingZero!653) lt!93298)) (and (bvsge (index!4782 lt!93298) #b00000000000000000000000000000000) (bvslt (index!4782 lt!93298) (size!4099 (_keys!5799 thiss!1248))))) (or ((_ is Undefined!653) lt!93298) ((_ is Found!653) lt!93298) ((_ is MissingZero!653) lt!93298) (not ((_ is MissingVacant!653) lt!93298)) (and (bvsge (index!4785 lt!93298) #b00000000000000000000000000000000) (bvslt (index!4785 lt!93298) (size!4099 (_keys!5799 thiss!1248))))) (or ((_ is Undefined!653) lt!93298) (ite ((_ is Found!653) lt!93298) (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4783 lt!93298)) key!828) (ite ((_ is MissingZero!653) lt!93298) (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4782 lt!93298)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!653) lt!93298) (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4785 lt!93298)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55625 (= lt!93298 e!124025)))

(declare-fun c!33877 () Bool)

(assert (=> d!55625 (= c!33877 (and ((_ is Intermediate!653) lt!93297) (undefined!1465 lt!93297)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8011 (_ BitVec 32)) SeekEntryResult!653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55625 (= lt!93297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9003 thiss!1248)) key!828 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(assert (=> d!55625 (validMask!0 (mask!9003 thiss!1248))))

(assert (=> d!55625 (= (seekEntryOrOpen!0 key!828 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)) lt!93298)))

(declare-fun b!188455 () Bool)

(assert (=> b!188455 (= e!124024 (MissingZero!653 (index!4784 lt!93297)))))

(assert (= (and d!55625 c!33877) b!188460))

(assert (= (and d!55625 (not c!33877)) b!188459))

(assert (= (and b!188459 c!33876) b!188457))

(assert (= (and b!188459 (not c!33876)) b!188456))

(assert (= (and b!188456 c!33878) b!188455))

(assert (= (and b!188456 (not c!33878)) b!188458))

(declare-fun m!215125 () Bool)

(assert (=> b!188458 m!215125))

(declare-fun m!215127 () Bool)

(assert (=> b!188459 m!215127))

(declare-fun m!215129 () Bool)

(assert (=> d!55625 m!215129))

(declare-fun m!215131 () Bool)

(assert (=> d!55625 m!215131))

(declare-fun m!215133 () Bool)

(assert (=> d!55625 m!215133))

(declare-fun m!215135 () Bool)

(assert (=> d!55625 m!215135))

(assert (=> d!55625 m!215129))

(assert (=> d!55625 m!215003))

(declare-fun m!215137 () Bool)

(assert (=> d!55625 m!215137))

(assert (=> b!188300 d!55625))

(declare-fun lt!93304 () SeekEntryResult!653)

(declare-fun call!19003 () Bool)

(declare-fun c!33883 () Bool)

(declare-fun bm!18999 () Bool)

(assert (=> bm!18999 (= call!19003 (inRange!0 (ite c!33883 (index!4782 lt!93304) (index!4785 lt!93304)) (mask!9003 thiss!1248)))))

(declare-fun b!188478 () Bool)

(declare-fun e!124038 () Bool)

(declare-fun call!19002 () Bool)

(assert (=> b!188478 (= e!124038 (not call!19002))))

(declare-fun b!188479 () Bool)

(declare-fun e!124037 () Bool)

(assert (=> b!188479 (= e!124037 (not call!19002))))

(declare-fun bm!19000 () Bool)

(assert (=> bm!19000 (= call!19002 (arrayContainsKey!0 (_keys!5799 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188480 () Bool)

(declare-fun e!124036 () Bool)

(assert (=> b!188480 (= e!124036 ((_ is Undefined!653) lt!93304))))

(declare-fun b!188477 () Bool)

(assert (=> b!188477 (and (bvsge (index!4782 lt!93304) #b00000000000000000000000000000000) (bvslt (index!4782 lt!93304) (size!4099 (_keys!5799 thiss!1248))))))

(declare-fun res!89097 () Bool)

(assert (=> b!188477 (= res!89097 (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4782 lt!93304)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188477 (=> (not res!89097) (not e!124037))))

(declare-fun d!55627 () Bool)

(declare-fun e!124035 () Bool)

(assert (=> d!55627 e!124035))

(assert (=> d!55627 (= c!33883 ((_ is MissingZero!653) lt!93304))))

(assert (=> d!55627 (= lt!93304 (seekEntryOrOpen!0 key!828 (_keys!5799 thiss!1248) (mask!9003 thiss!1248)))))

(declare-fun lt!93305 () Unit!5676)

(declare-fun choose!1007 (array!8011 array!8013 (_ BitVec 32) (_ BitVec 32) V!5507 V!5507 (_ BitVec 64) Int) Unit!5676)

(assert (=> d!55627 (= lt!93305 (choose!1007 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) key!828 (defaultEntry!3840 thiss!1248)))))

(assert (=> d!55627 (validMask!0 (mask!9003 thiss!1248))))

(assert (=> d!55627 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!159 (_keys!5799 thiss!1248) (_values!3823 thiss!1248) (mask!9003 thiss!1248) (extraKeys!3577 thiss!1248) (zeroValue!3681 thiss!1248) (minValue!3681 thiss!1248) key!828 (defaultEntry!3840 thiss!1248)) lt!93305)))

(declare-fun b!188481 () Bool)

(declare-fun res!89096 () Bool)

(assert (=> b!188481 (=> (not res!89096) (not e!124038))))

(assert (=> b!188481 (= res!89096 (= (select (arr!3779 (_keys!5799 thiss!1248)) (index!4785 lt!93304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188481 (and (bvsge (index!4785 lt!93304) #b00000000000000000000000000000000) (bvslt (index!4785 lt!93304) (size!4099 (_keys!5799 thiss!1248))))))

(declare-fun b!188482 () Bool)

(declare-fun res!89098 () Bool)

(assert (=> b!188482 (=> (not res!89098) (not e!124038))))

(assert (=> b!188482 (= res!89098 call!19003)))

(assert (=> b!188482 (= e!124036 e!124038)))

(declare-fun b!188483 () Bool)

(assert (=> b!188483 (= e!124035 e!124036)))

(declare-fun c!33884 () Bool)

(assert (=> b!188483 (= c!33884 ((_ is MissingVacant!653) lt!93304))))

(declare-fun b!188484 () Bool)

(assert (=> b!188484 (= e!124035 e!124037)))

(declare-fun res!89095 () Bool)

(assert (=> b!188484 (= res!89095 call!19003)))

(assert (=> b!188484 (=> (not res!89095) (not e!124037))))

(assert (= (and d!55627 c!33883) b!188484))

(assert (= (and d!55627 (not c!33883)) b!188483))

(assert (= (and b!188484 res!89095) b!188477))

(assert (= (and b!188477 res!89097) b!188479))

(assert (= (and b!188483 c!33884) b!188482))

(assert (= (and b!188483 (not c!33884)) b!188480))

(assert (= (and b!188482 res!89098) b!188481))

(assert (= (and b!188481 res!89096) b!188478))

(assert (= (or b!188484 b!188482) bm!18999))

(assert (= (or b!188479 b!188478) bm!19000))

(declare-fun m!215139 () Bool)

(assert (=> b!188481 m!215139))

(assert (=> d!55627 m!215011))

(declare-fun m!215141 () Bool)

(assert (=> d!55627 m!215141))

(assert (=> d!55627 m!215003))

(declare-fun m!215143 () Bool)

(assert (=> bm!19000 m!215143))

(declare-fun m!215145 () Bool)

(assert (=> b!188477 m!215145))

(declare-fun m!215147 () Bool)

(assert (=> bm!18999 m!215147))

(assert (=> b!188295 d!55627))

(declare-fun d!55629 () Bool)

(assert (=> d!55629 (= (array_inv!2447 (_keys!5799 thiss!1248)) (bvsge (size!4099 (_keys!5799 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188296 d!55629))

(declare-fun d!55631 () Bool)

(assert (=> d!55631 (= (array_inv!2448 (_values!3823 thiss!1248)) (bvsge (size!4100 (_values!3823 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188296 d!55631))

(declare-fun b!188491 () Bool)

(declare-fun e!124043 () Bool)

(assert (=> b!188491 (= e!124043 tp_is_empty!4395)))

(declare-fun mapIsEmpty!7582 () Bool)

(declare-fun mapRes!7582 () Bool)

(assert (=> mapIsEmpty!7582 mapRes!7582))

(declare-fun condMapEmpty!7582 () Bool)

(declare-fun mapDefault!7582 () ValueCell!1854)

(assert (=> mapNonEmpty!7576 (= condMapEmpty!7582 (= mapRest!7576 ((as const (Array (_ BitVec 32) ValueCell!1854)) mapDefault!7582)))))

(declare-fun e!124044 () Bool)

(assert (=> mapNonEmpty!7576 (= tp!16690 (and e!124044 mapRes!7582))))

(declare-fun b!188492 () Bool)

(assert (=> b!188492 (= e!124044 tp_is_empty!4395)))

(declare-fun mapNonEmpty!7582 () Bool)

(declare-fun tp!16699 () Bool)

(assert (=> mapNonEmpty!7582 (= mapRes!7582 (and tp!16699 e!124043))))

(declare-fun mapValue!7582 () ValueCell!1854)

(declare-fun mapKey!7582 () (_ BitVec 32))

(declare-fun mapRest!7582 () (Array (_ BitVec 32) ValueCell!1854))

(assert (=> mapNonEmpty!7582 (= mapRest!7576 (store mapRest!7582 mapKey!7582 mapValue!7582))))

(assert (= (and mapNonEmpty!7576 condMapEmpty!7582) mapIsEmpty!7582))

(assert (= (and mapNonEmpty!7576 (not condMapEmpty!7582)) mapNonEmpty!7582))

(assert (= (and mapNonEmpty!7582 ((_ is ValueCellFull!1854) mapValue!7582)) b!188491))

(assert (= (and mapNonEmpty!7576 ((_ is ValueCellFull!1854) mapDefault!7582)) b!188492))

(declare-fun m!215149 () Bool)

(assert (=> mapNonEmpty!7582 m!215149))

(declare-fun b_lambda!7313 () Bool)

(assert (= b_lambda!7311 (or (and b!188296 b_free!4623) b_lambda!7313)))

(check-sat (not b!188352) (not b!188442) (not d!55621) (not d!55619) (not b!188417) (not d!55623) (not bm!18994) (not b!188366) (not d!55613) (not d!55625) (not b_lambda!7313) (not d!55627) (not bm!18973) (not b!188441) (not b!188418) (not bm!18991) (not b!188353) (not b_next!4623) (not b!188420) (not b!188430) (not b!188414) (not b!188458) (not b!188358) (not b!188368) (not bm!18990) (not b!188440) (not bm!18992) (not b!188428) (not bm!19000) tp_is_empty!4395 (not mapNonEmpty!7582) (not bm!18999) (not b!188421) (not b!188422) b_and!11257)
(check-sat b_and!11257 (not b_next!4623))
