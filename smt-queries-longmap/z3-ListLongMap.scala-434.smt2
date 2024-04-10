; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8164 () Bool)

(assert start!8164)

(declare-fun b!51549 () Bool)

(declare-fun b_free!1601 () Bool)

(declare-fun b_next!1601 () Bool)

(assert (=> b!51549 (= b_free!1601 (not b_next!1601))))

(declare-fun tp!6893 () Bool)

(declare-fun b_and!2811 () Bool)

(assert (=> b!51549 (= tp!6893 b_and!2811)))

(declare-fun b!51556 () Bool)

(declare-fun b_free!1603 () Bool)

(declare-fun b_next!1603 () Bool)

(assert (=> b!51556 (= b_free!1603 (not b_next!1603))))

(declare-fun tp!6894 () Bool)

(declare-fun b_and!2813 () Bool)

(assert (=> b!51556 (= tp!6894 b_and!2813)))

(declare-fun b!51545 () Bool)

(declare-fun e!33434 () Bool)

(declare-fun tp_is_empty!2217 () Bool)

(assert (=> b!51545 (= e!33434 tp_is_empty!2217)))

(declare-fun b!51546 () Bool)

(declare-fun e!33439 () Bool)

(declare-datatypes ((V!2603 0))(
  ( (V!2604 (val!1153 Int)) )
))
(declare-datatypes ((array!3353 0))(
  ( (array!3354 (arr!1601 (Array (_ BitVec 32) (_ BitVec 64))) (size!1828 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!765 0))(
  ( (ValueCellFull!765 (v!2195 V!2603)) (EmptyCell!765) )
))
(declare-datatypes ((array!3355 0))(
  ( (array!3356 (arr!1602 (Array (_ BitVec 32) ValueCell!765)) (size!1829 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!438 0))(
  ( (LongMapFixedSize!439 (defaultEntry!1933 Int) (mask!5742 (_ BitVec 32)) (extraKeys!1824 (_ BitVec 32)) (zeroValue!1851 V!2603) (minValue!1851 V!2603) (_size!268 (_ BitVec 32)) (_keys!3549 array!3353) (_values!1916 array!3355) (_vacant!268 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!262 0))(
  ( (Cell!263 (v!2196 LongMapFixedSize!438)) )
))
(declare-datatypes ((LongMap!262 0))(
  ( (LongMap!263 (underlying!142 Cell!262)) )
))
(declare-fun thiss!992 () LongMap!262)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3353 (_ BitVec 32)) Bool)

(assert (=> b!51546 (= e!33439 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992))))))))

(declare-fun b!51547 () Bool)

(declare-fun e!33433 () Bool)

(declare-fun e!33438 () Bool)

(declare-fun mapRes!2310 () Bool)

(assert (=> b!51547 (= e!33433 (and e!33438 mapRes!2310))))

(declare-fun condMapEmpty!2309 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!438)

(declare-fun mapDefault!2310 () ValueCell!765)

(assert (=> b!51547 (= condMapEmpty!2309 (= (arr!1602 (_values!1916 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!765)) mapDefault!2310)))))

(declare-fun b!51548 () Bool)

(declare-fun res!29473 () Bool)

(assert (=> b!51548 (=> (not res!29473) (not e!33439))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51548 (= res!29473 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992)))))))))

(declare-fun e!33437 () Bool)

(declare-fun e!33442 () Bool)

(declare-fun array_inv!983 (array!3353) Bool)

(declare-fun array_inv!984 (array!3355) Bool)

