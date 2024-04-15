; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18486 () Bool)

(assert start!18486)

(declare-fun b!183169 () Bool)

(declare-fun b_free!4525 () Bool)

(declare-fun b_next!4525 () Bool)

(assert (=> b!183169 (= b_free!4525 (not b_next!4525))))

(declare-fun tp!16346 () Bool)

(declare-fun b_and!11069 () Bool)

(assert (=> b!183169 (= tp!16346 b_and!11069)))

(declare-fun mapIsEmpty!7379 () Bool)

(declare-fun mapRes!7379 () Bool)

(assert (=> mapIsEmpty!7379 mapRes!7379))

(declare-fun b!183163 () Bool)

(declare-fun e!120588 () Bool)

(declare-fun e!120590 () Bool)

(assert (=> b!183163 (= e!120588 (and e!120590 mapRes!7379))))

(declare-fun condMapEmpty!7379 () Bool)

(declare-datatypes ((V!5377 0))(
  ( (V!5378 (val!2193 Int)) )
))
(declare-datatypes ((ValueCell!1805 0))(
  ( (ValueCellFull!1805 (v!4090 V!5377)) (EmptyCell!1805) )
))
(declare-datatypes ((array!7767 0))(
  ( (array!7768 (arr!3670 (Array (_ BitVec 32) (_ BitVec 64))) (size!3983 (_ BitVec 32))) )
))
(declare-datatypes ((array!7769 0))(
  ( (array!7770 (arr!3671 (Array (_ BitVec 32) ValueCell!1805)) (size!3984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2518 0))(
  ( (LongMapFixedSize!2519 (defaultEntry!3749 Int) (mask!8810 (_ BitVec 32)) (extraKeys!3486 (_ BitVec 32)) (zeroValue!3590 V!5377) (minValue!3590 V!5377) (_size!1308 (_ BitVec 32)) (_keys!5666 array!7767) (_values!3732 array!7769) (_vacant!1308 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2518)

(declare-fun mapDefault!7379 () ValueCell!1805)

(assert (=> b!183163 (= condMapEmpty!7379 (= (arr!3671 (_values!3732 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1805)) mapDefault!7379)))))

(declare-fun mapNonEmpty!7379 () Bool)

(declare-fun tp!16345 () Bool)

(declare-fun e!120585 () Bool)

(assert (=> mapNonEmpty!7379 (= mapRes!7379 (and tp!16345 e!120585))))

(declare-fun mapValue!7379 () ValueCell!1805)

(declare-fun mapKey!7379 () (_ BitVec 32))

(declare-fun mapRest!7379 () (Array (_ BitVec 32) ValueCell!1805))

(assert (=> mapNonEmpty!7379 (= (arr!3671 (_values!3732 thiss!1248)) (store mapRest!7379 mapKey!7379 mapValue!7379))))

(declare-fun b!183164 () Bool)

(declare-fun e!120587 () Bool)

(declare-fun e!120589 () Bool)

(assert (=> b!183164 (= e!120587 e!120589)))

(declare-fun res!86674 () Bool)

(assert (=> b!183164 (=> (not res!86674) (not e!120589))))

(declare-datatypes ((SeekEntryResult!623 0))(
  ( (MissingZero!623 (index!4662 (_ BitVec 32))) (Found!623 (index!4663 (_ BitVec 32))) (Intermediate!623 (undefined!1435 Bool) (index!4664 (_ BitVec 32)) (x!19976 (_ BitVec 32))) (Undefined!623) (MissingVacant!623 (index!4665 (_ BitVec 32))) )
))
(declare-fun lt!90438 () SeekEntryResult!623)

(get-info :version)

(assert (=> b!183164 (= res!86674 (and (not ((_ is Undefined!623) lt!90438)) (not ((_ is MissingVacant!623) lt!90438)) (not ((_ is MissingZero!623) lt!90438)) ((_ is Found!623) lt!90438)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7767 (_ BitVec 32)) SeekEntryResult!623)

(assert (=> b!183164 (= lt!90438 (seekEntryOrOpen!0 key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(declare-fun b!183165 () Bool)

(assert (=> b!183165 (= e!120589 (not (= (size!3984 (_values!3732 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8810 thiss!1248)))))))

(declare-fun b!183166 () Bool)

(declare-fun res!86673 () Bool)

(assert (=> b!183166 (=> (not res!86673) (not e!120587))))

(assert (=> b!183166 (= res!86673 (not (= key!828 (bvneg key!828))))))

(declare-fun b!183167 () Bool)

(declare-fun tp_is_empty!4297 () Bool)

(assert (=> b!183167 (= e!120590 tp_is_empty!4297)))

(declare-fun b!183168 () Bool)

(declare-fun res!86675 () Bool)

(assert (=> b!183168 (=> (not res!86675) (not e!120589))))

(declare-datatypes ((tuple2!3388 0))(
  ( (tuple2!3389 (_1!1705 (_ BitVec 64)) (_2!1705 V!5377)) )
))
(declare-datatypes ((List!2329 0))(
  ( (Nil!2326) (Cons!2325 (h!2954 tuple2!3388) (t!7188 List!2329)) )
))
(declare-datatypes ((ListLongMap!2297 0))(
  ( (ListLongMap!2298 (toList!1164 List!2329)) )
))
(declare-fun contains!1256 (ListLongMap!2297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!797 (array!7767 array!7769 (_ BitVec 32) (_ BitVec 32) V!5377 V!5377 (_ BitVec 32) Int) ListLongMap!2297)

(assert (=> b!183168 (= res!86675 (not (contains!1256 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) key!828)))))

(declare-fun res!86677 () Bool)

(assert (=> start!18486 (=> (not res!86677) (not e!120587))))

(declare-fun valid!1060 (LongMapFixedSize!2518) Bool)

(assert (=> start!18486 (= res!86677 (valid!1060 thiss!1248))))

(assert (=> start!18486 e!120587))

(declare-fun e!120591 () Bool)

(assert (=> start!18486 e!120591))

(assert (=> start!18486 true))

(declare-fun array_inv!2373 (array!7767) Bool)

(declare-fun array_inv!2374 (array!7769) Bool)

(assert (=> b!183169 (= e!120591 (and tp!16346 tp_is_empty!4297 (array_inv!2373 (_keys!5666 thiss!1248)) (array_inv!2374 (_values!3732 thiss!1248)) e!120588))))

(declare-fun b!183170 () Bool)

(assert (=> b!183170 (= e!120585 tp_is_empty!4297)))

(declare-fun b!183171 () Bool)

(declare-fun res!86676 () Bool)

(assert (=> b!183171 (=> (not res!86676) (not e!120589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183171 (= res!86676 (validMask!0 (mask!8810 thiss!1248)))))

(assert (= (and start!18486 res!86677) b!183166))

(assert (= (and b!183166 res!86673) b!183164))

(assert (= (and b!183164 res!86674) b!183168))

(assert (= (and b!183168 res!86675) b!183171))

(assert (= (and b!183171 res!86676) b!183165))

(assert (= (and b!183163 condMapEmpty!7379) mapIsEmpty!7379))

(assert (= (and b!183163 (not condMapEmpty!7379)) mapNonEmpty!7379))

(assert (= (and mapNonEmpty!7379 ((_ is ValueCellFull!1805) mapValue!7379)) b!183170))

(assert (= (and b!183163 ((_ is ValueCellFull!1805) mapDefault!7379)) b!183167))

(assert (= b!183169 b!183163))

(assert (= start!18486 b!183169))

(declare-fun m!210215 () Bool)

(assert (=> b!183171 m!210215))

(declare-fun m!210217 () Bool)

(assert (=> b!183164 m!210217))

(declare-fun m!210219 () Bool)

(assert (=> mapNonEmpty!7379 m!210219))

(declare-fun m!210221 () Bool)

(assert (=> b!183169 m!210221))

(declare-fun m!210223 () Bool)

(assert (=> b!183169 m!210223))

(declare-fun m!210225 () Bool)

(assert (=> b!183168 m!210225))

(assert (=> b!183168 m!210225))

(declare-fun m!210227 () Bool)

(assert (=> b!183168 m!210227))

(declare-fun m!210229 () Bool)

(assert (=> start!18486 m!210229))

(check-sat (not b_next!4525) (not start!18486) (not b!183169) (not b!183168) (not b!183171) (not b!183164) b_and!11069 tp_is_empty!4297 (not mapNonEmpty!7379))
(check-sat b_and!11069 (not b_next!4525))
(get-model)

(declare-fun d!54555 () Bool)

(assert (=> d!54555 (= (array_inv!2373 (_keys!5666 thiss!1248)) (bvsge (size!3983 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183169 d!54555))

(declare-fun d!54557 () Bool)

(assert (=> d!54557 (= (array_inv!2374 (_values!3732 thiss!1248)) (bvsge (size!3984 (_values!3732 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183169 d!54557))

(declare-fun d!54559 () Bool)

(declare-fun res!86714 () Bool)

(declare-fun e!120636 () Bool)

(assert (=> d!54559 (=> (not res!86714) (not e!120636))))

(declare-fun simpleValid!175 (LongMapFixedSize!2518) Bool)

(assert (=> d!54559 (= res!86714 (simpleValid!175 thiss!1248))))

(assert (=> d!54559 (= (valid!1060 thiss!1248) e!120636)))

(declare-fun b!183232 () Bool)

(declare-fun res!86715 () Bool)

(assert (=> b!183232 (=> (not res!86715) (not e!120636))))

(declare-fun arrayCountValidKeys!0 (array!7767 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183232 (= res!86715 (= (arrayCountValidKeys!0 (_keys!5666 thiss!1248) #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))) (_size!1308 thiss!1248)))))

(declare-fun b!183233 () Bool)

(declare-fun res!86716 () Bool)

(assert (=> b!183233 (=> (not res!86716) (not e!120636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7767 (_ BitVec 32)) Bool)

(assert (=> b!183233 (= res!86716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(declare-fun b!183234 () Bool)

(declare-datatypes ((List!2330 0))(
  ( (Nil!2327) (Cons!2326 (h!2955 (_ BitVec 64)) (t!7191 List!2330)) )
))
(declare-fun arrayNoDuplicates!0 (array!7767 (_ BitVec 32) List!2330) Bool)

(assert (=> b!183234 (= e!120636 (arrayNoDuplicates!0 (_keys!5666 thiss!1248) #b00000000000000000000000000000000 Nil!2327))))

(assert (= (and d!54559 res!86714) b!183232))

(assert (= (and b!183232 res!86715) b!183233))

(assert (= (and b!183233 res!86716) b!183234))

(declare-fun m!210263 () Bool)

(assert (=> d!54559 m!210263))

(declare-fun m!210265 () Bool)

(assert (=> b!183232 m!210265))

(declare-fun m!210267 () Bool)

(assert (=> b!183233 m!210267))

(declare-fun m!210269 () Bool)

(assert (=> b!183234 m!210269))

(assert (=> start!18486 d!54559))

(declare-fun d!54561 () Bool)

(declare-fun e!120642 () Bool)

(assert (=> d!54561 e!120642))

(declare-fun res!86719 () Bool)

(assert (=> d!54561 (=> res!86719 e!120642)))

(declare-fun lt!90455 () Bool)

(assert (=> d!54561 (= res!86719 (not lt!90455))))

(declare-fun lt!90456 () Bool)

(assert (=> d!54561 (= lt!90455 lt!90456)))

(declare-datatypes ((Unit!5519 0))(
  ( (Unit!5520) )
))
(declare-fun lt!90453 () Unit!5519)

(declare-fun e!120641 () Unit!5519)

(assert (=> d!54561 (= lt!90453 e!120641)))

(declare-fun c!32824 () Bool)

(assert (=> d!54561 (= c!32824 lt!90456)))

(declare-fun containsKey!218 (List!2329 (_ BitVec 64)) Bool)

(assert (=> d!54561 (= lt!90456 (containsKey!218 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(assert (=> d!54561 (= (contains!1256 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) key!828) lt!90455)))

(declare-fun b!183241 () Bool)

(declare-fun lt!90454 () Unit!5519)

(assert (=> b!183241 (= e!120641 lt!90454)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!167 (List!2329 (_ BitVec 64)) Unit!5519)

(assert (=> b!183241 (= lt!90454 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-datatypes ((Option!220 0))(
  ( (Some!219 (v!4093 V!5377)) (None!218) )
))
(declare-fun isDefined!168 (Option!220) Bool)

(declare-fun getValueByKey!214 (List!2329 (_ BitVec 64)) Option!220)

(assert (=> b!183241 (isDefined!168 (getValueByKey!214 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-fun b!183242 () Bool)

(declare-fun Unit!5521 () Unit!5519)

(assert (=> b!183242 (= e!120641 Unit!5521)))

(declare-fun b!183243 () Bool)

(assert (=> b!183243 (= e!120642 (isDefined!168 (getValueByKey!214 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828)))))

(assert (= (and d!54561 c!32824) b!183241))

(assert (= (and d!54561 (not c!32824)) b!183242))

(assert (= (and d!54561 (not res!86719)) b!183243))

(declare-fun m!210271 () Bool)

(assert (=> d!54561 m!210271))

(declare-fun m!210273 () Bool)

(assert (=> b!183241 m!210273))

(declare-fun m!210275 () Bool)

(assert (=> b!183241 m!210275))

(assert (=> b!183241 m!210275))

(declare-fun m!210277 () Bool)

(assert (=> b!183241 m!210277))

(assert (=> b!183243 m!210275))

(assert (=> b!183243 m!210275))

(assert (=> b!183243 m!210277))

(assert (=> b!183168 d!54561))

(declare-fun b!183287 () Bool)

(declare-fun e!120675 () ListLongMap!2297)

(declare-fun call!18503 () ListLongMap!2297)

(assert (=> b!183287 (= e!120675 call!18503)))

(declare-fun b!183288 () Bool)

(declare-fun e!120677 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!183288 (= e!120677 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183289 () Bool)

(declare-fun res!86740 () Bool)

(declare-fun e!120680 () Bool)

(assert (=> b!183289 (=> (not res!86740) (not e!120680))))

(declare-fun e!120674 () Bool)

(assert (=> b!183289 (= res!86740 e!120674)))

(declare-fun res!86745 () Bool)

(assert (=> b!183289 (=> res!86745 e!120674)))

(declare-fun e!120678 () Bool)

(assert (=> b!183289 (= res!86745 (not e!120678))))

(declare-fun res!86741 () Bool)

(assert (=> b!183289 (=> (not res!86741) (not e!120678))))

(assert (=> b!183289 (= res!86741 (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun b!183290 () Bool)

(declare-fun res!86743 () Bool)

(assert (=> b!183290 (=> (not res!86743) (not e!120680))))

(declare-fun e!120676 () Bool)

(assert (=> b!183290 (= res!86743 e!120676)))

(declare-fun c!32841 () Bool)

(assert (=> b!183290 (= c!32841 (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183291 () Bool)

(declare-fun e!120679 () ListLongMap!2297)

(declare-fun call!18502 () ListLongMap!2297)

(assert (=> b!183291 (= e!120679 call!18502)))

(declare-fun b!183292 () Bool)

(declare-fun e!120672 () ListLongMap!2297)

(declare-fun call!18501 () ListLongMap!2297)

(declare-fun +!276 (ListLongMap!2297 tuple2!3388) ListLongMap!2297)

(assert (=> b!183292 (= e!120672 (+!276 call!18501 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))

(declare-fun bm!18496 () Bool)

(assert (=> bm!18496 (= call!18503 call!18501)))

(declare-fun b!183293 () Bool)

(assert (=> b!183293 (= e!120679 call!18503)))

(declare-fun d!54563 () Bool)

(assert (=> d!54563 e!120680))

(declare-fun res!86744 () Bool)

(assert (=> d!54563 (=> (not res!86744) (not e!120680))))

(assert (=> d!54563 (= res!86744 (or (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))))

(declare-fun lt!90516 () ListLongMap!2297)

(declare-fun lt!90511 () ListLongMap!2297)

(assert (=> d!54563 (= lt!90516 lt!90511)))

(declare-fun lt!90501 () Unit!5519)

(declare-fun e!120669 () Unit!5519)

(assert (=> d!54563 (= lt!90501 e!120669)))

(declare-fun c!32839 () Bool)

(assert (=> d!54563 (= c!32839 e!120677)))

(declare-fun res!86738 () Bool)

(assert (=> d!54563 (=> (not res!86738) (not e!120677))))

(assert (=> d!54563 (= res!86738 (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> d!54563 (= lt!90511 e!120672)))

(declare-fun c!32838 () Bool)

(assert (=> d!54563 (= c!32838 (and (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54563 (validMask!0 (mask!8810 thiss!1248))))

(assert (=> d!54563 (= (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) lt!90516)))

(declare-fun b!183286 () Bool)

(declare-fun Unit!5522 () Unit!5519)

(assert (=> b!183286 (= e!120669 Unit!5522)))

(declare-fun bm!18497 () Bool)

(declare-fun call!18499 () Bool)

(assert (=> bm!18497 (= call!18499 (contains!1256 lt!90516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183294 () Bool)

(assert (=> b!183294 (= e!120678 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183295 () Bool)

(declare-fun e!120671 () Bool)

(declare-fun apply!159 (ListLongMap!2297 (_ BitVec 64)) V!5377)

(declare-fun get!2102 (ValueCell!1805 V!5377) V!5377)

(declare-fun dynLambda!493 (Int (_ BitVec 64)) V!5377)

(assert (=> b!183295 (= e!120671 (= (apply!159 lt!90516 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)) (get!2102 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3984 (_values!3732 thiss!1248))))))

(assert (=> b!183295 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun b!183296 () Bool)

(declare-fun e!120673 () Bool)

(declare-fun e!120670 () Bool)

(assert (=> b!183296 (= e!120673 e!120670)))

(declare-fun res!86739 () Bool)

(declare-fun call!18500 () Bool)

(assert (=> b!183296 (= res!86739 call!18500)))

(assert (=> b!183296 (=> (not res!86739) (not e!120670))))

(declare-fun b!183297 () Bool)

(assert (=> b!183297 (= e!120674 e!120671)))

(declare-fun res!86746 () Bool)

(assert (=> b!183297 (=> (not res!86746) (not e!120671))))

(assert (=> b!183297 (= res!86746 (contains!1256 lt!90516 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183297 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun b!183298 () Bool)

(assert (=> b!183298 (= e!120676 (not call!18499))))

(declare-fun b!183299 () Bool)

(assert (=> b!183299 (= e!120672 e!120675)))

(declare-fun c!32837 () Bool)

(assert (=> b!183299 (= c!32837 (and (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183300 () Bool)

(declare-fun e!120681 () Bool)

(assert (=> b!183300 (= e!120681 (= (apply!159 lt!90516 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3590 thiss!1248)))))

(declare-fun bm!18498 () Bool)

(declare-fun call!18505 () ListLongMap!2297)

(declare-fun getCurrentListMapNoExtraKeys!180 (array!7767 array!7769 (_ BitVec 32) (_ BitVec 32) V!5377 V!5377 (_ BitVec 32) Int) ListLongMap!2297)

(assert (=> bm!18498 (= call!18505 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun b!183301 () Bool)

(declare-fun c!32842 () Bool)

(assert (=> b!183301 (= c!32842 (and (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!183301 (= e!120675 e!120679)))

(declare-fun bm!18499 () Bool)

(assert (=> bm!18499 (= call!18500 (contains!1256 lt!90516 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183302 () Bool)

(assert (=> b!183302 (= e!120676 e!120681)))

(declare-fun res!86742 () Bool)

(assert (=> b!183302 (= res!86742 call!18499)))

(assert (=> b!183302 (=> (not res!86742) (not e!120681))))

(declare-fun bm!18500 () Bool)

(declare-fun call!18504 () ListLongMap!2297)

(assert (=> bm!18500 (= call!18502 call!18504)))

(declare-fun b!183303 () Bool)

(declare-fun lt!90514 () Unit!5519)

(assert (=> b!183303 (= e!120669 lt!90514)))

(declare-fun lt!90518 () ListLongMap!2297)

(assert (=> b!183303 (= lt!90518 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90506 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90515 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90515 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90519 () Unit!5519)

(declare-fun addStillContains!135 (ListLongMap!2297 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5519)

(assert (=> b!183303 (= lt!90519 (addStillContains!135 lt!90518 lt!90506 (zeroValue!3590 thiss!1248) lt!90515))))

(assert (=> b!183303 (contains!1256 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))) lt!90515)))

(declare-fun lt!90504 () Unit!5519)

(assert (=> b!183303 (= lt!90504 lt!90519)))

(declare-fun lt!90505 () ListLongMap!2297)

(assert (=> b!183303 (= lt!90505 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90502 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90502 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90517 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90517 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90508 () Unit!5519)

(declare-fun addApplyDifferent!135 (ListLongMap!2297 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5519)

(assert (=> b!183303 (= lt!90508 (addApplyDifferent!135 lt!90505 lt!90502 (minValue!3590 thiss!1248) lt!90517))))

(assert (=> b!183303 (= (apply!159 (+!276 lt!90505 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))) lt!90517) (apply!159 lt!90505 lt!90517))))

(declare-fun lt!90522 () Unit!5519)

(assert (=> b!183303 (= lt!90522 lt!90508)))

(declare-fun lt!90520 () ListLongMap!2297)

(assert (=> b!183303 (= lt!90520 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90510 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90513 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90513 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90507 () Unit!5519)

(assert (=> b!183303 (= lt!90507 (addApplyDifferent!135 lt!90520 lt!90510 (zeroValue!3590 thiss!1248) lt!90513))))

(assert (=> b!183303 (= (apply!159 (+!276 lt!90520 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))) lt!90513) (apply!159 lt!90520 lt!90513))))

(declare-fun lt!90512 () Unit!5519)

(assert (=> b!183303 (= lt!90512 lt!90507)))

(declare-fun lt!90503 () ListLongMap!2297)

(assert (=> b!183303 (= lt!90503 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))

(declare-fun lt!90521 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90521 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90509 () (_ BitVec 64))

(assert (=> b!183303 (= lt!90509 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183303 (= lt!90514 (addApplyDifferent!135 lt!90503 lt!90521 (minValue!3590 thiss!1248) lt!90509))))

(assert (=> b!183303 (= (apply!159 (+!276 lt!90503 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))) lt!90509) (apply!159 lt!90503 lt!90509))))

(declare-fun b!183304 () Bool)

(assert (=> b!183304 (= e!120680 e!120673)))

(declare-fun c!32840 () Bool)

(assert (=> b!183304 (= c!32840 (not (= (bvand (extraKeys!3486 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18501 () Bool)

(assert (=> bm!18501 (= call!18504 call!18505)))

(declare-fun b!183305 () Bool)

(assert (=> b!183305 (= e!120670 (= (apply!159 lt!90516 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3590 thiss!1248)))))

(declare-fun b!183306 () Bool)

(assert (=> b!183306 (= e!120673 (not call!18500))))

(declare-fun bm!18502 () Bool)

(assert (=> bm!18502 (= call!18501 (+!276 (ite c!32838 call!18505 (ite c!32837 call!18504 call!18502)) (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (= (and d!54563 c!32838) b!183292))

(assert (= (and d!54563 (not c!32838)) b!183299))

(assert (= (and b!183299 c!32837) b!183287))

(assert (= (and b!183299 (not c!32837)) b!183301))

(assert (= (and b!183301 c!32842) b!183293))

(assert (= (and b!183301 (not c!32842)) b!183291))

(assert (= (or b!183293 b!183291) bm!18500))

(assert (= (or b!183287 bm!18500) bm!18501))

(assert (= (or b!183287 b!183293) bm!18496))

(assert (= (or b!183292 bm!18501) bm!18498))

(assert (= (or b!183292 bm!18496) bm!18502))

(assert (= (and d!54563 res!86738) b!183288))

(assert (= (and d!54563 c!32839) b!183303))

(assert (= (and d!54563 (not c!32839)) b!183286))

(assert (= (and d!54563 res!86744) b!183289))

(assert (= (and b!183289 res!86741) b!183294))

(assert (= (and b!183289 (not res!86745)) b!183297))

(assert (= (and b!183297 res!86746) b!183295))

(assert (= (and b!183289 res!86740) b!183290))

(assert (= (and b!183290 c!32841) b!183302))

(assert (= (and b!183290 (not c!32841)) b!183298))

(assert (= (and b!183302 res!86742) b!183300))

(assert (= (or b!183302 b!183298) bm!18497))

(assert (= (and b!183290 res!86743) b!183304))

(assert (= (and b!183304 c!32840) b!183296))

(assert (= (and b!183304 (not c!32840)) b!183306))

(assert (= (and b!183296 res!86739) b!183305))

(assert (= (or b!183296 b!183306) bm!18499))

(declare-fun b_lambda!7173 () Bool)

(assert (=> (not b_lambda!7173) (not b!183295)))

(declare-fun t!7190 () Bool)

(declare-fun tb!2821 () Bool)

(assert (=> (and b!183169 (= (defaultEntry!3749 thiss!1248) (defaultEntry!3749 thiss!1248)) t!7190) tb!2821))

(declare-fun result!4757 () Bool)

(assert (=> tb!2821 (= result!4757 tp_is_empty!4297)))

(assert (=> b!183295 t!7190))

(declare-fun b_and!11075 () Bool)

(assert (= b_and!11069 (and (=> t!7190 result!4757) b_and!11075)))

(declare-fun m!210279 () Bool)

(assert (=> bm!18497 m!210279))

(declare-fun m!210281 () Bool)

(assert (=> b!183292 m!210281))

(declare-fun m!210283 () Bool)

(assert (=> b!183297 m!210283))

(assert (=> b!183297 m!210283))

(declare-fun m!210285 () Bool)

(assert (=> b!183297 m!210285))

(declare-fun m!210287 () Bool)

(assert (=> bm!18502 m!210287))

(assert (=> d!54563 m!210215))

(declare-fun m!210289 () Bool)

(assert (=> b!183303 m!210289))

(declare-fun m!210291 () Bool)

(assert (=> b!183303 m!210291))

(declare-fun m!210293 () Bool)

(assert (=> b!183303 m!210293))

(declare-fun m!210295 () Bool)

(assert (=> b!183303 m!210295))

(assert (=> b!183303 m!210289))

(declare-fun m!210297 () Bool)

(assert (=> b!183303 m!210297))

(declare-fun m!210299 () Bool)

(assert (=> b!183303 m!210299))

(assert (=> b!183303 m!210297))

(declare-fun m!210301 () Bool)

(assert (=> b!183303 m!210301))

(declare-fun m!210303 () Bool)

(assert (=> b!183303 m!210303))

(assert (=> b!183303 m!210283))

(assert (=> b!183303 m!210295))

(declare-fun m!210305 () Bool)

(assert (=> b!183303 m!210305))

(declare-fun m!210307 () Bool)

(assert (=> b!183303 m!210307))

(declare-fun m!210309 () Bool)

(assert (=> b!183303 m!210309))

(declare-fun m!210311 () Bool)

(assert (=> b!183303 m!210311))

(declare-fun m!210313 () Bool)

(assert (=> b!183303 m!210313))

(declare-fun m!210315 () Bool)

(assert (=> b!183303 m!210315))

(assert (=> b!183303 m!210313))

(declare-fun m!210317 () Bool)

(assert (=> b!183303 m!210317))

(declare-fun m!210319 () Bool)

(assert (=> b!183303 m!210319))

(declare-fun m!210321 () Bool)

(assert (=> b!183305 m!210321))

(declare-fun m!210323 () Bool)

(assert (=> bm!18499 m!210323))

(assert (=> bm!18498 m!210303))

(assert (=> b!183294 m!210283))

(assert (=> b!183294 m!210283))

(declare-fun m!210325 () Bool)

(assert (=> b!183294 m!210325))

(assert (=> b!183295 m!210283))

(declare-fun m!210327 () Bool)

(assert (=> b!183295 m!210327))

(declare-fun m!210329 () Bool)

(assert (=> b!183295 m!210329))

(declare-fun m!210331 () Bool)

(assert (=> b!183295 m!210331))

(assert (=> b!183295 m!210283))

(declare-fun m!210333 () Bool)

(assert (=> b!183295 m!210333))

(assert (=> b!183295 m!210329))

(assert (=> b!183295 m!210327))

(declare-fun m!210335 () Bool)

(assert (=> b!183300 m!210335))

(assert (=> b!183288 m!210283))

(assert (=> b!183288 m!210283))

(assert (=> b!183288 m!210325))

(assert (=> b!183168 d!54563))

(declare-fun b!183321 () Bool)

(declare-fun e!120690 () SeekEntryResult!623)

(assert (=> b!183321 (= e!120690 Undefined!623)))

(declare-fun b!183322 () Bool)

(declare-fun e!120688 () SeekEntryResult!623)

(declare-fun lt!90530 () SeekEntryResult!623)

(assert (=> b!183322 (= e!120688 (MissingZero!623 (index!4664 lt!90530)))))

(declare-fun b!183323 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7767 (_ BitVec 32)) SeekEntryResult!623)

(assert (=> b!183323 (= e!120688 (seekKeyOrZeroReturnVacant!0 (x!19976 lt!90530) (index!4664 lt!90530) (index!4664 lt!90530) key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(declare-fun b!183324 () Bool)

(declare-fun e!120689 () SeekEntryResult!623)

(assert (=> b!183324 (= e!120689 (Found!623 (index!4664 lt!90530)))))

(declare-fun d!54565 () Bool)

(declare-fun lt!90529 () SeekEntryResult!623)

(assert (=> d!54565 (and (or ((_ is Undefined!623) lt!90529) (not ((_ is Found!623) lt!90529)) (and (bvsge (index!4663 lt!90529) #b00000000000000000000000000000000) (bvslt (index!4663 lt!90529) (size!3983 (_keys!5666 thiss!1248))))) (or ((_ is Undefined!623) lt!90529) ((_ is Found!623) lt!90529) (not ((_ is MissingZero!623) lt!90529)) (and (bvsge (index!4662 lt!90529) #b00000000000000000000000000000000) (bvslt (index!4662 lt!90529) (size!3983 (_keys!5666 thiss!1248))))) (or ((_ is Undefined!623) lt!90529) ((_ is Found!623) lt!90529) ((_ is MissingZero!623) lt!90529) (not ((_ is MissingVacant!623) lt!90529)) (and (bvsge (index!4665 lt!90529) #b00000000000000000000000000000000) (bvslt (index!4665 lt!90529) (size!3983 (_keys!5666 thiss!1248))))) (or ((_ is Undefined!623) lt!90529) (ite ((_ is Found!623) lt!90529) (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4663 lt!90529)) key!828) (ite ((_ is MissingZero!623) lt!90529) (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4662 lt!90529)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!623) lt!90529) (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4665 lt!90529)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54565 (= lt!90529 e!120690)))

(declare-fun c!32849 () Bool)

(assert (=> d!54565 (= c!32849 (and ((_ is Intermediate!623) lt!90530) (undefined!1435 lt!90530)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7767 (_ BitVec 32)) SeekEntryResult!623)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54565 (= lt!90530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8810 thiss!1248)) key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(assert (=> d!54565 (validMask!0 (mask!8810 thiss!1248))))

(assert (=> d!54565 (= (seekEntryOrOpen!0 key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)) lt!90529)))

(declare-fun b!183325 () Bool)

(assert (=> b!183325 (= e!120690 e!120689)))

(declare-fun lt!90531 () (_ BitVec 64))

(assert (=> b!183325 (= lt!90531 (select (arr!3670 (_keys!5666 thiss!1248)) (index!4664 lt!90530)))))

(declare-fun c!32851 () Bool)

(assert (=> b!183325 (= c!32851 (= lt!90531 key!828))))

(declare-fun b!183326 () Bool)

(declare-fun c!32850 () Bool)

(assert (=> b!183326 (= c!32850 (= lt!90531 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183326 (= e!120689 e!120688)))

(assert (= (and d!54565 c!32849) b!183321))

(assert (= (and d!54565 (not c!32849)) b!183325))

(assert (= (and b!183325 c!32851) b!183324))

(assert (= (and b!183325 (not c!32851)) b!183326))

(assert (= (and b!183326 c!32850) b!183322))

(assert (= (and b!183326 (not c!32850)) b!183323))

(declare-fun m!210337 () Bool)

(assert (=> b!183323 m!210337))

(assert (=> d!54565 m!210215))

(declare-fun m!210339 () Bool)

(assert (=> d!54565 m!210339))

(declare-fun m!210341 () Bool)

(assert (=> d!54565 m!210341))

(declare-fun m!210343 () Bool)

(assert (=> d!54565 m!210343))

(declare-fun m!210345 () Bool)

(assert (=> d!54565 m!210345))

(assert (=> d!54565 m!210339))

(declare-fun m!210347 () Bool)

(assert (=> d!54565 m!210347))

(declare-fun m!210349 () Bool)

(assert (=> b!183325 m!210349))

(assert (=> b!183164 d!54565))

(declare-fun d!54567 () Bool)

(assert (=> d!54567 (= (validMask!0 (mask!8810 thiss!1248)) (and (or (= (mask!8810 thiss!1248) #b00000000000000000000000000000111) (= (mask!8810 thiss!1248) #b00000000000000000000000000001111) (= (mask!8810 thiss!1248) #b00000000000000000000000000011111) (= (mask!8810 thiss!1248) #b00000000000000000000000000111111) (= (mask!8810 thiss!1248) #b00000000000000000000000001111111) (= (mask!8810 thiss!1248) #b00000000000000000000000011111111) (= (mask!8810 thiss!1248) #b00000000000000000000000111111111) (= (mask!8810 thiss!1248) #b00000000000000000000001111111111) (= (mask!8810 thiss!1248) #b00000000000000000000011111111111) (= (mask!8810 thiss!1248) #b00000000000000000000111111111111) (= (mask!8810 thiss!1248) #b00000000000000000001111111111111) (= (mask!8810 thiss!1248) #b00000000000000000011111111111111) (= (mask!8810 thiss!1248) #b00000000000000000111111111111111) (= (mask!8810 thiss!1248) #b00000000000000001111111111111111) (= (mask!8810 thiss!1248) #b00000000000000011111111111111111) (= (mask!8810 thiss!1248) #b00000000000000111111111111111111) (= (mask!8810 thiss!1248) #b00000000000001111111111111111111) (= (mask!8810 thiss!1248) #b00000000000011111111111111111111) (= (mask!8810 thiss!1248) #b00000000000111111111111111111111) (= (mask!8810 thiss!1248) #b00000000001111111111111111111111) (= (mask!8810 thiss!1248) #b00000000011111111111111111111111) (= (mask!8810 thiss!1248) #b00000000111111111111111111111111) (= (mask!8810 thiss!1248) #b00000001111111111111111111111111) (= (mask!8810 thiss!1248) #b00000011111111111111111111111111) (= (mask!8810 thiss!1248) #b00000111111111111111111111111111) (= (mask!8810 thiss!1248) #b00001111111111111111111111111111) (= (mask!8810 thiss!1248) #b00011111111111111111111111111111) (= (mask!8810 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8810 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183171 d!54567))

(declare-fun mapIsEmpty!7388 () Bool)

(declare-fun mapRes!7388 () Bool)

(assert (=> mapIsEmpty!7388 mapRes!7388))

(declare-fun b!183334 () Bool)

(declare-fun e!120695 () Bool)

(assert (=> b!183334 (= e!120695 tp_is_empty!4297)))

(declare-fun b!183333 () Bool)

(declare-fun e!120696 () Bool)

(assert (=> b!183333 (= e!120696 tp_is_empty!4297)))

(declare-fun mapNonEmpty!7388 () Bool)

(declare-fun tp!16361 () Bool)

(assert (=> mapNonEmpty!7388 (= mapRes!7388 (and tp!16361 e!120696))))

(declare-fun mapKey!7388 () (_ BitVec 32))

(declare-fun mapRest!7388 () (Array (_ BitVec 32) ValueCell!1805))

(declare-fun mapValue!7388 () ValueCell!1805)

(assert (=> mapNonEmpty!7388 (= mapRest!7379 (store mapRest!7388 mapKey!7388 mapValue!7388))))

(declare-fun condMapEmpty!7388 () Bool)

(declare-fun mapDefault!7388 () ValueCell!1805)

(assert (=> mapNonEmpty!7379 (= condMapEmpty!7388 (= mapRest!7379 ((as const (Array (_ BitVec 32) ValueCell!1805)) mapDefault!7388)))))

(assert (=> mapNonEmpty!7379 (= tp!16345 (and e!120695 mapRes!7388))))

(assert (= (and mapNonEmpty!7379 condMapEmpty!7388) mapIsEmpty!7388))

(assert (= (and mapNonEmpty!7379 (not condMapEmpty!7388)) mapNonEmpty!7388))

(assert (= (and mapNonEmpty!7388 ((_ is ValueCellFull!1805) mapValue!7388)) b!183333))

(assert (= (and mapNonEmpty!7379 ((_ is ValueCellFull!1805) mapDefault!7388)) b!183334))

(declare-fun m!210351 () Bool)

(assert (=> mapNonEmpty!7388 m!210351))

(declare-fun b_lambda!7175 () Bool)

(assert (= b_lambda!7173 (or (and b!183169 b_free!4525) b_lambda!7175)))

(check-sat (not b!183232) (not d!54563) (not b_lambda!7175) (not bm!18498) (not d!54565) (not b!183305) b_and!11075 (not d!54561) tp_is_empty!4297 (not bm!18497) (not b!183303) (not b!183288) (not b_next!4525) (not b!183294) (not b!183233) (not b!183243) (not b!183295) (not b!183323) (not b!183297) (not bm!18499) (not b!183234) (not bm!18502) (not b!183292) (not b!183300) (not b!183241) (not d!54559) (not mapNonEmpty!7388))
(check-sat b_and!11075 (not b_next!4525))
(get-model)

(declare-fun bm!18505 () Bool)

(declare-fun call!18508 () ListLongMap!2297)

(assert (=> bm!18505 (= call!18508 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3749 thiss!1248)))))

(declare-fun b!183359 () Bool)

(declare-fun e!120717 () Bool)

(declare-fun lt!90548 () ListLongMap!2297)

(declare-fun isEmpty!467 (ListLongMap!2297) Bool)

(assert (=> b!183359 (= e!120717 (isEmpty!467 lt!90548))))

(declare-fun b!183360 () Bool)

(declare-fun res!86757 () Bool)

(declare-fun e!120715 () Bool)

(assert (=> b!183360 (=> (not res!86757) (not e!120715))))

(assert (=> b!183360 (= res!86757 (not (contains!1256 lt!90548 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183361 () Bool)

(declare-fun e!120712 () Bool)

(declare-fun e!120711 () Bool)

(assert (=> b!183361 (= e!120712 e!120711)))

(assert (=> b!183361 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun res!86758 () Bool)

(assert (=> b!183361 (= res!86758 (contains!1256 lt!90548 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183361 (=> (not res!86758) (not e!120711))))

(declare-fun b!183362 () Bool)

(declare-fun lt!90552 () Unit!5519)

(declare-fun lt!90546 () Unit!5519)

(assert (=> b!183362 (= lt!90552 lt!90546)))

(declare-fun lt!90551 () ListLongMap!2297)

(declare-fun lt!90549 () V!5377)

(declare-fun lt!90550 () (_ BitVec 64))

(declare-fun lt!90547 () (_ BitVec 64))

(assert (=> b!183362 (not (contains!1256 (+!276 lt!90551 (tuple2!3389 lt!90547 lt!90549)) lt!90550))))

(declare-fun addStillNotContains!86 (ListLongMap!2297 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5519)

(assert (=> b!183362 (= lt!90546 (addStillNotContains!86 lt!90551 lt!90547 lt!90549 lt!90550))))

(assert (=> b!183362 (= lt!90550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!183362 (= lt!90549 (get!2102 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183362 (= lt!90547 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183362 (= lt!90551 call!18508)))

(declare-fun e!120714 () ListLongMap!2297)

(assert (=> b!183362 (= e!120714 (+!276 call!18508 (tuple2!3389 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000) (get!2102 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!183363 () Bool)

(declare-fun e!120713 () Bool)

(assert (=> b!183363 (= e!120713 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183363 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!183364 () Bool)

(assert (=> b!183364 (= e!120717 (= lt!90548 (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3749 thiss!1248))))))

(declare-fun b!183365 () Bool)

(declare-fun e!120716 () ListLongMap!2297)

(assert (=> b!183365 (= e!120716 e!120714)))

(declare-fun c!32863 () Bool)

(assert (=> b!183365 (= c!32863 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183366 () Bool)

(assert (=> b!183366 (= e!120714 call!18508)))

(declare-fun b!183367 () Bool)

(assert (=> b!183367 (= e!120716 (ListLongMap!2298 Nil!2326))))

(declare-fun b!183368 () Bool)

(assert (=> b!183368 (= e!120712 e!120717)))

(declare-fun c!32860 () Bool)

(assert (=> b!183368 (= c!32860 (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun b!183369 () Bool)

(assert (=> b!183369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> b!183369 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3984 (_values!3732 thiss!1248))))))

(assert (=> b!183369 (= e!120711 (= (apply!159 lt!90548 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)) (get!2102 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!54569 () Bool)

(assert (=> d!54569 e!120715))

(declare-fun res!86756 () Bool)

(assert (=> d!54569 (=> (not res!86756) (not e!120715))))

(assert (=> d!54569 (= res!86756 (not (contains!1256 lt!90548 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54569 (= lt!90548 e!120716)))

(declare-fun c!32862 () Bool)

(assert (=> d!54569 (= c!32862 (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> d!54569 (validMask!0 (mask!8810 thiss!1248))))

(assert (=> d!54569 (= (getCurrentListMapNoExtraKeys!180 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)) lt!90548)))

(declare-fun b!183370 () Bool)

(assert (=> b!183370 (= e!120715 e!120712)))

(declare-fun c!32861 () Bool)

(assert (=> b!183370 (= c!32861 e!120713)))

(declare-fun res!86755 () Bool)

(assert (=> b!183370 (=> (not res!86755) (not e!120713))))

(assert (=> b!183370 (= res!86755 (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (= (and d!54569 c!32862) b!183367))

(assert (= (and d!54569 (not c!32862)) b!183365))

(assert (= (and b!183365 c!32863) b!183362))

(assert (= (and b!183365 (not c!32863)) b!183366))

(assert (= (or b!183362 b!183366) bm!18505))

(assert (= (and d!54569 res!86756) b!183360))

(assert (= (and b!183360 res!86757) b!183370))

(assert (= (and b!183370 res!86755) b!183363))

(assert (= (and b!183370 c!32861) b!183361))

(assert (= (and b!183370 (not c!32861)) b!183368))

(assert (= (and b!183361 res!86758) b!183369))

(assert (= (and b!183368 c!32860) b!183364))

(assert (= (and b!183368 (not c!32860)) b!183359))

(declare-fun b_lambda!7177 () Bool)

(assert (=> (not b_lambda!7177) (not b!183362)))

(assert (=> b!183362 t!7190))

(declare-fun b_and!11077 () Bool)

(assert (= b_and!11075 (and (=> t!7190 result!4757) b_and!11077)))

(declare-fun b_lambda!7179 () Bool)

(assert (=> (not b_lambda!7179) (not b!183369)))

(assert (=> b!183369 t!7190))

(declare-fun b_and!11079 () Bool)

(assert (= b_and!11077 (and (=> t!7190 result!4757) b_and!11079)))

(declare-fun m!210353 () Bool)

(assert (=> b!183364 m!210353))

(assert (=> bm!18505 m!210353))

(assert (=> b!183365 m!210283))

(assert (=> b!183365 m!210283))

(assert (=> b!183365 m!210325))

(declare-fun m!210355 () Bool)

(assert (=> d!54569 m!210355))

(assert (=> d!54569 m!210215))

(assert (=> b!183362 m!210327))

(assert (=> b!183362 m!210283))

(declare-fun m!210357 () Bool)

(assert (=> b!183362 m!210357))

(assert (=> b!183362 m!210329))

(declare-fun m!210359 () Bool)

(assert (=> b!183362 m!210359))

(assert (=> b!183362 m!210357))

(declare-fun m!210361 () Bool)

(assert (=> b!183362 m!210361))

(declare-fun m!210363 () Bool)

(assert (=> b!183362 m!210363))

(assert (=> b!183362 m!210327))

(assert (=> b!183362 m!210329))

(assert (=> b!183362 m!210331))

(assert (=> b!183369 m!210327))

(assert (=> b!183369 m!210329))

(assert (=> b!183369 m!210331))

(assert (=> b!183369 m!210283))

(declare-fun m!210365 () Bool)

(assert (=> b!183369 m!210365))

(assert (=> b!183369 m!210327))

(assert (=> b!183369 m!210283))

(assert (=> b!183369 m!210329))

(assert (=> b!183361 m!210283))

(assert (=> b!183361 m!210283))

(declare-fun m!210367 () Bool)

(assert (=> b!183361 m!210367))

(declare-fun m!210369 () Bool)

(assert (=> b!183360 m!210369))

(assert (=> b!183363 m!210283))

(assert (=> b!183363 m!210283))

(assert (=> b!183363 m!210325))

(declare-fun m!210371 () Bool)

(assert (=> b!183359 m!210371))

(assert (=> bm!18498 d!54569))

(declare-fun d!54571 () Bool)

(declare-fun e!120720 () Bool)

(assert (=> d!54571 e!120720))

(declare-fun res!86763 () Bool)

(assert (=> d!54571 (=> (not res!86763) (not e!120720))))

(declare-fun lt!90564 () ListLongMap!2297)

(assert (=> d!54571 (= res!86763 (contains!1256 lt!90564 (_1!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(declare-fun lt!90561 () List!2329)

(assert (=> d!54571 (= lt!90564 (ListLongMap!2298 lt!90561))))

(declare-fun lt!90563 () Unit!5519)

(declare-fun lt!90562 () Unit!5519)

(assert (=> d!54571 (= lt!90563 lt!90562)))

(assert (=> d!54571 (= (getValueByKey!214 lt!90561 (_1!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!114 (List!2329 (_ BitVec 64) V!5377) Unit!5519)

(assert (=> d!54571 (= lt!90562 (lemmaContainsTupThenGetReturnValue!114 lt!90561 (_1!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(declare-fun insertStrictlySorted!117 (List!2329 (_ BitVec 64) V!5377) List!2329)

(assert (=> d!54571 (= lt!90561 (insertStrictlySorted!117 (toList!1164 call!18501) (_1!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (=> d!54571 (= (+!276 call!18501 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))) lt!90564)))

(declare-fun b!183375 () Bool)

(declare-fun res!86764 () Bool)

(assert (=> b!183375 (=> (not res!86764) (not e!120720))))

(assert (=> b!183375 (= res!86764 (= (getValueByKey!214 (toList!1164 lt!90564) (_1!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(declare-fun b!183376 () Bool)

(declare-fun contains!1257 (List!2329 tuple2!3388) Bool)

(assert (=> b!183376 (= e!120720 (contains!1257 (toList!1164 lt!90564) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))

(assert (= (and d!54571 res!86763) b!183375))

(assert (= (and b!183375 res!86764) b!183376))

(declare-fun m!210373 () Bool)

(assert (=> d!54571 m!210373))

(declare-fun m!210375 () Bool)

(assert (=> d!54571 m!210375))

(declare-fun m!210377 () Bool)

(assert (=> d!54571 m!210377))

(declare-fun m!210379 () Bool)

(assert (=> d!54571 m!210379))

(declare-fun m!210381 () Bool)

(assert (=> b!183375 m!210381))

(declare-fun m!210383 () Bool)

(assert (=> b!183376 m!210383))

(assert (=> b!183292 d!54571))

(declare-fun d!54573 () Bool)

(assert (=> d!54573 (isDefined!168 (getValueByKey!214 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-fun lt!90567 () Unit!5519)

(declare-fun choose!977 (List!2329 (_ BitVec 64)) Unit!5519)

(assert (=> d!54573 (= lt!90567 (choose!977 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(declare-fun e!120723 () Bool)

(assert (=> d!54573 e!120723))

(declare-fun res!86767 () Bool)

(assert (=> d!54573 (=> (not res!86767) (not e!120723))))

(declare-fun isStrictlySorted!340 (List!2329) Bool)

(assert (=> d!54573 (= res!86767 (isStrictlySorted!340 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))))

(assert (=> d!54573 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828) lt!90567)))

(declare-fun b!183379 () Bool)

(assert (=> b!183379 (= e!120723 (containsKey!218 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))

(assert (= (and d!54573 res!86767) b!183379))

(assert (=> d!54573 m!210275))

(assert (=> d!54573 m!210275))

(assert (=> d!54573 m!210277))

(declare-fun m!210385 () Bool)

(assert (=> d!54573 m!210385))

(declare-fun m!210387 () Bool)

(assert (=> d!54573 m!210387))

(assert (=> b!183379 m!210271))

(assert (=> b!183241 d!54573))

(declare-fun d!54575 () Bool)

(declare-fun isEmpty!468 (Option!220) Bool)

(assert (=> d!54575 (= (isDefined!168 (getValueByKey!214 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828)) (not (isEmpty!468 (getValueByKey!214 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828))))))

(declare-fun bs!7429 () Bool)

(assert (= bs!7429 d!54575))

(assert (=> bs!7429 m!210275))

(declare-fun m!210389 () Bool)

(assert (=> bs!7429 m!210389))

(assert (=> b!183241 d!54575))

(declare-fun d!54577 () Bool)

(declare-fun c!32868 () Bool)

(assert (=> d!54577 (= c!32868 (and ((_ is Cons!2325) (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (= (_1!1705 (h!2954 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)))))

(declare-fun e!120728 () Option!220)

(assert (=> d!54577 (= (getValueByKey!214 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828) e!120728)))

(declare-fun b!183388 () Bool)

(assert (=> b!183388 (= e!120728 (Some!219 (_2!1705 (h!2954 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))))))))

(declare-fun b!183390 () Bool)

(declare-fun e!120729 () Option!220)

(assert (=> b!183390 (= e!120729 (getValueByKey!214 (t!7188 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) key!828))))

(declare-fun b!183391 () Bool)

(assert (=> b!183391 (= e!120729 None!218)))

(declare-fun b!183389 () Bool)

(assert (=> b!183389 (= e!120728 e!120729)))

(declare-fun c!32869 () Bool)

(assert (=> b!183389 (= c!32869 (and ((_ is Cons!2325) (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (not (= (_1!1705 (h!2954 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828))))))

(assert (= (and d!54577 c!32868) b!183388))

(assert (= (and d!54577 (not c!32868)) b!183389))

(assert (= (and b!183389 c!32869) b!183390))

(assert (= (and b!183389 (not c!32869)) b!183391))

(declare-fun m!210391 () Bool)

(assert (=> b!183390 m!210391))

(assert (=> b!183241 d!54577))

(declare-fun b!183410 () Bool)

(declare-fun e!120741 () Bool)

(declare-fun e!120743 () Bool)

(assert (=> b!183410 (= e!120741 e!120743)))

(declare-fun res!86774 () Bool)

(declare-fun lt!90572 () SeekEntryResult!623)

(assert (=> b!183410 (= res!86774 (and ((_ is Intermediate!623) lt!90572) (not (undefined!1435 lt!90572)) (bvslt (x!19976 lt!90572) #b01111111111111111111111111111110) (bvsge (x!19976 lt!90572) #b00000000000000000000000000000000) (bvsge (x!19976 lt!90572) #b00000000000000000000000000000000)))))

(assert (=> b!183410 (=> (not res!86774) (not e!120743))))

(declare-fun b!183411 () Bool)

(assert (=> b!183411 (and (bvsge (index!4664 lt!90572) #b00000000000000000000000000000000) (bvslt (index!4664 lt!90572) (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun res!86776 () Bool)

(assert (=> b!183411 (= res!86776 (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4664 lt!90572)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120744 () Bool)

(assert (=> b!183411 (=> res!86776 e!120744)))

(declare-fun b!183412 () Bool)

(declare-fun e!120740 () SeekEntryResult!623)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!183412 (= e!120740 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8810 thiss!1248)) #b00000000000000000000000000000000 (mask!8810 thiss!1248)) key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(declare-fun b!183413 () Bool)

(assert (=> b!183413 (= e!120740 (Intermediate!623 false (toIndex!0 key!828 (mask!8810 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183414 () Bool)

(declare-fun e!120742 () SeekEntryResult!623)

(assert (=> b!183414 (= e!120742 (Intermediate!623 true (toIndex!0 key!828 (mask!8810 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!183415 () Bool)

(assert (=> b!183415 (and (bvsge (index!4664 lt!90572) #b00000000000000000000000000000000) (bvslt (index!4664 lt!90572) (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> b!183415 (= e!120744 (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4664 lt!90572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!54579 () Bool)

(assert (=> d!54579 e!120741))

(declare-fun c!32878 () Bool)

(assert (=> d!54579 (= c!32878 (and ((_ is Intermediate!623) lt!90572) (undefined!1435 lt!90572)))))

(assert (=> d!54579 (= lt!90572 e!120742)))

(declare-fun c!32876 () Bool)

(assert (=> d!54579 (= c!32876 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!90573 () (_ BitVec 64))

(assert (=> d!54579 (= lt!90573 (select (arr!3670 (_keys!5666 thiss!1248)) (toIndex!0 key!828 (mask!8810 thiss!1248))))))

(assert (=> d!54579 (validMask!0 (mask!8810 thiss!1248))))

(assert (=> d!54579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8810 thiss!1248)) key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)) lt!90572)))

(declare-fun b!183416 () Bool)

(assert (=> b!183416 (= e!120741 (bvsge (x!19976 lt!90572) #b01111111111111111111111111111110))))

(declare-fun b!183417 () Bool)

(assert (=> b!183417 (= e!120742 e!120740)))

(declare-fun c!32877 () Bool)

(assert (=> b!183417 (= c!32877 (or (= lt!90573 key!828) (= (bvadd lt!90573 lt!90573) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183418 () Bool)

(assert (=> b!183418 (and (bvsge (index!4664 lt!90572) #b00000000000000000000000000000000) (bvslt (index!4664 lt!90572) (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun res!86775 () Bool)

(assert (=> b!183418 (= res!86775 (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4664 lt!90572)) key!828))))

(assert (=> b!183418 (=> res!86775 e!120744)))

(assert (=> b!183418 (= e!120743 e!120744)))

(assert (= (and d!54579 c!32876) b!183414))

(assert (= (and d!54579 (not c!32876)) b!183417))

(assert (= (and b!183417 c!32877) b!183413))

(assert (= (and b!183417 (not c!32877)) b!183412))

(assert (= (and d!54579 c!32878) b!183416))

(assert (= (and d!54579 (not c!32878)) b!183410))

(assert (= (and b!183410 res!86774) b!183418))

(assert (= (and b!183418 (not res!86775)) b!183411))

(assert (= (and b!183411 (not res!86776)) b!183415))

(assert (=> b!183412 m!210339))

(declare-fun m!210393 () Bool)

(assert (=> b!183412 m!210393))

(assert (=> b!183412 m!210393))

(declare-fun m!210395 () Bool)

(assert (=> b!183412 m!210395))

(declare-fun m!210397 () Bool)

(assert (=> b!183415 m!210397))

(assert (=> d!54579 m!210339))

(declare-fun m!210399 () Bool)

(assert (=> d!54579 m!210399))

(assert (=> d!54579 m!210215))

(assert (=> b!183418 m!210397))

(assert (=> b!183411 m!210397))

(assert (=> d!54565 d!54579))

(declare-fun d!54581 () Bool)

(declare-fun lt!90579 () (_ BitVec 32))

(declare-fun lt!90578 () (_ BitVec 32))

(assert (=> d!54581 (= lt!90579 (bvmul (bvxor lt!90578 (bvlshr lt!90578 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54581 (= lt!90578 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54581 (and (bvsge (mask!8810 thiss!1248) #b00000000000000000000000000000000) (let ((res!86777 (let ((h!2956 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19993 (bvmul (bvxor h!2956 (bvlshr h!2956 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19993 (bvlshr x!19993 #b00000000000000000000000000001101)) (mask!8810 thiss!1248)))))) (and (bvslt res!86777 (bvadd (mask!8810 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!86777 #b00000000000000000000000000000000))))))

(assert (=> d!54581 (= (toIndex!0 key!828 (mask!8810 thiss!1248)) (bvand (bvxor lt!90579 (bvlshr lt!90579 #b00000000000000000000000000001101)) (mask!8810 thiss!1248)))))

(assert (=> d!54565 d!54581))

(assert (=> d!54565 d!54567))

(assert (=> d!54563 d!54567))

(declare-fun d!54583 () Bool)

(declare-fun e!120746 () Bool)

(assert (=> d!54583 e!120746))

(declare-fun res!86778 () Bool)

(assert (=> d!54583 (=> res!86778 e!120746)))

(declare-fun lt!90582 () Bool)

(assert (=> d!54583 (= res!86778 (not lt!90582))))

(declare-fun lt!90583 () Bool)

(assert (=> d!54583 (= lt!90582 lt!90583)))

(declare-fun lt!90580 () Unit!5519)

(declare-fun e!120745 () Unit!5519)

(assert (=> d!54583 (= lt!90580 e!120745)))

(declare-fun c!32879 () Bool)

(assert (=> d!54583 (= c!32879 lt!90583)))

(assert (=> d!54583 (= lt!90583 (containsKey!218 (toList!1164 lt!90516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54583 (= (contains!1256 lt!90516 #b1000000000000000000000000000000000000000000000000000000000000000) lt!90582)))

(declare-fun b!183419 () Bool)

(declare-fun lt!90581 () Unit!5519)

(assert (=> b!183419 (= e!120745 lt!90581)))

(assert (=> b!183419 (= lt!90581 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1164 lt!90516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183419 (isDefined!168 (getValueByKey!214 (toList!1164 lt!90516) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183420 () Bool)

(declare-fun Unit!5523 () Unit!5519)

(assert (=> b!183420 (= e!120745 Unit!5523)))

(declare-fun b!183421 () Bool)

(assert (=> b!183421 (= e!120746 (isDefined!168 (getValueByKey!214 (toList!1164 lt!90516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54583 c!32879) b!183419))

(assert (= (and d!54583 (not c!32879)) b!183420))

(assert (= (and d!54583 (not res!86778)) b!183421))

(declare-fun m!210401 () Bool)

(assert (=> d!54583 m!210401))

(declare-fun m!210403 () Bool)

(assert (=> b!183419 m!210403))

(declare-fun m!210405 () Bool)

(assert (=> b!183419 m!210405))

(assert (=> b!183419 m!210405))

(declare-fun m!210407 () Bool)

(assert (=> b!183419 m!210407))

(assert (=> b!183421 m!210405))

(assert (=> b!183421 m!210405))

(assert (=> b!183421 m!210407))

(assert (=> bm!18499 d!54583))

(assert (=> b!183243 d!54575))

(assert (=> b!183243 d!54577))

(declare-fun d!54585 () Bool)

(declare-fun e!120748 () Bool)

(assert (=> d!54585 e!120748))

(declare-fun res!86779 () Bool)

(assert (=> d!54585 (=> res!86779 e!120748)))

(declare-fun lt!90586 () Bool)

(assert (=> d!54585 (= res!86779 (not lt!90586))))

(declare-fun lt!90587 () Bool)

(assert (=> d!54585 (= lt!90586 lt!90587)))

(declare-fun lt!90584 () Unit!5519)

(declare-fun e!120747 () Unit!5519)

(assert (=> d!54585 (= lt!90584 e!120747)))

(declare-fun c!32880 () Bool)

(assert (=> d!54585 (= c!32880 lt!90587)))

(assert (=> d!54585 (= lt!90587 (containsKey!218 (toList!1164 lt!90516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54585 (= (contains!1256 lt!90516 #b0000000000000000000000000000000000000000000000000000000000000000) lt!90586)))

(declare-fun b!183422 () Bool)

(declare-fun lt!90585 () Unit!5519)

(assert (=> b!183422 (= e!120747 lt!90585)))

(assert (=> b!183422 (= lt!90585 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1164 lt!90516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183422 (isDefined!168 (getValueByKey!214 (toList!1164 lt!90516) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183423 () Bool)

(declare-fun Unit!5524 () Unit!5519)

(assert (=> b!183423 (= e!120747 Unit!5524)))

(declare-fun b!183424 () Bool)

(assert (=> b!183424 (= e!120748 (isDefined!168 (getValueByKey!214 (toList!1164 lt!90516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54585 c!32880) b!183422))

(assert (= (and d!54585 (not c!32880)) b!183423))

(assert (= (and d!54585 (not res!86779)) b!183424))

(declare-fun m!210409 () Bool)

(assert (=> d!54585 m!210409))

(declare-fun m!210411 () Bool)

(assert (=> b!183422 m!210411))

(declare-fun m!210413 () Bool)

(assert (=> b!183422 m!210413))

(assert (=> b!183422 m!210413))

(declare-fun m!210415 () Bool)

(assert (=> b!183422 m!210415))

(assert (=> b!183424 m!210413))

(assert (=> b!183424 m!210413))

(assert (=> b!183424 m!210415))

(assert (=> bm!18497 d!54585))

(declare-fun d!54587 () Bool)

(assert (=> d!54587 (= (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183294 d!54587))

(declare-fun d!54589 () Bool)

(declare-fun get!2103 (Option!220) V!5377)

(assert (=> d!54589 (= (apply!159 lt!90516 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)) (get!2103 (getValueByKey!214 (toList!1164 lt!90516) (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7430 () Bool)

(assert (= bs!7430 d!54589))

(assert (=> bs!7430 m!210283))

(declare-fun m!210417 () Bool)

(assert (=> bs!7430 m!210417))

(assert (=> bs!7430 m!210417))

(declare-fun m!210419 () Bool)

(assert (=> bs!7430 m!210419))

(assert (=> b!183295 d!54589))

(declare-fun d!54591 () Bool)

(declare-fun c!32883 () Bool)

(assert (=> d!54591 (= c!32883 ((_ is ValueCellFull!1805) (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!120751 () V!5377)

(assert (=> d!54591 (= (get!2102 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!120751)))

(declare-fun b!183429 () Bool)

(declare-fun get!2104 (ValueCell!1805 V!5377) V!5377)

(assert (=> b!183429 (= e!120751 (get!2104 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183430 () Bool)

(declare-fun get!2105 (ValueCell!1805 V!5377) V!5377)

(assert (=> b!183430 (= e!120751 (get!2105 (select (arr!3671 (_values!3732 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!493 (defaultEntry!3749 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54591 c!32883) b!183429))

(assert (= (and d!54591 (not c!32883)) b!183430))

(assert (=> b!183429 m!210327))

(assert (=> b!183429 m!210329))

(declare-fun m!210421 () Bool)

(assert (=> b!183429 m!210421))

(assert (=> b!183430 m!210327))

(assert (=> b!183430 m!210329))

(declare-fun m!210423 () Bool)

(assert (=> b!183430 m!210423))

(assert (=> b!183295 d!54591))

(declare-fun b!183442 () Bool)

(declare-fun e!120754 () Bool)

(assert (=> b!183442 (= e!120754 (and (bvsge (extraKeys!3486 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3486 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1308 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!183440 () Bool)

(declare-fun res!86791 () Bool)

(assert (=> b!183440 (=> (not res!86791) (not e!120754))))

(declare-fun size!3989 (LongMapFixedSize!2518) (_ BitVec 32))

(assert (=> b!183440 (= res!86791 (bvsge (size!3989 thiss!1248) (_size!1308 thiss!1248)))))

(declare-fun b!183439 () Bool)

(declare-fun res!86788 () Bool)

(assert (=> b!183439 (=> (not res!86788) (not e!120754))))

(assert (=> b!183439 (= res!86788 (and (= (size!3984 (_values!3732 thiss!1248)) (bvadd (mask!8810 thiss!1248) #b00000000000000000000000000000001)) (= (size!3983 (_keys!5666 thiss!1248)) (size!3984 (_values!3732 thiss!1248))) (bvsge (_size!1308 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1308 thiss!1248) (bvadd (mask!8810 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!183441 () Bool)

(declare-fun res!86789 () Bool)

(assert (=> b!183441 (=> (not res!86789) (not e!120754))))

(assert (=> b!183441 (= res!86789 (= (size!3989 thiss!1248) (bvadd (_size!1308 thiss!1248) (bvsdiv (bvadd (extraKeys!3486 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54593 () Bool)

(declare-fun res!86790 () Bool)

(assert (=> d!54593 (=> (not res!86790) (not e!120754))))

(assert (=> d!54593 (= res!86790 (validMask!0 (mask!8810 thiss!1248)))))

(assert (=> d!54593 (= (simpleValid!175 thiss!1248) e!120754)))

(assert (= (and d!54593 res!86790) b!183439))

(assert (= (and b!183439 res!86788) b!183440))

(assert (= (and b!183440 res!86791) b!183441))

(assert (= (and b!183441 res!86789) b!183442))

(declare-fun m!210425 () Bool)

(assert (=> b!183440 m!210425))

(assert (=> b!183441 m!210425))

(assert (=> d!54593 m!210215))

(assert (=> d!54559 d!54593))

(declare-fun d!54595 () Bool)

(assert (=> d!54595 (= (apply!159 (+!276 lt!90503 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))) lt!90509) (apply!159 lt!90503 lt!90509))))

(declare-fun lt!90590 () Unit!5519)

(declare-fun choose!978 (ListLongMap!2297 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5519)

(assert (=> d!54595 (= lt!90590 (choose!978 lt!90503 lt!90521 (minValue!3590 thiss!1248) lt!90509))))

(declare-fun e!120757 () Bool)

(assert (=> d!54595 e!120757))

(declare-fun res!86794 () Bool)

(assert (=> d!54595 (=> (not res!86794) (not e!120757))))

(assert (=> d!54595 (= res!86794 (contains!1256 lt!90503 lt!90509))))

(assert (=> d!54595 (= (addApplyDifferent!135 lt!90503 lt!90521 (minValue!3590 thiss!1248) lt!90509) lt!90590)))

(declare-fun b!183446 () Bool)

(assert (=> b!183446 (= e!120757 (not (= lt!90509 lt!90521)))))

(assert (= (and d!54595 res!86794) b!183446))

(assert (=> d!54595 m!210313))

(assert (=> d!54595 m!210317))

(declare-fun m!210427 () Bool)

(assert (=> d!54595 m!210427))

(declare-fun m!210429 () Bool)

(assert (=> d!54595 m!210429))

(assert (=> d!54595 m!210313))

(assert (=> d!54595 m!210311))

(assert (=> b!183303 d!54595))

(declare-fun d!54597 () Bool)

(assert (=> d!54597 (= (apply!159 (+!276 lt!90520 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))) lt!90513) (get!2103 (getValueByKey!214 (toList!1164 (+!276 lt!90520 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))) lt!90513)))))

(declare-fun bs!7431 () Bool)

(assert (= bs!7431 d!54597))

(declare-fun m!210431 () Bool)

(assert (=> bs!7431 m!210431))

(assert (=> bs!7431 m!210431))

(declare-fun m!210433 () Bool)

(assert (=> bs!7431 m!210433))

(assert (=> b!183303 d!54597))

(declare-fun d!54599 () Bool)

(assert (=> d!54599 (= (apply!159 (+!276 lt!90503 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))) lt!90509) (get!2103 (getValueByKey!214 (toList!1164 (+!276 lt!90503 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))) lt!90509)))))

(declare-fun bs!7432 () Bool)

(assert (= bs!7432 d!54599))

(declare-fun m!210435 () Bool)

(assert (=> bs!7432 m!210435))

(assert (=> bs!7432 m!210435))

(declare-fun m!210437 () Bool)

(assert (=> bs!7432 m!210437))

(assert (=> b!183303 d!54599))

(declare-fun d!54601 () Bool)

(assert (=> d!54601 (contains!1256 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))) lt!90515)))

(declare-fun lt!90593 () Unit!5519)

(declare-fun choose!979 (ListLongMap!2297 (_ BitVec 64) V!5377 (_ BitVec 64)) Unit!5519)

(assert (=> d!54601 (= lt!90593 (choose!979 lt!90518 lt!90506 (zeroValue!3590 thiss!1248) lt!90515))))

(assert (=> d!54601 (contains!1256 lt!90518 lt!90515)))

(assert (=> d!54601 (= (addStillContains!135 lt!90518 lt!90506 (zeroValue!3590 thiss!1248) lt!90515) lt!90593)))

(declare-fun bs!7433 () Bool)

(assert (= bs!7433 d!54601))

(assert (=> bs!7433 m!210297))

(assert (=> bs!7433 m!210297))

(assert (=> bs!7433 m!210299))

(declare-fun m!210439 () Bool)

(assert (=> bs!7433 m!210439))

(declare-fun m!210441 () Bool)

(assert (=> bs!7433 m!210441))

(assert (=> b!183303 d!54601))

(declare-fun d!54603 () Bool)

(assert (=> d!54603 (= (apply!159 lt!90520 lt!90513) (get!2103 (getValueByKey!214 (toList!1164 lt!90520) lt!90513)))))

(declare-fun bs!7434 () Bool)

(assert (= bs!7434 d!54603))

(declare-fun m!210443 () Bool)

(assert (=> bs!7434 m!210443))

(assert (=> bs!7434 m!210443))

(declare-fun m!210445 () Bool)

(assert (=> bs!7434 m!210445))

(assert (=> b!183303 d!54603))

(declare-fun d!54605 () Bool)

(declare-fun e!120758 () Bool)

(assert (=> d!54605 e!120758))

(declare-fun res!86795 () Bool)

(assert (=> d!54605 (=> (not res!86795) (not e!120758))))

(declare-fun lt!90597 () ListLongMap!2297)

(assert (=> d!54605 (= res!86795 (contains!1256 lt!90597 (_1!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))))))

(declare-fun lt!90594 () List!2329)

(assert (=> d!54605 (= lt!90597 (ListLongMap!2298 lt!90594))))

(declare-fun lt!90596 () Unit!5519)

(declare-fun lt!90595 () Unit!5519)

(assert (=> d!54605 (= lt!90596 lt!90595)))

(assert (=> d!54605 (= (getValueByKey!214 lt!90594 (_1!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54605 (= lt!90595 (lemmaContainsTupThenGetReturnValue!114 lt!90594 (_1!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54605 (= lt!90594 (insertStrictlySorted!117 (toList!1164 lt!90520) (_1!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54605 (= (+!276 lt!90520 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))) lt!90597)))

(declare-fun b!183448 () Bool)

(declare-fun res!86796 () Bool)

(assert (=> b!183448 (=> (not res!86796) (not e!120758))))

(assert (=> b!183448 (= res!86796 (= (getValueByKey!214 (toList!1164 lt!90597) (_1!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))))))))

(declare-fun b!183449 () Bool)

(assert (=> b!183449 (= e!120758 (contains!1257 (toList!1164 lt!90597) (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))))))

(assert (= (and d!54605 res!86795) b!183448))

(assert (= (and b!183448 res!86796) b!183449))

(declare-fun m!210447 () Bool)

(assert (=> d!54605 m!210447))

(declare-fun m!210449 () Bool)

(assert (=> d!54605 m!210449))

(declare-fun m!210451 () Bool)

(assert (=> d!54605 m!210451))

(declare-fun m!210453 () Bool)

(assert (=> d!54605 m!210453))

(declare-fun m!210455 () Bool)

(assert (=> b!183448 m!210455))

(declare-fun m!210457 () Bool)

(assert (=> b!183449 m!210457))

(assert (=> b!183303 d!54605))

(declare-fun d!54607 () Bool)

(declare-fun e!120760 () Bool)

(assert (=> d!54607 e!120760))

(declare-fun res!86797 () Bool)

(assert (=> d!54607 (=> res!86797 e!120760)))

(declare-fun lt!90600 () Bool)

(assert (=> d!54607 (= res!86797 (not lt!90600))))

(declare-fun lt!90601 () Bool)

(assert (=> d!54607 (= lt!90600 lt!90601)))

(declare-fun lt!90598 () Unit!5519)

(declare-fun e!120759 () Unit!5519)

(assert (=> d!54607 (= lt!90598 e!120759)))

(declare-fun c!32884 () Bool)

(assert (=> d!54607 (= c!32884 lt!90601)))

(assert (=> d!54607 (= lt!90601 (containsKey!218 (toList!1164 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))) lt!90515))))

(assert (=> d!54607 (= (contains!1256 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))) lt!90515) lt!90600)))

(declare-fun b!183450 () Bool)

(declare-fun lt!90599 () Unit!5519)

(assert (=> b!183450 (= e!120759 lt!90599)))

(assert (=> b!183450 (= lt!90599 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1164 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))) lt!90515))))

(assert (=> b!183450 (isDefined!168 (getValueByKey!214 (toList!1164 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))) lt!90515))))

(declare-fun b!183451 () Bool)

(declare-fun Unit!5525 () Unit!5519)

(assert (=> b!183451 (= e!120759 Unit!5525)))

(declare-fun b!183452 () Bool)

(assert (=> b!183452 (= e!120760 (isDefined!168 (getValueByKey!214 (toList!1164 (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))) lt!90515)))))

(assert (= (and d!54607 c!32884) b!183450))

(assert (= (and d!54607 (not c!32884)) b!183451))

(assert (= (and d!54607 (not res!86797)) b!183452))

(declare-fun m!210459 () Bool)

(assert (=> d!54607 m!210459))

(declare-fun m!210461 () Bool)

(assert (=> b!183450 m!210461))

(declare-fun m!210463 () Bool)

(assert (=> b!183450 m!210463))

(assert (=> b!183450 m!210463))

(declare-fun m!210465 () Bool)

(assert (=> b!183450 m!210465))

(assert (=> b!183452 m!210463))

(assert (=> b!183452 m!210463))

(assert (=> b!183452 m!210465))

(assert (=> b!183303 d!54607))

(declare-fun d!54609 () Bool)

(declare-fun e!120761 () Bool)

(assert (=> d!54609 e!120761))

(declare-fun res!86798 () Bool)

(assert (=> d!54609 (=> (not res!86798) (not e!120761))))

(declare-fun lt!90605 () ListLongMap!2297)

(assert (=> d!54609 (= res!86798 (contains!1256 lt!90605 (_1!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))))))

(declare-fun lt!90602 () List!2329)

(assert (=> d!54609 (= lt!90605 (ListLongMap!2298 lt!90602))))

(declare-fun lt!90604 () Unit!5519)

(declare-fun lt!90603 () Unit!5519)

(assert (=> d!54609 (= lt!90604 lt!90603)))

(assert (=> d!54609 (= (getValueByKey!214 lt!90602 (_1!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54609 (= lt!90603 (lemmaContainsTupThenGetReturnValue!114 lt!90602 (_1!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54609 (= lt!90602 (insertStrictlySorted!117 (toList!1164 lt!90518) (_1!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))))))

(assert (=> d!54609 (= (+!276 lt!90518 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))) lt!90605)))

(declare-fun b!183453 () Bool)

(declare-fun res!86799 () Bool)

(assert (=> b!183453 (=> (not res!86799) (not e!120761))))

(assert (=> b!183453 (= res!86799 (= (getValueByKey!214 (toList!1164 lt!90605) (_1!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))))))))

(declare-fun b!183454 () Bool)

(assert (=> b!183454 (= e!120761 (contains!1257 (toList!1164 lt!90605) (tuple2!3389 lt!90506 (zeroValue!3590 thiss!1248))))))

(assert (= (and d!54609 res!86798) b!183453))

(assert (= (and b!183453 res!86799) b!183454))

(declare-fun m!210467 () Bool)

(assert (=> d!54609 m!210467))

(declare-fun m!210469 () Bool)

(assert (=> d!54609 m!210469))

(declare-fun m!210471 () Bool)

(assert (=> d!54609 m!210471))

(declare-fun m!210473 () Bool)

(assert (=> d!54609 m!210473))

(declare-fun m!210475 () Bool)

(assert (=> b!183453 m!210475))

(declare-fun m!210477 () Bool)

(assert (=> b!183454 m!210477))

(assert (=> b!183303 d!54609))

(declare-fun d!54611 () Bool)

(declare-fun e!120762 () Bool)

(assert (=> d!54611 e!120762))

(declare-fun res!86800 () Bool)

(assert (=> d!54611 (=> (not res!86800) (not e!120762))))

(declare-fun lt!90609 () ListLongMap!2297)

(assert (=> d!54611 (= res!86800 (contains!1256 lt!90609 (_1!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))))))

(declare-fun lt!90606 () List!2329)

(assert (=> d!54611 (= lt!90609 (ListLongMap!2298 lt!90606))))

(declare-fun lt!90608 () Unit!5519)

(declare-fun lt!90607 () Unit!5519)

(assert (=> d!54611 (= lt!90608 lt!90607)))

(assert (=> d!54611 (= (getValueByKey!214 lt!90606 (_1!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))))))

(assert (=> d!54611 (= lt!90607 (lemmaContainsTupThenGetReturnValue!114 lt!90606 (_1!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))))))

(assert (=> d!54611 (= lt!90606 (insertStrictlySorted!117 (toList!1164 lt!90505) (_1!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))))))

(assert (=> d!54611 (= (+!276 lt!90505 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))) lt!90609)))

(declare-fun b!183455 () Bool)

(declare-fun res!86801 () Bool)

(assert (=> b!183455 (=> (not res!86801) (not e!120762))))

(assert (=> b!183455 (= res!86801 (= (getValueByKey!214 (toList!1164 lt!90609) (_1!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))))))))

(declare-fun b!183456 () Bool)

(assert (=> b!183456 (= e!120762 (contains!1257 (toList!1164 lt!90609) (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))))))

(assert (= (and d!54611 res!86800) b!183455))

(assert (= (and b!183455 res!86801) b!183456))

(declare-fun m!210479 () Bool)

(assert (=> d!54611 m!210479))

(declare-fun m!210481 () Bool)

(assert (=> d!54611 m!210481))

(declare-fun m!210483 () Bool)

(assert (=> d!54611 m!210483))

(declare-fun m!210485 () Bool)

(assert (=> d!54611 m!210485))

(declare-fun m!210487 () Bool)

(assert (=> b!183455 m!210487))

(declare-fun m!210489 () Bool)

(assert (=> b!183456 m!210489))

(assert (=> b!183303 d!54611))

(declare-fun d!54613 () Bool)

(assert (=> d!54613 (= (apply!159 (+!276 lt!90505 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))) lt!90517) (get!2103 (getValueByKey!214 (toList!1164 (+!276 lt!90505 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248)))) lt!90517)))))

(declare-fun bs!7435 () Bool)

(assert (= bs!7435 d!54613))

(declare-fun m!210491 () Bool)

(assert (=> bs!7435 m!210491))

(assert (=> bs!7435 m!210491))

(declare-fun m!210493 () Bool)

(assert (=> bs!7435 m!210493))

(assert (=> b!183303 d!54613))

(declare-fun d!54615 () Bool)

(assert (=> d!54615 (= (apply!159 lt!90503 lt!90509) (get!2103 (getValueByKey!214 (toList!1164 lt!90503) lt!90509)))))

(declare-fun bs!7436 () Bool)

(assert (= bs!7436 d!54615))

(declare-fun m!210495 () Bool)

(assert (=> bs!7436 m!210495))

(assert (=> bs!7436 m!210495))

(declare-fun m!210497 () Bool)

(assert (=> bs!7436 m!210497))

(assert (=> b!183303 d!54615))

(assert (=> b!183303 d!54569))

(declare-fun d!54617 () Bool)

(assert (=> d!54617 (= (apply!159 (+!276 lt!90505 (tuple2!3389 lt!90502 (minValue!3590 thiss!1248))) lt!90517) (apply!159 lt!90505 lt!90517))))

(declare-fun lt!90610 () Unit!5519)

(assert (=> d!54617 (= lt!90610 (choose!978 lt!90505 lt!90502 (minValue!3590 thiss!1248) lt!90517))))

(declare-fun e!120763 () Bool)

(assert (=> d!54617 e!120763))

(declare-fun res!86802 () Bool)

(assert (=> d!54617 (=> (not res!86802) (not e!120763))))

(assert (=> d!54617 (= res!86802 (contains!1256 lt!90505 lt!90517))))

(assert (=> d!54617 (= (addApplyDifferent!135 lt!90505 lt!90502 (minValue!3590 thiss!1248) lt!90517) lt!90610)))

(declare-fun b!183457 () Bool)

(assert (=> b!183457 (= e!120763 (not (= lt!90517 lt!90502)))))

(assert (= (and d!54617 res!86802) b!183457))

(assert (=> d!54617 m!210295))

(assert (=> d!54617 m!210305))

(declare-fun m!210499 () Bool)

(assert (=> d!54617 m!210499))

(declare-fun m!210501 () Bool)

(assert (=> d!54617 m!210501))

(assert (=> d!54617 m!210295))

(assert (=> d!54617 m!210319))

(assert (=> b!183303 d!54617))

(declare-fun d!54619 () Bool)

(assert (=> d!54619 (= (apply!159 (+!276 lt!90520 (tuple2!3389 lt!90510 (zeroValue!3590 thiss!1248))) lt!90513) (apply!159 lt!90520 lt!90513))))

(declare-fun lt!90611 () Unit!5519)

(assert (=> d!54619 (= lt!90611 (choose!978 lt!90520 lt!90510 (zeroValue!3590 thiss!1248) lt!90513))))

(declare-fun e!120764 () Bool)

(assert (=> d!54619 e!120764))

(declare-fun res!86803 () Bool)

(assert (=> d!54619 (=> (not res!86803) (not e!120764))))

(assert (=> d!54619 (= res!86803 (contains!1256 lt!90520 lt!90513))))

(assert (=> d!54619 (= (addApplyDifferent!135 lt!90520 lt!90510 (zeroValue!3590 thiss!1248) lt!90513) lt!90611)))

(declare-fun b!183458 () Bool)

(assert (=> b!183458 (= e!120764 (not (= lt!90513 lt!90510)))))

(assert (= (and d!54619 res!86803) b!183458))

(assert (=> d!54619 m!210289))

(assert (=> d!54619 m!210291))

(declare-fun m!210503 () Bool)

(assert (=> d!54619 m!210503))

(declare-fun m!210505 () Bool)

(assert (=> d!54619 m!210505))

(assert (=> d!54619 m!210289))

(assert (=> d!54619 m!210315))

(assert (=> b!183303 d!54619))

(declare-fun d!54621 () Bool)

(assert (=> d!54621 (= (apply!159 lt!90505 lt!90517) (get!2103 (getValueByKey!214 (toList!1164 lt!90505) lt!90517)))))

(declare-fun bs!7437 () Bool)

(assert (= bs!7437 d!54621))

(declare-fun m!210507 () Bool)

(assert (=> bs!7437 m!210507))

(assert (=> bs!7437 m!210507))

(declare-fun m!210509 () Bool)

(assert (=> bs!7437 m!210509))

(assert (=> b!183303 d!54621))

(declare-fun d!54623 () Bool)

(declare-fun e!120765 () Bool)

(assert (=> d!54623 e!120765))

(declare-fun res!86804 () Bool)

(assert (=> d!54623 (=> (not res!86804) (not e!120765))))

(declare-fun lt!90615 () ListLongMap!2297)

(assert (=> d!54623 (= res!86804 (contains!1256 lt!90615 (_1!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))))))

(declare-fun lt!90612 () List!2329)

(assert (=> d!54623 (= lt!90615 (ListLongMap!2298 lt!90612))))

(declare-fun lt!90614 () Unit!5519)

(declare-fun lt!90613 () Unit!5519)

(assert (=> d!54623 (= lt!90614 lt!90613)))

(assert (=> d!54623 (= (getValueByKey!214 lt!90612 (_1!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))))))

(assert (=> d!54623 (= lt!90613 (lemmaContainsTupThenGetReturnValue!114 lt!90612 (_1!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))))))

(assert (=> d!54623 (= lt!90612 (insertStrictlySorted!117 (toList!1164 lt!90503) (_1!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))) (_2!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))))))

(assert (=> d!54623 (= (+!276 lt!90503 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))) lt!90615)))

(declare-fun b!183459 () Bool)

(declare-fun res!86805 () Bool)

(assert (=> b!183459 (=> (not res!86805) (not e!120765))))

(assert (=> b!183459 (= res!86805 (= (getValueByKey!214 (toList!1164 lt!90615) (_1!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248)))) (Some!219 (_2!1705 (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))))))))

(declare-fun b!183460 () Bool)

(assert (=> b!183460 (= e!120765 (contains!1257 (toList!1164 lt!90615) (tuple2!3389 lt!90521 (minValue!3590 thiss!1248))))))

(assert (= (and d!54623 res!86804) b!183459))

(assert (= (and b!183459 res!86805) b!183460))

(declare-fun m!210511 () Bool)

(assert (=> d!54623 m!210511))

(declare-fun m!210513 () Bool)

(assert (=> d!54623 m!210513))

(declare-fun m!210515 () Bool)

(assert (=> d!54623 m!210515))

(declare-fun m!210517 () Bool)

(assert (=> d!54623 m!210517))

(declare-fun m!210519 () Bool)

(assert (=> b!183459 m!210519))

(declare-fun m!210521 () Bool)

(assert (=> b!183460 m!210521))

(assert (=> b!183303 d!54623))

(declare-fun b!183469 () Bool)

(declare-fun e!120771 () (_ BitVec 32))

(assert (=> b!183469 (= e!120771 #b00000000000000000000000000000000)))

(declare-fun d!54625 () Bool)

(declare-fun lt!90618 () (_ BitVec 32))

(assert (=> d!54625 (and (bvsge lt!90618 #b00000000000000000000000000000000) (bvsle lt!90618 (bvsub (size!3983 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54625 (= lt!90618 e!120771)))

(declare-fun c!32889 () Bool)

(assert (=> d!54625 (= c!32889 (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> d!54625 (and (bvsle #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3983 (_keys!5666 thiss!1248)) (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> d!54625 (= (arrayCountValidKeys!0 (_keys!5666 thiss!1248) #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))) lt!90618)))

(declare-fun b!183470 () Bool)

(declare-fun e!120770 () (_ BitVec 32))

(declare-fun call!18511 () (_ BitVec 32))

(assert (=> b!183470 (= e!120770 call!18511)))

(declare-fun b!183471 () Bool)

(assert (=> b!183471 (= e!120771 e!120770)))

(declare-fun c!32890 () Bool)

(assert (=> b!183471 (= c!32890 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18508 () Bool)

(assert (=> bm!18508 (= call!18511 (arrayCountValidKeys!0 (_keys!5666 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3983 (_keys!5666 thiss!1248))))))

(declare-fun b!183472 () Bool)

(assert (=> b!183472 (= e!120770 (bvadd #b00000000000000000000000000000001 call!18511))))

(assert (= (and d!54625 c!32889) b!183469))

(assert (= (and d!54625 (not c!32889)) b!183471))

(assert (= (and b!183471 c!32890) b!183472))

(assert (= (and b!183471 (not c!32890)) b!183470))

(assert (= (or b!183472 b!183470) bm!18508))

(assert (=> b!183471 m!210283))

(assert (=> b!183471 m!210283))

(assert (=> b!183471 m!210325))

(declare-fun m!210523 () Bool)

(assert (=> bm!18508 m!210523))

(assert (=> b!183232 d!54625))

(declare-fun d!54627 () Bool)

(declare-fun e!120773 () Bool)

(assert (=> d!54627 e!120773))

(declare-fun res!86806 () Bool)

(assert (=> d!54627 (=> res!86806 e!120773)))

(declare-fun lt!90621 () Bool)

(assert (=> d!54627 (= res!86806 (not lt!90621))))

(declare-fun lt!90622 () Bool)

(assert (=> d!54627 (= lt!90621 lt!90622)))

(declare-fun lt!90619 () Unit!5519)

(declare-fun e!120772 () Unit!5519)

(assert (=> d!54627 (= lt!90619 e!120772)))

(declare-fun c!32891 () Bool)

(assert (=> d!54627 (= c!32891 lt!90622)))

(assert (=> d!54627 (= lt!90622 (containsKey!218 (toList!1164 lt!90516) (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54627 (= (contains!1256 lt!90516 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)) lt!90621)))

(declare-fun b!183473 () Bool)

(declare-fun lt!90620 () Unit!5519)

(assert (=> b!183473 (= e!120772 lt!90620)))

(assert (=> b!183473 (= lt!90620 (lemmaContainsKeyImpliesGetValueByKeyDefined!167 (toList!1164 lt!90516) (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183473 (isDefined!168 (getValueByKey!214 (toList!1164 lt!90516) (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183474 () Bool)

(declare-fun Unit!5526 () Unit!5519)

(assert (=> b!183474 (= e!120772 Unit!5526)))

(declare-fun b!183475 () Bool)

(assert (=> b!183475 (= e!120773 (isDefined!168 (getValueByKey!214 (toList!1164 lt!90516) (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54627 c!32891) b!183473))

(assert (= (and d!54627 (not c!32891)) b!183474))

(assert (= (and d!54627 (not res!86806)) b!183475))

(assert (=> d!54627 m!210283))

(declare-fun m!210525 () Bool)

(assert (=> d!54627 m!210525))

(assert (=> b!183473 m!210283))

(declare-fun m!210527 () Bool)

(assert (=> b!183473 m!210527))

(assert (=> b!183473 m!210283))

(assert (=> b!183473 m!210417))

(assert (=> b!183473 m!210417))

(declare-fun m!210529 () Bool)

(assert (=> b!183473 m!210529))

(assert (=> b!183475 m!210283))

(assert (=> b!183475 m!210417))

(assert (=> b!183475 m!210417))

(assert (=> b!183475 m!210529))

(assert (=> b!183297 d!54627))

(assert (=> b!183288 d!54587))

(declare-fun d!54629 () Bool)

(declare-fun res!86811 () Bool)

(declare-fun e!120778 () Bool)

(assert (=> d!54629 (=> res!86811 e!120778)))

(assert (=> d!54629 (= res!86811 (and ((_ is Cons!2325) (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (= (_1!1705 (h!2954 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)))))

(assert (=> d!54629 (= (containsKey!218 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))) key!828) e!120778)))

(declare-fun b!183480 () Bool)

(declare-fun e!120779 () Bool)

(assert (=> b!183480 (= e!120778 e!120779)))

(declare-fun res!86812 () Bool)

(assert (=> b!183480 (=> (not res!86812) (not e!120779))))

(assert (=> b!183480 (= res!86812 (and (or (not ((_ is Cons!2325) (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) (bvsle (_1!1705 (h!2954 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)) ((_ is Cons!2325) (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) (bvslt (_1!1705 (h!2954 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248))))) key!828)))))

(declare-fun b!183481 () Bool)

(assert (=> b!183481 (= e!120779 (containsKey!218 (t!7188 (toList!1164 (getCurrentListMap!797 (_keys!5666 thiss!1248) (_values!3732 thiss!1248) (mask!8810 thiss!1248) (extraKeys!3486 thiss!1248) (zeroValue!3590 thiss!1248) (minValue!3590 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3749 thiss!1248)))) key!828))))

(assert (= (and d!54629 (not res!86811)) b!183480))

(assert (= (and b!183480 res!86812) b!183481))

(declare-fun m!210531 () Bool)

(assert (=> b!183481 m!210531))

(assert (=> d!54561 d!54629))

(declare-fun b!183490 () Bool)

(declare-fun e!120788 () Bool)

(declare-fun e!120787 () Bool)

(assert (=> b!183490 (= e!120788 e!120787)))

(declare-fun lt!90629 () (_ BitVec 64))

(assert (=> b!183490 (= lt!90629 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90631 () Unit!5519)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7767 (_ BitVec 64) (_ BitVec 32)) Unit!5519)

(assert (=> b!183490 (= lt!90631 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5666 thiss!1248) lt!90629 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183490 (arrayContainsKey!0 (_keys!5666 thiss!1248) lt!90629 #b00000000000000000000000000000000)))

(declare-fun lt!90630 () Unit!5519)

(assert (=> b!183490 (= lt!90630 lt!90631)))

(declare-fun res!86818 () Bool)

(assert (=> b!183490 (= res!86818 (= (seekEntryOrOpen!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000) (_keys!5666 thiss!1248) (mask!8810 thiss!1248)) (Found!623 #b00000000000000000000000000000000)))))

(assert (=> b!183490 (=> (not res!86818) (not e!120787))))

(declare-fun bm!18511 () Bool)

(declare-fun call!18514 () Bool)

(assert (=> bm!18511 (= call!18514 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(declare-fun b!183491 () Bool)

(assert (=> b!183491 (= e!120788 call!18514)))

(declare-fun d!54631 () Bool)

(declare-fun res!86817 () Bool)

(declare-fun e!120786 () Bool)

(assert (=> d!54631 (=> res!86817 e!120786)))

(assert (=> d!54631 (= res!86817 (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> d!54631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)) e!120786)))

(declare-fun b!183492 () Bool)

(assert (=> b!183492 (= e!120786 e!120788)))

(declare-fun c!32894 () Bool)

(assert (=> b!183492 (= c!32894 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183493 () Bool)

(assert (=> b!183493 (= e!120787 call!18514)))

(assert (= (and d!54631 (not res!86817)) b!183492))

(assert (= (and b!183492 c!32894) b!183490))

(assert (= (and b!183492 (not c!32894)) b!183491))

(assert (= (and b!183490 res!86818) b!183493))

(assert (= (or b!183493 b!183491) bm!18511))

(assert (=> b!183490 m!210283))

(declare-fun m!210533 () Bool)

(assert (=> b!183490 m!210533))

(declare-fun m!210535 () Bool)

(assert (=> b!183490 m!210535))

(assert (=> b!183490 m!210283))

(declare-fun m!210537 () Bool)

(assert (=> b!183490 m!210537))

(declare-fun m!210539 () Bool)

(assert (=> bm!18511 m!210539))

(assert (=> b!183492 m!210283))

(assert (=> b!183492 m!210283))

(assert (=> b!183492 m!210325))

(assert (=> b!183233 d!54631))

(declare-fun lt!90637 () SeekEntryResult!623)

(declare-fun d!54633 () Bool)

(assert (=> d!54633 (and (or ((_ is Undefined!623) lt!90637) (not ((_ is Found!623) lt!90637)) (and (bvsge (index!4663 lt!90637) #b00000000000000000000000000000000) (bvslt (index!4663 lt!90637) (size!3983 (_keys!5666 thiss!1248))))) (or ((_ is Undefined!623) lt!90637) ((_ is Found!623) lt!90637) (not ((_ is MissingVacant!623) lt!90637)) (not (= (index!4665 lt!90637) (index!4664 lt!90530))) (and (bvsge (index!4665 lt!90637) #b00000000000000000000000000000000) (bvslt (index!4665 lt!90637) (size!3983 (_keys!5666 thiss!1248))))) (or ((_ is Undefined!623) lt!90637) (ite ((_ is Found!623) lt!90637) (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4663 lt!90637)) key!828) (and ((_ is MissingVacant!623) lt!90637) (= (index!4665 lt!90637) (index!4664 lt!90530)) (= (select (arr!3670 (_keys!5666 thiss!1248)) (index!4665 lt!90637)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!120795 () SeekEntryResult!623)

(assert (=> d!54633 (= lt!90637 e!120795)))

(declare-fun c!32903 () Bool)

(assert (=> d!54633 (= c!32903 (bvsge (x!19976 lt!90530) #b01111111111111111111111111111110))))

(declare-fun lt!90636 () (_ BitVec 64))

(assert (=> d!54633 (= lt!90636 (select (arr!3670 (_keys!5666 thiss!1248)) (index!4664 lt!90530)))))

(assert (=> d!54633 (validMask!0 (mask!8810 thiss!1248))))

(assert (=> d!54633 (= (seekKeyOrZeroReturnVacant!0 (x!19976 lt!90530) (index!4664 lt!90530) (index!4664 lt!90530) key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)) lt!90637)))

(declare-fun b!183506 () Bool)

(declare-fun e!120797 () SeekEntryResult!623)

(assert (=> b!183506 (= e!120797 (MissingVacant!623 (index!4664 lt!90530)))))

(declare-fun b!183507 () Bool)

(declare-fun e!120796 () SeekEntryResult!623)

(assert (=> b!183507 (= e!120795 e!120796)))

(declare-fun c!32902 () Bool)

(assert (=> b!183507 (= c!32902 (= lt!90636 key!828))))

(declare-fun b!183508 () Bool)

(assert (=> b!183508 (= e!120795 Undefined!623)))

(declare-fun b!183509 () Bool)

(assert (=> b!183509 (= e!120796 (Found!623 (index!4664 lt!90530)))))

(declare-fun b!183510 () Bool)

(declare-fun c!32901 () Bool)

(assert (=> b!183510 (= c!32901 (= lt!90636 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!183510 (= e!120796 e!120797)))

(declare-fun b!183511 () Bool)

(assert (=> b!183511 (= e!120797 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19976 lt!90530) #b00000000000000000000000000000001) (nextIndex!0 (index!4664 lt!90530) (x!19976 lt!90530) (mask!8810 thiss!1248)) (index!4664 lt!90530) key!828 (_keys!5666 thiss!1248) (mask!8810 thiss!1248)))))

(assert (= (and d!54633 c!32903) b!183508))

(assert (= (and d!54633 (not c!32903)) b!183507))

(assert (= (and b!183507 c!32902) b!183509))

(assert (= (and b!183507 (not c!32902)) b!183510))

(assert (= (and b!183510 c!32901) b!183506))

(assert (= (and b!183510 (not c!32901)) b!183511))

(declare-fun m!210541 () Bool)

(assert (=> d!54633 m!210541))

(declare-fun m!210543 () Bool)

(assert (=> d!54633 m!210543))

(assert (=> d!54633 m!210349))

(assert (=> d!54633 m!210215))

(declare-fun m!210545 () Bool)

(assert (=> b!183511 m!210545))

(assert (=> b!183511 m!210545))

(declare-fun m!210547 () Bool)

(assert (=> b!183511 m!210547))

(assert (=> b!183323 d!54633))

(declare-fun d!54635 () Bool)

(assert (=> d!54635 (= (apply!159 lt!90516 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2103 (getValueByKey!214 (toList!1164 lt!90516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7438 () Bool)

(assert (= bs!7438 d!54635))

(assert (=> bs!7438 m!210405))

(assert (=> bs!7438 m!210405))

(declare-fun m!210549 () Bool)

(assert (=> bs!7438 m!210549))

(assert (=> b!183305 d!54635))

(declare-fun b!183522 () Bool)

(declare-fun e!120809 () Bool)

(declare-fun e!120807 () Bool)

(assert (=> b!183522 (= e!120809 e!120807)))

(declare-fun res!86825 () Bool)

(assert (=> b!183522 (=> (not res!86825) (not e!120807))))

(declare-fun e!120808 () Bool)

(assert (=> b!183522 (= res!86825 (not e!120808))))

(declare-fun res!86826 () Bool)

(assert (=> b!183522 (=> (not res!86826) (not e!120808))))

(assert (=> b!183522 (= res!86826 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183523 () Bool)

(declare-fun contains!1258 (List!2330 (_ BitVec 64)) Bool)

(assert (=> b!183523 (= e!120808 (contains!1258 Nil!2327 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183524 () Bool)

(declare-fun e!120806 () Bool)

(declare-fun call!18517 () Bool)

(assert (=> b!183524 (= e!120806 call!18517)))

(declare-fun d!54637 () Bool)

(declare-fun res!86827 () Bool)

(assert (=> d!54637 (=> res!86827 e!120809)))

(assert (=> d!54637 (= res!86827 (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5666 thiss!1248))))))

(assert (=> d!54637 (= (arrayNoDuplicates!0 (_keys!5666 thiss!1248) #b00000000000000000000000000000000 Nil!2327) e!120809)))

(declare-fun b!183525 () Bool)

(assert (=> b!183525 (= e!120807 e!120806)))

(declare-fun c!32906 () Bool)

(assert (=> b!183525 (= c!32906 (validKeyInArray!0 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183526 () Bool)

(assert (=> b!183526 (= e!120806 call!18517)))

(declare-fun bm!18514 () Bool)

(assert (=> bm!18514 (= call!18517 (arrayNoDuplicates!0 (_keys!5666 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32906 (Cons!2326 (select (arr!3670 (_keys!5666 thiss!1248)) #b00000000000000000000000000000000) Nil!2327) Nil!2327)))))

(assert (= (and d!54637 (not res!86827)) b!183522))

(assert (= (and b!183522 res!86826) b!183523))

(assert (= (and b!183522 res!86825) b!183525))

(assert (= (and b!183525 c!32906) b!183524))

(assert (= (and b!183525 (not c!32906)) b!183526))

(assert (= (or b!183524 b!183526) bm!18514))

(assert (=> b!183522 m!210283))

(assert (=> b!183522 m!210283))

(assert (=> b!183522 m!210325))

(assert (=> b!183523 m!210283))

(assert (=> b!183523 m!210283))

(declare-fun m!210551 () Bool)

(assert (=> b!183523 m!210551))

(assert (=> b!183525 m!210283))

(assert (=> b!183525 m!210283))

(assert (=> b!183525 m!210325))

(assert (=> bm!18514 m!210283))

(declare-fun m!210553 () Bool)

(assert (=> bm!18514 m!210553))

(assert (=> b!183234 d!54637))

(declare-fun d!54639 () Bool)

(declare-fun e!120810 () Bool)

(assert (=> d!54639 e!120810))

(declare-fun res!86828 () Bool)

(assert (=> d!54639 (=> (not res!86828) (not e!120810))))

(declare-fun lt!90641 () ListLongMap!2297)

(assert (=> d!54639 (= res!86828 (contains!1256 lt!90641 (_1!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(declare-fun lt!90638 () List!2329)

(assert (=> d!54639 (= lt!90641 (ListLongMap!2298 lt!90638))))

(declare-fun lt!90640 () Unit!5519)

(declare-fun lt!90639 () Unit!5519)

(assert (=> d!54639 (= lt!90640 lt!90639)))

(assert (=> d!54639 (= (getValueByKey!214 lt!90638 (_1!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))) (Some!219 (_2!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(assert (=> d!54639 (= lt!90639 (lemmaContainsTupThenGetReturnValue!114 lt!90638 (_1!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (_2!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(assert (=> d!54639 (= lt!90638 (insertStrictlySorted!117 (toList!1164 (ite c!32838 call!18505 (ite c!32837 call!18504 call!18502))) (_1!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) (_2!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))))))

(assert (=> d!54639 (= (+!276 (ite c!32838 call!18505 (ite c!32837 call!18504 call!18502)) (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))) lt!90641)))

(declare-fun b!183527 () Bool)

(declare-fun res!86829 () Bool)

(assert (=> b!183527 (=> (not res!86829) (not e!120810))))

(assert (=> b!183527 (= res!86829 (= (getValueByKey!214 (toList!1164 lt!90641) (_1!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248))))) (Some!219 (_2!1705 (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))))

(declare-fun b!183528 () Bool)

(assert (=> b!183528 (= e!120810 (contains!1257 (toList!1164 lt!90641) (ite (or c!32838 c!32837) (tuple2!3389 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3590 thiss!1248)) (tuple2!3389 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3590 thiss!1248)))))))

(assert (= (and d!54639 res!86828) b!183527))

(assert (= (and b!183527 res!86829) b!183528))

(declare-fun m!210555 () Bool)

(assert (=> d!54639 m!210555))

(declare-fun m!210557 () Bool)

(assert (=> d!54639 m!210557))

(declare-fun m!210559 () Bool)

(assert (=> d!54639 m!210559))

(declare-fun m!210561 () Bool)

(assert (=> d!54639 m!210561))

(declare-fun m!210563 () Bool)

(assert (=> b!183527 m!210563))

(declare-fun m!210565 () Bool)

(assert (=> b!183528 m!210565))

(assert (=> bm!18502 d!54639))

(declare-fun d!54641 () Bool)

(assert (=> d!54641 (= (apply!159 lt!90516 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2103 (getValueByKey!214 (toList!1164 lt!90516) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7439 () Bool)

(assert (= bs!7439 d!54641))

(assert (=> bs!7439 m!210413))

(assert (=> bs!7439 m!210413))

(declare-fun m!210567 () Bool)

(assert (=> bs!7439 m!210567))

(assert (=> b!183300 d!54641))

(declare-fun mapIsEmpty!7389 () Bool)

(declare-fun mapRes!7389 () Bool)

(assert (=> mapIsEmpty!7389 mapRes!7389))

(declare-fun b!183530 () Bool)

(declare-fun e!120811 () Bool)

(assert (=> b!183530 (= e!120811 tp_is_empty!4297)))

(declare-fun b!183529 () Bool)

(declare-fun e!120812 () Bool)

(assert (=> b!183529 (= e!120812 tp_is_empty!4297)))

(declare-fun mapNonEmpty!7389 () Bool)

(declare-fun tp!16362 () Bool)

(assert (=> mapNonEmpty!7389 (= mapRes!7389 (and tp!16362 e!120812))))

(declare-fun mapKey!7389 () (_ BitVec 32))

(declare-fun mapValue!7389 () ValueCell!1805)

(declare-fun mapRest!7389 () (Array (_ BitVec 32) ValueCell!1805))

(assert (=> mapNonEmpty!7389 (= mapRest!7388 (store mapRest!7389 mapKey!7389 mapValue!7389))))

(declare-fun condMapEmpty!7389 () Bool)

(declare-fun mapDefault!7389 () ValueCell!1805)

(assert (=> mapNonEmpty!7388 (= condMapEmpty!7389 (= mapRest!7388 ((as const (Array (_ BitVec 32) ValueCell!1805)) mapDefault!7389)))))

(assert (=> mapNonEmpty!7388 (= tp!16361 (and e!120811 mapRes!7389))))

(assert (= (and mapNonEmpty!7388 condMapEmpty!7389) mapIsEmpty!7389))

(assert (= (and mapNonEmpty!7388 (not condMapEmpty!7389)) mapNonEmpty!7389))

(assert (= (and mapNonEmpty!7389 ((_ is ValueCellFull!1805) mapValue!7389)) b!183529))

(assert (= (and mapNonEmpty!7388 ((_ is ValueCellFull!1805) mapDefault!7389)) b!183530))

(declare-fun m!210569 () Bool)

(assert (=> mapNonEmpty!7389 m!210569))

(declare-fun b_lambda!7181 () Bool)

(assert (= b_lambda!7177 (or (and b!183169 b_free!4525) b_lambda!7181)))

(declare-fun b_lambda!7183 () Bool)

(assert (= b_lambda!7179 (or (and b!183169 b_free!4525) b_lambda!7183)))

(check-sat (not b!183471) (not b!183459) (not d!54593) (not b_lambda!7175) (not b!183363) (not d!54641) b_and!11079 (not b!183364) (not d!54621) (not b!183390) (not d!54595) (not b!183527) (not b!183525) (not b!183449) (not b_next!4525) (not d!54639) (not b!183360) (not b!183376) (not b!183422) (not b!183473) (not b!183475) (not d!54615) (not b!183430) (not b!183375) (not d!54603) (not d!54611) (not b!183359) (not d!54613) (not d!54569) (not b!183452) (not bm!18514) (not b!183365) (not b!183511) (not d!54627) (not b!183528) (not d!54575) (not d!54579) (not d!54617) (not b!183419) (not b!183454) (not b!183460) (not b!183453) (not b!183379) (not b_lambda!7181) (not d!54619) (not d!54597) (not d!54601) (not d!54609) (not b!183456) (not d!54623) (not b!183481) (not bm!18508) (not d!54585) (not d!54571) (not b!183523) (not b!183362) (not b!183361) tp_is_empty!4297 (not b!183429) (not b!183440) (not b!183369) (not b!183492) (not b!183421) (not b!183455) (not d!54583) (not b!183490) (not d!54573) (not b!183441) (not bm!18505) (not b!183522) (not b!183450) (not b_lambda!7183) (not bm!18511) (not d!54607) (not b!183412) (not d!54635) (not d!54633) (not d!54589) (not b!183424) (not mapNonEmpty!7389) (not b!183448) (not d!54605) (not d!54599))
(check-sat b_and!11079 (not b_next!4525))
