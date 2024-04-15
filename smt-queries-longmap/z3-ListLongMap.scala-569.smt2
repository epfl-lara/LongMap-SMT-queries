; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15484 () Bool)

(assert start!15484)

(declare-fun b!153851 () Bool)

(declare-fun b_free!3217 () Bool)

(declare-fun b_next!3217 () Bool)

(assert (=> b!153851 (= b_free!3217 (not b_next!3217))))

(declare-fun tp!12171 () Bool)

(declare-fun b_and!9561 () Bool)

(assert (=> b!153851 (= tp!12171 b_and!9561)))

(declare-fun b!153854 () Bool)

(declare-fun b_free!3219 () Bool)

(declare-fun b_next!3219 () Bool)

(assert (=> b!153854 (= b_free!3219 (not b_next!3219))))

(declare-fun tp!12173 () Bool)

(declare-fun b_and!9563 () Bool)

(assert (=> b!153854 (= tp!12173 b_and!9563)))

(declare-fun b!153842 () Bool)

(declare-fun e!100502 () Bool)

(declare-datatypes ((V!3681 0))(
  ( (V!3682 (val!1557 Int)) )
))
(declare-datatypes ((tuple2!2800 0))(
  ( (tuple2!2801 (_1!1411 (_ BitVec 64)) (_2!1411 V!3681)) )
))
(declare-datatypes ((List!1807 0))(
  ( (Nil!1804) (Cons!1803 (h!2412 tuple2!2800) (t!6592 List!1807)) )
))
(declare-datatypes ((ListLongMap!1787 0))(
  ( (ListLongMap!1788 (toList!909 List!1807)) )
))
(declare-fun lt!80663 () ListLongMap!1787)

(declare-datatypes ((array!5081 0))(
  ( (array!5082 (arr!2398 (Array (_ BitVec 32) (_ BitVec 64))) (size!2676 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1169 0))(
  ( (ValueCellFull!1169 (v!3410 V!3681)) (EmptyCell!1169) )
))
(declare-datatypes ((array!5083 0))(
  ( (array!5084 (arr!2399 (Array (_ BitVec 32) ValueCell!1169)) (size!2677 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1246 0))(
  ( (LongMapFixedSize!1247 (defaultEntry!3063 Int) (mask!7466 (_ BitVec 32)) (extraKeys!2804 (_ BitVec 32)) (zeroValue!2906 V!3681) (minValue!2906 V!3681) (_size!672 (_ BitVec 32)) (_keys!4835 array!5081) (_values!3046 array!5083) (_vacant!672 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1020 0))(
  ( (Cell!1021 (v!3411 LongMapFixedSize!1246)) )
))
(declare-datatypes ((LongMap!1020 0))(
  ( (LongMap!1021 (underlying!521 Cell!1020)) )
))
(declare-fun thiss!992 () LongMap!1020)

(declare-fun map!1485 (LongMapFixedSize!1246) ListLongMap!1787)

(assert (=> b!153842 (= e!100502 (not (= lt!80663 (map!1485 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!153843 () Bool)

(declare-fun e!100509 () Bool)

(declare-fun tp_is_empty!3025 () Bool)

(assert (=> b!153843 (= e!100509 tp_is_empty!3025)))

(declare-fun b!153844 () Bool)

(declare-fun e!100501 () Bool)

(assert (=> b!153844 (= e!100501 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5165 () Bool)

(declare-fun mapRes!5166 () Bool)

(assert (=> mapIsEmpty!5165 mapRes!5166))

(declare-fun b!153845 () Bool)

(declare-fun e!100508 () Bool)

(assert (=> b!153845 (= e!100508 tp_is_empty!3025)))

(declare-fun b!153846 () Bool)

(declare-fun e!100499 () Bool)

(assert (=> b!153846 (= e!100499 tp_is_empty!3025)))

(declare-fun b!153847 () Bool)

(declare-fun res!72641 () Bool)

(declare-fun e!100500 () Bool)

(assert (=> b!153847 (=> (not res!72641) (not e!100500))))

(declare-fun newMap!16 () LongMapFixedSize!1246)

(assert (=> b!153847 (= res!72641 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7466 newMap!16)) (_size!672 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!153848 () Bool)

(declare-fun e!100510 () Bool)

(declare-fun e!100512 () Bool)

(assert (=> b!153848 (= e!100510 e!100512)))

(declare-fun res!72639 () Bool)

(assert (=> start!15484 (=> (not res!72639) (not e!100500))))

(declare-fun valid!623 (LongMap!1020) Bool)

(assert (=> start!15484 (= res!72639 (valid!623 thiss!992))))

(assert (=> start!15484 e!100500))

(assert (=> start!15484 e!100510))

(assert (=> start!15484 true))

(declare-fun e!100505 () Bool)

(assert (=> start!15484 e!100505))

(declare-fun b!153849 () Bool)

(declare-fun e!100506 () Bool)

(declare-fun mapRes!5165 () Bool)

(assert (=> b!153849 (= e!100506 (and e!100508 mapRes!5165))))

(declare-fun condMapEmpty!5165 () Bool)

(declare-fun mapDefault!5165 () ValueCell!1169)

(assert (=> b!153849 (= condMapEmpty!5165 (= (arr!2399 (_values!3046 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5165)))))

(declare-fun b!153850 () Bool)

(assert (=> b!153850 (= e!100500 e!100502)))

(declare-fun res!72642 () Bool)

(assert (=> b!153850 (=> (not res!72642) (not e!100502))))

(declare-fun lt!80662 () ListLongMap!1787)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!153850 (= res!72642 (and (= lt!80662 lt!80663) (or (= (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(assert (=> b!153850 (= lt!80663 (map!1485 newMap!16))))

(declare-fun getCurrentListMap!560 (array!5081 array!5083 (_ BitVec 32) (_ BitVec 32) V!3681 V!3681 (_ BitVec 32) Int) ListLongMap!1787)

(assert (=> b!153850 (= lt!80662 (getCurrentListMap!560 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun e!100511 () Bool)

(declare-fun e!100507 () Bool)

(declare-fun array_inv!1535 (array!5081) Bool)

(declare-fun array_inv!1536 (array!5083) Bool)

(assert (=> b!153851 (= e!100507 (and tp!12171 tp_is_empty!3025 (array_inv!1535 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (array_inv!1536 (_values!3046 (v!3411 (underlying!521 thiss!992)))) e!100511))))

(declare-fun mapNonEmpty!5165 () Bool)

(declare-fun tp!12172 () Bool)

(assert (=> mapNonEmpty!5165 (= mapRes!5165 (and tp!12172 e!100501))))

(declare-fun mapValue!5166 () ValueCell!1169)

(declare-fun mapKey!5165 () (_ BitVec 32))

(declare-fun mapRest!5165 () (Array (_ BitVec 32) ValueCell!1169))

(assert (=> mapNonEmpty!5165 (= (arr!2399 (_values!3046 newMap!16)) (store mapRest!5165 mapKey!5165 mapValue!5166))))

(declare-fun b!153852 () Bool)

(assert (=> b!153852 (= e!100512 e!100507)))

(declare-fun b!153853 () Bool)

(declare-fun res!72640 () Bool)

(assert (=> b!153853 (=> (not res!72640) (not e!100500))))

(declare-fun valid!624 (LongMapFixedSize!1246) Bool)

(assert (=> b!153853 (= res!72640 (valid!624 newMap!16))))

(assert (=> b!153854 (= e!100505 (and tp!12173 tp_is_empty!3025 (array_inv!1535 (_keys!4835 newMap!16)) (array_inv!1536 (_values!3046 newMap!16)) e!100506))))

(declare-fun b!153855 () Bool)

(assert (=> b!153855 (= e!100511 (and e!100509 mapRes!5166))))

(declare-fun condMapEmpty!5166 () Bool)

(declare-fun mapDefault!5166 () ValueCell!1169)

(assert (=> b!153855 (= condMapEmpty!5166 (= (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5166)))))

(declare-fun mapIsEmpty!5166 () Bool)

(assert (=> mapIsEmpty!5166 mapRes!5165))

(declare-fun b!153856 () Bool)

(declare-fun res!72643 () Bool)

(assert (=> b!153856 (=> (not res!72643) (not e!100500))))

(assert (=> b!153856 (= res!72643 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun mapNonEmpty!5166 () Bool)

(declare-fun tp!12174 () Bool)

(assert (=> mapNonEmpty!5166 (= mapRes!5166 (and tp!12174 e!100499))))

(declare-fun mapRest!5166 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapValue!5165 () ValueCell!1169)

(declare-fun mapKey!5166 () (_ BitVec 32))

(assert (=> mapNonEmpty!5166 (= (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (store mapRest!5166 mapKey!5166 mapValue!5165))))

(assert (= (and start!15484 res!72639) b!153856))

(assert (= (and b!153856 res!72643) b!153853))

(assert (= (and b!153853 res!72640) b!153847))

(assert (= (and b!153847 res!72641) b!153850))

(assert (= (and b!153850 res!72642) b!153842))

(assert (= (and b!153855 condMapEmpty!5166) mapIsEmpty!5165))

(assert (= (and b!153855 (not condMapEmpty!5166)) mapNonEmpty!5166))

(get-info :version)

(assert (= (and mapNonEmpty!5166 ((_ is ValueCellFull!1169) mapValue!5165)) b!153846))

(assert (= (and b!153855 ((_ is ValueCellFull!1169) mapDefault!5166)) b!153843))

(assert (= b!153851 b!153855))

(assert (= b!153852 b!153851))

(assert (= b!153848 b!153852))

(assert (= start!15484 b!153848))

(assert (= (and b!153849 condMapEmpty!5165) mapIsEmpty!5166))

(assert (= (and b!153849 (not condMapEmpty!5165)) mapNonEmpty!5165))

(assert (= (and mapNonEmpty!5165 ((_ is ValueCellFull!1169) mapValue!5166)) b!153844))

(assert (= (and b!153849 ((_ is ValueCellFull!1169) mapDefault!5165)) b!153845))

(assert (= b!153854 b!153849))

(assert (= start!15484 b!153854))

(declare-fun m!187135 () Bool)

(assert (=> mapNonEmpty!5166 m!187135))

(declare-fun m!187137 () Bool)

(assert (=> b!153854 m!187137))

(declare-fun m!187139 () Bool)

(assert (=> b!153854 m!187139))

(declare-fun m!187141 () Bool)

(assert (=> b!153842 m!187141))

(declare-fun m!187143 () Bool)

(assert (=> b!153850 m!187143))

(declare-fun m!187145 () Bool)

(assert (=> b!153850 m!187145))

(declare-fun m!187147 () Bool)

(assert (=> b!153850 m!187147))

(declare-fun m!187149 () Bool)

(assert (=> b!153851 m!187149))

(declare-fun m!187151 () Bool)

(assert (=> b!153851 m!187151))

(declare-fun m!187153 () Bool)

(assert (=> start!15484 m!187153))

(declare-fun m!187155 () Bool)

(assert (=> mapNonEmpty!5165 m!187155))

(declare-fun m!187157 () Bool)

(assert (=> b!153853 m!187157))

(check-sat (not b!153854) (not mapNonEmpty!5166) b_and!9561 (not start!15484) (not b_next!3219) (not mapNonEmpty!5165) (not b!153851) (not b!153850) (not b!153853) (not b_next!3217) tp_is_empty!3025 (not b!153842) b_and!9563)
(check-sat b_and!9561 b_and!9563 (not b_next!3217) (not b_next!3219))
(get-model)

(declare-fun d!50431 () Bool)

(assert (=> d!50431 (= (map!1485 (v!3411 (underlying!521 thiss!992))) (getCurrentListMap!560 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun bs!6489 () Bool)

(assert (= bs!6489 d!50431))

(declare-fun m!187207 () Bool)

(assert (=> bs!6489 m!187207))

(assert (=> b!153842 d!50431))

(declare-fun d!50433 () Bool)

(assert (=> d!50433 (= (array_inv!1535 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvsge (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153851 d!50433))

(declare-fun d!50435 () Bool)

(assert (=> d!50435 (= (array_inv!1536 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvsge (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153851 d!50435))

(declare-fun d!50437 () Bool)

(assert (=> d!50437 (= (valid!623 thiss!992) (valid!624 (v!3411 (underlying!521 thiss!992))))))

(declare-fun bs!6490 () Bool)

(assert (= bs!6490 d!50437))

(declare-fun m!187209 () Bool)

(assert (=> bs!6490 m!187209))

(assert (=> start!15484 d!50437))

(declare-fun d!50439 () Bool)

(declare-fun res!72680 () Bool)

(declare-fun e!100599 () Bool)

(assert (=> d!50439 (=> (not res!72680) (not e!100599))))

(declare-fun simpleValid!104 (LongMapFixedSize!1246) Bool)

(assert (=> d!50439 (= res!72680 (simpleValid!104 newMap!16))))

(assert (=> d!50439 (= (valid!624 newMap!16) e!100599)))

(declare-fun b!153953 () Bool)

(declare-fun res!72681 () Bool)

(assert (=> b!153953 (=> (not res!72681) (not e!100599))))

(declare-fun arrayCountValidKeys!0 (array!5081 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!153953 (= res!72681 (= (arrayCountValidKeys!0 (_keys!4835 newMap!16) #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))) (_size!672 newMap!16)))))

(declare-fun b!153954 () Bool)

(declare-fun res!72682 () Bool)

(assert (=> b!153954 (=> (not res!72682) (not e!100599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5081 (_ BitVec 32)) Bool)

(assert (=> b!153954 (= res!72682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4835 newMap!16) (mask!7466 newMap!16)))))

(declare-fun b!153955 () Bool)

(declare-datatypes ((List!1810 0))(
  ( (Nil!1807) (Cons!1806 (h!2415 (_ BitVec 64)) (t!6599 List!1810)) )
))
(declare-fun arrayNoDuplicates!0 (array!5081 (_ BitVec 32) List!1810) Bool)

(assert (=> b!153955 (= e!100599 (arrayNoDuplicates!0 (_keys!4835 newMap!16) #b00000000000000000000000000000000 Nil!1807))))

(assert (= (and d!50439 res!72680) b!153953))

(assert (= (and b!153953 res!72681) b!153954))

(assert (= (and b!153954 res!72682) b!153955))

(declare-fun m!187211 () Bool)

(assert (=> d!50439 m!187211))

(declare-fun m!187213 () Bool)

(assert (=> b!153953 m!187213))

(declare-fun m!187215 () Bool)

(assert (=> b!153954 m!187215))

(declare-fun m!187217 () Bool)

(assert (=> b!153955 m!187217))

(assert (=> b!153853 d!50439))

(declare-fun d!50441 () Bool)

(assert (=> d!50441 (= (map!1485 newMap!16) (getCurrentListMap!560 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun bs!6491 () Bool)

(assert (= bs!6491 d!50441))

(declare-fun m!187219 () Bool)

(assert (=> bs!6491 m!187219))

(assert (=> b!153850 d!50441))

(declare-fun b!153998 () Bool)

(declare-fun e!100628 () Bool)

(declare-fun e!100637 () Bool)

(assert (=> b!153998 (= e!100628 e!100637)))

(declare-fun res!72707 () Bool)

(assert (=> b!153998 (=> (not res!72707) (not e!100637))))

(declare-fun lt!80722 () ListLongMap!1787)

(declare-fun contains!953 (ListLongMap!1787 (_ BitVec 64)) Bool)

(assert (=> b!153998 (= res!72707 (contains!953 lt!80722 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!153998 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun bm!17123 () Bool)

(declare-fun call!17126 () Bool)

(assert (=> bm!17123 (= call!17126 (contains!953 lt!80722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!153999 () Bool)

(declare-fun e!100634 () ListLongMap!1787)

(declare-fun e!100631 () ListLongMap!1787)

(assert (=> b!153999 (= e!100634 e!100631)))

(declare-fun c!29484 () Bool)

(assert (=> b!153999 (= c!29484 (and (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154000 () Bool)

(declare-fun e!100635 () Bool)

(declare-fun call!17131 () Bool)

(assert (=> b!154000 (= e!100635 (not call!17131))))

(declare-fun call!17130 () ListLongMap!1787)

(declare-fun c!29483 () Bool)

(declare-fun call!17132 () ListLongMap!1787)

(declare-fun bm!17124 () Bool)

(declare-fun call!17127 () ListLongMap!1787)

(declare-fun call!17128 () ListLongMap!1787)

(declare-fun +!181 (ListLongMap!1787 tuple2!2800) ListLongMap!1787)

(assert (=> bm!17124 (= call!17130 (+!181 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154001 () Bool)

(declare-fun e!100630 () Bool)

(declare-fun e!100626 () Bool)

(assert (=> b!154001 (= e!100630 e!100626)))

(declare-fun c!29488 () Bool)

(assert (=> b!154001 (= c!29488 (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154002 () Bool)

(declare-fun e!100633 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!154002 (= e!100633 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154003 () Bool)

(declare-fun e!100638 () ListLongMap!1787)

(assert (=> b!154003 (= e!100638 call!17127)))

(declare-fun b!154004 () Bool)

(declare-fun e!100629 () Bool)

(declare-fun apply!128 (ListLongMap!1787 (_ BitVec 64)) V!3681)

(assert (=> b!154004 (= e!100629 (= (apply!128 lt!80722 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154005 () Bool)

(declare-datatypes ((Unit!4887 0))(
  ( (Unit!4888) )
))
(declare-fun e!100636 () Unit!4887)

(declare-fun lt!80737 () Unit!4887)

(assert (=> b!154005 (= e!100636 lt!80737)))

(declare-fun lt!80720 () ListLongMap!1787)

(declare-fun getCurrentListMapNoExtraKeys!149 (array!5081 array!5083 (_ BitVec 32) (_ BitVec 32) V!3681 V!3681 (_ BitVec 32) Int) ListLongMap!1787)

(assert (=> b!154005 (= lt!80720 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80740 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80740 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80736 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80736 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80726 () Unit!4887)

(declare-fun addStillContains!104 (ListLongMap!1787 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4887)

(assert (=> b!154005 (= lt!80726 (addStillContains!104 lt!80720 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80736))))

(assert (=> b!154005 (contains!953 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80736)))

(declare-fun lt!80731 () Unit!4887)

(assert (=> b!154005 (= lt!80731 lt!80726)))

(declare-fun lt!80724 () ListLongMap!1787)

(assert (=> b!154005 (= lt!80724 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80725 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80725 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80730 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80730 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80741 () Unit!4887)

(declare-fun addApplyDifferent!104 (ListLongMap!1787 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4887)

(assert (=> b!154005 (= lt!80741 (addApplyDifferent!104 lt!80724 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80730))))

(assert (=> b!154005 (= (apply!128 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80730) (apply!128 lt!80724 lt!80730))))

(declare-fun lt!80729 () Unit!4887)

(assert (=> b!154005 (= lt!80729 lt!80741)))

(declare-fun lt!80739 () ListLongMap!1787)

(assert (=> b!154005 (= lt!80739 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80735 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80735 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80728 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80728 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80727 () Unit!4887)

(assert (=> b!154005 (= lt!80727 (addApplyDifferent!104 lt!80739 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80728))))

(assert (=> b!154005 (= (apply!128 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80728) (apply!128 lt!80739 lt!80728))))

(declare-fun lt!80723 () Unit!4887)

(assert (=> b!154005 (= lt!80723 lt!80727)))

(declare-fun lt!80734 () ListLongMap!1787)

(assert (=> b!154005 (= lt!80734 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80733 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80733 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80738 () (_ BitVec 64))

(assert (=> b!154005 (= lt!80738 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!154005 (= lt!80737 (addApplyDifferent!104 lt!80734 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80738))))

(assert (=> b!154005 (= (apply!128 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80738) (apply!128 lt!80734 lt!80738))))

(declare-fun b!154006 () Bool)

(declare-fun get!1602 (ValueCell!1169 V!3681) V!3681)

(declare-fun dynLambda!462 (Int (_ BitVec 64)) V!3681)

(assert (=> b!154006 (= e!100637 (= (apply!128 lt!80722 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154006 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154006 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154007 () Bool)

(declare-fun res!72706 () Bool)

(assert (=> b!154007 (=> (not res!72706) (not e!100630))))

(assert (=> b!154007 (= res!72706 e!100635)))

(declare-fun c!29487 () Bool)

(assert (=> b!154007 (= c!29487 (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154008 () Bool)

(assert (=> b!154008 (= e!100634 (+!181 call!17130 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154009 () Bool)

(declare-fun res!72703 () Bool)

(assert (=> b!154009 (=> (not res!72703) (not e!100630))))

(assert (=> b!154009 (= res!72703 e!100628)))

(declare-fun res!72709 () Bool)

(assert (=> b!154009 (=> res!72709 e!100628)))

(declare-fun e!100627 () Bool)

(assert (=> b!154009 (= res!72709 (not e!100627))))

(declare-fun res!72702 () Bool)

(assert (=> b!154009 (=> (not res!72702) (not e!100627))))

(assert (=> b!154009 (= res!72702 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun bm!17125 () Bool)

(assert (=> bm!17125 (= call!17127 call!17132)))

(declare-fun b!154010 () Bool)

(assert (=> b!154010 (= e!100635 e!100629)))

(declare-fun res!72708 () Bool)

(assert (=> b!154010 (= res!72708 call!17131)))

(assert (=> b!154010 (=> (not res!72708) (not e!100629))))

(declare-fun b!154011 () Bool)

(declare-fun e!100632 () Bool)

(assert (=> b!154011 (= e!100626 e!100632)))

(declare-fun res!72705 () Bool)

(assert (=> b!154011 (= res!72705 call!17126)))

(assert (=> b!154011 (=> (not res!72705) (not e!100632))))

(declare-fun b!154012 () Bool)

(declare-fun call!17129 () ListLongMap!1787)

(assert (=> b!154012 (= e!100631 call!17129)))

(declare-fun b!154013 () Bool)

(assert (=> b!154013 (= e!100627 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!17126 () Bool)

(assert (=> bm!17126 (= call!17129 call!17130)))

(declare-fun b!154014 () Bool)

(assert (=> b!154014 (= e!100638 call!17129)))

(declare-fun b!154015 () Bool)

(assert (=> b!154015 (= e!100632 (= (apply!128 lt!80722 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun bm!17127 () Bool)

(assert (=> bm!17127 (= call!17131 (contains!953 lt!80722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154016 () Bool)

(declare-fun Unit!4889 () Unit!4887)

(assert (=> b!154016 (= e!100636 Unit!4889)))

(declare-fun b!154017 () Bool)

(declare-fun c!29485 () Bool)

(assert (=> b!154017 (= c!29485 (and (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154017 (= e!100631 e!100638)))

(declare-fun bm!17128 () Bool)

(assert (=> bm!17128 (= call!17132 call!17128)))

(declare-fun d!50443 () Bool)

(assert (=> d!50443 e!100630))

(declare-fun res!72701 () Bool)

(assert (=> d!50443 (=> (not res!72701) (not e!100630))))

(assert (=> d!50443 (= res!72701 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun lt!80721 () ListLongMap!1787)

(assert (=> d!50443 (= lt!80722 lt!80721)))

(declare-fun lt!80732 () Unit!4887)

(assert (=> d!50443 (= lt!80732 e!100636)))

(declare-fun c!29486 () Bool)

(assert (=> d!50443 (= c!29486 e!100633)))

(declare-fun res!72704 () Bool)

(assert (=> d!50443 (=> (not res!72704) (not e!100633))))

(assert (=> d!50443 (= res!72704 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50443 (= lt!80721 e!100634)))

(assert (=> d!50443 (= c!29483 (and (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!50443 (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992))))))

(assert (=> d!50443 (= (getCurrentListMap!560 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) lt!80722)))

(declare-fun b!154018 () Bool)

(assert (=> b!154018 (= e!100626 (not call!17126))))

(declare-fun bm!17129 () Bool)

(assert (=> bm!17129 (= call!17128 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(assert (= (and d!50443 c!29483) b!154008))

(assert (= (and d!50443 (not c!29483)) b!153999))

(assert (= (and b!153999 c!29484) b!154012))

(assert (= (and b!153999 (not c!29484)) b!154017))

(assert (= (and b!154017 c!29485) b!154014))

(assert (= (and b!154017 (not c!29485)) b!154003))

(assert (= (or b!154014 b!154003) bm!17125))

(assert (= (or b!154012 bm!17125) bm!17128))

(assert (= (or b!154012 b!154014) bm!17126))

(assert (= (or b!154008 bm!17128) bm!17129))

(assert (= (or b!154008 bm!17126) bm!17124))

(assert (= (and d!50443 res!72704) b!154002))

(assert (= (and d!50443 c!29486) b!154005))

(assert (= (and d!50443 (not c!29486)) b!154016))

(assert (= (and d!50443 res!72701) b!154009))

(assert (= (and b!154009 res!72702) b!154013))

(assert (= (and b!154009 (not res!72709)) b!153998))

(assert (= (and b!153998 res!72707) b!154006))

(assert (= (and b!154009 res!72703) b!154007))

(assert (= (and b!154007 c!29487) b!154010))

(assert (= (and b!154007 (not c!29487)) b!154000))

(assert (= (and b!154010 res!72708) b!154004))

(assert (= (or b!154010 b!154000) bm!17127))

(assert (= (and b!154007 res!72706) b!154001))

(assert (= (and b!154001 c!29488) b!154011))

(assert (= (and b!154001 (not c!29488)) b!154018))

(assert (= (and b!154011 res!72705) b!154015))

(assert (= (or b!154011 b!154018) bm!17123))

(declare-fun b_lambda!6825 () Bool)

(assert (=> (not b_lambda!6825) (not b!154006)))

(declare-fun t!6596 () Bool)

(declare-fun tb!2749 () Bool)

(assert (=> (and b!153851 (= (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) t!6596) tb!2749))

(declare-fun result!4481 () Bool)

(assert (=> tb!2749 (= result!4481 tp_is_empty!3025)))

(assert (=> b!154006 t!6596))

(declare-fun b_and!9573 () Bool)

(assert (= b_and!9561 (and (=> t!6596 result!4481) b_and!9573)))

(declare-fun tb!2751 () Bool)

(declare-fun t!6598 () Bool)

(assert (=> (and b!153854 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) t!6598) tb!2751))

(declare-fun result!4485 () Bool)

(assert (= result!4485 result!4481))

(assert (=> b!154006 t!6598))

(declare-fun b_and!9575 () Bool)

(assert (= b_and!9563 (and (=> t!6598 result!4485) b_and!9575)))

(declare-fun m!187221 () Bool)

(assert (=> b!154004 m!187221))

(declare-fun m!187223 () Bool)

(assert (=> b!154008 m!187223))

(declare-fun m!187225 () Bool)

(assert (=> b!154013 m!187225))

(assert (=> b!154013 m!187225))

(declare-fun m!187227 () Bool)

(assert (=> b!154013 m!187227))

(assert (=> b!154002 m!187225))

(assert (=> b!154002 m!187225))

(assert (=> b!154002 m!187227))

(declare-fun m!187229 () Bool)

(assert (=> bm!17129 m!187229))

(declare-fun m!187231 () Bool)

(assert (=> bm!17123 m!187231))

(declare-fun m!187233 () Bool)

(assert (=> b!154006 m!187233))

(assert (=> b!154006 m!187225))

(declare-fun m!187235 () Bool)

(assert (=> b!154006 m!187235))

(assert (=> b!154006 m!187233))

(declare-fun m!187237 () Bool)

(assert (=> b!154006 m!187237))

(assert (=> b!154006 m!187225))

(declare-fun m!187239 () Bool)

(assert (=> b!154006 m!187239))

(assert (=> b!154006 m!187235))

(declare-fun m!187241 () Bool)

(assert (=> b!154005 m!187241))

(declare-fun m!187243 () Bool)

(assert (=> b!154005 m!187243))

(declare-fun m!187245 () Bool)

(assert (=> b!154005 m!187245))

(assert (=> b!154005 m!187243))

(declare-fun m!187247 () Bool)

(assert (=> b!154005 m!187247))

(declare-fun m!187249 () Bool)

(assert (=> b!154005 m!187249))

(declare-fun m!187251 () Bool)

(assert (=> b!154005 m!187251))

(assert (=> b!154005 m!187225))

(declare-fun m!187253 () Bool)

(assert (=> b!154005 m!187253))

(declare-fun m!187255 () Bool)

(assert (=> b!154005 m!187255))

(declare-fun m!187257 () Bool)

(assert (=> b!154005 m!187257))

(assert (=> b!154005 m!187253))

(declare-fun m!187259 () Bool)

(assert (=> b!154005 m!187259))

(declare-fun m!187261 () Bool)

(assert (=> b!154005 m!187261))

(declare-fun m!187263 () Bool)

(assert (=> b!154005 m!187263))

(assert (=> b!154005 m!187249))

(assert (=> b!154005 m!187255))

(declare-fun m!187265 () Bool)

(assert (=> b!154005 m!187265))

(declare-fun m!187267 () Bool)

(assert (=> b!154005 m!187267))

(declare-fun m!187269 () Bool)

(assert (=> b!154005 m!187269))

(assert (=> b!154005 m!187229))

(declare-fun m!187271 () Bool)

(assert (=> b!154015 m!187271))

(declare-fun m!187273 () Bool)

(assert (=> bm!17127 m!187273))

(declare-fun m!187275 () Bool)

(assert (=> bm!17124 m!187275))

(declare-fun m!187277 () Bool)

(assert (=> d!50443 m!187277))

(assert (=> b!153998 m!187225))

(assert (=> b!153998 m!187225))

(declare-fun m!187279 () Bool)

(assert (=> b!153998 m!187279))

(assert (=> b!153850 d!50443))

(declare-fun d!50445 () Bool)

(assert (=> d!50445 (= (array_inv!1535 (_keys!4835 newMap!16)) (bvsge (size!2676 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153854 d!50445))

(declare-fun d!50447 () Bool)

(assert (=> d!50447 (= (array_inv!1536 (_values!3046 newMap!16)) (bvsge (size!2677 (_values!3046 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153854 d!50447))

(declare-fun b!154027 () Bool)

(declare-fun e!100644 () Bool)

(assert (=> b!154027 (= e!100644 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5181 () Bool)

(declare-fun mapRes!5181 () Bool)

(assert (=> mapIsEmpty!5181 mapRes!5181))

(declare-fun condMapEmpty!5181 () Bool)

(declare-fun mapDefault!5181 () ValueCell!1169)

(assert (=> mapNonEmpty!5165 (= condMapEmpty!5181 (= mapRest!5165 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5181)))))

(declare-fun e!100643 () Bool)

(assert (=> mapNonEmpty!5165 (= tp!12172 (and e!100643 mapRes!5181))))

(declare-fun mapNonEmpty!5181 () Bool)

(declare-fun tp!12201 () Bool)

(assert (=> mapNonEmpty!5181 (= mapRes!5181 (and tp!12201 e!100644))))

(declare-fun mapValue!5181 () ValueCell!1169)

(declare-fun mapRest!5181 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapKey!5181 () (_ BitVec 32))

(assert (=> mapNonEmpty!5181 (= mapRest!5165 (store mapRest!5181 mapKey!5181 mapValue!5181))))

(declare-fun b!154028 () Bool)

(assert (=> b!154028 (= e!100643 tp_is_empty!3025)))

(assert (= (and mapNonEmpty!5165 condMapEmpty!5181) mapIsEmpty!5181))

(assert (= (and mapNonEmpty!5165 (not condMapEmpty!5181)) mapNonEmpty!5181))

(assert (= (and mapNonEmpty!5181 ((_ is ValueCellFull!1169) mapValue!5181)) b!154027))

(assert (= (and mapNonEmpty!5165 ((_ is ValueCellFull!1169) mapDefault!5181)) b!154028))

(declare-fun m!187281 () Bool)

(assert (=> mapNonEmpty!5181 m!187281))

(declare-fun b!154029 () Bool)

(declare-fun e!100646 () Bool)

(assert (=> b!154029 (= e!100646 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5182 () Bool)

(declare-fun mapRes!5182 () Bool)

(assert (=> mapIsEmpty!5182 mapRes!5182))

(declare-fun condMapEmpty!5182 () Bool)

(declare-fun mapDefault!5182 () ValueCell!1169)

(assert (=> mapNonEmpty!5166 (= condMapEmpty!5182 (= mapRest!5166 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5182)))))

(declare-fun e!100645 () Bool)

(assert (=> mapNonEmpty!5166 (= tp!12174 (and e!100645 mapRes!5182))))

(declare-fun mapNonEmpty!5182 () Bool)

(declare-fun tp!12202 () Bool)

(assert (=> mapNonEmpty!5182 (= mapRes!5182 (and tp!12202 e!100646))))

(declare-fun mapKey!5182 () (_ BitVec 32))

(declare-fun mapValue!5182 () ValueCell!1169)

(declare-fun mapRest!5182 () (Array (_ BitVec 32) ValueCell!1169))

(assert (=> mapNonEmpty!5182 (= mapRest!5166 (store mapRest!5182 mapKey!5182 mapValue!5182))))

(declare-fun b!154030 () Bool)

(assert (=> b!154030 (= e!100645 tp_is_empty!3025)))

(assert (= (and mapNonEmpty!5166 condMapEmpty!5182) mapIsEmpty!5182))

(assert (= (and mapNonEmpty!5166 (not condMapEmpty!5182)) mapNonEmpty!5182))

(assert (= (and mapNonEmpty!5182 ((_ is ValueCellFull!1169) mapValue!5182)) b!154029))

(assert (= (and mapNonEmpty!5166 ((_ is ValueCellFull!1169) mapDefault!5182)) b!154030))

(declare-fun m!187283 () Bool)

(assert (=> mapNonEmpty!5182 m!187283))

(declare-fun b_lambda!6827 () Bool)

(assert (= b_lambda!6825 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6827)))

(check-sat b_and!9573 (not b!154002) (not bm!17127) (not b!154013) (not b_lambda!6827) (not b!154006) (not b!153955) (not bm!17124) (not b!154005) (not b!153953) (not d!50443) (not mapNonEmpty!5182) (not b_next!3217) tp_is_empty!3025 (not d!50439) (not d!50437) (not bm!17129) (not bm!17123) (not b!154004) (not b_next!3219) (not d!50441) (not d!50431) (not b!154015) (not mapNonEmpty!5181) (not b!153954) b_and!9575 (not b!153998) (not b!154008))
(check-sat b_and!9573 b_and!9575 (not b_next!3217) (not b_next!3219))
(get-model)

(declare-fun d!50449 () Bool)

(assert (=> d!50449 (= (apply!128 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80730) (apply!128 lt!80724 lt!80730))))

(declare-fun lt!80744 () Unit!4887)

(declare-fun choose!924 (ListLongMap!1787 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4887)

(assert (=> d!50449 (= lt!80744 (choose!924 lt!80724 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80730))))

(declare-fun e!100649 () Bool)

(assert (=> d!50449 e!100649))

(declare-fun res!72712 () Bool)

(assert (=> d!50449 (=> (not res!72712) (not e!100649))))

(assert (=> d!50449 (= res!72712 (contains!953 lt!80724 lt!80730))))

(assert (=> d!50449 (= (addApplyDifferent!104 lt!80724 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80730) lt!80744)))

(declare-fun b!154034 () Bool)

(assert (=> b!154034 (= e!100649 (not (= lt!80730 lt!80725)))))

(assert (= (and d!50449 res!72712) b!154034))

(assert (=> d!50449 m!187253))

(assert (=> d!50449 m!187265))

(declare-fun m!187285 () Bool)

(assert (=> d!50449 m!187285))

(declare-fun m!187287 () Bool)

(assert (=> d!50449 m!187287))

(assert (=> d!50449 m!187253))

(assert (=> d!50449 m!187259))

(assert (=> b!154005 d!50449))

(declare-fun b!154059 () Bool)

(declare-fun e!100669 () Bool)

(declare-fun e!100664 () Bool)

(assert (=> b!154059 (= e!100669 e!100664)))

(declare-fun c!29497 () Bool)

(declare-fun e!100666 () Bool)

(assert (=> b!154059 (= c!29497 e!100666)))

(declare-fun res!72721 () Bool)

(assert (=> b!154059 (=> (not res!72721) (not e!100666))))

(assert (=> b!154059 (= res!72721 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154060 () Bool)

(declare-fun e!100665 () Bool)

(assert (=> b!154060 (= e!100664 e!100665)))

(assert (=> b!154060 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun lt!80764 () ListLongMap!1787)

(declare-fun res!72724 () Bool)

(assert (=> b!154060 (= res!72724 (contains!953 lt!80764 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154060 (=> (not res!72724) (not e!100665))))

(declare-fun b!154061 () Bool)

(declare-fun e!100667 () ListLongMap!1787)

(declare-fun call!17135 () ListLongMap!1787)

(assert (=> b!154061 (= e!100667 call!17135)))

(declare-fun b!154062 () Bool)

(declare-fun e!100670 () Bool)

(declare-fun isEmpty!434 (ListLongMap!1787) Bool)

(assert (=> b!154062 (= e!100670 (isEmpty!434 lt!80764))))

(declare-fun b!154063 () Bool)

(assert (=> b!154063 (= e!100666 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154063 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!154064 () Bool)

(assert (=> b!154064 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154064 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154064 (= e!100665 (= (apply!128 lt!80764 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154065 () Bool)

(declare-fun res!72722 () Bool)

(assert (=> b!154065 (=> (not res!72722) (not e!100669))))

(assert (=> b!154065 (= res!72722 (not (contains!953 lt!80764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154066 () Bool)

(declare-fun e!100668 () ListLongMap!1787)

(assert (=> b!154066 (= e!100668 e!100667)))

(declare-fun c!29499 () Bool)

(assert (=> b!154066 (= c!29499 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!50451 () Bool)

(assert (=> d!50451 e!100669))

(declare-fun res!72723 () Bool)

(assert (=> d!50451 (=> (not res!72723) (not e!100669))))

(assert (=> d!50451 (= res!72723 (not (contains!953 lt!80764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50451 (= lt!80764 e!100668)))

(declare-fun c!29498 () Bool)

(assert (=> d!50451 (= c!29498 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50451 (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992))))))

(assert (=> d!50451 (= (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) lt!80764)))

(declare-fun b!154067 () Bool)

(assert (=> b!154067 (= e!100664 e!100670)))

(declare-fun c!29500 () Bool)

(assert (=> b!154067 (= c!29500 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154068 () Bool)

(declare-fun lt!80761 () Unit!4887)

(declare-fun lt!80763 () Unit!4887)

(assert (=> b!154068 (= lt!80761 lt!80763)))

(declare-fun lt!80762 () V!3681)

(declare-fun lt!80760 () ListLongMap!1787)

(declare-fun lt!80759 () (_ BitVec 64))

(declare-fun lt!80765 () (_ BitVec 64))

(assert (=> b!154068 (not (contains!953 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762)) lt!80759))))

(declare-fun addStillNotContains!71 (ListLongMap!1787 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4887)

(assert (=> b!154068 (= lt!80763 (addStillNotContains!71 lt!80760 lt!80765 lt!80762 lt!80759))))

(assert (=> b!154068 (= lt!80759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154068 (= lt!80762 (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154068 (= lt!80765 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!154068 (= lt!80760 call!17135)))

(assert (=> b!154068 (= e!100667 (+!181 call!17135 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!17132 () Bool)

(assert (=> bm!17132 (= call!17135 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154069 () Bool)

(assert (=> b!154069 (= e!100668 (ListLongMap!1788 Nil!1804))))

(declare-fun b!154070 () Bool)

(assert (=> b!154070 (= e!100670 (= lt!80764 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50451 c!29498) b!154069))

(assert (= (and d!50451 (not c!29498)) b!154066))

(assert (= (and b!154066 c!29499) b!154068))

(assert (= (and b!154066 (not c!29499)) b!154061))

(assert (= (or b!154068 b!154061) bm!17132))

(assert (= (and d!50451 res!72723) b!154065))

(assert (= (and b!154065 res!72722) b!154059))

(assert (= (and b!154059 res!72721) b!154063))

(assert (= (and b!154059 c!29497) b!154060))

(assert (= (and b!154059 (not c!29497)) b!154067))

(assert (= (and b!154060 res!72724) b!154064))

(assert (= (and b!154067 c!29500) b!154070))

(assert (= (and b!154067 (not c!29500)) b!154062))

(declare-fun b_lambda!6829 () Bool)

(assert (=> (not b_lambda!6829) (not b!154064)))

(assert (=> b!154064 t!6596))

(declare-fun b_and!9577 () Bool)

(assert (= b_and!9573 (and (=> t!6596 result!4481) b_and!9577)))

(assert (=> b!154064 t!6598))

(declare-fun b_and!9579 () Bool)

(assert (= b_and!9575 (and (=> t!6598 result!4485) b_and!9579)))

(declare-fun b_lambda!6831 () Bool)

(assert (=> (not b_lambda!6831) (not b!154068)))

(assert (=> b!154068 t!6596))

(declare-fun b_and!9581 () Bool)

(assert (= b_and!9577 (and (=> t!6596 result!4481) b_and!9581)))

(assert (=> b!154068 t!6598))

(declare-fun b_and!9583 () Bool)

(assert (= b_and!9579 (and (=> t!6598 result!4485) b_and!9583)))

(declare-fun m!187289 () Bool)

(assert (=> bm!17132 m!187289))

(assert (=> b!154068 m!187225))

(assert (=> b!154068 m!187235))

(assert (=> b!154068 m!187233))

(assert (=> b!154068 m!187237))

(declare-fun m!187291 () Bool)

(assert (=> b!154068 m!187291))

(declare-fun m!187293 () Bool)

(assert (=> b!154068 m!187293))

(declare-fun m!187295 () Bool)

(assert (=> b!154068 m!187295))

(assert (=> b!154068 m!187293))

(assert (=> b!154068 m!187233))

(declare-fun m!187297 () Bool)

(assert (=> b!154068 m!187297))

(assert (=> b!154068 m!187235))

(declare-fun m!187299 () Bool)

(assert (=> b!154065 m!187299))

(assert (=> b!154060 m!187225))

(assert (=> b!154060 m!187225))

(declare-fun m!187301 () Bool)

(assert (=> b!154060 m!187301))

(assert (=> b!154066 m!187225))

(assert (=> b!154066 m!187225))

(assert (=> b!154066 m!187227))

(assert (=> b!154064 m!187225))

(assert (=> b!154064 m!187235))

(assert (=> b!154064 m!187233))

(assert (=> b!154064 m!187237))

(assert (=> b!154064 m!187233))

(assert (=> b!154064 m!187235))

(assert (=> b!154064 m!187225))

(declare-fun m!187303 () Bool)

(assert (=> b!154064 m!187303))

(declare-fun m!187305 () Bool)

(assert (=> b!154062 m!187305))

(declare-fun m!187307 () Bool)

(assert (=> d!50451 m!187307))

(assert (=> d!50451 m!187277))

(assert (=> b!154070 m!187289))

(assert (=> b!154063 m!187225))

(assert (=> b!154063 m!187225))

(assert (=> b!154063 m!187227))

(assert (=> b!154005 d!50451))

(declare-fun d!50453 () Bool)

(declare-fun e!100673 () Bool)

(assert (=> d!50453 e!100673))

(declare-fun res!72730 () Bool)

(assert (=> d!50453 (=> (not res!72730) (not e!100673))))

(declare-fun lt!80775 () ListLongMap!1787)

(assert (=> d!50453 (= res!72730 (contains!953 lt!80775 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80777 () List!1807)

(assert (=> d!50453 (= lt!80775 (ListLongMap!1788 lt!80777))))

(declare-fun lt!80776 () Unit!4887)

(declare-fun lt!80774 () Unit!4887)

(assert (=> d!50453 (= lt!80776 lt!80774)))

(declare-datatypes ((Option!187 0))(
  ( (Some!186 (v!3416 V!3681)) (None!185) )
))
(declare-fun getValueByKey!181 (List!1807 (_ BitVec 64)) Option!187)

(assert (=> d!50453 (= (getValueByKey!181 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!97 (List!1807 (_ BitVec 64) V!3681) Unit!4887)

(assert (=> d!50453 (= lt!80774 (lemmaContainsTupThenGetReturnValue!97 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun insertStrictlySorted!100 (List!1807 (_ BitVec 64) V!3681) List!1807)

(assert (=> d!50453 (= lt!80777 (insertStrictlySorted!100 (toList!909 lt!80720) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50453 (= (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80775)))

(declare-fun b!154075 () Bool)

(declare-fun res!72729 () Bool)

(assert (=> b!154075 (=> (not res!72729) (not e!100673))))

(assert (=> b!154075 (= res!72729 (= (getValueByKey!181 (toList!909 lt!80775) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154076 () Bool)

(declare-fun contains!954 (List!1807 tuple2!2800) Bool)

(assert (=> b!154076 (= e!100673 (contains!954 (toList!909 lt!80775) (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50453 res!72730) b!154075))

(assert (= (and b!154075 res!72729) b!154076))

(declare-fun m!187309 () Bool)

(assert (=> d!50453 m!187309))

(declare-fun m!187311 () Bool)

(assert (=> d!50453 m!187311))

(declare-fun m!187313 () Bool)

(assert (=> d!50453 m!187313))

(declare-fun m!187315 () Bool)

(assert (=> d!50453 m!187315))

(declare-fun m!187317 () Bool)

(assert (=> b!154075 m!187317))

(declare-fun m!187319 () Bool)

(assert (=> b!154076 m!187319))

(assert (=> b!154005 d!50453))

(declare-fun d!50455 () Bool)

(assert (=> d!50455 (contains!953 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80736)))

(declare-fun lt!80780 () Unit!4887)

(declare-fun choose!925 (ListLongMap!1787 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4887)

(assert (=> d!50455 (= lt!80780 (choose!925 lt!80720 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80736))))

(assert (=> d!50455 (contains!953 lt!80720 lt!80736)))

(assert (=> d!50455 (= (addStillContains!104 lt!80720 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80736) lt!80780)))

(declare-fun bs!6492 () Bool)

(assert (= bs!6492 d!50455))

(assert (=> bs!6492 m!187255))

(assert (=> bs!6492 m!187255))

(assert (=> bs!6492 m!187257))

(declare-fun m!187321 () Bool)

(assert (=> bs!6492 m!187321))

(declare-fun m!187323 () Bool)

(assert (=> bs!6492 m!187323))

(assert (=> b!154005 d!50455))

(declare-fun d!50457 () Bool)

(declare-fun get!1603 (Option!187) V!3681)

(assert (=> d!50457 (= (apply!128 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80738) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80738)))))

(declare-fun bs!6493 () Bool)

(assert (= bs!6493 d!50457))

(declare-fun m!187325 () Bool)

(assert (=> bs!6493 m!187325))

(assert (=> bs!6493 m!187325))

(declare-fun m!187327 () Bool)

(assert (=> bs!6493 m!187327))

(assert (=> b!154005 d!50457))

(declare-fun d!50459 () Bool)

(assert (=> d!50459 (= (apply!128 lt!80734 lt!80738) (get!1603 (getValueByKey!181 (toList!909 lt!80734) lt!80738)))))

(declare-fun bs!6494 () Bool)

(assert (= bs!6494 d!50459))

(declare-fun m!187329 () Bool)

(assert (=> bs!6494 m!187329))

(assert (=> bs!6494 m!187329))

(declare-fun m!187331 () Bool)

(assert (=> bs!6494 m!187331))

(assert (=> b!154005 d!50459))

(declare-fun d!50461 () Bool)

(declare-fun e!100674 () Bool)

(assert (=> d!50461 e!100674))

(declare-fun res!72732 () Bool)

(assert (=> d!50461 (=> (not res!72732) (not e!100674))))

(declare-fun lt!80782 () ListLongMap!1787)

(assert (=> d!50461 (= res!72732 (contains!953 lt!80782 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80784 () List!1807)

(assert (=> d!50461 (= lt!80782 (ListLongMap!1788 lt!80784))))

(declare-fun lt!80783 () Unit!4887)

(declare-fun lt!80781 () Unit!4887)

(assert (=> d!50461 (= lt!80783 lt!80781)))

(assert (=> d!50461 (= (getValueByKey!181 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50461 (= lt!80781 (lemmaContainsTupThenGetReturnValue!97 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50461 (= lt!80784 (insertStrictlySorted!100 (toList!909 lt!80739) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50461 (= (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80782)))

(declare-fun b!154078 () Bool)

(declare-fun res!72731 () Bool)

(assert (=> b!154078 (=> (not res!72731) (not e!100674))))

(assert (=> b!154078 (= res!72731 (= (getValueByKey!181 (toList!909 lt!80782) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154079 () Bool)

(assert (=> b!154079 (= e!100674 (contains!954 (toList!909 lt!80782) (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50461 res!72732) b!154078))

(assert (= (and b!154078 res!72731) b!154079))

(declare-fun m!187333 () Bool)

(assert (=> d!50461 m!187333))

(declare-fun m!187335 () Bool)

(assert (=> d!50461 m!187335))

(declare-fun m!187337 () Bool)

(assert (=> d!50461 m!187337))

(declare-fun m!187339 () Bool)

(assert (=> d!50461 m!187339))

(declare-fun m!187341 () Bool)

(assert (=> b!154078 m!187341))

(declare-fun m!187343 () Bool)

(assert (=> b!154079 m!187343))

(assert (=> b!154005 d!50461))

(declare-fun d!50463 () Bool)

(assert (=> d!50463 (= (apply!128 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80728) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80728)))))

(declare-fun bs!6495 () Bool)

(assert (= bs!6495 d!50463))

(declare-fun m!187345 () Bool)

(assert (=> bs!6495 m!187345))

(assert (=> bs!6495 m!187345))

(declare-fun m!187347 () Bool)

(assert (=> bs!6495 m!187347))

(assert (=> b!154005 d!50463))

(declare-fun d!50465 () Bool)

(declare-fun e!100675 () Bool)

(assert (=> d!50465 e!100675))

(declare-fun res!72734 () Bool)

(assert (=> d!50465 (=> (not res!72734) (not e!100675))))

(declare-fun lt!80786 () ListLongMap!1787)

(assert (=> d!50465 (= res!72734 (contains!953 lt!80786 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80788 () List!1807)

(assert (=> d!50465 (= lt!80786 (ListLongMap!1788 lt!80788))))

(declare-fun lt!80787 () Unit!4887)

(declare-fun lt!80785 () Unit!4887)

(assert (=> d!50465 (= lt!80787 lt!80785)))

(assert (=> d!50465 (= (getValueByKey!181 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50465 (= lt!80785 (lemmaContainsTupThenGetReturnValue!97 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50465 (= lt!80788 (insertStrictlySorted!100 (toList!909 lt!80734) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50465 (= (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80786)))

(declare-fun b!154080 () Bool)

(declare-fun res!72733 () Bool)

(assert (=> b!154080 (=> (not res!72733) (not e!100675))))

(assert (=> b!154080 (= res!72733 (= (getValueByKey!181 (toList!909 lt!80786) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154081 () Bool)

(assert (=> b!154081 (= e!100675 (contains!954 (toList!909 lt!80786) (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50465 res!72734) b!154080))

(assert (= (and b!154080 res!72733) b!154081))

(declare-fun m!187349 () Bool)

(assert (=> d!50465 m!187349))

(declare-fun m!187351 () Bool)

(assert (=> d!50465 m!187351))

(declare-fun m!187353 () Bool)

(assert (=> d!50465 m!187353))

(declare-fun m!187355 () Bool)

(assert (=> d!50465 m!187355))

(declare-fun m!187357 () Bool)

(assert (=> b!154080 m!187357))

(declare-fun m!187359 () Bool)

(assert (=> b!154081 m!187359))

(assert (=> b!154005 d!50465))

(declare-fun d!50467 () Bool)

(assert (=> d!50467 (= (apply!128 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80728) (apply!128 lt!80739 lt!80728))))

(declare-fun lt!80789 () Unit!4887)

(assert (=> d!50467 (= lt!80789 (choose!924 lt!80739 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80728))))

(declare-fun e!100676 () Bool)

(assert (=> d!50467 e!100676))

(declare-fun res!72735 () Bool)

(assert (=> d!50467 (=> (not res!72735) (not e!100676))))

(assert (=> d!50467 (= res!72735 (contains!953 lt!80739 lt!80728))))

(assert (=> d!50467 (= (addApplyDifferent!104 lt!80739 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80728) lt!80789)))

(declare-fun b!154082 () Bool)

(assert (=> b!154082 (= e!100676 (not (= lt!80728 lt!80735)))))

(assert (= (and d!50467 res!72735) b!154082))

(assert (=> d!50467 m!187249))

(assert (=> d!50467 m!187247))

(declare-fun m!187361 () Bool)

(assert (=> d!50467 m!187361))

(declare-fun m!187363 () Bool)

(assert (=> d!50467 m!187363))

(assert (=> d!50467 m!187249))

(assert (=> d!50467 m!187251))

(assert (=> b!154005 d!50467))

(declare-fun d!50469 () Bool)

(declare-fun e!100682 () Bool)

(assert (=> d!50469 e!100682))

(declare-fun res!72738 () Bool)

(assert (=> d!50469 (=> res!72738 e!100682)))

(declare-fun lt!80800 () Bool)

(assert (=> d!50469 (= res!72738 (not lt!80800))))

(declare-fun lt!80798 () Bool)

(assert (=> d!50469 (= lt!80800 lt!80798)))

(declare-fun lt!80801 () Unit!4887)

(declare-fun e!100681 () Unit!4887)

(assert (=> d!50469 (= lt!80801 e!100681)))

(declare-fun c!29503 () Bool)

(assert (=> d!50469 (= c!29503 lt!80798)))

(declare-fun containsKey!185 (List!1807 (_ BitVec 64)) Bool)

(assert (=> d!50469 (= lt!80798 (containsKey!185 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))

(assert (=> d!50469 (= (contains!953 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80736) lt!80800)))

(declare-fun b!154089 () Bool)

(declare-fun lt!80799 () Unit!4887)

(assert (=> b!154089 (= e!100681 lt!80799)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!134 (List!1807 (_ BitVec 64)) Unit!4887)

(assert (=> b!154089 (= lt!80799 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))

(declare-fun isDefined!135 (Option!187) Bool)

(assert (=> b!154089 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))

(declare-fun b!154090 () Bool)

(declare-fun Unit!4890 () Unit!4887)

(assert (=> b!154090 (= e!100681 Unit!4890)))

(declare-fun b!154091 () Bool)

(assert (=> b!154091 (= e!100682 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736)))))

(assert (= (and d!50469 c!29503) b!154089))

(assert (= (and d!50469 (not c!29503)) b!154090))

(assert (= (and d!50469 (not res!72738)) b!154091))

(declare-fun m!187365 () Bool)

(assert (=> d!50469 m!187365))

(declare-fun m!187367 () Bool)

(assert (=> b!154089 m!187367))

(declare-fun m!187369 () Bool)

(assert (=> b!154089 m!187369))

(assert (=> b!154089 m!187369))

(declare-fun m!187371 () Bool)

(assert (=> b!154089 m!187371))

(assert (=> b!154091 m!187369))

(assert (=> b!154091 m!187369))

(assert (=> b!154091 m!187371))

(assert (=> b!154005 d!50469))

(declare-fun d!50471 () Bool)

(assert (=> d!50471 (= (apply!128 lt!80724 lt!80730) (get!1603 (getValueByKey!181 (toList!909 lt!80724) lt!80730)))))

(declare-fun bs!6496 () Bool)

(assert (= bs!6496 d!50471))

(declare-fun m!187373 () Bool)

(assert (=> bs!6496 m!187373))

(assert (=> bs!6496 m!187373))

(declare-fun m!187375 () Bool)

(assert (=> bs!6496 m!187375))

(assert (=> b!154005 d!50471))

(declare-fun d!50473 () Bool)

(assert (=> d!50473 (= (apply!128 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80730) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80730)))))

(declare-fun bs!6497 () Bool)

(assert (= bs!6497 d!50473))

(declare-fun m!187377 () Bool)

(assert (=> bs!6497 m!187377))

(assert (=> bs!6497 m!187377))

(declare-fun m!187379 () Bool)

(assert (=> bs!6497 m!187379))

(assert (=> b!154005 d!50473))

(declare-fun d!50475 () Bool)

(assert (=> d!50475 (= (apply!128 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80738) (apply!128 lt!80734 lt!80738))))

(declare-fun lt!80802 () Unit!4887)

(assert (=> d!50475 (= lt!80802 (choose!924 lt!80734 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80738))))

(declare-fun e!100683 () Bool)

(assert (=> d!50475 e!100683))

(declare-fun res!72739 () Bool)

(assert (=> d!50475 (=> (not res!72739) (not e!100683))))

(assert (=> d!50475 (= res!72739 (contains!953 lt!80734 lt!80738))))

(assert (=> d!50475 (= (addApplyDifferent!104 lt!80734 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80738) lt!80802)))

(declare-fun b!154092 () Bool)

(assert (=> b!154092 (= e!100683 (not (= lt!80738 lt!80733)))))

(assert (= (and d!50475 res!72739) b!154092))

(assert (=> d!50475 m!187243))

(assert (=> d!50475 m!187269))

(declare-fun m!187381 () Bool)

(assert (=> d!50475 m!187381))

(declare-fun m!187383 () Bool)

(assert (=> d!50475 m!187383))

(assert (=> d!50475 m!187243))

(assert (=> d!50475 m!187245))

(assert (=> b!154005 d!50475))

(declare-fun d!50477 () Bool)

(declare-fun e!100684 () Bool)

(assert (=> d!50477 e!100684))

(declare-fun res!72741 () Bool)

(assert (=> d!50477 (=> (not res!72741) (not e!100684))))

(declare-fun lt!80804 () ListLongMap!1787)

(assert (=> d!50477 (= res!72741 (contains!953 lt!80804 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80806 () List!1807)

(assert (=> d!50477 (= lt!80804 (ListLongMap!1788 lt!80806))))

(declare-fun lt!80805 () Unit!4887)

(declare-fun lt!80803 () Unit!4887)

(assert (=> d!50477 (= lt!80805 lt!80803)))

(assert (=> d!50477 (= (getValueByKey!181 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50477 (= lt!80803 (lemmaContainsTupThenGetReturnValue!97 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50477 (= lt!80806 (insertStrictlySorted!100 (toList!909 lt!80724) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50477 (= (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80804)))

(declare-fun b!154093 () Bool)

(declare-fun res!72740 () Bool)

(assert (=> b!154093 (=> (not res!72740) (not e!100684))))

(assert (=> b!154093 (= res!72740 (= (getValueByKey!181 (toList!909 lt!80804) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154094 () Bool)

(assert (=> b!154094 (= e!100684 (contains!954 (toList!909 lt!80804) (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50477 res!72741) b!154093))

(assert (= (and b!154093 res!72740) b!154094))

(declare-fun m!187385 () Bool)

(assert (=> d!50477 m!187385))

(declare-fun m!187387 () Bool)

(assert (=> d!50477 m!187387))

(declare-fun m!187389 () Bool)

(assert (=> d!50477 m!187389))

(declare-fun m!187391 () Bool)

(assert (=> d!50477 m!187391))

(declare-fun m!187393 () Bool)

(assert (=> b!154093 m!187393))

(declare-fun m!187395 () Bool)

(assert (=> b!154094 m!187395))

(assert (=> b!154005 d!50477))

(declare-fun d!50479 () Bool)

(assert (=> d!50479 (= (apply!128 lt!80739 lt!80728) (get!1603 (getValueByKey!181 (toList!909 lt!80739) lt!80728)))))

(declare-fun bs!6498 () Bool)

(assert (= bs!6498 d!50479))

(declare-fun m!187397 () Bool)

(assert (=> bs!6498 m!187397))

(assert (=> bs!6498 m!187397))

(declare-fun m!187399 () Bool)

(assert (=> bs!6498 m!187399))

(assert (=> b!154005 d!50479))

(declare-fun d!50481 () Bool)

(assert (=> d!50481 (= (apply!128 lt!80722 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1603 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6499 () Bool)

(assert (= bs!6499 d!50481))

(declare-fun m!187401 () Bool)

(assert (=> bs!6499 m!187401))

(assert (=> bs!6499 m!187401))

(declare-fun m!187403 () Bool)

(assert (=> bs!6499 m!187403))

(assert (=> b!154015 d!50481))

(declare-fun d!50483 () Bool)

(declare-fun e!100686 () Bool)

(assert (=> d!50483 e!100686))

(declare-fun res!72742 () Bool)

(assert (=> d!50483 (=> res!72742 e!100686)))

(declare-fun lt!80809 () Bool)

(assert (=> d!50483 (= res!72742 (not lt!80809))))

(declare-fun lt!80807 () Bool)

(assert (=> d!50483 (= lt!80809 lt!80807)))

(declare-fun lt!80810 () Unit!4887)

(declare-fun e!100685 () Unit!4887)

(assert (=> d!50483 (= lt!80810 e!100685)))

(declare-fun c!29504 () Bool)

(assert (=> d!50483 (= c!29504 lt!80807)))

(assert (=> d!50483 (= lt!80807 (containsKey!185 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!50483 (= (contains!953 lt!80722 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!80809)))

(declare-fun b!154095 () Bool)

(declare-fun lt!80808 () Unit!4887)

(assert (=> b!154095 (= e!100685 lt!80808)))

(assert (=> b!154095 (= lt!80808 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154095 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154096 () Bool)

(declare-fun Unit!4891 () Unit!4887)

(assert (=> b!154096 (= e!100685 Unit!4891)))

(declare-fun b!154097 () Bool)

(assert (=> b!154097 (= e!100686 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!50483 c!29504) b!154095))

(assert (= (and d!50483 (not c!29504)) b!154096))

(assert (= (and d!50483 (not res!72742)) b!154097))

(assert (=> d!50483 m!187225))

(declare-fun m!187405 () Bool)

(assert (=> d!50483 m!187405))

(assert (=> b!154095 m!187225))

(declare-fun m!187407 () Bool)

(assert (=> b!154095 m!187407))

(assert (=> b!154095 m!187225))

(declare-fun m!187409 () Bool)

(assert (=> b!154095 m!187409))

(assert (=> b!154095 m!187409))

(declare-fun m!187411 () Bool)

(assert (=> b!154095 m!187411))

(assert (=> b!154097 m!187225))

(assert (=> b!154097 m!187409))

(assert (=> b!154097 m!187409))

(assert (=> b!154097 m!187411))

(assert (=> b!153998 d!50483))

(declare-fun d!50485 () Bool)

(assert (=> d!50485 (= (apply!128 lt!80722 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1603 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6500 () Bool)

(assert (= bs!6500 d!50485))

(assert (=> bs!6500 m!187225))

(assert (=> bs!6500 m!187409))

(assert (=> bs!6500 m!187409))

(declare-fun m!187413 () Bool)

(assert (=> bs!6500 m!187413))

(assert (=> b!154006 d!50485))

(declare-fun d!50487 () Bool)

(declare-fun c!29507 () Bool)

(assert (=> d!50487 (= c!29507 ((_ is ValueCellFull!1169) (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!100689 () V!3681)

(assert (=> d!50487 (= (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100689)))

(declare-fun b!154102 () Bool)

(declare-fun get!1604 (ValueCell!1169 V!3681) V!3681)

(assert (=> b!154102 (= e!100689 (get!1604 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154103 () Bool)

(declare-fun get!1605 (ValueCell!1169 V!3681) V!3681)

(assert (=> b!154103 (= e!100689 (get!1605 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50487 c!29507) b!154102))

(assert (= (and d!50487 (not c!29507)) b!154103))

(assert (=> b!154102 m!187235))

(assert (=> b!154102 m!187233))

(declare-fun m!187415 () Bool)

(assert (=> b!154102 m!187415))

(assert (=> b!154103 m!187235))

(assert (=> b!154103 m!187233))

(declare-fun m!187417 () Bool)

(assert (=> b!154103 m!187417))

(assert (=> b!154006 d!50487))

(declare-fun b!154104 () Bool)

(declare-fun e!100692 () Bool)

(declare-fun e!100701 () Bool)

(assert (=> b!154104 (= e!100692 e!100701)))

(declare-fun res!72749 () Bool)

(assert (=> b!154104 (=> (not res!72749) (not e!100701))))

(declare-fun lt!80813 () ListLongMap!1787)

(assert (=> b!154104 (= res!72749 (contains!953 lt!80813 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun bm!17133 () Bool)

(declare-fun call!17136 () Bool)

(assert (=> bm!17133 (= call!17136 (contains!953 lt!80813 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154105 () Bool)

(declare-fun e!100698 () ListLongMap!1787)

(declare-fun e!100695 () ListLongMap!1787)

(assert (=> b!154105 (= e!100698 e!100695)))

(declare-fun c!29509 () Bool)

(assert (=> b!154105 (= c!29509 (and (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154106 () Bool)

(declare-fun e!100699 () Bool)

(declare-fun call!17141 () Bool)

(assert (=> b!154106 (= e!100699 (not call!17141))))

(declare-fun call!17140 () ListLongMap!1787)

(declare-fun bm!17134 () Bool)

(declare-fun call!17137 () ListLongMap!1787)

(declare-fun c!29508 () Bool)

(declare-fun call!17142 () ListLongMap!1787)

(declare-fun call!17138 () ListLongMap!1787)

(assert (=> bm!17134 (= call!17140 (+!181 (ite c!29508 call!17138 (ite c!29509 call!17142 call!17137)) (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154107 () Bool)

(declare-fun e!100694 () Bool)

(declare-fun e!100690 () Bool)

(assert (=> b!154107 (= e!100694 e!100690)))

(declare-fun c!29513 () Bool)

(assert (=> b!154107 (= c!29513 (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154108 () Bool)

(declare-fun e!100697 () Bool)

(assert (=> b!154108 (= e!100697 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154109 () Bool)

(declare-fun e!100702 () ListLongMap!1787)

(assert (=> b!154109 (= e!100702 call!17137)))

(declare-fun b!154110 () Bool)

(declare-fun e!100693 () Bool)

(assert (=> b!154110 (= e!100693 (= (apply!128 lt!80813 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154111 () Bool)

(declare-fun e!100700 () Unit!4887)

(declare-fun lt!80828 () Unit!4887)

(assert (=> b!154111 (= e!100700 lt!80828)))

(declare-fun lt!80811 () ListLongMap!1787)

(assert (=> b!154111 (= lt!80811 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80831 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80827 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80827 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80817 () Unit!4887)

(assert (=> b!154111 (= lt!80817 (addStillContains!104 lt!80811 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80827))))

(assert (=> b!154111 (contains!953 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80827)))

(declare-fun lt!80822 () Unit!4887)

(assert (=> b!154111 (= lt!80822 lt!80817)))

(declare-fun lt!80815 () ListLongMap!1787)

(assert (=> b!154111 (= lt!80815 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80816 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80821 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80821 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80832 () Unit!4887)

(assert (=> b!154111 (= lt!80832 (addApplyDifferent!104 lt!80815 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80821))))

(assert (=> b!154111 (= (apply!128 (+!181 lt!80815 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80821) (apply!128 lt!80815 lt!80821))))

(declare-fun lt!80820 () Unit!4887)

(assert (=> b!154111 (= lt!80820 lt!80832)))

(declare-fun lt!80830 () ListLongMap!1787)

(assert (=> b!154111 (= lt!80830 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80826 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80819 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80819 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80818 () Unit!4887)

(assert (=> b!154111 (= lt!80818 (addApplyDifferent!104 lt!80830 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80819))))

(assert (=> b!154111 (= (apply!128 (+!181 lt!80830 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80819) (apply!128 lt!80830 lt!80819))))

(declare-fun lt!80814 () Unit!4887)

(assert (=> b!154111 (= lt!80814 lt!80818)))

(declare-fun lt!80825 () ListLongMap!1787)

(assert (=> b!154111 (= lt!80825 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun lt!80824 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80824 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80829 () (_ BitVec 64))

(assert (=> b!154111 (= lt!80829 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154111 (= lt!80828 (addApplyDifferent!104 lt!80825 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80829))))

(assert (=> b!154111 (= (apply!128 (+!181 lt!80825 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80829) (apply!128 lt!80825 lt!80829))))

(declare-fun b!154112 () Bool)

(assert (=> b!154112 (= e!100701 (= (apply!128 lt!80813 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154113 () Bool)

(declare-fun res!72748 () Bool)

(assert (=> b!154113 (=> (not res!72748) (not e!100694))))

(assert (=> b!154113 (= res!72748 e!100699)))

(declare-fun c!29512 () Bool)

(assert (=> b!154113 (= c!29512 (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154114 () Bool)

(assert (=> b!154114 (= e!100698 (+!181 call!17140 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154115 () Bool)

(declare-fun res!72745 () Bool)

(assert (=> b!154115 (=> (not res!72745) (not e!100694))))

(assert (=> b!154115 (= res!72745 e!100692)))

(declare-fun res!72751 () Bool)

(assert (=> b!154115 (=> res!72751 e!100692)))

(declare-fun e!100691 () Bool)

(assert (=> b!154115 (= res!72751 (not e!100691))))

(declare-fun res!72744 () Bool)

(assert (=> b!154115 (=> (not res!72744) (not e!100691))))

(assert (=> b!154115 (= res!72744 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun bm!17135 () Bool)

(assert (=> bm!17135 (= call!17137 call!17142)))

(declare-fun b!154116 () Bool)

(assert (=> b!154116 (= e!100699 e!100693)))

(declare-fun res!72750 () Bool)

(assert (=> b!154116 (= res!72750 call!17141)))

(assert (=> b!154116 (=> (not res!72750) (not e!100693))))

(declare-fun b!154117 () Bool)

(declare-fun e!100696 () Bool)

(assert (=> b!154117 (= e!100690 e!100696)))

(declare-fun res!72747 () Bool)

(assert (=> b!154117 (= res!72747 call!17136)))

(assert (=> b!154117 (=> (not res!72747) (not e!100696))))

(declare-fun b!154118 () Bool)

(declare-fun call!17139 () ListLongMap!1787)

(assert (=> b!154118 (= e!100695 call!17139)))

(declare-fun b!154119 () Bool)

(assert (=> b!154119 (= e!100691 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!17136 () Bool)

(assert (=> bm!17136 (= call!17139 call!17140)))

(declare-fun b!154120 () Bool)

(assert (=> b!154120 (= e!100702 call!17139)))

(declare-fun b!154121 () Bool)

(assert (=> b!154121 (= e!100696 (= (apply!128 lt!80813 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun bm!17137 () Bool)

(assert (=> bm!17137 (= call!17141 (contains!953 lt!80813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154122 () Bool)

(declare-fun Unit!4892 () Unit!4887)

(assert (=> b!154122 (= e!100700 Unit!4892)))

(declare-fun b!154123 () Bool)

(declare-fun c!29510 () Bool)

(assert (=> b!154123 (= c!29510 (and (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154123 (= e!100695 e!100702)))

(declare-fun bm!17138 () Bool)

(assert (=> bm!17138 (= call!17142 call!17138)))

(declare-fun d!50489 () Bool)

(assert (=> d!50489 e!100694))

(declare-fun res!72743 () Bool)

(assert (=> d!50489 (=> (not res!72743) (not e!100694))))

(assert (=> d!50489 (= res!72743 (or (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun lt!80812 () ListLongMap!1787)

(assert (=> d!50489 (= lt!80813 lt!80812)))

(declare-fun lt!80823 () Unit!4887)

(assert (=> d!50489 (= lt!80823 e!100700)))

(declare-fun c!29511 () Bool)

(assert (=> d!50489 (= c!29511 e!100697)))

(declare-fun res!72746 () Bool)

(assert (=> d!50489 (=> (not res!72746) (not e!100697))))

(assert (=> d!50489 (= res!72746 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50489 (= lt!80812 e!100698)))

(assert (=> d!50489 (= c!29508 (and (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!50489 (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992))))))

(assert (=> d!50489 (= (getCurrentListMap!560 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) lt!80813)))

(declare-fun b!154124 () Bool)

(assert (=> b!154124 (= e!100690 (not call!17136))))

(declare-fun bm!17139 () Bool)

(assert (=> bm!17139 (= call!17138 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(assert (= (and d!50489 c!29508) b!154114))

(assert (= (and d!50489 (not c!29508)) b!154105))

(assert (= (and b!154105 c!29509) b!154118))

(assert (= (and b!154105 (not c!29509)) b!154123))

(assert (= (and b!154123 c!29510) b!154120))

(assert (= (and b!154123 (not c!29510)) b!154109))

(assert (= (or b!154120 b!154109) bm!17135))

(assert (= (or b!154118 bm!17135) bm!17138))

(assert (= (or b!154118 b!154120) bm!17136))

(assert (= (or b!154114 bm!17138) bm!17139))

(assert (= (or b!154114 bm!17136) bm!17134))

(assert (= (and d!50489 res!72746) b!154108))

(assert (= (and d!50489 c!29511) b!154111))

(assert (= (and d!50489 (not c!29511)) b!154122))

(assert (= (and d!50489 res!72743) b!154115))

(assert (= (and b!154115 res!72744) b!154119))

(assert (= (and b!154115 (not res!72751)) b!154104))

(assert (= (and b!154104 res!72749) b!154112))

(assert (= (and b!154115 res!72745) b!154113))

(assert (= (and b!154113 c!29512) b!154116))

(assert (= (and b!154113 (not c!29512)) b!154106))

(assert (= (and b!154116 res!72750) b!154110))

(assert (= (or b!154116 b!154106) bm!17137))

(assert (= (and b!154113 res!72748) b!154107))

(assert (= (and b!154107 c!29513) b!154117))

(assert (= (and b!154107 (not c!29513)) b!154124))

(assert (= (and b!154117 res!72747) b!154121))

(assert (= (or b!154117 b!154124) bm!17133))

(declare-fun b_lambda!6833 () Bool)

(assert (=> (not b_lambda!6833) (not b!154112)))

(assert (=> b!154112 t!6596))

(declare-fun b_and!9585 () Bool)

(assert (= b_and!9581 (and (=> t!6596 result!4481) b_and!9585)))

(assert (=> b!154112 t!6598))

(declare-fun b_and!9587 () Bool)

(assert (= b_and!9583 (and (=> t!6598 result!4485) b_and!9587)))

(declare-fun m!187419 () Bool)

(assert (=> b!154110 m!187419))

(declare-fun m!187421 () Bool)

(assert (=> b!154114 m!187421))

(declare-fun m!187423 () Bool)

(assert (=> b!154119 m!187423))

(assert (=> b!154119 m!187423))

(declare-fun m!187425 () Bool)

(assert (=> b!154119 m!187425))

(assert (=> b!154108 m!187423))

(assert (=> b!154108 m!187423))

(assert (=> b!154108 m!187425))

(declare-fun m!187427 () Bool)

(assert (=> bm!17139 m!187427))

(declare-fun m!187429 () Bool)

(assert (=> bm!17133 m!187429))

(assert (=> b!154112 m!187233))

(assert (=> b!154112 m!187423))

(declare-fun m!187431 () Bool)

(assert (=> b!154112 m!187431))

(assert (=> b!154112 m!187233))

(declare-fun m!187433 () Bool)

(assert (=> b!154112 m!187433))

(assert (=> b!154112 m!187423))

(declare-fun m!187435 () Bool)

(assert (=> b!154112 m!187435))

(assert (=> b!154112 m!187431))

(declare-fun m!187437 () Bool)

(assert (=> b!154111 m!187437))

(declare-fun m!187439 () Bool)

(assert (=> b!154111 m!187439))

(declare-fun m!187441 () Bool)

(assert (=> b!154111 m!187441))

(assert (=> b!154111 m!187439))

(declare-fun m!187443 () Bool)

(assert (=> b!154111 m!187443))

(declare-fun m!187445 () Bool)

(assert (=> b!154111 m!187445))

(declare-fun m!187447 () Bool)

(assert (=> b!154111 m!187447))

(assert (=> b!154111 m!187423))

(declare-fun m!187449 () Bool)

(assert (=> b!154111 m!187449))

(declare-fun m!187451 () Bool)

(assert (=> b!154111 m!187451))

(declare-fun m!187453 () Bool)

(assert (=> b!154111 m!187453))

(assert (=> b!154111 m!187449))

(declare-fun m!187455 () Bool)

(assert (=> b!154111 m!187455))

(declare-fun m!187457 () Bool)

(assert (=> b!154111 m!187457))

(declare-fun m!187459 () Bool)

(assert (=> b!154111 m!187459))

(assert (=> b!154111 m!187445))

(assert (=> b!154111 m!187451))

(declare-fun m!187461 () Bool)

(assert (=> b!154111 m!187461))

(declare-fun m!187463 () Bool)

(assert (=> b!154111 m!187463))

(declare-fun m!187465 () Bool)

(assert (=> b!154111 m!187465))

(assert (=> b!154111 m!187427))

(declare-fun m!187467 () Bool)

(assert (=> b!154121 m!187467))

(declare-fun m!187469 () Bool)

(assert (=> bm!17137 m!187469))

(declare-fun m!187471 () Bool)

(assert (=> bm!17134 m!187471))

(assert (=> d!50489 m!187277))

(assert (=> b!154104 m!187423))

(assert (=> b!154104 m!187423))

(declare-fun m!187473 () Bool)

(assert (=> b!154104 m!187473))

(assert (=> d!50431 d!50489))

(assert (=> bm!17129 d!50451))

(declare-fun d!50491 () Bool)

(assert (=> d!50491 (= (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154002 d!50491))

(declare-fun d!50493 () Bool)

(assert (=> d!50493 (= (apply!128 lt!80722 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1603 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6501 () Bool)

(assert (= bs!6501 d!50493))

(declare-fun m!187475 () Bool)

(assert (=> bs!6501 m!187475))

(assert (=> bs!6501 m!187475))

(declare-fun m!187477 () Bool)

(assert (=> bs!6501 m!187477))

(assert (=> b!154004 d!50493))

(assert (=> b!154013 d!50491))

(declare-fun d!50495 () Bool)

(assert (=> d!50495 (= (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992)))) (and (or (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000001111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000011111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000001111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000011111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000001111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000011111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000001111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000011111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000001111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000011111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000001111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000011111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000001111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000011111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000111111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000001111111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000011111111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000111111111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00001111111111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00011111111111111111111111111111) (= (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!50443 d!50495))

(declare-fun d!50497 () Bool)

(declare-fun e!100703 () Bool)

(assert (=> d!50497 e!100703))

(declare-fun res!72753 () Bool)

(assert (=> d!50497 (=> (not res!72753) (not e!100703))))

(declare-fun lt!80834 () ListLongMap!1787)

(assert (=> d!50497 (= res!72753 (contains!953 lt!80834 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun lt!80836 () List!1807)

(assert (=> d!50497 (= lt!80834 (ListLongMap!1788 lt!80836))))

(declare-fun lt!80835 () Unit!4887)

(declare-fun lt!80833 () Unit!4887)

(assert (=> d!50497 (= lt!80835 lt!80833)))

(assert (=> d!50497 (= (getValueByKey!181 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (Some!186 (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50497 (= lt!80833 (lemmaContainsTupThenGetReturnValue!97 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50497 (= lt!80836 (insertStrictlySorted!100 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50497 (= (+!181 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80834)))

(declare-fun b!154125 () Bool)

(declare-fun res!72752 () Bool)

(assert (=> b!154125 (=> (not res!72752) (not e!100703))))

(assert (=> b!154125 (= res!72752 (= (getValueByKey!181 (toList!909 lt!80834) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (Some!186 (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154126 () Bool)

(assert (=> b!154126 (= e!100703 (contains!954 (toList!909 lt!80834) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (= (and d!50497 res!72753) b!154125))

(assert (= (and b!154125 res!72752) b!154126))

(declare-fun m!187479 () Bool)

(assert (=> d!50497 m!187479))

(declare-fun m!187481 () Bool)

(assert (=> d!50497 m!187481))

(declare-fun m!187483 () Bool)

(assert (=> d!50497 m!187483))

(declare-fun m!187485 () Bool)

(assert (=> d!50497 m!187485))

(declare-fun m!187487 () Bool)

(assert (=> b!154125 m!187487))

(declare-fun m!187489 () Bool)

(assert (=> b!154126 m!187489))

(assert (=> bm!17124 d!50497))

(declare-fun b!154137 () Bool)

(declare-fun e!100715 () Bool)

(declare-fun e!100712 () Bool)

(assert (=> b!154137 (= e!100715 e!100712)))

(declare-fun res!72762 () Bool)

(assert (=> b!154137 (=> (not res!72762) (not e!100712))))

(declare-fun e!100713 () Bool)

(assert (=> b!154137 (= res!72762 (not e!100713))))

(declare-fun res!72760 () Bool)

(assert (=> b!154137 (=> (not res!72760) (not e!100713))))

(assert (=> b!154137 (= res!72760 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154138 () Bool)

(declare-fun e!100714 () Bool)

(declare-fun call!17145 () Bool)

(assert (=> b!154138 (= e!100714 call!17145)))

(declare-fun d!50499 () Bool)

(declare-fun res!72761 () Bool)

(assert (=> d!50499 (=> res!72761 e!100715)))

(assert (=> d!50499 (= res!72761 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50499 (= (arrayNoDuplicates!0 (_keys!4835 newMap!16) #b00000000000000000000000000000000 Nil!1807) e!100715)))

(declare-fun b!154139 () Bool)

(declare-fun contains!955 (List!1810 (_ BitVec 64)) Bool)

(assert (=> b!154139 (= e!100713 (contains!955 Nil!1807 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!17142 () Bool)

(declare-fun c!29516 () Bool)

(assert (=> bm!17142 (= call!17145 (arrayNoDuplicates!0 (_keys!4835 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29516 (Cons!1806 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) Nil!1807) Nil!1807)))))

(declare-fun b!154140 () Bool)

(assert (=> b!154140 (= e!100712 e!100714)))

(assert (=> b!154140 (= c!29516 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154141 () Bool)

(assert (=> b!154141 (= e!100714 call!17145)))

(assert (= (and d!50499 (not res!72761)) b!154137))

(assert (= (and b!154137 res!72760) b!154139))

(assert (= (and b!154137 res!72762) b!154140))

(assert (= (and b!154140 c!29516) b!154138))

(assert (= (and b!154140 (not c!29516)) b!154141))

(assert (= (or b!154138 b!154141) bm!17142))

(declare-fun m!187491 () Bool)

(assert (=> b!154137 m!187491))

(assert (=> b!154137 m!187491))

(declare-fun m!187493 () Bool)

(assert (=> b!154137 m!187493))

(assert (=> b!154139 m!187491))

(assert (=> b!154139 m!187491))

(declare-fun m!187495 () Bool)

(assert (=> b!154139 m!187495))

(assert (=> bm!17142 m!187491))

(declare-fun m!187497 () Bool)

(assert (=> bm!17142 m!187497))

(assert (=> b!154140 m!187491))

(assert (=> b!154140 m!187491))

(assert (=> b!154140 m!187493))

(assert (=> b!153955 d!50499))

(declare-fun d!50501 () Bool)

(declare-fun res!72763 () Bool)

(declare-fun e!100716 () Bool)

(assert (=> d!50501 (=> (not res!72763) (not e!100716))))

(assert (=> d!50501 (= res!72763 (simpleValid!104 (v!3411 (underlying!521 thiss!992))))))

(assert (=> d!50501 (= (valid!624 (v!3411 (underlying!521 thiss!992))) e!100716)))

(declare-fun b!154142 () Bool)

(declare-fun res!72764 () Bool)

(assert (=> b!154142 (=> (not res!72764) (not e!100716))))

(assert (=> b!154142 (= res!72764 (= (arrayCountValidKeys!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))) (_size!672 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154143 () Bool)

(declare-fun res!72765 () Bool)

(assert (=> b!154143 (=> (not res!72765) (not e!100716))))

(assert (=> b!154143 (= res!72765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154144 () Bool)

(assert (=> b!154144 (= e!100716 (arrayNoDuplicates!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 Nil!1807))))

(assert (= (and d!50501 res!72763) b!154142))

(assert (= (and b!154142 res!72764) b!154143))

(assert (= (and b!154143 res!72765) b!154144))

(declare-fun m!187499 () Bool)

(assert (=> d!50501 m!187499))

(declare-fun m!187501 () Bool)

(assert (=> b!154142 m!187501))

(declare-fun m!187503 () Bool)

(assert (=> b!154143 m!187503))

(declare-fun m!187505 () Bool)

(assert (=> b!154144 m!187505))

(assert (=> d!50437 d!50501))

(declare-fun d!50503 () Bool)

(declare-fun e!100718 () Bool)

(assert (=> d!50503 e!100718))

(declare-fun res!72766 () Bool)

(assert (=> d!50503 (=> res!72766 e!100718)))

(declare-fun lt!80839 () Bool)

(assert (=> d!50503 (= res!72766 (not lt!80839))))

(declare-fun lt!80837 () Bool)

(assert (=> d!50503 (= lt!80839 lt!80837)))

(declare-fun lt!80840 () Unit!4887)

(declare-fun e!100717 () Unit!4887)

(assert (=> d!50503 (= lt!80840 e!100717)))

(declare-fun c!29517 () Bool)

(assert (=> d!50503 (= c!29517 lt!80837)))

(assert (=> d!50503 (= lt!80837 (containsKey!185 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50503 (= (contains!953 lt!80722 #b1000000000000000000000000000000000000000000000000000000000000000) lt!80839)))

(declare-fun b!154145 () Bool)

(declare-fun lt!80838 () Unit!4887)

(assert (=> b!154145 (= e!100717 lt!80838)))

(assert (=> b!154145 (= lt!80838 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154145 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154146 () Bool)

(declare-fun Unit!4893 () Unit!4887)

(assert (=> b!154146 (= e!100717 Unit!4893)))

(declare-fun b!154147 () Bool)

(assert (=> b!154147 (= e!100718 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50503 c!29517) b!154145))

(assert (= (and d!50503 (not c!29517)) b!154146))

(assert (= (and d!50503 (not res!72766)) b!154147))

(declare-fun m!187507 () Bool)

(assert (=> d!50503 m!187507))

(declare-fun m!187509 () Bool)

(assert (=> b!154145 m!187509))

(assert (=> b!154145 m!187401))

(assert (=> b!154145 m!187401))

(declare-fun m!187511 () Bool)

(assert (=> b!154145 m!187511))

(assert (=> b!154147 m!187401))

(assert (=> b!154147 m!187401))

(assert (=> b!154147 m!187511))

(assert (=> bm!17123 d!50503))

(declare-fun b!154156 () Bool)

(declare-fun e!100723 () (_ BitVec 32))

(declare-fun call!17148 () (_ BitVec 32))

(assert (=> b!154156 (= e!100723 call!17148)))

(declare-fun bm!17145 () Bool)

(assert (=> bm!17145 (= call!17148 (arrayCountValidKeys!0 (_keys!4835 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))))))

(declare-fun b!154157 () Bool)

(assert (=> b!154157 (= e!100723 (bvadd #b00000000000000000000000000000001 call!17148))))

(declare-fun b!154158 () Bool)

(declare-fun e!100724 () (_ BitVec 32))

(assert (=> b!154158 (= e!100724 #b00000000000000000000000000000000)))

(declare-fun b!154159 () Bool)

(assert (=> b!154159 (= e!100724 e!100723)))

(declare-fun c!29522 () Bool)

(assert (=> b!154159 (= c!29522 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!50505 () Bool)

(declare-fun lt!80843 () (_ BitVec 32))

(assert (=> d!50505 (and (bvsge lt!80843 #b00000000000000000000000000000000) (bvsle lt!80843 (bvsub (size!2676 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!50505 (= lt!80843 e!100724)))

(declare-fun c!29523 () Bool)

(assert (=> d!50505 (= c!29523 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50505 (and (bvsle #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2676 (_keys!4835 newMap!16)) (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50505 (= (arrayCountValidKeys!0 (_keys!4835 newMap!16) #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))) lt!80843)))

(assert (= (and d!50505 c!29523) b!154158))

(assert (= (and d!50505 (not c!29523)) b!154159))

(assert (= (and b!154159 c!29522) b!154157))

(assert (= (and b!154159 (not c!29522)) b!154156))

(assert (= (or b!154157 b!154156) bm!17145))

(declare-fun m!187513 () Bool)

(assert (=> bm!17145 m!187513))

(assert (=> b!154159 m!187491))

(assert (=> b!154159 m!187491))

(assert (=> b!154159 m!187493))

(assert (=> b!153953 d!50505))

(declare-fun d!50507 () Bool)

(declare-fun e!100725 () Bool)

(assert (=> d!50507 e!100725))

(declare-fun res!72768 () Bool)

(assert (=> d!50507 (=> (not res!72768) (not e!100725))))

(declare-fun lt!80845 () ListLongMap!1787)

(assert (=> d!50507 (= res!72768 (contains!953 lt!80845 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80847 () List!1807)

(assert (=> d!50507 (= lt!80845 (ListLongMap!1788 lt!80847))))

(declare-fun lt!80846 () Unit!4887)

(declare-fun lt!80844 () Unit!4887)

(assert (=> d!50507 (= lt!80846 lt!80844)))

(assert (=> d!50507 (= (getValueByKey!181 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50507 (= lt!80844 (lemmaContainsTupThenGetReturnValue!97 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50507 (= lt!80847 (insertStrictlySorted!100 (toList!909 call!17130) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50507 (= (+!181 call!17130 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80845)))

(declare-fun b!154160 () Bool)

(declare-fun res!72767 () Bool)

(assert (=> b!154160 (=> (not res!72767) (not e!100725))))

(assert (=> b!154160 (= res!72767 (= (getValueByKey!181 (toList!909 lt!80845) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154161 () Bool)

(assert (=> b!154161 (= e!100725 (contains!954 (toList!909 lt!80845) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50507 res!72768) b!154160))

(assert (= (and b!154160 res!72767) b!154161))

(declare-fun m!187515 () Bool)

(assert (=> d!50507 m!187515))

(declare-fun m!187517 () Bool)

(assert (=> d!50507 m!187517))

(declare-fun m!187519 () Bool)

(assert (=> d!50507 m!187519))

(declare-fun m!187521 () Bool)

(assert (=> d!50507 m!187521))

(declare-fun m!187523 () Bool)

(assert (=> b!154160 m!187523))

(declare-fun m!187525 () Bool)

(assert (=> b!154161 m!187525))

(assert (=> b!154008 d!50507))

(declare-fun b!154171 () Bool)

(declare-fun res!72778 () Bool)

(declare-fun e!100728 () Bool)

(assert (=> b!154171 (=> (not res!72778) (not e!100728))))

(declare-fun size!2682 (LongMapFixedSize!1246) (_ BitVec 32))

(assert (=> b!154171 (= res!72778 (bvsge (size!2682 newMap!16) (_size!672 newMap!16)))))

(declare-fun b!154170 () Bool)

(declare-fun res!72779 () Bool)

(assert (=> b!154170 (=> (not res!72779) (not e!100728))))

(assert (=> b!154170 (= res!72779 (and (= (size!2677 (_values!3046 newMap!16)) (bvadd (mask!7466 newMap!16) #b00000000000000000000000000000001)) (= (size!2676 (_keys!4835 newMap!16)) (size!2677 (_values!3046 newMap!16))) (bvsge (_size!672 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!672 newMap!16) (bvadd (mask!7466 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!154173 () Bool)

(assert (=> b!154173 (= e!100728 (and (bvsge (extraKeys!2804 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2804 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!672 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!154172 () Bool)

(declare-fun res!72777 () Bool)

(assert (=> b!154172 (=> (not res!72777) (not e!100728))))

(assert (=> b!154172 (= res!72777 (= (size!2682 newMap!16) (bvadd (_size!672 newMap!16) (bvsdiv (bvadd (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!50509 () Bool)

(declare-fun res!72780 () Bool)

(assert (=> d!50509 (=> (not res!72780) (not e!100728))))

(assert (=> d!50509 (= res!72780 (validMask!0 (mask!7466 newMap!16)))))

(assert (=> d!50509 (= (simpleValid!104 newMap!16) e!100728)))

(assert (= (and d!50509 res!72780) b!154170))

(assert (= (and b!154170 res!72779) b!154171))

(assert (= (and b!154171 res!72778) b!154172))

(assert (= (and b!154172 res!72777) b!154173))

(declare-fun m!187527 () Bool)

(assert (=> b!154171 m!187527))

(assert (=> b!154172 m!187527))

(declare-fun m!187529 () Bool)

(assert (=> d!50509 m!187529))

(assert (=> d!50439 d!50509))

(declare-fun d!50511 () Bool)

(declare-fun e!100730 () Bool)

(assert (=> d!50511 e!100730))

(declare-fun res!72781 () Bool)

(assert (=> d!50511 (=> res!72781 e!100730)))

(declare-fun lt!80850 () Bool)

(assert (=> d!50511 (= res!72781 (not lt!80850))))

(declare-fun lt!80848 () Bool)

(assert (=> d!50511 (= lt!80850 lt!80848)))

(declare-fun lt!80851 () Unit!4887)

(declare-fun e!100729 () Unit!4887)

(assert (=> d!50511 (= lt!80851 e!100729)))

(declare-fun c!29524 () Bool)

(assert (=> d!50511 (= c!29524 lt!80848)))

(assert (=> d!50511 (= lt!80848 (containsKey!185 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50511 (= (contains!953 lt!80722 #b0000000000000000000000000000000000000000000000000000000000000000) lt!80850)))

(declare-fun b!154174 () Bool)

(declare-fun lt!80849 () Unit!4887)

(assert (=> b!154174 (= e!100729 lt!80849)))

(assert (=> b!154174 (= lt!80849 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154174 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154175 () Bool)

(declare-fun Unit!4894 () Unit!4887)

(assert (=> b!154175 (= e!100729 Unit!4894)))

(declare-fun b!154176 () Bool)

(assert (=> b!154176 (= e!100730 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50511 c!29524) b!154174))

(assert (= (and d!50511 (not c!29524)) b!154175))

(assert (= (and d!50511 (not res!72781)) b!154176))

(declare-fun m!187531 () Bool)

(assert (=> d!50511 m!187531))

(declare-fun m!187533 () Bool)

(assert (=> b!154174 m!187533))

(assert (=> b!154174 m!187475))

(assert (=> b!154174 m!187475))

(declare-fun m!187535 () Bool)

(assert (=> b!154174 m!187535))

(assert (=> b!154176 m!187475))

(assert (=> b!154176 m!187475))

(assert (=> b!154176 m!187535))

(assert (=> bm!17127 d!50511))

(declare-fun b!154177 () Bool)

(declare-fun e!100733 () Bool)

(declare-fun e!100742 () Bool)

(assert (=> b!154177 (= e!100733 e!100742)))

(declare-fun res!72788 () Bool)

(assert (=> b!154177 (=> (not res!72788) (not e!100742))))

(declare-fun lt!80854 () ListLongMap!1787)

(assert (=> b!154177 (= res!72788 (contains!953 lt!80854 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(declare-fun bm!17146 () Bool)

(declare-fun call!17149 () Bool)

(assert (=> bm!17146 (= call!17149 (contains!953 lt!80854 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154178 () Bool)

(declare-fun e!100739 () ListLongMap!1787)

(declare-fun e!100736 () ListLongMap!1787)

(assert (=> b!154178 (= e!100739 e!100736)))

(declare-fun c!29526 () Bool)

(assert (=> b!154178 (= c!29526 (and (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154179 () Bool)

(declare-fun e!100740 () Bool)

(declare-fun call!17154 () Bool)

(assert (=> b!154179 (= e!100740 (not call!17154))))

(declare-fun bm!17147 () Bool)

(declare-fun call!17155 () ListLongMap!1787)

(declare-fun call!17151 () ListLongMap!1787)

(declare-fun c!29525 () Bool)

(declare-fun call!17153 () ListLongMap!1787)

(declare-fun call!17150 () ListLongMap!1787)

(assert (=> bm!17147 (= call!17153 (+!181 (ite c!29525 call!17151 (ite c!29526 call!17155 call!17150)) (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(declare-fun b!154180 () Bool)

(declare-fun e!100735 () Bool)

(declare-fun e!100731 () Bool)

(assert (=> b!154180 (= e!100735 e!100731)))

(declare-fun c!29530 () Bool)

(assert (=> b!154180 (= c!29530 (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!154181 () Bool)

(declare-fun e!100738 () Bool)

(assert (=> b!154181 (= e!100738 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154182 () Bool)

(declare-fun e!100743 () ListLongMap!1787)

(assert (=> b!154182 (= e!100743 call!17150)))

(declare-fun b!154183 () Bool)

(declare-fun e!100734 () Bool)

(assert (=> b!154183 (= e!100734 (= (apply!128 lt!80854 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2906 newMap!16)))))

(declare-fun b!154184 () Bool)

(declare-fun e!100741 () Unit!4887)

(declare-fun lt!80869 () Unit!4887)

(assert (=> b!154184 (= e!100741 lt!80869)))

(declare-fun lt!80852 () ListLongMap!1787)

(assert (=> b!154184 (= lt!80852 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80872 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80872 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80868 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80868 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80858 () Unit!4887)

(assert (=> b!154184 (= lt!80858 (addStillContains!104 lt!80852 lt!80872 (zeroValue!2906 newMap!16) lt!80868))))

(assert (=> b!154184 (contains!953 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))) lt!80868)))

(declare-fun lt!80863 () Unit!4887)

(assert (=> b!154184 (= lt!80863 lt!80858)))

(declare-fun lt!80856 () ListLongMap!1787)

(assert (=> b!154184 (= lt!80856 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80857 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80857 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80862 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80862 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80873 () Unit!4887)

(assert (=> b!154184 (= lt!80873 (addApplyDifferent!104 lt!80856 lt!80857 (minValue!2906 newMap!16) lt!80862))))

(assert (=> b!154184 (= (apply!128 (+!181 lt!80856 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))) lt!80862) (apply!128 lt!80856 lt!80862))))

(declare-fun lt!80861 () Unit!4887)

(assert (=> b!154184 (= lt!80861 lt!80873)))

(declare-fun lt!80871 () ListLongMap!1787)

(assert (=> b!154184 (= lt!80871 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80867 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80867 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80860 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80860 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80859 () Unit!4887)

(assert (=> b!154184 (= lt!80859 (addApplyDifferent!104 lt!80871 lt!80867 (zeroValue!2906 newMap!16) lt!80860))))

(assert (=> b!154184 (= (apply!128 (+!181 lt!80871 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))) lt!80860) (apply!128 lt!80871 lt!80860))))

(declare-fun lt!80855 () Unit!4887)

(assert (=> b!154184 (= lt!80855 lt!80859)))

(declare-fun lt!80866 () ListLongMap!1787)

(assert (=> b!154184 (= lt!80866 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(declare-fun lt!80865 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80870 () (_ BitVec 64))

(assert (=> b!154184 (= lt!80870 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154184 (= lt!80869 (addApplyDifferent!104 lt!80866 lt!80865 (minValue!2906 newMap!16) lt!80870))))

(assert (=> b!154184 (= (apply!128 (+!181 lt!80866 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))) lt!80870) (apply!128 lt!80866 lt!80870))))

(declare-fun b!154185 () Bool)

(assert (=> b!154185 (= e!100742 (= (apply!128 lt!80854 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) (get!1602 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2677 (_values!3046 newMap!16))))))

(assert (=> b!154185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(declare-fun b!154186 () Bool)

(declare-fun res!72787 () Bool)

(assert (=> b!154186 (=> (not res!72787) (not e!100735))))

(assert (=> b!154186 (= res!72787 e!100740)))

(declare-fun c!29529 () Bool)

(assert (=> b!154186 (= c!29529 (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!154187 () Bool)

(assert (=> b!154187 (= e!100739 (+!181 call!17153 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))

(declare-fun b!154188 () Bool)

(declare-fun res!72784 () Bool)

(assert (=> b!154188 (=> (not res!72784) (not e!100735))))

(assert (=> b!154188 (= res!72784 e!100733)))

(declare-fun res!72790 () Bool)

(assert (=> b!154188 (=> res!72790 e!100733)))

(declare-fun e!100732 () Bool)

(assert (=> b!154188 (= res!72790 (not e!100732))))

(declare-fun res!72783 () Bool)

(assert (=> b!154188 (=> (not res!72783) (not e!100732))))

(assert (=> b!154188 (= res!72783 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(declare-fun bm!17148 () Bool)

(assert (=> bm!17148 (= call!17150 call!17155)))

(declare-fun b!154189 () Bool)

(assert (=> b!154189 (= e!100740 e!100734)))

(declare-fun res!72789 () Bool)

(assert (=> b!154189 (= res!72789 call!17154)))

(assert (=> b!154189 (=> (not res!72789) (not e!100734))))

(declare-fun b!154190 () Bool)

(declare-fun e!100737 () Bool)

(assert (=> b!154190 (= e!100731 e!100737)))

(declare-fun res!72786 () Bool)

(assert (=> b!154190 (= res!72786 call!17149)))

(assert (=> b!154190 (=> (not res!72786) (not e!100737))))

(declare-fun b!154191 () Bool)

(declare-fun call!17152 () ListLongMap!1787)

(assert (=> b!154191 (= e!100736 call!17152)))

(declare-fun b!154192 () Bool)

(assert (=> b!154192 (= e!100732 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!17149 () Bool)

(assert (=> bm!17149 (= call!17152 call!17153)))

(declare-fun b!154193 () Bool)

(assert (=> b!154193 (= e!100743 call!17152)))

(declare-fun b!154194 () Bool)

(assert (=> b!154194 (= e!100737 (= (apply!128 lt!80854 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2906 newMap!16)))))

(declare-fun bm!17150 () Bool)

(assert (=> bm!17150 (= call!17154 (contains!953 lt!80854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154195 () Bool)

(declare-fun Unit!4895 () Unit!4887)

(assert (=> b!154195 (= e!100741 Unit!4895)))

(declare-fun b!154196 () Bool)

(declare-fun c!29527 () Bool)

(assert (=> b!154196 (= c!29527 (and (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!154196 (= e!100736 e!100743)))

(declare-fun bm!17151 () Bool)

(assert (=> bm!17151 (= call!17155 call!17151)))

(declare-fun d!50513 () Bool)

(assert (=> d!50513 e!100735))

(declare-fun res!72782 () Bool)

(assert (=> d!50513 (=> (not res!72782) (not e!100735))))

(assert (=> d!50513 (= res!72782 (or (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))))

(declare-fun lt!80853 () ListLongMap!1787)

(assert (=> d!50513 (= lt!80854 lt!80853)))

(declare-fun lt!80864 () Unit!4887)

(assert (=> d!50513 (= lt!80864 e!100741)))

(declare-fun c!29528 () Bool)

(assert (=> d!50513 (= c!29528 e!100738)))

(declare-fun res!72785 () Bool)

(assert (=> d!50513 (=> (not res!72785) (not e!100738))))

(assert (=> d!50513 (= res!72785 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50513 (= lt!80853 e!100739)))

(assert (=> d!50513 (= c!29525 (and (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2804 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!50513 (validMask!0 (mask!7466 newMap!16))))

(assert (=> d!50513 (= (getCurrentListMap!560 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)) lt!80854)))

(declare-fun b!154197 () Bool)

(assert (=> b!154197 (= e!100731 (not call!17149))))

(declare-fun bm!17152 () Bool)

(assert (=> bm!17152 (= call!17151 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)))))

(assert (= (and d!50513 c!29525) b!154187))

(assert (= (and d!50513 (not c!29525)) b!154178))

(assert (= (and b!154178 c!29526) b!154191))

(assert (= (and b!154178 (not c!29526)) b!154196))

(assert (= (and b!154196 c!29527) b!154193))

(assert (= (and b!154196 (not c!29527)) b!154182))

(assert (= (or b!154193 b!154182) bm!17148))

(assert (= (or b!154191 bm!17148) bm!17151))

(assert (= (or b!154191 b!154193) bm!17149))

(assert (= (or b!154187 bm!17151) bm!17152))

(assert (= (or b!154187 bm!17149) bm!17147))

(assert (= (and d!50513 res!72785) b!154181))

(assert (= (and d!50513 c!29528) b!154184))

(assert (= (and d!50513 (not c!29528)) b!154195))

(assert (= (and d!50513 res!72782) b!154188))

(assert (= (and b!154188 res!72783) b!154192))

(assert (= (and b!154188 (not res!72790)) b!154177))

(assert (= (and b!154177 res!72788) b!154185))

(assert (= (and b!154188 res!72784) b!154186))

(assert (= (and b!154186 c!29529) b!154189))

(assert (= (and b!154186 (not c!29529)) b!154179))

(assert (= (and b!154189 res!72789) b!154183))

(assert (= (or b!154189 b!154179) bm!17150))

(assert (= (and b!154186 res!72787) b!154180))

(assert (= (and b!154180 c!29530) b!154190))

(assert (= (and b!154180 (not c!29530)) b!154197))

(assert (= (and b!154190 res!72786) b!154194))

(assert (= (or b!154190 b!154197) bm!17146))

(declare-fun b_lambda!6835 () Bool)

(assert (=> (not b_lambda!6835) (not b!154185)))

(declare-fun tb!2753 () Bool)

(declare-fun t!6601 () Bool)

(assert (=> (and b!153851 (= (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) (defaultEntry!3063 newMap!16)) t!6601) tb!2753))

(declare-fun result!4489 () Bool)

(assert (=> tb!2753 (= result!4489 tp_is_empty!3025)))

(assert (=> b!154185 t!6601))

(declare-fun b_and!9589 () Bool)

(assert (= b_and!9585 (and (=> t!6601 result!4489) b_and!9589)))

(declare-fun t!6603 () Bool)

(declare-fun tb!2755 () Bool)

(assert (=> (and b!153854 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 newMap!16)) t!6603) tb!2755))

(declare-fun result!4491 () Bool)

(assert (= result!4491 result!4489))

(assert (=> b!154185 t!6603))

(declare-fun b_and!9591 () Bool)

(assert (= b_and!9587 (and (=> t!6603 result!4491) b_and!9591)))

(declare-fun m!187537 () Bool)

(assert (=> b!154183 m!187537))

(declare-fun m!187539 () Bool)

(assert (=> b!154187 m!187539))

(assert (=> b!154192 m!187491))

(assert (=> b!154192 m!187491))

(assert (=> b!154192 m!187493))

(assert (=> b!154181 m!187491))

(assert (=> b!154181 m!187491))

(assert (=> b!154181 m!187493))

(declare-fun m!187541 () Bool)

(assert (=> bm!17152 m!187541))

(declare-fun m!187543 () Bool)

(assert (=> bm!17146 m!187543))

(declare-fun m!187545 () Bool)

(assert (=> b!154185 m!187545))

(assert (=> b!154185 m!187491))

(declare-fun m!187547 () Bool)

(assert (=> b!154185 m!187547))

(assert (=> b!154185 m!187545))

(declare-fun m!187549 () Bool)

(assert (=> b!154185 m!187549))

(assert (=> b!154185 m!187491))

(declare-fun m!187551 () Bool)

(assert (=> b!154185 m!187551))

(assert (=> b!154185 m!187547))

(declare-fun m!187553 () Bool)

(assert (=> b!154184 m!187553))

(declare-fun m!187555 () Bool)

(assert (=> b!154184 m!187555))

(declare-fun m!187557 () Bool)

(assert (=> b!154184 m!187557))

(assert (=> b!154184 m!187555))

(declare-fun m!187559 () Bool)

(assert (=> b!154184 m!187559))

(declare-fun m!187561 () Bool)

(assert (=> b!154184 m!187561))

(declare-fun m!187563 () Bool)

(assert (=> b!154184 m!187563))

(assert (=> b!154184 m!187491))

(declare-fun m!187565 () Bool)

(assert (=> b!154184 m!187565))

(declare-fun m!187567 () Bool)

(assert (=> b!154184 m!187567))

(declare-fun m!187569 () Bool)

(assert (=> b!154184 m!187569))

(assert (=> b!154184 m!187565))

(declare-fun m!187571 () Bool)

(assert (=> b!154184 m!187571))

(declare-fun m!187573 () Bool)

(assert (=> b!154184 m!187573))

(declare-fun m!187575 () Bool)

(assert (=> b!154184 m!187575))

(assert (=> b!154184 m!187561))

(assert (=> b!154184 m!187567))

(declare-fun m!187577 () Bool)

(assert (=> b!154184 m!187577))

(declare-fun m!187579 () Bool)

(assert (=> b!154184 m!187579))

(declare-fun m!187581 () Bool)

(assert (=> b!154184 m!187581))

(assert (=> b!154184 m!187541))

(declare-fun m!187583 () Bool)

(assert (=> b!154194 m!187583))

(declare-fun m!187585 () Bool)

(assert (=> bm!17150 m!187585))

(declare-fun m!187587 () Bool)

(assert (=> bm!17147 m!187587))

(assert (=> d!50513 m!187529))

(assert (=> b!154177 m!187491))

(assert (=> b!154177 m!187491))

(declare-fun m!187589 () Bool)

(assert (=> b!154177 m!187589))

(assert (=> d!50441 d!50513))

(declare-fun b!154207 () Bool)

(declare-fun e!100750 () Bool)

(declare-fun call!17158 () Bool)

(assert (=> b!154207 (= e!100750 call!17158)))

(declare-fun bm!17155 () Bool)

(assert (=> bm!17155 (= call!17158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4835 newMap!16) (mask!7466 newMap!16)))))

(declare-fun b!154208 () Bool)

(declare-fun e!100752 () Bool)

(assert (=> b!154208 (= e!100752 call!17158)))

(declare-fun b!154209 () Bool)

(declare-fun e!100751 () Bool)

(assert (=> b!154209 (= e!100751 e!100752)))

(declare-fun c!29533 () Bool)

(assert (=> b!154209 (= c!29533 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154206 () Bool)

(assert (=> b!154206 (= e!100752 e!100750)))

(declare-fun lt!80881 () (_ BitVec 64))

(assert (=> b!154206 (= lt!80881 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!80880 () Unit!4887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5081 (_ BitVec 64) (_ BitVec 32)) Unit!4887)

(assert (=> b!154206 (= lt!80880 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4835 newMap!16) lt!80881 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!154206 (arrayContainsKey!0 (_keys!4835 newMap!16) lt!80881 #b00000000000000000000000000000000)))

(declare-fun lt!80882 () Unit!4887)

(assert (=> b!154206 (= lt!80882 lt!80880)))

(declare-fun res!72796 () Bool)

(declare-datatypes ((SeekEntryResult!289 0))(
  ( (MissingZero!289 (index!3324 (_ BitVec 32))) (Found!289 (index!3325 (_ BitVec 32))) (Intermediate!289 (undefined!1101 Bool) (index!3326 (_ BitVec 32)) (x!17024 (_ BitVec 32))) (Undefined!289) (MissingVacant!289 (index!3327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5081 (_ BitVec 32)) SeekEntryResult!289)

(assert (=> b!154206 (= res!72796 (= (seekEntryOrOpen!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) (_keys!4835 newMap!16) (mask!7466 newMap!16)) (Found!289 #b00000000000000000000000000000000)))))

(assert (=> b!154206 (=> (not res!72796) (not e!100750))))

(declare-fun d!50515 () Bool)

(declare-fun res!72795 () Bool)

(assert (=> d!50515 (=> res!72795 e!100751)))

(assert (=> d!50515 (= res!72795 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50515 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4835 newMap!16) (mask!7466 newMap!16)) e!100751)))

(assert (= (and d!50515 (not res!72795)) b!154209))

(assert (= (and b!154209 c!29533) b!154206))

(assert (= (and b!154209 (not c!29533)) b!154208))

(assert (= (and b!154206 res!72796) b!154207))

(assert (= (or b!154207 b!154208) bm!17155))

(declare-fun m!187591 () Bool)

(assert (=> bm!17155 m!187591))

(assert (=> b!154209 m!187491))

(assert (=> b!154209 m!187491))

(assert (=> b!154209 m!187493))

(assert (=> b!154206 m!187491))

(declare-fun m!187593 () Bool)

(assert (=> b!154206 m!187593))

(declare-fun m!187595 () Bool)

(assert (=> b!154206 m!187595))

(assert (=> b!154206 m!187491))

(declare-fun m!187597 () Bool)

(assert (=> b!154206 m!187597))

(assert (=> b!153954 d!50515))

(declare-fun b!154210 () Bool)

(declare-fun e!100754 () Bool)

(assert (=> b!154210 (= e!100754 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5183 () Bool)

(declare-fun mapRes!5183 () Bool)

(assert (=> mapIsEmpty!5183 mapRes!5183))

(declare-fun condMapEmpty!5183 () Bool)

(declare-fun mapDefault!5183 () ValueCell!1169)

(assert (=> mapNonEmpty!5181 (= condMapEmpty!5183 (= mapRest!5181 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5183)))))

(declare-fun e!100753 () Bool)

(assert (=> mapNonEmpty!5181 (= tp!12201 (and e!100753 mapRes!5183))))

(declare-fun mapNonEmpty!5183 () Bool)

(declare-fun tp!12203 () Bool)

(assert (=> mapNonEmpty!5183 (= mapRes!5183 (and tp!12203 e!100754))))

(declare-fun mapRest!5183 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapValue!5183 () ValueCell!1169)

(declare-fun mapKey!5183 () (_ BitVec 32))

(assert (=> mapNonEmpty!5183 (= mapRest!5181 (store mapRest!5183 mapKey!5183 mapValue!5183))))

(declare-fun b!154211 () Bool)

(assert (=> b!154211 (= e!100753 tp_is_empty!3025)))

(assert (= (and mapNonEmpty!5181 condMapEmpty!5183) mapIsEmpty!5183))

(assert (= (and mapNonEmpty!5181 (not condMapEmpty!5183)) mapNonEmpty!5183))

(assert (= (and mapNonEmpty!5183 ((_ is ValueCellFull!1169) mapValue!5183)) b!154210))

(assert (= (and mapNonEmpty!5181 ((_ is ValueCellFull!1169) mapDefault!5183)) b!154211))

(declare-fun m!187599 () Bool)

(assert (=> mapNonEmpty!5183 m!187599))

(declare-fun b!154212 () Bool)

(declare-fun e!100756 () Bool)

(assert (=> b!154212 (= e!100756 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5184 () Bool)

(declare-fun mapRes!5184 () Bool)

(assert (=> mapIsEmpty!5184 mapRes!5184))

(declare-fun condMapEmpty!5184 () Bool)

(declare-fun mapDefault!5184 () ValueCell!1169)

(assert (=> mapNonEmpty!5182 (= condMapEmpty!5184 (= mapRest!5182 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5184)))))

(declare-fun e!100755 () Bool)

(assert (=> mapNonEmpty!5182 (= tp!12202 (and e!100755 mapRes!5184))))

(declare-fun mapNonEmpty!5184 () Bool)

(declare-fun tp!12204 () Bool)

(assert (=> mapNonEmpty!5184 (= mapRes!5184 (and tp!12204 e!100756))))

(declare-fun mapValue!5184 () ValueCell!1169)

(declare-fun mapRest!5184 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapKey!5184 () (_ BitVec 32))

(assert (=> mapNonEmpty!5184 (= mapRest!5182 (store mapRest!5184 mapKey!5184 mapValue!5184))))

(declare-fun b!154213 () Bool)

(assert (=> b!154213 (= e!100755 tp_is_empty!3025)))

(assert (= (and mapNonEmpty!5182 condMapEmpty!5184) mapIsEmpty!5184))

(assert (= (and mapNonEmpty!5182 (not condMapEmpty!5184)) mapNonEmpty!5184))

(assert (= (and mapNonEmpty!5184 ((_ is ValueCellFull!1169) mapValue!5184)) b!154212))

(assert (= (and mapNonEmpty!5182 ((_ is ValueCellFull!1169) mapDefault!5184)) b!154213))

(declare-fun m!187601 () Bool)

(assert (=> mapNonEmpty!5184 m!187601))

(declare-fun b_lambda!6837 () Bool)

(assert (= b_lambda!6833 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6837)))

(declare-fun b_lambda!6839 () Bool)

(assert (= b_lambda!6831 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6839)))

(declare-fun b_lambda!6841 () Bool)

(assert (= b_lambda!6829 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6841)))

(declare-fun b_lambda!6843 () Bool)

(assert (= b_lambda!6835 (or (and b!153851 b_free!3217 (= (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) (defaultEntry!3063 newMap!16))) (and b!153854 b_free!3219) b_lambda!6843)))

(check-sat (not b!154068) (not b!154093) (not b!154171) (not b_next!3217) (not b!154079) (not b!154062) tp_is_empty!3025 (not b!154137) (not b!154080) (not d!50455) (not bm!17147) (not d!50507) (not b!154142) (not d!50475) (not b!154140) (not d!50477) (not b!154114) (not b!154172) (not d!50479) (not b!154089) (not d!50449) (not b!154139) (not d!50509) (not d!50461) (not d!50503) (not b!154065) (not b!154194) (not d!50467) (not b!154094) (not b!154091) (not b!154066) (not bm!17133) (not d!50471) (not b!154111) (not b!154097) (not bm!17139) (not b!154076) (not b!154181) (not b!154103) (not d!50493) (not bm!17134) (not d!50497) (not d!50483) (not d!50457) (not d!50463) (not b!154119) (not mapNonEmpty!5183) (not b!154070) (not bm!17155) (not b_next!3219) (not b!154187) (not d!50473) b_and!9589 (not b!154102) (not b_lambda!6827) (not d!50465) (not b_lambda!6841) (not bm!17142) (not b!154192) (not b!154161) (not b_lambda!6837) (not b!154121) (not b_lambda!6839) (not bm!17152) (not d!50459) (not b!154095) (not b!154112) (not d!50511) (not b!154147) (not b!154145) b_and!9591 (not d!50501) (not d!50469) (not b!154144) (not d!50485) (not b_lambda!6843) (not b!154060) (not b!154110) (not b!154108) (not bm!17132) (not b!154075) (not b!154185) (not bm!17150) (not b!154064) (not d!50453) (not d!50451) (not b!154183) (not b!154143) (not b!154174) (not mapNonEmpty!5184) (not bm!17137) (not b!154081) (not d!50513) (not b!154160) (not b!154206) (not d!50489) (not b!154176) (not b!154177) (not b!154125) (not d!50481) (not bm!17146) (not b!154159) (not b!154209) (not b!154126) (not b!154063) (not b!154078) (not b!154184) (not bm!17145) (not b!154104))
(check-sat b_and!9589 b_and!9591 (not b_next!3217) (not b_next!3219))
(get-model)

(declare-fun c!29538 () Bool)

(declare-fun d!50517 () Bool)

(assert (=> d!50517 (= c!29538 (and ((_ is Cons!1803) (toList!909 lt!80786)) (= (_1!1411 (h!2412 (toList!909 lt!80786))) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100761 () Option!187)

(assert (=> d!50517 (= (getValueByKey!181 (toList!909 lt!80786) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100761)))

(declare-fun b!154223 () Bool)

(declare-fun e!100762 () Option!187)

(assert (=> b!154223 (= e!100761 e!100762)))

(declare-fun c!29539 () Bool)

(assert (=> b!154223 (= c!29539 (and ((_ is Cons!1803) (toList!909 lt!80786)) (not (= (_1!1411 (h!2412 (toList!909 lt!80786))) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154222 () Bool)

(assert (=> b!154222 (= e!100761 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80786)))))))

(declare-fun b!154224 () Bool)

(assert (=> b!154224 (= e!100762 (getValueByKey!181 (t!6592 (toList!909 lt!80786)) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154225 () Bool)

(assert (=> b!154225 (= e!100762 None!185)))

(assert (= (and d!50517 c!29538) b!154222))

(assert (= (and d!50517 (not c!29538)) b!154223))

(assert (= (and b!154223 c!29539) b!154224))

(assert (= (and b!154223 (not c!29539)) b!154225))

(declare-fun m!187603 () Bool)

(assert (=> b!154224 m!187603))

(assert (=> b!154080 d!50517))

(declare-fun d!50519 () Bool)

(assert (=> d!50519 (= (get!1603 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3416 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50481 d!50519))

(declare-fun d!50521 () Bool)

(declare-fun c!29540 () Bool)

(assert (=> d!50521 (= c!29540 (and ((_ is Cons!1803) (toList!909 lt!80722)) (= (_1!1411 (h!2412 (toList!909 lt!80722))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!100763 () Option!187)

(assert (=> d!50521 (= (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000) e!100763)))

(declare-fun b!154227 () Bool)

(declare-fun e!100764 () Option!187)

(assert (=> b!154227 (= e!100763 e!100764)))

(declare-fun c!29541 () Bool)

(assert (=> b!154227 (= c!29541 (and ((_ is Cons!1803) (toList!909 lt!80722)) (not (= (_1!1411 (h!2412 (toList!909 lt!80722))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154226 () Bool)

(assert (=> b!154226 (= e!100763 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80722)))))))

(declare-fun b!154228 () Bool)

(assert (=> b!154228 (= e!100764 (getValueByKey!181 (t!6592 (toList!909 lt!80722)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154229 () Bool)

(assert (=> b!154229 (= e!100764 None!185)))

(assert (= (and d!50521 c!29540) b!154226))

(assert (= (and d!50521 (not c!29540)) b!154227))

(assert (= (and b!154227 c!29541) b!154228))

(assert (= (and b!154227 (not c!29541)) b!154229))

(declare-fun m!187605 () Bool)

(assert (=> b!154228 m!187605))

(assert (=> d!50481 d!50521))

(declare-fun lt!80885 () Bool)

(declare-fun d!50523 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!145 (List!1807) (InoxSet tuple2!2800))

(assert (=> d!50523 (= lt!80885 (select (content!145 (toList!909 lt!80804)) (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun e!100769 () Bool)

(assert (=> d!50523 (= lt!80885 e!100769)))

(declare-fun res!72802 () Bool)

(assert (=> d!50523 (=> (not res!72802) (not e!100769))))

(assert (=> d!50523 (= res!72802 ((_ is Cons!1803) (toList!909 lt!80804)))))

(assert (=> d!50523 (= (contains!954 (toList!909 lt!80804) (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80885)))

(declare-fun b!154234 () Bool)

(declare-fun e!100770 () Bool)

(assert (=> b!154234 (= e!100769 e!100770)))

(declare-fun res!72801 () Bool)

(assert (=> b!154234 (=> res!72801 e!100770)))

(assert (=> b!154234 (= res!72801 (= (h!2412 (toList!909 lt!80804)) (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154235 () Bool)

(assert (=> b!154235 (= e!100770 (contains!954 (t!6592 (toList!909 lt!80804)) (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50523 res!72802) b!154234))

(assert (= (and b!154234 (not res!72801)) b!154235))

(declare-fun m!187607 () Bool)

(assert (=> d!50523 m!187607))

(declare-fun m!187609 () Bool)

(assert (=> d!50523 m!187609))

(declare-fun m!187611 () Bool)

(assert (=> b!154235 m!187611))

(assert (=> b!154094 d!50523))

(declare-fun b!154236 () Bool)

(declare-fun e!100776 () Bool)

(declare-fun e!100771 () Bool)

(assert (=> b!154236 (= e!100776 e!100771)))

(declare-fun c!29542 () Bool)

(declare-fun e!100773 () Bool)

(assert (=> b!154236 (= c!29542 e!100773)))

(declare-fun res!72803 () Bool)

(assert (=> b!154236 (=> (not res!72803) (not e!100773))))

(assert (=> b!154236 (= res!72803 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154237 () Bool)

(declare-fun e!100772 () Bool)

(assert (=> b!154237 (= e!100771 e!100772)))

(assert (=> b!154237 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun lt!80891 () ListLongMap!1787)

(declare-fun res!72806 () Bool)

(assert (=> b!154237 (= res!72806 (contains!953 lt!80891 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!154237 (=> (not res!72806) (not e!100772))))

(declare-fun b!154238 () Bool)

(declare-fun e!100774 () ListLongMap!1787)

(declare-fun call!17159 () ListLongMap!1787)

(assert (=> b!154238 (= e!100774 call!17159)))

(declare-fun b!154239 () Bool)

(declare-fun e!100777 () Bool)

(assert (=> b!154239 (= e!100777 (isEmpty!434 lt!80891))))

(declare-fun b!154240 () Bool)

(assert (=> b!154240 (= e!100773 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!154240 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!154241 () Bool)

(assert (=> b!154241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154241 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154241 (= e!100772 (= (apply!128 lt!80891 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154242 () Bool)

(declare-fun res!72804 () Bool)

(assert (=> b!154242 (=> (not res!72804) (not e!100776))))

(assert (=> b!154242 (= res!72804 (not (contains!953 lt!80891 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154243 () Bool)

(declare-fun e!100775 () ListLongMap!1787)

(assert (=> b!154243 (= e!100775 e!100774)))

(declare-fun c!29544 () Bool)

(assert (=> b!154243 (= c!29544 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun d!50525 () Bool)

(assert (=> d!50525 e!100776))

(declare-fun res!72805 () Bool)

(assert (=> d!50525 (=> (not res!72805) (not e!100776))))

(assert (=> d!50525 (= res!72805 (not (contains!953 lt!80891 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50525 (= lt!80891 e!100775)))

(declare-fun c!29543 () Bool)

(assert (=> d!50525 (= c!29543 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50525 (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992))))))

(assert (=> d!50525 (= (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) lt!80891)))

(declare-fun b!154244 () Bool)

(assert (=> b!154244 (= e!100771 e!100777)))

(declare-fun c!29545 () Bool)

(assert (=> b!154244 (= c!29545 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154245 () Bool)

(declare-fun lt!80888 () Unit!4887)

(declare-fun lt!80890 () Unit!4887)

(assert (=> b!154245 (= lt!80888 lt!80890)))

(declare-fun lt!80886 () (_ BitVec 64))

(declare-fun lt!80887 () ListLongMap!1787)

(declare-fun lt!80892 () (_ BitVec 64))

(declare-fun lt!80889 () V!3681)

(assert (=> b!154245 (not (contains!953 (+!181 lt!80887 (tuple2!2801 lt!80892 lt!80889)) lt!80886))))

(assert (=> b!154245 (= lt!80890 (addStillNotContains!71 lt!80887 lt!80892 lt!80889 lt!80886))))

(assert (=> b!154245 (= lt!80886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154245 (= lt!80889 (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154245 (= lt!80892 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!154245 (= lt!80887 call!17159)))

(assert (=> b!154245 (= e!100774 (+!181 call!17159 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!17156 () Bool)

(assert (=> bm!17156 (= call!17159 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154246 () Bool)

(assert (=> b!154246 (= e!100775 (ListLongMap!1788 Nil!1804))))

(declare-fun b!154247 () Bool)

(assert (=> b!154247 (= e!100777 (= lt!80891 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50525 c!29543) b!154246))

(assert (= (and d!50525 (not c!29543)) b!154243))

(assert (= (and b!154243 c!29544) b!154245))

(assert (= (and b!154243 (not c!29544)) b!154238))

(assert (= (or b!154245 b!154238) bm!17156))

(assert (= (and d!50525 res!72805) b!154242))

(assert (= (and b!154242 res!72804) b!154236))

(assert (= (and b!154236 res!72803) b!154240))

(assert (= (and b!154236 c!29542) b!154237))

(assert (= (and b!154236 (not c!29542)) b!154244))

(assert (= (and b!154237 res!72806) b!154241))

(assert (= (and b!154244 c!29545) b!154247))

(assert (= (and b!154244 (not c!29545)) b!154239))

(declare-fun b_lambda!6845 () Bool)

(assert (=> (not b_lambda!6845) (not b!154241)))

(assert (=> b!154241 t!6596))

(declare-fun b_and!9593 () Bool)

(assert (= b_and!9589 (and (=> t!6596 result!4481) b_and!9593)))

(assert (=> b!154241 t!6598))

(declare-fun b_and!9595 () Bool)

(assert (= b_and!9591 (and (=> t!6598 result!4485) b_and!9595)))

(declare-fun b_lambda!6847 () Bool)

(assert (=> (not b_lambda!6847) (not b!154245)))

(assert (=> b!154245 t!6596))

(declare-fun b_and!9597 () Bool)

(assert (= b_and!9593 (and (=> t!6596 result!4481) b_and!9597)))

(assert (=> b!154245 t!6598))

(declare-fun b_and!9599 () Bool)

(assert (= b_and!9595 (and (=> t!6598 result!4485) b_and!9599)))

(declare-fun m!187613 () Bool)

(assert (=> bm!17156 m!187613))

(declare-fun m!187615 () Bool)

(assert (=> b!154245 m!187615))

(declare-fun m!187617 () Bool)

(assert (=> b!154245 m!187617))

(assert (=> b!154245 m!187233))

(declare-fun m!187619 () Bool)

(assert (=> b!154245 m!187619))

(declare-fun m!187621 () Bool)

(assert (=> b!154245 m!187621))

(declare-fun m!187623 () Bool)

(assert (=> b!154245 m!187623))

(declare-fun m!187625 () Bool)

(assert (=> b!154245 m!187625))

(assert (=> b!154245 m!187623))

(assert (=> b!154245 m!187233))

(declare-fun m!187627 () Bool)

(assert (=> b!154245 m!187627))

(assert (=> b!154245 m!187617))

(declare-fun m!187629 () Bool)

(assert (=> b!154242 m!187629))

(assert (=> b!154237 m!187615))

(assert (=> b!154237 m!187615))

(declare-fun m!187631 () Bool)

(assert (=> b!154237 m!187631))

(assert (=> b!154243 m!187615))

(assert (=> b!154243 m!187615))

(declare-fun m!187633 () Bool)

(assert (=> b!154243 m!187633))

(assert (=> b!154241 m!187615))

(assert (=> b!154241 m!187617))

(assert (=> b!154241 m!187233))

(assert (=> b!154241 m!187619))

(assert (=> b!154241 m!187233))

(assert (=> b!154241 m!187617))

(assert (=> b!154241 m!187615))

(declare-fun m!187635 () Bool)

(assert (=> b!154241 m!187635))

(declare-fun m!187637 () Bool)

(assert (=> b!154239 m!187637))

(declare-fun m!187639 () Bool)

(assert (=> d!50525 m!187639))

(assert (=> d!50525 m!187277))

(assert (=> b!154247 m!187613))

(assert (=> b!154240 m!187615))

(assert (=> b!154240 m!187615))

(assert (=> b!154240 m!187633))

(assert (=> b!154070 d!50525))

(declare-fun d!50527 () Bool)

(declare-fun e!100779 () Bool)

(assert (=> d!50527 e!100779))

(declare-fun res!72807 () Bool)

(assert (=> d!50527 (=> res!72807 e!100779)))

(declare-fun lt!80895 () Bool)

(assert (=> d!50527 (= res!72807 (not lt!80895))))

(declare-fun lt!80893 () Bool)

(assert (=> d!50527 (= lt!80895 lt!80893)))

(declare-fun lt!80896 () Unit!4887)

(declare-fun e!100778 () Unit!4887)

(assert (=> d!50527 (= lt!80896 e!100778)))

(declare-fun c!29546 () Bool)

(assert (=> d!50527 (= c!29546 lt!80893)))

(assert (=> d!50527 (= lt!80893 (containsKey!185 (toList!909 lt!80845) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50527 (= (contains!953 lt!80845 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80895)))

(declare-fun b!154248 () Bool)

(declare-fun lt!80894 () Unit!4887)

(assert (=> b!154248 (= e!100778 lt!80894)))

(assert (=> b!154248 (= lt!80894 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80845) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> b!154248 (isDefined!135 (getValueByKey!181 (toList!909 lt!80845) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154249 () Bool)

(declare-fun Unit!4896 () Unit!4887)

(assert (=> b!154249 (= e!100778 Unit!4896)))

(declare-fun b!154250 () Bool)

(assert (=> b!154250 (= e!100779 (isDefined!135 (getValueByKey!181 (toList!909 lt!80845) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50527 c!29546) b!154248))

(assert (= (and d!50527 (not c!29546)) b!154249))

(assert (= (and d!50527 (not res!72807)) b!154250))

(declare-fun m!187641 () Bool)

(assert (=> d!50527 m!187641))

(declare-fun m!187643 () Bool)

(assert (=> b!154248 m!187643))

(assert (=> b!154248 m!187523))

(assert (=> b!154248 m!187523))

(declare-fun m!187645 () Bool)

(assert (=> b!154248 m!187645))

(assert (=> b!154250 m!187523))

(assert (=> b!154250 m!187523))

(assert (=> b!154250 m!187645))

(assert (=> d!50507 d!50527))

(declare-fun d!50529 () Bool)

(declare-fun c!29547 () Bool)

(assert (=> d!50529 (= c!29547 (and ((_ is Cons!1803) lt!80847) (= (_1!1411 (h!2412 lt!80847)) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100780 () Option!187)

(assert (=> d!50529 (= (getValueByKey!181 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100780)))

(declare-fun b!154252 () Bool)

(declare-fun e!100781 () Option!187)

(assert (=> b!154252 (= e!100780 e!100781)))

(declare-fun c!29548 () Bool)

(assert (=> b!154252 (= c!29548 (and ((_ is Cons!1803) lt!80847) (not (= (_1!1411 (h!2412 lt!80847)) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154251 () Bool)

(assert (=> b!154251 (= e!100780 (Some!186 (_2!1411 (h!2412 lt!80847))))))

(declare-fun b!154253 () Bool)

(assert (=> b!154253 (= e!100781 (getValueByKey!181 (t!6592 lt!80847) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154254 () Bool)

(assert (=> b!154254 (= e!100781 None!185)))

(assert (= (and d!50529 c!29547) b!154251))

(assert (= (and d!50529 (not c!29547)) b!154252))

(assert (= (and b!154252 c!29548) b!154253))

(assert (= (and b!154252 (not c!29548)) b!154254))

(declare-fun m!187647 () Bool)

(assert (=> b!154253 m!187647))

(assert (=> d!50507 d!50529))

(declare-fun d!50531 () Bool)

(assert (=> d!50531 (= (getValueByKey!181 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80899 () Unit!4887)

(declare-fun choose!926 (List!1807 (_ BitVec 64) V!3681) Unit!4887)

(assert (=> d!50531 (= lt!80899 (choose!926 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun e!100784 () Bool)

(assert (=> d!50531 e!100784))

(declare-fun res!72812 () Bool)

(assert (=> d!50531 (=> (not res!72812) (not e!100784))))

(declare-fun isStrictlySorted!325 (List!1807) Bool)

(assert (=> d!50531 (= res!72812 (isStrictlySorted!325 lt!80847))))

(assert (=> d!50531 (= (lemmaContainsTupThenGetReturnValue!97 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80899)))

(declare-fun b!154259 () Bool)

(declare-fun res!72813 () Bool)

(assert (=> b!154259 (=> (not res!72813) (not e!100784))))

(assert (=> b!154259 (= res!72813 (containsKey!185 lt!80847 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154260 () Bool)

(assert (=> b!154260 (= e!100784 (contains!954 lt!80847 (tuple2!2801 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50531 res!72812) b!154259))

(assert (= (and b!154259 res!72813) b!154260))

(assert (=> d!50531 m!187517))

(declare-fun m!187649 () Bool)

(assert (=> d!50531 m!187649))

(declare-fun m!187651 () Bool)

(assert (=> d!50531 m!187651))

(declare-fun m!187653 () Bool)

(assert (=> b!154259 m!187653))

(declare-fun m!187655 () Bool)

(assert (=> b!154260 m!187655))

(assert (=> d!50507 d!50531))

(declare-fun b!154281 () Bool)

(declare-fun e!100795 () List!1807)

(declare-fun call!17168 () List!1807)

(assert (=> b!154281 (= e!100795 call!17168)))

(declare-fun b!154282 () Bool)

(declare-fun e!100799 () List!1807)

(assert (=> b!154282 (= e!100799 (insertStrictlySorted!100 (t!6592 (toList!909 call!17130)) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154283 () Bool)

(declare-fun c!29559 () Bool)

(assert (=> b!154283 (= c!29559 (and ((_ is Cons!1803) (toList!909 call!17130)) (bvsgt (_1!1411 (h!2412 (toList!909 call!17130))) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100796 () List!1807)

(assert (=> b!154283 (= e!100796 e!100795)))

(declare-fun b!154284 () Bool)

(declare-fun e!100797 () List!1807)

(declare-fun call!17167 () List!1807)

(assert (=> b!154284 (= e!100797 call!17167)))

(declare-fun b!154285 () Bool)

(declare-fun e!100798 () Bool)

(declare-fun lt!80902 () List!1807)

(assert (=> b!154285 (= e!100798 (contains!954 lt!80902 (tuple2!2801 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154286 () Bool)

(assert (=> b!154286 (= e!100797 e!100796)))

(declare-fun c!29560 () Bool)

(assert (=> b!154286 (= c!29560 (and ((_ is Cons!1803) (toList!909 call!17130)) (= (_1!1411 (h!2412 (toList!909 call!17130))) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun bm!17163 () Bool)

(declare-fun call!17166 () List!1807)

(assert (=> bm!17163 (= call!17168 call!17166)))

(declare-fun bm!17164 () Bool)

(assert (=> bm!17164 (= call!17166 call!17167)))

(declare-fun d!50533 () Bool)

(assert (=> d!50533 e!100798))

(declare-fun res!72819 () Bool)

(assert (=> d!50533 (=> (not res!72819) (not e!100798))))

(assert (=> d!50533 (= res!72819 (isStrictlySorted!325 lt!80902))))

(assert (=> d!50533 (= lt!80902 e!100797)))

(declare-fun c!29558 () Bool)

(assert (=> d!50533 (= c!29558 (and ((_ is Cons!1803) (toList!909 call!17130)) (bvslt (_1!1411 (h!2412 (toList!909 call!17130))) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50533 (isStrictlySorted!325 (toList!909 call!17130))))

(assert (=> d!50533 (= (insertStrictlySorted!100 (toList!909 call!17130) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80902)))

(declare-fun b!154287 () Bool)

(declare-fun res!72818 () Bool)

(assert (=> b!154287 (=> (not res!72818) (not e!100798))))

(assert (=> b!154287 (= res!72818 (containsKey!185 lt!80902 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun bm!17165 () Bool)

(declare-fun $colon$colon!95 (List!1807 tuple2!2800) List!1807)

(assert (=> bm!17165 (= call!17167 ($colon$colon!95 e!100799 (ite c!29558 (h!2412 (toList!909 call!17130)) (tuple2!2801 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun c!29557 () Bool)

(assert (=> bm!17165 (= c!29557 c!29558)))

(declare-fun b!154288 () Bool)

(assert (=> b!154288 (= e!100795 call!17168)))

(declare-fun b!154289 () Bool)

(assert (=> b!154289 (= e!100796 call!17166)))

(declare-fun b!154290 () Bool)

(assert (=> b!154290 (= e!100799 (ite c!29560 (t!6592 (toList!909 call!17130)) (ite c!29559 (Cons!1803 (h!2412 (toList!909 call!17130)) (t!6592 (toList!909 call!17130))) Nil!1804)))))

(assert (= (and d!50533 c!29558) b!154284))

(assert (= (and d!50533 (not c!29558)) b!154286))

(assert (= (and b!154286 c!29560) b!154289))

(assert (= (and b!154286 (not c!29560)) b!154283))

(assert (= (and b!154283 c!29559) b!154281))

(assert (= (and b!154283 (not c!29559)) b!154288))

(assert (= (or b!154281 b!154288) bm!17163))

(assert (= (or b!154289 bm!17163) bm!17164))

(assert (= (or b!154284 bm!17164) bm!17165))

(assert (= (and bm!17165 c!29557) b!154282))

(assert (= (and bm!17165 (not c!29557)) b!154290))

(assert (= (and d!50533 res!72819) b!154287))

(assert (= (and b!154287 res!72818) b!154285))

(declare-fun m!187657 () Bool)

(assert (=> d!50533 m!187657))

(declare-fun m!187659 () Bool)

(assert (=> d!50533 m!187659))

(declare-fun m!187661 () Bool)

(assert (=> b!154287 m!187661))

(declare-fun m!187663 () Bool)

(assert (=> b!154282 m!187663))

(declare-fun m!187665 () Bool)

(assert (=> b!154285 m!187665))

(declare-fun m!187667 () Bool)

(assert (=> bm!17165 m!187667))

(assert (=> d!50507 d!50533))

(declare-fun lt!80903 () Bool)

(declare-fun d!50535 () Bool)

(assert (=> d!50535 (= lt!80903 (select (content!145 (toList!909 lt!80782)) (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun e!100800 () Bool)

(assert (=> d!50535 (= lt!80903 e!100800)))

(declare-fun res!72821 () Bool)

(assert (=> d!50535 (=> (not res!72821) (not e!100800))))

(assert (=> d!50535 (= res!72821 ((_ is Cons!1803) (toList!909 lt!80782)))))

(assert (=> d!50535 (= (contains!954 (toList!909 lt!80782) (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80903)))

(declare-fun b!154291 () Bool)

(declare-fun e!100801 () Bool)

(assert (=> b!154291 (= e!100800 e!100801)))

(declare-fun res!72820 () Bool)

(assert (=> b!154291 (=> res!72820 e!100801)))

(assert (=> b!154291 (= res!72820 (= (h!2412 (toList!909 lt!80782)) (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154292 () Bool)

(assert (=> b!154292 (= e!100801 (contains!954 (t!6592 (toList!909 lt!80782)) (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50535 res!72821) b!154291))

(assert (= (and b!154291 (not res!72820)) b!154292))

(declare-fun m!187669 () Bool)

(assert (=> d!50535 m!187669))

(declare-fun m!187671 () Bool)

(assert (=> d!50535 m!187671))

(declare-fun m!187673 () Bool)

(assert (=> b!154292 m!187673))

(assert (=> b!154079 d!50535))

(declare-fun d!50537 () Bool)

(assert (=> d!50537 (= (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154159 d!50537))

(declare-fun d!50539 () Bool)

(assert (=> d!50539 (= (apply!128 (+!181 lt!80830 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80819) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80830 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80819)))))

(declare-fun bs!6502 () Bool)

(assert (= bs!6502 d!50539))

(declare-fun m!187675 () Bool)

(assert (=> bs!6502 m!187675))

(assert (=> bs!6502 m!187675))

(declare-fun m!187677 () Bool)

(assert (=> bs!6502 m!187677))

(assert (=> b!154111 d!50539))

(declare-fun d!50541 () Bool)

(assert (=> d!50541 (= (apply!128 (+!181 lt!80830 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80819) (apply!128 lt!80830 lt!80819))))

(declare-fun lt!80904 () Unit!4887)

(assert (=> d!50541 (= lt!80904 (choose!924 lt!80830 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80819))))

(declare-fun e!100802 () Bool)

(assert (=> d!50541 e!100802))

(declare-fun res!72822 () Bool)

(assert (=> d!50541 (=> (not res!72822) (not e!100802))))

(assert (=> d!50541 (= res!72822 (contains!953 lt!80830 lt!80819))))

(assert (=> d!50541 (= (addApplyDifferent!104 lt!80830 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80819) lt!80904)))

(declare-fun b!154293 () Bool)

(assert (=> b!154293 (= e!100802 (not (= lt!80819 lt!80826)))))

(assert (= (and d!50541 res!72822) b!154293))

(assert (=> d!50541 m!187445))

(assert (=> d!50541 m!187443))

(declare-fun m!187679 () Bool)

(assert (=> d!50541 m!187679))

(declare-fun m!187681 () Bool)

(assert (=> d!50541 m!187681))

(assert (=> d!50541 m!187445))

(assert (=> d!50541 m!187447))

(assert (=> b!154111 d!50541))

(declare-fun d!50543 () Bool)

(declare-fun e!100803 () Bool)

(assert (=> d!50543 e!100803))

(declare-fun res!72824 () Bool)

(assert (=> d!50543 (=> (not res!72824) (not e!100803))))

(declare-fun lt!80906 () ListLongMap!1787)

(assert (=> d!50543 (= res!72824 (contains!953 lt!80906 (_1!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80908 () List!1807)

(assert (=> d!50543 (= lt!80906 (ListLongMap!1788 lt!80908))))

(declare-fun lt!80907 () Unit!4887)

(declare-fun lt!80905 () Unit!4887)

(assert (=> d!50543 (= lt!80907 lt!80905)))

(assert (=> d!50543 (= (getValueByKey!181 lt!80908 (_1!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50543 (= lt!80905 (lemmaContainsTupThenGetReturnValue!97 lt!80908 (_1!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50543 (= lt!80908 (insertStrictlySorted!100 (toList!909 lt!80830) (_1!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50543 (= (+!181 lt!80830 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80906)))

(declare-fun b!154294 () Bool)

(declare-fun res!72823 () Bool)

(assert (=> b!154294 (=> (not res!72823) (not e!100803))))

(assert (=> b!154294 (= res!72823 (= (getValueByKey!181 (toList!909 lt!80906) (_1!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154295 () Bool)

(assert (=> b!154295 (= e!100803 (contains!954 (toList!909 lt!80906) (tuple2!2801 lt!80826 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50543 res!72824) b!154294))

(assert (= (and b!154294 res!72823) b!154295))

(declare-fun m!187683 () Bool)

(assert (=> d!50543 m!187683))

(declare-fun m!187685 () Bool)

(assert (=> d!50543 m!187685))

(declare-fun m!187687 () Bool)

(assert (=> d!50543 m!187687))

(declare-fun m!187689 () Bool)

(assert (=> d!50543 m!187689))

(declare-fun m!187691 () Bool)

(assert (=> b!154294 m!187691))

(declare-fun m!187693 () Bool)

(assert (=> b!154295 m!187693))

(assert (=> b!154111 d!50543))

(declare-fun d!50545 () Bool)

(assert (=> d!50545 (= (apply!128 lt!80815 lt!80821) (get!1603 (getValueByKey!181 (toList!909 lt!80815) lt!80821)))))

(declare-fun bs!6503 () Bool)

(assert (= bs!6503 d!50545))

(declare-fun m!187695 () Bool)

(assert (=> bs!6503 m!187695))

(assert (=> bs!6503 m!187695))

(declare-fun m!187697 () Bool)

(assert (=> bs!6503 m!187697))

(assert (=> b!154111 d!50545))

(declare-fun d!50547 () Bool)

(declare-fun e!100804 () Bool)

(assert (=> d!50547 e!100804))

(declare-fun res!72826 () Bool)

(assert (=> d!50547 (=> (not res!72826) (not e!100804))))

(declare-fun lt!80910 () ListLongMap!1787)

(assert (=> d!50547 (= res!72826 (contains!953 lt!80910 (_1!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80912 () List!1807)

(assert (=> d!50547 (= lt!80910 (ListLongMap!1788 lt!80912))))

(declare-fun lt!80911 () Unit!4887)

(declare-fun lt!80909 () Unit!4887)

(assert (=> d!50547 (= lt!80911 lt!80909)))

(assert (=> d!50547 (= (getValueByKey!181 lt!80912 (_1!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50547 (= lt!80909 (lemmaContainsTupThenGetReturnValue!97 lt!80912 (_1!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50547 (= lt!80912 (insertStrictlySorted!100 (toList!909 lt!80825) (_1!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50547 (= (+!181 lt!80825 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80910)))

(declare-fun b!154296 () Bool)

(declare-fun res!72825 () Bool)

(assert (=> b!154296 (=> (not res!72825) (not e!100804))))

(assert (=> b!154296 (= res!72825 (= (getValueByKey!181 (toList!909 lt!80910) (_1!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154297 () Bool)

(assert (=> b!154297 (= e!100804 (contains!954 (toList!909 lt!80910) (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50547 res!72826) b!154296))

(assert (= (and b!154296 res!72825) b!154297))

(declare-fun m!187699 () Bool)

(assert (=> d!50547 m!187699))

(declare-fun m!187701 () Bool)

(assert (=> d!50547 m!187701))

(declare-fun m!187703 () Bool)

(assert (=> d!50547 m!187703))

(declare-fun m!187705 () Bool)

(assert (=> d!50547 m!187705))

(declare-fun m!187707 () Bool)

(assert (=> b!154296 m!187707))

(declare-fun m!187709 () Bool)

(assert (=> b!154297 m!187709))

(assert (=> b!154111 d!50547))

(declare-fun d!50549 () Bool)

(assert (=> d!50549 (= (apply!128 (+!181 lt!80825 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80829) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80825 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80829)))))

(declare-fun bs!6504 () Bool)

(assert (= bs!6504 d!50549))

(declare-fun m!187711 () Bool)

(assert (=> bs!6504 m!187711))

(assert (=> bs!6504 m!187711))

(declare-fun m!187713 () Bool)

(assert (=> bs!6504 m!187713))

(assert (=> b!154111 d!50549))

(declare-fun d!50551 () Bool)

(assert (=> d!50551 (= (apply!128 lt!80830 lt!80819) (get!1603 (getValueByKey!181 (toList!909 lt!80830) lt!80819)))))

(declare-fun bs!6505 () Bool)

(assert (= bs!6505 d!50551))

(declare-fun m!187715 () Bool)

(assert (=> bs!6505 m!187715))

(assert (=> bs!6505 m!187715))

(declare-fun m!187717 () Bool)

(assert (=> bs!6505 m!187717))

(assert (=> b!154111 d!50551))

(declare-fun d!50553 () Bool)

(declare-fun e!100806 () Bool)

(assert (=> d!50553 e!100806))

(declare-fun res!72827 () Bool)

(assert (=> d!50553 (=> res!72827 e!100806)))

(declare-fun lt!80915 () Bool)

(assert (=> d!50553 (= res!72827 (not lt!80915))))

(declare-fun lt!80913 () Bool)

(assert (=> d!50553 (= lt!80915 lt!80913)))

(declare-fun lt!80916 () Unit!4887)

(declare-fun e!100805 () Unit!4887)

(assert (=> d!50553 (= lt!80916 e!100805)))

(declare-fun c!29561 () Bool)

(assert (=> d!50553 (= c!29561 lt!80913)))

(assert (=> d!50553 (= lt!80913 (containsKey!185 (toList!909 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80827))))

(assert (=> d!50553 (= (contains!953 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80827) lt!80915)))

(declare-fun b!154298 () Bool)

(declare-fun lt!80914 () Unit!4887)

(assert (=> b!154298 (= e!100805 lt!80914)))

(assert (=> b!154298 (= lt!80914 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80827))))

(assert (=> b!154298 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80827))))

(declare-fun b!154299 () Bool)

(declare-fun Unit!4897 () Unit!4887)

(assert (=> b!154299 (= e!100805 Unit!4897)))

(declare-fun b!154300 () Bool)

(assert (=> b!154300 (= e!100806 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80827)))))

(assert (= (and d!50553 c!29561) b!154298))

(assert (= (and d!50553 (not c!29561)) b!154299))

(assert (= (and d!50553 (not res!72827)) b!154300))

(declare-fun m!187719 () Bool)

(assert (=> d!50553 m!187719))

(declare-fun m!187721 () Bool)

(assert (=> b!154298 m!187721))

(declare-fun m!187723 () Bool)

(assert (=> b!154298 m!187723))

(assert (=> b!154298 m!187723))

(declare-fun m!187725 () Bool)

(assert (=> b!154298 m!187725))

(assert (=> b!154300 m!187723))

(assert (=> b!154300 m!187723))

(assert (=> b!154300 m!187725))

(assert (=> b!154111 d!50553))

(declare-fun d!50555 () Bool)

(assert (=> d!50555 (= (apply!128 (+!181 lt!80825 (tuple2!2801 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80829) (apply!128 lt!80825 lt!80829))))

(declare-fun lt!80917 () Unit!4887)

(assert (=> d!50555 (= lt!80917 (choose!924 lt!80825 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80829))))

(declare-fun e!100807 () Bool)

(assert (=> d!50555 e!100807))

(declare-fun res!72828 () Bool)

(assert (=> d!50555 (=> (not res!72828) (not e!100807))))

(assert (=> d!50555 (= res!72828 (contains!953 lt!80825 lt!80829))))

(assert (=> d!50555 (= (addApplyDifferent!104 lt!80825 lt!80824 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80829) lt!80917)))

(declare-fun b!154301 () Bool)

(assert (=> b!154301 (= e!100807 (not (= lt!80829 lt!80824)))))

(assert (= (and d!50555 res!72828) b!154301))

(assert (=> d!50555 m!187439))

(assert (=> d!50555 m!187465))

(declare-fun m!187727 () Bool)

(assert (=> d!50555 m!187727))

(declare-fun m!187729 () Bool)

(assert (=> d!50555 m!187729))

(assert (=> d!50555 m!187439))

(assert (=> d!50555 m!187441))

(assert (=> b!154111 d!50555))

(declare-fun d!50557 () Bool)

(assert (=> d!50557 (contains!953 (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80827)))

(declare-fun lt!80918 () Unit!4887)

(assert (=> d!50557 (= lt!80918 (choose!925 lt!80811 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80827))))

(assert (=> d!50557 (contains!953 lt!80811 lt!80827)))

(assert (=> d!50557 (= (addStillContains!104 lt!80811 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80827) lt!80918)))

(declare-fun bs!6506 () Bool)

(assert (= bs!6506 d!50557))

(assert (=> bs!6506 m!187451))

(assert (=> bs!6506 m!187451))

(assert (=> bs!6506 m!187453))

(declare-fun m!187731 () Bool)

(assert (=> bs!6506 m!187731))

(declare-fun m!187733 () Bool)

(assert (=> bs!6506 m!187733))

(assert (=> b!154111 d!50557))

(declare-fun d!50559 () Bool)

(declare-fun e!100808 () Bool)

(assert (=> d!50559 e!100808))

(declare-fun res!72830 () Bool)

(assert (=> d!50559 (=> (not res!72830) (not e!100808))))

(declare-fun lt!80920 () ListLongMap!1787)

(assert (=> d!50559 (= res!72830 (contains!953 lt!80920 (_1!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80922 () List!1807)

(assert (=> d!50559 (= lt!80920 (ListLongMap!1788 lt!80922))))

(declare-fun lt!80921 () Unit!4887)

(declare-fun lt!80919 () Unit!4887)

(assert (=> d!50559 (= lt!80921 lt!80919)))

(assert (=> d!50559 (= (getValueByKey!181 lt!80922 (_1!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50559 (= lt!80919 (lemmaContainsTupThenGetReturnValue!97 lt!80922 (_1!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50559 (= lt!80922 (insertStrictlySorted!100 (toList!909 lt!80815) (_1!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50559 (= (+!181 lt!80815 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80920)))

(declare-fun b!154302 () Bool)

(declare-fun res!72829 () Bool)

(assert (=> b!154302 (=> (not res!72829) (not e!100808))))

(assert (=> b!154302 (= res!72829 (= (getValueByKey!181 (toList!909 lt!80920) (_1!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154303 () Bool)

(assert (=> b!154303 (= e!100808 (contains!954 (toList!909 lt!80920) (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50559 res!72830) b!154302))

(assert (= (and b!154302 res!72829) b!154303))

(declare-fun m!187735 () Bool)

(assert (=> d!50559 m!187735))

(declare-fun m!187737 () Bool)

(assert (=> d!50559 m!187737))

(declare-fun m!187739 () Bool)

(assert (=> d!50559 m!187739))

(declare-fun m!187741 () Bool)

(assert (=> d!50559 m!187741))

(declare-fun m!187743 () Bool)

(assert (=> b!154302 m!187743))

(declare-fun m!187745 () Bool)

(assert (=> b!154303 m!187745))

(assert (=> b!154111 d!50559))

(declare-fun b!154304 () Bool)

(declare-fun e!100814 () Bool)

(declare-fun e!100809 () Bool)

(assert (=> b!154304 (= e!100814 e!100809)))

(declare-fun c!29562 () Bool)

(declare-fun e!100811 () Bool)

(assert (=> b!154304 (= c!29562 e!100811)))

(declare-fun res!72831 () Bool)

(assert (=> b!154304 (=> (not res!72831) (not e!100811))))

(assert (=> b!154304 (= res!72831 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154305 () Bool)

(declare-fun e!100810 () Bool)

(assert (=> b!154305 (= e!100809 e!100810)))

(assert (=> b!154305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun res!72834 () Bool)

(declare-fun lt!80928 () ListLongMap!1787)

(assert (=> b!154305 (= res!72834 (contains!953 lt!80928 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154305 (=> (not res!72834) (not e!100810))))

(declare-fun b!154306 () Bool)

(declare-fun e!100812 () ListLongMap!1787)

(declare-fun call!17169 () ListLongMap!1787)

(assert (=> b!154306 (= e!100812 call!17169)))

(declare-fun b!154307 () Bool)

(declare-fun e!100815 () Bool)

(assert (=> b!154307 (= e!100815 (isEmpty!434 lt!80928))))

(declare-fun b!154308 () Bool)

(assert (=> b!154308 (= e!100811 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154308 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!154309 () Bool)

(assert (=> b!154309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> b!154309 (= e!100810 (= (apply!128 lt!80928 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154310 () Bool)

(declare-fun res!72832 () Bool)

(assert (=> b!154310 (=> (not res!72832) (not e!100814))))

(assert (=> b!154310 (= res!72832 (not (contains!953 lt!80928 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154311 () Bool)

(declare-fun e!100813 () ListLongMap!1787)

(assert (=> b!154311 (= e!100813 e!100812)))

(declare-fun c!29564 () Bool)

(assert (=> b!154311 (= c!29564 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!50561 () Bool)

(assert (=> d!50561 e!100814))

(declare-fun res!72833 () Bool)

(assert (=> d!50561 (=> (not res!72833) (not e!100814))))

(assert (=> d!50561 (= res!72833 (not (contains!953 lt!80928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50561 (= lt!80928 e!100813)))

(declare-fun c!29563 () Bool)

(assert (=> d!50561 (= c!29563 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50561 (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992))))))

(assert (=> d!50561 (= (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))) lt!80928)))

(declare-fun b!154312 () Bool)

(assert (=> b!154312 (= e!100809 e!100815)))

(declare-fun c!29565 () Bool)

(assert (=> b!154312 (= c!29565 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154313 () Bool)

(declare-fun lt!80925 () Unit!4887)

(declare-fun lt!80927 () Unit!4887)

(assert (=> b!154313 (= lt!80925 lt!80927)))

(declare-fun lt!80926 () V!3681)

(declare-fun lt!80923 () (_ BitVec 64))

(declare-fun lt!80924 () ListLongMap!1787)

(declare-fun lt!80929 () (_ BitVec 64))

(assert (=> b!154313 (not (contains!953 (+!181 lt!80924 (tuple2!2801 lt!80929 lt!80926)) lt!80923))))

(assert (=> b!154313 (= lt!80927 (addStillNotContains!71 lt!80924 lt!80929 lt!80926 lt!80923))))

(assert (=> b!154313 (= lt!80923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154313 (= lt!80926 (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154313 (= lt!80929 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!154313 (= lt!80924 call!17169)))

(assert (=> b!154313 (= e!100812 (+!181 call!17169 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!17166 () Bool)

(assert (=> bm!17166 (= call!17169 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154314 () Bool)

(assert (=> b!154314 (= e!100813 (ListLongMap!1788 Nil!1804))))

(declare-fun b!154315 () Bool)

(assert (=> b!154315 (= e!100815 (= lt!80928 (getCurrentListMapNoExtraKeys!149 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (_values!3046 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992))) (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) (minValue!2906 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50561 c!29563) b!154314))

(assert (= (and d!50561 (not c!29563)) b!154311))

(assert (= (and b!154311 c!29564) b!154313))

(assert (= (and b!154311 (not c!29564)) b!154306))

(assert (= (or b!154313 b!154306) bm!17166))

(assert (= (and d!50561 res!72833) b!154310))

(assert (= (and b!154310 res!72832) b!154304))

(assert (= (and b!154304 res!72831) b!154308))

(assert (= (and b!154304 c!29562) b!154305))

(assert (= (and b!154304 (not c!29562)) b!154312))

(assert (= (and b!154305 res!72834) b!154309))

(assert (= (and b!154312 c!29565) b!154315))

(assert (= (and b!154312 (not c!29565)) b!154307))

(declare-fun b_lambda!6849 () Bool)

(assert (=> (not b_lambda!6849) (not b!154309)))

(assert (=> b!154309 t!6596))

(declare-fun b_and!9601 () Bool)

(assert (= b_and!9597 (and (=> t!6596 result!4481) b_and!9601)))

(assert (=> b!154309 t!6598))

(declare-fun b_and!9603 () Bool)

(assert (= b_and!9599 (and (=> t!6598 result!4485) b_and!9603)))

(declare-fun b_lambda!6851 () Bool)

(assert (=> (not b_lambda!6851) (not b!154313)))

(assert (=> b!154313 t!6596))

(declare-fun b_and!9605 () Bool)

(assert (= b_and!9601 (and (=> t!6596 result!4481) b_and!9605)))

(assert (=> b!154313 t!6598))

(declare-fun b_and!9607 () Bool)

(assert (= b_and!9603 (and (=> t!6598 result!4485) b_and!9607)))

(declare-fun m!187747 () Bool)

(assert (=> bm!17166 m!187747))

(assert (=> b!154313 m!187423))

(assert (=> b!154313 m!187431))

(assert (=> b!154313 m!187233))

(assert (=> b!154313 m!187433))

(declare-fun m!187749 () Bool)

(assert (=> b!154313 m!187749))

(declare-fun m!187751 () Bool)

(assert (=> b!154313 m!187751))

(declare-fun m!187753 () Bool)

(assert (=> b!154313 m!187753))

(assert (=> b!154313 m!187751))

(assert (=> b!154313 m!187233))

(declare-fun m!187755 () Bool)

(assert (=> b!154313 m!187755))

(assert (=> b!154313 m!187431))

(declare-fun m!187757 () Bool)

(assert (=> b!154310 m!187757))

(assert (=> b!154305 m!187423))

(assert (=> b!154305 m!187423))

(declare-fun m!187759 () Bool)

(assert (=> b!154305 m!187759))

(assert (=> b!154311 m!187423))

(assert (=> b!154311 m!187423))

(assert (=> b!154311 m!187425))

(assert (=> b!154309 m!187423))

(assert (=> b!154309 m!187431))

(assert (=> b!154309 m!187233))

(assert (=> b!154309 m!187433))

(assert (=> b!154309 m!187233))

(assert (=> b!154309 m!187431))

(assert (=> b!154309 m!187423))

(declare-fun m!187761 () Bool)

(assert (=> b!154309 m!187761))

(declare-fun m!187763 () Bool)

(assert (=> b!154307 m!187763))

(declare-fun m!187765 () Bool)

(assert (=> d!50561 m!187765))

(assert (=> d!50561 m!187277))

(assert (=> b!154315 m!187747))

(assert (=> b!154308 m!187423))

(assert (=> b!154308 m!187423))

(assert (=> b!154308 m!187425))

(assert (=> b!154111 d!50561))

(declare-fun d!50563 () Bool)

(assert (=> d!50563 (= (apply!128 (+!181 lt!80815 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80821) (apply!128 lt!80815 lt!80821))))

(declare-fun lt!80930 () Unit!4887)

(assert (=> d!50563 (= lt!80930 (choose!924 lt!80815 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80821))))

(declare-fun e!100816 () Bool)

(assert (=> d!50563 e!100816))

(declare-fun res!72835 () Bool)

(assert (=> d!50563 (=> (not res!72835) (not e!100816))))

(assert (=> d!50563 (= res!72835 (contains!953 lt!80815 lt!80821))))

(assert (=> d!50563 (= (addApplyDifferent!104 lt!80815 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80821) lt!80930)))

(declare-fun b!154316 () Bool)

(assert (=> b!154316 (= e!100816 (not (= lt!80821 lt!80816)))))

(assert (= (and d!50563 res!72835) b!154316))

(assert (=> d!50563 m!187449))

(assert (=> d!50563 m!187461))

(declare-fun m!187767 () Bool)

(assert (=> d!50563 m!187767))

(declare-fun m!187769 () Bool)

(assert (=> d!50563 m!187769))

(assert (=> d!50563 m!187449))

(assert (=> d!50563 m!187455))

(assert (=> b!154111 d!50563))

(declare-fun d!50565 () Bool)

(declare-fun e!100817 () Bool)

(assert (=> d!50565 e!100817))

(declare-fun res!72837 () Bool)

(assert (=> d!50565 (=> (not res!72837) (not e!100817))))

(declare-fun lt!80932 () ListLongMap!1787)

(assert (=> d!50565 (= res!72837 (contains!953 lt!80932 (_1!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80934 () List!1807)

(assert (=> d!50565 (= lt!80932 (ListLongMap!1788 lt!80934))))

(declare-fun lt!80933 () Unit!4887)

(declare-fun lt!80931 () Unit!4887)

(assert (=> d!50565 (= lt!80933 lt!80931)))

(assert (=> d!50565 (= (getValueByKey!181 lt!80934 (_1!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50565 (= lt!80931 (lemmaContainsTupThenGetReturnValue!97 lt!80934 (_1!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50565 (= lt!80934 (insertStrictlySorted!100 (toList!909 lt!80811) (_1!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50565 (= (+!181 lt!80811 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80932)))

(declare-fun b!154317 () Bool)

(declare-fun res!72836 () Bool)

(assert (=> b!154317 (=> (not res!72836) (not e!100817))))

(assert (=> b!154317 (= res!72836 (= (getValueByKey!181 (toList!909 lt!80932) (_1!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154318 () Bool)

(assert (=> b!154318 (= e!100817 (contains!954 (toList!909 lt!80932) (tuple2!2801 lt!80831 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50565 res!72837) b!154317))

(assert (= (and b!154317 res!72836) b!154318))

(declare-fun m!187771 () Bool)

(assert (=> d!50565 m!187771))

(declare-fun m!187773 () Bool)

(assert (=> d!50565 m!187773))

(declare-fun m!187775 () Bool)

(assert (=> d!50565 m!187775))

(declare-fun m!187777 () Bool)

(assert (=> d!50565 m!187777))

(declare-fun m!187779 () Bool)

(assert (=> b!154317 m!187779))

(declare-fun m!187781 () Bool)

(assert (=> b!154318 m!187781))

(assert (=> b!154111 d!50565))

(declare-fun d!50567 () Bool)

(assert (=> d!50567 (= (apply!128 (+!181 lt!80815 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80821) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80815 (tuple2!2801 lt!80816 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80821)))))

(declare-fun bs!6507 () Bool)

(assert (= bs!6507 d!50567))

(declare-fun m!187783 () Bool)

(assert (=> bs!6507 m!187783))

(assert (=> bs!6507 m!187783))

(declare-fun m!187785 () Bool)

(assert (=> bs!6507 m!187785))

(assert (=> b!154111 d!50567))

(declare-fun d!50569 () Bool)

(assert (=> d!50569 (= (apply!128 lt!80825 lt!80829) (get!1603 (getValueByKey!181 (toList!909 lt!80825) lt!80829)))))

(declare-fun bs!6508 () Bool)

(assert (= bs!6508 d!50569))

(declare-fun m!187787 () Bool)

(assert (=> bs!6508 m!187787))

(assert (=> bs!6508 m!187787))

(declare-fun m!187789 () Bool)

(assert (=> bs!6508 m!187789))

(assert (=> b!154111 d!50569))

(declare-fun d!50571 () Bool)

(declare-fun e!100819 () Bool)

(assert (=> d!50571 e!100819))

(declare-fun res!72838 () Bool)

(assert (=> d!50571 (=> res!72838 e!100819)))

(declare-fun lt!80937 () Bool)

(assert (=> d!50571 (= res!72838 (not lt!80937))))

(declare-fun lt!80935 () Bool)

(assert (=> d!50571 (= lt!80937 lt!80935)))

(declare-fun lt!80938 () Unit!4887)

(declare-fun e!100818 () Unit!4887)

(assert (=> d!50571 (= lt!80938 e!100818)))

(declare-fun c!29566 () Bool)

(assert (=> d!50571 (= c!29566 lt!80935)))

(assert (=> d!50571 (= lt!80935 (containsKey!185 (toList!909 lt!80786) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50571 (= (contains!953 lt!80786 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80937)))

(declare-fun b!154319 () Bool)

(declare-fun lt!80936 () Unit!4887)

(assert (=> b!154319 (= e!100818 lt!80936)))

(assert (=> b!154319 (= lt!80936 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80786) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> b!154319 (isDefined!135 (getValueByKey!181 (toList!909 lt!80786) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154320 () Bool)

(declare-fun Unit!4898 () Unit!4887)

(assert (=> b!154320 (= e!100818 Unit!4898)))

(declare-fun b!154321 () Bool)

(assert (=> b!154321 (= e!100819 (isDefined!135 (getValueByKey!181 (toList!909 lt!80786) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50571 c!29566) b!154319))

(assert (= (and d!50571 (not c!29566)) b!154320))

(assert (= (and d!50571 (not res!72838)) b!154321))

(declare-fun m!187791 () Bool)

(assert (=> d!50571 m!187791))

(declare-fun m!187793 () Bool)

(assert (=> b!154319 m!187793))

(assert (=> b!154319 m!187357))

(assert (=> b!154319 m!187357))

(declare-fun m!187795 () Bool)

(assert (=> b!154319 m!187795))

(assert (=> b!154321 m!187357))

(assert (=> b!154321 m!187357))

(assert (=> b!154321 m!187795))

(assert (=> d!50465 d!50571))

(declare-fun d!50573 () Bool)

(declare-fun c!29567 () Bool)

(assert (=> d!50573 (= c!29567 (and ((_ is Cons!1803) lt!80788) (= (_1!1411 (h!2412 lt!80788)) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100820 () Option!187)

(assert (=> d!50573 (= (getValueByKey!181 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100820)))

(declare-fun b!154323 () Bool)

(declare-fun e!100821 () Option!187)

(assert (=> b!154323 (= e!100820 e!100821)))

(declare-fun c!29568 () Bool)

(assert (=> b!154323 (= c!29568 (and ((_ is Cons!1803) lt!80788) (not (= (_1!1411 (h!2412 lt!80788)) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154322 () Bool)

(assert (=> b!154322 (= e!100820 (Some!186 (_2!1411 (h!2412 lt!80788))))))

(declare-fun b!154324 () Bool)

(assert (=> b!154324 (= e!100821 (getValueByKey!181 (t!6592 lt!80788) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154325 () Bool)

(assert (=> b!154325 (= e!100821 None!185)))

(assert (= (and d!50573 c!29567) b!154322))

(assert (= (and d!50573 (not c!29567)) b!154323))

(assert (= (and b!154323 c!29568) b!154324))

(assert (= (and b!154323 (not c!29568)) b!154325))

(declare-fun m!187797 () Bool)

(assert (=> b!154324 m!187797))

(assert (=> d!50465 d!50573))

(declare-fun d!50575 () Bool)

(assert (=> d!50575 (= (getValueByKey!181 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80939 () Unit!4887)

(assert (=> d!50575 (= lt!80939 (choose!926 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun e!100822 () Bool)

(assert (=> d!50575 e!100822))

(declare-fun res!72839 () Bool)

(assert (=> d!50575 (=> (not res!72839) (not e!100822))))

(assert (=> d!50575 (= res!72839 (isStrictlySorted!325 lt!80788))))

(assert (=> d!50575 (= (lemmaContainsTupThenGetReturnValue!97 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80939)))

(declare-fun b!154326 () Bool)

(declare-fun res!72840 () Bool)

(assert (=> b!154326 (=> (not res!72840) (not e!100822))))

(assert (=> b!154326 (= res!72840 (containsKey!185 lt!80788 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154327 () Bool)

(assert (=> b!154327 (= e!100822 (contains!954 lt!80788 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50575 res!72839) b!154326))

(assert (= (and b!154326 res!72840) b!154327))

(assert (=> d!50575 m!187351))

(declare-fun m!187799 () Bool)

(assert (=> d!50575 m!187799))

(declare-fun m!187801 () Bool)

(assert (=> d!50575 m!187801))

(declare-fun m!187803 () Bool)

(assert (=> b!154326 m!187803))

(declare-fun m!187805 () Bool)

(assert (=> b!154327 m!187805))

(assert (=> d!50465 d!50575))

(declare-fun b!154328 () Bool)

(declare-fun e!100823 () List!1807)

(declare-fun call!17172 () List!1807)

(assert (=> b!154328 (= e!100823 call!17172)))

(declare-fun b!154329 () Bool)

(declare-fun e!100827 () List!1807)

(assert (=> b!154329 (= e!100827 (insertStrictlySorted!100 (t!6592 (toList!909 lt!80734)) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154330 () Bool)

(declare-fun c!29571 () Bool)

(assert (=> b!154330 (= c!29571 (and ((_ is Cons!1803) (toList!909 lt!80734)) (bvsgt (_1!1411 (h!2412 (toList!909 lt!80734))) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100824 () List!1807)

(assert (=> b!154330 (= e!100824 e!100823)))

(declare-fun b!154331 () Bool)

(declare-fun e!100825 () List!1807)

(declare-fun call!17171 () List!1807)

(assert (=> b!154331 (= e!100825 call!17171)))

(declare-fun b!154332 () Bool)

(declare-fun e!100826 () Bool)

(declare-fun lt!80940 () List!1807)

(assert (=> b!154332 (= e!100826 (contains!954 lt!80940 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154333 () Bool)

(assert (=> b!154333 (= e!100825 e!100824)))

(declare-fun c!29572 () Bool)

(assert (=> b!154333 (= c!29572 (and ((_ is Cons!1803) (toList!909 lt!80734)) (= (_1!1411 (h!2412 (toList!909 lt!80734))) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun bm!17167 () Bool)

(declare-fun call!17170 () List!1807)

(assert (=> bm!17167 (= call!17172 call!17170)))

(declare-fun bm!17168 () Bool)

(assert (=> bm!17168 (= call!17170 call!17171)))

(declare-fun d!50577 () Bool)

(assert (=> d!50577 e!100826))

(declare-fun res!72842 () Bool)

(assert (=> d!50577 (=> (not res!72842) (not e!100826))))

(assert (=> d!50577 (= res!72842 (isStrictlySorted!325 lt!80940))))

(assert (=> d!50577 (= lt!80940 e!100825)))

(declare-fun c!29570 () Bool)

(assert (=> d!50577 (= c!29570 (and ((_ is Cons!1803) (toList!909 lt!80734)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80734))) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50577 (isStrictlySorted!325 (toList!909 lt!80734))))

(assert (=> d!50577 (= (insertStrictlySorted!100 (toList!909 lt!80734) (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80940)))

(declare-fun b!154334 () Bool)

(declare-fun res!72841 () Bool)

(assert (=> b!154334 (=> (not res!72841) (not e!100826))))

(assert (=> b!154334 (= res!72841 (containsKey!185 lt!80940 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun bm!17169 () Bool)

(assert (=> bm!17169 (= call!17171 ($colon$colon!95 e!100827 (ite c!29570 (h!2412 (toList!909 lt!80734)) (tuple2!2801 (_1!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun c!29569 () Bool)

(assert (=> bm!17169 (= c!29569 c!29570)))

(declare-fun b!154335 () Bool)

(assert (=> b!154335 (= e!100823 call!17172)))

(declare-fun b!154336 () Bool)

(assert (=> b!154336 (= e!100824 call!17170)))

(declare-fun b!154337 () Bool)

(assert (=> b!154337 (= e!100827 (ite c!29572 (t!6592 (toList!909 lt!80734)) (ite c!29571 (Cons!1803 (h!2412 (toList!909 lt!80734)) (t!6592 (toList!909 lt!80734))) Nil!1804)))))

(assert (= (and d!50577 c!29570) b!154331))

(assert (= (and d!50577 (not c!29570)) b!154333))

(assert (= (and b!154333 c!29572) b!154336))

(assert (= (and b!154333 (not c!29572)) b!154330))

(assert (= (and b!154330 c!29571) b!154328))

(assert (= (and b!154330 (not c!29571)) b!154335))

(assert (= (or b!154328 b!154335) bm!17167))

(assert (= (or b!154336 bm!17167) bm!17168))

(assert (= (or b!154331 bm!17168) bm!17169))

(assert (= (and bm!17169 c!29569) b!154329))

(assert (= (and bm!17169 (not c!29569)) b!154337))

(assert (= (and d!50577 res!72842) b!154334))

(assert (= (and b!154334 res!72841) b!154332))

(declare-fun m!187807 () Bool)

(assert (=> d!50577 m!187807))

(declare-fun m!187809 () Bool)

(assert (=> d!50577 m!187809))

(declare-fun m!187811 () Bool)

(assert (=> b!154334 m!187811))

(declare-fun m!187813 () Bool)

(assert (=> b!154329 m!187813))

(declare-fun m!187815 () Bool)

(assert (=> b!154332 m!187815))

(declare-fun m!187817 () Bool)

(assert (=> bm!17169 m!187817))

(assert (=> d!50465 d!50577))

(declare-fun d!50579 () Bool)

(declare-fun e!100829 () Bool)

(assert (=> d!50579 e!100829))

(declare-fun res!72843 () Bool)

(assert (=> d!50579 (=> res!72843 e!100829)))

(declare-fun lt!80943 () Bool)

(assert (=> d!50579 (= res!72843 (not lt!80943))))

(declare-fun lt!80941 () Bool)

(assert (=> d!50579 (= lt!80943 lt!80941)))

(declare-fun lt!80944 () Unit!4887)

(declare-fun e!100828 () Unit!4887)

(assert (=> d!50579 (= lt!80944 e!100828)))

(declare-fun c!29573 () Bool)

(assert (=> d!50579 (= c!29573 lt!80941)))

(assert (=> d!50579 (= lt!80941 (containsKey!185 (toList!909 lt!80804) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50579 (= (contains!953 lt!80804 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80943)))

(declare-fun b!154338 () Bool)

(declare-fun lt!80942 () Unit!4887)

(assert (=> b!154338 (= e!100828 lt!80942)))

(assert (=> b!154338 (= lt!80942 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80804) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> b!154338 (isDefined!135 (getValueByKey!181 (toList!909 lt!80804) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154339 () Bool)

(declare-fun Unit!4899 () Unit!4887)

(assert (=> b!154339 (= e!100828 Unit!4899)))

(declare-fun b!154340 () Bool)

(assert (=> b!154340 (= e!100829 (isDefined!135 (getValueByKey!181 (toList!909 lt!80804) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50579 c!29573) b!154338))

(assert (= (and d!50579 (not c!29573)) b!154339))

(assert (= (and d!50579 (not res!72843)) b!154340))

(declare-fun m!187819 () Bool)

(assert (=> d!50579 m!187819))

(declare-fun m!187821 () Bool)

(assert (=> b!154338 m!187821))

(assert (=> b!154338 m!187393))

(assert (=> b!154338 m!187393))

(declare-fun m!187823 () Bool)

(assert (=> b!154338 m!187823))

(assert (=> b!154340 m!187393))

(assert (=> b!154340 m!187393))

(assert (=> b!154340 m!187823))

(assert (=> d!50477 d!50579))

(declare-fun c!29574 () Bool)

(declare-fun d!50581 () Bool)

(assert (=> d!50581 (= c!29574 (and ((_ is Cons!1803) lt!80806) (= (_1!1411 (h!2412 lt!80806)) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100830 () Option!187)

(assert (=> d!50581 (= (getValueByKey!181 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100830)))

(declare-fun b!154342 () Bool)

(declare-fun e!100831 () Option!187)

(assert (=> b!154342 (= e!100830 e!100831)))

(declare-fun c!29575 () Bool)

(assert (=> b!154342 (= c!29575 (and ((_ is Cons!1803) lt!80806) (not (= (_1!1411 (h!2412 lt!80806)) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154341 () Bool)

(assert (=> b!154341 (= e!100830 (Some!186 (_2!1411 (h!2412 lt!80806))))))

(declare-fun b!154343 () Bool)

(assert (=> b!154343 (= e!100831 (getValueByKey!181 (t!6592 lt!80806) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154344 () Bool)

(assert (=> b!154344 (= e!100831 None!185)))

(assert (= (and d!50581 c!29574) b!154341))

(assert (= (and d!50581 (not c!29574)) b!154342))

(assert (= (and b!154342 c!29575) b!154343))

(assert (= (and b!154342 (not c!29575)) b!154344))

(declare-fun m!187825 () Bool)

(assert (=> b!154343 m!187825))

(assert (=> d!50477 d!50581))

(declare-fun d!50583 () Bool)

(assert (=> d!50583 (= (getValueByKey!181 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80945 () Unit!4887)

(assert (=> d!50583 (= lt!80945 (choose!926 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun e!100832 () Bool)

(assert (=> d!50583 e!100832))

(declare-fun res!72844 () Bool)

(assert (=> d!50583 (=> (not res!72844) (not e!100832))))

(assert (=> d!50583 (= res!72844 (isStrictlySorted!325 lt!80806))))

(assert (=> d!50583 (= (lemmaContainsTupThenGetReturnValue!97 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80945)))

(declare-fun b!154345 () Bool)

(declare-fun res!72845 () Bool)

(assert (=> b!154345 (=> (not res!72845) (not e!100832))))

(assert (=> b!154345 (= res!72845 (containsKey!185 lt!80806 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154346 () Bool)

(assert (=> b!154346 (= e!100832 (contains!954 lt!80806 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50583 res!72844) b!154345))

(assert (= (and b!154345 res!72845) b!154346))

(assert (=> d!50583 m!187387))

(declare-fun m!187827 () Bool)

(assert (=> d!50583 m!187827))

(declare-fun m!187829 () Bool)

(assert (=> d!50583 m!187829))

(declare-fun m!187831 () Bool)

(assert (=> b!154345 m!187831))

(declare-fun m!187833 () Bool)

(assert (=> b!154346 m!187833))

(assert (=> d!50477 d!50583))

(declare-fun b!154347 () Bool)

(declare-fun e!100833 () List!1807)

(declare-fun call!17175 () List!1807)

(assert (=> b!154347 (= e!100833 call!17175)))

(declare-fun b!154348 () Bool)

(declare-fun e!100837 () List!1807)

(assert (=> b!154348 (= e!100837 (insertStrictlySorted!100 (t!6592 (toList!909 lt!80724)) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154349 () Bool)

(declare-fun c!29578 () Bool)

(assert (=> b!154349 (= c!29578 (and ((_ is Cons!1803) (toList!909 lt!80724)) (bvsgt (_1!1411 (h!2412 (toList!909 lt!80724))) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100834 () List!1807)

(assert (=> b!154349 (= e!100834 e!100833)))

(declare-fun b!154350 () Bool)

(declare-fun e!100835 () List!1807)

(declare-fun call!17174 () List!1807)

(assert (=> b!154350 (= e!100835 call!17174)))

(declare-fun lt!80946 () List!1807)

(declare-fun e!100836 () Bool)

(declare-fun b!154351 () Bool)

(assert (=> b!154351 (= e!100836 (contains!954 lt!80946 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154352 () Bool)

(assert (=> b!154352 (= e!100835 e!100834)))

(declare-fun c!29579 () Bool)

(assert (=> b!154352 (= c!29579 (and ((_ is Cons!1803) (toList!909 lt!80724)) (= (_1!1411 (h!2412 (toList!909 lt!80724))) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun bm!17170 () Bool)

(declare-fun call!17173 () List!1807)

(assert (=> bm!17170 (= call!17175 call!17173)))

(declare-fun bm!17171 () Bool)

(assert (=> bm!17171 (= call!17173 call!17174)))

(declare-fun d!50585 () Bool)

(assert (=> d!50585 e!100836))

(declare-fun res!72847 () Bool)

(assert (=> d!50585 (=> (not res!72847) (not e!100836))))

(assert (=> d!50585 (= res!72847 (isStrictlySorted!325 lt!80946))))

(assert (=> d!50585 (= lt!80946 e!100835)))

(declare-fun c!29577 () Bool)

(assert (=> d!50585 (= c!29577 (and ((_ is Cons!1803) (toList!909 lt!80724)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80724))) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50585 (isStrictlySorted!325 (toList!909 lt!80724))))

(assert (=> d!50585 (= (insertStrictlySorted!100 (toList!909 lt!80724) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80946)))

(declare-fun b!154353 () Bool)

(declare-fun res!72846 () Bool)

(assert (=> b!154353 (=> (not res!72846) (not e!100836))))

(assert (=> b!154353 (= res!72846 (containsKey!185 lt!80946 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun bm!17172 () Bool)

(assert (=> bm!17172 (= call!17174 ($colon$colon!95 e!100837 (ite c!29577 (h!2412 (toList!909 lt!80724)) (tuple2!2801 (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun c!29576 () Bool)

(assert (=> bm!17172 (= c!29576 c!29577)))

(declare-fun b!154354 () Bool)

(assert (=> b!154354 (= e!100833 call!17175)))

(declare-fun b!154355 () Bool)

(assert (=> b!154355 (= e!100834 call!17173)))

(declare-fun b!154356 () Bool)

(assert (=> b!154356 (= e!100837 (ite c!29579 (t!6592 (toList!909 lt!80724)) (ite c!29578 (Cons!1803 (h!2412 (toList!909 lt!80724)) (t!6592 (toList!909 lt!80724))) Nil!1804)))))

(assert (= (and d!50585 c!29577) b!154350))

(assert (= (and d!50585 (not c!29577)) b!154352))

(assert (= (and b!154352 c!29579) b!154355))

(assert (= (and b!154352 (not c!29579)) b!154349))

(assert (= (and b!154349 c!29578) b!154347))

(assert (= (and b!154349 (not c!29578)) b!154354))

(assert (= (or b!154347 b!154354) bm!17170))

(assert (= (or b!154355 bm!17170) bm!17171))

(assert (= (or b!154350 bm!17171) bm!17172))

(assert (= (and bm!17172 c!29576) b!154348))

(assert (= (and bm!17172 (not c!29576)) b!154356))

(assert (= (and d!50585 res!72847) b!154353))

(assert (= (and b!154353 res!72846) b!154351))

(declare-fun m!187835 () Bool)

(assert (=> d!50585 m!187835))

(declare-fun m!187837 () Bool)

(assert (=> d!50585 m!187837))

(declare-fun m!187839 () Bool)

(assert (=> b!154353 m!187839))

(declare-fun m!187841 () Bool)

(assert (=> b!154348 m!187841))

(declare-fun m!187843 () Bool)

(assert (=> b!154351 m!187843))

(declare-fun m!187845 () Bool)

(assert (=> bm!17172 m!187845))

(assert (=> d!50477 d!50585))

(declare-fun d!50587 () Bool)

(declare-fun isEmpty!435 (List!1807) Bool)

(assert (=> d!50587 (= (isEmpty!434 lt!80764) (isEmpty!435 (toList!909 lt!80764)))))

(declare-fun bs!6509 () Bool)

(assert (= bs!6509 d!50587))

(declare-fun m!187847 () Bool)

(assert (=> bs!6509 m!187847))

(assert (=> b!154062 d!50587))

(declare-fun d!50589 () Bool)

(assert (=> d!50589 (= (apply!128 lt!80813 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1603 (getValueByKey!181 (toList!909 lt!80813) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6510 () Bool)

(assert (= bs!6510 d!50589))

(declare-fun m!187849 () Bool)

(assert (=> bs!6510 m!187849))

(assert (=> bs!6510 m!187849))

(declare-fun m!187851 () Bool)

(assert (=> bs!6510 m!187851))

(assert (=> b!154110 d!50589))

(declare-fun d!50591 () Bool)

(declare-fun c!29580 () Bool)

(assert (=> d!50591 (= c!29580 (and ((_ is Cons!1803) (toList!909 lt!80782)) (= (_1!1411 (h!2412 (toList!909 lt!80782))) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100838 () Option!187)

(assert (=> d!50591 (= (getValueByKey!181 (toList!909 lt!80782) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100838)))

(declare-fun b!154358 () Bool)

(declare-fun e!100839 () Option!187)

(assert (=> b!154358 (= e!100838 e!100839)))

(declare-fun c!29581 () Bool)

(assert (=> b!154358 (= c!29581 (and ((_ is Cons!1803) (toList!909 lt!80782)) (not (= (_1!1411 (h!2412 (toList!909 lt!80782))) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154357 () Bool)

(assert (=> b!154357 (= e!100838 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80782)))))))

(declare-fun b!154359 () Bool)

(assert (=> b!154359 (= e!100839 (getValueByKey!181 (t!6592 (toList!909 lt!80782)) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154360 () Bool)

(assert (=> b!154360 (= e!100839 None!185)))

(assert (= (and d!50591 c!29580) b!154357))

(assert (= (and d!50591 (not c!29580)) b!154358))

(assert (= (and b!154358 c!29581) b!154359))

(assert (= (and b!154358 (not c!29581)) b!154360))

(declare-fun m!187853 () Bool)

(assert (=> b!154359 m!187853))

(assert (=> b!154078 d!50591))

(declare-fun d!50593 () Bool)

(declare-fun e!100840 () Bool)

(assert (=> d!50593 e!100840))

(declare-fun res!72849 () Bool)

(assert (=> d!50593 (=> (not res!72849) (not e!100840))))

(declare-fun lt!80948 () ListLongMap!1787)

(assert (=> d!50593 (= res!72849 (contains!953 lt!80948 (_1!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun lt!80950 () List!1807)

(assert (=> d!50593 (= lt!80948 (ListLongMap!1788 lt!80950))))

(declare-fun lt!80949 () Unit!4887)

(declare-fun lt!80947 () Unit!4887)

(assert (=> d!50593 (= lt!80949 lt!80947)))

(assert (=> d!50593 (= (getValueByKey!181 lt!80950 (_1!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (Some!186 (_2!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50593 (= lt!80947 (lemmaContainsTupThenGetReturnValue!97 lt!80950 (_1!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50593 (= lt!80950 (insertStrictlySorted!100 (toList!909 (ite c!29508 call!17138 (ite c!29509 call!17142 call!17137))) (_1!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50593 (= (+!181 (ite c!29508 call!17138 (ite c!29509 call!17142 call!17137)) (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80948)))

(declare-fun b!154361 () Bool)

(declare-fun res!72848 () Bool)

(assert (=> b!154361 (=> (not res!72848) (not e!100840))))

(assert (=> b!154361 (= res!72848 (= (getValueByKey!181 (toList!909 lt!80948) (_1!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (Some!186 (_2!1411 (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154362 () Bool)

(assert (=> b!154362 (= e!100840 (contains!954 (toList!909 lt!80948) (ite (or c!29508 c!29509) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (= (and d!50593 res!72849) b!154361))

(assert (= (and b!154361 res!72848) b!154362))

(declare-fun m!187855 () Bool)

(assert (=> d!50593 m!187855))

(declare-fun m!187857 () Bool)

(assert (=> d!50593 m!187857))

(declare-fun m!187859 () Bool)

(assert (=> d!50593 m!187859))

(declare-fun m!187861 () Bool)

(assert (=> d!50593 m!187861))

(declare-fun m!187863 () Bool)

(assert (=> b!154361 m!187863))

(declare-fun m!187865 () Bool)

(assert (=> b!154362 m!187865))

(assert (=> bm!17134 d!50593))

(declare-fun b!154364 () Bool)

(declare-fun e!100841 () Bool)

(declare-fun call!17176 () Bool)

(assert (=> b!154364 (= e!100841 call!17176)))

(declare-fun bm!17173 () Bool)

(assert (=> bm!17173 (= call!17176 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4835 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154365 () Bool)

(declare-fun e!100843 () Bool)

(assert (=> b!154365 (= e!100843 call!17176)))

(declare-fun b!154366 () Bool)

(declare-fun e!100842 () Bool)

(assert (=> b!154366 (= e!100842 e!100843)))

(declare-fun c!29582 () Bool)

(assert (=> b!154366 (= c!29582 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154363 () Bool)

(assert (=> b!154363 (= e!100843 e!100841)))

(declare-fun lt!80952 () (_ BitVec 64))

(assert (=> b!154363 (= lt!80952 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!80951 () Unit!4887)

(assert (=> b!154363 (= lt!80951 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) lt!80952 #b00000000000000000000000000000000))))

(assert (=> b!154363 (arrayContainsKey!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) lt!80952 #b00000000000000000000000000000000)))

(declare-fun lt!80953 () Unit!4887)

(assert (=> b!154363 (= lt!80953 lt!80951)))

(declare-fun res!72851 () Bool)

(assert (=> b!154363 (= res!72851 (= (seekEntryOrOpen!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (_keys!4835 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992)))) (Found!289 #b00000000000000000000000000000000)))))

(assert (=> b!154363 (=> (not res!72851) (not e!100841))))

(declare-fun d!50595 () Bool)

(declare-fun res!72850 () Bool)

(assert (=> d!50595 (=> res!72850 e!100842)))

(assert (=> d!50595 (= res!72850 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (mask!7466 (v!3411 (underlying!521 thiss!992)))) e!100842)))

(assert (= (and d!50595 (not res!72850)) b!154366))

(assert (= (and b!154366 c!29582) b!154363))

(assert (= (and b!154366 (not c!29582)) b!154365))

(assert (= (and b!154363 res!72851) b!154364))

(assert (= (or b!154364 b!154365) bm!17173))

(declare-fun m!187867 () Bool)

(assert (=> bm!17173 m!187867))

(assert (=> b!154366 m!187423))

(assert (=> b!154366 m!187423))

(assert (=> b!154366 m!187425))

(assert (=> b!154363 m!187423))

(declare-fun m!187869 () Bool)

(assert (=> b!154363 m!187869))

(declare-fun m!187871 () Bool)

(assert (=> b!154363 m!187871))

(assert (=> b!154363 m!187423))

(declare-fun m!187873 () Bool)

(assert (=> b!154363 m!187873))

(assert (=> b!154143 d!50595))

(assert (=> b!154181 d!50537))

(declare-fun b!154367 () Bool)

(declare-fun e!100849 () Bool)

(declare-fun e!100844 () Bool)

(assert (=> b!154367 (= e!100849 e!100844)))

(declare-fun c!29583 () Bool)

(declare-fun e!100846 () Bool)

(assert (=> b!154367 (= c!29583 e!100846)))

(declare-fun res!72852 () Bool)

(assert (=> b!154367 (=> (not res!72852) (not e!100846))))

(assert (=> b!154367 (= res!72852 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(declare-fun b!154368 () Bool)

(declare-fun e!100845 () Bool)

(assert (=> b!154368 (= e!100844 e!100845)))

(assert (=> b!154368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(declare-fun res!72855 () Bool)

(declare-fun lt!80959 () ListLongMap!1787)

(assert (=> b!154368 (= res!72855 (contains!953 lt!80959 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154368 (=> (not res!72855) (not e!100845))))

(declare-fun b!154369 () Bool)

(declare-fun e!100847 () ListLongMap!1787)

(declare-fun call!17177 () ListLongMap!1787)

(assert (=> b!154369 (= e!100847 call!17177)))

(declare-fun b!154370 () Bool)

(declare-fun e!100850 () Bool)

(assert (=> b!154370 (= e!100850 (isEmpty!434 lt!80959))))

(declare-fun b!154371 () Bool)

(assert (=> b!154371 (= e!100846 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154371 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!154372 () Bool)

(assert (=> b!154372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(assert (=> b!154372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2677 (_values!3046 newMap!16))))))

(assert (=> b!154372 (= e!100845 (= (apply!128 lt!80959 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) (get!1602 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154373 () Bool)

(declare-fun res!72853 () Bool)

(assert (=> b!154373 (=> (not res!72853) (not e!100849))))

(assert (=> b!154373 (= res!72853 (not (contains!953 lt!80959 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154374 () Bool)

(declare-fun e!100848 () ListLongMap!1787)

(assert (=> b!154374 (= e!100848 e!100847)))

(declare-fun c!29585 () Bool)

(assert (=> b!154374 (= c!29585 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!50597 () Bool)

(assert (=> d!50597 e!100849))

(declare-fun res!72854 () Bool)

(assert (=> d!50597 (=> (not res!72854) (not e!100849))))

(assert (=> d!50597 (= res!72854 (not (contains!953 lt!80959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50597 (= lt!80959 e!100848)))

(declare-fun c!29584 () Bool)

(assert (=> d!50597 (= c!29584 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50597 (validMask!0 (mask!7466 newMap!16))))

(assert (=> d!50597 (= (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3063 newMap!16)) lt!80959)))

(declare-fun b!154375 () Bool)

(assert (=> b!154375 (= e!100844 e!100850)))

(declare-fun c!29586 () Bool)

(assert (=> b!154375 (= c!29586 (bvslt #b00000000000000000000000000000000 (size!2676 (_keys!4835 newMap!16))))))

(declare-fun b!154376 () Bool)

(declare-fun lt!80956 () Unit!4887)

(declare-fun lt!80958 () Unit!4887)

(assert (=> b!154376 (= lt!80956 lt!80958)))

(declare-fun lt!80955 () ListLongMap!1787)

(declare-fun lt!80960 () (_ BitVec 64))

(declare-fun lt!80957 () V!3681)

(declare-fun lt!80954 () (_ BitVec 64))

(assert (=> b!154376 (not (contains!953 (+!181 lt!80955 (tuple2!2801 lt!80960 lt!80957)) lt!80954))))

(assert (=> b!154376 (= lt!80958 (addStillNotContains!71 lt!80955 lt!80960 lt!80957 lt!80954))))

(assert (=> b!154376 (= lt!80954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!154376 (= lt!80957 (get!1602 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!154376 (= lt!80960 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!154376 (= lt!80955 call!17177)))

(assert (=> b!154376 (= e!100847 (+!181 call!17177 (tuple2!2801 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) (get!1602 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!17174 () Bool)

(assert (=> bm!17174 (= call!17177 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 newMap!16)))))

(declare-fun b!154377 () Bool)

(assert (=> b!154377 (= e!100848 (ListLongMap!1788 Nil!1804))))

(declare-fun b!154378 () Bool)

(assert (=> b!154378 (= e!100850 (= lt!80959 (getCurrentListMapNoExtraKeys!149 (_keys!4835 newMap!16) (_values!3046 newMap!16) (mask!7466 newMap!16) (extraKeys!2804 newMap!16) (zeroValue!2906 newMap!16) (minValue!2906 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3063 newMap!16))))))

(assert (= (and d!50597 c!29584) b!154377))

(assert (= (and d!50597 (not c!29584)) b!154374))

(assert (= (and b!154374 c!29585) b!154376))

(assert (= (and b!154374 (not c!29585)) b!154369))

(assert (= (or b!154376 b!154369) bm!17174))

(assert (= (and d!50597 res!72854) b!154373))

(assert (= (and b!154373 res!72853) b!154367))

(assert (= (and b!154367 res!72852) b!154371))

(assert (= (and b!154367 c!29583) b!154368))

(assert (= (and b!154367 (not c!29583)) b!154375))

(assert (= (and b!154368 res!72855) b!154372))

(assert (= (and b!154375 c!29586) b!154378))

(assert (= (and b!154375 (not c!29586)) b!154370))

(declare-fun b_lambda!6853 () Bool)

(assert (=> (not b_lambda!6853) (not b!154372)))

(assert (=> b!154372 t!6601))

(declare-fun b_and!9609 () Bool)

(assert (= b_and!9605 (and (=> t!6601 result!4489) b_and!9609)))

(assert (=> b!154372 t!6603))

(declare-fun b_and!9611 () Bool)

(assert (= b_and!9607 (and (=> t!6603 result!4491) b_and!9611)))

(declare-fun b_lambda!6855 () Bool)

(assert (=> (not b_lambda!6855) (not b!154376)))

(assert (=> b!154376 t!6601))

(declare-fun b_and!9613 () Bool)

(assert (= b_and!9609 (and (=> t!6601 result!4489) b_and!9613)))

(assert (=> b!154376 t!6603))

(declare-fun b_and!9615 () Bool)

(assert (= b_and!9611 (and (=> t!6603 result!4491) b_and!9615)))

(declare-fun m!187875 () Bool)

(assert (=> bm!17174 m!187875))

(assert (=> b!154376 m!187491))

(assert (=> b!154376 m!187547))

(assert (=> b!154376 m!187545))

(assert (=> b!154376 m!187549))

(declare-fun m!187877 () Bool)

(assert (=> b!154376 m!187877))

(declare-fun m!187879 () Bool)

(assert (=> b!154376 m!187879))

(declare-fun m!187881 () Bool)

(assert (=> b!154376 m!187881))

(assert (=> b!154376 m!187879))

(assert (=> b!154376 m!187545))

(declare-fun m!187883 () Bool)

(assert (=> b!154376 m!187883))

(assert (=> b!154376 m!187547))

(declare-fun m!187885 () Bool)

(assert (=> b!154373 m!187885))

(assert (=> b!154368 m!187491))

(assert (=> b!154368 m!187491))

(declare-fun m!187887 () Bool)

(assert (=> b!154368 m!187887))

(assert (=> b!154374 m!187491))

(assert (=> b!154374 m!187491))

(assert (=> b!154374 m!187493))

(assert (=> b!154372 m!187491))

(assert (=> b!154372 m!187547))

(assert (=> b!154372 m!187545))

(assert (=> b!154372 m!187549))

(assert (=> b!154372 m!187545))

(assert (=> b!154372 m!187547))

(assert (=> b!154372 m!187491))

(declare-fun m!187889 () Bool)

(assert (=> b!154372 m!187889))

(declare-fun m!187891 () Bool)

(assert (=> b!154370 m!187891))

(declare-fun m!187893 () Bool)

(assert (=> d!50597 m!187893))

(assert (=> d!50597 m!187529))

(assert (=> b!154378 m!187875))

(assert (=> b!154371 m!187491))

(assert (=> b!154371 m!187491))

(assert (=> b!154371 m!187493))

(assert (=> bm!17152 d!50597))

(assert (=> b!154137 d!50537))

(declare-fun d!50599 () Bool)

(declare-fun e!100852 () Bool)

(assert (=> d!50599 e!100852))

(declare-fun res!72856 () Bool)

(assert (=> d!50599 (=> res!72856 e!100852)))

(declare-fun lt!80963 () Bool)

(assert (=> d!50599 (= res!72856 (not lt!80963))))

(declare-fun lt!80961 () Bool)

(assert (=> d!50599 (= lt!80963 lt!80961)))

(declare-fun lt!80964 () Unit!4887)

(declare-fun e!100851 () Unit!4887)

(assert (=> d!50599 (= lt!80964 e!100851)))

(declare-fun c!29587 () Bool)

(assert (=> d!50599 (= c!29587 lt!80961)))

(assert (=> d!50599 (= lt!80961 (containsKey!185 (toList!909 lt!80813) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!50599 (= (contains!953 lt!80813 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)) lt!80963)))

(declare-fun b!154379 () Bool)

(declare-fun lt!80962 () Unit!4887)

(assert (=> b!154379 (= e!100851 lt!80962)))

(assert (=> b!154379 (= lt!80962 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80813) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> b!154379 (isDefined!135 (getValueByKey!181 (toList!909 lt!80813) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154380 () Bool)

(declare-fun Unit!4900 () Unit!4887)

(assert (=> b!154380 (= e!100851 Unit!4900)))

(declare-fun b!154381 () Bool)

(assert (=> b!154381 (= e!100852 (isDefined!135 (getValueByKey!181 (toList!909 lt!80813) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))))

(assert (= (and d!50599 c!29587) b!154379))

(assert (= (and d!50599 (not c!29587)) b!154380))

(assert (= (and d!50599 (not res!72856)) b!154381))

(assert (=> d!50599 m!187423))

(declare-fun m!187895 () Bool)

(assert (=> d!50599 m!187895))

(assert (=> b!154379 m!187423))

(declare-fun m!187897 () Bool)

(assert (=> b!154379 m!187897))

(assert (=> b!154379 m!187423))

(declare-fun m!187899 () Bool)

(assert (=> b!154379 m!187899))

(assert (=> b!154379 m!187899))

(declare-fun m!187901 () Bool)

(assert (=> b!154379 m!187901))

(assert (=> b!154381 m!187423))

(assert (=> b!154381 m!187899))

(assert (=> b!154381 m!187899))

(assert (=> b!154381 m!187901))

(assert (=> b!154104 d!50599))

(declare-fun d!50601 () Bool)

(declare-fun c!29588 () Bool)

(assert (=> d!50601 (= c!29588 (and ((_ is Cons!1803) (toList!909 lt!80845)) (= (_1!1411 (h!2412 (toList!909 lt!80845))) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100853 () Option!187)

(assert (=> d!50601 (= (getValueByKey!181 (toList!909 lt!80845) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100853)))

(declare-fun b!154383 () Bool)

(declare-fun e!100854 () Option!187)

(assert (=> b!154383 (= e!100853 e!100854)))

(declare-fun c!29589 () Bool)

(assert (=> b!154383 (= c!29589 (and ((_ is Cons!1803) (toList!909 lt!80845)) (not (= (_1!1411 (h!2412 (toList!909 lt!80845))) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154382 () Bool)

(assert (=> b!154382 (= e!100853 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80845)))))))

(declare-fun b!154384 () Bool)

(assert (=> b!154384 (= e!100854 (getValueByKey!181 (t!6592 (toList!909 lt!80845)) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154385 () Bool)

(assert (=> b!154385 (= e!100854 None!185)))

(assert (= (and d!50601 c!29588) b!154382))

(assert (= (and d!50601 (not c!29588)) b!154383))

(assert (= (and b!154383 c!29589) b!154384))

(assert (= (and b!154383 (not c!29589)) b!154385))

(declare-fun m!187903 () Bool)

(assert (=> b!154384 m!187903))

(assert (=> b!154160 d!50601))

(declare-fun d!50603 () Bool)

(assert (=> d!50603 (= (apply!128 lt!80813 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1603 (getValueByKey!181 (toList!909 lt!80813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6511 () Bool)

(assert (= bs!6511 d!50603))

(declare-fun m!187905 () Bool)

(assert (=> bs!6511 m!187905))

(assert (=> bs!6511 m!187905))

(declare-fun m!187907 () Bool)

(assert (=> bs!6511 m!187907))

(assert (=> b!154121 d!50603))

(declare-fun d!50605 () Bool)

(declare-fun e!100856 () Bool)

(assert (=> d!50605 e!100856))

(declare-fun res!72857 () Bool)

(assert (=> d!50605 (=> res!72857 e!100856)))

(declare-fun lt!80967 () Bool)

(assert (=> d!50605 (= res!72857 (not lt!80967))))

(declare-fun lt!80965 () Bool)

(assert (=> d!50605 (= lt!80967 lt!80965)))

(declare-fun lt!80968 () Unit!4887)

(declare-fun e!100855 () Unit!4887)

(assert (=> d!50605 (= lt!80968 e!100855)))

(declare-fun c!29590 () Bool)

(assert (=> d!50605 (= c!29590 lt!80965)))

(assert (=> d!50605 (= lt!80965 (containsKey!185 (toList!909 lt!80782) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50605 (= (contains!953 lt!80782 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80967)))

(declare-fun b!154386 () Bool)

(declare-fun lt!80966 () Unit!4887)

(assert (=> b!154386 (= e!100855 lt!80966)))

(assert (=> b!154386 (= lt!80966 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80782) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> b!154386 (isDefined!135 (getValueByKey!181 (toList!909 lt!80782) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154387 () Bool)

(declare-fun Unit!4901 () Unit!4887)

(assert (=> b!154387 (= e!100855 Unit!4901)))

(declare-fun b!154388 () Bool)

(assert (=> b!154388 (= e!100856 (isDefined!135 (getValueByKey!181 (toList!909 lt!80782) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50605 c!29590) b!154386))

(assert (= (and d!50605 (not c!29590)) b!154387))

(assert (= (and d!50605 (not res!72857)) b!154388))

(declare-fun m!187909 () Bool)

(assert (=> d!50605 m!187909))

(declare-fun m!187911 () Bool)

(assert (=> b!154386 m!187911))

(assert (=> b!154386 m!187341))

(assert (=> b!154386 m!187341))

(declare-fun m!187913 () Bool)

(assert (=> b!154386 m!187913))

(assert (=> b!154388 m!187341))

(assert (=> b!154388 m!187341))

(assert (=> b!154388 m!187913))

(assert (=> d!50461 d!50605))

(declare-fun d!50607 () Bool)

(declare-fun c!29591 () Bool)

(assert (=> d!50607 (= c!29591 (and ((_ is Cons!1803) lt!80784) (= (_1!1411 (h!2412 lt!80784)) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100857 () Option!187)

(assert (=> d!50607 (= (getValueByKey!181 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100857)))

(declare-fun b!154390 () Bool)

(declare-fun e!100858 () Option!187)

(assert (=> b!154390 (= e!100857 e!100858)))

(declare-fun c!29592 () Bool)

(assert (=> b!154390 (= c!29592 (and ((_ is Cons!1803) lt!80784) (not (= (_1!1411 (h!2412 lt!80784)) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154389 () Bool)

(assert (=> b!154389 (= e!100857 (Some!186 (_2!1411 (h!2412 lt!80784))))))

(declare-fun b!154391 () Bool)

(assert (=> b!154391 (= e!100858 (getValueByKey!181 (t!6592 lt!80784) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154392 () Bool)

(assert (=> b!154392 (= e!100858 None!185)))

(assert (= (and d!50607 c!29591) b!154389))

(assert (= (and d!50607 (not c!29591)) b!154390))

(assert (= (and b!154390 c!29592) b!154391))

(assert (= (and b!154390 (not c!29592)) b!154392))

(declare-fun m!187915 () Bool)

(assert (=> b!154391 m!187915))

(assert (=> d!50461 d!50607))

(declare-fun d!50609 () Bool)

(assert (=> d!50609 (= (getValueByKey!181 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80969 () Unit!4887)

(assert (=> d!50609 (= lt!80969 (choose!926 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun e!100859 () Bool)

(assert (=> d!50609 e!100859))

(declare-fun res!72858 () Bool)

(assert (=> d!50609 (=> (not res!72858) (not e!100859))))

(assert (=> d!50609 (= res!72858 (isStrictlySorted!325 lt!80784))))

(assert (=> d!50609 (= (lemmaContainsTupThenGetReturnValue!97 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80969)))

(declare-fun b!154393 () Bool)

(declare-fun res!72859 () Bool)

(assert (=> b!154393 (=> (not res!72859) (not e!100859))))

(assert (=> b!154393 (= res!72859 (containsKey!185 lt!80784 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154394 () Bool)

(assert (=> b!154394 (= e!100859 (contains!954 lt!80784 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50609 res!72858) b!154393))

(assert (= (and b!154393 res!72859) b!154394))

(assert (=> d!50609 m!187335))

(declare-fun m!187917 () Bool)

(assert (=> d!50609 m!187917))

(declare-fun m!187919 () Bool)

(assert (=> d!50609 m!187919))

(declare-fun m!187921 () Bool)

(assert (=> b!154393 m!187921))

(declare-fun m!187923 () Bool)

(assert (=> b!154394 m!187923))

(assert (=> d!50461 d!50609))

(declare-fun b!154395 () Bool)

(declare-fun e!100860 () List!1807)

(declare-fun call!17180 () List!1807)

(assert (=> b!154395 (= e!100860 call!17180)))

(declare-fun b!154396 () Bool)

(declare-fun e!100864 () List!1807)

(assert (=> b!154396 (= e!100864 (insertStrictlySorted!100 (t!6592 (toList!909 lt!80739)) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154397 () Bool)

(declare-fun c!29595 () Bool)

(assert (=> b!154397 (= c!29595 (and ((_ is Cons!1803) (toList!909 lt!80739)) (bvsgt (_1!1411 (h!2412 (toList!909 lt!80739))) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100861 () List!1807)

(assert (=> b!154397 (= e!100861 e!100860)))

(declare-fun b!154398 () Bool)

(declare-fun e!100862 () List!1807)

(declare-fun call!17179 () List!1807)

(assert (=> b!154398 (= e!100862 call!17179)))

(declare-fun lt!80970 () List!1807)

(declare-fun e!100863 () Bool)

(declare-fun b!154399 () Bool)

(assert (=> b!154399 (= e!100863 (contains!954 lt!80970 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154400 () Bool)

(assert (=> b!154400 (= e!100862 e!100861)))

(declare-fun c!29596 () Bool)

(assert (=> b!154400 (= c!29596 (and ((_ is Cons!1803) (toList!909 lt!80739)) (= (_1!1411 (h!2412 (toList!909 lt!80739))) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun bm!17175 () Bool)

(declare-fun call!17178 () List!1807)

(assert (=> bm!17175 (= call!17180 call!17178)))

(declare-fun bm!17176 () Bool)

(assert (=> bm!17176 (= call!17178 call!17179)))

(declare-fun d!50611 () Bool)

(assert (=> d!50611 e!100863))

(declare-fun res!72861 () Bool)

(assert (=> d!50611 (=> (not res!72861) (not e!100863))))

(assert (=> d!50611 (= res!72861 (isStrictlySorted!325 lt!80970))))

(assert (=> d!50611 (= lt!80970 e!100862)))

(declare-fun c!29594 () Bool)

(assert (=> d!50611 (= c!29594 (and ((_ is Cons!1803) (toList!909 lt!80739)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80739))) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50611 (isStrictlySorted!325 (toList!909 lt!80739))))

(assert (=> d!50611 (= (insertStrictlySorted!100 (toList!909 lt!80739) (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80970)))

(declare-fun b!154401 () Bool)

(declare-fun res!72860 () Bool)

(assert (=> b!154401 (=> (not res!72860) (not e!100863))))

(assert (=> b!154401 (= res!72860 (containsKey!185 lt!80970 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun bm!17177 () Bool)

(assert (=> bm!17177 (= call!17179 ($colon$colon!95 e!100864 (ite c!29594 (h!2412 (toList!909 lt!80739)) (tuple2!2801 (_1!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun c!29593 () Bool)

(assert (=> bm!17177 (= c!29593 c!29594)))

(declare-fun b!154402 () Bool)

(assert (=> b!154402 (= e!100860 call!17180)))

(declare-fun b!154403 () Bool)

(assert (=> b!154403 (= e!100861 call!17178)))

(declare-fun b!154404 () Bool)

(assert (=> b!154404 (= e!100864 (ite c!29596 (t!6592 (toList!909 lt!80739)) (ite c!29595 (Cons!1803 (h!2412 (toList!909 lt!80739)) (t!6592 (toList!909 lt!80739))) Nil!1804)))))

(assert (= (and d!50611 c!29594) b!154398))

(assert (= (and d!50611 (not c!29594)) b!154400))

(assert (= (and b!154400 c!29596) b!154403))

(assert (= (and b!154400 (not c!29596)) b!154397))

(assert (= (and b!154397 c!29595) b!154395))

(assert (= (and b!154397 (not c!29595)) b!154402))

(assert (= (or b!154395 b!154402) bm!17175))

(assert (= (or b!154403 bm!17175) bm!17176))

(assert (= (or b!154398 bm!17176) bm!17177))

(assert (= (and bm!17177 c!29593) b!154396))

(assert (= (and bm!17177 (not c!29593)) b!154404))

(assert (= (and d!50611 res!72861) b!154401))

(assert (= (and b!154401 res!72860) b!154399))

(declare-fun m!187925 () Bool)

(assert (=> d!50611 m!187925))

(declare-fun m!187927 () Bool)

(assert (=> d!50611 m!187927))

(declare-fun m!187929 () Bool)

(assert (=> b!154401 m!187929))

(declare-fun m!187931 () Bool)

(assert (=> b!154396 m!187931))

(declare-fun m!187933 () Bool)

(assert (=> b!154399 m!187933))

(declare-fun m!187935 () Bool)

(assert (=> bm!17177 m!187935))

(assert (=> d!50461 d!50611))

(declare-fun d!50613 () Bool)

(declare-fun e!100866 () Bool)

(assert (=> d!50613 e!100866))

(declare-fun res!72862 () Bool)

(assert (=> d!50613 (=> res!72862 e!100866)))

(declare-fun lt!80973 () Bool)

(assert (=> d!50613 (= res!72862 (not lt!80973))))

(declare-fun lt!80971 () Bool)

(assert (=> d!50613 (= lt!80973 lt!80971)))

(declare-fun lt!80974 () Unit!4887)

(declare-fun e!100865 () Unit!4887)

(assert (=> d!50613 (= lt!80974 e!100865)))

(declare-fun c!29597 () Bool)

(assert (=> d!50613 (= c!29597 lt!80971)))

(assert (=> d!50613 (= lt!80971 (containsKey!185 (toList!909 lt!80724) lt!80730))))

(assert (=> d!50613 (= (contains!953 lt!80724 lt!80730) lt!80973)))

(declare-fun b!154405 () Bool)

(declare-fun lt!80972 () Unit!4887)

(assert (=> b!154405 (= e!100865 lt!80972)))

(assert (=> b!154405 (= lt!80972 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80724) lt!80730))))

(assert (=> b!154405 (isDefined!135 (getValueByKey!181 (toList!909 lt!80724) lt!80730))))

(declare-fun b!154406 () Bool)

(declare-fun Unit!4902 () Unit!4887)

(assert (=> b!154406 (= e!100865 Unit!4902)))

(declare-fun b!154407 () Bool)

(assert (=> b!154407 (= e!100866 (isDefined!135 (getValueByKey!181 (toList!909 lt!80724) lt!80730)))))

(assert (= (and d!50613 c!29597) b!154405))

(assert (= (and d!50613 (not c!29597)) b!154406))

(assert (= (and d!50613 (not res!72862)) b!154407))

(declare-fun m!187937 () Bool)

(assert (=> d!50613 m!187937))

(declare-fun m!187939 () Bool)

(assert (=> b!154405 m!187939))

(assert (=> b!154405 m!187373))

(assert (=> b!154405 m!187373))

(declare-fun m!187941 () Bool)

(assert (=> b!154405 m!187941))

(assert (=> b!154407 m!187373))

(assert (=> b!154407 m!187373))

(assert (=> b!154407 m!187941))

(assert (=> d!50449 d!50613))

(assert (=> d!50449 d!50471))

(assert (=> d!50449 d!50473))

(assert (=> d!50449 d!50477))

(declare-fun d!50615 () Bool)

(assert (=> d!50615 (= (apply!128 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80730) (apply!128 lt!80724 lt!80730))))

(assert (=> d!50615 true))

(declare-fun _$34!1042 () Unit!4887)

(assert (=> d!50615 (= (choose!924 lt!80724 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80730) _$34!1042)))

(declare-fun bs!6512 () Bool)

(assert (= bs!6512 d!50615))

(assert (=> bs!6512 m!187253))

(assert (=> bs!6512 m!187253))

(assert (=> bs!6512 m!187259))

(assert (=> bs!6512 m!187265))

(assert (=> d!50449 d!50615))

(declare-fun b!154410 () Bool)

(declare-fun e!100867 () Bool)

(declare-fun call!17181 () Bool)

(assert (=> b!154410 (= e!100867 call!17181)))

(declare-fun bm!17178 () Bool)

(assert (=> bm!17178 (= call!17181 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4835 newMap!16) (mask!7466 newMap!16)))))

(declare-fun b!154411 () Bool)

(declare-fun e!100869 () Bool)

(assert (=> b!154411 (= e!100869 call!17181)))

(declare-fun b!154412 () Bool)

(declare-fun e!100868 () Bool)

(assert (=> b!154412 (= e!100868 e!100869)))

(declare-fun c!29598 () Bool)

(assert (=> b!154412 (= c!29598 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154409 () Bool)

(assert (=> b!154409 (= e!100869 e!100867)))

(declare-fun lt!80976 () (_ BitVec 64))

(assert (=> b!154409 (= lt!80976 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!80975 () Unit!4887)

(assert (=> b!154409 (= lt!80975 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4835 newMap!16) lt!80976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!154409 (arrayContainsKey!0 (_keys!4835 newMap!16) lt!80976 #b00000000000000000000000000000000)))

(declare-fun lt!80977 () Unit!4887)

(assert (=> b!154409 (= lt!80977 lt!80975)))

(declare-fun res!72864 () Bool)

(assert (=> b!154409 (= res!72864 (= (seekEntryOrOpen!0 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4835 newMap!16) (mask!7466 newMap!16)) (Found!289 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!154409 (=> (not res!72864) (not e!100867))))

(declare-fun d!50617 () Bool)

(declare-fun res!72863 () Bool)

(assert (=> d!50617 (=> res!72863 e!100868)))

(assert (=> d!50617 (= res!72863 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50617 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4835 newMap!16) (mask!7466 newMap!16)) e!100868)))

(assert (= (and d!50617 (not res!72863)) b!154412))

(assert (= (and b!154412 c!29598) b!154409))

(assert (= (and b!154412 (not c!29598)) b!154411))

(assert (= (and b!154409 res!72864) b!154410))

(assert (= (or b!154410 b!154411) bm!17178))

(declare-fun m!187943 () Bool)

(assert (=> bm!17178 m!187943))

(declare-fun m!187945 () Bool)

(assert (=> b!154412 m!187945))

(assert (=> b!154412 m!187945))

(declare-fun m!187947 () Bool)

(assert (=> b!154412 m!187947))

(assert (=> b!154409 m!187945))

(declare-fun m!187949 () Bool)

(assert (=> b!154409 m!187949))

(declare-fun m!187951 () Bool)

(assert (=> b!154409 m!187951))

(assert (=> b!154409 m!187945))

(declare-fun m!187953 () Bool)

(assert (=> b!154409 m!187953))

(assert (=> bm!17155 d!50617))

(declare-fun d!50619 () Bool)

(declare-fun res!72869 () Bool)

(declare-fun e!100874 () Bool)

(assert (=> d!50619 (=> res!72869 e!100874)))

(assert (=> d!50619 (= res!72869 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80736)))))

(assert (=> d!50619 (= (containsKey!185 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736) e!100874)))

(declare-fun b!154417 () Bool)

(declare-fun e!100875 () Bool)

(assert (=> b!154417 (= e!100874 e!100875)))

(declare-fun res!72870 () Bool)

(assert (=> b!154417 (=> (not res!72870) (not e!100875))))

(assert (=> b!154417 (= res!72870 (and (or (not ((_ is Cons!1803) (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) (bvsle (_1!1411 (h!2412 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80736)) ((_ is Cons!1803) (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) (bvslt (_1!1411 (h!2412 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80736)))))

(declare-fun b!154418 () Bool)

(assert (=> b!154418 (= e!100875 (containsKey!185 (t!6592 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!80736))))

(assert (= (and d!50619 (not res!72869)) b!154417))

(assert (= (and b!154417 res!72870) b!154418))

(declare-fun m!187955 () Bool)

(assert (=> b!154418 m!187955))

(assert (=> d!50469 d!50619))

(assert (=> b!154192 d!50537))

(declare-fun d!50621 () Bool)

(declare-fun isEmpty!436 (Option!187) Bool)

(assert (=> d!50621 (= (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!436 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!6513 () Bool)

(assert (= bs!6513 d!50621))

(assert (=> bs!6513 m!187475))

(declare-fun m!187957 () Bool)

(assert (=> bs!6513 m!187957))

(assert (=> b!154176 d!50621))

(declare-fun d!50623 () Bool)

(declare-fun c!29599 () Bool)

(assert (=> d!50623 (= c!29599 (and ((_ is Cons!1803) (toList!909 lt!80722)) (= (_1!1411 (h!2412 (toList!909 lt!80722))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!100876 () Option!187)

(assert (=> d!50623 (= (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000) e!100876)))

(declare-fun b!154420 () Bool)

(declare-fun e!100877 () Option!187)

(assert (=> b!154420 (= e!100876 e!100877)))

(declare-fun c!29600 () Bool)

(assert (=> b!154420 (= c!29600 (and ((_ is Cons!1803) (toList!909 lt!80722)) (not (= (_1!1411 (h!2412 (toList!909 lt!80722))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!154419 () Bool)

(assert (=> b!154419 (= e!100876 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80722)))))))

(declare-fun b!154421 () Bool)

(assert (=> b!154421 (= e!100877 (getValueByKey!181 (t!6592 (toList!909 lt!80722)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154422 () Bool)

(assert (=> b!154422 (= e!100877 None!185)))

(assert (= (and d!50623 c!29599) b!154419))

(assert (= (and d!50623 (not c!29599)) b!154420))

(assert (= (and b!154420 c!29600) b!154421))

(assert (= (and b!154420 (not c!29600)) b!154422))

(declare-fun m!187959 () Bool)

(assert (=> b!154421 m!187959))

(assert (=> b!154176 d!50623))

(declare-fun d!50625 () Bool)

(assert (=> d!50625 (= (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736)) (not (isEmpty!436 (getValueByKey!181 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))))

(declare-fun bs!6514 () Bool)

(assert (= bs!6514 d!50625))

(assert (=> bs!6514 m!187369))

(declare-fun m!187961 () Bool)

(assert (=> bs!6514 m!187961))

(assert (=> b!154091 d!50625))

(declare-fun d!50627 () Bool)

(declare-fun c!29601 () Bool)

(assert (=> d!50627 (= c!29601 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80736)))))

(declare-fun e!100878 () Option!187)

(assert (=> d!50627 (= (getValueByKey!181 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736) e!100878)))

(declare-fun b!154424 () Bool)

(declare-fun e!100879 () Option!187)

(assert (=> b!154424 (= e!100878 e!100879)))

(declare-fun c!29602 () Bool)

(assert (=> b!154424 (= c!29602 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) (not (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80736))))))

(declare-fun b!154423 () Bool)

(assert (=> b!154423 (= e!100878 (Some!186 (_2!1411 (h!2412 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun b!154425 () Bool)

(assert (=> b!154425 (= e!100879 (getValueByKey!181 (t!6592 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!80736))))

(declare-fun b!154426 () Bool)

(assert (=> b!154426 (= e!100879 None!185)))

(assert (= (and d!50627 c!29601) b!154423))

(assert (= (and d!50627 (not c!29601)) b!154424))

(assert (= (and b!154424 c!29602) b!154425))

(assert (= (and b!154424 (not c!29602)) b!154426))

(declare-fun m!187963 () Bool)

(assert (=> b!154425 m!187963))

(assert (=> b!154091 d!50627))

(declare-fun c!29603 () Bool)

(declare-fun d!50629 () Bool)

(assert (=> d!50629 (= c!29603 (and ((_ is Cons!1803) (toList!909 lt!80804)) (= (_1!1411 (h!2412 (toList!909 lt!80804))) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100880 () Option!187)

(assert (=> d!50629 (= (getValueByKey!181 (toList!909 lt!80804) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100880)))

(declare-fun b!154428 () Bool)

(declare-fun e!100881 () Option!187)

(assert (=> b!154428 (= e!100880 e!100881)))

(declare-fun c!29604 () Bool)

(assert (=> b!154428 (= c!29604 (and ((_ is Cons!1803) (toList!909 lt!80804)) (not (= (_1!1411 (h!2412 (toList!909 lt!80804))) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154427 () Bool)

(assert (=> b!154427 (= e!100880 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80804)))))))

(declare-fun b!154429 () Bool)

(assert (=> b!154429 (= e!100881 (getValueByKey!181 (t!6592 (toList!909 lt!80804)) (_1!1411 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154430 () Bool)

(assert (=> b!154430 (= e!100881 None!185)))

(assert (= (and d!50629 c!29603) b!154427))

(assert (= (and d!50629 (not c!29603)) b!154428))

(assert (= (and b!154428 c!29604) b!154429))

(assert (= (and b!154428 (not c!29604)) b!154430))

(declare-fun m!187965 () Bool)

(assert (=> b!154429 m!187965))

(assert (=> b!154093 d!50629))

(declare-fun d!50631 () Bool)

(declare-fun e!100882 () Bool)

(assert (=> d!50631 e!100882))

(declare-fun res!72872 () Bool)

(assert (=> d!50631 (=> (not res!72872) (not e!100882))))

(declare-fun lt!80979 () ListLongMap!1787)

(assert (=> d!50631 (= res!72872 (contains!953 lt!80979 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!80981 () List!1807)

(assert (=> d!50631 (= lt!80979 (ListLongMap!1788 lt!80981))))

(declare-fun lt!80980 () Unit!4887)

(declare-fun lt!80978 () Unit!4887)

(assert (=> d!50631 (= lt!80980 lt!80978)))

(assert (=> d!50631 (= (getValueByKey!181 lt!80981 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50631 (= lt!80978 (lemmaContainsTupThenGetReturnValue!97 lt!80981 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50631 (= lt!80981 (insertStrictlySorted!100 (toList!909 call!17140) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50631 (= (+!181 call!17140 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80979)))

(declare-fun b!154431 () Bool)

(declare-fun res!72871 () Bool)

(assert (=> b!154431 (=> (not res!72871) (not e!100882))))

(assert (=> b!154431 (= res!72871 (= (getValueByKey!181 (toList!909 lt!80979) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154432 () Bool)

(assert (=> b!154432 (= e!100882 (contains!954 (toList!909 lt!80979) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50631 res!72872) b!154431))

(assert (= (and b!154431 res!72871) b!154432))

(declare-fun m!187967 () Bool)

(assert (=> d!50631 m!187967))

(declare-fun m!187969 () Bool)

(assert (=> d!50631 m!187969))

(declare-fun m!187971 () Bool)

(assert (=> d!50631 m!187971))

(declare-fun m!187973 () Bool)

(assert (=> d!50631 m!187973))

(declare-fun m!187975 () Bool)

(assert (=> b!154431 m!187975))

(declare-fun m!187977 () Bool)

(assert (=> b!154432 m!187977))

(assert (=> b!154114 d!50631))

(declare-fun d!50633 () Bool)

(assert (=> d!50633 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!80984 () Unit!4887)

(declare-fun choose!927 (List!1807 (_ BitVec 64)) Unit!4887)

(assert (=> d!50633 (= lt!80984 (choose!927 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!100885 () Bool)

(assert (=> d!50633 e!100885))

(declare-fun res!72875 () Bool)

(assert (=> d!50633 (=> (not res!72875) (not e!100885))))

(assert (=> d!50633 (= res!72875 (isStrictlySorted!325 (toList!909 lt!80722)))))

(assert (=> d!50633 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!80984)))

(declare-fun b!154435 () Bool)

(assert (=> b!154435 (= e!100885 (containsKey!185 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50633 res!72875) b!154435))

(assert (=> d!50633 m!187225))

(assert (=> d!50633 m!187409))

(assert (=> d!50633 m!187409))

(assert (=> d!50633 m!187411))

(assert (=> d!50633 m!187225))

(declare-fun m!187979 () Bool)

(assert (=> d!50633 m!187979))

(declare-fun m!187981 () Bool)

(assert (=> d!50633 m!187981))

(assert (=> b!154435 m!187225))

(assert (=> b!154435 m!187405))

(assert (=> b!154095 d!50633))

(declare-fun d!50635 () Bool)

(assert (=> d!50635 (= (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!436 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!6515 () Bool)

(assert (= bs!6515 d!50635))

(assert (=> bs!6515 m!187409))

(declare-fun m!187983 () Bool)

(assert (=> bs!6515 m!187983))

(assert (=> b!154095 d!50635))

(declare-fun c!29605 () Bool)

(declare-fun d!50637 () Bool)

(assert (=> d!50637 (= c!29605 (and ((_ is Cons!1803) (toList!909 lt!80722)) (= (_1!1411 (h!2412 (toList!909 lt!80722))) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!100886 () Option!187)

(assert (=> d!50637 (= (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!100886)))

(declare-fun b!154437 () Bool)

(declare-fun e!100887 () Option!187)

(assert (=> b!154437 (= e!100886 e!100887)))

(declare-fun c!29606 () Bool)

(assert (=> b!154437 (= c!29606 (and ((_ is Cons!1803) (toList!909 lt!80722)) (not (= (_1!1411 (h!2412 (toList!909 lt!80722))) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!154436 () Bool)

(assert (=> b!154436 (= e!100886 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80722)))))))

(declare-fun b!154438 () Bool)

(assert (=> b!154438 (= e!100887 (getValueByKey!181 (t!6592 (toList!909 lt!80722)) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154439 () Bool)

(assert (=> b!154439 (= e!100887 None!185)))

(assert (= (and d!50637 c!29605) b!154436))

(assert (= (and d!50637 (not c!29605)) b!154437))

(assert (= (and b!154437 c!29606) b!154438))

(assert (= (and b!154437 (not c!29606)) b!154439))

(assert (=> b!154438 m!187225))

(declare-fun m!187985 () Bool)

(assert (=> b!154438 m!187985))

(assert (=> b!154095 d!50637))

(declare-fun d!50639 () Bool)

(assert (=> d!50639 (= (apply!128 lt!80854 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) (get!1603 (getValueByKey!181 (toList!909 lt!80854) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!6516 () Bool)

(assert (= bs!6516 d!50639))

(assert (=> bs!6516 m!187491))

(declare-fun m!187987 () Bool)

(assert (=> bs!6516 m!187987))

(assert (=> bs!6516 m!187987))

(declare-fun m!187989 () Bool)

(assert (=> bs!6516 m!187989))

(assert (=> b!154185 d!50639))

(declare-fun d!50641 () Bool)

(declare-fun c!29607 () Bool)

(assert (=> d!50641 (= c!29607 ((_ is ValueCellFull!1169) (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!100888 () V!3681)

(assert (=> d!50641 (= (get!1602 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100888)))

(declare-fun b!154440 () Bool)

(assert (=> b!154440 (= e!100888 (get!1604 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154441 () Bool)

(assert (=> b!154441 (= e!100888 (get!1605 (select (arr!2399 (_values!3046 newMap!16)) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50641 c!29607) b!154440))

(assert (= (and d!50641 (not c!29607)) b!154441))

(assert (=> b!154440 m!187547))

(assert (=> b!154440 m!187545))

(declare-fun m!187991 () Bool)

(assert (=> b!154440 m!187991))

(assert (=> b!154441 m!187547))

(assert (=> b!154441 m!187545))

(declare-fun m!187993 () Bool)

(assert (=> b!154441 m!187993))

(assert (=> b!154185 d!50641))

(assert (=> d!50455 d!50469))

(assert (=> d!50455 d!50453))

(declare-fun d!50643 () Bool)

(assert (=> d!50643 (contains!953 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80736)))

(assert (=> d!50643 true))

(declare-fun _$35!405 () Unit!4887)

(assert (=> d!50643 (= (choose!925 lt!80720 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80736) _$35!405)))

(declare-fun bs!6517 () Bool)

(assert (= bs!6517 d!50643))

(assert (=> bs!6517 m!187255))

(assert (=> bs!6517 m!187255))

(assert (=> bs!6517 m!187257))

(assert (=> d!50455 d!50643))

(declare-fun d!50645 () Bool)

(declare-fun e!100890 () Bool)

(assert (=> d!50645 e!100890))

(declare-fun res!72876 () Bool)

(assert (=> d!50645 (=> res!72876 e!100890)))

(declare-fun lt!80987 () Bool)

(assert (=> d!50645 (= res!72876 (not lt!80987))))

(declare-fun lt!80985 () Bool)

(assert (=> d!50645 (= lt!80987 lt!80985)))

(declare-fun lt!80988 () Unit!4887)

(declare-fun e!100889 () Unit!4887)

(assert (=> d!50645 (= lt!80988 e!100889)))

(declare-fun c!29608 () Bool)

(assert (=> d!50645 (= c!29608 lt!80985)))

(assert (=> d!50645 (= lt!80985 (containsKey!185 (toList!909 lt!80720) lt!80736))))

(assert (=> d!50645 (= (contains!953 lt!80720 lt!80736) lt!80987)))

(declare-fun b!154443 () Bool)

(declare-fun lt!80986 () Unit!4887)

(assert (=> b!154443 (= e!100889 lt!80986)))

(assert (=> b!154443 (= lt!80986 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80720) lt!80736))))

(assert (=> b!154443 (isDefined!135 (getValueByKey!181 (toList!909 lt!80720) lt!80736))))

(declare-fun b!154444 () Bool)

(declare-fun Unit!4903 () Unit!4887)

(assert (=> b!154444 (= e!100889 Unit!4903)))

(declare-fun b!154445 () Bool)

(assert (=> b!154445 (= e!100890 (isDefined!135 (getValueByKey!181 (toList!909 lt!80720) lt!80736)))))

(assert (= (and d!50645 c!29608) b!154443))

(assert (= (and d!50645 (not c!29608)) b!154444))

(assert (= (and d!50645 (not res!72876)) b!154445))

(declare-fun m!187995 () Bool)

(assert (=> d!50645 m!187995))

(declare-fun m!187997 () Bool)

(assert (=> b!154443 m!187997))

(declare-fun m!187999 () Bool)

(assert (=> b!154443 m!187999))

(assert (=> b!154443 m!187999))

(declare-fun m!188001 () Bool)

(assert (=> b!154443 m!188001))

(assert (=> b!154445 m!187999))

(assert (=> b!154445 m!187999))

(assert (=> b!154445 m!188001))

(assert (=> d!50455 d!50645))

(assert (=> b!154140 d!50537))

(declare-fun d!50647 () Bool)

(assert (=> d!50647 (= (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80730)) (v!3416 (getValueByKey!181 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80730)))))

(assert (=> d!50473 d!50647))

(declare-fun d!50649 () Bool)

(declare-fun c!29609 () Bool)

(assert (=> d!50649 (= c!29609 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80730)))))

(declare-fun e!100891 () Option!187)

(assert (=> d!50649 (= (getValueByKey!181 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80730) e!100891)))

(declare-fun b!154447 () Bool)

(declare-fun e!100892 () Option!187)

(assert (=> b!154447 (= e!100891 e!100892)))

(declare-fun c!29610 () Bool)

(assert (=> b!154447 (= c!29610 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (not (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80730))))))

(declare-fun b!154446 () Bool)

(assert (=> b!154446 (= e!100891 (Some!186 (_2!1411 (h!2412 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun b!154448 () Bool)

(assert (=> b!154448 (= e!100892 (getValueByKey!181 (t!6592 (toList!909 (+!181 lt!80724 (tuple2!2801 lt!80725 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!80730))))

(declare-fun b!154449 () Bool)

(assert (=> b!154449 (= e!100892 None!185)))

(assert (= (and d!50649 c!29609) b!154446))

(assert (= (and d!50649 (not c!29609)) b!154447))

(assert (= (and b!154447 c!29610) b!154448))

(assert (= (and b!154447 (not c!29610)) b!154449))

(declare-fun m!188003 () Bool)

(assert (=> b!154448 m!188003))

(assert (=> d!50473 d!50649))

(declare-fun lt!80989 () Bool)

(declare-fun d!50651 () Bool)

(assert (=> d!50651 (= lt!80989 (select (content!145 (toList!909 lt!80834)) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun e!100893 () Bool)

(assert (=> d!50651 (= lt!80989 e!100893)))

(declare-fun res!72878 () Bool)

(assert (=> d!50651 (=> (not res!72878) (not e!100893))))

(assert (=> d!50651 (= res!72878 ((_ is Cons!1803) (toList!909 lt!80834)))))

(assert (=> d!50651 (= (contains!954 (toList!909 lt!80834) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80989)))

(declare-fun b!154450 () Bool)

(declare-fun e!100894 () Bool)

(assert (=> b!154450 (= e!100893 e!100894)))

(declare-fun res!72877 () Bool)

(assert (=> b!154450 (=> res!72877 e!100894)))

(assert (=> b!154450 (= res!72877 (= (h!2412 (toList!909 lt!80834)) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154451 () Bool)

(assert (=> b!154451 (= e!100894 (contains!954 (t!6592 (toList!909 lt!80834)) (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (= (and d!50651 res!72878) b!154450))

(assert (= (and b!154450 (not res!72877)) b!154451))

(declare-fun m!188005 () Bool)

(assert (=> d!50651 m!188005))

(declare-fun m!188007 () Bool)

(assert (=> d!50651 m!188007))

(declare-fun m!188009 () Bool)

(assert (=> b!154451 m!188009))

(assert (=> b!154126 d!50651))

(assert (=> b!154066 d!50491))

(declare-fun d!50653 () Bool)

(assert (=> d!50653 (= (get!1603 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3416 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50493 d!50653))

(assert (=> d!50493 d!50623))

(declare-fun b!154452 () Bool)

(declare-fun e!100898 () Bool)

(declare-fun e!100895 () Bool)

(assert (=> b!154452 (= e!100898 e!100895)))

(declare-fun res!72881 () Bool)

(assert (=> b!154452 (=> (not res!72881) (not e!100895))))

(declare-fun e!100896 () Bool)

(assert (=> b!154452 (= res!72881 (not e!100896))))

(declare-fun res!72879 () Bool)

(assert (=> b!154452 (=> (not res!72879) (not e!100896))))

(assert (=> b!154452 (= res!72879 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154453 () Bool)

(declare-fun e!100897 () Bool)

(declare-fun call!17182 () Bool)

(assert (=> b!154453 (= e!100897 call!17182)))

(declare-fun d!50655 () Bool)

(declare-fun res!72880 () Bool)

(assert (=> d!50655 (=> res!72880 e!100898)))

(assert (=> d!50655 (= res!72880 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50655 (= (arrayNoDuplicates!0 (_keys!4835 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29516 (Cons!1806 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) Nil!1807) Nil!1807)) e!100898)))

(declare-fun b!154454 () Bool)

(assert (=> b!154454 (= e!100896 (contains!955 (ite c!29516 (Cons!1806 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) Nil!1807) Nil!1807) (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!29611 () Bool)

(declare-fun bm!17179 () Bool)

(assert (=> bm!17179 (= call!17182 (arrayNoDuplicates!0 (_keys!4835 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!29611 (Cons!1806 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!29516 (Cons!1806 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) Nil!1807) Nil!1807)) (ite c!29516 (Cons!1806 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) Nil!1807) Nil!1807))))))

(declare-fun b!154455 () Bool)

(assert (=> b!154455 (= e!100895 e!100897)))

(assert (=> b!154455 (= c!29611 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!154456 () Bool)

(assert (=> b!154456 (= e!100897 call!17182)))

(assert (= (and d!50655 (not res!72880)) b!154452))

(assert (= (and b!154452 res!72879) b!154454))

(assert (= (and b!154452 res!72881) b!154455))

(assert (= (and b!154455 c!29611) b!154453))

(assert (= (and b!154455 (not c!29611)) b!154456))

(assert (= (or b!154453 b!154456) bm!17179))

(assert (=> b!154452 m!187945))

(assert (=> b!154452 m!187945))

(assert (=> b!154452 m!187947))

(assert (=> b!154454 m!187945))

(assert (=> b!154454 m!187945))

(declare-fun m!188011 () Bool)

(assert (=> b!154454 m!188011))

(assert (=> bm!17179 m!187945))

(declare-fun m!188013 () Bool)

(assert (=> bm!17179 m!188013))

(assert (=> b!154455 m!187945))

(assert (=> b!154455 m!187945))

(assert (=> b!154455 m!187947))

(assert (=> bm!17142 d!50655))

(declare-fun d!50657 () Bool)

(assert (=> d!50657 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!80990 () Unit!4887)

(assert (=> d!50657 (= lt!80990 (choose!927 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!100899 () Bool)

(assert (=> d!50657 e!100899))

(declare-fun res!72882 () Bool)

(assert (=> d!50657 (=> (not res!72882) (not e!100899))))

(assert (=> d!50657 (= res!72882 (isStrictlySorted!325 (toList!909 lt!80722)))))

(assert (=> d!50657 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000) lt!80990)))

(declare-fun b!154457 () Bool)

(assert (=> b!154457 (= e!100899 (containsKey!185 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50657 res!72882) b!154457))

(assert (=> d!50657 m!187401))

(assert (=> d!50657 m!187401))

(assert (=> d!50657 m!187511))

(declare-fun m!188015 () Bool)

(assert (=> d!50657 m!188015))

(assert (=> d!50657 m!187981))

(assert (=> b!154457 m!187507))

(assert (=> b!154145 d!50657))

(declare-fun d!50659 () Bool)

(assert (=> d!50659 (= (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!436 (getValueByKey!181 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!6518 () Bool)

(assert (= bs!6518 d!50659))

(assert (=> bs!6518 m!187401))

(declare-fun m!188017 () Bool)

(assert (=> bs!6518 m!188017))

(assert (=> b!154145 d!50659))

(assert (=> b!154145 d!50521))

(declare-fun d!50661 () Bool)

(assert (=> d!50661 (= (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80738)) (v!3416 (getValueByKey!181 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80738)))))

(assert (=> d!50457 d!50661))

(declare-fun c!29612 () Bool)

(declare-fun d!50663 () Bool)

(assert (=> d!50663 (= c!29612 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80738)))))

(declare-fun e!100900 () Option!187)

(assert (=> d!50663 (= (getValueByKey!181 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80738) e!100900)))

(declare-fun b!154459 () Bool)

(declare-fun e!100901 () Option!187)

(assert (=> b!154459 (= e!100900 e!100901)))

(declare-fun c!29613 () Bool)

(assert (=> b!154459 (= c!29613 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (not (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80738))))))

(declare-fun b!154458 () Bool)

(assert (=> b!154458 (= e!100900 (Some!186 (_2!1411 (h!2412 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun b!154460 () Bool)

(assert (=> b!154460 (= e!100901 (getValueByKey!181 (t!6592 (toList!909 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!80738))))

(declare-fun b!154461 () Bool)

(assert (=> b!154461 (= e!100901 None!185)))

(assert (= (and d!50663 c!29612) b!154458))

(assert (= (and d!50663 (not c!29612)) b!154459))

(assert (= (and b!154459 c!29613) b!154460))

(assert (= (and b!154459 (not c!29613)) b!154461))

(declare-fun m!188019 () Bool)

(assert (=> b!154460 m!188019))

(assert (=> d!50457 d!50663))

(declare-fun b!154462 () Bool)

(declare-fun e!100902 () (_ BitVec 32))

(declare-fun call!17183 () (_ BitVec 32))

(assert (=> b!154462 (= e!100902 call!17183)))

(declare-fun bm!17180 () Bool)

(assert (=> bm!17180 (= call!17183 (arrayCountValidKeys!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154463 () Bool)

(assert (=> b!154463 (= e!100902 (bvadd #b00000000000000000000000000000001 call!17183))))

(declare-fun b!154464 () Bool)

(declare-fun e!100903 () (_ BitVec 32))

(assert (=> b!154464 (= e!100903 #b00000000000000000000000000000000)))

(declare-fun b!154465 () Bool)

(assert (=> b!154465 (= e!100903 e!100902)))

(declare-fun c!29614 () Bool)

(assert (=> b!154465 (= c!29614 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!50665 () Bool)

(declare-fun lt!80991 () (_ BitVec 32))

(assert (=> d!50665 (and (bvsge lt!80991 #b00000000000000000000000000000000) (bvsle lt!80991 (bvsub (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!50665 (= lt!80991 e!100903)))

(declare-fun c!29615 () Bool)

(assert (=> d!50665 (= c!29615 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50665 (and (bvsle #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50665 (= (arrayCountValidKeys!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))) lt!80991)))

(assert (= (and d!50665 c!29615) b!154464))

(assert (= (and d!50665 (not c!29615)) b!154465))

(assert (= (and b!154465 c!29614) b!154463))

(assert (= (and b!154465 (not c!29614)) b!154462))

(assert (= (or b!154463 b!154462) bm!17180))

(declare-fun m!188021 () Bool)

(assert (=> bm!17180 m!188021))

(assert (=> b!154465 m!187423))

(assert (=> b!154465 m!187423))

(assert (=> b!154465 m!187425))

(assert (=> b!154142 d!50665))

(declare-fun d!50667 () Bool)

(assert (=> d!50667 (= (validMask!0 (mask!7466 newMap!16)) (and (or (= (mask!7466 newMap!16) #b00000000000000000000000000000111) (= (mask!7466 newMap!16) #b00000000000000000000000000001111) (= (mask!7466 newMap!16) #b00000000000000000000000000011111) (= (mask!7466 newMap!16) #b00000000000000000000000000111111) (= (mask!7466 newMap!16) #b00000000000000000000000001111111) (= (mask!7466 newMap!16) #b00000000000000000000000011111111) (= (mask!7466 newMap!16) #b00000000000000000000000111111111) (= (mask!7466 newMap!16) #b00000000000000000000001111111111) (= (mask!7466 newMap!16) #b00000000000000000000011111111111) (= (mask!7466 newMap!16) #b00000000000000000000111111111111) (= (mask!7466 newMap!16) #b00000000000000000001111111111111) (= (mask!7466 newMap!16) #b00000000000000000011111111111111) (= (mask!7466 newMap!16) #b00000000000000000111111111111111) (= (mask!7466 newMap!16) #b00000000000000001111111111111111) (= (mask!7466 newMap!16) #b00000000000000011111111111111111) (= (mask!7466 newMap!16) #b00000000000000111111111111111111) (= (mask!7466 newMap!16) #b00000000000001111111111111111111) (= (mask!7466 newMap!16) #b00000000000011111111111111111111) (= (mask!7466 newMap!16) #b00000000000111111111111111111111) (= (mask!7466 newMap!16) #b00000000001111111111111111111111) (= (mask!7466 newMap!16) #b00000000011111111111111111111111) (= (mask!7466 newMap!16) #b00000000111111111111111111111111) (= (mask!7466 newMap!16) #b00000001111111111111111111111111) (= (mask!7466 newMap!16) #b00000011111111111111111111111111) (= (mask!7466 newMap!16) #b00000111111111111111111111111111) (= (mask!7466 newMap!16) #b00001111111111111111111111111111) (= (mask!7466 newMap!16) #b00011111111111111111111111111111) (= (mask!7466 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7466 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!50513 d!50667))

(declare-fun d!50669 () Bool)

(declare-fun e!100905 () Bool)

(assert (=> d!50669 e!100905))

(declare-fun res!72883 () Bool)

(assert (=> d!50669 (=> res!72883 e!100905)))

(declare-fun lt!80994 () Bool)

(assert (=> d!50669 (= res!72883 (not lt!80994))))

(declare-fun lt!80992 () Bool)

(assert (=> d!50669 (= lt!80994 lt!80992)))

(declare-fun lt!80995 () Unit!4887)

(declare-fun e!100904 () Unit!4887)

(assert (=> d!50669 (= lt!80995 e!100904)))

(declare-fun c!29616 () Bool)

(assert (=> d!50669 (= c!29616 lt!80992)))

(assert (=> d!50669 (= lt!80992 (containsKey!185 (toList!909 lt!80854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50669 (= (contains!953 lt!80854 #b1000000000000000000000000000000000000000000000000000000000000000) lt!80994)))

(declare-fun b!154466 () Bool)

(declare-fun lt!80993 () Unit!4887)

(assert (=> b!154466 (= e!100904 lt!80993)))

(assert (=> b!154466 (= lt!80993 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154466 (isDefined!135 (getValueByKey!181 (toList!909 lt!80854) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154467 () Bool)

(declare-fun Unit!4904 () Unit!4887)

(assert (=> b!154467 (= e!100904 Unit!4904)))

(declare-fun b!154468 () Bool)

(assert (=> b!154468 (= e!100905 (isDefined!135 (getValueByKey!181 (toList!909 lt!80854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50669 c!29616) b!154466))

(assert (= (and d!50669 (not c!29616)) b!154467))

(assert (= (and d!50669 (not res!72883)) b!154468))

(declare-fun m!188023 () Bool)

(assert (=> d!50669 m!188023))

(declare-fun m!188025 () Bool)

(assert (=> b!154466 m!188025))

(declare-fun m!188027 () Bool)

(assert (=> b!154466 m!188027))

(assert (=> b!154466 m!188027))

(declare-fun m!188029 () Bool)

(assert (=> b!154466 m!188029))

(assert (=> b!154468 m!188027))

(assert (=> b!154468 m!188027))

(assert (=> b!154468 m!188029))

(assert (=> bm!17146 d!50669))

(declare-fun d!50671 () Bool)

(declare-fun res!72884 () Bool)

(declare-fun e!100906 () Bool)

(assert (=> d!50671 (=> res!72884 e!100906)))

(assert (=> d!50671 (= res!72884 (and ((_ is Cons!1803) (toList!909 lt!80722)) (= (_1!1411 (h!2412 (toList!909 lt!80722))) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50671 (= (containsKey!185 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!100906)))

(declare-fun b!154469 () Bool)

(declare-fun e!100907 () Bool)

(assert (=> b!154469 (= e!100906 e!100907)))

(declare-fun res!72885 () Bool)

(assert (=> b!154469 (=> (not res!72885) (not e!100907))))

(assert (=> b!154469 (= res!72885 (and (or (not ((_ is Cons!1803) (toList!909 lt!80722))) (bvsle (_1!1411 (h!2412 (toList!909 lt!80722))) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1803) (toList!909 lt!80722)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80722))) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!154470 () Bool)

(assert (=> b!154470 (= e!100907 (containsKey!185 (t!6592 (toList!909 lt!80722)) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!50671 (not res!72884)) b!154469))

(assert (= (and b!154469 res!72885) b!154470))

(assert (=> b!154470 m!187225))

(declare-fun m!188031 () Bool)

(assert (=> b!154470 m!188031))

(assert (=> d!50483 d!50671))

(declare-fun d!50673 () Bool)

(declare-fun e!100909 () Bool)

(assert (=> d!50673 e!100909))

(declare-fun res!72886 () Bool)

(assert (=> d!50673 (=> res!72886 e!100909)))

(declare-fun lt!80998 () Bool)

(assert (=> d!50673 (= res!72886 (not lt!80998))))

(declare-fun lt!80996 () Bool)

(assert (=> d!50673 (= lt!80998 lt!80996)))

(declare-fun lt!80999 () Unit!4887)

(declare-fun e!100908 () Unit!4887)

(assert (=> d!50673 (= lt!80999 e!100908)))

(declare-fun c!29617 () Bool)

(assert (=> d!50673 (= c!29617 lt!80996)))

(assert (=> d!50673 (= lt!80996 (containsKey!185 (toList!909 lt!80834) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50673 (= (contains!953 lt!80834 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!80998)))

(declare-fun b!154471 () Bool)

(declare-fun lt!80997 () Unit!4887)

(assert (=> b!154471 (= e!100908 lt!80997)))

(assert (=> b!154471 (= lt!80997 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80834) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> b!154471 (isDefined!135 (getValueByKey!181 (toList!909 lt!80834) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154472 () Bool)

(declare-fun Unit!4905 () Unit!4887)

(assert (=> b!154472 (= e!100908 Unit!4905)))

(declare-fun b!154473 () Bool)

(assert (=> b!154473 (= e!100909 (isDefined!135 (getValueByKey!181 (toList!909 lt!80834) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(assert (= (and d!50673 c!29617) b!154471))

(assert (= (and d!50673 (not c!29617)) b!154472))

(assert (= (and d!50673 (not res!72886)) b!154473))

(declare-fun m!188033 () Bool)

(assert (=> d!50673 m!188033))

(declare-fun m!188035 () Bool)

(assert (=> b!154471 m!188035))

(assert (=> b!154471 m!187487))

(assert (=> b!154471 m!187487))

(declare-fun m!188037 () Bool)

(assert (=> b!154471 m!188037))

(assert (=> b!154473 m!187487))

(assert (=> b!154473 m!187487))

(assert (=> b!154473 m!188037))

(assert (=> d!50497 d!50673))

(declare-fun c!29618 () Bool)

(declare-fun d!50675 () Bool)

(assert (=> d!50675 (= c!29618 (and ((_ is Cons!1803) lt!80836) (= (_1!1411 (h!2412 lt!80836)) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun e!100910 () Option!187)

(assert (=> d!50675 (= (getValueByKey!181 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) e!100910)))

(declare-fun b!154475 () Bool)

(declare-fun e!100911 () Option!187)

(assert (=> b!154475 (= e!100910 e!100911)))

(declare-fun c!29619 () Bool)

(assert (=> b!154475 (= c!29619 (and ((_ is Cons!1803) lt!80836) (not (= (_1!1411 (h!2412 lt!80836)) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun b!154474 () Bool)

(assert (=> b!154474 (= e!100910 (Some!186 (_2!1411 (h!2412 lt!80836))))))

(declare-fun b!154476 () Bool)

(assert (=> b!154476 (= e!100911 (getValueByKey!181 (t!6592 lt!80836) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154477 () Bool)

(assert (=> b!154477 (= e!100911 None!185)))

(assert (= (and d!50675 c!29618) b!154474))

(assert (= (and d!50675 (not c!29618)) b!154475))

(assert (= (and b!154475 c!29619) b!154476))

(assert (= (and b!154475 (not c!29619)) b!154477))

(declare-fun m!188039 () Bool)

(assert (=> b!154476 m!188039))

(assert (=> d!50497 d!50675))

(declare-fun d!50677 () Bool)

(assert (=> d!50677 (= (getValueByKey!181 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) (Some!186 (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun lt!81000 () Unit!4887)

(assert (=> d!50677 (= lt!81000 (choose!926 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100912 () Bool)

(assert (=> d!50677 e!100912))

(declare-fun res!72887 () Bool)

(assert (=> d!50677 (=> (not res!72887) (not e!100912))))

(assert (=> d!50677 (= res!72887 (isStrictlySorted!325 lt!80836))))

(assert (=> d!50677 (= (lemmaContainsTupThenGetReturnValue!97 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!81000)))

(declare-fun b!154478 () Bool)

(declare-fun res!72888 () Bool)

(assert (=> b!154478 (=> (not res!72888) (not e!100912))))

(assert (=> b!154478 (= res!72888 (containsKey!185 lt!80836 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154479 () Bool)

(assert (=> b!154479 (= e!100912 (contains!954 lt!80836 (tuple2!2801 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(assert (= (and d!50677 res!72887) b!154478))

(assert (= (and b!154478 res!72888) b!154479))

(assert (=> d!50677 m!187481))

(declare-fun m!188041 () Bool)

(assert (=> d!50677 m!188041))

(declare-fun m!188043 () Bool)

(assert (=> d!50677 m!188043))

(declare-fun m!188045 () Bool)

(assert (=> b!154478 m!188045))

(declare-fun m!188047 () Bool)

(assert (=> b!154479 m!188047))

(assert (=> d!50497 d!50677))

(declare-fun b!154480 () Bool)

(declare-fun e!100913 () List!1807)

(declare-fun call!17186 () List!1807)

(assert (=> b!154480 (= e!100913 call!17186)))

(declare-fun e!100917 () List!1807)

(declare-fun b!154481 () Bool)

(assert (=> b!154481 (= e!100917 (insertStrictlySorted!100 (t!6592 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun c!29622 () Bool)

(declare-fun b!154482 () Bool)

(assert (=> b!154482 (= c!29622 (and ((_ is Cons!1803) (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (bvsgt (_1!1411 (h!2412 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun e!100914 () List!1807)

(assert (=> b!154482 (= e!100914 e!100913)))

(declare-fun b!154483 () Bool)

(declare-fun e!100915 () List!1807)

(declare-fun call!17185 () List!1807)

(assert (=> b!154483 (= e!100915 call!17185)))

(declare-fun e!100916 () Bool)

(declare-fun b!154484 () Bool)

(declare-fun lt!81001 () List!1807)

(assert (=> b!154484 (= e!100916 (contains!954 lt!81001 (tuple2!2801 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154485 () Bool)

(assert (=> b!154485 (= e!100915 e!100914)))

(declare-fun c!29623 () Bool)

(assert (=> b!154485 (= c!29623 (and ((_ is Cons!1803) (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (= (_1!1411 (h!2412 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun bm!17181 () Bool)

(declare-fun call!17184 () List!1807)

(assert (=> bm!17181 (= call!17186 call!17184)))

(declare-fun bm!17182 () Bool)

(assert (=> bm!17182 (= call!17184 call!17185)))

(declare-fun d!50679 () Bool)

(assert (=> d!50679 e!100916))

(declare-fun res!72890 () Bool)

(assert (=> d!50679 (=> (not res!72890) (not e!100916))))

(assert (=> d!50679 (= res!72890 (isStrictlySorted!325 lt!81001))))

(assert (=> d!50679 (= lt!81001 e!100915)))

(declare-fun c!29621 () Bool)

(assert (=> d!50679 (= c!29621 (and ((_ is Cons!1803) (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (bvslt (_1!1411 (h!2412 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(assert (=> d!50679 (isStrictlySorted!325 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))))))

(assert (=> d!50679 (= (insertStrictlySorted!100 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!81001)))

(declare-fun b!154486 () Bool)

(declare-fun res!72889 () Bool)

(assert (=> b!154486 (=> (not res!72889) (not e!100916))))

(assert (=> b!154486 (= res!72889 (containsKey!185 lt!81001 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun bm!17183 () Bool)

(assert (=> bm!17183 (= call!17185 ($colon$colon!95 e!100917 (ite c!29621 (h!2412 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (tuple2!2801 (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))) (_2!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun c!29620 () Bool)

(assert (=> bm!17183 (= c!29620 c!29621)))

(declare-fun b!154487 () Bool)

(assert (=> b!154487 (= e!100913 call!17186)))

(declare-fun b!154488 () Bool)

(assert (=> b!154488 (= e!100914 call!17184)))

(declare-fun b!154489 () Bool)

(assert (=> b!154489 (= e!100917 (ite c!29623 (t!6592 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (ite c!29622 (Cons!1803 (h!2412 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127)))) (t!6592 (toList!909 (ite c!29483 call!17128 (ite c!29484 call!17132 call!17127))))) Nil!1804)))))

(assert (= (and d!50679 c!29621) b!154483))

(assert (= (and d!50679 (not c!29621)) b!154485))

(assert (= (and b!154485 c!29623) b!154488))

(assert (= (and b!154485 (not c!29623)) b!154482))

(assert (= (and b!154482 c!29622) b!154480))

(assert (= (and b!154482 (not c!29622)) b!154487))

(assert (= (or b!154480 b!154487) bm!17181))

(assert (= (or b!154488 bm!17181) bm!17182))

(assert (= (or b!154483 bm!17182) bm!17183))

(assert (= (and bm!17183 c!29620) b!154481))

(assert (= (and bm!17183 (not c!29620)) b!154489))

(assert (= (and d!50679 res!72890) b!154486))

(assert (= (and b!154486 res!72889) b!154484))

(declare-fun m!188049 () Bool)

(assert (=> d!50679 m!188049))

(declare-fun m!188051 () Bool)

(assert (=> d!50679 m!188051))

(declare-fun m!188053 () Bool)

(assert (=> b!154486 m!188053))

(declare-fun m!188055 () Bool)

(assert (=> b!154481 m!188055))

(declare-fun m!188057 () Bool)

(assert (=> b!154484 m!188057))

(declare-fun m!188059 () Bool)

(assert (=> bm!17183 m!188059))

(assert (=> d!50497 d!50679))

(declare-fun d!50681 () Bool)

(declare-fun e!100919 () Bool)

(assert (=> d!50681 e!100919))

(declare-fun res!72891 () Bool)

(assert (=> d!50681 (=> res!72891 e!100919)))

(declare-fun lt!81004 () Bool)

(assert (=> d!50681 (= res!72891 (not lt!81004))))

(declare-fun lt!81002 () Bool)

(assert (=> d!50681 (= lt!81004 lt!81002)))

(declare-fun lt!81005 () Unit!4887)

(declare-fun e!100918 () Unit!4887)

(assert (=> d!50681 (= lt!81005 e!100918)))

(declare-fun c!29624 () Bool)

(assert (=> d!50681 (= c!29624 lt!81002)))

(assert (=> d!50681 (= lt!81002 (containsKey!185 (toList!909 lt!80764) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50681 (= (contains!953 lt!80764 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81004)))

(declare-fun b!154490 () Bool)

(declare-fun lt!81003 () Unit!4887)

(assert (=> b!154490 (= e!100918 lt!81003)))

(assert (=> b!154490 (= lt!81003 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80764) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154490 (isDefined!135 (getValueByKey!181 (toList!909 lt!80764) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154491 () Bool)

(declare-fun Unit!4906 () Unit!4887)

(assert (=> b!154491 (= e!100918 Unit!4906)))

(declare-fun b!154492 () Bool)

(assert (=> b!154492 (= e!100919 (isDefined!135 (getValueByKey!181 (toList!909 lt!80764) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50681 c!29624) b!154490))

(assert (= (and d!50681 (not c!29624)) b!154491))

(assert (= (and d!50681 (not res!72891)) b!154492))

(declare-fun m!188061 () Bool)

(assert (=> d!50681 m!188061))

(declare-fun m!188063 () Bool)

(assert (=> b!154490 m!188063))

(declare-fun m!188065 () Bool)

(assert (=> b!154490 m!188065))

(assert (=> b!154490 m!188065))

(declare-fun m!188067 () Bool)

(assert (=> b!154490 m!188067))

(assert (=> b!154492 m!188065))

(assert (=> b!154492 m!188065))

(assert (=> b!154492 m!188067))

(assert (=> d!50451 d!50681))

(assert (=> d!50451 d!50495))

(declare-fun d!50683 () Bool)

(assert (=> d!50683 (= (get!1605 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154103 d!50683))

(declare-fun d!50685 () Bool)

(assert (=> d!50685 (= (get!1603 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3416 (getValueByKey!181 (toList!909 lt!80722) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!50485 d!50685))

(assert (=> d!50485 d!50637))

(declare-fun d!50687 () Bool)

(declare-fun e!100921 () Bool)

(assert (=> d!50687 e!100921))

(declare-fun res!72892 () Bool)

(assert (=> d!50687 (=> res!72892 e!100921)))

(declare-fun lt!81008 () Bool)

(assert (=> d!50687 (= res!72892 (not lt!81008))))

(declare-fun lt!81006 () Bool)

(assert (=> d!50687 (= lt!81008 lt!81006)))

(declare-fun lt!81009 () Unit!4887)

(declare-fun e!100920 () Unit!4887)

(assert (=> d!50687 (= lt!81009 e!100920)))

(declare-fun c!29625 () Bool)

(assert (=> d!50687 (= c!29625 lt!81006)))

(assert (=> d!50687 (= lt!81006 (containsKey!185 (toList!909 lt!80854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50687 (= (contains!953 lt!80854 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81008)))

(declare-fun b!154493 () Bool)

(declare-fun lt!81007 () Unit!4887)

(assert (=> b!154493 (= e!100920 lt!81007)))

(assert (=> b!154493 (= lt!81007 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154493 (isDefined!135 (getValueByKey!181 (toList!909 lt!80854) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154494 () Bool)

(declare-fun Unit!4907 () Unit!4887)

(assert (=> b!154494 (= e!100920 Unit!4907)))

(declare-fun b!154495 () Bool)

(assert (=> b!154495 (= e!100921 (isDefined!135 (getValueByKey!181 (toList!909 lt!80854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50687 c!29625) b!154493))

(assert (= (and d!50687 (not c!29625)) b!154494))

(assert (= (and d!50687 (not res!72892)) b!154495))

(declare-fun m!188069 () Bool)

(assert (=> d!50687 m!188069))

(declare-fun m!188071 () Bool)

(assert (=> b!154493 m!188071))

(declare-fun m!188073 () Bool)

(assert (=> b!154493 m!188073))

(assert (=> b!154493 m!188073))

(declare-fun m!188075 () Bool)

(assert (=> b!154493 m!188075))

(assert (=> b!154495 m!188073))

(assert (=> b!154495 m!188073))

(assert (=> b!154495 m!188075))

(assert (=> bm!17150 d!50687))

(assert (=> d!50475 d!50459))

(declare-fun d!50689 () Bool)

(declare-fun e!100923 () Bool)

(assert (=> d!50689 e!100923))

(declare-fun res!72893 () Bool)

(assert (=> d!50689 (=> res!72893 e!100923)))

(declare-fun lt!81012 () Bool)

(assert (=> d!50689 (= res!72893 (not lt!81012))))

(declare-fun lt!81010 () Bool)

(assert (=> d!50689 (= lt!81012 lt!81010)))

(declare-fun lt!81013 () Unit!4887)

(declare-fun e!100922 () Unit!4887)

(assert (=> d!50689 (= lt!81013 e!100922)))

(declare-fun c!29626 () Bool)

(assert (=> d!50689 (= c!29626 lt!81010)))

(assert (=> d!50689 (= lt!81010 (containsKey!185 (toList!909 lt!80734) lt!80738))))

(assert (=> d!50689 (= (contains!953 lt!80734 lt!80738) lt!81012)))

(declare-fun b!154496 () Bool)

(declare-fun lt!81011 () Unit!4887)

(assert (=> b!154496 (= e!100922 lt!81011)))

(assert (=> b!154496 (= lt!81011 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80734) lt!80738))))

(assert (=> b!154496 (isDefined!135 (getValueByKey!181 (toList!909 lt!80734) lt!80738))))

(declare-fun b!154497 () Bool)

(declare-fun Unit!4908 () Unit!4887)

(assert (=> b!154497 (= e!100922 Unit!4908)))

(declare-fun b!154498 () Bool)

(assert (=> b!154498 (= e!100923 (isDefined!135 (getValueByKey!181 (toList!909 lt!80734) lt!80738)))))

(assert (= (and d!50689 c!29626) b!154496))

(assert (= (and d!50689 (not c!29626)) b!154497))

(assert (= (and d!50689 (not res!72893)) b!154498))

(declare-fun m!188077 () Bool)

(assert (=> d!50689 m!188077))

(declare-fun m!188079 () Bool)

(assert (=> b!154496 m!188079))

(assert (=> b!154496 m!187329))

(assert (=> b!154496 m!187329))

(declare-fun m!188081 () Bool)

(assert (=> b!154496 m!188081))

(assert (=> b!154498 m!187329))

(assert (=> b!154498 m!187329))

(assert (=> b!154498 m!188081))

(assert (=> d!50475 d!50689))

(assert (=> d!50475 d!50465))

(assert (=> d!50475 d!50457))

(declare-fun d!50691 () Bool)

(assert (=> d!50691 (= (apply!128 (+!181 lt!80734 (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80738) (apply!128 lt!80734 lt!80738))))

(assert (=> d!50691 true))

(declare-fun _$34!1043 () Unit!4887)

(assert (=> d!50691 (= (choose!924 lt!80734 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80738) _$34!1043)))

(declare-fun bs!6519 () Bool)

(assert (= bs!6519 d!50691))

(assert (=> bs!6519 m!187243))

(assert (=> bs!6519 m!187243))

(assert (=> bs!6519 m!187245))

(assert (=> bs!6519 m!187269))

(assert (=> d!50475 d!50691))

(declare-fun d!50693 () Bool)

(assert (=> d!50693 (arrayContainsKey!0 (_keys!4835 newMap!16) lt!80881 #b00000000000000000000000000000000)))

(declare-fun lt!81016 () Unit!4887)

(declare-fun choose!13 (array!5081 (_ BitVec 64) (_ BitVec 32)) Unit!4887)

(assert (=> d!50693 (= lt!81016 (choose!13 (_keys!4835 newMap!16) lt!80881 #b00000000000000000000000000000000))))

(assert (=> d!50693 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!50693 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4835 newMap!16) lt!80881 #b00000000000000000000000000000000) lt!81016)))

(declare-fun bs!6520 () Bool)

(assert (= bs!6520 d!50693))

(assert (=> bs!6520 m!187595))

(declare-fun m!188083 () Bool)

(assert (=> bs!6520 m!188083))

(assert (=> b!154206 d!50693))

(declare-fun d!50695 () Bool)

(declare-fun res!72898 () Bool)

(declare-fun e!100928 () Bool)

(assert (=> d!50695 (=> res!72898 e!100928)))

(assert (=> d!50695 (= res!72898 (= (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) lt!80881))))

(assert (=> d!50695 (= (arrayContainsKey!0 (_keys!4835 newMap!16) lt!80881 #b00000000000000000000000000000000) e!100928)))

(declare-fun b!154503 () Bool)

(declare-fun e!100929 () Bool)

(assert (=> b!154503 (= e!100928 e!100929)))

(declare-fun res!72899 () Bool)

(assert (=> b!154503 (=> (not res!72899) (not e!100929))))

(assert (=> b!154503 (= res!72899 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))))))

(declare-fun b!154504 () Bool)

(assert (=> b!154504 (= e!100929 (arrayContainsKey!0 (_keys!4835 newMap!16) lt!80881 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!50695 (not res!72898)) b!154503))

(assert (= (and b!154503 res!72899) b!154504))

(assert (=> d!50695 m!187491))

(declare-fun m!188085 () Bool)

(assert (=> b!154504 m!188085))

(assert (=> b!154206 d!50695))

(declare-fun b!154517 () Bool)

(declare-fun e!100936 () SeekEntryResult!289)

(declare-fun lt!81024 () SeekEntryResult!289)

(assert (=> b!154517 (= e!100936 (MissingZero!289 (index!3326 lt!81024)))))

(declare-fun b!154518 () Bool)

(declare-fun e!100937 () SeekEntryResult!289)

(assert (=> b!154518 (= e!100937 (Found!289 (index!3326 lt!81024)))))

(declare-fun b!154519 () Bool)

(declare-fun c!29635 () Bool)

(declare-fun lt!81023 () (_ BitVec 64))

(assert (=> b!154519 (= c!29635 (= lt!81023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154519 (= e!100937 e!100936)))

(declare-fun b!154520 () Bool)

(declare-fun e!100938 () SeekEntryResult!289)

(assert (=> b!154520 (= e!100938 e!100937)))

(assert (=> b!154520 (= lt!81023 (select (arr!2398 (_keys!4835 newMap!16)) (index!3326 lt!81024)))))

(declare-fun c!29634 () Bool)

(assert (=> b!154520 (= c!29634 (= lt!81023 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154522 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5081 (_ BitVec 32)) SeekEntryResult!289)

(assert (=> b!154522 (= e!100936 (seekKeyOrZeroReturnVacant!0 (x!17024 lt!81024) (index!3326 lt!81024) (index!3326 lt!81024) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) (_keys!4835 newMap!16) (mask!7466 newMap!16)))))

(declare-fun d!50697 () Bool)

(declare-fun lt!81025 () SeekEntryResult!289)

(assert (=> d!50697 (and (or ((_ is Undefined!289) lt!81025) (not ((_ is Found!289) lt!81025)) (and (bvsge (index!3325 lt!81025) #b00000000000000000000000000000000) (bvslt (index!3325 lt!81025) (size!2676 (_keys!4835 newMap!16))))) (or ((_ is Undefined!289) lt!81025) ((_ is Found!289) lt!81025) (not ((_ is MissingZero!289) lt!81025)) (and (bvsge (index!3324 lt!81025) #b00000000000000000000000000000000) (bvslt (index!3324 lt!81025) (size!2676 (_keys!4835 newMap!16))))) (or ((_ is Undefined!289) lt!81025) ((_ is Found!289) lt!81025) ((_ is MissingZero!289) lt!81025) (not ((_ is MissingVacant!289) lt!81025)) (and (bvsge (index!3327 lt!81025) #b00000000000000000000000000000000) (bvslt (index!3327 lt!81025) (size!2676 (_keys!4835 newMap!16))))) (or ((_ is Undefined!289) lt!81025) (ite ((_ is Found!289) lt!81025) (= (select (arr!2398 (_keys!4835 newMap!16)) (index!3325 lt!81025)) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!289) lt!81025) (= (select (arr!2398 (_keys!4835 newMap!16)) (index!3324 lt!81025)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!289) lt!81025) (= (select (arr!2398 (_keys!4835 newMap!16)) (index!3327 lt!81025)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50697 (= lt!81025 e!100938)))

(declare-fun c!29633 () Bool)

(assert (=> d!50697 (= c!29633 (and ((_ is Intermediate!289) lt!81024) (undefined!1101 lt!81024)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5081 (_ BitVec 32)) SeekEntryResult!289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!50697 (= lt!81024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) (mask!7466 newMap!16)) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) (_keys!4835 newMap!16) (mask!7466 newMap!16)))))

(assert (=> d!50697 (validMask!0 (mask!7466 newMap!16))))

(assert (=> d!50697 (= (seekEntryOrOpen!0 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000) (_keys!4835 newMap!16) (mask!7466 newMap!16)) lt!81025)))

(declare-fun b!154521 () Bool)

(assert (=> b!154521 (= e!100938 Undefined!289)))

(assert (= (and d!50697 c!29633) b!154521))

(assert (= (and d!50697 (not c!29633)) b!154520))

(assert (= (and b!154520 c!29634) b!154518))

(assert (= (and b!154520 (not c!29634)) b!154519))

(assert (= (and b!154519 c!29635) b!154517))

(assert (= (and b!154519 (not c!29635)) b!154522))

(declare-fun m!188087 () Bool)

(assert (=> b!154520 m!188087))

(assert (=> b!154522 m!187491))

(declare-fun m!188089 () Bool)

(assert (=> b!154522 m!188089))

(assert (=> d!50697 m!187491))

(declare-fun m!188091 () Bool)

(assert (=> d!50697 m!188091))

(declare-fun m!188093 () Bool)

(assert (=> d!50697 m!188093))

(declare-fun m!188095 () Bool)

(assert (=> d!50697 m!188095))

(declare-fun m!188097 () Bool)

(assert (=> d!50697 m!188097))

(assert (=> d!50697 m!188091))

(assert (=> d!50697 m!187491))

(declare-fun m!188099 () Bool)

(assert (=> d!50697 m!188099))

(assert (=> d!50697 m!187529))

(assert (=> b!154206 d!50697))

(assert (=> d!50509 d!50667))

(declare-fun d!50699 () Bool)

(declare-fun lt!81026 () Bool)

(assert (=> d!50699 (= lt!81026 (select (content!145 (toList!909 lt!80775)) (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun e!100939 () Bool)

(assert (=> d!50699 (= lt!81026 e!100939)))

(declare-fun res!72901 () Bool)

(assert (=> d!50699 (=> (not res!72901) (not e!100939))))

(assert (=> d!50699 (= res!72901 ((_ is Cons!1803) (toList!909 lt!80775)))))

(assert (=> d!50699 (= (contains!954 (toList!909 lt!80775) (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!81026)))

(declare-fun b!154523 () Bool)

(declare-fun e!100940 () Bool)

(assert (=> b!154523 (= e!100939 e!100940)))

(declare-fun res!72900 () Bool)

(assert (=> b!154523 (=> res!72900 e!100940)))

(assert (=> b!154523 (= res!72900 (= (h!2412 (toList!909 lt!80775)) (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154524 () Bool)

(assert (=> b!154524 (= e!100940 (contains!954 (t!6592 (toList!909 lt!80775)) (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50699 res!72901) b!154523))

(assert (= (and b!154523 (not res!72900)) b!154524))

(declare-fun m!188101 () Bool)

(assert (=> d!50699 m!188101))

(declare-fun m!188103 () Bool)

(assert (=> d!50699 m!188103))

(declare-fun m!188105 () Bool)

(assert (=> b!154524 m!188105))

(assert (=> b!154076 d!50699))

(declare-fun d!50701 () Bool)

(declare-fun res!72902 () Bool)

(declare-fun e!100941 () Bool)

(assert (=> d!50701 (=> res!72902 e!100941)))

(assert (=> d!50701 (= res!72902 (and ((_ is Cons!1803) (toList!909 lt!80722)) (= (_1!1411 (h!2412 (toList!909 lt!80722))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50701 (= (containsKey!185 (toList!909 lt!80722) #b1000000000000000000000000000000000000000000000000000000000000000) e!100941)))

(declare-fun b!154525 () Bool)

(declare-fun e!100942 () Bool)

(assert (=> b!154525 (= e!100941 e!100942)))

(declare-fun res!72903 () Bool)

(assert (=> b!154525 (=> (not res!72903) (not e!100942))))

(assert (=> b!154525 (= res!72903 (and (or (not ((_ is Cons!1803) (toList!909 lt!80722))) (bvsle (_1!1411 (h!2412 (toList!909 lt!80722))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1803) (toList!909 lt!80722)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80722))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154526 () Bool)

(assert (=> b!154526 (= e!100942 (containsKey!185 (t!6592 (toList!909 lt!80722)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50701 (not res!72902)) b!154525))

(assert (= (and b!154525 res!72903) b!154526))

(declare-fun m!188107 () Bool)

(assert (=> b!154526 m!188107))

(assert (=> d!50503 d!50701))

(assert (=> bm!17132 d!50525))

(declare-fun d!50703 () Bool)

(declare-fun e!100944 () Bool)

(assert (=> d!50703 e!100944))

(declare-fun res!72904 () Bool)

(assert (=> d!50703 (=> res!72904 e!100944)))

(declare-fun lt!81029 () Bool)

(assert (=> d!50703 (= res!72904 (not lt!81029))))

(declare-fun lt!81027 () Bool)

(assert (=> d!50703 (= lt!81029 lt!81027)))

(declare-fun lt!81030 () Unit!4887)

(declare-fun e!100943 () Unit!4887)

(assert (=> d!50703 (= lt!81030 e!100943)))

(declare-fun c!29636 () Bool)

(assert (=> d!50703 (= c!29636 lt!81027)))

(assert (=> d!50703 (= lt!81027 (containsKey!185 (toList!909 lt!80764) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50703 (= (contains!953 lt!80764 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81029)))

(declare-fun b!154527 () Bool)

(declare-fun lt!81028 () Unit!4887)

(assert (=> b!154527 (= e!100943 lt!81028)))

(assert (=> b!154527 (= lt!81028 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80764) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154527 (isDefined!135 (getValueByKey!181 (toList!909 lt!80764) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154528 () Bool)

(declare-fun Unit!4909 () Unit!4887)

(assert (=> b!154528 (= e!100943 Unit!4909)))

(declare-fun b!154529 () Bool)

(assert (=> b!154529 (= e!100944 (isDefined!135 (getValueByKey!181 (toList!909 lt!80764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50703 c!29636) b!154527))

(assert (= (and d!50703 (not c!29636)) b!154528))

(assert (= (and d!50703 (not res!72904)) b!154529))

(declare-fun m!188109 () Bool)

(assert (=> d!50703 m!188109))

(declare-fun m!188111 () Bool)

(assert (=> b!154527 m!188111))

(declare-fun m!188113 () Bool)

(assert (=> b!154527 m!188113))

(assert (=> b!154527 m!188113))

(declare-fun m!188115 () Bool)

(assert (=> b!154527 m!188115))

(assert (=> b!154529 m!188113))

(assert (=> b!154529 m!188113))

(assert (=> b!154529 m!188115))

(assert (=> b!154065 d!50703))

(declare-fun d!50705 () Bool)

(assert (=> d!50705 (= (apply!128 lt!80856 lt!80862) (get!1603 (getValueByKey!181 (toList!909 lt!80856) lt!80862)))))

(declare-fun bs!6521 () Bool)

(assert (= bs!6521 d!50705))

(declare-fun m!188117 () Bool)

(assert (=> bs!6521 m!188117))

(assert (=> bs!6521 m!188117))

(declare-fun m!188119 () Bool)

(assert (=> bs!6521 m!188119))

(assert (=> b!154184 d!50705))

(declare-fun d!50707 () Bool)

(declare-fun e!100945 () Bool)

(assert (=> d!50707 e!100945))

(declare-fun res!72906 () Bool)

(assert (=> d!50707 (=> (not res!72906) (not e!100945))))

(declare-fun lt!81032 () ListLongMap!1787)

(assert (=> d!50707 (= res!72906 (contains!953 lt!81032 (_1!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))))))

(declare-fun lt!81034 () List!1807)

(assert (=> d!50707 (= lt!81032 (ListLongMap!1788 lt!81034))))

(declare-fun lt!81033 () Unit!4887)

(declare-fun lt!81031 () Unit!4887)

(assert (=> d!50707 (= lt!81033 lt!81031)))

(assert (=> d!50707 (= (getValueByKey!181 lt!81034 (_1!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50707 (= lt!81031 (lemmaContainsTupThenGetReturnValue!97 lt!81034 (_1!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50707 (= lt!81034 (insertStrictlySorted!100 (toList!909 lt!80852) (_1!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50707 (= (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))) lt!81032)))

(declare-fun b!154530 () Bool)

(declare-fun res!72905 () Bool)

(assert (=> b!154530 (=> (not res!72905) (not e!100945))))

(assert (=> b!154530 (= res!72905 (= (getValueByKey!181 (toList!909 lt!81032) (_1!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))))))))

(declare-fun b!154531 () Bool)

(assert (=> b!154531 (= e!100945 (contains!954 (toList!909 lt!81032) (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))))))

(assert (= (and d!50707 res!72906) b!154530))

(assert (= (and b!154530 res!72905) b!154531))

(declare-fun m!188121 () Bool)

(assert (=> d!50707 m!188121))

(declare-fun m!188123 () Bool)

(assert (=> d!50707 m!188123))

(declare-fun m!188125 () Bool)

(assert (=> d!50707 m!188125))

(declare-fun m!188127 () Bool)

(assert (=> d!50707 m!188127))

(declare-fun m!188129 () Bool)

(assert (=> b!154530 m!188129))

(declare-fun m!188131 () Bool)

(assert (=> b!154531 m!188131))

(assert (=> b!154184 d!50707))

(declare-fun d!50709 () Bool)

(assert (=> d!50709 (= (apply!128 (+!181 lt!80871 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))) lt!80860) (apply!128 lt!80871 lt!80860))))

(declare-fun lt!81035 () Unit!4887)

(assert (=> d!50709 (= lt!81035 (choose!924 lt!80871 lt!80867 (zeroValue!2906 newMap!16) lt!80860))))

(declare-fun e!100946 () Bool)

(assert (=> d!50709 e!100946))

(declare-fun res!72907 () Bool)

(assert (=> d!50709 (=> (not res!72907) (not e!100946))))

(assert (=> d!50709 (= res!72907 (contains!953 lt!80871 lt!80860))))

(assert (=> d!50709 (= (addApplyDifferent!104 lt!80871 lt!80867 (zeroValue!2906 newMap!16) lt!80860) lt!81035)))

(declare-fun b!154532 () Bool)

(assert (=> b!154532 (= e!100946 (not (= lt!80860 lt!80867)))))

(assert (= (and d!50709 res!72907) b!154532))

(assert (=> d!50709 m!187561))

(assert (=> d!50709 m!187559))

(declare-fun m!188133 () Bool)

(assert (=> d!50709 m!188133))

(declare-fun m!188135 () Bool)

(assert (=> d!50709 m!188135))

(assert (=> d!50709 m!187561))

(assert (=> d!50709 m!187563))

(assert (=> b!154184 d!50709))

(declare-fun d!50711 () Bool)

(assert (=> d!50711 (= (apply!128 lt!80871 lt!80860) (get!1603 (getValueByKey!181 (toList!909 lt!80871) lt!80860)))))

(declare-fun bs!6522 () Bool)

(assert (= bs!6522 d!50711))

(declare-fun m!188137 () Bool)

(assert (=> bs!6522 m!188137))

(assert (=> bs!6522 m!188137))

(declare-fun m!188139 () Bool)

(assert (=> bs!6522 m!188139))

(assert (=> b!154184 d!50711))

(declare-fun d!50713 () Bool)

(declare-fun e!100947 () Bool)

(assert (=> d!50713 e!100947))

(declare-fun res!72909 () Bool)

(assert (=> d!50713 (=> (not res!72909) (not e!100947))))

(declare-fun lt!81037 () ListLongMap!1787)

(assert (=> d!50713 (= res!72909 (contains!953 lt!81037 (_1!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))))))

(declare-fun lt!81039 () List!1807)

(assert (=> d!50713 (= lt!81037 (ListLongMap!1788 lt!81039))))

(declare-fun lt!81038 () Unit!4887)

(declare-fun lt!81036 () Unit!4887)

(assert (=> d!50713 (= lt!81038 lt!81036)))

(assert (=> d!50713 (= (getValueByKey!181 lt!81039 (_1!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))))))

(assert (=> d!50713 (= lt!81036 (lemmaContainsTupThenGetReturnValue!97 lt!81039 (_1!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))))))

(assert (=> d!50713 (= lt!81039 (insertStrictlySorted!100 (toList!909 lt!80856) (_1!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))))))

(assert (=> d!50713 (= (+!181 lt!80856 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))) lt!81037)))

(declare-fun b!154533 () Bool)

(declare-fun res!72908 () Bool)

(assert (=> b!154533 (=> (not res!72908) (not e!100947))))

(assert (=> b!154533 (= res!72908 (= (getValueByKey!181 (toList!909 lt!81037) (_1!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))))))))

(declare-fun b!154534 () Bool)

(assert (=> b!154534 (= e!100947 (contains!954 (toList!909 lt!81037) (tuple2!2801 lt!80857 (minValue!2906 newMap!16))))))

(assert (= (and d!50713 res!72909) b!154533))

(assert (= (and b!154533 res!72908) b!154534))

(declare-fun m!188141 () Bool)

(assert (=> d!50713 m!188141))

(declare-fun m!188143 () Bool)

(assert (=> d!50713 m!188143))

(declare-fun m!188145 () Bool)

(assert (=> d!50713 m!188145))

(declare-fun m!188147 () Bool)

(assert (=> d!50713 m!188147))

(declare-fun m!188149 () Bool)

(assert (=> b!154533 m!188149))

(declare-fun m!188151 () Bool)

(assert (=> b!154534 m!188151))

(assert (=> b!154184 d!50713))

(declare-fun d!50715 () Bool)

(assert (=> d!50715 (= (apply!128 (+!181 lt!80856 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))) lt!80862) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80856 (tuple2!2801 lt!80857 (minValue!2906 newMap!16)))) lt!80862)))))

(declare-fun bs!6523 () Bool)

(assert (= bs!6523 d!50715))

(declare-fun m!188153 () Bool)

(assert (=> bs!6523 m!188153))

(assert (=> bs!6523 m!188153))

(declare-fun m!188155 () Bool)

(assert (=> bs!6523 m!188155))

(assert (=> b!154184 d!50715))

(declare-fun d!50717 () Bool)

(assert (=> d!50717 (= (apply!128 (+!181 lt!80866 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))) lt!80870) (apply!128 lt!80866 lt!80870))))

(declare-fun lt!81040 () Unit!4887)

(assert (=> d!50717 (= lt!81040 (choose!924 lt!80866 lt!80865 (minValue!2906 newMap!16) lt!80870))))

(declare-fun e!100948 () Bool)

(assert (=> d!50717 e!100948))

(declare-fun res!72910 () Bool)

(assert (=> d!50717 (=> (not res!72910) (not e!100948))))

(assert (=> d!50717 (= res!72910 (contains!953 lt!80866 lt!80870))))

(assert (=> d!50717 (= (addApplyDifferent!104 lt!80866 lt!80865 (minValue!2906 newMap!16) lt!80870) lt!81040)))

(declare-fun b!154535 () Bool)

(assert (=> b!154535 (= e!100948 (not (= lt!80870 lt!80865)))))

(assert (= (and d!50717 res!72910) b!154535))

(assert (=> d!50717 m!187555))

(assert (=> d!50717 m!187581))

(declare-fun m!188157 () Bool)

(assert (=> d!50717 m!188157))

(declare-fun m!188159 () Bool)

(assert (=> d!50717 m!188159))

(assert (=> d!50717 m!187555))

(assert (=> d!50717 m!187557))

(assert (=> b!154184 d!50717))

(declare-fun d!50719 () Bool)

(assert (=> d!50719 (= (apply!128 (+!181 lt!80866 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))) lt!80870) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80866 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))) lt!80870)))))

(declare-fun bs!6524 () Bool)

(assert (= bs!6524 d!50719))

(declare-fun m!188161 () Bool)

(assert (=> bs!6524 m!188161))

(assert (=> bs!6524 m!188161))

(declare-fun m!188163 () Bool)

(assert (=> bs!6524 m!188163))

(assert (=> b!154184 d!50719))

(declare-fun d!50721 () Bool)

(assert (=> d!50721 (= (apply!128 (+!181 lt!80856 (tuple2!2801 lt!80857 (minValue!2906 newMap!16))) lt!80862) (apply!128 lt!80856 lt!80862))))

(declare-fun lt!81041 () Unit!4887)

(assert (=> d!50721 (= lt!81041 (choose!924 lt!80856 lt!80857 (minValue!2906 newMap!16) lt!80862))))

(declare-fun e!100949 () Bool)

(assert (=> d!50721 e!100949))

(declare-fun res!72911 () Bool)

(assert (=> d!50721 (=> (not res!72911) (not e!100949))))

(assert (=> d!50721 (= res!72911 (contains!953 lt!80856 lt!80862))))

(assert (=> d!50721 (= (addApplyDifferent!104 lt!80856 lt!80857 (minValue!2906 newMap!16) lt!80862) lt!81041)))

(declare-fun b!154536 () Bool)

(assert (=> b!154536 (= e!100949 (not (= lt!80862 lt!80857)))))

(assert (= (and d!50721 res!72911) b!154536))

(assert (=> d!50721 m!187565))

(assert (=> d!50721 m!187577))

(declare-fun m!188165 () Bool)

(assert (=> d!50721 m!188165))

(declare-fun m!188167 () Bool)

(assert (=> d!50721 m!188167))

(assert (=> d!50721 m!187565))

(assert (=> d!50721 m!187571))

(assert (=> b!154184 d!50721))

(declare-fun d!50723 () Bool)

(declare-fun e!100950 () Bool)

(assert (=> d!50723 e!100950))

(declare-fun res!72913 () Bool)

(assert (=> d!50723 (=> (not res!72913) (not e!100950))))

(declare-fun lt!81043 () ListLongMap!1787)

(assert (=> d!50723 (= res!72913 (contains!953 lt!81043 (_1!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))))))

(declare-fun lt!81045 () List!1807)

(assert (=> d!50723 (= lt!81043 (ListLongMap!1788 lt!81045))))

(declare-fun lt!81044 () Unit!4887)

(declare-fun lt!81042 () Unit!4887)

(assert (=> d!50723 (= lt!81044 lt!81042)))

(assert (=> d!50723 (= (getValueByKey!181 lt!81045 (_1!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50723 (= lt!81042 (lemmaContainsTupThenGetReturnValue!97 lt!81045 (_1!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50723 (= lt!81045 (insertStrictlySorted!100 (toList!909 lt!80871) (_1!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))))))

(assert (=> d!50723 (= (+!181 lt!80871 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))) lt!81043)))

(declare-fun b!154537 () Bool)

(declare-fun res!72912 () Bool)

(assert (=> b!154537 (=> (not res!72912) (not e!100950))))

(assert (=> b!154537 (= res!72912 (= (getValueByKey!181 (toList!909 lt!81043) (_1!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))))))))

(declare-fun b!154538 () Bool)

(assert (=> b!154538 (= e!100950 (contains!954 (toList!909 lt!81043) (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))))))

(assert (= (and d!50723 res!72913) b!154537))

(assert (= (and b!154537 res!72912) b!154538))

(declare-fun m!188169 () Bool)

(assert (=> d!50723 m!188169))

(declare-fun m!188171 () Bool)

(assert (=> d!50723 m!188171))

(declare-fun m!188173 () Bool)

(assert (=> d!50723 m!188173))

(declare-fun m!188175 () Bool)

(assert (=> d!50723 m!188175))

(declare-fun m!188177 () Bool)

(assert (=> b!154537 m!188177))

(declare-fun m!188179 () Bool)

(assert (=> b!154538 m!188179))

(assert (=> b!154184 d!50723))

(declare-fun d!50725 () Bool)

(declare-fun e!100952 () Bool)

(assert (=> d!50725 e!100952))

(declare-fun res!72914 () Bool)

(assert (=> d!50725 (=> res!72914 e!100952)))

(declare-fun lt!81048 () Bool)

(assert (=> d!50725 (= res!72914 (not lt!81048))))

(declare-fun lt!81046 () Bool)

(assert (=> d!50725 (= lt!81048 lt!81046)))

(declare-fun lt!81049 () Unit!4887)

(declare-fun e!100951 () Unit!4887)

(assert (=> d!50725 (= lt!81049 e!100951)))

(declare-fun c!29637 () Bool)

(assert (=> d!50725 (= c!29637 lt!81046)))

(assert (=> d!50725 (= lt!81046 (containsKey!185 (toList!909 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))) lt!80868))))

(assert (=> d!50725 (= (contains!953 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))) lt!80868) lt!81048)))

(declare-fun b!154539 () Bool)

(declare-fun lt!81047 () Unit!4887)

(assert (=> b!154539 (= e!100951 lt!81047)))

(assert (=> b!154539 (= lt!81047 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))) lt!80868))))

(assert (=> b!154539 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))) lt!80868))))

(declare-fun b!154540 () Bool)

(declare-fun Unit!4910 () Unit!4887)

(assert (=> b!154540 (= e!100951 Unit!4910)))

(declare-fun b!154541 () Bool)

(assert (=> b!154541 (= e!100952 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16)))) lt!80868)))))

(assert (= (and d!50725 c!29637) b!154539))

(assert (= (and d!50725 (not c!29637)) b!154540))

(assert (= (and d!50725 (not res!72914)) b!154541))

(declare-fun m!188181 () Bool)

(assert (=> d!50725 m!188181))

(declare-fun m!188183 () Bool)

(assert (=> b!154539 m!188183))

(declare-fun m!188185 () Bool)

(assert (=> b!154539 m!188185))

(assert (=> b!154539 m!188185))

(declare-fun m!188187 () Bool)

(assert (=> b!154539 m!188187))

(assert (=> b!154541 m!188185))

(assert (=> b!154541 m!188185))

(assert (=> b!154541 m!188187))

(assert (=> b!154184 d!50725))

(declare-fun d!50727 () Bool)

(assert (=> d!50727 (contains!953 (+!181 lt!80852 (tuple2!2801 lt!80872 (zeroValue!2906 newMap!16))) lt!80868)))

(declare-fun lt!81050 () Unit!4887)

(assert (=> d!50727 (= lt!81050 (choose!925 lt!80852 lt!80872 (zeroValue!2906 newMap!16) lt!80868))))

(assert (=> d!50727 (contains!953 lt!80852 lt!80868)))

(assert (=> d!50727 (= (addStillContains!104 lt!80852 lt!80872 (zeroValue!2906 newMap!16) lt!80868) lt!81050)))

(declare-fun bs!6525 () Bool)

(assert (= bs!6525 d!50727))

(assert (=> bs!6525 m!187567))

(assert (=> bs!6525 m!187567))

(assert (=> bs!6525 m!187569))

(declare-fun m!188189 () Bool)

(assert (=> bs!6525 m!188189))

(declare-fun m!188191 () Bool)

(assert (=> bs!6525 m!188191))

(assert (=> b!154184 d!50727))

(assert (=> b!154184 d!50597))

(declare-fun d!50729 () Bool)

(assert (=> d!50729 (= (apply!128 (+!181 lt!80871 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16))) lt!80860) (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80871 (tuple2!2801 lt!80867 (zeroValue!2906 newMap!16)))) lt!80860)))))

(declare-fun bs!6526 () Bool)

(assert (= bs!6526 d!50729))

(declare-fun m!188193 () Bool)

(assert (=> bs!6526 m!188193))

(assert (=> bs!6526 m!188193))

(declare-fun m!188195 () Bool)

(assert (=> bs!6526 m!188195))

(assert (=> b!154184 d!50729))

(declare-fun d!50731 () Bool)

(declare-fun e!100953 () Bool)

(assert (=> d!50731 e!100953))

(declare-fun res!72916 () Bool)

(assert (=> d!50731 (=> (not res!72916) (not e!100953))))

(declare-fun lt!81052 () ListLongMap!1787)

(assert (=> d!50731 (= res!72916 (contains!953 lt!81052 (_1!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))))))

(declare-fun lt!81054 () List!1807)

(assert (=> d!50731 (= lt!81052 (ListLongMap!1788 lt!81054))))

(declare-fun lt!81053 () Unit!4887)

(declare-fun lt!81051 () Unit!4887)

(assert (=> d!50731 (= lt!81053 lt!81051)))

(assert (=> d!50731 (= (getValueByKey!181 lt!81054 (_1!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))))))

(assert (=> d!50731 (= lt!81051 (lemmaContainsTupThenGetReturnValue!97 lt!81054 (_1!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))))))

(assert (=> d!50731 (= lt!81054 (insertStrictlySorted!100 (toList!909 lt!80866) (_1!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))) (_2!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))))))

(assert (=> d!50731 (= (+!181 lt!80866 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))) lt!81052)))

(declare-fun b!154542 () Bool)

(declare-fun res!72915 () Bool)

(assert (=> b!154542 (=> (not res!72915) (not e!100953))))

(assert (=> b!154542 (= res!72915 (= (getValueByKey!181 (toList!909 lt!81052) (_1!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 lt!80865 (minValue!2906 newMap!16))))))))

(declare-fun b!154543 () Bool)

(assert (=> b!154543 (= e!100953 (contains!954 (toList!909 lt!81052) (tuple2!2801 lt!80865 (minValue!2906 newMap!16))))))

(assert (= (and d!50731 res!72916) b!154542))

(assert (= (and b!154542 res!72915) b!154543))

(declare-fun m!188197 () Bool)

(assert (=> d!50731 m!188197))

(declare-fun m!188199 () Bool)

(assert (=> d!50731 m!188199))

(declare-fun m!188201 () Bool)

(assert (=> d!50731 m!188201))

(declare-fun m!188203 () Bool)

(assert (=> d!50731 m!188203))

(declare-fun m!188205 () Bool)

(assert (=> b!154542 m!188205))

(declare-fun m!188207 () Bool)

(assert (=> b!154543 m!188207))

(assert (=> b!154184 d!50731))

(declare-fun d!50733 () Bool)

(assert (=> d!50733 (= (apply!128 lt!80866 lt!80870) (get!1603 (getValueByKey!181 (toList!909 lt!80866) lt!80870)))))

(declare-fun bs!6527 () Bool)

(assert (= bs!6527 d!50733))

(declare-fun m!188209 () Bool)

(assert (=> bs!6527 m!188209))

(assert (=> bs!6527 m!188209))

(declare-fun m!188211 () Bool)

(assert (=> bs!6527 m!188211))

(assert (=> b!154184 d!50733))

(declare-fun d!50735 () Bool)

(declare-fun c!29638 () Bool)

(assert (=> d!50735 (= c!29638 (and ((_ is Cons!1803) (toList!909 lt!80834)) (= (_1!1411 (h!2412 (toList!909 lt!80834))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun e!100954 () Option!187)

(assert (=> d!50735 (= (getValueByKey!181 (toList!909 lt!80834) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))) e!100954)))

(declare-fun b!154545 () Bool)

(declare-fun e!100955 () Option!187)

(assert (=> b!154545 (= e!100954 e!100955)))

(declare-fun c!29639 () Bool)

(assert (=> b!154545 (= c!29639 (and ((_ is Cons!1803) (toList!909 lt!80834)) (not (= (_1!1411 (h!2412 (toList!909 lt!80834))) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun b!154544 () Bool)

(assert (=> b!154544 (= e!100954 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80834)))))))

(declare-fun b!154546 () Bool)

(assert (=> b!154546 (= e!100955 (getValueByKey!181 (t!6592 (toList!909 lt!80834)) (_1!1411 (ite (or c!29483 c!29484) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154547 () Bool)

(assert (=> b!154547 (= e!100955 None!185)))

(assert (= (and d!50735 c!29638) b!154544))

(assert (= (and d!50735 (not c!29638)) b!154545))

(assert (= (and b!154545 c!29639) b!154546))

(assert (= (and b!154545 (not c!29639)) b!154547))

(declare-fun m!188213 () Bool)

(assert (=> b!154546 m!188213))

(assert (=> b!154125 d!50735))

(declare-fun d!50737 () Bool)

(assert (=> d!50737 (= (apply!128 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!80728) (apply!128 lt!80739 lt!80728))))

(assert (=> d!50737 true))

(declare-fun _$34!1044 () Unit!4887)

(assert (=> d!50737 (= (choose!924 lt!80739 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))) lt!80728) _$34!1044)))

(declare-fun bs!6528 () Bool)

(assert (= bs!6528 d!50737))

(assert (=> bs!6528 m!187249))

(assert (=> bs!6528 m!187249))

(assert (=> bs!6528 m!187251))

(assert (=> bs!6528 m!187247))

(assert (=> d!50467 d!50737))

(declare-fun d!50739 () Bool)

(declare-fun e!100957 () Bool)

(assert (=> d!50739 e!100957))

(declare-fun res!72917 () Bool)

(assert (=> d!50739 (=> res!72917 e!100957)))

(declare-fun lt!81057 () Bool)

(assert (=> d!50739 (= res!72917 (not lt!81057))))

(declare-fun lt!81055 () Bool)

(assert (=> d!50739 (= lt!81057 lt!81055)))

(declare-fun lt!81058 () Unit!4887)

(declare-fun e!100956 () Unit!4887)

(assert (=> d!50739 (= lt!81058 e!100956)))

(declare-fun c!29640 () Bool)

(assert (=> d!50739 (= c!29640 lt!81055)))

(assert (=> d!50739 (= lt!81055 (containsKey!185 (toList!909 lt!80739) lt!80728))))

(assert (=> d!50739 (= (contains!953 lt!80739 lt!80728) lt!81057)))

(declare-fun b!154548 () Bool)

(declare-fun lt!81056 () Unit!4887)

(assert (=> b!154548 (= e!100956 lt!81056)))

(assert (=> b!154548 (= lt!81056 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80739) lt!80728))))

(assert (=> b!154548 (isDefined!135 (getValueByKey!181 (toList!909 lt!80739) lt!80728))))

(declare-fun b!154549 () Bool)

(declare-fun Unit!4911 () Unit!4887)

(assert (=> b!154549 (= e!100956 Unit!4911)))

(declare-fun b!154550 () Bool)

(assert (=> b!154550 (= e!100957 (isDefined!135 (getValueByKey!181 (toList!909 lt!80739) lt!80728)))))

(assert (= (and d!50739 c!29640) b!154548))

(assert (= (and d!50739 (not c!29640)) b!154549))

(assert (= (and d!50739 (not res!72917)) b!154550))

(declare-fun m!188215 () Bool)

(assert (=> d!50739 m!188215))

(declare-fun m!188217 () Bool)

(assert (=> b!154548 m!188217))

(assert (=> b!154548 m!187397))

(assert (=> b!154548 m!187397))

(declare-fun m!188219 () Bool)

(assert (=> b!154548 m!188219))

(assert (=> b!154550 m!187397))

(assert (=> b!154550 m!187397))

(assert (=> b!154550 m!188219))

(assert (=> d!50467 d!50739))

(assert (=> d!50467 d!50461))

(assert (=> d!50467 d!50479))

(assert (=> d!50467 d!50463))

(declare-fun b!154551 () Bool)

(declare-fun e!100958 () (_ BitVec 32))

(declare-fun call!17187 () (_ BitVec 32))

(assert (=> b!154551 (= e!100958 call!17187)))

(declare-fun bm!17184 () Bool)

(assert (=> bm!17184 (= call!17187 (arrayCountValidKeys!0 (_keys!4835 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))))))

(declare-fun b!154552 () Bool)

(assert (=> b!154552 (= e!100958 (bvadd #b00000000000000000000000000000001 call!17187))))

(declare-fun b!154553 () Bool)

(declare-fun e!100959 () (_ BitVec 32))

(assert (=> b!154553 (= e!100959 #b00000000000000000000000000000000)))

(declare-fun b!154554 () Bool)

(assert (=> b!154554 (= e!100959 e!100958)))

(declare-fun c!29641 () Bool)

(assert (=> b!154554 (= c!29641 (validKeyInArray!0 (select (arr!2398 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!50741 () Bool)

(declare-fun lt!81059 () (_ BitVec 32))

(assert (=> d!50741 (and (bvsge lt!81059 #b00000000000000000000000000000000) (bvsle lt!81059 (bvsub (size!2676 (_keys!4835 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!50741 (= lt!81059 e!100959)))

(declare-fun c!29642 () Bool)

(assert (=> d!50741 (= c!29642 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50741 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2676 (_keys!4835 newMap!16)) (size!2676 (_keys!4835 newMap!16))))))

(assert (=> d!50741 (= (arrayCountValidKeys!0 (_keys!4835 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2676 (_keys!4835 newMap!16))) lt!81059)))

(assert (= (and d!50741 c!29642) b!154553))

(assert (= (and d!50741 (not c!29642)) b!154554))

(assert (= (and b!154554 c!29641) b!154552))

(assert (= (and b!154554 (not c!29641)) b!154551))

(assert (= (or b!154552 b!154551) bm!17184))

(declare-fun m!188221 () Bool)

(assert (=> bm!17184 m!188221))

(assert (=> b!154554 m!187945))

(assert (=> b!154554 m!187945))

(assert (=> b!154554 m!187947))

(assert (=> bm!17145 d!50741))

(declare-fun d!50743 () Bool)

(assert (=> d!50743 (= (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!154108 d!50743))

(declare-fun d!50745 () Bool)

(assert (=> d!50745 (= (get!1603 (getValueByKey!181 (toList!909 lt!80739) lt!80728)) (v!3416 (getValueByKey!181 (toList!909 lt!80739) lt!80728)))))

(assert (=> d!50479 d!50745))

(declare-fun d!50747 () Bool)

(declare-fun c!29643 () Bool)

(assert (=> d!50747 (= c!29643 (and ((_ is Cons!1803) (toList!909 lt!80739)) (= (_1!1411 (h!2412 (toList!909 lt!80739))) lt!80728)))))

(declare-fun e!100960 () Option!187)

(assert (=> d!50747 (= (getValueByKey!181 (toList!909 lt!80739) lt!80728) e!100960)))

(declare-fun b!154556 () Bool)

(declare-fun e!100961 () Option!187)

(assert (=> b!154556 (= e!100960 e!100961)))

(declare-fun c!29644 () Bool)

(assert (=> b!154556 (= c!29644 (and ((_ is Cons!1803) (toList!909 lt!80739)) (not (= (_1!1411 (h!2412 (toList!909 lt!80739))) lt!80728))))))

(declare-fun b!154555 () Bool)

(assert (=> b!154555 (= e!100960 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80739)))))))

(declare-fun b!154557 () Bool)

(assert (=> b!154557 (= e!100961 (getValueByKey!181 (t!6592 (toList!909 lt!80739)) lt!80728))))

(declare-fun b!154558 () Bool)

(assert (=> b!154558 (= e!100961 None!185)))

(assert (= (and d!50747 c!29643) b!154555))

(assert (= (and d!50747 (not c!29643)) b!154556))

(assert (= (and b!154556 c!29644) b!154557))

(assert (= (and b!154556 (not c!29644)) b!154558))

(declare-fun m!188223 () Bool)

(assert (=> b!154557 m!188223))

(assert (=> d!50479 d!50747))

(declare-fun d!50749 () Bool)

(assert (=> d!50749 (= (apply!128 lt!80854 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1603 (getValueByKey!181 (toList!909 lt!80854) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6529 () Bool)

(assert (= bs!6529 d!50749))

(assert (=> bs!6529 m!188073))

(assert (=> bs!6529 m!188073))

(declare-fun m!188225 () Bool)

(assert (=> bs!6529 m!188225))

(assert (=> b!154183 d!50749))

(declare-fun d!50751 () Bool)

(assert (=> d!50751 (= (apply!128 lt!80764 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1603 (getValueByKey!181 (toList!909 lt!80764) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6530 () Bool)

(assert (= bs!6530 d!50751))

(assert (=> bs!6530 m!187225))

(declare-fun m!188227 () Bool)

(assert (=> bs!6530 m!188227))

(assert (=> bs!6530 m!188227))

(declare-fun m!188229 () Bool)

(assert (=> bs!6530 m!188229))

(assert (=> b!154064 d!50751))

(assert (=> b!154064 d!50487))

(declare-fun d!50753 () Bool)

(declare-fun lt!81062 () Bool)

(declare-fun content!146 (List!1810) (InoxSet (_ BitVec 64)))

(assert (=> d!50753 (= lt!81062 (select (content!146 Nil!1807) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!100967 () Bool)

(assert (=> d!50753 (= lt!81062 e!100967)))

(declare-fun res!72922 () Bool)

(assert (=> d!50753 (=> (not res!72922) (not e!100967))))

(assert (=> d!50753 (= res!72922 ((_ is Cons!1806) Nil!1807))))

(assert (=> d!50753 (= (contains!955 Nil!1807 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) lt!81062)))

(declare-fun b!154563 () Bool)

(declare-fun e!100966 () Bool)

(assert (=> b!154563 (= e!100967 e!100966)))

(declare-fun res!72923 () Bool)

(assert (=> b!154563 (=> res!72923 e!100966)))

(assert (=> b!154563 (= res!72923 (= (h!2415 Nil!1807) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154564 () Bool)

(assert (=> b!154564 (= e!100966 (contains!955 (t!6599 Nil!1807) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!50753 res!72922) b!154563))

(assert (= (and b!154563 (not res!72923)) b!154564))

(declare-fun m!188231 () Bool)

(assert (=> d!50753 m!188231))

(assert (=> d!50753 m!187491))

(declare-fun m!188233 () Bool)

(assert (=> d!50753 m!188233))

(assert (=> b!154564 m!187491))

(declare-fun m!188235 () Bool)

(assert (=> b!154564 m!188235))

(assert (=> b!154139 d!50753))

(declare-fun d!50755 () Bool)

(declare-fun e!100968 () Bool)

(assert (=> d!50755 e!100968))

(declare-fun res!72925 () Bool)

(assert (=> d!50755 (=> (not res!72925) (not e!100968))))

(declare-fun lt!81064 () ListLongMap!1787)

(assert (=> d!50755 (= res!72925 (contains!953 lt!81064 (_1!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(declare-fun lt!81066 () List!1807)

(assert (=> d!50755 (= lt!81064 (ListLongMap!1788 lt!81066))))

(declare-fun lt!81065 () Unit!4887)

(declare-fun lt!81063 () Unit!4887)

(assert (=> d!50755 (= lt!81065 lt!81063)))

(assert (=> d!50755 (= (getValueByKey!181 lt!81066 (_1!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))) (Some!186 (_2!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(assert (=> d!50755 (= lt!81063 (lemmaContainsTupThenGetReturnValue!97 lt!81066 (_1!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (_2!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(assert (=> d!50755 (= lt!81066 (insertStrictlySorted!100 (toList!909 (ite c!29525 call!17151 (ite c!29526 call!17155 call!17150))) (_1!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (_2!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(assert (=> d!50755 (= (+!181 (ite c!29525 call!17151 (ite c!29526 call!17155 call!17150)) (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) lt!81064)))

(declare-fun b!154565 () Bool)

(declare-fun res!72924 () Bool)

(assert (=> b!154565 (=> (not res!72924) (not e!100968))))

(assert (=> b!154565 (= res!72924 (= (getValueByKey!181 (toList!909 lt!81064) (_1!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))) (Some!186 (_2!1411 (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))))

(declare-fun b!154566 () Bool)

(assert (=> b!154566 (= e!100968 (contains!954 (toList!909 lt!81064) (ite (or c!29525 c!29526) (tuple2!2801 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2906 newMap!16)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (= (and d!50755 res!72925) b!154565))

(assert (= (and b!154565 res!72924) b!154566))

(declare-fun m!188237 () Bool)

(assert (=> d!50755 m!188237))

(declare-fun m!188239 () Bool)

(assert (=> d!50755 m!188239))

(declare-fun m!188241 () Bool)

(assert (=> d!50755 m!188241))

(declare-fun m!188243 () Bool)

(assert (=> d!50755 m!188243))

(declare-fun m!188245 () Bool)

(assert (=> b!154565 m!188245))

(declare-fun m!188247 () Bool)

(assert (=> b!154566 m!188247))

(assert (=> bm!17147 d!50755))

(declare-fun d!50757 () Bool)

(declare-fun e!100970 () Bool)

(assert (=> d!50757 e!100970))

(declare-fun res!72926 () Bool)

(assert (=> d!50757 (=> res!72926 e!100970)))

(declare-fun lt!81069 () Bool)

(assert (=> d!50757 (= res!72926 (not lt!81069))))

(declare-fun lt!81067 () Bool)

(assert (=> d!50757 (= lt!81069 lt!81067)))

(declare-fun lt!81070 () Unit!4887)

(declare-fun e!100969 () Unit!4887)

(assert (=> d!50757 (= lt!81070 e!100969)))

(declare-fun c!29645 () Bool)

(assert (=> d!50757 (= c!29645 lt!81067)))

(assert (=> d!50757 (= lt!81067 (containsKey!185 (toList!909 lt!80764) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!50757 (= (contains!953 lt!80764 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!81069)))

(declare-fun b!154567 () Bool)

(declare-fun lt!81068 () Unit!4887)

(assert (=> b!154567 (= e!100969 lt!81068)))

(assert (=> b!154567 (= lt!81068 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80764) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154567 (isDefined!135 (getValueByKey!181 (toList!909 lt!80764) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!154568 () Bool)

(declare-fun Unit!4912 () Unit!4887)

(assert (=> b!154568 (= e!100969 Unit!4912)))

(declare-fun b!154569 () Bool)

(assert (=> b!154569 (= e!100970 (isDefined!135 (getValueByKey!181 (toList!909 lt!80764) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!50757 c!29645) b!154567))

(assert (= (and d!50757 (not c!29645)) b!154568))

(assert (= (and d!50757 (not res!72926)) b!154569))

(assert (=> d!50757 m!187225))

(declare-fun m!188249 () Bool)

(assert (=> d!50757 m!188249))

(assert (=> b!154567 m!187225))

(declare-fun m!188251 () Bool)

(assert (=> b!154567 m!188251))

(assert (=> b!154567 m!187225))

(assert (=> b!154567 m!188227))

(assert (=> b!154567 m!188227))

(declare-fun m!188253 () Bool)

(assert (=> b!154567 m!188253))

(assert (=> b!154569 m!187225))

(assert (=> b!154569 m!188227))

(assert (=> b!154569 m!188227))

(assert (=> b!154569 m!188253))

(assert (=> b!154060 d!50757))

(assert (=> bm!17139 d!50561))

(declare-fun d!50759 () Bool)

(assert (=> d!50759 (= (size!2682 newMap!16) (bvadd (_size!672 newMap!16) (bvsdiv (bvadd (extraKeys!2804 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!154172 d!50759))

(assert (=> b!154209 d!50537))

(declare-fun d!50761 () Bool)

(assert (=> d!50761 (= (get!1603 (getValueByKey!181 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80728)) (v!3416 (getValueByKey!181 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80728)))))

(assert (=> d!50463 d!50761))

(declare-fun d!50763 () Bool)

(declare-fun c!29646 () Bool)

(assert (=> d!50763 (= c!29646 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80728)))))

(declare-fun e!100971 () Option!187)

(assert (=> d!50763 (= (getValueByKey!181 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80728) e!100971)))

(declare-fun b!154571 () Bool)

(declare-fun e!100972 () Option!187)

(assert (=> b!154571 (= e!100971 e!100972)))

(declare-fun c!29647 () Bool)

(assert (=> b!154571 (= c!29647 (and ((_ is Cons!1803) (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) (not (= (_1!1411 (h!2412 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))) lt!80728))))))

(declare-fun b!154570 () Bool)

(assert (=> b!154570 (= e!100971 (Some!186 (_2!1411 (h!2412 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))))

(declare-fun b!154572 () Bool)

(assert (=> b!154572 (= e!100972 (getValueByKey!181 (t!6592 (toList!909 (+!181 lt!80739 (tuple2!2801 lt!80735 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))) lt!80728))))

(declare-fun b!154573 () Bool)

(assert (=> b!154573 (= e!100972 None!185)))

(assert (= (and d!50763 c!29646) b!154570))

(assert (= (and d!50763 (not c!29646)) b!154571))

(assert (= (and b!154571 c!29647) b!154572))

(assert (= (and b!154571 (not c!29647)) b!154573))

(declare-fun m!188255 () Bool)

(assert (=> b!154572 m!188255))

(assert (=> d!50463 d!50763))

(declare-fun d!50765 () Bool)

(assert (=> d!50765 (= (get!1604 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3410 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!154102 d!50765))

(declare-fun b!154575 () Bool)

(declare-fun res!72928 () Bool)

(declare-fun e!100973 () Bool)

(assert (=> b!154575 (=> (not res!72928) (not e!100973))))

(assert (=> b!154575 (= res!72928 (bvsge (size!2682 (v!3411 (underlying!521 thiss!992))) (_size!672 (v!3411 (underlying!521 thiss!992)))))))

(declare-fun b!154574 () Bool)

(declare-fun res!72929 () Bool)

(assert (=> b!154574 (=> (not res!72929) (not e!100973))))

(assert (=> b!154574 (= res!72929 (and (= (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001)) (= (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (size!2677 (_values!3046 (v!3411 (underlying!521 thiss!992))))) (bvsge (_size!672 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!672 (v!3411 (underlying!521 thiss!992))) (bvadd (mask!7466 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!154577 () Bool)

(assert (=> b!154577 (= e!100973 (and (bvsge (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!672 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!154576 () Bool)

(declare-fun res!72927 () Bool)

(assert (=> b!154576 (=> (not res!72927) (not e!100973))))

(assert (=> b!154576 (= res!72927 (= (size!2682 (v!3411 (underlying!521 thiss!992))) (bvadd (_size!672 (v!3411 (underlying!521 thiss!992))) (bvsdiv (bvadd (extraKeys!2804 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!50767 () Bool)

(declare-fun res!72930 () Bool)

(assert (=> d!50767 (=> (not res!72930) (not e!100973))))

(assert (=> d!50767 (= res!72930 (validMask!0 (mask!7466 (v!3411 (underlying!521 thiss!992)))))))

(assert (=> d!50767 (= (simpleValid!104 (v!3411 (underlying!521 thiss!992))) e!100973)))

(assert (= (and d!50767 res!72930) b!154574))

(assert (= (and b!154574 res!72929) b!154575))

(assert (= (and b!154575 res!72928) b!154576))

(assert (= (and b!154576 res!72927) b!154577))

(declare-fun m!188257 () Bool)

(assert (=> b!154575 m!188257))

(assert (=> b!154576 m!188257))

(assert (=> d!50767 m!187277))

(assert (=> d!50501 d!50767))

(declare-fun d!50769 () Bool)

(declare-fun e!100975 () Bool)

(assert (=> d!50769 e!100975))

(declare-fun res!72931 () Bool)

(assert (=> d!50769 (=> res!72931 e!100975)))

(declare-fun lt!81073 () Bool)

(assert (=> d!50769 (= res!72931 (not lt!81073))))

(declare-fun lt!81071 () Bool)

(assert (=> d!50769 (= lt!81073 lt!81071)))

(declare-fun lt!81074 () Unit!4887)

(declare-fun e!100974 () Unit!4887)

(assert (=> d!50769 (= lt!81074 e!100974)))

(declare-fun c!29648 () Bool)

(assert (=> d!50769 (= c!29648 lt!81071)))

(assert (=> d!50769 (= lt!81071 (containsKey!185 (toList!909 lt!80854) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!50769 (= (contains!953 lt!80854 (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)) lt!81073)))

(declare-fun b!154578 () Bool)

(declare-fun lt!81072 () Unit!4887)

(assert (=> b!154578 (= e!100974 lt!81072)))

(assert (=> b!154578 (= lt!81072 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80854) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!154578 (isDefined!135 (getValueByKey!181 (toList!909 lt!80854) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!154579 () Bool)

(declare-fun Unit!4913 () Unit!4887)

(assert (=> b!154579 (= e!100974 Unit!4913)))

(declare-fun b!154580 () Bool)

(assert (=> b!154580 (= e!100975 (isDefined!135 (getValueByKey!181 (toList!909 lt!80854) (select (arr!2398 (_keys!4835 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!50769 c!29648) b!154578))

(assert (= (and d!50769 (not c!29648)) b!154579))

(assert (= (and d!50769 (not res!72931)) b!154580))

(assert (=> d!50769 m!187491))

(declare-fun m!188259 () Bool)

(assert (=> d!50769 m!188259))

(assert (=> b!154578 m!187491))

(declare-fun m!188261 () Bool)

(assert (=> b!154578 m!188261))

(assert (=> b!154578 m!187491))

(assert (=> b!154578 m!187987))

(assert (=> b!154578 m!187987))

(declare-fun m!188263 () Bool)

(assert (=> b!154578 m!188263))

(assert (=> b!154580 m!187491))

(assert (=> b!154580 m!187987))

(assert (=> b!154580 m!187987))

(assert (=> b!154580 m!188263))

(assert (=> b!154177 d!50769))

(declare-fun d!50771 () Bool)

(assert (=> d!50771 (= (apply!128 lt!80854 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1603 (getValueByKey!181 (toList!909 lt!80854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6531 () Bool)

(assert (= bs!6531 d!50771))

(assert (=> bs!6531 m!188027))

(assert (=> bs!6531 m!188027))

(declare-fun m!188265 () Bool)

(assert (=> bs!6531 m!188265))

(assert (=> b!154194 d!50771))

(declare-fun d!50773 () Bool)

(assert (=> d!50773 (isDefined!135 (getValueByKey!181 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!81075 () Unit!4887)

(assert (=> d!50773 (= lt!81075 (choose!927 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!100976 () Bool)

(assert (=> d!50773 e!100976))

(declare-fun res!72932 () Bool)

(assert (=> d!50773 (=> (not res!72932) (not e!100976))))

(assert (=> d!50773 (= res!72932 (isStrictlySorted!325 (toList!909 lt!80722)))))

(assert (=> d!50773 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000) lt!81075)))

(declare-fun b!154581 () Bool)

(assert (=> b!154581 (= e!100976 (containsKey!185 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50773 res!72932) b!154581))

(assert (=> d!50773 m!187475))

(assert (=> d!50773 m!187475))

(assert (=> d!50773 m!187535))

(declare-fun m!188267 () Bool)

(assert (=> d!50773 m!188267))

(assert (=> d!50773 m!187981))

(assert (=> b!154581 m!187531))

(assert (=> b!154174 d!50773))

(assert (=> b!154174 d!50621))

(assert (=> b!154174 d!50623))

(assert (=> b!154119 d!50743))

(declare-fun d!50775 () Bool)

(declare-fun lt!81076 () Bool)

(assert (=> d!50775 (= lt!81076 (select (content!145 (toList!909 lt!80786)) (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun e!100977 () Bool)

(assert (=> d!50775 (= lt!81076 e!100977)))

(declare-fun res!72934 () Bool)

(assert (=> d!50775 (=> (not res!72934) (not e!100977))))

(assert (=> d!50775 (= res!72934 ((_ is Cons!1803) (toList!909 lt!80786)))))

(assert (=> d!50775 (= (contains!954 (toList!909 lt!80786) (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!81076)))

(declare-fun b!154582 () Bool)

(declare-fun e!100978 () Bool)

(assert (=> b!154582 (= e!100977 e!100978)))

(declare-fun res!72933 () Bool)

(assert (=> b!154582 (=> res!72933 e!100978)))

(assert (=> b!154582 (= res!72933 (= (h!2412 (toList!909 lt!80786)) (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154583 () Bool)

(assert (=> b!154583 (= e!100978 (contains!954 (t!6592 (toList!909 lt!80786)) (tuple2!2801 lt!80733 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50775 res!72934) b!154582))

(assert (= (and b!154582 (not res!72933)) b!154583))

(declare-fun m!188269 () Bool)

(assert (=> d!50775 m!188269))

(declare-fun m!188271 () Bool)

(assert (=> d!50775 m!188271))

(declare-fun m!188273 () Bool)

(assert (=> b!154583 m!188273))

(assert (=> b!154081 d!50775))

(declare-fun d!50777 () Bool)

(assert (=> d!50777 (= (get!1603 (getValueByKey!181 (toList!909 lt!80734) lt!80738)) (v!3416 (getValueByKey!181 (toList!909 lt!80734) lt!80738)))))

(assert (=> d!50459 d!50777))

(declare-fun d!50779 () Bool)

(declare-fun c!29649 () Bool)

(assert (=> d!50779 (= c!29649 (and ((_ is Cons!1803) (toList!909 lt!80734)) (= (_1!1411 (h!2412 (toList!909 lt!80734))) lt!80738)))))

(declare-fun e!100979 () Option!187)

(assert (=> d!50779 (= (getValueByKey!181 (toList!909 lt!80734) lt!80738) e!100979)))

(declare-fun b!154585 () Bool)

(declare-fun e!100980 () Option!187)

(assert (=> b!154585 (= e!100979 e!100980)))

(declare-fun c!29650 () Bool)

(assert (=> b!154585 (= c!29650 (and ((_ is Cons!1803) (toList!909 lt!80734)) (not (= (_1!1411 (h!2412 (toList!909 lt!80734))) lt!80738))))))

(declare-fun b!154584 () Bool)

(assert (=> b!154584 (= e!100979 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80734)))))))

(declare-fun b!154586 () Bool)

(assert (=> b!154586 (= e!100980 (getValueByKey!181 (t!6592 (toList!909 lt!80734)) lt!80738))))

(declare-fun b!154587 () Bool)

(assert (=> b!154587 (= e!100980 None!185)))

(assert (= (and d!50779 c!29649) b!154584))

(assert (= (and d!50779 (not c!29649)) b!154585))

(assert (= (and b!154585 c!29650) b!154586))

(assert (= (and b!154585 (not c!29650)) b!154587))

(declare-fun m!188275 () Bool)

(assert (=> b!154586 m!188275))

(assert (=> d!50459 d!50779))

(declare-fun d!50781 () Bool)

(declare-fun c!29651 () Bool)

(assert (=> d!50781 (= c!29651 (and ((_ is Cons!1803) (toList!909 lt!80775)) (= (_1!1411 (h!2412 (toList!909 lt!80775))) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100981 () Option!187)

(assert (=> d!50781 (= (getValueByKey!181 (toList!909 lt!80775) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100981)))

(declare-fun b!154589 () Bool)

(declare-fun e!100982 () Option!187)

(assert (=> b!154589 (= e!100981 e!100982)))

(declare-fun c!29652 () Bool)

(assert (=> b!154589 (= c!29652 (and ((_ is Cons!1803) (toList!909 lt!80775)) (not (= (_1!1411 (h!2412 (toList!909 lt!80775))) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154588 () Bool)

(assert (=> b!154588 (= e!100981 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80775)))))))

(declare-fun b!154590 () Bool)

(assert (=> b!154590 (= e!100982 (getValueByKey!181 (t!6592 (toList!909 lt!80775)) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154591 () Bool)

(assert (=> b!154591 (= e!100982 None!185)))

(assert (= (and d!50781 c!29651) b!154588))

(assert (= (and d!50781 (not c!29651)) b!154589))

(assert (= (and b!154589 c!29652) b!154590))

(assert (= (and b!154589 (not c!29652)) b!154591))

(declare-fun m!188277 () Bool)

(assert (=> b!154590 m!188277))

(assert (=> b!154075 d!50781))

(declare-fun d!50783 () Bool)

(declare-fun e!100983 () Bool)

(assert (=> d!50783 e!100983))

(declare-fun res!72936 () Bool)

(assert (=> d!50783 (=> (not res!72936) (not e!100983))))

(declare-fun lt!81078 () ListLongMap!1787)

(assert (=> d!50783 (= res!72936 (contains!953 lt!81078 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(declare-fun lt!81080 () List!1807)

(assert (=> d!50783 (= lt!81078 (ListLongMap!1788 lt!81080))))

(declare-fun lt!81079 () Unit!4887)

(declare-fun lt!81077 () Unit!4887)

(assert (=> d!50783 (= lt!81079 lt!81077)))

(assert (=> d!50783 (= (getValueByKey!181 lt!81080 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (=> d!50783 (= lt!81077 (lemmaContainsTupThenGetReturnValue!97 lt!81080 (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (=> d!50783 (= lt!81080 (insertStrictlySorted!100 (toList!909 call!17153) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))) (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))))))

(assert (=> d!50783 (= (+!181 call!17153 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))) lt!81078)))

(declare-fun b!154592 () Bool)

(declare-fun res!72935 () Bool)

(assert (=> b!154592 (=> (not res!72935) (not e!100983))))

(assert (=> b!154592 (= res!72935 (= (getValueByKey!181 (toList!909 lt!81078) (_1!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16)))) (Some!186 (_2!1411 (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))))

(declare-fun b!154593 () Bool)

(assert (=> b!154593 (= e!100983 (contains!954 (toList!909 lt!81078) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 newMap!16))))))

(assert (= (and d!50783 res!72936) b!154592))

(assert (= (and b!154592 res!72935) b!154593))

(declare-fun m!188279 () Bool)

(assert (=> d!50783 m!188279))

(declare-fun m!188281 () Bool)

(assert (=> d!50783 m!188281))

(declare-fun m!188283 () Bool)

(assert (=> d!50783 m!188283))

(declare-fun m!188285 () Bool)

(assert (=> d!50783 m!188285))

(declare-fun m!188287 () Bool)

(assert (=> b!154592 m!188287))

(declare-fun m!188289 () Bool)

(assert (=> b!154593 m!188289))

(assert (=> b!154187 d!50783))

(declare-fun d!50785 () Bool)

(declare-fun e!100984 () Bool)

(assert (=> d!50785 e!100984))

(declare-fun res!72938 () Bool)

(assert (=> d!50785 (=> (not res!72938) (not e!100984))))

(declare-fun lt!81082 () ListLongMap!1787)

(assert (=> d!50785 (= res!72938 (contains!953 lt!81082 (_1!1411 (tuple2!2801 lt!80765 lt!80762))))))

(declare-fun lt!81084 () List!1807)

(assert (=> d!50785 (= lt!81082 (ListLongMap!1788 lt!81084))))

(declare-fun lt!81083 () Unit!4887)

(declare-fun lt!81081 () Unit!4887)

(assert (=> d!50785 (= lt!81083 lt!81081)))

(assert (=> d!50785 (= (getValueByKey!181 lt!81084 (_1!1411 (tuple2!2801 lt!80765 lt!80762))) (Some!186 (_2!1411 (tuple2!2801 lt!80765 lt!80762))))))

(assert (=> d!50785 (= lt!81081 (lemmaContainsTupThenGetReturnValue!97 lt!81084 (_1!1411 (tuple2!2801 lt!80765 lt!80762)) (_2!1411 (tuple2!2801 lt!80765 lt!80762))))))

(assert (=> d!50785 (= lt!81084 (insertStrictlySorted!100 (toList!909 lt!80760) (_1!1411 (tuple2!2801 lt!80765 lt!80762)) (_2!1411 (tuple2!2801 lt!80765 lt!80762))))))

(assert (=> d!50785 (= (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762)) lt!81082)))

(declare-fun b!154594 () Bool)

(declare-fun res!72937 () Bool)

(assert (=> b!154594 (=> (not res!72937) (not e!100984))))

(assert (=> b!154594 (= res!72937 (= (getValueByKey!181 (toList!909 lt!81082) (_1!1411 (tuple2!2801 lt!80765 lt!80762))) (Some!186 (_2!1411 (tuple2!2801 lt!80765 lt!80762)))))))

(declare-fun b!154595 () Bool)

(assert (=> b!154595 (= e!100984 (contains!954 (toList!909 lt!81082) (tuple2!2801 lt!80765 lt!80762)))))

(assert (= (and d!50785 res!72938) b!154594))

(assert (= (and b!154594 res!72937) b!154595))

(declare-fun m!188291 () Bool)

(assert (=> d!50785 m!188291))

(declare-fun m!188293 () Bool)

(assert (=> d!50785 m!188293))

(declare-fun m!188295 () Bool)

(assert (=> d!50785 m!188295))

(declare-fun m!188297 () Bool)

(assert (=> d!50785 m!188297))

(declare-fun m!188299 () Bool)

(assert (=> b!154594 m!188299))

(declare-fun m!188301 () Bool)

(assert (=> b!154595 m!188301))

(assert (=> b!154068 d!50785))

(assert (=> b!154068 d!50487))

(declare-fun d!50787 () Bool)

(declare-fun e!100985 () Bool)

(assert (=> d!50787 e!100985))

(declare-fun res!72940 () Bool)

(assert (=> d!50787 (=> (not res!72940) (not e!100985))))

(declare-fun lt!81086 () ListLongMap!1787)

(assert (=> d!50787 (= res!72940 (contains!953 lt!81086 (_1!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!81088 () List!1807)

(assert (=> d!50787 (= lt!81086 (ListLongMap!1788 lt!81088))))

(declare-fun lt!81087 () Unit!4887)

(declare-fun lt!81085 () Unit!4887)

(assert (=> d!50787 (= lt!81087 lt!81085)))

(assert (=> d!50787 (= (getValueByKey!181 lt!81088 (_1!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!186 (_2!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50787 (= lt!81085 (lemmaContainsTupThenGetReturnValue!97 lt!81088 (_1!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50787 (= lt!81088 (insertStrictlySorted!100 (toList!909 call!17135) (_1!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50787 (= (+!181 call!17135 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!81086)))

(declare-fun b!154596 () Bool)

(declare-fun res!72939 () Bool)

(assert (=> b!154596 (=> (not res!72939) (not e!100985))))

(assert (=> b!154596 (= res!72939 (= (getValueByKey!181 (toList!909 lt!81086) (_1!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!186 (_2!1411 (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!154597 () Bool)

(assert (=> b!154597 (= e!100985 (contains!954 (toList!909 lt!81086) (tuple2!2801 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!50787 res!72940) b!154596))

(assert (= (and b!154596 res!72939) b!154597))

(declare-fun m!188303 () Bool)

(assert (=> d!50787 m!188303))

(declare-fun m!188305 () Bool)

(assert (=> d!50787 m!188305))

(declare-fun m!188307 () Bool)

(assert (=> d!50787 m!188307))

(declare-fun m!188309 () Bool)

(assert (=> d!50787 m!188309))

(declare-fun m!188311 () Bool)

(assert (=> b!154596 m!188311))

(declare-fun m!188313 () Bool)

(assert (=> b!154597 m!188313))

(assert (=> b!154068 d!50787))

(declare-fun d!50789 () Bool)

(assert (=> d!50789 (not (contains!953 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762)) lt!80759))))

(declare-fun lt!81091 () Unit!4887)

(declare-fun choose!928 (ListLongMap!1787 (_ BitVec 64) V!3681 (_ BitVec 64)) Unit!4887)

(assert (=> d!50789 (= lt!81091 (choose!928 lt!80760 lt!80765 lt!80762 lt!80759))))

(declare-fun e!100988 () Bool)

(assert (=> d!50789 e!100988))

(declare-fun res!72943 () Bool)

(assert (=> d!50789 (=> (not res!72943) (not e!100988))))

(assert (=> d!50789 (= res!72943 (not (contains!953 lt!80760 lt!80759)))))

(assert (=> d!50789 (= (addStillNotContains!71 lt!80760 lt!80765 lt!80762 lt!80759) lt!81091)))

(declare-fun b!154601 () Bool)

(assert (=> b!154601 (= e!100988 (not (= lt!80765 lt!80759)))))

(assert (= (and d!50789 res!72943) b!154601))

(assert (=> d!50789 m!187293))

(assert (=> d!50789 m!187293))

(assert (=> d!50789 m!187295))

(declare-fun m!188315 () Bool)

(assert (=> d!50789 m!188315))

(declare-fun m!188317 () Bool)

(assert (=> d!50789 m!188317))

(assert (=> b!154068 d!50789))

(declare-fun d!50791 () Bool)

(declare-fun e!100990 () Bool)

(assert (=> d!50791 e!100990))

(declare-fun res!72944 () Bool)

(assert (=> d!50791 (=> res!72944 e!100990)))

(declare-fun lt!81094 () Bool)

(assert (=> d!50791 (= res!72944 (not lt!81094))))

(declare-fun lt!81092 () Bool)

(assert (=> d!50791 (= lt!81094 lt!81092)))

(declare-fun lt!81095 () Unit!4887)

(declare-fun e!100989 () Unit!4887)

(assert (=> d!50791 (= lt!81095 e!100989)))

(declare-fun c!29653 () Bool)

(assert (=> d!50791 (= c!29653 lt!81092)))

(assert (=> d!50791 (= lt!81092 (containsKey!185 (toList!909 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762))) lt!80759))))

(assert (=> d!50791 (= (contains!953 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762)) lt!80759) lt!81094)))

(declare-fun b!154602 () Bool)

(declare-fun lt!81093 () Unit!4887)

(assert (=> b!154602 (= e!100989 lt!81093)))

(assert (=> b!154602 (= lt!81093 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762))) lt!80759))))

(assert (=> b!154602 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762))) lt!80759))))

(declare-fun b!154603 () Bool)

(declare-fun Unit!4914 () Unit!4887)

(assert (=> b!154603 (= e!100989 Unit!4914)))

(declare-fun b!154604 () Bool)

(assert (=> b!154604 (= e!100990 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80760 (tuple2!2801 lt!80765 lt!80762))) lt!80759)))))

(assert (= (and d!50791 c!29653) b!154602))

(assert (= (and d!50791 (not c!29653)) b!154603))

(assert (= (and d!50791 (not res!72944)) b!154604))

(declare-fun m!188319 () Bool)

(assert (=> d!50791 m!188319))

(declare-fun m!188321 () Bool)

(assert (=> b!154602 m!188321))

(declare-fun m!188323 () Bool)

(assert (=> b!154602 m!188323))

(assert (=> b!154602 m!188323))

(declare-fun m!188325 () Bool)

(assert (=> b!154602 m!188325))

(assert (=> b!154604 m!188323))

(assert (=> b!154604 m!188323))

(assert (=> b!154604 m!188325))

(assert (=> b!154068 d!50791))

(assert (=> b!154097 d!50635))

(assert (=> b!154097 d!50637))

(declare-fun d!50793 () Bool)

(assert (=> d!50793 (isDefined!135 (getValueByKey!181 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))

(declare-fun lt!81096 () Unit!4887)

(assert (=> d!50793 (= lt!81096 (choose!927 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))

(declare-fun e!100991 () Bool)

(assert (=> d!50793 e!100991))

(declare-fun res!72945 () Bool)

(assert (=> d!50793 (=> (not res!72945) (not e!100991))))

(assert (=> d!50793 (= res!72945 (isStrictlySorted!325 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50793 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736) lt!81096)))

(declare-fun b!154605 () Bool)

(assert (=> b!154605 (= e!100991 (containsKey!185 (toList!909 (+!181 lt!80720 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!80736))))

(assert (= (and d!50793 res!72945) b!154605))

(assert (=> d!50793 m!187369))

(assert (=> d!50793 m!187369))

(assert (=> d!50793 m!187371))

(declare-fun m!188327 () Bool)

(assert (=> d!50793 m!188327))

(declare-fun m!188329 () Bool)

(assert (=> d!50793 m!188329))

(assert (=> b!154605 m!187365))

(assert (=> b!154089 d!50793))

(assert (=> b!154089 d!50625))

(assert (=> b!154089 d!50627))

(declare-fun d!50795 () Bool)

(assert (=> d!50795 (= (apply!128 lt!80813 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)) (get!1603 (getValueByKey!181 (toList!909 lt!80813) (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000))))))

(declare-fun bs!6532 () Bool)

(assert (= bs!6532 d!50795))

(assert (=> bs!6532 m!187423))

(assert (=> bs!6532 m!187899))

(assert (=> bs!6532 m!187899))

(declare-fun m!188331 () Bool)

(assert (=> bs!6532 m!188331))

(assert (=> b!154112 d!50795))

(declare-fun d!50797 () Bool)

(declare-fun c!29654 () Bool)

(assert (=> d!50797 (= c!29654 ((_ is ValueCellFull!1169) (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!100992 () V!3681)

(assert (=> d!50797 (= (get!1602 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!100992)))

(declare-fun b!154606 () Bool)

(assert (=> b!154606 (= e!100992 (get!1604 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154607 () Bool)

(assert (=> b!154607 (= e!100992 (get!1605 (select (arr!2399 (_values!3046 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) (dynLambda!462 (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50797 c!29654) b!154606))

(assert (= (and d!50797 (not c!29654)) b!154607))

(assert (=> b!154606 m!187431))

(assert (=> b!154606 m!187233))

(declare-fun m!188333 () Bool)

(assert (=> b!154606 m!188333))

(assert (=> b!154607 m!187431))

(assert (=> b!154607 m!187233))

(declare-fun m!188335 () Bool)

(assert (=> b!154607 m!188335))

(assert (=> b!154112 d!50797))

(declare-fun d!50799 () Bool)

(declare-fun e!100994 () Bool)

(assert (=> d!50799 e!100994))

(declare-fun res!72946 () Bool)

(assert (=> d!50799 (=> res!72946 e!100994)))

(declare-fun lt!81099 () Bool)

(assert (=> d!50799 (= res!72946 (not lt!81099))))

(declare-fun lt!81097 () Bool)

(assert (=> d!50799 (= lt!81099 lt!81097)))

(declare-fun lt!81100 () Unit!4887)

(declare-fun e!100993 () Unit!4887)

(assert (=> d!50799 (= lt!81100 e!100993)))

(declare-fun c!29655 () Bool)

(assert (=> d!50799 (= c!29655 lt!81097)))

(assert (=> d!50799 (= lt!81097 (containsKey!185 (toList!909 lt!80775) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> d!50799 (= (contains!953 lt!80775 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!81099)))

(declare-fun b!154608 () Bool)

(declare-fun lt!81098 () Unit!4887)

(assert (=> b!154608 (= e!100993 lt!81098)))

(assert (=> b!154608 (= lt!81098 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80775) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(assert (=> b!154608 (isDefined!135 (getValueByKey!181 (toList!909 lt!80775) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154609 () Bool)

(declare-fun Unit!4915 () Unit!4887)

(assert (=> b!154609 (= e!100993 Unit!4915)))

(declare-fun b!154610 () Bool)

(assert (=> b!154610 (= e!100994 (isDefined!135 (getValueByKey!181 (toList!909 lt!80775) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50799 c!29655) b!154608))

(assert (= (and d!50799 (not c!29655)) b!154609))

(assert (= (and d!50799 (not res!72946)) b!154610))

(declare-fun m!188337 () Bool)

(assert (=> d!50799 m!188337))

(declare-fun m!188339 () Bool)

(assert (=> b!154608 m!188339))

(assert (=> b!154608 m!187317))

(assert (=> b!154608 m!187317))

(declare-fun m!188341 () Bool)

(assert (=> b!154608 m!188341))

(assert (=> b!154610 m!187317))

(assert (=> b!154610 m!187317))

(assert (=> b!154610 m!188341))

(assert (=> d!50453 d!50799))

(declare-fun c!29656 () Bool)

(declare-fun d!50801 () Bool)

(assert (=> d!50801 (= c!29656 (and ((_ is Cons!1803) lt!80777) (= (_1!1411 (h!2412 lt!80777)) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100995 () Option!187)

(assert (=> d!50801 (= (getValueByKey!181 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) e!100995)))

(declare-fun b!154612 () Bool)

(declare-fun e!100996 () Option!187)

(assert (=> b!154612 (= e!100995 e!100996)))

(declare-fun c!29657 () Bool)

(assert (=> b!154612 (= c!29657 (and ((_ is Cons!1803) lt!80777) (not (= (_1!1411 (h!2412 lt!80777)) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun b!154611 () Bool)

(assert (=> b!154611 (= e!100995 (Some!186 (_2!1411 (h!2412 lt!80777))))))

(declare-fun b!154613 () Bool)

(assert (=> b!154613 (= e!100996 (getValueByKey!181 (t!6592 lt!80777) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154614 () Bool)

(assert (=> b!154614 (= e!100996 None!185)))

(assert (= (and d!50801 c!29656) b!154611))

(assert (= (and d!50801 (not c!29656)) b!154612))

(assert (= (and b!154612 c!29657) b!154613))

(assert (= (and b!154612 (not c!29657)) b!154614))

(declare-fun m!188343 () Bool)

(assert (=> b!154613 m!188343))

(assert (=> d!50453 d!50801))

(declare-fun d!50803 () Bool)

(assert (=> d!50803 (= (getValueByKey!181 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) (Some!186 (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun lt!81101 () Unit!4887)

(assert (=> d!50803 (= lt!81101 (choose!926 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun e!100997 () Bool)

(assert (=> d!50803 e!100997))

(declare-fun res!72947 () Bool)

(assert (=> d!50803 (=> (not res!72947) (not e!100997))))

(assert (=> d!50803 (= res!72947 (isStrictlySorted!325 lt!80777))))

(assert (=> d!50803 (= (lemmaContainsTupThenGetReturnValue!97 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!81101)))

(declare-fun b!154615 () Bool)

(declare-fun res!72948 () Bool)

(assert (=> b!154615 (=> (not res!72948) (not e!100997))))

(assert (=> b!154615 (= res!72948 (containsKey!185 lt!80777 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun b!154616 () Bool)

(assert (=> b!154616 (= e!100997 (contains!954 lt!80777 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (= (and d!50803 res!72947) b!154615))

(assert (= (and b!154615 res!72948) b!154616))

(assert (=> d!50803 m!187311))

(declare-fun m!188345 () Bool)

(assert (=> d!50803 m!188345))

(declare-fun m!188347 () Bool)

(assert (=> d!50803 m!188347))

(declare-fun m!188349 () Bool)

(assert (=> b!154615 m!188349))

(declare-fun m!188351 () Bool)

(assert (=> b!154616 m!188351))

(assert (=> d!50453 d!50803))

(declare-fun b!154617 () Bool)

(declare-fun e!100998 () List!1807)

(declare-fun call!17190 () List!1807)

(assert (=> b!154617 (= e!100998 call!17190)))

(declare-fun e!101002 () List!1807)

(declare-fun b!154618 () Bool)

(assert (=> b!154618 (= e!101002 (insertStrictlySorted!100 (t!6592 (toList!909 lt!80720)) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun c!29660 () Bool)

(declare-fun b!154619 () Bool)

(assert (=> b!154619 (= c!29660 (and ((_ is Cons!1803) (toList!909 lt!80720)) (bvsgt (_1!1411 (h!2412 (toList!909 lt!80720))) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun e!100999 () List!1807)

(assert (=> b!154619 (= e!100999 e!100998)))

(declare-fun b!154620 () Bool)

(declare-fun e!101000 () List!1807)

(declare-fun call!17189 () List!1807)

(assert (=> b!154620 (= e!101000 call!17189)))

(declare-fun e!101001 () Bool)

(declare-fun b!154621 () Bool)

(declare-fun lt!81102 () List!1807)

(assert (=> b!154621 (= e!101001 (contains!954 lt!81102 (tuple2!2801 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun b!154622 () Bool)

(assert (=> b!154622 (= e!101000 e!100999)))

(declare-fun c!29661 () Bool)

(assert (=> b!154622 (= c!29661 (and ((_ is Cons!1803) (toList!909 lt!80720)) (= (_1!1411 (h!2412 (toList!909 lt!80720))) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(declare-fun bm!17185 () Bool)

(declare-fun call!17188 () List!1807)

(assert (=> bm!17185 (= call!17190 call!17188)))

(declare-fun bm!17186 () Bool)

(assert (=> bm!17186 (= call!17188 call!17189)))

(declare-fun d!50805 () Bool)

(assert (=> d!50805 e!101001))

(declare-fun res!72950 () Bool)

(assert (=> d!50805 (=> (not res!72950) (not e!101001))))

(assert (=> d!50805 (= res!72950 (isStrictlySorted!325 lt!81102))))

(assert (=> d!50805 (= lt!81102 e!101000)))

(declare-fun c!29659 () Bool)

(assert (=> d!50805 (= c!29659 (and ((_ is Cons!1803) (toList!909 lt!80720)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80720))) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))))))))

(assert (=> d!50805 (isStrictlySorted!325 (toList!909 lt!80720))))

(assert (=> d!50805 (= (insertStrictlySorted!100 (toList!909 lt!80720) (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))) lt!81102)))

(declare-fun b!154623 () Bool)

(declare-fun res!72949 () Bool)

(assert (=> b!154623 (=> (not res!72949) (not e!101001))))

(assert (=> b!154623 (= res!72949 (containsKey!185 lt!81102 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))

(declare-fun bm!17187 () Bool)

(assert (=> bm!17187 (= call!17189 ($colon$colon!95 e!101002 (ite c!29659 (h!2412 (toList!909 lt!80720)) (tuple2!2801 (_1!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992))))) (_2!1411 (tuple2!2801 lt!80740 (zeroValue!2906 (v!3411 (underlying!521 thiss!992)))))))))))

(declare-fun c!29658 () Bool)

(assert (=> bm!17187 (= c!29658 c!29659)))

(declare-fun b!154624 () Bool)

(assert (=> b!154624 (= e!100998 call!17190)))

(declare-fun b!154625 () Bool)

(assert (=> b!154625 (= e!100999 call!17188)))

(declare-fun b!154626 () Bool)

(assert (=> b!154626 (= e!101002 (ite c!29661 (t!6592 (toList!909 lt!80720)) (ite c!29660 (Cons!1803 (h!2412 (toList!909 lt!80720)) (t!6592 (toList!909 lt!80720))) Nil!1804)))))

(assert (= (and d!50805 c!29659) b!154620))

(assert (= (and d!50805 (not c!29659)) b!154622))

(assert (= (and b!154622 c!29661) b!154625))

(assert (= (and b!154622 (not c!29661)) b!154619))

(assert (= (and b!154619 c!29660) b!154617))

(assert (= (and b!154619 (not c!29660)) b!154624))

(assert (= (or b!154617 b!154624) bm!17185))

(assert (= (or b!154625 bm!17185) bm!17186))

(assert (= (or b!154620 bm!17186) bm!17187))

(assert (= (and bm!17187 c!29658) b!154618))

(assert (= (and bm!17187 (not c!29658)) b!154626))

(assert (= (and d!50805 res!72950) b!154623))

(assert (= (and b!154623 res!72949) b!154621))

(declare-fun m!188353 () Bool)

(assert (=> d!50805 m!188353))

(declare-fun m!188355 () Bool)

(assert (=> d!50805 m!188355))

(declare-fun m!188357 () Bool)

(assert (=> b!154623 m!188357))

(declare-fun m!188359 () Bool)

(assert (=> b!154618 m!188359))

(declare-fun m!188361 () Bool)

(assert (=> b!154621 m!188361))

(declare-fun m!188363 () Bool)

(assert (=> bm!17187 m!188363))

(assert (=> d!50453 d!50805))

(declare-fun b!154627 () Bool)

(declare-fun e!101006 () Bool)

(declare-fun e!101003 () Bool)

(assert (=> b!154627 (= e!101006 e!101003)))

(declare-fun res!72953 () Bool)

(assert (=> b!154627 (=> (not res!72953) (not e!101003))))

(declare-fun e!101004 () Bool)

(assert (=> b!154627 (= res!72953 (not e!101004))))

(declare-fun res!72951 () Bool)

(assert (=> b!154627 (=> (not res!72951) (not e!101004))))

(assert (=> b!154627 (= res!72951 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154628 () Bool)

(declare-fun e!101005 () Bool)

(declare-fun call!17191 () Bool)

(assert (=> b!154628 (= e!101005 call!17191)))

(declare-fun d!50807 () Bool)

(declare-fun res!72952 () Bool)

(assert (=> d!50807 (=> res!72952 e!101006)))

(assert (=> d!50807 (= res!72952 (bvsge #b00000000000000000000000000000000 (size!2676 (_keys!4835 (v!3411 (underlying!521 thiss!992))))))))

(assert (=> d!50807 (= (arrayNoDuplicates!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) #b00000000000000000000000000000000 Nil!1807) e!101006)))

(declare-fun b!154629 () Bool)

(assert (=> b!154629 (= e!101004 (contains!955 Nil!1807 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!17188 () Bool)

(declare-fun c!29662 () Bool)

(assert (=> bm!17188 (= call!17191 (arrayNoDuplicates!0 (_keys!4835 (v!3411 (underlying!521 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29662 (Cons!1806 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000) Nil!1807) Nil!1807)))))

(declare-fun b!154630 () Bool)

(assert (=> b!154630 (= e!101003 e!101005)))

(assert (=> b!154630 (= c!29662 (validKeyInArray!0 (select (arr!2398 (_keys!4835 (v!3411 (underlying!521 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!154631 () Bool)

(assert (=> b!154631 (= e!101005 call!17191)))

(assert (= (and d!50807 (not res!72952)) b!154627))

(assert (= (and b!154627 res!72951) b!154629))

(assert (= (and b!154627 res!72953) b!154630))

(assert (= (and b!154630 c!29662) b!154628))

(assert (= (and b!154630 (not c!29662)) b!154631))

(assert (= (or b!154628 b!154631) bm!17188))

(assert (=> b!154627 m!187423))

(assert (=> b!154627 m!187423))

(assert (=> b!154627 m!187425))

(assert (=> b!154629 m!187423))

(assert (=> b!154629 m!187423))

(declare-fun m!188365 () Bool)

(assert (=> b!154629 m!188365))

(assert (=> bm!17188 m!187423))

(declare-fun m!188367 () Bool)

(assert (=> bm!17188 m!188367))

(assert (=> b!154630 m!187423))

(assert (=> b!154630 m!187423))

(assert (=> b!154630 m!187425))

(assert (=> b!154144 d!50807))

(assert (=> d!50489 d!50495))

(assert (=> b!154063 d!50491))

(declare-fun d!50809 () Bool)

(declare-fun res!72954 () Bool)

(declare-fun e!101007 () Bool)

(assert (=> d!50809 (=> res!72954 e!101007)))

(assert (=> d!50809 (= res!72954 (and ((_ is Cons!1803) (toList!909 lt!80722)) (= (_1!1411 (h!2412 (toList!909 lt!80722))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50809 (= (containsKey!185 (toList!909 lt!80722) #b0000000000000000000000000000000000000000000000000000000000000000) e!101007)))

(declare-fun b!154632 () Bool)

(declare-fun e!101008 () Bool)

(assert (=> b!154632 (= e!101007 e!101008)))

(declare-fun res!72955 () Bool)

(assert (=> b!154632 (=> (not res!72955) (not e!101008))))

(assert (=> b!154632 (= res!72955 (and (or (not ((_ is Cons!1803) (toList!909 lt!80722))) (bvsle (_1!1411 (h!2412 (toList!909 lt!80722))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1803) (toList!909 lt!80722)) (bvslt (_1!1411 (h!2412 (toList!909 lt!80722))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154633 () Bool)

(assert (=> b!154633 (= e!101008 (containsKey!185 (t!6592 (toList!909 lt!80722)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!50809 (not res!72954)) b!154632))

(assert (= (and b!154632 res!72955) b!154633))

(declare-fun m!188369 () Bool)

(assert (=> b!154633 m!188369))

(assert (=> d!50511 d!50809))

(declare-fun d!50811 () Bool)

(assert (=> d!50811 (= (get!1603 (getValueByKey!181 (toList!909 lt!80724) lt!80730)) (v!3416 (getValueByKey!181 (toList!909 lt!80724) lt!80730)))))

(assert (=> d!50471 d!50811))

(declare-fun d!50813 () Bool)

(declare-fun c!29663 () Bool)

(assert (=> d!50813 (= c!29663 (and ((_ is Cons!1803) (toList!909 lt!80724)) (= (_1!1411 (h!2412 (toList!909 lt!80724))) lt!80730)))))

(declare-fun e!101009 () Option!187)

(assert (=> d!50813 (= (getValueByKey!181 (toList!909 lt!80724) lt!80730) e!101009)))

(declare-fun b!154635 () Bool)

(declare-fun e!101010 () Option!187)

(assert (=> b!154635 (= e!101009 e!101010)))

(declare-fun c!29664 () Bool)

(assert (=> b!154635 (= c!29664 (and ((_ is Cons!1803) (toList!909 lt!80724)) (not (= (_1!1411 (h!2412 (toList!909 lt!80724))) lt!80730))))))

(declare-fun b!154634 () Bool)

(assert (=> b!154634 (= e!101009 (Some!186 (_2!1411 (h!2412 (toList!909 lt!80724)))))))

(declare-fun b!154636 () Bool)

(assert (=> b!154636 (= e!101010 (getValueByKey!181 (t!6592 (toList!909 lt!80724)) lt!80730))))

(declare-fun b!154637 () Bool)

(assert (=> b!154637 (= e!101010 None!185)))

(assert (= (and d!50813 c!29663) b!154634))

(assert (= (and d!50813 (not c!29663)) b!154635))

(assert (= (and b!154635 c!29664) b!154636))

(assert (= (and b!154635 (not c!29664)) b!154637))

(declare-fun m!188371 () Bool)

(assert (=> b!154636 m!188371))

(assert (=> d!50471 d!50813))

(assert (=> b!154147 d!50659))

(assert (=> b!154147 d!50521))

(declare-fun d!50815 () Bool)

(declare-fun lt!81103 () Bool)

(assert (=> d!50815 (= lt!81103 (select (content!145 (toList!909 lt!80845)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun e!101011 () Bool)

(assert (=> d!50815 (= lt!81103 e!101011)))

(declare-fun res!72957 () Bool)

(assert (=> d!50815 (=> (not res!72957) (not e!101011))))

(assert (=> d!50815 (= res!72957 ((_ is Cons!1803) (toList!909 lt!80845)))))

(assert (=> d!50815 (= (contains!954 (toList!909 lt!80845) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))) lt!81103)))

(declare-fun b!154638 () Bool)

(declare-fun e!101012 () Bool)

(assert (=> b!154638 (= e!101011 e!101012)))

(declare-fun res!72956 () Bool)

(assert (=> b!154638 (=> res!72956 e!101012)))

(assert (=> b!154638 (= res!72956 (= (h!2412 (toList!909 lt!80845)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(declare-fun b!154639 () Bool)

(assert (=> b!154639 (= e!101012 (contains!954 (t!6592 (toList!909 lt!80845)) (tuple2!2801 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2906 (v!3411 (underlying!521 thiss!992))))))))

(assert (= (and d!50815 res!72957) b!154638))

(assert (= (and b!154638 (not res!72956)) b!154639))

(declare-fun m!188373 () Bool)

(assert (=> d!50815 m!188373))

(declare-fun m!188375 () Bool)

(assert (=> d!50815 m!188375))

(declare-fun m!188377 () Bool)

(assert (=> b!154639 m!188377))

(assert (=> b!154161 d!50815))

(declare-fun d!50817 () Bool)

(declare-fun e!101014 () Bool)

(assert (=> d!50817 e!101014))

(declare-fun res!72958 () Bool)

(assert (=> d!50817 (=> res!72958 e!101014)))

(declare-fun lt!81106 () Bool)

(assert (=> d!50817 (= res!72958 (not lt!81106))))

(declare-fun lt!81104 () Bool)

(assert (=> d!50817 (= lt!81106 lt!81104)))

(declare-fun lt!81107 () Unit!4887)

(declare-fun e!101013 () Unit!4887)

(assert (=> d!50817 (= lt!81107 e!101013)))

(declare-fun c!29665 () Bool)

(assert (=> d!50817 (= c!29665 lt!81104)))

(assert (=> d!50817 (= lt!81104 (containsKey!185 (toList!909 lt!80813) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50817 (= (contains!953 lt!80813 #b0000000000000000000000000000000000000000000000000000000000000000) lt!81106)))

(declare-fun b!154640 () Bool)

(declare-fun lt!81105 () Unit!4887)

(assert (=> b!154640 (= e!101013 lt!81105)))

(assert (=> b!154640 (= lt!81105 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80813) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154640 (isDefined!135 (getValueByKey!181 (toList!909 lt!80813) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154641 () Bool)

(declare-fun Unit!4916 () Unit!4887)

(assert (=> b!154641 (= e!101013 Unit!4916)))

(declare-fun b!154642 () Bool)

(assert (=> b!154642 (= e!101014 (isDefined!135 (getValueByKey!181 (toList!909 lt!80813) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50817 c!29665) b!154640))

(assert (= (and d!50817 (not c!29665)) b!154641))

(assert (= (and d!50817 (not res!72958)) b!154642))

(declare-fun m!188379 () Bool)

(assert (=> d!50817 m!188379))

(declare-fun m!188381 () Bool)

(assert (=> b!154640 m!188381))

(assert (=> b!154640 m!187849))

(assert (=> b!154640 m!187849))

(declare-fun m!188383 () Bool)

(assert (=> b!154640 m!188383))

(assert (=> b!154642 m!187849))

(assert (=> b!154642 m!187849))

(assert (=> b!154642 m!188383))

(assert (=> bm!17137 d!50817))

(declare-fun d!50819 () Bool)

(declare-fun e!101016 () Bool)

(assert (=> d!50819 e!101016))

(declare-fun res!72959 () Bool)

(assert (=> d!50819 (=> res!72959 e!101016)))

(declare-fun lt!81110 () Bool)

(assert (=> d!50819 (= res!72959 (not lt!81110))))

(declare-fun lt!81108 () Bool)

(assert (=> d!50819 (= lt!81110 lt!81108)))

(declare-fun lt!81111 () Unit!4887)

(declare-fun e!101015 () Unit!4887)

(assert (=> d!50819 (= lt!81111 e!101015)))

(declare-fun c!29666 () Bool)

(assert (=> d!50819 (= c!29666 lt!81108)))

(assert (=> d!50819 (= lt!81108 (containsKey!185 (toList!909 lt!80813) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!50819 (= (contains!953 lt!80813 #b1000000000000000000000000000000000000000000000000000000000000000) lt!81110)))

(declare-fun b!154643 () Bool)

(declare-fun lt!81109 () Unit!4887)

(assert (=> b!154643 (= e!101015 lt!81109)))

(assert (=> b!154643 (= lt!81109 (lemmaContainsKeyImpliesGetValueByKeyDefined!134 (toList!909 lt!80813) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!154643 (isDefined!135 (getValueByKey!181 (toList!909 lt!80813) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154644 () Bool)

(declare-fun Unit!4917 () Unit!4887)

(assert (=> b!154644 (= e!101015 Unit!4917)))

(declare-fun b!154645 () Bool)

(assert (=> b!154645 (= e!101016 (isDefined!135 (getValueByKey!181 (toList!909 lt!80813) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!50819 c!29666) b!154643))

(assert (= (and d!50819 (not c!29666)) b!154644))

(assert (= (and d!50819 (not res!72959)) b!154645))

(declare-fun m!188385 () Bool)

(assert (=> d!50819 m!188385))

(declare-fun m!188387 () Bool)

(assert (=> b!154643 m!188387))

(assert (=> b!154643 m!187905))

(assert (=> b!154643 m!187905))

(declare-fun m!188389 () Bool)

(assert (=> b!154643 m!188389))

(assert (=> b!154645 m!187905))

(assert (=> b!154645 m!187905))

(assert (=> b!154645 m!188389))

(assert (=> bm!17133 d!50819))

(assert (=> b!154171 d!50759))

(declare-fun b!154646 () Bool)

(declare-fun e!101018 () Bool)

(assert (=> b!154646 (= e!101018 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5185 () Bool)

(declare-fun mapRes!5185 () Bool)

(assert (=> mapIsEmpty!5185 mapRes!5185))

(declare-fun condMapEmpty!5185 () Bool)

(declare-fun mapDefault!5185 () ValueCell!1169)

(assert (=> mapNonEmpty!5184 (= condMapEmpty!5185 (= mapRest!5184 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5185)))))

(declare-fun e!101017 () Bool)

(assert (=> mapNonEmpty!5184 (= tp!12204 (and e!101017 mapRes!5185))))

(declare-fun mapNonEmpty!5185 () Bool)

(declare-fun tp!12205 () Bool)

(assert (=> mapNonEmpty!5185 (= mapRes!5185 (and tp!12205 e!101018))))

(declare-fun mapValue!5185 () ValueCell!1169)

(declare-fun mapRest!5185 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapKey!5185 () (_ BitVec 32))

(assert (=> mapNonEmpty!5185 (= mapRest!5184 (store mapRest!5185 mapKey!5185 mapValue!5185))))

(declare-fun b!154647 () Bool)

(assert (=> b!154647 (= e!101017 tp_is_empty!3025)))

(assert (= (and mapNonEmpty!5184 condMapEmpty!5185) mapIsEmpty!5185))

(assert (= (and mapNonEmpty!5184 (not condMapEmpty!5185)) mapNonEmpty!5185))

(assert (= (and mapNonEmpty!5185 ((_ is ValueCellFull!1169) mapValue!5185)) b!154646))

(assert (= (and mapNonEmpty!5184 ((_ is ValueCellFull!1169) mapDefault!5185)) b!154647))

(declare-fun m!188391 () Bool)

(assert (=> mapNonEmpty!5185 m!188391))

(declare-fun b!154648 () Bool)

(declare-fun e!101020 () Bool)

(assert (=> b!154648 (= e!101020 tp_is_empty!3025)))

(declare-fun mapIsEmpty!5186 () Bool)

(declare-fun mapRes!5186 () Bool)

(assert (=> mapIsEmpty!5186 mapRes!5186))

(declare-fun condMapEmpty!5186 () Bool)

(declare-fun mapDefault!5186 () ValueCell!1169)

(assert (=> mapNonEmpty!5183 (= condMapEmpty!5186 (= mapRest!5183 ((as const (Array (_ BitVec 32) ValueCell!1169)) mapDefault!5186)))))

(declare-fun e!101019 () Bool)

(assert (=> mapNonEmpty!5183 (= tp!12203 (and e!101019 mapRes!5186))))

(declare-fun mapNonEmpty!5186 () Bool)

(declare-fun tp!12206 () Bool)

(assert (=> mapNonEmpty!5186 (= mapRes!5186 (and tp!12206 e!101020))))

(declare-fun mapKey!5186 () (_ BitVec 32))

(declare-fun mapRest!5186 () (Array (_ BitVec 32) ValueCell!1169))

(declare-fun mapValue!5186 () ValueCell!1169)

(assert (=> mapNonEmpty!5186 (= mapRest!5183 (store mapRest!5186 mapKey!5186 mapValue!5186))))

(declare-fun b!154649 () Bool)

(assert (=> b!154649 (= e!101019 tp_is_empty!3025)))

(assert (= (and mapNonEmpty!5183 condMapEmpty!5186) mapIsEmpty!5186))

(assert (= (and mapNonEmpty!5183 (not condMapEmpty!5186)) mapNonEmpty!5186))

(assert (= (and mapNonEmpty!5186 ((_ is ValueCellFull!1169) mapValue!5186)) b!154648))

(assert (= (and mapNonEmpty!5183 ((_ is ValueCellFull!1169) mapDefault!5186)) b!154649))

(declare-fun m!188393 () Bool)

(assert (=> mapNonEmpty!5186 m!188393))

(declare-fun b_lambda!6857 () Bool)

(assert (= b_lambda!6853 (or (and b!153851 b_free!3217 (= (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) (defaultEntry!3063 newMap!16))) (and b!153854 b_free!3219) b_lambda!6857)))

(declare-fun b_lambda!6859 () Bool)

(assert (= b_lambda!6849 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6859)))

(declare-fun b_lambda!6861 () Bool)

(assert (= b_lambda!6847 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6861)))

(declare-fun b_lambda!6863 () Bool)

(assert (= b_lambda!6855 (or (and b!153851 b_free!3217 (= (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))) (defaultEntry!3063 newMap!16))) (and b!153854 b_free!3219) b_lambda!6863)))

(declare-fun b_lambda!6865 () Bool)

(assert (= b_lambda!6845 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6865)))

(declare-fun b_lambda!6867 () Bool)

(assert (= b_lambda!6851 (or (and b!153851 b_free!3217) (and b!153854 b_free!3219 (= (defaultEntry!3063 newMap!16) (defaultEntry!3063 (v!3411 (underlying!521 thiss!992))))) b_lambda!6867)))

(check-sat (not b!154386) (not b!154466) (not b!154566) (not d!50819) (not d!50575) (not b!154248) (not bm!17184) (not d!50615) (not b!154239) tp_is_empty!3025 (not d!50783) (not b_next!3217) (not d!50753) (not b!154445) (not b!154237) (not b!154313) (not b!154468) (not b!154432) (not d!50587) (not b!154524) (not d!50583) b_and!9613 (not b!154493) (not b!154418) (not b!154334) (not b!154645) (not b!154407) (not b!154643) (not b!154373) (not d!50787) (not b!154318) (not d!50589) (not b!154441) (not d!50659) (not b!154455) (not b!154534) (not b!154623) (not b!154448) (not d!50757) (not b!154311) (not b!154526) (not d!50775) (not d!50571) (not d!50579) (not b!154460) (not d!50605) (not b!154613) (not d!50727) (not b_lambda!6863) (not b!154388) (not d!50533) (not b!154401) (not b!154285) (not b!154616) (not b!154492) (not d!50561) (not b!154565) (not b!154504) (not d!50547) (not b!154319) (not d!50725) (not d!50703) (not b!154457) (not d!50603) (not b!154593) (not d!50789) (not b!154443) (not b!154642) (not b!154307) (not d!50749) (not b!154533) (not d!50543) (not b!154348) (not b!154298) (not d!50565) (not b!154629) (not b!154438) (not b!154378) (not b!154315) (not b!154379) (not d!50697) (not b!154627) (not d!50527) (not b!154531) (not d!50731) (not b!154260) (not b!154247) (not b!154327) (not b!154537) (not d!50739) (not d!50751) (not b!154604) (not b!154479) (not b!154575) (not b!154569) (not b!154240) (not b!154376) (not d!50593) (not bm!17172) (not bm!17173) (not bm!17156) (not b!154253) (not d!50771) (not b!154359) (not d!50737) (not bm!17166) (not d!50687) (not b!154478) (not b!154340) (not d!50585) (not bm!17178) (not b!154242) (not d!50673) (not bm!17179) (not b!154384) (not d!50715) (not b!154473) (not b!154250) (not b_lambda!6857) (not d!50721) (not b_lambda!6865) (not b_next!3219) (not b!154295) (not b!154554) (not b_lambda!6859) (not b!154606) (not b!154581) (not b!154495) (not b!154557) (not mapNonEmpty!5185) (not b!154592) (not b!154329) (not b!154530) (not d!50553) (not b!154541) (not d!50679) (not b!154576) (not bm!17165) (not b_lambda!6827) (not bm!17177) (not b!154396) (not d!50681) (not b!154368) (not b!154542) (not d!50717) (not d!50707) (not d!50815) (not b!154594) (not b_lambda!6841) (not b!154496) (not d!50785) (not b!154608) (not b!154361) (not b!154425) (not b!154371) (not d!50613) (not d!50793) (not b!154294) (not b!154346) (not b!154522) (not b!154564) (not b!154539) (not d!50729) (not b!154228) (not b!154374) (not b!154324) (not d!50767) (not b_lambda!6837) (not b!154297) (not b!154343) (not b!154310) (not b_lambda!6839) (not d!50755) (not bm!17187) (not b!154370) (not b!154529) (not b!154590) (not b!154597) (not b!154451) (not b!154399) (not b!154470) (not d!50657) (not d!50531) (not b!154235) (not d!50805) (not b!154394) (not b!154243) (not b!154610) (not b!154538) (not mapNonEmpty!5186) (not b!154498) (not b!154476) (not d!50795) (not d!50559) (not b!154296) (not bm!17183) (not d!50555) (not b!154405) (not b!154527) (not b!154362) (not b!154241) (not b_lambda!6843) (not d!50733) (not d!50609) (not b!154393) (not b!154245) (not b!154550) (not d!50611) (not bm!17180) (not b!154595) (not d!50769) (not b!154546) (not d!50651) (not b!154353) (not b!154633) (not b!154366) (not b!154345) (not b!154381) (not d!50643) (not bm!17174) (not d!50525) (not d!50633) (not b!154615) (not d!50711) (not d!50699) (not b!154326) (not b!154431) (not d!50689) (not d!50709) (not b_lambda!6867) (not b!154282) (not d!50535) (not b!154309) (not d!50713) (not b!154300) (not b!154317) (not b!154605) (not d!50645) (not d!50523) (not d!50723) (not b!154481) (not d!50799) (not b!154305) (not b!154351) (not b!154621) (not b!154567) (not d!50791) (not b!154583) (not b!154484) (not d!50539) (not b!154607) (not b!154224) (not d!50545) (not d!50693) (not b!154586) (not d!50597) (not b!154580) (not bm!17169) (not b!154292) (not d!50691) (not b!154321) (not b!154308) (not d!50635) (not b!154471) (not d!50677) (not d!50549) (not b!154372) (not b_lambda!6861) (not b!154303) (not b!154572) (not b!154602) (not b!154338) (not b!154429) (not b!154363) (not d!50625) (not b!154618) (not b!154630) b_and!9615 (not b!154452) (not b!154486) (not d!50551) (not b!154409) (not b!154332) (not b!154490) (not b!154543) (not d!50567) (not b!154440) (not d!50599) (not b!154421) (not d!50621) (not bm!17188) (not b!154435) (not d!50669) (not d!50803) (not b!154412) (not d!50817) (not b!154639) (not d!50569) (not d!50563) (not b!154391) (not b!154454) (not d!50577) (not b!154465) (not d!50639) (not b!154287) (not d!50773) (not b!154302) (not d!50705) (not d!50631) (not b!154259) (not b!154578) (not b!154636) (not d!50557) (not d!50541) (not b!154640) (not d!50719) (not b!154596) (not b!154548))
(check-sat b_and!9613 b_and!9615 (not b_next!3217) (not b_next!3219))