(assert (=> b!51549 (= e!33437 (and tp!6893 tp_is_empty!2217 (array_inv!983 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (array_inv!984 (_values!1916 (v!2196 (underlying!142 thiss!992)))) e!33442))))

(declare-fun b!51550 () Bool)

(declare-fun e!33440 () Bool)

(assert (=> b!51550 (= e!33440 tp_is_empty!2217)))

(declare-fun mapNonEmpty!2309 () Bool)

(declare-fun mapRes!2309 () Bool)

(declare-fun tp!6892 () Bool)

(assert (=> mapNonEmpty!2309 (= mapRes!2309 (and tp!6892 e!33434))))

(declare-fun mapKey!2309 () (_ BitVec 32))

(declare-fun mapValue!2309 () ValueCell!765)

(declare-fun mapRest!2310 () (Array (_ BitVec 32) ValueCell!765))

(assert (=> mapNonEmpty!2309 (= (arr!1602 (_values!1916 (v!2196 (underlying!142 thiss!992)))) (store mapRest!2310 mapKey!2309 mapValue!2309))))

(declare-fun b!51551 () Bool)

(declare-fun res!29470 () Bool)

(assert (=> b!51551 (=> (not res!29470) (not e!33439))))

(assert (=> b!51551 (= res!29470 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5742 newMap!16)) (_size!268 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun b!51552 () Bool)

(assert (=> b!51552 (= e!33438 tp_is_empty!2217)))

(declare-fun mapNonEmpty!2310 () Bool)

(declare-fun tp!6891 () Bool)

(declare-fun e!33435 () Bool)

(assert (=> mapNonEmpty!2310 (= mapRes!2310 (and tp!6891 e!33435))))

(declare-fun mapKey!2310 () (_ BitVec 32))

(declare-fun mapValue!2310 () ValueCell!765)

(declare-fun mapRest!2309 () (Array (_ BitVec 32) ValueCell!765))

(assert (=> mapNonEmpty!2310 (= (arr!1602 (_values!1916 newMap!16)) (store mapRest!2309 mapKey!2310 mapValue!2310))))

(declare-fun b!51553 () Bool)

(declare-fun res!29474 () Bool)

(assert (=> b!51553 (=> (not res!29474) (not e!33439))))

(declare-fun valid!150 (LongMapFixedSize!438) Bool)

(assert (=> b!51553 (= res!29474 (valid!150 newMap!16))))

(declare-fun b!51554 () Bool)

(declare-fun e!33436 () Bool)

(assert (=> b!51554 (= e!33436 e!33437)))

(declare-fun b!51555 () Bool)

(declare-fun res!29471 () Bool)

(assert (=> b!51555 (=> (not res!29471) (not e!33439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51555 (= res!29471 (validMask!0 (mask!5742 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun e!33444 () Bool)

(assert (=> b!51556 (= e!33444 (and tp!6894 tp_is_empty!2217 (array_inv!983 (_keys!3549 newMap!16)) (array_inv!984 (_values!1916 newMap!16)) e!33433))))

(declare-fun res!29472 () Bool)

(assert (=> start!8164 (=> (not res!29472) (not e!33439))))

(declare-fun valid!151 (LongMap!262) Bool)

(assert (=> start!8164 (= res!29472 (valid!151 thiss!992))))

(assert (=> start!8164 e!33439))

(declare-fun e!33441 () Bool)

(assert (=> start!8164 e!33441))

(assert (=> start!8164 true))

(assert (=> start!8164 e!33444))

(declare-fun mapIsEmpty!2309 () Bool)

(assert (=> mapIsEmpty!2309 mapRes!2310))

(declare-fun b!51557 () Bool)

(assert (=> b!51557 (= e!33435 tp_is_empty!2217)))

(declare-fun mapIsEmpty!2310 () Bool)

(assert (=> mapIsEmpty!2310 mapRes!2309))

(declare-fun b!51558 () Bool)

(assert (=> b!51558 (= e!33441 e!33436)))

(declare-fun b!51559 () Bool)

(assert (=> b!51559 (= e!33442 (and e!33440 mapRes!2309))))

(declare-fun condMapEmpty!2310 () Bool)

(declare-fun mapDefault!2309 () ValueCell!765)

(assert (=> b!51559 (= condMapEmpty!2310 (= (arr!1602 (_values!1916 (v!2196 (underlying!142 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!765)) mapDefault!2309)))))

(declare-fun b!51560 () Bool)

(declare-fun res!29475 () Bool)

(assert (=> b!51560 (=> (not res!29475) (not e!33439))))

(assert (=> b!51560 (= res!29475 (and (= (size!1829 (_values!1916 (v!2196 (underlying!142 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5742 (v!2196 (underlying!142 thiss!992))))) (= (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (size!1829 (_values!1916 (v!2196 (underlying!142 thiss!992))))) (bvsge (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1824 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1824 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000000011)))))

(assert (= (and start!8164 res!29472) b!51548))

(assert (= (and b!51548 res!29473) b!51553))

(assert (= (and b!51553 res!29474) b!51551))

(assert (= (and b!51551 res!29470) b!51555))

(assert (= (and b!51555 res!29471) b!51560))

(assert (= (and b!51560 res!29475) b!51546))

(assert (= (and b!51559 condMapEmpty!2310) mapIsEmpty!2310))

(assert (= (and b!51559 (not condMapEmpty!2310)) mapNonEmpty!2309))

(get-info :version)

(assert (= (and mapNonEmpty!2309 ((_ is ValueCellFull!765) mapValue!2309)) b!51545))

(assert (= (and b!51559 ((_ is ValueCellFull!765) mapDefault!2309)) b!51550))

(assert (= b!51549 b!51559))

(assert (= b!51554 b!51549))

(assert (= b!51558 b!51554))

(assert (= start!8164 b!51558))

(assert (= (and b!51547 condMapEmpty!2309) mapIsEmpty!2309))

(assert (= (and b!51547 (not condMapEmpty!2309)) mapNonEmpty!2310))

(assert (= (and mapNonEmpty!2310 ((_ is ValueCellFull!765) mapValue!2310)) b!51557))

(assert (= (and b!51547 ((_ is ValueCellFull!765) mapDefault!2310)) b!51552))

(assert (= b!51556 b!51547))

(assert (= start!8164 b!51556))

(declare-fun m!44357 () Bool)

(assert (=> start!8164 m!44357))

(declare-fun m!44359 () Bool)

(assert (=> b!51553 m!44359))

(declare-fun m!44361 () Bool)

(assert (=> mapNonEmpty!2309 m!44361))

(declare-fun m!44363 () Bool)

(assert (=> b!51555 m!44363))

(declare-fun m!44365 () Bool)

(assert (=> mapNonEmpty!2310 m!44365))

(declare-fun m!44367 () Bool)

(assert (=> b!51556 m!44367))

(declare-fun m!44369 () Bool)

(assert (=> b!51556 m!44369))

(declare-fun m!44371 () Bool)

(assert (=> b!51549 m!44371))

(declare-fun m!44373 () Bool)

(assert (=> b!51549 m!44373))

(declare-fun m!44375 () Bool)

(assert (=> b!51546 m!44375))

(check-sat b_and!2813 (not b_next!1601) (not b_next!1603) tp_is_empty!2217 (not b!51549) (not b!51555) (not mapNonEmpty!2310) (not start!8164) (not mapNonEmpty!2309) (not b!51546) (not b!51553) b_and!2811 (not b!51556))
(check-sat b_and!2811 b_and!2813 (not b_next!1601) (not b_next!1603))
(get-model)

(declare-fun d!10359 () Bool)

(assert (=> d!10359 (= (array_inv!983 (_keys!3549 newMap!16)) (bvsge (size!1828 (_keys!3549 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51556 d!10359))

(declare-fun d!10361 () Bool)

(assert (=> d!10361 (= (array_inv!984 (_values!1916 newMap!16)) (bvsge (size!1829 (_values!1916 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51556 d!10361))

(declare-fun d!10363 () Bool)

(declare-fun res!29500 () Bool)

(declare-fun e!33487 () Bool)

(assert (=> d!10363 (=> (not res!29500) (not e!33487))))

(declare-fun simpleValid!38 (LongMapFixedSize!438) Bool)

(assert (=> d!10363 (= res!29500 (simpleValid!38 newMap!16))))

(assert (=> d!10363 (= (valid!150 newMap!16) e!33487)))

(declare-fun b!51615 () Bool)

(declare-fun res!29501 () Bool)

(assert (=> b!51615 (=> (not res!29501) (not e!33487))))

(declare-fun arrayCountValidKeys!0 (array!3353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51615 (= res!29501 (= (arrayCountValidKeys!0 (_keys!3549 newMap!16) #b00000000000000000000000000000000 (size!1828 (_keys!3549 newMap!16))) (_size!268 newMap!16)))))

(declare-fun b!51616 () Bool)

(declare-fun res!29502 () Bool)

(assert (=> b!51616 (=> (not res!29502) (not e!33487))))

(assert (=> b!51616 (= res!29502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3549 newMap!16) (mask!5742 newMap!16)))))

(declare-fun b!51617 () Bool)

(declare-datatypes ((List!1333 0))(
  ( (Nil!1330) (Cons!1329 (h!1909 (_ BitVec 64)) (t!4367 List!1333)) )
))
(declare-fun arrayNoDuplicates!0 (array!3353 (_ BitVec 32) List!1333) Bool)

(assert (=> b!51617 (= e!33487 (arrayNoDuplicates!0 (_keys!3549 newMap!16) #b00000000000000000000000000000000 Nil!1330))))

(assert (= (and d!10363 res!29500) b!51615))

(assert (= (and b!51615 res!29501) b!51616))

(assert (= (and b!51616 res!29502) b!51617))

(declare-fun m!44397 () Bool)

(assert (=> d!10363 m!44397))

(declare-fun m!44399 () Bool)

(assert (=> b!51615 m!44399))

(declare-fun m!44401 () Bool)

(assert (=> b!51616 m!44401))

(declare-fun m!44403 () Bool)

(assert (=> b!51617 m!44403))

(assert (=> b!51553 d!10363))

(declare-fun d!10365 () Bool)

(assert (=> d!10365 (= (array_inv!983 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (bvsge (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51549 d!10365))

(declare-fun d!10367 () Bool)

(assert (=> d!10367 (= (array_inv!984 (_values!1916 (v!2196 (underlying!142 thiss!992)))) (bvsge (size!1829 (_values!1916 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51549 d!10367))

(declare-fun d!10369 () Bool)

(assert (=> d!10369 (= (validMask!0 (mask!5742 (v!2196 (underlying!142 thiss!992)))) (and (or (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000000111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000001111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000011111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000001111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000011111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000001111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000011111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000001111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000011111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000000111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000001111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000011111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000000111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000001111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000011111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000000111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000001111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000011111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000000111111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000001111111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000011111111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00000111111111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00001111111111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00011111111111111111111111111111) (= (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5742 (v!2196 (underlying!142 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51555 d!10369))

(declare-fun d!10371 () Bool)

(assert (=> d!10371 (= (valid!151 thiss!992) (valid!150 (v!2196 (underlying!142 thiss!992))))))

(declare-fun bs!2381 () Bool)

(assert (= bs!2381 d!10371))

(declare-fun m!44405 () Bool)

(assert (=> bs!2381 m!44405))

(assert (=> start!8164 d!10371))

(declare-fun b!51626 () Bool)

(declare-fun e!33495 () Bool)

(declare-fun call!3949 () Bool)

(assert (=> b!51626 (= e!33495 call!3949)))

(declare-fun b!51627 () Bool)

(declare-fun e!33496 () Bool)

(declare-fun e!33494 () Bool)

(assert (=> b!51627 (= e!33496 e!33494)))

(declare-fun c!6907 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51627 (= c!6907 (validKeyInArray!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3946 () Bool)

(assert (=> bm!3946 (= call!3949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun b!51628 () Bool)

(assert (=> b!51628 (= e!33494 e!33495)))

(declare-fun lt!21193 () (_ BitVec 64))

(assert (=> b!51628 (= lt!21193 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1427 0))(
  ( (Unit!1428) )
))
(declare-fun lt!21195 () Unit!1427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3353 (_ BitVec 64) (_ BitVec 32)) Unit!1427)

(assert (=> b!51628 (= lt!21195 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51628 (arrayContainsKey!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 #b00000000000000000000000000000000)))

(declare-fun lt!21194 () Unit!1427)

(assert (=> b!51628 (= lt!21194 lt!21195)))

(declare-fun res!29507 () Bool)

(declare-datatypes ((SeekEntryResult!223 0))(
  ( (MissingZero!223 (index!3014 (_ BitVec 32))) (Found!223 (index!3015 (_ BitVec 32))) (Intermediate!223 (undefined!1035 Bool) (index!3016 (_ BitVec 32)) (x!9389 (_ BitVec 32))) (Undefined!223) (MissingVacant!223 (index!3017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3353 (_ BitVec 32)) SeekEntryResult!223)

(assert (=> b!51628 (= res!29507 (= (seekEntryOrOpen!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))) (Found!223 #b00000000000000000000000000000000)))))

(assert (=> b!51628 (=> (not res!29507) (not e!33495))))

(declare-fun d!10373 () Bool)

(declare-fun res!29508 () Bool)

(assert (=> d!10373 (=> res!29508 e!33496)))

(assert (=> d!10373 (= res!29508 (bvsge #b00000000000000000000000000000000 (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))))))

(assert (=> d!10373 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))) e!33496)))

(declare-fun b!51629 () Bool)

(assert (=> b!51629 (= e!33494 call!3949)))

(assert (= (and d!10373 (not res!29508)) b!51627))

(assert (= (and b!51627 c!6907) b!51628))

(assert (= (and b!51627 (not c!6907)) b!51629))

(assert (= (and b!51628 res!29507) b!51626))

(assert (= (or b!51626 b!51629) bm!3946))

(declare-fun m!44407 () Bool)

(assert (=> b!51627 m!44407))

(assert (=> b!51627 m!44407))

(declare-fun m!44409 () Bool)

(assert (=> b!51627 m!44409))

(declare-fun m!44411 () Bool)

(assert (=> bm!3946 m!44411))

(assert (=> b!51628 m!44407))

(declare-fun m!44413 () Bool)

(assert (=> b!51628 m!44413))

(declare-fun m!44415 () Bool)

(assert (=> b!51628 m!44415))

(assert (=> b!51628 m!44407))

(declare-fun m!44417 () Bool)

(assert (=> b!51628 m!44417))

(assert (=> b!51546 d!10373))

(declare-fun b!51637 () Bool)

(declare-fun e!33502 () Bool)

(assert (=> b!51637 (= e!33502 tp_is_empty!2217)))

(declare-fun mapNonEmpty!2319 () Bool)

(declare-fun mapRes!2319 () Bool)

(declare-fun tp!6909 () Bool)

(declare-fun e!33501 () Bool)

(assert (=> mapNonEmpty!2319 (= mapRes!2319 (and tp!6909 e!33501))))

(declare-fun mapKey!2319 () (_ BitVec 32))

(declare-fun mapValue!2319 () ValueCell!765)

(declare-fun mapRest!2319 () (Array (_ BitVec 32) ValueCell!765))

(assert (=> mapNonEmpty!2319 (= mapRest!2309 (store mapRest!2319 mapKey!2319 mapValue!2319))))

(declare-fun b!51636 () Bool)

(assert (=> b!51636 (= e!33501 tp_is_empty!2217)))

(declare-fun mapIsEmpty!2319 () Bool)

(assert (=> mapIsEmpty!2319 mapRes!2319))

(declare-fun condMapEmpty!2319 () Bool)

(declare-fun mapDefault!2319 () ValueCell!765)

(assert (=> mapNonEmpty!2310 (= condMapEmpty!2319 (= mapRest!2309 ((as const (Array (_ BitVec 32) ValueCell!765)) mapDefault!2319)))))

(assert (=> mapNonEmpty!2310 (= tp!6891 (and e!33502 mapRes!2319))))

(assert (= (and mapNonEmpty!2310 condMapEmpty!2319) mapIsEmpty!2319))

(assert (= (and mapNonEmpty!2310 (not condMapEmpty!2319)) mapNonEmpty!2319))

(assert (= (and mapNonEmpty!2319 ((_ is ValueCellFull!765) mapValue!2319)) b!51636))

(assert (= (and mapNonEmpty!2310 ((_ is ValueCellFull!765) mapDefault!2319)) b!51637))

(declare-fun m!44419 () Bool)

(assert (=> mapNonEmpty!2319 m!44419))

(declare-fun b!51639 () Bool)

(declare-fun e!33504 () Bool)

(assert (=> b!51639 (= e!33504 tp_is_empty!2217)))

(declare-fun mapNonEmpty!2320 () Bool)

(declare-fun mapRes!2320 () Bool)

(declare-fun tp!6910 () Bool)

(declare-fun e!33503 () Bool)

(assert (=> mapNonEmpty!2320 (= mapRes!2320 (and tp!6910 e!33503))))

(declare-fun mapValue!2320 () ValueCell!765)

(declare-fun mapKey!2320 () (_ BitVec 32))

(declare-fun mapRest!2320 () (Array (_ BitVec 32) ValueCell!765))

(assert (=> mapNonEmpty!2320 (= mapRest!2310 (store mapRest!2320 mapKey!2320 mapValue!2320))))

(declare-fun b!51638 () Bool)

(assert (=> b!51638 (= e!33503 tp_is_empty!2217)))

(declare-fun mapIsEmpty!2320 () Bool)

(assert (=> mapIsEmpty!2320 mapRes!2320))

(declare-fun condMapEmpty!2320 () Bool)

(declare-fun mapDefault!2320 () ValueCell!765)

(assert (=> mapNonEmpty!2309 (= condMapEmpty!2320 (= mapRest!2310 ((as const (Array (_ BitVec 32) ValueCell!765)) mapDefault!2320)))))

(assert (=> mapNonEmpty!2309 (= tp!6892 (and e!33504 mapRes!2320))))

(assert (= (and mapNonEmpty!2309 condMapEmpty!2320) mapIsEmpty!2320))

(assert (= (and mapNonEmpty!2309 (not condMapEmpty!2320)) mapNonEmpty!2320))

(assert (= (and mapNonEmpty!2320 ((_ is ValueCellFull!765) mapValue!2320)) b!51638))

(assert (= (and mapNonEmpty!2309 ((_ is ValueCellFull!765) mapDefault!2320)) b!51639))

(declare-fun m!44421 () Bool)

(assert (=> mapNonEmpty!2320 m!44421))

(check-sat (not mapNonEmpty!2319) b_and!2813 (not b!51628) (not b_next!1601) (not b_next!1603) (not b!51627) (not b!51617) (not b!51615) (not d!10371) (not bm!3946) (not b!51616) (not mapNonEmpty!2320) tp_is_empty!2217 (not d!10363) b_and!2811)
(check-sat b_and!2811 b_and!2813 (not b_next!1601) (not b_next!1603))
(get-model)

(declare-fun b!51640 () Bool)

(declare-fun e!33506 () Bool)

(declare-fun call!3950 () Bool)

(assert (=> b!51640 (= e!33506 call!3950)))

(declare-fun b!51641 () Bool)

(declare-fun e!33507 () Bool)

(declare-fun e!33505 () Bool)

(assert (=> b!51641 (= e!33507 e!33505)))

(declare-fun c!6908 () Bool)

(assert (=> b!51641 (= c!6908 (validKeyInArray!0 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3947 () Bool)

(assert (=> bm!3947 (= call!3950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3549 newMap!16) (mask!5742 newMap!16)))))

(declare-fun b!51642 () Bool)

(assert (=> b!51642 (= e!33505 e!33506)))

(declare-fun lt!21196 () (_ BitVec 64))

(assert (=> b!51642 (= lt!21196 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!21198 () Unit!1427)

(assert (=> b!51642 (= lt!21198 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3549 newMap!16) lt!21196 #b00000000000000000000000000000000))))

(assert (=> b!51642 (arrayContainsKey!0 (_keys!3549 newMap!16) lt!21196 #b00000000000000000000000000000000)))

(declare-fun lt!21197 () Unit!1427)

(assert (=> b!51642 (= lt!21197 lt!21198)))

(declare-fun res!29509 () Bool)

(assert (=> b!51642 (= res!29509 (= (seekEntryOrOpen!0 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000) (_keys!3549 newMap!16) (mask!5742 newMap!16)) (Found!223 #b00000000000000000000000000000000)))))

(assert (=> b!51642 (=> (not res!29509) (not e!33506))))

(declare-fun d!10375 () Bool)

(declare-fun res!29510 () Bool)

(assert (=> d!10375 (=> res!29510 e!33507)))

(assert (=> d!10375 (= res!29510 (bvsge #b00000000000000000000000000000000 (size!1828 (_keys!3549 newMap!16))))))

(assert (=> d!10375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3549 newMap!16) (mask!5742 newMap!16)) e!33507)))

(declare-fun b!51643 () Bool)

(assert (=> b!51643 (= e!33505 call!3950)))

(assert (= (and d!10375 (not res!29510)) b!51641))

(assert (= (and b!51641 c!6908) b!51642))

(assert (= (and b!51641 (not c!6908)) b!51643))

(assert (= (and b!51642 res!29509) b!51640))

(assert (= (or b!51640 b!51643) bm!3947))

(declare-fun m!44423 () Bool)

(assert (=> b!51641 m!44423))

(assert (=> b!51641 m!44423))

(declare-fun m!44425 () Bool)

(assert (=> b!51641 m!44425))

(declare-fun m!44427 () Bool)

(assert (=> bm!3947 m!44427))

(assert (=> b!51642 m!44423))

(declare-fun m!44429 () Bool)

(assert (=> b!51642 m!44429))

(declare-fun m!44431 () Bool)

(assert (=> b!51642 m!44431))

(assert (=> b!51642 m!44423))

(declare-fun m!44433 () Bool)

(assert (=> b!51642 m!44433))

(assert (=> b!51616 d!10375))

(declare-fun d!10377 () Bool)

(assert (=> d!10377 (= (validKeyInArray!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51627 d!10377))

(declare-fun b!51644 () Bool)

(declare-fun e!33509 () Bool)

(declare-fun call!3951 () Bool)

(assert (=> b!51644 (= e!33509 call!3951)))

(declare-fun b!51645 () Bool)

(declare-fun e!33510 () Bool)

(declare-fun e!33508 () Bool)

(assert (=> b!51645 (= e!33510 e!33508)))

(declare-fun c!6909 () Bool)

(assert (=> b!51645 (= c!6909 (validKeyInArray!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3948 () Bool)

(assert (=> bm!3948 (= call!3951 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun b!51646 () Bool)

(assert (=> b!51646 (= e!33508 e!33509)))

(declare-fun lt!21199 () (_ BitVec 64))

(assert (=> b!51646 (= lt!21199 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21201 () Unit!1427)

(assert (=> b!51646 (= lt!21201 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21199 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51646 (arrayContainsKey!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21199 #b00000000000000000000000000000000)))

(declare-fun lt!21200 () Unit!1427)

(assert (=> b!51646 (= lt!21200 lt!21201)))

(declare-fun res!29511 () Bool)

(assert (=> b!51646 (= res!29511 (= (seekEntryOrOpen!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))) (Found!223 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51646 (=> (not res!29511) (not e!33509))))

(declare-fun d!10379 () Bool)

(declare-fun res!29512 () Bool)

(assert (=> d!10379 (=> res!29512 e!33510)))

(assert (=> d!10379 (= res!29512 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))))))

(assert (=> d!10379 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))) e!33510)))

(declare-fun b!51647 () Bool)

(assert (=> b!51647 (= e!33508 call!3951)))

(assert (= (and d!10379 (not res!29512)) b!51645))

(assert (= (and b!51645 c!6909) b!51646))

(assert (= (and b!51645 (not c!6909)) b!51647))

(assert (= (and b!51646 res!29511) b!51644))

(assert (= (or b!51644 b!51647) bm!3948))

(declare-fun m!44435 () Bool)

(assert (=> b!51645 m!44435))

(assert (=> b!51645 m!44435))

(declare-fun m!44437 () Bool)

(assert (=> b!51645 m!44437))

(declare-fun m!44439 () Bool)

(assert (=> bm!3948 m!44439))

(assert (=> b!51646 m!44435))

(declare-fun m!44441 () Bool)

(assert (=> b!51646 m!44441))

(declare-fun m!44443 () Bool)

(assert (=> b!51646 m!44443))

(assert (=> b!51646 m!44435))

(declare-fun m!44445 () Bool)

(assert (=> b!51646 m!44445))

(assert (=> bm!3946 d!10379))

(declare-fun d!10381 () Bool)

(declare-fun res!29519 () Bool)

(declare-fun e!33521 () Bool)

(assert (=> d!10381 (=> res!29519 e!33521)))

(assert (=> d!10381 (= res!29519 (bvsge #b00000000000000000000000000000000 (size!1828 (_keys!3549 newMap!16))))))

(assert (=> d!10381 (= (arrayNoDuplicates!0 (_keys!3549 newMap!16) #b00000000000000000000000000000000 Nil!1330) e!33521)))

(declare-fun b!51658 () Bool)

(declare-fun e!33519 () Bool)

(declare-fun e!33520 () Bool)

(assert (=> b!51658 (= e!33519 e!33520)))

(declare-fun c!6912 () Bool)

(assert (=> b!51658 (= c!6912 (validKeyInArray!0 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51659 () Bool)

(declare-fun call!3954 () Bool)

(assert (=> b!51659 (= e!33520 call!3954)))

(declare-fun bm!3951 () Bool)

(assert (=> bm!3951 (= call!3954 (arrayNoDuplicates!0 (_keys!3549 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6912 (Cons!1329 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000) Nil!1330) Nil!1330)))))

(declare-fun b!51660 () Bool)

(declare-fun e!33522 () Bool)

(declare-fun contains!623 (List!1333 (_ BitVec 64)) Bool)

(assert (=> b!51660 (= e!33522 (contains!623 Nil!1330 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51661 () Bool)

(assert (=> b!51661 (= e!33520 call!3954)))

(declare-fun b!51662 () Bool)

(assert (=> b!51662 (= e!33521 e!33519)))

(declare-fun res!29520 () Bool)

(assert (=> b!51662 (=> (not res!29520) (not e!33519))))

(assert (=> b!51662 (= res!29520 (not e!33522))))

(declare-fun res!29521 () Bool)

(assert (=> b!51662 (=> (not res!29521) (not e!33522))))

(assert (=> b!51662 (= res!29521 (validKeyInArray!0 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10381 (not res!29519)) b!51662))

(assert (= (and b!51662 res!29521) b!51660))

(assert (= (and b!51662 res!29520) b!51658))

(assert (= (and b!51658 c!6912) b!51661))

(assert (= (and b!51658 (not c!6912)) b!51659))

(assert (= (or b!51661 b!51659) bm!3951))

(assert (=> b!51658 m!44423))

(assert (=> b!51658 m!44423))

(assert (=> b!51658 m!44425))

(assert (=> bm!3951 m!44423))

(declare-fun m!44447 () Bool)

(assert (=> bm!3951 m!44447))

(assert (=> b!51660 m!44423))

(assert (=> b!51660 m!44423))

(declare-fun m!44449 () Bool)

(assert (=> b!51660 m!44449))

(assert (=> b!51662 m!44423))

(assert (=> b!51662 m!44423))

(assert (=> b!51662 m!44425))

(assert (=> b!51617 d!10381))

(declare-fun d!10383 () Bool)

(assert (=> d!10383 (arrayContainsKey!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 #b00000000000000000000000000000000)))

(declare-fun lt!21204 () Unit!1427)

(declare-fun choose!13 (array!3353 (_ BitVec 64) (_ BitVec 32)) Unit!1427)

(assert (=> d!10383 (= lt!21204 (choose!13 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 #b00000000000000000000000000000000))))

(assert (=> d!10383 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10383 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 #b00000000000000000000000000000000) lt!21204)))

(declare-fun bs!2382 () Bool)

(assert (= bs!2382 d!10383))

(assert (=> bs!2382 m!44415))

(declare-fun m!44451 () Bool)

(assert (=> bs!2382 m!44451))

(assert (=> b!51628 d!10383))

(declare-fun d!10385 () Bool)

(declare-fun res!29526 () Bool)

(declare-fun e!33527 () Bool)

(assert (=> d!10385 (=> res!29526 e!33527)))

(assert (=> d!10385 (= res!29526 (= (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) lt!21193))))

(assert (=> d!10385 (= (arrayContainsKey!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 #b00000000000000000000000000000000) e!33527)))

(declare-fun b!51667 () Bool)

(declare-fun e!33528 () Bool)

(assert (=> b!51667 (= e!33527 e!33528)))

(declare-fun res!29527 () Bool)

(assert (=> b!51667 (=> (not res!29527) (not e!33528))))

(assert (=> b!51667 (= res!29527 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))))))

(declare-fun b!51668 () Bool)

(assert (=> b!51668 (= e!33528 (arrayContainsKey!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) lt!21193 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10385 (not res!29526)) b!51667))

(assert (= (and b!51667 res!29527) b!51668))

(assert (=> d!10385 m!44407))

(declare-fun m!44453 () Bool)

(assert (=> b!51668 m!44453))

(assert (=> b!51628 d!10385))

(declare-fun b!51681 () Bool)

(declare-fun e!33535 () SeekEntryResult!223)

(declare-fun lt!21212 () SeekEntryResult!223)

(assert (=> b!51681 (= e!33535 (MissingZero!223 (index!3016 lt!21212)))))

(declare-fun b!51682 () Bool)

(declare-fun e!33537 () SeekEntryResult!223)

(declare-fun e!33536 () SeekEntryResult!223)

(assert (=> b!51682 (= e!33537 e!33536)))

(declare-fun lt!21213 () (_ BitVec 64))

(assert (=> b!51682 (= lt!21213 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (index!3016 lt!21212)))))

(declare-fun c!6920 () Bool)

(assert (=> b!51682 (= c!6920 (= lt!21213 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51683 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3353 (_ BitVec 32)) SeekEntryResult!223)

(assert (=> b!51683 (= e!33535 (seekKeyOrZeroReturnVacant!0 (x!9389 lt!21212) (index!3016 lt!21212) (index!3016 lt!21212) (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun b!51684 () Bool)

(assert (=> b!51684 (= e!33536 (Found!223 (index!3016 lt!21212)))))

(declare-fun d!10387 () Bool)

(declare-fun lt!21211 () SeekEntryResult!223)

(assert (=> d!10387 (and (or ((_ is Undefined!223) lt!21211) (not ((_ is Found!223) lt!21211)) (and (bvsge (index!3015 lt!21211) #b00000000000000000000000000000000) (bvslt (index!3015 lt!21211) (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))))) (or ((_ is Undefined!223) lt!21211) ((_ is Found!223) lt!21211) (not ((_ is MissingZero!223) lt!21211)) (and (bvsge (index!3014 lt!21211) #b00000000000000000000000000000000) (bvslt (index!3014 lt!21211) (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))))) (or ((_ is Undefined!223) lt!21211) ((_ is Found!223) lt!21211) ((_ is MissingZero!223) lt!21211) (not ((_ is MissingVacant!223) lt!21211)) (and (bvsge (index!3017 lt!21211) #b00000000000000000000000000000000) (bvslt (index!3017 lt!21211) (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))))) (or ((_ is Undefined!223) lt!21211) (ite ((_ is Found!223) lt!21211) (= (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (index!3015 lt!21211)) (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!223) lt!21211) (= (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (index!3014 lt!21211)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!223) lt!21211) (= (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) (index!3017 lt!21211)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10387 (= lt!21211 e!33537)))

(declare-fun c!6921 () Bool)

(assert (=> d!10387 (= c!6921 (and ((_ is Intermediate!223) lt!21212) (undefined!1035 lt!21212)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3353 (_ BitVec 32)) SeekEntryResult!223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10387 (= lt!21212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) (mask!5742 (v!2196 (underlying!142 thiss!992)))) (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))))))

(assert (=> d!10387 (validMask!0 (mask!5742 (v!2196 (underlying!142 thiss!992))))))

(assert (=> d!10387 (= (seekEntryOrOpen!0 (select (arr!1601 (_keys!3549 (v!2196 (underlying!142 thiss!992)))) #b00000000000000000000000000000000) (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))) lt!21211)))

(declare-fun b!51685 () Bool)

(assert (=> b!51685 (= e!33537 Undefined!223)))

(declare-fun b!51686 () Bool)

(declare-fun c!6919 () Bool)

(assert (=> b!51686 (= c!6919 (= lt!21213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51686 (= e!33536 e!33535)))

(assert (= (and d!10387 c!6921) b!51685))

(assert (= (and d!10387 (not c!6921)) b!51682))

(assert (= (and b!51682 c!6920) b!51684))

(assert (= (and b!51682 (not c!6920)) b!51686))

(assert (= (and b!51686 c!6919) b!51681))

(assert (= (and b!51686 (not c!6919)) b!51683))

(declare-fun m!44455 () Bool)

(assert (=> b!51682 m!44455))

(assert (=> b!51683 m!44407))

(declare-fun m!44457 () Bool)

(assert (=> b!51683 m!44457))

(declare-fun m!44459 () Bool)

(assert (=> d!10387 m!44459))

(declare-fun m!44461 () Bool)

(assert (=> d!10387 m!44461))

(assert (=> d!10387 m!44407))

(declare-fun m!44463 () Bool)

(assert (=> d!10387 m!44463))

(declare-fun m!44465 () Bool)

(assert (=> d!10387 m!44465))

(assert (=> d!10387 m!44363))

(assert (=> d!10387 m!44463))

(assert (=> d!10387 m!44407))

(declare-fun m!44467 () Bool)

(assert (=> d!10387 m!44467))

(assert (=> b!51628 d!10387))

(declare-fun d!10389 () Bool)

(declare-fun res!29528 () Bool)

(declare-fun e!33538 () Bool)

(assert (=> d!10389 (=> (not res!29528) (not e!33538))))

(assert (=> d!10389 (= res!29528 (simpleValid!38 (v!2196 (underlying!142 thiss!992))))))

(assert (=> d!10389 (= (valid!150 (v!2196 (underlying!142 thiss!992))) e!33538)))

(declare-fun b!51687 () Bool)

(declare-fun res!29529 () Bool)

(assert (=> b!51687 (=> (not res!29529) (not e!33538))))

(assert (=> b!51687 (= res!29529 (= (arrayCountValidKeys!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000000000 (size!1828 (_keys!3549 (v!2196 (underlying!142 thiss!992))))) (_size!268 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun b!51688 () Bool)

(declare-fun res!29530 () Bool)

(assert (=> b!51688 (=> (not res!29530) (not e!33538))))

(assert (=> b!51688 (= res!29530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3549 (v!2196 (underlying!142 thiss!992))) (mask!5742 (v!2196 (underlying!142 thiss!992)))))))

(declare-fun b!51689 () Bool)

(assert (=> b!51689 (= e!33538 (arrayNoDuplicates!0 (_keys!3549 (v!2196 (underlying!142 thiss!992))) #b00000000000000000000000000000000 Nil!1330))))

(assert (= (and d!10389 res!29528) b!51687))

(assert (= (and b!51687 res!29529) b!51688))

(assert (= (and b!51688 res!29530) b!51689))

(declare-fun m!44469 () Bool)

(assert (=> d!10389 m!44469))

(declare-fun m!44471 () Bool)

(assert (=> b!51687 m!44471))

(assert (=> b!51688 m!44375))

(declare-fun m!44473 () Bool)

(assert (=> b!51689 m!44473))

(assert (=> d!10371 d!10389))

(declare-fun b!51698 () Bool)

(declare-fun e!33544 () (_ BitVec 32))

(declare-fun e!33543 () (_ BitVec 32))

(assert (=> b!51698 (= e!33544 e!33543)))

(declare-fun c!6927 () Bool)

(assert (=> b!51698 (= c!6927 (validKeyInArray!0 (select (arr!1601 (_keys!3549 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51699 () Bool)

(declare-fun call!3957 () (_ BitVec 32))

(assert (=> b!51699 (= e!33543 (bvadd #b00000000000000000000000000000001 call!3957))))

(declare-fun d!10391 () Bool)

(declare-fun lt!21216 () (_ BitVec 32))

(assert (=> d!10391 (and (bvsge lt!21216 #b00000000000000000000000000000000) (bvsle lt!21216 (bvsub (size!1828 (_keys!3549 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10391 (= lt!21216 e!33544)))

(declare-fun c!6926 () Bool)

(assert (=> d!10391 (= c!6926 (bvsge #b00000000000000000000000000000000 (size!1828 (_keys!3549 newMap!16))))))

(assert (=> d!10391 (and (bvsle #b00000000000000000000000000000000 (size!1828 (_keys!3549 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1828 (_keys!3549 newMap!16)) (size!1828 (_keys!3549 newMap!16))))))

(assert (=> d!10391 (= (arrayCountValidKeys!0 (_keys!3549 newMap!16) #b00000000000000000000000000000000 (size!1828 (_keys!3549 newMap!16))) lt!21216)))

(declare-fun bm!3954 () Bool)

(assert (=> bm!3954 (= call!3957 (arrayCountValidKeys!0 (_keys!3549 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1828 (_keys!3549 newMap!16))))))

(declare-fun b!51700 () Bool)

(assert (=> b!51700 (= e!33543 call!3957)))

(declare-fun b!51701 () Bool)

(assert (=> b!51701 (= e!33544 #b00000000000000000000000000000000)))

(assert (= (and d!10391 c!6926) b!51701))

(assert (= (and d!10391 (not c!6926)) b!51698))

(assert (= (and b!51698 c!6927) b!51699))

(assert (= (and b!51698 (not c!6927)) b!51700))

(assert (= (or b!51699 b!51700) bm!3954))

(assert (=> b!51698 m!44423))

(assert (=> b!51698 m!44423))

(assert (=> b!51698 m!44425))

(declare-fun m!44475 () Bool)

(assert (=> bm!3954 m!44475))

(assert (=> b!51615 d!10391))

(declare-fun d!10393 () Bool)

(declare-fun res!29541 () Bool)

(declare-fun e!33547 () Bool)

(assert (=> d!10393 (=> (not res!29541) (not e!33547))))

(assert (=> d!10393 (= res!29541 (validMask!0 (mask!5742 newMap!16)))))

(assert (=> d!10393 (= (simpleValid!38 newMap!16) e!33547)))

(declare-fun b!51711 () Bool)

(declare-fun res!29542 () Bool)

(assert (=> b!51711 (=> (not res!29542) (not e!33547))))

(declare-fun size!1832 (LongMapFixedSize!438) (_ BitVec 32))

(assert (=> b!51711 (= res!29542 (bvsge (size!1832 newMap!16) (_size!268 newMap!16)))))

(declare-fun b!51710 () Bool)

(declare-fun res!29539 () Bool)

(assert (=> b!51710 (=> (not res!29539) (not e!33547))))

(assert (=> b!51710 (= res!29539 (and (= (size!1829 (_values!1916 newMap!16)) (bvadd (mask!5742 newMap!16) #b00000000000000000000000000000001)) (= (size!1828 (_keys!3549 newMap!16)) (size!1829 (_values!1916 newMap!16))) (bvsge (_size!268 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!268 newMap!16) (bvadd (mask!5742 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!51713 () Bool)

(assert (=> b!51713 (= e!33547 (and (bvsge (extraKeys!1824 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1824 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!268 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51712 () Bool)

(declare-fun res!29540 () Bool)

(assert (=> b!51712 (=> (not res!29540) (not e!33547))))

(assert (=> b!51712 (= res!29540 (= (size!1832 newMap!16) (bvadd (_size!268 newMap!16) (bvsdiv (bvadd (extraKeys!1824 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10393 res!29541) b!51710))

(assert (= (and b!51710 res!29539) b!51711))

(assert (= (and b!51711 res!29542) b!51712))

(assert (= (and b!51712 res!29540) b!51713))

(declare-fun m!44477 () Bool)

(assert (=> d!10393 m!44477))

(declare-fun m!44479 () Bool)

(assert (=> b!51711 m!44479))

(assert (=> b!51712 m!44479))

(assert (=> d!10363 d!10393))

(declare-fun b!51715 () Bool)

(declare-fun e!33549 () Bool)

(assert (=> b!51715 (= e!33549 tp_is_empty!2217)))

(declare-fun mapNonEmpty!2321 () Bool)

(declare-fun mapRes!2321 () Bool)

(declare-fun tp!6911 () Bool)

(declare-fun e!33548 () Bool)

(assert (=> mapNonEmpty!2321 (= mapRes!2321 (and tp!6911 e!33548))))

(declare-fun mapValue!2321 () ValueCell!765)

(declare-fun mapRest!2321 () (Array (_ BitVec 32) ValueCell!765))

(declare-fun mapKey!2321 () (_ BitVec 32))

(assert (=> mapNonEmpty!2321 (= mapRest!2319 (store mapRest!2321 mapKey!2321 mapValue!2321))))

(declare-fun b!51714 () Bool)

(assert (=> b!51714 (= e!33548 tp_is_empty!2217)))

(declare-fun mapIsEmpty!2321 () Bool)

(assert (=> mapIsEmpty!2321 mapRes!2321))

(declare-fun condMapEmpty!2321 () Bool)

(declare-fun mapDefault!2321 () ValueCell!765)

(assert (=> mapNonEmpty!2319 (= condMapEmpty!2321 (= mapRest!2319 ((as const (Array (_ BitVec 32) ValueCell!765)) mapDefault!2321)))))

(assert (=> mapNonEmpty!2319 (= tp!6909 (and e!33549 mapRes!2321))))

(assert (= (and mapNonEmpty!2319 condMapEmpty!2321) mapIsEmpty!2321))

(assert (= (and mapNonEmpty!2319 (not condMapEmpty!2321)) mapNonEmpty!2321))

(assert (= (and mapNonEmpty!2321 ((_ is ValueCellFull!765) mapValue!2321)) b!51714))

(assert (= (and mapNonEmpty!2319 ((_ is ValueCellFull!765) mapDefault!2321)) b!51715))

(declare-fun m!44481 () Bool)

(assert (=> mapNonEmpty!2321 m!44481))

(declare-fun b!51717 () Bool)

(declare-fun e!33551 () Bool)

(assert (=> b!51717 (= e!33551 tp_is_empty!2217)))

(declare-fun mapNonEmpty!2322 () Bool)

(declare-fun mapRes!2322 () Bool)

(declare-fun tp!6912 () Bool)

(declare-fun e!33550 () Bool)

(assert (=> mapNonEmpty!2322 (= mapRes!2322 (and tp!6912 e!33550))))

(declare-fun mapValue!2322 () ValueCell!765)

(declare-fun mapRest!2322 () (Array (_ BitVec 32) ValueCell!765))

(declare-fun mapKey!2322 () (_ BitVec 32))

(assert (=> mapNonEmpty!2322 (= mapRest!2320 (store mapRest!2322 mapKey!2322 mapValue!2322))))

(declare-fun b!51716 () Bool)

(assert (=> b!51716 (= e!33550 tp_is_empty!2217)))

(declare-fun mapIsEmpty!2322 () Bool)

(assert (=> mapIsEmpty!2322 mapRes!2322))

(declare-fun condMapEmpty!2322 () Bool)

(declare-fun mapDefault!2322 () ValueCell!765)

(assert (=> mapNonEmpty!2320 (= condMapEmpty!2322 (= mapRest!2320 ((as const (Array (_ BitVec 32) ValueCell!765)) mapDefault!2322)))))

(assert (=> mapNonEmpty!2320 (= tp!6910 (and e!33551 mapRes!2322))))

(assert (= (and mapNonEmpty!2320 condMapEmpty!2322) mapIsEmpty!2322))

(assert (= (and mapNonEmpty!2320 (not condMapEmpty!2322)) mapNonEmpty!2322))

(assert (= (and mapNonEmpty!2322 ((_ is ValueCellFull!765) mapValue!2322)) b!51716))

(assert (= (and mapNonEmpty!2320 ((_ is ValueCellFull!765) mapDefault!2322)) b!51717))

(declare-fun m!44483 () Bool)

(assert (=> mapNonEmpty!2322 m!44483))

(check-sat (not bm!3948) (not mapNonEmpty!2321) (not b!51658) (not b_next!1603) (not bm!3954) (not b!51641) (not b!51711) (not d!10383) (not d!10387) (not b!51683) (not d!10393) b_and!2813 (not b!51688) (not b_next!1601) (not b!51660) (not mapNonEmpty!2322) tp_is_empty!2217 (not b!51645) (not b!51712) (not b!51642) (not b!51687) (not b!51662) (not bm!3947) (not b!51668) (not bm!3951) (not b!51646) (not b!51689) (not b!51698) b_and!2811 (not d!10389))
(check-sat b_and!2811 b_and!2813 (not b_next!1601) (not b_next!1603))
