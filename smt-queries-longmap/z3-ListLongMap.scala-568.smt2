; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15462 () Bool)

(assert start!15462)

(declare-fun b!153771 () Bool)

(declare-fun b_free!3209 () Bool)

(declare-fun b_next!3209 () Bool)

(assert (=> b!153771 (= b_free!3209 (not b_next!3209))))

(declare-fun tp!12143 () Bool)

(declare-fun b_and!9571 () Bool)

(assert (=> b!153771 (= tp!12143 b_and!9571)))

(declare-fun b!153768 () Bool)

(declare-fun b_free!3211 () Bool)

(declare-fun b_next!3211 () Bool)

(assert (=> b!153768 (= b_free!3211 (not b_next!3211))))

(declare-fun tp!12145 () Bool)

(declare-fun b_and!9573 () Bool)

(assert (=> b!153768 (= tp!12145 b_and!9573)))

(declare-fun mapIsEmpty!5149 () Bool)

(declare-fun mapRes!5149 () Bool)

(assert (=> mapIsEmpty!5149 mapRes!5149))

(declare-fun b!153758 () Bool)

(declare-fun res!72649 () Bool)

(declare-fun e!100442 () Bool)

(assert (=> b!153758 (=> (not res!72649) (not e!100442))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3675 0))(
  ( (V!3676 (val!1555 Int)) )
))
(declare-datatypes ((array!5091 0))(
  ( (array!5092 (arr!2405 (Array (_ BitVec 32) (_ BitVec 64))) (size!2682 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1167 0))(
  ( (ValueCellFull!1167 (v!3412 V!3675)) (EmptyCell!1167) )
))
(declare-datatypes ((array!5093 0))(
  ( (array!5094 (arr!2406 (Array (_ BitVec 32) ValueCell!1167)) (size!2683 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1242 0))(
  ( (LongMapFixedSize!1243 (defaultEntry!3060 Int) (mask!7462 (_ BitVec 32)) (extraKeys!2801 (_ BitVec 32)) (zeroValue!2903 V!3675) (minValue!2903 V!3675) (_size!670 (_ BitVec 32)) (_keys!4833 array!5091) (_values!3043 array!5093) (_vacant!670 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1024 0))(
  ( (Cell!1025 (v!3413 LongMapFixedSize!1242)) )
))
(declare-datatypes ((LongMap!1024 0))(
  ( (LongMap!1025 (underlying!523 Cell!1024)) )
))
(declare-fun thiss!992 () LongMap!1024)

(assert (=> b!153758 (= res!72649 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun b!153759 () Bool)

(declare-fun e!100437 () Bool)

(declare-fun tp_is_empty!3021 () Bool)

(assert (=> b!153759 (= e!100437 tp_is_empty!3021)))

(declare-fun b!153760 () Bool)

(declare-fun res!72651 () Bool)

(assert (=> b!153760 (=> (not res!72651) (not e!100442))))

(assert (=> b!153760 (= res!72651 (and (or (= (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun b!153761 () Bool)

(declare-fun e!100440 () Bool)

(declare-fun e!100448 () Bool)

(assert (=> b!153761 (= e!100440 (and e!100448 mapRes!5149))))

(declare-fun condMapEmpty!5149 () Bool)

(declare-fun mapDefault!5149 () ValueCell!1167)

(assert (=> b!153761 (= condMapEmpty!5149 (= (arr!2406 (_values!3043 (v!3413 (underlying!523 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1167)) mapDefault!5149)))))

(declare-fun b!153762 () Bool)

(assert (=> b!153762 (= e!100448 tp_is_empty!3021)))

(declare-fun b!153763 () Bool)

(declare-fun e!100450 () Bool)

(declare-fun e!100441 () Bool)

(assert (=> b!153763 (= e!100450 e!100441)))

(declare-fun res!72650 () Bool)

(assert (=> b!153763 (=> res!72650 e!100441)))

(declare-datatypes ((tuple2!2822 0))(
  ( (tuple2!2823 (_1!1422 Bool) (_2!1422 LongMapFixedSize!1242)) )
))
(declare-fun lt!80673 () tuple2!2822)

(declare-fun valid!612 (LongMapFixedSize!1242) Bool)

(assert (=> b!153763 (= res!72650 (not (valid!612 (_2!1422 lt!80673))))))

(declare-fun mapIsEmpty!5150 () Bool)

(declare-fun mapRes!5150 () Bool)

(assert (=> mapIsEmpty!5150 mapRes!5150))

(declare-fun mapNonEmpty!5149 () Bool)

(declare-fun tp!12144 () Bool)

(declare-fun e!100447 () Bool)

(assert (=> mapNonEmpty!5149 (= mapRes!5149 (and tp!12144 e!100447))))

(declare-fun mapRest!5150 () (Array (_ BitVec 32) ValueCell!1167))

(declare-fun mapKey!5150 () (_ BitVec 32))

(declare-fun mapValue!5149 () ValueCell!1167)

(assert (=> mapNonEmpty!5149 (= (arr!2406 (_values!3043 (v!3413 (underlying!523 thiss!992)))) (store mapRest!5150 mapKey!5150 mapValue!5149))))

(declare-fun b!153764 () Bool)

(declare-fun e!100443 () Bool)

(assert (=> b!153764 (= e!100443 tp_is_empty!3021)))

(declare-fun b!153765 () Bool)

(declare-fun e!100451 () Bool)

(declare-fun e!100446 () Bool)

(assert (=> b!153765 (= e!100451 e!100446)))

(declare-fun b!153766 () Bool)

(declare-fun e!100444 () Bool)

(assert (=> b!153766 (= e!100444 (and e!100437 mapRes!5150))))

(declare-fun condMapEmpty!5150 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1242)

(declare-fun mapDefault!5150 () ValueCell!1167)

(assert (=> b!153766 (= condMapEmpty!5150 (= (arr!2406 (_values!3043 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1167)) mapDefault!5150)))))

(declare-fun b!153767 () Bool)

(declare-fun res!72652 () Bool)

(assert (=> b!153767 (=> (not res!72652) (not e!100442))))

(declare-datatypes ((tuple2!2824 0))(
  ( (tuple2!2825 (_1!1423 (_ BitVec 64)) (_2!1423 V!3675)) )
))
(declare-datatypes ((List!1804 0))(
  ( (Nil!1801) (Cons!1800 (h!2409 tuple2!2824) (t!6594 List!1804)) )
))
(declare-datatypes ((ListLongMap!1813 0))(
  ( (ListLongMap!1814 (toList!922 List!1804)) )
))
(declare-fun getCurrentListMap!587 (array!5091 array!5093 (_ BitVec 32) (_ BitVec 32) V!3675 V!3675 (_ BitVec 32) Int) ListLongMap!1813)

(declare-fun map!1499 (LongMapFixedSize!1242) ListLongMap!1813)

(assert (=> b!153767 (= res!72652 (= (getCurrentListMap!587 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))) (map!1499 newMap!16)))))

(declare-fun e!100439 () Bool)

(declare-fun array_inv!1519 (array!5091) Bool)

(declare-fun array_inv!1520 (array!5093) Bool)

(assert (=> b!153768 (= e!100439 (and tp!12145 tp_is_empty!3021 (array_inv!1519 (_keys!4833 newMap!16)) (array_inv!1520 (_values!3043 newMap!16)) e!100444))))

(declare-fun b!153769 () Bool)

(declare-fun e!100449 () Bool)

(assert (=> b!153769 (= e!100449 e!100451)))

(declare-fun res!72647 () Bool)

(assert (=> start!15462 (=> (not res!72647) (not e!100442))))

(declare-fun valid!613 (LongMap!1024) Bool)

(assert (=> start!15462 (= res!72647 (valid!613 thiss!992))))

(assert (=> start!15462 e!100442))

(assert (=> start!15462 e!100449))

(assert (=> start!15462 true))

(assert (=> start!15462 e!100439))

(declare-fun b!153770 () Bool)

(declare-fun res!72654 () Bool)

(assert (=> b!153770 (=> (not res!72654) (not e!100442))))

(assert (=> b!153770 (= res!72654 (valid!612 newMap!16))))

(assert (=> b!153771 (= e!100446 (and tp!12143 tp_is_empty!3021 (array_inv!1519 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (array_inv!1520 (_values!3043 (v!3413 (underlying!523 thiss!992)))) e!100440))))

(declare-fun b!153772 () Bool)

(assert (=> b!153772 (= e!100447 tp_is_empty!3021)))

(declare-fun mapNonEmpty!5150 () Bool)

(declare-fun tp!12146 () Bool)

(assert (=> mapNonEmpty!5150 (= mapRes!5150 (and tp!12146 e!100443))))

(declare-fun mapRest!5149 () (Array (_ BitVec 32) ValueCell!1167))

(declare-fun mapValue!5150 () ValueCell!1167)

(declare-fun mapKey!5149 () (_ BitVec 32))

(assert (=> mapNonEmpty!5150 (= (arr!2406 (_values!3043 newMap!16)) (store mapRest!5149 mapKey!5149 mapValue!5150))))

(declare-fun b!153773 () Bool)

(assert (=> b!153773 (= e!100441 (not (= (map!1499 (_2!1422 lt!80673)) (map!1499 (v!3413 (underlying!523 thiss!992))))))))

(declare-fun b!153774 () Bool)

(declare-fun res!72653 () Bool)

(assert (=> b!153774 (=> (not res!72653) (not e!100442))))

(assert (=> b!153774 (= res!72653 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7462 newMap!16)) (_size!670 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun b!153775 () Bool)

(assert (=> b!153775 (= e!100442 e!100450)))

(declare-fun res!72648 () Bool)

(assert (=> b!153775 (=> (not res!72648) (not e!100450))))

(assert (=> b!153775 (= res!72648 (_1!1422 lt!80673))))

(declare-fun repackFrom!19 (LongMap!1024 LongMapFixedSize!1242 (_ BitVec 32)) tuple2!2822)

(assert (=> b!153775 (= lt!80673 (repackFrom!19 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (= (and start!15462 res!72647) b!153758))

(assert (= (and b!153758 res!72649) b!153770))

(assert (= (and b!153770 res!72654) b!153774))

(assert (= (and b!153774 res!72653) b!153767))

(assert (= (and b!153767 res!72652) b!153760))

(assert (= (and b!153760 res!72651) b!153775))

(assert (= (and b!153775 res!72648) b!153763))

(assert (= (and b!153763 (not res!72650)) b!153773))

(assert (= (and b!153761 condMapEmpty!5149) mapIsEmpty!5149))

(assert (= (and b!153761 (not condMapEmpty!5149)) mapNonEmpty!5149))

(get-info :version)

(assert (= (and mapNonEmpty!5149 ((_ is ValueCellFull!1167) mapValue!5149)) b!153772))

(assert (= (and b!153761 ((_ is ValueCellFull!1167) mapDefault!5149)) b!153762))

(assert (= b!153771 b!153761))

(assert (= b!153765 b!153771))

(assert (= b!153769 b!153765))

(assert (= start!15462 b!153769))

(assert (= (and b!153766 condMapEmpty!5150) mapIsEmpty!5150))

(assert (= (and b!153766 (not condMapEmpty!5150)) mapNonEmpty!5150))

(assert (= (and mapNonEmpty!5150 ((_ is ValueCellFull!1167) mapValue!5150)) b!153764))

(assert (= (and b!153766 ((_ is ValueCellFull!1167) mapDefault!5150)) b!153759))

(assert (= b!153768 b!153766))

(assert (= start!15462 b!153768))

(declare-fun m!187555 () Bool)

(assert (=> b!153760 m!187555))

(declare-fun m!187557 () Bool)

(assert (=> start!15462 m!187557))

(declare-fun m!187559 () Bool)

(assert (=> b!153775 m!187559))

(declare-fun m!187561 () Bool)

(assert (=> mapNonEmpty!5150 m!187561))

(declare-fun m!187563 () Bool)

(assert (=> b!153770 m!187563))

(declare-fun m!187565 () Bool)

(assert (=> b!153767 m!187565))

(declare-fun m!187567 () Bool)

(assert (=> b!153767 m!187567))

(declare-fun m!187569 () Bool)

(assert (=> b!153768 m!187569))

(declare-fun m!187571 () Bool)

(assert (=> b!153768 m!187571))

(declare-fun m!187573 () Bool)

(assert (=> b!153763 m!187573))

(declare-fun m!187575 () Bool)

(assert (=> mapNonEmpty!5149 m!187575))

(declare-fun m!187577 () Bool)

(assert (=> b!153773 m!187577))

(declare-fun m!187579 () Bool)

(assert (=> b!153773 m!187579))

(declare-fun m!187581 () Bool)

(assert (=> b!153771 m!187581))

(declare-fun m!187583 () Bool)

(assert (=> b!153771 m!187583))

(check-sat (not b!153763) (not b!153773) b_and!9573 tp_is_empty!3021 (not b!153767) (not b_next!3211) (not b!153775) b_and!9571 (not b_next!3209) (not start!15462) (not b!153768) (not mapNonEmpty!5149) (not mapNonEmpty!5150) (not b!153770) (not b!153771))
(check-sat b_and!9571 b_and!9573 (not b_next!3209) (not b_next!3211))
(get-model)

(declare-fun d!50553 () Bool)

(assert (=> d!50553 (= (map!1499 (_2!1422 lt!80673)) (getCurrentListMap!587 (_keys!4833 (_2!1422 lt!80673)) (_values!3043 (_2!1422 lt!80673)) (mask!7462 (_2!1422 lt!80673)) (extraKeys!2801 (_2!1422 lt!80673)) (zeroValue!2903 (_2!1422 lt!80673)) (minValue!2903 (_2!1422 lt!80673)) #b00000000000000000000000000000000 (defaultEntry!3060 (_2!1422 lt!80673))))))

(declare-fun bs!6507 () Bool)

(assert (= bs!6507 d!50553))

(declare-fun m!187615 () Bool)

(assert (=> bs!6507 m!187615))

(assert (=> b!153773 d!50553))

(declare-fun d!50555 () Bool)

(assert (=> d!50555 (= (map!1499 (v!3413 (underlying!523 thiss!992))) (getCurrentListMap!587 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun bs!6508 () Bool)

(assert (= bs!6508 d!50555))

(declare-fun m!187617 () Bool)

(assert (=> bs!6508 m!187617))

(assert (=> b!153773 d!50555))

(declare-fun d!50557 () Bool)

(assert (=> d!50557 (= (array_inv!1519 (_keys!4833 newMap!16)) (bvsge (size!2682 (_keys!4833 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153768 d!50557))

(declare-fun d!50559 () Bool)

(assert (=> d!50559 (= (array_inv!1520 (_values!3043 newMap!16)) (bvsge (size!2683 (_values!3043 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!153768 d!50559))

(declare-fun d!50561 () Bool)

(declare-fun res!72685 () Bool)

(declare-fun e!100499 () Bool)

(assert (=> d!50561 (=> (not res!72685) (not e!100499))))

(declare-fun simpleValid!103 (LongMapFixedSize!1242) Bool)

(assert (=> d!50561 (= res!72685 (simpleValid!103 newMap!16))))

(assert (=> d!50561 (= (valid!612 newMap!16) e!100499)))

(declare-fun b!153836 () Bool)

(declare-fun res!72686 () Bool)

(assert (=> b!153836 (=> (not res!72686) (not e!100499))))

(declare-fun arrayCountValidKeys!0 (array!5091 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!153836 (= res!72686 (= (arrayCountValidKeys!0 (_keys!4833 newMap!16) #b00000000000000000000000000000000 (size!2682 (_keys!4833 newMap!16))) (_size!670 newMap!16)))))

(declare-fun b!153837 () Bool)

(declare-fun res!72687 () Bool)

(assert (=> b!153837 (=> (not res!72687) (not e!100499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5091 (_ BitVec 32)) Bool)

(assert (=> b!153837 (= res!72687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4833 newMap!16) (mask!7462 newMap!16)))))

(declare-fun b!153838 () Bool)

(declare-datatypes ((List!1806 0))(
  ( (Nil!1803) (Cons!1802 (h!2411 (_ BitVec 64)) (t!6600 List!1806)) )
))
(declare-fun arrayNoDuplicates!0 (array!5091 (_ BitVec 32) List!1806) Bool)

(assert (=> b!153838 (= e!100499 (arrayNoDuplicates!0 (_keys!4833 newMap!16) #b00000000000000000000000000000000 Nil!1803))))

(assert (= (and d!50561 res!72685) b!153836))

(assert (= (and b!153836 res!72686) b!153837))

(assert (= (and b!153837 res!72687) b!153838))

(declare-fun m!187619 () Bool)

(assert (=> d!50561 m!187619))

(declare-fun m!187621 () Bool)

(assert (=> b!153836 m!187621))

(declare-fun m!187623 () Bool)

(assert (=> b!153837 m!187623))

(declare-fun m!187625 () Bool)

(assert (=> b!153838 m!187625))

(assert (=> b!153770 d!50561))

(declare-fun d!50563 () Bool)

(assert (=> d!50563 (= (valid!613 thiss!992) (valid!612 (v!3413 (underlying!523 thiss!992))))))

(declare-fun bs!6509 () Bool)

(assert (= bs!6509 d!50563))

(declare-fun m!187627 () Bool)

(assert (=> bs!6509 m!187627))

(assert (=> start!15462 d!50563))

(declare-fun d!50565 () Bool)

(declare-fun res!72688 () Bool)

(declare-fun e!100500 () Bool)

(assert (=> d!50565 (=> (not res!72688) (not e!100500))))

(assert (=> d!50565 (= res!72688 (simpleValid!103 (_2!1422 lt!80673)))))

(assert (=> d!50565 (= (valid!612 (_2!1422 lt!80673)) e!100500)))

(declare-fun b!153839 () Bool)

(declare-fun res!72689 () Bool)

(assert (=> b!153839 (=> (not res!72689) (not e!100500))))

(assert (=> b!153839 (= res!72689 (= (arrayCountValidKeys!0 (_keys!4833 (_2!1422 lt!80673)) #b00000000000000000000000000000000 (size!2682 (_keys!4833 (_2!1422 lt!80673)))) (_size!670 (_2!1422 lt!80673))))))

(declare-fun b!153840 () Bool)

(declare-fun res!72690 () Bool)

(assert (=> b!153840 (=> (not res!72690) (not e!100500))))

(assert (=> b!153840 (= res!72690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4833 (_2!1422 lt!80673)) (mask!7462 (_2!1422 lt!80673))))))

(declare-fun b!153841 () Bool)

(assert (=> b!153841 (= e!100500 (arrayNoDuplicates!0 (_keys!4833 (_2!1422 lt!80673)) #b00000000000000000000000000000000 Nil!1803))))

(assert (= (and d!50565 res!72688) b!153839))

(assert (= (and b!153839 res!72689) b!153840))

(assert (= (and b!153840 res!72690) b!153841))

(declare-fun m!187629 () Bool)

(assert (=> d!50565 m!187629))

(declare-fun m!187631 () Bool)

(assert (=> b!153839 m!187631))

(declare-fun m!187633 () Bool)

(assert (=> b!153840 m!187633))

(declare-fun m!187635 () Bool)

(assert (=> b!153841 m!187635))

(assert (=> b!153763 d!50565))

(declare-fun d!50567 () Bool)

(assert (=> d!50567 (= (array_inv!1519 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvsge (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153771 d!50567))

(declare-fun d!50569 () Bool)

(assert (=> d!50569 (= (array_inv!1520 (_values!3043 (v!3413 (underlying!523 thiss!992)))) (bvsge (size!2683 (_values!3043 (v!3413 (underlying!523 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!153771 d!50569))

(declare-fun b!153870 () Bool)

(declare-fun e!100517 () tuple2!2822)

(declare-fun e!100523 () tuple2!2822)

(assert (=> b!153870 (= e!100517 e!100523)))

(declare-fun c!29475 () Bool)

(assert (=> b!153870 (= c!29475 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun d!50571 () Bool)

(declare-fun e!100524 () Bool)

(assert (=> d!50571 e!100524))

(declare-fun res!72696 () Bool)

(assert (=> d!50571 (=> res!72696 e!100524)))

(declare-fun lt!80770 () tuple2!2822)

(assert (=> d!50571 (= res!72696 (not (_1!1422 lt!80770)))))

(assert (=> d!50571 (= lt!80770 e!100517)))

(declare-fun c!29478 () Bool)

(declare-fun lt!80744 () (_ BitVec 64))

(assert (=> d!50571 (= c!29478 (and (not (= lt!80744 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!80744 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!80772 () ListLongMap!1813)

(assert (=> d!50571 (= lt!80772 (map!1499 newMap!16))))

(declare-fun lt!80768 () V!3675)

(declare-fun get!1605 (ValueCell!1167 V!3675) V!3675)

(declare-fun dynLambda!470 (Int (_ BitVec 64)) V!3675)

(assert (=> d!50571 (= lt!80768 (get!1605 (select (arr!2406 (_values!3043 (v!3413 (underlying!523 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!470 (defaultEntry!3060 (v!3413 (underlying!523 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50571 (= lt!80744 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!50571 (valid!613 thiss!992)))

(assert (=> d!50571 (= (repackFrom!19 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)) lt!80770)))

(declare-fun bm!17099 () Bool)

(declare-fun call!17109 () ListLongMap!1813)

(declare-fun getCurrentListMapNoExtraKeys!160 (array!5091 array!5093 (_ BitVec 32) (_ BitVec 32) V!3675 V!3675 (_ BitVec 32) Int) ListLongMap!1813)

(assert (=> bm!17099 (= call!17109 (getCurrentListMapNoExtraKeys!160 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun bm!17100 () Bool)

(declare-fun lt!80761 () ListLongMap!1813)

(declare-fun lt!80742 () (_ BitVec 64))

(declare-fun call!17108 () ListLongMap!1813)

(declare-fun lt!80762 () ListLongMap!1813)

(declare-fun c!29474 () Bool)

(declare-fun +!191 (ListLongMap!1813 tuple2!2824) ListLongMap!1813)

(assert (=> bm!17100 (= call!17108 (+!191 (ite c!29474 lt!80761 lt!80762) (ite c!29474 (tuple2!2825 lt!80744 lt!80768) (tuple2!2825 lt!80742 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun b!153871 () Bool)

(declare-fun e!100522 () tuple2!2822)

(declare-fun lt!80771 () tuple2!2822)

(assert (=> b!153871 (= e!100522 (tuple2!2823 true (_2!1422 lt!80771)))))

(assert (=> b!153871 (= lt!80762 call!17109)))

(assert (=> b!153871 (= lt!80742 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!4894 0))(
  ( (Unit!4895) )
))
(declare-fun lt!80750 () Unit!4894)

(declare-fun call!17112 () Unit!4894)

(assert (=> b!153871 (= lt!80750 call!17112)))

(declare-fun call!17107 () ListLongMap!1813)

(declare-fun call!17105 () ListLongMap!1813)

(assert (=> b!153871 (= call!17107 call!17105)))

(declare-fun lt!80753 () Unit!4894)

(assert (=> b!153871 (= lt!80753 lt!80750)))

(declare-fun lt!80748 () ListLongMap!1813)

(declare-fun call!17104 () ListLongMap!1813)

(assert (=> b!153871 (= lt!80748 call!17104)))

(declare-fun lt!80747 () (_ BitVec 64))

(assert (=> b!153871 (= lt!80747 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80754 () Unit!4894)

(declare-fun call!17103 () Unit!4894)

(assert (=> b!153871 (= lt!80754 call!17103)))

(declare-fun call!17111 () ListLongMap!1813)

(declare-fun call!17113 () ListLongMap!1813)

(assert (=> b!153871 (= call!17111 call!17113)))

(declare-fun lt!80752 () Unit!4894)

(assert (=> b!153871 (= lt!80752 lt!80754)))

(declare-fun lt!80767 () (_ BitVec 64))

(declare-fun bm!17101 () Bool)

(declare-fun call!17114 () ListLongMap!1813)

(assert (=> bm!17101 (= call!17113 (+!191 (ite c!29474 call!17108 call!17114) (ite c!29474 (tuple2!2825 lt!80767 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))) (tuple2!2825 lt!80744 lt!80768))))))

(declare-fun b!153872 () Bool)

(assert (=> b!153872 (= c!29474 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!100519 () tuple2!2822)

(assert (=> b!153872 (= e!100519 e!100522)))

(declare-fun lt!80769 () ListLongMap!1813)

(declare-fun bm!17102 () Bool)

(declare-fun lt!80743 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!84 (ListLongMap!1813 (_ BitVec 64) V!3675 (_ BitVec 64) V!3675) Unit!4894)

(assert (=> bm!17102 (= call!17103 (addCommutativeForDiffKeys!84 (ite c!29474 lt!80769 lt!80748) lt!80744 lt!80768 (ite c!29474 lt!80743 lt!80747) (minValue!2903 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun b!153873 () Bool)

(assert (=> b!153873 (= e!100517 e!100519)))

(declare-fun update!238 (LongMapFixedSize!1242 (_ BitVec 64) V!3675) tuple2!2822)

(assert (=> b!153873 (= lt!80771 (update!238 newMap!16 lt!80744 lt!80768))))

(declare-fun c!29477 () Bool)

(declare-fun contains!967 (ListLongMap!1813 (_ BitVec 64)) Bool)

(assert (=> b!153873 (= c!29477 (contains!967 lt!80772 lt!80744))))

(declare-fun lt!80757 () Unit!4894)

(declare-fun e!100520 () Unit!4894)

(assert (=> b!153873 (= lt!80757 e!100520)))

(declare-fun c!29476 () Bool)

(assert (=> b!153873 (= c!29476 (_1!1422 lt!80771))))

(declare-fun b!153874 () Bool)

(declare-fun lt!80746 () tuple2!2822)

(declare-fun call!17106 () tuple2!2822)

(assert (=> b!153874 (= lt!80746 call!17106)))

(assert (=> b!153874 (= e!100523 (tuple2!2823 (_1!1422 lt!80746) (_2!1422 lt!80746)))))

(declare-fun bm!17103 () Bool)

(assert (=> bm!17103 (= call!17106 (repackFrom!19 thiss!992 (ite c!29478 (_2!1422 lt!80771) newMap!16) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!17104 () Bool)

(declare-fun call!17102 () ListLongMap!1813)

(assert (=> bm!17104 (= call!17107 (+!191 call!17102 (ite c!29474 (tuple2!2825 lt!80743 (minValue!2903 (v!3413 (underlying!523 thiss!992)))) (tuple2!2825 lt!80742 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun bm!17105 () Bool)

(assert (=> bm!17105 (= call!17112 (addCommutativeForDiffKeys!84 (ite c!29474 lt!80761 lt!80762) lt!80744 lt!80768 (ite c!29474 lt!80767 lt!80742) (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun call!17110 () ListLongMap!1813)

(declare-fun bm!17106 () Bool)

(assert (=> bm!17106 (= call!17110 (+!191 (ite c!29474 lt!80769 lt!80748) (ite c!29474 (tuple2!2825 lt!80743 (minValue!2903 (v!3413 (underlying!523 thiss!992)))) (tuple2!2825 lt!80744 lt!80768))))))

(declare-fun b!153875 () Bool)

(declare-fun e!100518 () Bool)

(assert (=> b!153875 (= e!100518 (ite (= lt!80744 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!17107 () Bool)

(assert (=> bm!17107 (= call!17102 (+!191 (ite c!29474 lt!80769 lt!80762) (tuple2!2825 lt!80744 lt!80768)))))

(declare-fun bm!17108 () Bool)

(assert (=> bm!17108 (= call!17111 (+!191 (ite c!29474 call!17109 call!17110) (ite c!29474 (tuple2!2825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))) (tuple2!2825 lt!80747 (minValue!2903 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun bm!17109 () Bool)

(assert (=> bm!17109 (= call!17104 (+!191 (ite c!29474 call!17110 call!17109) (ite c!29474 (tuple2!2825 lt!80744 lt!80768) (tuple2!2825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun b!153876 () Bool)

(assert (=> b!153876 (= e!100523 (tuple2!2823 true newMap!16))))

(declare-fun b!153877 () Bool)

(assert (=> b!153877 false))

(declare-fun lt!80766 () Unit!4894)

(declare-fun lt!80765 () Unit!4894)

(assert (=> b!153877 (= lt!80766 lt!80765)))

(declare-fun lt!80745 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!5091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!153877 (not (arrayContainsKey!0 (_keys!4833 (v!3413 (underlying!523 thiss!992))) lt!80744 lt!80745))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5091 (_ BitVec 32) (_ BitVec 64) List!1806) Unit!4894)

(assert (=> b!153877 (= lt!80765 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4833 (v!3413 (underlying!523 thiss!992))) lt!80745 lt!80744 (Cons!1802 lt!80744 Nil!1803)))))

(assert (=> b!153877 (= lt!80745 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!80760 () Unit!4894)

(declare-fun lt!80758 () Unit!4894)

(assert (=> b!153877 (= lt!80760 lt!80758)))

(assert (=> b!153877 (arrayNoDuplicates!0 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1803)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5091 (_ BitVec 32) (_ BitVec 32)) Unit!4894)

(assert (=> b!153877 (= lt!80758 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4833 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!80749 () Unit!4894)

(declare-fun lt!80751 () Unit!4894)

(assert (=> b!153877 (= lt!80749 lt!80751)))

(assert (=> b!153877 e!100518))

(declare-fun c!29473 () Bool)

(assert (=> b!153877 (= c!29473 (and (not (= lt!80744 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!80744 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!80741 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!162 (array!5091 array!5093 (_ BitVec 32) (_ BitVec 32) V!3675 V!3675 (_ BitVec 64) (_ BitVec 32) Int) Unit!4894)

(assert (=> b!153877 (= lt!80751 (lemmaListMapContainsThenArrayContainsFrom!162 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) lt!80744 lt!80741 (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(assert (=> b!153877 (= lt!80741 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!4896 () Unit!4894)

(assert (=> b!153877 (= e!100520 Unit!4896)))

(declare-fun b!153878 () Bool)

(declare-fun lt!80763 () tuple2!2822)

(assert (=> b!153878 (= e!100522 (tuple2!2823 (_1!1422 lt!80763) (_2!1422 lt!80763)))))

(assert (=> b!153878 (= lt!80761 call!17109)))

(assert (=> b!153878 (= lt!80767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80756 () Unit!4894)

(assert (=> b!153878 (= lt!80756 call!17112)))

(assert (=> b!153878 (= call!17113 call!17105)))

(declare-fun lt!80764 () Unit!4894)

(assert (=> b!153878 (= lt!80764 lt!80756)))

(assert (=> b!153878 (= lt!80769 call!17111)))

(assert (=> b!153878 (= lt!80743 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80759 () Unit!4894)

(assert (=> b!153878 (= lt!80759 call!17103)))

(assert (=> b!153878 (= call!17107 call!17104)))

(declare-fun lt!80755 () Unit!4894)

(assert (=> b!153878 (= lt!80755 lt!80759)))

(assert (=> b!153878 (= lt!80763 call!17106)))

(declare-fun b!153879 () Bool)

(declare-fun Unit!4897 () Unit!4894)

(assert (=> b!153879 (= e!100520 Unit!4897)))

(declare-fun b!153880 () Bool)

(declare-fun e!100521 () Bool)

(assert (=> b!153880 (= e!100524 e!100521)))

(declare-fun res!72695 () Bool)

(assert (=> b!153880 (=> (not res!72695) (not e!100521))))

(assert (=> b!153880 (= res!72695 (valid!612 (_2!1422 lt!80770)))))

(declare-fun b!153881 () Bool)

(assert (=> b!153881 (= e!100519 (tuple2!2823 false (_2!1422 lt!80771)))))

(declare-fun bm!17110 () Bool)

(assert (=> bm!17110 (= call!17114 (+!191 (ite c!29474 lt!80761 lt!80748) (ite c!29474 (tuple2!2825 lt!80767 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))) (tuple2!2825 lt!80747 (minValue!2903 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun bm!17111 () Bool)

(assert (=> bm!17111 (= call!17105 (+!191 (ite c!29474 call!17114 call!17108) (tuple2!2825 lt!80744 lt!80768)))))

(declare-fun b!153882 () Bool)

(assert (=> b!153882 (= e!100518 (arrayContainsKey!0 (_keys!4833 (v!3413 (underlying!523 thiss!992))) lt!80744 lt!80741))))

(declare-fun b!153883 () Bool)

(assert (=> b!153883 (= e!100521 (= (map!1499 (_2!1422 lt!80770)) (map!1499 (v!3413 (underlying!523 thiss!992)))))))

(assert (= (and d!50571 c!29478) b!153873))

(assert (= (and d!50571 (not c!29478)) b!153870))

(assert (= (and b!153873 c!29477) b!153877))

(assert (= (and b!153873 (not c!29477)) b!153879))

(assert (= (and b!153877 c!29473) b!153882))

(assert (= (and b!153877 (not c!29473)) b!153875))

(assert (= (and b!153873 c!29476) b!153872))

(assert (= (and b!153873 (not c!29476)) b!153881))

(assert (= (and b!153872 c!29474) b!153878))

(assert (= (and b!153872 (not c!29474)) b!153871))

(assert (= (or b!153878 b!153871) bm!17106))

(assert (= (or b!153878 b!153871) bm!17099))

(assert (= (or b!153878 b!153871) bm!17105))

(assert (= (or b!153878 b!153871) bm!17107))

(assert (= (or b!153878 b!153871) bm!17100))

(assert (= (or b!153878 b!153871) bm!17102))

(assert (= (or b!153878 b!153871) bm!17110))

(assert (= (or b!153878 b!153871) bm!17104))

(assert (= (or b!153878 b!153871) bm!17111))

(assert (= (or b!153878 b!153871) bm!17109))

(assert (= (or b!153878 b!153871) bm!17108))

(assert (= (or b!153878 b!153871) bm!17101))

(assert (= (and b!153870 c!29475) b!153874))

(assert (= (and b!153870 (not c!29475)) b!153876))

(assert (= (or b!153878 b!153874) bm!17103))

(assert (= (and d!50571 (not res!72696)) b!153880))

(assert (= (and b!153880 res!72695) b!153883))

(declare-fun b_lambda!6835 () Bool)

(assert (=> (not b_lambda!6835) (not d!50571)))

(declare-fun t!6597 () Bool)

(declare-fun tb!2753 () Bool)

(assert (=> (and b!153771 (= (defaultEntry!3060 (v!3413 (underlying!523 thiss!992))) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))) t!6597) tb!2753))

(declare-fun result!4481 () Bool)

(assert (=> tb!2753 (= result!4481 tp_is_empty!3021)))

(assert (=> d!50571 t!6597))

(declare-fun b_and!9579 () Bool)

(assert (= b_and!9571 (and (=> t!6597 result!4481) b_and!9579)))

(declare-fun tb!2755 () Bool)

(declare-fun t!6599 () Bool)

(assert (=> (and b!153768 (= (defaultEntry!3060 newMap!16) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))) t!6599) tb!2755))

(declare-fun result!4485 () Bool)

(assert (= result!4485 result!4481))

(assert (=> d!50571 t!6599))

(declare-fun b_and!9581 () Bool)

(assert (= b_and!9573 (and (=> t!6599 result!4485) b_and!9581)))

(declare-fun m!187637 () Bool)

(assert (=> b!153882 m!187637))

(declare-fun m!187639 () Bool)

(assert (=> bm!17107 m!187639))

(declare-fun m!187641 () Bool)

(assert (=> bm!17103 m!187641))

(declare-fun m!187643 () Bool)

(assert (=> bm!17102 m!187643))

(declare-fun m!187645 () Bool)

(assert (=> b!153883 m!187645))

(assert (=> b!153883 m!187579))

(declare-fun m!187647 () Bool)

(assert (=> bm!17111 m!187647))

(declare-fun m!187649 () Bool)

(assert (=> bm!17106 m!187649))

(declare-fun m!187651 () Bool)

(assert (=> b!153880 m!187651))

(declare-fun m!187653 () Bool)

(assert (=> bm!17105 m!187653))

(declare-fun m!187655 () Bool)

(assert (=> bm!17109 m!187655))

(declare-fun m!187657 () Bool)

(assert (=> bm!17108 m!187657))

(declare-fun m!187659 () Bool)

(assert (=> b!153877 m!187659))

(declare-fun m!187661 () Bool)

(assert (=> b!153877 m!187661))

(declare-fun m!187663 () Bool)

(assert (=> b!153877 m!187663))

(declare-fun m!187665 () Bool)

(assert (=> b!153877 m!187665))

(declare-fun m!187667 () Bool)

(assert (=> b!153877 m!187667))

(declare-fun m!187669 () Bool)

(assert (=> bm!17104 m!187669))

(declare-fun m!187671 () Bool)

(assert (=> bm!17100 m!187671))

(declare-fun m!187673 () Bool)

(assert (=> bm!17099 m!187673))

(declare-fun m!187675 () Bool)

(assert (=> bm!17101 m!187675))

(declare-fun m!187677 () Bool)

(assert (=> bm!17110 m!187677))

(assert (=> d!50571 m!187567))

(assert (=> d!50571 m!187557))

(declare-fun m!187679 () Bool)

(assert (=> d!50571 m!187679))

(declare-fun m!187681 () Bool)

(assert (=> d!50571 m!187681))

(declare-fun m!187683 () Bool)

(assert (=> d!50571 m!187683))

(assert (=> d!50571 m!187683))

(assert (=> d!50571 m!187679))

(declare-fun m!187685 () Bool)

(assert (=> d!50571 m!187685))

(declare-fun m!187687 () Bool)

(assert (=> b!153873 m!187687))

(declare-fun m!187689 () Bool)

(assert (=> b!153873 m!187689))

(assert (=> b!153775 d!50571))

(declare-fun b!153928 () Bool)

(declare-fun e!100552 () Unit!4894)

(declare-fun lt!80838 () Unit!4894)

(assert (=> b!153928 (= e!100552 lt!80838)))

(declare-fun lt!80833 () ListLongMap!1813)

(assert (=> b!153928 (= lt!80833 (getCurrentListMapNoExtraKeys!160 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun lt!80837 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80831 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80831 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80817 () Unit!4894)

(declare-fun addStillContains!103 (ListLongMap!1813 (_ BitVec 64) V!3675 (_ BitVec 64)) Unit!4894)

(assert (=> b!153928 (= lt!80817 (addStillContains!103 lt!80833 lt!80837 (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) lt!80831))))

(assert (=> b!153928 (contains!967 (+!191 lt!80833 (tuple2!2825 lt!80837 (zeroValue!2903 (v!3413 (underlying!523 thiss!992))))) lt!80831)))

(declare-fun lt!80829 () Unit!4894)

(assert (=> b!153928 (= lt!80829 lt!80817)))

(declare-fun lt!80825 () ListLongMap!1813)

(assert (=> b!153928 (= lt!80825 (getCurrentListMapNoExtraKeys!160 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun lt!80834 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80834 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80828 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80828 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80819 () Unit!4894)

(declare-fun addApplyDifferent!103 (ListLongMap!1813 (_ BitVec 64) V!3675 (_ BitVec 64)) Unit!4894)

(assert (=> b!153928 (= lt!80819 (addApplyDifferent!103 lt!80825 lt!80834 (minValue!2903 (v!3413 (underlying!523 thiss!992))) lt!80828))))

(declare-fun apply!127 (ListLongMap!1813 (_ BitVec 64)) V!3675)

(assert (=> b!153928 (= (apply!127 (+!191 lt!80825 (tuple2!2825 lt!80834 (minValue!2903 (v!3413 (underlying!523 thiss!992))))) lt!80828) (apply!127 lt!80825 lt!80828))))

(declare-fun lt!80823 () Unit!4894)

(assert (=> b!153928 (= lt!80823 lt!80819)))

(declare-fun lt!80820 () ListLongMap!1813)

(assert (=> b!153928 (= lt!80820 (getCurrentListMapNoExtraKeys!160 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun lt!80826 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80836 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80836 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!80832 () Unit!4894)

(assert (=> b!153928 (= lt!80832 (addApplyDifferent!103 lt!80820 lt!80826 (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) lt!80836))))

(assert (=> b!153928 (= (apply!127 (+!191 lt!80820 (tuple2!2825 lt!80826 (zeroValue!2903 (v!3413 (underlying!523 thiss!992))))) lt!80836) (apply!127 lt!80820 lt!80836))))

(declare-fun lt!80821 () Unit!4894)

(assert (=> b!153928 (= lt!80821 lt!80832)))

(declare-fun lt!80835 () ListLongMap!1813)

(assert (=> b!153928 (= lt!80835 (getCurrentListMapNoExtraKeys!160 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun lt!80822 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80822 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80827 () (_ BitVec 64))

(assert (=> b!153928 (= lt!80827 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!153928 (= lt!80838 (addApplyDifferent!103 lt!80835 lt!80822 (minValue!2903 (v!3413 (underlying!523 thiss!992))) lt!80827))))

(assert (=> b!153928 (= (apply!127 (+!191 lt!80835 (tuple2!2825 lt!80822 (minValue!2903 (v!3413 (underlying!523 thiss!992))))) lt!80827) (apply!127 lt!80835 lt!80827))))

(declare-fun b!153929 () Bool)

(declare-fun e!100562 () Bool)

(declare-fun call!17129 () Bool)

(assert (=> b!153929 (= e!100562 (not call!17129))))

(declare-fun b!153930 () Bool)

(declare-fun e!100560 () ListLongMap!1813)

(declare-fun call!17132 () ListLongMap!1813)

(assert (=> b!153930 (= e!100560 (+!191 call!17132 (tuple2!2825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2903 (v!3413 (underlying!523 thiss!992))))))))

(declare-fun bm!17126 () Bool)

(declare-fun call!17134 () ListLongMap!1813)

(declare-fun call!17130 () ListLongMap!1813)

(assert (=> bm!17126 (= call!17134 call!17130)))

(declare-fun b!153931 () Bool)

(declare-fun res!72720 () Bool)

(declare-fun e!100555 () Bool)

(assert (=> b!153931 (=> (not res!72720) (not e!100555))))

(assert (=> b!153931 (= res!72720 e!100562)))

(declare-fun c!29491 () Bool)

(assert (=> b!153931 (= c!29491 (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!153932 () Bool)

(declare-fun e!100559 () ListLongMap!1813)

(declare-fun call!17135 () ListLongMap!1813)

(assert (=> b!153932 (= e!100559 call!17135)))

(declare-fun b!153933 () Bool)

(declare-fun c!29495 () Bool)

(assert (=> b!153933 (= c!29495 (and (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!100551 () ListLongMap!1813)

(assert (=> b!153933 (= e!100551 e!100559)))

(declare-fun bm!17127 () Bool)

(declare-fun call!17133 () ListLongMap!1813)

(assert (=> bm!17127 (= call!17133 call!17132)))

(declare-fun b!153934 () Bool)

(declare-fun e!100557 () Bool)

(assert (=> b!153934 (= e!100555 e!100557)))

(declare-fun c!29493 () Bool)

(assert (=> b!153934 (= c!29493 (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17128 () Bool)

(assert (=> bm!17128 (= call!17130 (getCurrentListMapNoExtraKeys!160 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun b!153935 () Bool)

(declare-fun e!100554 () Bool)

(assert (=> b!153935 (= e!100557 e!100554)))

(declare-fun res!72723 () Bool)

(declare-fun call!17131 () Bool)

(assert (=> b!153935 (= res!72723 call!17131)))

(assert (=> b!153935 (=> (not res!72723) (not e!100554))))

(declare-fun e!100556 () Bool)

(declare-fun b!153936 () Bool)

(declare-fun lt!80824 () ListLongMap!1813)

(assert (=> b!153936 (= e!100556 (= (apply!127 lt!80824 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1605 (select (arr!2406 (_values!3043 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!470 (defaultEntry!3060 (v!3413 (underlying!523 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!153936 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2683 (_values!3043 (v!3413 (underlying!523 thiss!992))))))))

(assert (=> b!153936 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992))))))))

(declare-fun b!153937 () Bool)

(declare-fun res!72722 () Bool)

(assert (=> b!153937 (=> (not res!72722) (not e!100555))))

(declare-fun e!100553 () Bool)

(assert (=> b!153937 (= res!72722 e!100553)))

(declare-fun res!72717 () Bool)

(assert (=> b!153937 (=> res!72717 e!100553)))

(declare-fun e!100558 () Bool)

(assert (=> b!153937 (= res!72717 (not e!100558))))

(declare-fun res!72721 () Bool)

(assert (=> b!153937 (=> (not res!72721) (not e!100558))))

(assert (=> b!153937 (= res!72721 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992))))))))

(declare-fun b!153938 () Bool)

(declare-fun e!100561 () Bool)

(assert (=> b!153938 (= e!100561 (= (apply!127 lt!80824 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun b!153939 () Bool)

(assert (=> b!153939 (= e!100559 call!17133)))

(declare-fun b!153940 () Bool)

(assert (=> b!153940 (= e!100553 e!100556)))

(declare-fun res!72719 () Bool)

(assert (=> b!153940 (=> (not res!72719) (not e!100556))))

(assert (=> b!153940 (= res!72719 (contains!967 lt!80824 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!153940 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992))))))))

(declare-fun b!153941 () Bool)

(assert (=> b!153941 (= e!100560 e!100551)))

(declare-fun c!29494 () Bool)

(assert (=> b!153941 (= c!29494 (and (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17130 () Bool)

(assert (=> bm!17130 (= call!17135 call!17134)))

(declare-fun b!153942 () Bool)

(assert (=> b!153942 (= e!100554 (= (apply!127 lt!80824 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2903 (v!3413 (underlying!523 thiss!992)))))))

(declare-fun b!153943 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!153943 (= e!100558 (validKeyInArray!0 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!153944 () Bool)

(declare-fun e!100563 () Bool)

(assert (=> b!153944 (= e!100563 (validKeyInArray!0 (select (arr!2405 (_keys!4833 (v!3413 (underlying!523 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!153945 () Bool)

(declare-fun Unit!4898 () Unit!4894)

(assert (=> b!153945 (= e!100552 Unit!4898)))

(declare-fun b!153946 () Bool)

(assert (=> b!153946 (= e!100551 call!17133)))

(declare-fun b!153947 () Bool)

(assert (=> b!153947 (= e!100557 (not call!17131))))

(declare-fun bm!17131 () Bool)

(assert (=> bm!17131 (= call!17131 (contains!967 lt!80824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17132 () Bool)

(assert (=> bm!17132 (= call!17129 (contains!967 lt!80824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!153948 () Bool)

(assert (=> b!153948 (= e!100562 e!100561)))

(declare-fun res!72718 () Bool)

(assert (=> b!153948 (= res!72718 call!17129)))

(assert (=> b!153948 (=> (not res!72718) (not e!100561))))

(declare-fun bm!17129 () Bool)

(declare-fun c!29496 () Bool)

(assert (=> bm!17129 (= call!17132 (+!191 (ite c!29496 call!17130 (ite c!29494 call!17134 call!17135)) (ite (or c!29496 c!29494) (tuple2!2825 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2903 (v!3413 (underlying!523 thiss!992)))) (tuple2!2825 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2903 (v!3413 (underlying!523 thiss!992)))))))))

(declare-fun d!50573 () Bool)

(assert (=> d!50573 e!100555))

(declare-fun res!72716 () Bool)

(assert (=> d!50573 (=> (not res!72716) (not e!100555))))

(assert (=> d!50573 (= res!72716 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992))))))))))

(declare-fun lt!80818 () ListLongMap!1813)

(assert (=> d!50573 (= lt!80824 lt!80818)))

(declare-fun lt!80830 () Unit!4894)

(assert (=> d!50573 (= lt!80830 e!100552)))

(declare-fun c!29492 () Bool)

(assert (=> d!50573 (= c!29492 e!100563)))

(declare-fun res!72715 () Bool)

(assert (=> d!50573 (=> (not res!72715) (not e!100563))))

(assert (=> d!50573 (= res!72715 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2682 (_keys!4833 (v!3413 (underlying!523 thiss!992))))))))

(assert (=> d!50573 (= lt!80818 e!100560)))

(assert (=> d!50573 (= c!29496 (and (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!50573 (validMask!0 (mask!7462 (v!3413 (underlying!523 thiss!992))))))

(assert (=> d!50573 (= (getCurrentListMap!587 (_keys!4833 (v!3413 (underlying!523 thiss!992))) (_values!3043 (v!3413 (underlying!523 thiss!992))) (mask!7462 (v!3413 (underlying!523 thiss!992))) (extraKeys!2801 (v!3413 (underlying!523 thiss!992))) (zeroValue!2903 (v!3413 (underlying!523 thiss!992))) (minValue!2903 (v!3413 (underlying!523 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992)))) lt!80824)))

(assert (= (and d!50573 c!29496) b!153930))

(assert (= (and d!50573 (not c!29496)) b!153941))

(assert (= (and b!153941 c!29494) b!153946))

(assert (= (and b!153941 (not c!29494)) b!153933))

(assert (= (and b!153933 c!29495) b!153939))

(assert (= (and b!153933 (not c!29495)) b!153932))

(assert (= (or b!153939 b!153932) bm!17130))

(assert (= (or b!153946 bm!17130) bm!17126))

(assert (= (or b!153946 b!153939) bm!17127))

(assert (= (or b!153930 bm!17126) bm!17128))

(assert (= (or b!153930 bm!17127) bm!17129))

(assert (= (and d!50573 res!72715) b!153944))

(assert (= (and d!50573 c!29492) b!153928))

(assert (= (and d!50573 (not c!29492)) b!153945))

(assert (= (and d!50573 res!72716) b!153937))

(assert (= (and b!153937 res!72721) b!153943))

(assert (= (and b!153937 (not res!72717)) b!153940))

(assert (= (and b!153940 res!72719) b!153936))

(assert (= (and b!153937 res!72722) b!153931))

(assert (= (and b!153931 c!29491) b!153948))

(assert (= (and b!153931 (not c!29491)) b!153929))

(assert (= (and b!153948 res!72718) b!153938))

(assert (= (or b!153948 b!153929) bm!17132))

(assert (= (and b!153931 res!72720) b!153934))

(assert (= (and b!153934 c!29493) b!153935))

(assert (= (and b!153934 (not c!29493)) b!153947))

(assert (= (and b!153935 res!72723) b!153942))

(assert (= (or b!153935 b!153947) bm!17131))

(declare-fun b_lambda!6837 () Bool)

(assert (=> (not b_lambda!6837) (not b!153936)))

(assert (=> b!153936 t!6597))

(declare-fun b_and!9583 () Bool)

(assert (= b_and!9579 (and (=> t!6597 result!4481) b_and!9583)))

(assert (=> b!153936 t!6599))

(declare-fun b_and!9585 () Bool)

(assert (= b_and!9581 (and (=> t!6599 result!4485) b_and!9585)))

(declare-fun m!187691 () Bool)

(assert (=> bm!17128 m!187691))

(declare-fun m!187693 () Bool)

(assert (=> b!153930 m!187693))

(declare-fun m!187695 () Bool)

(assert (=> b!153942 m!187695))

(declare-fun m!187697 () Bool)

(assert (=> b!153944 m!187697))

(assert (=> b!153944 m!187697))

(declare-fun m!187699 () Bool)

(assert (=> b!153944 m!187699))

(declare-fun m!187701 () Bool)

(assert (=> b!153938 m!187701))

(assert (=> b!153940 m!187697))

(assert (=> b!153940 m!187697))

(declare-fun m!187703 () Bool)

(assert (=> b!153940 m!187703))

(declare-fun m!187705 () Bool)

(assert (=> b!153928 m!187705))

(declare-fun m!187707 () Bool)

(assert (=> b!153928 m!187707))

(declare-fun m!187709 () Bool)

(assert (=> b!153928 m!187709))

(assert (=> b!153928 m!187705))

(assert (=> b!153928 m!187697))

(declare-fun m!187711 () Bool)

(assert (=> b!153928 m!187711))

(declare-fun m!187713 () Bool)

(assert (=> b!153928 m!187713))

(declare-fun m!187715 () Bool)

(assert (=> b!153928 m!187715))

(declare-fun m!187717 () Bool)

(assert (=> b!153928 m!187717))

(declare-fun m!187719 () Bool)

(assert (=> b!153928 m!187719))

(assert (=> b!153928 m!187691))

(declare-fun m!187721 () Bool)

(assert (=> b!153928 m!187721))

(declare-fun m!187723 () Bool)

(assert (=> b!153928 m!187723))

(declare-fun m!187725 () Bool)

(assert (=> b!153928 m!187725))

(assert (=> b!153928 m!187725))

(declare-fun m!187727 () Bool)

(assert (=> b!153928 m!187727))

(assert (=> b!153928 m!187721))

(declare-fun m!187729 () Bool)

(assert (=> b!153928 m!187729))

(assert (=> b!153928 m!187711))

(declare-fun m!187731 () Bool)

(assert (=> b!153928 m!187731))

(declare-fun m!187733 () Bool)

(assert (=> b!153928 m!187733))

(declare-fun m!187735 () Bool)

(assert (=> bm!17129 m!187735))

(declare-fun m!187737 () Bool)

(assert (=> d!50573 m!187737))

(declare-fun m!187739 () Bool)

(assert (=> bm!17131 m!187739))

(declare-fun m!187741 () Bool)

(assert (=> b!153936 m!187741))

(assert (=> b!153936 m!187741))

(assert (=> b!153936 m!187679))

(declare-fun m!187743 () Bool)

(assert (=> b!153936 m!187743))

(assert (=> b!153936 m!187697))

(assert (=> b!153936 m!187679))

(assert (=> b!153936 m!187697))

(declare-fun m!187745 () Bool)

(assert (=> b!153936 m!187745))

(declare-fun m!187747 () Bool)

(assert (=> bm!17132 m!187747))

(assert (=> b!153943 m!187697))

(assert (=> b!153943 m!187697))

(assert (=> b!153943 m!187699))

(assert (=> b!153767 d!50573))

(declare-fun d!50575 () Bool)

(assert (=> d!50575 (= (map!1499 newMap!16) (getCurrentListMap!587 (_keys!4833 newMap!16) (_values!3043 newMap!16) (mask!7462 newMap!16) (extraKeys!2801 newMap!16) (zeroValue!2903 newMap!16) (minValue!2903 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3060 newMap!16)))))

(declare-fun bs!6510 () Bool)

(assert (= bs!6510 d!50575))

(declare-fun m!187749 () Bool)

(assert (=> bs!6510 m!187749))

(assert (=> b!153767 d!50575))

(declare-fun b!153955 () Bool)

(declare-fun e!100568 () Bool)

(assert (=> b!153955 (= e!100568 tp_is_empty!3021)))

(declare-fun condMapEmpty!5159 () Bool)

(declare-fun mapDefault!5159 () ValueCell!1167)

(assert (=> mapNonEmpty!5149 (= condMapEmpty!5159 (= mapRest!5150 ((as const (Array (_ BitVec 32) ValueCell!1167)) mapDefault!5159)))))

(declare-fun e!100569 () Bool)

(declare-fun mapRes!5159 () Bool)

(assert (=> mapNonEmpty!5149 (= tp!12144 (and e!100569 mapRes!5159))))

(declare-fun b!153956 () Bool)

(assert (=> b!153956 (= e!100569 tp_is_empty!3021)))

(declare-fun mapNonEmpty!5159 () Bool)

(declare-fun tp!12161 () Bool)

(assert (=> mapNonEmpty!5159 (= mapRes!5159 (and tp!12161 e!100568))))

(declare-fun mapRest!5159 () (Array (_ BitVec 32) ValueCell!1167))

(declare-fun mapValue!5159 () ValueCell!1167)

(declare-fun mapKey!5159 () (_ BitVec 32))

(assert (=> mapNonEmpty!5159 (= mapRest!5150 (store mapRest!5159 mapKey!5159 mapValue!5159))))

(declare-fun mapIsEmpty!5159 () Bool)

(assert (=> mapIsEmpty!5159 mapRes!5159))

(assert (= (and mapNonEmpty!5149 condMapEmpty!5159) mapIsEmpty!5159))

(assert (= (and mapNonEmpty!5149 (not condMapEmpty!5159)) mapNonEmpty!5159))

(assert (= (and mapNonEmpty!5159 ((_ is ValueCellFull!1167) mapValue!5159)) b!153955))

(assert (= (and mapNonEmpty!5149 ((_ is ValueCellFull!1167) mapDefault!5159)) b!153956))

(declare-fun m!187751 () Bool)

(assert (=> mapNonEmpty!5159 m!187751))

(declare-fun b!153957 () Bool)

(declare-fun e!100570 () Bool)

(assert (=> b!153957 (= e!100570 tp_is_empty!3021)))

(declare-fun condMapEmpty!5160 () Bool)

(declare-fun mapDefault!5160 () ValueCell!1167)

(assert (=> mapNonEmpty!5150 (= condMapEmpty!5160 (= mapRest!5149 ((as const (Array (_ BitVec 32) ValueCell!1167)) mapDefault!5160)))))

(declare-fun e!100571 () Bool)

(declare-fun mapRes!5160 () Bool)

(assert (=> mapNonEmpty!5150 (= tp!12146 (and e!100571 mapRes!5160))))

(declare-fun b!153958 () Bool)

(assert (=> b!153958 (= e!100571 tp_is_empty!3021)))

(declare-fun mapNonEmpty!5160 () Bool)

(declare-fun tp!12162 () Bool)

(assert (=> mapNonEmpty!5160 (= mapRes!5160 (and tp!12162 e!100570))))

(declare-fun mapKey!5160 () (_ BitVec 32))

(declare-fun mapRest!5160 () (Array (_ BitVec 32) ValueCell!1167))

(declare-fun mapValue!5160 () ValueCell!1167)

(assert (=> mapNonEmpty!5160 (= mapRest!5149 (store mapRest!5160 mapKey!5160 mapValue!5160))))

(declare-fun mapIsEmpty!5160 () Bool)

(assert (=> mapIsEmpty!5160 mapRes!5160))

(assert (= (and mapNonEmpty!5150 condMapEmpty!5160) mapIsEmpty!5160))

(assert (= (and mapNonEmpty!5150 (not condMapEmpty!5160)) mapNonEmpty!5160))

(assert (= (and mapNonEmpty!5160 ((_ is ValueCellFull!1167) mapValue!5160)) b!153957))

(assert (= (and mapNonEmpty!5150 ((_ is ValueCellFull!1167) mapDefault!5160)) b!153958))

(declare-fun m!187753 () Bool)

(assert (=> mapNonEmpty!5160 m!187753))

(declare-fun b_lambda!6839 () Bool)

(assert (= b_lambda!6837 (or (and b!153771 b_free!3209) (and b!153768 b_free!3211 (= (defaultEntry!3060 newMap!16) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992))))) b_lambda!6839)))

(declare-fun b_lambda!6841 () Bool)

(assert (= b_lambda!6835 (or (and b!153771 b_free!3209) (and b!153768 b_free!3211 (= (defaultEntry!3060 newMap!16) (defaultEntry!3060 (v!3413 (underlying!523 thiss!992))))) b_lambda!6841)))

(check-sat (not bm!17131) (not b!153943) (not bm!17129) (not d!50571) (not b!153877) (not b!153928) (not bm!17104) (not bm!17107) (not bm!17102) (not b!153838) (not b!153942) (not bm!17103) (not bm!17111) (not d!50563) (not b!153880) (not b!153930) (not b!153840) (not b!153883) (not d!50561) b_and!9583 (not b_next!3209) (not d!50573) (not bm!17128) b_and!9585 (not d!50565) (not b_lambda!6841) (not d!50553) (not bm!17100) (not bm!17099) (not mapNonEmpty!5160) (not b!153936) tp_is_empty!3021 (not b!153944) (not bm!17108) (not mapNonEmpty!5159) (not bm!17109) (not b!153873) (not b!153940) (not b_lambda!6839) (not bm!17105) (not b!153837) (not bm!17101) (not b_next!3211) (not b!153839) (not b!153882) (not bm!17110) (not bm!17106) (not bm!17132) (not b!153841) (not b!153938) (not d!50575) (not d!50555) (not b!153836))
(check-sat b_and!9583 b_and!9585 (not b_next!3209) (not b_next!3211))
